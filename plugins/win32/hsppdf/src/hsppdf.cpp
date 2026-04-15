//============================================================
//   hsppdf.dll — PDFium 読み取りプラグイン for IronHSP (新形式)
//
//   bblanchon/pdfium-binaries prebuilt を third_party/pdfium/ に配置。
//   fpdfview.h / fpdf_text.h / fpdf_doc.h の薄いラッパ。
//
//   v2 (2026-04-15): OLDDLL $202 → typed #func 形式に全面移行。
//
//   HSP API (typed #func):
//     pdf_init
//     pdf_shutdown
//     pdf_load            "file.pdf", "password", var_hid
//     pdf_close           hid
//     pdf_page_count      hid, var_int
//     pdf_page_size       hid, page, var_w_dbl, var_h_dbl    (points)
//     pdf_render_bitmap   hid, page, scale, var_buf, var_w_int, var_h_int   (BGRA raw)
//     pdf_render_to_hspwnd hid, page, scale                   (v2 未対応, -1)
//     pdf_get_text        hid, page, var_buf, buf_size        (cp932)
//     pdf_doc_title       hid, var_buf, buf_size
//     pdf_doc_author      hid, var_buf, buf_size
//
//   PDFium 未配置時 (__has_include("fpdfview.h") == false) は stub として
//   ビルド可能 (全関数が -100 / 0 を返す)。
//============================================================

#define WIN32_LEAN_AND_MEAN
#include <windows.h>
#include <string>
#include <vector>
#include <array>
#include <cstring>
#include <cstdio>
#include <cstdlib>
#include <cstdint>

// ---------- PDFium ----------
#if __has_include("fpdfview.h")
  #include "fpdfview.h"
  #include "fpdf_text.h"
  #include "fpdf_doc.h"
  #define HSPPDF_HAVE_PDFIUM 1
#else
  #define HSPPDF_HAVE_PDFIUM 0
  typedef void* FPDF_DOCUMENT;
  typedef void* FPDF_PAGE;
  typedef void* FPDF_BITMAP;
  typedef void* FPDF_TEXTPAGE;
  typedef unsigned short FPDF_WCHAR;
#endif

#define HSPPDF_EXPORT extern "C" __declspec(dllexport)

// ============================================================
// helpers
// ============================================================
static void copy_to_buf(const char* src, char* out, int out_size)
{
    if (!out || out_size <= 0) return;
    if (!src) src = "";
    int n = (int)strlen(src);
    if (n >= out_size) n = out_size - 1;
    if (n > 0) memcpy(out, src, (size_t)n);
    out[n] = 0;
}

static std::string utf16_to_cp932(const wchar_t* wstr, int wlen)
{
    if (!wstr || wlen <= 0) return std::string();
    int need = WideCharToMultiByte(CP_ACP, 0, wstr, wlen, nullptr, 0, nullptr, nullptr);
    if (need <= 0) return std::string();
    std::string out((size_t)need, '\0');
    WideCharToMultiByte(CP_ACP, 0, wstr, wlen, out.data(), need, nullptr, nullptr);
    return out;
}

// ============================================================
// Document handle table
// ============================================================
struct DocState {
    bool          used = false;
    FPDF_DOCUMENT doc  = nullptr;
};

static std::array<DocState, 16> g_docs;
static bool g_pdfium_inited = false;

static int alloc_slot() {
    for (int i = 0; i < (int)g_docs.size(); ++i) {
        if (!g_docs[i].used) return i;
    }
    return -1;
}

static void free_slot(int h) {
    if (h < 0 || h >= (int)g_docs.size()) return;
    DocState& d = g_docs[h];
    if (!d.used) return;
#if HSPPDF_HAVE_PDFIUM
    if (d.doc) FPDF_CloseDocument(d.doc);
#endif
    d.doc = nullptr;
    d.used = false;
}

static DocState* get_slot(int h) {
    if (h < 0 || h >= (int)g_docs.size()) return nullptr;
    if (!g_docs[h].used) return nullptr;
    return &g_docs[h];
}

// ============================================================
// HSP exports (typed #func)
// ============================================================

HSPPDF_EXPORT int __stdcall pdf_init()
{
#if HSPPDF_HAVE_PDFIUM
    if (!g_pdfium_inited) {
        FPDF_LIBRARY_CONFIG cfg{};
        cfg.version = 2;
        cfg.m_pUserFontPaths = nullptr;
        cfg.m_pIsolate = nullptr;
        cfg.m_v8EmbedderSlot = 0;
        FPDF_InitLibraryWithConfig(&cfg);
        g_pdfium_inited = true;
    }
#endif
    return 0;
}

HSPPDF_EXPORT int __stdcall pdf_shutdown()
{
    for (int i = 0; i < (int)g_docs.size(); ++i) free_slot(i);
#if HSPPDF_HAVE_PDFIUM
    if (g_pdfium_inited) {
        FPDF_DestroyLibrary();
        g_pdfium_inited = false;
    }
#endif
    return 0;
}

// pdf_load("file", "password", var_hid)  password="" = no password
HSPPDF_EXPORT int __stdcall pdf_load(
    const char* path, const char* password, int* out_hid)
{
    if (out_hid) *out_hid = -1;
    if (!path) return -1;
    const char* pw = (password && password[0]) ? password : nullptr;

#if HSPPDF_HAVE_PDFIUM
    if (!g_pdfium_inited) {
        FPDF_LIBRARY_CONFIG cfg{};
        cfg.version = 2;
        FPDF_InitLibraryWithConfig(&cfg);
        g_pdfium_inited = true;
    }
    FPDF_DOCUMENT doc = FPDF_LoadDocument(path, pw);
    if (!doc) { if (out_hid) *out_hid = -10; return 0; }

    int h = alloc_slot();
    if (h < 0) { FPDF_CloseDocument(doc); return 0; }
    g_docs[h].used = true;
    g_docs[h].doc  = doc;
    if (out_hid) *out_hid = h;
#else
    (void)pw;
    if (out_hid) *out_hid = -100;
#endif
    return 0;
}

HSPPDF_EXPORT int __stdcall pdf_close(int h)
{
    free_slot(h);
    return 0;
}

HSPPDF_EXPORT int __stdcall pdf_page_count(int h, int* out)
{
    if (out) *out = -1;
    DocState* d = get_slot(h);
    if (!d) return 0;
#if HSPPDF_HAVE_PDFIUM
    if (out) *out = FPDF_GetPageCount(d->doc);
#else
    if (out) *out = -100;
#endif
    return 0;
}

// pdf_page_size(h, page, var_w_dbl, var_h_dbl)
HSPPDF_EXPORT int __stdcall pdf_page_size(
    int h, int pg, double* out_w, double* out_h)
{
    if (out_w) *out_w = 0.0;
    if (out_h) *out_h = 0.0;
    DocState* d = get_slot(h);
    if (!d) return 0;
#if HSPPDF_HAVE_PDFIUM
    FPDF_PAGE page = FPDF_LoadPage(d->doc, pg);
    if (!page) return 0;
    if (out_w) *out_w = FPDF_GetPageWidth(page);
    if (out_h) *out_h = FPDF_GetPageHeight(page);
    FPDF_ClosePage(page);
#endif
    return 0;
}

// pdf_render_bitmap(h, pg, scale, var_buf, var_w_int, var_h_int)
HSPPDF_EXPORT int __stdcall pdf_render_bitmap(
    int h, int pg, double scale,
    void* out_buf, int* out_w, int* out_h)
{
    if (out_w) *out_w = 0;
    if (out_h) *out_h = 0;
    DocState* d = get_slot(h);
    if (!d) return 0;
#if HSPPDF_HAVE_PDFIUM
    FPDF_PAGE page = FPDF_LoadPage(d->doc, pg);
    if (!page) return 0;

    double pw = FPDF_GetPageWidth(page);
    double ph = FPDF_GetPageHeight(page);
    int W = (int)(pw * scale + 0.5);
    int H = (int)(ph * scale + 0.5);
    if (W <= 0 || H <= 0) { FPDF_ClosePage(page); return 0; }

    FPDF_BITMAP bmp = FPDFBitmap_Create(W, H, 1);
    if (!bmp) { FPDF_ClosePage(page); return 0; }
    FPDFBitmap_FillRect(bmp, 0, 0, W, H, 0xFFFFFFFF);
    FPDF_RenderPageBitmap(bmp, page, 0, 0, W, H, 0, FPDF_ANNOT);

    void* src = FPDFBitmap_GetBuffer(bmp);
    int stride = FPDFBitmap_GetStride(bmp);
    size_t total = (size_t)stride * (size_t)H;

    if (out_buf && src) memcpy(out_buf, src, total);

    FPDFBitmap_Destroy(bmp);
    FPDF_ClosePage(page);

    if (out_w) *out_w = W;
    if (out_h) *out_h = H;
#else
    (void)scale; (void)out_buf;
#endif
    return 0;
}

// pdf_render_to_hspwnd — v2 typed #func 形式では BMSCR に直接触れないので
// 非対応 (-1)。pdf_render_bitmap で BGRA raw を取って mref 経由で描画する想定。
HSPPDF_EXPORT int __stdcall pdf_render_to_hspwnd(int h, int pg, double scale)
{
    (void)h; (void)pg; (void)scale;
    return -1;
}

// pdf_get_text(h, pg, var_buf, buf_size)
HSPPDF_EXPORT int __stdcall pdf_get_text(
    int h, int pg, char* out_buf, int out_size)
{
    if (out_buf && out_size > 0) out_buf[0] = 0;
    DocState* d = get_slot(h);
    if (!d) return 0;
#if HSPPDF_HAVE_PDFIUM
    FPDF_PAGE page = FPDF_LoadPage(d->doc, pg);
    if (!page) return 0;
    FPDF_TEXTPAGE tp = FPDFText_LoadPage(page);
    if (!tp) { FPDF_ClosePage(page); return 0; }

    int nchar = FPDFText_CountChars(tp);
    std::string mb;
    if (nchar > 0) {
        std::vector<unsigned short> buf((size_t)nchar + 1, 0);
        int got = FPDFText_GetText(tp, 0, nchar, buf.data());
        if (got > 1) {
            mb = utf16_to_cp932((const wchar_t*)buf.data(), got - 1);
        }
    }

    FPDFText_ClosePage(tp);
    FPDF_ClosePage(page);

    copy_to_buf(mb.c_str(), out_buf, out_size);
#endif
    return 0;
}

#if HSPPDF_HAVE_PDFIUM
static std::string get_metadata_cp932(FPDF_DOCUMENT doc, const char* tag)
{
    unsigned long need = FPDF_GetMetaText(doc, tag, nullptr, 0);
    if (need <= 2) return std::string();
    std::vector<unsigned char> bytes((size_t)need, 0);
    FPDF_GetMetaText(doc, tag, bytes.data(), need);
    const wchar_t* wp = (const wchar_t*)bytes.data();
    int wlen = (int)(need / 2) - 1;
    return utf16_to_cp932(wp, wlen);
}
#endif

HSPPDF_EXPORT int __stdcall pdf_doc_title(int h, char* out_buf, int out_size)
{
    if (out_buf && out_size > 0) out_buf[0] = 0;
    DocState* d = get_slot(h);
    if (!d) return 0;
#if HSPPDF_HAVE_PDFIUM
    std::string s = get_metadata_cp932(d->doc, "Title");
    copy_to_buf(s.c_str(), out_buf, out_size);
#endif
    return 0;
}

HSPPDF_EXPORT int __stdcall pdf_doc_author(int h, char* out_buf, int out_size)
{
    if (out_buf && out_size > 0) out_buf[0] = 0;
    DocState* d = get_slot(h);
    if (!d) return 0;
#if HSPPDF_HAVE_PDFIUM
    std::string s = get_metadata_cp932(d->doc, "Author");
    copy_to_buf(s.c_str(), out_buf, out_size);
#endif
    return 0;
}

// ============================================================
// DllMain
// ============================================================
BOOL WINAPI DllMain(HINSTANCE, DWORD reason, LPVOID) {
    if (reason == DLL_PROCESS_DETACH) {
        for (int i = 0; i < (int)g_docs.size(); ++i) free_slot(i);
#if HSPPDF_HAVE_PDFIUM
        if (g_pdfium_inited) {
            FPDF_DestroyLibrary();
            g_pdfium_inited = false;
        }
#endif
    }
    return TRUE;
}
