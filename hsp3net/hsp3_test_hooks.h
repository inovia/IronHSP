//
//  hsp3_test_hooks.h
//  HSP3 test runtime hooks (HSP_TEST_MODE limited)
//
//  HSP_TEST_MODE 定義時のみコンパイルされる。通常のランタイムには一切
//  影響を与えない。テスト用ランタイム (hsp3_net_test.exe / hsp3cl_net_test.exe)
//  はエラー発生時のモーダルダイアログを抑止し、stderr へ JSON 1 行イベントを
//  出力する。
//
#ifndef HSP3_TEST_HOOKS_H
#define HSP3_TEST_HOOKS_H

#ifdef HSP_TEST_MODE

#ifdef __cplusplus
extern "C" {
#endif

// 起動直後に呼ぶ。exe 名と引数を "start" イベントとして stderr に出す。
void hsptest_init(const char* exe_name, const char* cmdline);

// エラー情報を構造化して stderr へ出す。exit code も 1 にセットされる。
void hsptest_emit_error(int err_code, int line_no, const char* fname, const char* message);

// Alert()/Alertf() 用。モーダルダイアログの代わり。
void hsptest_emit_alert(const char* message);

// dialog 命令を抑止。IDOK(=1) か IDYES(=6) を返す (flag 内容で分岐)。
int hsptest_emit_dialog(int flag, const char* caption, const char* text);

// hsptest_trace 命令 (将来拡張) / ユーザー定義通過ポイント
void hsptest_emit_trace(const char* tag, int line_no);

// ランタイム終了時の "end" イベント。
void hsptest_emit_end(int exit_code);

// exit code getter / setter。非 0 なら失敗扱い。
int  hsptest_get_exit_code(void);
void hsptest_set_exit_code(int code);

// カバレッジ計測フック。バイトコード dispatch ループから per-step で呼ぶ。
// HSPTEST_COV_FILE 環境変数が設定されていなければ最初の呼び出しで
// disable フラグを立てて以降 no-op になる。
//   current_line: 現在の source 行 (code_getdebug_line() の戻り値)
//   current_file: 現在の source ファイル名 (code_getdebug_name() の戻り値)
void hsptest_coverage_tick(int current_line, const char* current_file);

// テスト終了時にカバレッジを flush する (MEMORY.md に書き出す)。
void hsptest_coverage_flush(void);

#ifdef __cplusplus
}
#endif

#endif // HSP_TEST_MODE
#endif // HSP3_TEST_HOOKS_H
