//
//  hspcv4_contrib.cpp
//  hspcv4.dll から遅延ロードされる補助 DLL。opencv_contrib の機能を提供。
//
//  公開シンボル名は cv4_xxx_impl (末尾 _impl)。呼出し規約は:
//      int __stdcall cv4_xxx_impl(HSPEXINFO* hei, int p1, int p2, int p3,
//                                 const hspcv4_handle_api_t* api)
//
//  main DLL 側の proxy stub が HSPEXINFO とハンドル API テーブルを渡してくる。
//  このファイル内の関数は HSP プラグインとして呼ばれるわけではない。
//
#define WIN32_LEAN_AND_MEAN
#include <windows.h>

#pragma warning(push)
#pragma warning(disable: 4819)
#include <opencv2/core.hpp>
#include <opencv2/imgproc.hpp>
#include <opencv2/video.hpp>      // cv::Tracker base class
#include <opencv2/tracking.hpp>   // contrib: TrackerCSRT / TrackerKCF
#include <opencv2/features2d.hpp>
#include <opencv2/xfeatures2d.hpp>  // contrib: BRIEF / FREAK / DAISY / Star / HarrisLaplace
#include <opencv2/bgsegm.hpp>       // contrib: CNT/GMG/LSBP/GSOC/MOG
#include <opencv2/ximgproc.hpp>     // contrib: thinning/guided/anisotropic/etc
#include <opencv2/img_hash.hpp>     // contrib: aHash/pHash/blockMean/etc
#include <opencv2/optflow.hpp>      // contrib: DualTVL1/DeepFlow/SparseToDense/SimpleFlow
#pragma warning(pop)

#include "../src/hspcv4_capi.h"

// hsp3 の HSPEXINFO など
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
#pragma warning(pop)

#define CV4C_EXPORT extern "C" __declspec(dllexport)


BOOL WINAPI DllMain(HINSTANCE, DWORD reason, LPVOID)
{
    (void)reason;
    return TRUE;
}


//============================================================================
//  cv4_contrib_version_impl
//  最初のテスト関数: OpenCV のバージョン文字列を str 変数に格納する。
//
//  HSP 側の呼び出し形:
//      cv4_contrib_version var_str
//
//  main DLL から proxy で呼ばれる: stub は prm_get で var_str の PVal を
//  取り込み、ここでは api 経由ではなく HSPEXINFO 経由で直接書き込む。
//  (str 書き込みはハンドル空間に関係しないので api は不要)
//============================================================================
CV4C_EXPORT int __stdcall cv4_contrib_version_impl(
    HSPEXINFO* hei, int p1, int p2, int p3,
    const hspcv4_handle_api_t* api)
{
    (void)p1; (void)p2; (void)p3;
    try {
        PVal* pv; APTR a = hei->HspFunc_prm_getva(&pv);
        if (pv->flag != HSPVAR_FLAG_STR) {
            if (api) api->set_last_error("cv4_contrib_version: var must be str");
            return -1;
        }
        pv->offset = a;

        std::string ver = cv::getVersionString();
        ver += " (hspcv4_contrib loaded)";

        HspVarProc* proc = hei->HspFunc_getproc(pv->flag);
        proc->Set(pv, proc->GetPtr(pv), (void*)ver.c_str());
        return 0;
    } catch (const cv::Exception& e) {
        if (api) api->set_last_error(e.what());
        return -1;
    } catch (...) {
        if (api) api->set_last_error("cv4_contrib_version: unknown exception");
        return -1;
    }
}


//============================================================================
//  Phase 13b-1 : tracking module (TrackerCSRT / TrackerKCF)
//
//  既存の cv4_tracker_init / update / free は cv::Ptr<cv::Tracker> 抽象を
//  使うので、KCF/CSRT トラッカに対しても再利用できる。
//============================================================================

//  cv4_tracker_create_csrt tid
CV4C_EXPORT int __stdcall cv4_tracker_create_csrt_impl(
    HSPEXINFO* hei, int p1, int p2, int p3,
    const hspcv4_handle_api_t* api)
{
    (void)p1; (void)p2; (void)p3;
    try {
        int tid = hei->HspFunc_prm_geti();
        cv::Ptr<cv::Tracker> t = cv::TrackerCSRT::create();
        api->tracker_set_copy(tid, &t);
        return 0;
    } catch (const cv::Exception& e) {
        if (api) api->set_last_error(e.what());
        return -1;
    } catch (...) {
        if (api) api->set_last_error("cv4_tracker_create_csrt: unknown");
        return -1;
    }
}

//  cv4_tracker_create_kcf tid
CV4C_EXPORT int __stdcall cv4_tracker_create_kcf_impl(
    HSPEXINFO* hei, int p1, int p2, int p3,
    const hspcv4_handle_api_t* api)
{
    (void)p1; (void)p2; (void)p3;
    try {
        int tid = hei->HspFunc_prm_geti();
        cv::Ptr<cv::Tracker> t = cv::TrackerKCF::create();
        api->tracker_set_copy(tid, &t);
        return 0;
    } catch (const cv::Exception& e) {
        if (api) api->set_last_error(e.what());
        return -1;
    } catch (...) {
        if (api) api->set_last_error("cv4_tracker_create_kcf: unknown");
        return -1;
    }
}


//============================================================================
//  Phase 13b-3 : xfeatures2d (BRIEF / FREAK / DAISY / Star / HarrisLaplace)
//
//  Detector classes (Star, HarrisLaplace) は keypoints を生成する。
//  Descriptor classes (BRIEF, FREAK, DAISY) は既存 keypoints から記述子を計算
//  (compute は keypoints を破壊的に書き換えることがある)。
//============================================================================

// 共通: img_id をグレースケール化して取得
static cv::Mat get_gray_image(const hspcv4_handle_api_t* api, int img_id, const char* fn)
{
    cv::Mat* img = static_cast<cv::Mat*>(api->mat_get(img_id));
    if (!img || img->empty()) {
        api->set_last_error("invalid image");
        return cv::Mat();
    }
    cv::Mat gray = (img->channels() == 1) ? *img : cv::Mat();
    if (gray.empty()) cv::cvtColor(*img, gray, cv::COLOR_BGR2GRAY);
    return gray;
}

//  cv4_star_detect kp_id, img_id
CV4C_EXPORT int __stdcall cv4_star_detect_impl(
    HSPEXINFO* hei, int p1, int p2, int p3,
    const hspcv4_handle_api_t* api)
{
    (void)p1; (void)p2; (void)p3;
    try {
        int kp_id  = hei->HspFunc_prm_geti();
        int img_id = hei->HspFunc_prm_geti();
        cv::Mat gray = get_gray_image(api, img_id, "cv4_star_detect");
        if (gray.empty()) return -1;
        auto star = cv::xfeatures2d::StarDetector::create();
        std::vector<cv::KeyPoint> kps;
        star->detect(gray, kps);
        api->kps_set_move(kp_id, &kps);
        return 0;
    } catch (const cv::Exception& e) {
        api->set_last_error(e.what());
        return -1;
    } catch (...) {
        api->set_last_error("cv4_star_detect: unknown");
        return -1;
    }
}

//  cv4_harris_laplace_detect kp_id, img_id
CV4C_EXPORT int __stdcall cv4_harris_laplace_detect_impl(
    HSPEXINFO* hei, int p1, int p2, int p3,
    const hspcv4_handle_api_t* api)
{
    (void)p1; (void)p2; (void)p3;
    try {
        int kp_id  = hei->HspFunc_prm_geti();
        int img_id = hei->HspFunc_prm_geti();
        cv::Mat gray = get_gray_image(api, img_id, "cv4_harris_laplace_detect");
        if (gray.empty()) return -1;
        auto hl = cv::xfeatures2d::HarrisLaplaceFeatureDetector::create();
        std::vector<cv::KeyPoint> kps;
        hl->detect(gray, kps);
        api->kps_set_move(kp_id, &kps);
        return 0;
    } catch (const cv::Exception& e) {
        api->set_last_error(e.what());
        return -1;
    } catch (...) {
        api->set_last_error("cv4_harris_laplace_detect: unknown");
        return -1;
    }
}

//  cv4_brief_compute kp_id, desc_id, img_id [, bytes=32]
CV4C_EXPORT int __stdcall cv4_brief_compute_impl(
    HSPEXINFO* hei, int p1, int p2, int p3,
    const hspcv4_handle_api_t* api)
{
    (void)p1; (void)p2; (void)p3;
    try {
        int kp_id   = hei->HspFunc_prm_geti();
        int desc_id = hei->HspFunc_prm_geti();
        int img_id  = hei->HspFunc_prm_geti();
        int bytes   = hei->HspFunc_prm_getdi(32);
        cv::Mat gray = get_gray_image(api, img_id, "cv4_brief_compute");
        if (gray.empty()) return -1;
        auto* kps = static_cast<std::vector<cv::KeyPoint>*>(api->kps_get(kp_id));
        if (!kps) { api->set_last_error("invalid kp set"); return -1; }
        auto brief = cv::xfeatures2d::BriefDescriptorExtractor::create(bytes);
        cv::Mat desc;
        brief->compute(gray, *kps, desc);
        api->mat_set_move(desc_id, &desc);
        return 0;
    } catch (const cv::Exception& e) {
        api->set_last_error(e.what());
        return -1;
    } catch (...) {
        api->set_last_error("cv4_brief_compute: unknown");
        return -1;
    }
}

//  cv4_freak_compute kp_id, desc_id, img_id
CV4C_EXPORT int __stdcall cv4_freak_compute_impl(
    HSPEXINFO* hei, int p1, int p2, int p3,
    const hspcv4_handle_api_t* api)
{
    (void)p1; (void)p2; (void)p3;
    try {
        int kp_id   = hei->HspFunc_prm_geti();
        int desc_id = hei->HspFunc_prm_geti();
        int img_id  = hei->HspFunc_prm_geti();
        cv::Mat gray = get_gray_image(api, img_id, "cv4_freak_compute");
        if (gray.empty()) return -1;
        auto* kps = static_cast<std::vector<cv::KeyPoint>*>(api->kps_get(kp_id));
        if (!kps) { api->set_last_error("invalid kp set"); return -1; }
        auto freak = cv::xfeatures2d::FREAK::create();
        cv::Mat desc;
        freak->compute(gray, *kps, desc);
        api->mat_set_move(desc_id, &desc);
        return 0;
    } catch (const cv::Exception& e) {
        api->set_last_error(e.what());
        return -1;
    } catch (...) {
        api->set_last_error("cv4_freak_compute: unknown");
        return -1;
    }
}

//  cv4_daisy_compute kp_id, desc_id, img_id
CV4C_EXPORT int __stdcall cv4_daisy_compute_impl(
    HSPEXINFO* hei, int p1, int p2, int p3,
    const hspcv4_handle_api_t* api)
{
    (void)p1; (void)p2; (void)p3;
    try {
        int kp_id   = hei->HspFunc_prm_geti();
        int desc_id = hei->HspFunc_prm_geti();
        int img_id  = hei->HspFunc_prm_geti();
        cv::Mat gray = get_gray_image(api, img_id, "cv4_daisy_compute");
        if (gray.empty()) return -1;
        auto* kps = static_cast<std::vector<cv::KeyPoint>*>(api->kps_get(kp_id));
        if (!kps) { api->set_last_error("invalid kp set"); return -1; }
        auto daisy = cv::xfeatures2d::DAISY::create();
        cv::Mat desc;
        daisy->compute(gray, *kps, desc);
        api->mat_set_move(desc_id, &desc);
        return 0;
    } catch (const cv::Exception& e) {
        api->set_last_error(e.what());
        return -1;
    } catch (...) {
        api->set_last_error("cv4_daisy_compute: unknown");
        return -1;
    }
}


//============================================================================
//  Phase 13b-4 : bgsegm (CNT / GMG / LSBP / GSOC / MOG)
//============================================================================

//  cv4_bgsub_create_cnt bg_id [, min_pixel_stability=15] [, use_hist=1] [, max_pixel_stability=15*60] [, is_parallel=1]
CV4C_EXPORT int __stdcall cv4_bgsub_create_cnt_impl(
    HSPEXINFO* hei, int p1, int p2, int p3,
    const hspcv4_handle_api_t* api)
{
    (void)p1; (void)p2; (void)p3;
    try {
        int bg_id   = hei->HspFunc_prm_geti();
        int min_st  = hei->HspFunc_prm_getdi(15);
        int use_h   = hei->HspFunc_prm_getdi(1);
        int max_st  = hei->HspFunc_prm_getdi(15 * 60);
        int par     = hei->HspFunc_prm_getdi(1);
        cv::Ptr<cv::BackgroundSubtractor> bg =
            cv::bgsegm::createBackgroundSubtractorCNT(min_st, use_h != 0, max_st, par != 0);
        api->bgsub_set_copy(bg_id, &bg);
        return 0;
    } catch (const cv::Exception& e) {
        api->set_last_error(e.what()); return -1;
    } catch (...) { api->set_last_error("cv4_bgsub_create_cnt: unknown"); return -1; }
}

//  cv4_bgsub_create_gmg bg_id [, init_frames=120] [, decision_thresh=0.8]
CV4C_EXPORT int __stdcall cv4_bgsub_create_gmg_impl(
    HSPEXINFO* hei, int p1, int p2, int p3,
    const hspcv4_handle_api_t* api)
{
    (void)p1; (void)p2; (void)p3;
    try {
        int bg_id  = hei->HspFunc_prm_geti();
        int init   = hei->HspFunc_prm_getdi(120);
        double dth = hei->HspFunc_prm_getdd(0.8);
        cv::Ptr<cv::BackgroundSubtractor> bg =
            cv::bgsegm::createBackgroundSubtractorGMG(init, dth);
        api->bgsub_set_copy(bg_id, &bg);
        return 0;
    } catch (const cv::Exception& e) {
        api->set_last_error(e.what()); return -1;
    } catch (...) { api->set_last_error("cv4_bgsub_create_gmg: unknown"); return -1; }
}

//  cv4_bgsub_create_lsbp bg_id
CV4C_EXPORT int __stdcall cv4_bgsub_create_lsbp_impl(
    HSPEXINFO* hei, int p1, int p2, int p3,
    const hspcv4_handle_api_t* api)
{
    (void)p1; (void)p2; (void)p3;
    try {
        int bg_id = hei->HspFunc_prm_geti();
        cv::Ptr<cv::BackgroundSubtractor> bg =
            cv::bgsegm::createBackgroundSubtractorLSBP();
        api->bgsub_set_copy(bg_id, &bg);
        return 0;
    } catch (const cv::Exception& e) {
        api->set_last_error(e.what()); return -1;
    } catch (...) { api->set_last_error("cv4_bgsub_create_lsbp: unknown"); return -1; }
}

//  cv4_bgsub_create_gsoc bg_id
CV4C_EXPORT int __stdcall cv4_bgsub_create_gsoc_impl(
    HSPEXINFO* hei, int p1, int p2, int p3,
    const hspcv4_handle_api_t* api)
{
    (void)p1; (void)p2; (void)p3;
    try {
        int bg_id = hei->HspFunc_prm_geti();
        cv::Ptr<cv::BackgroundSubtractor> bg =
            cv::bgsegm::createBackgroundSubtractorGSOC();
        api->bgsub_set_copy(bg_id, &bg);
        return 0;
    } catch (const cv::Exception& e) {
        api->set_last_error(e.what()); return -1;
    } catch (...) { api->set_last_error("cv4_bgsub_create_gsoc: unknown"); return -1; }
}

//  cv4_bgsub_create_mog bg_id [, history=200] [, n_mixtures=5] [, bg_ratio=0.7] [, noise_sigma=0]
CV4C_EXPORT int __stdcall cv4_bgsub_create_mog_impl(
    HSPEXINFO* hei, int p1, int p2, int p3,
    const hspcv4_handle_api_t* api)
{
    (void)p1; (void)p2; (void)p3;
    try {
        int bg_id    = hei->HspFunc_prm_geti();
        int history  = hei->HspFunc_prm_getdi(200);
        int nmix     = hei->HspFunc_prm_getdi(5);
        double br    = hei->HspFunc_prm_getdd(0.7);
        double ns    = hei->HspFunc_prm_getdd(0.0);
        cv::Ptr<cv::BackgroundSubtractor> bg =
            cv::bgsegm::createBackgroundSubtractorMOG(history, nmix, br, ns);
        api->bgsub_set_copy(bg_id, &bg);
        return 0;
    } catch (const cv::Exception& e) {
        api->set_last_error(e.what()); return -1;
    } catch (...) { api->set_last_error("cv4_bgsub_create_mog: unknown"); return -1; }
}


//============================================================================
//  Phase 13b-5 : ximgproc (selected functions)
//============================================================================

// 共通: get_mat_or_fail
static cv::Mat* get_mat(const hspcv4_handle_api_t* api, int id, const char* msg)
{
    cv::Mat* m = static_cast<cv::Mat*>(api->mat_get(id));
    if (!m || m->empty()) {
        api->set_last_error(msg);
        return nullptr;
    }
    return m;
}

//  cv4_thinning dst_id, src_id [, type=0]   (0=ZHANGSUEN, 1=GUOHALL)
CV4C_EXPORT int __stdcall cv4_thinning_impl(
    HSPEXINFO* hei, int p1, int p2, int p3,
    const hspcv4_handle_api_t* api)
{
    (void)p1; (void)p2; (void)p3;
    try {
        int dst_id = hei->HspFunc_prm_geti();
        int src_id = hei->HspFunc_prm_geti();
        int type   = hei->HspFunc_prm_getdi(0);
        cv::Mat* src = get_mat(api, src_id, "cv4_thinning: invalid source");
        if (!src) return -1;
        cv::Mat gray = (src->channels() == 1) ? *src : cv::Mat();
        if (gray.empty()) cv::cvtColor(*src, gray, cv::COLOR_BGR2GRAY);
        cv::Mat out;
        cv::ximgproc::thinning(gray, out, type);
        api->mat_set_move(dst_id, &out);
        return 0;
    } catch (const cv::Exception& e) { api->set_last_error(e.what()); return -1; }
      catch (...) { api->set_last_error("cv4_thinning: unknown"); return -1; }
}

//  cv4_niblack dst_id, src_id, max_value, type, block_size, k
CV4C_EXPORT int __stdcall cv4_niblack_impl(
    HSPEXINFO* hei, int p1, int p2, int p3,
    const hspcv4_handle_api_t* api)
{
    (void)p1; (void)p2; (void)p3;
    try {
        int dst_id  = hei->HspFunc_prm_geti();
        int src_id  = hei->HspFunc_prm_geti();
        double mv   = hei->HspFunc_prm_getdd(255.0);
        int type    = hei->HspFunc_prm_geti();
        int bsize   = hei->HspFunc_prm_geti();
        double k    = hei->HspFunc_prm_getdd(0.5);
        cv::Mat* src = get_mat(api, src_id, "cv4_niblack: invalid source");
        if (!src) return -1;
        cv::Mat gray = (src->channels() == 1) ? *src : cv::Mat();
        if (gray.empty()) cv::cvtColor(*src, gray, cv::COLOR_BGR2GRAY);
        cv::Mat out;
        cv::ximgproc::niBlackThreshold(gray, out, mv, type, bsize, k);
        api->mat_set_move(dst_id, &out);
        return 0;
    } catch (const cv::Exception& e) { api->set_last_error(e.what()); return -1; }
      catch (...) { api->set_last_error("cv4_niblack: unknown"); return -1; }
}

//  cv4_anisotropic_diffusion dst_id, src_id, alpha, K, niters
CV4C_EXPORT int __stdcall cv4_anisotropic_diffusion_impl(
    HSPEXINFO* hei, int p1, int p2, int p3,
    const hspcv4_handle_api_t* api)
{
    (void)p1; (void)p2; (void)p3;
    try {
        int dst_id = hei->HspFunc_prm_geti();
        int src_id = hei->HspFunc_prm_geti();
        double alpha = hei->HspFunc_prm_getdd(1.0);
        double K     = hei->HspFunc_prm_getdd(0.02);
        int niters   = hei->HspFunc_prm_getdi(10);
        cv::Mat* src = get_mat(api, src_id, "cv4_anisotropic_diffusion: invalid source");
        if (!src) return -1;
        // anisotropicDiffusion は 3ch CV_8U を要求する
        cv::Mat in3;
        if (src->channels() == 3) in3 = *src;
        else cv::cvtColor(*src, in3, cv::COLOR_GRAY2BGR);
        cv::Mat out;
        cv::ximgproc::anisotropicDiffusion(in3, out, (float)alpha, (float)K, niters);
        api->mat_set_move(dst_id, &out);
        return 0;
    } catch (const cv::Exception& e) { api->set_last_error(e.what()); return -1; }
      catch (...) { api->set_last_error("cv4_anisotropic_diffusion: unknown"); return -1; }
}

//  cv4_guided_filter dst_id, guide_id, src_id, radius, eps
CV4C_EXPORT int __stdcall cv4_guided_filter_impl(
    HSPEXINFO* hei, int p1, int p2, int p3,
    const hspcv4_handle_api_t* api)
{
    (void)p1; (void)p2; (void)p3;
    try {
        int dst_id   = hei->HspFunc_prm_geti();
        int guide_id = hei->HspFunc_prm_geti();
        int src_id   = hei->HspFunc_prm_geti();
        int radius   = hei->HspFunc_prm_geti();
        double eps   = hei->HspFunc_prm_getdd(1e-2);
        cv::Mat* guide = get_mat(api, guide_id, "cv4_guided_filter: invalid guide");
        cv::Mat* src   = get_mat(api, src_id, "cv4_guided_filter: invalid source");
        if (!guide || !src) return -1;
        cv::Mat out;
        cv::ximgproc::guidedFilter(*guide, *src, out, radius, eps);
        api->mat_set_move(dst_id, &out);
        return 0;
    } catch (const cv::Exception& e) { api->set_last_error(e.what()); return -1; }
      catch (...) { api->set_last_error("cv4_guided_filter: unknown"); return -1; }
}

//  cv4_l0_smooth dst_id, src_id [, lambda=0.02] [, kappa=2.0]
CV4C_EXPORT int __stdcall cv4_l0_smooth_impl(
    HSPEXINFO* hei, int p1, int p2, int p3,
    const hspcv4_handle_api_t* api)
{
    (void)p1; (void)p2; (void)p3;
    try {
        int dst_id   = hei->HspFunc_prm_geti();
        int src_id   = hei->HspFunc_prm_geti();
        double lam   = hei->HspFunc_prm_getdd(0.02);
        double kap   = hei->HspFunc_prm_getdd(2.0);
        cv::Mat* src = get_mat(api, src_id, "cv4_l0_smooth: invalid source");
        if (!src) return -1;
        cv::Mat out;
        cv::ximgproc::l0Smooth(*src, out, lam, kap);
        api->mat_set_move(dst_id, &out);
        return 0;
    } catch (const cv::Exception& e) { api->set_last_error(e.what()); return -1; }
      catch (...) { api->set_last_error("cv4_l0_smooth: unknown"); return -1; }
}

//  cv4_fast_global_smoother dst_id, guide_id, src_id, lambda, sigma_color
CV4C_EXPORT int __stdcall cv4_fast_global_smoother_impl(
    HSPEXINFO* hei, int p1, int p2, int p3,
    const hspcv4_handle_api_t* api)
{
    (void)p1; (void)p2; (void)p3;
    try {
        int dst_id   = hei->HspFunc_prm_geti();
        int guide_id = hei->HspFunc_prm_geti();
        int src_id   = hei->HspFunc_prm_geti();
        double lam   = hei->HspFunc_prm_getdd(125.0);
        double sc    = hei->HspFunc_prm_getdd(8.0);
        cv::Mat* guide = get_mat(api, guide_id, "cv4_fast_global_smoother: invalid guide");
        cv::Mat* src   = get_mat(api, src_id, "cv4_fast_global_smoother: invalid source");
        if (!guide || !src) return -1;
        cv::Mat out;
        cv::ximgproc::fastGlobalSmootherFilter(*guide, *src, out, lam, sc);
        api->mat_set_move(dst_id, &out);
        return 0;
    } catch (const cv::Exception& e) { api->set_last_error(e.what()); return -1; }
      catch (...) { api->set_last_error("cv4_fast_global_smoother: unknown"); return -1; }
}

//  cv4_weighted_median dst_id, joint_id, src_id, radius
CV4C_EXPORT int __stdcall cv4_weighted_median_impl(
    HSPEXINFO* hei, int p1, int p2, int p3,
    const hspcv4_handle_api_t* api)
{
    (void)p1; (void)p2; (void)p3;
    try {
        int dst_id   = hei->HspFunc_prm_geti();
        int joint_id = hei->HspFunc_prm_geti();
        int src_id   = hei->HspFunc_prm_geti();
        int radius   = hei->HspFunc_prm_getdi(7);
        cv::Mat* j = get_mat(api, joint_id, "cv4_weighted_median: invalid joint");
        cv::Mat* s = get_mat(api, src_id, "cv4_weighted_median: invalid source");
        if (!j || !s) return -1;
        cv::Mat out;
        cv::ximgproc::weightedMedianFilter(*j, *s, out, radius);
        api->mat_set_move(dst_id, &out);
        return 0;
    } catch (const cv::Exception& e) { api->set_last_error(e.what()); return -1; }
      catch (...) { api->set_last_error("cv4_weighted_median: unknown"); return -1; }
}


//============================================================================
//  Phase 13b-6 : img_hash (perceptual / dct / radial / color moment hashes)
//
//  各 hash 関数は cv::Mat を入力に取り、出力 hash を Mat (1 行) として返す。
//  ハッシュ同士の類似度を計算するには 2 つの hash mat を比較する必要がある
//  (Hamming distance や L1 距離)。本実装では HSP 側で cv4_abs_diff +
//  cv4_count_nonzero 等を組み合わせれば類似度比較ができる。
//============================================================================

#define CV4_HASH_IMPL(name, fn) \
CV4C_EXPORT int __stdcall name(HSPEXINFO* hei, int p1, int p2, int p3, \
                                const hspcv4_handle_api_t* api) { \
    (void)p1; (void)p2; (void)p3; \
    try { \
        int dst_id = hei->HspFunc_prm_geti(); \
        int src_id = hei->HspFunc_prm_geti(); \
        cv::Mat* src = get_mat(api, src_id, #name ": invalid source"); \
        if (!src) return -1; \
        cv::Mat out; \
        cv::img_hash::fn(*src, out); \
        api->mat_set_move(dst_id, &out); \
        return 0; \
    } catch (const cv::Exception& e) { api->set_last_error(e.what()); return -1; } \
      catch (...) { api->set_last_error(#name ": unknown"); return -1; } \
}

CV4_HASH_IMPL(cv4_phash_impl,             pHash)
CV4_HASH_IMPL(cv4_average_hash_impl,      averageHash)
CV4_HASH_IMPL(cv4_block_mean_hash_impl,   blockMeanHash)
CV4_HASH_IMPL(cv4_color_moment_hash_impl, colorMomentHash)
CV4_HASH_IMPL(cv4_marr_hildreth_hash_impl, marrHildrethHash)
CV4_HASH_IMPL(cv4_radial_variance_hash_impl, radialVarianceHash)

#undef CV4_HASH_IMPL


//============================================================================
//  Phase 13b-7 : optflow (DualTVL1 / DeepFlow / SparseToDense / SimpleFlow)
//
//  これらは dense optical flow algorithm。出力は flow Mat (HxWx2 CV_32F)。
//  プラグイン側でアルゴリズム instance を都度生成 (state-less な使用)。
//============================================================================

// 共通: 2 つのフレームを取り出してグレー化
static bool prepare_optflow_inputs(
    const hspcv4_handle_api_t* api,
    int prev_id, int next_id,
    cv::Mat& pg, cv::Mat& ng, const char* fn)
{
    cv::Mat* prev = static_cast<cv::Mat*>(api->mat_get(prev_id));
    cv::Mat* next = static_cast<cv::Mat*>(api->mat_get(next_id));
    if (!prev || !next || prev->empty() || next->empty()) {
        api->set_last_error("invalid prev/next image");
        return false;
    }
    if (prev->channels() == 1) pg = *prev;
    else cv::cvtColor(*prev, pg, cv::COLOR_BGR2GRAY);
    if (next->channels() == 1) ng = *next;
    else cv::cvtColor(*next, ng, cv::COLOR_BGR2GRAY);
    return true;
}

//  cv4_optflow_dualtvl1 flow_id, prev_id, next_id
CV4C_EXPORT int __stdcall cv4_optflow_dualtvl1_impl(
    HSPEXINFO* hei, int p1, int p2, int p3,
    const hspcv4_handle_api_t* api)
{
    (void)p1; (void)p2; (void)p3;
    try {
        int flow_id = hei->HspFunc_prm_geti();
        int prev_id = hei->HspFunc_prm_geti();
        int next_id = hei->HspFunc_prm_geti();
        cv::Mat pg, ng;
        if (!prepare_optflow_inputs(api, prev_id, next_id, pg, ng, "cv4_optflow_dualtvl1")) return -1;
        auto algo = cv::optflow::createOptFlow_DualTVL1();
        cv::Mat flow;
        algo->calc(pg, ng, flow);
        api->mat_set_move(flow_id, &flow);
        return 0;
    } catch (const cv::Exception& e) { api->set_last_error(e.what()); return -1; }
      catch (...) { api->set_last_error("cv4_optflow_dualtvl1: unknown"); return -1; }
}

//  cv4_optflow_deepflow flow_id, prev_id, next_id
CV4C_EXPORT int __stdcall cv4_optflow_deepflow_impl(
    HSPEXINFO* hei, int p1, int p2, int p3,
    const hspcv4_handle_api_t* api)
{
    (void)p1; (void)p2; (void)p3;
    try {
        int flow_id = hei->HspFunc_prm_geti();
        int prev_id = hei->HspFunc_prm_geti();
        int next_id = hei->HspFunc_prm_geti();
        cv::Mat pg, ng;
        if (!prepare_optflow_inputs(api, prev_id, next_id, pg, ng, "cv4_optflow_deepflow")) return -1;
        auto algo = cv::optflow::createOptFlow_DeepFlow();
        cv::Mat flow;
        algo->calc(pg, ng, flow);
        api->mat_set_move(flow_id, &flow);
        return 0;
    } catch (const cv::Exception& e) { api->set_last_error(e.what()); return -1; }
      catch (...) { api->set_last_error("cv4_optflow_deepflow: unknown"); return -1; }
}

//  cv4_optflow_sparse_to_dense flow_id, prev_id, next_id
CV4C_EXPORT int __stdcall cv4_optflow_sparse_to_dense_impl(
    HSPEXINFO* hei, int p1, int p2, int p3,
    const hspcv4_handle_api_t* api)
{
    (void)p1; (void)p2; (void)p3;
    try {
        int flow_id = hei->HspFunc_prm_geti();
        int prev_id = hei->HspFunc_prm_geti();
        int next_id = hei->HspFunc_prm_geti();
        cv::Mat pg, ng;
        if (!prepare_optflow_inputs(api, prev_id, next_id, pg, ng, "cv4_optflow_sparse_to_dense")) return -1;
        auto algo = cv::optflow::createOptFlow_SparseToDense();
        cv::Mat flow;
        algo->calc(pg, ng, flow);
        api->mat_set_move(flow_id, &flow);
        return 0;
    } catch (const cv::Exception& e) { api->set_last_error(e.what()); return -1; }
      catch (...) { api->set_last_error("cv4_optflow_sparse_to_dense: unknown"); return -1; }
}
