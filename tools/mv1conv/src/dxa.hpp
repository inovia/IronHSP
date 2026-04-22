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

// DXA エンコード (literal-only モード: 圧縮なし、入力データに存在しないバイトを
// KeyCode に選んで全バイトをリテラル出力する。全 256 byte が使われている場合は
// 稀な byte を KeyCode にして KeyCode 出現時は KeyCode KeyCode でエスケープ)。
// 出力サイズは 9 + origSize + (escape された KeyCode 出現数) byte。
std::vector<std::uint8_t> encode_literal(std::span<const std::uint8_t> src);

// DXA greedy LZSS エンコード (match_len >= MIN_COMPRESS=4 のときに backref
// として出力、長さ/距離は DXA フォーマット準拠)。圧縮率はオリジナルより
// やや劣るが literal モードより遥かに小さい。
std::vector<std::uint8_t> encode(std::span<const std::uint8_t> src);

}
