;
; iron_rest.hsp  HSP3 ヘルプ (日本語)
; REST API ビルダー
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
iron_rest.hsp

%url
https://github.com/inovia/IronHSP
%port
Win32 / Win64

%note
iron_http 依存

%group
ネットワーク

%index
rest_set_base
ベース URL 設定
%group
ネットワーク
%prm
"https://api.example.com/v1"

%inst


%href
rest_set_auth

%index
rest_set_auth
認証設定
%group
ネットワーク
%prm
"Bearer", "token"

%inst
Bearer/Basic/ApiKey

%href
rest_get

%index
rest_get
GET
%group
ネットワーク
%prm
"path", var_body

%inst
stat=HTTP ステータスコード

%href
rest_post

%index
rest_post
POST
%group
ネットワーク
%prm
"path", "json", var_resp

%inst


%href
rest_put

%index
rest_put
PUT
%group
ネットワーク
%prm
"path", "json", var_resp

%inst


%href
rest_delete

%index
rest_delete
DELETE
%group
ネットワーク
%prm
"path", var_resp

%inst


%href
rest_patch

%index
rest_patch
PATCH
%group
ネットワーク
%prm
"path", "json", var_resp

%inst

