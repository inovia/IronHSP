#pragma once
// VMD (Vocaloid Motion Data, MMD 用モーション) を読み込む。
// ModelIR.anim_keysets / anims / anim_sets に追記する形で動作するため、
// モデル IR と組み合わせて使う。
#include "stl_import.hpp"  // LoadResult 型
#include "mv1_ir.hpp"
#include <string>

namespace mv1conv {

// VMD を読み込み、existing_model の bone 名と突き合わせて anim セクションを追加。
// 対応しない bone のキーは無視。戻り値の LoadResult.ir は existing_model のコピー
// +anim。既存 anim は残す (新しい AnimSet として追加)。
LoadResult attach_vmd(const std::string &vmd_path, const ModelIR &existing_model);

}
