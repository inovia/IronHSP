;
; iron_kmeans.hsp  HSP3 ヘルプ (日本語)
; K-means クラスタリング
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
iron_kmeans.hsp

%url
https://github.com/inovia/IronHSP
%port
Win32 / Win64

%note
Pure HSP

%group
AI

%index
kmeans_cluster
2Dポイントをクラスタリング
%group
AI
%prm
x, y, n, k, labels

%inst
n個の2D座標 (x, y) を k 個のクラスタに分類します。
labels にクラスタIDが格納されます。
