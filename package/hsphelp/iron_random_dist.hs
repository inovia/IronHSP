;
; iron_random_dist.hsp  HSP3 ヘルプ (日本語)
; 確率分布乱数
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
iron_random_dist.hsp

%url
https://github.com/inovia/IronHSP
%port
Win32 / Win64

%note
Pure HSP

%group
数学

%index
rand_normal
正規分布
%group
数学
%prm
(mean, stddev)

%inst
Box-Muller 法で正規分布の乱数を返します。

%href
rand_exponential

%index
rand_exponential
指数分布
%group
数学
%prm
(lambda)

%inst
指数分布の乱数を返します。

%href
rand_poisson

%index
rand_poisson
ポアソン分布
%group
数学
%prm
(lambda)

%inst
ポアソン分布の乱数を返します。

%href
rand_uniform

%index
rand_uniform
一様分布 (実数)
%group
数学
%prm
(min, max)

%inst
[min, max) の一様分布の乱数を返します。
