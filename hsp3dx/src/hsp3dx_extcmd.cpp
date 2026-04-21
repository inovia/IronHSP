//
//  hsp3dx_extcmd.cpp — hsp3dx 拡張命令テーブル (Phase 1.3)
//
//  hsp3/linux/hsp3gr_linux.cpp と hsp3dish/hsp3gr_dish.cpp を参考に、
//  描画系の基本 extcmd を DxLib 呼び出しで実装。
//
//  Phase 1.3 実装範囲:
//      mes / print / title / dialog   (Phase 1.2 から継続)
//      pos / color / cls / redraw     (描画状態)
//      pset / line / boxf / circle    (描画)
//
//  Phase 1.4 追加:
//      font "name", size, style       デフォルトフォント切り替え (SetFontSize / ChangeFont)
//      picload "file" [, mode]        画像ロード + 現在位置に描画
//
//  未実装 (Phase 1.5+):
//      gcopy / gmode / celload / celput / screen / buffer / gsel /
//      stick / getkey / mouse / wait 以外の input 系
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

static int p1, p2, p3, p4, p5;
static int reffunc_intfunc_ivalue;

/*------------------------------------------------------------*/
/*  描画状態 (HSP の BMSCR 相当を最小限だけ持つ)                */
/*------------------------------------------------------------*/

static int  s_cur_x      = 0;               // mes / line の始点 x
static int  s_cur_y      = 0;               // 同 y
static unsigned int s_cur_color = 0xFFFFFF; // r<<16 | g<<8 | b  (DxLib GetColor 値)
static int  s_font_size  = 18;              // 行高 / DrawString フォント高

static void advance_mes_y( void )
{
    s_cur_y += s_font_size;
    if ( s_cur_y > 4096 ) s_cur_y = 4096;   // 暴走防止
}

/*------------------------------------------------------------*/
/*  cmdfunc : TYPE_EXTCMD                                     */
/*------------------------------------------------------------*/

static int cmdfunc_extcmd( int cmd )
{
    code_next();                    // 先頭で必ず呼ぶ

    switch ( cmd ) {

    case 0x03:                      // dialog
        {
            char stmp[0x4000];
            char *ptr = code_getdsi( "" );
            strncpy( stmp, ptr, sizeof(stmp) - 1 );
            stmp[sizeof(stmp) - 1] = 0;
            p1 = code_getdi( 0 );
            char *title = code_getds( "hsp3dx" );
            MessageBoxA( nullptr, stmp, title, MB_OK );
            break;
        }

    case 0x0c:                      // pset
        {
            p1 = code_getdi( s_cur_x );
            p2 = code_getdi( s_cur_y );
            DrawPixel( p1, p2, s_cur_color );
            break;
        }

    case 0x0f:                      // mes, print
        {
            char *ptr = code_getdsi( "" );
            code_stmpstr( ptr );
            int sw = code_getdi( 0 );       // sw=1: 改行なし
            wchar_t wbuf[1024];
            hsp3dx_utf8_to_wide( ptr, wbuf, 1024 );
            DrawString( s_cur_x, s_cur_y, wbuf, s_cur_color );
            if ( sw == 0 ) advance_mes_y();
            break;
        }

    case 0x10:                      // title
        {
            char *p = code_gets();
            wchar_t wbuf[256];
            hsp3dx_utf8_to_wide( p, wbuf, 256 );
            SetMainWindowText( wbuf );
            break;
        }

    case 0x11:                      // pos
        s_cur_x = code_getdi( s_cur_x );
        s_cur_y = code_getdi( s_cur_y );
        break;

    case 0x12:                      // circle (x1,y1,x2,y2,fill)
        {
            p1 = code_getdi( 0 );
            p2 = code_getdi( 0 );
            p3 = code_getdi( 640 );
            p4 = code_getdi( 480 );
            p5 = code_getdi( 1 );
            //  HSP の circle は bounding box 指定。DxLib DrawCircle は中心+半径なので変換。
            int cx = ( p1 + p3 ) / 2;
            int cy = ( p2 + p4 ) / 2;
            int rx = abs( p3 - p1 ) / 2;
            int ry = abs( p4 - p2 ) / 2;
            int r  = ( rx < ry ) ? rx : ry;
            DrawCircle( cx, cy, r, s_cur_color, p5 );
            break;
        }

    case 0x14:                      // font "name", size, style
        {
            char *fontname = code_gets();
            p1 = code_getdi( 12 );      // size (default 12)
            p2 = code_getdi( 0 );       // style (太字/イタリックなどのビットフラグ)
            (void)code_getdi( 0 );      // effsize (Phase 1.4 では未使用)

            //  name が空なら size 変更のみ
            wchar_t wname[128];
            hsp3dx_utf8_to_wide( fontname, wname, 128 );
            if ( wname[0] != 0 ) {
                ChangeFont( wname, -1 );
            }
            SetFontSize( p1 );
            //  style ビット 0: bold, ビット 1: italic (DxLib は bold を
            //  SetFontThickness で、italic は CreateFontToHandle でしか
            //  扱えないため、Phase 1.4 では bold のみ反映)
            if ( p1 < 4 ) p1 = 4;
            SetFontThickness( ( p2 & 1 ) ? p1 / 4 : 1 );
            s_font_size = p1 + 4;       // 行送りはサイズ + 少し余白
            ctx->stat = 0;
            break;
        }

    case 0x17:                      // picload "file" [, mode]
        {
            char *fname = code_gets();
            p1 = code_getdi( 0 );       // mode (0=通常、1=追記描画: Phase 1.4 では常に通常)
            (void)p1;

            wchar_t wfname[512];
            hsp3dx_utf8_to_wide( fname, wfname, 512 );

            int hgr = LoadGraph( wfname );
            if ( hgr == -1 ) throw HSPERR_PICTURE_MISSING;
            DrawGraph( s_cur_x, s_cur_y, hgr, TRUE );
            DeleteGraph( hgr );         // Phase 1.4 MVP: 即描画後 dispose
            //  Phase 1.5 で celload/gcopy 用ハンドル保持を入れる
            break;
        }

    case 0x13:                      // cls
        {
            p1 = code_getdi( 0 );       // mode (色パレット番号、DxLib では未使用)
            SetDrawScreen( DX_SCREEN_BACK );
            ClearDrawScreen();
            s_cur_x = 0;
            s_cur_y = 0;
            break;
        }

    case 0x18:                      // color r,g,b
        p1 = code_getdi( 0 );
        p2 = code_getdi( 0 );
        p3 = code_getdi( 0 );
        s_cur_color = GetColor( p1, p2, p3 );
        break;

    case 0x1b:                      // redraw
        {
            p1 = code_getdi( 1 );
            (void)code_getdi( 0 );  // p2-p5 (部分 redraw 指定) は現状無視
            (void)code_getdi( 0 );
            (void)code_getdi( 0 );
            (void)code_getdi( 0 );
            if ( p1 & 1 ) {
                //  redraw 1 / 3 -> ScreenFlip (back → front)
                ScreenFlip();
            }
            //  redraw 0 は back buffer 描画のみ (auto flip 抑止)。
            //  DxLib では常に SetDrawScreen(DX_SCREEN_BACK) なので追加処理不要。
            break;
        }

    case 0x2f:                      // line (x1,y1,x2,y2)
        //  HSP: line x2,y2 は cx,cy から (x2,y2) へ。4 引数版は (x1,y1,x2,y2)
        //  ここでは hsp3dish と同じ (到達点 先, 始点 省略可) 順
        p1 = code_getdi( 0 );           // x2
        p2 = code_getdi( 0 );           // y2
        p3 = code_getdi( s_cur_x );     // x1 (default: cx)
        p4 = code_getdi( s_cur_y );     // y1 (default: cy)
        DrawLine( p3, p4, p1, p2, s_cur_color );
        s_cur_x = p1;
        s_cur_y = p2;
        break;

    case 0x31:                      // boxf (x1,y1,x2,y2) ※ すべて省略時は全面塗り
        p1 = code_getdi( 0 );
        p2 = code_getdi( 0 );
        p3 = code_getdi( 640 );
        p4 = code_getdi( 480 );
        //  DxLib DrawBox: (x1,y1,x2,y2,color, fill_flag)
        DrawBox( p1, p2, p3, p4, s_cur_color, TRUE );
        break;

    default:
        throw HSPERR_UNSUPPORTED_FUNCTION;
    }

    return RUNMODE_RUN;
}

/*------------------------------------------------------------*/
/*  reffunc : TYPE_EXTSYSVAR                                  */
/*------------------------------------------------------------*/

static void *reffunc_function( int *type_res, int arg )
{
    void *ptr;
    *type_res = HSPVAR_FLAG_INT;
    ptr = &reffunc_intfunc_ivalue;

    if ( *type != TYPE_MARK ) throw HSPERR_INVALID_FUNCPARAM;
    if ( *val  != '('       ) throw HSPERR_INVALID_FUNCPARAM;
    code_next();

    switch ( arg & 0xff ) {
    //  Phase 1.4+ で sysinfo / dirinfo / exist / length / strlen などを実装
    default:
        throw HSPERR_UNSUPPORTED_FUNCTION;
    }

    if ( *type != TYPE_MARK ) throw HSPERR_INVALID_FUNCPARAM;
    if ( *val  != ')'       ) throw HSPERR_INVALID_FUNCPARAM;
    code_next();

    return ptr;
}

/*------------------------------------------------------------*/

static int termfunc_extcmd( int /*option*/ )
{
    return 0;
}

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
