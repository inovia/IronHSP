
//
//	supio.cpp functions
//
#ifndef __supio_h
#define __supio_h

#ifdef HSPWIN
#ifdef HSPUTF8
#define STRLEN utf8strlen
#else
#define STRLEN strlen
#endif
#else
#define STRLEN strlen
#endif

#ifdef HSPWIN
#ifdef HSPUTF8
#include "win32gui/supio_win_unicode.h"
#else
#include "win32gui/supio_win.h"
#endif
#endif

//  hsp3dx ビルドでも supio_* の宣言 (mem_ini / htoi / strsp_* 等) は必要。
//  supio_*.h 内部の hsp3dish 依存 (appengine.h) は HSP3DX でさらに guard 済み。
#ifdef HSPIOS
#include "ios/supio_ios.h"
#endif

#ifdef HSPNDK
#include "ndk/supio_ndk.h"
#endif

#ifdef HSPLINUX
#include "linux/supio_linux.h"
#endif

#ifdef HSPEMSCRIPTEN
#include "emscripten/supio_emscripten.h"
#endif

#ifdef HSPMAC
#include "linux/supio_linux.h"
#endif


#endif

