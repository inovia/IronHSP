;
; iron_bloom.hsp  HSP3 ヘルプ (日本語)
; ブルームフィルタ
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
iron_bloom.hsp

%url
https://github.com/inovia/IronHSP
%port
Win32 / Win64

%note
Pure HSP

%group
データ構造

%index
bloom_init
初期化
%group
データ構造
%prm
size

%inst
ビット配列のサイズを指定して初期化します (デフォルト 8192)。

%href
bloom_add

%index
bloom_add
要素を追加
%group
データ構造
%prm
"item"

%inst
ブルームフィルタに要素を追加します。

%href
bloom_contains

%index
bloom_contains
要素が含まれる可能性
%group
データ構造
%prm
("item")

%inst
1 = 含まれる可能性あり、0 = 確実に含まれない
