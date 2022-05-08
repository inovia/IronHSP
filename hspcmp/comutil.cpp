
//
//	HSP3 COM support
//	onion software/onitama 2005/4
//

#include "../hsp3/hsp3config.h"

#ifdef HSPWIN
#define USE_WINDOWS_COM		// WindowsCOM API���g�p����
#endif

#ifdef USE_WINDOWS_COM
#include <windows.h>
#include <ocidl.h>
#include <objbase.h>
#endif

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "comutil.h"

#ifdef USE_WINDOWS_COM
/*------------------------------------------------------------*/
/*
		Windows�̏ꍇ�͈ȉ����g�p���Ă��������B
*/
/*------------------------------------------------------------*/

static void cnvwstr( void *out, char *in, int bufsize )
{
	//	sjis->unicode �ɕϊ�
	//
	MultiByteToWideChar( CP_ACP, 0, in, -1, (LPWSTR)out, bufsize );
}

static int GetIIDFromString( IID *iid, char *ps, bool fClsid = false )
{
	//		SJIS������ IID ���� IID �\���̂𓾂�
	//
	//		fClsid ���^�̂Ƃ��AProgID ����� CLSID �擾�����݂�
	//		ProgID �̕ϊ��Ɏ��s�����ꍇ�� 1 ��Ԃ�
	//		(����ȊO�̃G���[�͗�O�� throw)
	//
	char stmp[1024];
	HRESULT hr;
	cnvwstr( stmp, ps, 1024 );
	if ( *ps == '{' ) {
		// GUID ������ �� GUID �\����
		hr = IIDFromString( (LPOLESTR)stmp, iid );
		if ( SUCCEEDED(hr) ) return 0;
	}
	if ( fClsid ) {
		// ProgID ������ �� GUID �\����
		hr = CLSIDFromProgID( (LPOLESTR)stmp, iid );
		if ( SUCCEEDED(hr) ) return 0;
		return 1;
	}
	return -1;
}

int ConvertIID( COM_GUID *guid, char *name )
{
	return GetIIDFromString( (IID *)guid, name );
}

#else

/*------------------------------------------------------------*/
/*
		interface
*/
/*------------------------------------------------------------*/

int ConvertIID( COM_GUID *guid, char *name )
{
	//		SJIS������ IID ���� IID �\���̂𓾂�
	//		(COM�T�|�[�g�ꍇ�͕ϊ����K�v)
	return 0;
}

#endif
