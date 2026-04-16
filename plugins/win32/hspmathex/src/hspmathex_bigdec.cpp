//
//  hspbigdec.dll - Arbitrary precision decimal arithmetic for HSP
//
//  Java BigDecimal equivalent. Handle-based API.
//
//  Internal representation:
//    BigDecimal  =  unscaled_value * 10^(-scale)
//    where unscaled_value is a BigInteger (arbitrary precision signed integer).
//
//  Example:
//    "3.14159" -> unscaled 314159, scale 5
//    "1000"    -> unscaled 1000,   scale 0
//    "1.5e10"  -> unscaled 15,     scale -9
//
#define WIN32_LEAN_AND_MEAN
#define NOMINMAX
#include <windows.h>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <cstdint>
#include <cmath>
#include <string>
#include <vector>
#include <algorithm>
#include <map>

#define EXPORT extern "C" __declspec(dllexport)

// hspmathex_bigint.cpp と衝突しないよう全体を namespace で囲む
namespace bigdec_impl {

// ===========================================================================
// BigInteger (unsigned magnitude + sign)
// ===========================================================================
// Stored as base-2^32 limbs, little-endian (digits[0] = least significant).
// Empty vector or {0} means zero.

typedef std::vector<uint32_t> BigInt;

static void bi_trim(BigInt &a) {
    while (!a.empty() && a.back() == 0) a.pop_back();
}

static bool bi_is_zero(const BigInt &a) {
    for (uint32_t w : a) if (w) return false;
    return true;
}

// Compare magnitudes: -1 if a<b, 0 if equal, 1 if a>b.
static int bi_cmp(const BigInt &a, const BigInt &b) {
    size_t la = a.size(), lb = b.size();
    while (la > 0 && a[la - 1] == 0) la--;
    while (lb > 0 && b[lb - 1] == 0) lb--;
    if (la != lb) return la < lb ? -1 : 1;
    for (size_t i = la; i-- > 0;) {
        if (a[i] != b[i]) return a[i] < b[i] ? -1 : 1;
    }
    return 0;
}

// a + b (unsigned)
static BigInt bi_add(const BigInt &a, const BigInt &b) {
    BigInt r;
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

// a - b (unsigned, requires a >= b)
static BigInt bi_sub(const BigInt &a, const BigInt &b) {
    BigInt r;
    r.reserve(a.size());
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

// a * b (schoolbook)
static BigInt bi_mul(const BigInt &a, const BigInt &b) {
    BigInt r;
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
            carry = cur >> 32;
            k++;
        }
    }
    bi_trim(r);
    return r;
}

// a * small (single 32-bit word)
static BigInt bi_mul_small(const BigInt &a, uint32_t b) {
    BigInt r;
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

// a / small, returns quotient; remainder stored in *rem if non-null.
static BigInt bi_divmod_small(const BigInt &a, uint32_t b, uint32_t *rem) {
    BigInt q;
    q.assign(a.size(), 0);
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

// Shift left by k whole limbs (multiply by 2^(32k))
static BigInt bi_shl_limbs(const BigInt &a, size_t k) {
    if (a.empty()) return a;
    BigInt r(a.size() + k, 0);
    for (size_t i = 0; i < a.size(); i++) r[i + k] = a[i];
    bi_trim(r);
    return r;
}

// Shift left by k bits (k can be > 32)
static BigInt bi_shl(const BigInt &a, size_t k) {
    if (a.empty() || k == 0) return a;
    size_t limbs = k / 32;
    size_t bits = k % 32;
    BigInt r = bi_shl_limbs(a, limbs);
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

// Knuth Algorithm D division: returns quotient, remainder in *rem if non-null.
static BigInt bi_divmod(const BigInt &a, const BigInt &b, BigInt *rem) {
    if (bi_is_zero(b)) {
        // caller should guard
        if (rem) rem->clear();
        return BigInt();
    }
    if (bi_cmp(a, b) < 0) {
        if (rem) *rem = a;
        return BigInt();
    }
    // Single-limb divisor fast path
    BigInt bb = b; bi_trim(bb);
    if (bb.size() == 1) {
        uint32_t r32;
        BigInt q = bi_divmod_small(a, bb[0], &r32);
        if (rem) { rem->clear(); if (r32) rem->push_back(r32); }
        return q;
    }
    // Normalize: shift so that top bit of divisor's MSB is 1.
    uint32_t top = bb.back();
    int shift = 0;
    while ((top & 0x80000000u) == 0) { top <<= 1; shift++; }
    BigInt u = bi_shl(a, shift);
    BigInt v = bi_shl(bb, shift);
    u.push_back(0); // extra limb for normalization
    size_t n = v.size();
    size_t m = u.size() - n - 1;

    BigInt q(m + 1, 0);
    for (ptrdiff_t j = (ptrdiff_t)m; j >= 0; j--) {
        // Estimate qhat
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
        // Multiply and subtract
        int64_t borrow = 0;
        uint64_t carry = 0;
        for (size_t i = 0; i < n; i++) {
            uint64_t p = qhat * (uint64_t)v[i] + carry;
            carry = p >> 32;
            int64_t t = (int64_t)u[j + i] - (int64_t)(p & 0xFFFFFFFFu) - borrow;
            if (t < 0) {
                t += ((int64_t)1 << 32);
                borrow = 1;
            } else borrow = 0;
            u[j + i] = (uint32_t)(t & 0xFFFFFFFFu);
        }
        int64_t t = (int64_t)u[j + n] - (int64_t)carry - borrow;
        bool negative = t < 0;
        if (negative) t += ((int64_t)1 << 32);
        u[j + n] = (uint32_t)(t & 0xFFFFFFFFu);

        if (negative) {
            // qhat was too big by 1; add back
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
        // Denormalize remainder: shift right by 'shift'
        u.resize(n);
        bi_trim(u);
        if (shift == 0) {
            *rem = u;
        } else {
            BigInt r = u;
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

// Convert decimal string (digits only, no sign) to BigInt.
static BigInt bi_from_decimal(const char *s) {
    BigInt r;
    while (*s == '0') s++;
    if (*s == '\0') return r;
    // Process in chunks of 9 decimal digits (fits in uint32_t).
    std::string buf(s);
    size_t len = buf.size();
    size_t first = len % 9;
    if (first == 0) first = 9;
    size_t pos = 0;
    uint32_t v = 0;
    for (size_t i = 0; i < first; i++) {
        if (buf[pos] < '0' || buf[pos] > '9') return BigInt();
        v = v * 10 + (buf[pos] - '0');
        pos++;
    }
    r.push_back(v);
    while (pos < len) {
        r = bi_mul_small(r, 1000000000u);
        v = 0;
        for (size_t i = 0; i < 9; i++) {
            if (buf[pos] < '0' || buf[pos] > '9') return BigInt();
            v = v * 10 + (buf[pos] - '0');
            pos++;
        }
        if (v) {
            // Add v
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

// Convert BigInt to decimal string (no sign). Empty -> "0".
static std::string bi_to_decimal(const BigInt &a) {
    if (bi_is_zero(a)) return "0";
    BigInt cur = a;
    std::string result;
    while (!bi_is_zero(cur)) {
        uint32_t r;
        cur = bi_divmod_small(cur, 1000000000u, &r);
        char buf[16];
        if (bi_is_zero(cur)) {
            std::snprintf(buf, sizeof(buf), "%u", r);
        } else {
            std::snprintf(buf, sizeof(buf), "%09u", r);
        }
        // Prepend
        result = std::string(buf) + result;
    }
    return result;
}

// Multiply BigInt by 10^n
static BigInt bi_mul_pow10(const BigInt &a, int n) {
    if (n <= 0 || bi_is_zero(a)) return a;
    BigInt r = a;
    // Multiply by 10^9 chunks while possible
    while (n >= 9) {
        r = bi_mul_small(r, 1000000000u);
        n -= 9;
    }
    uint32_t p = 1;
    for (int i = 0; i < n; i++) p *= 10;
    if (p > 1) r = bi_mul_small(r, p);
    return r;
}

// Divide BigInt by 10^n, return quotient, remainder optional.
static BigInt bi_div_pow10(const BigInt &a, int n, BigInt *rem) {
    if (n <= 0) { if (rem) rem->clear(); return a; }
    // Build 10^n as BigInt, then divmod.
    BigInt p;
    p.push_back(1);
    int left = n;
    while (left >= 9) {
        p = bi_mul_small(p, 1000000000u);
        left -= 9;
    }
    uint32_t sp = 1;
    for (int i = 0; i < left; i++) sp *= 10;
    if (sp > 1) p = bi_mul_small(p, sp);
    return bi_divmod(a, p, rem);
}

// Count decimal digits in BigInt (0 -> 1).
static int bi_decimal_digits(const BigInt &a) {
    if (bi_is_zero(a)) return 1;
    std::string s = bi_to_decimal(a);
    return (int)s.size();
}

// ===========================================================================
// BigDecimal
// ===========================================================================
struct BigDec {
    BigInt digits;  // unscaled magnitude
    bool negative;
    int scale;      // value = sign * digits * 10^(-scale)

    BigDec() : negative(false), scale(0) {}
    void normalize_zero() {
        if (bi_is_zero(digits)) negative = false;
    }
};

// Signed compare of BigDecs (same semantics as a <=> b: -1,0,1).
static int bd_signed_cmp(const BigDec &a, const BigDec &b) {
    bool za = bi_is_zero(a.digits);
    bool zb = bi_is_zero(b.digits);
    if (za && zb) return 0;
    if (za) return b.negative ? 1 : -1;
    if (zb) return a.negative ? -1 : 1;
    if (a.negative != b.negative) return a.negative ? -1 : 1;
    // Same sign: rescale to common scale and compare magnitudes.
    int common_scale = std::max(a.scale, b.scale);
    BigInt am = bi_mul_pow10(a.digits, common_scale - a.scale);
    BigInt bm = bi_mul_pow10(b.digits, common_scale - b.scale);
    int c = bi_cmp(am, bm);
    return a.negative ? -c : c;
}

// Add magnitudes rescaled to common scale; sign handled by caller.
static void bd_align(const BigDec &a, const BigDec &b,
                     BigInt &am, BigInt &bm, int &out_scale) {
    out_scale = std::max(a.scale, b.scale);
    am = bi_mul_pow10(a.digits, out_scale - a.scale);
    bm = bi_mul_pow10(b.digits, out_scale - b.scale);
}

// Rounding modes (match Java).
enum RoundingMode {
    RM_HALF_UP  = 0,
    RM_HALF_EVEN = 1,
    RM_DOWN     = 2,
    RM_UP       = 3,
    RM_FLOOR    = 4,
    RM_CEILING  = 5,
};

// Round the value (sign, quotient, remainder, divisor) under the given mode.
// Returns adjusted quotient magnitude.
// sign: +1 or -1 (of the original value).
// divisor: the power of 10 we divided by (nonzero).
static BigInt round_quotient(const BigInt &q, const BigInt &rem, const BigInt &divisor,
                             int sign, int mode) {
    if (bi_is_zero(rem)) return q;
    // Determine whether to round up (increment |q|).
    bool roundUp = false;
    int cmp_half;
    {
        // Compare 2*rem with divisor.
        BigInt twice = bi_add(rem, rem);
        cmp_half = bi_cmp(twice, divisor);
    }
    switch (mode) {
        case RM_DOWN:
            roundUp = false;
            break;
        case RM_UP:
            roundUp = true;
            break;
        case RM_FLOOR:
            // Round towards -inf: positive -> down, negative -> up.
            roundUp = (sign < 0);
            break;
        case RM_CEILING:
            // Round towards +inf.
            roundUp = (sign > 0);
            break;
        case RM_HALF_UP:
            roundUp = (cmp_half >= 0);
            break;
        case RM_HALF_EVEN:
            if (cmp_half > 0) roundUp = true;
            else if (cmp_half < 0) roundUp = false;
            else {
                // Tie: round to even.
                roundUp = (!q.empty() && (q[0] & 1u));
            }
            break;
        default:
            roundUp = (cmp_half >= 0);
            break;
    }
    if (!roundUp) return q;
    BigInt one; one.push_back(1);
    return bi_add(q, one);
}

// Rescale a BigDec to target_scale with rounding. Returns new BigDec.
static BigDec bd_rescale(const BigDec &a, int target_scale, int mode) {
    BigDec r;
    r.negative = a.negative;
    r.scale = target_scale;
    if (target_scale >= a.scale) {
        r.digits = bi_mul_pow10(a.digits, target_scale - a.scale);
    } else {
        int drop = a.scale - target_scale;
        // Build divisor = 10^drop
        BigInt div;
        div.push_back(1);
        int left = drop;
        while (left >= 9) { div = bi_mul_small(div, 1000000000u); left -= 9; }
        uint32_t sp = 1;
        for (int i = 0; i < left; i++) sp *= 10;
        if (sp > 1) div = bi_mul_small(div, sp);
        BigInt rem;
        BigInt q = bi_divmod(a.digits, div, &rem);
        int sign = a.negative ? -1 : 1;
        if (bi_is_zero(a.digits)) sign = 1;
        r.digits = round_quotient(q, rem, div, sign, mode);
    }
    r.normalize_zero();
    return r;
}

// Parse: "[-+]?digits[.digits]?[eE[-+]?digits]?"
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
    // Combined digits = intPart + fracPart; scale = fracPart.size() - exp
    std::string all = intPart + fracPart;
    // Trim leading zeros but keep at least one digit.
    size_t firstNonZero = 0;
    while (firstNonZero + 1 < all.size() && all[firstNonZero] == '0') firstNonZero++;
    if (firstNonZero) all = all.substr(firstNonZero);
    out.digits = bi_from_decimal(all.c_str());
    out.scale = (int)fracPart.size() - exp;
    out.negative = neg && !bi_is_zero(out.digits);
    return true;
}

// Format BigDec as "scientific" style when scale is negative or very large.
// Default: "123.45" or "-0.0001" or "1.5E+10".
static std::string bd_to_string(const BigDec &a) {
    if (bi_is_zero(a.digits)) {
        if (a.scale <= 0) {
            if (a.scale == 0) return "0";
            // Display as 0E+N
            char buf[32];
            std::snprintf(buf, sizeof(buf), "0E+%d", -a.scale);
            return buf;
        } else {
            // Scale > 0 zero: display as "0.000..."
            std::string s = "0.";
            s.append(a.scale, '0');
            return s;
        }
    }
    std::string mag = bi_to_decimal(a.digits);
    int digitsCount = (int)mag.size();
    // Java-style adjusted exponent = (digitsCount - 1) - scale
    int adjExp = (digitsCount - 1) - a.scale;
    std::string result;
    if (a.scale >= 0 && adjExp >= -6) {
        // Plain notation
        if (a.scale == 0) {
            result = mag;
        } else if (a.scale < digitsCount) {
            result = mag.substr(0, digitsCount - a.scale) + "." + mag.substr(digitsCount - a.scale);
        } else {
            // 0.000<mag>
            result = "0.";
            result.append(a.scale - digitsCount, '0');
            result += mag;
        }
    } else {
        // Scientific notation: first digit . rest E(+/-)adjExp
        if (mag.size() == 1) {
            result = mag;
        } else {
            result = mag.substr(0, 1) + "." + mag.substr(1);
        }
        char ebuf[32];
        std::snprintf(ebuf, sizeof(ebuf), "E%+d", adjExp);
        result += ebuf;
    }
    if (a.negative) result = "-" + result;
    return result;
}

// Plain (no scientific) representation.
static std::string bd_to_plain_string(const BigDec &a) {
    if (bi_is_zero(a.digits)) {
        if (a.scale <= 0) {
            if (a.scale == 0) return "0";
            // digits zero and scale negative -> "0" followed by -scale zeros
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
        // multiply by 10^(-scale) -> append zeros
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

// ===========================================================================
// Handle table
// ===========================================================================
static std::map<int, BigDec *> g_table;
static int g_next = 1;

static int store_handle(BigDec *p) {
    int h = g_next++;
    g_table[h] = p;
    return h;
}

static BigDec *lookup(int h) {
    auto it = g_table.find(h);
    if (it == g_table.end()) return nullptr;
    return it->second;
}

static void copy_out_string(const std::string &s, char *out, int maxlen) {
    if (!out || maxlen <= 0) return;
    int n = (int)s.size();
    if (n >= maxlen) n = maxlen - 1;
    std::memcpy(out, s.data(), n);
    out[n] = '\0';
}

} // namespace bigdec_impl

using namespace bigdec_impl;

// ===========================================================================
// Exported API
// ===========================================================================

EXPORT int __cdecl bigdec_create(const char *decimal_str)
{
    if (!decimal_str) return 0;
    BigDec *p = new BigDec();
    if (!bd_parse(decimal_str, *p)) {
        delete p;
        return 0;
    }
    return store_handle(p);
}

EXPORT int __cdecl bigdec_create_from_double(double val, int precision)
{
    if (precision < 0) precision = 0;
    if (precision > 18) precision = 18;
    BigDec *p = new BigDec();
    if (std::isnan(val) || std::isinf(val)) {
        // Treat as zero.
        p->digits.clear();
        p->scale = 0;
        p->negative = false;
        return store_handle(p);
    }
    char fmt[16];
    std::snprintf(fmt, sizeof(fmt), "%%.%df", precision);
    char buf[64];
    std::snprintf(buf, sizeof(buf), fmt, val);
    if (!bd_parse(buf, *p)) {
        p->digits.clear();
        p->scale = 0;
        p->negative = false;
    }
    return store_handle(p);
}

EXPORT int __cdecl bigdec_clone(int h)
{
    BigDec *src = lookup(h);
    if (!src) return 0;
    BigDec *p = new BigDec(*src);
    return store_handle(p);
}

EXPORT int __cdecl bigdec_free(int h)
{
    auto it = g_table.find(h);
    if (it != g_table.end()) {
        delete it->second;
        g_table.erase(it);
    }
    return 0;
}

EXPORT int __cdecl bigdec_to_str(int h, char *out, int maxlen)
{
    BigDec *p = lookup(h);
    if (!p) { if (out && maxlen > 0) out[0] = '\0'; return -1; }
    std::string s = bd_to_string(*p);
    copy_out_string(s, out, maxlen);
    return 0;
}

EXPORT int __cdecl bigdec_to_plain_str(int h, char *out, int maxlen)
{
    BigDec *p = lookup(h);
    if (!p) { if (out && maxlen > 0) out[0] = '\0'; return -1; }
    std::string s = bd_to_plain_string(*p);
    copy_out_string(s, out, maxlen);
    return 0;
}

EXPORT int __cdecl bigdec_to_double(int h, double *out)
{
    BigDec *p = lookup(h);
    if (!p || !out) return -1;
    std::string s = bd_to_string(*p);
    *out = std::atof(s.c_str());
    return 0;
}

EXPORT int __cdecl bigdec_add(int a, int b)
{
    BigDec *pa = lookup(a), *pb = lookup(b);
    if (!pa || !pb) return 0;
    BigDec *r = new BigDec();
    BigInt am, bm; int scale;
    bd_align(*pa, *pb, am, bm, scale);
    r->scale = scale;
    if (pa->negative == pb->negative) {
        r->digits = bi_add(am, bm);
        r->negative = pa->negative;
    } else {
        int c = bi_cmp(am, bm);
        if (c == 0) {
            r->digits.clear();
            r->negative = false;
        } else if (c > 0) {
            r->digits = bi_sub(am, bm);
            r->negative = pa->negative;
        } else {
            r->digits = bi_sub(bm, am);
            r->negative = pb->negative;
        }
    }
    r->normalize_zero();
    return store_handle(r);
}

EXPORT int __cdecl bigdec_sub(int a, int b)
{
    BigDec *pa = lookup(a), *pb = lookup(b);
    if (!pa || !pb) return 0;
    // a - b == a + (-b)
    BigDec negB = *pb;
    if (!bi_is_zero(negB.digits)) negB.negative = !negB.negative;
    // Re-store negB in a temporary handle, reuse add
    BigDec *r = new BigDec();
    BigInt am, bm; int scale;
    bd_align(*pa, negB, am, bm, scale);
    r->scale = scale;
    if (pa->negative == negB.negative) {
        r->digits = bi_add(am, bm);
        r->negative = pa->negative;
    } else {
        int c = bi_cmp(am, bm);
        if (c == 0) {
            r->digits.clear();
            r->negative = false;
        } else if (c > 0) {
            r->digits = bi_sub(am, bm);
            r->negative = pa->negative;
        } else {
            r->digits = bi_sub(bm, am);
            r->negative = negB.negative;
        }
    }
    r->normalize_zero();
    return store_handle(r);
}

EXPORT int __cdecl bigdec_mul(int a, int b)
{
    BigDec *pa = lookup(a), *pb = lookup(b);
    if (!pa || !pb) return 0;
    BigDec *r = new BigDec();
    r->digits = bi_mul(pa->digits, pb->digits);
    r->scale = pa->scale + pb->scale;
    r->negative = (pa->negative != pb->negative);
    r->normalize_zero();
    return store_handle(r);
}

EXPORT int __cdecl bigdec_div(int a, int b, int precision, int rounding_mode)
{
    BigDec *pa = lookup(a), *pb = lookup(b);
    if (!pa || !pb) return 0;
    if (bi_is_zero(pb->digits)) return 0;
    if (precision < 0) precision = 0;
    BigDec *r = new BigDec();
    // We want result = a/b with scale = precision.
    //   (|a| * 10^(precision + b.scale - a.scale)) / |b|, round, scale = precision.
    int shift = precision + pb->scale - pa->scale;
    BigInt num = pa->digits;
    BigInt den = pb->digits;
    if (shift > 0) num = bi_mul_pow10(num, shift);
    else if (shift < 0) den = bi_mul_pow10(den, -shift);
    BigInt rem;
    BigInt q = bi_divmod(num, den, &rem);
    int sign = (pa->negative != pb->negative) ? -1 : 1;
    if (bi_is_zero(pa->digits)) sign = 1;
    q = round_quotient(q, rem, den, sign, rounding_mode);
    r->digits = q;
    r->scale = precision;
    r->negative = (pa->negative != pb->negative);
    r->normalize_zero();
    return store_handle(r);
}

EXPORT int __cdecl bigdec_pow(int a, int exp)
{
    BigDec *pa = lookup(a);
    if (!pa) return 0;
    BigDec *r = new BigDec();
    if (exp == 0) {
        r->digits.clear(); r->digits.push_back(1);
        r->scale = 0;
        r->negative = false;
        return store_handle(r);
    }
    if (exp < 0) {
        // Not supported without precision; return zero handle.
        delete r;
        return 0;
    }
    // Repeated squaring on magnitude; scale multiplies as well.
    BigInt base = pa->digits;
    int base_scale = pa->scale;
    BigInt result; result.push_back(1);
    int result_scale = 0;
    bool base_neg = pa->negative;
    bool result_neg = false;
    int e = exp;
    while (e > 0) {
        if (e & 1) {
            result = bi_mul(result, base);
            result_scale += base_scale;
            if (base_neg) result_neg = !result_neg;
        }
        e >>= 1;
        if (e) {
            base = bi_mul(base, base);
            base_scale += base_scale;
            // base_neg * base_neg = positive
            base_neg = false;
        }
    }
    r->digits = result;
    r->scale = result_scale;
    r->negative = result_neg && !bi_is_zero(r->digits);
    return store_handle(r);
}

EXPORT int __cdecl bigdec_abs(int a)
{
    BigDec *pa = lookup(a);
    if (!pa) return 0;
    BigDec *r = new BigDec(*pa);
    r->negative = false;
    return store_handle(r);
}

EXPORT int __cdecl bigdec_neg(int a)
{
    BigDec *pa = lookup(a);
    if (!pa) return 0;
    BigDec *r = new BigDec(*pa);
    if (!bi_is_zero(r->digits)) r->negative = !r->negative;
    return store_handle(r);
}

EXPORT int __cdecl bigdec_round(int a, int precision, int mode)
{
    BigDec *pa = lookup(a);
    if (!pa) return 0;
    BigDec *r = new BigDec(bd_rescale(*pa, precision, mode));
    return store_handle(r);
}

EXPORT int __cdecl bigdec_scale(int a, int new_scale, int mode)
{
    BigDec *pa = lookup(a);
    if (!pa) return 0;
    BigDec *r = new BigDec(bd_rescale(*pa, new_scale, mode));
    return store_handle(r);
}

EXPORT int __cdecl bigdec_cmp(int a, int b)
{
    BigDec *pa = lookup(a), *pb = lookup(b);
    if (!pa || !pb) return 0;
    return bd_signed_cmp(*pa, *pb);
}

EXPORT int __cdecl bigdec_get_scale(int a)
{
    BigDec *pa = lookup(a);
    if (!pa) return 0;
    return pa->scale;
}

EXPORT int __cdecl bigdec_get_precision(int a)
{
    BigDec *pa = lookup(a);
    if (!pa) return 0;
    return bi_decimal_digits(pa->digits);
}

// Square root by Newton's method, computed to the requested scale.
//
// Using integer square root on (digits * 10^(2*precision - scale)) gives us
// sqrt(value) scaled by 10^precision.
EXPORT int __cdecl bigdec_sqrt(int a, int precision)
{
    BigDec *pa = lookup(a);
    if (!pa) return 0;
    if (pa->negative && !bi_is_zero(pa->digits)) return 0;
    if (precision < 0) precision = 0;
    BigDec *r = new BigDec();
    if (bi_is_zero(pa->digits)) {
        r->scale = precision;
        r->negative = false;
        return store_handle(r);
    }
    // shift = 2*precision - scale; we need it even so that the resulting
    // sqrt lives at scale = precision.
    int shift = 2 * precision - pa->scale;
    BigInt n = pa->digits;
    if (shift > 0) n = bi_mul_pow10(n, shift);
    else if (shift < 0) {
        // Drop digits; division by 10^(-shift) with truncation.
        BigInt rem;
        n = bi_div_pow10(n, -shift, &rem);
    }
    // Integer sqrt via Newton's iteration on BigInts:
    //   x_{k+1} = (x_k + n / x_k) / 2
    // Initial guess: x_0 = 2^(ceil(bitlen(n)/2)).
    // Compute bit length of n.
    size_t bits = 0;
    if (!n.empty()) {
        uint32_t top = n.back();
        int b = 0;
        while (top) { top >>= 1; b++; }
        bits = (n.size() - 1) * 32 + (size_t)b;
    }
    BigInt x;
    x.push_back(1);
    x = bi_shl(x, (bits + 1) / 2 + 1);
    for (int iter = 0; iter < 200; iter++) {
        BigInt q = bi_divmod(n, x, nullptr);
        BigInt s = bi_add(x, q);
        // divide by 2
        uint32_t rem32;
        BigInt next = bi_divmod_small(s, 2u, &rem32);
        if (bi_cmp(next, x) >= 0) break;
        x = next;
    }
    // Verify x*x <= n < (x+1)*(x+1)
    BigInt one; one.push_back(1);
    while (true) {
        BigInt x2 = bi_mul(x, x);
        if (bi_cmp(x2, n) <= 0) break;
        x = bi_sub(x, one);
    }
    while (true) {
        BigInt xp1 = bi_add(x, one);
        BigInt x2 = bi_mul(xp1, xp1);
        if (bi_cmp(x2, n) > 0) break;
        x = xp1;
    }
    r->digits = x;
    r->scale = precision;
    r->negative = false;
    r->normalize_zero();
    return store_handle(r);
}

// DllMain は hspmathex_bigint.cpp に集約
