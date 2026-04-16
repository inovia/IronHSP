;
; iron_webserver.hsp  HSP3 ヘルプ (日本語)
; HTTP / HTTPS / WebSocket サーバ (HTTP.sys backend)
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
hspwebsrv.dll

%url
https://github.com/inovia/IronHSP
%port
Win32 / Win64

%note
iron_webserver.hsp は hspwebsrv.dll (Windows HTTP Server API v2 =
HTTP.sys 経由) をラップした HSP 向け本格 HTTP サーバモジュールです。
C# の HttpListener と同じ backend を使っているため、HTTP / HTTPS /
WebSocket を単一 DLL で扱えます。

  #include "iron_webserver.hsp"

特徴:
  HTTP.sys (kernel-mode) backend による高性能処理
  http://localhost:port/ は admin 権限不要
  http://+:port/ などは admin 必要 (netsh http add urlacl)
  HTTPS は事前に netsh http add sslcert で証明書バインドが必要
  WebSocket の handshake + フレーム parser も内包

%group
iron_webserver (HTTPサーバ)

%index
web_open
ポート番号指定でサーバを開始 (localhost)
%group
iron_webserver ― サーバ
%prm
port
port : 待ち受けポート番号

%inst
http://localhost:port/ で待ち受けを開始します。localhost バインドのみ
なので admin 権限は不要です。戻り値は内部ハンドル (失敗時は負値)。

例:
  web_open 8080

%href
web_open_url
web_close

%index
web_open_url
URL プレフィックス指定でサーバを開始
%group
iron_webserver ― サーバ
%prm
"url"
"url" : URL プレフィックス (例 "https://localhost:8443/")

%inst
任意の URL プレフィックスで待ち受けを開始します。"http://+:port/" のような
非 localhost バインドや HTTPS を使う場合はこちらを使用します。
admin 権限や事前の urlacl / sslcert 設定が必要になる場合があります。

例:
  web_open_url "https://localhost:8443/"

%href
web_open
web_close

%index
web_close
サーバを停止
%group
iron_webserver ― サーバ
%prm

%inst
稼働中のサーバを停止し、内部ハンドルを解放します。

%href
web_open

%index
web_accept
リクエストを 1 件受け取る
%group
iron_webserver ― HTTP
%prm
method, path, body, is_ws, timeout_ms
method     : メソッド文字列を受け取る変数 ("GET" 等)
path       : リクエストパスを受け取る変数
body       : リクエスト body を受け取る変数 (最大 16KB)
is_ws      : WebSocket upgrade の場合 1 が入る変数
timeout_ms : タイムアウト (ミリ秒、0 指定で 100ms)

%inst
次のリクエストを待ち受けます。戻り値は 1 (リクエスト受信) / 0 (timeout) /
-1 (エラー)。is_ws = 1 の場合は WebSocket アップグレード要求です。
通常は stat を見てループを回します。

例:
  repeat
      web_accept method, path, body, is_ws, 100
      if stat = 1 : web_respond 200, "text/html", "<h1>Hello</h1>"
      stick k, 128 : if k & 128 : break
  loop

%href
web_respond
web_accept_ws

%index
web_respond
HTTP レスポンスを返す
%group
iron_webserver ― HTTP
%prm
status, "ctype", "body"
status  : HTTP ステータスコード (200 等)
"ctype" : Content-Type ("text/html", "application/json" 等)
"body"  : 応答 body 文字列

%inst
直前の web_accept で受信したリクエストに対するレスポンスを送信します。

例:
  web_respond 200, "application/json", "{\"ok\":true}"

%href
web_accept

%index
web_accept_ws
WebSocket アップグレードを受諾
%group
iron_webserver ― WebSocket
%prm

%inst
is_ws = 1 の web_accept 直後に呼び出すと WebSocket ハンドシェイクを
完了し、ws ハンドル (関数戻り値) を返します。失敗時は負値。

例:
  ws = web_accept_ws()

%href
web_accept
web_ws_send
web_ws_recv

%index
web_ws_send
WebSocket メッセージを送信
%group
iron_webserver ― WebSocket
%prm
ws, "text", is_binary
ws        : web_accept_ws の戻り値
"text"    : 送信するメッセージ
is_binary : 0 = text frame / 1 = binary frame

%inst
WebSocket クライアントにメッセージを 1 フレーム送信します。

%href
web_ws_recv
web_ws_close

%index
web_ws_recv
WebSocket メッセージを受信
%group
iron_webserver ― WebSocket
%prm
ws, out_buf, timeout_ms
ws         : ws ハンドル
out_buf    : 受信メッセージを受け取る変数 (sdim 自動、最大 16KB)
timeout_ms : タイムアウト (ミリ秒、0 指定で 1000ms)

%inst
WebSocket から 1 メッセージを受信します。戻り値は受信バイト数 /
0 (timeout) / -1 (close or error)。

例:
  repeat
      web_ws_recv ws, msg, 10000
      if stat <= 0 : break
      web_ws_send ws, "echo: " + msg, 0
  loop

%href
web_ws_send
web_ws_close

%index
web_ws_close
WebSocket 接続を閉じる
%group
iron_webserver ― WebSocket
%prm
ws
ws : ws ハンドル

%inst
WebSocket 接続をクローズします。recv ループ終了時に必ず呼び出して
ください。

%href
web_ws_recv
