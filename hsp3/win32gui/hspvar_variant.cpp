
//
//	HSPVAR core module
//	onion software/onitama 2004/10
//

#ifndef HSP_COM_UNSUPPORTED		//�iCOM �T�|�[�g�Ȃ��ł̃r���h���̓t�@�C���S�̂𖳎��j

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include <ocidl.h>

#include "../hsp3code.h"
#include "../hsp3struct.h"
#include "../hsp3ext.h"
#include "../hspvar_core.h"
#include "comobj.h"
#include "hspvar_comobj.h"
#include "hspvar_variant.h"
#include "comobj_event.h"
#include "../strbuf.h"
#include "../supio.h"


/*------------------------------------------------------------*/
/*
		HSPVAR core interface (COM Object)
*/
/*------------------------------------------------------------*/

static HspVarProc *myproc;

// Core
static PDAT *HspVarVariant_GetPtr( PVal *pval )
{
	return (PDAT *)(( (VARIANT *)(pval->pt))+pval->offset);
}

static void *HspVarVariant_Cnv( const void *buffer, int flag )
{
	//		���N�G�X�g���ꂽ�^ -> �����̌^�ւ̕ϊ����s�Ȃ�
	//		(�g�ݍ��݌^�ɂ̂ݑΉ���OK)
	//		(�Q�ƌ��̃f�[�^��j�󂵂Ȃ�����)
	//
	throw HSPERR_INVALID_TYPE;
	return (void *)buffer;
}


static void *HspVarVariant_CnvCustom( const void *buffer, int flag )
{
	//		(�J�X�^���^�C�v�̂�)
	//		�����̌^ -> ���N�G�X�g���ꂽ�^ �ւ̕ϊ����s�Ȃ�
	//		(�g�ݍ��݌^�ɑΉ�������)
	//		(�Q�ƌ��̃f�[�^��j�󂵂Ȃ�����)
	//
	throw HSPERR_INVALID_TYPE;
	return (void *)buffer;
}


static void HspVarVariant_Free( PVal *pval )
{
	//		PVAL�|�C���^�̕ϐ����������������
	//
	VARIANT *var;

#ifdef HSP_COMOBJ_DEBUG
	if ( pval->support & HSPVAR_SUPPORT_TEMPVAR ) {
		COM_DBG_MSG( "HspVarVariant_Free() : * HSPVAR_SUPPORT_TEMPVAR *\n" );
	} else {
		COM_DBG_MSG( "HspVarVariant_Free()\n" );
	}
#endif

	if ( pval->mode == HSPVAR_MODE_MALLOC ) {
		if ( (pval->support & HSPVAR_SUPPORT_TEMPVAR) == 0 ) {
			int count = HspVarCoreCountElems(pval);
			var = (VARIANT *)pval->pt;
			for (int i=0; i<count; i++) {
				VariantClear( &var[i] );
			}
		}
		sbFree( pval->pt );
	}
	if ( pval->master ) sbFree( pval->master );
	pval->master = NULL;
	pval->pt   = NULL;
	pval->flag = HSPVAR_MODE_NONE;
}

static void HspVarVariant_Alloc( PVal *pval, const PVal *pval2 )
{
	//		pval�ϐ����K�v�Ƃ���T�C�Y���m�ۂ���B
	//		(pval�����łɊm�ۂ���Ă��郁��������͌Ăяo�������s�Ȃ�)
	//		(pval2��NULL�̏ꍇ�́A�V�K�f�[�^)
	//		(pval2���w�肳��Ă���ꍇ�́Apval2�̓��e���p�����čĊm��)
	//
	int count,size;
	VARIANT *var;
#ifdef HSP_COMOBJ_DEBUG
	COM_DBG_MSG( "HspVarVariant_Alloc()\n" );
#endif
	if ( pval->len[1] < 1 ) pval->len[1] = 1;		// �z����Œ� 1 �͊m�ۂ���
	count = HspVarCoreCountElems(pval);
	size  = count * sizeof( VARIANT );
	var = (VARIANT *)sbAlloc( size );
	pval->mode = HSPVAR_MODE_MALLOC;
	for (int i=0; i<count; i++) { VariantInit( &var[i] ); }
	if ( pval2 != NULL ) {
		memcpy( var, pval->pt, pval->size );
		sbFree( pval->pt );
	} else {
		pval->master = sbAlloc( sizeof(VariantParam) );
	}
	((VariantParam *)pval->master)->id = 0;
	pval->pt = (char *)var;
	pval->size = size;
}

static int getMethodID( char *name )
{
	// ���\�b�h�����烁�\�b�hID���擾
	//
	return HSPVAR_VARIANT_UNKNOWN;
}

static int getPropertyID( char *name )
{
	// �v���p�e�B�����烁�\�b�hID���擾
	//
	if ( name[0] == '\0' || stricmp(name,"val") == 0 || stricmp(name,"value") == 0 ) return HSPVAR_VARIANT_VALUE;
	if ( stricmp(name,"vt") == 0 || stricmp(name,"vartype") == 0 ) return HSPVAR_VARIANT_VARTYPE;
	if ( stricmp(name,"vtmask") == 0 )		return HSPVAR_VARIANT_VARTYPE_MASKED;
	if ( stricmp(name,"isbyref") == 0 )		return HSPVAR_VARIANT_IS_BYREF;
	if ( stricmp(name,"isarray") == 0 )		return HSPVAR_VARIANT_IS_ARRAY;
	if ( stricmp(name,"refptr") == 0 )		return HSPVAR_VARIANT_REFPTR;
	if ( stricmp(name,"arrayptr") == 0 )	return HSPVAR_VARIANT_ARRAY_PTR;
	if ( stricmp(name,"arraylbound") == 0 )	return HSPVAR_VARIANT_ARRAY_LBOUND;
	if ( stricmp(name,"arrayubound") == 0 )	return HSPVAR_VARIANT_ARRAY_UBOUND;
	if ( stricmp(name,"arraycount") == 0 )	return HSPVAR_VARIANT_ARRAY_COUNT;
	if ( stricmp(name,"bstrptr") == 0 )		return HSPVAR_VARIANT_BSTR_PTR;
	return HSPVAR_VARIANT_UNKNOWN;
}

static void HspVarVariant_ObjectMethod( PVal *pval )
{
	//		���\�b�h�̎��s
	//
	throw HSPERR_UNSUPPORTED_FUNCTION;
/*
	VARIANT *var;
	char *ps;
	int id;

	var = (VARIANT *)pval->pt;

	// ���\�b�h������ DISPID ���擾
	ps = code_gets();
	id = getMethodID( ps );
#ifdef HSP_COMOBJ_DEBUG
	COM_DBG_MSG( "HspVarVariant_ObjectMethod() : Method Name=\"%s\" (Method Id=%d)\n", ps, id);
#endif
	switch ( id ) {
	default:
		throw HSPERR_INVALID_PARAMETER;
	}
*/
}

static int code_get_element( PVal *pval )
{
	// �ϐ��̔z��v�f�̎擾
	//
	PVal pvalTemp;
	int chk, idx;
	HspVarCoreReset(pval);
	while (1) {
		HspVarCoreCopyArrayInfo( &pvalTemp, pval );			// ��Ԃ�ۑ�
		chk = code_get();
		HspVarCoreCopyArrayInfo( pval, &pvalTemp );			// ��Ԃ𕜋A
		if ( chk == PARAM_ENDSPLIT ) {
			if ( pval->arraycnt == 0 ) throw HSPERR_BAD_ARRAY_EXPRESSION;	// a() �\�L�̓G���[
			break;
		}
		if ( chk != PARAM_OK && chk != PARAM_SPLIT ) throw HSPERR_ARRAY_OVERFLOW;
		if ( mpval->flag != HSPVAR_FLAG_INT ) break;
		idx = *(int *)(mpval->pt);
		HspVarCoreArray( pval, idx );
	}
	return chk;
}

static void code_get_safearray( SAFEARRAY *psa, VariantParam *vprm )
{
	// SafeArray �̔z��v�f���擾
	//
	int i, chk;
	if ( psa == NULL ) throw HSPERR_ARRAY_OVERFLOW;
	vprm->dimcount = psa->cDims;
	for ( i=0; i<vprm->dimcount; i++ ) {
		chk = code_get();
		switch ( chk ) {
		case PARAM_OK:
		case PARAM_SPLIT:
			if ( mpval->flag != HSPVAR_FLAG_INT ) throw HSPERR_BAD_ARRAY_EXPRESSION;
			vprm->index[i] = *(int *)(mpval->pt);
			break;
		default:
			throw HSPERR_ARRAY_OVERFLOW;
		}
	}
}

static void HspVarVariant_ArrayObject( PVal *pval )
{
	//		�z��v�f�̎w�� (�A�z�z��p)
	//
	VARIANT* var;
	int chk, id;
	VariantParam *vprm;
	// �z��v�f�̎擾
	chk = code_get_element( pval );
	if ( chk == PARAM_ENDSPLIT ) return;	// �z��v�f���w�肳�ꂽ�ꍇ�͂��̂܂�

	// �v���p�e�B�ݒ莞
	var = (VARIANT *)HspVarVariant_GetPtr( pval );
	// �v���p�e�B������v���p�e�B ID �擾
	if ( mpval->flag != HSPVAR_FLAG_STR ) throw HSPERR_TYPE_MISMATCH;
	id = getPropertyID( (char *)(mpval->pt) );
#ifdef HSP_COMOBJ_DEBUG
	COM_DBG_MSG( "HspVarVariant_ArrayObject() : Property Name=\"%s\" (Property ID=%d)\n", mpval->pt, id);
#endif
	vprm = (VariantParam *)pval->master;
	vprm->var = var;
	vprm->id  = id;
	switch ( id ) {
	case HSPVAR_VARIANT_VALUE:
		if ( (var->vt & VT_ARRAY) && (chk != PARAM_SPLIT) ) {
			// SafeArray �̗v�f�����ɍs��
			SAFEARRAY *psa;
			if ( var->vt & VT_BYREF ) {
				psa = *var->pparray;
			} else {
				psa = var->parray;
			}
			code_get_safearray( psa, vprm );
			vprm->id = HSPVAR_VARIANT_ARRAY_ELEMENT;
		}
		break;
	case HSPVAR_VARIANT_VARTYPE:
	case HSPVAR_VARIANT_ARRAY_PTR:
	case HSPVAR_VARIANT_BSTR_PTR:
		break;
	default:
		throw HSPERR_INVALID_PARAMETER;
	}
	// ')' �ŕ��Ă��邩�i����ȍ~�Ƀp�����[�^���Ȃ����j
	if ( code_get() != PARAM_ENDSPLIT ) throw HSPERR_BAD_ARRAY_EXPRESSION;
}

void comcheck_variant_conv( VARTYPE vt, int vtype )
{
	// HSP�ϐ� <=> Variant �Ԃ̌^�`�F�b�N
	//
	switch ( vtype ) {
	case HSPVAR_FLAG_STR:
		if ( vt == VT_BSTR ) return;
		break;
	case HSPVAR_FLAG_DOUBLE:
		if ( vt == VT_R4 && vt == VT_R8 ) return;
		break;
	case HSPVAR_FLAG_INT:
		switch ( vt ) {
		case VT_I4:
		case VT_UI4:
		case VT_I1:
		case VT_UI1:
		case VT_I2:
		case VT_UI2:
		case VT_BOOL:
		case VT_ERROR:
		case VT_I8:
		case VT_UI8:
			return;
		}
		break;
	case HSPVAR_FLAG_COMSTRUCT:
		if ( vt == VT_DISPATCH || vt == VT_UNKNOWN ) return;
		break;
	case HSPVAR_FLAG_VARIANT:
		if ( vt == VT_VARIANT || (vt & VT_ARRAY) ) return;
		break;
	default:
		throw HSPERR_INVALID_TYPE;
	}
}

static void copy_ref_data( VARIANT *var, void *data )
{
	// �Q�� (ByRef) Variant �ւ̃f�[�^�R�s�[
	//  data -> variant
	//
	VARTYPE vt;
	void *pDst, *pSrc;

	vt = var->vt & VT_TYPEMASK;
	pDst = var->byref;
	pSrc = data;

	switch ( vt ) {
	case VT_I4:				// �f�[�^�T�C�Y 4 �o�C�g
	case VT_R4:
	case VT_ERROR:
	case VT_UI4:
	case VT_INT:
	case VT_UINT:
		*(long *)pDst = *(long *)pSrc;
		break;
	case VT_I2:				// �f�[�^�T�C�Y 2 �o�C�g
	case VT_UI2:
	case VT_BOOL:
		*(short *)pDst = *(short *)pSrc;
		break;
	case VT_I1:				// �f�[�^�T�C�Y 1 �o�C�g
	case VT_UI1:
		*(char *)pDst = *(char *)pSrc;
		break;
	case VT_R8:				// �f�[�^�T�C�Y 8 �o�C�g
	case VT_CY:
	case VT_DATE:
	case VT_I8:
	case VT_UI8:
		*(double *)pDst = *(double *)pSrc;
		break;
	case VT_BSTR:
		*(BSTR *)pDst = SysAllocString( *(BSTR *)pSrc );
		break;
	case VT_DISPATCH:
		*(IDispatch **)pDst = NULL;
		if ( *(IUnknown **)pSrc ) {
			(*(IUnknown **)pSrc)->QueryInterface( IID_IDispatch, (void**)pDst );
			if ( *(void**)pDst == NULL ) throw HSPERR_INVALID_TYPE;
		}
		break;
	case VT_UNKNOWN:
		*(IUnknown **)pDst = *(IUnknown **)pSrc;
		if ( *(IUnknown **)pDst ) (*(IUnknown **)pDst)->AddRef();
		break;
	case VT_DECIMAL:
		*(DECIMAL *)pDst = *(DECIMAL *)pSrc;
		break;
	case VT_VARIANT:
		VariantCopy( (VARIANT *)pDst, (VARIANT *)pSrc );
		break;
	case VT_SAFEARRAY:
		SafeArrayCopy( *(SAFEARRAY **)pSrc, (SAFEARRAY **)pDst );
		break;
	}
}

void comset_variant_byref( VARIANT *var, void *data, int vtype )
{
	//		HSP�ϐ��f�[�^�� Variant (ByRef) �ɑ������
	//
	VARIANT varTemp;
	VARTYPE vt;
	void *ptr;
	HRESULT hr;

	// ����\���ǂ����^�`�F�b�N
	if ( (var->vt & VT_BYREF) == 0 ) throw HSPERR_INVALID_PARAMETER;
	vt = var->vt & ( VT_TYPEMASK | VT_ARRAY );
	comcheck_variant_conv( vt, vtype );

	// ��������ꎞ VARIANT ���쐬���Ă���^�ϊ�
	VariantInit( &varTemp );
	comset_variant( &varTemp, data, vtype );
	if ( vtype != HSPVAR_FLAG_VARIANT ) {
		hr = VariantChangeType( &varTemp, &varTemp, VARIANT_NOVALUEPROP, vt );
		if ( FAILED(hr) ) throw HSPERR_INVALID_TYPE;
	}

	// ���f�[�^�̃|�C���^�擾�����
	ptr = &varTemp.lVal;
	if ( vt == VT_VARIANT ) ptr = &varTemp;
	if ( vt == VT_DECIMAL ) ptr = &varTemp.decVal;
	copy_ref_data( var, ptr );
	VariantClear( &varTemp );
}


static void HspVarVariant_ObjectWrite( PVal *pval, void *data, int vtype )
{
	//		�ό^�̑��
	//
	int id;
	void *ptr;
	VARTYPE vt;
	VARIANT varTemp, *var;
	SAFEARRAY *psa;
	VariantParam *vprm;
	HRESULT hr;
	BSTR bstr;

#ifdef HSP_COMOBJ_DEBUG
	COM_DBG_MSG( "HspVarVariant_ObjectWrite()\n");
#endif

	vprm = (VariantParam *)pval->master;
	var = vprm->var;
	id  = vprm->id;
	switch ( id ) {

	case HSPVAR_VARIANT_VALUE:
		if ( var->vt & VT_BYREF ) {
			// �Q�� VARIANT �ւ̑��
			comset_variant_byref( var, data, vtype );
		} else {
			// �l Variant �ւ̑��
			comset_variant( var, data, vtype );
		}
		break;

	case HSPVAR_VARIANT_ARRAY_ELEMENT:
		// SafeArray �̗v�f�֑���i������ VARTYPE �͕ύX�ł��Ȃ��j
		// ����\���ǂ����^�`�F�b�N
		if ( (var->vt & VT_ARRAY) == 0 ) throw HSPERR_INVALID_ARRAYSTORE;
		if ( var->vt & VT_BYREF ) {
			psa = *var->pparray;
		} else {
			psa = var->parray;
		}
		vt = var->vt & VT_TYPEMASK;
		if ( vt == VT_EMPTY ) {
			hr = SafeArrayGetVartype( psa, &vt );
			if ( FAILED(hr) || vt == VT_EMPTY ) throw HSPERR_INVALID_ARRAYSTORE;
		}
		comcheck_variant_conv( vt, vtype );
		// ��������ꎞ VARIANT ���쐬���Ă���^�ϊ�
		VariantInit( &varTemp );
		comset_variant( &varTemp, data, vtype );
		if ( vtype != HSPVAR_FLAG_VARIANT ) {
			hr = VariantChangeType( &varTemp, &varTemp, VARIANT_NOVALUEPROP, vt );
			if ( FAILED(hr) ) throw HSPERR_INVALID_TYPE;
		}
		// ���f�[�^�̃|�C���^�擾�����
		ptr = &varTemp.lVal;
		if ( vt == VT_VARIANT ) ptr = &varTemp;
		if ( vt == VT_DECIMAL ) ptr = &varTemp.decVal;
		hr = SafeArrayPutElement( psa, vprm->index, ptr );
		VariantClear( &varTemp );
		if ( FAILED(hr) ) throw HSPERR_ARRAY_OVERFLOW;
		break;

	case HSPVAR_VARIANT_VARTYPE:
		// VARIANT �̌^ (VARTYPE) ��ύX
		if ( vtype != HSPVAR_FLAG_INT ) throw HSPERR_INTEGER_REQUIRED;
		vt = (VARTYPE)( *(int*)data );
		hr = VariantChangeType( var, var, VARIANT_NOVALUEPROP, vt );
		if ( FAILED(hr) ) throw HSPERR_INVALID_TYPE;
		break;

	case HSPVAR_VARIANT_ARRAY_PTR:
		// �n���ꂽ������ SafeArray �ł���Ƃ��đ��
		if ( vtype != HSPVAR_FLAG_INT ) throw HSPERR_INVALID_ARRAYSTORE;
		psa = (SAFEARRAY *)( *(int*)data );
		if ( psa == NULL ) throw HSPERR_ILLEGAL_FUNCTION;
		hr = SafeArrayGetVartype( psa, &vt );
		if ( FAILED(hr) ) throw HSPERR_INVALID_ARRAYSTORE;
		VariantClear( var );
		var->vt = vt | VT_ARRAY;
		var->parray = psa;
		break;

	case HSPVAR_VARIANT_BSTR_PTR:
		// �n���ꂽ������BSTR�ł���Ƃ��đ��
		if ( vtype != HSPVAR_FLAG_INT ) throw HSPERR_INVALID_ARRAYSTORE;
		bstr = (BSTR)( *(int*)data );
		VariantClear( var );
		var->vt = VT_BSTR;
		var->bstrVal = bstr;
		break;

	default:
		throw HSPERR_INVALID_PARAMETER;
	}
}


static void *HspVarVariant_ArrayObjectRead( PVal *pval, int *mptype )
{
	//		�z��v�f�̎w�� (�A�z�z��/�ǂݏo��)
	//
	VARIANT* var;
	int chk, id;
	void *ptr;
	static int vRet;
	SAFEARRAY *psa;
	long dimension, lbound, ubound;
	VariantParam *vprm;
	VARIANT varTemp;
	VARTYPE vt;
	HRESULT hr;

	// �z��v�f�̎擾
	chk = code_get_element( pval );
	var = (VARIANT *)HspVarVariant_GetPtr( pval );
	if ( chk == PARAM_ENDSPLIT ) return var;		// �z��v�f���w�肳�ꂽ�ꍇ�͂��̂܂�

	// �v���p�e�B�擾��
	if ( mpval->flag != HSPVAR_FLAG_STR ) throw HSPERR_TYPE_MISMATCH;
	id = getPropertyID( (char *)(mpval->pt) );

#ifdef HSP_COMOBJ_DEBUG
	COM_DBG_MSG( "HspVarVariant_ArrayObjectRead() : Property Name=\"%s\" (Property ID=%d)\n", mpval->pt, id);
#endif
	// (�f�t�H���g)
	ptr = &vRet;
	*mptype = HSPVAR_FLAG_INT;

	// �p�����[�^���擾�E�v���p�e�B�擾
	switch ( id ) {

	case HSPVAR_VARIANT_VARTYPE:
	case HSPVAR_VARIANT_VARTYPE_MASKED:
		if ( id == HSPVAR_VARIANT_VARTYPE_MASKED ) {
			vRet = var->vt & VT_TYPEMASK;
		} else {
			vRet = var->vt;
		}
		break;

	case HSPVAR_VARIANT_VALUE:
		if ( (var->vt & VT_ARRAY) && (chk != PARAM_SPLIT) ) {
			// SafeArray �̗v�f�����ɍs��
			if ( var->vt & VT_BYREF ) {
				psa = *var->pparray;
			} else {
				psa = var->parray;
			}
			vprm = (VariantParam *)pval->master;
			code_get_safearray( psa, vprm );
			// ����\���ǂ����^�`�F�b�N
			vt = var->vt & VT_TYPEMASK;
			if ( vt == VT_EMPTY ) {
				hr = SafeArrayGetVartype( psa, &vt );
				if ( FAILED(hr) || vt == VT_EMPTY ) throw HSPERR_INVALID_TYPE;
			}
			comcheck_variant_conv( vt, *mptype );
			// ��������ꎞ VARIANT �Ɋi�[���Ă���^�ϊ�
			VariantInit( &varTemp );
			ptr = &varTemp.lVal;
			if ( vt == VT_VARIANT ) ptr = &varTemp;
			if ( vt == VT_DECIMAL ) ptr = &varTemp.decVal;
			hr = SafeArrayGetElement( psa, vprm->index, ptr );
			try {
				if ( FAILED(hr) ) throw HSPERR_ARRAY_OVERFLOW;
				varTemp.vt = vt;
				ptr = comget_variant( &varTemp, mptype );
			}
			catch (...) {
				VariantClear( &varTemp );
				throw;
			}
			VariantClear( &varTemp );
		} else {
			// SafeArray �z��v�f�ȊO�̒l
			ptr = comget_variant( var, mptype );
		}
		break;

	case HSPVAR_VARIANT_IS_BYREF:
		vRet = 0;
		if ( var->vt & VT_BYREF ) vRet = 1;
		break;

	case HSPVAR_VARIANT_IS_ARRAY:
		vRet = 0;
		vt = var->vt;
		if ( var->vt & VT_ARRAY ) vRet = 1;
		break;

	case HSPVAR_VARIANT_ARRAY_PTR:
	case HSPVAR_VARIANT_ARRAY_LBOUND:
	case HSPVAR_VARIANT_ARRAY_UBOUND:
	case HSPVAR_VARIANT_ARRAY_COUNT:
		if ( (var->vt & VT_ARRAY) == 0 ) throw HSPERR_INVALID_PARAMETER;
		if ( var->vt & VT_BYREF ) {
			psa = *var->pparray;
		} else {
			psa = var->parray;
		}
		if ( psa == NULL ) throw HSPERR_ARRAY_OVERFLOW;
		if ( id == HSPVAR_VARIANT_ARRAY_PTR ) {
			vRet = (int)psa;
			break;
		}
		dimension = code_getdi(1);
		switch ( id ) {
		case HSPVAR_VARIANT_ARRAY_LBOUND:
			hr = SafeArrayGetLBound( psa, dimension, &lbound );
			vRet = lbound;
			break;
		case HSPVAR_VARIANT_ARRAY_UBOUND:
			hr = SafeArrayGetUBound( psa, dimension, &ubound );
			vRet = ubound;
			break;
		case HSPVAR_VARIANT_ARRAY_COUNT:
			hr = SafeArrayGetLBound( psa, dimension, &lbound );
			hr = SafeArrayGetUBound( psa, dimension, &ubound );
			vRet = ubound - lbound + 1;
			break;
		}
		if ( FAILED(hr) ) throw HSPERR_ILLEGAL_FUNCTION;
		break;

	case HSPVAR_VARIANT_BSTR_PTR:
		if ( var->vt != VT_BSTR ) throw HSPERR_INVALID_PARAMETER;
		vRet = (int)var->bstrVal;
		break;

	case HSPVAR_VARIANT_REFPTR:
		if ( (var->vt & VT_BYREF) == 0 ) throw HSPERR_INVALID_PARAMETER;
		vRet = (int)var->byref;
		break;

	default:
		throw HSPERR_INVALID_PARAMETER;
	}

	// ')' �ŕ��Ă��邩�i�ȍ~�Ƀp�����[�^���Ȃ����j
	if ( code_get() != PARAM_ENDSPLIT ) throw HSPERR_BAD_ARRAY_EXPRESSION;

	return ptr;
}

// Size
static int HspVarVariant_GetSize( const PDAT *pdatl )
{
	//		(���Ԃ̃|�C���^���n����܂�)
	return sizeof(VARIANT);
}

// Using
static int HspVarVariant_GetUsing( const PDAT *pdat )
{
	//		(���Ԃ̃|�C���^���n����܂�)
	VARIANT *var = (VARIANT *)pdat;
	return ( var->vt != VT_EMPTY );
}

// Set
static void HspVarVariant_Set( PVal *pval, PDAT *pdat, const void *in )
{
	VARIANT *varSrc, *varDst;

	varDst = (VARIANT *)pdat;
	varSrc = (VARIANT *)in;
	if ( pval->support & HSPVAR_SUPPORT_TEMPVAR ) {
		// �ꎞ�ϐ��̏ꍇ�͒P�Ȃ郁�����u���b�N�R�s�[
		*varDst = *varSrc;
	} else {
		VariantCopy( varDst, varSrc );
	}
#ifdef HSP_COMOBJ_DEBUG
	if ( pval->support & HSPVAR_SUPPORT_TEMPVAR ) {
		COM_DBG_MSG( "HspVarVariant_Set() : * HSPVAR_SUPPORT_TEMPVAR *\n" );
	} else {
		COM_DBG_MSG( "HspVarVariant_Set()\n" );
	}
#endif
}

static void *GetBlockSize( PVal *pval, PDAT *pdat, int *size )
{
	*size = pval->size - ( ((char *)pdat) - pval->pt );
	return (pdat);
}

static void AllocBlock( PVal *pval, PDAT *pdat, int size )
{
}


/*------------------------------------------------------------*/

void HspVarVariant_Init( HspVarProc *p )
{
	myproc = p;

	p->Set = HspVarVariant_Set;
	p->GetPtr = HspVarVariant_GetPtr;
//	p->Cnv = HspVarVariant_Cnv;
//	p->CnvCustom = HspVarVariant_CnvCustom;
	p->GetSize = HspVarVariant_GetSize;
	p->GetUsing = HspVarVariant_GetUsing;
	p->GetBlockSize = GetBlockSize;
	p->AllocBlock = AllocBlock;

	p->ArrayObject = HspVarVariant_ArrayObject;
	p->ArrayObjectRead = HspVarVariant_ArrayObjectRead;
	p->ObjectWrite = HspVarVariant_ObjectWrite;
	p->ObjectMethod = HspVarVariant_ObjectMethod;

	p->Alloc = HspVarVariant_Alloc;
	p->Free = HspVarVariant_Free;
/*
	p->EqI = HspVarVariant_EqI;
	p->NeI = HspVarVariant_NeI;

	p->AddI = HspVarVariant_Invalid;
	p->SubI = HspVarVariant_Invalid;
	p->MulI = HspVarVariant_Invalid;
	p->DivI = HspVarVariant_Invalid;
	p->ModI = HspVarVariant_Invalid;

	p->AndI = HspVarVariant_Invalid;
	p->OrI  = HspVarVariant_Invalid;
	p->XorI = HspVarVariant_Invalid;

	p->EqI = HspVarVariant_Invalid;
	p->NeI = HspVarVariant_Invalid;
	p->GtI = HspVarVariant_Invalid;
	p->LtI = HspVarVariant_Invalid;
	p->GtEqI = HspVarVariant_Invalid;
	p->LtEqI = HspVarVariant_Invalid;

	p->RrI = HspVarVariant_Invalid;
	p->LrI = HspVarVariant_Invalid;
*/
	p->vartype_name = "variant";		// �^�C�v��
	p->version = 0x001;					// �^�^�C�v�����^�C���o�[�W����(0x100 = 1.0)
	p->support = HSPVAR_SUPPORT_STORAGE | HSPVAR_SUPPORT_ARRAYOBJ | HSPVAR_SUPPORT_NOCONVERT | HSPVAR_SUPPORT_VARUSE;
										// �T�|�[�g�󋵃t���O(HSPVAR_SUPPORT_*)
	p->basesize = sizeof(VARIANT);	// �P�̃f�[�^���g�p����T�C�Y(byte) / �ϒ��̎���-1
}

/*------------------------------------------------------------*/



#endif	// !defined( HSP_COM_UNSUPPORTED )
