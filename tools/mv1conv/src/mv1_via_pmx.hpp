#pragma once
// IR → PMX (メモリ) → tempfile.pmx → subprocess mv1_dxlib_saver.exe → .mv1
//
// DxLib 本家の MV1LoadModelFromMem / MV1SaveModelToMV1File に委譲することで、
// 公式ビューア 100% 互換の .mv1 を生成する。

#include <string>
#include "mv1_ir.hpp"

namespace mv1conv {

struct Mv1ViaPmxResult {
    bool ok = false;
    std::string error;
};

// ModelIR を経由して .mv1 を出力。
// subprocess の mv1_dxlib_saver.exe を呼び出すため、同 exe がパスに存在する
// or mv1conv.exe と同じディレクトリに存在する必要がある。
Mv1ViaPmxResult save_mv1_via_pmx(const ModelIR &ir, const std::string &output_path);

}
