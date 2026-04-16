;
; iron_str2.hsp  HSP3 ヘルプ (日本語)
; 文字列ユーティリティ
;

%type
拡張命令
%ver
3.8
%date
2026/04/17
%author
IronHSP
%dll
iron_str2.hsp

%url
https://github.com/inovia/IronHSP
%port
Win32 / Win64

%note
Pure HSP

%group
文字列

%index
str_starts_with
前方一致
%group
文字列
%prm
(s, prefix)

%inst
文字列 s が prefix で始まる場合 1 を返します。

%href
str_ends_with

%index
str_ends_with
後方一致
%group
文字列
%prm
(s, suffix)

%inst
文字列 s が suffix で終わる場合 1 を返します。

%href
str_repeat

%index
str_repeat
文字列を繰り返す
%group
文字列
%prm
(s, n)

%inst
文字列 s を n 回繰り返した文字列を返します。
例: str_repeat("ab", 3) = "ababab"

%href
str_pad_left

%index
str_pad_left
左パディング
%group
文字列
%prm
(s, width, pad)

%inst
文字列を指定幅まで左側に pad で埋めます。

%href
str_pad_right

%index
str_pad_right
右パディング
%group
文字列
%prm
(s, width, pad)

%inst
文字列を指定幅まで右側に pad で埋めます。

%href
str_count

%index
str_count
部分文字列の出現回数
%group
文字列
%prm
(s, sub)

%inst
文字列 s 内で sub が出現する回数を返します。

%href
str_trim

%index
str_trim
空白をトリム
%group
文字列
%prm
(s)

%inst
先頭と末尾の空白文字を除去します。

%href
str_upper

%index
str_upper
大文字に変換
%group
文字列
%prm
(s)

%inst
ASCII 英小文字を大文字に変換します。

%href
str_lower

%index
str_lower
小文字に変換
%group
文字列
%prm
(s)

%inst
ASCII 英大文字を小文字に変換します。

%href
str_contains

%index
str_contains
部分文字列を含むか
%group
文字列
%prm
(s, sub)

%inst
文字列 s が sub を含む場合 1 を返します。

%href
str_replace

%index
str_replace
全置換
%group
文字列
%prm
(s, old, new)

%inst
文字列 s 内の old を全て new に置換します。
