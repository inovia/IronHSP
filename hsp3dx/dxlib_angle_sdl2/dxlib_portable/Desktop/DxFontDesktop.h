// -------------------------------------------------------------------------------
//
//      DX ライブラリ   Desktop (SDL2_ttf) 用 フォント
//
// -------------------------------------------------------------------------------

#ifndef DX_FONTDESKTOP_H
#define DX_FONTDESKTOP_H

#include "../DxCompileConfig.h"

#ifndef DX_NON_FONT

#ifndef DX_NON_NAMESPACE
namespace DxLib
{
#endif

// フォントハンドルの環境依存データ
// SDL2_ttf の TTF_Font* は void* で保持 (ヘッダへ SDL_ttf.h 染み出し防止)
struct FONTMANAGE_PF
{
    void   *FontData ;        // 実体は TTF_Font*
    int     Dummy ;
} ;

#ifndef DX_NON_NAMESPACE
}
#endif

#endif // DX_NON_FONT

#endif // DX_FONTDESKTOP_H
