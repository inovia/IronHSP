//
//  hspvar_bigint.cpp
//
//  任意精度整数 (BigInt) を HSP3 の HSPVAR 拡張型として登録する実装。
//
//  設計メモ:
//    - 変数の 1 要素は BigInt* (ヒープへのポインタ) として格納する。
//      pval->pt は BigInt* の配列 (little-endian). 可変長ストレージを避けて
//      固定長 (sizeof(void*) byte) のスロットにしているため、HSP の配列モデル
//      (dim/redim/メモリ連続) と素直に互換になる。
//    - Alloc では全スロットに「空の BigInt*」を格納して初期化する。
//    - Free / (再 Alloc 時の旧データ破棄) で new した BigInt を delete する。
//    - Set / Cnv / CnvCustom 経由のコピーは BigInt 値そのものをディープコピーする。
//    - 演算系 (AddI, SubI, ...) は「*GetPtr(pval) = 新規 BigInt*」で結果を書き戻し、
//      古い結果は delete する。aftertype は自分自身を指す。
//    - 比較系 (EqI, LtI, ...) は結果を int として pval に書き戻し aftertype を
//      HSPVAR_FLAG_INT に設定する (hspvar_float.cpp と同じ流儀)。
//
//  BigInt の低レベル演算は hspmathex/src/hspmathex_bigint.cpp から抜粋・整理。
//  外部依存はない (純 C++17).
//

#define WIN32_LEAN_AND_MEAN
#define NOMINMAX
#include <windows.h>

#include <algorithm>
#include <cstdint>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <string>
#include <vector>

#include "hsp3plugin.h"
#include "hspvar_core.h"
#include "hsp3debug.h"
#include "hspvar_bigint.h"

namespace hspmathex_t {

// ============================================================
// BigInt — sign-magnitude, little-endian base 2^32 limbs
// ============================================================

struct BigInt {
    std::vector<uint32_t> limbs;  // limbs[0] = LSB
    bool negative = false;

    BigInt() = default;

    void from_int64(int64_t v) {
        limbs.clear();
        negative = false;
        if (v == 0) return;
        uint64_t u;
        if (v < 0) { negative = true; u = (uint64_t)-(v + 1) + 1u; }
        else       { u = (uint64_t)v; }
        limbs.push_back((uint32_t)(u & 0xFFFFFFFFu));
        uint32_t hi = (uint32_t)(u >> 32);
        if (hi) limbs.push_back(hi);
    }

    void normalize() {
        while (!limbs.empty() && limbs.back() == 0) limbs.pop_back();
        if (limbs.empty()) negative = false;
    }

    bool is_zero() const { return limbs.empty(); }

    int sign() const {
        if (limbs.empty()) return 0;
        return negative ? -1 : 1;
    }

    static int cmp_abs(const BigInt &a, const BigInt &b) {
        if (a.limbs.size() != b.limbs.size())
            return a.limbs.size() < b.limbs.size() ? -1 : 1;
        for (size_t i = a.limbs.size(); i-- > 0;) {
            if (a.limbs[i] != b.limbs[i])
                return a.limbs[i] < b.limbs[i] ? -1 : 1;
        }
        return 0;
    }

    static int cmp(const BigInt &a, const BigInt &b) {
        int sa = a.sign(), sb = b.sign();
        if (sa != sb) return sa < sb ? -1 : 1;
        if (sa == 0) return 0;
        int c = cmp_abs(a, b);
        return sa > 0 ? c : -c;
    }

    int64_t to_int64() const {
        if (limbs.empty()) return 0;
        uint64_t u = (uint64_t)limbs[0];
        if (limbs.size() >= 2) u |= ((uint64_t)limbs[1]) << 32;
        if (negative) return (int64_t)(~u + 1);
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

// ---- 低レベル演算 ----
static void add_abs(const BigInt &a, const BigInt &b, BigInt &r) {
    const auto &x = a.limbs.size() >= b.limbs.size() ? a.limbs : b.limbs;
    const auto &y = a.limbs.size() >= b.limbs.size() ? b.limbs : a.limbs;
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

static void sub_abs(const BigInt &a, const BigInt &b, BigInt &r) {
    r.limbs.assign(a.limbs.size(), 0);
    int64_t borrow = 0;
    for (size_t i = 0; i < a.limbs.size(); ++i) {
        int64_t bi = i < b.limbs.size() ? (int64_t)b.limbs[i] : 0;
        int64_t d = (int64_t)a.limbs[i] - bi - borrow;
        if (d < 0) { d += (int64_t)1 << 32; borrow = 1; } else borrow = 0;
        r.limbs[i] = (uint32_t)d;
    }
    r.normalize();
}

static void add(const BigInt &a, const BigInt &b, BigInt &r) {
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

static void sub(const BigInt &a, const BigInt &b, BigInt &r) {
    BigInt nb = b;
    nb.negative = !b.negative;
    if (nb.limbs.empty()) nb.negative = false;
    add(a, nb, r);
}

static void mul(const BigInt &a, const BigInt &b, BigInt &r) {
    if (a.limbs.empty() || b.limbs.empty()) {
        r.limbs.clear(); r.negative = false; return;
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

static uint32_t div_small(const BigInt &a, uint32_t d, BigInt &r) {
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

static void divmod_abs(const BigInt &a, const BigInt &b, BigInt &q, BigInt &rem) {
    q.limbs.clear(); q.negative = false;
    rem.limbs.clear(); rem.negative = false;
    if (b.limbs.empty()) return;  // div-by-zero: 呼び出し側で検出
    if (BigInt::cmp_abs(a, b) < 0) { rem = a; rem.negative = false; return; }
    if (b.limbs.size() == 1) {
        uint32_t r32 = div_small(a, b.limbs[0], q);
        if (r32) rem.limbs.push_back(r32);
        return;
    }
    int bits = a.bitlen();
    q.limbs.assign((bits + 31) / 32, 0);
    for (int i = bits - 1; i >= 0; --i) {
        uint32_t carry = 0;
        for (auto &limb : rem.limbs) {
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
            q.limbs[i / 32] |= (1u << (i % 32));
        }
    }
    q.normalize(); rem.normalize();
}

static void band_abs(const BigInt &a, const BigInt &b, BigInt &r) {
    size_t n = std::min(a.limbs.size(), b.limbs.size());
    r.limbs.assign(n, 0);
    for (size_t i = 0; i < n; ++i) r.limbs[i] = a.limbs[i] & b.limbs[i];
    r.negative = false;
    r.normalize();
}
static void bor_abs(const BigInt &a, const BigInt &b, BigInt &r) {
    size_t n = std::max(a.limbs.size(), b.limbs.size());
    r.limbs.assign(n, 0);
    for (size_t i = 0; i < n; ++i) {
        uint32_t x = i < a.limbs.size() ? a.limbs[i] : 0;
        uint32_t y = i < b.limbs.size() ? b.limbs[i] : 0;
        r.limbs[i] = x | y;
    }
    r.negative = false;
    r.normalize();
}
static void bxor_abs(const BigInt &a, const BigInt &b, BigInt &r) {
    size_t n = std::max(a.limbs.size(), b.limbs.size());
    r.limbs.assign(n, 0);
    for (size_t i = 0; i < n; ++i) {
        uint32_t x = i < a.limbs.size() ? a.limbs[i] : 0;
        uint32_t y = i < b.limbs.size() ? b.limbs[i] : 0;
        r.limbs[i] = x ^ y;
    }
    r.negative = false;
    r.normalize();
}

static void shl(const BigInt &a, int bits, BigInt &r) {
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

static void shr(const BigInt &a, int bits, BigInt &r) {
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

// ---- 文字列 <-> BigInt ----
static bool from_decimal(const char *s, BigInt &out) {
    out.limbs.clear();
    out.negative = false;
    if (!s) return false;
    while (*s == ' ' || *s == '\t' || *s == '\r' || *s == '\n') ++s;
    bool neg = false;
    if (*s == '+') ++s;
    else if (*s == '-') { neg = true; ++s; }
    if (!*s) return false;
    while (*s == '0') ++s;
    if (!*s) { out.limbs.clear(); out.negative = false; return true; }

    auto mul_add = [&](uint32_t m, uint32_t a) {
        uint64_t carry = a;
        for (auto &l : out.limbs) {
            uint64_t cur = (uint64_t)l * m + carry;
            l = (uint32_t)(cur & 0xFFFFFFFFu);
            carry = cur >> 32;
        }
        if (carry) out.limbs.push_back((uint32_t)carry);
    };

    std::vector<uint32_t> chunks;
    std::vector<int> chunk_digits;
    uint32_t chunk = 0;
    int chunk_len = 0;
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
    if (chunk_len > 0) { chunks.push_back(chunk); chunk_digits.push_back(chunk_len); }
    for (size_t i = 0; i < chunks.size(); ++i) {
        uint32_t m = 1;
        for (int k = 0; k < chunk_digits[i]; ++k) m *= 10;
        mul_add(m, chunks[i]);
    }
    out.negative = neg && !out.limbs.empty();
    out.normalize();
    return true;
}

static std::string to_decimal(const BigInt &a) {
    if (a.limbs.empty()) return "0";
    std::string s;
    BigInt t = a;
    t.negative = false;
    while (!t.is_zero()) {
        BigInt q;
        uint32_t r = div_small(t, 1000000000u, q);
        t = std::move(q);
        char buf[16];
        if (t.is_zero()) std::snprintf(buf, sizeof(buf), "%u", r);
        else             std::snprintf(buf, sizeof(buf), "%09u", r);
        s.insert(0, buf);
    }
    if (a.negative) s.insert(0, "-");
    return s;
}

// ============================================================
// HSPVAR callbacks
// ============================================================

// 型 ID (registvar で確定する値)
static int mytype = HSPVAR_FLAG_USERDEF;
static short *aftertype = nullptr;

// 変換用テンポラリ。Cnv/CnvCustom が返すバッファは関数スコープより
// 長く生きる必要があるため static にしておく。
// Cnv は「自分自身が所有する静的 BigInt」のアドレスを slot 形式で返す。
// Set 側はそれを読んだらディープコピーするだけで済む (所有権は Cnv 側のまま)。
static BigInt cnv_tmp_bi_static;            // 実体
static BigInt *cnv_tmp_bi_slot = nullptr;   // = &cnv_tmp_bi_static
static char cnv_custom_str[1024];           // CnvCustom (文字列化) 用
static int cnv_custom_int = 0;
static double cnv_custom_double = 0.0;

// reffunc の戻り値受け渡し用 (bigint("...") の結果)
static BigInt *ref_bi_ptr = nullptr;

void HspVarBigInt_SetRefValue(BigInt *p) { ref_bi_ptr = p; }
void *HspVarBigInt_GetRefValuePtr(void) { return &ref_bi_ptr; }

BigInt *HspVarBigInt_NewFromStr(const char *s) {
    BigInt *b = new BigInt();
    if (s) from_decimal(s, *b);
    return b;
}

void HspVarBigInt_Delete(BigInt *p) { delete p; }

// pval->pt は BigInt* の配列。offset 位置のスロットを指す。
static inline BigInt **slot_ptr(PVal *pval) {
    return ((BigInt **)(pval->pt)) + pval->offset;
}

static PDAT *HspVarBigInt_GetPtr(PVal *pval) {
    // PDAT として「スロット (BigInt* を格納する先) のアドレス」を返す。
    return (PDAT *)slot_ptr(pval);
}

// 他の型 -> BigInt*
// 戻り値: BigInt** (= スロット形式) を指すポインタ。
// Cnv は「自身が保有する静的 BigInt」に値をセットし、そのアドレスをスロット経由で返す。
// Set 側は値をディープコピーするだけで、この BigInt を delete してはいけない。
static void *HspVarBigInt_Cnv(const void *buffer, int flag) {
    switch (flag) {
    case HSPVAR_FLAG_STR:
        from_decimal((const char *)buffer, cnv_tmp_bi_static);
        break;
    case HSPVAR_FLAG_INT:
        cnv_tmp_bi_static.from_int64((int64_t)*(const int *)buffer);
        break;
    case HSPVAR_FLAG_DOUBLE:
        cnv_tmp_bi_static.from_int64((int64_t)*(const double *)buffer);
        break;
    default:
        throw HSPVAR_ERROR_TYPEMISS;
    }
    cnv_tmp_bi_slot = &cnv_tmp_bi_static;
    return &cnv_tmp_bi_slot;
}

// BigInt* -> 他の型
static void *HspVarBigInt_CnvCustom(const void *buffer, int flag) {
    BigInt *bi = *(BigInt * const *)buffer;
    if (bi == nullptr) {
        switch (flag) {
        case HSPVAR_FLAG_STR:    cnv_custom_str[0] = '0'; cnv_custom_str[1] = 0; return cnv_custom_str;
        case HSPVAR_FLAG_INT:    cnv_custom_int = 0; return &cnv_custom_int;
        case HSPVAR_FLAG_DOUBLE: cnv_custom_double = 0.0; return &cnv_custom_double;
        default: throw HSPVAR_ERROR_TYPEMISS;
        }
    }
    switch (flag) {
    case HSPVAR_FLAG_STR: {
        std::string s = to_decimal(*bi);
        int n = (int)s.size();
        if (n >= (int)sizeof(cnv_custom_str)) n = (int)sizeof(cnv_custom_str) - 1;
        std::memcpy(cnv_custom_str, s.data(), n);
        cnv_custom_str[n] = 0;
        return cnv_custom_str;
    }
    case HSPVAR_FLAG_INT:
        cnv_custom_int = (int)bi->to_int64();
        return &cnv_custom_int;
    case HSPVAR_FLAG_DOUBLE:
        cnv_custom_double = (double)bi->to_int64();
        return &cnv_custom_double;
    default:
        throw HSPVAR_ERROR_TYPEMISS;
    }
}

static int HspVarBigInt_GetSize(const PDAT *pdat) {
    (void)pdat;
    return (int)sizeof(BigInt *);
}

static int GetVarSize(PVal *pval) {
    int size = pval->len[1];
    if (pval->len[2]) size *= pval->len[2];
    if (pval->len[3]) size *= pval->len[3];
    if (pval->len[4]) size *= pval->len[4];
    size *= (int)sizeof(BigInt *);
    return size;
}

static void HspVarBigInt_Free(PVal *pval) {
    if (pval->mode == HSPVAR_MODE_MALLOC && pval->pt) {
        int count = pval->size / (int)sizeof(BigInt *);
        BigInt **arr = (BigInt **)pval->pt;
        for (int i = 0; i < count; ++i) {
            if (arr[i]) { delete arr[i]; arr[i] = nullptr; }
        }
        hspfree(pval->pt);
    }
    pval->pt = nullptr;
    pval->mode = HSPVAR_MODE_NONE;
}

static void HspVarBigInt_Alloc(PVal *pval, const PVal *pval2) {
    // len[1] が 0 の場合は 1 要素を確保する
    int i, size;
    if (pval->len[1] < 1) pval->len[1] = 1;
    size = GetVarSize(pval);
    int new_count = size / (int)sizeof(BigInt *);
    BigInt **new_arr = (BigInt **)hspmalloc(size);
    // 各要素を空の BigInt (= 0) で初期化
    for (i = 0; i < new_count; ++i) new_arr[i] = new BigInt();

    if (pval2 != nullptr) {
        // 旧 pval の内容を新領域に移植。
        // pval->pt (旧) は同じ型なので BigInt** として読める。
        // pval->size は旧サイズ(byte)。
        int old_count = pval->size / (int)sizeof(BigInt *);
        BigInt **old_arr = (BigInt **)pval->pt;
        int copy_count = old_count < new_count ? old_count : new_count;
        for (i = 0; i < copy_count; ++i) {
            if (old_arr[i]) {
                // ディープコピーの代わりに所有権を移す
                delete new_arr[i];
                new_arr[i] = old_arr[i];
                old_arr[i] = nullptr;
            }
        }
        // 残った旧スロットを delete
        for (i = 0; i < old_count; ++i) {
            if (old_arr[i]) { delete old_arr[i]; old_arr[i] = nullptr; }
        }
        hspfree(pval->pt);
    }
    pval->mode = HSPVAR_MODE_MALLOC;
    pval->pt = (char *)new_arr;
    pval->size = size;
}

// Set: pdat スロットに in を書き込む
// in は BigInt** を指す (Cnv / reffunc の戻り値 / 同じ型同士の代入のいずれも)。
// src の所有権はこちらにないので delete してはいけない。常にディープコピー。
static void HspVarBigInt_Set(PVal *pval, PDAT *pdat, const void *in) {
    (void)pval;
    BigInt **slot = (BigInt **)pdat;
    const BigInt *src = *(BigInt * const *)in;
    // 既存の値を破棄
    if (*slot) { delete *slot; *slot = nullptr; }
    if (src) *slot = new BigInt(*src);
    else     *slot = new BigInt();
}

// ---- 二項演算ヘルパ ----
//
// 演算時の PDAT (*pval) は HSP 計算スタック上の一時領域。中身の BigInt*
// は変数本体と共有されている (shallow copy) ので、ここで delete してはいけない。
// そのまま上書きして「新しい結果を指すポインタ」を返す。
// 計算スタックに残った旧結果 BigInt* は GC 的に回収できないため、
// 小さなリークが発生する可能性がある (式の評価が終わったあとに失う)。
// 実用上は長時間ループで問題になるため、今後の改善 TODO とする。
static inline void assign_slot(BigInt **slot, BigInt *r) {
    *slot = r;
}

// 共通: 安全に左辺の BigInt 参照を取り出す。slot が null なら zero を返す。
static inline const BigInt &deref_slot_or_zero(const BigInt *const *slot, const BigInt &zero) {
    return *slot ? **slot : zero;
}

// AddI: *pval += *val.  pval は「BigInt** を指す」PDAT。
static void HspVarBigInt_AddI(PDAT *pval, const void *val) {
    BigInt **slot = (BigInt **)pval;
    const BigInt *b = *(BigInt * const *)val;
    BigInt zero;
    BigInt *r = new BigInt();
    add(deref_slot_or_zero(slot, zero), b ? *b : zero, *r);
    assign_slot(slot, r);
    *aftertype = (short)mytype;
}

static void HspVarBigInt_SubI(PDAT *pval, const void *val) {
    BigInt **slot = (BigInt **)pval;
    const BigInt *b = *(BigInt * const *)val;
    BigInt zero;
    BigInt *r = new BigInt();
    sub(deref_slot_or_zero(slot, zero), b ? *b : zero, *r);
    assign_slot(slot, r);
    *aftertype = (short)mytype;
}

static void HspVarBigInt_MulI(PDAT *pval, const void *val) {
    BigInt **slot = (BigInt **)pval;
    const BigInt *b = *(BigInt * const *)val;
    BigInt zero;
    BigInt *r = new BigInt();
    mul(deref_slot_or_zero(slot, zero), b ? *b : zero, *r);
    assign_slot(slot, r);
    *aftertype = (short)mytype;
}

static void HspVarBigInt_DivI(PDAT *pval, const void *val) {
    BigInt **slot = (BigInt **)pval;
    const BigInt *b = *(BigInt * const *)val;
    if (!b || b->is_zero()) throw HSPVAR_ERROR_DIVZERO;
    BigInt zero;
    const BigInt &a = deref_slot_or_zero(slot, zero);
    BigInt q, rem;
    divmod_abs(a, *b, q, rem);
    q.negative = (a.negative != b->negative) && !q.is_zero();
    BigInt *r = new BigInt(std::move(q));
    assign_slot(slot, r);
    *aftertype = (short)mytype;
}

static void HspVarBigInt_ModI(PDAT *pval, const void *val) {
    BigInt **slot = (BigInt **)pval;
    const BigInt *b = *(BigInt * const *)val;
    if (!b || b->is_zero()) throw HSPVAR_ERROR_DIVZERO;
    BigInt zero;
    const BigInt &a = deref_slot_or_zero(slot, zero);
    BigInt q, rem;
    divmod_abs(a, *b, q, rem);
    rem.negative = a.negative && !rem.is_zero();
    BigInt *r = new BigInt(std::move(rem));
    assign_slot(slot, r);
    *aftertype = (short)mytype;
}

static void HspVarBigInt_AndI(PDAT *pval, const void *val) {
    BigInt **slot = (BigInt **)pval;
    const BigInt *b = *(BigInt * const *)val;
    BigInt zero;
    BigInt *r = new BigInt();
    band_abs(deref_slot_or_zero(slot, zero), b ? *b : zero, *r);
    assign_slot(slot, r);
    *aftertype = (short)mytype;
}

static void HspVarBigInt_OrI(PDAT *pval, const void *val) {
    BigInt **slot = (BigInt **)pval;
    const BigInt *b = *(BigInt * const *)val;
    BigInt zero;
    BigInt *r = new BigInt();
    bor_abs(deref_slot_or_zero(slot, zero), b ? *b : zero, *r);
    assign_slot(slot, r);
    *aftertype = (short)mytype;
}

static void HspVarBigInt_XorI(PDAT *pval, const void *val) {
    BigInt **slot = (BigInt **)pval;
    const BigInt *b = *(BigInt * const *)val;
    BigInt zero;
    BigInt *r = new BigInt();
    bxor_abs(deref_slot_or_zero(slot, zero), b ? *b : zero, *r);
    assign_slot(slot, r);
    *aftertype = (short)mytype;
}

// 比較系: 結果を int として PDAT に書き込み、aftertype を INT へ。
// pval は BigInt** を指すスタック上の一時領域。ここで書き込む int は
// 元の BigInt* を覆い隠すが、その BigInt そのものは変数内には残るので
// slot 書き換えだけで OK (hspvar_float と同じ流儀)。
static int cmp_slot(PDAT *pval, const void *val) {
    BigInt **slot = (BigInt **)pval;
    const BigInt *b = *(BigInt * const *)val;
    BigInt zero;
    const BigInt *a = *slot ? *slot : &zero;
    return BigInt::cmp(*a, b ? *b : zero);
}

static void HspVarBigInt_EqI(PDAT *pval, const void *val) {
    int r = (cmp_slot(pval, val) == 0) ? 1 : 0;
    *(int *)pval = r;
    *aftertype = HSPVAR_FLAG_INT;
}
static void HspVarBigInt_NeI(PDAT *pval, const void *val) {
    int r = (cmp_slot(pval, val) != 0) ? 1 : 0;
    *(int *)pval = r;
    *aftertype = HSPVAR_FLAG_INT;
}
static void HspVarBigInt_GtI(PDAT *pval, const void *val) {
    int r = (cmp_slot(pval, val) >  0) ? 1 : 0;
    *(int *)pval = r;
    *aftertype = HSPVAR_FLAG_INT;
}
static void HspVarBigInt_LtI(PDAT *pval, const void *val) {
    int r = (cmp_slot(pval, val) <  0) ? 1 : 0;
    *(int *)pval = r;
    *aftertype = HSPVAR_FLAG_INT;
}
static void HspVarBigInt_GtEqI(PDAT *pval, const void *val) {
    int r = (cmp_slot(pval, val) >= 0) ? 1 : 0;
    *(int *)pval = r;
    *aftertype = HSPVAR_FLAG_INT;
}
static void HspVarBigInt_LtEqI(PDAT *pval, const void *val) {
    int r = (cmp_slot(pval, val) <= 0) ? 1 : 0;
    *(int *)pval = r;
    *aftertype = HSPVAR_FLAG_INT;
}

// シフト演算: val は int として扱う (BigInt** でなく int 値)。
// HSP 仕様的に << >> は int 混用になるので、Cnv が int → BigInt で来るケースを想定。
// ここでは val も BigInt** と仮定して、to_int64 の低位を bit 数とする。
static int to_shift_bits(const void *val) {
    const BigInt *b = *(BigInt * const *)val;
    if (!b) return 0;
    return (int)b->to_int64();
}

static void HspVarBigInt_RrI(PDAT *pval, const void *val) {
    BigInt **slot = (BigInt **)pval;
    BigInt zero;
    BigInt *r = new BigInt();
    shr(deref_slot_or_zero(slot, zero), to_shift_bits(val), *r);
    assign_slot(slot, r);
    *aftertype = (short)mytype;
}
static void HspVarBigInt_LrI(PDAT *pval, const void *val) {
    BigInt **slot = (BigInt **)pval;
    BigInt zero;
    BigInt *r = new BigInt();
    shl(deref_slot_or_zero(slot, zero), to_shift_bits(val), *r);
    assign_slot(slot, r);
    *aftertype = (short)mytype;
}

static void *GetBlockSize(PVal *pval, PDAT *pdat, int *size) {
    *size = pval->size - (int)(((char *)pdat) - pval->pt);
    return (void *)pdat;
}

static void AllocBlock(PVal *pval, PDAT *pdat, int size) {
    (void)pval; (void)pdat; (void)size;
}

}  // namespace hspmathex_t

// ============================================================
// HSPVAR 登録エントリ (extern "C")
// ============================================================

extern "C" int HspVarBigInt_typeid(void) {
    return hspmathex_t::mytype;
}

extern "C" void HspVarBigInt_Init(HspVarProc *p) {
    using namespace hspmathex_t;
    aftertype = &p->aftertype;

    p->Set          = HspVarBigInt_Set;
    p->Cnv          = HspVarBigInt_Cnv;
    p->CnvCustom    = HspVarBigInt_CnvCustom;
    p->GetPtr       = HspVarBigInt_GetPtr;
    p->GetSize      = HspVarBigInt_GetSize;
    p->GetBlockSize = GetBlockSize;
    p->AllocBlock   = AllocBlock;

    p->Alloc = HspVarBigInt_Alloc;
    p->Free  = HspVarBigInt_Free;

    p->AddI = HspVarBigInt_AddI;
    p->SubI = HspVarBigInt_SubI;
    p->MulI = HspVarBigInt_MulI;
    p->DivI = HspVarBigInt_DivI;
    p->ModI = HspVarBigInt_ModI;

    p->AndI = HspVarBigInt_AndI;
    p->OrI  = HspVarBigInt_OrI;
    p->XorI = HspVarBigInt_XorI;

    p->EqI   = HspVarBigInt_EqI;
    p->NeI   = HspVarBigInt_NeI;
    p->GtI   = HspVarBigInt_GtI;
    p->LtI   = HspVarBigInt_LtI;
    p->GtEqI = HspVarBigInt_GtEqI;
    p->LtEqI = HspVarBigInt_LtEqI;

    p->RrI = HspVarBigInt_RrI;
    p->LrI = HspVarBigInt_LrI;

    p->vartype_name = (char *)"bigint";
    p->version = 0x001;
    p->support = HSPVAR_SUPPORT_STORAGE | HSPVAR_SUPPORT_FLEXARRAY;
    p->basesize = (short)sizeof(BigInt *);

    mytype = p->flag;
}
