#pragma once
// VRM (glTF 拡張) の固有情報を抽出するユーティリティ。
//   - extensions.VRM (v0.x) / extensions.VRMC_vrm (v1.0) の humanoid mapping
//   - extensions.VRM.materialProperties[] の MToon (outline / shade color 等)
//
// assimp は VRM 拡張を無視するので、ファイル側 JSON を自前で読む。
// .vrm は GLB なので、JSON chunk を取り出してパースする。
#include "stl_import.hpp"  // LoadResult 型
#include "mv1_ir.hpp"
#include <string>

namespace mv1conv {

// model (assimp ロード済 IR) に VRM 拡張情報を追記する。
// - bone 名を humanoid 標準名 (hips/spine/head 等) に書き換え可能
// - マテリアルの toon 情報を MToon から読んで設定
// vrm_path = 入力 VRM ファイル。
// mmd_names = true なら humanoid → MMD 日本語名 (センター/頭 等) にマップ
LoadResult apply_vrm_extensions(const std::string &vrm_path, const ModelIR &in_model,
                                bool mmd_names);

}
