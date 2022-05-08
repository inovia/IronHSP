
//
//	comstruct.cpp header
//
//	COM �I�u�W�F�N�g�����i�[����\����
//
#ifndef __comobj_h
#define __comobj_h


#ifndef HSP_COM_UNSUPPORTED		//�iCOM �T�|�[�g�Ȃ��ł̃r���h���̓t�@�C���S�̂𖳎��j

/*
	rev 43
	mingw ; error : IDispatch���錾����Ă��Ȃ��A��
	�ɑΏ�
*/
#if defined( __GNUC__ )
#define COM_NO_WINDOWS_H
#include <oaidl.h>
#endif

// �f�o�b�O�p�ɍ쐬����ꍇ�ɒ�`
// #define HSP_COMOBJ_DEBUG

#ifdef HSP_COMOBJ_DEBUG
extern FILE *fpComDbg;
void COM_DBG_MSG( const char *sz, ... );
#endif


void ReleaseComPtr( IUnknown** );
void QueryComPtr( IUnknown**, IUnknown*, const IID* );

void SetComEvent( IUnknown **, IUnknown **, const IID *, unsigned short * );
void ReleaseComEvent( IUnknown ** );
BOOL IsSameComObject( IUnknown **, IUnknown ** );

// �ȉ��̂Q�̓}�N���i�C�����C���֐��j�Ƃ��Ē�`
//BOOL IsVaridComPtr( IUnknown** );
// void CopyComPtr( IUnknown**, IUnknown* );
#ifdef __cplusplus
inline BOOL IsVaridComPtr( IUnknown** ppunk ) { return ( *ppunk != NULL ); }
inline void CopyComPtr( IUnknown** ppDest, IUnknown* pSrc ){ QueryComPtr( ppDest, pSrc, NULL );}
#else
#define IsVaridComPtr( ppunk ) ( *(ppunk) != NULL )
#define CopyComPtr( ppDest, pSrc ) QueryComPtr( ppDest, pSrc, NULL )
#endif


/*------------------------------------------------------*/


#define TMP_VARIANT_MAX 16

typedef struct ComDispParams {
	IDispatch *disp;
	DISPID dispid;
	WORD flag;
	DISPPARAMS params;
	VARIANT prms[TMP_VARIANT_MAX];
} ComDispParams;

HRESULT CallDispMethod( IUnknown* punk, DISPID dispid, VARIANT *result );
HRESULT GetDispProp( IUnknown* punk, DISPID dispid, VARIANT *result );
ComDispParams *PrepForPutDispProp( IUnknown *punk, DISPID dispid  );
HRESULT PutDispProp( ComDispParams *pDispData, void *setdata, int settype );
void FreeDispParams( ComDispParams* data );

void ConvSafeArray2Var( PVal *pval, SAFEARRAY *psa, VARTYPE vt );
SAFEARRAY *ConvVar2SafeArray( PVal *pval, BOOL bVariant, VARTYPE *vtRet );
SAFEARRAY *CreateBinarySafeArray( void *ptr, int size, VARTYPE *vt );
void GetBinarySafeArray( void *ptr, int size, SAFEARRAY *psa );


#endif	// !defined( HSP_COM_UNSUPPORTED )

#endif	// __comobj_h
