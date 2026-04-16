%dll
; iron_jwt JWT トークン
%ver
3.8
%date
2026/04/16
%author
IronHSP
%note
iron_hash.hsp (base64_decode) が必要。
%type
ユーザー定義命令
%group
セキュリティ

%index
jwt_decode
JWTのpayloadをデコード
%prm
(token)
%inst
Base64URL デコード。署名検証なし。
%href
jwt_header

%index
jwt_header
JWTのheaderをデコード
%prm
(token)
%inst

