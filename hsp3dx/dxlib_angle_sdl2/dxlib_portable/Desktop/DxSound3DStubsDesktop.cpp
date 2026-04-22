//-----------------------------------------------------------------------------
//
//      DX ライブラリ   Desktop (SDL2_mixer) 用 3D サウンド スタブ
//
//      DxLib 本来の 3D サウンドは Win32 の X3DAudio 依存。iOS / Android 版は
//      すべて `return 0` の空実装で扱っている。Desktop 版もこれに倣い、
//      3D sound API を呼んでも無音 or 動作無し (= 2D 再生が生きる) とする。
//      将来的に OpenAL Soft 経由で本実装する場合はここを置換する。
//
//-----------------------------------------------------------------------------

#define DX_MAKE

#ifdef _WIN32
#include <windows.h>
#endif

// DxSoundDesktop.cpp と異なり、このファイルは DX_NON_SOUND=0 で DxLib.h を
// 読み込みたいので冒頭で undef する。他の音声 API の実体は DxSoundDesktop.cpp
// 側にあるので、ここで宣言が見えても問題ない。
#undef DX_NON_SOUND

#include "../DxCompileConfig.h"
#include "../DxLib.h"

#ifndef DX_NON_NAMESPACE
namespace DxLib
{
#endif

// --- per-handle 3D sound ---------------------------------------------------

extern int Set3DPositionSoundMem             ( VECTOR /*Position*/,       int /*SoundHandle*/ ) { return 0 ; }
extern int Set3DRadiusSoundMem               ( float  /*Radius*/,         int /*SoundHandle*/ ) { return 0 ; }
extern int Set3DVelocitySoundMem             ( VECTOR /*Velocity*/,       int /*SoundHandle*/ ) { return 0 ; }

extern int SetNextPlay3DPositionSoundMem     ( VECTOR /*Position*/,       int /*SoundHandle*/ ) { return 0 ; }
extern int SetNextPlay3DRadiusSoundMem       ( float  /*Radius*/,         int /*SoundHandle*/ ) { return 0 ; }
extern int SetNextPlay3DVelocitySoundMem     ( VECTOR /*Velocity*/,       int /*SoundHandle*/ ) { return 0 ; }

extern int Set3DReverbParamSoundMem          ( const SOUND3D_REVERB_PARAM * /*Param*/,      int /*SoundHandle*/ ) { return 0 ; }
extern int Set3DPresetReverbParamSoundMem    ( int /*PresetNo*/,                            int /*SoundHandle*/ ) { return 0 ; }
extern int Set3DReverbParamSoundMemAll       ( const SOUND3D_REVERB_PARAM * /*Param*/,      int /*PlaySoundOnly*/ ) { return 0 ; }
extern int Set3DPresetReverbParamSoundMemAll ( int /*PresetNo*/,                            int /*PlaySoundOnly*/ ) { return 0 ; }
extern int Get3DReverbParamSoundMem          (       SOUND3D_REVERB_PARAM * /*ParamBuffer*/, int /*SoundHandle*/ ) { return 0 ; }
extern int Get3DPresetReverbParamSoundMem    (       SOUND3D_REVERB_PARAM * /*ParamBuffer*/, int /*PresetNo*/     ) { return 0 ; }

// --- global 3D sound environment -------------------------------------------

extern int SetCreate3DSoundFlag                  ( int    /*Flag*/ )                                      { return 0 ; }
extern int Set3DSoundOneMetre                    ( float  /*Distance*/ )                                   { return 0 ; }
extern int Set3DSoundListenerPosAndFrontPos_UpVecY ( VECTOR /*Position*/, VECTOR /*FrontPosition*/ )        { return 0 ; }
extern int Set3DSoundListenerPosAndFrontPosAndUpVec( VECTOR /*Position*/, VECTOR /*FrontPosition*/, VECTOR /*UpVector*/ ) { return 0 ; }
extern int Set3DSoundListenerVelocity            ( VECTOR /*Velocity*/ )                                   { return 0 ; }
extern int Set3DSoundListenerConeAngle           ( float  /*InnerAngle*/,      float /*OuterAngle*/ )      { return 0 ; }
extern int Set3DSoundListenerConeVolume          ( float  /*InnerAngleVolume*/, float /*OuterAngleVolume*/ ){ return 0 ; }

#ifndef DX_NON_NAMESPACE
}
#endif
