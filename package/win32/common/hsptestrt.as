;============================================================
;  hsptestrt.as  —  HSP テストランタイム支援プラグイン
;
;  自動テストを書くためのアサート/期待値検証/集計/スクリーンショット
;  などのコマンドを提供する。hsp3_net_test.exe / hsp3cl_net_test.exe と
;  組み合わせて使うと、エラーやアサーション失敗が stderr へ JSON 1 行
;  イベントとして流れる。通常のランタイム (hsp3.exe / hsp3cl.exe) でも
;  ロードできるが、テスト用途では test ランタイムを推奨。
;
;  最低限の例:
;    #include "hsptestrt.as"
;    testrt_begin "simple math"
;      testrt_expect_eq_i 1+2, 3, "1+2 == 3"
;      testrt_expect_eq_i 4*5, 20, "4*5 == 20"
;    testrt_end
;    end testrt_summary
;============================================================

#ifndef __hsptestrt_as__
#define __hsptestrt_as__

#ifdef _HSP64
#uselib "hsptestrt_64.dll"
#else
#uselib "hsptestrt.dll"
#endif

; --- 開始/終了/集計 ---
#func   testrt_begin       "testrt_begin"       str
#func   testrt_end         "testrt_end"
#cfunc  testrt_summary     "testrt_summary"
#cfunc  testrt_pass_count  "testrt_pass_count"
#cfunc  testrt_fail_count  "testrt_fail_count"

; --- アサーション / 期待値 ---
#func   testrt_assert        "testrt_assert"        int, str
#func   testrt_expect_true   "testrt_expect_true"   int, str
#func   testrt_expect_false  "testrt_expect_false"  int, str
#func   testrt_expect_eq_i   "testrt_expect_eq_i"   int, int, str
#func   testrt_expect_ne_i   "testrt_expect_ne_i"   int, int, str
#func   testrt_expect_eq_d   "testrt_expect_eq_d"   double, double, double, str
#func   testrt_expect_eq_s   "testrt_expect_eq_s"   str, str, str
#func   testrt_expect_ne_s   "testrt_expect_ne_s"   str, str, str

; 型拡張: int64 / near / intptr / 配列
#func   testrt_expect_eq_i64    "testrt_expect_eq_i64"    var, var, str
#func   testrt_expect_ne_i64    "testrt_expect_ne_i64"    var, var, str
#func   testrt_expect_near_i    "testrt_expect_near_i"    int, int, int, str
#func   testrt_expect_eq_intptr "testrt_expect_eq_intptr" var, var, str
#func   testrt_expect_array_eq_i "testrt_expect_array_eq_i" var, var, int, str
#func   testrt_expect_array_eq_d "testrt_expect_array_eq_d" var, var, int, double, str

; --- 汎用イベント ---
#func   testrt_trace       "testrt_trace"       str
#func   testrt_emit        "testrt_emit"        str, str

; --- スクリーンショット / 自動入力 ---
#cfunc  testrt_screenshot  "testrt_screenshot"  str, int
#cfunc  testrt_click       "testrt_click"       int, int, int
#cfunc  testrt_key         "testrt_key"         int

; --- 画像比較 (PNG baseline vs current) ---
#cfunc  testrt_image_cmp   "testrt_image_cmp"   str, str, int
#cfunc  testrt_image_diff  "testrt_image_diff"  str, str, str, int
#func   testrt_expect_image_eq "testrt_expect_image_eq" str, str, int, str

#define TESTRT_BUTTON_LEFT    0
#define TESTRT_BUTTON_RIGHT   1
#define TESTRT_BUTTON_MIDDLE  2

#endif
