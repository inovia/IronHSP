//-----------------------------------------------------------------------------
//
//      DX ライブラリ   Desktop (SDL2) 用 入力 実装
//
//      SDL2 のキーボード/マウス/ゲームパッドを DxLib API に wire up する。
//      ゲームパッド振動は SDL_Haptic/SDL_GameControllerRumble 経由。
//
//-----------------------------------------------------------------------------

#define DX_MAKE

#include "../DxCompileConfig.h"

#ifndef DX_NON_INPUT

#include "DxInputDesktop.h"
#include "../DxInput.h"
#include "../DxLib.h"

#include <SDL.h>
#include <cstdio>
#include <cstring>
#include <vector>
#include <string>

#ifndef DX_NON_NAMESPACE
namespace DxLib
{
#endif

// --- 初期化・終了 -------------------------------------------------------

extern int InitializeInputSystem_PF_Timing0( void )
{
    // キーボード/マウスは SDL_Init(VIDEO) で自動有効化。
    // gamepad は必要なら SDL_INIT_GAMECONTROLLER を初期化。
    if ( !SDL_WasInit( SDL_INIT_GAMECONTROLLER ) )
        SDL_InitSubSystem( SDL_INIT_GAMECONTROLLER ) ;
    return 0 ;
}

extern int TerminateInputSystem_PF_Timing0( void ) { return 0 ; }
extern int AutoInitialize_PF( void )              { return 0 ; }

// --- ゲームパッド (SDL_GameController) ---------------------------------

// SDL 側で開いた controller の最大 4 台保持
static SDL_GameController *s_GC[ 4 ] = { nullptr, nullptr, nullptr, nullptr } ;
static int                 s_GCCount = 0 ;

static void desktop_open_gamecontrollers( void )
{
    // 接続されているデバイスを最大 4 台まで open
    s_GCCount = 0 ;
    int n = SDL_NumJoysticks() ;
    for ( int i = 0 ; i < n && s_GCCount < 4 ; ++i ) {
        if ( SDL_IsGameController( i ) ) {
            SDL_GameController *c = SDL_GameControllerOpen( i ) ;
            if ( c ) s_GC[ s_GCCount++ ] = c ;
        }
    }
}

extern int SetupJoypad_PF( void )
{
    if ( !SDL_WasInit( SDL_INIT_GAMECONTROLLER ) )
        SDL_InitSubSystem( SDL_INIT_GAMECONTROLLER ) ;
    desktop_open_gamecontrollers() ;
    return 0 ;
}

extern int TerminateJoypad_PF( void )
{
    for ( int i = 0 ; i < s_GCCount ; ++i ) {
        if ( s_GC[ i ] ) SDL_GameControllerClose( s_GC[ i ] ) ;
        s_GC[ i ] = nullptr ;
    }
    s_GCCount = 0 ;
    return 0 ;
}

// DxLib の PadNo (0..3) から SDL_GameController を取り出す
static SDL_GameController *desktop_gc( int PadNo )
{
    if ( s_GCCount == 0 ) desktop_open_gamecontrollers() ;
    if ( PadNo < 0 || PadNo >= s_GCCount ) return nullptr ;
    return s_GC[ PadNo ] ;
}

extern int UpdateJoypadInputState_PF( int PadNo )
{
    SDL_GameController *c = desktop_gc( PadNo ) ;
    if ( !c ) return -1 ;
    if ( PadNo < 0 || PadNo >= MAX_JOYPAD_NUM ) return -1 ;
    INPUTPADDATA *pad = &InputSysData.Pad[ PadNo ] ;
    SDL_GameControllerUpdate() ;

    // XInput state
    XINPUT_STATE &xs = pad->XInputState ;
    std::memset( &xs, 0, sizeof( xs ) ) ;
    xs.Buttons[  0 /*XINPUT_BUTTON_DPAD_UP   */] = SDL_GameControllerGetButton( c, SDL_CONTROLLER_BUTTON_DPAD_UP    ) ;
    xs.Buttons[  1 /*XINPUT_BUTTON_DPAD_DOWN */] = SDL_GameControllerGetButton( c, SDL_CONTROLLER_BUTTON_DPAD_DOWN  ) ;
    xs.Buttons[  2 /*XINPUT_BUTTON_DPAD_LEFT */] = SDL_GameControllerGetButton( c, SDL_CONTROLLER_BUTTON_DPAD_LEFT  ) ;
    xs.Buttons[  3 /*XINPUT_BUTTON_DPAD_RIGHT*/] = SDL_GameControllerGetButton( c, SDL_CONTROLLER_BUTTON_DPAD_RIGHT ) ;
    xs.Buttons[  4 /*XINPUT_BUTTON_START     */] = SDL_GameControllerGetButton( c, SDL_CONTROLLER_BUTTON_START      ) ;
    xs.Buttons[  5 /*XINPUT_BUTTON_BACK      */] = SDL_GameControllerGetButton( c, SDL_CONTROLLER_BUTTON_BACK       ) ;
    xs.Buttons[  6 /*XINPUT_BUTTON_LEFT_THUMB */] = SDL_GameControllerGetButton( c, SDL_CONTROLLER_BUTTON_LEFTSTICK  ) ;
    xs.Buttons[  7 /*XINPUT_BUTTON_RIGHT_THUMB*/] = SDL_GameControllerGetButton( c, SDL_CONTROLLER_BUTTON_RIGHTSTICK ) ;
    xs.Buttons[  8 /*XINPUT_BUTTON_LEFT_SHOULDER */] = SDL_GameControllerGetButton( c, SDL_CONTROLLER_BUTTON_LEFTSHOULDER  ) ;
    xs.Buttons[  9 /*XINPUT_BUTTON_RIGHT_SHOULDER*/] = SDL_GameControllerGetButton( c, SDL_CONTROLLER_BUTTON_RIGHTSHOULDER ) ;
    xs.Buttons[ 12 /*XINPUT_BUTTON_A */] = SDL_GameControllerGetButton( c, SDL_CONTROLLER_BUTTON_A ) ;
    xs.Buttons[ 13 /*XINPUT_BUTTON_B */] = SDL_GameControllerGetButton( c, SDL_CONTROLLER_BUTTON_B ) ;
    xs.Buttons[ 14 /*XINPUT_BUTTON_X */] = SDL_GameControllerGetButton( c, SDL_CONTROLLER_BUTTON_X ) ;
    xs.Buttons[ 15 /*XINPUT_BUTTON_Y */] = SDL_GameControllerGetButton( c, SDL_CONTROLLER_BUTTON_Y ) ;

    int ltrig = SDL_GameControllerGetAxis( c, SDL_CONTROLLER_AXIS_TRIGGERLEFT  ) ;
    int rtrig = SDL_GameControllerGetAxis( c, SDL_CONTROLLER_AXIS_TRIGGERRIGHT ) ;
    xs.LeftTrigger  = ( unsigned char )( ltrig > 0 ? ( ltrig >> 7 ) : 0 ) ;
    xs.RightTrigger = ( unsigned char )( rtrig > 0 ? ( rtrig >> 7 ) : 0 ) ;
    xs.ThumbLX = ( short )SDL_GameControllerGetAxis( c, SDL_CONTROLLER_AXIS_LEFTX  ) ;
    xs.ThumbLY = ( short )( -SDL_GameControllerGetAxis( c, SDL_CONTROLLER_AXIS_LEFTY  ) ) ;
    xs.ThumbRX = ( short )SDL_GameControllerGetAxis( c, SDL_CONTROLLER_AXIS_RIGHTX ) ;
    xs.ThumbRY = ( short )( -SDL_GameControllerGetAxis( c, SDL_CONTROLLER_AXIS_RIGHTY ) ) ;

    // DirectInput 互換 state (古い DxLib API 用。スティックは -1000..1000 にスケール)
    DINPUT_JOYSTATE &ds = pad->State ;
    std::memset( &ds, 0, sizeof( ds ) ) ;
    ds.X  = ( xs.ThumbLX * 1000 ) / 32767 ;
    ds.Y  = ( -xs.ThumbLY * 1000 ) / 32767 ;  // DirectInput は上 = 負
    ds.Rx = ( xs.ThumbRX * 1000 ) / 32767 ;
    ds.Ry = ( -xs.ThumbRY * 1000 ) / 32767 ;
    ds.Z  = ( xs.RightTrigger - xs.LeftTrigger ) * 1000 / 255 ;
    // POV (hat) — DPAD から合成
    int dp_u = xs.Buttons[ 0 ], dp_d = xs.Buttons[ 1 ] ;
    int dp_l = xs.Buttons[ 2 ], dp_r = xs.Buttons[ 3 ] ;
    ds.POV[ 0 ] = 0xffffffff ;
    if      ( dp_u && dp_r ) ds.POV[ 0 ] =  4500 ;
    else if ( dp_r && dp_d ) ds.POV[ 0 ] = 13500 ;
    else if ( dp_d && dp_l ) ds.POV[ 0 ] = 22500 ;
    else if ( dp_l && dp_u ) ds.POV[ 0 ] = 31500 ;
    else if ( dp_u         ) ds.POV[ 0 ] =     0 ;
    else if ( dp_r         ) ds.POV[ 0 ] =  9000 ;
    else if ( dp_d         ) ds.POV[ 0 ] = 18000 ;
    else if ( dp_l         ) ds.POV[ 0 ] = 27000 ;
    // Buttons: A=0, B=1, X=2, Y=3, LS=4, RS=5, BACK=6, START=7
    ds.Buttons[ 0 ] = xs.Buttons[ 12 ] ? 128 : 0 ;
    ds.Buttons[ 1 ] = xs.Buttons[ 13 ] ? 128 : 0 ;
    ds.Buttons[ 2 ] = xs.Buttons[ 14 ] ? 128 : 0 ;
    ds.Buttons[ 3 ] = xs.Buttons[ 15 ] ? 128 : 0 ;
    ds.Buttons[ 4 ] = xs.Buttons[  8 ] ? 128 : 0 ;
    ds.Buttons[ 5 ] = xs.Buttons[  9 ] ? 128 : 0 ;
    ds.Buttons[ 6 ] = xs.Buttons[  5 ] ? 128 : 0 ;
    ds.Buttons[ 7 ] = xs.Buttons[  4 ] ? 128 : 0 ;
    return 0 ;
}

extern int RefreshEffectPlayState_PF( int AlwaysRunFlag )
{
    (void)AlwaysRunFlag;
    return 0 ;
}

extern int CheckJoypadVibrationEnable_PF( INPUTPADDATA *pad, int EffectIndex )
{
    (void)pad; (void)EffectIndex;
    return 0 ;
}

extern int CheckJoypadXInput_PF( int InputType )
{
    (void)InputType;
    return 0 ;
}

extern int GetJoypadType_PF( int InputType )
{
    (void)InputType;
    return 0 ;
}

extern int SetJoypadDeadZone_PF( INPUTPADDATA *pad )
{
    (void)pad;
    return 0 ;
}

// --- キーボード ---------------------------------------------------------

// Mouse wheel アキュムレータ (SDL_MOUSEWHEEL event を吸い上げる)
// UpdateKeyboardInputState_PF が毎フレーム呼ばれる前提で、ここで event queue を
// 排出して wheel 移動量を貯める。
static int s_WheelAccum  = 0 ;
static int s_HWheelAccum = 0 ;

// 下で定義 (tick 関数からも参照)
extern void Desktop_UpdateTouchInputState( void ) ;

extern int UpdateKeyboardInputState_PF( int UseProcessMessage )
{
    (void)UseProcessMessage;
    SDL_PumpEvents() ;
    // Wheel event は PollEvent 系でしか取れないので peek して吸い上げる
    SDL_Event evs[ 16 ] ;
    int n = SDL_PeepEvents( evs, 16, SDL_GETEVENT, SDL_MOUSEWHEEL, SDL_MOUSEWHEEL ) ;
    for ( int i = 0 ; i < n ; ++i ) {
        int dir = ( evs[ i ].wheel.direction == SDL_MOUSEWHEEL_FLIPPED ) ? -1 : 1 ;
        s_WheelAccum  += evs[ i ].wheel.y * dir * 120 ;  // Win32 WHEEL_DELTA=120 準拠
        s_HWheelAccum += evs[ i ].wheel.x * dir * 120 ;
    }
    Desktop_UpdateTouchInputState() ;
    return 0 ;
}

// --- マウス -------------------------------------------------------------

extern int GetMouseInput_PF( void )
{
    // 左/中/右 ボタンを DxLib の MOUSE_INPUT_LEFT/MIDDLE/RIGHT bit で返す
    int x, y ;
    Uint32 state = SDL_GetMouseState( &x, &y ) ;
    int result = 0 ;
    if ( state & SDL_BUTTON( SDL_BUTTON_LEFT   ) ) result |= 0x1 ;  // MOUSE_INPUT_LEFT
    if ( state & SDL_BUTTON( SDL_BUTTON_RIGHT  ) ) result |= 0x2 ;  // MOUSE_INPUT_RIGHT
    if ( state & SDL_BUTTON( SDL_BUTTON_MIDDLE ) ) result |= 0x4 ;  // MOUSE_INPUT_MIDDLE
    return result ;
}

// s_WheelAccum / s_HWheelAccum は UpdateKeyboardInputState_PF 内で定義済

extern int GetMouseWheelRotVol_PF( int CounterReset )
{
    int v = s_WheelAccum ;
    if ( CounterReset ) s_WheelAccum = 0 ;
    return v ;
}

extern int GetMouseHWheelRotVol_PF( int CounterReset )
{
    int v = s_HWheelAccum ;
    if ( CounterReset ) s_HWheelAccum = 0 ;
    return v ;
}

extern float GetMouseWheelRotVolF_PF( int CounterReset )
{
    return ( float )GetMouseWheelRotVol_PF( CounterReset ) ;
}

extern float GetMouseHWheelRotVolF_PF( int CounterReset )
{
    return ( float )GetMouseHWheelRotVol_PF( CounterReset ) ;
}

extern int GetMousePoint_PF( int *XBuf, int *YBuf )
{
    int x = 0, y = 0 ;
    SDL_GetMouseState( &x, &y ) ;
    if ( XBuf ) *XBuf = x ;
    if ( YBuf ) *YBuf = y ;
    return 0 ;
}

extern int SetMousePoint_PF( int PointX, int PointY )
{
    // 現在マウス focus を持つウィンドウに warp する。focus が無い場合は
    // SDL_GetGrabbedWindow / SDL_GL_GetCurrentWindow のどちらかを fallback 使用。
    SDL_Window *win = SDL_GetMouseFocus() ;
    if ( !win ) win = SDL_GL_GetCurrentWindow() ;
    if ( !win ) return -1 ;
    SDL_WarpMouseInWindow( win, PointX, PointY ) ;
    return 0 ;
}

// --- タッチ入力 (SDL2 SDL_TOUCH_* 経由、最小実装) -------------------------
//   毎フレーム SDL_GetNumTouchDevices/GetNumTouchFingers でスキャンして
//   TOUCHINPUTDATA を構築、AddTouchInputData(&td) で DxLib 本体の
//   InputSysData.Touch に反映する。NS_GetTouchInput 等の共通層 API が
//   そのまま動くようになる。
//   SDL_HINT_TOUCH_MOUSE_EVENTS はデフォルト ON なので、PC マウス左クリック
//   でも擬似タッチとして拾える (testing 向け)。

extern void Desktop_UpdateTouchInputState( void )
{
    TOUCHINPUTDATA td ;
    std::memset( &td, 0, sizeof( td ) ) ;
    td.Time   = ( LONGLONG )SDL_GetTicks() ;
    td.Source = 0 ;
    td.PointNum = 0 ;

    int ww = 0, wh = 0 ;
    SDL_Window *win = SDL_GL_GetCurrentWindow() ;
    if ( win ) SDL_GetWindowSize( win, &ww, &wh ) ;
    if ( ww <= 0 ) ww = 640 ;
    if ( wh <= 0 ) wh = 480 ;

    int devN = SDL_GetNumTouchDevices() ;
    for ( int d = 0 ; d < devN && td.PointNum < TOUCHINPUTPOINT_MAX ; ++d )
    {
        SDL_TouchID tid = SDL_GetTouchDevice( d ) ;
        int fn = SDL_GetNumTouchFingers( tid ) ;
        for ( int f = 0 ; f < fn && td.PointNum < TOUCHINPUTPOINT_MAX ; ++f )
        {
            SDL_Finger *fg = SDL_GetTouchFinger( tid, f ) ;
            if ( !fg ) continue ;
            TOUCHINPUTPOINT &p = td.Point[ td.PointNum++ ] ;
            p.Device      = ( DWORD )d ;
            p.ID          = ( DWORD )fg->id ;
            p.PositionX   = ( int )( fg->x * ww ) ;
            p.PositionY   = ( int )( fg->y * wh ) ;
            p.Pressure    = fg->pressure ;
            p.Orientation = 0.0f ;
            p.Tilt        = 0.0f ;
            p.ToolType    = 0 ;  // DX_TOUCHINPUT_TOOL_TYPE_UNKNOWN
        }
    }
    AddTouchInputData( &td ) ;
}

// --- KeyInputString: SDL_StartTextInput + SDL_TEXTINPUT 経由の最小実装 ----
// IME 合成 popup は対応せず、確定後の UTF-8 文字 + Backspace + Enter + Esc
// (CancelValidFlag) のみを扱う。描画は user 既存の screen に被せず、入力中
// 専用の描画ループで行う (画面背景はそのまま、入力 prompt を上書き)。
//
// 戻り値: Enter 確定 = 1 / Esc 取消 (CancelValidFlag != 0) = 0 / エラー = -1

extern int KeyInputString( int x, int y, size_t CharMaxLength,
                            TCHAR *StrBuffer, int CancelValidFlag )
{
    if ( !StrBuffer || CharMaxLength == 0 ) return -1 ;
    StrBuffer[ 0 ] = 0 ;

    SDL_StartTextInput() ;

    // UTF-8 として buffer に積む
    std::string text ;
    bool finished = false ;
    int  return_code = -1 ;

    extern int     ScreenFlip( void ) ;     // forward decl (DxLib::ScreenFlip)
    extern int     DrawString( int x, int y, const TCHAR *str, unsigned int color, unsigned int edge_color ) ;
    extern unsigned int GetColor( int r, int g, int b ) ;

    Uint32 cursor_blink = SDL_GetTicks() ;
    bool   cursor_on    = true ;

    while ( !finished )
    {
        SDL_Event ev ;
        while ( SDL_PollEvent( &ev ) )
        {
            if ( ev.type == SDL_QUIT ) {
                return_code = -1 ;
                finished = true ;
                break ;
            }
            if ( ev.type == SDL_TEXTINPUT ) {
                if ( text.size() + std::strlen( ev.text.text ) < CharMaxLength ) {
                    text.append( ev.text.text ) ;
                }
            } else if ( ev.type == SDL_KEYDOWN ) {
                SDL_Keycode k = ev.key.keysym.sym ;
                if ( k == SDLK_RETURN || k == SDLK_KP_ENTER ) {
                    return_code = 1 ;
                    finished = true ;
                } else if ( k == SDLK_ESCAPE && CancelValidFlag ) {
                    text.clear() ;
                    return_code = 0 ;
                    finished = true ;
                } else if ( k == SDLK_BACKSPACE && !text.empty() ) {
                    // UTF-8 を考慮して 1 文字削除 (continuation byte 0x80..0xBF)
                    while ( !text.empty() ) {
                        unsigned char c = ( unsigned char )text.back() ;
                        text.pop_back() ;
                        if ( ( c & 0xC0 ) != 0x80 ) break ;   // 先頭バイトに到達
                    }
                }
            }
        }

        // 画面更新: 入力中の文字 + cursor を表示 (背景はそのまま)
        if ( SDL_GetTicks() - cursor_blink > 500 ) {
            cursor_on = !cursor_on ;
            cursor_blink = SDL_GetTicks() ;
        }
        std::string display = text ;
        if ( cursor_on ) display += "_" ;
        DrawString( x, y, display.c_str(), GetColor( 255, 255, 255 ), 0 ) ;
        ScreenFlip() ;
        SDL_Delay( 16 ) ;
    }

    SDL_StopTextInput() ;

    if ( return_code == 1 ) {
        size_t n = text.size() ;
        if ( n >= CharMaxLength ) n = CharMaxLength - 1 ;
        std::memcpy( StrBuffer, text.data(), n ) ;
        StrBuffer[ n ] = 0 ;
    }
    return return_code ;
}

extern int KeyInputSingleCharString( int x, int y, size_t CharMaxLength,
                                      TCHAR *StrBuffer, int CancelValidFlag )
{
    return KeyInputString( x, y, CharMaxLength, StrBuffer, CancelValidFlag ) ;
}

#ifndef DX_NON_NAMESPACE
}
#endif

#endif // DX_NON_INPUT
