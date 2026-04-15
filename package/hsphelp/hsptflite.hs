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
