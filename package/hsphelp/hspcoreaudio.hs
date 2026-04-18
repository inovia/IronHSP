;
; hspcoreaudio.dll  HSP3 ヘルプ (日本語)
; Windows CoreAudio 制御プラグイン
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
hspcoreaudio.dll (hspcoreaudio_64.dll)

%url
https://github.com/inovia/IronHSP
%port
Win32 / Win64

%note
hspcoreaudio.dll は Windows の CoreAudio API (MMDevice / IAudioEndpointVolume /
IAudioSessionManager2 / IAudioMeterInformation) を HSP から呼び出すための
軽量プラグインです。外部 SDK 不要で、Windows SDK 標準ヘッダのみで動作します。

機能:
  - システム再生 (デフォルト render デバイス) の音量 get/set / mute / peak
  - アプリ単位の音量 get/set / mute / peak (IAudioSessionManager2)
  - 再生 / 録音デバイス列挙

使い方:
  #include "hspcoreaudio.as"
  coreaudio_init
  ddim vol, 1
  coreaudio_system_get_volume vol
  mes "current volume = " + vol(0)
  coreaudio_shutdown

呼び出し規約:
  出力パラメータ (var) は必ず事前に ddim / dim / sdim で確保してください。
  特に double 系 (volume / peak) は ddim var, 1 とすること。

%group
hspcoreaudio (CoreAudio)

%index
coreaudio_init
CoreAudio を初期化
%prm
%inst
COM の初期化 + IMMDeviceEnumerator の生成。全 API の前提。
終了時には coreaudio_shutdown を呼ぶこと。



%index
coreaudio_shutdown
CoreAudio を終了
%prm



%index
coreaudio_system_get_volume
システム音量を取得
%prm
var out
%inst
デフォルト再生デバイスのマスター音量を 0.0〜1.0 で double 変数に格納。
out は ddim で事前確保すること。



%index
coreaudio_system_set_volume
システム音量を設定
%prm
double vol
%inst
vol は 0.0〜1.0。範囲外は自動クランプ。



%index
coreaudio_system_get_mute
%prm
var out



%index
coreaudio_system_set_mute
%prm
int mute (0 / 1)



%index
coreaudio_system_get_peak
現在の音声ピーク値 (0.0〜1.0) を取得
%prm
var out



%index
coreaudio_session_count
アプリセッション数を取得 (内部で全セッションをキャッシュ)
%prm
var out_count
%inst
呼び出しのたびにセッション一覧を再取得 + キャッシュします。
以降の session_name / session_get_volume 等はこのキャッシュに対する
インデックス (0..out_count-1) でアクセスします。



%index
coreaudio_session_name
セッションに対応する exe ファイル名 (cp932)
%prm
idx, var out_buf, buf_size



%index
coreaudio_session_pid
セッションの PID
%prm
idx, var out_pid



%index
coreaudio_session_get_volume
セッションの音量 (0.0〜1.0)
%prm
idx, var out_vol



%index
coreaudio_session_set_volume
セッションの音量を設定
%prm
idx, double vol



%index
coreaudio_session_get_mute / set_mute
%prm
idx, var/int



%index
coreaudio_session_get_peak
セッションの現在のピーク値
%prm
idx, var out_peak



%index
coreaudio_device_count
デバイス数を取得
%prm
int direction, var out
direction: 0 = CA_RENDER (再生) / 1 = CA_CAPTURE (録音)



%index
coreaudio_device_name
デバイス名 (cp932)
%prm
idx, direction, var out_buf, buf_size



%index
coreaudio_device_get_default
デフォルトデバイス名 (cp932)
%prm
direction, var out_buf, buf_size
