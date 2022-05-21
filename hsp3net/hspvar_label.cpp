
//
//	HSPVAR core module
//	onion software/onitama 2007/1
//
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "hsp3code.h"
#include "hspvar_core.h"
#include "hsp3debug.h"
#include "hspvar_label.h"

#include "strbuf.h"
#include "supio.h"

/*------------------------------------------------------------*/
/*
		HSPVAR core interface (label)
*/
/*------------------------------------------------------------*/

#define GetPtr(pval) ((HSPVAR_LABEL *)pval)

// Core
static PDAT *HspVarLabel_GetPtr( PVal *pval )
{
	return (PDAT *)(( (HSPVAR_LABEL *)(pval->pt))+pval->offset);
}


static int GetVarSize( PVal *pval )
{
	//		PVAL�|�C���^�̕ϐ����K�v�Ƃ���T�C�Y���擾����
	//		(size�t�B�[���h�ɐݒ肳���)
	//
	return HspVarCoreCountElems(pval) * sizeof(HSPVAR_LABEL);
}


static void HspVarLabel_Free( PVal *pval )
{
	//		PVAL�|�C���^�̕ϐ����������������
	//
	if ( pval->mode == HSPVAR_MODE_MALLOC ) { sbFree( pval->pt ); }
	pval->pt = NULL;
	pval->mode = HSPVAR_MODE_NONE;
}


static void HspVarLabel_Alloc( PVal *pval, const PVal *pval2 )
{
	//		pval�ϐ����K�v�Ƃ���T�C�Y���m�ۂ���B
	//		(pval�����łɊm�ۂ���Ă��郁��������͌Ăяo�������s�Ȃ�)
	//		(flag�̐ݒ�͌Ăяo�������s�Ȃ�)
	//		(pval2��NULL�̏ꍇ�́A�V�K�f�[�^)
	//		(pval2���w�肳��Ă���ꍇ�́Apval2�̓��e���p�����čĊm��)
	//
	HspVarCoreAllocPODArray(pval, pval2, sizeof(HSPVAR_LABEL));
}

// Size
static int HspVarLabel_GetSize( const PDAT *pval )
{
	return sizeof(HSPVAR_LABEL);
}

// Using
static int HspVarLabel_GetUsing( const PDAT *pdat )
{
	//		(���Ԃ̃|�C���^���n����܂�)
	return ( *pdat != NULL );
}

// Set
static void HspVarLabel_Set( PVal *pval, PDAT *pdat, const void *in )
{
	*GetPtr(pdat) = *((HSPVAR_LABEL *)(in));
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

void HspVarLabel_Init( HspVarProc *p )
{
	p->Set = HspVarLabel_Set;
	p->GetPtr = HspVarLabel_GetPtr;
	p->GetSize = HspVarLabel_GetSize;
	p->GetUsing = HspVarLabel_GetUsing;
	p->GetBlockSize = GetBlockSize;
	p->AllocBlock = AllocBlock;

	p->Alloc = HspVarLabel_Alloc;
	p->Free = HspVarLabel_Free;

	p->vartype_name = "label";				// �^�C�v��
	p->version = 0x001;					// �^�^�C�v�����^�C���o�[�W����(0x100 = 1.0)
	p->support = HSPVAR_SUPPORT_STORAGE | HSPVAR_SUPPORT_FLEXARRAY | HSPVAR_SUPPORT_VARUSE;
										// �T�|�[�g�󋵃t���O(HSPVAR_SUPPORT_*)
	p->basesize = sizeof(HSPVAR_LABEL);	// �P�̃f�[�^���g�p����T�C�Y(byte) / �ϒ��̎���-1
}

/*------------------------------------------------------------*/

