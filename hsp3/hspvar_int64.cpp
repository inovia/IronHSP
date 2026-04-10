
//
//	HSPVAR core module - int64 type
//	onion software/onitama 2003/4
//	(int64 extension)
//
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>

#include "hsp3config.h"

#include "hspvar_core.h"
#include "hsp3debug.h"
#include "strbuf.h"
#include "supio.h"

/*------------------------------------------------------------*/
/*
		HSPVAR core interface (int64)
*/
/*------------------------------------------------------------*/

#define GetPtr(pval) ((int64_t *)pval)

static int64_t conv;
static char cnvbuf[64];


// Core
static PDAT *HspVarInt64_GetPtr( PVal *pval )
{
	return (PDAT *)(( (int64_t *)(pval->pt))+pval->offset);
}

static void *HspVarInt64_Cnv( const void *buffer, int flag )
{
	//		リクエストされた型 -> 自分の型への変換を行なう
	//
	switch( flag ) {
	case HSPVAR_FLAG_STR:
		if ( *(char *)buffer == '$' ) {
			conv = (int64_t)strtoll( (char *)buffer + 1, NULL, 16 );
		} else {
			conv = (int64_t)strtoll( (char *)buffer, NULL, 10 );
		}
		return &conv;
	case HSPVAR_FLAG_INT:
		conv = (int64_t)( *(int *)buffer );
		return &conv;
	case HSPVAR_FLAG_INT64:
		break;
	case HSPVAR_FLAG_DOUBLE:
		conv = (int64_t)( *(double *)buffer );
		return &conv;
	default:
		throw HSPVAR_ERROR_TYPEMISS;
	}
	return (void *)buffer;
}

static void *HspVarInt64_CnvCustom( const void *buffer, int flag )
{
	//		自分の型 -> リクエストされた型 への変換を行なう
	//		(カスタムタイプ用: int64はUSERDEF以前だが、
	//		 組み込み型のCnvだけでは int -> int64 方向の変換をカバーできないため用意)
	//
	switch( flag ) {
	case HSPVAR_FLAG_INT:
		{
			static int ival;
			ival = (int)( *(int64_t *)buffer );
			return &ival;
		}
	case HSPVAR_FLAG_DOUBLE:
		{
			static double dval;
			dval = (double)( *(int64_t *)buffer );
			return &dval;
		}
	case HSPVAR_FLAG_STR:
		{
			sprintf( cnvbuf, "%lld", *(int64_t *)buffer );
			return cnvbuf;
		}
	case HSPVAR_FLAG_INT64:
		break;
	default:
		throw HSPVAR_ERROR_TYPEMISS;
	}
	return (void *)buffer;
}


static int GetVarSize( PVal *pval )
{
	return HspVarCoreCountElems(pval) * sizeof(int64_t);
}


static void HspVarInt64_Free( PVal *pval )
{
	if ( pval->mode == HSPVAR_MODE_MALLOC ) { sbFree( pval->pt ); }
	pval->pt = NULL;
	pval->mode = HSPVAR_MODE_NONE;
}


static void HspVarInt64_Alloc( PVal *pval, const PVal *pval2 )
{
	HspVarCoreAllocPODArray(pval, pval2, sizeof(int64_t));
}


// Size
static int HspVarInt64_GetSize( const PDAT *pval )
{
	return sizeof(int64_t);
}

// Set
static void HspVarInt64_Set( PVal *pval, PDAT *pdat, const void *in )
{
	*GetPtr(pdat) = *((int64_t *)(in));
}

// Add
static void HspVarInt64_AddI( PDAT *pval, const void *val )
{
	*GetPtr(pval) += *((int64_t *)(val));
}

// Sub
static void HspVarInt64_SubI( PDAT *pval, const void *val )
{
	*GetPtr(pval) -= *((int64_t *)(val));
}

// Mul
static void HspVarInt64_MulI( PDAT *pval, const void *val )
{
	*GetPtr(pval) *= *((int64_t *)(val));
}

// Div
static void HspVarInt64_DivI( PDAT *pval, const void *val )
{
	int64_t p = *((int64_t *)(val));
	if ( p == 0 ) throw( HSPVAR_ERROR_DIVZERO );
	*GetPtr(pval) /= p;
}

// Mod
static void HspVarInt64_ModI( PDAT *pval, const void *val )
{
	int64_t p = *((int64_t *)(val));
	if ( p == 0 ) throw( HSPVAR_ERROR_DIVZERO );
	*GetPtr(pval) %= p;
}

// And
static void HspVarInt64_AndI( PDAT *pval, const void *val )
{
	*GetPtr(pval) &= *((int64_t *)(val));
}

// Or
static void HspVarInt64_OrI( PDAT *pval, const void *val )
{
	*GetPtr(pval) |= *((int64_t *)(val));
}

// Xor
static void HspVarInt64_XorI( PDAT *pval, const void *val )
{
	*GetPtr(pval) ^= *((int64_t *)(val));
}

// Eq
static void HspVarInt64_EqI( PDAT *pval, const void *val )
{
	*GetPtr(pval) = ( *GetPtr(pval) == *((int64_t *)(val)) );
}

// Ne
static void HspVarInt64_NeI( PDAT *pval, const void *val )
{
	*GetPtr(pval) = ( *GetPtr(pval) != *((int64_t *)(val)) );
}

// Gt
static void HspVarInt64_GtI( PDAT *pval, const void *val )
{
	*GetPtr(pval) = ( *GetPtr(pval) > *((int64_t *)(val)) );
}

// Lt
static void HspVarInt64_LtI( PDAT *pval, const void *val )
{
	*GetPtr(pval) = ( *GetPtr(pval) < *((int64_t *)(val)) );
}

// GtEq
static void HspVarInt64_GtEqI( PDAT *pval, const void *val )
{
	*GetPtr(pval) = ( *GetPtr(pval) >= *((int64_t *)(val)) );
}

// LtEq
static void HspVarInt64_LtEqI( PDAT *pval, const void *val )
{
	*GetPtr(pval) = ( *GetPtr(pval) <= *((int64_t *)(val)) );
}

// Rr
static void HspVarInt64_RrI( PDAT *pval, const void *val )
{
	*GetPtr(pval) >>= *((int64_t *)(val));
}

// Lr
static void HspVarInt64_LrI( PDAT *pval, const void *val )
{
	*GetPtr(pval) <<= *((int64_t *)(val));
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

void HspVarInt64_Init( HspVarProc *p )
{
	p->Set = HspVarInt64_Set;
	p->Cnv = HspVarInt64_Cnv;
	p->GetPtr = HspVarInt64_GetPtr;
	p->CnvCustom = HspVarInt64_CnvCustom;
	p->GetSize = HspVarInt64_GetSize;
	p->GetBlockSize = GetBlockSize;
	p->AllocBlock = AllocBlock;

	p->Alloc = HspVarInt64_Alloc;
	p->Free = HspVarInt64_Free;

	p->AddI = HspVarInt64_AddI;
	p->SubI = HspVarInt64_SubI;
	p->MulI = HspVarInt64_MulI;
	p->DivI = HspVarInt64_DivI;
	p->ModI = HspVarInt64_ModI;

	p->AndI = HspVarInt64_AndI;
	p->OrI  = HspVarInt64_OrI;
	p->XorI = HspVarInt64_XorI;

	p->EqI = HspVarInt64_EqI;
	p->NeI = HspVarInt64_NeI;
	p->GtI = HspVarInt64_GtI;
	p->LtI = HspVarInt64_LtI;
	p->GtEqI = HspVarInt64_GtEqI;
	p->LtEqI = HspVarInt64_LtEqI;

	p->RrI = HspVarInt64_RrI;
	p->LrI = HspVarInt64_LrI;

	p->vartype_name = "int64";					// タイプ名
	p->version = 0x001;							// 型タイプランタイムバージョン(0x100 = 1.0)
	p->support = HSPVAR_SUPPORT_STORAGE | HSPVAR_SUPPORT_FLEXARRAY;
	p->basesize = sizeof(int64_t);				// 1つのデータが使用するサイズ(byte)
}

/*------------------------------------------------------------*/
