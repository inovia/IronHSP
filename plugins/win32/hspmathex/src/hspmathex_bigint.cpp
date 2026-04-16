//============================================================
//   hspbigint.dll — Arbitrary-precision integer plugin
//
//   任意精度整数 (Java の BigInteger / Python の int 相当)
//
//   実装: little-endian 32-bit limb + sign。
//         加減乗除・剰余・冪・GCD・ビット演算・比較・文字列化。
//         外部依存なし (純 C++)。
//
//   ハンドル方式: 0 は invalid。create 系が正の handle を返す。
//                 mutex で protect。最大 1024 スロット。
//
//   出力: hspbigint.dll (Win32) / hspbigint_64.dll (x64)
//============================================================

#define WIN32_LEAN_AND_MEAN
#include <windows.h>

#include <algorithm>
#include <array>
#include <cstdint>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <mutex>
#include <string>
#include <vector>

#define HSPBIGINT_EXPORT extern "C" __declspec(dllexport)

// ============================================================
// BigInt — sign-magnitude, little-endian base 2^32 limbs
// ============================================================
namespace {

struct BigInt {
    // limbs[0] = LSB. 末尾 (MSB) の 0 は正規化で除去する。
    // 値が 0 のとき limbs は空、sign = 0 (false)。
    std::vector<uint32_t> limbs;
    bool negative = false;  // sign flag (true = 負)

    BigInt() = default;

    explicit BigInt(int64_t v) {
        from_int64(v);
    }

    void from_int64(int64_t v) {
        limbs.clear();
        negative = false;
        if (v == 0) return;
        uint64_t u;
        if (v < 0) {
            negative = true;
            // INT64_MIN 回避: unsigned で受ける
            u = (uint64_t)-(v + 1) + 1u;
        } else {
            u = (uint64_t)v;
        }
        limbs.push_back((uint32_t)(u & 0xFFFFFFFFu));
        uint32_t hi = (uint32_t)(u >> 32);
        if (hi) limbs.push_back(hi);
    }

    void normalize() {
        while (!limbs.empty() && limbs.back() == 0) limbs.pop_back();
        if (limbs.empty()) negative = false;  // -0 を +0 に
    }

    bool is_zero() const { return limbs.empty(); }

    int sign() const {
        if (limbs.empty()) return 0;
        return negative ? -1 : 1;
    }

    // |this| vs |other|
    static int cmp_abs(const BigInt& a, const BigInt& b) {
        if (a.limbs.size() != b.limbs.size())
            return a.limbs.size() < b.limbs.size() ? -1 : 1;
        for (size_t i = a.limbs.size(); i-- > 0;) {
            if (a.limbs[i] != b.limbs[i])
                return a.limbs[i] < b.limbs[i] ? -1 : 1;
        }
        return 0;
    }

    static int cmp(const BigInt& a, const BigInt& b) {
        int sa = a.sign();
        int sb = b.sign();
        if (sa != sb) return sa < sb ? -1 : 1;
        if (sa == 0) return 0;
        int c = cmp_abs(a, b);
        return sa > 0 ? c : -c;
    }

    int64_t to_int64() const {
        if (limbs.empty()) return 0;
        uint64_t u = (uint64_t)limbs[0];
        if (limbs.size() >= 2) u |= ((uint64_t)limbs[1]) << 32;
        // 最上位ビットの扱いは単純切り捨て
        if (negative) {
            // 符号付き 64bit 範囲をまたぐ可能性あり — wrap で返す
            return (int64_t)(~u + 1);
        }
        return (int64_t)u;
    }

    int bitlen() const {
        if (limbs.empty()) return 0;
        uint32_t hi = limbs.back();
        int n = 0;
        while (hi) { n++; hi >>= 1; }
        return (int)(limbs.size() - 1) * 32 + n;
    }
};

// ------------------------------------------------------------
// 低レベル演算: |a| + |b|, |a| - |b| (要 |a| >= |b|), mul, divmod
// ------------------------------------------------------------

void add_abs(const BigInt& a, const BigInt& b, BigInt& r) {
    const auto& x = a.limbs.size() >= b.limbs.size() ? a.limbs : b.limbs;
    const auto& y = a.limbs.size() >= b.limbs.size() ? b.limbs : a.limbs;
    r.limbs.assign(x.size() + 1, 0);
    uint64_t carry = 0;
    for (size_t i = 0; i < x.size(); ++i) {
        uint64_t yi = i < y.size() ? y[i] : 0;
        uint64_t s = (uint64_t)x[i] + yi + carry;
        r.limbs[i] = (uint32_t)(s & 0xFFFFFFFFu);
        carry = s >> 32;
    }
    r.limbs[x.size()] = (uint32_t)carry;
    r.normalize();
}

// r = |a| - |b|,  要: |a| >= |b|
void sub_abs(const BigInt& a, const BigInt& b, BigInt& r) {
    r.limbs.assign(a.limbs.size(), 0);
    int64_t borrow = 0;
    for (size_t i = 0; i < a.limbs.size(); ++i) {
        int64_t bi = i < b.limbs.size() ? (int64_t)b.limbs[i] : 0;
        int64_t d = (int64_t)a.limbs[i] - bi - borrow;
        if (d < 0) { d += (int64_t)1 << 32; borrow = 1; } else { borrow = 0; }
        r.limbs[i] = (uint32_t)d;
    }
    r.normalize();
}

void add(const BigInt& a, const BigInt& b, BigInt& r) {
    if (a.negative == b.negative) {
        add_abs(a, b, r);
        r.negative = a.negative;
        r.normalize();
    } else {
        int c = BigInt::cmp_abs(a, b);
        if (c == 0) { r.limbs.clear(); r.negative = false; return; }
        if (c > 0) { sub_abs(a, b, r); r.negative = a.negative; }
        else       { sub_abs(b, a, r); r.negative = b.negative; }
        r.normalize();
    }
}

void sub(const BigInt& a, const BigInt& b, BigInt& r) {
    BigInt nb = b;
    nb.negative = !b.negative;
    if (nb.limbs.empty()) nb.negative = false;
    add(a, nb, r);
}

// schoolbook multiply (modest size 想定)
void mul(const BigInt& a, const BigInt& b, BigInt& r) {
    if (a.limbs.empty() || b.limbs.empty()) {
        r.limbs.clear();
        r.negative = false;
        return;
    }
    r.limbs.assign(a.limbs.size() + b.limbs.size(), 0);
    for (size_t i = 0; i < a.limbs.size(); ++i) {
        uint64_t carry = 0;
        uint64_t ai = a.limbs[i];
        for (size_t j = 0; j < b.limbs.size(); ++j) {
            uint64_t cur = (uint64_t)r.limbs[i + j]
                         + ai * (uint64_t)b.limbs[j] + carry;
            r.limbs[i + j] = (uint32_t)(cur & 0xFFFFFFFFu);
            carry = cur >> 32;
        }
        r.limbs[i + b.limbs.size()] += (uint32_t)carry;
    }
    r.negative = a.negative != b.negative;
    r.normalize();
}

// 単一 limb による |a| 除算: r = a / d, rem_out = a % d
uint32_t div_small(const BigInt& a, uint32_t d, BigInt& r) {
    r.limbs.assign(a.limbs.size(), 0);
    uint64_t rem = 0;
    for (size_t i = a.limbs.size(); i-- > 0;) {
        uint64_t cur = (rem << 32) | (uint64_t)a.limbs[i];
        r.limbs[i] = (uint32_t)(cur / d);
        rem = cur % d;
    }
    r.normalize();
    return (uint32_t)rem;
}

// ---- binary long division: |a| / |b| ----
// 素朴だが確実。q = |a|/|b|,  rem = |a| - q*|b|  (共に非負)
// サイズ中程度 (数千 bit) までは十分実用。
void divmod_abs(const BigInt& a, const BigInt& b, BigInt& q, BigInt& rem) {
    q.limbs.clear(); q.negative = false;
    rem.limbs.clear(); rem.negative = false;

    if (b.limbs.empty()) {
        // 除数 0 — 結果を 0 にして呼び出し側で検出
        return;
    }
    if (BigInt::cmp_abs(a, b) < 0) {
        rem = a;
        rem.negative = false;
        return;
    }
    // 単一 limb 除算で速くなるケース
    if (b.limbs.size() == 1) {
        uint32_t r32 = div_small(a, b.limbs[0], q);
        if (r32) { rem.limbs.push_back(r32); }
        return;
    }

    int bits = a.bitlen();
    q.limbs.assign((bits + 31) / 32, 0);

    BigInt shifted;
    for (int i = bits - 1; i >= 0; --i) {
        // rem = rem<<1 | bit(a, i)
        // 左 1 シフト
        uint32_t carry = 0;
        for (auto& limb : rem.limbs) {
            uint32_t newc = limb >> 31;
            limb = (limb << 1) | carry;
            carry = newc;
        }
        if (carry) rem.limbs.push_back(carry);

        uint32_t bit = (a.limbs[i / 32] >> (i % 32)) & 1u;
        if (bit) {
            if (rem.limbs.empty()) rem.limbs.push_back(1);
            else rem.limbs[0] |= 1u;
        }
        rem.normalize();

        if (BigInt::cmp_abs(rem, b) >= 0) {
            BigInt t;
            sub_abs(rem, b, t);
            rem = std::move(t);
            // quotient bit i を立てる
            q.limbs[i / 32] |= (1u << (i % 32));
        }
    }
    q.normalize();
    rem.normalize();
}

// ---- bit ops: 正の数として扱う (符号は捨てる) ----
// 2の補数的な semantics にしないシンプル版 — |a| op |b|。
void band_abs(const BigInt& a, const BigInt& b, BigInt& r) {
    size_t n = std::min(a.limbs.size(), b.limbs.size());
    r.limbs.assign(n, 0);
    for (size_t i = 0; i < n; ++i) r.limbs[i] = a.limbs[i] & b.limbs[i];
    r.normalize();
}
void bor_abs(const BigInt& a, const BigInt& b, BigInt& r) {
    size_t n = std::max(a.limbs.size(), b.limbs.size());
    r.limbs.assign(n, 0);
    for (size_t i = 0; i < n; ++i) {
        uint32_t x = i < a.limbs.size() ? a.limbs[i] : 0;
        uint32_t y = i < b.limbs.size() ? b.limbs[i] : 0;
        r.limbs[i] = x | y;
    }
    r.normalize();
}
void bxor_abs(const BigInt& a, const BigInt& b, BigInt& r) {
    size_t n = std::max(a.limbs.size(), b.limbs.size());
    r.limbs.assign(n, 0);
    for (size_t i = 0; i < n; ++i) {
        uint32_t x = i < a.limbs.size() ? a.limbs[i] : 0;
        uint32_t y = i < b.limbs.size() ? b.limbs[i] : 0;
        r.limbs[i] = x ^ y;
    }
    r.normalize();
}

void shl(const BigInt& a, int bits, BigInt& r) {
    if (bits < 0) { r.limbs.clear(); r.negative = false; return; }
    if (a.limbs.empty() || bits == 0) { r = a; return; }
    int word_shift = bits / 32;
    int bit_shift = bits % 32;
    r.limbs.assign(a.limbs.size() + word_shift + 1, 0);
    if (bit_shift == 0) {
        for (size_t i = 0; i < a.limbs.size(); ++i)
            r.limbs[i + word_shift] = a.limbs[i];
    } else {
        uint64_t carry = 0;
        for (size_t i = 0; i < a.limbs.size(); ++i) {
            uint64_t v = ((uint64_t)a.limbs[i] << bit_shift) | carry;
            r.limbs[i + word_shift] = (uint32_t)(v & 0xFFFFFFFFu);
            carry = v >> 32;
        }
        r.limbs[a.limbs.size() + word_shift] = (uint32_t)carry;
    }
    r.negative = a.negative;
    r.normalize();
}

void shr(const BigInt& a, int bits, BigInt& r) {
    if (bits < 0) { r.limbs.clear(); r.negative = false; return; }
    if (a.limbs.empty() || bits == 0) { r = a; return; }
    int word_shift = bits / 32;
    int bit_shift = bits % 32;
    if ((size_t)word_shift >= a.limbs.size()) { r.limbs.clear(); r.negative = false; return; }
    size_t new_n = a.limbs.size() - word_shift;
    r.limbs.assign(new_n, 0);
    if (bit_shift == 0) {
        for (size_t i = 0; i < new_n; ++i) r.limbs[i] = a.limbs[i + word_shift];
    } else {
        for (size_t i = 0; i < new_n; ++i) {
            uint64_t low = a.limbs[i + word_shift];
            uint64_t high = (i + word_shift + 1 < a.limbs.size())
                          ? a.limbs[i + word_shift + 1] : 0;
            uint64_t v = (low >> bit_shift) | (high << (32 - bit_shift));
            r.limbs[i] = (uint32_t)(v & 0xFFFFFFFFu);
        }
    }
    r.negative = a.negative;
    r.normalize();
}

// ------------------------------------------------------------
// 文字列 <-> BigInt
// ------------------------------------------------------------

// decimal string → BigInt
bool from_decimal(const char* s, BigInt& out) {
    out.limbs.clear();
    out.negative = false;
    if (!s) return false;
    // skip whitespace
    while (*s == ' ' || *s == '\t' || *s == '\r' || *s == '\n') ++s;
    bool neg = false;
    if (*s == '+') ++s;
    else if (*s == '-') { neg = true; ++s; }
    if (!*s) return false;
    while (*s == '0') ++s;      // 先頭ゼロスキップ
    if (!*s) { out.limbs.clear(); out.negative = false; return true; }

    // base10 9桁ずつまとめて乗算 (1e9 < 2^32)
    const uint32_t BASE = 1000000000u;  // 10^9
    uint32_t chunk = 0;
    int chunk_len = 0;
    auto mul_add = [&](uint32_t m, uint32_t a) {
        uint64_t carry = a;
        for (auto& l : out.limbs) {
            uint64_t cur = (uint64_t)l * m + carry;
            l = (uint32_t)(cur & 0xFFFFFFFFu);
            carry = cur >> 32;
        }
        if (carry) out.limbs.push_back((uint32_t)carry);
    };

    // まず全文字検証 + 9桁ごとに mul_add
    std::vector<uint32_t> chunks;
    std::vector<int> chunk_digits;
    for (; *s; ++s) {
        if (*s < '0' || *s > '9') return false;
        chunk = chunk * 10 + (uint32_t)(*s - '0');
        chunk_len++;
        if (chunk_len == 9) {
            chunks.push_back(chunk);
            chunk_digits.push_back(9);
            chunk = 0; chunk_len = 0;
        }
    }
    if (chunk_len > 0) {
        chunks.push_back(chunk);
        chunk_digits.push_back(chunk_len);
    }

    for (size_t i = 0; i < chunks.size(); ++i) {
        uint32_t m = 1;
        for (int k = 0; k < chunk_digits[i]; ++k) m *= 10;
        mul_add(m, chunks[i]);
        (void)BASE;
    }
    out.negative = neg && !out.limbs.empty();
    out.normalize();
    return true;
}

// BigInt → decimal string
std::string to_decimal(const BigInt& a) {
    if (a.limbs.empty()) return "0";
    std::string s;
    BigInt t = a;
    t.negative = false;
    // 10^9 で割りながら下の桁から出す
    while (!t.is_zero()) {
        BigInt q;
        uint32_t r = div_small(t, 1000000000u, q);
        t = std::move(q);
        char buf[16];
        if (t.is_zero()) {
            snprintf(buf, sizeof(buf), "%u", r);
        } else {
            snprintf(buf, sizeof(buf), "%09u", r);
        }
        s.insert(0, buf);
    }
    if (a.negative) s.insert(0, "-");
    return s;
}

// BigInt → hex string (符号 + "0x" 付けない素の大文字 hex)
std::string to_hex(const BigInt& a) {
    if (a.limbs.empty()) return "0";
    std::string s;
    // MSB から
    for (size_t i = a.limbs.size(); i-- > 0;) {
        char buf[16];
        if (i == a.limbs.size() - 1)
            snprintf(buf, sizeof(buf), "%X", a.limbs[i]);
        else
            snprintf(buf, sizeof(buf), "%08X", a.limbs[i]);
        s += buf;
    }
    if (a.negative) s.insert(0, "-");
    return s;
}

void copy_to_buf(const std::string& src, char* out, int maxlen) {
    if (!out || maxlen <= 0) return;
    int n = (int)src.size();
    if (n >= maxlen) n = maxlen - 1;
    if (n > 0) std::memcpy(out, src.data(), (size_t)n);
    out[n] = 0;
}

// ------------------------------------------------------------
// ハンドルテーブル
// ------------------------------------------------------------

constexpr int MAX_HANDLES = 1024;

struct HandleSlot {
    bool used = false;
    BigInt value;
};

std::mutex g_mutex;
std::array<HandleSlot, MAX_HANDLES> g_slots;

int alloc_handle(BigInt&& v) {
    std::lock_guard<std::mutex> lk(g_mutex);
    // 1 から始める (0 は invalid)
    for (int i = 1; i < MAX_HANDLES; ++i) {
        if (!g_slots[i].used) {
            g_slots[i].used = true;
            g_slots[i].value = std::move(v);
            return i;
        }
    }
    return 0;
}

bool get(int h, BigInt& out) {
    std::lock_guard<std::mutex> lk(g_mutex);
    if (h <= 0 || h >= MAX_HANDLES) return false;
    if (!g_slots[h].used) return false;
    out = g_slots[h].value;
    return true;
}

bool free_handle(int h) {
    std::lock_guard<std::mutex> lk(g_mutex);
    if (h <= 0 || h >= MAX_HANDLES) return false;
    if (!g_slots[h].used) return false;
    g_slots[h].used = false;
    g_slots[h].value = BigInt();
    return true;
}

}  // namespace

// ============================================================
// Export API
// ============================================================

HSPBIGINT_EXPORT int __cdecl bigint_create_int(int32_t val) {
    BigInt b((int64_t)val);
    return alloc_handle(std::move(b));
}

// 64bit 整数版 (HSP からは lo/hi を別引数で渡す想定: Win32 で __cdecl の
// int64 は 2 slot、x64 では 1 レジスタ — HSP の呼び方の差を吸収するため
// 低位/高位を別引数化した create_int64_split も用意)
HSPBIGINT_EXPORT int __cdecl bigint_create_int64_split(int32_t lo, int32_t hi) {
    int64_t v = ((int64_t)(uint32_t)hi << 32) | (int64_t)(uint32_t)lo;
    BigInt b(v);
    return alloc_handle(std::move(b));
}

HSPBIGINT_EXPORT int __cdecl bigint_create_str(const char* s) {
    BigInt b;
    if (!s || !from_decimal(s, b)) return 0;
    return alloc_handle(std::move(b));
}

HSPBIGINT_EXPORT int __cdecl bigint_clone(int h) {
    BigInt v;
    if (!get(h, v)) return 0;
    return alloc_handle(std::move(v));
}

HSPBIGINT_EXPORT int __cdecl bigint_free(int h) {
    free_handle(h);
    return 0;
}

HSPBIGINT_EXPORT int __cdecl bigint_to_str(int h, char* out, int maxlen) {
    BigInt v;
    if (!get(h, v)) { if (out && maxlen > 0) out[0] = 0; return -1; }
    copy_to_buf(to_decimal(v), out, maxlen);
    return 0;
}

HSPBIGINT_EXPORT int __cdecl bigint_to_hex(int h, char* out, int maxlen) {
    BigInt v;
    if (!get(h, v)) { if (out && maxlen > 0) out[0] = 0; return -1; }
    copy_to_buf(to_hex(v), out, maxlen);
    return 0;
}

HSPBIGINT_EXPORT int __cdecl bigint_to_int64(int h, int64_t* out) {
    if (!out) return -1;
    BigInt v;
    if (!get(h, v)) { *out = 0; return -1; }
    *out = v.to_int64();
    return 0;
}

// HSP-friendly split: low/high 32-bit を別ポインタに返す
HSPBIGINT_EXPORT int __cdecl bigint_to_int64_split(int h, int32_t* lo, int32_t* hi) {
    BigInt v;
    if (!get(h, v)) { if (lo) *lo = 0; if (hi) *hi = 0; return -1; }
    int64_t x = v.to_int64();
    if (lo) *lo = (int32_t)(uint32_t)(x & 0xFFFFFFFF);
    if (hi) *hi = (int32_t)(uint32_t)((uint64_t)x >> 32);
    return 0;
}

// 低位 int32 だけ欲しいとき (mod 2^32 として扱われる)
HSPBIGINT_EXPORT int __cdecl bigint_to_int32(int h) {
    BigInt v;
    if (!get(h, v)) return 0;
    int64_t x = v.to_int64();
    return (int32_t)(uint32_t)(x & 0xFFFFFFFF);
}

static int binop(int a, int b, int op) {
    BigInt x, y;
    if (!get(a, x)) return 0;
    if (!get(b, y)) return 0;
    BigInt r;
    switch (op) {
        case 0: add(x, y, r); break;
        case 1: sub(x, y, r); break;
        case 2: mul(x, y, r); break;
        case 3: {
            if (y.is_zero()) return 0;  // div by 0
            BigInt q, rem;
            divmod_abs(x, y, q, rem);
            // 商の符号
            q.negative = (x.negative != y.negative) && !q.is_zero();
            r = std::move(q);
            break;
        }
        case 4: {
            if (y.is_zero()) return 0;
            BigInt q, rem;
            divmod_abs(x, y, q, rem);
            // 剰余: C/Java 流 trunc 余り (被除数と同符号)
            rem.negative = x.negative && !rem.is_zero();
            r = std::move(rem);
            break;
        }
        case 5: band_abs(x, y, r); break;
        case 6: bor_abs(x, y, r); break;
        case 7: bxor_abs(x, y, r); break;
        default: return 0;
    }
    r.normalize();
    return alloc_handle(std::move(r));
}

HSPBIGINT_EXPORT int __cdecl bigint_add(int a, int b) { return binop(a, b, 0); }
HSPBIGINT_EXPORT int __cdecl bigint_sub(int a, int b) { return binop(a, b, 1); }
HSPBIGINT_EXPORT int __cdecl bigint_mul(int a, int b) { return binop(a, b, 2); }
HSPBIGINT_EXPORT int __cdecl bigint_div(int a, int b) { return binop(a, b, 3); }
HSPBIGINT_EXPORT int __cdecl bigint_mod(int a, int b) { return binop(a, b, 4); }
HSPBIGINT_EXPORT int __cdecl bigint_and(int a, int b) { return binop(a, b, 5); }
HSPBIGINT_EXPORT int __cdecl bigint_or (int a, int b) { return binop(a, b, 6); }
HSPBIGINT_EXPORT int __cdecl bigint_xor(int a, int b) { return binop(a, b, 7); }

HSPBIGINT_EXPORT int __cdecl bigint_pow(int a, int e) {
    BigInt x;
    if (!get(a, x)) return 0;
    if (e < 0) return 0;  // 逆数は整数外
    BigInt result(1);
    BigInt base = x;
    while (e > 0) {
        if (e & 1) {
            BigInt t; mul(result, base, t); result = std::move(t);
        }
        e >>= 1;
        if (e > 0) {
            BigInt t; mul(base, base, t); base = std::move(t);
        }
    }
    return alloc_handle(std::move(result));
}

HSPBIGINT_EXPORT int __cdecl bigint_gcd(int a, int b) {
    BigInt x, y;
    if (!get(a, x)) return 0;
    if (!get(b, y)) return 0;
    x.negative = false;
    y.negative = false;
    // Euclid
    while (!y.is_zero()) {
        BigInt q, r;
        divmod_abs(x, y, q, r);
        x = std::move(y);
        y = std::move(r);
    }
    return alloc_handle(std::move(x));
}

HSPBIGINT_EXPORT int __cdecl bigint_abs(int a) {
    BigInt v;
    if (!get(a, v)) return 0;
    v.negative = false;
    return alloc_handle(std::move(v));
}

HSPBIGINT_EXPORT int __cdecl bigint_neg(int a) {
    BigInt v;
    if (!get(a, v)) return 0;
    if (!v.is_zero()) v.negative = !v.negative;
    return alloc_handle(std::move(v));
}

HSPBIGINT_EXPORT int __cdecl bigint_cmp(int a, int b) {
    BigInt x, y;
    if (!get(a, x)) return 0;
    if (!get(b, y)) return 0;
    return BigInt::cmp(x, y);
}

HSPBIGINT_EXPORT int __cdecl bigint_shl(int a, int bits) {
    BigInt v;
    if (!get(a, v)) return 0;
    BigInt r;
    shl(v, bits, r);
    return alloc_handle(std::move(r));
}

HSPBIGINT_EXPORT int __cdecl bigint_shr(int a, int bits) {
    BigInt v;
    if (!get(a, v)) return 0;
    BigInt r;
    shr(v, bits, r);
    return alloc_handle(std::move(r));
}

HSPBIGINT_EXPORT int __cdecl bigint_bitlen(int a) {
    BigInt v;
    if (!get(a, v)) return 0;
    return v.bitlen();
}

// ------------------------------------------------------------
// DLL entry
// ------------------------------------------------------------
// SIMD 初期化 (hspmathex_simd.cpp で定義)
extern void hspmathex_simd_init();

BOOL WINAPI DllMain(HINSTANCE, DWORD reason, LPVOID) {
    if (reason == DLL_PROCESS_ATTACH) {
        hspmathex_simd_init();
    }
    if (reason == DLL_PROCESS_DETACH) {
        // ハンドル一括解放
        std::lock_guard<std::mutex> lk(g_mutex);
        for (auto& s : g_slots) {
            s.used = false;
            s.value = BigInt();
        }
    }
    return TRUE;
}
