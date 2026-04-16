;
; iron_wasapi.hsp  HSP3 ヘルプ (日本語)
; hspwasapi.dll ベース WASAPI オーディオ キャプチャ / 再生 ラッパ
;

%type
拡張命令
%ver
1.0
%date
2026-04-18
%author
IronHSP / iron_wasapi
%dll
iron_wasapi.hsp

%url
https://github.com/inovia/IronHSP
%port
Win32 / Win64

%note
iron_wasapi.hsp は hspwasapi.dll を経由して Windows WASAPI で
マイク録音 (キャプチャ) やスピーカー出力 (レンダー) を行う HSP ラッパです。
ハンドルベース設計で最大 16 デバイスを同時に扱えます。

機能:
  - キャプチャ (録音) とレンダー (再生) の両方をサポート
  - イベント駆動キャプチャ (ワーカースレッド)
  - WAV ファイル出力 (ヘッダ自動確定)
  - PCM リングバッファによるリアルタイム波形取得
  - デバイス列挙
  - UTF-8 ファイル名対応

  #include "iron_wasapi.hsp"

%group
iron_wasapi (WASAPI オーディオ)

%index
wasapi_init
WASAPI 初期化
%group
iron_wasapi - 初期化 / 終了
%prm

%inst
WASAPI サブシステムを初期化します。
他の wasapi 命令を使う前に必ず呼んでください。
stat に 0 が返れば成功です。

%sample
#include "iron_wasapi.hsp"

wasapi_init
if stat < 0 : dialog "WASAPI 初期化失敗" : end

%index
wasapi_device_list
デバイス一覧を取得
%group
iron_wasapi - デバイス列挙
%prm
direction, var_names
direction : 0=キャプチャ (録音), 1=レンダー (再生)
var_names : デバイス名を改行区切りで格納する文字列変数

%inst
指定方向のオーディオデバイスを列挙し、名前を改行 (
) 区切りで
var_names に格納します。stat にデバイス数が返ります。

%sample
sdim names
wasapi_device_list 0, names
mes "キャプチャデバイス数: " + stat
mes names

%index
wasapi_capture_open
キャプチャデバイスを開く
%group
iron_wasapi - デバイス操作
%prm
device_idx, ch, hz, bps
device_idx : デバイスインデックス (-1 でデフォルト)
ch         : チャンネル数 (1 or 2, 省略時 2)
hz         : サンプリングレート (省略時 44100)
bps        : ビット深度 (省略時 16)

%inst
キャプチャ (録音) 用にデバイスを開きます。
stat にハンドル (0 以上) が返ります。負の値は失敗です。
デバイスがサポートしないフォーマットの場合、
デバイスの MixFormat にフォールバックします。

%sample
wasapi_capture_open -1, 2, 44100, 16
h = stat
if h < 0 : dialog "デバイスオープン失敗" : end

%index
wasapi_render_open
レンダーデバイスを開く
%group
iron_wasapi - デバイス操作
%prm
device_idx, ch, hz, bps
device_idx : デバイスインデックス (-1 でデフォルト)
ch         : チャンネル数 (1 or 2, 省略時 2)
hz         : サンプリングレート (省略時 44100)
bps        : ビット深度 (省略時 16)

%inst
レンダー (再生) 用にデバイスを開きます。
stat にハンドル (0 以上) が返ります。負の値は失敗です。

%index
wasapi_rec_start
録音開始 (WAV ファイル書き出し)
%group
iron_wasapi - 録音
%prm
handle, "filename"
handle   : wasapi_capture_open で取得したハンドル
filename : 出力 WAV ファイルパス (UTF-8)

%inst
指定ハンドルで録音を開始し、PCM データを WAV ファイルに書き出します。
ワーカースレッドがバックグラウンドで動作するため、
HSP メインループをブロックしません。
stat = 0 で成功です。

%sample
wasapi_rec_start h, "record.wav"
if stat < 0 : dialog "録音開始失敗"

%index
wasapi_rec_stop
録音停止
%group
iron_wasapi - 録音
%prm
handle
handle : ハンドル

%inst
録音を停止します。WAV ヘッダのサイズフィールドが
正しい値に書き換えられ、ファイルが閉じられます。
stat = 0 で成功です。

%index
wasapi_get_pcm
リングバッファから PCM データ取得
%group
iron_wasapi - リアルタイム取得
%prm
handle, var_buf, max_samples
handle      : ハンドル
var_buf     : short 配列 (dimtype 等で確保)
max_samples : 最大取得サンプル数

%inst
ワーカースレッドが蓄積した PCM データ (16bit) をリングバッファから
読み出します。stat に実際に書き込まれたサンプル数が返ります。
波形表示やレベルメーター表示に使えます。

%index
wasapi_get_level
ピークレベル取得 (defcfunc)
%group
iron_wasapi - リアルタイム取得
%prm
(handle)
handle : ハンドル

%inst
前回呼び出しからのピークレベル (0～32767) を返します。
関数形式 (defcfunc) です。

%sample
lv = wasapi_get_level(h)
mes "Peak: " + lv

%index
wasapi_close
デバイスを閉じる
%group
iron_wasapi - デバイス操作
%prm
handle
handle : ハンドル

%inst
指定ハンドルのデバイスを閉じてリソースを解放します。
録音中の場合は自動的に停止されます。

%index
wasapi_shutdown
全デバイスを閉じて終了処理
%group
iron_wasapi - 初期化 / 終了
%prm

%inst
全デバイスを閉じ、COM を解放します。
プログラム終了時に呼んでください。
