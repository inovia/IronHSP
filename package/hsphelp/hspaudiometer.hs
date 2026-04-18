;
; hspaudiometer.dll  HSP3 ヘルプ (日本語)
; WASAPI ループバック サウンドメーター
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
hspaudiometer.dll (hspaudiometer_64.dll)

%url
https://github.com/inovia/IronHSP
%port
Win32 / Win64

%note
Windows のデフォルト再生デバイスの音声をループバックキャプチャし、
RMS / ピーク / dBFS / 8 バンド周波数分析を HSP から取得するプラグインです。
サウンドメーター、スペクトラムアナライザ UI、音圧監視などに使えます。

  #include "hspaudiometer.as"
  sm_open
  repeat
    await 30
    sm_poll
    ddim rms, 1 : sm_get_rms rms
    ...
  loop
  sm_close

内部で 1024 サンプルの Hann 窓 FFT + Cooley-Tukey radix-2 で周波数分析します。

%group
hspaudiometer (サウンドメーター)

%index
sm_open
WASAPI ループバック開始
%prm
%inst
デフォルト再生デバイスを WASAPI LOOPBACK で開きます。成功時 stat = 0。



%index
sm_close
WASAPI ループバック停止
%prm



%index
sm_poll
現在バッファされている PCM サンプルを取り込む
%prm
%inst
毎フレーム (例: 30 Hz 等) 呼び出してください。内部リングバッファ (1024
サンプル) を最新データで更新します。



%index
sm_get_rms
直近 ~256 サンプルの RMS (0.0〜1.0)
%prm
var out



%index
sm_get_peak
直近 ~256 サンプルのピーク絶対値 (0.0〜1.0)
%prm
var out



%index
sm_get_dbfs
RMS の dBFS (-inf〜0)
%prm
var out



%index
sm_get_band
8 バンド周波数分析
%prm
int band_idx, var out_mag
band_idx (0〜7): SM_BAND_SUB_LOW / _LOW / _MID_LOW / _MID / _MID_HIGH /
                 _HIGH / _SUPER / _ULTRA
%inst
1024 サンプル Hann 窓 FFT の結果から、指定帯域 (250Hz / 500Hz / 1k / 2k
/ 4k / 8k / 16k / 24k の境界) の平均振幅を返します。



%index
sm_get_sample_rate
デバイスのサンプリングレート取得
%prm
var out_int
