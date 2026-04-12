;
;   hspcv4.dll header  (OpenCV 4.x plugin for IronHSP)
;
;   Phase 1 : beginner API (no underscore)
;   Usage:
;     #include "hspcv4.as"
;
#ifndef __hspcv4__
#define __hspcv4__

; --- cv::cvtColor codes (subset, OpenCV 4.x) ---
#define global CV4_BGR2GRAY    6
#define global CV4_GRAY2BGR    8
#define global CV4_BGR2HSV     40
#define global CV4_HSV2BGR     54
#define global CV4_BGR2RGB     4
#define global CV4_BGR2BGRA    0
#define global CV4_BGRA2BGR    1

; --- Interpolation (cv::resize flag, unused in Phase 1 but reserved) ---
#define global CV4_INTER_NEAREST 0
#define global CV4_INTER_LINEAR  1
#define global CV4_INTER_CUBIC   2
#define global CV4_INTER_AREA    3
#define global CV4_INTER_LANCZOS4 4

#uselib "hspcv4.dll"

; ---- beginner API (no underscore) ----
;
; 画像は int ハンドル ID で管理します。ハンドルは cv4load / cv4putimg /
; cv4cvt / cv4resize で生成され、cv4del で解放します (cv4reset で全解放)。
;
; 画面出力は cv4getimg で HSP のカレント window に直接コピーされます。
; その際は呼出し前後を redraw 0 / redraw 1 で囲んでください。
;
; 注: cv4show / cv4wait (OpenCV 自前ウィンドウ表示 & キー待ち) は
;     OpenCV highgui のメッセージループが HSP と競合するため、
;     Phase 1 beginner API には含まれていません (玄人向けで後日整備予定)。
;
#func global cv4load    cv4load    $202
#func global cv4save    cv4save    $202
#func global cv4del     cv4del     $202
#func global cv4reset   cv4reset   $202
#func global cv4info    cv4info    $202
#func global cv4cvt     cv4cvt     $202
#func global cv4resize  cv4resize  $202
#func global cv4getimg  cv4getimg  $202
#func global cv4putimg  cv4putimg  $202

#endif
