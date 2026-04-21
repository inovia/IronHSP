//
//  hsp3dx_extcmd.cpp — hsp3dx 拡張命令テーブル実装 (Phase 1.2)
//
//  hsp3/linux/hsp3gr_linux.cpp を参考に、cross-platform で必要最小限の
//  extcmd (mes / title / dialog) を実装。未実装の命令は
//  HSPERR_UNSUPPORTED_FUNCTION を投げて VM に通知する。
//
//  Phase 1.3+ で cls / pos / font / color / stick / stop / getkey などを順次実装。
//
#include <stdio.h>
#include <string.h>
#include <windows.h>

#include "../../hsp3/hsp3config.h"
#include "../../hsp3/hsp3code.h"
#include "../../hsp3/hsp3debug.h"
#include "../../hsp3/supio.h"
#include "../../hsp3/strbuf.h"

#include "hsp3dx_console.h"
#include "DxLib.h"

static HSPCTX    *ctx    = nullptr;
static HSPEXINFO *exinfo = nullptr;
static int *type;
static int *val;

static int p1, p2, p3, p4;
static int reffunc_intfunc_ivalue;

/*------------------------------------------------------------*/
/*  cmdfunc : TYPE_EXTCMD                                     */
/*------------------------------------------------------------*/

static int cmdfunc_extcmd( int cmd )
{
    code_next();                    // 先頭で必ず呼ぶ (次命令への進行)

    switch ( cmd ) {

    case 0x03:                      // dialog
        {
            char stmp[0x4000];
            char *ptr = code_getdsi( "" );
            strncpy( stmp, ptr, sizeof(stmp) - 1 );
            stmp[sizeof(stmp) - 1] = 0;
            p1 = code_getdi( 0 );
            char *title = code_getds( "hsp3dx" );
            //  Phase 1.2: 素朴に Windows の MessageBox で代用。
            //  Phase 3 以降で DxLib にダイアログ UI を寄せる検討。
            MessageBoxA( nullptr, stmp, title, MB_OK );
            break;
        }

    case 0x0f:                      // mes, print
        {
            char *ptr = code_getdsi( "" );
            code_stmpstr( ptr );
            int sw = code_getdi( 0 );         // sw=1 なら改行しない (print)
            hsp3dx_console_append( ptr, sw ? 0 : 1 );
            break;
        }

    case 0x10:                      // title
        {
            char *p = code_gets();
            wchar_t wbuf[256];
            MultiByteToWideChar( CP_UTF8, 0, p, -1, wbuf, 256 );
            SetMainWindowText( wbuf );
            break;
        }

    default:
        throw HSPERR_UNSUPPORTED_FUNCTION;
    }

    return RUNMODE_RUN;
}

/*------------------------------------------------------------*/
/*  reffunc : TYPE_EXTSYSVAR (システム変数 / 組み込み関数)     */
/*------------------------------------------------------------*/

static void *reffunc_function( int *type_res, int arg )
{
    void *ptr;
    *type_res = HSPVAR_FLAG_INT;
    ptr = &reffunc_intfunc_ivalue;

    //  '(' チェック (関数形式の場合)
    if ( *type != TYPE_MARK ) throw HSPERR_INVALID_FUNCPARAM;
    if ( *val  != '('       ) throw HSPERR_INVALID_FUNCPARAM;
    code_next();

    switch ( arg & 0xff ) {
    //  Phase 1.3+ で sysinfo / dirinfo / exist / length / strlen などを実装
    default:
        throw HSPERR_UNSUPPORTED_FUNCTION;
    }

    if ( *type != TYPE_MARK ) throw HSPERR_INVALID_FUNCPARAM;
    if ( *val  != ')'       ) throw HSPERR_INVALID_FUNCPARAM;
    code_next();

    return ptr;
}

/*------------------------------------------------------------*/
/*  termfunc                                                  */
/*------------------------------------------------------------*/

static int termfunc_extcmd( int /*option*/ )
{
    return 0;
}

/*------------------------------------------------------------*/
/*  type init — hsp3dxcl.cpp から呼ばれる                      */
/*------------------------------------------------------------*/

extern "C" {

int hsp3typeinit_cl_extcmd( HSP3TYPEINFO *info )
{
    ctx    = info->hspctx;
    exinfo = info->hspexinfo;
    type   = exinfo->nptype;
    val    = exinfo->npval;

    info->cmdfunc  = cmdfunc_extcmd;
    info->termfunc = termfunc_extcmd;
    return 0;
}

int hsp3typeinit_cl_extfunc( HSP3TYPEINFO *info )
{
    info->reffunc = reffunc_function;
    return 0;
}

} // extern "C"
