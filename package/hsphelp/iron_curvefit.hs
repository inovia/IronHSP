;
; iron_curvefit.hsp  HSP3 ヘルプ (日本語)
; カーブフィッティング
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
iron_curvefit.hsp

%url
https://github.com/inovia/IronHSP
%port
Win32 / Win64

%note
Pure HSP

%group
数学

%index
curvefit_linear
線形フィット y=ax+b
%group
数学
%prm
x, y, n, slope, intercept

%inst
最小二乗法で直線を当てはめます。
slope に傾き、intercept に切片が格納されます。

%href
curvefit_r2

%index
curvefit_r2
決定係数 R?
%group
数学
%prm
(x, y, n, slope, intercept)

%inst
フィットの決定係数を返します (0.0～1.0)。
