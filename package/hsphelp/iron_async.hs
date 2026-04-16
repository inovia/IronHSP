%dll
; iron_async Async/C# script
%ver
3.8
%date
2026/04/17
%author
IronHSP
%note
hsp3net
%type
User command
%group
Async

%index
cs_eval
Execute C# code
%prm
"code"
%inst
refstr=result
%href
async_run

%index
async_run
Background exec
%prm
"code"
%inst

%href
async_is_busy

%index
async_is_busy
Check running
%prm
()
%inst
1=busy
%href
async_result

%index
async_result
Get result
%prm
()
%inst
