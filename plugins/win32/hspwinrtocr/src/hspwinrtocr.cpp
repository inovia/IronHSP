//============================================================
//   hspwinrtocr.dll — WinRT OCR plugin for IronHSP
//
//   Windows.Media.Ocr.OcrEngine (Win10+) を C++/WinRT で叩き、
//   画像ファイルや HSP ウィンドウ画像から文字認識を行う HSP プラグイン。
//
//   HSP API (all OLDDLL $202):
//     ocr_init            [, "lang"]         ; OcrEngine 作成 (stat=0 成功)
//     ocr_free                                ; 解放
//     ocr_langs           var_str             ; 利用可能言語一覧 (LF 区切り)
//     ocr_run_file        var_str, "path"     ; 画像ファイルを OCR
//     ocr_run_hwnd        var_str             ; HSP カレント window を OCR
//
//   実装メモ:
//     - init_apartment は multi_threaded (MTA) で DllMain PROCESS_ATTACH 時に一度。
//     - async は .get() で同期待ち (HSP は同期呼び出し前提)。
//     - WinRT は UTF-16。結果は cp932 (CP_ACP) へ WideCharToMultiByte。
//     - Lang パラメータも cp932 → UTF-16 で受ける (BCP-47 なので ASCII 想定)。
//     - OLDDLL $202 規約 (hspjson.cpp のパターンに準拠)。
//     - ocr_run_hwnd は BMSCR から 24bit BGR DIB を取り、Bgra8 SoftwareBitmap に
//       詰めて CreateWithBitmap の代わりに RecognizeAsync に渡す。
//============================================================

#define WIN32_LEAN_AND_MEAN
#define NOMINMAX
#include <windows.h>

// HSP SDK
#ifndef HSPWIN
#define HSPWIN
#endif
#if defined(_WIN64) && !defined(HSP64)
#define HSP64
#endif
#pragma warning(push)
#pragma warning(disable: 4819)  // hsp3 headers are SJIS encoded
#include "../../../../hsp3/hsp3debug.h"
#include "../../../../hsp3/hsp3struct.h"
#include "../../../../hsp3/hspwnd.h"
#pragma warning(pop)

// C++/WinRT
#include <winrt/base.h>
#include <windows.foundation.h>
#include <MemoryBuffer.h>  // ::Windows::Foundation::IMemoryBufferByteAccess
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
// HSPEXINFO helpers (hspjson.cpp と同じパターン)
// ============================================================
namespace {

HSPEXINFO* g_hei = nullptr;
inline void   set_hei(HSPEXINFO* hei) { g_hei = hei; }
inline int    getint()  { return g_hei->HspFunc_prm_geti(); }
inline char*  getstr()  { return g_hei->HspFunc_prm_gets(); }
inline int    getint_opt(int defv)
{
    // 省略可能なら HspFunc_prm_getdi を使う
    return g_hei->HspFunc_prm_getdi(defv);
}
inline char*  getstr_opt(const char* defv)
{
    return g_hei->HspFunc_prm_getds(defv);
}

static void write_str_to_var(const std::string& s)
{
    PVal* pv = nullptr;
    APTR a = g_hei->HspFunc_prm_getva(&pv);
    if (!pv) return;
    if (pv->flag != HSPVAR_FLAG_STR) return;
    pv->offset = a;
    HspVarProc* proc = g_hei->HspFunc_getproc(pv->flag);
    proc->Set(pv, proc->GetPtr(pv), (void*)s.c_str());
}

// ============================================================
// UTF-16 <-> cp932 (HSP default) conversion
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

} // namespace

// ============================================================
// WinRT OcrEngine state (single global instance)
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

// ============================================================
// HSP カレント window の BMSCR から Bgra8 SoftwareBitmap を作成
// ============================================================
static SoftwareBitmap BmscrToSoftwareBitmap()
{
    // カレント window id を取得 (actscr)
    int wid = *(g_hei->actscr);
    BMSCR* bm = (BMSCR*)g_hei->HspFunc_getbmscr(wid);
    if (!bm || !bm->pBit || bm->sx <= 0 || bm->sy <= 0) {
        return SoftwareBitmap{ nullptr };
    }

    const int w = bm->sx;
    const int h = bm->sy;

    // BMSCR の DIB は 24bit BGR、bottom-up、各行 4byte align
    const int src_stride = ((w * 3 + 3) / 4) * 4;
    BYTE* src_base = (BYTE*)bm->pBit;

    // Bgra8 SoftwareBitmap を作って pixels を直接書く
    SoftwareBitmap sb{ BitmapPixelFormat::Bgra8, w, h, BitmapAlphaMode::Premultiplied };
    {
        auto buffer = sb.LockBuffer(BitmapBufferAccessMode::Write);
        auto ref    = buffer.CreateReference();
        auto byteaccess = ref.as<::Windows::Foundation::IMemoryBufferByteAccess>();
        BYTE*   dst_base = nullptr;
        UINT32  dst_cap  = 0;
        winrt::check_hresult(byteaccess->GetBuffer(&dst_base, &dst_cap));

        auto desc = buffer.GetPlaneDescription(0);
        const int dst_stride = desc.Stride;

        for (int y = 0; y < h; ++y) {
            // bottom-up なので src 行は (h - 1 - y)
            const BYTE* sp = src_base + (size_t)(h - 1 - y) * src_stride;
            BYTE* dp = dst_base + (size_t)desc.StartIndex + (size_t)y * dst_stride;
            for (int x = 0; x < w; ++x) {
                BYTE b = sp[0];
                BYTE g = sp[1];
                BYTE r = sp[2];
                dp[0] = b;
                dp[1] = g;
                dp[2] = r;
                dp[3] = 0xFF;
                sp += 3;
                dp += 4;
            }
        }
    }
    return sb;
}

// 結果から join テキスト (OcrResult::Text 全文) を返す
static std::string OcrResultToAnsi(OcrResult const& result)
{
    if (!result) return "";
    auto text = result.Text();
    return HStringToAnsi(text);
}

} // namespace

// ============================================================
// HSP plugin exports (OLDDLL $202)
// ============================================================

// ocr_init [, "lang"]
HSPWINRTOCR_EXPORT BOOL WINAPI ocr_init(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    try {
        char* lang = getstr_opt("");
        if (lang && *lang) {
            std::wstring wl = AnsiToWide(lang);
            Language language{ hstring{ wl } };
            if (!OcrEngine::IsLanguageSupported(language)) {
                return -2;
            }
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
    } catch (winrt::hresult_error const&) {
        g_engine_ready = false;
        return -1;
    } catch (...) {
        g_engine_ready = false;
        return -1;
    }
}

// ocr_free
HSPWINRTOCR_EXPORT BOOL WINAPI ocr_free(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    g_engine = nullptr;
    g_engine_ready = false;
    return 0;
}

// ocr_langs var_str
HSPWINRTOCR_EXPORT BOOL WINAPI ocr_langs(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    try {
        auto langs = OcrEngine::AvailableRecognizerLanguages();
        std::string out;
        for (auto const& lang : langs) {
            if (!out.empty()) out += '\n';
            out += HStringToAnsi(lang.LanguageTag());
        }
        write_str_to_var(out);
        return 0;
    } catch (...) {
        write_str_to_var("");
        return -1;
    }
}

// ocr_run_file var_str, "path"
HSPWINRTOCR_EXPORT BOOL WINAPI ocr_run_file(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    if (!g_engine_ready || !g_engine) {
        write_str_to_var("");
        return -1;
    }
    try {
        const char* path_a = getstr();
        if (!path_a || !*path_a) { write_str_to_var(""); return -2; }

        std::wstring wpath = AnsiToWide(path_a);
        // 絶対パスに正規化しておく (GetFileFromPathAsync は絶対パス必須)
        wchar_t full[MAX_PATH * 2];
        DWORD   fn = GetFullPathNameW(wpath.c_str(), (DWORD)(sizeof(full) / sizeof(full[0])), full, nullptr);
        if (fn == 0) { write_str_to_var(""); return -3; }

        StorageFile file = StorageFile::GetFileFromPathAsync(hstring{ full }).get();
        IRandomAccessStream stream = file.OpenAsync(FileAccessMode::Read).get();
        BitmapDecoder decoder = BitmapDecoder::CreateAsync(stream).get();
        SoftwareBitmap bitmap = decoder.GetSoftwareBitmapAsync().get();

        OcrResult result = g_engine.RecognizeAsync(bitmap).get();
        std::string out = OcrResultToAnsi(result);
        write_str_to_var(out);
        return 0;
    } catch (winrt::hresult_error const&) {
        write_str_to_var("");
        return -1;
    } catch (...) {
        write_str_to_var("");
        return -1;
    }
}

// ocr_run_hwnd var_str
HSPWINRTOCR_EXPORT BOOL WINAPI ocr_run_hwnd(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    if (!g_engine_ready || !g_engine) {
        write_str_to_var("");
        return -1;
    }
    try {
        SoftwareBitmap sb = BmscrToSoftwareBitmap();
        if (!sb) { write_str_to_var(""); return -2; }

        OcrResult result = g_engine.RecognizeAsync(sb).get();
        std::string out = OcrResultToAnsi(result);
        write_str_to_var(out);
        return 0;
    } catch (winrt::hresult_error const&) {
        write_str_to_var("");
        return -1;
    } catch (...) {
        write_str_to_var("");
        return -1;
    }
}

// ============================================================
// DllMain — apartment init
// ============================================================
BOOL WINAPI DllMain(HMODULE, DWORD reason, LPVOID)
{
    switch (reason) {
    case DLL_PROCESS_ATTACH:
        try {
            // MTA。HSP 本体の UI スレッドは STA だが、この DLL は
            // 独立した MTA として初期化し、WinRT async 待機で deadlock
            // しないようにする。
            winrt::init_apartment(winrt::apartment_type::multi_threaded);
        } catch (...) {
            // 既に初期化済の場合は無視
        }
        break;
    case DLL_PROCESS_DETACH:
        g_engine = nullptr;
        g_engine_ready = false;
        break;
    }
    return TRUE;
}
