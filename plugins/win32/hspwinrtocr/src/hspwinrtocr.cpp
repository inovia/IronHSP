//============================================================
//   hspwinrtocr.dll — WinRT OCR plugin for IronHSP (新形式)
//
//   Windows.Media.Ocr.OcrEngine (Win10+) を C++/WinRT で叩き、
//   画像ファイルから文字認識を行う HSP プラグイン。
//
//   v2 (2026-04-15): OLDDLL $202 → typed #func 形式に全面移行。
//   HSPEXINFO callback を一切使わず、全 export は普通の C 関数。
//
//   HSP API (typed #func):
//     ocr_init       "lang"                        ; "" ならユーザ言語
//     ocr_free
//     ocr_langs      var_buf, buf_size             ; LF 区切り
//     ocr_run_file   var_buf, buf_size, "path"
//     ocr_run_hwnd   var_buf, buf_size             ; 現状 stub (BMSCR は #func 形式から直接触れない)
//
//   __has_include フォールバックなし (C++/WinRT は VS 2022 標準で入る)。
//============================================================

#define WIN32_LEAN_AND_MEAN
#define NOMINMAX
#include <windows.h>

// C++/WinRT
#include <winrt/base.h>
#include <windows.foundation.h>
#include <MemoryBuffer.h>
#include <winrt/Windows.Foundation.h>
#include <winrt/Windows.Foundation.Collections.h>
#include <winrt/Windows.Globalization.h>
#include <winrt/Windows.Storage.h>
#include <winrt/Windows.Storage.Streams.h>
#include <winrt/Windows.Graphics.Imaging.h>
#include <winrt/Windows.Media.Ocr.h>

#include <string>
#include <vector>
#include <cstring>
#include <cstdio>

#pragma comment(lib, "windowsapp.lib")

#define HSPWINRTOCR_EXPORT extern "C" __declspec(dllexport)

// ============================================================
// helpers
// ============================================================
static std::wstring AnsiToWide(const char* s)
{
    if (!s || !*s) return L"";
    int n = MultiByteToWideChar(CP_ACP, 0, s, -1, nullptr, 0);
    if (n <= 0) return L"";
    std::vector<wchar_t> buf(n);
    MultiByteToWideChar(CP_ACP, 0, s, -1, buf.data(), n);
    return std::wstring(buf.data());
}

static std::string WideToAnsi(const wchar_t* w, size_t wlen)
{
    if (!w || wlen == 0) return "";
    int n = WideCharToMultiByte(CP_ACP, 0, w, (int)wlen, nullptr, 0, nullptr, nullptr);
    if (n <= 0) return "";
    std::vector<char> buf(n);
    WideCharToMultiByte(CP_ACP, 0, w, (int)wlen, buf.data(), n, nullptr, nullptr);
    return std::string(buf.data(), n);
}

static std::string HStringToAnsi(winrt::hstring const& h)
{
    return WideToAnsi(h.c_str(), h.size());
}

static void copy_to_buf(const std::string& src, char* out, int out_size)
{
    if (!out || out_size <= 0) return;
    int n = (int)src.size();
    if (n >= out_size) n = out_size - 1;
    if (n > 0) memcpy(out, src.data(), (size_t)n);
    out[n] = 0;
}

// ============================================================
// WinRT OcrEngine state
// ============================================================
namespace {
using namespace winrt;
using namespace winrt::Windows::Foundation;
using namespace winrt::Windows::Foundation::Collections;
using namespace winrt::Windows::Globalization;
using namespace winrt::Windows::Storage;
using namespace winrt::Windows::Storage::Streams;
using namespace winrt::Windows::Graphics::Imaging;
using namespace winrt::Windows::Media::Ocr;

static bool       g_engine_ready = false;
static OcrEngine  g_engine{ nullptr };
static bool       g_apartment_inited = false;

static void EnsureApartment()
{
    if (g_apartment_inited) return;
    try {
        winrt::init_apartment(winrt::apartment_type::multi_threaded);
    } catch (...) {}
    g_apartment_inited = true;
}

static std::string OcrResultToAnsi(OcrResult const& result)
{
    if (!result) return "";
    return HStringToAnsi(result.Text());
}
} // namespace

// ============================================================
// HSP plugin exports (typed #func)
// ============================================================

// ocr_init "lang"   (lang="" なら user profile)
HSPWINRTOCR_EXPORT int __stdcall ocr_init(const char* lang)
{
    EnsureApartment();
    try {
        if (lang && *lang) {
            std::wstring wl = AnsiToWide(lang);
            Language language{ hstring{ wl } };
            if (!OcrEngine::IsLanguageSupported(language)) return -2;
            g_engine = OcrEngine::TryCreateFromLanguage(language);
        } else {
            g_engine = OcrEngine::TryCreateFromUserProfileLanguages();
        }
        if (!g_engine) {
            g_engine_ready = false;
            return -1;
        }
        g_engine_ready = true;
        return 0;
    } catch (...) {
        g_engine_ready = false;
        return -1;
    }
}

// ocr_free
HSPWINRTOCR_EXPORT int __stdcall ocr_free()
{
    g_engine = nullptr;
    g_engine_ready = false;
    return 0;
}

// ocr_langs(var_buf, buf_size)
HSPWINRTOCR_EXPORT int __stdcall ocr_langs(char* out_buf, int out_size)
{
    if (out_buf && out_size > 0) out_buf[0] = 0;
    EnsureApartment();
    try {
        auto langs = OcrEngine::AvailableRecognizerLanguages();
        std::string out;
        for (auto const& lang : langs) {
            if (!out.empty()) out += '\n';
            out += HStringToAnsi(lang.LanguageTag());
        }
        copy_to_buf(out, out_buf, out_size);
        return 0;
    } catch (...) {
        return -1;
    }
}

// ocr_run_file(var_buf, buf_size, "path")
HSPWINRTOCR_EXPORT int __stdcall ocr_run_file(char* out_buf, int out_size, const char* path_a)
{
    if (out_buf && out_size > 0) out_buf[0] = 0;
    if (!g_engine_ready || !g_engine) return -1;
    if (!path_a || !*path_a) return -2;
    try {
        std::wstring wpath = AnsiToWide(path_a);
        wchar_t full[MAX_PATH * 2];
        DWORD fn = GetFullPathNameW(wpath.c_str(), (DWORD)(sizeof(full) / sizeof(full[0])), full, nullptr);
        if (fn == 0) return -3;

        StorageFile file = StorageFile::GetFileFromPathAsync(hstring{ full }).get();
        IRandomAccessStream stream = file.OpenAsync(FileAccessMode::Read).get();
        BitmapDecoder decoder = BitmapDecoder::CreateAsync(stream).get();
        SoftwareBitmap bitmap = decoder.GetSoftwareBitmapAsync().get();

        OcrResult result = g_engine.RecognizeAsync(bitmap).get();
        std::string out = OcrResultToAnsi(result);
        copy_to_buf(out, out_buf, out_size);
        return 0;
    } catch (...) {
        return -1;
    }
}

// ocr_run_hwnd(var_buf, buf_size)  — 新形式では BMSCR へ直接触れないため stub
HSPWINRTOCR_EXPORT int __stdcall ocr_run_hwnd(char* out_buf, int out_size)
{
    if (out_buf && out_size > 0) out_buf[0] = 0;
    // NOTE: BMSCR から画像を取るには HSPEXINFO が必要。新形式に移行したので
    // この関数は future work。将来 bmp_capture 経由で path 指定にする想定。
    copy_to_buf("[ocr_run_hwnd: not implemented in v2 typed form]", out_buf, out_size);
    return -1;
}

// ============================================================
// DllMain
// ============================================================
BOOL WINAPI DllMain(HMODULE, DWORD reason, LPVOID)
{
    switch (reason) {
    case DLL_PROCESS_ATTACH:
        try {
            winrt::init_apartment(winrt::apartment_type::multi_threaded);
            g_apartment_inited = true;
        } catch (...) {}
        break;
    case DLL_PROCESS_DETACH:
        g_engine = nullptr;
        g_engine_ready = false;
        break;
    }
    return TRUE;
}
