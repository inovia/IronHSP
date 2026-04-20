//
//  hsp3dx_stubs.cpp — Phase 1.1 向け拡張命令テーブル空実装
//
//  HSP3 VM が起動時に呼ぶ hsp3typeinit_cl_extcmd / hsp3typeinit_cl_extfunc の
//  最小限のスタブ。Phase 1.1 ではどちらも「何も登録しない」実装で、VM が
//  起動して簡単な .ax (`end` だけなど) を実行するだけの動作確認をする目的。
//
//  Phase 1.2 以降で実際の拡張命令 (mes / wait / await / exist / 他) を
//  埋めていく。最終的には DxLib 連携 (dxlib_core プラグイン) もここに統合。
//
#include "../../hsp3/hsp3config.h"
#include "../../hsp3/hsp3struct.h"

extern "C" {

int hsp3typeinit_cl_extcmd( HSP3TYPEINFO * /*info*/ )
{
    //  TODO (Phase 1.2): mes / wait / await / end / exist などを登録
    //  現状は未登録のため、これらの HSP 命令を含む .ax は実行時エラーになる
    return 0;
}

int hsp3typeinit_cl_extfunc( HSP3TYPEINFO * /*info*/ )
{
    //  TODO (Phase 1.2): システム変数 (cnt / stat / refstr / refdval 等) を登録
    //  現状は未登録
    return 0;
}

} // extern "C"
