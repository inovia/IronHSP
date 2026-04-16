//============================================================
//   hspmcp.dll — Process pipe helper for MCP stdio transport
//
//   HSP からは扱いづらい以下の処理を C++ 側で隠蔽:
//     * CreateProcess + 匿名 pipe による子プロセスの spawn
//     * 子プロセス stdin への書き込み (mcp_proc_send)
//     * 子プロセス stdout からの行単位読み取り (mcp_proc_recv)
//     * バックグラウンド reader thread + 内部 line buffer
//     * 終了時の TerminateProcess + ハンドルクローズ
//
//   主に Anthropic Model Context Protocol (MCP) の stdio transport
//   実装に使うが、汎用の "process pipe wrapper" として他用途にも使える。
//
//   エクスポート:
//     int  mcp_proc_open(const char* command_line, const char* working_dir)
//     int  mcp_proc_send(int handle, const char* data, int len)
//     int  mcp_proc_recv_line(int handle, char* buf, int buflen)
//     int  mcp_proc_alive(int handle)
//     void mcp_proc_close(int handle)
//
//   出力: hspmcp.dll (Win32) / hspmcp_64.dll (x64)
//============================================================

#define WIN32_LEAN_AND_MEAN
#include <windows.h>
#include <cstring>
#include <cstdlib>
#include <cstdio>
#include <vector>
#include <deque>
#include <string>

#pragma comment(lib, "kernel32.lib")
#pragma comment(lib, "user32.lib")

#define HSPMCP_EXPORT extern "C" __declspec(dllexport)

namespace {

constexpr int MAX_PROCS = 64;

struct ProcState {
    bool active = false;

    HANDLE hChildStdInRead = NULL;
    HANDLE hChildStdInWrite = NULL;       // 親 → 子へ書く
    HANDLE hChildStdOutRead = NULL;       // 親 ← 子から読む
    HANDLE hChildStdOutWrite = NULL;
    HANDLE hProcess = NULL;
    HANDLE hThread = NULL;
    DWORD  processId = 0;

    HANDLE reader_thread = NULL;
    HANDLE stop_event = NULL;

    CRITICAL_SECTION lock;
    bool             lock_inited = false;

    std::string      pending;             // 改行未到達のバッファ
    std::deque<std::string> lines;        // 完成した行 (1 メッセージ = 1 行)
};

static ProcState g_procs[MAX_PROCS];

int FindFreeHandle() {
    for (int i = 0; i < MAX_PROCS; i++) {
        if (!g_procs[i].active) return i;
    }
    return -1;
}

// reader thread: 子プロセス stdout を ReadFile し続ける
DWORD WINAPI ReaderProc(LPVOID arg) {
    ProcState* p = (ProcState*)arg;
    char buf[4096];
    while (true) {
        if (WaitForSingleObject(p->stop_event, 0) == WAIT_OBJECT_0) break;

        DWORD avail = 0;
        if (!PeekNamedPipe(p->hChildStdOutRead, NULL, 0, NULL, &avail, NULL)) {
            // パイプが切れた = 子終了
            break;
        }
        if (avail == 0) {
            Sleep(10);
            continue;
        }
        DWORD readN = 0;
        if (!ReadFile(p->hChildStdOutRead, buf, sizeof(buf) - 1, &readN, NULL)) break;
        if (readN == 0) {
            Sleep(5);
            continue;
        }

        // pending に追記して \n で行分割
        EnterCriticalSection(&p->lock);
        p->pending.append(buf, readN);
        size_t pos;
        while ((pos = p->pending.find('\n')) != std::string::npos) {
            std::string line = p->pending.substr(0, pos);
            // \r 削除
            if (!line.empty() && line.back() == '\r') line.pop_back();
            p->lines.push_back(std::move(line));
            p->pending.erase(0, pos + 1);
        }
        LeaveCriticalSection(&p->lock);
    }
    return 0;
}

} // namespace

//============================================================
// Exports
//============================================================

HSPMCP_EXPORT int __stdcall mcp_proc_open(const char* command_line, const char* working_dir) {
    int handle = FindFreeHandle();
    if (handle < 0) return -1;

    ProcState& p = g_procs[handle];

    // 1. SECURITY_ATTRIBUTES (匿名 pipe を inheritable に)
    SECURITY_ATTRIBUTES sa = {};
    sa.nLength = sizeof(sa);
    sa.bInheritHandle = TRUE;
    sa.lpSecurityDescriptor = NULL;

    // 2. stdout pipe (子 → 親)
    if (!CreatePipe(&p.hChildStdOutRead, &p.hChildStdOutWrite, &sa, 0)) return -1;
    SetHandleInformation(p.hChildStdOutRead, HANDLE_FLAG_INHERIT, 0);

    // 3. stdin pipe (親 → 子)
    if (!CreatePipe(&p.hChildStdInRead, &p.hChildStdInWrite, &sa, 0)) {
        CloseHandle(p.hChildStdOutRead);
        CloseHandle(p.hChildStdOutWrite);
        return -1;
    }
    SetHandleInformation(p.hChildStdInWrite, HANDLE_FLAG_INHERIT, 0);

    // 4. CreateProcess
    STARTUPINFOA si = {};
    si.cb = sizeof(si);
    si.dwFlags = STARTF_USESTDHANDLES;
    si.hStdInput  = p.hChildStdInRead;
    si.hStdOutput = p.hChildStdOutWrite;
    si.hStdError  = p.hChildStdOutWrite;

    PROCESS_INFORMATION pi = {};

    // command line を mutable にコピー (CreateProcess は書き換える可能性)
    char* cmdMutable = _strdup(command_line ? command_line : "");
    if (!cmdMutable) {
        CloseHandle(p.hChildStdInRead);
        CloseHandle(p.hChildStdInWrite);
        CloseHandle(p.hChildStdOutRead);
        CloseHandle(p.hChildStdOutWrite);
        return -1;
    }

    BOOL ok = CreateProcessA(
        NULL,
        cmdMutable,
        NULL,
        NULL,
        TRUE,
        CREATE_NO_WINDOW,
        NULL,
        (working_dir && *working_dir) ? working_dir : NULL,
        &si,
        &pi);
    free(cmdMutable);

    // 親側で子側のハンドルを閉じる (子のみが保持)
    CloseHandle(p.hChildStdInRead);
    p.hChildStdInRead = NULL;
    CloseHandle(p.hChildStdOutWrite);
    p.hChildStdOutWrite = NULL;

    if (!ok) {
        CloseHandle(p.hChildStdInWrite);
        CloseHandle(p.hChildStdOutRead);
        return -1;
    }

    p.hProcess = pi.hProcess;
    p.hThread = pi.hThread;
    p.processId = pi.dwProcessId;

    // 5. Reader thread 起動
    if (!p.lock_inited) {
        InitializeCriticalSection(&p.lock);
        p.lock_inited = true;
    }
    p.pending.clear();
    p.lines.clear();
    p.stop_event = CreateEventW(NULL, TRUE, FALSE, NULL);
    p.reader_thread = CreateThread(NULL, 0, ReaderProc, &p, 0, NULL);

    p.active = true;
    return handle;
}

HSPMCP_EXPORT int __stdcall mcp_proc_send(int handle, const char* data, int len) {
    if (handle < 0 || handle >= MAX_PROCS) return 0;
    ProcState& p = g_procs[handle];
    if (!p.active || !p.hChildStdInWrite || !data) return 0;

    if (len <= 0) len = (int)strlen(data);
    DWORD written = 0;
    BOOL ok = WriteFile(p.hChildStdInWrite, data, (DWORD)len, &written, NULL);
    if (!ok) return 0;
    return (int)written;
}

// 1 行取り出す (改行込みではなく、本体のみ。ANSI 文字列。)
// 戻り値: 読めたバイト数 (>=0) / 0 = まだ無い / -1 = ハンドル無効
HSPMCP_EXPORT int __stdcall mcp_proc_recv_line(int handle, char* buf, int buflen) {
    if (handle < 0 || handle >= MAX_PROCS) return -1;
    ProcState& p = g_procs[handle];
    if (!p.active) return -1;
    if (!buf || buflen <= 0) return 0;

    EnterCriticalSection(&p.lock);
    int n = 0;
    if (!p.lines.empty()) {
        const std::string& line = p.lines.front();
        n = (int)line.size();
        if (n >= buflen) n = buflen - 1;
        memcpy(buf, line.data(), n);
        buf[n] = 0;
        p.lines.pop_front();
    } else {
        buf[0] = 0;
    }
    LeaveCriticalSection(&p.lock);
    return n;
}

HSPMCP_EXPORT int __stdcall mcp_proc_alive(int handle) {
    if (handle < 0 || handle >= MAX_PROCS) return 0;
    ProcState& p = g_procs[handle];
    if (!p.active || !p.hProcess) return 0;
    DWORD code = 0;
    if (!GetExitCodeProcess(p.hProcess, &code)) return 0;
    return (code == STILL_ACTIVE) ? 1 : 0;
}

HSPMCP_EXPORT void __stdcall mcp_proc_close(int handle) {
    if (handle < 0 || handle >= MAX_PROCS) return;
    ProcState& p = g_procs[handle];
    if (!p.active) return;

    if (p.stop_event) SetEvent(p.stop_event);
    if (p.hChildStdInWrite) {
        CloseHandle(p.hChildStdInWrite);
        p.hChildStdInWrite = NULL;
    }
    if (p.reader_thread) {
        WaitForSingleObject(p.reader_thread, 1000);
        CloseHandle(p.reader_thread);
        p.reader_thread = NULL;
    }
    if (p.stop_event) {
        CloseHandle(p.stop_event);
        p.stop_event = NULL;
    }
    if (p.hChildStdOutRead) {
        CloseHandle(p.hChildStdOutRead);
        p.hChildStdOutRead = NULL;
    }
    if (p.hProcess) {
        if (mcp_proc_alive(handle)) {
            TerminateProcess(p.hProcess, 0);
        }
        WaitForSingleObject(p.hProcess, 2000);
        CloseHandle(p.hProcess);
        p.hProcess = NULL;
    }
    if (p.hThread) {
        CloseHandle(p.hThread);
        p.hThread = NULL;
    }
    p.pending.clear();
    p.lines.clear();
    p.active = false;
}

//============================================================
// MCP server side: stdin/stdout helpers
//
// HSP3CL を MCP server として動かすために、自プロセスの
// stdin/stdout を行単位で読み書きするヘルパ。
//============================================================

static HANDLE g_stdin = INVALID_HANDLE_VALUE;
static HANDLE g_stdout = INVALID_HANDLE_VALUE;
static std::string g_stdin_pending;

HSPMCP_EXPORT int __stdcall mcp_stdin_read_line(char* buf, int buflen) {
    if (!buf || buflen <= 0) return 0;
    if (g_stdin == INVALID_HANDLE_VALUE) {
        g_stdin = GetStdHandle(STD_INPUT_HANDLE);
    }
    if (g_stdin == INVALID_HANDLE_VALUE) return -1;

    while (true) {
        size_t pos = g_stdin_pending.find('\n');
        if (pos != std::string::npos) {
            std::string line = g_stdin_pending.substr(0, pos);
            if (!line.empty() && line.back() == '\r') line.pop_back();
            g_stdin_pending.erase(0, pos + 1);
            int n = (int)line.size();
            if (n >= buflen) n = buflen - 1;
            memcpy(buf, line.data(), n);
            buf[n] = 0;
            return n;
        }
        char tmp[4096];
        DWORD readN = 0;
        if (!ReadFile(g_stdin, tmp, sizeof(tmp), &readN, NULL) || readN == 0) {
            return -1;  // EOF or error
        }
        g_stdin_pending.append(tmp, readN);
    }
}

HSPMCP_EXPORT int __stdcall mcp_stdout_write(const char* data, int len) {
    if (!data) return 0;
    if (g_stdout == INVALID_HANDLE_VALUE) {
        g_stdout = GetStdHandle(STD_OUTPUT_HANDLE);
    }
    if (g_stdout == INVALID_HANDLE_VALUE) return 0;
    if (len <= 0) len = (int)strlen(data);
    DWORD written = 0;
    WriteFile(g_stdout, data, (DWORD)len, &written, NULL);
    FlushFileBuffers(g_stdout);
    return (int)written;
}

BOOL WINAPI DllMain(HMODULE, DWORD reason, LPVOID) {
    if (reason == DLL_PROCESS_DETACH) {
        for (int i = 0; i < MAX_PROCS; i++) {
            if (g_procs[i].active) mcp_proc_close(i);
            if (g_procs[i].lock_inited) DeleteCriticalSection(&g_procs[i].lock);
        }
    }
    return TRUE;
}
