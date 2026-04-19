//============================================================
//   hspmqtt.dll — Minimal MQTT 3.1.1 client plugin for HSP
//
//   純 C + Winsock で書いた最小 MQTT クライアント。外部ライブラリ
//   (paho.mqtt.c / mosquitto) 不要。サポートする範囲は控えめ:
//     - MQTT 3.1.1 over TCP (TLS 非対応)
//     - CONNECT / CONNACK
//     - PUBLISH (QoS 0 のみ、PUBACK 未対応)
//     - SUBSCRIBE / SUBACK (QoS 0 のみ)
//     - PINGREQ / PINGRESP (キープアライブ)
//     - DISCONNECT
//
//   サポート外:
//     - TLS (v2 で OpenSSL 静的リンク予定)
//     - QoS 1/2
//     - Retained message / LWT
//     - MQTT 5.0 (property フィールド)
//
//   API:
//     int  hspmqtt_open     (const char* host, int port, const char* client_id,
//                            int keepalive_sec)                  → handle
//     int  hspmqtt_publish  (int h, const char* topic, const char* payload)
//     int  hspmqtt_subscribe(int h, const char* topic)
//     int  hspmqtt_recv     (int h, char* topic_buf, int tb_len,
//                            char* payload_buf, int pb_len)       → bytes or 0
//     int  hspmqtt_close    (int h)
//============================================================

#define WIN32_LEAN_AND_MEAN
#include <winsock2.h>
#include <windows.h>
#include <ws2tcpip.h>
#include <string>
#include <vector>
#include <array>
#include <cstdint>
#include <cstring>
#include <chrono>

#pragma comment(lib, "ws2_32.lib")

#define HSPMQTT_EXPORT extern "C" __declspec(dllexport)

namespace {

// ------------------------------------------------------------
// MQTT 3.1.1 packet types
// ------------------------------------------------------------
constexpr uint8_t kCONNECT     = 0x10;
constexpr uint8_t kCONNACK     = 0x20;
constexpr uint8_t kPUBLISH     = 0x30;
constexpr uint8_t kSUBSCRIBE   = 0x82;
constexpr uint8_t kSUBACK      = 0x90;
constexpr uint8_t kPINGREQ     = 0xC0;
constexpr uint8_t kPINGRESP    = 0xD0;
constexpr uint8_t kDISCONNECT  = 0xE0;

struct Session {
    bool   used = false;
    SOCKET sock = INVALID_SOCKET;
    int    keepalive = 60;
    std::chrono::steady_clock::time_point last_send;
    std::vector<uint8_t> rxbuf;
    uint16_t next_packet_id = 1;
};

constexpr int kMaxSessions = 8;
std::array<Session, kMaxSessions> g_sessions;
bool g_wsa_init = false;

void EnsureWsa() {
    if (g_wsa_init) return;
    WSADATA w; WSAStartup(MAKEWORD(2, 2), &w);
    g_wsa_init = true;
}

int AllocSession() {
    for (int i = 0; i < kMaxSessions; ++i) {
        if (!g_sessions[i].used) return i;
    }
    return -1;
}

void FreeSession(int h) {
    if (h < 0 || h >= kMaxSessions) return;
    Session& s = g_sessions[h];
    if (s.sock != INVALID_SOCKET) { closesocket(s.sock); s.sock = INVALID_SOCKET; }
    s.used = false;
    s.rxbuf.clear();
}

Session* GetSession(int h) {
    if (h < 0 || h >= kMaxSessions) return nullptr;
    if (!g_sessions[h].used) return nullptr;
    return &g_sessions[h];
}

// ------------------------------------------------------------
// Variable-length Remaining Length codec (MQTT 3.1.1 §2.2.3)
// ------------------------------------------------------------
void EncodeRemaining(std::vector<uint8_t>& out, uint32_t n) {
    do {
        uint8_t b = n & 0x7F;
        n >>= 7;
        if (n) b |= 0x80;
        out.push_back(b);
    } while (n);
}

// Try decode remaining length from buf[offset..], returns bytes consumed (1-4)
// or 0 if incomplete.
int DecodeRemaining(const uint8_t* buf, int buf_len, int offset, uint32_t* out_len) {
    uint32_t mul = 1, val = 0;
    int pos = offset;
    for (int i = 0; i < 4; ++i) {
        if (pos >= buf_len) return 0;
        uint8_t b = buf[pos++];
        val += (uint32_t)(b & 0x7F) * mul;
        mul <<= 7;
        if (!(b & 0x80)) {
            *out_len = val;
            return pos - offset;
        }
    }
    *out_len = 0;
    return -1; // malformed
}

void AppendString(std::vector<uint8_t>& out, const char* s) {
    size_t n = s ? strlen(s) : 0;
    if (n > 0xFFFF) n = 0xFFFF;
    out.push_back((uint8_t)((n >> 8) & 0xFF));
    out.push_back((uint8_t)(n & 0xFF));
    out.insert(out.end(), (const uint8_t*)s, (const uint8_t*)s + n);
}

bool SendAll(SOCKET s, const uint8_t* buf, int len) {
    while (len > 0) {
        int n = send(s, (const char*)buf, len, 0);
        if (n <= 0) return false;
        buf += n;
        len -= n;
    }
    return true;
}

void TouchSend(Session& s) {
    s.last_send = std::chrono::steady_clock::now();
}

// CONNECT packet (clean session, no user/pass/will)
bool SendConnect(Session& s, const char* client_id, int keepalive) {
    std::vector<uint8_t> var;
    AppendString(var, "MQTT");
    var.push_back(0x04);                     // protocol level 4 (3.1.1)
    var.push_back(0x02);                     // connect flags: clean session
    var.push_back((uint8_t)((keepalive >> 8) & 0xFF));
    var.push_back((uint8_t)(keepalive & 0xFF));
    AppendString(var, client_id ? client_id : "");

    std::vector<uint8_t> pkt;
    pkt.push_back(kCONNECT);
    EncodeRemaining(pkt, (uint32_t)var.size());
    pkt.insert(pkt.end(), var.begin(), var.end());

    if (!SendAll(s.sock, pkt.data(), (int)pkt.size())) return false;
    TouchSend(s);
    return true;
}

// Blocking recv up to expected bytes within short timeout. Returns bytes read.
int RecvTimed(SOCKET s, uint8_t* buf, int want, int timeout_ms) {
    timeval tv;
    tv.tv_sec  = timeout_ms / 1000;
    tv.tv_usec = (timeout_ms % 1000) * 1000;
    fd_set rd; FD_ZERO(&rd); FD_SET(s, &rd);
    int r = select(0, &rd, nullptr, nullptr, &tv);
    if (r <= 0) return 0;
    return recv(s, (char*)buf, want, 0);
}

bool WaitConnAck(Session& s) {
    uint8_t hdr[2];
    int n = RecvTimed(s.sock, hdr, 2, 3000);
    if (n < 2) return false;
    if ((hdr[0] & 0xF0) != kCONNACK || hdr[1] != 2) return false;
    uint8_t ack[2];
    n = RecvTimed(s.sock, ack, 2, 3000);
    if (n < 2) return false;
    return ack[1] == 0; // return code 0 = accepted
}

} // namespace

// ============================================================
// Exports
// ============================================================
HSPMQTT_EXPORT int __stdcall hspmqtt_open(const char* host, int port,
    const char* client_id, int keepalive_sec)
{
    EnsureWsa();
    int h = AllocSession();
    if (h < 0) return -1;
    Session& s = g_sessions[h];
    s.used = true;
    s.sock = INVALID_SOCKET;
    s.keepalive = keepalive_sec > 0 ? keepalive_sec : 60;

    addrinfo hints = {};
    hints.ai_family   = AF_INET;
    hints.ai_socktype = SOCK_STREAM;
    hints.ai_protocol = IPPROTO_TCP;
    char port_s[16];
    sprintf_s(port_s, "%d", port > 0 ? port : 1883);

    addrinfo* result = nullptr;
    if (getaddrinfo(host ? host : "127.0.0.1", port_s, &hints, &result) != 0 || !result) {
        FreeSession(h);
        return -2;
    }

    s.sock = socket(result->ai_family, result->ai_socktype, result->ai_protocol);
    if (s.sock == INVALID_SOCKET) { freeaddrinfo(result); FreeSession(h); return -3; }

    // 2 秒 connect タイムアウト (非ブロッキング → select → 戻す)
    unsigned long nonblock = 1;
    ioctlsocket(s.sock, FIONBIO, &nonblock);
    connect(s.sock, result->ai_addr, (int)result->ai_addrlen);
    freeaddrinfo(result);

    fd_set wr; FD_ZERO(&wr); FD_SET(s.sock, &wr);
    timeval tv; tv.tv_sec = 2; tv.tv_usec = 0;
    if (select(0, nullptr, &wr, nullptr, &tv) <= 0) { FreeSession(h); return -4; }

    nonblock = 0;
    ioctlsocket(s.sock, FIONBIO, &nonblock);

    if (!SendConnect(s, client_id, s.keepalive)) { FreeSession(h); return -5; }
    if (!WaitConnAck(s)) { FreeSession(h); return -6; }

    TouchSend(s);
    return h;
}

HSPMQTT_EXPORT int __stdcall hspmqtt_publish(int h, const char* topic, const char* payload)
{
    Session* s = GetSession(h);
    if (!s || !topic) return -1;
    size_t plen = payload ? strlen(payload) : 0;

    std::vector<uint8_t> var;
    AppendString(var, topic);
    // QoS 0: no packet identifier
    if (plen > 0) {
        var.insert(var.end(), (const uint8_t*)payload, (const uint8_t*)payload + plen);
    }

    std::vector<uint8_t> pkt;
    pkt.push_back(kPUBLISH);
    EncodeRemaining(pkt, (uint32_t)var.size());
    pkt.insert(pkt.end(), var.begin(), var.end());

    if (!SendAll(s->sock, pkt.data(), (int)pkt.size())) return -2;
    TouchSend(*s);
    return 0;
}

HSPMQTT_EXPORT int __stdcall hspmqtt_subscribe(int h, const char* topic)
{
    Session* s = GetSession(h);
    if (!s || !topic) return -1;

    uint16_t pid = s->next_packet_id++;
    std::vector<uint8_t> var;
    var.push_back((uint8_t)((pid >> 8) & 0xFF));
    var.push_back((uint8_t)(pid & 0xFF));
    AppendString(var, topic);
    var.push_back(0x00); // QoS 0

    std::vector<uint8_t> pkt;
    pkt.push_back(kSUBSCRIBE);
    EncodeRemaining(pkt, (uint32_t)var.size());
    pkt.insert(pkt.end(), var.begin(), var.end());

    if (!SendAll(s->sock, pkt.data(), (int)pkt.size())) return -2;
    TouchSend(*s);
    return 0;
}

// non-blocking recv. PUBLISH available -> copy topic/payload, return bytes.
// Nothing -> 0. Socket error -> negative.
HSPMQTT_EXPORT int __stdcall hspmqtt_recv(int h,
    char* topic_buf, int topic_buf_len, char* payload_buf, int payload_buf_len)
{
    if (topic_buf && topic_buf_len > 0)   topic_buf[0] = 0;
    if (payload_buf && payload_buf_len > 0) payload_buf[0] = 0;

    Session* s = GetSession(h);
    if (!s) return -1;

    // keepalive: 半分の時間を過ぎたら PINGREQ
    auto now = std::chrono::steady_clock::now();
    auto sec = std::chrono::duration_cast<std::chrono::seconds>(now - s->last_send).count();
    if (sec > s->keepalive / 2 && s->keepalive > 0) {
        uint8_t ping[2] = { kPINGREQ, 0 };
        SendAll(s->sock, ping, 2);
        TouchSend(*s);
    }

    // 非ブロッキング read: 1 バイトだけ覗く
    uint8_t peek;
    timeval tv; tv.tv_sec = 0; tv.tv_usec = 0;
    fd_set rd; FD_ZERO(&rd); FD_SET(s->sock, &rd);
    if (select(0, &rd, nullptr, nullptr, &tv) <= 0) return 0;

    if (recv(s->sock, (char*)&peek, 1, MSG_PEEK) <= 0) return -2;

    // 1 パケット読む
    uint8_t hdr[5];
    int got = RecvTimed(s->sock, hdr, 2, 200);
    if (got < 2) return 0;

    uint8_t ptype = hdr[0] & 0xF0;
    // remaining length decode (可変長)
    uint32_t rem = 0;
    int consumed = 1; // hdr[1] already has first byte
    uint32_t mul = 1;
    uint8_t rl = hdr[1];
    rem = (rl & 0x7F) * mul;
    mul <<= 7;
    while (rl & 0x80) {
        uint8_t more;
        if (RecvTimed(s->sock, &more, 1, 200) < 1) return 0;
        rem += (more & 0x7F) * mul;
        mul <<= 7;
        rl = more;
        if (++consumed >= 4) break;
    }

    std::vector<uint8_t> body(rem);
    if (rem > 0) {
        int total = 0;
        while (total < (int)rem) {
            int n = RecvTimed(s->sock, body.data() + total, (int)rem - total, 500);
            if (n <= 0) return 0;
            total += n;
        }
    }

    if (ptype == kPUBLISH) {
        if (rem < 2) return 0;
        uint16_t tlen = (uint16_t)((body[0] << 8) | body[1]);
        if (tlen + 2 > (int)rem) return 0;
        int tcopy = tlen < (topic_buf_len - 1) ? tlen : (topic_buf_len - 1);
        if (tcopy > 0 && topic_buf) { memcpy(topic_buf, body.data() + 2, tcopy); topic_buf[tcopy] = 0; }
        int poff = 2 + tlen;
        // QoS 1/2 の packet ID は現在スキップしない (QoS 0 subscribe のみサポート)
        int plen = (int)rem - poff;
        int pcopy = plen < (payload_buf_len - 1) ? plen : (payload_buf_len - 1);
        if (pcopy > 0 && payload_buf) { memcpy(payload_buf, body.data() + poff, pcopy); payload_buf[pcopy] = 0; }
        return pcopy > 0 ? pcopy : 1; // 0 返すと「何もなかった」と区別がつかないので payload 空でも 1
    }
    // PINGRESP / SUBACK などは黙って受信済にする
    return 0;
}

HSPMQTT_EXPORT int __stdcall hspmqtt_close(int h)
{
    Session* s = GetSession(h);
    if (!s) return -1;
    uint8_t pkt[2] = { kDISCONNECT, 0 };
    SendAll(s->sock, pkt, 2);
    FreeSession(h);
    return 0;
}

BOOL WINAPI DllMain(HINSTANCE, DWORD reason, LPVOID)
{
    if (reason == DLL_PROCESS_DETACH) {
        for (int i = 0; i < kMaxSessions; ++i)
            if (g_sessions[i].used) FreeSession(i);
        if (g_wsa_init) { WSACleanup(); g_wsa_init = false; }
    }
    return TRUE;
}
