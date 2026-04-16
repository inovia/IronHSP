;
; iron_combinatorics.hsp  HSP3 ヘルプ (日本語)
; 組み合わせ論
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
iron_combinatorics.hsp

%url
https://github.com/inovia/IronHSP
%port
Win32 / Win64

%note
Pure HSP

%group
数学

%index
factorial
階乗 n!
%group
数学
%prm
(n)

%inst
n の階乗を返します。

%href
combination

%index
combination
組み合わせ nCr
%group
数学
%prm
(n, r)

%inst
n 個から r 個を選ぶ組み合わせ数を返します。

%href
permutation

%index
permutation
順列 nPr
%group
数学
%prm
(n, r)

%inst
n 個から r 個を並べる順列数を返します。

%href
gcd

%index
gcd
最大公約数
%group
数学
%prm
(a, b)

%inst
ユークリッドの互除法で最大公約数を求めます。

%href
lcm

%index
lcm
最小公倍数
%group
数学
%prm
(a, b)

%inst
最小公倍数を返します。

%href
is_prime

%index
is_prime
素数判定
%group
数学
%prm
(n)

%inst
素数なら 1、そうでなければ 0 を返します。
