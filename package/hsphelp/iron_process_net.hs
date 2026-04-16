;
; iron_process_net.hsp  HSP3 ヘルプ (日本語)
; プロセス実行 (.NET版)
;

%type
拡張命令
%ver
3.8
%date
2026/04/18
%author
IronHSP
%dll
iron_process_net.hsp

%url
https://github.com/inovia/IronHSP
%port
Win32 / Win64

%note
hsp3net 専用

%group
システム

%index
procn_exec
コマンド実行
%group
システム
%prm
"cmd", var_stdout, var_exitcode

%inst
stdout キャプチャ同期実行。

%href
procn_exec_async

%index
procn_exec_async
非同期実行
%group
システム
%prm
"cmd"

%inst
stat に PID。

%href
procn_exec_stdin

%index
procn_exec_stdin
stdin 付き実行
%group
システム
%prm
"cmd", "input", var_stdout

%inst
stdin にデータを送って実行。

%href
procn_kill

%index
procn_kill
プロセス強制終了
%group
システム
%prm
pid

%inst


%href
procn_is_running

%index
procn_is_running
実行中確認
%group
システム
%prm
pid

%inst
1=実行中, 0=終了済み
