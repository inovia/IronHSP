%dll
; iron_bloom Bloom filter
%ver
3.8
%date
2026/04/17
%author
IronHSP
%note
Pure HSP
%type
User command
%group
Data structure

%index
bloom_init
Initialize
%prm
size
%inst
Default 8192 bits
%href
bloom_add

%index
bloom_add
Add item
%prm
"item"
%inst

%href
bloom_contains

%index
bloom_contains
May contain?
%prm
("item")
%inst
1=maybe, 0=definitely not