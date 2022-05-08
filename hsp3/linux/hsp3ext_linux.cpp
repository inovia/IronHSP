
//
//	HSP3 External program manager
//	onion software/onitama 2004/6
//
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <ctype.h>
#include <locale.h>

#include "../hsp3config.h"
#include "../hsp3code.h"
#include "../hsp3debug.h"
#include "../supio.h"
#include "../strbuf.h"

#include "hsp3ext_linux.h"

static HSPCTX *hspctx;		// Current Context
static HSPEXINFO *exinfo;	// Info for Plugins
static int *type;
static int *val;
static int *exflg;
static int reffunc_intfunc_ivalue;
static int reset_flag = 0;

/*------------------------------------------------------------*/
/*
		System Information initialization
*/
/*------------------------------------------------------------*/

static void InitSystemInformation(void)
{
	//		�R�}���h���C�� & �V�X�e���t�H���_�֘A
	char *cl;
	char dir_hsp[HSP_MAX_PATH+1];
	int p,i;
	char a1,a2;

	if (reset_flag) return;

	cl = hspctx->modfilename;
	strcpy( dir_hsp, cl );
	p = 0; i = 0;
	while(dir_hsp[i]){
		if(dir_hsp[i]=='/' || dir_hsp[i]=='\\') p=i;
		i++;
	}
	dir_hsp[p]=0;
	sbStrCopy(&(hspctx->modfilename), dir_hsp);
	strcat( dir_hsp, "/hsptv/" );
	sbStrCopy(&(hspctx->tvfoldername), dir_hsp);
	sbStrCopy(&(hspctx->homefoldername), getenv("HOME") );

	//		Locale set
	setlocale(LC_ALL,"");
	cl = setlocale(LC_ALL,NULL);
	a1 = (char)tolower(cl[0]);
	a2 = (char)tolower(cl[1]);
	hspctx->langcode[0] = a1;
	hspctx->langcode[1] = a2;
	if ((a1=='j')&&(a2=='a')) {
		hspctx->language = HSPCTX_LANGUAGE_JP;
	}

	reset_flag = 1;
}



/*------------------------------------------------------------*/
/*
		type function
*/
/*------------------------------------------------------------*/

static int cmdfunc_dllcmd( int cmd )
{
	//		cmdfunc : TYPE_DLLCTRL
	//		(�g��DLL�R���g���[���R�}���h)
	//
	code_next();							// ���̃R�[�h���擾(�ŏ��ɕK���K�v�ł�)

	switch( cmd ) {							// �T�u�R�}���h���Ƃ̕���
	case 0x00:								// newcom
		throw (HSPERR_UNSUPPORTED_FUNCTION);

	default:
		throw ( HSPERR_SYNTAX );
	}

	return RUNMODE_RUN;
}


static void *reffunc_dllcmd( int *type_res, int arg )
{
	//		reffunc : TYPE_DLLFUNC
	//		(�g��DLL�֐�)
	//

	//			'('�Ŏn�܂邩�𒲂ׂ�
	//
	if ( *type != TYPE_MARK ) throw ( HSPERR_INVALID_FUNCPARAM );
	if ( *val != '(' ) throw ( HSPERR_INVALID_FUNCPARAM );

	*type_res = HSPVAR_FLAG_INT;
	//exec_dllcmd( arg, STRUCTDAT_OT_FUNCTION );
	reffunc_intfunc_ivalue = hspctx->stat;

	//			')'�ŏI��邩�𒲂ׂ�
	//
	if ( *type != TYPE_MARK ) throw ( HSPERR_INVALID_FUNCPARAM );
	if ( *val != ')' ) throw ( HSPERR_INVALID_FUNCPARAM );
	code_next();

	return &reffunc_intfunc_ivalue;
}


static int termfunc_dllcmd( int option )
{
	//		termfunc : TYPE_DLLCMD
	//
	return 0;
}

void hsp3typeinit_dllcmd( HSP3TYPEINFO *info )
{
	hspctx = info->hspctx;
	exinfo = info->hspexinfo;
	type = exinfo->nptype;
	val = exinfo->npval;
	exflg = exinfo->npexflg;

	info->cmdfunc = cmdfunc_dllcmd;
	info->reffunc = reffunc_dllcmd;
	info->termfunc = termfunc_dllcmd;

	InitSystemInformation();
}

void hsp3typeinit_dllctrl( HSP3TYPEINFO *info )
{
}


/*------------------------------------------------------------*/
/*
		Sysinfo, getdir service
*/
/*------------------------------------------------------------*/

char *hsp3ext_sysinfo(int p2, int* res, char* outbuf)
{
	//		System strings get
	//
	int fl;
	char *p1;
	fl = HSPVAR_FLAG_INT;
	p1 = outbuf;
	*p1=0;

	switch(p2) {
	case 0:
		strcpy( p1, "Linux" );
		fl=HSPVAR_FLAG_STR;
		break;
	case 1:
		break;
	case 2:
		break;
	case 3:
		*(int*)p1 = hspctx->language;
		break;
	default:
		return NULL;
	}
	*res = fl;
	return p1;
}


char* hsp3ext_getdir(int id)
{
	//		dirinfo���߂̓��e��ݒ肷��
	//
	char *p = hspctx->stmp;
	*p = 0;
	int cutlast = 0;

	switch( id ) {
	case 0:				//    �J�����g(���݂�)�f�B���N�g��
#if defined(HSPLINUX)||defined(HSPEMSCRIPTEN)
		getcwd( p, HSP_MAX_PATH );
		cutlast = 1;
#endif
		break;
	case 1:				//    HSP�̎��s�t�@�C��������f�B���N�g��
		p = hspctx->modfilename;
		break;
	case 2:				//    Windows�f�B���N�g��
		break;
	case 3:				//    Windows�̃V�X�e���f�B���N�g��
		break;
	case 4:				//    �R�}���h���C��������
		p = hspctx->cmdline;
		break;
	case 5:				//    HSPTV�f�ނ�����f�B���N�g��
		p = hspctx->tvfoldername;
		break;
	case 6:				//    �����Q�[�W�R�[�h
		p = hspctx->langcode;
		break;
	case 0x10005:			//    �}�C�h�L�������g
		p = hspctx->homefoldername;
		break;
	default:
		throw HSPERR_ILLEGAL_FUNCTION;
	}

	//		�Ō��'/'����菜��
	//
	if (cutlast) {
		CutLastChr(p, '/');
	}
	return p;
}


void hsp3ext_execfile(char* msg, char* option, int mode)
{
#ifdef HSPLINUX
	system(msg);
#endif
}



