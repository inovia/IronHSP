
//
//		HSP compile/package functions for HSP3
//				onion software/onitama 2002-2017
//

#include <stdio.h>
#include <windows.h>
#include <direct.h>

#include "../../hsp3/hsp3config.h"

#include "../../hsp3/hsp3debug.h"			// hsp3 error code
#include "../../hsp3/hsp3struct.h"			// hsp3 core define
#include "../../hsp3/hspwnd.h"				// hsp3 windows define

#include "../supio.h"
#include "../hsc3.h"
#include "../token.h"
#include "../ahtobj.h"

#define USE_HSMANAGER
#ifdef USE_HSMANAGER
#include "../hsmanager.h"
static HspHelpManager hsman;
#endif

#define DPM_SUPPORT		// DPM�t�@�C���}�l�[�W�����T�|�[�g
#include "dpm.h"

#define ICONINS_SUPPORT	// ICONINS�c�[�����T�|�[�g

//	VC++�̏ꍇ
#ifdef __cplusplus
#define EXPORT extern "C" __declspec (dllexport)
#else
#define EXPORT __declspec (dllexport)
#endif

static char fname[_MAX_PATH];
static char rname[_MAX_PATH];
static char oname[_MAX_PATH];
static char hspexe[_MAX_PATH];
static int opt1,opt2,opt3;

static int orgcompath=0;
static char compath[_MAX_PATH];

static CHsc3 *hsc3=NULL;
static CAht *aht=NULL;
static int homeid;				// Home object
static int ahtbuild_error;		// Error code

extern char *hsp_prestr[];

/*
	rev 54
	gcc �Ńr���h�����Ƃ��� DllMain ���Ă΂��悤�ɏC���B
*/

#if defined( __GNUC__ ) && defined( __cplusplus )
extern "C"
#endif
BOOL WINAPI DllMain (HINSTANCE hInstance, DWORD fdwReason, PVOID pvReserved)
{
	if ( fdwReason==DLL_PROCESS_ATTACH ) {
		hsc3 = new CHsc3;
	}
	if ( fdwReason==DLL_PROCESS_DETACH ) {
		if ( hsc3 != NULL ) { delete hsc3; hsc3=NULL; }
		if ( aht != NULL ) { delete aht; aht=NULL; }
	}
	return TRUE ;
}

//----------------------------------------------------------

static int GetFilePath( char *bname )
{
	//		�t���p�X������A�t�@�C���p�X�̎擾(\���c��)
	//
	int a,b,len;
	char a1;
	b=-1;
	len=(int)strlen(bname);
	for(a=0;a<len;a++) {
		a1=bname[a];
		if (a1=='\\') b=a;
		if (a1<0) a++; 
	}
	if (b<0) return 1;
	bname[b+1]=0;
	return 0;
}


/*
	rev 54
	supio_win.cpp �� supio_linux.cpp �ł� cutext ����`����Ă���B
	��������g���悤�ɂ��Ă����� cutext �͍폜�B
*/


static void _sendstr( HWND hw, char *p1 )
{
	//		Win9x�p
	LPARAM lprm;
	char *mes;
	char a1;
	int a;

	mes = p1;
	lprm=1;
	a=0;
	while(1) {
		a1=mes[a];if (a1==0) break;
		PostMessage( hw,WM_CHAR, a1, lprm );
		a++;
	}
}


static void _sendstr2( HWND hw, char *p1 )
{
	//		Win2000�ȍ~�p
	LPARAM lprm;
	unsigned char *mes;
	unsigned char a1;
	int acode;
	int a;

	mes = (unsigned char *)p1;

	lprm=1;
	a=0;
	while(1) {
		a1=mes[a];if (a1==0) break;
		if ( a1 & 0x80 ) {
			acode = (int)mes[a+1];
			acode = (acode<<8) | a1;
			PostMessage( hw,WM_CHAR, acode, 0 );
			a+=2;
		} else {
			PostMessage( hw,WM_CHAR, a1, lprm );
			a++;
		}
	}
}


//----------------------------------------------------------

EXPORT BOOL WINAPI hsc_ini ( BMSCR *bm, char *p1, int p2, int p3 )
{
	//
	//		hsc_ini "src-file"  (type6)
	//
	strcpy(fname,p1);
	strcpy(rname,p1);
	strcpy(oname,p1);
	cutext(oname);
	strcat(oname,".ax");
	return 0;
}


EXPORT BOOL WINAPI hsc_refname ( BMSCR *bm, char *p1, int p2, int p3 )
{
	//
	//		hsc_refname "ref-file"  (type6)
	//
	strcpy(rname,p1);
	return 0;
}


EXPORT BOOL WINAPI hsc_objname ( BMSCR *bm, char *p1, int p2, int p3 )
{
	//
	//		hsc_objname "obj-file"  (type6)
	//
	strcpy(oname,p1);
	return 0;
}


EXPORT BOOL WINAPI hsc_ver ( int p1, int p2, int p3, char *p4 )
{
	//
	//		hsc_ver (type$10)
	//
	sprintf( p4,"%s ver%s", HSC3TITLE, hspver );
	return 0;
}


EXPORT BOOL WINAPI hsc_bye ( int p1, int p2, int p3, int p4 )
{
	//
	//		hsc_bye (type$100)
	//
	return 0;
}


EXPORT BOOL WINAPI hsc_getmes ( char *p1, int p2, int p3, int p4 )
{
	//
	//		hsc_getmes val (type1)
	//
	strcpy( p1, hsc3->GetError() );
	return 0;
}


EXPORT BOOL WINAPI hsc_clrmes ( int p1, int p2, int p3, int p4 )
{
	//
	//		hsc_clrmes (type0)
	//
	hsc3->ResetError();
	return 0;
}


EXPORT BOOL WINAPI hsc_compath ( BMSCR *bm, char *p1, int p2, int p3 )
{
	//
	//		hsc_compath "common-path"  (type6)
	//
	strcpy(compath,p1);
	orgcompath=1;
	return 0;
}


EXPORT BOOL WINAPI hsc_comp ( int p1, int p2, int p3, int p4 )
{
	//
	//		hsc_comp mode,ppopt,dbgopt  (type0)
	//			( mode: 1=debug/0=no debug )
	//			(       2=preprocessor only )
	//			(       4=UTF8 output mode )
	//			(       8=strmap output mode )
	//			( ppopt = preprocessor option )
	//			(       0=default/1=ver2.6 mode )
	//			(       32=UTF8 input mode )
	//			( dbgopt = debug window option )
	//			(       0=default/1=debug mode )
/*
	int st;
	st=tcomp_main( rname, fname, oname, mesbuf, p1, compath );
*/
	int st;
	int ppopt;
	int cmpmode;
	char fname2[_MAX_PATH];

	hsc3->ResetError();
	if (orgcompath==0) {
		GetModuleFileName( NULL,compath,_MAX_PATH );
		GetFilePath( compath );
		strcat( compath,"common\\" );
	}
	strcpy( fname2, fname );
	strcat( fname2, ".i" );
	hsc3->SetCommonPath( compath );
	ppopt = 0;
	if ( p1 ) ppopt|=HSC3_OPT_DEBUGMODE;
	if ( p2&1 ) ppopt|=HSC3_OPT_NOHSPDEF;
	if ( p2&4 ) ppopt|=HSC3_OPT_MAKEPACK;
	if ( p2&8 ) ppopt|=HSC3_OPT_READAHT;
	if ( p2&16 ) ppopt|=HSC3_OPT_MAKEAHT;
	if ( p2&32 ) ppopt|=HSC3_OPT_UTF8IN;

	if ( p1 & 4 ) ppopt|=HSC3_OPT_UTF8OUT;

	st = hsc3->PreProcess( fname, fname2, ppopt, rname );
	if ( st != 0 ) {
		hsc3->PreProcessEnd();
		return st;
	}
	if ( p1 & 2 ) {
		hsc3->PreProcessEnd();
		return 0;
	}

	cmpmode = p1 & HSC3_MODE_DEBUG;
	if (p1 & 4) cmpmode |= HSC3_MODE_UTF8;
	if (p1 & 8) cmpmode |= HSC3_MODE_STRMAP;
	if ( p3 ) cmpmode |= HSC3_MODE_DEBUGWIN;

	if (p1 & 8) {
		st = hsc3->CompileStrMap(fname2, oname, cmpmode);
	}
	else {
		st = hsc3->Compile(fname2, oname, cmpmode);
	}
	hsc3->PreProcessEnd();
	if ( st != 0 ) return st;
	return 0;
}


//----------------------------------------------------------

EXPORT BOOL WINAPI pack_ini ( BMSCR *bm, char *p1, int p2, int p3 )
{
	//
	//		pack_ini "src-file"  (type6)
	//
#ifdef DPM_SUPPORT
	strcpy(fname,p1);
	cutext(fname);
	if ( hsc3==NULL ) Alert( "#No way." );
	hsc3->ResetError();
	dpmc_ini( hsc3->errbuf, fname );
	opt1=640;opt2=480;opt3=0;
	strcpy(hspexe,"hsprt");
#endif
	return 0;
}


EXPORT BOOL WINAPI pack_view ( int p1, int p2, int p3, int p4 )
{
	//
	//		pack_view (type0)
	//
	int st;
#ifdef DPM_SUPPORT
	st = dpmc_view();
#else
	st = 0;
#endif
	return -st;
}


EXPORT BOOL WINAPI pack_make ( int p1, int p2, int p3, int p4 )
{
	//
	//		pack_make mode, key(type0)
	//		     mode : (1=ForDPM/0=ForExecutable)
	//		     key  : (0=Default/other=New Seed)
	//
	int st;
#ifdef DPM_SUPPORT
	if ( p2 != 0 ) dpmc_dpmkey( p2 );
	st=dpmc_pack(p1);
#else
	st = 0;
#endif
	return -st;
}


EXPORT BOOL WINAPI pack_opt ( int p1, int p2, int p3, int p4 )
{
	//
	//		pack_opt sx,sy,disp_sw (type0)
	//
	opt1=p1;if (opt1==0) opt1=640;
	opt2=p2;if (opt2==0) opt2=480;
	opt3=p3;							// disp SW (1=blank window)
	return 0;
}


EXPORT BOOL WINAPI pack_rt ( BMSCR *bm, char *p1, int p2, int p3 )
{
	//
	//		pack_rt "runtime-file"  (type6)
	//
	strcpy(hspexe,p1);
	return 0;
}


EXPORT BOOL WINAPI pack_exe ( int p1, int p2, int p3, int p4 )
{
	//
	//		pack_exe mode (type0)
	//
	int st;
#ifdef DPM_SUPPORT
	st=dpmc_mkexe(p1,hspexe,opt1,opt2,opt3);
#else
	st = 0;
#endif
	return -st;
}


EXPORT BOOL WINAPI pack_get ( BMSCR *bm, char *p1, int p2, int p3 )
{
	//
	//		pack_get "get-file"  (type6)
	//
	int st;
#ifdef DPM_SUPPORT
	st=dpmc_get(p1);
#else
	st = 0;
#endif
	return -st;
}


//----------------------------------------------------------
//		Additional service on 2.6
//----------------------------------------------------------

EXPORT BOOL WINAPI hsc3_getsym ( int p1, int p2, int p3, int p4 )
{
	//
	//		hsc3_getsym val  (type1)
	//
	hsc3->ResetError();
	if (orgcompath==0) {
		GetModuleFileName( NULL,compath,_MAX_PATH );
		GetFilePath( compath );
		strcat( compath,"common\\" );
	}
	hsc3->SetCommonPath( compath );
	if ( hsc3->GetCmdList( p1|2 ) ) return -1;
	return 0;
}


EXPORT BOOL WINAPI hsc3_messize ( int *p1, int p2, int p3, int p4 )
{
	//
	//		hsc3_messize val  (type1)
	//
	*p1 = hsc3->GetErrorSize();
	return 0;
}


EXPORT BOOL WINAPI hsc3_make ( BMSCR *bm, char *p1, int p2, int p3 )
{
	//
	//		hsc3_make "myname",sw,0  (type6)
	//		(sw=1�̏ꍇ��iconins���Ăяo��)
	//
	char libpath[_MAX_PATH];
	int i,type;
	int opt3a,opt3b;
	int st;
#ifdef ICONINS_SUPPORT
	char ici_opt[4096];
	char ici_current[_MAX_PATH];
	char ici_target[_MAX_PATH];
	char ici_icon[_MAX_PATH];
	char ici_version[_MAX_PATH];
	char ici_manifest[_MAX_PATH];
	char ici_lang[_MAX_PATH];
	char ici_upx[_MAX_PATH];
	int ici_use_icon = 0;
	int ici_use_version = 0;
	int ici_use_manifest = 0;
	int ici_use_lang = 0;
	int ici_use_upx = 0;
#endif

	if ( hsc3==NULL ) Alert( "#No way." );
	hsc3->ResetError();

	strcpy( libpath, p1 );
	GetFilePath( libpath );

#ifdef ICONINS_SUPPORT
	GetModuleFileName( NULL,ici_opt,_MAX_PATH );
	GetFilePath( ici_opt );
	strcat( ici_opt, "iconins.exe" );
	GetCurrentDirectory( _MAX_PATH, ici_current );
	strcat( ici_current, "\\" );
#endif

	i = hsc3->OpenPackfile();
	if (i) { Alert( "packfile��������܂���" ); return -1; }
	hsc3->GetPackfileOption( hspexe, "runtime", "hsprt" );
	strcat( libpath, hspexe );
	strcpy( hspexe, libpath );
	hsc3->GetPackfileOption( fname, "name", "hsptmp" );
	cutext( fname );
	type = hsc3->GetPackfileOptionInt( "type", 0 );
	opt1 = hsc3->GetPackfileOptionInt( "xsize", 640 );
	opt2 = hsc3->GetPackfileOptionInt( "ysize", 480 );
	opt3a = hsc3->GetPackfileOptionInt( "hide", 0 );
	opt3b = hsc3->GetPackfileOptionInt( "orgpath", 0 );
	opt3 = 0;
	if ( opt3a ) opt3 |= 1;
	if ( opt3b ) opt3 |= 2;

#ifdef ICONINS_SUPPORT
	hsc3->GetPackfileOption( ici_icon, "icon", "" );
	if ( ici_icon[0] != 0 ) { ici_use_icon = 1; }
	hsc3->GetPackfileOption( ici_version, "version", "" );
	if ( ici_version[0] != 0 ) { ici_use_version = 1; }
	hsc3->GetPackfileOption( ici_manifest, "manifest", "" );
	if ( ici_manifest[0] != 0 ) { ici_use_manifest = 1; }
	hsc3->GetPackfileOption( ici_lang, "lang", "" );
	if ( ici_lang[0] != 0 ) { ici_use_lang = 1; }
	hsc3->GetPackfileOption( ici_upx, "upx", "" );
	if ( ici_upx[0] != 0 ) { ici_use_upx = 1; }

	strcpy( ici_target, ici_current );
	strcat( ici_target, fname );
	if (type==2) strcat(ici_target,".scr");
			else strcat(ici_target,".exe");
#endif

	hsc3->ClosePackfile();

	//		exe���쐬
#ifdef DPM_SUPPORT
	dpmc_ini( hsc3->errbuf, fname );
	st=dpmc_pack( 0 );
	if ( st ) return -st;
	st=dpmc_mkexe( type, hspexe, opt1, opt2, opt3 );
	strcat( fname, ".dpm" );
	DeleteFile( fname );
#else
	st = 0;
#endif

	//		iconins process
#ifdef ICONINS_SUPPORT
	if ((ici_use_icon+ici_use_version+ici_use_manifest+ici_use_lang+ici_use_upx)>0) {

		strcat( ici_opt, " -e\"" );
		strcat( ici_opt, ici_target );
		strcat( ici_opt, "\"" );

		if ( ici_use_icon ) {
			strcat( ici_opt," -i\"" );
			strcat( ici_opt, ici_current );
			strcat( ici_opt, ici_icon );
			strcat( ici_opt, "\"" );
		}
		if ( ici_use_version ) {
			strcat( ici_opt," -v\"" );
			strcat( ici_opt, ici_current );
			strcat( ici_opt, ici_version );
			strcat( ici_opt, "\"" );
		}
		if ( ici_use_manifest ) {
			strcat( ici_opt," -m\"" );
			strcat( ici_opt, ici_current );
			strcat( ici_opt, ici_manifest );
			strcat( ici_opt, "\"" );
		}
		if ( ici_use_lang ) {
			strcat( ici_opt," -l\"" );
			strcat( ici_opt, ici_lang );
			strcat( ici_opt, "\"" );
		}
		if ( ici_use_upx ) {
			strcat( ici_opt," -u\"" );
			strcat( ici_opt, ici_upx );
			strcat( ici_opt, "\"" );
		}
		if ( p2 ) {
			i = WinExec( ici_opt, SW_SHOW );
			if ( i < 32 ) return -1;
		}
	}
#endif

	return -st;
}


//----------------------------------------------------------
//		Additional service on 3.0
//----------------------------------------------------------

EXPORT BOOL WINAPI hsc3_getruntime ( char *p1, char *p2, int p3, int p4 )
{
	//
	//		hsc3_getruntime val  (type5)
	//
	int i;
	i = hsc3->GetRuntimeFromHeader( p2, p1 );
	if ( i != 1 ) { *p1 = 0; }
	return 0;
}


EXPORT BOOL WINAPI hsc3_run ( char *p1, int p2, int p3, int p4 )
{
	//
	//		hsc3_run path, debug_flag  (type1)
	//
	int i;
	i = WinExec( p1, SW_SHOW );
	if ( i < 32 ) return -1;
	return 0;
}

//----------------------------------------------------------
//		Additional service on 3.1
//----------------------------------------------------------

EXPORT BOOL WINAPI aht_source( HSPEXINFO *hei, int p1, int p2, int p3 )
{
	//
	//		aht_source var, "aht_file", "path", id (type$202)
	//		(id<0�̏ꍇ�͎����m�ہA�����łȂ���Ύw��ID�Ɋm��)
	//
	PVal *pv;
	APTR ap;
	char *p;
	int ep1;
	int res;

	int st;
	char fn[_MAX_PATH];
	char fpath[_MAX_PATH];
	AHTMODEL *ahtmodel;
	if ( aht == NULL ) return -1;

	ap = hei->HspFunc_prm_getva( &pv );		// �p�����[�^1:�ϐ�
	p = hei->HspFunc_prm_gets();			// �p�����[�^2:������
	strcpy( fn, p );
	p = hei->HspFunc_prm_gets();			// �p�����[�^3:������
	strcpy( fpath, p );
	ep1 = hei->HspFunc_prm_getdi( -1 );		// �p�����[�^4:���l

	if ( ep1 < 0 ) {
		ahtmodel =aht->AddModel();
	} else {
		ahtmodel =aht->EntryModel( ep1 );
	}

	ahtmodel->SetName( fn );
	ahtmodel->SetSource( fn );
	ahtmodel->SetSourcePath( fpath );
	res = ahtmodel->GetId();
	hei->HspFunc_prm_setva( pv, ap, TYPE_INUM, &res );	// �ϐ��ɒl����

	//		AHT�����
	hsc3->ResetError();
	if (orgcompath==0) {
		GetModuleFileName( NULL,compath,_MAX_PATH );
		GetFilePath( compath );
		strcat( compath, fpath );
	}
	hsc3->SetCommonPath( compath );
	st = hsc3->PreProcessAht( fn, ahtmodel, 0 );

	aht->Mesf( "%s", hsc3->GetError() );

	if ( st != 0 ) {
		hsc3->PreProcessEnd();
		return st;
	}

	ahtmodel->TerminateExp();
	hsc3->PreProcessEnd();

	aht->BuildGlobalID();				// �O���[�o��ID���X�V����

	if ( st != 0 ) return st;

	return 0;
}


EXPORT BOOL WINAPI aht_ini ( BMSCR *bm, char *p1, int p2, int p3 )
{
	//
	//		aht_ini "prj_file" (type6)
	//
	if ( aht != NULL ) { delete aht; aht=NULL; }
	aht = new CAht;
	aht->SetPrjFile( p1 );
	return 0;
}


EXPORT BOOL WINAPI aht_stdbuf ( char *p1, int p2, int p3, int p4 )
{
	//
	//		aht_stdbuf debug_buf  (type1)
	//
	if ( aht == NULL ) return -1;
	strcpy( p1, aht->GetStdBuffer() );
	return 0;
}


EXPORT BOOL WINAPI aht_stdsize ( int *p1, int p2, int p3, int p4 )
{
	//
	//		aht_stdbuf var  (type1)
	//
	if ( aht == NULL ) return -1;
	*p1 = (int)strlen( aht->GetStdBuffer() ) + 1;
	return 0;
}


EXPORT BOOL WINAPI aht_getopt( char *p1, char *p2, int p3, int p4 )
{
	//
	//		aht_getopt var, "parameter", modelID, maxstr (type5)
	//
	int max;
	char *p;
	AHTMODEL *ahtmodel;
	if ( aht == NULL ) return -1;

	ahtmodel =aht->GetModel( p3 );
	if ( ahtmodel == NULL ) return -1;
	p = ahtmodel->GetAHTOption( p2 );
	max = p4;
	if ( max <= 0 ) max = 64;
	strcpy2( p1, p, max );

	return 0;
}


EXPORT BOOL WINAPI aht_getpropcnt ( int *p1, int p2, int p3, int p4 )
{
	//
	//		aht_getpropcnt var,modelID,sw  (type1)
	//		( sw=0:��/1:�ҏW�s�� )
	//
	AHTMODEL *ahtmodel;
	if ( aht == NULL ) return -1;
	ahtmodel =aht->GetModel( p2 );
	if ( ahtmodel == NULL ) return -1;

	switch( p3 ) {
	case 1:
		*p1 = ahtmodel->GetPropertyPossibleLines();
		break;
	default:
		*p1 = ahtmodel->GetPropCount();
		break;
	}
	return 0;
}


EXPORT BOOL WINAPI aht_getpropid ( int *p1, char *p2, int p3, int p4 )
{
	//
	//		aht_getpropid var,"name",modelID  (type5)
	//
	AHTMODEL *ahtmodel;
	if ( aht == NULL ) return -1;
	ahtmodel =aht->GetModel( p3 );
	if ( ahtmodel == NULL ) return -1;
	*p1 = ahtmodel->GetPropertyID( p2 );
	return 0;
}


EXPORT BOOL WINAPI aht_getprop( char *p1, int p2, int p3, int p4 )
{
	//
	//		aht_getprop var, DataID, propID, modelID (type1)
	//
	int max;
	AHTMODEL *ahtmodel;
	AHTPROP *prop;
	char **p;
	char *t;
	if ( aht == NULL ) return -1;

	ahtmodel =aht->GetModel( p4 );
	if ( ahtmodel == NULL ) return -1;
	prop = ahtmodel->GetProperty( p3 );
	p = (char **)(&prop->name);

	max = 512;
	t = p[p2];
	if ( p2 == 2 ) t = prop->GetValue();

	strcpy2( p1, t, max );

	return (-(prop->ahttype));
}


EXPORT BOOL WINAPI aht_getproptype ( int *p1, int p2, int p3, int p4 )
{
	//
	//		aht_getproptype var, propID, modelID  (type1)
	//
	AHTPROP *prop;
	AHTMODEL *ahtmodel;
	if ( aht == NULL ) return -1;
	ahtmodel =aht->GetModel( p3 );
	if ( ahtmodel == NULL ) return -1;
	prop = ahtmodel->GetProperty( p2 );
	*p1 = prop->ahttype;
	return 0;
}


EXPORT BOOL WINAPI aht_getpropmode ( int *p1, int p2, int p3, int p4 )
{
	//
	//		aht_getpropmode var, propID, modelID  (type1)
	//
	AHTPROP *prop;
	AHTMODEL *ahtmodel;
	if ( aht == NULL ) return -1;
	ahtmodel =aht->GetModel( p3 );
	if ( ahtmodel == NULL ) return -1;
	prop = ahtmodel->GetProperty( p2 );
	*p1 = prop->ahtmode;
	return 0;
}


EXPORT BOOL WINAPI aht_make ( int *p1, char *p2, int p3, int p4 )
{
	//
	//		aht_make var, "outfile", modelID, mode (type5)
	//					( mode:bit0="hsptmp"out/bit1=ahtout/bit2=HSP source build)
	//
	int st;
	int res;
	AHTMODEL *ahtmodel;
	char fname2[_MAX_PATH];

	if ( aht == NULL ) return -1;
	ahtmodel =aht->GetModel( p3 );
	if ( ahtmodel == NULL ) return -1;

	strcpy( fname2, ahtmodel->GetSource() );
	res = 0;
	hsc3->ResetError();
	if (orgcompath==0) {
		GetModuleFileName( NULL,compath,_MAX_PATH );
		GetFilePath( compath );
		strcat( compath, ahtmodel->GetSourcePath() );
	}
	hsc3->SetCommonPath( compath );
	st = hsc3->PreProcessAht( fname2, ahtmodel, 1 );
	aht->Mesf( "%s", hsc3->GetError() );
	if ( st != 0 ) {
		hsc3->PreProcessEnd();
		*p1 = 1;
		return st;
	}

	if ( p4&1 ) {
		res |= hsc3->SaveOutbuf( "hsptmp" );
	}
	if ( p4&2 ) {
		res |= hsc3->SaveAHTOutbuf( p2 );
	}
	if ( p4&4 ) {
		//			AHT�}�l�[�W���[�p�Ƀ\�[�X���\�z����
		//
		aht->AddMakeBufferInit( hsc3->ahtbuf->GetBuffer(), hsc3->ahtbuf->GetSize() );
		aht->AddMakeBufferMain( hsc3->outbuf->GetBuffer(), hsc3->outbuf->GetSize() );
	}

	hsc3->PreProcessEnd();
	*p1 = res;
	if ( st != 0 ) return st;
	return 0;
}


EXPORT BOOL WINAPI aht_makeinit ( int p1, int p2, int p3, int p4 )
{
	//
	//		aht_makeinit (type0)
	//
	aht->InitMakeBuffer();
	return 0;
}


EXPORT BOOL WINAPI aht_makeend ( BMSCR *bm, char *p1, int p2, int p3 )
{
	//
	//		aht_makeend "fname" (type6)
	//
	int res;
	res = aht->SaveMakeBuffer( p1 );
	aht->DisposeMakeBuffer();
	if ( res ) return -1;
	return 0;
}


EXPORT BOOL WINAPI aht_makeput ( BMSCR *bm, char *p1, int p2, int p3 )
{
	//
	//		aht_makeput "message",sw (type6)
	//
	if ( p2 ) {
		aht->AddMakeBufferInit( p1 );
	} else {
		aht->AddMakeBufferMain( p1 );
	}
	return 0;
}


EXPORT BOOL WINAPI aht_setprop ( BMSCR *bm, char *p1, int p2, int p3 )
{
	//
	//		aht_setprop "defval", propID, modelID (type6)
	//
	AHTMODEL *ahtmodel;
	AHTPROP *prop;
	if ( aht == NULL ) return -1;

	ahtmodel =aht->GetModel( p3 );
	if ( ahtmodel == NULL ) return -1;
	prop = ahtmodel->GetProperty( p2 );
	if ( prop == NULL ) return -1;
	prop->SetNewVal( p1 );
	return 0;
}


EXPORT BOOL WINAPI aht_sendstr ( char *p1, int p2, int p3, int p4 )
{
	//		send key event (type1)
	//			aht_sendstr sendbuf, hwnd
	//
	LPARAM lprm;
	DWORD version;
	version = GetVersion();
	if ( LOBYTE(LOWORD(version)) > 4 ) {
		_sendstr2( (HWND)p2, p1 );
		return 0;
	}
	_sendstr( (HWND)p2, p1 );

	lprm=0xd0000001;

	PostMessage( (HWND)p2, WM_KEYDOWN, VK_RETURN, lprm );
	PostMessage( (HWND)p2, WM_CHAR, VK_RETURN, lprm );
	PostMessage( (HWND)p2, WM_KEYUP, VK_RETURN, lprm );

	return 0;
}


EXPORT BOOL WINAPI aht_getmodcnt ( int *p1, int p2, int p3, int p4 )
{
	//
	//		aht_getmodcnt var  (type1)
	//
	if ( aht == NULL ) return -1;
	*p1 = aht->GetModelCount();
	return 0;
}


EXPORT BOOL WINAPI aht_getmodaxis ( int *p1, int p2, int p3, int p4 )
{
	//
	//		aht_getmodaxis var,modelID  (type1)
	//
	AHTMODEL *ahtmodel;
	if ( aht == NULL ) return -1;

	ahtmodel =aht->GetModel( p2 );
	if ( ahtmodel == NULL ) return -1;

	p1[0] = ahtmodel->GetCurX();
	p1[1] = ahtmodel->GetCurY();
	p1[2] = ahtmodel->GetIconId();
	p1[3] = ahtmodel->GetPage();
	p1[4] = ahtmodel->GetNextID();
	p1[5] = ahtmodel->GetPrevID();
	return 0;
}


EXPORT BOOL WINAPI aht_setmodaxis ( int p1, int p2, int p3, int p4 )
{
	//
	//		aht_setmodaxis modelID, x, y, page  (type0)
	//
	AHTMODEL *ahtmodel;
	if ( aht == NULL ) return -1;

	ahtmodel =aht->GetModel( p1 );
	if ( ahtmodel == NULL ) return -1;

	ahtmodel->SetCur( p2, p3 );
	ahtmodel->SetPage( p4 );
	return 0;
}


EXPORT BOOL WINAPI aht_prjload ( BMSCR *bm, char *p1, int p2, int p3 )
{
	//
	//		aht_prjload "prj_file" (type6)
	//
	int res;
	if ( aht == NULL ) return -1;
	res = aht->LoadProject( p1 );
	if ( res ) return res;
	return 0;
}


EXPORT BOOL WINAPI aht_prjsave ( BMSCR *bm, char *p1, int p2, int p3 )
{
	//
	//		aht_prjsave "prj_file" (type6)
	//
	int res;
	if ( aht == NULL ) return -1;
	res = aht->SaveProject( p1 );
	if ( res ) return -1;
	return 0;
}


EXPORT BOOL WINAPI aht_getprjmax( HSPEXINFO *hei, int p1, int p2, int p3 )
{
	//
	//		aht_getprjmax var (type$202)
	//		var��model����Ԃ�
	//
	PVal *pv;
	APTR ap;
	int res;

	if ( aht == NULL ) return -1;
	ap = hei->HspFunc_prm_getva( &pv );		// �p�����[�^1:�ϐ�

	res = aht->GetProjectFileModelMax();
	hei->HspFunc_prm_setva( pv, ap, TYPE_INUM, &res );	// �ϐ��ɒl����
	return 0;
}


EXPORT BOOL WINAPI aht_getprjsrc( HSPEXINFO *hei, int p1, int p2, int p3 )
{
	//
	//		aht_getprjsrc var, var2, var3, id (type$202)
	//		var��fname�Avar2��fpath�Avar3��ObjectID��Ԃ��B
	//
	PVal *pv;
	APTR ap;
	PVal *pv2;
	APTR ap2;
	PVal *pv3;
	APTR ap3;
	int ep1;
	char *p;
	int res;

	if ( aht == NULL ) return -1;

	ap = hei->HspFunc_prm_getva( &pv );		// �p�����[�^1:�ϐ�
	ap2 = hei->HspFunc_prm_getva( &pv2 );	// �p�����[�^2:�ϐ�
	ap3 = hei->HspFunc_prm_getva( &pv3 );	// �p�����[�^3:�ϐ�
	ep1 = hei->HspFunc_prm_getdi( 0 );		// �p�����[�^4:���l

	p = aht->GetProjectFileModel( ep1 );
	hei->HspFunc_prm_setva( pv, ap, TYPE_STRING, p );	// �ϐ��ɒl����
	p = aht->GetProjectFileModelPath( ep1 );
	hei->HspFunc_prm_setva( pv2, ap2, TYPE_STRING, p );	// �ϐ��ɒl����
	res = aht->GetProjectFileModelID( ep1 );
	hei->HspFunc_prm_setva( pv3, ap3, TYPE_INUM, &res );	// �ϐ��ɒl����

	return 0;
}


EXPORT BOOL WINAPI aht_prjload2( HSPEXINFO *hei, int p1, int p2, int p3 )
{
	//
	//		aht_prjload2 model_id, id (type$202)
	//		( ���f���f�[�^�̍X�V�Baht_prjload�̌�Ƀ��f�����ƂɎ��s����B )
	//
	int ep1,ep2;
	int res;

	if ( aht == NULL ) return -1;

	res = 0;
	ep1 = hei->HspFunc_prm_getdi( 0 );		// �p�����[�^1:���l
	ep2 = hei->HspFunc_prm_getdi( 0 );		// �p�����[�^2:���l

	aht->LoadProjectApply( ep1, ep2 );

	return res;
}


EXPORT BOOL WINAPI aht_prjloade( HSPEXINFO *hei, int p1, int p2, int p3 )
{
	//
	//		aht_prjloade (type$202)
	//
	if ( aht == NULL ) return -1;

	aht->LoadProjectEnd();
	return 0;
}


EXPORT BOOL WINAPI aht_delmod( int p1, int p2, int p3, int p4 )
{
	//
	//		aht_delmod modelID  (type0)
	//
	if ( aht == NULL ) return -1;
	aht->DeleteModel( p1 );
	return 0;
}


EXPORT BOOL WINAPI aht_linkmod( int p1, int p2, int p3, int p4 )
{
	//
	//		aht_linkmod modelID, NextID  (type0)
	//
	if ( aht == NULL ) return -1;
	aht->LinkModel( p1, p2 );
	return 0;
}


EXPORT BOOL WINAPI aht_unlinkmod( int p1, int p2, int p3, int p4 )
{
	//
	//		aht_unlinkmod modelID  (type0)
	//
	if ( aht == NULL ) return -1;
	aht->UnlinkModel( p1 );
	return 0;
}


EXPORT BOOL WINAPI aht_setpage( int p1, int p2, int p3, int p4 )
{
	//
	//		aht_setpage cur,max  (type0)
	//
	if ( aht == NULL ) return -1;
	aht->SetPage( p1, p2 );
	return 0;
}


EXPORT BOOL WINAPI aht_getpage( HSPEXINFO *hei, int p1, int p2, int p3 )
{
	//
	//		aht_getpage var,var2 (type$202)
	//
	PVal *pv;
	APTR ap;
	PVal *pv2;
	APTR ap2;
	int res;

	if ( aht == NULL ) return -1;

	ap = hei->HspFunc_prm_getva( &pv );		// �p�����[�^1:�ϐ�
	ap2 = hei->HspFunc_prm_getva( &pv2 );	// �p�����[�^2:�ϐ�

	res = aht->GetCurrentPage();
	hei->HspFunc_prm_setva( pv, ap, TYPE_INUM, &res );	// �ϐ��ɒl����
	res = aht->GetMaxPage();
	hei->HspFunc_prm_setva( pv2, ap2, TYPE_INUM, &res );	// �ϐ��ɒl����

	return 0;
}


EXPORT BOOL WINAPI aht_propupdate( HSPEXINFO *hei, int p1, int p2, int p3 )
{
	//
	//		aht_propupdate model_id (type$202)
	//		( �v���p�e�B�̍X�V )
	//
	int ep1;
	if ( aht == NULL ) return -1;
	ep1 = hei->HspFunc_prm_getdi( 0 );		// �p�����[�^1:���l
	aht->UpdateModelProperty( ep1 );
	return 0;
}


EXPORT BOOL WINAPI aht_parts( HSPEXINFO *hei, int p1, int p2, int p3 )
{
	//
	//		aht_parts "path","list" (type$202)
	//
	char *ep1;
	char *ep2;
	char path[256];
	if ( aht == NULL ) return -1;
	ep1 = hei->HspFunc_prm_gets();			// �p�����[�^1:������
	strcpy( path, ep1 );
	ep2 = hei->HspFunc_prm_gets();			// �p�����[�^2:������
	aht->BuildParts( ep2, path );
	return 0;
}


EXPORT BOOL WINAPI aht_getparts( HSPEXINFO *hei, int p1, int p2, int p3 )
{
	//
	//		aht_getparts id, var,var2,var3 (type$202)
	//					 ( ICONID,name,classname���������� )
	//
	PVal *pv;
	APTR ap;
	PVal *pv2;
	APTR ap2;
	PVal *pv3;
	APTR ap3;
	int ep1;
	int res;
	char *p;

	if ( aht == NULL ) return -1;

	ep1 = hei->HspFunc_prm_getdi( 0 );		// �p�����[�^1:���l
	ap = hei->HspFunc_prm_getva( &pv );		// �p�����[�^2:�ϐ�
	ap2 = hei->HspFunc_prm_getva( &pv2 );	// �p�����[�^3:�ϐ�
	ap3 = hei->HspFunc_prm_getva( &pv3 );	// �p�����[�^4:�ϐ�

	res = aht->GetPartsIconID(ep1);
	hei->HspFunc_prm_setva( pv, ap, TYPE_INUM, &res );	// �ϐ��ɒl����
	p = aht->GetPartsName(ep1);
	hei->HspFunc_prm_setva( pv2, ap2, TYPE_STRING, p );	// �ϐ��ɒl����
	p = aht->GetPartsClassName(ep1);
	hei->HspFunc_prm_setva( pv3, ap3, TYPE_STRING, p );	// �ϐ��ɒl����

	return 0;
}


EXPORT BOOL WINAPI aht_listparts( HSPEXINFO *hei, int p1, int p2, int p3 )
{
	//
	//		aht_listparts var,"clsname" (type$202)
	//
	PVal *pv;
	APTR ap;
	char *ep1;
	char *p;

	if ( aht == NULL ) return -1;

	ap = hei->HspFunc_prm_getva( &pv );		// �p�����[�^1:�ϐ�
	ep1 = hei->HspFunc_prm_gets();			// �p�����[�^2:������
	p = aht->SearchModelByClassName( ep1 );
	hei->HspFunc_prm_setva( pv, ap, TYPE_STRING, p );	// �ϐ��ɒl����
	return 0;
}


EXPORT BOOL WINAPI aht_findstart( HSPEXINFO *hei, int p1, int p2, int p3 )
{
	//
	//		aht_findstart var (type$202)
	//
	if ( aht == NULL ) return -1;
	aht->FindModelStart();
	homeid = -1;
	ahtbuild_error = 0;
	return 0;
}


EXPORT BOOL WINAPI aht_findparts( HSPEXINFO *hei, int p1, int p2, int p3 )
{
	//
	//		aht_findparts var (type$202)
	//
	PVal *pv;
	APTR ap;
	int res;
	AHTMODEL *m;
	char *p;
	int len;
	int i;
	int statval;

	if ( aht == NULL ) return -1;

	ap = hei->HspFunc_prm_getva( &pv );		// �p�����[�^1:�ϐ�
	res = aht->FindModel();
	hei->HspFunc_prm_setva( pv, ap, TYPE_INUM, &res );	// �ϐ��ɒl����

	if ( res >= 0 ) {
		m = aht->GetModel( res );
		p = m->GetClass();
		len = (int)strlen( p ) - 5; if ( len < 0 ) len = 0;
		if ( tstrcmp( p+len, ".home" ) ) {			// home�N���X���ǂ����m�F����
			if ( homeid != -1 ) ahtbuild_error = 2;
			homeid = res;
		}
	}

	statval = 0;
	i = aht->FindModelGetParentId();				// �����N��ID���擾����
	if ( i >= 0 ) {
		m = aht->GetModel( i );
		p = m->GetClass();
		len = (int)strlen( p ) - 8; if ( len < 0 ) len = 0;
		if ( tstrcmp( p+len, ".routine" ) ) {			// routine�N���X���ǂ����m�F����
			statval = -1;
		}
	}

	return statval;
}


EXPORT BOOL WINAPI aht_findend( HSPEXINFO *hei, int p1, int p2, int p3 )
{
	//
	//		aht_findend var, mode (type$202)
	//		( mode=0:ERROR�\������/1:�Ȃ� )
	//
	PVal *pv;
	APTR ap;
	int ep1;
	char *err;

	if ( aht == NULL ) return -1;
	ap = hei->HspFunc_prm_getva( &pv );		// �p�����[�^1:�ϐ�
	ep1 = hei->HspFunc_prm_getdi( 0 );		// �p�����[�^2:���l

	if ( homeid == -1 ) ahtbuild_error = 1;

	if ( ep1 == 0 ) {
		err = NULL;
		switch( ahtbuild_error ) {
		case 1:
			err = "�z�[���̃p�[�c���z�u����Ă��܂���B\n�ŏ��Ɏ��s����z�[����u���Ă��������B";
			break;
		case 2:
			err = "�z�[���̃p�[�c�������z�u����Ă��܂��B\n�z�[���͂P�����u���Ă��������B";
			break;
		default:
			break;
		}
		if ( err != NULL ) Alert( err );
	}

	hei->HspFunc_prm_setva( pv, ap, TYPE_INUM, &ahtbuild_error );	// �ϐ��ɒl����

	return 0;
}


EXPORT BOOL WINAPI aht_getexid( HSPEXINFO *hei, int p1, int p2, int p3 )
{
	//
	//		aht_getexid var, mode (type$202)
	//			( var�Ƀ��f��ID�������� )
	//			( mode:0=�����N��ID/1=HOME��ID )
	//
	PVal *pv;
	APTR ap;
	int ep1;
	int res;

	if ( aht == NULL ) return -1;

	ap = hei->HspFunc_prm_getva( &pv );		// �p�����[�^1:�ϐ�
	ep1 = hei->HspFunc_prm_getdi( 0 );		// �p�����[�^2:���l

	res = -1;
	switch( ep1 ) {
	case 0:
		res = aht->FindModelGetParentId();
		break;
	case 1:
		res = homeid;
		break;
	default:
		break;
	}

	hei->HspFunc_prm_setva( pv, ap, TYPE_INUM, &res );	// �ϐ��ɒl����

	return 0;
}


//----------------------------------------------------------

#ifdef USE_HSMANAGER

EXPORT BOOL WINAPI hman_init(HSPEXINFO *hei, int p1, int p2, int p3)
{
	//
	//		hman_init "pathname", mode (type$202)
	//			( mode:���g�p )
	//
	char *ep1;
	int ep2;
	int res;
	char path[256];

	ep1 = hei->HspFunc_prm_gets();			// �p�����[�^1:������
	strncpy(path, ep1, 255);
	ep2 = hei->HspFunc_prm_getdi(0);		// �p�����[�^2:���l

	res = hsman.initalize( path );
	if (res < 0) return -1;

	return 0;
}

EXPORT BOOL WINAPI hman_search(HSPEXINFO *hei, int p1, int p2, int p3)
{
	//
	//		hman_search "keyword" (type$202)
	//			( ��������w�肵�ăw���v���������� )
	//
	char key[256];
	char *ep1;
	int res;

	ep1 = hei->HspFunc_prm_gets();			// �p�����[�^1:������
	strncpy(key, ep1, 255);

	res = hsman.searchIndex(key);
	if (res < 0) return -1;

	return 0;
}

EXPORT BOOL WINAPI hman_getresult(HSPEXINFO *hei, int p1, int p2, int p3)
{
	//
	//		hman_getresult var,option (type$202)
	//			( var�Ɍ��ʕ������������ )
	//
	PVal *pv;
	APTR ap;
	char *res;
	int ep1;

	ap = hei->HspFunc_prm_getva(&pv);		// �p�����[�^1:�ϐ�
	ep1 = hei->HspFunc_prm_getdi(0);		// �p�����[�^2:���l
	res = hsman.getMessage();
	hei->HspFunc_prm_setva(pv, ap, TYPE_STRING, res);	// �ϐ��ɒl����

	return 0;
}

#endif

//----------------------------------------------------------
