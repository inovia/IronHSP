
//
//	HSP3 C++ runtime manager
//	onion software/onitama 2008/5
//
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "hsp3r.h"
#include "../hsp3/hsp3config.h"
#include "../hsp3/hsp3debug.h"
#include "../hsp3/dpmread.h"
#include "../hsp3/supio.h"

/*------------------------------------------------------------*/
/*
		constructor
*/
/*------------------------------------------------------------*/

Hsp3r::Hsp3r()
{
	//		������
	//
	memset( &hspctx, 0, sizeof(HSPCTX) );
	code_setctx( &hspctx );
	code_init();
	hspctx.mem_mcs = NULL;
}

Hsp3r::~Hsp3r()
{
	//		���ׂĔj��
	//
	code_termfunc();
	Dispose();
	code_bye();
	VarUtilTerm();
}

/*------------------------------------------------------------*/
/*
		interface
*/
/*------------------------------------------------------------*/

void Hsp3r::Dispose( void )
{
	//		ax��j��
	//
	if ( hspctx.mem_var != NULL ) {
		int i;
		for(i=0;i<maxvar;i++) {
			HspVarCoreDispose( &hspctx.mem_var[i] );
		}
		delete [] hspctx.mem_var;	hspctx.mem_var = NULL;
	}
}

int Hsp3r::Reset( int ext_vars, int ext_hpi )
{
	//		HSP3R��������
	//			ext_vars = �ϐ�ID�̐�
	//			ext_hpi  = �g��HPI�̐�
	//
//	int i;
//	char *ptr;
//	char fname[512];
	if ( hspctx.mem_mcs != NULL ) Dispose();

	//		load HSP execute object
	//
#ifdef HSPNDK
    //      android data file path
    dpm_ini( "/data/data/com.example.hsptest1/lib/libhsp3dish.so",0,-1,-1 );
#else
    dpm_ini( "data.dpm",0,-1,-1 );				// original EXE mode
#endif

	maxvar = ext_vars;
	max_varhpi = ext_hpi;
	hspctx.mem_mcs = (unsigned short *)this;
	hspctx.hsphed = &hsphed;

	memset( &hsphed, 0, sizeof(HSPHED) );
	hsphed.max_hpi = (short)( ext_hpi * sizeof( HPIDAT ) );
/*
	hspctx.mem_mcs = (unsigned short *)( ptr + hsphed->pt_cs );
	hspctx.mem_mds = (char *)( ptr + hsphed->pt_ds );
	hspctx.mem_ot = (int *)( ptr + hsphed->pt_ot );
	hspctx.mem_di = (unsigned char *)( ptr + hsphed->pt_dinfo );

	hspctx.mem_linfo = (LIBDAT *)( ptr + hsphed->pt_linfo );
	hspctx.mem_minfo = (STRUCTPRM *)( ptr + hsphed->pt_minfo );
	hspctx.mem_finfo = (STRUCTDAT *)( ptr + hsphed->pt_finfo );
*/
	HspVarCoreResetVartype( max_varhpi );		// �^�̏�����
	code_resetctx( &hspctx );		// hsp3code setup

	//		HspVar setup
	hspctx.mem_var = NULL;
	if ( maxvar ) {
		int i;
		hspctx.mem_var = new PVal[maxvar];

		for(i=0;i<maxvar;i++) {
			PVal *pval = &hspctx.mem_var[i];
			pval->mode = HSPVAR_MODE_NONE;
			pval->flag = HSPVAR_FLAG_INT;				// ���̌^
			HspVarCoreClear( pval, HSPVAR_FLAG_INT );	// �O���[�o���ϐ���0�Ƀ��Z�b�g
		}
	}

	return 0;
}


void Hsp3r::SetPackValue( int sum, int dec )
{
	hsp_sum = sum;
	hsp_dec = dec;
}


void Hsp3r::SetDataName( char *data )
{
	// Data Segment�ݒ�
	//
	hspctx.mem_mds = data;
}


void Hsp3r::SetFInfo( STRUCTDAT *finfo, int finfo_max )
{
	//		FInfo���č\������
	//
	hspctx.mem_finfo = finfo;
	hsphed.max_finfo = finfo_max;
}


void Hsp3r::SetLInfo( LIBDAT *linfo, int linfo_max )
{
	//		LInfo���č\������
	//
	hspctx.mem_linfo = linfo;
	hsphed.max_linfo = linfo_max;
}


void Hsp3r::SetMInfo( STRUCTPRM *minfo, int minfo_max )
{
	//		MInfo���č\������
	//
	hspctx.mem_minfo = minfo;
	hsphed.max_minfo = minfo_max;
}
