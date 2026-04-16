;
; iron_image_net.hsp  HSP3 ヘルプ (日本語)
; 画像処理 (.NET版)
;

%type
拡張命令
%ver
3.8
%date
2026/04/18
%author
IronHSP
%dll
iron_image_net.hsp

%url
https://github.com/inovia/IronHSP
%port
Win32 / Win64

%note
hsp3net 専用

%group
グラフィックス

%index
imgn_load
画像読み込み
%group
グラフィックス
%prm
"path"

%inst
stat にハンドル。PNG/JPEG/BMP/GIF 対応。

%href
imgn_save

%index
imgn_save
画像保存
%group
グラフィックス
%prm
handle, "path"

%inst
拡張子からフォーマット自動判定。

%href
imgn_resize

%index
imgn_resize
リサイズ
%group
グラフィックス
%prm
handle, w, h

%inst
Bicubic 補間。

%href
imgn_crop

%index
imgn_crop
クロップ
%group
グラフィックス
%prm
handle, x, y, w, h

%inst
矩形切り出し。

%href
imgn_rotate

%index
imgn_rotate
回転
%group
グラフィックス
%prm
handle, degrees

%inst
指定角度で回転。

%href
imgn_grayscale

%index
imgn_grayscale
グレースケール変換
%group
グラフィックス
%prm
handle

%inst


%href
imgn_screenshot

%index
imgn_screenshot
スクリーンショット
%group
グラフィックス
%prm
var_handle

%inst
画面全体キャプチャ。

%href
imgn_close

%index
imgn_close
画像を閉じる
%group
グラフィックス
%prm
handle

%inst
リソース解放。
