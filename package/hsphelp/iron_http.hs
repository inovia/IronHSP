;
; iron_http.hsp  HSP3 ヘルプ (日本語)
; WinHTTP 簡易 HTTP クライアントラッパ
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
iron_http.hsp

%url
https://github.com/inovia/IronHSP
%port
Win32 / Win64

%note
iron_http.hsp は Win32 WinHTTP API を直接ラップした HTTP クライアント
モジュールです。.NET 不要、HTTPS 自動 (システム証明書ストア使用)、
リダイレクト自動追尾。

  #include "iron_http.hsp"

GET / POST を 1 行で叩けます。応答 body は出力 var に書き込まれ、
HTTP status は stat システム変数に入ります。

%group
iron_http (HTTPクライアント)

%index
http_get
HTTP GET リクエスト
%group
iron_http
%prm
url, body
url  : URL 文字列
body : 応答 body を受け取る var (sdim 自動)

%inst
GET リクエストを発行して body 変数に応答内容を書き込みます。
HTTP ステータスコードは stat に格納されます (200 が成功)。

例:
  http_get "https://api.open-meteo.com/v1/forecast?...", body
  if stat = 200 : mes body

%href
http_post
http_set_timeout

%index
http_post
HTTP POST リクエスト
%group
iron_http
%prm
url, send_body, body, [content_type]
url       : URL
send_body : POST する body 文字列
body      : 応答 body を受け取る var
ctype     : Content-Type (省略時 application/x-www-form-urlencoded)

%inst
POST リクエストを発行。JSON を投げる場合は ctype に "application/json"
を指定してください。

例:
  http_post "https://example.com/api", "{\"key\":\"v\"}", body, "application/json"

%href
http_get

%index
http_set_timeout
タイムアウト設定
%group
iron_http
%prm
sec
sec : タイムアウト秒数 (デフォルト 30)

%inst
接続/送受信タイムアウトを設定します。

%index
http_set_header
追加 HTTP ヘッダの設定
%group
iron_http
%prm
"header_string"
"header_string" : "Authorization: Bearer xxx\r\n" 等の追加ヘッダ

%inst
Content-Type 以外の追加ヘッダを後続の http_get/http_post に付与します。
Authorization, X-API-Key, User-Agent カスタム等に使用。
空文字でクリア。

例:
  http_set_header "Authorization: Bearer sk-..."
  http_get "https://api.openai.com/v1/models", body
