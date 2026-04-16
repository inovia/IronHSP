%dll
; iron_log ログ出力
%ver
3.8
%date
2026/04/17
%author
IronHSP
%note
iron_datetime.hsp が必要。外部DLL不要。
%type
ユーザー定義命令
%group
デバッグ

%index
log_init
ログ出力を初期化
%prm
"filepath", level
filepath : ログファイルパス ("" でコンソールのみ)
level : LOGLV_DEBUG(0) / LOGLV_INFO(1) / LOGLV_WARN(2) / LOGLV_ERROR(3)
%inst
ログ出力を初期化します。level 以上のメッセージのみ出力。
%sample
	log_init "", LOGLV_INFO
	log_info "application started"
%href
log_debug

%index
log_debug
DEBUGレベルログ
%prm
"msg"
%href
log_info

%index
log_info
INFOレベルログ
%prm
"msg"
%href
log_warn

%index
log_warn
WARNレベルログ
%prm
"msg"
%href
log_error

%index
log_error
ERRORレベルログ
%prm
"msg"
%href
log_init

%index
log_set_level
ログレベルを変更
%prm
level
%href
log_init
