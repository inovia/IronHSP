;
; iron_optimize.hsp  HSP3 ヘルプ (日本語)
; 最適化
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
iron_optimize.hsp

%url
https://github.com/inovia/IronHSP
%port
Win32 / Win64

%note
Pure HSP

%group
数学

%index
optimize_golden
黄金分割法で最小値探索
%group
数学
%prm
(a, b, max_iter)

%inst
区間 [a, b] で f(x) の最小値を黄金分割法で探索します。
