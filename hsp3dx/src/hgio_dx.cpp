//
//  hgio_dx.cpp — hsp3dx graphics I/O (DxLib バックエンド) スケルトン実装
//
//  Phase 1.1 で中身を書く。現状は DxLib SDK を参照する extern 宣言と
//  各関数の雛形だけ。
//
#include "hgio_dx.h"
#include "hsp3dx_compat.h"
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

#ifdef __ANDROID__
    //  Android は物理画面固定。DxLib の FitScaling の意味に注意:
    //      FitScaling = FALSE → アスペクト比維持 letterbox (余白は黒)
    //      FitScaling = TRUE  → 画面いっぱいストレッチ (比率無視)
    //  デフォルトは letterbox (640:480 の縦横比を崩さないほうが安全)。
    //  ユーザーは dx_setscreenfit で切替可能。
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

void hgio_dx_set_screen_fit( int mode )
{
#ifdef __ANDROID__
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
#ifdef __ANDROID__
    //  Android にはマウスがないので、タッチ座標をマウス座標として、
    //  タッチ中 = MOUSE_INPUT_LEFT 押下として報告する。
    //  タッチが離れた後も最後の座標は保持する (HSP 標準の mousex/mousey 的挙動)。
    static int s_last_x = 0, s_last_y = 0;
    int n = GetTouchInputNum();
    if ( n > 0 ) {
        int tx = 0, ty = 0;
        GetTouchInput( 0, &tx, &ty, nullptr, nullptr );
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
