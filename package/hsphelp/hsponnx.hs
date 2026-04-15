;
; hsponnx.dll  HSP3 ヘルプ (日本語)
; ONNX Runtime プラグイン
;

%type
拡張命令
%ver
1.0
%date
2026-04-15
%author
IronHSP / hsponnx
%dll
hsponnx.dll
%url
https://github.com/HNWorks/IronHSP_2026
%port
Win32 / Win64

%note
hsponnx.dll は Microsoft 公式の ONNX Runtime (onnxruntime.dll) を
動的リンクして、HSP から .onnx モデルをロード / 推論できるように
する薄いラッパプラグインです。

DirectML execution provider に対応しており、onnx_set_backend_dml で
DirectX 12 互換 GPU (NVIDIA / AMD / Intel / Qualcomm) での
ハードウェア推論が可能です。

v1 の onnx_run は「1 input / 1 output, float32 tensor」という
単純なケース専用です。ResNet / MobileNet / YOLOv5 の画像分類・検出
モデルの多くはこのシグネチャで動きます。

実際に推論するには以下が必要です:
  - hsponnx.dll / hsponnx_64.dll
  - onnxruntime.dll
  - DirectML.dll  (DML backend を使う場合のみ)

いずれも plugins/win32/hsponnx/third_party/onnxruntime/README.md
の手順で NuGet or 公式 zip から入手して HSP ランタイムと同じ
ディレクトリに配置してください。

糖衣として package/win32/common/iron_onnx.hsp を include すると
iron_onnx_open / iron_onnx_input_info 等がまとめて使えます。

%index
onnx_init
ONNX Runtime の初期化
%group
hsponnx — 初期化 / 終了
%prm

%inst
プラグイン内部で OrtApi を取得し、OrtEnv を作成します。通常は
最初の onnx_load_model 呼び出し時に自動的に実行されるため、
明示的に呼ぶ必要はありません。

onnxruntime.dll が見つからない環境では何もせず返ります。

%index
onnx_shutdown
ONNX Runtime の終了
%group
hsponnx — 初期化 / 終了
%prm

%inst
開いている全セッションを解放して OrtEnv を破棄します。
DLL アンロード時にも自動的に呼ばれます。

%index
onnx_load_model
ONNX モデルをロード
%group
hsponnx — セッション
%prm
"path", var_h
"path" : .onnx ファイルパス
var_h : セッションハンドル (>=0) または負のエラーコードを受け取る変数

%inst
指定パスの .onnx モデルを ONNX Runtime にロードして
セッションを作成します。成功するとハンドル (0〜15) が返ります。

エラーコード:
  -1  : ハンドル満杯 (16 超)
  -2  : SessionOptions 作成失敗
  -3  : Session 作成失敗 (モデル不正 / メモリ不足 / パス不正)
 -100 : onnxruntime が未リンク (スタブビルド)

%index
onnx_close
ONNX セッションを閉じる
%group
hsponnx — セッション
%prm
h
h : onnx_load_model で得たハンドル

%inst
指定したセッションを解放し、内部リソースを開放します。

%index
onnx_input_count
入力テンソルの数を取得
%group
hsponnx — メタ情報
%prm
h, var_int

%inst
セッション h の入力テンソル数を var_int に格納します。

%index
onnx_input_name
入力テンソル名を取得
%group
hsponnx — メタ情報
%prm
h, idx, var_str

%inst
idx 番目の入力テンソル名を var_str に格納します (例 "input" / "images")。

%index
onnx_input_shape
入力テンソル形状を取得
%group
hsponnx — メタ情報
%prm
h, idx, var_shape, var_rank

%inst
idx 番目の入力テンソルの各次元長を var_shape (int 配列) に、
rank (次元数) を var_rank に格納します。

動的次元 (-1) は負値のまま格納されるため、HSP 側で batch 次元などを
埋めてから onnx_run に渡してください。

%index
onnx_output_count
出力テンソルの数を取得
%group
hsponnx — メタ情報
%prm
h, var_int

%index
onnx_output_name
出力テンソル名を取得
%group
hsponnx — メタ情報
%prm
h, idx, var_str

%index
onnx_output_shape
出力テンソル形状を取得
%group
hsponnx — メタ情報
%prm
h, idx, var_shape, var_rank

%index
onnx_set_backend_dml
DirectML (GPU) バックエンドに切り替え
%group
hsponnx — バックエンド
%prm
h

%inst
DirectML execution provider を有効化し、セッションを再生成します。
DirectX 12 対応 GPU (Win10 以降) で動作します。
DirectML.dll が存在しない環境では無視されます。

%index
onnx_set_backend_cpu
CPU バックエンドに切り替え
%group
hsponnx — バックエンド
%prm
h

%index
onnx_run
推論を実行 (1 input / 1 output, float32)
%group
hsponnx — 推論
%prm
h, var_in_buf, var_in_shape, in_rank, var_out_buf, var_out_shape, var_out_rank

%inst
入力テンソル (float32 の連続メモリ) と shape を渡して推論を実行し、
出力テンソルを var_out_buf / var_out_shape に書き戻します。
var_out_buf は呼び出し前に十分な size を sdim で確保しておくこと。

複数入出力モデルは v1 では非対応です。

%href
onnx_load_model
iron_onnx_open
