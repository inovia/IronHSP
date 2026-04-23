#pragma once
// MV1 ファイル → ModelIR の変換 (writer の逆向け)。
// mesh geometry + bones + animations を全部 IR に展開して round-trip を可能にする。
#include "mv1_ir.hpp"
#include "stl_import.hpp"  // LoadResult 定義
#include <string>

namespace mv1conv {

LoadResult load_mv1_to_ir(const std::string &path);

}
