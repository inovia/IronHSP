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
#include <opencv2/videoio.hpp>
#pragma warning(pop)

#define CV4_EXPORT extern "C" __declspec(dllexport)

// HSPEXINFO global (set on first call). Used by handle manager error reports.
extern HSPEXINFO* g_hei;

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

//---------------------------------------------------------------------------
// Last error message (for future cv4_getlasterror if needed)
//---------------------------------------------------------------------------
void  set_last_error(const char* msg);
const char* get_last_error();

} // namespace hspcv4
