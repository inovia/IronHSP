#pragma once
#include "stl_import.hpp"
#include <string>

namespace mv1conv {

// MMD Polygon Model eXtended (.pmx) ローダ。PMD の Unicode + 可変長index版。
// 現在は静的メッシュ + マテリアル + ボーン階層 + スキン (最大 4 本) 対応。
// アニメ (VMD) / 表情 / 物理 / IK は未対応。
LoadResult load_pmx(const std::string &path);

}
