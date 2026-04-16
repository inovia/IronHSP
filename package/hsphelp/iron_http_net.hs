;
; iron_http_net.hsp  HSP3 ヘルプ (日本語)
; HTTP クライアント (.NET版)
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
iron_http_net.hsp

%url
https://github.com/inovia/IronHSP
%port
Win32 / Win64

%note
hsp3net 専用

%group
ネットワーク

%index
httpn_get
HTTP GET
%group
ネットワーク
%prm
"url", var_body

%inst
HttpClient で GET。stat に HTTP ステータスコード。

%href
httpn_post

%index
httpn_post
HTTP POST
%group
ネットワーク
%prm
"url", "body", var_resp, "content-type"

%inst
POST リクエスト送信。

%href
httpn_set_header

%index
httpn_set_header
カスタムヘッダ設定
%group
ネットワーク
%prm
"name", "value"

%inst
次リクエストに付与するヘッダ。

%href
httpn_set_timeout

%index
httpn_set_timeout
タイムアウト設定
%group
ネットワーク
%prm
ms

%inst
ミリ秒単位。

%href
httpn_download

%index
httpn_download
ファイルダウンロード
%group
ネットワーク
%prm
"url", "filepath"

%inst
URL から直接ファイルに保存。

%href
httpn_set_cookie

%index
httpn_set_cookie
Cookie 設定
%group
ネットワーク
%prm
"name=value"

%inst
Cookie を付与。
