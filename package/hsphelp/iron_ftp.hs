%dll
; iron_ftp FTPクライアント
%ver
3.8
%date
2026/04/16
%author
IronHSP
%type
ユーザー定義命令
%group
ネットワーク通信

%index
ftp_connect
FTPサーバーに接続
%prm
"host", "user", "pass" [, port]
%inst
stat=0 で成功。
%href
ftp_upload

%index
ftp_upload
ファイルをアップロード
%prm
"local", "remote"
%inst

%href
ftp_download

%index
ftp_download
ファイルをダウンロード
%prm
"remote", "local"
%inst

%href
ftp_list

%index
ftp_list
ファイル一覧を取得
%prm
"pattern"
%inst
refstr に改行区切り。
%href
ftp_disconnect

%index
ftp_disconnect
接続を切断
%prm

%inst

