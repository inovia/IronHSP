;============================================================
;  hspsimd.as — SSE/AVX SIMD 配列演算プラグイン
;
;  int/double/float 配列への SIMD (AVX2 > SSE2 > scalar) 演算。
;  CPU 機能検出はロード時に実施され、ベスト実装を自動選択。
;============================================================
#ifndef __hspsimd_as__
#define __hspsimd_as__

#ifdef hsp3cl_64
#uselib "hspmathex_64.dll"
#else
#ifdef hsp64
#uselib "hspmathex_64.dll"
#else
#uselib "hspmathex.dll"
#endif
#endif

; ---- Capability detection --------------------------------
#cfunc global simd_has_sse      "simd_has_sse"
#cfunc global simd_has_sse2     "simd_has_sse2"
#cfunc global simd_has_avx      "simd_has_avx"
#cfunc global simd_has_avx2     "simd_has_avx2"
#cfunc global simd_has_avx512   "simd_has_avx512"
#func  global simd_cpu_name     "simd_cpu_name" var, int

; ---- double array ops ------------------------------------
; simd_add_d(a*, b*, out*, n)
#func global simd_add_d    "simd_add_d"    int, int, int, int
#func global simd_sub_d    "simd_sub_d"    int, int, int, int
#func global simd_mul_d    "simd_mul_d"    int, int, int, int
#func global simd_div_d    "simd_div_d"    int, int, int, int
; simd_scale_d(a*, scalar, out*, n)
#func global simd_scale_d  "simd_scale_d"  int, double, int, int
; simd_dot_d(a*, b*, n, result*)
#func global simd_dot_d    "simd_dot_d"    int, int, int, int
#func global simd_sum_d    "simd_sum_d"    int, int, int
#func global simd_min_d    "simd_min_d"    int, int, int
#func global simd_max_d    "simd_max_d"    int, int, int
#func global simd_abs_d    "simd_abs_d"    int, int, int
#func global simd_sqrt_d   "simd_sqrt_d"   int, int, int

; ---- int32 array ops -------------------------------------
#func global simd_add_i    "simd_add_i"    int, int, int, int
#func global simd_sub_i    "simd_sub_i"    int, int, int, int
#func global simd_mul_i    "simd_mul_i"    int, int, int, int
#func global simd_sum_i    "simd_sum_i"    int, int, int
#func global simd_min_i    "simd_min_i"    int, int, int
#func global simd_max_i    "simd_max_i"    int, int, int
#func global simd_and_i    "simd_and_i"    int, int, int, int
#func global simd_or_i     "simd_or_i"     int, int, int, int
#func global simd_xor_i    "simd_xor_i"    int, int, int, int

; ---- float32 array ops -----------------------------------
#func global simd_add_f    "simd_add_f"    int, int, int, int
#func global simd_dot_f    "simd_dot_f"    int, int, int, int
#func global simd_sum_f    "simd_sum_f"    int, int, int

; ---- matrix operations -----------------------------------
; simd_matmul_f(A*, B*, C*, m, n, k)   C(mxk) = A(mxn) * B(nxk)
#func global simd_matmul_f "simd_matmul_f" int, int, int, int, int, int
#func global simd_matmul_d "simd_matmul_d" int, int, int, int, int, int

; ---- image / pixel ops -----------------------------------
; simd_pixel_blend(a*, b*, out*, n_bytes, alpha)
#func global simd_pixel_blend     "simd_pixel_blend"     int, int, int, int, float
; simd_pixel_grayscale(rgba*, out*, n_bytes)
#func global simd_pixel_grayscale "simd_pixel_grayscale" int, int, int

#endif
