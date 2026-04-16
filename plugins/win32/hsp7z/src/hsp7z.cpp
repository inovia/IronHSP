//============================================================
//   hsp7z.dll — 7za.exe subprocess wrapper
//
//   同梱の 7za.exe (7-Zip 公式の standalone CLI) を CreateProcess で
//   起動し、stdout を anonymous pipe で捕まえて HSP に返す薄いラッパ。
//   7z / zip / tar / gz / bz2 / xz / rar(read) など 40+ フォーマット対応。
//
//   7za.exe / 7za_x64.exe は DLL と同じディレクトリに配置。LGPL なので
//   差し替えによるセキュリティアップデートが容易。
//
//   エクスポート:
//     int  sevenz_run(const char* args, char* out_buf, int out_size)
//         args    : 7za.exe に渡すコマンドライン (7za.exe 自体は含めない)
//                   例: "l archive.7z -slt"
//         out_buf : stdout を受け取るバッファ (caller が sdim 済)
//         out_size: out_buf の capacity (終端 null 含む)
//         戻り値: 7za.exe の exit code、 < 0 は内部エラー
//
//     int  sevenz_set_exe(const char* path)
//         7za.exe のパスを明示指定 (空文字で DLL 同梱版に戻す)
//         戻り値: 0=OK
//============================================================

#define WIN32_LEAN_AND_MEAN
#include <windows.h>
#include <string>
#include <vector>
#include <cstdio>

#define HSP7Z_EXPORT extern "C" __declspec(dllexport)

namespace {

static std::string g_exe_path_override;  // user-set override
static std::string g_dll_dir;              // detected at DllMain

// Best-effort detection: 7za_x64.exe if 64bit process, else 7za.exe
std::string resolve_7za() {
    if (!g_exe_path_override.empty()) return g_exe_path_override;
    std::string p = g_dll_dir;
    if (!p.empty() && p.back() != '\\') p += '\\';
#ifdef _WIN64
    std::string cand = p + "7za_x64.exe";
#else
    std::string cand = p + "7za_x86.exe";
#endif
    if (GetFileAttributesA(cand.c_str()) != INVALID_FILE_ATTRIBUTES) return cand;
    cand = p + "7za.exe";
    if (GetFileAttributesA(cand.c_str()) != INVALID_FILE_ATTRIBUTES) return cand;
    return "7za.exe";  // fallback: rely on PATH
}

} // namespace

HSP7Z_EXPORT int __stdcall sevenz_set_exe(const char* path) {
    if (path) g_exe_path_override = path;
    else g_exe_path_override.clear();
    return 0;
}

HSP7Z_EXPORT int __stdcall sevenz_run(const char* args, char* out_buf, int out_size) {
    if (out_buf && out_size > 0) out_buf[0] = 0;
    if (!args) return -1;

    std::string exe = resolve_7za();

    // Build command line: "<exe>" <args>
    std::string cmd = "\"" + exe + "\" " + args;

    SECURITY_ATTRIBUTES sa = {};
    sa.nLength = sizeof(sa);
    sa.bInheritHandle = TRUE;

    HANDLE rd = NULL, wr = NULL;
    if (!CreatePipe(&rd, &wr, &sa, 0)) return -2;
    SetHandleInformation(rd, HANDLE_FLAG_INHERIT, 0);

    STARTUPINFOA si = {};
    si.cb = sizeof(si);
    si.dwFlags = STARTF_USESTDHANDLES | STARTF_USESHOWWINDOW;
    si.wShowWindow = SW_HIDE;
    si.hStdOutput = wr;
    si.hStdError  = wr;
    si.hStdInput  = GetStdHandle(STD_INPUT_HANDLE);

    PROCESS_INFORMATION pi = {};
    std::vector<char> cmdbuf(cmd.begin(), cmd.end());
    cmdbuf.push_back(0);

    BOOL ok = CreateProcessA(
        NULL, cmdbuf.data(), NULL, NULL, TRUE,
        CREATE_NO_WINDOW, NULL, NULL, &si, &pi
    );
    CloseHandle(wr);  // parent keeps only read end

    if (!ok) {
        CloseHandle(rd);
        return -3;
    }

    // Drain stdout into out_buf (ring-fill, discard overflow)
    int written = 0;
    char chunk[4096];
    DWORD got = 0;
    while (ReadFile(rd, chunk, sizeof(chunk), &got, NULL) && got > 0) {
        if (out_buf && out_size > 1) {
            int room = out_size - 1 - written;
            if (room > 0) {
                int copy = ((int)got < room) ? (int)got : room;
                memcpy(out_buf + written, chunk, copy);
                written += copy;
            }
        }
    }
    if (out_buf && out_size > 0) {
        int pos = (written < out_size - 1) ? written : out_size - 1;
        out_buf[pos] = 0;
    }
    CloseHandle(rd);

    WaitForSingleObject(pi.hProcess, INFINITE);
    DWORD exit_code = 0;
    GetExitCodeProcess(pi.hProcess, &exit_code);
    CloseHandle(pi.hProcess);
    CloseHandle(pi.hThread);

    return (int)exit_code;
}

BOOL WINAPI DllMain(HMODULE hModule, DWORD reason, LPVOID) {
    if (reason == DLL_PROCESS_ATTACH) {
        wchar_t wbuf[MAX_PATH];
        DWORD n = GetModuleFileNameW(hModule, wbuf, MAX_PATH);
        if (n > 0 && n < MAX_PATH) {
            int len = WideCharToMultiByte(CP_UTF8, 0, wbuf, (int)n, nullptr, 0, nullptr, nullptr);
            std::string full(len, '\0');
            WideCharToMultiByte(CP_UTF8, 0, wbuf, (int)n, &full[0], len, nullptr, nullptr);
            size_t slash = full.find_last_of("\\/");
            g_dll_dir = (slash == std::string::npos) ? "" : full.substr(0, slash);
        }
    }
    return TRUE;
}
