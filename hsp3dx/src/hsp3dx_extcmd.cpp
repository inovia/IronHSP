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
//  Phase 1.5 追加:
//      buffer ID, w, h                MakeScreen で描画可能なオフスクリーンを作成
//      screen 0, w, h                 メイン screen (現状 ID=0 専用、w/h は無視)
//      gsel ID                        描画対象をバッファ ID に切替 (SetDrawScreen)
//      celload "file", ID             画像ロードを指定 ID に保持 (LoadGraph)
//      celput ID [, frame, zx, zy, rot]  バッファ ID の画像を現在位置に描画
//      gcopy srcID, sx, sy, w, h      srcID の矩形を現在位置に描画 (DrawRectGraph)
//      gmode mode, w, h, alpha        ブレンドモード設定 (SetDrawBlendMode)
//
//  Phase 1.6 追加 (入力):
//      getkey var, keycode            キー状態取得 (CheckHitKey)
//      stick  var, nonstop [, exkey]  方向キー+ボタンのビットフィールド取得
//      mouse  x, y                    マウス位置設定 (SetMousePoint)
//      mousex / mousey / mousew       システム変数 (reffunc 経由)
//
//  Phase 1.7 追加 (音声):
//      mmload "file", ID [, option]   WAV/OGG 読み込み (LoadSoundMem)
//                                     option 0=one-shot / 1=BGM loop
//      mmplay ID                      再生 (PlaySoundMem)
//      mmstop [ID]                    停止 (ID 省略で -1 = 全停止)
//
//  Phase 1.8 追加 (reffunc 拡充):
//      mousex / mousey / mousew (既存)
//      sysinfo(p)  p=0:"Windows" / 1:CPU 情報 / 2:GPU / 3:language
//      dirinfo(p)  p=0:current / 1:exe / 4:cmdline / 6:langcode
//      hwnd         DxLib メインウィンドウハンドル (Win32 HWND)
//      ※ strlen / length / exist / varptr / int() / str() 等の組み込み関数と、
//         stat / refstr / refdval / cnt などの system variable は hsp3int.cpp /
//         hsp3code.cpp が自動登録するため追加実装不要 (hsp3/ コアリンクで動く)
//
//  未実装 (Phase 1.9+):
//      celdiv / gzoom / onkey / onclick (VM イベントディスパッチ要) /
//      mmvol / mmpan / mci
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

//  ---- Phase 1.5: buffer / cel 管理 ----
#define HSP3DX_MAX_BUFFERS 256
static int  s_buf_handle[HSP3DX_MAX_BUFFERS];   // DxLib graph handle (LoadGraph / MakeScreen の戻り値)、-1 = 未割当
static int  s_buf_w     [HSP3DX_MAX_BUFFERS];
static int  s_buf_h     [HSP3DX_MAX_BUFFERS];
static int  s_cur_window = 0;                   // gsel 現在値 (ID)

//  ---- Phase 1.7: sound 管理 ----
#define HSP3DX_MAX_SOUNDS 256
static int  s_snd_handle[HSP3DX_MAX_SOUNDS];    // DxLib sound handle、-1 = 未割当
static int  s_snd_option[HSP3DX_MAX_SOUNDS];    // HSP mmload option (0=one-shot, 1=loop)

static void init_sounds_once( void )
{
    static int initialized = 0;
    if ( initialized ) return;
    for ( int i = 0; i < HSP3DX_MAX_SOUNDS; i++ ) {
        s_snd_handle[i] = -1;
        s_snd_option[i] = 0;
    }
    initialized = 1;
}

//  ---- gmode state ----
static int  s_gmode       = 0;      // 0=copy, 2=key trans, 3=alpha, 5=add
static int  s_gmode_w     = 32;     // gcopy デフォルト幅
static int  s_gmode_h     = 32;     // gcopy デフォルト高
static int  s_gmode_alpha = 255;    // alpha パラメータ

static void init_buffers_once( void )
{
    static int initialized = 0;
    if ( initialized ) return;
    for ( int i = 0; i < HSP3DX_MAX_BUFFERS; i++ ) s_buf_handle[i] = -1;
    initialized = 1;
}

//  HSP の ID → DxLib 描画ターゲット解決
//  ID 0 は常にメイン画面 (DX_SCREEN_BACK)。それ以外は s_buf_handle[] を引く。
static int resolve_draw_target( int id )
{
    if ( id == 0 ) return DX_SCREEN_BACK;
    if ( id < 0 || id >= HSP3DX_MAX_BUFFERS ) return -1;
    return s_buf_handle[id];
}

//  HSP gmode → DxLib blend mode
static void apply_gmode_blend( void )
{
    switch ( s_gmode ) {
    case 0:
    case 2:     // 2 はキーカラー透過だが、DxLib は PNG アルファで代替
        SetDrawBlendMode( DX_BLENDMODE_NOBLEND, 0 );
        break;
    case 3:
        SetDrawBlendMode( DX_BLENDMODE_ALPHA, s_gmode_alpha );
        break;
    case 5:
        SetDrawBlendMode( DX_BLENDMODE_ADD, s_gmode_alpha );
        break;
    case 6:
        SetDrawBlendMode( DX_BLENDMODE_SUB, s_gmode_alpha );
        break;
    default:
        SetDrawBlendMode( DX_BLENDMODE_NOBLEND, 0 );
        break;
    }
}

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

    case 0x08:                      // mmload "file", ID, option
        {
            char *fname = code_gets();
            p1 = code_getdi( 0 );       // ID
            p2 = code_getdi( 0 );       // option (0=one-shot, 1=loop)
            if ( p1 < 0 || p1 >= HSP3DX_MAX_SOUNDS ) throw HSPERR_ILLEGAL_FUNCTION;

            wchar_t wfname[512];
            hsp3dx_utf8_to_wide( fname, wfname, 512 );

            if ( s_snd_handle[p1] != -1 ) DeleteSoundMem( s_snd_handle[p1] );
            int h = LoadSoundMem( wfname );
            if ( h == -1 ) throw HSPERR_FILE_IO;
            s_snd_handle[p1] = h;
            s_snd_option[p1] = p2;
            break;
        }

    case 0x09:                      // mmplay ID
        {
            p1 = code_getdi( 0 );
            if ( p1 < 0 || p1 >= HSP3DX_MAX_SOUNDS ) throw HSPERR_ILLEGAL_FUNCTION;
            int h = s_snd_handle[p1];
            if ( h == -1 ) throw HSPERR_FILE_IO;
            int play_type = ( s_snd_option[p1] & 1 ) ? DX_PLAYTYPE_LOOP : DX_PLAYTYPE_BACK;
            PlaySoundMem( h, play_type, TRUE );
            break;
        }

    case 0x0a:                      // mmstop [ID]
        {
            p1 = code_getdi( -1 );
            if ( p1 < 0 ) {
                //  全停止
                for ( int i = 0; i < HSP3DX_MAX_SOUNDS; i++ ) {
                    if ( s_snd_handle[i] != -1 ) StopSoundMem( s_snd_handle[i] );
                }
            } else {
                if ( p1 >= HSP3DX_MAX_SOUNDS ) throw HSPERR_ILLEGAL_FUNCTION;
                if ( s_snd_handle[p1] != -1 ) StopSoundMem( s_snd_handle[p1] );
            }
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

    case 0x1d:                      // gsel ID [, mode]
        {
            p1 = code_getdi( 0 );           // ID
            (void)code_getdi( 0 );          // mode (現状無視)
            int tgt = resolve_draw_target( p1 );
            if ( tgt == -1 ) throw HSPERR_BUFFER_OVERFLOW;
            SetDrawScreen( tgt );
            s_cur_window = p1;
            break;
        }

    case 0x1e:                      // gcopy srcID, sx, sy, w, h
        {
            p1 = code_getdi( 0 );           // src ID
            p2 = code_getdi( 0 );           // src x
            p3 = code_getdi( 0 );           // src y
            p4 = code_getdi( s_gmode_w );   // width
            p5 = code_getdi( s_gmode_h );   // height
            if ( p1 <= 0 || p1 >= HSP3DX_MAX_BUFFERS ) throw HSPERR_BUFFER_OVERFLOW;
            int src = s_buf_handle[p1];
            if ( src == -1 ) throw HSPERR_PICTURE_MISSING;
            apply_gmode_blend();
            DrawRectGraph( s_cur_x, s_cur_y, p2, p3, p4, p5, src, TRUE );
            s_cur_x += p4;                  // HSP の挙動に倣って描画後に x を進める
            break;
        }

    case 0x20:                      // gmode mode, w, h, alpha
        s_gmode       = code_getdi( 0 );
        s_gmode_w     = code_getdi( 32 );
        s_gmode_h     = code_getdi( 32 );
        s_gmode_alpha = code_getdi( 256 );
        //  HSP alpha は 0〜256、DxLib は 0〜255。256 は 255 に丸める
        if ( s_gmode_alpha > 255 ) s_gmode_alpha = 255;
        if ( s_gmode_alpha < 0   ) s_gmode_alpha = 0;
        break;

    case 0x29:                      // buffer ID, w, h
    case 0x2a:                      // screen ID, w, h (ID=0 限定)
    case 0x2b:                      // bgscr (hsp3dx では screen と同等扱い)
        {
            p1 = code_getdi( 0 );           // ID
            p2 = code_getdi( 640 );         // width
            p3 = code_getdi( 480 );         // height
            (void)code_getdi( 0 );          // option (現状無視)

            if ( cmd == 0x29 ) {
                if ( p1 <= 0 || p1 >= HSP3DX_MAX_BUFFERS ) throw HSPERR_ILLEGAL_FUNCTION;
                if ( s_buf_handle[p1] != -1 ) DeleteGraph( s_buf_handle[p1] );
                int h = MakeScreen( p2, p3, TRUE );
                if ( h == -1 ) throw HSPERR_BUFFER_OVERFLOW;
                s_buf_handle[p1] = h;
                s_buf_w[p1] = p2;
                s_buf_h[p1] = p3;
            } else {
                //  screen 0 または bgscr: Phase 1.5 では ID=0 以外はエラー、
                //  ID=0 の場合はサイズ変更を無視 (起動時 640x480 固定)
                if ( p1 != 0 ) throw HSPERR_ILLEGAL_FUNCTION;
            }
            break;
        }

    case 0x3c:                      // celload "file", ID
        {
            char *fname = code_gets();
            p1 = code_getdi( -2 );          // ID (デフォルト -2 = auto)
            (void)code_getdi( 0 );          // option

            //  ID < 0 なら空きを探す
            int id = p1;
            if ( id < 0 ) {
                for ( id = 1; id < HSP3DX_MAX_BUFFERS; id++ )
                    if ( s_buf_handle[id] == -1 ) break;
                if ( id >= HSP3DX_MAX_BUFFERS ) throw HSPERR_BUFFER_OVERFLOW;
            } else if ( id == 0 || id >= HSP3DX_MAX_BUFFERS ) {
                throw HSPERR_ILLEGAL_FUNCTION;
            }

            wchar_t wfname[512];
            hsp3dx_utf8_to_wide( fname, wfname, 512 );

            if ( s_buf_handle[id] != -1 ) DeleteGraph( s_buf_handle[id] );
            int hgr = LoadGraph( wfname );
            if ( hgr == -1 ) throw HSPERR_PICTURE_MISSING;
            s_buf_handle[id] = hgr;
            //  GetGraphSize で w/h 取得
            int w = 0, h = 0;
            GetGraphSize( hgr, &w, &h );
            s_buf_w[id] = w;
            s_buf_h[id] = h;
            ctx->stat = id;
            break;
        }

    case 0x3e:                      // celput ID [, frame, zx, zy, rot]
        {
            p1 = code_getdi( 1 );           // ID
            p2 = code_getdi( 0 );           // frame (現状無視、celdiv 未実装)
            double zx  = code_getdd( 1.0 );
            double zy  = code_getdd( 1.0 );
            double rot = code_getdd( 0.0 );
            (void)p2; (void)zy;

            if ( p1 <= 0 || p1 >= HSP3DX_MAX_BUFFERS ) throw HSPERR_BUFFER_OVERFLOW;
            int src = s_buf_handle[p1];
            if ( src == -1 ) throw HSPERR_PICTURE_MISSING;
            apply_gmode_blend();
            if ( rot == 0.0 && zx == 1.0 && zy == 1.0 ) {
                //  HSP celput は画像の中心を現在位置に置く仕様
                int cx = s_cur_x + s_buf_w[p1] / 2;
                int cy = s_cur_y + s_buf_h[p1] / 2;
                DrawRotaGraph( cx, cy, 1.0, 0.0, src, TRUE );
            } else {
                int cx = s_cur_x + (int)( s_buf_w[p1] * zx / 2.0 );
                int cy = s_cur_y + (int)( s_buf_h[p1] * zy / 2.0 );
                DrawRotaGraph( cx, cy, zx, rot, src, TRUE );
            }
            break;
        }

    case 0x23:                      // getkey var, keycode
        {
            PVal *pval;
            APTR aptr;
            aptr = code_getva( &pval );
            p1 = code_getdi( 1 );       // keycode (DxLib KEY_INPUT_* と同じ値)
            int pressed = CheckHitKey( p1 ) ? 1 : 0;
            code_setva( pval, aptr, TYPE_INUM, &pressed );
            break;
        }

    case 0x2c:                      // mouse x, y
        {
            //  HSP の mouse 命令は引数省略時はカーソル表示状態変更。
            //  hsp3dx Phase 1.6 MVP: x,y 指定時だけ座標設定、省略時は no-op。
            p1 = code_getdi( -1 );
            p2 = code_getdi( -1 );
            if ( p1 >= 0 && p2 >= 0 ) SetMousePoint( p1, p2 );
            break;
        }

    case 0x34:                      // stick var, nonstop_flag [, exkey]
        {
            PVal *pval;
            APTR aptr;
            aptr = code_getva( &pval );
            p1 = code_getdi( 0 );       // nonstop_flag (Phase 1.6 では未使用、全キー連続トリガ扱い)
            p2 = code_getdi( 0 );       // exkey (非 0 で追加キー含む)
            (void)p1;

            int bits = 0;
            if ( CheckHitKey( KEY_INPUT_LEFT  ) ) bits |= 0x01;
            if ( CheckHitKey( KEY_INPUT_UP    ) ) bits |= 0x02;
            if ( CheckHitKey( KEY_INPUT_RIGHT ) ) bits |= 0x04;
            if ( CheckHitKey( KEY_INPUT_DOWN  ) ) bits |= 0x08;
            if ( CheckHitKey( KEY_INPUT_SPACE ) ) bits |= 0x10;
            if ( CheckHitKey( KEY_INPUT_RETURN) ) bits |= 0x20;
            if ( GetMouseInput() & MOUSE_INPUT_LEFT ) bits |= 0x40;
            if ( CheckHitKey( KEY_INPUT_TAB   ) ) bits |= 0x80;
            if ( p2 ) {
                if ( CheckHitKey( KEY_INPUT_ESCAPE ) ) bits |= 0x100;
                if ( GetMouseInput() & MOUSE_INPUT_RIGHT ) bits |= 0x200;
            }
            code_setva( pval, aptr, TYPE_INUM, &bits );
            break;
        }

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

//  TYPE_EXTSYSVAR は引数なし sysvar (mousex / mousey 等) と
//  引数あり関数 (sysinfo(0) / dirinfo(0) 等) の混在用途。
//  `(` が次に来ていれば func とみなし、なければ sysvar として扱う。
static void *reffunc_function( int *type_res, int arg )
{
    void *ptr;
    *type_res = HSPVAR_FLAG_INT;
    ptr = &reffunc_intfunc_ivalue;

    //  引数あり (関数形式) かチェック
    int has_parens = ( *type == TYPE_MARK && *val == '(' );

    switch ( arg ) {
    case 0x000:                             // mousex
        {
            int mx = 0, my = 0;
            GetMousePoint( &mx, &my );
            reffunc_intfunc_ivalue = mx;
            break;
        }
    case 0x001:                             // mousey
        {
            int mx = 0, my = 0;
            GetMousePoint( &mx, &my );
            reffunc_intfunc_ivalue = my;
            break;
        }
    case 0x002:                             // mousew
        reffunc_intfunc_ivalue = 0;
        break;

    case 0x003:                             // hwnd
        reffunc_intfunc_ivalue = (int)(intptr_t)GetMainWindowHandle();
        break;

    case 0x004:                             // hinstance
        reffunc_intfunc_ivalue = (int)(intptr_t)GetModuleHandle( nullptr );
        break;

    case 0x005:                             // hdc (現状未取得、0 返し)
        reffunc_intfunc_ivalue = 0;
        break;

    case 0x102:                             // dirinfo(p)
        {
            if ( !has_parens ) throw HSPERR_INVALID_FUNCPARAM;
            code_next();
            int p = code_geti();
            if ( *type != TYPE_MARK || *val != ')' ) throw HSPERR_INVALID_FUNCPARAM;
            code_next();
            char *dst = ctx->stmp;
            *dst = 0;
            *type_res = HSPVAR_FLAG_STR;
            switch ( p ) {
            case 0: {
                wchar_t wbuf[_MAX_PATH];
                GetCurrentDirectoryW( _MAX_PATH, wbuf );
                WideCharToMultiByte( CP_UTF8, 0, wbuf, -1, dst, _MAX_PATH, nullptr, nullptr );
                break;
            }
            case 1: {
                wchar_t wbuf[_MAX_PATH];
                GetModuleFileNameW( nullptr, wbuf, _MAX_PATH );
                wchar_t *sep = nullptr;
                for ( wchar_t *p2 = wbuf; *p2; p2++ )
                    if ( *p2 == L'\\' || *p2 == L'/' ) sep = p2;
                if ( sep ) *sep = 0;
                WideCharToMultiByte( CP_UTF8, 0, wbuf, -1, dst, _MAX_PATH, nullptr, nullptr );
                break;
            }
            case 4:
                strncpy( dst, ctx->cmdline ? ctx->cmdline : "", HSPCTX_REFSTR_MAX - 1 );
                break;
            case 6:
                strcpy( dst, "ja" );
                break;
            default:
                *dst = 0;
                break;
            }
            return dst;
        }

    case 0x103:                             // sysinfo(p)
        {
            if ( !has_parens ) throw HSPERR_INVALID_FUNCPARAM;
            code_next();
            int p = code_geti();
            if ( *type != TYPE_MARK || *val != ')' ) throw HSPERR_INVALID_FUNCPARAM;
            code_next();
            char *dst = ctx->stmp;
            *dst = 0;
            switch ( p ) {
            case 0: strcpy( dst, "Windows" );               *type_res = HSPVAR_FLAG_STR; return dst;
            case 1: strcpy( dst, "x64 (hsp3dx Phase 1.8)" );*type_res = HSPVAR_FLAG_STR; return dst;
            case 2: strcpy( dst, "DxLib" );                 *type_res = HSPVAR_FLAG_STR; return dst;
            case 3: reffunc_intfunc_ivalue = 0x411; break;   // JP LCID
            default: reffunc_intfunc_ivalue = 0; break;
            }
            break;
        }

    default:
        throw HSPERR_UNSUPPORTED_FUNCTION;
    }

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

    init_buffers_once();
    init_sounds_once();

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
