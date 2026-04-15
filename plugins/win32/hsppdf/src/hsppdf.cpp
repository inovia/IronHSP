//============================================================
//   hsppdf.dll — PDFium 読み取りプラグイン for IronHSP
//
//   bblanchon/pdfium-binaries (https://github.com/bblanchon/pdfium-binaries)
//   prebuilt (~7 MB) を third_party/pdfium/ に配置して build する。
//   C API (fpdfview.h / fpdf_text.h / fpdf_doc.h) の薄いラッパ。
//
//   HSP API (全て OLDDLL $202 signature):
//     pdf_init
//     pdf_shutdown
//     pdf_load           "file.pdf" [, "password"], var_hid
//     pdf_close          hid
//     pdf_page_count     hid, var_int
//     pdf_page_size      hid, page, var_w, var_h                 (points = 1/72 inch, double)
//     pdf_render_bitmap  hid, page, scale, var_buf, var_w, var_h  (BGRA 32bit raw)
//     pdf_render_to_hspwnd hid, page, scale                        (current BMSCR に描画)
//     pdf_get_text       hid, page, var_str                        (UTF-16 → CP_ACP)
//     pdf_doc_title      hid, var_str
//     pdf_doc_author     hid, var_str
//
//   ドキュメントハンドルは 16 並列。使い終わったら pdf_close。
//
//   PDFium 未配置時 (__has_include("fpdfview.h") == false) は stub として
//   ビルド可能 (全関数が -100 を返す)。hspwasm と同じパターン。
//
//   iron_ai との連携で「PDF 要約」サンプルを書くときの要点:
//     - pdf_page_count で全ページ回収
//     - 各ページ pdf_get_text で CP_ACP 文字列を取り出して結合
//     - ai_chat / ai_complete に「次の PDF を要約してください: <text>」として投げる
//     - 長文は gpt-4o や claude opus のように context window が広いモデルを使う
//     - あるいは N ページずつ chunk して map-reduce
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

// ---------- HSP SDK ----------
#ifndef HSPWIN
#define HSPWIN
#endif
#if defined(_WIN64) && !defined(HSP64)
#define HSP64
#endif
#pragma warning(push)
#pragma warning(disable: 4819)
#include "../../../../hsp3/hsp3debug.h"
#include "../../../../hsp3/hsp3struct.h"
#include "../../../../hsp3/hspwnd.h"
#pragma warning(pop)

// ---------- PDFium ----------
//
// bblanchon/pdfium-binaries release から:
//   pdfium-windows-x64.tgz   (x64 用)
//   pdfium-windows-x86.tgz   (Win32 用)
// を DL して third_party/pdfium/ に展開する。詳しくは README.md 参照。
//
// 展開後は次のような構成:
//   third_party/pdfium/
//     include/fpdfview.h
//     include/fpdf_text.h
//     include/fpdf_doc.h
//     ...
//     x86/lib/pdfium.dll.lib  (Win32)
//     x86/bin/pdfium.dll
//     x64/lib/pdfium.dll.lib  (x64)
//     x64/bin/pdfium.dll
//
// vcxproj 側で AdditionalIncludeDirectories に include/ を、
// AdditionalLibraryDirectories に x86/lib or x64/lib を追加し、
// pdfium.dll.lib をリンクする。
//
#if __has_include("fpdfview.h")
  #include "fpdfview.h"
  #include "fpdf_text.h"
  #include "fpdf_doc.h"
  #define HSPPDF_HAVE_PDFIUM 1
#else
  // stub モード — PDFium 未配置でもビルドは通す。
  #define HSPPDF_HAVE_PDFIUM 0
  typedef void* FPDF_DOCUMENT;
  typedef void* FPDF_PAGE;
  typedef void* FPDF_BITMAP;
  typedef void* FPDF_TEXTPAGE;
  typedef unsigned short FPDF_WCHAR;
#endif

#define HSPPDF_EXPORT extern "C" __declspec(dllexport)

// ============================================================
// HSP helpers
// ============================================================
namespace {

HSPEXINFO* g_hei = nullptr;
inline void   set_hei(HSPEXINFO* hei) { g_hei = hei; }
inline int    getint() { return g_hei->HspFunc_prm_geti(); }
inline char*  getstr() { return g_hei->HspFunc_prm_gets(); }
inline double getdbl() { return g_hei->HspFunc_prm_getd(); }

// 省略可能な str 引数 (次が無ければ nullptr)
inline char* getstr_opt() {
    // prm_gets は引数が無ければ "" を返す実装があるので
    // PARAM_END の検査を挟むのが理想だが、ここでは最小限で済ませる。
    return g_hei->HspFunc_prm_gets();
}

inline PVal* getva_pval(APTR* out_aptr) {
    PVal* pv = nullptr;
    APTR a = g_hei->HspFunc_prm_getva(&pv);
    if (out_aptr) *out_aptr = a;
    return pv;
}

static void write_int_to_var(int v) {
    PVal* pv = nullptr;
    APTR a = g_hei->HspFunc_prm_getva(&pv);
    if (!pv || pv->flag != HSPVAR_FLAG_INT) return;
    pv->offset = a;
    HspVarProc* proc = g_hei->HspFunc_getproc(pv->flag);
    proc->Set(pv, proc->GetPtr(pv), &v);
}

static void write_double_to_var(double v) {
    PVal* pv = nullptr;
    APTR a = g_hei->HspFunc_prm_getva(&pv);
    if (!pv || pv->flag != HSPVAR_FLAG_DOUBLE) return;
    pv->offset = a;
    HspVarProc* proc = g_hei->HspFunc_getproc(pv->flag);
    proc->Set(pv, proc->GetPtr(pv), &v);
}

// str 変数 (sdim 確保済み) にバイト列をコピー (NUL 終端込み)
static void write_str_to_var(const char* s) {
    PVal* pv = nullptr;
    APTR a = g_hei->HspFunc_prm_getva(&pv);
    if (!pv || pv->flag != HSPVAR_FLAG_STR) return;
    pv->offset = a;
    HspVarProc* proc = g_hei->HspFunc_getproc(pv->flag);
    proc->Set(pv, proc->GetPtr(pv), (void*)(s ? s : ""));
}

static void* get_var_rawptr(PVal* pv) {
    if (!pv) return nullptr;
    HspVarProc* proc = g_hei->HspFunc_getproc(pv->flag);
    pv->offset = 0;
    return proc->GetPtr(pv);
}

// UTF-16 → CP_ACP (cp932) にシステム変換
static std::string utf16_to_cp932(const wchar_t* wstr, int wlen) {
    if (!wstr || wlen <= 0) return std::string();
    int need = WideCharToMultiByte(CP_ACP, 0, wstr, wlen, nullptr, 0, nullptr, nullptr);
    if (need <= 0) return std::string();
    std::string out((size_t)need, '\0');
    WideCharToMultiByte(CP_ACP, 0, wstr, wlen, out.data(), need, nullptr, nullptr);
    return out;
}

} // namespace

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
// pdf_init / pdf_shutdown
// ============================================================

HSPPDF_EXPORT BOOL WINAPI pdf_init(HSPEXINFO* hei, int p1, int p2, int p3) {
    (void)hei; (void)p1; (void)p2; (void)p3;
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

HSPPDF_EXPORT BOOL WINAPI pdf_shutdown(HSPEXINFO* hei, int p1, int p2, int p3) {
    (void)hei; (void)p1; (void)p2; (void)p3;
    for (int i = 0; i < (int)g_docs.size(); ++i) free_slot(i);
#if HSPPDF_HAVE_PDFIUM
    if (g_pdfium_inited) {
        FPDF_DestroyLibrary();
        g_pdfium_inited = false;
    }
#endif
    return 0;
}

// ============================================================
// pdf_load "file" [,"password"], var_hid
// ============================================================
HSPPDF_EXPORT BOOL WINAPI pdf_load(HSPEXINFO* hei, int p1, int p2, int p3) {
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    const char* path = getstr();
    if (!path) { write_int_to_var(-1); return 0; }

    // password は省略可能。次の arg が str で無ければ空文字と見なす。
    // ここでは簡易的に getstr_opt で受ける。呼出し側で password を渡さない場合、
    // HSP の解析フェーズで PARAM が終わって "" が返る想定 (実装依存)。
    const char* password = getstr_opt();
    if (password && password[0] == '\0') password = nullptr;

#if HSPPDF_HAVE_PDFIUM
    if (!g_pdfium_inited) {
        // 暗黙初期化 — ユーザが pdf_init を忘れても動くようにする
        FPDF_LIBRARY_CONFIG cfg{};
        cfg.version = 2;
        FPDF_InitLibraryWithConfig(&cfg);
        g_pdfium_inited = true;
    }

    FPDF_DOCUMENT doc = FPDF_LoadDocument(path, password);
    if (!doc) { write_int_to_var(-10); return 0; }

    int h = alloc_slot();
    if (h < 0) { FPDF_CloseDocument(doc); write_int_to_var(-1); return 0; }
    g_docs[h].used = true;
    g_docs[h].doc  = doc;
    write_int_to_var(h);
#else
    write_int_to_var(-100);
#endif
    return 0;
}

// pdf_close hid
HSPPDF_EXPORT BOOL WINAPI pdf_close(HSPEXINFO* hei, int p1, int p2, int p3) {
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    int h = getint();
    free_slot(h);
    return 0;
}

// pdf_page_count hid, var_int
HSPPDF_EXPORT BOOL WINAPI pdf_page_count(HSPEXINFO* hei, int p1, int p2, int p3) {
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    int h = getint();
    DocState* d = get_slot(h);
    if (!d) { write_int_to_var(-1); return 0; }
#if HSPPDF_HAVE_PDFIUM
    int n = FPDF_GetPageCount(d->doc);
    write_int_to_var(n);
#else
    write_int_to_var(-100);
#endif
    return 0;
}

// pdf_page_size hid, page, var_w_dbl, var_h_dbl  (points)
HSPPDF_EXPORT BOOL WINAPI pdf_page_size(HSPEXINFO* hei, int p1, int p2, int p3) {
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    int h = getint();
    int pg = getint();
    DocState* d = get_slot(h);
    if (!d) { write_double_to_var(0.0); write_double_to_var(0.0); return 0; }
#if HSPPDF_HAVE_PDFIUM
    double w = 0.0, hgt = 0.0;
    // FS_SIZE 経由の新 API があるが、ここでは page を一時 load して取る
    FPDF_PAGE page = FPDF_LoadPage(d->doc, pg);
    if (!page) { write_double_to_var(0.0); write_double_to_var(0.0); return 0; }
    w   = FPDF_GetPageWidth(page);
    hgt = FPDF_GetPageHeight(page);
    FPDF_ClosePage(page);
    write_double_to_var(w);
    write_double_to_var(hgt);
#else
    write_double_to_var(0.0);
    write_double_to_var(0.0);
#endif
    return 0;
}

// pdf_render_bitmap hid, page, scale(double), var_buf, var_w_int, var_h_int
//   var_buf は sdim で確保済みを想定。BGRA 32bit raw を書き込む。
HSPPDF_EXPORT BOOL WINAPI pdf_render_bitmap(HSPEXINFO* hei, int p1, int p2, int p3) {
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    int    h     = getint();
    int    pg    = getint();
    double scale = getdbl();
    APTR a;
    PVal*  pv_buf = getva_pval(&a);
    DocState* d = get_slot(h);
    if (!d || !pv_buf) { write_int_to_var(0); write_int_to_var(0); return 0; }

#if HSPPDF_HAVE_PDFIUM
    FPDF_PAGE page = FPDF_LoadPage(d->doc, pg);
    if (!page) { write_int_to_var(0); write_int_to_var(0); return 0; }

    double pw = FPDF_GetPageWidth(page);
    double ph = FPDF_GetPageHeight(page);
    int W = (int)(pw  * scale + 0.5);
    int H = (int)(ph  * scale + 0.5);
    if (W <= 0 || H <= 0) { FPDF_ClosePage(page); write_int_to_var(0); write_int_to_var(0); return 0; }

    // format=0 は BGRA (FPDFBitmap_BGRA)
    FPDF_BITMAP bmp = FPDFBitmap_Create(W, H, 1 /*alpha*/);
    if (!bmp) { FPDF_ClosePage(page); write_int_to_var(0); write_int_to_var(0); return 0; }
    FPDFBitmap_FillRect(bmp, 0, 0, W, H, 0xFFFFFFFF);
    FPDF_RenderPageBitmap(bmp, page, 0, 0, W, H, 0, FPDF_ANNOT);

    void* src = FPDFBitmap_GetBuffer(bmp);
    int stride = FPDFBitmap_GetStride(bmp);
    size_t total = (size_t)stride * (size_t)H;

    void* dst = get_var_rawptr(pv_buf);
    if (dst && src) memcpy(dst, src, total);

    FPDFBitmap_Destroy(bmp);
    FPDF_ClosePage(page);

    write_int_to_var(W);
    write_int_to_var(H);
#else
    write_int_to_var(0);
    write_int_to_var(0);
#endif
    return 0;
}

// pdf_render_to_hspwnd hid, page, scale
//   現在 actscr の BMSCR (bottom-up 24bit BGR DIB) に PDFium で描画した
//   ラスタを直接コピーする。左上起点、clipping はしない。
HSPPDF_EXPORT BOOL WINAPI pdf_render_to_hspwnd(HSPEXINFO* hei, int p1, int p2, int p3) {
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    int    h     = getint();
    int    pg    = getint();
    double scale = getdbl();
    DocState* d = get_slot(h);
    if (!d) return 0;

#if HSPPDF_HAVE_PDFIUM
    int wid = *(g_hei->actscr);
    BMSCR* bm = (BMSCR*)g_hei->HspFunc_getbmscr(wid);
    if (!bm || !bm->pBit || bm->sx <= 0 || bm->sy <= 0) return 0;

    FPDF_PAGE page = FPDF_LoadPage(d->doc, pg);
    if (!page) return 0;

    double pw = FPDF_GetPageWidth(page);
    double ph = FPDF_GetPageHeight(page);
    int W = (int)(pw * scale + 0.5);
    int H = (int)(ph * scale + 0.5);
    // 描画先 BMSCR サイズでクリップ
    if (W > bm->sx) W = bm->sx;
    if (H > bm->sy) H = bm->sy;
    if (W <= 0 || H <= 0) { FPDF_ClosePage(page); return 0; }

    // いったん BGRA で PDFium に描かせる
    FPDF_BITMAP bmp = FPDFBitmap_Create(W, H, 1);
    if (!bmp) { FPDF_ClosePage(page); return 0; }
    FPDFBitmap_FillRect(bmp, 0, 0, W, H, 0xFFFFFFFF);
    FPDF_RenderPageBitmap(bmp, page, 0, 0, W, H, 0, FPDF_ANNOT);

    const uint8_t* src = (const uint8_t*)FPDFBitmap_GetBuffer(bmp);
    int src_stride = FPDFBitmap_GetStride(bmp); // W*4

    // BMSCR の DIB: 24bit BGR, bottom-up, 各行 4byte align
    const int dst_stride = ((bm->sx * 3 + 3) / 4) * 4;
    uint8_t* dst_base = (uint8_t*)bm->pBit;

    for (int y = 0; y < H; ++y) {
        const uint8_t* sp = src + (size_t)y * src_stride;             // top-down
        uint8_t* dp = dst_base + (size_t)(bm->sy - 1 - y) * dst_stride;
        for (int x = 0; x < W; ++x) {
            // PDFium BGRA → BMSCR BGR (alpha は捨てる)
            dp[0] = sp[0];
            dp[1] = sp[1];
            dp[2] = sp[2];
            sp += 4;
            dp += 3;
        }
    }

    FPDFBitmap_Destroy(bmp);
    FPDF_ClosePage(page);
#endif
    return 0;
}

// pdf_get_text hid, page, var_str
HSPPDF_EXPORT BOOL WINAPI pdf_get_text(HSPEXINFO* hei, int p1, int p2, int p3) {
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    int h  = getint();
    int pg = getint();
    DocState* d = get_slot(h);
    if (!d) { write_str_to_var(""); return 0; }

#if HSPPDF_HAVE_PDFIUM
    FPDF_PAGE page = FPDF_LoadPage(d->doc, pg);
    if (!page) { write_str_to_var(""); return 0; }
    FPDF_TEXTPAGE tp = FPDFText_LoadPage(page);
    if (!tp) { FPDF_ClosePage(page); write_str_to_var(""); return 0; }

    int nchar = FPDFText_CountChars(tp);
    std::vector<unsigned short> buf;
    std::string mb;
    if (nchar > 0) {
        buf.resize((size_t)nchar + 1, 0);
        // FPDFText_GetText は UTF-16LE を書き込み、末尾に NUL を付ける。
        int got = FPDFText_GetText(tp, 0, nchar, buf.data());
        if (got > 1) {
            mb = utf16_to_cp932((const wchar_t*)buf.data(), got - 1);
        }
    }

    FPDFText_ClosePage(tp);
    FPDF_ClosePage(page);

    write_str_to_var(mb.c_str());
#else
    write_str_to_var("");
#endif
    return 0;
}

#if HSPPDF_HAVE_PDFIUM
// メタデータ文字列を CP_ACP で取得するヘルパ
static std::string get_metadata_cp932(FPDF_DOCUMENT doc, const char* tag) {
    unsigned long need = FPDF_GetMetaText(doc, tag, nullptr, 0);
    if (need <= 2) return std::string();
    std::vector<unsigned char> bytes((size_t)need, 0);
    FPDF_GetMetaText(doc, tag, bytes.data(), need);
    // FPDF_GetMetaText は UTF-16LE + NUL を返す
    const wchar_t* wp = (const wchar_t*)bytes.data();
    int wlen = (int)(need / 2) - 1;
    return utf16_to_cp932(wp, wlen);
}
#endif

// pdf_doc_title hid, var_str
HSPPDF_EXPORT BOOL WINAPI pdf_doc_title(HSPEXINFO* hei, int p1, int p2, int p3) {
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    int h = getint();
    DocState* d = get_slot(h);
    if (!d) { write_str_to_var(""); return 0; }
#if HSPPDF_HAVE_PDFIUM
    std::string s = get_metadata_cp932(d->doc, "Title");
    write_str_to_var(s.c_str());
#else
    write_str_to_var("");
#endif
    return 0;
}

// pdf_doc_author hid, var_str
HSPPDF_EXPORT BOOL WINAPI pdf_doc_author(HSPEXINFO* hei, int p1, int p2, int p3) {
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    int h = getint();
    DocState* d = get_slot(h);
    if (!d) { write_str_to_var(""); return 0; }
#if HSPPDF_HAVE_PDFIUM
    std::string s = get_metadata_cp932(d->doc, "Author");
    write_str_to_var(s.c_str());
#else
    write_str_to_var("");
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
