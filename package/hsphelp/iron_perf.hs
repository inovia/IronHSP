;
; iron_perf.hsp  HSP3 ヘルプ (日本語)
; QueryPerformanceCounter ベース高精度タイマー
;

%type
拡張命令
%ver
1.0
%date
2026-04-13
%author
IronHSP / iron_perf
%dll
iron_perf.hsp

%url
https://github.com/inovia/IronHSP
%port
Win32 / Win64

%note
iron_perf.hsp は QueryPerformanceCounter / QueryPerformanceFrequency
によるサブミリ秒精度のタイマーです。プロファイリング、FPS 計測、
ベンチマーク等に使用します。

timeGetTime (winmm) は ms 精度で OS タイマー依存ですが、
QueryPerformanceCounter は CPU の高精度カウンタ (~100ns) を使います。

  #include "iron_perf.hsp"

%group
iron_perf (高精度タイマー)

%index
perf_now
現在の経過秒を取得
%group
iron_perf
%prm

%inst
refdval に経過秒 (起動からの相対値) を書き込みます。

%index
perf_now_us
現在のマイクロ秒を取得
%group
iron_perf
%prm

%inst
stat にマイクロ秒 (32bit 範囲、約 70 分でラップ) を書き込みます。

%index
perf_start
ストップウォッチ開始
%group
iron_perf
%prm

%inst
内部カウンタを現在の QPC 値で初期化します。

%index
perf_lap
ストップウォッチ経過時間
%group
iron_perf
%prm

%inst
refdval に開始からの経過秒を書き込みます。

例:
  perf_start
  repeat 1000000 : a = cnt * 2 : loop
  perf_lap
  mes "elapsed: " + refdval + " 秒"

%index
perf_freq
QPC の周波数 (Hz) を取得
%group
iron_perf
%prm

%inst
refdval に Hz を書き込みます。
