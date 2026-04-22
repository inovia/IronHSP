#pragma once
#include "mv1_ir.hpp"
#include <cstdint>
#include <string>
#include <vector>

namespace mv1conv {

struct WriteResult {
    std::vector<std::uint8_t> bytes;  // DxLib で直接読み込める .mv1 全体
    std::string error;
    bool ok() const { return error.empty(); }
};

// IR → .mv1 バイト列 (magic "MV11" + DXA(literal) 圧縮)
WriteResult write_mv1(const ModelIR &ir);

// 便利 wrapper: ファイルへ保存
WriteResult save_mv1(const ModelIR &ir, const std::string &path);

}
