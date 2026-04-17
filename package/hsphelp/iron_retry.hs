%dll
; iron_retry Retry with backoff
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
Resilience

%index
retry_exec
Retry on failure
%prm
max, delay_ms, *label
%inst
stat=0 success
%href
retry_attempts

%index
retry_attempts
Attempt count
%prm
()
%inst
