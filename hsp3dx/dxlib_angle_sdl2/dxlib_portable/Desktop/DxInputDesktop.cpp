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
    // SDL_WarpMouseInWindow は window pointer 要求、今は未対応
    (void)PointX; (void)PointY;
    return 0 ;
}

#ifndef DX_NON_NAMESPACE
}
#endif

#endif // DX_NON_INPUT
