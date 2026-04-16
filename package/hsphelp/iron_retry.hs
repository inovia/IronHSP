;
; iron_retry.hsp  HSP3 ヘルプ (日本語)
; リトライ (バックオフ付き)
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
iron_retry.hsp

%url
https://github.com/inovia/IronHSP
%port
Win32 / Win64

%note
Pure HSP

%group
耐障害

%index
retry_exec
失敗時にリトライ実行
%group
耐障害
%prm
max, delay_ms, *label

%inst
最大 max 回、delay_ms ミリ秒間隔でリトライします。
stat = 0 で成功。

%href
retry_attempts

%index
retry_attempts
試行回数を取得
%group
耐障害
%prm
()

%inst
最後のリトライの試行回数を返します。
