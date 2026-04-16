%dll
; iron_stat 統計関数
%ver
3.8
%date
2026/04/16
%author
IronHSP
%note
純 HSP 実装。外部 DLL 不要。
%type
ユーザー定義関数
%group
統計関数

%index
stat_sum
配列の合計を返す
%prm
(arr, n)
arr : int/double 配列
n   : 要素数 (0=length自動)
%inst
配列の全要素の合計を double で返します。
%href
stat_mean
stat_min
stat_max

%index
stat_mean
配列の平均を返す
%prm
(arr, n)
%inst
算術平均を double で返します。
%href
stat_sum
stat_median

%index
stat_median
配列の中央値を返す
%prm
(arr, n)
%inst
ソートした配列の中央値を double で返します。偶数個の場合は中央 2 値の平均。
%href
stat_mean

%index
stat_variance
配列の母分散を返す
%prm
(arr, n)
%inst
母分散を double で返します。
%href
stat_stddev

%index
stat_stddev
配列の母標準偏差を返す
%prm
(arr, n)
%inst
母標準偏差を double で返します。
%href
stat_variance

%index
stat_min
配列の最小値を返す
%prm
(arr, n)
%href
stat_max

%index
stat_max
配列の最大値を返す
%prm
(arr, n)
%href
stat_min

%index
stat_range
配列の範囲 (max-min) を返す
%prm
(arr, n)
%href
stat_min
stat_max

%index
stat_percentile
パーセンタイルを計算
%prm
arr, n, p
arr : 配列
n   : 要素数
p   : パーセンタイル (0.0~100.0)
%inst
p パーセンタイル値を refdval に格納します。
%href
stat_median

%index
stat_describe
概要統計を出力
%prm
arr, n
%inst
count/sum/mean/stddev/min/25%/median/75%/max を mes で出力します。
%href
stat_mean
