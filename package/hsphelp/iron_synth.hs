;
; iron_synth.hsp  HSP3 ヘルプ (日本語)
; オーディオ合成
;

%type
拡張命令
%ver
3.8
%date
2026/04/17
%author
IronHSP
%dll
iron_synth.hsp

%url
https://github.com/inovia/IronHSP
%port
Win32 / Win64

%note
Pure HSP

%group
マルチメディア

%index
synth_sine
正弦波を生成
%group
マルチメディア
%prm
"out.wav", freq, dur, rate

%inst
指定周波数の正弦波 WAV ファイルを生成します。

%href
synth_square

%index
synth_square
矩形波を生成
%group
マルチメディア
%prm
"out.wav", freq, dur, rate

%inst
指定周波数の矩形波 WAV ファイルを生成します。

%href
synth_noise

%index
synth_noise
ノイズを生成
%group
マルチメディア
%prm
"out.wav", dur, rate

%inst
ホワイトノイズの WAV ファイルを生成します。
