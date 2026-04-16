
//
//	HSPVAR core module  -  Associative array (MAP) type
//	IronHSP
//
//	dimmap で確保し、map("key") = value / v = map("key") で読み書きする。
//	内部は std::unordered_map<std::string, std::string> で値は文字列として保持。
//

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>
#include <string>
#include <unordered_map>
#include <vector>

#include "hsp3config.h"
#include "hspvar_core.h"
#include "hsp3debug.h"
#include "strbuf.h"
#include "supio.h"
#include "hsp3code.h"

/*------------------------------------------------------------*/
/*
		Internal data structure
*/
/*------------------------------------------------------------*/

struct MapData {
	std::unordered_map<std::string, std::string> entries;
	std::string current_key;		// ArrayObject で保持する書き込み先キー
	std::string read_buf;			// ArrayObjectRead の戻り値バッファ
};

// PVal から MapData を取得
static MapData *GetMapData( PVal *pval )
{
	if ( pval->pt == NULL ) return NULL;
	return (MapData *)pval->pt;
}

static char conv[400];
static HspVarProc *myproc;

// 空文字列バッファ (未登録キー参照時)
static char empty_str[4] = "";

/*------------------------------------------------------------*/
/*
		HSPVAR core interface (map)
*/
/*------------------------------------------------------------*/

// Core
static PDAT *HspVarMap_GetPtr( PVal *pval )
{
	// ArrayObjectRead/ArrayObject 経由以外ではデフォルト値 (空文字列) を返す
	MapData *md = GetMapData( pval );
	if ( md == NULL ) return (PDAT *)empty_str;
	return (PDAT *)md->read_buf.c_str();
}


static void *HspVarMap_Cnv( const void *buffer, int flag )
{
	//		他の型 -> str への変換 (MAP は内部を文字列で保持するため str 変換に準拠)
	//
	switch( flag ) {
	case HSPVAR_FLAG_INT:
		sprintf( conv, "%d", *(int *)buffer );
		return conv;
	case HSPVAR_FLAG_STR:
		break;
	case HSPVAR_FLAG_INT64:
		sprintf( conv, "%lld", *(int64_t *)buffer );
		return conv;
	case HSPVAR_FLAG_DOUBLE:
		sprintf( conv, "%f", *(double *)buffer );
		return conv;
	default:
		throw HSPVAR_ERROR_TYPEMISS;
	}
	return (void *)buffer;
}


static void HspVarMap_Free( PVal *pval )
{
	if ( pval->mode == HSPVAR_MODE_MALLOC ) {
		MapData *md = GetMapData( pval );
		if ( md ) { delete md; }
	}
	pval->pt = NULL;
	pval->mode = HSPVAR_MODE_NONE;
}


static void HspVarMap_Alloc( PVal *pval, const PVal *pval2 )
{
	//		新規 MAP を確保する
	//		pval2 != NULL の場合は再確保 (既存データを引き継ぐ)
	//
	MapData *md;
	if ( pval2 != NULL ) {
		// 再確保: 既存データはそのまま保持
		return;
	}
	md = new MapData();
	pval->pt = (char *)md;
	pval->mode = HSPVAR_MODE_MALLOC;
	pval->len[1] = 1;
	pval->len[2] = 0;
	pval->len[3] = 0;
	pval->len[4] = 0;
	pval->size = sizeof(MapData *);
}


// Size
static int HspVarMap_GetSize( const PDAT *pval )
{
	return (int)( strlen( (char *)pval ) + 1 );
}


// Set  (ArrayObject で current_key が設定された後に呼ばれる)
static void HspVarMap_Set( PVal *pval, PDAT *pdat, const void *in )
{
	MapData *md = GetMapData( pval );
	if ( md == NULL ) throw HSPERR_ILLEGAL_FUNCTION;
	// current_key に対して値を設定
	md->entries[ md->current_key ] = (const char *)in;
}


// ObjectWrite  (NOCONVERT 時の代入: 任意型を受け取って文字列化して格納)
static void HspVarMap_ObjectWrite( PVal *pval, void *data, int vtype )
{
	MapData *md = GetMapData( pval );
	if ( md == NULL ) throw HSPERR_ILLEGAL_FUNCTION;
	// 値を文字列に変換
	const char *str;
	char tmp[400];
	switch ( vtype ) {
	case HSPVAR_FLAG_STR:
		str = (const char *)data;
		break;
	case HSPVAR_FLAG_INT:
		sprintf( tmp, "%d", *(int *)data );
		str = tmp;
		break;
	case HSPVAR_FLAG_INT64:
		sprintf( tmp, "%lld", *(int64_t *)data );
		str = tmp;
		break;
	case HSPVAR_FLAG_DOUBLE:
		sprintf( tmp, "%f", *(double *)data );
		str = tmp;
		break;
	default:
		throw HSPVAR_ERROR_TYPEMISS;
	}
	md->entries[ md->current_key ] = str;
}


// ArrayObject  (書き込み準備: キーをコードストリームから読んで保持)
static void HspVarMap_ArrayObject( PVal *pval )
{
	MapData *md = GetMapData( pval );
	if ( md == NULL ) throw HSPERR_ILLEGAL_FUNCTION;

	char *key = code_gets();
	md->current_key = key;
}


// ArrayObjectRead  (読み出し: キーで検索して値のポインタを返す)
static void *HspVarMap_ArrayObjectRead( PVal *pval, int *mptype )
{
	MapData *md = GetMapData( pval );
	if ( md == NULL ) throw HSPERR_ILLEGAL_FUNCTION;

	char *key = code_gets();

	auto it = md->entries.find( key );
	if ( it != md->entries.end() ) {
		md->read_buf = it->second;
	} else {
		md->read_buf.clear();
	}
	*mptype = HSPVAR_FLAG_STR;
	return (void *)md->read_buf.c_str();
}


// GetUsing (varuse 用: エントリが 1 つ以上あれば使用中)
static int HspVarMap_GetUsing( const PDAT *pdat )
{
	return 1;
}


static void *GetBlockSize( PVal *pval, PDAT *pdat, int *size )
{
	*size = (int)( strlen( (char *)pdat ) + 1 );
	return (pdat);
}

static void AllocBlock( PVal *pval, PDAT *pdat, int size )
{
	// MAP では個別要素のブロック拡張は不要
}


// Add (文字列結合として実装)
static void HspVarMap_AddI( PDAT *pval, const void *val )
{
	throw HSPERR_UNSUPPORTED_FUNCTION;
}

// Eq
static void HspVarMap_EqI( PDAT *pdat, const void *val )
{
	if ( strcmp( (char *)pdat, (char *)val ) ) {
		*(int *)pdat = 0;
	} else {
		*(int *)pdat = 1;
	}
	myproc->aftertype = HSPVAR_FLAG_INT;
}

// Ne
static void HspVarMap_NeI( PDAT *pdat, const void *val )
{
	int i = strcmp( (char *)pdat, (char *)val );
	if (i<0) i=-1;
	if (i>0) i=1;
	*(int *)pdat = i;
	myproc->aftertype = HSPVAR_FLAG_INT;
}


/*------------------------------------------------------------*/

void HspVarMap_Init( HspVarProc *p )
{
	myproc = p;

	p->Set = HspVarMap_Set;
	p->Cnv = HspVarMap_Cnv;
	p->GetPtr = HspVarMap_GetPtr;
	p->GetSize = HspVarMap_GetSize;
	p->GetBlockSize = GetBlockSize;
	p->AllocBlock = AllocBlock;

	p->ArrayObject = HspVarMap_ArrayObject;
	p->ArrayObjectRead = HspVarMap_ArrayObjectRead;
	p->ObjectWrite = HspVarMap_ObjectWrite;

	p->Alloc = HspVarMap_Alloc;
	p->Free = HspVarMap_Free;

	p->GetUsing = HspVarMap_GetUsing;

	p->EqI = HspVarMap_EqI;
	p->NeI = HspVarMap_NeI;

	p->vartype_name = "map";
	p->version = 0x001;
	p->support = HSPVAR_SUPPORT_STORAGE
				| HSPVAR_SUPPORT_ARRAYOBJ
				| HSPVAR_SUPPORT_NOCONVERT
				| HSPVAR_SUPPORT_VARUSE;
	p->basesize = -1;		// 可変長
}


/*------------------------------------------------------------*/
/*
		Public helper functions (hsp3int.cpp から呼ぶ)
*/
/*------------------------------------------------------------*/

void *HspVarMap_GetMapPtr( PVal *pval )
{
	return (void *)GetMapData( pval );
}

int HspVarMap_Count( PVal *pval )
{
	MapData *md = GetMapData( pval );
	if ( md == NULL ) return 0;
	return (int)md->entries.size();
}

int HspVarMap_Has( PVal *pval, const char *key )
{
	MapData *md = GetMapData( pval );
	if ( md == NULL ) return 0;
	return md->entries.count( key ) > 0 ? 1 : 0;
}

void HspVarMap_Delete( PVal *pval, const char *key )
{
	MapData *md = GetMapData( pval );
	if ( md == NULL ) return;
	md->entries.erase( key );
}

void HspVarMap_Clear( PVal *pval )
{
	MapData *md = GetMapData( pval );
	if ( md == NULL ) return;
	md->entries.clear();
}

const char *HspVarMap_Key( PVal *pval, int index )
{
	MapData *md = GetMapData( pval );
	if ( md == NULL ) return "";
	if ( index < 0 || index >= (int)md->entries.size() ) return "";
	auto it = md->entries.begin();
	std::advance( it, index );
	// 静的バッファに格納して返す
	static std::string key_buf;
	key_buf = it->first;
	return key_buf.c_str();
}

/*------------------------------------------------------------*/
