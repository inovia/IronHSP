//============================================================
//   hspwebsrv.dll — HTTP / HTTPS / WebSocket server via HTTP.sys
//
//   Windows HTTP Server API v2 (httpapi.dll, kernel-mode HTTP.sys
//   driver) をラップした本格 HTTP サーバ helper。C# HttpListener と
//   同じ backend。HTTPS / WebSocket も単一 DLL で扱える。
//
//   特徴:
//     - HTTP.sys backend (kernel-mode、高性能、C# HttpListener と同じ)
//     - HTTPS 対応 (事前に netsh http add sslcert で証明書バインド必要)
//     - WebSocket 対応 (Sec-WebSocket-Key SHA-1 handshake + 自前フレーム parser)
//     - http://localhost:port/ は admin 権限不要
//     - http://+:port/ 等は admin 必要 (netsh http add urlacl)
//
//   URL 例:
//     http://localhost:8080/
//     http://+:8080/              ← 要 admin + urlacl
//     https://localhost:8443/     ← 要 netsh http add sslcert で証明書バインド
//
//   HTTPS 証明書バインドの例 (一度だけ、admin で実行):
//     netsh http add sslcert ipport=0.0.0.0:8443 certhash=<thumbprint> \
//           appid={12345678-1234-1234-1234-123456789ABC}
//
//   エクスポート:
//     int  websrv_open(int port)          → http://localhost:port/
//     int  websrv_open_url(const char* url)
//     int  websrv_accept(int handle, char* method, int ml, char* path, int pl,
//                        char* body, int bl, int* out_is_ws, int timeout_ms) → 1/0/-1
//     int  websrv_respond(int handle, int status, const char* ctype,
//                         const char* body, int body_len)
//     int  websrv_accept_ws(int handle) → ws_handle
//     int  websrv_ws_send(int ws, const char* data, int len, int is_binary)
//     int  websrv_ws_recv(int ws, char* buf, int max, int timeout_ms)
//     void websrv_ws_close(int ws)
//     void websrv_close(int handle)
//============================================================

#define WIN32_LEAN_AND_MEAN
#define _WIN32_WINNT 0x0601   // Windows 7 以降 (HTTP.sys v2)
#include <windows.h>
#include <http.h>
#include <wincrypt.h>
#include <cstring>
#include <cstdlib>
#include <cstdio>
#include <string>
#include <vector>

#pragma comment(lib, "httpapi.lib")
#pragma comment(lib, "crypt32.lib")
#pragma comment(lib, "kernel32.lib")
#pragma comment(lib, "user32.lib")
#pragma comment(lib, "advapi32.lib")

#define HSPWEBSRV_EXPORT extern "C" __declspec(dllexport)

namespace {

constexpr int MAX_SERVERS = 8;
constexpr int MAX_WS      = 32;
constexpr size_t REQ_BUF  = 8192;

struct ServerState {
    bool active = false;
    HANDLE queue = NULL;
    HTTP_SERVER_SESSION_ID sessionId = 0;
    HTTP_URL_GROUP_ID urlGroupId = 0;
    std::wstring url;

    HTTP_REQUEST_ID pending_req_id = HTTP_NULL_ID;
    std::vector<BYTE> req_buf;
    bool pending_is_ws = false;
    std::string last_ws_key;

    OVERLAPPED ovl = {};
    HANDLE ovl_event = NULL;
};

struct WsState {
    bool active = false;
    int server_handle = -1;
    HTTP_REQUEST_ID req_id = HTTP_NULL_ID;
    HANDLE queue = NULL;
    std::vector<BYTE> recv_accum;
    bool closed = false;
};

static ServerState g_servers[MAX_SERVERS];
static WsState     g_ws[MAX_WS];
static bool g_http_initialized = false;

int FindFreeServer() {
    for (int i = 0; i < MAX_SERVERS; i++) if (!g_servers[i].active) return i;
    return -1;
}
int FindFreeWs() {
    for (int i = 0; i < MAX_WS; i++) if (!g_ws[i].active) return i;
    return -1;
}

static void EnsureHttpInit() {
    if (g_http_initialized) return;
    HTTPAPI_VERSION ver = HTTPAPI_VERSION_2;
    HttpInitialize(ver, HTTP_INITIALIZE_SERVER, NULL);
    g_http_initialized = true;
}

static std::wstring AnsiToWide(const char* s) {
    if (!s) return L"";
    int wlen = MultiByteToWideChar(CP_ACP, 0, s, -1, NULL, 0);
    std::vector<wchar_t> buf(wlen);
    MultiByteToWideChar(CP_ACP, 0, s, -1, buf.data(), wlen);
    return std::wstring(buf.data());
}

static int CopyStr(char* dst, int dstlen, const char* src, int srclen) {
    if (!dst || dstlen <= 0) return 0;
    if (srclen < 0 && src) srclen = (int)strlen(src);
    if (srclen < 0) srclen = 0;
    int n = srclen;
    if (n >= dstlen) n = dstlen - 1;
    if (n > 0 && src) memcpy(dst, src, n);
    dst[n] = 0;
    return n;
}

static const char* VerbToString(HTTP_VERB verb) {
    switch (verb) {
        case HttpVerbGET:     return "GET";
        case HttpVerbPOST:    return "POST";
        case HttpVerbPUT:     return "PUT";
        case HttpVerbDELETE:  return "DELETE";
        case HttpVerbHEAD:    return "HEAD";
        case HttpVerbOPTIONS: return "OPTIONS";
        case HttpVerbTRACE:   return "TRACE";
        default: return "";
    }
}

static std::string Base64Encode(const BYTE* data, DWORD len) {
    DWORD outLen = 0;
    CryptBinaryToStringA(data, len, CRYPT_STRING_BASE64 | CRYPT_STRING_NOCRLF, NULL, &outLen);
    if (outLen == 0) return "";
    std::string out(outLen, 0);
    CryptBinaryToStringA(data, len, CRYPT_STRING_BASE64 | CRYPT_STRING_NOCRLF, &out[0], &outLen);
    while (!out.empty() && (out.back() == 0 || out.back() == '\r' || out.back() == '\n'))
        out.pop_back();
    return out;
}

static std::string ComputeWsAccept(const std::string& key) {
    const char* magic = "258EAFA5-E914-47DA-95CA-C5AB0DC85B11";
    std::string combined = key + magic;

    HCRYPTPROV hProv = 0;
    HCRYPTHASH hHash = 0;
    BYTE hash[20] = {};
    DWORD hashLen = 20;

    if (!CryptAcquireContextA(&hProv, NULL, NULL, PROV_RSA_FULL, CRYPT_VERIFYCONTEXT)) return "";
    if (!CryptCreateHash(hProv, CALG_SHA1, 0, 0, &hHash)) {
        CryptReleaseContext(hProv, 0);
        return "";
    }
    CryptHashData(hHash, (const BYTE*)combined.data(), (DWORD)combined.size(), 0);
    CryptGetHashParam(hHash, HP_HASHVAL, hash, &hashLen, 0);
    CryptDestroyHash(hHash);
    CryptReleaseContext(hProv, 0);

    return Base64Encode(hash, 20);
}

static std::string GetHeader(const HTTP_REQUEST* req, const char* name) {
    if (!req || !name) return "";
    for (USHORT i = 0; i < req->Headers.UnknownHeaderCount; i++) {
        const HTTP_UNKNOWN_HEADER& h = req->Headers.pUnknownHeaders[i];
        if (h.NameLength && h.pName) {
            std::string hn(h.pName, h.NameLength);
            if (_stricmp(hn.c_str(), name) == 0) {
                if (h.pRawValue && h.RawValueLength)
                    return std::string(h.pRawValue, h.RawValueLength);
                return "";
            }
        }
    }
    if (_stricmp(name, "Upgrade") == 0) {
        const HTTP_KNOWN_HEADER& h = req->Headers.KnownHeaders[HttpHeaderUpgrade];
        if (h.pRawValue && h.RawValueLength)
            return std::string(h.pRawValue, h.RawValueLength);
    }
    if (_stricmp(name, "Connection") == 0) {
        const HTTP_KNOWN_HEADER& h = req->Headers.KnownHeaders[HttpHeaderConnection];
        if (h.pRawValue && h.RawValueLength)
            return std::string(h.pRawValue, h.RawValueLength);
    }
    return "";
}

static bool ContainsCI(const std::string& s, const char* what) {
    if (s.empty() || !what) return false;
    size_t wlen = strlen(what);
    if (wlen == 0) return true;
    for (size_t i = 0; i + wlen <= s.size(); i++) {
        if (_strnicmp(s.c_str() + i, what, wlen) == 0) return true;
    }
    return false;
}

static bool SendOpaque(HANDLE queue, HTTP_REQUEST_ID req_id, const void* data, ULONG len, bool more) {
    HTTP_DATA_CHUNK chunk = {};
    chunk.DataChunkType = HttpDataChunkFromMemory;
    chunk.FromMemory.pBuffer = (PVOID)data;
    chunk.FromMemory.BufferLength = len;

    ULONG sent = 0;
    ULONG flags = HTTP_SEND_RESPONSE_FLAG_OPAQUE | HTTP_SEND_RESPONSE_FLAG_BUFFER_DATA;
    if (more) flags |= HTTP_SEND_RESPONSE_FLAG_MORE_DATA;

    ULONG rc = HttpSendResponseEntityBody(
        queue, req_id, flags, 1, &chunk, &sent, NULL, 0, NULL, NULL);
    return rc == NO_ERROR;
}

static int RecvOpaque(HANDLE queue, HTTP_REQUEST_ID req_id, BYTE* buf, ULONG max, ULONG timeout_ms) {
    OVERLAPPED ovl = {};
    ovl.hEvent = CreateEventW(NULL, TRUE, FALSE, NULL);
    ULONG read = 0;
    ULONG rc = HttpReceiveRequestEntityBody(queue, req_id, 0, buf, max, &read, &ovl);

    if (rc == ERROR_IO_PENDING) {
        DWORD w = WaitForSingleObject(ovl.hEvent, timeout_ms);
        if (w != WAIT_OBJECT_0) {
            CancelIoEx(queue, &ovl);
            CloseHandle(ovl.hEvent);
            return 0;
        }
        DWORD dwBytes = 0;
        GetOverlappedResult(queue, &ovl, &dwBytes, FALSE);
        read = dwBytes;
        rc = NO_ERROR;
    }
    CloseHandle(ovl.hEvent);

    if (rc == ERROR_HANDLE_EOF) return -1;
    if (rc != NO_ERROR) return -1;
    return (int)read;
}

static void EncodeWsFrame(std::vector<BYTE>& out, const BYTE* payload, size_t len, BYTE opcode) {
    out.clear();
    out.push_back(0x80 | (opcode & 0x0F));
    if (len < 126) {
        out.push_back((BYTE)len);
    } else if (len < 0x10000) {
        out.push_back(126);
        out.push_back((BYTE)(len >> 8));
        out.push_back((BYTE)(len & 0xFF));
    } else {
        out.push_back(127);
        uint64_t l = len;
        for (int i = 7; i >= 0; i--) out.push_back((BYTE)(l >> (i * 8)));
    }
    out.insert(out.end(), payload, payload + len);
}

struct WsDecoded {
    int status;
    size_t frame_size;
    std::vector<BYTE> payload;
    BYTE opcode;
};

static WsDecoded DecodeWsFrame(const BYTE* buf, size_t len) {
    WsDecoded d = {};
    if (len < 2) { d.status = 0; return d; }

    BYTE b0 = buf[0];
    BYTE b1 = buf[1];
    BYTE opcode = b0 & 0x0F;
    BYTE masked = (b1 & 0x80) ? 1 : 0;
    uint64_t payload_len = b1 & 0x7F;
    size_t hdr = 2;

    if (payload_len == 126) {
        if (len < hdr + 2) { d.status = 0; return d; }
        payload_len = ((uint64_t)buf[hdr] << 8) | buf[hdr + 1];
        hdr += 2;
    } else if (payload_len == 127) {
        if (len < hdr + 8) { d.status = 0; return d; }
        payload_len = 0;
        for (int i = 0; i < 8; i++) payload_len = (payload_len << 8) | buf[hdr + i];
        hdr += 8;
    }
    BYTE mask_key[4] = {};
    if (masked) {
        if (len < hdr + 4) { d.status = 0; return d; }
        memcpy(mask_key, buf + hdr, 4);
        hdr += 4;
    }
    if (len < hdr + payload_len) { d.status = 0; return d; }

    d.frame_size = hdr + (size_t)payload_len;
    d.opcode = opcode;

    if (opcode == 0x8) { d.status = -1; return d; }
    if (opcode == 0x9) {
        d.payload.resize((size_t)payload_len);
        for (size_t i = 0; i < payload_len; i++)
            d.payload[i] = buf[hdr + i] ^ (masked ? mask_key[i % 4] : 0);
        d.status = -2;
        return d;
    }
    if (opcode == 0xA) { d.status = -3; return d; }

    d.payload.resize((size_t)payload_len);
    for (size_t i = 0; i < payload_len; i++) {
        d.payload[i] = buf[hdr + i] ^ (masked ? mask_key[i % 4] : 0);
    }
    d.status = (int)payload_len;
    return d;
}

} // namespace

//============================================================
// Exports
//============================================================

HSPWEBSRV_EXPORT int __stdcall websrv_open_url(const char* url) {
    if (!url) return -1;
    EnsureHttpInit();

    int handle = FindFreeServer();
    if (handle < 0) return -1;
    ServerState& s = g_servers[handle];

    s.url = AnsiToWide(url);
    s.req_buf.assign(REQ_BUF, 0);

    HTTPAPI_VERSION ver = HTTPAPI_VERSION_2;
    ULONG rc = HttpCreateServerSession(ver, &s.sessionId, 0);
    if (rc != NO_ERROR) return -1;

    rc = HttpCreateUrlGroup(s.sessionId, &s.urlGroupId, 0);
    if (rc != NO_ERROR) {
        HttpCloseServerSession(s.sessionId);
        return -1;
    }

    rc = HttpCreateRequestQueue(ver, NULL, NULL, 0, &s.queue);
    if (rc != NO_ERROR) {
        HttpCloseUrlGroup(s.urlGroupId);
        HttpCloseServerSession(s.sessionId);
        return -1;
    }

    HTTP_BINDING_INFO binding = {};
    binding.Flags.Present = 1;
    binding.RequestQueueHandle = s.queue;
    rc = HttpSetUrlGroupProperty(s.urlGroupId, HttpServerBindingProperty, &binding, sizeof(binding));
    if (rc != NO_ERROR) {
        HttpCloseRequestQueue(s.queue);
        HttpCloseUrlGroup(s.urlGroupId);
        HttpCloseServerSession(s.sessionId);
        return -1;
    }

    rc = HttpAddUrlToUrlGroup(s.urlGroupId, s.url.c_str(), 0, 0);
    if (rc != NO_ERROR) {
        HttpCloseRequestQueue(s.queue);
        HttpCloseUrlGroup(s.urlGroupId);
        HttpCloseServerSession(s.sessionId);
        return -1;
    }

    s.ovl_event = CreateEventW(NULL, TRUE, FALSE, NULL);
    s.active = true;
    return handle;
}

HSPWEBSRV_EXPORT int __stdcall websrv_open(int port) {
    char url[64];
    snprintf(url, sizeof(url), "http://localhost:%d/", port);
    return websrv_open_url(url);
}

HSPWEBSRV_EXPORT int __stdcall websrv_accept(int handle,
                                              char* out_method, int ml,
                                              char* out_path,   int pl,
                                              char* out_body,   int bl,
                                              int* out_is_ws,
                                              int timeout_ms) {
    if (handle < 0 || handle >= MAX_SERVERS) return -1;
    ServerState& s = g_servers[handle];
    if (!s.active) return -1;
    if (out_method) out_method[0] = 0;
    if (out_path)   out_path[0] = 0;
    if (out_body)   out_body[0] = 0;
    if (out_is_ws)  *out_is_ws = 0;

    ResetEvent(s.ovl_event);
    memset(&s.ovl, 0, sizeof(s.ovl));
    s.ovl.hEvent = s.ovl_event;

    ULONG bytesRead = 0;
    ULONG rc = HttpReceiveHttpRequest(s.queue, HTTP_NULL_ID,
                                      HTTP_RECEIVE_REQUEST_FLAG_COPY_BODY,
                                      (PHTTP_REQUEST)s.req_buf.data(),
                                      (ULONG)s.req_buf.size(),
                                      &bytesRead, &s.ovl);

    if (rc == ERROR_IO_PENDING) {
        DWORD w = WaitForSingleObject(s.ovl_event, timeout_ms);
        if (w != WAIT_OBJECT_0) {
            CancelIoEx(s.queue, &s.ovl);
            WaitForSingleObject(s.ovl_event, 100);
            return 0;
        }
        DWORD dwBytes = 0;
        GetOverlappedResult(s.queue, &s.ovl, &dwBytes, FALSE);
        bytesRead = dwBytes;
        rc = NO_ERROR;
    }
    if (rc == ERROR_MORE_DATA) {
        PHTTP_REQUEST r = (PHTTP_REQUEST)s.req_buf.data();
        HTTP_REQUEST_ID tempId = r->RequestId;
        s.req_buf.assign(bytesRead + 8192, 0);
        rc = HttpReceiveHttpRequest(s.queue, tempId,
                                    HTTP_RECEIVE_REQUEST_FLAG_COPY_BODY,
                                    (PHTTP_REQUEST)s.req_buf.data(),
                                    (ULONG)s.req_buf.size(),
                                    &bytesRead, NULL);
    }
    if (rc != NO_ERROR) return -1;

    PHTTP_REQUEST req = (PHTTP_REQUEST)s.req_buf.data();
    s.pending_req_id = req->RequestId;

    const char* verb = VerbToString(req->Verb);
    if (req->Verb == HttpVerbUnknown && req->pUnknownVerb) {
        CopyStr(out_method, ml, req->pUnknownVerb, req->UnknownVerbLength);
    } else if (verb && *verb) {
        CopyStr(out_method, ml, verb, -1);
    }

    if (req->pRawUrl && req->RawUrlLength) {
        CopyStr(out_path, pl, req->pRawUrl, req->RawUrlLength);
    }

    int body_written = 0;
    if (req->EntityChunkCount > 0 && req->pEntityChunks && out_body && bl > 1) {
        for (USHORT c = 0; c < req->EntityChunkCount; c++) {
            const HTTP_DATA_CHUNK& ch = req->pEntityChunks[c];
            if (ch.DataChunkType == HttpDataChunkFromMemory) {
                int avail = bl - 1 - body_written;
                int copy = (int)ch.FromMemory.BufferLength;
                if (copy > avail) copy = avail;
                if (copy > 0) {
                    memcpy(out_body + body_written, ch.FromMemory.pBuffer, copy);
                    body_written += copy;
                }
            }
        }
        if (out_body) out_body[body_written] = 0;
    }

    std::string hUpgrade = GetHeader(req, "Upgrade");
    std::string hConn    = GetHeader(req, "Connection");
    std::string hKey     = GetHeader(req, "Sec-WebSocket-Key");
    bool is_ws = ContainsCI(hUpgrade, "websocket")
                 && ContainsCI(hConn, "upgrade")
                 && !hKey.empty();
    s.pending_is_ws = is_ws;
    s.last_ws_key = hKey;
    if (out_is_ws) *out_is_ws = is_ws ? 1 : 0;

    return 1;
}

HSPWEBSRV_EXPORT int __stdcall websrv_respond(int handle, int status,
                                               const char* content_type,
                                               const char* body, int body_len) {
    if (handle < 0 || handle >= MAX_SERVERS) return 0;
    ServerState& s = g_servers[handle];
    if (!s.active || s.pending_req_id == HTTP_NULL_ID) return 0;
    if (!body) body = "";
    if (body_len <= 0) body_len = (int)strlen(body);
    if (!content_type || !*content_type) content_type = "text/plain; charset=utf-8";

    const char* reason = "OK";
    if (status == 200) reason = "OK";
    else if (status == 201) reason = "Created";
    else if (status == 204) reason = "No Content";
    else if (status == 301) reason = "Moved Permanently";
    else if (status == 302) reason = "Found";
    else if (status == 400) reason = "Bad Request";
    else if (status == 401) reason = "Unauthorized";
    else if (status == 403) reason = "Forbidden";
    else if (status == 404) reason = "Not Found";
    else if (status == 500) reason = "Internal Server Error";

    HTTP_RESPONSE resp = {};
    resp.StatusCode = (USHORT)status;
    resp.pReason = reason;
    resp.ReasonLength = (USHORT)strlen(reason);
    resp.Headers.KnownHeaders[HttpHeaderContentType].pRawValue = content_type;
    resp.Headers.KnownHeaders[HttpHeaderContentType].RawValueLength = (USHORT)strlen(content_type);

    HTTP_DATA_CHUNK chunk = {};
    chunk.DataChunkType = HttpDataChunkFromMemory;
    chunk.FromMemory.pBuffer = (PVOID)body;
    chunk.FromMemory.BufferLength = (ULONG)body_len;
    resp.EntityChunkCount = 1;
    resp.pEntityChunks = &chunk;

    ULONG sent = 0;
    ULONG rc = HttpSendHttpResponse(s.queue, s.pending_req_id, 0,
                                    &resp, NULL, &sent, NULL, 0, NULL, NULL);
    s.pending_req_id = HTTP_NULL_ID;
    s.pending_is_ws = false;
    return rc == NO_ERROR ? 1 : 0;
}

HSPWEBSRV_EXPORT int __stdcall websrv_accept_ws(int handle) {
    if (handle < 0 || handle >= MAX_SERVERS) return -1;
    ServerState& s = g_servers[handle];
    if (!s.active || s.pending_req_id == HTTP_NULL_ID) return -1;
    if (!s.pending_is_ws) return -1;

    std::string accept_val = ComputeWsAccept(s.last_ws_key);
    if (accept_val.empty()) return -1;

    HTTP_RESPONSE resp = {};
    resp.StatusCode = 101;
    resp.pReason = "Switching Protocols";
    resp.ReasonLength = (USHORT)strlen(resp.pReason);

    resp.Headers.KnownHeaders[HttpHeaderUpgrade].pRawValue = "websocket";
    resp.Headers.KnownHeaders[HttpHeaderUpgrade].RawValueLength = 9;
    resp.Headers.KnownHeaders[HttpHeaderConnection].pRawValue = "Upgrade";
    resp.Headers.KnownHeaders[HttpHeaderConnection].RawValueLength = 7;

    HTTP_UNKNOWN_HEADER unkHeaders[1] = {};
    unkHeaders[0].NameLength = (USHORT)strlen("Sec-WebSocket-Accept");
    unkHeaders[0].pName = "Sec-WebSocket-Accept";
    unkHeaders[0].RawValueLength = (USHORT)accept_val.size();
    unkHeaders[0].pRawValue = accept_val.c_str();
    resp.Headers.UnknownHeaderCount = 1;
    resp.Headers.pUnknownHeaders = unkHeaders;

    ULONG sent = 0;
    ULONG rc = HttpSendHttpResponse(s.queue, s.pending_req_id,
                                    HTTP_SEND_RESPONSE_FLAG_OPAQUE | HTTP_SEND_RESPONSE_FLAG_MORE_DATA,
                                    &resp, NULL, &sent, NULL, 0, NULL, NULL);
    if (rc != NO_ERROR) {
        s.pending_req_id = HTTP_NULL_ID;
        s.pending_is_ws = false;
        return -1;
    }

    int ws_h = FindFreeWs();
    if (ws_h < 0) {
        s.pending_req_id = HTTP_NULL_ID;
        return -1;
    }
    WsState& w = g_ws[ws_h];
    w.server_handle = handle;
    w.req_id = s.pending_req_id;
    w.queue = s.queue;
    w.recv_accum.clear();
    w.closed = false;
    w.active = true;

    s.pending_req_id = HTTP_NULL_ID;
    s.pending_is_ws = false;
    return ws_h;
}

HSPWEBSRV_EXPORT int __stdcall websrv_ws_send(int ws, const char* data, int len, int is_binary) {
    if (ws < 0 || ws >= MAX_WS) return 0;
    WsState& w = g_ws[ws];
    if (!w.active || w.closed) return 0;
    if (!data) return 0;
    if (len < 0) len = (int)strlen(data);

    std::vector<BYTE> frame;
    BYTE opcode = is_binary ? 0x2 : 0x1;
    EncodeWsFrame(frame, (const BYTE*)data, (size_t)len, opcode);

    return SendOpaque(w.queue, w.req_id, frame.data(), (ULONG)frame.size(), true) ? len : 0;
}

HSPWEBSRV_EXPORT int __stdcall websrv_ws_recv(int ws, char* buf, int max_bytes, int timeout_ms) {
    if (ws < 0 || ws >= MAX_WS) return -1;
    WsState& w = g_ws[ws];
    if (!w.active) return -1;
    if (w.closed) return -1;
    if (!buf || max_bytes <= 0) return 0;

    DWORD start = GetTickCount();
    while (true) {
        WsDecoded d = DecodeWsFrame(w.recv_accum.data(), w.recv_accum.size());
        if (d.status == 0) {
            DWORD elapsed = GetTickCount() - start;
            if ((int)elapsed >= timeout_ms && timeout_ms > 0) return 0;
            int remaining = timeout_ms - (int)elapsed;
            if (remaining <= 0) remaining = 100;
            BYTE chunk[4096];
            int n = RecvOpaque(w.queue, w.req_id, chunk, sizeof(chunk), remaining);
            if (n == -1) { w.closed = true; return -1; }
            if (n == 0) continue;
            w.recv_accum.insert(w.recv_accum.end(), chunk, chunk + n);
            continue;
        }
        if (d.status == -1) {
            w.closed = true;
            return -1;
        }
        if (d.status == -2) {
            // Ping auto-pong
            std::vector<BYTE> pong;
            EncodeWsFrame(pong, d.payload.data(), d.payload.size(), 0xA);
            SendOpaque(w.queue, w.req_id, pong.data(), (ULONG)pong.size(), true);
            w.recv_accum.erase(w.recv_accum.begin(), w.recv_accum.begin() + d.frame_size);
            continue;
        }
        if (d.status == -3) {
            w.recv_accum.erase(w.recv_accum.begin(), w.recv_accum.begin() + d.frame_size);
            continue;
        }

        int n = (int)d.payload.size();
        if (n >= max_bytes) n = max_bytes - 1;
        memcpy(buf, d.payload.data(), n);
        buf[n] = 0;
        w.recv_accum.erase(w.recv_accum.begin(), w.recv_accum.begin() + d.frame_size);
        return n;
    }
}

HSPWEBSRV_EXPORT void __stdcall websrv_ws_close(int ws) {
    if (ws < 0 || ws >= MAX_WS) return;
    WsState& w = g_ws[ws];
    if (!w.active) return;

    if (!w.closed) {
        BYTE close_frame[2] = { 0x88, 0x00 };
        SendOpaque(w.queue, w.req_id, close_frame, 2, false);
    }
    w.closed = true;
    w.active = false;
    w.recv_accum.clear();
}

HSPWEBSRV_EXPORT void __stdcall websrv_close(int handle) {
    if (handle < 0 || handle >= MAX_SERVERS) return;
    ServerState& s = g_servers[handle];
    if (!s.active) return;

    for (int i = 0; i < MAX_WS; i++) {
        if (g_ws[i].active && g_ws[i].server_handle == handle) {
            websrv_ws_close(i);
        }
    }

    if (s.urlGroupId) {
        HttpRemoveUrlFromUrlGroup(s.urlGroupId, s.url.c_str(), 0);
        HttpCloseUrlGroup(s.urlGroupId);
        s.urlGroupId = 0;
    }
    if (s.queue) {
        HttpCloseRequestQueue(s.queue);
        s.queue = NULL;
    }
    if (s.sessionId) {
        HttpCloseServerSession(s.sessionId);
        s.sessionId = 0;
    }
    if (s.ovl_event) {
        CloseHandle(s.ovl_event);
        s.ovl_event = NULL;
    }
    s.active = false;
    s.pending_req_id = HTTP_NULL_ID;
    s.req_buf.clear();
}

BOOL WINAPI DllMain(HMODULE, DWORD reason, LPVOID) {
    if (reason == DLL_PROCESS_DETACH) {
        for (int i = 0; i < MAX_WS; i++) if (g_ws[i].active) websrv_ws_close(i);
        for (int i = 0; i < MAX_SERVERS; i++) if (g_servers[i].active) websrv_close(i);
        if (g_http_initialized) {
            HttpTerminate(HTTP_INITIALIZE_SERVER, NULL);
            g_http_initialized = false;
        }
    }
    return TRUE;
}
