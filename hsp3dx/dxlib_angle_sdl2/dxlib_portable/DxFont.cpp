// ----------------------------------------------------------------------------
// 
// 		�c�w���C�u����		�c�����������c����������v���O����
// 
// 				Ver 3.24f
// 
// ----------------------------------------------------------------------------

// �c�w���C�u�����쐬���p��`
#define DX_MAKE

#include "DxCompileConfig.h"

#ifndef DX_NON_FONT

// �C���N���[�h----------------------------------------------------------------
#include "DxLib.h"
#include "DxStatic.h"
#include "DxFont.h"
#include "DxMask.h"
#include "DxMath.h"
#include "DxMemory.h"
#include "DxChar.h"
#include "DxBaseFunc.h"
#include "DxSystem.h"
#include "DxUseCLib.h"
#include "DxBaseImage.h"
#include "DxArchive_.h"
#include "DxGraphics.h"
#include "DxASyncLoad.h"
#include "DxLog.h"

#ifdef WINDOWS_DESKTOP_OS
#include "Windows/DxFontWin.h"
#endif // WINDOWS_DESKTOP_OS

#ifdef __ANDROID__
#include "Android/DxFontAndroid.h"
#endif // __ANDROID__

#ifdef __APPLE__
    #include "TargetConditionals.h"
    #if TARGET_OS_IPHONE
		#include "iOS/DxFontiOS.h"
    #endif // TARGET_OS_IPHONE
#endif // __APPLE__

// ===== hsp3dx dxlib_angle_sdl2 fork patch =====
#ifdef DX_PLATFORM_DESKTOP_SDL2
#include "Desktop/DxFontDesktop.h"
#endif





#ifndef DX_NON_NAMESPACE

namespace DxLib
{

#endif // DX_NON_NAMESPACE

// �}�N����`------------------------------------------------------------------

#define FONTEDGE_PATTERN_NUM	(4)			// �p�ӂ��镶���̉��̃p�^�[���̐�


#define FONTHANDLE_TCHAR_TO_WCHAR_TEMPSTRINGLENGTH				(512)

#define FONTHANDLE_TCHAR_TO_WCHAR_T_STRING_BEGIN( str, err_ret )		\
	int CharCodeFormat ;\
	wchar_t StringBuffer[ FONTHANDLE_TCHAR_TO_WCHAR_TEMPSTRINGLENGTH ] ;\
	wchar_t *AllocStringBuffer = NULL ;\
	wchar_t *UseStringBuffer ;\
	size_t StrLength ;\
	size_t wchar_StrLength ;\
	\
	DEFAULT_FONT_HANDLE_SETUP\
	\
	CharCodeFormat = GetFontHandleCharCodeFormat( FontHandle ) ;\
	if( CharCodeFormat < 0 )\
	{\
		return err_ret ;\
	}\
	\
	StrLength = CL_strlen( CharCodeFormat, str ) ;\
	if( StrLength > FONTHANDLE_TCHAR_TO_WCHAR_TEMPSTRINGLENGTH - 8 )\
	{\
		AllocStringBuffer = ( wchar_t * )DXALLOC( sizeof( wchar_t ) * ( StrLength + 16 ) ) ;\
		if( AllocStringBuffer == NULL )\
		{\
			return err_ret ;\
		}\
		UseStringBuffer = AllocStringBuffer ;\
	}\
	else\
	{\
		UseStringBuffer = StringBuffer ;\
	}\
	\
	wchar_StrLength = ConvString( ( const char * )str, -1, CharCodeFormat, ( char * )UseStringBuffer, sizeof( wchar_t ) * ( StrLength + 16 ), WCHAR_T_CHARCODEFORMAT ) / GetCharCodeFormatUnitSize( WCHAR_T_CHARCODEFORMAT ) ;\
	if( wchar_StrLength > 0 )\
	{\
		wchar_StrLength -- ;\
	}


#define FONTHANDLE_TCHAR_WITH_STRLENGTH_TO_WCHAR_T_STRING_BEGIN( str, strlength, err_ret )		\
	int CharCodeFormat ;\
	wchar_t StringBuffer[ FONTHANDLE_TCHAR_TO_WCHAR_TEMPSTRINGLENGTH ] ;\
	wchar_t *AllocStringBuffer = NULL ;\
	wchar_t *UseStringBuffer ;\
	size_t wchar_StrLength ;\
	\
	DEFAULT_FONT_HANDLE_SETUP\
	\
	CharCodeFormat = GetFontHandleCharCodeFormat( FontHandle ) ;\
	if( CharCodeFormat < 0 )\
	{\
		return err_ret ;\
	}\
	\
	if( strlength > FONTHANDLE_TCHAR_TO_WCHAR_TEMPSTRINGLENGTH - 8 )\
	{\
		AllocStringBuffer = ( wchar_t * )DXALLOC( sizeof( wchar_t ) * ( strlength + 16 ) ) ;\
		if( AllocStringBuffer == NULL )\
		{\
			return err_ret ;\
		}\
		UseStringBuffer = AllocStringBuffer ;\
	}\
	else\
	{\
		UseStringBuffer = StringBuffer ;\
	}\
	\
	wchar_StrLength = ConvString( ( const char * )str, ( int )strlength, CharCodeFormat, ( char * )UseStringBuffer, sizeof( wchar_t ) * ( strlength + 16 ), WCHAR_T_CHARCODEFORMAT ) / GetCharCodeFormatUnitSize( WCHAR_T_CHARCODEFORMAT ) ;\
	if( wchar_StrLength > 0 )\
	{\
		wchar_StrLength -- ;\
	}


#define FONTHANDLE_TCHAR_TO_WCHAR_T_STRING_END		\
	if( AllocStringBuffer != NULL )					\
	{												\
		DXFREE( AllocStringBuffer ) ;				\
		AllocStringBuffer = NULL ;					\
	}


#define FONTHANDLE_WCHAR_T_WITH_STRLENGTH_TO_WCHAR_T_STRING_BEGIN( str, strlength, err_ret )		\
	wchar_t StringBuffer[ FONTHANDLE_TCHAR_TO_WCHAR_TEMPSTRINGLENGTH ] ;\
	wchar_t *AllocStringBuffer = NULL ;\
	wchar_t *UseStringBuffer ;\
	\
	DEFAULT_FONT_HANDLE_SETUP\
	\
	if( strlength > FONTHANDLE_TCHAR_TO_WCHAR_TEMPSTRINGLENGTH - 8 )\
	{\
		AllocStringBuffer = ( wchar_t * )DXALLOC( sizeof( wchar_t ) * ( strlength + 16 ) ) ;\
		if( AllocStringBuffer == NULL )\
		{\
			return err_ret ;\
		}\
		UseStringBuffer = AllocStringBuffer ;\
	}\
	else\
	{\
		UseStringBuffer = StringBuffer ;\
	}\
	\
	CL_strncpy( WCHAR_T_CHARCODEFORMAT, ( char * )UseStringBuffer, ( const char * )str, ( int )( strlength ) ) ;\
	UseStringBuffer[ strlength ] = L'\0' ;


#define FONTHANDLE_WCHAR_T_TO_WCHAR_T_STRING_END		\
	if( AllocStringBuffer != NULL )					\
	{												\
		DXFREE( AllocStringBuffer ) ;				\
		AllocStringBuffer = NULL ;					\
	}


#define FONTHANDLE_TCHAR_WITH_STRLEN_TO_WCHAR_T_STRING_BEGIN( str, str_len, err_ret )\
	const char *UseString ;\
	char *TempAllocBuffer = NULL ;\
	char TempBuffer[ 512 ] ;\
	\
	DEFAULT_FONT_HANDLE_SETUP\
	\
	if( str_len < 0 )\
	{\
		UseString = str ;\
	}\
	else\
	{\
		int CharCodeFormat = GetFontHandleCharCodeFormat( FontHandle ) ;\
		if( CharCodeFormat < 0 )\
		{\
			return err_ret ;\
		}\
		int CharUnitSize = GetCharCodeFormatUnitSize( CharCodeFormat ) ;\
		int StrLength = ( int )CL_strlen( CharCodeFormat, str ) ;\
		\
		if( str_len > StrLength )\
		{\
			str_len = StrLength ;\
		}\
		\
		if( sizeof( TempBuffer ) <= ( size_t )( CharUnitSize * str_len + 16 ) )\
		{\
			TempAllocBuffer = ( char * )DXALLOC( CharUnitSize * str_len + 16 ) ;\
			if( TempAllocBuffer == NULL )\
			{\
				return err_ret ;\
			}\
			UseString = TempAllocBuffer ;\
		}\
		else\
		{\
			UseString = TempBuffer ;\
		}\
		\
		_MEMCPY( ( char * )UseString, str, CharUnitSize * str_len ) ;\
		_MEMSET( ( char * )&UseString[ CharUnitSize * str_len ], 0, CharUnitSize * 8 ) ;\
	}\
	\
	FONTHANDLE_TCHAR_TO_WCHAR_T_STRING_BEGIN( UseString, -1 )


#define FONTHANDLE_TCHAR_WITH_STRLEN_TO_WCHAR_T_STRING_END\
	FONTHANDLE_TCHAR_TO_WCHAR_T_STRING_END\
	\
	if( TempAllocBuffer != NULL )\
	{\
		DXFREE( TempAllocBuffer ) ;\
		TempAllocBuffer = NULL ;\
	}



#ifdef UNICODE
	#define TCHAR_CHARCODEFORMAT_SETUP( err )		\
		int CharCodeFormat ;\
		\
		DEFAULT_FONT_HANDLE_SETUP\
		\
		CharCodeFormat = WCHAR_T_CHARCODEFORMAT ;
#else
	#define TCHAR_CHARCODEFORMAT_SETUP( err )		\
		int CharCodeFormat ;\
		\
		DEFAULT_FONT_HANDLE_SETUP\
		\
		CharCodeFormat = GetFontHandleCharCodeFormat( FontHandle ) ;\
		if( CharCodeFormat < 0 )\
		{\
			return err ;\
		}
#endif

#define TCHAR_FONTHANDLE_FORMATSTRING_SETUP( err )			\
	va_list VaList ;\
	TCHAR String[ 2048 ] ;\
	\
	TCHAR_CHARCODEFORMAT_SETUP( err )\
	\
	va_start( VaList, FormatString ) ;\
	\
	CL_vsnprintf( CharCodeFormat, _TISWCHAR, CHAR_CHARCODEFORMAT, WCHAR_T_CHARCODEFORMAT, ( char * )String, sizeof( String ) / sizeof( TCHAR ), ( const char * )FormatString, VaList ) ;\
	\
	va_end( VaList ) ;

#define TCHAR_FONTHANDLE_FORMATSTRING_VALIST_SETUP( err )			\
	TCHAR String[ 2048 ] ;\
	\
	TCHAR_CHARCODEFORMAT_SETUP( err )\
	\
	CL_vsnprintf( CharCodeFormat, _TISWCHAR, CHAR_CHARCODEFORMAT, WCHAR_T_CHARCODEFORMAT, ( char * )String, sizeof( String ) / sizeof( TCHAR ), ( const char * )FormatString, VaList ) ;


// �\���̌^�錾----------------------------------------------------------------

// �f�[�^�錾------------------------------------------------------------------

static const char *GetFontCacheChar_ErrorMessage = "\xc6\x30\xad\x30\xb9\x30\xc8\x30\xad\x30\xe3\x30\xc3\x30\xb7\x30\xe5\x30\x6e\x30\xfd\x8f\xa0\x52\x6b\x30\x31\x59\x57\x65\x57\x30\x7e\x30\x57\x30\x5f\x30\x0a\x00\x00"/*@ L"�e�L�X�g�L���b�V���̒ǉ��Ɏ��s���܂���\n" @*/ ;

// �����̉��̃p�^�[���e�[�u��
static unsigned char _FontEdgePattern[FONTEDGE_PATTERN_NUM][FONTEDGE_PATTERN_NUM*2+1][FONTEDGE_PATTERN_NUM*2+1] =
{
	// 1
	{
		{0,1,0},
		{1,1,1},
		{0,1,0},
	},
	
	// 2
	{
		{0,1,1,1,0},
		{1,1,1,1,1},
		{1,1,1,1,1},
		{1,1,1,1,1},
		{0,1,1,1,0},
	},
	
	// 3
	{
		{0,0,0,1,0,0,0},
		{0,1,1,1,1,1,0},
		{0,1,1,1,1,1,0},
		{1,1,1,1,1,1,1},
		{0,1,1,1,1,1,0},
		{0,1,1,1,1,1,0},
		{0,0,0,1,0,0,0},
	},
	
	// 4
	{
		{0,0,1,1,1,1,1,0,0},
		{0,1,1,1,1,1,1,1,0},
		{1,1,1,1,1,1,1,1,1},
		{1,1,1,1,1,1,1,1,1},
		{1,1,1,1,1,1,1,1,1},
		{1,1,1,1,1,1,1,1,1},
		{1,1,1,1,1,1,1,1,1},
		{0,1,1,1,1,1,1,1,0},
		{0,0,1,1,1,1,1,0,0},
	},
} ;

int CharCodeFormatTable[ DX_CHARSET_NUM ] =
{
	DX_CHARCODEFORMAT_SHIFTJIS,			// DX_CHARSET_DEFAULT
	DX_CHARCODEFORMAT_SHIFTJIS,			// DX_CHARSET_SHFTJIS
	DX_CHARCODEFORMAT_UHC,				// DX_CHARSET_HANGEUL
	DX_CHARCODEFORMAT_BIG5,				// DX_CHARSET_BIG5
	DX_CHARCODEFORMAT_GB2312,			// DX_CHARSET_GB2312
	DX_CHARCODEFORMAT_WINDOWS_1252,		// DX_CHARSET_WINDOWS_1252
	DX_CHARCODEFORMAT_ISO_IEC_8859_15,	// DX_CHARSET_ISO_IEC_8859_15
	DX_CHARCODEFORMAT_UTF8,				// DX_CHARSET_UTF8
} ;

static BYTE DefaultFontDataFileImage[] =
{
	0x46,0x4e,0x54,0x46,0x01,0x00,0x00,0x00,0x49,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
	0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x84,0x01,0x00,0x00,0x31,0x00,0x00,0x00,
	0xfe,0x2d,0xff,0x33,0xff,0x20,0x00,0xb4,0x30,0xb7,0x30,0xc3,0x30,0xaf,0x30,0x00,
	0xfe,0x7c,0x07,0x00,0x10,0x00,0x12,0xfe,0x08,0x07,0x28,0x00,0x01,0x00,0xff,0xff,
	0x0f,0xfe,0xcc,0x01,0x4b,0xfe,0x94,0x01,0x00,
} ;

static int DefaultFontImageConvert ;
static BYTE DefaultFontImage[] =
{
	0x45,0x51,0x51,0x41,0x41,0x41,0x50,0x68,0x41,0x41,0x41,0x42,0x45,0x45,0x41,0x41,
	0x44,0x39,0x51,0x6b,0x30,0x2b,0x45,0x41,0x44,0x39,0x43,0x41,0x41,0x2b,0x41,0x41,
	0x41,0x41,0x4b,0x41,0x41,0x41,0x41,0x49,0x44,0x39,0x41,0x41,0x77,0x42,0x2f,0x51,
	0x41,0x43,0x41,0x66,0x30,0x51,0x47,0x50,0x31,0x34,0x41,0x50,0x2f,0x39,0x41,0x41,
	0x48,0x2f,0x2f,0x2f,0x32,0x6f,0x48,0x2f,0x32,0x6b,0x50,0x77,0x43,0x41,0x41,0x6f,
	0x42,0x38,0x48,0x44,0x6f,0x51,0x52,0x49,0x49,0x67,0x2f,0x68,0x67,0x51,0x4d,0x50,
	0x30,0x49,0x44,0x34,0x49,0x69,0x52,0x69,0x68,0x45,0x67,0x68,0x43,0x41,0x49,0x42,
	0x41,0x49,0x41,0x41,0x43,0x38,0x65,0x6f,0x41,0x43,0x49,0x49,0x49,0x6f,0x71,0x6b,
	0x51,0x51,0x51,0x50,0x30,0x49,0x44,0x38,0x4b,0x47,0x2f,0x51,0x41,0x50,0x52,0x4b,
	0x6f,0x6f,0x43,0x43,0x44,0x39,0x43,0x41,0x2b,0x43,0x67,0x6f,0x42,0x38,0x49,0x49,
	0x4a,0x45,0x6b,0x68,0x41,0x49,0x45,0x50,0x30,0x59,0x44,0x38,0x43,0x41,0x2f,0x51,
	0x41,0x50,0x4b,0x42,0x51,0x49,0x2f,0x54,0x67,0x50,0x67,0x70,0x4a,0x45,0x4a,0x41,
	0x52,0x41,0x45,0x41,0x54,0x39,0x41,0x44,0x2b,0x69,0x67,0x76,0x36,0x43,0x67,0x70,
	0x4b,0x43,0x51,0x67,0x4b,0x41,0x45,0x41,0x4c,0x39,0x41,0x46,0x2b,0x63,0x66,0x50,
	0x30,0x41,0x48,0x34,0x4b,0x43,0x2f,0x76,0x30,0x49,0x48,0x2f,0x30,0x41,0x41,0x43,
	0x44,0x39,0x47,0x41,0x62,0x39,0x41,0x44,0x2f,0x39,0x4f,0x41,0x44,0x39,0x2b,0x41,
	0x39,0x4d,0x2f,0x55,0x41,0x50,0x47,0x42,0x41,0x77,0x4d,0x76,0x33,0x78,0x41,0x41,
	0x45,0x32,0x2b,0x44,0x77,0x2b,0x50,0x43,0x42,0x38,0x67,0x68,0x41,0x77,0x68,0x42,
	0x43,0x53,0x67,0x6a,0x67,0x41,0x54,0x49,0x52,0x43,0x51,0x6b,0x49,0x67,0x67,0x6f,
	0x49,0x51,0x53,0x49,0x67,0x51,0x6b,0x6f,0x4a,0x45,0x41,0x49,0x53,0x43,0x67,0x49,
	0x4b,0x41,0x49,0x41,0x4b,0x43,0x45,0x49,0x53,0x51,0x45,0x4a,0x4b,0x43,0x67,0x76,
	0x30,0x59,0x44,0x7a,0x71,0x43,0x45,0x41,0x53,0x67,0x2f,0x53,0x67,0x50,0x2f,0x69,
	0x42,0x47,0x67,0x68,0x41,0x45,0x77,0x50,0x30,0x6f,0x44,0x34,0x4c,0x39,0x41,0x44,
	0x2f,0x39,0x47,0x41,0x39,0x45,0x78,0x45,0x4a,0x47,0x52,0x43,0x43,0x47,0x78,0x50,
	0x30,0x67,0x4c,0x7a,0x79,0x34,0x50,0x44,0x6f,0x34,0x2f,0x6e,0x71,0x34,0x45,0x41,
	0x53,0x51,0x45,0x4a,0x4c,0x45,0x52,0x50,0x30,0x42,0x76,0x51,0x6b,0x43,0x41,0x43,
	0x41,0x41,0x67,0x41,0x41,0x4d,0x69,0x42,0x42,0x73,0x75,0x44,0x6a,0x39,0x4b,0x41,
	0x38,0x51,0x2f,0x51,0x41,0x43,0x41,0x41,0x41,0x45,0x2f,0x53,0x67,0x50,0x42,0x50,
	0x30,0x49,0x44,0x77,0x6a,0x39,0x4b,0x43,0x2f,0x39,0x45,0x41,0x38,0x51,0x2f,0x51,
	0x67,0x50,0x45,0x76,0x30,0x4a,0x41,0x77,0x72,0x39,0x41,0x41,0x2f,0x39,0x41,0x42,
	0x6b,0x43,0x41,0x41,0x7a,0x39,0x43,0x41,0x2f,0x39,0x42,0x41,0x45,0x41,0x67,0x44,
	0x71,0x43,0x4f,0x42,0x41,0x34,0x45,0x45,0x53,0x43,0x45,0x50,0x34,0x34,0x45,0x44,
	0x67,0x41,0x2f,0x6f,0x42,0x45,0x68,0x45,0x51,0x51,0x52,0x50,0x30,0x41,0x44,0x2f,
	0x30,0x52,0x2f,0x77,0x47,0x41,0x69,0x6f,0x53,0x43,0x45,0x49,0x49,0x6f,0x52,0x50,
	0x30,0x68,0x2f,0x77,0x47,0x41,0x6b,0x6f,0x67,0x43,0x2f,0x53,0x41,0x50,0x2f,0x76,
	0x30,0x41,0x44,0x34,0x4c,0x39,0x43,0x41,0x2b,0x71,0x4b,0x42,0x44,0x39,0x45,0x51,
	0x38,0x43,0x67,0x49,0x4b,0x51,0x2f,0x57,0x41,0x50,0x42,0x42,0x43,0x43,0x52,0x4b,
	0x6f,0x51,0x45,0x42,0x44,0x39,0x43,0x43,0x2f,0x34,0x67,0x71,0x41,0x34,0x2f,0x53,
	0x41,0x50,0x2f,0x51,0x41,0x66,0x68,0x49,0x4c,0x38,0x51,0x50,0x30,0x41,0x44,0x79,
	0x67,0x6f,0x43,0x43,0x41,0x6f,0x2f,0x51,0x6b,0x76,0x41,0x6f,0x4b,0x41,0x2f,0x58,
	0x41,0x50,0x67,0x70,0x4a,0x45,0x52,0x41,0x51,0x67,0x52,0x50,0x31,0x6f,0x44,0x30,
	0x51,0x41,0x68,0x45,0x53,0x43,0x51,0x76,0x30,0x41,0x44,0x34,0x4b,0x43,0x41,0x69,
	0x43,0x43,0x43,0x43,0x67,0x41,0x2b,0x44,0x6a,0x38,0x50,0x50,0x30,0x4a,0x58,0x77,
	0x4b,0x43,0x2f,0x6a,0x69,0x43,0x4f,0x50,0x30,0x5a,0x4b,0x41,0x76,0x39,0x75,0x41,
	0x41,0x36,0x67,0x76,0x77,0x34,0x2b,0x50,0x36,0x41,0x4f,0x49,0x49,0x34,0x4d,0x49,
	0x4c,0x2b,0x6b,0x6b,0x49,0x34,0x54,0x49,0x4b,0x43,0x52,0x49,0x53,0x41,0x67,0x45,
	0x53,0x43,0x45,0x45,0x69,0x43,0x67,0x4a,0x4a,0x47,0x52,0x4a,0x36,0x43,0x2f,0x51,
	0x42,0x78,0x67,0x49,0x4b,0x43,0x45,0x49,0x53,0x45,0x67,0x4a,0x4a,0x47,0x67,0x72,
	0x4c,0x39,0x51,0x41,0x2b,0x71,0x53,0x6f,0x4b,0x69,0x2f,0x54,0x41,0x50,0x69,0x50,
	0x30,0x49,0x44,0x2f,0x37,0x39,0x41,0x52,0x38,0x43,0x2f,0x51,0x67,0x50,0x6b,0x50,
	0x30,0x51,0x48,0x34,0x54,0x39,0x41,0x41,0x2b,0x65,0x67,0x68,0x43,0x45,0x6f,0x50,
	0x30,0x51,0x44,0x2f,0x69,0x41,0x67,0x76,0x37,0x2b,0x67,0x50,0x34,0x51,0x42,0x4d,
	0x43,0x41,0x71,0x6c,0x4b,0x43,0x6f,0x6b,0x54,0x39,0x43,0x42,0x2b,0x41,0x2f,0x51,
	0x46,0x50,0x41,0x76,0x30,0x59,0x44,0x2f,0x30,0x41,0x54,0x2f,0x30,0x41,0x44,0x35,
	0x44,0x39,0x41,0x41,0x2b,0x65,0x2f,0x54,0x41,0x50,0x69,0x50,0x30,0x41,0x44,0x34,
	0x4c,0x39,0x45,0x41,0x2f,0x39,0x41,0x56,0x38,0x43,0x69,0x49,0x43,0x71,0x59,0x6f,
	0x4a,0x45,0x4b,0x49,0x54,0x39,0x47,0x4b,0x38,0x45,0x68,0x49,0x44,0x47,0x59,0x6b,
	0x51,0x34,0x45,0x50,0x67,0x34,0x2b,0x50,0x37,0x39,0x41,0x50,0x73,0x65,0x67,0x6f,
	0x43,0x43,0x51,0x6a,0x6a,0x39,0x32,0x50,0x34,0x41,0x2f,0x6a,0x6a,0x2b,0x2f,0x67,
	0x54,0x2b,0x2f,0x68,0x44,0x2b,0x2f,0x67,0x41,0x67,0x41,0x67,0x42,0x41,0x45,0x4d,
	0x49,0x51,0x67,0x41,0x49,0x45,0x41,0x6f,0x49,0x51,0x67,0x67,0x49,0x41,0x49,0x41,
	0x51,0x41,0x49,0x50,0x30,0x34,0x44,0x7a,0x41,0x77,0x43,0x41,0x41,0x51,0x41,0x4b,
	0x4c,0x39,0x4f,0x41,0x38,0x51,0x41,0x41,0x6a,0x39,0x4f,0x41,0x38,0x41,0x41,0x43,
	0x42,0x38,0x42,0x42,0x43,0x69,0x45,0x45,0x41,0x43,0x2f,0x67,0x4b,0x43,0x43,0x50,
	0x30,0x41,0x44,0x30,0x41,0x41,0x41,0x68,0x43,0x53,0x45,0x43,0x41,0x43,0x68,0x50,
	0x30,0x59,0x44,0x79,0x42,0x38,0x42,0x41,0x69,0x53,0x45,0x42,0x44,0x2b,0x68,0x50,
	0x37,0x2b,0x43,0x50,0x37,0x2b,0x2f,0x51,0x67,0x2f,0x42,0x4a,0x49,0x51,0x43,0x41,
	0x4b,0x45,0x67,0x49,0x41,0x45,0x67,0x6f,0x4c,0x39,0x43,0x46,0x39,0x43,0x69,0x68,
	0x41,0x45,0x2f,0x52,0x67,0x50,0x2f,0x51,0x48,0x37,0x41,0x69,0x43,0x43,0x69,0x68,
	0x41,0x43,0x2f,0x51,0x41,0x50,0x41,0x76,0x30,0x41,0x44,0x77,0x49,0x41,0x51,0x49,
	0x4b,0x4b,0x45,0x49,0x4c,0x39,0x41,0x41,0x2b,0x43,0x2f,0x51,0x41,0x50,0x41,0x41,
	0x41,0x41,0x67,0x6f,0x59,0x77,0x2f,0x55,0x67,0x50,0x52,0x50,0x30,0x41,0x79,0x59,
	0x54,0x2b,0x2f,0x51,0x41,0x41,0x2f,0x51,0x67,0x50,0x2f,0x65,0x6e,0x2f,0x41,0x41,
	0x41,0x51,0x41,0x45,0x51,0x51,0x67,0x41,0x41,0x41,0x43,0x43,0x44,0x39,0x47,0x58,
	0x63,0x45,0x45,0x41,0x42,0x45,0x66,0x49,0x35,0x79,0x41,0x42,0x41,0x51,0x2f,0x51,
	0x67,0x50,0x51,0x50,0x30,0x41,0x55,0x35,0x4a,0x4b,0x6a,0x50,0x30,0x49,0x44,0x7a,
	0x41,0x41,0x4d,0x50,0x30,0x49,0x44,0x78,0x4a,0x4f,0x6a,0x41,0x41,0x67,0x43,0x50,
	0x30,0x49,0x44,0x79,0x41,0x41,0x45,0x41,0x44,0x2b,0x45,0x69,0x44,0x39,0x41,0x41,
	0x2f,0x39,0x41,0x43,0x45,0x41,0x2f,0x51,0x41,0x50,0x52,0x42,0x49,0x67,0x6b,0x67,
	0x41,0x67,0x43,0x46,0x54,0x39,0x45,0x5a,0x34,0x44,0x2f,0x51,0x41,0x50,0x45,0x46,
	0x49,0x41,0x49,0x41,0x6a,0x39,0x43,0x59,0x77,0x43,0x2f,0x51,0x67,0x50,0x66,0x42,
	0x41,0x67,0x2f,0x51,0x41,0x76,0x66,0x41,0x42,0x38,0x41,0x50,0x30,0x42,0x55,0x67,
	0x46,0x45,0x6b,0x41,0x67,0x77,0x2f,0x53,0x41,0x66,0x2f,0x52,0x67,0x50,0x53,0x50,
	0x30,0x67,0x50,0x77,0x54,0x39,0x41,0x46,0x2b,0x51,0x35,0x49,0x54,0x39,0x49,0x46,
	0x38,0x45,0x41,0x42,0x42,0x45,0x52,0x4a,0x4b,0x6b,0x68,0x43,0x44,0x39,0x43,0x41,
	0x33,0x39,0x41,0x52,0x49,0x42,0x45,0x47,0x5a,0x45,0x66,0x4f,0x4b,0x45,0x4d,0x50,
	0x31,0x41,0x44,0x78,0x41,0x43,0x65,0x44,0x44,0x39,0x41,0x4d,0x2f,0x39,0x68,0x42,
	0x41,0x41,
} ;

FONTSYSTEM FontSystem ;

// �֐��v���g�^�C�v�錾--------------------------------------------------------

static int FontCacheStringAddToHandle(		FONTMANAGE *ManageData, const wchar_t *String, const wchar_t *IVSString, int StrLen = -1,
											DWORD *DrawStrBuffer = NULL, DWORD *DrawIVSBuffer = NULL, int *DrawCharNumP = NULL ) ;	// �����L���b�V���ɐV����������������

#ifndef DX_NON_GRAPHICS

static int DrawStringHardware(				int xi, int yi, float xf, float yf, int PosIntFlag,                                                                                        const wchar_t *String, size_t StringLength, unsigned int Color, FONTMANAGE *Font, unsigned int EdgeColor, int VerticalFlag ) ;
static int DrawExtendStringHardware(		int xi, int yi, float xf, float yf, int PosIntFlag, double ExRateX, double ExRateY,                                                        const wchar_t *String, size_t StringLength, unsigned int Color, FONTMANAGE *Font, unsigned int EdgeColor, int VerticalFlag ) ;
static int DrawRotaStringHardware(			int xi, int yi, float xf, float yf, int PosIntFlag, double ExRateX, double ExRateY, double RotCenterX, double RotCenterY, double RotAngle, const wchar_t *String, size_t StringLength, unsigned int Color, FONTMANAGE *Font, unsigned int EdgeColor, int VerticalFlag ) ;
static int DrawModiStringHardware(			int x1i, int y1i, int x2i, int y2i, int x3i, int y3i, int x4i, int y4i, float x1f, float y1f, float x2f, float y2f, float x3f, float y3f, float x4f, float y4f, int PosIntFlag, const wchar_t *String, size_t StringLength, unsigned int Color, FONTMANAGE *Font, unsigned int EdgeColor, int VerticalFlag ) ;

static int SetupSoftwareStringImage(		FONTMANAGE *ManageData, const wchar_t *String, size_t StringLength, int Color, int EdgeColor, int VerticalFlag, MEMIMG **UseScreenImg, SIZE *DrawSize, RECT *DrawArea, RECT *DrawAreaBackup, DWORD *DrawBrightBackup ) ;
static int DrawStringSoftware(				int x, int y,                                                                                        const wchar_t *String, size_t StringLength, unsigned int Color, FONTMANAGE *Font, unsigned int EdgeColor, int VerticalFlag ) ;
static int DrawExtendStringSoftware(		int x, int y, double ExRateX, double ExRateY,                                                        const wchar_t *String, size_t StringLength, unsigned int Color, FONTMANAGE *Font, unsigned int EdgeColor, int VerticalFlag ) ;
static int DrawRotaStringSoftware(			int x, int y, double ExRateX, double ExRateY, double RotCenterX, double RotCenterY, double RotAngle, const wchar_t *String, size_t StringLength, unsigned int Color, FONTMANAGE *Font, unsigned int EdgeColor, int VerticalFlag ) ;
static int DrawModiStringSoftware(			int x1, int y1, int x2, int y2, int x3, int y3, int x4, int y4,                                      const wchar_t *String, size_t StringLength, unsigned int Color, FONTMANAGE *Font, unsigned int EdgeColor, int VerticalFlag ) ;

#endif // DX_NON_GRAPHICS

static int EnumFontNameBase(  wchar_t *NameBuffer, int NameBufferNum, int JapanOnlyFlag, int IsEx = FALSE, int CharSet = -1, const wchar_t *EnumFontName = NULL, int IsReturnValid = FALSE ) ;
static int EnumFontNameBaseT( TCHAR   *NameBuffer, int NameBufferNum, int JapanOnlyFlag, int IsEx = FALSE, int CharSet = -1, const TCHAR   *EnumFontName = NULL, int IsReturnValid = FALSE ) ;

// �v���O�����R�[�h------------------------------------------------------------

__inline DWORD WCHAR_T_GetCharCode(	const wchar_t *CharCode, int CharCodeFormat, int *CharBytes )
{
	int UseSrcSize ;
	DWORD DestCode ;

	if( sizeof( wchar_t ) == 2 )
	{
		DWORD SrcCode1 ;
		DWORD SrcCode2 ;

		if( *( ( WORD * )CharCode ) == 0 )
		{
			*CharBytes = 2 ;
			return 0 ;
		}

		if( CharCodeFormat == DX_CHARCODEFORMAT_UTF16LE )
		{
			SrcCode1 = ( ( ( BYTE * )CharCode )[ 0 ] | ( ( ( BYTE * )CharCode )[ 1 ] << 8 ) ) ;
			if( ( SrcCode1 & 0xfc00 ) == 0xd800 )
			{
				UseSrcSize = 4 ;
				SrcCode2 = ( ( BYTE * )CharCode )[ 2 ] | ( ( ( BYTE * )CharCode )[ 3 ] << 8 ) ;
				DestCode = ( ( ( SrcCode1 & 0x3ff ) << 10 ) | ( SrcCode2 & 0x3ff ) ) + 0x10000 ;
			}
			else
			{
				UseSrcSize = 2 ;
				DestCode = SrcCode1 ;
			}
		}
		else
		{
			SrcCode1 = ( ( ( BYTE * )CharCode )[ 0 ] << 8 ) | ( ( BYTE * )CharCode )[ 1 ] ;
			if( ( SrcCode1 & 0xfc00 ) == 0xd800 )
			{
				UseSrcSize = 4 ;
				SrcCode2 = ( ( ( BYTE * )CharCode )[ 2 ] << 8 ) | ( ( BYTE * )CharCode )[ 3 ] ;
				DestCode = ( ( ( SrcCode1 & 0x3ff ) << 10 ) | ( SrcCode2 & 0x3ff ) ) + 0x10000 ;
			}
			else
			{
				UseSrcSize = 2 ;
				DestCode = SrcCode1 ;
			}
		}
	}
	else
	{
		if( *( ( DWORD * )CharCode ) == 0 )
		{
			*CharBytes = 4 ;
			return 0 ;
		}

		UseSrcSize = 4 ;
		if( CharCodeFormat == DX_CHARCODEFORMAT_UTF32LE )
		{
			DestCode = ( ( BYTE * )CharCode )[ 0 ] | ( ( ( BYTE * )CharCode )[ 1 ] << 8 ) | ( ( ( BYTE * )CharCode )[ 2 ] << 16 ) | ( ( ( BYTE * )CharCode )[ 3 ] << 24 ) ;
		}
		else
		{
			DestCode = ( ( ( BYTE * )CharCode )[ 0 ] << 24 ) | ( ( ( BYTE * )CharCode )[ 1 ] << 16 ) | ( ( ( BYTE * )CharCode )[ 2 ] << 8 ) | ( ( BYTE * )CharCode )[ 3 ] ;
		}
	}

	*CharBytes = UseSrcSize ;

	return DestCode ;
}

// �t�H���g�Ǘ��f�[�^�̎擾
__inline FONTMANAGE * GetFontManageDataToHandle_Inline( int FontHandle )
{
	FONTMANAGE * ManageData ;

	DEFAULT_FONT_HANDLE_SETUP

	if( FONTHCHK( FontHandle, ManageData ) )
		return NULL ;

	// �I��
	return ManageData ;
}
extern FONTMANAGE * GetFontManageDataToHandle( int FontHandle )
{
	return GetFontManageDataToHandle_Inline( FontHandle ) ;
}

#ifndef DX_NON_GRAPHICS

#if defined(DX_PLATFORM_DESKTOP_SDL2)
// Desktop (SDL2/GL) 専用フック: FontCache を介さず SDL_ttf で直接描画する。
// DxFontDesktop.cpp 側で実装。戻り値 >= 0 ならそこで処理完了。
extern int Desktop_DrawString_Hook(
    int xi, int yi, float xf, float yf, int PosIntFlag,
    double ExRateX, double ExRateY,
    int RotCenterEnable, float RotCenterX, float RotCenterY, double RotAngle,
    const wchar_t *String, size_t StringLength,
    unsigned int Color, FONTMANAGE *Font,
    unsigned int EdgeColor, int VerticalFlag ) ;
#endif

static int DrawStringHardware( int xi, int yi, float xf, float yf, int PosIntFlag, const wchar_t *String, size_t StringLength, unsigned int Color, FONTMANAGE *Font, unsigned int EdgeColor, int VerticalFlag )
{
#if defined(DX_PLATFORM_DESKTOP_SDL2)
	{
		int r = Desktop_DrawString_Hook( xi, yi, xf, yf, PosIntFlag,
			1.0, 1.0, FALSE, 0.0f, 0.0f, 0.0,
			String, StringLength, Color, Font, EdgeColor, VerticalFlag ) ;
		if( r >= 0 ) return r ;
	}
#endif
	// �t�H���g�Ƀe�N�X�`���L���b�V�����g�p����Ă���ꍇ
	if( Font->TextureCacheFlag )
	{
		if( Font->TextureCacheLostFlag == TRUE )
		{
			RefreshFontDrawResourceToHandle( Font ) ;
		}
		FontCacheStringDrawToHandleST(
			TRUE,
			xi,
			yi,
			xf,
			yf,
			PosIntFlag, 
			FALSE,
			1.0,
			1.0,
			FALSE, 0.0f, 0.0f, 0.0,
			String,
			Color,
			NULL,
			&GSYS.DrawSetting.DrawArea,
			TRUE,
			Font,
			EdgeColor,
			( int )StringLength,
			VerticalFlag,
			NULL,
			NULL,
			NULL,
			0,
			NULL, 0,
			FSYS.OnlyDrawType
		) ;
		return 0 ;
	}
	else
	{
	}

	// �I��
	return 0 ;
}

static int DrawExtendStringHardware( int xi, int yi, float xf, float yf, int PosIntFlag, double ExRateX, double ExRateY, const wchar_t *String, size_t StringLength, unsigned int Color, FONTMANAGE *Font, unsigned int EdgeColor, int VerticalFlag )
{
#if defined(DX_PLATFORM_DESKTOP_SDL2)
	{
		int r = Desktop_DrawString_Hook( xi, yi, xf, yf, PosIntFlag,
			ExRateX, ExRateY, FALSE, 0.0f, 0.0f, 0.0,
			String, StringLength, Color, Font, EdgeColor, VerticalFlag ) ;
		if( r >= 0 ) return r ;
	}
#endif
	// �t�H���g�Ƀe�N�X�`���L���b�V�����g�p����Ă���ꍇ
	if( Font->TextureCacheFlag )
	{
		// �`��悪�R�c�f�o�C�X�ɂ��`�悪�o���Ȃ��ꍇ�̓G���[
		RefreshFontDrawResourceToHandle( Font ) ;
		FontCacheStringDrawToHandleST(
			TRUE,
			xi,
			yi,
			xf,
			yf,
			PosIntFlag,
			TRUE,
			ExRateX,
			ExRateY,
			FALSE, 0.0f, 0.0f, 0.0,
			String,
			Color,
			NULL,
			&GSYS.DrawSetting.DrawArea,
			TRUE,
			Font,
			EdgeColor,
			( int )StringLength,
			VerticalFlag,
			NULL,
			NULL,
			NULL,
			0,
			NULL, 0,
			FSYS.OnlyDrawType
		) ;
		return 0 ;
	}
	else
	{
	}

	// �I��
	return 0 ;
}

static int DrawRotaStringHardware( int xi, int yi, float xf, float yf, int PosIntFlag, double ExRateX, double ExRateY, double RotCenterX, double RotCenterY, double RotAngle, const wchar_t *String, size_t StringLength, unsigned int Color, FONTMANAGE *Font, unsigned int EdgeColor, int VerticalFlag )
{
#if defined(DX_PLATFORM_DESKTOP_SDL2)
	{
		int r = Desktop_DrawString_Hook( xi, yi, xf, yf, PosIntFlag,
			ExRateX, ExRateY, TRUE, ( float )RotCenterX, ( float )RotCenterY, RotAngle,
			String, StringLength, Color, Font, EdgeColor, VerticalFlag ) ;
		if( r >= 0 ) return r ;
	}
#endif
	// �t�H���g�Ƀe�N�X�`���L���b�V�����g�p����Ă���ꍇ
	if( Font->TextureCacheFlag )
	{
		// �`��悪�R�c�f�o�C�X�ɂ��`�悪�o���Ȃ��ꍇ�̓G���[
		RefreshFontDrawResourceToHandle( Font ) ;
		FontCacheStringDrawToHandleST(
			TRUE,
			xi,
			yi,
			xf,
			yf,
			PosIntFlag,
			TRUE,
			ExRateX,
			ExRateY,
			TRUE,
			( float )RotCenterX,
			( float )RotCenterY,
			RotAngle,
			String,
			Color,
			NULL,
			&GSYS.DrawSetting.DrawArea,
			TRUE,
			Font,
			EdgeColor,
			( int )StringLength,
			VerticalFlag,
			NULL,
			NULL,
			NULL,
			0,
			NULL, 0,
			FSYS.OnlyDrawType
		) ;
		return 0 ;
	}
	else
	{
	}

	// �I��
	return 0 ;
}

static int DrawModiStringHardware( int x1i, int y1i, int x2i, int y2i, int x3i, int y3i, int x4i, int y4i, float x1f, float y1f, float x2f, float y2f, float x3f, float y3f, float x4f, float y4f, int PosIntFlag, const wchar_t *String, size_t StringLength, unsigned int Color, FONTMANAGE *Font, unsigned int EdgeColor, int VerticalFlag )
{
	// �t�H���g�Ƀe�N�X�`���L���b�V�����g�p����Ă���ꍇ
	if( Font->TextureCacheFlag )
	{
		int i ;
		int DrawWidth = 0 ;
		int DrawHeight = 0 ;
//		int Result ;
		int *UseTempScreenHandle ;
		int TempScreenHeight = 0 ;
		int TempScreenWidth = 0 ;
		int DrawTempScreenHandle[ 2 ] = { -1, -1 } ;
		SCREENDRAWSETTINGINFO ScreenDrawSettingInfo ;
		int StrLen ;
		int CInfoNum = 0 ;
		DRAWCHARINFO CInfoBase[ 256 ] ;
		DRAWCHARINFO *TempCInfo = NULL ;
		DRAWCHARINFO *UseCInfo ;

		// �`��悪�R�c�f�o�C�X�ɂ��`�悪�o���Ȃ��ꍇ�̓G���[
		RefreshFontDrawResourceToHandle( Font ) ;

		if( StringLength > 0 )
		{
			StrLen = ( int )StringLength ;
		}
		else
		{
			StrLen = ( int )_WCSLEN( String ) ;
		}

		FontCacheStringDrawToHandleST(
			FALSE,
			0,
			0,
			0.0f,
			0.0f,
			TRUE,
			FALSE,
			1.0,
			1.0,
			FALSE, 0.0f, 0.0f, 0.0,
			String,
			0,
			NULL,
			NULL,
			FALSE,
			Font,
			0,
			StrLen,
			VerticalFlag,
			NULL,
			NULL,
			NULL,
			0,
			&CInfoNum, 1,
			0
		) ;

		if( CInfoNum > 256 )
		{
			TempCInfo = ( DRAWCHARINFO * )DXALLOC( sizeof( DRAWCHARINFO ) * CInfoNum ) ;
			if( TempCInfo == NULL )
			{
				return -1 ;
			}
			UseCInfo = TempCInfo ;
		}
		else
		{
			UseCInfo = CInfoBase ;
		}

		FontCacheStringDrawToHandleST(
			FALSE,
			0,
			0,
			0.0f,
			0.0f,
			TRUE,
			FALSE,
			1.0,
			1.0,
			FALSE, 0.0f, 0.0f, 0.0,
			String,
			0,
			NULL,
			NULL,
			FALSE,
			Font,
			0,
			StrLen,
			VerticalFlag,
			NULL,
			NULL,
			UseCInfo,
			CInfoNum,
			&CInfoNum, 1,
			0
		) ;

		for( i = 0 ; i < CInfoNum ; i ++ )
		{
			if( DrawWidth  < _FTOL( UseCInfo[ i ].DrawX + UseCInfo[ i ].SizeX ) ) DrawWidth  = _FTOL( UseCInfo[ i ].DrawX + UseCInfo[ i ].SizeX ) ;
			if( DrawHeight < _FTOL( UseCInfo[ i ].DrawY + UseCInfo[ i ].SizeY ) ) DrawHeight = _FTOL( UseCInfo[ i ].DrawY + UseCInfo[ i ].SizeY ) ;
		}

		if( TempCInfo != NULL )
		{
			DxFree( TempCInfo ) ;
			TempCInfo = NULL ;
		}

		if( VerticalFlag )
		{
//			DrawWidth  = Font->BaseInfo.FontSize + Font->EdgeSize * 2 ;
//			DrawHeight = GetDrawStringWidthToHandle_WCHAR_T( String, StringLength, ( int )StringLength, Font->HandleInfo.Handle, VerticalFlag ) ;
//			Result     = DrawHeight ;
			UseTempScreenHandle = Font->ModiDrawScreenV ;
		}
		else
		{
//			DrawWidth  = GetDrawStringWidthToHandle_WCHAR_T( String, StringLength, ( int )StringLength, Font->HandleInfo.Handle, VerticalFlag ) ;
//			DrawHeight = Font->BaseInfo.FontSize + Font->EdgeSize * 2 ;
//			Result     = DrawWidth ;
			UseTempScreenHandle = Font->ModiDrawScreen ;
		}

		if( DrawWidth <= 0 || DrawHeight <= 0 )
		{
			return -1 ;
		}

		if( NS_GetGraphSize( UseTempScreenHandle[ 0 ], &TempScreenWidth, &TempScreenHeight ) < 0 ||
			DrawWidth > TempScreenWidth || DrawHeight > TempScreenHeight )
		{
			SETUP_GRAPHHANDLE_GPARAM GParam ;

			if( UseTempScreenHandle[ 0 ] >= 0 )
			{
				SubHandle( UseTempScreenHandle[ 0 ], FALSE, FALSE ) ;
				SubHandle( UseTempScreenHandle[ 1 ], FALSE, FALSE ) ;
				UseTempScreenHandle[ 0 ] = -1 ;
				UseTempScreenHandle[ 1 ] = -1 ;
			}

			if( TempScreenWidth < DrawWidth )
			{
				TempScreenWidth = DrawWidth ;
			}

			if( TempScreenHeight < DrawHeight )
			{
				TempScreenHeight = DrawHeight ;
			}

			Graphics_Image_InitSetupGraphHandleGParam_Normal_DrawValid_NoneZBuffer( &GParam, 32, TRUE ) ;
			UseTempScreenHandle[ 0 ] = Graphics_Image_MakeGraph_UseGParam( &GParam, TempScreenWidth, TempScreenHeight, FALSE, FALSE, 0, FALSE, FALSE ) ;
			if( UseTempScreenHandle[ 0 ] < 0 )
			{
				return -1 ;
			}
			UseTempScreenHandle[ 1 ] = Graphics_Image_MakeGraph_UseGParam( &GParam, DrawWidth, DrawHeight, FALSE, FALSE, 0, FALSE, FALSE ) ;
			if( UseTempScreenHandle[ 1 ] < 0 )
			{
				SubHandle( UseTempScreenHandle[ 0 ], FALSE, FALSE ) ;
				UseTempScreenHandle[ 0 ] = -1 ;
				return -1 ;
			}
			NS_SetDeleteHandleFlag( UseTempScreenHandle[ 0 ], &UseTempScreenHandle[ 0 ] ) ;
			NS_SetDeleteHandleFlag( UseTempScreenHandle[ 1 ], &UseTempScreenHandle[ 1 ] ) ;
			NS_SetDeviceLostDeleteGraphFlag( UseTempScreenHandle[ 0 ], TRUE ) ;
			NS_SetDeviceLostDeleteGraphFlag( UseTempScreenHandle[ 1 ], TRUE ) ;
		}

		// �e��`��ݒ�����擾
		Graphics_DrawSetting_GetScreenDrawSettingInfo( &ScreenDrawSettingInfo ) ;

		if( Font->TextureCacheUsePremulAlpha )
		{
			NS_SetDrawScreen( UseTempScreenHandle[ 0 ] ) ;
			NS_SetBackgroundColor( 0, 0, 0, 0 ) ;
			NS_ClearDrawScreen( NULL ) ;

			NS_SetDrawBlendMode( DX_BLENDMODE_PMA_ALPHA, 255 ) ;
			DrawStringToHandle_WCHAR_T( 0, 0, String, StringLength, Color, Font->HandleInfo.Handle, EdgeColor, VerticalFlag ) ;

			NS_SetDrawScreen( ScreenDrawSettingInfo.DrawScreen ) ;

			DrawTempScreenHandle[ 0 ] = NS_DerivationGraph( 0, 0, DrawWidth, DrawHeight, UseTempScreenHandle[ 0 ] ) ;
		}
		else
		{
			if( FSYS.OnlyDrawType == 0 || FSYS.OnlyDrawType == 2 )
			{
				NS_SetDrawScreen( UseTempScreenHandle[ 0 ] ) ;
				NS_SetBackgroundColor( 0, 0, 0, 0 ) ;
				NS_ClearDrawScreen( NULL ) ;
				NS_SetDrawBlendMode( DX_BLENDMODE_SRCCOLOR, 255 ) ;
				FontCacheStringDrawToHandleST(
					TRUE,
					0,
					0,
					0.0f,
					0.0f,
					TRUE, 
					FALSE,
					1.0,
					1.0,
					FALSE, 0.0f, 0.0f, 0.0,
					String,
					Color,
					NULL,
					&GSYS.DrawSetting.DrawArea,
					TRUE,
					Font,
					EdgeColor,
					( int )StringLength,
					VerticalFlag,
					NULL,
					NULL,
					NULL,
					0,
					NULL, 0,
					2
				) ;
			}

			if( FSYS.OnlyDrawType == 0 || FSYS.OnlyDrawType == 1 )
			{
				NS_SetDrawScreen( UseTempScreenHandle[ 1 ] ) ;
				NS_SetBackgroundColor( 0, 0, 0, 0 ) ;
				NS_ClearDrawScreen( NULL ) ;
				NS_SetDrawBlendMode( DX_BLENDMODE_SRCCOLOR, 255 ) ;
				FontCacheStringDrawToHandleST(
					TRUE,
					0,
					0,
					0.0f,
					0.0f,
					TRUE, 
					FALSE,
					1.0,
					1.0,
					FALSE, 0.0f, 0.0f, 0.0,
					String,
					Color,
					NULL,
					&GSYS.DrawSetting.DrawArea,
					TRUE,
					Font,
					EdgeColor,
					( int )StringLength,
					VerticalFlag,
					NULL,
					NULL,
					NULL,
					0,
					NULL, 0,
					1
				) ;
			}

			NS_SetDrawScreen( ScreenDrawSettingInfo.DrawScreen ) ;

			if( FSYS.OnlyDrawType == 0 || FSYS.OnlyDrawType == 2 )
			{
				DrawTempScreenHandle[ 0 ] = NS_DerivationGraph( 0, 0, DrawWidth, DrawHeight, UseTempScreenHandle[ 0 ] ) ;
			}
			if( FSYS.OnlyDrawType == 0 || FSYS.OnlyDrawType == 1 )
			{
				DrawTempScreenHandle[ 1 ] = NS_DerivationGraph( 0, 0, DrawWidth, DrawHeight, UseTempScreenHandle[ 1 ] ) ;
			}
		}

		// �`���`�����ɖ߂�
		NS_SetDrawArea( ScreenDrawSettingInfo.DrawRect.left, ScreenDrawSettingInfo.DrawRect.top, ScreenDrawSettingInfo.DrawRect.right, ScreenDrawSettingInfo.DrawRect.bottom ) ;

//		if( DrawTempScreenHandle[ 0 ] < 0 )
//		{
////			Result = -1 ;
//		}
//		else
		{
			NS_SetDrawBlendMode( ScreenDrawSettingInfo.DrawBlendMode, ScreenDrawSettingInfo.DrawBlendParam ) ;
			if( PosIntFlag )
			{
				if( DrawTempScreenHandle[ 0 ] >= 0 && ( FSYS.OnlyDrawType == 0 || FSYS.OnlyDrawType == 2 ) )
				{
					NS_DrawModiGraph(  x1i, y1i, x2i, y2i, x3i, y3i, x4i, y4i, DrawTempScreenHandle[ 0 ], TRUE ) ;
					SubHandle( DrawTempScreenHandle[ 0 ], FALSE, FALSE ) ;
					DrawTempScreenHandle[ 0 ] = -1 ;
				}

				if( DrawTempScreenHandle[ 1 ] >= 0 && ( FSYS.OnlyDrawType == 0 || FSYS.OnlyDrawType == 1 ) )
				{
					NS_DrawModiGraph(  x1i, y1i, x2i, y2i, x3i, y3i, x4i, y4i, DrawTempScreenHandle[ 1 ], TRUE ) ;
					SubHandle( DrawTempScreenHandle[ 1 ], FALSE, FALSE ) ;
					DrawTempScreenHandle[ 1 ] = -1 ;
				}
			}
			else
			{
				if( DrawTempScreenHandle[ 0 ] > 0 && ( FSYS.OnlyDrawType == 0 || FSYS.OnlyDrawType == 2 ) )
				{
					NS_DrawModiGraphF( x1f, y1f, x2f, y2f, x3f, y3f, x4f, y4f, DrawTempScreenHandle[ 0 ], TRUE ) ;
					SubHandle( DrawTempScreenHandle[ 0 ], FALSE, FALSE ) ;
					DrawTempScreenHandle[ 0 ] = -1 ;
				}

				if( DrawTempScreenHandle[ 1 ] > 0 && ( FSYS.OnlyDrawType == 0 || FSYS.OnlyDrawType == 1 ) )
				{
					NS_DrawModiGraphF( x1f, y1f, x2f, y2f, x3f, y3f, x4f, y4f, DrawTempScreenHandle[ 1 ], TRUE ) ;
					SubHandle( DrawTempScreenHandle[ 1 ], FALSE, FALSE ) ;
					DrawTempScreenHandle[ 1 ] = -1 ;
				}
			}
		}

		// �`��ݒ�������ɖ߂�
		Graphics_DrawSetting_SetScreenDrawSettingInfo( &ScreenDrawSettingInfo ) ;

		return 0 ;
	}
	else
	{
	}

	// �I��
	return 0 ;
}

static int SetupSoftwareStringImage(
	FONTMANAGE *ManageData,
	const wchar_t *String,
	size_t StringLength,
	int Color,
	int EdgeColor,
	int VerticalFlag,
	MEMIMG **UseScreenImg,
	SIZE *DrawSize,
	RECT *DrawArea,
	RECT *DrawAreaBackup,
	DWORD *DrawBrightBackup
)
{
	RECT ClipRect ;

	// �`��̈�𓾂�
	FontCacheStringDrawToHandleST(
		FALSE,
		0,
		0,
		0.0f,
		0.0f,
		TRUE,
		FALSE,
		1.0,
		1.0,
		FALSE, 0.0f, 0.0f, 0.0,
		String,
		0,
		NULL,
		NULL,
		FALSE,
		ManageData,
		0,
		( int )StringLength,
		VerticalFlag,
		DrawSize,
		NULL,
		NULL,
		0,
		NULL, 0,
		FSYS.OnlyDrawType
	) ;

	// �g�p���鉼�X�N���[���̌���
	*UseScreenImg = ( ManageData->FontType & DX_FONTTYPE_ANTIALIASING ) ? &GSYS.SoftRender.FontScreenMemImgAlpha : &GSYS.SoftRender.FontScreenMemImgNormal ;

	// ���̕`���`�ƕ`��P�x��ۑ�
	*DrawAreaBackup   = GSYS.DrawSetting.DrawArea ;
	*DrawBrightBackup = GSYS.DrawSetting.bDrawBright ;

	// ���o�b�t�@�͉�ʃT�C�Y�������Ȃ��̂ŁA�����ŃN���b�v�����悤�ɂ���
	{
		ClipRect.top    = 0 ;
		ClipRect.left   = 0 ;
		ClipRect.right  = GSYS.Screen.MainScreenSizeX ;
		ClipRect.bottom = GSYS.Screen.MainScreenSizeY ;

		DrawArea->left   = 0 ; 
		DrawArea->right  = DrawSize->cx ; 
		DrawArea->top    = 0 ; 
		DrawArea->bottom = DrawSize->cy ;
		RectClipping_Inline( DrawArea, &ClipRect ) ;

		GSYS.DrawSetting.DrawArea = *DrawArea ;
		SetMemImgDrawArea( DrawArea ) ;
	}

	// �`��o�b�t�@�𓧉ߐF�œh��Ԃ�
	{
		RECT ClearRect ;

		// ���ߐF�̒���
		if( ManageData->FontType & DX_FONTTYPE_ANTIALIASING )
		{
			( *UseScreenImg )->Base->TransColor = 0 ;
		}
		else
		{
			while(  Color     == ( int )( *UseScreenImg )->Base->TransColor ||
					EdgeColor == ( int )( *UseScreenImg )->Base->TransColor )
			{
				( *UseScreenImg )->Base->TransColor ++ ;
			}
		}

		ClearRect = *DrawArea ;
		ClearRect.right  += 4 ;
		ClearRect.bottom += 4 ;
		RectClipping_Inline( &ClearRect, &ClipRect ) ;
		ClearMemImg( *UseScreenImg, &ClearRect, ( *UseScreenImg )->Base->TransColor ) ;
	}

	// �ꎞ�o�b�t�@�ɕ`��
	FontCacheStringDrawToHandleST(
		TRUE,
		VerticalFlag ? DrawSize->cx - ManageData->BaseInfo.FontHeight : 0,
		0,
		0.0f,
		0.0f,
		TRUE,
		FALSE,
		1.0,
		1.0,
		FALSE, 0.0f, 0.0f, 0.0,
		String,
		Color,
		*UseScreenImg,
		DrawArea,
		TRUE,
		ManageData,
		EdgeColor,
		( int )StringLength,
		VerticalFlag,
		NULL,
		NULL,
		NULL,
		0,
		NULL, 0,
		FSYS.OnlyDrawType
	) ;

	// �`��F�𔒂ɕύX
	GSYS.DrawSetting.bDrawBright = 0xffffff ;

	// �I��
	return 0 ;
}

static int DrawStringSoftware( int x, int y, const wchar_t *String, size_t StringLength, unsigned int Color, FONTMANAGE *ManageData, unsigned int EdgeColor, int VerticalFlag )
{
#if defined(DX_PLATFORM_DESKTOP_SDL2)
	{
		int r = Desktop_DrawString_Hook( x, y, ( float )x, ( float )y, TRUE,
			1.0, 1.0, FALSE, 0.0f, 0.0f, 0.0,
			String, StringLength, Color, ManageData, EdgeColor, VerticalFlag ) ;
		if( r >= 0 ) return r ;
	}
#endif
	SIZE DrawSize ;
//	FONTMANAGE * ManageData ;
	RECT DrawArea, ClipRect, BRect, Rect ;
	DWORD bright ;
	MEMIMG *ScreenImg ;

//	ManageData = GetFontManageDataToHandle_Inline( FontHandle ) ;

	// �`��̈�𓾂�
	FontCacheStringDrawToHandleST(
		FALSE,
		0,
		0,
		0.0f,
		0.0f,
		TRUE,
		FALSE,
		1.0,
		1.0,
		FALSE, 0.0f, 0.0f, 0.0,
		String,
		0,
		NULL,
		NULL,
		FALSE,
		ManageData,
		0,
		( int )StringLength,
		VerticalFlag,
		&DrawSize,
		NULL,
		NULL,
		0,
		NULL, 0,
		FSYS.OnlyDrawType
	) ;

	// �u�����h���[�h�ɂ���ď����𕪊�
	if( GSYS.DrawSetting.BlendMode != DX_BLENDMODE_NOBLEND || ( ManageData->FontType & DX_FONTTYPE_ANTIALIASING ) )
	{
		// �A���`�G�C���A�X�ł��Ȃ��A���t�@�u�����h�Ŋ��A���t�@�l���ő�̂Ƃ��͒ʏ�`��
		if( ( ManageData->FontType & DX_FONTTYPE_ANTIALIASING ) == 0 &&
			GSYS.DrawSetting.BlendMode == DX_BLENDMODE_ALPHA && GSYS.DrawSetting.BlendParam == 255 ) goto NORMALDRAW ;

		// �g�p���鉼�X�N���[���̌���
		ScreenImg = ( ManageData->FontType & DX_FONTTYPE_ANTIALIASING ) ? &GSYS.SoftRender.FontScreenMemImgAlpha : &GSYS.SoftRender.FontScreenMemImgNormal ;

		// ���̕`���`�ƕ`��P�x��ۑ�
		BRect  = GSYS.DrawSetting.DrawArea ;
		bright = GSYS.DrawSetting.bDrawBright ;

		// ���o�b�t�@�͉�ʃT�C�Y�������Ȃ��̂ŁA�����ŃN���b�v�����悤�ɂ���
		{
			ClipRect.top    = 0 ;
			ClipRect.left   = 0 ;
			ClipRect.right  = GSYS.Screen.MainScreenSizeX ;
			ClipRect.bottom = GSYS.Screen.MainScreenSizeY ;

			DrawArea.left   = 0 ; 
			DrawArea.right  = DrawSize.cx ; 
			DrawArea.top    = 0 ; 
			DrawArea.bottom = DrawSize.cy ;

			// �C�^���b�N�t�H���g�̏ꍇ�͏������𑝂₷
			if( ManageData->BaseInfo.Italic )
			{
				DrawArea.right += ManageData->BaseInfo.MaxWidth / 2 ;
			}
			RectClipping_Inline( &DrawArea, &ClipRect ) ;

			GSYS.DrawSetting.DrawArea  = DrawArea ;
			SetMemImgDrawArea( &DrawArea ) ;
		}

		// �`��o�b�t�@�𓧉ߐF�œh��Ԃ�
		{
			// ���ߐF�̒���
			if( ManageData->FontType & DX_FONTTYPE_ANTIALIASING )
			{
				ScreenImg->Base->TransColor = 0 ;
			}
			else
			{
				while(  Color     == ScreenImg->Base->TransColor ||
						EdgeColor == ScreenImg->Base->TransColor )
				{
					ScreenImg->Base->TransColor ++ ;
				}
			}

			ClearMemImg( ScreenImg, &DrawArea, ScreenImg->Base->TransColor ) ;
		}

		// �A���`�G�C���A�X���g�p����ꍇ

		// �ꎞ�o�b�t�@�ɕ`��
		FontCacheStringDrawToHandleST(
			TRUE,
			0,
			0,
			0.0f,
			0.0f,
			TRUE,
			FALSE,
			1.0,
			1.0,
			FALSE, 0.0f, 0.0f, 0.0,
			String,
			Color,
			ScreenImg,
			&DrawArea,
			TRUE,
			ManageData,
			EdgeColor,
			( int )StringLength,
			VerticalFlag,
			NULL,
			NULL,
			NULL,
			0,
			NULL, 0,
			FSYS.OnlyDrawType
		) ;

		// �{�`���ɕ`��
		{
			GSYS.DrawSetting.bDrawBright = 0xffffff ;
			Rect.left   = x ;
			Rect.top    = y ;
			Rect.right  = x + DrawArea.right ;
			Rect.bottom = y + DrawArea.bottom ;
			RectClipping_Inline( &Rect, &BRect ) ;
			GSYS.DrawSetting.DrawArea = Rect ;
			SetMemImgDrawArea( &Rect ) ;

			DrawMemImg( GSYS.SoftRender.TargetMemImg, ScreenImg, x, y, TRUE, GSYS.SoftRender.BlendMemImg ) ;
		}

		// �p�����[�^�����ɖ߂�
		GSYS.DrawSetting.DrawArea    = BRect ;
		SetMemImgDrawArea( &BRect ) ;
		GSYS.DrawSetting.bDrawBright = bright ;

		// �I��
		return 0 ;
	}

NORMALDRAW:

	FontCacheStringDrawToHandleST(
		TRUE,
		x,
		y,
		( float )x, 
		( float )y,
		TRUE,
		FALSE,
		1.0,
		1.0,
		FALSE, 0.0f, 0.0f, 0.0,
		String,
		Color,
		GSYS.SoftRender.TargetMemImg,
		&GSYS.DrawSetting.DrawArea,
		TRUE,
		ManageData,
		EdgeColor,
		( int )StringLength,
		VerticalFlag,
		NULL,
		NULL,
		NULL,
		0,
		NULL, 0,
		FSYS.OnlyDrawType
	) ;

	// �I��
	return 0 ;
}

static int DrawExtendStringSoftware( int x, int y, double ExRateX, double ExRateY, const wchar_t *String, size_t StringLength, unsigned int Color, FONTMANAGE *ManageData, unsigned int EdgeColor, int VerticalFlag )
{
	SIZE DrawSize ;
	RECT DrawArea, DrawAreaBackup, Rect, DrawRect ;
	DWORD DrawBrightBackup ;
	MEMIMG *ScreenImg ;

	// �ꎞ�o�b�t�@�ւ̕�����̕`��
	SetupSoftwareStringImage( ManageData, String, StringLength, Color, EdgeColor, VerticalFlag, &ScreenImg, &DrawSize, &DrawArea, &DrawAreaBackup, &DrawBrightBackup ) ;

	// �{�`���ɕ`��
	if( VerticalFlag )
	{
		Rect.left   = _DTOL( x - ( DrawSize.cx - ManageData->BaseInfo.FontHeight ) * ExRateX ) ;
		Rect.top    = y ;
		Rect.right  = Rect.left + _DTOL( DrawArea.right  * ExRateX ) + 3 ;
		Rect.bottom = y         + _DTOL( DrawArea.bottom * ExRateY ) + 3 ;
		RectClipping_Inline( &Rect, &DrawAreaBackup ) ;
		GSYS.DrawSetting.DrawArea = Rect ;
		SetMemImgDrawArea( &Rect ) ;

		DrawRect.left   = _DTOL( x - ( DrawSize.cx - ManageData->BaseInfo.FontHeight ) * ExRateX ) ;
		DrawRect.top    = y ;
		DrawRect.right  = DrawRect.left + _DTOL( GSYS.Screen.MainScreenSizeX * ExRateX ) + 3 ;
		DrawRect.bottom = y             + _DTOL( GSYS.Screen.MainScreenSizeY * ExRateY ) + 3 ;

		DrawEnlargeMemImg( GSYS.SoftRender.TargetMemImg, ScreenImg, &DrawRect, TRUE, GSYS.SoftRender.BlendMemImg ) ;
	}
	else
	{
		Rect.left   = x ;
		Rect.top    = y ;
		Rect.right  = x + _DTOL( DrawArea.right  * ExRateX ) + 3 ;
		Rect.bottom = y + _DTOL( DrawArea.bottom * ExRateY ) + 3 ;
		RectClipping_Inline( &Rect, &DrawAreaBackup ) ;
		GSYS.DrawSetting.DrawArea = Rect ;
		SetMemImgDrawArea( &Rect ) ;

		DrawRect.left   = x ;
		DrawRect.top    = y ;
		DrawRect.right  = x + _DTOL( GSYS.Screen.MainScreenSizeX * ExRateX ) + 3 ;
		DrawRect.bottom = y + _DTOL( GSYS.Screen.MainScreenSizeY * ExRateY ) + 3 ;

		DrawEnlargeMemImg( GSYS.SoftRender.TargetMemImg, ScreenImg, &DrawRect, TRUE, GSYS.SoftRender.BlendMemImg ) ;
	}

	// �p�����[�^�����ɖ߂�
	GSYS.DrawSetting.DrawArea = DrawAreaBackup ;
	SetMemImgDrawArea( &DrawAreaBackup ) ;
	GSYS.DrawSetting.bDrawBright = DrawBrightBackup ;

	// �I��
	return 0 ;
}

static int DrawRotaStringSoftware( int x, int y, double ExRateX, double ExRateY, double RotCenterX, double RotCenterY, double RotAngle, const wchar_t *String, size_t StringLength, unsigned int Color, FONTMANAGE *ManageData, unsigned int EdgeColor, int VerticalFlag )
{
	SIZE DrawSize ;
	RECT DrawArea, DrawAreaBackup, DrawRect ;
	DWORD DrawBrightBackup ;
	MEMIMG *ScreenImg ;
	MEMIMG TempImg ;

	// �ꎞ�o�b�t�@�ւ̕�����̕`��
	SetupSoftwareStringImage( ManageData, String, StringLength, Color, EdgeColor, VerticalFlag, &ScreenImg, &DrawSize, &DrawArea, &DrawAreaBackup, &DrawBrightBackup ) ;

	// �������`�悵���̈悾���̃C���[�W���쐬
	DerivationMemImg( &TempImg, ScreenImg, 0, 0, DrawArea.right, DrawArea.bottom ) ;

	// �`��̈�����ɖ߂�
	GSYS.DrawSetting.DrawArea = DrawAreaBackup ;
	SetMemImgDrawArea( &DrawAreaBackup ) ;

	// �{�`���ɕ`��
	{
		if( RotAngle == 0.0 )
		{
			if( ExRateX == 1.0 && ExRateY == 1.0 )
			{
				DrawMemImg( GSYS.SoftRender.TargetMemImg, &TempImg, _DTOL( x - RotCenterX ), _DTOL( y - RotCenterY ), TRUE, GSYS.SoftRender.BlendMemImg ) ;
			}
			else
			{
				DrawRect.left   = _DTOL( x             - ( RotCenterX  * ExRateX ) ) ;
				DrawRect.top    = _DTOL( y             - ( RotCenterY  * ExRateY ) ) ;
				DrawRect.right  = _DTOL( DrawRect.left + ( DrawSize.cx * ExRateX ) ) ;
				DrawRect.bottom = _DTOL( DrawRect.top  + ( DrawSize.cy * ExRateY ) ) ;
				DrawEnlargeMemImg( GSYS.SoftRender.TargetMemImg, &TempImg, &DrawRect, TRUE, GSYS.SoftRender.BlendMemImg ) ;
			}
		}
		else
		{
			float dcx, dcy ;
			float Sin, Cos ;
			float bcx, bcy ;

			bcx = ( float )( ( -RotCenterX + DrawSize.cx * 0.5f ) * ExRateX ) ;
			bcy = ( float )( ( -RotCenterY + DrawSize.cy * 0.5f ) * ExRateY ) ;

			_SINCOS_PLATFORM( ( float )RotAngle, &Sin, &Cos ) ;
			dcx = bcx * Cos - bcy * Sin ;
			dcy = bcx * Sin + bcy * Cos ;

			DrawRotationMemImg( GSYS.SoftRender.TargetMemImg, &TempImg,
				_FTOL( x + dcx ), _FTOL( y + dcy ),
				( float )RotAngle, ( float )ExRateX, ( float )ExRateY,
				TRUE, FALSE, FALSE, GSYS.SoftRender.BlendMemImg ) ;
		}
	}

	// �`��P�x�����ɖ߂�
	GSYS.DrawSetting.bDrawBright = DrawBrightBackup ;

	// �I��
	return 0 ;
}

static int DrawModiStringSoftware( int x1, int y1, int x2, int y2, int x3, int y3, int x4, int y4, const wchar_t *String, size_t StringLength, unsigned int Color, FONTMANAGE *ManageData, unsigned int EdgeColor, int VerticalFlag )
{
	SIZE DrawSize ;
	RECT DrawArea, DrawAreaBackup ;
	DWORD DrawBrightBackup ;
	MEMIMG *ScreenImg ;
	MEMIMG TempImg ;

	// �ꎞ�o�b�t�@�ւ̕�����̕`��
	SetupSoftwareStringImage( ManageData, String, StringLength, Color, EdgeColor, VerticalFlag, &ScreenImg, &DrawSize, &DrawArea, &DrawAreaBackup, &DrawBrightBackup ) ;

	// �������`�悵���̈悾���̃C���[�W���쐬
	DerivationMemImg( &TempImg, ScreenImg, 0, 0, DrawArea.right, DrawArea.bottom ) ;

	// �`��̈�����ɖ߂�
	GSYS.DrawSetting.DrawArea = DrawAreaBackup ;
	SetMemImgDrawArea( &DrawAreaBackup ) ;

	// �{�`���ɕ`��
	{
		DX_POINTDATA p[4] ;

		p[0].x = x1 ;		p[0].y = y1 ;		p[0].u = 0 ;				p[0].v = 0 ;
		p[1].x = x2 ;		p[1].y = y2 ;		p[1].u = DrawArea.right ;	p[1].v = 0 ;
		p[2].x = x4 ;		p[2].y = y4 ;		p[2].u = 0 ;				p[2].v = DrawArea.bottom ;
		p[3].x = x3 ;		p[3].y = y3 ;		p[3].u = DrawArea.right ;	p[3].v = DrawArea.bottom ;

		DrawBasicPolygonMemImg( GSYS.SoftRender.TargetMemImg, &TempImg, &p[0], TRUE, GSYS.SoftRender.BlendMemImg, 0 ) ;
		DrawBasicPolygonMemImg( GSYS.SoftRender.TargetMemImg, &TempImg, &p[1], TRUE, GSYS.SoftRender.BlendMemImg, 0 ) ;
	}

	// �`��P�x�����ɖ߂�
	GSYS.DrawSetting.bDrawBright = DrawBrightBackup ;

	// �I��
	return 0 ;
}

#endif // DX_NON_GRAPHICS

// �t�H���g�V�X�e���̏�����
extern int InitFontManage( void )
{
	int i ;
	int j ;
	int k ;

	if( FSYS.InitializeFlag == TRUE )
		return -1 ;

	// �������t���O�𗧂Ă�
	FSYS.InitializeFlag = TRUE ;

	// �t�H���g�n���h���Ǘ���������������
	InitializeHandleManage( DX_HANDLETYPE_FONT, sizeof( FONTMANAGE ) + sizeof( FONTMANAGE_PF ), MAX_FONT_NUM, InitializeFontHandle, TerminateFontHandle, DumpInfoFontHandle, L"Font" ) ;

	// �S�p�X�y�[�X�� wchar_t �R�[�h������
	{
		const char *UTF16LE_DoubleByteSpaceString = "\x00\x30\x00"/*@ L"�@" @*/ ;
		wchar_t     WCHAR_T_DoubleByteSpaceString[ 16 ] ;
		ConvString( UTF16LE_DoubleByteSpaceString, 1, DX_CHARCODEFORMAT_UTF16LE, ( char * )WCHAR_T_DoubleByteSpaceString, sizeof( WCHAR_T_DoubleByteSpaceString ), WCHAR_T_CHARCODEFORMAT ) ;
		FSYS.DoubleByteSpaceCharCode = WCHAR_T_DoubleByteSpaceString[ 0 ] ;
	}

	// �f�t�H���g�t�H���g�̐ݒ���Z�b�g
	if( FSYS.EnableInitDefaultFontName == FALSE )
	{
		_MEMSET( FSYS.DefaultFontName, 0, sizeof( FSYS.DefaultFontName ) );
	}
	FSYS.EnableInitDefaultFontName = FALSE ;

	if( FSYS.EnableInitDefaultFontType == FALSE )
	{
		FSYS.DefaultFontType = FSYS.AntialiasingFontOnlyFlag ? DX_FONTTYPE_ANTIALIASING : DEFAULT_FONT_TYPE ;
	}
	FSYS.EnableInitDefaultFontType = FALSE ;

	if( FSYS.EnableInitDefaultFontSize == FALSE )
	{
		FSYS.DefaultFontSize     = DEFAULT_FONT_SIZE ;
	}
	FSYS.EnableInitDefaultFontSize = FALSE ;

	if( FSYS.EnableInitDefaultFontThick == FALSE )
	{
		FSYS.DefaultFontThick    = DEFAULT_FONT_THICKNESS ;
	}
	FSYS.EnableInitDefaultFontThick = FALSE ;

	if( FSYS.EnableInitDefaultFontCharSet == FALSE )
	{
		FSYS.DefaultFontCharSet  = _GET_CHARSET() ;
		FSYS.DefaultFontCharSet_Change = TRUE ;
	}
	FSYS.EnableInitDefaultFontCharSet = FALSE ;

	if( FSYS.EnableInitDefaultFontEdgeSize == FALSE )
	{
		FSYS.DefaultFontEdgeSize = DEFAULT_FONT_EDGESIZE ;
	}
	FSYS.EnableInitDefaultFontEdgeSize = FALSE ;

	if( FSYS.EnableInitDefaultFontItalic == FALSE )
	{
		FSYS.DefaultFontItalic   = FALSE ;
	}
	FSYS.EnableInitDefaultFontItalic = FALSE ;

	if( FSYS.EnableInitDefaultFontSpace == FALSE )
	{
		FSYS.DefaultFontSpace    = 0 ;
	}
	FSYS.EnableInitDefaultFontSpace = FALSE ;

	if( FSYS.EnableInitDefaultFontLineSpace == FALSE )
	{
		FSYS.DefaultFontLineSpaceValid = FALSE ;
		FSYS.DefaultFontLineSpace    = 0 ;
	}
	FSYS.EnableInitDefaultFontLineSpace = FALSE ;

	// �e�[�u�����쐬����
	for( i = 0 ; i < 256 ; i ++ )
	{
		j = i ;
		for( k = 0 ; j != 0 ; k ++, j &= j - 1 ){}
		FSYS.BitCountTable[ i ] = ( BYTE )k ;

		FSYS.MAX255ToMAX16[ i ] = ( BYTE )( i * 16 / 255 ) ;
		FSYS.MAX255ToMAX64[ i ] = ( BYTE )( i * 64 / 255 ) ;
	}
	for( i = 0 ; i < 16 ; i ++ )
	{
		if( i > 0 )
		{
			FSYS.MAX15ToMAX16[ i ] = ( BYTE )( i + 1 ) ;
		}
		else
		{
			FSYS.MAX15ToMAX16[ i ] = 0 ;
		}
		FSYS.MAX15ToMAX64[ i ] = ( BYTE )( i * 64 / 15 ) ;
	}

	// �t�H���g�n���h���̏�����
	InitFontToHandleBase() ;

	// ���ˑ��̏������������s��
	if( InitFontManage_PF() != 0 )
	{
		return -1 ;
	}

	// �I��
	return 0 ;
}

// �t�H���g����̏I��
extern int TermFontManage( void )
{
	if( FSYS.InitializeFlag == FALSE )
	{
		return -1 ;
	}

	// �S�Ẵt�H���g���폜
	InitFontToHandleBase( TRUE ) ;

	// �t�H���g�n���h���Ǘ����̌�n��
	TerminateHandleManage( DX_HANDLETYPE_FONT ) ;

	// �f�t�H���g�t�H���g�C���[�W�p�Ƀ��������m�ۂ��Ă�����������
	if( FSYS.DefaultFontImage != NULL )
	{
		DXFREE( FSYS.DefaultFontImage ) ;
		FSYS.DefaultFontImage = NULL ;
	}

#ifndef DX_NON_GRAPHICS
	// �f�t�H���g�t�H���g�C���[�W�̃O���t�B�b�N�n���h��������ꍇ�͍폜����
	if( FSYS.DefaultFontImageGraphHandle[ 0 ][ 0 ] > 1 )
	{
		int i ;
		int j ;

		for( i = 0 ; i < 8 ; i ++ )
		{
			for( j = 0 ; j < 16 ; j ++ )
			{
				SubHandle( FSYS.DefaultFontImageGraphHandle[ i ][ j ], FALSE, FALSE ) ;
				FSYS.DefaultFontImageGraphHandle[ i ][ j ] = 0 ;
			}
		}
	}
#endif // DX_NON_GRAPHICS

	// ���ˑ��̏I���������s��
	if( TermFontManage_PF() != 0 )
	{
		return -1 ;
	}

	// �������t���O��|��
	FSYS.InitializeFlag = FALSE ;

	// �I��
	return 0 ;
}

// �t�H���g�A������`��֌W�֐�

// �t�H���g�̃L���b�V����������������
extern int InitCacheFontToHandle( void )
{
	int i, Handle ;
	FONTMANAGE * ManageData ;
	wchar_t FontName[ 256 ] ;
	CREATEFONTTOHANDLE_GPARAM GParam ;
	int LineSpace, LineSpaceValid, Space, Size, Thick, FontType, CharSet, EdgeSize, Italic, UseCharCodeFormat ;

	if( HandleManageArray[ DX_HANDLETYPE_FONT ].InitializeFlag == FALSE )
		return -1 ;

	for( i = HandleManageArray[ DX_HANDLETYPE_FONT ].AreaMin ; i <= HandleManageArray[ DX_HANDLETYPE_FONT ].AreaMax ; i ++ )
	{
		ManageData = ( FONTMANAGE * )HandleManageArray[ DX_HANDLETYPE_FONT ].Handle[ i ] ;
		if( ManageData == NULL ) continue ;

		// ���ʂ̃p�����[�^��ۑ�
		EdgeSize			= ManageData->EdgeSize ;
		Space				= ManageData->Space ;
		LineSpaceValid		= ManageData->LineSpaceValidFlag ;
		LineSpace			= ManageData->LineSpace ;
		UseCharCodeFormat	= ManageData->UseCharCodeFormat ;

		// �t�H���g�t�@�C�����g�p���Ă���ꍇ�Ƃ����łȂ��ꍇ�ŏ����𕪊�
		if( ManageData->UseFontDataFile )
		{
			void *FontDataImageTemp = NULL ;
			int FontDataImageTempSize = 0 ;

			// �t�H���g�t�@�C���C���[�W�̃o�b�N�A�b�v�����
			FontDataImageTemp = DXALLOC( ManageData->FontDataFile.FontFileSize ) ;
			if( FontDataImageTemp == NULL )
			{
				DXST_LOGFILEFMT_ADDUTF16LE(( "\xd5\x30\xa9\x30\xf3\x30\xc8\x30\xd5\x30\xa1\x30\xa4\x30\xeb\x30\xa4\x30\xe1\x30\xfc\x30\xb8\x30\x92\x30\x00\x4e\x42\x66\x84\x76\x6b\x30\xdd\x4f\x58\x5b\x59\x30\x8b\x30\xe1\x30\xe2\x30\xea\x30\x18\x98\xdf\x57\x6e\x30\xba\x78\xdd\x4f\x6b\x30\x31\x59\x57\x65\x57\x30\x7e\x30\x57\x30\x5f\x30\x0a\x00\x00"/*@ L"�t�H���g�t�@�C���C���[�W���ꎞ�I�ɕۑ����郁�����̈�̊m�ۂɎ��s���܂���\n" @*/ )) ;
				continue ;
			}
			_MEMCPY( FontDataImageTemp, ManageData->FontDataFile.FileBuffer, ManageData->FontDataFile.FontFileSize ) ;
			FontDataImageTempSize = ManageData->FontDataFile.FontFileSize ;

			// �t�H���g�n���h���̍�蒼��
			Handle = ManageData->HandleInfo.Handle ;
			SubHandle( Handle, FALSE, FALSE ) ;
			InitCreateFontToHandleGParam( &GParam ) ;
			LoadFontDataFromMemToHandle_UseGParam( &GParam, FontDataImageTemp, FontDataImageTempSize, EdgeSize, Handle, FALSE ) ;

			// �������̉��
			DXFREE( FontDataImageTemp ) ;
			FontDataImageTemp = NULL ;
		}
		else
		{
			_WCSCPY_S( FontName, sizeof( FontName ), ManageData->FontName ) ;
			Size				= ManageData->BaseInfo.FontSize ;
			Thick				= ManageData->BaseInfo.FontThickness ;
			FontType			= ManageData->FontType ;
			CharSet				= ManageData->BaseInfo.CharSet ;
			Italic				= ManageData->BaseInfo.Italic ;

			// �t�H���g�n���h���̍�蒼��
			Handle = ManageData->HandleInfo.Handle ;
			SubHandle( Handle, FALSE, FALSE ) ;
			InitCreateFontToHandleGParam( &GParam ) ;
			CreateFontToHandle_UseGParam( &GParam, FontName, Size, Thick, FontType, CharSet, EdgeSize, Italic, Handle, FALSE ) ;
		}

		// ���ʂ̃p�����[�^�𕜋A
		NS_SetFontSpaceToHandle( Space, Handle ) ;
		if( LineSpaceValid )
		{
			NS_SetFontLineSpaceToHandle( LineSpace, Handle ) ;
		}
		NS_SetFontCharCodeFormatToHandle( UseCharCodeFormat, Handle ) ;
	}

	// �I��
	return 0 ;
}

// ����̃t�H���g�̃L���b�V����������������
extern int InitFontCacheToHandle( FONTMANAGE *ManageData, int /*ASyncThread*/ )
{
//	FONTMANAGE * ManageData ;

//	DEFAULT_FONT_HANDLE_SETUP

//	// �G���[����
//	if( ASyncThread )
//	{
//		if( FONTHCHK_ASYNC( FontHandle, ManageData ) )
//			return -1  ;
//	}
//	else
//	{
//		if( FONTHCHK( FontHandle, ManageData ) )
//			return -1  ;
//	}

	// �e�L�X�g�L���b�V���f�[�^�̏�����
	{
		int i ;
		FONTCHARDATA *CharData ;

		_MEMSET( ManageData->CodeData,   0, sizeof( FONTCODEDATA   ) * 0x10000 ) ;
		_MEMSET( ManageData->CharData,   0, sizeof( FONTCHARDATA   ) * ( FONT_CACHE_MAXNUM + 1 ) ) ;
		_MEMSET( ManageData->CodeDataEx, 0, sizeof( FONTCHARDATA * ) * FONT_CACHE_EX_NUM ) ;
		ManageData->CodeDataExNum = 0 ;

		CharData = ManageData->CharData ;
		for( i = 0 ; i < ManageData->MaxCacheCharNum ; i ++, CharData ++ )
		{
			CharData->GraphIndex  = i ;	
			CharData->GraphIndexX = i / ManageData->LengthCharNum ;
			CharData->GraphIndexY = i % ManageData->LengthCharNum ;
		}
		CharData->GraphIndex = -1 ;

		ManageData->Index = 0 ;
	}

	// �I��
	return 0 ;
}

// �t�H���g�n���h�����g�p����`��o�b�t�@��e�N�X�`���L���b�V�����ď���������
extern int RefreshFontDrawResourceToHandle( FONTMANAGE *ManageData, int ASyncThread )
{
#ifndef DX_NON_GRAPHICS
	// TextureCache �̃��X�g����
	if( ManageData->TextureCacheLostFlag == TRUE )
	{
		int Use3D, w ;
		int UsePaletteFlag ;
		int PaletteBitDepth ;
		int InitGraphDelete ;
		SETUP_GRAPHHANDLE_GPARAM GParam ;

		ManageData->TextureCacheLostFlag = FALSE ;

		// �p���b�g�e�N�X�`�����ǂ����ŏ����𕪊�
		if( ManageData->TextureCacheBaseImage.ColorData.ColorBitDepth == 8 )
		{
			UsePaletteFlag = TRUE ;

			Graphics_Image_InitSetupGraphHandleGParam_Normal_NonDrawValid( &GParam, 16, TRUE, FALSE ) ;
			if( ( ManageData->FontType & DX_FONTTYPE_ANTIALIASING ) == 0 )
			{
				PaletteBitDepth = 4 ;
			}
			else
			{
				PaletteBitDepth = ManageData->TextureCacheBaseImage.ColorData.MaxPaletteNo == 255 ? 8 : 4 ;
			}
		}
		else
		{
			UsePaletteFlag  = FALSE ;
			PaletteBitDepth = 0 ;

			if( ( ManageData->FontType & DX_FONTTYPE_ANTIALIASING ) == 0 )
			{
				Graphics_Image_InitSetupGraphHandleGParam_Normal_NonDrawValid( &GParam, 16, FALSE, TRUE ) ;
			}
			else
			{
				Graphics_Image_InitSetupGraphHandleGParam_Normal_NonDrawValid( &GParam, ManageData->TextureCacheColorBitDepth, TRUE, FALSE ) ;
			}
		}

		Use3D = NS_GetUse3DFlag() ;
		NS_SetUse3DFlag( TRUE ) ;

		// InitGraph �ł͍폜����Ȃ��O���t�B�b�N�n���h���ɂ���
		InitGraphDelete = NS_GetCreateGraphInitGraphDelete() ;
		NS_SetCreateGraphInitGraphDelete( FALSE ) ;

		// �G�b�W���̏ꍇ�͉�����{�ɂ���
		w = ( ManageData->FontType & DX_FONTTYPE_EDGE ) != 0 ? ManageData->CacheImageSize.cx * 2 : ManageData->CacheImageSize.cx ;
		GParam.NotInitGraphDelete = TRUE ;
		GParam.UseLinearMapTextureFlag = TRUE ;
		ManageData->TextureCache = Graphics_Image_MakeGraph_UseGParam( &GParam, w, ManageData->CacheImageSize.cy, FALSE, UsePaletteFlag, PaletteBitDepth, FALSE, ASyncThread ) ;
		ManageData->TextureCacheSub = -1 ;

		// �G�b�W�t���̏ꍇ�͔h��������
		if( ( ManageData->FontType & DX_FONTTYPE_EDGE ) != 0 )
		{
			ManageData->TextureCacheSub = Graphics_Image_DerivationGraph_UseGParam(
				FALSE,
				ManageData->CacheImageSize.cx, ( float )ManageData->CacheImageSize.cx,
				0, 0.0f,
				ManageData->CacheImageSize.cx, ( float )ManageData->CacheImageSize.cx,
				ManageData->CacheImageSize.cy, ( float )ManageData->CacheImageSize.cy,
				ManageData->TextureCache,
				ASyncThread
			) ;
		}

		// �ݒ�����ɖ߂�
		NS_SetCreateGraphInitGraphDelete( InitGraphDelete ) ;

		NS_SetUse3DFlag( Use3D ) ;

		// �G���[�`�F�b�N
		if( ManageData->TextureCache < 0 )
		{
			return -1 ;
		}
		NS_SetGraphLostFlag( ManageData->TextureCache, &ManageData->TextureCacheLostFlag ) ;

		// �e�N�X�`���̃T�C�Y���擾���Ă���
		NS_GetGraphTextureSize( ManageData->TextureCache, &ManageData->TextureCacheSizeX, &ManageData->TextureCacheSizeY ) ;
		ManageData->TextureCacheInvSizeX = 1.0f / ManageData->TextureCacheSizeX ;
		ManageData->TextureCacheInvSizeY = 1.0f / ManageData->TextureCacheSizeY ;

		// �����F�œh��Ԃ�
/*		if( ManageData->TextureCacheUsePremulAlpha )
		{
			Graphics_Image_FillGraph_UseGParam( ManageData->TextureCache, 0,0,0,0, ASyncThread ) ;
			if( ( ManageData->FontType & DX_FONTTYPE_EDGE ) != 0 )
			{
				Graphics_Image_FillGraph_UseGParam( ManageData->TextureCacheSub, 0,0,0,0, ASyncThread ) ;
			}
		}
		else
		{
			Graphics_Image_FillGraph_UseGParam( ManageData->TextureCache, 255,255,255,0, ASyncThread ) ;
			if( ( ManageData->FontType & DX_FONTTYPE_EDGE ) != 0 )
			{
				Graphics_Image_FillGraph_UseGParam( ManageData->TextureCacheSub, 255,255,255,0, ASyncThread ) ;
			}
		}
*/
		// �t�H���g�̃L���b�V����������������
		InitFontCacheToHandle( ManageData, ASyncThread ) ;
	}

#endif // DX_NON_GRAPHICS

	// �I��
	return 0 ;
}

// �A���`�G�C���A�X�t�H���g�̂ݎg�p�ł��邩�A�t���O���Z�b�g����
extern int SetAntialiasingFontOnlyFlag( int AntialiasingFontOnlyFlag )
{
	FSYS.AntialiasingFontOnlyFlag = AntialiasingFontOnlyFlag ;

	// �I��
	return 0 ;
}

// �f�t�H���g�t�H���g���č쐬����
extern int RefreshDefaultFont( void )
{
	FONTMANAGE * ManageData ;
	
	// �ݒ肪�ς���Ă��Ȃ��ꍇ�͍č쐬���Ȃ�
	if( FSYS.DefaultFontHandle > 0 )
	{
		int FontType, Size, Thick/*, CharSet */, EdgeSize, Italic ;
		wchar_t *FontName ;

		ManageData = GetFontManageDataToHandle_Inline( FSYS.DefaultFontHandle ) ;

		FontName	= FSYS.DefaultFontName ;
		FontType 	= FSYS.DefaultFontType ;
		Size 		= FSYS.DefaultFontSize ;
		Thick 		= FSYS.DefaultFontThick ;
//		CharSet 	= FSYS.DefaultFontCharSet ;
		EdgeSize	= ( FSYS.DefaultFontType & DX_FONTTYPE_EDGE ) ? FSYS.DefaultFontEdgeSize : -1 ;
		Italic		= FSYS.DefaultFontItalic ;

		if( FontType 	== -1 )
		{
			FontType  = FSYS.AntialiasingFontOnlyFlag ? DX_FONTTYPE_ANTIALIASING : DEFAULT_FONT_TYPE ;
		}
		else
		{
			if( FSYS.AntialiasingFontOnlyFlag )
			{
				if( ( FontType & DX_FONTTYPE_EDGE ) != 0 )
				{
					FontType = DX_FONTTYPE_ANTIALIASING_EDGE ;
				}
				else
				{
					FontType = DX_FONTTYPE_ANTIALIASING ;
				}
			}
		}
		if( EdgeSize	> 1   )	FontType |= DX_FONTTYPE_EDGE ;
		if( Size 		== -1 ) Size      = DEFAULT_FONT_SIZE ;
		if( Thick 		== -1 ) Thick     = DEFAULT_FONT_THICKNESS ;
//		if( CharSet		== -1 ) CharSet   = _GET_CHARSET() ;
		if( EdgeSize	== -1 ) EdgeSize  = DEFAULT_FONT_EDGESIZE ;
		
		if( ( FSYS.UseDefaultFontImage == TRUE &&
			  FSYS.DefaultFontImageGraphHandle[ 0 ][ 0 ] > 0 ) ||
			( FSYS.UseDefaultFontImage == FALSE &&
			  ( FontName[ 0 ] == L'\0' || _WCSCMP( FontName, ManageData->FontName ) == 0 ) &&
			  FontType 	== ManageData->FontType &&
			  Size 		== ManageData->BaseInfo.FontSize &&
			  Thick 	== ManageData->BaseInfo.FontThickness &&
			  FSYS.DefaultFontCharSet_Change == FALSE /* CharSet == ManageData->BaseInfo.CharSet */ &&
			(   ( FontType & DX_FONTTYPE_EDGE ) == 0 ||
			  ( ( FontType & DX_FONTTYPE_EDGE ) != 0 && EdgeSize == ManageData->EdgeSize ) ) &&
			  Italic	== ManageData->BaseInfo.Italic ) )
			return 0 ;

		SubHandle( FSYS.DefaultFontHandle, FALSE, FALSE ) ;
	}

	// �ݒ肪�ς���Ă��邩�t�H���g�n���h���������ɂȂ��Ă���ꍇ�͍č쐬����	
	CREATEFONTTOHANDLE_GPARAM GParam ;
	InitCreateFontToHandleGParam( &GParam ) ;
	FSYS.DefaultFontHandle = CreateFontToHandle_UseGParam(
		&GParam,
		FSYS.DefaultFontName,
		FSYS.DefaultFontSize,
		FSYS.DefaultFontThick,
		FSYS.DefaultFontType,
		FSYS.DefaultFontCharSet,
		( FSYS.DefaultFontType & DX_FONTTYPE_EDGE ) ? FSYS.DefaultFontEdgeSize : -1,
		FSYS.DefaultFontItalic,
		-1,
		FALSE ) ;
	FSYS.DefaultFontCharSet_Change = FALSE ;

	// �f�t�H���g�t�H���g�n���h���̍쐬�Ɏ��s������f�t�H���g�t�H���g�t�@�C���ƃt�H���g�C���[�W���g�p����
	if( FSYS.DefaultFontHandle < 0 )
	{
		int i ;
		int j ;
		TCHAR Char[ 2 ] = { 0 } ;

		FSYS.DefaultFontHandle = NS_LoadFontDataFromMemToHandle( DefaultFontDataFileImage, sizeof( DefaultFontDataFileImage ), 0 ) ;

		// �摜�t�@�C�����f�R�[�h����Ă��Ȃ�������f�R�[�h����
		if( FSYS.DefaultFontImage == NULL )
		{
			// �����R�[�h�̏ꍇ�̓o�C�i���R�[�h�ɕϊ�����
			if( DefaultFontImageConvert == FALSE )
			{
				Base64ToBin( DefaultFontImage, DefaultFontImage ) ;
				DefaultFontImageConvert = TRUE ;
			}

			// �f�R�[�h��̃t�@�C���C���[�W���i�[���郁�����̈�̊m��
			FSYS.DefaultFontImage = DXCALLOC( ( size_t )DXA_Decode( DefaultFontImage, NULL ) ) ;
			if( FSYS.DefaultFontImage == NULL )
			{
				return -1 ;
			}

			// �f�R�[�h
			DXA_Decode( DefaultFontImage, FSYS.DefaultFontImage ) ;
		}

#ifndef DX_NON_GRAPHICS
		// �����̃O���t�B�b�N�n���h�����쐬����Ă��Ȃ�������쐬����
		if( FSYS.DefaultFontImageGraphHandle[ 0 ][ 0 ] <= 0 )
		{
			int TransRed ;
			int TransGreen ;
			int TransBlue ;
			int InitGraphDelete = NS_GetCreateGraphInitGraphDelete() ;

			// ���ߐF�����F�ɕύX
			NS_GetTransColor( &TransRed, &TransGreen, &TransBlue ) ;
			NS_SetTransColor( 255,0,255 ) ;

			// InitGraph �ł͍폜����Ȃ��O���t�B�b�N�n���h���ɂ���
			NS_SetCreateGraphInitGraphDelete( FALSE ) ;

			// �O���t�B�b�N�n���h���̍쐬
			NS_CreateDivGraphFromMem( FSYS.DefaultFontImage, DXA_Decode( DefaultFontImage, NULL ), 128, 16, 8, 8, 16, FSYS.DefaultFontImageGraphHandle[ 0 ], TRUE, FALSE, NULL, 0 ) ;

			// ���ߐF�����ɖ߂�
			NS_SetTransColor( TransRed, TransGreen, TransBlue ) ;

			// �폜���ꂽ�Ƃ��� -1 ����������悤�ɂ���
			for( i = 0 ; i < 8 ; i ++ )
			{
				for( j = 0 ; j < 16 ; j ++ )
				{
					NS_SetDeleteHandleFlag( FSYS.DefaultFontImageGraphHandle[ i ][ j ], &FSYS.DefaultFontImageGraphHandle[ i ][ j ] ) ;
				}
			}

			// �ݒ�����ɖ߂�
			NS_SetCreateGraphInitGraphDelete( InitGraphDelete ) ;
		}
#endif // DX_NON_GRAPHICS

		// �t�H���g�n���h���ւ̕����̊��蓖��
		for( i = 0 ; i < 8 ; i ++ )
		{
			for( j = 0 ; j < 16 ; j ++ )
			{
				Char[ 0 ] = ( TCHAR )( j + i * 16 ) ;
				NS_AddFontImageToHandle( FSYS.DefaultFontHandle, Char, FSYS.DefaultFontImageGraphHandle[ i ][ j ], 0, 0, 8 ) ;
			}
		}

		// �f�t�H���g�t�H���g�C���[�W���g�p���Ă��邩�ǂ����̃t���O�𗧂Ă�
		FSYS.UseDefaultFontImage = TRUE ;
	}
	else
	{
		// �f�t�H���g�t�H���g�C���[�W���g�p���Ă��邩�ǂ����̃t���O��|��
		FSYS.UseDefaultFontImage = FALSE ;

		NS_SetFontSpaceToHandle(     FSYS.DefaultFontSpace,     FSYS.DefaultFontHandle ) ;
		if( FSYS.DefaultFontLineSpaceValid )
		{
			NS_SetFontLineSpaceToHandle( FSYS.DefaultFontLineSpace, FSYS.DefaultFontHandle ) ;
		}
	}

	NS_SetDeleteHandleFlag( FSYS.DefaultFontHandle, &FSYS.DefaultFontHandle ) ;

	return 0 ;
}


// �����L���b�V���ɐV����������������
static int FontCacheStringAddToHandle(
	FONTMANAGE *	ManageData,
	const wchar_t *	String,
	int				StrLen,
	DWORD *			DrawStrBufferP,
	DWORD *			DrawIVSBufferP,
	int *			DrawCharNumP
)
{
	static DWORD AddStrBufferTemp[ 1024 ] ;
	static DWORD AddIVSBufferTemp[ 1024 ] ;
	static DWORD DrawStrTemp[ 1024 ] ;
	static DWORD DrawIVSTemp[ 1024 ] ;
	static DWORD ResetExistTemp[ 1024 ] ;
	static DWORD ResetExistIVSTemp[ 1024 ] ;

	FONTCODEDATA * fontcode ;
	int i, j ;
	DWORD IVSCheck ;
	DWORD *pDrawStr ;
	DWORD *pDrawIVS ;
	DWORD *pAddStr ;
	DWORD *pAddIVS ;
	DWORD *pRexist ;
	DWORD *pRexistIVS ;
	int AddNum ;
	int DrawNum ;
	int UseSize ;
	int UseAlloc ;
	DWORD *AllocDrawStr       = NULL ;
	DWORD *AllocDrawIVS       = NULL ;
	DWORD *AllocAddStr        = NULL ;
	DWORD *AllocAddIVS        = NULL ;
	DWORD *AllocResetExist    = NULL ;
	DWORD *AllocResetExistIVS = NULL ;

//	DEFAULT_FONT_HANDLE_SETUP

	// �G���[����
//	if( FONTHCHK( FontHandle, ManageData ) )
//	{
//		return -1  ;
//	}

	UseAlloc = FALSE ;

	// ������̒������Z�b�g
	if( StrLen < 0 )
	{
		StrLen = ( int )_WCSLEN( String ) ;
	}

	// �f�t�H���g�o�b�t�@�̃T�C�Y�𒴂���ꍇ�̓e���|�����o�b�t�@�̊m��
	if( StrLen > 1024 )
	{
		UseAlloc           = TRUE ;
		AllocDrawStr       = ( DWORD * )DXALLOC( ( StrLen * 6 ) * sizeof( DWORD ) ) ;
		AllocDrawIVS       = AllocDrawStr    + StrLen ;
		AllocAddStr        = AllocDrawIVS    + StrLen ;
		AllocAddIVS        = AllocAddStr     + StrLen ;
		AllocResetExist    = AllocAddIVS     + StrLen ;
		AllocResetExistIVS = AllocResetExist + StrLen ;
		if( AllocDrawStr == NULL )
		{
			return -1 ;
		}
	}
	
	AddNum      = 0 ;
	DrawNum     = 0 ;
	pDrawStr    = DrawStrBufferP != NULL ? DrawStrBufferP : ( UseAlloc ? AllocDrawStr       : DrawStrTemp ) ;
	pDrawIVS    = DrawIVSBufferP != NULL ? DrawIVSBufferP : ( UseAlloc ? AllocDrawIVS       : DrawIVSTemp ) ;
	pAddStr     =                                             UseAlloc ? AllocAddStr        : AddStrBufferTemp ;
	pAddIVS     =                                             UseAlloc ? AllocAddIVS        : AddIVSBufferTemp ;
	pRexist     =                                             UseAlloc ? AllocResetExist    : ResetExistTemp ;
	pRexistIVS  =                                             UseAlloc ? AllocResetExistIVS : ResetExistIVSTemp ;
	fontcode = ManageData->CodeData ;
	WCHAR_T_CHARCODEFORMAT ;
	for( i = 0 ; i < StrLen ; pDrawStr ++, pDrawIVS ++ )
	{
		int CharLength ;
		*pDrawStr = WCHAR_T_GetCharCode( String, g_BaseFuncSystem.Use_wchar_t_CharCodeFormat, &UseSize ) ;
		CharLength = UseSize / sizeof( wchar_t ) ;
		if( i + CharLength > StrLen )
		{
			break ;
		}
		String  += CharLength ;
		i       += CharLength ;
		DrawNum ++ ;

		// IVS�`�F�b�N
		IVSCheck = WCHAR_T_GetCharCode( String, g_BaseFuncSystem.Use_wchar_t_CharCodeFormat, &UseSize ) ;
		if( IVSCheck >= 0xe0100 && IVSCheck <= 0xe01ef )
		{
			*pDrawIVS = IVSCheck ;
			CharLength = UseSize / sizeof( wchar_t ) ;
			if( i + CharLength > StrLen )
			{
				break ;
			}
			String  += CharLength ;
			i       += CharLength ;
		}
		else
		{
			*pDrawIVS = 0 ;
		}

		// �摜�u�����������������ꍇ�̓L���b�V���ɉ����Ȃ�
		for( j = 0 ; j < ManageData->GraphHandleFontImageNum ; j ++ )
		{
			if( ManageData->GraphHandleFontImage[ j ].CodeUnicode == *pDrawStr &&
				ManageData->GraphHandleFontImage[ j ].IVSCode     == *pDrawIVS )
			{
				break ;
			}
		}
		if( j == ManageData->GraphHandleFontImageNum )
		{
			// �L���b�V���ɑ��݂��Ȃ������������ꍇ�L���b�V�������̈ꊇ�ǉ������邽�߂̃o�b�t�@�ɕۑ��A�L���b�V���ɒǉ����镶�����𑝂₷
			if( AddNum != ManageData->MaxCacheCharNum )
			{
				// 0x10000 �̃e�[�u���Ɏ��܂�Ȃ��R�[�h�A�Ⴕ���ّ͈̎����ǂ����ŏ����𕪊�
				if( *pDrawStr > 0xffff || *pDrawIVS != 0 )
				{
					// �e�[�u���Ɏ��܂�Ȃ��ꍇ
					for( j = 0 ; j < AddNum ; j ++ )
					{
						if( pRexist[ j ] == *pDrawStr && pRexistIVS[ j ] == *pDrawIVS )
						{
							break ;
						}
					}
					if( j == AddNum )
					{
						for( j = 0 ; j < ManageData->CodeDataExNum ; j ++ )
						{
							if( ManageData->CodeDataEx[ j ]->CodeUnicode == *pDrawStr &&
								ManageData->CodeDataEx[ j ]->IVSCode     == *pDrawIVS )
							{
								break ;
							}
						}
						if( j == ManageData->CodeDataExNum )
						{
							pRexist[ AddNum ]    = *pDrawStr ;
							pRexistIVS[ AddNum ] = *pDrawIVS ;
							AddNum ++ ;

							*pAddStr = *pDrawStr ;
							*pAddIVS = *pDrawIVS ;
							pAddStr ++ ;
							pAddIVS ++ ;
						}
					}
				}
				else
				{
					// �e�[�u���Ɏ��܂�ꍇ
					if( fontcode[ *pDrawStr ].ExistFlag == FALSE )
					{
						fontcode[ *pDrawStr ].ExistFlag = TRUE ;

						pRexist[ AddNum ]    = *pDrawStr ;
						pRexistIVS[ AddNum ] = *pDrawIVS ;
						AddNum ++ ;

						*pAddStr = *pDrawStr ;
						*pAddIVS = *pDrawIVS ;
						pAddStr ++ ;
						pAddIVS ++ ;
					}
				}
			}
		}
	}

	for( i = 0 ; i < AddNum ; i ++ )
	{
		if( pRexist[ i ] <= 0xffff && pRexistIVS[ i ] == 0 )
		{
			fontcode[ pRexist[ i ] ].ExistFlag = FALSE ;
		}
	}

	// �L���b�V�������̈ꊇ�ǉ����s��
	if( AddNum != 0 )
	{
		FontCacheCharAddToHandle(
			AddNum,
			UseAlloc ? AllocAddStr : AddStrBufferTemp,
			UseAlloc ? AllocAddIVS : AddIVSBufferTemp,
			ManageData
		) ;
	}

	// �`�悷�镶���̐���ۑ�����
	if( DrawCharNumP != NULL )
	{
		*DrawCharNumP = DrawNum ;
	}

	// ���������m�ۂ��Ă�������
	if( UseAlloc )
	{
		DXFREE( AllocDrawStr ) ;
	}

	// �I��
	return 0 ;
}

// �w��̃t�H���g�f�[�^�ɉ摜��]������
extern int FontCacheCharImageBltToHandle(
	FONTMANAGE *	ManageData,
	FONTCHARDATA *	CharData,
	DWORD			CharCode,
	DWORD			IVSCode,
	int				Space,
	int				ImageType /* DX_FONT_SRCIMAGETYPE_1BIT �� */,
	void *			ImageBuffer,
	DWORD			ImageSizeX,
	DWORD			ImageSizeY,
	DWORD			ImagePitch,
	int				ImageDrawX,
	int				ImageDrawY,
	int				ImageAddX,
	int				TextureCacheUpdate
)
{
	FONTCODEDATA * 	CodeData ;
	int				AddX ;
	int				AddY ;
	int				AddSize ;
	int				DestX ;
	int				DestY ;
	BYTE *			ResizeBuffer = NULL ;
	DWORD			SampleScale ;
	DWORD			DrawModDrawY ;
	DWORD			DataHeight ;

	// ���Ƀt�H���g�f�[�^���g�p����Ă����ꍇ�͖����ɂ���
	if( CharData->ValidFlag )
	{
		// �e�[�u���Ɏ��܂��Ă���f�[�^���ǂ����Ŗ����̎d�����قȂ�
		if( CharData->CodeData != NULL )
		{
			// �e�[�u���Ɏ��܂��Ă���ꍇ

			// �R�[�h�f�[�^�𖳌��ɂ���
			CharData->CodeData->ExistFlag = FALSE ;
			CharData->CodeData->CharData  = NULL ;
		}
		else
		{
			int i ;

			// �e�[�u���Ɏ��܂�Ȃ��ꍇ
			for( i = 0 ; ManageData->CodeDataEx[ i ] != CharData ; i ++ ){}
			ManageData->CodeDataExNum -- ;
			if( ManageData->CodeDataExNum - i > 0 )
			{
				_MEMMOVE( &ManageData->CodeDataEx[ i ], &ManageData->CodeDataEx[ i + 1 ], sizeof( FONTCHARDATA * ) * ( ManageData->CodeDataExNum - i ) ) ;
			}
		}

		// �f�[�^�𖳌��ɂ���
		CharData->ValidFlag = FALSE ;
	}

	// �摜�̔{�����Z�b�g
	switch( ImageType )
	{
	case DX_FONT_SRCIMAGETYPE_1BIT_SCALE4 :
		SampleScale = 4 ;
		break ;

	case DX_FONT_SRCIMAGETYPE_1BIT_SCALE8 :
		SampleScale = 8 ;
		break ;

	case DX_FONT_SRCIMAGETYPE_1BIT_SCALE16 :
		SampleScale = 16 ;
		break ;

	default :
		SampleScale = 1 ;
		break ;
	}

	CharData->CodeUnicode = CharCode ;
	CharData->IVSCode = IVSCode ;

	// �J�[�j���O�y�A�����Z�b�g
	CharData->KerningPair = NULL ;
	CharData->KerningPairNum = 0 ;
	if( ManageData->BaseInfo.KerningPairNum > 0 )
	{
		DWORD i ;
		for( i = 0 ; i < ManageData->BaseInfo.KerningPairNum && ManageData->KerningPairData[ i ].First != CharCode ; i ++ ){}
		if( i != ManageData->BaseInfo.KerningPairNum )
		{
			CharData->KerningPair = &ManageData->KerningPairData[ i ] ;
			for( ; i + CharData->KerningPairNum < ManageData->BaseInfo.KerningPairNum &&
				   ManageData->KerningPairData[ i + CharData->KerningPairNum ].First == CharCode ;
				CharData->KerningPairNum ++ ){}
		}
	}
	
	if( Space )
	{
		CharData->DrawX = 0 ;
		CharData->DrawY = 0 ;
		CharData->AddX = ( short )( ( ImageAddX + ( SampleScale >> 2 ) ) / SampleScale ) ;
		CharData->SizeX = 0 ;
		CharData->SizeY = 0 ;

		// �G�b�W�t���̏ꍇ�͓�����C���[�W�̃T�C�Y��傫������
		if( ( ManageData->FontType & DX_FONTTYPE_EDGE ) )
		{
			CharData->AddX += ( short )( ManageData->EdgeSize * 2 ) ;
		}
	}
	else
	if( ImageBuffer == NULL )
	{
		CharData->DrawX = 0 ;
		CharData->DrawY = 0 ;
		CharData->AddX = ( short )( ( ImageAddX + ( SampleScale >> 2 ) ) / SampleScale ) ;
		CharData->SizeX = 0 ;
		CharData->SizeY = 0 ;

		// �G�b�W�t���̏ꍇ�͓�����C���[�W�̃T�C�Y��傫������
		if( ( ManageData->FontType & DX_FONTTYPE_EDGE ) )
		{
			CharData->AddX += ( short )( ManageData->EdgeSize * 2 ) ;
		}
	}
	else
	{
		CharData->DrawX = ( short )( ( ImageDrawX + ( SampleScale >> 2 ) ) / SampleScale ) ;
		CharData->SizeX = ( WORD  )( ( ImageSizeX +   SampleScale - 1    ) / SampleScale ) ;
		CharData->AddX  = ( short )( ( ImageAddX  + ( SampleScale >> 2 ) ) / SampleScale ) ;

		DrawModDrawY    = ( DWORD )( ImageDrawY % SampleScale ) ;
		DataHeight      = ImageSizeY + DrawModDrawY ;
		CharData->DrawY = ( short )(   ImageDrawY                          / SampleScale ) ;
		CharData->SizeY = ( WORD  )( ( DataHeight +   SampleScale - 1    ) / SampleScale ) ;

		// �G�b�W�t���̏ꍇ�͓�����C���[�W�̃T�C�Y��傫������
		if( ( ManageData->FontType & DX_FONTTYPE_EDGE ) )
		{
			AddX    = ManageData->EdgeSize ;
			AddY    = ManageData->EdgeSize ;
			AddSize = ManageData->EdgeSize * 2 ;
		}
		else
		{
			AddX    = 0 ;
			AddY    = 0 ;
			AddSize = 0 ;
		}

		// ������ǉ�������W�̃Z�b�g
		DestX = CharData->GraphIndexX * ManageData->BaseInfo.MaxWidth ;
		DestY = CharData->GraphIndexY * ManageData->BaseInfo.MaxWidth ;

		// �����C���[�W���ꎞ�I�ɕۑ����郁�����̈��������
		if( ManageData->TextureCacheFlag == FALSE )
		{
			_MEMSET(	ManageData->CacheMem + DestY * ManageData->CachePitch,
						0,
						( size_t )( ManageData->CachePitch * ManageData->BaseInfo.MaxWidth ) ) ;
		}
		else
		{
			if( ManageData->TextureCacheBaseImage.ColorData.ColorBitDepth == 8 ||
				ManageData->TextureCacheUsePremulAlpha ||
				( ManageData->FontType & DX_FONTTYPE_EDGE ) != 0 )
			{
				NS_ClearRectBaseImage(
					&ManageData->TextureCacheBaseImage,
					DestX, DestY,
					ManageData->BaseInfo.MaxWidth, ManageData->BaseInfo.MaxWidth
				) ;

				if( ManageData->FontType & DX_FONTTYPE_EDGE )
				{
					NS_ClearRectBaseImage(
						&ManageData->TextureCacheBaseImage,
						DestX + ManageData->CacheImageSize.cx, DestY,
						ManageData->BaseInfo.MaxWidth, ManageData->BaseInfo.MaxWidth
					) ;
				}
			}
			else
			{
				NS_FillRectBaseImage(
					&ManageData->TextureCacheBaseImage,
					DestX, DestY,
					ManageData->BaseInfo.MaxWidth, ManageData->BaseInfo.MaxWidth,
					255,255,255,0
				) ;

				if( ManageData->FontType & DX_FONTTYPE_EDGE )
				{
					NS_FillRectBaseImage(
						&ManageData->TextureCacheBaseImage,
						DestX + ManageData->CacheImageSize.cx, DestY,
						ManageData->BaseInfo.MaxWidth, ManageData->BaseInfo.MaxWidth,
						255,255,255,0
					) ;
				}
			}
		}

		// �e�N�X�`���L���b�V�����g�p����ꍇ�͓]������W���P�h�b�g�����炷
		if( ManageData->TextureCacheFlag == TRUE )
		{
			DestX += 1 ;
			DestY += 1 ;
		}

		// �e�N�X�`���L���b�V�����g�p���Ȃ��ꍇ�ŃC���[�W�^�C�v�� DX_FONT_SRCIMAGETYPE_8BIT_MAX64 ����
		// DX_FONT_SRCIMAGETYPE_8BIT_MAX255 �������ꍇ���A�C���[�W�^�C�v�� DX_FONT_SRCIMAGETYPE_4BIT_MAX15 �������ꍇ��
		// DX_FONT_SRCIMAGETYPE_8BIT_MAX16 ���� DX_FONT_SRCIMAGETYPE_8BIT_MAX64 �ɕϊ�����
		if( ImageType == DX_FONT_SRCIMAGETYPE_4BIT_MAX15 ||
			( ManageData->TextureCacheFlag == FALSE &&
			  ( ImageType == DX_FONT_SRCIMAGETYPE_8BIT_MAX64 ||
			    ImageType == DX_FONT_SRCIMAGETYPE_8BIT_MAX255 ) ) )
		{
			BYTE *	Src ;
			BYTE *	Dest ;
			DWORD	Height ;
			DWORD	Width ;
			DWORD	i ;
			DWORD	j ;
			DWORD	DestPitch ;

			Width	= CharData->SizeX ;
			Height	= CharData->SizeY ;

			_MEMSET( ManageData->TempBuffer, 0, ManageData->TempBufferSize ) ;

			Src       = ( BYTE * )ImageBuffer ;

			Dest      = ManageData->TempBuffer ;
			DestPitch = Width ;

			switch( ImageType )
			{
			case DX_FONT_SRCIMAGETYPE_4BIT_MAX15 :
				{
					DWORD	ByteNum ;
					DWORD	ModNum ;

					ByteNum = Width / 2 ;
					ModNum  = Width - ByteNum * 2 ;

					// �e�N�X�`���L���b�V�����g�p����ꍇ�͕���
					if( ManageData->TextureCacheFlag )
					{
						for( i = 0 ; i < Height ; i ++ )
						{
							for( j = 0 ; j < ByteNum ; j ++ )
							{
								Dest[ j * 2 + 0 ] = FSYS.MAX15ToMAX64[ ( Src[ j ] & 0xf0 ) >> 4 ] ;
								Dest[ j * 2 + 1 ] = FSYS.MAX15ToMAX64[   Src[ j ] & 0x0f        ] ;
							}

							if( ModNum )
							{
								Dest[ j * 2 ] = FSYS.MAX15ToMAX64[ ( Src[ j ] & 0xf0 ) >> 4 ] ;
							}

							Src  += ImagePitch ;
							Dest += DestPitch ;
						}
						ImageType = DX_FONT_SRCIMAGETYPE_8BIT_MAX64 ;
					}
					else
					{
						for( i = 0 ; i < Height ; i ++ )
						{
							for( j = 0 ; j < ByteNum ; j ++ )
							{
								Dest[ j * 2 + 0 ] = FSYS.MAX15ToMAX16[ ( Src[ j ] & 0xf0 ) >> 4 ] ;
								Dest[ j * 2 + 1 ] = FSYS.MAX15ToMAX16[   Src[ j ] & 0x0f        ] ;
							}

							if( ModNum )
							{
								Dest[ j * 2 ] = FSYS.MAX15ToMAX16[ ( Src[ j ] & 0xf0 ) >> 4 ] ;
							}

							Src  += ImagePitch ;
							Dest += DestPitch ;
						}
						ImageType = DX_FONT_SRCIMAGETYPE_8BIT_MAX16 ;
					}
				}
				break ;

			case DX_FONT_SRCIMAGETYPE_8BIT_MAX64 :
				for( i = 0 ; i < Height ; i ++ )
				{
					for( j = 0 ; j < Width ; j ++ )
					{
						Dest[ j ] = Src[ j ] >> 2 ;
					}

					Src  += ImagePitch ;
					Dest += DestPitch ;
				}
				ImageType   = DX_FONT_SRCIMAGETYPE_8BIT_MAX16 ;
				break ;

			case DX_FONT_SRCIMAGETYPE_8BIT_MAX255 :
				for( i = 0 ; i < Height ; i ++ )
				{
					for( j = 0 ; j < Width ; j ++ )
					{
						Dest[ j ] = FSYS.MAX255ToMAX16[ Src[ j ] ] ;
					}

					Src  += ImagePitch ;
					Dest += DestPitch ;
				}
				ImageType   = DX_FONT_SRCIMAGETYPE_8BIT_MAX16 ;
				break ;
			}

			ImageBuffer = ManageData->TempBuffer ;
			ImagePitch  = DestPitch ;
		}
		else
		// �g��摜�̏ꍇ�͂����ŏk���摜���擾����
		if( SampleScale > 1 )
		{
			BYTE *	RDataBuffer ;
			DWORD	RSrcPitch ;
			DWORD	ImageAddPitch ;
			DWORD	ImagePitch2 ;
			DWORD	ImagePitch3 ;
			DWORD	ImagePitch4 ;
			DWORD	ImagePitch5 ;
			DWORD	ImagePitch6 ;
			DWORD	ImagePitch7 ;
			DWORD	ImagePitch8 ;
			DWORD	ImagePitch9 ;
			DWORD	ImagePitch10 ;
			DWORD	ImagePitch11 ;
			DWORD	ImagePitch12 ;
			DWORD	ImagePitch13 ;
			DWORD	ImagePitch14 ;
			DWORD	ImagePitch15 ;
			BYTE *	RSrc ;
			BYTE *	RDest ;
			DWORD	RWidth ;
			DWORD	RHeight ;
			DWORD	MHeight ;
			DWORD	HWidth ;
			DWORD	i ;
			DWORD	j ;

			RWidth	= ( CharData->SizeX + 1 ) / 2 * 2 ;
			HWidth	= RWidth / 2 ;
			RHeight	= DataHeight / SampleScale ;
			MHeight	= DataHeight % SampleScale ;

			RSrcPitch = RWidth + 4 ;

//			// �k����̃f�[�^���i�[���郁�������m��
//			ResizeBuffer = ( BYTE * )DXALLOC( ( size_t )( RSrcPitch * ( CharData->SizeY + 2 ) ) ) ;
//			if( ResizeBuffer == NULL )
//			{
//				DxLib_ErrorUTF16LE( "\x87\x65\x57\x5b\xa4\x30\xe1\x30\xfc\x30\xb8\x30\xea\x30\xb5\x30\xf3\x30\xd7\x30\xea\x30\xf3\x30\xb0\x30\x28\x75\xd0\x30\xc3\x30\xd5\x30\xa1\x30\x6e\x30\xba\x78\xdd\x4f\x6b\x30\x31\x59\x57\x65\x57\x30\x7e\x30\x57\x30\x5f\x30\x00"/*@ L"�����C���[�W���T���v�����O�p�o�b�t�@�̊m�ۂɎ��s���܂���" @*/ ) ;
//				return -1 ;
//			}
			ResizeBuffer = ManageData->TempBuffer ;
			_MEMSET( ResizeBuffer, 0, ( size_t )( RSrcPitch * ( CharData->SizeY + 2 ) ) ) ;
			RDataBuffer = ResizeBuffer + RSrcPitch ;

			RSrc			= ( BYTE * )ImageBuffer - DrawModDrawY * ImagePitch ;
			RDest			= RDataBuffer ;
			ImageAddPitch	= ( DWORD )( ImagePitch * SampleScale ) ;

			ImagePitch2		= ( DWORD )( ImagePitch * 2 ) ;
			ImagePitch3		= ( DWORD )( ImagePitch * 3 ) ;
			ImagePitch4		= ( DWORD )( ImagePitch * 4 ) ;
			ImagePitch5		= ( DWORD )( ImagePitch * 5 ) ;
			ImagePitch6		= ( DWORD )( ImagePitch * 6 ) ;
			ImagePitch7		= ( DWORD )( ImagePitch * 7 ) ;
			ImagePitch8		= ( DWORD )( ImagePitch * 8 ) ;
			ImagePitch9		= ( DWORD )( ImagePitch * 9 ) ;
			ImagePitch10	= ( DWORD )( ImagePitch * 10 ) ;
			ImagePitch11	= ( DWORD )( ImagePitch * 11 ) ;
			ImagePitch12	= ( DWORD )( ImagePitch * 12 ) ;
			ImagePitch13	= ( DWORD )( ImagePitch * 13 ) ;
			ImagePitch14	= ( DWORD )( ImagePitch * 14 ) ;
			ImagePitch15	= ( DWORD )( ImagePitch * 15 ) ;

			// ���T���v���X�P�[���ɂ���ď����𕪊�
			switch( SampleScale )
			{
				// �S�{�̏ꍇ
			case 4 :
				if( ManageData->TextureCacheFlag == FALSE || ManageData->TextureCacheColorBitDepth == 16 )
				{
					ImageType = DX_FONT_SRCIMAGETYPE_8BIT_MAX16 ;
					for( i = 0 ; i < RHeight ; i ++ )
					{
						for( j = 0 ; j < HWidth ; j ++ )
						{
							RDest[ j * 2     ] = ( BYTE )( 
								FSYS.BitCountTable[ RSrc[ j               ] & 0xf0 ] +
								FSYS.BitCountTable[ RSrc[ j + ImagePitch  ] & 0xf0 ] +
								FSYS.BitCountTable[ RSrc[ j + ImagePitch2 ] & 0xf0 ] +
								FSYS.BitCountTable[ RSrc[ j + ImagePitch3 ] & 0xf0 ] ) ;

							RDest[ j * 2 + 1 ] = ( BYTE )( 
								FSYS.BitCountTable[ RSrc[ j               ] & 0x0f ] +
								FSYS.BitCountTable[ RSrc[ j + ImagePitch  ] & 0x0f ] +
								FSYS.BitCountTable[ RSrc[ j + ImagePitch2 ] & 0x0f ] +
								FSYS.BitCountTable[ RSrc[ j + ImagePitch3 ] & 0x0f ] ) ;
						}

						RSrc  += ImageAddPitch ;
						RDest += RSrcPitch ;
					}

					if( MHeight != 0 )
					{
						for( i = 0 ; i < MHeight ; i ++ )
						{
							for( j = 0 ; j < HWidth ; j ++ )
							{
								RDest[ j * 2     ] += FSYS.BitCountTable[ RSrc[ j ] & 0xf0 ] ;
								RDest[ j * 2 + 1 ] += FSYS.BitCountTable[ RSrc[ j ] & 0x0f ] ;
							}

							RSrc += ImagePitch ;
						}
					}
				}
				else
				{
					ImageType = DX_FONT_SRCIMAGETYPE_8BIT_MAX64 ;
					for( i = 0 ; i < RHeight ; i ++ )
					{
						for( j = 0 ; j < HWidth ; j ++ )
						{
							RDest[ j * 2     ] = ( BYTE )( 
							  (	FSYS.BitCountTable[ RSrc[ j             ] & 0xf0 ] +
								FSYS.BitCountTable[ RSrc[ j + ImagePitch  ] & 0xf0 ] +
								FSYS.BitCountTable[ RSrc[ j + ImagePitch2 ] & 0xf0 ] +
								FSYS.BitCountTable[ RSrc[ j + ImagePitch3 ] & 0xf0 ] ) << 2 ) ;

							RDest[ j * 2 + 1 ] = ( BYTE )( 
							  (	FSYS.BitCountTable[ RSrc[ j             ] & 0x0f ] +
								FSYS.BitCountTable[ RSrc[ j + ImagePitch  ] & 0x0f ] +
								FSYS.BitCountTable[ RSrc[ j + ImagePitch2 ] & 0x0f ] +
								FSYS.BitCountTable[ RSrc[ j + ImagePitch3 ] & 0x0f ] ) << 2 ) ;
						}

						RSrc  += ImageAddPitch ;
						RDest += RSrcPitch ;
					}

					if( MHeight != 0 )
					{
						for( i = 0 ; i < MHeight ; i ++ )
						{
							for( j = 0 ; j < HWidth ; j ++ )
							{
								RDest[ j * 2     ] += FSYS.BitCountTable[ RSrc[ j ] & 0xf0 ] << 2 ;
								RDest[ j * 2 + 1 ] += FSYS.BitCountTable[ RSrc[ j ] & 0x0f ] << 2 ;
							}

							RSrc += ImagePitch ;
						}
					}
				}
				break;

				// �W�{�̏ꍇ
			case 8 :
				if( ManageData->TextureCacheFlag == FALSE || ManageData->TextureCacheColorBitDepth == 16 )
				{
					ImageType = DX_FONT_SRCIMAGETYPE_8BIT_MAX16 ;
					for( i = 0 ; i < RHeight ; i ++ )
					{
						for( j = 0 ; j < RWidth ; j ++ )
						{
							RDest[ j ] = ( BYTE )( 
							(	FSYS.BitCountTable[ RSrc[ j ] ] +
								FSYS.BitCountTable[ RSrc[ j + ImagePitch ] ] +
								FSYS.BitCountTable[ RSrc[ j + ImagePitch2 ] ] +
								FSYS.BitCountTable[ RSrc[ j + ImagePitch3 ] ] +
								FSYS.BitCountTable[ RSrc[ j + ImagePitch4 ] ] +
								FSYS.BitCountTable[ RSrc[ j + ImagePitch5 ] ] +
								FSYS.BitCountTable[ RSrc[ j + ImagePitch6 ] ] +
								FSYS.BitCountTable[ RSrc[ j + ImagePitch7 ] ] ) >> 2 ) ;
						}

						RSrc  += ImageAddPitch ;
						RDest += RSrcPitch ;
					}

					if( MHeight != 0 )
					{
						for( i = 0 ; i < MHeight ; i ++ )
						{
							for( j = 0 ; j < RWidth ; j ++ )
							{
								RDest[ j ] += FSYS.BitCountTable[ RSrc[ j ] ] ;
							}

							RSrc += ImagePitch ;
						}
						for( j = 0 ; j < RWidth ; j ++ )
						{
							RDest[ j ] >>= 2 ;
						}
					}
				}
				else
				{
					ImageType = DX_FONT_SRCIMAGETYPE_8BIT_MAX64 ;
					for( i = 0 ; i < RHeight ; i ++ )
					{
						for( j = 0 ; j < RWidth ; j ++ )
						{
							RDest[ j ] = ( BYTE )( 
							(	FSYS.BitCountTable[ RSrc[ j               ] ] +
								FSYS.BitCountTable[ RSrc[ j + ImagePitch  ] ] +
								FSYS.BitCountTable[ RSrc[ j + ImagePitch2 ] ] +
								FSYS.BitCountTable[ RSrc[ j + ImagePitch3 ] ] +
								FSYS.BitCountTable[ RSrc[ j + ImagePitch4 ] ] +
								FSYS.BitCountTable[ RSrc[ j + ImagePitch5 ] ] +
								FSYS.BitCountTable[ RSrc[ j + ImagePitch6 ] ] +
								FSYS.BitCountTable[ RSrc[ j + ImagePitch7 ] ] ) ) ;
						}

						RSrc  += ImageAddPitch ;
						RDest += RSrcPitch ;
					}

					if( MHeight != 0 )
					{
						for( i = 0 ; i < MHeight ; i ++ )
						{
							for( j = 0 ; j < RWidth ; j ++ )
							{
								RDest[ j ] += FSYS.BitCountTable[ RSrc[ j ] ] ;
							}

							RSrc += ImagePitch ;
						}
					}
				}
				break ;

				// �P�U�{�̏ꍇ
			case 16 :
				if( ManageData->TextureCacheFlag == FALSE || ManageData->TextureCacheColorBitDepth == 16 )
				{
					ImageType = DX_FONT_SRCIMAGETYPE_8BIT_MAX16 ;
					for( i = 0 ; i < RHeight ; i ++ )
					{
						for( j = 0 ; j < RWidth ; j ++ )
						{
							int MixParam = 
								FSYS.BitCountTable[ RSrc[ j * 2 + 0 ] ] +
								FSYS.BitCountTable[ RSrc[ j * 2 + 1 ] ] +
								FSYS.BitCountTable[ RSrc[ j * 2 + 0 + ImagePitch ] ] +
								FSYS.BitCountTable[ RSrc[ j * 2 + 1 + ImagePitch ] ] +
								FSYS.BitCountTable[ RSrc[ j * 2 + 0 + ImagePitch2 ] ] +
								FSYS.BitCountTable[ RSrc[ j * 2 + 1 + ImagePitch2 ] ] +
								FSYS.BitCountTable[ RSrc[ j * 2 + 0 + ImagePitch3 ] ] +
								FSYS.BitCountTable[ RSrc[ j * 2 + 1 + ImagePitch3 ] ] +
								FSYS.BitCountTable[ RSrc[ j * 2 + 0 + ImagePitch4 ] ] +
								FSYS.BitCountTable[ RSrc[ j * 2 + 1 + ImagePitch4 ] ] +
								FSYS.BitCountTable[ RSrc[ j * 2 + 0 + ImagePitch5 ] ] +
								FSYS.BitCountTable[ RSrc[ j * 2 + 1 + ImagePitch5 ] ] +
								FSYS.BitCountTable[ RSrc[ j * 2 + 0 + ImagePitch6 ] ] +
								FSYS.BitCountTable[ RSrc[ j * 2 + 1 + ImagePitch6 ] ] +
								FSYS.BitCountTable[ RSrc[ j * 2 + 0 + ImagePitch7 ] ] +
								FSYS.BitCountTable[ RSrc[ j * 2 + 1 + ImagePitch7 ] ] +
								FSYS.BitCountTable[ RSrc[ j * 2 + 0 + ImagePitch8 ] ] +
								FSYS.BitCountTable[ RSrc[ j * 2 + 1 + ImagePitch8 ] ] +
								FSYS.BitCountTable[ RSrc[ j * 2 + 0 + ImagePitch9 ] ] +
								FSYS.BitCountTable[ RSrc[ j * 2 + 1 + ImagePitch9 ] ] +
								FSYS.BitCountTable[ RSrc[ j * 2 + 0 + ImagePitch10 ] ] +
								FSYS.BitCountTable[ RSrc[ j * 2 + 1 + ImagePitch10 ] ] +
								FSYS.BitCountTable[ RSrc[ j * 2 + 0 + ImagePitch11 ] ] +
								FSYS.BitCountTable[ RSrc[ j * 2 + 1 + ImagePitch11 ] ] +
								FSYS.BitCountTable[ RSrc[ j * 2 + 0 + ImagePitch12 ] ] +
								FSYS.BitCountTable[ RSrc[ j * 2 + 1 + ImagePitch12 ] ] +
								FSYS.BitCountTable[ RSrc[ j * 2 + 0 + ImagePitch13 ] ] +
								FSYS.BitCountTable[ RSrc[ j * 2 + 1 + ImagePitch13 ] ] +
								FSYS.BitCountTable[ RSrc[ j * 2 + 0 + ImagePitch14 ] ] +
								FSYS.BitCountTable[ RSrc[ j * 2 + 1 + ImagePitch14 ] ] +
								FSYS.BitCountTable[ RSrc[ j * 2 + 0 + ImagePitch15 ] ] +
								FSYS.BitCountTable[ RSrc[ j * 2 + 1 + ImagePitch15 ] ] ;
							RDest[ j ] = ( BYTE )( MixParam == 256 ? 255 : MixParam ) ;
						}

						RSrc  += ImageAddPitch ;
						RDest += RSrcPitch ;
					}

					if( MHeight != 0 )
					{
						for( i = 0 ; i < MHeight ; i ++ )
						{
							for( j = 0 ; j < RWidth ; j ++ )
							{
								RDest[ j ] += FSYS.BitCountTable[ RSrc[ j ] ] ;
							}

							RSrc += ImagePitch ;
						}
						for( j = 0 ; j < RWidth ; j ++ )
						{
							RDest[ j ] >>= 2 ;
						}
					}
				}
				else
				{
					ImageType = DX_FONT_SRCIMAGETYPE_8BIT_MAX255 ;
					for( i = 0 ; i < RHeight ; i ++ )
					{
						for( j = 0 ; j < RWidth ; j ++ )
						{
							int MixParam = 
								FSYS.BitCountTable[ RSrc[ j * 2 + 0 ] ] +
								FSYS.BitCountTable[ RSrc[ j * 2 + 1 ] ] +
								FSYS.BitCountTable[ RSrc[ j * 2 + 0 + ImagePitch ] ] +
								FSYS.BitCountTable[ RSrc[ j * 2 + 1 + ImagePitch ] ] +
								FSYS.BitCountTable[ RSrc[ j * 2 + 0 + ImagePitch2 ] ] +
								FSYS.BitCountTable[ RSrc[ j * 2 + 1 + ImagePitch2 ] ] +
								FSYS.BitCountTable[ RSrc[ j * 2 + 0 + ImagePitch3 ] ] +
								FSYS.BitCountTable[ RSrc[ j * 2 + 1 + ImagePitch3 ] ] +
								FSYS.BitCountTable[ RSrc[ j * 2 + 0 + ImagePitch4 ] ] +
								FSYS.BitCountTable[ RSrc[ j * 2 + 1 + ImagePitch4 ] ] +
								FSYS.BitCountTable[ RSrc[ j * 2 + 0 + ImagePitch5 ] ] +
								FSYS.BitCountTable[ RSrc[ j * 2 + 1 + ImagePitch5 ] ] +
								FSYS.BitCountTable[ RSrc[ j * 2 + 0 + ImagePitch6 ] ] +
								FSYS.BitCountTable[ RSrc[ j * 2 + 1 + ImagePitch6 ] ] +
								FSYS.BitCountTable[ RSrc[ j * 2 + 0 + ImagePitch7 ] ] +
								FSYS.BitCountTable[ RSrc[ j * 2 + 1 + ImagePitch7 ] ] +
								FSYS.BitCountTable[ RSrc[ j * 2 + 0 + ImagePitch8 ] ] +
								FSYS.BitCountTable[ RSrc[ j * 2 + 1 + ImagePitch8 ] ] +
								FSYS.BitCountTable[ RSrc[ j * 2 + 0 + ImagePitch9 ] ] +
								FSYS.BitCountTable[ RSrc[ j * 2 + 1 + ImagePitch9 ] ] +
								FSYS.BitCountTable[ RSrc[ j * 2 + 0 + ImagePitch10 ] ] +
								FSYS.BitCountTable[ RSrc[ j * 2 + 1 + ImagePitch10 ] ] +
								FSYS.BitCountTable[ RSrc[ j * 2 + 0 + ImagePitch11 ] ] +
								FSYS.BitCountTable[ RSrc[ j * 2 + 1 + ImagePitch11 ] ] +
								FSYS.BitCountTable[ RSrc[ j * 2 + 0 + ImagePitch12 ] ] +
								FSYS.BitCountTable[ RSrc[ j * 2 + 1 + ImagePitch12 ] ] +
								FSYS.BitCountTable[ RSrc[ j * 2 + 0 + ImagePitch13 ] ] +
								FSYS.BitCountTable[ RSrc[ j * 2 + 1 + ImagePitch13 ] ] +
								FSYS.BitCountTable[ RSrc[ j * 2 + 0 + ImagePitch14 ] ] +
								FSYS.BitCountTable[ RSrc[ j * 2 + 1 + ImagePitch14 ] ] +
								FSYS.BitCountTable[ RSrc[ j * 2 + 0 + ImagePitch15 ] ] +
								FSYS.BitCountTable[ RSrc[ j * 2 + 1 + ImagePitch15 ] ] ;
							RDest[ j ] = ( BYTE )( MixParam == 256 ? 255 : MixParam ) ;
						}

						RSrc  += ImageAddPitch ;
						RDest += RSrcPitch ;
					}

					if( MHeight != 0 )
					{
						for( i = 0 ; i < MHeight ; i ++ )
						{
							for( j = 0 ; j < RWidth ; j ++ )
							{
								int SrcTotal ;

								SrcTotal = FSYS.BitCountTable[ RSrc[ j * 2 ] ] + FontSystem.BitCountTable[ RSrc[ j * 2 + 1 ] ] ;
								if( RDest[ j ] + SrcTotal >= 256 )
								{
									RDest[ j ] = 255 ;
								}
								else
								{
									RDest[ j ] += SrcTotal ;
								}
							}

							RSrc += ImagePitch ;
						}
					}
				}
				break ;
			}

			ImageBuffer = RDataBuffer ;
			ImagePitch  = RSrcPitch ;
		}

		// �����肩�ǂ����ŏ����𕪊�
		if( ( ManageData->FontType & DX_FONTTYPE_EDGE ) == 0 )
		{
			BYTE *	Src ;
			BYTE	dat = 0 ;
			DWORD	Height ;
			DWORD	Width ;
			DWORD	i ;
			DWORD	j ;
			DWORD	DestPitch ;

			Width	= CharData->SizeX ;
			Height	= CharData->SizeY ;

			Src		= ( BYTE * )ImageBuffer ;

			if( ManageData->TextureCacheFlag == FALSE )
			{
				BYTE *Dest ;

				DestPitch	= ( DWORD )ManageData->CachePitch ;
				Dest		= ( BYTE * )ManageData->CacheMem + DestY * DestPitch ;

				switch( ManageData->FontType )
				{
				case DX_FONTTYPE_NORMAL :
					switch( ImageType )
					{
					case DX_FONT_SRCIMAGETYPE_1BIT :
						for( i = 0 ; i < Height ; i ++ )
						{
							_MEMCPY( Dest, Src, ( size_t )ImagePitch ) ;

							Src  += ImagePitch ;
							Dest += DestPitch ;
						}
						break ;

					case DX_FONT_SRCIMAGETYPE_8BIT_ON_OFF :
						{
							BYTE *dp ;
							BYTE bit ;

							for( i = 0 ; i < Height ; i ++ )
							{
								dp  = Dest ;
								bit = 0x80 ;
								dat = 0 ;
								for( j = 0 ; j < Width ; j ++, bit >>= 1 )
								{
									if( j != 0 && j % 8 == 0 )
									{
										bit = 0x80 ;
										*dp = dat ;
										dp ++ ;
										dat = 0 ;
									}

									if( Src[ j ] != 0 )
									{
										dat |= bit ;
									}
								}
								*dp = dat ;

								Src  += ImagePitch ;
								Dest += DestPitch ;
							}
						}
						break ;

					default :
						return -1 ;
					}
					break ;

				case DX_FONTTYPE_ANTIALIASING : 
				case DX_FONTTYPE_ANTIALIASING_4X4 : 
				case DX_FONTTYPE_ANTIALIASING_8X8 : 
				case DX_FONTTYPE_ANTIALIASING_16X16 : 
					// DX_FONT_SRCIMAGETYPE_8BIT_MAX16 �ȊO�̓G���[
					if( ImageType != DX_FONT_SRCIMAGETYPE_8BIT_MAX16 )
					{
						return -1 ;
					}

					for( i = 0 ; i < Height ; i ++ )
					{
						for( j = 0 ; j < Width ; j ++ )
						{
							if( Src[j] )
							{
								Dest[j] = ( BYTE )( Src[j] - 1 ) ;
							}
						}

						Src  += ImagePitch ;
						Dest += DestPitch ;
					}
					break ;
				}
			}
			else
			{
				BYTE 		*Dest ;
				BASEIMAGE 	&BaseImage 	= ManageData->TextureCacheBaseImage ;
				COLORDATA 	&cl 	    = BaseImage.ColorData ;
				DWORD 		RGBMask ;

				DestPitch	= ( DWORD )BaseImage.Pitch ;
				Dest		= ( BYTE * )BaseImage.GraphData + DestX * BaseImage.ColorData.PixelByte + DestY * BaseImage.Pitch ;

				RGBMask		= cl.RedMask | cl.GreenMask | cl.BlueMask ;

				switch( ImageType )
				{
				case DX_FONT_SRCIMAGETYPE_1BIT :
					if( BaseImage.ColorData.ColorBitDepth == 8 )
					{
						if( BaseImage.ColorData.MaxPaletteNo == 15 )
						{
							for( i = 0 ; i < Height ; i ++ )
							{
								for( j = 0 ; j < Width ; j ++, dat <<= 1 )
								{
									if( ( j & 0x7 ) == 0 )
									{
										dat = Src[ j >> 3 ] ;
									}

									Dest[ j ] = ( dat & 0x80 ) ? 0x0f : 0 ;
								}

								Src  += ImagePitch ;
								Dest += DestPitch ;
							}
						}
						else
						{
							for( i = 0 ; i < Height ; i ++ )
							{
								for( j = 0 ; j < Width ; j ++, dat <<= 1 )
								{
									if( ( j & 0x7 ) == 0 )
									{
										dat = Src[ j >> 3 ] ;
									}

									Dest[ j ] = ( dat & 0x80 ) ? 0xff : 0 ;
								}

								Src  += ImagePitch ;
								Dest += DestPitch ;
							}
						}
					}
					else
					{
						if( ManageData->TextureCacheUsePremulAlpha )
						{
							for( i = 0 ; i < Height ; i ++ )
							{
								for( j = 0 ; j < Width ; j ++, dat <<= 1 )
								{
									if( ( j & 0x7 ) == 0 )
									{
										dat = Src[ j >> 3 ] ;
									}

									if( dat & 0x80 )
									{
										*( ( WORD * )Dest + j ) = ( WORD )( RGBMask | cl.AlphaMask ) ;
									}
									else
									{
										*( ( WORD * )Dest + j ) = 0 ;
									}
								}

								Src  += ImagePitch ;
								Dest += DestPitch ;
							}
						}
						else
						{
							for( i = 0 ; i < Height ; i ++ )
							{
								for( j = 0 ; j < Width ; j ++, dat <<= 1 )
								{
									if( ( j & 0x7 ) == 0 )
									{
										dat = Src[ j >> 3 ] ;
									}

									*( ( WORD * )Dest + j ) = ( WORD )( RGBMask | ( ( dat & 0x80 ) ? cl.AlphaMask : 0 ) ) ;
								}

								Src  += ImagePitch ;
								Dest += DestPitch ;
							}
						}
					}
					break ;

				case DX_FONT_SRCIMAGETYPE_8BIT_ON_OFF :
					if( BaseImage.ColorData.ColorBitDepth == 8 )
					{
						if( BaseImage.ColorData.MaxPaletteNo == 15 )
						{
							for( i = 0 ; i < Height ; i ++ )
							{
								for( j = 0 ; j < Width ; j ++ )
								{
									Dest[ j ] = Src[ j ] != 0 ? 0x0f : 0 ;
								}

								Src  += ImagePitch ;
								Dest += DestPitch ;
							}
						}
						else
						{
							for( i = 0 ; i < Height ; i ++ )
							{
								for( j = 0 ; j < Width ; j ++ )
								{
									Dest[ j ] = Src[ j ] != 0 ? 0xff : 0 ;
								}

								Src  += ImagePitch ;
								Dest += DestPitch ;
							}
						}
					}
					else
					{
						if( cl.ColorBitDepth == 16 )
						{
							WORD 		RGBAMask ;

							RGBAMask = ( WORD )( RGBMask | cl.AlphaMask ) ;

							if( ManageData->TextureCacheUsePremulAlpha )
							{
								for( i = 0 ; i < Height ; i ++ )
								{
									for( j = 0 ; j < Width ; j ++ )
									{
										*( ( WORD * )Dest + j ) = ( WORD )( Src[ j ] != 0 ? RGBAMask : 0 ) ;
									}

									Src  += ImagePitch ;
									Dest += DestPitch ;
								}
							}
							else
							{
								for( i = 0 ; i < Height ; i ++ )
								{
									for( j = 0 ; j < Width ; j ++ )
									{
										*( ( WORD * )Dest + j ) = ( WORD )( Src[ j ] != 0 ? RGBAMask : RGBMask ) ;
									}

									Src  += ImagePitch ;
									Dest += DestPitch ;
								}
							}
						}
						else
						if( cl.ColorBitDepth == 32 )
						{
							DWORD 		RGBAMask ;

							RGBAMask = ( DWORD )( RGBMask | cl.AlphaMask ) ;

							if( ManageData->TextureCacheUsePremulAlpha )
							{
								for( i = 0 ; i < Height ; i ++ )
								{
									for( j = 0 ; j < Width ; j ++ )
									{
										*( ( DWORD * )Dest + j ) = ( DWORD )( Src[ j ] != 0 ? RGBAMask : 0 ) ;
									}

									Src  += ImagePitch ;
									Dest += DestPitch ;
								}
							}
							else
							{
								for( i = 0 ; i < Height ; i ++ )
								{
									for( j = 0 ; j < Width ; j ++ )
									{
										*( ( DWORD * )Dest + j ) = ( DWORD )( Src[ j ] != 0 ? RGBAMask : RGBMask ) ;
									}

									Src  += ImagePitch ;
									Dest += DestPitch ;
								}
							}
						}
					}
					break ;
					
				case DX_FONT_SRCIMAGETYPE_8BIT_MAX16 :
					if( BaseImage.ColorData.ColorBitDepth == 8 )
					{
						if( BaseImage.ColorData.MaxPaletteNo == 15 )
						{
							for( i = 0 ; i < Height ; i ++ )
							{
								for( j = 0 ; j < Width ; j ++ )
								{
									if( Src[ j ] )
									{
										Dest[ j ] = ( BYTE )( Src[ j ] - 1 ) ;
									}
									else
									{
										Dest[ j ] = 0 ;
									}
								}

								Src  += ImagePitch ;
								Dest += DestPitch ;
							}
						}
						else
						{
							for( i = 0 ; i < Height ; i ++ )
							{
								for( j = 0 ; j < Width ; j ++ )
								{
									if( Src[ j ] )
									{
										Dest[ j ] = ( BYTE )( ( Src[ j ] << 4 ) - 1 ) ;
									}
									else
									{
										Dest[ j ] = 0 ;
									}
								}

								Src  += ImagePitch ;
								Dest += DestPitch ;
							}
						}
					}
					else
					{
						if( cl.AlphaMask == 0xf000 &&
							cl.RedMask   == 0x0f00 &&
							cl.GreenMask == 0x00f0 &&
							cl.BlueMask  == 0x000f )
						{
							if( ManageData->TextureCacheUsePremulAlpha )
							{
								for( i = 0 ; i < Height ; i ++ )
								{
									for( j = 0 ; j < Width ; j ++ )
									{
										if( Src[j] == 16 )
										{
											*( (WORD *)Dest + j ) = ( WORD )0xffff ;
										}
										else
										if( Src[j] )
										{
											*( (WORD *)Dest + j ) = ( WORD )( ( Src[j] << 0 ) | ( Src[j] << 4 ) | ( Src[j] << 8 ) | ( Src[j] << 12 ) ) ;
										}
										else
										{
											*( (WORD *)Dest + j ) = (WORD)0x0000 ;
										}
									}

									Src += ImagePitch ;
									Dest += DestPitch ;
								}
							}
							else
							{
								for( i = 0 ; i < Height ; i ++ )
								{
									for( j = 0 ; j < Width ; j ++ )
									{
										if( Src[j] )
										{
											*( (WORD *)Dest + j ) = ( WORD )( ( ( (DWORD)Src[j] << 12 ) - 1 ) | 0x0fff ) ;
										}
										else
										{
											*( (WORD *)Dest + j ) = (WORD)0x0fff ;
										}
									}

									Src  += ImagePitch ;
									Dest += DestPitch ;
								}
							}
						}
						else
						if( cl.ColorBitDepth == 16 )
						{
							if( ManageData->TextureCacheUsePremulAlpha )
							{
								BYTE aloc, rloc, gloc, bloc ;

								aloc = ( BYTE )( cl.AlphaLoc + cl.AlphaWidth - 4 ) ;
								rloc = ( BYTE )( cl.RedLoc   + cl.RedWidth   - 4 ) ;
								gloc = ( BYTE )( cl.GreenLoc + cl.GreenWidth - 4 ) ;
								bloc = ( BYTE )( cl.BlueLoc  + cl.BlueWidth  - 4 ) ;
								for( i = 0 ; i < Height ; i ++ )
								{
									for( j = 0 ; j < Width ; j ++ )
									{
										if( Src[j] == 16 )
										{
											*( (WORD *)Dest + j ) = ( WORD )0xffff ;
										}
										else
										if( Src[j] )
										{
											*( (WORD *)Dest + j ) = ( WORD )( ( Src[j] << aloc ) | ( Src[j] << rloc ) | ( Src[j] << gloc ) | ( Src[j] << bloc ) ) ;
										}
										else
										{
											*( (WORD *)Dest + j ) = (WORD)0x0000 ;
										}
									}

									Src += ImagePitch ;
									Dest += DestPitch ;
								}
							}
							else
							{
								for( i = 0 ; i < Height ; i ++ )
								{
									for( j = 0 ; j < Width ; j ++ )
									{
										if( Src[j] )
										{
											*( (WORD *)Dest + j ) = ( WORD )( ( ( (DWORD)Src[j] << ( ( cl.AlphaLoc + cl.AlphaWidth ) - 4 ) ) - 1 ) | RGBMask ) ;
										}
										else
										{
											*( (WORD *)Dest + j ) = (WORD)RGBMask ;
										}
									}

									Src  += ImagePitch ;
									Dest += DestPitch ;
								}
							}
						}
						else
						if( cl.ColorBitDepth == 32 )
						{
							if( ManageData->TextureCacheUsePremulAlpha )
							{
								BYTE aloc, rloc, gloc, bloc ;

								aloc = ( BYTE )( cl.AlphaLoc + cl.AlphaWidth - 4 ) ;
								rloc = ( BYTE )( cl.RedLoc   + cl.RedWidth   - 4 ) ;
								gloc = ( BYTE )( cl.GreenLoc + cl.GreenWidth - 4 ) ;
								bloc = ( BYTE )( cl.BlueLoc  + cl.BlueWidth  - 4 ) ;
								for( i = 0 ; i < Height ; i ++ )
								{
									for( j = 0 ; j < Width ; j ++ )
									{
										if( Src[j] == 16 )
										{
											*( (DWORD *)Dest + j ) = ( DWORD )0xffffffff ;
										}
										else
										if( Src[j] )
										{
											*( (DWORD *)Dest + j ) = ( DWORD )( ( Src[j] << aloc ) | ( Src[j] << rloc ) | ( Src[j] << gloc ) | ( Src[j] << bloc ) ) ;
										}
										else
										{
											*( (DWORD *)Dest + j ) = (DWORD)0x00000000 ;
										}
									}

									Src  += ImagePitch ;
									Dest += DestPitch ;
								}
							}
							else
							{
								for( i = 0 ; i < Height ; i ++ )
								{
									for( j = 0 ; j < Width ; j ++ )
									{
										if( Src[j] )
										{
											*( (DWORD *)Dest + j ) = ( DWORD )( ( ( (DWORD)Src[j] << ( ( cl.AlphaLoc + cl.AlphaWidth ) - 4 ) ) - 1 ) | RGBMask ) ;
										}
										else
										{
											*( (DWORD *)Dest + j ) = (DWORD)RGBMask ;
										}
									}

									Src  += ImagePitch ;
									Dest += DestPitch ;
								}
							}
						}
					}
					break ;

				case DX_FONT_SRCIMAGETYPE_8BIT_MAX64 :
					if( BaseImage.ColorData.ColorBitDepth == 8 )
					{
						if( BaseImage.ColorData.MaxPaletteNo == 15 )
						{
							for( i = 0 ; i < Height ; i ++ )
							{
								for( j = 0 ; j < Width ; j ++ )
								{
									if( Src[j] > 4 )
									{
										Dest[ j ] = ( BYTE )( ( Src[ j ] >> 2 ) - 1 ) ;
									}
									else
									{
										Dest[ j ] = 0 ;
									}
								}

								Src  += ImagePitch ;
								Dest += DestPitch ;
							}
						}
						else
						{
							for( i = 0 ; i < Height ; i ++ )
							{
								for( j = 0 ; j < Width ; j ++ )
								{
									if( Src[j] )
									{
										Dest[ j ] = ( BYTE )( ( Src[ j ] << 2 ) - 1 ) ;
									}
									else
									{
										Dest[ j ] = 0 ;
									}
								}

								Src  += ImagePitch ;
								Dest += DestPitch ;
							}
						}
					}
					else
					{
						if( ManageData->TextureCacheUsePremulAlpha )
						{
							BYTE aloc, rloc, gloc, bloc ;

							aloc = ( BYTE )( cl.AlphaLoc + cl.AlphaWidth - 6 ) ;
							rloc = ( BYTE )( cl.RedLoc   + cl.RedWidth   - 6 ) ;
							gloc = ( BYTE )( cl.GreenLoc + cl.GreenWidth - 6 ) ;
							bloc = ( BYTE )( cl.BlueLoc  + cl.BlueWidth  - 6 ) ;
							for( i = 0 ; i < Height ; i ++ )
							{
								for( j = 0 ; j < Width ; j ++ )
								{
									if( Src[j] == 64 )
									{
										*( (DWORD *)Dest + j ) = ( DWORD )0xffffffff ;
									}
									else
									if( Src[j] )
									{
										*( (DWORD *)Dest + j ) = ( DWORD )( ( Src[j] << aloc ) | ( Src[j] << rloc ) | ( Src[j] << gloc ) | ( Src[j] << bloc ) ) ;
									}
									else
									{
										*( (DWORD *)Dest + j ) = (DWORD)0x00000000 ;
									}
								}

								Src += ImagePitch ;
								Dest += DestPitch ;
							}
						}
						else
						{
							for( i = 0 ; i < Height ; i ++ )
							{
								for( j = 0 ; j < Width ; j ++ )
								{
									if( Src[j] )
									{
										*( (DWORD *)Dest + j ) = ( DWORD )( ( ( DWORD )( Src[j] - 1 ) << ( ( cl.AlphaLoc + cl.AlphaWidth ) - 6 ) ) | RGBMask ) ;
									}
									else
									{
										*( (DWORD *)Dest + j ) = RGBMask ;
									}
								}

								Src  += ImagePitch ;
								Dest += DestPitch ;
							}
						}
					}
					break ;

				case DX_FONT_SRCIMAGETYPE_8BIT_MAX255 :
					if( BaseImage.ColorData.ColorBitDepth == 8 )
					{
						if( BaseImage.ColorData.MaxPaletteNo == 15 )
						{
							for( i = 0 ; i < Height ; i ++ )
							{
								for( j = 0 ; j < Width ; j ++ )
								{
									Dest[ j ] = ( BYTE )( Src[ j ] >> 4 ) ;
								}

								Src  += ImagePitch ;
								Dest += DestPitch ;
							}
						}
						else
						{
							for( i = 0 ; i < Height ; i ++ )
							{
								for( j = 0 ; j < Width ; j ++ )
								{
									Dest[ j ] = Src[ j ] ;
								}

								Src  += ImagePitch ;
								Dest += DestPitch ;
							}
						}
					}
					else
					{
						if( ManageData->TextureCacheUsePremulAlpha )
						{
							BYTE aloc, rloc, gloc, bloc ;

							aloc = ( BYTE )( cl.AlphaLoc + cl.AlphaWidth - 8 ) ;
							rloc = ( BYTE )( cl.RedLoc   + cl.RedWidth   - 8 ) ;
							gloc = ( BYTE )( cl.GreenLoc + cl.GreenWidth - 8 ) ;
							bloc = ( BYTE )( cl.BlueLoc  + cl.BlueWidth  - 8 ) ;
							for( i = 0 ; i < Height ; i ++ )
							{
								for( j = 0 ; j < Width ; j ++ )
								{
									*( (DWORD *)Dest + j ) = ( DWORD )( ( Src[j] << aloc ) | ( Src[j] << rloc ) | ( Src[j] << gloc ) | ( Src[j] << bloc ) ) ;
								}

								Src += ImagePitch ;
								Dest += DestPitch ;
							}
						}
						else
						{
							for( i = 0 ; i < Height ; i ++ )
							{
								for( j = 0 ; j < Width ; j ++ )
								{
									*( (DWORD *)Dest + j ) = ( DWORD )( ( ( DWORD )Src[ j ] << ( ( cl.AlphaLoc + cl.AlphaWidth ) - 8 ) ) | RGBMask ) ;
								}

								Src  += ImagePitch ;
								Dest += DestPitch ;
							}
						}
					}
					break ;

				default :
					return -1 ;
				}

#ifndef DX_NON_GRAPHICS
				// �e�N�X�`���L���b�V���ɓ]��
				if( TextureCacheUpdate )
				{
					RECT srect ;

					SETRECT(
						srect,
						DestX - 1,
						DestY - 1,
						ManageData->BaseInfo.MaxWidth + DestX - 1,
						ManageData->BaseInfo.MaxWidth + DestY - 1
					) ;
//					Graphics_Image_BltBmpOrGraphImageToGraph2Base(
//						&BaseImage, NULL,
//						&srect,
//						DestX - 1,
//						DestY - 1,
//						ManageData->TextureCache,
//						GSYS.CreateImage.NotUseTransColor ? FALSE : TRUE
//					) ;
					FontTextureCacheAddUpdateRect( ManageData, &srect ) ;
//					FontTextureCacheUpdateRectApply( ManageData ) ;
				}
#endif // DX_NON_GRAPHICS
			}
		}
		else
		{
			BYTE	*Src ;
			BYTE	dat = 0 ;
			BYTE 	*Dest ;
			BYTE	*DestT ;
			int 	Height ;
			int		Width ;
			int		i ;
			int		j ;
			int		l ;
			int		n ;
			int		m ;
			int		o ;
			int		d ;
			int		EdgeSize ;
			int		DestPitch ;
			unsigned char ( *EdgePat )[ FONTEDGE_PATTERN_NUM * 2 + 1 ] ;
			BYTE   *CircleImage ;
			int     CircleImagePitch ;
			
			Width 		= ( int )CharData->SizeX ;
			Height 		= ( int )CharData->SizeY ;

			Src			= ( BYTE * )ImageBuffer ;
			EdgeSize	= ManageData->EdgeSize ;
			EdgePat		= _FontEdgePattern[ EdgeSize - 1 ] ;

			CircleImage = ( BYTE * )ManageData->EdgeCircleImage.GraphData ;
			CircleImagePitch = ManageData->EdgeCircleImage.Pitch ;
			
			if( ManageData->TextureCacheFlag == FALSE )
			{
				DestPitch = ManageData->CachePitch ;

				switch( ManageData->FontType )
				{
				case DX_FONTTYPE_EDGE :
					Dest = ( BYTE * )ManageData->CacheMem + ( DestX + AddX ) + ( DestY + AddY ) * DestPitch ;

					switch( ImageType )
					{
					case DX_FONT_SRCIMAGETYPE_1BIT :
						if( EdgeSize == 1 )
						{
							for( i = 0 ; i < Height ; i ++ )
							{
								for( j = 0 ; j < Width ; j ++, dat <<= 1 )
								{
									if( ( j & 0x7 ) == 0 )
									{
										dat = Src[ j / 8 ] ;
									}

									if( dat & 0x80 )
									{
										Dest[j] = 1 ;
										if( Dest[j-1]         != 1 ) Dest[j-1]         = 2 ;
										if( Dest[j+1]         != 1 ) Dest[j+1]         = 2 ;
										if( Dest[j-DestPitch] != 1 ) Dest[j-DestPitch] = 2 ;
										if( Dest[j+DestPitch] != 1 ) Dest[j+DestPitch] = 2 ;
									}
								}
								
								Src += ImagePitch ;
								Dest += DestPitch ;
							}
						}
						else
						if( EdgeSize <= FONTEDGE_PATTERN_NUM )
						{
							for( i = 0 ; i < Height ; i ++ )
							{
								for( j = 0 ; j < Width ; j ++, dat <<= 1 )
								{
									if( ( j % 8 ) == 0 ) dat = Src[ j / 8 ] ;
									if( dat & 0x80 )
									{
										Dest[j] = 1 ;
										for( n = 0, l = -EdgeSize ; l < EdgeSize + 1 ; n ++, l ++ )
										{
											for( o = 0, m = -EdgeSize ; m < EdgeSize + 1 ; o ++, m ++ )
											{
												if( EdgePat[n][o] == 0 ) continue ;
																
												DestT = ( Dest + j + m ) + ( l * DestPitch ) ;
												if( *DestT != 1 ) *DestT = 2 ;
											}
										}
									}
								}
									
								Src  += ImagePitch ;
								Dest += DestPitch ;
							}
						}
						else
						{
							for( i = 0 ; i < Height ; i ++ )
							{
								for( j = 0 ; j < Width ; j ++, dat <<= 1 )
								{
									if( ( j % 8 ) == 0 ) dat = Src[ j / 8 ] ;
									if( dat & 0x80 )
									{
										Dest[j] = 1 ;
										for( n = 0, l = -EdgeSize ; l < EdgeSize + 1 ; n ++, l ++ )
										{
											for( o = 0, m = -EdgeSize ; m < EdgeSize + 1 ; o ++, m ++ )
											{
												if( CircleImage[ o + CircleImagePitch * n ] == 0 ) continue ;
																
												DestT = ( Dest + j + m ) + ( l * DestPitch ) ;
												if( *DestT != 1 ) *DestT = 2 ;
											}
										}
									}
								}
									
								Src  += ImagePitch ;
								Dest += DestPitch ;
							}
						}
						break ;

					case DX_FONT_SRCIMAGETYPE_8BIT_ON_OFF :
						if( EdgeSize == 1 )
						{
							for( i = 0 ; i < Height ; i ++ )
							{
								for( j = 0 ; j < Width ; j ++ )
								{
									if( Src[ j ] != 0 )
									{
										Dest[j] = 1 ;
										if( Dest[j-1]         != 1 ) Dest[j-1]         = 2 ;
										if( Dest[j+1]         != 1 ) Dest[j+1]         = 2 ;
										if( Dest[j-DestPitch] != 1 ) Dest[j-DestPitch] = 2 ;
										if( Dest[j+DestPitch] != 1 ) Dest[j+DestPitch] = 2 ;
									}
								}
								
								Src += ImagePitch ;
								Dest += DestPitch ;
							}
						}
						else
						if( EdgeSize <= FONTEDGE_PATTERN_NUM )
						{
							for( i = 0 ; i < Height ; i ++ )
							{
								for( j = 0 ; j < Width ; j ++ )
								{
									if( Src[ j ] != 0 )
									{
										Dest[j] = 1 ;
										for( n = 0, l = -EdgeSize ; l < EdgeSize + 1 ; n ++, l ++ )
										{
											for( o = 0, m = -EdgeSize ; m < EdgeSize + 1 ; o ++, m ++ )
											{
												if( EdgePat[n][o] == 0 ) continue ;
																
												DestT = ( Dest + j + m ) + ( l * DestPitch ) ;
												if( *DestT != 1 ) *DestT = 2 ;
											}
										}
									}
								}
									
								Src  += ImagePitch ;
								Dest += DestPitch ;
							}
						}
						else
						{
							for( i = 0 ; i < Height ; i ++ )
							{
								for( j = 0 ; j < Width ; j ++ )
								{
									if( Src[ j ] != 0 )
									{
										Dest[j] = 1 ;
										for( n = 0, l = -EdgeSize ; l < EdgeSize + 1 ; l ++, n ++ )
										{
											for( o = 0, m = -EdgeSize ; m < EdgeSize + 1 ; m ++, o ++ )
											{
												if( CircleImage[ o + CircleImagePitch * n ] == 0 ) continue ;

												DestT = Dest + j + m + l * DestPitch ;
												if( *DestT != 1 ) *DestT = 2 ;
											}
										}
									}
								}
								
								Src  += ImagePitch ;
								Dest += DestPitch ;
							}
						}
						break ;

					default :
						return -1 ;
					}
					break ;


				case DX_FONTTYPE_ANTIALIASING_EDGE :
				case DX_FONTTYPE_ANTIALIASING_EDGE_4X4 :
				case DX_FONTTYPE_ANTIALIASING_EDGE_8X8 :
					// DX_FONT_SRCIMAGETYPE_8BIT_MAX16 �ȊO�̓G���[
					if( ImageType != DX_FONT_SRCIMAGETYPE_8BIT_MAX16 )
					{
						return -1 ;
					}

					Dest = ( BYTE * )ManageData->CacheMem + DestX + AddX + ( DestY + AddY ) * DestPitch ;

					if( EdgeSize == 1 )
					{
						for( i = 0 ; i < Height ; i ++ )
						{
							for( j = 0 ; j < Width ; j ++ )
							{
								if( Src[j] != 0 )
								{
									d = Src[j] - 1 ;
									Dest[j] |= d ;
									d <<= 4 ;
									if( ( Dest[j - DestPitch] & 0xf0 ) < d ) Dest[j - DestPitch] = ( BYTE )( ( Dest[j - DestPitch] & 0x0f ) | d ) ;
									if( ( Dest[j + DestPitch] & 0xf0 ) < d ) Dest[j + DestPitch] = ( BYTE )( ( Dest[j + DestPitch] & 0x0f ) | d ) ;
									if( ( Dest[j + 1] & 0xf0 )         < d ) Dest[j + 1]         = ( BYTE )( ( Dest[j + 1]         & 0x0f ) | d ) ;
									if( ( Dest[j - 1] & 0xf0 )         < d ) Dest[j - 1]         = ( BYTE )( ( Dest[j - 1]         & 0x0f ) | d ) ;
								}
							}

							Src  += ImagePitch ;
							Dest += DestPitch ;
						}
					}
					else
					if( EdgeSize <= FONTEDGE_PATTERN_NUM )
					{
						for( i = 0 ; i < Height ; i ++ )
						{
							for( j = 0 ; j < Width ; j ++ )
							{
								if( Src[j] != 0 )
								{
									d = Src[j] - 1 ;
									Dest[j] |= d ;
									d <<= 4 ;
									for( n = 0, l = -EdgeSize ; l < EdgeSize + 1 ; n ++, l ++ )
									{
										for( o = 0, m = -EdgeSize ; m < EdgeSize + 1 ; o ++, m ++ )
										{
											if( EdgePat[n][o] == 0 ) continue ;

											DestT = Dest + j + l * DestPitch + m ;
											if( ( *DestT & 0xf0 ) < d ) *DestT = ( BYTE )( ( *DestT & 0x0f ) | d ) ;
										}
									}
								}
							}

							Src += ImagePitch ;
							Dest += DestPitch ;
						}
					}
					else
					{
						for( i = 0 ; i < Height ; i ++ )
						{
							for( j = 0 ; j < Width ; j ++ )
							{
								if( Src[j] != 0 )
								{
									d = Src[j] - 1 ;
									Dest[j] |= d ;
									d <<= 4 ;
									for( n = 0, l = -EdgeSize ; l < EdgeSize + 1 ; l ++, n ++ )
									{
										for( o = 0, m = -EdgeSize ; m < EdgeSize + 1 ; m ++, o ++ )
										{
											if( CircleImage[ o + CircleImagePitch * n ] == 0 ) continue ;

											DestT = Dest + j + l * DestPitch + m ;
											if( ( *DestT & 0xf0 ) < d ) *DestT = ( BYTE )( ( *DestT & 0x0f ) | d ) ;
										}
									}
								}
							}

							Src += ImagePitch ;
							Dest += DestPitch ;
						}
					}
					break ;
				}
			}
			else
			{
				BYTE 		*DestB ;
				BYTE		datB = 0 ;
				BASEIMAGE 	&im 	= ManageData->TextureCacheBaseImage ;
				COLORDATA 	&cl 	= im.ColorData ;
				DWORD 		RGBMask ;
				DWORD		AlphaRGBMask ;
				DWORD		adp ;

				DestPitch	= im.Pitch ;
				DestB		= ( BYTE * )im.GraphData + im.ColorData.PixelByte * ( AddX + DestX ) + DestPitch * ( AddY + DestY ) ;
				adp			= ( DWORD )( im.Width / 2 ) ;

	#define DB0		*( (BYTE *)dp + j )
	#define DB1		*( (BYTE *)dp + j - DestPitch )
	#define DB2		*( (BYTE *)dp + j + DestPitch )
	#define DB3		*( (BYTE *)dp + j - 1 )
	#define DB4		*( (BYTE *)dp + j + 1 )

	#define EB0		*( (BYTE *)dp + adp + j )
	#define EB1		*( (BYTE *)dp + ( j + adp ) - DestPitch )
	#define EB2		*( (BYTE *)dp + ( j + adp ) + DestPitch )
	#define EB3		*( (BYTE *)dp + adp + j - 1 )
	#define EB4		*( (BYTE *)dp + adp + j + 1 )
	#define EB5		*( (BYTE *)dp + ( j + adp - 1 ) - DestPitch )
	#define EB6		*( (BYTE *)dp + ( j + adp + 1 ) - DestPitch )
	#define EB7		*( (BYTE *)dp + ( j + adp - 1 ) + DestPitch )
	#define EB8		*( (BYTE *)dp + ( j + adp + 1 ) + DestPitch )

	#define D0		*( (WORD *)dp + j )
	#define D1		*( (WORD *)( dp + ( j << 1 ) - DestPitch ) )
	#define D2		*( (WORD *)( dp + ( j << 1 ) + DestPitch ) )
	#define D3		*( (WORD *)dp + j - 1 )
	#define D4		*( (WORD *)dp + j + 1 )

	#define E0		*( (WORD *)dp + adp + j )
	#define E1		*( (WORD *)( dp + ( ( j + adp ) << 1 ) - DestPitch ) )
	#define E2		*( (WORD *)( dp + ( ( j + adp ) << 1 ) + DestPitch ) )
	#define E3		*( (WORD *)dp + adp + j - 1 )
	#define E4		*( (WORD *)dp + adp + j + 1 )
	#define E5		*( (WORD *)( dp + ( ( j + adp - 1 ) << 1 ) - DestPitch ) )
	#define E6		*( (WORD *)( dp + ( ( j + adp + 1 ) << 1 ) - DestPitch ) )
	#define E7		*( (WORD *)( dp + ( ( j + adp - 1 ) << 1 ) + DestPitch ) )
	#define E8		*( (WORD *)( dp + ( ( j + adp + 1 ) << 1 ) + DestPitch ) )

	#define DD0		*( (DWORD *)dp + j )
	#define DD1		*( (DWORD *)( dp + ( j << 2 ) - DestPitch ) )
	#define DD2		*( (DWORD *)( dp + ( j << 2 ) + DestPitch ) )
	#define DD3		*( (DWORD *)dp + j - 1 )
	#define DD4		*( (DWORD *)dp + j + 1 )

	#define ED0		*( (DWORD *)dp + adp + j )
	#define ED1		*( (DWORD *)( dp + ( ( j + adp ) << 2 ) - DestPitch ) )
	#define ED2		*( (DWORD *)( dp + ( ( j + adp ) << 2 ) + DestPitch ) )
	#define ED3		*( (DWORD *)dp + adp + j - 1 )
	#define ED4		*( (DWORD *)dp + adp + j + 1 )
	#define ED5		*( (DWORD *)( dp + ( ( j + adp - 1 ) << 2 ) - DestPitch ) )
	#define ED6		*( (DWORD *)( dp + ( ( j + adp + 1 ) << 2 ) - DestPitch ) )
	#define ED7		*( (DWORD *)( dp + ( ( j + adp - 1 ) << 2 ) + DestPitch ) )
	#define ED8		*( (DWORD *)( dp + ( ( j + adp + 1 ) << 2 ) + DestPitch ) )

				RGBMask = cl.RedMask | cl.GreenMask | cl.BlueMask ;
				AlphaRGBMask = RGBMask | cl.AlphaMask ;
				{
					BYTE	*sp ;
					BYTE	*dp ;
					WORD	*p ;
					BYTE	*pb ;
					DWORD	*pd ;
					
					sp = Src ;
					dp = DestB ;
					
					switch( ImageType )
					{
					case DX_FONT_SRCIMAGETYPE_1BIT :
						if( EdgeSize == 1 )
						{
							if( im.ColorData.ColorBitDepth == 8 )
							{
								for( i = 0 ; i < Height ; i ++ )
								{
									for( j = 0 ; j < Width ; j ++, datB <<= 1 )
									{
										if( ( j & 0x7 ) == 0 ) datB = sp[j>>3] ;
										if( datB & 0x80 )
										{
											DB0 = 1 ;
											EB1 = 1 ;
											EB2 = 1 ;
											EB3 = 1 ;
											EB4 = 1 ;
											EB5 = 1 ;
											EB6 = 1 ;
											EB7 = 1 ;
											EB8 = 1 ;
										}
									}
								
									sp += ImagePitch ;
									dp += DestPitch ;
								}
							}
							else
							{
								for( i = 0 ; i < Height ; i ++ )
								{
									for( j = 0 ; j < Width ; j ++, datB <<= 1 )
									{
										if( ( j & 0x7 ) == 0 ) datB = sp[j>>3] ;
										if( datB & 0x80 )
										{
											D0 = 1 ;
											E1 = 1 ;
											E2 = 1 ;
											E3 = 1 ;
											E4 = 1 ;
											E5 = 1 ;
											E6 = 1 ;
											E7 = 1 ;
											E8 = 1 ;
										}
									}
								
									sp += ImagePitch ;
									dp += DestPitch ;
								}
							}
						}
						else
						if( EdgeSize <= FONTEDGE_PATTERN_NUM )
						{
							if( im.ColorData.ColorBitDepth == 8 )
							{
								for( i = 0 ; i < Height ; i ++ )
								{
									for( j = 0 ; j < Width ; j ++, datB <<= 1 )
									{
										if( ( j % 8 ) == 0 ) datB = sp[j/8] ;
										if( datB & 0x80 )
										{
											DB0 = 1 ;
											for( n = 0, l = -EdgeSize ; l < EdgeSize + 1 ; n ++, l ++ )
											{
												for( o = 0, m = -EdgeSize ; m < EdgeSize + 1 ; o ++, m ++ )
												{
													if( EdgePat[n][o] == 0 ) continue ;
											
													pb = dp + ( j + m + adp ) + ( l * DestPitch ) ;
													if( *pb == 0 ) *pb = 1 ;
												}
											}
										}
									}
								
									sp += ImagePitch ;
									dp += DestPitch ;
								}
							}
							else
							{
								for( i = 0 ; i < Height ; i ++ )
								{
									for( j = 0 ; j < Width ; j ++, datB <<= 1 )
									{
										if( ( j % 8 ) == 0 ) datB = sp[j/8] ;
										if( datB & 0x80 )
										{
											D0 = 1 ;
											for( n = 0, l = -EdgeSize ; l < EdgeSize + 1 ; n ++, l ++ )
											{
												for( o = 0, m = -EdgeSize ; m < EdgeSize + 1 ; o ++, m ++ )
												{
													if( EdgePat[n][o] == 0 ) continue ;
											
													p = (WORD *)( dp + (j + m + adp) * 2 + (l * DestPitch) ) ;
													if( *p == 0 ) *p = 1 ;
												}
											}
										}
									}
								
									sp += ImagePitch ;
									dp += DestPitch ;
								}
							}
						}
						else
						{
							if( im.ColorData.ColorBitDepth == 8 )
							{
								for( i = 0 ; i < Height ; i ++ )
								{
									for( j = 0 ; j < Width ; j ++, datB <<= 1 )
									{
										if( ( j % 8 ) == 0 ) datB = sp[j/8] ;
										if( datB & 0x80 )
										{
											DB0 = 1 ;
											for( n = 0, l = -EdgeSize ; l < EdgeSize + 1 ; l ++, n++ )
											{
												for( o = 0, m = -EdgeSize ; m < EdgeSize + 1 ; m ++, o++ )
												{
													if( CircleImage[ o + CircleImagePitch * n ] == 0 ) continue ;

													pb = dp + ( j + m + adp ) + ( l * DestPitch ) ;
													if( *pb == 0 ) *pb = 1 ;
												}
											}
										}
									}
								
									sp += ImagePitch ;
									dp += DestPitch ;
								}
							}
							else
							{
								for( i = 0 ; i < Height ; i ++ )
								{
									for( j = 0 ; j < Width ; j ++, datB <<= 1 )
									{
										if( ( j % 8 ) == 0 ) datB = sp[j/8] ;
										if( datB & 0x80 )
										{
											D0 = 1 ;
											for( n = 0, l = -EdgeSize ; l < EdgeSize + 1 ; l ++, n ++ )
											{
												for( o = 0, m = -EdgeSize ; m < EdgeSize + 1 ; m ++, o ++ )
												{
													if( CircleImage[ o + CircleImagePitch * n ] == 0 ) continue ;

													p = (WORD *)( dp + (j + m + adp) * 2 + (l * DestPitch) ) ;
													if( *p == 0 ) *p = 1 ;
												}
											}
										}
									}
								
									sp += ImagePitch ;
									dp += DestPitch ;
								}
							}
						}

						if( im.ColorData.ColorBitDepth == 8 )
						{
							dp = DestB - AddX - AddY * DestPitch ;
							if( im.ColorData.MaxPaletteNo == 15 )
							{
								for( i = 0 ; i < Height + AddSize ; i ++ )
								{
									for( j = 0 ; j < Width + AddSize ; j ++ )
									{
										if( DB0 != 0 )
										{
											DB0 = ( BYTE )0x0f ;
											EB0 = ( BYTE )0x00 ;
										}
										else
										{
											DB0 = ( BYTE )0x00 ;
											EB0 = ( BYTE )( E0 != 0 ? 0x0f : 0x00 ) ;
										}
									}

									dp += DestPitch ;
								}
							}
							else
							{
								for( i = 0 ; i < Height + AddSize ; i ++ )
								{
									for( j = 0 ; j < Width + AddSize ; j ++ )
									{
										if( DB0 != 0 )
										{
											DB0 = ( BYTE )0xff ;
											EB0 = ( BYTE )0x00 ;
										}
										else
										{
											DB0 = ( BYTE )0x00 ;
											EB0 = ( BYTE )( E0 != 0 ? 0xff : 0x00 ) ;
										}
									}

									dp += DestPitch ;
								}
							}
						}
						else
						{
							sp = Src   - AddX     - AddY * ImagePitch ;
							dp = DestB - AddX * 2 - AddY * DestPitch ;
							if( ManageData->TextureCacheUsePremulAlpha )
							{
								for( i = 0 ; i < Height + AddSize ; i ++ )
								{
									for( j = 0 ; j < Width + AddSize ; j ++ )
									{
										if( D0 != 0 )
										{
											D0 = ( WORD )AlphaRGBMask ;
											E0 = ( WORD )0 ;
										}
										else
										{
											D0 = ( WORD )0 ;
											E0 = ( WORD )( E0 != 0 ? AlphaRGBMask : 0 ) ;
										}
									}

									sp += ImagePitch ;
									dp += DestPitch ;
								}
							}
							else
							{
								for( i = 0 ; i < Height + AddSize ; i ++ )
								{
									for( j = 0 ; j < Width + AddSize ; j ++ )
									{
										if( D0 != 0 )
										{
											D0 = ( WORD )AlphaRGBMask ;
											E0 = ( WORD )RGBMask ;
										}
										else
										{
											D0 = ( WORD )RGBMask ;
											E0 = ( WORD )( E0 != 0 ? AlphaRGBMask : RGBMask ) ;
										}
									}

									sp += ImagePitch ;
									dp += DestPitch ;
								}
							}
						}
						break ;

					case DX_FONT_SRCIMAGETYPE_8BIT_ON_OFF :
						if( EdgeSize == 1 )
						{
							if( im.ColorData.ColorBitDepth == 8 )
							{
								for( i = 0 ; i < Height ; i ++ )
								{
									for( j = 0 ; j < Width ; j ++ )
									{
										if( sp[ j ] != 0 )
										{
											DB0 = 1 ;
											EB1 = 1 ;
											EB2 = 1 ;
											EB3 = 1 ;
											EB4 = 1 ;
											EB5 = 1 ;
											EB6 = 1 ;
											EB7 = 1 ;
											EB8 = 1 ;
										}
									}
								
									sp += ImagePitch ;
									dp += DestPitch ;
								}
							}
							else
							{
								for( i = 0 ; i < Height ; i ++ )
								{
									for( j = 0 ; j < Width ; j ++ )
									{
										if( sp[ j ] != 0 )
										{
											D0 = 1 ;
											E1 = 1 ;
											E2 = 1 ;
											E3 = 1 ;
											E4 = 1 ;
											E5 = 1 ;
											E6 = 1 ;
											E7 = 1 ;
											E8 = 1 ;
										}
									}
								
									sp += ImagePitch ;
									dp += DestPitch ;
								}
							}
						}
						else
						if( EdgeSize <= FONTEDGE_PATTERN_NUM )
						{
							if( im.ColorData.ColorBitDepth == 8 )
							{
								for( i = 0 ; i < Height ; i ++ )
								{
									for( j = 0 ; j < Width ; j ++ )
									{
										if( sp[ j ] != 0 )
										{
											DB0 = 1 ;
											for( n = 0, l = -EdgeSize ; l < EdgeSize + 1 ; n ++, l ++ )
											{
												for( o = 0, m = -EdgeSize ; m < EdgeSize + 1 ; o ++, m ++ )
												{
													if( EdgePat[n][o] == 0 ) continue ;
											
													pb = dp + ( j + m + adp ) + ( l * DestPitch ) ;
													if( *pb == 0 ) *pb = 1 ;
												}
											}
										}
									}
								
									sp += ImagePitch ;
									dp += DestPitch ;
								}
							}
							else
							{
								for( i = 0 ; i < Height ; i ++ )
								{
									for( j = 0 ; j < Width ; j ++ )
									{
										if( sp[ j ] != 0 )
										{
											D0 = 1 ;
											for( n = 0, l = -EdgeSize ; l < EdgeSize + 1 ; n ++, l ++ )
											{
												for( o = 0, m = -EdgeSize ; m < EdgeSize + 1 ; o ++, m ++ )
												{
													if( EdgePat[n][o] == 0 ) continue ;
											
													p = (WORD *)( dp + (j + m + adp) * 2 + (l * DestPitch) ) ;
													if( *p == 0 ) *p = 1 ;
												}
											}
										}
									}
								
									sp += ImagePitch ;
									dp += DestPitch ;
								}
							}
						}
						else
						{
							if( im.ColorData.ColorBitDepth == 8 )
							{
								for( i = 0 ; i < Height ; i ++ )
								{
									for( j = 0 ; j < Width ; j ++ )
									{
										if( sp[ j ] != 0 )
										{
											DB0 = 1 ;
											for( n = 0, l = -EdgeSize ; l < EdgeSize + 1 ; l ++, n ++ )
											{
												for( o = 0, m = -EdgeSize ; m < EdgeSize + 1 ; m ++, o ++ )
												{
													if( CircleImage[ o + CircleImagePitch * n ] == 0 ) continue ;

													pb = dp + ( j + m + adp ) + ( l * DestPitch ) ;
													if( *pb == 0 ) *pb = 1 ;
												}
											}
										}
									}
								
									sp += ImagePitch ;
									dp += DestPitch ;
								}
							}
							else
							{
								for( i = 0 ; i < Height ; i ++ )
								{
									for( j = 0 ; j < Width ; j ++ )
									{
										if( sp[ j ] != 0 )
										{
											D0 = 1 ;
											for( n = 0, l = -EdgeSize ; l < EdgeSize + 1 ; l ++, n ++ )
											{
												for( o = 0, m = -EdgeSize ; m < EdgeSize + 1 ; m ++, o ++ )
												{
													if( CircleImage[ o + CircleImagePitch * n ] == 0 ) continue ;

													p = (WORD *)( dp + (j + m + adp) * 2 + (l * DestPitch) ) ;
													if( *p == 0 ) *p = 1 ;
												}
											}
										}
									}
								
									sp += ImagePitch ;
									dp += DestPitch ;
								}
							}
						}

						// �e�N�X�`���̃s�N�Z���t�H�[�}�b�g�ɕϊ�
						{
							if( im.ColorData.ColorBitDepth == 8 )
							{
								dp = DestB - AddX - AddY * DestPitch  ;

								if( im.ColorData.MaxPaletteNo == 15 )
								{
									for( i = 0 ; i < Height + AddSize ; i ++ )
									{
										for( j = 0 ; j < Width + AddSize ; j ++ )
										{
											if( DB0 != 0 )
											{
												DB0 = 0x0f ;
												EB0 = 0x00 ;
											}
											else
											{
												DB0 = 0x00 ;
												EB0 = EB0 != 0 ? 0x0f : 0x00 ;
											}
										}

										dp += DestPitch ;
									}
								}
								else
								{
									for( i = 0 ; i < Height + AddSize ; i ++ )
									{
										for( j = 0 ; j < Width + AddSize ; j ++ )
										{
											if( DB0 != 0 )
											{
												DB0 = 0xff ;
												EB0 = 0x00 ;
											}
											else
											{
												DB0 = 0x00 ;
												EB0 = EB0 != 0 ? 0xff : 0x00 ;
											}
										}

										dp += DestPitch ;
									}
								}
							}
							else
							{
								sp = Src   - AddX     - AddY * ImagePitch ;
								dp = DestB - AddX * 2 - AddY * DestPitch  ;
								if( ManageData->TextureCacheUsePremulAlpha )
								{
									for( i = 0 ; i < Height + AddSize ; i ++ )
									{
										for( j = 0 ; j < Width + AddSize ; j ++ )
										{
											if( D0 != 0 )
											{
												D0 = ( WORD )AlphaRGBMask ;
												E0 = ( WORD )0 ;
											}
											else
											{
												D0 = ( WORD )0 ;
												E0 = ( WORD )( E0 != 0 ? AlphaRGBMask : 0 ) ;
											}
										}

										sp += ImagePitch ;
										dp += DestPitch ;
									}
								}
								else
								{
									for( i = 0 ; i < Height + AddSize ; i ++ )
									{
										for( j = 0 ; j < Width + AddSize ; j ++ )
										{
											if( D0 != 0 )
											{
												D0 = ( WORD )AlphaRGBMask ;
												E0 = ( WORD )RGBMask ;
											}
											else
											{
												D0 = ( WORD )RGBMask ;
												E0 = ( WORD )( E0 != 0 ? AlphaRGBMask : RGBMask ) ;
											}
										}

										sp += ImagePitch ;
										dp += DestPitch ;
									}
								}
							}
						}
						break ;
						
					case DX_FONT_SRCIMAGETYPE_8BIT_MAX16 :
						{
							DWORD s ;
							
							if( EdgeSize == 1 )
							{
								if( im.ColorData.ColorBitDepth == 8 )
								{
									for( i = 0 ; i < Height ; i ++ )
									{
										for( j = 0 ; j < Width ; j ++ )
										{
											s = (DWORD)sp[j] ;
											if( s > 0 )
											{
												DB0 = (BYTE)s ;
												EB1 = (BYTE)( E1 + ( ( ( 0x10 - E1 ) * s ) >> 4 ) ) ;
												EB2 = (BYTE)( E2 + ( ( ( 0x10 - E2 ) * s ) >> 4 ) ) ;
												EB3 = (BYTE)( E3 + ( ( ( 0x10 - E3 ) * s ) >> 4 ) ) ;
												EB4 = (BYTE)( E4 + ( ( ( 0x10 - E4 ) * s ) >> 4 ) ) ;
												EB5 = (BYTE)( E5 + ( ( ( 0x10 - E5 ) * s ) >> 4 ) ) ;
												EB6 = (BYTE)( E6 + ( ( ( 0x10 - E6 ) * s ) >> 4 ) ) ;
												EB7 = (BYTE)( E7 + ( ( ( 0x10 - E7 ) * s ) >> 4 ) ) ;
												EB8 = (BYTE)( E8 + ( ( ( 0x10 - E8 ) * s ) >> 4 ) ) ;
											}
										}

										sp += ImagePitch ;
										dp += DestPitch ;
									}
								}
								else
								{
									for( i = 0 ; i < Height ; i ++ )
									{
										for( j = 0 ; j < Width ; j ++ )
										{
											s = (DWORD)sp[j] ;
											if( s > 0 )
											{
												D0 = (WORD)s ;
												E1 = (WORD)( E1 + ( ( ( 0x10 - E1 ) * s ) >> 4 ) ) ;
												E2 = (WORD)( E2 + ( ( ( 0x10 - E2 ) * s ) >> 4 ) ) ;
												E3 = (WORD)( E3 + ( ( ( 0x10 - E3 ) * s ) >> 4 ) ) ;
												E4 = (WORD)( E4 + ( ( ( 0x10 - E4 ) * s ) >> 4 ) ) ;
												E5 = (WORD)( E5 + ( ( ( 0x10 - E5 ) * s ) >> 4 ) ) ;
												E6 = (WORD)( E6 + ( ( ( 0x10 - E6 ) * s ) >> 4 ) ) ;
												E7 = (WORD)( E7 + ( ( ( 0x10 - E7 ) * s ) >> 4 ) ) ;
												E8 = (WORD)( E8 + ( ( ( 0x10 - E8 ) * s ) >> 4 ) ) ;
											}
										}

										sp += ImagePitch ;
										dp += DestPitch ;
									}
								}
							}
							else
							if( EdgeSize <= FONTEDGE_PATTERN_NUM )
							{
								if( im.ColorData.ColorBitDepth == 8 )
								{
									for( i = 0 ; i < Height ; i ++ )
									{
										for( j = 0 ; j < Width ; j ++ )
										{
											s = (DWORD)sp[j] ;
											if( s > 0 )
											{
												DB0 = (BYTE)s ;
												for( n = 0, l = -EdgeSize ; l < EdgeSize + 1 ; n ++, l ++ )
												{
													for( o = 0, m = -EdgeSize ; m < EdgeSize + 1 ; o ++, m ++ )
													{
														if( EdgePat[n][o] == 0 ) continue ;
														pb  = (BYTE *)( dp + (j + m + adp) + (l * DestPitch) ) ;
														*pb = (BYTE)( ( 0x100 - ( ( 0x10 - *pb ) * ( 0x10 - s ) ) ) >> 4 ) ;
													}
												}
											}
										}

										sp += ImagePitch ;
										dp += DestPitch ;
									}
								}
								else
								{
									for( i = 0 ; i < Height ; i ++ )
									{
										for( j = 0 ; j < Width ; j ++ )
										{
											s = (DWORD)sp[j] ;
											if( s > 0 )
											{
												D0 = (WORD)s ;
												for( n = 0, l = -EdgeSize ; l < EdgeSize + 1 ; n ++, l ++ )
												{
													for( o = 0, m = -EdgeSize ; m < EdgeSize + 1 ; o ++, m ++ )
													{
														if( EdgePat[n][o] == 0 ) continue ;
														p = (WORD *)( dp + (j + m + adp) * 2 + (l * DestPitch) ) ;
														*p = (WORD)( ( 0x100 - ( ( 0x10 - *p ) * ( 0x10 - s ) ) ) >> 4 ) ;
													}
												}
											}
										}

										sp += ImagePitch ;
										dp += DestPitch ;
									}
								}
							}
							else
							{
								if( im.ColorData.ColorBitDepth == 8 )
								{
									for( i = 0 ; i < Height ; i ++ )
									{
										for( j = 0 ; j < Width ; j ++ )
										{
											s = (DWORD)sp[j] ;
											if( s > 0 )
											{
												DB0 = (BYTE)s ;
												for( n = 0, l = -EdgeSize ; l < EdgeSize + 1 ; l ++, n ++ )
												{
													for( o = 0, m = -EdgeSize ; m < EdgeSize + 1 ; m ++, o ++ )
													{
														if( CircleImage[ o + CircleImagePitch * n ] == 0 ) continue ;

														pb  = (BYTE *)( dp + (j + m + adp) + (l * DestPitch) ) ;
														*pb = (BYTE)( ( 0x100 - ( ( 0x10 - *pb ) * ( 0x10 - s ) ) ) >> 4 ) ;
													}
												}
											}
										}

										sp += ImagePitch ;
										dp += DestPitch ;
									}
								}
								else
								{
									for( i = 0 ; i < Height ; i ++ )
									{
										for( j = 0 ; j < Width ; j ++ )
										{
											s = (DWORD)sp[j] ;
											if( s > 0 )
											{
												D0 = (WORD)s ;
												for( n = 0, l = -EdgeSize ; l < EdgeSize + 1 ; l ++, n ++ )
												{
													for( o = 0, m = -EdgeSize ; m < EdgeSize + 1 ; m ++, o ++ )
													{
														if( CircleImage[ o + CircleImagePitch * n ] == 0 ) continue ;

														p = (WORD *)( dp + (j + m + adp) * 2 + (l * DestPitch) ) ;
														*p = (WORD)( ( 0x100 - ( ( 0x10 - *p ) * ( 0x10 - s ) ) ) >> 4 ) ;
													}
												}
											}
										}

										sp += ImagePitch ;
										dp += DestPitch ;
									}
								}
							}

							// �e�N�X�`���̃s�N�Z���t�H�[�}�b�g�ɕϊ�
							{
								if( im.ColorData.ColorBitDepth == 8 )
								{
									dp = DestB - AddX - AddY * DestPitch  ;
									if( im.ColorData.MaxPaletteNo == 15 )
									{
										for( i = 0 ; i < Height + AddSize ; i ++ )
										{
											for( j = 0 ; j < Width + AddSize ; j ++ )
											{
												if( DB0 == 16 )
												{
													DB0 = 0x0f ;
													EB0 = 0x00 ;
												}
												else
												{
													if( DB0 )
													{
														DB0 = ( BYTE )( DB0 - 1 ) ;
													}
													else
													{
														DB0 = 0x00 ;
													}

													if( EB0 )
													{
														EB0 = ( BYTE )( EB0 - 1 ) ;
													}
													else
													{
														EB0 = 0x00 ;
													}
												}
											}

											dp += DestPitch ;
										}
									}
									else
									{
										for( i = 0 ; i < Height + AddSize ; i ++ )
										{
											for( j = 0 ; j < Width + AddSize ; j ++ )
											{
												if( DB0 == 16 )
												{
													DB0 = 0xff ;
													EB0 = 0x00 ;
												}
												else
												{
													if( DB0 )
													{
														DB0 = ( BYTE )( ( DB0 << 4 ) - 1 ) ;
													}
													else
													{
														DB0 = 0x00 ;
													}

													if( EB0 )
													{
														EB0 = ( BYTE )( ( EB0 << 4 ) - 1 ) ;
													}
													else
													{
														EB0 = 0x00 ;
													}
												}
											}

											dp += DestPitch ;
										}
									}
								}
								else
								{
									BYTE aloc, rloc, gloc, bloc ;

									aloc = ( BYTE )( ( cl.AlphaLoc + cl.AlphaWidth ) - 4 ) ;
									rloc = ( BYTE )( ( cl.RedLoc   + cl.RedWidth   ) - 4 ) ;
									gloc = ( BYTE )( ( cl.GreenLoc + cl.GreenWidth ) - 4 ) ;
									bloc = ( BYTE )( ( cl.BlueLoc  + cl.BlueWidth  ) - 4 ) ;

									sp = Src   - AddX     - AddY * ImagePitch ;
									dp = DestB - AddX * 2 - AddY * DestPitch  ;
									if( ManageData->TextureCacheUsePremulAlpha )
									{
										for( i = 0 ; i < Height + AddSize ; i ++ )
										{
											for( j = 0 ; j < Width + AddSize ; j ++ )
											{
												if( D0 == 16 )
												{
													D0 = ( WORD )0xffff ;
													E0 = 0 ;
												}
												else
												{
													if( D0 )
													{
														D0 = ( WORD )( ( (DWORD)D0 << aloc ) | ( (DWORD)D0 << rloc ) | ( (DWORD)D0 << gloc ) | ( (DWORD)D0 << bloc ) ) ;
													}

													if( E0 == 16 )
													{
														E0 = ( WORD )0xffff ;
													}
													else
													if( E0 )
													{
														E0 = ( WORD )( ( (DWORD)E0 << aloc ) | ( (DWORD)E0 << rloc ) | ( (DWORD)E0 << gloc ) | ( (DWORD)E0 << bloc ) ) ;
													}
												}
											}

											sp += ImagePitch ;
											dp += DestPitch ;
										}
									}
									else
									{
										for( i = 0 ; i < Height + AddSize ; i ++ )
										{
											for( j = 0 ; j < Width + AddSize ; j ++ )
											{
												if( D0 == 16 )
												{
													D0 = ( WORD )( ( ( (DWORD)D0 << aloc ) - 1 ) | RGBMask ) ;
													E0 = (WORD)RGBMask ;
												}
												else
												{
													if( D0 )
													{
														D0 = ( WORD )( ( ( (DWORD)D0 << aloc ) - 1 ) | RGBMask ) ;
													}
													else
													{
														D0 = (WORD)RGBMask ;
													}

													if( E0 )
													{
														E0 = ( WORD )( ( ( (DWORD)E0 << aloc ) - 1 ) | RGBMask ) ;
													}
													else
													{
														E0 = (WORD)RGBMask ;
													}
												}
											}

											sp += ImagePitch ;
											dp += DestPitch ;
										}
									}
								}
							}
						}
						break ;

					case DX_FONT_SRCIMAGETYPE_8BIT_MAX64 :
						{
							DWORD s ;
							
							if( EdgeSize == 1 )
							{
								if( im.ColorData.ColorBitDepth == 8 )
								{
									for( i = 0 ; i < Height ; i ++ )
									{
										for( j = 0 ; j < Width ; j ++ )
										{
											s = (DWORD)sp[j] ;
											if( s > 0 )
											{
												DB0 = (BYTE)s ;
												EB1 = (BYTE)( EB1 + ( ( ( 0x40 - EB1 ) * s ) >> 6 ) ) ;
												EB2 = (BYTE)( EB2 + ( ( ( 0x40 - EB2 ) * s ) >> 6 ) ) ;
												EB3 = (BYTE)( EB3 + ( ( ( 0x40 - EB3 ) * s ) >> 6 ) ) ;
												EB4 = (BYTE)( EB4 + ( ( ( 0x40 - EB4 ) * s ) >> 6 ) ) ;
												EB5 = (BYTE)( EB5 + ( ( ( 0x40 - EB5 ) * s ) >> 6 ) ) ;
												EB6 = (BYTE)( EB6 + ( ( ( 0x40 - EB6 ) * s ) >> 6 ) ) ;
												EB7 = (BYTE)( EB7 + ( ( ( 0x40 - EB7 ) * s ) >> 6 ) ) ;
												EB8 = (BYTE)( EB8 + ( ( ( 0x40 - EB8 ) * s ) >> 6 ) ) ;
											}
										}

										sp += ImagePitch ;
										dp += DestPitch ;
									}
								}
								else
								{
									for( i = 0 ; i < Height ; i ++ )
									{
										for( j = 0 ; j < Width ; j ++ )
										{
											s = (DWORD)sp[j] ;
											if( s > 0 )
											{
												DD0 = (DWORD)s ;
												ED1 = (DWORD)( ED1 + ( ( ( 0x40 - ED1 ) * s ) >> 6 ) ) ;
												ED2 = (DWORD)( ED2 + ( ( ( 0x40 - ED2 ) * s ) >> 6 ) ) ;
												ED3 = (DWORD)( ED3 + ( ( ( 0x40 - ED3 ) * s ) >> 6 ) ) ;
												ED4 = (DWORD)( ED4 + ( ( ( 0x40 - ED4 ) * s ) >> 6 ) ) ;
												ED5 = (DWORD)( ED5 + ( ( ( 0x40 - ED5 ) * s ) >> 6 ) ) ;
												ED6 = (DWORD)( ED6 + ( ( ( 0x40 - ED6 ) * s ) >> 6 ) ) ;
												ED7 = (DWORD)( ED7 + ( ( ( 0x40 - ED7 ) * s ) >> 6 ) ) ;
												ED8 = (DWORD)( ED8 + ( ( ( 0x40 - ED8 ) * s ) >> 6 ) ) ;
											}
										}

										sp += ImagePitch ;
										dp += DestPitch ;
									}
								}
							}
							else
							if( EdgeSize <= FONTEDGE_PATTERN_NUM )
							{
								if( im.ColorData.ColorBitDepth == 8 )
								{
									for( i = 0 ; i < Height ; i ++ )
									{
										for( j = 0 ; j < Width ; j ++ )
										{
											s = (DWORD)sp[j] ;
											if( s > 0 )
											{
												DB0 = (BYTE)s ;
												for( n = 0, l = -EdgeSize ; l < EdgeSize + 1 ; n ++, l ++ )
												{
													for( o = 0, m = -EdgeSize ; m < EdgeSize + 1 ; o ++, m ++ )
													{
														if( EdgePat[n][o] == 0 ) continue ;
														pb  = (BYTE *)( dp + (j + m + adp) + (l * DestPitch) ) ;
														*pb = (BYTE)( *pb + ( ( ( 0x40 - *pb ) * s ) >> 6 ) ) ;
													}
												}
											}
										}

										sp += ImagePitch ;
										dp += DestPitch ;
									}
								}
								else
								{
									for( i = 0 ; i < Height ; i ++ )
									{
										for( j = 0 ; j < Width ; j ++ )
										{
											s = (DWORD)sp[j] ;
											if( s > 0 )
											{
												DD0 = (DWORD)s ;
												for( n = 0, l = -EdgeSize ; l < EdgeSize + 1 ; n ++, l ++ )
												{
													for( o = 0, m = -EdgeSize ; m < EdgeSize + 1 ; o ++, m ++ )
													{
														if( EdgePat[n][o] == 0 ) continue ;
														pd = (DWORD *)( dp + (j + m + adp) * 4 + (l * DestPitch) ) ;
														*pd = (DWORD)( *pd + ( ( ( 0x40 - *pd ) * s ) >> 6 ) ) ;
													}
												}
											}
										}

										sp += ImagePitch ;
										dp += DestPitch ;
									}
								}
							}
							else
							{
								if( im.ColorData.ColorBitDepth == 8 )
								{
									for( i = 0 ; i < Height ; i ++ )
									{
										for( j = 0 ; j < Width ; j ++ )
										{
											s = (DWORD)sp[j] ;
											if( s > 0 )
											{
												DB0 = (BYTE)s ;
												for( n = 0, l = -EdgeSize ; l < EdgeSize + 1 ; l ++, n ++ )
												{
													for( o = 0, m = -EdgeSize ; m < EdgeSize + 1 ; m ++, o ++ )
													{
														if( CircleImage[ o + CircleImagePitch * n ] == 0 ) continue ;

														pb  = (BYTE *)( dp + (j + m + adp) + (l * DestPitch) ) ;
														*pb = (BYTE)( *pb + ( ( ( 0x40 - *pb ) * s ) >> 6 ) ) ;
													}
												}
											}
										}

										sp += ImagePitch ;
										dp += DestPitch ;
									}
								}
								else
								{
									for( i = 0 ; i < Height ; i ++ )
									{
										for( j = 0 ; j < Width ; j ++ )
										{
											s = (DWORD)sp[j] ;
											if( s > 0 )
											{
												DD0 = (DWORD)s ;
												for( n = 0, l = -EdgeSize ; l < EdgeSize + 1 ; l ++, n ++ )
												{
													for( o = 0, m = -EdgeSize ; m < EdgeSize + 1 ; m ++, o ++ )
													{
														if( CircleImage[ o + CircleImagePitch * n ] == 0 ) continue ;

														pd = (DWORD *)( dp + (j + m + adp) * 4 + (l * DestPitch) ) ;
														*pd = (DWORD)( *pd + ( ( ( 0x40 - *pd ) * s ) >> 6 ) ) ;
													}
												}
											}
										}

										sp += ImagePitch ;
										dp += DestPitch ;
									}
								}
							}

							// �e�N�X�`���̃s�N�Z���t�H�[�}�b�g�ɕϊ�
							{
								static BYTE NumConvTable[ 0x41 ] =
								{
									  0,   3,   7,  11,  15,  19,  23,  27,  31,  35,  39,  43,  47,  51,  55,  59, 
									 63,  67,  71,  75,  79,  83,  87,  91,  95,  99, 103, 107, 111, 115, 119, 123, 
									127, 131, 135, 139, 143, 147, 151, 155, 159, 163, 167, 171, 175, 179, 183, 187, 
									191, 195, 199, 203, 207, 211, 215, 219, 223, 227, 231, 235, 239, 243, 247, 251, 
									255, 
								} ;

								if( im.ColorData.ColorBitDepth == 8 )
								{
									dp = DestB - AddX - AddY * DestPitch  ;

									if( im.ColorData.MaxPaletteNo == 15 )
									{
										for( i = 0 ; i < Height + AddSize ; i ++ )
										{
											for( j = 0 ; j < Width + AddSize ; j ++ )
											{
												if( DB0 == 64 )
												{
													DB0 = 0x0f ;
													EB0 = 0x00 ;
												}
												else
												{
													if( DB0 )
													{
														DB0 = ( BYTE )( DB0 >> 2 ) ;
													}
													else
													{
														DB0 = 0x00 ;
													}

													if( EB0 )
													{
														EB0 = ( BYTE )( EB0 >> 2 ) ;
													}
													else
													{
														EB0 = 0x00 ;
													}
												}
											}

											dp += DestPitch ;
										}
									}
									else
									{
										for( i = 0 ; i < Height + AddSize ; i ++ )
										{
											for( j = 0 ; j < Width + AddSize ; j ++ )
											{
												DB0 = ( BYTE )NumConvTable[ DB0 ] ;
												EB0 = ( BYTE )NumConvTable[ EB0 ] ;
											}

											dp += DestPitch ;
										}
									}
								}
								else
								{
									sp = Src   - AddX     - AddY * ImagePitch ;
									dp = DestB - AddX * 4 - AddY * DestPitch  ;
									if( ManageData->TextureCacheUsePremulAlpha )
									{
										DWORD tmp ;

										for( i = 0 ; i < Height + AddSize ; i ++ )
										{
											for( j = 0 ; j < Width + AddSize ; j ++ )
											{
												if( DD0 == 64 )
												{
													DD0 = 0xffffffff ;
													ED0 = 0 ;
												}
												else
												{
													if( DD0 )
													{
														tmp = NumConvTable[ DD0 ] ;
														DD0 = ( DWORD )( ( tmp << cl.AlphaLoc ) | ( tmp << cl.RedLoc ) | ( tmp << cl.GreenLoc ) | ( tmp << cl.BlueLoc ) ) ;
													}

													if( ED0 == 64 )
													{
														ED0 = 0xffffffff ;
													}
													else
													if( ED0 )
													{
														tmp = NumConvTable[ ED0 ] ;
														ED0 = ( DWORD )( ( tmp << cl.AlphaLoc ) | ( tmp << cl.RedLoc ) | ( tmp << cl.GreenLoc ) | ( tmp << cl.BlueLoc ) ) ;
													}
												}
											}

											sp += ImagePitch ;
											dp += DestPitch ;
										}
									}
									else
									{
										for( i = 0 ; i < Height + AddSize ; i ++ )
										{
											for( j = 0 ; j < Width + AddSize ; j ++ )
											{
												if( DD0 == 64 )
												{
													DD0 = AlphaRGBMask ;
													ED0 = (DWORD)RGBMask ;
												}
												else
												{
													if( DD0 )
													{
														DD0 = ( DWORD )( ( ( DWORD )NumConvTable[ DD0 ] << cl.AlphaLoc ) | RGBMask ) ;
													}
													else
													{
														DD0 = (DWORD)RGBMask ;
													}

													if( ED0 )
													{
														ED0 = ( DWORD )( ( ( DWORD )NumConvTable[ ED0 ] << cl.AlphaLoc ) | RGBMask ) ;
													}
													else
													{
														ED0 = (DWORD)RGBMask ;
													}
												}
											}

											sp += ImagePitch ;
											dp += DestPitch ;
										}
									}
								}
							}
						}
						break ;

					case DX_FONT_SRCIMAGETYPE_8BIT_MAX255 :
						{
							DWORD s ;
							
							if( EdgeSize == 1 )
							{
								if( im.ColorData.ColorBitDepth == 8 )
								{
									for( i = 0 ; i < Height ; i ++ )
									{
										for( j = 0 ; j < Width ; j ++ )
										{
											s = (DWORD)sp[j] ;
											if( s > 0 )
											{
												DB0 = (BYTE)s ;
												EB1 = (BYTE)( EB1 + ( ( ( 0xff - EB1 ) * s ) >> 8 ) ) ;
												EB2 = (BYTE)( EB2 + ( ( ( 0xff - EB2 ) * s ) >> 8 ) ) ;
												EB3 = (BYTE)( EB3 + ( ( ( 0xff - EB3 ) * s ) >> 8 ) ) ;
												EB4 = (BYTE)( EB4 + ( ( ( 0xff - EB4 ) * s ) >> 8 ) ) ;
												EB5 = (BYTE)( EB5 + ( ( ( 0xff - EB5 ) * s ) >> 8 ) ) ;
												EB6 = (BYTE)( EB6 + ( ( ( 0xff - EB6 ) * s ) >> 8 ) ) ;
												EB7 = (BYTE)( EB7 + ( ( ( 0xff - EB7 ) * s ) >> 8 ) ) ;
												EB8 = (BYTE)( EB8 + ( ( ( 0xff - EB8 ) * s ) >> 8 ) ) ;
											}
										}

										sp += ImagePitch ;
										dp += DestPitch ;
									}
								}
								else
								{
									for( i = 0 ; i < Height ; i ++ )
									{
										for( j = 0 ; j < Width ; j ++ )
										{
											s = (DWORD)sp[j] ;
											if( s > 0 )
											{
												DD0 = (DWORD)s ;
												ED1 = (DWORD)( ED1 + ( ( ( 0xff - ED1 ) * s ) >> 8 ) ) ;
												ED2 = (DWORD)( ED2 + ( ( ( 0xff - ED2 ) * s ) >> 8 ) ) ;
												ED3 = (DWORD)( ED3 + ( ( ( 0xff - ED3 ) * s ) >> 8 ) ) ;
												ED4 = (DWORD)( ED4 + ( ( ( 0xff - ED4 ) * s ) >> 8 ) ) ;
												ED5 = (DWORD)( ED5 + ( ( ( 0xff - ED5 ) * s ) >> 8 ) ) ;
												ED6 = (DWORD)( ED6 + ( ( ( 0xff - ED6 ) * s ) >> 8 ) ) ;
												ED7 = (DWORD)( ED7 + ( ( ( 0xff - ED7 ) * s ) >> 8 ) ) ;
												ED8 = (DWORD)( ED8 + ( ( ( 0xff - ED8 ) * s ) >> 8 ) ) ;
											}
										}

										sp += ImagePitch ;
										dp += DestPitch ;
									}
								}
							}
							else
							if( EdgeSize <= FONTEDGE_PATTERN_NUM )
							{
								if( im.ColorData.ColorBitDepth == 8 )
								{
									for( i = 0 ; i < Height ; i ++ )
									{
										for( j = 0 ; j < Width ; j ++ )
										{
											s = (DWORD)sp[j] ;
											if( s > 0 )
											{
												DB0 = (BYTE)s ;
												for( n = 0, l = -EdgeSize ; l < EdgeSize + 1 ; n ++, l ++ )
												{
													for( o = 0, m = -EdgeSize ; m < EdgeSize + 1 ; o ++, m ++ )
													{
														if( EdgePat[n][o] == 0 ) continue ;
														pb  = (BYTE *)( dp + (j + m + adp) + (l * DestPitch) ) ;
														*pb = (BYTE )( *pb + ( ( ( 0xff - *pb ) * s ) >> 8 ) ) ;
													}
												}
											}
										}

										sp += ImagePitch ;
										dp += DestPitch ;
									}
								}
								else
								{
									for( i = 0 ; i < Height ; i ++ )
									{
										for( j = 0 ; j < Width ; j ++ )
										{
											s = (DWORD)sp[j] ;
											if( s > 0 )
											{
												DD0 = (DWORD)s ;
												for( n = 0, l = -EdgeSize ; l < EdgeSize + 1 ; n ++, l ++ )
												{
													for( o = 0, m = -EdgeSize ; m < EdgeSize + 1 ; o ++, m ++ )
													{
														if( EdgePat[n][o] == 0 ) continue ;
														pd = (DWORD *)( dp + (j + m + adp) * 4 + (l * DestPitch) ) ;
														*pd = (DWORD)( *pd + ( ( ( 0xff - *pd ) * s ) >> 8 ) ) ;
													}
												}
											}
										}

										sp += ImagePitch ;
										dp += DestPitch ;
									}
								}
							}
							else
							{
								if( im.ColorData.ColorBitDepth == 8 )
								{
									for( i = 0 ; i < Height ; i ++ )
									{
										for( j = 0 ; j < Width ; j ++ )
										{
											s = (DWORD)sp[j] ;
											if( s > 0 )
											{
												DB0 = (BYTE)s ;
												for( n = 0, l = -EdgeSize ; l < EdgeSize + 1 ; l ++, n ++ )
												{
													for( o = 0, m = -EdgeSize ; m < EdgeSize + 1 ; m ++, o ++ )
													{
														if( CircleImage[ o + CircleImagePitch * n ] == 0 ) continue ;

														pb  = (BYTE *)( dp + (j + m + adp) + (l * DestPitch) ) ;
														*pb = (BYTE)( *pb + ( ( ( 0xff - *pb ) * s ) >> 8 ) ) ;
													}
												}
											}
										}

										sp += ImagePitch ;
										dp += DestPitch ;
									}
								}
								else
								{
									for( i = 0 ; i < Height ; i ++ )
									{
										for( j = 0 ; j < Width ; j ++ )
										{
											s = (DWORD)sp[j] ;
											if( s > 0 )
											{
												DD0 = (DWORD)s ;
												for( n = 0, l = -EdgeSize ; l < EdgeSize + 1 ; l ++, n ++ )
												{
													for( o = 0, m = -EdgeSize ; m < EdgeSize + 1 ; m ++, o ++ )
													{
														if( CircleImage[ o + CircleImagePitch * n ] == 0 ) continue ;

														pd = (DWORD *)( dp + (j + m + adp) * 4 + (l * DestPitch) ) ;
														*pd = (DWORD)( *pd + ( ( ( 0xff - *pd ) * s ) >> 8 ) ) ;
													}
												}
											}
										}

										sp += ImagePitch ;
										dp += DestPitch ;
									}
								}
							}

							// �e�N�X�`���̃s�N�Z���t�H�[�}�b�g�ɕϊ�
							{
								if( im.ColorData.ColorBitDepth == 8 )
								{
									dp = DestB - AddX * 4 - AddY * DestPitch ;
									if( im.ColorData.MaxPaletteNo == 15 )
									{
										for( i = 0 ; i < Height + AddSize ; i ++ )
										{
											for( j = 0 ; j < Width + AddSize ; j ++ )
											{
												DB0 = ( BYTE )( DB0 >> 4 ) ;
												EB0 = ( BYTE )( EB0 >> 4 ) ;
											}

											dp += DestPitch ;
										}
									}
									else
									{
									}
								}
								else
								{
									sp = Src - AddX - AddY * ImagePitch ;
									dp = DestB - AddX * 4 - AddY * DestPitch ;
									if( ManageData->TextureCacheUsePremulAlpha )
									{
										DWORD tmp ;

										for( i = 0 ; i < Height + AddSize ; i ++ )
										{
											for( j = 0 ; j < Width + AddSize ; j ++ )
											{
												tmp = DD0 ;
												DD0 = ( DWORD )( ( tmp << cl.AlphaLoc ) | ( tmp << cl.RedLoc ) | ( tmp << cl.GreenLoc ) | ( tmp << cl.BlueLoc ) ) ;

												tmp = ED0 ;
												ED0 = ( DWORD )( ( tmp << cl.AlphaLoc ) | ( tmp << cl.RedLoc ) | ( tmp << cl.GreenLoc ) | ( tmp << cl.BlueLoc ) ) ;
											}

											sp += ImagePitch ;
											dp += DestPitch ;
										}
									}
									else
									{
										for( i = 0 ; i < Height + AddSize ; i ++ )
										{
											for( j = 0 ; j < Width + AddSize ; j ++ )
											{
												DD0 = ( DWORD )( ( ( DWORD )DD0 << cl.AlphaLoc ) | RGBMask ) ;
												ED0 = ( DWORD )( ( ( DWORD )ED0 << cl.AlphaLoc ) | RGBMask ) ;
											}

											sp += ImagePitch ;
											dp += DestPitch ;
										}
									}
								}
							}
						}
						break ;
					}
				}
	#undef ED0
	#undef ED1
	#undef ED2
	#undef ED3
	#undef ED4
	#undef ED5
	#undef ED6
	#undef ED7
	#undef ED8

	#undef DD0
	#undef DD1
	#undef DD2
	#undef DD3
	#undef DD4

	#undef E0
	#undef E1
	#undef E2
	#undef E3
	#undef E4
	#undef E5
	#undef E6
	#undef E7
	#undef E8

	#undef D0
	#undef D1
	#undef D2
	#undef D3
	#undef D4

	#undef EB0
	#undef EB1
	#undef EB2
	#undef EB3
	#undef EB4
	#undef EB5
	#undef EB6
	#undef EB7
	#undef EB8

	#undef DB0
	#undef DB1
	#undef DB2
	#undef DB3
	#undef DB4

#ifndef DX_NON_GRAPHICS
				// �e�N�X�`���L���b�V���ɓ]��
				if( TextureCacheUpdate )
				{
					RECT srect ;

//					SETRECT( srect, 0, 0, CharData->SizeX + AddSize, CharData->SizeY + AddSize ) ;
					SETRECT(
						srect,
						DestX - 1,
						DestY - 1,
						ManageData->BaseInfo.MaxWidth + DestX - 1,
						ManageData->BaseInfo.MaxWidth + DestY - 1
					) ;
//					Graphics_Image_BltBmpOrGraphImageToGraph2Base(
//						&im,
//						NULL,
//						&srect,
//						DestX - 1,
//						DestY - 1,
//						ManageData->TextureCache,
//						GSYS.CreateImage.NotUseTransColor ? FALSE : TRUE
//					) ;
					FontTextureCacheAddUpdateRect( ManageData, &srect ) ;
//					FontTextureCacheUpdateRectApply( ManageData ) ;

					srect.left  += adp ;
					srect.right += adp ;
//					Graphics_Image_BltBmpOrGraphImageToGraph2Base(
//						&im,
//						NULL,
//						&srect,
//						DestX - 1 + ManageData->CacheImageSize.cx,
//						DestY - 1,
//						ManageData->TextureCache,
//						GSYS.CreateImage.NotUseTransColor ? FALSE : TRUE
//					) ;
				}
#endif // DX_NON_GRAPHICS
			}
		}

		// �T�C�Y�␳
		CharData->AddX  += ( short )AddSize ;
		CharData->SizeX += ( WORD  )AddSize ;
		CharData->SizeY += ( WORD  )AddSize ;
	}

	// �e�[�u���Ɏ��܂�͈͂̏ꍇ�̓R�[�h�̃��X�g�^�f�[�^�ɓo�^
	if( CharCode <= 0xffff && IVSCode == 0 )
	{
		CodeData = &ManageData->CodeData[ CharCode ] ; 
		CodeData->ExistFlag	= TRUE ;
		CodeData->CharData	= CharData ;
		CharData->CodeData	= CodeData ;
	}
	else
	// �e�[�u���Ɏ��܂�Ȃ��͈͂̏ꍇ�͕ʂ̃��X�g�ɓo�^
	{
		CharData->CodeData	= NULL ;

		// �����ő吔�ɒB���Ă����������ɂ���
		if( ManageData->CodeDataExNum == FONT_CACHE_EX_NUM )
		{
			int DelIndex ;
			for( DelIndex = 0 ; ManageData->CodeDataEx[ DelIndex ] == CharData ; DelIndex ++ ){}
			ManageData->CodeDataEx[ DelIndex ]->ValidFlag = FALSE ;

			ManageData->CodeDataExNum -- ;
			if( ManageData->CodeDataExNum - DelIndex > 0 )
			{
				_MEMMOVE( &ManageData->CodeDataEx[ DelIndex ], &ManageData->CodeDataEx[ DelIndex + 1 ], sizeof( FONTCHARDATA * ) * ( ManageData->CodeDataExNum - DelIndex ) ) ;
			}
		}
		ManageData->CodeDataEx[ ManageData->CodeDataExNum ] = CharData ;
		ManageData->CodeDataExNum ++ ;
	}

	// ����L���ɂ���
	CharData->ValidFlag = TRUE ;

	// �O���t�B�b�N�n���h�����ǂ����̃t���O��|��
	CharData->GraphHandleFlag = FALSE ;

//	// ���T�C�Y�����p�̃��������m�ۂ��Ă����ꍇ�͉��
//	if( ResizeBuffer != NULL )
//	{
//		DXFREE( ResizeBuffer ) ;
//		ResizeBuffer = NULL ;
//	}

	// �I��
	return 0 ;
}

// �t�H���g�̃e�N�X�`���L���b�V���̍X�V��`��ǉ�����
extern int FontTextureCacheAddUpdateRect( FONTMANAGE *ManageData, RECT *Rect )
{
	if( ManageData->TextureCacheUpdateRectValid == FALSE )
	{
		ManageData->TextureCacheUpdateRectValid = TRUE ;
		ManageData->TextureCacheUpdateRect = *Rect ;
	}
	else
	{
		if( ManageData->TextureCacheUpdateRect.left > Rect->left )
		{
			ManageData->TextureCacheUpdateRect.left = Rect->left ;
		}

		if( ManageData->TextureCacheUpdateRect.top > Rect->top )
		{
			ManageData->TextureCacheUpdateRect.top = Rect->top ;
		}

		if( ManageData->TextureCacheUpdateRect.right < Rect->right )
		{
			ManageData->TextureCacheUpdateRect.right = Rect->right ;
		}

		if( ManageData->TextureCacheUpdateRect.bottom < Rect->bottom )
		{
			ManageData->TextureCacheUpdateRect.bottom = Rect->bottom ;
		}
	}

	return 0 ;
}

// �t�H���g�̃e�N�X�`���L���b�V���̍X�V��`�����ۂ̃e�N�X�`���ɓK�p����
extern int FontTextureCacheUpdateRectApply( FONTMANAGE *ManageData )
{
	if( ManageData->TextureCacheUpdateRectValid == FALSE )
	{
		return 0 ;
	}

	ManageData->TextureCacheUpdateRectValid = FALSE ;

	Graphics_Image_BltBmpOrGraphImageToGraph2Base(
		&ManageData->TextureCacheBaseImage, NULL,
		&ManageData->TextureCacheUpdateRect,
		ManageData->TextureCacheUpdateRect.left,
		ManageData->TextureCacheUpdateRect.top,
		ManageData->TextureCache,
		GSYS.CreateImage.NotUseTransColor ? FALSE : TRUE
	) ;

	// ������̏ꍇ�͉��p�̕������X�V����
	if( ( ManageData->FontType & DX_FONTTYPE_EDGE ) != 0 )
	{
		RECT SrcRect ;

		SrcRect.left   = ManageData->TextureCacheUpdateRect.left  + ManageData->TextureCacheBaseImage.Width / 2 ;
		SrcRect.top    = ManageData->TextureCacheUpdateRect.top ;
		SrcRect.right  = ManageData->TextureCacheUpdateRect.right + ManageData->TextureCacheBaseImage.Width / 2 ;
		SrcRect.bottom = ManageData->TextureCacheUpdateRect.bottom ;
		Graphics_Image_BltBmpOrGraphImageToGraph2Base(
			&ManageData->TextureCacheBaseImage, NULL,
			&SrcRect,
			SrcRect.left,
			SrcRect.top,
			ManageData->TextureCache,
			GSYS.CreateImage.NotUseTransColor ? FALSE : TRUE
		) ;
	}

	return 0 ;
}

// �t�H���g�n���h���ɐݒ肳��Ă��镶���R�[�h�`�����擾����( �߂�l  -1:�G���[  -1�ȊO:�����R�[�h�`�� )
extern int GetFontHandleCharCodeFormat( int FontHandle )
{
	FONTMANAGE * ManageData ;

	if( FONTHCHK( FontHandle, ManageData ) )
	{
		return -1 ;
	}

	if( ManageData->UseCharCodeFormat >= 0 )
	{
		return ManageData->UseCharCodeFormat ;
	}

	return ( int )( ManageData->BaseInfo.CharCodeFormat == 0xffff ? _TCHARCODEFORMAT : ManageData->BaseInfo.CharCodeFormat ) ;
}


// �����L���b�V���̃Z�b�g�A�b�v���s��
extern int SetupFontCache( CREATEFONTTOHANDLE_GPARAM *GParam, FONTMANAGE *ManageData, int ASyncThread )
{
	// �t�H���g�ɃG�b�W������ꍇ�͍ő�T�C�Y�{(�G�b�W�̃T�C�Y�~�Q)�ɂ���
	if( ManageData->FontType & DX_FONTTYPE_EDGE )
	{
		ManageData->BaseInfo.MaxWidth += ( WORD )( ManageData->EdgeSize * 2 ) ;
	}

	// �t�H���g�̍ő啝�� 8 �̔{���ɂ���
	ManageData->BaseInfo.MaxWidth = ( WORD )( ( ManageData->BaseInfo.MaxWidth + 7 ) / 8 * 8 ) ;

	// �t�H���g�ɃG�b�W������ꍇ�͍ő�T�C�Y�{(�G�b�W�̃T�C�Y�~�Q)�ɂ���
	if( ManageData->FontType & DX_FONTTYPE_EDGE )
	{
		ManageData->BaseInfo.FontHeight += ( WORD )( ManageData->EdgeSize * 2 ) ;
	}

	// �t�H���g�̍������Q�̔{���ɂ���
	ManageData->BaseInfo.FontHeight = ( ManageData->BaseInfo.FontHeight + 1 ) / 2 * 2 ;

	// �t�H���g�̍����̕����ő啝���傫��������ő啝���t�H���g�̍����ɂ���
	if( ManageData->BaseInfo.MaxWidth < ManageData->BaseInfo.FontHeight )
	{
		ManageData->BaseInfo.MaxWidth = ManageData->BaseInfo.FontHeight;
	}

	// �e�N�X�`���L���b�V�����g�p���邩�ǂ���������
#ifndef DX_NON_GRAPHICS
	ManageData->TextureCacheFlag           = GSYS.Setting.ValidHardware && GParam->NotTextureFlag == FALSE && GSYS.Screen.UserScreenImagePixelFormatMatchSoftRenderMode == FALSE ? TRUE : FALSE ;
#else // DX_NON_GRAPHICS
	ManageData->TextureCacheFlag           = FALSE ;
#endif // DX_NON_GRAPHICS
	ManageData->TextureCacheColorBitDepth  = ManageData->TextureCacheFlag == FALSE || ( ManageData->FontType & DX_FONTTYPE_ANTIALIASING ) == 0 || GParam->TextureCacheColorBitDepth16Flag ? 16 : 32 ;
	ManageData->TextureCacheUsePremulAlpha = GParam->UsePremulAlphaFlag ;

	ManageData->TextureCacheUpdateRectValid		= FALSE ;
	ManageData->TextureCacheUpdateRect.left		= 0 ;
	ManageData->TextureCacheUpdateRect.top		= 0 ;
	ManageData->TextureCacheUpdateRect.right	= 0 ;
	ManageData->TextureCacheUpdateRect.bottom	= 0 ;

#ifndef DX_NON_GRAPHICS
	// �L���b�V���ł���ő啶����������
R1 :
	if( ManageData->TextureCacheFlag == TRUE )
	{
		int ScreenArea85per ;
		int CharNum ;

		// �e�N�X�`���L���b�V�����g�p����ꍇ

		// ��ʖʐς̂W�T�������߂Ă���
		ScreenArea85per = GSYS.Screen.MainScreenSizeX * GSYS.Screen.MainScreenSizeY * 85 / 100 ;

		// �e�N�X�`���T�C�Y������o��
		{
			int MaxSizeW = ( ManageData->FontType & DX_FONTTYPE_EDGE ) != 0 ? GSYS.HardInfo.MaxTextureSize / 2 : GSYS.HardInfo.MaxTextureSize ;
			int MaxSizeH = GSYS.HardInfo.MaxTextureSize ;

			// �����_�ł̓e�N�X�`���L���b�V���̍ő�T�C�Y�� 8192x8192 �ɂ���
			if( MaxSizeW > 8192 ) MaxSizeW = 8192 ;
			if( MaxSizeH > 8192 ) MaxSizeH = 8192 ;

			ManageData->CacheImageSize.cx = 8 ;
			ManageData->CacheImageSize.cy = 8 ;
			for(;;)
			{
				// �L���b�V���ł��镶�������L���b�V���ł���ő吔�𒴂��Ă����烋�[�v�I��
				CharNum = ( ManageData->CacheImageSize.cx / ManageData->BaseInfo.MaxWidth ) *
						  ( ManageData->CacheImageSize.cy / ManageData->BaseInfo.MaxWidth ) ;
				if( CharNum >= FONT_CACHE_MAXNUM )
				{
					// �L���b�V���ł��镶�������L���b�V���ł���ő吔�ɐ���
					CharNum = FONT_CACHE_MAXNUM ;
					break ;
				}

				// �L���b�V���ł��镶��������������Ă��邩�ǂ����ŏ����𕪊�
				if( GParam->CacheCharNum > 0 )
				{
					// ��������Ă���ꍇ�̓L���b�V���ł��镶������
					// �w��̃L���b�V���������ȏ�ɂȂ��Ă����烋�[�v�I��
					if( CharNum >= GParam->CacheCharNum )
					{
						break ;
					}
				}
				else
				{
					// ��������Ă��Ȃ��ꍇ�̓e�N�X�`���ʐς���ʃT�C�Y�̂W�T���𒴂��Ă���
					// ���L���b�V���ł��镶�������P�O�����𒴂��Ă����炽�烋�[�v�I��
					if( ManageData->CacheImageSize.cx * ManageData->CacheImageSize.cy >= ScreenArea85per &&
						CharNum >= 10 )
					{
						break ;
					}
				}

				// �e�N�X�`���T�C�Y���ő�ɂȂ��Ă�����I��
				if( ManageData->CacheImageSize.cx >= MaxSizeW &&
					ManageData->CacheImageSize.cy >= MaxSizeH )
				{
					break ;
				}

				// �e�N�X�`���T�C�Y���Q�{�ɂ���
				if( ManageData->CacheImageSize.cx >= MaxSizeW )
				{
					ManageData->CacheImageSize.cy <<= 1 ;
				}
				else
				if( ManageData->CacheImageSize.cy >= MaxSizeH )
				{
					ManageData->CacheImageSize.cx <<= 1 ;
				}
				else
				if( ManageData->CacheImageSize.cx > ManageData->CacheImageSize.cy )
				{
					ManageData->CacheImageSize.cy <<= 1 ;
				}
				else
				{
					ManageData->CacheImageSize.cx <<= 1 ;
				}
			}
		}

		// �L���b�V���ł��镶������ۑ�
		ManageData->MaxCacheCharNum = CharNum ;

		// �c���Ɋi�[�ł��镶�������Z�o
		ManageData->LengthCharNum = ManageData->CacheImageSize.cy / ManageData->BaseInfo.MaxWidth ;

		// ��{�C���[�W�֌W�̏�����
		{
			int alpha ;
			int test ;
			int edge ;
			BASEIMAGE *BaseImage ;

			if( ManageData->FontType & DX_FONTTYPE_ANTIALIASING )
			{
				alpha = TRUE ;
				test  = FALSE ;
			}
			else
			{
				alpha = FALSE ;
				test  = TRUE ;
			}
			edge = ( ManageData->FontType & DX_FONTTYPE_EDGE ) != 0 ? TRUE : FALSE ;

			// �L���b�V���ɓ]������C���[�W�Ɠ������̂��i�[���Ă�����{�C���[�W�̍쐬
			{
				BaseImage = &ManageData->TextureCacheBaseImage ;

				// �f�o�C�X���p���b�g�e�N�X�`���ɑΉ����Ă���ꍇ�̓p���b�g�`���ɂ���
				if( GSYS.HardInfo.Support4bitPaletteTexture )
				{
					int i ;

					NS_CreatePaletteColorData( &BaseImage->ColorData ) ;

					// ����Ƀr�b�g����4�ɂ��邩8�ɂ��邩����
					if( ( ManageData->FontType & DX_FONTTYPE_ANTIALIASING ) != 0 &&
						( ManageData->UseFontDataFile == FALSE ||
						  ManageData->FontDataFile.ImageType == DX_FONT_SRCIMAGETYPE_8BIT_MAX64 ||
						  ManageData->FontDataFile.ImageType == DX_FONT_SRCIMAGETYPE_8BIT_MAX255 ) )
					{
						BaseImage->ColorData.MaxPaletteNo = 255 ;
						if( ManageData->TextureCacheUsePremulAlpha )
						{
							for( i = 0 ; i < 256 ; i ++ )
							{
								BaseImage->ColorData.Palette[ i ].Red   = ( BYTE )i ;
								BaseImage->ColorData.Palette[ i ].Green = ( BYTE )i ;
								BaseImage->ColorData.Palette[ i ].Blue  = ( BYTE )i ;
								BaseImage->ColorData.Palette[ i ].Alpha = ( BYTE )i ;
							}
						}
						else
						{
							for( i = 0 ; i < 256 ; i ++ )
							{
								BaseImage->ColorData.Palette[ i ].Red   = 255 ;
								BaseImage->ColorData.Palette[ i ].Green = 255 ;
								BaseImage->ColorData.Palette[ i ].Blue  = 255 ;
								BaseImage->ColorData.Palette[ i ].Alpha = ( BYTE )i ;
							}
						}
					}
					else
					{
						BaseImage->ColorData.MaxPaletteNo = 15 ;
						if( ManageData->TextureCacheUsePremulAlpha )
						{
							for( i = 0 ; i < 16 ; i ++ )
							{
								BaseImage->ColorData.Palette[ i ].Red   = ( BYTE )( i * 255 / 15 ) ;
								BaseImage->ColorData.Palette[ i ].Green = ( BYTE )( i * 255 / 15 ) ;
								BaseImage->ColorData.Palette[ i ].Blue  = ( BYTE )( i * 255 / 15 ) ;
								BaseImage->ColorData.Palette[ i ].Alpha = ( BYTE )( i * 255 / 15 ) ;
							}
						}
						else
						{
							for( i = 0 ; i < 16 ; i ++ )
							{
								BaseImage->ColorData.Palette[ i ].Red   = 255 ;
								BaseImage->ColorData.Palette[ i ].Green = 255 ;
								BaseImage->ColorData.Palette[ i ].Blue  = 255 ;
								BaseImage->ColorData.Palette[ i ].Alpha = ( BYTE )( i * 255 / 15 ) ;
							}
						}
					}
				}
				else
				{
					BaseImage->ColorData	= *( NS_GetTexColorData( alpha, test, ManageData->TextureCacheColorBitDepth == 16 ? 0 : 1, FALSE ) ) ;
				}

				BaseImage->MipMapCount		= 0 ;
				BaseImage->GraphDataCount	= 0 ;
				BaseImage->Width			= ManageData->CacheImageSize.cx * ( edge ? 2 : 1 ) ;
				BaseImage->Height			= ManageData->CacheImageSize.cy ;
				BaseImage->Pitch			= BaseImage->Width * BaseImage->ColorData.PixelByte ;
				BaseImage->GraphData		= DXALLOC( ( size_t )( ( size_t )BaseImage->Pitch * ( size_t )BaseImage->Height ) ) ;
				if( BaseImage->GraphData == NULL )
				{
					DXST_LOGFILE_ADDUTF16LE( "\x87\x65\x57\x5b\xad\x30\xe3\x30\xc3\x30\xb7\x30\xe5\x30\xfa\x57\x2c\x67\xa4\x30\xe1\x30\xfc\x30\xb8\x30\x28\x75\x6e\x30\xe1\x30\xe2\x30\xea\x30\x6e\x30\xba\x78\xdd\x4f\x6b\x30\x31\x59\x57\x65\x57\x30\x7e\x30\x57\x30\x5f\x30\x0a\x00\x00"/*@ L"�����L���b�V����{�C���[�W�p�̃������̊m�ۂɎ��s���܂���\n" @*/ ) ;
					return -1 ;
				}

				if( GSYS.HardInfo.Support4bitPaletteTexture )
				{
					NS_FillBaseImage( BaseImage,   0,  0,  0,  0 ) ;
				}
				else
				{
					// ��Z�ς݃A���t�@���g�p����ꍇ��RGBA=0�ɁA�g�p���Ȃ��ꍇ��A������0�ɂ��ď�����

					if( ManageData->TextureCacheUsePremulAlpha )
					{
						NS_FillBaseImage( BaseImage,   0,  0,  0,  0 ) ;
					}
					else
					{
						NS_FillBaseImage( BaseImage, 255,255,255,  0 ) ;
					}
				}
			}
		}

		// �L���b�V���Ɏg�p����e�N�X�`���O���t�B�b�N���쐬����
		ManageData->TextureCacheLostFlag = TRUE ;
		if( RefreshFontDrawResourceToHandle( ManageData, ASyncThread ) < 0 )
		{
			DXST_LOGFILE_ADDUTF16LE( "\xc6\x30\xaf\x30\xb9\x30\xc1\x30\xe3\x30\x87\x65\x57\x5b\xad\x30\xe3\x30\xc3\x30\xb7\x30\xe5\x30\x6e\x30\x5c\x4f\x10\x62\x6b\x30\x31\x59\x57\x65\x57\x30\x7e\x30\x57\x30\x5f\x30\x0a\x00\x00"/*@ L"�e�N�X�`�������L���b�V���̍쐬�Ɏ��s���܂���\n" @*/ ) ;
			ManageData->TextureCacheFlag = FALSE ;
			goto R1 ;
		}
	}
	else
#endif // DX_NON_GRAPHICS
	{
		// ��������̃L���b�V�����g�p����ꍇ
		int BitNum = 0 ;
			
		// �P�s�N�Z�����̃f�[�^��ۑ�����ɓ�����K�v�ȃr�b�g�����Z�b�g
		switch( ManageData->FontType )
		{
		case DX_FONTTYPE_NORMAL :                   BitNum = 1 ; break ;
		case DX_FONTTYPE_EDGE :                     BitNum = 8 ; break ;
		case DX_FONTTYPE_ANTIALIASING :             BitNum = 8 ; break ;
		case DX_FONTTYPE_ANTIALIASING_4X4 :         BitNum = 8 ; break ;
		case DX_FONTTYPE_ANTIALIASING_8X8 :         BitNum = 8 ; break ;
		case DX_FONTTYPE_ANTIALIASING_16X16 :       BitNum = 8 ; break ;
		case DX_FONTTYPE_ANTIALIASING_EDGE :        BitNum = 8 ; break ;
		case DX_FONTTYPE_ANTIALIASING_EDGE_4X4 :    BitNum = 8 ; break ;
		case DX_FONTTYPE_ANTIALIASING_EDGE_8X8 :    BitNum = 8 ; break ;
		case DX_FONTTYPE_ANTIALIASING_EDGE_16X16 :  BitNum = 8 ; break ;
		}

		// �L���b�V�������̐��𒲐�
		ManageData->MaxCacheCharNum = GParam->CacheCharNum ;
		if( ManageData->MaxCacheCharNum == 0 )
		{
			ManageData->MaxCacheCharNum = FONT_CACHE_MEMORYSIZE / ( ManageData->BaseInfo.MaxWidth * ManageData->BaseInfo.MaxWidth ) ;
			if( ManageData->MaxCacheCharNum < 20 )
			{
				ManageData->MaxCacheCharNum = 20 ;
			}
		}

		if( ManageData->MaxCacheCharNum > FONT_CACHE_MAXNUM )
		{
			ManageData->MaxCacheCharNum = FONT_CACHE_MAXNUM ;
		}

		// �L���b�V���C���[�W�̃T�C�Y���Z�b�g
		ManageData->CacheImageSize.cx	= ManageData->BaseInfo.MaxWidth ;
		ManageData->CacheImageSize.cy	= ManageData->MaxCacheCharNum * ManageData->BaseInfo.MaxWidth ;

		// �L���b�V���������̃Z�b�g
		ManageData->MaxCacheCharNum		= ManageData->CacheImageSize.cy / ManageData->BaseInfo.MaxWidth ;
		ManageData->LengthCharNum		= ManageData->MaxCacheCharNum ;
		ManageData->CacheDataBitNum		= BitNum ;

		// �L���b�V���p�������̊m��
		ManageData->CachePitch = ( BitNum * ManageData->CacheImageSize.cx + 7 ) / 8 ;
		ManageData->CacheMem = (unsigned char *)DXALLOC( ( size_t )( ManageData->CachePitch * ManageData->CacheImageSize.cy ) ) ;
		if( ManageData->CacheMem == NULL )
		{
			DXST_LOGFILE_ADDUTF16LE( "\xd5\x30\xa9\x30\xf3\x30\xc8\x30\x6e\x30\xad\x30\xe3\x30\xc3\x30\xb7\x30\xe5\x30\x28\x75\xe1\x30\xe2\x30\xea\x30\x6e\x30\xba\x78\xdd\x4f\x6b\x30\x31\x59\x57\x65\x57\x30\x7e\x30\x57\x30\x5f\x30\x20\x00\x69\x00\x6e\x00\x20\x00\x43\x00\x72\x00\x65\x00\x61\x00\x74\x00\x65\x00\x46\x00\x6f\x00\x6e\x00\x74\x00\x54\x00\x6f\x00\x48\x00\x61\x00\x6e\x00\x64\x00\x6c\x00\x65\x00\x00"/*@ L"�t�H���g�̃L���b�V���p�������̊m�ۂɎ��s���܂��� in CreateFontToHandle" @*/ ) ;
			return -1 ;
		}

		// �u�����h�`�掞�p�t�H���g�O���t�B�b�N�̍쐬
		if( RefreshFontDrawResourceToHandle( ManageData, ASyncThread ) < 0 )
		{
			DXST_LOGFILE_ADDUTF16LE( "\xd5\x30\xa9\x30\xf3\x30\xc8\x30\x28\x75\xcf\x63\x3b\x75\xb9\x30\xaf\x30\xea\x30\xfc\x30\xf3\x30\x6e\x30\x5c\x4f\x10\x62\x6b\x30\x31\x59\x57\x65\x57\x30\x7e\x30\x57\x30\x5f\x30\x0a\x00\x00"/*@ L"�t�H���g�p�`��X�N���[���̍쐬�Ɏ��s���܂���\n" @*/ ) ;
			return -1 ;
		}
	}

	// �P�������̍�Ɨp�o�b�t�@���m��
	ManageData->TempBufferSize = ( ManageData->BaseInfo.MaxWidth + 4 ) * ( ManageData->BaseInfo.MaxWidth + 4 ) ;
	ManageData->TempBuffer = ( BYTE * )DXALLOC( ManageData->TempBufferSize ) ;
	if( ManageData->TempBuffer == NULL )
	{
		DXST_LOGFILE_ADDUTF16LE( "\xd5\x30\xa9\x30\xf3\x30\xc8\x30\x6e\x30\x5c\x4f\x6d\x69\x28\x75\xd0\x30\xc3\x30\xd5\x30\xa1\x30\x6e\x30\x5c\x4f\x10\x62\x6b\x30\x31\x59\x57\x65\x57\x30\x7e\x30\x57\x30\x5f\x30\x0a\x00\x00"/*@ L"�t�H���g�̍�Ɨp�o�b�t�@�̍쐬�Ɏ��s���܂���\n" @*/ ) ;
		return -1 ;
	}

	// ���ˑ�����
	if( SetupFontCache_PF( GParam, ManageData, ASyncThread ) < 0 )
	{
		return -1 ;
	}

	// �e�L�X�g�L���b�V���f�[�^�̏�����
	InitFontCacheToHandle( ManageData, ASyncThread ) ; 

	// ����I��
	return 0 ;
}

// �����L���b�V���ɐV����������������
extern FONTCHARDATA * FontCacheCharAddToHandle( int AddNum, const DWORD *CharCodeList, const DWORD *IVSCodeList, FONTMANAGE *ManageData, int TextureCacheUpdate )
{
//	FONTMANAGE * 	ManageData ;
	FONTCHARDATA * 	CharData = NULL ;
	int 			i ;
	int             j ;
	void *			Image ;

//	DEFAULT_FONT_HANDLE_SETUP

#ifndef DX_NON_GRAPHICS
	// �G���[����
	if( ManageData->TextureCacheFlag && Graphics_Hardware_CheckValid_PF() == 0 )
	{
		return NULL ;
	}
#endif // DX_NON_GRAPHICS

	// �t�H���g�f�[�^�t�@�C�����g�p���Ȃ��ꍇ�͊��ˑ��̏������s��
	if( ManageData->UseFontDataFile == FALSE )
	{
		// ���ˑ������O
		if( FontCacheCharAddToHandle_Timing0_PF( ManageData ) < 0 )
		{
			return NULL ;
		}
	}

	// �ǉ����镶���̐��������[�v
	for( i = 0 ; i < AddNum ; i ++, CharCodeList ++, IVSCodeList ++ )
	{
		// ���̕�����ǉ�����C���f�b�N�X���擾
		CharData = &ManageData->CharData[ ManageData->Index ] ;

		// �t�H���g�f�[�^�t�@�C�����g�p���Ȃ��ꍇ�͊��ˑ��̒ǉ��������s��
		if( ManageData->UseFontDataFile == FALSE )
		{
			// ���ˑ�����
			if( FontCacheCharAddToHandle_Timing1_PF( ManageData, CharData, *CharCodeList, *IVSCodeList, TextureCacheUpdate ) < 0 )
			{
				CharData = NULL ;
				continue ;
			}
		}
		else
		{
			FONTDATAFILECHARADATA *Chara ;

			// �����̏����擾
			if( *CharCodeList >= 0x10000 || *IVSCodeList != 0 )
			{
				// ���̂Ƃ���t�H���g�t�@�C���ّ͈̎��ɂ͑Ή����Ă��Ȃ�
				if( *IVSCodeList != 0 )
				{
					CharData = NULL ;
					continue ;
				}

				for( j = 0 ; ( DWORD )j < ManageData->FontDataFile.Header->CharaExNum ; j ++ )
				{
					if( ManageData->FontDataFile.CharaExArray[ j ]->CodeUnicode == *CharCodeList )
					{
						break ;
					}
				}
				if( j == ( int )ManageData->FontDataFile.Header->CharaExNum )
				{
					CharData = NULL ;
					continue ;
				}

				Chara = ManageData->FontDataFile.CharaExArray[ j ] ;
			}
			else
			{
				Chara = ManageData->FontDataFile.CharaTable[ *CharCodeList ] ;
				if( Chara == NULL )
				{
					CharData = NULL ;
					continue ;
				}
			}

			// �C���[�W�����k����Ă�����𓀂���
			if( Chara->Press )
			{
				DXA_Decode( ManageData->FontDataFile.Image + Chara->ImageAddress, ManageData->FontDataFile.PressImageDecodeBuffer ) ;
				Image = ManageData->FontDataFile.PressImageDecodeBuffer ;
			}
			else
			{
				Image = ManageData->FontDataFile.Image + Chara->ImageAddress ;
			}

			// �C���[�W��]��
			FontCacheCharImageBltToHandle(
				ManageData,
				CharData,
				*CharCodeList, 
				*IVSCodeList,
				FALSE,
				ManageData->FontDataFile.ImageType,
				Image,
				Chara->SizeX,
				Chara->SizeY,
				Chara->ImagePitch,
				Chara->DrawX,
				Chara->DrawY,
				Chara->AddX,
				TextureCacheUpdate
			) ;
		}

		// ���̕�����o�^����ۂ̃C���f�b�N�X���Z�b�g����
		ManageData->Index ++ ;
		if( ManageData->Index ==  ( unsigned int )ManageData->MaxCacheCharNum )
		{
			ManageData->Index = 0 ;
		}
	}

	// �e�N�X�`���̈ꊇ�X�V
	FontTextureCacheUpdateRectApply( ManageData ) ;

	// �t�H���g�f�[�^�t�@�C�����g�p���Ȃ��ꍇ�͊��ˑ��̌�n���������s��
	if( ManageData->UseFontDataFile == FALSE )
	{
		// ���ˑ������Q
		if( FontCacheCharAddToHandle_Timing2_PF( ManageData ) < 0 )
		{
			return NULL ;
		}
	}

	// �I��
	return CharData ;
}

static int EnumFontNameBase( wchar_t *NameBuffer, int NameBufferNum, int JapanOnlyFlag, int IsEx, int CharSet, const wchar_t *EnumFontName, int IsReturnValid )
{
	ENUMFONTDATA	EnumFontData ;
	wchar_t			*DestBuffer;
	int				Result ;

	EnumFontData.FontNum		= 0 ;
	EnumFontData.JapanOnlyFlag	= IsEx ? FALSE : JapanOnlyFlag ;
	EnumFontData.Valid			= FALSE ;
	EnumFontData.EnumFontName	= EnumFontName ;

	// �t�H���g�����邩�𒲂ׂ邾���̏ꍇ�͏����𕪊�
	if( IsReturnValid )
	{
		EnumFontData.FontBuffer		= NULL ;
		EnumFontData.BufferNum		= 0 ;

		// ���ˑ�����
		Result = EnumFontName_PF( &EnumFontData, TRUE, CharSet ) ;
	}
	else
	{
		if( NameBuffer == NULL )
		{
			DestBuffer = ( wchar_t * )DXALLOC( 1024 * 1024 * 256 ) ;
		}
		else
		{
			DestBuffer = NameBuffer ;
		}

		EnumFontData.FontBuffer		= DestBuffer ;
		EnumFontData.BufferNum		= NameBufferNum ;

		// ���ˑ�����
		Result = EnumFontName_PF( &EnumFontData, IsEx, CharSet ) ;

		// �������̉��
		if( NameBuffer == NULL )
		{
			DXFREE( DestBuffer ) ;
			DestBuffer = NULL ;
		}
	}

	// �G���[�`�F�b�N
	if( Result < 0 )
	{
		return -1 ;
	}

	// �t�H���g�����݂������A�Ⴕ���̓t�H���g�f�[�^�̈搔��Ԃ�
	return IsReturnValid ? EnumFontData.Valid : EnumFontData.FontNum ;
}

static int EnumFontNameBaseT( TCHAR *NameBuffer, int NameBufferNum, int JapanOnlyFlag, int IsEx, int CharSet, const TCHAR *EnumFontName, int IsReturnValid )
{
#ifdef UNICODE
	return EnumFontNameBase( NameBuffer, NameBufferNum, JapanOnlyFlag, IsEx, CharSet, EnumFontName, IsReturnValid ) ;
#else
	wchar_t *TempNameBuffer = NULL ;
	int Result = -1 ;
	int i ;

	TCHAR_TO_WCHAR_T_STRING_ONE_BEGIN( EnumFontName, goto END )

	if( NameBuffer != NULL )
	{
		TempNameBuffer = ( wchar_t * )DXALLOC( 1024 * 1024 * 256 ) ;
		if( TempNameBuffer == NULL )
		{
			goto END ;
		}
		_MEMSET( TempNameBuffer, 0, 1024 * 1024 * 256 ) ;
	}
	else
	{
		TempNameBuffer = NULL ;
	}

	Result = EnumFontNameBase( TempNameBuffer, NameBufferNum, JapanOnlyFlag, IsEx, CharSet, UseEnumFontNameBuffer, IsReturnValid ) ;
	if( Result < 0 )
	{
		goto END ;
	}

	if( NameBuffer != NULL )
	{
		for( i = 0 ; i < Result ; i ++ )
		{
			ConvString( ( const char * )( &TempNameBuffer[ i * 64 ] ), -1, WCHAR_T_CHARCODEFORMAT, ( char * )&NameBuffer[ i * 64 ], sizeof( TCHAR ) * 64, _TCHARCODEFORMAT ) ;
		}
	}

END :

	TCHAR_TO_WCHAR_T_STRING_END( EnumFontName )

	if( TempNameBuffer != NULL )
	{
		DXFREE( TempNameBuffer ) ;
		TempNameBuffer = NULL ;
	}
	return Result ;
#endif
}


// �g�p�\�ȃt�H���g�̖��O�����ׂė񋓂���
extern int NS_EnumFontName( TCHAR *NameBuffer, int NameBufferNum, int JapanOnlyFlag )
{
	return EnumFontNameBaseT( NameBuffer, NameBufferNum, JapanOnlyFlag ) ;
}

// �g�p�\�ȃt�H���g�̖��O��񋓂���( NameBuffer �� 64�o�C�g��؂�Ŗ��O���i�[����܂� )
extern int EnumFontName_WCHAR_T( wchar_t *NameBuffer, int NameBufferNum, int JapanOnlyFlag )
{
	return EnumFontNameBase( NameBuffer, NameBufferNum, JapanOnlyFlag ) ;
}


// �g�p�\�ȃt�H���g�̖��O�����ׂė񋓂���
extern int NS_EnumFontNameEx( TCHAR *NameBuffer, int NameBufferNum, int CharSet )
{
	return EnumFontNameBaseT( NameBuffer, NameBufferNum, FALSE, TRUE, CharSet ) ;
}

// �g�p�\�ȃt�H���g�̖��O��񋓂���( NameBuffer �� 64�o�C�g��؂�Ŗ��O���i�[����܂� )( �����Z�b�g�w��� )
extern int EnumFontNameEx_WCHAR_T( wchar_t *NameBuffer, int NameBufferNum, int CharSet )
{
	return EnumFontNameBase( NameBuffer, NameBufferNum, FALSE, TRUE, CharSet ) ;
}


// �w��̃t�H���g���̃t�H���g��񋓂���
extern int NS_EnumFontNameEx2( TCHAR *NameBuffer, int NameBufferNum, const TCHAR *EnumFontName, int CharSet )
{
	return EnumFontNameBaseT( NameBuffer, NameBufferNum, FALSE, TRUE, CharSet, EnumFontName ) ;
}

// �w��̃t�H���g���̃t�H���g��񋓂���
extern int NS_EnumFontNameEx2WithStrLen( TCHAR *NameBuffer, int NameBufferNum, const TCHAR *EnumFontName, size_t EnumFontNameLength, int CharSet )
{
	int Result ;
	TCHAR_STRING_WITH_STRLEN_TO_TCHAR_STRING_ONE_BEGIN( EnumFontName, EnumFontNameLength, return -1 )
	Result = EnumFontNameBaseT( NameBuffer, NameBufferNum, FALSE, TRUE, CharSet, UseEnumFontNameBuffer ) ;
	TCHAR_STRING_WITH_STRLEN_TO_TCHAR_STRING_END( EnumFontName )
	return Result ;
}

// �w��̃t�H���g���̃t�H���g��񋓂���
extern int EnumFontNameEx2_WCHAR_T( wchar_t *NameBuffer, int NameBufferNum, const wchar_t *EnumFontName, int CharSet )
{
	return EnumFontNameBase( NameBuffer, NameBufferNum, FALSE, TRUE, CharSet, EnumFontName ) ;
}


// �w��̃t�H���g���̃t�H���g�����݂��邩�ǂ������`�F�b�N����( �߂�l  TRUE:���݂���  FALSE:���݂��Ȃ� )
extern int NS_CheckFontName( const TCHAR *FontName, int CharSet /* DX_CHARSET_DEFAULT �� */ )
{
	return EnumFontNameBaseT( NULL, 0, FALSE, TRUE, CharSet, FontName, TRUE ) ;
}

// �w��̃t�H���g���̃t�H���g�����݂��邩�ǂ������`�F�b�N����( �߂�l  TRUE:���݂���  FALSE:���݂��Ȃ� )
extern int NS_CheckFontNameWithStrLen( const TCHAR *FontName, size_t FontNameLength, int CharSet )
{
	int Result ;
	TCHAR_STRING_WITH_STRLEN_TO_TCHAR_STRING_ONE_BEGIN( FontName, FontNameLength, return -1 )
	Result = EnumFontNameBaseT( NULL, 0, FALSE, TRUE, CharSet, FontName, TRUE ) ;
	TCHAR_STRING_WITH_STRLEN_TO_TCHAR_STRING_END( FontName )
	return Result ;
}

// �w��̃t�H���g���̃t�H���g�����݂��邩�ǂ������`�F�b�N����( �߂�l  TRUE:���݂���  FALSE:���݂��Ȃ� )
extern int CheckFontName_WCHAR_T( const wchar_t *FontName, int CharSet )
{
	return EnumFontNameBase( NULL, 0, FALSE, TRUE, CharSet, FontName, TRUE ) ;
}


// InitFontToHandle �̓����֐�
extern int InitFontToHandleBase( int Terminate )
{
	FONTMANAGE * DefFont ;
	wchar_t DefFontName[256] ;
	int DefFontThickness = 0 ;
	int	DefFontSize = 0 ;
	int DefFontEdgeSize = 0 ;
	int	DefFontType = 0 ;
	int	DefFontCharSet = 0 ;
	int DefFontItalic = 0 ;
	int UseDefaultFont ;

	DXST_LOGFILE_ADDUTF16LE( "\xd5\x30\xa9\x30\xf3\x30\xc8\x30\x6e\x30\x1d\x52\x1f\x67\x16\x53\x92\x30\x4c\x88\x44\x30\x7e\x30\x59\x30\x0a\x00\x00"/*@ L"�t�H���g�̏��������s���܂�\n" @*/ ) ;
	DXST_LOGFILE_TABADD ;

	// �f�t�H���g�t�H���g�̃f�[�^��ۑ�
	UseDefaultFont = FSYS.DefaultFontHandle > 0 ? TRUE : FALSE ;
	if( UseDefaultFont )
	{
		DefFont = GetFontManageDataToHandle_Inline( FSYS.DefaultFontHandle ) ;
		_WCSCPY_S( DefFontName, sizeof( DefFontName ), DefFont->FontName ) ;
		DefFontSize      =	DefFont->BaseInfo.FontSize      ;
		DefFontThickness = 	DefFont->BaseInfo.FontThickness ;
		DefFontCharSet   = 	DefFont->BaseInfo.CharSet       ;
		DefFontItalic    =  DefFont->BaseInfo.Italic        ;
		DefFontEdgeSize  =  DefFont->EdgeSize      ;
		DefFontType      =	DefFont->FontType      ;
	}

	// ���ׂẴt�H���g�f�[�^���폜
	AllHandleSub( DX_HANDLETYPE_FONT ) ;

	// ��n�����ł͂Ȃ��ꍇ�̓f�t�H���g�t�H���g���쐬
	if( Terminate == FALSE )
	{
		CREATEFONTTOHANDLE_GPARAM GParam ;
		InitCreateFontToHandleGParam( &GParam ) ;

		if( UseDefaultFont )
		{
			FSYS.DefaultFontHandle = CreateFontToHandle_UseGParam( &GParam, DefFontName,          DefFontSize,          DefFontThickness,      DefFontType,          DefFontCharSet,          DefFontEdgeSize,          DefFontItalic,          -1, FALSE ) ;
		}
		else
		{
			FSYS.DefaultFontHandle = CreateFontToHandle_UseGParam( &GParam, FSYS.DefaultFontName, FSYS.DefaultFontSize, FSYS.DefaultFontThick, FSYS.DefaultFontType, FSYS.DefaultFontCharSet, FSYS.DefaultFontEdgeSize, FSYS.DefaultFontItalic, -1, FALSE ) ;
		}
		NS_SetDeleteHandleFlag( FSYS.DefaultFontHandle, &FSYS.DefaultFontHandle ) ;
	}

	DXST_LOGFILE_TABSUB ;
	DXST_LOGFILE_ADDUTF16LE( "\xd5\x30\xa9\x30\xf3\x30\xc8\x30\x6e\x30\x1d\x52\x1f\x67\x16\x53\x6f\x30\x63\x6b\x38\x5e\x6b\x30\x42\x7d\x86\x4e\x57\x30\x7e\x30\x57\x30\x5f\x30\x0a\x00\x00"/*@ L"�t�H���g�̏������͐���ɏI�����܂���\n" @*/ ) ;

	// �I��
	return 0 ;
}

// �t�H���g�̃X�e�[�^�X���f�t�H���g�ɖ߂�
extern int NS_InitFontToHandle( void )
{
	return InitFontToHandleBase() ;
}

// �t�H���g�n���h��������������
extern int InitializeFontHandle( HANDLEINFO *HandleInfo )
{
	FONTMANAGE * ManageData = ( FONTMANAGE * )HandleInfo ;

	ManageData->PF = ( FONTMANAGE_PF * )( ManageData + 1 ) ;

	// ��Ɨp�n���h����������
	ManageData->ModiDrawScreen[ 0 ] = -1 ;
	ManageData->ModiDrawScreen[ 1 ] = -1 ;
	ManageData->ModiDrawScreenV[ 0 ] = -1 ;
	ManageData->ModiDrawScreenV[ 1 ] = -1 ;

	// �L���b�V���n���h����������
	ManageData->TextureCache	= -1 ;
	ManageData->TextureCacheSub	= -1 ;

	// �I��
	return 0 ;
}

// �t�H���g�n���h���̌�n��������
extern int TerminateFontHandle( HANDLEINFO *HandleInfo )
{
	FONTMANAGE * ManageData = ( FONTMANAGE * )HandleInfo ;

	// ���ˑ�����
	TerminateFontHandle_PF( ManageData ) ;

	// �e�L�X�g�L���b�V���p�������̉��
	if( ManageData->CacheMem != NULL )
	{
		DXFREE( ManageData->CacheMem ) ;
		ManageData->CacheMem = NULL ;
	}

	// ��Ɨp�o�b�t�@�̉��
	if( ManageData->TempBuffer != NULL )
	{
		DXFREE( ManageData->TempBuffer ) ;
		ManageData->TempBuffer = NULL ;
	}

#ifndef DX_NON_GRAPHICS
	// ��Ɨp�O���t�B�b�N�폜
	{
		int i ;

		for( i = 0 ; i < 2 ; i ++ )
		{
			if( ManageData->ModiDrawScreen[ i ] >= 0 )
			{
				SubHandle( ManageData->ModiDrawScreen[ i ], FALSE, FALSE ) ;
				ManageData->ModiDrawScreen[ i ] = -1 ;
			}

			if( ManageData->ModiDrawScreenV[ i ] >= 0 )
			{
				SubHandle( ManageData->ModiDrawScreenV[ i ], FALSE, FALSE ) ;
				ManageData->ModiDrawScreenV[ i ] = -1 ;
			}
		}
	}

	// �e�N�X�`���O���t�B�b�N�폜
	if( ManageData->TextureCache >= 0 )
	{
		SubHandle( ManageData->TextureCache, FALSE, FALSE ) ;
		SubHandle( ManageData->TextureCacheSub, FALSE, FALSE ) ;
		ManageData->TextureCache = -1 ;
		ManageData->TextureCacheSub = -1 ;
	}
#endif // DX_NON_GRAPHICS

	// �e�N�X�`���L���b�V���Ɠ����C���[�W�̊�{�C���[�W�̉��
	if( ManageData->TextureCacheBaseImage.GraphData != NULL )
	{
		DXFREE( ManageData->TextureCacheBaseImage.GraphData ) ;
		ManageData->TextureCacheBaseImage.GraphData = NULL ;
	}

	// �J�[�j���O�y�A���p�Ɋm�ۂ��Ă����������̉��
	if( ManageData->FontDataFile.FileBuffer == NULL &&
		ManageData->KerningPairData != NULL )
	{
		DXFREE( ManageData->KerningPairData ) ;
		ManageData->KerningPairData = NULL ;
	}

	// �t�H���g�f�[�^�t�@�C�����g�p���Ă����ꍇ�̓t�H���g�f�[�^�t�@�C���C���[�W�p�̊m�ۃ����������
	if( ManageData->FontDataFile.FileBuffer != NULL )
	{
		DXFREE( ManageData->FontDataFile.FileBuffer ) ;
		ManageData->FontDataFile.FileBuffer = NULL ;
	}

	// �G�b�W�̃T�C�Y�����ȏ�̏ꍇ�̓G�b�W�̉~�p�̉摜���폜����
	if( ManageData->EdgeSize > FONTEDGE_PATTERN_NUM )
	{
		NS_ReleaseBaseImage( &ManageData->EdgeCircleImage ) ;
	}

	// ���X�g�t���O���ݒ肳��Ă���ꍇ�� TRUE �ɂ���
	if( ManageData->LostFlag != NULL )
	{
		*ManageData->LostFlag = TRUE ;
	}

	// �I��
	return 0 ;
}

// �t�H���g�n���h���̏��o��
extern int DumpInfoFontHandle( HANDLEINFO *HandleInfo )
{
	FONTMANAGE * ManageData = ( FONTMANAGE * )HandleInfo ;

	if( ManageData->UseFontDataFile )
	{
		DXST_LOGFILEFMT_ADDW(( L"Handle:0x%08x IsFontFile:true  FontName:%s FontType:%s Size:%d Thickness:%d Height:%d", HandleInfo->Handle, ManageData->FontDataFile.Header->Press.FontName, 
			ManageData->FontType == DX_FONTTYPE_NORMAL ? L"DX_FONTTYPE_NORMAL" :
			( ManageData->FontType == DX_FONTTYPE_EDGE ? L"DX_FONTTYPE_EDGE" :
			( ManageData->FontType == DX_FONTTYPE_ANTIALIASING ? L"DX_FONTTYPE_ANTIALIASING" :
			( ManageData->FontType == DX_FONTTYPE_ANTIALIASING_4X4 ? L"DX_FONTTYPE_ANTIALIASING_4X4" :
			( ManageData->FontType == DX_FONTTYPE_ANTIALIASING_8X8 ? L"DX_FONTTYPE_ANTIALIASING_8X8" :
			( ManageData->FontType == DX_FONTTYPE_ANTIALIASING_16X16 ? L"DX_FONTTYPE_ANTIALIASING_16X16" :
			( ManageData->FontType == DX_FONTTYPE_ANTIALIASING_EDGE ? L"DX_FONTTYPE_ANTIALIASING_EDGE" :
			( ManageData->FontType == DX_FONTTYPE_ANTIALIASING_EDGE_4X4 ? L"DX_FONTTYPE_ANTIALIASING_EDGE_4X4" :
			( ManageData->FontType == DX_FONTTYPE_ANTIALIASING_EDGE_8X8 ? L"DX_FONTTYPE_ANTIALIASING_EDGE_8X8" :
			( ManageData->FontType == DX_FONTTYPE_ANTIALIASING_EDGE_16X16 ? L"DX_FONTTYPE_ANTIALIASING_EDGE_16X16" : L"Null"
			))))))))),
			ManageData->FontDataFile.Header->Press.BaseInfo.FontSize, ManageData->FontDataFile.Header->Press.BaseInfo.FontHeight )) ;
	}
	else
	{
		DXST_LOGFILEFMT_ADDW(( L"Handle:0x%08x IsFontFile:false FontName:%s FontType:%s Size:%d Thickness:%d Height:%d", HandleInfo->Handle, ManageData->FontName,
			ManageData->FontType == DX_FONTTYPE_NORMAL ? L"DX_FONTTYPE_NORMAL" :
			( ManageData->FontType == DX_FONTTYPE_EDGE ? L"DX_FONTTYPE_EDGE" :
			( ManageData->FontType == DX_FONTTYPE_ANTIALIASING ? L"DX_FONTTYPE_ANTIALIASING" :
			( ManageData->FontType == DX_FONTTYPE_ANTIALIASING_4X4 ? L"DX_FONTTYPE_ANTIALIASING_4X4" :
			( ManageData->FontType == DX_FONTTYPE_ANTIALIASING_8X8 ? L"DX_FONTTYPE_ANTIALIASING_8X8" :
			( ManageData->FontType == DX_FONTTYPE_ANTIALIASING_16X16 ? L"DX_FONTTYPE_ANTIALIASING_16X16" :
			( ManageData->FontType == DX_FONTTYPE_ANTIALIASING_EDGE ? L"DX_FONTTYPE_ANTIALIASING_EDGE" :
			( ManageData->FontType == DX_FONTTYPE_ANTIALIASING_EDGE_4X4 ? L"DX_FONTTYPE_ANTIALIASING_EDGE_4X4" :
			( ManageData->FontType == DX_FONTTYPE_ANTIALIASING_EDGE_8X8 ? L"DX_FONTTYPE_ANTIALIASING_EDGE_8X8" :
			( ManageData->FontType == DX_FONTTYPE_ANTIALIASING_EDGE_16X16 ? L"DX_FONTTYPE_ANTIALIASING_EDGE_16X16" : L"Null"
			))))))))),
			ManageData->BaseInfo.FontSize, ManageData->BaseInfo.FontThickness, ManageData->BaseInfo.FontHeight )) ;
	}

	// �I��
	return 0 ;
}

// CREATEFONTTOHANDLE_GPARAM �̃f�[�^���Z�b�g����
extern void InitCreateFontToHandleGParam( CREATEFONTTOHANDLE_GPARAM *GParam )
{
	GParam->CacheCharNum					= FSYS.CacheCharNum ;
	GParam->TextureCacheColorBitDepth16Flag	= FSYS.TextureCacheColorBitDepth16Flag ;
	GParam->NotTextureFlag					= FSYS.NotTextureFlag ;
	GParam->UsePremulAlphaFlag				= FSYS.UsePremulAlphaFlag ;
	GParam->DisableAdjustFontSize			= FSYS.DisableAdjustFontSize ;
}

// CreateFontToHandle �̎������֐�
static int CreateFontToHandle_Static(
	CREATEFONTTOHANDLE_GPARAM *GParam,
	int FontHandle,
	const wchar_t *FontName,
	int Size,
	int Thick,
	int FontType,
	int CharSet,
	int EdgeSize,
	int Italic,
	int ASyncThread
)
{
	FONTMANAGE *	ManageData		= NULL ;
	int				DefaultCharSet	= FALSE ;
	int				CharCodeFormat ;

	if( FontType 	< 0 ) FontType 	 = FSYS.AntialiasingFontOnlyFlag ? DX_FONTTYPE_ANTIALIASING : DEFAULT_FONT_TYPE ;
	if( Size 		< 0 ) Size 		= DEFAULT_FONT_SIZE ;
	if( Thick 		< 0 ) Thick 	= DEFAULT_FONT_THICKNESS ;
	if( EdgeSize	< 0 ) EdgeSize	= DEFAULT_FONT_EDGESIZE ;
	if( CharSet		< 0 || CharSet >= DX_CHARSET_NUM )
	{
		DefaultCharSet = TRUE ;
		CharSet  = _GET_CHARSET() ;
		CharCodeFormat = 0xffff ;
	}
	else
	{
		// CharSet �� DX_CHARSET_DEFAULT �̏ꍇ�͕����R�[�h�`���̓f�t�H���g�̂��̂��g�p����
		if( CharSet == DX_CHARSET_DEFAULT )
		{
			CharCodeFormat = 0xffff ;
		}
		else
		{
			CharCodeFormat = CharCodeFormatTable[ CharSet ] ;
		}
	}

	// �G�b�W�����t�H���g�̏ꍇ�� EdgeSize �� 0 �Œ�ɂ���
	if( ( FontType & DX_FONTTYPE_EDGE ) == 0 )
	{
		EdgeSize = 0 ;
	}

	// �A���`�G�C���A�X�t�H���g�����g�p����ꍇ�͉��̗L�薳���ȊO�̓A���`�G�C���A�X�^�C�v�ɌŒ肷��
	if( FSYS.AntialiasingFontOnlyFlag )
	{
		if( ( FontType & DX_FONTTYPE_EDGE ) != 0 )
		{
			FontType = DX_FONTTYPE_ANTIALIASING_EDGE ;
		}
		else
		{
			FontType = DX_FONTTYPE_ANTIALIASING ;
		}
	}

	FONTHCHK( FontHandle, ManageData ) ;

#ifndef DX_NON_GRAPHICS
	if( NS_GetColorBitDepth() == 8 && ( FontType & DX_FONTTYPE_ANTIALIASING ) )
	{
		FontType &= ~DX_FONTTYPE_ANTIALIASING ;
	}
#endif // DX_NON_GRAPHICS

	// �t�H���g�̃p�����[�^�̃Z�b�g
	ManageData->BaseInfo.FontSize 		= ( WORD )Size ;
	ManageData->BaseInfo.FontThickness 	= ( WORD )Thick ;
	ManageData->BaseInfo.Italic			= ( BYTE )Italic ;
	ManageData->BaseInfo.CharSet		= ( WORD )CharSet ;
	ManageData->BaseInfo.CharCodeFormat	= ( WORD )CharCodeFormat ;
	ManageData->FontType				= FontType ;
	ManageData->EdgeSize				= EdgeSize ;
	ManageData->Space					= 0 ;
	ManageData->LineSpaceValidFlag		= FALSE ;
	ManageData->LineSpace				= 0 ;
	ManageData->UseCharCodeFormat		= -1 ;

	// ���X�g�t���O�ւ̃|�C���^�� NULL �ɂ��Ă���
	ManageData->LostFlag = NULL ;

	// �t�H���g�f�[�^�t�@�C���͎g�p���Ȃ�
	ManageData->UseFontDataFile = 0 ;

	// �t�H���g���̕ۑ�
	if( FontName == NULL )
	{
		ManageData->FontName[ 0 ] = L'\0' ;
	}
	else
	{
		_WCSCPY_S( ManageData->FontName, sizeof( ManageData->FontName ), FontName ) ;
	}

	// �G�b�W�̃T�C�Y�����ȏ�̏ꍇ�̓G�b�W�̉~�p�̉摜���쐬����
	if( EdgeSize > FONTEDGE_PATTERN_NUM )
	{
		if( NS_CreatePAL8ColorBaseImage( EdgeSize * 2 + 1, EdgeSize * 2 + 1, &ManageData->EdgeCircleImage, FALSE ) < 0 )
		{
			return -1 ;
		}
		_MEMSET( ManageData->EdgeCircleImage.ColorData.Palette, 0, sizeof( ManageData->EdgeCircleImage.ColorData.Palette ) ) ;
		ManageData->EdgeCircleImage.ColorData.Palette[ 1 ].Red   = 255 ;
		ManageData->EdgeCircleImage.ColorData.Palette[ 1 ].Green = 255 ;
		ManageData->EdgeCircleImage.ColorData.Palette[ 1 ].Blue  = 255 ;
		ManageData->EdgeCircleImage.ColorData.Palette[ 1 ].Alpha = 0 ;
		NS_FillBaseImage( &ManageData->EdgeCircleImage, 0, 0, 0, 0 ) ;
		NS_DrawCircleBaseImage( &ManageData->EdgeCircleImage, EdgeSize, EdgeSize, EdgeSize, 255, 255, 255, 0, TRUE ) ;
	}

	// ���ˑ�����
	if( CreateFontToHandle_PF( GParam, ManageData, DefaultCharSet ) != 0 )
	{
		return -1 ;
	}

	// �t�H���g���� TCHAR �ł��쐬
	ConvString( ( char * )ManageData->FontName, -1, WCHAR_T_CHARCODEFORMAT, ( char * )ManageData->FontNameT, sizeof( ManageData->FontNameT ), _TCHARCODEFORMAT ) ;

	// �e�L�X�g�L���b�V���T�[�t�F�X�̍쐬
	if( SetupFontCache( GParam, ManageData, ASyncThread ) < 0 )
	{
		goto ERR ;
	}

	// ����I��
	return 0 ;

	// �G���[����
ERR :
	CreateFontToHandle_Error_PF( ManageData ) ;

	return -1 ;
}

#ifndef DX_NON_ASYNCLOAD

// CreateFontToHandle �̔񓯊��ǂݍ��݃X���b�h����Ă΂��֐�
static void CreateFontToHandle_ASync( ASYNCLOADDATA_COMMON *AParam )
{
	CREATEFONTTOHANDLE_GPARAM *GParam ;
	int FontHandle ;
	const wchar_t *FontName ;
	int Size ;
	int Thick ;
	int FontType ;
	int CharSet ;
	int EdgeSize ;
	int Italic ;
	int Addr ;
	int Result ;
	FONTMANAGE *ManageData ;

	Addr = 0 ;
	GParam = ( CREATEFONTTOHANDLE_GPARAM * )GetASyncLoadParamStruct( AParam->Data, &Addr ) ;
	FontHandle = GetASyncLoadParamInt( AParam->Data, &Addr ) ;
	FontName = GetASyncLoadParamString( AParam->Data, &Addr ) ;
	Size = GetASyncLoadParamInt( AParam->Data, &Addr ) ;
	Thick = GetASyncLoadParamInt( AParam->Data, &Addr ) ;
	FontType = GetASyncLoadParamInt( AParam->Data, &Addr ) ;
	CharSet = GetASyncLoadParamInt( AParam->Data, &Addr ) ;
	EdgeSize = GetASyncLoadParamInt( AParam->Data, &Addr ) ;
	Italic = GetASyncLoadParamInt( AParam->Data, &Addr ) ;

	Result = CreateFontToHandle_Static( GParam, FontHandle, FontName, Size, Thick, FontType, CharSet, EdgeSize, Italic, TRUE ) ;
	if( !FONTHCHK_ASYNC( FontHandle, ManageData ) )
	{
		ManageData->HandleInfo.ASyncLoadResult = Result ;
	}

	DecASyncLoadCount( FontHandle ) ;
	if( Result < 0 )
	{
		SubHandle( FontHandle, FALSE, FALSE ) ;
	}
}

#endif // DX_NON_ASYNCLOAD

// CreateFontToHandle �̃O���[�o���ϐ��ɃA�N�Z�X���Ȃ��o�[�W����
extern int CreateFontToHandle_UseGParam(
	CREATEFONTTOHANDLE_GPARAM *GParam,
	const wchar_t *FontName,
	int Size,
	int Thick,
	int FontType,
	int CharSet,
	int EdgeSize,
	int Italic,
	int Handle,
	int ASyncLoadFlag
)
{
	int FontHandle ;

	CheckActiveState() ;

	// �n���h���̍쐬
	FontHandle = AddHandle( DX_HANDLETYPE_FONT, FALSE, Handle ) ;
	if( FontHandle == -1 )
	{
		return -1 ;
	}

#ifndef DX_NON_ASYNCLOAD
	if( ASyncLoadFlag )
	{
		ASYNCLOADDATA_COMMON *AParam = NULL ;
		int Addr ;

		// �p�����[�^�ɕK�v�ȃ������̃T�C�Y���Z�o
		Addr = 0 ;
		AddASyncLoadParamStruct( NULL, &Addr, GParam, sizeof( *GParam ) ) ;
		AddASyncLoadParamInt( NULL, &Addr, FontHandle ) ;
		AddASyncLoadParamString( NULL, &Addr, FontName ) ;
		AddASyncLoadParamInt( NULL, &Addr, Size ) ;
		AddASyncLoadParamInt( NULL, &Addr, Thick ) ;
		AddASyncLoadParamInt( NULL, &Addr, FontType ) ;
		AddASyncLoadParamInt( NULL, &Addr, CharSet ) ;
		AddASyncLoadParamInt( NULL, &Addr, EdgeSize ) ;
		AddASyncLoadParamInt( NULL, &Addr, Italic ) ;

		// �������̊m��
		AParam = AllocASyncLoadDataMemory( Addr ) ;
		if( AParam == NULL )
			goto ERR ;

		// �����ɕK�v�ȏ����Z�b�g
		AParam->ProcessFunction = CreateFontToHandle_ASync ;
		Addr = 0 ;
		AddASyncLoadParamStruct( AParam->Data, &Addr, GParam, sizeof( *GParam ) ) ;
		AddASyncLoadParamInt( AParam->Data, &Addr, FontHandle ) ;
		AddASyncLoadParamString( AParam->Data, &Addr, FontName ) ;
		AddASyncLoadParamInt( AParam->Data, &Addr, Size ) ;
		AddASyncLoadParamInt( AParam->Data, &Addr, Thick ) ;
		AddASyncLoadParamInt( AParam->Data, &Addr, FontType ) ;
		AddASyncLoadParamInt( AParam->Data, &Addr, CharSet ) ;
		AddASyncLoadParamInt( AParam->Data, &Addr, EdgeSize ) ;
		AddASyncLoadParamInt( AParam->Data, &Addr, Italic ) ;

		// �f�[�^��ǉ�
		if( AddASyncLoadData( AParam ) < 0 )
		{
			DXFREE( AParam ) ;
			AParam = NULL ;
			goto ERR ;
		}

		// �񓯊��ǂݍ��݃J�E���g���C���N�������g
		IncASyncLoadCount( FontHandle, AParam->Index ) ;
	}
	else
#endif // DX_NON_ASYNCLOAD
	{
		if( CreateFontToHandle_Static( GParam, FontHandle, FontName, Size, Thick, FontType, CharSet, EdgeSize, Italic, FALSE ) < 0 )
			goto ERR ;
	}

	// �I��
	return FontHandle ;

ERR :
	SubHandle( FontHandle, ASyncLoadFlag, FALSE ) ;

	return -1 ;
}










// LoadFontDataFromMemToHandle_UseGParam �̎������֐�
static int LoadFontDataFromMemToHandle_UseGParam_Static(
	CREATEFONTTOHANDLE_GPARAM *GParam,
	int FontHandle,
	const void *FontDataImage,
	int FontDataImageSize,
	int EdgeSize,
	int ASyncThread
)
{
	FONTMANAGE *ManageData = NULL ;
	const FONTDATAFILEHEADER *FileHeader ;
	int NotPressHeaderSize ;
	int PressHeaderSize ;
	int AllocSize ;

	FONTHCHK( FontHandle, ManageData ) ;

	FileHeader = ( const FONTDATAFILEHEADER * )FontDataImage ;

	if( EdgeSize < 0 )
	{
		EdgeSize = 0 ;
	}

	// ID�`�F�b�N
	if( FileHeader->Magic[ 0 ] != 'F' ||
		FileHeader->Magic[ 1 ] != 'N' ||
		FileHeader->Magic[ 2 ] != 'T' ||
		FileHeader->Magic[ 3 ] != 'F' )
	{
		goto ERR ;
	}

	// �o�[�W�����`�F�b�N
	if( FileHeader->Version > DX_FONTDATAFILE_VERSION )
	{
		goto ERR ;
	}

	// �t�H���g�f�[�^�t�@�C�����g�p���Ă��邩�̃t���O�𗧂Ă�
	ManageData->UseFontDataFile = TRUE ;

	// �m�ۂ��郁�����T�C�Y���Z�o����
	NotPressHeaderSize = sizeof( FONTDATAFILEHEADER ) - sizeof( FONTDATAFILEPRESSHEADER ) ;
	PressHeaderSize    = DXA_Decode( ( BYTE * )FontDataImage + NotPressHeaderSize, NULL ) ;

	AllocSize          = FontDataImageSize +
						 PressHeaderSize + NotPressHeaderSize +
						 sizeof( FONTDATAFILECHARADATA * ) * ( 0x10000 + FileHeader->CharaExNum ) +
						 FileHeader->MaxImageBytes ;

	// �o�[�W�����O�� FONTBASEINFO �̃T�C�Y���������̂Ŋm�ۂ��郁�����e�ʂ�␳
	if( FileHeader->Version < 1 )
	{
		AllocSize += sizeof( FONTBASEINFO ) - DX_FONTBASEINFO_SIZE_VER0 ;
	}

	// �������̊m��
	ManageData->FontDataFile.FileBuffer = ( BYTE * )DXALLOC( AllocSize ) ;
	if( ManageData->FontDataFile.FileBuffer == NULL )
	{
		goto ERR ;
	}

	// �𓀂����w�b�_����ۑ����郁�����A�h���X�̃Z�b�g
	ManageData->FontDataFile.Header = ( FONTDATAFILEHEADER * )( ManageData->FontDataFile.FileBuffer + FontDataImageSize ) ;

	// �t�H���g�f�[�^�t�@�C�����̊e�����̏��ւ̃A�h���X�e�[�u���̃A�h���X���Z�b�g
	ManageData->FontDataFile.CharaTable = ( FONTDATAFILECHARADATA ** )( ( BYTE * )ManageData->FontDataFile.Header + NotPressHeaderSize + PressHeaderSize ) ;

	// �o�[�W�����O�� FONTBASEINFO �̃T�C�Y���������̂ŃA�h���X��␳
	if( FileHeader->Version < 1 )
	{
		ManageData->FontDataFile.CharaTable = ( FONTDATAFILECHARADATA ** )( ( BYTE * )ManageData->FontDataFile.CharaTable + ( sizeof( FONTBASEINFO ) - DX_FONTBASEINFO_SIZE_VER0 ) ) ;
	}

	// �t�H���g�f�[�^�t�@�C������ 0xffff �𒴂��镶���R�[�h�̕������ւ̃A�h���X�̔z���ۑ����郁�����̈�ւ̃A�h���X���Z�b�g
	ManageData->FontDataFile.CharaExArray = ManageData->FontDataFile.CharaTable + 0x10000 ;

	// �𓀂����t�H���g�摜�f�[�^���i�[���郁�����A�h���X���Z�b�g
	ManageData->FontDataFile.PressImageDecodeBuffer = ManageData->FontDataFile.CharaExArray + FileHeader->CharaExNum ;

	// �t�H���g�f�[�^�t�@�C�����R�s�[����
	_MEMCPY( ManageData->FontDataFile.FileBuffer, FontDataImage, FontDataImageSize ) ;
	ManageData->FontDataFile.FontFileSize = FontDataImageSize ;

	// �w�b�_�̈��k���ꂽ�������𓀂���
	DXA_Decode( ManageData->FontDataFile.FileBuffer + NotPressHeaderSize, ( BYTE * )ManageData->FontDataFile.Header + NotPressHeaderSize ) ;

	// �w�b�_�̈��k����Ă��Ȃ��������R�s�[
	_MEMCPY( ManageData->FontDataFile.Header, ManageData->FontDataFile.FileBuffer, NotPressHeaderSize ) ;

	// �o�[�W���� 0 �� FONTBASEINFO �̃T�C�Y���������̂Ńw�b�_�f�[�^��␳
	if( FileHeader->Version < 1 )
	{
		_MEMMOVE(
			( BYTE * )&ManageData->FontDataFile.Header->Press.BaseInfo.KerningPairNum + ( sizeof( FONTBASEINFO ) - DX_FONTBASEINFO_SIZE_VER0 ),
			&ManageData->FontDataFile.Header->Press.BaseInfo.KerningPairNum,
			PressHeaderSize - ( ( BYTE * )&ManageData->FontDataFile.Header->Press.BaseInfo.KerningPairNum - ( ( BYTE * )ManageData->FontDataFile.Header + NotPressHeaderSize ) )
		) ;
		_MEMSET( &ManageData->FontDataFile.Header->Press.BaseInfo.KerningPairNum, 0, sizeof( FONTBASEINFO ) - DX_FONTBASEINFO_SIZE_VER0 ) ;
	}

	// �e�����̏�񂪊i�[����Ă���A�h���X���Z�b�g
	ManageData->FontDataFile.Chara = ( FONTDATAFILECHARADATA * )( ManageData->FontDataFile.Header + 1 ) ;

	// �J�[�j���O�y�A���̃Z�b�g
	ManageData->KerningPairData = NULL ;
	if( ManageData->FontDataFile.Header->Press.BaseInfo.KerningPairNum > 0 )
	{
		ManageData->KerningPairData = ( FONTDATAFILEKERNINGPAIRDATA * )( ManageData->FontDataFile.Chara + ManageData->FontDataFile.Header->CharaNum ) ;
	}

	// �����̉摜���i�[����Ă���A�h���X���Z�b�g
	ManageData->FontDataFile.Image = ManageData->FontDataFile.FileBuffer + ManageData->FontDataFile.Header->ImageAddress ;

	// �C���[�W�f�[�^�^�C�v�ƃt�H���g�^�C�v���Z�b�g
	switch( ManageData->FontDataFile.Header->Press.ImageBitDepth )
	{
	case DX_FONTIMAGE_BIT_1 :
		ManageData->FontDataFile.ImageType = DX_FONT_SRCIMAGETYPE_1BIT ;
		ManageData->FontType = EdgeSize > 0 ? DX_FONTTYPE_EDGE : DX_FONTTYPE_NORMAL ;
		break ;

	case DX_FONTIMAGE_BIT_4 :
		ManageData->FontDataFile.ImageType = DX_FONT_SRCIMAGETYPE_4BIT_MAX15 ;
		ManageData->FontType = EdgeSize > 0 ? DX_FONTTYPE_ANTIALIASING_EDGE_4X4 : DX_FONTTYPE_ANTIALIASING_4X4 ;
		break ;

	case DX_FONTIMAGE_BIT_8 :
		ManageData->FontDataFile.ImageType = DX_FONT_SRCIMAGETYPE_8BIT_MAX255 ;
		ManageData->FontType = EdgeSize > 0 ? DX_FONTTYPE_ANTIALIASING_EDGE_8X8 : DX_FONTTYPE_ANTIALIASING_8X8 ;
		break ;
	}

	// �e�����ւ̃A�h���X�e�[�u�����쐬����
	{
		FONTDATAFILECHARADATA *Chara ;
		DWORD i ;
		int CharaExNum ;

		_MEMSET( ManageData->FontDataFile.CharaTable, 0, sizeof( FONTDATAFILECHARADATA * ) * 0x10000 ) ;
		Chara      = ManageData->FontDataFile.Chara ;
		CharaExNum = 0 ;
		for( i = 0 ; i < ManageData->FontDataFile.Header->CharaNum ; i ++, Chara ++ )
		{
			if( Chara->CodeUnicode >= 0x10000 )
			{
				ManageData->FontDataFile.CharaExArray[ CharaExNum ] = Chara ;
				CharaExNum ++ ;
			}
			else
			{
				ManageData->FontDataFile.CharaTable[ Chara->CodeUnicode ] = Chara ;
			}
		}
	}

	// �t�H���g�̃p�����[�^�̃Z�b�g
	_MEMCPY( &ManageData->BaseInfo, &ManageData->FontDataFile.Header->Press.BaseInfo, sizeof( ManageData->BaseInfo ) ) ;
	ManageData->EdgeSize			= EdgeSize ;
	ManageData->Space			    = 0 ;
	ManageData->LineSpaceValidFlag	= FALSE ;
	ManageData->LineSpace		    = 0 ;
	ManageData->UseCharCodeFormat	= -1 ;

	// �t�H���g���̕ۑ�
	ConvString( ( const char * )ManageData->FontDataFile.Header->Press.FontName, -1, DX_CHARCODEFORMAT_UTF16LE, ( char * )ManageData->FontName,  sizeof( ManageData->FontName  ), WCHAR_T_CHARCODEFORMAT ) ;
	ConvString( ( char *       )ManageData->FontName,                            -1, WCHAR_T_CHARCODEFORMAT,    ( char * )ManageData->FontNameT, sizeof( ManageData->FontNameT ), _TCHARCODEFORMAT       ) ;

	// ���X�g�t���O�ւ̃|�C���^�� NULL �ɂ��Ă���
	ManageData->LostFlag = NULL ;

	// �G�b�W�̃T�C�Y�����ȏ�̏ꍇ�̓G�b�W�̉~�p�̉摜���쐬����
	if( EdgeSize > FONTEDGE_PATTERN_NUM )
	{
		if( NS_CreatePAL8ColorBaseImage( EdgeSize * 2 + 1, EdgeSize * 2 + 1, &ManageData->EdgeCircleImage, FALSE ) < 0 )
		{
			return -1 ;
		}
		_MEMSET( ManageData->EdgeCircleImage.ColorData.Palette, 0, sizeof( ManageData->EdgeCircleImage.ColorData.Palette ) ) ;
		ManageData->EdgeCircleImage.ColorData.Palette[ 1 ].Red   = 255 ;
		ManageData->EdgeCircleImage.ColorData.Palette[ 1 ].Green = 255 ;
		ManageData->EdgeCircleImage.ColorData.Palette[ 1 ].Blue  = 255 ;
		ManageData->EdgeCircleImage.ColorData.Palette[ 1 ].Alpha = 0 ;
		NS_FillBaseImage( &ManageData->EdgeCircleImage, 0, 0, 0, 0 ) ;
		NS_DrawCircleBaseImage( &ManageData->EdgeCircleImage, EdgeSize, EdgeSize, EdgeSize, 255, 255, 255, 0, TRUE ) ;
	}

	// ���ˑ�����
	if( CreateFontToHandle_PF( GParam, ManageData, FALSE ) != 0 )
	{
		goto ERR ;
	}

	// �����摜�L���b�V���̃Z�b�g�A�b�v
	if( SetupFontCache( GParam, ManageData, ASyncThread ) < 0 )
	{
		goto ERR ;
	}

	// ����I��
	return 0 ;

	// �G���[����
ERR :
	CreateFontToHandle_Error_PF( ManageData ) ;

	if( ManageData->FontDataFile.FileBuffer != NULL )
	{
		DXFREE( ManageData->FontDataFile.FileBuffer ) ;
		ManageData->FontDataFile.FileBuffer = NULL ;
	}

	return -1 ;
}

#ifndef DX_NON_ASYNCLOAD

// LoadFontDataFromMemToHandle_UseGParam �̔񓯊��ǂݍ��݃X���b�h����Ă΂��֐�
static void LoadFontDataFromMemToHandle_UseGParam_ASync( ASYNCLOADDATA_COMMON *AParam )
{
	CREATEFONTTOHANDLE_GPARAM *GParam ;
	int FontHandle ;
	const void *FontDataImage ;
	int FontDataImageSize ;
//	int FontType ;
	int EdgeSize ;
	int Addr ;
	int Result ;
	FONTMANAGE *ManageData ;

	Addr = 0 ;
	GParam = ( CREATEFONTTOHANDLE_GPARAM * )GetASyncLoadParamStruct( AParam->Data, &Addr ) ;
	FontHandle = GetASyncLoadParamInt( AParam->Data, &Addr ) ;
	FontDataImage = GetASyncLoadParamVoidP( AParam->Data, &Addr ) ;
	FontDataImageSize = GetASyncLoadParamInt( AParam->Data, &Addr ) ;
//	FontType = GetASyncLoadParamInt( AParam->Data, &Addr ) ;
	EdgeSize = GetASyncLoadParamInt( AParam->Data, &Addr ) ;

	Result = LoadFontDataFromMemToHandle_UseGParam_Static( GParam, FontHandle, FontDataImage, FontDataImageSize, EdgeSize, TRUE ) ;
	if( !FONTHCHK_ASYNC( FontHandle, ManageData ) )
	{
		ManageData->HandleInfo.ASyncLoadResult = Result ;
	}

	DecASyncLoadCount( FontHandle ) ;
	if( Result < 0 )
	{
		SubHandle( FontHandle, FALSE, FALSE ) ;
	}
}

#endif // DX_NON_ASYNCLOAD

// LoadFontDataFromMemToHandle �̃O���[�o���ϐ��ɃA�N�Z�X���Ȃ��o�[�W����
extern int LoadFontDataFromMemToHandle_UseGParam(
	CREATEFONTTOHANDLE_GPARAM *GParam,
	const void *FontDataImage,
	int FontDataImageSize,
	int EdgeSize,
	int Handle,
	int ASyncLoadFlag
)
{
	int FontHandle ;

	CheckActiveState() ;

	// �n���h���̍쐬
	FontHandle = AddHandle( DX_HANDLETYPE_FONT, FALSE, Handle ) ;
	if( FontHandle == -1 )
	{
		return -1 ;
	}

#ifndef DX_NON_ASYNCLOAD
	if( ASyncLoadFlag )
	{
		ASYNCLOADDATA_COMMON *AParam = NULL ;
		int Addr ;

		// �p�����[�^�ɕK�v�ȃ������̃T�C�Y���Z�o
		Addr = 0 ;
		AddASyncLoadParamStruct( NULL, &Addr, GParam, sizeof( *GParam ) ) ;
		AddASyncLoadParamInt( NULL, &Addr, FontHandle ) ;
		AddASyncLoadParamConstVoidP( NULL, &Addr, FontDataImage ) ;
		AddASyncLoadParamInt( NULL, &Addr, FontDataImageSize ) ;
		AddASyncLoadParamInt( NULL, &Addr, EdgeSize ) ;

		// �������̊m��
		AParam = AllocASyncLoadDataMemory( Addr ) ;
		if( AParam == NULL )
			goto ERR ;

		// �����ɕK�v�ȏ����Z�b�g
		AParam->ProcessFunction = LoadFontDataFromMemToHandle_UseGParam_ASync ;
		Addr = 0 ;
		AddASyncLoadParamStruct( AParam->Data, &Addr, GParam, sizeof( *GParam ) ) ;
		AddASyncLoadParamInt( AParam->Data, &Addr, FontHandle ) ;
		AddASyncLoadParamConstVoidP( AParam->Data, &Addr, FontDataImage ) ;
		AddASyncLoadParamInt( AParam->Data, &Addr, FontDataImageSize ) ;
		AddASyncLoadParamInt( AParam->Data, &Addr, EdgeSize ) ;

		// �f�[�^��ǉ�
		if( AddASyncLoadData( AParam ) < 0 )
		{
			DXFREE( AParam ) ;
			AParam = NULL ;
			goto ERR ;
		}

		// �񓯊��ǂݍ��݃J�E���g���C���N�������g
		IncASyncLoadCount( FontHandle, AParam->Index ) ;
	}
	else
#endif // DX_NON_ASYNCLOAD
	{
		if( LoadFontDataFromMemToHandle_UseGParam_Static( GParam, FontHandle, FontDataImage, FontDataImageSize, EdgeSize, FALSE ) < 0 )
			goto ERR ;
	}

	// �I��
	return FontHandle ;

ERR :
	SubHandle( FontHandle, ASyncLoadFlag, FALSE ) ;

	return -1 ;
}














// LoadFontDataToHandle_UseGParam �̎������֐�
static int LoadFontDataToHandle_UseGParam_Static(
	CREATEFONTTOHANDLE_GPARAM *GParam,
	int FontHandle,
	const wchar_t *FileName,
	int EdgeSize,
	int ASyncThread
)
{
	FONTMANAGE *ManageData = NULL ;
	DWORD_PTR fp = 0 ;
	size_t FontDataImageSize ;
	void *FontDataImage = NULL ;
	int Result = -1 ;

	FONTHCHK( FontHandle, ManageData ) ;
	
	fp = DX_FOPEN( FileName ) ;
	if( fp == 0 )
	{
		DXST_LOGFILEFMT_ADDW(( L"Font Data File Open Error : %s", FileName )) ;
		goto END ;
	}

	DX_FSEEK( fp, 0, SEEK_END ) ;
	FontDataImageSize = ( size_t )DX_FTELL( fp ) ;
	DX_FSEEK( fp, 0, SEEK_SET ) ;
	
	FontDataImage = DXALLOC( FontDataImageSize ) ;
	if( FontDataImage == NULL )
	{
		DXST_LOGFILEFMT_ADDW(( L"Font Data File Load : Memory Alloc Error : %s", FileName )) ;
		goto END ;
	}
	
	DX_FREAD( FontDataImage, FontDataImageSize, 1, fp ) ;
	DX_FCLOSE( fp ) ;
	fp = 0 ;

	Result = LoadFontDataFromMemToHandle_UseGParam_Static( GParam, FontHandle, FontDataImage, ( int )FontDataImageSize, EdgeSize, ASyncThread ) ;

END :
	if( fp != 0 )
	{
		DX_FCLOSE( fp ) ;
	}

	if( FontDataImage != NULL )
	{
		DXFREE( FontDataImage ) ;
	}

	return Result ;
}

#ifndef DX_NON_ASYNCLOAD

// LoadFontDataToHandle_UseGParam �̔񓯊��ǂݍ��݃X���b�h����Ă΂��֐�
static void LoadFontDataToHandle_UseGParam_ASync( ASYNCLOADDATA_COMMON *AParam )
{
	CREATEFONTTOHANDLE_GPARAM *GParam ;
	int FontHandle ;
	const wchar_t *FileName ;
	int EdgeSize ;
	int Addr ;
	int Result ;
	FONTMANAGE *ManageData ;

	Addr = 0 ;
	GParam = ( CREATEFONTTOHANDLE_GPARAM * )GetASyncLoadParamStruct( AParam->Data, &Addr ) ;
	FontHandle = GetASyncLoadParamInt( AParam->Data, &Addr ) ;
	FileName = GetASyncLoadParamString( AParam->Data, &Addr ) ;
	EdgeSize = GetASyncLoadParamInt( AParam->Data, &Addr ) ;

	Result = LoadFontDataToHandle_UseGParam_Static( GParam, FontHandle, FileName, EdgeSize, TRUE ) ;
	if( !FONTHCHK_ASYNC( FontHandle, ManageData ) )
	{
		ManageData->HandleInfo.ASyncLoadResult = Result ;
	}

	DecASyncLoadCount( FontHandle ) ;
	if( Result < 0 )
	{
		SubHandle( FontHandle, FALSE, FALSE ) ;
	}
}

#endif // DX_NON_ASYNCLOAD

// LoadFontDataToHandle_UseGParam �̃O���[�o���ϐ��ɃA�N�Z�X���Ȃ��o�[�W����
extern int LoadFontDataToHandle_UseGParam(
	CREATEFONTTOHANDLE_GPARAM *GParam,
	const wchar_t *FileName,
	int EdgeSize,
	int ASyncLoadFlag
)
{
	int FontHandle ;

	CheckActiveState() ;

	// �n���h���̍쐬
	FontHandle = AddHandle( DX_HANDLETYPE_FONT, FALSE, -1 ) ;
	if( FontHandle == -1 )
	{
		return -1 ;
	}

#ifndef DX_NON_ASYNCLOAD
	if( ASyncLoadFlag )
	{
		ASYNCLOADDATA_COMMON *AParam = NULL ;
		int Addr ;

		// �p�����[�^�ɕK�v�ȃ������̃T�C�Y���Z�o
		Addr = 0 ;
		AddASyncLoadParamStruct( NULL, &Addr, GParam, sizeof( *GParam ) ) ;
		AddASyncLoadParamInt( NULL, &Addr, FontHandle ) ;
		AddASyncLoadParamString( NULL, &Addr, FileName ) ;
		AddASyncLoadParamInt( NULL, &Addr, EdgeSize ) ;

		// �������̊m��
		AParam = AllocASyncLoadDataMemory( Addr ) ;
		if( AParam == NULL )
			goto ERR ;

		// �����ɕK�v�ȏ����Z�b�g
		AParam->ProcessFunction = LoadFontDataToHandle_UseGParam_ASync ;
		Addr = 0 ;
		AddASyncLoadParamStruct( AParam->Data, &Addr, GParam, sizeof( *GParam ) ) ;
		AddASyncLoadParamInt( AParam->Data, &Addr, FontHandle ) ;
		AddASyncLoadParamString( AParam->Data, &Addr, FileName ) ;
		AddASyncLoadParamInt( AParam->Data, &Addr, EdgeSize ) ;

		// �f�[�^��ǉ�
		if( AddASyncLoadData( AParam ) < 0 )
		{
			DXFREE( AParam ) ;
			AParam = NULL ;
			goto ERR ;
		}

		// �񓯊��ǂݍ��݃J�E���g���C���N�������g
		IncASyncLoadCount( FontHandle, AParam->Index ) ;
	}
	else
#endif // DX_NON_ASYNCLOAD
	{
		if( LoadFontDataToHandle_UseGParam_Static( GParam, FontHandle, FileName, EdgeSize, FALSE ) < 0 )
			goto ERR ;
	}

	// �I��
	return FontHandle ;

ERR :
	SubHandle( FontHandle, ASyncLoadFlag, FALSE ) ;

	return -1 ;
}







// �V�����t�H���g�f�[�^���쐬
extern int CreateFontToHandle_WCHAR_T( const wchar_t *FontName,
									int Size, int Thick,
									int FontType, int CharSet,
									int EdgeSize, int Italic,
									int Handle )
{
	CREATEFONTTOHANDLE_GPARAM GParam ;

	InitCreateFontToHandleGParam( &GParam ) ;

	return CreateFontToHandle_UseGParam( &GParam, FontName, Size, Thick, FontType, CharSet, EdgeSize, Italic, Handle, GetASyncLoadFlag() ) ;
}

// �V�����t�H���g�f�[�^���쐬
extern int NS_CreateFontToHandle( const TCHAR *FontName,
									int Size, int Thick,
									int FontType, int CharSet,
									int EdgeSize, int Italic,
									int Handle )
{
#ifdef UNICODE
	return CreateFontToHandle_WCHAR_T( FontName, Size, Thick, FontType, CharSet, EdgeSize, Italic, Handle ) ;
#else
	int Result ;

	TCHAR_TO_WCHAR_T_STRING_ONE_BEGIN( FontName, return -1 )

	Result = CreateFontToHandle_WCHAR_T( UseFontNameBuffer, Size, Thick, FontType, CharSet, EdgeSize, Italic, Handle ) ;

	TCHAR_TO_WCHAR_T_STRING_END( FontName )

	return Result ;
#endif
}

// �t�H���g�n���h�����쐬����
extern int NS_CreateFontToHandleWithStrLen( const TCHAR *FontName, size_t FontNameLength, int Size, int Thick, int FontType, int CharSet, int EdgeSize, int Italic, int Handle)
{
	int Result ;
#ifdef UNICODE
	WCHAR_T_STRING_WITH_STRLEN_TO_WCHAR_T_STRING_ONE_BEGIN( FontName, FontNameLength, return -1 )
	Result = CreateFontToHandle_WCHAR_T( UseFontNameBuffer, Size, Thick, FontType, CharSet, EdgeSize, Italic, Handle ) ;
	WCHAR_T_STRING_WITH_STRLEN_TO_WCHAR_T_STRING_END( FontName )
#else
	TCHAR_STRING_WITH_STRLEN_TO_WCHAR_T_STRING_ONE_BEGIN( FontName, FontNameLength, return -1 )
	Result = CreateFontToHandle_WCHAR_T( UseFontNameBuffer, Size, Thick, FontType, CharSet, EdgeSize, Italic, Handle ) ;
	TCHAR_STRING_WITH_STRLEN_TO_WCHAR_T_STRING_END( FontName )
#endif
	return Result ;
}

// �t�H���g�f�[�^�t�@�C������t�H���g�n���h�����쐬����
extern int LoadFontDataToHandle_WCHAR_T( const wchar_t *FileName, int EdgeSize )
{
	CREATEFONTTOHANDLE_GPARAM GParam ;

	InitCreateFontToHandleGParam( &GParam ) ;

	return LoadFontDataToHandle_UseGParam( &GParam, FileName, EdgeSize, GetASyncLoadFlag() ) ;
}

// �t�H���g�f�[�^�t�@�C������t�H���g�n���h�����쐬����
extern int NS_LoadFontDataToHandle( const TCHAR *FileName, int EdgeSize )
{
#ifdef UNICODE
	return LoadFontDataToHandle_WCHAR_T( FileName, EdgeSize ) ;
#else
	int Result ;

	TCHAR_TO_WCHAR_T_STRING_ONE_BEGIN( FileName, return -1 )

	Result = LoadFontDataToHandle_WCHAR_T( UseFileNameBuffer, EdgeSize ) ;

	TCHAR_TO_WCHAR_T_STRING_END( FileName )

	return Result ;
#endif
}

// �t�H���g�f�[�^�t�@�C������t�H���g�n���h�����쐬����
extern int NS_LoadFontDataToHandleWithStrLen( const TCHAR *FileName, size_t FileNameLength, int EdgeSize )
{
	int Result ;
#ifdef UNICODE
	WCHAR_T_STRING_WITH_STRLEN_TO_WCHAR_T_STRING_ONE_BEGIN( FileName, FileNameLength, return -1 )
	Result = LoadFontDataToHandle_WCHAR_T( UseFileNameBuffer, EdgeSize ) ;
	WCHAR_T_STRING_WITH_STRLEN_TO_WCHAR_T_STRING_END( FileName )
#else
	TCHAR_STRING_WITH_STRLEN_TO_WCHAR_T_STRING_ONE_BEGIN( FileName, FileNameLength, return -1 )
	Result = LoadFontDataToHandle_WCHAR_T( UseFileNameBuffer, EdgeSize ) ;
	TCHAR_STRING_WITH_STRLEN_TO_WCHAR_T_STRING_END( FileName )
#endif
	return Result ;
}

// ��������̃t�H���g�f�[�^�t�@�C���C���[�W����t�H���g�n���h�����쐬����
extern int NS_LoadFontDataFromMemToHandle( const void *FontDataImage, int FontDataImageSize, int EdgeSize )
{
	CREATEFONTTOHANDLE_GPARAM GParam ;

	InitCreateFontToHandleGParam( &GParam ) ;

	return LoadFontDataFromMemToHandle_UseGParam( &GParam, FontDataImage, FontDataImageSize, EdgeSize, -1, GetASyncLoadFlag() ) ;
}

// ���Ԃ�ύX����
extern int NS_SetFontSpaceToHandle( int Pixel, int FontHandle )
{
	FONTMANAGE * ManageData ;

	DEFAULT_FONT_HANDLE_SETUP

	// �G���[����
	if( FONTHCHK( FontHandle, ManageData ) )
		return -1 ;
	
	ManageData->Space = Pixel ;
	
	// �I��
	return 0 ;
}

// �t�H���g�n���h���̍s�Ԃ�ύX����
extern int NS_SetFontLineSpaceToHandle( int Pixel, int FontHandle )
{
	FONTMANAGE * ManageData ;

	DEFAULT_FONT_HANDLE_SETUP

	// �G���[����
	if( FONTHCHK( FontHandle, ManageData ) )
		return -1 ;
	
	ManageData->LineSpaceValidFlag = TRUE ;
	ManageData->LineSpace = Pixel ;
	
	// �I��
	return 0 ;
}

// �w��̃t�H���g�n���h�����g�p����֐��̈����ɓn��������̕����R�[�h�`����ݒ肷��( UNICODE�łł͖��� )
extern int NS_SetFontCharCodeFormatToHandle( int CharCodeFormat /* DX_CHARCODEFORMAT_SHIFTJIS �� */ , int FontHandle )
{
	FONTMANAGE * ManageData ;

	DEFAULT_FONT_HANDLE_SETUP

	// �G���[����
	if( FONTHCHK( FontHandle, ManageData ) )
		return -1 ;
	
	ManageData->UseCharCodeFormat = CharCodeFormat ;
	
	// �I��
	return 0 ;
}

// �f�t�H���g�t�H���g�̃X�e�[�^�X���ꊇ�ݒ肷��
extern int SetDefaultFontState_WCHAR_T( const wchar_t *FontName, int Size, int Thick, int FontType, int CharSet, int EdgeSize, int Italic )
{
	if( FontType 	< 0 ) FontType 	= FSYS.AntialiasingFontOnlyFlag ? DX_FONTTYPE_ANTIALIASING : DEFAULT_FONT_TYPE ;
	if( EdgeSize	> 1 ) FontType	|= DX_FONTTYPE_EDGE ;

	if( Size 		< 0 ) Size 		= DEFAULT_FONT_SIZE ;
	if( Thick 		< 0 ) Thick 	= DEFAULT_FONT_THICKNESS ;
	if( EdgeSize	< 0 ) EdgeSize	= DEFAULT_FONT_EDGESIZE ;
//	if( CharSet		< 0 ) CharSet   = _GET_CHARSET() ;

	_WCSCPY_S( FSYS.DefaultFontName, sizeof( FSYS.DefaultFontName ), FontName != NULL ? FontName : L"" ) ;
	FSYS.DefaultFontType     = FontType ;
	FSYS.DefaultFontSize     = Size ;
	FSYS.DefaultFontThick    = Thick ;
	if( FSYS.DefaultFontCharSet != CharSet )
	{
		FSYS.DefaultFontCharSet_Change = TRUE ;
		FSYS.DefaultFontCharSet = CharSet ;
	}
	FSYS.DefaultFontEdgeSize = EdgeSize ;
	FSYS.DefaultFontItalic   = Italic ;

	// �������O�̏ꍇ�͂����ŏI��
	if( FSYS.InitializeFlag == FALSE )
	{
		FSYS.EnableInitDefaultFontName     = TRUE ;
		FSYS.EnableInitDefaultFontType     = TRUE ;
		FSYS.EnableInitDefaultFontSize     = TRUE ;
		FSYS.EnableInitDefaultFontThick    = TRUE ;
		FSYS.EnableInitDefaultFontCharSet  = TRUE ;
		FSYS.EnableInitDefaultFontEdgeSize = TRUE ;
		FSYS.EnableInitDefaultFontItalic   = TRUE ;

		return 0 ;
	}
	
	RefreshDefaultFont() ;

	// �I��
	return 0 ;
}

// �f�t�H���g�t�H���g�̃X�e�[�^�X���ꊇ�ݒ肷��
extern int NS_SetDefaultFontState( const TCHAR *FontName, int Size, int Thick, int FontType, int CharSet, int EdgeSize, int Italic )
{
#ifdef UNICODE
	return SetDefaultFontState_WCHAR_T( FontName, Size, Thick, FontType, CharSet, EdgeSize, Italic ) ;
#else
	wchar_t DefaultFontNameBuffer[ 256 ] ;
	wchar_t *TempFontNameBuffer = NULL ;
	wchar_t *UseFontNameBuffer ;
	int Length ;
	int Result ;

	Length = ( int )_STRLEN( FontName ) ;
	if( Length * 2 > 255 )
	{
		TempFontNameBuffer = ( wchar_t * )DXALLOC( sizeof( wchar_t ) * ( Length * 2 + 1 ) ) ;
		if( TempFontNameBuffer == NULL )
		{
			return -1 ;
		}
		UseFontNameBuffer = TempFontNameBuffer ;
	}
	else
	{
		UseFontNameBuffer = DefaultFontNameBuffer ;
	}
	ConvString( ( const char * )FontName, Length, _TCHARCODEFORMAT, ( char * )UseFontNameBuffer, sizeof( wchar_t ) * ( Length * 2 + 1 ), WCHAR_T_CHARCODEFORMAT ) ;
	Result = SetDefaultFontState_WCHAR_T( UseFontNameBuffer, Size, Thick, FontType, CharSet, EdgeSize, Italic ) ;

	if( TempFontNameBuffer != NULL )
	{
		DXFREE( TempFontNameBuffer ) ;
	}

	return Result ;
#endif
}

// �f�t�H���g�t�H���g�n���h���̐ݒ��ύX����
extern int NS_SetDefaultFontStateWithStrLen( const TCHAR *FontName, size_t FontNameLength, int Size, int Thick, int FontType, int CharSet, int EdgeSize, int Italic )
{
	int Result ;
	TCHAR_STRING_WITH_STRLEN_TO_TCHAR_STRING_ONE_BEGIN( FontName, FontNameLength, return -1 )
	Result = NS_SetDefaultFontState( UseFontNameBuffer, Size, Thick, FontType, CharSet, EdgeSize, Italic ) ;
	TCHAR_STRING_WITH_STRLEN_TO_TCHAR_STRING_END( FontName )
	return Result ;
}

// �t�H���g�L���b�V���̐�����I������
extern int NS_DeleteFontToHandle( int FontHandle )
{
	return SubHandle( FontHandle, GetASyncLoadFlag(), FALSE ) ;
}

// ������� TRUE �ɂ���t���O�ւ̃|�C���^��ݒ肷��
extern int NS_SetFontLostFlag( int FontHandle, int *LostFlag )
{
	FONTMANAGE * ManageData ;

	DEFAULT_FONT_HANDLE_SETUP

	// �G���[����
	if( FONTHCHK( FontHandle, ManageData ) )
		return -1 ;

	ManageData->LostFlag = LostFlag ;
	if( LostFlag != NULL ) *LostFlag = FALSE ;

	return 0 ;
}

// �w��̕����̑���ɕ`�悷��O���t�B�b�N�n���h����o�^����
extern int AddFontImageToHandle_WCHAR_T( int FontHandle, const wchar_t *Char, int GrHandle, int DrawX, int DrawY, int AddX )
{
#ifndef DX_NON_GRAPHICS
	DWORD CodeUnicode ;
	int UseSize ;
	int SizeX ;
	int SizeY ;
	int i ;
	FONTMANAGE * ManageData ;
	FONTCHARDATA *fontcode ;

	DEFAULT_FONT_HANDLE_SETUP

	// �G���[����
	if( FONTHCHK( FontHandle, ManageData ) )
	{
		return -1  ;
	}

	// �R�[�h���擾
	CodeUnicode = GetCharCode( ( const char * )Char, WCHAR_T_CHARCODEFORMAT, &UseSize ) ;

	// ���ɓ����������o�^����Ă�����㏑������
	fontcode = ManageData->GraphHandleFontImage ;
	for( i = 0 ; i < ManageData->GraphHandleFontImageNum ; i ++, fontcode ++ )
	{
		if( fontcode->CodeUnicode == CodeUnicode )
		{
			break ;
		}
	}

	// ���������ꍇ�͏�������₷
	if( i == ManageData->GraphHandleFontImageNum )
	{
		// ���ɓo�^������t�̏ꍇ�̓G���[
		if( ManageData->GraphHandleFontImageNum >= FONT_GRAPHICHANDLE_IMAGE_MAXNUM )
		{
			return -1 ;
		}

		ManageData->GraphHandleFontImageNum ++ ;
	}

	// ����ݒ�
	fontcode->CodeUnicode     = CodeUnicode ;
	fontcode->ValidFlag       = TRUE ;
	fontcode->GraphHandleFlag = TRUE ;
	fontcode->DrawX           = ( short )DrawX ;
	fontcode->DrawY           = ( short )DrawY ;
	fontcode->AddX            = ( short )AddX ;
	NS_GetGraphSize( GrHandle, &SizeX, &SizeY ) ;
	fontcode->SizeX           = ( WORD )SizeX ;
	fontcode->SizeY           = ( WORD )SizeY ;
	fontcode->GraphIndex      = GrHandle ;
	fontcode->CodeData        = NULL ;

	// ����I��
	return 0 ;
#else // DX_NON_GRAPHICS
	return -1 ;
#endif // DX_NON_GRAPHICS
}

// �w��̕����̑���ɕ`�悷��O���t�B�b�N�n���h����o�^����
extern int NS_AddFontImageToHandle( int FontHandle, const TCHAR *Char, int GrHandle, int DrawX, int DrawY, int AddX )
{
#ifdef UNICODE
	return AddFontImageToHandle_WCHAR_T( FontHandle, Char, GrHandle, DrawX, DrawY, AddX ) ;
#else
	int Result ;
	FONTHANDLE_TCHAR_TO_WCHAR_T_STRING_BEGIN( Char, -1 )

	Result = AddFontImageToHandle_WCHAR_T( FontHandle, UseStringBuffer, GrHandle, DrawX, DrawY, AddX ) ;

	FONTHANDLE_TCHAR_TO_WCHAR_T_STRING_END

	return Result ;
#endif
}

// �w��̕����̑���ɕ`�悷��O���t�B�b�N�n���h����o�^����
extern int NS_AddFontImageToHandleWithStrLen( int FontHandle, const TCHAR *Char, size_t CharLength, int GrHandle, int DrawX, int DrawY, int AddX )
{
	int Result ;
#ifdef UNICODE
	FONTHANDLE_WCHAR_T_WITH_STRLENGTH_TO_WCHAR_T_STRING_BEGIN( Char, CharLength, -1 )
	Result = AddFontImageToHandle_WCHAR_T( FontHandle, UseStringBuffer, GrHandle, DrawX, DrawY, AddX ) ;
	FONTHANDLE_WCHAR_T_TO_WCHAR_T_STRING_END
#else
	FONTHANDLE_TCHAR_WITH_STRLENGTH_TO_WCHAR_T_STRING_BEGIN( Char, CharLength, -1 )
	Result = AddFontImageToHandle_WCHAR_T( FontHandle, UseStringBuffer, GrHandle, DrawX, DrawY, AddX ) ;
	FONTHANDLE_TCHAR_TO_WCHAR_T_STRING_END
#endif
	return Result ;
}

// �w��̕����̑���ɕ`�悷��O���t�B�b�N�n���h���̓o�^����������
extern int SubFontImageToHandle_WCHAR_T( int FontHandle, const wchar_t *Char )
{
	DWORD CodeUnicode ;
	int UseSize ;
	int i ;
	FONTMANAGE * ManageData ;
	FONTCHARDATA *fontcode ;

	DEFAULT_FONT_HANDLE_SETUP

	// �G���[����
	if( FONTHCHK( FontHandle, ManageData ) )
	{
		return -1  ;
	}

	// �R�[�h���擾
	CodeUnicode = GetCharCode( ( const char * )Char, WCHAR_T_CHARCODEFORMAT, &UseSize ) ;

	// �w��̕������o�^����Ă��Ȃ�������G���[
	fontcode = ManageData->GraphHandleFontImage ;
	for( i = 0 ; i < ManageData->GraphHandleFontImageNum ; i ++, fontcode ++ )
	{
		if( fontcode->CodeUnicode == CodeUnicode )
		{
			break ;
		}
	}
	if( i == ManageData->GraphHandleFontImageNum )
	{
		return -1 ;
	}

	// ���̐������炷
	ManageData->GraphHandleFontImageNum -- ;

	// ���[�ł͖��������ꍇ�����l�߂�
	if( i != ManageData->GraphHandleFontImageNum )
	{
		_MEMMOVE(
			&ManageData->GraphHandleFontImage[ i     ],
			&ManageData->GraphHandleFontImage[ i + 1 ],
			sizeof( FONTCHARDATA ) * ( ManageData->GraphHandleFontImageNum - i )
		) ;
	}

	// ����I��
	return 0 ;
}

// �w��̕����̑���ɕ`�悷��O���t�B�b�N�n���h���̓o�^����������
extern int NS_SubFontImageToHandle( int FontHandle, const TCHAR *Char )
{
#ifdef UNICODE
	return SubFontImageToHandle_WCHAR_T( FontHandle, Char ) ;
#else
	int Result ;
	FONTHANDLE_TCHAR_TO_WCHAR_T_STRING_BEGIN( Char, -1 )

	Result = SubFontImageToHandle_WCHAR_T( FontHandle, UseStringBuffer ) ;

	FONTHANDLE_TCHAR_TO_WCHAR_T_STRING_END

	return Result ;
#endif
}

// �w��̕����̑���ɕ`�悷��O���t�B�b�N�n���h���̓o�^����������
extern int NS_SubFontImageToHandleWithStrLen( int FontHandle, const TCHAR *Char, size_t CharLength )
{
	int Result ;
#ifdef UNICODE
	FONTHANDLE_WCHAR_T_WITH_STRLENGTH_TO_WCHAR_T_STRING_BEGIN( Char, CharLength, -1 )
	Result = SubFontImageToHandle_WCHAR_T( FontHandle, UseStringBuffer ) ;
	FONTHANDLE_WCHAR_T_TO_WCHAR_T_STRING_END
#else
	FONTHANDLE_TCHAR_WITH_STRLENGTH_TO_WCHAR_T_STRING_BEGIN( Char, CharLength, -1 )
	Result = SubFontImageToHandle_WCHAR_T( FontHandle, UseStringBuffer ) ;
	FONTHANDLE_TCHAR_TO_WCHAR_T_STRING_END
#endif
	return Result ;
}

// ��փt�H���g�n���h����o�^����
extern int NS_AddSubstitutionFontToHandle( int FontHandle, int SubstitutionFontHandle, int DrawX, int DrawY )
{
	FONTMANAGE * ManageData ;

	DEFAULT_FONT_HANDLE_SETUP

	// �G���[����
	if( FONTHCHK( FontHandle, ManageData ) )
	{
		return -1  ;
	}

	// �o�^�ł��鐔�̍ő吔�ɒB���Ă�����G���[
	if( ManageData->SubstitutionInfoNum == FONT_SUBSTITUTION_MAXNUM )
	{
		return -1 ;
	}

	ManageData->SubstitutionInfo[ ManageData->SubstitutionInfoNum ].SubstitutionFontHandle = SubstitutionFontHandle ;
	ManageData->SubstitutionInfo[ ManageData->SubstitutionInfoNum ].DrawX = DrawX ;
	ManageData->SubstitutionInfo[ ManageData->SubstitutionInfoNum ].DrawY = DrawY ;

	ManageData->SubstitutionInfoNum ++ ;

	// ����I��
	return 0 ;
}

// ��փt�H���g�n���h���̓o�^����������
extern int NS_SubSubstitutionFontToHandle( int FontHandle, int SubstitutionFontHandle )
{
	FONTMANAGE * ManageData ;
	int i ;

	DEFAULT_FONT_HANDLE_SETUP

	// �G���[����
	if( FONTHCHK( FontHandle, ManageData ) )
	{
		return -1  ;
	}

	for( i = 0 ; i < ManageData->SubstitutionInfoNum ; i ++ )
	{
		if( ManageData->SubstitutionInfo[ i ].SubstitutionFontHandle == SubstitutionFontHandle )
		{
			break ;
		}
	}

	// �w��̃t�H���g��������Ȃ�������G���[
	if( i == ManageData->SubstitutionInfoNum )
	{
		return -1 ;
	}

	ManageData->SubstitutionInfoNum -- ;
	if( ManageData->SubstitutionInfoNum - i > 0 )
	{
		_MEMMOVE( &ManageData->SubstitutionInfo[ i ], &ManageData->SubstitutionInfo[ i + 1 ], sizeof( FONTSUBSTITUTIONINFO ) * ( ManageData->SubstitutionInfoNum - i ) ) ;
	}

	// ����I��
	return 0 ;
}

// �f�t�H���g�t�H���g�n���h���̃t�H���g�����擾����
extern const TCHAR *NS_GetFontName( void )
{
	return NS_GetFontNameToHandle( DX_DEFAULT_FONT_HANDLE ) ;
}

// �`�悷��t�H���g�̃T�C�Y���Z�b�g����
extern int NS_SetFontSize( int FontSize )
{
	if( FontSize == -1 ) FontSize = DEFAULT_FONT_SIZE ;

	FSYS.DefaultFontSize = FontSize ;

	// �������O�̏ꍇ�͂����ŏI��
	if( FSYS.InitializeFlag == FALSE )
	{
		FSYS.EnableInitDefaultFontSize = TRUE ;

		return 0 ;
	}

	RefreshDefaultFont() ;

	// �I��
	return 0 ;
}


// �t�H���g�̑������Z�b�g
extern int NS_SetFontThickness( int ThickPal )
{
	if( ThickPal == -1 ) ThickPal = DEFAULT_FONT_THICKNESS ;

	FSYS.DefaultFontThick = ThickPal ;

	// �������O�̏ꍇ�͂����ŏI��
	if( FSYS.InitializeFlag == FALSE )
	{
		FSYS.EnableInitDefaultFontThick = TRUE ;

		return 0 ;
	}

	RefreshDefaultFont() ;

	// �I��
	return 0 ;
}

// ���Ԃ�ύX����
extern int NS_SetFontSpace( int Pixel )
{
	// �������O�̏ꍇ�͂����ŏI��
	if( FSYS.InitializeFlag == FALSE )
	{
		FSYS.DefaultFontSpace = Pixel ;

		FSYS.EnableInitDefaultFontSpace = TRUE ;

		return 0 ;
	}

	RefreshDefaultFont() ;

	FSYS.DefaultFontSpace = Pixel ;

	NS_SetFontSpaceToHandle( Pixel, FSYS.DefaultFontHandle ) ;

	// �I��
	return 0 ;
}

// �f�t�H���g�t�H���g�n���h���̎��Ԃ��擾����
extern int NS_GetFontSpace( void )
{
	return NS_GetFontSpaceToHandle( DX_DEFAULT_FONT_HANDLE ) ;
}

// �f�t�H���g�t�H���g�n���h���̍s�Ԃ�ύX����
extern int NS_SetFontLineSpace( int Pixel )
{
	// �������O�̏ꍇ�͂����ŏI��
	if( FSYS.InitializeFlag == FALSE )
	{
		FSYS.DefaultFontLineSpaceValid = TRUE ;
		FSYS.DefaultFontLineSpace = Pixel ;

		FSYS.EnableInitDefaultFontLineSpace = TRUE ;

		return 0 ;
	}

	RefreshDefaultFont() ;

	FSYS.DefaultFontLineSpaceValid = TRUE ;
	FSYS.DefaultFontLineSpace = Pixel ;

	NS_SetFontLineSpaceToHandle( Pixel, FSYS.DefaultFontHandle ) ;

	// �I��
	return 0 ;
}

// �f�t�H���g�t�H���g�n���h���̍s�Ԃ��擾����
extern int NS_GetFontLineSpace( void )
{
	return NS_GetFontLineSpaceToHandle( DX_DEFAULT_FONT_HANDLE ) ;
}

// �f�t�H���g�t�H���g�n���h�����g�p����֐��̈����ɓn��������̕����R�[�h�`����ݒ肷��( UNICODE�łł͖��� )
extern int NS_SetFontCharCodeFormat( int CharCodeFormat /* DX_CHARCODEFORMAT_SHIFTJIS �� */ )
{
	return NS_SetFontCharCodeFormatToHandle( CharCodeFormat, DX_DEFAULT_FONT_HANDLE ) ;
}

// �t�H���g�̃L���b�V���Ƀe�N�X�`�����g�p���邩�A�t���O���Z�b�g����
extern int NS_SetFontCacheToTextureFlag( int Flag )
{
	// �t���O��ۑ�
	FSYS.NotTextureFlag = !Flag ;
	
	// �I��
	return 0 ;
}

// �t�H���g�̃L���b�V���Ƀe�N�X�`�����g�p���邩�A�t���O���Z�b�g����(�뎚��)
extern int NS_SetFontChacheToTextureFlag( int Flag )
{
	return NS_SetFontCacheToTextureFlag( Flag ) ;
}

// �t�H���g�L���b�V���ŃL���b�V���ł��镶�������w�肷��
extern int NS_SetFontCacheCharNum( int CharNum )
{
	FSYS.CacheCharNum = CharNum ;

	// �I��
	return 0 ;
}


// �f�t�H���g�t�H���g�n���h���Ŏg�p����t�H���g��ύX
extern int ChangeFont_WCHAR_T( const wchar_t *FontName, int CharSet )
{
	_WCSCPY_S( FSYS.DefaultFontName, sizeof( FSYS.DefaultFontName ), FontName != NULL ? FontName : L"" ) ;

//	if( CharSet == -1 )
//		CharSet = _GET_CHARSET() ;

	if( FSYS.DefaultFontCharSet != CharSet )
	{
		FSYS.DefaultFontCharSet_Change = TRUE ;
		FSYS.DefaultFontCharSet = CharSet ;
	}

	// �������O�̏ꍇ�͂����ŏI��
	if( FSYS.InitializeFlag == FALSE )
	{
		FSYS.EnableInitDefaultFontName = TRUE ;
		FSYS.EnableInitDefaultFontCharSet = TRUE ;

		return 0 ;
	}

	RefreshDefaultFont() ;

	// �I��
	return 0 ;
}

// �t�H���g��ύX
extern int NS_ChangeFont( const TCHAR *FontName, int CharSet )
{
#ifdef UNICODE
	return ChangeFont_WCHAR_T( FontName, CharSet ) ;
#else
	wchar_t DefaultFontNameBuffer[ 256 ] ;
	wchar_t *TempFontNameBuffer = NULL ;
	wchar_t *UseFontNameBuffer ;
	int Length ;
	int Result ;

	Length = ( int )_STRLEN( FontName ) ;
	if( Length * 2 > 255 )
	{
		TempFontNameBuffer = ( wchar_t * )DXALLOC( sizeof( wchar_t ) * ( Length * 2 + 1 ) ) ;
		if( TempFontNameBuffer == NULL )
		{
			return -1 ;
		}
		UseFontNameBuffer = TempFontNameBuffer ;
	}
	else
	{
		UseFontNameBuffer = DefaultFontNameBuffer ;
	}
	ConvString( ( const char * )FontName, Length, _TCHARCODEFORMAT, ( char * )UseFontNameBuffer, sizeof( wchar_t ) * ( Length * 2 + 1 ), WCHAR_T_CHARCODEFORMAT ) ;
	Result = ChangeFont_WCHAR_T( UseFontNameBuffer, CharSet ) ;

	if( TempFontNameBuffer != NULL )
	{
		DXFREE( TempFontNameBuffer ) ;
	}

	return Result ;
#endif
}

// �f�t�H���g�t�H���g�n���h���Ŏg�p����t�H���g��ύX
extern int NS_ChangeFontWithStrLen( const TCHAR *FontName, size_t FontNameLength, int CharSet )
{
	int Result ;
	TCHAR_STRING_WITH_STRLEN_TO_TCHAR_STRING_ONE_BEGIN( FontName, FontNameLength, return -1 )
	Result = NS_ChangeFont( UseFontNameBuffer, CharSet ) ;
	TCHAR_STRING_WITH_STRLEN_TO_TCHAR_STRING_END( FontName )
	return Result ;
}

// �f�t�H���g�t�H���g�n���h���Ƃ��Ďg�p����t�H���g�n���h����ύX����
extern int NS_ChangeFontFromHandle( int FontHandle )
{
	// �t�H���g�n���h����ۑ�
	FSYS.UserDefaultFontHandle = FontHandle ;

	// �I��
	return 0 ;
}

// �t�H���g�^�C�v�̕ύX
extern int NS_ChangeFontType( int FontType )
{
	if( FontType == -1 )
	{
		FontType = FSYS.AntialiasingFontOnlyFlag ? DX_FONTTYPE_ANTIALIASING : DEFAULT_FONT_TYPE ;
	}

	FSYS.DefaultFontType = FontType ;

	// �������O�̏ꍇ�͂����ŏI��
	if( FSYS.InitializeFlag == FALSE )
	{
		FSYS.EnableInitDefaultFontType = TRUE ;

		return 0 ;
	}

	RefreshDefaultFont() ;

	// �I��
	return 0 ;
}





// �w��̕����R�[�h�̃t�H���g�L���b�V���f�[�^���擾����A�L���b�V�����ɖ����ꍇ�̓L���b�V���ւ̒ǉ������݂āA���s������ NULL ��Ԃ�
__inline FONTCHARDATA *GetFontCacheChar_Inline( FONTMANAGE *ManageData, DWORD CharCode, DWORD IVSCode, FONTMANAGE **UseManageData, int *DrawOffsetX, int *DrawOffsetY, int EnableGraphHandleFontImage, int ErrorMessage )
{
	FONTCHARDATA *Cache ;
	int i ;

	*UseManageData = ManageData ;
	*DrawOffsetX = 0 ;
	*DrawOffsetY = 0 ;

	if( EnableGraphHandleFontImage )
	{
		// �摜�u�����������̃`�F�b�N
		for( i = 0 ; i < ManageData->GraphHandleFontImageNum ; i ++ )
		{
			if( ManageData->GraphHandleFontImage[ i ].CodeUnicode == CharCode &&
				ManageData->GraphHandleFontImage[ i ].IVSCode     == IVSCode )
			{
				return &ManageData->GraphHandleFontImage[ i ] ;
			}
		}
	}

	// �R�[�h���e�[�u���ɓ���͈͂��ǂ����ŏ����𕪊�
	if( CharCode > 0xffff || IVSCode != 0 )
	{
		// �e�[�u���ɓ���Ȃ��ꍇ�͔z�񂩂�T��
		for( i = 0 ; i < ManageData->CodeDataExNum ; i ++ )
		{
			if( ManageData->CodeDataEx[ i ]->CodeUnicode == CharCode &&
				ManageData->CodeDataEx[ i ]->IVSCode     == IVSCode )
			{
				return ManageData->CodeDataEx[ i ] ;
			}
		}
	}
	else
	{
		// �e�[�u���ɓ���ꍇ�̓e�[�u�����g���ėL�����`�F�b�N
		if( ManageData->CodeData[ CharCode ].ExistFlag )
		{
			// �������ꍇ���̃t�H���g�f�[�^�̃|�C���^��ۑ�
			return ManageData->CodeData[ CharCode ].CharData ;
		}
	}

	// ���������ꍇ�L���b�V���ɒǉ�
	Cache = FontCacheCharAddToHandle( 1, &CharCode, &IVSCode, ManageData ) ;
	if( Cache == NULL )
	{
		FONTMANAGE *SubstitutionManageData ;
		int TempDrawOffsetX ;
		int TempDrawOffsetY ;

		// �L���b�V���ւ̒ǉ������s�����ꍇ�͑�փt�H���g���g�p����
SUBSTITUTIONSTART :		
		for( i = 0 ; i < ManageData->SubstitutionInfoNum ; i++ )
		{
			if( FONTHCHK( ManageData->SubstitutionInfo[ i ].SubstitutionFontHandle, SubstitutionManageData ) )
			{
				// �����ɂȂ��Ă���t�H���g�n���h������������O��
				NS_SubSubstitutionFontToHandle( ManageData->HandleInfo.Handle, ManageData->SubstitutionInfo[ i ].SubstitutionFontHandle ) ;
				goto SUBSTITUTIONSTART ;
			}

			Cache = GetFontCacheChar_Inline( SubstitutionManageData, CharCode, IVSCode, UseManageData, &TempDrawOffsetX, &TempDrawOffsetY, EnableGraphHandleFontImage, FALSE ) ;
			if( Cache != NULL )
			{
				*DrawOffsetX = *DrawOffsetX + TempDrawOffsetX + ManageData->SubstitutionInfo[ i ].DrawX ;
				*DrawOffsetY = *DrawOffsetY + TempDrawOffsetY + ManageData->SubstitutionInfo[ i ].DrawY ;
				break ;
			}
		}

		if( Cache == NULL && ErrorMessage )
		{
			DXST_LOGFILE_ADDUTF16LE( GetFontCacheChar_ErrorMessage ) ;
		}
	}

	return Cache ;
}

extern FONTCHARDATA *GetFontCacheChar( FONTMANAGE *ManageData, DWORD CharCode, DWORD IVSCode, FONTMANAGE **UseManageData, int *DrawOffsetX, int *DrawOffsetY, int EnableGraphHandleFontImage, int ErrorMessage )
{
	return GetFontCacheChar_Inline( ManageData, CharCode, IVSCode, UseManageData, DrawOffsetX, DrawOffsetY, EnableGraphHandleFontImage, ErrorMessage ) ;
}

// �������`��
extern int FontCacheStringDrawToHandleST(
	int				DrawFlag,
	int				xi,
	int				yi,
	float			xf,
	float			yf,
	int				PosIntFlag,
	int				ExRateValidFlag,
	double			ExRateX,
	double			ExRateY,
	int				RotateValidFlag,
	float			RotCenterX,
	float			RotCenterY,
	double			RotAngle, 
	const wchar_t *	StrData,
	unsigned int	Color,
	MEMIMG *		DestMemImg,
	const RECT *	ClipRect,
	int				TransFlag,
	FONTMANAGE *	ManageData,
	unsigned int	EdgeColor,
	int				StrLen,
	int				VerticalFlag,
	SIZE *			DrawSize,
	int *			LineCount,
	DRAWCHARINFO *	CharInfos,
	size_t			CharInfoBufferSize,
	int *			CharInfoNum,
	int				CharInfoType /* 0:�ȈՏ��  1:�ڍ׏�� */,
	int				OnlyType /* 0:�ʏ�`�� 1:�{�̂̂� 2:���̂� */
)
{
	static DWORD	DrawStrBuf[ 2048 ] ;		// �`�悷��ۂɎg�p���镶����f�[�^
	static DWORD	DrawIVSBuf[ 2048 ] ;		// �`�悷��ۂɎg�p���镶����IVS�f�[�^
	FONTCHARDATA *	CharData ;
	FONTMANAGE *	UseManageData = ManageData ;
#ifndef DX_NON_GRAPHICS
	RECT			SrcRect = { 0 } ;
	RECT			DstRect ;
#endif // DX_NON_GRAPHICS
	int				DrawCharNum ;				// �Q�o�C�g�����P�o�C�g�����S���Ђ�����߂ĉ��������邩�ۑ�����ϐ�
	int				i ;							// �J��Ԃ��Ɣėp�ϐ�
#ifndef DX_NON_GRAPHICS
	int				SrcX = 0 ;					// �e�L�X�g�L���b�V�����̖ړI�e�L�X�g�̍��W����Ɏg�p
	int				SrcY = 0 ;
#endif // DX_NON_GRAPHICS
	const DWORD *	CharCode ;
	const DWORD *	IVSCode ;
	double			DrawPos ;
	double			MaxDrawPos ;
	double			DrawPosSub ;
	double			DrawPosSubAdd ;
	double			ExRate ;
#ifndef DX_NON_GRAPHICS
	DWORD			OrigColor ;
	DWORD			FColor ;
	DWORD			FEdgeColor ;
	int				IgnoreDrawGraphColor ;
#endif // DX_NON_GRAPHICS
	DWORD			DstPitch = 0 ;
	DWORD			SrcPitch ;
	int				UseAlloc = FALSE ;
	DWORD *			AllocDrawStrBuf = NULL ;
	DWORD *			UseDrawStrBuf ;
	DWORD *			UseDrawIVSBuf ;
	float			RotSin = 0.0f ;
	float			RotCos = 1.0f ;
	int				LFCount = 0 ;
	int				CInfoNum = 0 ;
	int				Result = -1 ;
	int				DrawOffsetX = 0 ;
	int				DrawOffsetY = 0 ;
	int				tmp_xi = 0 ;
	int				tmp_yi = 0 ;
	float			tmp_xf = 0.0f ;
	float			tmp_yf = 0.0f ;
	int				FontAddHeightXI = 0 ;
	int				FontAddHeightYI = 0 ;
	float			FontAddHeightXF = 0.0f ;
	float			FontAddHeightYF = 0.0f ;

//	DEFAULT_FONT_HANDLE_SETUP

#ifndef DX_NON_GRAPHICS
	// �G���[����
	if( ManageData->TextureCacheFlag && Graphics_Hardware_CheckValid_PF() == 0 )
	{
		goto END ;
	}
#endif // DX_NON_GRAPHICS

	// �f�B�t���[�Y�J���[���g�p���邩�ǂ����Ńf�o�C�X�̃X�e�[�g���ω�������ł�
	// �K���f�B�t���[�Y�J���[���g�p����悤�ɂ���
	GSYS.DrawSetting.AlwaysDiffuseColorFlag = TRUE ;

//	if( FONTHCHK( FontHandle, ManageData ) )
//	{
//		goto END ;
//	}
//	DXST_LOGFILE_ADDW( L"�t�H���g�n���h���l���ُ�ł��I�����܂�\n" ) ;
//	DXST_LOGFILEFMT_ADDW(( L"	in FontCacheStringDrawToHandle  StrData = %s   FontHandle = %d  ", StrData, FontHandle )) ;

	// �����l���Z�b�g
	if( DrawSize != NULL )
	{
		DrawSize->cx = 0 ;
		DrawSize->cy = 0 ;
	}
	if( LineCount != NULL )
	{
		*LineCount = 0 ;
	}

	// �\�t�g�E�G�A�����_�����O�̏ꍇ�͐����l�ɂ��`��
	if( DestMemImg != NULL || ManageData->TextureCacheFlag == FALSE )
	{
		PosIntFlag      = TRUE ;

		// �\�t�g�E�G�A�����_�����O�ł͊g��`����]�`��͂ł��Ȃ�
		if( ExRateValidFlag || RotateValidFlag )
		{
			goto END ;
		}
	}

	// �l�̕␳
	if( ExRateValidFlag == FALSE )
	{
		ExRateX = 1.0 ;
		ExRateY = 1.0 ;
	}
	if( RotateValidFlag == FALSE )
	{
		RotCenterX = 0.0f ;
		RotCenterY = 0.0f ;
		RotAngle   = 0.0 ;
	}

	// ��]���L���ȏꍇ�� Sin �� Cos �̒l���擾���Ă���
	if( RotateValidFlag )
	{
		// �c�����̏ꍇ�� 90�x�v���X����
		if( VerticalFlag == TRUE )
		{
			RotAngle += DX_PI / 2.0 ;
		}

		_SINCOS_PLATFORM( ( float )RotAngle, &RotSin, &RotCos ) ;
	}

	// �`����W�̕␳
	if( ManageData->BaseInfo.FontAddHeight != 0 )
	{
		if( VerticalFlag )
		{
			if( PosIntFlag )
			{
				FontAddHeightXI =     -_DTOL( ManageData->BaseInfo.FontAddHeight / 2 * ExRateY ) ;
			}
			else
			{
				FontAddHeightXF = -( float )( ManageData->BaseInfo.FontAddHeight / 2 * ExRateY ) ;
			}
		}
		else
		{
			if( PosIntFlag )
			{
				FontAddHeightYI =     -_DTOL( ManageData->BaseInfo.FontAddHeight / 2 * ExRateY ) ;
			}
			else
			{
				FontAddHeightYF = -( float )( ManageData->BaseInfo.FontAddHeight / 2 * ExRateY ) ;
			}
		}
	}

//	if( DrawFlag && ExRateValidFlag == FALSE || ManageData->TextureCacheFlag == FALSE )
//	{
//		ExRateValidFlag = FALSE ;
//		ExRateX = 1.0 ;
//		ExRateY = 1.0 ;
//	}

	ExRate = VerticalFlag ? ExRateY : ExRateX ;

#ifndef DX_NON_GRAPHICS
	// �R�Q�r�b�g�F�J���[�l���擾���Ă���
	{
		int r, g, b ;
		int er, eg, eb ;
		DWORD NoneRevMask ;
	
		// �c�w���C�u�����ɐݒ肳��Ă���`��P�x�Ə�Z����
		GetColor_Macro( 0, 0, 0, NoneRevMask ) ;
		NoneRevMask = ~NoneRevMask ;
		GetColor2_Macro( Color,     r,  g,  b  ) ;
		GetColor2_Macro( EdgeColor, er, eg, eb ) ;
		if( ( GSYS.DrawSetting.bDrawBright & 0x00ffffff ) != 0x00ffffff )
		{
			RGBCOLOR *bright ;

			bright = &GSYS.DrawSetting.DrawBright ;	

			r  = bright->Red   * r  / 255 ;
			g  = bright->Green * g  / 255 ;
			b  = bright->Blue  * b  / 255 ;

			er = bright->Red   * er / 255 ;
			eg = bright->Green * eg / 255 ;
			eb = bright->Blue  * eb / 255 ;

			GetColor_Macro( r,   g,  b, Color     ) ;
			GetColor_Macro( er, eg, eb, EdgeColor ) ;
		}
		Color      &= NoneRevMask ;
		EdgeColor  &= NoneRevMask ;

		FColor     = ( 0xff000000 ) | ( r  << 16 ) | ( g  << 8 ) | (  b ) ;
		FEdgeColor = ( 0xff000000 ) | ( er << 16 ) | ( eg << 8 ) | ( eb ) ;
	}
#endif // DX_NON_GRAPHICS

	// �����񂪂Ȃ��ꍇ�͏I��
	if( StrData == NULL )
	{
		Result = 0 ;
		goto END ;
	}
	if( StrData[ 0 ] == 0 )
	{
		Result = 0 ;
		goto END ;
	}

	// �`�悷�镶����̒�����ۑ�
	{
		if( StrLen < 0 )
		{
			StrLen = ( int )_WCSLEN( StrData ) ;
		}

		if( StrLen > 1024 )
		{
			UseAlloc = TRUE ;
			AllocDrawStrBuf = ( DWORD * )DXALLOC( StrLen * 2 * sizeof( DWORD ) ) ;
			if( AllocDrawStrBuf == NULL )
			{
				goto END ;
			}
			UseDrawStrBuf = AllocDrawStrBuf ;
			UseDrawIVSBuf = AllocDrawStrBuf + StrLen ;
		}
		else
		{
			UseDrawStrBuf = DrawStrBuf ;
			UseDrawIVSBuf = DrawIVSBuf ;
		}
	}

	// �s�b�`�̃Z�b�g
	if( DestMemImg != NULL )
	{
		DstPitch = DestMemImg->Base->Pitch ;
	}

	// ���s���ɂx���W�ɉ��Z����l���Z�o
	if( VerticalFlag == TRUE )
	{
		DrawPosSubAdd = ( ManageData->LineSpaceValidFlag ? ManageData->LineSpace : ManageData->BaseInfo.FontHeight - ManageData->BaseInfo.FontAddHeight ) * ExRateX ;
	}
	else
	{
		DrawPosSubAdd = ( ManageData->LineSpaceValidFlag ? ManageData->LineSpace : ManageData->BaseInfo.FontHeight - ManageData->BaseInfo.FontAddHeight ) * ExRateY ;
	}

	// �L���b�V���ɓ����Ă��Ȃ���������L���b�V���ɓ����
	FontCacheStringAddToHandle( ManageData, StrData, StrLen, UseDrawStrBuf, UseDrawIVSBuf, &DrawCharNum ) ;

#ifndef DX_NON_GRAPHICS
	if( DrawFlag == TRUE )
	{
		float AdjustPos = 0.0f ;

		// ���W�␳�l���Z�b�g
		if( ManageData->TextureCacheFlag == TRUE )
		{
			AdjustPos = NS_GetDrawFloatCoordType() == DX_DRAWFLOATCOORDTYPE_DIRECT3D9 ? -0.5f : 0.0f ;
		}

		// �`��F��ۑ����Ă���
		OrigColor = GSYS.DrawSetting.bDrawBright ;

		// �`�悷��摜��RGB�𖳎����邩�ǂ����̃t���O��ۑ����Ă���
		IgnoreDrawGraphColor = NS_GetIgnoreDrawGraphColor() ;

		// ���Ȃ��̏ꍇ�͍ŏ��ɕ`��F��ݒ肷��
		if( ( ManageData->FontType & DX_FONTTYPE_EDGE ) == 0 )
		{
			Graphics_DrawSetting_SetDrawBrightToOneParam( FColor ) ;
		}

		// �����̐������J��Ԃ�
		CharCode = UseDrawStrBuf ;			// �`��p�����f�[�^�̐擪�A�h���X���Z�b�g
		IVSCode = UseDrawIVSBuf ;
		DrawPos = 0.0 ;
		MaxDrawPos = 0.0 ;
		DrawPosSub = 0.0 ;
		for( i = 0 ; i < DrawCharNum ; i ++, CharCode ++, IVSCode ++ )
		{
			CharData = NULL ;
			UseManageData = ManageData ;

			// \n �����t���O�������Ă��Ċ��� \n �������ꍇ�͊��S��������
			if( *CharCode == '\n' && FSYS.IgnoreLFFlag )
			{
				continue ;
			}

			// �L���b�V���f�[�^���擾
			CharData = GetFontCacheChar_Inline( ManageData, *CharCode, *IVSCode, &UseManageData, &DrawOffsetX, &DrawOffsetY, TRUE, FALSE ) ;
			if( CharData == NULL )
			{
				goto LOOPEND ;
			}

			// �`����W�̏���
			if( ManageData == UseManageData )
			{
				if( PosIntFlag )
				{
					tmp_xi = xi + FontAddHeightXI ;
					tmp_yi = yi + FontAddHeightYI ;
				}
				else
				{
					tmp_xf = xf + FontAddHeightXF ;
					tmp_yf = yf + FontAddHeightYF ;
				}
			}
			else
			{
				tmp_xi = xi ;
				tmp_yi = yi ;
				tmp_xf = xf ;
				tmp_yf = yf ;
				if( VerticalFlag )
				{
					if( PosIntFlag )
					{
						tmp_xi += _DTOL( DrawOffsetY * ExRateY ) ;
						tmp_yi += _DTOL( DrawOffsetX * ExRateX ) ;
					}
					else
					{
						tmp_xf += ( float )( DrawOffsetY * ExRateY ) ;
						tmp_yf += ( float )( DrawOffsetX * ExRateX ) ;
					}
				}
				else
				{
					if( PosIntFlag )
					{
						tmp_xi += _DTOL( DrawOffsetX * ExRateX ) ;
						tmp_yi += _DTOL( DrawOffsetY * ExRateY ) ;
					}
					else
					{
						tmp_xf += ( float )( DrawOffsetX * ExRateX ) ;
						tmp_yf += ( float )( DrawOffsetY * ExRateY ) ;
					}
				}

				if( UseManageData->BaseInfo.FontAddHeight != 0 )
				{
					if( VerticalFlag )
					{
						if( PosIntFlag )
						{
							tmp_xi -=     _DTOL( UseManageData->BaseInfo.FontAddHeight / 2 * ExRateY ) ;
						}
						else
						{
							tmp_xf -= ( float )( UseManageData->BaseInfo.FontAddHeight / 2 * ExRateY ) ;
						}
					}
					else
					{
						if( PosIntFlag )
						{
							tmp_yi -=     _DTOL( UseManageData->BaseInfo.FontAddHeight / 2 * ExRateY ) ;
						}
						else
						{
							tmp_yf -= ( float )( UseManageData->BaseInfo.FontAddHeight / 2 * ExRateY ) ;
						}
					}
				}
			}

			// �摜�f�[�^�����݂����`���Z�o
			if( CharData->GraphHandleFlag == FALSE )
			{
				SrcY = CharData->GraphIndexY * UseManageData->BaseInfo.MaxWidth ;
				SrcX = CharData->GraphIndexX * UseManageData->BaseInfo.MaxWidth ;
				if( UseManageData->TextureCacheFlag == TRUE )
				{
					SrcX += 1 ;
					SrcY += 1 ;
				}
				SETRECT( SrcRect, SrcX, SrcY, SrcX + CharData->SizeX, SrcY + CharData->SizeY ) ;
			}

			// �s�b�`�̃Z�b�g
			SrcPitch = ( DWORD )UseManageData->CachePitch ;

			// ���s�����������ꍇ�̓L�����Z������
			if( *CharCode == L'\n' )
			{
				goto LOOPEND ;
			}

			// �X�y�[�X�����������ꍇ�̓L�����Z������
			if( *CharCode == L' ' || ( wchar_t )*CharCode == FSYS.DoubleByteSpaceCharCode )
			{
				goto LOOPEND ;
			}

			// �T�C�Y�����������牽�����Ȃ�
			if( CharData->SizeX == 0 && CharData->SizeY == 0 ) 
			{
				goto LOOPEND ;
			}

			// �����̕`��
			if( UseManageData->TextureCacheFlag == TRUE ||
				CharData->GraphHandleFlag )
			{
//				int anti ;
				int BlendGraph, BorderParam, BorderRange ;

				// �����̃u�����h�摜�̏���ۑ����Ă���
				BlendGraph  = GSYS.DrawSetting.BlendGraph ;
				BorderParam = GSYS.DrawSetting.BlendGraphBorderParam ;
				BorderRange = GSYS.DrawSetting.BlendGraphBorderRange ;

				// �u�����h���W�^�C�v�� DX_BLENDGRAPH_POSMODE_DRAWGRAPH �̏ꍇ�̓u�����h�摜�𖳌��ɂ���
				if( BlendGraph != -1 && GSYS.DrawSetting.BlendGraphPosMode == DX_BLENDGRAPH_POSMODE_DRAWGRAPH )
				{
					NS_SetBlendGraph( -1, 0, 0 ) ;
				}
			
				// �A���`�G�C���A�X�t�H���g��
//				anti = ( UseManageData->FontType & DX_FONTTYPE_ANTIALIASING ) != 0 ;

				// ��]�t���`�悩�ǂ����ŏ����𕪊�
				if( RotateValidFlag || GSYS.DrawSetting.Valid2DMatrix )
				{
					float TexCoord1U ;
					float TexCoord1V ;
					float TexCoord2U ;
					float TexCoord2V ;
					float Pos1X ;
					float Pos1Y ;
					float Pos2X ;
					float Pos2Y ;
					float Pos1SinX ;
					float Pos1CosX ;
					float Pos1SinY ;
					float Pos1CosY ;
					float Pos2SinX ;
					float Pos2CosX ;
					float Pos2SinY ;
					float Pos2CosY ;
					float ExRateXF = ( float )ExRateX ;
					float ExRateYF = ( float )ExRateY ;

					// ��]�`��

					if( VerticalFlag == TRUE )
					{
						if( CharData->GraphHandleFlag )
						{
							Pos1X = ( ( float )DrawPos    / ExRateYF + CharData->DrawX                   - RotCenterX ) * ExRateYF ;
							Pos1Y = ( ( float )DrawPosSub / ExRateXF + CharData->DrawY                   - RotCenterY ) * ExRateXF ;
							Pos2X = ( ( float )DrawPos    / ExRateYF + CharData->DrawX + CharData->SizeX - RotCenterX ) * ExRateYF ;
							Pos2Y = ( ( float )DrawPosSub / ExRateXF + CharData->DrawY + CharData->SizeY - RotCenterY ) * ExRateXF ;
						}
						else
						{
							Pos1X = ( ( float )DrawPos    / ExRateYF + ( CharData->DrawX - 1.0f )                              - RotCenterX ) * ExRateYF ;
							Pos1Y = ( ( float )DrawPosSub / ExRateXF + ( CharData->DrawY - 1.0f )                              - RotCenterY ) * ExRateXF ;
							Pos2X = ( ( float )DrawPos    / ExRateYF + ( CharData->DrawX - 1.0f ) + ( CharData->SizeX + 2.0f ) - RotCenterX ) * ExRateYF ;
							Pos2Y = ( ( float )DrawPosSub / ExRateXF + ( CharData->DrawY - 1.0f ) + ( CharData->SizeY + 2.0f ) - RotCenterY ) * ExRateXF ;
						}
					}
					else
					{
						if( CharData->GraphHandleFlag )
						{
							Pos1X = ( ( float )DrawPos    / ExRateXF + CharData->DrawX                   - RotCenterX ) * ExRateXF ;
							Pos1Y = ( ( float )DrawPosSub / ExRateYF + CharData->DrawY                   - RotCenterY ) * ExRateYF ;
							Pos2X = ( ( float )DrawPos    / ExRateXF + CharData->DrawX + CharData->SizeX - RotCenterX ) * ExRateXF ;
							Pos2Y = ( ( float )DrawPosSub / ExRateYF + CharData->DrawY + CharData->SizeY - RotCenterY ) * ExRateYF ;
						}
						else
						{
							Pos1X = ( ( float )DrawPos    / ExRateXF + ( CharData->DrawX - 1.0f )                              - RotCenterX ) * ExRateXF ;
							Pos1Y = ( ( float )DrawPosSub / ExRateYF + ( CharData->DrawY - 1.0f )                              - RotCenterY ) * ExRateYF ;
							Pos2X = ( ( float )DrawPos    / ExRateXF + ( CharData->DrawX - 1.0f ) + ( CharData->SizeX + 2.0f ) - RotCenterX ) * ExRateXF ;
							Pos2Y = ( ( float )DrawPosSub / ExRateYF + ( CharData->DrawY - 1.0f ) + ( CharData->SizeY + 2.0f ) - RotCenterY ) * ExRateYF ;
						}
					}

					Pos1SinX = Pos1X * RotSin ;
					Pos1CosX = Pos1X * RotCos ;
					Pos1SinY = Pos1Y * RotSin ;
					Pos1CosY = Pos1Y * RotCos ;
					Pos2SinX = Pos2X * RotSin ;
					Pos2CosX = Pos2X * RotCos ;
					Pos2SinY = Pos2Y * RotSin ;
					Pos2CosY = Pos2Y * RotCos ;

					if( PosIntFlag )
					{
						tmp_xf = ( float )tmp_xi + AdjustPos ;
						tmp_yf = ( float )tmp_yi + AdjustPos ;
					}

					// �摜�u�������������ǂ����ŏ����𕪊�
					if( CharData->GraphHandleFlag )
					{
						NS_SetIgnoreDrawGraphColor( IgnoreDrawGraphColor ) ;

						Graphics_DrawSetting_SetDrawBrightToOneParam( FColor ) ;
						if( OnlyType == 0 || OnlyType == 1 )
						{
							NS_DrawModiGraphF(
								Pos1CosX - Pos1SinY + tmp_xf, Pos1SinX + Pos1CosY + tmp_yf,
								Pos2CosX - Pos1SinY + tmp_xf, Pos2SinX + Pos1CosY + tmp_yf,
								Pos2CosX - Pos2SinY + tmp_xf, Pos2SinX + Pos2CosY + tmp_yf,
								Pos1CosX - Pos2SinY + tmp_xf, Pos1SinX + Pos2CosY + tmp_yf,
								CharData->GraphIndex,
								TRUE
							) ;
						}
					}
					else
					{
						GRAPHICS_DRAW_DRAWSIMPLEQUADRANGLEGRAPHF_PARAM Param ;
						GRAPHICS_DRAW_DRAWSIMPLEANGLEGRAPHF_VERTEX Vertex[ 4 ] ;

						Param.QuadrangleNum = 1 ;
						Param.Vertex = Vertex ;

						Vertex[ 0 ].x = Pos1CosX - Pos1SinY + tmp_xf ;
						Vertex[ 0 ].y = Pos1SinX + Pos1CosY + tmp_yf ;

						Vertex[ 1 ].x = Pos2CosX - Pos1SinY + tmp_xf ;
						Vertex[ 1 ].y = Pos2SinX + Pos1CosY + tmp_yf ;

						Vertex[ 2 ].x = Pos1CosX - Pos2SinY + tmp_xf ;
						Vertex[ 2 ].y = Pos1SinX + Pos2CosY + tmp_yf ;

						Vertex[ 3 ].x = Pos2CosX - Pos2SinY + tmp_xf ;
						Vertex[ 3 ].y = Pos2SinX + Pos2CosY + tmp_yf ;

						TexCoord1U = ( SrcRect.left   - 1     ) * UseManageData->TextureCacheInvSizeX ;
						TexCoord1V = ( SrcRect.top    - 1     ) * UseManageData->TextureCacheInvSizeY ;
						TexCoord2U = ( SrcRect.right  - 1 + 2 ) * UseManageData->TextureCacheInvSizeX ;
						TexCoord2V = ( SrcRect.bottom - 1 + 2 ) * UseManageData->TextureCacheInvSizeY ;

						Param.GraphHandle = UseManageData->TextureCache ;
						Param.TransFlag   = TRUE ;

						NS_SetIgnoreDrawGraphColor( TRUE ) ;

						// �G�b�W������ꍇ�͂�����ɕ`�悷��
						if( ( UseManageData->FontType & DX_FONTTYPE_EDGE ) != 0 )
						{
							Vertex[ 0 ].u = TexCoord1U + 0.5f ;	Vertex[ 0 ].v = TexCoord1V ;
							Vertex[ 1 ].u = TexCoord2U + 0.5f ;	Vertex[ 1 ].v = TexCoord1V ;
							Vertex[ 2 ].u = TexCoord1U + 0.5f ;	Vertex[ 2 ].v = TexCoord2V ;
							Vertex[ 3 ].u = TexCoord2U + 0.5f ;	Vertex[ 3 ].v = TexCoord2V ;
							Graphics_DrawSetting_SetDrawBrightToOneParam( FEdgeColor ) ;
							if( OnlyType == 0 || OnlyType == 2 )
							{
								Graphics_Draw_DrawSimpleQuadrangleGraphF( &Param ) ;
							}
							Graphics_DrawSetting_SetDrawBrightToOneParam( FColor ) ;

							// �{�̗p��U�l���Z�b�g
							Vertex[ 0 ].u = TexCoord1U ;
							Vertex[ 1 ].u = TexCoord2U ;
							Vertex[ 2 ].u = TexCoord1U ;
							Vertex[ 3 ].u = TexCoord2U ;
						}
						else
						{
							// �{�̗p��UV�l���Z�b�g
							Vertex[ 0 ].u = TexCoord1U ;	Vertex[ 0 ].v = TexCoord1V ;
							Vertex[ 1 ].u = TexCoord2U ;	Vertex[ 1 ].v = TexCoord1V ;
							Vertex[ 2 ].u = TexCoord1U ;	Vertex[ 2 ].v = TexCoord2V ;
							Vertex[ 3 ].u = TexCoord2U ;	Vertex[ 3 ].v = TexCoord2V ;
						}

						// �{�̂�`��
						if( OnlyType == 0 || OnlyType == 1 )
						{
							Graphics_Draw_DrawSimpleQuadrangleGraphF( &Param ) ;
						}
					}
				}
				else
				// �c�������ǂ����ŏ����𕪊�
				if( VerticalFlag == TRUE )
				{
					// �c����

					// �摜�u�������������ǂ����ŏ����𕪊�
					if( CharData->GraphHandleFlag )
					{
						NS_SetIgnoreDrawGraphColor( IgnoreDrawGraphColor ) ;

						// �g��`�悩�ǂ����ŏ����𕪊�
						if( ExRateValidFlag == FALSE )
						{
							// ���{�`��

							if( PosIntFlag )
							{
								int DrawX, DrawY, x1, y1, x2, y2 ;

								// �`����W�̎Z�o
								DrawX = tmp_xi - _DTOL( DrawPosSub ) + UseManageData->BaseInfo.FontHeight - CharData->DrawY ;
								DrawY = tmp_yi + _DTOL( DrawPos )                                         + CharData->DrawX ;

								x1 = DrawX ;
								y1 = DrawY ;
								x2 = DrawX - CharData->SizeY ;
								y2 = DrawY + CharData->SizeX ;

								Graphics_DrawSetting_SetDrawBrightToOneParam( FColor ) ;
								if( OnlyType == 0 || OnlyType == 1 )
								{
									NS_DrawModiGraphF(
										x1 + AdjustPos, y1 + AdjustPos,
										x1 + AdjustPos, y2 + AdjustPos,
										x2 + AdjustPos, y2 + AdjustPos,
										x2 + AdjustPos, y1 + AdjustPos,
										CharData->GraphIndex,
										TRUE/*anti ? FALSE : TRUE*/
									) ;
								}
							}
							else
							{
								float DrawX, DrawY, x1, y1, x2, y2 ;

								// �`����W�̎Z�o
								DrawX = tmp_xf - ( float )DrawPosSub + UseManageData->BaseInfo.FontHeight - CharData->DrawY ;
								DrawY = tmp_yf + ( float )DrawPos                                         + CharData->DrawX ;

								x1 = DrawX ;
								y1 = DrawY ;
								x2 = DrawX - CharData->SizeY ;
								y2 = DrawY + CharData->SizeX ;

								Graphics_DrawSetting_SetDrawBrightToOneParam( FColor ) ;
								if( OnlyType == 0 || OnlyType == 1 )
								{
									NS_DrawModiGraphF(
										x1 + AdjustPos, y1 + AdjustPos,
										x1 + AdjustPos, y2 + AdjustPos,
										x2 + AdjustPos, y2 + AdjustPos,
										x2 + AdjustPos, y1 + AdjustPos,
										CharData->GraphIndex,
										TRUE
									) ;
								}
							}
						}
						else
						{
							float DrawX, DrawY, x1, y1, x2, y2 ;

							// �g��`��

							if( PosIntFlag )
							{
								// �`�挳���W�̎Z�o
								DrawX = ( float )( tmp_xi - DrawPosSub + ( UseManageData->BaseInfo.FontHeight - CharData->DrawY ) * ExRateX ) ;
								DrawY = ( float )( tmp_yi + DrawPos    +                                        CharData->DrawX   * ExRateY ) ;

								x1 = DrawX ;
								y1 = DrawY ;
								x2 = DrawX + -CharData->SizeY * ( float )ExRateX ;
								y2 = DrawY +  CharData->SizeX * ( float )ExRateY ;

								Graphics_DrawSetting_SetDrawBrightToOneParam( FColor ) ;
								if( OnlyType == 0 || OnlyType == 1 )
								{
									NS_DrawModiGraphF(
										x1 + AdjustPos, y1 + AdjustPos,
										x1 + AdjustPos, y2 + AdjustPos,
										x2 + AdjustPos, y2 + AdjustPos,
										x2 + AdjustPos, y1 + AdjustPos,
										CharData->GraphIndex,
										TRUE/*anti ? FALSE : TRUE*/
									) ;
								}
							}
							else
							{
								// �`�挳���W�̎Z�o
								DrawX = ( float )( tmp_xf - DrawPosSub + ( UseManageData->BaseInfo.FontHeight - CharData->DrawY ) * ExRateX ) ;
								DrawY = ( float )( tmp_yf + DrawPos    +                                        CharData->DrawX   * ExRateY ) ;

								x1 = DrawX ;
								y1 = DrawY ;
								x2 = DrawX + -CharData->SizeY * ( float )ExRateX ;
								y2 = DrawY +  CharData->SizeX * ( float )ExRateY ;

								Graphics_DrawSetting_SetDrawBrightToOneParam( FColor ) ;
								if( OnlyType == 0 || OnlyType == 1 )
								{
									NS_DrawModiGraphF(
										x1 + AdjustPos, y1 + AdjustPos,
										x1 + AdjustPos, y2 + AdjustPos,
										x2 + AdjustPos, y2 + AdjustPos,
										x2 + AdjustPos, y1 + AdjustPos,
										CharData->GraphIndex,
										TRUE/*anti ? FALSE : TRUE*/
									) ;
								}
							}
						}
					}
					else
					{
						RECT MotoDrawRect, TempRect ;
						int GraphSizeX, GraphSizeY ;
						int TempGraph ;

						// ���̕`��\��`��ۑ����Ă���
						MotoDrawRect = GSYS.DrawSetting.DrawArea ;

						// �L���b�V���e�N�X�`���̃T�C�Y���擾����
						NS_GetGraphSize( UseManageData->TextureCache, &GraphSizeX, &GraphSizeY ) ;

						// �e�N�X�`���� RGB �͖�������
						NS_SetIgnoreDrawGraphColor( TRUE ) ;

						// �g��`�悩�ǂ����ŏ����𕪊�
						if( ExRateValidFlag == FALSE )
						{
							// ���{�`��

							if( PosIntFlag )
							{
								int DrawX, DrawY, x1, y1, x2, y2 ;

								// �`�挳���W�̎Z�o
								DrawX = tmp_xi - _DTOL( DrawPosSub ) + UseManageData->BaseInfo.FontHeight - CharData->DrawY ;
								DrawY = tmp_yi + _DTOL( DrawPos )                                         + CharData->DrawX ;

								x1 = DrawX + SrcY ;
								y1 = DrawY - SrcX ;
								x2 = DrawX + SrcY - GraphSizeY ;
								y2 = DrawY - SrcX + GraphSizeX ;

								// �w���`���������`��o���Ȃ��悤�ɂ���
								TempRect.left   = ( DrawX - CharData->SizeY ) - 1 ;
								TempRect.top    = DrawY ;
								TempRect.right  = DrawX + 1 ;
								TempRect.bottom = DrawY + CharData->SizeX ;
								RectClipping_Inline( &TempRect, &MotoDrawRect ) ;
								NS_SetDrawArea( TempRect.left, TempRect.top, TempRect.right, TempRect.bottom ) ;

								// �G�b�W������ꍇ�͂�����ɕ`�悷��
								if( ( UseManageData->FontType & DX_FONTTYPE_EDGE ) != 0 )
								{
									Graphics_DrawSetting_SetDrawBrightToOneParam( FEdgeColor ) ;
									if( OnlyType == 0 || OnlyType == 2 )
									{
										NS_DrawModiGraphF(
											x1 + AdjustPos, y1                       + AdjustPos,
											x1 + AdjustPos, y2 - ( GraphSizeX >> 1 ) + AdjustPos,
											x2 + AdjustPos, y2 - ( GraphSizeX >> 1 ) + AdjustPos,
											x2 + AdjustPos, y1                       + AdjustPos,
											UseManageData->TextureCacheSub, TRUE
										) ;
									}
									Graphics_DrawSetting_SetDrawBrightToOneParam( FColor ) ;
								}

								// �{�̂�`��
								if( OnlyType == 0 || OnlyType == 1 )
								{
									NS_DrawModiGraphF(
										x1 + AdjustPos, y1 + AdjustPos,
										x1 + AdjustPos, y2 + AdjustPos,
										x2 + AdjustPos, y2 + AdjustPos,
										x2 + AdjustPos, y1 + AdjustPos,
										 UseManageData->TextureCache,
										 TRUE/*anti ? FALSE : TRUE*/
									) ;
								}

								// �`��\��`�����ɖ߂�
								NS_SetDrawArea( MotoDrawRect.left,  MotoDrawRect.top,
												MotoDrawRect.right, MotoDrawRect.bottom ) ;
							}
							else
							{
								float DrawX, DrawY, x1, y1, x2, y2 ;

								// �`�挳���W�̎Z�o
								DrawX = tmp_xf - ( float )DrawPosSub + UseManageData->BaseInfo.FontHeight - ( CharData->DrawY - 1.0f ) ;
								DrawY = tmp_yf + ( float )DrawPos    +                                      ( CharData->DrawX - 1.0f ) ;

								x1 = DrawX ;
								y1 = DrawY ;
								x2 = DrawX - ( CharData->SizeY + 2.0f ) ;
								y2 = DrawY + ( CharData->SizeX + 2.0f ) ;

								// �G�b�W������ꍇ�͂�����ɕ`�悷��
								if( ( UseManageData->FontType & DX_FONTTYPE_EDGE ) != 0 )
								{
									TempGraph = NS_DerivationGraph( SrcX - 1, SrcY - 1, CharData->SizeX + 2, CharData->SizeY + 2, UseManageData->TextureCacheSub ) ;
									Graphics_DrawSetting_SetDrawBrightToOneParam( FEdgeColor ) ;
									if( OnlyType == 0 || OnlyType == 2 )
									{
										NS_DrawModiGraphF(
											x1 + AdjustPos, y1 + AdjustPos,
											x1 + AdjustPos, y2 + AdjustPos,
											x2 + AdjustPos, y2 + AdjustPos,
											x2 + AdjustPos, y1 + AdjustPos,
											TempGraph, TRUE
										) ;
									}
									SubHandle( TempGraph, FALSE, FALSE ) ;
									Graphics_DrawSetting_SetDrawBrightToOneParam( FColor ) ;
								}

								// �{�̂�`��
								TempGraph = NS_DerivationGraph( SrcX - 1, SrcY - 1, CharData->SizeX + 2, CharData->SizeY + 2, UseManageData->TextureCache ) ;
								if( OnlyType == 0 || OnlyType == 1 )
								{
									NS_DrawModiGraphF(
										x1 + AdjustPos, y1 + AdjustPos,
										x1 + AdjustPos, y2 + AdjustPos,
										x2 + AdjustPos, y2 + AdjustPos,
										x2 + AdjustPos, y1 + AdjustPos,
										TempGraph,
										TRUE
									) ;
								}
								SubHandle( TempGraph, FALSE, FALSE ) ;
							}
						}
						else
						{
							float DrawX, DrawY, x1, y1, x2, y2 ;

							// �g��`��

							if( PosIntFlag )
							{
								// �`�挳���W�̎Z�o
								DrawX = ( float )( tmp_xi - DrawPosSub + ( UseManageData->BaseInfo.FontHeight - ( CharData->DrawY - 1 ) ) * ExRateX ) ;
								DrawY = ( float )( tmp_yi + DrawPos    +                                        ( CharData->DrawX - 1 )   * ExRateY ) ;

								x1 = DrawX ;
								y1 = DrawY ;
								x2 = ( float )( DrawX + -( CharData->SizeY + 2 ) * ExRateX ) ;
								y2 = ( float )( DrawY +  ( CharData->SizeX + 2 ) * ExRateY ) ;

								// �w���`���������`��o���Ȃ��悤�ɂ���
								TempRect.left   = _FTOL( ( float )( DrawX - _DTOL( ( CharData->SizeY + 2 ) * ExRateX ) ) ) - 1 ;
								TempRect.top    = _FTOL( DrawY ) - 1 ;
								TempRect.right  = _FTOL( DrawX ) + 1 ;
								TempRect.bottom = _FTOL( ( float )( DrawY + ( CharData->SizeX + 2 ) * ExRateY ) ) + 1 ;
								RectClipping_Inline( &TempRect, &MotoDrawRect ) ;
								NS_SetDrawArea( TempRect.left, TempRect.top, TempRect.right, TempRect.bottom ) ;

								// �G�b�W������ꍇ�͂�����ɕ`�悷��
								if( ( UseManageData->FontType & DX_FONTTYPE_EDGE ) != 0 )
								{
									TempGraph = NS_DerivationGraph( SrcX - 1, SrcY - 1, CharData->SizeX + 2, CharData->SizeY + 2, UseManageData->TextureCacheSub ) ;
									Graphics_DrawSetting_SetDrawBrightToOneParam( FEdgeColor ) ;
									if( OnlyType == 0 || OnlyType == 2 )
									{
										NS_DrawModiGraphF(
											x1 + AdjustPos, y1 + AdjustPos,
											x1 + AdjustPos, y2 + AdjustPos,
											x2 + AdjustPos, y2 + AdjustPos,
											x2 + AdjustPos, y1 + AdjustPos,
											TempGraph, TRUE
										) ;
									}
									SubHandle( TempGraph, FALSE, FALSE ) ;
									Graphics_DrawSetting_SetDrawBrightToOneParam( FColor ) ;
								}

								// �{�̂�`��
								TempGraph = NS_DerivationGraph( SrcX - 1, SrcY - 1, CharData->SizeX + 2, CharData->SizeY + 2, UseManageData->TextureCache ) ;
								if( OnlyType == 0 || OnlyType == 1 )
								{
									NS_DrawModiGraphF(
										x1 + AdjustPos, y1 + AdjustPos,
										x1 + AdjustPos, y2 + AdjustPos,
										x2 + AdjustPos, y2 + AdjustPos,
										x2 + AdjustPos, y1 + AdjustPos,
										TempGraph,
										TRUE/*anti ? FALSE : TRUE*/
									) ;
								}
								SubHandle( TempGraph, FALSE, FALSE ) ;

								// �`��\��`�����ɖ߂�
								NS_SetDrawArea( MotoDrawRect.left,  MotoDrawRect.top,
												MotoDrawRect.right, MotoDrawRect.bottom ) ;
							}
							else
							{
								// �`�挳���W�̎Z�o
								DrawX = ( float )( tmp_xf + DrawPosSub + ( UseManageData->BaseInfo.FontHeight - ( CharData->DrawY - 1.0f ) ) * ExRateX ) ;
								DrawY = ( float )( tmp_yf + DrawPos    +                                        ( CharData->DrawX - 1.0f )   * ExRateY ) ;

								x1 = DrawX ;
								y1 = DrawY ;
								x2 = DrawX - ( CharData->SizeY + 2.0f ) * ( float )ExRateX ;
								y2 = DrawY + ( CharData->SizeX + 2.0f ) * ( float )ExRateY ;

								// �G�b�W������ꍇ�͂�����ɕ`�悷��
								if( ( UseManageData->FontType & DX_FONTTYPE_EDGE ) != 0 )
								{
									TempGraph = NS_DerivationGraph( SrcX - 1, SrcY - 1, CharData->SizeX + 2, CharData->SizeY + 2, UseManageData->TextureCacheSub ) ;
									Graphics_DrawSetting_SetDrawBrightToOneParam( FEdgeColor ) ;
									if( OnlyType == 0 || OnlyType == 2 )
									{
										NS_DrawModiGraphF(
											x1 + AdjustPos, y1 + AdjustPos,
											x1 + AdjustPos, y2 + AdjustPos,
											x2 + AdjustPos, y2 + AdjustPos,
											x2 + AdjustPos, y1 + AdjustPos,
											TempGraph, TRUE
										) ;
									}
									SubHandle( TempGraph, FALSE, FALSE ) ;
									Graphics_DrawSetting_SetDrawBrightToOneParam( FColor ) ;
								}

								// �{�̂�`��
								TempGraph = NS_DerivationGraph( SrcX - 1, SrcY - 1, CharData->SizeX + 2, CharData->SizeY + 2, UseManageData->TextureCache ) ;
								if( OnlyType == 0 || OnlyType == 1 )
								{
									NS_DrawModiGraphF(
										x1 + AdjustPos, y1 + AdjustPos,
										x1 + AdjustPos, y2 + AdjustPos,
										x2 + AdjustPos, y2 + AdjustPos,
										x2 + AdjustPos, y1 + AdjustPos,
										TempGraph,
										TRUE/*anti ? FALSE : TRUE*/
									) ;
								}
								SubHandle( TempGraph, FALSE, FALSE ) ;
							}
						}
					}
				}
				else
				{
					// ������

					// �g��`�悩�ǂ����ŏ����𕪊�
					if( ExRateValidFlag == FALSE )
					{
						// ���{�`��

						// �摜�u�������������ǂ����ŏ����𕪊�
						if( CharData->GraphHandleFlag )
						{
							NS_SetIgnoreDrawGraphColor( IgnoreDrawGraphColor ) ;

							Graphics_DrawSetting_SetDrawBrightToOneParam( FColor ) ;
							if( OnlyType == 0 || OnlyType == 1 )
							{
								if( PosIntFlag )
								{
									NS_DrawGraph(
										tmp_xi + _DTOL( DrawPos    ) + CharData->DrawX,
										tmp_yi + _DTOL( DrawPosSub ) + CharData->DrawY,
										CharData->GraphIndex,
										TRUE
									) ;
								}
								else
								{
									NS_DrawGraphF(
										tmp_xf + ( float )DrawPos    + CharData->DrawX,
										tmp_yf + ( float )DrawPosSub + CharData->DrawY,
										CharData->GraphIndex,
										TRUE
									) ;
								}
							}
						}
						else
						{
							// �e�N�X�`���� RGB �͖�������
							NS_SetIgnoreDrawGraphColor( TRUE ) ;

							// �G�b�W������ꍇ�͂�����ɕ`�悷��
							if( ( UseManageData->FontType & DX_FONTTYPE_EDGE ) != 0 )
							{
								if( OnlyType == 0 || OnlyType == 2 )
								{
									Graphics_DrawSetting_SetDrawBrightToOneParam( FEdgeColor ) ;
									if( PosIntFlag )
									{
										NS_DrawRectGraph(
											tmp_xi + _DTOL( DrawPos    ) + CharData->DrawX,
											tmp_yi + _DTOL( DrawPosSub ) + CharData->DrawY,
											SrcX,
											SrcY,
											CharData->SizeX,
											CharData->SizeY,
											UseManageData->TextureCacheSub,
											TRUE,
											FALSE, FALSE
										) ;
									}
									else
									{
										NS_DrawRectGraphF(
											tmp_xf + ( float )DrawPos    + CharData->DrawX - 1.0f,
											tmp_yf + ( float )DrawPosSub + CharData->DrawY - 1.0f,
											SrcX - 1,
											SrcY - 1,
											CharData->SizeX + 2,
											CharData->SizeY + 2,
											UseManageData->TextureCacheSub,
											TRUE,
											FALSE, FALSE
										) ;
									}
								}
							}

							// �{�̂�`��
							if( OnlyType == 0 || OnlyType == 1 )
							{
								Graphics_DrawSetting_SetDrawBrightToOneParam( FColor ) ;
								if( PosIntFlag )
								{
									NS_DrawRectGraph(
										tmp_xi + _DTOL( DrawPos    ) + CharData->DrawX,
										tmp_yi + _DTOL( DrawPosSub ) + CharData->DrawY,
										SrcX,
										SrcY,
										CharData->SizeX,
										CharData->SizeY,
										UseManageData->TextureCache,
										TRUE,
										FALSE, FALSE
									) ;
								}
								else
								{
									NS_DrawRectGraphF(
										tmp_xf + ( float )DrawPos    + CharData->DrawX - 1.0f,
										tmp_yf + ( float )DrawPosSub + CharData->DrawY - 1.0f,
										SrcX - 1,
										SrcY - 1,
										CharData->SizeX + 2,
										CharData->SizeY + 2,
										UseManageData->TextureCache,
										TRUE,
										FALSE, FALSE
									) ;
								}
							}
						}
					}
					else
					{
						float x1, y1, x2, y2 ;

						// �g��`��

						// �摜�u�������������ǂ����ŏ����𕪊�
						if( CharData->GraphHandleFlag )
						{
							NS_SetIgnoreDrawGraphColor( IgnoreDrawGraphColor ) ;

							if( PosIntFlag )
							{
								x1 = ( float )( tmp_xi + DrawPos    + CharData->DrawX * ExRateX ) ;
								y1 = ( float )( tmp_yi + DrawPosSub + CharData->DrawY * ExRateY ) ;
								x2 = ( float )( x1 +                  CharData->SizeX * ExRateX ) ;
								y2 = ( float )( y1 +                  CharData->SizeY * ExRateY ) ;
							}
							else
							{
								x1 = ( float )( tmp_xf + DrawPos    + CharData->DrawX * ExRateX ) ;
								y1 = ( float )( tmp_yf + DrawPosSub + CharData->DrawY * ExRateY ) ;
								x2 = ( float )( x1 +                  CharData->SizeX * ExRateX ) ;
								y2 = ( float )( y1 +                  CharData->SizeY * ExRateY ) ;
							}

							Graphics_DrawSetting_SetDrawBrightToOneParam( FColor ) ;
							if( OnlyType == 0 || OnlyType == 1 )
							{
								NS_DrawExtendGraphF(
									x1,							y1,
									x2,							y2,
									CharData->GraphIndex,
									TRUE
								) ;
							}
						}
						else
						{
							// �e�N�X�`���� RGB �͖�������
							NS_SetIgnoreDrawGraphColor( TRUE ) ;

							if( PosIntFlag )
							{
								x1 = ( float )( tmp_xi + DrawPos    + ( CharData->DrawX - 1 ) * ExRateX ) ;
								y1 = ( float )( tmp_yi + DrawPosSub + ( CharData->DrawY - 1 ) * ExRateY ) ;
								x2 = ( float )( x1 +                  ( CharData->SizeX + 2 ) * ExRateX ) ;
								y2 = ( float )( y1 +                  ( CharData->SizeY + 2 ) * ExRateY ) ;
							}
							else
							{
								x1 = ( float )( tmp_xf + DrawPos    + ( CharData->DrawX - 1 ) * ExRateX ) ;
								y1 = ( float )( tmp_yf + DrawPosSub + ( CharData->DrawY - 1 ) * ExRateY ) ;
								x2 = ( float )( x1 +                  ( CharData->SizeX + 2 ) * ExRateX ) ;
								y2 = ( float )( y1 +                  ( CharData->SizeY + 2 ) * ExRateY ) ;
							}

							// �G�b�W������ꍇ�͂�����ɕ`�悷��
							if( ( UseManageData->FontType & DX_FONTTYPE_EDGE ) != 0 )
							{
								if( OnlyType == 0 || OnlyType == 2 )
								{
									Graphics_DrawSetting_SetDrawBrightToOneParam( FEdgeColor ) ;
									if( PosIntFlag )
									{
										NS_DrawRectExtendGraphF(
											x1,								y1,
											x2,								y2,
											SrcX - 1,						SrcY - 1,
											CharData->SizeX + 2,			CharData->SizeY + 2,
											UseManageData->TextureCacheSub,
											TRUE ) ;
									}
									else
									{
										NS_DrawRectExtendGraphF(
											x1,								y1,
											x2,								y2,
											SrcX - 1,						SrcY - 1,
											CharData->SizeX + 2,			CharData->SizeY + 2,
											UseManageData->TextureCacheSub,
											TRUE ) ;
									}
								}
							}

							// �{�̂�`��
							if( OnlyType == 0 || OnlyType == 1 )
							{
								Graphics_DrawSetting_SetDrawBrightToOneParam( FColor ) ;
								if( PosIntFlag )
								{
									NS_DrawRectExtendGraphF(
										x1,							y1,
										x2,							y2,
										SrcX - 1,					SrcY - 1,
										CharData->SizeX + 2,		CharData->SizeY + 2,
										UseManageData->TextureCache,
										TRUE
									) ;
								}
								else
								{
									NS_DrawRectExtendGraphF(
										x1,							y1,
										x2,							y2,
										SrcX - 1,					SrcY - 1,
										CharData->SizeX + 2,		CharData->SizeY + 2,
										UseManageData->TextureCache,
										TRUE
									) ;
								}
							}
						}
					}
				}

				// �u�����h�摜�̏������ɖ߂�
				if( BlendGraph != -1 && GSYS.DrawSetting.BlendGraphPosMode == DX_BLENDGRAPH_POSMODE_DRAWGRAPH )
				{
					NS_SetBlendGraph( BlendGraph, BorderParam, BorderRange ) ;
				}
			}
			else
			if( DestMemImg != NULL )
			{
				// �c�������ǂ����ŏ����𕪊�
				if( VerticalFlag == TRUE )
				{
					DWORD SizeX, SizeY ;
					RECT TempRect ;

					// �`���`�̃Z�b�g
					DstRect.left   = tmp_xi - _DTOL( DrawPosSub ) + UseManageData->BaseInfo.FontHeight - CharData->DrawY - CharData->SizeY ;
					DstRect.right  = tmp_xi - _DTOL( DrawPosSub ) + UseManageData->BaseInfo.FontHeight - CharData->DrawY ;
					DstRect.top    = tmp_yi + _DTOL( DrawPos )                                         + CharData->DrawX ;
					DstRect.bottom = tmp_yi + _DTOL( DrawPos )                                         + CharData->DrawX + CharData->SizeX ;
					TempRect = DstRect ;
					RectClipping_Inline( &DstRect, ClipRect ) ;

					// �`�悷�镶�������������ꍇ�����Ŏ����[�v�Ɉڂ�
					if( DstRect.right == DstRect.left || DstRect.bottom == DstRect.top )
					{
						goto LOOPEND ;
					}

					// �]������`�ƕ`��T�C�Y�̒���
					SrcRect.left   += DstRect.top     - TempRect.top ;
					SrcRect.top    += DstRect.right   - TempRect.right ;
					SrcRect.right  -= TempRect.bottom - DstRect.bottom ;
					SrcRect.bottom -= TempRect.left   - DstRect.left ;
					SizeX = ( DWORD )( SrcRect.right  - SrcRect.left ) ;
					SizeY = ( DWORD )( SrcRect.bottom - SrcRect.top  ) ;

					// �]��
					{
						int SrcPitch2, DstPitch2 ;
						WORD SizeXWord = ( WORD )SizeX, SizeYWord = ( WORD )SizeY ;

						// �J���[�r�b�g���[�h�ɂ���ď����𕪊�

						switch( NS_GetColorBitDepth() )
						{
						case 8 :
							// 8�r�b�g���[�h�̎��̏���
							{
								BYTE *Dest ;
								BYTE *Src ;
								BYTE ColorData = ( BYTE )( Color & 0xff ) ;

								Dest = DestMemImg->UseImage + DstRect.right + DstRect.top * DestMemImg->Base->Pitch ;
								Src = UseManageData->CacheMem + SrcRect.left + SrcRect.top * UseManageData->CachePitch ;

								SrcPitch2 = ( int )( UseManageData->CachePitch - SizeX ) ;
								DstPitch2 = ( int )( -1 - ( int )SizeX * ( int )DestMemImg->Base->Pitch ) ;

								switch( UseManageData->FontType )
								{
								case DX_FONTTYPE_NORMAL :
									{
										WORD SizeXTemp ;
										WORD Data ;
										int StX ;
										const WORD Table[16] = { 0x80, 0x40, 0x20, 0x10, 0x8, 0x4, 0x2, 0x1, 0x8000, 0x4000, 0x2000, 0x1000, 0x800, 0x400, 0x200, 0x100 } ;

										StX = SrcRect.left % 8 ;
										Src = UseManageData->CacheMem + ( SrcRect.left / 8 ) + SrcRect.top * UseManageData->CachePitch ;
										SrcPitch2 = ( int )( UseManageData->CachePitch - ( ( SizeX + 7 ) / 8 ) ) ;

										if( TransFlag )
										{
											do{
												SizeXTemp = SizeXWord ;
												do{
													Data = *( ( WORD * )Src ) ;
													for(;;)
													{
														if( Data & Table[StX] )   *Dest = ColorData ;	Dest += DstPitch ;	if( --SizeXTemp == 0 ) break ;
														if( Data & Table[StX+1] ) *Dest = ColorData ;	Dest += DstPitch ;	if( --SizeXTemp == 0 ) break ;
														if( Data & Table[StX+2] ) *Dest = ColorData ;	Dest += DstPitch ;	if( --SizeXTemp == 0 ) break ;
														if( Data & Table[StX+3] ) *Dest = ColorData ;	Dest += DstPitch ;	if( --SizeXTemp == 0 ) break ;
														if( Data & Table[StX+4] ) *Dest = ColorData ;	Dest += DstPitch ;	if( --SizeXTemp == 0 ) break ;
														if( Data & Table[StX+5] ) *Dest = ColorData ;	Dest += DstPitch ;	if( --SizeXTemp == 0 ) break ;
														if( Data & Table[StX+6] ) *Dest = ColorData ;	Dest += DstPitch ;	if( --SizeXTemp == 0 ) break ;
														if( Data & Table[StX+7] ) *Dest = ColorData ;	Dest += DstPitch ;	--SizeXTemp ;
														break;
													}

													Src += 1 ;
												}while( SizeXTemp );

												Src += SrcPitch2 ;
												Dest += DstPitch2 ;
											}while( --SizeYWord ) ;
										}
										else
										{
											do{
												SizeXTemp = SizeXWord ;
												do{
													Data = *( ( WORD * )Src ) ;
													for(;;)
													{
														*Dest = ( BYTE )( ( Data & Table[StX]   ) ? ColorData : 0 ) ;  	Dest += DstPitch ; 	if( --SizeXTemp == 0 ) break ;
														*Dest = ( BYTE )( ( Data & Table[StX+1] ) ? ColorData : 0 ) ;	Dest += DstPitch ;  if( --SizeXTemp == 0 ) break ;
														*Dest = ( BYTE )( ( Data & Table[StX+2] ) ? ColorData : 0 ) ;	Dest += DstPitch ;  if( --SizeXTemp == 0 ) break ;
														*Dest = ( BYTE )( ( Data & Table[StX+3] ) ? ColorData : 0 ) ;	Dest += DstPitch ;  if( --SizeXTemp == 0 ) break ;
														*Dest = ( BYTE )( ( Data & Table[StX+4] ) ? ColorData : 0 ) ;	Dest += DstPitch ;  if( --SizeXTemp == 0 ) break ;
														*Dest = ( BYTE )( ( Data & Table[StX+5] ) ? ColorData : 0 ) ;	Dest += DstPitch ;  if( --SizeXTemp == 0 ) break ;
														*Dest = ( BYTE )( ( Data & Table[StX+6] ) ? ColorData : 0 ) ;	Dest += DstPitch ;  if( --SizeXTemp == 0 ) break ;
														*Dest = ( BYTE )( ( Data & Table[StX+7] ) ? ColorData : 0 ) ;	Dest += DstPitch ;	--SizeXTemp ;
														break ;
													}

													Src += 1 ;
												}while( SizeXTemp );

												Src += SrcPitch2 ;
												Dest += DstPitch2 ;
											}while( --SizeYWord ) ;
										}
									}
									break ;


								case DX_FONTTYPE_EDGE :
									{
										WORD Width ;
										BYTE EColor ;

										EColor = ( BYTE )( EdgeColor & 0xff ) ;
										if( TransFlag )
										{
											do
											{
												Width = SizeXWord ;
												do
												{
													if( *Src ) *Dest = *Src == 1 ? ColorData : EColor ;
													Dest += DstPitch ;
													Src ++ ;
												}while( --Width ) ;

												Dest += DstPitch2 ;
												Src += SrcPitch2 ;
											}while( --SizeYWord ) ;
										}
										else
										{
											do
											{
												Width = SizeXWord ;
												do
												{
													*Dest = ( BYTE )( *Src ? ( *Src == 1 ? ColorData : EColor ) : 0 ) ;
													Dest += DstPitch ;
													Src ++ ;
												}while( --Width ) ;

												Dest += DstPitch2 ;
												Src += SrcPitch2 ;
											}while( --SizeYWord ) ;
										}
									}
									break ;
								}
							}
							break ;

						case 16 :
							// 16�r�b�g���[�h�̎��̏���
							{
								BYTE *Dest ;
								BYTE *Src ;
								WORD ColorData = ( WORD )Color ;

								Dest = DestMemImg->UseImage + ( DstRect.right * 2 ) + DstRect.top * DstPitch ;
								Src = UseManageData->CacheMem + SrcRect.left + SrcRect.top * SrcPitch ;

								SrcPitch2 = ( int )( SrcPitch - SizeX ) ;
								DstPitch2 = ( int )( -1 * 2 - ( int )SizeX * ( int )DstPitch ) ;

								switch( UseManageData->FontType )
								{
								case DX_FONTTYPE_ANTIALIASING_EDGE :
								case DX_FONTTYPE_ANTIALIASING_EDGE_4X4 :
								case DX_FONTTYPE_ANTIALIASING_EDGE_8X8 :
									{
										BYTE Red1, Green1, Blue1 ;
										BYTE Red2, Green2, Blue2 ;
										DWORD AAA ;

										WORD Width ;

										Red1   = ( BYTE )( ( ColorData & MEMIMG_R5G6B5_R ) >> MEMIMG_R5G6B5_LR ) ;
										Green1 = ( BYTE )( ( ColorData & MEMIMG_R5G6B5_G ) >> MEMIMG_R5G6B5_LG ) ;
										Blue1  = ( BYTE )( ( ColorData & MEMIMG_R5G6B5_B ) >> MEMIMG_R5G6B5_LB ) ;

										Red2   = ( BYTE )( ( EdgeColor & MEMIMG_R5G6B5_R ) >> MEMIMG_R5G6B5_LR ) ;
										Green2 = ( BYTE )( ( EdgeColor & MEMIMG_R5G6B5_G ) >> MEMIMG_R5G6B5_LG ) ;
										Blue2  = ( BYTE )( ( EdgeColor & MEMIMG_R5G6B5_B ) >> MEMIMG_R5G6B5_LB ) ;

										Dest = DestMemImg->UseImage + ( DstRect.right * 4 ) + DstRect.top * DstPitch ;
										DstPitch2 = ( int )( -1 * 4 - ( int )SizeX * ( int )DstPitch ) ;

										if( TransFlag )
										{
											do
											{
												Width = SizeXWord ;
												do
												{
													if( *Src & 0x0f )
													{
														if( ( *Src & 0x0f ) == 0x0f )
														{
															*( ( DWORD * )Dest ) = ( DWORD )( 0xff0000 | ColorData ) ;
														}
														else
														{
															Dest[2] = ( BYTE )( ( ( *Src & 0x0f ) << 4 ) + ( ( 0x0f - ( *Src & 0x0f ) ) * ( ( *Src & 0xf0 ) >> 4 ) ) ) ;
															AAA = ( DWORD )( ( ( WORD )( *Src & 0x0f ) << 12 ) / Dest[2] ) ;
															*( ( WORD * )Dest ) = ( WORD )( 
																( ( ( ( ( Red1   - Red2   ) * AAA ) >> 8 ) + Red2   ) << MEMIMG_R5G6B5_LR ) | 
																( ( ( ( ( Green1 - Green2 ) * AAA ) >> 8 ) + Green2 ) << MEMIMG_R5G6B5_LG ) | 
																( ( ( ( ( Blue1  - Blue2  ) * AAA ) >> 8 ) + Blue2  ) << MEMIMG_R5G6B5_LB ) ) ; 
														}
													}
													else
													{
														if( *Src & 0xf0 )
														{
															*( ( DWORD * )Dest ) = EdgeColor | ( ( *Src & 0xf0 ) << 16 ) ;
														}
													}

													Dest += DstPitch ;
													Src  += 1 ;
												}while( --Width ) ;

												Dest += DstPitch2 ;
												Src += SrcPitch2 ;
											}while( --SizeYWord ) ;
										}
										else
										{
											do
											{
												Width = SizeXWord ;
												do
												{
													if( *Src & 0x0f )
													{
														if( ( *Src & 0x0f ) == 0x0f )
														{
															*( ( DWORD * )Dest ) = ( DWORD )( 0xff0000 | ColorData ) ;
														}
														else
														{
															Dest[2] = ( BYTE )( ( ( *Src & 0x0f ) << 4 ) + ( ( 0x0f - ( *Src & 0x0f ) ) * ( ( *Src & 0xf0 ) >> 4 ) ) ) ;
															AAA = ( DWORD )( ( ( WORD )( *Src & 0x0f ) << 12 ) / Dest[2] ) ;
															*( ( WORD * )Dest ) = ( WORD )( 
																( ( ( ( ( Red1   - Red2   ) * AAA ) >> 8 ) + Red2   ) << MEMIMG_R5G6B5_LR ) | 
																( ( ( ( ( Green1 - Green2 ) * AAA ) >> 8 ) + Green2 ) << MEMIMG_R5G6B5_LG ) | 
																( ( ( ( ( Blue1  - Blue2  ) * AAA ) >> 8 ) + Blue2  ) << MEMIMG_R5G6B5_LB ) ) ; 
														}
													}
													else
													{
														if( *Src & 0xf0 )
														{
															*( ( DWORD * )Dest ) = EdgeColor | ( ( *Src & 0xf0 ) << 16 ) ;
														}
														else
														{
															*( ( DWORD * )Dest ) = 0 ;
														}
													}

													Dest += DstPitch ;
													Src ++ ;
												}while( --Width ) ;

												Dest += DstPitch2 ;
												Src += SrcPitch2 ;
											}while( --SizeYWord ) ;
										}
									}
									break ;

								case DX_FONTTYPE_ANTIALIASING :
								case DX_FONTTYPE_ANTIALIASING_4X4 :
								case DX_FONTTYPE_ANTIALIASING_8X8 :
								case DX_FONTTYPE_ANTIALIASING_16X16 :
									{
										WORD Width ;

										Dest      = DestMemImg->UseImage + ( DstRect.right * 4 ) + DstRect.top * DstPitch ;
										DstPitch2 = ( int )( -1 * 4 - ( int )SizeX * ( int )DstPitch ) ;

										if( TransFlag )
										{
											do
											{
												Width = SizeXWord ;
												do
												{
													if( *Src )
													{
														*( ( DWORD * )Dest ) = ( DWORD )( ColorData | ( *Src << 20 ) ) ;
													}
													Dest += DstPitch ;
													Src ++ ;
												}while( --Width ) ;

												Dest += DstPitch2 ;
												Src += SrcPitch2 ;
											}while( --SizeYWord ) ;
										}
										else
										{
											do
											{
												Width = SizeXWord ;
												do
												{
													if( *Src )
													{
														*( ( DWORD * )Dest ) = ( DWORD )( ColorData | ( *Src << 20 ) ) ;
													}
													else
													{
														*( ( DWORD * )Dest ) = 0 ;
													}

													Dest += DstPitch ;
													Src ++ ;
												}while( --Width ) ;

												Dest += DstPitch2 ;
												Src += SrcPitch2 ;
											}while( --SizeYWord ) ;
										}
									}
									break ;

								case DX_FONTTYPE_NORMAL :
									{
										WORD SizeXTemp ;
										WORD Data ;
										int StX = SrcRect.left % 8 ;
										WORD Table[16] = { 0x80, 0x40, 0x20, 0x10, 0x8, 0x4, 0x2, 0x1, 0x8000, 0x4000, 0x2000, 0x1000, 0x800, 0x400, 0x200, 0x100 } ;

										Src       = UseManageData->CacheMem + ( SrcRect.left / 8 ) + SrcRect.top * SrcPitch ;
										SrcPitch2 = ( int )( SrcPitch - ( ( SizeX + 7 ) / 8 ) ) ;

										if( TransFlag )
										{
											do{
												SizeXTemp = SizeXWord ;
												do{
													Data = *( ( WORD * )Src ) ;
													for(;;)
													{
														if( Data & Table[StX] )   *( (WORD *)Dest ) = ColorData ;	Dest += DstPitch ; 	if( --SizeXTemp == 0 ) break ;
														if( Data & Table[StX+1] ) *( (WORD *)Dest ) = ColorData ;	Dest += DstPitch ;	if( --SizeXTemp == 0 ) break ;
														if( Data & Table[StX+2] ) *( (WORD *)Dest ) = ColorData ;	Dest += DstPitch ;	if( --SizeXTemp == 0 ) break ;
														if( Data & Table[StX+3] ) *( (WORD *)Dest ) = ColorData ;	Dest += DstPitch ;	if( --SizeXTemp == 0 ) break ;
														if( Data & Table[StX+4] ) *( (WORD *)Dest ) = ColorData ;	Dest += DstPitch ;	if( --SizeXTemp == 0 ) break ;
														if( Data & Table[StX+5] ) *( (WORD *)Dest ) = ColorData ;	Dest += DstPitch ;	if( --SizeXTemp == 0 ) break ;
														if( Data & Table[StX+6] ) *( (WORD *)Dest ) = ColorData ;	Dest += DstPitch ;	if( --SizeXTemp == 0 ) break ;
														if( Data & Table[StX+7] ) *( (WORD *)Dest ) = ColorData ;	Dest += DstPitch ;	--SizeXTemp ;
														break ;
													}

													Src += 1 ;
												}while( SizeXTemp );

												Src += SrcPitch2 ;
												Dest += DstPitch2 ;
											}while( --SizeYWord ) ;
										}
										else
										{
											do{
												SizeXTemp = SizeXWord ;
												do{
													Data = *( ( WORD * )Src ) ;
													for(;;)
													{
														*( (WORD *)Dest ) = ( WORD )( ( Data & Table[StX]   ) ? ColorData : 0 ) ;  	Dest += DstPitch ; 	if( --SizeXTemp == 0 ) break ;
														*( (WORD *)Dest ) = ( WORD )( ( Data & Table[StX+1] ) ? ColorData : 0 ) ;	Dest += DstPitch ;  if( --SizeXTemp == 0 ) break ;
														*( (WORD *)Dest ) = ( WORD )( ( Data & Table[StX+2] ) ? ColorData : 0 ) ;	Dest += DstPitch ;  if( --SizeXTemp == 0 ) break ;
														*( (WORD *)Dest ) = ( WORD )( ( Data & Table[StX+3] ) ? ColorData : 0 ) ;	Dest += DstPitch ;	if( --SizeXTemp == 0 ) break ;
														*( (WORD *)Dest ) = ( WORD )( ( Data & Table[StX+4] ) ? ColorData : 0 ) ;	Dest += DstPitch ;  if( --SizeXTemp == 0 ) break ;
														*( (WORD *)Dest ) = ( WORD )( ( Data & Table[StX+5] ) ? ColorData : 0 ) ;	Dest += DstPitch ;	if( --SizeXTemp == 0 ) break ;
														*( (WORD *)Dest ) = ( WORD )( ( Data & Table[StX+6] ) ? ColorData : 0 ) ;	Dest += DstPitch ;	if( --SizeXTemp == 0 ) break ;
														*( (WORD *)Dest ) = ( WORD )( ( Data & Table[StX+7] ) ? ColorData : 0 ) ;	Dest += DstPitch ; 	--SizeXTemp ;
														break ;
													}

													Src += 1 ;
												}while( SizeXTemp );

												Src += SrcPitch2 ;
												Dest += DstPitch2 ;
											}while( --SizeYWord ) ;
										}
									}
									break ;

								case DX_FONTTYPE_EDGE :
									{
										WORD Width ;
										WORD EColor ;

										EColor = ( WORD )( EdgeColor & 0xffff ) ;
										if( TransFlag )
										{
											do
											{
												Width = SizeXWord ;
												do
												{
													if( *Src ) *( ( WORD * )Dest ) = *Src == 1 ? ColorData : EColor ;
													Dest += DstPitch ;
													Src ++ ;
												}while( --Width ) ;

												Dest += DstPitch2 ;
												Src += SrcPitch2 ;
											}while( --SizeYWord ) ;
										}
										else
										{
											do
											{
												Width = SizeXWord ;
												do
												{
													*( ( WORD * )Dest ) = ( WORD )( *Src ? ( *Src == 1 ? ColorData : EColor ) : 0 ) ;
													Dest += DstPitch ;
													Src ++ ;
												}while( --Width ) ;

												Dest += DstPitch2 ;
												Src += SrcPitch2 ;
											}while( --SizeYWord ) ;
										}
									}
									break ;
								}
							}
							break ;

						case 32 :
							// 32�r�b�g���[�h�̏ꍇ
							{
								BYTE *Dest ;
								BYTE *Src ;
								unsigned int ColorData = ( DWORD )Color ;
   
								Dest = DestMemImg->UseImage + ( DstRect.right * 4 ) + DstRect.top * DstPitch ;
								Src = UseManageData->CacheMem + SrcRect.left + SrcRect.top * SrcPitch ;

								SrcPitch2 = ( int )( SrcPitch - SizeX ) ;
								DstPitch2 = ( int )( -1 * 4 - ( ( int )SizeX * ( int )DstPitch ) ) ;

								switch( UseManageData->FontType )
								{
								case DX_FONTTYPE_ANTIALIASING_EDGE :
								case DX_FONTTYPE_ANTIALIASING_EDGE_4X4 :
								case DX_FONTTYPE_ANTIALIASING_EDGE_8X8 :
									{
										BYTE Red1, Green1, Blue1 ;
										BYTE Red2, Green2, Blue2 ;
										DWORD AAA ;

										WORD Width ;

										Red1   = ( BYTE )( ( ColorData & MEMIMG_XRGB8_R ) >> MEMIMG_XRGB8_LR ) ;
										Green1 = ( BYTE )( ( ColorData & MEMIMG_XRGB8_G ) >> MEMIMG_XRGB8_LG ) ;
										Blue1  = ( BYTE )( ( ColorData & MEMIMG_XRGB8_B ) >> MEMIMG_XRGB8_LB ) ;

										Red2   = ( BYTE )( ( EdgeColor & MEMIMG_XRGB8_R ) >> MEMIMG_XRGB8_LR ) ;
										Green2 = ( BYTE )( ( EdgeColor & MEMIMG_XRGB8_G ) >> MEMIMG_XRGB8_LG ) ;
										Blue2  = ( BYTE )( ( EdgeColor & MEMIMG_XRGB8_B ) >> MEMIMG_XRGB8_LB ) ;

										if( TransFlag )
										{
											do
											{
												Width = SizeXWord ;
												do
												{
													if( *Src & 0x0f )
													{
														if( ( *Src & 0x0f ) == 0x0f )
														{
															*( ( DWORD * )Dest ) = 0xff000000 | ColorData ;
														}
														else
														{
															*( ( DWORD * )Dest ) = ( DWORD )( ( ( ( *Src & 0x0f ) << 4 ) + ( ( 0x0f - ( *Src & 0x0f ) ) * ( ( *Src & 0xf0 ) >> 4 ) ) ) << 24 ) ;
															AAA = ( DWORD )( ( ( WORD )( *Src & 0x0f ) << 12 ) / Dest[3] ) ;
															*( ( DWORD * )Dest ) |= ( DWORD )( 
																( ( ( ( ( Red1   - Red2   ) * AAA ) >> 8 ) + Red2   ) << MEMIMG_XRGB8_LR ) | 
																( ( ( ( ( Green1 - Green2 ) * AAA ) >> 8 ) + Green2 ) << MEMIMG_XRGB8_LG ) | 
																( ( ( ( ( Blue1  - Blue2  ) * AAA ) >> 8 ) + Blue2  ) << MEMIMG_XRGB8_LB ) ) ; 
														}
													}
													else
													{
														if( *Src & 0xf0 )
														{
															*( ( DWORD * )Dest ) = EdgeColor | ( ( *Src & 0xf0 ) << 24 ) ;
														}
													}

													Dest += DstPitch ;
													Src  ++ ;
												}while( --Width ) ;

												Dest += DstPitch2 ;
												Src += SrcPitch2 ;
											}while( --SizeYWord ) ;
										}
										else
										{
											do
											{
												Width = SizeXWord ;
												do
												{
													if( *Src & 0x0f )
													{
														if( ( *Src & 0x0f ) == 0x0f )
														{
															*( ( DWORD * )Dest ) = 0xff000000 | ColorData ;
														}
														else
														{
															*( ( DWORD * )Dest ) = ( DWORD )( ( ( ( *Src & 0x0f ) << 4 ) + ( ( 0x0f - ( *Src & 0x0f ) ) * ( ( *Src & 0xf0 ) >> 4 ) ) ) << 24 ) ;
															AAA = ( DWORD )( ( ( WORD )( *Src & 0x0f ) << 12 ) / Dest[3] ) ;
															*( ( DWORD * )Dest ) |= ( DWORD )( 
																( ( ( ( ( Red1   - Red2   ) * AAA ) >> 8 ) + Red2   ) << MEMIMG_XRGB8_LR ) | 
																( ( ( ( ( Green1 - Green2 ) * AAA ) >> 8 ) + Green2 ) << MEMIMG_XRGB8_LG ) | 
																( ( ( ( ( Blue1  - Blue2  ) * AAA ) >> 8 ) + Blue2  ) << MEMIMG_XRGB8_LB ) ) ; 
														}
													}
													else
													{
														if( *Src & 0xf0 )
														{
															*( ( DWORD * )Dest ) = EdgeColor | ( ( *Src & 0xf0 ) << 24 ) ;
														}
														else
														{
															*( ( DWORD * )Dest ) = 0 ;
														}
													}

													Dest += DstPitch ;
													Src  ++ ;
												}while( --Width ) ;

												Dest += DstPitch2 ;
												Src += SrcPitch2 ;
											}while( --SizeYWord ) ;
										}
									}
									break ;


								case DX_FONTTYPE_ANTIALIASING :
								case DX_FONTTYPE_ANTIALIASING_4X4 :
								case DX_FONTTYPE_ANTIALIASING_8X8 :
								case DX_FONTTYPE_ANTIALIASING_16X16 :
									{
										WORD Width ;

										if( TransFlag )
										{
											do
											{
												Width = SizeXWord ;
												do
												{
													if( *Src )
													{
														*( ( DWORD * )Dest ) = ColorData | ( ( *Src & 0x0f ) << 28 ) ;
													}
													Dest += DstPitch ;
													Src ++ ;
												}while( --Width ) ;

												Dest += DstPitch2 ;
												Src += SrcPitch2 ;
											}while( --SizeYWord ) ;
										}
										else
										{
											do
											{
												Width = SizeXWord ;
												do
												{
													if( *Src )
													{
														*( ( DWORD * )Dest ) = ColorData | ( ( *Src & 0x0f ) << 28 ) ;
													}
													else
													{
														*( ( DWORD * )Dest ) = 0 ;
													}

													Dest += DstPitch ;
													Src ++ ;
												}while( --Width ) ;

												Dest += DstPitch2 ;
												Src += SrcPitch2 ;
											}while( --SizeYWord ) ;
										}
									}
									break ;

								case DX_FONTTYPE_NORMAL :
									{
										WORD SizeXTemp ;
										WORD Data ;
										int StX = SrcRect.left % 8 ;
										WORD Table[16] = { 0x80, 0x40, 0x20, 0x10, 0x8, 0x4, 0x2, 0x1, 0x8000, 0x4000, 0x2000, 0x1000, 0x800, 0x400, 0x200, 0x100 } ;

										Src       = UseManageData->CacheMem + ( SrcRect.left / 8 ) + SrcRect.top * SrcPitch ;
										SrcPitch2 = ( int )( SrcPitch - ( ( SizeX + 7 ) / 8 ) ) ;

										if( TransFlag )
										{
											do{
												SizeXTemp = SizeXWord ;
												do{
													Data = *( ( WORD * )Src ) ;
													for(;;)
													{
														if( Data & Table[StX] )   *( (DWORD *)Dest ) = ColorData ;	Dest += DstPitch ;	if( --SizeXTemp == 0 ) break ;
														if( Data & Table[StX+1] ) *( (DWORD *)Dest ) = ColorData ;	Dest += DstPitch ;	if( --SizeXTemp == 0 ) break ;
														if( Data & Table[StX+2] ) *( (DWORD *)Dest ) = ColorData ;	Dest += DstPitch ;	if( --SizeXTemp == 0 ) break ;
														if( Data & Table[StX+3] ) *( (DWORD *)Dest ) = ColorData ;	Dest += DstPitch ;	if( --SizeXTemp == 0 ) break ;
														if( Data & Table[StX+4] ) *( (DWORD *)Dest ) = ColorData ;	Dest += DstPitch ;	if( --SizeXTemp == 0 ) break ;
														if( Data & Table[StX+5] ) *( (DWORD *)Dest ) = ColorData ;	Dest += DstPitch ;	if( --SizeXTemp == 0 ) break ;
														if( Data & Table[StX+6] ) *( (DWORD *)Dest ) = ColorData ;	Dest += DstPitch ;	if( --SizeXTemp == 0 ) break ;
														if( Data & Table[StX+7] ) *( (DWORD *)Dest ) = ColorData ;	Dest += DstPitch ;	--SizeXTemp ;
														break ;
													}

													Src += 1 ;
												}while( SizeXTemp );

												Src += SrcPitch2 ;
												Dest += DstPitch2 ;
											}while( --SizeYWord ) ;
										}
										else
										{
											do{
												SizeXTemp = SizeXWord ;
												do{
													Data = *( ( WORD * )Src ) ;
													for(;;)
													{
														*( (DWORD *)Dest ) = ( Data & Table[StX] ) ? ColorData : 0 ;   	Dest += DstPitch ;	if( --SizeXTemp == 0 ) break ;
														*( (DWORD *)Dest ) = ( Data & Table[StX+1] ) ? ColorData : 0 ;	Dest += DstPitch ; 	if( --SizeXTemp == 0 ) break ;
														*( (DWORD *)Dest ) = ( Data & Table[StX+2] ) ? ColorData : 0 ;	Dest += DstPitch ; 	if( --SizeXTemp == 0 ) break ;
														*( (DWORD *)Dest ) = ( Data & Table[StX+3] ) ? ColorData : 0 ;	Dest += DstPitch ; 	if( --SizeXTemp == 0 ) break ;
														*( (DWORD *)Dest ) = ( Data & Table[StX+4] ) ? ColorData : 0 ;	Dest += DstPitch ; 	if( --SizeXTemp == 0 ) break ;
														*( (DWORD *)Dest ) = ( Data & Table[StX+5] ) ? ColorData : 0 ;	Dest += DstPitch ; 	if( --SizeXTemp == 0 ) break ;
														*( (DWORD *)Dest ) = ( Data & Table[StX+6] ) ? ColorData : 0 ;	Dest += DstPitch ; 	if( --SizeXTemp == 0 ) break ;
														*( (DWORD *)Dest ) = ( Data & Table[StX+7] ) ? ColorData : 0 ;	Dest += DstPitch ; 	--SizeXTemp ;
														break ;
													}

													Src += 1 ;
												}while( SizeXTemp );

												Src += SrcPitch2 ;
												Dest += DstPitch2 ;
											}while( --SizeYWord ) ;
										}
									}
									break ;

								case DX_FONTTYPE_EDGE :
									{
										WORD Width ;
										DWORD EColor ;

										EColor = ( DWORD )( EdgeColor & 0xffffff ) ;
										if( TransFlag )
										{
											do
											{
												Width = SizeXWord ;
												do
												{
													if( *Src ) *( ( DWORD * )Dest ) = *Src == 1 ? ColorData : EColor ;
													Dest += DstPitch ;
													Src ++ ;
												}while( --Width ) ;

												Dest += DstPitch2 ;
												Src += SrcPitch2 ;
											}while( --SizeYWord ) ;
										}
										else
										{
											do
											{
												Width = SizeXWord ;
												do
												{
													*( ( DWORD * )Dest ) = *Src ? ( *Src == 1 ? ColorData : EColor ) : 0 ;
													Dest += DstPitch ;
													Src ++ ;
												}while( --Width ) ;

												Dest += DstPitch2 ;
												Src += SrcPitch2 ;
											}while( --SizeYWord ) ;
										}
									}
									break ;
								}
							}
							break ;
						}
					}
				}
				else
				{
					int DrawX, DrawY ;
					DWORD SizeX, SizeY ;

					// �`����W�̃Z�b�g
					DrawX = tmp_xi + _DTOL( DrawPos    ) + CharData->DrawX ;
					DrawY = tmp_yi + _DTOL( DrawPosSub ) + CharData->DrawY ;

					// ���ۂ̕`��̈���쐬
					SETRECT( DstRect, DrawX, DrawY, DrawX + CharData->SizeX, DrawY + CharData->SizeY ) ;
					RectClipping_Inline( &DstRect, ClipRect ) ;

					// �`�悷�镶�������������ꍇ�����Ŏ����[�v�Ɉڂ�
					if( DstRect.right == DstRect.left || DstRect.bottom == DstRect.top )
					{
						goto LOOPEND ;
					}

					// �`�挳��`�ƕ`����`���Z�b�g
					SrcRect.left   += DstRect.left - DrawX ;
					SrcRect.top    += DstRect.top  - DrawY ;
					SrcRect.right  -= ( DrawX + CharData->SizeX ) - DstRect.right ;
					SrcRect.bottom -= ( DrawY + CharData->SizeY ) - DstRect.bottom ;
					SizeX = ( DWORD )( SrcRect.right - SrcRect.left ) ;
					SizeY = ( DWORD )( SrcRect.bottom - SrcRect.top ) ;

					// �]��
					{
						DWORD SrcPitch2, DstPitch2 ;
						WORD SizeXWord = ( WORD )SizeX, SizeYWord = ( WORD )SizeY ;

						// �J���[�r�b�g���[�h�ɂ���ď����𕪊�

						switch( NS_GetColorBitDepth() )
						{
						case 8 :
							// 8�r�b�g���[�h�̎��̏���
							{
								BYTE *DrawDstPoint = ( BYTE * )DestMemImg->UseImage ;
								BYTE *DrawSrcPoint = UseManageData->CacheMem ;
								BYTE ColorData     = ( BYTE )( Color & 0xff ) ;

								DrawDstPoint += ( DstRect.left ) + DstRect.top * DstPitch ;
								DrawSrcPoint += ( SrcRect.left ) + SrcRect.top * SrcPitch ;

								SrcPitch2 = SrcPitch - SizeX ;
								DstPitch2 = DstPitch - SizeX ;

								switch( UseManageData->FontType )
								{
								case DX_FONTTYPE_NORMAL :
									{
										WORD SizeXTemp ;
										WORD Data ;

										if( SrcRect.left % 8 == 0 )
										{
											DrawSrcPoint = UseManageData->CacheMem ;
											DrawSrcPoint += ( SrcRect.left / 8 ) + SrcRect.top * SrcPitch ;
											SrcPitch2 = SrcPitch - ( SizeX + 15 ) / 16 * 2 ;
											DstPitch2 = DstPitch - ( SizeX / 16 * 16 ) ;

											if( TransFlag == TRUE )
											{
												do{
													SizeXTemp = SizeXWord ;
													do{
														Data = *( ( WORD * )DrawSrcPoint ) ;
														for(;;)
														{
															if( Data & 0x80 ) *( DrawDstPoint ) = ColorData ;			if( --SizeXTemp == 0 ) break ;
															if( Data & 0x40 ) *( DrawDstPoint + 1 ) = ColorData ;		if( --SizeXTemp == 0 ) break ;
															if( Data & 0x20 ) *( DrawDstPoint + 2 ) = ColorData ;		if( --SizeXTemp == 0 ) break ;
															if( Data & 0x10 ) *( DrawDstPoint + 3 ) = ColorData ;		if( --SizeXTemp == 0 ) break ;
															if( Data & 0x8 ) *( DrawDstPoint + 4 ) = ColorData ;		if( --SizeXTemp == 0 ) break ;
															if( Data & 0x4 ) *( DrawDstPoint + 5 ) = ColorData ;		if( --SizeXTemp == 0 ) break ;
															if( Data & 0x2 ) *( DrawDstPoint + 6 ) = ColorData ;		if( --SizeXTemp == 0 ) break ;
															if( Data & 0x1 ) *( DrawDstPoint + 7 ) = ColorData ;		if( --SizeXTemp == 0 ) break ;
															if( Data & 0x8000 ) *( DrawDstPoint + 8 ) = ColorData ;		if( --SizeXTemp == 0 ) break ;
															if( Data & 0x4000 ) *( DrawDstPoint + 9 ) = ColorData ;		if( --SizeXTemp == 0 ) break ;
															if( Data & 0x2000 ) *( DrawDstPoint + 10 ) = ColorData ;	if( --SizeXTemp == 0 ) break ;
															if( Data & 0x1000 ) *( DrawDstPoint + 11 ) = ColorData ;	if( --SizeXTemp == 0 ) break ;
															if( Data & 0x800 ) *( DrawDstPoint + 12 ) = ColorData ;		if( --SizeXTemp == 0 ) break ;
															if( Data & 0x400 ) *( DrawDstPoint + 13 ) = ColorData ;		if( --SizeXTemp == 0 ) break ;
															if( Data & 0x200 ) *( DrawDstPoint + 14 ) = ColorData ;		if( --SizeXTemp == 0 ) break ;
															if( Data & 0x100 ) *( DrawDstPoint + 15 ) = ColorData ;
															DrawDstPoint += 16 ;
 															--SizeXTemp ;
															break ;
														}

														DrawSrcPoint += 2 ;
													}while( SizeXTemp );

													DrawSrcPoint += SrcPitch2 ;
													DrawDstPoint += DstPitch2 ;
												}while( --SizeYWord ) ;
											}
											else
											{
												do{
													SizeXTemp = SizeXWord ;
													do{
														Data = *( ( WORD * )DrawSrcPoint ) ;
														for(;;)
														{
															*( DrawDstPoint      ) = ( BYTE )( ( Data & 0x80   ) ? ColorData : 0 ) ;	if( --SizeXTemp == 0 ) break ;
															*( DrawDstPoint + 1  ) = ( BYTE )( ( Data & 0x40   ) ? ColorData : 0 ) ;	if( --SizeXTemp == 0 ) break ;
															*( DrawDstPoint + 2  ) = ( BYTE )( ( Data & 0x20   ) ? ColorData : 0 ) ;	if( --SizeXTemp == 0 ) break ;
															*( DrawDstPoint + 3  ) = ( BYTE )( ( Data & 0x10   ) ? ColorData : 0 ) ;	if( --SizeXTemp == 0 ) break ;
															*( DrawDstPoint + 4  ) = ( BYTE )( ( Data & 0x8    ) ? ColorData : 0 ) ;	if( --SizeXTemp == 0 ) break ;
															*( DrawDstPoint + 5  ) = ( BYTE )( ( Data & 0x4    ) ? ColorData : 0 ) ;	if( --SizeXTemp == 0 ) break ;
															*( DrawDstPoint + 6  ) = ( BYTE )( ( Data & 0x2    ) ? ColorData : 0 ) ;	if( --SizeXTemp == 0 ) break ;
															*( DrawDstPoint + 7  ) = ( BYTE )( ( Data & 0x1    ) ? ColorData : 0 ) ;	if( --SizeXTemp == 0 ) break ;
															*( DrawDstPoint + 8  ) = ( BYTE )( ( Data & 0x8000 ) ? ColorData : 0 ) ;  	if( --SizeXTemp == 0 ) break ;
															*( DrawDstPoint + 9  ) = ( BYTE )( ( Data & 0x4000 ) ? ColorData : 0 ) ;  	if( --SizeXTemp == 0 ) break ;
															*( DrawDstPoint + 10 ) = ( BYTE )( ( Data & 0x2000 ) ? ColorData : 0 ) ; 	if( --SizeXTemp == 0 ) break ;
															*( DrawDstPoint + 11 ) = ( BYTE )( ( Data & 0x1000 ) ? ColorData : 0 ) ;	if( --SizeXTemp == 0 ) break ;
															*( DrawDstPoint + 12 ) = ( BYTE )( ( Data & 0x800  ) ? ColorData : 0 ) ; 	if( --SizeXTemp == 0 ) break ;
															*( DrawDstPoint + 13 ) = ( BYTE )( ( Data & 0x400  ) ? ColorData : 0 ) ; 	if( --SizeXTemp == 0 ) break ;
															*( DrawDstPoint + 14 ) = ( BYTE )( ( Data & 0x200  ) ? ColorData : 0 ) ;	if( --SizeXTemp == 0 ) break ;
															*( DrawDstPoint + 15 ) = ( BYTE )( ( Data & 0x100  ) ? ColorData : 0 ) ;  
															DrawDstPoint += 16 ;
 															--SizeXTemp ;
															break ;
														}

														DrawSrcPoint += 2 ;
													}while( SizeXTemp );

													DrawSrcPoint += SrcPitch2 ;
													DrawDstPoint += DstPitch2 ;
												}while( --SizeYWord ) ;
											}
										}
										else
										{
											int StX = SrcRect.left % 8 ;
											WORD Table[16] = { 0x80, 0x40, 0x20, 0x10, 0x8, 0x4, 0x2, 0x1, 0x8000, 0x4000, 0x2000, 0x1000, 0x800, 0x400, 0x200, 0x100 } ;

											DrawSrcPoint = UseManageData->CacheMem ;
											DrawSrcPoint += ( SrcRect.left / 8 ) + SrcRect.top * SrcPitch ;
											SrcPitch2 = SrcPitch - ( ( SizeX / 8 ) + ( SizeX % 8 != 0 ? 1 : 0 ) ) ;

											DstPitch2 = DstPitch - ( ( ( SizeX >> 3 ) << 3 ) ) ;

											if( TransFlag )
											{
												do{
													SizeXTemp = SizeXWord ;
													do{
														Data = *( ( WORD * )DrawSrcPoint ) ;
														for(;;)
														{
															if( Data & Table[StX] ) *( DrawDstPoint ) = ColorData ;			if( --SizeXTemp == 0 ) break ;
															if( Data & Table[StX+1] ) *( DrawDstPoint + 1 ) = ColorData ;	if( --SizeXTemp == 0 ) break ;
															if( Data & Table[StX+2] ) *( DrawDstPoint + 2 ) = ColorData ;	if( --SizeXTemp == 0 ) break ;
															if( Data & Table[StX+3] ) *( DrawDstPoint + 3 ) = ColorData ;	if( --SizeXTemp == 0 ) break ;
															if( Data & Table[StX+4] ) *( DrawDstPoint + 4 ) = ColorData ;	if( --SizeXTemp == 0 ) break ;
															if( Data & Table[StX+5] ) *( DrawDstPoint + 5 ) = ColorData ;	if( --SizeXTemp == 0 ) break ;
															if( Data & Table[StX+6] ) *( DrawDstPoint + 6 ) = ColorData ;	if( --SizeXTemp == 0 ) break ;
															if( Data & Table[StX+7] ) *( DrawDstPoint + 7 ) = ColorData ;
															DrawDstPoint += 8 ;
 															--SizeXTemp ;
															break ;
														}

														DrawSrcPoint += 1 ;
													}while( SizeXTemp );

													DrawSrcPoint += SrcPitch2 ;
													DrawDstPoint += DstPitch2 ;
												}while( --SizeYWord ) ;
											}
											else
											{
												do{
													SizeXTemp = SizeXWord ;
													do{
														Data = *( ( WORD * )DrawSrcPoint ) ;
														for(;;)
														{
															*( DrawDstPoint     ) = ( BYTE )( ( Data & Table[StX]   ) ? ColorData : 0 ) ;	if( --SizeXTemp == 0 ) break ;
															*( DrawDstPoint + 1 ) = ( BYTE )( ( Data & Table[StX+1] ) ? ColorData : 0 ) ;  	if( --SizeXTemp == 0 ) break ;
															*( DrawDstPoint + 2 ) = ( BYTE )( ( Data & Table[StX+2] ) ? ColorData : 0 ) ;  	if( --SizeXTemp == 0 ) break ;
															*( DrawDstPoint + 3 ) = ( BYTE )( ( Data & Table[StX+3] ) ? ColorData : 0 ) ;  	if( --SizeXTemp == 0 ) break ;
															*( DrawDstPoint + 4 ) = ( BYTE )( ( Data & Table[StX+4] ) ? ColorData : 0 ) ;  	if( --SizeXTemp == 0 ) break ;
															*( DrawDstPoint + 5 ) = ( BYTE )( ( Data & Table[StX+5] ) ? ColorData : 0 ) ;  	if( --SizeXTemp == 0 ) break ;
															*( DrawDstPoint + 6 ) = ( BYTE )( ( Data & Table[StX+6] ) ? ColorData : 0 ) ;  	if( --SizeXTemp == 0 ) break ;
															*( DrawDstPoint + 7 ) = ( BYTE )( ( Data & Table[StX+7] ) ? ColorData : 0 ) ;  
															DrawDstPoint += 8 ;
 															--SizeXTemp ;
															break ;
														}

														DrawSrcPoint += 1 ;
													}while( SizeXTemp );

													DrawSrcPoint += SrcPitch2 ;
													DrawDstPoint += DstPitch2 ;
												}while( --SizeYWord ) ;
											}
										}
									}
									break ;


								case DX_FONTTYPE_EDGE :
									{
										WORD Width ;
										BYTE EColor ;

										EColor = ( BYTE )( EdgeColor & 0xff ) ;
										if( TransFlag )
										{
											do
											{
												Width = SizeXWord ;
												do
												{
													if( *DrawSrcPoint )
													{
														*DrawDstPoint = *DrawSrcPoint == 1 ? ColorData : EColor ;
													}
													DrawDstPoint ++ ;
													DrawSrcPoint ++ ;
												}while( --Width ) ;

												DrawDstPoint += DstPitch2 ;
												DrawSrcPoint += SrcPitch2 ;
											}while( --SizeYWord ) ;
										}
										else
										{
											do
											{
												Width = SizeXWord ;
												do
												{
													*DrawDstPoint = ( BYTE )( ( *DrawSrcPoint ) ? ( *DrawSrcPoint == 1 ? ColorData : EColor ) : 0 ) ;
													DrawDstPoint ++ ;
													DrawSrcPoint ++ ;
												}while( --Width ) ;

												DrawDstPoint += DstPitch2 ;
												DrawSrcPoint += SrcPitch2 ;
											}while( --SizeYWord ) ;
										}
									}
									break ;
								}
							}
							break ;

						case 16 :
							// 16�r�b�g���[�h�̎��̏���
							{
								BYTE *DrawDstPoint = DestMemImg->UseImage ;
								BYTE *DrawSrcPoint = UseManageData->CacheMem ;
								WORD ColorData = ( WORD )Color ;

								if( UseManageData->FontType & DX_FONTTYPE_ANTIALIASING )
								{
									DrawDstPoint += DstRect.left * 4 + DstRect.top * DstPitch ;
									DstPitch2     = DstPitch - SizeX * 4 ;
								}
								else
								{
									DrawDstPoint += DstRect.left * 2 + DstRect.top * DstPitch ;
									DstPitch2     = DstPitch - SizeX * 2 ;
								}

								DrawSrcPoint += SrcRect.left + SrcRect.top * SrcPitch ;
								SrcPitch2     = SrcPitch - SizeX ;

								switch( UseManageData->FontType )
								{
								case DX_FONTTYPE_ANTIALIASING_EDGE :
								case DX_FONTTYPE_ANTIALIASING_EDGE_4X4 :
								case DX_FONTTYPE_ANTIALIASING_EDGE_8X8 :
									{
										BYTE Red1, Green1, Blue1 ;
										BYTE Red2, Green2, Blue2 ;
										DWORD AAA ;
										WORD Width ;

										Red1   = ( BYTE )( ( ColorData & MEMIMG_R5G6B5_R ) >> MEMIMG_R5G6B5_LR ) ;
										Green1 = ( BYTE )( ( ColorData & MEMIMG_R5G6B5_G ) >> MEMIMG_R5G6B5_LG ) ;
										Blue1  = ( BYTE )( ( ColorData & MEMIMG_R5G6B5_B ) >> MEMIMG_R5G6B5_LB ) ;

										Red2   = ( BYTE )( ( EdgeColor & MEMIMG_R5G6B5_R ) >> MEMIMG_R5G6B5_LR ) ;
										Green2 = ( BYTE )( ( EdgeColor & MEMIMG_R5G6B5_G ) >> MEMIMG_R5G6B5_LG ) ;
										Blue2  = ( BYTE )( ( EdgeColor & MEMIMG_R5G6B5_B ) >> MEMIMG_R5G6B5_LB ) ;

										if( TransFlag )
										{
											do
											{
												Width = SizeXWord ;
												do
												{
													if( *DrawSrcPoint & 0x0f )
													{
														if( ( *DrawSrcPoint & 0x0f ) == 0x0f )
														{
															*( ( DWORD * )DrawDstPoint ) = ( DWORD )( 0xff0000 | ColorData ) ;
														}
														else
														{
															DrawDstPoint[2] = ( BYTE )( ( ( *DrawSrcPoint & 0x0f ) << 4 ) + ( ( 0x0f - ( *DrawSrcPoint & 0x0f ) ) * ( ( *DrawSrcPoint & 0xf0 ) >> 4 ) ) ) ;
															AAA = ( DWORD )( ( ( WORD )( *DrawSrcPoint & 0x0f ) << 12 ) / DrawDstPoint[2] ) ;
															*( ( WORD * )DrawDstPoint ) = ( WORD )( 
																( ( ( ( ( Red1   - Red2   ) * AAA ) >> 8 ) + Red2   ) << MEMIMG_R5G6B5_LR ) | 
																( ( ( ( ( Green1 - Green2 ) * AAA ) >> 8 ) + Green2 ) << MEMIMG_R5G6B5_LG ) | 
																( ( ( ( ( Blue1  - Blue2  ) * AAA ) >> 8 ) + Blue2  ) << MEMIMG_R5G6B5_LB ) ) ; 
														}
													}
													else
													{
														if( *DrawSrcPoint & 0xf0 )
														{
															*( ( DWORD * )DrawDstPoint ) = EdgeColor | ( ( *DrawSrcPoint & 0xf0 ) << 16 ) ;
														}
													}

													DrawDstPoint += 4 ;
													DrawSrcPoint += 1 ;
												}while( --Width ) ;

												DrawDstPoint += DstPitch2 ;
												DrawSrcPoint += SrcPitch2 ;
											}while( --SizeYWord ) ;
										}
										else
										{
											do
											{
												Width = SizeXWord ;
												do
												{
													if( *DrawSrcPoint & 0x0f )
													{
														if( ( *DrawSrcPoint & 0x0f ) == 0x0f )
														{
															*( ( DWORD * )DrawDstPoint ) = ( DWORD )( 0xff0000 | ColorData ) ;
														}
														else
														{
															DrawDstPoint[2] = ( BYTE )( ( ( *DrawSrcPoint & 0x0f ) << 4 ) + ( ( 0x0f - ( *DrawSrcPoint & 0x0f ) ) * ( ( *DrawSrcPoint & 0xf0 ) >> 4 ) ) ) ;
															AAA = ( DWORD )( ( ( WORD )( *DrawSrcPoint & 0x0f ) << 12 ) / DrawDstPoint[2] ) ;
															*( ( WORD * )DrawDstPoint ) = ( WORD )( 
																( ( ( ( ( Red1   - Red2   ) * AAA ) >> 8 ) + Red2   ) << MEMIMG_R5G6B5_LR ) | 
																( ( ( ( ( Green1 - Green2 ) * AAA ) >> 8 ) + Green2 ) << MEMIMG_R5G6B5_LG ) | 
																( ( ( ( ( Blue1  - Blue2  ) * AAA ) >> 8 ) + Blue2  ) << MEMIMG_R5G6B5_LB ) ) ; 
														}
													}
													else
													{
														if( *DrawSrcPoint & 0xf0 )
														{
															*( ( DWORD * )DrawDstPoint ) = EdgeColor | ( ( *DrawSrcPoint & 0xf0 ) << 16 ) ;
														}
														else
														{
															*( ( DWORD * )DrawDstPoint ) = 0 ;
														}
													}

													DrawDstPoint += 4 ;
													DrawSrcPoint += 1 ;
												}while( --Width ) ;

												DrawDstPoint += DstPitch2 ;
												DrawSrcPoint += SrcPitch2 ;
											}while( --SizeYWord ) ;
										}
									}
									break ;

								case DX_FONTTYPE_ANTIALIASING :
								case DX_FONTTYPE_ANTIALIASING_4X4 :
								case DX_FONTTYPE_ANTIALIASING_8X8 :
								case DX_FONTTYPE_ANTIALIASING_16X16 :
									{
										WORD Width ;

										if( TransFlag )
										{
											do
											{
												Width = SizeXWord ;
												do
												{
													if( *DrawSrcPoint )
													{
														*( ( DWORD * )DrawDstPoint ) = ( DWORD )( ColorData | ( *DrawSrcPoint << 20 ) ) ;
													}
													DrawDstPoint += 4 ;
													DrawSrcPoint ++ ;
												}while( --Width ) ;

												DrawDstPoint += DstPitch2 ;
												DrawSrcPoint += SrcPitch2 ;
											}while( --SizeYWord ) ;
										}
										else
										{
											do
											{
												Width = SizeXWord ;
												do
												{
													if( *DrawSrcPoint )
													{
														*( ( DWORD * )DrawDstPoint ) = ( DWORD )( ColorData | ( *DrawSrcPoint << 20 ) ) ;
													}
													else
													{
														*( ( DWORD * )DrawDstPoint ) = 0 ;
													}

													DrawDstPoint += 4 ;
													DrawSrcPoint ++ ;
												}while( --Width ) ;

												DrawDstPoint += DstPitch2 ;
												DrawSrcPoint += SrcPitch2 ;
											}while( --SizeYWord ) ;
										}
									}
									break ;

								case DX_FONTTYPE_NORMAL :
									{
										WORD SizeXTemp ;
										WORD Data ;

										if( SrcRect.left % 8 == 0 )
										{
											DrawSrcPoint = UseManageData->CacheMem ;
											DrawSrcPoint += ( SrcRect.left / 8 ) + SrcRect.top * SrcPitch ;
											SrcPitch2 = SrcPitch - ( ( SizeX / 16 ) * 2 + ( SizeX % 16 != 0 ? 2 : 0 ) ) ;
											DstPitch2 = DstPitch - ( ( ( SizeX >> 4 ) << 5 ) ) ;

											if( TransFlag )
											{
												do{
													SizeXTemp = SizeXWord ;
													do{
														Data = *( ( WORD * )DrawSrcPoint ) ;
														for(;;)
														{
															if( Data & 0x80 ) *( ( WORD * )DrawDstPoint ) = ColorData ;			if( --SizeXTemp == 0 ) break ;
															if( Data & 0x40 ) *( ( WORD * )DrawDstPoint + 1 ) = ColorData ; 	if( --SizeXTemp == 0 ) break ;
															if( Data & 0x20 ) *( ( WORD * )DrawDstPoint + 2 ) = ColorData ;		if( --SizeXTemp == 0 ) break ;
															if( Data & 0x10 ) *( ( WORD * )DrawDstPoint + 3 ) = ColorData ;		if( --SizeXTemp == 0 ) break ;
															if( Data & 0x8 ) *( ( WORD * )DrawDstPoint + 4 ) = ColorData ;		if( --SizeXTemp == 0 ) break ;
															if( Data & 0x4 ) *( ( WORD * )DrawDstPoint + 5 ) = ColorData ;		if( --SizeXTemp == 0 ) break ;
															if( Data & 0x2 ) *( ( WORD * )DrawDstPoint + 6 ) = ColorData ;		if( --SizeXTemp == 0 ) break ;
															if( Data & 0x1 ) *( ( WORD * )DrawDstPoint + 7 ) = ColorData ;		if( --SizeXTemp == 0 ) break ;
															if( Data & 0x8000 ) *( ( WORD * )DrawDstPoint + 8 ) = ColorData ;	if( --SizeXTemp == 0 ) break ;
															if( Data & 0x4000 ) *( ( WORD * )DrawDstPoint + 9 ) = ColorData ;	if( --SizeXTemp == 0 ) break ;
															if( Data & 0x2000 ) *( ( WORD * )DrawDstPoint + 10 ) = ColorData ;	if( --SizeXTemp == 0 ) break ;
															if( Data & 0x1000 ) *( ( WORD * )DrawDstPoint + 11 ) = ColorData ;	if( --SizeXTemp == 0 ) break ;
															if( Data & 0x800 ) *( ( WORD * )DrawDstPoint + 12 ) = ColorData ;	if( --SizeXTemp == 0 ) break ;
															if( Data & 0x400 ) *( ( WORD * )DrawDstPoint + 13 ) = ColorData ;	if( --SizeXTemp == 0 ) break ;
															if( Data & 0x200 ) *( ( WORD * )DrawDstPoint + 14 ) = ColorData ;	if( --SizeXTemp == 0 ) break ;
															if( Data & 0x100 ) *( ( WORD * )DrawDstPoint + 15 ) = ColorData ;
															DrawDstPoint += 32 ;
 															--SizeXTemp ;
															break ;
														}

														DrawSrcPoint += 2 ;
													}while( SizeXTemp );

													DrawSrcPoint += SrcPitch2 ;
													DrawDstPoint += DstPitch2 ;
												}while( --SizeYWord ) ;
											}
											else
											{
												do{
													SizeXTemp = SizeXWord ;
													do{
														Data = *( ( WORD * )DrawSrcPoint ) ;
														for(;;)
														{
															*( ( WORD * )DrawDstPoint      ) = ( WORD )( ( Data & 0x80   ) ? ColorData : 0 ) ;	if( --SizeXTemp == 0 ) break ;
															*( ( WORD * )DrawDstPoint + 1  ) = ( WORD )( ( Data & 0x40   ) ? ColorData : 0 ) ; 	if( --SizeXTemp == 0 ) break ;
															*( ( WORD * )DrawDstPoint + 2  ) = ( WORD )( ( Data & 0x20   ) ? ColorData : 0 ) ;	if( --SizeXTemp == 0 ) break ;
															*( ( WORD * )DrawDstPoint + 3  ) = ( WORD )( ( Data & 0x10   ) ? ColorData : 0 ) ; 	if( --SizeXTemp == 0 ) break ;
															*( ( WORD * )DrawDstPoint + 4  ) = ( WORD )( ( Data & 0x8    ) ? ColorData : 0 ) ; 	if( --SizeXTemp == 0 ) break ;
															*( ( WORD * )DrawDstPoint + 5  ) = ( WORD )( ( Data & 0x4    ) ? ColorData : 0 ) ; 	if( --SizeXTemp == 0 ) break ;
															*( ( WORD * )DrawDstPoint + 6  ) = ( WORD )( ( Data & 0x2    ) ? ColorData : 0 ) ; 	if( --SizeXTemp == 0 ) break ;
															*( ( WORD * )DrawDstPoint + 7  ) = ( WORD )( ( Data & 0x1    ) ? ColorData : 0 ) ; 	if( --SizeXTemp == 0 ) break ;
															*( ( WORD * )DrawDstPoint + 8  ) = ( WORD )( ( Data & 0x8000 ) ? ColorData : 0 ) ;	if( --SizeXTemp == 0 ) break ;
															*( ( WORD * )DrawDstPoint + 9  ) = ( WORD )( ( Data & 0x4000 ) ? ColorData : 0 ) ;	if( --SizeXTemp == 0 ) break ;
															*( ( WORD * )DrawDstPoint + 10 ) = ( WORD )( ( Data & 0x2000 ) ? ColorData : 0 ) ;	if( --SizeXTemp == 0 ) break ;
															*( ( WORD * )DrawDstPoint + 11 ) = ( WORD )( ( Data & 0x1000 ) ? ColorData : 0 ) ;	if( --SizeXTemp == 0 ) break ;
															*( ( WORD * )DrawDstPoint + 12 ) = ( WORD )( ( Data & 0x800  ) ? ColorData : 0 ) ;	if( --SizeXTemp == 0 ) break ;
															*( ( WORD * )DrawDstPoint + 13 ) = ( WORD )( ( Data & 0x400  ) ? ColorData : 0 ) ; 	if( --SizeXTemp == 0 ) break ;
															*( ( WORD * )DrawDstPoint + 14 ) = ( WORD )( ( Data & 0x200  ) ? ColorData : 0 ) ; 	if( --SizeXTemp == 0 ) break ;
															*( ( WORD * )DrawDstPoint + 15 ) = ( WORD )( ( Data & 0x100  ) ? ColorData : 0 ) ;  
															DrawDstPoint += 32 ;
 															--SizeXTemp ;
															break ;
														}

														DrawSrcPoint += 2 ;
													}while( SizeXTemp );

													DrawSrcPoint += SrcPitch2 ;
													DrawDstPoint += DstPitch2 ;
												}while( --SizeYWord ) ;
											}
										}
										else
										{
											int StX = SrcRect.left % 8 ;
											WORD Table[16] = { 0x80, 0x40, 0x20, 0x10, 0x8, 0x4, 0x2, 0x1, 0x8000, 0x4000, 0x2000, 0x1000, 0x800, 0x400, 0x200, 0x100 } ;

											DrawSrcPoint = UseManageData->CacheMem ;
											DrawSrcPoint += ( SrcRect.left / 8 ) + SrcRect.top * SrcPitch ;
											SrcPitch2 = SrcPitch - ( ( SizeX / 8 ) + ( SizeX % 8 != 0 ? 1 : 0 ) ) ;
											DstPitch2 = DstPitch - ( ( ( SizeX >> 3 ) << 4 ) ) /*- ( SizeX % 4 == 0 ? 8 : 0 )*/ ;

											if( TransFlag )
											{
												do{
													SizeXTemp = SizeXWord ;
													do{
														Data = *( ( WORD * )DrawSrcPoint ) ;
														for(;;)
														{
															if( Data & Table[StX] ) *( ( WORD * )DrawDstPoint ) = ColorData ; 			if( --SizeXTemp == 0 ) break ;
															if( Data & Table[StX+1] ) *( ( WORD * )DrawDstPoint + 1 ) = ColorData ;		if( --SizeXTemp == 0 ) break ;
															if( Data & Table[StX+2] ) *( ( WORD * )DrawDstPoint + 2 ) = ColorData ;		if( --SizeXTemp == 0 ) break ;
															if( Data & Table[StX+3] ) *( ( WORD * )DrawDstPoint + 3 ) = ColorData ;		if( --SizeXTemp == 0 ) break ;
															if( Data & Table[StX+4] ) *( ( WORD * )DrawDstPoint + 4 ) = ColorData ;		if( --SizeXTemp == 0 ) break ;
															if( Data & Table[StX+5] ) *( ( WORD * )DrawDstPoint + 5 ) = ColorData ;		if( --SizeXTemp == 0 ) break ;
															if( Data & Table[StX+6] ) *( ( WORD * )DrawDstPoint + 6 ) = ColorData ;		if( --SizeXTemp == 0 ) break ;
															if( Data & Table[StX+7] ) *( ( WORD * )DrawDstPoint + 7 ) = ColorData ;
 															--SizeXTemp ;
															DrawDstPoint += 16 ;
															break ;
														}

														DrawSrcPoint += 1 ;
													}while( SizeXTemp );

													DrawSrcPoint += SrcPitch2 ;
													DrawDstPoint += DstPitch2 ;
												}while( --SizeYWord ) ;
											}
											else
											{
												do{
													SizeXTemp = SizeXWord ;
													do{
														Data = *( ( WORD * )DrawSrcPoint ) ;
														for(;;)
														{
															*( ( WORD * )DrawDstPoint     ) = ( WORD )( ( Data & Table[StX]   ) ? ColorData : 0 ) ;	if( --SizeXTemp == 0 ) break ;
															*( ( WORD * )DrawDstPoint + 1 ) = ( WORD )( ( Data & Table[StX+1] ) ? ColorData : 0 ) ;	if( --SizeXTemp == 0 ) break ;
															*( ( WORD * )DrawDstPoint + 2 ) = ( WORD )( ( Data & Table[StX+2] ) ? ColorData : 0 ) ;	if( --SizeXTemp == 0 ) break ;
															*( ( WORD * )DrawDstPoint + 3 ) = ( WORD )( ( Data & Table[StX+3] ) ? ColorData : 0 ) ;	if( --SizeXTemp == 0 ) break ;
															*( ( WORD * )DrawDstPoint + 4 ) = ( WORD )( ( Data & Table[StX+4] ) ? ColorData : 0 ) ;	if( --SizeXTemp == 0 ) break ;
															*( ( WORD * )DrawDstPoint + 5 ) = ( WORD )( ( Data & Table[StX+5] ) ? ColorData : 0 ) ;	if( --SizeXTemp == 0 ) break ;
															*( ( WORD * )DrawDstPoint + 6 ) = ( WORD )( ( Data & Table[StX+6] ) ? ColorData : 0 ) ;	if( --SizeXTemp == 0 ) break ;
															*( ( WORD * )DrawDstPoint + 7 ) = ( WORD )( ( Data & Table[StX+7] ) ? ColorData : 0 ) ;  
 															--SizeXTemp ;
															DrawDstPoint += 16 ;
															break ;
														}

														DrawSrcPoint += 1 ;
													}while( SizeXTemp );

													DrawSrcPoint += SrcPitch2 ;
													DrawDstPoint += DstPitch2 ;
												}while( --SizeYWord ) ;
											}
										}
									}
									break ;

								case DX_FONTTYPE_EDGE :
									{
										WORD Width ;
										WORD EColor ;

										EColor = ( WORD )( EdgeColor & 0xffff ) ;
										if( TransFlag )
										{
											do
											{
												Width = SizeXWord ;
												do
												{
													if( *DrawSrcPoint )
													{
														*( ( WORD * )DrawDstPoint ) = *DrawSrcPoint == 1 ? ColorData : EColor ;
													}
													DrawDstPoint += 2 ;
													DrawSrcPoint ++ ;
												}while( --Width ) ;

												DrawDstPoint += DstPitch2 ;
												DrawSrcPoint += SrcPitch2 ;
											}while( --SizeYWord ) ;
										}
										else
										{
											do
											{
												Width = SizeXWord ;
												do
												{
													*( ( WORD * )DrawDstPoint ) = ( WORD )( *DrawSrcPoint ? ( *DrawSrcPoint == 1 ? ColorData : EColor ) : 0 ) ;
													DrawDstPoint += 2 ;
													DrawSrcPoint ++ ;
												}while( --Width ) ;

												DrawDstPoint += DstPitch2 ;
												DrawSrcPoint += SrcPitch2 ;
											}while( --SizeYWord ) ;
										}
									}
									break ;
								}
							}
							break ;

						case 32 :
							// 32�r�b�g���[�h�̏ꍇ
							{
								BYTE *DrawDstPoint = DestMemImg->UseImage ;
								BYTE *DrawSrcPoint = UseManageData->CacheMem ;
								unsigned int ColorData = ( DWORD )Color ;
   
								DrawDstPoint += ( DstRect.left << 2 ) + DstRect.top * DstPitch ;
								DrawSrcPoint += ( SrcRect.left ) + SrcRect.top * SrcPitch ;
								SrcPitch2 = SrcPitch - SizeX ;
								DstPitch2 = DstPitch - ( SizeX << 2 ) ;

								switch( UseManageData->FontType )
								{
								case DX_FONTTYPE_ANTIALIASING_EDGE :
								case DX_FONTTYPE_ANTIALIASING_EDGE_4X4 :
								case DX_FONTTYPE_ANTIALIASING_EDGE_8X8 :
									{
										BYTE Red1, Green1, Blue1 ;
										BYTE Red2, Green2, Blue2 ;
										DWORD AAA ;

										WORD Width ;

										Red1   = ( BYTE )( ( ColorData & MEMIMG_XRGB8_R ) >> MEMIMG_XRGB8_LR ) ;
										Green1 = ( BYTE )( ( ColorData & MEMIMG_XRGB8_G ) >> MEMIMG_XRGB8_LG ) ;
										Blue1  = ( BYTE )( ( ColorData & MEMIMG_XRGB8_B ) >> MEMIMG_XRGB8_LB ) ;

										Red2   = ( BYTE )( ( EdgeColor & MEMIMG_XRGB8_R ) >> MEMIMG_XRGB8_LR ) ;
										Green2 = ( BYTE )( ( EdgeColor & MEMIMG_XRGB8_G ) >> MEMIMG_XRGB8_LG ) ;
										Blue2  = ( BYTE )( ( EdgeColor & MEMIMG_XRGB8_B ) >> MEMIMG_XRGB8_LB ) ;

										Red1 = ( BYTE )( ( ColorData & MEMIMG_XRGB8_R ) >> MEMIMG_XRGB8_LR );
										Green1 = ( BYTE )( ( ColorData & MEMIMG_XRGB8_G ) >> MEMIMG_XRGB8_LG );
										Blue1 = ( BYTE )( ( ColorData & MEMIMG_XRGB8_B ) >> MEMIMG_XRGB8_LB );

										Red2 = ( BYTE )( ( EdgeColor & MEMIMG_XRGB8_R ) >> MEMIMG_XRGB8_LR );
										Green2 = ( BYTE )( ( EdgeColor & MEMIMG_XRGB8_G ) >> MEMIMG_XRGB8_LG );
										Blue2 = ( BYTE )( ( EdgeColor & MEMIMG_XRGB8_B ) >> MEMIMG_XRGB8_LB );

										if( TransFlag )
										{
											do
											{
												Width = SizeXWord ;
												do
												{
													if( *DrawSrcPoint & 0x0f )
													{
														if( ( *DrawSrcPoint & 0x0f ) == 0x0f )
														{
															*( ( DWORD * )DrawDstPoint ) = 0xff000000 | ColorData ;
														}
														else
														{
															*( ( DWORD * )DrawDstPoint ) = ( DWORD )( ( ( ( *DrawSrcPoint & 0x0f ) << 4 ) + ( ( 0x0f - ( *DrawSrcPoint & 0x0f ) ) * ( ( *DrawSrcPoint & 0xf0 ) >> 4 ) ) ) << 24 ) ;
															AAA = ( DWORD )( ( ( WORD )( *DrawSrcPoint & 0x0f ) << 12 ) / DrawDstPoint[3] ) ;
															*( ( DWORD * )DrawDstPoint ) |= ( DWORD )( 
																( ( ( ( ( Red1   - Red2   ) * AAA ) >> 8 ) + Red2   ) << MEMIMG_XRGB8_LR ) | 
																( ( ( ( ( Green1 - Green2 ) * AAA ) >> 8 ) + Green2 ) << MEMIMG_XRGB8_LG ) | 
																( ( ( ( ( Blue1  - Blue2  ) * AAA ) >> 8 ) + Blue2  ) << MEMIMG_XRGB8_LB ) ) ; 
														}
													}
													else
													{
														if( *DrawSrcPoint & 0xf0 )
														{
															*( ( DWORD * )DrawDstPoint ) = EdgeColor | ( ( *DrawSrcPoint & 0xf0 ) << 24 ) ;
														}
													}

													DrawDstPoint += 4 ;
													DrawSrcPoint ++ ;
												}while( --Width ) ;

												DrawDstPoint += DstPitch2 ;
												DrawSrcPoint += SrcPitch2 ;
											}while( --SizeYWord ) ;
										}
										else
										{
											do
											{
												Width = SizeXWord ;
												do
												{
													if( *DrawSrcPoint & 0x0f )
													{
														if( ( *DrawSrcPoint & 0x0f ) == 0x0f )
														{
															*( ( DWORD * )DrawDstPoint ) = 0xff000000 | ColorData ;
														}
														else
														{
															*( ( DWORD * )DrawDstPoint ) = ( DWORD )( ( ( ( *DrawSrcPoint & 0x0f ) << 4 ) + ( ( 0x0f - ( *DrawSrcPoint & 0x0f ) ) * ( ( *DrawSrcPoint & 0xf0 ) >> 4 ) ) ) << 24 ) ;
															AAA = ( DWORD )( ( ( WORD )( *DrawSrcPoint & 0x0f ) << 12 ) / DrawDstPoint[3] ) ;
															*( ( DWORD * )DrawDstPoint ) |= ( DWORD )( 
																( ( ( ( ( Red1   - Red2   ) * AAA ) >> 8 ) + Red2   ) << MEMIMG_XRGB8_LR ) | 
																( ( ( ( ( Green1 - Green2 ) * AAA ) >> 8 ) + Green2 ) << MEMIMG_XRGB8_LG ) | 
																( ( ( ( ( Blue1  - Blue2  ) * AAA ) >> 8 ) + Blue2  ) << MEMIMG_XRGB8_LB ) ) ; 
														}
													}
													else
													{
														if( *DrawSrcPoint & 0xf0 )
														{
															*( ( DWORD * )DrawDstPoint ) = EdgeColor | ( ( *DrawSrcPoint & 0xf0 ) << 24 ) ;
														}
														else
														{
															*( ( DWORD * )DrawDstPoint ) = 0 ;
														}
													}

													DrawDstPoint += 4 ;
													DrawSrcPoint ++ ;
												}while( --Width ) ;

												DrawDstPoint += DstPitch2 ;
												DrawSrcPoint += SrcPitch2 ;
											}while( --SizeYWord ) ;
										}
									}
									break ;


								case DX_FONTTYPE_ANTIALIASING :
								case DX_FONTTYPE_ANTIALIASING_4X4 :
								case DX_FONTTYPE_ANTIALIASING_8X8 :
								case DX_FONTTYPE_ANTIALIASING_16X16 :
									{
										WORD Width ;

										if( TransFlag )
										{
											do
											{
												Width = SizeXWord ;
												do
												{
													if( *DrawSrcPoint )
													{
														*( ( DWORD * )DrawDstPoint ) = ColorData | ( ( *DrawSrcPoint & 0x0f ) << 28 ) ;
													}
													DrawDstPoint += 4 ;
													DrawSrcPoint ++ ;
												}while( --Width ) ;

												DrawDstPoint += DstPitch2 ;
												DrawSrcPoint += SrcPitch2 ;
											}while( --SizeYWord ) ;
										}
										else
										{
											do
											{
												Width = SizeXWord ;
												do
												{
													if( *DrawSrcPoint )
													{
														*( ( DWORD * )DrawDstPoint ) = ColorData | ( ( *DrawSrcPoint & 0x0f ) << 28 ) ;
													}
													else
													{
														*( ( DWORD * )DrawDstPoint ) = 0 ;
													}

													DrawDstPoint += 4 ;
													DrawSrcPoint ++ ;
												}while( --Width ) ;

												DrawDstPoint += DstPitch2 ;
												DrawSrcPoint += SrcPitch2 ;
											}while( --SizeYWord ) ;
										}
									}
									break ;

								case DX_FONTTYPE_NORMAL :
									{
										WORD SizeXTemp ;
										WORD Data ;

										if( SrcRect.left % 8 == 0 )
										{
											DrawSrcPoint = UseManageData->CacheMem ;
											DrawSrcPoint += ( SrcRect.left / 8 ) + SrcRect.top * SrcPitch ;
											SrcPitch2 = SrcPitch - ( ( SizeX / 16 ) * 2 + ( SizeX % 16 != 0 ? 2 : 0 ) ) ;

											DstPitch2 = DstPitch - ( ( ( SizeX >> 4 ) << 6 ) ) ;

											if( TransFlag )
											{
												do{
													SizeXTemp = SizeXWord ;
													do{
														Data = *( ( WORD * )DrawSrcPoint ) ;
														for(;;)
														{
															if( Data & 0x80 ) *( ( DWORD * )DrawDstPoint ) = ColorData ; 		if( --SizeXTemp == 0 ) break ;
															if( Data & 0x40 ) *( ( DWORD * )DrawDstPoint + 1 ) = ColorData ;	if( --SizeXTemp == 0 ) break ;
															if( Data & 0x20 ) *( ( DWORD * )DrawDstPoint + 2 ) = ColorData ;	if( --SizeXTemp == 0 ) break ;
															if( Data & 0x10 ) *( ( DWORD * )DrawDstPoint + 3 ) = ColorData ;	if( --SizeXTemp == 0 ) break ;
															if( Data & 0x8 ) *( ( DWORD * )DrawDstPoint + 4 ) = ColorData ;		if( --SizeXTemp == 0 ) break ;
															if( Data & 0x4 ) *( ( DWORD * )DrawDstPoint + 5 ) = ColorData ;		if( --SizeXTemp == 0 ) break ;
															if( Data & 0x2 ) *( ( DWORD * )DrawDstPoint + 6 ) = ColorData ;		if( --SizeXTemp == 0 ) break ;
															if( Data & 0x1 ) *( ( DWORD * )DrawDstPoint + 7 ) = ColorData ;		if( --SizeXTemp == 0 ) break ;
															if( Data & 0x8000 ) *( ( DWORD * )DrawDstPoint + 8 ) = ColorData ;	if( --SizeXTemp == 0 ) break ;
															if( Data & 0x4000 ) *( ( DWORD * )DrawDstPoint + 9 ) = ColorData ;	if( --SizeXTemp == 0 ) break ;
															if( Data & 0x2000 ) *( ( DWORD * )DrawDstPoint + 10 ) = ColorData ;	if( --SizeXTemp == 0 ) break ;
															if( Data & 0x1000 ) *( ( DWORD * )DrawDstPoint + 11 ) = ColorData ;	if( --SizeXTemp == 0 ) break ;
															if( Data & 0x800 ) *( ( DWORD * )DrawDstPoint + 12 ) = ColorData ;	if( --SizeXTemp == 0 ) break ;
															if( Data & 0x400 ) *( ( DWORD * )DrawDstPoint + 13 ) = ColorData ;	if( --SizeXTemp == 0 ) break ;
															if( Data & 0x200 ) *( ( DWORD * )DrawDstPoint + 14 ) = ColorData ;	if( --SizeXTemp == 0 ) break ;
															if( Data & 0x100 ) *( ( DWORD * )DrawDstPoint + 15 ) = ColorData ;
															DrawDstPoint += 64 ;
 															--SizeXTemp ;
															break ;
														}

														DrawSrcPoint += 2 ;
													}while( SizeXTemp );

													DrawSrcPoint += SrcPitch2 ;
													DrawDstPoint += DstPitch2 ;
												}while( --SizeYWord ) ;
											}
											else
											{
												do{
													SizeXTemp = SizeXWord ;
													do{
														Data = *( ( WORD * )DrawSrcPoint ) ;
														for(;;)
														{
															*( ( DWORD * )DrawDstPoint ) = ( Data & 0x80 ) ? ColorData : 0 ;  		if( --SizeXTemp == 0 ) break ;
															*( ( DWORD * )DrawDstPoint + 1 ) = ( Data & 0x40 ) ? ColorData : 0 ;	if( --SizeXTemp == 0 ) break ;
															*( ( DWORD * )DrawDstPoint + 2 ) = ( Data & 0x20 ) ? ColorData : 0 ;  	if( --SizeXTemp == 0 ) break ;
															*( ( DWORD * )DrawDstPoint + 3 ) = ( Data & 0x10 ) ? ColorData : 0 ;  	if( --SizeXTemp == 0 ) break ;
															*( ( DWORD * )DrawDstPoint + 4 ) = ( Data & 0x8 ) ? ColorData : 0 ;  	if( --SizeXTemp == 0 ) break ;
															*( ( DWORD * )DrawDstPoint + 5 ) = ( Data & 0x4 ) ? ColorData : 0 ;  	if( --SizeXTemp == 0 ) break ;
															*( ( DWORD * )DrawDstPoint + 6 ) = ( Data & 0x2 ) ? ColorData : 0 ;  	if( --SizeXTemp == 0 ) break ;
															*( ( DWORD * )DrawDstPoint + 7 ) = ( Data & 0x1 ) ? ColorData : 0 ;  	if( --SizeXTemp == 0 ) break ;
															*( ( DWORD * )DrawDstPoint + 8 ) = ( Data & 0x8000 ) ? ColorData : 0 ;  if( --SizeXTemp == 0 ) break ;
															*( ( DWORD * )DrawDstPoint + 9 ) = ( Data & 0x4000 ) ? ColorData : 0 ;  if( --SizeXTemp == 0 ) break ;
															*( ( DWORD * )DrawDstPoint + 10 ) = ( Data & 0x2000 ) ? ColorData : 0 ; if( --SizeXTemp == 0 ) break ;
															*( ( DWORD * )DrawDstPoint + 11 ) = ( Data & 0x1000 ) ? ColorData : 0 ; if( --SizeXTemp == 0 ) break ;
															*( ( DWORD * )DrawDstPoint + 12 ) = ( Data & 0x800 ) ? ColorData : 0 ;  if( --SizeXTemp == 0 ) break ;
															*( ( DWORD * )DrawDstPoint + 13 ) = ( Data & 0x400 ) ? ColorData : 0 ;  if( --SizeXTemp == 0 ) break ;
															*( ( DWORD * )DrawDstPoint + 14 ) = ( Data & 0x200 ) ? ColorData : 0 ;  if( --SizeXTemp == 0 ) break ;
															*( ( DWORD * )DrawDstPoint + 15 ) = ( Data & 0x100 ) ? ColorData : 0 ;  
															DrawDstPoint += 64 ;
 															--SizeXTemp ;
															break ;
														}

														DrawSrcPoint += 2 ;
													}while( SizeXTemp );

													DrawSrcPoint += SrcPitch2 ;
													DrawDstPoint += DstPitch2 ;
												}while( --SizeYWord ) ;
											}
										}
										else
										{
											int StX = SrcRect.left % 8 ;
											WORD Table[16] = { 0x80, 0x40, 0x20, 0x10, 0x8, 0x4, 0x2, 0x1, 0x8000, 0x4000, 0x2000, 0x1000, 0x800, 0x400, 0x200, 0x100 } ;

											DrawSrcPoint = UseManageData->CacheMem ;
											DrawSrcPoint += ( SrcRect.left / 8 ) + SrcRect.top * SrcPitch ;
											SrcPitch2 = SrcPitch - ( ( SizeX / 8 ) + ( SizeX % 8 != 0 ? 1 : 0 ) ) ;

											DstPitch2 = DstPitch - ( ( ( SizeX >> 3 ) << 5 ) ) ;

											if( TransFlag )
											{
												do{
													SizeXTemp = SizeXWord ;
													do{
														Data = *( ( WORD * )DrawSrcPoint ) ;
														for(;;)
														{
															if( Data & Table[StX] ) *( ( DWORD * )DrawDstPoint ) = ColorData ;			if( --SizeXTemp == 0 ) break ;
															if( Data & Table[StX+1] ) *( ( DWORD * )DrawDstPoint + 1 ) = ColorData ;	if( --SizeXTemp == 0 ) break ;
															if( Data & Table[StX+2] ) *( ( DWORD * )DrawDstPoint + 2 ) = ColorData ;	if( --SizeXTemp == 0 ) break ;
															if( Data & Table[StX+3] ) *( ( DWORD * )DrawDstPoint + 3 ) = ColorData ;	if( --SizeXTemp == 0 ) break ;
															if( Data & Table[StX+4] ) *( ( DWORD * )DrawDstPoint + 4 ) = ColorData ;	if( --SizeXTemp == 0 ) break ;
															if( Data & Table[StX+5] ) *( ( DWORD * )DrawDstPoint + 5 ) = ColorData ;	if( --SizeXTemp == 0 ) break ;
															if( Data & Table[StX+6] ) *( ( DWORD * )DrawDstPoint + 6 ) = ColorData ;	if( --SizeXTemp == 0 ) break ;
															if( Data & Table[StX+7] ) *( ( DWORD * )DrawDstPoint + 7 ) = ColorData ;
															DrawDstPoint += 32 ;
 															--SizeXTemp ;
															break ;
														}

														DrawSrcPoint += 1 ;
													}while( SizeXTemp );

													DrawSrcPoint += SrcPitch2 ;
													DrawDstPoint += DstPitch2 ;
												}while( --SizeYWord ) ;
											}
											else
											{
												do{
													SizeXTemp = SizeXWord ;
													do{
														Data = *( ( WORD * )DrawSrcPoint ) ;
														for(;;)
														{
															*( ( DWORD * )DrawDstPoint ) = ( Data & Table[StX] ) ? ColorData : 0 ;   		if( --SizeXTemp == 0 ) break ;
															*( ( DWORD * )DrawDstPoint + 1 ) = ( Data & Table[StX+1] ) ? ColorData : 0 ;  	if( --SizeXTemp == 0 ) break ;
															*( ( DWORD * )DrawDstPoint + 2 ) = ( Data & Table[StX+2] ) ? ColorData : 0 ;  	if( --SizeXTemp == 0 ) break ;
															*( ( DWORD * )DrawDstPoint + 3 ) = ( Data & Table[StX+3] ) ? ColorData : 0 ;  	if( --SizeXTemp == 0 ) break ;
															*( ( DWORD * )DrawDstPoint + 4 ) = ( Data & Table[StX+4] ) ? ColorData : 0 ;  	if( --SizeXTemp == 0 ) break ;
															*( ( DWORD * )DrawDstPoint + 5 ) = ( Data & Table[StX+5] ) ? ColorData : 0 ;  	if( --SizeXTemp == 0 ) break ;
															*( ( DWORD * )DrawDstPoint + 6 ) = ( Data & Table[StX+6] ) ? ColorData : 0 ;  	if( --SizeXTemp == 0 ) break ;
															*( ( DWORD * )DrawDstPoint + 7 ) = ( Data & Table[StX+7] ) ? ColorData : 0 ;  
															DrawDstPoint += 32 ;
 															--SizeXTemp ;
															break ;
														}

														DrawSrcPoint += 1 ;
													}while( SizeXTemp );

													DrawSrcPoint += SrcPitch2 ;
													DrawDstPoint += DstPitch2 ;
												}while( --SizeYWord ) ;
											}
										}
									}
									break ;

								case DX_FONTTYPE_EDGE :
									{
										WORD Width ;
										DWORD EColor ;

										EColor = ( DWORD )( EdgeColor & 0xffffff ) ;
										if( TransFlag )
										{
											do
											{
												Width = SizeXWord ;
												do
												{
													if( *DrawSrcPoint )
													{
														*( ( DWORD * )DrawDstPoint ) = *DrawSrcPoint == 1 ? ColorData : EColor ;
													}
													DrawDstPoint += 4 ;
													DrawSrcPoint ++ ;
												}while( --Width ) ;

												DrawDstPoint += DstPitch2 ;
												DrawSrcPoint += SrcPitch2 ;
											}while( --SizeYWord ) ;
										}
										else
										{
											do
											{
												Width = SizeXWord ;
												do
												{
													*( ( DWORD * )DrawDstPoint ) = *DrawSrcPoint ? ( *DrawSrcPoint == 1 ? ColorData : EColor ) : 0 ;
													DrawDstPoint += 4 ;
													DrawSrcPoint ++ ;
												}while( --Width ) ;

												DrawDstPoint += DstPitch2 ;
												DrawSrcPoint += SrcPitch2 ;
											}while( --SizeYWord ) ;
										}
									}
									break ;
								}
							}
							break ;
						}
					}
				}
			}

LOOPEND :
			// ���������Z�b�g
			if( CharInfos != NULL && CharInfoBufferSize > ( size_t )CInfoNum )
			{
				float DrawX, DrawY ;
				float SizeX, SizeY ;

				_MEMSET( CharInfos[ CInfoNum ].Char, 0, sizeof( CharInfos[ CInfoNum ].Char ) ) ;
				CharInfos[ CInfoNum ].Bytes = ( BYTE )PutCharCode( ConvCharCode( *CharCode, WCHAR_T_CHARCODEFORMAT, _TCHARCODEFORMAT ), _TCHARCODEFORMAT, ( char * )CharInfos[ CInfoNum ].Char, sizeof( CharInfos[ CInfoNum ].Char ) ) ;

				if( *IVSCode != 0 )
				{
					CharInfos[ CInfoNum ].Bytes += ( BYTE )PutCharCode( ConvCharCode( *IVSCode, WCHAR_T_CHARCODEFORMAT, _TCHARCODEFORMAT ), _TCHARCODEFORMAT, ( char * )CharInfos[ CInfoNum ].Char + CharInfos[ CInfoNum ].Bytes, sizeof( CharInfos[ CInfoNum ].Char ) - CharInfos[ CInfoNum ].Bytes ) ;
				}

				if( PosIntFlag )
				{
					DrawX = ( float )( tmp_xi + DrawPos    ) ;
					DrawY = ( float )( tmp_yi + DrawPosSub ) ;
				}
				else
				{
					DrawX = ( float )( tmp_xf + DrawPos    ) ;
					DrawY = ( float )( tmp_yf + DrawPosSub ) ;
				}

				if( CharInfoType == 1 )
				{
					if( *CharCode == '\n' )
					{
						SizeX = 0.0f ;
						SizeY = ( float )DrawPosSubAdd ;
					}
					else
					if( CharData != NULL )
					{
						DrawX += ( float )( CharData->DrawX * ExRate ) ;
						DrawY += ( float )( CharData->DrawY * ExRate ) ;
						SizeX  = ( float )( CharData->SizeX * ExRate ) ;
						SizeY  = ( float )( CharData->SizeY * ExRate ) ;
					}
					else
					{
						SizeX = ( float )( UseManageData->Space * ExRate ) ;
						SizeY = ( float )DrawPosSubAdd ;
					}
				}
				else
				{
					if( *CharCode == '\n' )
					{
						SizeX = 0.0f ;
					}
					else
					if( CharData != NULL )
					{
						SizeX = ( float )( ( CharData->AddX + UseManageData->Space ) * ExRate ) ;
					}
					else
					{
						SizeX = ( float )( UseManageData->Space * ExRate ) ;
					}
					SizeY = ( float )DrawPosSubAdd ;
				}

				if( VerticalFlag == TRUE )
				{
					CharInfos[ CInfoNum ].DrawY = DrawX ;
					CharInfos[ CInfoNum ].DrawX = DrawY ;
					CharInfos[ CInfoNum ].SizeY = SizeX ;
					CharInfos[ CInfoNum ].SizeX = SizeY ;
				}
				else
				{
					CharInfos[ CInfoNum ].DrawX = DrawX ;
					CharInfos[ CInfoNum ].DrawY = DrawY ;
					CharInfos[ CInfoNum ].SizeX = SizeX ;
					CharInfos[ CInfoNum ].SizeY = SizeY ;
				}
			}
			CInfoNum ++ ;

			// ���s�����̏ꍇ�͏����𕪊�
			if( *CharCode == '\n' )
			{
				DrawPos     = 0.0 ;
				DrawPosSub += DrawPosSubAdd ;
				LFCount ++ ;
			}
			else
			{
				if( CharData != NULL )
				{
					DrawPos += ( CharData->AddX + UseManageData->Space ) * ExRate ;
				}
				else
				{
					DrawPos += UseManageData->Space * ExRate ;
				}
			}

			// �J�[�j���O����
			if( UseManageData->BaseInfo.KerningPairNum > 0 && i < DrawCharNum - 1 )
			{
				DWORD di, dj ;
				if( CharData != NULL )
				{
					for( di = 0 ; di < CharData->KerningPairNum ; di ++ )
					{
						if( CharData->KerningPair[ di ].Second == CharCode[ 1 ] )
						{
							DrawPos += CharData->KerningPair[ di ].KernAmount * ExRate ;
							break ;
						}
					}
				}
				else
				{
					for( di = 0 ; di < UseManageData->BaseInfo.KerningPairNum && UseManageData->KerningPairData[ di ].First != CharCode[ 0 ] ; di ++ ){}
					if( di != UseManageData->BaseInfo.KerningPairNum )
					{
						for( dj = 0 ; di + dj < UseManageData->BaseInfo.KerningPairNum && UseManageData->KerningPairData[ di + dj ].First == CharCode[ 0 ] ; dj ++ )
						{
							if( UseManageData->KerningPairData[ di + dj ].Second == CharCode[ 1 ] )
							{
								DrawPos += UseManageData->KerningPairData[ di + dj ].KernAmount * ExRate ;
								break ;
							}
						}
					}
				}
			}

			// �ő�`�敝�̍X�V
			if( MaxDrawPos < DrawPos )
			{
				MaxDrawPos = DrawPos ;
			}
		}
		DrawPosSub += ( UseManageData->BaseInfo.FontHeight - UseManageData->BaseInfo.FontAddHeight ) * ( VerticalFlag ? ExRateX : ExRateY ) ;

		// �e�N�X�`���� RGB �𖳎����邩�ǂ����̐ݒ�����ɖ߂�
		NS_SetIgnoreDrawGraphColor( IgnoreDrawGraphColor ) ;

		// ���Ȃ��̏ꍇ�͍Ō�ɕ`��P�x�����ɖ߂�
		Graphics_DrawSetting_SetDrawBrightToOneParam( OrigColor ) ;
	}
	else
#endif // DX_NON_GRAPHICS
	{
		// �����̐������J��Ԃ�
		CharCode = UseDrawStrBuf ;			// �`��p�����f�[�^�̐擪�A�h���X���Z�b�g
		IVSCode = UseDrawIVSBuf ;
		DrawPos = 0.0 ;
		MaxDrawPos = 0.0 ;
		DrawPosSub = 0.0 ;
		for( i = 0 ; i < DrawCharNum ; i ++, CharCode ++, IVSCode ++ )
		{
			// \n �����t���O�������Ă��Ċ��� \n �������ꍇ�͊��S��������
			if( *CharCode == '\n' && FSYS.IgnoreLFFlag )
			{
				continue ;
			}

			// �L���b�V���f�[�^���擾
			CharData = NULL ;
			if( *CharCode != '\n' )
			{
				CharData = GetFontCacheChar_Inline( ManageData, *CharCode, *IVSCode, &UseManageData, &DrawOffsetX, &DrawOffsetY, TRUE, FALSE ) ;
			}

			// �`����W�̏���
			if( ManageData == UseManageData )
			{
				if( PosIntFlag )
				{
					tmp_xi = xi + FontAddHeightXI ;
					tmp_yi = yi + FontAddHeightYI ;
				}
				else
				{
					tmp_xf = xf + FontAddHeightXF ;
					tmp_yf = yf + FontAddHeightYF ;
				}
			}
			else
			{
				tmp_xi = xi ;
				tmp_yi = yi ;
				if( VerticalFlag )
				{
					if( PosIntFlag )
					{
						tmp_xi += _DTOL( DrawOffsetY * ExRateY ) ;
						tmp_yi += _DTOL( DrawOffsetX * ExRateX ) ;
					}
					else
					{
						tmp_xf += ( float )( DrawOffsetY * ExRateY ) ;
						tmp_yf += ( float )( DrawOffsetX * ExRateX ) ;
					}
				}
				else
				{
					if( PosIntFlag )
					{
						tmp_xi += _DTOL( DrawOffsetX * ExRateX ) ;
						tmp_yi += _DTOL( DrawOffsetY * ExRateY ) ;
					}
					else
					{
						tmp_xf += ( float )( DrawOffsetX * ExRateX ) ;
						tmp_yf += ( float )( DrawOffsetY * ExRateY ) ;
					}
				}

				if( UseManageData->BaseInfo.FontAddHeight != 0 )
				{
					if( VerticalFlag )
					{
						if( PosIntFlag )
						{
							tmp_xi -=     _DTOL( UseManageData->BaseInfo.FontAddHeight / 2 * ExRateY ) ;
						}
						else
						{
							tmp_xf -= ( float )( UseManageData->BaseInfo.FontAddHeight / 2 * ExRateY ) ;
						}
					}
					else
					{
						if( PosIntFlag )
						{
							tmp_yi -=     _DTOL( UseManageData->BaseInfo.FontAddHeight / 2 * ExRateY ) ;
						}
						else
						{
							tmp_yf -= ( float )( UseManageData->BaseInfo.FontAddHeight / 2 * ExRateY ) ;
						}
					}
				}
			}

			// ���������Z�b�g
			if( CharInfos != NULL && CharInfoBufferSize > ( size_t )CInfoNum )
			{
				float DrawX, DrawY ;
				float SizeX, SizeY ;

				_MEMSET( CharInfos[ CInfoNum ].Char, 0, sizeof( CharInfos[ CInfoNum ].Char ) ) ;
				CharInfos[ CInfoNum ].Bytes = ( BYTE )PutCharCode( ConvCharCode( *CharCode, WCHAR_T_CHARCODEFORMAT, _TCHARCODEFORMAT ), _TCHARCODEFORMAT, ( char * )CharInfos[ CInfoNum ].Char, sizeof( CharInfos[ CInfoNum ].Char ) ) ;

				if( *IVSCode != 0 )
				{
					CharInfos[ CInfoNum ].Bytes += ( BYTE )PutCharCode( ConvCharCode( *IVSCode, WCHAR_T_CHARCODEFORMAT, _TCHARCODEFORMAT ), _TCHARCODEFORMAT, ( char * )CharInfos[ CInfoNum ].Char + CharInfos[ CInfoNum ].Bytes, sizeof( CharInfos[ CInfoNum ].Char ) - CharInfos[ CInfoNum ].Bytes ) ;
				}

				if( PosIntFlag )
				{
					DrawX = ( float )( tmp_xi + DrawPos    ) ;
					DrawY = ( float )( tmp_yi + DrawPosSub ) ;
				}
				else
				{
					DrawX = ( float )( tmp_xf + DrawPos    ) ;
					DrawY = ( float )( tmp_yf + DrawPosSub ) ;
				}

				if( CharInfoType == 1 )
				{
					if( *CharCode == '\n' )
					{
						SizeX = 0.0f ;
						SizeY = ( float )DrawPosSubAdd ;
					}
					else
					if( CharData != NULL )
					{
						DrawX += ( float )( CharData->DrawX * ExRate ) ;
						DrawY += ( float )( CharData->DrawY * ExRate ) ;
						SizeX  = ( float )( CharData->SizeX * ExRate ) ;
						SizeY  = ( float )( CharData->SizeY * ExRate ) ;
					}
					else
					{
						SizeX = ( float )( UseManageData->Space * ExRate ) ;
						SizeY = ( float )DrawPosSubAdd ;
					}
				}
				else
				{
					if( *CharCode == '\n' )
					{
						SizeX = 0.0f ;
					}
					else
					if( CharData != NULL )
					{
						SizeX = ( float )( ( CharData->AddX + UseManageData->Space ) * ExRate ) ;
					}
					else
					{
						SizeX = ( float )( UseManageData->Space * ExRate ) ;
					}
					SizeY = ( float )DrawPosSubAdd ;
				}

				if( VerticalFlag == TRUE )
				{
					CharInfos[ CInfoNum ].DrawY = DrawX ;
					CharInfos[ CInfoNum ].DrawX = DrawY ;
					CharInfos[ CInfoNum ].SizeY = SizeX ;
					CharInfos[ CInfoNum ].SizeX = SizeY ;
				}
				else
				{
					CharInfos[ CInfoNum ].DrawX = DrawX ;
					CharInfos[ CInfoNum ].DrawY = DrawY ;
					CharInfos[ CInfoNum ].SizeX = SizeX ;
					CharInfos[ CInfoNum ].SizeY = SizeY ;
				}
			}
			CInfoNum ++ ;

			// ���s�����̏ꍇ�͏����𕪊�
			if( *CharCode == '\n' )
			{
				CharData    = NULL ;
				DrawPos     = 0.0 ;
				DrawPosSub += DrawPosSubAdd ;
				LFCount ++ ;
			}
			else
			{
				if( CharData != NULL )
				{
					DrawPos += ( CharData->AddX + UseManageData->Space ) * ExRate ;
				}
				else
				{
					DrawPos += UseManageData->Space * ExRate ;
				}
			}

			// �J�[�j���O����
			if( UseManageData->BaseInfo.KerningPairNum > 0 && i < DrawCharNum - 1 )
			{
				DWORD di, dj ;
				if( CharData != NULL )
				{
					for( di = 0 ; di < CharData->KerningPairNum ; di ++ )
					{
						if( CharData->KerningPair[ di ].Second == CharCode[ 1 ] )
						{
							DrawPos += CharData->KerningPair[ di ].KernAmount * ExRate ;
							break ;
						}
					}
				}
				else
				{
					for( di = 0 ; di < UseManageData->BaseInfo.KerningPairNum && UseManageData->KerningPairData[ di ].First != CharCode[ 0 ] ; di ++ ){}
					if( di != UseManageData->BaseInfo.KerningPairNum )
					{
						for( dj = 0 ; di + dj < UseManageData->BaseInfo.KerningPairNum && UseManageData->KerningPairData[ di + dj ].First == CharCode[ 0 ] ; dj ++ )
						{
							if( UseManageData->KerningPairData[ di + dj ].Second == CharCode[ 1 ] )
							{
								DrawPos += UseManageData->KerningPairData[ di + dj ].KernAmount * ExRate ;
								break ;
							}
						}
					}
				}
			}

			// �ő�`�敝�̍X�V
			if( MaxDrawPos < DrawPos )
			{
				MaxDrawPos = DrawPos ;
			}
		}
		DrawPosSub += ( UseManageData->BaseInfo.FontHeight - UseManageData->BaseInfo.FontAddHeight ) * ( VerticalFlag ? ExRateX : ExRateY ) ;
	}

	if( DrawSize != NULL )
	{
		if( VerticalFlag == TRUE ) 
		{
			DrawSize->cx = _DTOL( DrawPosSub ) ;
			DrawSize->cy = _DTOL( MaxDrawPos ) ;
		}
		else
		{
			DrawSize->cx = _DTOL( MaxDrawPos ) ;
			DrawSize->cy = _DTOL( DrawPosSub ) ;
		}
	}

	if( LineCount != NULL )
	{
		*LineCount = LFCount + 1 ;
	}

	if( CharInfoNum != NULL )
	{
		*CharInfoNum = CInfoNum ;
	}

	if( UseAlloc )
	{
		DXFREE( AllocDrawStrBuf ) ;
	}

	Result = _DTOL( MaxDrawPos ) ;

END :

	// �K���f�B�t���[�Y�J���[���g�p����悤�ɂ���t���O��|��
	GSYS.DrawSetting.AlwaysDiffuseColorFlag = FALSE ;

	// �I��
	return Result ;
}

extern int NS_FontCacheStringDrawToHandle(
	int x, int y, const TCHAR *StrData, unsigned int Color, unsigned int EdgeColor,
	BASEIMAGE *DestImage, const RECT *ClipRect, int FontHandle,
	int VerticalFlag, SIZE *DrawSizeP )
{
#ifdef UNICODE
	return FontCacheStringDrawToHandle_WCHAR_T( x, y, StrData, -1, Color, EdgeColor, DestImage, ClipRect, FontHandle, VerticalFlag, DrawSizeP ) ;
#else
	int Result ;

	FONTHANDLE_TCHAR_TO_WCHAR_T_STRING_BEGIN( StrData, -1 )

	Result = FontCacheStringDrawToHandle_WCHAR_T( x, y, UseStringBuffer, -1, Color, EdgeColor, DestImage, ClipRect, FontHandle, VerticalFlag, DrawSizeP ) ;

	FONTHANDLE_TCHAR_TO_WCHAR_T_STRING_END

	return Result ;
#endif
}

extern int NS_FontCacheStringDrawToHandleWithStrLen( int x, int y, const TCHAR *StrData, size_t StrDataLength, unsigned int Color, unsigned int EdgeColor, BASEIMAGE *DestImage, const RECT *ClipRect, int FontHandle, int VerticalFlag, SIZE *DrawSizeP )
{
	int Result ;
#ifdef UNICODE
	FONTHANDLE_WCHAR_T_WITH_STRLENGTH_TO_WCHAR_T_STRING_BEGIN( StrData, StrDataLength, -1 )
	Result = FontCacheStringDrawToHandle_WCHAR_T( x, y, UseStringBuffer, ( int )StrDataLength, Color, EdgeColor, DestImage, ClipRect, FontHandle, VerticalFlag, DrawSizeP ) ;
	FONTHANDLE_WCHAR_T_TO_WCHAR_T_STRING_END
#else
	FONTHANDLE_TCHAR_WITH_STRLENGTH_TO_WCHAR_T_STRING_BEGIN( StrData, StrDataLength, -1 )
	Result = FontCacheStringDrawToHandle_WCHAR_T( x, y, UseStringBuffer, ( int )wchar_StrLength, Color, EdgeColor, DestImage, ClipRect, FontHandle, VerticalFlag, DrawSizeP ) ;
	FONTHANDLE_TCHAR_TO_WCHAR_T_STRING_END
#endif
	return Result ;
}

extern int FontCacheStringDrawToHandle_WCHAR_T(
	int x, int y, const wchar_t *StrData, int StrLen, unsigned int Color, unsigned int EdgeColor,
	BASEIMAGE *DestImage, const RECT *ClipRect, int FontHandle,
	int VerticalFlag, SIZE *DrawSizeP )
{
	static DWORD DrawStrBuf[ 2048 ] ;		// �`�悷��ۂɎg�p���镶����f�[�^�i�R�o�C�g�łP������\���j
	static DWORD DrawIVSBuf[ 2048 ] ;		// �`�悷��ۂɎg�p���镶����f�[�^�i�R�o�C�g�łP������\���j
	FONTMANAGE * cmanage ;
	FONTMANAGE * usecmanage ;
	FONTCHARDATA * cache ;
	RECT SrcRect ;
	RECT DstRect ;
	int drawnum ;							// �Q�o�C�g�����P�o�C�g�����S���Ђ�����߂ĉ��������邩�ۑ�����ϐ�
	int i ;									// �J��Ԃ��Ɣėp�ϐ�
	const DWORD *strp ;
	const DWORD *ivsp ;
	LONG dpitch, spitch ;					// �`���ƕ`����Ƃ̃T�[�t�F�X�̂P���C���̃o�C�g��
	int TotalWidth, TotalHeight ;
	int MaxTotalWidth, MaxTotalHeight ;
	int r, g, b, er, eg, eb ;
	int	UseAlloc = FALSE ;
	DWORD *AllocDrawStrBuf = NULL ;
	DWORD *UseDrawStrBuf ;
	DWORD *UseDrawIVSBuf ;
	int orig_x, orig_y ;
	int tmp_x, tmp_y ;
	int off_x, off_y ;
	int add_x = 0, add_y = 0 ;

	DEFAULT_FONT_HANDLE_SETUP

	// �G���[����
	if( FONTHCHK( FontHandle, cmanage ) )
	{
		return -1 ;
	}

	// �e�N�X�`�����L���b�V���Ɏg�p���Ă���t�H���g�͖���
	if( cmanage->TextureCacheFlag == TRUE )
	{
		return -1 ;
	}

	// �`����W�̕␳
	if( VerticalFlag )
	{
		add_x = -cmanage->BaseInfo.FontAddHeight / 2 ;
	}
	else
	{
		add_y = -cmanage->BaseInfo.FontAddHeight / 2 ;
	}

	// �������W��ۑ����Ă���
	orig_x = x ;
	orig_y = y ;

	// �F�J���[�l���擾���Ă���
	NS_GetColor5( &DestImage->ColorData, Color, &r, &g, &b, NULL ) ;
	NS_GetColor5( &DestImage->ColorData, EdgeColor, &er, &eg, &eb, NULL ) ;

	// �����񂪂Ȃ��ꍇ�͏I��
	if( StrData  == NULL || *StrData  == 0 )
	{
		return 0 ;
	}

	// �`�悷�镶����̒�����ۑ�
	{
		if( StrLen < 0 )
		{
			StrLen = ( int )_WCSLEN( StrData ) ;
		}

		if( StrLen > 1023 )
		{
			UseAlloc = TRUE ;
			AllocDrawStrBuf = ( DWORD * )DXALLOC( ( StrLen * 2 ) * sizeof( DWORD ) ) ;
			if( AllocDrawStrBuf == NULL )
			{
				return -1 ;
			}
			UseDrawStrBuf = AllocDrawStrBuf ;
			UseDrawIVSBuf = UseDrawStrBuf + StrLen ;
		}
		else
		{
			UseDrawStrBuf = DrawStrBuf ;
			UseDrawIVSBuf = DrawIVSBuf ;
		}
	}

	// �L���b�V���ɓ����Ă��Ȃ���������L���b�V���ɓ����
	FontCacheStringAddToHandle( cmanage, StrData, -1, UseDrawStrBuf, UseDrawIVSBuf, &drawnum ) ;

	// �s�b�`���Z�b�g
	dpitch = DestImage->Pitch ;

	// �����̐������J��Ԃ�
	strp			= UseDrawStrBuf ;			// �`��p�����f�[�^�̐擪�A�h���X���Z�b�g
	ivsp			= UseDrawIVSBuf ;
	TotalWidth		= 0 ;
	TotalHeight		= 0 ;
	MaxTotalWidth	= 0 ;
	MaxTotalHeight	= 0 ;
	for( i = 0 ; i < drawnum ; i ++, strp ++, ivsp ++ )
	{
		cache = NULL ;
		usecmanage = cmanage ;

		// \n �����t���O�������Ă��Ċ��� \n �������ꍇ�͊��S��������
		if( *strp == L'\n' && FSYS.IgnoreLFFlag )
		{
			continue ;
		}

		// ���s�����������ꍇ�̓L�����Z������
		if( *strp == L'\n' )
		{
			goto LOOPEND ;
		}

		// �L���b�V���f�[�^���擾
		cache = GetFontCacheChar_Inline( cmanage, *strp, *ivsp, &usecmanage, &off_x, &off_y, FALSE, FALSE ) ;
		if( cache == NULL )
		{
			return -1 ;
		}

		// �`����W�̏���
		if( cmanage == usecmanage )
		{
			tmp_x = x + add_x ;
			tmp_y = y + add_y ;
		}
		else
		{
			tmp_x = x ;
			tmp_y = y ;
			if( VerticalFlag )
			{
				tmp_x += off_y ;
				tmp_y += off_x ;
			}
			else
			{
				tmp_x += off_x ;
				tmp_y += off_y ;
			}

			if( usecmanage->BaseInfo.FontAddHeight != 0 )
			{
				if( VerticalFlag )
				{
					tmp_x -= usecmanage->BaseInfo.FontAddHeight / 2 ;
				}
				else
				{
					tmp_y -= usecmanage->BaseInfo.FontAddHeight / 2 ;
				}
			}
		}

		// �X�y�[�X�����������ꍇ�̓L�����Z������
		if( *strp == L' ' || ( wchar_t )*strp == FSYS.DoubleByteSpaceCharCode )
		{
			goto LOOPEND ;
		}

		// �T�C�Y�����������牽�����Ȃ�
		if( cache->SizeX == 0 && cache->SizeY == 0 )
		{
			goto LOOPEND ;
		}

		// �s�b�`���Z�b�g
		spitch = usecmanage->CachePitch ;

		// �]����̕`��̈���쐬
		DstRect.left	= tmp_x + cache->DrawX ;
		DstRect.top		= tmp_y + cache->DrawY ;
		DstRect.right	= tmp_x + cache->DrawX + cache->SizeX ;
		DstRect.bottom	= tmp_y + cache->DrawY + cache->SizeY ;
		if( ClipRect == NULL )
		{
			RECT BaseRect ;
			BaseRect.left = 0 ;
			BaseRect.top = 0 ;
			BaseRect.right = DestImage->Width ;
			BaseRect.bottom = DestImage->Height ;
			RectClipping_Inline( &DstRect, &BaseRect ) ;
		}
		else
		{
			RectClipping_Inline( &DstRect, ClipRect ) ;
		}

		// �`�悷�镶�������������ꍇ�����Ŏ����[�v�Ɉڂ�
		if( DstRect.right == DstRect.left || DstRect.bottom == DstRect.top )
		{
			goto LOOPEND ;
		}

		// �]�����̋�`���Z�b�g
		SrcRect.left	=   cache->GraphIndex / usecmanage->LengthCharNum   * usecmanage->BaseInfo.MaxWidth ;
		SrcRect.top		= ( cache->GraphIndex % usecmanage->LengthCharNum ) * usecmanage->BaseInfo.MaxWidth ;
		if( usecmanage->TextureCacheFlag == TRUE )
		{
			SrcRect.left ++ ;
			SrcRect.top ++ ;
		}
		SrcRect.right	= SrcRect.left + cache->SizeX ;
		SrcRect.bottom	= SrcRect.top + cache->SizeY ;

		// �]�����̋�`��␳
		SrcRect.left   += DstRect.left - ( tmp_x + cache->DrawX ) ;
		SrcRect.top    += DstRect.top  - ( tmp_y + cache->DrawY ) ;
		SrcRect.right  -= ( ( tmp_x + cache->DrawX ) + cache->SizeX ) - DstRect.right ;
		SrcRect.bottom -= ( ( tmp_y + cache->DrawY ) + cache->SizeY ) - DstRect.bottom ;

		// �]��
		{
			DWORD spitch2, dpitch2 ;
			DWORD SizeX, SizeY ;
			WORD SizeXWord, SizeYWord ;

			SizeX = ( DWORD )( SrcRect.right - SrcRect.left ) ;
			SizeY = ( DWORD )( SrcRect.bottom - SrcRect.top ) ;
			SizeXWord = ( WORD )SizeX ;
			SizeYWord = ( WORD )SizeY ;

			// �F�̃r�b�g�[�x�ɂ���ď����𕪊�
			switch( DestImage->ColorData.ColorBitDepth )
			{
			case 8 :
				// 8�r�b�g���[�h�̎��̏���
				{
					BYTE *dest = ( BYTE * )DestImage->GraphData ;
					BYTE *src = usecmanage->CacheMem ;
					BYTE cr = ( BYTE )( Color & 0xff ) ;

					dest += ( DstRect.left ) + DstRect.top * dpitch ;
					src += ( SrcRect.left ) + SrcRect.top * spitch ;

					spitch2 = spitch - SizeX ;
					dpitch2 = dpitch - SizeX ;

					switch( usecmanage->FontType )
					{
					case DX_FONTTYPE_NORMAL :
						{
							DWORD wtemp ;
							WORD dat ;
							DWORD WordNum, NokoriNum ;

							if( SrcRect.left % 8 == 0 )
							{
								src = usecmanage->CacheMem ;
								src += ( SrcRect.left / 8 ) + SrcRect.top * spitch ;
								spitch2 = spitch - ( ( SizeX / 16 ) * 2 + ( SizeX % 16 != 0 ? 2 : 0 ) ) ;
								dpitch2 = dpitch - ( ( ( SizeX >> 4 ) << 4 ) ) ;
								WordNum = ( DWORD )( SizeXWord / 16 ) ;
								NokoriNum = SizeXWord - WordNum * 16 ;

								do
								{
									if( WordNum != 0 )
									{
										wtemp = WordNum ;
										do
										{
											dat = *(( WORD *)src) ;
											if( dat & 0x80 ) dest[0] = cr ;
											if( dat & 0x40 ) dest[1] = cr ;
											if( dat & 0x20 ) dest[2] = cr ;
											if( dat & 0x10 ) dest[3] = cr ;
											if( dat & 0x8 ) dest[4] = cr ;
											if( dat & 0x4 ) dest[5] = cr ;
											if( dat & 0x2 ) dest[6] = cr ;
											if( dat & 0x1 ) dest[7] = cr ;
											if( dat & 0x8000 ) dest[8] = cr ;
											if( dat & 0x4000 ) dest[9] = cr ;
											if( dat & 0x2000 ) dest[10] = cr ;
											if( dat & 0x1000 ) dest[11] = cr ;
											if( dat & 0x800 ) dest[12] = cr ;
											if( dat & 0x400 ) dest[13] = cr ;
											if( dat & 0x200 ) dest[14] = cr ;
											if( dat & 0x100 ) dest[15] = cr ;
											dest += 16 ;
											src += 2 ;
										}while( --wtemp ) ;
									}

									if( NokoriNum != 0 )
									{
										wtemp = NokoriNum ;
										do
										{
											dat = *(( WORD *)src ) ;
											for(;;)
											{
												if( dat & 0x80 ) dest[0] = cr ;
 												if( --wtemp == 0 ) break ;
												if( dat & 0x40 ) dest[1] = cr ;
 												if( --wtemp == 0 ) break ;
												if( dat & 0x20 ) dest[2] = cr ;
 												if( --wtemp == 0 ) break ;
												if( dat & 0x10 ) dest[3] = cr ;
 												if( --wtemp == 0 ) break ;
												if( dat & 0x8 ) dest[4] = cr ;
 												if( --wtemp == 0 ) break ;
												if( dat & 0x4 ) dest[5] = cr ;
 												if( --wtemp == 0 ) break ;
												if( dat & 0x2 ) dest[6] = cr ;
 												if( --wtemp == 0 ) break ;
												if( dat & 0x1 ) dest[7] = cr ;
 												if( --wtemp == 0 ) break ;
												if( dat & 0x8000 ) dest[8] = cr ;
 												if( --wtemp == 0 ) break ;
												if( dat & 0x4000 ) dest[9] = cr ;
 												if( --wtemp == 0 ) break ;
												if( dat & 0x2000 ) dest[10] = cr ;
 												if( --wtemp == 0 ) break ;
												if( dat & 0x1000 ) dest[11] = cr ;
 												if( --wtemp == 0 ) break ;
												if( dat & 0x800 ) dest[12] = cr ;
 												if( --wtemp == 0 ) break ;
												if( dat & 0x400 ) dest[13] = cr ;
 												if( --wtemp == 0 ) break ;
												if( dat & 0x200 ) dest[14] = cr ;
 												if( --wtemp == 0 ) break ;
												if( dat & 0x100 ) dest[15] = cr ;
												dest += 16 ;
 												--wtemp ;
												break ;
											}

											src += 2 ;
										}while( wtemp );
									}

									src += spitch2 ;
									dest += dpitch2 ;
								}while( --SizeYWord ) ;
/*
								do{
									wtemp = SizeXWord ;
									do{
										dat = *(( WORD *)src) ;
										do{
											if( dat & 0x80 ) dest[0] = cr ;
 											if( --wtemp == 0 ) break ;
											if( dat & 0x40 ) dest[1] = cr ;
 											if( --wtemp == 0 ) break ;
											if( dat & 0x20 ) dest[2] = cr ;
 											if( --wtemp == 0 ) break ;
											if( dat & 0x10 ) dest[3] = cr ;
 											if( --wtemp == 0 ) break ;
											if( dat & 0x8 ) dest[4] = cr ;
 											if( --wtemp == 0 ) break ;
											if( dat & 0x4 ) dest[5] = cr ;
 											if( --wtemp == 0 ) break ;
											if( dat & 0x2 ) dest[6] = cr ;
 											if( --wtemp == 0 ) break ;
											if( dat & 0x1 ) dest[7] = cr ;
 											if( --wtemp == 0 ) break ;
											if( dat & 0x8000 ) dest[8] = cr ;
 											if( --wtemp == 0 ) break ;
											if( dat & 0x4000 ) dest[9] = cr ;
 											if( --wtemp == 0 ) break ;
											if( dat & 0x2000 ) dest[10] = cr ;
 											if( --wtemp == 0 ) break ;
											if( dat & 0x1000 ) dest[11] = cr ;
 											if( --wtemp == 0 ) break ;
											if( dat & 0x800 ) dest[12] = cr ;
 											if( --wtemp == 0 ) break ;
											if( dat & 0x400 ) dest[13] = cr ;
 											if( --wtemp == 0 ) break ;
											if( dat & 0x200 ) dest[14] = cr ;
 											if( --wtemp == 0 ) break ;
											if( dat & 0x100 ) dest[15] = cr ;
											dest += 16 ;
 											--wtemp ;
										}while(0);

										src += 2 ;
									}while( wtemp );

									src += spitch2 ;
									dest += dpitch2 ;
								}while( --SizeYWord ) ;
*/							}
							else
							{
								int StX = SrcRect.left % 8 ;
								WORD Table[16] = { 0x80, 0x40, 0x20, 0x10, 0x8, 0x4, 0x2, 0x1, 0x8000, 0x4000, 0x2000, 0x1000, 0x800, 0x400, 0x200, 0x100 } ;

								src = usecmanage->CacheMem ;
								src += ( SrcRect.left / 8 ) + SrcRect.top * spitch ;
								spitch2 = spitch - ( ( SizeX / 8 ) + ( SizeX % 8 != 0 ? 1 : 0 ) ) ;
								dpitch2 = dpitch - ( ( ( SizeX >> 3 ) << 3 ) ) ;

								do{
									wtemp = SizeXWord ;
									do{
										dat = *(( WORD *)src) ;
										for(;;)
										{
											if( dat & Table[StX] ) dest[0] = cr ;
 											if( --wtemp == 0 ) break ;
											if( dat & Table[StX+1] ) dest[1] = cr ;
 											if( --wtemp == 0 ) break ;
											if( dat & Table[StX+2] ) dest[2] = cr ;
 											if( --wtemp == 0 ) break ;
											if( dat & Table[StX+3] ) dest[3] = cr ;
 											if( --wtemp == 0 ) break ;
											if( dat & Table[StX+4] ) dest[4] = cr ;
 											if( --wtemp == 0 ) break ;
											if( dat & Table[StX+5] ) dest[5] = cr ;
 											if( --wtemp == 0 ) break ;
											if( dat & Table[StX+6] ) dest[6] = cr ;
 											if( --wtemp == 0 ) break ;
											if( dat & Table[StX+7] ) dest[7] = cr ;
											dest += 8 ;
 											--wtemp ;
											break ;
										}

										src += 1 ;
									}while( wtemp );

									src += spitch2 ;
									dest += dpitch2 ;
								}while( --SizeYWord ) ;
							}
						}
						break ;


					case DX_FONTTYPE_EDGE :
						{
							WORD wtemp ;
							BYTE ecr ;

							ecr = (BYTE)( EdgeColor & 0xff ) ;
							do
							{
								wtemp = SizeXWord ;
								do
								{
									if( *src ) *dest = *src == 1 ? cr : ecr ;

									dest ++ ;
									src ++ ;
								}while( --wtemp ) ;

								dest += dpitch2 ;
								src += spitch2 ;
							}while( --SizeYWord ) ;
						}
						break ;
					}
				}
				break ;

			case 16 :
				// 16�r�b�g���[�h�̎��̏���
				{
					BYTE *dest = ( BYTE * )DestImage->GraphData ;
					BYTE *src = usecmanage->CacheMem ;
					WORD cr = (WORD)( Color & 0xffff ), ecr = (WORD)( EdgeColor & 0xffff );

					dest += ( DstRect.left << 1 ) + DstRect.top * dpitch ;
					src += SrcRect.left + SrcRect.top * spitch ;

					spitch2 = spitch - SizeX ;
					dpitch2 = dpitch - ( SizeX << 1 ) ;

					switch( usecmanage->FontType )
					{
					case DX_FONTTYPE_ANTIALIASING_EDGE :
					case DX_FONTTYPE_ANTIALIASING_EDGE_4X4 :
					case DX_FONTTYPE_ANTIALIASING_EDGE_8X8 :
						{
							BYTE r1, g1, b1 ;
							BYTE r2, g2, b2 ;
							BYTE r3, g3, b3 ;
							DWORD AAA, AAA2 ;
							WORD wtemp ;

							src = usecmanage->CacheMem + ( SrcRect.left << 1 ) + SrcRect.top * spitch ;
							spitch2 = spitch - ( SizeX << 1 ) ;

							if( ( DestImage->ColorData.RedMask & MEMIMG_R5G6B5_R ) &&
								( DestImage->ColorData.GreenMask & MEMIMG_R5G6B5_G ) &&
								( DestImage->ColorData.BlueMask & MEMIMG_R5G6B5_B ) )
							{
								r1 = ( BYTE )( r >> 3 ) ;
								g1 = ( BYTE )( g >> 2 ) ;
								b1 = ( BYTE )( b >> 3 ) ;

								r2 = ( BYTE )( er >> 3 ) ;
								g2 = ( BYTE )( eg >> 2 ) ;
								b2 = ( BYTE )( eb >> 3 ) ;

								do
								{
									wtemp = SizeXWord ;
									do
									{
										if( src[0] )
										{
											if( src[0] == 255 )
											{
												*((WORD *)dest) = cr ;
											}
											else
											{
												r3 = (BYTE)( (*((WORD *)dest) & MEMIMG_R5G6B5_R) >> MEMIMG_R5G6B5_LR );
												g3 = (BYTE)( (*((WORD *)dest) & MEMIMG_R5G6B5_G) >> MEMIMG_R5G6B5_LG );
												b3 = (BYTE)( (*((WORD *)dest) & MEMIMG_R5G6B5_B) >> MEMIMG_R5G6B5_LB );

												AAA2 = ( DWORD )( src[0] + (((256 - src[0]) * src[1]) >> 8) ) ;
												AAA  = ((WORD)src[0] << 8) / AAA2 ;
												*((WORD *)dest) = ( WORD )( 
													(((((((((r1 - r2) * AAA) >> 8) + r2) - r3) * AAA2) >> 8) + r3) << MEMIMG_R5G6B5_LR ) | 
													(((((((((g1 - g2) * AAA) >> 8) + g2) - g3) * AAA2) >> 8) + g3) << MEMIMG_R5G6B5_LG ) | 
													(((((((((b1 - b2) * AAA) >> 8) + b2) - b3) * AAA2) >> 8) + b3) << MEMIMG_R5G6B5_LB ) ) ;
											}
										}
										else
										if( src[1] )
										{
											if( src[1] == 255 )
											{
												*((WORD *)dest) = ecr ;
											}
											else
											{
												r3 = (BYTE)( (*((WORD *)dest) & MEMIMG_R5G6B5_R) >> MEMIMG_R5G6B5_LR );
												g3 = (BYTE)( (*((WORD *)dest) & MEMIMG_R5G6B5_G) >> MEMIMG_R5G6B5_LG );
												b3 = (BYTE)( (*((WORD *)dest) & MEMIMG_R5G6B5_B) >> MEMIMG_R5G6B5_LB );

												*((WORD *)dest) = ( WORD )( 
													(((((r2 - r3) * src[1]) >> 8) + r3) << MEMIMG_R5G6B5_LR ) | 
													(((((g2 - g3) * src[1]) >> 8) + g3) << MEMIMG_R5G6B5_LG ) | 
													(((((b2 - b3) * src[1]) >> 8) + b3) << MEMIMG_R5G6B5_LB ) ) ;
											}
										}

										dest += 2 ;
										src += 2 ;
									}while( --wtemp ) ;

									dest += dpitch2 ;
									src += spitch2 ;
								}while( --SizeYWord ) ;
							}
							else
							if( ( DestImage->ColorData.RedMask & MEMIMG_RGB5_R ) &&
								( DestImage->ColorData.GreenMask & MEMIMG_RGB5_G ) &&
								( DestImage->ColorData.BlueMask & MEMIMG_RGB5_B ) )
							{
								r1 = ( BYTE )( r >> 3 ) ;
								g1 = ( BYTE )( g >> 3 ) ;
								b1 = ( BYTE )( b >> 3 ) ;

								r2 = ( BYTE )( er >> 3 ) ;
								g2 = ( BYTE )( eg >> 3 ) ;
								b2 = ( BYTE )( eb >> 3 ) ;

								do
								{
									wtemp = SizeXWord ;
									do
									{
										if( src[0] )
										{
											if( src[0] == 255 )
											{
												*((WORD *)dest) = cr ;
											}
											else
											{
												r3 = (BYTE)( (*((WORD *)dest) & MEMIMG_RGB5_R) >> MEMIMG_RGB5_LR );
												g3 = (BYTE)( (*((WORD *)dest) & MEMIMG_RGB5_G) >> MEMIMG_RGB5_LG );
												b3 = (BYTE)( (*((WORD *)dest) & MEMIMG_RGB5_B) >> MEMIMG_RGB5_LB );

												AAA2 = ( DWORD )( src[0] + (((256 - src[0]) * src[1]) >> 8) ) ;
												AAA  = ((WORD)src[0] << 8) / AAA2 ;
												*((WORD *)dest) = ( WORD )( 
													(((((((((r1 - r2) * AAA) >> 8) + r2) - r3) * AAA2) >> 8) + r3) << MEMIMG_RGB5_LR ) | 
													(((((((((g1 - g2) * AAA) >> 8) + g2) - g3) * AAA2) >> 8) + g3) << MEMIMG_RGB5_LG ) | 
													(((((((((b1 - b2) * AAA) >> 8) + b2) - b3) * AAA2) >> 8) + b3) << MEMIMG_RGB5_LB ) ) ;
											}
										}
										else
										if( src[1] )
										{
											if( src[1] == 255 )
											{
												*((WORD *)dest) = ecr ;
											}
											else
											{
												r3 = (BYTE)( (*((WORD *)dest) & MEMIMG_RGB5_R) >> MEMIMG_RGB5_LR );
												g3 = (BYTE)( (*((WORD *)dest) & MEMIMG_RGB5_G) >> MEMIMG_RGB5_LG );
												b3 = (BYTE)( (*((WORD *)dest) & MEMIMG_RGB5_B) >> MEMIMG_RGB5_LB );

												*((WORD *)dest) = ( WORD )( 
													(((((r2 - r3) * src[1]) >> 8) + r3) << MEMIMG_RGB5_LR ) | 
													(((((g2 - g3) * src[1]) >> 8) + g3) << MEMIMG_RGB5_LG ) | 
													(((((b2 - b3) * src[1]) >> 8) + b3) << MEMIMG_RGB5_LB ) ) ;
											}
										}

										dest += 2 ;
										src += 2 ;
									}while( --wtemp ) ;

									dest += dpitch2 ;
									src += spitch2 ;
								}while( --SizeYWord ) ;
							}
						}
						break ;

					case DX_FONTTYPE_ANTIALIASING :
					case DX_FONTTYPE_ANTIALIASING_4X4 :
					case DX_FONTTYPE_ANTIALIASING_8X8 :
					case DX_FONTTYPE_ANTIALIASING_16X16 :
						{
							WORD wtemp ;
							BYTE r1, g1, b1 ;
							BYTE r3, g3, b3 ;

							src = usecmanage->CacheMem + ( SrcRect.left << 1 ) + SrcRect.top * spitch ;
							spitch2 = spitch - ( SizeX << 1 ) ;

							if( ( DestImage->ColorData.RedMask & MEMIMG_R5G6B5_R ) &&
								( DestImage->ColorData.GreenMask & MEMIMG_R5G6B5_G ) &&
								( DestImage->ColorData.BlueMask & MEMIMG_R5G6B5_B ) )
							{
								r1 = ( BYTE )( r >> 3 ) ;
								g1 = ( BYTE )( g >> 2 ) ;
								b1 = ( BYTE )( b >> 3 ) ;

								do
								{
									wtemp = SizeXWord ;
									do
									{
										if( src[0] )
										{
											if( src[0] == 255 )
											{
												*((WORD *)dest) = cr ;
											}
											else
											{
												r3 = (BYTE)( (*((WORD *)dest) & MEMIMG_R5G6B5_R) >> MEMIMG_R5G6B5_LR );
												g3 = (BYTE)( (*((WORD *)dest) & MEMIMG_R5G6B5_G) >> MEMIMG_R5G6B5_LG );
												b3 = (BYTE)( (*((WORD *)dest) & MEMIMG_R5G6B5_B) >> MEMIMG_R5G6B5_LB );

												*((WORD *)dest) = ( WORD )( 
													(((((r1 - r3) * src[0]) >> 8) + r3) << MEMIMG_R5G6B5_LR ) | 
													(((((g1 - g3) * src[0]) >> 8) + g3) << MEMIMG_R5G6B5_LG ) | 
													(((((b1 - b3) * src[0]) >> 8) + b3) << MEMIMG_R5G6B5_LB ) ) ;
											}
										}
										dest += 2 ;
										src ++ ;
									}while( --wtemp ) ;

									dest += dpitch2 ;
									src += spitch2 ;
								}while( --SizeYWord ) ;
							}
							else
							if( ( DestImage->ColorData.RedMask & MEMIMG_RGB5_R ) &&
								( DestImage->ColorData.GreenMask & MEMIMG_RGB5_G ) &&
								( DestImage->ColorData.BlueMask & MEMIMG_RGB5_B ) )
							{
								r1 = ( BYTE )( r >> 3 ) ;
								g1 = ( BYTE )( g >> 3 ) ;
								b1 = ( BYTE )( b >> 3 ) ;

								do
								{
									wtemp = SizeXWord ;
									do
									{
										if( src[0] )
										{
											if( src[0] == 255 )
											{
												*((WORD *)dest) = cr ;
											}
											else
											{
												r3 = (BYTE)( (*((WORD *)dest) & MEMIMG_RGB5_R) >> MEMIMG_RGB5_LR );
												g3 = (BYTE)( (*((WORD *)dest) & MEMIMG_RGB5_G) >> MEMIMG_RGB5_LG );
												b3 = (BYTE)( (*((WORD *)dest) & MEMIMG_RGB5_B) >> MEMIMG_RGB5_LB );

												*((WORD *)dest) = ( WORD )( 
													(((((r1 - r3) * src[0]) >> 8) + r3) << MEMIMG_RGB5_LR ) | 
													(((((g1 - g3) * src[0]) >> 8) + g3) << MEMIMG_RGB5_LG ) | 
													(((((b1 - b3) * src[0]) >> 8) + b3) << MEMIMG_RGB5_LB ) ) ;
											}
										}
										dest += 2 ;
										src ++ ;
									}while( --wtemp ) ;

									dest += dpitch2 ;
									src += spitch2 ;
								}while( --SizeYWord ) ;
							}
						}
						break ;

					case DX_FONTTYPE_NORMAL :
						{
							DWORD wtemp ;
							WORD dat ;

							if( SrcRect.left % 8 == 0 )
							{
								src = usecmanage->CacheMem ;
								src += ( SrcRect.left / 8 ) + SrcRect.top * spitch ;
								spitch2 = spitch - ( ( SizeX / 16 ) * 2 + ( SizeX % 16 != 0 ? 2 : 0 ) ) ;
								dpitch2 = dpitch - ( ( ( SizeX >> 4 ) << 5 ) ) ;

								do{
									wtemp = SizeXWord ;
									do{
										dat = *(( WORD *)src) ;
										for(;;)
										{
											if( dat & 0x80 ) *( ( WORD * )dest ) = cr ;
 											if( --wtemp == 0 ) break ;
											if( dat & 0x40 ) *( ( WORD * )dest + 1 ) = cr ;
 											if( --wtemp == 0 ) break ;
											if( dat & 0x20 ) *( ( WORD * )dest + 2 ) = cr ;
 											if( --wtemp == 0 ) break ;
											if( dat & 0x10 ) *( ( WORD * )dest + 3 ) = cr ;
 											if( --wtemp == 0 ) break ;
											if( dat & 0x8 ) *( ( WORD * )dest + 4 ) = cr ;
 											if( --wtemp == 0 ) break ;
											if( dat & 0x4 ) *( ( WORD * )dest + 5 ) = cr ;
 											if( --wtemp == 0 ) break ;
											if( dat & 0x2 ) *( ( WORD * )dest + 6 ) = cr ;
 											if( --wtemp == 0 ) break ;
											if( dat & 0x1 ) *( ( WORD * )dest + 7 ) = cr ;
 											if( --wtemp == 0 ) break ;
											if( dat & 0x8000 ) *( ( WORD * )dest + 8 ) = cr ;
 											if( --wtemp == 0 ) break ;
											if( dat & 0x4000 ) *( ( WORD * )dest + 9 ) = cr ;
 											if( --wtemp == 0 ) break ;
											if( dat & 0x2000 ) *( ( WORD * )dest + 10 ) = cr ;
 											if( --wtemp == 0 ) break ;
											if( dat & 0x1000 ) *( ( WORD * )dest + 11 ) = cr ;
 											if( --wtemp == 0 ) break ;
											if( dat & 0x800 ) *( ( WORD * )dest + 12 ) = cr ;
 											if( --wtemp == 0 ) break ;
											if( dat & 0x400 ) *( ( WORD * )dest + 13 ) = cr ;
 											if( --wtemp == 0 ) break ;
											if( dat & 0x200 ) *( ( WORD * )dest + 14 ) = cr ;
 											if( --wtemp == 0 ) break ;
											if( dat & 0x100 ) *( ( WORD * )dest + 15 ) = cr ;
											dest += 32 ;
 											--wtemp ;
											break ;
										}

										src += 2 ;
									}while( wtemp );

									src += spitch2 ;
									dest += dpitch2 ;
								}while( --SizeYWord ) ;
							}
							else
							{
								int StX = SrcRect.left % 8 ;
								WORD Table[16] = { 0x80, 0x40, 0x20, 0x10, 0x8, 0x4, 0x2, 0x1, 0x8000, 0x4000, 0x2000, 0x1000, 0x800, 0x400, 0x200, 0x100 } ;
								src = usecmanage->CacheMem ;
								src += ( SrcRect.left / 8 ) + SrcRect.top * spitch ;
								spitch2 = spitch - ( ( SizeX / 8 ) + ( SizeX % 8 != 0 ? 1 : 0 ) ) ;
								dpitch2 = dpitch - ( ( ( SizeX >> 3 ) << 4 ) ) ;

								do{
									wtemp = SizeXWord ;
									do{
										dat = *( ( WORD * )src ) ;
										for(;;)
										{
											if( dat & Table[StX] ) *( ( WORD * )dest ) = cr ;
 											if( --wtemp == 0 ) break ;
											if( dat & Table[StX+1] ) *( ( WORD * )dest + 1 ) = cr ;
 											if( --wtemp == 0 ) break ;
											if( dat & Table[StX+2] ) *( ( WORD * )dest + 2 ) = cr ;
 											if( --wtemp == 0 ) break ;
											if( dat & Table[StX+3] ) *( ( WORD * )dest + 3 ) = cr ;
 											if( --wtemp == 0 ) break ;
											if( dat & Table[StX+4] ) *( ( WORD * )dest + 4 ) = cr ;
 											if( --wtemp == 0 ) break ;
											if( dat & Table[StX+5] ) *( ( WORD * )dest + 5 ) = cr ;
 											if( --wtemp == 0 ) break ;
											if( dat & Table[StX+6] ) *( ( WORD * )dest + 6 ) = cr ;
 											if( --wtemp == 0 ) break ;
											if( dat & Table[StX+7] ) *( ( WORD * )dest + 7 ) = cr ;
 											--wtemp ;
											dest += 16 ;
											break ;
										}

										src += 1 ;
									}while( wtemp );

									src += spitch2 ;
									dest += dpitch2 ;
								}while( --SizeYWord ) ;
							}
						}
						break ;

					case DX_FONTTYPE_EDGE :
						{
							WORD wtemp ;
							WORD ecrW ;

							ecrW = (WORD)( EdgeColor & 0xffff ) ;
							do
							{
								wtemp = SizeXWord ;
								do
								{
									if( *src ) *((WORD *)dest) = (*src & 2) ? cr : ecrW ;
									dest += 2 ;
									src ++ ;
								}while( --wtemp ) ;

								dest += dpitch2 ;
								src += spitch2 ;
							}while( --SizeYWord ) ;
						}
						break ;
					}
				}
				break ;

			case 32 :
				// 32�r�b�g���[�h�̏ꍇ
				{
					BYTE *dest = (BYTE *)DestImage->GraphData ;
					BYTE *src = usecmanage->CacheMem ;
					DWORD cr = ( DWORD )Color, ecr = (DWORD)EdgeColor ;

					dest += ( DstRect.left << 2 ) + DstRect.top * dpitch ;
					src += ( SrcRect.left ) + SrcRect.top * spitch ;

					spitch2 = spitch - SizeX ;
					dpitch2 = dpitch - ( SizeX << 2 ) ;

					switch( usecmanage->FontType )
					{
					case DX_FONTTYPE_ANTIALIASING_EDGE :
					case DX_FONTTYPE_ANTIALIASING_EDGE_4X4 :
					case DX_FONTTYPE_ANTIALIASING_EDGE_8X8 :
						{
							BYTE r1, g1, b1 ;
							BYTE r2, g2, b2 ;
							DWORD AAA, AAA2 ;
							WORD wtemp ;

							spitch2 = spitch - ( SizeX << 1 ) ;
							src = usecmanage->CacheMem + ( SrcRect.left << 1 ) + SrcRect.top * spitch ;

							r1 = ( BYTE )r;
							g1 = ( BYTE )g;
							b1 = ( BYTE )b;

							r2 = ( BYTE )er;
							g2 = ( BYTE )eg;
							b2 = ( BYTE )eb;

							do
							{
								wtemp = SizeXWord ;
								do
								{
									if( src[0] )
									{
										if( src[0] == 255 )
										{
											*((DWORD *)dest) = cr ;
										}
										else
										{
											AAA2 = ( DWORD )( src[0] + (((256 - src[0]) * src[1]) >> 8 ) ) ;
											AAA  = ((WORD)src[0] << 8) / AAA2 ;
											*((DWORD *)dest) = ( DWORD )( 
												(((((((((r1 - r2) * AAA) >> 8) + r2) - dest[2]) * AAA2) >> 8) + dest[2]) << MEMIMG_XRGB8_LR ) | 
												(((((((((g1 - g2) * AAA) >> 8) + g2) - dest[1]) * AAA2) >> 8) + dest[1]) << MEMIMG_XRGB8_LG ) | 
												(((((((((b1 - b2) * AAA) >> 8) + b2) - dest[0]) * AAA2) >> 8) + dest[0]) << MEMIMG_XRGB8_LB ) ) ;
										}
									}
									else
									if( src[1] )
									{
										if( src[1] == 255 )
										{
											*((DWORD *)dest) = ecr ;
										}
										else
										{
											*((DWORD *)dest) = ( DWORD )( 
												(((((r2 - dest[2]) * src[1]) >> 8) + dest[2]) << MEMIMG_XRGB8_LR ) | 
												(((((g2 - dest[1]) * src[1]) >> 8) + dest[1]) << MEMIMG_XRGB8_LG ) | 
												(((((b2 - dest[0]) * src[1]) >> 8) + dest[0]) << MEMIMG_XRGB8_LB ) ) ;
										}
									}

									dest += 4 ;
									src += 2 ;
								}while( --wtemp ) ;

								dest += dpitch2 ;
								src += spitch2 ;
							}while( --SizeYWord ) ;
						}
						break ;


					case DX_FONTTYPE_ANTIALIASING :
					case DX_FONTTYPE_ANTIALIASING_4X4 :
					case DX_FONTTYPE_ANTIALIASING_8X8 :
					case DX_FONTTYPE_ANTIALIASING_16X16 :
						{
							BYTE r1, g1, b1 ;
							WORD wtemp ;

							r1 = ( BYTE )r;
							g1 = ( BYTE )g;
							b1 = ( BYTE )b;
							do
							{
								wtemp = SizeXWord ;
								do
								{
									if( src[0] == 255 )
									{
										*((DWORD *)dest) = ecr ;
									}
									else
									{
										*((DWORD *)dest) = ( DWORD )( 
											(((((r1 - dest[2]) * src[1]) >> 8) + dest[2]) << MEMIMG_XRGB8_LR ) | 
											(((((g1 - dest[1]) * src[1]) >> 8) + dest[1]) << MEMIMG_XRGB8_LG ) | 
											(((((b1 - dest[0]) * src[1]) >> 8) + dest[0]) << MEMIMG_XRGB8_LB ) ) ;
									}

									dest += 4 ;
									src ++ ;
								}while( --wtemp ) ;

								dest += dpitch2 ;
								src += spitch2 ;
							}while( --SizeYWord ) ;
						}
						break ;

					case DX_FONTTYPE_NORMAL :
						{
							WORD wtemp ;
							WORD dat ;

							if( SrcRect.left % 8 == 0 )
							{
								src = usecmanage->CacheMem ;
								src += ( SrcRect.left / 8 ) + SrcRect.top * spitch ;
								spitch2 = spitch - ( ( SizeX / 16 ) * 2 + ( SizeX % 16 != 0 ? 2 : 0 ) ) ;
								dpitch2 = dpitch - ( ( ( SizeX >> 4 ) << 6 ) ) ;

								do{
									wtemp = SizeXWord ;
									do{
										dat = *( ( WORD * )src ) ;
										for(;;)
										{
											if( dat & 0x80 ) *( ( DWORD * )dest ) = cr ;
 											if( --wtemp == 0 ) break ;
											if( dat & 0x40 ) *( ( DWORD * )dest + 1 ) = cr ;
 											if( --wtemp == 0 ) break ;
											if( dat & 0x20 ) *( ( DWORD * )dest + 2 ) = cr ;
 											if( --wtemp == 0 ) break ;
											if( dat & 0x10 ) *( ( DWORD * )dest + 3 ) = cr ;
 											if( --wtemp == 0 ) break ;
											if( dat & 0x8 ) *( ( DWORD * )dest + 4 ) = cr ;
 											if( --wtemp == 0 ) break ;
											if( dat & 0x4 ) *( ( DWORD * )dest + 5 ) = cr ;
 											if( --wtemp == 0 ) break ;
											if( dat & 0x2 ) *( ( DWORD * )dest + 6 ) = cr ;
 											if( --wtemp == 0 ) break ;
											if( dat & 0x1 ) *( ( DWORD * )dest + 7 ) = cr ;
 											if( --wtemp == 0 ) break ;
											if( dat & 0x8000 ) *( ( DWORD * )dest + 8 ) = cr ;
 											if( --wtemp == 0 ) break ;
											if( dat & 0x4000 ) *( ( DWORD * )dest + 9 ) = cr ;
 											if( --wtemp == 0 ) break ;
											if( dat & 0x2000 ) *( ( DWORD * )dest + 10 ) = cr ;
 											if( --wtemp == 0 ) break ;
											if( dat & 0x1000 ) *( ( DWORD * )dest + 11 ) = cr ;
 											if( --wtemp == 0 ) break ;
											if( dat & 0x800 ) *( ( DWORD * )dest + 12 ) = cr ;
 											if( --wtemp == 0 ) break ;
											if( dat & 0x400 ) *( ( DWORD * )dest + 13 ) = cr ;
 											if( --wtemp == 0 ) break ;
											if( dat & 0x200 ) *( ( DWORD * )dest + 14 ) = cr ;
 											if( --wtemp == 0 ) break ;
											if( dat & 0x100 ) *( ( DWORD * )dest + 15 ) = cr ;
											dest += 64 ;
 											--wtemp ;
											break ;
										}

										src += 2 ;
									}while( wtemp );

									src += spitch2 ;
									dest += dpitch2 ;
								}while( --SizeYWord ) ;
							}
							else
							{
								int StX = SrcRect.left % 8 ;
								WORD Table[16] = { 0x80, 0x40, 0x20, 0x10, 0x8, 0x4, 0x2, 0x1, 0x8000, 0x4000, 0x2000, 0x1000, 0x800, 0x400, 0x200, 0x100 } ;

								src = usecmanage->CacheMem ;
								src += ( SrcRect.left / 8 ) + SrcRect.top * spitch ;
								spitch2 = spitch - ( ( SizeX / 8 ) + ( SizeX % 8 != 0 ? 1 : 0 ) ) ;
								dpitch2 = dpitch - ( ( ( SizeX >> 3 ) << 5 ) ) ;

								do{
									wtemp = SizeXWord ;
									do{
										dat = *( ( WORD * )src ) ;
										for(;;)
										{
											if( dat & Table[StX] ) *( ( DWORD * )dest ) = cr ;
 											if( --wtemp == 0 ) break ;
											if( dat & Table[StX+1] ) *( ( DWORD * )dest + 1 ) = cr ;
 											if( --wtemp == 0 ) break ;
											if( dat & Table[StX+2] ) *( ( DWORD * )dest + 2 ) = cr ;
 											if( --wtemp == 0 ) break ;
											if( dat & Table[StX+3] ) *( ( DWORD * )dest + 3 ) = cr ;
 											if( --wtemp == 0 ) break ;
											if( dat & Table[StX+4] ) *( ( DWORD * )dest + 4 ) = cr ;
 											if( --wtemp == 0 ) break ;
											if( dat & Table[StX+5] ) *( ( DWORD * )dest + 5 ) = cr ;
 											if( --wtemp == 0 ) break ;
											if( dat & Table[StX+6] ) *( ( DWORD * )dest + 6 ) = cr ;
 											if( --wtemp == 0 ) break ;
											if( dat & Table[StX+7] ) *( ( DWORD * )dest + 7 ) = cr ;
											dest += 32 ;
 											--wtemp ;
											break ;
										}

										src += 1 ;
									}while( wtemp );

									src += spitch2 ;
									dest += dpitch2 ;
								}while( --SizeYWord ) ;
							}
						}
						break ;

					case DX_FONTTYPE_EDGE :
						{
							WORD wtemp ;
							DWORD ecrD ;
							BYTE dat ;

							ecrD = ( DWORD )( EdgeColor & 0xffffff ) ;
							do
							{
								wtemp = SizeXWord ;
								do
								{
									dat = *src ;
									if( dat )
									{
										*( ( DWORD * )dest ) = ( dat & 2 ) ? cr : ecrD ;
									}
									dest += 4 ;
									src ++ ;
								}while( --wtemp ) ;

								dest += dpitch2 ;
								src += spitch2 ;
							}while( --SizeYWord ) ;
						}
						break ;
					}
				}
				break ;
			}
		}

LOOPEND :

		// ���s�����̏ꍇ�͏����𕪊�
		if( *strp == '\n' )
		{
			int LineSpace = usecmanage->LineSpaceValidFlag ? usecmanage->LineSpace : usecmanage->BaseInfo.FontHeight - usecmanage->BaseInfo.FontAddHeight ;

			if( VerticalFlag == TRUE )
			{
				x           -= LineSpace ;
				TotalWidth  += LineSpace ;
				y           = orig_y ;
				TotalHeight = 0 ;
			}
			else
			{
				y           += LineSpace ;
				TotalHeight += LineSpace ;
				x          = orig_x ;
				TotalWidth = 0 ;
			}
		}
		else
		{
			if( cache == NULL )
			{
				if( VerticalFlag )
				{
					TotalHeight += usecmanage->Space ;
					y           += usecmanage->Space ;
				}
				else
				{
					TotalWidth  += usecmanage->Space ;
					x           += usecmanage->Space ;
				}
			}
			else
			{
				if( VerticalFlag )
				{
					TotalHeight += cache->AddX + usecmanage->Space ;
					if( TotalWidth < cache->DrawX + cache->SizeX )
					{
						TotalWidth = cache->DrawX + cache->SizeX ;
					}
					y += cache->AddX + usecmanage->Space ;
				}
				else
				{
					TotalWidth += cache->AddX + usecmanage->Space ;
					if( TotalHeight < cache->DrawY + cache->SizeY )
					{
						TotalHeight = cache->DrawY + cache->SizeY ;
					}
					x += cache->AddX + usecmanage->Space ;
				}
			}
		}

		// �J�[�j���O����
		if( usecmanage->BaseInfo.KerningPairNum > 0 && i < drawnum - 1 )
		{
			DWORD di, dj ;
			if( cache != NULL )
			{
				for( di = 0 ; di < cache->KerningPairNum ; di ++ )
				{
					if( cache->KerningPair[ di ].Second == strp[ 1 ] )
					{
						if( VerticalFlag )
						{
							TotalHeight += cache->KerningPair[ di ].KernAmount ;
							y           += cache->KerningPair[ di ].KernAmount ;
						}
						else
						{
							TotalWidth  += cache->KerningPair[ di ].KernAmount ;
							x           += cache->KerningPair[ di ].KernAmount ;
						}
						break ;
					}
				}
			}
			else
			{
				for( di = 0 ; di < usecmanage->BaseInfo.KerningPairNum && usecmanage->KerningPairData[ di ].First != strp[ 0 ] ; di ++ ){}
				if( di != usecmanage->BaseInfo.KerningPairNum )
				{
					for( dj = 0 ; di + dj < usecmanage->BaseInfo.KerningPairNum && usecmanage->KerningPairData[ di + dj ].First == strp[ 0 ] ; dj ++ )
					{
						if( usecmanage->KerningPairData[ di + dj ].Second == strp[ 1 ] )
						{
							if( VerticalFlag )
							{
								TotalHeight += usecmanage->KerningPairData[ di + dj ].KernAmount ;
								y           += usecmanage->KerningPairData[ di + dj ].KernAmount ;
							}
							else
							{
								TotalWidth  += usecmanage->KerningPairData[ di + dj ].KernAmount ;
								x           += usecmanage->KerningPairData[ di + dj ].KernAmount ;
							}
							break ;
						}
					}
				}
			}
		}

		if( MaxTotalWidth < TotalWidth )
		{
			MaxTotalWidth = TotalWidth ;
		}
		if( MaxTotalHeight < TotalHeight )
		{
			MaxTotalHeight = TotalHeight ;
		}
	}

	if( DrawSizeP != NULL )
	{
		DrawSizeP->cx = MaxTotalWidth ;
		DrawSizeP->cy = MaxTotalHeight ;
	}

	if( UseAlloc )
	{
		DXFREE( AllocDrawStrBuf ) ;
	}

	// �I��
	return VerticalFlag ? TotalHeight : TotalWidth ;
}

// ��{�C���[�W�ɕ�����C���[�W��]������
extern int NS_FontBaseImageBlt( int x, int y, const TCHAR *StrData, BASEIMAGE *DestImage, BASEIMAGE *DestEdgeImage, int VerticalFlag )
{
	return NS_FontBaseImageBltToHandle( x, y, StrData, DestImage, DestEdgeImage, DX_DEFAULT_FONT_HANDLE, VerticalFlag ) ;
}

// ��{�C���[�W�ɕ������`�悷��( �f�t�H���g�t�H���g�n���h�����g�p���� )
extern int NS_FontBaseImageBltWithStrLen( int x, int y, const TCHAR *StrData, size_t StrDataLength, BASEIMAGE *DestImage, BASEIMAGE *DestEdgeImage, int VerticalFlag )
{
	int Result ;
	TCHAR_STRING_WITH_STRLEN_TO_TCHAR_STRING_ONE_BEGIN( StrData, StrDataLength, return -1 )
	Result = NS_FontBaseImageBltToHandle( x, y, StrData, DestImage, DestEdgeImage, DX_DEFAULT_FONT_HANDLE, VerticalFlag ) ;
	TCHAR_STRING_WITH_STRLEN_TO_TCHAR_STRING_END( StrData )
	return Result ;
}

// ��{�C���[�W�ɕ�����C���[�W��]������
extern int FontBaseImageBlt_WCHAR_T( int x, int y, const wchar_t *StrData, int StrLen, BASEIMAGE *DestImage, BASEIMAGE *DestEdgeImage, int VerticalFlag )
{
	return FontBaseImageBltToHandle_WCHAR_T( x, y, StrData, StrLen, DestImage, DestEdgeImage, DX_DEFAULT_FONT_HANDLE, VerticalFlag ) ;
}

// ��{�C���[�W�ɕ������]������
extern int NS_FontBaseImageBltToHandle( int x, int y, const TCHAR *StrData, BASEIMAGE *DestImage, BASEIMAGE *DestEdgeImage, int FontHandle, int VerticalFlag )
{
#ifdef UNICODE
	return FontBaseImageBltToHandle_WCHAR_T( x, y, StrData, -1, DestImage, DestEdgeImage, FontHandle, VerticalFlag ) ;
#else
	int Result ;

	FONTHANDLE_TCHAR_TO_WCHAR_T_STRING_BEGIN( StrData, -1 )

	Result = FontBaseImageBltToHandle_WCHAR_T( x, y, UseStringBuffer, -1, DestImage, DestEdgeImage, FontHandle, VerticalFlag ) ;

	FONTHANDLE_TCHAR_TO_WCHAR_T_STRING_END

	return Result ;
#endif
}

// ��{�C���[�W�ɕ������`�悷��
extern int NS_FontBaseImageBltToHandleWithStrLen( int x, int y, const TCHAR *StrData, size_t StrDataLength, BASEIMAGE *DestImage, BASEIMAGE *DestEdgeImage, int FontHandle, int VerticalFlag )
{
	int Result ;
#ifdef UNICODE
	FONTHANDLE_WCHAR_T_WITH_STRLENGTH_TO_WCHAR_T_STRING_BEGIN( StrData, StrDataLength, -1 )
	Result = FontBaseImageBltToHandle_WCHAR_T( x, y, UseStringBuffer, ( int )StrDataLength, DestImage, DestEdgeImage, FontHandle, VerticalFlag ) ;
	FONTHANDLE_WCHAR_T_TO_WCHAR_T_STRING_END
#else
	FONTHANDLE_TCHAR_WITH_STRLENGTH_TO_WCHAR_T_STRING_BEGIN( StrData, StrDataLength, -1 )
	Result = FontBaseImageBltToHandle_WCHAR_T( x, y, UseStringBuffer, ( int )wchar_StrLength, DestImage, DestEdgeImage, FontHandle, VerticalFlag ) ;
	FONTHANDLE_TCHAR_TO_WCHAR_T_STRING_END
#endif
	return Result ;
}

// ��{�C���[�W�ɕ������]������
extern int FontBaseImageBltToHandle_WCHAR_T( int x, int y, const wchar_t *StrData, int StrLen, BASEIMAGE *DestImage, BASEIMAGE *DestEdgeImage, int FontHandle, int VerticalFlag )
{
	static DWORD DrawStrBuf[ 2048 ] ;		// �`�悷��ۂɎg�p���镶����f�[�^�i�R�o�C�g�łP������\���j
	static DWORD DrawIVSBuf[ 2048 ] ;		// �`�悷��ۂɎg�p���镶����f�[�^�i�R�o�C�g�łP������\���j
	FONTMANAGE * cmanage ;
	FONTMANAGE * usecmanage ;
	FONTCHARDATA * cache ;
	RECT SrcRect ;
	RECT BaseRect ;
	RECT DstRect ;
	POINT DstPoint ;
	int drawnum ;							// �Q�o�C�g�����P�o�C�g�����S���Ђ�����߂ĉ��������邩�ۑ�����ϐ�
	int i ;									// �J��Ԃ��Ɣėp�ϐ�
	const DWORD *strp ;
	const DWORD *ivsp ;
	int TotalWidth, TotalHeight ;
	int MaxTotalWidth, MaxTotalHeight ;
	int orig_x, orig_y ;
	int tmp_x, tmp_y ;
	int off_x, off_y ;
	int add_x = 0, add_y = 0 ;
	int	UseAlloc = FALSE ;
	DWORD *AllocDrawStrBuf = NULL ;
	DWORD *UseDrawStrBuf ;
	DWORD *UseDrawIVSBuf ;

	DEFAULT_FONT_HANDLE_SETUP

	// �G���[����
	if( FONTHCHK( FontHandle, cmanage ) )
	{
		return -1 ;
	}

	// ���p�摜���L���ŁA���{�̗p�摜�ƃT�C�Y��������ꍇ�̓G���[
	if( DestEdgeImage != NULL && ( DestEdgeImage->Width != DestImage->Width || DestEdgeImage->Height != DestImage->Height ) )
	{
		return -1 ;
	}

	// �e�N�X�`�����L���b�V���Ɏg�p���Ă��Ȃ��t�H���g�͖���
	if( cmanage->TextureCacheFlag == FALSE )
	{
		return -1 ;
	}

	// �����񂪂Ȃ��ꍇ�͏I��
	if( StrData  == NULL || *StrData  == 0 )
	{
		return 0 ;
	}

	// �`�悷�镶����̒�����ۑ�
	{
		if( StrLen < 0 )
		{
			StrLen = ( int )_WCSLEN( StrData ) ;
		}

		if( StrLen > 1023 )
		{
			UseAlloc = TRUE ;
			AllocDrawStrBuf = ( DWORD * )DXALLOC( ( StrLen * 2 ) * sizeof( DWORD ) ) ;
			if( AllocDrawStrBuf == NULL )
			{
				return -1 ;
			}
			UseDrawStrBuf = AllocDrawStrBuf ;
			UseDrawIVSBuf = UseDrawStrBuf + StrLen ;
		}
		else
		{
			UseDrawStrBuf = DrawStrBuf ;
			UseDrawIVSBuf = DrawIVSBuf ;
		}
	}

	// �L���b�V���ɓ����Ă��Ȃ���������L���b�V���ɓ����
	FontCacheStringAddToHandle( cmanage, StrData, StrLen, UseDrawStrBuf, UseDrawIVSBuf, &drawnum ) ;

	// �`����W�̕␳
	if( VerticalFlag )
	{
		add_x = -cmanage->BaseInfo.FontAddHeight / 2 ;
	}
	else
	{
		add_y = -cmanage->BaseInfo.FontAddHeight / 2 ;
	}

	// �������W��ۑ����Ă���
	orig_x = x ;
	orig_y = y ;

	// �����̐������J��Ԃ�
	strp			= UseDrawStrBuf ;			// �`��p�����f�[�^�̐擪�A�h���X���Z�b�g
	ivsp			= UseDrawIVSBuf ;
	TotalWidth		= 0 ;
	TotalHeight		= 0 ;
	MaxTotalWidth	= 0 ;
	MaxTotalHeight	= 0 ;
	for( i = 0 ; i < drawnum ; i ++, strp ++ )
	{
		cache = NULL ;
		usecmanage = cmanage ;

		// \n �����t���O�������Ă��Ċ��� \n �������ꍇ�͊��S��������
		if( *strp == L'\n' && FSYS.IgnoreLFFlag )
		{
			continue ;
		}

		// ���s�����������ꍇ�̓L�����Z������
		if( *strp == L'\n' )
		{
			goto LOOPEND ;
		}

		// �L���b�V���f�[�^���擾
		cache = GetFontCacheChar_Inline( cmanage, *strp, *ivsp, &usecmanage, &off_x, &off_y, FALSE, FALSE ) ;
		if( cache == NULL )
		{
			return -1 ;
		}

		// �`����W�̏���
		if( cmanage == usecmanage )
		{
			tmp_x = x + add_x ;
			tmp_y = y + add_y ;
		}
		else
		{
			tmp_x = x ;
			tmp_y = y ;
			if( VerticalFlag )
			{
				tmp_x += off_y ;
				tmp_y += off_x ;
			}
			else
			{
				tmp_x += off_x ;
				tmp_y += off_y ;
			}

			if( usecmanage->BaseInfo.FontAddHeight != 0 )
			{
				if( VerticalFlag )
				{
					tmp_x -= usecmanage->BaseInfo.FontAddHeight / 2 ;
				}
				else
				{
					tmp_y -= usecmanage->BaseInfo.FontAddHeight / 2 ;
				}
			}
		}

		// �X�y�[�X�����������ꍇ�̓L�����Z������
		if( *strp == L' ' || ( wchar_t )*strp == FSYS.DoubleByteSpaceCharCode )
		{
			goto LOOPEND ;
		}

		// �T�C�Y�����������牽�����Ȃ�
		if( cache->SizeX == 0 && cache->SizeY == 0 )
		{
			goto LOOPEND ;
		}

		// �]����̕`��̈���쐬
		DstRect.left	= tmp_x + cache->DrawX ;
		DstRect.top		= tmp_y + cache->DrawY ;
		DstRect.right	= tmp_x + cache->DrawX + cache->SizeX ;
		DstRect.bottom	= tmp_y + cache->DrawY + cache->SizeY ;
		BaseRect.left = 0 ;
		BaseRect.top = 0 ;
		BaseRect.right = DestImage->Width ;
		BaseRect.bottom = DestImage->Height ;
		RectClipping_Inline( &DstRect, &BaseRect ) ;

		// �`�悷�镶�������������ꍇ�����Ŏ����[�v�Ɉڂ�
		if( DstRect.right == DstRect.left || DstRect.bottom == DstRect.top ) goto LOOPEND ;

		// �]�����̋�`���Z�b�g
		SrcRect.left	=   cache->GraphIndex / usecmanage->LengthCharNum   * usecmanage->BaseInfo.MaxWidth ;
		SrcRect.top		= ( cache->GraphIndex % usecmanage->LengthCharNum ) * usecmanage->BaseInfo.MaxWidth ;
		if( usecmanage->TextureCacheFlag == TRUE )
		{
			SrcRect.left ++ ;
			SrcRect.top  ++ ;
		}
		SrcRect.right	= SrcRect.left + cache->SizeX ;
		SrcRect.bottom	= SrcRect.top  + cache->SizeY ;

		// �]�����̋�`��␳
		SrcRect.left   += DstRect.left - ( tmp_x + cache->DrawX ) ;
		SrcRect.top    += DstRect.top  - ( tmp_y + cache->DrawY ) ;
		SrcRect.right  -= ( ( tmp_x + cache->DrawX ) + cache->SizeX ) - DstRect.right ;
		SrcRect.bottom -= ( ( tmp_y + cache->DrawY ) + cache->SizeY ) - DstRect.bottom ;

		// �]��
		DstPoint.x = DstRect.left ;
		DstPoint.y = DstRect.top ;
		NS_GraphColorMatchBltVer2(
			DestImage->GraphData, DestImage->Pitch, &DestImage->ColorData,
			usecmanage->TextureCacheBaseImage.GraphData, usecmanage->TextureCacheBaseImage.Pitch, &usecmanage->TextureCacheBaseImage.ColorData,
			NULL, 0, NULL,
			DstPoint, &SrcRect, FALSE,
			FALSE, 0,
			BASEIM.ImageShavedMode, FALSE,
			FALSE, FALSE,
			FALSE ) ;
		if( DestEdgeImage && ( usecmanage->FontType & DX_FONTTYPE_EDGE ) != 0 )
		{
			SrcRect.left  += usecmanage->TextureCacheBaseImage.Width / 2 ;
			SrcRect.right += usecmanage->TextureCacheBaseImage.Width / 2 ;
			NS_GraphColorMatchBltVer2(
				DestEdgeImage->GraphData, DestEdgeImage->Pitch, &DestEdgeImage->ColorData,
				usecmanage->TextureCacheBaseImage.GraphData, usecmanage->TextureCacheBaseImage.Pitch, &usecmanage->TextureCacheBaseImage.ColorData,
				NULL, 0, NULL,
				DstPoint, &SrcRect, FALSE,
				FALSE, 0,
				BASEIM.ImageShavedMode, FALSE,
				FALSE, FALSE,
				FALSE ) ;
		}

LOOPEND :

		// ���s�����̏ꍇ�͏����𕪊�
		if( *strp == '\n' )
		{
			int LineSpace = usecmanage->LineSpaceValidFlag ? usecmanage->LineSpace : usecmanage->BaseInfo.FontHeight - usecmanage->BaseInfo.FontAddHeight ;

			if( VerticalFlag == TRUE )
			{
				x           -= LineSpace ;
				TotalWidth  += LineSpace ;
				y           = orig_y ;
				TotalHeight = 0 ;
			}
			else
			{
				y           += LineSpace ;
				TotalHeight += LineSpace ;
				x          = orig_x ;
				TotalWidth = 0 ;
			}
		}
		else
		{
			if( cache == NULL )
			{
				if( VerticalFlag )
				{
					TotalHeight += usecmanage->Space ;
					y           += usecmanage->Space ;
				}
				else
				{
					TotalWidth  += usecmanage->Space ;
					x           += usecmanage->Space ;
				}
			}
			else
			{
				if( VerticalFlag )
				{
					TotalHeight += cache->AddX + usecmanage->Space ;
					if( TotalWidth < cache->DrawX + cache->SizeX )
					{
						TotalWidth = cache->DrawX + cache->SizeX ;
					}
					y += cache->AddX + usecmanage->Space ;
				}
				else
				{
					TotalWidth += cache->AddX + usecmanage->Space ;
					if( TotalHeight < cache->DrawY + cache->SizeY )
					{
						TotalHeight = cache->DrawY + cache->SizeY ;
					}
					x += cache->AddX + usecmanage->Space ;
				}
			}
		}

		// �J�[�j���O����
		if( usecmanage->BaseInfo.KerningPairNum > 0 && i < drawnum - 1 )
		{
			DWORD di, dj ;
			if( cache != NULL )
			{
				for( di = 0 ; di < cache->KerningPairNum ; di ++ )
				{
					if( cache->KerningPair[ di ].Second == strp[ 1 ] )
					{
						if( VerticalFlag )
						{
							TotalHeight += cache->KerningPair[ di ].KernAmount ;
							y           += cache->KerningPair[ di ].KernAmount ;
						}
						else
						{
							TotalWidth  += cache->KerningPair[ di ].KernAmount ;
							x           += cache->KerningPair[ di ].KernAmount ;
						}
						break ;
					}
				}
			}
			else
			{
				for( di = 0 ; di < usecmanage->BaseInfo.KerningPairNum && usecmanage->KerningPairData[ di ].First != strp[ 0 ] ; di ++ ){}
				if( di != usecmanage->BaseInfo.KerningPairNum )
				{
					for( dj = 0 ; di + dj < usecmanage->BaseInfo.KerningPairNum && usecmanage->KerningPairData[ di + dj ].First == strp[ 0 ] ; dj ++ )
					{
						if( usecmanage->KerningPairData[ di + dj ].Second == strp[ 1 ] )
						{
							if( VerticalFlag )
							{
								TotalHeight += usecmanage->KerningPairData[ di + dj ].KernAmount ;
								y           += usecmanage->KerningPairData[ di + dj ].KernAmount ;
							}
							else
							{
								TotalWidth  += usecmanage->KerningPairData[ di + dj ].KernAmount ;
								x           += usecmanage->KerningPairData[ di + dj ].KernAmount ;
							}
							break ;
						}
					}
				}
			}
		}

		if( MaxTotalWidth < TotalWidth )
		{
			MaxTotalWidth = TotalWidth ;
		}
		if( MaxTotalHeight < TotalHeight )
		{
			MaxTotalHeight = TotalHeight ;
		}
	}

	if( UseAlloc )
	{
		DXFREE( AllocDrawStrBuf ) ;
	}

	// �I��
	return 0 ;
}

// �t�H���g�n���h���̃t�H���g�����擾����
extern const TCHAR *NS_GetFontNameToHandle( int FontHandle )
{
	FONTMANAGE * ManageData ;

	DEFAULT_FONT_HANDLE_SETUP

	// �G���[����
	if( FONTHCHK( FontHandle, ManageData ) )
		return NULL ;

	return ManageData->FontNameT ;
}

// �f�t�H���g�t�H���g�n���h���̃L���b�V���ł��镶���̐����擾����
extern int NS_GetFontMaxCacheCharNum( void )
{
	return NS_GetFontMaxCacheCharNumToHandle( DX_DEFAULT_FONT_HANDLE ) ;
}

// �t�H���g�n���h���̃L���b�V���ł��镶���̐����擾����
extern int NS_GetFontMaxCacheCharNumToHandle( int FontHandle )
{
	FONTMANAGE * ManageData ;

	DEFAULT_FONT_HANDLE_SETUP

	// �G���[����
	if( FONTHCHK( FontHandle, ManageData ) )
		return -1 ;

	return ManageData->MaxCacheCharNum ;
}

// �����̍ő啝�𓾂�
extern int NS_GetFontMaxWidth( void )
{
	return NS_GetFontMaxWidthToHandle( DX_DEFAULT_FONT_HANDLE ) ;
}

// �����̍ő啝�𓾂�
extern int NS_GetFontMaxWidthToHandle( int FontHandle )
{
	FONTMANAGE * ManageData ;

	DEFAULT_FONT_HANDLE_SETUP

	// �G���[����
	if( FONTHCHK( FontHandle, ManageData ) )
		return -1 ;

	return ManageData->BaseInfo.MaxWidth ;
}

// �f�t�H���g�t�H���g�n���h���̕`��ʒu����x�[�X���C���܂ł̍������擾����
extern int NS_GetFontAscent( void )
{
	return NS_GetFontAscentToHandle( DX_DEFAULT_FONT_HANDLE ) ;
}

// �t�H���g�n���h���̕`��ʒu����x�[�X���C���܂ł̍������擾����
extern int NS_GetFontAscentToHandle( int FontHandle )
{
	FONTMANAGE * ManageData ;

	DEFAULT_FONT_HANDLE_SETUP

	// �G���[����
	if( FONTHCHK( FontHandle, ManageData ) )
		return -1 ;

	return ManageData->BaseInfo.Ascent ;
}

// �w��̕����̕`������擾����
extern int NS_GetFontCharInfo( int FontHandle, const TCHAR *Char, int *DrawX, int *DrawY, int *NextCharX, int *SizeX, int *SizeY )
{
#ifdef UNICODE
	return GetFontCharInfo_WCHAR_T( FontHandle, Char, DrawX, DrawY, NextCharX, SizeX, SizeY ) ;
#else
	int Result ;
	FONTHANDLE_TCHAR_TO_WCHAR_T_STRING_BEGIN( Char, -1 )

	Result = GetFontCharInfo_WCHAR_T( FontHandle, UseStringBuffer, DrawX, DrawY, NextCharX, SizeX, SizeY ) ;

	FONTHANDLE_TCHAR_TO_WCHAR_T_STRING_END

	return Result ;
#endif
}

// �t�H���g�n���h���̎w��̕����̕`������擾����
extern int NS_GetFontCharInfoWithStrLen( int FontHandle, const TCHAR *Char, size_t CharLength, int *DrawX, int *DrawY, int *NextCharX, int *SizeX, int *SizeY )
{
	int Result ;
#ifdef UNICODE
	FONTHANDLE_WCHAR_T_WITH_STRLENGTH_TO_WCHAR_T_STRING_BEGIN( Char, CharLength, -1 )
	Result = GetFontCharInfo_WCHAR_T( FontHandle, UseStringBuffer, DrawX, DrawY, NextCharX, SizeX, SizeY ) ;
	FONTHANDLE_WCHAR_T_TO_WCHAR_T_STRING_END
#else
	FONTHANDLE_TCHAR_WITH_STRLENGTH_TO_WCHAR_T_STRING_BEGIN( Char, CharLength, -1 )
	Result = GetFontCharInfo_WCHAR_T( FontHandle, UseStringBuffer, DrawX, DrawY, NextCharX, SizeX, SizeY ) ;
	FONTHANDLE_TCHAR_TO_WCHAR_T_STRING_END
#endif
	return Result ;
}

// �w��̕����̕`������擾����
extern int GetFontCharInfo_WCHAR_T( int FontHandle, const wchar_t *Char, int *DrawX, int *DrawY, int *NextCharX, int *SizeX, int *SizeY )
{
	FONTMANAGE * ManageData ;
	FONTMANAGE * UseManageData ;
	FONTCHARDATA * CharData ;
	DWORD CharCode ;
	DWORD IVSCode ;
	int DrawOffsetX, DrawOffsetY ;
	int CharBytes ;

	DEFAULT_FONT_HANDLE_SETUP

	// �G���[����
	if( FONTHCHK( FontHandle, ManageData ) )
	{
		return -1 ;
	}

	// �����R�[�h���擾
	CharCode = GetCharCode( ( const char * )Char, WCHAR_T_CHARCODEFORMAT, &CharBytes ) ;

	// IVS�R�[�h���擾
	IVSCode = GetCharCode( ( const char * )Char + CharBytes, WCHAR_T_CHARCODEFORMAT, &CharBytes ) ;
	if( IVSCode < 0xe0100 || IVSCode > 0xe01ef )
	{
		IVSCode = 0 ;
	}

	// �t�H���g�f�[�^���擾
	CharData = GetFontCacheChar_Inline( ManageData, CharCode, IVSCode, &UseManageData, &DrawOffsetX, &DrawOffsetY, FALSE, FALSE ) ;
	if( CharData == NULL )
	{
		// �L���b�V���ɒǉ��ł��Ȃ�������G���[
		return -1 ;
	}

	// �t�H���g�f�[�^��Ԃ�
	if( DrawX     ) *DrawX     = CharData->DrawX ;
	if( DrawY     ) *DrawY     = CharData->DrawY ;
	if( NextCharX ) *NextCharX = CharData->AddX  ;
	if( SizeX     ) *SizeX     = CharData->SizeX ;
	if( SizeY     ) *SizeY     = CharData->SizeY ;

	if( DrawY != NULL && ManageData->BaseInfo.FontAddHeight != 0 )
	{
		*DrawY -= ManageData->BaseInfo.FontAddHeight / 2 ;
	}

	// ����I��
	return 0 ;
}

// ������̕��𓾂�
extern int NS_GetDrawStringWidth( const TCHAR *String, int StrLen, int VerticalFlag )
{
	return NS_GetDrawStringWidthToHandle( String, StrLen, DX_DEFAULT_FONT_HANDLE, VerticalFlag ) ;
}

// ������̕��𓾂�
extern int NS_GetDrawNStringWidth( const TCHAR *String, size_t StringLength, int VerticalFlag )
{
	return NS_GetDrawNStringWidthToHandle( String, StringLength, DX_DEFAULT_FONT_HANDLE, VerticalFlag ) ;
}

// ������̕��𓾂�
extern int GetDrawStringWidth_WCHAR_T( const wchar_t *String ,int StrLen, int VerticalFlag )
{
	return GetDrawStringWidthToHandle_WCHAR_T( String, 0, StrLen, DX_DEFAULT_FONT_HANDLE, VerticalFlag ) ;
}

// �����t��������̕`�敝�𓾂�
extern int NS_GetDrawFormatStringWidth( const TCHAR *FormatString, ... )
{
	int FontHandle = DX_DEFAULT_FONT_HANDLE ;

	TCHAR_FONTHANDLE_FORMATSTRING_SETUP( -1 )

	// ������̕��𓾂�
	return NS_GetDrawStringWidthToHandle(
				String, ( int )CL_strlen( CharCodeFormat, ( const char * )String ), FontHandle, FALSE ) ;
}

// �����t��������̕`�敝�𓾂�
extern int GetDrawFormatStringWidth_WCHAR_T( const wchar_t *FormatString, ... )
{
	WCHAR_T_FORMATSTRING_SETUP

	// ������̕��𓾂�
	return GetDrawStringWidthToHandle_WCHAR_T( String, 0, ( int )_WCSLEN( String ), DX_DEFAULT_FONT_HANDLE, FALSE ) ;
}


// �����t��������̕`�敝�𓾂�
extern int NS_GetDrawFormatStringWidthToHandle( int FontHandle, const TCHAR *FormatString, ... )
{
	TCHAR_FONTHANDLE_FORMATSTRING_SETUP( -1 )

	// ������̕��𓾂�
	return NS_GetDrawStringWidthToHandle(
				String, ( int )CL_strlen( CharCodeFormat, ( const char * )String ), FontHandle, FALSE ) ;
}

// �����t��������̕`�敝�𓾂�
extern int GetDrawFormatStringWidthToHandle_WCHAR_T( int FontHandle, const wchar_t *FormatString, ... )
{
	WCHAR_T_FORMATSTRING_SETUP

	// ������̕��𓾂�
	return GetDrawStringWidthToHandle_WCHAR_T( String, 0, ( int )_WCSLEN( String ), FontHandle, FALSE ) ;
}

// ������̕��𓾂�
extern int NS_GetDrawStringWidthToHandle( const TCHAR *String, int StrLen, int FontHandle, int VerticalFlag )
{
#ifdef UNICODE
	return GetDrawStringWidthToHandle_WCHAR_T( String, 0, StrLen, FontHandle, VerticalFlag ) ;
#else
	int Result ;

	FONTHANDLE_TCHAR_WITH_STRLEN_TO_WCHAR_T_STRING_BEGIN( String, StrLen, -1 )

	Result = GetDrawStringWidthToHandle_WCHAR_T( UseStringBuffer, 0, StrLen, FontHandle, VerticalFlag ) ;

	FONTHANDLE_TCHAR_WITH_STRLEN_TO_WCHAR_T_STRING_END

	return Result ;
#endif
}

// ������̕��𓾂�
extern int NS_GetDrawNStringWidthToHandle( const TCHAR *String, size_t StringLength, int FontHandle, int VerticalFlag )
{
#ifdef UNICODE
	return GetDrawStringWidthToHandle_WCHAR_T( String, StringLength, ( int )StringLength, FontHandle, VerticalFlag ) ;
#else
	int Result ;

	FONTHANDLE_TCHAR_WITH_STRLENGTH_TO_WCHAR_T_STRING_BEGIN( String, StringLength, -1 )

	Result = GetDrawStringWidthToHandle_WCHAR_T( UseStringBuffer, wchar_StrLength, ( int )wchar_StrLength, FontHandle, VerticalFlag ) ;

	FONTHANDLE_TCHAR_TO_WCHAR_T_STRING_END

	return Result ;
#endif
}

// ������̕��𓾂�
extern int GetDrawStringWidthToHandle_WCHAR_T( const wchar_t *String, size_t StringLength, int StrLen, int FontHandle, int VerticalFlag )
{
	FONTMANAGE *ManageData ;

	ManageData = GetFontManageDataToHandle_Inline( FontHandle ) ;
	if( ManageData == NULL )
	{
		return -1 ;
	}

	if( StringLength > 0 )
	{
		StrLen = ( int )StringLength ;
	}
	else
	{
		int Length ;
		Length = ( int )_WCSLEN( String ) ;
		if( StrLen < 0 || StrLen > Length )
		{
			StrLen = Length ;
		}
	}

	return FontCacheStringDrawToHandleST(
				FALSE,
				0,
				0,
				0.0f,
				0.0f,
				TRUE,
				FALSE,
				1.0,
				1.0,
				FALSE, 0.0f, 0.0f, 0.0,
				String,
				0,
				NULL,
				NULL,
				FALSE,
				ManageData,
				0,
				StrLen,
				VerticalFlag,
				NULL,
				NULL,
				NULL,
				0,
				NULL, 0,
				0
			) ;
}



// ������̕��𓾂�
extern int NS_GetDrawExtendStringWidth( double ExRateX, const TCHAR *String ,int StrLen, int VerticalFlag )
{
	return NS_GetDrawExtendStringWidthToHandle( ExRateX, String, StrLen, DX_DEFAULT_FONT_HANDLE, VerticalFlag ) ;
}

// ������̕��𓾂�
extern int NS_GetDrawExtendNStringWidth( double ExRateX, const TCHAR *String, size_t StringLength, int VerticalFlag )
{
	return NS_GetDrawExtendNStringWidthToHandle( ExRateX, String, StringLength, DX_DEFAULT_FONT_HANDLE, VerticalFlag ) ;
}

// ������̕��𓾂�
extern int GetDrawExtendStringWidth_WCHAR_T( double ExRateX, const wchar_t *String ,int StrLen, int VerticalFlag )
{
	return GetDrawExtendStringWidthToHandle_WCHAR_T( ExRateX, String, 0, StrLen, DX_DEFAULT_FONT_HANDLE, VerticalFlag ) ;
}


// �����t��������̕`�敝�𓾂�
extern int NS_GetDrawExtendFormatStringWidth( double ExRateX, const TCHAR *FormatString, ... )
{
	int FontHandle = DX_DEFAULT_FONT_HANDLE ;

	TCHAR_FONTHANDLE_FORMATSTRING_SETUP( -1 )

	// ������̕��𓾂�
	return NS_GetDrawExtendStringWidthToHandle(
		ExRateX, String, ( int )CL_strlen( CharCodeFormat,  ( const char * )String ), DX_DEFAULT_FONT_HANDLE, FALSE ) ;
}

// �����t��������̕`�敝�𓾂�
extern int GetDrawExtendFormatStringWidth_WCHAR_T( double ExRateX, const wchar_t *FormatString, ... )
{
	WCHAR_T_FORMATSTRING_SETUP

	// ������̕��𓾂�
	return GetDrawExtendStringWidthToHandle_WCHAR_T( ExRateX, String, 0, ( int )_WCSLEN( String ), DX_DEFAULT_FONT_HANDLE, FALSE ) ;
}



// �����t��������̕`�敝�𓾂�
extern int NS_GetDrawExtendFormatStringWidthToHandle( double ExRateX, int FontHandle, const TCHAR *FormatString, ... )
{
	TCHAR_FONTHANDLE_FORMATSTRING_SETUP( -1 )

	// ������̕��𓾂�
	return NS_GetDrawExtendStringWidthToHandle(
				ExRateX, String, ( int )CL_strlen( CharCodeFormat, ( const char * )String ), FontHandle, FALSE ) ;
}

// �����t��������̕`�敝�𓾂�
extern int GetDrawExtendFormatStringWidthToHandle_WCHAR_T( double ExRateX, int FontHandle, const wchar_t *FormatString, ... )
{
	WCHAR_T_FORMATSTRING_SETUP

	// ������̕��𓾂�
	return GetDrawExtendStringWidthToHandle_WCHAR_T( ExRateX, String, 0, ( int )_WCSLEN( String ), FontHandle, FALSE ) ;
}



// ������̕��𓾂�
extern int NS_GetDrawExtendStringWidthToHandle( double ExRateX, const TCHAR *String, int StrLen, int FontHandle, int VerticalFlag )
{
#ifdef UNICODE
	return GetDrawExtendStringWidthToHandle_WCHAR_T( ExRateX, String, 0, StrLen, FontHandle, VerticalFlag ) ;
#else
	int Result ;

	FONTHANDLE_TCHAR_WITH_STRLEN_TO_WCHAR_T_STRING_BEGIN( String, StrLen, -1 )

	Result = GetDrawExtendStringWidthToHandle_WCHAR_T( ExRateX, UseStringBuffer, 0, StrLen, FontHandle, VerticalFlag ) ;

	FONTHANDLE_TCHAR_WITH_STRLEN_TO_WCHAR_T_STRING_END

	return Result ;
#endif
}

// ������̕��𓾂�
extern int NS_GetDrawExtendNStringWidthToHandle( double ExRateX, const TCHAR *String, size_t StringLength, int FontHandle, int VerticalFlag )
{
#ifdef UNICODE
	return GetDrawExtendStringWidthToHandle_WCHAR_T( ExRateX, String, StringLength, ( int )StringLength, FontHandle, VerticalFlag ) ;
#else
	int Result ;

	FONTHANDLE_TCHAR_WITH_STRLENGTH_TO_WCHAR_T_STRING_BEGIN( String, StringLength, -1 )

	Result = GetDrawExtendStringWidthToHandle_WCHAR_T( ExRateX, UseStringBuffer, wchar_StrLength, ( int )wchar_StrLength, FontHandle, VerticalFlag ) ;

	FONTHANDLE_TCHAR_TO_WCHAR_T_STRING_END

	return Result ;
#endif
}

// ������̕��𓾂�
extern int GetDrawExtendStringWidthToHandle_WCHAR_T( double ExRateX, const wchar_t *String, size_t StringLength, int StrLen, int FontHandle, int VerticalFlag )
{
	FONTMANAGE *ManageData ;

	ManageData = GetFontManageDataToHandle_Inline( FontHandle ) ;
	if( ManageData == NULL )
	{
		return -1 ;
	}

	if( StringLength > 0 )
	{
		StrLen = ( int )StringLength ;
	}
	else
	{
		int Length ;
		Length = ( int )_WCSLEN( String ) ;
		if( StrLen < 0 || StrLen > Length )
		{
			StrLen = Length ;
		}
	}

	return FontCacheStringDrawToHandleST(
				FALSE,
				0,
				0,
				0.0f,
				0.0f,
				TRUE,
				TRUE,
				ExRateX,
				1.0,
				FALSE, 0.0f, 0.0f, 0.0,
				String,
				0,
				NULL,
				NULL,
				FALSE,
				ManageData,
				0,
				StrLen,
				VerticalFlag,
				NULL,
				NULL,
				NULL,
				0,
				NULL, 0,
				0
			) ;
}

// �f�t�H���g�t�H���g�n���h�����g�p����������̕`�敝�E�����E�s�����擾����
extern int NS_GetDrawStringSize( int *SizeX, int *SizeY, int *LineCount, const TCHAR *String, int StrLen, int VerticalFlag )
{
	return NS_GetDrawStringSizeToHandle( SizeX, SizeY, LineCount, String, StrLen, DX_DEFAULT_FONT_HANDLE, VerticalFlag ) ;
}

// �f�t�H���g�t�H���g�n���h�����g�p����������̕`�敝�E�����E�s�����擾����
extern int NS_GetDrawNStringSize( int *SizeX, int *SizeY, int *LineCount, const TCHAR *String, size_t StringLength, int VerticalFlag )
{
	return NS_GetDrawNStringSizeToHandle( SizeX, SizeY, LineCount, String, StringLength, DX_DEFAULT_FONT_HANDLE, VerticalFlag ) ;
}

// �f�t�H���g�t�H���g�n���h�����g�p���������t��������̕`�敝�E�����E�s�����擾����
extern int NS_GetDrawFormatStringSize( int *SizeX, int *SizeY, int *LineCount, const TCHAR *FormatString, ... )
{
	int FontHandle = DX_DEFAULT_FONT_HANDLE ;

	TCHAR_FONTHANDLE_FORMATSTRING_SETUP( -1 )

	// ������̕��𓾂�
	return NS_GetDrawStringSizeToHandle(
				SizeX, SizeY, LineCount, String, ( int )CL_strlen( CharCodeFormat, ( const char * )String ), FontHandle, FALSE ) ;
}

// �f�t�H���g�t�H���g�n���h�����g�p����������̕`�敝�E�����E�s�����擾����( �g�嗦�t�� )
extern int NS_GetDrawExtendStringSize( int *SizeX, int *SizeY, int *LineCount, double ExRateX, double ExRateY, const TCHAR *String, int StrLen, int VerticalFlag )
{
	return NS_GetDrawExtendStringSizeToHandle( SizeX, SizeY, LineCount, ExRateX, ExRateY, String, StrLen, DX_DEFAULT_FONT_HANDLE, VerticalFlag ) ;
}

// �f�t�H���g�t�H���g�n���h�����g�p����������̕`�敝�E�����E�s�����擾����( �g�嗦�t�� )
extern int NS_GetDrawExtendNStringSize( int *SizeX, int *SizeY, int *LineCount, double ExRateX, double ExRateY, const TCHAR *String, size_t StringLength, int VerticalFlag )
{
	return NS_GetDrawExtendNStringSizeToHandle( SizeX, SizeY, LineCount, ExRateX, ExRateY, String, StringLength, DX_DEFAULT_FONT_HANDLE, VerticalFlag ) ;
}

// �f�t�H���g�t�H���g�n���h�����g�p���������t��������̕`�敝�E�����E�s�����擾����( �g�嗦�t�� )
extern int NS_GetDrawExtendFormatStringSize( int *SizeX, int *SizeY, int *LineCount, double ExRateX, double ExRateY, const TCHAR *FormatString, ... )
{
	int FontHandle = DX_DEFAULT_FONT_HANDLE ;

	TCHAR_FONTHANDLE_FORMATSTRING_SETUP( -1 )

	// ������̕��𓾂�
	return NS_GetDrawExtendStringSizeToHandle(
		SizeX, SizeY, LineCount, ExRateX, ExRateY, String, ( int )CL_strlen( CharCodeFormat,  ( const char * )String ), DX_DEFAULT_FONT_HANDLE, FALSE ) ;
}

// �t�H���g�n���h�����g�p����������̕`�敝�E�����E�s�����擾����
extern int NS_GetDrawStringSizeToHandle( int *SizeX, int *SizeY, int *LineCount, const TCHAR   *String, int StrLen, int FontHandle, int VerticalFlag )
{
#ifdef UNICODE
	return GetDrawStringSizeToHandle_WCHAR_T( SizeX, SizeY, LineCount, String, 0, StrLen, FontHandle, VerticalFlag ) ;
#else
	int Result ;
	FONTHANDLE_TCHAR_WITH_STRLEN_TO_WCHAR_T_STRING_BEGIN( String, StrLen, -1 )

	Result = GetDrawStringSizeToHandle_WCHAR_T( SizeX, SizeY, LineCount, UseStringBuffer, 0, StrLen, FontHandle, VerticalFlag ) ;

	FONTHANDLE_TCHAR_WITH_STRLEN_TO_WCHAR_T_STRING_END

	return Result ;
#endif
}

// �t�H���g�n���h�����g�p����������̕`�敝�E�����E�s�����擾����
extern int NS_GetDrawNStringSizeToHandle( int *SizeX, int *SizeY, int *LineCount, const TCHAR *String, size_t StringLength, int FontHandle, int VerticalFlag )
{
#ifdef UNICODE
	return GetDrawStringSizeToHandle_WCHAR_T( SizeX, SizeY, LineCount, String, StringLength, ( int )StringLength, FontHandle, VerticalFlag ) ;
#else
	int Result ;
	FONTHANDLE_TCHAR_WITH_STRLENGTH_TO_WCHAR_T_STRING_BEGIN( String, StringLength, -1 )

	Result = GetDrawStringSizeToHandle_WCHAR_T( SizeX, SizeY, LineCount, UseStringBuffer, wchar_StrLength, ( int )wchar_StrLength, FontHandle, VerticalFlag ) ;

	FONTHANDLE_TCHAR_TO_WCHAR_T_STRING_END

	return Result ;
#endif
}

// ������̕��𓾂�
extern int GetDrawStringSizeToHandle_WCHAR_T( int *SizeX, int *SizeY, int *LineCount, const wchar_t *String, size_t StringLength, int StrLen, int FontHandle, int VerticalFlag )
{
	FONTMANAGE *ManageData ;
	SIZE DrawSize ;
	int Result ;

	ManageData = GetFontManageDataToHandle_Inline( FontHandle ) ;
	if( ManageData == NULL )
	{
		return -1 ;
	}

	if( StringLength > 0 )
	{
		StrLen = ( int )StringLength ;
	}
	else
	{
		int Length ;
		Length = ( int )_WCSLEN( String ) ;
		if( StrLen < 0 || StrLen > Length )
		{
			StrLen = Length ;
		}
	}

	Result = FontCacheStringDrawToHandleST(
				FALSE,
				0,
				0,
				0.0f,
				0.0f,
				TRUE,
				FALSE,
				1.0,
				1.0,
				FALSE, 0.0f, 0.0f, 0.0,
				String,
				0,
				NULL,
				NULL,
				FALSE,
				ManageData,
				0,
				StrLen,
				VerticalFlag,
				&DrawSize,
				LineCount,
				NULL,
				0,
				NULL, 0,
				0
			) ;

	if( SizeX )
	{
		*SizeX = DrawSize.cx ;
	}

	if( SizeY )
	{
		*SizeY = DrawSize.cy ;
	}

	return Result ;
}

// �t�H���g�n���h�����g�p���������t��������̕`�敝�E�����E�s�����擾����
extern int NS_GetDrawFormatStringSizeToHandle( int *SizeX, int *SizeY, int *LineCount, int FontHandle, const TCHAR *FormatString, ... )
{
	TCHAR_FONTHANDLE_FORMATSTRING_SETUP( -1 )

	// ������̕��𓾂�
	return NS_GetDrawStringSizeToHandle(
				SizeX, SizeY, LineCount, String, ( int )CL_strlen( CharCodeFormat, ( const char * )String ), FontHandle, FALSE ) ;
}

// �t�H���g�n���h�����g�p����������̕`�敝�E�����E�s�����擾����
extern int NS_GetDrawExtendStringSizeToHandle( int *SizeX, int *SizeY, int *LineCount, double ExRateX, double ExRateY, const TCHAR *String, int StrLen, int FontHandle, int VerticalFlag )
{
#ifdef UNICODE
	return GetDrawExtendStringSizeToHandle_WCHAR_T( SizeX, SizeY, LineCount, ExRateX, ExRateY, String, 0, StrLen, FontHandle, VerticalFlag ) ;
#else
	int Result ;

	FONTHANDLE_TCHAR_WITH_STRLEN_TO_WCHAR_T_STRING_BEGIN( String, StrLen, -1 )

	Result = GetDrawExtendStringSizeToHandle_WCHAR_T( SizeX, SizeY, LineCount, ExRateX, ExRateY, UseStringBuffer, 0, StrLen, FontHandle, VerticalFlag ) ;

	FONTHANDLE_TCHAR_WITH_STRLEN_TO_WCHAR_T_STRING_END

	return Result ;
#endif
}

// �t�H���g�n���h�����g�p����������̕`�敝�E�����E�s�����擾����
extern int NS_GetDrawExtendNStringSizeToHandle( int *SizeX, int *SizeY, int *LineCount, double ExRateX, double ExRateY, const TCHAR *String, size_t StringLength, int FontHandle, int VerticalFlag )
{
#ifdef UNICODE
	return GetDrawExtendStringSizeToHandle_WCHAR_T( SizeX, SizeY, LineCount, ExRateX, ExRateY, String, StringLength, ( int )StringLength, FontHandle, VerticalFlag ) ;
#else
	int Result ;

	FONTHANDLE_TCHAR_WITH_STRLENGTH_TO_WCHAR_T_STRING_BEGIN( String, StringLength, -1 )

	Result = GetDrawExtendStringSizeToHandle_WCHAR_T( SizeX, SizeY, LineCount, ExRateX, ExRateY, UseStringBuffer, wchar_StrLength, ( int )wchar_StrLength, FontHandle, VerticalFlag ) ;

	FONTHANDLE_TCHAR_TO_WCHAR_T_STRING_END

	return Result ;
#endif
}

// ������̕��𓾂�
extern int GetDrawExtendStringSizeToHandle_WCHAR_T( int *SizeX, int *SizeY, int *LineCount, double ExRateX, double ExRateY, const wchar_t *String, size_t StringLength, int StrLen, int FontHandle, int VerticalFlag )
{
	FONTMANAGE *ManageData ;
	SIZE DrawSize ;
	int Result ;

	ManageData = GetFontManageDataToHandle_Inline( FontHandle ) ;
	if( ManageData == NULL )
	{
		return -1 ;
	}

	if( StringLength > 0 )
	{
		StrLen = ( int )StringLength ;
	}
	else
	{
		int Length ;
		Length = ( int )_WCSLEN( String ) ;
		if( StrLen < 0 || StrLen > Length )
		{
			StrLen = Length ;
		}
	}

	Result = FontCacheStringDrawToHandleST(
				FALSE,
				0,
				0,
				0.0f,
				0.0f,
				TRUE,
				TRUE,
				ExRateX,
				ExRateY,
				FALSE, 0.0f, 0.0f, 0.0,
				String,
				0,
				NULL,
				NULL,
				FALSE,
				ManageData,
				0,
				StrLen,
				VerticalFlag,
				&DrawSize,
				LineCount,
				NULL,
				0,
				NULL, 0,
				0
			) ;

	if( SizeX )
	{
		*SizeX = DrawSize.cx ;
	}

	if( SizeY )
	{
		*SizeY = DrawSize.cy ;
	}

	return Result ;
}

// �t�H���g�n���h�����g�p���������t��������̕`�敝�E�����E�s�����擾����
extern int NS_GetDrawExtendFormatStringSizeToHandle( int *SizeX, int *SizeY, int *LineCount, double ExRateX, double ExRateY, int FontHandle, const TCHAR *FormatString, ... )
{
	TCHAR_FONTHANDLE_FORMATSTRING_SETUP( -1 )

	// ������̕��𓾂�
	return NS_GetDrawExtendStringSizeToHandle(
				SizeX, SizeY, LineCount, ExRateX, ExRateY, String, ( int )CL_strlen( CharCodeFormat, ( const char * )String ), FontHandle, FALSE ) ;
}



// �f�t�H���g�t�H���g�n���h�����g�p����������̂P�������̏����擾����
extern int NS_GetDrawStringCharInfo( DRAWCHARINFO *InfoBuffer, size_t InfoBufferSize, const TCHAR *String, int StrLen, int VerticalFlag )
{
	return NS_GetDrawStringCharInfoToHandle( InfoBuffer, InfoBufferSize, String, StrLen, DX_DEFAULT_FONT_HANDLE, VerticalFlag ) ;
}

// �f�t�H���g�t�H���g�n���h�����g�p����������̂P�������̏����擾����
extern int NS_GetDrawNStringCharInfo( DRAWCHARINFO *InfoBuffer, size_t InfoBufferSize, const TCHAR *String, size_t StringLength, int VerticalFlag )
{
	return NS_GetDrawNStringCharInfoToHandle( InfoBuffer, InfoBufferSize, String, StringLength, DX_DEFAULT_FONT_HANDLE, VerticalFlag ) ;
}

// �f�t�H���g�t�H���g�n���h�����g�p���������t��������̂P�������̏����擾����
extern int NS_GetDrawFormatStringCharInfo( DRAWCHARINFO *InfoBuffer, size_t InfoBufferSize, const TCHAR *FormatString, ... )
{
	int FontHandle = DX_DEFAULT_FONT_HANDLE ;

	TCHAR_FONTHANDLE_FORMATSTRING_SETUP( -1 )

	return NS_GetDrawStringCharInfoToHandle(
				InfoBuffer, InfoBufferSize, String, ( int )CL_strlen( CharCodeFormat, ( const char * )String ), FontHandle, FALSE ) ;
}

// �f�t�H���g�t�H���g�n���h�����g�p����������̂P�������̏����擾����
extern int NS_GetDrawExtendStringCharInfo( DRAWCHARINFO *InfoBuffer, size_t InfoBufferSize, double ExRateX, double ExRateY, const TCHAR *String, int StrLen, int VerticalFlag )
{
	return NS_GetDrawExtendStringCharInfoToHandle( InfoBuffer, InfoBufferSize, ExRateX, ExRateY, String, StrLen, DX_DEFAULT_FONT_HANDLE, VerticalFlag ) ;
}

// �f�t�H���g�t�H���g�n���h�����g�p����������̂P�������̏����擾����
extern int NS_GetDrawExtendNStringCharInfo( DRAWCHARINFO *InfoBuffer, size_t InfoBufferSize, double ExRateX, double ExRateY, const TCHAR *String, size_t StringLength, int VerticalFlag )
{
	return NS_GetDrawExtendNStringCharInfoToHandle( InfoBuffer, InfoBufferSize, ExRateX, ExRateY, String, StringLength, DX_DEFAULT_FONT_HANDLE, VerticalFlag ) ;
}

// �f�t�H���g�t�H���g�n���h�����g�p���������t��������̂P�������̏����擾����
extern int NS_GetDrawExtendFormatStringCharInfo( DRAWCHARINFO *InfoBuffer, size_t InfoBufferSize, double ExRateX, double ExRateY, const TCHAR *FormatString, ... )
{
	int FontHandle = DX_DEFAULT_FONT_HANDLE ;

	TCHAR_FONTHANDLE_FORMATSTRING_SETUP( -1 )

	// ������̕��𓾂�
	return NS_GetDrawExtendStringCharInfoToHandle(
		InfoBuffer, InfoBufferSize, ExRateX, ExRateY, String, ( int )CL_strlen( CharCodeFormat,  ( const char * )String ), DX_DEFAULT_FONT_HANDLE, FALSE ) ;
}

// �f�t�H���g�t�H���g�n���h�����g�p������̕����̃y�A�̃J�[�j���O�����擾����( PairChar:�J�[�j���O���𒲂ׂ�y�A�ƂȂ�2�����̕�����( 2�����ȏ゠���Ă��擪��2���������g�p����܂� )  KernAmount:2�����ڂ̕�������{�̈ʒu���炸�炷�h�b�g����������int�^�ϐ��̃A�h���X )
extern int NS_GetDrawStringKerningPairInfo( const TCHAR *PairChar, int *KernAmount )
{
	return NS_GetDrawStringKerningPairInfoToHandle( PairChar, KernAmount, DX_DEFAULT_FONT_HANDLE ) ;
}

// �f�t�H���g�t�H���g�n���h�����g�p������̕����̃y�A�̃J�[�j���O�����擾����( PairChar:�J�[�j���O���𒲂ׂ�y�A�ƂȂ�2�����̕�����( 2�����ȏ゠���Ă��擪��2���������g�p����܂� )  KernAmount:2�����ڂ̕�������{�̈ʒu���炸�炷�h�b�g����������int�^�ϐ��̃A�h���X )
extern int NS_GetDrawStringKerningPairInfoWithStrLen( const TCHAR *PairChar, size_t PairCharLength, int *KernAmount )
{
	return NS_GetDrawStringKerningPairInfoToHandleWithStrLen( PairChar, PairCharLength, KernAmount, DX_DEFAULT_FONT_HANDLE ) ;
}

// �t�H���g�n���h�����g�p����������̂P�������̏����擾����
extern int NS_GetDrawStringCharInfoToHandle( DRAWCHARINFO *InfoBuffer, size_t InfoBufferSize, const TCHAR *String, int StrLen, int FontHandle, int VerticalFlag )
{
#ifdef UNICODE
	return GetDrawStringCharInfoToHandle_WCHAR_T( InfoBuffer, InfoBufferSize, String, 0, StrLen, FontHandle, VerticalFlag ) ;
#else
	int Result ;
	FONTHANDLE_TCHAR_WITH_STRLEN_TO_WCHAR_T_STRING_BEGIN( String, StrLen, -1 )

	Result = GetDrawStringCharInfoToHandle_WCHAR_T( InfoBuffer, InfoBufferSize, UseStringBuffer, 0, StrLen, FontHandle, VerticalFlag ) ;

	FONTHANDLE_TCHAR_WITH_STRLEN_TO_WCHAR_T_STRING_END

	return Result ;
#endif
}

// �t�H���g�n���h�����g�p����������̂P�������̏����擾����
extern int NS_GetDrawNStringCharInfoToHandle( DRAWCHARINFO *InfoBuffer, size_t InfoBufferSize, const TCHAR *String, size_t StringLength, int FontHandle, int VerticalFlag )
{
#ifdef UNICODE
	return GetDrawStringCharInfoToHandle_WCHAR_T( InfoBuffer, InfoBufferSize, String, StringLength, ( int )StringLength, FontHandle, VerticalFlag ) ;
#else
	int Result ;
	FONTHANDLE_TCHAR_WITH_STRLENGTH_TO_WCHAR_T_STRING_BEGIN( String, StringLength, -1 )

	Result = GetDrawStringCharInfoToHandle_WCHAR_T( InfoBuffer, InfoBufferSize, UseStringBuffer, wchar_StrLength, ( int )wchar_StrLength, FontHandle, VerticalFlag ) ;

	FONTHANDLE_TCHAR_TO_WCHAR_T_STRING_END

	return Result ;
#endif
}

// �t�H���g�n���h�����g�p����������̂P�������̏����擾����
extern int GetDrawStringCharInfoToHandle_WCHAR_T( DRAWCHARINFO *InfoBuffer, size_t InfoBufferSize, const wchar_t *String, size_t StringLength, int StrLen, int FontHandle, int VerticalFlag )
{
	FONTMANAGE *ManageData ;
	int Result ;
	int CharInfoNum ;

	ManageData = GetFontManageDataToHandle_Inline( FontHandle ) ;
	if( ManageData == NULL )
	{
		return -1 ;
	}

	if( StringLength > 0 )
	{
		StrLen = ( int )StringLength ;
	}
	else
	{
		int Length ;
		Length = ( int )_WCSLEN( String ) ;
		if( StrLen < 0 || StrLen > Length )
		{
			StrLen = Length ;
		}
	}

	Result = FontCacheStringDrawToHandleST(
				FALSE,
				0,
				0,
				0.0f,
				0.0f,
				TRUE,
				FALSE,
				1.0,
				1.0,
				FALSE, 0.0f, 0.0f, 0.0,
				String,
				0,
				NULL,
				NULL,
				FALSE,
				ManageData,
				0,
				StrLen,
				VerticalFlag,
				NULL,
				NULL,
				InfoBuffer,
				InfoBufferSize,
				&CharInfoNum, 0,
				0
			) ;

	return Result < 0 ? -1 : CharInfoNum ;
}

// �t�H���g�n���h�����g�p���������t��������̂P�������̏����擾����
extern int NS_GetDrawFormatStringCharInfoToHandle( DRAWCHARINFO *InfoBuffer, size_t InfoBufferSize, int FontHandle, const TCHAR *FormatString, ... )
{
	TCHAR_FONTHANDLE_FORMATSTRING_SETUP( -1 )

	return NS_GetDrawStringCharInfoToHandle(
				InfoBuffer, InfoBufferSize, String, ( int )CL_strlen( CharCodeFormat, ( const char * )String ), FontHandle, FALSE ) ;
}

// �t�H���g�n���h�����g�p����������̂P�������̏����擾����
extern int NS_GetDrawExtendStringCharInfoToHandle(  DRAWCHARINFO *InfoBuffer, size_t InfoBufferSize, double ExRateX, double ExRateY, const TCHAR *String, int StrLen, int FontHandle, int VerticalFlag )
{
#ifdef UNICODE
	return GetDrawExtendStringCharInfoToHandle_WCHAR_T( InfoBuffer, InfoBufferSize, ExRateX, ExRateY, String, 0, StrLen, FontHandle, VerticalFlag ) ;
#else
	int Result ;

	FONTHANDLE_TCHAR_WITH_STRLEN_TO_WCHAR_T_STRING_BEGIN( String, StrLen, -1 )

	Result = GetDrawExtendStringCharInfoToHandle_WCHAR_T( InfoBuffer, InfoBufferSize, ExRateX, ExRateY, UseStringBuffer, 0, StrLen, FontHandle, VerticalFlag ) ;

	FONTHANDLE_TCHAR_WITH_STRLEN_TO_WCHAR_T_STRING_END

	return Result ;
#endif
}

// �t�H���g�n���h�����g�p����������̂P�������̏����擾����
extern int NS_GetDrawExtendNStringCharInfoToHandle(  DRAWCHARINFO *InfoBuffer, size_t InfoBufferSize, double ExRateX, double ExRateY, const TCHAR *String, size_t StringLength, int FontHandle, int VerticalFlag )
{
#ifdef UNICODE
	return GetDrawExtendStringCharInfoToHandle_WCHAR_T( InfoBuffer, InfoBufferSize, ExRateX, ExRateY, String, StringLength, ( int )StringLength, FontHandle, VerticalFlag ) ;
#else
	int Result ;

	FONTHANDLE_TCHAR_WITH_STRLENGTH_TO_WCHAR_T_STRING_BEGIN( String, StringLength, -1 )

	Result = GetDrawExtendStringCharInfoToHandle_WCHAR_T( InfoBuffer, InfoBufferSize, ExRateX, ExRateY, UseStringBuffer, wchar_StrLength, ( int )wchar_StrLength, FontHandle, VerticalFlag ) ;

	FONTHANDLE_TCHAR_TO_WCHAR_T_STRING_END

	return Result ;
#endif
}

// �t�H���g�n���h�����g�p����������̂P�������̏����擾����
extern int GetDrawExtendStringCharInfoToHandle_WCHAR_T( DRAWCHARINFO *InfoBuffer, size_t InfoBufferSize, double ExRateX, double ExRateY, const wchar_t *String, size_t StringLength, int StrLen, int FontHandle, int VerticalFlag )
{
	FONTMANAGE *ManageData ;
	int Result ;
	int CharInfoNum ;

	ManageData = GetFontManageDataToHandle_Inline( FontHandle ) ;
	if( ManageData == NULL )
	{
		return -1 ;
	}

	if( StringLength > 0 )
	{
		StrLen = ( int )StringLength ;
	}
	else
	{
		int Length ;
		Length = ( int )_WCSLEN( String ) ;
		if( StrLen < 0 || StrLen > Length )
		{
			StrLen = Length ;
		}
	}

	Result = FontCacheStringDrawToHandleST(
				FALSE,
				0,
				0,
				0.0f,
				0.0f,
				TRUE,
				TRUE,
				ExRateX,
				ExRateY,
				FALSE, 0.0f, 0.0f, 0.0,
				String,
				0,
				NULL,
				NULL,
				FALSE,
				ManageData,
				0,
				StrLen,
				VerticalFlag,
				NULL,
				NULL,
				InfoBuffer,
				InfoBufferSize,
				&CharInfoNum, 0,
				0
			) ;

	return Result < 0 ? -1 : CharInfoNum ;
}

// �t�H���g�n���h�����g�p������̕����̃y�A�̃J�[�j���O�����擾����( PairChar:�J�[�j���O���𒲂ׂ�y�A�ƂȂ�2�����̕�����( 2�����ȏ゠���Ă��擪��2���������g�p����܂� )  KernAmount:2�����ڂ̕�������{�̈ʒu���炸�炷�h�b�g����������int�^�ϐ��̃A�h���X )
extern int NS_GetDrawStringKerningPairInfoToHandle( const TCHAR *PairChar, int *KernAmount, int FontHandle )
{
#ifdef UNICODE
	return GetDrawStringKerningPairInfoToHandle_WCHAR_T( PairChar, KernAmount, FontHandle ) ;
#else
	int Result ;
	FONTHANDLE_TCHAR_TO_WCHAR_T_STRING_BEGIN( PairChar, -1 )

	Result = GetDrawStringKerningPairInfoToHandle_WCHAR_T( UseStringBuffer, KernAmount, FontHandle ) ;

	FONTHANDLE_TCHAR_TO_WCHAR_T_STRING_END

	return Result ;
#endif
}

// �t�H���g�n���h�����g�p������̕����̃y�A�̃J�[�j���O�����擾����( PairChar:�J�[�j���O���𒲂ׂ�y�A�ƂȂ�2�����̕�����( 2�����ȏ゠���Ă��擪��2���������g�p����܂� )  KernAmount:2�����ڂ̕�������{�̈ʒu���炸�炷�h�b�g����������int�^�ϐ��̃A�h���X )
extern int NS_GetDrawStringKerningPairInfoToHandleWithStrLen( const TCHAR *PairChar, size_t PairCharLength, int *KernAmount, int FontHandle )
{
	int Result ;
#ifdef UNICODE
	FONTHANDLE_WCHAR_T_WITH_STRLENGTH_TO_WCHAR_T_STRING_BEGIN( PairChar, PairCharLength, -1 )
	Result = GetDrawStringKerningPairInfoToHandle_WCHAR_T( UseStringBuffer, KernAmount, FontHandle ) ;
	FONTHANDLE_WCHAR_T_TO_WCHAR_T_STRING_END
#else
	FONTHANDLE_TCHAR_WITH_STRLENGTH_TO_WCHAR_T_STRING_BEGIN( PairChar, PairCharLength, -1 )
	Result = GetDrawStringKerningPairInfoToHandle_WCHAR_T( UseStringBuffer, KernAmount, FontHandle ) ;
	FONTHANDLE_TCHAR_TO_WCHAR_T_STRING_END
#endif
	return Result ;
}

// �t�H���g�n���h�����g�p������̕����̃y�A�̃J�[�j���O�����擾����( PairChar:�J�[�j���O���𒲂ׂ�y�A�ƂȂ�2�����̕�����( 2�����ȏ゠���Ă��擪��2���������g�p����܂� )  KernAmount:2�����ڂ̕�������{�̈ʒu���炸�炷�h�b�g����������int�^�ϐ��̃A�h���X )
extern int GetDrawStringKerningPairInfoToHandle_WCHAR_T( const wchar_t *PairChar, int *KernAmount, int FontHandle )
{
	DWORD LeftChar ;
	DWORD RightChar ;
	int DrawOffsetX ;
	int DrawOffsetY ;
	FONTMANAGE *ManageData ;
	FONTMANAGE *UseManageData ;
	FONTCHARDATA *CharData ;
	int UseSize ;
	DWORD di, dj ;

	if( PairChar == NULL )
	{
		return -1 ;
	}

	ManageData = GetFontManageDataToHandle_Inline( FontHandle ) ;
	if( ManageData == NULL )
	{
		return -1 ;
	}

	// �l��������
	if( KernAmount != NULL )
	{
		*KernAmount = 0 ;
	}

	// �J�[�j���O��񂪖����ꍇ�̏���
	if( ManageData->BaseInfo.KerningPairNum == 0 )
	{
		return 0 ;
	}

	// ���E�̕����R�[�h���擾
	LeftChar = WCHAR_T_GetCharCode( PairChar, g_BaseFuncSystem.Use_wchar_t_CharCodeFormat, &UseSize ) ;
	if( PairChar[ UseSize / 2 ] == L'\0' )
	{
		return -1 ;
	}
	RightChar = WCHAR_T_GetCharCode( &PairChar[ UseSize / 2 ], g_BaseFuncSystem.Use_wchar_t_CharCodeFormat, &UseSize ) ;

	// �����̕��������擾
	CharData = GetFontCacheChar_Inline( ManageData, LeftChar, 0, &UseManageData, &DrawOffsetX, &DrawOffsetY, TRUE, FALSE ) ;

	// �J�[�j���O���̃Z�b�g
	if( CharData != NULL )
	{
		for( di = 0 ; di < CharData->KerningPairNum ; di ++ )
		{
			if( CharData->KerningPair[ di ].Second == RightChar )
			{
				if( KernAmount != NULL ) *KernAmount = CharData->KerningPair[ di ].KernAmount ;
				break ;
			}
		}
	}
	else
	{
		for( di = 0 ; di < UseManageData->BaseInfo.KerningPairNum && UseManageData->KerningPairData[ di ].First != LeftChar ; di ++ ){}
		if( di != UseManageData->BaseInfo.KerningPairNum )
		{
			for( dj = 0 ; di + dj < UseManageData->BaseInfo.KerningPairNum && UseManageData->KerningPairData[ di + dj ].First == LeftChar ; dj ++ )
			{
				if( UseManageData->KerningPairData[ di + dj ].Second == RightChar )
				{
					if( KernAmount != NULL ) *KernAmount = UseManageData->KerningPairData[ di + dj ].KernAmount ;
					break ;
				}
			}
		}
	}

	// ����I��
	return 0 ;
}

// �t�H���g�n���h�����g�p���������t��������̂P�������̏����擾����
extern int NS_GetDrawExtendFormatStringCharInfoToHandle( DRAWCHARINFO *InfoBuffer, size_t InfoBufferSize, double ExRateX, double ExRateY, int FontHandle, const TCHAR *FormatString, ... )
{
	TCHAR_FONTHANDLE_FORMATSTRING_SETUP( -1 )

	return NS_GetDrawExtendStringCharInfoToHandle(
				InfoBuffer, InfoBufferSize, ExRateX, ExRateY, String, ( int )CL_strlen( CharCodeFormat, ( const char * )String ), FontHandle, FALSE ) ;
}




// �t�H���g�̏��𓾂�
extern int NS_GetFontStateToHandle( TCHAR *FontName, int *Size, int *Thick, int FontHandle, int *FontType , int *CharSet , int *EdgeSize , int *Italic )
{
#ifdef UNICODE
	return GetFontStateToHandle_WCHAR_T( FontName, Size, Thick, FontHandle, FontType , CharSet , EdgeSize , Italic ) ;
#else
	wchar_t FontNameBuffer[ 256 ] ;
	int Result ;

	TCHAR_CHARCODEFORMAT_SETUP( -1 )

	Result = GetFontStateToHandle_WCHAR_T( FontNameBuffer, Size, Thick, FontHandle, FontType , CharSet , EdgeSize , Italic ) ;
	if( Result < 0 )
	{
		return -1 ;
	}

	ConvString( ( const char * )FontNameBuffer, -1, WCHAR_T_CHARCODEFORMAT, ( char * )FontName, BUFFERBYTES_CANCEL, CharCodeFormat ) ;	

	return Result ;
#endif
}

// �t�H���g�̏��𓾂�
extern int GetFontStateToHandle_WCHAR_T( wchar_t *FontName, int *Size, int *Thick, int FontHandle, int *FontType , int *CharSet , int *EdgeSize , int *Italic )
{
	FONTMANAGE * ManageData ;

	DEFAULT_FONT_HANDLE_SETUP

	// �G���[����
	if( FONTHCHK( FontHandle, ManageData ) )
	{
		return -1 ;
	}

	if( FontName ) _WCSCPY( FontName, ManageData->FontName ) ;
	if( Thick    ) *Thick    = ManageData->BaseInfo.FontThickness ;
	if( Size     ) *Size     = ManageData->BaseInfo.FontSize ;
	if( FontType ) *FontType = ManageData->FontType ;
	if( CharSet  ) *CharSet  = ManageData->BaseInfo.CharSet ;
	if( EdgeSize ) *EdgeSize = ManageData->EdgeSize ;
	if( Italic   ) *Italic   = ManageData->BaseInfo.Italic ;

	// �I��
	return 0;
}

// �f�t�H���g�̃t�H���g�̃n���h���𓾂�
extern int NS_GetDefaultFontHandle( void )
{
	int FontHandle = DX_DEFAULT_FONT_HANDLE ;

	DEFAULT_FONT_HANDLE_SETUP

	return FontHandle ;
}

// �w��̃t�H���g���e�N�X�`���L���b�V�����g�p���Ă��邩�ǂ����𓾂�
extern int NS_CheckFontCacheToTextureFlag( int FontHandle )
{
	FONTMANAGE * ManageData ;

	DEFAULT_FONT_HANDLE_SETUP

	// �G���[����
	if( FONTHCHK( FontHandle, ManageData ) )
		return -1 ;

	// �t���O��Ԃ�
	return ManageData->TextureCacheFlag ;
}

// �w��̃t�H���g���e�N�X�`���L���b�V�����g�p���Ă��邩�ǂ����𓾂�(�뎚��)
extern int NS_CheckFontChacheToTextureFlag( int FontHandle )
{
	return NS_CheckFontCacheToTextureFlag( FontHandle );
}

// �t�H���g�Ƀe�N�X�`���L���b�V�����g�p���邩�ǂ������擾����
extern int NS_GetFontCacheToTextureFlag( void )
{
	return !FSYS.NotTextureFlag ;
}

// �t�H���g�Ƀe�N�X�`���L���b�V�����g�p���邩�ǂ������擾����(�뎚��)
extern int NS_GetFontChacheToTextureFlag( void )
{
	return NS_GetFontCacheToTextureFlag() ;
}

// �t�H���g�̃L���b�V���Ƃ��Ďg�p����e�N�X�`���̃J���[�r�b�g�[�x��ݒ肷��( 16 ���� 32 �̂ݎw��\  �f�t�H���g�� 32 )
extern int NS_SetFontCacheTextureColorBitDepth( int ColorBitDepth )
{
	// �t���O��ۑ�
	FSYS.TextureCacheColorBitDepth16Flag = ColorBitDepth == 16 ? TRUE : FALSE ;
	
	// �I��
	return 0 ;
}

// �t�H���g�̃L���b�V���Ƃ��Ďg�p����e�N�X�`���̃J���[�r�b�g�[�x���擾����
extern int NS_GetFontCacheTextureColorBitDepth( void )
{
	return FSYS.TextureCacheColorBitDepth16Flag ? 16 : 32 ;
}

// �w��̃t�H���g�n���h�����L�����ۂ����ׂ�
extern int NS_CheckFontHandleValid( int FontHandle )
{
	FONTMANAGE * ManageData ;

	DEFAULT_FONT_HANDLE_SETUP

	if( FONTHCHK( FontHandle, ManageData ) )
		return 0 ;

	return 1 ;
}

// �t�H���g�n���h���̃L���b�V����������������
extern int NS_ClearFontCacheToHandle( int FontHandle )
{
	FONTMANAGE * ManageData ;

	DEFAULT_FONT_HANDLE_SETUP

	if( FONTHCHK( FontHandle, ManageData ) )
		return 0 ;

	// �t�H���g�̃L���b�V����������������
	InitFontCacheToHandle( ManageData, FALSE ) ;

	// �I��
	return 0 ;
}

// �Q�o�C�g���������ׂ�( TRUE:�Q�o�C�g����  FALSE:�P�o�C�g���� )
extern int NS_MultiByteCharCheck( const char *Buf, int CharSet )
{
	int   CharBytes ;

	if( CharSet < 0 || CharSet >= DX_CHARSET_NUM )
	{
		return -1 ;
	}

	GetCharCode( Buf, CharCodeFormatTable[ CharSet ], &CharBytes ) ;

	return CharBytes > 1 ? TRUE : FALSE ;
}


// �t�H���g�L���b�V���ŃL���b�V���ł��镶�������擾����( �߂�l  0:�f�t�H���g  1�ȏ�:�w�蕶���� )
extern int NS_GetFontCacheCharNum( void )
{
	return FSYS.CacheCharNum ;
}

// �t�H���g�̃T�C�Y�𓾂�
extern int NS_GetFontSize( void )
{
	return NS_GetFontSizeToHandle( DX_DEFAULT_FONT_HANDLE ) ;
}

// �f�t�H���g�t�H���g�n���h���̉��T�C�Y���擾����
extern int NS_GetFontEdgeSize( void )
{
	return NS_GetFontEdgeSizeToHandle( DX_DEFAULT_FONT_HANDLE ) ;
}

// �t�H���g�̃T�C�Y�𓾂�
extern int NS_GetFontSizeToHandle( int FontHandle )
{
	FONTMANAGE * ManageData ;
	
	DEFAULT_FONT_HANDLE_SETUP

	if( FONTHCHK( FontHandle, ManageData ) )
		return -1 ;

	return ManageData->BaseInfo.FontSize ;
}

// �t�H���g�n���h���̉��T�C�Y���擾����
extern int NS_GetFontEdgeSizeToHandle( int FontHandle )
{
	FONTMANAGE * ManageData ;
	
	DEFAULT_FONT_HANDLE_SETUP

	if( FONTHCHK( FontHandle, ManageData ) )
		return -1 ;

	return ManageData->EdgeSize ;
}

// �t�H���g�n���h���̎��Ԃ��擾����
extern int NS_GetFontSpaceToHandle( int FontHandle )
{
	FONTMANAGE * ManageData ;
	
	DEFAULT_FONT_HANDLE_SETUP

	if( FONTHCHK( FontHandle, ManageData ) )
		return -1 ;

	return ManageData->Space ;
}

// �t�H���g�n���h���̍s�Ԃ��擾����
extern int NS_GetFontLineSpaceToHandle( int FontHandle )
{
	FONTMANAGE * ManageData ;
	
	DEFAULT_FONT_HANDLE_SETUP

	if( FONTHCHK( FontHandle, ManageData ) )
		return -1 ;

	return ManageData->LineSpaceValidFlag ? ManageData->LineSpace : ManageData->BaseInfo.FontHeight - ManageData->BaseInfo.FontAddHeight ;
}

// �t�H���g�L���b�V���Ƃ��ĕۑ�����摜�̌`������Z�ς݃��`�����l���t���摜�ɂ��邩�ǂ�����ݒ肷��( TRUE:��Z�ς݃����g�p����  FLASE:��Z�ς݃����g�p���Ȃ�( �f�t�H���g ) )
extern int NS_SetFontCacheUsePremulAlphaFlag( int Flag )
{
	FSYS.UsePremulAlphaFlag = Flag == FALSE ? FALSE : TRUE ;

	return 0 ;
}

// �t�H���g�L���b�V���Ƃ��ĕۑ�����摜�̌`������Z�ς݃��`�����l���t���摜�ɂ��邩�ǂ������擾����
extern int NS_GetFontCacheUsePremulAlphaFlag( void )
{
	return FSYS.UsePremulAlphaFlag ;
}

// �t�H���g�̃T�C�Y��␳���鏈�����s�����ǂ�����ݒ肷��( Flag  TRUE:�s��( �f�t�H���g )  FALSE:�s��Ȃ� )
extern int NS_SetFontUseAdjustSizeFlag( int Flag )
{
	FSYS.DisableAdjustFontSize = Flag == FALSE ? TRUE : FALSE ;

	return 0 ;
}

// �t�H���g�̃T�C�Y��␳���鏈�����s�����ǂ������擾����
extern int NS_GetFontUseAdjustSizeFlag( void )
{
	return FSYS.DisableAdjustFontSize == FALSE ? TRUE : FALSE ;
}

// �t�H���g�̕`��ŉ��̂݁A���͖{�̂̂ݕ`����s�����ǂ�����ݒ肷��( OnlyType  0:�ʏ�`�� 1:�{�̂̂ݕ`�� 2:���̂ݕ`�� )
extern int NS_SetFontOnlyDrawType( int OnlyType )
{
	FSYS.OnlyDrawType = OnlyType ;

	return 0 ;
}

// �t�H���g�̕`��ŉ��̂݁A���͖{�̂̂ݕ`����s�����ǂ������擾����( �߂�l  0:�ʏ�`�� 1:�{�̂̂ݕ`�� 2:���̂ݕ`�� )
extern int NS_GetFontOnlyDrawType( void )
{
	return FSYS.OnlyDrawType ;
}

// DrawString �Ȃǂ� \n �𖳎����邩�ǂ�����ݒ肷��( TRUE : ��������    FALSE : �������Ȃ�( �f�t�H���g ) )
extern int NS_SetFontIgnoreLFFlag( int Flag )
{
	FSYS.IgnoreLFFlag = Flag ;

	return 0 ;
}

// DrawString �Ȃǂ� \n �𖳎����邩�ǂ������擾����( TRUE : ��������    FALSE : �������Ȃ�( �f�t�H���g ) )
extern int NS_GetFontIgnoreLFFlag( void )
{
	return FSYS.IgnoreLFFlag ;
}

// �������`�悷��
extern int NS_DrawString( int x, int y, const TCHAR *String, unsigned int Color, unsigned int EdgeColor )
{
	return NS_DrawStringToHandle( x, y, String, Color, DX_DEFAULT_FONT_HANDLE, EdgeColor, FALSE ) ;
}

// �f�t�H���g�t�H���g�n���h�����g�p���ĕ������`�悷��
extern int NS_DrawNString( int x, int y, const TCHAR *String, size_t StringLength, unsigned int Color, unsigned int EdgeColor )
{
	return NS_DrawNStringToHandle( x, y, String, StringLength, Color, DX_DEFAULT_FONT_HANDLE, EdgeColor, FALSE ) ;
}

// �������`�悷��
extern int DrawString_WCHAR_T( int x, int y, const wchar_t *String, size_t StringLength, unsigned int Color, unsigned int EdgeColor )
{
	return DrawStringToHandle_WCHAR_T( x, y, String, StringLength, Color, DX_DEFAULT_FONT_HANDLE, EdgeColor, FALSE ) ;
}

// �������`�悷��
extern int NS_DrawStringF( float x, float y, const TCHAR *String, unsigned int Color, unsigned int EdgeColor )
{
	return NS_DrawStringFToHandle( x, y, String, Color, DX_DEFAULT_FONT_HANDLE, EdgeColor, FALSE ) ;
}

// �f�t�H���g�t�H���g�n���h�����g�p���ĕ������`�悷��( ���W�w�肪 float �� )
extern int NS_DrawNStringF( float x, float y, const TCHAR *String, size_t StringLength, unsigned int Color, unsigned int EdgeColor )
{
	return NS_DrawNStringFToHandle( x, y, String, StringLength, Color, DX_DEFAULT_FONT_HANDLE, EdgeColor, FALSE ) ;
}

// �������`�悷��
extern int DrawStringF_WCHAR_T( float x, float y, const wchar_t *String, size_t StringLength, unsigned int Color, unsigned int EdgeColor )
{
	return DrawStringFToHandle_WCHAR_T( x, y, String, StringLength, Color, DX_DEFAULT_FONT_HANDLE, EdgeColor, FALSE ) ;
}

// �������`�悷��
extern int NS_DrawVString( int x, int y, const TCHAR *String, unsigned int Color, unsigned int EdgeColor )
{
	return NS_DrawStringToHandle( x, y, String, Color, DX_DEFAULT_FONT_HANDLE, EdgeColor, TRUE ) ;
}

// �f�t�H���g�t�H���g�n���h�����g�p���ĕ������`�悷��( �c���� )
extern int NS_DrawNVString( int x, int y, const TCHAR *String, size_t StringLength, unsigned int Color, unsigned int EdgeColor )
{
	return NS_DrawNVStringToHandle( x, y, String, StringLength, Color, DX_DEFAULT_FONT_HANDLE, EdgeColor ) ;
}

// �������`�悷��
extern int DrawVString_WCHAR_T( int x, int y, const wchar_t *String, size_t StringLength, unsigned int Color, unsigned int EdgeColor )
{
	return DrawStringToHandle_WCHAR_T( x, y, String, StringLength, Color, DX_DEFAULT_FONT_HANDLE, EdgeColor, TRUE ) ;
}

// �������`�悷��
extern int NS_DrawVStringF( float x, float y, const TCHAR *String, unsigned int Color, unsigned int EdgeColor )
{
	return NS_DrawStringFToHandle( x, y, String, Color, DX_DEFAULT_FONT_HANDLE, EdgeColor, TRUE ) ;
}

// �f�t�H���g�t�H���g�n���h�����g�p���ĕ������`�悷��( �c���� )( ���W�w�肪 float �� )
extern int NS_DrawNVStringF( float x, float y, const TCHAR *String, size_t StringLength, unsigned int Color, unsigned int EdgeColor )
{
	return NS_DrawNVStringFToHandle( x, y, String, StringLength, Color, DX_DEFAULT_FONT_HANDLE, EdgeColor ) ;
}

// �������`�悷��
extern int DrawVStringF_WCHAR_T( float x, float y, const wchar_t *String, size_t StringLength, unsigned int Color, unsigned int EdgeColor )
{
	return DrawStringFToHandle_WCHAR_T( x, y, String, StringLength, Color, DX_DEFAULT_FONT_HANDLE, EdgeColor, TRUE ) ;
}

// �������`�悷��
#define SETDRAWRECTCODE\
	if( VerticalFlag )\
	{\
		x += font->BaseInfo.FontAddHeight / 2;\
		SETRECT( DrawRect, x, y, x + font->BaseInfo.FontHeight + font->BaseInfo.FontAddHeight / 2 + 3, GSYS.DrawSetting.DrawArea.bottom ) ;\
		if( DrawRect.left >= GSYS.DrawSetting.DrawArea.right ) return 0 ;\
		x -= font->BaseInfo.FontAddHeight / 2;\
	}\
	else\
	{\
		y -= font->BaseInfo.FontAddHeight / 2 ;\
		SETRECT( DrawRect, x, y, GSYS.DrawSetting.DrawArea.right, y + font->BaseInfo.FontHeight + font->BaseInfo.FontAddHeight / 2 + 3 ) ;\
		if( DrawRect.left >= GSYS.DrawSetting.DrawArea.right ) return 0 ;\
		y += font->BaseInfo.FontAddHeight / 2 ;\
	}\
	DRAWRECT_DRAWAREA_CLIP

extern int NS_DrawStringToHandle( int x, int y, const TCHAR *String, unsigned int Color, int FontHandle, unsigned int EdgeColor, int VerticalFlag )
{
#ifdef UNICODE
	return DrawStringToHandle_WCHAR_T( x, y, String, CL_strlen( WCHAR_T_CHARCODEFORMAT, ( const char * )String ), Color, FontHandle, EdgeColor, VerticalFlag ) ;
#else
	int Result ;

	FONTHANDLE_TCHAR_TO_WCHAR_T_STRING_BEGIN( String, -1 )

	Result = DrawStringToHandle_WCHAR_T( x, y, UseStringBuffer, wchar_StrLength, Color, FontHandle, EdgeColor, VerticalFlag ) ;

	FONTHANDLE_TCHAR_TO_WCHAR_T_STRING_END

	return Result ;
#endif
}

extern int NS_DrawNStringToHandle( int x, int y, const TCHAR *String, size_t StringLength, unsigned int Color, int FontHandle, unsigned int EdgeColor, int VerticalFlag )
{
#ifdef UNICODE
	return DrawStringToHandle_WCHAR_T( x, y, String, StringLength, Color, FontHandle, EdgeColor, VerticalFlag ) ;
#else
	int Result ;

	FONTHANDLE_TCHAR_WITH_STRLENGTH_TO_WCHAR_T_STRING_BEGIN( String, StringLength, -1 )

	Result = DrawStringToHandle_WCHAR_T( x, y, UseStringBuffer, wchar_StrLength, Color, FontHandle, EdgeColor, VerticalFlag ) ;

	FONTHANDLE_TCHAR_TO_WCHAR_T_STRING_END

	return Result ;
#endif
}

extern int DrawStringToHandle_WCHAR_T( int x, int y, const wchar_t *String, size_t StringLength, unsigned int Color, int FontHandle, unsigned int EdgeColor, int VerticalFlag )
{
#ifndef DX_NON_GRAPHICS
	int Ret = -1 ;
	FONTMANAGE *font ;

//	DEFAULT_FONT_HANDLE_SETUP

	if( String == NULL || String[0] == L'\0' || StringLength == 0 ||
		/* GSYS.NotDrawFlag || */ GSYS.DrawSetting.NotDrawFlagInSetDrawArea )
	{
		return 0 ;
	}

	CheckActiveState() ;

	font = GetFontManageDataToHandle_Inline( FontHandle ) ;
	if( font == NULL )
	{
		DXST_LOGFILE_ADDUTF16LE( "\xd5\x30\xa9\x30\xf3\x30\xc8\x30\xcf\x30\xf3\x30\xc9\x30\xeb\x30\x24\x50\x4c\x30\x70\x75\x38\x5e\x67\x30\x59\x30\x0a\x00\x00"/*@ L"�t�H���g�n���h���l���ُ�ł�\n" @*/ ) ;
		return Ret ;
	}

	// �Q�c�s����n�[�h�E�G�A�ɔ��f����
	if( GSYS.DrawSetting.MatchHardware_2DMatrix == FALSE && GSYS.Setting.ValidHardware && GSYS.Screen.UserScreenImagePixelFormatMatchSoftRenderMode == FALSE )
		Graphics_DrawSetting_ApplyLib2DMatrixToHardware() ;

	// �`��
	DRAW_DEF(
		DrawStringHardware( x, y, ( float )x, ( float )y, TRUE, String, StringLength, Color, font, EdgeColor, VerticalFlag ),
		DrawStringSoftware( x, y,                               String, StringLength, Color, font, EdgeColor, VerticalFlag ),
		SETDRAWRECTCODE,
		Ret,
		font->TextureCacheFlag
	)

	// �I��
	return Ret ;
#else // DX_NON_GRAPHICS
	return -1 ;
#endif // DX_NON_GRAPHICS
}

#undef SETDRAWRECTCODE



// �������`�悷��
#define SETDRAWRECTCODE\
	if( VerticalFlag )\
	{\
		x += ( float )font->BaseInfo.FontAddHeight / 2;\
		SETRECT( DrawRect, _FTOL( x ), _FTOL( y ), _FTOL( x ) + font->BaseInfo.FontHeight + 3, GSYS.DrawSetting.DrawArea.bottom ) ;\
		if( DrawRect.left >= GSYS.DrawSetting.DrawArea.right ) return 0 ;\
		x -= ( float )font->BaseInfo.FontAddHeight / 2;\
	}\
	else\
	{\
		y -= ( float )font->BaseInfo.FontAddHeight / 2 ;\
		SETRECT( DrawRect, _FTOL( x ), _FTOL( y ), GSYS.DrawSetting.DrawArea.right, _FTOL( y ) + font->BaseInfo.FontHeight + 3 ) ;\
		if( DrawRect.left >= GSYS.DrawSetting.DrawArea.right ) return 0 ;\
		y += ( float )font->BaseInfo.FontAddHeight / 2 ;\
	}\
	DRAWRECT_DRAWAREA_CLIP

extern int NS_DrawStringFToHandle( float x, float y, const TCHAR *String, unsigned int Color, int FontHandle, unsigned int EdgeColor, int VerticalFlag )
{
#ifdef UNICODE
	return DrawStringFToHandle_WCHAR_T( x, y, String, CL_strlen( WCHAR_T_CHARCODEFORMAT, ( const char * )String ), Color, FontHandle, EdgeColor, VerticalFlag ) ;
#else
	int Result ;

	FONTHANDLE_TCHAR_TO_WCHAR_T_STRING_BEGIN( String, -1 )

	Result = DrawStringFToHandle_WCHAR_T( x, y, UseStringBuffer, wchar_StrLength, Color, FontHandle, EdgeColor, VerticalFlag ) ;

	FONTHANDLE_TCHAR_TO_WCHAR_T_STRING_END

	return Result ;
#endif
}

extern int NS_DrawNStringFToHandle( float x, float y, const TCHAR *String, size_t StringLength, unsigned int Color, int FontHandle, unsigned int EdgeColor, int VerticalFlag )
{
#ifdef UNICODE
	return DrawStringFToHandle_WCHAR_T( x, y, String, StringLength, Color, FontHandle, EdgeColor, VerticalFlag ) ;
#else
	int Result ;

	FONTHANDLE_TCHAR_WITH_STRLENGTH_TO_WCHAR_T_STRING_BEGIN( String, StringLength, -1 )

	Result = DrawStringFToHandle_WCHAR_T( x, y, UseStringBuffer, wchar_StrLength, Color, FontHandle, EdgeColor, VerticalFlag ) ;

	FONTHANDLE_TCHAR_TO_WCHAR_T_STRING_END

	return Result ;
#endif
}

extern int DrawStringFToHandle_WCHAR_T( float x, float y, const wchar_t *String, size_t StringLength, unsigned int Color, int FontHandle, unsigned int EdgeColor, int VerticalFlag )
{
#ifndef DX_NON_GRAPHICS
	int Ret = -1 ;
	FONTMANAGE *font ;

//	DEFAULT_FONT_HANDLE_SETUP

	if( String == NULL || String[0] == L'\0' || StringLength == 0 ||
		/* GSYS.NotDrawFlag || */ GSYS.DrawSetting.NotDrawFlagInSetDrawArea )
	{
		return 0 ;
	}

	CheckActiveState() ;

	font = GetFontManageDataToHandle_Inline( FontHandle ) ;
	if( font == NULL )
	{
		DXST_LOGFILE_ADDUTF16LE( "\xd5\x30\xa9\x30\xf3\x30\xc8\x30\xcf\x30\xf3\x30\xc9\x30\xeb\x30\x24\x50\x4c\x30\x70\x75\x38\x5e\x67\x30\x59\x30\x0a\x00\x00"/*@ L"�t�H���g�n���h���l���ُ�ł�\n" @*/ ) ;
		return Ret ;
	}

	// �Q�c�s����n�[�h�E�G�A�ɔ��f����
	if( GSYS.DrawSetting.MatchHardware_2DMatrix == FALSE && GSYS.Setting.ValidHardware && GSYS.Screen.UserScreenImagePixelFormatMatchSoftRenderMode == FALSE )
		Graphics_DrawSetting_ApplyLib2DMatrixToHardware() ;

	// �`��
	DRAW_DEF(
		DrawStringHardware( _FTOL( x ), _FTOL( y ), x, y, FALSE, String, StringLength, Color, font, EdgeColor, VerticalFlag ),
		DrawStringSoftware( _FTOL( x ), _FTOL( y ),              String, StringLength, Color, font, EdgeColor, VerticalFlag ),
		SETDRAWRECTCODE,
		Ret,
		font->TextureCacheFlag
	)

	// �I��
	return Ret ;
#else // DX_NON_GRAPHICS
	return -1 ;
#endif // DX_NON_GRAPHICS
}

#undef SETDRAWRECTCODE




// �������`�悷��
extern int NS_DrawVStringToHandle( int x, int y, const TCHAR *String, unsigned int Color, int FontHandle, unsigned int EdgeColor )
{
	return NS_DrawStringToHandle( x, y, String, Color, FontHandle, EdgeColor, TRUE ) ;
}

// �������`�悷��
extern int NS_DrawNVStringToHandle( int x, int y, const TCHAR *String, size_t StringLength, unsigned int Color, int FontHandle, unsigned int EdgeColor )
{
	return NS_DrawNStringToHandle( x, y, String, StringLength, Color, FontHandle, EdgeColor, TRUE ) ;
}

// �������`�悷��
extern int DrawVStringToHandle_WCHAR_T( int x, int y, const wchar_t *String, size_t StringLength, unsigned int Color, int FontHandle, unsigned int EdgeColor )
{
	return DrawStringToHandle_WCHAR_T( x, y, String, StringLength, Color, FontHandle, EdgeColor, TRUE ) ;
}

// �������`�悷��
extern int NS_DrawVStringFToHandle( float x, float y, const TCHAR *String, unsigned int Color, int FontHandle, unsigned int EdgeColor )
{
	return NS_DrawStringFToHandle( x, y, String, Color, FontHandle, EdgeColor, TRUE ) ;
}

// �������`�悷��
extern int NS_DrawNVStringFToHandle( float x, float y, const TCHAR *String, size_t StringLength, unsigned int Color, int FontHandle, unsigned int EdgeColor )
{
	return NS_DrawNStringFToHandle( x, y, String, StringLength, Color, FontHandle, EdgeColor, TRUE ) ;
}

// �������`�悷��
extern int DrawVStringFToHandle_WCHAR_T( float x, float y, const wchar_t *String, size_t StringLength, unsigned int Color, int FontHandle, unsigned int EdgeColor )
{
	return DrawStringFToHandle_WCHAR_T( x, y, String, StringLength, Color, FontHandle, EdgeColor, TRUE ) ;
}

// �����w�蕶�����`�悷��
extern int NS_DrawFormatString( int x, int y, unsigned int Color, const TCHAR *FormatString, ... )
{
	int FontHandle = DX_DEFAULT_FONT_HANDLE ;

	TCHAR_FONTHANDLE_FORMATSTRING_SETUP( -1 )

	return NS_DrawStringToHandle( x, y, String, Color, DX_DEFAULT_FONT_HANDLE, 0, FALSE ) ;
}
extern int NS_DrawFormatString2( int x, int y, unsigned int Color, unsigned int EdgeColor, const TCHAR *FormatString, ... )
{
	int FontHandle = DX_DEFAULT_FONT_HANDLE ;

	TCHAR_FONTHANDLE_FORMATSTRING_SETUP( -1 )

	return NS_DrawStringToHandle( x, y, String, Color, DX_DEFAULT_FONT_HANDLE, EdgeColor, FALSE ) ;
}

// �����w�蕶�����`�悷��
extern int DrawFormatString_WCHAR_T( int x, int y, unsigned int Color, const wchar_t *FormatString, ... )
{
	WCHAR_T_FORMATSTRING_SETUP

	return DrawStringToHandle_WCHAR_T( x, y, String, CL_strlen( WCHAR_T_CHARCODEFORMAT, ( const char * )String ), Color, DX_DEFAULT_FONT_HANDLE, 0, FALSE ) ;
}

// �����w�蕶�����`�悷��
extern int NS_DrawFormatStringF( float x, float y, unsigned int Color, const TCHAR *FormatString, ... )
{
	int FontHandle = DX_DEFAULT_FONT_HANDLE ;

	TCHAR_FONTHANDLE_FORMATSTRING_SETUP( -1 )

	return NS_DrawStringFToHandle( x, y, String, Color, DX_DEFAULT_FONT_HANDLE, 0, FALSE ) ;
}
extern int NS_DrawFormatString2F( float x, float y, unsigned int Color, unsigned int EdgeColor, const TCHAR *FormatString, ... )
{
	int FontHandle = DX_DEFAULT_FONT_HANDLE ;

	TCHAR_FONTHANDLE_FORMATSTRING_SETUP( -1 )

	return NS_DrawStringFToHandle( x, y, String, Color, DX_DEFAULT_FONT_HANDLE, EdgeColor, FALSE ) ;
}

// �����w�蕶�����`�悷��
extern int DrawFormatStringF_WCHAR_T( float x, float y, unsigned int Color, const wchar_t *FormatString, ... )
{
	WCHAR_T_FORMATSTRING_SETUP

	return DrawStringFToHandle_WCHAR_T( x, y, String, CL_strlen( WCHAR_T_CHARCODEFORMAT, ( const char * )String ), Color, DX_DEFAULT_FONT_HANDLE, 0, FALSE ) ;
}

// �����w�蕶�����`�悷��
extern int NS_DrawFormatVString( int x, int y, unsigned int Color, const TCHAR *FormatString, ... )
{
	int FontHandle = DX_DEFAULT_FONT_HANDLE ;

	TCHAR_FONTHANDLE_FORMATSTRING_SETUP( -1 )

	return NS_DrawStringToHandle( x, y, String, Color, DX_DEFAULT_FONT_HANDLE, 0, TRUE ) ;
}
extern int NS_DrawFormatVString2( int x, int y, unsigned int Color, unsigned int EdgeColor, const TCHAR *FormatString, ... )
{
	int FontHandle = DX_DEFAULT_FONT_HANDLE ;

	TCHAR_FONTHANDLE_FORMATSTRING_SETUP( -1 )

	return NS_DrawStringToHandle( x, y, String, Color, DX_DEFAULT_FONT_HANDLE, EdgeColor, TRUE ) ;
}

// �����w�蕶�����`�悷��
extern int DrawFormatVString_WCHAR_T( int x, int y, unsigned int Color, const wchar_t *FormatString, ... )
{
	WCHAR_T_FORMATSTRING_SETUP

	return DrawStringToHandle_WCHAR_T( x, y, String, CL_strlen( WCHAR_T_CHARCODEFORMAT, ( const char * )String ), Color, DX_DEFAULT_FONT_HANDLE, Color, TRUE ) ;
}

// �����w�蕶�����`�悷��
extern int NS_DrawFormatVStringF( float x, float y, unsigned int Color, const TCHAR *FormatString, ... )
{
	int FontHandle = DX_DEFAULT_FONT_HANDLE ;

	TCHAR_FONTHANDLE_FORMATSTRING_SETUP( -1 )

	return NS_DrawStringFToHandle( x, y, String, Color, DX_DEFAULT_FONT_HANDLE, 0, TRUE ) ;
}
extern int NS_DrawFormatVString2F( float x, float y, unsigned int Color, unsigned int EdgeColor, const TCHAR *FormatString, ... )
{
	int FontHandle = DX_DEFAULT_FONT_HANDLE ;

	TCHAR_FONTHANDLE_FORMATSTRING_SETUP( -1 )

	return NS_DrawStringFToHandle( x, y, String, Color, DX_DEFAULT_FONT_HANDLE, EdgeColor, TRUE ) ;
}

// �����w�蕶�����`�悷��
extern int DrawFormatVStringF_WCHAR_T( float x, float y, unsigned int Color, const wchar_t *FormatString, ... )
{
	WCHAR_T_FORMATSTRING_SETUP

	return DrawStringFToHandle_WCHAR_T( x, y, String, CL_strlen( WCHAR_T_CHARCODEFORMAT, ( const char * )String ), Color, DX_DEFAULT_FONT_HANDLE, Color, TRUE ) ;
}

// �����w�蕶�����`�悷��
extern int NS_DrawFormatStringToHandle( int x, int y, unsigned int Color, int FontHandle, const TCHAR *FormatString, ... )
{
	TCHAR_FONTHANDLE_FORMATSTRING_SETUP( -1 )

	// �`�悷��
	return NS_DrawStringToHandle( x, y, String, Color, FontHandle, 0, FALSE ) ;
}
extern int NS_DrawFormatString2ToHandle( int x, int y, unsigned int Color, unsigned int EdgeColor, int FontHandle, const TCHAR *FormatString, ... )
{
	TCHAR_FONTHANDLE_FORMATSTRING_SETUP( -1 )

	// �`�悷��
	return NS_DrawStringToHandle( x, y, String, Color, FontHandle, EdgeColor, FALSE ) ;
}

// �����w�蕶�����`�悷��
extern int DrawFormatStringToHandle_WCHAR_T( int x, int y, unsigned int Color, int FontHandle, const wchar_t *FormatString, ... )
{
	WCHAR_T_FORMATSTRING_SETUP

	// �`�悷��
	return DrawStringToHandle_WCHAR_T( x, y, String, CL_strlen( WCHAR_T_CHARCODEFORMAT, ( const char * )String ), Color, FontHandle, 0, FALSE ) ;
}

// �����w�蕶�����`�悷��
extern int NS_DrawFormatStringFToHandle( float x, float y, unsigned int Color, int FontHandle, const TCHAR *FormatString, ... )
{
	TCHAR_FONTHANDLE_FORMATSTRING_SETUP( -1 )

	// �`�悷��
	return NS_DrawStringFToHandle( x, y, String, Color, FontHandle, 0, FALSE ) ;
}
extern int NS_DrawFormatString2FToHandle( float x, float y, unsigned int Color, unsigned int EdgeColor, int FontHandle, const TCHAR *FormatString, ... )
{
	TCHAR_FONTHANDLE_FORMATSTRING_SETUP( -1 )

	// �`�悷��
	return NS_DrawStringFToHandle( x, y, String, Color, FontHandle, EdgeColor, FALSE ) ;
}

// �����w�蕶�����`�悷��
extern int DrawFormatStringFToHandle_WCHAR_T( float x, float y, unsigned int Color, int FontHandle, const wchar_t *FormatString, ... )
{
	WCHAR_T_FORMATSTRING_SETUP

	// �`�悷��
	return DrawStringFToHandle_WCHAR_T( x, y, String, CL_strlen( WCHAR_T_CHARCODEFORMAT, ( const char * )String ), Color, FontHandle, 0, FALSE ) ;
}

// �����w�蕶�����`�悷��
extern int NS_DrawFormatVStringToHandle( int x, int y, unsigned int Color, int FontHandle, const TCHAR *FormatString, ... )
{
	TCHAR_FONTHANDLE_FORMATSTRING_SETUP( -1 )

	// �`�悷��
	return NS_DrawStringToHandle( x, y, String, Color, FontHandle, 0, TRUE ) ;
}
extern int NS_DrawFormatVString2ToHandle( int x, int y, unsigned int Color, unsigned int EdgeColor, int FontHandle, const TCHAR *FormatString, ... )
{
	TCHAR_FONTHANDLE_FORMATSTRING_SETUP( -1 )

	// �`�悷��
	return NS_DrawStringToHandle( x, y, String, Color, FontHandle, EdgeColor, TRUE ) ;
}

// �����w�蕶�����`�悷��
extern int DrawFormatVStringToHandle_WCHAR_T( int x, int y, unsigned int Color, int FontHandle, const wchar_t *FormatString, ... )
{
	WCHAR_T_FORMATSTRING_SETUP

	// �`�悷��
	return DrawStringToHandle_WCHAR_T( x, y, String, CL_strlen( WCHAR_T_CHARCODEFORMAT, ( const char * )String ), Color, FontHandle, 0, TRUE ) ;
}

// �����w�蕶�����`�悷��
extern int NS_DrawFormatVStringFToHandle( float x, float y, unsigned int Color, int FontHandle, const TCHAR *FormatString, ... )
{
	TCHAR_FONTHANDLE_FORMATSTRING_SETUP( -1 )

	// �`�悷��
	return NS_DrawStringFToHandle( x, y, String, Color, FontHandle, 0, TRUE ) ;
}
extern int NS_DrawFormatVString2FToHandle( float x, float y, unsigned int Color, unsigned int EdgeColor, int FontHandle, const TCHAR *FormatString, ... )
{
	TCHAR_FONTHANDLE_FORMATSTRING_SETUP( -1 )

	// �`�悷��
	return NS_DrawStringFToHandle( x, y, String, Color, FontHandle, EdgeColor, TRUE ) ;
}

// �����w�蕶�����`�悷��
extern int DrawFormatVStringFToHandle_WCHAR_T( float x, float y, unsigned int Color, int FontHandle, const wchar_t *FormatString, ... )
{
	WCHAR_T_FORMATSTRING_SETUP

	// �`�悷��
	return DrawStringFToHandle_WCHAR_T( x, y, String, CL_strlen( WCHAR_T_CHARCODEFORMAT, ( const char * )String ), Color, FontHandle, 0, TRUE ) ;
}


// ��������g��`�悷��
extern int NS_DrawExtendString( int x, int y, double ExRateX, double ExRateY, const TCHAR *String, unsigned int Color, unsigned int EdgeColor )
{
	return NS_DrawExtendStringToHandle( x, y, ExRateX, ExRateY, String, Color, DX_DEFAULT_FONT_HANDLE, EdgeColor, FALSE ) ;
}

// �f�t�H���g�t�H���g�n���h�����g�p���ĕ�����̊g��`��
extern int NS_DrawExtendNString( int x, int y, double ExRateX, double ExRateY, const TCHAR *String, size_t StringLength, unsigned int Color, unsigned int EdgeColor )
{
	return NS_DrawExtendNStringToHandle( x, y, ExRateX, ExRateY, String, StringLength, Color, DX_DEFAULT_FONT_HANDLE, EdgeColor, FALSE ) ;
}

// ��������g��`�悷��
extern int DrawExtendString_WCHAR_T( int x, int y, double ExRateX, double ExRateY, const wchar_t *String, size_t StringLength, unsigned int Color, unsigned int EdgeColor )
{
	return DrawExtendStringToHandle_WCHAR_T( x, y, ExRateX, ExRateY, String, StringLength, Color, DX_DEFAULT_FONT_HANDLE, EdgeColor, FALSE ) ;
}

// ��������g��`�悷��
extern int NS_DrawExtendStringF( float x, float y, double ExRateX, double ExRateY, const TCHAR *String, unsigned int Color, unsigned int EdgeColor )
{
	return NS_DrawExtendStringFToHandle( x, y, ExRateX, ExRateY, String, Color, DX_DEFAULT_FONT_HANDLE, EdgeColor, FALSE ) ;
}

// �f�t�H���g�t�H���g�n���h�����g�p���ĕ�����̊g��`��( ���W�w�肪 float �� )
extern int NS_DrawExtendNStringF( float x, float y, double ExRateX, double ExRateY, const TCHAR *String, size_t StringLength, unsigned int Color, unsigned int EdgeColor )
{
	return NS_DrawExtendNStringFToHandle( x, y, ExRateX, ExRateY, String, StringLength, Color, DX_DEFAULT_FONT_HANDLE, EdgeColor, FALSE ) ;
}

// ��������g��`�悷��
extern int DrawExtendStringF_WCHAR_T( float x, float y, double ExRateX, double ExRateY, const wchar_t *String, size_t StringLength, unsigned int Color, unsigned int EdgeColor )
{
	return DrawExtendStringFToHandle_WCHAR_T( x, y, ExRateX, ExRateY, String, StringLength, Color, DX_DEFAULT_FONT_HANDLE, EdgeColor, FALSE ) ;
}

// ��������g��`�悷��
extern int NS_DrawExtendVString( int x, int y, double ExRateX, double ExRateY, const TCHAR *String, unsigned int Color, unsigned int EdgeColor )
{
	return NS_DrawExtendStringToHandle( x, y, ExRateX, ExRateY, String, Color, DX_DEFAULT_FONT_HANDLE, EdgeColor, TRUE ) ;
}

// ��������g��`�悷��
extern int NS_DrawExtendNVString( int x, int y, double ExRateX, double ExRateY, const TCHAR *String, size_t StringLength, unsigned int Color, unsigned int EdgeColor )
{
	return NS_DrawExtendNStringToHandle( x, y, ExRateX, ExRateY, String, StringLength, Color, DX_DEFAULT_FONT_HANDLE, EdgeColor, TRUE ) ;
}

// ��������g��`�悷��
extern int DrawExtendVString_WCHAR_T( int x, int y, double ExRateX, double ExRateY, const wchar_t *String, size_t StringLength, unsigned int Color, unsigned int EdgeColor )
{
	return DrawExtendStringToHandle_WCHAR_T( x, y, ExRateX, ExRateY, String, StringLength, Color, DX_DEFAULT_FONT_HANDLE, EdgeColor, TRUE ) ;
}

// ��������g��`�悷��
extern int NS_DrawExtendVStringF( float x, float y, double ExRateX, double ExRateY, const TCHAR *String, unsigned int Color, unsigned int EdgeColor )
{
	return NS_DrawExtendStringFToHandle( x, y, ExRateX, ExRateY, String, Color, DX_DEFAULT_FONT_HANDLE, EdgeColor, TRUE ) ;
}

// ��������g��`�悷��
extern int NS_DrawExtendNVStringF( float x, float y, double ExRateX, double ExRateY, const TCHAR *String, size_t StringLength, unsigned int Color, unsigned int EdgeColor )
{
	return NS_DrawExtendNStringFToHandle( x, y, ExRateX, ExRateY, String, StringLength, Color, DX_DEFAULT_FONT_HANDLE, EdgeColor, TRUE ) ;
}

// ��������g��`�悷��
extern int DrawExtendVStringF_WCHAR_T( float x, float y, double ExRateX, double ExRateY, const wchar_t *String, size_t StringLength, unsigned int Color, unsigned int EdgeColor )
{
	return DrawExtendStringFToHandle_WCHAR_T( x, y, ExRateX, ExRateY, String, StringLength, Color, DX_DEFAULT_FONT_HANDLE, EdgeColor, TRUE ) ;
}

// ��������g��`�悷��
#define SETDRAWRECTCODE\
	if( VerticalFlag )\
	{\
		SETRECT( DrawRect, x, y, x + _DTOL( font->BaseInfo.FontHeight * ExRateY ) + 3, GSYS.DrawSetting.DrawArea.bottom ) ;\
		if( DrawRect.left >= GSYS.DrawSetting.DrawArea.right ) return 0 ;\
	}\
	else\
	{\
		SETRECT( DrawRect, x, y, GSYS.DrawSetting.DrawArea.right, y + _DTOL( font->BaseInfo.FontHeight * ExRateY ) + 3 ) ;\
		if( DrawRect.left >= GSYS.DrawSetting.DrawArea.right ) return 0 ;\
	}

extern int NS_DrawExtendStringToHandle( int x, int y, double ExRateX, double ExRateY, const TCHAR *String, unsigned int Color, int FontHandle, unsigned int EdgeColor, int VerticalFlag )
{
#ifdef UNICODE
	return DrawExtendStringToHandle_WCHAR_T( x, y, ExRateX, ExRateY, String, CL_strlen( WCHAR_T_CHARCODEFORMAT, ( const char * )String ), Color, FontHandle, EdgeColor, VerticalFlag ) ;
#else
	int Result ;

	FONTHANDLE_TCHAR_TO_WCHAR_T_STRING_BEGIN( String, -1 )

	Result = DrawExtendStringToHandle_WCHAR_T( x, y, ExRateX, ExRateY, UseStringBuffer, wchar_StrLength, Color, FontHandle, EdgeColor, VerticalFlag ) ;

	FONTHANDLE_TCHAR_TO_WCHAR_T_STRING_END

	return Result ;
#endif
}

extern int NS_DrawExtendNStringToHandle( int x, int y, double ExRateX, double ExRateY, const TCHAR *String, size_t StringLength, unsigned int Color, int FontHandle, unsigned int EdgeColor, int VerticalFlag )
{
#ifdef UNICODE
	return DrawExtendStringToHandle_WCHAR_T( x, y, ExRateX, ExRateY, String, StringLength, Color, FontHandle, EdgeColor, VerticalFlag ) ;
#else
	int Result ;

	FONTHANDLE_TCHAR_WITH_STRLENGTH_TO_WCHAR_T_STRING_BEGIN( String, StringLength, -1 )

	Result = DrawExtendStringToHandle_WCHAR_T( x, y, ExRateX, ExRateY, UseStringBuffer, wchar_StrLength, Color, FontHandle, EdgeColor, VerticalFlag ) ;

	FONTHANDLE_TCHAR_TO_WCHAR_T_STRING_END

	return Result ;
#endif
}

extern int DrawExtendStringToHandle_WCHAR_T( int x, int y, double ExRateX, double ExRateY, const wchar_t *String, size_t StringLength, unsigned int Color, int FontHandle, unsigned int EdgeColor, int VerticalFlag )
{
#ifndef DX_NON_GRAPHICS
	int Ret = -1 ;
	FONTMANAGE *font ;

//	DEFAULT_FONT_HANDLE_SETUP

	if( String == NULL || String[0] == L'\0' || StringLength == 0 ||
		/* GSYS.NotDrawFlag || */ GSYS.DrawSetting.NotDrawFlagInSetDrawArea )
	{
		return 0 ;
	}

	CheckActiveState() ;

	font = GetFontManageDataToHandle_Inline( FontHandle ) ;
	if( font == NULL )
	{
		DXST_LOGFILE_ADDUTF16LE( "\xd5\x30\xa9\x30\xf3\x30\xc8\x30\xcf\x30\xf3\x30\xc9\x30\xeb\x30\x24\x50\x4c\x30\x70\x75\x38\x5e\x67\x30\x59\x30\x0a\x00\x00"/*@ L"�t�H���g�n���h���l���ُ�ł�\n" @*/ ) ;
		return Ret ;
	}

	// �Q�c�s����n�[�h�E�G�A�ɔ��f����
	if( GSYS.DrawSetting.MatchHardware_2DMatrix == FALSE && GSYS.Setting.ValidHardware && GSYS.Screen.UserScreenImagePixelFormatMatchSoftRenderMode == FALSE )
		Graphics_DrawSetting_ApplyLib2DMatrixToHardware() ;

	// �`��
	DRAW_DEF(
		DrawExtendStringHardware( x, y, ( float )x, ( float )y, TRUE, ExRateX, ExRateY, String, StringLength, Color, font, EdgeColor, VerticalFlag ),
		DrawExtendStringSoftware( x, y,                               ExRateX, ExRateY, String, StringLength, Color, font, EdgeColor, VerticalFlag ),
		SETDRAWRECTCODE,
		Ret,
		font->TextureCacheFlag
	)

	// �I��
	return Ret ;
#else // DX_NON_GRAPHICS
	return -1 ;
#endif // DX_NON_GRAPHICS
}

#undef SETDRAWRECTCODE



// ��������g��`�悷��
#define SETDRAWRECTCODE\
	if( VerticalFlag )\
	{\
		SETRECT( DrawRect, _FTOL( x ), _FTOL( y ), _FTOL( x ) + _DTOL( font->BaseInfo.FontHeight * ExRateY ) + 3, GSYS.DrawSetting.DrawArea.bottom ) ;\
		if( DrawRect.left >= GSYS.DrawSetting.DrawArea.right ) return 0 ;\
	}\
	else\
	{\
		SETRECT( DrawRect, _FTOL( x ), _FTOL( y ), GSYS.DrawSetting.DrawArea.right, _FTOL( y ) + _DTOL( font->BaseInfo.FontHeight * ExRateY ) + 3 ) ;\
		if( DrawRect.left >= GSYS.DrawSetting.DrawArea.right ) return 0 ;\
	}

extern int NS_DrawExtendStringFToHandle( float x, float y, double ExRateX, double ExRateY, const TCHAR *String, unsigned int Color, int FontHandle, unsigned int EdgeColor, int VerticalFlag )
{
#ifdef UNICODE
	return DrawExtendStringFToHandle_WCHAR_T( x, y, ExRateX, ExRateY, String, CL_strlen( WCHAR_T_CHARCODEFORMAT, ( const char * )String ), Color, FontHandle, EdgeColor, VerticalFlag ) ;
#else
	int Result ;

	FONTHANDLE_TCHAR_TO_WCHAR_T_STRING_BEGIN( String, -1 )

	Result = DrawExtendStringFToHandle_WCHAR_T( x, y, ExRateX, ExRateY, UseStringBuffer, wchar_StrLength, Color, FontHandle, EdgeColor, VerticalFlag ) ;

	FONTHANDLE_TCHAR_TO_WCHAR_T_STRING_END

	return Result ;
#endif
}

extern int NS_DrawExtendNStringFToHandle( float x, float y, double ExRateX, double ExRateY, const TCHAR *String, size_t StringLength, unsigned int Color, int FontHandle, unsigned int EdgeColor, int VerticalFlag )
{
#ifdef UNICODE
	return DrawExtendStringFToHandle_WCHAR_T( x, y, ExRateX, ExRateY, String, StringLength, Color, FontHandle, EdgeColor, VerticalFlag ) ;
#else
	int Result ;

	FONTHANDLE_TCHAR_WITH_STRLENGTH_TO_WCHAR_T_STRING_BEGIN( String, StringLength, -1 )

	Result = DrawExtendStringFToHandle_WCHAR_T( x, y, ExRateX, ExRateY, UseStringBuffer, wchar_StrLength, Color, FontHandle, EdgeColor, VerticalFlag ) ;

	FONTHANDLE_TCHAR_TO_WCHAR_T_STRING_END

	return Result ;
#endif
}

extern int DrawExtendStringFToHandle_WCHAR_T( float x, float y, double ExRateX, double ExRateY, const wchar_t *String, size_t StringLength, unsigned int Color, int FontHandle, unsigned int EdgeColor, int VerticalFlag )
{
#ifndef DX_NON_GRAPHICS
	int Ret = -1 ;
	FONTMANAGE *font ;

//	DEFAULT_FONT_HANDLE_SETUP

	if( String == NULL || String[0] == L'\0' || StringLength == 0 ||
		/* GSYS.NotDrawFlag || */ GSYS.DrawSetting.NotDrawFlagInSetDrawArea )
	{
		return 0 ;
	}

	CheckActiveState() ;

	font = GetFontManageDataToHandle_Inline( FontHandle ) ;
	if( font == NULL )
	{
		DXST_LOGFILE_ADDUTF16LE( "\xd5\x30\xa9\x30\xf3\x30\xc8\x30\xcf\x30\xf3\x30\xc9\x30\xeb\x30\x24\x50\x4c\x30\x70\x75\x38\x5e\x67\x30\x59\x30\x0a\x00\x00"/*@ L"�t�H���g�n���h���l���ُ�ł�\n" @*/ ) ;
		return Ret ;
	}

	// �Q�c�s����n�[�h�E�G�A�ɔ��f����
	if( GSYS.DrawSetting.MatchHardware_2DMatrix == FALSE && GSYS.Setting.ValidHardware && GSYS.Screen.UserScreenImagePixelFormatMatchSoftRenderMode == FALSE )
		Graphics_DrawSetting_ApplyLib2DMatrixToHardware() ;

	// �`��
	DRAW_DEF(
		DrawExtendStringHardware( _FTOL( x ), _FTOL( y ), x, y, FALSE, ExRateX, ExRateY, String, StringLength, Color, font, EdgeColor, VerticalFlag ),
		DrawExtendStringSoftware( _FTOL( x ), _FTOL( y ),              ExRateX, ExRateY, String, StringLength, Color, font, EdgeColor, VerticalFlag ),
		SETDRAWRECTCODE,
		Ret,
		font->TextureCacheFlag
	)

	// �I��
	return Ret ;
#else // DX_NON_GRAPHICS
	return -1 ;
#endif // DX_NON_GRAPHICS
}

#undef SETDRAWRECTCODE



// ��������g��`�悷��
extern int NS_DrawExtendVStringToHandle( int x, int y, double ExRateX, double ExRateY, const TCHAR *String, unsigned int Color, int FontHandle, unsigned int EdgeColor )
{
	return NS_DrawExtendStringToHandle( x, y, ExRateX, ExRateY, String, Color, FontHandle, EdgeColor, TRUE ) ;
}

// ��������g��`�悷��
extern int NS_DrawExtendNVStringToHandle( int x, int y, double ExRateX, double ExRateY, const TCHAR *String, size_t StringLength, unsigned int Color, int FontHandle, unsigned int EdgeColor )
{
	return NS_DrawExtendNStringToHandle( x, y, ExRateX, ExRateY, String, StringLength, Color, FontHandle, EdgeColor, TRUE ) ;
}

// ��������g��`�悷��
extern int DrawExtendVStringToHandle_WCHAR_T( int x, int y, double ExRateX, double ExRateY, const wchar_t *String, size_t StringLength, unsigned int Color, int FontHandle, unsigned int EdgeColor )
{
	return DrawExtendStringToHandle_WCHAR_T( x, y, ExRateX, ExRateY, String, StringLength, Color, FontHandle, EdgeColor, TRUE ) ;
}

// ��������g��`�悷��
extern int NS_DrawExtendVStringFToHandle( float x, float y, double ExRateX, double ExRateY, const TCHAR *String, unsigned int Color, int FontHandle, unsigned int EdgeColor )
{
	return NS_DrawExtendStringFToHandle( x, y, ExRateX, ExRateY, String, Color, FontHandle, EdgeColor, TRUE ) ;
}

// ��������g��`�悷��
extern int NS_DrawExtendNVStringFToHandle( float x, float y, double ExRateX, double ExRateY, const TCHAR *String, size_t StringLength, unsigned int Color, int FontHandle, unsigned int EdgeColor )
{
	return NS_DrawExtendNStringFToHandle( x, y, ExRateX, ExRateY, String, StringLength, Color, FontHandle, EdgeColor, TRUE ) ;
}

// ��������g��`�悷��
extern int DrawExtendVStringFToHandle_WCHAR_T( float x, float y, double ExRateX, double ExRateY, const wchar_t *String, size_t StringLength, unsigned int Color, int FontHandle, unsigned int EdgeColor )
{
	return DrawExtendStringFToHandle_WCHAR_T( x, y, ExRateX, ExRateY, String, StringLength, Color, FontHandle, EdgeColor, TRUE ) ;
}

// �����w�蕶������g��`�悷��
extern int NS_DrawExtendFormatString( int x, int y, double ExRateX, double ExRateY, unsigned int Color, const TCHAR *FormatString, ... )
{
	int FontHandle = DX_DEFAULT_FONT_HANDLE ;

	TCHAR_FONTHANDLE_FORMATSTRING_SETUP( -1 )

	return NS_DrawExtendStringToHandle( x, y, ExRateX, ExRateY, String, Color, DX_DEFAULT_FONT_HANDLE, 0, FALSE ) ;
}
extern int NS_DrawExtendFormatString2( int x, int y, double ExRateX, double ExRateY, unsigned int Color, unsigned int EdgeColor, const TCHAR *FormatString, ... )
{
	int FontHandle = DX_DEFAULT_FONT_HANDLE ;

	TCHAR_FONTHANDLE_FORMATSTRING_SETUP( -1 )

	return NS_DrawExtendStringToHandle( x, y, ExRateX, ExRateY, String, Color, DX_DEFAULT_FONT_HANDLE, EdgeColor, FALSE ) ;
}

// �����w�蕶������g��`�悷��
extern int DrawExtendFormatString_WCHAR_T( int x, int y, double ExRateX, double ExRateY, unsigned int Color, const wchar_t *FormatString, ... )
{
	WCHAR_T_FORMATSTRING_SETUP

	return DrawExtendStringToHandle_WCHAR_T( x, y, ExRateX, ExRateY, String, CL_strlen( WCHAR_T_CHARCODEFORMAT, ( const char * )String ), Color, DX_DEFAULT_FONT_HANDLE, 0, FALSE ) ;
}

// �����w�蕶������g��`�悷��
extern int NS_DrawExtendFormatStringF( float x, float y, double ExRateX, double ExRateY, unsigned int Color, const TCHAR *FormatString, ... )
{
	int FontHandle = DX_DEFAULT_FONT_HANDLE ;

	TCHAR_FONTHANDLE_FORMATSTRING_SETUP( -1 )

	return NS_DrawExtendStringFToHandle( x, y, ExRateX, ExRateY, String, Color, DX_DEFAULT_FONT_HANDLE, 0, FALSE ) ;
}
extern int NS_DrawExtendFormatString2F( float x, float y, double ExRateX, double ExRateY, unsigned int Color, unsigned int EdgeColor, const TCHAR *FormatString, ... )
{
	int FontHandle = DX_DEFAULT_FONT_HANDLE ;

	TCHAR_FONTHANDLE_FORMATSTRING_SETUP( -1 )

	return NS_DrawExtendStringFToHandle( x, y, ExRateX, ExRateY, String, Color, DX_DEFAULT_FONT_HANDLE, EdgeColor, FALSE ) ;
}

// �����w�蕶������g��`�悷��
extern int DrawExtendFormatStringF_WCHAR_T( float x, float y, double ExRateX, double ExRateY, unsigned int Color, const wchar_t *FormatString, ... )
{
	WCHAR_T_FORMATSTRING_SETUP

	return DrawExtendStringFToHandle_WCHAR_T( x, y, ExRateX, ExRateY, String, CL_strlen( WCHAR_T_CHARCODEFORMAT, ( const char * )String ), Color, DX_DEFAULT_FONT_HANDLE, 0, FALSE ) ;
}

// �����w�蕶������g��`�悷��
extern int NS_DrawExtendFormatVString( int x, int y, double ExRateX, double ExRateY, unsigned int Color, const TCHAR *FormatString, ... )
{
	int FontHandle = DX_DEFAULT_FONT_HANDLE ;

	TCHAR_FONTHANDLE_FORMATSTRING_SETUP( -1 )

	return NS_DrawExtendStringToHandle( x, y, ExRateX, ExRateY, String, Color, DX_DEFAULT_FONT_HANDLE, 0, TRUE ) ;
}
extern int NS_DrawExtendFormatVString2( int x, int y, double ExRateX, double ExRateY, unsigned int Color, unsigned int EdgeColor, const TCHAR *FormatString, ... )
{
	int FontHandle = DX_DEFAULT_FONT_HANDLE ;

	TCHAR_FONTHANDLE_FORMATSTRING_SETUP( -1 )

	return NS_DrawExtendStringToHandle( x, y, ExRateX, ExRateY, String, Color, DX_DEFAULT_FONT_HANDLE, EdgeColor, TRUE ) ;
}

// �����w�蕶������g��`�悷��
extern int DrawExtendFormatVString_WCHAR_T( int x, int y, double ExRateX, double ExRateY, unsigned int Color, const wchar_t *FormatString, ... )
{
	WCHAR_T_FORMATSTRING_SETUP

	return DrawExtendStringToHandle_WCHAR_T( x, y, ExRateX, ExRateY, String, CL_strlen( WCHAR_T_CHARCODEFORMAT, ( const char * )String ), Color, DX_DEFAULT_FONT_HANDLE, Color, TRUE ) ;
}

// �����w�蕶������g��`�悷��
extern int NS_DrawExtendFormatVStringF( float x, float y, double ExRateX, double ExRateY, unsigned int Color, const TCHAR *FormatString, ... )
{
	int FontHandle = DX_DEFAULT_FONT_HANDLE ;

	TCHAR_FONTHANDLE_FORMATSTRING_SETUP( -1 )

	return NS_DrawExtendStringFToHandle( x, y, ExRateX, ExRateY, String, Color, DX_DEFAULT_FONT_HANDLE, 0, TRUE ) ;
}
extern int NS_DrawExtendFormatVString2F( float x, float y, double ExRateX, double ExRateY, unsigned int Color, unsigned int EdgeColor, const TCHAR *FormatString, ... )
{
	int FontHandle = DX_DEFAULT_FONT_HANDLE ;

	TCHAR_FONTHANDLE_FORMATSTRING_SETUP( -1 )

	return NS_DrawExtendStringFToHandle( x, y, ExRateX, ExRateY, String, Color, DX_DEFAULT_FONT_HANDLE, EdgeColor, TRUE ) ;
}

// �����w�蕶������g��`�悷��
extern int DrawExtendFormatVStringF_WCHAR_T( float x, float y, double ExRateX, double ExRateY, unsigned int Color, const wchar_t *FormatString, ... )
{
	WCHAR_T_FORMATSTRING_SETUP

	return DrawExtendStringFToHandle_WCHAR_T( x, y, ExRateX, ExRateY, String, CL_strlen( WCHAR_T_CHARCODEFORMAT, ( const char * )String ), Color, DX_DEFAULT_FONT_HANDLE, Color, TRUE ) ;
}

// �����w�蕶������g��`�悷��
extern int NS_DrawExtendFormatStringToHandle( int x, int y, double ExRateX, double ExRateY, unsigned int Color, int FontHandle, const TCHAR *FormatString, ... )
{
	TCHAR_FONTHANDLE_FORMATSTRING_SETUP( -1 )

	// �`�悷��
	return NS_DrawExtendStringToHandle( x, y, ExRateX, ExRateY, String, Color, FontHandle, 0, FALSE ) ;
}
extern int NS_DrawExtendFormatString2ToHandle( int x, int y, double ExRateX, double ExRateY, unsigned int Color, unsigned int EdgeColor, int FontHandle, const TCHAR *FormatString, ... )
{
	TCHAR_FONTHANDLE_FORMATSTRING_SETUP( -1 )

	// �`�悷��
	return NS_DrawExtendStringToHandle( x, y, ExRateX, ExRateY, String, Color, FontHandle, EdgeColor, FALSE ) ;
}

// �����w�蕶������g��`�悷��
extern int DrawExtendFormatStringToHandle_WCHAR_T( int x, int y, double ExRateX, double ExRateY, unsigned int Color, int FontHandle, const wchar_t *FormatString, ... )
{
	WCHAR_T_FORMATSTRING_SETUP

	// �`�悷��
	return DrawExtendStringToHandle_WCHAR_T( x, y, ExRateX, ExRateY, String, CL_strlen( WCHAR_T_CHARCODEFORMAT, ( const char * )String ), Color, FontHandle, 0, FALSE ) ;
}

// �����w�蕶������g��`�悷��
extern int NS_DrawExtendFormatStringFToHandle( float x, float y, double ExRateX, double ExRateY, unsigned int Color, int FontHandle, const TCHAR *FormatString, ... )
{
	TCHAR_FONTHANDLE_FORMATSTRING_SETUP( -1 )

	// �`�悷��
	return NS_DrawExtendStringFToHandle( x, y, ExRateX, ExRateY, String, Color, FontHandle, 0, FALSE ) ;
}
extern int NS_DrawExtendFormatString2FToHandle( float x, float y, double ExRateX, double ExRateY, unsigned int Color, unsigned int EdgeColor, int FontHandle, const TCHAR *FormatString, ... )
{
	TCHAR_FONTHANDLE_FORMATSTRING_SETUP( -1 )

	// �`�悷��
	return NS_DrawExtendStringFToHandle( x, y, ExRateX, ExRateY, String, Color, FontHandle, EdgeColor, FALSE ) ;
}

// �����w�蕶������g��`�悷��
extern int DrawExtendFormatStringFToHandle_WCHAR_T( float x, float y, double ExRateX, double ExRateY, unsigned int Color, int FontHandle, const wchar_t *FormatString, ... )
{
	WCHAR_T_FORMATSTRING_SETUP

	// �`�悷��
	return DrawExtendStringFToHandle_WCHAR_T( x, y, ExRateX, ExRateY, String, CL_strlen( WCHAR_T_CHARCODEFORMAT, ( const char * )String ), Color, FontHandle, 0, FALSE ) ;
}

// �����w�蕶������g��`�悷��
extern int NS_DrawExtendFormatVStringToHandle( int x, int y, double ExRateX, double ExRateY, unsigned int Color, int FontHandle, const TCHAR *FormatString, ... )
{
	TCHAR_FONTHANDLE_FORMATSTRING_SETUP( -1 )

	// �`�悷��
	return NS_DrawExtendStringToHandle( x, y, ExRateX, ExRateY, String, Color, FontHandle, 0, TRUE ) ;
}
extern int NS_DrawExtendFormatVString2ToHandle( int x, int y, double ExRateX, double ExRateY, unsigned int Color, unsigned int EdgeColor, int FontHandle, const TCHAR *FormatString, ... )
{
	TCHAR_FONTHANDLE_FORMATSTRING_SETUP( -1 )

	// �`�悷��
	return NS_DrawExtendStringToHandle( x, y, ExRateX, ExRateY, String, Color, FontHandle, EdgeColor, TRUE ) ;
}

// �����w�蕶������g��`�悷��
extern int DrawExtendFormatVStringToHandle_WCHAR_T( int x, int y, double ExRateX, double ExRateY, unsigned int Color, int FontHandle, const wchar_t *FormatString, ... )
{
	WCHAR_T_FORMATSTRING_SETUP

	// �`�悷��
	return DrawExtendStringToHandle_WCHAR_T( x, y, ExRateX, ExRateY, String, CL_strlen( WCHAR_T_CHARCODEFORMAT, ( const char * )String ), Color, FontHandle, 0, TRUE ) ;
}

// �����w�蕶������g��`�悷��
extern int NS_DrawExtendFormatVStringFToHandle( float x, float y, double ExRateX, double ExRateY, unsigned int Color, int FontHandle, const TCHAR *FormatString, ... )
{
	TCHAR_FONTHANDLE_FORMATSTRING_SETUP( -1 )

	// �`�悷��
	return NS_DrawExtendStringFToHandle( x, y, ExRateX, ExRateY, String, Color, FontHandle, 0, TRUE ) ;
}
extern int NS_DrawExtendFormatVString2FToHandle( float x, float y, double ExRateX, double ExRateY, unsigned int Color, unsigned int EdgeColor, int FontHandle, const TCHAR *FormatString, ... )
{
	TCHAR_FONTHANDLE_FORMATSTRING_SETUP( -1 )

	// �`�悷��
	return NS_DrawExtendStringFToHandle( x, y, ExRateX, ExRateY, String, Color, FontHandle, EdgeColor, TRUE ) ;
}

// �����w�蕶������g��`�悷��
extern int DrawExtendFormatVStringFToHandle_WCHAR_T( float x, float y, double ExRateX, double ExRateY, unsigned int Color, int FontHandle, const wchar_t *FormatString, ... )
{
	WCHAR_T_FORMATSTRING_SETUP

	// �`�悷��
	return DrawExtendStringFToHandle_WCHAR_T( x, y, ExRateX, ExRateY, String, CL_strlen( WCHAR_T_CHARCODEFORMAT, ( const char * )String ), Color, FontHandle, 0, TRUE ) ;
}



// �f�t�H���g�t�H���g�n���h�����g�p���ĕ��������]�`�悷��
extern int NS_DrawRotaString( int x, int y, double ExRateX, double ExRateY, double RotCenterX, double RotCenterY, double RotAngle, unsigned int Color, unsigned int EdgeColor , int VerticalFlag , const TCHAR *String )
{
	return NS_DrawRotaStringToHandle( x, y, ExRateX,  ExRateY, RotCenterX, RotCenterY, RotAngle, Color, DX_DEFAULT_FONT_HANDLE, EdgeColor, VerticalFlag, String ) ;
}

// �f�t�H���g�t�H���g�n���h�����g�p���ĕ��������]�`�悷��
extern int NS_DrawRotaNString( int x, int y, double ExRateX, double ExRateY, double RotCenterX, double RotCenterY, double RotAngle, unsigned int Color, unsigned int EdgeColor , int VerticalFlag , const TCHAR *String, size_t StringLength )
{
	return NS_DrawRotaNStringToHandle( x, y, ExRateX,  ExRateY, RotCenterX, RotCenterY, RotAngle, Color, DX_DEFAULT_FONT_HANDLE, EdgeColor, VerticalFlag, String, StringLength ) ;
}

// �f�t�H���g�t�H���g�n���h�����g�p���ĕ��������]�`�悷��
extern int DrawRotaString_WCHAR_T( int x, int y, double ExRateX, double ExRateY, double RotCenterX, double RotCenterY, double RotAngle, unsigned int Color, unsigned int EdgeColor , int VerticalFlag , const wchar_t *String, size_t StringLength )
{
	return DrawRotaStringToHandle_WCHAR_T( x, y, ExRateX,  ExRateY, RotCenterX, RotCenterY, RotAngle, Color, DX_DEFAULT_FONT_HANDLE, EdgeColor, VerticalFlag, String, StringLength ) ;
}

// �f�t�H���g�t�H���g�n���h�����g�p���ĕ��������]�`�悷��
extern int NS_DrawRotaStringF( float x, float y, double ExRateX, double ExRateY, double RotCenterX, double RotCenterY, double RotAngle, unsigned int Color, unsigned int EdgeColor , int VerticalFlag , const TCHAR *String )
{
	return NS_DrawRotaStringFToHandle( x, y, ExRateX,  ExRateY, RotCenterX, RotCenterY, RotAngle, Color, DX_DEFAULT_FONT_HANDLE, EdgeColor, VerticalFlag, String ) ;
}

// �f�t�H���g�t�H���g�n���h�����g�p���ĕ��������]�`�悷��
extern int NS_DrawRotaNStringF( float x, float y, double ExRateX, double ExRateY, double RotCenterX, double RotCenterY, double RotAngle, unsigned int Color, unsigned int EdgeColor , int VerticalFlag , const TCHAR *String, size_t StringLength )
{
	return NS_DrawRotaNStringFToHandle( x, y, ExRateX,  ExRateY, RotCenterX, RotCenterY, RotAngle, Color, DX_DEFAULT_FONT_HANDLE, EdgeColor, VerticalFlag, String, StringLength ) ;
}

// �f�t�H���g�t�H���g�n���h�����g�p���ĕ��������]�`�悷��
extern int DrawRotaStringF_WCHAR_T( float x, float y, double ExRateX, double ExRateY, double RotCenterX, double RotCenterY, double RotAngle, unsigned int Color, unsigned int EdgeColor , int VerticalFlag , const wchar_t *String, size_t StringLength )
{
	return DrawRotaStringFToHandle_WCHAR_T( x, y, ExRateX,  ExRateY, RotCenterX, RotCenterY, RotAngle, Color, DX_DEFAULT_FONT_HANDLE, EdgeColor, VerticalFlag, String, StringLength ) ;
}

// �f�t�H���g�t�H���g�n���h�����g�p���ĕ��������]�`�悷��
#define SETDRAWRECTCODE\
	DrawRect = GSYS.DrawSetting.DrawArea ;

extern int NS_DrawRotaStringToHandle( int x, int y, double ExRateX, double ExRateY, double RotCenterX, double RotCenterY, double RotAngle, unsigned int Color, int FontHandle, unsigned int EdgeColor , int VerticalFlag , const TCHAR *String )
{
#ifdef UNICODE
	return DrawRotaStringToHandle_WCHAR_T( x, y, ExRateX,  ExRateY, RotCenterX, RotCenterY, RotAngle, Color, FontHandle, EdgeColor, VerticalFlag , String, CL_strlen( WCHAR_T_CHARCODEFORMAT, ( const char * )String ) ) ;
#else
	int Result ;

	FONTHANDLE_TCHAR_TO_WCHAR_T_STRING_BEGIN( String, -1 )

	Result = DrawRotaStringToHandle_WCHAR_T( x, y, ExRateX,  ExRateY, RotCenterX, RotCenterY, RotAngle, Color, FontHandle, EdgeColor, VerticalFlag , UseStringBuffer, wchar_StrLength ) ;

	FONTHANDLE_TCHAR_TO_WCHAR_T_STRING_END

	return Result ;
#endif
}

extern int NS_DrawRotaNStringToHandle( int x, int y, double ExRateX, double ExRateY, double RotCenterX, double RotCenterY, double RotAngle, unsigned int Color, int FontHandle, unsigned int EdgeColor , int VerticalFlag , const TCHAR *String, size_t StringLength )
{
#ifdef UNICODE
	return DrawRotaStringToHandle_WCHAR_T( x, y, ExRateX,  ExRateY, RotCenterX, RotCenterY, RotAngle, Color, FontHandle, EdgeColor, VerticalFlag , String, StringLength ) ;
#else
	int Result ;

	FONTHANDLE_TCHAR_WITH_STRLENGTH_TO_WCHAR_T_STRING_BEGIN( String, StringLength, -1 )

	Result = DrawRotaStringToHandle_WCHAR_T( x, y, ExRateX,  ExRateY, RotCenterX, RotCenterY, RotAngle, Color, FontHandle, EdgeColor, VerticalFlag , UseStringBuffer, wchar_StrLength ) ;

	FONTHANDLE_TCHAR_TO_WCHAR_T_STRING_END

	return Result ;
#endif
}

extern int DrawRotaStringToHandle_WCHAR_T( int x, int y, double ExRateX, double ExRateY, double RotCenterX, double RotCenterY, double RotAngle, unsigned int Color, int FontHandle, unsigned int EdgeColor , int VerticalFlag , const wchar_t *String, size_t StringLength )
{
#ifndef DX_NON_GRAPHICS
	int Ret = -1 ;
	int Flag ;
	FONTMANAGE *font ;

//	DEFAULT_FONT_HANDLE_SETUP

	if( String == NULL || String[0] == L'\0' || StringLength == 0 ||
		/* GSYS.NotDrawFlag || */ GSYS.DrawSetting.NotDrawFlagInSetDrawArea )
	{
		return 0 ;
	}

	CheckActiveState() ;

	font = GetFontManageDataToHandle_Inline( FontHandle ) ;
	if( font == NULL )
	{
		DXST_LOGFILE_ADDUTF16LE( "\xd5\x30\xa9\x30\xf3\x30\xc8\x30\xcf\x30\xf3\x30\xc9\x30\xeb\x30\x24\x50\x4c\x30\x70\x75\x38\x5e\x67\x30\x59\x30\x0a\x00\x00"/*@ L"�t�H���g�n���h���l���ُ�ł�\n" @*/ ) ;
		return Ret ;
	}

	Flag = font->TextureCacheFlag ;

	// �Q�c�s����n�[�h�E�G�A�ɔ��f����
	if( GSYS.DrawSetting.MatchHardware_2DMatrix == FALSE && GSYS.Setting.ValidHardware && GSYS.Screen.UserScreenImagePixelFormatMatchSoftRenderMode == FALSE )
		Graphics_DrawSetting_ApplyLib2DMatrixToHardware() ;

	// �`��
	DRAW_DEF(
		DrawRotaStringHardware( x, y, 0, 0, TRUE, ExRateX, ExRateY, RotCenterX, RotCenterY, RotAngle, String, StringLength, Color, font, EdgeColor, VerticalFlag ),
		DrawRotaStringSoftware( x, y,             ExRateX, ExRateY, RotCenterX, RotCenterY, RotAngle, String, StringLength, Color, font, EdgeColor, VerticalFlag ),
		SETDRAWRECTCODE,
		Ret,
		Flag
	)

	// �I��
	return Ret ;
#else // DX_NON_GRAPHICS
	return -1 ;
#endif // DX_NON_GRAPHICS
}

#undef SETDRAWRECTCODE

// �f�t�H���g�t�H���g�n���h�����g�p���ĕ��������]�`�悷��
#define SETDRAWRECTCODE\
	DrawRect = GSYS.DrawSetting.DrawArea ;

extern int NS_DrawRotaStringFToHandle( float x, float y, double ExRateX, double ExRateY, double RotCenterX, double RotCenterY, double RotAngle, unsigned int Color, int FontHandle, unsigned int EdgeColor , int VerticalFlag , const TCHAR *String )
{
#ifdef UNICODE
	return DrawRotaStringFToHandle_WCHAR_T( x, y, ExRateX,  ExRateY, RotCenterX, RotCenterY, RotAngle, Color, FontHandle, EdgeColor, VerticalFlag , String, CL_strlen( WCHAR_T_CHARCODEFORMAT, ( const char * )String ) ) ;
#else
	int Result ;

	FONTHANDLE_TCHAR_TO_WCHAR_T_STRING_BEGIN( String, -1 )

	Result = DrawRotaStringFToHandle_WCHAR_T( x, y, ExRateX,  ExRateY, RotCenterX, RotCenterY, RotAngle, Color, FontHandle, EdgeColor, VerticalFlag , UseStringBuffer, wchar_StrLength ) ;

	FONTHANDLE_TCHAR_TO_WCHAR_T_STRING_END

	return Result ;
#endif
}

extern int NS_DrawRotaNStringFToHandle( float x, float y, double ExRateX, double ExRateY, double RotCenterX, double RotCenterY, double RotAngle, unsigned int Color, int FontHandle, unsigned int EdgeColor , int VerticalFlag , const TCHAR *String, size_t StringLength )
{
#ifdef UNICODE
	return DrawRotaStringFToHandle_WCHAR_T( x, y, ExRateX,  ExRateY, RotCenterX, RotCenterY, RotAngle, Color, FontHandle, EdgeColor, VerticalFlag , String, StringLength ) ;
#else
	int Result ;

	FONTHANDLE_TCHAR_WITH_STRLENGTH_TO_WCHAR_T_STRING_BEGIN( String, StringLength, -1 )

	Result = DrawRotaStringFToHandle_WCHAR_T( x, y, ExRateX,  ExRateY, RotCenterX, RotCenterY, RotAngle, Color, FontHandle, EdgeColor, VerticalFlag , UseStringBuffer, wchar_StrLength ) ;

	FONTHANDLE_TCHAR_TO_WCHAR_T_STRING_END

	return Result ;
#endif
}

extern int DrawRotaStringFToHandle_WCHAR_T( float x, float y, double ExRateX, double ExRateY, double RotCenterX, double RotCenterY, double RotAngle, unsigned int Color, int FontHandle, unsigned int EdgeColor , int VerticalFlag , const wchar_t *String, size_t StringLength )
{
#ifndef DX_NON_GRAPHICS
	int Ret = -1 ;
	int Flag ;
	FONTMANAGE *font ;

//	DEFAULT_FONT_HANDLE_SETUP

	if( String == NULL || String[0] == L'\0' || StringLength == 0 ||
		/* GSYS.NotDrawFlag || */ GSYS.DrawSetting.NotDrawFlagInSetDrawArea )
	{
		return 0 ;
	}

	CheckActiveState() ;

	font = GetFontManageDataToHandle_Inline( FontHandle ) ;
	if( font == NULL )
	{
		DXST_LOGFILE_ADDUTF16LE( "\xd5\x30\xa9\x30\xf3\x30\xc8\x30\xcf\x30\xf3\x30\xc9\x30\xeb\x30\x24\x50\x4c\x30\x70\x75\x38\x5e\x67\x30\x59\x30\x0a\x00\x00"/*@ L"�t�H���g�n���h���l���ُ�ł�\n" @*/ ) ;
		return Ret ;
	}

	Flag = font->TextureCacheFlag ;

	// �Q�c�s����n�[�h�E�G�A�ɔ��f����
	if( GSYS.DrawSetting.MatchHardware_2DMatrix == FALSE && GSYS.Setting.ValidHardware && GSYS.Screen.UserScreenImagePixelFormatMatchSoftRenderMode == FALSE )
		Graphics_DrawSetting_ApplyLib2DMatrixToHardware() ;

	// �`��
	DRAW_DEF(
		DrawRotaStringHardware(          0,          0, x, y, FALSE, ExRateX, ExRateY, RotCenterX, RotCenterY, RotAngle, String, StringLength, Color, font, EdgeColor, VerticalFlag ),
		DrawRotaStringSoftware( _FTOL( x ), _FTOL( y ),              ExRateX, ExRateY, RotCenterX, RotCenterY, RotAngle, String, StringLength, Color, font, EdgeColor, VerticalFlag ),
		SETDRAWRECTCODE,
		Ret,
		Flag
	)

	// �I��
	return Ret ;
#else // DX_NON_GRAPHICS
	return -1 ;
#endif // DX_NON_GRAPHICS
}

#undef SETDRAWRECTCODE

// �f�t�H���g�t�H���g�n���h�����g�p���ď����w�蕶�������]�`�悷��
extern int NS_DrawRotaFormatString( int x, int y, double ExRateX, double ExRateY, double RotCenterX, double RotCenterY, double RotAngle, unsigned int Color, unsigned int EdgeColor , int VerticalFlag , const TCHAR *FormatString , ... )
{
	int FontHandle = DX_DEFAULT_FONT_HANDLE ;

	TCHAR_FONTHANDLE_FORMATSTRING_SETUP( -1 )

	return NS_DrawRotaStringToHandle( x, y, ExRateX,  ExRateY, RotCenterX, RotCenterY, RotAngle, Color, DX_DEFAULT_FONT_HANDLE, EdgeColor, VerticalFlag, String ) ;
}

// �f�t�H���g�t�H���g�n���h�����g�p���ď����w�蕶�������]�`�悷��
extern int DrawRotaFormatString_WCHAR_T( int x, int y, double ExRateX, double ExRateY, double RotCenterX, double RotCenterY, double RotAngle, unsigned int Color, unsigned int EdgeColor , int VerticalFlag , const wchar_t *FormatString , ... )
{
	WCHAR_T_FORMATSTRING_SETUP

	return DrawRotaStringToHandle_WCHAR_T( x, y, ExRateX,  ExRateY, RotCenterX, RotCenterY, RotAngle, Color, DX_DEFAULT_FONT_HANDLE, EdgeColor, VerticalFlag, String, CL_strlen( WCHAR_T_CHARCODEFORMAT, ( const char * )String ) ) ;
}

// �f�t�H���g�t�H���g�n���h�����g�p���ď����w�蕶�������]�`�悷��
extern int NS_DrawRotaFormatStringF( float x, float y, double ExRateX, double ExRateY, double RotCenterX, double RotCenterY, double RotAngle, unsigned int Color, unsigned int EdgeColor , int VerticalFlag , const TCHAR *FormatString , ... )
{
	int FontHandle = DX_DEFAULT_FONT_HANDLE ;

	TCHAR_FONTHANDLE_FORMATSTRING_SETUP( -1 )

	return NS_DrawRotaStringFToHandle( x, y, ExRateX,  ExRateY, RotCenterX, RotCenterY, RotAngle, Color, DX_DEFAULT_FONT_HANDLE, EdgeColor, VerticalFlag, String ) ;
}

// �f�t�H���g�t�H���g�n���h�����g�p���ď����w�蕶�������]�`�悷��
extern int DrawRotaFormatStringF_WCHAR_T( float x, float y, double ExRateX, double ExRateY, double RotCenterX, double RotCenterY, double RotAngle, unsigned int Color, unsigned int EdgeColor , int VerticalFlag , const wchar_t *FormatString , ... )
{
	WCHAR_T_FORMATSTRING_SETUP

	return DrawRotaStringFToHandle_WCHAR_T( x, y, ExRateX,  ExRateY, RotCenterX, RotCenterY, RotAngle, Color, DX_DEFAULT_FONT_HANDLE, EdgeColor, VerticalFlag, String, CL_strlen( WCHAR_T_CHARCODEFORMAT, ( const char * )String ) ) ;
}

// �t�H���g�n���h�����g�p���ď����w�蕶�������]�`�悷��
extern int NS_DrawRotaFormatStringToHandle(	int x, int y, double ExRateX, double ExRateY, double RotCenterX, double RotCenterY, double RotAngle, unsigned int Color, int FontHandle, unsigned int EdgeColor, int VerticalFlag, const TCHAR *FormatString, ... )
{
	TCHAR_FONTHANDLE_FORMATSTRING_SETUP( -1 )

	// �`�悷��
	return NS_DrawRotaStringToHandle( x, y, ExRateX,  ExRateY, RotCenterX, RotCenterY, RotAngle, Color, FontHandle, EdgeColor, VerticalFlag, String ) ;
}

// �t�H���g�n���h�����g�p���ď����w�蕶�������]�`�悷��
extern int DrawRotaFormatStringToHandle_WCHAR_T(	int x, int y, double ExRateX, double ExRateY, double RotCenterX, double RotCenterY, double RotAngle, unsigned int Color, int FontHandle, unsigned int EdgeColor, int VerticalFlag, const wchar_t *FormatString, ... )
{
	WCHAR_T_FORMATSTRING_SETUP

	// �`�悷��
	return DrawRotaStringToHandle_WCHAR_T( x, y, ExRateX,  ExRateY, RotCenterX, RotCenterY, RotAngle, Color, FontHandle, EdgeColor, VerticalFlag, String, CL_strlen( WCHAR_T_CHARCODEFORMAT, ( const char * )String ) ) ;
}

// �t�H���g�n���h�����g�p���ď����w�蕶�������]�`�悷��
extern int NS_DrawRotaFormatStringFToHandle( float x, float y, double ExRateX, double ExRateY, double RotCenterX, double RotCenterY, double RotAngle, unsigned int Color, int FontHandle, unsigned int EdgeColor, int VerticalFlag, const TCHAR *FormatString, ... )
{
	TCHAR_FONTHANDLE_FORMATSTRING_SETUP( -1 )

	// �`�悷��
	return NS_DrawRotaStringFToHandle( x, y, ExRateX,  ExRateY, RotCenterX, RotCenterY, RotAngle, Color, FontHandle, EdgeColor, VerticalFlag, String ) ;
}

// �t�H���g�n���h�����g�p���ď����w�蕶�������]�`�悷��
extern int DrawRotaFormatStringFToHandle_WCHAR_T(	float x, float y, double ExRateX, double ExRateY, double RotCenterX, double RotCenterY, double RotAngle, unsigned int Color, int FontHandle, unsigned int EdgeColor, int VerticalFlag, const wchar_t *FormatString, ... )
{
	WCHAR_T_FORMATSTRING_SETUP

	// �`�悷��
	return DrawRotaStringFToHandle_WCHAR_T( x, y, ExRateX,  ExRateY, RotCenterX, RotCenterY, RotAngle, Color, FontHandle, EdgeColor, VerticalFlag, String, CL_strlen( WCHAR_T_CHARCODEFORMAT, ( const char * )String ) ) ;
}





// �f�t�H���g�t�H���g�n���h�����g�p���ĕ������ό`�`�悷��
extern int NS_DrawModiString( int x1, int y1, int x2, int y2, int x3, int y3, int x4, int y4, unsigned int Color, unsigned int EdgeColor, int VerticalFlag, const TCHAR *String )
{
	return NS_DrawModiStringToHandle( x1, y1, x2, y2, x3, y3, x4, y4, Color, DX_DEFAULT_FONT_HANDLE, EdgeColor, VerticalFlag, String ) ;
}

// �f�t�H���g�t�H���g�n���h�����g�p���ĕ������ό`�`�悷��
extern int NS_DrawModiNString( int x1, int y1, int x2, int y2, int x3, int y3, int x4, int y4, unsigned int Color, unsigned int EdgeColor, int VerticalFlag, const TCHAR *String, size_t StringLength )
{
	return NS_DrawModiNStringToHandle( x1, y1, x2, y2, x3, y3, x4, y4, Color, DX_DEFAULT_FONT_HANDLE, EdgeColor, VerticalFlag, String, StringLength ) ;
}

// �f�t�H���g�t�H���g�n���h�����g�p���ĕ������ό`�`�悷��
extern int DrawModiString_WCHAR_T( int x1, int y1, int x2, int y2, int x3, int y3, int x4, int y4, unsigned int Color, unsigned int EdgeColor , int VerticalFlag , const wchar_t *String, size_t StringLength )
{
	return DrawModiStringToHandle_WCHAR_T( x1, y1, x2, y2, x3, y3, x4, y4, Color, DX_DEFAULT_FONT_HANDLE, EdgeColor, VerticalFlag, String, StringLength ) ;
}

// �f�t�H���g�t�H���g�n���h�����g�p���ĕ������ό`�`�悷��
extern int NS_DrawModiStringF( float x1, float y1, float x2, float y2, float x3, float y3, float x4, float y4, unsigned int Color, unsigned int EdgeColor , int VerticalFlag , const TCHAR *String )
{
	return NS_DrawModiStringFToHandle( x1, y1, x2, y2, x3, y3, x4, y4, Color, DX_DEFAULT_FONT_HANDLE, EdgeColor, VerticalFlag, String ) ;
}

// �f�t�H���g�t�H���g�n���h�����g�p���ĕ������ό`�`�悷��
extern int NS_DrawModiNStringF( float x1, float y1, float x2, float y2, float x3, float y3, float x4, float y4, unsigned int Color, unsigned int EdgeColor , int VerticalFlag , const TCHAR *String, size_t StringLength )
{
	return NS_DrawModiNStringFToHandle( x1, y1, x2, y2, x3, y3, x4, y4, Color, DX_DEFAULT_FONT_HANDLE, EdgeColor, VerticalFlag, String, StringLength ) ;
}

// �f�t�H���g�t�H���g�n���h�����g�p���ĕ������ό`�`�悷��
extern int DrawModiStringF_WCHAR_T( float x1, float y1, float x2, float y2, float x3, float y3, float x4, float y4, unsigned int Color, unsigned int EdgeColor , int VerticalFlag , const wchar_t *String, size_t StringLength )
{
	return DrawModiStringFToHandle_WCHAR_T( x1, y1, x2, y2, x3, y3, x4, y4, Color, DX_DEFAULT_FONT_HANDLE, EdgeColor, VerticalFlag, String, StringLength ) ;
}

// �f�t�H���g�t�H���g�n���h�����g�p���ĕ������ό`�`�悷��
#define SETDRAWRECTCODE\
	DrawRect = GSYS.DrawSetting.DrawArea ;

extern int NS_DrawModiStringToHandle( int x1, int y1, int x2, int y2, int x3, int y3, int x4, int y4, unsigned int Color, int FontHandle, unsigned int EdgeColor , int VerticalFlag , const TCHAR *String )
{
#ifdef UNICODE
	return DrawModiStringToHandle_WCHAR_T( x1, y1, x2, y2, x3, y3, x4, y4, Color, FontHandle, EdgeColor, VerticalFlag , String, CL_strlen( WCHAR_T_CHARCODEFORMAT, ( const char * )String ) ) ;
#else
	int Result ;

	FONTHANDLE_TCHAR_TO_WCHAR_T_STRING_BEGIN( String, -1 )

	Result = DrawModiStringToHandle_WCHAR_T( x1, y1, x2, y2, x3, y3, x4, y4, Color, FontHandle, EdgeColor, VerticalFlag , UseStringBuffer, wchar_StrLength ) ;

	FONTHANDLE_TCHAR_TO_WCHAR_T_STRING_END

	return Result ;
#endif
}

extern int NS_DrawModiNStringToHandle( int x1, int y1, int x2, int y2, int x3, int y3, int x4, int y4, unsigned int Color, int FontHandle, unsigned int EdgeColor , int VerticalFlag , const TCHAR *String, size_t StringLength )
{
#ifdef UNICODE
	return DrawModiStringToHandle_WCHAR_T( x1, y1, x2, y2, x3, y3, x4, y4, Color, FontHandle, EdgeColor, VerticalFlag , String, StringLength ) ;
#else
	int Result ;

	FONTHANDLE_TCHAR_WITH_STRLENGTH_TO_WCHAR_T_STRING_BEGIN( String, StringLength, -1 )

	Result = DrawModiStringToHandle_WCHAR_T( x1, y1, x2, y2, x3, y3, x4, y4, Color, FontHandle, EdgeColor, VerticalFlag , UseStringBuffer, wchar_StrLength ) ;

	FONTHANDLE_TCHAR_TO_WCHAR_T_STRING_END

	return Result ;
#endif
}

extern int DrawModiStringToHandle_WCHAR_T( int x1, int y1, int x2, int y2, int x3, int y3, int x4, int y4, unsigned int Color, int FontHandle, unsigned int EdgeColor , int VerticalFlag , const wchar_t *String, size_t StringLength )
{
#ifndef DX_NON_GRAPHICS
	int Ret = -1 ;
	int Flag ;
	FONTMANAGE *font ;

//	DEFAULT_FONT_HANDLE_SETUP

	if( String == NULL || String[0] == L'\0' || StringLength == 0 ||
		/* GSYS.NotDrawFlag || */ GSYS.DrawSetting.NotDrawFlagInSetDrawArea )
	{
		return 0 ;
	}

	CheckActiveState() ;

	font = GetFontManageDataToHandle_Inline( FontHandle ) ;
	if( font == NULL )
	{
		DXST_LOGFILE_ADDUTF16LE( "\xd5\x30\xa9\x30\xf3\x30\xc8\x30\xcf\x30\xf3\x30\xc9\x30\xeb\x30\x24\x50\x4c\x30\x70\x75\x38\x5e\x67\x30\x59\x30\x0a\x00\x00"/*@ L"�t�H���g�n���h���l���ُ�ł�\n" @*/ ) ;
		return Ret ;
	}

	Flag = font->TextureCacheFlag ;

	// �Q�c�s����n�[�h�E�G�A�ɔ��f����
	if( GSYS.DrawSetting.MatchHardware_2DMatrix == FALSE && GSYS.Setting.ValidHardware && GSYS.Screen.UserScreenImagePixelFormatMatchSoftRenderMode == FALSE )
		Graphics_DrawSetting_ApplyLib2DMatrixToHardware() ;

	// �`��
	DRAW_DEF(
		DrawModiStringHardware( x1, y1, x2, y2, x3, y3, x4, y4, 0, 0, 0, 0, 0, 0, 0, 0, TRUE, String, StringLength, Color, font, EdgeColor, VerticalFlag ),
		DrawModiStringSoftware( x1, y1, x2, y2, x3, y3, x4, y4,                               String, StringLength, Color, font, EdgeColor, VerticalFlag ),
		SETDRAWRECTCODE,
		Ret,
		Flag
	)

	// �I��
	return Ret ;
#else // DX_NON_GRAPHICS
	return -1 ;
#endif // DX_NON_GRAPHICS
}

#undef SETDRAWRECTCODE

// �f�t�H���g�t�H���g�n���h�����g�p���ĕ������ό`�`�悷��
#define SETDRAWRECTCODE\
	DrawRect = GSYS.DrawSetting.DrawArea ;

extern int NS_DrawModiStringFToHandle( float x1, float y1, float x2, float y2, float x3, float y3, float x4, float y4, unsigned int Color, int FontHandle, unsigned int EdgeColor , int VerticalFlag , const TCHAR *String )
{
#ifdef UNICODE
	return DrawModiStringFToHandle_WCHAR_T( x1, y1, x2, y2, x3, y3, x4, y4, Color, FontHandle, EdgeColor, VerticalFlag , String, CL_strlen( WCHAR_T_CHARCODEFORMAT, ( const char * )String ) ) ;
#else
	int Result ;

	FONTHANDLE_TCHAR_TO_WCHAR_T_STRING_BEGIN( String, -1 )

	Result = DrawModiStringFToHandle_WCHAR_T( x1, y1, x2, y2, x3, y3, x4, y4, Color, FontHandle, EdgeColor, VerticalFlag , UseStringBuffer, wchar_StrLength ) ;

	FONTHANDLE_TCHAR_TO_WCHAR_T_STRING_END

	return Result ;
#endif
}

extern int NS_DrawModiNStringFToHandle( float x1, float y1, float x2, float y2, float x3, float y3, float x4, float y4, unsigned int Color, int FontHandle, unsigned int EdgeColor , int VerticalFlag , const TCHAR *String, size_t StringLength )
{
#ifdef UNICODE
	return DrawModiStringFToHandle_WCHAR_T( x1, y1, x2, y2, x3, y3, x4, y4, Color, FontHandle, EdgeColor, VerticalFlag , String, StringLength ) ;
#else
	int Result ;

	FONTHANDLE_TCHAR_WITH_STRLENGTH_TO_WCHAR_T_STRING_BEGIN( String, StringLength, -1 )

	Result = DrawModiStringFToHandle_WCHAR_T( x1, y1, x2, y2, x3, y3, x4, y4, Color, FontHandle, EdgeColor, VerticalFlag , UseStringBuffer, wchar_StrLength ) ;

	FONTHANDLE_TCHAR_TO_WCHAR_T_STRING_END

	return Result ;
#endif
}

extern int DrawModiStringFToHandle_WCHAR_T( float x1, float y1, float x2, float y2, float x3, float y3, float x4, float y4, unsigned int Color, int FontHandle, unsigned int EdgeColor , int VerticalFlag , const wchar_t *String, size_t StringLength )
{
#ifndef DX_NON_GRAPHICS
	int Ret = -1 ;
	int Flag ;
	FONTMANAGE *font ;

//	DEFAULT_FONT_HANDLE_SETUP

	if( String == NULL || String[0] == L'\0' || StringLength == 0 ||
		/* GSYS.NotDrawFlag || */ GSYS.DrawSetting.NotDrawFlagInSetDrawArea )
	{
		return 0 ;
	}

	CheckActiveState() ;

	font = GetFontManageDataToHandle_Inline( FontHandle ) ;
	if( font == NULL )
	{
		DXST_LOGFILE_ADDUTF16LE( "\xd5\x30\xa9\x30\xf3\x30\xc8\x30\xcf\x30\xf3\x30\xc9\x30\xeb\x30\x24\x50\x4c\x30\x70\x75\x38\x5e\x67\x30\x59\x30\x0a\x00\x00"/*@ L"�t�H���g�n���h���l���ُ�ł�\n" @*/ ) ;
		return Ret ;
	}

	Flag = font->TextureCacheFlag ;

	// �Q�c�s����n�[�h�E�G�A�ɔ��f����
	if( GSYS.DrawSetting.MatchHardware_2DMatrix == FALSE && GSYS.Setting.ValidHardware && GSYS.Screen.UserScreenImagePixelFormatMatchSoftRenderMode == FALSE )
		Graphics_DrawSetting_ApplyLib2DMatrixToHardware() ;

	// �`��
	DRAW_DEF(
		DrawModiStringHardware(           0,           0,           0,           0,           0,           0,           0,           0, x1, y1, x2, y2, x3, y3, x4, y4, FALSE, String, StringLength, Color, font, EdgeColor, VerticalFlag ),
		DrawModiStringSoftware( _FTOL( x1 ), _FTOL( y1 ), _FTOL( x2 ), _FTOL( y2 ), _FTOL( x3 ), _FTOL( y3 ), _FTOL( x4 ), _FTOL( y4 ),                                        String, StringLength, Color, font, EdgeColor, VerticalFlag ),
		SETDRAWRECTCODE,
		Ret,
		Flag
	)

	// �I��
	return Ret ;
#else // DX_NON_GRAPHICS
	return -1 ;
#endif // DX_NON_GRAPHICS
}

#undef SETDRAWRECTCODE

// �f�t�H���g�t�H���g�n���h�����g�p���ď����w�蕶�����ό`�`�悷��
extern int NS_DrawModiFormatString( int x1, int y1, int x2, int y2, int x3, int y3, int x4, int y4, unsigned int Color, unsigned int EdgeColor , int VerticalFlag , const TCHAR *FormatString , ... )
{
	int FontHandle = DX_DEFAULT_FONT_HANDLE ;

	TCHAR_FONTHANDLE_FORMATSTRING_SETUP( -1 )

	return NS_DrawModiStringToHandle( x1, y1, x2, y2, x3, y3, x4, y4, Color, DX_DEFAULT_FONT_HANDLE, EdgeColor, VerticalFlag, String ) ;
}

// �f�t�H���g�t�H���g�n���h�����g�p���ď����w�蕶�����ό`�`�悷��
extern int DrawModiFormatString_WCHAR_T( int x1, int y1, int x2, int y2, int x3, int y3, int x4, int y4, unsigned int Color, unsigned int EdgeColor , int VerticalFlag , const wchar_t *FormatString , ... )
{
	WCHAR_T_FORMATSTRING_SETUP

	return DrawModiStringToHandle_WCHAR_T( x1, y1, x2, y2, x3, y3, x4, y4, Color, DX_DEFAULT_FONT_HANDLE, EdgeColor, VerticalFlag, String, CL_strlen( WCHAR_T_CHARCODEFORMAT, ( const char * )String ) ) ;
}

// �f�t�H���g�t�H���g�n���h�����g�p���ď����w�蕶�����ό`�`�悷��
extern int NS_DrawModiFormatStringF( float x1, float y1, float x2, float y2, float x3, float y3, float x4, float y4, unsigned int Color, unsigned int EdgeColor , int VerticalFlag , const TCHAR *FormatString , ... )
{
	int FontHandle = DX_DEFAULT_FONT_HANDLE ;

	TCHAR_FONTHANDLE_FORMATSTRING_SETUP( -1 )

	return NS_DrawModiStringFToHandle( x1, y1, x2, y2, x3, y3, x4, y4, Color, DX_DEFAULT_FONT_HANDLE, EdgeColor, VerticalFlag, String ) ;
}

// �f�t�H���g�t�H���g�n���h�����g�p���ď����w�蕶�����ό`�`�悷��
extern int DrawModiFormatStringF_WCHAR_T( float x1, float y1, float x2, float y2, float x3, float y3, float x4, float y4, unsigned int Color, unsigned int EdgeColor , int VerticalFlag , const wchar_t *FormatString , ... )
{
	WCHAR_T_FORMATSTRING_SETUP

	return DrawModiStringFToHandle_WCHAR_T( x1, y1, x2, y2, x3, y3, x4, y4, Color, DX_DEFAULT_FONT_HANDLE, EdgeColor, VerticalFlag, String, CL_strlen( WCHAR_T_CHARCODEFORMAT, ( const char * )String ) ) ;
}

// �t�H���g�n���h�����g�p���ď����w�蕶�����ό`�`�悷��
extern int NS_DrawModiFormatStringToHandle(	int x1, int y1, int x2, int y2, int x3, int y3, int x4, int y4, unsigned int Color, int FontHandle, unsigned int EdgeColor, int VerticalFlag, const TCHAR *FormatString, ... )
{
	TCHAR_FONTHANDLE_FORMATSTRING_SETUP( -1 )

	// �`�悷��
	return NS_DrawModiStringToHandle( x1, y1, x2, y2, x3, y3, x4, y4, Color, FontHandle, EdgeColor, VerticalFlag, String ) ;
}

// �t�H���g�n���h�����g�p���ď����w�蕶�����ό`�`�悷��
extern int DrawModiFormatStringToHandle_WCHAR_T(	int x1, int y1, int x2, int y2, int x3, int y3, int x4, int y4, unsigned int Color, int FontHandle, unsigned int EdgeColor, int VerticalFlag, const wchar_t *FormatString, ... )
{
	WCHAR_T_FORMATSTRING_SETUP

	// �`�悷��
	return DrawModiStringToHandle_WCHAR_T( x1, y1, x2, y2, x3, y3, x4, y4, Color, FontHandle, EdgeColor, VerticalFlag, String, CL_strlen( WCHAR_T_CHARCODEFORMAT, ( const char * )String ) ) ;
}

// �t�H���g�n���h�����g�p���ď����w�蕶�����ό`�`�悷��
extern int NS_DrawModiFormatStringFToHandle( float x1, float y1, float x2, float y2, float x3, float y3, float x4, float y4, unsigned int Color, int FontHandle, unsigned int EdgeColor, int VerticalFlag, const TCHAR *FormatString, ... )
{
	TCHAR_FONTHANDLE_FORMATSTRING_SETUP( -1 )

	// �`�悷��
	return NS_DrawModiStringFToHandle( x1, y1, x2, y2, x3, y3, x4, y4, Color, FontHandle, EdgeColor, VerticalFlag, String ) ;
}

// �t�H���g�n���h�����g�p���ď����w�蕶�����ό`�`�悷��
extern int DrawModiFormatStringFToHandle_WCHAR_T(	float x1, float y1, float x2, float y2, float x3, float y3, float x4, float y4, unsigned int Color, int FontHandle, unsigned int EdgeColor, int VerticalFlag, const wchar_t *FormatString, ... )
{
	WCHAR_T_FORMATSTRING_SETUP

	// �`�悷��
	return DrawModiStringFToHandle_WCHAR_T( x1, y1, x2, y2, x3, y3, x4, y4, Color, FontHandle, EdgeColor, VerticalFlag, String, CL_strlen( WCHAR_T_CHARCODEFORMAT, ( const char * )String ) ) ;
}







// �����^�̐��l��`�悷��
extern int NS_DrawNumberToI( int x, int y, int Num, int RisesNum, unsigned int Color ,unsigned int EdgeColor )
{
	return NS_DrawNumberToIToHandle( x, y, Num, RisesNum, Color, DX_DEFAULT_FONT_HANDLE, EdgeColor ) ;
}

// ���������_�^�̐��l��`�悷��
extern int NS_DrawNumberToF( int x, int y, double Num, int Length, unsigned int Color ,unsigned int EdgeColor  )
{
	return NS_DrawNumberToFToHandle( x, y, Num, Length, Color, DX_DEFAULT_FONT_HANDLE, EdgeColor ) ;
}

// �����^�̐��l�Ƃ��̐����̕��������x�ɕ`�悷��
extern int NS_DrawNumberPlusToI( int x, int y, const TCHAR *NoteString, int Num, int RisesNum, unsigned int Color ,unsigned int EdgeColor )
{
	return NS_DrawNumberPlusToIToHandle( x, y, NoteString, Num, RisesNum, Color, DX_DEFAULT_FONT_HANDLE, EdgeColor ) ;
}

// �����^�̐��l�Ƃ��̐����̕��������x�ɕ`�悷��
extern int DrawNumberPlusToI_WCHAR_T( int x, int y, const wchar_t *NoteString, int Num, int RisesNum, unsigned int Color ,unsigned int EdgeColor )
{
	return DrawNumberPlusToIToHandle_WCHAR_T( x, y, NoteString, Num, RisesNum, Color, DX_DEFAULT_FONT_HANDLE, EdgeColor ) ;
}

// ���������_�^�̐��l�Ƃ��̐����̕��������x�ɕ`�悷��
extern int NS_DrawNumberPlusToF( int x, int y, const TCHAR *NoteString, double Num, int Length, unsigned int Color ,unsigned int EdgeColor )
{
	return NS_DrawNumberPlusToFToHandle( x, y, NoteString, Num, Length, Color, DX_DEFAULT_FONT_HANDLE, EdgeColor ) ;
}

// ���������_�^�̐��l�Ƃ��̐����̕��������x�ɕ`�悷��
extern int DrawNumberPlusToF_WCHAR_T( int x, int y, const wchar_t *NoteString, double Num, int Length, unsigned int Color ,unsigned int EdgeColor )
{
	return DrawNumberPlusToFToHandle_WCHAR_T( x, y, NoteString, Num, Length, Color, DX_DEFAULT_FONT_HANDLE, EdgeColor ) ;
}



// �����^�̐��l��`�悷��
extern int NS_DrawNumberToIToHandle( int x, int y, int Num, int RisesNum, unsigned int Color, int FontHandle ,unsigned int EdgeColor )
{
	wchar_t Str[256] ;

	_ITOAW_S( Num, Str, sizeof( Str ), RisesNum ) ;
	return DrawStringToHandle_WCHAR_T( x, y, Str, _WCSLEN( Str ), Color, FontHandle, EdgeColor, FALSE ) ;
}

// ���������_�^�̐��l��`�悷��
extern int NS_DrawNumberToFToHandle( int x, int y, double Num, int Length, unsigned int Color, int FontHandle,unsigned int EdgeColor  )
{
	wchar_t Str[256], Str2[256] ;

	_WCSCPY( Str2, L"%." ) ;
	_ITOAW_S( Length, Str, sizeof( Str ), 10 ) ;
	_WCSCAT_S( Str2, sizeof( Str2 ), Str ) ;
	_WCSCAT_S( Str2, sizeof( Str2 ), L"f" ) ;
	_SWNPRINTF( Str, sizeof( Str ) / 2, Str2, Num ) ;
	return DrawStringToHandle_WCHAR_T( x, y, Str, _WCSLEN( Str ), Color, FontHandle, EdgeColor, FALSE ) ;
}


// �����^�̐��l�Ƃ��̐����̕��������x�ɕ`�悷��
extern int NS_DrawNumberPlusToIToHandle( int x, int y, const TCHAR *NoteString, int Num, int RisesNum, unsigned int Color, int FontHandle,unsigned int EdgeColor )
{
#ifdef UNICODE
	return DrawNumberPlusToIToHandle_WCHAR_T( x, y, NoteString, Num, RisesNum, Color, FontHandle, EdgeColor ) ;
#else
	int Result ;

	FONTHANDLE_TCHAR_TO_WCHAR_T_STRING_BEGIN( NoteString, -1 )

	Result = DrawNumberPlusToIToHandle_WCHAR_T( x, y, UseStringBuffer, Num, RisesNum, Color, FontHandle, EdgeColor ) ;

	FONTHANDLE_TCHAR_TO_WCHAR_T_STRING_END

	return Result ;
#endif
}

// �����^�̐��l�Ƃ��̐����̕��������x�ɕ`�悷��
extern int DrawNumberPlusToIToHandle_WCHAR_T( int x, int y, const wchar_t *NoteString, int Num, int RisesNum, unsigned int Color, int FontHandle,unsigned int EdgeColor )
{
	wchar_t Str[2048], Str2[256] ;

	if( ( int )_WCSLEN( NoteString ) > 2048 - 256 )
	{
		return -1 ;
	}

	_WCSCPY_S( Str, sizeof( Str ), NoteString ) ;
	_WCSCAT_S( Str, sizeof( Str ), L"=" ) ;

	_ITOAW_S( Num, Str2, sizeof( Str2 ), RisesNum ) ;
	_WCSCAT_S( Str, sizeof( Str ), Str2 ) ;

	// �`��
	return DrawStringToHandle_WCHAR_T( x, y, Str, _WCSLEN( Str ), Color, FontHandle, EdgeColor, FALSE ) ;
}

// ���������_�^�̐��l�Ƃ��̐����̕��������x�ɕ`�悷��
extern int NS_DrawNumberPlusToFToHandle( int x, int y, const TCHAR *NoteString, double Num, int Length, unsigned int Color, int FontHandle ,unsigned int EdgeColor )
{
#ifdef UNICODE
	return DrawNumberPlusToFToHandle_WCHAR_T( x, y, NoteString, Num, Length, Color, FontHandle, EdgeColor ) ;
#else
	int Result ;

	FONTHANDLE_TCHAR_TO_WCHAR_T_STRING_BEGIN( NoteString, -1 )

	Result = DrawNumberPlusToFToHandle_WCHAR_T( x, y, UseStringBuffer, Num, Length, Color, FontHandle, EdgeColor ) ;

	FONTHANDLE_TCHAR_TO_WCHAR_T_STRING_END

	return Result ;
#endif
}

// ���������_�^�̐��l�Ƃ��̐����̕��������x�ɕ`�悷��
extern int DrawNumberPlusToFToHandle_WCHAR_T( int x, int y, const wchar_t *NoteString, double Num, int Length, unsigned int Color, int FontHandle ,unsigned int EdgeColor )
{
	wchar_t Str[2048], Str2[256], Str3[256] ;

	if( ( int )_WCSLEN( NoteString ) > 2048 - 256 )
	{
		return -1 ;
	}

	_WCSCPY_S( Str, sizeof( Str ), NoteString ) ;
	_WCSCAT_S( Str, sizeof( Str ), L"=" ) ;

	_WCSCPY( Str2, L"%." ) ;
	_ITOAW_S( Length, Str3, sizeof( Str2 ), 10 ) ;
	_WCSCAT_S( Str2, sizeof( Str2 ), Str3 ) ;
	_WCSCAT_S( Str2, sizeof( Str2 ), L"f" ) ;
	_SWNPRINTF( Str3, sizeof( Str3 ) / 2, Str2, Num ) ;

	_WCSCAT_S( Str, sizeof( Str ), Str3 ) ;

	// �`��
	return DrawStringToHandle_WCHAR_T( x, y, Str, _WCSLEN( Str ), Color, FontHandle, EdgeColor, FALSE ) ;
}

// �f�t�H���g�t�H���g�n���h�����g�p���������t��������̕`�敝���擾����
extern int GetDrawFormatStringWidth_VaList( const TCHAR *FormatString, va_list VaList )
{
	int FontHandle = DX_DEFAULT_FONT_HANDLE ;

	TCHAR_FONTHANDLE_FORMATSTRING_VALIST_SETUP( -1 )

	// ������̕��𓾂�
	return NS_GetDrawStringWidthToHandle(
				String, ( int )CL_strlen( CharCodeFormat, ( const char * )String ), FontHandle, FALSE ) ;
}

// �f�t�H���g�t�H���g�n���h�����g�p���������t��������̕`�敝���擾����( �g�嗦�t�� )
extern int GetDrawExtendFormatStringWidth_VaList( double ExRateX, const TCHAR *FormatString, va_list VaList )
{
	int FontHandle = DX_DEFAULT_FONT_HANDLE ;

	TCHAR_FONTHANDLE_FORMATSTRING_VALIST_SETUP( -1 )

	// ������̕��𓾂�
	return NS_GetDrawExtendStringWidthToHandle(
		ExRateX, String, ( int )CL_strlen( CharCodeFormat,  ( const char * )String ), DX_DEFAULT_FONT_HANDLE, FALSE ) ;
}

// �f�t�H���g�t�H���g�n���h�����g�p���������t��������̕`�敝�E�����E�s�����擾����
extern int GetDrawFormatStringSize_VaList( int *SizeX, int *SizeY, int *LineCount, const TCHAR *FormatString, va_list VaList )
{
	int FontHandle = DX_DEFAULT_FONT_HANDLE ;

	TCHAR_FONTHANDLE_FORMATSTRING_VALIST_SETUP( -1 )

	// ������̕��𓾂�
	return NS_GetDrawStringSizeToHandle(
				SizeX, SizeY, LineCount, String, ( int )CL_strlen( CharCodeFormat, ( const char * )String ), FontHandle, FALSE ) ;
}

// �f�t�H���g�t�H���g�n���h�����g�p���������t��������̕`�敝�E�����E�s�����擾����( �g�嗦�t�� )
extern int GetDrawExtendFormatStringSize_VaList( int *SizeX, int *SizeY, int *LineCount, double ExRateX, double ExRateY, const TCHAR *FormatString, va_list VaList )
{
	int FontHandle = DX_DEFAULT_FONT_HANDLE ;

	TCHAR_FONTHANDLE_FORMATSTRING_VALIST_SETUP( -1 )

	// ������̕��𓾂�
	return NS_GetDrawExtendStringSizeToHandle(
		SizeX, SizeY, LineCount, ExRateX, ExRateY, String, ( int )CL_strlen( CharCodeFormat,  ( const char * )String ), DX_DEFAULT_FONT_HANDLE, FALSE ) ;
}

// �f�t�H���g�t�H���g�n���h�����g�p���������t��������̂P�������̏����擾����
extern int GetDrawFormatStringCharInfo_VaList( DRAWCHARINFO *InfoBuffer, size_t InfoBufferSize, const TCHAR *FormatString, va_list VaList )
{
	int FontHandle = DX_DEFAULT_FONT_HANDLE ;

	TCHAR_FONTHANDLE_FORMATSTRING_VALIST_SETUP( -1 )

	return NS_GetDrawStringCharInfoToHandle(
				InfoBuffer, InfoBufferSize, String, ( int )CL_strlen( CharCodeFormat, ( const char * )String ), FontHandle, FALSE ) ;
}

// �f�t�H���g�t�H���g�n���h�����g�p���������t��������̂P�������̏����擾����
extern int GetDrawExtendFormatStringCharInfo_VaList( DRAWCHARINFO *InfoBuffer, size_t InfoBufferSize, double ExRateX, double ExRateY, const TCHAR *FormatString, va_list VaList )
{
	int FontHandle = DX_DEFAULT_FONT_HANDLE ;

	TCHAR_FONTHANDLE_FORMATSTRING_VALIST_SETUP( -1 )

	// ������̕��𓾂�
	return NS_GetDrawExtendStringCharInfoToHandle(
		InfoBuffer, InfoBufferSize, ExRateX, ExRateY, String, ( int )CL_strlen( CharCodeFormat,  ( const char * )String ), DX_DEFAULT_FONT_HANDLE, FALSE ) ;
}

// �t�H���g�n���h�����g�p���������t��������̕`�敝���擾����
extern int GetDrawFormatStringWidthToHandle_VaList( int FontHandle, const TCHAR *FormatString, va_list VaList )
{
	TCHAR_FONTHANDLE_FORMATSTRING_VALIST_SETUP( -1 )

	// ������̕��𓾂�
	return NS_GetDrawStringWidthToHandle(
				String, ( int )CL_strlen( CharCodeFormat, ( const char * )String ), FontHandle, FALSE ) ;
}

// �t�H���g�n���h�����g�p���������t��������̕`�敝���擾����
extern int GetDrawExtendFormatStringWidthToHandle_VaList( double ExRateX, int FontHandle, const TCHAR *FormatString, va_list VaList )
{
	TCHAR_FONTHANDLE_FORMATSTRING_VALIST_SETUP( -1 )

	// ������̕��𓾂�
	return NS_GetDrawExtendStringWidthToHandle(
				ExRateX, String, ( int )CL_strlen( CharCodeFormat, ( const char * )String ), FontHandle, FALSE ) ;
}

// �t�H���g�n���h�����g�p���������t��������̕`�敝�E�����E�s�����擾����
extern int GetDrawFormatStringSizeToHandle_VaList( int *SizeX, int *SizeY, int *LineCount, int FontHandle, const TCHAR *FormatString, va_list VaList )
{
	TCHAR_FONTHANDLE_FORMATSTRING_VALIST_SETUP( -1 )

	// ������̕��𓾂�
	return NS_GetDrawStringSizeToHandle(
				SizeX, SizeY, LineCount, String, ( int )CL_strlen( CharCodeFormat, ( const char * )String ), FontHandle, FALSE ) ;
}

// �t�H���g�n���h�����g�p���������t��������̕`�敝�E�����E�s�����擾����
extern int GetDrawExtendFormatStringSizeToHandle_VaList( int *SizeX, int *SizeY, int *LineCount, double ExRateX, double ExRateY, int FontHandle, const TCHAR *FormatString, va_list VaList )
{
	TCHAR_FONTHANDLE_FORMATSTRING_VALIST_SETUP( -1 )

	// ������̕��𓾂�
	return NS_GetDrawExtendStringSizeToHandle(
				SizeX, SizeY, LineCount, ExRateX, ExRateY, String, ( int )CL_strlen( CharCodeFormat, ( const char * )String ), FontHandle, FALSE ) ;
}

// �t�H���g�n���h�����g�p���������t��������̂P�������̏����擾����
extern int GetDrawFormatStringCharInfoToHandle_VaList( DRAWCHARINFO *InfoBuffer, size_t InfoBufferSize, int FontHandle, const TCHAR *FormatString, va_list VaList )
{
	TCHAR_FONTHANDLE_FORMATSTRING_VALIST_SETUP( -1 )

	return NS_GetDrawStringCharInfoToHandle(
				InfoBuffer, InfoBufferSize, String, ( int )CL_strlen( CharCodeFormat, ( const char * )String ), FontHandle, FALSE ) ;
}

// �t�H���g�n���h�����g�p���������t��������̂P�������̏����擾����
extern int GetDrawExtendFormatStringCharInfoToHandle_VaList( DRAWCHARINFO *InfoBuffer, size_t InfoBufferSize, double ExRateX, double ExRateY, int FontHandle, const TCHAR *FormatString, va_list VaList )
{
	TCHAR_FONTHANDLE_FORMATSTRING_VALIST_SETUP( -1 )

	return NS_GetDrawExtendStringCharInfoToHandle(
				InfoBuffer, InfoBufferSize, ExRateX, ExRateY, String, ( int )CL_strlen( CharCodeFormat, ( const char * )String ), FontHandle, FALSE ) ;
}

// �f�t�H���g�t�H���g�n���h�����g�p���ď����w�蕶�����`�悷��
extern int DrawFormatString_VaList( int x, int y, unsigned int Color, const TCHAR *FormatString, va_list VaList )
{
	int FontHandle = DX_DEFAULT_FONT_HANDLE ;

	TCHAR_FONTHANDLE_FORMATSTRING_VALIST_SETUP( -1 )

	return NS_DrawStringToHandle( x, y, String, Color, DX_DEFAULT_FONT_HANDLE, 0, FALSE ) ;
}
extern int DrawFormatString2_VaList( int x, int y, unsigned int Color, unsigned int EdgeColor, const TCHAR *FormatString, va_list VaList )
{
	int FontHandle = DX_DEFAULT_FONT_HANDLE ;

	TCHAR_FONTHANDLE_FORMATSTRING_VALIST_SETUP( -1 )

	return NS_DrawStringToHandle( x, y, String, Color, DX_DEFAULT_FONT_HANDLE, EdgeColor, FALSE ) ;
}

// �f�t�H���g�t�H���g�n���h�����g�p���ď����w�蕶�����`�悷��( �c���� )
extern int DrawFormatVString_VaList( int x, int y, unsigned int Color, const TCHAR *FormatString, va_list VaList )
{
	int FontHandle = DX_DEFAULT_FONT_HANDLE ;

	TCHAR_FONTHANDLE_FORMATSTRING_VALIST_SETUP( -1 )

	return NS_DrawStringToHandle( x, y, String, Color, DX_DEFAULT_FONT_HANDLE, 0, TRUE ) ;
}
extern int DrawFormatVString2_VaList( int x, int y, unsigned int Color, unsigned int EdgeColor, const TCHAR *FormatString, va_list VaList )
{
	int FontHandle = DX_DEFAULT_FONT_HANDLE ;

	TCHAR_FONTHANDLE_FORMATSTRING_VALIST_SETUP( -1 )

	return NS_DrawStringToHandle( x, y, String, Color, DX_DEFAULT_FONT_HANDLE, EdgeColor, TRUE ) ;
}

// �f�t�H���g�t�H���g�n���h�����g�p���ď����w�蕶������g��`�悷��
extern int DrawExtendFormatString_VaList( int x, int y, double ExRateX, double ExRateY, unsigned int Color, const TCHAR *FormatString, va_list VaList )
{
	int FontHandle = DX_DEFAULT_FONT_HANDLE ;

	TCHAR_FONTHANDLE_FORMATSTRING_VALIST_SETUP( -1 )

	return NS_DrawExtendStringToHandle( x, y, ExRateX, ExRateY, String, Color, DX_DEFAULT_FONT_HANDLE, 0, FALSE ) ;
}
extern int DrawExtendFormatString2_VaList( int x, int y, double ExRateX, double ExRateY, unsigned int Color, unsigned int EdgeColor, const TCHAR *FormatString, va_list VaList )
{
	int FontHandle = DX_DEFAULT_FONT_HANDLE ;

	TCHAR_FONTHANDLE_FORMATSTRING_VALIST_SETUP( -1 )

	return NS_DrawExtendStringToHandle( x, y, ExRateX, ExRateY, String, Color, DX_DEFAULT_FONT_HANDLE, EdgeColor, FALSE ) ;
}

// �f�t�H���g�t�H���g�n���h�����g�p���ď����w�蕶������g��`�悷��( �c���� )
extern int DrawExtendFormatVString_VaList( int x, int y, double ExRateX, double ExRateY, unsigned int Color, const TCHAR *FormatString, va_list VaList )
{
	int FontHandle = DX_DEFAULT_FONT_HANDLE ;

	TCHAR_FONTHANDLE_FORMATSTRING_VALIST_SETUP( -1 )

	return NS_DrawExtendStringToHandle( x, y, ExRateX, ExRateY, String, Color, DX_DEFAULT_FONT_HANDLE, 0, TRUE ) ;
}
extern int DrawExtendFormatVString2_VaList( int x, int y, double ExRateX, double ExRateY, unsigned int Color, unsigned int EdgeColor, const TCHAR *FormatString, va_list VaList )
{
	int FontHandle = DX_DEFAULT_FONT_HANDLE ;

	TCHAR_FONTHANDLE_FORMATSTRING_VALIST_SETUP( -1 )

	return NS_DrawExtendStringToHandle( x, y, ExRateX, ExRateY, String, Color, DX_DEFAULT_FONT_HANDLE, EdgeColor, TRUE ) ;
}

// �f�t�H���g�t�H���g�n���h�����g�p���ď����w�蕶�������]�`�悷��
extern int DrawRotaFormatString_VaList( int x, int y, double ExRateX, double ExRateY, double RotCenterX, double RotCenterY, double RotAngle, unsigned int Color, unsigned int EdgeColor, int VerticalFlag, const TCHAR *FormatString, va_list VaList )
{
	int FontHandle = DX_DEFAULT_FONT_HANDLE ;

	TCHAR_FONTHANDLE_FORMATSTRING_VALIST_SETUP( -1 )

	return NS_DrawRotaStringToHandle( x, y, ExRateX,  ExRateY, RotCenterX, RotCenterY, RotAngle, Color, DX_DEFAULT_FONT_HANDLE, EdgeColor, VerticalFlag, String ) ;
}

// �f�t�H���g�t�H���g�n���h�����g�p���ď����w�蕶�����ό`�`�悷��
extern int DrawModiFormatString_VaList( int x1, int y1, int x2, int y2, int x3, int y3, int x4, int y4, unsigned int Color, unsigned int EdgeColor, int VerticalFlag, const TCHAR *FormatString, va_list VaList )
{
	int FontHandle = DX_DEFAULT_FONT_HANDLE ;

	TCHAR_FONTHANDLE_FORMATSTRING_VALIST_SETUP( -1 )

	return NS_DrawModiStringToHandle( x1, y1, x2, y2, x3, y3, x4, y4, Color, DX_DEFAULT_FONT_HANDLE, EdgeColor, VerticalFlag, String ) ;
}

// �f�t�H���g�t�H���g�n���h�����g�p���ď����w�蕶�����`�悷��( ���W�w�肪 float �� )
extern int DrawFormatStringF_VaList( float x, float y, unsigned int Color, const TCHAR *FormatString, va_list VaList )
{
	int FontHandle = DX_DEFAULT_FONT_HANDLE ;

	TCHAR_FONTHANDLE_FORMATSTRING_VALIST_SETUP( -1 )

	return NS_DrawStringFToHandle( x, y, String, Color, DX_DEFAULT_FONT_HANDLE, 0, FALSE ) ;
}
extern int DrawFormatString2F_VaList( float x, float y, unsigned int Color, unsigned int EdgeColor, const TCHAR *FormatString, va_list VaList )
{
	int FontHandle = DX_DEFAULT_FONT_HANDLE ;

	TCHAR_FONTHANDLE_FORMATSTRING_VALIST_SETUP( -1 )

	return NS_DrawStringFToHandle( x, y, String, Color, DX_DEFAULT_FONT_HANDLE, EdgeColor, FALSE ) ;
}

// �f�t�H���g�t�H���g�n���h�����g�p���ď����w�蕶�����`�悷��( �c���� )( ���W�w�肪 float �� )
extern int DrawFormatVStringF_VaList( float x, float y, unsigned int Color, const TCHAR *FormatString, va_list VaList )
{
	int FontHandle = DX_DEFAULT_FONT_HANDLE ;

	TCHAR_FONTHANDLE_FORMATSTRING_VALIST_SETUP( -1 )

	return NS_DrawStringFToHandle( x, y, String, Color, DX_DEFAULT_FONT_HANDLE, 0, TRUE ) ;
}
extern int DrawFormatVString2F_VaList( float x, float y, unsigned int Color, unsigned int EdgeColor, const TCHAR *FormatString, va_list VaList )
{
	int FontHandle = DX_DEFAULT_FONT_HANDLE ;

	TCHAR_FONTHANDLE_FORMATSTRING_VALIST_SETUP( -1 )

	return NS_DrawStringFToHandle( x, y, String, Color, DX_DEFAULT_FONT_HANDLE, EdgeColor, TRUE ) ;
}

// �f�t�H���g�t�H���g�n���h�����g�p���ď����w�蕶������g��`�悷��( ���W�w�肪 float �� )
extern int DrawExtendFormatStringF_VaList( float x, float y, double ExRateX, double ExRateY, unsigned int Color, const TCHAR *FormatString, va_list VaList )
{
	int FontHandle = DX_DEFAULT_FONT_HANDLE ;

	TCHAR_FONTHANDLE_FORMATSTRING_VALIST_SETUP( -1 )

	return NS_DrawExtendStringFToHandle( x, y, ExRateX, ExRateY, String, Color, DX_DEFAULT_FONT_HANDLE, 0, FALSE ) ;
}
extern int DrawExtendFormatString2F_VaList( float x, float y, double ExRateX, double ExRateY, unsigned int Color, unsigned int EdgeColor, const TCHAR *FormatString, va_list VaList )
{
	int FontHandle = DX_DEFAULT_FONT_HANDLE ;

	TCHAR_FONTHANDLE_FORMATSTRING_VALIST_SETUP( -1 )

	return NS_DrawExtendStringFToHandle( x, y, ExRateX, ExRateY, String, Color, DX_DEFAULT_FONT_HANDLE, EdgeColor, FALSE ) ;
}

// �f�t�H���g�t�H���g�n���h�����g�p���ď����w�蕶������g��`�悷��( �c���� )( ���W�w�肪 float �� )
extern int DrawExtendFormatVStringF_VaList( float x, float y, double ExRateX, double ExRateY, unsigned int Color, const TCHAR *FormatString, va_list VaList )
{
	int FontHandle = DX_DEFAULT_FONT_HANDLE ;

	TCHAR_FONTHANDLE_FORMATSTRING_VALIST_SETUP( -1 )

	return NS_DrawExtendStringFToHandle( x, y, ExRateX, ExRateY, String, Color, DX_DEFAULT_FONT_HANDLE, 0, TRUE ) ;
}
extern int DrawExtendFormatVString2F_VaList( float x, float y, double ExRateX, double ExRateY, unsigned int Color, unsigned int EdgeColor, const TCHAR *FormatString, va_list VaList )
{
	int FontHandle = DX_DEFAULT_FONT_HANDLE ;

	TCHAR_FONTHANDLE_FORMATSTRING_VALIST_SETUP( -1 )

	return NS_DrawExtendStringFToHandle( x, y, ExRateX, ExRateY, String, Color, DX_DEFAULT_FONT_HANDLE, EdgeColor, TRUE ) ;
}

// �f�t�H���g�t�H���g�n���h�����g�p���ď����w�蕶�������]�`�悷��( ���W�w�肪 float �� )
extern int DrawRotaFormatStringF_VaList( float x, float y, double ExRateX, double ExRateY, double RotCenterX, double RotCenterY, double RotAngle, unsigned int Color, unsigned int EdgeColor, int VerticalFlag, const TCHAR *FormatString, va_list VaList )
{
	int FontHandle = DX_DEFAULT_FONT_HANDLE ;

	TCHAR_FONTHANDLE_FORMATSTRING_VALIST_SETUP( -1 )

	return NS_DrawRotaStringFToHandle( x, y, ExRateX,  ExRateY, RotCenterX, RotCenterY, RotAngle, Color, DX_DEFAULT_FONT_HANDLE, EdgeColor, VerticalFlag, String ) ;
}

// �f�t�H���g�t�H���g�n���h�����g�p���ď����w�蕶�����ό`�`�悷��( ���W�w�肪 float �� )
extern int DrawModiFormatStringF_VaList( float x1, float y1, float x2, float y2, float x3, float y3, float x4, float y4, unsigned int Color, unsigned int EdgeColor, int VerticalFlag, const TCHAR *FormatString, va_list VaList )
{
	int FontHandle = DX_DEFAULT_FONT_HANDLE ;

	TCHAR_FONTHANDLE_FORMATSTRING_VALIST_SETUP( -1 )

	return NS_DrawModiStringFToHandle( x1, y1, x2, y2, x3, y3, x4, y4, Color, DX_DEFAULT_FONT_HANDLE, EdgeColor, VerticalFlag, String ) ;
}
	   	   
// �t�H���g�n���h�����g�p���ď����w�蕶�����`�悷��
extern int DrawFormatStringToHandle_VaList( int x, int y, unsigned int Color, int FontHandle, const TCHAR *FormatString, va_list VaList )
{
	TCHAR_FONTHANDLE_FORMATSTRING_VALIST_SETUP( -1 )

	// �`�悷��
	return NS_DrawStringToHandle( x, y, String, Color, FontHandle, 0, FALSE ) ;
}
extern int DrawFormatString2ToHandle_VaList( int x, int y, unsigned int Color, unsigned int EdgeColor, int FontHandle, const TCHAR *FormatString, va_list VaList )
{
	TCHAR_FONTHANDLE_FORMATSTRING_VALIST_SETUP( -1 )

	// �`�悷��
	return NS_DrawStringToHandle( x, y, String, Color, FontHandle, EdgeColor, FALSE ) ;
}

// �t�H���g�n���h�����g�p���ď����w�蕶�����`�悷��( �c���� )
extern int DrawFormatVStringToHandle_VaList( int x, int y, unsigned int Color, int FontHandle, const TCHAR *FormatString, va_list VaList )
{
	TCHAR_FONTHANDLE_FORMATSTRING_VALIST_SETUP( -1 )

	// �`�悷��
	return NS_DrawStringToHandle( x, y, String, Color, FontHandle, 0, TRUE ) ;
}
extern int DrawFormatVString2ToHandle_VaList( int x, int y, unsigned int Color, unsigned int EdgeColor, int FontHandle, const TCHAR *FormatString, va_list VaList )
{
	TCHAR_FONTHANDLE_FORMATSTRING_VALIST_SETUP( -1 )

	// �`�悷��
	return NS_DrawStringToHandle( x, y, String, Color, FontHandle, EdgeColor, TRUE ) ;
}

// �t�H���g�n���h�����g�p���ď����w�蕶������g��`�悷��
extern int DrawExtendFormatStringToHandle_VaList( int x, int y, double ExRateX, double ExRateY, unsigned int Color, int FontHandle, const TCHAR *FormatString, va_list VaList )
{
	TCHAR_FONTHANDLE_FORMATSTRING_VALIST_SETUP( -1 )

	// �`�悷��
	return NS_DrawExtendStringToHandle( x, y, ExRateX, ExRateY, String, Color, FontHandle, 0, FALSE ) ;
}
extern int DrawExtendFormatString2ToHandle_VaList( int x, int y, double ExRateX, double ExRateY, unsigned int Color, unsigned int EdgeColor, int FontHandle, const TCHAR *FormatString, va_list VaList )
{
	TCHAR_FONTHANDLE_FORMATSTRING_VALIST_SETUP( -1 )

	// �`�悷��
	return NS_DrawExtendStringToHandle( x, y, ExRateX, ExRateY, String, Color, FontHandle, EdgeColor, FALSE ) ;
}

// �t�H���g�n���h�����g�p���ď����w�蕶������g��`�悷��( �c���� )
extern int DrawExtendFormatVStringToHandle_VaList( int x, int y, double ExRateX, double ExRateY, unsigned int Color, int FontHandle, const TCHAR *FormatString, va_list VaList )
{
	TCHAR_FONTHANDLE_FORMATSTRING_VALIST_SETUP( -1 )

	// �`�悷��
	return NS_DrawExtendStringToHandle( x, y, ExRateX, ExRateY, String, Color, FontHandle, 0, TRUE ) ;
}
extern int DrawExtendFormatVString2ToHandle_VaList( int x, int y, double ExRateX, double ExRateY, unsigned int Color, unsigned int EdgeColor, int FontHandle, const TCHAR *FormatString, va_list VaList )
{
	TCHAR_FONTHANDLE_FORMATSTRING_VALIST_SETUP( -1 )

	// �`�悷��
	return NS_DrawExtendStringToHandle( x, y, ExRateX, ExRateY, String, Color, FontHandle, EdgeColor, TRUE ) ;
}

// �t�H���g�n���h�����g�p���ď����w�蕶�������]�`�悷��
extern int DrawRotaFormatStringToHandle_VaList( int x, int y, double ExRateX, double ExRateY, double RotCenterX, double RotCenterY, double RotAngle, unsigned int Color, int FontHandle, unsigned int EdgeColor, int VerticalFlag, const TCHAR *FormatString, va_list VaList  )
{
	TCHAR_FONTHANDLE_FORMATSTRING_VALIST_SETUP( -1 )

	// �`�悷��
	return NS_DrawRotaStringToHandle( x, y, ExRateX,  ExRateY, RotCenterX, RotCenterY, RotAngle, Color, FontHandle, EdgeColor, VerticalFlag, String ) ;
}

// �t�H���g�n���h�����g�p���ď����w�蕶�����ό`�`�悷��
extern int DrawModiFormatStringToHandle_VaList( int x1, int y1, int x2, int y2, int x3, int y3, int x4, int y4, unsigned int Color, int FontHandle, unsigned int EdgeColor, int VerticalFlag, const TCHAR *FormatString, va_list VaList )
{
	TCHAR_FONTHANDLE_FORMATSTRING_VALIST_SETUP( -1 )

	// �`�悷��
	return NS_DrawModiStringToHandle( x1, y1, x2, y2, x3, y3, x4, y4, Color, FontHandle, EdgeColor, VerticalFlag, String ) ;
}

// �t�H���g�n���h�����g�p���ď����w�蕶�����`�悷��( ���W�w�肪 float �� )
extern int DrawFormatStringFToHandle_VaList( float x, float y, unsigned int Color, int FontHandle, const TCHAR *FormatString, va_list VaList )
{
	TCHAR_FONTHANDLE_FORMATSTRING_VALIST_SETUP( -1 )

	// �`�悷��
	return NS_DrawStringFToHandle( x, y, String, Color, FontHandle, 0, FALSE ) ;
}
extern int DrawFormatString2FToHandle_VaList( float x, float y, unsigned int Color, unsigned int EdgeColor, int FontHandle, const TCHAR *FormatString, va_list VaList )
{
	TCHAR_FONTHANDLE_FORMATSTRING_VALIST_SETUP( -1 )

	// �`�悷��
	return NS_DrawStringFToHandle( x, y, String, Color, FontHandle, EdgeColor, FALSE ) ;
}

// �t�H���g�n���h�����g�p���ď����w�蕶�����`�悷��( �c���� )( ���W�w�肪 float �� )
extern int DrawFormatVStringFToHandle_VaList( float x, float y, unsigned int Color, int FontHandle, const TCHAR *FormatString, va_list VaList )
{
	TCHAR_FONTHANDLE_FORMATSTRING_VALIST_SETUP( -1 )

	// �`�悷��
	return NS_DrawStringFToHandle( x, y, String, Color, FontHandle, 0, TRUE ) ;
}
extern int DrawFormatVString2FToHandle_VaList( float x, float y, unsigned int Color, unsigned int EdgeColor, int FontHandle, const TCHAR *FormatString, va_list VaList )
{
	TCHAR_FONTHANDLE_FORMATSTRING_VALIST_SETUP( -1 )

	// �`�悷��
	return NS_DrawStringFToHandle( x, y, String, Color, FontHandle, EdgeColor, TRUE ) ;
}

// �t�H���g�n���h�����g�p���ď����w�蕶������g��`�悷��( ���W�w�肪 float �� )
extern int DrawExtendFormatStringFToHandle_VaList( float x, float y, double ExRateX, double ExRateY, unsigned int Color, int FontHandle, const TCHAR *FormatString, va_list VaList )
{
	TCHAR_FONTHANDLE_FORMATSTRING_VALIST_SETUP( -1 )

	// �`�悷��
	return NS_DrawExtendStringFToHandle( x, y, ExRateX, ExRateY, String, Color, FontHandle, 0, FALSE ) ;
}
extern int DrawExtendFormatString2FToHandle_VaList( float x, float y, double ExRateX, double ExRateY, unsigned int Color, unsigned int EdgeColor, int FontHandle, const TCHAR *FormatString, va_list VaList )
{
	TCHAR_FONTHANDLE_FORMATSTRING_VALIST_SETUP( -1 )

	// �`�悷��
	return NS_DrawExtendStringFToHandle( x, y, ExRateX, ExRateY, String, Color, FontHandle, EdgeColor, FALSE ) ;
}

// �t�H���g�n���h�����g�p���ď����w�蕶������g��`�悷��( �c���� )( ���W�w�肪 float �� )
extern int DrawExtendFormatVStringFToHandle_VaList( float x, float y, double ExRateX, double ExRateY, unsigned int Color, int FontHandle, const TCHAR *FormatString, va_list VaList )
{
	TCHAR_FONTHANDLE_FORMATSTRING_VALIST_SETUP( -1 )

	// �`�悷��
	return NS_DrawExtendStringFToHandle( x, y, ExRateX, ExRateY, String, Color, FontHandle, 0, TRUE ) ;
}
extern int DrawExtendFormatVString2FToHandle_VaList( float x, float y, double ExRateX, double ExRateY, unsigned int Color, unsigned int EdgeColor, int FontHandle, const TCHAR *FormatString, va_list VaList )
{
	TCHAR_FONTHANDLE_FORMATSTRING_VALIST_SETUP( -1 )

	// �`�悷��
	return NS_DrawExtendStringFToHandle( x, y, ExRateX, ExRateY, String, Color, FontHandle, EdgeColor, TRUE ) ;
}

// �t�H���g�n���h�����g�p���ď����w�蕶�������]�`�悷��( ���W�w�肪 float �� )
extern int DrawRotaFormatStringFToHandle_VaList( float x, float y, double ExRateX, double ExRateY, double RotCenterX, double RotCenterY, double RotAngle, unsigned int Color, int FontHandle, unsigned int EdgeColor, int VerticalFlag, const TCHAR *FormatString, va_list VaList )
{
	TCHAR_FONTHANDLE_FORMATSTRING_VALIST_SETUP( -1 )

	// �`�悷��
	return NS_DrawRotaStringFToHandle( x, y, ExRateX,  ExRateY, RotCenterX, RotCenterY, RotAngle, Color, FontHandle, EdgeColor, VerticalFlag, String ) ;
}

// �t�H���g�n���h�����g�p���ď����w�蕶�����ό`�`�悷��( ���W�w�肪 float �� )
extern int DrawModiFormatStringFToHandle_VaList( float x1, float y1, float x2, float y2, float x3, float y3, float x4, float y4, unsigned int Color, int FontHandle, unsigned int EdgeColor, int VerticalFlag, const TCHAR *FormatString, va_list VaList )
{
	TCHAR_FONTHANDLE_FORMATSTRING_VALIST_SETUP( -1 )

	// �`�悷��
	return NS_DrawModiStringFToHandle( x1, y1, x2, y2, x3, y3, x4, y4, Color, FontHandle, EdgeColor, VerticalFlag, String ) ;
}


#ifndef DX_NON_NAMESPACE

}

#endif // DX_NON_NAMESPACE

#endif // DX_NON_FONT
