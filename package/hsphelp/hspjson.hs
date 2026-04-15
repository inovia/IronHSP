;
; hspjson.dll  HSP3 ヘルプ (日本語)
; 軽量 JSON 読み書きプラグイン
;

%type
拡張命令
%ver
1.0
%date
2026-04-13
%author
IronHSP / hspjson
%dll
hspjson.dll
%url
https://github.com/HNWorks/IronHSP_2026
%port
Win32 / Win64

%note
hspjson.dll は HSP3 から JSON テキストを読み書きするための小さな
プラグインです。サードパーティ依存ゼロ (自前 parser/writer) で、
~300 KB の単独 DLL として配布できます。

HSP からは package/win32/common/iron_json.hsp を include して使う
のが推奨です (iron_json は出力 var の sdim を自動化したラッパ)。
本ヘルプは生 API の説明です。

JSON ノードは内部でハンドル管理されます。json_parse でツリーを
作成 → 各種 getter で値を取り出し → json_free で解放、という
流れになります。

%index
json_parse
JSON テキストをパースしてハンドルを生成
%group
hspjson — 基本
%prm
"text", var
"text" : 解析する JSON 文字列
var    : ハンドルを受け取る整数変数

%inst
JSON 文字列を構文解析してメモリ上にツリー構造として展開し、
そのハンドル ID を p2 の変数に書き込みます。

成功時はハンドル (>=0)、失敗時は -1 が返ります。
取得したハンドルは json_get_str / json_get_int 等の取得系命令に
渡して使用します。使い終わったら json_free で解放してください。

%href
json_free
json_get_str
json_get_int

%index
json_free
JSON ハンドルを解放
%group
hspjson — 基本
%prm
hid
hid : json_parse で取得したハンドル

%inst
指定ハンドルが保持しているノードツリーを解放します。

%href
json_parse
json_clear

%index
json_clear
全 JSON ハンドルを解放
%group
hspjson — 基本
%prm

%inst
これまでに json_parse で確保された全ハンドルを一括で解放します。
プログラム終了時等の cleanup に便利です。

%href
json_free

%index
json_get_str
JSON 文字列値の取得
%group
hspjson — 値取得
%prm
hid, "path", var, buf_size
hid      : ハンドル
"path"   : JSONPath 風のパス (例 "name", "user.email", "tags[2]")
var      : 結果を格納する文字列変数 (sdim 済)
buf_size : var に sdim で確保したバッファサイズ

%inst
指定パスの文字列値を取り出して p3 の変数に書き込みます。
変数は事前に sdim で十分なサイズ確保しておき、その sdim サイズを
p4 (buf_size) に指定してください。

パス形式:
  "name"        → トップレベルのキー
  "user.email"  → ネストしたキー (ドット区切り)
  "tags[2]"     → 配列の 3 番目の要素
  "users[0].name" → 配列要素のフィールド

存在しないパスや型違いの場合は空文字列。

%href
json_get_int
json_get_dbl
json_count

%index
json_get_int
JSON 整数値の取得
%group
hspjson — 値取得
%prm
hid, "path", var
hid    : ハンドル
"path" : パス
var    : 結果を格納する整数変数

%inst
指定パスの整数値を取り出します。
JSON 上は number 型ですが、ここでは int に切り捨てて返します。
小数は json_get_dbl を使ってください。
boolean true/false は 1/0 として返ります。

%href
json_get_dbl
json_get_str

%index
json_get_dbl
JSON double 値の取得
%group
hspjson — 値取得
%prm
hid, "path", var
hid    : ハンドル
"path" : パス
var    : 結果を格納する double 変数

%inst
指定パスの数値を double として取り出します。

%href
json_get_int

%index
json_count
配列/オブジェクト要素数の取得
%group
hspjson — 値取得
%prm
hid, "path", var
hid    : ハンドル
"path" : 配列またはオブジェクトのパス
var    : 要素数を格納する整数変数

%inst
配列なら要素数、オブジェクトならキー数を返します。
配列を repeat ループで走査するときに使用。

%index
json_type
ノードの型を取得
%group
hspjson — 値取得
%prm
hid, "path", var
hid    : ハンドル
"path" : パス
var    : 型 ID を格納する整数変数

%inst
指定パスのノードの型を返します:
  0 = JT_NULL  (null)
  1 = JT_BOOL  (true/false)
  2 = JT_NUM   (number)
  3 = JT_STR   (string)
  4 = JT_ARR   (array)
  5 = JT_OBJ   (object)
  -1 = パス不正

%index
json_stringify
ハンドルを minify JSON 文字列に変換
%group
hspjson — シリアライズ
%prm
hid, var, buf_size
hid      : ハンドル
var      : 結果を格納する文字列変数 (sdim 済)
buf_size : var に sdim で確保したバッファサイズ

%inst
ハンドルが保持しているツリーを改行/インデントなしの最小 JSON 文字列に
シリアライズして p2 の変数に書き込みます。
p2 は事前に sdim で十分なサイズを確保し、その sdim サイズを
p3 (buf_size) に指定してください。

%href
json_stringify_pretty

%index
json_stringify_pretty
ハンドルを整形 JSON 文字列に変換
%group
hspjson — シリアライズ
%prm
hid, var, buf_size
hid      : ハンドル
var      : 結果を格納する文字列変数 (sdim 済)
buf_size : var に sdim で確保したバッファサイズ

%inst
ハンドルが保持しているツリーをインデント付きで読みやすく整形した
JSON 文字列を p2 に書き込みます。
p2 は事前に sdim で十分なサイズを確保し、その sdim サイズを
p3 (buf_size) に指定してください。

%href
json_stringify
