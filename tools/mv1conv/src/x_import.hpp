#pragma once
#include "stl_import.hpp"  // LoadResult 共用
#include <string>

namespace mv1conv {

// DirectX .x (ASCII) 最小ローダ。静的 Mesh { ... } ブロックの
// vertex / face / MeshNormals / MeshTextureCoords / MeshMaterialList を拾う。
// Frame/スキニング/アニメは無視。
LoadResult load_x(const std::string &path);

}
