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

; --- cv::threshold types (cv4thresh 第5引数) ---
#define global CV4_THRESH_BINARY      0
#define global CV4_THRESH_BINARY_INV  1
#define global CV4_THRESH_TRUNC       2
#define global CV4_THRESH_TOZERO      3
#define global CV4_THRESH_TOZERO_INV  4
#define global CV4_THRESH_OTSU        8      ; 他の type と OR する (| 演算)
#define global CV4_THRESH_TRIANGLE    16

; --- Interpolation (cv::resize flag, unused in Phase 1 but reserved) ---
#define global CV4_INTER_NEAREST 0
#define global CV4_INTER_LINEAR  1
#define global CV4_INTER_CUBIC   2
#define global CV4_INTER_AREA    3
#define global CV4_INTER_LANCZOS4 4

; ---- struct types (Phase 2e 以降で使用) ----
; cv_rect: 検出結果などの矩形領域を表す構造体 (16 bytes)
#defstruct cv_rect
#field int x
#field int y
#field int w
#field int h
#endstruct

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

; ---- drawing ----
; 色は B, G, R の順で指定します (OpenCV の慣習)。
; thickness に -1 を指定すると塗りつぶし (cv4rect / cv4circle のみ有効)。
; cv4text のフォントは HERSHEY_SIMPLEX 固定、scale は double (例: 1.0, 1.5)。
#func global cv4line    cv4line    $202
#func global cv4rect    cv4rect    $202
#func global cv4circle  cv4circle  $202
#func global cv4text    cv4text    $202

; ---- filters ----
; dst と src は同一ハンドルも可。ksize は奇数推奨 (偶数は自動補正)。
; cv4canny は src にグレースケール推奨 (事前に cv4cvt で CV4_BGR2GRAY する)。
#func global cv4blur    cv4blur    $202
#func global cv4gauss   cv4gauss   $202
#func global cv4median  cv4median  $202
#func global cv4canny   cv4canny   $202
#func global cv4thresh  cv4thresh  $202

; ---- geometric transform ----
; cv4flip   flipcode: 0=上下反転, 1=左右反転, -1=両方
; cv4rotate angle は度単位 (反時計回り)、scale は倍率 double
; cv4crop   (x,y)-(w,h) の ROI を切り抜く (範囲外はエラー)
; cv4warp   2x3 アフィン行列を直接指定。out_w/out_h は出力サイズ
#func global cv4flip    cv4flip    $202
#func global cv4rotate  cv4rotate  $202
#func global cv4crop    cv4crop    $202
#func global cv4warp    cv4warp    $202

; ---- advanced: OpenCV native window display (玄人向け) ----
;
; 注意: cv::waitKey は HSP のメッセージポンプと競合してクラッシュするため
;       beginner API には含まれません。代わりに cv::pollKey() ベースの
;       ノンブロッキング実装を用意しています。
;
;   cv4_show         id, "window"       — OpenCV ウィンドウに画像を表示
;   cv4_wait_key     var_key, ms         — タイムアウト付きキー待ち
;                                          キーコードは var_key に格納。
;                                          stat = 0 : キーが押された
;                                          stat = 1 : タイムアウト
;                                          ms=0 で「押されるまで」動作
;   cv4_close_window "window"           — 指定ウィンドウを閉じる
;   cv4_close_all                        — 全 OpenCV ウィンドウを閉じる
;
#func global cv4_show          cv4_show          $202
#func global cv4_wait_key      cv4_wait_key      $202
#func global cv4_close_window  cv4_close_window  $202
#func global cv4_close_all     cv4_close_all     $202

; ---- object detection (Haar / LBP cascade) ----
;
; 使い方:
;   stdim rects, cv_rect, 64      ; 最大 64 個の結果バッファ
;   cv4_cascade_load 0, "haarcascade_frontalface_default.xml"
;   cv4_detect 0, img_id, rects, n, 1.1, 3
;   repeat n
;     cv4rect img_id, rects(cnt)->x, rects(cnt)->y, rects(cnt)->w, rects(cnt)->h, 0,255,0, 2
;   loop
;
#func global cv4_cascade_load  cv4_cascade_load  $202
#func global cv4_cascade_free  cv4_cascade_free  $202
#func global cv4_detect        cv4_detect        $202

; ---- video I/O : VideoCapture / VideoWriter ----
;
; cv4_video_open   vid, "path_or_index"          ; "0"=カメラ 0 / "file.mp4"
; cv4_video_read   vid, frame_id                  ; stat=0 成功, 1 で終端
; cv4_video_info   vid, var_w, var_h, var_fps, var_total
; cv4_video_close  vid
;
; cv4_writer_open  wid, "path", "fourcc", fps, w, h  ; fourcc は "MJPG" 等
; cv4_writer_write wid, frame_id
; cv4_writer_close wid
;
#func global cv4_video_open    cv4_video_open    $202
#func global cv4_video_read    cv4_video_read    $202
#func global cv4_video_info    cv4_video_info    $202
#func global cv4_video_close   cv4_video_close   $202
#func global cv4_writer_open   cv4_writer_open   $202
#func global cv4_writer_write  cv4_writer_write  $202
#func global cv4_writer_close  cv4_writer_close  $202

; ---- DNN : ONNX inference ----
;
; 使い方 (分類タスクの例):
;   cv4_dnn_load 0, "model.onnx"
;   cv4load 1, "input.jpg"
;   ; scale=1/255, mean=(0,0,0), input=224x224, swap_rb=1 (BGR->RGB)
;   cv4_dnn_set_input 0, 1, 0.003921568, 0.0, 0.0, 0.0, 224, 224, 1
;   cv4_dnn_forward 0, 2
;   cv4_dnn_argmax 2, cls, score_x10000
;   mes strf("class=%d score=%.4f", cls, double(score_x10000) / 10000.0)
;   cv4_dnn_free 0
;
; 注意:
;   cv4_dnn_argmax の var_score は HSP int に収まるよう
;   (スコア * 10000) の固定小数点で返される。HSP 側で /10000.0 する。
;
#func global cv4_dnn_load       cv4_dnn_load       $202
#func global cv4_dnn_free       cv4_dnn_free       $202
#func global cv4_dnn_set_input  cv4_dnn_set_input  $202
#func global cv4_dnn_forward    cv4_dnn_forward    $202
#func global cv4_dnn_argmax     cv4_dnn_argmax     $202

#endif
