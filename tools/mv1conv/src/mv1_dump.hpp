#pragma once
#include "mv1_reader.hpp"
#include <cstdio>

namespace mv1conv {

int dump(const Mv1File &file, std::FILE *out);

}
