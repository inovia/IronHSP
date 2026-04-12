//
//  hspcv4_capi.h
//  hspcv4.dll から opencv_contrib 系の補助 DLL (hspcv4_contrib.dll) へ
//  公開する C ABI。contrib DLL は main DLL のハンドル空間 (cv::Mat や
//  KeyPointSet など) を参照できる。
//
//  両 DLL とも同じ OpenCV 4.12 を静的リンクしていることが前提で、
//  cv::Mat や cv::Tracker の ABI は互換であるとみなす。
//  (/MD CRT を共有するので new/delete 跨ぎも OK)
//
#pragma once

#ifdef __cplusplus
extern "C" {
#endif

#include <stddef.h>

//
//  ハンドル API バージョン。contrib DLL は起動時にこの値を確認して、
//  不整合があれば使用を拒否する。
//
#define HSPCV4_CAPI_VERSION 1

//
//  ハンドル API 関数テーブル。
//  void* で受け渡しするオブジェクトは contrib DLL 側で対応する C++ 型
//  (cv::Mat*, cv::dnn::Net*, std::vector<cv::KeyPoint>*, etc.) に
//  static_cast する。
//
//  "take ownership" 系 (set 系) の関数は、渡した cv::Mat などの内容を
//  main DLL の内部に std::move で取り込む。呼出し元はその後触らないこと。
//
typedef struct hspcv4_handle_api_t {
    int version;                                        // = HSPCV4_CAPI_VERSION

    // cv::Mat
    void* (*mat_get)(int id);                           // returns cv::Mat* (non-owning, may be nullptr)
    void  (*mat_set_move)(int id, void* new_mat);       // takes ownership via std::move from *cv::Mat*
    void  (*mat_free)(int id);

    // cv::CascadeClassifier
    void* (*cascade_get)(int id);
    void  (*cascade_set_move)(int id, void* new_cc);
    void  (*cascade_free)(int id);

    // cv::VideoCapture
    void* (*capture_get)(int id);
    void  (*capture_set_move)(int id, void* new_vc);
    void  (*capture_free)(int id);

    // cv::VideoWriter
    void* (*writer_get)(int id);
    void  (*writer_set_move)(int id, void* new_vw);
    void  (*writer_free)(int id);

    // cv::dnn::Net
    void* (*dnn_get)(int id);
    void  (*dnn_set_move)(int id, void* new_net);
    void  (*dnn_free)(int id);

    // std::vector<std::vector<cv::Point>>
    void* (*contours_get)(int id);
    void  (*contours_set_move)(int id, void* new_cs);
    void  (*contours_free)(int id);

    // std::vector<cv::KeyPoint>
    void* (*kps_get)(int id);
    void  (*kps_set_move)(int id, void* new_kps);
    void  (*kps_free)(int id);

    // std::vector<cv::DMatch>
    void* (*matches_get)(int id);
    void  (*matches_set_move)(int id, void* new_ms);
    void  (*matches_free)(int id);

    // cv::Ptr<cv::BackgroundSubtractor>
    void* (*bgsub_get)(int id);                         // returns cv::Ptr<BackgroundSubtractor>*
    void  (*bgsub_set_copy)(int id, void* ptr_bg);      // copies the Ptr (shared)
    void  (*bgsub_free)(int id);

    // cv::Ptr<cv::Tracker>
    void* (*tracker_get)(int id);                       // returns cv::Ptr<Tracker>*
    void  (*tracker_set_copy)(int id, void* ptr_t);     // copies the Ptr (shared)
    void  (*tracker_free)(int id);

    // エラーレポート: last_error 文字列を設定する
    void  (*set_last_error)(const char* msg);
} hspcv4_handle_api_t;

//
//  hspcv4.dll の export: このテーブルへのポインタを返す。
//  contrib DLL は LoadLibrary/GetProcAddress で取得、または import lib
//  経由で直接呼ぶ。
//
__declspec(dllexport) const hspcv4_handle_api_t* hspcv4_get_api(void);

#ifdef __cplusplus
}
#endif
