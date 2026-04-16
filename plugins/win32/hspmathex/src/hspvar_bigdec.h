//
//  hspvar_bigdec.h
//
//  BigDec (任意精度10進固定小数) を HSPVAR 拡張型として登録するヘッダ。
//  設計は hspvar_bigint.h とまったく同じ (不透明ハンドル方式)。
//
#ifndef __hspvar_bigdec_h
#define __hspvar_bigdec_h

#include "hspvar_core.h"

#ifdef __cplusplus
extern "C" {
#endif

void HspVarBigDec_Init(HspVarProc *p);
int  HspVarBigDec_typeid(void);

#ifdef __cplusplus
}
#endif

#ifdef __cplusplus
namespace hspmathex_t {

struct BigDec;  // 定義は .cpp

void  HspVarBigDec_SetRefValue(BigDec *p);
void *HspVarBigDec_GetRefValuePtr(void);
BigDec *HspVarBigDec_NewFromStr(const char *s);
void    HspVarBigDec_Delete(BigDec *p);

}  // namespace hspmathex_t
#endif

#endif
