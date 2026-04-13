
//
//	HSPVAR core module (nstruct) — ネイティブ構造体型
//
//	#defstruct で定義された構造体を保持する変数型。
//	pval->len[0] にバイト単位の要素サイズ、pval->len[1..4] に配列次元、
//	pval->pt に生バイト列を格納する。
//
//	代入は同型同サイズの場合 memcpy で完結し、cfuncst の戻り値も
//	NSTRUCT として返ることで自動的にコピーされる。
//
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "hspvar_core.h"
#include "hsp3debug.h"

#include "strbuf.h"
#include "supio.h"

/*------------------------------------------------------------*/

//	#cfuncst の戻り値処理用「次回確保サイズ」ヒント。
//	reffunc_dllcmd が cfuncst を検出した時にここへサイズを書き込み、
//	直後の Alloc / Set / GetSize がこの値を参照する。
//	これにより `a = strmid(...)` と同じ感覚で `v = GetCameraTarget()` が動作する。
//	(明示的に dim していない変数も自動的に NSTRUCT として確保される)
int hsp_nstruct_pending_size = 0;

static HspVarProc *myproc;

// 要素サイズ (バイト) を取得 (pval->len[0] に格納)
static inline int nstruct_elemsize( const PVal *pval )
{
	int s = pval->len[0];
	return (s > 0) ? s : 1;
}

// 配列要素数を計算 (len[1..4] の積)
static int nstruct_count( const PVal *pval )
{
	int n = pval->len[1];
	if ( n <= 0 ) n = 1;
	if ( pval->len[2] > 0 ) n *= pval->len[2];
	if ( pval->len[3] > 0 ) n *= pval->len[3];
	if ( pval->len[4] > 0 ) n *= pval->len[4];
	return n;
}

// Core
static PDAT *HspVarNstruct_GetPtr( PVal *pval )
{
	return (PDAT *)( pval->pt + pval->offset * nstruct_elemsize(pval) );
}

static void *HspVarNstruct_Cnv( const void *buffer, int flag )
{
	//		リクエストされた型 -> 自分の型への変換
	//		(同型のみ受け付け、それ以外は型エラー)
	//
	if ( flag == HSPVAR_FLAG_NSTRUCT ) {
		return (void *)buffer;
	}
	throw HSPVAR_ERROR_TYPEMISS;
}

static int HspVarNstruct_GetSize( const PDAT *pdat )
{
	//		1要素のバイトサイズ。
	//		reffunc_dllcmd が hsp_nstruct_pending_size を設定している間は
	//		それを返す (cfuncst の戻り値を StackPush する時に必要)。
	return hsp_nstruct_pending_size;
}

static void HspVarNstruct_Free( PVal *pval )
{
	if ( pval->mode == HSPVAR_MODE_MALLOC ) {
		if ( pval->pt != NULL ) free( pval->pt );
	}
	pval->pt = NULL;
	pval->mode = HSPVAR_MODE_NONE;
}

static void HspVarNstruct_Alloc( PVal *pval, const PVal *pval2 )
{
	//		pval->len[0] = 1要素のバイトサイズ
	//		pval->len[1..4] = 配列次元
	//
	//		HspVarCoreDim 系から呼ばれた時は len[0]=1 となるため、
	//		hsp_nstruct_pending_size があればそれを採用する
	//		(`v = GetCameraTarget()` のような dim 省略代入に必要)。
	int elemsize = pval->len[0];
	if ( elemsize <= 1 && hsp_nstruct_pending_size > 0 ) {
		elemsize = hsp_nstruct_pending_size;
		pval->len[0] = elemsize;
	}
	if ( elemsize <= 0 ) elemsize = 1;

	if ( pval->len[1] < 1 ) pval->len[1] = 1;
	int count = nstruct_count(pval);
	int total = elemsize * count;

	pval->mode = HSPVAR_MODE_MALLOC;
	pval->size = total;
	pval->pt = (char *)calloc( total, 1 );
	if ( pval->pt == NULL ) throw HSPERR_OUT_OF_MEMORY;

	if ( pval2 != NULL && pval2->pt != NULL ) {
		int copy = (pval2->size < total) ? pval2->size : total;
		memcpy( pval->pt, pval2->pt, copy );
	}
}

// Set: 1要素分のバイト列をコピー
static void HspVarNstruct_Set( PVal *pval, PDAT *pdat, const void *in )
{
	memcpy( pdat, in, nstruct_elemsize(pval) );
}

// GetBlockSize: 指定要素のバイトサイズ (varptr 等で参照される)
static void *HspVarNstruct_GetBlockSize( PVal *pval, PDAT *pdat, int *size )
{
	*size = nstruct_elemsize(pval);
	return pdat;
}

/*------------------------------------------------------------*/

void HspVarNstruct_Init( HspVarProc *p )
{
	myproc = p;

	p->Set          = HspVarNstruct_Set;
	p->Cnv          = HspVarNstruct_Cnv;
	p->GetPtr       = HspVarNstruct_GetPtr;
	p->GetSize      = HspVarNstruct_GetSize;
	p->GetBlockSize = HspVarNstruct_GetBlockSize;
	p->Alloc        = HspVarNstruct_Alloc;
	p->Free         = HspVarNstruct_Free;

	p->vartype_name = "nstruct";
	p->version      = 0x001;
	p->support      = HSPVAR_SUPPORT_FIXEDARRAY | HSPVAR_SUPPORT_FLEXSIZE;
	p->basesize     = -1;
}

/*------------------------------------------------------------*/
