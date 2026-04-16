;
; iron_montecarlo.hsp  HSP3 ヘルプ (日本語)
; モンテカルロ法
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
iron_montecarlo.hsp

%url
https://github.com/inovia/IronHSP
%port
Win32 / Win64

%note
Pure HSP

%group
数学

%index
mc_estimate_pi
円周率を推定
%group
数学
%prm
(samples)

%inst
モンテカルロ法で円周率を推定します。
samples を大きくするほど精度が上がります。

%href
mc_integrate_x2

%index
mc_integrate_x2
x? を積分
%group
数学
%prm
(a, b, samples)

%inst
区間 [a, b] で x? をモンテカルロ積分します。
