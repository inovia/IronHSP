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

// Report an error.
// IMPORTANT: hspcv4 の #func は $202 (OLDDLL) を使っており、HSP runtime は
// BindFUNC で subid を OLDDLL → OLDDLLINIT に降格したあと、戻り値を次の
// ように stat に変換する (hsp3extlib.cpp exec_dllcmd):
//   result == 0  → stat = 0                      (success)
//   result >  0  → legacy wait-count 経路に突入し
//                  bit 0x20000/0x10000 が立っていなければ HSPERR_DLL_ERROR
//   result <  0  → stat = -result                (positive error code)
// よって C 関数は:
//   - 成功: return 0
//   - 失敗: return -N  (N 正、HSP 側で stat = N として観察される)
//   - 正の値は絶対に返さない (Error 38 を引き起こす)
// HSP 側は「if stat : <error>」で検出できる。
inline int fail(const char* msg)
{
    hspcv4::set_last_error(msg);
    return -1;   // => stat = 1 after HSP の OLDDLL 符号反転
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
        hspcv4::cascade_clear_all();
        hspcv4::capture_clear_all();
        hspcv4::writer_clear_all();
        hspcv4::dnn_clear_all();
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
//  DNN : ONNX (and similar) inference via cv::dnn::Net
//============================================================================

//  cv4_dnn_load nid, "model.onnx"
//    ONNX 形式のモデルを読み込む。
CV4_EXPORT BOOL WINAPI cv4_dnn_load(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    try {
        int nid          = getint();
        const char* path = getstr();
        if (!path || !*path) return fail("cv4_dnn_load: empty path");
        cv::dnn::Net net = cv::dnn::readNetFromONNX(path);
        if (net.empty()) return fail("cv4_dnn_load: readNetFromONNX returned empty net");
        hspcv4::dnn_set(nid, std::move(net));
        return 0;
    } catch (const cv::Exception& e) {
        return fail(e.what());
    } catch (...) {
        return fail("cv4_dnn_load: unknown exception");
    }
}

//  cv4_dnn_free nid
CV4_EXPORT BOOL WINAPI cv4_dnn_free(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    int nid = getint();
    hspcv4::dnn_free(nid);
    return 0;
}

//  cv4_dnn_set_input nid, img_id, scale, mean_b, mean_g, mean_r, w, h, swap_rb
//    blobFromImage で 4D テンソル (1,C,H,W) を作って setInput する。
//    scale: 画素値のスケール (例: 1.0/255.0 で [0,1] に正規化)
//    mean_*: チャンネルごとに引く平均値
//    swap_rb: 非 0 で BGR→RGB スワップ (OpenCV のデフォルト BGR モデルなら 0)
CV4_EXPORT BOOL WINAPI cv4_dnn_set_input(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    try {
        int nid      = getint();
        int img_id   = getint();
        double scale = hei->HspFunc_prm_getdd(1.0);
        double mb    = hei->HspFunc_prm_getdd(0.0);
        double mg    = hei->HspFunc_prm_getdd(0.0);
        double mr    = hei->HspFunc_prm_getdd(0.0);
        int w        = getint();
        int h        = getint();
        int swap_rb  = getint_def(0);

        cv::dnn::Net* net = hspcv4::dnn_get(nid);
        if (!net || net->empty()) return fail("cv4_dnn_set_input: invalid net");
        cv::Mat* img = hspcv4::handle_get(img_id);
        if (!img || img->empty()) return fail("cv4_dnn_set_input: invalid image");

        cv::Mat blob = cv::dnn::blobFromImage(
            *img, scale, cv::Size(w, h),
            cv::Scalar(mb, mg, mr), swap_rb != 0, false);
        net->setInput(blob);
        return 0;
    } catch (const cv::Exception& e) {
        return fail(e.what());
    } catch (...) {
        return fail("cv4_dnn_set_input: unknown exception");
    }
}

//  cv4_dnn_forward nid, out_id
//    推論実行。結果 (出力 blob) を Mat ハンドル out_id に保存。
CV4_EXPORT BOOL WINAPI cv4_dnn_forward(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    try {
        int nid    = getint();
        int out_id = getint();
        cv::dnn::Net* net = hspcv4::dnn_get(nid);
        if (!net || net->empty()) return fail("cv4_dnn_forward: invalid net");
        cv::Mat out = net->forward();
        hspcv4::handle_set(out_id, std::move(out));
        return 0;
    } catch (const cv::Exception& e) {
        return fail(e.what());
    } catch (...) {
        return fail("cv4_dnn_forward: unknown exception");
    }
}

//  cv4_dnn_argmax out_id, var_class, var_score
//    分類タスク向けヘルパ: 出力 blob (float32) から argmax を計算して
//    クラス index (int) と最大スコア (double に int 変換したもの) を返す。
//    実行時にスコアを 0-1 の float から整数に変換する際は
//    var_score_int = scoreFloat * 10000 する (小数 4 桁相当の固定小数点)。
CV4_EXPORT BOOL WINAPI cv4_dnn_argmax(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    try {
        int out_id = getint();
        PVal* pval_cls;
        APTR  ac = hei->HspFunc_prm_getva(&pval_cls);
        if (pval_cls->flag != HSPVAR_FLAG_INT) {
            return fail("cv4_dnn_argmax: var_class must be int");
        }
        pval_cls->offset = ac;
        PVal* pval_sc;
        APTR  as = hei->HspFunc_prm_getva(&pval_sc);
        if (pval_sc->flag != HSPVAR_FLAG_INT) {
            return fail("cv4_dnn_argmax: var_score must be int");
        }
        pval_sc->offset = as;

        cv::Mat* m = hspcv4::handle_get(out_id);
        if (!m || m->empty()) return fail("cv4_dnn_argmax: invalid output");
        cv::Mat flat = m->reshape(1, 1);
        cv::Mat flatF;
        if (flat.type() != CV_32F) flat.convertTo(flatF, CV_32F);
        else flatF = flat;

        cv::Point maxLoc;
        double maxVal = 0.0;
        cv::minMaxLoc(flatF, nullptr, &maxVal, nullptr, &maxLoc);
        int cls = maxLoc.x;
        int scInt = (int)(maxVal * 10000.0);

        HspVarProc* proc = hei->HspFunc_getproc(HSPVAR_FLAG_INT);
        proc->Set(pval_cls, proc->GetPtr(pval_cls), &cls);
        proc->Set(pval_sc,  proc->GetPtr(pval_sc),  &scInt);
        return 0;
    } catch (const cv::Exception& e) {
        return fail(e.what());
    } catch (...) {
        return fail("cv4_dnn_argmax: unknown exception");
    }
}


//============================================================================
//  Video I/O : VideoCapture / VideoWriter
//============================================================================

//  cv4_video_open vid, "path_or_index"
//    path が 10 進数字列 (例: "0", "1") のときはカメラ index として開く。
//    それ以外のときはファイルパスとして開く。
CV4_EXPORT BOOL WINAPI cv4_video_open(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    try {
        int vid          = getint();
        const char* path = getstr();
        if (!path) return fail("cv4_video_open: null path");

        // 全桁数字ならカメラ index として扱う
        bool all_digit = (*path != '\0');
        for (const char* p = path; *p; ++p) {
            if (*p < '0' || *p > '9') { all_digit = false; break; }
        }

        cv::VideoCapture vc;
        bool ok = false;
        if (all_digit) {
            int idx = atoi(path);
            ok = vc.open(idx);
        } else {
            ok = vc.open(path);
        }
        if (!ok || !vc.isOpened()) {
            return fail("cv4_video_open: failed to open source");
        }
        hspcv4::capture_set(vid, std::move(vc));
        return 0;
    } catch (const cv::Exception& e) {
        return fail(e.what());
    } catch (...) {
        return fail("cv4_video_open: unknown exception");
    }
}

//  cv4_video_read vid, frame_id
//    stat に 0 (成功) / -1 (終端 or 読込失敗)。成功時は frame_id に Mat が入る。
CV4_EXPORT BOOL WINAPI cv4_video_read(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    try {
        int vid      = getint();
        int frame_id = getint();
        cv::VideoCapture* vc = hspcv4::capture_get(vid);
        if (!vc || !vc->isOpened()) {
            return fail("cv4_video_read: invalid capture");
        }
        cv::Mat frame;
        if (!vc->read(frame) || frame.empty()) {
            return -1;  // 終端 (stat = 1 after negation)
        }
        hspcv4::handle_set(frame_id, std::move(frame));
        return 0;
    } catch (const cv::Exception& e) {
        return fail(e.what());
    } catch (...) {
        return fail("cv4_video_read: unknown exception");
    }
}

//  cv4_video_info vid, var_w, var_h, var_fps, var_total
CV4_EXPORT BOOL WINAPI cv4_video_info(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    try {
        int vid = getint();
        cv::VideoCapture* vc = hspcv4::capture_get(vid);
        if (!vc || !vc->isOpened()) {
            return fail("cv4_video_info: invalid capture");
        }
        int vals[4];
        vals[0] = (int)vc->get(cv::CAP_PROP_FRAME_WIDTH);
        vals[1] = (int)vc->get(cv::CAP_PROP_FRAME_HEIGHT);
        vals[2] = (int)vc->get(cv::CAP_PROP_FPS);
        vals[3] = (int)vc->get(cv::CAP_PROP_FRAME_COUNT);
        for (int i = 0; i < 4; ++i) {
            PVal* pval;
            APTR aptr = hei->HspFunc_prm_getva(&pval);
            if (pval->flag != HSPVAR_FLAG_INT) {
                return fail("cv4_video_info: var must be int");
            }
            pval->offset = aptr;
            HspVarProc* proc = hei->HspFunc_getproc(pval->flag);
            proc->Set(pval, proc->GetPtr(pval), &vals[i]);
        }
        return 0;
    } catch (const cv::Exception& e) {
        return fail(e.what());
    } catch (...) {
        return fail("cv4_video_info: unknown exception");
    }
}

//  cv4_video_close vid
CV4_EXPORT BOOL WINAPI cv4_video_close(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    int vid = getint();
    hspcv4::capture_free(vid);
    return 0;
}

//  cv4_writer_open wid, "path", "fourcc", fps, w, h
//    fourcc は 4 文字の文字列 (例: "MJPG", "XVID", "mp4v")
CV4_EXPORT BOOL WINAPI cv4_writer_open(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    try {
        int wid            = getint();
        const char* path   = getstr();
        const char* fourcc = getstr();
        double fps         = hei->HspFunc_prm_getdd(30.0);
        int w              = getint();
        int h              = getint();
        if (!path || !fourcc || strlen(fourcc) < 4) {
            return fail("cv4_writer_open: path/fourcc invalid");
        }
        int fcc = cv::VideoWriter::fourcc(
            fourcc[0], fourcc[1], fourcc[2], fourcc[3]);
        cv::VideoWriter vw;
        if (!vw.open(path, fcc, fps, cv::Size(w, h))) {
            return fail("cv4_writer_open: VideoWriter open failed");
        }
        hspcv4::writer_set(wid, std::move(vw));
        return 0;
    } catch (const cv::Exception& e) {
        return fail(e.what());
    } catch (...) {
        return fail("cv4_writer_open: unknown exception");
    }
}

//  cv4_writer_write wid, frame_id
CV4_EXPORT BOOL WINAPI cv4_writer_write(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    try {
        int wid      = getint();
        int frame_id = getint();
        cv::VideoWriter* vw = hspcv4::writer_get(wid);
        if (!vw || !vw->isOpened()) {
            return fail("cv4_writer_write: invalid writer");
        }
        cv::Mat* m = hspcv4::handle_get(frame_id);
        if (!m || m->empty()) {
            return fail("cv4_writer_write: invalid frame");
        }
        vw->write(*m);
        return 0;
    } catch (const cv::Exception& e) {
        return fail(e.what());
    } catch (...) {
        return fail("cv4_writer_write: unknown exception");
    }
}

//  cv4_writer_close wid
CV4_EXPORT BOOL WINAPI cv4_writer_close(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    int wid = getint();
    hspcv4::writer_free(wid);
    return 0;
}


//============================================================================
//  Object detection : CascadeClassifier (Haar / LBP)
//
//  cv_rect (HSP 構造体) レイアウト: { int x; int y; int w; int h; } (16 bytes)
//  HSP 側で stdim rects, cv_rect, N として確保した配列に検出結果を書き込む。
//============================================================================

// cv4_cascade_load cid, "xmlpath"
CV4_EXPORT BOOL WINAPI cv4_cascade_load(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    try {
        int cid         = getint();
        const char* f   = getstr();
        cv::CascadeClassifier cc;
        if (!cc.load(f ? f : "")) {
            return fail("cv4_cascade_load: load failed (file not found or invalid)");
        }
        hspcv4::cascade_set(cid, std::move(cc));
        return 0;
    } catch (const cv::Exception& e) {
        return fail(e.what());
    } catch (...) {
        return fail("cv4_cascade_load: unknown exception");
    }
}

// cv4_cascade_free cid
CV4_EXPORT BOOL WINAPI cv4_cascade_free(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    int cid = getint();
    hspcv4::cascade_free(cid);
    return 0;
}

// cv4_detect cid, img_id, rects_array, count_var [, scale=1.1] [, min_neighbors=3]
//   rects_array : HSP 側で stdim で確保した cv_rect 構造体配列
//   count_var   : int 変数。検出数を格納 (配列サイズで打ち切り)
CV4_EXPORT BOOL WINAPI cv4_detect(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    try {
        int cid    = getint();
        int img_id = getint();

        // rects_array : 構造体配列 (NSTRUCT)
        PVal* pval_rects;
        APTR  aptr_rects = hei->HspFunc_prm_getva(&pval_rects);
        pval_rects->offset = aptr_rects;

        // count_var : int 変数
        PVal* pval_count;
        APTR  aptr_count = hei->HspFunc_prm_getva(&pval_count);
        if (pval_count->flag != HSPVAR_FLAG_INT) {
            return fail("cv4_detect: count var must be int");
        }
        pval_count->offset = aptr_count;

        double scale      = hei->HspFunc_prm_getdd(1.1);
        int min_neighbors = hei->HspFunc_prm_getdi(3);

        cv::CascadeClassifier* cc = hspcv4::cascade_get(cid);
        if (!cc || cc->empty()) return fail("cv4_detect: invalid cascade");

        cv::Mat* img = hspcv4::handle_get(img_id);
        if (!img || img->empty()) return fail("cv4_detect: invalid image");

        // 入力をグレー化 (detectMultiScale の推奨)
        cv::Mat gray;
        if (img->channels() == 1) {
            gray = *img;
        } else {
            cv::cvtColor(*img, gray, cv::COLOR_BGR2GRAY);
        }
        cv::equalizeHist(gray, gray);

        std::vector<cv::Rect> faces;
        cc->detectMultiScale(gray, faces, scale, min_neighbors,
                             0, cv::Size(30, 30));

        // rects 配列に書き込む。配列の最大要素数 = pval_rects->len[1]
        // 要素サイズは cv_rect 構造体 (16 bytes) だが、pval->len[0] が
        // NSTRUCT の要素サイズを持っている。
        int max_elems = pval_rects->len[1];
        if (max_elems <= 0) max_elems = 1;
        int elem_size = pval_rects->len[0];
        if (elem_size < (int)sizeof(int) * 4) {
            return fail("cv4_detect: rects array must be cv_rect (16 bytes)");
        }

        int n = (int)faces.size();
        if (n > max_elems) n = max_elems;

        char* base = (char*)pval_rects->pt;
        for (int i = 0; i < n; ++i) {
            int* p = (int*)(base + (size_t)elem_size * i);
            p[0] = faces[i].x;
            p[1] = faces[i].y;
            p[2] = faces[i].width;
            p[3] = faces[i].height;
        }

        // count_var に検出数を格納
        HspVarProc* proc = hei->HspFunc_getproc(pval_count->flag);
        proc->Set(pval_count, proc->GetPtr(pval_count), &n);

        return 0;
    } catch (const cv::Exception& e) {
        return fail(e.what());
    } catch (...) {
        return fail("cv4_detect: unknown exception");
    }
}


//============================================================================
//  Advanced : OpenCV native window display with HSP-safe key wait
//
//  cv::waitKey は独自の GetMessage ループを回すため HSP のメインウィンドウの
//  メッセージポンプと競合して SEH クラッシュを起こす (Phase 1 で確認済み)。
//  代わりに OpenCV 4.x で追加された cv::pollKey() を使ってノンブロッキング
//  に問い合わせし、HSP 側の処理を阻害しない形で実装する。
//============================================================================

//  cv4_show id, "window_name"
//    OpenCV ウィンドウに画像を表示 (非ブロッキング)。
//    ウィンドウが無ければ namedWindow で作成。
CV4_EXPORT BOOL WINAPI cv4_show(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    try {
        int id        = getint();
        const char* w = getstr_def("hspcv4");
        cv::Mat* m = hspcv4::handle_get(id);
        if (!m || m->empty()) return fail("cv4_show: invalid handle");
        cv::namedWindow(w, cv::WINDOW_AUTOSIZE);
        cv::imshow(w, *m);
        cv::pollKey();   // 1 回ポンプしてウィンドウを可視化
        return 0;
    } catch (const cv::Exception& e) {
        return fail(e.what());
    } catch (...) {
        return fail("cv4_show: unknown exception");
    }
}

//  cv4_wait_key var_key, ms
//    タイムアウト付きキー待ち。
//    var_key にキーコードを格納 (押されなければ -1)。
//    stat = 0  : キーが押された (var_key は有効)
//    stat = -1 : タイムアウト (var_key = -1)
//    ms=0 は「押されるまで待つ」(10ms ポーリング)
//
//  OLDDLL 符号反転の制約 (return 値に正の整数を使えない) を避けるため、
//  キーコードは return 値ではなく var 引数で返す設計にしている。
CV4_EXPORT BOOL WINAPI cv4_wait_key(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    try {
        // var_key (int 変数) を取得
        PVal* pval;
        APTR  aptr = hei->HspFunc_prm_getva(&pval);
        if (pval->flag != HSPVAR_FLAG_INT) {
            return fail("cv4_wait_key: var_key must be int");
        }
        pval->offset = aptr;

        int ms = getint_def(0);
        DWORD start = GetTickCount();
        int key = -1;
        while (true) {
            key = cv::pollKey();
            if (key >= 0) break;
            if (ms > 0) {
                DWORD elapsed = GetTickCount() - start;
                if (elapsed >= (DWORD)ms) { key = -1; break; }
            }
            Sleep(10);
        }

        // var_key に結果を格納
        HspVarProc* proc = hei->HspFunc_getproc(pval->flag);
        proc->Set(pval, proc->GetPtr(pval), &key);

        return (key >= 0) ? 0 : -1;   // 0=success / -1=>stat 1=timeout
    } catch (const cv::Exception& e) {
        return fail(e.what());
    } catch (...) {
        return fail("cv4_wait_key: unknown exception");
    }
}

//  cv4_close_window "window_name"
//    指定 OpenCV ウィンドウを閉じる。
CV4_EXPORT BOOL WINAPI cv4_close_window(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    try {
        const char* w = getstr();
        cv::destroyWindow(w ? w : "hspcv4");
        cv::pollKey();  // 閉じる処理をポンプ
        return 0;
    } catch (const cv::Exception& e) {
        return fail(e.what());
    } catch (...) {
        return fail("cv4_close_window: unknown exception");
    }
}

//  cv4_close_all
//    全 OpenCV ウィンドウを閉じる。
CV4_EXPORT BOOL WINAPI cv4_close_all(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)hei; (void)p1; (void)p2; (void)p3;
    try {
        cv::destroyAllWindows();
        cv::pollKey();
        return 0;
    } catch (...) {
        return -1;
    }
}


//============================================================================
//  Geometric : flip / rotate / crop / warp
//============================================================================

//  cv4flip dst_id, src_id, flipcode
//    flipcode:  0 = 上下反転, 1 = 左右反転, -1 = 両方
CV4_EXPORT BOOL WINAPI cv4flip(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    try {
        int dst_id = getint();
        int src_id = getint();
        int code   = getint();
        cv::Mat* src = hspcv4::handle_get(src_id);
        if (!src || src->empty()) return fail("cv4flip: invalid source");
        cv::Mat out;
        cv::flip(*src, out, code);
        hspcv4::handle_set(dst_id, std::move(out));
        return 0;
    } catch (const cv::Exception& e) {
        return fail(e.what());
    } catch (...) {
        return fail("cv4flip: unknown exception");
    }
}

//  cv4rotate dst_id, src_id, angle [, scale=1.0]
//    angle は度単位 (反時計回り)、中心は画像中央。出力サイズは入力と同じ。
CV4_EXPORT BOOL WINAPI cv4rotate(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    try {
        int dst_id    = getint();
        int src_id    = getint();
        double angle  = hei->HspFunc_prm_getdd(0.0);
        double scale  = hei->HspFunc_prm_getdd(1.0);
        cv::Mat* src = hspcv4::handle_get(src_id);
        if (!src || src->empty()) return fail("cv4rotate: invalid source");
        cv::Point2f center((float)(src->cols * 0.5), (float)(src->rows * 0.5));
        cv::Mat rot = cv::getRotationMatrix2D(center, angle, scale);
        cv::Mat out;
        cv::warpAffine(*src, out, rot, src->size(),
                       cv::INTER_LINEAR, cv::BORDER_CONSTANT, cv::Scalar());
        hspcv4::handle_set(dst_id, std::move(out));
        return 0;
    } catch (const cv::Exception& e) {
        return fail(e.what());
    } catch (...) {
        return fail("cv4rotate: unknown exception");
    }
}

//  cv4crop dst_id, src_id, x, y, w, h
//    ROI クロップ。範囲外だとエラー。
CV4_EXPORT BOOL WINAPI cv4crop(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    try {
        int dst_id = getint();
        int src_id = getint();
        int x      = getint();
        int y      = getint();
        int w      = getint();
        int h      = getint();
        cv::Mat* src = hspcv4::handle_get(src_id);
        if (!src || src->empty()) return fail("cv4crop: invalid source");
        if (x < 0 || y < 0 || w <= 0 || h <= 0 ||
            x + w > src->cols || y + h > src->rows) {
            return fail("cv4crop: roi out of bounds");
        }
        cv::Mat out = (*src)(cv::Rect(x, y, w, h)).clone();
        hspcv4::handle_set(dst_id, std::move(out));
        return 0;
    } catch (const cv::Exception& e) {
        return fail(e.what());
    } catch (...) {
        return fail("cv4crop: unknown exception");
    }
}

//  cv4warp dst_id, src_id, m00, m01, m02, m10, m11, m12, out_w, out_h
//    2x3 アフィン行列を直接指定して warpAffine。
//    行列の要素は double。HSP 側では int リテラルでも自動で double 解釈される。
CV4_EXPORT BOOL WINAPI cv4warp(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    try {
        int dst_id = getint();
        int src_id = getint();
        double m00 = hei->HspFunc_prm_getdd(1.0);
        double m01 = hei->HspFunc_prm_getdd(0.0);
        double m02 = hei->HspFunc_prm_getdd(0.0);
        double m10 = hei->HspFunc_prm_getdd(0.0);
        double m11 = hei->HspFunc_prm_getdd(1.0);
        double m12 = hei->HspFunc_prm_getdd(0.0);
        int ow     = getint();
        int oh     = getint();
        cv::Mat* src = hspcv4::handle_get(src_id);
        if (!src || src->empty()) return fail("cv4warp: invalid source");
        cv::Mat mat(2, 3, CV_64F);
        mat.at<double>(0, 0) = m00;
        mat.at<double>(0, 1) = m01;
        mat.at<double>(0, 2) = m02;
        mat.at<double>(1, 0) = m10;
        mat.at<double>(1, 1) = m11;
        mat.at<double>(1, 2) = m12;
        cv::Mat out;
        cv::warpAffine(*src, out, mat, cv::Size(ow, oh),
                       cv::INTER_LINEAR, cv::BORDER_CONSTANT, cv::Scalar());
        hspcv4::handle_set(dst_id, std::move(out));
        return 0;
    } catch (const cv::Exception& e) {
        return fail(e.what());
    } catch (...) {
        return fail("cv4warp: unknown exception");
    }
}


//============================================================================
//  Morphology : erode / dilate / morph_open/close/gradient/tophat/blackhat
//  構造要素の shape: 0=CV4_MORPH_RECT, 1=CV4_MORPH_CROSS, 2=CV4_MORPH_ELLIPSE
//============================================================================

static cv::Mat make_morph_kernel(int shape, int ksize)
{
    int sh = cv::MORPH_RECT;
    if (shape == 1) sh = cv::MORPH_CROSS;
    else if (shape == 2) sh = cv::MORPH_ELLIPSE;
    if (ksize < 1) ksize = 1;
    return cv::getStructuringElement(sh, cv::Size(ksize, ksize));
}

//  cv4_erode dst, src, shape, ksize [, iterations=1]
CV4_EXPORT BOOL WINAPI cv4_erode(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    try {
        int dst_id = getint();
        int src_id = getint();
        int shape  = getint();
        int ksize  = getint();
        int iter   = getint_def(1);
        cv::Mat* src = hspcv4::handle_get(src_id);
        if (!src || src->empty()) return fail("cv4_erode: invalid source");
        cv::Mat k = make_morph_kernel(shape, ksize);
        cv::Mat out;
        cv::erode(*src, out, k, cv::Point(-1,-1), iter);
        hspcv4::handle_set(dst_id, std::move(out));
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_erode: unknown"); }
}

//  cv4_dilate dst, src, shape, ksize [, iterations=1]
CV4_EXPORT BOOL WINAPI cv4_dilate(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    try {
        int dst_id = getint();
        int src_id = getint();
        int shape  = getint();
        int ksize  = getint();
        int iter   = getint_def(1);
        cv::Mat* src = hspcv4::handle_get(src_id);
        if (!src || src->empty()) return fail("cv4_dilate: invalid source");
        cv::Mat k = make_morph_kernel(shape, ksize);
        cv::Mat out;
        cv::dilate(*src, out, k, cv::Point(-1,-1), iter);
        hspcv4::handle_set(dst_id, std::move(out));
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_dilate: unknown"); }
}

// Shared helper for morphologyEx variants
static int cv4_morph_op(int op, HSPEXINFO* hei)
{
    try {
        int dst_id = hei->HspFunc_prm_geti();
        int src_id = hei->HspFunc_prm_geti();
        int shape  = hei->HspFunc_prm_geti();
        int ksize  = hei->HspFunc_prm_geti();
        cv::Mat* src = hspcv4::handle_get(src_id);
        if (!src || src->empty()) return fail("cv4_morph_*: invalid source");
        cv::Mat k = make_morph_kernel(shape, ksize);
        cv::Mat out;
        cv::morphologyEx(*src, out, op, k);
        hspcv4::handle_set(dst_id, std::move(out));
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_morph_*: unknown"); }
}

//  cv4_morph_open      dst, src, shape, ksize
CV4_EXPORT BOOL WINAPI cv4_morph_open(HSPEXINFO* hei, int p1, int p2, int p3)
{ (void)p1;(void)p2;(void)p3; set_hei(hei); return cv4_morph_op(cv::MORPH_OPEN, hei); }

//  cv4_morph_close     dst, src, shape, ksize
CV4_EXPORT BOOL WINAPI cv4_morph_close(HSPEXINFO* hei, int p1, int p2, int p3)
{ (void)p1;(void)p2;(void)p3; set_hei(hei); return cv4_morph_op(cv::MORPH_CLOSE, hei); }

//  cv4_morph_gradient  dst, src, shape, ksize
CV4_EXPORT BOOL WINAPI cv4_morph_gradient(HSPEXINFO* hei, int p1, int p2, int p3)
{ (void)p1;(void)p2;(void)p3; set_hei(hei); return cv4_morph_op(cv::MORPH_GRADIENT, hei); }

//  cv4_morph_tophat    dst, src, shape, ksize
CV4_EXPORT BOOL WINAPI cv4_morph_tophat(HSPEXINFO* hei, int p1, int p2, int p3)
{ (void)p1;(void)p2;(void)p3; set_hei(hei); return cv4_morph_op(cv::MORPH_TOPHAT, hei); }

//  cv4_morph_blackhat  dst, src, shape, ksize
CV4_EXPORT BOOL WINAPI cv4_morph_blackhat(HSPEXINFO* hei, int p1, int p2, int p3)
{ (void)p1;(void)p2;(void)p3; set_hei(hei); return cv4_morph_op(cv::MORPH_BLACKHAT, hei); }


//============================================================================
//  Gradient / edge operators : sobel / scharr / laplacian
//============================================================================

//  cv4_sobel dst, src, dx, dy, ksize
CV4_EXPORT BOOL WINAPI cv4_sobel(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    try {
        int dst_id = getint();
        int src_id = getint();
        int dx     = getint();
        int dy     = getint();
        int ksize  = getint_def(3);
        cv::Mat* src = hspcv4::handle_get(src_id);
        if (!src || src->empty()) return fail("cv4_sobel: invalid source");
        cv::Mat out;
        cv::Sobel(*src, out, CV_16S, dx, dy, ksize);
        cv::Mat abs_out;
        cv::convertScaleAbs(out, abs_out);
        hspcv4::handle_set(dst_id, std::move(abs_out));
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_sobel: unknown"); }
}

//  cv4_scharr dst, src, dx, dy
CV4_EXPORT BOOL WINAPI cv4_scharr(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    try {
        int dst_id = getint();
        int src_id = getint();
        int dx     = getint();
        int dy     = getint();
        cv::Mat* src = hspcv4::handle_get(src_id);
        if (!src || src->empty()) return fail("cv4_scharr: invalid source");
        cv::Mat out, abs_out;
        cv::Scharr(*src, out, CV_16S, dx, dy);
        cv::convertScaleAbs(out, abs_out);
        hspcv4::handle_set(dst_id, std::move(abs_out));
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_scharr: unknown"); }
}

//  cv4_laplacian dst, src, ksize
CV4_EXPORT BOOL WINAPI cv4_laplacian(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    try {
        int dst_id = getint();
        int src_id = getint();
        int ksize  = getint_def(3);
        cv::Mat* src = hspcv4::handle_get(src_id);
        if (!src || src->empty()) return fail("cv4_laplacian: invalid source");
        cv::Mat out, abs_out;
        cv::Laplacian(*src, out, CV_16S, ksize);
        cv::convertScaleAbs(out, abs_out);
        hspcv4::handle_set(dst_id, std::move(abs_out));
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_laplacian: unknown"); }
}


//============================================================================
//  Histogram / LUT / normalize
//============================================================================

//  cv4_equalize_hist dst, src  (src は 1ch CV_8U)
CV4_EXPORT BOOL WINAPI cv4_equalize_hist(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    try {
        int dst_id = getint();
        int src_id = getint();
        cv::Mat* src = hspcv4::handle_get(src_id);
        if (!src || src->empty()) return fail("cv4_equalize_hist: invalid source");
        cv::Mat gray = (src->channels() == 1) ? *src : cv::Mat();
        if (gray.empty()) cv::cvtColor(*src, gray, cv::COLOR_BGR2GRAY);
        cv::Mat out;
        cv::equalizeHist(gray, out);
        hspcv4::handle_set(dst_id, std::move(out));
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_equalize_hist: unknown"); }
}

//  cv4_clahe dst, src, clip_limit, grid
//    clip_limit: double (2.0 が標準)
//    grid: タイル分割数 (8 で 8x8 など)
CV4_EXPORT BOOL WINAPI cv4_clahe(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    try {
        int dst_id     = getint();
        int src_id     = getint();
        double clip    = hei->HspFunc_prm_getdd(2.0);
        int grid       = getint_def(8);
        cv::Mat* src = hspcv4::handle_get(src_id);
        if (!src || src->empty()) return fail("cv4_clahe: invalid source");
        cv::Mat gray = (src->channels() == 1) ? *src : cv::Mat();
        if (gray.empty()) cv::cvtColor(*src, gray, cv::COLOR_BGR2GRAY);
        auto clahe = cv::createCLAHE(clip, cv::Size(grid, grid));
        cv::Mat out;
        clahe->apply(gray, out);
        hspcv4::handle_set(dst_id, std::move(out));
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_clahe: unknown"); }
}

//  cv4_normalize dst, src, alpha, beta [, norm_type=NORM_MINMAX(32)]
CV4_EXPORT BOOL WINAPI cv4_normalize(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    try {
        int dst_id  = getint();
        int src_id  = getint();
        double a    = hei->HspFunc_prm_getdd(0.0);
        double b    = hei->HspFunc_prm_getdd(255.0);
        int nt      = getint_def(cv::NORM_MINMAX);
        cv::Mat* src = hspcv4::handle_get(src_id);
        if (!src || src->empty()) return fail("cv4_normalize: invalid source");
        cv::Mat out;
        cv::normalize(*src, out, a, b, nt, -1);
        hspcv4::handle_set(dst_id, std::move(out));
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_normalize: unknown"); }
}

//  cv4_lut dst, src, lut_var
//    lut_var: 256 要素の int 配列 (0-255 の範囲の値)
CV4_EXPORT BOOL WINAPI cv4_lut(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    try {
        int dst_id = getint();
        int src_id = getint();
        PVal* pval_lut;
        APTR  aptr  = hei->HspFunc_prm_getva(&pval_lut);
        if (pval_lut->flag != HSPVAR_FLAG_INT) {
            return fail("cv4_lut: lut var must be int array");
        }
        pval_lut->offset = aptr;
        int* lut_src = (int*)pval_lut->pt;
        int lut_len = pval_lut->len[1];
        if (lut_len < 256) return fail("cv4_lut: lut must have >= 256 elements");

        cv::Mat* src = hspcv4::handle_get(src_id);
        if (!src || src->empty()) return fail("cv4_lut: invalid source");

        cv::Mat lut(1, 256, CV_8U);
        for (int i = 0; i < 256; ++i) {
            int v = lut_src[i];
            if (v < 0) v = 0;
            if (v > 255) v = 255;
            lut.at<uchar>(0, i) = (uchar)v;
        }
        cv::Mat out;
        cv::LUT(*src, lut, out);
        hspcv4::handle_set(dst_id, std::move(out));
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_lut: unknown"); }
}


//============================================================================
//  Advanced thresholding : adaptive_thresh / distance_transform
//============================================================================

//  cv4_adaptive_thresh dst, src, maxval, adaptive_method, thresh_type, block_size, C
//    adaptive_method: 0=MEAN_C, 1=GAUSSIAN_C
//    thresh_type: 0=BINARY, 1=BINARY_INV
CV4_EXPORT BOOL WINAPI cv4_adaptive_thresh(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    try {
        int dst_id   = getint();
        int src_id   = getint();
        double maxv  = hei->HspFunc_prm_getdd(255.0);
        int amethod  = getint();
        int ttype    = getint();
        int bsize    = getint();
        double C     = hei->HspFunc_prm_getdd(0.0);
        cv::Mat* src = hspcv4::handle_get(src_id);
        if (!src || src->empty()) return fail("cv4_adaptive_thresh: invalid source");
        cv::Mat gray = (src->channels() == 1) ? *src : cv::Mat();
        if (gray.empty()) cv::cvtColor(*src, gray, cv::COLOR_BGR2GRAY);
        cv::Mat out;
        cv::adaptiveThreshold(gray, out, maxv, amethod, ttype, bsize, C);
        hspcv4::handle_set(dst_id, std::move(out));
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_adaptive_thresh: unknown"); }
}

//  cv4_distance_transform dst, src [, distance_type=DIST_L2] [, mask_size=3]
//    src は 8-bit 1ch binary を想定 (cv4thresh 等で作成)
CV4_EXPORT BOOL WINAPI cv4_distance_transform(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    try {
        int dst_id = getint();
        int src_id = getint();
        int dtype  = getint_def(cv::DIST_L2);
        int msize  = getint_def(3);
        cv::Mat* src = hspcv4::handle_get(src_id);
        if (!src || src->empty()) return fail("cv4_distance_transform: invalid source");
        cv::Mat out;
        cv::distanceTransform(*src, out, dtype, msize);
        cv::Mat norm;
        cv::normalize(out, norm, 0, 255, cv::NORM_MINMAX, CV_8U);
        hspcv4::handle_set(dst_id, std::move(norm));
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_distance_transform: unknown"); }
}


//============================================================================
//  Hough transforms
//============================================================================

//  cv4_hough_lines out_mat_id, src_id, rho, theta, thresh
//    src_id: binary edges (cv4_canny 結果など)
//    出力は Nx1 CV_32FC2 Mat (rho, theta 対)。cv4_mat_getf で読む。
CV4_EXPORT BOOL WINAPI cv4_hough_lines(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    try {
        int out_id   = getint();
        int src_id   = getint();
        double rho   = hei->HspFunc_prm_getdd(1.0);
        double theta = hei->HspFunc_prm_getdd(0.017453293);  // CV_PI/180
        int thresh   = getint();
        cv::Mat* src = hspcv4::handle_get(src_id);
        if (!src || src->empty()) return fail("cv4_hough_lines: invalid source");
        std::vector<cv::Vec2f> lines;
        cv::HoughLines(*src, lines, rho, theta, thresh);
        cv::Mat out((int)lines.size(), 2, CV_32F);
        for (size_t i = 0; i < lines.size(); ++i) {
            out.at<float>((int)i, 0) = lines[i][0];
            out.at<float>((int)i, 1) = lines[i][1];
        }
        hspcv4::handle_set(out_id, std::move(out));
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_hough_lines: unknown"); }
}

//  cv4_hough_linesp out_mat_id, src_id, rho, theta, thresh, min_len, max_gap
//    出力は Nx4 CV_32S Mat (x1, y1, x2, y2)。
CV4_EXPORT BOOL WINAPI cv4_hough_linesp(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    try {
        int out_id    = getint();
        int src_id    = getint();
        double rho    = hei->HspFunc_prm_getdd(1.0);
        double theta  = hei->HspFunc_prm_getdd(0.017453293);
        int thresh    = getint();
        double minLen = hei->HspFunc_prm_getdd(30.0);
        double maxGap = hei->HspFunc_prm_getdd(10.0);
        cv::Mat* src = hspcv4::handle_get(src_id);
        if (!src || src->empty()) return fail("cv4_hough_linesp: invalid source");
        std::vector<cv::Vec4i> lines;
        cv::HoughLinesP(*src, lines, rho, theta, thresh, minLen, maxGap);
        cv::Mat out((int)lines.size(), 4, CV_32S);
        for (size_t i = 0; i < lines.size(); ++i) {
            out.at<int>((int)i, 0) = lines[i][0];
            out.at<int>((int)i, 1) = lines[i][1];
            out.at<int>((int)i, 2) = lines[i][2];
            out.at<int>((int)i, 3) = lines[i][3];
        }
        hspcv4::handle_set(out_id, std::move(out));
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_hough_linesp: unknown"); }
}

//  cv4_hough_circles out_mat_id, src_id, dp, min_dist, param1, param2, min_r, max_r
//    出力は Nx3 CV_32F Mat (cx, cy, radius)。
CV4_EXPORT BOOL WINAPI cv4_hough_circles(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    try {
        int out_id  = getint();
        int src_id  = getint();
        double dp   = hei->HspFunc_prm_getdd(1.0);
        double mdst = hei->HspFunc_prm_getdd(20.0);
        double pr1  = hei->HspFunc_prm_getdd(100.0);
        double pr2  = hei->HspFunc_prm_getdd(30.0);
        int minR    = getint_def(0);
        int maxR    = getint_def(0);
        cv::Mat* src = hspcv4::handle_get(src_id);
        if (!src || src->empty()) return fail("cv4_hough_circles: invalid source");
        cv::Mat gray = (src->channels() == 1) ? *src : cv::Mat();
        if (gray.empty()) cv::cvtColor(*src, gray, cv::COLOR_BGR2GRAY);
        std::vector<cv::Vec3f> circles;
        cv::HoughCircles(gray, circles, cv::HOUGH_GRADIENT, dp, mdst, pr1, pr2, minR, maxR);
        cv::Mat out((int)circles.size(), 3, CV_32F);
        for (size_t i = 0; i < circles.size(); ++i) {
            out.at<float>((int)i, 0) = circles[i][0];
            out.at<float>((int)i, 1) = circles[i][1];
            out.at<float>((int)i, 2) = circles[i][2];
        }
        hspcv4::handle_set(out_id, std::move(out));
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_hough_circles: unknown"); }
}


//============================================================================
//  Template matching
//============================================================================

//  cv4_match_template out_id, src_id, templ_id, method
CV4_EXPORT BOOL WINAPI cv4_match_template(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    try {
        int out_id   = getint();
        int src_id   = getint();
        int templ_id = getint();
        int method   = getint_def(cv::TM_CCOEFF_NORMED);
        cv::Mat* src = hspcv4::handle_get(src_id);
        cv::Mat* tmp = hspcv4::handle_get(templ_id);
        if (!src || src->empty()) return fail("cv4_match_template: invalid source");
        if (!tmp || tmp->empty()) return fail("cv4_match_template: invalid template");
        cv::Mat out;
        cv::matchTemplate(*src, *tmp, out, method);
        hspcv4::handle_set(out_id, std::move(out));
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_match_template: unknown"); }
}


//============================================================================
//  Image pyramids
//============================================================================

//  cv4_pyr_up dst, src
CV4_EXPORT BOOL WINAPI cv4_pyr_up(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    try {
        int dst_id = getint();
        int src_id = getint();
        cv::Mat* src = hspcv4::handle_get(src_id);
        if (!src || src->empty()) return fail("cv4_pyr_up: invalid source");
        cv::Mat out;
        cv::pyrUp(*src, out);
        hspcv4::handle_set(dst_id, std::move(out));
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_pyr_up: unknown"); }
}

//  cv4_pyr_down dst, src
CV4_EXPORT BOOL WINAPI cv4_pyr_down(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    try {
        int dst_id = getint();
        int src_id = getint();
        cv::Mat* src = hspcv4::handle_get(src_id);
        if (!src || src->empty()) return fail("cv4_pyr_down: invalid source");
        cv::Mat out;
        cv::pyrDown(*src, out);
        hspcv4::handle_set(dst_id, std::move(out));
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_pyr_down: unknown"); }
}


//============================================================================
//  Mat generic accessors : shape / geti / getf / min_max_loc
//  これらは Hough や DNN 等で返される Mat を HSP 側から読むために使う
//============================================================================

//  cv4_mat_shape id, var_rows, var_cols, var_type, var_channels
CV4_EXPORT BOOL WINAPI cv4_mat_shape(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    try {
        int id = getint();
        cv::Mat* m = hspcv4::handle_get(id);
        if (!m || m->empty()) return fail("cv4_mat_shape: invalid handle");
        int vals[4] = { m->rows, m->cols, m->type(), m->channels() };
        for (int i = 0; i < 4; ++i) {
            PVal* pv;
            APTR a = hei->HspFunc_prm_getva(&pv);
            if (pv->flag != HSPVAR_FLAG_INT) return fail("cv4_mat_shape: var must be int");
            pv->offset = a;
            HspVarProc* proc = hei->HspFunc_getproc(pv->flag);
            proc->Set(pv, proc->GetPtr(pv), &vals[i]);
        }
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_mat_shape: unknown"); }
}

//  cv4_mat_geti id, row, col, var_value
//    Mat (CV_8U / CV_32S / CV_16S 等の整数型) の 1ch 値を読む
CV4_EXPORT BOOL WINAPI cv4_mat_geti(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    try {
        int id  = getint();
        int row = getint();
        int col = getint();
        PVal* pv;
        APTR  a = hei->HspFunc_prm_getva(&pv);
        if (pv->flag != HSPVAR_FLAG_INT) return fail("cv4_mat_geti: var must be int");
        pv->offset = a;
        cv::Mat* m = hspcv4::handle_get(id);
        if (!m || m->empty()) return fail("cv4_mat_geti: invalid handle");
        if (row < 0 || row >= m->rows || col < 0 || col >= m->cols) {
            return fail("cv4_mat_geti: index out of bounds");
        }
        int v = 0;
        int depth = m->depth();
        if (depth == CV_8U)       v = m->at<uchar>(row, col);
        else if (depth == CV_8S)  v = m->at<schar>(row, col);
        else if (depth == CV_16U) v = m->at<ushort>(row, col);
        else if (depth == CV_16S) v = m->at<short>(row, col);
        else if (depth == CV_32S) v = m->at<int>(row, col);
        else return fail("cv4_mat_geti: non-integer Mat (use cv4_mat_getf)");
        HspVarProc* proc = hei->HspFunc_getproc(pv->flag);
        proc->Set(pv, proc->GetPtr(pv), &v);
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_mat_geti: unknown"); }
}

//  cv4_mat_getf id, row, col, var_value_x10000
//    Mat (CV_32F / CV_64F) の 1ch 値を int x10000 固定小数点で返す
CV4_EXPORT BOOL WINAPI cv4_mat_getf(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    try {
        int id  = getint();
        int row = getint();
        int col = getint();
        PVal* pv;
        APTR  a = hei->HspFunc_prm_getva(&pv);
        if (pv->flag != HSPVAR_FLAG_INT) return fail("cv4_mat_getf: var must be int");
        pv->offset = a;
        cv::Mat* m = hspcv4::handle_get(id);
        if (!m || m->empty()) return fail("cv4_mat_getf: invalid handle");
        if (row < 0 || row >= m->rows || col < 0 || col >= m->cols) {
            return fail("cv4_mat_getf: index out of bounds");
        }
        double v = 0.0;
        int depth = m->depth();
        if (depth == CV_32F)       v = m->at<float>(row, col);
        else if (depth == CV_64F)  v = m->at<double>(row, col);
        else return fail("cv4_mat_getf: non-float Mat (use cv4_mat_geti)");
        int iv = (int)(v * 10000.0);
        HspVarProc* proc = hei->HspFunc_getproc(pv->flag);
        proc->Set(pv, proc->GetPtr(pv), &iv);
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_mat_getf: unknown"); }
}

//  cv4_min_max_loc id, var_minval_x10000, var_maxval_x10000, var_minx, var_miny, var_maxx, var_maxy
CV4_EXPORT BOOL WINAPI cv4_min_max_loc(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    try {
        int id = getint();
        cv::Mat* m = hspcv4::handle_get(id);
        if (!m || m->empty()) return fail("cv4_min_max_loc: invalid handle");
        double mn, mx;
        cv::Point mnl, mxl;
        cv::minMaxLoc(*m, &mn, &mx, &mnl, &mxl);
        int vals[6] = {
            (int)(mn * 10000.0), (int)(mx * 10000.0),
            mnl.x, mnl.y, mxl.x, mxl.y
        };
        for (int i = 0; i < 6; ++i) {
            PVal* pv;
            APTR a = hei->HspFunc_prm_getva(&pv);
            if (pv->flag != HSPVAR_FLAG_INT) return fail("cv4_min_max_loc: var must be int");
            pv->offset = a;
            HspVarProc* proc = hei->HspFunc_getproc(pv->flag);
            proc->Set(pv, proc->GetPtr(pv), &vals[i]);
        }
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_min_max_loc: unknown"); }
}


//============================================================================
//  Filters : blur / gauss / median / canny / thresh
//  dst と src は別ハンドル可、同一ハンドルでも可。
//============================================================================

//  cv4blur dst_id, src_id, ksize
CV4_EXPORT BOOL WINAPI cv4blur(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    try {
        int dst_id = getint();
        int src_id = getint();
        int ksize  = getint();
        if (ksize < 1) ksize = 1;
        cv::Mat* src = hspcv4::handle_get(src_id);
        if (!src || src->empty()) return fail("cv4blur: invalid source");
        cv::Mat out;
        cv::blur(*src, out, cv::Size(ksize, ksize));
        hspcv4::handle_set(dst_id, std::move(out));
        return 0;
    } catch (const cv::Exception& e) {
        return fail(e.what());
    } catch (...) {
        return fail("cv4blur: unknown exception");
    }
}

//  cv4gauss dst_id, src_id, ksize [, sigma=0]
//  ksize は奇数を推奨。偶数を渡したら +1 する。
CV4_EXPORT BOOL WINAPI cv4gauss(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    try {
        int dst_id   = getint();
        int src_id   = getint();
        int ksize    = getint();
        double sigma = hei->HspFunc_prm_getdd(0.0);
        if (ksize < 1) ksize = 1;
        if ((ksize & 1) == 0) ksize += 1;   // 偶数なら奇数化
        cv::Mat* src = hspcv4::handle_get(src_id);
        if (!src || src->empty()) return fail("cv4gauss: invalid source");
        cv::Mat out;
        cv::GaussianBlur(*src, out, cv::Size(ksize, ksize), sigma);
        hspcv4::handle_set(dst_id, std::move(out));
        return 0;
    } catch (const cv::Exception& e) {
        return fail(e.what());
    } catch (...) {
        return fail("cv4gauss: unknown exception");
    }
}

//  cv4median dst_id, src_id, ksize
//  ksize は 3 以上の奇数を推奨。偶数なら +1、1 以下は 3 に補正。
CV4_EXPORT BOOL WINAPI cv4median(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    try {
        int dst_id = getint();
        int src_id = getint();
        int ksize  = getint();
        if (ksize < 3) ksize = 3;
        if ((ksize & 1) == 0) ksize += 1;
        cv::Mat* src = hspcv4::handle_get(src_id);
        if (!src || src->empty()) return fail("cv4median: invalid source");
        cv::Mat out;
        cv::medianBlur(*src, out, ksize);
        hspcv4::handle_set(dst_id, std::move(out));
        return 0;
    } catch (const cv::Exception& e) {
        return fail(e.what());
    } catch (...) {
        return fail("cv4median: unknown exception");
    }
}

//  cv4canny dst_id, src_id, thresh1, thresh2 [, aperture=3]
//  src はグレースケール推奨 (カラーでも動くが、先に cv4cvt CV4_BGR2GRAY する方が良い)
CV4_EXPORT BOOL WINAPI cv4canny(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    try {
        int dst_id  = getint();
        int src_id  = getint();
        int t1      = getint();
        int t2      = getint();
        int aperture = getint_def(3);
        cv::Mat* src = hspcv4::handle_get(src_id);
        if (!src || src->empty()) return fail("cv4canny: invalid source");
        cv::Mat out;
        cv::Canny(*src, out, (double)t1, (double)t2, aperture);
        hspcv4::handle_set(dst_id, std::move(out));
        return 0;
    } catch (const cv::Exception& e) {
        return fail(e.what());
    } catch (...) {
        return fail("cv4canny: unknown exception");
    }
}

//  cv4thresh dst_id, src_id, thresh, maxval, type
//  type は CV4_THRESH_BINARY 等。OTSU (8) は THRESH_BINARY と ORで指定 (= 8|0).
CV4_EXPORT BOOL WINAPI cv4thresh(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    try {
        int dst_id = getint();
        int src_id = getint();
        int th     = getint();
        int mx     = getint();
        int type   = getint_def(0);  // 0 = THRESH_BINARY
        cv::Mat* src = hspcv4::handle_get(src_id);
        if (!src || src->empty()) return fail("cv4thresh: invalid source");
        cv::Mat out;
        cv::threshold(*src, out, (double)th, (double)mx, type);
        hspcv4::handle_set(dst_id, std::move(out));
        return 0;
    } catch (const cv::Exception& e) {
        return fail(e.what());
    } catch (...) {
        return fail("cv4thresh: unknown exception");
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
