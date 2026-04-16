;
; iron_zip_net.hsp  HSP3 ヘルプ (日本語)
; ZIP 圧縮/展開 (.NET版)
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
iron_zip_net.hsp

%url
https://github.com/inovia/IronHSP
%port
Win32 / Win64

%note
hsp3net 専用

%group
データ

%index
zipn_create
ディレクトリを圧縮
%group
データ
%prm
"dir", "out.zip"

%inst


%href
zipn_extract

%index
zipn_extract
ZIP を展開
%group
データ
%prm
"in.zip", "outdir"

%inst


%href
zipn_list

%index
zipn_list
エントリ一覧
%group
データ
%prm
"in.zip", var_names, var_sizes

%inst
stat=エントリ数

%href
zipn_add

%index
zipn_add
ファイル追加
%group
データ
%prm
"archive.zip", "file"

%inst


%href
zipn_extract_one

%index
zipn_extract_one
単一エントリ展開
%group
データ
%prm
"in.zip", "entry", "outdir"

%inst

