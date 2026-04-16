;
; iron_test.hsp  HSP3 ヘルプ (日本語)
; ユニットテストフレームワーク
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
iron_test.hsp

%url
https://github.com/inovia/IronHSP
%port
Win32 / Win64

%note
Pure HSP

%group
テスト

%index
test_begin
テストスイートを開始
%group
テスト
%prm
"name"

%inst
テストスイートの名前を指定して開始します。

%href
assert_eq

%index
assert_eq
等値アサーション
%group
テスト
%prm
actual, expected, "msg"

%inst
actual と expected が等しいことを確認します。

%href
assert_ne

%index
assert_ne
非等値アサーション
%group
テスト
%prm
actual, notexpected, "msg"

%inst
actual と notexpected が異なることを確認します。

%href
assert_true

%index
assert_true
真アサーション
%group
テスト
%prm
cond, "msg"

%inst
cond が真 (非0) であることを確認します。

%href
assert_false

%index
assert_false
偽アサーション
%group
テスト
%prm
cond, "msg"

%inst
cond が偽 (0) であることを確認します。

%href
test_end

%index
test_end
テストスイートを終了
%group
テスト
%prm


%inst
テスト結果のサマリー (合格/不合格数) を表示します。

%href
test_passed

%index
test_passed
全テスト合格?
%group
テスト
%prm
()

%inst
全テストが合格した場合 1 を返します。
