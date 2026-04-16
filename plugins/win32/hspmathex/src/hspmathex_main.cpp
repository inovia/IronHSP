//
//  hspmathex_main.cpp — hspmathex.dll の HSPVAR 拡張型エントリ
//
//  hpi3type サンプルと同じ構造を踏襲:
//    - hsp3sdk_init でランタイムに接続
//    - reffunc で bigint("...") / bigdec("...") の関数形式の戻り値を捌く
//    - registvar で 2 つの変数型 (bigint, bigdec) を追加する
//
//  HSP 側からの呼び方:
//    #include "hspmathex.as"
//    a = bigint("12345678901234567890")
//    b = bigint("99999999999999999999")
//    c = a + b              ; HspVarBigInt_AddI が呼ばれる
//    mes str(c)             ; HspVarBigInt_CnvCustom で文字列へ
//    mes vartype(a)         ; "bigint"
//
//  DllMain は hspmathex_bigint.cpp に集約する (hspmathex_simd_init 呼び出し
//  とハンドルテーブル解放の面倒も見る)。本ファイルは hsp3cmdinit のみを担当。
//

#define WIN32_LEAN_AND_MEAN
#include <windows.h>
#include <cstdio>
#include <cstdlib>
#include <cstring>

#include "hsp3plugin.h"
#include "hspvar_bigint.h"
#include "hspvar_bigdec.h"

using hspmathex_t::HspVarBigInt_NewFromStr;
using hspmathex_t::HspVarBigInt_Delete;
using hspmathex_t::HspVarBigInt_SetRefValue;
using hspmathex_t::HspVarBigInt_GetRefValuePtr;
using hspmathex_t::HspVarBigDec_NewFromStr;
using hspmathex_t::HspVarBigDec_Delete;
using hspmathex_t::HspVarBigDec_SetRefValue;
using hspmathex_t::HspVarBigDec_GetRefValuePtr;

// ------------------------------------------------------------
// 静的な "戻り値保持 BigInt/BigDec" インスタンス。
// reffunc の度に値を書き換える。Set 側はディープコピーするので、
// 上書きされても変数側の値は壊れない。
// ------------------------------------------------------------
namespace {
hspmathex_t::BigInt *g_bigint_retval = nullptr;
hspmathex_t::BigDec *g_bigdec_retval = nullptr;
}

/*------------------------------------------------------------*/
/*
        controller
*/
/*------------------------------------------------------------*/

static void *reffunc(int *type_res, int cmd) {
    //  関数形式 (reffunc) 呼び出し
    //  ここでは bigint(...) / bigdec(...) を捌く

    // '(' で始まるかチェック
    if (*type != TYPE_MARK) puterror(HSPERR_INVALID_FUNCPARAM);
    if (*val != '(')        puterror(HSPERR_INVALID_FUNCPARAM);
    code_next();

    void *result_ptr = nullptr;

    switch (cmd) {
    case 0x00: {  // bigint(str)
        const char *s = code_gets();
        // 直前の戻り値を破棄
        if (g_bigint_retval) { HspVarBigInt_Delete(g_bigint_retval); g_bigint_retval = nullptr; }
        g_bigint_retval = HspVarBigInt_NewFromStr(s);
        HspVarBigInt_SetRefValue(g_bigint_retval);
        result_ptr = HspVarBigInt_GetRefValuePtr();
        *type_res = HspVarBigInt_typeid();
        break;
    }
    case 0x01: {  // bigdec(str)
        const char *s = code_gets();
        if (g_bigdec_retval) { HspVarBigDec_Delete(g_bigdec_retval); g_bigdec_retval = nullptr; }
        g_bigdec_retval = HspVarBigDec_NewFromStr(s);
        HspVarBigDec_SetRefValue(g_bigdec_retval);
        result_ptr = HspVarBigDec_GetRefValuePtr();
        *type_res = HspVarBigDec_typeid();
        break;
    }
    default:
        puterror(HSPERR_UNSUPPORTED_FUNCTION);
    }

    // ')' で終わるかチェック
    if (*type != TYPE_MARK) puterror(HSPERR_INVALID_FUNCPARAM);
    if (*val != ')')        puterror(HSPERR_INVALID_FUNCPARAM);
    code_next();

    return result_ptr;
}

/*------------------------------------------------------------*/

static int termfunc(int option) {
    //  プラグイン終了処理
    (void)option;
    if (g_bigint_retval) { HspVarBigInt_Delete(g_bigint_retval); g_bigint_retval = nullptr; }
    if (g_bigdec_retval) { HspVarBigDec_Delete(g_bigdec_retval); g_bigdec_retval = nullptr; }
    return 0;
}

/*------------------------------------------------------------*/
/*
        interface
*/
/*------------------------------------------------------------*/

// DllMain は hspmathex_bigint.cpp 側に集約しているのでここでは定義しない。

EXPORT void WINAPI hsp3cmdinit(HSP3TYPEINFO *info) {
    //  プラグイン初期化
    hsp3sdk_init(info);

    info->reffunc  = reffunc;
    info->termfunc = termfunc;

    // 2 つの新しい変数型を登録
    registvar(-1, HspVarBigInt_Init);
    registvar(-1, HspVarBigDec_Init);
}
