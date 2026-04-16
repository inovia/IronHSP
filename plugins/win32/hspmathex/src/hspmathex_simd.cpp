//
//  hspsimd.dll - SSE/AVX SIMD array operations for IronHSP
//
//  Vectorized arithmetic / reductions / matmul / pixel blending over
//  HSP int / double / float arrays.  Runtime CPU feature detection picks
//  the best available code path (AVX2 > SSE2 > scalar).
//
//  All functions exported as __cdecl with a stable C ABI for #uselib use.
//
#define WIN32_LEAN_AND_MEAN
#include <windows.h>
#include <immintrin.h>   // AVX / AVX2 intrinsics
#include <emmintrin.h>   // SSE2
#include <xmmintrin.h>   // SSE
#include <intrin.h>      // __cpuid / __cpuidex
#include <cstdint>
#include <cstring>
#include <cstdio>
#include <cmath>
#include <algorithm>

#define EXPORT extern "C" __declspec(dllexport)

//============================================================
//  CPU feature detection  (runtime via CPUID)
//============================================================

static bool g_has_sse    = false;
static bool g_has_sse2   = false;
static bool g_has_sse3   = false;
static bool g_has_ssse3  = false;
static bool g_has_sse41  = false;
static bool g_has_sse42  = false;
static bool g_has_avx    = false;
static bool g_has_avx2   = false;
static bool g_has_avx512 = false;
static bool g_has_fma    = false;
static char g_cpu_brand[0x40] = { 0 };

// OSXSAVE + XGETBV check so AVX is really usable by the OS
static bool os_ymm_enabled()
{
#if defined(_MSC_VER)
    // _xgetbv requires <immintrin.h> and cpu with xgetbv
    unsigned long long xcr0 = _xgetbv(0);
    return (xcr0 & 0x6) == 0x6;
#else
    return true;
#endif
}
static bool os_zmm_enabled()
{
#if defined(_MSC_VER)
    unsigned long long xcr0 = _xgetbv(0);
    return (xcr0 & 0xE6) == 0xE6;
#else
    return true;
#endif
}

static void detect_cpu_features()
{
    int info[4] = { 0 };

    __cpuid(info, 0);
    int max_leaf = info[0];

    if (max_leaf >= 1) {
        __cpuid(info, 1);
        int edx = info[3];
        int ecx = info[2];
        g_has_sse   = (edx & (1 << 25)) != 0;
        g_has_sse2  = (edx & (1 << 26)) != 0;
        g_has_sse3  = (ecx & (1 << 0))  != 0;
        g_has_ssse3 = (ecx & (1 << 9))  != 0;
        g_has_sse41 = (ecx & (1 << 19)) != 0;
        g_has_sse42 = (ecx & (1 << 20)) != 0;
        g_has_fma   = (ecx & (1 << 12)) != 0;

        bool osxsave = (ecx & (1 << 27)) != 0;
        bool avx_bit = (ecx & (1 << 28)) != 0;
        if (osxsave && avx_bit && os_ymm_enabled()) {
            g_has_avx = true;
        }
    }

    if (max_leaf >= 7 && g_has_avx) {
        __cpuidex(info, 7, 0);
        int ebx = info[1];
        g_has_avx2 = (ebx & (1 << 5)) != 0;

        bool avx512f = (ebx & (1 << 16)) != 0;
        if (avx512f && os_zmm_enabled()) {
            g_has_avx512 = true;
        }
    }

    // CPU brand string
    int brand[12] = { 0 };
    __cpuid(brand,     (int)0x80000000);
    unsigned int ext_max = (unsigned int)brand[0];
    if (ext_max >= 0x80000004) {
        __cpuid(brand + 0, (int)0x80000002);
        __cpuid(brand + 4, (int)0x80000003);
        __cpuid(brand + 8, (int)0x80000004);
        memcpy(g_cpu_brand, brand, sizeof(brand));
        g_cpu_brand[sizeof(g_cpu_brand) - 1] = 0;
    } else {
        strncpy(g_cpu_brand, "Unknown CPU", sizeof(g_cpu_brand) - 1);
    }
}

//============================================================
//  Capability query exports
//============================================================

EXPORT int __cdecl simd_has_sse()    { return g_has_sse    ? 1 : 0; }
EXPORT int __cdecl simd_has_sse2()   { return g_has_sse2   ? 1 : 0; }
EXPORT int __cdecl simd_has_avx()    { return g_has_avx    ? 1 : 0; }
EXPORT int __cdecl simd_has_avx2()   { return g_has_avx2   ? 1 : 0; }
EXPORT int __cdecl simd_has_avx512() { return g_has_avx512 ? 1 : 0; }

EXPORT int __cdecl simd_cpu_name(char *out, int maxlen)
{
    if (!out || maxlen <= 0) return -1;
    int copy = (int)strlen(g_cpu_brand);
    if (copy > maxlen - 1) copy = maxlen - 1;
    memcpy(out, g_cpu_brand, copy);
    out[copy] = 0;
    return 0;
}

//============================================================
//  Double array operations
//============================================================

//---- add -------------------------------------------------
static void scalar_add_d(const double *a, const double *b, double *o, int n)
{
    for (int i = 0; i < n; ++i) o[i] = a[i] + b[i];
}
static void sse2_add_d(const double *a, const double *b, double *o, int n)
{
    int i = 0;
    for (; i + 2 <= n; i += 2) {
        __m128d va = _mm_loadu_pd(a + i);
        __m128d vb = _mm_loadu_pd(b + i);
        _mm_storeu_pd(o + i, _mm_add_pd(va, vb));
    }
    for (; i < n; ++i) o[i] = a[i] + b[i];
}
static void avx_add_d(const double *a, const double *b, double *o, int n)
{
    int i = 0;
    for (; i + 4 <= n; i += 4) {
        __m256d va = _mm256_loadu_pd(a + i);
        __m256d vb = _mm256_loadu_pd(b + i);
        _mm256_storeu_pd(o + i, _mm256_add_pd(va, vb));
    }
    for (; i < n; ++i) o[i] = a[i] + b[i];
}

//---- sub -------------------------------------------------
static void scalar_sub_d(const double *a, const double *b, double *o, int n)
{
    for (int i = 0; i < n; ++i) o[i] = a[i] - b[i];
}
static void sse2_sub_d(const double *a, const double *b, double *o, int n)
{
    int i = 0;
    for (; i + 2 <= n; i += 2) {
        _mm_storeu_pd(o + i, _mm_sub_pd(_mm_loadu_pd(a + i), _mm_loadu_pd(b + i)));
    }
    for (; i < n; ++i) o[i] = a[i] - b[i];
}
static void avx_sub_d(const double *a, const double *b, double *o, int n)
{
    int i = 0;
    for (; i + 4 <= n; i += 4) {
        _mm256_storeu_pd(o + i,
            _mm256_sub_pd(_mm256_loadu_pd(a + i), _mm256_loadu_pd(b + i)));
    }
    for (; i < n; ++i) o[i] = a[i] - b[i];
}

//---- mul -------------------------------------------------
static void scalar_mul_d(const double *a, const double *b, double *o, int n)
{
    for (int i = 0; i < n; ++i) o[i] = a[i] * b[i];
}
static void sse2_mul_d(const double *a, const double *b, double *o, int n)
{
    int i = 0;
    for (; i + 2 <= n; i += 2) {
        _mm_storeu_pd(o + i, _mm_mul_pd(_mm_loadu_pd(a + i), _mm_loadu_pd(b + i)));
    }
    for (; i < n; ++i) o[i] = a[i] * b[i];
}
static void avx_mul_d(const double *a, const double *b, double *o, int n)
{
    int i = 0;
    for (; i + 4 <= n; i += 4) {
        _mm256_storeu_pd(o + i,
            _mm256_mul_pd(_mm256_loadu_pd(a + i), _mm256_loadu_pd(b + i)));
    }
    for (; i < n; ++i) o[i] = a[i] * b[i];
}

//---- div -------------------------------------------------
static void scalar_div_d(const double *a, const double *b, double *o, int n)
{
    for (int i = 0; i < n; ++i) o[i] = a[i] / b[i];
}
static void sse2_div_d(const double *a, const double *b, double *o, int n)
{
    int i = 0;
    for (; i + 2 <= n; i += 2) {
        _mm_storeu_pd(o + i, _mm_div_pd(_mm_loadu_pd(a + i), _mm_loadu_pd(b + i)));
    }
    for (; i < n; ++i) o[i] = a[i] / b[i];
}
static void avx_div_d(const double *a, const double *b, double *o, int n)
{
    int i = 0;
    for (; i + 4 <= n; i += 4) {
        _mm256_storeu_pd(o + i,
            _mm256_div_pd(_mm256_loadu_pd(a + i), _mm256_loadu_pd(b + i)));
    }
    for (; i < n; ++i) o[i] = a[i] / b[i];
}

//---- scale -----------------------------------------------
static void scalar_scale_d(const double *a, double s, double *o, int n)
{
    for (int i = 0; i < n; ++i) o[i] = a[i] * s;
}
static void avx_scale_d(const double *a, double s, double *o, int n)
{
    __m256d vs = _mm256_set1_pd(s);
    int i = 0;
    for (; i + 4 <= n; i += 4) {
        _mm256_storeu_pd(o + i, _mm256_mul_pd(_mm256_loadu_pd(a + i), vs));
    }
    for (; i < n; ++i) o[i] = a[i] * s;
}

//---- dot -------------------------------------------------
static double scalar_dot_d(const double *a, const double *b, int n)
{
    double s = 0.0;
    for (int i = 0; i < n; ++i) s += a[i] * b[i];
    return s;
}
static double avx_dot_d(const double *a, const double *b, int n)
{
    __m256d acc = _mm256_setzero_pd();
    int i = 0;
    for (; i + 4 <= n; i += 4) {
        __m256d va = _mm256_loadu_pd(a + i);
        __m256d vb = _mm256_loadu_pd(b + i);
        acc = _mm256_add_pd(acc, _mm256_mul_pd(va, vb));
    }
    double tmp[4];
    _mm256_storeu_pd(tmp, acc);
    double s = tmp[0] + tmp[1] + tmp[2] + tmp[3];
    for (; i < n; ++i) s += a[i] * b[i];
    return s;
}

//---- sum -------------------------------------------------
static double scalar_sum_d(const double *a, int n)
{
    double s = 0.0;
    for (int i = 0; i < n; ++i) s += a[i];
    return s;
}
static double avx_sum_d(const double *a, int n)
{
    __m256d acc = _mm256_setzero_pd();
    int i = 0;
    for (; i + 4 <= n; i += 4) {
        acc = _mm256_add_pd(acc, _mm256_loadu_pd(a + i));
    }
    double tmp[4];
    _mm256_storeu_pd(tmp, acc);
    double s = tmp[0] + tmp[1] + tmp[2] + tmp[3];
    for (; i < n; ++i) s += a[i];
    return s;
}

//---- min / max -------------------------------------------
static double scalar_min_d(const double *a, int n)
{
    if (n <= 0) return 0.0;
    double m = a[0];
    for (int i = 1; i < n; ++i) if (a[i] < m) m = a[i];
    return m;
}
static double scalar_max_d(const double *a, int n)
{
    if (n <= 0) return 0.0;
    double m = a[0];
    for (int i = 1; i < n; ++i) if (a[i] > m) m = a[i];
    return m;
}
static double avx_min_d(const double *a, int n)
{
    if (n <= 0) return 0.0;
    int i = 0;
    __m256d vm = _mm256_set1_pd(a[0]);
    for (; i + 4 <= n; i += 4) {
        vm = _mm256_min_pd(vm, _mm256_loadu_pd(a + i));
    }
    double tmp[4];
    _mm256_storeu_pd(tmp, vm);
    double m = (std::min)((std::min)(tmp[0], tmp[1]), (std::min)(tmp[2], tmp[3]));
    for (; i < n; ++i) if (a[i] < m) m = a[i];
    return m;
}
static double avx_max_d(const double *a, int n)
{
    if (n <= 0) return 0.0;
    int i = 0;
    __m256d vm = _mm256_set1_pd(a[0]);
    for (; i + 4 <= n; i += 4) {
        vm = _mm256_max_pd(vm, _mm256_loadu_pd(a + i));
    }
    double tmp[4];
    _mm256_storeu_pd(tmp, vm);
    double m = (std::max)((std::max)(tmp[0], tmp[1]), (std::max)(tmp[2], tmp[3]));
    for (; i < n; ++i) if (a[i] > m) m = a[i];
    return m;
}

//---- abs / sqrt ------------------------------------------
static void scalar_abs_d(const double *a, double *o, int n)
{
    for (int i = 0; i < n; ++i) o[i] = std::fabs(a[i]);
}
static void avx_abs_d(const double *a, double *o, int n)
{
    // clear sign bit
    __m256d mask = _mm256_castsi256_pd(
        _mm256_set1_epi64x(0x7fffffffffffffffLL));
    int i = 0;
    for (; i + 4 <= n; i += 4) {
        _mm256_storeu_pd(o + i, _mm256_and_pd(_mm256_loadu_pd(a + i), mask));
    }
    for (; i < n; ++i) o[i] = std::fabs(a[i]);
}
static void scalar_sqrt_d(const double *a, double *o, int n)
{
    for (int i = 0; i < n; ++i) o[i] = std::sqrt(a[i]);
}
static void avx_sqrt_d(const double *a, double *o, int n)
{
    int i = 0;
    for (; i + 4 <= n; i += 4) {
        _mm256_storeu_pd(o + i, _mm256_sqrt_pd(_mm256_loadu_pd(a + i)));
    }
    for (; i < n; ++i) o[i] = std::sqrt(a[i]);
}

//---- exported double API ---------------------------------
EXPORT int __cdecl simd_add_d(double *a, double *b, double *out, int n)
{
    if (!a || !b || !out || n <= 0) return -1;
    if      (g_has_avx)  avx_add_d(a, b, out, n);
    else if (g_has_sse2) sse2_add_d(a, b, out, n);
    else                 scalar_add_d(a, b, out, n);
    return 0;
}
EXPORT int __cdecl simd_sub_d(double *a, double *b, double *out, int n)
{
    if (!a || !b || !out || n <= 0) return -1;
    if      (g_has_avx)  avx_sub_d(a, b, out, n);
    else if (g_has_sse2) sse2_sub_d(a, b, out, n);
    else                 scalar_sub_d(a, b, out, n);
    return 0;
}
EXPORT int __cdecl simd_mul_d(double *a, double *b, double *out, int n)
{
    if (!a || !b || !out || n <= 0) return -1;
    if      (g_has_avx)  avx_mul_d(a, b, out, n);
    else if (g_has_sse2) sse2_mul_d(a, b, out, n);
    else                 scalar_mul_d(a, b, out, n);
    return 0;
}
EXPORT int __cdecl simd_div_d(double *a, double *b, double *out, int n)
{
    if (!a || !b || !out || n <= 0) return -1;
    if      (g_has_avx)  avx_div_d(a, b, out, n);
    else if (g_has_sse2) sse2_div_d(a, b, out, n);
    else                 scalar_div_d(a, b, out, n);
    return 0;
}
EXPORT int __cdecl simd_scale_d(double *a, double scalar, double *out, int n)
{
    if (!a || !out || n <= 0) return -1;
    if (g_has_avx) avx_scale_d(a, scalar, out, n);
    else           scalar_scale_d(a, scalar, out, n);
    return 0;
}
EXPORT int __cdecl simd_dot_d(double *a, double *b, int n, double *result)
{
    if (!a || !b || !result || n <= 0) return -1;
    *result = g_has_avx ? avx_dot_d(a, b, n) : scalar_dot_d(a, b, n);
    return 0;
}
EXPORT int __cdecl simd_sum_d(double *a, int n, double *result)
{
    if (!a || !result || n <= 0) return -1;
    *result = g_has_avx ? avx_sum_d(a, n) : scalar_sum_d(a, n);
    return 0;
}
EXPORT int __cdecl simd_min_d(double *a, int n, double *result)
{
    if (!a || !result || n <= 0) return -1;
    *result = g_has_avx ? avx_min_d(a, n) : scalar_min_d(a, n);
    return 0;
}
EXPORT int __cdecl simd_max_d(double *a, int n, double *result)
{
    if (!a || !result || n <= 0) return -1;
    *result = g_has_avx ? avx_max_d(a, n) : scalar_max_d(a, n);
    return 0;
}
EXPORT int __cdecl simd_abs_d(double *a, double *out, int n)
{
    if (!a || !out || n <= 0) return -1;
    if (g_has_avx) avx_abs_d(a, out, n);
    else           scalar_abs_d(a, out, n);
    return 0;
}
EXPORT int __cdecl simd_sqrt_d(double *a, double *out, int n)
{
    if (!a || !out || n <= 0) return -1;
    if (g_has_avx) avx_sqrt_d(a, out, n);
    else           scalar_sqrt_d(a, out, n);
    return 0;
}

//============================================================
//  Int32 array operations
//============================================================

static void scalar_add_i(const int *a, const int *b, int *o, int n)
{
    for (int i = 0; i < n; ++i) o[i] = a[i] + b[i];
}
static void avx2_add_i(const int *a, const int *b, int *o, int n)
{
    int i = 0;
    for (; i + 8 <= n; i += 8) {
        __m256i va = _mm256_loadu_si256((const __m256i *)(a + i));
        __m256i vb = _mm256_loadu_si256((const __m256i *)(b + i));
        _mm256_storeu_si256((__m256i *)(o + i), _mm256_add_epi32(va, vb));
    }
    for (; i < n; ++i) o[i] = a[i] + b[i];
}
static void sse2_add_i(const int *a, const int *b, int *o, int n)
{
    int i = 0;
    for (; i + 4 <= n; i += 4) {
        __m128i va = _mm_loadu_si128((const __m128i *)(a + i));
        __m128i vb = _mm_loadu_si128((const __m128i *)(b + i));
        _mm_storeu_si128((__m128i *)(o + i), _mm_add_epi32(va, vb));
    }
    for (; i < n; ++i) o[i] = a[i] + b[i];
}

static void scalar_sub_i(const int *a, const int *b, int *o, int n)
{
    for (int i = 0; i < n; ++i) o[i] = a[i] - b[i];
}
static void avx2_sub_i(const int *a, const int *b, int *o, int n)
{
    int i = 0;
    for (; i + 8 <= n; i += 8) {
        _mm256_storeu_si256((__m256i *)(o + i),
            _mm256_sub_epi32(
                _mm256_loadu_si256((const __m256i *)(a + i)),
                _mm256_loadu_si256((const __m256i *)(b + i))));
    }
    for (; i < n; ++i) o[i] = a[i] - b[i];
}
static void sse2_sub_i(const int *a, const int *b, int *o, int n)
{
    int i = 0;
    for (; i + 4 <= n; i += 4) {
        _mm_storeu_si128((__m128i *)(o + i),
            _mm_sub_epi32(
                _mm_loadu_si128((const __m128i *)(a + i)),
                _mm_loadu_si128((const __m128i *)(b + i))));
    }
    for (; i < n; ++i) o[i] = a[i] - b[i];
}

static void scalar_mul_i(const int *a, const int *b, int *o, int n)
{
    for (int i = 0; i < n; ++i) o[i] = a[i] * b[i];
}
static void avx2_mul_i(const int *a, const int *b, int *o, int n)
{
    int i = 0;
    for (; i + 8 <= n; i += 8) {
        _mm256_storeu_si256((__m256i *)(o + i),
            _mm256_mullo_epi32(
                _mm256_loadu_si256((const __m256i *)(a + i)),
                _mm256_loadu_si256((const __m256i *)(b + i))));
    }
    for (; i < n; ++i) o[i] = a[i] * b[i];
}

static long long scalar_sum_i(const int *a, int n)
{
    long long s = 0;
    for (int i = 0; i < n; ++i) s += a[i];
    return s;
}
static long long avx2_sum_i(const int *a, int n)
{
    // accumulate as 64-bit to avoid overflow on large arrays
    __m256i acc = _mm256_setzero_si256();
    int i = 0;
    for (; i + 8 <= n; i += 8) {
        __m256i v = _mm256_loadu_si256((const __m256i *)(a + i));
        // sign-extend low 128 and high 128 lanes to 64-bit and add
        __m128i lo128 = _mm256_castsi256_si128(v);
        __m128i hi128 = _mm256_extracti128_si256(v, 1);
        __m256i lo64 = _mm256_cvtepi32_epi64(lo128);
        __m256i hi64 = _mm256_cvtepi32_epi64(hi128);
        acc = _mm256_add_epi64(acc, lo64);
        acc = _mm256_add_epi64(acc, hi64);
    }
    long long tmp[4];
    _mm256_storeu_si256((__m256i *)tmp, acc);
    long long s = tmp[0] + tmp[1] + tmp[2] + tmp[3];
    for (; i < n; ++i) s += a[i];
    return s;
}

static int scalar_min_i(const int *a, int n)
{
    if (n <= 0) return 0;
    int m = a[0];
    for (int i = 1; i < n; ++i) if (a[i] < m) m = a[i];
    return m;
}
static int scalar_max_i(const int *a, int n)
{
    if (n <= 0) return 0;
    int m = a[0];
    for (int i = 1; i < n; ++i) if (a[i] > m) m = a[i];
    return m;
}
static int avx2_min_i(const int *a, int n)
{
    if (n <= 0) return 0;
    int i = 0;
    __m256i vm = _mm256_set1_epi32(a[0]);
    for (; i + 8 <= n; i += 8) {
        vm = _mm256_min_epi32(vm, _mm256_loadu_si256((const __m256i *)(a + i)));
    }
    int tmp[8];
    _mm256_storeu_si256((__m256i *)tmp, vm);
    int m = tmp[0];
    for (int k = 1; k < 8; ++k) if (tmp[k] < m) m = tmp[k];
    for (; i < n; ++i) if (a[i] < m) m = a[i];
    return m;
}
static int avx2_max_i(const int *a, int n)
{
    if (n <= 0) return 0;
    int i = 0;
    __m256i vm = _mm256_set1_epi32(a[0]);
    for (; i + 8 <= n; i += 8) {
        vm = _mm256_max_epi32(vm, _mm256_loadu_si256((const __m256i *)(a + i)));
    }
    int tmp[8];
    _mm256_storeu_si256((__m256i *)tmp, vm);
    int m = tmp[0];
    for (int k = 1; k < 8; ++k) if (tmp[k] > m) m = tmp[k];
    for (; i < n; ++i) if (a[i] > m) m = a[i];
    return m;
}

static void scalar_bitop_and_i(const int *a, const int *b, int *o, int n)
{
    for (int i = 0; i < n; ++i) o[i] = a[i] & b[i];
}
static void scalar_bitop_or_i(const int *a, const int *b, int *o, int n)
{
    for (int i = 0; i < n; ++i) o[i] = a[i] | b[i];
}
static void scalar_bitop_xor_i(const int *a, const int *b, int *o, int n)
{
    for (int i = 0; i < n; ++i) o[i] = a[i] ^ b[i];
}
static void avx2_and_i(const int *a, const int *b, int *o, int n)
{
    int i = 0;
    for (; i + 8 <= n; i += 8) {
        _mm256_storeu_si256((__m256i *)(o + i),
            _mm256_and_si256(
                _mm256_loadu_si256((const __m256i *)(a + i)),
                _mm256_loadu_si256((const __m256i *)(b + i))));
    }
    for (; i < n; ++i) o[i] = a[i] & b[i];
}
static void avx2_or_i(const int *a, const int *b, int *o, int n)
{
    int i = 0;
    for (; i + 8 <= n; i += 8) {
        _mm256_storeu_si256((__m256i *)(o + i),
            _mm256_or_si256(
                _mm256_loadu_si256((const __m256i *)(a + i)),
                _mm256_loadu_si256((const __m256i *)(b + i))));
    }
    for (; i < n; ++i) o[i] = a[i] | b[i];
}
static void avx2_xor_i(const int *a, const int *b, int *o, int n)
{
    int i = 0;
    for (; i + 8 <= n; i += 8) {
        _mm256_storeu_si256((__m256i *)(o + i),
            _mm256_xor_si256(
                _mm256_loadu_si256((const __m256i *)(a + i)),
                _mm256_loadu_si256((const __m256i *)(b + i))));
    }
    for (; i < n; ++i) o[i] = a[i] ^ b[i];
}

//---- exported int API ------------------------------------
EXPORT int __cdecl simd_add_i(int *a, int *b, int *out, int n)
{
    if (!a || !b || !out || n <= 0) return -1;
    if      (g_has_avx2) avx2_add_i(a, b, out, n);
    else if (g_has_sse2) sse2_add_i(a, b, out, n);
    else                 scalar_add_i(a, b, out, n);
    return 0;
}
EXPORT int __cdecl simd_sub_i(int *a, int *b, int *out, int n)
{
    if (!a || !b || !out || n <= 0) return -1;
    if      (g_has_avx2) avx2_sub_i(a, b, out, n);
    else if (g_has_sse2) sse2_sub_i(a, b, out, n);
    else                 scalar_sub_i(a, b, out, n);
    return 0;
}
EXPORT int __cdecl simd_mul_i(int *a, int *b, int *out, int n)
{
    if (!a || !b || !out || n <= 0) return -1;
    if (g_has_avx2) avx2_mul_i(a, b, out, n);
    else            scalar_mul_i(a, b, out, n);
    return 0;
}
EXPORT int __cdecl simd_sum_i(int *a, int n, int *result)
{
    if (!a || !result || n <= 0) return -1;
    long long s = g_has_avx2 ? avx2_sum_i(a, n) : scalar_sum_i(a, n);
    // clamp to int32 range
    if (s >  2147483647LL) s =  2147483647LL;
    if (s < -2147483648LL) s = -2147483648LL;
    *result = (int)s;
    return 0;
}
EXPORT int __cdecl simd_min_i(int *a, int n, int *result)
{
    if (!a || !result || n <= 0) return -1;
    *result = g_has_avx2 ? avx2_min_i(a, n) : scalar_min_i(a, n);
    return 0;
}
EXPORT int __cdecl simd_max_i(int *a, int n, int *result)
{
    if (!a || !result || n <= 0) return -1;
    *result = g_has_avx2 ? avx2_max_i(a, n) : scalar_max_i(a, n);
    return 0;
}
EXPORT int __cdecl simd_and_i(int *a, int *b, int *out, int n)
{
    if (!a || !b || !out || n <= 0) return -1;
    if (g_has_avx2) avx2_and_i(a, b, out, n);
    else            scalar_bitop_and_i(a, b, out, n);
    return 0;
}
EXPORT int __cdecl simd_or_i(int *a, int *b, int *out, int n)
{
    if (!a || !b || !out || n <= 0) return -1;
    if (g_has_avx2) avx2_or_i(a, b, out, n);
    else            scalar_bitop_or_i(a, b, out, n);
    return 0;
}
EXPORT int __cdecl simd_xor_i(int *a, int *b, int *out, int n)
{
    if (!a || !b || !out || n <= 0) return -1;
    if (g_has_avx2) avx2_xor_i(a, b, out, n);
    else            scalar_bitop_xor_i(a, b, out, n);
    return 0;
}

//============================================================
//  Float32 array operations
//============================================================

static void scalar_add_f(const float *a, const float *b, float *o, int n)
{
    for (int i = 0; i < n; ++i) o[i] = a[i] + b[i];
}
static void sse_add_f(const float *a, const float *b, float *o, int n)
{
    int i = 0;
    for (; i + 4 <= n; i += 4) {
        _mm_storeu_ps(o + i, _mm_add_ps(_mm_loadu_ps(a + i), _mm_loadu_ps(b + i)));
    }
    for (; i < n; ++i) o[i] = a[i] + b[i];
}
static void avx_add_f(const float *a, const float *b, float *o, int n)
{
    int i = 0;
    for (; i + 8 <= n; i += 8) {
        _mm256_storeu_ps(o + i,
            _mm256_add_ps(_mm256_loadu_ps(a + i), _mm256_loadu_ps(b + i)));
    }
    for (; i < n; ++i) o[i] = a[i] + b[i];
}

static float scalar_dot_f(const float *a, const float *b, int n)
{
    float s = 0.f;
    for (int i = 0; i < n; ++i) s += a[i] * b[i];
    return s;
}
static float avx_dot_f(const float *a, const float *b, int n)
{
    __m256 acc = _mm256_setzero_ps();
    int i = 0;
    for (; i + 8 <= n; i += 8) {
        __m256 va = _mm256_loadu_ps(a + i);
        __m256 vb = _mm256_loadu_ps(b + i);
        acc = _mm256_add_ps(acc, _mm256_mul_ps(va, vb));
    }
    float tmp[8];
    _mm256_storeu_ps(tmp, acc);
    float s = 0.f;
    for (int k = 0; k < 8; ++k) s += tmp[k];
    for (; i < n; ++i) s += a[i] * b[i];
    return s;
}

static float scalar_sum_f(const float *a, int n)
{
    float s = 0.f;
    for (int i = 0; i < n; ++i) s += a[i];
    return s;
}
static float avx_sum_f(const float *a, int n)
{
    __m256 acc = _mm256_setzero_ps();
    int i = 0;
    for (; i + 8 <= n; i += 8) {
        acc = _mm256_add_ps(acc, _mm256_loadu_ps(a + i));
    }
    float tmp[8];
    _mm256_storeu_ps(tmp, acc);
    float s = 0.f;
    for (int k = 0; k < 8; ++k) s += tmp[k];
    for (; i < n; ++i) s += a[i];
    return s;
}

EXPORT int __cdecl simd_add_f(float *a, float *b, float *out, int n)
{
    if (!a || !b || !out || n <= 0) return -1;
    if      (g_has_avx) avx_add_f(a, b, out, n);
    else if (g_has_sse) sse_add_f(a, b, out, n);
    else                scalar_add_f(a, b, out, n);
    return 0;
}
EXPORT int __cdecl simd_dot_f(float *a, float *b, int n, float *result)
{
    if (!a || !b || !result || n <= 0) return -1;
    *result = g_has_avx ? avx_dot_f(a, b, n) : scalar_dot_f(a, b, n);
    return 0;
}
EXPORT int __cdecl simd_sum_f(float *a, int n, float *result)
{
    if (!a || !result || n <= 0) return -1;
    *result = g_has_avx ? avx_sum_f(a, n) : scalar_sum_f(a, n);
    return 0;
}

//============================================================
//  Matrix multiplication (general purpose)
//    A: m x n   B: n x k   C: m x k    (row-major)
//============================================================

static void matmul_f_scalar(const float *A, const float *B, float *C,
                            int m, int n, int k)
{
    for (int i = 0; i < m; ++i) {
        for (int j = 0; j < k; ++j) {
            float s = 0.f;
            for (int l = 0; l < n; ++l) s += A[i * n + l] * B[l * k + j];
            C[i * k + j] = s;
        }
    }
}

static void matmul_f_avx(const float *A, const float *B, float *C,
                         int m, int n, int k)
{
    // Simple vectorization along the j (output column) axis.
    // For each row i, iterate over rows of B (l), and broadcast A[i,l]
    // into 8 columns of B at once.
    for (int i = 0; i < m; ++i) {
        // zero row
        int j0 = 0;
        for (; j0 + 8 <= k; j0 += 8) {
            _mm256_storeu_ps(C + i * k + j0, _mm256_setzero_ps());
        }
        for (; j0 < k; ++j0) C[i * k + j0] = 0.f;

        for (int l = 0; l < n; ++l) {
            __m256 av = _mm256_set1_ps(A[i * n + l]);
            int j = 0;
            for (; j + 8 <= k; j += 8) {
                __m256 bv = _mm256_loadu_ps(B + l * k + j);
                __m256 cv = _mm256_loadu_ps(C + i * k + j);
                cv = _mm256_add_ps(cv, _mm256_mul_ps(av, bv));
                _mm256_storeu_ps(C + i * k + j, cv);
            }
            float a = A[i * n + l];
            for (; j < k; ++j) C[i * k + j] += a * B[l * k + j];
        }
    }
}

static void matmul_d_scalar(const double *A, const double *B, double *C,
                            int m, int n, int k)
{
    for (int i = 0; i < m; ++i) {
        for (int j = 0; j < k; ++j) {
            double s = 0.0;
            for (int l = 0; l < n; ++l) s += A[i * n + l] * B[l * k + j];
            C[i * k + j] = s;
        }
    }
}

static void matmul_d_avx(const double *A, const double *B, double *C,
                         int m, int n, int k)
{
    for (int i = 0; i < m; ++i) {
        int j0 = 0;
        for (; j0 + 4 <= k; j0 += 4) {
            _mm256_storeu_pd(C + i * k + j0, _mm256_setzero_pd());
        }
        for (; j0 < k; ++j0) C[i * k + j0] = 0.0;

        for (int l = 0; l < n; ++l) {
            __m256d av = _mm256_set1_pd(A[i * n + l]);
            int j = 0;
            for (; j + 4 <= k; j += 4) {
                __m256d bv = _mm256_loadu_pd(B + l * k + j);
                __m256d cv = _mm256_loadu_pd(C + i * k + j);
                cv = _mm256_add_pd(cv, _mm256_mul_pd(av, bv));
                _mm256_storeu_pd(C + i * k + j, cv);
            }
            double a = A[i * n + l];
            for (; j < k; ++j) C[i * k + j] += a * B[l * k + j];
        }
    }
}

EXPORT int __cdecl simd_matmul_f(float *a, float *b, float *c,
                                 int m, int n, int k)
{
    if (!a || !b || !c || m <= 0 || n <= 0 || k <= 0) return -1;
    if (g_has_avx) matmul_f_avx(a, b, c, m, n, k);
    else           matmul_f_scalar(a, b, c, m, n, k);
    return 0;
}
EXPORT int __cdecl simd_matmul_d(double *a, double *b, double *c,
                                 int m, int n, int k)
{
    if (!a || !b || !c || m <= 0 || n <= 0 || k <= 0) return -1;
    if (g_has_avx) matmul_d_avx(a, b, c, m, n, k);
    else           matmul_d_scalar(a, b, c, m, n, k);
    return 0;
}

//============================================================
//  Image / pixel operations
//============================================================

// out = a*(1-alpha) + b*alpha  per byte.  n is byte count.
static void pixel_blend_scalar(const uint8_t *a, const uint8_t *b,
                               uint8_t *out, int n, float alpha)
{
    float ia = 1.f - alpha;
    for (int i = 0; i < n; ++i) {
        float v = (float)a[i] * ia + (float)b[i] * alpha;
        if (v < 0.f)   v = 0.f;
        if (v > 255.f) v = 255.f;
        out[i] = (uint8_t)(v + 0.5f);
    }
}

static void pixel_blend_avx2(const uint8_t *a, const uint8_t *b,
                             uint8_t *out, int n, float alpha)
{
    __m256 va_coef = _mm256_set1_ps(1.f - alpha);
    __m256 vb_coef = _mm256_set1_ps(alpha);
    int i = 0;
    for (; i + 8 <= n; i += 8) {
        // load 8 bytes from each, widen to int32
        __m128i la = _mm_loadl_epi64((const __m128i *)(a + i));
        __m128i lb = _mm_loadl_epi64((const __m128i *)(b + i));
        __m256i a32 = _mm256_cvtepu8_epi32(la);
        __m256i b32 = _mm256_cvtepu8_epi32(lb);
        __m256 af = _mm256_cvtepi32_ps(a32);
        __m256 bf = _mm256_cvtepi32_ps(b32);
        __m256 r  = _mm256_add_ps(_mm256_mul_ps(af, va_coef),
                                  _mm256_mul_ps(bf, vb_coef));
        // clamp 0..255
        r = _mm256_max_ps(r, _mm256_setzero_ps());
        r = _mm256_min_ps(r, _mm256_set1_ps(255.f));
        __m256i ri = _mm256_cvtps_epi32(r);
        // pack int32 → int16 → uint8, 8 lanes
        __m128i lo = _mm256_castsi256_si128(ri);
        __m128i hi = _mm256_extracti128_si256(ri, 1);
        __m128i p16 = _mm_packus_epi32(lo, hi);
        __m128i p8  = _mm_packus_epi16(p16, p16);
        _mm_storel_epi64((__m128i *)(out + i), p8);
    }
    // tail scalar
    float ia = 1.f - alpha;
    for (; i < n; ++i) {
        float v = (float)a[i] * ia + (float)b[i] * alpha;
        if (v < 0.f)   v = 0.f;
        if (v > 255.f) v = 255.f;
        out[i] = (uint8_t)(v + 0.5f);
    }
}

EXPORT int __cdecl simd_pixel_blend(uint8_t *a, uint8_t *b, uint8_t *out,
                                    int n, float alpha)
{
    if (!a || !b || !out || n <= 0) return -1;
    if (alpha < 0.f) alpha = 0.f;
    if (alpha > 1.f) alpha = 1.f;
    if (g_has_avx2) pixel_blend_avx2(a, b, out, n, alpha);
    else            pixel_blend_scalar(a, b, out, n, alpha);
    return 0;
}

// RGBA -> single-channel grayscale (BT.601 weights)
// n = byte count of rgba (must be multiple of 4).  out length = n/4.
static void pixel_grayscale_scalar(const uint8_t *rgba, uint8_t *out, int n)
{
    int pixels = n / 4;
    for (int i = 0; i < pixels; ++i) {
        uint8_t r = rgba[i * 4 + 0];
        uint8_t g = rgba[i * 4 + 1];
        uint8_t b = rgba[i * 4 + 2];
        // 0.299R + 0.587G + 0.114B, fixed point 8-bit
        int y = (77 * r + 150 * g + 29 * b + 128) >> 8;
        if (y > 255) y = 255;
        out[i] = (uint8_t)y;
    }
}

EXPORT int __cdecl simd_pixel_grayscale(uint8_t *rgba, uint8_t *out, int n)
{
    if (!rgba || !out || n <= 0) return -1;
    // SIMD-accelerated version is possible but the scalar version is
    // cache-bound anyway — keep it simple and portable.
    pixel_grayscale_scalar(rgba, out, n);
    return 0;
}

//============================================================
//  hspmathex_simd_init — called from hspmathex_bigint.cpp DllMain
//============================================================

void hspmathex_simd_init()
{
    detect_cpu_features();
}
