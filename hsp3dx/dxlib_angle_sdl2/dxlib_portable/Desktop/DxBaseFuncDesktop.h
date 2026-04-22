// -------------------------------------------------------------------------------
//
//      DX ライブラリ   Desktop (SDL2/ANGLE) 用 標準関数互換 ヘッダ
//
// -------------------------------------------------------------------------------

#ifndef DX_BASEFUNC_DESKTOP_H
#define DX_BASEFUNC_DESKTOP_H

#include "../DxCompileConfig.h"
#include "../DxBaseFunc.h"

#ifndef DX_NON_NAMESPACE
namespace DxLib
{
#endif

// wchar_t のコードフォーマット。
// Mac/Linux/Web では wchar_t = 32-bit が標準 (iOS と同じ)。
// Windows MSVC は wchar_t = 16-bit だが、ここを通る desktop ビルドは
// SDL2 上の cross-compile (主に MinGW/clang) を想定するため 32-bit 前提。
#define DESKTOP_WCHAR_CHARCODEFORMAT		(DX_CHARCODEFORMAT_UTF32LE)

#ifndef DX_NON_NAMESPACE
}
#endif

#endif // DX_BASEFUNC_DESKTOP_H
