//
//  hsp3dxcl.cpp — hsp3dx 用 HSP3 ランタイムドライバ
//
//  hsp3/win32/hsp3cl.cpp (標準 Win32 コンソール版) をベースに、
//  COM / ComCtrl / Win32 Message Pump / Debug Dialog / DLL ロード系を外し、
//  cross-platform で動く最小構成にしたもの。
//
//  メッセージループは DxLib 側が持つので、msgfunc は内部の wait/await を
//  tick ベースで解決するだけの役割。process_message や DxLib の
//  ScreenFlip 呼び出しは main.cpp 側の毎フレームループで行う。
//
#include <stdio.h>
#include <string.h>
#include <windows.h>

#include "../../hsp3/hsp3config.h"
#include "../../hsp3/strbuf.h"
#include "../../hsp3/hsp3.h"
#include "../../hsp3/supio.h"
#include "../../hsp3/hspvar_core.h"

#include "hsp3dxcl.h"
#include "hsp3dx_console.h"   // hsp3dx_msgbox_utf8
#include "DxLib.h"

extern "C" {
    int hsp3typeinit_cl_extcmd( HSP3TYPEINFO *info );
    int hsp3typeinit_cl_extfunc( HSP3TYPEINFO *info );
}

//  Phase 5.5: #defstruct 対応のため NSTRUCT 型を登録 (C++ リンケージ)
void HspVarNstruct_Init( HspVarProc *p );

static Hsp3 *s_hsp = nullptr;
static HSPCTX *s_ctx = nullptr;

/*----------------------------------------------------------*/
/*  msgfunc — VM が wait/await で内部的に呼ぶコールバック */
/*----------------------------------------------------------*/

static void hsp3dxcl_msgfunc( HSPCTX *hspctx )
{
    //  hsp3cl.cpp の msgfunc から Win32 PeekMessage 依存を外し、
    //  単純な tick ベース wait のみにした版。DxLib 側のメインループは
    //  main.cpp が ProcessMessage を回しているので、ここでは VM が
    //  要求したブロック時間を素直に消化する。
    while ( true ) {
        //  VM が wait/await に入っている間も Windows メッセージを処理する。
        //  これをしないと X ボタンが効かない/マウスキー入力がペンディングになる。
        if ( ProcessMessage() == -1 ) {
            //  ウィンドウ閉じ要求 → VM を終了扱いに
            hspctx->runmode = RUNMODE_END;
            throw HSPERR_NONE;
        }

        int tick = (int)GetTickCount();
        switch ( hspctx->runmode ) {
        case RUNMODE_WAIT:
            hspctx->runmode = code_exec_wait( tick );
            // fall-through
        case RUNMODE_AWAIT:
            if ( code_exec_await( tick ) != RUNMODE_RUN ) {
                Sleep( 1 );
                continue;
            }
            return;
        case RUNMODE_STOP:
            //  hsp3dx では STOP は END と同じ扱い (デバッガ非搭載のため)
            throw HSPERR_NONE;
        case RUNMODE_END:
            throw HSPERR_NONE;
        case RUNMODE_RETURN:
            throw HSPERR_RETURN_WITHOUT_GOSUB;
        default:
            return;
        }
    }
}

/*----------------------------------------------------------*/
/*  init                                                    */
/*----------------------------------------------------------*/

int hsp3dxcl_init( const char *ax_path )
{
    s_hsp = new Hsp3();
    s_hsp->hspctx.instance = (HINSTANCE)GetModuleHandle( nullptr );

    if ( ax_path != nullptr && *ax_path ) {
        s_hsp->SetFileName( (char *)ax_path );
    }

    //  Reset(0) = debug mode (start.ax をパスから読む)。release mode の
    //  暗号化 .ax 対応は hsp3dx では当面不要なので扱わない。
    if ( s_hsp->Reset( 0 ) ) {
        //  .ax 読み込み or HSPHED パース失敗
        delete s_hsp;
        s_hsp = nullptr;
        return -1;
    }

    s_ctx = &s_hsp->hspctx;
    s_ctx->msgfunc = hsp3dxcl_msgfunc;
    s_ctx->hspstat |= 16;       // hsp3cl 互換: CL モード識別ビット

    //  拡張命令 / 拡張システム変数 の型情報を登録。実体は hsp3dx_stubs.cpp
    //  または iron_dxlib 将来版の拡張層で差し替え。
    hsp3typeinit_cl_extcmd( code_gettypeinfo( TYPE_EXTCMD ) );
    hsp3typeinit_cl_extfunc( code_gettypeinfo( TYPE_EXTSYSVAR ) );

    //  Phase 5.5: ネイティブ構造体型 (NSTRUCT) を登録。#defstruct で宣言された
    //  構造体変数はこの型で確保される。HSPVAR_FLAG_MAX を 12 に拡張済なので
    //  slot 11 は既に用意されている。
    HspVarCoreRegisterType( HSPVAR_FLAG_NSTRUCT,
                            (HSPVAR_COREFUNC)HspVarNstruct_Init );

    return 0;
}

/*----------------------------------------------------------*/
/*  exec                                                    */
/*----------------------------------------------------------*/

int hsp3dxcl_exec( void )
{
    if ( s_hsp == nullptr ) return -1;

    try {
        int runmode = code_execcmd();
        if ( runmode == RUNMODE_ERROR ) {
            HSPERROR err = code_geterror();
            int ln = code_getdebug_line();
            const char *msg = hspd_geterror( err );
            char buf[1024];
            if ( ln < 0 ) {
                snprintf( buf, sizeof(buf), "#Error %d\n--> %s\n", (int)err, msg );
            } else {
                snprintf( buf, sizeof(buf), "#Error %d in line %d\n--> %s\n", (int)err, ln, msg );
            }
            hsp3dx_msgbox_utf8( buf, "hsp3dx", MB_OK | MB_ICONERROR );
            return -1;
        }
        return s_ctx->endcode;
    } catch ( HSPERROR ) {
        return 0;   //  normal end via msgfunc throw
    } catch ( ... ) {
        return -1;
    }
}

/*----------------------------------------------------------*/
/*  bye                                                     */
/*----------------------------------------------------------*/

void hsp3dxcl_bye( void )
{
    if ( s_hsp != nullptr ) {
        delete s_hsp;
        s_hsp = nullptr;
        s_ctx = nullptr;
    }
}
