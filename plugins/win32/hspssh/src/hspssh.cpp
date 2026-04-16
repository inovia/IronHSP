//
//  hspssh.dll - SSH2/SFTP client plugin for HSP
//
//  Uses libssh2 with Windows CNG crypto backend.
//  Provides SSH command execution and SFTP file transfer.
//
#define WIN32_LEAN_AND_MEAN
#include <windows.h>
#include <winsock2.h>
#include <ws2tcpip.h>
#include <cstdio>
#include <cstring>
#include <string>

#pragma comment(lib, "ws2_32.lib")
#pragma comment(lib, "bcrypt.lib")
#pragma comment(lib, "crypt32.lib")

#define LIBSSH2_API
#include "libssh2.h"
#include "libssh2_sftp.h"

#define EXPORT extern "C" __declspec(dllexport)

static SOCKET g_sock = INVALID_SOCKET;
static LIBSSH2_SESSION *g_session = NULL;
static LIBSSH2_SFTP *g_sftp = NULL;
static bool g_wsa_init = false;
static char g_error[1024] = "";

static void set_error(const char *msg) {
    strncpy(g_error, msg, sizeof(g_error)-1);
}

//------------------------------------------------------------
// ssh_connect(host, port, user, password)
//   Returns 0 on success, negative on error.
//------------------------------------------------------------
EXPORT int __cdecl ssh_connect(const char *host, int port,
                                const char *user, const char *password)
{
    if (!g_wsa_init) {
        WSADATA wd;
        WSAStartup(MAKEWORD(2,2), &wd);
        g_wsa_init = true;
        libssh2_init(0);
    }

    struct addrinfo hints = {}, *res = NULL;
    hints.ai_family = AF_INET;
    hints.ai_socktype = SOCK_STREAM;
    char port_str[16];
    sprintf(port_str, "%d", port);
    if (getaddrinfo(host, port_str, &hints, &res) != 0) {
        set_error("DNS failed"); return -1;
    }

    g_sock = socket(res->ai_family, res->ai_socktype, res->ai_protocol);
    if (connect(g_sock, res->ai_addr, (int)res->ai_addrlen) != 0) {
        freeaddrinfo(res); closesocket(g_sock); g_sock = INVALID_SOCKET;
        set_error("connect failed"); return -2;
    }
    freeaddrinfo(res);

    g_session = libssh2_session_init();
    if (!g_session) { set_error("session_init failed"); return -3; }

    if (libssh2_session_handshake(g_session, g_sock)) {
        set_error("handshake failed"); return -4;
    }

    if (libssh2_userauth_password(g_session, user, password)) {
        set_error("auth failed"); return -5;
    }

    return 0;
}

//------------------------------------------------------------
// ssh_exec(command, out_buf, out_size)
//   Execute command and return stdout. Returns bytes read.
//------------------------------------------------------------
EXPORT int __cdecl ssh_exec(const char *command, char *out, int out_size)
{
    if (!g_session) { set_error("not connected"); return -1; }

    LIBSSH2_CHANNEL *ch = libssh2_channel_open_session(g_session);
    if (!ch) { set_error("channel open failed"); return -2; }

    if (libssh2_channel_exec(ch, command)) {
        libssh2_channel_free(ch);
        set_error("exec failed"); return -3;
    }

    int total = 0;
    while (total < out_size - 1) {
        int n = libssh2_channel_read(ch, out + total, out_size - 1 - total);
        if (n <= 0) break;
        total += n;
    }
    out[total] = '\0';

    libssh2_channel_close(ch);
    libssh2_channel_free(ch);
    return total;
}

//------------------------------------------------------------
// sftp_init()  Initialize SFTP subsystem. Returns 0 on success.
//------------------------------------------------------------
EXPORT int __cdecl sftp_init()
{
    if (!g_session) { set_error("not connected"); return -1; }
    g_sftp = libssh2_sftp_init(g_session);
    if (!g_sftp) { set_error("sftp_init failed"); return -2; }
    return 0;
}

//------------------------------------------------------------
// sftp_upload(local_path, remote_path)  Returns 0 on success.
//------------------------------------------------------------
EXPORT int __cdecl sftp_upload(const char *local_path, const char *remote_path)
{
    if (!g_sftp) { set_error("sftp not initialized"); return -1; }

    FILE *f = fopen(local_path, "rb");
    if (!f) { set_error("local file open failed"); return -2; }

    LIBSSH2_SFTP_HANDLE *sftp_h = libssh2_sftp_open(g_sftp, remote_path,
        LIBSSH2_FXF_WRITE | LIBSSH2_FXF_CREAT | LIBSSH2_FXF_TRUNC,
        LIBSSH2_SFTP_S_IRUSR | LIBSSH2_SFTP_S_IWUSR);
    if (!sftp_h) { fclose(f); set_error("sftp open failed"); return -3; }

    char buf[32768];
    int n;
    while ((n = (int)fread(buf, 1, sizeof(buf), f)) > 0) {
        int written = 0;
        while (written < n) {
            int rc = libssh2_sftp_write(sftp_h, buf + written, n - written);
            if (rc < 0) { fclose(f); libssh2_sftp_close(sftp_h); set_error("sftp write failed"); return -4; }
            written += rc;
        }
    }
    fclose(f);
    libssh2_sftp_close(sftp_h);
    return 0;
}

//------------------------------------------------------------
// sftp_download(remote_path, local_path)
//------------------------------------------------------------
EXPORT int __cdecl sftp_download(const char *remote_path, const char *local_path)
{
    if (!g_sftp) { set_error("sftp not initialized"); return -1; }

    LIBSSH2_SFTP_HANDLE *sftp_h = libssh2_sftp_open(g_sftp, remote_path,
        LIBSSH2_FXF_READ, 0);
    if (!sftp_h) { set_error("sftp open failed"); return -2; }

    FILE *f = fopen(local_path, "wb");
    if (!f) { libssh2_sftp_close(sftp_h); set_error("local file create failed"); return -3; }

    char buf[32768];
    while (1) {
        int n = libssh2_sftp_read(sftp_h, buf, sizeof(buf));
        if (n <= 0) break;
        fwrite(buf, 1, n, f);
    }
    fclose(f);
    libssh2_sftp_close(sftp_h);
    return 0;
}

//------------------------------------------------------------
// ssh_disconnect()
//------------------------------------------------------------
EXPORT int __cdecl ssh_disconnect()
{
    if (g_sftp) { libssh2_sftp_shutdown(g_sftp); g_sftp = NULL; }
    if (g_session) {
        libssh2_session_disconnect(g_session, "bye");
        libssh2_session_free(g_session);
        g_session = NULL;
    }
    if (g_sock != INVALID_SOCKET) { closesocket(g_sock); g_sock = INVALID_SOCKET; }
    return 0;
}

EXPORT int __cdecl ssh_get_error(char *out, int size) {
    if (out && size > 0) { strncpy(out, g_error, size-1); out[size-1]='\0'; }
    return (int)strlen(g_error);
}

BOOL WINAPI DllMain(HINSTANCE h, DWORD r, LPVOID p) {
    if (r == DLL_PROCESS_DETACH) { ssh_disconnect(); if (g_wsa_init) { libssh2_exit(); WSACleanup(); } }
    return TRUE;
}
