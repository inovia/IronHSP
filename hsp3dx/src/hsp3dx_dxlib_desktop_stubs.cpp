// hsp3dx_dxlib_desktop_stubs.cpp — DxLib API stubs for Desktop (PoC)
//
// Note: SDL2_ttf 非 link 環境 (Linux SDL2_ttf 未 install / Web Emscripten 等) では
// DxFontDesktop.cpp が compile されないため Desktop_*_Hook が undefined になる。
// __attribute__((weak)) で stub 提供、TTF あり環境では強い実体が override する。
//
//
// These functions are referenced by hsp3dx_dxlib_auto.cpp but not yet
// implemented in the Desktop/ DxLib fork (Sound / Movie / String 系).
// Linking stubs so that the hsp3dx_desktop exe can be built. Runtime
// calls become no-ops returning 0.
#include "DxLib.h"

namespace DxLib {

int AddDataSoftSoundPlayer(int, int, long long, int) { return 0; }
int AddMovieFrameToGraph(int, unsigned int) { return 0; }
int AddOneDataSoftSoundPlayer(int, int, int) { return 0; }
int AddSoundData(int) { return 0; }
int AddStreamSoundMemToFile(char const*, int, int, int, int) { return 0; }
int ChangeChannelVolumeSoundMem(int, int, int) { return 0; }
int ChangeNextPlayChannelVolumeSoundMem(int, int, int) { return 0; }
int ChangeNextPlayPanSoundMem(int, int) { return 0; }
int ChangeNextPlayVolumeSoundMem(int, int) { return 0; }
int CheckSoftSoundPlayerNoneData(int) { return 0; }
int CheckSound() { return 0; }
int CheckSoundFile() { return 0; }
int CheckStartSoftSoundPlayer(int) { return 0; }
int CheckStreamSoundMem(int) { return 0; }
ULONGLONG ConvMicroSecondsToSysPerformanceCount(unsigned long long) { return 0; }
ULONGLONG ConvNanoSecondsToSysPerformanceCount(unsigned long long) { return 0; }
ULONGLONG ConvSecondsToSysPerformanceCount(unsigned long long) { return 0; }
ULONGLONG ConvSysPerformanceCountToMicroSeconds(unsigned long long) { return 0; }
ULONGLONG ConvSysPerformanceCountToMilliSeconds(unsigned long long) { return 0; }
ULONGLONG ConvSysPerformanceCountToNanoSeconds(unsigned long long) { return 0; }
ULONGLONG ConvSysPerformanceCountToSeconds(unsigned long long) { return 0; }
int DeleteMusicMem(int) { return 0; }
int DeleteSoftSoundPlayer(int) { return 0; }
int DrawObtainsBox(int, int, int, int, int, unsigned int, int) { return 0; }
int DrawObtainsString(int, int, int, char const*, unsigned int, unsigned int, int, unsigned int, unsigned int, unsigned int, int, int, int*) { return 0; }
int DrawObtainsString_CharClip(int, int, int, char const*, unsigned int, unsigned int, int, unsigned int, unsigned int, unsigned int, int, int, int*) { return 0; }
int DrawObtainsString_WordClip(int, int, int, char const*, unsigned int, unsigned int, int, unsigned int, unsigned int, unsigned int, int, int, int*) { return 0; }
int DuplicateSoundMem(int, int) { return 0; }
int DxLib_GlobalStructInitialize() { return 0; }
int GetBatteryLifePercent() { return 0; }
int GetChannelVolumeSoundMem(int, int) { return 0; }
int GetChannelVolumeSoundMem2(int, int) { return 0; }
int GetCreateSoundDataType() { return 0; }
int GetCreateSoundIgnoreLoopAreaInfo() { return 0; }
float GetCreateSoundPitchRate() { return 0; }
float GetCreateSoundTimeStretchRate() { return 0; }
LONGLONG GetCurrentPositionSoundMem(int) { return 0; }
int GetDisableReadSoundFunctionMask() { return 0; }
int GetFFTVibrationSoftSound(int, int, long long, int, float*, int) { return 0; }
int GetFFTVibrationSoftSoundBase(int, int, long long, int, float*, float*, int) { return 0; }
int GetFrequencySoundMem(int) { return 0; }
int GetMusicMemPosition(int) { return 0; }
int GetMusicPosition() { return 0; }
LONGLONG GetNowHiPerformanceCount(int) { return 0; }
int GetObtainsStringCharPosition(int, int, int, char const*, int, int*, int*, int, int*) { return 0; }
int GetObtainsStringCharPosition_CharClip(int, int, int, char const*, int, int*, int*, int, int*) { return 0; }
int GetObtainsStringCharPosition_WordClip(int, int, int, char const*, int, int*, int*, int, int*) { return 0; }
int GetOggCommentNum(char const*) { return 0; }
LONGLONG GetOneFrameTimeMovieToGraph(int) { return 0; }
int GetPanSoundMem(int) { return 0; }
int GetSoftSoundPlayerFormat(int, int*, int*, int*) { return 0; }
LONGLONG GetSoundCurrentPosition(int) { return 0; }
LONGLONG GetSoundCurrentTime(int) { return 0; }
int GetSoundCurrentTimeType() { return 0; }
LONGLONG GetSoundTotalSample(int) { return 0; }
LONGLONG GetSoundTotalTime(int) { return 0; }
int GetStockDataLengthSoftSoundPlayer(int, int*) { return 0; }
LONGLONG GetStreamSoundCurrentPosition(int) { return 0; }
LONGLONG GetStreamSoundCurrentTime(int) { return 0; }
int GetStringLength(char const*) { return 0; }
int GetStringPoint(char const*, int) { return 0; }
int GetStringPoint2(char const*, int) { return 0; }
int GetVolumeSoundMem(int) { return 0; }
int GetVolumeSoundMem2(int) { return 0; }
int InitMusicMem() { return 0; }
int InitSoftSoundPlayer() { return 0; }
int LoadBGM(char const*) { return 0; }
int LoadSoundMemToBufNumSitei(char const*, int) { return 0; }
int MakeSoftSoundPlayer(int) { return 0; }
int MakeSoftSoundPlayer1Ch16Bit22KHz() { return 0; }
int MakeSoftSoundPlayer1Ch16Bit44KHz() { return 0; }
int MakeSoftSoundPlayer1Ch8Bit22KHz() { return 0; }
int MakeSoftSoundPlayer1Ch8Bit44KHz() { return 0; }
int MakeSoftSoundPlayer2Ch16Bit22KHz() { return 0; }
int MakeSoftSoundPlayer2Ch16Bit44KHz() { return 0; }
int MakeSoftSoundPlayer2Ch8Bit22KHz() { return 0; }
int MakeSoftSoundPlayer2Ch8Bit44KHz() { return 0; }
int MakeSoftSoundPlayerCustom(int, int, int) { return 0; }
int PlayMovie(char const*, int, int) { return 0; }
int PlaySound(char const*, int) { return 0; }
int PlaySoundDX(char const*, int) { return 0; }
int PlaySoundFile(char const*, int) { return 0; }
int PlayStreamSoundMem(int, int, int) { return 0; }
int ProcessMusicMem() { return 0; }
int ProcessStreamSoundMem(int) { return 0; }
int ProcessStreamSoundMemAll() { return 0; }
int ResetFrequencySoundMem(int) { return 0; }
int ResetSoftSoundPlayer(int) { return 0; }
int SaveSoftImageToJpeg(char const*, int, int, int) { return 0; }
int SaveSoftImageToPng(char const*, int, int) { return 0; }
int SeekMovieToGraphToFrame(int, int) { return 0; }
int SelectMidiMode(int) { return 0; }
int SetAlwaysRunFlag(int) { return 0; }
int SetChannelVolumeSoundMem(int, int, int) { return 0; }
int SetCreateSoundDataType(int) { return 0; }
int SetCreateSoundIgnoreLoopAreaInfo(int) { return 0; }
int SetCreateSoundLoopAreaSamplePos(long long, long long) { return 0; }
int SetCreateSoundLoopAreaTimePos(long long, long long) { return 0; }
int SetCreateSoundPitchRate(float) { return 0; }
int SetCreateSoundTimeStretchRate(float) { return 0; }
int SetCurrentPositionSoundMem(long long, int) { return 0; }
int SetDisableReadSoundFunctionMask(int) { return 0; }
int SetEnableSoundCaptureFlag(int) { return 0; }
int SetFrequencySoundMem(int, int) { return 0; }
int SetGraphBlendScalingFilterMode(int) { return 0; }
int SetLoopAreaSamplePosSoundMem(long long, long long, int) { return 0; }
int SetLoopAreaTimePosSoundMem(long long, long long, int) { return 0; }
int SetLoopPosSoundMem(long long, int) { return 0; }
int SetLoopSamplePosSoundMem(long long, int) { return 0; }
int SetLoopStartSamplePosSoundMem(long long, int) { return 0; }
int SetLoopStartTimePosSoundMem(long long, int) { return 0; }
int SetLoopTimePosSoundMem(long long, int) { return 0; }
int SetMovieColorA8R8G8B8Flag(int) { return 0; }
int SetMovieRightImageAlphaFlag(int) { return 0; }
int SetMovieUseYUVFormatSurfaceFlag(int) { return 0; }
int SetNextPlayChannelVolumeSoundMem(int, int, int) { return 0; }
int SetNextPlayFrequencySoundMem(int, int) { return 0; }
int SetNextPlayPanSoundMem(int, int) { return 0; }
int SetNextPlayVolumeSoundMem(int, int) { return 0; }
int SetPlayFinishDeleteSoundMem(int, int) { return 0; }
int SetPlaySpeedRateMovieToGraph(int, double) { return 0; }
int SetSoundCurrentPosition(long long, int) { return 0; }
int SetSoundCurrentTime(long long, int) { return 0; }
int SetStreamSoundCurrentPosition(long long, int) { return 0; }
int SetStreamSoundCurrentTime(long long, int) { return 0; }
int SetUseOldVolumeCalcFlag(int) { return 0; }
int SetVolumeSound(int) { return 0; }
int SetVolumeSoundFile(int) { return 0; }
int SetupStreamSoundMem(int) { return 0; }
int StartSoftSoundPlayer(int) { return 0; }
int StopSoftSoundPlayer(int) { return 0; }
int StopSound() { return 0; }
int StopSoundFile() { return 0; }
int StopStreamSoundMem(int, int) { return 0; }
int TellMovieToGraphToFrame(int) { return 0; }
int WritePitchShiftSoftSoundData(int, int) { return 0; }
int WriteTimeStretchSoftSoundData(int, int) { return 0; }

// --- SDL2_mixer 非 link 環境 (Web/Linux SDL2_mixer 未 install 等) では
//     SoundMem / Music / SoftSound / 3D Sound 系も stub ---
// 注: emscripten port の SDL2_mixer (-s USE_SDL_MIXER=2) を link するように
// なったので __EMSCRIPTEN__ branch は外した (DxSoundDesktop.cpp が compile される)。
#if defined(HSP3DX_NO_SDL2_MIXER)
int ChangePanSoundMem(int, int) { return 0; }
int CheckSoundMem(int) { return 0; }
int DeleteSoundMem(int) { return 0; }
int InitSoundMem() { return 0; }
int LoadSoundMem(char const*, int, int) { return -1; }
int LoadSoundMem2(char const*, char const*) { return -1; }
int LoadSoundMemBase(char const*, int, int) { return -1; }
int LoadSoundMemFromSoftSound(int, int) { return -1; }
int PlaySoundMem(int, int, int) { return 0; }
int SetPanSoundMem(int, int) { return 0; }
int SetVolumeSoundMem(int, int) { return 0; }
int StopSoundMem(int, int) { return 0; }
int ChangeVolumeSoundMem(int, int) { return 0; }
int InitSoftSound() { return 0; }
int LoadSoftSound(char const*) { return -1; }
int MakeSoftSound(int, long long) { return -1; }
int MakeSoftSound1Ch16Bit44KHz(long long) { return -1; }
int MakeSoftSound2Ch16Bit22KHz(long long) { return -1; }
int MakeSoftSound2Ch16Bit44KHz(long long) { return -1; }
int MakeSoftSound2Ch8Bit22KHz(long long) { return -1; }
int MakeSoftSound2Ch8Bit44KHz(long long) { return -1; }
int Set3DPositionSoundMem(tagVECTOR, int) { return 0; }
int Set3DRadiusSoundMem(float, int) { return 0; }
int Set3DSoundListenerConeAngle(float, float) { return 0; }
int Set3DSoundListenerConeVolume(float, float) { return 0; }
int Set3DSoundListenerPosAndFrontPosAndUpVec(tagVECTOR, tagVECTOR, tagVECTOR) { return 0; }
int Set3DSoundListenerPosAndFrontPos_UpVecY(tagVECTOR, tagVECTOR) { return 0; }
int Set3DSoundListenerVelocity(tagVECTOR) { return 0; }
int Set3DVelocitySoundMem(tagVECTOR, int) { return 0; }
int SetNextPlay3DPositionSoundMem(tagVECTOR, int) { return 0; }
int SetNextPlay3DRadiusSoundMem(float, int) { return 0; }
int SetNextPlay3DVelocitySoundMem(tagVECTOR, int) { return 0; }
int CheckMusicMem(int) { return 0; }
int DeleteSoftSound(int) { return 0; }
int GetSoftSoundFormat(int, int*, int*, int*, int*) { return -1; }
LONGLONG GetSoftSoundSampleNum(int) { return 0; }
int LoadMusicMem(char const*) { return -1; }
int MakeSoftSound1Ch16Bit22KHz(long long) { return -1; }
int MakeSoftSound1Ch8Bit22KHz(long long) { return -1; }
int MakeSoftSound1Ch8Bit44KHz(long long) { return -1; }
int MakeSoftSoundCustom(int, int, int, long long, int) { return -1; }
int PlayMusic(char const*, int) { return 0; }
int PlayMusicMem(int, int) { return 0; }
int ReadSoftSoundData(int, long long, int*, int*) { return -1; }
int ReadSoftSoundDataF(int, long long, float*, float*) { return -1; }
int SaveSoftSound(int, char const*) { return -1; }
int SetVolumeMusic(int) { return 0; }
int SetVolumeMusicMem(int, int) { return 0; }
int StopMusic() { return 0; }
int StopMusicMem(int) { return 0; }
int WriteSoftSoundData(int, long long, int, int) { return -1; }
int WriteSoftSoundDataF(int, long long, float, float) { return -1; }
#endif

} // namespace DxLib

// --- Desktop_*_Hook の weak stub (DxFontDesktop.cpp が無い環境用) ---
//  HAS_SDL2_TTF 環境では DxFontDesktop.cpp の strong 定義が override する。
//  TTF 無し (Linux/Web 等) ではここの stub が link される。
#include <wchar.h>
namespace DxLib {
struct FONTMANAGE;
__attribute__((weak)) int Desktop_DrawString_Hook(
    int, int, float, float, int, double, double, int, float, float, double,
    const wchar_t *, size_t, unsigned int, FONTMANAGE *,
    unsigned int, int) { return -1; }
__attribute__((weak)) int Desktop_GetStringWidth_Hook(
    const wchar_t *, int, FONTMANAGE *) { return -1; }
__attribute__((weak)) int FontCacheCharAddToHandle_Timing2_PF(
    FONTMANAGE *) { return 0; }

//  --- 追加 Font PF stub (Web 等 SDL2_ttf 無し環境) ---
struct CREATEFONTTOHANDLE_GPARAM;
struct FONTCHARDATA;
__attribute__((weak)) int InitFontManage_PF() { return 0; }
__attribute__((weak)) int TermFontManage_PF() { return 0; }
//  Web (SDL2_ttf 非リンク): font 作成 を fail させる。0 を返すと DxLib が
//  ManageData->BaseInfo.MaxWidth = 0 のまま SetupFontCache を呼んで
//  DxFont.cpp:5896 (CacheImageSize.cx / MaxWidth) で divide-by-zero になる。
//  -1 で抜ければ CreateFontToHandle_Static が早期 return -1 して init 続行可能。
__attribute__((weak)) int CreateFontToHandle_PF(
    CREATEFONTTOHANDLE_GPARAM *, FONTMANAGE *, int) { return -1; }
__attribute__((weak)) int CreateFontToHandle_Error_PF(FONTMANAGE *) { return -1; }
__attribute__((weak)) int TerminateFontHandle_PF(FONTMANAGE *) { return 0; }
__attribute__((weak)) int SetupFontCache_PF(
    CREATEFONTTOHANDLE_GPARAM *, FONTMANAGE *, int) { return 0; }
__attribute__((weak)) int FontCacheCharAddToHandle_Timing0_PF(FONTMANAGE *) { return 0; }
__attribute__((weak)) int FontCacheCharAddToHandle_Timing1_PF(
    FONTMANAGE *, FONTCHARDATA *, unsigned int, unsigned int, int) { return 0; }
__attribute__((weak)) int CheckMusic() { return 0; }
} // namespace DxLib

//  --- WebGL に存在しない fixed-function GL 関数の stub (Web 専用) ---
//  LEGACY_GL_EMULATION でカバー外のものを weak で補う。実際の描画には
//  影響しないかもだが link を通すため。
#if defined(__EMSCRIPTEN__)
extern "C" __attribute__((weak)) void glColorMaterial(unsigned int, unsigned int) {}
extern "C" __attribute__((weak)) void glMaterialf(unsigned int, unsigned int, float) {}
#endif

//  --- Linux/Mac の hsp3ext_linux.cpp が参照する dllcmd 系の最小 stub ---
//  本来は hsp3extlib_ffi.cpp が提供するが、それは COM 系依存があり Linux build
//  困難なので空 stub にする。hsp3dx は #uselib 経由 DLL ロードを使わないので
//  実害なし (HSP の `#uselib` 命令を呼ぶと return -1 で error になるだけ)。
struct HSP3TYPEINFO;
int Hsp3ExtLibInit( HSP3TYPEINFO * ) { return 0; }
int exec_dllcmd( int, int ) { return 0; }
int cmdfunc_dllcmd( int ) { return 0; }