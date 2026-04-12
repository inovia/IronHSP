;
;   hspcv4.dll header  (OpenCV 4.x plugin for IronHSP)
;
;   Phase 1 : beginner API (no underscore)
;   Usage:
;     #include "hspcv4.as"
;
#ifndef __hspcv4__
#define __hspcv4__

; --- aruco predefined dictionaries (cv4_aruco_detect / generate 第引数) ---
#define global CV4_ARUCO_DICT_4X4_50      0
#define global CV4_ARUCO_DICT_4X4_100     1
#define global CV4_ARUCO_DICT_4X4_250     2
#define global CV4_ARUCO_DICT_4X4_1000    3
#define global CV4_ARUCO_DICT_5X5_50      4
#define global CV4_ARUCO_DICT_5X5_100     5
#define global CV4_ARUCO_DICT_5X5_250     6
#define global CV4_ARUCO_DICT_5X5_1000    7
#define global CV4_ARUCO_DICT_6X6_50      8
#define global CV4_ARUCO_DICT_6X6_100     9
#define global CV4_ARUCO_DICT_6X6_250    10
#define global CV4_ARUCO_DICT_6X6_1000   11
#define global CV4_ARUCO_DICT_7X7_50     12
#define global CV4_ARUCO_DICT_7X7_100    13
#define global CV4_ARUCO_DICT_7X7_250    14
#define global CV4_ARUCO_DICT_7X7_1000   15
#define global CV4_ARUCO_DICT_ARUCO_ORIGINAL 16

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

; --- Phase 16: DNN extras ---
; cv4_dnn_load_caffe   nid, "deploy.prototxt", "model.caffemodel"
; cv4_dnn_load_tf      nid, "model.pb" [, "config.pbtxt"]
; cv4_dnn_load_darknet nid, "yolo.cfg", "yolo.weights"
; cv4_dnn_set_backend  nid, backend, target
;   backend: 0=DEFAULT, 3=OPENCV, 5=CUDA  / target: 0=CPU, 1=OPENCL, 6=CUDA
; cv4_dnn_nms_boxes    rects, count, scores_x10000, score_thresh_x10000, nms_thresh_x10000
;   YOLO 等の検出後に Non-Maximum Suppression をかける
#func global cv4_dnn_load_caffe   cv4_dnn_load_caffe   $202
#func global cv4_dnn_load_tf      cv4_dnn_load_tf      $202
#func global cv4_dnn_load_darknet cv4_dnn_load_darknet $202
#func global cv4_dnn_set_backend  cv4_dnn_set_backend  $202
#func global cv4_dnn_nms_boxes    cv4_dnn_nms_boxes    $202

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

; ---- arbitrary kernel convolution (Phase 15) ----
; cv4_filter2d_3x3 dst, src, k00, k01, k02, k10, k11, k12, k20, k21, k22 [, delta]
;   3x3 任意カーネルで畳み込み。9 つの要素を直接 double で指定。
;   例 (sharpen): cv4_filter2d_3x3 dst, src, 0,-1,0, -1,5,-1, 0,-1,0
;   例 (emboss):  cv4_filter2d_3x3 dst, src, -2,-1,0, -1,1,1, 0,1,2, 128
; cv4_filter2d_mat dst, src, kernel_mat_id [, delta]
;   任意サイズの kernel を Mat ハンドルで渡す版 (高度用途)
#func global cv4_filter2d_3x3   cv4_filter2d_3x3   $202
#func global cv4_filter2d_mat   cv4_filter2d_mat   $202

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
; --- Phase 17: hierarchical contours ---
; cv4_find_contours_hier cid, hier_mat_id, src [, mode=RETR_TREE] [, method=CHAIN_APPROX_SIMPLE]
;   階層情報を hier_mat (Nx4 CV_32S) で同時取得
; cv4_contour_hier_get hier_mat_id, idx, var_next, var_prev, var_child, var_parent
;   特定 contour の階層関係 (隣接 / 親子 index、なしは -1) を取得
#func global cv4_find_contours_hier   cv4_find_contours_hier   $202
#func global cv4_contour_hier_get     cv4_contour_hier_get     $202
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

; ---- ML module (Phase 18): SVM / KNN / RTrees / ANN_MLP ----
; algo type 定数 (cv4_ml_load 第 3 引数)
#define global CV4_ML_SVM           0
#define global CV4_ML_KNN           1
#define global CV4_ML_RTREES        2
#define global CV4_ML_ANN_MLP       3
#define global CV4_ML_BOOST         4
#define global CV4_ML_DTREES        5
#define global CV4_ML_NORMAL_BAYES  6
#define global CV4_ML_EM            7
#define global CV4_ML_LOGISTIC      8
; SVM kernel types
#define global CV4_ML_SVM_LINEAR    0
#define global CV4_ML_SVM_POLY      1
#define global CV4_ML_SVM_RBF       2
#define global CV4_ML_SVM_SIGMOID   3
#define global CV4_ML_SVM_CHI2      4
; sample layout
#define global CV4_ML_ROW_SAMPLE    0
#define global CV4_ML_COL_SAMPLE    1
;
#func global cv4_ml_svm_create     cv4_ml_svm_create     $202
#func global cv4_ml_knn_create     cv4_ml_knn_create     $202
#func global cv4_ml_rtrees_create  cv4_ml_rtrees_create  $202
#func global cv4_ml_ann_create     cv4_ml_ann_create     $202
#func global cv4_ml_train          cv4_ml_train          $202
#func global cv4_ml_predict        cv4_ml_predict        $202
#func global cv4_ml_save           cv4_ml_save           $202
#func global cv4_ml_load           cv4_ml_load           $202
#func global cv4_ml_free           cv4_ml_free           $202

; ---- Face module (Phase 19): LBPH/Eigen/Fisher + FacemarkLBF/Kazemi ----
; FaceRecognizer 種別 (cv4_face_load 第 3 引数)
#define global CV4_FACE_LBPH       0
#define global CV4_FACE_EIGEN      1
#define global CV4_FACE_FISHER     2
; Facemark 種別 (cv4_facemark_create 第 2 引数)
#define global CV4_FACEMARK_LBF    0
#define global CV4_FACEMARK_KAZEMI 1
;
#func global cv4_face_lbph_create   cv4_face_lbph_create   $202
#func global cv4_face_eigen_create  cv4_face_eigen_create  $202
#func global cv4_face_fisher_create cv4_face_fisher_create $202
#func global cv4_face_predict       cv4_face_predict       $202
#func global cv4_face_save          cv4_face_save          $202
#func global cv4_face_load          cv4_face_load          $202
#func global cv4_face_free          cv4_face_free          $202
#func global cv4_facemark_create    cv4_facemark_create    $202
#func global cv4_facemark_load      cv4_facemark_load      $202
#func global cv4_facemark_free      cv4_facemark_free      $202

; ---- imgproc extras (Phase 20): watershed / grabCut / colormap / etc ----
; ColorMap 種別 (cv4_apply_color_map 第 3 引数; cv::COLORMAP_*)
#define global CV4_COLORMAP_AUTUMN    0
#define global CV4_COLORMAP_BONE      1
#define global CV4_COLORMAP_JET       2
#define global CV4_COLORMAP_WINTER    3
#define global CV4_COLORMAP_RAINBOW   4
#define global CV4_COLORMAP_OCEAN     5
#define global CV4_COLORMAP_SUMMER    6
#define global CV4_COLORMAP_SPRING    7
#define global CV4_COLORMAP_COOL      8
#define global CV4_COLORMAP_HSV       9
#define global CV4_COLORMAP_PINK      10
#define global CV4_COLORMAP_HOT       11
; GrabCut mode
#define global CV4_GC_INIT_WITH_RECT  0
#define global CV4_GC_INIT_WITH_MASK  1
#define global CV4_GC_EVAL            2
;
#func global cv4_apply_color_map      cv4_apply_color_map      $202
#func global cv4_watershed            cv4_watershed            $202
#func global cv4_grab_cut             cv4_grab_cut             $202
#func global cv4_connected_components cv4_connected_components $202
#func global cv4_moments_centroid     cv4_moments_centroid     $202

; ---- Stereo (Phase 21) ----
#func global cv4_stereo_bm_create     cv4_stereo_bm_create     $202
#func global cv4_stereo_sgbm_create   cv4_stereo_sgbm_create   $202
#func global cv4_stereo_compute       cv4_stereo_compute       $202
#func global cv4_stereo_free          cv4_stereo_free          $202

; ---- xphoto (Phase 22): white balance / oil painting / BM3D ----
; freetype は WITH_FREETYPE=OFF (FreeType/HarfBuzz 未導入) のため別途
#func global cv4_xphoto_simple_wb     cv4_xphoto_simple_wb     $202
#func global cv4_xphoto_grayworld_wb  cv4_xphoto_grayworld_wb  $202
#func global cv4_xphoto_oil_painting  cv4_xphoto_oil_painting  $202
#func global cv4_xphoto_bm3d_denoise  cv4_xphoto_bm3d_denoise  $202

; ---- features2d 追加 + KalmanFilter (Phase 23) ----
#func global cv4_brisk_detect_compute cv4_brisk_detect_compute $202
#func global cv4_fast_detect          cv4_fast_detect          $202
#func global cv4_kalman_create        cv4_kalman_create        $202
#func global cv4_kalman_predict       cv4_kalman_predict       $202
#func global cv4_kalman_correct       cv4_kalman_correct       $202
#func global cv4_kalman_free          cv4_kalman_free          $202

; ---- xfeatures2d / ximgproc extras (Phase 24) ----
#func global cv4_msd_detect           cv4_msd_detect           $202
#func global cv4_fast_line_detect     cv4_fast_line_detect     $202
#func global cv4_peilin_normalize     cv4_peilin_normalize     $202
#func global cv4_am_filter            cv4_am_filter            $202

; ---- Phase 25: wechat_qrcode + quality + plot ----
; text/OCR (Tesseract) と saliency は別フェーズへ繰り延べ。
#func global cv4_wechat_qr_decode     cv4_wechat_qr_decode     $202
#func global cv4_quality_psnr         cv4_quality_psnr         $202
#func global cv4_quality_ssim         cv4_quality_ssim         $202
#func global cv4_plot                 cv4_plot                 $202

; ---- core 拡充 (Phase 26): PCA / SVD / dft / dct / kmeans ----
#func global cv4_dft                  cv4_dft                  $202
#func global cv4_dct                  cv4_dct                  $202
#func global cv4_kmeans               cv4_kmeans               $202
#func global cv4_pca_compute          cv4_pca_compute          $202
#func global cv4_svd_compute          cv4_svd_compute          $202

; ---- main 漏れ回収 (Phase 27) ----
#func global cv4_flip                 cv4_flip                 $202
#func global cv4_transpose            cv4_transpose            $202
#func global cv4_copy_make_border     cv4_copy_make_border     $202
#func global cv4_in_range             cv4_in_range             $202
#func global cv4_set_window_title     cv4_set_window_title     $202
#func global cv4_resize_window        cv4_resize_window        $202

; ---- FreeType (Phase 22 follow): TTF/OTF font rendering ----
#func global cv4_freetype_create      cv4_freetype_create      $202
#func global cv4_freetype_put_text    cv4_freetype_put_text    $202
#func global cv4_freetype_free        cv4_freetype_free        $202

; ---- Saliency / text (Phase 25 follow): no external deps ----
; Tesseract 依存の OCR は別タスクへ繰り延べ。
#func global cv4_saliency_spectral    cv4_saliency_spectral    $202
#func global cv4_saliency_fine        cv4_saliency_fine        $202
#func global cv4_text_detect_swt      cv4_text_detect_swt      $202

; ---- calib3d full (Phase 14): camera calibration / pose estimation ----
; cv4_camera_matrix dst, fx, fy, cx, cy        — 3x3 K 行列を生成
; cv4_dist_coeffs   dst, k1, k2, p1, p2, k3    — 1x5 歪み係数 D を生成
; cv4_undistort     dst, src, K, D             — 歪み補正
; cv4_rodrigues     dst, src                   — 回転ベクトル <-> 回転行列
; cv4_solve_pnp     rvec, tvec, obj_pts, img_pts, K, D [, flags=0]
; cv4_project_points img_pts, obj_pts, rvec, tvec, K, D
; cv4_find_chessboard_corners corners, img, w, h
#func global cv4_camera_matrix           cv4_camera_matrix           $202
#func global cv4_dist_coeffs             cv4_dist_coeffs             $202
#func global cv4_undistort               cv4_undistort               $202
#func global cv4_rodrigues               cv4_rodrigues               $202
#func global cv4_solve_pnp               cv4_solve_pnp               $202
#func global cv4_project_points          cv4_project_points          $202
#func global cv4_find_chessboard_corners cv4_find_chessboard_corners $202

; ---- objdetect extras : HOG + QR code ----
#func global cv4_hog_detect_people  cv4_hog_detect_people  $202
#func global cv4_qr_detect          cv4_qr_detect          $202
#func global cv4_qr_decode          cv4_qr_decode          $202

; ---- aruco markers (basic detection in OpenCV 4.x main module) ----
; cv4_aruco_detect rects, ids, count, img_id [, dict=DICT_4X4_50]
;   rects: stdim cv_rect array で確保
;   ids: int 配列、検出したマーカ ID を格納
; cv4_aruco_generate dst_id, dict, marker_id, side_pixels [, border=1]
#func global cv4_aruco_detect       cv4_aruco_detect       $202
#func global cv4_aruco_generate     cv4_aruco_generate     $202

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

; ---- contrib DLL proxy (requires hspcv4_contrib.dll / hspcv4_contrib_64.dll) ----
; これらの命令は main DLL が遅延ロードで hspcv4_contrib.dll を呼び出す形で
; 実装されています。contrib DLL が配布に含まれていない場合は実行時エラーに
; なります (stat にエラーコードが入る)。
;
; Phase 13a 時点では cv4_contrib_version のみがテスト用に実装されています。
; Phase 13b 以降で KCF/CSRT トラッカ、Aruco マーカ、xfeatures2d (SURF/BRIEF 等)、
; bgsegm の追加背景差分、ximgproc、img_hash、optflow、dnn_superres 等の
; ラッパを順次追加予定です。
#func global cv4_contrib_version  cv4_contrib_version  $202

; ---- contrib: tracking module (KCF / CSRT) ----
; cv::Tracker 抽象を継承するため、init/update/free は既存の cv4_tracker_*
; をそのまま使えます。create のみ contrib DLL から呼ばれます。
#func global cv4_tracker_create_csrt  cv4_tracker_create_csrt  $202
#func global cv4_tracker_create_kcf   cv4_tracker_create_kcf   $202

; ---- contrib: xfeatures2d (BRIEF/FREAK/DAISY/Star/HarrisLaplace) ----
; SURF は nonfree なので含めず。Detector 系は keypoints を生成、
; Compute 系は既存 keypoints から記述子を計算 (cv4_orb_detect_compute と
; 同じ KeyPointSet ハンドルを使用)。
#func global cv4_star_detect           cv4_star_detect           $202
#func global cv4_harris_laplace_detect cv4_harris_laplace_detect $202
#func global cv4_brief_compute         cv4_brief_compute         $202
#func global cv4_freak_compute         cv4_freak_compute         $202
#func global cv4_daisy_compute         cv4_daisy_compute         $202

; ---- contrib: bgsegm (CNT/GMG/LSBP/GSOC/MOG additional bgsubtractors) ----
; 既存の cv4_bgsub_apply / cv4_bgsub_free がそのまま使える。
#func global cv4_bgsub_create_cnt   cv4_bgsub_create_cnt   $202
#func global cv4_bgsub_create_gmg   cv4_bgsub_create_gmg   $202
#func global cv4_bgsub_create_lsbp  cv4_bgsub_create_lsbp  $202
#func global cv4_bgsub_create_gsoc  cv4_bgsub_create_gsoc  $202
#func global cv4_bgsub_create_mog   cv4_bgsub_create_mog   $202

; ---- contrib: ximgproc (selected) ----
; cv4_thinning              dst, src [, type=0(ZHANGSUEN) or 1(GUOHALL)]
; cv4_niblack               dst, src, max_value, type, block_size, k
; cv4_anisotropic_diffusion dst, src, alpha, K, niters
; cv4_guided_filter         dst, guide, src, radius, eps
; cv4_l0_smooth             dst, src [, lambda=0.02] [, kappa=2.0]
; cv4_fast_global_smoother  dst, guide, src, lambda, sigma_color
; cv4_weighted_median       dst, joint, src [, radius=7]
#func global cv4_thinning              cv4_thinning              $202
#func global cv4_niblack               cv4_niblack               $202
#func global cv4_anisotropic_diffusion cv4_anisotropic_diffusion $202
#func global cv4_guided_filter         cv4_guided_filter         $202
#func global cv4_l0_smooth             cv4_l0_smooth             $202
#func global cv4_fast_global_smoother  cv4_fast_global_smoother  $202
#func global cv4_weighted_median       cv4_weighted_median       $202

; ---- contrib: img_hash (perceptual hashes) ----
; すべて (dst_id, src_id) の 2 引数。出力 hash は Mat (1xN) 形式。
; ハッシュ同士の比較は cv4_abs_diff + cv4_count_nonzero 等で実装可能。
#func global cv4_phash                cv4_phash                $202
#func global cv4_average_hash         cv4_average_hash         $202
#func global cv4_block_mean_hash      cv4_block_mean_hash      $202
#func global cv4_color_moment_hash    cv4_color_moment_hash    $202
#func global cv4_marr_hildreth_hash   cv4_marr_hildreth_hash   $202
#func global cv4_radial_variance_hash cv4_radial_variance_hash $202

; ---- contrib: optflow (advanced dense flows) ----
; どれも (flow_mat_id, prev_id, next_id)。出力 flow は HxWx2 CV_32F。
#func global cv4_optflow_dualtvl1        cv4_optflow_dualtvl1        $202
#func global cv4_optflow_deepflow        cv4_optflow_deepflow        $202
#func global cv4_optflow_sparse_to_dense cv4_optflow_sparse_to_dense $202

; ---- contrib: dnn_superres (EDSR / ESPCN / FSRCNN / LapSRN) ----
; 外部 .pb モデルファイルが必要 (EDSR_x4.pb 等を別途取得)。
;   cv4_dnn_sr_create   sr_id, "model.pb", "algo_name", scale
;   cv4_dnn_sr_upsample sr_id, dst_img_id, src_img_id
;   cv4_dnn_sr_free     sr_id
#func global cv4_dnn_sr_create   cv4_dnn_sr_create   $202
#func global cv4_dnn_sr_upsample cv4_dnn_sr_upsample $202
#func global cv4_dnn_sr_free     cv4_dnn_sr_free     $202

#endif
