//
//	hspwnd_ios.h — iOS 向け Bmscr ダミー宣言
//
//	hsp3dx は DxLib iOS 側で画面管理するので、Bmscr は空実装で十分。
//	Android 版 (hspwnd_ndk.h) と同じ構造。
//
#ifndef __hspwnd_ios_h
#define __hspwnd_ios_h

#include "../hsp3code.h"

//	Bmscr class
//
class Bmscr {
public:
};

//	Bmscr structure (same as Bmscr)
//
typedef struct BMSCR
{
} BMSCR;

#endif
