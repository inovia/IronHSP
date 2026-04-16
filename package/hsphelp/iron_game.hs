%dll
; iron_game Game utilities
%ver
3.8
%date
2026/04/17
%author
IronHSP
%note
Pure HSP
%type
User command
%group
Game

%index
hit_rect
AABB collision
%prm
(x1,y1,w1,h1,x2,y2,w2,h2)
%inst
1=hit
%href
hit_circle

%index
hit_circle
Circle collision
%prm
(cx1,cy1,r1,cx2,cy2,r2)
%inst

%href
vec2_len

%index
vec2_len
Vector length
%prm
(x,y)
%inst

%href
ease_in_quad

%index
ease_in_quad
Easing (10 types)
%prm
(t)
%inst
0..1
%href
rnd_range

%index
rnd_range
Range random
%prm
(min,max)
%inst

%href
fps_start

%index
fps_start
FPS counter
%prm

%inst

%href
tilemap_init

%index
tilemap_init
Tilemap init
%prm
w,h,tw,th
%inst
