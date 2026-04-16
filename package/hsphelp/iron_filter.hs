;
; iron_filter.hsp  HSP3 ヘルプ (日本語)
; 信号フィルタ
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
iron_filter.hsp

%url
https://github.com/inovia/IronHSP
%port
Win32 / Win64

%note
Pure HSP

%group
数学

%index
filter_moving_avg
移動平均
%group
数学
%prm
data, n, window, out

%inst
ウィンドウサイズ window の移動平均を計算します。

%href
filter_lowpass

%index
filter_lowpass
ローパスフィルタ (EMA)
%group
数学
%prm
data, n, alpha, out

%inst
指数移動平均による 1 次ローパスフィルタです。

%href
filter_highpass

%index
filter_highpass
ハイパスフィルタ
%group
数学
%prm
data, n, alpha, out

%inst
信号から低周波成分を除去します。
