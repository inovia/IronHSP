//
//  hgio_dx.cpp — hsp3dx graphics I/O (DxLib バックエンド) スケルトン実装
//
//  Phase 1.1 で中身を書く。現状は DxLib SDK を参照する extern 宣言と
//  各関数の雛形だけ。
//
#include "hgio_dx.h"
#include "DxLib.h"    // hsp3dx/extlib/dxlib_win/include/DxLib.h

// hsp3dx はプロセス起動時に UTF-8 固定。HSP3Dish の hgio_init 相当のタイミングで
// SetUseCharCodeFormat を必ず呼ぶ。
static bool s_dx_initialized = false;

int hgio_dx_init( int mode, int sx, int sy, void * /*hwnd*/ )
{
    if ( s_dx_initialized ) return 0;

    // UTF-8 モードに固定 (Win/iOS/Android 共通の hsp3dx ルール)
    SetUseCharCodeFormat( DX_CHARCODEFORMAT_UTF8 );

    // ウィンドウモード固定 (Phase 1 MVP)
    ChangeWindowMode( TRUE );
    SetGraphMode( sx > 0 ? sx : 640, sy > 0 ? sy : 480, 32 );

    if ( DxLib_Init() != 0 ) return -1;

    SetDrawScreen( DX_SCREEN_BACK );
    s_dx_initialized = true;
    return 0;
}

void hgio_dx_term( void )
{
    if ( !s_dx_initialized ) return;
    DxLib_End();
    s_dx_initialized = false;
}

int hgio_dx_render_start( void )
{
    ClearDrawScreen();
    return 0;
}

int hgio_dx_render_end( void )
{
    ScreenFlip();
    return 0;
}

int hgio_dx_process_message( void )
{
    return ProcessMessage();    // 0=正常、-1=終了要求
}

int hgio_dx_getkey( int keycode )
{
    return CheckHitKey( keycode );
}

void hgio_dx_getmouse( int *px, int *py, int *pbtn )
{
    if ( px && py ) GetMousePoint( px, py );
    if ( pbtn ) *pbtn = GetMouseInput();
}
