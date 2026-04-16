%dll
; iron_service Windowsサービス制御
%ver
3.8
%date
2026/04/16
%author
IronHSP
%note
Win32 advapi32。管理者権限が必要な場合あり。
%type
ユーザー定義命令
%group
システム

%index
service_start
サービスを開始
%prm
"name"
%inst
stat=0 で成功。
%href
service_stop

%index
service_stop
サービスを停止
%prm
"name"
%inst

%href
service_status

%index
service_status
サービスの状態を取得
%prm
("name")
%inst
1=STOPPED, 4=RUNNING
