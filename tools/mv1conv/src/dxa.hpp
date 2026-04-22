#pragma once
#include <cstdint>
#include <cstddef>
#include <vector>
#include <span>
#include <string>

namespace mv1conv::dxa {

struct DecodeResult {
    std::vector<std::uint8_t> data;
    std::string error;
    bool ok() const noexcept { return error.empty(); }
};

// src は DXA ブロック先頭 (.mv1 なら magic "MV11" の直後)
DecodeResult decode(std::span<const std::uint8_t> src);

// 先頭 9 byte ヘッダから伸長後サイズだけ取得
std::uint32_t decoded_size(std::span<const std::uint8_t> src);

}
