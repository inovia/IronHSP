%dll
; iron_fwatch_net .NETファイル監視
%ver
3.8
%date
2026/04/16
%author
IronHSP
%note
hsp3net 専用。System.IO.FileSystemWatcher 使用。
%type
ユーザー定義命令
%group
ファイル操作 (.NET)

%index
netfwatch_start
.NETでファイル監視開始
%prm
"path" [, "filter"]
%inst
FileSystemWatcher を使用。stat=0 で成功。
%href
netfwatch_stop

%index
netfwatch_stop
.NETでファイル監視停止
%href
netfwatch_start
