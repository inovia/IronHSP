#pragma once
// ModelIR を assimp Exporter で任意フォーマットに書き出す。
// 対応: obj, gltf2 (拡張子 .gltf/.glb), collada (.dae), ply, stl, fbx (binary/ascii)
#include "mv1_ir.hpp"
#include <string>

namespace mv1conv {

// fmt_hint: "obj" / "gltf2" / "glb2" / "collada" / "ply" / "stl" / "fbx" / "fbxa"
// 空ならパスの拡張子から推定。
// 戻り値は空文字列で成功、非空はエラーメッセージ。
std::string export_via_assimp(const ModelIR &ir, const std::string &path,
                              const std::string &fmt_hint);

}
