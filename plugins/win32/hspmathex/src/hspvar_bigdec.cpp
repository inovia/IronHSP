//
//  hspvar_bigdec.cpp
//
//  任意精度10進固定小数 (BigDec) を HSP3 の HSPVAR 拡張型として登録する。
//  設計は hspvar_bigint.cpp と完全同型 (不透明ハンドル方式で basesize = sizeof(BigDec*))。
//
//  値表現: value = (negative ? -1 : +1) * digits * 10^(-scale)
//    digits は BigInt (base 2^32 符号なし little-endian)
//    scale は int (正 = 小数部の桁数、負 = 10^|scale| 倍)
//
//  外部依存なし。BigInt ルーチンは hspvar_bigdec 独自の static 関数群として
//  namespace 内に抱える (名前衝突を避けるため hspvar_bigint.cpp とは分離)。
//

#define WIN32_LEAN_AND_MEAN
#define NOMINMAX
#include <windows.h>

#include <algorithm>
#include <cmath>
#include <cstdint>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <string>
#include <vector>

#include "hsp3plugin.h"
#include "hspvar_core.h"
#include "hsp3debug.h"
#include "hspvar_bigdec.h"

namespace hspmathex_t {
namespace bd {

// ============================================================
// BigInt (unsigned magnitude, base 2^32 limbs)
// ============================================================
typedef std::vector<uint32_t> BI;

static void bi_trim(BI &a) {
    while (!a.empty() && a.back() == 0) a.pop_back();
}

static bool bi_is_zero(const BI &a) {
    for (uint32_t w : a) if (w) return false;
    return true;
}

static int bi_cmp(const BI &a, const BI &b) {
    size_t la = a.size(), lb = b.size();
    while (la > 0 && a[la - 1] == 0) la--;
    while (lb > 0 && b[lb - 1] == 0) lb--;
    if (la != lb) return la < lb ? -1 : 1;
    for (size_t i = la; i-- > 0;) {
        if (a[i] != b[i]) return a[i] < b[i] ? -1 : 1;
    }
    return 0;
}

static BI bi_add(const BI &a, const BI &b) {
    BI r;
    size_t n = std::max(a.size(), b.size());
    r.reserve(n + 1);
    uint64_t carry = 0;
    for (size_t i = 0; i < n; i++) {
        uint64_t av = i < a.size() ? a[i] : 0;
        uint64_t bv = i < b.size() ? b[i] : 0;
        uint64_t s = av + bv + carry;
        r.push_back((uint32_t)(s & 0xFFFFFFFFu));
        carry = s >> 32;
    }
    if (carry) r.push_back((uint32_t)carry);
    bi_trim(r);
    return r;
}

// a - b (a >= b)
static BI bi_sub(const BI &a, const BI &b) {
    BI r; r.reserve(a.size());
    int64_t borrow = 0;
    for (size_t i = 0; i < a.size(); i++) {
        int64_t av = a[i];
        int64_t bv = i < b.size() ? b[i] : 0;
        int64_t d = av - bv - borrow;
        if (d < 0) { d += ((int64_t)1 << 32); borrow = 1; } else borrow = 0;
        r.push_back((uint32_t)(d & 0xFFFFFFFFu));
    }
    bi_trim(r);
    return r;
}

static BI bi_mul(const BI &a, const BI &b) {
    BI r;
    if (a.empty() || b.empty()) return r;
    r.assign(a.size() + b.size(), 0);
    for (size_t i = 0; i < a.size(); i++) {
        uint64_t carry = 0;
        uint64_t av = a[i];
        if (av == 0) continue;
        for (size_t j = 0; j < b.size(); j++) {
            uint64_t cur = (uint64_t)r[i + j] + av * (uint64_t)b[j] + carry;
            r[i + j] = (uint32_t)(cur & 0xFFFFFFFFu);
            carry = cur >> 32;
        }
        size_t k = i + b.size();
        while (carry) {
            uint64_t cur = (uint64_t)r[k] + carry;
            r[k] = (uint32_t)(cur & 0xFFFFFFFFu);
            carry = cur >> 32; k++;
        }
    }
    bi_trim(r);
    return r;
}

static BI bi_mul_small(const BI &a, uint32_t b) {
    BI r;
    if (b == 0 || a.empty()) return r;
    r.reserve(a.size() + 1);
    uint64_t carry = 0;
    for (size_t i = 0; i < a.size(); i++) {
        uint64_t cur = (uint64_t)a[i] * b + carry;
        r.push_back((uint32_t)(cur & 0xFFFFFFFFu));
        carry = cur >> 32;
    }
    if (carry) r.push_back((uint32_t)carry);
    bi_trim(r);
    return r;
}

static BI bi_divmod_small(const BI &a, uint32_t b, uint32_t *rem) {
    BI q; q.assign(a.size(), 0);
    uint64_t r = 0;
    for (size_t i = a.size(); i-- > 0;) {
        uint64_t cur = (r << 32) | a[i];
        q[i] = (uint32_t)(cur / b);
        r = cur % b;
    }
    if (rem) *rem = (uint32_t)r;
    bi_trim(q);
    return q;
}

static BI bi_shl_limbs(const BI &a, size_t k) {
    if (a.empty()) return a;
    BI r(a.size() + k, 0);
    for (size_t i = 0; i < a.size(); i++) r[i + k] = a[i];
    bi_trim(r);
    return r;
}

static BI bi_shl(const BI &a, size_t k) {
    if (a.empty() || k == 0) return a;
    size_t limbs = k / 32;
    size_t bits = k % 32;
    BI r = bi_shl_limbs(a, limbs);
    if (bits == 0) return r;
    uint32_t carry = 0;
    for (size_t i = 0; i < r.size(); i++) {
        uint64_t v = ((uint64_t)r[i] << bits) | carry;
        r[i] = (uint32_t)(v & 0xFFFFFFFFu);
        carry = (uint32_t)(v >> 32);
    }
    if (carry) r.push_back(carry);
    bi_trim(r);
    return r;
}

static BI bi_divmod(const BI &a, const BI &b, BI *rem) {
    if (bi_is_zero(b)) {
        if (rem) rem->clear();
        return BI();
    }
    if (bi_cmp(a, b) < 0) {
        if (rem) *rem = a;
        return BI();
    }
    BI bb = b; bi_trim(bb);
    if (bb.size() == 1) {
        uint32_t r32;
        BI q = bi_divmod_small(a, bb[0], &r32);
        if (rem) { rem->clear(); if (r32) rem->push_back(r32); }
        return q;
    }
    uint32_t top = bb.back();
    int shift = 0;
    while ((top & 0x80000000u) == 0) { top <<= 1; shift++; }
    BI u = bi_shl(a, shift);
    BI v = bi_shl(bb, shift);
    u.push_back(0);
    size_t n = v.size();
    size_t m = u.size() - n - 1;
    BI q(m + 1, 0);
    for (ptrdiff_t j = (ptrdiff_t)m; j >= 0; j--) {
        uint64_t num = ((uint64_t)u[j + n] << 32) | u[j + n - 1];
        uint64_t qhat = num / v[n - 1];
        uint64_t rhat = num % v[n - 1];
        if (qhat > 0xFFFFFFFFull) { qhat = 0xFFFFFFFFull; rhat = num - qhat * v[n - 1]; }
        while (qhat == 0x100000000ull ||
               (n >= 2 && qhat * (uint64_t)v[n - 2] > ((rhat << 32) | u[j + n - 2]))) {
            qhat--;
            rhat += v[n - 1];
            if (rhat > 0xFFFFFFFFull) break;
        }
        int64_t borrow = 0;
        uint64_t carry = 0;
        for (size_t i = 0; i < n; i++) {
            uint64_t p = qhat * (uint64_t)v[i] + carry;
            carry = p >> 32;
            int64_t t = (int64_t)u[j + i] - (int64_t)(p & 0xFFFFFFFFu) - borrow;
            if (t < 0) { t += ((int64_t)1 << 32); borrow = 1; } else borrow = 0;
            u[j + i] = (uint32_t)(t & 0xFFFFFFFFu);
        }
        int64_t t = (int64_t)u[j + n] - (int64_t)carry - borrow;
        bool neg = t < 0;
        if (neg) t += ((int64_t)1 << 32);
        u[j + n] = (uint32_t)(t & 0xFFFFFFFFu);
        if (neg) {
            qhat--;
            uint64_t c = 0;
            for (size_t i = 0; i < n; i++) {
                uint64_t s = (uint64_t)u[j + i] + (uint64_t)v[i] + c;
                u[j + i] = (uint32_t)(s & 0xFFFFFFFFu);
                c = s >> 32;
            }
            u[j + n] = (uint32_t)(u[j + n] + c);
        }
        q[j] = (uint32_t)qhat;
    }
    if (rem) {
        u.resize(n);
        bi_trim(u);
        if (shift == 0) { *rem = u; }
        else {
            BI r = u;
            uint32_t carry2 = 0;
            for (size_t i = r.size(); i-- > 0;) {
                uint32_t v2 = r[i];
                r[i] = (v2 >> shift) | carry2;
                carry2 = (uint32_t)((uint64_t)v2 << (32 - shift));
            }
            bi_trim(r);
            *rem = r;
        }
    }
    bi_trim(q);
    return q;
}

static BI bi_from_decimal(const char *s) {
    BI r;
    while (*s == '0') s++;
    if (*s == '\0') return r;
    std::string buf(s);
    size_t len = buf.size();
    size_t first = len % 9;
    if (first == 0) first = 9;
    size_t pos = 0;
    uint32_t v = 0;
    for (size_t i = 0; i < first; i++) {
        if (buf[pos] < '0' || buf[pos] > '9') return BI();
        v = v * 10 + (buf[pos] - '0'); pos++;
    }
    r.push_back(v);
    while (pos < len) {
        r = bi_mul_small(r, 1000000000u);
        v = 0;
        for (size_t i = 0; i < 9; i++) {
            if (buf[pos] < '0' || buf[pos] > '9') return BI();
            v = v * 10 + (buf[pos] - '0'); pos++;
        }
        if (v) {
            uint64_t carry = v;
            for (size_t j = 0; j < r.size() && carry; j++) {
                uint64_t s2 = (uint64_t)r[j] + carry;
                r[j] = (uint32_t)(s2 & 0xFFFFFFFFu);
                carry = s2 >> 32;
            }
            if (carry) r.push_back((uint32_t)carry);
        }
    }
    bi_trim(r);
    return r;
}

static std::string bi_to_decimal(const BI &a) {
    if (bi_is_zero(a)) return "0";
    BI cur = a;
    std::string s;
    while (!bi_is_zero(cur)) {
        uint32_t r;
        cur = bi_divmod_small(cur, 1000000000u, &r);
        char buf[16];
        if (bi_is_zero(cur)) std::snprintf(buf, sizeof(buf), "%u", r);
        else                 std::snprintf(buf, sizeof(buf), "%09u", r);
        s = std::string(buf) + s;
    }
    return s;
}

static BI bi_mul_pow10(const BI &a, int n) {
    if (n <= 0 || bi_is_zero(a)) return a;
    BI r = a;
    while (n >= 9) { r = bi_mul_small(r, 1000000000u); n -= 9; }
    uint32_t p = 1;
    for (int i = 0; i < n; i++) p *= 10;
    if (p > 1) r = bi_mul_small(r, p);
    return r;
}

}  // namespace bd

// ============================================================
// BigDec
// ============================================================
struct BigDec {
    bd::BI digits;
    bool negative = false;
    int  scale = 0;

    void normalize_zero() { if (bd::bi_is_zero(digits)) negative = false; }
};

namespace bd {

static int bd_signed_cmp(const BigDec &a, const BigDec &b) {
    bool za = bi_is_zero(a.digits);
    bool zb = bi_is_zero(b.digits);
    if (za && zb) return 0;
    if (za) return b.negative ? 1 : -1;
    if (zb) return a.negative ? -1 : 1;
    if (a.negative != b.negative) return a.negative ? -1 : 1;
    int common_scale = std::max(a.scale, b.scale);
    BI am = bi_mul_pow10(a.digits, common_scale - a.scale);
    BI bm = bi_mul_pow10(b.digits, common_scale - b.scale);
    int c = bi_cmp(am, bm);
    return a.negative ? -c : c;
}

static void bd_align(const BigDec &a, const BigDec &b, BI &am, BI &bm, int &out_scale) {
    out_scale = std::max(a.scale, b.scale);
    am = bi_mul_pow10(a.digits, out_scale - a.scale);
    bm = bi_mul_pow10(b.digits, out_scale - b.scale);
}

static bool bd_parse(const char *s, BigDec &out) {
    if (!s) return false;
    while (*s == ' ' || *s == '\t') s++;
    bool neg = false;
    if (*s == '+') s++;
    else if (*s == '-') { neg = true; s++; }
    std::string intPart, fracPart;
    while (*s >= '0' && *s <= '9') intPart.push_back(*s++);
    if (*s == '.') {
        s++;
        while (*s >= '0' && *s <= '9') fracPart.push_back(*s++);
    }
    if (intPart.empty() && fracPart.empty()) return false;
    int exp = 0;
    if (*s == 'e' || *s == 'E') {
        s++;
        bool enegative = false;
        if (*s == '+') s++;
        else if (*s == '-') { enegative = true; s++; }
        if (!(*s >= '0' && *s <= '9')) return false;
        while (*s >= '0' && *s <= '9') {
            exp = exp * 10 + (*s - '0');
            if (exp > 1000000000) return false;
            s++;
        }
        if (enegative) exp = -exp;
    }
    while (*s == ' ' || *s == '\t') s++;
    if (*s != '\0') return false;
    std::string all = intPart + fracPart;
    size_t firstNonZero = 0;
    while (firstNonZero + 1 < all.size() && all[firstNonZero] == '0') firstNonZero++;
    if (firstNonZero) all = all.substr(firstNonZero);
    out.digits = bi_from_decimal(all.c_str());
    out.scale = (int)fracPart.size() - exp;
    out.negative = neg && !bi_is_zero(out.digits);
    return true;
}

static std::string bd_to_plain_string(const BigDec &a) {
    if (bi_is_zero(a.digits)) {
        if (a.scale <= 0) {
            if (a.scale == 0) return "0";
            std::string s = "0";
            s.append(-a.scale, '0');
            return s;
        } else {
            std::string s = "0.";
            s.append(a.scale, '0');
            return s;
        }
    }
    std::string mag = bi_to_decimal(a.digits);
    std::string result;
    if (a.scale == 0) {
        result = mag;
    } else if (a.scale < 0) {
        result = mag;
        result.append(-a.scale, '0');
    } else if (a.scale < (int)mag.size()) {
        result = mag.substr(0, mag.size() - a.scale) + "." + mag.substr(mag.size() - a.scale);
    } else {
        result = "0.";
        result.append(a.scale - (int)mag.size(), '0');
        result += mag;
    }
    if (a.negative) result = "-" + result;
    return result;
}

static void bd_add(const BigDec &pa, const BigDec &pb, BigDec &out) {
    BI am, bm; int scale;
    bd_align(pa, pb, am, bm, scale);
    out.scale = scale;
    if (pa.negative == pb.negative) {
        out.digits = bi_add(am, bm);
        out.negative = pa.negative;
    } else {
        int c = bi_cmp(am, bm);
        if (c == 0) { out.digits.clear(); out.negative = false; }
        else if (c > 0) { out.digits = bi_sub(am, bm); out.negative = pa.negative; }
        else            { out.digits = bi_sub(bm, am); out.negative = pb.negative; }
    }
    out.normalize_zero();
}

static void bd_sub(const BigDec &pa, const BigDec &pb, BigDec &out) {
    BigDec negB = pb;
    if (!bi_is_zero(negB.digits)) negB.negative = !negB.negative;
    bd_add(pa, negB, out);
}

static void bd_mul(const BigDec &pa, const BigDec &pb, BigDec &out) {
    out.digits = bi_mul(pa.digits, pb.digits);
    out.scale = pa.scale + pb.scale;
    out.negative = (pa.negative != pb.negative);
    out.normalize_zero();
}

// 簡易除算 (precision=30 で切り捨て)
static bool bd_div(const BigDec &pa, const BigDec &pb, BigDec &out) {
    if (bi_is_zero(pb.digits)) return false;
    const int precision = 30;
    int shift = precision + pb.scale - pa.scale;
    BI num = pa.digits;
    BI den = pb.digits;
    if (shift > 0) num = bi_mul_pow10(num, shift);
    else if (shift < 0) den = bi_mul_pow10(den, -shift);
    BI rem;
    BI q = bi_divmod(num, den, &rem);
    out.digits = q;
    out.scale = precision;
    out.negative = (pa.negative != pb.negative) && !bi_is_zero(out.digits);
    out.normalize_zero();
    return true;
}

}  // namespace bd

// ============================================================
// HSPVAR callbacks
// ============================================================

static int mytype = HSPVAR_FLAG_USERDEF;
static short *aftertype = nullptr;

static BigDec cnv_tmp_static;
static BigDec *cnv_tmp_slot = nullptr;
static char cnv_custom_str[1024];
static int cnv_custom_int = 0;
static double cnv_custom_double = 0.0;

static BigDec *ref_ptr = nullptr;
void HspVarBigDec_SetRefValue(BigDec *p) { ref_ptr = p; }
void *HspVarBigDec_GetRefValuePtr(void) { return &ref_ptr; }

BigDec *HspVarBigDec_NewFromStr(const char *s) {
    BigDec *p = new BigDec();
    if (s) bd::bd_parse(s, *p);
    return p;
}

void HspVarBigDec_Delete(BigDec *p) { delete p; }

static inline BigDec **slot_ptr(PVal *pval) {
    return ((BigDec **)(pval->pt)) + pval->offset;
}

static PDAT *HspVarBigDec_GetPtr(PVal *pval) {
    return (PDAT *)slot_ptr(pval);
}

static void *HspVarBigDec_Cnv(const void *buffer, int flag) {
    switch (flag) {
    case HSPVAR_FLAG_STR: {
        cnv_tmp_static = BigDec();
        bd::bd_parse((const char *)buffer, cnv_tmp_static);
        break;
    }
    case HSPVAR_FLAG_INT: {
        char tmp[32];
        std::snprintf(tmp, sizeof(tmp), "%d", *(const int *)buffer);
        cnv_tmp_static = BigDec();
        bd::bd_parse(tmp, cnv_tmp_static);
        break;
    }
    case HSPVAR_FLAG_DOUBLE: {
        char tmp[64];
        std::snprintf(tmp, sizeof(tmp), "%.18g", *(const double *)buffer);
        cnv_tmp_static = BigDec();
        bd::bd_parse(tmp, cnv_tmp_static);
        break;
    }
    default:
        throw HSPVAR_ERROR_TYPEMISS;
    }
    cnv_tmp_slot = &cnv_tmp_static;
    return &cnv_tmp_slot;
}

static void *HspVarBigDec_CnvCustom(const void *buffer, int flag) {
    BigDec *p = *(BigDec * const *)buffer;
    if (p == nullptr) {
        switch (flag) {
        case HSPVAR_FLAG_STR:    cnv_custom_str[0] = '0'; cnv_custom_str[1] = 0; return cnv_custom_str;
        case HSPVAR_FLAG_INT:    cnv_custom_int = 0; return &cnv_custom_int;
        case HSPVAR_FLAG_DOUBLE: cnv_custom_double = 0.0; return &cnv_custom_double;
        default: throw HSPVAR_ERROR_TYPEMISS;
        }
    }
    switch (flag) {
    case HSPVAR_FLAG_STR: {
        std::string s = bd::bd_to_plain_string(*p);
        int n = (int)s.size();
        if (n >= (int)sizeof(cnv_custom_str)) n = (int)sizeof(cnv_custom_str) - 1;
        std::memcpy(cnv_custom_str, s.data(), n);
        cnv_custom_str[n] = 0;
        return cnv_custom_str;
    }
    case HSPVAR_FLAG_INT:
        cnv_custom_int = std::atoi(bd::bd_to_plain_string(*p).c_str());
        return &cnv_custom_int;
    case HSPVAR_FLAG_DOUBLE:
        cnv_custom_double = std::atof(bd::bd_to_plain_string(*p).c_str());
        return &cnv_custom_double;
    default:
        throw HSPVAR_ERROR_TYPEMISS;
    }
}

static int HspVarBigDec_GetSize(const PDAT *pdat) { (void)pdat; return (int)sizeof(BigDec *); }

static int GetVarSize(PVal *pval) {
    int size = pval->len[1];
    if (pval->len[2]) size *= pval->len[2];
    if (pval->len[3]) size *= pval->len[3];
    if (pval->len[4]) size *= pval->len[4];
    size *= (int)sizeof(BigDec *);
    return size;
}

static void HspVarBigDec_Free(PVal *pval) {
    if (pval->mode == HSPVAR_MODE_MALLOC && pval->pt) {
        int count = pval->size / (int)sizeof(BigDec *);
        BigDec **arr = (BigDec **)pval->pt;
        for (int i = 0; i < count; ++i) if (arr[i]) { delete arr[i]; arr[i] = nullptr; }
        hspfree(pval->pt);
    }
    pval->pt = nullptr;
    pval->mode = HSPVAR_MODE_NONE;
}

static void HspVarBigDec_Alloc(PVal *pval, const PVal *pval2) {
    int i, size;
    if (pval->len[1] < 1) pval->len[1] = 1;
    size = GetVarSize(pval);
    int new_count = size / (int)sizeof(BigDec *);
    BigDec **new_arr = (BigDec **)hspmalloc(size);
    for (i = 0; i < new_count; ++i) new_arr[i] = new BigDec();

    if (pval2 != nullptr) {
        int old_count = pval->size / (int)sizeof(BigDec *);
        BigDec **old_arr = (BigDec **)pval->pt;
        int copy_count = old_count < new_count ? old_count : new_count;
        for (i = 0; i < copy_count; ++i) {
            if (old_arr[i]) {
                delete new_arr[i];
                new_arr[i] = old_arr[i];
                old_arr[i] = nullptr;
            }
        }
        for (i = 0; i < old_count; ++i) if (old_arr[i]) { delete old_arr[i]; old_arr[i] = nullptr; }
        hspfree(pval->pt);
    }
    pval->mode = HSPVAR_MODE_MALLOC;
    pval->pt = (char *)new_arr;
    pval->size = size;
}

static void HspVarBigDec_Set(PVal *pval, PDAT *pdat, const void *in) {
    (void)pval;
    BigDec **slot = (BigDec **)pdat;
    const BigDec *src = *(BigDec * const *)in;
    if (*slot) { delete *slot; *slot = nullptr; }
    if (src) *slot = new BigDec(*src);
    else     *slot = new BigDec();
}

// ---- 算術 ----
static inline void assign_slot(BigDec **slot, BigDec *r) { *slot = r; }

static void HspVarBigDec_AddI(PDAT *pval, const void *val) {
    BigDec **slot = (BigDec **)pval;
    const BigDec *b = *(BigDec * const *)val;
    BigDec zero;
    BigDec *r = new BigDec();
    bd::bd_add(*slot ? **slot : zero, b ? *b : zero, *r);
    assign_slot(slot, r);
    *aftertype = (short)mytype;
}

static void HspVarBigDec_SubI(PDAT *pval, const void *val) {
    BigDec **slot = (BigDec **)pval;
    const BigDec *b = *(BigDec * const *)val;
    BigDec zero;
    BigDec *r = new BigDec();
    bd::bd_sub(*slot ? **slot : zero, b ? *b : zero, *r);
    assign_slot(slot, r);
    *aftertype = (short)mytype;
}

static void HspVarBigDec_MulI(PDAT *pval, const void *val) {
    BigDec **slot = (BigDec **)pval;
    const BigDec *b = *(BigDec * const *)val;
    BigDec zero;
    BigDec *r = new BigDec();
    bd::bd_mul(*slot ? **slot : zero, b ? *b : zero, *r);
    assign_slot(slot, r);
    *aftertype = (short)mytype;
}

static void HspVarBigDec_DivI(PDAT *pval, const void *val) {
    BigDec **slot = (BigDec **)pval;
    const BigDec *b = *(BigDec * const *)val;
    if (!b || bd::bi_is_zero(b->digits)) throw HSPVAR_ERROR_DIVZERO;
    BigDec zero;
    BigDec *r = new BigDec();
    bd::bd_div(*slot ? **slot : zero, *b, *r);
    assign_slot(slot, r);
    *aftertype = (short)mytype;
}

static int cmp_slot(PDAT *pval, const void *val) {
    BigDec **slot = (BigDec **)pval;
    const BigDec *b = *(BigDec * const *)val;
    BigDec zero;
    const BigDec &a = *slot ? **slot : zero;
    return bd::bd_signed_cmp(a, b ? *b : zero);
}

static void HspVarBigDec_EqI(PDAT *pval, const void *val)   { *(int *)pval = (cmp_slot(pval, val) == 0) ? 1 : 0; *aftertype = HSPVAR_FLAG_INT; }
static void HspVarBigDec_NeI(PDAT *pval, const void *val)   { *(int *)pval = (cmp_slot(pval, val) != 0) ? 1 : 0; *aftertype = HSPVAR_FLAG_INT; }
static void HspVarBigDec_GtI(PDAT *pval, const void *val)   { *(int *)pval = (cmp_slot(pval, val) >  0) ? 1 : 0; *aftertype = HSPVAR_FLAG_INT; }
static void HspVarBigDec_LtI(PDAT *pval, const void *val)   { *(int *)pval = (cmp_slot(pval, val) <  0) ? 1 : 0; *aftertype = HSPVAR_FLAG_INT; }
static void HspVarBigDec_GtEqI(PDAT *pval, const void *val) { *(int *)pval = (cmp_slot(pval, val) >= 0) ? 1 : 0; *aftertype = HSPVAR_FLAG_INT; }
static void HspVarBigDec_LtEqI(PDAT *pval, const void *val) { *(int *)pval = (cmp_slot(pval, val) <= 0) ? 1 : 0; *aftertype = HSPVAR_FLAG_INT; }

static void *GetBlockSize(PVal *pval, PDAT *pdat, int *size) {
    *size = pval->size - (int)(((char *)pdat) - pval->pt);
    return (void *)pdat;
}

static void AllocBlock(PVal *pval, PDAT *pdat, int size) {
    (void)pval; (void)pdat; (void)size;
}

}  // namespace hspmathex_t

extern "C" int HspVarBigDec_typeid(void) {
    return hspmathex_t::mytype;
}

extern "C" void HspVarBigDec_Init(HspVarProc *p) {
    using namespace hspmathex_t;
    aftertype = &p->aftertype;

    p->Set          = HspVarBigDec_Set;
    p->Cnv          = HspVarBigDec_Cnv;
    p->CnvCustom    = HspVarBigDec_CnvCustom;
    p->GetPtr       = HspVarBigDec_GetPtr;
    p->GetSize      = HspVarBigDec_GetSize;
    p->GetBlockSize = GetBlockSize;
    p->AllocBlock   = AllocBlock;

    p->Alloc = HspVarBigDec_Alloc;
    p->Free  = HspVarBigDec_Free;

    p->AddI = HspVarBigDec_AddI;
    p->SubI = HspVarBigDec_SubI;
    p->MulI = HspVarBigDec_MulI;
    p->DivI = HspVarBigDec_DivI;

    p->EqI   = HspVarBigDec_EqI;
    p->NeI   = HspVarBigDec_NeI;
    p->GtI   = HspVarBigDec_GtI;
    p->LtI   = HspVarBigDec_LtI;
    p->GtEqI = HspVarBigDec_GtEqI;
    p->LtEqI = HspVarBigDec_LtEqI;

    p->vartype_name = (char *)"bigdec";
    p->version = 0x001;
    p->support = HSPVAR_SUPPORT_STORAGE | HSPVAR_SUPPORT_FLEXARRAY;
    p->basesize = (short)sizeof(BigDec *);

    mytype = p->flag;
}
