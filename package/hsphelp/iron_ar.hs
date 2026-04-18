;
; iron_ar.hsp  HSP3 ヘルプ (日本語)
; ArUco マーカーベース AR ヘルパ (hspcv4 + hspdxlib)
;

%type
拡張命令
%ver
3.8
%date
2026/04/18
%author
IronHSP
%dll
iron_ar.hsp

%url
https://github.com/inovia/IronHSP
%port
Win32 / Win64

%note
iron_ar.hsp は hspcv4 の ArUco マーカー検出と hspdxlib の 3D 描画を
組み合わせて、HSP で簡易 AR (拡張現実) 表示を行うための支援モジュール
です。

  #include "hspcv4.as"
  #include "hspdxlib.as"
  #include "iron_ar.hsp"

典型的な流れ:
  1. ar_default_calibration (あるいは ar_load_calibration) でカメラ
     内部パラメータを準備
  2. ar_make_mat_k / ar_make_mat_d で OpenCV Mat 化
  3. 毎フレーム cv4_aruco_detect (or ar_detect_markers) でマーカー検出
  4. ar_estimate_pose_single で solvePnP → rvec/tvec
  5. ar_pose_to_dxmat で DxLib MATRIX_D 化
  6. SetTransformToViewD でカメラに適用 → DrawCube3DD / stl_draw_dxlib

%group
iron_ar (AR 支援)

%index
ar_default_calibration
仮想カメラキャリブレーション生成
%prm
var K, var D, img_w, img_h
K : 9 要素の double 配列 (カメラ行列 3x3 row-major)
D : 5 要素の double 配列 (歪み係数 k1, k2, p1, p2, k3)
img_w : 画像幅 (px)
img_h : 画像高 (px)
%inst
キャリブレーションが手元に無い場合の "おおよそ" の推定値を生成します。
fx = fy = img_w、cx = img_w/2、cy = img_h/2、D = 全 0 と仮定。
正確な AR には `ar_load_calibration` で実測値を読み込んでください。



%index
ar_load_calibration
キャリブレーションファイルの読み込み
%prm
var K, var D, "calib.txt"
%inst
空白 / 改行区切りのプレーンテキストからカメラキャリブレーションを
読み込みます。書式:
  - 先頭 9 値: 3x3 カメラ行列 K (row-major)
  - 続く 5 値: 歪み係数 D (k1, k2, p1, p2, k3)

OpenCV の calibrateCamera 出力を txt で保存したものをそのまま使えます。



%index
ar_make_mat_k
カメラ行列 K を OpenCV Mat 化
%prm
mat_id, var K
mat_id : 出力先の cv4 ハンドル番号 (呼び出し側で採番)
K : ar_default_calibration / ar_load_calibration で準備した 9 要素配列
%inst
HSP 側の double 配列から OpenCV cv::Mat (3x3, CV_64F) を生成します。
内部で cv4_mat_from_darray を呼びます。



%index
ar_make_mat_d
歪み係数 D を OpenCV Mat 化
%prm
mat_id, var D
%inst
HSP 側の double 配列から OpenCV cv::Mat (5x1, CV_64F) を生成します。



%index
ar_detect_markers
ArUco マーカー検出 (cv4_aruco_detect の薄いラッパ)
%prm
var corners, var ids, var n, img_id, dict
corners : 検出結果の 2D 点配列 (float 2D)
ids     : 検出マーカー ID 配列 (int)
n       : 検出数 (int)
img_id  : 入力画像の cv4 ハンドル
dict    : ArUco 辞書定数 (CV4_ARUCO_DICT_4X4_50 など)
%inst
cv4_aruco_detect を呼び出し、結果を標準 HSP 配列として返します。



%index
ar_estimate_pose_single
単一マーカーの 6-DoF pose 推定
%prm
var corners, idx, marker_size, k_mat_id, d_mat_id, var rvec, var tvec
idx : 対象マーカーのインデックス (0-based)
marker_size : 実物マーカー 1 辺の物理サイズ (メートル)
k_mat_id, d_mat_id : ar_make_mat_k / ar_make_mat_d で作った Mat ID
rvec : 回転ベクトル (double, 3 要素)
tvec : 平行移動 (double, 3 要素, m 単位)
%inst
検出したマーカーの 4 頂点座標と既知の物体座標 (中心原点・Z=0 の
正方形) から solvePnP を呼び、回転ベクトル rvec と平行移動 tvec を
取得します。Mat ID 195〜199 は内部で一時利用するので他用途で使わない
でください。



%index
ar_pose_to_dxmat
rvec/tvec を DxLib MATRIX_D に変換
%prm
var rvec, var tvec, var viewmat
viewmat : 出力 double 16 要素 (column-major MATRIX_D 互換)
%inst
OpenCV 座標系 (+X 右 / +Y 下 / +Z 前) から DxLib LH 座標系
(+X 右 / +Y 上 / +Z 前) への軸変換を行い、DxLib の
`SetTransformToViewD` にそのまま渡せる 4x4 行列を生成します。



%index
ar_compose_inv_mat
view 行列の逆行列計算
%prm
var mat, var out
%inst
4x4 affine 行列の逆変換を計算します。回転部分は転置、平行移動部分は
-R^T * t で計算されます。通常の AR オーバーレイでは使用しませんが、
カメラの world 座標を取得するなどの用途で利用できます。
