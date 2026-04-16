;
; iron_pptx.hsp  HSP3 ヘルプ (日本語)
; PowerPoint .pptx 生成
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
iron_pptx.hsp

%url
https://github.com/inovia/IronHSP
%port
Win32 / Win64

%note
hsp3net 専用

%group
ドキュメント

%index
pptx_create
PPTX を作成
%group
ドキュメント
%prm
"path"

%inst
新しい PowerPoint ファイルを作成します。

%href
pptx_add_slide

%index
pptx_add_slide
スライドを追加
%group
ドキュメント
%prm
"title", "body"

%inst
タイトルと本文を指定してスライドを追加します。

%href
pptx_save

%index
pptx_save
保存して閉じる
%group
ドキュメント
%prm


%inst
ファイルを保存して閉じます。
