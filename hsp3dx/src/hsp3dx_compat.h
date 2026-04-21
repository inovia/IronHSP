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

#endif   // !_WIN32

#endif
