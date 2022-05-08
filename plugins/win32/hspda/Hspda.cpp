
//
//		Easy Data Access Plugin for HSP3
//				onion software/onitama 1999
//				               onitama 2005/5
//

#include <windows.h>
#include <stdio.h>
#include <stdarg.h>

#include "../hpi3sample/hsp3plugin.h"
#include "membuf.h"
#include "ccsv.h"
#include "MTRand.h"

static ccsv *csv;


void Alertf( char *format, ... )
{
	char textbf[1024];
	va_list args;
	va_start(args, format);
	vsprintf(textbf, format, args);
	va_end(args);
	MessageBox( NULL, textbf, "error",MB_ICONINFORMATION | MB_OK );
}



int WINAPI hspda_DllMain (HINSTANCE hInstance, DWORD fdwReason, PVOID pvReserved)
{
	if ( fdwReason==DLL_PROCESS_ATTACH ) {
		csv = new ccsv();
		MTRandInit( -1 );
	}
	if ( fdwReason==DLL_PROCESS_DETACH ) {
		delete csv;
		csv = NULL;
	}
	return TRUE ;
}

/*------------------------------------------------------------*/
/*
		Sort Routines
*/
/*------------------------------------------------------------*/

static int qsort_order;

typedef struct {
	union {
		int ikey;
		double dkey;
		char *skey;
	} as;
	int info;
} DATA;

static void swap(DATA *a, DATA *b)
{
    DATA t;
    t = *a;
    *a = *b;
    *b = t;
}

static void rquickSort(DATA *data, int asdes, int first, int last)
{
	//		�N�C�b�N�\�[�g
	//
    int i, j, x;

    i = first;
    j = last;
    //x = (data[i].as.ikey / 2) + (data[j].as.ikey / 2);
	x = (data[i].as.ikey + data[j].as.ikey)/2; 

//  while (i < j) {

    while (1) {
        if (asdes == 0) {
            while (data[i].as.ikey < x) i++;
            while (data[j].as.ikey > x) j--;
        } else {
            while (data[i].as.ikey > x) i++;
            while (data[j].as.ikey < x) j--;
        }

        if (i >= j) break;
        swap(&data[i], &data[j]);
        i++;
        j--;
/*
        if (i < j) {
            swap(&data[i], &data[j]);
            i++;
            j--;
        }
*/
    }
    if (first < i - 1) rquickSort(data, asdes, first, i - 1);
    if (last  > j + 1) rquickSort(data, asdes, j + 1, last);
}

void QuickSort( DATA *data, int nmem, int asdes )
{
    if (nmem <= 1) return;
    rquickSort(data, asdes, 0, nmem - 1);
}


int compare_int( const void *a, const void *b )
{
    const DATA *data_a = (DATA *)a;
    const DATA *data_b = (DATA *)b;

    return data_a->as.ikey > data_b->as.ikey ? 1 : data_a->as.ikey == data_b->as.ikey ? 0 : -1;
}


int compare_intr( const void *a, const void *b )
{
    const DATA *data_a = (DATA *)a;
    const DATA *data_b = (DATA *)b;

	return data_b->as.ikey > data_a->as.ikey ? 1 : data_a->as.ikey == data_b->as.ikey ? 0 : -1;
}


void QuickSort2( DATA *data, int nmem, int asdes )
{
    if (nmem <= 1) return;
	if ( asdes == 0 ) {
		qsort( data, nmem, sizeof(DATA), compare_int );
	} else {
		qsort( data, nmem, sizeof(DATA), compare_intr );
	}
}


void BubbleSortStr( DATA *data, int nmem, int asdes )
{
	int i, j;
	for (i = 0; i < nmem - 1; i++) {
	  for (j = nmem - 1; j >= i + 1; j--) {
	    if (asdes == 0) {
		  if ( strcmp( data[j].as.skey, data[j-1].as.skey)<0 )
				swap(&data[j], &data[j-1]);
		}
		else {
		  if ( strcmp( data[j].as.skey, data[j-1].as.skey)>0 )
				swap(&data[j], &data[j-1]);
		}
	  }
	}
}


void BubbleSortDouble( DATA *data, int nmem, int asdes )
{
	int i, j;
	for (i = 0; i < nmem - 1; i++) {
	  for (j = nmem - 1; j >= i + 1; j--) {
	    if (asdes == 0) {
			if ( data[j].as.dkey < data[j-1].as.dkey ) swap(&data[j], &data[j-1]);
		}
		else {
			if ( data[j].as.dkey > data[j-1].as.dkey ) swap(&data[j], &data[j-1]);
		}
	  }
	}
}


int NoteToData( char *adr, DATA *data )
{
	char *p = adr;
	int line = 0;
	while (*p != '\0') {
		data[line].as.skey=p;
		data[line].info=line;
		while (*p != '\0') {
			char c = *p;
			if (c == '\n' || c == '\r') {
				*p = '\0';
			}
			p ++;
			if (c == '\n') break;
			if (c == '\r') {
				if (*p == '\n') p++;
				break;
			}
		}
		line ++;
	}
	return line;
}


int GetNoteLines( char *adr )
{
	int line = 0;
	char *p = adr;
	while (*p != '\0') {
		while (*p != '\0') {
			char c = *p++;
			if (c == '\n') break;
			if (c == '\r') {
				if (*p == '\n') p ++;
				break;
			}
		}
		line ++;
	}
	return line;
}


size_t DataToNoteLen( DATA *data, int num )
{
	size_t len = 0;
	int i;
	for (i = 0; i < num; i++) {
		char *s = data[i].as.skey;
		len += lstrlen(s) + 2;	// lstrlen("\r\n")
	}
	return len;
}


void DataToNote( DATA *data, char *adr, int num )
{
	int a;
	char *p;
	char *s;
	p=adr;
	for(a=0;a<num;a++) {
		s=data[a].as.skey;
		lstrcpy( p, s );
		p+=lstrlen( s );
		*p++=13; *p++=10;			// Add CR/LF
	}
	*p=0;
}


void StrToData( char *adr, int num, int len, DATA *data )
{
	int a;
	char *p;
	p=adr;
	for(a=0;a<num;a++) {
		data[a].as.skey=p;
		data[a].info=a;
		p+=len;
	}
}


void DataToStr( DATA *data, char *adr, int num, int len )
{
	int a;
	char *p;
	char *s;
	p=adr;
	for(a=0;a<num;a++) {
		s=data[a].as.skey;
		lstrcpyn( p, s, len );
		p+=len;
	}
}


/*------------------------------------------------------------*/
/*
		HSP interface
*/
/*------------------------------------------------------------*/

static	DATA *dtmp = NULL;
static	int dtmp_size;

static void DataBye( void )
{
	if (dtmp!=NULL) {
		free(dtmp);
	}
}

static void DataIni( int size )
{
	DataBye();
	dtmp=(DATA *)malloc( sizeof(DATA)*size );
	dtmp_size = size;
}

static void DataExpand( int size )
{
	if (size <= dtmp_size) return;
	int new_size = dtmp_size;
	if (new_size < 16) new_size = 16;
	while (size > new_size) {
		new_size *= 2;
	}
	dtmp = (DATA *)realloc( dtmp, sizeof(DATA)*new_size );
	memset( dtmp + dtmp_size, 0, sizeof(DATA)*(new_size - dtmp_size) );
	dtmp_size = new_size;
}


static void DataInc( int n )
{
	DataExpand( n + 1 );
	dtmp[n].info ++;
}


static void *Hsp3GetBlockSize( HSPEXINFO *hei, PVal *pv, APTR ap, int *size )
{
	//		(HSP3�p)
	//		pv,ap���烁�����u���b�N���擾����
	//
	PDAT *pd;
	HspVarProc *proc;
	proc = hei->HspFunc_getproc( pv->flag );
	pv->offset = ap;
	pd =  proc->GetPtr( pv );
	return proc->GetBlockSize( pv,pd,size );
}


EXPORT BOOL WINAPI sortval( HSPEXINFO *hei, int p2, int p3, int p4 )
{
	//
	//		sortval val, order (type$202)
	//
	int a,i;
	int *p;
	double *dp;
	PVal *p1;
	APTR ap;
	int order;

	ap = hei->HspFunc_prm_getva( &p1 );		// �p�����[�^1:�ϐ�
	order = hei->HspFunc_prm_getdi( 0 );	// �p�����[�^2:���l

	i=p1->len[1];
	if (i<=0) return -1;
	switch(p1->flag) {
	case 3:						// double
		dp=(double *)p1->pt;
		DataIni( i );
		for(a=0;a<i;a++) {
			dtmp[a].as.dkey=dp[a];
			dtmp[a].info=a;
		}
		BubbleSortDouble( dtmp, i, order );
		for(a=0;a<i;a++) {
			//dp[a]=dtmp[a].as.dkey;
			hei->HspFunc_prm_setva( p1, a, HSPVAR_FLAG_DOUBLE, &(dtmp[a].as.dkey) );	// �ϐ��ɒl����
		}
		break;
	case 4:						// int
		p=(int *)p1->pt;
		DataIni( i );
		for(a=0;a<i;a++) {
			dtmp[a].as.ikey=p[a];
			dtmp[a].info=a;
		}
		QuickSort2( dtmp, i, order );
		for(a=0;a<i;a++) {
			p[a]=dtmp[a].as.ikey;
		}
		break;
	default:
		return -1;
	}

	return 0;
}


EXPORT BOOL WINAPI sortstr( HSPEXINFO *hei, int p1, int p2, int p3 )
{
	//
	//		sortstr val, order (type$202)
	//
	int i,len,sflag,size;
	char *p;
	char *psrc;
	PVal *pv;
	APTR ap;
	CMemBuf buf;

	ap = hei->HspFunc_prm_getva( &pv );		// �p�����[�^1:�ϐ�
	sflag = hei->HspFunc_prm_getdi( 0 );	// �p�����[�^2:���l

	if (( pv->flag != 2 )||( pv->len[2] != 0 )||( ap != 0 )) return -1;
	len = pv->len[1];
	DataIni( len );

	for(i=0;i<len;i++) {
		int pos = buf.GetSize();
		p = (char *)Hsp3GetBlockSize( hei, pv, i, &size );
		buf.PutStrBlock( p );

		dtmp[i].as.ikey = pos;
		dtmp[i].info = i;
	}
	for(i=0;i<len;i++) {
		dtmp[i].as.skey = buf.GetBuffer() + dtmp[i].as.ikey;
	}

	BubbleSortStr( dtmp, len, sflag );

	for(i=0;i<len;i++) {
		psrc = dtmp[i].as.skey;
		hei->HspFunc_prm_setva( pv, i, HSPVAR_FLAG_STR, psrc );	// �ϐ��ɒl����
	}

	return 0;
}


/*
EXPORT BOOL WINAPI sortstr( PVAL2 *p1, int p2, int p3, int p4 )
{
	//
	//		sortstr val, order (type$83)
	//
	int i,len;
	char *p;
	char *stmp;

	len=(p1->len[1])<<2;
	i=p1->len[2];
	p=p1->pt;

	if (p1->flag!=2) return -1;
	if (i<=0) return -1;

	DataIni( i );

	stmp=(char *)malloc( len*i );
	memcpy( stmp, p, len*i );
	StrToData( stmp, i, len, dtmp );
	BubbleSortStr( dtmp, i, p2 );
	DataToStr( dtmp, p, i, len );
	free(stmp);
	
	
//	for(a=0;a<i;a++) {
//		p[0]=48+a;
//		p+=len<<2;
//	}

	return 0;
}
*/



EXPORT BOOL WINAPI sortnote( HSPEXINFO *hei, int p1, int p2, int p3 )
{
	//
	//		sortnote val, order (type$202)
	//
	int i,size,sflag;
	char *p;
	char *stmp;
	PVal *pv;
	APTR ap;

	ap = hei->HspFunc_prm_getva( &pv );		// �p�����[�^1:�ϐ�
	sflag = hei->HspFunc_prm_getdi( 0 );	// �p�����[�^2:���l

	p = (char *)Hsp3GetBlockSize( hei, pv, ap, &size );
	i = GetNoteLines(p);
	if ( i <= 0 ) return -1;

	//Alertf( "%d[%s]", size,p );

	DataIni( i );

	NoteToData( p, dtmp );
	BubbleSortStr( dtmp, i, sflag );
	stmp = (char *)malloc( DataToNoteLen( dtmp, i ) + 1 );
	DataToNote( dtmp, stmp, i );

	hei->HspFunc_prm_setva( pv, ap, HSPVAR_FLAG_STR, stmp );	// �ϐ��ɒl����

	free( stmp );

/*
	len=p1->len[1];
	p=p1->pt;

	if (p1->flag!=2) return -1;

	i=GetNoteLines(p);
	if (i<=0) return -1;

	DataIni( i );
	stmp=(char *)malloc( len<<2 );
	NoteToData( p, dtmp );
	BubbleSortStr( dtmp, i, p2 );
	DataToNote( dtmp, stmp, i );
	lstrcpy( p,stmp );
	free(stmp);
*/

	return 0;
}


EXPORT BOOL WINAPI sortget( HSPEXINFO *hei, int p1, int p2, int p3 )
{
	//
	//		sortget val,index  (type$202)
	//
	PVal *pv;
	APTR ap;
	int result;
	int n;

	ap = hei->HspFunc_prm_getva( &pv );
	n = hei->HspFunc_prm_getdi( 0 );

	if ( dtmp == NULL ) {
		return -1;
	}
	if (0 <= n && n < dtmp_size ) {
		result=dtmp[n].info;
	} else {
		result=0;
	}
	hei->HspFunc_prm_setva( pv, ap, HSPVAR_FLAG_INT, &result );
	return 0;
}


EXPORT BOOL WINAPI csvnote( PVal *p1, char *p2, int p3, int p4 )
{
	//
	//		csvnote val,csvdata,spchr  (type$87)
	//
	int len;
	unsigned char *stmp;
	unsigned char *p;
	unsigned char *s;
	unsigned char a1;
	unsigned char spchr;

	if ( p3==0 ) spchr=','; else spchr=p3;
	len=p1->len[1];
	p=(unsigned char *)p1->pt;
	//p1->flag = 2;
	stmp=NULL;
	s=(unsigned char *)p2;

	if (s==p) {
		stmp=(unsigned char *)malloc( len<<2 );
		memcpy( stmp, s, len<<2 );
		s=stmp;
	}

	while(1) {
		a1=*s++;if (a1==0) break;
		if (a1==spchr) {
			*p++=13; *p++=10;			// Add CR/LF
		}
		else {
			*p++=a1;
			if (a1>=129) {					// �S�p�����`�F�b�N
				if ((a1<=159)||(a1>=224)) {
					a1=*s++;if (a1==0) break;
					*p++=a1;
				}
			}
		}
	}
	*p=0;

	if (stmp!=NULL) free(stmp);
	return 0;
}


EXPORT BOOL WINAPI csvstr( HSPEXINFO *hei, int _p1, int _p2, int _p3 )
{
	//
	//		csvstr val,csvdata,sepchr  (type$202)
	//
	int p3,len,limit,i,a,b;
	unsigned char *pbase;
	unsigned char *s;
	unsigned char a1;
	unsigned char spchr;
	PVal *pv;
	APTR ap;
	PVal *pv2;
	APTR ap2;

	ap = hei->HspFunc_prm_getva( &pv );		// �p�����[�^1:�ϐ�
	ap2 = hei->HspFunc_prm_getva( &pv2 );	// �p�����[�^2:�ϐ�
	p3 = hei->HspFunc_prm_getdi( 0 );		// �p�����[�^3:���l

	if ( p3==0 ) spchr=','; else spchr=p3;

//	len=p1->len[1]<<2;

	i = pv->len[1];
	if (i<=0) return -1;

//	limit=len-1;
	pbase=(unsigned char *)Hsp3GetBlockSize( hei, pv, 0, &limit );
	limit--;
	//p1->flag = 2;
	s=(unsigned char *)Hsp3GetBlockSize( hei, pv2, ap2, &len );
	a=0;b=1;

	while(1) {
		a1=*s++;if (a1==0) break;
		if (a1==spchr) {
			if (b<i) {
				pbase[a]=0;
				pbase=(unsigned char *)Hsp3GetBlockSize( hei, pv, b, &limit );
				limit--;
				a=0;b++;
			}
		}
		else {
			if (a<limit) pbase[a++]=a1;

			if (a1>=129) {					// �S�p�����`�F�b�N
				if ((a1<=159)||(a1>=224)) {
					a1=*s++;if (a1==0) break;
					if (a<limit) pbase[a++]=a1;
				}
			}
		}
	}
	pbase[a]=0;
	return 0;
}


EXPORT BOOL WINAPI sortbye( int p1, int p2, int p3, int p4 )
{
	//
	//		sortbye (type$100)
	//
	DataBye();
	return 0;
}

/*------------------------------------------------------------*/
/*
		Exclusive Data Routines
*/
/*------------------------------------------------------------*/

static	PVal	*xn_pval;
static	APTR	xn_aptr;
static	int		xn_count;

EXPORT BOOL WINAPI xnotesel( HSPEXINFO *hei, int p1, int p2, int p3 )
{
	//
	//		xnotesel notedat, maxnum  (type$202)
	//
	PVal *pv;
	APTR ap;
	int a,i;

	ap = hei->HspFunc_prm_getva( &pv );
	i = hei->HspFunc_prm_getdi( 0 );
	if (i==0) i=256;			// default value
	if (pv->flag!=HSPVAR_FLAG_STR) return -1;
	xn_pval = pv;
	xn_aptr = ap;

	DataIni( i );
	for(a=0;a<i;a++) {
		dtmp[a].as.ikey=0;
		dtmp[a].info=0;
	}
	xn_count=0;
	return 0;
}


static char *skipline( char *s )
{
	while (*s != '\0') {
		char c = *s++;
		if(c == '\n') break;
		if(c == '\r') {
			if(*s == '\n') s ++;
			break;
		}
	}
	return s;
}


static int lineeq( char *a, char *b )
{
	while (1) {
		char ca = *a++;
		char cb = *b++;
		if (ca == '\n' || ca == '\r') ca = '\0';
		if (ca != cb) {
			return 0;
		}
		if (ca == '\0') {
			return 1;
		}
	}
}

static void pv_allocblock( HSPEXINFO *hei, PVal *pv, int offset, int size );

static void addline( HSPEXINFO *hei, PVal *pval, APTR aptr, size_t len, char *str_to_add )
{
	size_t len_add = strlen(str_to_add);
	int size;
	char *buf, *p;
	pv_allocblock( hei, pval, aptr, (int)(len + len_add + 8) );
	buf = (char *)Hsp3GetBlockSize( hei, pval, aptr, &size );
	p = buf + len;
	if (len > 0 && buf[len-1] != '\r' && buf[len-1] != '\n') {
		strcpy(p, "\r\n");
		p += 2;
	}
	strcpy(p, str_to_add);
	p += len_add;
	strcpy(p, "\r\n");
	p += 2;
}


EXPORT BOOL WINAPI xnoteadd( HSPEXINFO *hei, int p1, int p2, int p3 )
{
	//
	//		xnoteadd "strings" (type$202)
	//
	char *buf, *p, *str_to_add;
	int size;
	int line;

	str_to_add = hei->HspFunc_prm_gets();
	if (xn_pval->flag!=HSPVAR_FLAG_STR) return -1;
	buf = (char *)Hsp3GetBlockSize( hei, xn_pval, xn_aptr, &size );
	p = buf;
	line=0;
	while (*p != '\0') {
		if (lineeq(p, str_to_add) ) {
			DataInc(line);
			return -line;
		}
		p = skipline(p);
		line ++;
	}

	addline( hei, xn_pval, xn_aptr, p - buf, str_to_add );
	DataInc(line);
	return -line;
}

/*------------------------------------------------------------*/
/*
		Extra CSV Routines
*/
/*------------------------------------------------------------*/

EXPORT BOOL WINAPI csvsel( char *p1, int p2, int p3, int p4 )
{
	//
	//		csvsel val,sepchr  (type$1)
	//			( sepchr=0 / "," )
	//
	csv->SetBuffer( p1 );
	if ( p2 != 0 ) csv->SetSeparate( p2 );
			  else csv->SetSeparate( ',' );
	return 0;
}


EXPORT BOOL WINAPI csvres( PVal *p1, int p2, int p3, int p4 )
{
	//
	//		csvres val  (type$83)
	//
	int i;
	i=p1->len[1]<<2;
	csv->SetResultBuffer( p1->pt, i );
	return -i;
}


EXPORT BOOL WINAPI csvflag( int p1, int p2, int p3, int p4 )
{
	//
	//		csvflag id,val  (type$0)
	//
	csv->SetFlag( p1, p2 );
	return 0;
}


EXPORT BOOL WINAPI csvopt( int p1, int p2, int p3, int p4 )
{
	//
	//		csvopt option  (type$0)
	//
	csv->SetOption( p1 );
	return 0;
}


EXPORT BOOL WINAPI csvfind( BMSCR *bm, char *p1, int p2, int p3 )
{
	//
	//		csvfind "strings",max,start (type$6)
	//
	int i;
	i = csv->Search( p1, p2, p3 );
	return -i;
}


/*------------------------------------------------------------*/
/*
		Additional string service
*/
/*------------------------------------------------------------*/

/*------------------------------------------------------------*/
/*
		Extra random service
*/
/*------------------------------------------------------------*/

EXPORT BOOL WINAPI rndf_ini( HSPEXINFO *hei, int _p1, int _p2, int _p3 )
{
	//
	//		rndf_ini seed  (type$202)
	//
	int p1;
	p1 = hei->HspFunc_prm_getdi( -1 );		// �p�����[�^1:���l
	MTRandInit( p1 );
	return 0;
}


EXPORT BOOL WINAPI rndf_get( HSPEXINFO *hei, int _p1, int _p2, int _p3 )
{
	//
	//		rndf_get var  (type$202)
	//
	PVal *pv;
	APTR ap;
	double dval;
	ap = hei->HspFunc_prm_getva( &pv );		// �p�����[�^1:�ϐ�
	dval = MTRandGet();
	hei->HspFunc_prm_setva( pv, ap, HSPVAR_FLAG_DOUBLE, &dval );	// �ϐ��ɒl����
	return 0;
}


EXPORT BOOL WINAPI rndf_geti( HSPEXINFO *hei, int _p1, int _p2, int _p3 )
{
	//
	//		rndf_geti var, range  (type$202)
	//
	PVal *pv;
	APTR ap;
	int p1,p2;
	ap = hei->HspFunc_prm_getva( &pv );		// �p�����[�^1:�ϐ�
	p1 = hei->HspFunc_prm_getdi( 100 );		// �p�����[�^2:���l
	p2 = MTRandGetInt( p1 );
	hei->HspFunc_prm_setva( pv, ap, HSPVAR_FLAG_INT, &p2 );	// �ϐ��ɒl����
	return 0;
}


/*------------------------------------------------------------*/
/*
		HSP Variable service
*/
/*------------------------------------------------------------*/

#define HSP3VARFILEVER 0x1000
#define HSP3VARFILECODE "hspv"
#define HSP3VARFILEFXCODE 0x55aa0000

typedef struct HSP3VARFILEHED
{
	//	VAR File Header structure
	//
	char magic[4];				// magic code 'hspv'
	int ver;					// version code
	int num;					// num of data structure
	int pt_data;				// data block offset

} HSP3VARFILEHED;


typedef struct HSP3VARFILEDATA
{
	//	VAR File Data structure
	//
	int	name;					// name ptr
	int data;					// data ptr
	int opt;					// option (reserved)
	int encode;					// encode param (reserved)
	PVal master;				// PVal Master Data

} HSP3VARFILEDATA;

static	HSP3VARFILEHED varhed;
static	CMemBuf *varinfo;
static	CMemBuf *vardata;
static	HSP3VARFILEHED *vmem;
static	char *vload_tmp;

/*------------------------------------------------------------*/

static void pv_dispose( HSPEXINFO *hei, PVal *pv )
{
	HspVarProc *varproc;
	varproc = hei->HspFunc_getproc( pv->flag );
	varproc->Free( pv );
}


static void pv_alloc( HSPEXINFO *hei, PVal *pv, PVal *pv2 )
{
	HspVarProc *varproc;
	varproc = hei->HspFunc_getproc( pv->flag );
	varproc->Alloc( pv, pv2 );
}

static char *pv_getblock( HSPEXINFO *hei, PVal *pv, int offset, int *size )
{
	PDAT *p;
	HspVarProc *varproc;
	pv->offset=offset;
	varproc = hei->HspFunc_getproc( pv->flag );
	p = varproc->GetPtr( pv );
	varproc->GetBlockSize( pv, p, size );
	return (char *)p;
}

static void pv_allocblock( HSPEXINFO *hei, PVal *pv, int offset, int size )
{
	PDAT *p;
	HspVarProc *varproc;
	pv->offset=offset;
	varproc = hei->HspFunc_getproc( pv->flag );
	p = varproc->GetPtr( pv );
	varproc->AllocBlock( pv, p, size );
}

static FlexValue *pv_getfv( HSPEXINFO *hei, PVal *pv, int offset )
{
	PDAT *p;
	HspVarProc *varproc;
	pv->offset=offset;
	varproc = hei->HspFunc_getproc( pv->flag );
	p = varproc->GetPtr( pv );
	return (FlexValue *)p;
}

static int pv_seekstruct( HSPEXINFO *hei, char *name )
{
	//		���薼�̂̃��W���[������������
	//
	HSPCTX *hspctx;
	STRUCTDAT *st;
	char *p;
	int i,max;

	hspctx = hei->hspctx;
	max = hspctx->hsphed->max_finfo / sizeof(STRUCTDAT);

	for(i=0;i<max;i++) {
		st = &hspctx->mem_finfo[ i ];
		p = hspctx->mem_mds + st->nameidx;
		if ( st->index == STRUCTDAT_INDEX_STRUCT ) {
			if ( strcmp( p, name ) == 0 ) return i;
		}
	}
	return -1;
}

static void *pv_setmodvar( HSPEXINFO *hei, PVal *pv, int offset, int id, int size )
{
	//		���W���[���ϐ��̓��e��V�K�ɐݒ肷��
	//
	PDAT *p;
	HspVarProc *varproc;
	FlexValue fv;
	FlexValue *target;
	char *newmem;

	fv.customid = id;
	fv.clonetype = 0;
	fv.size = size;
	fv.ptr = NULL;

	pv->offset=offset;
	varproc = hei->HspFunc_getproc( pv->flag );
	p = varproc->GetPtr( pv );
	varproc->Set( pv, p, &fv );

	newmem = hei->HspFunc_malloc( size );

	target = (FlexValue *)p;
	target->type = FLEXVAL_TYPE_ALLOC;
	target->ptr = (void *)newmem;

	return newmem;
}


/*------------------------------------------------------------*/

static int varsave_putvar( HSPEXINFO *hei, PVal *pv, int encode, int opt );
static int varload_getvar( HSPEXINFO *hei, char *vdata, PVal *pv, PVal *pv2, int encode, int opt );

static void varsave_init( void )
{
	strcpy( varhed.magic, HSP3VARFILECODE );
	varhed.ver = HSP3VARFILEVER;
	varhed.num = 0;
	varhed.pt_data = 0;
	varinfo = new CMemBuf;
	vardata = new CMemBuf;
}


static int varsave_bye( char *fname )
{
	int res;
	FILE *fp;
	int hedsize, infosize, datasize;

	res = 0;
	fp=fopen( fname, "wb" );
	if (fp != NULL) {

		hedsize = sizeof( HSP3VARFILEHED );
		infosize = varinfo->GetSize();
		datasize = vardata->GetSize();

		varhed.pt_data = hedsize + infosize;

		fwrite( &varhed, hedsize, 1, fp );
		fwrite( varinfo->GetBuffer(), infosize, 1, fp );
		fwrite( vardata->GetBuffer(), datasize, 1, fp );

		fclose(fp);
	} else {
		res = -1;
	}

	delete vardata;
	delete varinfo;
	return res;
}


static int varsave_put_storage( HSPEXINFO *hei, PVal *pv, int encode, int opt )
{
	//		�Œ蒷�X�g���[�W�̕ۑ�
	//
	if ( pv->mode != HSPVAR_MODE_MALLOC ) return -1;
	switch ( pv->flag ) {
	case HSPVAR_FLAG_LABEL:
		{
		unsigned short **labels = (unsigned short **)pv->pt;
		int len = pv->size / sizeof(unsigned short *);
		unsigned short *mem_mcs = hei->hspctx->mem_mcs;
		int i;
		for ( i = 0; i < len; i ++ ) {
			unsigned short *label = labels[i];
			if ( label == NULL ) {
				vardata->Put( -1 );
			} else {
				vardata->Put( (int)(label - mem_mcs) );
			}
		}
		}
		break;
	case HSPVAR_FLAG_STRUCT:
		{
		int i,j,max,vmax;
		HSPCTX *hspctx;
		FlexValue *fv;
		PVal *fvbase;
		STRUCTPRM *prm;
		STRUCTDAT *st;
		char modname[64];
		int prevcnt,nowcnt;
		int *cntbak;

		hspctx = hei->hspctx;
		fv = pv_getfv( hei, pv, 0 );
		prm = &hspctx->mem_minfo[ fv->customid ];
		st = &hspctx->mem_finfo[ prm->subid ];
		memset( modname, 0, 64 );
		strcpy( modname, hspctx->mem_mds + st->nameidx );
		max = st->prmmax - 1;
		prm++;
		vmax = pv->size / sizeof(FlexValue);

		//Alertf( "#%d(%d) size(%d,%d) %s",fv->customid,max, fv->size, st->size, modname );

		//		�^�O�R�[�h + ���W���[���ϐ���, ���W���[����(64byte)���L�^����
		vardata->Put( (int)HSP3VARFILEFXCODE + max );
		vardata->PutData( modname, 64 );				// ���W���[������ۑ�����

//		for(i=0;i<max;i++) {
//			Alertf( "#%d(%s) PRM%d",i,modname, prm->mptype );
//			prm++;
//		}

		for(i=0;i<vmax;i++) {
			fv = pv_getfv( hei, pv, i );
			fvbase = (PVal *)fv->ptr;

			//		�^�O�R�[�h + type���L�^����
			vardata->Put( (int)HSP3VARFILEFXCODE + fv->type );
			//		���f�[�^���L�^����
			if ( fv->type == FLEXVAL_TYPE_ALLOC ) {
				for(j=0;j<max;j++) {
					int pos;
					vardata->PutData( fvbase, sizeof(PVal) );
					pos = vardata->GetSize();
					vardata->Put( (int)0 );
					prevcnt = vardata->GetSize();
					varsave_putvar( hei, fvbase, encode, opt );
					nowcnt = vardata->GetSize();
					cntbak = (int *)(vardata->GetBuffer() + pos);
					*cntbak = nowcnt - prevcnt;			// ���f�[�^�T�C�Y���L�^����
					fvbase++;
				}
			}
		}
		break;
		}
	case HSPVAR_FLAG_COMSTRUCT:							// COMOBJ�^�͖����ɂ���
	case 7:												// Variant�^�͖����ɂ���
		return -1;
	default:
		vardata->PutData( pv->pt, pv->size );			// �ϐ��̎��������S�̂�ۑ�����
		break;
	}
	return 0;
}


static int varsave_put_flexstorage( HSPEXINFO *hei, PVal *pv, int encode, int opt )
{
	//		�ϒ��X�g���[�W�̕ۑ�
	//
	int i,max;
	int size;
	char *p;
	if ( pv->mode != HSPVAR_MODE_MALLOC ) return -1;

	max = pv->size / sizeof(char *);
	for(i=0;i<max;i++) {
		p = pv_getblock( hei, pv, i, &size );

		//		�^�O�R�[�h, size(int), ���f�[�^(size)���L�^����
		vardata->Put( (int)HSP3VARFILEFXCODE );
		vardata->Put( size );
		vardata->PutData( p, size );					// �ϐ��̎��������S�̂�ۑ�����
	}
	return 0;
}


static int varsave_putvar( HSPEXINFO *hei, PVal *pv, int encode, int opt )
{
	int res;
	unsigned short	support;
	res = -1;
	support = pv->support;
	if ( support & HSPVAR_SUPPORT_STORAGE ) res = varsave_put_storage( hei, pv, encode, opt );
	if ( support & HSPVAR_SUPPORT_FLEXSTORAGE ) res = varsave_put_flexstorage( hei, pv, encode, opt );
	return res;
}


static int varsave_put( HSPEXINFO *hei, int varid, int encode, int opt )
{
	HSPCTX *hspctx;
	HSP3VARFILEDATA dat;
	PVal *mem_var;
	char *name;
	char tmp[64];
	int res;

	hspctx = hei->hspctx;
	if (( varid < 0 )||( varid >= hspctx->hsphed->max_val )) return -1;
	mem_var = hspctx->mem_var + varid;

	name = hei->HspFunc_varname( varid );
	if ( *name == 0 ) {
		sprintf( tmp,"var#%d",varid );
		name = tmp;
	}

	dat.master = *mem_var;					// �Ƃ肠����PVal��ۑ�����
	dat.encode = encode;
	dat.opt = opt;

	dat.name = vardata->GetSize();
	vardata->PutStrBlock( name );			// �ϐ�����ۑ�����
	dat.data = vardata->GetSize();

	res = varsave_putvar( hei, mem_var, encode, opt );
	if ( res ) return res;

	varinfo->PutData( &dat, sizeof(HSP3VARFILEDATA) );
	varhed.num++;
	return 0;
}


static int varload_init( void *mem )
{
	vmem = (HSP3VARFILEHED *)mem;
	if ( strcmp( vmem->magic, HSP3VARFILECODE ) ) return -1;
	return 0;
}


static void varload_bye( void )
{
}


static int varload_get_storage_struct( HSPEXINFO *hei, char *vdata, PVal *pv, PVal *pv2, int encode, int opt )
{
	//		�Œ蒷�X�g���[�W(STRUCT)�̎擾
	//
	int i,j,code,max,vmax,type;
	int custid;
	int orgmax;
	int nextcnt;
	char *mem;
	char modname[64];
	char *orgname;
	HSPCTX *hspctx;
	PVal *fvbase;
	PVal *fvmem;
	STRUCTDAT *st;

	pv_dispose( hei,pv );								// �ϐ���j��
	*pv = *pv2;
	pv_alloc( hei, pv, NULL );							// �ϐ����Ċm��

	mem = vdata;
	vmax = pv->size / sizeof(FlexValue);

	//		�^�O�R�[�h + ���W���[���ϐ���, ���W���[����(64byte)���擾
	code = *(int *)mem;
	max = code & 0xffff;
	code &= 0xffff0000;
	if ( code != HSP3VARFILEFXCODE ) return -1;
	mem += sizeof(int);

	memcpy( modname, mem, 64 );
	mem += 64;

	custid = pv_seekstruct( hei, modname );
	if ( custid < 0 ) return -1;

	hspctx = hei->hspctx;
	st = &hspctx->mem_finfo[ custid ];
	orgname = hspctx->mem_mds + st->nameidx;
	orgmax = st->prmmax - 1;
	if ( orgmax != max ) return -1;

	//Alertf( "%d(prm%d=%d) %s=%s",custid,max,st->prmmax,orgname,modname );

	for(i=0;i<vmax;i++) {

		//		�^�O�R�[�h + type���擾����
		code = *(int *)mem;
		type = code & 0xffff;
		code &= 0xffff0000;
		if ( code != HSP3VARFILEFXCODE ) return -1;
		mem += sizeof(int);

		if ( type == FLEXVAL_TYPE_ALLOC ) {
			fvmem = (PVal *)pv_setmodvar( hei, pv, i, st->prmindex, st->size );
			for(j=0;j<max;j++) {
				fvbase = (PVal *)mem;
				mem += sizeof(PVal);
				nextcnt = *(int *)mem;
				mem += sizeof(int);
				//Alertf( "#%d:%d (%s) flag%d next=%d", i, j, modname, fvbase->flag, nextcnt );

				fvmem->mode = HSPVAR_MODE_NONE;
				fvmem->flag = HSPVAR_FLAG_INT;
				varload_getvar( hei, mem, fvmem, fvbase, encode, opt );
				fvmem++;
				mem += nextcnt;
			}
		}

	}
	return 0;
}


static int varload_get_storage_label( HSPEXINFO *hei, char *vdata, PVal *pv, PVal *pv2, int encode, int opt )
{
	//		�Œ蒷�X�g���[�W(LABEL)�̎擾
	//
	int *offsets;
	int len;
	int i;
	unsigned short **p;
	unsigned short *mem_mcs = hei->hspctx->mem_mcs;
	pv_dispose( hei,pv );								// �ϐ���j��
	*pv = *pv2;
	pv_alloc( hei, pv, NULL );							// �ϐ����Ċm��
	offsets = (int *)vdata;
	p = (unsigned short **)pv->pt;
	len = pv->size / sizeof(unsigned short *);
	for ( i = 0; i < len; i ++ ) {
		int offset = offsets[i];
		if ( offset == -1 ) {
			p[i] = NULL;
		} else {
			p[i] = mem_mcs + offset;
		}
	}
	return 0;
}


static int varload_get_storage( HSPEXINFO *hei, char *vdata, PVal *pv, PVal *pv2, int encode, int opt )
{
	//		�Œ蒷�X�g���[�W�̎擾
	//
	pv_dispose( hei,pv );								// �ϐ���j��
	*pv = *pv2;
	pv_alloc( hei, pv, NULL );							// �ϐ����Ċm��
	memcpy( pv->pt, vdata, pv->size );					// �f�[�^���R�s�[
	return 0;
}


static int varload_get_flexstorage( HSPEXINFO *hei, char *vdata, PVal *pv, PVal *pv2, int encode, int opt )
{
	//		�ϒ��X�g���[�W�̎擾
	//
	int i,code,max;
	int size;
	char *p;
	char *mem;

	pv_dispose( hei,pv );								// �ϐ���j��
	*pv = *pv2;
	pv_alloc( hei, pv, NULL );							// �ϐ����Ċm��

	mem = vdata;
	max = pv->size / sizeof(char *);
	for(i=0;i<max;i++) {
		code = *(int *)mem;
		if ( code != HSP3VARFILEFXCODE ) return -1;
		mem += sizeof(int);
		size = *(int *)mem;
		mem += sizeof(int);
		pv_allocblock( hei, pv, i, size );
		p = pv_getblock( hei, pv, i, &code );
		memcpy( p, mem, size );							// �f�[�^���R�s�[
		mem += size;
	}

	return 0;
}


static int varload_getvar( HSPEXINFO *hei, char *vdata, PVal *pv, PVal *pv2, int encode, int opt )
{
	int res;
	unsigned short	support;
	support = pv2->support;
	res = -1;
	if ( support & HSPVAR_SUPPORT_STORAGE ) {
		switch( pv2->flag ) {
		case HSPVAR_FLAG_LABEL:
			res = varload_get_storage_label( hei, vdata, pv, pv2, encode, opt );
			break;
		case HSPVAR_FLAG_STRUCT:
			res = varload_get_storage_struct( hei, vdata, pv, pv2, encode, opt );
			break;
		default:
			res = varload_get_storage( hei, vdata, pv, pv2, encode, opt );
			break;
		}
	}
	if ( support & HSPVAR_SUPPORT_FLEXSTORAGE ) {
		res = varload_get_flexstorage( hei, vdata, pv, pv2, encode, opt );
	}
	return res;
}


static int varload_get( HSPEXINFO *hei, int varid, char *getname, int encode, int opt )
{
	HSPCTX *hspctx;
	HSP3VARFILEDATA *dat;
	PVal *mem_var;
	char *buf;
	char *name;
	char *p;
	char *vdata;
	char tmp[64];
	int i,max;
	int res;

	hspctx = hei->hspctx;
	if (( varid < 0 )||( varid >= hspctx->hsphed->max_val )) return -1;
	mem_var = hspctx->mem_var + varid;

	name = getname;
	if ( name == NULL ) {
		name = hei->HspFunc_varname( varid );
	}
	if ( *name == 0 ) {
		sprintf( tmp,"var#%d",varid );
		name = tmp;
	}

	max = vmem->num;
	dat = (HSP3VARFILEDATA *)(vmem+1);
	buf = ( (char *)vmem ) + vmem->pt_data;
	for(i=0;i<max;i++) {
		p = buf + dat->name;
		vdata = buf + dat->data;
		if ( strcmp( p, name ) == 0 ) {
			res = varload_getvar( hei, vdata, mem_var, &dat->master, encode, opt );
			return res;
		}
		dat++;
	}

	return -1;
}



/*------------------------------------------------------------*/

EXPORT BOOL WINAPI getvarid( HSPEXINFO *hei, int _p1, int _p2, int _p3 )
{
	//
	//		getvarid var,"name"  (type$202)
	//
	PVal *pv;
	APTR ap;
	char *p1;
	int p2;
	ap = hei->HspFunc_prm_getva( &pv );		// �p�����[�^1:�ϐ�
	p1 = hei->HspFunc_prm_gets();			// �p�����[�^2:������
	p2 = hei->HspFunc_seekvar( p1 );
	hei->HspFunc_prm_setva( pv, ap, HSPVAR_FLAG_INT, &p2 );	// �ϐ��ɒl����
	return 0;
}


EXPORT BOOL WINAPI getvarname( HSPEXINFO *hei, int _p1, int _p2, int _p3 )
{
	//
	//		getvarname var,id  (type$202)
	//
	PVal *pv;
	APTR ap;
	int p1;
	char *p2;
	ap = hei->HspFunc_prm_getva( &pv );		// �p�����[�^1:�ϐ�
	p1 = hei->HspFunc_prm_getdi( 0 );		// �p�����[�^2:���l
	p2 = hei->HspFunc_varname( p1 );
	hei->HspFunc_prm_setva( pv, ap, HSPVAR_FLAG_STR, p2 );	// �ϐ��ɒl����
	return 0;
}


EXPORT BOOL WINAPI getmaxvar( HSPEXINFO *hei, int _p1, int _p2, int _p3 )
{
	//
	//		getmaxvar var  (type$202)
	//
	PVal *pv;
	APTR ap;
	HSPCTX *hspctx;
	int p2;
	ap = hei->HspFunc_prm_getva( &pv );		// �p�����[�^1:�ϐ�
	hspctx = hei->hspctx;
	p2 = hspctx->hsphed->max_val;
	hei->HspFunc_prm_setva( pv, ap, HSPVAR_FLAG_INT, &p2 );	// �ϐ��ɒl����
	return 0;
}


EXPORT BOOL WINAPI vsave( HSPEXINFO *hei, int _p1, int _p2, int _p3 )
{
	//
	//		vsave "filename"  (type$202)
	//
	int i,max,res;
	char *p1;
	HSPCTX *hspctx;

	p1 = hei->HspFunc_prm_gets();			// �p�����[�^1:������

	hspctx = hei->hspctx;
	max = hspctx->hsphed->max_val;

	varsave_init();
	for(i=0;i<max;i++) {
		varsave_put( hei, i, 0, 0 );
	}
	res = varsave_bye( p1 );
	return res;
}


EXPORT BOOL WINAPI vload( HSPEXINFO *hei, int _p1, int _p2, int _p3 )
{
	//
	//		vload "filename"  (type$202)
	//
	int i,max,res;
	char *p1;
	char *tmp;
	HSPCTX *hspctx;

	p1 = hei->HspFunc_prm_gets();			// �p�����[�^1:������

	hspctx = hei->hspctx;
	max = hspctx->hsphed->max_val;

	res = hei->HspFunc_fsize( p1 );
	if ( res <= 0 ) return -1;

	tmp = (char *)malloc( res );
	hei->HspFunc_fread( p1, tmp, res, 0 );

	res = varload_init( tmp );
	if ( res == 0 ) {
		for(i=0;i<max;i++) {
			varload_get( hei, i, NULL, 0, 0 );
		}
	}
	varload_bye();
	free( tmp );
	return res;
}


EXPORT BOOL WINAPI vsave_start( HSPEXINFO *hei, int _p1, int _p2, int _p3 )
{
	//
	//		vsave_start  (type$202)
	//
	varsave_init();
	return 0;
}


EXPORT BOOL WINAPI vsave_put( HSPEXINFO *hei, int _p1, int _p2, int _p3 )
{
	//
	//		vsave_put var  (type$202)
	//
	PVal *pv;
	APTR ap;
	int res;
	int val,type;

	type = *(hei->nptype);
	val = *(hei->npval);
	ap = hei->HspFunc_prm_getva( &pv );		// �p�����[�^1:�ϐ�

	if ( type != TYPE_VAR ) return -2;
	res = varsave_put( hei, val, 0, 0 );
	return res;
}


EXPORT BOOL WINAPI vsave_end( HSPEXINFO *hei, int _p1, int _p2, int _p3 )
{
	//
	//		vsave_end "filename"  (type$202)
	//
	int res;
	char *p1;
	p1 = hei->HspFunc_prm_gets();			// �p�����[�^1:������
	res = varsave_bye( p1 );
	return res;
}


EXPORT BOOL WINAPI vload_start( HSPEXINFO *hei, int _p1, int _p2, int _p3 )
{
	//
	//		vload_start "filename"  (type$202)
	//
	int res;
	char *p1;

	p1 = hei->HspFunc_prm_gets();			// �p�����[�^1:������

	res = hei->HspFunc_fsize( p1 );
	if ( res <= 0 ) return -1;

	vload_tmp = (char *)malloc( res );
	hei->HspFunc_fread( p1, vload_tmp, res, 0 );

	res = varload_init( vload_tmp );
	if ( res ) {
		varload_bye();
		free( vload_tmp );
	}
	return res;
}


EXPORT BOOL WINAPI vload_get( HSPEXINFO *hei, int _p1, int _p2, int _p3 )
{
	//
	//		vload_get var  (type$202)
	//
	PVal *pv;
	APTR ap;
	int res;
	int val,type;

	type = *(hei->nptype);
	val = *(hei->npval);
	ap = hei->HspFunc_prm_getva( &pv );		// �p�����[�^1:�ϐ�

	if ( type != TYPE_VAR ) return -2;
	res = varload_get( hei, val, NULL, 0, 0 );
	return res;
}


EXPORT BOOL WINAPI vload_end( HSPEXINFO *hei, int _p1, int _p2, int _p3 )
{
	//
	//		vload_end  (type$202)
	//
	varload_bye();
	free( vload_tmp );
	return 0;
}


