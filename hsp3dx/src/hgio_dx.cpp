//
//  hgio_dx.cpp — hsp3dx graphics I/O (DxLib バックエンド) スケルトン実装
//
//  Phase 1.1 で中身を書く。現状は DxLib SDK を参照する extern 宣言と
//  各関数の雛形だけ。
//
#include "hgio_dx.h"
#include "hsp3dx_compat.h"
#include "DxLib.h"    // hsp3dx/extlib/dxlib_win/include/DxLib.h
#if defined(_WIN32)
#include <windows.h>
#endif

// hsp3dx はプロセス起動時に UTF-8 固定。HSP3Dish の hgio_init 相当のタイミングで
// SetUseCharCodeFormat を必ず呼ぶ。
static bool s_dx_initialized = false;

// 現在の論理解像度 (screen 命令で変更可)
static int s_screen_w = 640;
static int s_screen_h = 480;

int hgio_dx_init( int mode, int sx, int sy, void * /*hwnd*/ )
{
    if ( s_dx_initialized ) return 0;

    // UTF-8 モードに固定 (Win/iOS/Android 共通の hsp3dx ルール)
    SetUseCharCodeFormat( DX_CHARCODEFORMAT_UTF8 );

    // ウィンドウモード固定 (Phase 1 MVP)
    ChangeWindowMode( TRUE );
    s_screen_w = sx > 0 ? sx : 640;
    s_screen_h = sy > 0 ? sy : 480;
    SetGraphMode( s_screen_w, s_screen_h, 32 );

#if defined(__ANDROID__) || defined(__APPLE__)
    //  モバイルは物理画面固定。DxLib の FitScaling の意味に注意:
    //      FitScaling = FALSE → アスペクト比維持 letterbox (余白は黒)
    //      FitScaling = TRUE  → 画面いっぱいストレッチ (比率無視)
    //  デフォルトは letterbox (640:480 の縦横比を崩さないほうが安全)。
    //  ユーザーは dx_setscreenfit で切替可能。
    //  2026-04-21 検証: iOS Simulator でも SetFullScreenScalingMode は有効。
    //  以前は「iOS では効かない」と誤認して MakeScreen 自前 letterbox を作ったが、
    //  MakeScreen オフスクリーンに描画コマンドが一切反映されない iOS DxLib 固有の
    //  制限を踏んで全黒になっていた (ClearDrawScreen だけは効く)。
    //  自動 letterbox + DX_SCREEN_BACK 直接描画が正解。
    SetFullScreenScalingMode( DX_FSSCALINGMODE_BILINEAR, FALSE );
#endif

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
    return hgio_dx_flip();
}

int hgio_dx_flip( void )
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

int  hgio_dx_get_screen_width( void )  { return s_screen_w; }
int  hgio_dx_get_screen_height( void ) { return s_screen_h; }

void hgio_dx_set_screen_size( int w, int h )
{
    if ( w <= 0 || h <= 0 ) return;
    s_screen_w = w;
    s_screen_h = h;
    SetGraphMode( w, h, 32 );
}

int hgio_dx_get_display_size( int *pw, int *ph )
{
    int dw = 0, dh = 0;
#if defined(__ANDROID__)
    if ( GetAndroidDisplayResolution( &dw, &dh ) == 0 && dw > 0 && dh > 0 ) {
        if ( pw ) *pw = dw;
        if ( ph ) *ph = dh;
        return 0;
    }
#elif defined(__APPLE__)
    if ( GetDisplayResolution_iOS( &dw, &dh ) == 0 && dw > 0 && dh > 0 ) {
        if ( pw ) *pw = dw;
        if ( ph ) *ph = dh;
        return 0;
    }
#elif defined(_WIN32)
    dw = GetSystemMetrics( SM_CXSCREEN );
    dh = GetSystemMetrics( SM_CYSCREEN );
    if ( dw > 0 && dh > 0 ) {
        if ( pw ) *pw = dw;
        if ( ph ) *ph = dh;
        return 0;
    }
#endif
    if ( pw ) *pw = 640;
    if ( ph ) *ph = 480;
    return -1;
}

int hgio_dx_get_touch_num( void )
{
#if defined(__ANDROID__) || defined(__APPLE__)
    return GetTouchInputNum();
#else
    //  Win はマウス左ボタン押下を 1 本指扱い
    return ( GetMouseInput() & MOUSE_INPUT_LEFT ) ? 1 : 0;
#endif
}

int hgio_dx_get_touch( int index, int *px, int *py )
{
#if defined(__ANDROID__) || defined(__APPLE__)
    if ( index < 0 || index >= GetTouchInputNum() ) return -1;
    int tx = 0, ty = 0;
    //  DxLib 自身が ConvScreenPositionToDxScreenPosition で物理→論理 (DxScreen)
    //  座標に変換済みの値を返す (iOS DxLib の UpdateTouchInputData 実装を参照)。
    //  そのため hsp3dx 側での変換は不要。以前は iOS 固有に逆算していたが
    //  二重変換でタッチ座標がずれていたため 2026-04-21 に削除。
    GetTouchInput( index, &tx, &ty, nullptr, nullptr );
    if ( px ) *px = tx;
    if ( py ) *py = ty;
    return 0;
#else
    if ( index != 0 ) return -1;
    if ( !( GetMouseInput() & MOUSE_INPUT_LEFT ) ) return -1;
    int mx = 0, my = 0;
    GetMousePoint( &mx, &my );
    if ( px ) *px = mx;
    if ( py ) *py = my;
    return 0;
#endif
}

void hgio_dx_set_screen_fit( int mode )
{
#if defined(__ANDROID__) || defined(__APPLE__)
    //  mode = 0: アスペクト比維持 letterbox (余白は黒、default)    → FitScaling=FALSE
    //         1: 画面いっぱいにストレッチ (比率無視)                 → FitScaling=TRUE
    //         2: ピクセル等倍 (未実装、現状 0 と同じ)
    int fit = ( mode == 1 ) ? TRUE : FALSE;
    SetFullScreenScalingMode( DX_FSSCALINGMODE_BILINEAR, fit );
#else
    (void)mode;   // PC 版はウィンドウサイズがそもそも論理サイズと一致するので無処理
#endif
}

void hgio_dx_getmouse( int *px, int *py, int *pbtn )
{
#if defined(__ANDROID__) || defined(__APPLE__)
    //  タッチ座標をマウス座標として扱い、タッチ中 = MOUSE_INPUT_LEFT 押下。
    //  iOS は hgio_dx_get_touch 内で letterbox 物理→論理変換するのでそれを利用。
    static int s_last_x = 0, s_last_y = 0;
    int n = GetTouchInputNum();
    if ( n > 0 ) {
        int tx = 0, ty = 0;
        hgio_dx_get_touch( 0, &tx, &ty );
        s_last_x = tx;
        s_last_y = ty;
        if ( pbtn ) *pbtn = MOUSE_INPUT_LEFT;
    } else {
        if ( pbtn ) *pbtn = 0;
    }
    if ( px ) *px = s_last_x;
    if ( py ) *py = s_last_y;
#else
    if ( px && py ) GetMousePoint( px, py );
    if ( pbtn ) *pbtn = GetMouseInput();
#endif
}
