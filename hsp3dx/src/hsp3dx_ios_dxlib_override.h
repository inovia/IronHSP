//
//  hsp3dx_ios_dxlib_override.h — iOS DxLib ファイル I/O override
//
//  DxLib iOS は LoadGraph / LoadSoundMem にパスを渡すと bundle Resources
//  しか見ないため、Documents 下のファイルを開けない。fopen で読んで
//  CreateGraphFromMem / LoadSoundMemByMemImage でハンドル化するラッパを
//  挟む。自動生成 dispatcher (hsp3dx_dxlib_auto*.cpp) の #include "DxLib.h"
//  直後で include することで、auto 生成コード内の LoadGraph/LoadSoundMem
//  呼び出しが自動的にラッパに差し替わる。
//
//  他プラットフォーム (Win/Android) では何もしない (定義を素通し)。
//
#ifndef __hsp3dx_ios_dxlib_override_h
#define __hsp3dx_ios_dxlib_override_h

#if defined(__APPLE__)
#include <TargetConditionals.h>
#endif

#if defined(__APPLE__) && defined(TARGET_OS_IPHONE) && TARGET_OS_IPHONE

#ifdef __cplusplus
extern "C" {
#endif

int hsp3dx_ios_LoadGraph_wrap( const char *path, int NotUse3DFlag );
int hsp3dx_ios_LoadSoundMem_wrap( const char *path, int BufferNum, int UnionHandle );

#ifdef __cplusplus
}
#endif

#define LoadGraph       hsp3dx_ios_LoadGraph_wrap
#define LoadSoundMem    hsp3dx_ios_LoadSoundMem_wrap

#endif  // __APPLE__

#endif
