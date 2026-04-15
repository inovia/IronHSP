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



%index
d2d_gif_load
GIF アニメファイルを読み込んでデコーダハンドルを取得
%prm
"filename"
filename : 読み込む GIF ファイルパス
%inst
GIF アニメファイルを IWICBitmapDecoder で開き、内部で自作パーサを使って全フレームの
遅延時間 (Graphic Control Extension の Delay) とループ回数 (NETSCAPE 2.0 拡張ブロック)
を抽出する。成功すると stat に GIF ハンドル (0 以上) が返る。失敗時は -1。
取得したハンドルは d2d_gif_frame_count / d2d_gif_frame_delay / d2d_gif_frame_to_image /
d2d_gif_loop_count に渡して使う。使い終わったら d2d_gif_free で必ず解放すること。

%href
d2d_gif_frame_count
d2d_gif_frame_delay
d2d_gif_frame_to_image
d2d_gif_loop_count
d2d_gif_free


%index
d2d_gif_frame_count
GIF アニメのフレーム数を取得
%prm
handle
handle : d2d_gif_load が返した GIF ハンドル
%inst
GIF アニメに含まれるフレーム数を stat で返す。ハンドルが無効な場合は 0 が返る。

%href
d2d_gif_load
d2d_gif_frame_delay
d2d_gif_frame_to_image


%index
d2d_gif_frame_delay
GIF アニメの指定フレームの遅延時間を取得 (10ms 単位)
%prm
handle, frame_idx
handle    : d2d_gif_load が返した GIF ハンドル
frame_idx : フレーム番号 (0 始まり)
%inst
指定フレームの表示遅延時間を 10ms 単位で stat に返す (例: 10 なら 100ms)。
GIF の Graphic Control Extension Delay Time フィールドの値をそのまま返す。
フレーム番号が範囲外、もしくはハンドルが無効な場合は 0 を返す。

%href
d2d_gif_load
d2d_gif_frame_count


%index
d2d_gif_loop_count
GIF アニメのループ回数を取得
%prm
handle
handle : d2d_gif_load が返した GIF ハンドル
%inst
NETSCAPE 2.0 拡張ブロックに書かれたループ回数を stat で返す。
0 の場合は無限ループ (一般的な GIF アニメはこれ)。1 以上なら指定回数だけ再生する。
ループ情報がない GIF では 0 (無限) が返る。

%href
d2d_gif_load


%index
d2d_gif_frame_to_image
GIF アニメの指定フレームを d2d_image として取り出す
%prm
handle, frame_idx, dst_id
handle    : d2d_gif_load が返した GIF ハンドル
frame_idx : 取り出すフレーム番号 (0 始まり)
dst_id    : 画像を作る先の画像 ID (0～255)
%inst
指定フレームを WIC から取り出し、PBGRA 形式に変換して dst_id に d2d_image として
構築する。以後その画像 ID は通常の d2d_image と同様に d2d_drawimage の src_id として
使えるほか、d2d_image_save で PNG/JPEG 等に書き出すこともできる。
既存の dst_id が使用中だった場合は先に解放してから作り直す。

%sample
#include "hspd2d.hsp"
	d2d_init
	d2d_image_create 0, 640, 480
	d2d_gif_load "anim.gif"
	h = stat
	n = d2d_gif_frame_count(h)
	mes "frames = " + n
	repeat n
		d2d_gif_frame_to_image h, cnt, 1
		d2d_image_select 0
		d2d_clear 255, 255, 255
		d2d_drawimage 1, 0, 0, 0, 0
		d2d_image_save 0, "frame_" + cnt + ".png"
	loop
	d2d_gif_free h

%href
d2d_gif_load
d2d_drawimage
d2d_image_save


%index
d2d_gif_free
GIF デコーダハンドルを解放
%prm
handle
handle : d2d_gif_load が返した GIF ハンドル
%inst
d2d_gif_load で取得したハンドルを解放する。内部で保持していた WIC Decoder の
リファレンスも Release され、GIF のメモリが解放される。必ず呼び出すこと。

%href
d2d_gif_load


%index
d2d_gif_write_begin
GIF アニメ書き出しを開始 (スタブ、未実装)
%prm
"filename", w, h
filename : 出力 GIF ファイル
w        : 幅
h        : 高さ
%inst
マルチフレーム GIF の書き出しを開始する予定の命令。現状は WIC
IWICMetadataQueryWriter と PROPVARIANT を HSP 側で組み立てるのが非常に煩雑なため
スタブのままで、常に stat = -1 を返す。将来の版で実装予定。

%href
d2d_gif_write_frame
d2d_gif_write_end


%index
d2d_gif_write_frame
GIF アニメに 1 フレーム追加 (スタブ、未実装)
%prm
writer_handle, src_image_id, delay_ms
writer_handle : d2d_gif_write_begin が返したライタハンドル
src_image_id  : フレーム元の画像 ID
delay_ms      : 表示時間 (ミリ秒)
%inst
d2d_gif_write_begin で開いた GIF ライタに 1 フレーム追加する予定の命令。
現状は未実装で、常に stat = -1 を返す。

%href
d2d_gif_write_begin
d2d_gif_write_end


%index
d2d_gif_write_end
GIF アニメ書き出しを完了 (スタブ、未実装)
%prm
writer_handle
writer_handle : d2d_gif_write_begin が返したライタハンドル
%inst
d2d_gif_write_begin で開いた GIF ライタをファイナライズして閉じる予定の命令。
現状は未実装で、常に stat = -1 を返す。

%href
d2d_gif_write_begin
d2d_gif_write_frame


%index
d2d_svg_load
SVG ファイルを読み込んで指定サイズでラスタライズ
%prm
"filename", w, h
filename : SVG ファイルパス
w        : ラスタライズする幅 (ピクセル)
h        : ラスタライズする高さ (ピクセル)
%inst
ファイルから SVG テキストを読み込み、内部で d2d_svg_load_str に委譲して
ラスタライズする。成功すると新規 image ID を確保して stat に返す。失敗時は -1。
生成された画像は通常の d2d_image と同様に d2d_drawimage / d2d_image_save 等で
利用できる。

本命令は ID2D1DeviceContext5::CreateSvgDocument を使用するため、
Windows 10 Creators Update (1703) 以降が必要。

%sample
#include "hspd2d.hsp"
	d2d_init
	d2d_svg_load "icon.svg", 256, 256
	svg_id = stat
	d2d_image_create 0, 512, 512
	d2d_drawimage svg_id, 0, 0, 0, 0
	d2d_image_save 0, "icon.png"

%href
d2d_svg_load_str
d2d_drawimage


%index
d2d_svg_load_str
SVG 文字列を指定サイズでラスタライズ
%prm
"svg_text", w, h
svg_text : SVG XML 文字列 (<svg>...</svg>)
w        : ラスタライズする幅 (ピクセル)
h        : ラスタライズする高さ (ピクセル)
%inst
SVG 文字列を HGLOBAL → IStream にして ID2D1SvgDocument を構築し、
D3D-backed な ID2D1Bitmap1 にラスタライズ、CPU 読み戻し後 WIC bitmap に展開して
新規 d2d_image として登録する。成功すると新規 image ID を stat に返す。

本命令は ID2D1DeviceContext5::CreateSvgDocument を使用するため、
Windows 10 Creators Update (1703) 以降が必要。

%sample
#include "hspd2d.hsp"
	d2d_init
	sdim svg, 4096
	svg = "<svg xmlns='http://www.w3.org/2000/svg' width='100' height='100'>"
	svg += "<circle cx='50' cy='50' r='40' fill='red'/></svg>"
	d2d_svg_load_str svg, 100, 100
	id = stat
	d2d_image_create 0, 200, 200
	d2d_drawimage id, 0, 0, 0, 0
	d2d_image_save 0, "circle.png"

%href
d2d_svg_load
d2d_drawimage
