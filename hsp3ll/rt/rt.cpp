#include "../supio.h"
#include "../hsp3r.h"
#include "../hspvar_util.h"

extern "C" {

void RtCoreReset( PVal *pv )
{
	HspVarCoreReset( pv );
}

void RtUnsafeVarSetIndex1i( PVal *pval, int v, int i0 )
{
	//	�ϐ����(var=???)
	//		i0=�z��v�f�̃C���f�b�N�X
	//
	int *dst = (((int *)(pval->pt))+i0);
	*(int *)dst = v;
}


void RtUnsafeVarSetIndex1d( PVal *pval, double v, int i0 )
{
	//	�ϐ����(var=???)
	//		i0=�z��v�f�̃C���f�b�N�X
	//
	double *dst = (((double *)(pval->pt))+i0);
	*(double *)dst = v;
}

void RtStackPushi( int val )
{
//	if ( stm_cur >= stm_maxptr ) throw HSPERR_STACK_OVERFLOW;
	stm_cur->type = HSPVAR_FLAG_INT;
	stm_cur->ival = val;
	stm_cur++;
}

void RtStackPushl( int val )
{
//	if ( stm_cur >= stm_maxptr ) throw HSPERR_STACK_OVERFLOW;
	stm_cur->type = HSPVAR_FLAG_LABEL;
	stm_cur->ival = val;
	stm_cur++;
}

void RtStackPushd( double val )
{
	double *dptr;
//	if ( stm_cur >= stm_maxptr ) throw HSPERR_STACK_OVERFLOW;
	stm_cur->type = HSPVAR_FLAG_DOUBLE;
	dptr = (double *)&stm_cur->ival;
	*dptr = val;
	stm_cur++;
}

void RtStackPop( void )
{
//	if ( stm_cur <= mem_stm ) throw HSPERR_UNKNOWN_CODE;
	stm_cur--;
	if ( stm_cur->mode ) {
		StackPopFree();
	}
}

}
