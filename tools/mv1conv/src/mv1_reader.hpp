#pragma once
#include "mv1_f1.hpp"
#include <cstdint>
#include <span>
#include <string>
#include <vector>

namespace mv1conv {

// .mv1 をメモリに読み込んで DXA 伸長した後の「生バッファ」
// ポインタ相当の DWORD はこのバッファ先頭からのバイトオフセット
class Mv1File {
public:
    // 失敗時は !ok() で error() を参照
    static Mv1File load(const std::string &path);
    static Mv1File from_bytes(std::span<const std::uint8_t> file_bytes);

    bool ok() const noexcept { return error_.empty(); }
    const std::string &error() const noexcept { return error_; }

    std::span<const std::uint8_t> buffer() const noexcept { return buffer_; }

    const f1::MV1MODEL_FILEHEADER_F1 *header() const;

    // offset が buffer の範囲内なら該当位置の const T* を返す、0 or 範囲外なら nullptr
    template <class T>
    const T *at(f1::DWORD offset) const {
        if (offset == 0) return nullptr;
        if (offset + sizeof(T) > buffer_.size()) return nullptr;
        return reinterpret_cast<const T *>(buffer_.data() + offset);
    }

    // 文字列プール内の C 文字列参照 (offset = 文字列プール先頭からのバイト)。範囲外なら ""
    std::string_view cstr_in_pool(f1::DWORD pool_offset) const;

    // StringBuffer 先頭からの offset を解決して C 文字列
    std::string_view name(f1::DWORD pool_offset) const { return cstr_in_pool(pool_offset); }

private:
    std::vector<std::uint8_t> storage_;
    std::span<const std::uint8_t> buffer_;
    std::string error_;
};

}
