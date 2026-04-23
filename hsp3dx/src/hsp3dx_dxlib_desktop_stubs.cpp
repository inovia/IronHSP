// hsp3dx_dxlib_desktop_stubs.cpp — DxLib API stubs for Desktop (PoC)
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

} // namespace DxLib