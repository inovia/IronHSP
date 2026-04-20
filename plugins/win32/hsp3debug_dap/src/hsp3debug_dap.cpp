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
//  Debug log
// -----------------------------------------------------------
#include <stdarg.h>
static void dap_log(const char* fmt, ...) {
    static FILE* f = nullptr;
    static bool tried = false;
    if (!tried) {
        tried = true;
        char path[MAX_PATH] = {0};
        DWORD n = GetEnvironmentVariableA("HSP3DAP_LOG", path, MAX_PATH);
        if (n == 0 || n >= MAX_PATH) {
            GetModuleFileNameA(nullptr, path, MAX_PATH);
            char* slash = strrchr(path, '\\');
            if (slash) strcpy_s(slash + 1, MAX_PATH - (slash - path + 1), "hsp3dap.log");
            else strcpy_s(path, MAX_PATH, "hsp3dap.log");
        }
        fopen_s(&f, path, "w");
    }
    if (!f) return;
    va_list ap; va_start(ap, fmt);
    vfprintf(f, fmt, ap);
    va_end(ap);
    fputc('\n', f);
    fflush(f);
}

// -----------------------------------------------------------
//  Global state
// -----------------------------------------------------------
static HSP3DEBUG* g_dbg = nullptr;
// Two simplex pipes: evt (server writes, client reads) + cmd (server reads,
// client writes). Two pipes avoid the /clr restriction against concurrent
// ReadFile+WriteFile on a single duplex handle from different threads.
static HANDLE    g_pipe_evt = INVALID_HANDLE_VALUE;
static HANDLE    g_pipe_cmd = INVALID_HANDLE_VALUE;
static HANDLE    g_pipe_thread = nullptr;
static std::atomic<bool> g_shutdown{false};

// Breakpoints keyed by file *basename* (lowercase), not full path. VS Code
// sends absolute paths but HSP's dbginfo.fname is usually a relative/leaf
// name, so we normalise both sides to basename + case-folded for matching.
static std::mutex g_bp_mutex;
static std::set<std::pair<std::string, int>> g_breakpoints;

static std::string path_basename_lower(const std::string& p) {
    auto slash = p.find_last_of("/\\");
    std::string b = (slash == std::string::npos) ? p : p.substr(slash + 1);
    for (auto& c : b) c = (char)tolower((unsigned char)c);
    return b;
}

// Exe-exported BP count — we write to this so the dispatch loop can
// cheaply test `hsp3dap_bp_count > 0` without crossing the DLL boundary.
static volatile int* g_exe_bp_count = nullptr;

typedef void (*register_bp_check_fn)(int (*)(const char*, int));

// Exe-exported set/get helpers. Resolved in debugini so we can cheaply
// call them from command handlers.
typedef int      (*fn_get_var_type)  (const char*);
typedef int      (*fn_set_var_int)   (const char*, const int*, int, int);
typedef int      (*fn_set_var_int64) (const char*, const int*, int, long long);
typedef int      (*fn_set_var_double)(const char*, const int*, int, double);
typedef int      (*fn_set_var_str)   (const char*, const int*, int, const char*);
typedef int      (*fn_set_var_wstr)  (const char*, const int*, int, const char*);
static fn_get_var_type   g_fn_get_type = nullptr;
static fn_set_var_int    g_fn_set_int = nullptr;
static fn_set_var_int64  g_fn_set_i64 = nullptr;
static fn_set_var_double g_fn_set_dbl = nullptr;
static fn_set_var_str    g_fn_set_str = nullptr;
static fn_set_var_wstr   g_fn_set_wstr = nullptr;

// HSPVAR_FLAG_* values from hspvar_core.h. Kept in sync.
enum {
    HSP_T_STR    = 2,
    HSP_T_DOUBLE = 3,
    HSP_T_INT    = 4,
    HSP_T_INT64  = 8,
};

// Forward decl — registered with the exe so its dispatch loop can call us
// on every line change to test if the current (file,line) hits a BP.
extern "C" __declspec(dllexport) int __stdcall hsp3dap_check_bp(const char* file, int line);

// Stepping state
static std::atomic<int> g_pending_cmd{0};  // 0=none, 1=continue, 2=step_over,
                                            // 3=step_in, 4=step_out, 5=pause
static std::atomic<bool> g_paused{false};
static bool g_entry_stop_consumed = false;  // guarded by g_bp_mutex
static bool g_step_requested = false;       // guarded by g_bp_mutex

// Adapter notified this handle to signal resume
static HANDLE g_resume_event = nullptr;

// -----------------------------------------------------------
//  Pipe helpers
// -----------------------------------------------------------
static std::mutex g_pipe_write_mutex;
static std::atomic<bool> g_pipe_connected{false};

static bool write_evt_pipe(const std::string& s) {
    if (g_pipe_evt == INVALID_HANDLE_VALUE) return false;
    std::string buf = s + "\n";
    DWORD written = 0;
    std::lock_guard<std::mutex> lock(g_pipe_write_mutex);
    BOOL ok = WriteFile(g_pipe_evt, buf.data(), (DWORD)buf.size(), &written, nullptr);
    if (!ok) {
        dap_log("WriteFile(evt) failed err=%lu len=%zu head=%.60s",
                GetLastError(), buf.size(), s.c_str());
    }
    return ok && written == buf.size();
}

// Either enqueue (if pipe_thread owns the evt write, e.g. inside command
// handling) or write directly (from main thread after adapter is connected).
static bool pipe_write_line(const std::string& s) {
    if (!g_pipe_connected.load()) {
        dap_log("pipe_write skipped (not connected): %.60s", s.c_str());
        return false;
    }
    return write_evt_pipe(s);
}

static bool pipe_read_line(std::string& out) {
    out.clear();
    char c;
    DWORD n;
    for (;;) {
        if (g_shutdown) return false;
        BOOL ok = ReadFile(g_pipe_cmd, &c, 1, &n, nullptr);
        if (!ok) {
            dap_log("ReadFile(cmd) failed err=%lu after %zu bytes",
                    GetLastError(), out.size());
            return false;
        }
        if (n == 0) {
            dap_log("ReadFile(cmd) n=0 after %zu bytes", out.size());
            return false;
        }
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
    auto it = g_breakpoints.find({path_basename_lower(file), line});
    return it != g_breakpoints.end() ? 1 : 0;
}

// Isolated writer wrapped in SEH (must be in a function with no C++ unwinds).
static int seh_write_int(volatile int* dst, int v) {
    __try { *dst = v; return 0; }
    __except (EXCEPTION_EXECUTE_HANDLER) { return (int)GetExceptionCode(); }
}

// Update the exe's BP counter variable. Must be called while g_bp_mutex is
// already held by the caller — this avoids re-locking the non-recursive mutex.
static void sync_bp_count_to_exe_locked() {
    if (!g_exe_bp_count) return;
    int n = (int)g_breakpoints.size();
    int rc = seh_write_int(g_exe_bp_count, n);
    if (rc) dap_log("sync_bp: write raised 0x%08X", rc);
}

// -----------------------------------------------------------
//  Command dispatcher (runs on pipe-reader thread)
// -----------------------------------------------------------
static void handle_command(const std::string& line) {
    std::string cmd = json_get_str(line, "cmd");
    if (cmd == "set_bp") {
        std::string file_raw = json_get_str(line, "file");
        std::string file = path_basename_lower(file_raw);
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
        // Reflect new count back to exe so dispatch loop starts/stops tracing.
        // Caller still holds g_bp_mutex from above (lock is inside the scope).
        sync_bp_count_to_exe_locked();
        pipe_write_line("{\"resp\":\"bp_ack\"}");
    } else if (cmd == "continue") {
        g_pending_cmd = 1;
        if (g_resume_event) SetEvent(g_resume_event);
    } else if (cmd == "step_over") {
        { std::lock_guard<std::mutex> lk(g_bp_mutex); g_step_requested = true; }
        g_pending_cmd = 2;
        if (g_resume_event) SetEvent(g_resume_event);
    } else if (cmd == "step_in") {
        { std::lock_guard<std::mutex> lk(g_bp_mutex); g_step_requested = true; }
        g_pending_cmd = 3;
        if (g_resume_event) SetEvent(g_resume_event);
    } else if (cmd == "step_out") {
        { std::lock_guard<std::mutex> lk(g_bp_mutex); g_step_requested = true; }
        g_pending_cmd = 4;
        if (g_resume_event) SetEvent(g_resume_event);
    } else if (cmd == "pause") {
        g_pending_cmd = 5;  // adapter wants break at next instruction
    } else if (cmd == "get_vars") {
        std::string json = "{\"resp\":\"vars\",\"items\":[";
        if (g_dbg && g_dbg->get_varinf) {
            // Fetch the list of variable names. option=2 includes module-
            // scoped vars (name@module). We cap at 200 to avoid huge payloads.
            char* names_raw = g_dbg->get_varinf((char*)NULL, 2);
            std::string names = names_raw ? names_raw : "";
            bool first = true;
            size_t p = 0;
            int count = 0;
            while (p < names.size() && count < 200) {
                size_t nl = names.find("\r\n", p);
                std::string name = (nl == std::string::npos) ? names.substr(p)
                                                             : names.substr(p, nl - p);
                p = (nl == std::string::npos) ? names.size() : nl + 2;
                if (name.empty()) continue;

                // Fetch per-variable details (type + dump).
                char* detail = g_dbg->get_varinf((char*)name.c_str(), 0);
                std::string info = detail ? detail : "";

                // Extract type: look for lines starting with 型: or Type:
                std::string vtype = "?";
                auto find_line = [&](const char* key) -> std::string {
                    auto tp = info.find(key);
                    if (tp == std::string::npos) return "";
                    tp += strlen(key);
                    auto te = info.find("\r\n", tp);
                    if (te == std::string::npos) te = info.size();
                    return info.substr(tp, te - tp);
                };
                std::string t = find_line("\xe5\x9e\x8b:");  // "型:" UTF-8
                if (t.empty()) t = find_line("Type:");
                if (!t.empty()) vtype = t;

                // Value: truncate info to something readable
                std::string value = info;
                if (value.size() > 512) value = value.substr(0, 512) + "...";

                if (!first) json += ",";
                first = false;
                json += "{\"name\":\"" + json_esc(name) +
                        "\",\"type\":\"" + json_esc(vtype) +
                        "\",\"value\":\"" + json_esc(value) +
                        "\",\"variablesReference\":0}";
                ++count;
            }
        }
        json += "]}";
        pipe_write_line(json);
    } else if (cmd == "get_callstack") {
        std::string json = "{\"resp\":\"callstack\",\"frames\":[";
        bool first = true;

        // Frame 0 = current position (top of stack).
        if (g_dbg && g_dbg->fname) {
            char cur[1024];
            sprintf_s(cur, "{\"name\":\"(current)\",\"file\":\"%s\",\"line\":%d}",
                      json_esc(g_dbg->fname).c_str(), g_dbg->line);
            json += cur;
            first = false;
        }

        // Remaining frames from dbg_callstack (each line is "file:line").
        if (g_dbg && g_dbg->dbg_callstack) {
            char* raw = g_dbg->dbg_callstack();
            std::string s = raw ? raw : "";
            size_t p = 0;
            int idx = 1;
            while (p < s.size()) {
                size_t nl = s.find("\r\n", p);
                std::string line = (nl == std::string::npos) ? s.substr(p)
                                                             : s.substr(p, nl - p);
                p = (nl == std::string::npos) ? s.size() : nl + 2;
                if (line.empty()) continue;
                // Split at last ':' (Windows drive letter contains ':').
                auto colon = line.rfind(':');
                std::string file = line;
                int lineno = 0;
                if (colon != std::string::npos) {
                    file = line.substr(0, colon);
                    std::string ln = line.substr(colon + 1);
                    while (!ln.empty() && (ln.back() == ' ' || ln.back() == '\r')) ln.pop_back();
                    lineno = atoi(ln.c_str());
                }
                if (!first) json += ",";
                first = false;
                char buf[1024];
                sprintf_s(buf, "{\"name\":\"gosub#%d\",\"file\":\"%s\",\"line\":%d}",
                          idx, json_esc(file).c_str(), lineno);
                json += buf;
                ++idx;
            }
        }

        json += "]}";
        pipe_write_line(json);
    } else if (cmd == "set_var" || cmd == "evaluate") {
        // Common flow: resolve name + indices + value, dispatch to exe setter
        // based on current var type, serialize response.
        std::string vname, vvalue;
        int idx[4] = {0,0,0,0};
        int num_idx = 0;
        bool parse_ok = true;

        if (cmd == "set_var") {
            vname = json_get_str(line, "name");
            vvalue = json_get_str(line, "value");
            // Parse "indices":[N,M,...]
            auto p = line.find("\"indices\"");
            if (p != std::string::npos) {
                p = line.find('[', p);
                if (p != std::string::npos) {
                    auto e = line.find(']', p);
                    if (e != std::string::npos) {
                        size_t i = p + 1;
                        while (i < e && num_idx < 4) {
                            while (i < e && !(isdigit((unsigned char)line[i]) || line[i] == '-')) i++;
                            if (i >= e) break;
                            bool neg = false;
                            if (line[i] == '-') { neg = true; i++; }
                            int v = 0;
                            while (i < e && isdigit((unsigned char)line[i])) { v = v*10 + (line[i]-'0'); i++; }
                            idx[num_idx++] = neg ? -v : v;
                        }
                    }
                }
            }
        } else {
            // evaluate: parse "name[(i,j,..)] = value" from expr
            std::string expr = json_get_str(line, "expr");
            auto eq = expr.find('=');
            if (eq == std::string::npos) { parse_ok = false; }
            else {
                auto trim = [](std::string s){
                    size_t a=0,b=s.size();
                    while (a<b && isspace((unsigned char)s[a])) a++;
                    while (b>a && isspace((unsigned char)s[b-1])) b--;
                    return s.substr(a,b-a);
                };
                std::string lhs = trim(expr.substr(0, eq));
                vvalue = trim(expr.substr(eq + 1));
                // Strip surrounding quotes from value if present
                if (vvalue.size() >= 2 && vvalue.front() == '"' && vvalue.back() == '"') {
                    vvalue = vvalue.substr(1, vvalue.size() - 2);
                }
                auto paren = lhs.find('(');
                if (paren == std::string::npos) {
                    vname = lhs;
                } else {
                    vname = trim(lhs.substr(0, paren));
                    auto close = lhs.rfind(')');
                    if (close == std::string::npos || close < paren) { parse_ok = false; }
                    else {
                        std::string ixs = lhs.substr(paren + 1, close - paren - 1);
                        size_t i = 0;
                        while (i < ixs.size() && num_idx < 4) {
                            while (i < ixs.size() && (isspace((unsigned char)ixs[i]) || ixs[i] == ',')) i++;
                            if (i >= ixs.size()) break;
                            bool neg = false;
                            if (ixs[i] == '-') { neg = true; i++; }
                            int v = 0;
                            while (i < ixs.size() && isdigit((unsigned char)ixs[i])) { v = v*10 + (ixs[i]-'0'); i++; }
                            idx[num_idx++] = neg ? -v : v;
                        }
                    }
                }
            }
        }

        const char* resp_key = (cmd == "set_var") ? "set_var" : "evaluate";
        if (!parse_ok || vname.empty() || !g_fn_get_type) {
            pipe_write_line(std::string("{\"resp\":\"") + resp_key +
                            "\",\"ok\":0,\"error\":\"parse_error\"}");
        } else {
            int vtype = g_fn_get_type(vname.c_str());
            int rc = -99;
            if (vtype < 0) {
                rc = -1;  // not found
            } else if (vtype == HSP_T_INT && g_fn_set_int) {
                rc = g_fn_set_int(vname.c_str(), idx, num_idx, atoi(vvalue.c_str()));
            } else if (vtype == HSP_T_INT64 && g_fn_set_i64) {
                rc = g_fn_set_i64(vname.c_str(), idx, num_idx, _atoi64(vvalue.c_str()));
            } else if (vtype == HSP_T_DOUBLE && g_fn_set_dbl) {
                rc = g_fn_set_dbl(vname.c_str(), idx, num_idx, atof(vvalue.c_str()));
            } else if (vtype == HSP_T_STR && g_fn_set_str) {
                rc = g_fn_set_str(vname.c_str(), idx, num_idx, vvalue.c_str());
            } else if (g_fn_set_wstr) {
                // Fallback: try wstr (IronHSP extension). The runtime verifies
                // the type name inside and returns -2 on mismatch.
                rc = g_fn_set_wstr(vname.c_str(), idx, num_idx, vvalue.c_str());
            }

            const char* err = "";
            switch (rc) {
                case 0:  err = ""; break;
                case -1: err = "not_found"; break;
                case -2: err = "type_mismatch"; break;
                case -3: err = "index_out_of_range"; break;
                default: err = "unknown"; break;
            }

            std::string r = std::string("{\"resp\":\"") + resp_key + "\"";
            if (rc == 0) {
                r += ",\"ok\":1,\"result\":\"" + json_esc(vvalue) + "\"}";
            } else {
                r += ",\"ok\":0,\"error\":\"";
                r += err;
                r += "\"}";
            }
            pipe_write_line(r);
        }
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
    char evt_name[128], cmd_name[128];
    DWORD pid = GetCurrentProcessId();
    sprintf_s(evt_name, "\\\\.\\pipe\\hsp3dap_%lu_evt", pid);
    sprintf_s(cmd_name, "\\\\.\\pipe\\hsp3dap_%lu_cmd", pid);

    g_pipe_evt = CreateNamedPipeA(
        evt_name, PIPE_ACCESS_OUTBOUND,
        PIPE_TYPE_BYTE | PIPE_WAIT, 1, 65536, 65536, 0, nullptr);
    g_pipe_cmd = CreateNamedPipeA(
        cmd_name, PIPE_ACCESS_INBOUND,
        PIPE_TYPE_BYTE | PIPE_READMODE_BYTE | PIPE_WAIT,
        1, 65536, 65536, 0, nullptr);
    if (g_pipe_evt == INVALID_HANDLE_VALUE || g_pipe_cmd == INVALID_HANDLE_VALUE) {
        dap_log("CreateNamedPipe failed (evt=%p cmd=%p)", g_pipe_evt, g_pipe_cmd);
        return 1;
    }
    dap_log("pipes created, waiting for adapter");

    // Adapter must connect evt first, then cmd — we wait for both in order.
    if (!ConnectNamedPipe(g_pipe_evt, nullptr) &&
        GetLastError() != ERROR_PIPE_CONNECTED) {
        dap_log("ConnectNamedPipe(evt) failed err=%lu", GetLastError());
        return 1;
    }
    if (!ConnectNamedPipe(g_pipe_cmd, nullptr) &&
        GetLastError() != ERROR_PIPE_CONNECTED) {
        dap_log("ConnectNamedPipe(cmd) failed err=%lu", GetLastError());
        return 1;
    }

    dap_log("pipes connected, sending ready");
    g_pipe_connected = true;
    write_evt_pipe("{\"evt\":\"ready\"}");

    // Command loop
    std::string line;
    while (!g_shutdown) {
        if (!pipe_read_line(line)) {
            dap_log("pipe_read_line returned false (EOF or error)");
            break;
        }
        dap_log("cmd rx: %.100s", line.c_str());
        handle_command(line);
        dap_log("cmd done: %.60s", line.c_str());
    }

    dap_log("pipe thread exiting");
    g_pipe_connected = false;
    DisconnectNamedPipe(g_pipe_evt);
    DisconnectNamedPipe(g_pipe_cmd);
    CloseHandle(g_pipe_evt);
    CloseHandle(g_pipe_cmd);
    g_pipe_evt = g_pipe_cmd = INVALID_HANDLE_VALUE;
    return 0;
}

// -----------------------------------------------------------
//  HSP3DEBUG entry points (stdcall exports)
// -----------------------------------------------------------
extern "C" __declspec(dllexport) BOOL __stdcall debugini(HSP3DEBUG* dbg, int p2, int p3, int p4) {
    (void)p2; (void)p3; (void)p4;
    dap_log("debugini enter, dbg=%p", dbg);
    g_dbg = dbg;
    g_resume_event = CreateEvent(nullptr, FALSE, FALSE, nullptr);

    // Hook into the host exe: register our BP check callback and resolve the
    // exe-exported counter so we can wake the dispatch-loop trace cheaply.
    HMODULE exe = GetModuleHandleA(NULL);
    if (exe) {
        g_exe_bp_count = (volatile int*)GetProcAddress(exe, "hsp3dap_bp_count");
        auto reg = (register_bp_check_fn)GetProcAddress(exe, "hsp3dap_register_bp_check");
        if (reg) reg(hsp3dap_check_bp);
        dap_log("exe hooks: bp_count=%p reg=%p", g_exe_bp_count, reg);

        // Force first-line stop: STEPIN mode makes code_dbgtrace fire on
        // every line change. The adapter can switch to RUN after setting BPs.
        auto force_step = (void(*)())GetProcAddress(exe, "hsp3dap_force_step");
        if (force_step) force_step();
        dap_log("force_step=%p", force_step);

        // Variable write-back hooks.
        g_fn_get_type  = (fn_get_var_type)  GetProcAddress(exe, "hsp3dap_get_var_type");
        g_fn_set_int   = (fn_set_var_int)   GetProcAddress(exe, "hsp3dap_set_var_int");
        g_fn_set_i64   = (fn_set_var_int64) GetProcAddress(exe, "hsp3dap_set_var_int64");
        g_fn_set_dbl   = (fn_set_var_double)GetProcAddress(exe, "hsp3dap_set_var_double");
        g_fn_set_str   = (fn_set_var_str)   GetProcAddress(exe, "hsp3dap_set_var_str");
        g_fn_set_wstr  = (fn_set_var_wstr)  GetProcAddress(exe, "hsp3dap_set_var_wstr");
        dap_log("set_var hooks: type=%p int=%p i64=%p dbl=%p str=%p wstr=%p",
                g_fn_get_type, g_fn_set_int, g_fn_set_i64, g_fn_set_dbl, g_fn_set_str, g_fn_set_wstr);
    }

    g_pipe_thread = CreateThread(nullptr, 0, pipe_thread_proc, nullptr, 0, nullptr);
    dap_log("debugini done");
    return TRUE;
}

extern "C" __declspec(dllexport) BOOL __stdcall debug_notice(HSP3DEBUG* dbg, int cause, int p3, int p4) {
    (void)cause; (void)p3; (void)p4;
    if (!dbg) return FALSE;
    g_dbg = dbg;

    // Refresh current line/file
    if (dbg->dbg_curinf) dbg->dbg_curinf();

    // Classify stop reason by inspecting our own state — the upstream `cause`
    // parameter isn't populated by hsp3's dispatch loop.
    const char* reason = "step";
    {
        std::lock_guard<std::mutex> lock(g_bp_mutex);
        if (!g_entry_stop_consumed) {
            reason = "entry";
            g_entry_stop_consumed = true;
        } else if (!g_breakpoints.empty() && dbg->fname &&
                   g_breakpoints.find({path_basename_lower(dbg->fname), dbg->line}) != g_breakpoints.end()) {
            reason = "breakpoint";
        } else if (g_step_requested) {
            reason = "step";
            g_step_requested = false;
        } else {
            reason = "pause";
        }
    }

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
        if (g_pipe_evt != INVALID_HANDLE_VALUE) CloseHandle(g_pipe_evt);
        if (g_pipe_cmd != INVALID_HANDLE_VALUE) CloseHandle(g_pipe_cmd);
    }
    return TRUE;
}
