;============================================================
;   mod_getenv.as  — DEPRECATED: 内蔵 getenv / setenv / hasenv /
;                    delenv 命令に置き換えられました
;
;   IronHSP では getenv が組み込み命令として提供されるため、この
;   モジュール版 getenv は不要になりました。後方互換のため空実装に
;   しています (#include しても何もしない)。
;
;   旧:  #include "mod_getenv.as"
;        getenv buf, "PATH"
;
;   新 (標準):
;        getenv buf, "PATH"
;
;   (#include 不要、使い方は同一)
;============================================================

#ifndef __mod_getenv_as__
#define __mod_getenv_as__
; 組み込み getenv と衝突するので #deffunc getenv は削除。
#endif
