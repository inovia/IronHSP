;
; iron_url.hsp  HSP3 ヘルプ (日本語)
; URL / HTML エンコード・デコード (C# WebUtility 相当、Pure HSP)
;

%type
拡張命令
%ver
1.0
%date
2026-04-15
%author
IronHSP / iron_url
%dll
iron_url.hsp

%url
https://github.com/inovia/IronHSP
%port
Win32 / Win64

%note
iron_url.hsp は C# の System.Net.WebUtility.UrlEncode / UrlDecode と
System.Web.HttpUtility.HtmlEncode / HtmlDecode に相当する関数群を
Pure HSP で実装したモジュールです。外部 DLL は不要です。

  #include "iron_url.hsp"

サポート:
  URL Percent-Encoding (RFC 3986、unreserved 文字は非エスケープ)
  application/x-www-form-urlencoded ("+" = space 変換) 対応
  HTML エスケープ 5 種 (& < > " ') + 数値文字参照デコード
  クエリ文字列パース (?a=1&b=2 を keys/vals 配列に分解)

%group
iron_url (URL/HTMLエンコード)

%index
url_encode
URL パーセントエンコード (空白は %20)
%group
iron_url ― URL
%prm
"src", dst
"src" : 入力文字列
dst   : エンコード結果を受け取る変数 (sdim 自動)

%inst
RFC 3986 に従い unreserved 文字 (A-Z a-z 0-9 - _ . ~) 以外を
%XX 形式に変換します。空白は %20 になります。

例:
  url_encode "hello world!", enc
  mes enc
  ; → hello%20world%21

%href
url_encode_form
url_decode

%index
url_encode_form
form-urlencoded エンコード (空白は +)
%group
iron_url ― URL
%prm
"src", dst
"src" : 入力文字列
dst   : エンコード結果を受け取る変数

%inst
application/x-www-form-urlencoded 形式でエンコードします。
url_encode との違いは空白が "+" になる点だけです。HTML フォームの
POST body を組み立てるときに使用します。

%href
url_encode
url_decode

%index
url_decode
URL デコード
%group
iron_url ― URL
%prm
"src", dst
"src" : エンコード済み文字列
dst   : デコード結果を受け取る変数

%inst
%XX をバイトに復元し、"+" は空白に変換します。
url_encode / url_encode_form のどちらでエンコードされた文字列でも
正しくデコードできます。

例:
  url_decode "hello%20world%21", dec
  mes dec
  ; → hello world!

%index
html_encode
HTML エスケープ
%group
iron_url ― HTML
%prm
"src", dst
"src" : 入力文字列
dst   : エスケープ結果を受け取る変数

%inst
HTML 特殊文字 5 種を実体参照に変換します:
  &  → &amp;
  <  → &lt;
  >  → &gt;
  "  → &quot;
  '  → &#39;

例:
  html_encode "<b>hi</b>", h
  mes h
  ; → &lt;b&gt;hi&lt;/b&gt;

%href
html_decode

%index
html_decode
HTML アンエスケープ
%group
iron_url ― HTML
%prm
"src", dst
"src" : HTML エンティティを含む文字列
dst   : デコード結果を受け取る変数

%inst
&amp; &lt; &gt; &quot; &apos; の名前付き実体と、&#NNN; 形式の
数値文字参照 (0～255) をデコードします。未知の実体はそのまま残します。

%href
html_encode

%index
url_parse_query
クエリ文字列を keys/vals 配列にパース
%group
iron_url ― URL
%prm
"query", keys, vals
"query" : クエリ文字列 ("?a=1&b=2" または "a=1&b=2")
keys    : キーを受け取る配列 (sdim 自動)
vals    : 値を受け取る配列 (sdim 自動)

%inst
"&" で区切って各 pair を "=" で分解し、key / value それぞれを
url_decode してから配列に格納します。stat にエントリ件数が返ります。
先頭の "?" は自動的に取り除かれます。最大 32 エントリまで。

例:
  url_parse_query "?name=Alice&age=30", ks, vs
  repeat stat
      mes ks(cnt) + " = " + vs(cnt)
  loop
