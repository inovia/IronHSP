#pragma once
#include "stl_import.hpp"
#include <string>

namespace mv1conv {

// MikuMikuDance (.pmd) 最小ローダ。頂点 + 面 + マテリアル。
// スキン/表情/物理は読み飛ばし。文字列は Shift-JIS → UTF-8 変換。
LoadResult load_pmd(const std::string &path);

}
