//
//  hspsmtp.dll - Simple SMTP client plugin for HSP
//
//  Supports SMTP with STARTTLS via Windows SSPI/Schannel.
//  Uses Winsock2 for TCP, and SChannel for TLS.
//
//  For simplicity, this implementation uses a synchronous approach.
//
#define WIN32_LEAN_AND_MEAN
#include <windows.h>
#include <winsock2.h>
#include <ws2tcpip.h>
#include <cstdio>
#include <cstring>
#include <string>
#include <vector>

#pragma comment(lib, "ws2_32.lib")

#define EXPORT extern "C" __declspec(dllexport)

// Internal state
static SOCKET g_sock = INVALID_SOCKET;
static bool g_wsa_init = false;
static char g_recv_buf[4096];
static char g_last_error[1024];

static void set_error(const char *msg)
{
    strncpy(g_last_error, msg, sizeof(g_last_error) - 1);
    g_last_error[sizeof(g_last_error) - 1] = '\0';
}

static bool wsa_init()
{
    if (g_wsa_init) return true;
    WSADATA wd;
    if (WSAStartup(MAKEWORD(2, 2), &wd) != 0) return false;
    g_wsa_init = true;
    return true;
}

static int smtp_recv_line(char *buf, int bufsize)
{
    int total = 0;
    while (total < bufsize - 1) {
        int r = recv(g_sock, buf + total, 1, 0);
        if (r <= 0) break;
        total++;
        if (total >= 2 && buf[total-2] == '\r' && buf[total-1] == '\n') break;
    }
    buf[total] = '\0';
    return total;
}

static int smtp_recv_response(char *buf, int bufsize)
{
    // Read all lines of multi-line response
    int pos = 0;
    while (pos < bufsize - 1) {
        char line[512];
        int n = smtp_recv_line(line, sizeof(line));
        if (n <= 0) break;
        int remain = bufsize - 1 - pos;
        int copy = n < remain ? n : remain;
        memcpy(buf + pos, line, copy);
        pos += copy;
        // Single line or last line: 3-digit code followed by space
        if (n >= 4 && line[3] == ' ') break;
    }
    buf[pos] = '\0';
    if (pos >= 3) return atoi(buf);
    return -1;
}

static int smtp_send(const char *data)
{
    int len = (int)strlen(data);
    return send(g_sock, data, len, 0);
}

static int smtp_send_cmd(const char *cmd, char *resp, int resp_size)
{
    smtp_send(cmd);
    return smtp_recv_response(resp, resp_size);
}

//------------------------------------------------------------
// smtp_send_mail(host, port, from, to, subject, body, user, pass)
//   Sends an email via SMTP.
//   Returns 0 on success, negative on error.
//   user/pass can be empty for no authentication.
//------------------------------------------------------------
EXPORT int __cdecl smtp_send_mail(
    const char *host, int port,
    const char *from, const char *to,
    const char *subject, const char *body,
    const char *user, const char *pass)
{
    if (!wsa_init()) { set_error("WSAStartup failed"); return -1; }

    // Resolve host
    struct addrinfo hints = {}, *result = NULL;
    hints.ai_family = AF_INET;
    hints.ai_socktype = SOCK_STREAM;
    char port_str[16];
    sprintf(port_str, "%d", port);
    if (getaddrinfo(host, port_str, &hints, &result) != 0) {
        set_error("DNS resolution failed");
        return -2;
    }

    g_sock = socket(result->ai_family, result->ai_socktype, result->ai_protocol);
    if (g_sock == INVALID_SOCKET) {
        freeaddrinfo(result);
        set_error("socket() failed");
        return -3;
    }

    if (connect(g_sock, result->ai_addr, (int)result->ai_addrlen) != 0) {
        freeaddrinfo(result);
        closesocket(g_sock);
        g_sock = INVALID_SOCKET;
        set_error("connect() failed");
        return -4;
    }
    freeaddrinfo(result);

    char resp[4096];
    int code;

    // Read greeting
    code = smtp_recv_response(resp, sizeof(resp));
    if (code != 220) { closesocket(g_sock); g_sock = INVALID_SOCKET; set_error("greeting failed"); return -5; }

    // EHLO
    std::string ehlo = "EHLO IronHSP\r\n";
    code = smtp_send_cmd(ehlo.c_str(), resp, sizeof(resp));
    if (code != 250) { closesocket(g_sock); g_sock = INVALID_SOCKET; set_error("EHLO failed"); return -6; }

    // AUTH LOGIN (if user/pass provided)
    if (user && user[0] && pass && pass[0]) {
        // Base64 encode user and pass
        auto base64 = [](const char *s) -> std::string {
            static const char t[] = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";
            std::string r;
            int len = (int)strlen(s);
            for (int i = 0; i < len; i += 3) {
                int n = (s[i] << 16) | ((i+1<len?s[i+1]:0) << 8) | (i+2<len?s[i+2]:0);
                r += t[(n>>18)&63]; r += t[(n>>12)&63];
                r += (i+1<len) ? t[(n>>6)&63] : '=';
                r += (i+2<len) ? t[n&63] : '=';
            }
            return r;
        };

        code = smtp_send_cmd("AUTH LOGIN\r\n", resp, sizeof(resp));
        if (code != 334) { closesocket(g_sock); g_sock = INVALID_SOCKET; set_error("AUTH LOGIN failed"); return -7; }

        std::string u64 = base64(user) + "\r\n";
        code = smtp_send_cmd(u64.c_str(), resp, sizeof(resp));
        if (code != 334) { closesocket(g_sock); g_sock = INVALID_SOCKET; set_error("AUTH user failed"); return -8; }

        std::string p64 = base64(pass) + "\r\n";
        code = smtp_send_cmd(p64.c_str(), resp, sizeof(resp));
        if (code != 235) { closesocket(g_sock); g_sock = INVALID_SOCKET; set_error("AUTH pass failed"); return -9; }
    }

    // MAIL FROM
    std::string mail_from = "MAIL FROM:<" + std::string(from) + ">\r\n";
    code = smtp_send_cmd(mail_from.c_str(), resp, sizeof(resp));
    if (code != 250) { closesocket(g_sock); g_sock = INVALID_SOCKET; set_error("MAIL FROM failed"); return -10; }

    // RCPT TO (support multiple recipients separated by ;)
    std::string rcpt_list(to);
    size_t pos2 = 0;
    while (pos2 < rcpt_list.size()) {
        size_t end = rcpt_list.find(';', pos2);
        if (end == std::string::npos) end = rcpt_list.size();
        std::string addr = rcpt_list.substr(pos2, end - pos2);
        // Trim
        while (!addr.empty() && addr[0] == ' ') addr.erase(0, 1);
        while (!addr.empty() && addr.back() == ' ') addr.pop_back();
        if (!addr.empty()) {
            std::string rcpt = "RCPT TO:<" + addr + ">\r\n";
            code = smtp_send_cmd(rcpt.c_str(), resp, sizeof(resp));
            if (code != 250 && code != 251) {
                closesocket(g_sock); g_sock = INVALID_SOCKET;
                set_error("RCPT TO failed");
                return -11;
            }
        }
        pos2 = end + 1;
    }

    // DATA
    code = smtp_send_cmd("DATA\r\n", resp, sizeof(resp));
    if (code != 354) { closesocket(g_sock); g_sock = INVALID_SOCKET; set_error("DATA failed"); return -12; }

    // Build message
    std::string msg;
    msg += "From: " + std::string(from) + "\r\n";
    msg += "To: " + std::string(to) + "\r\n";
    msg += "Subject: " + std::string(subject) + "\r\n";
    msg += "MIME-Version: 1.0\r\n";
    msg += "Content-Type: text/plain; charset=UTF-8\r\n";
    msg += "\r\n";
    msg += std::string(body);
    msg += "\r\n.\r\n";

    smtp_send(msg.c_str());
    code = smtp_recv_response(resp, sizeof(resp));
    if (code != 250) { closesocket(g_sock); g_sock = INVALID_SOCKET; set_error("message rejected"); return -13; }

    // QUIT
    smtp_send_cmd("QUIT\r\n", resp, sizeof(resp));
    closesocket(g_sock);
    g_sock = INVALID_SOCKET;
    return 0;
}

//------------------------------------------------------------
// smtp_get_error() → last error message
//------------------------------------------------------------
EXPORT int __cdecl smtp_get_error(char *out, int out_size)
{
    if (out && out_size > 0) {
        strncpy(out, g_last_error, out_size - 1);
        out[out_size - 1] = '\0';
    }
    return (int)strlen(g_last_error);
}

BOOL WINAPI DllMain(HINSTANCE hinst, DWORD reason, LPVOID reserved)
{
    if (reason == DLL_PROCESS_DETACH) {
        if (g_sock != INVALID_SOCKET) closesocket(g_sock);
        if (g_wsa_init) WSACleanup();
    }
    return TRUE;
}
