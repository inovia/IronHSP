%dll
; iron_regex 正規表現 (std::regex)
%ver
3.8
%date
2026/04/16
%author
IronHSP
%note
hspregex.dll が必要です。C++11 std::regex (ECMAScript 互換)。
%type
ユーザー定義命令
%group
正規表現

%index
regex_match
パターンが文字列全体にマッチするか判定
%prm
pattern, text
%inst
stat=1 でマッチ、stat=0 で不一致。
%sample
	regex_match "^[0-9]+$", "12345"
	mes stat  ; 1
%href
regex_search

%index
regex_search
最初のマッチを検索
%prm
pattern, text
%inst
refstr にマッチ文字列。stat=1 で発見。
%href
regex_match

%index
regex_replace
全置換
%prm
pattern, text, replacement
%inst
refstr に置換結果。stat に置換数。
%href
regex_search

%index
regex_count
マッチ数を返す
%prm
(pattern, text)
%href
regex_find

%index
regex_find
全マッチを列挙
%prm
pattern, text
%inst
stat に件数。regex_get() で取得。
%href
regex_get

%index
regex_get
regex_find の結果を取得
%prm
(index)
%href
regex_find
