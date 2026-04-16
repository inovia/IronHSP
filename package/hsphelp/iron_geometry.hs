;
; iron_geometry.hsp  HSP3 ヘルプ (日本語)
; 2D/3D 幾何学
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
iron_geometry.hsp

%url
https://github.com/inovia/IronHSP
%port
Win32 / Win64

%note
Pure HSP

%group
数学

%index
tri_area
三角形の面積
%group
数学
%prm
(x1,y1, x2,y2, x3,y3)

%inst
3頂点の座標から三角形の面積を返します。

%href
point_line_dist

%index
point_line_dist
点と直線の距離
%group
数学
%prm
(px,py, x1,y1, x2,y2)

%inst
点 (px,py) から直線 (x1,y1)-(x2,y2) への距離を返します。

%href
circle_area

%index
circle_area
円の面積
%group
数学
%prm
(r)

%inst
半径 r の円の面積を返します。

%href
polygon_area

%index
polygon_area
多角形の面積
%group
数学
%prm
(x, y, n)

%inst
靴ひも公式 (Shoelace) で多角形の面積を計算します。

%href
sphere_volume

%index
sphere_volume
球の体積
%group
数学
%prm
(r)

%inst
半径 r の球の体積を返します。
