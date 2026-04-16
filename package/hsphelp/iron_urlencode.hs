%dll
; iron_urlencode URLエンコード/デコード (DEPRECATED shim)
%ver
3.8
%date
2026/04/18
%author
IronHSP
%note
このモジュールは iron_url.hsp への後方互換 shim です。
新規コードでは iron_url.hsp を直接 #include して、url_encode_s() /
url_decode_s() などを使用してください。

旧 API の urlencode() / urldecode() は引き続き動作しますが、
内部で iron_url.hsp の url_encode_s() / url_decode_s() に委譲しています。
%type
ユーザー定義命令
%group
ネットワーク

%index
urlencode
URL エンコード (DEPRECATED: url_encode_s を推奨)
%prm
(text)
%inst
RFC 3986 準拠。スペース→%20。iron_url.hsp の url_encode_s() への shim です。
%href
urldecode
url_encode_s


%index
urldecode
URL デコード (DEPRECATED: url_decode_s を推奨)
%prm
(text)
%inst
%XX / + を元の文字に戻します。iron_url.hsp の url_decode_s() への shim です。
%href
urlencode
url_decode_s
