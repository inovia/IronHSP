//============================================================
//   hspwebsrv.dll — Minimal HTTP server for HSP (winsock based)
//
//   winsock ベースの最小 HTTP サーバ。localhost や任意ポートで
//   HSP スクリプトが HTTP リクエストを受け付けて処理できるように
//   するヘルパ DLL。httpapi.dll (HTTP.sys) と違って URL reservation
//   不要 (admin 権限不要) で気軽に使える。
//
//   シリアルモデル (1 request at a time, no keep-alive, no threads):
//     1. websrv_open(port) でソケット作成 + bind + listen
//     2. websrv_accept で 1 client を accept + リクエスト受信 + パース
//     3. ハンドラ内で websrv_respond を呼んでレスポンス送信
//     4. websrv_close でソケット解放
//
//   エクスポート:
//     int  websrv_open(int port) → handle (>=0) / -1 失敗
//     int  websrv_accept(int handle, char* method, int mlen, char* path, int plen,
//                        char* body, int blen, int timeout_ms) → 1 = got req / 0 = timeout / -1 err
//     int  websrv_respond(int handle, int status, const char* content_type,
//                         const char* body, int body_len)
//     void websrv_close(int handle)
//
//   例 HSP:
//     h = websrv_open(8080)
//     repeat
//         n = websrv_accept(h, method, 32, path, 1024, body, 4096, 100)
//         if n = 1 {
//             websrv_respond h, 200, "text/html", "<h1>Hello " + path + "</h1>", 0
//         }
//         if k_esc : break
//     loop
//     websrv_close h
//============================================================

#define WIN32_LEAN_AND_MEAN
#include <winsock2.h>
#include <ws2tcpip.h>
#include <windows.h>
#include <cstring>
#include <cstdio>
#include <vector>
#include <string>

#pragma comment(lib, "ws2_32.lib")

#define HSPWEBSRV_EXPORT extern "C" __declspec(dllexport)

namespace {

constexpr int MAX_HANDLES = 8;

struct WebSrvState {
    bool active = false;
    SOCKET listen_sock = INVALID_SOCKET;
    SOCKET client_sock = INVALID_SOCKET;    // current pending client
    int port = 0;
};

static WebSrvState g_states[MAX_HANDLES];
static bool g_wsa_inited = false;

int FindFreeHandle() {
    for (int i = 0; i < MAX_HANDLES; i++) {
        if (!g_states[i].active) return i;
    }
    return -1;
}

static void EnsureWsa() {
    if (g_wsa_inited) return;
    WSADATA wsa;
    WSAStartup(MAKEWORD(2, 2), &wsa);
    g_wsa_inited = true;
}

// Receive up to buf_max bytes from sock, timeout in ms. Returns bytes received.
static int RecvWithTimeout(SOCKET s, char* buf, int buf_max, int timeout_ms) {
    fd_set rfds;
    FD_ZERO(&rfds);
    FD_SET(s, &rfds);
    timeval tv;
    tv.tv_sec = timeout_ms / 1000;
    tv.tv_usec = (timeout_ms % 1000) * 1000;
    int rc = select(0, &rfds, NULL, NULL, &tv);
    if (rc <= 0) return 0;
    return recv(s, buf, buf_max, 0);
}

// Minimal HTTP request parser. Method URL HTTP/1.x\r\n + headers + \r\n\r\n + body.
struct HttpRequest {
    std::string method;
    std::string url;
    std::string body;
    int content_length = 0;
};

static bool ParseHttpRequest(const std::string& raw, HttpRequest& out) {
    size_t p = raw.find(' ');
    if (p == std::string::npos) return false;
    out.method = raw.substr(0, p);
    size_t q = raw.find(' ', p + 1);
    if (q == std::string::npos) return false;
    out.url = raw.substr(p + 1, q - p - 1);

    size_t header_end = raw.find("\r\n\r\n");
    if (header_end == std::string::npos) return false;

    // Parse headers to find Content-Length
    std::string headers = raw.substr(0, header_end);
    size_t cl_pos = headers.find("Content-Length:");
    if (cl_pos == std::string::npos) cl_pos = headers.find("content-length:");
    if (cl_pos != std::string::npos) {
        size_t cl_start = headers.find(':', cl_pos) + 1;
        while (cl_start < headers.size() && (headers[cl_start] == ' ' || headers[cl_start] == '\t')) cl_start++;
        out.content_length = atoi(headers.c_str() + cl_start);
    }

    out.body = raw.substr(header_end + 4);
    return true;
}

} // namespace

//============================================================
// Exports
//============================================================

HSPWEBSRV_EXPORT int __stdcall websrv_open(int port) {
    EnsureWsa();
    int handle = FindFreeHandle();
    if (handle < 0) return -1;
    WebSrvState& s = g_states[handle];

    s.listen_sock = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP);
    if (s.listen_sock == INVALID_SOCKET) return -1;

    // SO_REUSEADDR
    int opt = 1;
    setsockopt(s.listen_sock, SOL_SOCKET, SO_REUSEADDR, (const char*)&opt, sizeof(opt));

    // Non-blocking
    u_long mode = 1;
    ioctlsocket(s.listen_sock, FIONBIO, &mode);

    sockaddr_in addr = {};
    addr.sin_family = AF_INET;
    addr.sin_port = htons((u_short)port);
    addr.sin_addr.s_addr = INADDR_ANY;

    if (bind(s.listen_sock, (sockaddr*)&addr, sizeof(addr)) == SOCKET_ERROR) {
        closesocket(s.listen_sock);
        s.listen_sock = INVALID_SOCKET;
        return -1;
    }

    if (listen(s.listen_sock, 5) == SOCKET_ERROR) {
        closesocket(s.listen_sock);
        s.listen_sock = INVALID_SOCKET;
        return -1;
    }

    s.port = port;
    s.active = true;
    return handle;
}

HSPWEBSRV_EXPORT int __stdcall websrv_accept(int handle,
                                              char* out_method, int method_len,
                                              char* out_path, int path_len,
                                              char* out_body, int body_len,
                                              int timeout_ms) {
    if (handle < 0 || handle >= MAX_HANDLES) return -1;
    WebSrvState& s = g_states[handle];
    if (!s.active || s.listen_sock == INVALID_SOCKET) return -1;
    if (out_method) out_method[0] = 0;
    if (out_path)   out_path[0] = 0;
    if (out_body)   out_body[0] = 0;

    // Non-blocking select → accept
    fd_set rfds;
    FD_ZERO(&rfds);
    FD_SET(s.listen_sock, &rfds);
    timeval tv;
    tv.tv_sec = timeout_ms / 1000;
    tv.tv_usec = (timeout_ms % 1000) * 1000;
    int rc = select(0, &rfds, NULL, NULL, &tv);
    if (rc <= 0) return 0;

    sockaddr_in caddr;
    int caddr_len = sizeof(caddr);
    SOCKET cs = accept(s.listen_sock, (sockaddr*)&caddr, &caddr_len);
    if (cs == INVALID_SOCKET) return 0;

    // Block client socket while we read
    u_long mode = 0;
    ioctlsocket(cs, FIONBIO, &mode);

    // Read until \r\n\r\n + Content-Length body
    std::string raw;
    char buf[4096];
    while (true) {
        int n = RecvWithTimeout(cs, buf, sizeof(buf), 2000);
        if (n <= 0) break;
        raw.append(buf, n);
        // Check if we have headers + body complete
        size_t he = raw.find("\r\n\r\n");
        if (he != std::string::npos) {
            // Parse Content-Length
            std::string hdr = raw.substr(0, he);
            size_t cl = hdr.find("Content-Length:");
            if (cl == std::string::npos) cl = hdr.find("content-length:");
            int expect_body = 0;
            if (cl != std::string::npos) {
                size_t st = hdr.find(':', cl) + 1;
                while (st < hdr.size() && (hdr[st] == ' ' || hdr[st] == '\t')) st++;
                expect_body = atoi(hdr.c_str() + st);
            }
            int have_body = (int)(raw.size() - he - 4);
            if (have_body >= expect_body) break;
        }
    }

    // Parse request
    HttpRequest req;
    if (!ParseHttpRequest(raw, req)) {
        closesocket(cs);
        return 0;
    }

    // Copy fields out
    if (out_method && method_len > 0) {
        int n = (int)req.method.size();
        if (n >= method_len) n = method_len - 1;
        memcpy(out_method, req.method.data(), n);
        out_method[n] = 0;
    }
    if (out_path && path_len > 0) {
        int n = (int)req.url.size();
        if (n >= path_len) n = path_len - 1;
        memcpy(out_path, req.url.data(), n);
        out_path[n] = 0;
    }
    if (out_body && body_len > 0) {
        int n = (int)req.body.size();
        if (n >= body_len) n = body_len - 1;
        memcpy(out_body, req.body.data(), n);
        out_body[n] = 0;
    }

    // Store client socket for respond
    s.client_sock = cs;
    return 1;
}

HSPWEBSRV_EXPORT int __stdcall websrv_respond(int handle, int status,
                                               const char* content_type,
                                               const char* body, int body_len) {
    if (handle < 0 || handle >= MAX_HANDLES) return 0;
    WebSrvState& s = g_states[handle];
    if (!s.active || s.client_sock == INVALID_SOCKET) return 0;
    if (!body) body = "";
    if (body_len <= 0) body_len = (int)strlen(body);
    if (!content_type || !*content_type) content_type = "text/plain; charset=utf-8";

    const char* status_text = "OK";
    if (status == 200) status_text = "OK";
    else if (status == 201) status_text = "Created";
    else if (status == 204) status_text = "No Content";
    else if (status == 301) status_text = "Moved Permanently";
    else if (status == 302) status_text = "Found";
    else if (status == 400) status_text = "Bad Request";
    else if (status == 401) status_text = "Unauthorized";
    else if (status == 403) status_text = "Forbidden";
    else if (status == 404) status_text = "Not Found";
    else if (status == 500) status_text = "Internal Server Error";

    char header[1024];
    int hn = snprintf(header, sizeof(header),
        "HTTP/1.1 %d %s\r\n"
        "Content-Type: %s\r\n"
        "Content-Length: %d\r\n"
        "Connection: close\r\n"
        "\r\n",
        status, status_text, content_type, body_len);

    send(s.client_sock, header, hn, 0);
    if (body_len > 0) {
        send(s.client_sock, body, body_len, 0);
    }

    // Close client
    shutdown(s.client_sock, SD_SEND);
    closesocket(s.client_sock);
    s.client_sock = INVALID_SOCKET;
    return 1;
}

HSPWEBSRV_EXPORT void __stdcall websrv_close(int handle) {
    if (handle < 0 || handle >= MAX_HANDLES) return;
    WebSrvState& s = g_states[handle];
    if (!s.active) return;
    if (s.client_sock != INVALID_SOCKET) {
        closesocket(s.client_sock);
        s.client_sock = INVALID_SOCKET;
    }
    if (s.listen_sock != INVALID_SOCKET) {
        closesocket(s.listen_sock);
        s.listen_sock = INVALID_SOCKET;
    }
    s.active = false;
}

BOOL WINAPI DllMain(HMODULE, DWORD reason, LPVOID) {
    if (reason == DLL_PROCESS_DETACH) {
        for (int i = 0; i < MAX_HANDLES; i++) {
            if (g_states[i].active) websrv_close(i);
        }
        if (g_wsa_inited) {
            WSACleanup();
            g_wsa_inited = false;
        }
    }
    return TRUE;
}
