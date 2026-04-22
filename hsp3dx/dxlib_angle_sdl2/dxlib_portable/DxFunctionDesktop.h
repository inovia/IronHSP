// -------------------------------------------------------------------------------
//
//      DX ライブラリ   Desktop (Mac/Linux/Web + SDL2 + ANGLE) 専用 API 宣言
//
//      DxFunctioniOS.h をベースに、SDL2/ANGLE ビルド向けに複製したもの
//      (hsp3dx dxlib_angle_sdl2 移植フォーク)
//
// -------------------------------------------------------------------------------

#ifndef DX_FUNCTIONDESKTOP_H
#define DX_FUNCTIONDESKTOP_H

#include "DxLib.h"

#ifndef DX_NON_NAMESPACE
namespace DxLib
{
#endif

// Desktop 専用の API ------------------------------------------------------------

// アプリのデータ保存用ディレクトリパスを取得する
// (SDL_GetPrefPath ベース / 各 OS のユーザーディレクトリを返す)
extern int GetDocumentsDirPath( TCHAR *PathBuffer, size_t PathBufferBytes ) ;

// キャッシュファイル保存用ディレクトリパスを取得する
extern int GetLibraryCachesDirPath( TCHAR *PathBuffer, size_t PathBufferBytes ) ;

// 一時ファイル保存用ディレクトリパスを取得する
extern int GetTmpDirPath( TCHAR *PathBuffer, size_t PathBufferBytes ) ;

// ディスプレイの解像度を取得する
extern int GetDisplayResolution_Desktop( int *SizeX, int *SizeY ) ;

// 端末に設定されている言語を取得する
extern int GetLanguage_Desktop( TCHAR *StringBuffer, int StringBufferSize ) ;

// DX ライブラリが行った OpenGL ES の設定を再度行う (特殊用途)
extern int RefreshDxLibOpenGLESSetting( void ) ;

#ifndef DX_NON_NAMESPACE
}
#endif

#endif // DX_FUNCTIONDESKTOP_H
