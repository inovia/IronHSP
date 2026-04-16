;
; iron_array2.hsp  HSP3 ヘルプ (日本語)
; 配列ユーティリティ
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
iron_array2.hsp

%url
https://github.com/inovia/IronHSP
%port
Win32 / Win64

%note
Pure HSP

%group
配列

%index
array_reverse
配列を逆順にする
%group
配列
%prm
arr, n

%inst
インプレースで配列を逆順にします。

%href
array_unique

%index
array_unique
重複を除去
%group
配列
%prm
(arr, n)

%inst
重複を除去した後の要素数を返します。

%href
array_count

%index
array_count
値の出現回数
%group
配列
%prm
(arr, n, value)

%inst
配列内で value が出現する回数を返します。

%href
array_indexof

%index
array_indexof
インデックスを検索
%group
配列
%prm
(arr, n, value)

%inst
最初に見つかったインデックスを返します。見つからない場合は -1。

%href
array_sum

%index
array_sum
合計
%group
配列
%prm
(arr, n)

%inst
配列の全要素の合計を返します。

%href
array_min

%index
array_min
最小値
%group
配列
%prm
(arr, n)

%inst
配列の最小値を返します。

%href
array_max

%index
array_max
最大値
%group
配列
%prm
(arr, n)

%inst
配列の最大値を返します。

%href
array_fill

%index
array_fill
値で埋める
%group
配列
%prm
arr, n, value

%inst
配列の全要素を value で埋めます。
