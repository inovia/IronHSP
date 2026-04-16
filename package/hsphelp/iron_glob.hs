;
; iron_glob.hsp  HSP3 ヘルプ (日本語)
; 再帰ファイル検索
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
iron_glob.hsp

%url
https://github.com/inovia/IronHSP
%port
Win32 / Win64

%note
iron_fs が必要

%group
ファイル

%index
glob_find
パターンでファイル検索
%group
ファイル
%prm
"dir", "*.txt", recursive

%inst
refstr に改行区切りのファイルリストが格納されます。
