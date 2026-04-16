;
; iron_tcp.hsp  HSP3 ヘルプ (日本語)
; TCP ソケット
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
iron_tcp.hsp

%url
https://github.com/inovia/IronHSP
%port
Win32 / Win64

%note
hsp3net 専用

%group
ネットワーク

%index
tcp_connect
接続
%group
ネットワーク
%prm
"host", port, var_handle

%inst


%href
tcp_listen

%index
tcp_listen
待ち受け
%group
ネットワーク
%prm
port, var_handle

%inst


%href
tcp_accept

%index
tcp_accept
接続受け入れ
%group
ネットワーク
%prm
handle, var_client

%inst
stat=1 新規接続

%href
tcp_send

%index
tcp_send
送信
%group
ネットワーク
%prm
handle, "data"

%inst


%href
tcp_recv

%index
tcp_recv
受信
%group
ネットワーク
%prm
handle, var_data, timeout_ms

%inst
stat=受信バイト数

%href
tcp_close

%index
tcp_close
切断
%group
ネットワーク
%prm
handle

%inst

