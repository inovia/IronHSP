#pragma once
#include "mv1_ir.hpp"
#include <string>

namespace mv1conv {

struct LoadResult {
    ModelIR ir;
    std::string error;
    bool ok() const { return error.empty(); }
};

// Binary + ASCII STL 自動判別
LoadResult load_stl(const std::string &path);

}
