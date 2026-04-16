;
; iron_dns.hsp  HSP3 ヘルプ (日本語)
; DNS 問い合わせ
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
iron_dns.hsp

%url
https://github.com/inovia/IronHSP
%port
Win32 / Win64

%note
hsp3net 専用

%group
ネットワーク

%index
dns_lookup
名前解決
%group
ネットワーク
%prm
"hostname", var_ip

%inst


%href
dns_lookup_all

%index
dns_lookup_all
全 IP 取得
%group
ネットワーク
%prm
"hostname", var_ips

%inst
stat=個数

%href
dns_reverse

%index
dns_reverse
逆引き
%group
ネットワーク
%prm
"ip", var_hostname

%inst

