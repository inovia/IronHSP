//
//  hsptestrt.dll - HSP test support runtime plugin
//
//  Provides test DSL primitives (assert/expect/test_begin/test_end/summary)
//  and helpers (screenshot, trace, emit) that output to stderr as JSON.
//
//  Runtime independent: works inside hsp3_net_test.exe / hsp3cl_net_test.exe
//  (where stderr is already wired up) OR any other runtime (output falls
//  through to whichever stderr the process has).
//
//  All exports are __cdecl and written for #uselib style registration.
//
#define WIN32_LEAN_AND_MEAN
#include <windows.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <time.h>
#include <stdarg.h>
#include <stdint.h>
#include <vector>
#include <string>

#define STB_IMAGE_IMPLEMENTATION
#define STBI_ONLY_PNG
#define STBI_NO_STDIO
#define STBI_NO_LINEAR
#define STBI_NO_HDR
#include "stb_image.h"

#define EXPORT extern "C" __declspec(dllexport)

//============================================================
//  Global state
//============================================================

static int         g_total_pass  = 0;
static int         g_total_fail  = 0;
static int         g_case_pass   = 0;
static int         g_case_fail   = 0;
static std::string g_case_name;
static bool        g_in_case     = false;
static HANDLE      g_stderr      = NULL;
static bool        g_stderr_tried = false;

static HANDLE get_stderr()
{
    if (!g_stderr_tried) {
        g_stderr_tried = true;
        g_stderr = GetStdHandle(STD_ERROR_HANDLE);
    }
    return g_stderr;
}

static void write_stderr_raw(const char* buf, size_t len)
{
    HANDLE h = get_stderr();
    if (h == NULL || h == INVALID_HANDLE_VALUE) return;
    DWORD written = 0;
    WriteFile(h, buf, (DWORD)len, &written, NULL);
}

//============================================================
//  JSON helpers
//============================================================

static void json_append_escaped(std::string& out, const char* s)
{
    out += '"';
    if (s) {
        for (const unsigned char* p = (const unsigned char*)s; *p; ++p) {
            unsigned char c = *p;
            switch (c) {
                case '"':  out += "\\\""; break;
                case '\\': out += "\\\\"; break;
                case '\n': out += "\\n"; break;
                case '\r': out += "\\r"; break;
                case '\t': out += "\\t"; break;
                default:
                    if (c < 0x20) {
                        char buf[8];
                        snprintf(buf, sizeof(buf), "\\u%04x", c);
                        out += buf;
                    } else {
                        out += (char)c;
                    }
                    break;
            }
        }
    }
    out += '"';
}

static void json_open(std::string& out, const char* type)
{
    time_t t = time(NULL);
    struct tm tmv;
    localtime_s(&tmv, &t);
    char tbuf[32];
    strftime(tbuf, sizeof(tbuf), "%Y-%m-%dT%H:%M:%S", &tmv);
    out += "{\"time\":\"";
    out += tbuf;
    out += "\",\"type\":\"";
    out += type;
    out += "\"";
}

static void json_close_and_emit(std::string& out)
{
    out += "}\n";
    write_stderr_raw(out.data(), out.size());
}

static void emit_simple(const char* type)
{
    std::string s;
    json_open(s, type);
    json_close_and_emit(s);
}

//============================================================
//  Test case state + reporting
//============================================================

static void record_pass()
{
    if (g_in_case) g_case_pass++;
    g_total_pass++;
}

static void record_fail(const char* message, const char* detail)
{
    if (g_in_case) g_case_fail++;
    g_total_fail++;

    std::string s;
    json_open(s, "expect_fail");
    if (g_in_case) {
        s += ",\"case\":";
        json_append_escaped(s, g_case_name.c_str());
    }
    s += ",\"message\":";
    json_append_escaped(s, message ? message : "");
    if (detail && *detail) {
        s += ",\"detail\":";
        json_append_escaped(s, detail);
    }
    json_close_and_emit(s);
}

//============================================================
//  Exported commands
//============================================================

EXPORT void __cdecl testrt_begin(const char* name)
{
    if (g_in_case) {
        // 入れ子呼び出しは暗黙 end 扱い
        std::string s;
        json_open(s, "test_end");
        s += ",\"case\":";
        json_append_escaped(s, g_case_name.c_str());
        char buf[64];
        snprintf(buf, sizeof(buf), ",\"pass\":%d,\"fail\":%d", g_case_pass, g_case_fail);
        s += buf;
        json_close_and_emit(s);
    }
    g_case_name = name ? name : "";
    g_case_pass = 0;
    g_case_fail = 0;
    g_in_case   = true;

    std::string s;
    json_open(s, "test_begin");
    s += ",\"case\":";
    json_append_escaped(s, g_case_name.c_str());
    json_close_and_emit(s);
}

EXPORT void __cdecl testrt_end(void)
{
    if (!g_in_case) return;
    std::string s;
    json_open(s, "test_end");
    s += ",\"case\":";
    json_append_escaped(s, g_case_name.c_str());
    char buf[64];
    snprintf(buf, sizeof(buf), ",\"pass\":%d,\"fail\":%d", g_case_pass, g_case_fail);
    s += buf;
    json_close_and_emit(s);
    g_in_case = false;
    g_case_name.clear();
}

EXPORT int __cdecl testrt_summary(void)
{
    // 明示的に test_end されていないなら暗黙 end
    if (g_in_case) testrt_end();

    std::string s;
    json_open(s, "test_summary");
    char buf[96];
    snprintf(buf, sizeof(buf), ",\"total\":%d,\"pass\":%d,\"fail\":%d",
             g_total_pass + g_total_fail, g_total_pass, g_total_fail);
    s += buf;
    json_close_and_emit(s);
    return g_total_fail; // 0 なら成功
}

EXPORT int __cdecl testrt_fail_count(void)   { return g_total_fail; }
EXPORT int __cdecl testrt_pass_count(void)   { return g_total_pass; }

EXPORT void __cdecl testrt_trace(const char* tag)
{
    std::string s;
    json_open(s, "trace");
    s += ",\"tag\":";
    json_append_escaped(s, tag ? tag : "");
    json_close_and_emit(s);
}

EXPORT void __cdecl testrt_emit(const char* type, const char* message)
{
    std::string s;
    json_open(s, type ? type : "event");
    s += ",\"message\":";
    json_append_escaped(s, message ? message : "");
    json_close_and_emit(s);
}

//----------- assertion primitives -----------

static std::string fmt_detail_ii(int actual, int expected)
{
    char buf[96];
    snprintf(buf, sizeof(buf), "actual=%d expected=%d", actual, expected);
    return buf;
}
static std::string fmt_detail_dd(double actual, double expected)
{
    char buf[128];
    snprintf(buf, sizeof(buf), "actual=%.17g expected=%.17g", actual, expected);
    return buf;
}
static std::string fmt_detail_ss(const char* actual, const char* expected)
{
    std::string s = "actual=\"";
    s += actual ? actual : "";
    s += "\" expected=\"";
    s += expected ? expected : "";
    s += "\"";
    return s;
}

EXPORT void __cdecl testrt_assert(int cond, const char* message)
{
    if (cond) record_pass();
    else      record_fail(message ? message : "assertion failed", NULL);
}

EXPORT void __cdecl testrt_expect_true(int cond, const char* message)
{
    if (cond) record_pass();
    else      record_fail(message ? message : "expect_true failed", "actual=0");
}

EXPORT void __cdecl testrt_expect_false(int cond, const char* message)
{
    if (!cond) record_pass();
    else       record_fail(message ? message : "expect_false failed", "actual!=0");
}

EXPORT void __cdecl testrt_expect_eq_i(int actual, int expected, const char* message)
{
    if (actual == expected) record_pass();
    else record_fail(message ? message : "expect_eq_i failed",
                     fmt_detail_ii(actual, expected).c_str());
}

EXPORT void __cdecl testrt_expect_ne_i(int actual, int expected, const char* message)
{
    if (actual != expected) record_pass();
    else record_fail(message ? message : "expect_ne_i failed",
                     fmt_detail_ii(actual, expected).c_str());
}

EXPORT void __cdecl testrt_expect_eq_d(double actual, double expected, double eps, const char* message)
{
    double diff = actual - expected;
    if (diff < 0) diff = -diff;
    if (diff <= eps) record_pass();
    else record_fail(message ? message : "expect_eq_d failed",
                     fmt_detail_dd(actual, expected).c_str());
}

EXPORT void __cdecl testrt_expect_eq_s(const char* actual, const char* expected, const char* message)
{
    const char* a = actual   ? actual   : "";
    const char* b = expected ? expected : "";
    if (strcmp(a, b) == 0) record_pass();
    else record_fail(message ? message : "expect_eq_s failed",
                     fmt_detail_ss(a, b).c_str());
}

EXPORT void __cdecl testrt_expect_ne_s(const char* actual, const char* expected, const char* message)
{
    const char* a = actual   ? actual   : "";
    const char* b = expected ? expected : "";
    if (strcmp(a, b) != 0) record_pass();
    else record_fail(message ? message : "expect_ne_s failed",
                     fmt_detail_ss(a, b).c_str());
}

//----------- 型拡張: int64 / near / array / intptr -----------
//
// HSP の #func で var を指定すると、変数の先頭アドレスが渡される。
// テスト側は int64 変数や配列変数をそのまま参照できる。

static std::string fmt_detail_i64(int64_t a, int64_t b)
{
    char buf[96];
    snprintf(buf, sizeof(buf), "actual=%lld expected=%lld",
             (long long)a, (long long)b);
    return buf;
}

static std::string fmt_detail_near_i(int a, int b, int tol)
{
    char buf[128];
    snprintf(buf, sizeof(buf), "actual=%d expected=%d tolerance=%d diff=%d",
             a, b, tol, a > b ? a - b : b - a);
    return buf;
}

EXPORT void __cdecl testrt_expect_eq_i64(const int64_t* actual, const int64_t* expected, const char* message)
{
    int64_t a = actual   ? *actual   : 0;
    int64_t b = expected ? *expected : 0;
    if (a == b) record_pass();
    else record_fail(message ? message : "expect_eq_i64 failed",
                     fmt_detail_i64(a, b).c_str());
}

EXPORT void __cdecl testrt_expect_ne_i64(const int64_t* actual, const int64_t* expected, const char* message)
{
    int64_t a = actual   ? *actual   : 0;
    int64_t b = expected ? *expected : 0;
    if (a != b) record_pass();
    else record_fail(message ? message : "expect_ne_i64 failed",
                     fmt_detail_i64(a, b).c_str());
}

EXPORT void __cdecl testrt_expect_near_i(int actual, int expected, int tolerance, const char* message)
{
    int diff = actual > expected ? actual - expected : expected - actual;
    if (diff <= tolerance) record_pass();
    else record_fail(message ? message : "expect_near_i failed",
                     fmt_detail_near_i(actual, expected, tolerance).c_str());
}

// intptr は 64bit ランタイムでは 8 バイトのハンドル値。int64 と同じ扱い。
EXPORT void __cdecl testrt_expect_eq_intptr(const int64_t* actual, const int64_t* expected, const char* message)
{
    int64_t a = actual   ? *actual   : 0;
    int64_t b = expected ? *expected : 0;
    if (a == b) record_pass();
    else {
        char buf[96];
        snprintf(buf, sizeof(buf), "actual=0x%llx expected=0x%llx",
                 (unsigned long long)a, (unsigned long long)b);
        record_fail(message ? message : "expect_eq_intptr failed", buf);
    }
}

EXPORT void __cdecl testrt_expect_array_eq_i(const int* a, const int* b, int length, const char* message)
{
    if (!a || !b || length <= 0) { record_pass(); return; }
    int first_diff = -1;
    for (int i = 0; i < length; i++) {
        if (a[i] != b[i]) { first_diff = i; break; }
    }
    if (first_diff < 0) record_pass();
    else {
        char buf[160];
        snprintf(buf, sizeof(buf),
                 "length=%d first_diff_index=%d actual[%d]=%d expected[%d]=%d",
                 length, first_diff, first_diff, a[first_diff],
                 first_diff, b[first_diff]);
        record_fail(message ? message : "expect_array_eq_i failed", buf);
    }
}

EXPORT void __cdecl testrt_expect_array_eq_d(const double* a, const double* b, int length, double eps, const char* message)
{
    if (!a || !b || length <= 0) { record_pass(); return; }
    int first_diff = -1;
    for (int i = 0; i < length; i++) {
        double d = a[i] - b[i];
        if (d < 0) d = -d;
        if (d > eps) { first_diff = i; break; }
    }
    if (first_diff < 0) record_pass();
    else {
        char buf[192];
        snprintf(buf, sizeof(buf),
                 "length=%d first_diff_index=%d actual[%d]=%.17g expected[%d]=%.17g eps=%g",
                 length, first_diff, first_diff, a[first_diff],
                 first_diff, b[first_diff], eps);
        record_fail(message ? message : "expect_array_eq_d failed", buf);
    }
}

//----------- screenshot -----------
//
//  GUI ウィンドウの場合: GetForegroundWindow 相当でなく、
//  明示的に HWND を指定できるバージョンも提供。
//  0 を渡すと GetForegroundWindow を使う (一般的には hsp3 の描画ウィンドウ)。

static bool save_png(const char* path, int w, int h, const BYTE* bgra_top_down);

EXPORT int __cdecl testrt_screenshot(const char* path_utf8, void* hwnd_opt)
{
    HWND hwnd = (HWND)hwnd_opt;
    if (!hwnd) hwnd = GetForegroundWindow();
    if (!hwnd) return -1;

    RECT rc;
    if (!GetClientRect(hwnd, &rc)) return -2;
    int w = rc.right - rc.left;
    int h = rc.bottom - rc.top;
    if (w <= 0 || h <= 0) return -3;

    HDC hdcWin = GetDC(hwnd);
    HDC hdcMem = CreateCompatibleDC(hdcWin);

    BITMAPINFO bmi = { 0 };
    bmi.bmiHeader.biSize        = sizeof(BITMAPINFOHEADER);
    bmi.bmiHeader.biWidth       = w;
    bmi.bmiHeader.biHeight      = -h;   // top-down
    bmi.bmiHeader.biPlanes      = 1;
    bmi.bmiHeader.biBitCount    = 32;
    bmi.bmiHeader.biCompression = BI_RGB;

    void* pixels = NULL;
    HBITMAP hBmp = CreateDIBSection(hdcWin, &bmi, DIB_RGB_COLORS, &pixels, NULL, 0);
    if (!hBmp) {
        DeleteDC(hdcMem);
        ReleaseDC(hwnd, hdcWin);
        return -4;
    }
    HGDIOBJ old = SelectObject(hdcMem, hBmp);
    BitBlt(hdcMem, 0, 0, w, h, hdcWin, 0, 0, SRCCOPY);
    SelectObject(hdcMem, old);

    bool ok = save_png(path_utf8, w, h, (const BYTE*)pixels);

    DeleteObject(hBmp);
    DeleteDC(hdcMem);
    ReleaseDC(hwnd, hdcWin);

    // 結果イベント
    std::string s;
    json_open(s, "screenshot");
    s += ",\"path\":";
    json_append_escaped(s, path_utf8 ? path_utf8 : "");
    char buf[64];
    snprintf(buf, sizeof(buf), ",\"width\":%d,\"height\":%d,\"ok\":%s",
             w, h, ok ? "true" : "false");
    s += buf;
    json_close_and_emit(s);

    return ok ? 0 : -5;
}

//----------- click / key input -----------

EXPORT int __cdecl testrt_click(int x, int y, int button)
{
    INPUT ip[2] = { 0 };

    // マウス移動 (絶対座標)
    int screen_w = GetSystemMetrics(SM_CXSCREEN);
    int screen_h = GetSystemMetrics(SM_CYSCREEN);
    if (screen_w <= 0 || screen_h <= 0) return -1;

    DWORD down_flag = MOUSEEVENTF_LEFTDOWN;
    DWORD up_flag   = MOUSEEVENTF_LEFTUP;
    if (button == 1) { down_flag = MOUSEEVENTF_RIGHTDOWN;  up_flag = MOUSEEVENTF_RIGHTUP;  }
    if (button == 2) { down_flag = MOUSEEVENTF_MIDDLEDOWN; up_flag = MOUSEEVENTF_MIDDLEUP; }

    SetCursorPos(x, y);

    ip[0].type = INPUT_MOUSE;
    ip[0].mi.dwFlags = down_flag;
    ip[1].type = INPUT_MOUSE;
    ip[1].mi.dwFlags = up_flag;

    SendInput(2, ip, sizeof(INPUT));
    return 0;
}

EXPORT int __cdecl testrt_key(int vk_code)
{
    INPUT ip[2] = { 0 };
    ip[0].type = INPUT_KEYBOARD;
    ip[0].ki.wVk = (WORD)vk_code;
    ip[1].type = INPUT_KEYBOARD;
    ip[1].ki.wVk = (WORD)vk_code;
    ip[1].ki.dwFlags = KEYEVENTF_KEYUP;
    SendInput(2, ip, sizeof(INPUT));
    return 0;
}

//============================================================
//  PNG writer - tiny stb_image_write style implementation
//  (uncompressed zlib stream for simplicity)
//============================================================

#include <cstdio>

static uint32_t crc32_for(const uint8_t* data, size_t len)
{
    static uint32_t table[256];
    static bool init = false;
    if (!init) {
        init = true;
        for (uint32_t i = 0; i < 256; i++) {
            uint32_t c = i;
            for (int k = 0; k < 8; k++)
                c = (c & 1) ? (0xEDB88320u ^ (c >> 1)) : (c >> 1);
            table[i] = c;
        }
    }
    uint32_t c = 0xFFFFFFFFu;
    for (size_t i = 0; i < len; i++)
        c = table[(c ^ data[i]) & 0xFFu] ^ (c >> 8);
    return c ^ 0xFFFFFFFFu;
}

static uint32_t adler32_for(const uint8_t* data, size_t len)
{
    uint32_t a = 1, b = 0;
    for (size_t i = 0; i < len; i++) {
        a = (a + data[i]) % 65521;
        b = (b + a)       % 65521;
    }
    return (b << 16) | a;
}

static void put_u32_be(std::vector<uint8_t>& v, uint32_t x)
{
    v.push_back((uint8_t)(x >> 24));
    v.push_back((uint8_t)(x >> 16));
    v.push_back((uint8_t)(x >> 8));
    v.push_back((uint8_t)x);
}

static void png_chunk(std::vector<uint8_t>& out, const char tag[4], const uint8_t* data, size_t len)
{
    put_u32_be(out, (uint32_t)len);
    size_t crc_start = out.size();
    out.push_back((uint8_t)tag[0]);
    out.push_back((uint8_t)tag[1]);
    out.push_back((uint8_t)tag[2]);
    out.push_back((uint8_t)tag[3]);
    out.insert(out.end(), data, data + len);
    uint32_t crc = crc32_for(out.data() + crc_start, 4 + len);
    put_u32_be(out, crc);
}

static bool save_png(const char* path_utf8, int w, int h, const BYTE* bgra_top_down)
{
    if (!path_utf8 || !bgra_top_down) return false;

    // Convert BGRA (top-down) -> filtered RGB scanlines prepended with 0 filter byte.
    size_t row_bytes = (size_t)w * 3;
    std::vector<uint8_t> raw;
    raw.reserve((row_bytes + 1) * h);
    for (int y = 0; y < h; y++) {
        raw.push_back(0); // filter byte: none
        const BYTE* src = bgra_top_down + (size_t)y * w * 4;
        for (int x = 0; x < w; x++) {
            raw.push_back(src[x * 4 + 2]); // R
            raw.push_back(src[x * 4 + 1]); // G
            raw.push_back(src[x * 4 + 0]); // B
        }
    }

    // zlib-wrapped deflate using stored (non-compressed) blocks.
    std::vector<uint8_t> zl;
    zl.push_back(0x78); // CMF
    zl.push_back(0x01); // FLG (no dict, fastest)

    size_t pos = 0;
    while (pos < raw.size()) {
        size_t chunk = raw.size() - pos;
        if (chunk > 65535) chunk = 65535;
        bool last = (pos + chunk) == raw.size();
        zl.push_back(last ? 0x01 : 0x00);
        zl.push_back((uint8_t)(chunk & 0xFF));
        zl.push_back((uint8_t)((chunk >> 8) & 0xFF));
        uint16_t nlen = (uint16_t)~chunk;
        zl.push_back((uint8_t)(nlen & 0xFF));
        zl.push_back((uint8_t)((nlen >> 8) & 0xFF));
        zl.insert(zl.end(), raw.data() + pos, raw.data() + pos + chunk);
        pos += chunk;
    }
    uint32_t adler = adler32_for(raw.data(), raw.size());
    put_u32_be(zl, adler);

    // Assemble PNG
    std::vector<uint8_t> png;
    static const uint8_t sig[8] = { 137, 80, 78, 71, 13, 10, 26, 10 };
    png.insert(png.end(), sig, sig + 8);

    uint8_t ihdr[13];
    ihdr[0] = (uint8_t)(w >> 24); ihdr[1] = (uint8_t)(w >> 16);
    ihdr[2] = (uint8_t)(w >> 8);  ihdr[3] = (uint8_t)w;
    ihdr[4] = (uint8_t)(h >> 24); ihdr[5] = (uint8_t)(h >> 16);
    ihdr[6] = (uint8_t)(h >> 8);  ihdr[7] = (uint8_t)h;
    ihdr[8]  = 8;   // bit depth
    ihdr[9]  = 2;   // color type: truecolor
    ihdr[10] = 0;   // compression
    ihdr[11] = 0;   // filter
    ihdr[12] = 0;   // interlace
    png_chunk(png, "IHDR", ihdr, sizeof(ihdr));
    png_chunk(png, "IDAT", zl.data(), zl.size());
    png_chunk(png, "IEND", NULL, 0);

    // utf-8 path → wide for CreateFileW
    int wlen = MultiByteToWideChar(CP_UTF8, 0, path_utf8, -1, NULL, 0);
    if (wlen <= 0) return false;
    std::vector<wchar_t> wpath(wlen);
    MultiByteToWideChar(CP_UTF8, 0, path_utf8, -1, wpath.data(), wlen);

    HANDLE hf = CreateFileW(wpath.data(), GENERIC_WRITE, 0, NULL,
                            CREATE_ALWAYS, FILE_ATTRIBUTE_NORMAL, NULL);
    if (hf == INVALID_HANDLE_VALUE) return false;
    DWORD written = 0;
    BOOL ok = WriteFile(hf, png.data(), (DWORD)png.size(), &written, NULL);
    CloseHandle(hf);
    return ok && written == png.size();
}

//============================================================
//  Image compare (PNG baseline vs current)
//
//  stb_image.h で PNG を読み、ピクセル単位の最大/平均差分を計算する。
//  テストのビジュアル回帰検出に使用。
//============================================================

struct ImgData
{
    int w = 0, h = 0;
    std::vector<unsigned char> rgba;   // 4 チャネル固定で正規化
};

static bool load_png_file(const char* path_utf8, ImgData& out)
{
    if (!path_utf8) return false;
    int wlen = MultiByteToWideChar(CP_UTF8, 0, path_utf8, -1, NULL, 0);
    if (wlen <= 0) return false;
    std::vector<wchar_t> wpath(wlen);
    MultiByteToWideChar(CP_UTF8, 0, path_utf8, -1, wpath.data(), wlen);

    HANDLE hf = CreateFileW(wpath.data(), GENERIC_READ, FILE_SHARE_READ, NULL,
                            OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, NULL);
    if (hf == INVALID_HANDLE_VALUE) return false;
    LARGE_INTEGER sz;
    if (!GetFileSizeEx(hf, &sz)) { CloseHandle(hf); return false; }
    if (sz.QuadPart > 256 * 1024 * 1024) { CloseHandle(hf); return false; }
    std::vector<unsigned char> buf((size_t)sz.QuadPart);
    DWORD got = 0;
    if (!ReadFile(hf, buf.data(), (DWORD)buf.size(), &got, NULL) || got != buf.size()) {
        CloseHandle(hf);
        return false;
    }
    CloseHandle(hf);

    int w, h, channels;
    unsigned char* pix = stbi_load_from_memory(buf.data(), (int)buf.size(),
                                               &w, &h, &channels, 4);
    if (!pix) return false;
    out.w = w;
    out.h = h;
    out.rgba.assign(pix, pix + (size_t)w * h * 4);
    stbi_image_free(pix);
    return true;
}

// compare 結果
struct ImgCmpResult
{
    bool loaded_ok   = false;
    bool dim_match   = false;
    int  w_a = 0, h_a = 0;
    int  w_b = 0, h_b = 0;
    int  max_diff    = 0;     // 0..255 (RGB 各チャネルの最大)
    int  diff_pixels = 0;     // tolerance を超えたピクセル数
    double mean_diff = 0.0;
};

static bool compare_images(const ImgData& a, const ImgData& b, int tol,
                           ImgCmpResult& r)
{
    r.w_a = a.w; r.h_a = a.h;
    r.w_b = b.w; r.h_b = b.h;
    r.dim_match = (a.w == b.w) && (a.h == b.h);
    if (!r.dim_match) { r.max_diff = 255; r.diff_pixels = -1; return false; }

    int n = a.w * a.h;
    long long sum = 0;
    int maxd = 0;
    int diffp = 0;
    for (int i = 0; i < n; i++) {
        int dr = (int)a.rgba[i*4+0] - (int)b.rgba[i*4+0]; if (dr < 0) dr = -dr;
        int dg = (int)a.rgba[i*4+1] - (int)b.rgba[i*4+1]; if (dg < 0) dg = -dg;
        int db = (int)a.rgba[i*4+2] - (int)b.rgba[i*4+2]; if (db < 0) db = -db;
        int px_max = dr; if (dg > px_max) px_max = dg; if (db > px_max) px_max = db;
        if (px_max > maxd)  maxd = px_max;
        if (px_max > tol)   diffp++;
        sum += px_max;
    }
    r.max_diff    = maxd;
    r.diff_pixels = diffp;
    r.mean_diff   = (double)sum / (double)n;
    return diffp == 0;
}

// --- forward decl (defined below) ---
static bool save_png(const char* path, int w, int h, const BYTE* bgra_top_down);

// diff 画像書き出し (差分があったピクセルを赤、なければ元画像をグレースケール化)
static bool save_diff_png(const char* path_utf8, const ImgData& a, const ImgData& b, int tol)
{
    if (a.w != b.w || a.h != b.h) return false;
    int n = a.w * a.h;
    std::vector<unsigned char> out((size_t)n * 4);
    for (int i = 0; i < n; i++) {
        int dr = (int)a.rgba[i*4+0] - (int)b.rgba[i*4+0]; if (dr < 0) dr = -dr;
        int dg = (int)a.rgba[i*4+1] - (int)b.rgba[i*4+1]; if (dg < 0) dg = -dg;
        int db = (int)a.rgba[i*4+2] - (int)b.rgba[i*4+2]; if (db < 0) db = -db;
        int px_max = dr; if (dg > px_max) px_max = dg; if (db > px_max) px_max = db;
        if (px_max > tol) {
            // 赤でマーク
            out[i*4+0] = 0;    // B
            out[i*4+1] = 0;    // G
            out[i*4+2] = 255;  // R
            out[i*4+3] = 255;
        } else {
            // 元画像を薄くグレー化 (baseline側)
            unsigned char r = a.rgba[i*4+0];
            unsigned char g = a.rgba[i*4+1];
            unsigned char bv = a.rgba[i*4+2];
            unsigned char y = (unsigned char)((r * 30 + g * 59 + bv * 11) / 300); // ~1/10 輝度
            out[i*4+0] = y;  // B
            out[i*4+1] = y;  // G
            out[i*4+2] = y;  // R
            out[i*4+3] = 255;
        }
    }
    return save_png(path_utf8, a.w, a.h, out.data());
}

static void emit_image_cmp_event(const char* baseline, const char* current,
                                 const ImgCmpResult& r, int tol, bool pass)
{
    std::string s;
    json_open(s, "image_cmp");
    s += ",\"baseline\":";
    json_append_escaped(s, baseline ? baseline : "");
    s += ",\"current\":";
    json_append_escaped(s, current ? current : "");
    char buf[256];
    snprintf(buf, sizeof(buf),
             ",\"w_a\":%d,\"h_a\":%d,\"w_b\":%d,\"h_b\":%d,"
             "\"tolerance\":%d,\"max_diff\":%d,\"diff_pixels\":%d,\"mean_diff\":%.4f,\"pass\":%s",
             r.w_a, r.h_a, r.w_b, r.h_b,
             tol, r.max_diff, r.diff_pixels, r.mean_diff,
             pass ? "true" : "false");
    s += buf;
    json_close_and_emit(s);
}

// int 返り値:
//   >= 0  最大ピクセル差分 (0..255)
//   -1    baseline をロードできない
//   -2    current をロードできない
//   -3    サイズ不一致
EXPORT int __cdecl testrt_image_cmp(const char* baseline, const char* current, int tolerance)
{
    ImgData a, b;
    if (!load_png_file(baseline, a)) return -1;
    if (!load_png_file(current,  b)) return -2;
    ImgCmpResult r;
    bool pass = compare_images(a, b, tolerance, r);
    emit_image_cmp_event(baseline, current, r, tolerance, pass);
    if (!r.dim_match) return -3;
    return r.max_diff;
}

// diff 画像を書き出す。戻り値は testrt_image_cmp と同じ。
EXPORT int __cdecl testrt_image_diff(const char* baseline, const char* current,
                                     const char* diff_out, int tolerance)
{
    ImgData a, b;
    if (!load_png_file(baseline, a)) return -1;
    if (!load_png_file(current,  b)) return -2;
    ImgCmpResult r;
    bool pass = compare_images(a, b, tolerance, r);
    emit_image_cmp_event(baseline, current, r, tolerance, pass);
    if (r.dim_match && diff_out && *diff_out) {
        save_diff_png(diff_out, a, b, tolerance);
    }
    if (!r.dim_match) return -3;
    return r.max_diff;
}

// expect 形式ラッパ: baseline vs current を比較し、tolerance 超過ピクセルがなければ pass。
EXPORT void __cdecl testrt_expect_image_eq(const char* baseline, const char* current,
                                           int tolerance, const char* message)
{
    ImgData a, b;
    if (!load_png_file(baseline, a)) {
        record_fail(message ? message : "expect_image_eq",
                    (std::string("cannot load baseline: ") + (baseline?baseline:"")).c_str());
        return;
    }
    if (!load_png_file(current, b)) {
        record_fail(message ? message : "expect_image_eq",
                    (std::string("cannot load current: ") + (current?current:"")).c_str());
        return;
    }
    ImgCmpResult r;
    bool pass = compare_images(a, b, tolerance, r);
    emit_image_cmp_event(baseline, current, r, tolerance, pass);
    if (pass) {
        record_pass();
    } else {
        char detail[192];
        if (!r.dim_match) {
            snprintf(detail, sizeof(detail),
                     "dim mismatch: baseline=%dx%d current=%dx%d",
                     r.w_a, r.h_a, r.w_b, r.h_b);
        } else {
            snprintf(detail, sizeof(detail),
                     "diff_pixels=%d max_diff=%d mean_diff=%.4f tol=%d (size=%dx%d)",
                     r.diff_pixels, r.max_diff, r.mean_diff, tolerance, r.w_a, r.h_a);
        }
        record_fail(message ? message : "expect_image_eq", detail);
    }
}

//============================================================
//  DllMain
//============================================================

BOOL APIENTRY DllMain(HINSTANCE, DWORD reason, LPVOID)
{
    if (reason == DLL_PROCESS_ATTACH) {
        get_stderr();
    }
    return TRUE;
}
