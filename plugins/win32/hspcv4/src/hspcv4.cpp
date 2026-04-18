//
//  hspcv4 - OpenCV 4.x plugin for IronHSP
//
//  Phase F6 完了: 全 #func が typed 形式 (int/str/double/pval/...) に移行済。
//  Return 0 = success (HSP stat = 0), negative = error (stat < 0).
//
#include "hspcv4.h"
#include "hspcv4_capi.h"
#include <string>
#include <memory>
#include <cmath>
#include <unordered_map>
#include <mutex>

namespace {

// Report an error. Phase F6 �������_�� hspcv4.dll �̑S #func �� typed �`��
// (int/str/double/pval/...) �ɓ���ρBreturn �l: 0=���� / ���l=���s�B
inline int fail(const char* msg)
{
    hspcv4::set_last_error(msg);
    return -1;
}

//----------------------------------------------------------------------------
//  Alpha channel helpers
//
//  hspcv4 では画像�?� BGR (CV_8UC3) �? BGRA (CV_8UC4) の両方がありうる�?
//  cv4load は�?フォルトで IMREAD_UNCHANGED を使�?ので、アルファ付き PNG
//  を読み込むと 4ch になる。�?��?関数 (blur / filter / canny ...) は�?部
//  �?に BGR 3ch を前提にして�?ることが多いため�?4ch 入力を素直に渡すと
//  以下�?��?ずれか�?�問題が起きる:
//    - アルファまで一緒に畳み込まれる (フィルタが黒い縁を作る)
//    - cvtColor(BGR2GRAY) 系で channel mismatch エラー
//    - 出力が無条件に 3ch になってアルファが失われ�?
//
//  これを避けるために with_alpha_preserved() ヘルパ�?�を用意する�?
//  入力が 4ch だった場合�?�アルファを一時的に�?り離し、op に 3ch BGR だ�?
//  渡す。op の出力が 3ch なら�??のアルファを合成し直して 4ch として返す�?
//  op の出力が 1ch (grayscale 系) なら素直にそれを返す (グレースケール
//  画像にアルファをくっつけても意味がな�?ため)�?
//  入力がもともと 3ch �?それ以外�?�形式な�? op をそのまま呼ぶだけ�?
//----------------------------------------------------------------------------
template <typename OpBGR>
inline void with_alpha_preserved(const cv::Mat& in, cv::Mat& out, OpBGR op)
{
    if (in.channels() != 4) {
        op(in, out);
        return;
    }
    // 4ch (BGRA) �? アルファを保存して BGR だけで op を呼ぶ
    std::vector<cv::Mat> ch;
    cv::split(in, ch);        // ch[0]=B ch[1]=G ch[2]=R ch[3]=A
    cv::Mat bgr;
    cv::merge(std::vector<cv::Mat>{ ch[0], ch[1], ch[2] }, bgr);
    cv::Mat bgr_out;
    op(bgr, bgr_out);
    if (bgr_out.channels() == 1) {
        out = bgr_out;        // grayscale: アルファは捨て�?
        return;
    }
    if (bgr_out.channels() != 3) {
        out = bgr_out;        // 想定�?: そ�?�まま返す
        return;
    }
    std::vector<cv::Mat> out_ch;
    cv::split(bgr_out, out_ch);
    out_ch.push_back(ch[3]);
    cv::merge(out_ch, out);
}

//  入力が 4ch な�? BGRA �? BGR�?3ch ならそのまま。�?��?関数�?部で
//  「BGR 前提の cvtColor(BGR2GRAY) 等を呼びたい」ときに使�?軽量版�?
//  戻り値自体にアルファを戻した�?場合�?� with_alpha_preserved を使�?こと�?
inline cv::Mat as_bgr(const cv::Mat& in)
{
    if (in.channels() == 4) {
        cv::Mat bgr;
        cv::cvtColor(in, bgr, cv::COLOR_BGRA2BGR);
        return bgr;
    }
    return in;
}

} // namespace


//============================================================================
//  Contrib DLL delayed loader
//
//  opencv_contrib 系の機�?�は hspcv4_contrib.dll / hspcv4_contrib_64.dll
//  と�?�?別 DLL に�?離されて�?る。ユーザーはこれを�?��?せず軽量ビルドを
//  使�?ことも�?配�?して contrib 機�?�を有効にすることもできる�?
//
//  実行時に最初�?� contrib 関数が呼ばれたと�? LoadLibrary で動的に取得�?
//  DLL が見つからな�?場合�?�「hspcv4_contrib.dll not found」エラー�? stat
//  として返す (負値 return = OLDDLL 符号反転で正の error stat)�?
//============================================================================

// 汎用 void* 関数ポインタ�? (呼び出し�?�で適�?にキャストす�?)
typedef void* hspcv4_contrib_fn_t;

static HMODULE g_contrib_dll = nullptr;
static bool    g_contrib_load_tried = false;

static HMODULE load_contrib_dll()
{
    if (g_contrib_dll) return g_contrib_dll;
    if (g_contrib_load_tried) return nullptr;
    g_contrib_load_tried = true;

    // 32bit 版な�? hspcv4_contrib.dll�?64bit 版な�? hspcv4_contrib_64.dll
#ifdef _WIN64
    const char* name = "hspcv4_contrib_64.dll";
#else
    const char* name = "hspcv4_contrib.dll";
#endif
    g_contrib_dll = LoadLibraryA(name);
    if (!g_contrib_dll) {
        hspcv4::set_last_error(
            "hspcv4_contrib.dll not found. "
            "Install the contrib DLL next to hspcv4.dll to use this feature.");
    }
    return g_contrib_dll;
}

static void* get_contrib_fn(const char* impl_name)
{
    HMODULE h = load_contrib_dll();
    if (!h) return nullptr;
    return (void*)GetProcAddress(h, impl_name);
}

//============================================================================
//  contrib proxy stubs (typed #func �?)
//
//  �? proxy は main DLL 側で完�?�に typed 引数を受け取り、contrib DLL の
//  impl 関数 (同じ typed シグネチャ) に丸ごと転送する。contrib DLL �?
//  見つからな�?場合�?� fail() でエラーを返す (typed #func なので残留引数の
//  空読みは不�?)�?
//============================================================================

//  cv4_contrib_version var_str
//    contrib DLL の存在確認用。OpenCV バ�?�ジョン�?字�?�を var_str に書き戻す�?
//    contrib 側で HSP string 書き込みを行うため HSPEXINFO + PVal* を渡す�?
CV4_EXPORT int __stdcall cv4_contrib_version(HSPEXINFO* hei, PVal* pv)
{
    typedef int (__stdcall *fn_t)(HSPEXINFO*, PVal*, const hspcv4_handle_api_t*);
    static fn_t fn = (fn_t)get_contrib_fn("cv4_contrib_version_impl");
    if (fn) return fn(hei, pv, hspcv4_get_api());
    return fail("cv4_contrib_version: hspcv4_contrib.dll not available");
}

//  cv4_tracker_create_csrt tid
CV4_EXPORT int __stdcall cv4_tracker_create_csrt(int tid)
{
    typedef int (__stdcall *fn_t)(int, const hspcv4_handle_api_t*);
    static fn_t fn = (fn_t)get_contrib_fn("cv4_tracker_create_csrt_impl");
    if (fn) return fn(tid, hspcv4_get_api());
    return fail("cv4_tracker_create_csrt: hspcv4_contrib.dll not available");
}

//  cv4_tracker_create_kcf tid
CV4_EXPORT int __stdcall cv4_tracker_create_kcf(int tid)
{
    typedef int (__stdcall *fn_t)(int, const hspcv4_handle_api_t*);
    static fn_t fn = (fn_t)get_contrib_fn("cv4_tracker_create_kcf_impl");
    if (fn) return fn(tid, hspcv4_get_api());
    return fail("cv4_tracker_create_kcf: hspcv4_contrib.dll not available");
}

// --- xfeatures2d proxies (Phase 13b-3) ---

//  cv4_star_detect kp_id, img_id
CV4_EXPORT int __stdcall cv4_star_detect(int kp_id, int img_id)
{
    typedef int (__stdcall *fn_t)(int, int, const hspcv4_handle_api_t*);
    static fn_t fn = (fn_t)get_contrib_fn("cv4_star_detect_impl");
    if (fn) return fn(kp_id, img_id, hspcv4_get_api());
    return fail("cv4_star_detect: hspcv4_contrib.dll not available");
}

//  cv4_harris_laplace_detect kp_id, img_id
CV4_EXPORT int __stdcall cv4_harris_laplace_detect(int kp_id, int img_id)
{
    typedef int (__stdcall *fn_t)(int, int, const hspcv4_handle_api_t*);
    static fn_t fn = (fn_t)get_contrib_fn("cv4_harris_laplace_detect_impl");
    if (fn) return fn(kp_id, img_id, hspcv4_get_api());
    return fail("cv4_harris_laplace_detect: hspcv4_contrib.dll not available");
}

//  cv4_brief_compute kp_id, desc_id, img_id, bytes
CV4_EXPORT int __stdcall cv4_brief_compute(int kp_id, int desc_id, int img_id, int bytes)
{
    if (bytes == 0) bytes = 32;
    typedef int (__stdcall *fn_t)(int, int, int, int, const hspcv4_handle_api_t*);
    static fn_t fn = (fn_t)get_contrib_fn("cv4_brief_compute_impl");
    if (fn) return fn(kp_id, desc_id, img_id, bytes, hspcv4_get_api());
    return fail("cv4_brief_compute: hspcv4_contrib.dll not available");
}

//  cv4_freak_compute kp_id, desc_id, img_id
CV4_EXPORT int __stdcall cv4_freak_compute(int kp_id, int desc_id, int img_id)
{
    typedef int (__stdcall *fn_t)(int, int, int, const hspcv4_handle_api_t*);
    static fn_t fn = (fn_t)get_contrib_fn("cv4_freak_compute_impl");
    if (fn) return fn(kp_id, desc_id, img_id, hspcv4_get_api());
    return fail("cv4_freak_compute: hspcv4_contrib.dll not available");
}

//  cv4_daisy_compute kp_id, desc_id, img_id
CV4_EXPORT int __stdcall cv4_daisy_compute(int kp_id, int desc_id, int img_id)
{
    typedef int (__stdcall *fn_t)(int, int, int, const hspcv4_handle_api_t*);
    static fn_t fn = (fn_t)get_contrib_fn("cv4_daisy_compute_impl");
    if (fn) return fn(kp_id, desc_id, img_id, hspcv4_get_api());
    return fail("cv4_daisy_compute: hspcv4_contrib.dll not available");
}

// --- bgsegm proxies (Phase 13b-4) ---

CV4_EXPORT int __stdcall cv4_bgsub_create_cnt(int bg_id, int min_st, int use_h,
                                              int max_st, int par)
{
    if (min_st == 0) min_st = 15;
    if (use_h  == 0) use_h  = 1;
    if (max_st == 0) max_st = 15 * 60;
    if (par    == 0) par    = 1;
    typedef int (__stdcall *fn_t)(int, int, int, int, int, const hspcv4_handle_api_t*);
    static fn_t fn = (fn_t)get_contrib_fn("cv4_bgsub_create_cnt_impl");
    if (fn) return fn(bg_id, min_st, use_h, max_st, par, hspcv4_get_api());
    return fail("cv4_bgsub_create_cnt: hspcv4_contrib.dll not available");
}

CV4_EXPORT int __stdcall cv4_bgsub_create_gmg(int bg_id, int init, double dth)
{
    if (init == 0) init = 120;
    if (dth  == 0.0) dth = 0.8;
    typedef int (__stdcall *fn_t)(int, int, double, const hspcv4_handle_api_t*);
    static fn_t fn = (fn_t)get_contrib_fn("cv4_bgsub_create_gmg_impl");
    if (fn) return fn(bg_id, init, dth, hspcv4_get_api());
    return fail("cv4_bgsub_create_gmg: hspcv4_contrib.dll not available");
}

CV4_EXPORT int __stdcall cv4_bgsub_create_lsbp(int bg_id)
{
    typedef int (__stdcall *fn_t)(int, const hspcv4_handle_api_t*);
    static fn_t fn = (fn_t)get_contrib_fn("cv4_bgsub_create_lsbp_impl");
    if (fn) return fn(bg_id, hspcv4_get_api());
    return fail("cv4_bgsub_create_lsbp: hspcv4_contrib.dll not available");
}

CV4_EXPORT int __stdcall cv4_bgsub_create_gsoc(int bg_id)
{
    typedef int (__stdcall *fn_t)(int, const hspcv4_handle_api_t*);
    static fn_t fn = (fn_t)get_contrib_fn("cv4_bgsub_create_gsoc_impl");
    if (fn) return fn(bg_id, hspcv4_get_api());
    return fail("cv4_bgsub_create_gsoc: hspcv4_contrib.dll not available");
}

CV4_EXPORT int __stdcall cv4_bgsub_create_mog(int bg_id, int history, int nmix,
                                              double br, double ns)
{
    if (history == 0) history = 200;
    if (nmix    == 0) nmix    = 5;
    if (br     == 0.0) br    = 0.7;
    typedef int (__stdcall *fn_t)(int, int, int, double, double, const hspcv4_handle_api_t*);
    static fn_t fn = (fn_t)get_contrib_fn("cv4_bgsub_create_mog_impl");
    if (fn) return fn(bg_id, history, nmix, br, ns, hspcv4_get_api());
    return fail("cv4_bgsub_create_mog: hspcv4_contrib.dll not available");
}

// --- ximgproc proxies (Phase 13b-5) ---

CV4_EXPORT int __stdcall cv4_thinning(int dst_id, int src_id, int type)
{
    typedef int (__stdcall *fn_t)(int, int, int, const hspcv4_handle_api_t*);
    static fn_t fn = (fn_t)get_contrib_fn("cv4_thinning_impl");
    if (fn) return fn(dst_id, src_id, type, hspcv4_get_api());
    return fail("cv4_thinning: hspcv4_contrib.dll not available");
}

CV4_EXPORT int __stdcall cv4_niblack(int dst_id, int src_id, double mv,
                                     int type, int bsize, double k)
{
    if (mv    == 0.0) mv    = 255.0;
    if (k     == 0.0) k     = 0.5;
    typedef int (__stdcall *fn_t)(int, int, double, int, int, double, const hspcv4_handle_api_t*);
    static fn_t fn = (fn_t)get_contrib_fn("cv4_niblack_impl");
    if (fn) return fn(dst_id, src_id, mv, type, bsize, k, hspcv4_get_api());
    return fail("cv4_niblack: hspcv4_contrib.dll not available");
}

CV4_EXPORT int __stdcall cv4_anisotropic_diffusion(int dst_id, int src_id,
                                                   double alpha, double K, int niters)
{
    if (alpha == 0.0) alpha = 1.0;
    if (K     == 0.0) K     = 0.02;
    if (niters == 0)  niters = 10;
    typedef int (__stdcall *fn_t)(int, int, double, double, int, const hspcv4_handle_api_t*);
    static fn_t fn = (fn_t)get_contrib_fn("cv4_anisotropic_diffusion_impl");
    if (fn) return fn(dst_id, src_id, alpha, K, niters, hspcv4_get_api());
    return fail("cv4_anisotropic_diffusion: hspcv4_contrib.dll not available");
}

CV4_EXPORT int __stdcall cv4_guided_filter(int dst_id, int guide_id, int src_id,
                                           int radius, double eps)
{
    if (eps == 0.0) eps = 1e-2;
    typedef int (__stdcall *fn_t)(int, int, int, int, double, const hspcv4_handle_api_t*);
    static fn_t fn = (fn_t)get_contrib_fn("cv4_guided_filter_impl");
    if (fn) return fn(dst_id, guide_id, src_id, radius, eps, hspcv4_get_api());
    return fail("cv4_guided_filter: hspcv4_contrib.dll not available");
}

CV4_EXPORT int __stdcall cv4_l0_smooth(int dst_id, int src_id, double lam, double kap)
{
    if (lam == 0.0) lam = 0.02;
    if (kap == 0.0) kap = 2.0;
    typedef int (__stdcall *fn_t)(int, int, double, double, const hspcv4_handle_api_t*);
    static fn_t fn = (fn_t)get_contrib_fn("cv4_l0_smooth_impl");
    if (fn) return fn(dst_id, src_id, lam, kap, hspcv4_get_api());
    return fail("cv4_l0_smooth: hspcv4_contrib.dll not available");
}

CV4_EXPORT int __stdcall cv4_fast_global_smoother(int dst_id, int guide_id, int src_id,
                                                  double lam, double sc)
{
    if (lam == 0.0) lam = 125.0;
    if (sc  == 0.0) sc  = 8.0;
    typedef int (__stdcall *fn_t)(int, int, int, double, double, const hspcv4_handle_api_t*);
    static fn_t fn = (fn_t)get_contrib_fn("cv4_fast_global_smoother_impl");
    if (fn) return fn(dst_id, guide_id, src_id, lam, sc, hspcv4_get_api());
    return fail("cv4_fast_global_smoother: hspcv4_contrib.dll not available");
}

CV4_EXPORT int __stdcall cv4_weighted_median(int dst_id, int joint_id, int src_id, int radius)
{
    if (radius == 0) radius = 7;
    typedef int (__stdcall *fn_t)(int, int, int, int, const hspcv4_handle_api_t*);
    static fn_t fn = (fn_t)get_contrib_fn("cv4_weighted_median_impl");
    if (fn) return fn(dst_id, joint_id, src_id, radius, hspcv4_get_api());
    return fail("cv4_weighted_median: hspcv4_contrib.dll not available");
}

// --- img_hash proxies (Phase 13b-6) ---
//   どれも (dst_id, src_id) の 2 引数

#define CV4_HASH_PROXY(name, impl_name) \
CV4_EXPORT int __stdcall name(int dst_id, int src_id) { \
    typedef int (__stdcall *fn_t)(int, int, const hspcv4_handle_api_t*); \
    static fn_t fn = (fn_t)get_contrib_fn(impl_name); \
    if (fn) return fn(dst_id, src_id, hspcv4_get_api()); \
    return fail(impl_name ": hspcv4_contrib.dll not available"); \
}

CV4_HASH_PROXY(cv4_phash,                "cv4_phash_impl")
CV4_HASH_PROXY(cv4_average_hash,         "cv4_average_hash_impl")
CV4_HASH_PROXY(cv4_block_mean_hash,      "cv4_block_mean_hash_impl")
CV4_HASH_PROXY(cv4_color_moment_hash,    "cv4_color_moment_hash_impl")
CV4_HASH_PROXY(cv4_marr_hildreth_hash,   "cv4_marr_hildreth_hash_impl")
CV4_HASH_PROXY(cv4_radial_variance_hash, "cv4_radial_variance_hash_impl")

#undef CV4_HASH_PROXY

// --- optflow proxies (Phase 13b-7) ---
//   どれも (flow_id, prev_id, next_id) の 3 引数

#define CV4_OPTFLOW_PROXY(name, impl_name) \
CV4_EXPORT int __stdcall name(int flow_id, int prev_id, int next_id) { \
    typedef int (__stdcall *fn_t)(int, int, int, const hspcv4_handle_api_t*); \
    static fn_t fn = (fn_t)get_contrib_fn(impl_name); \
    if (fn) return fn(flow_id, prev_id, next_id, hspcv4_get_api()); \
    return fail(impl_name ": hspcv4_contrib.dll not available"); \
}

CV4_OPTFLOW_PROXY(cv4_optflow_dualtvl1,         "cv4_optflow_dualtvl1_impl")
CV4_OPTFLOW_PROXY(cv4_optflow_deepflow,         "cv4_optflow_deepflow_impl")
CV4_OPTFLOW_PROXY(cv4_optflow_sparse_to_dense,  "cv4_optflow_sparse_to_dense_impl")

#undef CV4_OPTFLOW_PROXY

// --- dnn_superres proxies (Phase 13b-8) ---

//  cv4_dnn_sr_create sr_id, "model.pb", "algo", scale
CV4_EXPORT int __stdcall cv4_dnn_sr_create(int sr_id, const char* path,
                                           const char* algo, int scale)
{
    typedef int (__stdcall *fn_t)(int, const char*, const char*, int, const hspcv4_handle_api_t*);
    static fn_t fn = (fn_t)get_contrib_fn("cv4_dnn_sr_create_impl");
    if (fn) return fn(sr_id, path, algo, scale, hspcv4_get_api());
    return fail("cv4_dnn_sr_create: hspcv4_contrib.dll not available");
}

//  cv4_dnn_sr_upsample sr_id, dst_img_id, src_img_id
CV4_EXPORT int __stdcall cv4_dnn_sr_upsample(int sr_id, int dst_img_id, int src_img_id)
{
    typedef int (__stdcall *fn_t)(int, int, int, const hspcv4_handle_api_t*);
    static fn_t fn = (fn_t)get_contrib_fn("cv4_dnn_sr_upsample_impl");
    if (fn) return fn(sr_id, dst_img_id, src_img_id, hspcv4_get_api());
    return fail("cv4_dnn_sr_upsample: hspcv4_contrib.dll not available");
}

//  cv4_dnn_sr_free sr_id
CV4_EXPORT int __stdcall cv4_dnn_sr_free(int sr_id)
{
    typedef int (__stdcall *fn_t)(int, const hspcv4_handle_api_t*);
    static fn_t fn = (fn_t)get_contrib_fn("cv4_dnn_sr_free_impl");
    if (fn) return fn(sr_id, hspcv4_get_api());
    return fail("cv4_dnn_sr_free: hspcv4_contrib.dll not available");
}


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
        hspcv4::contours_clear_all();
        hspcv4::kps_clear_all();
        hspcv4::matches_clear_all();
        hspcv4::bgsub_clear_all();
        hspcv4::tracker_clear_all();
        hspcv4::ml_model_clear_all();
        hspcv4::face_recognizer_clear_all();
        hspcv4::facemark_clear_all();
        hspcv4::stereo_clear_all();
        hspcv4::kalman_clear_all();
        hspcv4::freetype_clear_all();
        cv::destroyAllWindows();
        // contrib DLL は OS �? process 終�?時に自�? FreeLibrary するので
        // ここで明示�?に解放する�?要�?�な�? (static ハンドルが残ったまま
        // でも害はな�?)�?
    }
    return TRUE;
}


//============================================================================
//  Core : load / save / info / del / reset
//============================================================================

//  cv4load id, "file.png"
//  -> id に画像を読み込む (既存ハンドルは上書�?)
//
//  �?フォルト�?� IMREAD_UNCHANGED �? アルファ付き PNG/TIFF 等�?� CV_8UC4
//  (BGRA) として読み込まれる。通常の JPEG は従来通り CV_8UC3 (BGR)�?
//  以前�?�「常に BGR 3ch」動作が欲しい場合�?� cv4_imread_flags に 1
//  (= cv::IMREAD_COLOR) を渡すこと�?
CV4_EXPORT int __stdcall cv4load(int id, const char* f)
{
    try {
        cv::Mat img = cv::imread(f ? f : "", cv::IMREAD_UNCHANGED);
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
//  -> id の画像をファイル保�?
CV4_EXPORT int __stdcall cv4save(int id, const char* f)
{
    try {
        cv::Mat* m = hspcv4::handle_get(id);
        if (!m || m->empty()) return fail("cv4save: invalid handle");
        if (!cv::imwrite(f ? f : "", *m)) return fail("cv4save: imwrite failed");
        return 0;
    } catch (const cv::Exception& e) {
        return fail(e.what());
    } catch (...) {
        return fail("cv4save: unknown exception");
    }
}

//  cv4del id
//  -> ハンドル解放
CV4_EXPORT int __stdcall cv4del(int id)
{
    hspcv4::handle_free(id);
    return 0;
}

//  cv4reset
//  -> 全ハンドル解放 + ウィンドウ全閉じ
CV4_EXPORT int __stdcall cv4reset()
{
    hspcv4::handle_clear_all();
    try { cv::destroyAllWindows(); } catch (...) {}
    return 0;
}

//  cv4info id, var_sx, var_sy, var_ch
//  -> 画像情報を変数に格�? (HSP の参�?�渡し変数)
CV4_EXPORT int __stdcall cv4info(int id, int* out_sx, int* out_sy, int* out_ch)
{
    try {
        cv::Mat* m = hspcv4::handle_get(id);
        if (!m || m->empty()) return fail("cv4info: invalid handle");
        if (out_sx) *out_sx = m->cols;
        if (out_sy) *out_sy = m->rows;
        if (out_ch) *out_ch = m->channels();
        return 0;
    } catch (const cv::Exception& e) {
        return fail(e.what());
    } catch (...) {
        return fail("cv4info: unknown exception");
    }
}


//============================================================================
//  ImgProc : cvt / resize
//============================================================================

//  cv4cvt dst_id, src_id, code
//  -> 色空間変換 (dst と src は別ハンドル可、同一でも可)
CV4_EXPORT int __stdcall cv4cvt(int dst_id, int src_id, int code)
{
    try {
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
//  -> リサイズ (HSP param �? 3 int+... なので最後�?�引数は getint で読む)
CV4_EXPORT int __stdcall cv4resize(int dst_id, int src_id, int new_w, int new_h)
{
    try {
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
//  -> id の画像を現在の HSP カレン�? window にコピ�?� (左上から�?�タ貼�?)
//     自動で上下反転、GRAY→BGR、BGRA→BGR 変換する
CV4_EXPORT int __stdcall cv4getimg(int id, BMSCR* bm)
{
    try {
        cv::Mat* src = hspcv4::handle_get(id);
        if (!src || src->empty()) return fail("cv4getimg: invalid handle");

        if (!bm || !bm->pBit) return fail("cv4getimg: no active screen");

        // src �? BGR / CV_8UC3 に�?える
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
        // HSP DIB は bottom-up。一番下�?�ラスター�? base�?
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
//    ONNX 形式�?�モ�?ルを読み込む�?
CV4_EXPORT int __stdcall cv4_dnn_load(int nid, const char* path)
{
    try {
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
CV4_EXPORT int __stdcall cv4_dnn_free(int nid)
{
    hspcv4::dnn_free(nid);
    return 0;
}

//  cv4_dnn_set_input nid, img_id, scale, mean_b, mean_g, mean_r, w, h, swap_rb
//    blobFromImage で 4D �?ンソル (1,C,H,W) を作って setInput する�?
//    scale: 画素値のスケール (�?: 1.0/255.0 で [0,1] に正規化)
//    mean_*: チャンネルごとに引く平�?値
//    swap_rb: �? 0 で BGR→RGB スワ�?�? (OpenCV の�?フォル�? BGR モ�?ルな�? 0)
CV4_EXPORT int __stdcall cv4_dnn_set_input(int nid, int img_id,
                                           double scale, double mb, double mg, double mr,
                                           int w, int h, int swap_rb)
{
    try {
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
//    推論実行。結果 (出�? blob) �? Mat ハンドル out_id に保存�?
CV4_EXPORT int __stdcall cv4_dnn_forward(int nid, int out_id)
{
    try {
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

//  cv4_dnn_load_caffe nid, "proto.txt", "model.caffemodel"
CV4_EXPORT int __stdcall cv4_dnn_load_caffe(int nid, const char* proto, const char* model)
{
    try {
        if (!proto || !model) return fail("cv4_dnn_load_caffe: empty path");
        cv::dnn::Net net = cv::dnn::readNetFromCaffe(proto, model);
        if (net.empty()) return fail("cv4_dnn_load_caffe: net empty");
        hspcv4::dnn_set(nid, std::move(net));
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_dnn_load_caffe: unknown"); }
}

//  cv4_dnn_load_tf nid, "model.pb", "config.pbtxt"
//    config は "" を渡せ�?�未�?定扱�?
CV4_EXPORT int __stdcall cv4_dnn_load_tf(int nid, const char* model, const char* config)
{
    try {
        if (!model) return fail("cv4_dnn_load_tf: empty path");
        cv::dnn::Net net = cv::dnn::readNetFromTensorflow(model, config ? config : "");
        if (net.empty()) return fail("cv4_dnn_load_tf: net empty");
        hspcv4::dnn_set(nid, std::move(net));
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_dnn_load_tf: unknown"); }
}

//  cv4_dnn_load_darknet nid, "yolo.cfg", "yolo.weights"
CV4_EXPORT int __stdcall cv4_dnn_load_darknet(int nid, const char* cfg, const char* weights)
{
    try {
        if (!cfg || !weights) return fail("cv4_dnn_load_darknet: empty path");
        cv::dnn::Net net = cv::dnn::readNetFromDarknet(cfg, weights);
        if (net.empty()) return fail("cv4_dnn_load_darknet: net empty");
        hspcv4::dnn_set(nid, std::move(net));
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_dnn_load_darknet: unknown"); }
}

//  cv4_dnn_set_backend nid, backend, target
//    backend: 0=DEFAULT, 1=HALIDE, 2=INFERENCE_ENGINE, 3=OPENCV, 5=CUDA
//    target:  0=CPU, 1=OPENCL, 2=OPENCL_FP16, 3=MYRIAD, 6=CUDA, 7=CUDA_FP16
CV4_EXPORT int __stdcall cv4_dnn_set_backend(int nid, int backend, int target)
{
    try {
        cv::dnn::Net* net = hspcv4::dnn_get(nid);
        if (!net || net->empty()) return fail("cv4_dnn_set_backend: invalid net");
        net->setPreferableBackend(backend);
        net->setPreferableTarget(target);
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_dnn_set_backend: unknown"); }
}

//  cv4_dnn_nms_boxes rects_array, var_count, scores_var, score_thresh, nms_thresh
//    rects_array: cv_rect 配�?? (in/out)。指定し�? index の rect だけが残る
//    var_count: 入力時=候補数、�?�力時=NMS 後�?�数
//    scores_var: float 配�?�を int x10000 で渡�?
//    score_thresh / nms_thresh: x10000 固定小数点 int
CV4_EXPORT int __stdcall cv4_dnn_nms_boxes(HSPEXINFO* hei,
                                           PVal* pv_rects, PVal* pv_count, PVal* pv_scores,
                                           int score_th_x10000, int nms_th_x10000)
{
    try {
        if (!hei || !pv_rects || !pv_count || !pv_scores)
            return fail("cv4_dnn_nms_boxes: null arg");
        if (pv_rects->len[0] < (int)sizeof(int) * 4)
            return fail("cv4_dnn_nms_boxes: rects must be cv_rect array");
        if (pv_count->flag != HSPVAR_FLAG_INT)
            return fail("cv4_dnn_nms_boxes: count must be int");
        if (pv_scores->flag != HSPVAR_FLAG_INT)
            return fail("cv4_dnn_nms_boxes: scores must be int array (x10000)");

        // 入�? count を取�?
        int n_in = *(int*)pv_count->pt;
        if (n_in <= 0) return 0;
        if (pv_rects->len[1] < n_in) return fail("cv4_dnn_nms_boxes: rects too small");
        if (pv_scores->len[1] < n_in) return fail("cv4_dnn_nms_boxes: scores too small");

        // HSP -> std::vector
        std::vector<cv::Rect> boxes(n_in);
        std::vector<float> scores(n_in);
        char* base_r = (char*)pv_rects->pt;
        int es_r = pv_rects->len[0];
        int* base_s = (int*)pv_scores->pt;
        for (int i = 0; i < n_in; ++i) {
            int* p = (int*)(base_r + (size_t)es_r * i);
            boxes[i] = cv::Rect(p[0], p[1], p[2], p[3]);
            scores[i] = (float)base_s[i] / 10000.0f;
        }

        std::vector<int> indices;
        cv::dnn::NMSBoxes(boxes, scores, score_th_x10000 / 10000.0f,
                          nms_th_x10000 / 10000.0f, indices);

        // 出�?: rects 配�?�を kept index で詰め直�?
        for (int i = 0; i < (int)indices.size(); ++i) {
            int src = indices[i];
            int* psrc = (int*)(base_r + (size_t)es_r * src);
            int* pdst = (int*)(base_r + (size_t)es_r * i);
            int tmp[4] = { psrc[0], psrc[1], psrc[2], psrc[3] };
            pdst[0] = tmp[0]; pdst[1] = tmp[1]; pdst[2] = tmp[2]; pdst[3] = tmp[3];
        }
        int n_out = (int)indices.size();
        HspVarProc* proc = hei->HspFunc_getproc(pv_count->flag);
        proc->Set(pv_count, proc->GetPtr(pv_count), &n_out);
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_dnn_nms_boxes: unknown"); }
}


//  cv4_dnn_argmax out_id, var_class, var_score
//    �?類タスク向けヘル�?: 出�? blob (float32) から argmax を計算して
//    クラス index (int) と最大スコア (double に int 変換したも�?�) を返す�?
//    実行時にスコア�? 0-1 の float から整数に変換する際�?�
//    var_score_int = scoreFloat * 10000 する (小数 4 桁相当�?�固定小数点)�?
CV4_EXPORT int __stdcall cv4_dnn_argmax(int out_id, int* out_cls, int* out_score_x10000)
{
    try {
        if (!out_cls || !out_score_x10000) return fail("cv4_dnn_argmax: null var");
        cv::Mat* m = hspcv4::handle_get(out_id);
        if (!m || m->empty()) return fail("cv4_dnn_argmax: invalid output");
        cv::Mat flat = m->reshape(1, 1);
        cv::Mat flatF;
        if (flat.type() != CV_32F) flat.convertTo(flatF, CV_32F);
        else flatF = flat;

        cv::Point maxLoc;
        double maxVal = 0.0;
        cv::minMaxLoc(flatF, nullptr, &maxVal, nullptr, &maxLoc);
        *out_cls = maxLoc.x;
        *out_score_x10000 = (int)(maxVal * 10000.0);
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
//    path �? 10 進数字�?? (�?: "0", "1") のとき�?�カメラ index として開く�?
//    それ以外�?�とき�?�ファイルパスとして開く�?
CV4_EXPORT int __stdcall cv4_video_open(int vid, const char* path)
{
    try {
        if (!path) return fail("cv4_video_open: null path");

        // 全桁数字ならカメラ index として扱�?
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
//    stat に 0 (成功) / -1 (終端 or 読込失�?)。�?�功時�?� frame_id に Mat が�?�る�?
CV4_EXPORT int __stdcall cv4_video_read(int vid, int frame_id)
{
    try {
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
CV4_EXPORT int __stdcall cv4_video_info(int vid, int* out_w, int* out_h,
                                        int* out_fps, int* out_total)
{
    try {
        if (!out_w || !out_h || !out_fps || !out_total) return fail("cv4_video_info: null var");
        cv::VideoCapture* vc = hspcv4::capture_get(vid);
        if (!vc || !vc->isOpened()) {
            return fail("cv4_video_info: invalid capture");
        }
        *out_w     = (int)vc->get(cv::CAP_PROP_FRAME_WIDTH);
        *out_h     = (int)vc->get(cv::CAP_PROP_FRAME_HEIGHT);
        *out_fps   = (int)vc->get(cv::CAP_PROP_FPS);
        *out_total = (int)vc->get(cv::CAP_PROP_FRAME_COUNT);
        return 0;
    } catch (const cv::Exception& e) {
        return fail(e.what());
    } catch (...) {
        return fail("cv4_video_info: unknown exception");
    }
}

//  cv4_video_close vid
CV4_EXPORT int __stdcall cv4_video_close(int vid)
{
    hspcv4::capture_free(vid);
    return 0;
}

//  cv4_writer_open wid, "path", "fourcc", fps, w, h
//    fourcc は 4 �?字�?��?字�?? (�?: "MJPG", "XVID", "mp4v")
CV4_EXPORT int __stdcall cv4_writer_open(int wid, const char* path, const char* fourcc,
                                         double fps, int w, int h)
{
    try {
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
CV4_EXPORT int __stdcall cv4_writer_write(int wid, int frame_id)
{
    try {
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
CV4_EXPORT int __stdcall cv4_writer_close(int wid)
{
    hspcv4::writer_free(wid);
    return 0;
}


//============================================================================
//  Stitching / Drawing extras / Misc
//============================================================================

// --- Stitching (パノラマ合�?) ---

//  cv4_stitch dst_id, img_ids_array, count
//    HSP の int 配�?�に入って�?るハンドル ID のリストか�? Stitcher で
//    パノラマ画像を合�?�する。count は使用する要素数 (配�?��?�要素数ではな�?)�?
CV4_EXPORT int __stdcall cv4_stitch(HSPEXINFO* hei, int dst_id, PVal* pv, int count)
{
    (void)hei;
    try {
        if (!pv) return fail("cv4_stitch: null pval");
        if (pv->flag != HSPVAR_FLAG_INT) return fail("cv4_stitch: img_ids must be int array");
        if (count <= 0) return fail("cv4_stitch: count must be > 0");

        int arr_len = pv->len[1];
        if (arr_len < count) return fail("cv4_stitch: array too small");

        int* ids = (int*)pv->pt;
        std::vector<cv::Mat> imgs;
        imgs.reserve(count);
        for (int i = 0; i < count; ++i) {
            cv::Mat* m = hspcv4::handle_get(ids[i]);
            if (!m || m->empty()) return fail("cv4_stitch: invalid input handle");
            imgs.push_back(*m);
        }

        cv::Ptr<cv::Stitcher> stitcher = cv::Stitcher::create(cv::Stitcher::PANORAMA);
        cv::Mat panorama;
        cv::Stitcher::Status status = stitcher->stitch(imgs, panorama);
        if (status != cv::Stitcher::OK) {
            switch (status) {
            case cv::Stitcher::ERR_NEED_MORE_IMGS:
                return fail("cv4_stitch: need more images");
            case cv::Stitcher::ERR_HOMOGRAPHY_EST_FAIL:
                return fail("cv4_stitch: homography estimation failed");
            case cv::Stitcher::ERR_CAMERA_PARAMS_ADJUST_FAIL:
                return fail("cv4_stitch: camera parameter adjustment failed");
            default:
                return fail("cv4_stitch: stitch failed");
            }
        }
        hspcv4::handle_set(dst_id, std::move(panorama));
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_stitch: unknown"); }
}

// --- 描画拡張 ---

//  cv4_draw_arrow id, x1, y1, x2, y2, b, g, r [, thickness=1] [, tip_len_x100=10]
CV4_EXPORT int __stdcall cv4_draw_arrow(int id, int x1, int y1, int x2, int y2,
                                        int b, int g, int r, int thick, int tip_x100)
{
    if (thick == 0) thick = 1;
    if (tip_x100 == 0) tip_x100 = 10;
    try {
        cv::Mat* m = hspcv4::handle_get(id);
        if (!m || m->empty()) return fail("cv4_draw_arrow: invalid handle");
        cv::arrowedLine(*m, cv::Point(x1, y1), cv::Point(x2, y2),
                        cv::Scalar(b, g, r), thick, cv::LINE_AA, 0, tip_x100 / 100.0);
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_draw_arrow: unknown"); }
}

//  cv4_draw_marker id, cx, cy, b, g, r [, marker_type=0] [, size=20] [, thickness=1]
//    marker_type: 0=CROSS, 1=TILTED_CROSS, 2=STAR, 3=DIAMOND, 4=SQUARE,
//                 5=TRIANGLE_UP, 6=TRIANGLE_DOWN
CV4_EXPORT int __stdcall cv4_draw_marker(int id, int cx, int cy, int b, int g, int r,
                                         int mtype, int size, int thick)
{
    if (size == 0) size = 20;
    if (thick == 0) thick = 1;
    try {
        cv::Mat* m = hspcv4::handle_get(id);
        if (!m || m->empty()) return fail("cv4_draw_marker: invalid handle");
        cv::drawMarker(*m, cv::Point(cx, cy), cv::Scalar(b, g, r),
                       mtype, size, thick, cv::LINE_AA);
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_draw_marker: unknown"); }
}

//  cv4_draw_ellipse id, cx, cy, rx, ry, angle, start_angle, end_angle, b, g, r [, thickness=1]
CV4_EXPORT int __stdcall cv4_draw_ellipse(int id, int cx, int cy, int rx, int ry,
                                          double ang, double sang, double eang,
                                          int b, int g, int r, int thick)
{
    if (eang == 0.0) eang = 360.0;
    if (thick == 0) thick = 1;
    try {
        cv::Mat* m = hspcv4::handle_get(id);
        if (!m || m->empty()) return fail("cv4_draw_ellipse: invalid handle");
        cv::ellipse(*m, cv::Point(cx, cy), cv::Size(rx, ry), ang, sang, eang,
                    cv::Scalar(b, g, r), thick, cv::LINE_AA);
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_draw_ellipse: unknown"); }
}

//  cv4_fill_poly id, points_array, point_count, b, g, r
//    points_array は [x0,y0,x1,y1,...] の int 配�??
CV4_EXPORT int __stdcall cv4_fill_poly(HSPEXINFO* hei, int id, PVal* pv,
                                       int ncount, int b, int g, int r)
{
    (void)hei;
    try {
        if (!pv) return fail("cv4_fill_poly: null pval");
        if (pv->flag != HSPVAR_FLAG_INT) return fail("cv4_fill_poly: points must be int array");
        if (ncount <= 0) return fail("cv4_fill_poly: count must be > 0");
        if (pv->len[1] < ncount * 2) return fail("cv4_fill_poly: array too small");
        cv::Mat* m = hspcv4::handle_get(id);
        if (!m || m->empty()) return fail("cv4_fill_poly: invalid handle");
        std::vector<cv::Point> pts;
        pts.reserve(ncount);
        int* src = (int*)pv->pt;
        for (int i = 0; i < ncount; ++i) {
            pts.emplace_back(src[i*2], src[i*2+1]);
        }
        std::vector<std::vector<cv::Point>> polys = { pts };
        cv::fillPoly(*m, polys, cv::Scalar(b, g, r), cv::LINE_AA);
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_fill_poly: unknown"); }
}

// --- そ�?�他ユー�?ィリ�?ィ ---

//  cv4_mat_clone dst, src
CV4_EXPORT int __stdcall cv4_mat_clone(int dst_id, int src_id)
{
    try {
        cv::Mat* src = hspcv4::handle_get(src_id);
        if (!src || src->empty()) return fail("cv4_mat_clone: invalid source");
        cv::Mat out = src->clone();
        hspcv4::handle_set(dst_id, std::move(out));
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_mat_clone: unknown"); }
}

//  cv4_put_pixel id, x, y, b, g, r [, a=255]
//    CV_8UC1 / CV_8UC3 / CV_8UC4 �?ずれにも対応�?
//    - 1ch: b をそのまま書き込み (g, r, a は無�?)
//    - 3ch: b, g, r を書き込み (a は無�?)
//    - 4ch: b, g, r, a を書き込み (a 省略時�?� 255)
CV4_EXPORT int __stdcall cv4_put_pixel(int id, int x, int y, int b, int g, int r, int a)
{
    if (a == 0) a = 255;
    try {
        cv::Mat* m = hspcv4::handle_get(id);
        if (!m || m->empty()) return fail("cv4_put_pixel: invalid handle");
        if (x < 0 || y < 0 || x >= m->cols || y >= m->rows) {
            return fail("cv4_put_pixel: out of bounds");
        }
        if (m->depth() != CV_8U) return fail("cv4_put_pixel: unsupported depth");
        if (m->channels() == 3) {
            auto& px = m->at<cv::Vec3b>(y, x);
            px[0] = (uchar)b; px[1] = (uchar)g; px[2] = (uchar)r;
        } else if (m->channels() == 4) {
            auto& px = m->at<cv::Vec4b>(y, x);
            px[0] = (uchar)b; px[1] = (uchar)g; px[2] = (uchar)r; px[3] = (uchar)a;
        } else if (m->channels() == 1) {
            m->at<uchar>(y, x) = (uchar)b;
        } else {
            return fail("cv4_put_pixel: unsupported Mat type");
        }
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_put_pixel: unknown"); }
}

//  cv4_get_pixel id, x, y, var_b, var_g, var_r
//    CV_8UC1 / CV_8UC3 / CV_8UC4 対応�?4ch 画像でもアルファは読み取らな�?
//    (アルファを読みたい場合�?� cv4_get_pixela を使�?こと)�?
CV4_EXPORT int __stdcall cv4_get_pixel(int id, int x, int y,
                                       int* out_b, int* out_g, int* out_r)
{
    try {
        cv::Mat* m = hspcv4::handle_get(id);
        if (!m || m->empty()) return fail("cv4_get_pixel: invalid handle");
        if (x < 0 || y < 0 || x >= m->cols || y >= m->rows) {
            return fail("cv4_get_pixel: out of bounds");
        }
        if (m->depth() != CV_8U) return fail("cv4_get_pixel: unsupported depth");
        int vals[3] = { 0, 0, 0 };
        if (m->channels() == 3) {
            auto& px = m->at<cv::Vec3b>(y, x);
            vals[0] = px[0]; vals[1] = px[1]; vals[2] = px[2];
        } else if (m->channels() == 4) {
            auto& px = m->at<cv::Vec4b>(y, x);
            vals[0] = px[0]; vals[1] = px[1]; vals[2] = px[2];
        } else if (m->channels() == 1) {
            int v = m->at<uchar>(y, x);
            vals[0] = vals[1] = vals[2] = v;
        } else {
            return fail("cv4_get_pixel: unsupported Mat type");
        }
        if (out_b) *out_b = vals[0];
        if (out_g) *out_g = vals[1];
        if (out_r) *out_r = vals[2];
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_get_pixel: unknown"); }
}

//  cv4_get_pixela id, x, y, var_b, var_g, var_r, var_a
//    CV_8UC4 前提。アルファを含めて 4 チャンネルを読み取る�?
//    CV_8UC3 に対して呼んだ場合�?� a に 255 が返る (便宜�?)�?
//    CV_8UC1 は a = 255、b = g = r = 輝度値�?
CV4_EXPORT int __stdcall cv4_get_pixela(HSPEXINFO* hei, int id, int x, int y,
                                        PVal* pv_b, PVal* pv_g, PVal* pv_r, PVal* pv_a)
{
    try {
        if (!hei || !pv_b || !pv_g || !pv_r || !pv_a) return fail("cv4_get_pixela: null arg");
        if (pv_b->flag != HSPVAR_FLAG_INT || pv_g->flag != HSPVAR_FLAG_INT ||
            pv_r->flag != HSPVAR_FLAG_INT || pv_a->flag != HSPVAR_FLAG_INT)
            return fail("cv4_get_pixela: var must be int");
        cv::Mat* m = hspcv4::handle_get(id);
        if (!m || m->empty()) return fail("cv4_get_pixela: invalid handle");
        if (x < 0 || y < 0 || x >= m->cols || y >= m->rows) {
            return fail("cv4_get_pixela: out of bounds");
        }
        if (m->depth() != CV_8U) return fail("cv4_get_pixela: unsupported depth");
        int vals[4] = { 0, 0, 0, 255 };
        if (m->channels() == 4) {
            auto& px = m->at<cv::Vec4b>(y, x);
            vals[0] = px[0]; vals[1] = px[1]; vals[2] = px[2]; vals[3] = px[3];
        } else if (m->channels() == 3) {
            auto& px = m->at<cv::Vec3b>(y, x);
            vals[0] = px[0]; vals[1] = px[1]; vals[2] = px[2];
        } else if (m->channels() == 1) {
            int v = m->at<uchar>(y, x);
            vals[0] = vals[1] = vals[2] = v;
        } else {
            return fail("cv4_get_pixela: unsupported Mat type");
        }
        HspVarProc* proc = hei->HspFunc_getproc(HSPVAR_FLAG_INT);
        proc->Set(pv_b, proc->GetPtr(pv_b), &vals[0]);
        proc->Set(pv_g, proc->GetPtr(pv_g), &vals[1]);
        proc->Set(pv_r, proc->GetPtr(pv_r), &vals[2]);
        proc->Set(pv_a, proc->GetPtr(pv_a), &vals[3]);
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_get_pixela: unknown"); }
}

//  cv4_build_version var_str
//    OpenCV のバ�?�ジョン�?報�? str 変数に格�?
CV4_EXPORT int __stdcall cv4_build_version(HSPEXINFO* hei, PVal* pv)
{
    try {
        if (!pv || !hei) return fail("cv4_build_version: null arg");
        if (pv->flag != HSPVAR_FLAG_STR) return fail("cv4_build_version: var must be str");
        std::string ver = cv::getVersionString();
        HspVarProc* proc = hei->HspFunc_getproc(pv->flag);
        proc->Set(pv, proc->GetPtr(pv), (void*)ver.c_str());
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_build_version: unknown"); }
}


//============================================================================
//  Imgcodecs extras : imdecode (memory buffer) / imencode + imread flags
//============================================================================

//  cv4_imread_flags id, "file", flags
//    cv4load の flag �?定版�?
//    flags: CV4_IMREAD_UNCHANGED=-1, GRAYSCALE=0, COLOR=1, ANYDEPTH=2, ANYCOLOR=4
CV4_EXPORT int __stdcall cv4_imread_flags(int id, const char* f, int flags)
{
    try {
        if (!f) return fail("cv4_imread_flags: null path");
        // flags 0 は GRAYSCALE (仕様通り)。省略時�?� cv::IMREAD_COLOR (=1) にする�?
        // typed #func では省略�? 0 と区別できな�?ので�?0 な�? GRAYSCALE�?
        cv::Mat img = cv::imread(f, flags);
        if (img.empty()) return fail("cv4_imread_flags: imread failed");
        hspcv4::handle_set(id, std::move(img));
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_imread_flags: unknown"); }
}

//  cv4_imdecode id, buffer_var, size
//    HSP の変数に入って�?るバイト�?? (netload �? cv4_imencode で取得し�?
//    PNG/JPEG バイト�??) から Mat をデコードする�?
//    size は実際のバイト数。cv4_imencode で取得し�? var_size をそのまま渡す�?
CV4_EXPORT int __stdcall cv4_imdecode(HSPEXINFO* hei, int id, PVal* pv, int size)
{
    (void)hei;
    try {
        if (!pv) return fail("cv4_imdecode: null pval");
        if (pv->flag != HSPVAR_FLAG_STR) return fail("cv4_imdecode: buffer must be str");
        if (size <= 0) return fail("cv4_imdecode: size must be > 0");
        std::vector<unsigned char> buf((unsigned char*)pv->pt, (unsigned char*)pv->pt + size);
        cv::Mat img = cv::imdecode(buf, cv::IMREAD_COLOR);
        if (img.empty()) return fail("cv4_imdecode: decode failed");
        hspcv4::handle_set(id, std::move(img));
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_imdecode: unknown"); }
}

//  cv4_imencode ext, id, buffer_var, var_size
//    Mat を指定フォーマッ�? (".png", ".jpg" �?) でエンコードして
//    HSP の str 変数にバイト�?�として格納し、バイト数�? var_size に返す�?
//    PNG 等には NUL バイトが含まれるので strlen では長さを測れな�?�?
//    �?�? var_size を使って後�? cv4_imdecode に渡すこと�?
CV4_EXPORT int __stdcall cv4_imencode(HSPEXINFO* hei, const char* ext, int id,
                                      PVal* pv_buf, PVal* pv_size)
{
    try {
        if (!hei || !pv_buf || !pv_size) return fail("cv4_imencode: null arg");
        if (pv_buf->flag != HSPVAR_FLAG_STR) return fail("cv4_imencode: buffer must be str");
        if (pv_size->flag != HSPVAR_FLAG_INT) return fail("cv4_imencode: var_size must be int");

        cv::Mat* m = hspcv4::handle_get(id);
        if (!m || m->empty()) return fail("cv4_imencode: invalid handle");
        std::vector<unsigned char> buf;
        if (!cv::imencode(ext ? ext : ".png", *m, buf))
            return fail("cv4_imencode: encode failed");

        // str 変数を�?要サイズで再確�? (nul 終端 1 バイト�??多め)
        hei->HspFunc_dim(pv_buf, HSPVAR_FLAG_STR, (int)buf.size() + 1, 0, 0, 0, 0);
        memcpy(pv_buf->pt, buf.data(), buf.size());
        ((char*)pv_buf->pt)[buf.size()] = 0;

        // size を返す
        int sz = (int)buf.size();
        HspVarProc* proc = hei->HspFunc_getproc(pv_size->flag);
        proc->Set(pv_size, proc->GetPtr(pv_size), &sz);
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_imencode: unknown"); }
}


//============================================================================
//  Aruco markers (main objdetect module in OpenCV 4.x)
//
//  辞書 (dictionary) は HSP からは整数 ID (PREDEFINED_DICTIONARY_NAME) で�?定�?
//  検�?�関数は cv_rect 配�?�に�?マ�?�カの外接矩形を、別 int 配�?�に ID を返す�?
//============================================================================

//  cv4_aruco_detect rects_array, ids_array, count_var, img_id, dict
CV4_EXPORT int __stdcall cv4_aruco_detect(HSPEXINFO* hei,
                                          PVal* pv_rects, PVal* pv_ids,
                                          int* out_count, int img_id, int dict_id)
{
    try {
        if (!pv_rects || !pv_ids || !out_count)
            return fail("cv4_aruco_detect: null arg");
        if (pv_ids->flag != HSPVAR_FLAG_INT)
            return fail("cv4_aruco_detect: ids must be int array");

        cv::Mat* img = hspcv4::handle_get(img_id);
        if (!img || img->empty()) return fail("cv4_aruco_detect: invalid image");

        cv::aruco::Dictionary dict =
            cv::aruco::getPredefinedDictionary(dict_id);
        cv::aruco::ArucoDetector detector(dict);
        std::vector<std::vector<cv::Point2f>> corners;
        std::vector<int> ids;
        detector.detectMarkers(*img, corners, ids);

        // 矩形配�?��?�サイズ
        int max_r = pv_rects->len[1];
        if (max_r <= 0) max_r = 1;
        int es_r = pv_rects->len[0];
        if (es_r < (int)sizeof(int) * 4)
            return fail("cv4_aruco_detect: rects must be cv_rect array");

        int max_i = pv_ids->len[1];
        if (max_i <= 0) max_i = 1;

        int n = (int)ids.size();
        if (n > max_r) n = max_r;
        if (n > max_i) n = max_i;

        char* base_r = (char*)pv_rects->pt;
        int* base_i = (int*)pv_ids->pt;
        for (int i = 0; i < n; ++i) {
            cv::Rect br = cv::boundingRect(corners[i]);
            int* p = (int*)(base_r + (size_t)es_r * i);
            p[0] = br.x; p[1] = br.y; p[2] = br.width; p[3] = br.height;
            base_i[i] = ids[i];
        }
        *out_count = n;
        return 0;
    } catch (const cv::Exception& e) {
        return fail(e.what());
    } catch (...) {
        return fail("cv4_aruco_detect: unknown");
    }
}

//  cv4_aruco_generate dst_id, dict, marker_id, side_pixels, border
//    �?�? ID のマ�?�カ画像を生�?�する�?
CV4_EXPORT int __stdcall cv4_aruco_generate(int dst_id, int dict_id, int marker_id,
                                            int side, int border)
{
    try {
        cv::aruco::Dictionary dict =
            cv::aruco::getPredefinedDictionary(dict_id);
        cv::Mat out;
        cv::aruco::generateImageMarker(dict, marker_id, side, out, border);
        hspcv4::handle_set(dst_id, std::move(out));
        return 0;
    } catch (const cv::Exception& e) {
        return fail(e.what());
    } catch (...) {
        return fail("cv4_aruco_generate: unknown");
    }
}


//============================================================================
//  Object detection extras : HOG Descriptor / QRCode Detector
//============================================================================

// --- HOG: 人物検�?�の定番 (cv::HOGDescriptor) ---
//   HOGDescriptor はハンドル保持せず�?都度生�?�して検�?�する簡�? API にする�?

//  cv4_hog_detect_people rects_array, count_var, img_id [, hit_thresh=0.0]
//    検�?�された矩形�? cv_rect 配�?�に書き込み、個数�? count_var に格納�?
//    �?フォル�? SVM は人物用 (HOGDescriptor::getDefaultPeopleDetector)�?
CV4_EXPORT int __stdcall cv4_hog_detect_people(HSPEXINFO* hei,
                                               PVal* pval_rects, PVal* pval_count,
                                               int img_id, double hit_th)
{
    try {
        if (!hei || !pval_rects || !pval_count)
            return fail("cv4_hog_detect_people: null arg");
        if (pval_count->flag != HSPVAR_FLAG_INT)
            return fail("cv4_hog_detect_people: count must be int");

        cv::Mat* img = hspcv4::handle_get(img_id);
        if (!img || img->empty()) return fail("cv4_hog_detect_people: invalid image");

        cv::HOGDescriptor hog;
        hog.setSVMDetector(cv::HOGDescriptor::getDefaultPeopleDetector());
        std::vector<cv::Rect> rects;
        std::vector<double> weights;
        hog.detectMultiScale(*img, rects, weights, hit_th, cv::Size(8,8), cv::Size(32,32), 1.05, 2);

        int max_elems = pval_rects->len[1];
        if (max_elems <= 0) max_elems = 1;
        int elem_size = pval_rects->len[0];
        if (elem_size < (int)sizeof(int) * 4)
            return fail("cv4_hog_detect_people: rects array must be cv_rect");

        int n = (int)rects.size();
        if (n > max_elems) n = max_elems;
        char* base = (char*)pval_rects->pt;
        for (int i = 0; i < n; ++i) {
            int* p = (int*)(base + (size_t)elem_size * i);
            p[0] = rects[i].x;
            p[1] = rects[i].y;
            p[2] = rects[i].width;
            p[3] = rects[i].height;
        }
        HspVarProc* proc = hei->HspFunc_getproc(pval_count->flag);
        proc->Set(pval_count, proc->GetPtr(pval_count), &n);
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_hog_detect_people: unknown"); }
}

// --- QR コー�? ---
//   QRCodeDetector も�?�度生�?�する簡�? API�?

//  cv4_qr_detect rects_array, count_var, img_id
//    QR コードを検�?�。結果の矩形(また�?�外接矩形)�? cv_rect 配�?�に�?
CV4_EXPORT int __stdcall cv4_qr_detect(HSPEXINFO* hei,
                                       PVal* pval_rects, PVal* pval_count, int img_id)
{
    try {
        if (!hei || !pval_rects || !pval_count)
            return fail("cv4_qr_detect: null arg");
        if (pval_count->flag != HSPVAR_FLAG_INT)
            return fail("cv4_qr_detect: count must be int");

        cv::Mat* img = hspcv4::handle_get(img_id);
        if (!img || img->empty()) return fail("cv4_qr_detect: invalid image");

        cv::QRCodeDetector det;
        std::vector<cv::Point> corners;
        bool found = det.detect(*img, corners);

        int max_elems = pval_rects->len[1];
        if (max_elems <= 0) max_elems = 1;
        int elem_size = pval_rects->len[0];
        if (elem_size < (int)sizeof(int) * 4)
            return fail("cv4_qr_detect: rects array must be cv_rect");

        int n = 0;
        if (found && corners.size() >= 4 && max_elems >= 1) {
            cv::Rect br = cv::boundingRect(corners);
            int* p = (int*)pval_rects->pt;
            p[0] = br.x;
            p[1] = br.y;
            p[2] = br.width;
            p[3] = br.height;
            n = 1;
        }
        HspVarProc* proc = hei->HspFunc_getproc(pval_count->flag);
        proc->Set(pval_count, proc->GetPtr(pval_count), &n);
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_qr_detect: unknown"); }
}

//  cv4_qr_decode img_id, refstr_var
//    画像か�? QR コードを検�?�して�?コード。結果�?字�?�を refstr_var に格納�?
//    空�?字�?��?�「検�?�失敗また�?�空の QR」を意味する�?
CV4_EXPORT int __stdcall cv4_qr_decode(HSPEXINFO* hei, int img_id, PVal* pv)
{
    try {
        if (!hei || !pv) return fail("cv4_qr_decode: null arg");
        if (pv->flag != HSPVAR_FLAG_STR) return fail("cv4_qr_decode: var must be str");

        cv::Mat* img = hspcv4::handle_get(img_id);
        if (!img || img->empty()) return fail("cv4_qr_decode: invalid image");

        cv::QRCodeDetector det;
        std::string decoded = det.detectAndDecode(*img);

        HspVarProc* proc = hei->HspFunc_getproc(pv->flag);
        proc->Set(pv, proc->GetPtr(pv), (void*)decoded.c_str());
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_qr_decode: unknown"); }
}

//============================================================================
//  Phase I : QR encode + Barcode detection
//============================================================================

//  cv4_qr_encode dst_id, "text" [, ec_level=1, scale=8, version=0]
//    QR コードを生�?�して dst_id の画像ハンドルに格納�?
//    ec_level: 0=L(7%) 1=M(15%) 2=Q(25%) 3=H(30%)
//    scale   : 1 module を�? pixel で描画する�? (1=最�?)
//    version : 0=自�?  1�?40=固�? (大きいほど多くの�?字が入�?)
//    出�?: BGR 3ch の白背景に黒モジュール�?
CV4_EXPORT int __stdcall cv4_qr_encode(int dst_id, const char* tx,
                                       int ec, int scale, int version)
{
    try {
        if (ec == 0) ec = 1;
        if (scale == 0) scale = 8;
        if (scale < 1)   scale = 1;
        if (scale > 64)  scale = 64;

        cv::QRCodeEncoder::Params params;
        params.version = version;
        switch (ec) {
            case 0: params.correction_level = cv::QRCodeEncoder::CORRECT_LEVEL_L; break;
            case 2: params.correction_level = cv::QRCodeEncoder::CORRECT_LEVEL_Q; break;
            case 3: params.correction_level = cv::QRCodeEncoder::CORRECT_LEVEL_H; break;
            default: params.correction_level = cv::QRCodeEncoder::CORRECT_LEVEL_M; break;
        }

        cv::Ptr<cv::QRCodeEncoder> encoder = cv::QRCodeEncoder::create(params);
        cv::Mat raw;
        encoder->encode(std::string(tx ? tx : ""), raw);
        if (raw.empty()) return fail("cv4_qr_encode: encode failed");

        // raw は CV_8UC1 (0=�?, 255=白)�?HSP 表示のため scale 倍して BGR 化�?
        cv::Mat scaled;
        cv::resize(raw, scaled,
                   cv::Size(raw.cols * scale, raw.rows * scale),
                   0, 0, cv::INTER_NEAREST);
        cv::Mat bgr;
        cv::cvtColor(scaled, bgr, cv::COLOR_GRAY2BGR);

        hspcv4::handle_set(dst_id, std::move(bgr));
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_qr_encode: unknown"); }
}

//  cv4_barcode_detect rects_array, count_var, img_id
//    画像か�? 1D バ�?�コー�? (Code128, EAN-13, EAN-8, UPC-A �?) の位置を検�?��?
//    rects: cv_rect 配�?�、count: 検�?�数
CV4_EXPORT int __stdcall cv4_barcode_detect(HSPEXINFO* hei, PVal* pval_rects,
                                            PVal* pval_count, int img_id)
{
    try {
        if (!hei || !pval_rects || !pval_count)
            return fail("cv4_barcode_detect: null arg");
        if (pval_count->flag != HSPVAR_FLAG_INT)
            return fail("cv4_barcode_detect: count must be int");

        cv::Mat* img = hspcv4::handle_get(img_id);
        if (!img || img->empty()) return fail("cv4_barcode_detect: invalid image");

        int max_elems = pval_rects->len[1];
        if (max_elems <= 0) max_elems = 1;
        int elem_size = pval_rects->len[0];
        if (elem_size < (int)sizeof(int) * 4)
            return fail("cv4_barcode_detect: rects array must be cv_rect");

        cv::barcode::BarcodeDetector det;
        std::vector<cv::Point2f> corners;
        bool found = det.detectMulti(*img, corners);

        int n = 0;
        if (found && !corners.empty()) {
            // 4 点ずつ 1 バ�?�コード�??。boundingRect で外接矩形に変換�?
            int total = (int)(corners.size() / 4);
            int* base = (int*)pval_rects->pt;
            for (int i = 0; i < total && n < max_elems; i++) {
                std::vector<cv::Point2f> quad(corners.begin() + i * 4,
                                              corners.begin() + i * 4 + 4);
                cv::Rect br = cv::boundingRect(quad);
                int* p = base + n * 4;
                p[0] = br.x;
                p[1] = br.y;
                p[2] = br.width;
                p[3] = br.height;
                n++;
            }
        }
        HspVarProc* proc = hei->HspFunc_getproc(pval_count->flag);
        proc->Set(pval_count, proc->GetPtr(pval_count), &n);
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_barcode_detect: unknown"); }
}

//  cv4_barcode_decode img_id, refstr_var
//    画像か�? 1D バ�?�コードを検�?�して�?コード。最初�?�検�?�値�? refstr に書く�?
//    �?数あれば改行で連結。空�?字�?��?�検�?�失敗�?
CV4_EXPORT int __stdcall cv4_barcode_decode(HSPEXINFO* hei, int img_id, PVal* pv)
{
    try {
        if (!hei || !pv) return fail("cv4_barcode_decode: null arg");
        if (pv->flag != HSPVAR_FLAG_STR) return fail("cv4_barcode_decode: var must be str");

        cv::Mat* img = hspcv4::handle_get(img_id);
        if (!img || img->empty()) return fail("cv4_barcode_decode: invalid image");

        cv::barcode::BarcodeDetector det;
        std::vector<cv::String> decoded;
        std::vector<cv::String> types;
        cv::Mat points;
        bool ok = det.detectAndDecodeWithType(*img, decoded, types, points);

        std::string result;
        if (ok && !decoded.empty()) {
            for (size_t i = 0; i < decoded.size(); i++) {
                if (i > 0) result += "\n";
                result += decoded[i];
            }
        }
        HspVarProc* proc = hei->HspFunc_getproc(pv->flag);
        proc->Set(pv, proc->GetPtr(pv), (void*)result.c_str());
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_barcode_decode: unknown"); }
}


//============================================================================
//  Object detection : CascadeClassifier (Haar / LBP)
//
//  cv_rect (HSP 構造�?) レイアウ�?: { int x; int y; int w; int h; } (16 bytes)
//  HSP 側で stdim rects, cv_rect, N として確保した�?��?�に検�?�結果を書き込む�?
//============================================================================

// cv4_cascade_load cid, "xmlpath"
CV4_EXPORT int __stdcall cv4_cascade_load(int cid, const char* f)
{
    try {
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
CV4_EXPORT int __stdcall cv4_cascade_free(int cid)
{
    hspcv4::cascade_free(cid);
    return 0;
}

// cv4_detect cid, img_id, rects_array, count_var [, scale=1.1] [, min_neighbors=3]
//   rects_array : HSP 側で stdim で確保し�? cv_rect 構造体�?��??
//   count_var   : int 変数。検�?�数を格�? (配�?�サイズで打ち�?�?)
CV4_EXPORT int __stdcall cv4_detect(HSPEXINFO* hei, int cid, int img_id,
                                    PVal* pval_rects, int* out_count,
                                    double scale, int min_neighbors)
{
    try {
        if (!pval_rects) return fail("cv4_detect: null rects");
        if (!out_count)  return fail("cv4_detect: null count var");

        cv::CascadeClassifier* cc = hspcv4::cascade_get(cid);
        if (!cc || cc->empty()) return fail("cv4_detect: invalid cascade");

        cv::Mat* img = hspcv4::handle_get(img_id);
        if (!img || img->empty()) return fail("cv4_detect: invalid image");

        // 入力をグレー�? (detectMultiScale の推奨)
        cv::Mat gray;
        if (img->channels() == 1) {
            gray = *img;
        } else {
            cv::cvtColor(as_bgr(*img), gray, cv::COLOR_BGR2GRAY);
        }
        cv::equalizeHist(gray, gray);

        std::vector<cv::Rect> faces;
        cc->detectMultiScale(gray, faces, scale, min_neighbors,
                             0, cv::Size(30, 30));

        // rects 配�?�に書き込む。�?��?��?�最大要素数 = pval_rects->len[1]
        // 要素サイズは cv_rect 構造�? (16 bytes) だが、pval->len[0] �?
        // NSTRUCT の要素サイズを持って�?る�?
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

        // count_var に検�?�数を格�?
        *out_count = n;

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
//  メ�?セージポンプと競合して SEH クラ�?シュを起こす (Phase 1 で確認済み)�?
//  代わりに OpenCV 4.x で追加され�? cv::pollKey() を使ってノンブロ�?キング
//  に問い合わせし、HSP 側の処�?を阻害しな�?形で実�?する�?
//============================================================================

//  cv4_show id, "window_name"
//    OpenCV ウィンドウに画像を表示 (非ブロ�?キング)�?
//    ウィンドウが無ければ namedWindow で作�?��?
CV4_EXPORT int __stdcall cv4_show(int id, const char* w)
{
    try {
        const char* wn = (w && *w) ? w : "hspcv4";
        cv::Mat* m = hspcv4::handle_get(id);
        if (!m || m->empty()) return fail("cv4_show: invalid handle");
        cv::namedWindow(wn, cv::WINDOW_AUTOSIZE);
        cv::imshow(wn, *m);
        cv::pollKey();   // 1 回�?�ンプしてウィンドウを可視化
        return 0;
    } catch (const cv::Exception& e) {
        return fail(e.what());
    } catch (...) {
        return fail("cv4_show: unknown exception");
    }
}

//  cv4_wait_key var_key, ms
//    タイムアウト付きキー�?ち�?
//    var_key にキーコードを格�? (押されなければ -1)�?
//    stat = 0  : キーが押され�? (var_key は有効)
//    stat = -1 : タイムアウ�? (var_key = -1)
//    ms=0 は「押されるまで�?つ�?(10ms ポ�?�リング)
//
//  OLDDLL 符号反転の制�? (return 値に正の整数を使えな�?) を避けるため�?
//  キーコード�?� return 値ではな�? var 引数で返す設計にして�?る�?
CV4_EXPORT int __stdcall cv4_wait_key(HSPEXINFO* hei, PVal* pval, int ms)
{
    try {
        if (!hei || !pval) return fail("cv4_wait_key: null arg");
        if (pval->flag != HSPVAR_FLAG_INT) {
            return fail("cv4_wait_key: var_key must be int");
        }
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

        // var_key に結果を格�?
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
//    �?�? OpenCV ウィンドウを閉じる�?
CV4_EXPORT int __stdcall cv4_close_window(const char* w)
{
    try {
        cv::destroyWindow((w && *w) ? w : "hspcv4");
        cv::pollKey();  // 閉じる�?��?を�?�ン�?
        return 0;
    } catch (const cv::Exception& e) {
        return fail(e.what());
    } catch (...) {
        return fail("cv4_close_window: unknown exception");
    }
}

//  cv4_close_all
//    全 OpenCV ウィンドウを閉じる�?
CV4_EXPORT int __stdcall cv4_close_all(void)
{
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
CV4_EXPORT int __stdcall cv4flip(int dst_id, int src_id, int code)
{
    try {
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
//    angle は度単�? (反時計回�?)、中�?は画像中央。�?�力サイズは入力と同じ�?
CV4_EXPORT int __stdcall cv4rotate(int dst_id, int src_id, double angle, double scale)
{
    if (scale == 0.0) scale = 1.0;
    try {
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
//    ROI クロ�?プ。�?囲外だとエラー�?
CV4_EXPORT int __stdcall cv4crop(int dst_id, int src_id, int x, int y, int w, int h)
{
    try {
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
//    2x3 アフィン行�?�を直接�?定して warpAffine�?
//    行�?��?�要素は double�?HSP 側では int リ�?ラルでも�?�動で double 解釈される�?
CV4_EXPORT int __stdcall cv4warp(int dst_id, int src_id,
                                 double m00, double m01, double m02,
                                 double m10, double m11, double m12,
                                 int ow, int oh)
{
    try {
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
//  Calib3D : homography / perspective / camera calibration helpers
//
//  点�?合�?� HSP の cv_rect 配�?? (stdim rects, cv_rect, N) の x/y フィール�?
//  を流用したり、N x 2 の CV_32F Mat で受け取ったりする設計。ここでは
//  直接点を受け取る�?�は煩雑なので�?2 つのキーポイント集合と BFMatch 結果
//  を�?�力として受けて findHomography を呼ぶ API にする�?
//============================================================================

//  cv4_find_homography h_mat_id, kp1_id, kp2_id, match_id [, ransac_thresh=3.0]
//    match から対応点ペアを取り�?��? findHomography を呼ぶ�?
//    出力�?� 3x3 CV_64F Mat�?
CV4_EXPORT int __stdcall cv4_find_homography(int h_id, int kp1_id, int kp2_id,
                                              int m_id, double rth)
{
    try {
        if (rth == 0.0) rth = 3.0;  // 省略時�?��?フォル�?
        auto* kp1 = hspcv4::kps_get(kp1_id);
        auto* kp2 = hspcv4::kps_get(kp2_id);
        auto* ms  = hspcv4::matches_get(m_id);
        if (!kp1 || !kp2 || !ms) return fail("cv4_find_homography: invalid kp/match");
        std::vector<cv::Point2f> p1v, p2v;
        for (auto& m : *ms) {
            if (m.queryIdx >= 0 && m.queryIdx < (int)kp1->size() &&
                m.trainIdx >= 0 && m.trainIdx < (int)kp2->size())
            {
                p1v.push_back((*kp1)[m.queryIdx].pt);
                p2v.push_back((*kp2)[m.trainIdx].pt);
            }
        }
        if (p1v.size() < 4) return fail("cv4_find_homography: need at least 4 pairs");
        cv::Mat H = cv::findHomography(p1v, p2v, cv::RANSAC, rth);
        if (H.empty()) return fail("cv4_find_homography: no homography found");
        hspcv4::handle_set(h_id, std::move(H));
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_find_homography: unknown"); }
}

//  cv4_warp_perspective dst, src, h_mat_id, out_w, out_h
CV4_EXPORT int __stdcall cv4_warp_perspective(int dst_id, int src_id, int h_id,
                                               int ow, int oh)
{
    try {
        cv::Mat* src = hspcv4::handle_get(src_id);
        cv::Mat* H   = hspcv4::handle_get(h_id);
        if (!src || src->empty()) return fail("cv4_warp_perspective: invalid source");
        if (!H || H->empty()) return fail("cv4_warp_perspective: invalid H");
        cv::Mat out;
        cv::warpPerspective(*src, out, *H, cv::Size(ow, oh));
        hspcv4::handle_set(dst_id, std::move(out));
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_warp_perspective: unknown"); }
}

//  cv4_get_perspective_transform h_mat_id, sx1,sy1, sx2,sy2, sx3,sy3, sx4,sy4, dx1,dy1, dx2,dy2, dx3,dy3, dx4,dy4
//    4 対のソース頂点と先頂点から 3x3 透視変換行�?�を作�??
CV4_EXPORT int __stdcall cv4_get_perspective_transform(int h_id,
    int sx1, int sy1, int sx2, int sy2, int sx3, int sy3, int sx4, int sy4,
    int dx1, int dy1, int dx2, int dy2, int dx3, int dy3, int dx4, int dy4)
{
    try {
        cv::Point2f src_pts[4] = {
            { (float)sx1, (float)sy1 }, { (float)sx2, (float)sy2 },
            { (float)sx3, (float)sy3 }, { (float)sx4, (float)sy4 }
        };
        cv::Point2f dst_pts[4] = {
            { (float)dx1, (float)dy1 }, { (float)dx2, (float)dy2 },
            { (float)dx3, (float)dy3 }, { (float)dx4, (float)dy4 }
        };
        cv::Mat H = cv::getPerspectiveTransform(src_pts, dst_pts);
        hspcv4::handle_set(h_id, std::move(H));
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_get_perspective_transform: unknown"); }
}

//  cv4_get_affine_transform m_mat_id, sx1,sy1, sx2,sy2, sx3,sy3, dx1,dy1, dx2,dy2, dx3,dy3
//    3 対のソース/先頂点から 2x3 アフィン変換行�?�を作�??
CV4_EXPORT int __stdcall cv4_get_affine_transform(int m_id,
    int sx1, int sy1, int sx2, int sy2, int sx3, int sy3,
    int dx1, int dy1, int dx2, int dy2, int dx3, int dy3)
{
    try {
        cv::Point2f src_pts[3] = {
            { (float)sx1, (float)sy1 }, { (float)sx2, (float)sy2 }, { (float)sx3, (float)sy3 }
        };
        cv::Point2f dst_pts[3] = {
            { (float)dx1, (float)dy1 }, { (float)dx2, (float)dy2 }, { (float)dx3, (float)dy3 }
        };
        cv::Mat M = cv::getAffineTransform(src_pts, dst_pts);
        hspcv4::handle_set(m_id, std::move(M));
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_get_affine_transform: unknown"); }
}

//  cv4_warp_perspective_mat dst, src, m_id, out_w, out_h
//    既�? cv4_warp_perspective と同等だが汎用 Mat を受け取る版 (上と同じ)
//    (alias、削除してもよ�?)


//============================================================================
//  ML module (Phase 18): SVM / KNN / RTrees / ANN_MLP
//
//  ハンドル�?: cv::Ptr<cv::ml::StatModel>
//  すべてのアルゴリズムは StatModel 派生なので、�?�通�?� train/predict/
//  save/load �? 1 セ�?ト用意するだけで全アルゴ対応できる�?
//============================================================================

// アルゴリズム種別 (cv4_ml_load の第3引数)
//   0=SVM, 1=KNN, 2=RTrees, 3=ANN_MLP, 4=Boost, 5=DTrees,
//   6=NormalBayes, 7=EM, 8=LogisticRegression
enum {
    CV4_ML_SVM = 0,
    CV4_ML_KNN = 1,
    CV4_ML_RTREES = 2,
    CV4_ML_ANN_MLP = 3,
    CV4_ML_BOOST = 4,
    CV4_ML_DTREES = 5,
    CV4_ML_NORMAL_BAYES = 6,
    CV4_ML_EM = 7,
    CV4_ML_LOGISTIC = 8,
};

//  cv4_ml_svm_create model_id, type, kernel, c, gamma
CV4_EXPORT int __stdcall cv4_ml_svm_create(int model_id, int type, int kernel,
                                           double c, double gamma)
{
    try {
        cv::Ptr<cv::ml::SVM> svm = cv::ml::SVM::create();
        svm->setType(type);
        svm->setKernel(kernel);
        svm->setC(c);
        svm->setGamma(gamma);
        cv::Ptr<cv::ml::StatModel> model = svm;
        hspcv4::ml_model_set(model_id, model);
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_ml_svm_create: unknown"); }
}

//  cv4_ml_knn_create model_id, k
CV4_EXPORT int __stdcall cv4_ml_knn_create(int model_id, int k)
{
    try {
        cv::Ptr<cv::ml::KNearest> knn = cv::ml::KNearest::create();
        knn->setDefaultK(k);
        cv::Ptr<cv::ml::StatModel> model = knn;
        hspcv4::ml_model_set(model_id, model);
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_ml_knn_create: unknown"); }
}

//  cv4_ml_rtrees_create model_id, max_depth, min_sample_count
CV4_EXPORT int __stdcall cv4_ml_rtrees_create(int model_id, int max_d, int min_s)
{
    try {
        cv::Ptr<cv::ml::RTrees> rt = cv::ml::RTrees::create();
        rt->setMaxDepth(max_d);
        rt->setMinSampleCount(min_s);
        cv::Ptr<cv::ml::StatModel> model = rt;
        hspcv4::ml_model_set(model_id, model);
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_ml_rtrees_create: unknown"); }
}

//  cv4_ml_ann_create model_id, layer_sizes_mat_id
//    layer_sizes_mat: �?レイヤの neuron 数を含む int 配�?? (Mat、CV_32S, 1xN)
//                     �?: 3 入�? / 5 中�? / 2 出�? �? [3,5,2]
CV4_EXPORT int __stdcall cv4_ml_ann_create(int model_id, int layers_id)
{
    try {
        cv::Mat* layers = hspcv4::handle_get(layers_id);
        if (!layers || layers->empty())
            return fail("cv4_ml_ann_create: invalid layer sizes");
        cv::Ptr<cv::ml::ANN_MLP> ann = cv::ml::ANN_MLP::create();
        ann->setLayerSizes(*layers);
        ann->setActivationFunction(cv::ml::ANN_MLP::SIGMOID_SYM);
        ann->setTrainMethod(cv::ml::ANN_MLP::BACKPROP);
        ann->setBackpropMomentumScale(0.1);
        ann->setBackpropWeightScale(0.1);
        ann->setTermCriteria(cv::TermCriteria(
            cv::TermCriteria::MAX_ITER + cv::TermCriteria::EPS, 300, 0.01));
        cv::Ptr<cv::ml::StatModel> model = ann;
        hspcv4::ml_model_set(model_id, model);
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_ml_ann_create: unknown"); }
}

//  cv4_ml_train model_id, samples_id, layout, responses_id
//    layout: 0=ROW_SAMPLE, 1=COL_SAMPLE
//    samples / responses は CV_32F の Mat
CV4_EXPORT int __stdcall cv4_ml_train(int model_id, int samples_id, int layout, int resp_id)
{
    try {
        auto* mp = hspcv4::ml_model_get(model_id);
        if (!mp || mp->empty()) return fail("cv4_ml_train: invalid model");
        cv::Mat* samples = hspcv4::handle_get(samples_id);
        cv::Mat* resp    = hspcv4::handle_get(resp_id);
        if (!samples || samples->empty()) return fail("cv4_ml_train: invalid samples");
        if (!resp || resp->empty()) return fail("cv4_ml_train: invalid responses");
        bool ok = (*mp)->train(*samples, layout, *resp);
        if (!ok) return fail("cv4_ml_train: train returned false");
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_ml_train: unknown"); }
}

//  cv4_ml_predict model_id, samples_id, results_id, flags
CV4_EXPORT int __stdcall cv4_ml_predict(int model_id, int samples_id, int results_id, int flags)
{
    try {
        auto* mp = hspcv4::ml_model_get(model_id);
        if (!mp || mp->empty()) return fail("cv4_ml_predict: invalid model");
        cv::Mat* samples = hspcv4::handle_get(samples_id);
        if (!samples || samples->empty()) return fail("cv4_ml_predict: invalid samples");
        cv::Mat results;
        (*mp)->predict(*samples, results, flags);
        hspcv4::handle_set(results_id, std::move(results));
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_ml_predict: unknown"); }
}

//  cv4_ml_save model_id, "path.xml"
CV4_EXPORT int __stdcall cv4_ml_save(int model_id, const char* p)
{
    try {
        auto* mp = hspcv4::ml_model_get(model_id);
        if (!mp || mp->empty()) return fail("cv4_ml_save: invalid model");
        if (!p) return fail("cv4_ml_save: null path");
        (*mp)->save(p);
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_ml_save: unknown"); }
}

//  cv4_ml_load model_id, "path.xml", algo_type
//    algo_type: CV4_ML_SVM/KNN/RTREES/ANN_MLP/...
CV4_EXPORT int __stdcall cv4_ml_load(int model_id, const char* p, int algo)
{
    try {
        if (!p) return fail("cv4_ml_load: null path");
        cv::Ptr<cv::ml::StatModel> model;
        switch (algo) {
        case CV4_ML_SVM:    model = cv::ml::SVM::load(p); break;
        case CV4_ML_KNN:    model = cv::Algorithm::load<cv::ml::KNearest>(p); break;
        case CV4_ML_RTREES: model = cv::ml::RTrees::load(p); break;
        case CV4_ML_ANN_MLP: model = cv::ml::ANN_MLP::load(p); break;
        case CV4_ML_BOOST:  model = cv::ml::Boost::load(p); break;
        case CV4_ML_DTREES: model = cv::ml::DTrees::load(p); break;
        case CV4_ML_NORMAL_BAYES:
            model = cv::Algorithm::load<cv::ml::NormalBayesClassifier>(p); break;
        case CV4_ML_EM:     model = cv::ml::EM::load(p); break;
        case CV4_ML_LOGISTIC:
            model = cv::Algorithm::load<cv::ml::LogisticRegression>(p); break;
        default: return fail("cv4_ml_load: unknown algo type");
        }
        if (model.empty()) return fail("cv4_ml_load: load returned empty");
        hspcv4::ml_model_set(model_id, model);
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_ml_load: unknown"); }
}

//  cv4_ml_free model_id
CV4_EXPORT int __stdcall cv4_ml_free(int model_id)
{
    hspcv4::ml_model_free(model_id);
    return 0;
}


//============================================================================
//  Face module (Phase 19): LBPH / Eigen / Fisher + FacemarkLBF / Kazemi
//
//  cv::face::FaceRecognizer は cv::Algorithm 派生で、train/predict/save/load
//  を�?�通インターフェースで提供する�?
//  cv::face::Facemark は loadModel + fit (顔ランド�?��?�ク検�?�) を提供する�?
//============================================================================

// FaceRecognizer の種�? (cv4_face_load の第3引数)
enum {
    CV4_FACE_LBPH = 0,
    CV4_FACE_EIGEN = 1,
    CV4_FACE_FISHER = 2,
};

// Facemark の種�? (cv4_facemark_create の第2引数)
enum {
    CV4_FACEMARK_LBF = 0,
    CV4_FACEMARK_KAZEMI = 1,
};

//  cv4_face_lbph_create model_id, radius, neighbors, grid_x, grid_y
CV4_EXPORT int __stdcall cv4_face_lbph_create(int model_id, int radius, int neigh, int gx, int gy)
{
    try {
        cv::Ptr<cv::face::FaceRecognizer> r =
            cv::face::LBPHFaceRecognizer::create(radius, neigh, gx, gy);
        hspcv4::face_recognizer_set(model_id, r);
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_face_lbph_create: unknown"); }
}

//  cv4_face_eigen_create model_id, num_components
CV4_EXPORT int __stdcall cv4_face_eigen_create(int model_id, int n)
{
    try {
        cv::Ptr<cv::face::FaceRecognizer> r =
            cv::face::EigenFaceRecognizer::create(n);
        hspcv4::face_recognizer_set(model_id, r);
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_face_eigen_create: unknown"); }
}

//  cv4_face_fisher_create model_id, num_components
CV4_EXPORT int __stdcall cv4_face_fisher_create(int model_id, int n)
{
    try {
        cv::Ptr<cv::face::FaceRecognizer> r =
            cv::face::FisherFaceRecognizer::create(n);
        hspcv4::face_recognizer_set(model_id, r);
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_face_fisher_create: unknown"); }
}

//  cv4_face_predict model_id, src_mat_id, var_label, var_confidence
//    予測結果のラベル(int)と確信度/距離(double)を�?�力変数に書き戻す�?
CV4_EXPORT int __stdcall cv4_face_predict(HSPEXINFO* hei, int model_id, int src_id,
                                          int* out_label, PVal* pval_conf)
{
    try {
        if (!out_label) return fail("cv4_face_predict: null label var");
        if (!pval_conf) return fail("cv4_face_predict: null conf var");
        if (pval_conf->flag != HSPVAR_FLAG_DOUBLE)
            return fail("cv4_face_predict: var_confidence must be double");
        auto* rp = hspcv4::face_recognizer_get(model_id);
        if (!rp || rp->empty()) return fail("cv4_face_predict: invalid model");
        cv::Mat* src = hspcv4::handle_get(src_id);
        if (!src || src->empty()) return fail("cv4_face_predict: invalid src");
        int label = -1;
        double conf = 0.0;
        (*rp)->predict(*src, label, conf);
        *out_label = label;
        HspVarProc* procD = hei->HspFunc_getproc(HSPVAR_FLAG_DOUBLE);
        procD->Set(pval_conf, procD->GetPtr(pval_conf), &conf);
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_face_predict: unknown"); }
}

//  cv4_face_save model_id, "path.xml"
CV4_EXPORT int __stdcall cv4_face_save(int model_id, const char* p)
{
    try {
        auto* rp = hspcv4::face_recognizer_get(model_id);
        if (!rp || rp->empty()) return fail("cv4_face_save: invalid model");
        if (!p) return fail("cv4_face_save: null path");
        (*rp)->write(p);
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_face_save: unknown"); }
}

//  cv4_face_load model_id, "path.xml", type
//    type: CV4_FACE_LBPH/EIGEN/FISHER
CV4_EXPORT int __stdcall cv4_face_load(int model_id, const char* p, int type)
{
    try {
        if (!p) return fail("cv4_face_load: null path");
        cv::Ptr<cv::face::FaceRecognizer> r;
        switch (type) {
        case CV4_FACE_LBPH:   r = cv::face::LBPHFaceRecognizer::create(); break;
        case CV4_FACE_EIGEN:  r = cv::face::EigenFaceRecognizer::create(); break;
        case CV4_FACE_FISHER: r = cv::face::FisherFaceRecognizer::create(); break;
        default: return fail("cv4_face_load: unknown type");
        }
        r->read(p);
        hspcv4::face_recognizer_set(model_id, r);
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_face_load: unknown"); }
}

//  cv4_face_free model_id
CV4_EXPORT int __stdcall cv4_face_free(int model_id)
{
    hspcv4::face_recognizer_free(model_id);
    return 0;
}

//  cv4_facemark_create model_id, type
//    type: CV4_FACEMARK_LBF / CV4_FACEMARK_KAZEMI
CV4_EXPORT int __stdcall cv4_facemark_create(int model_id, int type)
{
    try {
        cv::Ptr<cv::face::Facemark> fm;
        switch (type) {
        case CV4_FACEMARK_LBF: {
            cv::face::FacemarkLBF::Params params;
            fm = cv::face::FacemarkLBF::create(params);
            break;
        }
        case CV4_FACEMARK_KAZEMI: {
            cv::face::FacemarkKazemi::Params params;
            fm = cv::face::FacemarkKazemi::create(params);
            break;
        }
        default: return fail("cv4_facemark_create: unknown type");
        }
        if (fm.empty()) return fail("cv4_facemark_create: create returned empty");
        hspcv4::facemark_set(model_id, fm);
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_facemark_create: unknown"); }
}

//  cv4_facemark_load model_id, "model.bin"
CV4_EXPORT int __stdcall cv4_facemark_load(int model_id, const char* p)
{
    try {
        auto* fp = hspcv4::facemark_get(model_id);
        if (!fp || fp->empty()) return fail("cv4_facemark_load: invalid facemark");
        if (!p) return fail("cv4_facemark_load: null path");
        (*fp)->loadModel(p);
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_facemark_load: unknown"); }
}

//  cv4_facemark_free model_id
CV4_EXPORT int __stdcall cv4_facemark_free(int model_id)
{
    hspcv4::facemark_free(model_id);
    return 0;
}


//============================================================================
//  Imgproc extras (Phase 20): watershed / grabCut / applyColorMap /
//                             distanceTransform / connectedComponents
//============================================================================

//  cv4_apply_color_map dst, src, colormap
//    colormap: cv::COLORMAP_* (0=AUTUMN, 2=JET, 11=HOT, 16=TWILIGHT, ...)
CV4_EXPORT int __stdcall cv4_apply_color_map(int dst_id, int src_id, int cmap)
{
    try {
        cv::Mat* src = hspcv4::handle_get(src_id);
        if (!src || src->empty()) return fail("cv4_apply_color_map: invalid src");
        cv::Mat dst;
        cv::applyColorMap(*src, dst, cmap);
        hspcv4::handle_set(dst_id, std::move(dst));
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_apply_color_map: unknown"); }
}

//  cv4_watershed markers, src
//    src は CV_8UC3, markers は呼び出し前に CV_32SC1 で seed が打たれて�?ること
//    (in/out: markers が直接書き換えられる)
CV4_EXPORT int __stdcall cv4_watershed(int markers_id, int src_id)
{
    try {
        cv::Mat* markers = hspcv4::handle_get(markers_id);
        cv::Mat* src     = hspcv4::handle_get(src_id);
        if (!markers || markers->empty()) return fail("cv4_watershed: invalid markers");
        if (!src || src->empty()) return fail("cv4_watershed: invalid src");
        cv::watershed(*src, *markers);
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_watershed: unknown"); }
}

//  cv4_grab_cut mask, src, x, y, w, h, iters [, mode=GC_INIT_WITH_RECT(0)]
//    mask は出�? (CV_8UC1)。bgdModel/fgdModel は�?部で確保�?
CV4_EXPORT int __stdcall cv4_grab_cut(int mask_id, int src_id, int x, int y,
                                      int w, int h, int iters, int mode)
{
    try {
        if (iters == 0) iters = 5;
        cv::Mat* src = hspcv4::handle_get(src_id);
        if (!src || src->empty()) return fail("cv4_grab_cut: invalid src");
        cv::Mat mask = cv::Mat::zeros(src->size(), CV_8UC1);
        cv::Mat bgd, fgd;
        cv::Rect rect(x, y, w, h);
        cv::grabCut(*src, mask, rect, bgd, fgd, iters, mode);
        hspcv4::handle_set(mask_id, std::move(mask));
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_grab_cut: unknown"); }
}

//  cv4_connected_components labels, src, var_count [, connectivity=8]
//    var_count に検�?�ラベル数 (背景含む) を書き戻す�?
CV4_EXPORT int __stdcall cv4_connected_components(HSPEXINFO* hei, int dst_id,
                                                  int src_id, PVal* pv, int conn)
{
    try {
        if (!hei || !pv) return fail("cv4_connected_components: null arg");
        if (pv->flag != HSPVAR_FLAG_INT)
            return fail("cv4_connected_components: var_count must be int");
        if (conn == 0) conn = 8;
        cv::Mat* src = hspcv4::handle_get(src_id);
        if (!src || src->empty()) return fail("cv4_connected_components: invalid src");
        cv::Mat labels;
        int n = cv::connectedComponents(*src, labels, conn, CV_32S);
        hspcv4::handle_set(dst_id, std::move(labels));
        HspVarProc* proc = hei->HspFunc_getproc(HSPVAR_FLAG_INT);
        proc->Set(pv, proc->GetPtr(pv), &n);
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_connected_components: unknown"); }
}

//============================================================================
//  highgui Trackbar / mouse (Phase 27 follow)
//
//  HSP は直接 C コールバックを渡せな�?ので、�?��?�リング方式で実�?する�?
//  Trackbar はコールバックなしで作り、cv4_get_trackbar_pos で値を取得�?
//  Mouse は�?部 callback で最後�?�イベントを保存し、cv4_get_mouse_event
//  で読み出す方式�?
//============================================================================

namespace {
struct MouseState {
    int event = 0;
    int x = 0;
    int y = 0;
    int flags = 0;
};
std::unordered_map<std::string, MouseState> g_mouse_states;
std::mutex g_mouse_mutex;

void cv4_mouse_callback(int event, int x, int y, int flags, void* userdata)
{
    const char* winname = static_cast<const char*>(userdata);
    if (!winname) return;
    std::lock_guard<std::mutex> lock(g_mouse_mutex);
    auto& s = g_mouse_states[winname];
    s.event = event;
    s.x = x;
    s.y = y;
    s.flags = flags;
}
} // anonymous namespace

//  cv4_create_trackbar "winname", "trackbar", initial, max
CV4_EXPORT int __stdcall cv4_create_trackbar(const char* win, const char* tb,
                                             int init, int maxv)
{
    try {
        if (!win || !tb) return fail("cv4_create_trackbar: null name");
        // ポインタ更新先がな�?場合�?� nullptr を渡す。後で getTrackbarPos で読む�?
        cv::createTrackbar(tb, win, nullptr, maxv);
        cv::setTrackbarPos(tb, win, init);
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_create_trackbar: unknown"); }
}

//  cv4_get_trackbar_pos var_pos, "winname", "trackbar"
CV4_EXPORT int __stdcall cv4_get_trackbar_pos(HSPEXINFO* hei, PVal* pv,
                                              const char* win, const char* tb)
{
    try {
        if (!hei || !pv) return fail("cv4_get_trackbar_pos: null arg");
        if (pv->flag != HSPVAR_FLAG_INT)
            return fail("cv4_get_trackbar_pos: var_pos must be int");
        if (!win || !tb) return fail("cv4_get_trackbar_pos: null name");
        int pos = cv::getTrackbarPos(tb, win);
        HspVarProc* proc = hei->HspFunc_getproc(HSPVAR_FLAG_INT);
        proc->Set(pv, proc->GetPtr(pv), &pos);
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_get_trackbar_pos: unknown"); }
}

//  cv4_set_mouse_listener "winname"
//    �?部 callback を登録し、その�? cv4_get_mouse_event で最新イベントを取得可能�?
CV4_EXPORT int __stdcall cv4_set_mouse_listener(const char* win)
{
    try {
        if (!win) return fail("cv4_set_mouse_listener: null winname");
        {
            std::lock_guard<std::mutex> lock(g_mouse_mutex);
            g_mouse_states[win] = MouseState{};
        }
        // userdata は static string にしな�?と寿命問題があるため、map のキーを使�?
        static std::unordered_map<std::string, std::string> name_storage;
        auto& stored = name_storage[win];
        stored = win;
        cv::setMouseCallback(win, cv4_mouse_callback,
                             static_cast<void*>(const_cast<char*>(stored.c_str())));
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_set_mouse_listener: unknown"); }
}

//  cv4_get_mouse_event var_event, var_x, var_y, var_flags, "winname"
//    var を�?�に並べることで HSP の OLDDLL パラメータ消費�?を安定させる
CV4_EXPORT int __stdcall cv4_get_mouse_event(HSPEXINFO* hei, PVal* pv_e, PVal* pv_x,
                                             PVal* pv_y, PVal* pv_f, const char* win)
{
    try {
        if (!hei || !pv_e || !pv_x || !pv_y || !pv_f)
            return fail("cv4_get_mouse_event: null arg");
        if (pv_e->flag != HSPVAR_FLAG_INT) return fail("cv4_get_mouse_event: var_event must be int");
        if (pv_x->flag != HSPVAR_FLAG_INT) return fail("cv4_get_mouse_event: var_x must be int");
        if (pv_y->flag != HSPVAR_FLAG_INT) return fail("cv4_get_mouse_event: var_y must be int");
        if (pv_f->flag != HSPVAR_FLAG_INT) return fail("cv4_get_mouse_event: var_flags must be int");
        if (!win) return fail("cv4_get_mouse_event: null winname");

        MouseState s;
        {
            std::lock_guard<std::mutex> lock(g_mouse_mutex);
            auto it = g_mouse_states.find(win);
            if (it != g_mouse_states.end()) s = it->second;
        }
        HspVarProc* proc = hei->HspFunc_getproc(HSPVAR_FLAG_INT);
        proc->Set(pv_e, proc->GetPtr(pv_e), &s.event);
        proc->Set(pv_x, proc->GetPtr(pv_x), &s.x);
        proc->Set(pv_y, proc->GetPtr(pv_y), &s.y);
        proc->Set(pv_f, proc->GetPtr(pv_f), &s.flags);
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_get_mouse_event: unknown"); }
}


//============================================================================
//  Saliency / text (Phase 25 follow)
//============================================================================

//  cv4_saliency_spectral dst, src
//    Spectral Residual saliency map (CV_32F, 0..1)
CV4_EXPORT int __stdcall cv4_saliency_spectral(int dst_id, int src_id)
{
    try {
        cv::Mat* src = hspcv4::handle_get(src_id);
        if (!src || src->empty()) return fail("cv4_saliency_spectral: invalid src");
        auto sal = cv::saliency::StaticSaliencySpectralResidual::create();
        cv::Mat sal_map;
        if (!sal->computeSaliency(*src, sal_map))
            return fail("cv4_saliency_spectral: compute failed");
        hspcv4::handle_set(dst_id, std::move(sal_map));
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_saliency_spectral: unknown"); }
}

//  cv4_saliency_fine dst, src
//    Fine-Grained saliency map (CV_8U)
CV4_EXPORT int __stdcall cv4_saliency_fine(int dst_id, int src_id)
{
    try {
        cv::Mat* src = hspcv4::handle_get(src_id);
        if (!src || src->empty()) return fail("cv4_saliency_fine: invalid src");
        auto sal = cv::saliency::StaticSaliencyFineGrained::create();
        cv::Mat sal_map;
        if (!sal->computeSaliency(*src, sal_map))
            return fail("cv4_saliency_fine: compute failed");
        hspcv4::handle_set(dst_id, std::move(sal_map));
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_saliency_fine: unknown"); }
}

//  cv4_text_detect_swt rects_count_var, rects_mat_id, src_id [, dark_on_light=1]
//    Stroke Width Transform �?字検�?�。検�?�矩形数�? var に、Nx4 (x,y,w,h)
//    int Mat �? rects_mat に書き戻す。Tesseract 等�?� OCR 依存なしで使える�?
CV4_EXPORT int __stdcall cv4_text_detect_swt(HSPEXINFO* hei, PVal* pv,
                                             int dst_id, int src_id, int dark_on_light)
{
    try {
        if (!hei || !pv) return fail("cv4_text_detect_swt: null arg");
        if (pv->flag != HSPVAR_FLAG_INT)
            return fail("cv4_text_detect_swt: var_count must be int");
        if (dark_on_light == 0) dark_on_light = 1;
        cv::Mat* src = hspcv4::handle_get(src_id);
        if (!src || src->empty()) return fail("cv4_text_detect_swt: invalid src");
        std::vector<cv::Rect> rects;
        cv::Mat draw, chains;
        cv::text::detectTextSWT(*src, rects, dark_on_light != 0, draw, chains);
        cv::Mat out((int)rects.size(), 4, CV_32S);
        for (size_t i = 0; i < rects.size(); ++i) {
            out.at<int>((int)i, 0) = rects[i].x;
            out.at<int>((int)i, 1) = rects[i].y;
            out.at<int>((int)i, 2) = rects[i].width;
            out.at<int>((int)i, 3) = rects[i].height;
        }
        hspcv4::handle_set(dst_id, std::move(out));
        int n = (int)rects.size();
        HspVarProc* proc = hei->HspFunc_getproc(HSPVAR_FLAG_INT);
        proc->Set(pv, proc->GetPtr(pv), &n);
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_text_detect_swt: unknown"); }
}


//============================================================================
//  FreeType (Phase 22 follow): TTF/OTF フォントで日本語を含む�?字�?�を描画
//============================================================================

//  cv4_freetype_create ft_id, "font_path.ttf"
CV4_EXPORT int __stdcall cv4_freetype_create(int ft_id, const char* font_path)
{
    try {
        if (!font_path) return fail("cv4_freetype_create: null font path");
        cv::Ptr<cv::freetype::FreeType2> ft = cv::freetype::createFreeType2();
        ft->loadFontData(font_path, 0);
        hspcv4::freetype_set(ft_id, ft);
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_freetype_create: unknown"); }
}

//  cv4_freetype_put_text ft_id, dst_id, "text(UTF-8)", x, y, font_height
//                         [, b=255] [, g=255] [, r=255]
//                         [, thickness=-1] [, line_type=16(LINE_AA)]
CV4_EXPORT int __stdcall cv4_freetype_put_text(int ft_id, int dst_id, const char* text,
                                               int x, int y, int height,
                                               int b, int g, int r,
                                               int thick, int ltype)
{
    try {
        if (b == 0) b = 255;
        if (g == 0) g = 255;
        if (r == 0) r = 255;
        if (thick == 0) thick = -1;
        if (ltype == 0) ltype = cv::LINE_AA;
        auto* fp = hspcv4::freetype_get(ft_id);
        if (!fp || fp->empty()) return fail("cv4_freetype_put_text: invalid ft");
        if (!text) return fail("cv4_freetype_put_text: null text");
        cv::Mat* dst = hspcv4::handle_get(dst_id);
        if (!dst || dst->empty()) return fail("cv4_freetype_put_text: invalid dst");
        (*fp)->putText(*dst, text, cv::Point(x, y), height,
                       cv::Scalar(b, g, r), thick, ltype, true);
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_freetype_put_text: unknown"); }
}

//  cv4_freetype_free ft_id
CV4_EXPORT int __stdcall cv4_freetype_free(int ft_id)
{
    hspcv4::freetype_free(ft_id);
    return 0;
}


//============================================================================
//  Tesseract OCR (Phase 25 follow-2): cv::text::OCRTesseract
//
//  事前準備:
//    1) tessdata フォルダを用�? (eng.traineddata, jpn.traineddata �?)
//    2) cv4_ocr_create id, "tessdata_dir", "eng+jpn"
//    3) cv4_ocr_run    result_var, id, src_id
//    4) cv4_ocr_free   id
//
//  注�?: lang は Tesseract 流に "eng" / "jpn" / "eng+jpn" の形式�?
//  data_dir に NULL/"" を渡すと TESSDATA_PREFIX 環�?変数を見る�?
//============================================================================

//  cv4_ocr_create id, "tessdata_dir", "lang"
//                    [, oem=3 (DEFAULT)]
//                    [, psm=3 (AUTO)]
CV4_EXPORT int __stdcall cv4_ocr_create(int id, const char* dir, const char* lang,
                                        int oem, int psm)
{
    try {
        if (oem == 0) oem = cv::text::OEM_DEFAULT;
        if (psm == 0) psm = cv::text::PSM_AUTO;
        if (!lang || !*lang) return fail("cv4_ocr_create: lang required");
        const char* data_dir = (dir && *dir) ? dir : nullptr;
        cv::Ptr<cv::text::OCRTesseract> ocr =
            cv::text::OCRTesseract::create(data_dir, lang, nullptr, oem, psm);
        if (ocr.empty()) return fail("cv4_ocr_create: create failed");
        hspcv4::ocr_set(id, ocr);
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_ocr_create: unknown"); }
}

//  cv4_ocr_run result_str_var, id, src_id [, component=0 (TEXT)]
//    component: 0=COMPONENT_LEVEL_TEXTLINE / 1=COMPONENT_LEVEL_WORD ではな�?
//               cv::text::OCR_LEVEL_WORD=0 / OCR_LEVEL_TEXTLINE=1
CV4_EXPORT int __stdcall cv4_ocr_run(HSPEXINFO* hei, PVal* pv, int id, int src_id, int comp)
{
    try {
        if (!hei || !pv) return fail("cv4_ocr_run: null arg");
        if (pv->flag != HSPVAR_FLAG_STR) return fail("cv4_ocr_run: var must be str");
        if (comp == 0) comp = cv::text::OCR_LEVEL_TEXTLINE;
        auto* op = hspcv4::ocr_get(id);
        if (!op || op->empty()) return fail("cv4_ocr_run: invalid ocr id");
        cv::Mat* src = hspcv4::handle_get(src_id);
        if (!src || src->empty()) return fail("cv4_ocr_run: invalid src");
        std::string out;
        (*op)->run(*src, out, nullptr, nullptr, nullptr, comp);
        HspVarProc* proc = hei->HspFunc_getproc(pv->flag);
        proc->Set(pv, proc->GetPtr(pv), (void*)out.c_str());
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_ocr_run: unknown"); }
}

//  cv4_ocr_free id
CV4_EXPORT int __stdcall cv4_ocr_free(int id)
{
    hspcv4::ocr_free(id);
    return 0;
}


//============================================================================
//  Main fillers (Phase 27): flip / transpose / copy_make_border / in_range
//                           + highgui setWindowTitle / resizeWindow
//============================================================================

//  cv4_flip dst, src, flip_code
//    flip_code: 0=x軸, 1=y軸, -1=両軸
CV4_EXPORT int __stdcall cv4_flip(int dst_id, int src_id, int code)
{
    try {
        cv::Mat* src = hspcv4::handle_get(src_id);
        if (!src || src->empty()) return fail("cv4_flip: invalid src");
        cv::Mat dst;
        cv::flip(*src, dst, code);
        hspcv4::handle_set(dst_id, std::move(dst));
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_flip: unknown"); }
}

//  cv4_transpose dst, src
CV4_EXPORT int __stdcall cv4_transpose(int dst_id, int src_id)
{
    try {
        cv::Mat* src = hspcv4::handle_get(src_id);
        if (!src || src->empty()) return fail("cv4_transpose: invalid src");
        cv::Mat dst;
        cv::transpose(*src, dst);
        hspcv4::handle_set(dst_id, std::move(dst));
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_transpose: unknown"); }
}

//  cv4_copy_make_border dst, src, top, bottom, left, right
//                       [, border_type=BORDER_CONSTANT(0)]
//                       [, value_b=0] [, value_g=0] [, value_r=0]
CV4_EXPORT int __stdcall cv4_copy_make_border(int dst_id, int src_id, int t, int b,
                                              int l, int r, int btype,
                                              int vb, int vg, int vr)
{
    try {
        cv::Mat* src = hspcv4::handle_get(src_id);
        if (!src || src->empty()) return fail("cv4_copy_make_border: invalid src");
        cv::Mat dst;
        cv::copyMakeBorder(*src, dst, t, b, l, r, btype,
                           cv::Scalar(vb, vg, vr));
        hspcv4::handle_set(dst_id, std::move(dst));
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_copy_make_border: unknown"); }
}

//  cv4_in_range mask, src, lo_b, lo_g, lo_r, hi_b, hi_g, hi_r
//    BGR それぞれの上下限から二値マスクを生成�?
CV4_EXPORT int __stdcall cv4_in_range(int dst_id, int src_id,
                                      int lb, int lg, int lr,
                                      int hb, int hg, int hr)
{
    try {
        cv::Mat* src = hspcv4::handle_get(src_id);
        if (!src || src->empty()) return fail("cv4_in_range: invalid src");
        cv::Mat dst;
        cv::inRange(*src, cv::Scalar(lb, lg, lr), cv::Scalar(hb, hg, hr), dst);
        hspcv4::handle_set(dst_id, std::move(dst));
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_in_range: unknown"); }
}

//  cv4_set_window_title "winname", "title"
CV4_EXPORT int __stdcall cv4_set_window_title(const char* win, const char* ttl)
{
    try {
        if (!win || !ttl) return fail("cv4_set_window_title: null arg");
        cv::setWindowTitle(win, ttl);
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_set_window_title: unknown"); }
}

//  cv4_resize_window "winname", width, height
CV4_EXPORT int __stdcall cv4_resize_window(const char* win, int w, int h)
{
    try {
        if (!win) return fail("cv4_resize_window: null winname");
        cv::resizeWindow(win, w, h);
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_resize_window: unknown"); }
}


//============================================================================
//  core 拡�? (Phase 26): PCA / SVD / dft / dct / kmeans
//============================================================================

//  cv4_dft dst, src [, flags=0]
CV4_EXPORT int __stdcall cv4_dft(int dst_id, int src_id, int flags)
{
    try {
        cv::Mat* src = hspcv4::handle_get(src_id);
        if (!src || src->empty()) return fail("cv4_dft: invalid src");
        cv::Mat dst;
        cv::dft(*src, dst, flags);
        hspcv4::handle_set(dst_id, std::move(dst));
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_dft: unknown"); }
}

//  cv4_dct dst, src [, flags=0]
CV4_EXPORT int __stdcall cv4_dct(int dst_id, int src_id, int flags)
{
    try {
        cv::Mat* src = hspcv4::handle_get(src_id);
        if (!src || src->empty()) return fail("cv4_dct: invalid src");
        cv::Mat dst;
        cv::dct(*src, dst, flags);
        hspcv4::handle_set(dst_id, std::move(dst));
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_dct: unknown"); }
}

//  cv4_kmeans labels_id, data_id, K, max_iter, attempts [, centers_id=-1]
CV4_EXPORT int __stdcall cv4_kmeans(int labels_id, int data_id, int K,
                                    int max_iter, int attempts, int centers_id)
{
    try {
        if (max_iter == 0) max_iter = 10;
        if (attempts == 0) attempts = 3;
        if (centers_id == 0) centers_id = -1;
        cv::Mat* data = hspcv4::handle_get(data_id);
        if (!data || data->empty()) return fail("cv4_kmeans: invalid data");
        cv::Mat labels, centers;
        cv::TermCriteria tc(cv::TermCriteria::EPS + cv::TermCriteria::MAX_ITER,
                            max_iter, 1.0);
        cv::kmeans(*data, K, labels, tc, attempts, cv::KMEANS_PP_CENTERS, centers);
        hspcv4::handle_set(labels_id, std::move(labels));
        if (centers_id >= 0) hspcv4::handle_set(centers_id, std::move(centers));
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_kmeans: unknown"); }
}

//  cv4_pca_compute mean_id, eigenvecs_id, eigenvals_id, data_id [, max_components=0]
CV4_EXPORT int __stdcall cv4_pca_compute(int mean_id, int evec_id, int eval_id,
                                         int data_id, int max_comp)
{
    try {
        cv::Mat* data = hspcv4::handle_get(data_id);
        if (!data || data->empty()) return fail("cv4_pca_compute: invalid data");
        cv::PCA pca(*data, cv::Mat(), cv::PCA::DATA_AS_ROW, max_comp);
        hspcv4::handle_set(mean_id, pca.mean.clone());
        hspcv4::handle_set(evec_id, pca.eigenvectors.clone());
        hspcv4::handle_set(eval_id, pca.eigenvalues.clone());
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_pca_compute: unknown"); }
}

//  cv4_svd_compute u_id, w_id, vt_id, src_id [, flags=0]
CV4_EXPORT int __stdcall cv4_svd_compute(int u_id, int w_id, int vt_id,
                                         int src_id, int flags)
{
    try {
        cv::Mat* src = hspcv4::handle_get(src_id);
        if (!src || src->empty()) return fail("cv4_svd_compute: invalid src");
        cv::Mat u, w, vt;
        cv::SVD::compute(*src, w, u, vt, flags);
        hspcv4::handle_set(u_id, std::move(u));
        hspcv4::handle_set(w_id, std::move(w));
        hspcv4::handle_set(vt_id, std::move(vt));
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_svd_compute: unknown"); }
}


//============================================================================
//  Phase 25: wechat_qrcode + quality + plot
//   text/OCR (Tesseract 依�?) と saliency は別タスクへ繰り延べ�?
//============================================================================

//  cv4_wechat_qr_decode count_var, src_id, "det.prototxt", "det.caffemodel",
//                                          "sr.prototxt",  "sr.caffemodel"
//    検�?�され�? QR コード文字�?��?�個数�? count_var に書き戻す�?
//    実際の�?字�?��?��?来 cv4_qr_get_string などで取り出す想�? (今回は count のみ)�?
CV4_EXPORT int __stdcall cv4_wechat_qr_decode(HSPEXINFO* hei, PVal* pv, int src_id,
                                              const char* dp, const char* dm,
                                              const char* sp, const char* sm)
{
    try {
        if (!hei || !pv) return fail("cv4_wechat_qr_decode: null arg");
        if (pv->flag != HSPVAR_FLAG_INT)
            return fail("cv4_wechat_qr_decode: var_count must be int");
        cv::Mat* src = hspcv4::handle_get(src_id);
        if (!src || src->empty()) return fail("cv4_wechat_qr_decode: invalid src");
        cv::wechat_qrcode::WeChatQRCode qr(
            dp ? dp : "", dm ? dm : "",
            sp ? sp : "", sm ? sm : "");
        std::vector<cv::Mat> points;
        std::vector<std::string> results = qr.detectAndDecode(*src, points);
        int n = (int)results.size();
        HspVarProc* proc = hei->HspFunc_getproc(HSPVAR_FLAG_INT);
        proc->Set(pv, proc->GetPtr(pv), &n);
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_wechat_qr_decode: unknown"); }
}

//  cv4_quality_psnr var_psnr_x100, ref_id, cmp_id
CV4_EXPORT int __stdcall cv4_quality_psnr(HSPEXINFO* hei, PVal* pv, int ref_id, int cmp_id)
{
    try {
        if (!hei || !pv) return fail("cv4_quality_psnr: null arg");
        if (pv->flag != HSPVAR_FLAG_INT)
            return fail("cv4_quality_psnr: var must be int");
        cv::Mat* ref = hspcv4::handle_get(ref_id);
        cv::Mat* cmp = hspcv4::handle_get(cmp_id);
        if (!ref || ref->empty() || !cmp || cmp->empty())
            return fail("cv4_quality_psnr: invalid input");
        cv::Mat qmap;
        cv::Scalar s = cv::quality::QualityPSNR::compute(*ref, *cmp, qmap);
        double psnr = s[0];
        // identical �? +inf�?HSP int で扱える最大値にクランプ�?
        int v_x100;
        if (!std::isfinite(psnr)) v_x100 = 999999;
        else                       v_x100 = (int)(psnr * 100.0);
        HspVarProc* proc = hei->HspFunc_getproc(HSPVAR_FLAG_INT);
        proc->Set(pv, proc->GetPtr(pv), &v_x100);
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_quality_psnr: unknown"); }
}

//  cv4_quality_ssim var_ssim_x10000, ref_id, cmp_id
CV4_EXPORT int __stdcall cv4_quality_ssim(HSPEXINFO* hei, PVal* pv, int ref_id, int cmp_id)
{
    try {
        if (!hei || !pv) return fail("cv4_quality_ssim: null arg");
        if (pv->flag != HSPVAR_FLAG_INT)
            return fail("cv4_quality_ssim: var must be int");
        cv::Mat* ref = hspcv4::handle_get(ref_id);
        cv::Mat* cmp = hspcv4::handle_get(cmp_id);
        if (!ref || ref->empty() || !cmp || cmp->empty())
            return fail("cv4_quality_ssim: invalid input");
        cv::Mat qmap;
        cv::Scalar s = cv::quality::QualitySSIM::compute(*ref, *cmp, qmap);
        int v_x10000 = (int)(s[0] * 10000.0);
        HspVarProc* proc = hei->HspFunc_getproc(HSPVAR_FLAG_INT);
        proc->Set(pv, proc->GetPtr(pv), &v_x10000);
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_quality_ssim: unknown"); }
}

//  cv4_plot dst_id, data_y_id [, width=600] [, height=400]
//    1次�?�?ータ (CV_64F or CV_32F) �? 2D グラフ画�? (BGR) として描画�?
CV4_EXPORT int __stdcall cv4_plot(int dst_id, int data_id, int w, int h)
{
    try {
        if (w == 0) w = 600;
        if (h == 0) h = 400;
        cv::Mat* data = hspcv4::handle_get(data_id);
        if (!data || data->empty()) return fail("cv4_plot: invalid data");
        cv::Ptr<cv::plot::Plot2d> plot = cv::plot::Plot2d::create(*data);
        plot->setPlotSize(w, h);
        plot->setShowGrid(true);
        plot->setShowText(true);
        cv::Mat out;
        plot->render(out);
        hspcv4::handle_set(dst_id, std::move(out));
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_plot: unknown"); }
}


//============================================================================
//  xfeatures2d / ximgproc extras (Phase 24)
//============================================================================

//  cv4_msd_detect kp_id, src_id [, patch_radius=3] [, search_area_radius=5]
CV4_EXPORT int __stdcall cv4_msd_detect(int kp_id, int src_id, int prad, int srad)
{
    try {
        if (prad == 0) prad = 3;
        if (srad == 0) srad = 5;
        cv::Mat* src = hspcv4::handle_get(src_id);
        if (!src || src->empty()) return fail("cv4_msd_detect: invalid src");
        auto detector = cv::xfeatures2d::MSDDetector::create(prad, srad);
        std::vector<cv::KeyPoint> kps;
        detector->detect(*src, kps);
        hspcv4::kps_set(kp_id, std::move(kps));
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_msd_detect: unknown"); }
}

//  cv4_fast_line_detect lines_mat_id, src_id [, len_thresh=10]
//                                            [, do_merge=0]
//    出�? lines は Nx4 CV_32F (x1, y1, x2, y2)
CV4_EXPORT int __stdcall cv4_fast_line_detect(int dst_id, int src_id,
                                              int len_th, int do_mrg)
{
    try {
        if (len_th == 0) len_th = 10;
        cv::Mat* src = hspcv4::handle_get(src_id);
        if (!src || src->empty()) return fail("cv4_fast_line_detect: invalid src");
        auto fld = cv::ximgproc::createFastLineDetector(
            len_th, 1.4142135f, 50.0, 50.0, 3, do_mrg != 0);
        std::vector<cv::Vec4f> lines;
        fld->detect(*src, lines);
        cv::Mat out((int)lines.size(), 4, CV_32F);
        for (size_t i = 0; i < lines.size(); ++i) {
            out.at<float>((int)i, 0) = lines[i][0];
            out.at<float>((int)i, 1) = lines[i][1];
            out.at<float>((int)i, 2) = lines[i][2];
            out.at<float>((int)i, 3) = lines[i][3];
        }
        hspcv4::handle_set(dst_id, std::move(out));
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_fast_line_detect: unknown"); }
}

//  cv4_peilin_normalize dst, src
//    PeiLin 正規化 (画像�?�アフィン正規化用変換 T 行�?�を出�?)
CV4_EXPORT int __stdcall cv4_peilin_normalize(int dst_id, int src_id)
{
    try {
        cv::Mat* src = hspcv4::handle_get(src_id);
        if (!src || src->empty()) return fail("cv4_peilin_normalize: invalid src");
        cv::Mat T;
        cv::ximgproc::PeiLinNormalization(*src, T);
        hspcv4::handle_set(dst_id, std::move(T));
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_peilin_normalize: unknown"); }
}

//  cv4_am_filter dst, joint, src, sigma_s_x10, sigma_r_x10
//    Adaptive Manifold Filter (sigma は 0.1 単位�?�整数で渡�?)
CV4_EXPORT int __stdcall cv4_am_filter(int dst_id, int joint_id, int src_id,
                                       int s_s_x10, int s_r_x10)
{
    try {
        if (s_s_x10 == 0) s_s_x10 = 160;
        if (s_r_x10 == 0) s_r_x10 = 2;
        cv::Mat* joint = hspcv4::handle_get(joint_id);
        cv::Mat* src   = hspcv4::handle_get(src_id);
        if (!joint || joint->empty() || !src || src->empty())
            return fail("cv4_am_filter: invalid input");
        cv::Mat dst;
        cv::ximgproc::amFilter(*joint, *src, dst,
            (double)s_s_x10 / 10.0, (double)s_r_x10 / 10.0);
        hspcv4::handle_set(dst_id, std::move(dst));
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_am_filter: unknown"); }
}


//============================================================================
//  features2d extras (Phase 23): BRISK / FAST + KalmanFilter
//============================================================================

//  cv4_brisk_detect_compute kp_id, desc_id, src_id, threshold, octaves
CV4_EXPORT int __stdcall cv4_brisk_detect_compute(int kp_id, int desc_id, int src_id,
                                                  int thresh, int octaves)
{
    try {
        cv::Mat* src = hspcv4::handle_get(src_id);
        if (!src || src->empty()) return fail("cv4_brisk_detect_compute: invalid src");
        auto detector = cv::BRISK::create(thresh, octaves);
        std::vector<cv::KeyPoint> kps;
        cv::Mat desc;
        detector->detectAndCompute(*src, cv::noArray(), kps, desc);
        hspcv4::kps_set(kp_id, std::move(kps));
        hspcv4::handle_set(desc_id, std::move(desc));
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_brisk_detect_compute: unknown"); }
}

//  cv4_fast_detect kp_id, src_id, threshold, nonmax
CV4_EXPORT int __stdcall cv4_fast_detect(int kp_id, int src_id, int thresh, int nmax)
{
    try {
        cv::Mat* src = hspcv4::handle_get(src_id);
        if (!src || src->empty()) return fail("cv4_fast_detect: invalid src");
        auto detector = cv::FastFeatureDetector::create(thresh, nmax != 0);
        std::vector<cv::KeyPoint> kps;
        detector->detect(*src, kps);
        hspcv4::kps_set(kp_id, std::move(kps));
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_fast_detect: unknown"); }
}

//  cv4_kalman_create kf_id, dynam_params, measure_params, control_params
//    �?: 2D 等速度モ�?ル �? dynam=4 (x,y,vx,vy), measure=2 (x,y)
CV4_EXPORT int __stdcall cv4_kalman_create(int kf_id, int dynP, int meaP, int conP)
{
    try {
        cv::KalmanFilter kf(dynP, meaP, conP);
        // �?フォルト�?� transitionMatrix は単位行�?�。最低限 measurementMatrix と
        // �?種ノイズ共�?散だけ�?�期値を�?�れておく (実用時�?� HSP 側から個別に
        // 行�?�ハンドルで上書きする想�?)�?
        cv::setIdentity(kf.measurementMatrix);
        cv::setIdentity(kf.processNoiseCov, cv::Scalar::all(1e-4));
        cv::setIdentity(kf.measurementNoiseCov, cv::Scalar::all(1e-1));
        cv::setIdentity(kf.errorCovPost, cv::Scalar::all(1.0));
        hspcv4::kalman_set(kf_id, std::move(kf));
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_kalman_create: unknown"); }
}

//  cv4_kalman_predict kf_id, dst_state_mat
CV4_EXPORT int __stdcall cv4_kalman_predict(int kf_id, int dst_id)
{
    try {
        auto* kf = hspcv4::kalman_get(kf_id);
        if (!kf) return fail("cv4_kalman_predict: invalid kalman");
        cv::Mat pred = kf->predict();
        hspcv4::handle_set(dst_id, pred.clone());
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_kalman_predict: unknown"); }
}

//  cv4_kalman_correct kf_id, measurement_mat_id, dst_state_mat_id
//    dst_state_mat_id �? -1 以外で�?定すると更新�? statePost を書き戻す�?
CV4_EXPORT int __stdcall cv4_kalman_correct(int kf_id, int meas_id, int dst_id)
{
    try {
        auto* kf = hspcv4::kalman_get(kf_id);
        if (!kf) return fail("cv4_kalman_correct: invalid kalman");
        cv::Mat* meas = hspcv4::handle_get(meas_id);
        if (!meas || meas->empty()) return fail("cv4_kalman_correct: invalid measurement");
        cv::Mat updated = kf->correct(*meas);
        if (dst_id >= 0) hspcv4::handle_set(dst_id, updated.clone());
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_kalman_correct: unknown"); }
}

//  cv4_kalman_free kf_id
CV4_EXPORT int __stdcall cv4_kalman_free(int kf_id)
{
    hspcv4::kalman_free(kf_id);
    return 0;
}


//============================================================================
//  xphoto module (Phase 22): white balance / oil painting / BM3D denoising
//============================================================================

//  cv4_xphoto_simple_wb dst, src
CV4_EXPORT int __stdcall cv4_xphoto_simple_wb(int dst_id, int src_id)
{
    try {
        cv::Mat* src = hspcv4::handle_get(src_id);
        if (!src || src->empty()) return fail("cv4_xphoto_simple_wb: invalid src");
        cv::Ptr<cv::xphoto::SimpleWB> wb = cv::xphoto::createSimpleWB();
        cv::Mat dst;
        wb->balanceWhite(*src, dst);
        hspcv4::handle_set(dst_id, std::move(dst));
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_xphoto_simple_wb: unknown"); }
}

//  cv4_xphoto_grayworld_wb dst, src
CV4_EXPORT int __stdcall cv4_xphoto_grayworld_wb(int dst_id, int src_id)
{
    try {
        cv::Mat* src = hspcv4::handle_get(src_id);
        if (!src || src->empty()) return fail("cv4_xphoto_grayworld_wb: invalid src");
        cv::Ptr<cv::xphoto::GrayworldWB> wb = cv::xphoto::createGrayworldWB();
        cv::Mat dst;
        wb->balanceWhite(*src, dst);
        hspcv4::handle_set(dst_id, std::move(dst));
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_xphoto_grayworld_wb: unknown"); }
}

//  cv4_xphoto_oil_painting dst, src, size, dyn_ratio
CV4_EXPORT int __stdcall cv4_xphoto_oil_painting(int dst_id, int src_id, int size, int dynr)
{
    try {
        cv::Mat* src = hspcv4::handle_get(src_id);
        if (!src || src->empty()) return fail("cv4_xphoto_oil_painting: invalid src");
        cv::Mat dst;
        cv::xphoto::oilPainting(*src, dst, size, dynr);
        hspcv4::handle_set(dst_id, std::move(dst));
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_xphoto_oil_painting: unknown"); }
}

//  cv4_xphoto_bm3d_denoise dst, src, h_x100 (h は実数; x100 で渡�?)
CV4_EXPORT int __stdcall cv4_xphoto_bm3d_denoise(int dst_id, int src_id, int h_x100)
{
    try {
        cv::Mat* src = hspcv4::handle_get(src_id);
        if (!src || src->empty()) return fail("cv4_xphoto_bm3d_denoise: invalid src");
        cv::Mat dst;
        cv::xphoto::bm3dDenoising(*src, dst, (float)h_x100 / 100.0f);
        hspcv4::handle_set(dst_id, std::move(dst));
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_xphoto_bm3d_denoise: unknown"); }
}


//============================================================================
//  Stereo / projection (Phase 21): StereoBM / StereoSGBM / projectPoints
//============================================================================

//  cv4_stereo_bm_create stereo_id, num_disparities, block_size
CV4_EXPORT int __stdcall cv4_stereo_bm_create(int sid, int numDisp, int blkSize)
{
    try {
        cv::Ptr<cv::StereoMatcher> sm = cv::StereoBM::create(numDisp, blkSize);
        hspcv4::stereo_set(sid, sm);
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_stereo_bm_create: unknown"); }
}

//  cv4_stereo_sgbm_create stereo_id, min_disp, num_disp, block_size, P1, P2
CV4_EXPORT int __stdcall cv4_stereo_sgbm_create(int sid, int minDisp, int numDisp,
                                                int blkSize, int P1, int P2)
{
    try {
        cv::Ptr<cv::StereoMatcher> sm =
            cv::StereoSGBM::create(minDisp, numDisp, blkSize, P1, P2);
        hspcv4::stereo_set(sid, sm);
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_stereo_sgbm_create: unknown"); }
}

//  cv4_stereo_compute disparity_dst, stereo_id, left_id, right_id
CV4_EXPORT int __stdcall cv4_stereo_compute(int dst_id, int sid, int left_id, int right_id)
{
    try {
        auto* sp = hspcv4::stereo_get(sid);
        if (!sp || sp->empty()) return fail("cv4_stereo_compute: invalid stereo");
        cv::Mat* L = hspcv4::handle_get(left_id);
        cv::Mat* R = hspcv4::handle_get(right_id);
        if (!L || L->empty() || !R || R->empty())
            return fail("cv4_stereo_compute: invalid input image");
        cv::Mat disp;
        (*sp)->compute(*L, *R, disp);
        hspcv4::handle_set(dst_id, std::move(disp));
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_stereo_compute: unknown"); }
}

//  cv4_stereo_free stereo_id
CV4_EXPORT int __stdcall cv4_stereo_free(int sid)
{
    hspcv4::stereo_free(sid);
    return 0;
}

//  cv4_moments_centroid cid, index, var_cx_x10, var_cy_x10
//    輪郭セ�?ト�??のi番目につ�?て重�? (cx, cy) を計算し、x10 整数で書き戻す�?
CV4_EXPORT int __stdcall cv4_moments_centroid(HSPEXINFO* hei, int cid, int idx,
                                              PVal* pvx, PVal* pvy)
{
    try {
        if (!hei || !pvx || !pvy) return fail("cv4_moments_centroid: null arg");
        if (pvx->flag != HSPVAR_FLAG_INT)
            return fail("cv4_moments_centroid: var_cx must be int");
        if (pvy->flag != HSPVAR_FLAG_INT)
            return fail("cv4_moments_centroid: var_cy must be int");
        auto* cs = hspcv4::contours_get(cid);
        if (!cs) return fail("cv4_moments_centroid: invalid contours");
        if (idx < 0 || idx >= (int)cs->size())
            return fail("cv4_moments_centroid: index out of range");
        cv::Moments m = cv::moments((*cs)[idx]);
        int cx_x10 = (m.m00 != 0.0) ? (int)(10.0 * m.m10 / m.m00) : 0;
        int cy_x10 = (m.m00 != 0.0) ? (int)(10.0 * m.m01 / m.m00) : 0;
        HspVarProc* proc = hei->HspFunc_getproc(HSPVAR_FLAG_INT);
        proc->Set(pvx, proc->GetPtr(pvx), &cx_x10);
        proc->Set(pvy, proc->GetPtr(pvy), &cy_x10);
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_moments_centroid: unknown"); }
}


//============================================================================
//  Calib3D extras (Phase 14): undistort / rodrigues / camera matrix etc.
//============================================================================

//  cv4_camera_matrix dst_id, fx, fy, cx, cy
//    3x3 カメラ�?部行�?�を生�??: [[fx,0,cx],[0,fy,cy],[0,0,1]]
CV4_EXPORT int __stdcall cv4_camera_matrix(int dst_id, double fx, double fy,
                                            double cx, double cy)
{
    try {
        cv::Mat K = (cv::Mat_<double>(3, 3) <<
            fx, 0,  cx,
            0,  fy, cy,
            0,  0,  1);
        hspcv4::handle_set(dst_id, std::move(K));
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_camera_matrix: unknown"); }
}

//  cv4_dist_coeffs dst_id, k1, k2, p1, p2, k3
//    5 要素の歪み係数ベクトル [k1, k2, p1, p2, k3] を作�??
CV4_EXPORT int __stdcall cv4_dist_coeffs(int dst_id, double k1, double k2,
                                          double pp1, double pp2, double k3)
{
    try {
        cv::Mat D = (cv::Mat_<double>(1, 5) << k1, k2, pp1, pp2, k3);
        hspcv4::handle_set(dst_id, std::move(D));
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_dist_coeffs: unknown"); }
}

//  cv4_undistort dst_id, src_id, K_id, D_id
CV4_EXPORT int __stdcall cv4_undistort(int dst_id, int src_id, int K_id, int D_id)
{
    try {
        cv::Mat* src = hspcv4::handle_get(src_id);
        cv::Mat* K   = hspcv4::handle_get(K_id);
        cv::Mat* D   = hspcv4::handle_get(D_id);
        if (!src || src->empty()) return fail("cv4_undistort: invalid source");
        if (!K || K->empty()) return fail("cv4_undistort: invalid K");
        if (!D || D->empty()) return fail("cv4_undistort: invalid D");
        cv::Mat out;
        cv::undistort(*src, out, *K, *D);
        hspcv4::handle_set(dst_id, std::move(out));
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_undistort: unknown"); }
}

//  cv4_rodrigues dst_id, src_id
//    入�? 3x1 (or 1x3) ベクトル �? 3x3 回転行�?�、また�?��?方�?
//    入力が float/double でなければ自動で CV_64F に変換する
CV4_EXPORT int __stdcall cv4_rodrigues(int dst_id, int src_id)
{
    try {
        cv::Mat* src = hspcv4::handle_get(src_id);
        if (!src || src->empty()) return fail("cv4_rodrigues: invalid source");
        cv::Mat in_f;
        if (src->depth() == CV_32F || src->depth() == CV_64F) {
            in_f = *src;
        } else {
            src->convertTo(in_f, CV_64F);
        }
        cv::Mat out;
        cv::Rodrigues(in_f, out);
        hspcv4::handle_set(dst_id, std::move(out));
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_rodrigues: unknown"); }
}

//  cv4_solve_pnp rvec_id, tvec_id, obj_pts_id, img_pts_id, K_id, D_id, flags
CV4_EXPORT int __stdcall cv4_solve_pnp(int rvec_id, int tvec_id, int obj_id,
                                       int img_id, int K_id, int D_id, int flags)
{
    try {
        cv::Mat* obj = hspcv4::handle_get(obj_id);
        cv::Mat* img = hspcv4::handle_get(img_id);
        cv::Mat* K   = hspcv4::handle_get(K_id);
        cv::Mat* D   = hspcv4::handle_get(D_id);
        if (!obj || !img || !K || !D ||
            obj->empty() || img->empty() || K->empty() || D->empty())
            return fail("cv4_solve_pnp: invalid inputs");
        cv::Mat rvec, tvec;
        bool ok = cv::solvePnP(*obj, *img, *K, *D, rvec, tvec, false, flags);
        if (!ok) return fail("cv4_solve_pnp: solvePnP returned false");
        hspcv4::handle_set(rvec_id, std::move(rvec));
        hspcv4::handle_set(tvec_id, std::move(tvec));
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_solve_pnp: unknown"); }
}

//  cv4_project_points img_pts_id, obj_pts_id, rvec_id, tvec_id, K_id, D_id
CV4_EXPORT int __stdcall cv4_project_points(int img_id, int obj_id, int rvec_id,
                                            int tvec_id, int K_id, int D_id)
{
    try {
        cv::Mat* obj  = hspcv4::handle_get(obj_id);
        cv::Mat* rvec = hspcv4::handle_get(rvec_id);
        cv::Mat* tvec = hspcv4::handle_get(tvec_id);
        cv::Mat* K    = hspcv4::handle_get(K_id);
        cv::Mat* D    = hspcv4::handle_get(D_id);
        if (!obj || !rvec || !tvec || !K || !D ||
            obj->empty() || rvec->empty() || tvec->empty() || K->empty() || D->empty())
            return fail("cv4_project_points: invalid inputs");
        cv::Mat out;
        cv::projectPoints(*obj, *rvec, *tvec, *K, *D, out);
        hspcv4::handle_set(img_id, std::move(out));
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_project_points: unknown"); }
}

//  cv4_find_chessboard_corners corners_id, img_id, w, h
//    チェスボ�?��? w x h の�?側コーナ�?�検�?�
CV4_EXPORT int __stdcall cv4_find_chessboard_corners(int corners_id, int img_id, int w, int h)
{
    try {
        cv::Mat* img = hspcv4::handle_get(img_id);
        if (!img || img->empty()) return fail("cv4_find_chessboard_corners: invalid image");
        cv::Mat gray = (img->channels() == 1) ? *img : cv::Mat();
        if (gray.empty()) cv::cvtColor(as_bgr(*img), gray, cv::COLOR_BGR2GRAY);
        std::vector<cv::Point2f> corners;
        bool found = cv::findChessboardCorners(gray, cv::Size(w, h), corners);
        if (!found) return fail("cv4_find_chessboard_corners: not found");
        cv::Mat out((int)corners.size(), 2, CV_32F);
        for (size_t i = 0; i < corners.size(); ++i) {
            out.at<float>((int)i, 0) = corners[i].x;
            out.at<float>((int)i, 1) = corners[i].y;
        }
        hspcv4::handle_set(corners_id, std::move(out));
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_find_chessboard_corners: unknown"); }
}


//============================================================================
//  Video : optical flow / background subtraction / trackers
//============================================================================

// --- オプティカルフロー ---

//  cv4_optflow_farneback flow_mat_id, prev_id, next_id
//    Farneback dense optical flow. 出力�?� HxWx2 CV_32F (dx, dy)
CV4_EXPORT int __stdcall cv4_optflow_farneback(int flow_id, int prev_id, int next_id)
{
    try {
        cv::Mat* prev = hspcv4::handle_get(prev_id);
        cv::Mat* next = hspcv4::handle_get(next_id);
        if (!prev || !next || prev->empty() || next->empty())
            return fail("cv4_optflow_farneback: invalid input");
        cv::Mat pg = (prev->channels() == 1) ? *prev : cv::Mat();
        cv::Mat ng = (next->channels() == 1) ? *next : cv::Mat();
        if (pg.empty()) cv::cvtColor(as_bgr(*prev), pg, cv::COLOR_BGR2GRAY);
        if (ng.empty()) cv::cvtColor(as_bgr(*next), ng, cv::COLOR_BGR2GRAY);
        cv::Mat flow;
        cv::calcOpticalFlowFarneback(pg, ng, flow, 0.5, 3, 15, 3, 5, 1.2, 0);
        hspcv4::handle_set(flow_id, std::move(flow));
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_optflow_farneback: unknown"); }
}

//  cv4_optflow_lk out_kp_id, status_mat_id, prev_id, next_id, prev_kp_id
//    Lucas-Kanade sparse optical flow. prev_kp_id は次フレームでの対応点に
//    置換された新しいキーポイントセ�?�? out_kp_id として出力する�?
//    status は Nx1 CV_8U (成功=1/失�?=0)�?
CV4_EXPORT int __stdcall cv4_optflow_lk(int out_kp_id, int status_id,
                                        int prev_id, int next_id, int prev_kp_id)
{
    try {
        cv::Mat* prev = hspcv4::handle_get(prev_id);
        cv::Mat* next = hspcv4::handle_get(next_id);
        auto* pkps = hspcv4::kps_get(prev_kp_id);
        if (!prev || !next || prev->empty() || next->empty())
            return fail("cv4_optflow_lk: invalid images");
        if (!pkps || pkps->empty())
            return fail("cv4_optflow_lk: invalid prev kp set");
        cv::Mat pg = (prev->channels() == 1) ? *prev : cv::Mat();
        cv::Mat ng = (next->channels() == 1) ? *next : cv::Mat();
        if (pg.empty()) cv::cvtColor(as_bgr(*prev), pg, cv::COLOR_BGR2GRAY);
        if (ng.empty()) cv::cvtColor(as_bgr(*next), ng, cv::COLOR_BGR2GRAY);
        std::vector<cv::Point2f> pts_prev, pts_next;
        pts_prev.reserve(pkps->size());
        for (auto& k : *pkps) pts_prev.push_back(k.pt);
        std::vector<uchar> status;
        std::vector<float> err;
        cv::calcOpticalFlowPyrLK(pg, ng, pts_prev, pts_next, status, err);
        hspcv4::KeyPointSet next_kps;
        next_kps.reserve(pts_next.size());
        for (auto& p : pts_next) next_kps.emplace_back(p, 5.0f);
        hspcv4::kps_set(out_kp_id, std::move(next_kps));
        cv::Mat status_mat((int)status.size(), 1, CV_8U);
        for (size_t i = 0; i < status.size(); ++i)
            status_mat.at<uchar>((int)i, 0) = status[i];
        hspcv4::handle_set(status_id, std::move(status_mat));
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_optflow_lk: unknown"); }
}

// --- 背景差�? ---

//  cv4_bgsub_create_mog2 bg_id, history, var_thresh, detect_shadows
CV4_EXPORT int __stdcall cv4_bgsub_create_mog2(int bg_id, int hist, double vt, int shadow)
{
    try {
        cv::Ptr<cv::BackgroundSubtractor> bg = cv::createBackgroundSubtractorMOG2(hist, vt, shadow != 0);
        hspcv4::bgsub_set(bg_id, bg);
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_bgsub_create_mog2: unknown"); }
}

//  cv4_bgsub_create_knn bg_id, history, dist2_thresh, detect_shadows
CV4_EXPORT int __stdcall cv4_bgsub_create_knn(int bg_id, int hist, double dt, int shadow)
{
    try {
        cv::Ptr<cv::BackgroundSubtractor> bg = cv::createBackgroundSubtractorKNN(hist, dt, shadow != 0);
        hspcv4::bgsub_set(bg_id, bg);
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_bgsub_create_knn: unknown"); }
}

//  cv4_bgsub_apply bg_id, src_id, fg_id, learning_rate
CV4_EXPORT int __stdcall cv4_bgsub_apply(int bg_id, int src_id, int fg_id, double lr)
{
    try {
        auto* bg = hspcv4::bgsub_get(bg_id);
        if (!bg || bg->empty()) return fail("cv4_bgsub_apply: invalid bg");
        cv::Mat* src = hspcv4::handle_get(src_id);
        if (!src || src->empty()) return fail("cv4_bgsub_apply: invalid source");
        cv::Mat fg;
        (*bg)->apply(*src, fg, lr);
        hspcv4::handle_set(fg_id, std::move(fg));
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_bgsub_apply: unknown"); }
}

//  cv4_bgsub_free bg_id
CV4_EXPORT int __stdcall cv4_bgsub_free(int id)
{
    hspcv4::bgsub_free(id);
    return 0;
}

// --- トラ�?カ ---
//    OpenCV 4.12 main build に含まれる: TrackerMIL, TrackerGOTURN, TrackerDaSiamRPN,
//    TrackerNano, TrackerVit (後�? 4 つは外部モ�?ルファイル�?�?)
//    KCF / CSRT は opencv_contrib にあり、本ビルドには同梱されて�?な�?�?

//  cv4_tracker_create_mil tid
CV4_EXPORT int __stdcall cv4_tracker_create_mil(int tid)
{
    try {
        cv::Ptr<cv::Tracker> t = cv::TrackerMIL::create();
        hspcv4::tracker_set(tid, t);
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_tracker_create_mil: unknown"); }
}

//  cv4_tracker_init tid, img_id, x, y, w, h
CV4_EXPORT int __stdcall cv4_tracker_init(int tid, int img_id, int x, int y, int w, int h)
{
    try {
        auto* t = hspcv4::tracker_get(tid);
        if (!t || t->empty()) return fail("cv4_tracker_init: invalid tracker");
        cv::Mat* img = hspcv4::handle_get(img_id);
        if (!img || img->empty()) return fail("cv4_tracker_init: invalid image");
        (*t)->init(*img, cv::Rect(x, y, w, h));
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_tracker_init: unknown"); }
}

//  cv4_tracker_update tid, img_id, var_x, var_y, var_w, var_h
//    stat: 0=成功, -1=ロス�?
CV4_EXPORT int __stdcall cv4_tracker_update(int tid, int img_id,
                                            int* out_x, int* out_y,
                                            int* out_w, int* out_h)
{
    try {
        if (!out_x || !out_y || !out_w || !out_h)
            return fail("cv4_tracker_update: null var");
        auto* t = hspcv4::tracker_get(tid);
        if (!t || t->empty()) return fail("cv4_tracker_update: invalid tracker");
        cv::Mat* img = hspcv4::handle_get(img_id);
        if (!img || img->empty()) return fail("cv4_tracker_update: invalid image");
        cv::Rect box;
        bool ok = (*t)->update(*img, box);
        *out_x = box.x; *out_y = box.y;
        *out_w = box.width; *out_h = box.height;
        return ok ? 0 : -1;   // -1 で stat=1 (ロスト扱�?)
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_tracker_update: unknown"); }
}

//  cv4_tracker_free tid
CV4_EXPORT int __stdcall cv4_tracker_free(int id)
{
    hspcv4::tracker_free(id);
    return 0;
}


//============================================================================
//  Photo : denoising / inpaint / bilateral / seamless clone / decolor
//============================================================================

//  cv4_bilateral dst, src, d, sigma_color, sigma_space
CV4_EXPORT int __stdcall cv4_bilateral(int dst_id, int src_id, int d, double sc, double ss)
{
    try {
        cv::Mat* src = hspcv4::handle_get(src_id);
        if (!src || src->empty()) return fail("cv4_bilateral: invalid source");
        // bilateralFilter は 4ch 入力を受け付けな�?ので�?ずアルファ�?離
        cv::Mat out;
        with_alpha_preserved(*src, out, [&](const cv::Mat& in, cv::Mat& o) {
            cv::bilateralFilter(in, o, d, sc, ss);
        });
        hspcv4::handle_set(dst_id, std::move(out));
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_bilateral: unknown"); }
}

//  cv4_denoise dst, src, h, template_window, search_window
//    カラー画像用: fastNlMeansDenoisingColored / グレーな�? fastNlMeansDenoising
CV4_EXPORT int __stdcall cv4_denoise(int dst_id, int src_id, double h, int tw, int sw)
{
    try {
        cv::Mat* src = hspcv4::handle_get(src_id);
        if (!src || src->empty()) return fail("cv4_denoise: invalid source");
        cv::Mat out;
        if (src->channels() == 1) {
            cv::fastNlMeansDenoising(*src, out, (float)h, tw, sw);
        } else {
            cv::fastNlMeansDenoisingColored(*src, out, (float)h, (float)h, tw, sw);
        }
        hspcv4::handle_set(dst_id, std::move(out));
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_denoise: unknown"); }
}

//  cv4_inpaint dst, src, mask, radius, method
//    mask: 1ch binary�?�? 0 ピクセルが修復対象
CV4_EXPORT int __stdcall cv4_inpaint(int dst_id, int src_id, int mask_id, double r, int method)
{
    try {
        cv::Mat* src  = hspcv4::handle_get(src_id);
        cv::Mat* mask = hspcv4::handle_get(mask_id);
        if (!src || src->empty()) return fail("cv4_inpaint: invalid source");
        if (!mask || mask->empty()) return fail("cv4_inpaint: invalid mask");
        cv::Mat out;
        cv::inpaint(*src, *mask, out, r, method);
        hspcv4::handle_set(dst_id, std::move(out));
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_inpaint: unknown"); }
}

//  cv4_seamless_clone dst, src, dst_base, mask, cx, cy, flags
CV4_EXPORT int __stdcall cv4_seamless_clone(int dst_id, int src_id, int dst_base_id,
                                            int mask_id, int cx, int cy, int flags)
{
    try {
        cv::Mat* src  = hspcv4::handle_get(src_id);
        cv::Mat* base = hspcv4::handle_get(dst_base_id);
        cv::Mat* mask = hspcv4::handle_get(mask_id);
        if (!src || src->empty()) return fail("cv4_seamless_clone: invalid source");
        if (!base || base->empty()) return fail("cv4_seamless_clone: invalid base");
        if (!mask || mask->empty()) return fail("cv4_seamless_clone: invalid mask");
        cv::Mat out;
        cv::seamlessClone(*src, *base, *mask, cv::Point(cx, cy), out, flags);
        hspcv4::handle_set(dst_id, std::move(out));
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_seamless_clone: unknown"); }
}

//  cv4_decolor dst_gray, src
CV4_EXPORT int __stdcall cv4_decolor(int dst_id, int src_id)
{
    try {
        cv::Mat* src = hspcv4::handle_get(src_id);
        if (!src || src->empty()) return fail("cv4_decolor: invalid source");
        cv::Mat gray_out, boost;
        cv::decolor(*src, gray_out, boost);
        hspcv4::handle_set(dst_id, std::move(gray_out));
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_decolor: unknown"); }
}

//  cv4_detail_enhance dst, src, sigma_s, sigma_r
CV4_EXPORT int __stdcall cv4_detail_enhance(int dst_id, int src_id, double ss, double sr)
{
    try {
        cv::Mat* src = hspcv4::handle_get(src_id);
        if (!src || src->empty()) return fail("cv4_detail_enhance: invalid source");
        cv::Mat out;
        cv::detailEnhance(*src, out, (float)ss, (float)sr);
        hspcv4::handle_set(dst_id, std::move(out));
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_detail_enhance: unknown"); }
}

//  cv4_edge_preserve dst, src, flags, sigma_s, sigma_r
CV4_EXPORT int __stdcall cv4_edge_preserve(int dst_id, int src_id, int flags,
                                           double ss, double sr)
{
    try {
        cv::Mat* src = hspcv4::handle_get(src_id);
        if (!src || src->empty()) return fail("cv4_edge_preserve: invalid source");
        cv::Mat out;
        cv::edgePreservingFilter(*src, out, flags, (float)ss, (float)sr);
        hspcv4::handle_set(dst_id, std::move(out));
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_edge_preserve: unknown"); }
}

//  cv4_stylization dst, src, sigma_s, sigma_r
CV4_EXPORT int __stdcall cv4_stylization(int dst_id, int src_id, double ss, double sr)
{
    try {
        cv::Mat* src = hspcv4::handle_get(src_id);
        if (!src || src->empty()) return fail("cv4_stylization: invalid source");
        cv::Mat out;
        cv::stylization(*src, out, (float)ss, (float)sr);
        hspcv4::handle_set(dst_id, std::move(out));
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_stylization: unknown"); }
}

//  cv4_pencil_sketch dst_gray, dst_color, src, sigma_s, sigma_r, shade
CV4_EXPORT int __stdcall cv4_pencil_sketch(int dst_gray_id, int dst_color_id, int src_id,
                                           double ss, double sr, double shade)
{
    try {
        cv::Mat* src = hspcv4::handle_get(src_id);
        if (!src || src->empty()) return fail("cv4_pencil_sketch: invalid source");
        cv::Mat gray_out, color_out;
        cv::pencilSketch(*src, gray_out, color_out, (float)ss, (float)sr, (float)shade);
        hspcv4::handle_set(dst_gray_id, std::move(gray_out));
        hspcv4::handle_set(dst_color_id, std::move(color_out));
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_pencil_sketch: unknown"); }
}


//============================================================================
//  Features2D : ORB / AKAZE / SIFT / keypoint detection / descriptor matching
//============================================================================

// --- 検�?�器 (ORB/AKAZE/SIFT は detectAndCompute で一括) ---

//  cv4_orb_detect_compute kp_id, desc_id, img_id, nfeatures
CV4_EXPORT int __stdcall cv4_orb_detect_compute(int kp_id, int desc_id, int img_id, int nfeat)
{
    try {
        cv::Mat* img = hspcv4::handle_get(img_id);
        if (!img || img->empty()) return fail("cv4_orb_detect_compute: invalid image");
        cv::Mat gray = (img->channels() == 1) ? *img : cv::Mat();
        if (gray.empty()) cv::cvtColor(as_bgr(*img), gray, cv::COLOR_BGR2GRAY);
        auto orb = cv::ORB::create(nfeat);
        hspcv4::KeyPointSet kps;
        cv::Mat desc;
        orb->detectAndCompute(gray, cv::noArray(), kps, desc);
        hspcv4::kps_set(kp_id, std::move(kps));
        hspcv4::handle_set(desc_id, std::move(desc));
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_orb_detect_compute: unknown"); }
}

//  cv4_akaze_detect_compute kp_id, desc_id, img_id
CV4_EXPORT int __stdcall cv4_akaze_detect_compute(int kp_id, int desc_id, int img_id)
{
    try {
        cv::Mat* img = hspcv4::handle_get(img_id);
        if (!img || img->empty()) return fail("cv4_akaze_detect_compute: invalid image");
        cv::Mat gray = (img->channels() == 1) ? *img : cv::Mat();
        if (gray.empty()) cv::cvtColor(as_bgr(*img), gray, cv::COLOR_BGR2GRAY);
        auto akaze = cv::AKAZE::create();
        hspcv4::KeyPointSet kps;
        cv::Mat desc;
        akaze->detectAndCompute(gray, cv::noArray(), kps, desc);
        hspcv4::kps_set(kp_id, std::move(kps));
        hspcv4::handle_set(desc_id, std::move(desc));
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_akaze_detect_compute: unknown"); }
}

//  cv4_sift_detect_compute kp_id, desc_id, img_id, nfeatures
CV4_EXPORT int __stdcall cv4_sift_detect_compute(int kp_id, int desc_id, int img_id, int nfeat)
{
    try {
        cv::Mat* img = hspcv4::handle_get(img_id);
        if (!img || img->empty()) return fail("cv4_sift_detect_compute: invalid image");
        cv::Mat gray = (img->channels() == 1) ? *img : cv::Mat();
        if (gray.empty()) cv::cvtColor(as_bgr(*img), gray, cv::COLOR_BGR2GRAY);
        auto sift = cv::SIFT::create(nfeat);
        hspcv4::KeyPointSet kps;
        cv::Mat desc;
        sift->detectAndCompute(gray, cv::noArray(), kps, desc);
        hspcv4::kps_set(kp_id, std::move(kps));
        hspcv4::handle_set(desc_id, std::move(desc));
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_sift_detect_compute: unknown"); }
}

//  cv4_good_features_to_track kp_id, img_id, max_corners, quality, min_distance
CV4_EXPORT int __stdcall cv4_good_features_to_track(int kp_id, int img_id,
                                                    int max_c, double qlevel, double mindis)
{
    try {
        cv::Mat* img = hspcv4::handle_get(img_id);
        if (!img || img->empty()) return fail("cv4_good_features_to_track: invalid image");
        cv::Mat gray = (img->channels() == 1) ? *img : cv::Mat();
        if (gray.empty()) cv::cvtColor(as_bgr(*img), gray, cv::COLOR_BGR2GRAY);
        std::vector<cv::Point2f> corners;
        cv::goodFeaturesToTrack(gray, corners, max_c, qlevel, mindis);
        hspcv4::KeyPointSet kps;
        kps.reserve(corners.size());
        for (auto& p : corners) kps.emplace_back(p, 5.0f);
        hspcv4::kps_set(kp_id, std::move(kps));
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_good_features_to_track: unknown"); }
}

//  cv4_corner_harris dst, src, block_size, ksize, k
CV4_EXPORT int __stdcall cv4_corner_harris(int dst_id, int src_id,
                                           int block, int ksize, double k)
{
    try {
        cv::Mat* src = hspcv4::handle_get(src_id);
        if (!src || src->empty()) return fail("cv4_corner_harris: invalid source");
        cv::Mat gray = (src->channels() == 1) ? *src : cv::Mat();
        if (gray.empty()) cv::cvtColor(as_bgr(*src), gray, cv::COLOR_BGR2GRAY);
        cv::Mat out;
        cv::cornerHarris(gray, out, block, ksize, k);
        hspcv4::handle_set(dst_id, std::move(out));
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_corner_harris: unknown"); }
}

// --- マッチング ---

//  cv4_bf_match match_id, desc1_id, desc2_id, norm_type
//    norm_type: 4=NORM_L2, 5=NORM_L1, 6=NORM_HAMMING, 7=NORM_HAMMING2
//    ORB/AKAZE は Hamming、SIFT は L2 を使�?�?
CV4_EXPORT int __stdcall cv4_bf_match(int match_id, int d1_id, int d2_id, int nt)
{
    try {
        cv::Mat* d1 = hspcv4::handle_get(d1_id);
        cv::Mat* d2 = hspcv4::handle_get(d2_id);
        if (!d1 || !d2 || d1->empty() || d2->empty())
            return fail("cv4_bf_match: invalid descriptors");
        cv::BFMatcher matcher(nt, true);  // crossCheck=true
        hspcv4::MatchSet ms;
        matcher.match(*d1, *d2, ms);
        hspcv4::matches_set(match_id, std::move(ms));
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_bf_match: unknown"); }
}

// --- キーポイン�?/マッ�? アクセ�?サ ---

//  cv4_kp_free kp_id
CV4_EXPORT int __stdcall cv4_kp_free(int id)
{
    hspcv4::kps_free(id);
    return 0;
}

//  cv4_kp_count kp_id, var_n
CV4_EXPORT int __stdcall cv4_kp_count(int id, int* out_n)
{
    try {
        if (!out_n) return fail("cv4_kp_count: null var");
        auto* kps = hspcv4::kps_get(id);
        if (!kps) return fail("cv4_kp_count: invalid kp set");
        *out_n = (int)kps->size();
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_kp_count: unknown"); }
}

//  cv4_kp_get kp_id, idx, var_x_x10, var_y_x10, var_size_x10, var_angle_x100, var_response_x10000
CV4_EXPORT int __stdcall cv4_kp_get(int id, int idx,
                                    int* out_x, int* out_y, int* out_size,
                                    int* out_angle, int* out_response)
{
    try {
        if (!out_x || !out_y || !out_size || !out_angle || !out_response)
            return fail("cv4_kp_get: null var");
        auto* kps = hspcv4::kps_get(id);
        if (!kps || idx < 0 || idx >= (int)kps->size())
            return fail("cv4_kp_get: out of range");
        const auto& kp = (*kps)[idx];
        *out_x        = (int)(kp.pt.x * 10.0f);
        *out_y        = (int)(kp.pt.y * 10.0f);
        *out_size     = (int)(kp.size * 10.0f);
        *out_angle    = (int)(kp.angle * 100.0f);
        *out_response = (int)(kp.response * 10000.0f);
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_kp_get: unknown"); }
}

//  cv4_match_free match_id
CV4_EXPORT int __stdcall cv4_match_free(int id)
{
    hspcv4::matches_free(id);
    return 0;
}

//  cv4_match_count match_id, var_n
CV4_EXPORT int __stdcall cv4_match_count(int id, int* out_n)
{
    try {
        if (!out_n) return fail("cv4_match_count: null var");
        auto* ms = hspcv4::matches_get(id);
        if (!ms) return fail("cv4_match_count: invalid match set");
        *out_n = (int)ms->size();
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_match_count: unknown"); }
}

//  cv4_match_get match_id, idx, var_query, var_train, var_distance_x10000
CV4_EXPORT int __stdcall cv4_match_get(int id, int idx,
                                       int* out_query, int* out_train, int* out_distance)
{
    try {
        if (!out_query || !out_train || !out_distance)
            return fail("cv4_match_get: null var");
        auto* ms = hspcv4::matches_get(id);
        if (!ms || idx < 0 || idx >= (int)ms->size())
            return fail("cv4_match_get: out of range");
        const auto& m = (*ms)[idx];
        *out_query    = m.queryIdx;
        *out_train    = m.trainIdx;
        *out_distance = (int)(m.distance * 10000.0f);
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_match_get: unknown"); }
}

// --- 描画 ---

//  cv4_draw_keypoints dst, src, kp_id, flags
CV4_EXPORT int __stdcall cv4_draw_keypoints(int dst_id, int src_id, int kp_id, int flags)
{
    try {
        cv::Mat* src = hspcv4::handle_get(src_id);
        if (!src || src->empty()) return fail("cv4_draw_keypoints: invalid source");
        auto* kps = hspcv4::kps_get(kp_id);
        if (!kps) return fail("cv4_draw_keypoints: invalid kp set");
        cv::Mat out;
        cv::drawKeypoints(*src, *kps, out, cv::Scalar::all(-1),
                          (cv::DrawMatchesFlags)flags);
        hspcv4::handle_set(dst_id, std::move(out));
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_draw_keypoints: unknown"); }
}

//  cv4_draw_matches dst, img1, kp1, img2, kp2, match_id
CV4_EXPORT int __stdcall cv4_draw_matches(int dst_id, int img1_id, int kp1_id,
                                          int img2_id, int kp2_id, int match_id)
{
    try {
        cv::Mat* img1 = hspcv4::handle_get(img1_id);
        cv::Mat* img2 = hspcv4::handle_get(img2_id);
        auto* kp1 = hspcv4::kps_get(kp1_id);
        auto* kp2 = hspcv4::kps_get(kp2_id);
        auto* ms  = hspcv4::matches_get(match_id);
        if (!img1 || !img2 || img1->empty() || img2->empty())
            return fail("cv4_draw_matches: invalid images");
        if (!kp1 || !kp2 || !ms)
            return fail("cv4_draw_matches: invalid kp/match sets");
        cv::Mat out;
        cv::drawMatches(*img1, *kp1, *img2, *kp2, *ms, out);
        hspcv4::handle_set(dst_id, std::move(out));
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_draw_matches: unknown"); }
}


//============================================================================
//  Contours : findContours / drawContours / shape analysis
//  contour set handle は std::vector<std::vector<cv::Point>> を保持する
//  専用のハンドル型。各輪郭には 0-based イン�?�?クスでアクセスする�?
//============================================================================

//  cv4_find_contours contours_id, src_id, mode, method
//    src は 2 値画�? (グレースケール or CV_8U)
CV4_EXPORT int __stdcall cv4_find_contours(int cid, int src_id, int mode, int method)
{
    try {
        cv::Mat* src = hspcv4::handle_get(src_id);
        if (!src || src->empty()) return fail("cv4_find_contours: invalid source");
        cv::Mat gray = (src->channels() == 1) ? *src : cv::Mat();
        if (gray.empty()) cv::cvtColor(as_bgr(*src), gray, cv::COLOR_BGR2GRAY);
        hspcv4::ContourSet cs;
        cv::findContours(gray, cs, mode, method);
        hspcv4::contours_set(cid, std::move(cs));
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_find_contours: unknown"); }
}

//  cv4_find_contours_hier cid, hierarchy_mat_id, src_id, mode, method
//    階層�?報付きの findContours。hierarchy_mat_id には Nx1x4 CV_32SC4 の Mat
//    が格納される。各輪郭に対して [next, prev, first_child, parent] の
//    イン�?�?クス (なし�?� -1) が記録される�?
CV4_EXPORT int __stdcall cv4_find_contours_hier(int cid, int hier_id, int src_id,
                                                int mode, int method)
{
    try {
        cv::Mat* src = hspcv4::handle_get(src_id);
        if (!src || src->empty()) return fail("cv4_find_contours_hier: invalid source");
        cv::Mat gray = (src->channels() == 1) ? *src : cv::Mat();
        if (gray.empty()) cv::cvtColor(as_bgr(*src), gray, cv::COLOR_BGR2GRAY);
        hspcv4::ContourSet cs;
        std::vector<cv::Vec4i> hierarchy;
        cv::findContours(gray, cs, hierarchy, mode, method);
        hspcv4::contours_set(cid, std::move(cs));
        // hierarchy �? Nx4 CV_32S Mat に詰める (cv4_mat_geti でアクセス可能)
        cv::Mat hmat((int)hierarchy.size(), 4, CV_32S);
        for (size_t i = 0; i < hierarchy.size(); ++i) {
            hmat.at<int>((int)i, 0) = hierarchy[i][0];  // next
            hmat.at<int>((int)i, 1) = hierarchy[i][1];  // prev
            hmat.at<int>((int)i, 2) = hierarchy[i][2];  // first child
            hmat.at<int>((int)i, 3) = hierarchy[i][3];  // parent
        }
        hspcv4::handle_set(hier_id, std::move(hmat));
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_find_contours_hier: unknown"); }
}

//  cv4_contour_hier_get hier_mat_id, idx, var_next, var_prev, var_child, var_parent
//    階層�?報�? 4 つの int 変数で取�? (上�? cv4_find_contours_hier で作っ�? hmat 専用)
CV4_EXPORT int __stdcall cv4_contour_hier_get(int hier_id, int idx,
                                              int* out_next, int* out_prev,
                                              int* out_child, int* out_parent)
{
    try {
        if (!out_next || !out_prev || !out_child || !out_parent)
            return fail("cv4_contour_hier_get: null var");
        cv::Mat* h = hspcv4::handle_get(hier_id);
        if (!h || h->empty()) return fail("cv4_contour_hier_get: invalid hierarchy");
        if (idx < 0 || idx >= h->rows) return fail("cv4_contour_hier_get: idx out of range");
        if (h->cols != 4 || h->type() != CV_32S)
            return fail("cv4_contour_hier_get: not a hierarchy Mat (Nx4 CV_32S)");
        *out_next   = h->at<int>(idx, 0);
        *out_prev   = h->at<int>(idx, 1);
        *out_child  = h->at<int>(idx, 2);
        *out_parent = h->at<int>(idx, 3);
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_contour_hier_get: unknown"); }
}

//  cv4_contours_free cid
CV4_EXPORT int __stdcall cv4_contours_free(int cid)
{
    hspcv4::contours_free(cid);
    return 0;
}

//  cv4_contours_count cid, var_count
CV4_EXPORT int __stdcall cv4_contours_count(int cid, int* out_n)
{
    try {
        if (!out_n) return fail("cv4_contours_count: null var");
        auto* cs = hspcv4::contours_get(cid);
        if (!cs) return fail("cv4_contours_count: invalid contour set");
        *out_n = (int)cs->size();
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_contours_count: unknown"); }
}

//  cv4_draw_contours dst_id, cid, index, b, g, r, thickness
//    index = -1 で全輪郭を描画
CV4_EXPORT int __stdcall cv4_draw_contours(int dst_id, int cid, int idx,
                                           int b, int g, int r, int thick)
{
    try {
        cv::Mat* dst = hspcv4::handle_get(dst_id);
        if (!dst || dst->empty()) return fail("cv4_draw_contours: invalid dst");
        auto* cs = hspcv4::contours_get(cid);
        if (!cs) return fail("cv4_draw_contours: invalid contour set");
        cv::drawContours(*dst, *cs, idx, cv::Scalar(b, g, r), thick);
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_draw_contours: unknown"); }
}

//  cv4_contour_area cid, index, var_area
CV4_EXPORT int __stdcall cv4_contour_area(int cid, int idx, int* out_area)
{
    try {
        if (!out_area) return fail("cv4_contour_area: null var");
        auto* cs = hspcv4::contours_get(cid);
        if (!cs || idx < 0 || idx >= (int)cs->size())
            return fail("cv4_contour_area: out of range");
        double area = cv::contourArea((*cs)[idx]);
        *out_area = (int)area;  // 面積�?�大きい値になりがちなので固定小数点でなく整数
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_contour_area: unknown"); }
}

//  cv4_contour_length cid, index, closed, var_len_x100
CV4_EXPORT int __stdcall cv4_contour_length(int cid, int idx, int closed, int* out_len)
{
    try {
        if (!out_len) return fail("cv4_contour_length: null var");
        auto* cs = hspcv4::contours_get(cid);
        if (!cs || idx < 0 || idx >= (int)cs->size())
            return fail("cv4_contour_length: out of range");
        double len = cv::arcLength((*cs)[idx], closed != 0);
        *out_len = (int)(len * 100.0);   // x100 固定小数点
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_contour_length: unknown"); }
}

//  cv4_bounding_rect cid, index, var_x, var_y, var_w, var_h
CV4_EXPORT int __stdcall cv4_bounding_rect(int cid, int idx,
                                           int* out_x, int* out_y,
                                           int* out_w, int* out_h)
{
    try {
        if (!out_x || !out_y || !out_w || !out_h)
            return fail("cv4_bounding_rect: null var");
        auto* cs = hspcv4::contours_get(cid);
        if (!cs || idx < 0 || idx >= (int)cs->size())
            return fail("cv4_bounding_rect: out of range");
        cv::Rect r = cv::boundingRect((*cs)[idx]);
        *out_x = r.x; *out_y = r.y; *out_w = r.width; *out_h = r.height;
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_bounding_rect: unknown"); }
}

//  cv4_min_area_rect cid, index, var_cx_x10, var_cy_x10, var_w_x10, var_h_x10, var_angle_x100
//    回転矩形の中�? (double) と�?高さ (double) は x10 固定小数点、角度は x100�?
CV4_EXPORT int __stdcall cv4_min_area_rect(int cid, int idx,
                                           int* out_cx, int* out_cy,
                                           int* out_w, int* out_h, int* out_angle)
{
    try {
        if (!out_cx || !out_cy || !out_w || !out_h || !out_angle)
            return fail("cv4_min_area_rect: null var");
        auto* cs = hspcv4::contours_get(cid);
        if (!cs || idx < 0 || idx >= (int)cs->size())
            return fail("cv4_min_area_rect: out of range");
        cv::RotatedRect rr = cv::minAreaRect((*cs)[idx]);
        *out_cx    = (int)(rr.center.x * 10.0);
        *out_cy    = (int)(rr.center.y * 10.0);
        *out_w     = (int)(rr.size.width * 10.0);
        *out_h     = (int)(rr.size.height * 10.0);
        *out_angle = (int)(rr.angle * 100.0);
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_min_area_rect: unknown"); }
}

//  cv4_min_enclosing_circle cid, index, var_cx_x10, var_cy_x10, var_r_x10
CV4_EXPORT int __stdcall cv4_min_enclosing_circle(int cid, int idx,
                                                  int* out_cx, int* out_cy, int* out_r)
{
    try {
        if (!out_cx || !out_cy || !out_r)
            return fail("cv4_min_enclosing_circle: null var");
        auto* cs = hspcv4::contours_get(cid);
        if (!cs || idx < 0 || idx >= (int)cs->size())
            return fail("cv4_min_enclosing_circle: out of range");
        cv::Point2f center;
        float radius = 0;
        cv::minEnclosingCircle((*cs)[idx], center, radius);
        *out_cx = (int)(center.x * 10.0f);
        *out_cy = (int)(center.y * 10.0f);
        *out_r  = (int)(radius * 10.0f);
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_min_enclosing_circle: unknown"); }
}

//  cv4_approx_poly_dp cid_src, index, cid_dst, epsilon, closed
//    cid_dst: 結果を格納する新しい contour set (単一の輪郭を含む)
CV4_EXPORT int __stdcall cv4_approx_poly_dp(int cid_src, int idx, int cid_dst,
                                            double eps, int closed)
{
    try {
        auto* cs = hspcv4::contours_get(cid_src);
        if (!cs || idx < 0 || idx >= (int)cs->size())
            return fail("cv4_approx_poly_dp: out of range");
        std::vector<cv::Point> approx;
        cv::approxPolyDP((*cs)[idx], approx, eps, closed != 0);
        hspcv4::ContourSet out;
        out.push_back(std::move(approx));
        hspcv4::contours_set(cid_dst, std::move(out));
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_approx_poly_dp: unknown"); }
}

//  cv4_convex_hull cid_src, index, cid_dst
CV4_EXPORT int __stdcall cv4_convex_hull(int cid_src, int idx, int cid_dst)
{
    try {
        auto* cs = hspcv4::contours_get(cid_src);
        if (!cs || idx < 0 || idx >= (int)cs->size())
            return fail("cv4_convex_hull: out of range");
        std::vector<cv::Point> hull;
        cv::convexHull((*cs)[idx], hull);
        hspcv4::ContourSet out;
        out.push_back(std::move(hull));
        hspcv4::contours_set(cid_dst, std::move(out));
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_convex_hull: unknown"); }
}

//  cv4_contour_point cid, idx, point_idx, var_x, var_y
//    特定�?�輪郭の特定�?�頂点座標を取�?
CV4_EXPORT int __stdcall cv4_contour_point(int cid, int idx, int pt_idx,
                                           int* out_x, int* out_y)
{
    try {
        if (!out_x || !out_y) return fail("cv4_contour_point: null var");
        auto* cs = hspcv4::contours_get(cid);
        if (!cs || idx < 0 || idx >= (int)cs->size())
            return fail("cv4_contour_point: contour out of range");
        const auto& poly = (*cs)[idx];
        if (pt_idx < 0 || pt_idx >= (int)poly.size())
            return fail("cv4_contour_point: point out of range");
        *out_x = poly[pt_idx].x;
        *out_y = poly[pt_idx].y;
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_contour_point: unknown"); }
}

//  cv4_contour_size cid, idx, var_n
CV4_EXPORT int __stdcall cv4_contour_size(int cid, int idx, int* out_n)
{
    try {
        if (!out_n) return fail("cv4_contour_size: null var");
        auto* cs = hspcv4::contours_get(cid);
        if (!cs || idx < 0 || idx >= (int)cs->size())
            return fail("cv4_contour_size: out of range");
        *out_n = (int)(*cs)[idx].size();
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_contour_size: unknown"); }
}

//  cv4_moments cid, idx, var_cx_x10, var_cy_x10, var_m00
//    重�? (double) �? x10 固定小数点�?面�? m00 を整数で返す�?
CV4_EXPORT int __stdcall cv4_moments(int cid, int idx,
                                     int* out_cx, int* out_cy, int* out_m00)
{
    try {
        if (!out_cx || !out_cy || !out_m00) return fail("cv4_moments: null var");
        auto* cs = hspcv4::contours_get(cid);
        if (!cs || idx < 0 || idx >= (int)cs->size())
            return fail("cv4_moments: out of range");
        cv::Moments m = cv::moments((*cs)[idx]);
        if (m.m00 > 0.0) {
            *out_cx = (int)((m.m10 / m.m00) * 10.0);
            *out_cy = (int)((m.m01 / m.m00) * 10.0);
        } else {
            *out_cx = 0; *out_cy = 0;
        }
        *out_m00 = (int)m.m00;
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_moments: unknown"); }
}


//============================================================================
//  Core Mat operations : arithmetic / bitwise / statistics / channels
//============================================================================

// --- 算術演�? ---

//  cv4_add         dst, a_id, b_id
CV4_EXPORT int __stdcall cv4_add(int dst, int aid, int bid)
{
    try {
        cv::Mat* a = hspcv4::handle_get(aid);
        cv::Mat* b = hspcv4::handle_get(bid);
        if (!a || !b || a->empty() || b->empty()) return fail("cv4_add: invalid input");
        cv::Mat out;
        cv::add(*a, *b, out);
        hspcv4::handle_set(dst, std::move(out));
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_add: unknown"); }
}

//  cv4_sub         dst, a_id, b_id
CV4_EXPORT int __stdcall cv4_sub(int dst, int aid, int bid)
{
    try {
        cv::Mat* a = hspcv4::handle_get(aid);
        cv::Mat* b = hspcv4::handle_get(bid);
        if (!a || !b || a->empty() || b->empty()) return fail("cv4_sub: invalid input");
        cv::Mat out;
        cv::subtract(*a, *b, out);
        hspcv4::handle_set(dst, std::move(out));
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_sub: unknown"); }
}

//  cv4_mul         dst, a_id, b_id, scale
CV4_EXPORT int __stdcall cv4_mul(int dst, int aid, int bid, double scale)
{
    try {
        cv::Mat* a = hspcv4::handle_get(aid);
        cv::Mat* b = hspcv4::handle_get(bid);
        if (!a || !b || a->empty() || b->empty()) return fail("cv4_mul: invalid input");
        cv::Mat out;
        cv::multiply(*a, *b, out, scale);
        hspcv4::handle_set(dst, std::move(out));
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_mul: unknown"); }
}

//  cv4_div         dst, a_id, b_id, scale
CV4_EXPORT int __stdcall cv4_div(int dst, int aid, int bid, double scale)
{
    try {
        cv::Mat* a = hspcv4::handle_get(aid);
        cv::Mat* b = hspcv4::handle_get(bid);
        if (!a || !b || a->empty() || b->empty()) return fail("cv4_div: invalid input");
        cv::Mat out;
        cv::divide(*a, *b, out, scale);
        hspcv4::handle_set(dst, std::move(out));
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_div: unknown"); }
}

//  cv4_abs_diff    dst, a_id, b_id
CV4_EXPORT int __stdcall cv4_abs_diff(int dst, int aid, int bid)
{
    try {
        cv::Mat* a = hspcv4::handle_get(aid);
        cv::Mat* b = hspcv4::handle_get(bid);
        if (!a || !b || a->empty() || b->empty()) return fail("cv4_abs_diff: invalid input");
        cv::Mat out;
        cv::absdiff(*a, *b, out);
        hspcv4::handle_set(dst, std::move(out));
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_abs_diff: unknown"); }
}

//  cv4_add_weighted dst, a_id, alpha, b_id, beta, gamma
//    alpha, beta, gamma は double
CV4_EXPORT int __stdcall cv4_add_weighted(int dst, int aid, double alpha,
                                          int bid, double beta, double gamma)
{
    try {
        cv::Mat* a = hspcv4::handle_get(aid);
        cv::Mat* b = hspcv4::handle_get(bid);
        if (!a || !b || a->empty() || b->empty()) return fail("cv4_add_weighted: invalid input");
        cv::Mat out;
        cv::addWeighted(*a, alpha, *b, beta, gamma, out);
        hspcv4::handle_set(dst, std::move(out));
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_add_weighted: unknown"); }
}

// --- スカラー演�? (定数�? Mat に加算�?) ---

//  cv4_add_scalar dst, src, s_b, s_g, s_r
CV4_EXPORT int __stdcall cv4_add_scalar(int dst, int src, double sb, double sg, double sr)
{
    try {
        cv::Mat* s = hspcv4::handle_get(src);
        if (!s || s->empty()) return fail("cv4_add_scalar: invalid source");
        cv::Mat out;
        cv::add(*s, cv::Scalar(sb, sg, sr), out);
        hspcv4::handle_set(dst, std::move(out));
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_add_scalar: unknown"); }
}

//  cv4_mul_scalar dst, src, scale
CV4_EXPORT int __stdcall cv4_mul_scalar(int dst, int src, double scale)
{
    try {
        cv::Mat* s = hspcv4::handle_get(src);
        if (!s || s->empty()) return fail("cv4_mul_scalar: invalid source");
        cv::Mat out;
        (*s).convertTo(out, -1, scale, 0);
        hspcv4::handle_set(dst, std::move(out));
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_mul_scalar: unknown"); }
}

// --- ビット演�? ---

//  cv4_bit_and dst, a, b
CV4_EXPORT int __stdcall cv4_bit_and(int dst, int aid, int bid)
{
    try {
        cv::Mat* a = hspcv4::handle_get(aid);
        cv::Mat* b = hspcv4::handle_get(bid);
        if (!a || !b || a->empty() || b->empty()) return fail("cv4_bit_and: invalid input");
        cv::Mat out;
        cv::bitwise_and(*a, *b, out);
        hspcv4::handle_set(dst, std::move(out));
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_bit_and: unknown"); }
}

//  cv4_bit_or dst, a, b
CV4_EXPORT int __stdcall cv4_bit_or(int dst, int aid, int bid)
{
    try {
        cv::Mat* a = hspcv4::handle_get(aid);
        cv::Mat* b = hspcv4::handle_get(bid);
        if (!a || !b || a->empty() || b->empty()) return fail("cv4_bit_or: invalid input");
        cv::Mat out;
        cv::bitwise_or(*a, *b, out);
        hspcv4::handle_set(dst, std::move(out));
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_bit_or: unknown"); }
}

//  cv4_bit_xor dst, a, b
CV4_EXPORT int __stdcall cv4_bit_xor(int dst, int aid, int bid)
{
    try {
        cv::Mat* a = hspcv4::handle_get(aid);
        cv::Mat* b = hspcv4::handle_get(bid);
        if (!a || !b || a->empty() || b->empty()) return fail("cv4_bit_xor: invalid input");
        cv::Mat out;
        cv::bitwise_xor(*a, *b, out);
        hspcv4::handle_set(dst, std::move(out));
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_bit_xor: unknown"); }
}

//  cv4_bit_not dst, src
CV4_EXPORT int __stdcall cv4_bit_not(int dst, int src)
{
    try {
        cv::Mat* s = hspcv4::handle_get(src);
        if (!s || s->empty()) return fail("cv4_bit_not: invalid source");
        cv::Mat out;
        cv::bitwise_not(*s, out);
        hspcv4::handle_set(dst, std::move(out));
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_bit_not: unknown"); }
}

// --- 比�? ---

//  cv4_compare dst, a, b, cmpop
//    cmpop: 0=EQ, 1=GT, 2=GE, 3=LT, 4=LE, 5=NE (cv::CmpTypes に対�?)
CV4_EXPORT int __stdcall cv4_compare(int dst, int aid, int bid, int op)
{
    try {
        cv::Mat* a = hspcv4::handle_get(aid);
        cv::Mat* b = hspcv4::handle_get(bid);
        if (!a || !b || a->empty() || b->empty()) return fail("cv4_compare: invalid input");
        cv::Mat out;
        cv::compare(*a, *b, out, op);
        hspcv4::handle_set(dst, std::move(out));
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_compare: unknown"); }
}

// --- 統�? ---

//  cv4_mean id, var_mean_b_x10000, var_mean_g_x10000, var_mean_r_x10000
CV4_EXPORT int __stdcall cv4_mean(int id, int* out_b, int* out_g, int* out_r)
{
    try {
        if (!out_b || !out_g || !out_r) return fail("cv4_mean: null var");
        cv::Mat* m = hspcv4::handle_get(id);
        if (!m || m->empty()) return fail("cv4_mean: invalid handle");
        cv::Scalar s = cv::mean(*m);
        *out_b = (int)(s[0] * 10000.0);
        *out_g = (int)(s[1] * 10000.0);
        *out_r = (int)(s[2] * 10000.0);
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_mean: unknown"); }
}

//  cv4_sum id, var_sum_b, var_sum_g, var_sum_r
//    sum はオーバ�?�フローしやすいので x10000 ではな�? 1.0 倍で格�?
CV4_EXPORT int __stdcall cv4_sum(int id, int* out_b, int* out_g, int* out_r)
{
    try {
        if (!out_b || !out_g || !out_r) return fail("cv4_sum: null var");
        cv::Mat* m = hspcv4::handle_get(id);
        if (!m || m->empty()) return fail("cv4_sum: invalid handle");
        cv::Scalar s = cv::sum(*m);
        *out_b = (int)s[0];
        *out_g = (int)s[1];
        *out_r = (int)s[2];
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_sum: unknown"); }
}

//  cv4_count_nonzero id, var_count
CV4_EXPORT int __stdcall cv4_count_nonzero(int id, int* out_count)
{
    try {
        if (!out_count) return fail("cv4_count_nonzero: null var");
        cv::Mat* m = hspcv4::handle_get(id);
        if (!m || m->empty()) return fail("cv4_count_nonzero: invalid handle");
        cv::Mat gray = (m->channels() == 1) ? *m : cv::Mat();
        if (gray.empty()) cv::cvtColor(as_bgr(*m), gray, cv::COLOR_BGR2GRAY);
        *out_count = cv::countNonZero(gray);
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_count_nonzero: unknown"); }
}

// --- チャンネル操�? ---

//  cv4_split src_id, b_id, g_id, r_id
//    3ch 画像を B / G / R の 1ch 画�? 3 枚に�?解
CV4_EXPORT int __stdcall cv4_split(int src_id, int b_id, int g_id, int r_id)
{
    try {
        cv::Mat* s = hspcv4::handle_get(src_id);
        if (!s || s->empty()) return fail("cv4_split: invalid source");
        if (s->channels() != 3) return fail("cv4_split: source must be 3ch");
        std::vector<cv::Mat> chs;
        cv::split(*s, chs);
        hspcv4::handle_set(b_id, std::move(chs[0]));
        hspcv4::handle_set(g_id, std::move(chs[1]));
        hspcv4::handle_set(r_id, std::move(chs[2]));
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_split: unknown"); }
}

//  cv4_merge dst_id, b_id, g_id, r_id
CV4_EXPORT int __stdcall cv4_merge(int dst_id, int b_id, int g_id, int r_id)
{
    try {
        cv::Mat* b = hspcv4::handle_get(b_id);
        cv::Mat* g = hspcv4::handle_get(g_id);
        cv::Mat* r = hspcv4::handle_get(r_id);
        if (!b || !g || !r || b->empty() || g->empty() || r->empty()) {
            return fail("cv4_merge: invalid channel input");
        }
        std::vector<cv::Mat> chs = { *b, *g, *r };
        cv::Mat out;
        cv::merge(chs, out);
        hspcv4::handle_set(dst_id, std::move(out));
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_merge: unknown"); }
}

// --- Mat 作�?? ---

//  cv4_mat_zeros dst, rows, cols, channels
//    channels=1 or 3 の CV_8U を作�?? (全 0)
CV4_EXPORT int __stdcall cv4_mat_zeros(int dst, int rows, int cols, int ch)
{
    try {
        if (ch == 0) ch = 3;  // 省略時�?� 3ch
        int type = (ch == 1) ? CV_8UC1 : CV_8UC3;
        cv::Mat out = cv::Mat::zeros(rows, cols, type);
        hspcv4::handle_set(dst, std::move(out));
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_mat_zeros: unknown"); }
}

//  cv4_mat_full dst, rows, cols, b, g, r
//    3ch CV_8U の Mat �? B,G,R で塗りつぶして作�??
CV4_EXPORT int __stdcall cv4_mat_full(int dst, int rows, int cols, int b, int g, int r)
{
    try {
        cv::Mat out(rows, cols, CV_8UC3, cv::Scalar(b, g, r));
        hspcv4::handle_set(dst, std::move(out));
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_mat_full: unknown"); }
}

// --- マスク操�? ---

//  cv4_copy_masked dst, src, mask
//    mask の�? 0 ピクセル部�?だ�? src �? dst にコピ�?� (dst の他�?�部�?は保持)
CV4_EXPORT int __stdcall cv4_copy_masked(int dst_id, int src_id, int mask_id)
{
    try {
        cv::Mat* dst = hspcv4::handle_get(dst_id);
        cv::Mat* src = hspcv4::handle_get(src_id);
        cv::Mat* msk = hspcv4::handle_get(mask_id);
        if (!src || src->empty()) return fail("cv4_copy_masked: invalid source");
        if (!msk || msk->empty()) return fail("cv4_copy_masked: invalid mask");
        cv::Mat out;
        if (dst && !dst->empty()) {
            out = dst->clone();
        } else {
            out = cv::Mat::zeros(src->size(), src->type());
        }
        src->copyTo(out, *msk);
        hspcv4::handle_set(dst_id, std::move(out));
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_copy_masked: unknown"); }
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
CV4_EXPORT int __stdcall cv4_erode(int dst_id, int src_id, int shape, int ksize, int iter)
{
    if (iter == 0) iter = 1;
    try {
        cv::Mat* src = hspcv4::handle_get(src_id);
        if (!src || src->empty()) return fail("cv4_erode: invalid source");
        cv::Mat k = make_morph_kernel(shape, ksize);
        cv::Mat out;
        with_alpha_preserved(*src, out, [&](const cv::Mat& in, cv::Mat& o) {
            cv::erode(in, o, k, cv::Point(-1,-1), iter);
        });
        hspcv4::handle_set(dst_id, std::move(out));
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_erode: unknown"); }
}

//  cv4_dilate dst, src, shape, ksize [, iterations=1]
CV4_EXPORT int __stdcall cv4_dilate(int dst_id, int src_id, int shape, int ksize, int iter)
{
    if (iter == 0) iter = 1;
    try {
        cv::Mat* src = hspcv4::handle_get(src_id);
        if (!src || src->empty()) return fail("cv4_dilate: invalid source");
        cv::Mat k = make_morph_kernel(shape, ksize);
        cv::Mat out;
        with_alpha_preserved(*src, out, [&](const cv::Mat& in, cv::Mat& o) {
            cv::dilate(in, o, k, cv::Point(-1,-1), iter);
        });
        hspcv4::handle_set(dst_id, std::move(out));
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_dilate: unknown"); }
}

// Shared helper for morphologyEx variants
static int cv4_morph_op(int op, int dst_id, int src_id, int shape, int ksize)
{
    try {
        cv::Mat* src = hspcv4::handle_get(src_id);
        if (!src || src->empty()) return fail("cv4_morph_*: invalid source");
        cv::Mat k = make_morph_kernel(shape, ksize);
        cv::Mat out;
        with_alpha_preserved(*src, out, [&](const cv::Mat& in, cv::Mat& o) {
            cv::morphologyEx(in, o, op, k);
        });
        hspcv4::handle_set(dst_id, std::move(out));
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_morph_*: unknown"); }
}

//  cv4_morph_open      dst, src, shape, ksize
CV4_EXPORT int __stdcall cv4_morph_open(int dst_id, int src_id, int shape, int ksize)
{ return cv4_morph_op(cv::MORPH_OPEN, dst_id, src_id, shape, ksize); }

//  cv4_morph_close     dst, src, shape, ksize
CV4_EXPORT int __stdcall cv4_morph_close(int dst_id, int src_id, int shape, int ksize)
{ return cv4_morph_op(cv::MORPH_CLOSE, dst_id, src_id, shape, ksize); }

//  cv4_morph_gradient  dst, src, shape, ksize
CV4_EXPORT int __stdcall cv4_morph_gradient(int dst_id, int src_id, int shape, int ksize)
{ return cv4_morph_op(cv::MORPH_GRADIENT, dst_id, src_id, shape, ksize); }

//  cv4_morph_tophat    dst, src, shape, ksize
CV4_EXPORT int __stdcall cv4_morph_tophat(int dst_id, int src_id, int shape, int ksize)
{ return cv4_morph_op(cv::MORPH_TOPHAT, dst_id, src_id, shape, ksize); }

//  cv4_morph_blackhat  dst, src, shape, ksize
CV4_EXPORT int __stdcall cv4_morph_blackhat(int dst_id, int src_id, int shape, int ksize)
{ return cv4_morph_op(cv::MORPH_BLACKHAT, dst_id, src_id, shape, ksize); }


//============================================================================
//  Gradient / edge operators : sobel / scharr / laplacian
//============================================================================

//  cv4_sobel dst, src, dx, dy, ksize
CV4_EXPORT int __stdcall cv4_sobel(int dst_id, int src_id, int dx, int dy, int ksize)
{
    if (ksize == 0) ksize = 3;
    try {
        cv::Mat* src = hspcv4::handle_get(src_id);
        if (!src || src->empty()) return fail("cv4_sobel: invalid source");
        cv::Mat abs_out;
        with_alpha_preserved(*src, abs_out, [&](const cv::Mat& in, cv::Mat& o) {
            cv::Mat tmp;
            cv::Sobel(in, tmp, CV_16S, dx, dy, ksize);
            cv::convertScaleAbs(tmp, o);
        });
        hspcv4::handle_set(dst_id, std::move(abs_out));
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_sobel: unknown"); }
}

//  cv4_scharr dst, src, dx, dy
CV4_EXPORT int __stdcall cv4_scharr(int dst_id, int src_id, int dx, int dy)
{
    try {
        cv::Mat* src = hspcv4::handle_get(src_id);
        if (!src || src->empty()) return fail("cv4_scharr: invalid source");
        cv::Mat abs_out;
        with_alpha_preserved(*src, abs_out, [&](const cv::Mat& in, cv::Mat& o) {
            cv::Mat tmp;
            cv::Scharr(in, tmp, CV_16S, dx, dy);
            cv::convertScaleAbs(tmp, o);
        });
        hspcv4::handle_set(dst_id, std::move(abs_out));
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_scharr: unknown"); }
}

//  cv4_laplacian dst, src, ksize
CV4_EXPORT int __stdcall cv4_laplacian(int dst_id, int src_id, int ksize)
{
    if (ksize == 0) ksize = 3;
    try {
        cv::Mat* src = hspcv4::handle_get(src_id);
        if (!src || src->empty()) return fail("cv4_laplacian: invalid source");
        cv::Mat abs_out;
        with_alpha_preserved(*src, abs_out, [&](const cv::Mat& in, cv::Mat& o) {
            cv::Mat tmp;
            cv::Laplacian(in, tmp, CV_16S, ksize);
            cv::convertScaleAbs(tmp, o);
        });
        hspcv4::handle_set(dst_id, std::move(abs_out));
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_laplacian: unknown"); }
}

//  cv4_filter2d_3x3 dst, src, k00, k01, k02, k10, k11, k12, k20, k21, k22 [, delta=0]
//    3x3 任意カーネルで畳み込み�?
//    HSP に動的 double 配�?�を渡す�?�然な方法が無�?ので�?9 つの double �?
//    直接パラメータとして受け取る形にして�?る�?(ほとんどのカーネルは 3x3 で済�?�)
//    sharpen / emboss / edge / motion blur 等�?�効果を作りたい時に使用�?
//    より大きなカーネルが�?要な場合�?� cv4_blur / cv4_gauss / cv4_median /
//    cv4_filter2d_mat (�?来追加予�?) を使用�?
CV4_EXPORT int __stdcall cv4_filter2d_3x3(int dst_id, int src_id,
    double k0, double k1, double k2, double k3, double k4,
    double k5, double k6, double k7, double k8, double delta)
{
    try {
        double k[9] = { k0, k1, k2, k3, k4, k5, k6, k7, k8 };

        cv::Mat* src = hspcv4::handle_get(src_id);
        if (!src || src->empty()) return fail("cv4_filter2d_3x3: invalid source");

        cv::Mat kernel = (cv::Mat_<double>(3, 3) <<
            k[0], k[1], k[2],
            k[3], k[4], k[5],
            k[6], k[7], k[8]);

        cv::Mat out;
        with_alpha_preserved(*src, out, [&](const cv::Mat& in, cv::Mat& o) {
            cv::filter2D(in, o, -1, kernel, cv::Point(-1, -1), delta);
        });
        hspcv4::handle_set(dst_id, std::move(out));
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_filter2d_3x3: unknown"); }
}

//  cv4_filter2d_mat dst, src, kernel_mat_id [, delta=0]
//    任意サイズの kernel �? Mat ハンドル (CV_32F or CV_64F) で渡す版�?
//    cv4_imread_flags でカーネルを読み込んで使�?等�?�応用が可能�?
CV4_EXPORT int __stdcall cv4_filter2d_mat(int dst_id, int src_id, int kernel_id, double delta)
{
    try {
        cv::Mat* src    = hspcv4::handle_get(src_id);
        cv::Mat* kernel = hspcv4::handle_get(kernel_id);
        if (!src || src->empty()) return fail("cv4_filter2d_mat: invalid source");
        if (!kernel || kernel->empty()) return fail("cv4_filter2d_mat: invalid kernel");
        cv::Mat out;
        with_alpha_preserved(*src, out, [&](const cv::Mat& in, cv::Mat& o) {
            cv::filter2D(in, o, -1, *kernel, cv::Point(-1, -1), delta);
        });
        hspcv4::handle_set(dst_id, std::move(out));
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_filter2d_mat: unknown"); }
}


//============================================================================
//  Histogram / LUT / normalize
//============================================================================

//  cv4_equalize_hist dst, src  (src は 1ch CV_8U)
CV4_EXPORT int __stdcall cv4_equalize_hist(int dst_id, int src_id)
{
    try {
        cv::Mat* src = hspcv4::handle_get(src_id);
        if (!src || src->empty()) return fail("cv4_equalize_hist: invalid source");
        cv::Mat gray = (src->channels() == 1) ? *src : cv::Mat();
        if (gray.empty()) cv::cvtColor(as_bgr(*src), gray, cv::COLOR_BGR2GRAY);
        cv::Mat out;
        cv::equalizeHist(gray, out);
        hspcv4::handle_set(dst_id, std::move(out));
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_equalize_hist: unknown"); }
}

//  cv4_clahe dst, src, clip_limit, grid
//    clip_limit: double (2.0 が標�?)
//    grid: タイル�?割数 (8 で 8x8 など)
CV4_EXPORT int __stdcall cv4_clahe(int dst_id, int src_id, double clip, int grid)
{
    if (clip == 0.0) clip = 2.0;
    if (grid == 0) grid = 8;
    try {
        cv::Mat* src = hspcv4::handle_get(src_id);
        if (!src || src->empty()) return fail("cv4_clahe: invalid source");
        cv::Mat gray = (src->channels() == 1) ? *src : cv::Mat();
        if (gray.empty()) cv::cvtColor(as_bgr(*src), gray, cv::COLOR_BGR2GRAY);
        auto clahe = cv::createCLAHE(clip, cv::Size(grid, grid));
        cv::Mat out;
        clahe->apply(gray, out);
        hspcv4::handle_set(dst_id, std::move(out));
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_clahe: unknown"); }
}

//  cv4_normalize dst, src, alpha, beta [, norm_type=NORM_MINMAX(32)]
CV4_EXPORT int __stdcall cv4_normalize(int dst_id, int src_id, double a, double b, int nt)
{
    if (b == 0.0) b = 255.0;
    if (nt == 0) nt = cv::NORM_MINMAX;
    try {
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
//    lut_var: 256 要素の int 配�?? (0-255 の�?囲の値)
CV4_EXPORT int __stdcall cv4_lut(int dst_id, int src_id, int* lut_src)
{
    try {
        if (!lut_src) return fail("cv4_lut: null lut");
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
CV4_EXPORT int __stdcall cv4_adaptive_thresh(int dst_id, int src_id, double maxv,
                                             int amethod, int ttype, int bsize, double C)
{
    if (maxv == 0.0) maxv = 255.0;
    try {
        cv::Mat* src = hspcv4::handle_get(src_id);
        if (!src || src->empty()) return fail("cv4_adaptive_thresh: invalid source");
        cv::Mat gray = (src->channels() == 1) ? *src : cv::Mat();
        if (gray.empty()) cv::cvtColor(as_bgr(*src), gray, cv::COLOR_BGR2GRAY);
        cv::Mat out;
        cv::adaptiveThreshold(gray, out, maxv, amethod, ttype, bsize, C);
        hspcv4::handle_set(dst_id, std::move(out));
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_adaptive_thresh: unknown"); }
}

//  cv4_distance_transform dst, src [, distance_type=DIST_L2] [, mask_size=3]
//    src は 8-bit 1ch binary を想�? (cv4thresh 等で作�??)
CV4_EXPORT int __stdcall cv4_distance_transform(int dst_id, int src_id, int dtype, int msize)
{
    if (dtype == 0) dtype = cv::DIST_L2;
    if (msize == 0) msize = 3;
    try {
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
//    出力�?� Nx1 CV_32FC2 Mat (rho, theta 対)。cv4_mat_getf で読む�?
CV4_EXPORT int __stdcall cv4_hough_lines(int out_id, int src_id,
                                          double rho, double theta, int thresh)
{
    try {
        if (rho   == 0.0) rho   = 1.0;
        if (theta == 0.0) theta = 0.017453293;  // CV_PI/180
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
//    出力�?� Nx4 CV_32S Mat (x1, y1, x2, y2)�?
CV4_EXPORT int __stdcall cv4_hough_linesp(int out_id, int src_id,
    double rho, double theta, int thresh, double minLen, double maxGap)
{
    try {
        if (rho    == 0.0) rho    = 1.0;
        if (theta  == 0.0) theta  = 0.017453293;
        if (minLen == 0.0) minLen = 30.0;
        if (maxGap == 0.0) maxGap = 10.0;
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
//    出力�?� Nx3 CV_32F Mat (cx, cy, radius)�?
CV4_EXPORT int __stdcall cv4_hough_circles(int out_id, int src_id,
    double dp, double mdst, double pr1, double pr2, int minR, int maxR)
{
    try {
        if (dp   == 0.0) dp   = 1.0;
        if (mdst == 0.0) mdst = 20.0;
        if (pr1  == 0.0) pr1  = 100.0;
        if (pr2  == 0.0) pr2  = 30.0;
        cv::Mat* src = hspcv4::handle_get(src_id);
        if (!src || src->empty()) return fail("cv4_hough_circles: invalid source");
        cv::Mat gray = (src->channels() == 1) ? *src : cv::Mat();
        if (gray.empty()) cv::cvtColor(as_bgr(*src), gray, cv::COLOR_BGR2GRAY);
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
CV4_EXPORT int __stdcall cv4_match_template(int out_id, int src_id, int templ_id, int method)
{
    try {
        // typed #func では省略�? 0 が来るが TM_SQDIFF=0 なので識別困難�?
        // HSP 側は method を�?ず渡すこと。未�?�?(=0)な�? TM_SQDIFF となる�?
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
CV4_EXPORT int __stdcall cv4_pyr_up(int dst_id, int src_id)
{
    try {
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
CV4_EXPORT int __stdcall cv4_pyr_down(int dst_id, int src_id)
{
    try {
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
//  これら�?� Hough �? DNN 等で返される Mat �? HSP 側から読むために使�?
//============================================================================

//  cv4_mat_shape id, var_rows, var_cols, var_type, var_channels
CV4_EXPORT int __stdcall cv4_mat_shape(int id, int* out_rows, int* out_cols,
                                        int* out_type, int* out_channels)
{
    try {
        cv::Mat* m = hspcv4::handle_get(id);
        if (!m || m->empty()) return fail("cv4_mat_shape: invalid handle");
        if (out_rows)     *out_rows     = m->rows;
        if (out_cols)     *out_cols     = m->cols;
        if (out_type)     *out_type     = m->type();
        if (out_channels) *out_channels = m->channels();
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_mat_shape: unknown"); }
}

//  cv4_mat_geti id, row, col, var_value
//    Mat (CV_8U / CV_32S / CV_16S 等�?�整数�?) の 1ch 値を読む
CV4_EXPORT int __stdcall cv4_mat_geti(int id, int row, int col, int* out_v)
{
    try {
        if (!out_v) return fail("cv4_mat_geti: null var");
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
        *out_v = v;
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_mat_geti: unknown"); }
}

//  cv4_mat_getf id, row, col, var_value_x10000
//    Mat (CV_32F / CV_64F) の 1ch 値�? int x10000 固定小数点で返す
CV4_EXPORT int __stdcall cv4_mat_getf(int id, int row, int col, int* out_v_x10000)
{
    try {
        if (!out_v_x10000) return fail("cv4_mat_getf: null var");
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
        *out_v_x10000 = (int)(v * 10000.0);
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_mat_getf: unknown"); }
}

//  cv4_mat_seti id, row, col, value
//    整数型 (CV_8U / CV_8S / CV_16U / CV_16S / CV_32S) Mat の 1ch セルに値を書き込む
CV4_EXPORT int __stdcall cv4_mat_seti(int id, int row, int col, int value)
{
    try {
        cv::Mat* m = hspcv4::handle_get(id);
        if (!m || m->empty()) return fail("cv4_mat_seti: invalid handle");
        if (row < 0 || row >= m->rows || col < 0 || col >= m->cols) {
            return fail("cv4_mat_seti: index out of bounds");
        }
        int depth = m->depth();
        if (depth == CV_8U)       m->at<uchar>(row, col)  = (uchar)value;
        else if (depth == CV_8S)  m->at<schar>(row, col)  = (schar)value;
        else if (depth == CV_16U) m->at<ushort>(row, col) = (ushort)value;
        else if (depth == CV_16S) m->at<short>(row, col)  = (short)value;
        else if (depth == CV_32S) m->at<int>(row, col)    = value;
        else return fail("cv4_mat_seti: non-integer Mat (use cv4_mat_setf)");
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_mat_seti: unknown"); }
}

//  cv4_mat_setf id, row, col, value_x10000
//    浮動小数型 (CV_32F / CV_64F) Mat の 1ch セルに値を書き込む
//    value_x10000 は int 固定小数点 (getf と対称)
CV4_EXPORT int __stdcall cv4_mat_setf(int id, int row, int col, int value_x10000)
{
    try {
        cv::Mat* m = hspcv4::handle_get(id);
        if (!m || m->empty()) return fail("cv4_mat_setf: invalid handle");
        if (row < 0 || row >= m->rows || col < 0 || col >= m->cols) {
            return fail("cv4_mat_setf: index out of bounds");
        }
        double v = value_x10000 / 10000.0;
        int depth = m->depth();
        if (depth == CV_32F)      m->at<float>(row, col)  = (float)v;
        else if (depth == CV_64F) m->at<double>(row, col) = v;
        else return fail("cv4_mat_setf: non-float Mat (use cv4_mat_seti)");
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_mat_setf: unknown"); }
}

//  cv4_mat_from_darray dst_id, rows, cols, type, double_varptr, length
//    HSP の double 配列から Mat を生成 (AR pose 推定の入力用)
//    type : 0=CV_32F (float), 1=CV_64F (double)
//    double_varptr : HSP 側で ddim した double 配列の varptr() を渡す
//    length : 要素数 (rows * cols * channels、不足時エラー)
CV4_EXPORT int __stdcall cv4_mat_from_darray(int dst, int rows, int cols, int type,
    double* data, int length)
{
    try {
        if (!data) return fail("cv4_mat_from_darray: null data");
        int ch = 1;
        int need = rows * cols * ch;
        if (length < need) return fail("cv4_mat_from_darray: array too small");
        int cvtype;
        if (type == 0) cvtype = CV_32FC1;
        else if (type == 1) cvtype = CV_64FC1;
        else return fail("cv4_mat_from_darray: type must be 0=CV_32F or 1=CV_64F");

        cv::Mat m(rows, cols, cvtype);
        if (cvtype == CV_64FC1) {
            std::memcpy(m.ptr(), data, need * sizeof(double));
        } else {
            float* fp = reinterpret_cast<float*>(m.ptr());
            for (int i = 0; i < need; ++i) fp[i] = (float)data[i];
        }
        hspcv4::handle_set(dst, std::move(m));
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_mat_from_darray: unknown"); }
}

//  cv4_mat_to_darray src_id, double_varptr, length
//    Mat から HSP double 配列へデータを取り出す (rvec/tvec 読み出し用)
//    CV_32F / CV_64F 両方受ける。1ch のみ。
CV4_EXPORT int __stdcall cv4_mat_to_darray(int src, double* out, int length)
{
    try {
        if (!out) return fail("cv4_mat_to_darray: null out");
        cv::Mat* m = hspcv4::handle_get(src);
        if (!m || m->empty()) return fail("cv4_mat_to_darray: invalid handle");
        int need = m->rows * m->cols;
        if (length < need) return fail("cv4_mat_to_darray: array too small");
        int depth = m->depth();
        if (depth == CV_64F) {
            std::memcpy(out, m->ptr(), need * sizeof(double));
        } else if (depth == CV_32F) {
            const float* fp = reinterpret_cast<const float*>(m->ptr());
            for (int i = 0; i < need; ++i) out[i] = (double)fp[i];
        } else {
            return fail("cv4_mat_to_darray: Mat must be CV_32F or CV_64F");
        }
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_mat_to_darray: unknown"); }
}

//  cv4_min_max_loc id, var_minval_x10000, var_maxval_x10000, var_minx, var_miny, var_maxx, var_maxy
CV4_EXPORT int __stdcall cv4_min_max_loc(int id,
    int* out_min_x10000, int* out_max_x10000,
    int* out_min_x, int* out_min_y, int* out_max_x, int* out_max_y)
{
    try {
        cv::Mat* m = hspcv4::handle_get(id);
        if (!m || m->empty()) return fail("cv4_min_max_loc: invalid handle");
        double mn, mx;
        cv::Point mnl, mxl;
        cv::minMaxLoc(*m, &mn, &mx, &mnl, &mxl);
        if (out_min_x10000) *out_min_x10000 = (int)(mn * 10000.0);
        if (out_max_x10000) *out_max_x10000 = (int)(mx * 10000.0);
        if (out_min_x)      *out_min_x      = mnl.x;
        if (out_min_y)      *out_min_y      = mnl.y;
        if (out_max_x)      *out_max_x      = mxl.x;
        if (out_max_y)      *out_max_y      = mxl.y;
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_min_max_loc: unknown"); }
}


//============================================================================
//  Filters : blur / gauss / median / canny / thresh
//  dst と src は別ハンドル可、同一ハンドルでも可�?
//============================================================================

//  cv4blur dst_id, src_id, ksize
CV4_EXPORT int __stdcall cv4blur(int dst_id, int src_id, int ksize)
{
    if (ksize < 1) ksize = 1;
    try {
        cv::Mat* src = hspcv4::handle_get(src_id);
        if (!src || src->empty()) return fail("cv4blur: invalid source");
        cv::Mat out;
        with_alpha_preserved(*src, out, [&](const cv::Mat& in, cv::Mat& o) {
            cv::blur(in, o, cv::Size(ksize, ksize));
        });
        hspcv4::handle_set(dst_id, std::move(out));
        return 0;
    } catch (const cv::Exception& e) {
        return fail(e.what());
    } catch (...) {
        return fail("cv4blur: unknown exception");
    }
}

//  cv4gauss dst_id, src_id, ksize [, sigma=0]
//  ksize は�?数を推奨。�?�数を渡した�? +1 する�?
CV4_EXPORT int __stdcall cv4gauss(int dst_id, int src_id, int ksize, double sigma)
{
    try {
        if (ksize < 1) ksize = 1;
        if ((ksize & 1) == 0) ksize += 1;   // 偶数なら�?数�?
        cv::Mat* src = hspcv4::handle_get(src_id);
        if (!src || src->empty()) return fail("cv4gauss: invalid source");
        cv::Mat out;
        with_alpha_preserved(*src, out, [&](const cv::Mat& in, cv::Mat& o) {
            cv::GaussianBlur(in, o, cv::Size(ksize, ksize), sigma);
        });
        hspcv4::handle_set(dst_id, std::move(out));
        return 0;
    } catch (const cv::Exception& e) {
        return fail(e.what());
    } catch (...) {
        return fail("cv4gauss: unknown exception");
    }
}

//  cv4median dst_id, src_id, ksize
//  ksize は 3 以上�?��?数を推奨。�?�数な�? +1�?1 以下�?� 3 に補正�?
CV4_EXPORT int __stdcall cv4median(int dst_id, int src_id, int ksize)
{
    try {
        if (ksize < 3) ksize = 3;
        if ((ksize & 1) == 0) ksize += 1;
        cv::Mat* src = hspcv4::handle_get(src_id);
        if (!src || src->empty()) return fail("cv4median: invalid source");
        cv::Mat out;
        with_alpha_preserved(*src, out, [&](const cv::Mat& in, cv::Mat& o) {
            cv::medianBlur(in, o, ksize);
        });
        hspcv4::handle_set(dst_id, std::move(out));
        return 0;
    } catch (const cv::Exception& e) {
        return fail(e.what());
    } catch (...) {
        return fail("cv4median: unknown exception");
    }
}

//  cv4canny dst_id, src_id, thresh1, thresh2 [, aperture=3]
//  src はグレースケール推奨 (カラーでも動くが、�?�に cv4cvt CV4_BGR2GRAY する方が良�?)
CV4_EXPORT int __stdcall cv4canny(int dst_id, int src_id, int t1, int t2, int aperture)
{
    if (aperture == 0) aperture = 3;
    try {
        cv::Mat* src = hspcv4::handle_get(src_id);
        if (!src || src->empty()) return fail("cv4canny: invalid source");
        cv::Mat out;
        // Canny の出力�?�グレースケール (1ch)。with_alpha_preserved は
        // 1ch 出力を検知したらそのまま返すので�?4ch 入力でも正しく動く�?
        with_alpha_preserved(*src, out, [&](const cv::Mat& in, cv::Mat& o) {
            cv::Canny(in, o, (double)t1, (double)t2, aperture);
        });
        hspcv4::handle_set(dst_id, std::move(out));
        return 0;
    } catch (const cv::Exception& e) {
        return fail(e.what());
    } catch (...) {
        return fail("cv4canny: unknown exception");
    }
}

//  cv4thresh dst_id, src_id, thresh, maxval, type
//  type は CV4_THRESH_BINARY 等。OTSU (8) は THRESH_BINARY と ORで�?�? (= 8|0).
CV4_EXPORT int __stdcall cv4thresh(int dst_id, int src_id, int th, int mx, int type)
{
    try {
        cv::Mat* src = hspcv4::handle_get(src_id);
        if (!src || src->empty()) return fail("cv4thresh: invalid source");
        cv::Mat out;
        with_alpha_preserved(*src, out, [&](const cv::Mat& in, cv::Mat& o) {
            cv::threshold(in, o, (double)th, (double)mx, type);
        });
        hspcv4::handle_set(dst_id, std::move(out));
        return 0;
    } catch (const cv::Exception& e) {
        return fail(e.what());
    } catch (...) {
        return fail("cv4thresh: unknown exception");
    }
}


//============================================================================
//  Drawing : line / rect / circle / text  (beginner, 色は B,G,R �?�?)
//============================================================================

//  cv4line id, x1, y1, x2, y2, b, g, r [, thickness=1]
CV4_EXPORT int __stdcall cv4line(int id, int x1, int y1, int x2, int y2,
                                 int b, int g, int r, int thickness)
{
    if (thickness == 0) thickness = 1;
    try {
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
//  thickness=-1 で塗りつぶ�?
CV4_EXPORT int __stdcall cv4rect(int id, int x, int y, int w, int h,
                                 int b, int g, int r, int thickness)
{
    if (thickness == 0) thickness = 1;
    try {
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
CV4_EXPORT int __stdcall cv4circle(int id, int cx, int cy, int radius,
                                   int b, int g, int r, int thickness)
{
    if (thickness == 0) thickness = 1;
    try {
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
//  フォン�?: HERSHEY_SIMPLEX 固�?
//  scale は double (倍率)。beginner 向けに int を渡せるよう double 解釈す�?
CV4_EXPORT int __stdcall cv4text(int id, const char* t, int x, int y, double scale,
                                 int b, int g, int r, int thickness)
{
    if (scale == 0.0) scale = 1.0;
    if (thickness == 0) thickness = 1;
    try {
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
//  -> 現在の HSP カレン�? window �? id に取り込み (上下反転して BGR に)
CV4_EXPORT int __stdcall cv4putimg(int id, BMSCR* bm)
{
    try {
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
