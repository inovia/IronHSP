
//
//		HSP DB support DLL ( for ver2.6 )
//				onion software/onitama 2003/3
//

#include <windows.h>
#include <windowsx.h>
#include <stdlib.h>
#include <stdio.h>
#include "cezdb.h"
#include "hspdll.h"

/*------------------------------------------------------------*/
static	cezdb *db;
/*------------------------------------------------------------*/

int WINAPI DllMain (HINSTANCE hInstance, DWORD fdwReason, PVOID pvReserved)
{
	if ( fdwReason==DLL_PROCESS_ATTACH ) {
		db = NULL;
	}
	if ( fdwReason==DLL_PROCESS_DETACH ) {
		if ( db != NULL ) { delete db; db = NULL; }
	}
	return TRUE ;
}

char *getvptr( HSPEXINFO *hei, PVal **pval, int *size )
{
	//		�ϐ��|�C���^�𓾂�
	//
	APTR aptr;
	PDAT *pdat;
	HspVarProc *proc;
	aptr = hei->HspFunc_prm_getva( pval );
	proc = hei->HspFunc_getproc( (*pval)->flag );
	(*pval)->offset = aptr;
	pdat = proc->GetPtr( *pval );
	return (char *)proc->GetBlockSize( *pval, pdat, size );
}

/*
static int valsize( PVAL2 *pv )
{
	//		calc object memory used size
	//			result : size(byte)
	int i,j;
	int vm=1;
	i=1;
	while(1) {
		j=pv->len[i];if (j==0) break;
		vm*=j;i++;if (i==5) break;
	}
	return vm<<2;
}
*/
/*------------------------------------------------------------*/

EXPORT BOOL WINAPI dbini( int p1, int p2, int p3, int p4 )
{
	//	DLL dbini (type$00)
	//
	db = new cezdb;
	if ( db->GetMode() == CEZDB_MODE_ERROR ) return -1;
	return 0;
}


EXPORT BOOL WINAPI dbbye( int p1, int p2, int p3, int p4 )
{
	//	DLL dbbye (type$00)
	//
	if ( db != NULL ) { delete db; db = NULL; }
	return 0;
}


EXPORT BOOL WINAPI dbopen( HSPEXINFO *hei, int p1, int p2, int p3 )
{
	//	DLL dbopen "DSN",mode (type$202)
	//
	int res;
	char *ep1;
	int ep2;
	ep1 = hei->HspFunc_prm_gets();			// �p�����[�^1:������
	ep2 = hei->HspFunc_prm_getdi(0);		// �p�����[�^2:���l
	if ( *hei->er ) return *hei->er;		// �G���[�`�F�b�N
	res = db->Connect( ep1, ep2 );
	return res;
}


EXPORT BOOL WINAPI dbclose( int p1, int p2, int p3, int p4 )
{
	//	DLL dbclose (type$00)
	//
	db->Disconnect();
	return 0;
}


EXPORT BOOL WINAPI dbstat( int p1, int p2, int p3, int p4 )
{
	//	DLL dbstat (type$00)
	//
	return -db->GetMode();
}


EXPORT BOOL WINAPI dbsend( HSPEXINFO *hei, int p1, int p2, int p3 )
{
	//	DLL dbsend "SQL" (type$202)
	//
	int res;
	char *ep1;
	ep1 = hei->HspFunc_prm_gets();			// �p�����[�^1:������
	if ( *hei->er ) return *hei->er;		// �G���[�`�F�b�N
	res = db->SendSQL( ep1 );
	return res;
}


EXPORT BOOL WINAPI dbgets( HSPEXINFO *hei, int p1, int p2, int p3 )
{
	//	DLL dbgets �ϐ� (type$202)
	//
	PVal *pval;
	int i;
	int size;
	char *pt;

	pt = getvptr( hei, &pval, &size );
	//hei->HspFunc_prm_getv();				// �p�����[�^1:�ϐ�
	//pval = *hei->mpval;						// �ϐ���PVAL2�|�C���^���擾
	//if ( *hei->er ) return *hei->er;		// �G���[�`�F�b�N
	//pval->flag=2;							// ������^��
	//pt=pval->pt;
	*pt = 0;
	//size = valsize( pval );
	i = db->GetResult( pt, size );
	if ( i<0 ) return i;
	return 0;
}


EXPORT BOOL WINAPI dbspchr( int p1, int p2, int p3, int p4 )
{
	//	DLL dbspchr (type$00)
	//
	db->SetSeparator( p1 );
	return 0;
}


static char *strstr2( char *target, char *src )
{
	//		strstr�֐��̑S�p�Ή���
	//
	unsigned char *p;
	unsigned char *s;
	unsigned char *p2;
	unsigned char a1;
	unsigned char a2;
	unsigned char a3;
	p=(unsigned char *)target;
	if (( *src==0 )||( *target==0 )) return NULL;
	while(1) {
		a1=*p;if ( a1==0 ) break;
		p2 = p;
		s=(unsigned char *)src;
		while(1) {
			a2=*s++;if (a2==0) return (char *)p;
			a3=*p2++;if (a3==0) break;
			if (a2!=a3) break;
		}
		p++;							// �����ʒu���ړ�
		if (a1>=129) {					// �S�p�����`�F�b�N
			if ((a1<=159)||(a1>=224)) p++;
		}
	}
	return NULL;
}


EXPORT BOOL WINAPI dbcnvstr( HSPEXINFO *hei, int p1, int p2, int p3 )
{
	//	DLL dbcnvstr (type$202)
	//
	//PVal *pval;
	char *ep1;
	char *p;
	char *vv;
	char *vptr;
	char stmp[32000];
	char schstr[256];
	char cnvstr[256];

	vptr = (char *)hei->HspFunc_prm_getv();				// �p�����[�^1:�ϐ�
	//pval = *hei->pval;						// �ϐ���PVAL2�|�C���^���擾
	ep1 = hei->HspFunc_prm_gets();			// �p�����[�^2:������
	strcpy( schstr, ep1 );
	ep1 = hei->HspFunc_prm_gets();			// �p�����[�^3:������
	strcpy( cnvstr, ep1 );
	if ( *hei->er ) return *hei->er;		// �G���[�`�F�b�N

	stmp[0]=0;
	vv = vptr;
	while(1) {
		p = strstr2( vv, schstr );
		if ( p == NULL ) break;
		*p = 0;
		strcat( stmp, vv );
		strcat( stmp, cnvstr );
		vv = p + strlen( schstr );
	}
	strcat( stmp, vv );
	strcpy( vptr, stmp );
	return 0;
}


