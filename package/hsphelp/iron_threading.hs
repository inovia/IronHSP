;
; iron_threading.hsp  HSP3 ヘルプ (日本語)
; スレッド (.NET版)
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
iron_threading.hsp

%url
https://github.com/inovia/IronHSP
%port
Win32 / Win64

%note
hsp3net 専用

%group
システム

%index
thread_run
バックグラウンド実行
%group
システム
%prm
*label

%inst


%href
thread_is_done

%index
thread_is_done
完了確認
%group
システム
%prm
(task_id)

%inst
1=完了, 0=実行中

%href
thread_result

%index
thread_result
結果取得
%group
システム
%prm
(task_id)

%inst
結果文字列を返す。

%href
thread_sleep

%index
thread_sleep
スリープ
%group
システム
%prm
ms

%inst


%href
thread_run_cs

%index
thread_run_cs
C# コード実行
%group
システム
%prm
"code", var_result

%inst
スレッドプールで C# 実行。
