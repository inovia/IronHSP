;============================================================
;  hspmathex.as  —  拡張数値演算プラグイン
;
;  大きく 2 つの機能を提供する:
;
;    (1) HSPVAR 拡張型  (hsp3cmdinit 経由)
;        bigint  … 任意精度整数        (Java の BigInteger 相当)
;        bigdec  … 任意精度10進固定小数 (Java の BigDecimal 相当)
;
;    (2) ハンドルベース API (#uselib 経由)
;        bi_*       … BigInt ハンドル操作 (create/clone/add/mul/...)
;        bigdec_*   … BigDecimal ハンドル操作 (create/add/div/sqrt/...)
;        simd_*     … SIMD (AVX2) ベクトル演算
;
;  使い方 (HSPVAR 拡張):
;    #include "hspmathex.as"
;    a = bigint("12345678901234567890")
;    b = bigint("99999999999999999999")
;    c = a + b
;    mes str(c)
;    mes vartype(a)            ; => "bigint"
;
;  DLL: hspmathex.dll (Win32) / hspmathex_64.dll (x64)
;============================================================

#ifndef __hspmathex_as__
#define __hspmathex_as__

;------------------------------------------------------------
;  (1) HSPVAR 拡張型 — bigint / bigdec
;------------------------------------------------------------

#ifdef _HSP64
#regcmd "_hsp3cmdinit@4","hspmathex_64.dll",1
#else
#regcmd "_hsp3cmdinit@4","hspmathex.dll",1
#endif

; reffunc のサブコマンド番号は hspmathex_main.cpp の switch と揃える
#cmd bigint $00
#cmd bigdec $01

;------------------------------------------------------------
;  (2) ハンドルベース API
;------------------------------------------------------------

#ifdef _HSP64
#uselib "hspmathex_64.dll"
#else
#uselib "hspmathex.dll"
#endif

; ---- BigInt (ハンドル) ----
#cfunc bi_create_int "bigint_create_int" int
#cfunc bi_create_int64_split "bigint_create_int64_split" int, int
#cfunc bi_create_str "bigint_create_str" str
#cfunc bi_clone "bigint_clone" int
#func  bi_free "bigint_free" int
#func  bi_to_str "bigint_to_str" int, var, int
#func  bi_to_hex "bigint_to_hex" int, var, int
#func  bi_to_int64 "bigint_to_int64" int, var
#func  bi_to_int64_split "bigint_to_int64_split" int, var, var
#cfunc bi_to_int32 "bigint_to_int32" int
#cfunc bi_add "bigint_add" int, int
#cfunc bi_sub "bigint_sub" int, int
#cfunc bi_mul "bigint_mul" int, int
#cfunc bi_div "bigint_div" int, int
#cfunc bi_mod "bigint_mod" int, int
#cfunc bi_and "bigint_and" int, int
#cfunc bi_or  "bigint_or"  int, int
#cfunc bi_xor "bigint_xor" int, int
#cfunc bi_pow "bigint_pow" int, int
#cfunc bi_gcd "bigint_gcd" int, int
#cfunc bi_abs "bigint_abs" int
#cfunc bi_neg "bigint_neg" int
#cfunc bi_cmp "bigint_cmp" int, int
#cfunc bi_shl "bigint_shl" int, int
#cfunc bi_shr "bigint_shr" int, int
#cfunc bi_bitlen "bigint_bitlen" int

; ---- BigDecimal (ハンドル) ----
#cfunc bigdec_create "bigdec_create" str
#cfunc bigdec_create_from_double "bigdec_create_from_double" double, int
#cfunc bigdec_clone "bigdec_clone" int
#func  bigdec_free "bigdec_free" int
#func  bigdec_to_str "bigdec_to_str" int, var, int
#func  bigdec_to_plain_str "bigdec_to_plain_str" int, var, int
#func  bigdec_to_double "bigdec_to_double" int, var
#cfunc bigdec_add "bigdec_add" int, int
#cfunc bigdec_sub "bigdec_sub" int, int
#cfunc bigdec_mul "bigdec_mul" int, int
#cfunc bigdec_div "bigdec_div" int, int, int, int
#cfunc bigdec_pow "bigdec_pow" int, int
#cfunc bigdec_abs "bigdec_abs" int
#cfunc bigdec_neg "bigdec_neg" int
#cfunc bigdec_round "bigdec_round" int, int, int
#cfunc bigdec_scale "bigdec_scale" int, int, int
#cfunc bigdec_cmp "bigdec_cmp" int, int
#cfunc bigdec_get_scale "bigdec_get_scale" int
#cfunc bigdec_get_precision "bigdec_get_precision" int
#cfunc bigdec_sqrt "bigdec_sqrt" int, int

; 丸めモード
#define BIGDEC_HALF_UP    0
#define BIGDEC_HALF_EVEN  1
#define BIGDEC_DOWN       2
#define BIGDEC_UP         3
#define BIGDEC_FLOOR      4
#define BIGDEC_CEILING    5

#endif
