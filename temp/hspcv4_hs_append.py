# -*- coding: utf-8 -*-
"""
hspcv4.hs Japanese help append script.
Appends missing command entries (Phase 18-27 range) to hspcv4.hs.

- Encoding: CP932 (Shift-JIS), line endings: LF (existing file convention)
- Idempotent: skips commands already documented (%index <name>)
- Safe to re-run
"""
import os
import sys
import re

HS_PATH = r"j:\HNWorks\IronHSP_2026\package\hsphelp\hspcv4.hs"

# Each entry: (name, title, group, prm_line, prm_desc_lines, inst_lines)
ENTRIES = [
    # ==================== ml (機械学習) ====================
    ("cv4_ml_svm_create", "SVM モデル生成", "hspcv4 機械学習",
     "model_id, type, kernel, c_x100, gamma_x100",
     ["model_id : 新規作成する ML ハンドル ID",
      "type : SVM 種別 (100=C_SVC など)",
      "kernel : カーネル種別 (CV4_ML_SVM_LINEAR/POLY/RBF/SIGMOID/CHI2)",
      "c_x100 : C パラメータ (x100 固定小数点)",
      "gamma_x100 : gamma パラメータ (x100 固定小数点)"],
     ["cv::ml::SVM を生成します。type と kernel の既定値はそれぞれ C_SVC / RBF。",
      "学習は cv4_ml_train、予測は cv4_ml_predict を使用します。"]),

    ("cv4_ml_knn_create", "KNN モデル生成", "hspcv4 機械学習",
     "model_id, k",
     ["model_id : 新規作成する ML ハンドル ID",
      "k : 近傍点数 (既定 3)"],
     ["cv::ml::KNearest を生成します。シンプルな k 近傍分類器です。"]),

    ("cv4_ml_rtrees_create", "RTrees モデル生成", "hspcv4 機械学習",
     "model_id, max_depth, min_sample_count",
     ["model_id : 新規作成する ML ハンドル ID",
      "max_depth : 木の最大深さ (既定 10)",
      "min_sample_count : 葉ノードの最小サンプル数 (既定 10)"],
     ["cv::ml::RTrees (ランダムフォレスト) を生成します。"]),

    ("cv4_ml_ann_create", "ANN-MLP モデル生成", "hspcv4 機械学習",
     "model_id, layer_sizes_mat_id",
     ["model_id : 新規作成する ML ハンドル ID",
      "layer_sizes_mat_id : 各レイヤのニューロン数 (CV_32S 1xN) Mat"],
     ["cv::ml::ANN_MLP (多層パーセプトロン) を生成します。",
      "例: 入力3/中間5/出力2 なら [3,5,2] を Mat で渡します。"]),

    ("cv4_ml_train", "ML モデル学習", "hspcv4 機械学習",
     "model_id, samples_id, layout, responses_id",
     ["model_id : 作成済み ML ハンドル",
      "samples_id : 学習データ Mat (CV_32F)",
      "layout : 0=ROW_SAMPLE, 1=COL_SAMPLE",
      "responses_id : 教師信号 Mat (CV_32F)"],
     ["ML モデル共通の学習関数。内部で cv::ml::StatModel::train を呼びます。"]),

    ("cv4_ml_predict", "ML モデル予測", "hspcv4 機械学習",
     "model_id, samples_id, results_id, flags",
     ["model_id : 学習済み ML ハンドル",
      "samples_id : 予測入力サンプル Mat",
      "results_id : 出力結果 Mat",
      "flags : 予測オプションフラグ (既定 0)"],
     ["学習済みモデルで予測を実行します。cv::ml::StatModel::predict のラッパー。"]),

    ("cv4_ml_save", "ML モデル保存", "hspcv4 機械学習",
     "model_id, path",
     ["model_id : 学習済み ML ハンドル",
      "path : 保存先 XML/YAML ファイルパス"],
     ["学習済みモデルを XML/YAML として保存します。"]),

    ("cv4_ml_load", "ML モデル読み込み", "hspcv4 機械学習",
     "model_id, path, algo_type",
     ["model_id : 読み込み先 ML ハンドル ID",
      "path : XML/YAML ファイルパス",
      "algo_type : CV4_ML_SVM/KNN/RTREES/ANN_MLP/BOOST/DTREES/NORMAL_BAYES/EM/LOGISTIC"],
     ["保存済み ML モデルを読み込みます。algo_type を正しく指定する必要があります。"]),

    ("cv4_ml_free", "ML モデル破棄", "hspcv4 機械学習",
     "model_id",
     ["model_id : ML ハンドル"],
     ["ML モデルを破棄します。"]),

    # ==================== face (顔認識) ====================
    ("cv4_face_lbph_create", "LBPH 顔認識器生成", "hspcv4 顔認識",
     "model_id, radius, neighbors, grid_x, grid_y",
     ["model_id : 新規作成する顔認識ハンドル ID",
      "radius : LBP 半径 (既定 1)",
      "neighbors : LBP 近傍点数 (既定 8)",
      "grid_x, grid_y : グリッド分割数 (既定 8,8)"],
     ["cv::face::LBPHFaceRecognizer を生成します。",
      "少量学習データで動作する顔認識アルゴリズムです。"]),

    ("cv4_face_eigen_create", "Eigenfaces 顔認識器生成", "hspcv4 顔認識",
     "model_id, num_components",
     ["model_id : 新規作成する顔認識ハンドル ID",
      "num_components : 使用する主成分数 (0=全て, 既定 0)"],
     ["cv::face::EigenFaceRecognizer を生成します。主成分分析ベースの顔認識。"]),

    ("cv4_face_fisher_create", "Fisherfaces 顔認識器生成", "hspcv4 顔認識",
     "model_id, num_components",
     ["model_id : 新規作成する顔認識ハンドル ID",
      "num_components : 使用する LDA 成分数 (0=全て, 既定 0)"],
     ["cv::face::FisherFaceRecognizer を生成します。LDA ベースの顔認識器。"]),

    ("cv4_face_predict", "顔ラベル予測", "hspcv4 顔認識",
     "model_id, src_id, var_label, var_confidence_x100",
     ["model_id : 学習済み顔認識ハンドル",
      "src_id : 入力顔画像 (グレースケール)",
      "var_label : 予測ラベルを書き戻す int 変数",
      "var_confidence_x100 : 信頼度 (x100 固定小数点) を書き戻す int 変数"],
     ["顔認識器で入力画像のラベルを予測し、ラベルと距離 (confidence) を返します。"]),

    ("cv4_face_save", "顔認識器モデル保存", "hspcv4 顔認識",
     "model_id, path",
     ["model_id : 学習済み顔認識ハンドル",
      "path : 保存先 XML/YAML パス"],
     ["顔認識器のモデルを保存します。"]),

    ("cv4_face_load", "顔認識器モデル読み込み", "hspcv4 顔認識",
     "model_id, path, type",
     ["model_id : 読み込み先ハンドル ID",
      "path : XML/YAML ファイルパス",
      "type : CV4_FACE_LBPH / EIGEN / FISHER"],
     ["保存済み顔認識器を読み込みます。type で種別を指定します。"]),

    ("cv4_face_free", "顔認識器破棄", "hspcv4 顔認識",
     "model_id",
     ["model_id : 顔認識器ハンドル"],
     ["顔認識器を破棄します。"]),

    ("cv4_facemark_create", "Facemark 生成", "hspcv4 顔認識",
     "model_id, type",
     ["model_id : 新規作成する Facemark ハンドル",
      "type : CV4_FACEMARK_LBF / CV4_FACEMARK_KAZEMI"],
     ["cv::face::Facemark (顔ランドマーク検出器) を生成します。",
      "LBF または Kazemi アルゴリズムから選択します。"]),

    ("cv4_facemark_load", "Facemark モデル読み込み", "hspcv4 顔認識",
     "model_id, path",
     ["model_id : Facemark ハンドル",
      "path : 学習済みモデルファイル"],
     ["Facemark 用の学習済みモデルファイル (lbfmodel.yaml 等) を読み込みます。"]),

    ("cv4_facemark_free", "Facemark 破棄", "hspcv4 顔認識",
     "model_id",
     ["model_id : Facemark ハンドル"],
     ["Facemark を破棄します。"]),

    # ==================== imgproc extras (セグメンテーション/カラーマップ/幾何) ====================
    ("cv4_apply_color_map", "カラーマップ適用", "hspcv4 カラーマップ",
     "dst, src, colormap",
     ["dst : 出力画像 (BGR)",
      "src : 入力グレースケール画像",
      "colormap : CV4_COLORMAP_AUTUMN/BONE/JET/WINTER/RAINBOW/OCEAN/SUMMER/SPRING/COOL/HSV/PINK/HOT"],
     ["cv::applyColorMap のラッパー。グレースケール画像に OpenCV 組み込みの",
      "12 種類のカラーマップを適用して疑似カラー化します。"]),

    ("cv4_watershed", "Watershed セグメンテーション", "hspcv4 セグメンテーション",
     "markers_id, src_id",
     ["markers_id : 入出力マーカ Mat (CV_32S)。シードを与えると領域 ID で埋められる",
      "src_id : 入力 BGR 画像"],
     ["cv::watershed による領域分割を実行します。",
      "事前にシードとなるマーカを markers に書き込んでおく必要があります。"]),

    ("cv4_grab_cut", "GrabCut 前景抽出", "hspcv4 セグメンテーション",
     "mask_id, src_id, x, y, w, h, iters, mode",
     ["mask_id : 入出力マスク Mat (CV_8U)",
      "src_id : 入力 BGR 画像",
      "x, y, w, h : 前景候補矩形",
      "iters : 反復回数",
      "mode : CV4_GC_INIT_WITH_RECT / INIT_WITH_MASK / EVAL"],
     ["cv::grabCut のラッパー。矩形またはマスクで前景候補を指定し、",
      "反復的に前景/背景を抽出します。"]),

    ("cv4_connected_components", "連結成分ラベリング", "hspcv4 セグメンテーション",
     "labels_id, src_id, var_count, connectivity",
     ["labels_id : 出力ラベル Mat (CV_32S)",
      "src_id : 入力 2 値画像",
      "var_count : 検出ラベル数 (背景含む) を書き戻す int 変数",
      "connectivity : 4 または 8 (既定 8)"],
     ["cv::connectedComponents のラッパー。2 値画像の連結成分を",
      "ラベリングし、labels Mat とラベル総数を返します。"]),

    ("cv4_moments_centroid", "輪郭重心の取得", "hspcv4 幾何",
     "cid, index, var_cx_x10, var_cy_x10",
     ["cid : 輪郭セットハンドル",
      "index : 輪郭のインデックス",
      "var_cx_x10 : 重心 X を x10 固定小数点で書き戻す int 変数",
      "var_cy_x10 : 重心 Y を x10 固定小数点で書き戻す int 変数"],
     ["cv::moments を使って輪郭 i の重心 (cx, cy) を計算し、",
      "x10 倍した整数値で書き戻します。"]),

    # ==================== stereo ====================
    ("cv4_stereo_bm_create", "StereoBM 生成", "hspcv4 ステレオ",
     "stereo_id, num_disparities, block_size",
     ["stereo_id : 新規作成するステレオハンドル",
      "num_disparities : 視差数 (16 の倍数, 既定 64)",
      "block_size : マッチングブロックサイズ (奇数, 既定 21)"],
     ["cv::StereoBM を生成します。ブロックマッチング方式のステレオ対応点探索器。"]),

    ("cv4_stereo_sgbm_create", "StereoSGBM 生成", "hspcv4 ステレオ",
     "stereo_id, min_disp, num_disp, block_size, P1, P2",
     ["stereo_id : 新規作成するステレオハンドル",
      "min_disp : 最小視差 (既定 0)",
      "num_disp : 視差数 (16 の倍数, 既定 64)",
      "block_size : ブロックサイズ (既定 5)",
      "P1, P2 : 視差平滑化ペナルティ (0 で既定値)"],
     ["cv::StereoSGBM (セミグローバルブロックマッチング) を生成します。",
      "StereoBM より高品質な視差推定が可能です。"]),

    ("cv4_stereo_compute", "ステレオ視差計算", "hspcv4 ステレオ",
     "disparity_id, stereo_id, left_id, right_id",
     ["disparity_id : 出力視差 Mat",
      "stereo_id : ステレオマッチャハンドル",
      "left_id : 左画像 (グレースケール)",
      "right_id : 右画像 (グレースケール)"],
     ["左右画像から視差マップを計算します。"]),

    ("cv4_stereo_free", "ステレオマッチャ破棄", "hspcv4 ステレオ",
     "stereo_id",
     ["stereo_id : ステレオハンドル"],
     ["ステレオマッチャを破棄します。"]),

    # ==================== xphoto ====================
    ("cv4_xphoto_simple_wb", "シンプルホワイトバランス", "hspcv4 xphoto",
     "dst, src",
     ["dst : 出力画像",
      "src : 入力 BGR 画像"],
     ["cv::xphoto::SimpleWB によるホワイトバランス補正。",
      "ヒストグラム上下端クリップ方式のシンプルな手法です。"]),

    ("cv4_xphoto_grayworld_wb", "Gray-World ホワイトバランス", "hspcv4 xphoto",
     "dst, src",
     ["dst : 出力画像",
      "src : 入力 BGR 画像"],
     ["cv::xphoto::GrayworldWB によるホワイトバランス補正。",
      "画像平均色が灰色になるよう各チャネルをスケーリングします。"]),

    ("cv4_xphoto_oil_painting", "油絵風エフェクト", "hspcv4 xphoto",
     "dst, src, size, dyn_ratio",
     ["dst : 出力画像",
      "src : 入力 BGR 画像",
      "size : 近傍サイズ (既定 10)",
      "dyn_ratio : ダイナミックレンジ比 (既定 1)"],
     ["cv::xphoto::oilPainting による油絵風の非写実的フィルタを適用します。"]),

    ("cv4_xphoto_bm3d_denoise", "BM3D ノイズ除去", "hspcv4 xphoto",
     "dst, src, h_x100",
     ["dst : 出力画像",
      "src : 入力グレースケール画像",
      "h_x100 : フィルタ強度 h を x100 倍した int (既定 10=0.1)"],
     ["cv::xphoto::bm3dDenoising による高品質ノイズ除去。",
      "グレースケール専用。h が大きいほど強く平滑化します。"]),

    # ==================== features2d 追加 + Kalman ====================
    ("cv4_brisk_detect_compute", "BRISK 検出と記述子計算", "hspcv4 特徴検出",
     "kp_id, desc_id, src_id, threshold, octaves",
     ["kp_id : 出力キーポイントセットハンドル",
      "desc_id : 出力記述子 Mat",
      "src_id : 入力画像",
      "threshold : AGAST 検出閾値 (既定 30)",
      "octaves : オクターブ数 (既定 3)"],
     ["cv::BRISK によるキーポイント検出と記述子計算を同時に行います。"]),

    ("cv4_fast_detect", "FAST コーナー検出", "hspcv4 特徴検出",
     "kp_id, src_id, threshold, nonmax",
     ["kp_id : 出力キーポイントセットハンドル",
      "src_id : 入力画像",
      "threshold : 検出閾値 (既定 10)",
      "nonmax : 非最大抑制 (1=有効, 既定 1)"],
     ["cv::FAST による高速コーナー検出。"]),

    ("cv4_msd_detect", "MSD 検出器", "hspcv4 特徴検出",
     "kp_id, src_id, patch_radius, search_area_radius",
     ["kp_id : 出力キーポイントセットハンドル",
      "src_id : 入力画像",
      "patch_radius : パッチ半径 (既定 3)",
      "search_area_radius : 探索領域半径 (既定 5)"],
     ["cv::xfeatures2d::MSDDetector による特徴検出。Maximally Stable Detector。"]),

    ("cv4_fast_line_detect", "FastLineDetector 直線検出", "hspcv4 特徴検出",
     "lines_mat_id, src_id, len_thresh, do_merge",
     ["lines_mat_id : 出力直線 Mat (Nx4 CV_32F, x1,y1,x2,y2)",
      "src_id : 入力グレースケール画像",
      "len_thresh : 最小直線長 (既定 10)",
      "do_merge : 近接直線のマージ (0/1, 既定 0)"],
     ["cv::ximgproc::FastLineDetector による高速直線検出。",
      "LSD の代替として使用できます。"]),

    ("cv4_kalman_create", "Kalman フィルタ生成", "hspcv4 トラッキング",
     "kf_id, dynam_params, measure_params, control_params",
     ["kf_id : 新規作成するカルマンフィルタハンドル",
      "dynam_params : 状態ベクトル次元数",
      "measure_params : 観測ベクトル次元数",
      "control_params : 制御入力次元 (既定 0)"],
     ["cv::KalmanFilter を生成します。例: 2D 等速モデルなら dynam=4 (x,y,vx,vy), measure=2 (x,y)。"]),

    ("cv4_kalman_predict", "Kalman 予測", "hspcv4 トラッキング",
     "kf_id, dst_state_mat",
     ["kf_id : カルマンフィルタハンドル",
      "dst_state_mat : 予測後状態ベクトルを書き戻す Mat"],
     ["KalmanFilter::predict を呼び、次時刻の状態推定を得ます。"]),

    ("cv4_kalman_correct", "Kalman 観測補正", "hspcv4 トラッキング",
     "kf_id, measurement_mat_id, dst_state_mat_id",
     ["kf_id : カルマンフィルタハンドル",
      "measurement_mat_id : 観測ベクトル Mat",
      "dst_state_mat_id : 更新後 statePost を書き戻す Mat (-1 で省略)"],
     ["KalmanFilter::correct を呼んで観測値で状態を補正します。"]),

    ("cv4_kalman_free", "Kalman フィルタ破棄", "hspcv4 トラッキング",
     "kf_id",
     ["kf_id : カルマンフィルタハンドル"],
     ["カルマンフィルタを破棄します。"]),

    # ==================== ximgproc 追加 ====================
    ("cv4_peilin_normalize", "PeiLin 正規化", "hspcv4 幾何",
     "dst, src",
     ["dst : 出力 Mat (2x3 アフィン変換 T)",
      "src : 入力画像"],
     ["cv::ximgproc::PeiLinNormalization による画像のアフィン正規化を計算します。",
      "出力は 2x3 のアフィン変換行列です。"]),

    ("cv4_am_filter", "Adaptive Manifold フィルタ", "hspcv4 フィルタ",
     "dst, joint, src, sigma_s_x10, sigma_r_x10",
     ["dst : 出力画像",
      "joint : ガイド画像",
      "src : 入力画像",
      "sigma_s_x10 : 空間標準偏差 (x10)",
      "sigma_r_x10 : レンジ標準偏差 (x10)"],
     ["cv::ximgproc::amFilter によるエッジ保存平滑化。",
      "Adaptive Manifold Filter は bilateral filter の高速近似です。"]),

    # ==================== Phase 25 ====================
    ("cv4_wechat_qr_decode", "WeChat QR コード検出", "hspcv4 QR/バーコード",
     "var_count, src_id, det_proto, det_model, sr_proto, sr_model",
     ["var_count : 検出された QR コード数を書き戻す int 変数",
      "src_id : 入力画像",
      "det_proto : 検出器 prototxt ファイルパス",
      "det_model : 検出器 caffemodel ファイルパス",
      "sr_proto : 超解像 prototxt ファイルパス",
      "sr_model : 超解像 caffemodel ファイルパス"],
     ["cv::wechat_qrcode::WeChatQRCode による高精度 QR コード検出。",
      "小さく歪んだ QR コードも検出可能です。現時点では個数のみ返します。"]),

    ("cv4_quality_psnr", "PSNR 画質評価", "hspcv4 画質評価",
     "var_psnr_x100, ref_id, cmp_id",
     ["var_psnr_x100 : PSNR (dB) を x100 固定小数点で書き戻す int 変数",
      "ref_id : 参照画像",
      "cmp_id : 比較画像"],
     ["cv::quality::QualityPSNR による Peak Signal-to-Noise Ratio 計算。"]),

    ("cv4_quality_ssim", "SSIM 画質評価", "hspcv4 画質評価",
     "var_ssim_x10000, ref_id, cmp_id",
     ["var_ssim_x10000 : SSIM を x10000 固定小数点で書き戻す int 変数",
      "ref_id : 参照画像",
      "cmp_id : 比較画像"],
     ["cv::quality::QualitySSIM による Structural Similarity Index 計算。",
      "0..1 の値を x10000 倍した整数で返します。"]),

    ("cv4_plot", "1次元データのグラフ描画", "hspcv4 プロット",
     "dst_id, data_y_id, width, height",
     ["dst_id : 出力画像",
      "data_y_id : 入力データ Mat (CV_64F または CV_32F)",
      "width : 画像幅 (既定 600)",
      "height : 画像高さ (既定 400)"],
     ["cv::plot::Plot2d により 1 次元データを 2D グラフ画像 (BGR) として描画します。"]),

    # ==================== core 拡充 (Phase 26) ====================
    ("cv4_dft", "離散フーリエ変換", "hspcv4 行列演算",
     "dst, src, flags",
     ["dst : 出力 Mat",
      "src : 入力 Mat",
      "flags : DFT フラグ (既定 0)"],
     ["cv::dft のラッパー。離散フーリエ変換を計算します。",
      "フラグで DFT_INVERSE / DFT_COMPLEX_OUTPUT 等を指定できます。"]),

    ("cv4_dct", "離散コサイン変換", "hspcv4 行列演算",
     "dst, src, flags",
     ["dst : 出力 Mat",
      "src : 入力 Mat",
      "flags : DCT フラグ (既定 0)"],
     ["cv::dct のラッパー。離散コサイン変換を計算します。"]),

    ("cv4_kmeans", "k-means クラスタリング", "hspcv4 行列演算",
     "labels_id, data_id, K, max_iter, attempts, centers_id",
     ["labels_id : 出力ラベル Mat",
      "data_id : 入力データ Mat (CV_32F)",
      "K : クラスタ数",
      "max_iter : 最大反復数",
      "attempts : 初期化試行回数",
      "centers_id : 出力中心 Mat (-1 で省略)"],
     ["cv::kmeans によるクラスタリング。", "各サンプルのクラスタラベルと中心を計算します。"]),

    ("cv4_pca_compute", "主成分分析", "hspcv4 行列演算",
     "mean_id, eigenvecs_id, eigenvals_id, data_id, max_components",
     ["mean_id : 出力平均ベクトル Mat",
      "eigenvecs_id : 出力固有ベクトル Mat",
      "eigenvals_id : 出力固有値 Mat",
      "data_id : 入力データ Mat",
      "max_components : 最大成分数 (0=全て)"],
     ["cv::PCA::compute による主成分分析。",
      "平均・固有ベクトル・固有値を一度に計算します。"]),

    ("cv4_svd_compute", "特異値分解", "hspcv4 行列演算",
     "u_id, w_id, vt_id, src_id, flags",
     ["u_id : 出力 U 行列 Mat",
      "w_id : 出力特異値 Mat",
      "vt_id : 出力 V^T 行列 Mat",
      "src_id : 入力 Mat",
      "flags : SVD フラグ (既定 0)"],
     ["cv::SVD::compute による特異値分解。U, W, V^T に分解します。"]),

    # ==================== main 漏れ回収 (Phase 27) ====================
    ("cv4_flip", "画像反転", "hspcv4 行列演算",
     "dst, src, flip_code",
     ["dst : 出力画像",
      "src : 入力画像",
      "flip_code : 0=X 軸反転, 1=Y 軸反転, -1=両軸反転"],
     ["cv::flip による画像反転。"]),

    ("cv4_transpose", "行列転置", "hspcv4 行列演算",
     "dst, src",
     ["dst : 出力 Mat",
      "src : 入力 Mat"],
     ["cv::transpose による行列転置。"]),

    ("cv4_copy_make_border", "境界パディング", "hspcv4 行列演算",
     "dst, src, top, bottom, left, right, border_type, value_b, value_g, value_r",
     ["dst : 出力画像",
      "src : 入力画像",
      "top, bottom, left, right : 各辺に追加するピクセル数",
      "border_type : BORDER_CONSTANT(0) 等のボーダー種別",
      "value_b, value_g, value_r : CONSTANT 時の埋め値 BGR"],
     ["cv::copyMakeBorder のラッパー。画像の周囲にボーダーを追加します。"]),

    ("cv4_in_range", "範囲内マスク生成", "hspcv4 行列演算",
     "mask, src, lo_b, lo_g, lo_r, hi_b, hi_g, hi_r",
     ["mask : 出力 2 値マスク",
      "src : 入力 BGR 画像",
      "lo_b, lo_g, lo_r : 下限 BGR 値",
      "hi_b, hi_g, hi_r : 上限 BGR 値"],
     ["cv::inRange による色範囲抽出。BGR 各チャネルの上下限から",
      "2 値マスクを生成します。色抽出などに使用します。"]),

    ("cv4_set_window_title", "ウィンドウタイトル変更", "hspcv4 ウィンドウ",
     "winname, title",
     ["winname : 対象ウィンドウ名",
      "title : 新しいタイトル文字列"],
     ["cv::setWindowTitle のラッパー。既存 highgui ウィンドウのタイトルを変更します。"]),

    ("cv4_resize_window", "ウィンドウサイズ変更", "hspcv4 ウィンドウ",
     "winname, width, height",
     ["winname : 対象ウィンドウ名",
      "width : 新しい幅",
      "height : 新しい高さ"],
     ["cv::resizeWindow のラッパー。highgui ウィンドウのサイズを変更します。"]),

    # ==================== FreeType ====================
    ("cv4_freetype_create", "FreeType 生成", "hspcv4 FreeType",
     "ft_id, font_path",
     ["ft_id : 新規作成する FreeType ハンドル",
      "font_path : TTF/OTF フォントファイルパス"],
     ["cv::freetype::FreeType2 を生成し、指定フォントを読み込みます。",
      "cv4_freetype_put_text で日本語等のテキスト描画が可能になります。"]),

    ("cv4_freetype_put_text", "FreeType テキスト描画", "hspcv4 FreeType",
     "ft_id, dst_id, text, x, y, font_height, b, g, r, thickness, line_type",
     ["ft_id : FreeType ハンドル",
      "dst_id : 描画先画像",
      "text : 描画文字列 (UTF-8)",
      "x, y : 描画位置",
      "font_height : フォント高さ (ピクセル)",
      "b, g, r : 描画色 BGR (既定 255,255,255)",
      "thickness : 線の太さ (-1=塗りつぶし, 既定 -1)",
      "line_type : 線種 (既定 16=LINE_AA)"],
     ["FreeType 経由で TTF/OTF フォントによる高品質テキスト描画を行います。",
      "cv::putText と異なり日本語等の非 ASCII 文字も描画できます。"]),

    ("cv4_freetype_free", "FreeType 破棄", "hspcv4 FreeType",
     "ft_id",
     ["ft_id : FreeType ハンドル"],
     ["FreeType を破棄します。"]),

    # ==================== Saliency / text ====================
    ("cv4_saliency_spectral", "Spectral Residual Saliency", "hspcv4 Saliency",
     "dst, src",
     ["dst : 出力 Saliency マップ (CV_32F, 0..1)",
      "src : 入力画像"],
     ["cv::saliency::StaticSaliencySpectralResidual による",
      "スペクトル残差法のサリエンシマップ計算。"]),

    ("cv4_saliency_fine", "Fine-Grained Saliency", "hspcv4 Saliency",
     "dst, src",
     ["dst : 出力 Saliency マップ (CV_8U)",
      "src : 入力画像"],
     ["cv::saliency::StaticSaliencyFineGrained による",
      "細粒度サリエンシマップ計算。"]),

    ("cv4_text_detect_swt", "Stroke Width Transform 文字検出", "hspcv4 OCR",
     "var_count, rects_mat_id, src_id, dark_on_light",
     ["var_count : 検出矩形数を書き戻す int 変数",
      "rects_mat_id : 出力矩形 Mat (Nx4 CV_32S, x,y,w,h)",
      "src_id : 入力画像",
      "dark_on_light : 1=明背景の暗文字, 0=暗背景の明文字 (既定 1)"],
     ["cv::text::detectTextSWT による Stroke Width Transform 文字検出。",
      "Tesseract 等の OCR 依存なしで動作します。"]),

    # ==================== Tesseract OCR ====================
    ("cv4_ocr_create", "Tesseract OCR 生成", "hspcv4 OCR",
     "id, tessdata_dir, lang, oem, psm",
     ["id : 新規作成する OCR ハンドル",
      "tessdata_dir : tessdata フォルダパス (eng.traineddata 等を置く)",
      "lang : 言語コード (\"eng\", \"jpn\" 等)",
      "oem : OCR エンジンモード (既定 3=DEFAULT)",
      "psm : ページセグメンテーションモード (既定 3=AUTO)"],
     ["cv::text::OCRTesseract を生成します。",
      "tessdata フォルダに対応する traineddata ファイルが必要です。"]),

    ("cv4_ocr_run", "Tesseract OCR 実行", "hspcv4 OCR",
     "result_str_var, id, src_id, component_level",
     ["result_str_var : 認識結果文字列を書き戻す str 変数",
      "id : OCR ハンドル",
      "src_id : 入力画像",
      "component_level : 0=WORD, 1=TEXTLINE (既定 0)"],
     ["Tesseract で入力画像の文字認識を実行し、結果文字列を返します。"]),

    ("cv4_ocr_free", "Tesseract OCR 破棄", "hspcv4 OCR",
     "id",
     ["id : OCR ハンドル"],
     ["OCR ハンドルを破棄します。"]),

    # ==================== highgui Trackbar / mouse ====================
    ("cv4_create_trackbar", "トラックバー生成", "hspcv4 ウィンドウ",
     "winname, trackbar, initial, max",
     ["winname : 対象ウィンドウ名",
      "trackbar : トラックバー名",
      "initial : 初期値",
      "max : 最大値"],
     ["cv::createTrackbar のラッパー。HSP からはコールバック登録が",
      "できないため、コールバック無しで生成します。値の取得は",
      "cv4_get_trackbar_pos を使います。"]),

    ("cv4_get_trackbar_pos", "トラックバー位置取得", "hspcv4 ウィンドウ",
     "var_pos, winname, trackbar",
     ["var_pos : 現在位置を書き戻す int 変数",
      "winname : ウィンドウ名",
      "trackbar : トラックバー名"],
     ["cv::getTrackbarPos のラッパー。トラックバーの現在位置を取得します。"]),

    ("cv4_set_mouse_listener", "マウスイベント監視登録", "hspcv4 ウィンドウ",
     "winname",
     ["winname : 対象ウィンドウ名"],
     ["内部マウスコールバックを登録します。以後 cv4_get_mouse_event で",
      "最新イベントをポーリング取得できます。"]),

    ("cv4_get_mouse_event", "マウスイベント取得", "hspcv4 ウィンドウ",
     "var_event, var_x, var_y, var_flags, winname",
     ["var_event : イベント種別 (EVENT_MOUSEMOVE/LBUTTONDOWN 等)",
      "var_x, var_y : マウス座標",
      "var_flags : 修飾キー/ボタン状態フラグ",
      "winname : 対象ウィンドウ名"],
     ["cv4_set_mouse_listener で蓄積された最新マウスイベントを読み出します。",
      "var を先に並べることで OLDDLL パラメータ消費順を安定させます。"]),
]


def build_entry(name, title, group, prm_line, prm_desc, inst_lines):
    lines = []
    lines.append("%index")
    lines.append(name)
    lines.append(title)
    lines.append("%group")
    lines.append(group)
    lines.append("%prm")
    lines.append(prm_line)
    lines.extend(prm_desc)
    lines.append("%inst")
    lines.extend(inst_lines)
    return "\n".join(lines)


def main():
    with open(HS_PATH, "rb") as f:
        existing = f.read()
    existing_text = existing.decode("cp932")

    # Find commands already documented via "%index\n<name>\n"
    already = set()
    for m in re.finditer(r"%index\s*\n([A-Za-z0-9_]+)\s*\n", existing_text):
        already.add(m.group(1))

    to_append = [e for e in ENTRIES if e[0] not in already]
    skipped = [e[0] for e in ENTRIES if e[0] in already]

    if not to_append:
        print("nothing to append. skipped=", len(skipped))
        return

    # Build appended text. Ensure file ends with a single \n and then
    # add two blank lines before the first new entry so separator becomes
    # (prev \n) + \n\n = 3 newlines between entries, matching existing pattern
    # (existing pattern is entry + "\n\n\n\n" = LF after last line, then 3 blank LFs).
    # Let's inspect: existing shows "\n\n\n\n" between entries => each entry followed by
    # a terminating \n, then 3 blank lines => "entry\n\n\n\n".
    # We'll match that: join entries with "\n\n\n\n" and end file with "\n".
    parts = []
    for e in to_append:
        parts.append(build_entry(*e))
    appended_text = "\n\n\n\n".join(parts) + "\n"

    # File currently ends with "\n" (last entry's final line + \n).
    # We need a separator of 3 blank lines before the first new entry:
    # existing "...\n" + "\n\n\n" + first_entry + "\n" + "\n\n\n\n" between + last "\n"
    new_bytes = existing + ("\n\n\n" + appended_text).encode("cp932")

    with open(HS_PATH, "wb") as f:
        f.write(new_bytes)

    print("appended entries:", len(to_append))
    print("skipped (already present):", len(skipped))
    if skipped:
        for n in skipped:
            print("  skip:", n)

    # report new line count
    with open(HS_PATH, "rb") as f:
        data = f.read()
    print("new line count:", data.count(b"\n"))


if __name__ == "__main__":
    main()
