;
; iron_docx.hsp  HSP3 ヘルプ (日本語)
; Word .docx 生成
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
iron_docx.hsp

%url
https://github.com/inovia/IronHSP
%port
Win32 / Win64

%note
hsp3net 専用

%group
ドキュメント

%index
docx_create
Word ドキュメントを作成
%group
ドキュメント
%prm
"path", "body"

%inst
指定パスに .docx ファイルを生成します。
refstr = "ok" で成功。
