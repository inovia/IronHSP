#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include <ocidl.h>
#include <atlstr.h>

#include "../hsp3code.h"
#include "../hsp3struct.h"
#include "../hsp3ext.h"
#include "../hspvar_core.h"
#include "comobj.h"
#include "hspvar_netobj.h"
#include "comobj_event.h"
#include "../strbuf.h"
#include "../supio.h"

#include "Hsp3Net.h"

using namespace System;
using namespace System::Collections;
using namespace System::Collections::Generic;
using namespace System::Reflection;
using namespace tv::hsp::net;

static NativePointer conv;

/*------------------------------------------------------------*/
/*
		HSPVAR core interface (.NET Object)
*/
/*------------------------------------------------------------*/

static HspVarProc *myproc;

// Core
static PDAT *HspVarNetobj_GetPtr(PVal *pval)
{
	return (PDAT *)(((NativePointer*)(pval->pt)) + pval->offset);
}

static void *HspVarNetobj_Cnv(const void *buffer, int flag)
{
	//		���N�G�X�g���ꂽ�^ -> �����̌^�ւ̕ϊ����s�Ȃ�
	//		(�g�ݍ��݌^�ɂ̂ݑΉ���OK)
	//		(�Q�ƌ��̃f�[�^��j�󂵂Ȃ�����)
	//

	// ���M�̌^�̏ꍇ
	if ( flag == TYPE_NETOBJ)
	{
		return (void *)buffer;
	}

	switch (flag) {
	case HSPVAR_FLAG_STR:
	{
		const char* ch = (const char *)buffer;
		auto managed_ptr = GlobalAccess::g_Hsp3Net->CreateString(
			marshal_as<System::String^>(ch));
		conv = GlobalAccess::CreateNativePtr(managed_ptr);
		return &conv;
	}
	case HSPVAR_FLAG_INT:
	{
		auto managed_ptr = GlobalAccess::g_Hsp3Net->CreateInt32((*(int *)buffer));
		conv = GlobalAccess::CreateNativePtr(managed_ptr);
		return &conv;
	}
	case HSPVAR_FLAG_DOUBLE:
	{
		auto managed_ptr = GlobalAccess::g_Hsp3Net->CreateDouble((*(double *)buffer));
		conv = GlobalAccess::CreateNativePtr(managed_ptr);
		return &conv;
	}
	default:
		throw HSPERR_INVALID_TYPE;
	}

	return (void *)buffer;
}


static void *HspVarNetobj_CnvCustom(const void *buffer, int flag)
{
	//		(�J�X�^���^�C�v�̂�)
	//		�����̌^ -> ���N�G�X�g���ꂽ�^ �ւ̕ϊ����s�Ȃ�
	//		(�g�ݍ��݌^�ɑΉ�������)
	//		(�Q�ƌ��̃f�[�^��j�󂵂Ȃ�����)
	//
	throw HSPERR_INVALID_TYPE;
	return (void *)buffer;
}

static void HspVarNetobj_Free(PVal *pval)
{
	//		PVAL�|�C���^�̕ϐ����������������
	//

	if (pval->master) {
		delete pval->master;
		pval->master = nullptr;
	}

	if (pval->mode == HSPVAR_MODE_MALLOC) 
	{
		sbFree(pval->pt);
	}
	pval->pt = NULL;
	pval->flag = HSPVAR_MODE_NONE;
}


static void HspVarNetobj_Alloc(PVal *pval, const PVal *pval2)
{
	//		pval�ϐ����K�v�Ƃ���T�C�Y���m�ۂ���B
	//		(pval�����łɊm�ۂ���Ă��郁��������͌Ăяo�������s�Ȃ�)
	//		(pval2��NULL�̏ꍇ�́A�V�K�f�[�^)
	//		(pval2���w�肳��Ă���ꍇ�́Apval2�̓��e���p�����čĊm��)
	//
	int count, size;
	NativePointer* ppunk;

	if (pval->len[1] < 1) pval->len[1] = 1;		// �z����Œ� 1 �͊m�ۂ���
	count = HspVarCoreCountElems(pval);
	size = count * sizeof(NativePointer);
	ppunk = (NativePointer*)sbAlloc(size);
	pval->mode = HSPVAR_MODE_MALLOC;
	for (int i = 0; i < count; i++) { ppunk[i] = nullptr; }
	if (pval2 != NULL) {
		memcpy(ppunk, pval->pt, pval->size);
		sbFree(pval->pt);
		if (pval->master != nullptr) delete pval->master;
	}
	pval->master = nullptr;
	pval->pt = (char *)ppunk;
	pval->size = size;
}

static void HspVarNetobj_ObjectMethod(PVal *pval)
{
	char *ps;
	int prm;
	NetClass^ ret;

	NativePointer pObj;
	pObj = *((NativePointer*)pval->pt);

	if (!GlobalAccess::IsActiveNativePtr(pObj)) throw HSPERR_COMDLL_ERROR;

	// ����:1 �i���\�b�h���j
	ps = code_gets();
	auto p1 = marshal_as<System::String^>(ps);

	// ����:2 �ȍ~�͉ϒ��i�R���X�g���N�^�����j
	List<NetClass^>^ listParams = gcnew List<NetClass^>();

	do
	{
		prm = code_get();

		if (prm == PARAM_OK || prm == PARAM_SPLIT)
		{
			switch (mpval->flag)
			{
			case HSPVAR_FLAG_STR:
			{
				listParams->Add(
					GlobalAccess::g_Hsp3Net->CreateString(
						marshal_as<System::String^>(mpval->pt)));
				break;
			}
			case HSPVAR_FLAG_INT:
			{
				listParams->Add(
					GlobalAccess::g_Hsp3Net->CreateInt32(*(int*)mpval->pt));
				break;
			}
			case HSPVAR_FLAG_DOUBLE:
			{
				listParams->Add(
					GlobalAccess::g_Hsp3Net->CreateDouble(*(double*)mpval->pt));
				break;
			}
			case TYPE_NETOBJ:
			{
				NativePointer native_ptr = *((NativePointer*)mpval->pt);
				auto managed_ptr = GlobalAccess::GetNativePtrToNetClass(native_ptr);
				if (managed_ptr == nullptr)
					throw HSPERR_TYPE_MISMATCH;
				listParams->Add(managed_ptr);
				break;
			}
			default:
				throw HSPERR_INVALID_TYPE;
			}
		}
	} while (PARAM_END < prm);
	
	ret = GlobalAccess::g_Hsp3Net->InvokeMethod(
		GlobalAccess::GetNativePtrToNetClass(pObj), p1, nullptr, listParams->ToArray());

	// �߂�l
	const auto ctx = code_getctx();
	ctx->stat = (ret != nullptr) ? 0 : -1;

	// netres �ɓn��
	if (ret != nullptr)
	{
		auto native_ptr = GlobalAccess::CreateNativePtr(ret);
		netget_variantres((NativePointer*)native_ptr);
	}
	
}

static int code_get_element(PVal *pval)
{
	// �ϐ��̔z��v�f�̎擾
	//
	PVal pvalTemp;
	int chk, idx;
	HspVarCoreReset(pval);
	while (1) {
		HspVarCoreCopyArrayInfo(&pvalTemp, pval);			// ��Ԃ�ۑ�
		chk = code_get();
		HspVarCoreCopyArrayInfo(pval, &pvalTemp);			// ��Ԃ𕜋A
		if (chk == PARAM_ENDSPLIT) {
			if (pval->arraycnt == 0) throw HSPERR_BAD_ARRAY_EXPRESSION;	// a() �\�L�̓G���[
			break;
		}
		if (chk != PARAM_OK && chk != PARAM_SPLIT) throw HSPERR_ARRAY_OVERFLOW;
		if (mpval->flag != HSPVAR_FLAG_INT) break;
		idx = *(int *)(mpval->pt);
		HspVarCoreArray(pval, idx);
	}
	return chk;
}

static void HspVarNetobj_ArrayObject(PVal *pval)
{
	//		�z��v�f�̎w�� (�A�z�z��p)
	int chk;
	NativePointer pThisObj;

	// �z��v�f�̎擾
	chk = code_get_element(pval);
	if (chk == PARAM_ENDSPLIT) return;	// �z��v�f���w�肳�ꂽ�ꍇ�͂��̂܂�

	// �v���p�e�B�ݒ莞
	pThisObj = *((NativePointer*)pval->pt);
	if (!GlobalAccess::IsActiveNativePtr(pThisObj)) throw HSPERR_COMDLL_ERROR;

	if (mpval->flag != HSPVAR_FLAG_STR) throw HSPERR_TYPE_MISMATCH;
	CStringA* pPropName = new CStringA((char *)(mpval->pt));
	if (pval->master != nullptr) delete pval->master;
	pval->master = pPropName;
}

static void HspVarNetobj_ObjectWrite(PVal *pval, void *data, int vtype)
{
	//		�ό^�̑��
	//

	char* propname;
	NativePointer pObj;
	pObj = *((NativePointer*)pval->pt);
	NetClass^ pValue;
	System::String^ PropName;
	bool isField;
	bool bRet;

	if (!GlobalAccess::IsActiveNativePtr(pObj)) throw HSPERR_COMDLL_ERROR;

	// master�ɂ���v���p�e�B��/�t�B�[���h��([$]������)���擾
	const auto pPropName = ((CStringA*)(pval->master));
	propname = pPropName->GetBuffer();

	// �t�B�[���h�ϐ�
	if ( propname[0] == '$') {
		PropName = marshal_as<System::String^>(propname + 1);
		isField = true;
	}
	else {
		PropName = marshal_as<System::String^>(propname);
		isField = false;
	}
	pPropName->ReleaseBuffer();

	switch (vtype)
	{
		case HSPVAR_FLAG_STR:
		{
			pValue = 
				GlobalAccess::g_Hsp3Net->CreateString(
					marshal_as<System::String^>((char *)data));
			break;
		}
		case HSPVAR_FLAG_INT:
		{
			pValue =
				GlobalAccess::g_Hsp3Net->CreateInt32(*(int*)data);
			break;
		}
		case HSPVAR_FLAG_DOUBLE:
		{
			pValue =
				GlobalAccess::g_Hsp3Net->CreateDouble(*(double*)data);
			break;
		}
		case TYPE_NETOBJ:
		{
			NativePointer native_ptr = *((NativePointer*)data);
			pValue = GlobalAccess::GetNativePtrToNetClass(native_ptr);
			if (pValue == nullptr)
				throw HSPERR_TYPE_MISMATCH;
			break;
		}
		default:
			throw HSPERR_INVALID_TYPE;
	}

	if (isField)
	{
		bRet = GlobalAccess::g_Hsp3Net->SetFieldValue(
			GlobalAccess::GetNativePtrToNetClass(pObj), PropName, pValue);
	}
	else {
		bRet = GlobalAccess::g_Hsp3Net->SetPropertyValue(
			GlobalAccess::GetNativePtrToNetClass(pObj), PropName, pValue, nullptr);
	}

	// �߂�l
	const auto ctx = code_getctx();
	ctx->stat = (bRet) ? 0 : -1;

}


static void *HspVarNetobj_ArrayObjectRead(PVal *pval, int *mptype)
{
	//		�z��v�f�̎w�� (�A�z�z��/�ǂݏo��)
	//
	void *ptr;
	int chk;
	char *propname;
	NativePointer pNP;
	NativePointer pThisObj;
	System::String^ PropName;
	bool isField;
	NetClass^ Ret;

	// �z��v�f�̎擾
	chk = code_get_element(pval);
	pNP = *(NativePointer*)HspVarNetobj_GetPtr(pval);
	if (chk == PARAM_ENDSPLIT) return pNP;	// �z��v�f���w�肳�ꂽ�ꍇ�͂��̂܂�

	// �v���p�e�B�擾��
	pThisObj = *((NativePointer*)pval->pt);
	if (!GlobalAccess::IsActiveNativePtr(pThisObj)) throw HSPERR_COMDLL_ERROR;
	if (mpval->flag != HSPVAR_FLAG_STR) throw (HSPERR_TYPE_MISMATCH);
	propname = (char *)(mpval->pt);

	// �t�B�[���h�ϐ�
	if ( propname[0] == '$') {
		PropName = marshal_as<System::String^>(propname + 1);
		isField = true;
	}
	else {
		PropName = marshal_as<System::String^>(propname);
		isField = false;
	}

	if ( isField)
	{
		Ret = GlobalAccess::g_Hsp3Net->GetFieldValue(
			GlobalAccess::GetNativePtrToNetClass(pThisObj), PropName);
	}
	else {
		Ret = GlobalAccess::g_Hsp3Net->GetPropertyValue(
			GlobalAccess::GetNativePtrToNetClass(pThisObj), PropName, nullptr);
	}

	if ( Ret == nullptr)
	{
		throw (HSPERR_COMDLL_ERROR);
	}

	// �߂�l
	const auto ctx = code_getctx();
	ctx->stat = (Ret != nullptr) ? 0 : -1;

	// TODO: �ϊ������ɕԂ��H�ǂ��H
	*mptype = TYPE_NETOBJ;
	return  GlobalAccess::CreateNativePtr(Ret);
}


// Size
static int HspVarNetobj_GetSize(const PDAT *pdatl)
{
	//		(���Ԃ̃|�C���^���n����܂�)
	return sizeof(NativePointer*);
}

// Using
static int HspVarNetobj_GetUsing(const PDAT *pdat)
{
	//		(���Ԃ̃|�C���^���n����܂�)
	return !GlobalAccess::IsActiveNativePtr((NativePointer**)pdat);
}

// Set
static void HspVarNetobj_Set(PVal *pval, PDAT *pdat, const void *in)
{
	NativePointer *ppunkSrc, *ppunkDst;

	ppunkDst = (NativePointer*)pdat;
	ppunkSrc = (NativePointer*)in;
	*ppunkDst = *ppunkSrc;
}


static void *GetBlockSize(PVal *pval, PDAT *pdat, int *size)
{
	*size = pval->size - (((char *)pdat) - pval->pt);
	return (pdat);
}

static void AllocBlock(PVal *pval, PDAT *pdat, int size)
{
}

// Eq
static void HspVarNetobj_EqI(PDAT *pdat, const void *val)
{
	NativePointer *ppunkSrc, *ppunkDst;

	ppunkDst = (NativePointer*)pdat;
	ppunkSrc = (NativePointer*)val;
	*ppunkDst = *ppunkSrc;

	*(int *)pdat = (ppunkDst == ppunkSrc);
	myproc->aftertype = HSPVAR_FLAG_INT;
}

// Ne
static void HspVarNetobj_NeI(PDAT *pdat, const void *val)
{
	NativePointer *ppunkSrc, *ppunkDst;

	ppunkDst = (NativePointer*)pdat;
	ppunkSrc = (NativePointer*)val;
	*ppunkDst = *ppunkSrc;

	*(int *)pdat = (ppunkDst != ppunkSrc);
	myproc->aftertype = HSPVAR_FLAG_INT;
}


/*------------------------------------------------------------*/

void HspVarNetobj_Init(HspVarProc *p)
{
	myproc = p;

	p->Set = HspVarNetobj_Set;
	p->Cnv = HspVarNetobj_Cnv;
	p->GetPtr = HspVarNetobj_GetPtr;
	p->CnvCustom = HspVarNetobj_CnvCustom;
	p->GetSize = HspVarNetobj_GetSize;
	p->GetUsing = HspVarNetobj_GetUsing;
	p->GetBlockSize = GetBlockSize;
	p->AllocBlock = AllocBlock;

	p->ArrayObject = HspVarNetobj_ArrayObject;
	p->ArrayObjectRead = HspVarNetobj_ArrayObjectRead;
	p->ObjectWrite = HspVarNetobj_ObjectWrite;
	p->ObjectMethod = HspVarNetobj_ObjectMethod;

	p->Alloc = HspVarNetobj_Alloc;
	p->Free = HspVarNetobj_Free;
	p->EqI = HspVarNetobj_EqI;
	p->NeI = HspVarNetobj_NeI;

	/*
		p->AddI = HspVarNetobj_Invalid;
		p->SubI = HspVarNetobj_Invalid;
		p->MulI = HspVarNetobj_Invalid;
		p->DivI = HspVarNetobj_Invalid;
		p->ModI = HspVarNetobj_Invalid;

		p->AndI = HspVarNetobj_Invalid;
		p->OrI  = HspVarNetobj_Invalid;
		p->XorI = HspVarNetobj_Invalid;

		p->EqI = HspVarNetobj_Invalid;
		p->NeI = HspVarNetobj_Invalid;
		p->GtI = HspVarNetobj_Invalid;
		p->LtI = HspVarNetobj_Invalid;
		p->GtEqI = HspVarNetobj_Invalid;
		p->LtEqI = HspVarNetobj_Invalid;

		p->RrI = HspVarNetobj_Invalid;
		p->LrI = HspVarNetobj_Invalid;
	*/
	p->vartype_name = "netobj";			// �^�C�v��
	p->version = 0x001;					// �^�^�C�v�����^�C���o�[�W����(0x100 = 1.0)
	p->support = HSPVAR_SUPPORT_STORAGE | HSPVAR_SUPPORT_ARRAYOBJ | HSPVAR_SUPPORT_NOCONVERT | HSPVAR_SUPPORT_VARUSE;
	// �T�|�[�g�󋵃t���O(HSPVAR_SUPPORT_*)
	p->basesize = sizeof(NativePointer);	// �P�̃f�[�^���g�p����T�C�Y(byte) / �ϒ��̎���-1
}
