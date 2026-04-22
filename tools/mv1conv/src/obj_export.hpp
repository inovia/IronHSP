#pragma once
#include "mv1_reader.hpp"
#include <cstdio>
#include <string>

namespace mv1conv {

// MV1 を Wavefront OBJ (v / vn / vt / f) に書き出す。
// 非スキンメッシュ (VertexType=NORMAL) のみ対応。スキンメッシュはスキップして警告。
// 戻り値: 0=成功 / !0=エラー
int export_obj(const Mv1File &file, const std::string &obj_path);

}
