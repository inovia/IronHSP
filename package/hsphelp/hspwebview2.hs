;
; hspwebview2.hs  HSP3 ヘルプ (日本語)
; Microsoft Edge WebView2 プラグイン + iron_webview2.hsp 糖衣
;

%type
拡張命令
%ver
1.0
%date
2026-04-15
%author
IronHSP / hspwebview2
%dll
hspwebview2.dll
%url
https://github.com/HNWorks/IronHSP_2026
%port
Win32 / Win64

%note
hspwebview2.dll は Microsoft Edge WebView2 を HSP ウィンドウに埋め込み、
HTML/JS を表示して HSP と JavaScript の双方向メッセージングを行う
プラグインです。

  #include "iron_webview2.hsp"   ; 糖衣 (推奨)
  または
  #include "hspwebview2.as"      ; 生 API

依存:
  - Microsoft Edge WebView2 Runtime (ほぼ全 Win10/11 に同梱済み)
  - hspwebview2.dll / hspwebview2_64.dll を実行ファイルと同ディレクトリに配置

JS からの送信:
  window.chrome.webview.postMessage("text");
JS での受信:
  window.chrome.webview.addEventListener('message', e => { ... e.data ... });

%index
wv2_init
WebView2 環境を初期化
%group
hspwebview2
%prm
"user_data_dir"

%inst
WebView2 環境 (ICoreWebView2Environment) を作成します。
user_data_dir はキャッシュ等を置くフォルダ。"" で
%LOCALAPPDATA%\IronHSP\WebView2 が使われます。
stat=0 成功、負値はエラー。
2 回目以降の呼び出しは何もしません (idempotent)。

%href
wv2_attach

%index
wv2_attach
WebView2 を HWND に貼り付け
%group
hspwebview2
%prm
hwnd, x, y, w, h

%inst
指定 HWND (通常は hsp の hwnd) に ICoreWebView2Controller を作成して
アタッチします。stat はビュー ID (0..15) で、失敗時は負値。
内部で非同期待ちを行いますが、HSP メッセージポンプは止めません。

%href
wv2_detach wv2_navigate

%index
wv2_detach
WebView2 を破棄
%group
hspwebview2
%prm
id

%inst
指定 ID のビューを破棄します。wv2_close と同じ。

%index
wv2_close
WebView2 を破棄
%group
hspwebview2
%prm
id

%inst
wv2_detach と同義。

%index
wv2_navigate
URL 遷移
%group
hspwebview2
%prm
id, "url"

%inst
指定 ID の WebView2 で URL を開きます。

%index
wv2_navigate_to_string
HTML 文字列を表示
%group
hspwebview2
%prm
id, "html"

%inst
HTML ソース文字列をそのまま表示します。

%index
wv2_resize
矩形を更新
%group
hspwebview2
%prm
id, x, y, w, h

%inst
WebView2 の表示矩形を変更します。ウィンドウサイズ変更時に呼びます。

%index
wv2_visible
表示/非表示
%group
hspwebview2
%prm
id, 0/1

%inst
1 で表示、0 で非表示。

%index
wv2_execute_script
JS を実行して結果を受け取る
%group
hspwebview2
%prm
id, "js", var_str, buf_size
id       : ビュー ID
"js"     : 実行する JavaScript ソース
var_str  : 結果 JSON 文字列を受け取る str 変数 (sdim 済)
buf_size : var_str に sdim で確保したバッファサイズ

%inst
指定 JS を評価し、JSON シリアライズされた結果を var_str に書き込みます。
var_str は事前に sdim で十分なサイズを確保し、その sdim サイズを
buf_size に指定してください。
非同期処理を内部で同期待ちします (HSP ポンプを止めません)。

%href
wv2_post_message wv2_poll_message

%index
wv2_post_message
HSP -> JS にメッセージ送信
%group
hspwebview2
%prm
id, "text"

%inst
PostWebMessageAsString を呼び、JS 側の
window.chrome.webview.addEventListener('message', ...) に届けます。

%index
wv2_poll_message
JS -> HSP のメッセージ取り出し
%group
hspwebview2
%prm
id, var_str, buf_size
id       : ビュー ID
var_str  : メッセージを受け取る str 変数 (sdim 済)
buf_size : var_str に sdim で確保したバッファサイズ

%inst
JS 側が window.chrome.webview.postMessage() で送ったメッセージを
1 件取り出して var_str に書き込みます。
var_str は事前に sdim で十分なサイズを確保し、その sdim サイズを
buf_size に指定してください。
stat=1 取得、stat=0 空。

%index
wv2_add_script
DocumentCreated 時に実行する JS を注入
%group
hspwebview2
%prm
id, "js"

%inst
ページ読み込み前に必ず実行される JS を登録します
(AddScriptToExecuteOnDocumentCreated)。

%index
wv_open
iron_webview2 糖衣 — WebView2 を開く
%group
iron_webview2
%prm
x, y, w, h, "udir"

%inst
現在のアクティブ HSP ウィンドウに WebView2 を貼り付けます。
初回呼び出し時は wv2_init を自動で呼びます。stat=id。

  #include "iron_webview2.hsp"
  wv_open 0, 0, 640, 480
  id = stat
  wv_go id, "https://www.google.com/"

%href
wv_close wv_go wv_send wv_recv

%index
wv_go
URL 遷移 (糖衣)
%group
iron_webview2
%prm
id, "url"

%index
wv_html
HTML 直接表示 (糖衣)
%group
iron_webview2
%prm
id, "html"

%index
wv_send
HSP -> JS 送信 (糖衣)
%group
iron_webview2
%prm
id, "text"

%index
wv_recv
JS -> HSP 受信 (糖衣)
%group
iron_webview2
%prm
id

%inst
s = wv_recv(id) で 1 件取り出し。空なら "" が返ります。

%index
wv_eval
JS 評価 (糖衣)
%group
iron_webview2
%prm
id, "js"

%inst
s = wv_eval(id, "js") — JSON 文字列を返します。
