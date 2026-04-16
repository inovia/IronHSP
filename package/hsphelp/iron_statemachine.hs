;
; iron_statemachine.hsp  HSP3 ヘルプ (日本語)
; 有限状態マシン
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
iron_statemachine.hsp

%url
https://github.com/inovia/IronHSP
%port
Win32 / Win64

%note
Pure HSP

%group
パターン

%index
sm_add_state
状態を追加
%group
パターン
%prm
"name"

%inst
stat に state_id が返ります。

%href
sm_set_state

%index
sm_set_state
現在の状態を設定
%group
パターン
%prm
state_id

%inst
指定した状態IDに遷移します。

%href
sm_get_state

%index
sm_get_state
現在の状態IDを取得
%group
パターン
%prm
()

%inst
現在の状態IDを返します。

%href
sm_state_name

%index
sm_state_name
現在の状態名を取得
%group
パターン
%prm
()

%inst
現在の状態の名前を返します。

%href
sm_add_transition

%index
sm_add_transition
遷移を追加
%group
パターン
%prm
from, "event", to

%inst
状態 from からイベント "event" で状態 to に遷移する規則を追加します。

%href
sm_fire

%index
sm_fire
イベントを発火
%group
パターン
%prm
"event"

%inst
stat = 0 で遷移成功。
