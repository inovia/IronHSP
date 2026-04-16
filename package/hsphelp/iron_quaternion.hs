;
; iron_quaternion.hsp  HSP3 ヘルプ (日本語)
; クォータニオン
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
iron_quaternion.hsp

%url
https://github.com/inovia/IronHSP
%port
Win32 / Win64

%note
Pure HSP

%group
数学

%index
quat_identity
単位クォータニオン
%group
数学
%prm
q

%inst
q を (1, 0, 0, 0) に設定します。

%href
quat_from_axis_angle

%index
quat_from_axis_angle
軸角度から生成
%group
数学
%prm
q, ax,ay,az, angle

%inst
回転軸 (ax,ay,az) と角度 (ラジアン) からクォータニオンを生成します。

%href
quat_mul

%index
quat_mul
クォータニオン乗算
%group
数学
%prm
a, b, c

%inst
c = a * b

%href
quat_normalize

%index
quat_normalize
正規化
%group
数学
%prm
q

%inst
クォータニオンを正規化します (インプレース)。

%href
quat_rotate

%index
quat_rotate
点を回転
%group
数学
%prm
q, px, py, pz

%inst
クォータニオン q で点 (px,py,pz) を回転します (インプレース)。
