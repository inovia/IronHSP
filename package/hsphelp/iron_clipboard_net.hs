;
; iron_clipboard_net.hsp  HSP3 ヘルプ (日本語)
; クリップボード (.NET版)
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
iron_clipboard_net.hsp

%url
https://github.com/inovia/IronHSP
%port
Win32 / Win64

%note
hsp3net 専用

%group
システム

%index
clipn_set_text
テキスト設定
%group
システム
%prm
"text"

%inst


%href
clipn_get_text

%index
clipn_get_text
テキスト取得
%group
システム
%prm
var_text

%inst


%href
clipn_set_image

%index
clipn_set_image
画像設定
%group
システム
%prm
"filepath"

%inst


%href
clipn_save_image

%index
clipn_save_image
画像保存
%group
システム
%prm
"filepath"

%inst


%href
clipn_get_files

%index
clipn_get_files
ファイル一覧
%group
システム
%prm
var_list

%inst
stat=個数

%href
clipn_clear

%index
clipn_clear
クリア
%group
システム
%prm


%inst

