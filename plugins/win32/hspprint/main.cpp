
//
//		HSP3.x plugin source
//		onion software/onitama 2010/4
//

#define WIN32_LEAN_AND_MEAN		// Exclude rarely-used stuff from Windows headers
#include <windows.h>
#include <stdio.h>
#include <stdlib.h>
#include "../hpi3sample/hsp3plugin.h"

#include "DevPrinter.h"

/*----------------------------------------------------------------*/


/*------------------------------------------------------------*/
/*
		interface
*/
/*------------------------------------------------------------*/

int WINAPI DllMain (HINSTANCE hInstance, DWORD fdwReason, PVOID pvReserved)
{
	if ( fdwReason==DLL_PROCESS_ATTACH ) {
	}
	if ( fdwReason==DLL_PROCESS_DETACH ) {
	}
	return TRUE ;
}

 /*------------------------------------------------------------*/
/*
		controller
*/
/*------------------------------------------------------------*/

EXPORT BOOL WINAPI prnflags( HSPEXINFO *hei, int p1, int p2, int p3 )
{
	//	(type$202)
	//	�v�����^��񋓂��邽�߂̃t���O��ݒ肷��
	//		prnflags flags
	//		
	//		  PRINTER_ENUM_DEFAULT = 1
	//		  PRINTER_ENUM_LOCAL = 2
	//		  PRINTER_ENUM_REMOTE = $10
	//		  PRINTER_ENUM_SHARED = $20
	//		  PRINTER_ENUM_NETWORK = $40
	//
	int ep1;
	ep1 = hei->HspFunc_prm_getdi(0);			// �p�����[�^1:���l
	DevSetPrinterFlags( ep1 );
	return 0;
}


EXPORT BOOL WINAPI enumprn( HSPEXINFO *hei, int p1, int p2, int p3 )
{
	//	(type$202)
	//	�v�����^��񋓂���
	//		enumprn �ϐ�
	//
	char *ss;
	PVal *pv;
	APTR ap;
	int sz;
	int num;

	ap = hei->HspFunc_prm_getva( &pv );			// �p�����[�^1:�ϐ�

	sz = DevGetEnumPrinterName( NULL );
	ss = (char *)malloc( sz+1 );
	DevGetEnumPrinterName( ss );

	hei->HspFunc_prm_setva( pv, ap, HSPVAR_FLAG_STR, ss );	// �ϐ��ɒl����
	free( ss );

	num = DevGetNumPrinter();
	return -num;
}


EXPORT BOOL WINAPI getdefprn( HSPEXINFO *hei, int p1, int p2, int p3 )
{
	//	(type$202)
	//	�K��̃v�����^���擾����
	//		getdefprn �ϐ�
	//
	char ss[512];
	PVal *pv;
	APTR ap;

	*ss = 0;
	ap = hei->HspFunc_prm_getva( &pv );			// �p�����[�^1:�ϐ�
	DevGetDefaultPrinter( ss );
	hei->HspFunc_prm_setva( pv, ap, HSPVAR_FLAG_STR, ss );	// �ϐ��ɒl����

	return 0;
}


EXPORT BOOL WINAPI propprn( HSPEXINFO *hei, int p1, int p2, int p3 )
{
	//	(type$202)
	//	�v�����^���̎擾
	//		propprn �ϐ�,�ϐ�2,id,type
	//
	PVal *pv;
	APTR ap;
	PVal *pv2;
	APTR ap2;
	int ep1,ep2,x,y;
	DEVPRINTERDOC doc;

	ap = hei->HspFunc_prm_getva( &pv );			// �p�����[�^1:�ϐ�
	ap2 = hei->HspFunc_prm_getva( &pv2 );		// �p�����[�^2:�ϐ�
	ep1 = hei->HspFunc_prm_getdi(0);			// �p�����[�^3:���l
	ep2 = hei->HspFunc_prm_getdi(0);			// �p�����[�^3:���l

	if ( DevGetPrinterInfo( &doc, ep1 ) == false ) return -1;

	x = y = 0;
	switch( ep2 ) {
	case 0:
		x = doc.HorzRes;
		y = doc.VertRes;
		break;
	case 1:
		x = doc.PhysicalWidth;
		y = doc.PhysicalHeight;
		break;
	case 2:
		x = doc.PhysicalOffsetX;
		y = doc.PhysicalOffsetY;
		break;
	case 3:
		x = doc.HorzSize;
		y = doc.VertSize;
		break;
	}

	hei->HspFunc_prm_setva( pv, ap, HSPVAR_FLAG_INT, &x );		// �ϐ��ɒl����
	hei->HspFunc_prm_setva( pv2, ap2, HSPVAR_FLAG_INT, &y );	// �ϐ��ɒl����

	return 0;
}


EXPORT BOOL WINAPI execprn( HSPEXINFO *hei, int p1, int p2, int p3 )
{
	//	(type$202)
	//	�v�����^���M
	//		execprn �v�����^ID,x,y,sx,sy,bx,by,bsx,bsy,"name"
	//
	int ep1;
	int x,y,sx,sy,bx,by,bsx,bsy;
	char *docname;
	BMSCR *bm;

	bm = (BMSCR *)hei->HspFunc_getbmscr( *(hei->actscr) );

	ep1 = hei->HspFunc_prm_getdi(0);	// �p�����[�^1:���l
	x = hei->HspFunc_prm_getdi(0);
	y = hei->HspFunc_prm_getdi(0);
	sx = hei->HspFunc_prm_getdi( bm->sx );
	sy = hei->HspFunc_prm_getdi( bm->sy );
	bx = hei->HspFunc_prm_getdi(0);
	by = hei->HspFunc_prm_getdi(0);
	bsx = hei->HspFunc_prm_getdi( bm->sx );
	bsy = hei->HspFunc_prm_getdi( bm->sy );
	docname = hei->HspFunc_prm_getds( "hspdoc" );

	DevPrintBitmapPrinter( ep1, docname, x, y, sx, sy, (BITMAPINFO *)bm->pbi, bm->pBit, bx, by, bsx, bsy );

	return 0;
}


EXPORT BOOL WINAPI prndialog( HSPEXINFO *hei, int p1, int p2, int p3 )
{
	//	(type$202)
	//	�v�����^�̐ݒ�_�C�A���O���J��
	//		prndialog no
	//
	int ep1;
	DEVPRINTERDOC doc;
	ep1 = hei->HspFunc_prm_getdi(0);			// �p�����[�^1:���l
	DevGetPrinterProperty( &doc, ep1 );
	return 0;
}


/*------------------------------------------------------------------------------------*/
