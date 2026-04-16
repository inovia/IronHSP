
//
//	hspvar_map.h  -  Associative array (MAP) variable type
//	IronHSP
//

#ifndef __hspvar_map_h
#define __hspvar_map_h

#include "hspvar_core.h"

void HspVarMap_Init( HspVarProc *p );

// MAP 操作ヘルパー (hsp3int.cpp から使う)
void *HspVarMap_GetMapPtr( PVal *pval );		// 内部 MapData* を取得
int   HspVarMap_Count( PVal *pval );			// エントリ数
int   HspVarMap_Has( PVal *pval, const char *key );
void  HspVarMap_Delete( PVal *pval, const char *key );
void  HspVarMap_Clear( PVal *pval );
const char *HspVarMap_Key( PVal *pval, int index );

#endif
