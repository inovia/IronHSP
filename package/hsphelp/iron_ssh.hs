%dll
; iron_ssh SSH/SFTP
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
ssh_connect
SSHサーバーに接続
%prm
"host", port, "user", "pass"
%inst
stat=0 で成功。
%href
ssh_exec

%index
ssh_exec
リモートコマンドを実行
%prm
"command"
%inst
refstr に stdout。
%href
sftp_upload

%index
sftp_upload
SFTPでアップロード
%prm
"local", "remote"
%inst
sftp_init を先に呼ぶ。
%href
sftp_download

%index
sftp_download
SFTPでダウンロード
%prm
"remote", "local"
%inst

%href
ssh_disconnect

%index
ssh_disconnect
接続を切断
%prm

%inst

