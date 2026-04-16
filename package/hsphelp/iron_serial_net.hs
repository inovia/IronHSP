;
; iron_serial_net.hsp  HSP3 ヘルプ (日本語)
; シリアルポート (.NET版)
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
iron_serial_net.hsp

%url
https://github.com/inovia/IronHSP
%port
Win32 / Win64

%note
hsp3net 専用

%group
通信

%index
serialn_open
ポートを開く
%group
通信
%prm
"COM3", 115200

%inst
stat にハンドル。

%href
serialn_write

%index
serialn_write
データ送信
%group
通信
%prm
handle, "data"

%inst


%href
serialn_read

%index
serialn_read
データ受信
%group
通信
%prm
handle, var_data

%inst
stat=受信バイト数

%href
serialn_close

%index
serialn_close
ポートを閉じる
%group
通信
%prm
handle

%inst


%href
serialn_list_ports

%index
serialn_list_ports
ポート一覧
%group
通信
%prm
var_names

%inst
stat=ポート数
