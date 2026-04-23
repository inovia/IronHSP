#pragma once
// IR → PMX 2.0 バイト列エンコーダ
// 出力を DxLib の MV1LoadModelFromMem に食わせることで、
// 公式互換の .mv1 を間接的に生成する。
//
// 設計方針:
// - エンコーディング: UTF-8 固定 (globals[0] = 1)
// - Index サイズ: 全部 4 byte 固定 (globals[2..7] = 4)
// - 拡張 UV 数: 0 (globals[1] = 0)
// - 初期版は morph/rigidbody/joint 未対応 (空セクション出力)
// - Display frame は root bone 1 個のみの最小構成

#include <cstdint>
#include <string>
#include <vector>
#include "mv1_ir.hpp"

namespace mv1conv {

// IR を PMX 2.0 バイト列にエンコード。
// 成功時は非空 vector を返す。エラー時は空 vector + err_msg セット。
std::vector<std::uint8_t> ir_to_pmx(const ModelIR &ir, std::string *err_msg = nullptr);

}
