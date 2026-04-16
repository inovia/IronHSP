%dll
; iron_strbuf 高速文字列ビルダー
%ver
3.8
%date
2026/04/16
%author
IronHSP
%note
純HSP実装。外部DLL不??。
%type
ユーザー定義命令
%group
文字列操作

%index
sb_init
初期化
%prm
capacity
%inst
capacity=0 でデフォルト 64KB。
%href
sb_append

%index
sb_append
文字列を追加
%prm
"text"
%inst
高速な文字列結合。
%href
sb_appendln

%index
sb_appendln
文字列+改行を追加
%prm
"text"
%inst

%href
sb_tostr

%index
sb_tostr
結合結果を返す
%prm
()
%inst

%href
sb_length

%index
sb_length
現在の長さを返す
%prm
()
%inst

%href
sb_clear

%index
sb_clear
クリア
%prm

%inst

