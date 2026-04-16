//
//  iron_test_runner.exe
//
//  Runs a set of HSP test scripts under hsp3cl_net_test_64.exe (or similar
//  test runtime), captures the stderr NDJSON event stream from each run,
//  aggregates pass/fail/error counts per file and overall, and prints a
//  colored summary suitable for CI consumption.
//
//  Usage:
//    iron_test_runner.exe [options] <file-or-glob> [...]
//    Options:
//      --runtime=<exe>     test runtime executable (default: hsp3cl_net_test_64.exe)
//      --compiler=<exe>    hsp compiler (default: hspcmp64.exe)
//      --syspath=<dir>     --syspath value passed to hspcmp
//      --compath=<dir>     --compath value passed to hspcmp
//      --json=<file>       also write a machine-readable JSON summary
//      --no-compile        .hsp inputs are treated as .ax (skip compile)
//      --quiet             suppress per-event detail (summary only)
//      --verbose           dump all raw events per file
//
//  Exit code:  (failed_expects + error_files).  0 means all green.
//
#define WIN32_LEAN_AND_MEAN
#include <windows.h>
#include <stdio.h>
#include <string.h>
#include <stdint.h>
#include <time.h>

#include <string>
#include <vector>
#include <unordered_map>
#include <thread>
#include <mutex>
#include <atomic>

//============================================================
//  tiny utility
//============================================================

static bool g_verbose = false;
static bool g_quiet   = false;
static bool g_use_color = true;

static std::string wstr_to_utf8(const std::wstring& w)
{
    if (w.empty()) return {};
    int n = WideCharToMultiByte(CP_UTF8, 0, w.data(), (int)w.size(), NULL, 0, NULL, NULL);
    std::string s(n, 0);
    WideCharToMultiByte(CP_UTF8, 0, w.data(), (int)w.size(), s.data(), n, NULL, NULL);
    return s;
}

static std::wstring utf8_to_wstr(const std::string& s)
{
    if (s.empty()) return {};
    int n = MultiByteToWideChar(CP_UTF8, 0, s.data(), (int)s.size(), NULL, 0);
    std::wstring w(n, 0);
    MultiByteToWideChar(CP_UTF8, 0, s.data(), (int)s.size(), w.data(), n);
    return w;
}

static void enable_vt_mode()
{
    HANDLE h = GetStdHandle(STD_OUTPUT_HANDLE);
    if (h == INVALID_HANDLE_VALUE) return;
    DWORD mode = 0;
    if (!GetConsoleMode(h, &mode)) { g_use_color = false; return; }
    SetConsoleMode(h, mode | ENABLE_VIRTUAL_TERMINAL_PROCESSING);
}

static const char* col_red()   { return g_use_color ? "\x1b[31m" : ""; }
static const char* col_grn()   { return g_use_color ? "\x1b[32m" : ""; }
static const char* col_yel()   { return g_use_color ? "\x1b[33m" : ""; }
static const char* col_cyn()   { return g_use_color ? "\x1b[36m" : ""; }
static const char* col_dim()   { return g_use_color ? "\x1b[90m" : ""; }
static const char* col_rst()   { return g_use_color ? "\x1b[0m"  : ""; }

//============================================================
//  minimal JSON value extraction (for our own event format)
//
//  event is one line shaped like:
//    {"time":"...","type":"...","case":"...","pass":3,"fail":0,...}
//  we just scan for "KEY": and pull the value up to the next ',' or '}'.
//============================================================

static bool json_find_value(const std::string& s, const char* key, std::string& out)
{
    std::string needle = "\"";
    needle += key;
    needle += "\":";
    size_t p = s.find(needle);
    if (p == std::string::npos) return false;
    p += needle.size();
    while (p < s.size() && (s[p] == ' ' || s[p] == '\t')) p++;
    if (p >= s.size()) return false;
    if (s[p] == '"') {
        // quoted string
        p++;
        std::string v;
        while (p < s.size() && s[p] != '"') {
            if (s[p] == '\\' && p + 1 < s.size()) {
                char c = s[p + 1];
                switch (c) {
                    case 'n':  v += '\n'; break;
                    case 'r':  v += '\r'; break;
                    case 't':  v += '\t'; break;
                    case '"':  v += '"';  break;
                    case '\\': v += '\\'; break;
                    case '/':  v += '/';  break;
                    default:   v += c;    break;
                }
                p += 2;
            } else {
                v += s[p];
                p++;
            }
        }
        out = v;
        return true;
    } else {
        // number / bool / null — read until delimiter
        size_t e = p;
        while (e < s.size() && s[e] != ',' && s[e] != '}' && s[e] != ' ' && s[e] != '\n' && s[e] != '\r' && s[e] != '\t') e++;
        out = s.substr(p, e - p);
        return true;
    }
}

static int json_int(const std::string& s, const char* key, int def = 0)
{
    std::string v;
    if (!json_find_value(s, key, v)) return def;
    return atoi(v.c_str());
}

static std::string json_str(const std::string& s, const char* key)
{
    std::string v;
    json_find_value(s, key, v);
    return v;
}

//============================================================
//  subprocess runner: capture stderr as NDJSON, discard stdout
//============================================================

struct RunResult
{
    DWORD       exit_code    = 0;
    bool        spawn_failed = false;
    std::string stderr_text;
    std::string stdout_text;
};

// extra_env: L"KEY1=val1\0KEY2=val2\0" 形式の追加環境変数 (NUL 区切り、空で終端)
// 親プロセスの環境をベースに extra を追加して子プロセスに渡す。
static std::wstring build_env_block(const std::wstring& extra_env)
{
    // 親の環境ブロックを取得
    LPWCH parent = GetEnvironmentStringsW();
    std::wstring env;
    if (parent) {
        LPWCH p = parent;
        while (*p) {
            size_t len = wcslen(p);
            env.append(p, len);
            env.push_back(L'\0');
            p += len + 1;
        }
        FreeEnvironmentStringsW(parent);
    }
    env += extra_env;
    env.push_back(L'\0');
    return env;
}

static RunResult run_capture(const std::wstring& cmd, const std::wstring& cwd = L"",
                             const std::wstring& extra_env = L"")
{
    RunResult r;

    SECURITY_ATTRIBUTES sa = { sizeof(sa), NULL, TRUE };
    HANDLE err_rd = NULL, err_wr = NULL;
    HANDLE out_rd = NULL, out_wr = NULL;
    if (!CreatePipe(&err_rd, &err_wr, &sa, 0)) { r.spawn_failed = true; return r; }
    SetHandleInformation(err_rd, HANDLE_FLAG_INHERIT, 0);
    if (!CreatePipe(&out_rd, &out_wr, &sa, 0)) { r.spawn_failed = true; CloseHandle(err_rd); CloseHandle(err_wr); return r; }
    SetHandleInformation(out_rd, HANDLE_FLAG_INHERIT, 0);

    STARTUPINFOW si = { sizeof(si) };
    si.dwFlags    = STARTF_USESTDHANDLES;
    si.hStdInput  = GetStdHandle(STD_INPUT_HANDLE);
    si.hStdOutput = out_wr;
    si.hStdError  = err_wr;

    PROCESS_INFORMATION pi = { 0 };
    std::wstring cmd_mut = cmd; // CreateProcessW may modify cmdline buffer

    std::wstring env_block;
    LPVOID env_ptr = NULL;
    if (!extra_env.empty()) {
        env_block = build_env_block(extra_env);
        env_ptr   = (LPVOID)env_block.data();
    }

    BOOL ok = CreateProcessW(NULL, cmd_mut.data(), NULL, NULL, TRUE,
                             CREATE_NO_WINDOW | CREATE_UNICODE_ENVIRONMENT,
                             env_ptr,
                             cwd.empty() ? NULL : cwd.c_str(),
                             &si, &pi);
    CloseHandle(err_wr);
    CloseHandle(out_wr);
    if (!ok) {
        r.spawn_failed = true;
        CloseHandle(err_rd); CloseHandle(out_rd);
        return r;
    }

    // Drain both pipes
    HANDLE handles[2] = { err_rd, out_rd };
    std::string* dsts[2] = { &r.stderr_text, &r.stdout_text };
    char buf[4096];
    bool closed[2] = { false, false };
    while (!closed[0] || !closed[1]) {
        for (int i = 0; i < 2; i++) {
            if (closed[i]) continue;
            DWORD avail = 0;
            if (!PeekNamedPipe(handles[i], NULL, 0, NULL, &avail, NULL)) {
                closed[i] = true;
                continue;
            }
            if (avail > 0) {
                DWORD got = 0;
                if (ReadFile(handles[i], buf, sizeof(buf), &got, NULL) && got > 0) {
                    dsts[i]->append(buf, got);
                    continue;
                } else {
                    closed[i] = true;
                }
            }
        }
        if (WaitForSingleObject(pi.hProcess, 10) == WAIT_OBJECT_0) {
            // process done; drain the rest then break
            for (int i = 0; i < 2; i++) {
                if (closed[i]) continue;
                DWORD got = 0;
                while (ReadFile(handles[i], buf, sizeof(buf), &got, NULL) && got > 0) {
                    dsts[i]->append(buf, got);
                }
                closed[i] = true;
            }
            break;
        }
    }

    DWORD ec = 0;
    GetExitCodeProcess(pi.hProcess, &ec);
    r.exit_code = ec;
    CloseHandle(pi.hProcess);
    CloseHandle(pi.hThread);
    CloseHandle(err_rd);
    CloseHandle(out_rd);
    return r;
}

//============================================================
//  glob expansion (Windows FindFirstFile)
//============================================================

static void collect_files(const std::wstring& pattern, std::vector<std::wstring>& out)
{
    WIN32_FIND_DATAW fd;
    HANDLE h = FindFirstFileW(pattern.c_str(), &fd);
    if (h == INVALID_HANDLE_VALUE) {
        // maybe just a plain path
        DWORD a = GetFileAttributesW(pattern.c_str());
        if (a != INVALID_FILE_ATTRIBUTES && !(a & FILE_ATTRIBUTE_DIRECTORY)) {
            out.push_back(pattern);
        }
        return;
    }

    // find parent dir component
    std::wstring dir;
    size_t slash = pattern.find_last_of(L"\\/");
    if (slash != std::wstring::npos) dir = pattern.substr(0, slash + 1);

    do {
        if (fd.dwFileAttributes & FILE_ATTRIBUTE_DIRECTORY) continue;
        out.push_back(dir + fd.cFileName);
    } while (FindNextFileW(h, &fd));
    FindClose(h);
}

//============================================================
//  per-file result aggregation
//============================================================

struct CaseFail
{
    std::string message;
    std::string detail;
};

struct CaseResult
{
    std::string name;
    int         pass    = 0;
    int         fail    = 0;
    bool        closed  = false;   // test_end を受け取ったか
    std::vector<CaseFail> fails;
};

struct FileResult
{
    std::wstring path;
    bool        compile_ok  = true;
    bool        had_error   = false;    // runtime error event
    int         error_code  = 0;
    int         error_line  = -1;
    std::string error_file;
    std::string error_msg;
    int         case_pass   = 0;
    int         case_fail   = 0;
    int         case_count  = 0;
    int         expect_pass = 0;
    int         expect_fail = 0;
    std::vector<CaseResult> cases;
    std::vector<std::string> fail_details; // 表示用サマリ (後方互換)
    DWORD       duration_ms = 0;
    DWORD       exit_code   = 0;
    // カバレッジ: この .hsp を実行して得られた (file, line) のセット
    std::vector<std::pair<std::string,int>> cov_hits;
};

static void parse_events(const std::string& ndjson, FileResult& fr)
{
    size_t p = 0;
    CaseResult* current = nullptr;

    while (p < ndjson.size()) {
        size_t nl = ndjson.find('\n', p);
        std::string line = ndjson.substr(p, (nl == std::string::npos ? ndjson.size() : nl) - p);
        p = (nl == std::string::npos) ? ndjson.size() : nl + 1;
        if (line.empty() || line[0] != '{') continue;

        std::string type = json_str(line, "type");
        if (type == "test_begin") {
            std::string name = json_str(line, "case");
            fr.cases.push_back(CaseResult{});
            current = &fr.cases.back();
            current->name = name;
            fr.case_count++;
        } else if (type == "test_end") {
            int pass = json_int(line, "pass");
            int fail = json_int(line, "fail");
            fr.expect_pass += pass;
            fr.expect_fail += fail;
            if (fail > 0) fr.case_fail++;
            else          fr.case_pass++;
            if (current) {
                current->pass   = pass;
                current->fail   = fail;
                current->closed = true;
                current = nullptr;
            }
        } else if (type == "expect_fail") {
            CaseFail cf;
            cf.message = json_str(line, "message");
            cf.detail  = json_str(line, "detail");
            if (current) current->fails.push_back(cf);

            std::string s;
            std::string cs = json_str(line, "case");
            if (!cs.empty()) s += "[" + cs + "] ";
            s += cf.message;
            if (!cf.detail.empty()) s += "  (" + cf.detail + ")";
            fr.fail_details.push_back(s);
        } else if (type == "error") {
            fr.had_error  = true;
            fr.error_code = json_int(line, "code");
            fr.error_line = json_int(line, "line", -1);
            fr.error_file = json_str(line, "file");
            fr.error_msg  = json_str(line, "message");
        } else if (type == "test_summary") {
            // redundant; already tallied
        }

        if (g_verbose) {
            fprintf(stdout, "      %s\n", line.c_str());
        }
    }
}

//============================================================
//  JUnit XML emission
//============================================================

static void xml_append_escaped(std::string& out, const std::string& s)
{
    for (unsigned char c : s) {
        switch (c) {
            case '&':  out += "&amp;";  break;
            case '<':  out += "&lt;";   break;
            case '>':  out += "&gt;";   break;
            case '"':  out += "&quot;"; break;
            case '\'': out += "&apos;"; break;
            default:
                if (c < 0x20 && c != '\t' && c != '\n' && c != '\r') {
                    // XML 1.0 は制御文字を許可しない → 近似として ? に置換
                    out += '?';
                } else {
                    out += (char)c;
                }
                break;
        }
    }
}

static std::string xml_attr(const std::string& v)
{
    std::string s;
    xml_append_escaped(s, v);
    return s;
}

static void write_junit(const std::wstring& path,
                        const std::vector<FileResult>& results,
                        DWORD total_ms)
{
    FILE* fp = _wfopen(path.c_str(), L"w");
    if (!fp) return;

    // 集計
    int sum_tests    = 0;
    int sum_failures = 0;
    int sum_errors   = 0;
    for (const auto& fr : results) {
        // ケース単位が testcase。ケース数が 0 でエラーがある場合は
        // 1 件のダミー testcase にまとめる。
        if (fr.cases.empty()) {
            sum_tests++;
            if (fr.had_error) sum_errors++;
        } else {
            sum_tests += (int)fr.cases.size();
            for (const auto& c : fr.cases) if (c.fail > 0) sum_failures++;
            if (fr.had_error) sum_errors++;
        }
    }

    fprintf(fp, "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n");
    fprintf(fp, "<testsuites name=\"iron_test_runner\" tests=\"%d\" failures=\"%d\" errors=\"%d\" time=\"%.3f\">\n",
            sum_tests, sum_failures, sum_errors, total_ms / 1000.0);

    for (const auto& fr : results) {
        std::string path_u8 = wstr_to_utf8(fr.path);
        // testsuite name = ファイル名 (拡張子なし)
        std::string suite_name = path_u8;
        size_t slash = suite_name.find_last_of("\\/");
        if (slash != std::string::npos) suite_name = suite_name.substr(slash + 1);
        size_t dot = suite_name.find_last_of('.');
        if (dot != std::string::npos) suite_name = suite_name.substr(0, dot);

        int suite_tests    = (int)fr.cases.size();
        int suite_failures = 0;
        for (const auto& c : fr.cases) if (c.fail > 0) suite_failures++;
        int suite_errors   = fr.had_error ? 1 : 0;
        double suite_time  = fr.duration_ms / 1000.0;

        if (suite_tests == 0) suite_tests = 1; // エラー時のダミー

        fprintf(fp, "  <testsuite name=\"%s\" tests=\"%d\" failures=\"%d\" errors=\"%d\" time=\"%.3f\" file=\"%s\">\n",
                xml_attr(suite_name).c_str(),
                suite_tests, suite_failures, suite_errors, suite_time,
                xml_attr(path_u8).c_str());

        if (fr.cases.empty()) {
            // エラーのみ。ダミー testcase を 1 件
            fprintf(fp, "    <testcase classname=\"%s\" name=\"(no cases)\" time=\"%.3f\">\n",
                    xml_attr(suite_name).c_str(), suite_time);
            if (fr.had_error) {
                std::string msg = "code=" + std::to_string(fr.error_code);
                if (fr.error_line >= 0) msg += " line=" + std::to_string(fr.error_line);
                if (!fr.error_file.empty()) msg += " file=" + fr.error_file;
                fprintf(fp, "      <error type=\"runtime_error\" message=\"%s\">%s</error>\n",
                        xml_attr(fr.error_msg).c_str(),
                        xml_attr(msg).c_str());
            }
            fprintf(fp, "    </testcase>\n");
        } else {
            for (const auto& c : fr.cases) {
                fprintf(fp, "    <testcase classname=\"%s\" name=\"%s\">\n",
                        xml_attr(suite_name).c_str(),
                        xml_attr(c.name).c_str());
                for (const auto& f : c.fails) {
                    fprintf(fp, "      <failure type=\"%s\" message=\"%s\">%s</failure>\n",
                            xml_attr(f.message).c_str(),
                            xml_attr(f.message).c_str(),
                            xml_attr(f.detail).c_str());
                }
                fprintf(fp, "    </testcase>\n");
            }
            // ランタイムエラーはケース枠外で 1 件記録
            if (fr.had_error) {
                std::string msg = "code=" + std::to_string(fr.error_code);
                if (fr.error_line >= 0) msg += " line=" + std::to_string(fr.error_line);
                if (!fr.error_file.empty()) msg += " file=" + fr.error_file;
                fprintf(fp, "    <testcase classname=\"%s\" name=\"(runtime)\">\n",
                        xml_attr(suite_name).c_str());
                fprintf(fp, "      <error type=\"runtime_error\" message=\"%s\">%s</error>\n",
                        xml_attr(fr.error_msg).c_str(),
                        xml_attr(msg).c_str());
                fprintf(fp, "    </testcase>\n");
            }
        }

        fprintf(fp, "  </testsuite>\n");
    }

    fprintf(fp, "</testsuites>\n");
    fclose(fp);
}

//============================================================
//  driver
//============================================================

static std::wstring quote_arg(const std::wstring& a)
{
    if (a.find_first_of(L" \t\"") == std::wstring::npos) return a;
    std::wstring q = L"\"";
    for (wchar_t c : a) {
        if (c == L'"') q += L'\\';
        q += c;
    }
    q += L"\"";
    return q;
}

static bool compile_hsp(const std::wstring& compiler, const std::wstring& hsp_path,
                        const std::wstring& ax_path,
                        const std::wstring& syspath, const std::wstring& compath,
                        std::string& err_out)
{
    std::wstring cmd = quote_arg(compiler);
    cmd += L" -i -u -d";
    if (!syspath.empty()) { cmd += L" \"--syspath="; cmd += syspath; cmd += L"\""; }
    if (!compath.empty()) { cmd += L" \"--compath="; cmd += compath; cmd += L"\""; }
    cmd += L" -o"; cmd += quote_arg(ax_path);
    cmd += L" ";   cmd += quote_arg(hsp_path);

    RunResult r = run_capture(cmd);
    if (r.spawn_failed) { err_out = "cannot spawn compiler"; return false; }
    if (r.exit_code != 0) {
        err_out = r.stdout_text + r.stderr_text;
        return false;
    }
    return true;
}

static void run_one(const std::wstring& runtime_exe, const std::wstring& ax_path,
                    const std::wstring& cov_file, FileResult& fr)
{
    std::wstring cmd = quote_arg(runtime_exe);
    cmd += L" "; cmd += quote_arg(ax_path);

    std::wstring env;
    if (!cov_file.empty()) {
        env = L"HSPTEST_COV_FILE=";
        env += cov_file;
        env.push_back(L'\0');
    }

    DWORD t0 = GetTickCount();
    RunResult r = run_capture(cmd, L"", env);
    DWORD t1 = GetTickCount();
    fr.duration_ms = t1 - t0;
    fr.exit_code   = r.exit_code;

    if (r.spawn_failed) {
        fr.had_error = true;
        fr.error_msg = "cannot spawn test runtime";
        return;
    }
    parse_events(r.stderr_text, fr);

    // runtime error may have been raised without an error event if the test
    // runtime itself crashed — infer from exit code
    if (!fr.had_error && r.exit_code != 0 && fr.expect_fail == 0) {
        fr.had_error = true;
        fr.error_msg = "non-zero exit without events";
        fr.error_code = (int)r.exit_code;
    }
}

static void print_file_line(const FileResult& fr)
{
    const char* tag   = "PASS";
    const char* color = col_grn();
    if (fr.had_error)         { tag = "ERR "; color = col_red(); }
    else if (fr.expect_fail)  { tag = "FAIL"; color = col_red(); }

    // path relative rendering: just the file name part
    std::wstring disp = fr.path;
    size_t slash = disp.find_last_of(L"\\/");
    if (slash != std::wstring::npos) disp = disp.substr(slash + 1);

    std::string disp8 = wstr_to_utf8(disp);

    printf("%s[%s]%s %-40s %scases:%d pass:%d fail:%d%s  %s(%lums)%s\n",
           color, tag, col_rst(),
           disp8.c_str(),
           col_dim(), fr.case_count, fr.expect_pass, fr.expect_fail, col_rst(),
           col_dim(), (unsigned long)fr.duration_ms, col_rst());

    if (!g_quiet) {
        if (fr.had_error) {
            printf("       %serror%s code=%d", col_red(), col_rst(), fr.error_code);
            if (fr.error_line >= 0) printf(" line=%d", fr.error_line);
            if (!fr.error_file.empty()) printf(" file=%s", fr.error_file.c_str());
            if (!fr.error_msg.empty())  printf(" \"%s\"", fr.error_msg.c_str());
            printf("\n");
        }
        for (const auto& d : fr.fail_details) {
            printf("       %s- %s%s\n", col_yel(), d.c_str(), col_rst());
        }
    }
}

//============================================================
//  main
//============================================================

static void usage()
{
    fprintf(stderr,
        "iron_test_runner - run HSP test scripts and aggregate results\n"
        "\n"
        "Usage:\n"
        "  iron_test_runner [options] <file-or-glob> [...]\n"
        "\n"
        "Options:\n"
        "  --runtime=<exe>     test runtime executable (default: hsp3cl_net_test_64.exe)\n"
        "  --compiler=<exe>    hsp compiler (default: hspcmp64.exe)\n"
        "  --syspath=<dir>     --syspath passed to hspcmp\n"
        "  --compath=<dir>     --compath passed to hspcmp\n"
        "  --json=<file>       also write a machine-readable JSON summary\n"
        "  --junit=<file>      also write JUnit XML (CI integration)\n"
        "  --jobs=<N>          run N files in parallel (default: 1)\n"
        "  --coverage=<file>   collect source-line coverage; write merged TSV to <file>\n"
        "  --no-compile        inputs are .ax files (skip compile)\n"
        "  --quiet             summary only, suppress per-event detail\n"
        "  --verbose           echo every stderr JSON line\n"
        "  --no-color          disable ANSI colors\n"
        "\n"
        "Exit code:  (failed_expects + error_files).  0 means all green.\n");
}

int wmain(int argc, wchar_t** argv)
{
    SetConsoleOutputCP(CP_UTF8);
    enable_vt_mode();

    std::wstring runtime_exe  = L"hsp3cl_net_test_64.exe";
    std::wstring compiler_exe = L"hspcmp64.exe";
    std::wstring syspath;
    std::wstring compath;
    std::wstring json_out;
    std::wstring junit_out;
    std::wstring cov_out;
    bool no_compile = false;
    int  jobs = 1;
    std::vector<std::wstring> patterns;

    for (int i = 1; i < argc; i++) {
        std::wstring a = argv[i];
        auto starts = [&](const wchar_t* p) -> bool {
            size_t n = wcslen(p);
            return a.size() >= n && a.compare(0, n, p) == 0;
        };
        if      (a == L"--help" || a == L"-h") { usage(); return 0; }
        else if (a == L"--quiet")     g_quiet = true;
        else if (a == L"--verbose")   g_verbose = true;
        else if (a == L"--no-color")  g_use_color = false;
        else if (a == L"--no-compile") no_compile = true;
        else if (starts(L"--runtime="))  runtime_exe  = a.substr(10);
        else if (starts(L"--compiler=")) compiler_exe = a.substr(11);
        else if (starts(L"--syspath="))  syspath      = a.substr(10);
        else if (starts(L"--compath="))  compath      = a.substr(10);
        else if (starts(L"--json="))     json_out     = a.substr(7);
        else if (starts(L"--junit="))    junit_out    = a.substr(8);
        else if (starts(L"--jobs="))     { jobs = _wtoi(a.substr(7).c_str()); if (jobs < 1) jobs = 1; }
        else if (starts(L"--coverage=")) cov_out      = a.substr(11);
        else if (starts(L"--")) {
            fwprintf(stderr, L"unknown option: %s\n", a.c_str());
            return 2;
        } else {
            patterns.push_back(a);
        }
    }
    if (patterns.empty()) { usage(); return 2; }

    std::vector<std::wstring> files;
    for (const auto& p : patterns) collect_files(p, files);
    if (files.empty()) {
        fwprintf(stderr, L"no files match\n");
        return 2;
    }

    // 結果は元の入力順で保存。並列実行でも順序を保つため、index 付けて
    // 事前に results を reserve し、各 worker が自分の slot に書き込む。
    std::vector<FileResult> results(files.size());
    for (size_t i = 0; i < files.size(); i++) results[i].path = files[i];

    auto process_one = [&](size_t i) {
        const std::wstring& f = files[i];
        FileResult& fr = results[i];

        std::wstring ax;
        if (no_compile) {
            ax = f;
        } else {
            ax = f;
            size_t dot = ax.find_last_of(L'.');
            if (dot != std::wstring::npos) ax = ax.substr(0, dot);
            ax += L".ax";

            std::string cerr;
            if (!compile_hsp(compiler_exe, f, ax, syspath, compath, cerr)) {
                fr.compile_ok = false;
                fr.had_error  = true;
                fr.error_msg  = "compile failed: " + cerr;
                return;
            }
        }

        // per-file coverage tsv (存在すれば run_one 実行後に読み取る)
        std::wstring cov_file;
        if (!cov_out.empty()) {
            cov_file = ax;
            size_t dot = cov_file.find_last_of(L'.');
            if (dot != std::wstring::npos) cov_file = cov_file.substr(0, dot);
            cov_file += L".cov.tsv";
            DeleteFileW(cov_file.c_str());
        }

        run_one(runtime_exe, ax, cov_file, fr);

        if (!cov_file.empty()) {
            FILE* cp = _wfopen(cov_file.c_str(), L"r");
            if (cp) {
                char buf[1024];
                while (fgets(buf, sizeof(buf), cp)) {
                    // "file\tline\n"
                    char* tab = strchr(buf, '\t');
                    if (!tab) continue;
                    *tab = 0;
                    int line = atoi(tab + 1);
                    if (line > 0) fr.cov_hits.emplace_back(std::string(buf), line);
                }
                fclose(cp);
            }
        }
    };

    if (jobs <= 1 || files.size() <= 1) {
        for (size_t i = 0; i < files.size(); i++) process_one(i);
    } else {
        // 単純なワーク・スティーリング: atomic counter でインデックス配布
        std::atomic<size_t> next_index{0};
        int nthreads = (jobs > (int)files.size()) ? (int)files.size() : jobs;
        std::vector<std::thread> workers;
        workers.reserve(nthreads);
        for (int t = 0; t < nthreads; t++) {
            workers.emplace_back([&]() {
                for (;;) {
                    size_t i = next_index.fetch_add(1);
                    if (i >= files.size()) break;
                    process_one(i);
                }
            });
        }
        for (auto& w : workers) w.join();
    }

    // --------- print per-file ---------
    printf("\n");
    for (const auto& fr : results) print_file_line(fr);
    printf("\n");

    // --------- overall summary ---------
    int total_files       = (int)results.size();
    int ok_files          = 0;
    int fail_files        = 0;
    int err_files         = 0;
    int total_cases       = 0;
    int total_expect_pass = 0;
    int total_expect_fail = 0;
    DWORD total_ms        = 0;
    for (const auto& fr : results) {
        total_cases       += fr.case_count;
        total_expect_pass += fr.expect_pass;
        total_expect_fail += fr.expect_fail;
        total_ms          += fr.duration_ms;
        if (fr.had_error)         err_files++;
        else if (fr.expect_fail)  fail_files++;
        else                      ok_files++;
    }

    printf("----------------------------------------\n");
    printf("files: %s%d ok%s, %s%d fail%s, %s%d error%s  (total %d)\n",
           col_grn(), ok_files,  col_rst(),
           col_red(), fail_files, col_rst(),
           col_red(), err_files,  col_rst(),
           total_files);
    printf("tests: %d cases, %d pass, %s%d fail%s  (%lums)\n",
           total_cases, total_expect_pass,
           col_red(), total_expect_fail, col_rst(),
           (unsigned long)total_ms);

    // --------- optional JSON ---------
    if (!json_out.empty()) {
        FILE* fp = _wfopen(json_out.c_str(), L"w");
        if (fp) {
            fprintf(fp, "{\n  \"files\": %d,\n  \"ok\": %d,\n  \"fail\": %d,\n  \"error\": %d,\n",
                    total_files, ok_files, fail_files, err_files);
            fprintf(fp, "  \"total_cases\": %d,\n  \"pass\": %d,\n  \"fail_expects\": %d,\n  \"duration_ms\": %lu,\n",
                    total_cases, total_expect_pass, total_expect_fail, (unsigned long)total_ms);
            fprintf(fp, "  \"results\": [\n");
            for (size_t i = 0; i < results.size(); i++) {
                const auto& fr = results[i];
                std::string p8 = wstr_to_utf8(fr.path);
                fprintf(fp, "    {\"path\":\"");
                for (char c : p8) {
                    if (c == '\\') fprintf(fp, "\\\\");
                    else if (c == '"') fprintf(fp, "\\\"");
                    else fputc(c, fp);
                }
                fprintf(fp, "\",\"cases\":%d,\"pass\":%d,\"fail\":%d,\"error\":%s,\"ms\":%lu",
                        fr.case_count, fr.expect_pass, fr.expect_fail,
                        fr.had_error ? "true" : "false",
                        (unsigned long)fr.duration_ms);
                fprintf(fp, "}%s\n", (i + 1 == results.size()) ? "" : ",");
            }
            fprintf(fp, "  ]\n}\n");
            fclose(fp);
        }
    }

    if (!junit_out.empty()) {
        write_junit(junit_out, results, total_ms);
    }

    // --------- coverage merge ---------
    if (!cov_out.empty()) {
        // file -> set<line>
        std::unordered_map<std::string, std::unordered_map<int,int>> merged;
        int total_hit_events = 0;
        for (const auto& fr : results) {
            for (const auto& kv : fr.cov_hits) {
                merged[kv.first][kv.second]++;
                total_hit_events++;
            }
        }

        // TSV 形式で書き出し: file\tline\thit_count\n
        FILE* fp = _wfopen(cov_out.c_str(), L"w");
        if (fp) {
            fprintf(fp, "file\tline\thits\n");
            size_t total_lines = 0;
            for (const auto& file_kv : merged) {
                for (const auto& line_kv : file_kv.second) {
                    fprintf(fp, "%s\t%d\t%d\n",
                            file_kv.first.c_str(),
                            line_kv.first,
                            line_kv.second);
                    total_lines++;
                }
            }
            fclose(fp);

            // ついでに画面にもサマリ
            size_t nfiles = merged.size();
            printf("coverage: %zu files, %zu unique lines, %d hit events  %s-> %ls%s\n",
                   nfiles, total_lines, total_hit_events,
                   col_dim(), cov_out.c_str(), col_rst());
        }
    }

    return total_expect_fail + err_files;
}
