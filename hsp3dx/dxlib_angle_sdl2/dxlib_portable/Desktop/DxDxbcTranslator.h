//-----------------------------------------------------------------------------
//
//  DxDxbcTranslator.h
//
//  DxLib の .vso / .pso (DXBC binary, fxc.exe 出力) を GLSL source に翻訳する
//  最小実装。完全互換 (すべての HLSL 4.0+ 命令対応) は範囲外だが、典型的な
//  HSP ユーザ shader (world-view-proj 乗算 + テクスチャサンプル) 程度は扱う。
//
//  失敗時は GLSL 源コード代わりに diagnostic コメントだけ返し、stderr に
//  disassembly をダンプする。user はそれを元に手動ポート可能。
//
//-----------------------------------------------------------------------------
#ifndef DXDBC_TRANSLATOR_H
#define DXDBC_TRANSLATOR_H

#include <string>

// DXBC バイナリを GLSL に翻訳する。
//   data, size: .vso / .pso ファイルの生バイト列
//   out_glsl:   成功時に GLSL ソース (#version 120 ベース) が書き込まれる
//   program_type: 出力引数。0=PS, 1=VS, 2=GS (HLSL SM 番号)
// 戻り値: 0=成功 / -1=DXBC として不正 / -2=翻訳中に未対応命令で失敗
//   (-2 でも out_glsl には部分翻訳 + TODO コメントが書かれる。stderr に詳細)
int DxDxbc_Translate( const void *data, int size,
                      std::string *out_glsl, int *program_type ) ;

// DXBC 内容を stderr に dump する (diagnostic 用)
int DxDxbc_Disassemble( const void *data, int size ) ;

#endif // DXDBC_TRANSLATOR_H
