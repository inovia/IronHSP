// -------------------------------------------------------------------------------
//
//      DX ライブラリ   Desktop (Mac/Linux/Web + SDL2 + ANGLE) 用 データ型定義
//
//      DxDataTypeiOS.h をベースに、SDL2/ANGLE ビルド向けに複製したもの
//      (hsp3dx dxlib_angle_sdl2 移植フォーク)
//
// -------------------------------------------------------------------------------

#ifndef DX_DATATYPEDESKTOP_H
#define DX_DATATYPEDESKTOP_H

#include "DxCompileConfig.h"

// Windows 上で Desktop ビルドする場合は <windows.h> に BYTE/WORD/DWORD/LPLONG
// /LONG/BOOL/RECT/POINT/BITMAPINFO 等を任せ、非 Windows では DxLib 独自に
// 定義する (iOS 版と同じ)。
#ifdef _WIN32
  #include <windows.h>
  #define DX_DESKTOP_TYPES_FROM_WINDOWS_H 1
#endif

// ---- Windows 非依存の補助定義 ------------------------------------------------

#ifndef FASTCALL
#define FASTCALL
#endif

#ifndef TRUE
#define TRUE		(1)
#endif

#ifndef FALSE
#define FALSE		(0)
#endif

#ifndef _T
#ifdef UNICODE
#define _T( x )		L ## x
#else
#define _T( x )		x
#endif
#endif

#ifndef TEXT
#ifdef UNICODE
#define TEXT( x )	L ## x
#else
#define TEXT( x )	x
#endif
#endif

// ---- 非 Windows (Mac/Linux/Web) の時だけ提供する型定義 ----------------------

#ifndef DX_DESKTOP_TYPES_FROM_WINDOWS_H

typedef void *		HBITMAP ;
typedef void *		HINSTANCE ;
typedef char *		LPSTR ;

#ifndef BOOL
#define BOOL		int
#endif

#ifndef TCHAR
#ifdef UNICODE
#define TCHAR		wchar_t
#else
#define TCHAR		char
#endif
#endif

#ifndef NEAR
#define NEAR
#endif

#ifndef FAR
#define FAR
#endif

#ifndef WINAPI
#define WINAPI
#endif

#ifndef LONG
#define LONG		int
#endif

typedef int *		LPLONG ;

#ifndef LONGLONG
#define LONGLONG	long long
#endif

#ifndef ULONGLONG
#define ULONGLONG	unsigned long long
#endif

#ifndef BYTE
#define BYTE		unsigned char
#endif

#ifndef WORD
#define WORD		unsigned short
#endif

#ifndef DWORD
#define DWORD		unsigned int
#endif

typedef unsigned int *	LPDWORD ;

#ifndef DWORD_PTR
#define DWORD_PTR	unsigned long long
#endif

#ifndef LONG_PTR
#define LONG_PTR	long long
#endif

#define FILE_ATTRIBUTE_DIRECTORY			0x00000010

#define BI_RGB				0L
#define BI_RLE8				1L
#define BI_RLE4				2L
#define BI_BITFIELDS		3L

// --- 構造体定義 (Windows.h が無い時のみ) ----------------------------------

typedef struct tagRECT
{
	LONG				left ;
	LONG				top ;
	LONG				right ;
	LONG				bottom ;
} RECT, *PRECT, NEAR *NPRECT, FAR *LPRECT ;

typedef struct tagPOINT
{
	LONG				x ;
	LONG				y ;
} POINT, *PPOINT, NEAR *NPPOINT, FAR *LPPOINT ;


typedef struct tagSIZE
{
	LONG				cx ;
	LONG				cy ;
} SIZE, *PSIZE, *LPSIZE ;

#pragma pack(push, 2)
typedef struct tagBITMAPFILEHEADER
{
	WORD				bfType ;
	DWORD				bfSize ;
	WORD				bfReserved1 ;
	WORD				bfReserved2 ;
	DWORD				bfOffBits ;
} BITMAPFILEHEADER, FAR *LPBITMAPFILEHEADER, *PBITMAPFILEHEADER ;
#pragma pack(pop)

typedef struct tagRGBQUAD
{
	BYTE				rgbBlue ;
	BYTE				rgbGreen ;
	BYTE				rgbRed ;
	BYTE				rgbReserved ;
} RGBQUAD ;

typedef struct tagBITMAPINFOHEADER
{
	DWORD				biSize ;
	LONG				biWidth ;
	LONG				biHeight ;
	WORD				biPlanes ;
	WORD				biBitCount ;
	DWORD				biCompression ;
	DWORD				biSizeImage ;
	LONG				biXPelsPerMeter ;
	LONG				biYPelsPerMeter ;
	DWORD				biClrUsed ;
	DWORD				biClrImportant ;
} BITMAPINFOHEADER, FAR *LPBITMAPINFOHEADER, *PBITMAPINFOHEADER ;

typedef struct tagBITMAPINFO
{
	BITMAPINFOHEADER	bmiHeader ;
	RGBQUAD				bmiColors[ 1 ] ;
} BITMAPINFO, FAR *LPBITMAPINFO, *PBITMAPINFO ;

#endif // !DX_DESKTOP_TYPES_FROM_WINDOWS_H

// ---- MAKEFOURCC / _FPCLASS_* は環境によらず提供 --------------------------

#ifndef MAKEFOURCC
#define MAKEFOURCC( ch0, ch1, ch2, ch3 )                              \
			( ( DWORD )( BYTE )( ch0 )        | ( ( DWORD )( BYTE )( ch1 ) << 8  ) |   \
			( ( DWORD )( BYTE )( ch2 ) << 16) | ( ( DWORD )( BYTE )( ch3 ) << 24 ) )
#endif

#ifndef _FPCLASS_SNAN
#define _FPCLASS_SNAN		0x0001
#define _FPCLASS_QNAN		0x0002
#define _FPCLASS_NINF		0x0004
#define _FPCLASS_NN			0x0008
#define _FPCLASS_ND			0x0010
#define _FPCLASS_NZ			0x0020
#define _FPCLASS_PZ			0x0040
#define _FPCLASS_PD			0x0080
#define _FPCLASS_PN			0x0100
#define _FPCLASS_PINF		0x0200
#endif

#endif // DX_DATATYPEDESKTOP_H
