;
; iron_cache.hsp  HSP3 ヘルプ (日本語)
; インメモリキャッシュ
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
iron_cache.hsp

%url
https://github.com/inovia/IronHSP
%port
Win32 / Win64

%note
Pure HSP

%group
キャッシュ

%index
cache_set
TTL付きで値を設定
%group
キャッシュ
%prm
"key", "val", ttl_sec

%inst
キーと値を TTL (秒) 付きで保存します。

%href
cache_get

%index
cache_get
値を取得
%group
キャッシュ
%prm
("key")

%inst
有効期限切れの場合は空文字を返します。

%href
cache_has

%index
cache_has
キーが存在するか
%group
キャッシュ
%prm
("key")

%inst
有効なキーが存在する場合 1 を返します。

%href
cache_clear

%index
cache_clear
全キャッシュをクリア
%group
キャッシュ
%prm


%inst
全てのキャッシュエントリを削除します。
