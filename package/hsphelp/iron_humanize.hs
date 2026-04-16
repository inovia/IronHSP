;
; iron_humanize.hsp  HSP3 ヘルプ (日本語)
; 人間にやさしい書式変換
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
iron_humanize.hsp

%url
https://github.com/inovia/IronHSP
%port
Win32 / Win64

%note
Pure HSP

%group
書式

%index
humanize_bytes
バイト数を読みやすく
%group
書式
%prm
(bytes)

%inst
例: 2621440 → "2.5 MB"

%href
humanize_seconds

%index
humanize_seconds
秒数を読みやすく
%group
書式
%prm
(sec)

%inst
例: 3661 → "1 hr 30 min"

%href
humanize_number

%index
humanize_number
数値にカンマ区切り
%group
書式
%prm
(n)

%inst
例: 1234567 → "1,234,567"

%href
humanize_percent

%index
humanize_percent
パーセンテージ表示
%group
書式
%prm
(value, total)

%inst
例: (3, 4) → "75.0%"
