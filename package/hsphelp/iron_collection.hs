;
; iron_collection.hsp  HSP3 ヘルプ (日本語)
; スタック/キュー
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
iron_collection.hsp

%url
https://github.com/inovia/IronHSP
%port
Win32 / Win64

%note
Pure HSP

%group
データ構造

%index
stack_push
スタックにプッシュ
%group
データ構造
%prm
value

%inst
値をスタックの先頭に追加します。

%href
stack_pop

%index
stack_pop
スタックからポップ
%group
データ構造
%prm
()

%inst
スタックの先頭から値を取り出して返します。

%href
stack_peek

%index
stack_peek
スタックの先頭を参照
%group
データ構造
%prm
()

%inst
取り出さずに先頭の値を返します。

%href
stack_size

%index
stack_size
スタックのサイズ
%group
データ構造
%prm
()

%inst
現在のスタックの要素数を返します。

%href
queue_push

%index
queue_push
キューにエンキュー
%group
データ構造
%prm
value

%inst
値をキューの末尾に追加します。

%href
queue_pop

%index
queue_pop
キューからデキュー
%group
データ構造
%prm
()

%inst
キューの先頭から値を取り出して返します。

%href
queue_size

%index
queue_size
キューのサイズ
%group
データ構造
%prm
()

%inst
現在のキューの要素数を返します。
