#pragma once
#include "stl_import.hpp"
#include <string>

namespace mv1conv {

// VRML 2.0 / 97 (.wrl) 最小ローダ。IndexedFaceSet の coord.point と
// coordIndex を拾って静的メッシュ化する簡易実装。
LoadResult load_wrl(const std::string &path);

}
