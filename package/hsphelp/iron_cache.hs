%dll
; iron_cache In-memory cache
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
Cache

%index
cache_set
Set with TTL
%prm
"key", "val", ttl_sec
%inst

%href
cache_get

%index
cache_get
Get value
%prm
("key")
%inst
Empty if expired
%href
cache_has

%index
cache_has
Check exists
%prm
("key")
%inst
1/0
%href
cache_clear

%index
cache_clear
Clear all
%prm

%inst
