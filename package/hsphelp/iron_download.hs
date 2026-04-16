;
; iron_download.hsp  HSP3 ヘルプ (日本語)
; ファイルダウンロード
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
iron_download.hsp

%url
https://github.com/inovia/IronHSP
%port
Win32 / Win64

%note
iron_http 依存

%group
ネットワーク

%index
dl_start
ダウンロード開始
%group
ネットワーク
%prm
"url", "filepath"

%inst
stat=HTTP ステータス

%href
dl_start_resume

%index
dl_start_resume
レジューム
%group
ネットワーク
%prm
"url", "filepath"

%inst
Range ヘッダで再開。
