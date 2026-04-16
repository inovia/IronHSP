;
; iron_fft.hsp  HSP3 ヘルプ (日本語)
; 高速フーリエ変換 (FFT)
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
iron_fft.hsp

%url
https://github.com/inovia/IronHSP
%port
Win32 / Win64

%note
Pure HSP

%group
数学

%index
fft_compute
インプレース FFT
%group
数学
%prm
re, im, n

%inst
Cooley-Tukey アルゴリズムによるインプレース FFT です。
n は 2 のべき乗である必要があります。
