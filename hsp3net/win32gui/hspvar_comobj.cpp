
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
static PDAT *HspVarComobj_GetPtr( PVal *pval )
{
	return (PDAT *)(( (IUnknown **)(pval->pt))+pval->offset);
}

static void *HspVarComobj_Cnv( const void *buffer, int flag )
{
	//		���N�G�X�g���ꂽ�^ -> �����̌^�ւ̕ϊ����s�Ȃ�
	//		(�g�ݍ��݌^�ɂ̂ݑΉ���OK)
	//		(�Q�ƌ��̃f�[�^��j�󂵂Ȃ�����)
	//
	throw HSPERR_INVALID_TYPE;
	return (void *)buffer;
}


static void *HspVarComobj_CnvCustom( const void *buffer, int flag )
{
	//		(�J�X�^���^�C�v�̂�)
	//		�����̌^ -> ���N�G�X�g���ꂽ�^ �ւ̕ϊ����s�Ȃ�
	//		(�g�ݍ��݌^�ɑΉ�������)
	//		(�Q�ƌ��̃f�[�^��j�󂵂Ȃ�����)
	//
	throw HSPERR_INVALID_TYPE;
	return (void *)buffer;
}

static void HspVarComobj_Free( PVal *pval )
{
	//		PVAL�|�C���^�̕ϐ����������������
	//
	IUnknown** ppunk;
	if ( pval->master ) {
		FreeDispParams( (ComDispParams *)pval->master );
	}
	if ( pval->mode == HSPVAR_MODE_MALLOC ) {
		// (�ꎞ�ϐ��Ɋ܂܂��I�u�W�F�N�g�� Release ���Ȃ�)
		if ( (pval->support & HSPVAR_SUPPORT_TEMPVAR) == 0 ) {
#ifdef HSP_COMOBJ_DEBUG
			COM_DBG_MSG( "HspVarComobj_Free()\n" );
#endif
			int count = HspVarCoreCountElems( pval );
			ppunk = (IUnknown **)pval->pt;
			for (int i=0; i<count; i++) {
				ReleaseComPtr( &ppunk[i] );
			}
		}
		sbFree( pval->pt );
	}
	pval->pt   = NULL;
	pval->flag = HSPVAR_MODE_NONE;
}


static void HspVarComobj_Alloc( PVal *pval, const PVal *pval2 )
{
	//		pval�ϐ����K�v�Ƃ���T�C�Y���m�ۂ���B
	//		(pval�����łɊm�ۂ���Ă��郁��������͌Ăяo�������s�Ȃ�)
	//		(pval2��NULL�̏ꍇ�́A�V�K�f�[�^)
	//		(pval2���w�肳��Ă���ꍇ�́Apval2�̓��e���p�����čĊm��)
	//
	int count,size;
	IUnknown **ppunk;
#ifdef HSP_COMOBJ_DEBUG
	COM_DBG_MSG( "HspVarComobj_Alloc()\n" );
#endif
	if ( pval->len[1] < 1 ) pval->len[1] = 1;		// �z����Œ� 1 �͊m�ۂ���
	count = HspVarCoreCountElems(pval);
	size  = count * sizeof( IUnknown* );
	ppunk = (IUnknown **)sbAlloc( size );
	pval->mode = HSPVAR_MODE_MALLOC;
	for (int i=0; i<count; i++) { ppunk[i] = NULL; }
	if ( pval2 != NULL ) {
		memcpy( ppunk, pval->pt, pval->size );
		sbFree( pval->pt );
		if ( pval->master ) sbFree( pval->master );
	}
	pval->master = NULL;		// ComDispParams �p
	pval->pt = (char *)ppunk;
	pval->size = size;

}

static void HspVarComobj_ObjectMethod( PVal *pval )
{
	//		���\�b�h�̎��s
	//
	VARIANT vres;
	HRESULT hr;
	char *ps;
	DISPID dispid;
	IUnknown** ppunk;
	BOOL bVariantRet;

//	ppunk = (IUnknown**)HspVarCorePtrAPTR( pval, pval->offset );
	ppunk = (IUnknown **)pval->pt;
	if ( ! IsVaridComPtr(ppunk) ) throw HSPERR_COMDLL_ERROR;

	// ���\�b�h������ DISPID ���擾
	ps = code_gets();
	dispid = get_dispid( *ppunk, ps, &bVariantRet );
#ifdef HSP_COMOBJ_DEBUG
	COM_DBG_MSG( "ObjectMethod() : pObj=0x%p : PropName=\"%s\" (DISPID=%d)\n", *ppunk, ps, dispid);
#endif
	// ���\�b�h�p�����[�^�̎擾�E���\�b�h���s
	VariantInit( &vres );
	hr = CallDispMethod( *ppunk, dispid, &vres );
	comget_variantres( &vres, hr, bVariantRet );				// �Ԓl���擾
	VariantClear( &vres );
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

static void HspVarComobj_ArrayObject( PVal *pval )
{
	//		�z��v�f�̎w�� (�A�z�z��p)
	//
	IUnknown** ppunk;
	int chk;
	DISPID dispid;
	ComDispParams *paramdata;

	// �z��v�f�̎擾
	chk = code_get_element( pval );
	if ( chk == PARAM_ENDSPLIT ) return;	// �z��v�f���w�肳�ꂽ�ꍇ�͂��̂܂�

	// �v���p�e�B�ݒ莞
	ppunk = (IUnknown **)HspVarComobj_GetPtr( pval );
	if ( ! IsVaridComPtr(ppunk) ) throw HSPERR_COMDLL_ERROR;
	// �v���p�e�B������ DISPID ���擾
	if ( mpval->flag != HSPVAR_FLAG_STR ) throw HSPERR_TYPE_MISMATCH;
	dispid = get_dispid( *ppunk, (char *)(mpval->pt), NULL );
#ifdef HSP_COMOBJ_DEBUG
	COM_DBG_MSG( "ArrayObject() : pObj=0x%p : PropName=\"%s\" (DISPID=%d)\n", *ppunk, mpval->pt, dispid);
#endif
	// �p�����[�^�擾���ێ����Ă���
	paramdata = PrepForPutDispProp( *ppunk, dispid );
	if ( pval->master ) FreeDispParams( (ComDispParams *)pval->master );
	pval->master = paramdata;
}

static void HspVarComobj_ObjectWrite( PVal *pval, void *data, int vtype )
{
	//		�ό^�̑��
	//
	ComDispParams *paramdata;
	HRESULT hr;
#ifdef HSP_COMOBJ_DEBUG
	COM_DBG_MSG( "ObjectWrite()\n" );
#endif
	// �v���p�e�B�ݒ莞
	paramdata = (ComDispParams *)pval->master;
	if ( paramdata == NULL ) throw ( HSPERR_COMDLL_ERROR );
	hr = PutDispProp( paramdata, data, vtype );
	FreeDispParams( paramdata );
	pval->master = NULL;

	if ( FAILED(hr) ) throw ( HSPERR_COMDLL_ERROR );
}


static void get_coclassname( IUnknown *punk, VARIANT *vres )
{
	HRESULT hr;
	IProvideClassInfo *pPCI;
	ITypeInfo *pTI;
	BSTR bstr = NULL;
	hr = punk->QueryInterface( IID_IProvideClassInfo, (void **)&pPCI );
	if ( SUCCEEDED(hr) && pPCI != NULL ) {
		hr = pPCI->GetClassInfo( &pTI );
		if ( SUCCEEDED(hr) && pTI != NULL ) {
			hr = pTI->GetDocumentation( MEMBERID_NIL, &bstr, NULL, NULL, NULL );
			pTI->Release();
		}
		pPCI->Release();
	}
	if ( bstr == NULL ) {
		bstr = SysAllocString( L"" );
	}
	vres->bstrVal = bstr;
	vres->vt = VT_BSTR;
}
static void get_interfacename( IUnknown *punk, VARIANT *vres )
{
	HRESULT hr;
	IDispatch *pDisp;
	ITypeInfo *pTI;
	BSTR bstr = NULL;
	hr = punk->QueryInterface( IID_IDispatch, (void **)&pDisp );
	if ( SUCCEEDED(hr) && pDisp != NULL ) {
		hr = pDisp->GetTypeInfo( 0, LOCALE_USER_DEFAULT, &pTI );
		if ( SUCCEEDED(hr) && pTI != NULL ) {
			hr = pTI->GetDocumentation( MEMBERID_NIL, &bstr, NULL, NULL, NULL );
			pTI->Release();
		}
		pDisp->Release();
	}
	if ( bstr == NULL ) {
		bstr = SysAllocString( L"" );
	}
	vres->bstrVal = bstr;
	vres->vt = VT_BSTR;
}

static void *HspVarComobj_ArrayObjectRead( PVal *pval, int *mptype )
{
	//		�z��v�f�̎w�� (�A�z�z��/�ǂݏo��)
	//
	void *ptr;
	IUnknown **ppunk;
	int chk;
	DISPID dispid;
	VARIANT vres;
	BOOL noconvret;
	char *propname;
	HRESULT hr = S_OK;

	// �z��v�f�̎擾
	chk = code_get_element( pval );
	ppunk = (IUnknown **)HspVarComobj_GetPtr( pval );
	if ( chk == PARAM_ENDSPLIT ) return ppunk;		// �z��v�f���w�肳�ꂽ�ꍇ�͂��̂܂�

	// �v���p�e�B�擾��
	// �v���p�e�B������ DISPID ���擾
	if ( ! IsVaridComPtr(ppunk) ) throw ( HSPERR_COMDLL_ERROR );
	if ( mpval->flag != HSPVAR_FLAG_STR ) throw ( HSPERR_TYPE_MISMATCH );
	propname = (char *)(mpval->pt);
	VariantInit( &vres );
	if ( propname[0] == '$' ) {
		noconvret = FALSE;
		if ( stricmp( propname, "$coclass" ) == 0 ) {
			get_coclassname( *ppunk, &vres );
		} else if ( stricmp( propname, "$interface" ) == 0 ) {
			get_interfacename( *ppunk, &vres );
		} else {
			throw HSPERR_INVALID_PARAMETER;
		}
	} else {
		dispid = get_dispid( *ppunk, propname, &noconvret );
#ifdef HSP_COMOBJ_DEBUG
		COM_DBG_MSG( "ArrayObjectRead() : pObj=0x%p : PropName=\"%s\" (DISPID=%d)\n", *ppunk, mpval->pt, dispid);
#endif
	// �p�����[�^���擾�E�v���p�e�B�擾
		hr = GetDispProp( *ppunk, dispid, &vres );
	}
	ptr = comget_variant( &vres, mptype, noconvret );
	VariantClear( &vres );
	if ( FAILED(hr) ) throw ( HSPERR_COMDLL_ERROR );
	return ptr;
}


// Size
static int HspVarComobj_GetSize( const PDAT *pdatl )
{
	//		(���Ԃ̃|�C���^���n����܂�)
	return sizeof(IUnknown*);
}

// Using
static int HspVarComobj_GetUsing( const PDAT *pdat )
{
	//		(���Ԃ̃|�C���^���n����܂�)
	return IsVaridComPtr((IUnknown**)pdat);
}

// Set
static void HspVarComobj_Set( PVal *pval, PDAT *pdat, const void *in )
{
	IUnknown **ppunkSrc, **ppunkDst;

	ppunkDst = (IUnknown **)pdat;
	ppunkSrc = (IUnknown **)in;
	if ( pval->support & HSPVAR_SUPPORT_TEMPVAR ) {
		// ����悪�ꎞ�ϐ��̏ꍇ�� AddRef() ���Ȃ�
		*ppunkDst = *ppunkSrc;
#ifdef HSP_COMOBJ_DEBUG
		COM_DBG_MSG( "ppunkDst is Temporary objedct.\n");
#endif
	} else {
		CopyComPtr( ppunkDst, *ppunkSrc );
	}
}


static void *GetBlockSize( PVal *pval, PDAT *pdat, int *size )
{
	*size = pval->size - ( ((char *)pdat) - pval->pt );
	return (pdat);
}

static void AllocBlock( PVal *pval, PDAT *pdat, int size )
{
}

// Eq
static void HspVarComobj_EqI( PDAT *pdat, const void *val )
{
	*(int *)pdat = IsSameComObject( (IUnknown **)pdat, (IUnknown **)val );
	myproc->aftertype = HSPVAR_FLAG_INT;
}

// Ne
static void HspVarComobj_NeI( PDAT *pdat, const void *val )
{
	*(int *)pdat = !IsSameComObject( (IUnknown **)pdat, (IUnknown **)val );
	myproc->aftertype = HSPVAR_FLAG_INT;
}


/*------------------------------------------------------------*/

void HspVarComobj_Init( HspVarProc *p )
{
	myproc = p;

	p->Set = HspVarComobj_Set;
	p->Cnv = HspVarComobj_Cnv;
	p->GetPtr = HspVarComobj_GetPtr;
	p->CnvCustom = HspVarComobj_CnvCustom;
	p->GetSize = HspVarComobj_GetSize;
	p->GetUsing = HspVarComobj_GetUsing;
	p->GetBlockSize = GetBlockSize;
	p->AllocBlock = AllocBlock;

	p->ArrayObject = HspVarComobj_ArrayObject;
	p->ArrayObjectRead = HspVarComobj_ArrayObjectRead;
	p->ObjectWrite = HspVarComobj_ObjectWrite;
	p->ObjectMethod = HspVarComobj_ObjectMethod;

	p->Alloc = HspVarComobj_Alloc;
	p->Free = HspVarComobj_Free;
	p->EqI = HspVarComobj_EqI;
	p->NeI = HspVarComobj_NeI;

/*
	p->AddI = HspVarComobj_Invalid;
	p->SubI = HspVarComobj_Invalid;
	p->MulI = HspVarComobj_Invalid;
	p->DivI = HspVarComobj_Invalid;
	p->ModI = HspVarComobj_Invalid;

	p->AndI = HspVarComobj_Invalid;
	p->OrI  = HspVarComobj_Invalid;
	p->XorI = HspVarComobj_Invalid;

	p->EqI = HspVarComobj_Invalid;
	p->NeI = HspVarComobj_Invalid;
	p->GtI = HspVarComobj_Invalid;
	p->LtI = HspVarComobj_Invalid;
	p->GtEqI = HspVarComobj_Invalid;
	p->LtEqI = HspVarComobj_Invalid;

	p->RrI = HspVarComobj_Invalid;
	p->LrI = HspVarComobj_Invalid;
*/
	p->vartype_name = "comobj";				// �^�C�v��
	p->version = 0x001;					// �^�^�C�v�����^�C���o�[�W����(0x100 = 1.0)
	p->support = HSPVAR_SUPPORT_STORAGE | HSPVAR_SUPPORT_ARRAYOBJ | HSPVAR_SUPPORT_NOCONVERT | HSPVAR_SUPPORT_VARUSE;
										// �T�|�[�g�󋵃t���O(HSPVAR_SUPPORT_*)
	p->basesize = sizeof(void*);	// �P�̃f�[�^���g�p����T�C�Y(byte) / �ϒ��̎���-1
}

/*------------------------------------------------------------*/





#endif	// !defined( HSP_COM_UNSUPPORTED )

