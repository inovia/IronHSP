//
//  hspcv4 - OpenCV 4.x plugin for IronHSP
//
//  Phase 1: minimal beginner API set.
//  All commands are exported with HSP type $202 (HSPEXINFO + 3 int slots).
//  Return 0 = success (HSP stat = 0), negative = error (stat < 0).
//
#include "hspcv4.h"
#include <string>
#include <memory>

HSPEXINFO* g_hei = nullptr;

namespace {

// Fetch and cache HSPEXINFO from the first argument of each call.
inline void set_hei(HSPEXINFO* hei) { g_hei = hei; }

// Small helpers to read HSP command parameters.
inline int         getint()          { return g_hei->HspFunc_prm_geti(); }
inline int         getint_def(int d) { return g_hei->HspFunc_prm_getdi(d); }
inline char*       getstr()          { return g_hei->HspFunc_prm_gets(); }
inline char*       getstr_def(const char* d) { return g_hei->HspFunc_prm_getds(d); }

// Report an error via Hsp3 "error" facility (if available).
// In Phase 1 we just set the last-error string and return negative.
inline int fail(const char* msg)
{
    hspcv4::set_last_error(msg);
    return -1;
}

} // namespace


//============================================================================
//  DllMain
//============================================================================
BOOL WINAPI DllMain(HINSTANCE hInst, DWORD reason, LPVOID reserved)
{
    (void)hInst; (void)reserved;
    if (reason == DLL_PROCESS_DETACH) {
        hspcv4::handle_clear_all();
        cv::destroyAllWindows();
    }
    return TRUE;
}


//============================================================================
//  Core : load / save / info / del / reset
//============================================================================

//  cv4load id, "file.png"
//  -> id に画像を読み込む (既存ハンドルは上書き)
CV4_EXPORT BOOL WINAPI cv4load(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    try {
        int id        = getint();
        const char* f = getstr();
        cv::Mat img = cv::imread(f, cv::IMREAD_COLOR);
        if (img.empty()) return fail("cv4load: imread failed");
        hspcv4::handle_set(id, std::move(img));
        return 0;
    } catch (const cv::Exception& e) {
        return fail(e.what());
    } catch (...) {
        return fail("cv4load: unknown exception");
    }
}

//  cv4save id, "file.png"
//  -> id の画像をファイル保存
CV4_EXPORT BOOL WINAPI cv4save(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    try {
        int id        = getint();
        const char* f = getstr();
        cv::Mat* m = hspcv4::handle_get(id);
        if (!m || m->empty()) return fail("cv4save: invalid handle");
        if (!cv::imwrite(f, *m)) return fail("cv4save: imwrite failed");
        return 0;
    } catch (const cv::Exception& e) {
        return fail(e.what());
    } catch (...) {
        return fail("cv4save: unknown exception");
    }
}

//  cv4del id
//  -> ハンドル解放
CV4_EXPORT BOOL WINAPI cv4del(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    int id = getint();
    hspcv4::handle_free(id);
    return 0;
}

//  cv4reset
//  -> 全ハンドル解放 + ウィンドウ全閉じ
CV4_EXPORT BOOL WINAPI cv4reset(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)hei; (void)p1; (void)p2; (void)p3;
    hspcv4::handle_clear_all();
    try { cv::destroyAllWindows(); } catch (...) {}
    return 0;
}

//  cv4info id, var_sx, var_sy, var_ch
//  -> 画像情報を変数に格納 (HSP の参照渡し変数)
CV4_EXPORT BOOL WINAPI cv4info(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    try {
        int id = getint();
        cv::Mat* m = hspcv4::handle_get(id);
        if (!m || m->empty()) return fail("cv4info: invalid handle");

        // 3 個の int 変数を参照で受け取り、それぞれに格納
        int vals[3] = { m->cols, m->rows, m->channels() };
        for (int i = 0; i < 3; ++i) {
            PVal* pval;
            APTR aptr = hei->HspFunc_prm_getva(&pval);
            // 型が int である必要がある
            if (pval->flag != HSPVAR_FLAG_INT) {
                return fail("cv4info: variable must be int");
            }
            pval->offset = aptr;
            HspVarProc* proc = hei->HspFunc_getproc(pval->flag);
            proc->Set(pval, proc->GetPtr(pval), &vals[i]);
        }
        return 0;
    } catch (const cv::Exception& e) {
        return fail(e.what());
    } catch (...) {
        return fail("cv4info: unknown exception");
    }
}


//============================================================================
//  HighGUI : show / wait
//============================================================================

//  cv4show id, "window"
//  -> OpenCV ウィンドウに表示 (タイトル省略可)
CV4_EXPORT BOOL WINAPI cv4show(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    try {
        int id        = getint();
        const char* w = getstr_def("hspcv4");
        cv::Mat* m = hspcv4::handle_get(id);
        if (!m || m->empty()) return fail("cv4show: invalid handle");
        cv::imshow(w, *m);
        return 0;
    } catch (const cv::Exception& e) {
        return fail(e.what());
    } catch (...) {
        return fail("cv4show: unknown exception");
    }
}

//  cv4wait ms
//  -> cv::waitKey(ms) 呼び出し。stat に押されたキーコード (無ければ -1)
CV4_EXPORT BOOL WINAPI cv4wait(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    try {
        int ms = getint_def(0);
        int key = cv::waitKey(ms);
        return key;   // stat に直接返す
    } catch (...) {
        return -1;
    }
}


//============================================================================
//  ImgProc : cvt / resize
//============================================================================

//  cv4cvt dst_id, src_id, code
//  -> 色空間変換 (dst と src は別ハンドル可、同一でも可)
CV4_EXPORT BOOL WINAPI cv4cvt(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    try {
        int dst_id = getint();
        int src_id = getint();
        int code   = getint();
        cv::Mat* src = hspcv4::handle_get(src_id);
        if (!src || src->empty()) return fail("cv4cvt: invalid source");
        cv::Mat out;
        cv::cvtColor(*src, out, code);
        hspcv4::handle_set(dst_id, std::move(out));
        return 0;
    } catch (const cv::Exception& e) {
        return fail(e.what());
    } catch (...) {
        return fail("cv4cvt: unknown exception");
    }
}

//  cv4resize dst_id, src_id, new_w, new_h
//  -> リサイズ (HSP param が 3 int+... なので最後の引数は getint で読む)
CV4_EXPORT BOOL WINAPI cv4resize(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    try {
        int dst_id = getint();
        int src_id = getint();
        int new_w  = getint();
        int new_h  = getint();
        cv::Mat* src = hspcv4::handle_get(src_id);
        if (!src || src->empty()) return fail("cv4resize: invalid source");
        cv::Mat out;
        cv::resize(*src, out, cv::Size(new_w, new_h), 0, 0, cv::INTER_LINEAR);
        hspcv4::handle_set(dst_id, std::move(out));
        return 0;
    } catch (const cv::Exception& e) {
        return fail(e.what());
    } catch (...) {
        return fail("cv4resize: unknown exception");
    }
}


//============================================================================
//  HSP bridge : getimg / putimg
//  HSP screen = 24-bit BGR DIB, bottom-up, row stride = bm->sx2 (4-byte aligned)
//============================================================================

//  cv4getimg id
//  -> id の画像を現在の HSP カレント window にコピー (左上からベタ貼り)
//     自動で上下反転、GRAY→BGR、BGRA→BGR 変換する
CV4_EXPORT BOOL WINAPI cv4getimg(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    try {
        int id = getint();
        cv::Mat* src = hspcv4::handle_get(id);
        if (!src || src->empty()) return fail("cv4getimg: invalid handle");

        BMSCR* bm = (BMSCR*)hei->HspFunc_getbmscr(*(hei->actscr));
        if (!bm || !bm->pBit) return fail("cv4getimg: no active screen");

        // src を BGR / CV_8UC3 に揃える
        cv::Mat bgr;
        if (src->type() == CV_8UC3) {
            bgr = *src;
        } else if (src->type() == CV_8UC1) {
            cv::cvtColor(*src, bgr, cv::COLOR_GRAY2BGR);
        } else if (src->type() == CV_8UC4) {
            cv::cvtColor(*src, bgr, cv::COLOR_BGRA2BGR);
        } else {
            src->convertTo(bgr, CV_8U);
            if (bgr.channels() == 1) {
                cv::cvtColor(bgr, bgr, cv::COLOR_GRAY2BGR);
            }
        }

        const int sx = (bgr.cols < bm->sx) ? bgr.cols : bm->sx;
        const int sy = (bgr.rows < bm->sy) ? bgr.rows : bm->sy;
        // HSP DIB は bottom-up。一番下のラスターが base。
        unsigned char* base = (unsigned char*)bm->pBit + (size_t)bm->sx2 * (bm->sy - 1);

        for (int y = 0; y < sy; ++y) {
            const unsigned char* sp = bgr.ptr<unsigned char>(y);
            unsigned char* dp = base - (size_t)bm->sx2 * y;
            memcpy(dp, sp, (size_t)sx * 3);
        }
        return 0;
    } catch (const cv::Exception& e) {
        return fail(e.what());
    } catch (...) {
        return fail("cv4getimg: unknown exception");
    }
}

//============================================================================
//  Drawing : line / rect / circle / text  (beginner, 色は B,G,R 指定)
//============================================================================

//  cv4line id, x1, y1, x2, y2, b, g, r [, thickness=1]
CV4_EXPORT BOOL WINAPI cv4line(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    try {
        int id = getint();
        int x1 = getint();
        int y1 = getint();
        int x2 = getint();
        int y2 = getint();
        int b  = getint();
        int g  = getint();
        int r  = getint();
        int thickness = getint_def(1);
        cv::Mat* m = hspcv4::handle_get(id);
        if (!m || m->empty()) return fail("cv4line: invalid handle");
        cv::line(*m, cv::Point(x1, y1), cv::Point(x2, y2),
                 cv::Scalar(b, g, r), thickness);
        return 0;
    } catch (const cv::Exception& e) {
        return fail(e.what());
    } catch (...) {
        return fail("cv4line: unknown exception");
    }
}

//  cv4rect id, x, y, w, h, b, g, r [, thickness=1]
//  thickness=-1 で塗りつぶし
CV4_EXPORT BOOL WINAPI cv4rect(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    try {
        int id = getint();
        int x  = getint();
        int y  = getint();
        int w  = getint();
        int h  = getint();
        int b  = getint();
        int g  = getint();
        int r  = getint();
        int thickness = getint_def(1);
        cv::Mat* m = hspcv4::handle_get(id);
        if (!m || m->empty()) return fail("cv4rect: invalid handle");
        cv::rectangle(*m, cv::Rect(x, y, w, h),
                      cv::Scalar(b, g, r), thickness);
        return 0;
    } catch (const cv::Exception& e) {
        return fail(e.what());
    } catch (...) {
        return fail("cv4rect: unknown exception");
    }
}

//  cv4circle id, cx, cy, radius, b, g, r [, thickness=1]
CV4_EXPORT BOOL WINAPI cv4circle(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    try {
        int id     = getint();
        int cx     = getint();
        int cy     = getint();
        int radius = getint();
        int b      = getint();
        int g      = getint();
        int r      = getint();
        int thickness = getint_def(1);
        cv::Mat* m = hspcv4::handle_get(id);
        if (!m || m->empty()) return fail("cv4circle: invalid handle");
        cv::circle(*m, cv::Point(cx, cy), radius,
                   cv::Scalar(b, g, r), thickness);
        return 0;
    } catch (const cv::Exception& e) {
        return fail(e.what());
    } catch (...) {
        return fail("cv4circle: unknown exception");
    }
}

//  cv4text id, "text", x, y, scale, b, g, r [, thickness=1]
//  フォント: HERSHEY_SIMPLEX 固定
//  scale は double (倍率)。beginner 向けに int を渡せるよう double 解釈する
CV4_EXPORT BOOL WINAPI cv4text(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    try {
        int id        = getint();
        const char* t = getstr();
        int x         = getint();
        int y         = getint();
        // scale は double で受け取る (HSP 側で 1.0 / 1.5 等)
        double scale  = hei->HspFunc_prm_getdd(1.0);
        int b         = getint();
        int g         = getint();
        int r         = getint();
        int thickness = getint_def(1);
        cv::Mat* m = hspcv4::handle_get(id);
        if (!m || m->empty()) return fail("cv4text: invalid handle");
        cv::putText(*m, t ? t : "", cv::Point(x, y),
                    cv::FONT_HERSHEY_SIMPLEX, scale,
                    cv::Scalar(b, g, r), thickness, cv::LINE_AA);
        return 0;
    } catch (const cv::Exception& e) {
        return fail(e.what());
    } catch (...) {
        return fail("cv4text: unknown exception");
    }
}


//  cv4putimg id
//  -> 現在の HSP カレント window を id に取り込み (上下反転して BGR に)
CV4_EXPORT BOOL WINAPI cv4putimg(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    try {
        int id = getint();
        BMSCR* bm = (BMSCR*)hei->HspFunc_getbmscr(*(hei->actscr));
        if (!bm || !bm->pBit) return fail("cv4putimg: no active screen");

        cv::Mat dst(bm->sy, bm->sx, CV_8UC3);
        const unsigned char* base =
            (const unsigned char*)bm->pBit + (size_t)bm->sx2 * (bm->sy - 1);

        for (int y = 0; y < bm->sy; ++y) {
            const unsigned char* sp = base - (size_t)bm->sx2 * y;
            unsigned char* dp = dst.ptr<unsigned char>(y);
            memcpy(dp, sp, (size_t)bm->sx * 3);
        }

        hspcv4::handle_set(id, std::move(dst));
        return 0;
    } catch (const cv::Exception& e) {
        return fail(e.what());
    } catch (...) {
        return fail("cv4putimg: unknown exception");
    }
}
