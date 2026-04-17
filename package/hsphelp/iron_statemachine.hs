%dll
; iron_statemachine Finite state machine
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
Pattern

%index
sm_add_state
Add state
%prm
"name"
%inst
stat=state_id
%href
sm_set_state

%index
sm_set_state
Set current
%prm
state_id
%inst

%href
sm_get_state

%index
sm_get_state
Get current
%prm
()
%inst
state_id
%href
sm_state_name

%index
sm_state_name
Current name
%prm
()
%inst

%href
sm_add_transition

%index
sm_add_transition
Add transition
%prm
from, "event", to
%inst

%href
sm_fire

%index
sm_fire
Fire event
%prm
"event"
%inst
stat=0 if transitioned