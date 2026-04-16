%dll
; iron_oauth OAuth 2.0 認証
%ver
3.8
%date
2026/04/16
%author
IronHSP
%type
ユーザー定義命令
%group
認証

%index
oauth_start_listener
コールバックリスナーを開始
%prm
port
%inst
stat=0 で成功。
%href
oauth_wait_code

%index
oauth_wait_code
認証コードを待つ
%prm
timeout_sec
%inst
refstr に code。stat=0 で成功。
%href
oauth_stop_listener

%index
oauth_stop_listener
リスナーを停止
%prm

%inst

