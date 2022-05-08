
//
//	HSPVAR utility
//	onion software/onitama 2008/4
//
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#ifdef HSPWIN
#include <windows.h>
#endif

#include "../hsp3/hsp3config.h"

#include "../hsp3/hsp3struct.h"
#include "../hsp3/stack.h"
#include "../hsp3/strbuf.h"
#include "../hsp3/hsp3code.h"
#include "../hsp3/supio.h"
#include "hspvar_util.h"

/*------------------------------------------------------------*/
/*
		extra header
*/
/*------------------------------------------------------------*/

/*------------------------------------------------------------*/
/*
		system data
*/
/*------------------------------------------------------------*/

extern CHSP3_TASK *__HspTaskFunc;		// hsp3cnv�Ő��������^�X�N�֐����X�g
void __HspEntry( void );			// hsp3cnv�Ő��������G���g���[�|�C���g
extern HSPCTX *code_getctx( void );

extern char *__HspFuncName[];			// hsp3cnv�Ő���������`�����񃊃X�g

static	HSPCTX *hspctx;					// HSP�̃R���e�L�X�g
static	CHSP3_TASK curtask;				// ���Ɏ��s�����^�X�N�֐�
static int *c_type;
static int *c_val;
static HSPEXINFO *exinfo;				// Info for Plugins
static int lasttask;

PVal *mem_var;							// �ϐ��p�̃�����
int	prmstacks;							// �p�����[�^�[�X�^�b�N��(���W���[���Ăяo���p)

PVal var_proxy;							// �㗝�ϐ��p�̃�����

extern bool llNoRangeCheck;

static	HSP3TYPEINFO *intcmd_info;
static	HSP3TYPEINFO *extcmd_info;
static	HSP3TYPEINFO *extsysvar_info;
static	HSP3TYPEINFO *intfunc_info;
static	HSP3TYPEINFO *sysvar_info;
static	HSP3TYPEINFO *progfunc_info;
static	HSP3TYPEINFO *modfunc_info;
static	HSP3TYPEINFO *dllfunc_info;
static	HSP3TYPEINFO *dllctrl_info;

static	HSP3_CMDFUNC intcmd_func;
static	HSP3_CMDFUNC extcmd_func;
static	HSP3_CMDFUNC progcmd_func;
static	HSP3_CMDFUNC modcmd_func;
static	HSP3_CMDFUNC dllcmd_func;
static	HSP3_CMDFUNC dllctl_func;

/*------------------------------------------------------------*/

static HspVarProc *varproc;
static STMDATA *stm1;
static STMDATA *stm2;
static int tflag;
static int arrayobj_flag;


void HspVarCoreArray2( PVal *pval, int offset )
{
	//		�z��v�f�̎w�� (index)
	//		( Reset��Ɏ����������A���ŌĂ΂�܂� )
	//
	if ( pval->arraycnt >= 5 ) throw HSPVAR_ERROR_ARRAYOVER;
	if ( pval->arraycnt == 0 ) {
		pval->arraymul = 1;			// �ŏ��̒l
	} else {
		pval->arraymul *= pval->len[ pval->arraycnt ];
	}
	pval->arraycnt++;
	if ( offset < 0 ) throw HSPVAR_ERROR_ARRAYOVER;
	if ( offset >= (pval->len[ pval->arraycnt ]) ) {
		if ((pval->arraycnt >= 4 )||( pval->len[ pval->arraycnt+1 ]==0 )) {
			if ( pval->support & HSPVAR_SUPPORT_FLEXARRAY ) {
				//Alertf("Expand.(%d)",offset);
				HspVarCoreReDim( pval, pval->arraycnt, offset+1 );	// �z����g������
				pval->offset += offset * pval->arraymul;
				return;
			}
		}
		throw HSPVAR_ERROR_ARRAYOVER;
	}
	pval->offset += offset * pval->arraymul;
}


static char *PrepareCalc( void )
{
	//		�X�^�b�N����Q���ڎ��o���v�Z�̏������s�Ȃ�
	//
	char *calc_ptr;

#if 0
	if ( StackGetLevel < 2 ) {
		Alertf("Stack underflow(%d)",StackGetLevel);
	}
#endif

	stm2 = StackPeek;
	stm1 = StackPeek2;
	tflag = stm1->type;

	if ( tflag == HSPVAR_FLAG_INT ) {
		if ( stm2->type == HSPVAR_FLAG_INT ) {					// HSPVAR_FLAG_INT �̂ݍ�����
			return NULL;
		}
	}

	mpval = HspVarCoreGetPVal( tflag );
	varproc = HspVarCoreGetProc( tflag );

	if ( mpval->mode == HSPVAR_MODE_NONE ) {					// �^�ɍ��킹���e���|�����ϐ���������
		if ( varproc->flag == 0 ) {
			throw HSPERR_TYPE_INITALIZATION_FAILED;
		}
		HspVarCoreClearTemp( mpval, tflag );					// �ŏ��T�C�Y�̃��������m��
	}

	varproc->Set( mpval, (PDAT *)mpval->pt, STM_GETPTR(stm1) );	// �e���|�����ϐ��ɏ����l��ݒ�

	calc_ptr = STM_GETPTR(stm2);
	if ( tflag != stm2->type ) {								// �^����v���Ȃ��ꍇ�͕ϊ�
		if ( stm2->type >= HSPVAR_FLAG_USERDEF ) {
			calc_ptr = (char *)HspVarCoreGetProc(stm2->type)->CnvCustom( calc_ptr, tflag );
		} else {
			calc_ptr = (char *)varproc->Cnv( calc_ptr, stm2->type );
		}
	}
	//calcprm( varproc, (PDAT *)mpval->pt, op, ptr );				// �v�Z���s�Ȃ�
	return calc_ptr;
}


static void AfterCalc( void )
{
	//		�v�Z��̃X�^�b�N����
	//
	int basesize;
	StackPop();
	StackPop();

	if ( varproc->aftertype != tflag ) {						// ���Z��Ɍ^���ς��ꍇ
		tflag = varproc->aftertype;
		varproc = HspVarCoreGetProc( tflag );
	}
	basesize = varproc->basesize;
	if ( basesize < 0 ) {
		basesize = varproc->GetSize( (PDAT *)mpval->pt );
	}
	StackPush( tflag, mpval->pt, basesize );
}


static inline void code_arrayint2( PVal *pval, int offset )
{
	//		�z��v�f�̎w�� (index)
	//		( Reset��Ɏ����������A���ŌĂ΂�܂� )
	//
	if ( pval->arraycnt >= 5 ) throw HSPVAR_ERROR_ARRAYOVER;
	if ( pval->arraycnt == 0 ) {
		pval->arraymul = 1;			// �ŏ��̒l
	} else {
		pval->arraymul *= pval->len[ pval->arraycnt ];
	}
	pval->arraycnt++;
	if ( offset < 0 ) throw HSPVAR_ERROR_ARRAYOVER;
	if ( offset >= (pval->len[ pval->arraycnt ]) ) {
		if ((pval->arraycnt >= 4 )||( pval->len[ pval->arraycnt+1 ]==0 )) {
			if ( pval->support & HSPVAR_SUPPORT_FLEXARRAY ) {
				//Alertf("Expand.(%d)",offset);
				HspVarCoreReDim( pval, pval->arraycnt, offset+1 );	// �z����g������
				pval->offset += offset * pval->arraymul;
				return;
			}
		}
		throw HSPVAR_ERROR_ARRAYOVER;
	}
	pval->offset += offset * pval->arraymul;
}


static inline APTR CheckArray( PVal *pval, int ar )
{
	//		Check PVal Array information
	//		(�z��v�f(int)�̎��o��)
	//
	int chk,i;
	int val;
	PVal temp;
	arrayobj_flag = 0;
	HspVarCoreReset( pval );							// �z��|�C���^�����Z�b�g����
	if ( ar == 0 ) return 0;

	if ( pval->support & HSPVAR_SUPPORT_MISCTYPE ) {	// �A�z�z��̏ꍇ
		return 0;
	}

	for(i=0;i<ar;i++) {
		HspVarCoreCopyArrayInfo( &temp, pval );			// ��Ԃ�ۑ�
		chk = code_get();
		if ( chk<=PARAM_END ) { throw HSPERR_BAD_ARRAY_EXPRESSION; }
		if ( mpval->flag != HSPVAR_FLAG_INT ) { throw HSPERR_TYPE_MISMATCH; }
		HspVarCoreCopyArrayInfo( pval, &temp );			// ��Ԃ𕜋A
		val = *(int *)(mpval->pt);
		HspVarCoreArray2( pval, val );					// �z��v�f�w��(����)
	}
	return HspVarCoreGetAPTR( pval );
}


/*------------------------------------------------------------*/

void VarUtilInit( void )
{
	//		HSPVAR utility�̏�����
	//
	hspctx = code_getctx();
	mem_var = hspctx->mem_var;
	exinfo = hspctx->exinfo2;
	c_type = exinfo->nptype;
	c_val = exinfo->npval;

	//		typeinfo���擾���Ă���
	intcmd_info = code_gettypeinfo( TYPE_INTCMD );
	extcmd_info = code_gettypeinfo( TYPE_EXTCMD );
	extsysvar_info = code_gettypeinfo( TYPE_EXTSYSVAR );
	intfunc_info = code_gettypeinfo( TYPE_INTFUNC );
	sysvar_info = code_gettypeinfo( TYPE_SYSVAR );
	progfunc_info = code_gettypeinfo( TYPE_PROGCMD );
	modfunc_info = code_gettypeinfo( TYPE_MODCMD );
	dllfunc_info = code_gettypeinfo( TYPE_DLLFUNC );
	dllctrl_info = code_gettypeinfo( TYPE_DLLCTRL );

	//		���s�p�֐��𒊏o
	intcmd_func = intcmd_info->cmdfunc;
	extcmd_func = extcmd_info->cmdfunc;
	progcmd_func = progfunc_info->cmdfunc;
	modcmd_func = modfunc_info->cmdfunc;
	dllcmd_func = dllfunc_info->cmdfunc;
	dllctl_func = dllctrl_info->cmdfunc;

	//		�ŏ��̃^�X�N���s�֐����Z�b�g
	curtask = (CHSP3_TASK)__HspEntry;
	lasttask = -1;

	//		�㗝�ϐ���������(�p�����[�^�[�n���p)
	var_proxy.offset = 0;
}


void VarUtilTerm( void )
{
	//		HSPVAR utility�̏I������
	//
}


/*------------------------------------------------------------*/
/*
		stack operation
*/
/*------------------------------------------------------------*/

#if 0
void PushInt( int val )
{
	StackPushi( val );
}

void PushDouble( double val )
{
	//StackPush( HSPVAR_FLAG_DOUBLE, (char *)&val, sizeof(double) );
	StackPushd( val );
}

void PushLabel( int val )
{
	//StackPush( HSPVAR_FLAG_LABEL, (char *)&val, sizeof(int)  );
	StackPushl( val );
}
#endif


void PushStr( char *st )
{
	StackPushStr( st );
}


void PushVar( PVal *pval, int aval )
{
	//	�ϐ��̒l��push����
	int basesize;
	APTR aptr;
	PDAT *ptr;

	aptr = CheckArray( pval, aval );

	tflag = pval->flag;
	if ( tflag == HSPVAR_FLAG_INT ) {
		ptr = (PDAT *)(( (int *)(pval->pt))+ aptr );		// ���O�Ōv�Z
		StackPushi( *(int *)ptr );
		return;
	}
	if ( tflag == HSPVAR_FLAG_DOUBLE ) {
		ptr = (PDAT *)(( (double *)(pval->pt))+ aptr );		// ���O�Ōv�Z
		StackPushd( *(double *)ptr );
		return;
	}

	ptr = HspVarCorePtrAPTR( pval, aptr );
	varproc = HspVarCoreGetProc( tflag );
	basesize = varproc->basesize;
	if ( basesize < 0 ) { basesize = varproc->GetSize( ptr ); }
	StackPush( tflag, (char *)ptr, basesize );
}


void PushVAP( PVal *pval, int aval )
{
	//	�ϐ����̂��̂̃|�C���^��push����
	APTR aptr;
	//PDAT *ptr;
	aptr = CheckArray( pval, aval );
	//ptr = HspVarCorePtrAPTR( pval, aptr );
	StackPushTypeVal( HSPVAR_FLAG_VAR, (int)pval, (int)aptr );
}


void PushVarFromVAP( PVal *pval, int aval )
{
	//	PushVAP����Ă���ϐ��̒l��push����
	int basesize;
	APTR aptr;
	PDAT *ptr;

	aptr = (APTR)aval;

	tflag = pval->flag;
	if ( tflag == HSPVAR_FLAG_INT ) {
		ptr = (PDAT *)(( (int *)(pval->pt))+ aptr );		// ���O�Ōv�Z
		StackPushi( *(int *)ptr );
		return;
	}
	if ( tflag == HSPVAR_FLAG_DOUBLE ) {
		ptr = (PDAT *)(( (double *)(pval->pt))+ aptr );		// ���O�Ōv�Z
		StackPushd( *(double *)ptr );
		return;
	}

	ptr = HspVarCorePtrAPTR( pval, aptr );
	varproc = HspVarCoreGetProc( tflag );
	basesize = varproc->basesize;
	if ( basesize < 0 ) { basesize = varproc->GetSize( ptr ); }
	StackPush( tflag, (char *)ptr, basesize );
}


void PushDefault( void )
{
	StackPushTypeVal( HSPVAR_FLAG_DEFAULT, (int)'?', 0 );
}


void PushFuncEnd( void )
{
	StackPushTypeVal( HSPVAR_FLAG_MARK, (int)')', 0 );
}


void PushExtvar( int val, int pnum )
{
	char *ptr;
	int resflag;
	int basesize;

	*c_type = TYPE_MARK;
	*c_val = '(';
	ptr = (char *)extsysvar_info->reffunc( &resflag, val );						// �^�C�v���Ƃ̊֐��U�蕪��
	StackPop();																// PushFuncEnd����菜��
	//code_next();
	if ( resflag == HSPVAR_FLAG_INT ) {
		StackPushi( *(int *)ptr );
	} else {
		basesize = HspVarCoreGetProc( resflag )->GetSize( (PDAT *)ptr );
		StackPush( resflag, ptr, basesize );
	}
}


void PushIntfunc( int val, int pnum )
{
	char *ptr;
	int resflag;
	int basesize;

	*c_type = TYPE_MARK;
	*c_val = '(';
	ptr = (char *)intfunc_info->reffunc( &resflag, val );						// �^�C�v���Ƃ̊֐��U�蕪��
	StackPop();																	// PushFuncEnd����菜��
	//code_next();
	if ( resflag == HSPVAR_FLAG_INT ) {
		StackPushi( *(int *)ptr );
	} else {
		basesize = HspVarCoreGetProc( resflag )->GetSize( (PDAT *)ptr );
		StackPush( resflag, ptr, basesize );
	}
}


void PushSysvar( int val, int pnum )
{
	char *ptr;
	int resflag;
	int basesize;

	*c_type = TYPE_MARK;
	*c_val = '(';
	ptr = (char *)sysvar_info->reffunc( &resflag, val );						// �^�C�v���Ƃ̊֐��U�蕪��
	//StackPop();																// PushFuncEnd����菜��
	//code_next();
	if ( resflag == HSPVAR_FLAG_INT ) {
		StackPushi( *(int *)ptr );
	} else {
		basesize = HspVarCoreGetProc( resflag )->GetSize( (PDAT *)ptr );
		StackPush( resflag, ptr, basesize );
	}
}


void PushModcmd( int val, int pnum )
{
	char *ptr;
	int resflag;
	int basesize;

	*c_type = TYPE_MARK;
	*c_val = '(';
	prmstacks = pnum;
	ptr = (char *)modfunc_info->reffunc( &resflag, val );						// �^�C�v���Ƃ̊֐��U�蕪��
	if ( pnum > 1 )//FIXME
	StackPop();																	// PushFuncEnd����菜��
	//code_next();
	if ( resflag == HSPVAR_FLAG_INT ) {
		StackPushi( *(int *)ptr );
	} else {
		basesize = HspVarCoreGetProc( resflag )->GetSize( (PDAT *)ptr );
		StackPush( resflag, ptr, basesize );
	}
}


void PushDllfunc( int val, int pnum )
{
	char *ptr;
	int resflag;
	int basesize;

	*c_type = TYPE_MARK;
	*c_val = '(';
	prmstacks = pnum;
	ptr = (char *)dllfunc_info->reffunc( &resflag, val );						// �^�C�v���Ƃ̊֐��U�蕪��
	StackPop();																	// PushFuncEnd����菜��
	//code_next();
	if ( resflag == HSPVAR_FLAG_INT ) {
		StackPushi( *(int *)ptr );
	} else {
		basesize = HspVarCoreGetProc( resflag )->GetSize( (PDAT *)ptr );
		StackPush( resflag, ptr, basesize );
	}
}


void PushDllctrl( int val, int pnum )
{
	char *ptr;
	int resflag;
	int basesize;

	*c_type = TYPE_MARK;
	*c_val = '(';
	prmstacks = pnum;
	ptr = (char *)dllctrl_info->reffunc( &resflag, val );						// �^�C�v���Ƃ̊֐��U�蕪��
	StackPop();																	// PushFuncEnd����菜��
	//code_next();
	if ( resflag == HSPVAR_FLAG_INT ) {
		StackPushi( *(int *)ptr );
	} else {
		basesize = HspVarCoreGetProc( resflag )->GetSize( (PDAT *)ptr );
		StackPush( resflag, ptr, basesize );
	}
}


void PushVarOffset( PVal *pval )
{
	//	�ϐ���offset�l��push����
	//
	StackPushi( pval->offset );
}


void CalcAddI( void )
{
	char *ptr;
	ptr = PrepareCalc();
	if ( ptr == NULL ) {									// �������̂���
		stm1->ival += stm2->ival;
		StackDecLevel;
		return;
	}
	varproc->AddI( (PDAT *)mpval->pt, ptr );
	AfterCalc();
}


void CalcSubI( void )
{
	char *ptr;
	ptr = PrepareCalc();
	if ( ptr == NULL ) {									// �������̂���
		stm1->ival -= stm2->ival;
		StackDecLevel;
		return;
	}
	varproc->SubI( (PDAT *)mpval->pt, ptr );
	AfterCalc();
}


void CalcMulI( void )
{
	char *ptr;
	ptr = PrepareCalc();
	if ( ptr == NULL ) {									// �������̂���
		stm1->ival *= stm2->ival;
		StackDecLevel;
		return;
	}
	varproc->MulI( (PDAT *)mpval->pt, ptr );
	AfterCalc();
}


void CalcDivI( void )
{
	char *ptr;
	ptr = PrepareCalc();
	if ( ptr == NULL ) {									// �������̂���
		if ( stm2->ival == 0 ) throw( HSPVAR_ERROR_DIVZERO );
		stm1->ival /= stm2->ival;
		StackDecLevel;
		return;
	}
	varproc->DivI( (PDAT *)mpval->pt, ptr );
	AfterCalc();
}


void CalcModI( void )
{
	char *ptr;
	ptr = PrepareCalc();
	if ( ptr == NULL ) {									// �������̂���
		if ( stm2->ival == 0 ) throw( HSPVAR_ERROR_DIVZERO );
		stm1->ival %= stm2->ival;
		StackDecLevel;
		return;
	}
	varproc->ModI( (PDAT *)mpval->pt, ptr );
	AfterCalc();
}


void CalcAndI( void )
{
	char *ptr;
	ptr = PrepareCalc();
	if ( ptr == NULL ) {									// �������̂���
		stm1->ival &= stm2->ival;
		StackDecLevel;
		return;
	}
	varproc->AndI( (PDAT *)mpval->pt, ptr );
	AfterCalc();
}


void CalcOrI( void )
{
	char *ptr;
	ptr = PrepareCalc();
	if ( ptr == NULL ) {									// �������̂���
		stm1->ival |= stm2->ival;
		StackDecLevel;
		return;
	}
	varproc->OrI( (PDAT *)mpval->pt, ptr );
	AfterCalc();
}


void CalcXorI( void )
{
	char *ptr;
	ptr = PrepareCalc();
	if ( ptr == NULL ) {									// �������̂���
		stm1->ival ^= stm2->ival;
		StackDecLevel;
		return;
	}
	varproc->XorI( (PDAT *)mpval->pt, ptr );
	AfterCalc();
}


void CalcEqI( void )
{
	char *ptr;
	ptr = PrepareCalc();
	if ( ptr == NULL ) {									// �������̂���
		stm1->ival = ( stm1->ival == stm2->ival );
		StackDecLevel;
		return;
	}
	varproc->EqI( (PDAT *)mpval->pt, ptr );
	AfterCalc();
}


void CalcNeI( void )
{
	char *ptr;
	ptr = PrepareCalc();
	if ( ptr == NULL ) {									// �������̂���
		stm1->ival = ( stm1->ival != stm2->ival );
		StackDecLevel;
		return;
	}
	varproc->NeI( (PDAT *)mpval->pt, ptr );
	AfterCalc();
}


void CalcGtI( void )
{
	char *ptr;
	ptr = PrepareCalc();
	if ( ptr == NULL ) {									// �������̂���
		stm1->ival = ( stm1->ival > stm2->ival );
		StackDecLevel;
		return;
	}
	varproc->GtI( (PDAT *)mpval->pt, ptr );
	AfterCalc();
}


void CalcLtI( void )
{
	char *ptr;
	ptr = PrepareCalc();
	if ( ptr == NULL ) {									// �������̂���
		stm1->ival = ( stm1->ival < stm2->ival );
		StackDecLevel;
		return;
	}
	varproc->LtI( (PDAT *)mpval->pt, ptr );
	AfterCalc();
}


void CalcGtEqI( void )
{
	char *ptr;
	ptr = PrepareCalc();
	if ( ptr == NULL ) {									// �������̂���
		stm1->ival = ( stm1->ival >= stm2->ival );
		StackDecLevel;
		return;
	}
	varproc->GtEqI( (PDAT *)mpval->pt, ptr );
	AfterCalc();
}


void CalcLtEqI( void )
{
	char *ptr;
	ptr = PrepareCalc();
	if ( ptr == NULL ) {									// �������̂���
		stm1->ival = ( stm1->ival <= stm2->ival );
		StackDecLevel;
		return;
	}
	varproc->LtEqI( (PDAT *)mpval->pt, ptr );
	AfterCalc();
}


void CalcRrI( void )
{
	char *ptr;
	ptr = PrepareCalc();
	if ( ptr == NULL ) {									// �������̂���
		stm1->ival >>= stm2->ival;
		StackDecLevel;
		return;
	}
	varproc->RrI( (PDAT *)mpval->pt, ptr );
	AfterCalc();
}


void CalcLrI( void )
{
	char *ptr;
	ptr = PrepareCalc();
	if ( ptr == NULL ) {									// �������̂���
		stm1->ival <<= stm2->ival;
		StackDecLevel;
		return;
	}
	varproc->LrI( (PDAT *)mpval->pt, ptr );
	AfterCalc();
}



void VarSet( PVal *m_pval, int aval )
{
	//	�ϐ����(var=???)
	//		aval=�z��v�f�̃X�^�b�N��
	//
	int chk;
	PVal *pval;
	HspVarProc *proc;
	APTR aptr;
	void *ptr;
	PDAT *dst;
	//int pleft;
	//int baseaptr;
	int tflag;

	if ( m_pval == &var_proxy ) {
		STMDATA *stm = (STMDATA *)m_pval->master;
		pval = (PVal *)( stm->ival );
		aptr = *(int *)stm->itemp;
		if ( aval != 0 ) throw HSPERR_SYNTAX;
	} else {
		pval = m_pval;
		aptr = CheckArray( pval, aval );
	}
	dst = HspVarCorePtrAPTR( pval, aptr );
	tflag = pval->flag;

	chk = code_get();									// �p�����[�^�[�l���擾
	if ( chk != PARAM_OK ) { throw HSPERR_SYNTAX; }

	ptr = mpval->pt;

	if ( tflag != mpval->flag ) {

		proc = HspVarCoreGetProc( tflag );
		if ( pval->support & HSPVAR_SUPPORT_NOCONVERT ) {	// �^�ϊ��Ȃ��̏ꍇ
			if ( arrayobj_flag ) {
				proc->ObjectWrite( pval, ptr, mpval->flag );
				return;
			}
		}
		if ( aptr != 0 ) throw HSPERR_INVALID_ARRAYSTORE;	// �^�ύX�̏ꍇ�͔z��v�f0�̂�
		HspVarCoreClear( pval, mpval->flag );		// �ŏ��T�C�Y�̃��������m��
		proc = HspVarCoreGetProc( pval->flag );
		dst = proc->GetPtr( pval );					// PDAT�|�C���^���擾

	} else {
		if ( tflag == HSPVAR_FLAG_INT ) {
			*(int *)dst = *(int *)ptr;
			return;
		}
		proc = HspVarCoreGetProc( tflag );
	}
	proc->Set( pval, dst, ptr );
}


void VarSet( PVal *m_pval, int aval, int pnum )
{
	//	�ϐ����(var=???)
	//		aval=�z��v�f�̃X�^�b�N��
	//		pnum=�p�����[�^�[�̃X�^�b�N��
	//
	int chk;
	HspVarProc *proc;
	APTR aptr;
	void *ptr;
	PDAT *dst;
	int pleft;
	int baseaptr;
	PVal *pval;

	if ( m_pval == &var_proxy ) {
		STMDATA *stm = (STMDATA *)m_pval->master;
		pval = (PVal *)( stm->ival );
		aptr = *(int *)stm->itemp;
		if ( aval != 0 ) throw HSPERR_SYNTAX;
	} else {
		pval = m_pval;
		aptr = CheckArray( pval, aval );
	}
	dst = HspVarCorePtrAPTR( pval, aptr );
	proc = HspVarCoreGetProc( pval->flag );

	chk = code_get();									// �p�����[�^�[�l���擾
	if ( chk != PARAM_OK ) { throw HSPERR_SYNTAX; }

	ptr = mpval->pt;
	if ( pval->flag != mpval->flag ) {

		if ( pval->support & HSPVAR_SUPPORT_NOCONVERT ) {	// �^�ϊ��Ȃ��̏ꍇ
			if ( arrayobj_flag ) {
				proc->ObjectWrite( pval, ptr, mpval->flag );
				return;
			}
		}
		if ( aptr != 0 ) throw HSPERR_INVALID_ARRAYSTORE;	// �^�ύX�̏ꍇ�͔z��v�f0�̂�
		HspVarCoreClear( pval, mpval->flag );		// �ŏ��T�C�Y�̃��������m��
		proc = HspVarCoreGetProc( pval->flag );
		dst = proc->GetPtr( pval );					// PDAT�|�C���^���擾
	}
	proc->Set( pval, dst, ptr );

	if ( pnum < 2 ) return;

	//	�����p�����[�^�[������ꍇ
	//
	pleft = pnum - 1;
	chk = pval->len[1];
	if ( chk == 0 ) baseaptr = aptr; else baseaptr = aptr % chk;
	aptr -= baseaptr;

	while(1) {
		if ( pleft == 0 ) break;

		chk = code_get();							// �p�����[�^�[�l���擾
		if ( chk != PARAM_OK ) { throw HSPERR_SYNTAX; }
		if ( pval->flag != mpval->flag ) {
				throw HSPERR_INVALID_ARRAYSTORE;	// �^�ύX�͂ł��Ȃ�
		}
		ptr = mpval->pt;
		baseaptr++;

		pval->arraycnt = 0;							// �z��w��J�E���^�����Z�b�g
		pval->offset = aptr;
		code_arrayint2( pval, baseaptr );			// �z��`�F�b�N

		dst = HspVarCorePtr( pval );
		proc->Set( pval, dst, ptr );				// ���̔z��ɂ���������
		pleft--;
	}
}


void VarSet2( PVal *pval )
{
	//	�ϐ����(�A������p)(var=???)
	//
	int chk;
	HspVarProc *proc;
	//APTR aptr;
	void *ptr;
	PDAT *dst;
	int baseaptr;
	STMDATA *stm;
	int *iptr;
	int tflag;

	proc = HspVarCoreGetProc( pval->flag );

	chk = code_get();							// �p�����[�^�[�l���擾
	if ( chk != PARAM_OK ) { throw HSPERR_SYNTAX; }
	if ( pval->flag != mpval->flag ) {
			throw HSPERR_INVALID_ARRAYSTORE;	// �^�ύX�͂ł��Ȃ�
	}
	ptr = mpval->pt;

	stm = StackPeek;
	tflag = stm->type;
	if ( tflag != HSPVAR_FLAG_INT ) { throw HSPERR_SYNTAX; }
	iptr = (int *)STM_GETPTR(stm);
	baseaptr = *iptr;							// PushVarOffset�ł��炩���ߓ���Ă���offset�l
	StackDecLevel;
	code_next();

	baseaptr++;

	pval->arraycnt = 0;							// �z��w��J�E���^�����Z�b�g
	pval->offset = 0;
	code_arrayint2( pval, baseaptr );			// �z��`�F�b�N

	dst = HspVarCorePtr( pval );
	proc->Set( pval, dst, ptr );				// ���̔z��ɂ���������
}


void VarInc( PVal *m_pval, int aval )
{
	//	�ϐ��C���N�������g(var++)
	//
	HspVarProc *proc;
	APTR aptr;
	int incval;
	void *ptr;
	PDAT *dst;
	PVal *pval;

	if ( m_pval == &var_proxy ) {
		STMDATA *stm = (STMDATA *)m_pval->master;
		pval = (PVal *)( stm->ival );
		aptr = *(int *)stm->itemp;
		if ( aval != 0 ) throw HSPERR_SYNTAX;
	} else {
		pval = m_pval;
		aptr = CheckArray( pval, aval );
	}
	proc = HspVarCoreGetProc( pval->flag );

	incval = 1;
	if ( pval->flag == HSPVAR_FLAG_INT ) { ptr = &incval; } else {
		ptr = (int *)proc->Cnv( &incval, HSPVAR_FLAG_INT );	// �^��INT�łȂ��ꍇ�͕ϊ�
	}
	dst = HspVarCorePtrAPTR( pval, aptr );
	proc->AddI( dst, ptr );
}


void VarDec( PVal *m_pval, int aval )
{
	//	�ϐ��f�N�������g(var--)
	//
	HspVarProc *proc;
	APTR aptr;
	int incval;
	void *ptr;
	PDAT *dst;
	PVal *pval;

	if ( m_pval == &var_proxy ) {
		STMDATA *stm = (STMDATA *)m_pval->master;
		pval = (PVal *)( stm->ival );
		aptr = *(int *)stm->itemp;
		if ( aval != 0 ) throw HSPERR_SYNTAX;
	} else {
		pval = m_pval;
		aptr = CheckArray( pval, aval );
	}
	proc = HspVarCoreGetProc( pval->flag );

	incval = 1;
	if ( pval->flag == HSPVAR_FLAG_INT ) { ptr = &incval; } else {
		ptr = (int *)proc->Cnv( &incval, HSPVAR_FLAG_INT );	// �^��INT�łȂ��ꍇ�͕ϊ�
	}
	dst = HspVarCorePtrAPTR( pval, aptr );
	proc->SubI( dst, ptr );
}


static inline int calcprmf( int mval, int exp, int p )
{
	//		Caluculate parameter args (int)
	//
	switch(exp) {
	case CALCCODE_ADD:
		return mval + p;
	case CALCCODE_SUB:
		return mval - p;
	case CALCCODE_MUL:
		return mval * p;
	case CALCCODE_DIV:
		if ( p == 0 ) throw( HSPVAR_ERROR_DIVZERO );
		return mval / p;
	case CALCCODE_MOD:						// '%'
		if ( p == 0 ) throw( HSPVAR_ERROR_DIVZERO );
		return mval % p;

	case CALCCODE_AND:
		return mval & p;
		break;
	case CALCCODE_OR:
		return mval | p;
	case CALCCODE_XOR:
		return mval ^ p;

	case CALCCODE_EQ:
		return (mval==p);
	case CALCCODE_NE:
		return (mval!=p);
	case CALCCODE_GT:
		return (mval>p);
	case CALCCODE_LT:
		return (mval<p);
	case CALCCODE_GTEQ:						// '>='
		return (mval>=p);
	case CALCCODE_LTEQ:						// '<='
		return (mval<=p);

	case CALCCODE_RR:						// '>>'
		return mval >> p;
	case CALCCODE_LR:						// '<<'
		return mval << p;

	case '(':
		throw HSPERR_INVALID_ARRAY;
	default:
		throw HSPVAR_ERROR_INVALID;
	}
}


void VarCalc( PVal *m_pval, int aval, int op )
{
	//	�ϐ����Z���(var*=???��)
	//		aval=�z��v�f�̃X�^�b�N��
	//		op=���Z�q�R�[�h
	//
	int chk;
	HspVarProc *proc;
	APTR aptr;
	void *ptr;
	PDAT *dst;
	int *iptr;
	PVal *pval;

	if ( m_pval == &var_proxy ) {
		STMDATA *stm = (STMDATA *)m_pval->master;
		pval = (PVal *)( stm->ival );
		aptr = *(int *)stm->itemp;
		if ( aval != 0 ) throw HSPERR_SYNTAX;
	} else {
		pval = m_pval;
		aptr = CheckArray( pval, aval );
	}

	proc = HspVarCoreGetProc( pval->flag );
	dst = HspVarCorePtrAPTR( pval, aptr );

	chk = code_get();									// �p�����[�^�[�l���擾
	if ( chk != PARAM_OK ) { throw HSPERR_SYNTAX; }

	ptr = mpval->pt;
	if ( pval->flag != mpval->flag ) {					// �^����v���Ȃ��ꍇ�͕ϊ�
		ptr = HspVarCoreCnvPtr( mpval, pval->flag );
	}
	if ( pval->flag == HSPVAR_FLAG_INT ) {
		iptr = (int *)dst;
		*iptr = calcprmf( *iptr, op, *(int *)ptr );
		return;
	}

	switch(op) {
	case CALCCODE_ADD:
		proc->AddI( dst, ptr );
		break;
	case CALCCODE_SUB:
		proc->SubI( dst, ptr );
		break;
	case CALCCODE_MUL:
		proc->MulI( dst, ptr );
		break;
	case CALCCODE_DIV:
		proc->DivI( dst, ptr );
		break;
	case CALCCODE_MOD:						// '%'
		proc->ModI( dst, ptr );
		break;

	case CALCCODE_AND:
		proc->AndI( dst, ptr );
		break;
	case CALCCODE_OR:
		proc->OrI( dst, ptr );
		break;
	case CALCCODE_XOR:
		proc->XorI( dst, ptr );
		break;

	case CALCCODE_EQ:
		proc->EqI( dst, ptr );
		break;
	case CALCCODE_NE:
		proc->NeI( dst, ptr );
		break;
	case CALCCODE_GT:
		proc->GtI( dst, ptr );
		break;
	case CALCCODE_LT:
		proc->LtI( dst, ptr );
		break;
	case CALCCODE_GTEQ:						// '>='
		proc->GtEqI( dst, ptr );
		break;
	case CALCCODE_LTEQ:						// '<='
		proc->LtEqI( dst, ptr );
		break;

	case CALCCODE_RR:						// '>>'
		proc->RrI( dst, ptr );
		break;
	case CALCCODE_LR:						// '<<'
		proc->LrI( dst, ptr );
		break;
	case '(':
		throw HSPERR_INVALID_ARRAY;
	default:
		throw HSPVAR_ERROR_INVALID;
	}

	if ( proc->aftertype != pval->flag ) {				// ���Z��Ɍ^���ς��ꍇ
		throw HSPERR_TYPE_MISMATCH;
	}
}


void PushFuncPrm1( int num )
{
	//		����(num)���X�^�b�N��push����
	//
	STMDATA *stm;
	int tflag, basesize;
	char *ptr;
	//HspVarProc *proc;

	stm = (STMDATA *)hspctx->prmstack;
	if ( stm == NULL ) throw HSPERR_INVALID_FUNCPARAM;
	if ( num >= hspctx->prmstack_max ) throw HSPERR_INVALID_FUNCPARAM;
	stm -= num;

	tflag = stm->type;
	if ( tflag == HSPVAR_FLAG_VAR ) {
		PushVarFromVAP( (PVal *)( stm->ival ), *(int *)stm->itemp );
		//PushVAP( (PVal *)( stm->ival ), *(int *)stm->itemp );
		return;
	}

	ptr = stm->ptr;
	varproc = HspVarCoreGetProc( tflag );
	basesize = varproc->basesize;
	if ( basesize < 0 ) { basesize = varproc->GetSize( (PDAT *)ptr ); }
	StackPush( tflag, ptr, basesize );
}


void PushFuncPrmI( int num )
{
	//		����(num)���X�^�b�N��push����(int)
	//
	STMDATA *stm;
	int tflag;
	int i_val;
	int *ptr;
	PVal *pval;

	stm = (STMDATA *)hspctx->prmstack;
	if ( stm == NULL ) throw HSPERR_INVALID_FUNCPARAM;
	if ( num >= hspctx->prmstack_max ) {
		StackPushi( 0 ); return;
	}
	stm -= num;

	tflag = stm->type;
	if ( tflag == HSPVAR_FLAG_VAR ) {
		pval = (PVal *)( stm->ival );
		tflag = pval->flag;
		ptr = (int *)HspVarCorePtrAPTR( pval, *(int *)stm->itemp );
	} else {
		ptr = (int *)stm->ptr;
	}

	if ( tflag != TYPE_INUM ) {
		if ( tflag != TYPE_DNUM ) throw HSPERR_TYPE_MISMATCH;
		i_val = (int)*(double *)ptr;
		ptr = &i_val;
	}
	StackPushi( *ptr );
}


void PushFuncPrmD( int num )
{
	//		����(num)���X�^�b�N��push����(double)
	//
	STMDATA *stm;
	int tflag;
	double d_val;
	double *ptr;
	PVal *pval;

	stm = (STMDATA *)hspctx->prmstack;
	if ( stm == NULL ) throw HSPERR_INVALID_FUNCPARAM;
	if ( num >= hspctx->prmstack_max ) {
		d_val = 0.0;
		StackPush( TYPE_DNUM, (char *)&d_val, sizeof(double) );
		return;
	}
	stm -= num;

	tflag = stm->type;
	if ( tflag == HSPVAR_FLAG_VAR ) {
		pval = (PVal *)( stm->ival );
		tflag = pval->flag;
		ptr = (double *)HspVarCorePtrAPTR( pval, *(int *)stm->itemp );
	} else {
		ptr = (double *)stm->ptr;
	}

	if ( tflag != TYPE_DNUM ) {
		if ( tflag != TYPE_INUM ) throw HSPERR_TYPE_MISMATCH;
		d_val = (double)*(int *)ptr;
		ptr = &d_val;
	}
	StackPush( TYPE_DNUM, (char *)ptr, sizeof(double) );
}


void PushFuncPrm( int num, int aval )
{
	//		���[�J���ϐ��̈���(num)���X�^�b�N��push����
	//		(PushVar����)
	STMDATA *stm;
	int tflag;
	PVal *pval;
	int basesize;
	APTR aptr;
	PDAT *ptr;

	stm = (STMDATA *)hspctx->prmstack;
	if ( stm == NULL ) throw HSPERR_INVALID_FUNCPARAM;
	if ( num >= hspctx->prmstack_max ) throw HSPERR_INVALID_FUNCPARAM;
	stm -= num;
	tflag = stm->type;

	switch( tflag ) {
	case TYPE_EX_LOCAL_VARS:
		pval = (PVal *)( stm->ptr );
		break;
	case HSPVAR_FLAG_VAR:
		pval = (PVal *)( stm->ival );
		break;
	default:
		throw HSPVAR_ERROR_INVALID;
	}
	aptr = CheckArray( pval, aval );
	ptr = HspVarCorePtrAPTR( pval, aptr );

	tflag = pval->flag;
	if ( tflag == HSPVAR_FLAG_INT ) {
		StackPushi( *(int *)ptr );
		return;
	}

	varproc = HspVarCoreGetProc( tflag );
	basesize = varproc->basesize;
	if ( basesize < 0 ) { basesize = varproc->GetSize( ptr ); }
	StackPush( tflag, (char *)ptr, basesize );
}


void PushFuncPAP( int num, int aval )
{
	//		���[�J���ϐ��̈���(num)���X�^�b�N��push����
	//		(PushVAP����)
	STMDATA *stm;
	int tflag;
	PVal *pval;
	APTR aptr;

	stm = (STMDATA *)hspctx->prmstack;
	if ( stm == NULL ) throw HSPERR_INVALID_FUNCPARAM;
	if ( num >= hspctx->prmstack_max ) throw HSPERR_INVALID_FUNCPARAM;
	stm -= num;
	tflag = stm->type;

	switch( tflag ) {
	case TYPE_EX_LOCAL_VARS:
		pval = (PVal *)( stm->ptr );
		aptr = CheckArray( pval, aval );
		StackPushTypeVal( HSPVAR_FLAG_VAR, (int)pval, (int)aptr );
		break;
	case HSPVAR_FLAG_VAR:
		pval = (PVal *)( stm->ival );
		aptr = CheckArray( pval, aval );
		StackPushTypeVal( HSPVAR_FLAG_VAR, (int)pval, (int)aptr );
		break;
	default:
		throw HSPVAR_ERROR_INVALID;
	}
}


PVal *FuncPrmVA( int num )
{
	//		�ϐ��̈���(num)�𓾂�(var�p)
	//
	STMDATA *stm;
	int tflag;
	//char *ptr;

	stm = (STMDATA *)hspctx->prmstack;
	if ( stm == NULL ) throw HSPERR_INVALID_FUNCPARAM;
	if ( num >= hspctx->prmstack_max ) throw HSPERR_INVALID_FUNCPARAM;
	stm -= num;

	tflag = stm->type;
	if ( tflag != HSPVAR_FLAG_VAR ) throw HSPVAR_ERROR_INVALID;

	//ptr = stm->itemp;

	var_proxy.master = stm;
	return &var_proxy;

	//return (PVal *)( stm->ival );
}


PVal *FuncPrm( int num )
{
	//		�ϐ��̈���(num)�𓾂�
	//
	STMDATA *stm;
	int tflag;
	//char *ptr;

	stm = (STMDATA *)hspctx->prmstack;
	if ( stm == NULL ) throw HSPERR_INVALID_FUNCPARAM;
	if ( num >= hspctx->prmstack_max ) throw HSPERR_INVALID_FUNCPARAM;
	stm -= num;

	tflag = stm->type;
	if ( tflag != HSPVAR_FLAG_VAR ) throw HSPVAR_ERROR_INVALID;

	//ptr = stm->itemp;
	return (PVal *)( stm->ival );
}


PVal *LocalPrm( int num )
{
	//		���[�J���ϐ��̈���(num)�𓾂�
	//
	STMDATA *stm;
	int tflag;

	stm = (STMDATA *)hspctx->prmstack;
	if ( stm == NULL ) throw HSPERR_INVALID_FUNCPARAM;
	if ( num >= hspctx->prmstack_max ) throw HSPERR_INVALID_FUNCPARAM;
	stm -= num;

	tflag = stm->type;
	if ( tflag != TYPE_EX_LOCAL_VARS ) throw HSPVAR_ERROR_INVALID;

	return (PVal *)( stm->ptr );
}


/*------------------------------------------------------------*/
/*
		Program Control Process
*/
/*------------------------------------------------------------*/


void TaskSwitch( int label )
{
	//		���̃^�X�N�֐����Z�b�g
	//		(label=�^�X�N�֐�ID)
	//
#if 0
	{
	//char ss[128];
	//sprintf( ss,"[%d]\n",label );
	//DebugMsg( ss );
	Alertf( "[%d]\n",label );
	}
#endif

	lasttask = label;
	curtask = __HspTaskFunc[label];
}

void TaskExec( void )
{
	//		�Z�b�g���ꂽ�^�X�N�֐������s����
	//
	curtask();
}


int GetTaskID( void )
{
	//		�^�X�N�֐�ID���擾
	//
	return lasttask;
}


/*------------------------------------------------------------*/
/*
		Normal HSP Process
*/
/*------------------------------------------------------------*/

void HspPostExec( void )
{
	//		�R�}���h���s��̏���
	//
#if 0
	if ( hspctx->runmode == RUNMODE_RETURN ) {
		//cmdfunc_return();
	} else {
		hspctx->msgfunc( hspctx );
	}
#endif
}

bool HspIf( void )
{
	//		�X�^�b�N����l�����o���Đ^�U��Ԃ�
	//		(�^�U���t�ɂȂ��Ă���̂Œ���)
	//
	int i;
	i = code_geti();
	return (i==0);
}


void Extcmd( int cmd, int pnum )
{
	//if ( extcmd_info->cmdfunc( cmd ) ) HspPostExec();
	if ( extcmd_func( cmd ) ) HspPostExec();
}


void Modcmd( int cmd, int pnum )
{
	//int i;
	//if ( modfunc_info->cmdfunc( cmd ) ) HspPostExec();
	//Alertf("CMD=%d (lev%d)", cmd, StackGetLevel );
	prmstacks = pnum;							// hsp3code�ɓn���p�����[�^�[��
	if ( modcmd_func( cmd ) ) HspPostExec();
}


void Dllfunc( int cmd, int pnum )
{
	if ( dllcmd_func( cmd ) ) HspPostExec();
}


void Dllctrl( int cmd, int pnum )
{
	if ( dllctl_func( cmd ) ) HspPostExec();
}


void Prgcmd( int cmd, int pnum )
{
	//if ( progfunc_info->cmdfunc( cmd ) ) HspPostExec();
	if ( progcmd_func( cmd ) ) HspPostExec();
}


void Intcmd( int cmd, int pnum )
{
	//if ( intcmd_info->cmdfunc( cmd ) ) HspPostExec();
	if ( intcmd_func( cmd ) ) HspPostExec();
}

/*------------------------------------------------------------*/
/*
		For Debug
*/
/*------------------------------------------------------------*/

void DebugStackPeek( void )
{
	STMDATA *stm;
	char s1[256];
	char dbg[4096];
	char *p;
	int i;
	i = 0;
	p = dbg; *p = 0;
	stm = mem_stm;
	while(1) {
		if ( stm >= stm_cur ) break;
		sprintf( s1, "STM#%d type:%d mode:%d ival:%d\r\n", i, stm->type, stm->mode, stm->ival );
		i++;
		strcpy( p, s1 );
		p+=strlen(s1);
		stm++;
	}
	//Alertf( "%s", dbg );
}

void DebugMsg( char *msg )
{
#ifdef HSPWIN
	OutputDebugString( msg );
	//Alertf( "%s", msg );
#else
	Alertf( "%s", msg );
#endif
}


/*------------------------------------------------------------*/
/*
		For JIT
*/
/*------------------------------------------------------------*/



static APTR CheckArrayIndex( PVal *pval, const int* index, size_t size )
{
	//		Check PVal Array information
	//		(�z��v�f(int)�̎��o��)
	//
	arrayobj_flag = 0;
	HspVarCoreReset( pval );							// �z��|�C���^�����Z�b�g����
	if ( pval->support & HSPVAR_SUPPORT_MISCTYPE ) {	// �A�z�z��̏ꍇ
		return 0;
	}

	for (auto i = 0; i < size; i++)
		HspVarCoreArray2( pval, index[i] );					// �z��v�f�w��(����)

	return HspVarCoreGetAPTR( pval );
}

void VarSetIndex1( PVal *pval, int i0 )
{
	//	�ϐ����(var=???)
	//		i0=�z��v�f�̃C���f�b�N�X
	//
	int chk;
	HspVarProc *proc;
	APTR aptr;
	void *ptr;
	PDAT *dst;
	int pleft;
	int baseaptr;

#if 0
	int index[] = { i0 };
	aptr = CheckArrayIndex( pval, index, 1 );
#else
	arrayobj_flag = 0;
	HspVarCoreReset(pval);							// �z��|�C���^�����Z�b�g����
	if (pval->support & HSPVAR_SUPPORT_MISCTYPE) {	// �A�z�z��̏ꍇ
		aptr = 0;
	}
	else {
		HspVarCoreArray2(pval, i0);
		aptr = HspVarCoreGetAPTR(pval);
	}
#endif
	proc = HspVarCoreGetProc( pval->flag );
	dst = HspVarCorePtrAPTR( pval, aptr );

	chk = code_get();									// �p�����[�^�[�l���擾
	if ( chk != PARAM_OK ) { throw HSPERR_SYNTAX; }

	ptr = mpval->pt;
	if ( pval->flag != mpval->flag ) {

		if ( pval->support & HSPVAR_SUPPORT_NOCONVERT ) {	// �^�ϊ��Ȃ��̏ꍇ
			if ( arrayobj_flag ) {
				proc->ObjectWrite( pval, ptr, mpval->flag );
				return;
			}
		}
		if ( aptr != 0 ) throw HSPERR_INVALID_ARRAYSTORE;	// �^�ύX�̏ꍇ�͔z��v�f0�̂�
		HspVarCoreClear( pval, mpval->flag );		// �ŏ��T�C�Y�̃��������m��
		proc = HspVarCoreGetProc( pval->flag );
		dst = proc->GetPtr( pval );					// PDAT�|�C���^���擾
	}
	proc->Set( pval, dst, ptr );
}

void VarSetIndex2( PVal *pval, int i0, int i1 )
{
	//	�ϐ����(var=???)
	//		i0=�z��v�f�̃C���f�b�N�X
	//
	int chk;
	HspVarProc *proc;
	APTR aptr;
	void *ptr;
	PDAT *dst;
	int pleft;
	int baseaptr;

#if 0
	int index[] = { i0, i1 };
	aptr = CheckArrayIndex( pval, index, 2 );
#else
	arrayobj_flag = 0;
	HspVarCoreReset(pval);							// �z��|�C���^�����Z�b�g����
	if (pval->support & HSPVAR_SUPPORT_MISCTYPE) {	// �A�z�z��̏ꍇ
		aptr = 0;
	}
	else {
		HspVarCoreArray2(pval, i0);
		HspVarCoreArray2(pval, i1);
		aptr = HspVarCoreGetAPTR(pval);
	}
#endif
	proc = HspVarCoreGetProc( pval->flag );
	dst = HspVarCorePtrAPTR( pval, aptr );

	chk = code_get();									// �p�����[�^�[�l���擾
	if ( chk != PARAM_OK ) { throw HSPERR_SYNTAX; }

	ptr = mpval->pt;
	if ( pval->flag != mpval->flag ) {

		if ( pval->support & HSPVAR_SUPPORT_NOCONVERT ) {	// �^�ϊ��Ȃ��̏ꍇ
			if ( arrayobj_flag ) {
				proc->ObjectWrite( pval, ptr, mpval->flag );
				return;
			}
		}
		if ( aptr != 0 ) throw HSPERR_INVALID_ARRAYSTORE;	// �^�ύX�̏ꍇ�͔z��v�f0�̂�
		HspVarCoreClear( pval, mpval->flag );		// �ŏ��T�C�Y�̃��������m��
		proc = HspVarCoreGetProc( pval->flag );
		dst = proc->GetPtr( pval );					// PDAT�|�C���^���擾
	}
	proc->Set( pval, dst, ptr );
}


void VarSetIndex1i( PVal *pval, int v, int i0 )
{
	//	�ϐ����(var=???)
	//		i0=�z��v�f�̃C���f�b�N�X
	//
	int chk;
	HspVarProc *proc;
	APTR aptr;
	void *ptr;
	int *dst;
	int pleft;
	int baseaptr;

	if ( pval->flag != HSPVAR_FLAG_INT ) {
		throw HSPERR_TYPE_MISMATCH;
	}

	if (llNoRangeCheck) {
		dst = (((int *)(pval->pt))+i0);
	} else {
		arrayobj_flag = 0;
		HspVarCoreReset(pval);							// �z��|�C���^�����Z�b�g����
		if (pval->support & HSPVAR_SUPPORT_MISCTYPE) {	// �A�z�z��̏ꍇ
			aptr = 0;
		}
		else {
			HspVarCoreArray2(pval, i0);
			aptr = HspVarCoreGetAPTR(pval);
		}

		dst = (int *)HspVarCorePtrAPTR(pval, aptr);
	}
	*dst = v;
}


void VarSetIndex1d( PVal *pval, double v, int i0 )
{
	//	�ϐ����(var=???)
	//		i0=�z��v�f�̃C���f�b�N�X
	//
	int chk;
	HspVarProc *proc;
	APTR aptr;
	void *ptr;
	double *dst;
	int pleft;
	int baseaptr;

	if ( pval->flag != HSPVAR_FLAG_DOUBLE ) {
		throw HSPERR_TYPE_MISMATCH;
	}

	if (llNoRangeCheck) {
		dst = (((double *)(pval->pt))+i0);
	} else {
		arrayobj_flag = 0;
		HspVarCoreReset(pval);							// �z��|�C���^�����Z�b�g����
		if (pval->support & HSPVAR_SUPPORT_MISCTYPE) {	// �A�z�z��̏ꍇ
			aptr = 0;
		}
		else {
			HspVarCoreArray2(pval, i0);
			aptr = HspVarCoreGetAPTR(pval);
		}

		dst = (double *)HspVarCorePtrAPTR(pval, aptr);
	}
	*dst = v;
}


void VarSetIndex2i( PVal *pval, int v, int i0, int i1 )
{
	//	�ϐ����(var=???)
	//		i0=�z��v�f�̃C���f�b�N�X
	//
	int chk;
	HspVarProc *proc;
	APTR aptr;
	void *ptr;
	PDAT *dst;
	int pleft;
	int baseaptr;

	arrayobj_flag = 0;
	HspVarCoreReset(pval);							// �z��|�C���^�����Z�b�g����
	if (pval->support & HSPVAR_SUPPORT_MISCTYPE) {	// �A�z�z��̏ꍇ
		aptr = 0;
	}
	else {
		HspVarCoreArray2(pval, i0);
		HspVarCoreArray2(pval, i1);
		aptr = HspVarCoreGetAPTR(pval);
	}

	if ( pval->flag != HSPVAR_FLAG_INT ) {
		throw HSPERR_TYPE_MISMATCH;
	}
	dst = HspVarCorePtrAPTR( pval, aptr );
	*(int *)dst = v;
}


void VarSetIndex2d( PVal *pval, double v, int i0, int i1 )
{
	//	�ϐ����(var=???)
	//		i0=�z��v�f�̃C���f�b�N�X
	//
	int chk;
	HspVarProc *proc;
	APTR aptr;
	void *ptr;
	PDAT *dst;
	int pleft;
	int baseaptr;

	arrayobj_flag = 0;
	HspVarCoreReset(pval);							// �z��|�C���^�����Z�b�g����
	if (pval->support & HSPVAR_SUPPORT_MISCTYPE) {	// �A�z�z��̏ꍇ
		aptr = 0;
	}
	else {
		HspVarCoreArray2(pval, i0);
		HspVarCoreArray2(pval, i1);
		aptr = HspVarCoreGetAPTR(pval);
	}

	if ( pval->flag != HSPVAR_FLAG_DOUBLE ) {
		throw HSPERR_TYPE_MISMATCH;
	}
	dst = HspVarCorePtrAPTR( pval, aptr );
	*(double *)dst = v;
}


double CallDoubleIntfunc( int val, int pnum )
{
	char *ptr;
	int resflag;
	int basesize;

	*c_type = TYPE_MARK;
	*c_val = '(';
	ptr = (char *)intfunc_info->reffunc( &resflag, val );						// �^�C�v���Ƃ̊֐��U�蕪��
	StackPop();																	// PushFuncEnd����菜��
	//code_next();
	basesize = HspVarCoreGetProc( resflag )->GetSize( (PDAT *)ptr );
	return *(double*)ptr;
}

int CallIntIntfunc( int val, int pnum )
{
	char *ptr;
	int resflag;
	int basesize;

	*c_type = TYPE_MARK;
	*c_val = '(';
	ptr = (char *)intfunc_info->reffunc( &resflag, val );						// �^�C�v���Ƃ̊֐��U�蕪��
	StackPop();																	// PushFuncEnd����菜��
	//code_next();
	basesize = HspVarCoreGetProc( resflag )->GetSize( (PDAT *)ptr );
	return *(int*)ptr;
}


int CallIntSysvar( int val, int pnum )
{
	char *ptr;
	int resflag;
	int basesize;

	*c_type = TYPE_MARK;
	*c_val = '(';
	ptr = (char *)sysvar_info->reffunc( &resflag, val );						// �^�C�v���Ƃ̊֐��U�蕪��
	//StackPop();																// PushFuncEnd����菜��
	//code_next();
	basesize = HspVarCoreGetProc( resflag )->GetSize( (PDAT *)ptr );
	return *(int*)ptr;
}

double CallDoubleSysvar( int val, int pnum )
{
	char *ptr;
	int resflag;
	int basesize;

	*c_type = TYPE_MARK;
	*c_val = '(';
	ptr = (char *)sysvar_info->reffunc( &resflag, val );						// �^�C�v���Ƃ̊֐��U�蕪��
	//StackPop();																	// PushFuncEnd����菜��
	//code_next();
	basesize = HspVarCoreGetProc( resflag )->GetSize( (PDAT *)ptr );
	return *(double*)ptr;
}

int FuncPrmI( int num )
{
	//		����(num)���X�^�b�N��push����(int)
	//
	STMDATA *stm;
	int tflag;
	int i_val;
	int *ptr;
	PVal *pval;

	stm = (STMDATA *)hspctx->prmstack;
	if ( stm == NULL ) throw HSPERR_INVALID_FUNCPARAM;
	if ( num >= hspctx->prmstack_max ) {
		return 0;
	}
	stm -= num;

	tflag = stm->type;
	if ( tflag == HSPVAR_FLAG_VAR ) {
		pval = (PVal *)( stm->ival );
		tflag = pval->flag;
		ptr = (int *)HspVarCorePtrAPTR( pval, *(int *)stm->itemp );
	} else {
		ptr = (int *)stm->ptr;
	}

	if ( tflag != TYPE_INUM ) {
		if ( tflag != TYPE_DNUM ) throw HSPERR_TYPE_MISMATCH;
		i_val = (int)*(double *)ptr;
		ptr = &i_val;
	}
	return *ptr;
}


double FuncPrmD( int num )
{
	//		����(num)���X�^�b�N��push����(double)
	//
	STMDATA *stm;
	int tflag;
	double d_val;
	double *ptr;
	PVal *pval;

	stm = (STMDATA *)hspctx->prmstack;
	if ( stm == NULL ) throw HSPERR_INVALID_FUNCPARAM;
	if ( num >= hspctx->prmstack_max ) {
		return 0.0;
	}
	stm -= num;

	tflag = stm->type;
	if ( tflag == HSPVAR_FLAG_VAR ) {
		pval = (PVal *)( stm->ival );
		tflag = pval->flag;
		ptr = (double *)HspVarCorePtrAPTR( pval, *(int *)stm->itemp );
	} else {
		ptr = (double *)stm->ptr;
	}

	if ( tflag != TYPE_DNUM ) {
		if ( tflag != TYPE_INUM ) throw HSPERR_TYPE_MISMATCH;
		d_val = (double)*(int *)ptr;
		ptr = &d_val;
	}
	return *ptr;
}


int GetOpTypeRet( int op, int tflagA, int tflagB )
{
	switch ( tflagA ) {
	case HSPVAR_FLAG_INT:
		{
			switch ( op ) {
			case CALCCODE_ADD:
			case CALCCODE_SUB:
			case CALCCODE_MUL:
			case CALCCODE_DIV:
			case CALCCODE_MOD:
				return HSPVAR_FLAG_INT;

			case CALCCODE_AND:
			case CALCCODE_OR:
			case CALCCODE_XOR:
				return HSPVAR_FLAG_INT;

			case CALCCODE_EQ:
			case CALCCODE_NE:
			case CALCCODE_GT:
			case CALCCODE_LT:
			case CALCCODE_GTEQ:
			case CALCCODE_LTEQ:
				return HSPVAR_FLAG_INT;

			case CALCCODE_RR:
			case CALCCODE_LR:
				return HSPVAR_FLAG_INT;

			default:
				throw 0;
			}
			break;
		}
	case HSPVAR_FLAG_DOUBLE:
		{
			switch ( op ) {
			case CALCCODE_ADD:
			case CALCCODE_SUB:
			case CALCCODE_MUL:
			case CALCCODE_DIV:
			case CALCCODE_MOD:
				return HSPVAR_FLAG_DOUBLE;

			case CALCCODE_AND:
			case CALCCODE_OR:
			case CALCCODE_XOR:
				return HSPVAR_FLAG_MAX;

			case CALCCODE_EQ:
			case CALCCODE_NE:
			case CALCCODE_GT:
			case CALCCODE_LT:
			case CALCCODE_GTEQ:
			case CALCCODE_LTEQ:
				return HSPVAR_FLAG_INT;

			case CALCCODE_RR:
			case CALCCODE_LR:
				return HSPVAR_FLAG_MAX;

			default:
				throw 0;
			}
			break;
		}
	}
	return HSPVAR_FLAG_MAX;
}

int GetFuncTypeRet( int type, int val, int pnum )
{
	switch ( type ) {
	case TYPE_INTFUNC:
		{
			switch( val >> 7 ) {
			case 2:
				return HSPVAR_FLAG_STR;
			case 3:
				return HSPVAR_FLAG_DOUBLE;
			default:
				return HSPVAR_FLAG_INT;
			}
			break;
		}
	case TYPE_SYSVAR:
		{
			switch( val ) {
			case 0x000:	// system
			case 0x001:	// hspstat
			case 0x002:	// hspver
			case 0x003:	// stat
			case 0x004:	// cnt
			case 0x005:	// err
			case 0x006:	// strsize
			case 0x007:	// looplev
			case 0x008:	// sublev
			case 0x009:	// iparam
			case 0x00a:	// wparam
			case 0x00b:	// lparam
				return HSPVAR_FLAG_INT;
			case 0x00c:	// refstr
				return HSPVAR_FLAG_STR;
			case 0x00d:	// refdval
				return HSPVAR_FLAG_DOUBLE;
			default:
				throw HSPERR_UNSUPPORTED_FUNCTION;
			}
			break;
		}
	}
	return HSPVAR_FLAG_MAX;
}

int PopInt( void )
{
	if ( IsStackEmpty ) return PARAM_END;

	STMDATA* stm = StackPeek;
	int tflag = stm->type;
	int val = stm->ival;
	auto proc = HspVarCoreGetProc(HSPVAR_FLAG_INT);
	char *ptr;

	if (tflag == HSPVAR_FLAG_VAR) {
		PVal *pval = (PVal *)(stm->ival);
		tflag = pval->flag;
		ptr = (char*)HspVarCorePtrAPTR(pval, *(int *)stm->itemp);
	} else {
		ptr = stm->ptr;
	}

	if ( tflag != HSPVAR_FLAG_INT ) {
		val = *(int *)proc->Cnv(ptr, tflag);
	}
	StackDecLevel;
	return val;
}

double PopDouble( void )
{
	if ( IsStackEmpty ) return PARAM_END;

	STMDATA* stm = StackPeek;
	int tflag = stm->type;
	double val;
	auto proc = HspVarCoreGetProc(HSPVAR_FLAG_DOUBLE);
	char *ptr;

	if (tflag == HSPVAR_FLAG_VAR) {
		PVal *pval = (PVal *)(stm->ival);
		tflag = pval->flag;
		ptr = (char*)HspVarCorePtrAPTR(pval, *(int *)stm->itemp);
	} else {
		ptr = stm->ptr;
	}

	if ( tflag == HSPVAR_FLAG_DOUBLE ) {
		val = *(double *)ptr;
	} else {
		val = *(double *)proc->Cnv( ptr, tflag );
	}
	StackDecLevel;
	return val;
}

bool IsFuncValueParam( int type, int val )
{
	switch ( type ) {
	case TYPE_INTFUNC:
		switch ( val ) {
		//	int function
		case 0x000:								// int
		case 0x001:								// rnd
		//case 0x002:								// strlen
		//case 0x003:								// length(3.0)
		//case 0x004:								// length2(3.0)
		//case 0x005:								// length3(3.0)
		//case 0x006:								// length4(3.0)
		//case 0x007:								// vartype(3.0)
		case 0x008:								// gettime
		//case 0x009:								// peek
		//case 0x00a:								// wpeek
		//case 0x00b:								// lpeek
		//case 0x00c:								// varptr
		//case 0x00d:								// varuse
		case 0x00e:								// noteinfo
		//case 0x00f:								// instr
		case 0x010:								// abs
		case 0x011:								// limit
		case 0x012:								// getease
		//case 0x013:								// notefind

		// str function
		case 0x100:								// str
		//case 0x101:								// strmid
		//case 0x103:								// strf
		//case 0x104:								// getpath
		//case 0x105:								// strtrim

		//	double function
		case 0x180:								// sin
		case 0x181:								// cos
		case 0x182:								// tan
		case 0x183:								// atan
		case 0x184:								// sqrt
		case 0x185:								// double
		case 0x186:								// absf
		case 0x187:								// expf
		case 0x188:								// logf
		case 0x189:								// limitf
		case 0x18a:								// powf
		case 0x18b:								// geteasef
			return true;
			break;
		}
	}
	return false;
}
