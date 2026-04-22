#pragma once
#include "stl_import.hpp"  // LoadResult 共用
#include <string>

namespace mv1conv {

// 最小 PLY (ASCII + binary_little_endian、float x/y/z + list vertex_indices)
LoadResult load_ply(const std::string &path);

}
