;
; hsptflite.dll  HSP3 ヘルプ (日本語)
; Tensorflow Lite C API プラグイン
;

%type
拡張命令
%ver
1.0
%date
2026-04-15
%author
IronHSP / hsptflite
%dll
hsptflite.dll
%url
https://github.com/HNWorks/IronHSP_2026
%port
Win32 / Win64

%note
hsptflite.dll は Google 公式の Tensorflow Lite C API
(tensorflowlite_c.dll) を動的リンクして、HSP から .tflite モデルを
ロード / 推論できるようにする薄いラッパプラグインです。

MediaPipe の .tflite モデル (palm detection / hand landmarker /
pose / face など) を HSP から直接動かすための基盤として設計
されています。高レベル API は iron_mediapipe.hsp を参照。

v1 の API は「Interpreter 16 並列」「任意 dtype のバイナリ直 I/O」
という最小構成です。前処理 (resize / normalize) と後処理
(anchor decode / NMS) はアプリ側または iron_mediapipe.hsp 側で
実装します。

%index
tflite_init
TFLite ライブラリ初期化

%prm

%inst
hsptflite プラグインを初期化します。DllMain でも自動初期化される
ため通常は呼ばなくても動きますが、明示的に呼んでおくと安全です。

%href
tflite_shutdown

%index
tflite_shutdown
TFLite ライブラリ終了処理

%prm

%inst
全ての Interpreter スロットを解放します。

%index
tflite_load
.tflite モデルをロード

%prm
path, var_hid
path : モデルファイルのパス (string)
var_hid : ハンドルを受け取る変数 (int)

%inst
指定された .tflite ファイルを読み込み、Interpreter を作成します。
成功時は var_hid に 0〜15 のハンドルが入ります。失敗時は負の値:
  -1  : スロット不足
  -2  : Model 作成失敗
  -3  : Options 作成失敗
  -4  : Interpreter 作成失敗
  -5  : Tensor 割り当て失敗
  -100: スタブビルド (SDK 未配置)

%href
tflite_close

%index
tflite_close
モデルを閉じる

%prm
hid
hid : tflite_load で得たハンドル

%inst
指定ハンドルの Interpreter / Options / Model を解放します。

%index
tflite_num_threads
推論スレッド数の設定

%prm
hid, n
hid : ハンドル
n   : スレッド数 (1 以上)

%inst
Interpreter の並列度を変更します。Interpreter が再作成されます。

%index
tflite_input_count
入力テンソル数の取得

%prm
hid, var_n

%inst
入力テンソル数を var_n に格納します。失敗時は -1。

%index
tflite_output_count
出力テンソル数の取得

%prm
hid, var_n

%inst
出力テンソル数を var_n に格納します。

%index
tflite_input_shape
入力テンソルの形状取得

%prm
hid, idx, var_shape_arr, var_rank
var_shape_arr : int 配列 (最大 rank 8)
var_rank      : 実際の次元数

%inst
指定した入力テンソルの shape を int 配列に、rank を var_rank に
格納します。

%index
tflite_output_shape
出力テンソルの形状取得

%prm
hid, idx, var_shape_arr, var_rank

%inst
指定した出力テンソルの shape を取得します。

%index
tflite_input_type
入力テンソルの dtype 取得

%prm
hid, idx, var_type

%inst
dtype を正規化した整数で返します:
  0 = float32
  1 = uint8
  2 = int32
  3 = int64
  4 = float16
  5 = int8
  6 = bool
  7 = string
 99 = unknown

%index
tflite_output_type
出力テンソルの dtype 取得

%prm
hid, idx, var_type

%inst
出力の dtype を取得します。正規化値は tflite_input_type を参照。

%index
tflite_input_resize
入力テンソルサイズの動的変更

%prm
hid, idx, var_shape_arr, rank

%inst
入力テンソルの shape を動的に変更します。Interpreter の
AllocateTensors が再実行されます。MediaPipe palm_detector の
ように入力サイズが固定のモデルでは呼ぶ必要はありません。

%index
tflite_set_input
入力テンソルへバイナリをセット

%prm
hid, idx, var_buf, byte_len

%inst
バイナリバッファ (任意の HSP 変数) の先頭から byte_len バイトを
入力テンソルにコピーします。テンソルサイズより大きい場合は
切り詰められます。

%index
tflite_get_output
出力テンソルからバイナリを取得

%prm
hid, idx, var_buf, byte_len

%inst
出力テンソルの内容を var_buf に byte_len バイトまでコピーします。

%index
tflite_invoke
推論実行

%prm
hid

%inst
Interpreter を同期実行し、出力テンソルを更新します。
実行後に tflite_get_output で結果を取得してください。

%index
mp_palm_detect
MediaPipe 手のひら検出 (palm detector)

%prm
hid, var_rgb, w, h, score_thresh_x1000, var_out_boxes, var_out_count
hid                : hand_detector.tflite をロード済みのハンドル
var_rgb            : 入力 RGB バッファ (w*h*3 バイト)
w, h               : 入力画像サイズ
score_thresh_x1000 : 検出閾値 * 1000 (例 500 なら 0.5)
var_out_boxes      : int 配列 (16*5 要素以上)
                     [x1, y1, x2, y2, score*1000] * 検出数
var_out_count      : 検出数を受け取る int

%inst
MediaPipe palm_detector を 1 コールで実行します。内部で
letterbox resize (192x192, [-1..1] 正規化) → Invoke →
anchor decode (2016 anchors) → sigmoid → NMS (IoU > 0.3) を
C++ 側で処理し、検出した手のひら bbox を元画像座標で返します。
bbox は最大 16 個まで、score 降順で格納されます。

%index
mp_hand_landmark
MediaPipe 21 点 Hand Landmark 検出

%prm
hid, var_rgb, w, h, x1, y1, x2, y2, var_out_xy, var_out_conf_x1000
hid              : hand_landmarks_detector.tflite のハンドル
var_rgb          : 入力 RGB バッファ (w*h*3)
w, h             : 入力画像サイズ
x1,y1,x2,y2      : palm bbox (入力画像座標系)
var_out_xy       : int 配列 (21*2 = 42 要素)
var_out_conf_x1000 : presence confidence * 1000

%inst
palm bbox を 1.5 倍程度に拡張 + 正方形化して切り出し、
224x224 にリサイズ ([0..1] 正規化) → Invoke → 21 点 landmark を
元画像座標系に逆変換して返します。

%index
mp_bgr_to_rgb
BGR → RGB 変換ヘルパ

%prm
var_bgr, w, h, var_rgb
var_bgr : 入力 24bit BGR (w*h*3、例えば bmscr の DIB)
w, h    : 画像サイズ
var_rgb : 出力 RGB (事前に w*h*3 バイト確保)

%inst
24bit BGR を 24bit RGB にチャンネル入れ替えします。
hsp の bmscr (BGR) を MediaPipe 系 API に渡す前処理で使います。

%index
mp_letterbox_resize
letterbox 方式のリサイズヘルパ

%prm
var_src, sw, sh, src_ch, var_dst, dw, dh, var_params
var_src    : 入力 8bit (sw*sh*src_ch)
sw, sh     : 入力サイズ
src_ch     : 1 or 3
var_dst    : 出力 8bit RGB (dw*dh*3)
dw, dh     : 出力サイズ
var_params : 逆変換用パラメータ int*4
             [scale*10000, scale*10000, offset_x, offset_y]

%inst
長辺に合わせて縮小 + 余白を 0 で pad する MediaPipe 標準の
letterbox リサイズをバイリニア補間で実行します。後段で bbox を
元画像座標に戻すための変換情報を var_params に書き込みます。
