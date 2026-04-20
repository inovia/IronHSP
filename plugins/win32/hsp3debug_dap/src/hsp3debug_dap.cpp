//============================================================
//  hsp3debug_dap.cpp
//
//  HSP3 ランタイム (hsp3cl_net_dbg_64.exe) 用の DAP ブリッジ DLL。
//  hsp3cl_net が LoadLibrary で "hsp3debug.dll" をロードし、
//  debugini / debug_notice を呼ぶ流れに乗せる。
//
//  外部仕様 (名前付きパイプ経由の wire protocol):
//    Transport : \\.\pipe\hsp3dap_<pid>
//    Format    : UTF-8 line-delimited JSON (1 メッセージ = 1 行, LF 終端)
//
//  DLL → ADAPTER (events):
//    {"evt":"ready"}
//    {"evt":"stopped","reason":"entry|breakpoint|step|pause|exception","line":N,"file":"path"}
//    {"evt":"terminated","exit":N}
//
//  ADAPTER → DLL (commands):
//    {"cmd":"set_bp","file":"path","lines":[10,20,...]}
//    {"cmd":"continue"} / {"cmd":"step_over"} / {"cmd":"step_in"} / {"cmd":"step_out"}
//    {"cmd":"pause"}
//    {"cmd":"get_vars"} → {"resp":"vars","items":[{"name":...,"type":...,"value":...}]}
//    {"cmd":"get_callstack"} → {"resp":"callstack","frames":[{"name":...,"file":...,"line":...}]}
//    {"cmd":"evaluate","expr":"..."}
//
//  Adapter (nhspdap.exe) は nhspdap プロジェクト側。
//============================================================

#define WIN32_LEAN_AND_MEAN
#include <windows.h>
#include <stdio.h>
#include <string.h>
#include <string>
#include <set>
#include <mutex>
#include <atomic>

#include "hsp3debug.h"

// HSP3DEBUG callbacks expect these context accessors from runtime:
extern "C" {
    // Provided by hsp3net runtime (hsp3code.cpp).
    // These are dynamically resolved at runtime via GetProcAddress on the
    // hosting exe (hsp3cl_net_dbg_64.exe) since the DLL is loaded by
    // the exe, not the other way around.
}

// -----------------------------------------------------------
//  Global state
// -----------------------------------------------------------
static HSP3DEBUG* g_dbg = nullptr;
static HANDLE    g_pipe = INVALID_HANDLE_VALUE;
static HANDLE    g_pipe_thread = nullptr;
static std::atomic<bool> g_shutdown{false};

// Breakpoints: file -> set of lines
static std::mutex g_bp_mutex;
static std::set<std::pair<std::string, int>> g_breakpoints;

// Exe-exported BP count — we write to this so the dispatch loop can
// cheaply test `hsp3dap_bp_count > 0` without crossing the DLL boundary.
static volatile int* g_exe_bp_count = nullptr;

typedef void (*register_bp_check_fn)(int (*)(const char*, int));

// Forward decl — registered with the exe so its dispatch loop can call us
// on every line change to test if the current (file,line) hits a BP.
extern "C" __declspec(dllexport) int __stdcall hsp3dap_check_bp(const char* file, int line);

// Stepping state
static std::atomic<int> g_pending_cmd{0};  // 0=none, 1=continue, 2=step_over,
                                            // 3=step_in, 4=step_out, 5=pause
static std::atomic<bool> g_paused{false};

// Adapter notified this handle to signal resume
static HANDLE g_resume_event = nullptr;

// -----------------------------------------------------------
//  Pipe helpers
// -----------------------------------------------------------
static bool pipe_write_line(const std::string& s) {
    if (g_pipe == INVALID_HANDLE_VALUE) return false;
    std::string buf = s + "\n";
    DWORD written = 0;
    BOOL ok = WriteFile(g_pipe, buf.data(), (DWORD)buf.size(), &written, nullptr);
    return ok && written == buf.size();
}

static bool pipe_read_line(std::string& out) {
    out.clear();
    char c;
    DWORD n;
    for (;;) {
        if (g_shutdown) return false;
        if (!ReadFile(g_pipe, &c, 1, &n, nullptr) || n == 0) return false;
        if (c == '\n') return true;
        if (c != '\r') out.push_back(c);
    }
}

// -----------------------------------------------------------
//  Minimal JSON helpers (single-value extraction only)
// -----------------------------------------------------------
static std::string json_esc(const std::string& s) {
    std::string o; o.reserve(s.size() + 2);
    for (char c : s) {
        switch (c) {
            case '"':  o += "\\\""; break;
            case '\\': o += "\\\\"; break;
            case '\n': o += "\\n";  break;
            case '\r': o += "\\r";  break;
            case '\t': o += "\\t";  break;
            default:
                if ((unsigned char)c < 0x20) { char b[8]; sprintf(b, "\\u%04x", c); o += b; }
                else o.push_back(c);
        }
    }
    return o;
}

// "key":"value"   / "key":123  — literal value after "key": extracted
static std::string json_get_str(const std::string& j, const std::string& key) {
    std::string needle = "\"" + key + "\"";
    auto p = j.find(needle);
    if (p == std::string::npos) return "";
    p = j.find(':', p + needle.size());
    if (p == std::string::npos) return "";
    p = j.find('"', p);
    if (p == std::string::npos) return "";
    ++p;
    std::string out;
    while (p < j.size() && j[p] != '"') {
        if (j[p] == '\\' && p + 1 < j.size()) { out.push_back(j[p+1]); p += 2; }
        else out.push_back(j[p++]);
    }
    return out;
}

// -----------------------------------------------------------
//  Breakpoint check (called from dispatch loop via hook)
// -----------------------------------------------------------
extern "C" __declspec(dllexport) int __stdcall hsp3dap_check_bp(const char* file, int line) {
    if (!g_dbg) return 0;
    std::lock_guard<std::mutex> lock(g_bp_mutex);
    if (g_breakpoints.empty()) return 0;
    if (!file) return 0;
    auto it = g_breakpoints.find({std::string(file), line});
    return it != g_breakpoints.end() ? 1 : 0;
}

// Update the exe's BP counter variable (if we resolved it successfully).
static void sync_bp_count_to_exe() {
    if (!g_exe_bp_count) return;
    std::lock_guard<std::mutex> lock(g_bp_mutex);
    *g_exe_bp_count = (int)g_breakpoints.size();
}

// -----------------------------------------------------------
//  Command dispatcher (runs on pipe-reader thread)
// -----------------------------------------------------------
static void handle_command(const std::string& line) {
    std::string cmd = json_get_str(line, "cmd");
    if (cmd == "set_bp") {
        std::string file = json_get_str(line, "file");
        std::lock_guard<std::mutex> lock(g_bp_mutex);
        // Remove all BPs for this file
        for (auto it = g_breakpoints.begin(); it != g_breakpoints.end();) {
            if (it->first == file) it = g_breakpoints.erase(it);
            else ++it;
        }
        // Parse "lines":[N,M,...]
        auto p = line.find("\"lines\"");
        if (p != std::string::npos) {
            p = line.find('[', p);
            if (p != std::string::npos) {
                auto e = line.find(']', p);
                if (e != std::string::npos) {
                    std::string nums = line.substr(p + 1, e - p - 1);
                    size_t i = 0;
                    while (i < nums.size()) {
                        while (i < nums.size() && !isdigit((unsigned char)nums[i])) ++i;
                        if (i >= nums.size()) break;
                        int v = 0;
                        while (i < nums.size() && isdigit((unsigned char)nums[i])) {
                            v = v * 10 + (nums[i] - '0'); ++i;
                        }
                        g_breakpoints.insert({file, v});
                    }
                }
            }
        }
        // Reflect new count back to exe so dispatch loop starts/stops tracing
        sync_bp_count_to_exe();
        pipe_write_line("{\"resp\":\"bp_ack\"}");
    } else if (cmd == "continue") {
        g_pending_cmd = 1;
        if (g_resume_event) SetEvent(g_resume_event);
    } else if (cmd == "step_over") {
        g_pending_cmd = 2;
        if (g_resume_event) SetEvent(g_resume_event);
    } else if (cmd == "step_in") {
        g_pending_cmd = 3;
        if (g_resume_event) SetEvent(g_resume_event);
    } else if (cmd == "step_out") {
        g_pending_cmd = 4;
        if (g_resume_event) SetEvent(g_resume_event);
    } else if (cmd == "pause") {
        g_pending_cmd = 5;  // adapter wants break at next instruction
    } else if (cmd == "get_vars") {
        // MVP: empty response (wired in Phase 5)
        pipe_write_line("{\"resp\":\"vars\",\"items\":[]}");
    } else if (cmd == "get_callstack") {
        // MVP: empty response (wired in Phase 5)
        pipe_write_line("{\"resp\":\"callstack\",\"frames\":[]}");
    } else if (cmd == "disconnect") {
        g_shutdown = true;
        g_pending_cmd = 1;  // let runtime continue and exit
        if (g_resume_event) SetEvent(g_resume_event);
    }
}

// -----------------------------------------------------------
//  Pipe server thread
// -----------------------------------------------------------
static DWORD WINAPI pipe_thread_proc(LPVOID) {
    char pipe_name[128];
    sprintf_s(pipe_name, "\\\\.\\pipe\\hsp3dap_%lu", GetCurrentProcessId());

    g_pipe = CreateNamedPipeA(
        pipe_name,
        PIPE_ACCESS_DUPLEX,
        PIPE_TYPE_BYTE | PIPE_READMODE_BYTE | PIPE_WAIT,
        1, 65536, 65536, 0, nullptr);
    if (g_pipe == INVALID_HANDLE_VALUE) return 1;

    // Wait for adapter connection (blocks until nhspdap connects)
    if (!ConnectNamedPipe(g_pipe, nullptr) &&
        GetLastError() != ERROR_PIPE_CONNECTED) {
        CloseHandle(g_pipe);
        g_pipe = INVALID_HANDLE_VALUE;
        return 1;
    }

    pipe_write_line("{\"evt\":\"ready\"}");

    // Command loop
    std::string line;
    while (!g_shutdown && pipe_read_line(line)) {
        handle_command(line);
    }

    DisconnectNamedPipe(g_pipe);
    CloseHandle(g_pipe);
    g_pipe = INVALID_HANDLE_VALUE;
    return 0;
}

// -----------------------------------------------------------
//  HSP3DEBUG entry points (stdcall exports)
// -----------------------------------------------------------
extern "C" __declspec(dllexport) BOOL __stdcall debugini(HSP3DEBUG* dbg, int p2, int p3, int p4) {
    (void)p2; (void)p3; (void)p4;
    g_dbg = dbg;
    g_resume_event = CreateEvent(nullptr, FALSE, FALSE, nullptr);

    // Hook into the host exe: register our BP check callback and resolve the
    // exe-exported counter so we can wake the dispatch-loop trace cheaply.
    HMODULE exe = GetModuleHandleA(NULL);
    if (exe) {
        g_exe_bp_count = (volatile int*)GetProcAddress(exe, "hsp3dap_bp_count");
        auto reg = (register_bp_check_fn)GetProcAddress(exe, "hsp3dap_register_bp_check");
        if (reg) reg(hsp3dap_check_bp);
    }

    g_pipe_thread = CreateThread(nullptr, 0, pipe_thread_proc, nullptr, 0, nullptr);
    // Start in STOP mode so adapter can set breakpoints before first line
    if (dbg && dbg->dbg_set) dbg->dbg_set(HSPDEBUG_STOP);
    return TRUE;
}

extern "C" __declspec(dllexport) BOOL __stdcall debug_notice(HSP3DEBUG* dbg, int cause, int p3, int p4) {
    (void)p3; (void)p4;
    if (!dbg) return FALSE;
    g_dbg = dbg;

    // Refresh current line/file
    if (dbg->dbg_curinf) dbg->dbg_curinf();

    // Classify stop reason
    const char* reason = "step";
    if (cause == 0) reason = "entry";       // initial stop after launch
    else if (cause == 1) reason = "breakpoint";
    else if (cause == 2) reason = "pause";
    else if (cause == 3) reason = "exception";

    // Notify adapter
    char evt[1024];
    const char* fname = dbg->fname ? dbg->fname : "";
    sprintf_s(evt, "{\"evt\":\"stopped\",\"reason\":\"%s\",\"line\":%d,\"file\":\"%s\"}",
              reason, dbg->line, fname);
    pipe_write_line(evt);

    g_paused = true;

    // Wait for resume (pipe reader thread sets the event when cmd arrives)
    while (!g_shutdown) {
        WaitForSingleObject(g_resume_event, INFINITE);
        int cmd = g_pending_cmd.exchange(0);
        if (cmd == 1) {  // continue
            if (dbg->dbg_set) dbg->dbg_set(HSPDEBUG_RUN);
            break;
        } else if (cmd == 2 || cmd == 3) {  // step_over / step_in
            if (dbg->dbg_set) dbg->dbg_set(HSPDEBUG_STEPIN);
            break;
        } else if (cmd == 4) {  // step_out (MVP: treat as continue)
            if (dbg->dbg_set) dbg->dbg_set(HSPDEBUG_RUN);
            break;
        }
    }

    g_paused = false;
    return TRUE;
}

// -----------------------------------------------------------
//  DllMain
// -----------------------------------------------------------
BOOL APIENTRY DllMain(HMODULE, DWORD reason, LPVOID) {
    if (reason == DLL_PROCESS_DETACH) {
        g_shutdown = true;
        if (g_resume_event) SetEvent(g_resume_event);
        if (g_pipe != INVALID_HANDLE_VALUE) CloseHandle(g_pipe);
    }
    return TRUE;
}
