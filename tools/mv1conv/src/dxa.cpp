#include "dxa.hpp"
#include <cstring>

namespace mv1conv::dxa {

namespace {

inline std::uint16_t rd16(const std::uint8_t *p) {
    return static_cast<std::uint16_t>(p[0]) | (static_cast<std::uint16_t>(p[1]) << 8);
}
inline std::uint32_t rd32(const std::uint8_t *p) {
    return static_cast<std::uint32_t>(p[0])
         | (static_cast<std::uint32_t>(p[1]) << 8)
         | (static_cast<std::uint32_t>(p[2]) << 16)
         | (static_cast<std::uint32_t>(p[3]) << 24);
}

inline void wr32(std::uint8_t *p, std::uint32_t v) {
    p[0] = static_cast<std::uint8_t>(v);
    p[1] = static_cast<std::uint8_t>(v >> 8);
    p[2] = static_cast<std::uint8_t>(v >> 16);
    p[3] = static_cast<std::uint8_t>(v >> 24);
}

}

namespace {

constexpr std::uint32_t DXA_MIN_COMPRESS = 4;
// 実エンコード可能な最大長 = 5bit(low) + 8bit(ext) = 13bit → 8191 + MIN_COMPRESS = 8195
// (spec の "32767" は誤り、decoder が 5+8bit しか読まない)
constexpr std::uint32_t DXA_MAX_COPYSIZE = 8195;
constexpr std::uint32_t DXA_MAX_POSITION = 1u << 24;

// KeyCode 選定: まず使われていない byte を探し、無ければ出現数最少
std::uint8_t pick_keycode(std::span<const std::uint8_t> src) {
    std::size_t h[256] = {0};
    for (auto b : src) ++h[b];
    int best = 0;
    for (int i = 0; i < 256; ++i) if (h[i] == 0) return static_cast<std::uint8_t>(i);
    for (int i = 1; i < 256; ++i) if (h[i] < h[best]) best = i;
    return static_cast<std::uint8_t>(best);
}

// 与えられた pos-addr(1-based, 1..16M) / length(4..) を DXA のマッチトークンに変換
// 出力: keycode + flags + [extlen] + addr(1..3 byte) を dp に書く。length は既に 4 引いた値。
void emit_match(std::vector<std::uint8_t> &dst, std::uint8_t key,
                std::uint32_t length_minus_4, std::uint32_t addr_minus_1) {
    // addr_minus_1 の byte 数を決める
    int addr_byte;
    if (addr_minus_1 < 0x100)        addr_byte = 1;  // flag bits 1-0 = 00
    else if (addr_minus_1 < 0x10000) addr_byte = 2;  // flag bits 1-0 = 01
    else                              addr_byte = 3; // flag bits 1-0 = 10

    // length 下位 5bit + 拡張長 8bit (計 13bit, max 8192+)
    std::uint8_t low5 = static_cast<std::uint8_t>(length_minus_4 & 0x1Fu);
    bool ext = (length_minus_4 > 0x1Fu);
    std::uint8_t flags = static_cast<std::uint8_t>(low5 << 3);
    if (ext) flags |= 0x04;
    flags |= static_cast<std::uint8_t>(addr_byte - 1);

    // エンコーダでは「flags が KeyCode 以上なら +1 する」補正 (decoder 側で -1 される)
    std::uint8_t flagsOut = flags;
    if (flagsOut >= key) flagsOut++;

    dst.push_back(key);
    dst.push_back(flagsOut);
    if (ext) dst.push_back(static_cast<std::uint8_t>((length_minus_4 >> 5) & 0xFFu));
    dst.push_back(static_cast<std::uint8_t>(addr_minus_1 & 0xFFu));
    if (addr_byte >= 2) dst.push_back(static_cast<std::uint8_t>((addr_minus_1 >> 8) & 0xFFu));
    if (addr_byte >= 3) dst.push_back(static_cast<std::uint8_t>((addr_minus_1 >> 16) & 0xFFu));
}

}

std::vector<std::uint8_t> encode(std::span<const std::uint8_t> src) {
    if (src.empty()) return encode_literal(src);
    std::uint8_t key = pick_keycode(src);

    // 3-byte prefix ハッシュテーブルで greedy LZSS
    constexpr std::size_t HASH_SIZE = 1 << 16;
    std::vector<std::int32_t> head(HASH_SIZE, -1);
    constexpr std::size_t CHAIN_LIMIT = 256;  // 深さ制限 (速度↔圧縮率)
    std::vector<std::int32_t> next(src.size(), -1);

    auto hash3 = [&](const std::uint8_t *p) -> std::size_t {
        std::uint32_t h = p[0];
        h = h * 131u + p[1];
        h = h * 131u + p[2];
        return h & (HASH_SIZE - 1);
    };

    // body
    std::vector<std::uint8_t> body;
    body.reserve(src.size());

    const std::size_t N = src.size();
    std::size_t i = 0;
    while (i < N) {
        std::uint32_t bestLen = 0;
        std::uint32_t bestDist = 0;
        if (i + 2 < N) {
            std::size_t h = hash3(src.data() + i);
            std::int32_t j = head[h];
            std::size_t chain = 0;
            while (j >= 0 && chain < CHAIN_LIMIT) {
                if (static_cast<std::size_t>(j) >= i) break;
                std::size_t dist = i - static_cast<std::size_t>(j);
                if (dist > DXA_MAX_POSITION) break;
                // 試し比較
                std::size_t maxL = std::min<std::size_t>(N - i, DXA_MAX_COPYSIZE);
                std::size_t L = 0;
                while (L < maxL && src[j + L] == src[i + L]) ++L;
                if (L >= DXA_MIN_COMPRESS && L > bestLen) {
                    bestLen  = static_cast<std::uint32_t>(L);
                    bestDist = static_cast<std::uint32_t>(dist);
                    if (L == maxL) break;
                }
                j = next[j];
                ++chain;
            }
        }

        if (bestLen >= DXA_MIN_COMPRESS) {
            emit_match(body, key, bestLen - DXA_MIN_COMPRESS, bestDist - 1);
            // hash update for 使用したすべての位置
            for (std::uint32_t k = 0; k < bestLen; ++k) {
                if (i + k + 2 < N) {
                    std::size_t h = hash3(src.data() + i + k);
                    next[i + k] = head[h];
                    head[h] = static_cast<std::int32_t>(i + k);
                }
            }
            i += bestLen;
        } else {
            std::uint8_t b = src[i];
            if (b == key) { body.push_back(key); body.push_back(key); }
            else          { body.push_back(b); }
            if (i + 2 < N) {
                std::size_t h = hash3(src.data() + i);
                next[i] = head[h];
                head[h] = static_cast<std::int32_t>(i);
            }
            ++i;
        }
    }

    std::vector<std::uint8_t> out;
    out.resize(9);
    wr32(out.data() + 0, static_cast<std::uint32_t>(src.size()));
    wr32(out.data() + 4, static_cast<std::uint32_t>(9 + body.size()));
    out[8] = key;
    out.insert(out.end(), body.begin(), body.end());
    return out;
}

std::vector<std::uint8_t> encode_literal(std::span<const std::uint8_t> src) {
    // byte histogram で一番少ない値を KeyCode に
    std::size_t hist[256] = {0};
    for (auto b : src) ++hist[b];

    int key = 0;
    for (int i = 1; i < 256; ++i) if (hist[i] < hist[key]) key = i;

    std::vector<std::uint8_t> out;
    out.resize(9 + src.size() + hist[key]);  // KeyCode 出現分だけエスケープで+1 each

    wr32(out.data() + 0, static_cast<std::uint32_t>(src.size()));
    // CompressedSize は出力バッファ全体サイズ (9 byte header 込み)
    wr32(out.data() + 4, static_cast<std::uint32_t>(out.size()));
    out[8] = static_cast<std::uint8_t>(key);

    std::uint8_t *dp = out.data() + 9;
    for (auto b : src) {
        if (b == static_cast<std::uint8_t>(key)) {
            *dp++ = static_cast<std::uint8_t>(key);
            *dp++ = static_cast<std::uint8_t>(key);
        } else {
            *dp++ = b;
        }
    }
    return out;
}

std::uint32_t decoded_size(std::span<const std::uint8_t> src) {
    if (src.size() < 9) return 0;
    return rd32(src.data());
}

DecodeResult decode(std::span<const std::uint8_t> src) {
    DecodeResult r;
    if (src.size() < 9) { r.error = "dxa: src too short (need >= 9 bytes)"; return r; }

    const std::uint32_t origSize = rd32(src.data() + 0);
    const std::uint32_t compSize = rd32(src.data() + 4);
    const std::uint8_t  key      = src.data()[8];

    if (compSize > src.size()) {
        r.error = "dxa: CompressedSize exceeds input buffer";
        return r;
    }
    if (compSize < 9) {
        r.error = "dxa: CompressedSize < 9";
        return r;
    }

    r.data.resize(origSize);
    if (origSize == 0) return r; // 空でも valid

    const std::uint8_t *sp    = src.data() + 9;
    const std::uint8_t *spEnd = src.data() + compSize;
    std::uint8_t       *dp    = r.data.data();
    std::uint8_t       *dpEnd = r.data.data() + origSize;

    while (sp < spEnd) {
        if (*sp != key) {
            if (dp >= dpEnd) { r.error = "dxa: output overflow (literal)"; return r; }
            *dp++ = *sp++;
            continue;
        }
        if (sp + 1 >= spEnd) { r.error = "dxa: truncated after KeyCode"; return r; }
        if (sp[1] == key) {
            if (dp >= dpEnd) { r.error = "dxa: output overflow (escaped key)"; return r; }
            *dp++ = key;
            sp += 2;
            continue;
        }

        std::uint8_t flags = sp[1];
        if (flags > key) --flags;
        sp += 2;

        std::uint32_t length = (flags >> 3) & 0x1Fu;
        if (flags & 0x04u) {
            if (sp >= spEnd) { r.error = "dxa: truncated extlen"; return r; }
            length |= static_cast<std::uint32_t>(*sp++) << 5;
        }
        length += 4;

        std::uint32_t distance = 0;
        switch (flags & 0x03u) {
        case 0:
            if (sp >= spEnd) { r.error = "dxa: truncated addr1"; return r; }
            distance = *sp++;
            break;
        case 1:
            if (sp + 2 > spEnd) { r.error = "dxa: truncated addr2"; return r; }
            distance = rd16(sp);
            sp += 2;
            break;
        case 2:
            if (sp + 3 > spEnd) { r.error = "dxa: truncated addr3"; return r; }
            distance = static_cast<std::uint32_t>(rd16(sp)) | (static_cast<std::uint32_t>(sp[2]) << 16);
            sp += 3;
            break;
        default:
            r.error = "dxa: reserved addr size (flags & 3 == 3)";
            return r;
        }
        distance += 1;

        if (static_cast<std::size_t>(dp - r.data.data()) < distance) {
            r.error = "dxa: distance exceeds decoded size";
            return r;
        }
        if (dp + length > dpEnd) {
            r.error = "dxa: output overflow (match)";
            return r;
        }

        if (distance < length) {
            // 自己参照コピー: 周期 distance の繰り返しを指数で広げる
            std::uint32_t part = distance;
            std::uint32_t rem  = length;
            while (rem > part) {
                std::memcpy(dp, dp - part, part);
                dp  += part;
                rem -= part;
                part += part;
            }
            std::memcpy(dp, dp - part, rem);
            dp += rem;
        } else {
            std::memcpy(dp, dp - distance, length);
            dp += length;
        }
    }

    if (static_cast<std::size_t>(dp - r.data.data()) != origSize) {
        r.error = "dxa: decoded size mismatch (" +
                  std::to_string(dp - r.data.data()) + " vs " +
                  std::to_string(origSize) + ")";
        return r;
    }
    return r;
}

}
