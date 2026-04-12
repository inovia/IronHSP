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
