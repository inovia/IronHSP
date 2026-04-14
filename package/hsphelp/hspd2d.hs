%dll
hspd2d
%ver
0.4
%date
2026/04/14
%author
IronHSP project
%url
https://github.com/inovia/IronHSP
%note
hspd2d.hsp をインクルードすること。hsp3net 専用 (NSTRUCT / intptr / COM 機能を使うため)。

%type
内蔵命令
%group
hspd2d - DirectWrite + Direct2D + WIC 描画モジュール
%port
Win10 22H2+

%index
d2d_init
hspd2d を初期化する
%prm

%inst
COM の初期化、DirectWrite ファクトリ、Direct2D ファクトリ、WIC ファクトリを生成する。
hspd2d の他の命令を呼ぶ前に必ず一度呼んでおく必要がある (d2d_image_create / d2d_image_load
は内部で自動的に呼ぶので、明示的に呼ばなくてもよい)。

%href
d2d_shutdown
d2d_image_create
d2d_image_load


%index
d2d_shutdown
hspd2d を解放する
%prm

%inst
DirectWrite / Direct2D / WIC の各ファクトリ、現在のフォント、その他リソースを解放する。
プログラム終了時に呼ぶこと。

%href
d2d_init


%index
d2d_image_create
オフスクリーン画像 (空) を作成する
%prm
id, w, h
id    : 画像 ID (0 ～ 255)
w     : 幅 (ピクセル)
h     : 高さ (ピクセル)
%inst
指定 ID で 32bpp PBGRA の WIC ビットマップと Direct2D RenderTarget を生成する。
作成後はこの ID がカレント描画対象になる。既存の ID を指定すると古いほうは自動で破棄される。

%href
d2d_image_load
d2d_image_select
d2d_image_delete


%index
d2d_image_load
画像ファイルを読み込んで指定 ID に展開する
%prm
id, "filename"
id        : 画像 ID
filename  : 画像ファイル (PNG / BMP / JPEG / TIFF / GIF)
%inst
WIC のデコーダを使って画像を読み込み、PBGRA に変換、指定 ID にビットマップ + RenderTarget
として展開する。読み込み後はこの ID がカレント描画対象になり、d2d_drawimage のソースとしても
使える。

%href
d2d_image_create
d2d_image_save
d2d_drawimage


%index
d2d_image_select
カレント描画対象を切り替える
%prm
id
id : 切り替え先の画像 ID
%inst
ID で指定した画像をカレント描画対象にする。以降の d2d_clear / d2d_drawtext / d2d_drawline /
d2d_fillrect 等はこの画像に対して描画される。

%href
d2d_image_create
d2d_image_load


%index
d2d_image_delete
画像を破棄する
%prm
id
id : 破棄する画像 ID
%inst
ID で指定した画像の RenderTarget と WIC ビットマップを解放する。
カレント描画対象だった場合は cur_id が -1 にリセットされる。

%href
d2d_image_create


%index
d2d_image_save
カレント画像をファイルに保存する
%prm
id, "filename"
id        : 保存する画像 ID
filename  : 保存ファイル名 (拡張子から形式を自動判別)
%inst
拡張子に応じて以下の形式で保存する:
   .png         → PNG
   .bmp         → BMP
   .jpg / .jpeg → JPEG
   .tif / .tiff → TIFF
   .gif         → GIF
未対応拡張子は PNG として保存される。

内部的には WIC エンコーダを使って 32bpp BGRA で書き出す。

%href
d2d_image_load


%index
d2d_clear
カレント画像を単色で塗りつぶす
%prm
r, g, b, a
r, g, b : 0～255
a       : alpha 0～255
%inst
カレント描画対象を指定の RGBA 色で塗りつぶす。

%href
d2d_color


%index
d2d_color
以後の描画色を設定する
%prm
r, g, b, a
r, g, b : 0～255
a       : alpha 0～255
%inst
d2d_drawline / d2d_drawrect / d2d_fillrect / d2d_drawellipse / d2d_fillellipse /
d2d_drawtext などのカレント描画色を設定する。

%href
d2d_clear


%index
d2d_font
テキスト描画用フォントを設定する
%prm
"family", size, weight, italic
family : フォントファミリー名 (例 "Yu Gothic UI" / "Segoe UI Emoji")
size   : フォントサイズ (DIP)
weight : 太さ (100..900、400=Normal, 700=Bold)
italic : 0=通常 / 1=斜体
%inst
DirectWrite の IDWriteTextFormat を作成してカレントフォントとする。
複数回呼べる (前のフォントは自動的に release される)。
Segoe UI Emoji を指定すると COLR/CPAL/CBDT/sbix 系のカラー絵文字も自動で描画される。

%href
d2d_drawtext


%index
d2d_drawtext
テキストを描画する
%prm
"text", x, y, w, h
text  : 描画する文字列 (UTF-8/SJIS、内部で UTF-16 に変換)
x, y  : 描画位置 (左上)
w, h  : 描画矩形のサイズ (0 にすると残り全部)
%inst
カレントフォント / カレント色でテキストを描画する。
D2D1_DRAW_TEXT_OPTIONS_ENABLE_COLOR_FONT が有効なので、Segoe UI Emoji 等の色付き
絵文字フォントは自動でカラー描画される。

%href
d2d_font
d2d_color


%index
d2d_drawline
線を描画する
%prm
x0, y0, x1, y1, linew
x0, y0 : 始点
x1, y1 : 終点
linew  : 線幅 (DIP, 通常 1.0～)
%inst
カレント色で 2 点を結ぶ直線を描画する。

%href
d2d_drawrect


%index
d2d_drawrect
矩形 (枠線) を描画する
%prm
x, y, w, h, linew
x, y  : 左上
w, h  : サイズ
linew : 線幅
%inst
カレント色で枠線のみの矩形を描画する。

%href
d2d_fillrect


%index
d2d_fillrect
矩形を塗りつぶす
%prm
x, y, w, h
x, y : 左上
w, h : サイズ
%inst
カレント色で塗りつぶした矩形を描画する。

%href
d2d_drawrect


%index
d2d_drawellipse
楕円 (枠線) を描画する
%prm
cx, cy, rx, ry, linew
cx, cy : 中心
rx, ry : x/y 半径
linew  : 線幅
%inst
カレント色で枠線のみの楕円を描画する。rx==ry にすれば真円。

%href
d2d_fillellipse


%index
d2d_fillellipse
楕円を塗りつぶす
%prm
cx, cy, rx, ry
cx, cy : 中心
rx, ry : x/y 半径
%inst
カレント色で塗りつぶした楕円を描画する。

%href
d2d_drawellipse


%index
d2d_drawimage
別の画像をカレント画像に描画する
%prm
src_id, dst_x, dst_y, dst_w, dst_h
src_id : 描画元の画像 ID (d2d_image_load や d2d_image_create で作っておく)
dst_x  : 転写先の左上 X
dst_y  : 転写先の左上 Y
dst_w  : 転写先の幅 (0 で元サイズ)
dst_h  : 転写先の高さ (0 で元サイズ)
%inst
src_id の画像をカレント描画対象に転写する。dst_w/dst_h を 0 にすると元サイズで描画される。
拡大縮小は線形補間。

%href
d2d_image_load
d2d_image_create
