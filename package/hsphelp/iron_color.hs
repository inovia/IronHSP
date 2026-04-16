;
; iron_color.hsp  HSP3 ヘルプ (日本語)
; 色変換
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
iron_color.hsp

%url
https://github.com/inovia/IronHSP
%port
Win32 / Win64

%note
Pure HSP

%group
色

%index
color_rgb2hex
RGB を HEX に変換
%group
色
%prm
(r, g, b)

%inst
"#FF0000" 形式の文字列を返します。

%href
color_hex2rgb

%index
color_hex2rgb
HEX を RGB に変換
%group
色
%prm
"#FF0000", r, g, b

%inst
r, g, b に各成分が格納されます。

%href
color_rgb2hsv

%index
color_rgb2hsv
RGB を HSV に変換
%group
色
%prm
r,g,b, h,s,v

%inst
h (0-360), s (0-100), v (0-100) が格納されます。

%href
color_name

%index
color_name
色名から RGB を取得
%group
色
%prm
("red")

%inst
色名に対応する RGB 値を返します。
