;
; iron_event.hsp  HSP3 ヘルプ (日本語)
; イベントエミッター
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
iron_event.hsp

%url
https://github.com/inovia/IronHSP
%port
Win32 / Win64

%note
Pure HSP

%group
パターン

%index
event_on
イベントを購読
%group
パターン
%prm
"name", *label

%inst
指定イベント名に対してラベルを登録します。

%href
event_emit

%index
event_emit
イベントを発火
%group
パターン
%prm
"name"

%inst
登録された全てのリスナーを呼び出します。
