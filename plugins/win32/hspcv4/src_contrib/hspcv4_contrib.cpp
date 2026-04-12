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
