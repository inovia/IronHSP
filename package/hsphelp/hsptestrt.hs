;
; hsptestrt.hs  HSP3 ヘルプ (日本語)
; テストランタイム支援プラグイン (アサート / スクリーンショット / 自動入力)
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
hsptestrt.dll

%url
https://github.com/inovia/IronHSP
%port
Win32 / Win64

%note
hsptestrt.dll は HSP の自動テスト記述を支援するためのプラグインです。
テスト用ランタイム (hsp3_net_test.exe / hsp3cl_net_test.exe) と組み合わせて
使うと、以下のイベントが stderr に JSON 1 行形式で出力されます。

  start / error / alert / dialog / trace / end            (ランタイム側)
  test_begin / test_end / test_summary / expect_fail /
  screenshot / trace / event                              (本プラグイン)

通常のランタイム (hsp3.exe / hsp3cl.exe) からも同じコマンドで利用でき、
stderr が接続されていなければ静かに黙ります。

------------------------------------------------------------
基本的な使い方
------------------------------------------------------------

  #include "hsptestrt.as"

  testrt_begin "simple math"
    testrt_expect_eq_i 1+2, 3, "1+2 == 3"
    testrt_expect_eq_i 4*5, 20, "4*5 == 20"
  testrt_end

  testrt_begin "strings"
    a = "hello"
    testrt_expect_eq_i strlen(a), 5, "strlen hello"
    testrt_expect_eq_s a, "hello", "verbatim match"
  testrt_end

  end testrt_summary

最後の testrt_summary() は失敗件数を返すので、そのまま end に渡すと
プロセスの終了コードが「失敗件数」になり、CI などから判定しやすくなります。

------------------------------------------------------------
コマンド詳細
------------------------------------------------------------


%index
testrt_begin
テストケース開始
%group
hsptestrt
%prm
name
name: テストケース名 (文字列)
%inst
新しいテストケースを開始します。別のケースが動作中だった場合は暗黙的に
終了処理 (testrt_end 相当) を先に行います。

test_begin イベントが stderr に出力されます。
%sample
testrt_begin "my case"
  ; ... expect 群 ...
testrt_end
%href
testrt_end
testrt_summary


%index
testrt_end
テストケース終了
%group
hsptestrt
%inst
現在動作中のテストケースを終了し、そのケースの pass/fail 件数を
集計イベント (test_end) として stderr に出力します。
%sample
testrt_begin "case A"
  testrt_expect_eq_i 1, 1, "ok"
testrt_end
%href
testrt_begin
testrt_summary


%index
testrt_summary
全体集計を出力し、失敗件数を返す
%group
hsptestrt
%inst
全テストケースの累計 pass/fail 件数を test_summary イベントとして
stderr へ出力し、失敗件数を返します。
未終了のテストケースが残っていれば暗黙的に testrt_end を呼びます。

返り値をそのまま end に渡せば、失敗件数 = プロセス終了コードとなります。
%sample
	end testrt_summary()
%href
testrt_fail_count
testrt_pass_count


%index
testrt_pass_count
合格件数を取得
%group
hsptestrt
%inst
これまでに pass した expect 件数の累計を返します。
%href
testrt_summary
testrt_fail_count


%index
testrt_fail_count
失敗件数を取得
%group
hsptestrt
%inst
これまでに fail した expect 件数の累計を返します。
%href
testrt_summary
testrt_pass_count


%index
testrt_assert
任意条件のアサーション
%group
hsptestrt
%prm
cond, message
cond: 条件式 (0 なら失敗)
message: 失敗時メッセージ
%inst
cond が 0 (偽) の場合、expect_fail イベントを stderr に出力し、
失敗件数を増やします。真のときは pass 扱いです。
%sample
	testrt_assert 1 < 2, "basic truth"
%href
testrt_expect_true
testrt_expect_false


%index
testrt_expect_true
真であることを期待
%group
hsptestrt
%prm
cond, message
cond: 条件式
message: 失敗時メッセージ
%inst
cond が真 (非0) であれば pass、偽であれば fail。
testrt_assert とほぼ同じですが、レポート上のラベルが expect_true になります。
%href
testrt_expect_false
testrt_assert


%index
testrt_expect_false
偽であることを期待
%group
hsptestrt
%prm
cond, message
cond: 条件式
message: 失敗時メッセージ
%inst
cond が 0 (偽) であれば pass、それ以外は fail。
%href
testrt_expect_true


%index
testrt_expect_eq_i
整数値の一致を期待
%group
hsptestrt
%prm
actual, expected, message
actual: 実測値 (int)
expected: 期待値 (int)
message: 失敗時メッセージ
%inst
actual == expected なら pass、それ以外は fail。
detail フィールドに actual と expected の値が出力されます。
%sample
	testrt_expect_eq_i 2+3, 5, "2+3"
%href
testrt_expect_ne_i
testrt_expect_eq_d
testrt_expect_eq_s


%index
testrt_expect_ne_i
整数値の不一致を期待
%group
hsptestrt
%prm
actual, expected, message
%inst
actual != expected なら pass。
%href
testrt_expect_eq_i


%index
testrt_expect_eq_d
実数値の一致を期待 (誤差付き)
%group
hsptestrt
%prm
actual, expected, eps, message
actual: 実測値 (double)
expected: 期待値 (double)
eps: 許容誤差 (|actual-expected| <= eps で pass)
message: 失敗時メッセージ
%inst
浮動小数点の等価判定。eps に 0.0 を渡すと厳密一致。
%sample
	testrt_expect_eq_d 0.1 + 0.2, 0.3, 1.0e-9, "float tolerance"
%href
testrt_expect_eq_i


%index
testrt_expect_eq_s
文字列の一致を期待
%group
hsptestrt
%prm
actual, expected, message
%inst
strcmp(actual, expected) == 0 で pass。
%href
testrt_expect_ne_s


%index
testrt_expect_ne_s
文字列の不一致を期待
%group
hsptestrt
%prm
actual, expected, message
%href
testrt_expect_eq_s


%index
testrt_trace
タグ付きトレースイベント出力
%group
hsptestrt
%prm
tag
tag: 任意のタグ文字列
%inst
stderr に trace イベントを出力します。ロジックの通過を
テスト側から確認したいときに使います。
%sample
	testrt_trace "reached-inner-loop"
%href
testrt_emit


%index
testrt_emit
任意イベントを stderr に出力
%group
hsptestrt
%prm
type, message
type: イベント名 (文字列)
message: メッセージ本文
%inst
{"time":...,"type":<type>,"message":<message>} を stderr に
1 行出力します。独自のイベント種別を記録したいときに使用。
%sample
	testrt_emit "metric", "fps=60"


%index
testrt_screenshot
ウィンドウ内容を PNG に保存
%group
hsptestrt
%prm
path, hwnd
path: 保存先の PNG ファイル名 (UTF-8)
hwnd: 対象ウィンドウハンドル (0 で ForegroundWindow)
%inst
指定ウィンドウのクライアント領域を BitBlt で取得し、PNG として保存します。
screenshot イベントに path / width / height / ok が記録されます。
GUI ランタイムでないと意味がありません。
戻り値は 0 で成功、負値で失敗。
%sample
	testrt_screenshot "out.png", 0
%href
testrt_click
testrt_key


%index
testrt_click
マウスクリックを送信
%group
hsptestrt
%prm
x, y, button
x: スクリーン座標 X
y: スクリーン座標 Y
button: TESTRT_BUTTON_LEFT(=0) / TESTRT_BUTTON_RIGHT(=1) / TESTRT_BUTTON_MIDDLE(=2)
%inst
SetCursorPos + SendInput でクリックを送信します。
%href
testrt_key


%index
testrt_key
仮想キーコードのキー入力を送信
%group
hsptestrt
%prm
vk
vk: Windows 仮想キーコード (VK_RETURN=13 など)
%inst
SendInput で down+up を 1 ペアとしてキー入力を送ります。
