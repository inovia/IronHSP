//
//  hspvar_bigint.h
//
//  BigInt (任意精度整数) を HSPVAR 拡張型として登録するためのヘッダ
//  hpi3type の hspvar_float.h と同じ構造で作ってある。
//
#ifndef __hspvar_bigint_h
#define __hspvar_bigint_h

#include "hspvar_core.h"

#ifdef __cplusplus
extern "C" {
#endif

// HSPVAR への登録エントリ。registvar 経由で呼ばれる。
void HspVarBigInt_Init(HspVarProc *p);

// 登録後に割り当てられた typeid を取得する (main.cpp の reffunc から参照)。
int  HspVarBigInt_typeid(void);

#ifdef __cplusplus
}
#endif

// ---- C++ レイヤ (BigInt 実体と変換ヘルパ) ----
//
// BigInt 本体は .cpp 側に純 C++ で定義し、ここからは不透明ハンドル (BigInt*)
// として扱う。変数 1 要素あたり BigInt* を 1 つ格納する (pt は BigInt* の配列)。

#ifdef __cplusplus

namespace hspmathex_t {

// 前方宣言。定義は hspvar_bigint.cpp にある。
struct BigInt;

// reffunc から BigInt* を渡すための静的バッファアクセサ。
// bigint("123") の戻り値を PDAT にセットする際、HSP ランタイムは Cnv を通して
// 値をコピーする。そのため「1 要素だけの BigInt* を返す」ポインタを用意する。
void  HspVarBigInt_SetRefValue(BigInt *p);
void *HspVarBigInt_GetRefValuePtr(void);

// C++ から新規 BigInt を確保して返すヘルパ (reffunc で使用)。
BigInt *HspVarBigInt_NewFromStr(const char *s);
// new で確保された BigInt を解放する (main.cpp から呼ぶ)。
void    HspVarBigInt_Delete(BigInt *p);

}  // namespace hspmathex_t

#endif  // __cplusplus

#endif
