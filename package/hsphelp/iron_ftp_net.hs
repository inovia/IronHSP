%dll
; iron_ftp_net .NET FTP
%ver
3.8
%date
2026/04/16
%author
IronHSP
%note
hsp3net 専用。System.Net.FtpWebRequest 使用。FTPS 対応。
%type
ユーザー定義命令
%group
ネットワーク (.NET)

%index
netftp_download
.NETでFTPダウンロード
%prm
"ftp://url", "local_path" [, "user", "pass"]
%inst
stat=0 で成功。
%href
netftp_upload

%index
netftp_upload
.NETでFTPアップロード
%prm
"ftp://url", "local_path" [, "user", "pass"]
%href
netftp_download

%index
netftp_list
.NETでFTPファイル一覧
%prm
"ftp://url/dir/" [, "user", "pass"]
%inst
refstr に改行区切り。
%href
netftp_download
