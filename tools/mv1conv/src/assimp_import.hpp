#pragma once
#include "stl_import.hpp"  // LoadResult 共用
#include <string>

namespace mv1conv {

// assimp 経由で 40+ format を読み込む (FBX / glTF(+GLB) / 3MF / DAE /
// 3DS / OBJ / STL / PLY / X / WRL / M3D / IFC etc)。
// 現在は静的メッシュ (位置 + 法線 + UV + マテリアル) のみ IR 化。
// スキン/アニメは Phase 2c の skinned writer を待って追加対応する。
LoadResult load_via_assimp(const std::string &path);

}
