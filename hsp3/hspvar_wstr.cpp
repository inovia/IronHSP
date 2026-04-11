
//
//	HSPVAR core module - wstr (UTF-16 LE wide string)
//	IronHSP 2026
//
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <wchar.h>
#include <stdint.h>
#include "hspvar_core.h"
#include "hsp3debug.h"
#include "strbuf.h"
#include "supio.h"

#ifdef HSPWIN
#include <windows.h>
#endif

/*------------------------------------------------------------*/
/*
		HSPVAR core interface (wstr - UTF-16 LE)
*/
/*------------------------------------------------------------*/

static HspVarProc *myproc;

// 変換用バッファ
static wchar_t wconv[1024];
static char conv_narrow[4096];

static wchar_t **GetFlexBufPtr( PVal *pval, int num )
{
	wchar_t **pp;
	if ( num == 0 ) return (wchar_t **)&(pval->pt);
	pp = (wchar_t **)(pval->master);
	return &pp[num];
}

// Core
static PDAT *HspVarWstr_GetPtr( PVal *pval )
{
	wchar_t **pp;
	pp = GetFlexBufPtr( pval, pval->offset );
	return (PDAT *)( *pp );
}

static void *HspVarWstr_Cnv( const void *buffer, int flag )
{
	//		リクエストされた型 -> wstr への変換
	//
	switch( flag ) {
	case HSPVAR_FLAG_STR:
	{
		// str (SJIS/UTF-8) → wstr (UTF-16)
#ifdef HSPWIN
		int len = MultiByteToWideChar(CP_ACP, 0, (const char *)buffer, -1, NULL, 0);
		if (len > 1023) len = 1023;
		MultiByteToWideChar(CP_ACP, 0, (const char *)buffer, -1, wconv, len);
		wconv[len] = 0;
#else
		mbstowcs(wconv, (const char *)buffer, 1023);
		wconv[1023] = 0;
#endif
		return wconv;
	}
	case HSPVAR_FLAG_INT:
		swprintf(wconv, 1024, L"%d", *(int *)buffer);
		return wconv;
	case HSPVAR_FLAG_INT64:
		swprintf(wconv, 1024, L"%lld", *(int64_t *)buffer);
		return wconv;
	case HSPVAR_FLAG_DOUBLE:
		swprintf(wconv, 1024, L"%f", *(double *)buffer);
		return wconv;
	case HSPVAR_FLAG_WSTR:
		break;
	default:
		throw HSPVAR_ERROR_TYPEMISS;
	}
	return (void *)buffer;
}

static void *HspVarWstr_CnvCustom( const void *buffer, int flag )
{
	//		wstr → リクエストされた型への変換
	//
	const wchar_t *ws = (const wchar_t *)buffer;
	switch( flag ) {
	case HSPVAR_FLAG_STR:
	{
#ifdef HSPWIN
		int len = WideCharToMultiByte(CP_ACP, 0, ws, -1, NULL, 0, NULL, NULL);
		if (len > (int)sizeof(conv_narrow) - 1) len = sizeof(conv_narrow) - 1;
		WideCharToMultiByte(CP_ACP, 0, ws, -1, conv_narrow, len, NULL, NULL);
		conv_narrow[len] = 0;
#else
		wcstombs(conv_narrow, ws, sizeof(conv_narrow) - 1);
		conv_narrow[sizeof(conv_narrow) - 1] = 0;
#endif
		return conv_narrow;
	}
	case HSPVAR_FLAG_INT:
	{
		static int ival;
		ival = (int)wcstol(ws, NULL, 10);
		return &ival;
	}
	case HSPVAR_FLAG_INT64:
	{
		static int64_t i64val;
		i64val = wcstoll(ws, NULL, 10);
		return &i64val;
	}
	case HSPVAR_FLAG_DOUBLE:
	{
		static double dval;
		dval = wcstod(ws, NULL);
		return &dval;
	}
	default:
		throw HSPVAR_ERROR_TYPEMISS;
	}
	return (void *)buffer;
}


static int GetVarSize( PVal *pval )
{
	int size;
	size = pval->len[1];
	if ( pval->len[2] ) size*=pval->len[2];
	if ( pval->len[3] ) size*=pval->len[3];
	if ( pval->len[4] ) size*=pval->len[4];
	size *= sizeof(wchar_t *);
	pval->size = size;
	return size;
}

static void HspVarWstr_Free( PVal *pval )
{
	wchar_t **pp;
	int i,size;
	if ( pval->mode == HSPVAR_MODE_MALLOC ) {
		size = GetVarSize( pval );
		for(i=0;i<(int)(size/sizeof(wchar_t *));i++) {
			pp = GetFlexBufPtr( pval, i );
			sbFree( (char *)*pp );
		}
		free( pval->master );
	}
	pval->mode = HSPVAR_MODE_NONE;
}


static void HspVarWstr_Alloc( PVal *pval, const PVal *pval2 )
{
	wchar_t **pp;
	int i, i2, size, bsize;
	PVal oldvar;
	if ( pval->len[1] < 1 ) pval->len[1] = 1;
	if ( pval2 != NULL ) oldvar = *pval2;

	size = GetVarSize( pval );
	pval->mode = HSPVAR_MODE_MALLOC;
	pval->master = (char *)calloc( size, 1 );
	if ( pval->master == NULL ) throw HSPERR_OUT_OF_MEMORY;

	if ( pval2 == NULL ) {
		bsize = pval->len[0];
		if ( bsize < 64 ) { bsize = 64; }
		// wchar_t 文字数 → バイト数に変換
		int byte_size = bsize * sizeof(wchar_t);
		if ( byte_size < STRBUF_BLOCKSIZE ) byte_size = STRBUF_BLOCKSIZE;
		for(i=0;i<(int)(size/sizeof(wchar_t *));i++) {
			pp = GetFlexBufPtr( pval, i );
			*pp = (wchar_t *)sbAllocClear( byte_size );
			sbSetOption( (char *)*pp, (void *)pp );
		}
		return;
	}

	i2 = oldvar.size / sizeof(wchar_t *);
	for(i=0;i<(int)(size/sizeof(wchar_t *));i++) {
		pp = GetFlexBufPtr( pval, i );
		if ( i>=i2 ) {
			*pp = (wchar_t *)sbAllocClear( 128 );
		} else {
			*pp = *GetFlexBufPtr( &oldvar, i );
		}
		sbSetOption( (char *)*pp, (void *)pp );
	}
	free( oldvar.master );
}


// Size (in bytes)
static int HspVarWstr_GetSize( const PDAT *pval )
{
	return (int)((wcslen( (const wchar_t *)pval ) + 1) * sizeof(wchar_t));
}

// Set
static void HspVarWstr_Set( PVal *pval, PDAT *pdat, const void *in )
{
	wchar_t **pp;
	if ( pval->mode == HSPVAR_MODE_CLONE ) {
		int max_chars = pval->size / sizeof(wchar_t);
		wcsncpy( (wchar_t *)pdat, (const wchar_t *)in, max_chars );
		return;
	}
	pp = (wchar_t **)sbGetOption( (char *)pdat );
	// wchar_t 文字列をコピー (sbStrCopy は char* 前提なので手動)
	int len = (int)(wcslen((const wchar_t *)in) + 1) * sizeof(wchar_t);
	*pp = (wchar_t *)sbExpand( (char *)*pp, len );
	memcpy( *pp, in, len );
}

// Add (文字列結合)
static void HspVarWstr_AddI( PDAT *pval, const void *val )
{
	wchar_t **pp;
	pp = (wchar_t **)sbGetOption( (char *)pval );
	// 結合後のサイズを計算
	int cur_len = (int)wcslen( (wchar_t *)*pp );
	int add_len = (int)wcslen( (const wchar_t *)val );
	int total_bytes = (cur_len + add_len + 1) * sizeof(wchar_t);
	*pp = (wchar_t *)sbExpand( (char *)*pp, total_bytes );
	wcscat( (wchar_t *)*pp, (const wchar_t *)val );
	myproc->aftertype = HSPVAR_FLAG_WSTR;
}

// Eq
static void HspVarWstr_EqI( PDAT *pdat, const void *val )
{
	if ( wcscmp( (const wchar_t *)pdat, (const wchar_t *)val ) ) {
		*(int *)pdat = 0;
	} else {
		*(int *)pdat = 1;
	}
	myproc->aftertype = HSPVAR_FLAG_INT;
}

// Ne
static void HspVarWstr_NeI( PDAT *pdat, const void *val )
{
	int i;
	i = wcscmp( (const wchar_t *)pdat, (const wchar_t *)val );
	if (i<0) i=-1;
	if (i>0) i=1;
	*(int *)pdat = i;
	myproc->aftertype = HSPVAR_FLAG_INT;
}


static void *GetBlockSize( PVal *pval, PDAT *pdat, int *size )
{
	STRINF *inf;
	if ( pval->mode == HSPVAR_MODE_CLONE ) {
		*size = pval->size;
		return pdat;
	}
	inf = sbGetSTRINF( (char *)pdat );
	*size = inf->size;
	return pdat;
}

static void AllocBlock( PVal *pval, PDAT *pdat, int size )
{
	wchar_t **pp;
	if ( pval->mode == HSPVAR_MODE_CLONE ) return;
	pp = (wchar_t **)sbGetOption( (char *)pdat );
	*pp = (wchar_t *)sbExpand( (char *)*pp, size );
}


/*------------------------------------------------------------*/

void HspVarWstr_Init( HspVarProc *p )
{
	myproc = p;

	p->Set = HspVarWstr_Set;
	p->Cnv = HspVarWstr_Cnv;
	p->CnvCustom = HspVarWstr_CnvCustom;
	p->GetPtr = HspVarWstr_GetPtr;
	p->GetSize = HspVarWstr_GetSize;
	p->GetBlockSize = GetBlockSize;
	p->AllocBlock = AllocBlock;

	p->Alloc = HspVarWstr_Alloc;
	p->Free = HspVarWstr_Free;

	p->AddI = HspVarWstr_AddI;
	p->EqI = HspVarWstr_EqI;
	p->NeI = HspVarWstr_NeI;

	p->vartype_name = "wstr";
	p->version = 0x001;
	p->support = HSPVAR_SUPPORT_FLEXSTORAGE | HSPVAR_SUPPORT_FLEXARRAY;
	p->basesize = -1;		// 可変長
}
