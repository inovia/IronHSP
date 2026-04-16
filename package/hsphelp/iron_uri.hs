%dll
; iron_uri URI/URL パーサ
%ver
3.8
%date
2026/04/16
%author
IronHSP
%note
純HSP実装。外部DLL不要。
%type
ユーザー定義命令
%group
ネットワーク

%index
uri_parse
URLを解析
%prm
"url"
%inst
scheme/host/port/path/query/fragment に分解。
%href
uri_scheme

%index
uri_scheme
スキームを返す
%prm
()
%inst
"https" 等
%href
uri_host

%index
uri_host
ホストを返す
%prm
()
%inst

%href
uri_port

%index
uri_port
ポートを返す
%prm
()
%inst
省略時はスキームから自動設定 (443/80等)
%href
uri_path

%index
uri_path
パスを返す
%prm
()
%inst

%href
uri_query

%index
uri_query
クエリを返す
%prm
()
%inst
? の後ろ
%href
uri_fragment

%index
uri_fragment
フラグメントを返す
%prm
()
%inst
# の後ろ
