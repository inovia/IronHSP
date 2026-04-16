
;	hspmathex.dll header(3.8)
;	Arbitrary precision decimal arithmetic (Java BigDecimal equivalent)

#ifndef __hspbigdec_as__
#define __hspbigdec_as__

#ifdef hsp3cl_64
#uselib "hspmathex_64.dll"
#else
#ifdef hsp64
#uselib "hspmathex_64.dll"
#else
#uselib "hspmathex.dll"
#endif
#endif

; handle = bigdec_create("3.14159")
#cfunc global bigdec_create             "bigdec_create"             str

; handle = bigdec_create_from_double(3.14, 6)
#cfunc global bigdec_create_from_double "bigdec_create_from_double" double, int

; handle = bigdec_clone(h)
#cfunc global bigdec_clone              "bigdec_clone"              int

; bigdec_free h
#func  global bigdec_free               "bigdec_free"               int

; bigdec_to_str h, sbuf, maxlen
#func  global bigdec_to_str             "bigdec_to_str"             int, var, int
; bigdec_to_plain_str h, sbuf, maxlen
#func  global bigdec_to_plain_str       "bigdec_to_plain_str"       int, var, int

; bigdec_to_double h, dvar
#func  global bigdec_to_double          "bigdec_to_double"          int, var

; handle = bigdec_add(a, b)
#cfunc global bigdec_add                "bigdec_add"                int, int
#cfunc global bigdec_sub                "bigdec_sub"                int, int
#cfunc global bigdec_mul                "bigdec_mul"                int, int
#cfunc global bigdec_div                "bigdec_div"                int, int, int, int
#cfunc global bigdec_pow                "bigdec_pow"                int, int
#cfunc global bigdec_abs                "bigdec_abs"                int
#cfunc global bigdec_neg                "bigdec_neg"                int
#cfunc global bigdec_round              "bigdec_round"              int, int, int
#cfunc global bigdec_scale_             "bigdec_scale"              int, int, int
#cfunc global bigdec_cmp                "bigdec_cmp"                int, int
#cfunc global bigdec_get_scale          "bigdec_get_scale"          int
#cfunc global bigdec_get_precision      "bigdec_get_precision"      int
#cfunc global bigdec_sqrt               "bigdec_sqrt"               int, int

; Rounding modes
#define global BIGDEC_HALF_UP    0
#define global BIGDEC_HALF_EVEN  1
#define global BIGDEC_DOWN       2
#define global BIGDEC_UP         3
#define global BIGDEC_FLOOR      4
#define global BIGDEC_CEILING    5

#endif
