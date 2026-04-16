%dll
; iron_log ログ出力
%ver
3.8
%date
2026/04/16
%author
IronHSP
%note
iron_datetime.hspが必要。
%type
ユーザー定義命令
%group
デバッグ

%index
log_init
ログ初期化
%prm
"filepath", level
%inst
LOG_DEBUG/INFO/WARN/ERROR
%href
log_debug

%index
log_debug
DEBUGログ
%prm
"msg"
%inst

%href
log_info

%index
log_info
INFOログ
%prm
"msg"
%inst

%href
log_warn

%index
log_warn
WARNログ
%prm
"msg"
%inst

%href
log_error

%index
log_error
ERRORログ
%prm
"msg"
%inst

%href
log_set_level

%index
log_set_level
ログレベル変更
%prm
level
%inst

