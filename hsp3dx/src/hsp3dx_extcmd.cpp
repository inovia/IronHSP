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
//
//  Phase 5.0 追加 (DxLib 活用):
//      gzoom / bmpsave / hsvcolor / ginfo(p)
//
//  Phase 1.10 追加 (HSP 標準の残り):
//      grect x, y, angle, wx, wy       回転矩形塗り (DrawTriangle ×2)
//      grotate srcID, sx, sy, angle    回転画像コピー (DrawRotaGraph)
//      gradf x, y, w, h, mode, c1, c2  2 色グラデーション塗り
//      mmvol ID, vol                   サウンド音量 (0..100)
//      mmpan ID, pan                   サウンド定位 (-10000..+10000)
//      mmstat ID                       再生中?を stat に (1=再生中 / 0=停止)
//
//  未実装 (将来):
//      celdiv / onkey / onclick (VM イベントディスパッチ要) / mci
//
#include <stdio.h>
#include <string.h>
#include <math.h>
#include <windows.h>

#include "../../hsp3/hsp3config.h"
#include "../../hsp3/hsp3code.h"
#include "../../hsp3/hsp3debug.h"
#include "../../hsp3/supio.h"
#include "../../hsp3/strbuf.h"

#include "hsp3dx_console.h"
#include "hsp3dx_http.h"
#include "hsp3dx_json.h"
#include "hsp3dx_ws.h"
#include "DxLib.h"

//  Phase 5.3 自動生成 DxLib binding (opcode 0x200〜0x3FF)
extern "C" int hsp3dx_dxlib_auto_dispatch( int cmd, HSPCTX *ctx );

static HSPCTX    *ctx    = nullptr;
static HSPEXINFO *exinfo = nullptr;
static int *type;
static int *val;

static int p1, p2, p3, p4, p5;
static int reffunc_intfunc_ivalue;

//  ---- Phase 5.5k: DxLib コールバック用ラベルスロット ----
//  仕様書 (hsp3dx_spec.md) の「静的スロット方式」。各 DxLib 関数 1 本につき
//  1 グローバルラベルポインタを持ち、C スタブが code_callback() で呼び戻す。
static unsigned short *s_cb_restore_graph      = nullptr;
static unsigned short *s_cb_restore_shredpoint = nullptr;
static unsigned short *s_cb_gfxdev_restore     = nullptr;
static unsigned short *s_cb_gfxdev_lost        = nullptr;
static unsigned short *s_cb_async_load_finish  = nullptr;
//  ASyncLoadFinish の引数 (int handle, void *data) を HSP 側に渡すための緯覧
static int    s_cb_async_handle = 0;
static void  *s_cb_async_data   = nullptr;

static void hsp3dx_cb_stub_restore_graph( void )
{
    if ( s_cb_restore_graph ) code_callback( s_cb_restore_graph );
}
static void hsp3dx_cb_stub_restore_shredpoint( void )
{
    if ( s_cb_restore_shredpoint ) code_callback( s_cb_restore_shredpoint );
}
static void hsp3dx_cb_stub_gfxdev_restore( void *data )
{
    s_cb_async_data = data;
    if ( s_cb_gfxdev_restore ) code_callback( s_cb_gfxdev_restore );
}
static void hsp3dx_cb_stub_gfxdev_lost( void *data )
{
    s_cb_async_data = data;
    if ( s_cb_gfxdev_lost ) code_callback( s_cb_gfxdev_lost );
}
static void hsp3dx_cb_stub_async_load_finish( int handle, void *data )
{
    s_cb_async_handle = handle;
    s_cb_async_data   = data;
    if ( s_cb_async_load_finish ) code_callback( s_cb_async_load_finish );
}

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
//  ---- Phase 1.11: celdiv 情報 (スプライトシート分割) ----
static int  s_buf_cel_w [HSP3DX_MAX_BUFFERS];   // cell 幅 (0 = celdiv 未指定、画像全体)
static int  s_buf_cel_h [HSP3DX_MAX_BUFFERS];   // cell 高
static int  s_buf_cel_ox[HSP3DX_MAX_BUFFERS];   // 描画原点 x オフセット
static int  s_buf_cel_oy[HSP3DX_MAX_BUFFERS];   // 描画原点 y オフセット
static int  s_cur_window = 0;                   // gsel 現在値 (ID)

//  ---- Phase 5.4a: HTTP クライアントの状態 ----
static int   s_http_timeout_ms       = 30000;
//  HTTP ヘッダの実用上限は 16KB (nginx/apache デフォルト)。余裕を持って 32KB。
static char  s_http_extra_headers[32768] = { 0 };
static char  s_http_user_agent[512]      = { 0 };   // 空=デフォルト "hsp3dx/1.0"

//  最後のレスポンスヘッダ (dx_http_get_res_header 用)。
//  dx_http_get/post/put/delete/patch/download の終了時に更新。
//  malloc 所有、前のものは free してから差し替える。
static char *s_http_last_headers = nullptr;

static void http_save_last_headers( const char *headers )
{
    if ( s_http_last_headers ) { free( s_http_last_headers ); s_http_last_headers = nullptr; }
    if ( headers && headers[0] ) s_http_last_headers = _strdup( headers );
}

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
    for ( int i = 0; i < HSP3DX_MAX_BUFFERS; i++ ) {
        s_buf_handle[i] = -1;
        s_buf_cel_w[i]  = 0;
        s_buf_cel_h[i]  = 0;
        s_buf_cel_ox[i] = 0;
        s_buf_cel_oy[i] = 0;
    }
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
            hsp3dx_msgbox_utf8( stmp, title, MB_OK );
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

    case 0x042:                     // mmvol ID, vol
        {
            int id  = code_getdi( 0 );
            int vol = code_getdi( 1000 );
            if ( id < 0 || id >= HSP3DX_MAX_SOUNDS ) throw HSPERR_ILLEGAL_FUNCTION;
            if ( s_snd_handle[id] == -1 ) throw HSPERR_FILE_IO;
            //  DxLib SetVolumeSoundMem は **0..10000** 線形スケール (0=mute, 10000=max)。
            //  ヘッダコメントの "100 で 1 デシベル単位 0〜10000" は誤解を招くが、
            //  実挙動は 10000 で最大音量、0 で無音。
            //  HSP mmvol は簡易 0..1000 スケールで、1000 = 最大音量とする。
            int dx_vol = vol * 10;
            if ( dx_vol < 0 )     dx_vol = 0;
            if ( dx_vol > 10000 ) dx_vol = 10000;
            SetVolumeSoundMem( dx_vol, s_snd_handle[id] );
            break;
        }

    case 0x043:                     // mmpan ID, pan
        {
            int id  = code_getdi( 0 );
            int pan = code_getdi( 0 );          // -10000..+10000
            if ( id < 0 || id >= HSP3DX_MAX_SOUNDS ) throw HSPERR_ILLEGAL_FUNCTION;
            if ( s_snd_handle[id] == -1 ) throw HSPERR_FILE_IO;
            SetPanSoundMem( pan, s_snd_handle[id] );
            break;
        }

    case 0x044:                     // mmstat (result in stat)
        {
            int id = code_getdi( 0 );
            if ( id < 0 || id >= HSP3DX_MAX_SOUNDS ) { ctx->stat = 0; break; }
            if ( s_snd_handle[id] == -1 )            { ctx->stat = 0; break; }
            ctx->stat = CheckSoundMem( s_snd_handle[id] ) ? 1 : 0;
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

    case 0x0d:                      // pget x, y  (読み取った色を ctx->stat にパック RGB)
        {
            int x = code_getdi( s_cur_x );
            int y = code_getdi( s_cur_y );
            int dxc = GetPixel( x, y );
            //  DxLib GetPixel の戻り値をパック RGB (0xRRGGBB) に変換
            int r, g, b;
            GetColor2( dxc, &r, &g, &b );
            ctx->stat = ( r << 16 ) | ( g << 8 ) | b;
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

            //  DxLib DrawString は \n を含む文字列を内部行高で複数行描画するが、
            //  その内部行高は hsp3dx の s_font_size と一致しない。そのため
            //  ユーザー制御の s_font_size で整えるには、\n で手動分割して
            //  1 行ずつ DrawString + advance_mes_y する必要がある。
            const char *line_start = ptr;
            const char *p = ptr;
            while ( true ) {
                bool at_end = ( *p == 0 );
                if ( *p == '\n' || at_end ) {
                    //  \r\n (CRLF) 対応: 行末の \r を捨てて描画対象から除外する
                    int line_len = (int)( p - line_start );
                    while ( line_len > 0 && line_start[line_len - 1] == '\r' ) line_len--;

                    int wcap = line_len + 4;
                    if ( wcap < 64 ) wcap = 64;
                    wchar_t *wbuf = (wchar_t *)malloc( wcap * sizeof(wchar_t) );
                    if ( wbuf ) {
                        char *tmp = (char *)malloc( line_len + 1 );
                        if ( tmp ) {
                            memcpy( tmp, line_start, line_len );
                            tmp[line_len] = 0;
                            hsp3dx_utf8_to_wide( tmp, wbuf, wcap );
                            DrawString( s_cur_x, s_cur_y, wbuf, s_cur_color );
                            free( tmp );
                        }
                        free( wbuf );
                    }
                    if ( !at_end ) advance_mes_y();
                    line_start = p + 1;
                    if ( at_end ) break;
                }
                p++;
            }
            //  末尾の暗黙改行 (sw==0) は最後に 1 行進める
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
            //  行送り: DxLib DrawString は font size をポイント近似で解釈、
            //  日本語フォント (MS Gothic 等) は ascender+descender で 1.5 倍近い
            //  高さになる。さらに余白 3 入れて読みやすさ優先。
            s_font_size = ( p1 * 3 + 1 ) / 2 + 3;       // ≒ 1.5x + 3
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

    case 0x1f:                      // gzoom dst_w, dst_h, srcID, sx, sy, w, h
        {
            int dw = code_getdi( s_gmode_w );
            int dh = code_getdi( s_gmode_h );
            int id = code_getdi( 0 );
            int sx = code_getdi( 0 );
            int sy = code_getdi( 0 );
            int sw = code_getdi( s_gmode_w );
            int sh = code_getdi( s_gmode_h );
            (void)code_getdi( 0 );      // ドットスムージング (Phase 5.0 では常に auto)
            if ( id <= 0 || id >= HSP3DX_MAX_BUFFERS ) throw HSPERR_BUFFER_OVERFLOW;
            int src = s_buf_handle[id];
            if ( src == -1 ) throw HSPERR_PICTURE_MISSING;
            apply_gmode_blend();
            //  DxLib DrawExtendGraph: dest 矩形を指定して source 全体を伸縮描画。
            //  ここでは dest=(cur_x, cur_y, cur_x+dw, cur_y+dh) で source 矩形を切り出した
            //  部分を拡大/縮小するため、一度 DrawRectExtendGraph が必要だが、
            //  DxLib には「source 矩形 + dest 矩形」のバージョンがない場合は
            //  簡易的に source 全体を切り出して DrawExtendGraph に渡す運用。
            DrawRectExtendGraph( s_cur_x, s_cur_y, s_cur_x + dw, s_cur_y + dh,
                                 sx, sy, sw, sh, src, TRUE );
            break;
        }

    case 0x21:                      // bmpsave "file"
        {
            char *fname = code_gets();
            wchar_t wfname[512];
            hsp3dx_utf8_to_wide( fname, wfname, 512 );
            if ( SaveDrawScreen( 0, 0, 640, 480, wfname ) != 0 ) throw HSPERR_FILE_IO;
            break;
        }

    case 0x22:                      // hsvcolor h, s, v (all 0..255)
        {
            p1 = code_getdi( 0 );       // h (hue, 0..255 → 0..360)
            p2 = code_getdi( 0 );       // s (saturation, 0..255)
            p3 = code_getdi( 0 );       // v (value, 0..255)
            //  HSV → RGB (簡易実装)
            double h = (double)p1 * 360.0 / 255.0;
            double sat = (double)p2 / 255.0;
            double val = (double)p3 / 255.0;
            double c = val * sat;
            double x = c * ( 1.0 - fabs( fmod( h / 60.0, 2.0 ) - 1.0 ) );
            double m = val - c;
            double r = 0, g = 0, b = 0;
            if      ( h <  60 ) { r = c; g = x; }
            else if ( h < 120 ) { r = x; g = c; }
            else if ( h < 180 ) { g = c; b = x; }
            else if ( h < 240 ) { g = x; b = c; }
            else if ( h < 300 ) { r = x; b = c; }
            else                { r = c; b = x; }
            int ri = (int)((r + m) * 255.0);
            int gi = (int)((g + m) * 255.0);
            int bi = (int)((b + m) * 255.0);
            s_cur_color = GetColor( ri, gi, bi );
            break;
        }

    case 0x035:                     // grect x, y, angle, wx, wy
        {
            p1 = code_getdi( s_cur_x );
            p2 = code_getdi( s_cur_y );
            double angle = code_getdd( 0.0 );
            int wx = code_getdi( 32 );
            int wy = code_getdi( 32 );
            apply_gmode_blend();
            //  DxLib DrawRotaGraph 的に中心+角度で塗り矩形を描く。
            //  グラフィックがないのでプリミティブ矩形を角度を使って 4 頂点計算 → DrawTriangle x2
            double cs = cos( angle );
            double sn = sin( angle );
            double hx = wx / 2.0, hy = wy / 2.0;
            int x0 = p1 + (int)( -hx * cs - -hy * sn );
            int y0 = p2 + (int)( -hx * sn + -hy * cs );
            int x1 = p1 + (int)(  hx * cs - -hy * sn );
            int y1 = p2 + (int)(  hx * sn + -hy * cs );
            int x2 = p1 + (int)(  hx * cs -  hy * sn );
            int y2 = p2 + (int)(  hx * sn +  hy * cs );
            int x3 = p1 + (int)( -hx * cs -  hy * sn );
            int y3 = p2 + (int)( -hx * sn +  hy * cs );
            DrawTriangle( x0, y0, x1, y1, x2, y2, s_cur_color, TRUE );
            DrawTriangle( x0, y0, x2, y2, x3, y3, s_cur_color, TRUE );
            break;
        }

    case 0x036:                     // grotate srcID, sx, sy, angle [, wx, wy]
        {
            int id = code_getdi( 0 );
            int sx = code_getdi( 0 );
            int sy = code_getdi( 0 );
            double angle = code_getdd( 0.0 );
            int wx = code_getdi( s_gmode_w );
            int wy = code_getdi( s_gmode_h );
            if ( id <= 0 || id >= HSP3DX_MAX_BUFFERS ) throw HSPERR_BUFFER_OVERFLOW;
            int src = s_buf_handle[id];
            if ( src == -1 ) throw HSPERR_PICTURE_MISSING;
            apply_gmode_blend();
            //  DxLib には「source 矩形切り出し + 回転」の直接 API が無いので、
            //  切り出し部を一時バッファに gcopy してから DrawRotaGraph → で代替。
            //  実装簡素のため、Phase 1.10 では source 矩形全体 (wx*wy 無視) の
            //  中心に対して回転表示。Phase 2 以降で精密化。
            (void)sx; (void)sy; (void)wx; (void)wy;
            DrawRotaGraph( s_cur_x, s_cur_y, 1.0, angle, src, TRUE );
            break;
        }

    case 0x038:                     // gradf x, y, w, h, mode, col1, col2
        {
            p1 = code_getdi( 0 );
            p2 = code_getdi( 0 );
            int w = code_getdi( 100 );
            int h = code_getdi( 100 );
            int mode = code_getdi( 0 );         // 0=vertical, 1=horizontal
            int col1 = code_getdi( 0 );         // 0xRRGGBB
            int col2 = code_getdi( 0xFFFFFF );
            //  DxLib にグラデ直接 API がないので、スキャンライン毎に boxf
            int r1 = ( col1 >> 16 ) & 0xFF, g1 = ( col1 >> 8 ) & 0xFF, b1 = col1 & 0xFF;
            int r2 = ( col2 >> 16 ) & 0xFF, g2 = ( col2 >> 8 ) & 0xFF, b2 = col2 & 0xFF;
            if ( mode & 1 ) {
                //  横方向
                for ( int i = 0; i < w; i++ ) {
                    int r = r1 + ( r2 - r1 ) * i / w;
                    int g = g1 + ( g2 - g1 ) * i / w;
                    int b = b1 + ( b2 - b1 ) * i / w;
                    DrawBox( p1 + i, p2, p1 + i + 1, p2 + h, GetColor( r, g, b ), TRUE );
                }
            } else {
                //  縦方向
                for ( int i = 0; i < h; i++ ) {
                    int r = r1 + ( r2 - r1 ) * i / h;
                    int g = g1 + ( g2 - g1 ) * i / h;
                    int b = b1 + ( b2 - b1 ) * i / h;
                    DrawBox( p1, p2 + i, p1 + w, p2 + i + 1, GetColor( r, g, b ), TRUE );
                }
            }
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

    case 0x3d:                      // celdiv ID, cell_w, cell_h, origin_x, origin_y
        {
            int id = code_getdi( 1 );
            int cw = code_getdi( 0 );
            int ch = code_getdi( 0 );
            int ox = code_getdi( 0 );
            int oy = code_getdi( 0 );
            if ( id <= 0 || id >= HSP3DX_MAX_BUFFERS ) throw HSPERR_BUFFER_OVERFLOW;
            s_buf_cel_w [id] = cw;
            s_buf_cel_h [id] = ch;
            s_buf_cel_ox[id] = ox;
            s_buf_cel_oy[id] = oy;
            break;
        }

    case 0x3f:                      // gfilter mode (0=nearest, 1=linear, 2=高品質)
        {
            int mode = code_getdi( 0 );
            //  DxLib SetDrawMode は DX_DRAWMODE_NEAREST / DX_DRAWMODE_BILINEAR / DX_DRAWMODE_ANISOTROPIC
            int dx_mode;
            if ( mode == 0 )      dx_mode = DX_DRAWMODE_NEAREST;
            else if ( mode == 1 ) dx_mode = DX_DRAWMODE_BILINEAR;
            else                  dx_mode = DX_DRAWMODE_ANISOTROPIC;
            SetDrawMode( dx_mode );
            break;
        }

    case 0x04e:                     // rgbcolor packed_rgb (0xRRGGBB) → s_cur_color に
        {
            int packed = code_getdi( 0 );
            int r = ( packed >> 16 ) & 0xFF;
            int g = ( packed >>  8 ) & 0xFF;
            int b =   packed         & 0xFF;
            s_cur_color = GetColor( r, g, b );
            break;
        }

    case 0x05d:                     // gmulcolor r, g, b  (描画時の乗算カラー。255 でフラット)
        {
            int r = code_getdi( 255 );
            int g = code_getdi( 255 );
            int b = code_getdi( 255 );
            //  DxLib の SetDrawBright は 0..255 の範囲で設定
            SetDrawBright( r, g, b );
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
            p2 = code_getdi( 0 );           // frame (celdiv 設定がある場合のセル番号)
            double zx  = code_getdd( 1.0 );
            double zy  = code_getdd( 1.0 );
            double rot = code_getdd( 0.0 );

            if ( p1 <= 0 || p1 >= HSP3DX_MAX_BUFFERS ) throw HSPERR_BUFFER_OVERFLOW;
            int src = s_buf_handle[p1];
            if ( src == -1 ) throw HSPERR_PICTURE_MISSING;
            apply_gmode_blend();

            int cell_w = s_buf_cel_w[p1];
            int cell_h = s_buf_cel_h[p1];
            if ( cell_w > 0 && cell_h > 0 ) {
                //  celdiv で分割されている: frame からセル矩形を計算
                int cells_per_row = s_buf_w[p1] / cell_w;
                if ( cells_per_row <= 0 ) cells_per_row = 1;
                int cell_x = ( p2 % cells_per_row ) * cell_w;
                int cell_y = ( p2 / cells_per_row ) * cell_h;
                //  描画原点は cur_x/cur_y を中心に。origin_x/y を引いてオフセット。
                int draw_x = s_cur_x - s_buf_cel_ox[p1];
                int draw_y = s_cur_y - s_buf_cel_oy[p1];
                DrawRectRotaGraph( s_cur_x, s_cur_y,
                                   cell_x, cell_y, cell_w, cell_h,
                                   zx, rot, src, TRUE );
                (void)draw_x; (void)draw_y;  // 将来 origin の用途拡張用
            } else {
                //  celdiv 未設定: 画像全体
                if ( rot == 0.0 && zx == 1.0 && zy == 1.0 ) {
                    int cx = s_cur_x + s_buf_w[p1] / 2;
                    int cy = s_cur_y + s_buf_h[p1] / 2;
                    DrawRotaGraph( cx, cy, 1.0, 0.0, src, TRUE );
                } else {
                    int cx = s_cur_x + (int)( s_buf_w[p1] * zx / 2.0 );
                    int cy = s_cur_y + (int)( s_buf_h[p1] * zy / 2.0 );
                    DrawRotaGraph( cx, cy, zx, rot, src, TRUE );
                }
            }
            break;
        }

    case 0x23:                      // getkey var, keycode
        {
            PVal *pval;
            APTR aptr;
            aptr = code_getva( &pval );
            p1 = code_getdi( 1 );
            //  HSP getkey は伝統的に Windows VK コード (VK_ESCAPE=27 など) を受ける。
            //  DxLib の CheckHitKey は DIK コード (KEY_INPUT_ESCAPE=0x01) なので
            //  HSP 互換のためには GetAsyncKeyState で VK を直接見る必要がある。
            //  mobile 版では同等の VK→ネイティブキー写像を別途用意する。
            int pressed = ( GetAsyncKeyState( p1 ) & 0x8000 ) ? 1 : 0;
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

    //  ============================================================
    //  Phase 5.1: iron_dxlib.as 経由の dx_* 命令 (opcode 0x100〜)
    //  ============================================================

    case 0x100:                     // dx_drawcircleaa_s x, y, r, color [, fill, thickness]
        //  スカラー版、内部で PosNum=32 を補完する簡易ラッパ。直接版は auto-gen dx_DrawCircleAA。
        {
            int x = code_getdi( s_cur_x );
            int y = code_getdi( s_cur_y );
            int r = code_getdi( 10 );
            int col = code_getdi( (int)s_cur_color );
            int fill = code_getdi( 1 );
            double thick = code_getdd( 1.0 );
            apply_gmode_blend();
            DrawCircleAA( (float)x, (float)y, (float)r, 32, (unsigned int)col,
                          fill, (float)thick, 0.0 );
            break;
        }

    case 0x104:                     // dx_drawmodigraph_s srcID, x1,y1, x2,y2, x3,y3, x4,y4
        //  srcID 先頭、IronHSP 独自引数順。直接版は auto-gen dx_DrawModiGraph。
        {
            int id = code_getdi( 0 );
            int x1 = code_getdi( 0 );
            int y1 = code_getdi( 0 );
            int x2 = code_getdi( 100 );
            int y2 = code_getdi( 0 );
            int x3 = code_getdi( 100 );
            int y3 = code_getdi( 100 );
            int x4 = code_getdi( 0 );
            int y4 = code_getdi( 100 );
            if ( id <= 0 || id >= HSP3DX_MAX_BUFFERS ) throw HSPERR_BUFFER_OVERFLOW;
            int src = s_buf_handle[id];
            if ( src == -1 ) throw HSPERR_PICTURE_MISSING;
            apply_gmode_blend();
            DrawModiGraph( x1, y1, x2, y2, x3, y3, x4, y4, src, TRUE );
            break;
        }

    case 0x110:                     // dx_getjoypad var [, pad_no]
        {
            PVal *pval;
            APTR aptr;
            aptr = code_getva( &pval );
            int pad_no = code_getdi( 0 );       // 0 = DX_INPUT_PAD1 相当
            int pad_id = DX_INPUT_KEY_PAD1;     // pad1 default
            if ( pad_no == 1 ) pad_id = DX_INPUT_PAD2;
            else if ( pad_no == 2 ) pad_id = DX_INPUT_PAD3;
            else if ( pad_no == 3 ) pad_id = DX_INPUT_PAD4;
            int state = GetJoypadInputState( pad_id );
            code_setva( pval, aptr, TYPE_INUM, &state );
            break;
        }

    case 0x111:                     // dx_joyanalog xvar, yvar [, pad_no]
        {
            PVal *pvx, *pvy;
            APTR ax, ay;
            ax = code_getva( &pvx );
            ay = code_getva( &pvy );
            int pad_no = code_getdi( 0 );
            int pad_id = DX_INPUT_PAD1;
            if ( pad_no == 1 ) pad_id = DX_INPUT_PAD2;
            else if ( pad_no == 2 ) pad_id = DX_INPUT_PAD3;
            else if ( pad_no == 3 ) pad_id = DX_INPUT_PAD4;
            int ix = 0, iy = 0;
            GetJoypadAnalogInput( &ix, &iy, pad_id );
            code_setva( pvx, ax, TYPE_INUM, &ix );
            code_setva( pvy, ay, TYPE_INUM, &iy );
            break;
        }

    case 0x120:                     // dx_setwaitvsync flag
        {
            int flag = code_getdi( 1 );
            SetWaitVSyncFlag( flag );
            break;
        }

    case 0x121:                     // dx_setfullscreen flag
        {
            int flag = code_getdi( 0 );
            ChangeWindowMode( flag ? FALSE : TRUE );    // DxLib は逆: FALSE=full, TRUE=window
            break;
        }

    //  ============================================================
    //  Phase 5.2: 3D プリミティブ / カメラ
    //  ============================================================

    case 0x130:                     // dx_setcamerapos cx,cy,cz, tx,ty,tz
        {
            double cx = code_getdd( 0.0 );
            double cy = code_getdd( 0.0 );
            double cz = code_getdd( -200.0 );
            double tx = code_getdd( 0.0 );
            double ty = code_getdd( 0.0 );
            double tz = code_getdd( 0.0 );
            SetCameraPositionAndTarget_UpVecY(
                VGet( (float)cx, (float)cy, (float)cz ),
                VGet( (float)tx, (float)ty, (float)tz ) );
            break;
        }

    case 0x131:                     // dx_setcameraperspective fov_deg
        {
            double fov_deg = code_getdd( 60.0 );
            double fov_rad = fov_deg * 3.14159265358979 / 180.0;
            SetupCamera_Perspective( (float)fov_rad );
            break;
        }

    case 0x132:                     // dx_drawsphere3d_s x,y,z,r,div,difcol,spccol,fill (scalar xyz)
        {
            double x = code_getdd( 0.0 );
            double y = code_getdd( 0.0 );
            double z = code_getdd( 0.0 );
            double r = code_getdd( 30.0 );
            int div = code_getdi( 16 );
            int difcol = code_getdi( -1 );
            int spccol = code_getdi( 0xFFFFFF );
            int fill = code_getdi( 1 );
            //  HSP RGB 16進リテラル (0xRRGGBB) を DxLib 形式に変換。
            //  s_cur_color は既に DxLib 形式なので -1 (未指定) ならそれを使う。
            unsigned int dx_dif = ( difcol < 0 )
                ? s_cur_color
                : (unsigned int)GetColor( (difcol >> 16) & 0xFF, (difcol >> 8) & 0xFF, difcol & 0xFF );
            unsigned int dx_spc = (unsigned int)GetColor(
                (spccol >> 16) & 0xFF, (spccol >> 8) & 0xFF, spccol & 0xFF );
            DrawSphere3D( VGet( (float)x, (float)y, (float)z ),
                          (float)r, div, dx_dif, dx_spc, fill );
            break;
        }

    case 0x133:                     // dx_drawcube3d_s x1,y1,z1, x2,y2,z2, difcol, spccol, fill (scalar xyz)
        {
            double x1 = code_getdd( -50.0 );
            double y1 = code_getdd( -50.0 );
            double z1 = code_getdd( -50.0 );
            double x2 = code_getdd(  50.0 );
            double y2 = code_getdd(  50.0 );
            double z2 = code_getdd(  50.0 );
            int difcol = code_getdi( -1 );
            int spccol = code_getdi( 0xFFFFFF );
            int fill = code_getdi( 1 );
            unsigned int dx_dif = ( difcol < 0 )
                ? s_cur_color
                : (unsigned int)GetColor( (difcol >> 16) & 0xFF, (difcol >> 8) & 0xFF, difcol & 0xFF );
            unsigned int dx_spc = (unsigned int)GetColor(
                (spccol >> 16) & 0xFF, (spccol >> 8) & 0xFF, spccol & 0xFF );
            DrawCube3D( VGet( (float)x1, (float)y1, (float)z1 ),
                        VGet( (float)x2, (float)y2, (float)z2 ),
                        dx_dif, dx_spc, fill );
            break;
        }

    case 0x134:                     // dx_setbgcolor3d r,g,b
        {
            int r = code_getdi( 0 );
            int g = code_getdi( 0 );
            int b = code_getdi( 0 );
            SetBackgroundColor( r, g, b );
            break;
        }

    //  case 0x135 dx_setuselighting は Phase 5.5l で廃止 (auto-gen dx_SetUseLighting 使用)

    case 0x136:                     // dx_setlightdir dx,dy,dz
        {
            double dx = code_getdd( -1.0 );
            double dy = code_getdd( -1.0 );
            double dz = code_getdd(  1.0 );
            SetLightDirection( VGet( (float)dx, (float)dy, (float)dz ) );
            break;
        }

    case 0x137:                     // dx_setzbuffer flag
        {
            int flag = code_getdi( 1 );
            SetUseZBuffer3D( flag );
            SetWriteZBuffer3D( flag );
            break;
        }

    //  ============================================================
    //  Phase 5.2: 3D モデル (MV1)
    //  ============================================================

    case 0x140:                     // dx_mv1load "file"  → stat にハンドル
        {
            char *fname = code_gets();
            wchar_t wfname[512];
            hsp3dx_utf8_to_wide( fname, wfname, 512 );
            int h = MV1LoadModel( wfname );
            ctx->stat = h;      // -1 が失敗、0 以上がハンドル
            break;
        }

    case 0x141:                     // dx_mv1draw handle
        {
            int h = code_getdi( 0 );
            MV1DrawModel( h );
            break;
        }

    case 0x142:                     // dx_mv1setpos handle, x, y, z
        {
            int h = code_getdi( 0 );
            double x = code_getdd( 0.0 );
            double y = code_getdd( 0.0 );
            double z = code_getdd( 0.0 );
            MV1SetPosition( h, VGet( (float)x, (float)y, (float)z ) );
            break;
        }

    case 0x143:                     // dx_mv1setrot handle, rx, ry, rz (radians)
        {
            int h = code_getdi( 0 );
            double rx = code_getdd( 0.0 );
            double ry = code_getdd( 0.0 );
            double rz = code_getdd( 0.0 );
            MV1SetRotationXYZ( h, VGet( (float)rx, (float)ry, (float)rz ) );
            break;
        }

    case 0x144:                     // dx_mv1setscale handle, sx, sy, sz
        {
            int h = code_getdi( 0 );
            double sx = code_getdd( 1.0 );
            double sy = code_getdd( 1.0 );
            double sz = code_getdd( 1.0 );
            MV1SetScale( h, VGet( (float)sx, (float)sy, (float)sz ) );
            break;
        }

    case 0x145:                     // dx_mv1delete handle
        {
            int h = code_getdi( 0 );
            MV1DeleteModel( h );
            break;
        }

    //  ============================================================
    //  Phase 5.4a: HTTP クライアント
    //  ============================================================

    case 0x160:                     // dx_http_set_timeout ms
        {
            int ms = code_getdi( 30000 );
            if ( ms < 100 )     ms = 100;
            if ( ms > 600000 )  ms = 600000;
            s_http_timeout_ms = ms;
            break;
        }

    case 0x161:                     // dx_http_set_header "hdr"
        {
            const char *hdr = code_gets();
            if ( !hdr ) hdr = "";
            size_t n = strlen( hdr );
            if ( n >= sizeof(s_http_extra_headers) ) n = sizeof(s_http_extra_headers) - 1;
            memcpy( s_http_extra_headers, hdr, n );
            s_http_extra_headers[n] = 0;
            break;
        }

    case 0x164:                     // dx_http_set_user_agent "name"
        {
            const char *ua = code_gets();
            if ( !ua ) ua = "";
            size_t n = strlen( ua );
            if ( n >= sizeof(s_http_user_agent) ) n = sizeof(s_http_user_agent) - 1;
            memcpy( s_http_user_agent, ua, n );
            s_http_user_agent[n] = 0;
            break;
        }

    //  PUT / DELETE / PATCH  --  POST と同じ引数構造 (dx_http_delete だけ body なし)
    case 0x165:                     // dx_http_put "url", "body", var_body, "ctype"
    case 0x167:                     // dx_http_patch 同シグネチャ
        {
            const char *url_raw = code_gets();
            char *url = _strdup( url_raw ? url_raw : "" );
            const char *body_raw = code_gets();
            char *body_str = _strdup( body_raw ? body_raw : "" );
            PVal *pval; APTR aptr;
            aptr = code_getva( &pval );
            const char *ctype_raw = code_getds( (char *)"application/x-www-form-urlencoded" );
            char *ctype = _strdup( ctype_raw ? ctype_raw : "application/x-www-form-urlencoded" );
            size_t body_len = strlen( body_str );
            hsp3dx_http_response resp;
            int rc;
            if ( cmd == 0x165 ) {
                rc = hsp3dx_http_put( url, body_str, body_len, ctype,
                                      s_http_user_agent[0] ? s_http_user_agent : nullptr,
                                      s_http_extra_headers[0] ? s_http_extra_headers : nullptr,
                                      s_http_timeout_ms, &resp );
            } else {
                rc = hsp3dx_http_patch( url, body_str, body_len, ctype,
                                        s_http_user_agent[0] ? s_http_user_agent : nullptr,
                                        s_http_extra_headers[0] ? s_http_extra_headers : nullptr,
                                        s_http_timeout_ms, &resp );
            }
            free( url ); free( body_str ); free( ctype );
            if ( rc != 0 ) {
                ctx->stat = 0;
                code_setva( pval, aptr, TYPE_STRING, (void *)"" );
            } else {
                ctx->stat = resp.status;
                code_setva( pval, aptr, TYPE_STRING, resp.body ? (void *)resp.body : (void *)"" );
            }
            http_save_last_headers( resp.headers );
            hsp3dx_http_free( &resp );
            break;
        }

    case 0x166:                     // dx_http_delete "url", var_body
        {
            const char *url_raw = code_gets();
            char *url = _strdup( url_raw ? url_raw : "" );
            PVal *pval; APTR aptr;
            aptr = code_getva( &pval );
            hsp3dx_http_response resp;
            int rc = hsp3dx_http_delete( url,
                                         s_http_user_agent[0] ? s_http_user_agent : nullptr,
                                         s_http_extra_headers[0] ? s_http_extra_headers : nullptr,
                                         s_http_timeout_ms, &resp );
            free( url );
            if ( rc != 0 ) {
                ctx->stat = 0;
                code_setva( pval, aptr, TYPE_STRING, (void *)"" );
            } else {
                ctx->stat = resp.status;
                code_setva( pval, aptr, TYPE_STRING, resp.body ? (void *)resp.body : (void *)"" );
            }
            http_save_last_headers( resp.headers );
            hsp3dx_http_free( &resp );
            break;
        }

    case 0x168:                     // dx_http_download "url", "path"
        {
            const char *url_raw = code_gets();
            char *url = _strdup( url_raw ? url_raw : "" );
            const char *path_raw = code_gets();
            char *path = _strdup( path_raw ? path_raw : "" );
            int status = 0;
            size_t written = 0;
            int rc = hsp3dx_http_download( url, path,
                                           s_http_user_agent[0] ? s_http_user_agent : nullptr,
                                           s_http_extra_headers[0] ? s_http_extra_headers : nullptr,
                                           s_http_timeout_ms, &status, &written );
            free( url ); free( path );
            ctx->stat = rc == 0 ? status : 0;
            //  保存バイト数を strsize システム変数に (HSP 標準 exist 等と同じ慣習)
            ctx->strsize = (int)written;
            break;
        }

    case 0x169:                     // dx_http_get_res_header "name", var_val
        {
            //  直前の dx_http_get/post/put/delete/patch/mp_post のレスポンスヘッダを
            //  s_http_last_headers に保存してあるので、そこから name を検索する。
            const char *name_raw = code_gets();
            char *name = _strdup( name_raw ? name_raw : "" );
            PVal *pv; APTR ap; ap = code_getva( &pv );
            if ( !s_http_last_headers ) {
                code_setva( pv, ap, TYPE_STRING, (void *)"" );
                ctx->stat = -1;
            } else {
                hsp3dx_http_response tmp = { 0, nullptr, 0, s_http_last_headers };
                char value[8192];
                int rc = hsp3dx_http_get_header( &tmp, name, value, sizeof(value) );
                code_setva( pv, ap, TYPE_STRING, rc == 0 ? (void *)value : (void *)"" );
                ctx->stat = rc;     // 0=見つかった / -1=なし
            }
            free( name );
            break;
        }

    case 0x16a:                     // dx_http_set_basic_auth "user", "pass"
        {
            const char *user_raw = code_gets();
            char *user = _strdup( user_raw ? user_raw : "" );
            const char *pass_raw = code_gets();
            char *pass = _strdup( pass_raw ? pass_raw : "" );
            char hdr_value[1024];
            if ( hsp3dx_http_build_basic_auth( user, pass, hdr_value, sizeof(hdr_value) ) == 0 ) {
                //  既存 extra_headers の先頭に "Authorization: <value>\r\n" を入れる
                char combined[sizeof(s_http_extra_headers)];
                snprintf( combined, sizeof(combined), "Authorization: %s\r\n%s",
                          hdr_value,
                          s_http_extra_headers[0] ? s_http_extra_headers : "" );
                strncpy( s_http_extra_headers, combined, sizeof(s_http_extra_headers) - 1 );
                s_http_extra_headers[sizeof(s_http_extra_headers) - 1] = 0;
            }
            free( user ); free( pass );
            break;
        }

    case 0x16b:                     // dx_http_cookie_clear
        hsp3dx_http_cookie_clear();
        break;

    case 0x16c:                     // dx_http_cookie_enable flag
        hsp3dx_http_cookie_set_enabled( code_getdi( 1 ) );
        break;

    //  ---- multipart/form-data ----
    case 0x170:                     // dx_http_mp_begin
        hsp3dx_http_mp_begin();
        break;

    case 0x171:                     // dx_http_mp_add_text "name", "value"
        {
            const char *name_raw = code_gets();
            char *name = _strdup( name_raw ? name_raw : "" );
            const char *val_raw = code_gets();
            char *val = _strdup( val_raw ? val_raw : "" );
            ctx->stat = hsp3dx_http_mp_add_text( name, val );
            free( name ); free( val );
            break;
        }

    case 0x172:                     // dx_http_mp_add_file "name", "path" [, "ctype", "disp_name"]
        {
            const char *name_raw = code_gets();
            char *name = _strdup( name_raw ? name_raw : "" );
            const char *path_raw = code_gets();
            char *path = _strdup( path_raw ? path_raw : "" );
            const char *ct_raw   = code_getds( (char *)"" );
            char *ct = _strdup( ct_raw ? ct_raw : "" );
            const char *fn_raw   = code_getds( (char *)"" );
            char *fn = _strdup( fn_raw ? fn_raw : "" );
            ctx->stat = hsp3dx_http_mp_add_file( name, path,
                                                 ct[0] ? ct : nullptr,
                                                 fn[0] ? fn : nullptr );
            free( name ); free( path ); free( ct ); free( fn );
            break;
        }

    case 0x173:                     // dx_http_mp_post "url", var_body
        {
            const char *url_raw = code_gets();
            char *url = _strdup( url_raw ? url_raw : "" );
            PVal *pval; APTR aptr;
            aptr = code_getva( &pval );
            hsp3dx_http_response resp;
            int rc = hsp3dx_http_mp_post( url,
                                          s_http_user_agent[0] ? s_http_user_agent : nullptr,
                                          s_http_extra_headers[0] ? s_http_extra_headers : nullptr,
                                          s_http_timeout_ms, &resp );
            free( url );
            if ( rc != 0 ) {
                ctx->stat = 0;
                code_setva( pval, aptr, TYPE_STRING, (void *)"" );
            } else {
                ctx->stat = resp.status;
                code_setva( pval, aptr, TYPE_STRING, resp.body ? (void *)resp.body : (void *)"" );
            }
            http_save_last_headers( resp.headers );
            hsp3dx_http_free( &resp );
            break;
        }

    case 0x174:                     // dx_http_mp_end
        hsp3dx_http_mp_end();
        break;

    //  -----------------------------------------------------------------
    //  Phase 5.4b: JSON (picojson ラッパ、dx_json_*)
    //      0x180: parse / 0x181: new_obj / 0x182: new_arr / 0x183: free
    //      0x184: stringify / 0x185: type / 0x186: size / 0x187: key_at
    //      0x188-0x18b: get_str/int/double/bool
    //      0x18c-0x192: set_str/int/double/bool/null/obj/arr
    //      0x193: remove
    //  -----------------------------------------------------------------
    case 0x180:                     // dx_json_parse "src" ; stat = handle / -1
        {
            const char *raw = code_gets();
            char *src = _strdup( raw ? raw : "" );
            ctx->stat = hsp3dx_json_parse( src );
            free( src );
            break;
        }
    case 0x181:                     // dx_json_new_obj ; stat = handle
        ctx->stat = hsp3dx_json_new_obj();
        break;
    case 0x182:                     // dx_json_new_arr ; stat = handle
        ctx->stat = hsp3dx_json_new_arr();
        break;
    case 0x183:                     // dx_json_free h
        hsp3dx_json_free( code_getdi( -1 ) );
        break;
    case 0x184:                     // dx_json_stringify h, var [, pretty]
        {
            int h = code_getdi( -1 );
            PVal *pv; APTR ap; ap = code_getva( &pv );
            int pretty = code_getdi( 0 );
            int need = hsp3dx_json_stringify( h, pretty, nullptr, 0 );
            if ( need < 0 ) {
                code_setva( pv, ap, TYPE_STRING, (void *)"" );
                ctx->stat = -1;
            } else {
                char *buf = (char *)malloc( (size_t)need + 1 );
                hsp3dx_json_stringify( h, pretty, buf, (size_t)need + 1 );
                code_setva( pv, ap, TYPE_STRING, (void *)buf );
                free( buf );
                ctx->stat = need;
            }
            break;
        }
    case 0x185:                     // dx_json_type h, "path" ; stat = type
        {
            int h = code_getdi( -1 );
            const char *raw = code_gets();
            char *path = _strdup( raw ? raw : "" );
            ctx->stat = hsp3dx_json_type( h, path );
            free( path );
            break;
        }
    case 0x186:                     // dx_json_size h, "path" ; stat = size
        {
            int h = code_getdi( -1 );
            const char *raw = code_gets();
            char *path = _strdup( raw ? raw : "" );
            ctx->stat = hsp3dx_json_size( h, path );
            free( path );
            break;
        }
    case 0x187:                     // dx_json_key h, "path", index, var
        {
            int h = code_getdi( -1 );
            const char *raw = code_gets();
            char *path = _strdup( raw ? raw : "" );
            int idx = code_getdi( 0 );
            PVal *pv; APTR ap; ap = code_getva( &pv );
            char buf[1024];
            int rc = hsp3dx_json_key_at( h, path, idx, buf, sizeof(buf) );
            code_setva( pv, ap, TYPE_STRING, rc == 0 ? (void *)buf : (void *)"" );
            ctx->stat = rc;
            free( path );
            break;
        }
    case 0x188:                     // dx_json_get_str h, "path", var [, "default"]
        {
            int h = code_getdi( -1 );
            const char *raw = code_gets();
            char *path = _strdup( raw ? raw : "" );
            PVal *pv; APTR ap; ap = code_getva( &pv );
            const char *defv = code_getds( (char *)"" );
            //  値は任意サイズになりうるので、必要バッファ長を知るため 2 段
            //  ここでは固定 64KB で切る (string は JSON としても現実的上限)
            char *buf = (char *)malloc( 65536 );
            int rc = hsp3dx_json_get_str( h, path, buf, 65536, defv );
            code_setva( pv, ap, TYPE_STRING, (void *)buf );
            ctx->stat = rc;
            free( buf ); free( path );
            break;
        }
    case 0x189:                     // dx_json_get_int h, "path" [, default] ; stat = value
        {
            int h = code_getdi( -1 );
            const char *raw = code_gets();
            char *path = _strdup( raw ? raw : "" );
            int defv = code_getdi( 0 );
            ctx->stat = hsp3dx_json_get_int( h, path, defv );
            free( path );
            break;
        }
    case 0x18a:                     // dx_json_get_double h, "path", var [, default]
        {
            int h = code_getdi( -1 );
            const char *raw = code_gets();
            char *path = _strdup( raw ? raw : "" );
            PVal *pv; APTR ap; ap = code_getva( &pv );
            //  default 値は double。HSP code_getd が無ければ 0.0 固定。
            double defv = 0.0;      //  簡易版: オプション引数なし
            double outv = defv;
            int rc = hsp3dx_json_get_double( h, path, &outv, defv );
            code_setva( pv, ap, TYPE_DNUM, (void *)&outv );
            ctx->stat = rc;
            free( path );
            break;
        }
    case 0x18b:                     // dx_json_get_bool h, "path" [, default] ; stat = 0/1
        {
            int h = code_getdi( -1 );
            const char *raw = code_gets();
            char *path = _strdup( raw ? raw : "" );
            int defv = code_getdi( 0 );
            ctx->stat = hsp3dx_json_get_bool( h, path, defv );
            free( path );
            break;
        }
    case 0x18c:                     // dx_json_set_str h, "path", "value"
        {
            int h = code_getdi( -1 );
            const char *p_raw = code_gets();
            char *path = _strdup( p_raw ? p_raw : "" );
            const char *v_raw = code_gets();
            char *val_ = _strdup( v_raw ? v_raw : "" );
            ctx->stat = hsp3dx_json_set_str( h, path, val_ );
            free( path ); free( val_ );
            break;
        }
    case 0x18d:                     // dx_json_set_int h, "path", int
        {
            int h = code_getdi( -1 );
            const char *raw = code_gets();
            char *path = _strdup( raw ? raw : "" );
            int v = code_getdi( 0 );
            ctx->stat = hsp3dx_json_set_int( h, path, v );
            free( path );
            break;
        }
    case 0x18e:                     // dx_json_set_double h, "path", double_var
        {
            int h = code_getdi( -1 );
            const char *raw = code_gets();
            char *path = _strdup( raw ? raw : "" );
            //  code_getd が環境によって異なるため code_expand or code_getva 経由で
            //  ここは code_getva(d) 想定 → 簡易実装: HSP 側が INT/DOUBLE var を
            //  渡してくる前提で PVal 経由で拾う。
            PVal *pv; APTR ap; ap = code_getva( &pv );
            double dv = 0.0;
            if ( pv->flag == HSPVAR_FLAG_DOUBLE ) dv = *(double *)(pv->pt + ap * sizeof(double));
            else if ( pv->flag == HSPVAR_FLAG_INT ) dv = (double)(*(int *)(pv->pt + ap * sizeof(int)));
            ctx->stat = hsp3dx_json_set_double( h, path, dv );
            free( path );
            break;
        }
    case 0x18f:                     // dx_json_set_bool h, "path", flag
        {
            int h = code_getdi( -1 );
            const char *raw = code_gets();
            char *path = _strdup( raw ? raw : "" );
            int v = code_getdi( 0 );
            ctx->stat = hsp3dx_json_set_bool( h, path, v );
            free( path );
            break;
        }
    case 0x190:                     // dx_json_set_null h, "path"
        {
            int h = code_getdi( -1 );
            const char *raw = code_gets();
            char *path = _strdup( raw ? raw : "" );
            ctx->stat = hsp3dx_json_set_null( h, path );
            free( path );
            break;
        }
    case 0x191:                     // dx_json_set_obj h, "path"
        {
            int h = code_getdi( -1 );
            const char *raw = code_gets();
            char *path = _strdup( raw ? raw : "" );
            ctx->stat = hsp3dx_json_set_obj( h, path );
            free( path );
            break;
        }
    case 0x192:                     // dx_json_set_arr h, "path"
        {
            int h = code_getdi( -1 );
            const char *raw = code_gets();
            char *path = _strdup( raw ? raw : "" );
            ctx->stat = hsp3dx_json_set_arr( h, path );
            free( path );
            break;
        }
    case 0x193:                     // dx_json_remove h, "path"
        {
            int h = code_getdi( -1 );
            const char *raw = code_gets();
            char *path = _strdup( raw ? raw : "" );
            ctx->stat = hsp3dx_json_remove( h, path );
            free( path );
            break;
        }

    //  -----------------------------------------------------------------
    //  Phase 5.4c: WebSocket (WinHTTP WebSocket API、Win 8+)
    //      0x1A0 connect / 0x1A1 close / 0x1A2 free
    //      0x1A3 send_text / 0x1A4 send_binary
    //      0x1A5 recv / 0x1A6 status
    //  -----------------------------------------------------------------
    case 0x1a0:                     // dx_ws_connect "url" [, "extra_hdr", timeout_ms]
        {
            const char *url_raw = code_gets();
            char *url = _strdup( url_raw ? url_raw : "" );
            const char *hdr_raw = code_getds( (char *)"" );
            char *hdr = _strdup( hdr_raw ? hdr_raw : "" );
            int timeout = code_getdi( 10000 );
            ctx->stat = hsp3dx_ws_connect( url, hdr[0] ? hdr : nullptr, timeout );
            free( url ); free( hdr );
            break;
        }
    case 0x1a1:                     // dx_ws_close handle [, code]
        {
            int h = code_getdi( -1 );
            int code = code_getdi( 1000 );
            hsp3dx_ws_close( h, code );
            break;
        }
    case 0x1a2:                     // dx_ws_free handle
        hsp3dx_ws_free( code_getdi( -1 ) );
        break;
    case 0x1a3:                     // dx_ws_send_text handle, "text"
        {
            int h = code_getdi( -1 );
            const char *raw = code_gets();
            size_t len = raw ? strlen( raw ) : 0;
            char *dup_s = _strdup( raw ? raw : "" );
            ctx->stat = hsp3dx_ws_send_text( h, dup_s, len );
            free( dup_s );
            break;
        }
    case 0x1a4:                     // dx_ws_send_binary handle, var, size
        {
            int h = code_getdi( -1 );
            PVal *pv; APTR ap; ap = code_getva( &pv );
            int sz = code_getdi( 0 );
            void *ptr = pv->pt;             //  array/str/var バッファ先頭
            ctx->stat = hsp3dx_ws_send_binary( h, ptr, (size_t)sz );
            break;
        }
    case 0x1a5:                     // dx_ws_recv handle, var [, timeout_ms]
        {
            int h = code_getdi( -1 );
            PVal *pv; APTR ap; ap = code_getva( &pv );
            int timeout = code_getdi( 0 );
            size_t len = 0; int type = 0;
            //  受信バッファ 64KB 固定 (大きめメッセージは fragment 結合済みで届く)
            char *buf = (char *)malloc( 65536 );
            int rc = hsp3dx_ws_recv( h, timeout, buf, 65536, &len, &type );
            if ( rc == 0 ) {
                code_setva( pv, ap, TYPE_STRING, (void *)buf );
                ctx->stat    = type;        //  0=TEXT / 1=BINARY
                ctx->strsize = (int)len;
            } else if ( rc == 1 ) {
                code_setva( pv, ap, TYPE_STRING, (void *)"" );
                ctx->stat    = -2;          //  timeout
                ctx->strsize = 0;
            } else {
                code_setva( pv, ap, TYPE_STRING, (void *)"" );
                ctx->stat    = -1;          //  closed or error
                ctx->strsize = 0;
            }
            free( buf );
            break;
        }
    case 0x1a6:                     // dx_ws_status handle ; stat = WS_*
        ctx->stat = hsp3dx_ws_status( code_getdi( -1 ) );
        break;

    //  ----------------------------------------------------------------
    //  Phase 5.5b の手書き VECTOR 3D プリミティブ (0x1c0-0x1c4) は
    //  Phase 5.5l で廃止。auto-gen の dx_DrawLine3D / dx_DrawTriangle3D /
    //  dx_DrawCube3D / dx_DrawCapsule3D / dx_DrawCone3D が同じ引数仕様で使える。
    //  ----------------------------------------------------------------

    //  -----------------------------------------------------------------
    //  Phase 5.5n: 3D/2D Polygon/Primitive (頂点配列 + インデックス配列 版)
    //      HSP 側は #defstruct VERTEX3D (または VERTEX / VERTEX2D) を定義して
    //      stdim verts, VERTEX3D, N で確保、pval->pt を DxLib に渡す。
    //      インデックス配列は NSTRUCT (#field short i[N]) または HSP int 配列。
    //      0x1E0 dx_DrawPolygon3D              verts, polyNum, grHandle [, transFlag]
    //      0x1E1 dx_DrawPolygonIndexed3D       verts, vNum, idx_short, polyNum, grHandle [, transFlag]
    //      0x1E2 dx_DrawPolygon32bitIndexed3D  verts, vNum, idx_int, polyNum, grHandle [, transFlag]
    //      0x1E3 dx_DrawPolygon2D              verts, polyNum, grHandle, transFlag
    //      0x1E4 dx_DrawPolygonIndexed2D       verts, vNum, idx_short, polyNum, grHandle, transFlag
    //      0x1E5 dx_DrawPolygon32bitIndexed2D  verts, vNum, idx_int, polyNum, grHandle, transFlag
    //  -----------------------------------------------------------------
    case 0x1e0:                     // dx_DrawPolygon3D verts, polyNum, grHandle [, transFlag]
        {
            PVal *pv; APTR ap;
            ap = code_getva( &pv );
            if ( pv->pt == nullptr ) throw HSPERR_TYPE_MISMATCH;
            const VERTEX3D *va = (const VERTEX3D *)( pv->pt + ap * pv->len[0] );
            int polyNum = code_getdi( 0 );
            int gr = code_getdi( -1 );
            //  -1 等の負値は DX_NONE_GRAPH (テクスチャなし) に読替
            if ( gr < 0 ) gr = (int)DX_NONE_GRAPH;
            int trans = code_getdi( 1 );
            ctx->stat = DrawPolygon3D( va, polyNum, gr, trans );
            break;
        }
    case 0x1e1:                     // dx_DrawPolygonIndexed3D verts, vNum, idx_short, polyNum, grHandle [, transFlag]
        {
            PVal *pv_v; APTR ap_v;
            ap_v = code_getva( &pv_v );
            if ( pv_v->pt == nullptr ) throw HSPERR_TYPE_MISMATCH;
            const VERTEX3D *va = (const VERTEX3D *)( pv_v->pt + ap_v * pv_v->len[0] );
            int vNum = code_getdi( 0 );
            PVal *pv_i; APTR ap_i;
            ap_i = code_getva( &pv_i );
            if ( pv_i->pt == nullptr ) throw HSPERR_TYPE_MISMATCH;
            const unsigned short *ia = (const unsigned short *)( pv_i->pt + ap_i * pv_i->len[0] );
            int polyNum = code_getdi( 0 );
            int gr = code_getdi( -1 );
            //  -1 等の負値は DX_NONE_GRAPH (テクスチャなし) に読替
            if ( gr < 0 ) gr = (int)DX_NONE_GRAPH;
            int trans = code_getdi( 1 );
            ctx->stat = DrawPolygonIndexed3D( va, vNum, ia, polyNum, gr, trans );
            break;
        }
    case 0x1e2:                     // dx_DrawPolygon32bitIndexed3D verts, vNum, idx_int, polyNum, grHandle [, transFlag]
        {
            PVal *pv_v; APTR ap_v;
            ap_v = code_getva( &pv_v );
            if ( pv_v->pt == nullptr ) throw HSPERR_TYPE_MISMATCH;
            const VERTEX3D *va = (const VERTEX3D *)( pv_v->pt + ap_v * pv_v->len[0] );
            int vNum = code_getdi( 0 );
            PVal *pv_i; APTR ap_i;
            ap_i = code_getva( &pv_i );
            if ( pv_i->pt == nullptr ) throw HSPERR_TYPE_MISMATCH;
            //  HSP int 配列 (HSPVAR_FLAG_INT) ならそのまま、NSTRUCT ならバイトビューで
            const unsigned int *ia;
            if ( pv_i->flag == HSPVAR_FLAG_INT ) {
                ia = (const unsigned int *)( (int *)pv_i->pt + ap_i );
            } else {
                ia = (const unsigned int *)( pv_i->pt + ap_i * pv_i->len[0] );
            }
            int polyNum = code_getdi( 0 );
            int gr = code_getdi( -1 );
            //  -1 等の負値は DX_NONE_GRAPH (テクスチャなし) に読替
            if ( gr < 0 ) gr = (int)DX_NONE_GRAPH;
            int trans = code_getdi( 1 );
            ctx->stat = DrawPolygon32bitIndexed3D( va, vNum, ia, polyNum, gr, trans );
            break;
        }
    case 0x1e3:                     // dx_DrawPolygon2D verts, polyNum, grHandle, transFlag
        {
            PVal *pv; APTR ap;
            ap = code_getva( &pv );
            if ( pv->pt == nullptr ) throw HSPERR_TYPE_MISMATCH;
            const VERTEX2D *va = (const VERTEX2D *)( pv->pt + ap * pv->len[0] );
            int polyNum = code_getdi( 0 );
            int gr = code_getdi( -1 );
            //  -1 等の負値は DX_NONE_GRAPH (テクスチャなし) に読替
            if ( gr < 0 ) gr = (int)DX_NONE_GRAPH;
            int trans = code_getdi( 1 );
            ctx->stat = DrawPolygon2D( va, polyNum, gr, trans );
            break;
        }
    case 0x1e4:                     // dx_DrawPolygonIndexed2D verts, vNum, idx_short, polyNum, grHandle, transFlag
        {
            PVal *pv_v; APTR ap_v;
            ap_v = code_getva( &pv_v );
            if ( pv_v->pt == nullptr ) throw HSPERR_TYPE_MISMATCH;
            const VERTEX2D *va = (const VERTEX2D *)( pv_v->pt + ap_v * pv_v->len[0] );
            int vNum = code_getdi( 0 );
            PVal *pv_i; APTR ap_i;
            ap_i = code_getva( &pv_i );
            if ( pv_i->pt == nullptr ) throw HSPERR_TYPE_MISMATCH;
            const unsigned short *ia = (const unsigned short *)( pv_i->pt + ap_i * pv_i->len[0] );
            int polyNum = code_getdi( 0 );
            int gr = code_getdi( -1 );
            //  -1 等の負値は DX_NONE_GRAPH (テクスチャなし) に読替
            if ( gr < 0 ) gr = (int)DX_NONE_GRAPH;
            int trans = code_getdi( 1 );
            ctx->stat = DrawPolygonIndexed2D( va, vNum, ia, polyNum, gr, trans );
            break;
        }
    case 0x1e5:                     // dx_DrawPolygon32bitIndexed2D verts, vNum, idx_int, polyNum, grHandle, transFlag
        {
            PVal *pv_v; APTR ap_v;
            ap_v = code_getva( &pv_v );
            if ( pv_v->pt == nullptr ) throw HSPERR_TYPE_MISMATCH;
            const VERTEX2D *va = (const VERTEX2D *)( pv_v->pt + ap_v * pv_v->len[0] );
            int vNum = code_getdi( 0 );
            PVal *pv_i; APTR ap_i;
            ap_i = code_getva( &pv_i );
            if ( pv_i->pt == nullptr ) throw HSPERR_TYPE_MISMATCH;
            const unsigned int *ia;
            if ( pv_i->flag == HSPVAR_FLAG_INT ) {
                ia = (const unsigned int *)( (int *)pv_i->pt + ap_i );
            } else {
                ia = (const unsigned int *)( pv_i->pt + ap_i * pv_i->len[0] );
            }
            int polyNum = code_getdi( 0 );
            int gr = code_getdi( -1 );
            //  -1 等の負値は DX_NONE_GRAPH (テクスチャなし) に読替
            if ( gr < 0 ) gr = (int)DX_NONE_GRAPH;
            int trans = code_getdi( 1 );
            ctx->stat = DrawPolygon32bitIndexed2D( va, vNum, ia, polyNum, gr, trans );
            break;
        }

    //  -----------------------------------------------------------------
    //  Phase 5.5k: DxLib コールバック登録 (静的スロット方式)
    //      HSP 側: dx_SetRestoreGraphCallback *on_restore
    //               *on_restore は通常のラベル、C スタブから code_callback() で
    //               呼び戻される。ラベル内でシステム変数 _dx_cb_handle /
    //               _dx_cb_data (int) を参照可能 (ASyncLoadFinish 用)。
    //      NULL ラベル (空引数) 指定で登録解除。
    //  -----------------------------------------------------------------
    case 0x1d0:                     // dx_SetRestoreGraphCallback *label
        s_cb_restore_graph = code_getlb();
        code_next();
        SetRestoreGraphCallback( s_cb_restore_graph ? hsp3dx_cb_stub_restore_graph : nullptr );
        break;
    case 0x1d1:                     // dx_SetRestoreShredPoint *label
        s_cb_restore_shredpoint = code_getlb();
        code_next();
        SetRestoreShredPoint( s_cb_restore_shredpoint ? hsp3dx_cb_stub_restore_shredpoint : nullptr );
        break;
    case 0x1d2:                     // dx_SetGraphicsDeviceRestoreCallback *label
        s_cb_gfxdev_restore = code_getlb();
        code_next();
        SetGraphicsDeviceRestoreCallbackFunction(
            s_cb_gfxdev_restore ? hsp3dx_cb_stub_gfxdev_restore : nullptr, nullptr );
        break;
    case 0x1d3:                     // dx_SetGraphicsDeviceLostCallback *label
        s_cb_gfxdev_lost = code_getlb();
        code_next();
        SetGraphicsDeviceLostCallbackFunction(
            s_cb_gfxdev_lost ? hsp3dx_cb_stub_gfxdev_lost : nullptr, nullptr );
        break;
    case 0x1d4:                     // dx_SetASyncLoadFinishCallback handle, *label
        {
            int handle = code_getdi( 0 );
            s_cb_async_load_finish = code_getlb();
            code_next();
            SetASyncLoadFinishCallback( handle,
                s_cb_async_load_finish ? hsp3dx_cb_stub_async_load_finish : nullptr,
                nullptr );
            break;
        }

    case 0x162:                     // dx_http_get "url", var_body
        {
            //  code_gets() は内部共有バッファを返すので、後続の code_* で上書き
            //  される前に heap へコピー。長さ制限はソース .ax の文字列長に委ねる。
            const char *url_raw = code_gets();
            char *url = _strdup( url_raw ? url_raw : "" );

            PVal *pval;
            APTR aptr;
            aptr = code_getva( &pval );

            hsp3dx_http_response resp;
            int rc = hsp3dx_http_get( url,
                                      s_http_user_agent[0] ? s_http_user_agent : nullptr,
                                      s_http_extra_headers[0] ? s_http_extra_headers : nullptr,
                                      s_http_timeout_ms, &resp );
            free( url );
            if ( rc != 0 ) {
                ctx->stat = 0;
                const char *empty = "";
                code_setva( pval, aptr, TYPE_STRING, (void *)empty );
            } else {
                ctx->stat = resp.status;
                code_setva( pval, aptr, TYPE_STRING,
                            resp.body ? (void *)resp.body : (void *)"" );
            }
            http_save_last_headers( resp.headers );
            hsp3dx_http_free( &resp );
            break;
        }

    case 0x163:                     // dx_http_post "url", "body", var_body, "content-type"
        {
            //  各文字列を heap コピー (code_gets の共有バッファ上書き対策)。
            //  body は最大数 MB まで想定 (HSP の .ax 文字列リテラル長限界まで)。
            const char *url_raw = code_gets();
            char *url = _strdup( url_raw ? url_raw : "" );

            const char *body_raw = code_gets();
            char *body_str = _strdup( body_raw ? body_raw : "" );

            PVal *pval;
            APTR aptr;
            aptr = code_getva( &pval );

            const char *ctype_raw = code_getds( (char *)"application/x-www-form-urlencoded" );
            char *ctype = _strdup( ctype_raw ? ctype_raw : "application/x-www-form-urlencoded" );

            size_t body_len = strlen( body_str );
            hsp3dx_http_response resp;
            int rc = hsp3dx_http_post( url, body_str, body_len, ctype,
                                       s_http_user_agent[0] ? s_http_user_agent : nullptr,
                                       s_http_extra_headers[0] ? s_http_extra_headers : nullptr,
                                       s_http_timeout_ms, &resp );
            free( url );
            free( body_str );
            free( ctype );
            if ( rc != 0 ) {
                ctx->stat = 0;
                const char *empty = "";
                code_setva( pval, aptr, TYPE_STRING, (void *)empty );
            } else {
                ctx->stat = resp.status;
                code_setva( pval, aptr, TYPE_STRING,
                            resp.body ? (void *)resp.body : (void *)"" );
            }
            http_save_last_headers( resp.headers );
            hsp3dx_http_free( &resp );
            break;
        }

    //  ============================================================
    //  Phase 5.2: 動画再生
    //  ============================================================

    case 0x150:                     // dx_loadmovie "file", ID
        {
            char *fname = code_gets();
            int id = code_getdi( 1 );
            if ( id <= 0 || id >= HSP3DX_MAX_BUFFERS ) throw HSPERR_ILLEGAL_FUNCTION;

            wchar_t wfname[512];
            hsp3dx_utf8_to_wide( fname, wfname, 512 );

            if ( s_buf_handle[id] != -1 ) DeleteGraph( s_buf_handle[id] );
            int h = LoadGraph( wfname );
            if ( h == -1 ) throw HSPERR_FILE_IO;
            s_buf_handle[id] = h;
            int w = 0, hh = 0;
            GetGraphSize( h, &w, &hh );
            s_buf_w[id] = w;
            s_buf_h[id] = hh;
            ctx->stat = id;
            break;
        }

    case 0x151:                     // dx_playmoviegraph ID
        {
            int id = code_getdi( 1 );
            if ( id <= 0 || id >= HSP3DX_MAX_BUFFERS ) throw HSPERR_ILLEGAL_FUNCTION;
            int h = s_buf_handle[id];
            if ( h == -1 ) throw HSPERR_FILE_IO;
            PlayMovieToGraph( h );
            break;
        }

    case 0x152:                     // dx_pausemoviegraph ID
        {
            int id = code_getdi( 1 );
            if ( id <= 0 || id >= HSP3DX_MAX_BUFFERS ) throw HSPERR_ILLEGAL_FUNCTION;
            int h = s_buf_handle[id];
            if ( h == -1 ) throw HSPERR_FILE_IO;
            PauseMovieToGraph( h );
            break;
        }

    case 0x153:                     // dx_stopmoviegraph ID
        {
            int id = code_getdi( 1 );
            if ( id <= 0 || id >= HSP3DX_MAX_BUFFERS ) throw HSPERR_ILLEGAL_FUNCTION;
            int h = s_buf_handle[id];
            if ( h == -1 ) throw HSPERR_FILE_IO;
            PauseMovieToGraph( h );   // DxLib には StopMovieToGraph は無く、Pause で代用
            break;
        }

    default:
        //  Phase 5.3: 自動生成 DxLib bindings (opcode 0x200〜0x3FF)
        if ( hsp3dx_dxlib_auto_dispatch( cmd, ctx ) ) {
            return RUNMODE_RUN;
        }
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

    case 0x100:                             // ginfo(p)  グラフィック情報取得
        {
            if ( !has_parens ) throw HSPERR_INVALID_FUNCPARAM;
            code_next();
            int p = code_geti();
            if ( *type != TYPE_MARK || *val != ')' ) throw HSPERR_INVALID_FUNCPARAM;
            code_next();
            int mx = 0, my = 0;
            switch ( p ) {
            case 0: GetMousePoint( &mx, &my ); reffunc_intfunc_ivalue = mx; break;   // mouse x
            case 1: GetMousePoint( &mx, &my ); reffunc_intfunc_ivalue = my; break;   // mouse y
            case 2: reffunc_intfunc_ivalue = (int)(intptr_t)GetMainWindowHandle(); break; // active win
            case 3: reffunc_intfunc_ivalue = s_cur_color; break;     // current color (R<<16|G<<8|B)
            case 4: reffunc_intfunc_ivalue = s_cur_x; break;         // current draw x (window coord)
            case 5: reffunc_intfunc_ivalue = s_cur_y; break;         // current draw y
            case 6: reffunc_intfunc_ivalue = 0; break;               // window x top-left (not tracked)
            case 7: reffunc_intfunc_ivalue = 0; break;               // window y top-left
            case 8: reffunc_intfunc_ivalue = 640; break;             // view width  (Phase 1 は 640 固定)
            case 9: reffunc_intfunc_ivalue = 480; break;             // view height (Phase 1 は 480 固定)
            case 10: reffunc_intfunc_ivalue = s_cur_x; break;        // draw cursor x (= 4)
            case 11: reffunc_intfunc_ivalue = s_cur_y; break;        // draw cursor y
            case 12: reffunc_intfunc_ivalue = 640; break;            // screen width
            case 13: reffunc_intfunc_ivalue = 480; break;            // screen height
            case 21: reffunc_intfunc_ivalue = s_cur_window; break;   // current gsel target ID
            default: reffunc_intfunc_ivalue = 0; break;
            }
            break;
        }

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
