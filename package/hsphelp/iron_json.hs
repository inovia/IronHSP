;
; iron_json.hsp  HSP3 ヘルプ (日本語)
; hspjson.dll の HSP 側薄ラッパ
;

%type
拡張命令
%ver
1.0
%date
2026-04-13
%author
IronHSP / iron_json
%dll
iron_json.hsp

%url
https://github.com/inovia/IronHSP
%port
Win32 / Win64

%note
iron_json.hsp は hspjson.dll を HSP3 から扱いやすくするラッパです。
出力 var の sdim を内部で自動化し、defcfunc 形式で値を返すので
1 行で取得できます。

  #include "iron_json.hsp"

依存: hspjson.dll を実行ファイルと同じディレクトリに配置。

%group
iron_json (JSON解析)

%index
json_load
JSON 文字列をパースしてハンドル取得
%group
iron_json
%prm
"text"

%inst
JSON テキストをパースして整数ハンドルを返します。
失敗時は -1。

例:
  hid = json_load("{\"name\":\"Alice\",\"age\":30}")
  if hid >= 0 {
    mes json_str(hid, "name")
    json_release hid
  }

%href
json_release
json_str
json_int

%index
json_release
ハンドルを解放
%group
iron_json
%prm
hid

%inst
json_load で取得したハンドルを解放します。

%index
json_close
全 JSON ハンドルを一括解放
%group
iron_json
%prm

%inst
全ハンドルを解放します。

%index
json_str
JSON 文字列値の取得
%group
iron_json
%prm
hid, "path"

%inst
指定パスの文字列値を返します (defcfunc)。
パスは "name", "user.email", "tags[2]" 形式。

例:
  s = json_str(hid, "address.city")

%index
json_int
JSON 整数値の取得
%group
iron_json
%prm
hid, "path"

%inst
整数値を返します (defcfunc)。

%index
json_dbl
JSON double 値の取得
%group
iron_json
%prm
hid, "path"

%index
json_len
配列/オブジェクト要素数を取得
%group
iron_json
%prm
hid, "path"

%inst
要素数を返します。配列の repeat ループで使います。

例:
  n = json_len(hid, "tags")
  repeat n
    mes json_str(hid, "tags[" + cnt + "]")
  loop

%index
json_kind
ノードの型 ID を取得
%group
iron_json
%prm
hid, "path"

%inst
0=null 1=bool 2=num 3=str 4=arr 5=obj を返します。

%index
json_text
ハンドルを minify JSON 文字列にシリアライズ
%group
iron_json
%prm
hid

%index
json_pretty
ハンドルを整形 JSON 文字列にシリアライズ
%group
iron_json
%prm
hid
