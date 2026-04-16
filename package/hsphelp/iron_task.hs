%dll
; iron_task タスクスケジューラ
%ver
3.8
%date
2026/04/16
%author
IronHSP
%note
schtasks.exe ラッパー。
%type
ユーザー定義命令
%group
システム

%index
task_create
タスクを作成
%prm
"name", "command", "schedule"
%inst
schedule: DAILY/WEEKLY/ONCE 等
%href
task_delete

%index
task_delete
タスクを削除
%prm
"name"
%inst

%href
task_run

%index
task_run
タ???クを即実行
%prm
"name"
%inst

