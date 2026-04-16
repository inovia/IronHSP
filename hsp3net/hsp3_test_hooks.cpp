//
//  hsp3_test_hooks.cpp
//  HSP3 test runtime hooks 実装
//
#ifdef HSP_TEST_MODE

#include <stdio.h>
#include <string.h>
#include <time.h>

#ifdef _WIN32
#define WIN32_LEAN_AND_MEAN
#include <windows.h>
#include <io.h>
#include <fcntl.h>
#include <stdint.h>
#endif

#include "hsp3_test_hooks.h"

#include <string>
#include <unordered_set>

static int  g_exit_code        = 0;
static bool g_stderr_ready     = false;
static bool g_start_emitted    = false;

// --- coverage state ---
enum CovState { COV_UNINIT = 0, COV_DISABLED = 1, COV_ENABLED = 2 };
static int                              g_cov_state = COV_UNINIT;
static std::string                      g_cov_path;
static std::unordered_set<std::string>* g_cov_hits  = nullptr;
static int                              g_cov_last_line = -1;
static std::string                      g_cov_last_file;

static void hsptest_ensure_stderr(void)
{
    if (g_stderr_ready) return;
    g_stderr_ready = true;
#ifdef _WIN32
    // 既に親が stderr をパイプ/ファイルにリダイレクトしている場合 (`2>log`)、
    // そのハンドルはそのまま使える → 何もしない。
    HANDLE h = GetStdHandle(STD_ERROR_HANDLE);
    if (h != NULL && h != INVALID_HANDLE_VALUE) {
        DWORD type = GetFileType(h);
        if (type == FILE_TYPE_DISK || type == FILE_TYPE_PIPE || type == FILE_TYPE_CHAR) {
            // stderr は使える状態なので何もしない。ただし C ランタイムに
            // stream を再バインドしないと fprintf(stderr,...) が届かないケースが
            // あるため _fdopen で 2 番ディスクリプタを拾う。
            int fd = _open_osfhandle((intptr_t)h, 0);
            if (fd >= 0) {
                FILE* fp = _fdopen(fd, "w");
                if (fp) {
                    // 既存 stderr を閉じず、ただバッファリング無効化だけする。
                    setvbuf(fp, NULL, _IONBF, 0);
                    // 直接差し替えは CRT 実装に依存するため、極力 stderr を
                    // そのまま使う方針。setvbuf は既存 stderr にも効かせる。
                    setvbuf(stderr, NULL, _IONBF, 0);
                    (void)fp;
                }
            }
            return;
        }
    }
    // GUI サブシステムで stderr ハンドルが無い場合、親コンソールに attach して
    // CONOUT$ を stderr に振り直す。
    AttachConsole(ATTACH_PARENT_PROCESS);
    FILE* fp = NULL;
    freopen_s(&fp, "CONOUT$", "w", stderr);
    if (!fp) {
        // 親コンソール無し (Win 経由起動) のときは freopen が失敗する。
        // その場合は HSPTEST_STDERR_FILE 環境変数にフォールバック。
        char path[1024] = { 0 };
        DWORD n = GetEnvironmentVariableA("HSPTEST_STDERR_FILE", path, sizeof(path));
        if (n > 0 && n < sizeof(path)) {
            FILE* fp2 = NULL;
            freopen_s(&fp2, path, "a", stderr);
        }
    }
    setvbuf(stderr, NULL, _IONBF, 0);
#endif
}

static void hsptest_json_escape(FILE* fp, const char* s)
{
    if (!s) { fputs("null", fp); return; }
    fputc('"', fp);
    for (const unsigned char* p = (const unsigned char*)s; *p; ++p) {
        unsigned char c = *p;
        switch (c) {
            case '"':  fputs("\\\"", fp); break;
            case '\\': fputs("\\\\", fp); break;
            case '\n': fputs("\\n", fp); break;
            case '\r': fputs("\\r", fp); break;
            case '\t': fputs("\\t", fp); break;
            default:
                if (c < 0x20) fprintf(fp, "\\u%04x", c);
                else          fputc(c, fp);
                break;
        }
    }
    fputc('"', fp);
}

static void hsptest_emit_begin(const char* type)
{
    hsptest_ensure_stderr();
    time_t t = time(NULL);
    struct tm tmv;
#ifdef _WIN32
    localtime_s(&tmv, &t);
#else
    tmv = *localtime(&t);
#endif
    char tbuf[32];
    strftime(tbuf, sizeof(tbuf), "%Y-%m-%dT%H:%M:%S", &tmv);
    fprintf(stderr, "{\"time\":\"%s\",\"type\":\"%s\"", tbuf, type);
}

static void hsptest_emit_end_line(void)
{
    fputs("}\n", stderr);
    fflush(stderr);
}

void hsptest_init(const char* exe_name, const char* cmdline)
{
    if (g_start_emitted) return;
    g_start_emitted = true;
    hsptest_emit_begin("start");
    fputs(",\"exe\":", stderr);
    hsptest_json_escape(stderr, exe_name ? exe_name : "");
    if (cmdline) {
        fputs(",\"cmdline\":", stderr);
        hsptest_json_escape(stderr, cmdline);
    }
    hsptest_emit_end_line();
}

void hsptest_emit_error(int err_code, int line_no, const char* fname, const char* message)
{
    hsptest_emit_begin("error");
    fprintf(stderr, ",\"code\":%d", err_code);
    if (line_no >= 0) fprintf(stderr, ",\"line\":%d", line_no);
    if (fname) {
        fputs(",\"file\":", stderr);
        hsptest_json_escape(stderr, fname);
    }
    fputs(",\"message\":", stderr);
    hsptest_json_escape(stderr, message ? message : "");
    hsptest_emit_end_line();
    if (g_exit_code == 0) g_exit_code = 1;
}

void hsptest_emit_alert(const char* message)
{
    hsptest_emit_begin("alert");
    fputs(",\"message\":", stderr);
    hsptest_json_escape(stderr, message ? message : "");
    hsptest_emit_end_line();
}

int hsptest_emit_dialog(int flag, const char* caption, const char* text)
{
    hsptest_emit_begin("dialog");
    fprintf(stderr, ",\"flag\":%d", flag);
    fputs(",\"caption\":", stderr);
    hsptest_json_escape(stderr, caption ? caption : "");
    fputs(",\"text\":", stderr);
    hsptest_json_escape(stderr, text ? text : "");
    hsptest_emit_end_line();
    // yesno(&2) なら IDYES=6、それ以外は IDOK=1 を返してスクリプトは継続。
    if (flag & 2) return 6;
    return 1;
}

void hsptest_emit_trace(const char* tag, int line_no)
{
    hsptest_emit_begin("trace");
    if (tag) {
        fputs(",\"tag\":", stderr);
        hsptest_json_escape(stderr, tag);
    }
    if (line_no >= 0) fprintf(stderr, ",\"line\":%d", line_no);
    hsptest_emit_end_line();
}

void hsptest_emit_end(int exit_code)
{
    hsptest_coverage_flush();
    hsptest_emit_begin("end");
    fprintf(stderr, ",\"exit\":%d", exit_code);
    hsptest_emit_end_line();
}

//============================================================
//  coverage
//
//  バイトコード dispatch ループから per-step で呼ばれるホットパス。
//  enabled 状態では (file, line) の新規出現だけ set に追加する。
//  disable 状態では atomic load + 早期 return のみ。
//============================================================

static void hsptest_coverage_init_lazy(void)
{
    if (g_cov_state != COV_UNINIT) return;
#ifdef _WIN32
    char path[1024] = { 0 };
    DWORD n = GetEnvironmentVariableA("HSPTEST_COV_FILE", path, sizeof(path));
    if (n > 0 && n < sizeof(path)) {
        g_cov_path  = path;
        g_cov_hits  = new std::unordered_set<std::string>();
        g_cov_state = COV_ENABLED;
        return;
    }
#endif
    g_cov_state = COV_DISABLED;
}

void hsptest_coverage_tick(int current_line, const char* current_file)
{
    if (g_cov_state == COV_DISABLED) return;
    if (g_cov_state == COV_UNINIT)   hsptest_coverage_init_lazy();
    if (g_cov_state != COV_ENABLED)  return;
    if (current_line < 0) return;

    // 連続で同じ (file, line) が来る大量のケースは高速短絡
    if (current_line == g_cov_last_line) {
        if (!current_file && g_cov_last_file.empty()) return;
        if (current_file && g_cov_last_file == current_file) return;
    }
    g_cov_last_line = current_line;
    g_cov_last_file = current_file ? current_file : "";

    // set のキーは "file\tline" 形式
    char buf[32];
    snprintf(buf, sizeof(buf), "\t%d", current_line);
    std::string key = g_cov_last_file + buf;
    g_cov_hits->insert(std::move(key));
}

void hsptest_coverage_flush(void)
{
    if (g_cov_state != COV_ENABLED || !g_cov_hits) return;

    FILE* fp = fopen(g_cov_path.c_str(), "w");
    if (fp) {
        // 各行 "file\tline\n" の TSV
        for (const auto& s : *g_cov_hits) {
            fputs(s.c_str(), fp);
            fputc('\n', fp);
        }
        fclose(fp);

        // 件数だけ stderr に通知イベントとしても出す
        hsptest_emit_begin("coverage");
        fprintf(stderr, ",\"file\":");
        hsptest_json_escape(stderr, g_cov_path.c_str());
        fprintf(stderr, ",\"hits\":%zu", g_cov_hits->size());
        hsptest_emit_end_line();
    }

    delete g_cov_hits;
    g_cov_hits  = nullptr;
    g_cov_state = COV_DISABLED;
}

int  hsptest_get_exit_code(void)        { return g_exit_code; }
void hsptest_set_exit_code(int code)    { g_exit_code = code; }

#endif // HSP_TEST_MODE
