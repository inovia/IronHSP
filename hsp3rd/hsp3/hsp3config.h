
//
//		Configure for HSP3
//
#ifndef __hsp3config_h
#define __hsp3config_h

//		システム関連ラベル
//
#define HSPTITLE "Hot Soup Processor ver."
#define hspver "3.32"
#define mvscode 5		// minor version code
#define vercode 0x3314	// version code

#define HSPERR_HANDLE		// HSPエラー例外を有効にします
#define SYSERR_HANDLE		// システムエラー例外を有効にします


//
//		移植用のラベル
//
#define JPN			// IME use flag
#define JPNMSG		// japanese message flag

//
//	Debug mode functions
//
#define HSPDEBUGLOG	// Debug Log Version

//		Debug Window Message Buffer Size
//
#define dbsel_size 0x10000
#define dbmes_size 0x10000

//
//		環境フラグ:以下のラベルはコンパイルオプションで設定されます
//
//#define HSPWIN		// Windows(WIN32) version flag
//#define HSPMAC		// Macintosh version flag
//#define HSPLINUX		// Linux(CLI) version flag
//#define HSPIOS		// iOS version flag
//#define HSPNDK		// android NDK version flag
//#define HSPDISH		// HSP3Dish flag
#define HSPEMBED		// HSP3 Embed runtime flag

//
//		環境フラグに付加されるオプション
//
//#define HSPWINGUI		// Windows/GUI (WIN32) version flag
//#define HSPWINDISH	// Windows/DISH (WIN32) version flag
//#define HSPLINUXGUI	// Linux(GUI) version flag

//#define HSPDEBUG	// Debug version flag

//		HSPが使用する実数型
//
#define HSPREAL double

//
//		gcc使用のチェック
//
#if defined(HSPMAC)|defined(HSPIOS)|defined(HSPNDK)|defined(HSPLINUX)
#define HSPGCC			// GCC使用フラグ
#define HSPUTF8			// UTF8使用フラグ
#endif


//
//		移植用の定数
//
#ifdef HSPWIN
#define HSP_MAX_PATH	260
#define HSP_PATH_SEPARATOR '\\'
#else
#define HSP_MAX_PATH	256
#define HSP_PATH_SEPARATOR '/'
#endif

#endif
