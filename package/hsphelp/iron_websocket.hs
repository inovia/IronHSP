;
; iron_websocket.hsp  HSP3 ヘルプ (日本語)
; WebSocket クライアント
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
iron_websocket.hsp

%url
https://github.com/inovia/IronHSP
%port
Win32 / Win64

%note
hsp3net 専用

%group
ネットワーク

%index
ws_connect
接続
%group
ネットワーク
%prm
"wss://...", var_handle

%inst
stat=0 成功

%href
ws_send

%index
ws_send
テキスト送信
%group
ネットワーク
%prm
handle, "message"

%inst


%href
ws_recv

%index
ws_recv
受信
%group
ネットワーク
%prm
handle, var_msg, timeout_ms

%inst
stat=0 受信, stat=1 タイムアウト

%href
ws_close

%index
ws_close
切断
%group
ネットワーク
%prm
handle

%inst


%href
ws_is_connected

%index
ws_is_connected
接続確認
%group
ネットワーク
%prm
(handle)

%inst
1=接続中
