;
; iron_udp.hsp  HSP3 ヘルプ (日本語)
; UDP ソケット
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
iron_udp.hsp

%url
https://github.com/inovia/IronHSP
%port
Win32 / Win64

%note
hsp3net 専用

%group
ネットワーク

%index
udp_open
ソケット作成
%group
ネットワーク
%prm
port, var_handle

%inst
0=自動ポート

%href
udp_send

%index
udp_send
送信
%group
ネットワーク
%prm
handle, "host", port, "data"

%inst


%href
udp_recv

%index
udp_recv
受信
%group
ネットワーク
%prm
handle, var_data, var_from_ip, var_from_port, timeout_ms

%inst
stat=受信バイト数

%href
udp_close

%index
udp_close
閉じる
%group
ネットワーク
%prm
handle

%inst

