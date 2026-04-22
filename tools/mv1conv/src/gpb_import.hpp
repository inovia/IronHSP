#pragma once
#include "stl_import.hpp"
#include <string>

namespace mv1conv {

// GamePlay Binary (.gpb) 最小ローダ。
// 仕様: GamePlay3D (2014-2017 停滞) の gameplay/src/Bundle.cpp を参考。
// Mesh の頂点フォーマット + インデックスバッファから IR に復元する。
// Node hierarchy / アニメ / スキン / マテリアル は現状無視。
LoadResult load_gpb(const std::string &path);

}
