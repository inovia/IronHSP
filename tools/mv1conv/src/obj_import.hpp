#pragma once
#include "mv1_ir.hpp"
#include <string>

namespace mv1conv {

// Wavefront OBJ (最小サブセット: v / vn / vt / f) を IR に読み込む。
// material/texture は生成しない (cube / sphere などテスト用途を想定)。
struct ObjLoadResult {
    ModelIR ir;
    std::string error;
    bool ok() const { return error.empty(); }
};

ObjLoadResult load_obj(const std::string &path);

}
