;
;   hspcv4.dll header  (OpenCV 4.x plugin for IronHSP)
;
;   Phase 1 : beginner API (no underscore)
;   Usage:
;     #include "hspcv4.as"
;
#ifndef __hspcv4__
#define __hspcv4__

; --- cv::imread flags (cv4_imread_flags 第3引数) ---
#define global CV4_IMREAD_UNCHANGED   -1
#define global CV4_IMREAD_GRAYSCALE    0
#define global CV4_IMREAD_COLOR        1
#define global CV4_IMREAD_ANYDEPTH     2
#define global CV4_IMREAD_ANYCOLOR     4

; --- cv::cvtColor codes (subset, OpenCV 4.x) ---
#define global CV4_BGR2GRAY    6
#define global CV4_GRAY2BGR    8
#define global CV4_BGR2HSV     40
#define global CV4_HSV2BGR     54
#define global CV4_BGR2RGB     4
#define global CV4_BGR2BGRA    0
#define global CV4_BGRA2BGR    1

; --- norm types for matchers (cv4_bf_match 第4引数) ---
;  NORM_L1 / NORM_L2 は cv4_normalize で定義済みのものを流用
#define global CV4_NORM_HAMMING       6
#define global CV4_NORM_HAMMING2      7

; --- findContours retrieval mode (cv4_find_contours 第3引数) ---
#define global CV4_RETR_EXTERNAL 0
#define global CV4_RETR_LIST     1
#define global CV4_RETR_CCOMP    2
#define global CV4_RETR_TREE     3

; --- findContours approximation method (cv4_find_contours 第4引数) ---
#define global CV4_CHAIN_APPROX_NONE      1
#define global CV4_CHAIN_APPROX_SIMPLE    2
#define global CV4_CHAIN_APPROX_TC89_L1   3
#define global CV4_CHAIN_APPROX_TC89_KCOS 4

; --- compare operators (cv4_compare 第4引数) ---
#define global CV4_CMP_EQ  0
#define global CV4_CMP_GT  1
#define global CV4_CMP_GE  2
#define global CV4_CMP_LT  3
#define global CV4_CMP_LE  4
#define global CV4_CMP_NE  5

; --- morphology structuring element shape (cv4_erode/dilate/morph_* 等) ---
#define global CV4_MORPH_RECT    0
#define global CV4_MORPH_CROSS   1
#define global CV4_MORPH_ELLIPSE 2

; --- adaptive threshold method (cv4_adaptive_thresh 第4引数) ---
#define global CV4_ADAPTIVE_MEAN_C      0
#define global CV4_ADAPTIVE_GAUSSIAN_C  1

; --- distance transform type (cv4_distance_transform 第3引数) ---
#define global CV4_DIST_L1   1
#define global CV4_DIST_L2   2
#define global CV4_DIST_C    3

; --- template matching methods (cv4_match_template 第4引数) ---
#define global CV4_TM_SQDIFF         0
#define global CV4_TM_SQDIFF_NORMED  1
#define global CV4_TM_CCORR          2
#define global CV4_TM_CCORR_NORMED   3
#define global CV4_TM_CCOEFF         4
#define global CV4_TM_CCOEFF_NORMED  5

; --- normalize types (cv4_normalize 第5引数) ---
#define global CV4_NORM_INF      1
#define global CV4_NORM_L1       2
#define global CV4_NORM_L2       4
#define global CV4_NORM_MINMAX  32

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

; ---- morphology ----
;   shape : CV4_MORPH_RECT / CROSS / ELLIPSE
;   ksize : カーネルサイズ (奇数推奨)
#func global cv4_erode          cv4_erode          $202
#func global cv4_dilate         cv4_dilate         $202
#func global cv4_morph_open     cv4_morph_open     $202
#func global cv4_morph_close    cv4_morph_close    $202
#func global cv4_morph_gradient cv4_morph_gradient $202
#func global cv4_morph_tophat   cv4_morph_tophat   $202
#func global cv4_morph_blackhat cv4_morph_blackhat $202

; ---- gradient / edge operators ----
#func global cv4_sobel          cv4_sobel          $202
#func global cv4_scharr         cv4_scharr         $202
#func global cv4_laplacian      cv4_laplacian      $202

; ---- histogram / LUT / normalize ----
#func global cv4_equalize_hist  cv4_equalize_hist  $202
#func global cv4_clahe          cv4_clahe          $202
#func global cv4_normalize      cv4_normalize      $202
#func global cv4_lut            cv4_lut            $202

; ---- advanced thresholding ----
#func global cv4_adaptive_thresh   cv4_adaptive_thresh   $202
#func global cv4_distance_transform cv4_distance_transform $202

; ---- Hough transforms ----
; 出力は Mat ハンドル (Nx2 / Nx4 / Nx3 の行列)。cv4_mat_shape と
; cv4_mat_geti / cv4_mat_getf でイテレートする。
#func global cv4_hough_lines    cv4_hough_lines    $202
#func global cv4_hough_linesp   cv4_hough_linesp   $202
#func global cv4_hough_circles  cv4_hough_circles  $202

; ---- template matching ----
#func global cv4_match_template cv4_match_template $202

; ---- image pyramids ----
#func global cv4_pyr_up         cv4_pyr_up         $202
#func global cv4_pyr_down       cv4_pyr_down       $202

; ---- Mat generic accessors (Hough 結果や DNN 出力を HSP から読む) ----
#func global cv4_mat_shape      cv4_mat_shape      $202
#func global cv4_mat_geti       cv4_mat_geti       $202
#func global cv4_mat_getf       cv4_mat_getf       $202
#func global cv4_min_max_loc    cv4_min_max_loc    $202

; ---- core Mat operations ----
; 算術演算 (2 つの Mat 間)
#func global cv4_add            cv4_add            $202
#func global cv4_sub            cv4_sub            $202
#func global cv4_mul            cv4_mul            $202
#func global cv4_div            cv4_div            $202
#func global cv4_abs_diff       cv4_abs_diff       $202
#func global cv4_add_weighted   cv4_add_weighted   $202
; スカラー演算
#func global cv4_add_scalar     cv4_add_scalar     $202
#func global cv4_mul_scalar     cv4_mul_scalar     $202
; ビット演算
#func global cv4_bit_and        cv4_bit_and        $202
#func global cv4_bit_or         cv4_bit_or         $202
#func global cv4_bit_xor        cv4_bit_xor        $202
#func global cv4_bit_not        cv4_bit_not        $202
; 比較
#func global cv4_compare        cv4_compare        $202
; 統計
#func global cv4_mean           cv4_mean           $202
#func global cv4_sum            cv4_sum            $202
#func global cv4_count_nonzero  cv4_count_nonzero  $202
; チャンネル操作
#func global cv4_split          cv4_split          $202
#func global cv4_merge          cv4_merge          $202
; Mat 作成
#func global cv4_mat_zeros      cv4_mat_zeros      $202
#func global cv4_mat_full       cv4_mat_full       $202
; マスクコピー
#func global cv4_copy_masked    cv4_copy_masked    $202

; ---- contours and shape analysis ----
;
; 使い方:
;   cv4_find_contours 0, src_id, CV4_RETR_EXTERNAL, CV4_CHAIN_APPROX_SIMPLE
;   cv4_contours_count 0, n
;   repeat n
;     cv4_contour_area 0, cnt, area
;     cv4_bounding_rect 0, cnt, x, y, w, h
;     cv4rect img_id, x, y, w, h, 0, 255, 0, 2
;   loop
;   cv4_contours_free 0
;
#func global cv4_find_contours        cv4_find_contours        $202
#func global cv4_contours_free        cv4_contours_free        $202
#func global cv4_contours_count       cv4_contours_count       $202
#func global cv4_draw_contours        cv4_draw_contours        $202
#func global cv4_contour_area         cv4_contour_area         $202
#func global cv4_contour_length       cv4_contour_length       $202
#func global cv4_bounding_rect        cv4_bounding_rect        $202
#func global cv4_min_area_rect        cv4_min_area_rect        $202
#func global cv4_min_enclosing_circle cv4_min_enclosing_circle $202
#func global cv4_approx_poly_dp       cv4_approx_poly_dp       $202
#func global cv4_convex_hull          cv4_convex_hull          $202
#func global cv4_contour_size         cv4_contour_size         $202
#func global cv4_contour_point        cv4_contour_point        $202
#func global cv4_moments              cv4_moments              $202

; ---- features2d : ORB / AKAZE / SIFT / matchers ----
; 検出器はキーポイント + 記述子をハンドルとして返す。
; キーポイントは cv4_kp_count / cv4_kp_get で、マッチは
; cv4_match_count / cv4_match_get で HSP 側から反復する。
#func global cv4_orb_detect_compute   cv4_orb_detect_compute   $202
#func global cv4_akaze_detect_compute cv4_akaze_detect_compute $202
#func global cv4_sift_detect_compute  cv4_sift_detect_compute  $202
#func global cv4_good_features_to_track cv4_good_features_to_track $202
#func global cv4_corner_harris        cv4_corner_harris        $202
#func global cv4_bf_match             cv4_bf_match             $202
#func global cv4_kp_free              cv4_kp_free              $202
#func global cv4_kp_count             cv4_kp_count             $202
#func global cv4_kp_get               cv4_kp_get               $202
#func global cv4_match_free           cv4_match_free           $202
#func global cv4_match_count          cv4_match_count          $202
#func global cv4_match_get            cv4_match_get            $202
#func global cv4_draw_keypoints       cv4_draw_keypoints       $202
#func global cv4_draw_matches         cv4_draw_matches         $202

; ---- photo : denoising / inpaint / bilateral / seamless / stylization ----
; photo モジュールの主要関数。seamless_clone は別の画像をベースに
; src をブレンド、stylization/pencil_sketch は芸術的フィルタ。
#func global cv4_bilateral       cv4_bilateral       $202
#func global cv4_denoise         cv4_denoise         $202
#func global cv4_inpaint         cv4_inpaint         $202
#func global cv4_seamless_clone  cv4_seamless_clone  $202
#func global cv4_decolor         cv4_decolor         $202
#func global cv4_detail_enhance  cv4_detail_enhance  $202
#func global cv4_edge_preserve   cv4_edge_preserve   $202
#func global cv4_stylization     cv4_stylization     $202
#func global cv4_pencil_sketch   cv4_pencil_sketch   $202

; ---- video : optical flow / background subtraction / trackers ----
; オプティカルフロー
#func global cv4_optflow_farneback cv4_optflow_farneback $202
#func global cv4_optflow_lk        cv4_optflow_lk        $202
; 背景差分
#func global cv4_bgsub_create_mog2 cv4_bgsub_create_mog2 $202
#func global cv4_bgsub_create_knn  cv4_bgsub_create_knn  $202
#func global cv4_bgsub_apply       cv4_bgsub_apply       $202
#func global cv4_bgsub_free        cv4_bgsub_free        $202
; トラッカ (OpenCV 4.12 main: MIL のみ。KCF/CSRT は contrib 同梱)
#func global cv4_tracker_create_mil  cv4_tracker_create_mil  $202
#func global cv4_tracker_init        cv4_tracker_init        $202
#func global cv4_tracker_update      cv4_tracker_update      $202
#func global cv4_tracker_free        cv4_tracker_free        $202

; ---- calib3d : homography / perspective transforms ----
#func global cv4_find_homography            cv4_find_homography            $202
#func global cv4_warp_perspective           cv4_warp_perspective           $202
#func global cv4_get_perspective_transform  cv4_get_perspective_transform  $202
#func global cv4_get_affine_transform       cv4_get_affine_transform       $202

; ---- objdetect extras : HOG + QR code ----
#func global cv4_hog_detect_people  cv4_hog_detect_people  $202
#func global cv4_qr_detect          cv4_qr_detect          $202
#func global cv4_qr_decode          cv4_qr_decode          $202

; ---- imgcodecs extras: flags / memory buffer encode/decode ----
#func global cv4_imread_flags   cv4_imread_flags   $202
#func global cv4_imdecode       cv4_imdecode       $202
#func global cv4_imencode       cv4_imencode       $202

; ---- stitching / panorama ----
; img_ids_array: int 配列 (cv4 画像ハンドル ID のリスト)
#func global cv4_stitch         cv4_stitch         $202

; ---- drawing extras ----
#func global cv4_draw_arrow     cv4_draw_arrow     $202
#func global cv4_draw_marker    cv4_draw_marker    $202
#func global cv4_draw_ellipse   cv4_draw_ellipse   $202
#func global cv4_fill_poly      cv4_fill_poly      $202

; ---- misc utilities ----
#func global cv4_mat_clone      cv4_mat_clone      $202
#func global cv4_put_pixel      cv4_put_pixel      $202
#func global cv4_get_pixel      cv4_get_pixel      $202
#func global cv4_build_version  cv4_build_version  $202

#endif
