;
; iron_ping.hsp  HSP3 ヘルプ (日本語)
; ICMP Ping
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
iron_ping.hsp

%url
https://github.com/inovia/IronHSP
%port
Win32 / Win64

%note
hsp3net 専用

%group
ネットワーク

%index
ping_send
Ping 送信
%group
ネットワーク
%prm
"host", timeout_ms, var_time_ms

%inst
stat=0 成功

%href
ping_send_count

%index
ping_send_count
連続 Ping
%group
ネットワーク
%prm
"host", count, timeout_ms, var_results

%inst

