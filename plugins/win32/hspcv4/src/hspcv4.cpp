//
//  hspcv4 - OpenCV 4.x plugin for IronHSP
//
//  Phase 1: minimal beginner API set.
//  All commands are exported with HSP type $202 (HSPEXINFO + 3 int slots).
//  Return 0 = success (HSP stat = 0), negative = error (stat < 0).
//
#include "hspcv4.h"
#include "hspcv4_capi.h"
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
//  Contrib DLL delayed loader
//
//  opencv_contrib 系の機能は hspcv4_contrib.dll / hspcv4_contrib_64.dll
//  という別 DLL に分離されている。ユーザーはこれを配布せず軽量ビルドを
//  使うことも、配布して contrib 機能を有効にすることもできる。
//
//  実行時に最初の contrib 関数が呼ばれたとき LoadLibrary で動的に取得。
//  DLL が見つからない場合は「hspcv4_contrib.dll not found」エラーを stat
//  として返す (負値 return = OLDDLL 符号反転で正の error stat)。
//============================================================================

typedef int (__stdcall *hspcv4_contrib_fn_t)(
    HSPEXINFO* hei, int p1, int p2, int p3,
    const hspcv4_handle_api_t* api);

static HMODULE g_contrib_dll = nullptr;
static bool    g_contrib_load_tried = false;

static HMODULE load_contrib_dll()
{
    if (g_contrib_dll) return g_contrib_dll;
    if (g_contrib_load_tried) return nullptr;
    g_contrib_load_tried = true;

    // 32bit 版なら hspcv4_contrib.dll、64bit 版なら hspcv4_contrib_64.dll
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

static hspcv4_contrib_fn_t get_contrib_fn(const char* impl_name)
{
    HMODULE h = load_contrib_dll();
    if (!h) return nullptr;
    return (hspcv4_contrib_fn_t)GetProcAddress(h, impl_name);
}

//  cv4_contrib_version var_str
//    hspcv4_contrib.dll がロードされていることを確認するためのテスト関数。
//    OpenCV のバージョン文字列を var_str に格納する (contrib 側で実装)。
//
//  注意: contrib DLL が見つからない場合でも HSP 側の引数を空読みする
//  必要がある (そうしないと HSP が残留引数を TOO_MANY_PARAMETERS で throw)。
//  各 contrib proxy stub は自分が取る引数数・型に合わせて手動で空読みする。
CV4_EXPORT BOOL WINAPI cv4_contrib_version(HSPEXINFO* hei, int p1, int p2, int p3)
{
    set_hei(hei);
    static hspcv4_contrib_fn_t fn = nullptr;
    if (!fn) fn = get_contrib_fn("cv4_contrib_version_impl");
    if (fn) return fn(hei, p1, p2, p3, hspcv4_get_api());
    // contrib DLL が無い場合のフォールバック: var_str を空読みしてエラーを返す
    PVal* pv;
    hei->HspFunc_prm_getva(&pv);
    return fail("cv4_contrib_version: hspcv4_contrib.dll not available");
}

//  cv4_tracker_create_csrt tid   (contrib only)
CV4_EXPORT BOOL WINAPI cv4_tracker_create_csrt(HSPEXINFO* hei, int p1, int p2, int p3)
{
    set_hei(hei);
    static hspcv4_contrib_fn_t fn = nullptr;
    if (!fn) fn = get_contrib_fn("cv4_tracker_create_csrt_impl");
    if (fn) return fn(hei, p1, p2, p3, hspcv4_get_api());
    hei->HspFunc_prm_geti();   // consume tid
    return fail("cv4_tracker_create_csrt: hspcv4_contrib.dll not available");
}

//  cv4_tracker_create_kcf tid   (contrib only)
CV4_EXPORT BOOL WINAPI cv4_tracker_create_kcf(HSPEXINFO* hei, int p1, int p2, int p3)
{
    set_hei(hei);
    static hspcv4_contrib_fn_t fn = nullptr;
    if (!fn) fn = get_contrib_fn("cv4_tracker_create_kcf_impl");
    if (fn) return fn(hei, p1, p2, p3, hspcv4_get_api());
    hei->HspFunc_prm_geti();
    return fail("cv4_tracker_create_kcf: hspcv4_contrib.dll not available");
}

// --- xfeatures2d proxies (Phase 13b-3) ---

//  cv4_star_detect kp_id, img_id
CV4_EXPORT BOOL WINAPI cv4_star_detect(HSPEXINFO* hei, int p1, int p2, int p3)
{
    set_hei(hei);
    static hspcv4_contrib_fn_t fn = nullptr;
    if (!fn) fn = get_contrib_fn("cv4_star_detect_impl");
    if (fn) return fn(hei, p1, p2, p3, hspcv4_get_api());
    hei->HspFunc_prm_geti(); hei->HspFunc_prm_geti();
    return fail("cv4_star_detect: hspcv4_contrib.dll not available");
}

//  cv4_harris_laplace_detect kp_id, img_id
CV4_EXPORT BOOL WINAPI cv4_harris_laplace_detect(HSPEXINFO* hei, int p1, int p2, int p3)
{
    set_hei(hei);
    static hspcv4_contrib_fn_t fn = nullptr;
    if (!fn) fn = get_contrib_fn("cv4_harris_laplace_detect_impl");
    if (fn) return fn(hei, p1, p2, p3, hspcv4_get_api());
    hei->HspFunc_prm_geti(); hei->HspFunc_prm_geti();
    return fail("cv4_harris_laplace_detect: hspcv4_contrib.dll not available");
}

//  cv4_brief_compute kp_id, desc_id, img_id [, bytes=32]
CV4_EXPORT BOOL WINAPI cv4_brief_compute(HSPEXINFO* hei, int p1, int p2, int p3)
{
    set_hei(hei);
    static hspcv4_contrib_fn_t fn = nullptr;
    if (!fn) fn = get_contrib_fn("cv4_brief_compute_impl");
    if (fn) return fn(hei, p1, p2, p3, hspcv4_get_api());
    hei->HspFunc_prm_geti(); hei->HspFunc_prm_geti();
    hei->HspFunc_prm_geti(); hei->HspFunc_prm_getdi(32);
    return fail("cv4_brief_compute: hspcv4_contrib.dll not available");
}

//  cv4_freak_compute kp_id, desc_id, img_id
CV4_EXPORT BOOL WINAPI cv4_freak_compute(HSPEXINFO* hei, int p1, int p2, int p3)
{
    set_hei(hei);
    static hspcv4_contrib_fn_t fn = nullptr;
    if (!fn) fn = get_contrib_fn("cv4_freak_compute_impl");
    if (fn) return fn(hei, p1, p2, p3, hspcv4_get_api());
    hei->HspFunc_prm_geti(); hei->HspFunc_prm_geti(); hei->HspFunc_prm_geti();
    return fail("cv4_freak_compute: hspcv4_contrib.dll not available");
}

//  cv4_daisy_compute kp_id, desc_id, img_id
CV4_EXPORT BOOL WINAPI cv4_daisy_compute(HSPEXINFO* hei, int p1, int p2, int p3)
{
    set_hei(hei);
    static hspcv4_contrib_fn_t fn = nullptr;
    if (!fn) fn = get_contrib_fn("cv4_daisy_compute_impl");
    if (fn) return fn(hei, p1, p2, p3, hspcv4_get_api());
    hei->HspFunc_prm_geti(); hei->HspFunc_prm_geti(); hei->HspFunc_prm_geti();
    return fail("cv4_daisy_compute: hspcv4_contrib.dll not available");
}

// --- bgsegm proxies (Phase 13b-4) ---

CV4_EXPORT BOOL WINAPI cv4_bgsub_create_cnt(HSPEXINFO* hei, int p1, int p2, int p3)
{
    set_hei(hei);
    static hspcv4_contrib_fn_t fn = nullptr;
    if (!fn) fn = get_contrib_fn("cv4_bgsub_create_cnt_impl");
    if (fn) return fn(hei, p1, p2, p3, hspcv4_get_api());
    hei->HspFunc_prm_geti(); hei->HspFunc_prm_getdi(15); hei->HspFunc_prm_getdi(1);
    hei->HspFunc_prm_getdi(900); hei->HspFunc_prm_getdi(1);
    return fail("cv4_bgsub_create_cnt: hspcv4_contrib.dll not available");
}

CV4_EXPORT BOOL WINAPI cv4_bgsub_create_gmg(HSPEXINFO* hei, int p1, int p2, int p3)
{
    set_hei(hei);
    static hspcv4_contrib_fn_t fn = nullptr;
    if (!fn) fn = get_contrib_fn("cv4_bgsub_create_gmg_impl");
    if (fn) return fn(hei, p1, p2, p3, hspcv4_get_api());
    hei->HspFunc_prm_geti(); hei->HspFunc_prm_getdi(120);
    hei->HspFunc_prm_getdd(0.8);
    return fail("cv4_bgsub_create_gmg: hspcv4_contrib.dll not available");
}

CV4_EXPORT BOOL WINAPI cv4_bgsub_create_lsbp(HSPEXINFO* hei, int p1, int p2, int p3)
{
    set_hei(hei);
    static hspcv4_contrib_fn_t fn = nullptr;
    if (!fn) fn = get_contrib_fn("cv4_bgsub_create_lsbp_impl");
    if (fn) return fn(hei, p1, p2, p3, hspcv4_get_api());
    hei->HspFunc_prm_geti();
    return fail("cv4_bgsub_create_lsbp: hspcv4_contrib.dll not available");
}

CV4_EXPORT BOOL WINAPI cv4_bgsub_create_gsoc(HSPEXINFO* hei, int p1, int p2, int p3)
{
    set_hei(hei);
    static hspcv4_contrib_fn_t fn = nullptr;
    if (!fn) fn = get_contrib_fn("cv4_bgsub_create_gsoc_impl");
    if (fn) return fn(hei, p1, p2, p3, hspcv4_get_api());
    hei->HspFunc_prm_geti();
    return fail("cv4_bgsub_create_gsoc: hspcv4_contrib.dll not available");
}

CV4_EXPORT BOOL WINAPI cv4_bgsub_create_mog(HSPEXINFO* hei, int p1, int p2, int p3)
{
    set_hei(hei);
    static hspcv4_contrib_fn_t fn = nullptr;
    if (!fn) fn = get_contrib_fn("cv4_bgsub_create_mog_impl");
    if (fn) return fn(hei, p1, p2, p3, hspcv4_get_api());
    hei->HspFunc_prm_geti(); hei->HspFunc_prm_getdi(200); hei->HspFunc_prm_getdi(5);
    hei->HspFunc_prm_getdd(0.7); hei->HspFunc_prm_getdd(0.0);
    return fail("cv4_bgsub_create_mog: hspcv4_contrib.dll not available");
}

// --- ximgproc proxies (Phase 13b-5) ---

CV4_EXPORT BOOL WINAPI cv4_thinning(HSPEXINFO* hei, int p1, int p2, int p3)
{
    set_hei(hei);
    static hspcv4_contrib_fn_t fn = nullptr;
    if (!fn) fn = get_contrib_fn("cv4_thinning_impl");
    if (fn) return fn(hei, p1, p2, p3, hspcv4_get_api());
    hei->HspFunc_prm_geti(); hei->HspFunc_prm_geti(); hei->HspFunc_prm_getdi(0);
    return fail("cv4_thinning: hspcv4_contrib.dll not available");
}

CV4_EXPORT BOOL WINAPI cv4_niblack(HSPEXINFO* hei, int p1, int p2, int p3)
{
    set_hei(hei);
    static hspcv4_contrib_fn_t fn = nullptr;
    if (!fn) fn = get_contrib_fn("cv4_niblack_impl");
    if (fn) return fn(hei, p1, p2, p3, hspcv4_get_api());
    hei->HspFunc_prm_geti(); hei->HspFunc_prm_geti(); hei->HspFunc_prm_getdd(255);
    hei->HspFunc_prm_geti(); hei->HspFunc_prm_geti(); hei->HspFunc_prm_getdd(0.5);
    return fail("cv4_niblack: hspcv4_contrib.dll not available");
}

CV4_EXPORT BOOL WINAPI cv4_anisotropic_diffusion(HSPEXINFO* hei, int p1, int p2, int p3)
{
    set_hei(hei);
    static hspcv4_contrib_fn_t fn = nullptr;
    if (!fn) fn = get_contrib_fn("cv4_anisotropic_diffusion_impl");
    if (fn) return fn(hei, p1, p2, p3, hspcv4_get_api());
    hei->HspFunc_prm_geti(); hei->HspFunc_prm_geti();
    hei->HspFunc_prm_getdd(1.0); hei->HspFunc_prm_getdd(0.02); hei->HspFunc_prm_getdi(10);
    return fail("cv4_anisotropic_diffusion: hspcv4_contrib.dll not available");
}

CV4_EXPORT BOOL WINAPI cv4_guided_filter(HSPEXINFO* hei, int p1, int p2, int p3)
{
    set_hei(hei);
    static hspcv4_contrib_fn_t fn = nullptr;
    if (!fn) fn = get_contrib_fn("cv4_guided_filter_impl");
    if (fn) return fn(hei, p1, p2, p3, hspcv4_get_api());
    hei->HspFunc_prm_geti(); hei->HspFunc_prm_geti(); hei->HspFunc_prm_geti();
    hei->HspFunc_prm_geti(); hei->HspFunc_prm_getdd(1e-2);
    return fail("cv4_guided_filter: hspcv4_contrib.dll not available");
}

CV4_EXPORT BOOL WINAPI cv4_l0_smooth(HSPEXINFO* hei, int p1, int p2, int p3)
{
    set_hei(hei);
    static hspcv4_contrib_fn_t fn = nullptr;
    if (!fn) fn = get_contrib_fn("cv4_l0_smooth_impl");
    if (fn) return fn(hei, p1, p2, p3, hspcv4_get_api());
    hei->HspFunc_prm_geti(); hei->HspFunc_prm_geti();
    hei->HspFunc_prm_getdd(0.02); hei->HspFunc_prm_getdd(2.0);
    return fail("cv4_l0_smooth: hspcv4_contrib.dll not available");
}

CV4_EXPORT BOOL WINAPI cv4_fast_global_smoother(HSPEXINFO* hei, int p1, int p2, int p3)
{
    set_hei(hei);
    static hspcv4_contrib_fn_t fn = nullptr;
    if (!fn) fn = get_contrib_fn("cv4_fast_global_smoother_impl");
    if (fn) return fn(hei, p1, p2, p3, hspcv4_get_api());
    hei->HspFunc_prm_geti(); hei->HspFunc_prm_geti(); hei->HspFunc_prm_geti();
    hei->HspFunc_prm_getdd(125); hei->HspFunc_prm_getdd(8);
    return fail("cv4_fast_global_smoother: hspcv4_contrib.dll not available");
}

CV4_EXPORT BOOL WINAPI cv4_weighted_median(HSPEXINFO* hei, int p1, int p2, int p3)
{
    set_hei(hei);
    static hspcv4_contrib_fn_t fn = nullptr;
    if (!fn) fn = get_contrib_fn("cv4_weighted_median_impl");
    if (fn) return fn(hei, p1, p2, p3, hspcv4_get_api());
    hei->HspFunc_prm_geti(); hei->HspFunc_prm_geti(); hei->HspFunc_prm_geti();
    hei->HspFunc_prm_getdi(7);
    return fail("cv4_weighted_median: hspcv4_contrib.dll not available");
}

// --- img_hash proxies (Phase 13b-6) ---
//   どれも (dst_id, src_id) の 2 引数

#define CV4_HASH_PROXY(name, impl_name) \
CV4_EXPORT BOOL WINAPI name(HSPEXINFO* hei, int p1, int p2, int p3) { \
    set_hei(hei); \
    static hspcv4_contrib_fn_t fn = nullptr; \
    if (!fn) fn = get_contrib_fn(impl_name); \
    if (fn) return fn(hei, p1, p2, p3, hspcv4_get_api()); \
    hei->HspFunc_prm_geti(); hei->HspFunc_prm_geti(); \
    return fail(impl_name ": hspcv4_contrib.dll not available"); \
}

CV4_HASH_PROXY(cv4_phash,             "cv4_phash_impl")
CV4_HASH_PROXY(cv4_average_hash,      "cv4_average_hash_impl")
CV4_HASH_PROXY(cv4_block_mean_hash,   "cv4_block_mean_hash_impl")
CV4_HASH_PROXY(cv4_color_moment_hash, "cv4_color_moment_hash_impl")
CV4_HASH_PROXY(cv4_marr_hildreth_hash, "cv4_marr_hildreth_hash_impl")
CV4_HASH_PROXY(cv4_radial_variance_hash, "cv4_radial_variance_hash_impl")

#undef CV4_HASH_PROXY

// --- optflow proxies (Phase 13b-7) ---
//   どれも (flow_id, prev_id, next_id) の 3 引数

#define CV4_OPTFLOW_PROXY(name, impl_name) \
CV4_EXPORT BOOL WINAPI name(HSPEXINFO* hei, int p1, int p2, int p3) { \
    set_hei(hei); \
    static hspcv4_contrib_fn_t fn = nullptr; \
    if (!fn) fn = get_contrib_fn(impl_name); \
    if (fn) return fn(hei, p1, p2, p3, hspcv4_get_api()); \
    hei->HspFunc_prm_geti(); hei->HspFunc_prm_geti(); hei->HspFunc_prm_geti(); \
    return fail(impl_name ": hspcv4_contrib.dll not available"); \
}

CV4_OPTFLOW_PROXY(cv4_optflow_dualtvl1,         "cv4_optflow_dualtvl1_impl")
CV4_OPTFLOW_PROXY(cv4_optflow_deepflow,         "cv4_optflow_deepflow_impl")
CV4_OPTFLOW_PROXY(cv4_optflow_sparse_to_dense,  "cv4_optflow_sparse_to_dense_impl")

#undef CV4_OPTFLOW_PROXY

// --- dnn_superres proxies (Phase 13b-8) ---

//  cv4_dnn_sr_create sr_id, "model.pb", "algo", scale
CV4_EXPORT BOOL WINAPI cv4_dnn_sr_create(HSPEXINFO* hei, int p1, int p2, int p3)
{
    set_hei(hei);
    static hspcv4_contrib_fn_t fn = nullptr;
    if (!fn) fn = get_contrib_fn("cv4_dnn_sr_create_impl");
    if (fn) return fn(hei, p1, p2, p3, hspcv4_get_api());
    hei->HspFunc_prm_geti(); hei->HspFunc_prm_gets();
    hei->HspFunc_prm_gets(); hei->HspFunc_prm_geti();
    return fail("cv4_dnn_sr_create: hspcv4_contrib.dll not available");
}

//  cv4_dnn_sr_upsample sr_id, dst_img_id, src_img_id
CV4_EXPORT BOOL WINAPI cv4_dnn_sr_upsample(HSPEXINFO* hei, int p1, int p2, int p3)
{
    set_hei(hei);
    static hspcv4_contrib_fn_t fn = nullptr;
    if (!fn) fn = get_contrib_fn("cv4_dnn_sr_upsample_impl");
    if (fn) return fn(hei, p1, p2, p3, hspcv4_get_api());
    hei->HspFunc_prm_geti(); hei->HspFunc_prm_geti(); hei->HspFunc_prm_geti();
    return fail("cv4_dnn_sr_upsample: hspcv4_contrib.dll not available");
}

//  cv4_dnn_sr_free sr_id
CV4_EXPORT BOOL WINAPI cv4_dnn_sr_free(HSPEXINFO* hei, int p1, int p2, int p3)
{
    set_hei(hei);
    static hspcv4_contrib_fn_t fn = nullptr;
    if (!fn) fn = get_contrib_fn("cv4_dnn_sr_free_impl");
    if (fn) return fn(hei, p1, p2, p3, hspcv4_get_api());
    hei->HspFunc_prm_geti();
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
        cv::destroyAllWindows();
        // contrib DLL は OS が process 終了時に自動 FreeLibrary するので
        // ここで明示的に解放する必要はない (static ハンドルが残ったまま
        // でも害はない)。
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
//  Stitching / Drawing extras / Misc
//============================================================================

// --- Stitching (パノラマ合成) ---

//  cv4_stitch dst_id, img_ids_array, count
//    HSP の int 配列に入っているハンドル ID のリストから Stitcher で
//    パノラマ画像を合成する。count は使用する要素数 (配列の要素数ではない)。
CV4_EXPORT BOOL WINAPI cv4_stitch(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    try {
        int dst_id = getint();
        PVal* pv; APTR a = hei->HspFunc_prm_getva(&pv);
        pv->offset = a;
        if (pv->flag != HSPVAR_FLAG_INT) return fail("cv4_stitch: img_ids must be int array");
        int count = getint();
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
CV4_EXPORT BOOL WINAPI cv4_draw_arrow(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    try {
        int id = getint();
        int x1 = getint(); int y1 = getint();
        int x2 = getint(); int y2 = getint();
        int b = getint(); int g = getint(); int r = getint();
        int thick = getint_def(1);
        int tip_x100 = getint_def(10);
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
CV4_EXPORT BOOL WINAPI cv4_draw_marker(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    try {
        int id = getint();
        int cx = getint(); int cy = getint();
        int b = getint(); int g = getint(); int r = getint();
        int mtype = getint_def(0);
        int size  = getint_def(20);
        int thick = getint_def(1);
        cv::Mat* m = hspcv4::handle_get(id);
        if (!m || m->empty()) return fail("cv4_draw_marker: invalid handle");
        cv::drawMarker(*m, cv::Point(cx, cy), cv::Scalar(b, g, r),
                       mtype, size, thick, cv::LINE_AA);
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_draw_marker: unknown"); }
}

//  cv4_draw_ellipse id, cx, cy, rx, ry, angle, start_angle, end_angle, b, g, r [, thickness=1]
CV4_EXPORT BOOL WINAPI cv4_draw_ellipse(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    try {
        int id = getint();
        int cx = getint(); int cy = getint();
        int rx = getint(); int ry = getint();
        double ang  = hei->HspFunc_prm_getdd(0.0);
        double sang = hei->HspFunc_prm_getdd(0.0);
        double eang = hei->HspFunc_prm_getdd(360.0);
        int b = getint(); int g = getint(); int r = getint();
        int thick = getint_def(1);
        cv::Mat* m = hspcv4::handle_get(id);
        if (!m || m->empty()) return fail("cv4_draw_ellipse: invalid handle");
        cv::ellipse(*m, cv::Point(cx, cy), cv::Size(rx, ry), ang, sang, eang,
                    cv::Scalar(b, g, r), thick, cv::LINE_AA);
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_draw_ellipse: unknown"); }
}

//  cv4_fill_poly id, points_array, point_count, b, g, r
//    points_array は [x0,y0,x1,y1,...] の int 配列
CV4_EXPORT BOOL WINAPI cv4_fill_poly(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    try {
        int id = getint();
        PVal* pv; APTR a = hei->HspFunc_prm_getva(&pv);
        pv->offset = a;
        if (pv->flag != HSPVAR_FLAG_INT) return fail("cv4_fill_poly: points must be int array");
        int ncount = getint();
        int b = getint(); int g = getint(); int r = getint();
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

// --- その他ユーティリティ ---

//  cv4_mat_clone dst, src
CV4_EXPORT BOOL WINAPI cv4_mat_clone(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    try {
        int dst_id = getint();
        int src_id = getint();
        cv::Mat* src = hspcv4::handle_get(src_id);
        if (!src || src->empty()) return fail("cv4_mat_clone: invalid source");
        cv::Mat out = src->clone();
        hspcv4::handle_set(dst_id, std::move(out));
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_mat_clone: unknown"); }
}

//  cv4_put_pixel id, x, y, b, g, r  (CV_8UC3 前提)
CV4_EXPORT BOOL WINAPI cv4_put_pixel(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    try {
        int id = getint();
        int x = getint(); int y = getint();
        int b = getint(); int g = getint(); int r = getint();
        cv::Mat* m = hspcv4::handle_get(id);
        if (!m || m->empty()) return fail("cv4_put_pixel: invalid handle");
        if (x < 0 || y < 0 || x >= m->cols || y >= m->rows) {
            return fail("cv4_put_pixel: out of bounds");
        }
        if (m->channels() == 3 && m->depth() == CV_8U) {
            auto& px = m->at<cv::Vec3b>(y, x);
            px[0] = (uchar)b; px[1] = (uchar)g; px[2] = (uchar)r;
        } else if (m->channels() == 1 && m->depth() == CV_8U) {
            m->at<uchar>(y, x) = (uchar)b;
        } else {
            return fail("cv4_put_pixel: unsupported Mat type");
        }
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_put_pixel: unknown"); }
}

//  cv4_get_pixel id, x, y, var_b, var_g, var_r
CV4_EXPORT BOOL WINAPI cv4_get_pixel(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    try {
        int id = getint();
        int x = getint(); int y = getint();
        cv::Mat* m = hspcv4::handle_get(id);
        if (!m || m->empty()) return fail("cv4_get_pixel: invalid handle");
        if (x < 0 || y < 0 || x >= m->cols || y >= m->rows) {
            return fail("cv4_get_pixel: out of bounds");
        }
        int vals[3] = { 0, 0, 0 };
        if (m->channels() == 3 && m->depth() == CV_8U) {
            auto& px = m->at<cv::Vec3b>(y, x);
            vals[0] = px[0]; vals[1] = px[1]; vals[2] = px[2];
        } else if (m->channels() == 1 && m->depth() == CV_8U) {
            int v = m->at<uchar>(y, x);
            vals[0] = vals[1] = vals[2] = v;
        } else {
            return fail("cv4_get_pixel: unsupported Mat type");
        }
        for (int i = 0; i < 3; ++i) {
            PVal* pv; APTR a = hei->HspFunc_prm_getva(&pv);
            if (pv->flag != HSPVAR_FLAG_INT) return fail("cv4_get_pixel: var must be int");
            pv->offset = a;
            HspVarProc* proc = hei->HspFunc_getproc(pv->flag);
            proc->Set(pv, proc->GetPtr(pv), &vals[i]);
        }
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_get_pixel: unknown"); }
}

//  cv4_build_version var_str
//    OpenCV のバージョン情報を str 変数に格納
CV4_EXPORT BOOL WINAPI cv4_build_version(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    try {
        PVal* pv; APTR a = hei->HspFunc_prm_getva(&pv);
        pv->offset = a;
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
//    cv4load の flag 指定版。
//    flags: CV4_IMREAD_UNCHANGED=-1, GRAYSCALE=0, COLOR=1, ANYDEPTH=2, ANYCOLOR=4
CV4_EXPORT BOOL WINAPI cv4_imread_flags(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    try {
        int id          = getint();
        const char* f   = getstr();
        int flags       = getint_def(cv::IMREAD_COLOR);
        if (!f) return fail("cv4_imread_flags: null path");
        cv::Mat img = cv::imread(f, flags);
        if (img.empty()) return fail("cv4_imread_flags: imread failed");
        hspcv4::handle_set(id, std::move(img));
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_imread_flags: unknown"); }
}

//  cv4_imdecode id, buffer_var, size
//    HSP の変数に入っているバイト列 (netload や cv4_imencode で取得した
//    PNG/JPEG バイト列) から Mat をデコードする。
//    size は実際のバイト数。cv4_imencode で取得した var_size をそのまま渡す。
CV4_EXPORT BOOL WINAPI cv4_imdecode(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    try {
        int id = getint();
        PVal* pv; APTR a = hei->HspFunc_prm_getva(&pv);
        pv->offset = a;
        if (pv->flag != HSPVAR_FLAG_STR) return fail("cv4_imdecode: buffer must be str");
        int size = getint();
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
//    Mat を指定フォーマット (".png", ".jpg" 等) でエンコードして
//    HSP の str 変数にバイト列として格納し、バイト数を var_size に返す。
//    PNG 等には NUL バイトが含まれるので strlen では長さを測れない。
//    必ず var_size を使って後続 cv4_imdecode に渡すこと。
CV4_EXPORT BOOL WINAPI cv4_imencode(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    try {
        const char* ext = getstr();
        int id          = getint();
        PVal* pv_buf; APTR a_buf = hei->HspFunc_prm_getva(&pv_buf);
        pv_buf->offset = a_buf;
        if (pv_buf->flag != HSPVAR_FLAG_STR) return fail("cv4_imencode: buffer must be str");
        PVal* pv_size; APTR a_size = hei->HspFunc_prm_getva(&pv_size);
        pv_size->offset = a_size;
        if (pv_size->flag != HSPVAR_FLAG_INT) return fail("cv4_imencode: var_size must be int");

        cv::Mat* m = hspcv4::handle_get(id);
        if (!m || m->empty()) return fail("cv4_imencode: invalid handle");
        std::vector<unsigned char> buf;
        if (!cv::imencode(ext ? ext : ".png", *m, buf))
            return fail("cv4_imencode: encode failed");

        // str 変数を必要サイズで再確保 (nul 終端 1 バイト分多め)
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
//  辞書 (dictionary) は HSP からは整数 ID (PREDEFINED_DICTIONARY_NAME) で指定。
//  検出関数は cv_rect 配列に各マーカの外接矩形を、別 int 配列に ID を返す。
//============================================================================

//  cv4_aruco_detect rects_array, ids_array, count_var, img_id [, dict=DICT_4X4_50(0)]
CV4_EXPORT BOOL WINAPI cv4_aruco_detect(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    try {
        PVal* pv_rects;
        APTR a1 = hei->HspFunc_prm_getva(&pv_rects);
        pv_rects->offset = a1;

        PVal* pv_ids;
        APTR a2 = hei->HspFunc_prm_getva(&pv_ids);
        if (pv_ids->flag != HSPVAR_FLAG_INT)
            return fail("cv4_aruco_detect: ids must be int array");
        pv_ids->offset = a2;

        PVal* pv_count;
        APTR a3 = hei->HspFunc_prm_getva(&pv_count);
        if (pv_count->flag != HSPVAR_FLAG_INT)
            return fail("cv4_aruco_detect: count must be int");
        pv_count->offset = a3;

        int img_id = getint();
        int dict_id = getint_def(0);   // DICT_4X4_50 = 0

        cv::Mat* img = hspcv4::handle_get(img_id);
        if (!img || img->empty()) return fail("cv4_aruco_detect: invalid image");

        cv::aruco::Dictionary dict =
            cv::aruco::getPredefinedDictionary(dict_id);
        cv::aruco::ArucoDetector detector(dict);
        std::vector<std::vector<cv::Point2f>> corners;
        std::vector<int> ids;
        detector.detectMarkers(*img, corners, ids);

        // 矩形配列のサイズ
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
        HspVarProc* proc = hei->HspFunc_getproc(pv_count->flag);
        proc->Set(pv_count, proc->GetPtr(pv_count), &n);
        return 0;
    } catch (const cv::Exception& e) {
        return fail(e.what());
    } catch (...) {
        return fail("cv4_aruco_detect: unknown");
    }
}

//  cv4_aruco_generate dst_id, dict, marker_id, side_pixels [, border=1]
//    指定 ID のマーカ画像を生成する。
CV4_EXPORT BOOL WINAPI cv4_aruco_generate(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    try {
        int dst_id = getint();
        int dict_id = getint();
        int marker_id = getint();
        int side = getint();
        int border = getint_def(1);
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

// --- HOG: 人物検出の定番 (cv::HOGDescriptor) ---
//   HOGDescriptor はハンドル保持せず、都度生成して検出する簡易 API にする。

//  cv4_hog_detect_people rects_array, count_var, img_id [, hit_thresh=0.0]
//    検出された矩形を cv_rect 配列に書き込み、個数を count_var に格納。
//    デフォルト SVM は人物用 (HOGDescriptor::getDefaultPeopleDetector)。
CV4_EXPORT BOOL WINAPI cv4_hog_detect_people(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    try {
        PVal* pval_rects;
        APTR  aptr_rects = hei->HspFunc_prm_getva(&pval_rects);
        pval_rects->offset = aptr_rects;
        PVal* pval_count;
        APTR  aptr_count = hei->HspFunc_prm_getva(&pval_count);
        if (pval_count->flag != HSPVAR_FLAG_INT)
            return fail("cv4_hog_detect_people: count must be int");
        pval_count->offset = aptr_count;

        int img_id    = getint();
        double hit_th = hei->HspFunc_prm_getdd(0.0);

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

// --- QR コード ---
//   QRCodeDetector も都度生成する簡易 API。

//  cv4_qr_detect rects_array, count_var, img_id
//    QR コードを検出。結果の矩形(または外接矩形)を cv_rect 配列に。
CV4_EXPORT BOOL WINAPI cv4_qr_detect(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    try {
        PVal* pval_rects;
        APTR  aptr_rects = hei->HspFunc_prm_getva(&pval_rects);
        pval_rects->offset = aptr_rects;
        PVal* pval_count;
        APTR  aptr_count = hei->HspFunc_prm_getva(&pval_count);
        if (pval_count->flag != HSPVAR_FLAG_INT)
            return fail("cv4_qr_detect: count must be int");
        pval_count->offset = aptr_count;

        int img_id = getint();
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
//    画像から QR コードを検出してデコード。結果文字列を refstr_var に格納。
//    空文字列は「検出失敗または空の QR」を意味する。
CV4_EXPORT BOOL WINAPI cv4_qr_decode(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    try {
        int img_id = getint();
        PVal* pv; APTR a = hei->HspFunc_prm_getva(&pv);
        if (pv->flag != HSPVAR_FLAG_STR) return fail("cv4_qr_decode: var must be str");
        pv->offset = a;

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
//  Calib3D : homography / perspective / camera calibration helpers
//
//  点集合は HSP の cv_rect 配列 (stdim rects, cv_rect, N) の x/y フィールド
//  を流用したり、N x 2 の CV_32F Mat で受け取ったりする設計。ここでは
//  直接点を受け取るのは煩雑なので、2 つのキーポイント集合と BFMatch 結果
//  を入力として受けて findHomography を呼ぶ API にする。
//============================================================================

//  cv4_find_homography h_mat_id, kp1_id, kp2_id, match_id [, ransac_thresh=3.0]
//    match から対応点ペアを取り出し findHomography を呼ぶ。
//    出力は 3x3 CV_64F Mat。
CV4_EXPORT BOOL WINAPI cv4_find_homography(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    try {
        int h_id    = getint();
        int kp1_id  = getint();
        int kp2_id  = getint();
        int m_id    = getint();
        double rth  = hei->HspFunc_prm_getdd(3.0);
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
CV4_EXPORT BOOL WINAPI cv4_warp_perspective(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    try {
        int dst_id = getint();
        int src_id = getint();
        int h_id   = getint();
        int ow     = getint();
        int oh     = getint();
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
//    4 対のソース頂点と先頂点から 3x3 透視変換行列を作成
CV4_EXPORT BOOL WINAPI cv4_get_perspective_transform(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    try {
        int h_id = getint();
        cv::Point2f src_pts[4];
        cv::Point2f dst_pts[4];
        for (int i = 0; i < 4; ++i) {
            src_pts[i].x = (float)getint();
            src_pts[i].y = (float)getint();
        }
        for (int i = 0; i < 4; ++i) {
            dst_pts[i].x = (float)getint();
            dst_pts[i].y = (float)getint();
        }
        cv::Mat H = cv::getPerspectiveTransform(src_pts, dst_pts);
        hspcv4::handle_set(h_id, std::move(H));
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_get_perspective_transform: unknown"); }
}

//  cv4_get_affine_transform m_mat_id, sx1,sy1, sx2,sy2, sx3,sy3, dx1,dy1, dx2,dy2, dx3,dy3
//    3 対のソース/先頂点から 2x3 アフィン変換行列を作成
CV4_EXPORT BOOL WINAPI cv4_get_affine_transform(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    try {
        int m_id = getint();
        cv::Point2f src_pts[3];
        cv::Point2f dst_pts[3];
        for (int i = 0; i < 3; ++i) {
            src_pts[i].x = (float)getint();
            src_pts[i].y = (float)getint();
        }
        for (int i = 0; i < 3; ++i) {
            dst_pts[i].x = (float)getint();
            dst_pts[i].y = (float)getint();
        }
        cv::Mat M = cv::getAffineTransform(src_pts, dst_pts);
        hspcv4::handle_set(m_id, std::move(M));
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_get_affine_transform: unknown"); }
}

//  cv4_warp_perspective_mat dst, src, m_id, out_w, out_h
//    既存 cv4_warp_perspective と同等だが汎用 Mat を受け取る版 (上と同じ)
//    (alias、削除してもよい)


//============================================================================
//  Video : optical flow / background subtraction / trackers
//============================================================================

// --- オプティカルフロー ---

//  cv4_optflow_farneback flow_mat_id, prev_id, next_id
//    Farneback dense optical flow. 出力は HxWx2 CV_32F (dx, dy)
CV4_EXPORT BOOL WINAPI cv4_optflow_farneback(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    try {
        int flow_id = getint();
        int prev_id = getint();
        int next_id = getint();
        cv::Mat* prev = hspcv4::handle_get(prev_id);
        cv::Mat* next = hspcv4::handle_get(next_id);
        if (!prev || !next || prev->empty() || next->empty())
            return fail("cv4_optflow_farneback: invalid input");
        cv::Mat pg = (prev->channels() == 1) ? *prev : cv::Mat();
        cv::Mat ng = (next->channels() == 1) ? *next : cv::Mat();
        if (pg.empty()) cv::cvtColor(*prev, pg, cv::COLOR_BGR2GRAY);
        if (ng.empty()) cv::cvtColor(*next, ng, cv::COLOR_BGR2GRAY);
        cv::Mat flow;
        cv::calcOpticalFlowFarneback(pg, ng, flow, 0.5, 3, 15, 3, 5, 1.2, 0);
        hspcv4::handle_set(flow_id, std::move(flow));
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_optflow_farneback: unknown"); }
}

//  cv4_optflow_lk out_kp_id, status_mat_id, prev_id, next_id, prev_kp_id
//    Lucas-Kanade sparse optical flow. prev_kp_id は次フレームでの対応点に
//    置換された新しいキーポイントセット out_kp_id として出力する。
//    status は Nx1 CV_8U (成功=1/失敗=0)。
CV4_EXPORT BOOL WINAPI cv4_optflow_lk(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    try {
        int out_kp_id  = getint();
        int status_id  = getint();
        int prev_id    = getint();
        int next_id    = getint();
        int prev_kp_id = getint();
        cv::Mat* prev = hspcv4::handle_get(prev_id);
        cv::Mat* next = hspcv4::handle_get(next_id);
        auto* pkps = hspcv4::kps_get(prev_kp_id);
        if (!prev || !next || prev->empty() || next->empty())
            return fail("cv4_optflow_lk: invalid images");
        if (!pkps || pkps->empty())
            return fail("cv4_optflow_lk: invalid prev kp set");
        cv::Mat pg = (prev->channels() == 1) ? *prev : cv::Mat();
        cv::Mat ng = (next->channels() == 1) ? *next : cv::Mat();
        if (pg.empty()) cv::cvtColor(*prev, pg, cv::COLOR_BGR2GRAY);
        if (ng.empty()) cv::cvtColor(*next, ng, cv::COLOR_BGR2GRAY);
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

// --- 背景差分 ---

//  cv4_bgsub_create_mog2 bg_id [, history=500] [, var_thresh=16] [, detect_shadows=1]
CV4_EXPORT BOOL WINAPI cv4_bgsub_create_mog2(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    try {
        int bg_id   = getint();
        int hist    = getint_def(500);
        double vt   = hei->HspFunc_prm_getdd(16.0);
        int shadow  = getint_def(1);
        cv::Ptr<cv::BackgroundSubtractor> bg = cv::createBackgroundSubtractorMOG2(hist, vt, shadow != 0);
        hspcv4::bgsub_set(bg_id, bg);
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_bgsub_create_mog2: unknown"); }
}

//  cv4_bgsub_create_knn bg_id [, history=500] [, dist2_thresh=400] [, detect_shadows=1]
CV4_EXPORT BOOL WINAPI cv4_bgsub_create_knn(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    try {
        int bg_id   = getint();
        int hist    = getint_def(500);
        double dt   = hei->HspFunc_prm_getdd(400.0);
        int shadow  = getint_def(1);
        cv::Ptr<cv::BackgroundSubtractor> bg = cv::createBackgroundSubtractorKNN(hist, dt, shadow != 0);
        hspcv4::bgsub_set(bg_id, bg);
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_bgsub_create_knn: unknown"); }
}

//  cv4_bgsub_apply bg_id, src_id, fg_id [, learning_rate=-1]
CV4_EXPORT BOOL WINAPI cv4_bgsub_apply(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    try {
        int bg_id = getint();
        int src_id = getint();
        int fg_id = getint();
        double lr = hei->HspFunc_prm_getdd(-1.0);
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
CV4_EXPORT BOOL WINAPI cv4_bgsub_free(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    int id = getint();
    hspcv4::bgsub_free(id);
    return 0;
}

// --- トラッカ ---
//    OpenCV 4.12 main build に含まれる: TrackerMIL, TrackerGOTURN, TrackerDaSiamRPN,
//    TrackerNano, TrackerVit (後者 4 つは外部モデルファイル必須)
//    KCF / CSRT は opencv_contrib にあり、本ビルドには同梱されていない。

//  cv4_tracker_create_mil tid
CV4_EXPORT BOOL WINAPI cv4_tracker_create_mil(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    try {
        int tid = getint();
        cv::Ptr<cv::Tracker> t = cv::TrackerMIL::create();
        hspcv4::tracker_set(tid, t);
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_tracker_create_mil: unknown"); }
}

//  cv4_tracker_init tid, img_id, x, y, w, h
CV4_EXPORT BOOL WINAPI cv4_tracker_init(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    try {
        int tid    = getint();
        int img_id = getint();
        int x      = getint();
        int y      = getint();
        int w      = getint();
        int h      = getint();
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
//    stat: 0=成功, 1=ロスト
CV4_EXPORT BOOL WINAPI cv4_tracker_update(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    try {
        int tid    = getint();
        int img_id = getint();
        auto* t = hspcv4::tracker_get(tid);
        if (!t || t->empty()) return fail("cv4_tracker_update: invalid tracker");
        cv::Mat* img = hspcv4::handle_get(img_id);
        if (!img || img->empty()) return fail("cv4_tracker_update: invalid image");
        cv::Rect box;
        bool ok = (*t)->update(*img, box);
        int vals[4] = { box.x, box.y, box.width, box.height };
        for (int i = 0; i < 4; ++i) {
            PVal* pv; APTR a = hei->HspFunc_prm_getva(&pv);
            if (pv->flag != HSPVAR_FLAG_INT) return fail("cv4_tracker_update: var must be int");
            pv->offset = a;
            HspVarProc* proc = hei->HspFunc_getproc(pv->flag);
            proc->Set(pv, proc->GetPtr(pv), &vals[i]);
        }
        return ok ? 0 : -1;   // -1 で stat=1 (ロスト扱い)
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_tracker_update: unknown"); }
}

//  cv4_tracker_free tid
CV4_EXPORT BOOL WINAPI cv4_tracker_free(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    int id = getint();
    hspcv4::tracker_free(id);
    return 0;
}


//============================================================================
//  Photo : denoising / inpaint / bilateral / seamless clone / decolor
//============================================================================

//  cv4_bilateral dst, src, d, sigma_color, sigma_space
CV4_EXPORT BOOL WINAPI cv4_bilateral(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    try {
        int dst_id = getint();
        int src_id = getint();
        int d      = getint_def(9);
        double sc  = hei->HspFunc_prm_getdd(75.0);
        double ss  = hei->HspFunc_prm_getdd(75.0);
        cv::Mat* src = hspcv4::handle_get(src_id);
        if (!src || src->empty()) return fail("cv4_bilateral: invalid source");
        cv::Mat out;
        cv::bilateralFilter(*src, out, d, sc, ss);
        hspcv4::handle_set(dst_id, std::move(out));
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_bilateral: unknown"); }
}

//  cv4_denoise dst, src [, h=10.0] [, template_window=7] [, search_window=21]
//    カラー画像用: fastNlMeansDenoisingColored / グレーなら fastNlMeansDenoising
CV4_EXPORT BOOL WINAPI cv4_denoise(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    try {
        int dst_id = getint();
        int src_id = getint();
        double h   = hei->HspFunc_prm_getdd(10.0);
        int tw     = getint_def(7);
        int sw     = getint_def(21);
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

//  cv4_inpaint dst, src, mask, radius [, method=INPAINT_TELEA(0)]
//    mask: 1ch binary、非 0 ピクセルが修復対象
CV4_EXPORT BOOL WINAPI cv4_inpaint(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    try {
        int dst_id  = getint();
        int src_id  = getint();
        int mask_id = getint();
        double r    = hei->HspFunc_prm_getdd(3.0);
        int method  = getint_def(cv::INPAINT_TELEA);
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

//  cv4_seamless_clone dst, src, dst_base, mask, cx, cy [, flags=NORMAL_CLONE(1)]
CV4_EXPORT BOOL WINAPI cv4_seamless_clone(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    try {
        int dst_id      = getint();
        int src_id      = getint();
        int dst_base_id = getint();
        int mask_id     = getint();
        int cx          = getint();
        int cy          = getint();
        int flags       = getint_def(cv::NORMAL_CLONE);
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
CV4_EXPORT BOOL WINAPI cv4_decolor(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    try {
        int dst_id = getint();
        int src_id = getint();
        cv::Mat* src = hspcv4::handle_get(src_id);
        if (!src || src->empty()) return fail("cv4_decolor: invalid source");
        cv::Mat gray_out, boost;
        cv::decolor(*src, gray_out, boost);
        hspcv4::handle_set(dst_id, std::move(gray_out));
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_decolor: unknown"); }
}

//  cv4_detail_enhance dst, src [, sigma_s=10] [, sigma_r=0.15]
CV4_EXPORT BOOL WINAPI cv4_detail_enhance(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    try {
        int dst_id = getint();
        int src_id = getint();
        double ss  = hei->HspFunc_prm_getdd(10.0);
        double sr  = hei->HspFunc_prm_getdd(0.15);
        cv::Mat* src = hspcv4::handle_get(src_id);
        if (!src || src->empty()) return fail("cv4_detail_enhance: invalid source");
        cv::Mat out;
        cv::detailEnhance(*src, out, (float)ss, (float)sr);
        hspcv4::handle_set(dst_id, std::move(out));
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_detail_enhance: unknown"); }
}

//  cv4_edge_preserve dst, src [, flags=1 (RECURS_FILTER)] [, sigma_s=60] [, sigma_r=0.4]
CV4_EXPORT BOOL WINAPI cv4_edge_preserve(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    try {
        int dst_id = getint();
        int src_id = getint();
        int flags  = getint_def(1);
        double ss  = hei->HspFunc_prm_getdd(60.0);
        double sr  = hei->HspFunc_prm_getdd(0.4);
        cv::Mat* src = hspcv4::handle_get(src_id);
        if (!src || src->empty()) return fail("cv4_edge_preserve: invalid source");
        cv::Mat out;
        cv::edgePreservingFilter(*src, out, flags, (float)ss, (float)sr);
        hspcv4::handle_set(dst_id, std::move(out));
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_edge_preserve: unknown"); }
}

//  cv4_stylization dst, src [, sigma_s=60] [, sigma_r=0.45]
CV4_EXPORT BOOL WINAPI cv4_stylization(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    try {
        int dst_id = getint();
        int src_id = getint();
        double ss  = hei->HspFunc_prm_getdd(60.0);
        double sr  = hei->HspFunc_prm_getdd(0.45);
        cv::Mat* src = hspcv4::handle_get(src_id);
        if (!src || src->empty()) return fail("cv4_stylization: invalid source");
        cv::Mat out;
        cv::stylization(*src, out, (float)ss, (float)sr);
        hspcv4::handle_set(dst_id, std::move(out));
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_stylization: unknown"); }
}

//  cv4_pencil_sketch dst_gray, dst_color, src [, sigma_s=60] [, sigma_r=0.07] [, shade=0.02]
CV4_EXPORT BOOL WINAPI cv4_pencil_sketch(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    try {
        int dst_gray_id  = getint();
        int dst_color_id = getint();
        int src_id       = getint();
        double ss        = hei->HspFunc_prm_getdd(60.0);
        double sr        = hei->HspFunc_prm_getdd(0.07);
        double shade     = hei->HspFunc_prm_getdd(0.02);
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

// --- 検出器 (ORB/AKAZE/SIFT は detectAndCompute で一括) ---

//  cv4_orb_detect_compute kp_id, desc_id, img_id [, nfeatures=500]
CV4_EXPORT BOOL WINAPI cv4_orb_detect_compute(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    try {
        int kp_id   = getint();
        int desc_id = getint();
        int img_id  = getint();
        int nfeat   = getint_def(500);
        cv::Mat* img = hspcv4::handle_get(img_id);
        if (!img || img->empty()) return fail("cv4_orb_detect_compute: invalid image");
        cv::Mat gray = (img->channels() == 1) ? *img : cv::Mat();
        if (gray.empty()) cv::cvtColor(*img, gray, cv::COLOR_BGR2GRAY);
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
CV4_EXPORT BOOL WINAPI cv4_akaze_detect_compute(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    try {
        int kp_id   = getint();
        int desc_id = getint();
        int img_id  = getint();
        cv::Mat* img = hspcv4::handle_get(img_id);
        if (!img || img->empty()) return fail("cv4_akaze_detect_compute: invalid image");
        cv::Mat gray = (img->channels() == 1) ? *img : cv::Mat();
        if (gray.empty()) cv::cvtColor(*img, gray, cv::COLOR_BGR2GRAY);
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

//  cv4_sift_detect_compute kp_id, desc_id, img_id [, nfeatures=0]
CV4_EXPORT BOOL WINAPI cv4_sift_detect_compute(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    try {
        int kp_id   = getint();
        int desc_id = getint();
        int img_id  = getint();
        int nfeat   = getint_def(0);
        cv::Mat* img = hspcv4::handle_get(img_id);
        if (!img || img->empty()) return fail("cv4_sift_detect_compute: invalid image");
        cv::Mat gray = (img->channels() == 1) ? *img : cv::Mat();
        if (gray.empty()) cv::cvtColor(*img, gray, cv::COLOR_BGR2GRAY);
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
CV4_EXPORT BOOL WINAPI cv4_good_features_to_track(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    try {
        int kp_id     = getint();
        int img_id    = getint();
        int max_c     = getint_def(100);
        double qlevel = hei->HspFunc_prm_getdd(0.01);
        double mindis = hei->HspFunc_prm_getdd(10.0);
        cv::Mat* img = hspcv4::handle_get(img_id);
        if (!img || img->empty()) return fail("cv4_good_features_to_track: invalid image");
        cv::Mat gray = (img->channels() == 1) ? *img : cv::Mat();
        if (gray.empty()) cv::cvtColor(*img, gray, cv::COLOR_BGR2GRAY);
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
CV4_EXPORT BOOL WINAPI cv4_corner_harris(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    try {
        int dst_id = getint();
        int src_id = getint();
        int block  = getint_def(2);
        int ksize  = getint_def(3);
        double k   = hei->HspFunc_prm_getdd(0.04);
        cv::Mat* src = hspcv4::handle_get(src_id);
        if (!src || src->empty()) return fail("cv4_corner_harris: invalid source");
        cv::Mat gray = (src->channels() == 1) ? *src : cv::Mat();
        if (gray.empty()) cv::cvtColor(*src, gray, cv::COLOR_BGR2GRAY);
        cv::Mat out;
        cv::cornerHarris(gray, out, block, ksize, k);
        hspcv4::handle_set(dst_id, std::move(out));
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_corner_harris: unknown"); }
}

// --- マッチング ---

//  cv4_bf_match match_id, desc1_id, desc2_id [, norm_type=NORM_HAMMING]
//    norm_type: 4=NORM_L2, 5=NORM_L1, 6=NORM_HAMMING, 7=NORM_HAMMING2
//    ORB/AKAZE は Hamming、SIFT は L2 を使う。
CV4_EXPORT BOOL WINAPI cv4_bf_match(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    try {
        int match_id = getint();
        int d1_id    = getint();
        int d2_id    = getint();
        int nt       = getint_def(cv::NORM_HAMMING);
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

// --- キーポイント/マッチ アクセッサ ---

//  cv4_kp_free kp_id
CV4_EXPORT BOOL WINAPI cv4_kp_free(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    int id = getint();
    hspcv4::kps_free(id);
    return 0;
}

//  cv4_kp_count kp_id, var_n
CV4_EXPORT BOOL WINAPI cv4_kp_count(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    try {
        int id = getint();
        PVal* pv; APTR a = hei->HspFunc_prm_getva(&pv);
        if (pv->flag != HSPVAR_FLAG_INT) return fail("cv4_kp_count: var must be int");
        pv->offset = a;
        auto* kps = hspcv4::kps_get(id);
        if (!kps) return fail("cv4_kp_count: invalid kp set");
        int n = (int)kps->size();
        HspVarProc* proc = hei->HspFunc_getproc(pv->flag);
        proc->Set(pv, proc->GetPtr(pv), &n);
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_kp_count: unknown"); }
}

//  cv4_kp_get kp_id, idx, var_x_x10, var_y_x10, var_size_x10, var_angle_x100, var_response_x10000
CV4_EXPORT BOOL WINAPI cv4_kp_get(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    try {
        int id  = getint();
        int idx = getint();
        auto* kps = hspcv4::kps_get(id);
        if (!kps || idx < 0 || idx >= (int)kps->size())
            return fail("cv4_kp_get: out of range");
        const auto& kp = (*kps)[idx];
        int vals[5] = {
            (int)(kp.pt.x * 10.0f),
            (int)(kp.pt.y * 10.0f),
            (int)(kp.size * 10.0f),
            (int)(kp.angle * 100.0f),
            (int)(kp.response * 10000.0f)
        };
        for (int i = 0; i < 5; ++i) {
            PVal* pv; APTR a = hei->HspFunc_prm_getva(&pv);
            if (pv->flag != HSPVAR_FLAG_INT) return fail("cv4_kp_get: var must be int");
            pv->offset = a;
            HspVarProc* proc = hei->HspFunc_getproc(pv->flag);
            proc->Set(pv, proc->GetPtr(pv), &vals[i]);
        }
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_kp_get: unknown"); }
}

//  cv4_match_free match_id
CV4_EXPORT BOOL WINAPI cv4_match_free(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    int id = getint();
    hspcv4::matches_free(id);
    return 0;
}

//  cv4_match_count match_id, var_n
CV4_EXPORT BOOL WINAPI cv4_match_count(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    try {
        int id = getint();
        PVal* pv; APTR a = hei->HspFunc_prm_getva(&pv);
        if (pv->flag != HSPVAR_FLAG_INT) return fail("cv4_match_count: var must be int");
        pv->offset = a;
        auto* ms = hspcv4::matches_get(id);
        if (!ms) return fail("cv4_match_count: invalid match set");
        int n = (int)ms->size();
        HspVarProc* proc = hei->HspFunc_getproc(pv->flag);
        proc->Set(pv, proc->GetPtr(pv), &n);
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_match_count: unknown"); }
}

//  cv4_match_get match_id, idx, var_query, var_train, var_distance_x10000
CV4_EXPORT BOOL WINAPI cv4_match_get(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    try {
        int id  = getint();
        int idx = getint();
        auto* ms = hspcv4::matches_get(id);
        if (!ms || idx < 0 || idx >= (int)ms->size())
            return fail("cv4_match_get: out of range");
        const auto& m = (*ms)[idx];
        int vals[3] = {
            m.queryIdx,
            m.trainIdx,
            (int)(m.distance * 10000.0f)
        };
        for (int i = 0; i < 3; ++i) {
            PVal* pv; APTR a = hei->HspFunc_prm_getva(&pv);
            if (pv->flag != HSPVAR_FLAG_INT) return fail("cv4_match_get: var must be int");
            pv->offset = a;
            HspVarProc* proc = hei->HspFunc_getproc(pv->flag);
            proc->Set(pv, proc->GetPtr(pv), &vals[i]);
        }
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_match_get: unknown"); }
}

// --- 描画 ---

//  cv4_draw_keypoints dst, src, kp_id [, flags=0]
CV4_EXPORT BOOL WINAPI cv4_draw_keypoints(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    try {
        int dst_id = getint();
        int src_id = getint();
        int kp_id  = getint();
        int flags  = getint_def(0);
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
CV4_EXPORT BOOL WINAPI cv4_draw_matches(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    try {
        int dst_id   = getint();
        int img1_id  = getint();
        int kp1_id   = getint();
        int img2_id  = getint();
        int kp2_id   = getint();
        int match_id = getint();
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
//  専用のハンドル型。各輪郭には 0-based インデックスでアクセスする。
//============================================================================

//  cv4_find_contours contours_id, src_id [, mode=RETR_EXTERNAL] [, method=CHAIN_APPROX_SIMPLE]
//    src は 2 値画像 (グレースケール or CV_8U)
CV4_EXPORT BOOL WINAPI cv4_find_contours(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    try {
        int cid    = getint();
        int src_id = getint();
        int mode   = getint_def(cv::RETR_EXTERNAL);
        int method = getint_def(cv::CHAIN_APPROX_SIMPLE);
        cv::Mat* src = hspcv4::handle_get(src_id);
        if (!src || src->empty()) return fail("cv4_find_contours: invalid source");
        cv::Mat gray = (src->channels() == 1) ? *src : cv::Mat();
        if (gray.empty()) cv::cvtColor(*src, gray, cv::COLOR_BGR2GRAY);
        hspcv4::ContourSet cs;
        cv::findContours(gray, cs, mode, method);
        hspcv4::contours_set(cid, std::move(cs));
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_find_contours: unknown"); }
}

//  cv4_contours_free cid
CV4_EXPORT BOOL WINAPI cv4_contours_free(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    int cid = getint();
    hspcv4::contours_free(cid);
    return 0;
}

//  cv4_contours_count cid, var_count
CV4_EXPORT BOOL WINAPI cv4_contours_count(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    try {
        int cid = getint();
        PVal* pv; APTR a = hei->HspFunc_prm_getva(&pv);
        if (pv->flag != HSPVAR_FLAG_INT) return fail("cv4_contours_count: var must be int");
        pv->offset = a;
        auto* cs = hspcv4::contours_get(cid);
        if (!cs) return fail("cv4_contours_count: invalid contour set");
        int n = (int)cs->size();
        HspVarProc* proc = hei->HspFunc_getproc(pv->flag);
        proc->Set(pv, proc->GetPtr(pv), &n);
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_contours_count: unknown"); }
}

//  cv4_draw_contours dst_id, cid, index, b, g, r, thickness
//    index = -1 で全輪郭を描画
CV4_EXPORT BOOL WINAPI cv4_draw_contours(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    try {
        int dst_id = getint();
        int cid    = getint();
        int idx    = getint();
        int b      = getint();
        int g      = getint();
        int r      = getint();
        int thick  = getint_def(1);
        cv::Mat* dst = hspcv4::handle_get(dst_id);
        if (!dst || dst->empty()) return fail("cv4_draw_contours: invalid dst");
        auto* cs = hspcv4::contours_get(cid);
        if (!cs) return fail("cv4_draw_contours: invalid contour set");
        cv::drawContours(*dst, *cs, idx, cv::Scalar(b, g, r), thick);
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_draw_contours: unknown"); }
}

//  cv4_contour_area cid, index, var_area_x100
CV4_EXPORT BOOL WINAPI cv4_contour_area(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    try {
        int cid = getint();
        int idx = getint();
        PVal* pv; APTR a = hei->HspFunc_prm_getva(&pv);
        if (pv->flag != HSPVAR_FLAG_INT) return fail("cv4_contour_area: var must be int");
        pv->offset = a;
        auto* cs = hspcv4::contours_get(cid);
        if (!cs || idx < 0 || idx >= (int)cs->size())
            return fail("cv4_contour_area: out of range");
        double area = cv::contourArea((*cs)[idx]);
        int iv = (int)area;  // 面積は大きい値になりがちなので固定小数点でなく整数
        HspVarProc* proc = hei->HspFunc_getproc(pv->flag);
        proc->Set(pv, proc->GetPtr(pv), &iv);
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_contour_area: unknown"); }
}

//  cv4_contour_length cid, index, closed, var_len_x100
CV4_EXPORT BOOL WINAPI cv4_contour_length(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    try {
        int cid    = getint();
        int idx    = getint();
        int closed = getint_def(1);
        PVal* pv; APTR a = hei->HspFunc_prm_getva(&pv);
        if (pv->flag != HSPVAR_FLAG_INT) return fail("cv4_contour_length: var must be int");
        pv->offset = a;
        auto* cs = hspcv4::contours_get(cid);
        if (!cs || idx < 0 || idx >= (int)cs->size())
            return fail("cv4_contour_length: out of range");
        double len = cv::arcLength((*cs)[idx], closed != 0);
        int iv = (int)(len * 100.0);   // x100 固定小数点
        HspVarProc* proc = hei->HspFunc_getproc(pv->flag);
        proc->Set(pv, proc->GetPtr(pv), &iv);
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_contour_length: unknown"); }
}

//  cv4_bounding_rect cid, index, var_x, var_y, var_w, var_h
CV4_EXPORT BOOL WINAPI cv4_bounding_rect(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    try {
        int cid = getint();
        int idx = getint();
        auto* cs = hspcv4::contours_get(cid);
        if (!cs || idx < 0 || idx >= (int)cs->size())
            return fail("cv4_bounding_rect: out of range");
        cv::Rect r = cv::boundingRect((*cs)[idx]);
        int vals[4] = { r.x, r.y, r.width, r.height };
        for (int i = 0; i < 4; ++i) {
            PVal* pv; APTR a = hei->HspFunc_prm_getva(&pv);
            if (pv->flag != HSPVAR_FLAG_INT) return fail("cv4_bounding_rect: var must be int");
            pv->offset = a;
            HspVarProc* proc = hei->HspFunc_getproc(pv->flag);
            proc->Set(pv, proc->GetPtr(pv), &vals[i]);
        }
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_bounding_rect: unknown"); }
}

//  cv4_min_area_rect cid, index, var_cx_x10, var_cy_x10, var_w_x10, var_h_x10, var_angle_x100
//    回転矩形の中心 (double) と幅高さ (double) は x10 固定小数点、角度は x100。
CV4_EXPORT BOOL WINAPI cv4_min_area_rect(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    try {
        int cid = getint();
        int idx = getint();
        auto* cs = hspcv4::contours_get(cid);
        if (!cs || idx < 0 || idx >= (int)cs->size())
            return fail("cv4_min_area_rect: out of range");
        cv::RotatedRect rr = cv::minAreaRect((*cs)[idx]);
        int vals[5] = {
            (int)(rr.center.x * 10.0),
            (int)(rr.center.y * 10.0),
            (int)(rr.size.width * 10.0),
            (int)(rr.size.height * 10.0),
            (int)(rr.angle * 100.0)
        };
        for (int i = 0; i < 5; ++i) {
            PVal* pv; APTR a = hei->HspFunc_prm_getva(&pv);
            if (pv->flag != HSPVAR_FLAG_INT) return fail("cv4_min_area_rect: var must be int");
            pv->offset = a;
            HspVarProc* proc = hei->HspFunc_getproc(pv->flag);
            proc->Set(pv, proc->GetPtr(pv), &vals[i]);
        }
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_min_area_rect: unknown"); }
}

//  cv4_min_enclosing_circle cid, index, var_cx_x10, var_cy_x10, var_r_x10
CV4_EXPORT BOOL WINAPI cv4_min_enclosing_circle(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    try {
        int cid = getint();
        int idx = getint();
        auto* cs = hspcv4::contours_get(cid);
        if (!cs || idx < 0 || idx >= (int)cs->size())
            return fail("cv4_min_enclosing_circle: out of range");
        cv::Point2f center;
        float radius = 0;
        cv::minEnclosingCircle((*cs)[idx], center, radius);
        int vals[3] = {
            (int)(center.x * 10.0f),
            (int)(center.y * 10.0f),
            (int)(radius * 10.0f)
        };
        for (int i = 0; i < 3; ++i) {
            PVal* pv; APTR a = hei->HspFunc_prm_getva(&pv);
            if (pv->flag != HSPVAR_FLAG_INT) return fail("cv4_min_enclosing_circle: var must be int");
            pv->offset = a;
            HspVarProc* proc = hei->HspFunc_getproc(pv->flag);
            proc->Set(pv, proc->GetPtr(pv), &vals[i]);
        }
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_min_enclosing_circle: unknown"); }
}

//  cv4_approx_poly_dp cid_src, index, cid_dst, epsilon, closed
//    cid_dst: 結果を格納する新しい contour set (単一の輪郭を含む)
CV4_EXPORT BOOL WINAPI cv4_approx_poly_dp(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    try {
        int cid_src  = getint();
        int idx      = getint();
        int cid_dst  = getint();
        double eps   = hei->HspFunc_prm_getdd(3.0);
        int closed   = getint_def(1);
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
CV4_EXPORT BOOL WINAPI cv4_convex_hull(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    try {
        int cid_src = getint();
        int idx     = getint();
        int cid_dst = getint();
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
//    特定の輪郭の特定の頂点座標を取得
CV4_EXPORT BOOL WINAPI cv4_contour_point(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    try {
        int cid     = getint();
        int idx     = getint();
        int pt_idx  = getint();
        auto* cs = hspcv4::contours_get(cid);
        if (!cs || idx < 0 || idx >= (int)cs->size())
            return fail("cv4_contour_point: contour out of range");
        const auto& poly = (*cs)[idx];
        if (pt_idx < 0 || pt_idx >= (int)poly.size())
            return fail("cv4_contour_point: point out of range");
        int vals[2] = { poly[pt_idx].x, poly[pt_idx].y };
        for (int i = 0; i < 2; ++i) {
            PVal* pv; APTR a = hei->HspFunc_prm_getva(&pv);
            if (pv->flag != HSPVAR_FLAG_INT) return fail("cv4_contour_point: var must be int");
            pv->offset = a;
            HspVarProc* proc = hei->HspFunc_getproc(pv->flag);
            proc->Set(pv, proc->GetPtr(pv), &vals[i]);
        }
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_contour_point: unknown"); }
}

//  cv4_contour_size cid, idx, var_n
CV4_EXPORT BOOL WINAPI cv4_contour_size(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    try {
        int cid = getint();
        int idx = getint();
        PVal* pv; APTR a = hei->HspFunc_prm_getva(&pv);
        if (pv->flag != HSPVAR_FLAG_INT) return fail("cv4_contour_size: var must be int");
        pv->offset = a;
        auto* cs = hspcv4::contours_get(cid);
        if (!cs || idx < 0 || idx >= (int)cs->size())
            return fail("cv4_contour_size: out of range");
        int n = (int)(*cs)[idx].size();
        HspVarProc* proc = hei->HspFunc_getproc(pv->flag);
        proc->Set(pv, proc->GetPtr(pv), &n);
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_contour_size: unknown"); }
}

//  cv4_moments cid, idx, var_cx_x10, var_cy_x10, var_m00
//    重心 (double) を x10 固定小数点、面積 m00 を整数で返す。
CV4_EXPORT BOOL WINAPI cv4_moments(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    try {
        int cid = getint();
        int idx = getint();
        auto* cs = hspcv4::contours_get(cid);
        if (!cs || idx < 0 || idx >= (int)cs->size())
            return fail("cv4_moments: out of range");
        cv::Moments m = cv::moments((*cs)[idx]);
        int vals[3];
        if (m.m00 > 0.0) {
            vals[0] = (int)((m.m10 / m.m00) * 10.0);
            vals[1] = (int)((m.m01 / m.m00) * 10.0);
        } else {
            vals[0] = 0; vals[1] = 0;
        }
        vals[2] = (int)m.m00;
        for (int i = 0; i < 3; ++i) {
            PVal* pv; APTR a = hei->HspFunc_prm_getva(&pv);
            if (pv->flag != HSPVAR_FLAG_INT) return fail("cv4_moments: var must be int");
            pv->offset = a;
            HspVarProc* proc = hei->HspFunc_getproc(pv->flag);
            proc->Set(pv, proc->GetPtr(pv), &vals[i]);
        }
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_moments: unknown"); }
}


//============================================================================
//  Core Mat operations : arithmetic / bitwise / statistics / channels
//============================================================================

// --- 算術演算 ---

//  cv4_add         dst, a_id, b_id
CV4_EXPORT BOOL WINAPI cv4_add(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    try {
        int dst = getint();
        int aid = getint();
        int bid = getint();
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
CV4_EXPORT BOOL WINAPI cv4_sub(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    try {
        int dst = getint();
        int aid = getint();
        int bid = getint();
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

//  cv4_mul         dst, a_id, b_id [, scale=1.0]
CV4_EXPORT BOOL WINAPI cv4_mul(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    try {
        int dst = getint();
        int aid = getint();
        int bid = getint();
        double scale = hei->HspFunc_prm_getdd(1.0);
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

//  cv4_div         dst, a_id, b_id [, scale=1.0]
CV4_EXPORT BOOL WINAPI cv4_div(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    try {
        int dst = getint();
        int aid = getint();
        int bid = getint();
        double scale = hei->HspFunc_prm_getdd(1.0);
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
CV4_EXPORT BOOL WINAPI cv4_abs_diff(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    try {
        int dst = getint();
        int aid = getint();
        int bid = getint();
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
CV4_EXPORT BOOL WINAPI cv4_add_weighted(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    try {
        int dst        = getint();
        int aid        = getint();
        double alpha   = hei->HspFunc_prm_getdd(0.5);
        int bid        = getint();
        double beta    = hei->HspFunc_prm_getdd(0.5);
        double gamma   = hei->HspFunc_prm_getdd(0.0);
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

// --- スカラー演算 (定数を Mat に加算等) ---

//  cv4_add_scalar dst, src, s_b, s_g, s_r
CV4_EXPORT BOOL WINAPI cv4_add_scalar(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    try {
        int dst = getint();
        int src = getint();
        double sb = hei->HspFunc_prm_getdd(0.0);
        double sg = hei->HspFunc_prm_getdd(0.0);
        double sr = hei->HspFunc_prm_getdd(0.0);
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
CV4_EXPORT BOOL WINAPI cv4_mul_scalar(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    try {
        int dst = getint();
        int src = getint();
        double scale = hei->HspFunc_prm_getdd(1.0);
        cv::Mat* s = hspcv4::handle_get(src);
        if (!s || s->empty()) return fail("cv4_mul_scalar: invalid source");
        cv::Mat out;
        (*s).convertTo(out, -1, scale, 0);
        hspcv4::handle_set(dst, std::move(out));
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_mul_scalar: unknown"); }
}

// --- ビット演算 ---

//  cv4_bit_and dst, a, b
CV4_EXPORT BOOL WINAPI cv4_bit_and(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    try {
        int dst = getint();
        int aid = getint();
        int bid = getint();
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
CV4_EXPORT BOOL WINAPI cv4_bit_or(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    try {
        int dst = getint();
        int aid = getint();
        int bid = getint();
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
CV4_EXPORT BOOL WINAPI cv4_bit_xor(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    try {
        int dst = getint();
        int aid = getint();
        int bid = getint();
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
CV4_EXPORT BOOL WINAPI cv4_bit_not(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    try {
        int dst = getint();
        int src = getint();
        cv::Mat* s = hspcv4::handle_get(src);
        if (!s || s->empty()) return fail("cv4_bit_not: invalid source");
        cv::Mat out;
        cv::bitwise_not(*s, out);
        hspcv4::handle_set(dst, std::move(out));
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_bit_not: unknown"); }
}

// --- 比較 ---

//  cv4_compare dst, a, b, cmpop
//    cmpop: 0=EQ, 1=GT, 2=GE, 3=LT, 4=LE, 5=NE (cv::CmpTypes に対応)
CV4_EXPORT BOOL WINAPI cv4_compare(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    try {
        int dst = getint();
        int aid = getint();
        int bid = getint();
        int op  = getint();
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

// --- 統計 ---

//  cv4_mean id, var_mean_b_x10000, var_mean_g_x10000, var_mean_r_x10000
CV4_EXPORT BOOL WINAPI cv4_mean(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    try {
        int id = getint();
        cv::Mat* m = hspcv4::handle_get(id);
        if (!m || m->empty()) return fail("cv4_mean: invalid handle");
        cv::Scalar s = cv::mean(*m);
        int vals[3] = {
            (int)(s[0] * 10000.0),
            (int)(s[1] * 10000.0),
            (int)(s[2] * 10000.0)
        };
        for (int i = 0; i < 3; ++i) {
            PVal* pv; APTR a = hei->HspFunc_prm_getva(&pv);
            if (pv->flag != HSPVAR_FLAG_INT) return fail("cv4_mean: var must be int");
            pv->offset = a;
            HspVarProc* proc = hei->HspFunc_getproc(pv->flag);
            proc->Set(pv, proc->GetPtr(pv), &vals[i]);
        }
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_mean: unknown"); }
}

//  cv4_sum id, var_sum_b_x10000, var_sum_g_x10000, var_sum_r_x10000
CV4_EXPORT BOOL WINAPI cv4_sum(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    try {
        int id = getint();
        cv::Mat* m = hspcv4::handle_get(id);
        if (!m || m->empty()) return fail("cv4_sum: invalid handle");
        cv::Scalar s = cv::sum(*m);
        // sum はオーバーフローしやすいので x10000 ではなく 1.0 倍で格納
        int vals[3] = { (int)s[0], (int)s[1], (int)s[2] };
        for (int i = 0; i < 3; ++i) {
            PVal* pv; APTR a = hei->HspFunc_prm_getva(&pv);
            if (pv->flag != HSPVAR_FLAG_INT) return fail("cv4_sum: var must be int");
            pv->offset = a;
            HspVarProc* proc = hei->HspFunc_getproc(pv->flag);
            proc->Set(pv, proc->GetPtr(pv), &vals[i]);
        }
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_sum: unknown"); }
}

//  cv4_count_nonzero id, var_count
CV4_EXPORT BOOL WINAPI cv4_count_nonzero(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    try {
        int id = getint();
        PVal* pv; APTR a = hei->HspFunc_prm_getva(&pv);
        if (pv->flag != HSPVAR_FLAG_INT) return fail("cv4_count_nonzero: var must be int");
        pv->offset = a;
        cv::Mat* m = hspcv4::handle_get(id);
        if (!m || m->empty()) return fail("cv4_count_nonzero: invalid handle");
        cv::Mat gray = (m->channels() == 1) ? *m : cv::Mat();
        if (gray.empty()) cv::cvtColor(*m, gray, cv::COLOR_BGR2GRAY);
        int n = cv::countNonZero(gray);
        HspVarProc* proc = hei->HspFunc_getproc(pv->flag);
        proc->Set(pv, proc->GetPtr(pv), &n);
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_count_nonzero: unknown"); }
}

// --- チャンネル操作 ---

//  cv4_split src_id, b_id, g_id, r_id
//    3ch 画像を B / G / R の 1ch 画像 3 枚に分解
CV4_EXPORT BOOL WINAPI cv4_split(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    try {
        int src_id = getint();
        int b_id   = getint();
        int g_id   = getint();
        int r_id   = getint();
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
CV4_EXPORT BOOL WINAPI cv4_merge(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    try {
        int dst_id = getint();
        int b_id   = getint();
        int g_id   = getint();
        int r_id   = getint();
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

// --- Mat 作成 ---

//  cv4_mat_zeros dst, rows, cols, channels
//    channels=1 or 3 の CV_8U を作成 (全 0)
CV4_EXPORT BOOL WINAPI cv4_mat_zeros(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    try {
        int dst = getint();
        int rows = getint();
        int cols = getint();
        int ch   = getint_def(3);
        int type = (ch == 1) ? CV_8UC1 : CV_8UC3;
        cv::Mat out = cv::Mat::zeros(rows, cols, type);
        hspcv4::handle_set(dst, std::move(out));
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_mat_zeros: unknown"); }
}

//  cv4_mat_full dst, rows, cols, b, g, r
//    3ch CV_8U の Mat を B,G,R で塗りつぶして作成
CV4_EXPORT BOOL WINAPI cv4_mat_full(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    try {
        int dst  = getint();
        int rows = getint();
        int cols = getint();
        int b    = getint();
        int g    = getint();
        int r    = getint();
        cv::Mat out(rows, cols, CV_8UC3, cv::Scalar(b, g, r));
        hspcv4::handle_set(dst, std::move(out));
        return 0;
    } catch (const cv::Exception& e) { return fail(e.what()); }
      catch (...) { return fail("cv4_mat_full: unknown"); }
}

// --- マスク操作 ---

//  cv4_copy_masked dst, src, mask
//    mask の非 0 ピクセル部分だけ src を dst にコピー (dst の他の部分は保持)
CV4_EXPORT BOOL WINAPI cv4_copy_masked(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    try {
        int dst_id  = getint();
        int src_id  = getint();
        int mask_id = getint();
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
