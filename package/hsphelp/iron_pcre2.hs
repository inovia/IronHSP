%dll
; iron_pcre2 正規表現 (PCRE2)
%ver
3.8
%date
2026/04/16
%author
IronHSP
%note
hsppcre2.dll が必要。PCRE2 10.44 Perl 互換。UTF-8 Unicode フル対応。
%type
ユーザー定義命令
%group
正規表現 (PCRE2)

%index
pcre2_match
全体マッチ判定
%prm
pattern, text
%inst
stat=1 でマッチ。後読み等の PCRE2 拡張構文が使用可能。
%href
pcre2_search

%index
pcre2_search
最初のマッチ検索
%prm
pattern, text
%inst
refstr にマッチ文字列。
%sample
	pcre2_search "(?<=@)\w+", "user@example.com"
	mes refstr  ; "example"
%href
pcre2_match

%index
pcre2_replace
全置換
%prm
pattern, text, replacement
%href
pcre2_search

%index
pcre2_find
全マッチ列挙
%prm
pattern, text
%inst
stat に件数。pcre2_get() で取得。
%href
pcre2_get

%index
pcre2_get
マッチ取得
%prm
(index)
%href
pcre2_find

%index
pcre2_count
マッチ数を返す
%prm
(pattern, text)
%href
pcre2_find
