//
//  hsp3dxcl.h — hsp3dx 用 HSP3 ランタイムドライバ
//
//  hsp3/win32/hsp3cl.cpp を参考に、Win32/COM/DLL 依存を落として
//  cross-platform 化したミニマル版ドライバ。
//
//  main.cpp から:
//      hsp3dxcl_init(ax_path);  // .ax をロードして VM 準備
//      hsp3dxcl_exec();         // 実行メインループ (await / wait でブロック解除)
//      hsp3dxcl_bye();          // 終了処理
//
#ifndef __hsp3dxcl_h
#define __hsp3dxcl_h

#ifdef __cplusplus
extern "C" {
#endif

int  hsp3dxcl_init( const char *ax_path );
int  hsp3dxcl_exec( void );
void hsp3dxcl_bye( void );

#ifdef __cplusplus
}
#endif

#endif
