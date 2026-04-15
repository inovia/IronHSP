//
//  hspcv4 - OpenCV 4.x plugin for IronHSP
//  Common header
//
#pragma once

#define WIN32_LEAN_AND_MEAN
#include <windows.h>

// HSP SDK
#ifndef HSPWIN
#define HSPWIN
#endif
#if defined(_WIN64) && !defined(HSP64)
#define HSP64
#endif
#pragma warning(push)
#pragma warning(disable: 4819)  // hsp3 headers are SJIS encoded
#include "../../../../hsp3/hsp3debug.h"
#include "../../../../hsp3/hsp3struct.h"
#include "../../../../hsp3/hspwnd.h"
#pragma warning(pop)

// OpenCV
#pragma warning(push)
#pragma warning(disable: 4819)
#include <opencv2/core.hpp>
#include <opencv2/imgproc.hpp>
#include <opencv2/imgcodecs.hpp>
#include <opencv2/highgui.hpp>
#include <opencv2/objdetect.hpp>
#include <opencv2/objdetect/aruco_detector.hpp>
#include <opencv2/objdetect/barcode.hpp>
#include <opencv2/videoio.hpp>
#include <opencv2/ml.hpp>
#include <opencv2/dnn.hpp>
#include <opencv2/features2d.hpp>
#include <opencv2/photo.hpp>
#include <opencv2/video.hpp>
#include <opencv2/calib3d.hpp>
#include <opencv2/stitching.hpp>
#include <opencv2/face.hpp>
#include <opencv2/xphoto.hpp>
#include <opencv2/xfeatures2d.hpp>
#include <opencv2/ximgproc.hpp>
#include <opencv2/ximgproc/edge_filter.hpp>
#include <opencv2/ximgproc/fast_line_detector.hpp>
#include <opencv2/ximgproc/peilin.hpp>
#include <opencv2/wechat_qrcode.hpp>
#include <opencv2/quality.hpp>
#include <opencv2/plot.hpp>
#include <opencv2/freetype.hpp>
#include <opencv2/saliency.hpp>
#include <opencv2/text.hpp>
#pragma warning(pop)

#define CV4_EXPORT extern "C" __declspec(dllexport)

namespace hspcv4 {

//---------------------------------------------------------------------------
// Handle manager: maps int ID -> cv::Mat*
//---------------------------------------------------------------------------

// Allocate a new handle that owns the given Mat (moved).
// Returns the new ID (>= 0), or -1 on failure.
int   handle_alloc(cv::Mat&& mat);

// Get the Mat for an existing ID, or nullptr if invalid.
cv::Mat* handle_get(int id);

// Store or replace an existing handle's Mat (ID must already exist OR
// must be safe to allocate). Returns true on success.
bool  handle_set(int id, cv::Mat&& mat);

// Free one handle. No-op if unknown.
void  handle_free(int id);

// Free every handle.
void  handle_clear_all();

//---------------------------------------------------------------------------
// Cascade classifier handle manager (Phase 2e)
//---------------------------------------------------------------------------

bool cascade_set(int id, cv::CascadeClassifier&& cc);
cv::CascadeClassifier* cascade_get(int id);
void cascade_free(int id);
void cascade_clear_all();

//---------------------------------------------------------------------------
// VideoCapture / VideoWriter handle managers (Phase 2f)
//---------------------------------------------------------------------------

bool capture_set(int id, cv::VideoCapture&& vc);
cv::VideoCapture* capture_get(int id);
void capture_free(int id);
void capture_clear_all();

bool writer_set(int id, cv::VideoWriter&& vw);
cv::VideoWriter* writer_get(int id);
void writer_free(int id);
void writer_clear_all();

bool dnn_set(int id, cv::dnn::Net&& net);
cv::dnn::Net* dnn_get(int id);
void dnn_free(int id);
void dnn_clear_all();

// Contour set: std::vector<std::vector<cv::Point>>
using ContourSet = std::vector<std::vector<cv::Point>>;
bool contours_set(int id, ContourSet&& cs);
ContourSet* contours_get(int id);
void contours_free(int id);
void contours_clear_all();

// Keypoint set: std::vector<cv::KeyPoint>
using KeyPointSet = std::vector<cv::KeyPoint>;
bool kps_set(int id, KeyPointSet&& kps);
KeyPointSet* kps_get(int id);
void kps_free(int id);
void kps_clear_all();

// DMatch set: std::vector<cv::DMatch>
using MatchSet = std::vector<cv::DMatch>;
bool matches_set(int id, MatchSet&& ms);
MatchSet* matches_get(int id);
void matches_free(int id);
void matches_clear_all();

// BackgroundSubtractor smart pointer
bool bgsub_set(int id, cv::Ptr<cv::BackgroundSubtractor> ptr);
cv::Ptr<cv::BackgroundSubtractor>* bgsub_get(int id);
void bgsub_free(int id);
void bgsub_clear_all();

// Tracker smart pointer
bool tracker_set(int id, cv::Ptr<cv::Tracker> ptr);
cv::Ptr<cv::Tracker>* tracker_get(int id);
void tracker_free(int id);
void tracker_clear_all();

// ML StatModel smart pointer (Phase 18)
bool ml_model_set(int id, cv::Ptr<cv::ml::StatModel> ptr);
cv::Ptr<cv::ml::StatModel>* ml_model_get(int id);
void ml_model_free(int id);
void ml_model_clear_all();

// Face recognizer (Phase 19): LBPH/Eigen/Fisher
bool face_recognizer_set(int id, cv::Ptr<cv::face::FaceRecognizer> ptr);
cv::Ptr<cv::face::FaceRecognizer>* face_recognizer_get(int id);
void face_recognizer_free(int id);
void face_recognizer_clear_all();

// Facemark (Phase 19): FacemarkLBF/Kazemi
bool facemark_set(int id, cv::Ptr<cv::face::Facemark> ptr);
cv::Ptr<cv::face::Facemark>* facemark_get(int id);
void facemark_free(int id);
void facemark_clear_all();

// StereoMatcher (Phase 21): StereoBM / StereoSGBM
bool stereo_set(int id, cv::Ptr<cv::StereoMatcher> ptr);
cv::Ptr<cv::StereoMatcher>* stereo_get(int id);
void stereo_free(int id);
void stereo_clear_all();

// KalmanFilter (Phase 23)
bool kalman_set(int id, cv::KalmanFilter&& kf);
cv::KalmanFilter* kalman_get(int id);
void kalman_free(int id);
void kalman_clear_all();

// FreeType2 (Phase 22 follow)
bool freetype_set(int id, cv::Ptr<cv::freetype::FreeType2> ptr);
cv::Ptr<cv::freetype::FreeType2>* freetype_get(int id);
void freetype_free(int id);
void freetype_clear_all();

// OCRTesseract (Phase 25 follow-2)
bool ocr_set(int id, cv::Ptr<cv::text::OCRTesseract> ptr);
cv::Ptr<cv::text::OCRTesseract>* ocr_get(int id);
void ocr_free(int id);
void ocr_clear_all();

//---------------------------------------------------------------------------
// Last error message (for future cv4_getlasterror if needed)
//---------------------------------------------------------------------------
void  set_last_error(const char* msg);
const char* get_last_error();

} // namespace hspcv4
