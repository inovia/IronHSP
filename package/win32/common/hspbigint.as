;============================================================
;  hspbigint.as — 任意精度整数プラグイン宣言
;
;  bigint_xxx 系のエクスポートを HSP から typed #func/#cfunc 形式で
;  呼び出す。値 0 は "無効ハンドル" を意味する (bigint_create_* 失敗時)。
;
;  DLL: hspmathex.dll (Win32) / hspmathex_64.dll (x64)
;============================================================

#ifndef __hspbigint_as__
#define __hspbigint_as__

#uselib "hspmathex.dll"

; --- 作成系 (cfunc) ---
; HSP の int は 32bit。64bit 値は create_int64 (lo, hi) 又は
; 文字列版 bigint_create_str を用いる。
#cfunc  global  bigint_create_int    "bigint_create_int"         int
#cfunc  global  bigint_create_int64  "bigint_create_int64_split" int, int
#cfunc  global  bigint_create_str    "bigint_create_str"         str
#cfunc  global  bigint_clone         "bigint_clone"              int
#func   global  bigint_free          "bigint_free"               int

; --- 取得系 ---
#func   global  bigint_to_str        "bigint_to_str"             int, var, int
#func   global  bigint_to_hex        "bigint_to_hex"             int, var, int
#func   global  bigint_to_int64      "bigint_to_int64_split"     int, var, var
#cfunc  global  bigint_to_int32      "bigint_to_int32"           int

; --- 算術 (cfunc: 新ハンドルを返す) ---
#cfunc  global  bigint_add         "bigint_add"         int, int
#cfunc  global  bigint_sub         "bigint_sub"         int, int
#cfunc  global  bigint_mul         "bigint_mul"         int, int
#cfunc  global  bigint_div         "bigint_div"         int, int
#cfunc  global  bigint_mod         "bigint_mod"         int, int
#cfunc  global  bigint_pow         "bigint_pow"         int, int
#cfunc  global  bigint_gcd         "bigint_gcd"         int, int
#cfunc  global  bigint_abs         "bigint_abs"         int
#cfunc  global  bigint_neg         "bigint_neg"         int

; --- 比較 ---
#cfunc  global  bigint_cmp         "bigint_cmp"         int, int

; --- ビット演算 ---
#cfunc  global  bigint_shl         "bigint_shl"         int, int
#cfunc  global  bigint_shr         "bigint_shr"         int, int
#cfunc  global  bigint_and         "bigint_and"         int, int
#cfunc  global  bigint_or          "bigint_or"          int, int
#cfunc  global  bigint_xor         "bigint_xor"         int, int
#cfunc  global  bigint_bitlen      "bigint_bitlen"      int

#endif
