//
//  hspcv4_capi.cpp
//  hspcv4.dll から contrib DLL へ公開する C ABI ハンドル API の実装。
//
#include "hspcv4.h"
#include "hspcv4_capi.h"
#include <opencv2/video.hpp>

// --- C ABI wrappers (内部 C++ API をボイドポインタに変換) ---

namespace {

void* capi_mat_get(int id) {
    return static_cast<void*>(hspcv4::handle_get(id));
}
void capi_mat_set_move(int id, void* new_mat) {
    if (!new_mat) return;
    cv::Mat* m = static_cast<cv::Mat*>(new_mat);
    hspcv4::handle_set(id, std::move(*m));
}
void capi_mat_free(int id) { hspcv4::handle_free(id); }

void* capi_cascade_get(int id) {
    return static_cast<void*>(hspcv4::cascade_get(id));
}
void capi_cascade_set_move(int id, void* p) {
    if (!p) return;
    cv::CascadeClassifier* cc = static_cast<cv::CascadeClassifier*>(p);
    hspcv4::cascade_set(id, std::move(*cc));
}
void capi_cascade_free(int id) { hspcv4::cascade_free(id); }

void* capi_capture_get(int id) {
    return static_cast<void*>(hspcv4::capture_get(id));
}
void capi_capture_set_move(int id, void* p) {
    if (!p) return;
    cv::VideoCapture* vc = static_cast<cv::VideoCapture*>(p);
    hspcv4::capture_set(id, std::move(*vc));
}
void capi_capture_free(int id) { hspcv4::capture_free(id); }

void* capi_writer_get(int id) {
    return static_cast<void*>(hspcv4::writer_get(id));
}
void capi_writer_set_move(int id, void* p) {
    if (!p) return;
    cv::VideoWriter* vw = static_cast<cv::VideoWriter*>(p);
    hspcv4::writer_set(id, std::move(*vw));
}
void capi_writer_free(int id) { hspcv4::writer_free(id); }

void* capi_dnn_get(int id) {
    return static_cast<void*>(hspcv4::dnn_get(id));
}
void capi_dnn_set_move(int id, void* p) {
    if (!p) return;
    cv::dnn::Net* net = static_cast<cv::dnn::Net*>(p);
    hspcv4::dnn_set(id, std::move(*net));
}
void capi_dnn_free(int id) { hspcv4::dnn_free(id); }

void* capi_contours_get(int id) {
    return static_cast<void*>(hspcv4::contours_get(id));
}
void capi_contours_set_move(int id, void* p) {
    if (!p) return;
    hspcv4::ContourSet* cs = static_cast<hspcv4::ContourSet*>(p);
    hspcv4::contours_set(id, std::move(*cs));
}
void capi_contours_free(int id) { hspcv4::contours_free(id); }

void* capi_kps_get(int id) {
    return static_cast<void*>(hspcv4::kps_get(id));
}
void capi_kps_set_move(int id, void* p) {
    if (!p) return;
    hspcv4::KeyPointSet* kps = static_cast<hspcv4::KeyPointSet*>(p);
    hspcv4::kps_set(id, std::move(*kps));
}
void capi_kps_free(int id) { hspcv4::kps_free(id); }

void* capi_matches_get(int id) {
    return static_cast<void*>(hspcv4::matches_get(id));
}
void capi_matches_set_move(int id, void* p) {
    if (!p) return;
    hspcv4::MatchSet* ms = static_cast<hspcv4::MatchSet*>(p);
    hspcv4::matches_set(id, std::move(*ms));
}
void capi_matches_free(int id) { hspcv4::matches_free(id); }

void* capi_bgsub_get(int id) {
    return static_cast<void*>(hspcv4::bgsub_get(id));
}
void capi_bgsub_set_copy(int id, void* p) {
    if (!p) return;
    cv::Ptr<cv::BackgroundSubtractor>* src =
        static_cast<cv::Ptr<cv::BackgroundSubtractor>*>(p);
    hspcv4::bgsub_set(id, *src);
}
void capi_bgsub_free(int id) { hspcv4::bgsub_free(id); }

void* capi_tracker_get(int id) {
    return static_cast<void*>(hspcv4::tracker_get(id));
}
void capi_tracker_set_copy(int id, void* p) {
    if (!p) return;
    cv::Ptr<cv::Tracker>* src = static_cast<cv::Ptr<cv::Tracker>*>(p);
    hspcv4::tracker_set(id, *src);
}
void capi_tracker_free(int id) { hspcv4::tracker_free(id); }

void capi_set_last_error(const char* msg) {
    hspcv4::set_last_error(msg ? msg : "");
}

const hspcv4_handle_api_t g_api = {
    HSPCV4_CAPI_VERSION,
    capi_mat_get, capi_mat_set_move, capi_mat_free,
    capi_cascade_get, capi_cascade_set_move, capi_cascade_free,
    capi_capture_get, capi_capture_set_move, capi_capture_free,
    capi_writer_get, capi_writer_set_move, capi_writer_free,
    capi_dnn_get, capi_dnn_set_move, capi_dnn_free,
    capi_contours_get, capi_contours_set_move, capi_contours_free,
    capi_kps_get, capi_kps_set_move, capi_kps_free,
    capi_matches_get, capi_matches_set_move, capi_matches_free,
    capi_bgsub_get, capi_bgsub_set_copy, capi_bgsub_free,
    capi_tracker_get, capi_tracker_set_copy, capi_tracker_free,
    capi_set_last_error,
};

} // anonymous namespace

extern "C" __declspec(dllexport)
const hspcv4_handle_api_t* hspcv4_get_api(void)
{
    return &g_api;
}
