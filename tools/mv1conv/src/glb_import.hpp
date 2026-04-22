#pragma once
#include "stl_import.hpp"
#include <string>

namespace mv1conv {

// バイナリ glTF (.glb) 最小ローダ。
// 対応: 単一 mesh / POSITION + 任意の NORMAL / TEXCOORD_0 / indices (u16/u32) /
// pbrMetallicRoughness.baseColorFactor
// 未対応: 分離 .gltf + .bin / スキニング / アニメ / 複数バッファ / interleaved stride
LoadResult load_glb(const std::string &path);

}
