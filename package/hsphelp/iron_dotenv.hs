;
; iron_dotenv.hsp  HSP3 ヘルプ (日本語)
; .env ファイルローダー
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
iron_dotenv.hsp

%url
https://github.com/inovia/IronHSP
%port
Win32 / Win64

%note
iron_fs が必要

%group
設定

%index
dotenv_load
.env ファイルを読み込む
%group
設定
%prm
"path"

%inst
.env ファイルを読み込んで環境変数風にアクセスできるようにします。
stat = 0 で成功。
