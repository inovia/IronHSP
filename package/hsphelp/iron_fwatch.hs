%dll
; iron_fwatch ファイル監視
%ver
3.8
%date
2026/04/16
%author
IronHSP
%type
ユーザー定義命令
%group
ファイル操作

%index
fwatch_start
ディレクトリ監視を開始
%prm
"path" [, filter]
%inst
stat に監視ハンドル。
%href
fwatch_check

%index
fwatch_check
変更があったか確認
%prm
handle
%inst
stat=1 で変更あり。
%href
fwatch_stop

%index
fwatch_stop
監視を停止
%prm
handle
%inst

