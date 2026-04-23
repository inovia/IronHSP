//
//  hsp3dx_compat.h — Win/iOS/Android 共通用の薄い互換レイヤ
//  (Windows 固有 API を非 Win 環境でも通るよう埋める)
//
#ifndef __hsp3dx_compat_h
#define __hsp3dx_compat_h

#ifndef _WIN32

#include <string.h>
#include <stdlib.h>
#include <cstdint>

//  MSVC 系関数名 → POSIX へ
#define _strdup     strdup
#define _strnicmp   strncasecmp
#define _stricmp    strcasecmp

//  MSVC 固有の snprintf_s バリアントは POSIX では単純に snprintf で代替
#define _snprintf_s(buf, cap, trunc, fmt, ...) snprintf(buf, cap, fmt, ##__VA_ARGS__)

//  MessageBox 互換 (Android では logcat に出すだけ)
#define MB_OK           0
#define MB_ICONERROR    0
#define MB_ICONWARNING  0
#define MB_ICONINFO     0

//  Windows 型の薄皮
typedef unsigned long DWORD;
typedef int           BOOL;
typedef void         *HINSTANCE;
typedef void         *HWND;

//  定数
#ifndef _MAX_PATH
#define _MAX_PATH       260
#endif
#ifndef CP_UTF8
#define CP_UTF8         65001
#endif
#ifndef CP_ACP
#define CP_ACP          0
#endif
#ifndef CP_OEMCP
#define CP_OEMCP        1
#endif

//  Win 専用 API のダミー (hsp3dx Android で呼んでも安全に失敗)
#ifdef __EMSCRIPTEN__
//  Web は capture_shell.html が window.hsp3dxKeyTable[VK code] を埋めるので、
//  EM_ASM_INT で直接読む。VK code = JS keyCode と完全一致するので変換不要。
#include <emscripten.h>
static inline int GetAsyncKeyState( int key ) {
    int v = EM_ASM_INT({
        if ( typeof window.hsp3dxKeyTable === 'undefined' ) return 0;
        if ( $0 < 0 || $0 >= 512 ) return 0;
        return window.hsp3dxKeyTable[$0] ? 0x8000 : 0;
    }, key);
    return v;
}
#else
static inline int GetAsyncKeyState( int /*key*/ ) { return 0; }
#endif
static inline void *GetMainWindowHandle( void )   { return nullptr; }
#define GetModuleHandle(x) ((void *)nullptr)
//  DxLib Android は window mode 概念がない (フルスクリーン固定)
static inline int ChangeWindowMode( int /*flag*/ ) { return 0; }
static inline int SetMainWindowText( const char * /*text*/ ) { return 0; }

//  Win MultiByteToWideChar 互換 (mbstowcs 経由)
#include <stdlib.h>
static inline int MultiByteToWideChar( unsigned /*cp*/, unsigned /*flags*/,
                                        const char *src, int /*srclen*/,
                                        wchar_t *dst, int dstcap )
{
    if ( !src ) { if ( dst && dstcap > 0 ) dst[0] = 0; return 0; }
    size_t n = mbstowcs( dst, src, (size_t)(dstcap > 0 ? dstcap - 1 : 0) );
    if ( n == (size_t)-1 ) { if ( dst && dstcap > 0 ) dst[0] = 0; return 0; }
    if ( dst && dstcap > 0 ) dst[n] = 0;
    return (int)n + 1;
}

#endif   // !_WIN32

//  プラットフォーム共通: UTF-8 文字列を TCHAR (Win=wchar_t / Android=char) で受ける helper
//  wbuf は呼び出し元で wchar_t buf[N] を用意、u8 はソース UTF-8、result は pass する型に自動選択
#ifdef _WIN32
#define HSP3DX_TCHAR_PTR(wbuf, u8)  (wbuf)
#else
#define HSP3DX_TCHAR_PTR(wbuf, u8)  (u8)
#endif

#endif
