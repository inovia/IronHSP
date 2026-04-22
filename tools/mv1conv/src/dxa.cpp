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
