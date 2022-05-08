/**
 * @brief Footy2�S�̂��痘�p�����w�b�_
 * @note �O�����J�p�ł͂Ȃ��āA�v���R���p�C���p�ł��B
 * @author Shinji Watanabe
 * @date Oct.26.2008
 */

#pragma once

//#if defined( _DEBUG ) && !defined ( UNDER_CE )/*Tp*/
#	define PRINT_ENABLED
//#endif/*Tp*/

// �W���w�b�_�t�@�C��
#include <windows.h>
#include <math.h>
#include <vector>
#include <list>
#include <vector>
#include <string>
#include <wchar.h>

#ifndef WM_MOUSEWHEEL
#	include <zmouse.h>						/*�}�E�X�z�C�[�����b�Z�[�W*/
#endif	/* WM_MOUSEWHEEL */

#ifdef PRINT_ENABLED
#	include <assert.h>
#	include <stdarg.h>
#endif	/* PRINT_ENABLED */

// �����w�b�_�t�@�C��
#include "Footy2.h"
#include "Footy.h"

// �֗��ȃ}�N��
#define WIDEN_REAL(x) L ## x
#define WIDEN(x) WIDEN_REAL(x)

// �����Ƃ̒�`
#ifdef UNDER_CE
#	define CSM_DEFAULT CSM_SHIFT_JIS_2004
#	define FOOTY2STRCPY(dest,src,size)	strncpy(dest, src, size)
#	define FOOTY2SPRINTF _snwprintf
#else	/*UNDER_CE*/
#	define CSM_DEFAULT	CSM_PLATFORM
#	define FOOTY2STRCPY(dest,src,size)	strcpy_s(dest, size, src)
#	define FOOTY2SPRINTF swprintf_s
#endif	/*UNDER_CE*/

// �v�����g�Ȃ�
#ifdef PRINT_ENABLED
#define		FOOTY2_ASSERT( cond )		assert( cond );
#define		FOOTY2_PRINTF( fmt, ... )	FormatPrint( WIDEN( __FILE__ ) , __LINE__, fmt, __VA_ARGS__ );
#else	/*_DEBUG*/
#define		FOOTY2_ASSERT( cond )		( void ) 0;
#define		FOOTY2_PRINTF( fmt, ... )	( void ) 0;
#endif	/*_DEBUG*/

// �ȗ��`
#define SAFE_DELETE(p)			if (p) {delete [] (p); (p) = NULL;}
#define SAFE_FREE(p)			if (p) {free((p)); (p) = NULL;}
#define SAFE_DELETEOBJECT(p)	if (p) {DeleteObject(p); (p) = NULL;}
#define	forever					for(;;)

// �ʖ��錾
typedef std::list<CFooty*>::iterator FootyPt;

// �֐��̃v���g�^�C�v�錾
CFooty *GetFooty( int nID );
void FormatPrint( const wchar_t* filename, int nLine, const wchar_t* fmt, ... );

/*[EOF]*/
