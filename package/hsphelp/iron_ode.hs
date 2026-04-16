;
; iron_ode.hsp  HSP3 ヘルプ (日本語)
; 常微分方程式ソルバー
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
iron_ode.hsp

%url
https://github.com/inovia/IronHSP
%port
Win32 / Win64

%note
Pure HSP

%group
数学

%index
ode_solve_decay
dy/dt=-y を解く
%group
数学
%prm
t_out, y_out, steps, t0, y0, dt

%inst
4次ルンゲ・クッタ法 (RK4) で減衰方程式を解きます。
