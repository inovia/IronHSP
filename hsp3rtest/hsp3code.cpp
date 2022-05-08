
//
//	HSP3 code manager
//	(���Ԍ���W�J����уp�����[�^�[�擾)
//	(hsp3r/hsp3cnv�Ή��A�V�����p�����[�^�[�擾����)
//	onion software/onitama 2008/5
//
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

#include "../hsp3/hsp3config.h"

#include "../hsp3/supio.h"

#include "../hsp3/hspwnd.h"
#include "../hsp3/dpmread.h"
#include "../hsp3/stack.h"
#include "../hsp3/strbuf.h"
#include "../hsp3/hsp3code.h"
#include "../hsp3/hsp3debug.h"
#include "../hsp3/hsp3int.h"

#define strp(dsptr) &hspctx->mem_mds[dsptr]

/*------------------------------------------------------------*/
/*
		system data
*/
/*------------------------------------------------------------*/

static HSP3TYPEINFO *hsp3tinfo;	// HSP3 type info structure (strbuf)
static int tinfo_cur;			// Current type info ID
#define GetTypeInfoPtr( type ) (&hsp3tinfo[type])

static HSPCTX *hspctx;			// Current Context
static unsigned short *mcs;		// Current PC ptr
static unsigned short *mcsbak;
static int val,type,exflg;
static int hspevent_opt;		// Event enable flag
static MPModVarData modvar_init;
static int sptr_res;
static int arrayobj_flag;

static HSPEXINFO mem_exinfo;	// HSPEXINFO�{��

#ifdef HSPDEBUG
static HSP3DEBUG dbginfo;
static int dbgmode;
#endif

PVal *plugin_pval;								// �v���O�C���ɓn�����ϐ��|�C���^�̎���
PVal *mpval;									// code_get�Ŏg�p���ꂽ�e���|�����ϐ�
static PVal *mpval_int;							// code_get�Ŏg�p���ꂽ�e���|�����ϐ�(int�p)
static PVal prmvar;								// �p�����[�^�[�e���|�����ϐ��̎���

static	unsigned char *mem_di_val;				// Debug VALS info ptr
static	int srcname;
static	int funcres;							// �֐��̖߂�l�^


/*------------------------------------------------------------*/
/*
		for hsp3r
*/
/*------------------------------------------------------------*/

#include "hspvar_util.h"

static STMDATA *next_stm;
static int mem_loopppt[HSP3_REPEAT_MAX];	// repeat loop info
static int mem_loopppt2[HSP3_REPEAT_MAX];	// repeat loop info

inline void code_next( void )
{
	//		Get 1 command block
	//		(ver3.0�ȍ~�p)
	//
	if ( StackGetLevel <= 0 ) return;
	next_stm = StackPeek;
	type = next_stm->type;

	if ( type == HSPVAR_FLAG_MARK ) {
		val = next_stm->ival;
		//StackPop();
		//next_stm = StackPeek;
		return;
	}
}

/*------------------------------------------------------------*/
/*
		interface
*/
/*------------------------------------------------------------*/

void code_puterror( HSPERROR error )
{
	//		�G���[��O�𔭐�������
	//
	if ( error == HSPERR_NONE ) {
		hspctx->runmode = RUNMODE_END;
	}
	throw error;
}


int code_getexflg( void )
{
	return exflg;
}

#if 0
static inline void calcprm( HspVarProc *proc, PDAT *pval, int exp, void *ptr )
{
	//		Caluculate parameter args (valiant)
	//
	switch(exp) {
	case CALCCODE_ADD:
		proc->AddI( pval, ptr );
		break;
	case CALCCODE_SUB:
		proc->SubI( pval, ptr );
		break;
	case CALCCODE_MUL:
		proc->MulI( pval, ptr );
		break;
	case CALCCODE_DIV:
		proc->DivI( pval, ptr );
		break;
	case CALCCODE_MOD:						// '%'
		proc->ModI( pval, ptr );
		break;

	case CALCCODE_AND:
		proc->AndI( pval, ptr );
		break;
	case CALCCODE_OR:
		proc->OrI( pval, ptr );
		break;
	case CALCCODE_XOR:
		proc->XorI( pval, ptr );
		break;

	case CALCCODE_EQ:
		proc->EqI( pval, ptr );
		break;
	case CALCCODE_NE:
		proc->NeI( pval, ptr );
		break;
	case CALCCODE_GT:
		proc->GtI( pval, ptr );
		break;
	case CALCCODE_LT:
		proc->LtI( pval, ptr );
		break;
	case CALCCODE_GTEQ:						// '>='
		proc->GtEqI( pval, ptr );
		break;
	case CALCCODE_LTEQ:						// '<='
		proc->LtEqI( pval, ptr );
		break;

	case CALCCODE_RR:						// '>>'
		proc->RrI( pval, ptr );
		break;
	case CALCCODE_LR:						// '<<'
		proc->LrI( pval, ptr );
		break;
	case '(':
		throw HSPERR_INVALID_ARRAY;
	default:
		throw HSPVAR_ERROR_INVALID;
	}
}


static inline void calcprmf( int &mval, int exp, int p )
{
	//		Caluculate parameter args (int)
	//
	switch(exp) {
	case CALCCODE_ADD:
		mval += p;
		break;
	case CALCCODE_SUB:
		mval -= p;
		break;
	case CALCCODE_MUL:
		mval *= p;
		break;
	case CALCCODE_DIV:
		if ( p == 0 ) throw( HSPVAR_ERROR_DIVZERO );
		mval /= p;
		break;
	case CALCCODE_MOD:						// '%'
		if ( p == 0 ) throw( HSPVAR_ERROR_DIVZERO );
		mval %= p;
		break;

	case CALCCODE_AND:
		mval &= p;
		break;
	case CALCCODE_OR:
		mval |= p;
		break;
	case CALCCODE_XOR:
		mval ^= p;
		break;

	case CALCCODE_EQ:
		mval = (mval==p);
		break;
	case CALCCODE_NE:
		mval = (mval!=p);
		break;
	case CALCCODE_GT:
		mval = (mval>p);
		break;
	case CALCCODE_LT:
		mval = (mval<p);
		break;
	case CALCCODE_GTEQ:						// '>='
		mval = (mval>=p);
		break;
	case CALCCODE_LTEQ:						// '<='
		mval = (mval<=p);
		break;

	case CALCCODE_RR:						// '>>'
		mval >>= p;
		break;
	case CALCCODE_LR:						// '<<'
		mval <<= p;
		break;

	case '(':
		throw HSPERR_INVALID_ARRAY;
	default:
		throw HSPVAR_ERROR_INVALID;
	}
}


static void inline code_calcop( int op )
{
	//		�X�^�b�N����������Q��POP�������̂����Z����
	//
	HspVarProc *varproc;
	STMDATA *stm1;
	STMDATA *stm2;
	char *ptr;
	int tflag;
	int basesize;

	stm2 = StackPeek;
	stm1 = StackPeek2;
	tflag = stm1->type;

	//if ( tflag > HSP3_FUNC_MAX ) throw HSPERR_UNKNOWN_CODE;
	//Alertf( "(%d) %d %d %d",tflag, stm1->ival, op, stm2->ival );

	if ( tflag == HSPVAR_FLAG_INT ) {
		if ( stm2->type == HSPVAR_FLAG_INT ) {					// HSPVAR_FLAG_INT �̂ݍ�����
			calcprmf( stm1->ival, op, stm2->ival );				// ���������ꂽ���Z(int�̂�)
			StackDecLevel;										// stack->Pop() �̑���(������)
			stm2->ival = stm1->ival;							// �P�i�ڃX�^�b�N�̒l�����ւ���
			return;
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

	ptr = STM_GETPTR(stm2);
	if ( tflag != stm2->type ) {								// �^����v���Ȃ��ꍇ�͕ϊ�
		if ( stm2->type >= HSPVAR_FLAG_USERDEF ) {
			ptr = (char *)HspVarCoreGetProc(stm2->type)->CnvCustom( ptr, tflag );
		} else {
			ptr = (char *)varproc->Cnv( ptr, stm2->type );
		}
	}
	calcprm( varproc, (PDAT *)mpval->pt, op, ptr );				// �v�Z���s�Ȃ�
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


static void code_checkarray( PVal *pval )
{
	//		Check PVal Array information
	//		(�z��v�f(int)�̎��o��)
	//
	int chk,i;
	PVal temp;
	HspVarCoreReset( pval );										// �z��|�C���^�����Z�b�g����

	if ( type == TYPE_MARK ) {
		if ( val == '(' ) {
			code_next();
			//			�����l�̂݃T�|�[�g
			while(1) {
				HspVarCoreCopyArrayInfo( &temp, pval );			// ��Ԃ�ۑ�
				chk = code_get();								// �p�����[�^�[�����o��
				if ( chk<=PARAM_END ) { throw HSPERR_BAD_ARRAY_EXPRESSION; }
				if ( mpval->flag != HSPVAR_FLAG_INT ) { throw HSPERR_TYPE_MISMATCH; }
				HspVarCoreCopyArrayInfo( pval, &temp );			// ��Ԃ𕜋A
				i = *(int *)(mpval->pt);
				HspVarCoreArray( pval, i );						// �z��v�f�w��(����)
				if ( chk == PARAM_SPLIT ) break;
			}
			code_next();											// ')'��ǂݔ�΂�
			return;
		}
	}
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


static void code_checkarray2( PVal *pval )
{
	//		Check PVal Array information
	//		(�z��v�f(int)�̎��o��)(�z��̊g���ɑΉ�)
	//
	int chk,i;
	PVal temp;
	HspVarCoreReset( pval );									// �z��|�C���^�����Z�b�g����

	if ( type == TYPE_MARK ) {
		if ( val == '(' ) {
			code_next();
			//			�����l�̂݃T�|�[�g
			while(1) {
				HspVarCoreCopyArrayInfo( &temp, pval );			// ��Ԃ�ۑ�
				chk = code_get();								// �p�����[�^�[�����o��
				if ( chk<=PARAM_END ) { throw HSPERR_BAD_ARRAY_EXPRESSION; }
				if ( mpval->flag != HSPVAR_FLAG_INT ) { throw HSPERR_TYPE_MISMATCH; }
				HspVarCoreCopyArrayInfo( pval, &temp );			// ��Ԃ𕜋A
				i = *(int *)(mpval->pt);
				code_arrayint2( pval, i );
				if ( chk == PARAM_SPLIT ) break;
			}
			code_next();											// ')'��ǂݔ�΂�
			return;
		}
	}
}


static char *code_checkarray_obj( PVal *pval, int *mptype )
{
	//		Check PVal Array object information
	//		( �z��v�f(�I�u�W�F�N�g)�̎��o�� )
	//		( �Ԓl : �ėp�f�[�^�̃|�C���^ )
	//		( mptype : �ėp�f�[�^�̃^�C�v��Ԃ� )
	//
	char *ptr;
	HspVarProc *varproc;
/*
	FlexValue *fv;
	if ( pval->support & HSPVAR_SUPPORT_STRUCTACCEPT ) {			// �\���̎󂯕t��
		code_checkarray( pval );
		if ( pval->support & HSPVAR_SUPPORT_CLONE ) {				// �N���[���̃`�F�b�N
			fv = (FlexValue *)HspVarCorePtr( pval );
			*mptype = fv->clonetype;
			return (fv->ptr);
		}
		if (( type != TYPE_STRUCT )||( exflg )) {
			*mptype = MPTYPE_VAR;
			return HspVarCorePtr( pval );
		}
		varproc = HspVarCoreGetProc( pval->flag );
		ptr = varproc->ArrayObject( pval, mptype );
		return ptr;
	}

	if ( pval->support & HSPVAR_SUPPORT_CLONE ) {				// �N���[���̃`�F�b�N
		fv = (FlexValue *)HspVarCorePtr( pval );
		*mptype = fv->clonetype;
		return (fv->ptr);
	}
*/

	HspVarCoreReset( pval );										// �z��|�C���^�����Z�b�g����

	if ( type == TYPE_MARK ) {
		if ( val == '(' ) {											// �z�񂪂���ꍇ
			code_next();
//			if ( pval->support & HSPVAR_SUPPORT_ARRAYOBJ ) {
				varproc = HspVarCoreGetProc( pval->flag );
				ptr = (char *)varproc->ArrayObjectRead( pval, mptype );
				code_next();											// ')'��ǂݔ�΂�
				return ptr;
//			}
//			code_checkarray( pval );
		}
	}
	return (char *)HspVarCorePtr( pval );
}


/*
static char *code_get_varsub( PVal *pval, int *restype )
{
	//		pval�̎��̂���������(HSPVAR_SUPPORT_ARRAYOBJ���̂�)
	//		( �Ԓl�����̃|�C���^�ƂȂ� )
	//
	char *ptr;
	ptr = (char *)code_checkarray_obj( pval, restype );
	return code_get_proxyvar( ptr, restype );
}
*/


char *code_get_proxyvar( char *ptr, int *mptype )
{
	//		�}���`�p�����[�^�[�̕ϐ�����������
	//
	MPVarData *var;
	PVal *getv_pval;
	switch( *mptype ) {										// �}���`�p�����[�^�[���擾
	case MPTYPE_SINGLEVAR:
		var = (MPVarData *)ptr;
		getv_pval = var->pval;
		getv_pval->offset = var->aptr;
		if ( type == TYPE_MARK ) if ( val == '(' ) throw HSPERR_INVALID_ARRAY;
		//HspVarCoreReset( getv_pval );
		break;
	case MPTYPE_LOCALSTRING:
		*mptype = MPTYPE_STRING;
		return *(char **)ptr;
	case MPTYPE_ARRAYVAR:
		var = (MPVarData *)ptr;
		getv_pval = var->pval;
		if ( getv_pval->support & HSPVAR_SUPPORT_MISCTYPE ) {
			return code_checkarray_obj( getv_pval, mptype );
		} else {
			code_checkarray( getv_pval );
		}
		break;
	case MPTYPE_LOCALVAR:
		getv_pval = (PVal *)ptr;
		if ( getv_pval->support & HSPVAR_SUPPORT_MISCTYPE ) {
			return code_checkarray_obj( getv_pval, mptype );
		} else {
			code_checkarray( getv_pval );
		}
		break;
	default:
		return ptr;
	}
	*mptype = getv_pval->flag;
	return (char *)HspVarCorePtr( getv_pval );
}


static void code_checkarray_obj2( PVal *pval )
{
	//		Check PVal Array object information
	//		( �z��v�f(�I�u�W�F�N�g)�̎��o���E�ϐ��w�莞 )
	//		( �ϐ��̓��e���Q�Ƃ���ꍇ�ɂ�code_checkarray_obj���g�p���܂� )
	//
	HspVarProc *varproc;
	HspVarCoreReset( pval );										// �z��|�C���^�����Z�b�g����

	arrayobj_flag = 0;
	if ( type == TYPE_MARK ) {
		if ( val == '(' ) {											// �z�񂪂���ꍇ
			code_next();
			varproc = HspVarCoreGetProc( pval->flag );
			varproc->ArrayObject( pval );
			arrayobj_flag = 1;
			code_next();											// ')'��ǂݔ�΂�
		}
	}
}

#endif




int code_get( void )
{
	//		parameter analysis
	//			result: 0=ok(PARAM_OK)  -1=end(PARAM_END)  -2=default(PARAM_DEFAULT)
	//					(�G���[�������͗�O���������܂�)
	//
	int tflag;
	STMDATA *stm;
	char *ptr;
	HspVarProc *varproc;

	if ( StackGetLevel <= 0 ) return PARAM_END;

	//stm = next_stm;
	//tflag = type;
	stm = StackPeek;
	tflag = stm->type;
	val = stm->ival;

	if ( tflag == HSPVAR_FLAG_DEFAULT ) {
		StackDecLevel;
		code_next();
		return PARAM_DEFAULT;
	}

	if ( tflag >= TYPE_EX_SUBROUTINE ) return PARAM_END;
	if ( tflag == HSPVAR_FLAG_MARK ) {
		return PARAM_END;
	}

	ptr = STM_GETPTR(stm);
	if ( tflag == HSPVAR_FLAG_VAR ) {
		PVal *pval;
		int *iptr;
		iptr = (int *)stm->itemp;
		pval = (PVal *)val;
		tflag = pval->flag;
		ptr = (char *)HspVarCorePtrAPTR( pval, *iptr );
	}

	if ( tflag == HSPVAR_FLAG_INT ) {
		mpval = mpval_int;
		*(int *)mpval->pt = *(int *)ptr;
		//*(int *)mpval->pt = val;
		StackDecLevel;
		code_next();
		return 0;
	}

	varproc = HspVarCoreGetProc( tflag );
	mpval = HspVarCoreGetPVal( tflag );

	if ( mpval->mode == HSPVAR_MODE_NONE ) {					// �^�ɍ��킹���e���|�����ϐ���������
		if ( varproc->flag == 0 ) {
			throw HSPERR_TYPE_INITALIZATION_FAILED;
		}
		HspVarCoreClearTemp( mpval, tflag );									// �ŏ��T�C�Y�̃��������m��
	}
	varproc->Set( mpval, (PDAT *)(mpval->pt), ptr );				// �e���|�����ϐ��ɏ����l��ݒ�
	StackPop();
	code_next();
	return 0;

#if 0
	STMDATA *stm;
	PVal *argpv;
	HspVarProc *varproc;
	HSP3TYPEINFO *info;
	MPModVarData *var;
	FlexValue *fv;
	char *out;
	STRUCTPRM *prm;
	char *ptr;
	int tflag;
	int basesize;
	int tmpval;
	int stack_def;
	int resval;

	if (exflg&EXFLG_1) return PARAM_END;		// �p�����[�^�[�I�[
	if (exflg&EXFLG_2) {						// �p�����[�^�[��؂�(�f�t�H���g��)
		exflg^=EXFLG_2;
		return PARAM_DEFAULT;
	}
	if ( type == TYPE_MARK ) {
		if ( val == 63 ) {						// �p�����[�^�[�ȗ���('?')
			code_next();
			exflg&=~EXFLG_2;
			return PARAM_DEFAULT;
		}
		if ( val == ')' ) {						// �֐����̃p�����[�^�[�ȗ���
			exflg&=~EXFLG_2;
			return PARAM_ENDSPLIT;
		}
	}

	resval = 0;
	stack_def = StackGetLevel;					// �X�^�b�N�̃��x�����擾

	while(1) {
		//Alertf( "type%d val%d exflg%d",type,val,exflg );

		switch(type) {
		case TYPE_MARK:
			if ( val == ')' ) {					// �����̏I���}�[�N
				if ( stack_def == StackGetLevel ) { throw HSPERR_WRONG_EXPRESSION; }
				resval = PARAM_SPLIT;
				exflg |= EXFLG_2;
				break;
			}
			code_calcop( val );
			code_next();
			break;
		case TYPE_VAR:
			argpv = &hspctx->mem_var[val];
			code_next();
			tflag = argpv->flag;
			if ( argpv->support & HSPVAR_SUPPORT_MISCTYPE ) {
				ptr = (char *)code_checkarray_obj( argpv, &tflag );
			} else {
				code_checkarray( argpv );
				ptr = (char *)HspVarCorePtr( argpv );
			}
			varproc = HspVarCoreGetProc( tflag );
			basesize = varproc->basesize;
			if ( basesize < 0 ) { basesize = varproc->GetSize( (PDAT *)ptr ); }
			StackPush( tflag, ptr, basesize );
			break;
		case TYPE_INUM:
			StackPushi( val );
			code_next();
			break;
		case TYPE_STRING:
			StackPush( type, strp(val) );
			code_next();
			break;
		case TYPE_DNUM:
			StackPush( type, strp(val), sizeof(double) );
			code_next();
			break;
		case TYPE_STRUCT:
			prm = &hspctx->mem_minfo[val];
			code_next();
			out = ((char *)hspctx->prmstack );
			if ( out == NULL ) throw HSPERR_INVALID_PARAMETER;
			if ( prm->subid != STRUCTPRM_SUBID_STACK ) {
				var = (MPModVarData *)out;
				if (( var->magic != MODVAR_MAGICCODE )||( var->subid != prm->subid )||(var->pval->flag != TYPE_STRUCT )) throw HSPERR_INVALID_STRUCT_SOURCE;
				fv = (FlexValue *)HspVarCorePtrAPTR( var->pval, var->aptr );
				if ( fv->type == FLEXVAL_TYPE_NONE ) throw HSPERR_INVALID_STRUCT_SOURCE;
				out = (char *)fv->ptr;
			}
			out += prm->offset;
			tflag = prm->mptype;
			ptr = (char *)code_get_proxyvar( out, &tflag );
			varproc = HspVarCoreGetProc( tflag );
			basesize = varproc->basesize;
			if ( basesize < 0 ) { basesize = varproc->GetSize( (PDAT *)ptr ); }
			StackPush( tflag, ptr, basesize );
			break;
		case TYPE_LABEL:
			tmpval = (int)hspctx->mem_ot[val];
			StackPush( HSPVAR_FLAG_LABEL, (char *)&tmpval, sizeof(int)  );
			code_next();
			break;
		default:
			//		���_�C���N�g(reffunc)�g�p�`�F�b�N
			//
			info = GetTypeInfoPtr( type );
			if ( info->reffunc == NULL ) {
				throw HSPERR_INVALID_PARAMETER;
			}
			tmpval = val;
			code_next();
			ptr = (char *)info->reffunc( &tflag, tmpval );	// �^�C�v���Ƃ̊֐��U�蕪��
			basesize = HspVarCoreGetProc( tflag )->GetSize( (PDAT *)ptr );
			StackPush( tflag, ptr, basesize );
			break;
		}

		if ( exflg ) {								// �p�����[�^�[�I�[�`�F�b�N
			exflg&=~EXFLG_2;
			break;
		}
	}

	stm = StackPeek;
	tflag = stm->type;

	varproc = HspVarCoreGetProc( tflag );
	mpval = HspVarCoreGetPVal( tflag );

	if ( mpval->mode == HSPVAR_MODE_NONE ) {					// �^�ɍ��킹���e���|�����ϐ���������
		if ( varproc->flag == 0 ) {
			throw HSPERR_TYPE_INITALIZATION_FAILED;
		}
		HspVarCoreClearTemp( mpval, tflag );									// �ŏ��T�C�Y�̃��������m��
	}
	varproc->Set( mpval, (PDAT *)(mpval->pt), STM_GETPTR(stm) );				// �e���|�����ϐ��ɏ����l��ݒ�

	StackPop();
	if ( stack_def != StackGetLevel )					{		// �X�^�b�N������ɕ��A���Ă��Ȃ�
		throw HSPERR_STACK_OVERFLOW;
	}

	return resval;
#endif
}


char *code_gets( void )
{
	//		������p�����[�^�[���擾
	//
	int chk;
	chk = code_get();
	if ( chk<=PARAM_END ) { throw HSPERR_NO_DEFAULT; }
	if ( mpval->flag != HSPVAR_FLAG_STR ) { throw HSPERR_TYPE_MISMATCH; }
	return (mpval->pt);
}


char *code_getds( const char *defval )
{
	//		������p�����[�^�[���擾(�f�t�H���g�l����)
	//
	int chk;
	chk = code_get();
	if ( chk<=PARAM_END ) { return (char *)defval; }
	if ( mpval->flag != HSPVAR_FLAG_STR ) { throw HSPERR_TYPE_MISMATCH; }
	return (mpval->pt);
}


char *code_getdsi( const char *defval )
{
	//		������p�����[�^�[���擾(�f�t�H���g�l����E���l����)
	//
	int chk;
	char *ptr;
	chk = code_get();
	if ( chk<=PARAM_END ) { return (char *)defval; }

	ptr = mpval->pt;
	if ( mpval->flag != HSPVAR_FLAG_STR ) {			// �^����v���Ȃ��ꍇ�͕ϊ�
		//ptr = (char *)HspVarCoreCnv( mpval->flag, HSPVAR_FLAG_STR, ptr );
		ptr = (char *)HspVarCoreCnvPtr( mpval, HSPVAR_FLAG_STR );
	}
	return ptr;
}


int code_geti( void )
{
	//		���l�p�����[�^�[���擾
	//
	int chk;
	chk = code_get();
	if ( chk<=PARAM_END ) { throw HSPERR_NO_DEFAULT; }
	if ( mpval->flag != HSPVAR_FLAG_INT ) {
		if ( mpval->flag != HSPVAR_FLAG_DOUBLE ) throw HSPERR_TYPE_MISMATCH;
		return (int)(*(double *)(mpval->pt));		// double�̎���int�ɕϊ�
	}
	return *(int *)(mpval->pt);
}


int code_getdi( const int defval )
{
	//		���l�p�����[�^�[���擾(�f�t�H���g�l����)
	//
	int chk;
	chk = code_get();
	if ( chk<=PARAM_END ) { return defval; }
	if ( mpval->flag != HSPVAR_FLAG_INT ) {
		if ( mpval->flag != HSPVAR_FLAG_DOUBLE ) throw HSPERR_TYPE_MISMATCH;
		return (int)(*(double *)(mpval->pt));		// double�̎���int�ɕϊ�
	}
	return *(int *)(mpval->pt);
}


double code_getd( void )
{
	//		���l(double)�p�����[�^�[���擾
	//
	int chk;
	chk = code_get();
	if ( chk<=PARAM_END ) { throw HSPERR_NO_DEFAULT; }
	if ( mpval->flag != HSPVAR_FLAG_DOUBLE ) {
		if ( mpval->flag != HSPVAR_FLAG_INT ) throw HSPERR_TYPE_MISMATCH;
		return (double)(*(int *)(mpval->pt));		// int�̎���double�ɕϊ�
	}
	return *(double *)(mpval->pt);
}


double code_getdd( const double defval )
{
	//		���l(double)�p�����[�^�[���擾(�f�t�H���g�l����)
	//
	int chk;
	chk = code_get();
	if ( chk<=PARAM_END ) { return defval; }
	if ( mpval->flag != HSPVAR_FLAG_DOUBLE ) {
		if ( mpval->flag != HSPVAR_FLAG_INT ) throw HSPERR_TYPE_MISMATCH;
		return (double)(*(int *)(mpval->pt));		// int�̎���double�ɕϊ�
	}
	return *(double *)(mpval->pt);
}

#if 0
static APTR code_getv_sub( PVal **pval )
{
	//		pval�̎��̂���������(�}���`�p�����[�^�[�̏ꍇ�����邽��)
	//		( �Ԓl���V����PVal�|�C���^�ƂȂ� )
	//
	PVal *getv_pval;
//	MPVarData *var;
	int mptype;

	mptype = MPTYPE_VAR;
	getv_pval = *pval;
	if ( getv_pval->support & HSPVAR_SUPPORT_MISCTYPE ) {		// �A�z�z��Ȃǂ̌���
		code_checkarray_obj2( getv_pval );
		return HspVarCoreGetAPTR( getv_pval );
	}
	code_checkarray2( *pval );									// �ʏ�̔z�񌟍�(�g������)
	return HspVarCoreGetAPTR( getv_pval );
}

APTR code_getv_proxy( PVal **pval, MPVarData *var, int mptype )
{
	PVal *getv_pval;
	APTR aptr;
	switch( mptype ) {										// �}���`�p�����[�^�[���擾
	case MPTYPE_VAR:
		return HspVarCoreGetAPTR( *pval );
	case MPTYPE_SINGLEVAR:
		getv_pval = var->pval;
		aptr = var->aptr;
		if ( type == TYPE_MARK ) if ( val == '(' ) throw HSPERR_INVALID_ARRAY;
		break;
	case MPTYPE_ARRAYVAR:
		getv_pval = var->pval;
		aptr = code_getv_sub( &getv_pval );
		break;
	case MPTYPE_LOCALVAR:
		getv_pval = (PVal *)var;
		aptr = code_getv_sub( &getv_pval );
		break;
	default:
		throw HSPERR_VARIABLE_REQUIRED;
	}
	*pval = getv_pval;
	return aptr;
}


static inline APTR code_getva_struct( PVal **pval )
{
	//		�u�������p�����[�^�[��ϐ��̑���Ɏ擾
	//
	MPModVarData *var;
	FlexValue *fv;
	STRUCTPRM *prm;
	APTR aptr;
	char *out;
	int i;

	i = val;
	code_next();
	out = ((char *)hspctx->prmstack );
	if ( out == NULL ) throw HSPERR_INVALID_PARAMETER;

	if ( i == STRUCTCODE_THISMOD ) {						// thismod
		var = (MPModVarData *)out;
		if ( var->magic != MODVAR_MAGICCODE ) throw HSPERR_INVALID_STRUCT_SOURCE;
		*pval = var->pval;
		exflg&=EXFLG_1;
		return var->aptr;
	}

	prm = &hspctx->mem_minfo[i];
	if ( prm->subid != STRUCTPRM_SUBID_STACK ) {
		var = (MPModVarData *)out;
		if (( var->magic != MODVAR_MAGICCODE )||( var->subid != prm->subid )||(var->pval->flag != TYPE_STRUCT )) throw HSPERR_INVALID_STRUCT_SOURCE;
		fv = (FlexValue *)HspVarCorePtrAPTR( var->pval, var->aptr );
		if ( fv->type == FLEXVAL_TYPE_NONE ) throw HSPERR_INVALID_STRUCT_SOURCE;
		out = (char *)fv->ptr;
	}
	out += prm->offset;
	aptr = code_getv_proxy( pval, (MPVarData *)out, prm->mptype );
	exflg&=EXFLG_1;											// for 2nd prm_get
	return aptr;
}
#endif

APTR code_getva( PVal **pval )
{
	//		�ϐ��p�����[�^�[���擾(pval+APTR)
	//
	PVal *getv_pval;
	STMDATA *stm;
	int *iptr;
	int tflag;
	int chk, i;
	PVal temp;
	APTR aptr;

	if ( StackGetLevel <= 0 ) { throw HSPERR_VARIABLE_REQUIRED; }
	stm = StackPeek;
	tflag = stm->type;
	if ( tflag != HSPVAR_FLAG_VAR ) { throw HSPERR_VARIABLE_REQUIRED; }

	iptr = (int *)stm->itemp;
	aptr = *iptr;										// aptr�𓾂�
	getv_pval = (PVal *)stm->ival;
	StackPop();
	*pval = getv_pval;

	getv_pval->offset = aptr;
	code_next();
	return aptr;

#if 0
	if ( exflg ) { throw HSPERR_VARIABLE_REQUIRED; }			// �p�����[�^�[�Ȃ�(�f�t�H���g��)

	if ( type == TYPE_STRUCT ) {								// �u�������p�����[�^�[��
		return code_getva_struct( pval );
	}
	if ( type != TYPE_VAR ) { throw HSPERR_VARIABLE_REQUIRED; }

	getv_pval = &hspctx->mem_var[val];
	code_next();

	aptr = code_getv_sub( &getv_pval );

	exflg&=EXFLG_1;												// for 2nd prm_get
	*pval = getv_pval;
	return aptr;
#endif
}


PVal *code_getpval( void )
{
	//		�ϐ��p�����[�^�[���擾(PVal)
	//
	PVal *getv_pval;
	APTR aptr;
	aptr = code_getva( &getv_pval );
	if ( aptr != 0 ) throw HSPERR_BAD_ARRAY_EXPRESSION;
	return getv_pval;
}



unsigned short *code_getlb( void )
{
	//		���x���p�����[�^�[���擾
	//
	int tflag;
	STMDATA *stm;
	char *ptr;
	HspVarProc *varproc;

	if ( StackGetLevel <= 0 ) throw HSPERR_LABEL_REQUIRED;

	stm = StackPeek;
	tflag = stm->type;
	val = stm->ival;

	if ( tflag == HSPVAR_FLAG_VAR ) {	// �ϐ��w��Ȃ�Γ��e���擾����
		PVal *pval;
		int *iptr;
		iptr = (int *)stm->itemp;
		pval = (PVal *)val;
		tflag = pval->flag;
		iptr = (int *)HspVarCorePtrAPTR( pval, *iptr );
		val = *iptr;
	}

	if ( tflag != HSPVAR_FLAG_LABEL ) throw HSPERR_LABEL_REQUIRED;

	StackDecLevel;
	code_next();

	return (unsigned short *)( val );

#if 0
	int chk;
	int p;
	chk = code_get();
	if ( chk<=PARAM_END ) { throw HSPERR_LABEL_REQUIRED; }
	if ( mpval->flag != HSPVAR_FLAG_LABEL ) { throw HSPERR_LABEL_REQUIRED; }
	p = *(int *)mpval->pt;
	return (unsigned short *)( p );
#endif

#if 0
	if ( type != TYPE_LABEL ) {
		int chk;
		int p;
		chk = code_get();
		if ( chk<=PARAM_END ) { throw HSPERR_LABEL_REQUIRED; }
		if ( mpval->flag != HSPVAR_FLAG_LABEL ) { throw HSPERR_LABEL_REQUIRED; }
		p = *(int *)mpval->pt;
		mcs = mcsbak;
		return (unsigned short *)( hspctx->mem_mcs + p );
	}
	return (unsigned short *)( hspctx->mem_mcs + (hspctx->mem_ot[val]) );
#endif
}


unsigned short *code_getlb2( void )
{
	unsigned short *s;
	s = code_getlb();
	code_next();
	exflg&=~EXFLG_2;
	return s;
}


STRUCTPRM *code_getstprm( void )
{
	//		�\���̃p�����[�^�[���擾
	//
	STRUCTPRM *prm;
	if ( type != TYPE_STRUCT ) throw HSPERR_STRUCT_REQUIRED;
	prm = &hspctx->mem_minfo[ val ];
	code_next();
	exflg&=~EXFLG_2;
	return prm;
}


STRUCTDAT *code_getstruct( void )
{
	//		�\���̃p�����[�^�[���擾
	//
	STRUCTDAT *st;
	STRUCTPRM *prm;
	prm = code_getstprm();
	if ( prm->mptype != MPTYPE_STRUCTTAG ) throw HSPERR_STRUCT_REQUIRED;
	st = &hspctx->mem_finfo[ prm->subid ];
	return st;
}


STRUCTDAT *code_getcomst( void )
{
	//		COM�\���̃p�����[�^�[���擾
	//
	STRUCTDAT *st;
	if ( type != TYPE_DLLCTRL ) throw HSPERR_TYPE_MISMATCH;
	val -= TYPE_OFFSET_COMOBJ;
	if ( val < 0 ) throw HSPERR_TYPE_MISMATCH;
	st = &hspctx->mem_finfo[ val ];
	code_next();
	exflg&=~EXFLG_2;
	return st;
}


void code_setva( PVal *pval, APTR aptr, int type, const void *ptr )
{
	//		�ϐ��Ƀp�����[�^�[���w�肷��
	//
	HspVarProc *proc;
	pval->offset = aptr;
	proc = HspVarCoreGetProc( type );
	if ( pval->flag != type ) {
		if ( aptr != 0 ) throw HSPERR_INVALID_ARRAYSTORE;
		HspVarCoreClear( pval, type );				// �ŏ��T�C�Y�̃��������m��
	}
	proc->Set( pval, proc->GetPtr( pval ), ptr );
}


char *code_getvptr( PVal **pval, int *size )
{
	//		�ϐ��|�C���^�𓾂�
	//
	APTR aptr;
	aptr = code_getva( pval );
	return (char *)HspVarCoreGetBlockSize( *pval, HspVarCorePtrAPTR( *pval,aptr ), size );
}


/*------------------------------------------------------------*/
/*
		call-return process function
*/
/*------------------------------------------------------------*/

static void customstack_delete( STRUCTDAT *st, char *stackptr )
{
	//	custom command stack delete
	//
	int i;
	char *out;
	char *ss;
	STRUCTPRM *prm;
	prm = &hspctx->mem_minfo[ st->prmindex ];
	for(i=0;i<st->prmmax;i++) {							// �p�����[�^�[���擾
		if ( prm->mptype == MPTYPE_LOCALSTRING ) {
			out = stackptr + prm->offset;
			ss = *(char **)out;
			sbFree( ss );
		} else if ( prm->mptype == MPTYPE_LOCALVAR ) {
			HspVarCoreDispose( (PVal *)(stackptr + prm->offset) );
		}
		prm++;
	}
}


static void cmdfunc_return( void )
{
	//		return execute
	//
	STMDATA *stm;
	HSPROUTINE *r;
	STRUCTDAT *st;
	PVal *pval;
	int i,typ,lev;

	if ( StackGetLevel == 0 ) throw HSPERR_RETURN_WITHOUT_GOSUB;

	//DebugStackPeek();

	stm = StackPeek;
	typ = stm->type;
	r = (HSPROUTINE *)STM_GETPTR(stm);

	//mcs=r->mcsret;
	code_setpc( r->mcsret );
	hspctx->prmstack = r->oldtack;						// �ȑO�̃X�^�b�N�ɖ߂�
	hspctx->sublev--;

	if ( typ == TYPE_EX_SUBROUTINE ) {
		StackPop();										// ������gosub�̏ꍇ
		return;
	}
	if ( typ != TYPE_EX_CUSTOMFUNC ) throw HSPERR_RETURN_WITHOUT_GOSUB;

	//	�J�X�^�����߂̏ꍇ
	//code_next();
	st = r->param;
	lev = hspctx->prmstack_max - st->size;
	hspctx->prmstack_max = r->oldlev;			// �ȑO�̃X�^�b�N���ɖ߂�

	StackPop();

	for(i=0;i<st->size;i++) {					// ���[�J���ϐ���j������
		pval = (PVal *)PeekPtr;
		HspVarCoreDispose( pval );
		StackPop();
	}
	for(i=0;i<lev;i++) {
		StackPop();
	}
//		customstack_delete( r->param, (char *)(r+1) );	// �J�X�^�����߂̃��[�J�������������
}


static void cmdfunc_gosub( unsigned short *subr, unsigned short *retpc )
{
	//		gosub execute
	//
	HSPROUTINE *r;
	r = (HSPROUTINE *)StackPushSize( TYPE_EX_SUBROUTINE, sizeof(HSPROUTINE) );
	r->mcsret = retpc;
	r->stacklev = hspctx->sublev++;
	r->oldtack = hspctx->prmstack;
	r->param = NULL;

	hspctx->prmstack = NULL;
	code_setpc( subr );
}


static int code_callfunc( int cmd, int prmlevel )
{
	//	���[�U�[�g�����߂��Ăяo��
	//
	STRUCTDAT *st;
	HSPROUTINE *r;
	int i;
	int size;
	char *p;
	unsigned short *sbr;
	unsigned short *retpc;
	PVal *pval;

	retpc = code_getlb();						// ���A��̈ʒu���擾����

	st = &hspctx->mem_finfo[cmd];

	size = st->size;
	if ( size ) {								// ���[�J���ϐ������������ăX�^�b�N��push
		for(i=0;i<size;i++) {
			pval = (PVal *)StackPushSize( TYPE_EX_LOCAL_VARS, sizeof(PVal) );
			pval->mode = HSPVAR_MODE_NONE;
			pval->flag = HSPVAR_FLAG_INT;				// ���̌^
			HspVarCoreClear( pval, HSPVAR_FLAG_INT );	// �O���[�o���ϐ���0�Ƀ��Z�b�g
		}
	}

	//size = sizeof(HSPROUTINE) + st->size;
	p = (char *)(stm_cur - 1);					// �����X�^�b�N�ʒu
	r = (HSPROUTINE *)StackPushSize( TYPE_EX_CUSTOMFUNC, sizeof(HSPROUTINE) );
	//p = (char *)(r+1);
	//code_expandstruct( p, st, CODE_EXPANDSTRUCT_OPT_NONE );			// �X�^�b�N�̓��e��������

	r->oldtack = hspctx->prmstack;				// �ȑO�̃X�^�b�N��ۑ�
	r->oldlev = hspctx->prmstack_max;			// �ȑO�̃X�^�b�N����ۑ�
	hspctx->prmstack = (void *)p;				// �V�K�X�^�b�N��ݒ�

	r->mcsret = retpc;							// �߂�ꏊ
	r->stacklev = hspctx->sublev++;				// �l�X�g��i�߂�
	r->param = st;
	hspctx->prmstack_max = st->size + prmlevel;			// �p�����[�^�[�X�^�b�N�̐�

	sbr = (unsigned short *)( st->otindex );
	code_setpc( sbr );

	return RUNMODE_RUN;
}


static int code_callcfunc( int cmd, int prmlevel )
{
	//	���[�U�[�g���֐����Ăяo��(�Ăяo��������������)
	//
	STRUCTDAT *st;
	HSPROUTINE *r;
	int i;
	int size;
	char *p;
	unsigned short *sbr;
	unsigned short *retpc;
	PVal *pval;

	//retpc = code_getlb();						// ���A��̈ʒu���擾����
	retpc = NULL;								// ���A��̈ʒu�̓_�~�[

	st = &hspctx->mem_finfo[cmd];

	size = st->size;
	if ( size ) {								// ���[�J���ϐ������������ăX�^�b�N��push
		for(i=0;i<size;i++) {
			pval = (PVal *)StackPushSize( TYPE_EX_LOCAL_VARS, sizeof(PVal) );
			pval->mode = HSPVAR_MODE_NONE;
			pval->flag = HSPVAR_FLAG_INT;				// ���̌^
			HspVarCoreClear( pval, HSPVAR_FLAG_INT );	// �O���[�o���ϐ���0�Ƀ��Z�b�g
		}
	}

	//size = sizeof(HSPROUTINE) + st->size;
	p = (char *)(stm_cur - 1);					// �����X�^�b�N�ʒu
	r = (HSPROUTINE *)StackPushSize( TYPE_EX_CUSTOMFUNC, sizeof(HSPROUTINE) );
	//p = (char *)(r+1);
	//code_expandstruct( p, st, CODE_EXPANDSTRUCT_OPT_NONE );			// �X�^�b�N�̓��e��������

	r->oldtack = hspctx->prmstack;				// �ȑO�̃X�^�b�N��ۑ�
	r->oldlev = hspctx->prmstack_max;			// �ȑO�̃X�^�b�N����ۑ�
	hspctx->prmstack = (void *)p;				// �V�K�X�^�b�N��ݒ�

	r->mcsret = retpc;							// �߂�ꏊ
	r->stacklev = hspctx->sublev++;				// �l�X�g��i�߂�
	r->param = st;
	hspctx->prmstack_max = st->size + prmlevel;			// �p�����[�^�[�X�^�b�N�̐�

	sbr = (unsigned short *)( st->otindex );

	//Alertf("*cfunc*\n");
    code_setpc( sbr );

	//		gosub���ŌĂяo��������������
	//
	while(1) {
		TaskExec();
		if ( hspctx->runmode == RUNMODE_RETURN ) break;
	}

	//Alertf("*over*\n");
	return RUNMODE_RUN;
}


/*------------------------------------------------------------*/
/*
		structure process function
*/
/*------------------------------------------------------------*/

APTR code_newstruct( PVal *pval )
{
	int i,max;
	APTR ofs;
	FlexValue *fv;
	ofs = 0;
	if ( pval->flag != TYPE_STRUCT ) return 0;
	fv = (FlexValue *)pval->pt;
	max = pval->len[1];
	for( i=0;i<max;i++ ) {
		if ( fv[i].type == FLEXVAL_TYPE_NONE ) return i;
	}
	HspVarCoreReDim( pval, 1, max+1 );				// �z����g������
	return max;
}


FlexValue *code_setvs( PVal *pval, APTR aptr, void *ptr, int size, int subid )
{
	//		TYPE_STRUCT�̕ϐ���ݒ肷��
	//		(�Ԓl:�\���̂����߂邽�߂̏��|�C���^)
	//
	FlexValue fv;
	fv.customid = subid;
	fv.clonetype = 0;
	fv.size = size;
	fv.ptr = ptr;
	code_setva( pval, aptr, TYPE_STRUCT, &fv );
	return (FlexValue *)HspVarCorePtrAPTR( pval, aptr );
}


void code_expandstruct( char *p, STRUCTDAT *st, int option )
{
	//	�\���̂̍��ڂɃp�����[�^�[��������
	//
	int i,chk;
	char *out;
	STRUCTPRM *prm;
	prm = &hspctx->mem_minfo[ st->prmindex ];

	for(i=0;i<st->prmmax;i++) {							// �p�����[�^�[���擾
		out = p + prm->offset;
		//Alertf( "(%d)type%d index%d offset%d", st->subid, prm->mptype, st->prmindex+i,prm->offset );
		switch( prm->mptype ) {
		case MPTYPE_INUM:
			*(int *)out = code_getdi(0);
			break;
		case MPTYPE_MODULEVAR:
			{
			MPModVarData *var;
			PVal *refpv;
			APTR refap;
			var = (MPModVarData *)out;
			refap = code_getva( &refpv );
			var->magic = MODVAR_MAGICCODE;
			var->subid = prm->subid;
			var->pval = refpv;
			var->aptr = refap;
			break;
			}
		case MPTYPE_IMODULEVAR:
		case MPTYPE_TMODULEVAR:
			*(MPModVarData *)out = modvar_init;
			break;
		case MPTYPE_SINGLEVAR:
		case MPTYPE_ARRAYVAR:
			{
			MPVarData *var;
			PVal *refpv;
			APTR refap;
			var = (MPVarData *)out;
			refap = code_getva( &refpv );
			var->pval = refpv;
			var->aptr = refap;
			break;
			}
		case MPTYPE_DNUM:
			*(double *)out = code_getd();
			break;
		case MPTYPE_LOCALSTRING:
			{
			char *str;
			char *ss;
			str = code_gets();
			ss = sbAlloc( (int)strlen(str)+1 );
			strcpy( ss, str );
			*(char **)out = ss;
			break;
			}
		case MPTYPE_LOCALVAR:
			{
			PVal *pval;
			PDAT *dst;
			HspVarProc *proc;
			pval = (PVal *)out;
			pval->mode = HSPVAR_MODE_NONE;
			if ( option & CODE_EXPANDSTRUCT_OPT_LOCALVAR ) {
				chk = code_get();							// �p�����[�^�[�l���擾
				if ( chk == PARAM_OK ) {
					pval->flag = mpval->flag;					// ���̌^
					HspVarCoreClear( pval, mpval->flag );		// �ŏ��T�C�Y�̃��������m��
					proc = HspVarCoreGetProc( pval->flag );
					dst = proc->GetPtr( pval );					// PDAT�|�C���^���擾
					proc->Set( pval, dst, mpval->pt );
					break;
				}
			}
			pval->flag = HSPVAR_FLAG_INT;				// ���̌^
			HspVarCoreClear( pval, HSPVAR_FLAG_INT );	// �O���[�o���ϐ���0�Ƀ��Z�b�g
			break;
			}
		case MPTYPE_STRUCTTAG:
			break;
		default:
			throw HSPERR_INVALID_STRUCT_SOURCE;
		}
		prm++;
	}
}


void code_delstruct( PVal *in_pval, APTR in_aptr )
{
	//		���W���[���ϐ���j������
	//
#if 0
	int i;
	char *p;
	char *out;
	STRUCTPRM *prm;
	STRUCTDAT *st;
	PVal *pval;
	FlexValue *fv;

	fv = (FlexValue *)HspVarCorePtrAPTR( in_pval, in_aptr );

	if ( fv->type != FLEXVAL_TYPE_ALLOC ) return;

	prm = &hspctx->mem_minfo[ fv->customid ];
	st = &hspctx->mem_finfo[ prm->subid ];
	p = (char *)fv->ptr;

	if ( fv->clonetype == 0 ) {

		//Alertf( "del:%d",st->otindex );
		if ( st->otindex ) {								// �f�X�g���N�^���N��
			modvar_init.magic = MODVAR_MAGICCODE;
			modvar_init.subid = prm->subid;
			modvar_init.pval = in_pval;
			modvar_init.aptr = in_aptr;
			code_callfunc( st->otindex );
		}

		for(i=0;i<st->prmmax;i++) {							// �p�����[�^�[���擾
			out = p + prm->offset;
			switch( prm->mptype ) {
			case MPTYPE_LOCALVAR:
				pval = (PVal *)out;
				HspVarCoreDispose( pval );
				break;
			}
			prm++;
		}
	}
		
	//Alertf("STRUCT:BYE");
	sbFree( fv->ptr );
	fv->type = FLEXVAL_TYPE_NONE;
#endif
}


void code_delstruct_all( PVal *pval )
{
	//		���W���[���ϐ��S�̂�j������
	//
	int i;
	if ( pval->mode == HSPVAR_MODE_MALLOC ) {
		for(i=0;i<pval->len[1];i++) {
			code_delstruct( pval, i );
		}
	}
}


char *code_stmp( int size )
{
	//		stmp(������ꎞ�o�b�t�@)���w��T�C�Y�ŏ���������
	//
	if ( size > 1024 ) { hspctx->stmp = sbExpand( hspctx->stmp, size ); }
	return hspctx->stmp;
}


char *code_stmpstr( char *src )
{
	//		stmp(������ꎞ�o�b�t�@)��src���R�s�[����
	//
	char *p;
	p = code_stmp( (int)strlen( src ) + 1 );
	strcpy( p, src );
	return p;
}


char *code_getsptr( int *type )
{
	int fl;
	char *bp;
	if ( code_get() <= PARAM_END ) {
		fl = HSPVAR_FLAG_INT;
		sptr_res = 0;
		bp = (char *)&sptr_res;
	} else {
		fl = mpval->flag;
		bp = mpval->pt;
		if (( fl != HSPVAR_FLAG_INT )&&( fl != HSPVAR_FLAG_STR )) {
			throw HSPERR_TYPE_MISMATCH;
		}
	}
	*type = fl;
	return bp;
}

/*------------------------------------------------------------*/
/*
		type process function
*/
/*------------------------------------------------------------*/

static int p1,p2,p3,p4,p5,p6;
static int reffunc_intfunc_ivalue;

/*
	rev 43
	mingw : warning : �L�����^�Ɩ������^�̔�r
	�ɑΏ�
*/
#define ETRLOOP ((int)0x80000000)

#define GETLOP(num) (&(hspctx->mem_loop[num]))

static int cmdfunc_default( int cmd )
{
	//		cmdfunc : default
	//
	int tmp;
	if ( exflg & EXFLG_1 ) {
		tmp = type;
		code_next();
		if (( tmp == TYPE_INTFUNC )||( tmp == TYPE_EXTSYSVAR )) throw HSPERR_FUNCTION_SYNTAX;
		throw HSPERR_WRONG_NAME;
	}
	throw HSPERR_TOO_MANY_PARAMETERS;
	return RUNMODE_ERROR;
}


static int cmdfunc_custom( int cmd )
{
	//	custom command execute
	//
	STRUCTDAT *st;
	code_next();

	st = &hspctx->mem_finfo[cmd];
	if ( st->index != STRUCTDAT_INDEX_FUNC ) throw HSPERR_SYNTAX;

	return code_callfunc( cmd, prmstacks );
}


static void *reffunc_custom( int *type_res, int arg )
{
	//	custom function execute
	//
	STRUCTDAT *st;
	void *ptr;
	int old_funcres;

	//		�Ԓl�̃^�C�v��ݒ肷��
	//
	st = &hspctx->mem_finfo[arg];
	if ( st->index != STRUCTDAT_INDEX_CFUNC ) throw HSPERR_SYNTAX;
	old_funcres = funcres;
	funcres = TYPE_ERROR;

	//			'('�Ŏn�܂邩�𒲂ׂ�
	//
	//if ( type != TYPE_MARK ) throw HSPERR_INVALID_FUNCPARAM;
	//if ( val != '(' ) throw HSPERR_INVALID_FUNCPARAM;
	//code_next();

	code_callcfunc( arg, prmstacks );

	*type_res = funcres;					// �Ԓl�̃^�C�v���w�肷��
	switch( funcres ) {						// �Ԓl�̃|�C���^��ݒ肷��
	case TYPE_STRING:
		ptr = hspctx->refstr;
		break;
	case TYPE_DNUM:
		ptr = &hspctx->refdval;
		break;
	case TYPE_INUM:
		ptr = &hspctx->stat;
		break;
	default:
		throw HSPERR_NORETVAL;
	}

	//			')'�ŏI��邩�𒲂ׂ�
	//
	//if ( type != TYPE_MARK ) throw HSPERR_INVALID_FUNCPARAM;
	//if ( val != ')' ) throw HSPERR_INVALID_FUNCPARAM;
	//code_next();

	funcres = old_funcres;
	return ptr;
}



#if 0
static int cmdfunc_var( int cmd )
{
	//		cmdfunc : TYPE_VAR
	//		(�ϐ���� : �ϐ������擪�ɗ���ꍇ)
	//
	PVal *pval;
	HspVarProc *proc;
	APTR aptr;
	void *ptr;
	PDAT *dst;
	int chk,exp,incval;
	int baseaptr;

#ifdef HSPDEBUG
	if (( exflg & EXFLG_1 ) == 0 ) throw HSPERR_TOO_MANY_PARAMETERS;
#endif

	exflg = 0;								// code_next���g��Ȃ����ɕK�v
	aptr = code_getva( &pval );				// �ϐ����擾

	if ( type != TYPE_MARK ) { mcs = mcsbak; throw HSPERR_SYNTAX; }
	exp = val;
	code_next();							// ���̃R�[�h��

	if ( exflg ) {							// �C���N�������g(+)�E�f�N�������g(-)
		proc = HspVarCoreGetProc( pval->flag );
		incval = 1;
		if ( pval->flag == HSPVAR_FLAG_INT ) { ptr = &incval; } else {
			ptr = (int *)proc->Cnv( &incval, HSPVAR_FLAG_INT );	// �^��INT�łȂ��ꍇ�͕ϊ�
		}
		dst = HspVarCorePtrAPTR( pval, aptr );
		switch( exp ) {
		case CALCCODE_ADD:
			proc->AddI( dst, ptr );
			break;
		case CALCCODE_SUB:
			proc->SubI( dst, ptr );
			break;
		default:
			throw HSPERR_SYNTAX;
		}
		return RUNMODE_RUN;
	}

	chk = code_get();									// �p�����[�^�[�l���擾
	if ( chk != PARAM_OK ) { throw HSPERR_SYNTAX; }

	proc = HspVarCoreGetProc( pval->flag );
	dst = HspVarCorePtrAPTR( pval, aptr );
	ptr = mpval->pt;
	if ( exp == CALCCODE_EQ ) {							// '='�ɂ����
		if ( pval->flag != mpval->flag ) {

			if ( pval->support & HSPVAR_SUPPORT_NOCONVERT ) {	// �^�ϊ��Ȃ��̏ꍇ
				if ( arrayobj_flag ) {
					proc->ObjectWrite( pval, ptr, mpval->flag );
					return RUNMODE_RUN;
				}
			}

			if ( aptr != 0 ) throw HSPERR_INVALID_ARRAYSTORE;	// �^�ύX�̏ꍇ�͔z��v�f0�̂�
			HspVarCoreClear( pval, mpval->flag );		// �ŏ��T�C�Y�̃��������m��
			proc = HspVarCoreGetProc( pval->flag );
			dst = proc->GetPtr( pval );					// PDAT�|�C���^���擾
		}
		proc->Set( pval, dst, ptr );
		if ( exflg ) return RUNMODE_RUN;

		chk = pval->len[1];
		if ( chk == 0 ) baseaptr = aptr; else baseaptr = aptr % chk;
		aptr -= baseaptr;

		while(1) {
			if ( exflg ) break;
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
		}
		return RUNMODE_RUN;
	}

	//		�ϐ�+���Z�q�ɂ����
	//
	if ( pval->flag != mpval->flag ) {					// �^����v���Ȃ��ꍇ�͕ϊ�
		ptr = HspVarCoreCnvPtr( mpval, pval->flag );
		//ptr = proc->Cnv( ptr, mpval->flag );
	}
	calcprm( proc, dst, exp, ptr );
	if ( proc->aftertype != pval->flag ) {				// ���Z��Ɍ^���ς��ꍇ
		throw HSPERR_TYPE_MISMATCH;
	}
	return RUNMODE_RUN;
}
#endif


static void cmdfunc_return_setval( void )
{
	//		�������V�X�e���ϐ��ɃZ�b�g����(�Ԓl�p)
	//
	if ( code_get() <= PARAM_END ) return;

	hspctx->retval_level = hspctx->sublev;
	funcres = mpval->flag;

	switch( funcres ) {
	case HSPVAR_FLAG_INT:
		hspctx->stat = *(int *)mpval->pt;
		break;
	case HSPVAR_FLAG_STR:
		sbStrCopy( &hspctx->refstr, mpval->pt );
		break;
	case HSPVAR_FLAG_DOUBLE:
		hspctx->refdval = *(double *)mpval->pt;
		break;
	default:
		throw HSPERR_TYPE_MISMATCH;
	}
}


#if 0
static int cmdfunc_ifcmd( int cmd )
{
	//	'if' command execute
	//
	int i;
	unsigned short *mcstmp;
	i=(int)*mcs;mcs++;						// skip offset get
	mcstmp=mcs+i;
	if (val==0) {							// 'if'
		code_next();						// get first token
		if ( code_geti() ) return RUNMODE_RUN;			// if true
	}
	mcs=mcstmp;
	code_next();
	return RUNMODE_RUN;
}
#endif

static void cmdfunc_mref( PVal *pval, int prm )
{
	//		mref command
	//
	int t,size;
	char *out;
	HSPEXINFO *exinfo;

	if ( prm & 1024 ) throw HSPERR_UNSUPPORTED_FUNCTION;
	if ( prm >= 0x40 ) {
		exinfo = hspctx->exinfo2;
		if ( exinfo->HspFunc_mref != NULL ) exinfo->HspFunc_mref( pval, prm );
		return;
	}
	if (( prm & 0x30 )||( prm >= 8 )) throw HSPERR_UNSUPPORTED_FUNCTION;

	out = ((char *)hspctx->prmstack );
	if ( out == NULL ) throw HSPERR_ILLEGAL_FUNCTION;
	t = HSPVAR_FLAG_INT; size = sizeof(int);
	HspVarCoreDupPtr( pval, t, (out+(size*prm)), size );
}


static int cmdfunc_prog( int cmd )
{
	//		cmdfunc : TYPE_PROGCMD
	//
	code_next();							// ���̃R�[�h���擾(�ŏ��ɕK���K�v�ł�)

	switch( cmd ) {							// �T�u�R�}���h���Ƃ̕���

	case 0x00:								// goto
		mcs = code_getlb();
		code_setpc( mcs );
		//code_next();
		break;

	case 0x01:								// gosub
		{
		unsigned short *sbr;
		unsigned short *sbr2;
		sbr = code_getlb();
		sbr2 = code_getlb();
		cmdfunc_gosub( sbr2, sbr );
		break;
		}
	case 0x02:								// return
		if ( hspctx->prmstack != NULL ) cmdfunc_return_setval();
		cmdfunc_return();
		hspctx->runmode = RUNMODE_RETURN;
		return RUNMODE_RETURN;
		break;

	case 0x03:								// break
		if (hspctx->looplev==0) throw HSPERR_LOOP_WITHOUT_REPEAT;
		hspctx->looplev--;
		mcs = code_getlb();
		code_setpc( mcs );
		//code_next();
		break;

	case 0x04:								// repeat
		{
		LOOPDAT *lop;
		unsigned short *label;
		unsigned short *label2;
		if (hspctx->looplev>=(HSP3_REPEAT_MAX-1)) throw HSPERR_TOO_MANY_NEST;
		label = code_getlb();
		label2 = code_getlb();
		code_next();
		p1 = code_getdi( ETRLOOP );
		p2 = code_getdi( 0 );
		if ( p1==0 ) {				// 0�͑�break
			code_setpc( label2 );
			//mcs=label;
			//code_next();
			break;
		}
		if ( p1<0 ) p1=ETRLOOP; else p1+=p2;
		hspctx->looplev++;
		lop=GETLOP(hspctx->looplev);
		lop->cnt = p2;
		lop->time = p1;
		mem_loopppt[hspctx->looplev] = (int)label;
		mem_loopppt2[hspctx->looplev] = (int)label2;
		code_setpc( label );
		break;
		}

	case 0x06:								// continue
		{
		LOOPDAT *lop;
		unsigned short *label;
		label = code_getlb();

		lop=GETLOP(hspctx->looplev);
		code_next();
		p2=lop->cnt + 1;
		p1 = code_getdi( p2 );
		lop->cnt = p1 - 1;
		}
	case 0x05:								// loop
		{
		LOOPDAT *lop;
		if (hspctx->looplev==0) throw HSPERR_LOOP_WITHOUT_REPEAT;
		lop=GETLOP(hspctx->looplev);
		lop->cnt++;
		if ( lop->time != ETRLOOP ) {		// not eternal loop
			if ( lop->cnt >= lop->time ) {
				TaskSwitch( mem_loopppt2[hspctx->looplev] );		// ���[�v��ɃW�����v
				hspctx->looplev--;
				break;
			}
		}
		TaskSwitch( mem_loopppt[hspctx->looplev] );
		//mcs=lop->pt;
		//code_next();
		break;
		}

	case 0x07:								// wait
		hspctx->waitcount = code_getdi( 100 );
		hspctx->runmode = RUNMODE_WAIT;
		return RUNMODE_WAIT;

	case 0x08:								// await
		p1=code_getdi( 0 );
		//p2=code_getdi( -1 );
		hspctx->waitcount = p1;
		hspctx->waittick = -1;
		//if ( p2 > 0 ) hspctx->waitbase = p2;
		hspctx->runmode = RUNMODE_AWAIT;
		return RUNMODE_AWAIT;

	case 0x09:								// dim
	case 0x0a:								// sdim
	case 0x0d:								// dimtype
		{
		HspVarProc *proc;
		PVal *pval;
		int fl;
		pval = code_getpval();
		fl = TYPE_INUM;
		if ( cmd == 0x0d ) {
			fl = code_geti();
			proc = HspVarCoreGetProc( fl );
			if ( proc->flag == 0 ) throw HSPERR_ILLEGAL_FUNCTION;
		}
		p1 = code_getdi( 0 );
		p2 = code_getdi( 0 );
		p3 = code_getdi( 0 );
		p4 = code_getdi( 0 );
		if ( cmd == 0x0a ) {
			p5 = code_getdi( 0 );
			HspVarCoreDimFlex( pval, TYPE_STRING, p1, p2, p3, p4, p5 );
			//HspVarCoreAllocBlock( pval, HspVarCorePtrAPTR( pval, 0 ), p1 );
			break;
		}
		HspVarCoreDim( pval, fl, p1, p2, p3, p4 );
		break;
		}

	case 0x0b:								// foreach
		{
		LOOPDAT *lop;
		unsigned short *label;
		if (hspctx->looplev>=(HSP3_REPEAT_MAX-1)) throw HSPERR_TOO_MANY_NEST;
		label = code_getlb();
		code_next();
		hspctx->looplev++;
		lop=GETLOP(hspctx->looplev);
		lop->cnt = 0;
		lop->time = ETRLOOP;
		lop->pt = mcsbak;
		break;
		}
	case 0x0c:								// (hidden)foreach check
		{
		int i;
		PVal *pval;
		LOOPDAT *lop;
		unsigned short *label;
		if (hspctx->looplev==0) throw HSPERR_LOOP_WITHOUT_REPEAT;
		label = code_getlb();
		code_next();
		lop=GETLOP(hspctx->looplev);

		pval = code_getpval();
		if ( lop->cnt >= pval->len[1] ) {		// ���[�v�I��
			hspctx->looplev--;
			mcs = label;
			code_next();
			break;
		}
		if ( pval->support & HSPVAR_SUPPORT_VARUSE ) {
			i = HspVarCoreGetUsing( pval, HspVarCorePtrAPTR( pval, lop->cnt ) );
			if ( i == 0 ) {						// �X�L�b�v
				mcs=label;
				val=0x05;type=TYPE_PROGCMD;exflg=0;	// set 'loop' code
			}
		}
		break;
		}
	case 0x0e:								// dup
		{
		PVal *pval_m;
		PVal *pval;
		APTR aptr;
		pval_m = code_getpval();
		aptr = code_getva( &pval );
		HspVarCoreDup( pval_m, pval, aptr );
		break;
		}
	case 0x0f:								// dupptr
		{
		PVal *pval_m;
		pval_m = code_getpval();
		p1 = code_geti();
		p2 = code_geti();
		p3 = code_getdi( HSPVAR_FLAG_INT );
		if ( p2<=0 ) throw HSPERR_ILLEGAL_FUNCTION;
		if ( HspVarCoreGetProc(p3)->flag == 0 ) throw HSPERR_ILLEGAL_FUNCTION;
		HspVarCoreDupPtr( pval_m, p3, (void *)p1, p2 );
		break;
		}

	case 0x10:								// end
		hspctx->endcode = code_getdi(0);
		hspctx->runmode = RUNMODE_END;
		return RUNMODE_END;
	case 0x1b:								// assert
		p1 = code_getdi( 0 );
		if ( p1 ) break;
		hspctx->runmode = RUNMODE_ASSERT;
		return RUNMODE_ASSERT;
	case 0x11:								// stop
		hspctx->runmode = RUNMODE_STOP;
		return RUNMODE_STOP;
#if 0
	case 0x12:								// newmod
	case 0x13:								// setmod
		{
		char *p;
		PVal *pval;
		APTR aptr;
		FlexValue *fv;
		STRUCTDAT *st;
		STRUCTPRM *prm;
		if ( cmd == 0x12 ) {
			pval = code_getpval();
			aptr = code_newstruct( pval );
		} else {
			aptr = code_getva( &pval );
		}
		st = code_getstruct();
		fv = code_setvs( pval, aptr, NULL, st->size, st->prmindex );
		fv->type = FLEXVAL_TYPE_ALLOC;
		p = sbAlloc( fv->size );
		fv->ptr = (void *)p;
		prm = &hspctx->mem_minfo[ st->prmindex ];
		if ( prm->mptype != MPTYPE_STRUCTTAG ) throw HSPERR_STRUCT_REQUIRED;
		code_expandstruct( p, st, CODE_EXPANDSTRUCT_OPT_NONE );
		if ( prm->offset != -1 ) {
			modvar_init.magic = MODVAR_MAGICCODE;
			modvar_init.subid = prm->subid;
			modvar_init.pval = pval;
			modvar_init.aptr = aptr;
			return code_callfunc( prm->offset );
		}
		break;
		}
	case 0x14:								// delmod
		{
		PVal *pval;
		APTR aptr;
		aptr = code_getva( &pval );
		if ( pval->flag != TYPE_STRUCT ) throw HSPERR_TYPE_MISMATCH;
		code_delstruct( pval, aptr );
		break;
		}
#endif

/*
	case 0x15:								// alloc
		{
		PVal *pval;
		pval = code_getpval();
		p1 = code_getdi( 0 );
		if ( p1 <= 64 ) p1 = 64;
		HspVarCoreDim( pval, TYPE_STRING, 1, 0, 0, 0 );
		HspVarCoreAllocBlock( pval, HspVarCorePtrAPTR( pval, 0 ), p1 );
		break;
		}
*/
	case 0x16:								// mref
		{
		PVal *pval_m;
		pval_m = code_getpval();
		p1 = code_geti();
		cmdfunc_mref( pval_m, p1 );
		break;
		}
	case 0x17:								// run
		sbStrCopy( &hspctx->refstr, code_gets() );
		code_stmpstr( code_getds("") );
		throw HSPERR_EXITRUN;

	case 0x18:								// exgoto
		{
		PVal *pval;
		APTR aptr;
		int *ival;
		int i;
		unsigned short *label;
		unsigned short *label2;
		label2 = code_getlb();
		aptr = code_getva( &pval );
		if ( pval->flag != HSPVAR_FLAG_INT ) throw HSPERR_TYPE_MISMATCH;
		ival = (int *)HspVarCorePtrAPTR( pval, aptr );
		p1=code_getdi( 0 );
		p2=code_getdi( 0 );
		label = code_getlb2();
		i = 0;
		if ( p1 >= 0 ) {
			if ( (*ival) >= p2 ) i++;
		} else {
			if ( (*ival) <= p2 ) i++;
		}
		if ( i ) {
			code_setpc( label);
		} else {
			code_setpc( label2);
		}
		break;
		}

	case 0x19:								// on
		{
		unsigned short *label;
		unsigned short *otbak;
		p1=code_getdi( 0 );
		if ( type != TYPE_PROGCMD ) throw HSPERR_SYNTAX;
		if ( val >= 0x02 ) throw HSPERR_SYNTAX;	// goto/gosub�ȊO�̓G���[
		p2 = 0; p3 = val; otbak = NULL;
		code_next();
		while( (exflg&EXFLG_1)==0 ) {
			label = code_getlb2();
			if ( p1 == p2 ) {
				if ( p3 ) {
					otbak = label;			// on�`gosub
				} else {
					code_setpc( label);		// on�`goto
					break;
				}
			}
			p2++;
		}
		if ( otbak != NULL ) code_call( otbak );
		break;
		}

	case 0x1a:								// mcall
		{
		PVal *pval;
		HspVarProc *varproc;
		pval = code_getpval();
		varproc = HspVarCoreGetProc( pval->flag );
		varproc->ObjectMethod( pval );
		break;
		}
	case 0x1c:								// logmes
		strcpy( hspctx->stmp, code_gets() );
		hspctx->runmode = RUNMODE_LOGMES;
		return RUNMODE_LOGMES;

	default:
		throw HSPERR_UNSUPPORTED_FUNCTION;
	}
	return RUNMODE_RUN;
}


static void *reffunc_sysvar( int *type_res, int arg )
{
	//		reffunc : TYPE_SYSVAR
	//		(�����V�X�e���ϐ�)
	//
	void *ptr;

	//		�Ԓl�̃^�C�v��ݒ肷��
	//
	*type_res = HSPVAR_FLAG_INT;			// �Ԓl�̃^�C�v���w�肷��
	ptr = &reffunc_intfunc_ivalue;			// �Ԓl�̃|�C���^

	switch( arg ) {

	//	int function
	case 0x000:								// system
		reffunc_intfunc_ivalue = 0;
		break;
	case 0x001:								// hspstat
		reffunc_intfunc_ivalue = hspctx->hspstat;
		break;
	case 0x002:								// hspver
		reffunc_intfunc_ivalue = vercode | mvscode;
		break;
	case 0x003:								// stat
		reffunc_intfunc_ivalue = hspctx->stat;
		break;
	case 0x004:								// cnt
		reffunc_intfunc_ivalue = hspctx->mem_loop[hspctx->looplev].cnt;
		break;
	case 0x005:								// err
		reffunc_intfunc_ivalue = hspctx->err;
		break;
	case 0x006:								// strsize
		reffunc_intfunc_ivalue = hspctx->strsize;
		break;
	case 0x007:								// looplev
		reffunc_intfunc_ivalue = hspctx->looplev;
		break;
	case 0x008:								// sublev
		reffunc_intfunc_ivalue = hspctx->sublev;
		break;

	case 0x009:								// iparam
		reffunc_intfunc_ivalue = hspctx->iparam;
		break;
	case 0x00a:								// wparam
		reffunc_intfunc_ivalue = hspctx->wparam;
		break;
	case 0x00b:								// lparam
		reffunc_intfunc_ivalue = hspctx->lparam;
		break;
	case 0x00c:								// refstr
		*type_res = HSPVAR_FLAG_STR;
		ptr = (void *)hspctx->refstr;
		break;
	case 0x00d:								// refdval
		*type_res = HSPVAR_FLAG_DOUBLE;
		ptr = (void *)&hspctx->refdval;
		break;

	default:
		throw HSPERR_UNSUPPORTED_FUNCTION;
	}
	return ptr;
}



/*------------------------------------------------------------*/
/*
		controller
*/
/*------------------------------------------------------------*/

static void hsp3typeinit_var( HSP3TYPEINFO *info )
{
	//info->cmdfunc = cmdfunc_var;
}

static void hsp3typeinit_prog( HSP3TYPEINFO *info )
{
	info->cmdfunc = cmdfunc_prog;
}

static void hsp3typeinit_ifcmd( HSP3TYPEINFO *info )
{
	//info->cmdfunc = cmdfunc_ifcmd;
}

static void hsp3typeinit_sysvar( HSP3TYPEINFO *info )
{
	info->reffunc = reffunc_sysvar;
}

static void hsp3typeinit_custom( HSP3TYPEINFO *info )
{
	info->cmdfunc = cmdfunc_custom;
	info->reffunc = reffunc_custom;
}

static void hsp3typeinit_default( int type )
{
	//		typeinfo�̏�����
	HSP3TYPEINFO *info;
	info = GetTypeInfoPtr( type );
	info->type = type;
	info->option = 0;
	info->hspctx = hspctx;
	info->hspexinfo = hspctx->exinfo2;
	info->cmdfunc = cmdfunc_default;
	info->reffunc = NULL;
	info->termfunc = NULL;
	info->eventfunc = NULL;
}


HSP3TYPEINFO *code_gettypeinfo( int type )
{
	//		�w�肳�ꂽ�^�C�v��HSP3TYPEINFO�\���̂��擾���܂��B
	//		( type���}�C�i�X�̏ꍇ�́A�V�KtypeID�𔭍s )
	//
	int id;
	HSP3TYPEINFO *info;
	id = type;
	if ( id < 0 ) {
		id = tinfo_cur++;
		hsp3tinfo = (HSP3TYPEINFO *)sbExpand( (char *)hsp3tinfo, sizeof(HSP3TYPEINFO) * tinfo_cur );
		hsp3typeinit_default( id );
	}
	info = GetTypeInfoPtr( id );
	return info;
}


void code_setctx( HSPCTX *ctx )
{
	//		HSP�R���e�L�X�g��ݒ�
	//
	hspctx = ctx;
}


HSPCTX *code_getctx( void )
{
	return hspctx;
}


void code_def_msgfunc(HSPCTX *ctx )
{
	//	�f�t�H���g��HSP���b�Z�[�W�R�[���o�b�N
	//
	ctx->runmode = RUNMODE_END;
}


void code_resetctx( HSPCTX *ctx )
{
	//		�R���e�L�X�g�̃��Z�b�g(�I�u�W�F�N�g���[�h��̏�����)
	//
	mpval_int = HspVarCoreGetPVal(HSPVAR_FLAG_INT);
	HspVarCoreClearTemp( mpval_int, HSPVAR_FLAG_INT );	// int�^�̃e���|������������

	ctx->err = HSPERR_NONE;
#ifdef HSPDEBUG
	ctx->hspstat = HSPSTAT_DEBUG;
#else
	ctx->hspstat = 0;
#endif
	ctx->waitbase = 5;
	ctx->lasttick = 0;
	ctx->looplev = 0;
	ctx->sublev = 0;
	ctx->stat = 0;
	ctx->strsize = 0;
	ctx->runmode = RUNMODE_RUN;
	ctx->prmstack = NULL;
	ctx->note_pval = NULL;
	ctx->notep_pval = NULL;
	ctx->msgfunc = code_def_msgfunc;
}


void code_enable_typeinfo( HSP3TYPEINFO *info )
{
	//		typeinfo��L���ɂ���(�I�v�V�����`�F�b�N)
	//
	hspevent_opt |= info->option;
}


static inline HspVarProc *HspFunc_getproc( int id )
{
	return (&hspvarproc[id]);
}


HSPERROR code_geterror( void )
{
	return hspctx->err;
}

void code_setpc( const unsigned short *pc )
{
	//		�v���O�����J�E���^��ݒ�
	//
	//mcs = (unsigned short *)pc;
	//code_next();
	TaskSwitch( (int)pc );
	hspctx->runmode = RUNMODE_RUN;
}

void code_setpci( const unsigned short *pc )
{
	//		�v���O�����J�E���^��ݒ�(interrput)
	//
	code_setpc( pc );
	hspctx->runmode = RUNMODE_INTJUMP;
}

void code_call( const unsigned short *pc )
{
	//		�T�u���[�`���W�����v���s�Ȃ�
	//
	mcs = (unsigned short *)GetTaskID();
	//mcs = mcsbak;
	cmdfunc_gosub( (unsigned short *)pc, mcs );
	hspctx->runmode = RUNMODE_RUN;
}


//
//		Error report routines
//
int code_getdebug_line( void )
{
	//		Get current debug line info
	//		(�Ō�Ɏ��s�����ꏊ������)
	//			result :  0=none  others=line#
	//
#ifdef HSPDEBUG
	unsigned char *mem_di;
	unsigned char ofs;
	int cl,a,tmp,curpt,debpt;

	mem_di = hspctx->mem_di;
	curpt = (int)( mcsbak - ( hspctx->mem_mcs ) );
	debpt=0;
	if ( mem_di[0]==255) return -1;

	cl=0;a=0;
	while(1) {
		ofs=mem_di[a++];
		switch( ofs ) {
		case 252:
			debpt+=(mem_di[a+1]<<8)+mem_di[a];
			a+=2;
			break;
		case 253:
			a+=5;
			break;
		case 254:
			tmp = (mem_di[a+2]<<16)+(mem_di[a+1]<<8)+mem_di[a];
			if ( tmp ) srcname = tmp;
			cl=(mem_di[a+4]<<8)+mem_di[a+3];
			a+=5;
			break;
		case 255:
			return -1;
		default:
			debpt+=ofs;
			if (curpt<=debpt) return cl;
			cl++;
			break;
		}
	}
	return cl;
#else
	return -1;
#endif
}


int code_debug_init( void )
{
	//		mem_di_val���X�V
	//
	unsigned char ofs;
	unsigned char *mem_di;
	int cl,a;

	cl=0;a=0;
	mem_di_val = NULL;
	mem_di = hspctx->mem_di;
	if ( mem_di[0]==255) return -1;
	while(1) {
		ofs=mem_di[a++];
		switch( ofs ) {
		case 252:
			a+=2;
			break;
		case 253:
			mem_di_val=&mem_di[a-1];
			return 0;
		case 254:
			cl=(mem_di[a+4]<<8)+mem_di[a+3];
			a+=5;
			break;
		case 255:
			return -1;
		default:
			cl++;
			break;
		}
	}
	return cl;
}


char *code_getdebug_varname( int val_id )
{
	unsigned char *mm;
	int i;
	if ( mem_di_val == NULL ) return "";
	mm = mem_di_val + ( val_id * 6 );
	i = (mm[3]<<16)+(mm[2]<<8)+mm[1];
	return strp(i);
}


int code_getdebug_seekvar( const char *name )
{
	unsigned char *mm;
	int i,ofs;
	if ( mem_di_val != NULL ) {
		mm = mem_di_val;
		for(i=0;i<hspctx->hsphed->max_val;i++) {
			ofs = (mm[3]<<16)+(mm[2]<<8)+mm[1];
			if ( strcmp( strp( ofs ), name ) == 0 ) return i;
			mm += 6;
		}
	}
	return -1;
}


char *code_getdebug_name( void )
{
	return strp(srcname);
}


int code_exec_wait( int tick )
{
	//		���ԑ҂�(wait)
	//		(await�ɕϊ����܂�)
	//
	if ( hspctx->waitcount <= 0 ) {
		hspctx->runmode = RUNMODE_RUN;
		return RUNMODE_RUN;
	}
	hspctx->waittick = tick + ( hspctx->waitcount * 10 );
	return RUNMODE_AWAIT;
}


int code_exec_await( int tick )
{
	//		���ԑ҂�(await)
	//
	if ( hspctx->waittick < 0 ) {
		if ( hspctx->lasttick == 0 ) hspctx->lasttick = tick;
		hspctx->waittick = hspctx->lasttick + hspctx->waitcount;
	}
	if ( tick >= hspctx->waittick ) {
		hspctx->lasttick = tick;
		hspctx->runmode = RUNMODE_RUN;
		return RUNMODE_RUN;
	}
	return RUNMODE_AWAIT;
}


/*------------------------------------------------------------*/
/*
		code main interface
*/
/*------------------------------------------------------------*/

static int error_dummy = 0;		// 2.61�݊��̂��߂̃_�~�[�l

static int code_cnv_get( void )
{
	//		�f�[�^���擾(�v���O�C�������p)
	//
	hspctx->exinfo.mpval = &mpval;
	return code_get();
}

static void *code_cnv_getv( void )
{
	//		�ϐ��f�[�^�A�h���X���擾(2.61�݊��p)
	//
	char *ptr;
	int size;
	ptr = code_getvptr( &plugin_pval, &size );
	hspctx->exinfo.mpval = &plugin_pval;
	return (void *)ptr;
}

static int code_cnv_realloc( PVal *pv, int size, int mode )
{
	//		�ϐ��f�[�^�o�b�t�@���g��(2.61�݊��p)
	//
	PDAT *ptr;
	ptr = HspVarCorePtrAPTR( pv, 0 );
	HspVarCoreAllocBlock( pv, ptr, size );
	return 0;
}

void code_init( void )
{
	int i;
	HSPEXINFO *exinfo;

	sbInit();					// �σ������o�b�t�@������
	StackInit();
	HspVarCoreInit();			// �X�g���[�W�R�A������
	hspevent_opt = 0;			// �C�x���g�I�v�V������������
	mpval = HspVarCoreGetPVal(0);
	//mpval_int = HspVarCoreGetPVal(HSPVAR_FLAG_INT);
	
	//		exinfo�̏�����
	//
	exinfo = &mem_exinfo;

	//		2.61�݊��t�B�[���h
	exinfo->ver = vercode;
	exinfo->min = mvscode;
	exinfo->er = &error_dummy;
	exinfo->pstr = hspctx->stmp;
	exinfo->stmp = hspctx->refstr;
	exinfo->strsize = &hspctx->strsize;
	exinfo->refstr = hspctx->refstr;
	exinfo->HspFunc_prm_getv = code_cnv_getv;

	exinfo->HspFunc_val_realloc = code_cnv_realloc;
	exinfo->HspFunc_fread = dpm_read;
	exinfo->HspFunc_fsize = dpm_exist;

	//		���p�t�B�[���h
	exinfo->nptype = &type;
	exinfo->npval = &val;
	exinfo->mpval = &mpval;

	exinfo->HspFunc_prm_geti = code_geti;
	exinfo->HspFunc_prm_getdi = code_getdi;
	exinfo->HspFunc_prm_gets = code_gets;
	exinfo->HspFunc_prm_getds = code_getds;
	exinfo->HspFunc_getbmscr = NULL;
	exinfo->HspFunc_addobj = NULL;
	exinfo->HspFunc_setobj = NULL;
	exinfo->HspFunc_setobj = NULL;

	//		3.0�g���t�B�[���h
	exinfo->hspctx = hspctx;
	exinfo->npexflg = &exflg;
	exinfo->HspFunc_setobj = NULL;

	exinfo->HspFunc_puterror = code_puterror;
	exinfo->HspFunc_getproc = HspFunc_getproc;
	exinfo->HspFunc_seekproc = HspVarCoreSeekProc;
	exinfo->HspFunc_prm_next = code_next;
	exinfo->HspFunc_prm_get = code_cnv_get;
	exinfo->HspFunc_prm_getlb = code_getlb2;
	exinfo->HspFunc_prm_getpval = code_getpval;
	exinfo->HspFunc_prm_getva = code_getva;
	exinfo->HspFunc_prm_setva = code_setva;
	exinfo->HspFunc_prm_getd = code_getd;
	exinfo->HspFunc_prm_getdd = code_getdd;

	exinfo->HspFunc_malloc = sbAlloc;
	exinfo->HspFunc_free = sbFree;
	exinfo->HspFunc_expand = sbExpand;
	exinfo->HspFunc_addirq = code_addirq;
	exinfo->HspFunc_hspevent = code_event;
	exinfo->HspFunc_registvar = HspVarCoreRegisterType;
	exinfo->HspFunc_setpc = code_setpc;
	exinfo->HspFunc_call = code_call;

	exinfo->HspFunc_dim = HspVarCoreDimFlex;
	exinfo->HspFunc_redim = HspVarCoreReDim;
	exinfo->HspFunc_array = HspVarCoreArray;

	//		3.1�g���t�B�[���h
	exinfo->HspFunc_varname = code_getdebug_varname;
	exinfo->HspFunc_seekvar = code_getdebug_seekvar;

	//		HSPCTX�ɃR�s�[����
	//
	memcpy( &hspctx->exinfo, exinfo, sizeof(HSPEXINFO30) );
	hspctx->exinfo2 = exinfo;

	//		�W��typefunc�o�^
	//
	hsp3tinfo = (HSP3TYPEINFO *)sbAlloc( sizeof(HSP3TYPEINFO) * HSP3_FUNC_MAX );
	tinfo_cur = HSP3_FUNC_MAX;
	for(i=0;i<tinfo_cur;i++) {
		hsp3typeinit_default( i );
	}

	//		�����^�C�v�̓o�^
	//
	hsp3typeinit_var( GetTypeInfoPtr( TYPE_VAR ) );
	hsp3typeinit_var( GetTypeInfoPtr( TYPE_STRUCT ) );
	hsp3typeinit_prog( GetTypeInfoPtr( TYPE_PROGCMD ) );
	hsp3typeinit_ifcmd( GetTypeInfoPtr( TYPE_CMPCMD ) );
	hsp3typeinit_sysvar( GetTypeInfoPtr( TYPE_SYSVAR ) );
	hsp3typeinit_intcmd( GetTypeInfoPtr( TYPE_INTCMD ) );
	hsp3typeinit_intfunc( GetTypeInfoPtr( TYPE_INTFUNC ) );
	hsp3typeinit_intfunc( GetTypeInfoPtr( TYPE_INTFUNC ) );
	hsp3typeinit_custom( GetTypeInfoPtr( TYPE_MODCMD ) );

	//		���荞�݂̏�����
	//
	hspctx->mem_irq = NULL;
	hspctx->irqmax = 0;
	for(i=0;i<HSPIRQ_MAX;i++) { code_addirq(); }	// �W�����荞�݂��m��
	code_enableirq( HSPIRQ_USERDEF, 1 );			// �J�X�^���^�C�v�̂�Enable

	//		�v���O�C���ǉ��̏���
	//
	tinfo_cur = HSP3_TYPE_USER;

	//		������o�b�t�@�̏�����
	//
	hspctx->refstr = sbAlloc( HSPCTX_REFSTR_MAX );
	hspctx->fnbuffer = sbAlloc( HSP_MAX_PATH );
	hspctx->stmp = sbAlloc( HSPCTX_REFSTR_MAX );
	hspctx->cmdline = sbAlloc( HSPCTX_CMDLINE_MAX );

#ifdef HSPDEBUG
	//		�f�o�b�O���̏�����
	//
	mem_di_val = NULL;
	dbgmode = HSPDEBUG_NONE;
	dbginfo.hspctx = hspctx;
	dbginfo.line = 0;
	dbginfo.fname = NULL;
	dbginfo.get_value = code_dbgvalue;
	dbginfo.get_varinf = code_dbgvarinf;
	dbginfo.dbg_close = code_dbgclose;
	dbginfo.dbg_curinf = code_dbgcurinf;
	dbginfo.dbg_set = code_dbgset;
#endif


}



void code_termfunc( void )
{
	//		�R�[�h�̏I������
	//
	int i;
	int prmmax;
	STRUCTDAT *st;
	HSP3TYPEINFO *info;
	//PVal *pval;

#if 0
	//		���W���[���ϐ��f�X�g���N�^�Ăяo��
	//
	prmmax = hspctx->hsphed->max_val;
	pval = hspctx->mem_var;
	for(i=0;i<prmmax;i++) {
		if ( pval->flag == HSPVAR_FLAG_STRUCT ) code_delstruct_all( pval );
		pval++;
	}
#endif

	//		�N���[���A�b�v���W���[���̌Ăяo��
	//
	prmmax = hspctx->hsphed->max_finfo / sizeof(STRUCTDAT);
	i = prmmax;
	while(1) {
		i--; if ( i < 0 ) break;
		st = &hspctx->mem_finfo[ i ];
		if (( st->index == STRUCTDAT_INDEX_FUNC )&&( st->funcflag & STRUCTDAT_FUNCFLAG_CLEANUP )) {
			code_callcfunc( i, 0 );
		}
	}

	//		�^�C�v�̏I���֐������ׂČĂяo��
	//
	for(i=tinfo_cur-1;i>=0;i--) {
		info = GetTypeInfoPtr( i );
		if ( info->termfunc != NULL ) info->termfunc( 0 );
	}

}


void code_bye( void )
{
	//		�R�[�h���s���I��
	//
	HspVarCoreBye();

	//		�R�[�h�p�̃��������������
	//
	if ( hspctx->mem_irq != NULL ) sbFree( hspctx->mem_irq );

	sbFree( hspctx->cmdline );
	sbFree( hspctx->stmp );
	sbFree( hspctx->fnbuffer );
	sbFree( hspctx->refstr );

	sbFree( hsp3tinfo );
	StackTerm();
	sbBye();
}


int code_execcmd( void )
{
	//		���s���C�����Ăяo��
	//
	int i;
	if ( hspctx->runmode == RUNMODE_ERROR ) {
		return hspctx->runmode;
	}
	hspctx->runmode = RUNMODE_RUN;

#ifdef HSPERR_HANDLE
	try {
#endif
		while(1) {
			TaskExec();
			if ( hspctx->runmode != 0 ) {
				if ( hspctx->runmode != RUNMODE_RETURN ) {
					hspctx->msgfunc( hspctx );
				}
				if ( hspctx->runmode == RUNMODE_END ) {
					break;
				}
            }
		}
#ifdef HSPERR_HANDLE
	}
#endif

#ifdef HSPERR_HANDLE
	catch( HSPERROR code ) {						// HSP�G���[��O����
		if ( code == HSPERR_NONE ) {
			hspctx->runmode = RUNMODE_END;
		} else {
			i = RUNMODE_ERROR;
			hspctx->err = code;
			hspctx->runmode = i;
			//if ( code_isirq( HSPIRQ_ONERROR ) ) {
			//	code_sendirq( HSPIRQ_ONERROR, 0, (int)code, code_getdebug_line() );
			//	if ( hspctx->runmode != i ) goto rerun;
			//}
			return i;
		}
	}
#endif

#ifdef SYSERR_HANDLE
	catch( ... ) {									// ���̑��̗�O������
		hspctx->err = HSPERR_UNKNOWN_CODE;
		return RUNMODE_ERROR;
	}
#endif

	//Alertf( "RUN=%d",ctx->runmode );
	return hspctx->runmode;
}


int code_execcmd2( void )
{
	//		�����I�Ȏ��s���s�Ȃ�(ENDSESSION�p)
	//
	return code_execcmd();
}



/*------------------------------------------------------------*/
/*
		EVENT controller
*/
/*------------------------------------------------------------*/

static int call_eventfunc( int option, int event, int prm1, int prm2, void *prm3 )
{
	//		�e�^�C�v�̃C�x���g�R�[���o�b�N���Ăяo��
	//
	int i,res;
	HSP3TYPEINFO *info;
	for( i=HSP3_TYPE_USER; i<tinfo_cur; i++) {
		info = GetTypeInfoPtr( i );
		if ( info->option & option ) {
			if ( info->eventfunc != NULL ) {
				res = info->eventfunc( event, prm1, prm2, prm3 );
				if ( res ) return res;
			}
		}
	}
	return 0;
}


static char *dirlist_target;
static short evcategory[]={
0,							// HSPEVENT_NONE
HSPEVENT_ENABLE_COMMAND,	// HSPEVENT_COMMAND
HSPEVENT_ENABLE_HSPIRQ,		// HSPEVENT_HSPIRQ
HSPEVENT_ENABLE_GETKEY,		// HSPEVENT_GETKEY
HSPEVENT_ENABLE_GETKEY,		// HSPEVENT_STICK
HSPEVENT_ENABLE_FILE,		// HSPEVENT_FNAME
HSPEVENT_ENABLE_FILE,		// HSPEVENT_FREAD
HSPEVENT_ENABLE_FILE,		// HSPEVENT_FWRITE
HSPEVENT_ENABLE_FILE,		// HSPEVENT_FEXIST
HSPEVENT_ENABLE_FILE,		// HSPEVENT_FDELETE
HSPEVENT_ENABLE_FILE,		// HSPEVENT_FMKDIR
HSPEVENT_ENABLE_FILE,		// HSPEVENT_FCHDIR
HSPEVENT_ENABLE_FILE,		// HSPEVENT_FCOPY
HSPEVENT_ENABLE_FILE,		// HSPEVENT_FDIRLIST1
HSPEVENT_ENABLE_FILE,		// HSPEVENT_FDIRLIST2
HSPEVENT_ENABLE_PICLOAD,	// HSPEVENT_GETPICSIZE
HSPEVENT_ENABLE_PICLOAD,	// HSPEVENT_PICLOAD
};

int code_event( int event, int prm1, int prm2, void *prm3 )
{
	//		HSP�����C�x���g���s
	//		(result:0=Not care/1=Done)
	//
	int res;
	res = call_eventfunc( evcategory[event], event, prm1, prm2, prm3 ); 
	if ( res ) return res;

	switch( event ) {
	case HSPEVENT_COMMAND:
		// All commands (type,val,n/a)
		break;

	case HSPEVENT_HSPIRQ:
		// HSP Interrupt (IRQid,iparam,param_ptr)
		code_execirq( (IRQDAT *)prm3, prm1, prm2 );
		break;

	case HSPEVENT_GETKEY:
		// Key input (IDcode,option,resval ptr)
	case HSPEVENT_STICK:
		// Stick input (IDcode,option,resval ptr)
		break;

	case HSPEVENT_FNAME:
		// set FNAME (n/a,n/a,nameptr)
		strncpy( hspctx->fnbuffer, (char *)prm3, HSP_MAX_PATH-1 );
#ifdef HSP3IMP
		//	HSP3IMP�p�Z�L�����e�B�Ή�
		if ( SecurityCheck( hspctx->fnbuffer ) ) throw HSPERR_FILE_IO;
#endif
		break;
	case HSPEVENT_FREAD:
		// fread (fseek,size,loadptr)
		res = dpm_read( hspctx->fnbuffer, prm3, prm2, prm1 );
		if ( res < 0 ) throw HSPERR_FILE_IO;
		hspctx->strsize = res;
		break;
	case HSPEVENT_FWRITE:
		// fwrite (fseek,size,saveptr)
		res = mem_save( hspctx->fnbuffer, prm3, prm2, prm1 );
		if ( res < 0 ) throw HSPERR_FILE_IO;
		hspctx->strsize = res;
		break;
	case HSPEVENT_FEXIST:
		// exist (n/a,n/a,n/a)
		hspctx->strsize = dpm_exist( hspctx->fnbuffer );
		break;
	case HSPEVENT_FDELETE:
		// delete (n/a,n/a,n/a)
#ifdef HSP3IMP
		//	HSP3IMP�p�Z�L�����e�B�Ή�
		throw HSPERR_FILE_IO;
#endif
		if ( delfile( hspctx->fnbuffer ) == 0 ) throw HSPERR_FILE_IO;
		break;
	case HSPEVENT_FMKDIR:
		// mkdir (n/a,n/a,n/a)
		if ( makedir( hspctx->fnbuffer ) ) throw HSPERR_FILE_IO;
		break;
	case HSPEVENT_FCHDIR:
		// chdir (n/a,n/a,n/a)
		if ( changedir( hspctx->fnbuffer ) ) throw HSPERR_FILE_IO;
		break;
	case HSPEVENT_FCOPY:
		// bcopy (n/a,n/a,dst filename)
		if ( dpm_filecopy( hspctx->fnbuffer, (char *)prm3 ) ) throw HSPERR_FILE_IO;
		break;
	case HSPEVENT_FDIRLIST1:
		// dirlist1 (opt,n/a,result ptr**)
		{
		char **p;
		dirlist_target = sbAlloc( 0x1000 );
		hspctx->stat = dirlist( hspctx->fnbuffer, &dirlist_target, prm1 );
		p = (char **)prm3;
		*p = dirlist_target;
		break;
		}
	case HSPEVENT_FDIRLIST2:
		// dirlist2 (n/a,n/a,n/a)
		sbFree( dirlist_target );
		break;

	case HSPEVENT_GETPICSIZE:
		// getpicsize (n/a,n/a,resval ptr)
		break;
	case HSPEVENT_PICLOAD:
		// picload (n/a,n/a,HDC)
		break;

	}
	return 0;
}


void code_bload( char *fname, int ofs, int size, void *ptr )
{
	code_event( HSPEVENT_FNAME, 0, 0, fname );
	code_event( HSPEVENT_FREAD, ofs, size, ptr );
}


void code_bsave( char *fname, int ofs, int size, void *ptr )
{
	code_event( HSPEVENT_FNAME, 0, 0, fname );
	code_event( HSPEVENT_FWRITE, ofs, size, ptr );
}


/*------------------------------------------------------------*/
/*
		IRQ controller
*/
/*------------------------------------------------------------*/

IRQDAT *code_getirq( int id )
{
	return &hspctx->mem_irq[ id ];
}


void code_enableirq( int id, int sw )
{
	//		IRQ�̗L���E�����؂�ւ�
	//
	IRQDAT *irq;
	irq = code_getirq( id );
	if ( sw == 0 ) {
		irq->flag = IRQ_FLAG_DISABLE;
	} else {
		irq->flag = IRQ_FLAG_ENABLE;
	}
}


void code_setirq( int id, int opt, int custom, unsigned short *ptr )
{
	//		IRQ�C�x���g��ݒ肷��
	//
	IRQDAT *irq;
	irq = code_getirq( id );
	irq->flag = IRQ_FLAG_ENABLE;
	irq->opt = opt;
	irq->ptr = ptr;
	irq->custom = custom;
}


int code_isirq( int id )
{
	//		�w�肵��IRQ�C�x���g��ENABLE���𒲂ׂ�
	//
	if ( hspctx->mem_irq[ id ].flag != IRQ_FLAG_ENABLE ) return 0;
	return 1;
}


int code_sendirq( int id, int iparam, int wparam, int lparam )
{
	//		�w�肵��IRQ�C�x���g�𔭐�
	//
	IRQDAT *irq;
	irq = code_getirq( id );
	irq->iparam = iparam;
	code_event( HSPEVENT_HSPIRQ, wparam, lparam, irq );
	return hspctx->runmode;
}


int code_isuserirq( void )
{
	//		�J�X�^���w���IRQ�C�x���g�����邩�ǂ������ׂ�
	//
	if ( hspctx->irqmax > HSPIRQ_USERDEF ) {
		if ( hspctx->mem_irq[ HSPIRQ_USERDEF ].flag == IRQ_FLAG_ENABLE ) return 1;
	}
	return 0;
}


int code_irqresult( int *value )
{
	//		IRQ�C�x���g�̖߂�l���擾����
	//
	*value = ( hspctx->stat );
	return ( hspctx->retval_level );
}


int code_checkirq( int id, int message, int wparam, int lparam )
{
	//		�w�肵�����b�Z�[�W�ɑΉ�����C�x���g�𔭐�
	//
	int i,cur;
	IRQDAT *irq;
	for( i=HSPIRQ_MAX; i<hspctx->irqmax; i++ ) {
		irq = &hspctx->mem_irq[ i ];
		if ( irq->custom == message ) {
			if ( irq->custom2 == id ) {
				if ( irq->flag == IRQ_FLAG_ENABLE ) {
					hspctx->intwnd_id = id;
					hspctx->retval_level = 0;
					cur = hspctx->sublev + 1;
					if ( irq->callback != NULL ) {
						irq->callback( irq, wparam, lparam );
					} else {
						code_sendirq( i, irq->custom, wparam, lparam );
						if ( hspctx->retval_level != cur ) return 0;		// return�̖߂�l���Ȃ����0��Ԃ�
					}
					return 1;
				}
			}
		}
	}
	return 0;
}


IRQDAT *code_seekirq( int actid, int custom )
{
	//		�w�肵��custom������IRQ����������
	//
	int i;
	IRQDAT *irq;
	for( i=0; i<hspctx->irqmax; i++ ) {
		irq = code_getirq( i );
		if ( irq->flag != IRQ_FLAG_NONE ) {
			if (( irq->custom == custom )&&( irq->custom2 == actid )) {
				if ( irq->opt != IRQ_OPT_CALLBACK ) return irq;
			}
		}
	}
	return NULL;
}


IRQDAT *code_addirq( void )
{
	//		IRQ��ǉ�����
	//
	int id;
	IRQDAT *irq;
	id = hspctx->irqmax++;
	if ( hspctx->mem_irq == NULL) {
		hspctx->mem_irq = (IRQDAT *)sbAlloc( sizeof(IRQDAT) );
	} else {
		hspctx->mem_irq = (IRQDAT *)sbExpand( (char *)hspctx->mem_irq, sizeof(IRQDAT) * (hspctx->irqmax) );
	}
	irq = code_getirq( id );
	irq->flag = IRQ_FLAG_DISABLE;
	irq->opt = IRQ_OPT_GOTO;
	irq->custom = -1;
	irq->iparam = 0;
	irq->ptr = NULL;
	irq->callback = NULL;
	return irq;
}


void code_execirq( IRQDAT *irq, int wparam, int lparam )
{
	//		IRQ�����s����
	//
	hspctx->iparam = irq->iparam;
	hspctx->wparam = wparam;
	hspctx->lparam = lparam;
	if ( irq->opt == IRQ_OPT_GOTO ) {
		code_setpci( irq->ptr );
	}
	if ( irq->opt == IRQ_OPT_GOSUB ) {
		code_call( irq->ptr );
	}
	//Alertf("sublev%d", hspctx->sublev );
}


/*------------------------------------------------------------*/
/*
		Debug support
*/
/*------------------------------------------------------------*/

#ifdef HSPDEBUG

static char *dbgbuf;

/*
	rev 49
	BT#190: return���߂֒�����������w�肷��ƃ������A�N�Z�X�ᔽ���N����
	�ɑΏ��B

	���ۂ̓f�o�b�O�E�B���h�E�ŕϐ����e�ȊO�̒����������\������ƃo�b�t�@�I�[�o�[�t���[���N���Ă����B
*/

static void code_adddbg3( char const * s1, char const * sep, char const * s2 )
{
	char tmp[ 2048 ];
	strncpy( tmp, s1, 64 );
	strncat( tmp, sep, 8 );
	strncat( tmp, s2, 1973 );
	strcat( tmp, "\r\n" );
	sbStrAdd( &dbgbuf, tmp );
}


void code_adddbg( char * name, char * str )
{
	code_adddbg3( name, "\r\n", str );
}


void code_adddbg2( char * name, char * str )
{
	code_adddbg3( name, ":", str );
}


void code_adddbg( char *name, double val )
{
	char tmp[ 400 ];
	sprintf( tmp, "%-36.16f", val );
	code_adddbg( name, tmp );
}


void code_adddbg( char *name, int val )
{
	char tmp[32];
#ifdef HSPWIN
	itoa( val, tmp, 10 );
#else
	sprintf( tmp, "%d", val);
#endif
	code_adddbg( name, tmp );
}


void code_adddbg2( char *name, int val )
{
	char tmp[32];
#ifdef HSPWIN
	itoa( val, tmp, 10 );
#else
	sprintf( tmp, "%d", val);
#endif
	code_adddbg2( name, tmp );
}


char *code_inidbg( void )
{
	dbgbuf = sbAlloc( 0x4000 );
	return dbgbuf;
}


void code_dbg_global( void )
{
	HSPHED *hed;
	hed = hspctx->hsphed;
	code_adddbg( "ax�T�C�Y", hed->allsize );
	code_adddbg( "�R�[�h�T�C�Y", hed->max_cs );
	code_adddbg( "�f�[�^�T�C�Y", hed->max_ds );
	code_adddbg( "�ϐ��\��", hed->max_val );
	code_adddbg( "���s���[�h", hspctx->runmode );
	code_adddbg( "stat", hspctx->stat );
	code_adddbg( "cnt", hspctx->mem_loop[hspctx->looplev].cnt );
	code_adddbg( "looplev", hspctx->looplev );
	code_adddbg( "sublev", hspctx->sublev );
	code_adddbg( "iparam", hspctx->iparam );
	code_adddbg( "wparam", hspctx->wparam );
	code_adddbg( "lparam", hspctx->lparam );
	code_adddbg( "refstr", hspctx->refstr );
	code_adddbg( "refdval", hspctx->refdval );
}


/*
	rev 53
	���������B
*/

static void code_dbgdump( char const * mem, int size )
{
	//		memory Hex dump
	//
	int adr = 0;
	char t[ 512 ];
	char tline[ 1024 ];
	while ( adr < size ) {
		sprintf( tline, "%04X", adr );
		for ( int i = 0; i < 8 && adr < size; ++i, ++adr ) {
			sprintf( t, " %02X", static_cast< unsigned char >( mem[ adr ] ) );
			strcat( tline, t );
		}
		strcat( tline, "\r\n" );
		sbStrAdd( &dbgbuf, tline );
	}
}


static void code_dbgvarinf_ext( PVal *pv, void *src, char *buf )
{
	//		����ȕϐ��̓��e���擾
	//		(256bytes���x�̃o�b�t�@���m�ۂ��Ă����ĉ�����)
	//
	switch( pv->flag ) {
	case HSPVAR_FLAG_LABEL:
		sprintf( buf,"LABEL $%08x", *(int *)src ); 
		break;
	case HSPVAR_FLAG_STRUCT:
		{
		FlexValue *fv;
		fv = (FlexValue *)src;
		if ( fv->type == FLEXVAL_TYPE_NONE ) {
			sprintf( buf,"STRUCT (Empty)" ); 
		} else {
			sprintf( buf,"STRUCT ID%d-%d PTR$%08x SIZE%d(%d)", fv->myid, fv->customid, (int)fv->ptr, fv->size, fv->type ); 
		}
		break;
		}
	case HSPVAR_FLAG_COMSTRUCT:
		sprintf( buf,"COMPTR $%08x", *(int *)src ); 
		break;
	default:
		strcpy( buf, "Unknown" );
		break;
	}
}


static void code_arraydump( PVal *pv )
{
	//		variable array dump
	//
	char t[512];
	PDAT *src;
	char *p;
	int ofs;
	int amax;
	int ok;

	amax = pv->len[1];
	if ( amax <= 1 ) return;
	if ( amax > 16 ) {
		sbStrAdd( &dbgbuf, "(�z��̈ꕔ������\��)\r\n" );
		amax = 16;
	}

	for(ofs=0;ofs<amax;ofs++) {

		src = HspVarCorePtrAPTR( pv, ofs );
		ok = 1;
		try {
			p = (char *)HspVarCoreCnv( pv->flag, HSPVAR_FLAG_STR, src );
		} catch(...) {
			char tmpbuf[256];
			code_dbgvarinf_ext( pv, src, tmpbuf );
			sprintf( t,"(%d)=%s\r\n", ofs, tmpbuf ); 
			ok = 0;
		}
		if ( ok ) {
			if ( strlen(p) > 63 ) {
				strncpy( hspctx->stmp, p, 63 );
				hspctx->stmp[64]=0;
				p = hspctx->stmp;
			}
			sprintf( t,"(%d)=%s\r\n", ofs, p ); 
		}
		sbStrAdd( &dbgbuf, t );
	}
}


char *code_dbgvarinf( char *target, int option )
{
	//		�ϐ����擾
	//		option
	//			bit0 : sort ( �󂯑��ŏ��� )
	//			bit1 : module
	//			bit2 : array
	//			bit3 : dump
	//
	int i,id,max;
	char *name;
	HspVarProc *proc;
	PVal *pv;
	PDAT *src;
	char *p;
	char *padr;
	char tmp[256];
	int size;
	int orgsize;

	code_inidbg();
	max = hspctx->hsphed->max_val;

	if ( target == NULL ) {
		for(i=0;i<max;i++) {
			name = code_getdebug_varname( i );
			if ( strstr2( name, "@" ) != NULL ) {
				if (!( option & 2 )) name = NULL;
			}
			if ( name != NULL ) {
				sbStrAdd( &dbgbuf, name );
				sbStrAdd( &dbgbuf, "\r\n" );
			}
		}
		return dbgbuf;
	}

	id = 0;
	while(1) {
		if ( id >= max ) break;
		name = code_getdebug_varname(id);
		if ( strcmp( name, target ) == 0 ) break;
		id++;
	}

	pv = &hspctx->mem_var[id];
	proc = HspVarCoreGetProc(pv->flag);
	code_adddbg2( "�ϐ���", name );
	code_adddbg2( "�^", proc->vartype_name );
	sprintf( tmp, "(%d,%d,%d,%d)",pv->len[1],pv->len[2],pv->len[3],pv->len[4] );
	code_adddbg2( "�z��", tmp );
	code_adddbg2( "���[�h", pv->mode );
	code_adddbg2( "�g�p�T�C�Y", pv->size );

	HspVarCoreReset( pv );
	src = proc->GetPtr( pv );
	padr = (char *)proc->GetBlockSize( pv, src, &size );
	code_adddbg2( "�o�b�t�@�T�C�Y", size );

	switch( pv->flag ) {
	case HSPVAR_FLAG_STR:
	case HSPVAR_FLAG_DOUBLE:
	case HSPVAR_FLAG_INT:
		if ( pv->flag != HSPVAR_FLAG_STR ) {
			p = (char *)HspVarCoreCnv( pv->flag, HSPVAR_FLAG_STR, src );
		} else {
			p = padr;
		}
		orgsize = (int)strlen(p);
		if ( orgsize >= 1024 ) {
			strncpy( hspctx->stmp, p, 1023 );
			p = hspctx->stmp; p[1023] = 0;
			sprintf( tmp, "(���e%dbytes�̈ꕔ��\�����Ă��܂�)\r\n",orgsize );
			sbStrAdd( &dbgbuf, tmp );
		}
		code_adddbg( "���e:", p );
		break;
	case HSPVAR_FLAG_LABEL:
	default:
		{
		char tmpbuf[256];
		code_dbgvarinf_ext( pv, src, tmpbuf );
		code_adddbg( "���e:", tmpbuf );
		break;
		}
	}

	if ( option & 4 ) {
		code_arraydump( pv );
	}
	if ( option & 8 ) {
		if ( size > 0x1000 ) size = 0x1000;
		code_dbgdump( padr, size );
	}


	return dbgbuf;
}


void code_dbgcurinf( void )
{
	unsigned short *bak;
	bak = mcsbak;
	mcsbak = mcs;
	dbginfo.line = code_getdebug_line();
	dbginfo.fname = code_getdebug_name();
	mcsbak = bak;
}


void code_dbgclose( char *buf )
{
	sbFree( dbgbuf );
}


HSP3DEBUG *code_getdbg( void )
{
	return &dbginfo;
}


char *code_dbgvalue( int type )
{
	//	�_�~�[�p�֐�
	return code_inidbg();
}


int code_dbgset( int id )
{
	//	�f�o�b�O���[�h�ݒ�
	//
	switch( hspctx->runmode ) {
	case RUNMODE_STOP:
		if ( id != HSPDEBUG_STOP ) {
			hspctx->runmode = RUNMODE_RUN;
			if ( id == HSPDEBUG_RUN ) {
				dbgmode = HSPDEBUG_NONE;
			} else {
				dbgmode = id;
			}
			return 0;
		}
		break;
	case RUNMODE_WAIT:
	case RUNMODE_AWAIT:
		if ( id == HSPDEBUG_STOP ) {
			hspctx->runmode = RUNMODE_STOP;
			dbgmode = HSPDEBUG_NONE;
			return 0;
		}
		break;
	}
	return -1;
}


void code_dbgtrace( void )
{
	//	�g���[�X����
	//
	int i;
	i = dbginfo.line;
	code_dbgcurinf();
	if ( i != dbginfo.line ) {
		hspctx->runmode = RUNMODE_STOP;
		hspctx->msgfunc( hspctx );
	}
}

#endif


