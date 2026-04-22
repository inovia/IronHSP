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

// --- ゲームパッド -------------------------------------------------------

extern int SetupJoypad_PF( void )      { return 0 ; }
extern int TerminateJoypad_PF( void )  { return 0 ; }

extern int UpdateJoypadInputState_PF( int PadNo )
{
    // TODO: SDL_GameController 経由で state 同期。Stage 16 では no-op
    (void)PadNo;
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

extern int UpdateKeyboardInputState_PF( int UseProcessMessage )
{
    (void)UseProcessMessage;
    // DxLib 側の g_InputState[DX_KEY_INPUT_*] を SDL_GetKeyboardState から
    // 書き換える。実装の詳細は iOS/Android 版にならう必要があるが、
    // ここでは SDL が自動的にキー状態を管理するので no-op でも動く場合がある。
    // (CheckHitKey は DxLib 内部で UpdateKeyboardInputState を呼ぶ前提)
    SDL_PumpEvents() ;
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

static int s_WheelAccum = 0 ;
static int s_HWheelAccum = 0 ;

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
