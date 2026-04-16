%dll
; iron_netinfo ネットワーク情報
%ver
3.8
%date
2026/04/16
%author
IronHSP
%note
wininet/ws2_32。外部DLL不要。
%type
ユーザー定義関数
%group
ネットワーク

%index
netinfo_connected
インターネット接続確認
%prm
()
%inst
1=接続, 0=未接続
%href
netinfo_ip

%index
netinfo_type
接続種別を取得
%prm
()
%inst
1=モデム, 2=LAN, 4=プロキシ
%href
netinfo_connected

%index
netinfo_ip
プライマリIPアドレス
%prm
()
%href
netinfo_hostname

%index
netinfo_hostname
ホスト名を取得
%prm
()
%href
netinfo_ip
