// -------------------------------------------------------------------------------
// 
// 		�c�w���C�u����		�f�[�^�^�C�v��`�w�b�_�t�@�C��
// 
// 				Ver 3.24f
// 
// -------------------------------------------------------------------------------

#ifndef DX_DATATYPE_H
#define DX_DATATYPE_H

// �C���N���[�h ------------------------------------------------------------------
#include "DxCompileConfig.h"
#include <stdio.h>

#ifdef WINDOWS_DESKTOP_OS
#include "DxDataTypeWin.h"
#endif // WINDOWS_DESKTOP_OS

#ifdef __ANDROID__
#include "DxDataTypeAndroid.h"
#endif // __ANDROID__

#ifdef __APPLE__
    #include "TargetConditionals.h"
    #if TARGET_OS_IPHONE
		#include "DxDataTypeiOS.h"
	#endif
#endif // __APPLE__

// ===== hsp3dx dxlib_angle_sdl2 fork patch =====
#ifdef DX_PLATFORM_DESKTOP_SDL2
#include "DxDataTypeDesktop.h"
#endif




#ifndef DX_NON_NAMESPACE

namespace DxLib
{

#endif // DX_NON_NAMESPACE

// �}�N����` --------------------------------------------------------------------

#ifndef DX_COMPILE_TYPE_C_LANGUAGE
	#define DEFAULTPARAM( param )					param
#else
	#define DEFAULTPARAM( param )
#endif

#define SETRECT( Dest, Left, Top, Right, Bottom )	\
	( Dest ).left   = Left ;\
	( Dest ).top    = Top ;\
	( Dest ).right  = Right ;\
	( Dest ).bottom = Bottom ;

#ifdef USE_ULL
#define ULL_NUM( x )				( x##ULL )
#define LL_NUM( x )					( x##LL  )
#define ULL_PARAM( x )				x##ULL
#define LL_PARAM( x )				x##LL
#else
#define ULL_NUM( x )				( ( ULONGLONG )x )
#define LL_NUM( x )					(  ( LONGLONG )x )
#define ULL_PARAM( x )				x
#define LL_PARAM( x )				x
#endif

// �\���̒�` --------------------------------------------------------------------

// �q�f�a�`�F�\����
struct RGBCOLOR
{
	unsigned char			Blue, Green, Red, Alpha ;
} ;

// �e�[�u��-----------------------------------------------------------------------

// �������ϐ��錾 --------------------------------------------------------------

// �֐��v���g�^�C�v�錾-----------------------------------------------------------

#ifndef DX_NON_NAMESPACE

}

#endif // DX_NON_NAMESPACE

#endif // DX_DATATYPE_H
