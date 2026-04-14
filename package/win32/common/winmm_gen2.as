; ============================================================
;   Auto-generated from CsWin32 / win32metadata
;   dll:    winmm.dll
;   tool:   tools/cswin32_bridge/gen_from_cswin32.py
;   Do not edit by hand ? regenerate via the python script.
;   Needs hsp3net (intptr / NSTRUCT / wstr).
; ============================================================

#ifndef __winmm_gen2_as__
#define __winmm_gen2_as__

; Shared NSTRUCT + #define constants for all win32 *_gen2.as
#include "win32_types_gen2.as"

;--- functions ---
#uselib "winmm.dll"
; uint timeBeginPeriod(uint uPeriod)
#cfunc timeBeginPeriod "timeBeginPeriod" int

; uint timeEndPeriod(uint uPeriod)
#cfunc timeEndPeriod "timeEndPeriod" int

; uint timeGetDevCaps(winmdroot.Media.TIMECAPS* ptc, uint cbtc)
#cfunc timeGetDevCaps "timeGetDevCaps" var, int

; uint timeGetSystemTime(winmdroot.Media.MMTIME* pmmt, uint cbmmt)
#cfunc timeGetSystemTime "timeGetSystemTime" var, int

; uint timeGetTime()
#cfunc timeGetTime "timeGetTime"

; winmdroot.Foundation.LRESULT CloseDriver(winmdroot.Media.Multimedia.HDRVR hDriver, winmdroot.Foundation.LPARAM lParam1, winmdroot.Foundation.LPARAM lParam2)
#cfunc CloseDriver "CloseDriver" intptr, intptr, intptr

; winmdroot.Foundation.LRESULT DefDriverProc(nuint dwDriverIdentifier, winmdroot.Media.Multimedia.HDRVR hdrvr, uint uMsg, winmdroot.Foundation.LPARAM lParam1, winmdroot.Foundation.LPARAM lParam2)
#cfunc DefDriverProc "DefDriverProc" int, intptr, int, intptr, intptr

; winmdroot.Foundation.BOOL DriverCallback(nuint dwCallback, uint dwFlags, winmdroot.Media.Multimedia.HDRVR hDevice, uint dwMsg, nuint dwUser, nuint dwParam1, nuint dwParam2)
#cfunc DriverCallback "DriverCallback" int, int, intptr, int, int, int, int

; winmdroot.Foundation.HMODULE DrvGetModuleHandle(winmdroot.Media.Multimedia.HDRVR hDriver)
#cfunc DrvGetModuleHandle "DrvGetModuleHandle" intptr

; winmdroot.Foundation.HMODULE GetDriverModuleHandle(winmdroot.Media.Multimedia.HDRVR hDriver)
#cfunc GetDriverModuleHandle "GetDriverModuleHandle" intptr

; winmdroot.Media.Multimedia.HDRVR OpenDriver(winmdroot.Foundation.PCWSTR szDriverName, winmdroot.Foundation.PCWSTR szSectionName, winmdroot.Foundation.LPARAM lParam2)
#cfunc OpenDriver "OpenDriver" wstr, wstr, intptr

; winmdroot.Foundation.BOOL PlaySoundW(winmdroot.Foundation.PCWSTR pszSound, winmdroot.Foundation.HMODULE hmod, winmdroot.Media.Audio.SND_FLAGS fdwSound)
#cfunc PlaySoundW "PlaySoundW" wstr, intptr, int

; winmdroot.Foundation.LRESULT SendDriverMessage(winmdroot.Media.Multimedia.HDRVR hDriver, uint message, winmdroot.Foundation.LPARAM lParam1, winmdroot.Foundation.LPARAM lParam2)
#cfunc SendDriverMessage "SendDriverMessage" intptr, int, intptr, intptr

; uint auxGetDevCapsW(nuint uDeviceID, winmdroot.Media.Audio.AUXCAPSW* pac, uint cbac)
#cfunc auxGetDevCapsW "auxGetDevCapsW" int, var, int

; uint auxGetNumDevs()
#cfunc auxGetNumDevs "auxGetNumDevs"

; uint auxGetVolume(uint uDeviceID, uint* pdwVolume)
#cfunc auxGetVolume "auxGetVolume" int, var

; uint auxOutMessage(uint uDeviceID, uint uMsg, nuint dw1, nuint dw2)
#cfunc auxOutMessage "auxOutMessage" int, int, int, int

; uint auxSetVolume(uint uDeviceID, uint dwVolume)
#cfunc auxSetVolume "auxSetVolume" int, int

; uint joyConfigChanged(uint dwFlags)
#cfunc joyConfigChanged "joyConfigChanged" int

; uint joyGetDevCapsW(nuint uJoyID, winmdroot.Media.Multimedia.JOYCAPSW* pjc, uint cbjc)
#cfunc joyGetDevCapsW "joyGetDevCapsW" int, var, int

; uint joyGetNumDevs()
#cfunc joyGetNumDevs "joyGetNumDevs"

; uint joyGetPos(uint uJoyID, winmdroot.Media.Multimedia.JOYINFO* pji)
#cfunc joyGetPos "joyGetPos" int, var

; uint joyGetPosEx(uint uJoyID, winmdroot.Media.Multimedia.JOYINFOEX* pji)
#cfunc joyGetPosEx "joyGetPosEx" int, var

; uint joyGetThreshold(uint uJoyID, uint* puThreshold)
#cfunc joyGetThreshold "joyGetThreshold" int, var

; uint joyReleaseCapture(uint uJoyID)
#cfunc joyReleaseCapture "joyReleaseCapture" int

; uint joySetCapture(winmdroot.Foundation.HWND hwnd, uint uJoyID, uint uPeriod, winmdroot.Foundation.BOOL fChanged)
#cfunc joySetCapture "joySetCapture" intptr, int, int, int

; uint joySetThreshold(uint uJoyID, uint uThreshold)
#cfunc joySetThreshold "joySetThreshold" int, int

; winmdroot.Foundation.BOOL mciDriverNotify(winmdroot.Foundation.HANDLE hwndCallback, uint wDeviceID, uint uStatus)
#cfunc mciDriverNotify "mciDriverNotify" intptr, int, int

; uint mciDriverYield(uint wDeviceID)
#cfunc mciDriverYield "mciDriverYield" int

; winmdroot.Foundation.BOOL mciFreeCommandResource(uint wTable)
#cfunc mciFreeCommandResource "mciFreeCommandResource" int

; winmdroot.Media.HTASK mciGetCreatorTask(uint mciId)
#cfunc mciGetCreatorTask "mciGetCreatorTask" int

; uint mciGetDeviceIDA(winmdroot.Foundation.PCSTR pszDevice)
#cfunc mciGetDeviceIDA "mciGetDeviceIDA" str

; uint mciGetDeviceIDFromElementIDA(uint dwElementID, winmdroot.Foundation.PCSTR lpstrType)
#cfunc mciGetDeviceIDFromElementIDA "mciGetDeviceIDFromElementIDA" int, str

; uint mciGetDeviceIDFromElementIDW(uint dwElementID, winmdroot.Foundation.PCWSTR lpstrType)
#cfunc mciGetDeviceIDFromElementIDW "mciGetDeviceIDFromElementIDW" int, wstr

; uint mciGetDeviceIDW(winmdroot.Foundation.PCWSTR pszDevice)
#cfunc mciGetDeviceIDW "mciGetDeviceIDW" wstr

; nuint mciGetDriverData(uint wDeviceID)
#cfunc mciGetDriverData "mciGetDriverData" int

; winmdroot.Foundation.BOOL mciGetErrorStringW(uint mcierr, winmdroot.Foundation.PWSTR pszText, uint cchText)
#cfunc mciGetErrorStringW "mciGetErrorStringW" int, wstr, int

; uint mciLoadCommandResource(winmdroot.Foundation.HANDLE hInstance, winmdroot.Foundation.PCWSTR lpResName, uint wType)
#cfunc mciLoadCommandResource "mciLoadCommandResource" intptr, wstr, int

; uint mciSendCommandW(uint mciId, uint uMsg, nuint dwParam1, nuint dwParam2)
#cfunc mciSendCommandW "mciSendCommandW" int, int, int, int

; uint mciSendStringW(winmdroot.Foundation.PCWSTR lpstrCommand, winmdroot.Foundation.PWSTR lpstrReturnString, uint uReturnLength, winmdroot.Foundation.HWND hwndCallback)
#cfunc mciSendStringW "mciSendStringW" wstr, wstr, int, intptr

; winmdroot.Foundation.BOOL mciSetDriverData(uint wDeviceID, nuint dwData)
#cfunc mciSetDriverData "mciSetDriverData" int, int

; winmdroot.Foundation.BOOL mciSetYieldProc(uint mciId, delegate *unmanaged[Stdcall]<uint,uint,uint> fpYieldProc, uint dwYieldData)
#cfunc mciSetYieldProc "mciSetYieldProc" int, int, int

; uint midiOutClose(winmdroot.Media.Audio.HMIDIOUT hmo)
#cfunc midiOutClose "midiOutClose" intptr

; uint midiConnect(winmdroot.Media.Audio.HMIDI hmi, winmdroot.Media.Audio.HMIDIOUT hmo, [Optional] void* pReserved)
#cfunc midiConnect "midiConnect" intptr, intptr, intptr

; uint midiDisconnect(winmdroot.Media.Audio.HMIDI hmi, winmdroot.Media.Audio.HMIDIOUT hmo, [Optional] void* pReserved)
#cfunc midiDisconnect "midiDisconnect" intptr, intptr, intptr

; uint midiInClose(winmdroot.Media.Audio.HMIDIIN hmi)
#cfunc midiInClose "midiInClose" intptr

; uint midiInAddBuffer(winmdroot.Media.Audio.HMIDIIN hmi, winmdroot.Media.Audio.MIDIHDR* pmh, uint cbmh)
#cfunc midiInAddBuffer "midiInAddBuffer" intptr, var, int

; uint midiInGetDevCapsW(nuint uDeviceID, winmdroot.Media.Audio.MIDIINCAPSW* pmic, uint cbmic)
#cfunc midiInGetDevCapsW "midiInGetDevCapsW" int, var, int

; uint midiInGetErrorTextW(uint mmrError, winmdroot.Foundation.PWSTR pszText, uint cchText)
#cfunc midiInGetErrorTextW "midiInGetErrorTextW" int, wstr, int

; uint midiInGetID(winmdroot.Media.Audio.HMIDIIN hmi, uint* puDeviceID)
#cfunc midiInGetID "midiInGetID" intptr, var

; uint midiInGetNumDevs()
#cfunc midiInGetNumDevs "midiInGetNumDevs"

; uint midiInMessage(winmdroot.Media.Audio.HMIDIIN hmi, uint uMsg, nuint dw1, nuint dw2)
#cfunc midiInMessage "midiInMessage" intptr, int, int, int

; uint midiInOpen(winmdroot.Media.Audio.HMIDIIN* phmi, uint uDeviceID, nuint dwCallback, nuint dwInstance, winmdroot.Media.Audio.MIDI_WAVE_OPEN_TYPE fdwOpen)
#cfunc midiInOpen "midiInOpen" intptr, int, int, int, int

; uint midiInPrepareHeader(winmdroot.Media.Audio.HMIDIIN hmi, winmdroot.Media.Audio.MIDIHDR* pmh, uint cbmh)
#cfunc midiInPrepareHeader "midiInPrepareHeader" intptr, var, int

; uint midiInReset(winmdroot.Media.Audio.HMIDIIN hmi)
#cfunc midiInReset "midiInReset" intptr

; uint midiInStart(winmdroot.Media.Audio.HMIDIIN hmi)
#cfunc midiInStart "midiInStart" intptr

; uint midiInStop(winmdroot.Media.Audio.HMIDIIN hmi)
#cfunc midiInStop "midiInStop" intptr

; uint midiInUnprepareHeader(winmdroot.Media.Audio.HMIDIIN hmi, winmdroot.Media.Audio.MIDIHDR* pmh, uint cbmh)
#cfunc midiInUnprepareHeader "midiInUnprepareHeader" intptr, var, int

; uint midiOutCacheDrumPatches(winmdroot.Media.Audio.HMIDIOUT hmo, uint uPatch, ushort* pwkya, uint fuCache)
#cfunc midiOutCacheDrumPatches "midiOutCacheDrumPatches" intptr, int, var, int

; uint midiOutCachePatches(winmdroot.Media.Audio.HMIDIOUT hmo, uint uBank, ushort* pwpa, uint fuCache)
#cfunc midiOutCachePatches "midiOutCachePatches" intptr, int, var, int

; uint midiOutGetDevCapsW(nuint uDeviceID, winmdroot.Media.Audio.MIDIOUTCAPSW* pmoc, uint cbmoc)
#cfunc midiOutGetDevCapsW "midiOutGetDevCapsW" int, var, int

; uint midiOutGetErrorTextW(uint mmrError, winmdroot.Foundation.PWSTR pszText, uint cchText)
#cfunc midiOutGetErrorTextW "midiOutGetErrorTextW" int, wstr, int

; uint midiOutGetID(winmdroot.Media.Audio.HMIDIOUT hmo, uint* puDeviceID)
#cfunc midiOutGetID "midiOutGetID" intptr, var

; uint midiOutGetNumDevs()
#cfunc midiOutGetNumDevs "midiOutGetNumDevs"

; uint midiOutGetVolume(winmdroot.Media.Audio.HMIDIOUT hmo, uint* pdwVolume)
#cfunc midiOutGetVolume "midiOutGetVolume" intptr, var

; uint midiOutLongMsg(winmdroot.Media.Audio.HMIDIOUT hmo, winmdroot.Media.Audio.MIDIHDR* pmh, uint cbmh)
#cfunc midiOutLongMsg "midiOutLongMsg" intptr, var, int

; uint midiOutMessage(winmdroot.Media.Audio.HMIDIOUT hmo, uint uMsg, nuint dw1, nuint dw2)
#cfunc midiOutMessage "midiOutMessage" intptr, int, int, int

; uint midiOutOpen(winmdroot.Media.Audio.HMIDIOUT* phmo, uint uDeviceID, nuint dwCallback, nuint dwInstance, winmdroot.Media.Audio.MIDI_WAVE_OPEN_TYPE fdwOpen)
#cfunc midiOutOpen "midiOutOpen" intptr, int, int, int, int

; uint midiOutPrepareHeader(winmdroot.Media.Audio.HMIDIOUT hmo, winmdroot.Media.Audio.MIDIHDR* pmh, uint cbmh)
#cfunc midiOutPrepareHeader "midiOutPrepareHeader" intptr, var, int

; uint midiOutReset(winmdroot.Media.Audio.HMIDIOUT hmo)
#cfunc midiOutReset "midiOutReset" intptr

; uint midiOutSetVolume(winmdroot.Media.Audio.HMIDIOUT hmo, uint dwVolume)
#cfunc midiOutSetVolume "midiOutSetVolume" intptr, int

; uint midiOutShortMsg(winmdroot.Media.Audio.HMIDIOUT hmo, uint dwMsg)
#cfunc midiOutShortMsg "midiOutShortMsg" intptr, int

; uint midiOutUnprepareHeader(winmdroot.Media.Audio.HMIDIOUT hmo, winmdroot.Media.Audio.MIDIHDR* pmh, uint cbmh)
#cfunc midiOutUnprepareHeader "midiOutUnprepareHeader" intptr, var, int

; uint midiStreamClose(winmdroot.Media.Audio.HMIDISTRM hms)
#cfunc midiStreamClose "midiStreamClose" intptr

; uint midiStreamOpen(winmdroot.Media.Audio.HMIDISTRM* phms, uint* puDeviceID, uint cMidi, nuint dwCallback, nuint dwInstance, uint fdwOpen)
#cfunc midiStreamOpen "midiStreamOpen" intptr, var, int, int, int, int

; uint midiStreamOut(winmdroot.Media.Audio.HMIDISTRM hms, winmdroot.Media.Audio.MIDIHDR* pmh, uint cbmh)
#cfunc midiStreamOut "midiStreamOut" intptr, var, int

; uint midiStreamPause(winmdroot.Media.Audio.HMIDISTRM hms)
#cfunc midiStreamPause "midiStreamPause" intptr

; uint midiStreamPosition(winmdroot.Media.Audio.HMIDISTRM hms, winmdroot.Media.MMTIME* lpmmt, uint cbmmt)
#cfunc midiStreamPosition "midiStreamPosition" intptr, var, int

; uint midiStreamProperty(winmdroot.Media.Audio.HMIDISTRM hms, byte* lppropdata, uint dwProperty)
#cfunc midiStreamProperty "midiStreamProperty" intptr, var, int

; uint midiStreamRestart(winmdroot.Media.Audio.HMIDISTRM hms)
#cfunc midiStreamRestart "midiStreamRestart" intptr

; uint midiStreamStop(winmdroot.Media.Audio.HMIDISTRM hms)
#cfunc midiStreamStop "midiStreamStop" intptr

; uint mixerClose(winmdroot.Media.Audio.HMIXER hmx)
#cfunc mixerClose "mixerClose" intptr

; uint mixerGetControlDetailsW(winmdroot.Media.Audio.HMIXEROBJ hmxobj, winmdroot.Media.Audio.MIXERCONTROLDETAILS* pmxcd, uint fdwDetails)
#cfunc mixerGetControlDetailsW "mixerGetControlDetailsW" intptr, var, int

; uint mixerGetDevCapsW(nuint uMxId, winmdroot.Media.Audio.MIXERCAPSW* pmxcaps, uint cbmxcaps)
#cfunc mixerGetDevCapsW "mixerGetDevCapsW" int, var, int

; uint mixerGetID(winmdroot.Media.Audio.HMIXEROBJ hmxobj, uint* puMxId, uint fdwId)
#cfunc mixerGetID "mixerGetID" intptr, var, int

; uint mixerGetLineControlsW(winmdroot.Media.Audio.HMIXEROBJ hmxobj, winmdroot.Media.Audio.MIXERLINECONTROLSW* pmxlc, uint fdwControls)
#cfunc mixerGetLineControlsW "mixerGetLineControlsW" intptr, var, int

; uint mixerGetLineInfoW(winmdroot.Media.Audio.HMIXEROBJ hmxobj, winmdroot.Media.Audio.MIXERLINEW* pmxl, uint fdwInfo)
#cfunc mixerGetLineInfoW "mixerGetLineInfoW" intptr, var, int

; uint mixerGetNumDevs()
#cfunc mixerGetNumDevs "mixerGetNumDevs"

; uint mixerMessage(winmdroot.Media.Audio.HMIXER hmx, uint uMsg, nuint dwParam1, nuint dwParam2)
#cfunc mixerMessage "mixerMessage" intptr, int, int, int

; uint mixerOpen([Optional] winmdroot.Media.Audio.HMIXER* phmx, uint uMxId, nuint dwCallback, nuint dwInstance, uint fdwOpen)
#cfunc mixerOpen "mixerOpen" intptr, int, int, int, int

; uint mixerSetControlDetails(winmdroot.Media.Audio.HMIXEROBJ hmxobj, winmdroot.Media.Audio.MIXERCONTROLDETAILS* pmxcd, uint fdwDetails)
#cfunc mixerSetControlDetails "mixerSetControlDetails" intptr, var, int

; uint mmioAdvance(winmdroot.Media.Multimedia.HMMIO hmmio, [Optional] winmdroot.Media.Multimedia.MMIOINFO* pmmioinfo, uint fuAdvance)
#cfunc mmioAdvance "mmioAdvance" intptr, var, int

; uint mmioAscend(winmdroot.Media.Multimedia.HMMIO hmmio, winmdroot.Media.Multimedia.MMCKINFO* pmmcki, uint fuAscend)
#cfunc mmioAscend "mmioAscend" intptr, var, int

; uint mmioClose(winmdroot.Media.Multimedia.HMMIO hmmio, uint fuClose)
#cfunc mmioClose "mmioClose" intptr, int

; uint mmioCreateChunk(winmdroot.Media.Multimedia.HMMIO hmmio, winmdroot.Media.Multimedia.MMCKINFO* pmmcki, uint fuCreate)
#cfunc mmioCreateChunk "mmioCreateChunk" intptr, var, int

; uint mmioDescend(winmdroot.Media.Multimedia.HMMIO hmmio, winmdroot.Media.Multimedia.MMCKINFO* pmmcki, [Optional] winmdroot.Media.Multimedia.MMCKINFO* pmmckiParent, uint fuDescend)
#cfunc mmioDescend "mmioDescend" intptr, var, var, int

; uint mmioFlush(winmdroot.Media.Multimedia.HMMIO hmmio, uint fuFlush)
#cfunc mmioFlush "mmioFlush" intptr, int

; uint mmioGetInfo(winmdroot.Media.Multimedia.HMMIO hmmio, winmdroot.Media.Multimedia.MMIOINFO* pmmioinfo, uint fuInfo)
#cfunc mmioGetInfo "mmioGetInfo" intptr, var, int

; winmdroot.Media.Multimedia.HMMIO mmioOpenW(winmdroot.Foundation.PWSTR pszFileName, [Optional] winmdroot.Media.Multimedia.MMIOINFO* pmmioinfo, uint fdwOpen)
#cfunc mmioOpenW "mmioOpenW" wstr, var, int

; int mmioRead(winmdroot.Media.Multimedia.HMMIO hmmio, sbyte* pch, int cch)
#cfunc mmioRead "mmioRead" intptr, var, int

; uint mmioRenameW(winmdroot.Foundation.PCWSTR pszFileName, winmdroot.Foundation.PCWSTR pszNewFileName, [Optional] winmdroot.Media.Multimedia.MMIOINFO* pmmioinfo, uint fdwRename)
#cfunc mmioRenameW "mmioRenameW" wstr, wstr, var, int

; int mmioSeek(winmdroot.Media.Multimedia.HMMIO hmmio, int lOffset, int iOrigin)
#cfunc mmioSeek "mmioSeek" intptr, int, int

; winmdroot.Foundation.LRESULT mmioSendMessage(winmdroot.Media.Multimedia.HMMIO hmmio, uint uMsg, winmdroot.Foundation.LPARAM lParam1, winmdroot.Foundation.LPARAM lParam2)
#cfunc mmioSendMessage "mmioSendMessage" intptr, int, intptr, intptr

; uint mmioSetBuffer(winmdroot.Media.Multimedia.HMMIO hmmio, winmdroot.Foundation.PSTR pchBuffer, int cchBuffer, uint fuBuffer)
#cfunc mmioSetBuffer "mmioSetBuffer" intptr, str, int, int

; uint mmioSetInfo(winmdroot.Media.Multimedia.HMMIO hmmio, winmdroot.Media.Multimedia.MMIOINFO* pmmioinfo, uint fuInfo)
#cfunc mmioSetInfo "mmioSetInfo" intptr, var, int

; uint mmioStringToFOURCCA(winmdroot.Foundation.PCSTR sz, uint uFlags)
#cfunc mmioStringToFOURCCA "mmioStringToFOURCCA" str, int

; uint mmioStringToFOURCCW(winmdroot.Foundation.PCWSTR sz, uint uFlags)
#cfunc mmioStringToFOURCCW "mmioStringToFOURCCW" wstr, int

; int mmioWrite(winmdroot.Media.Multimedia.HMMIO hmmio, winmdroot.Foundation.PCSTR pch, int cch)
#cfunc mmioWrite "mmioWrite" intptr, str, int

; winmdroot.Foundation.BOOL sndPlaySoundW(winmdroot.Foundation.PCWSTR pszSound, uint fuSound)
#cfunc sndPlaySoundW "sndPlaySoundW" wstr, int

; uint timeKillEvent(uint uTimerID)
#cfunc timeKillEvent "timeKillEvent" int

; uint timeSetEvent(uint uDelay, uint uResolution, delegate *unmanaged[Stdcall]<uint,uint,nuint,nuint,nuint,void> fptc, nuint dwUser, uint fuEvent)
#cfunc timeSetEvent "timeSetEvent" int, int, int, int, int

; uint waveInClose(winmdroot.Media.Audio.HWAVEIN hwi)
#cfunc waveInClose "waveInClose" intptr

; uint waveInAddBuffer(winmdroot.Media.Audio.HWAVEIN hwi, winmdroot.Media.Audio.WAVEHDR* pwh, uint cbwh)
#cfunc waveInAddBuffer "waveInAddBuffer" intptr, var, int

; uint waveInGetDevCapsW(nuint uDeviceID, winmdroot.Media.Audio.WAVEINCAPSW* pwic, uint cbwic)
#cfunc waveInGetDevCapsW "waveInGetDevCapsW" int, var, int

; uint waveInGetErrorTextW(uint mmrError, winmdroot.Foundation.PWSTR pszText, uint cchText)
#cfunc waveInGetErrorTextW "waveInGetErrorTextW" int, wstr, int

; uint waveInGetID(winmdroot.Media.Audio.HWAVEIN hwi, uint* puDeviceID)
#cfunc waveInGetID "waveInGetID" intptr, var

; uint waveInGetNumDevs()
#cfunc waveInGetNumDevs "waveInGetNumDevs"

; uint waveInGetPosition(winmdroot.Media.Audio.HWAVEIN hwi, winmdroot.Media.MMTIME* pmmt, uint cbmmt)
#cfunc waveInGetPosition "waveInGetPosition" intptr, var, int

; uint waveInMessage(winmdroot.Media.Audio.HWAVEIN hwi, uint uMsg, nuint dw1, nuint dw2)
#cfunc waveInMessage "waveInMessage" intptr, int, int, int

; uint waveInOpen([Optional] winmdroot.Media.Audio.HWAVEIN* phwi, uint uDeviceID, winmdroot.Media.Audio.WAVEFORMATEX* pwfx, nuint dwCallback, nuint dwInstance, winmdroot.Media.Audio.MIDI_WAVE_OPEN_TYPE fdwOpen)
#cfunc waveInOpen "waveInOpen" intptr, int, var, int, int, int

; uint waveInPrepareHeader(winmdroot.Media.Audio.HWAVEIN hwi, winmdroot.Media.Audio.WAVEHDR* pwh, uint cbwh)
#cfunc waveInPrepareHeader "waveInPrepareHeader" intptr, var, int

; uint waveInReset(winmdroot.Media.Audio.HWAVEIN hwi)
#cfunc waveInReset "waveInReset" intptr

; uint waveInStart(winmdroot.Media.Audio.HWAVEIN hwi)
#cfunc waveInStart "waveInStart" intptr

; uint waveInStop(winmdroot.Media.Audio.HWAVEIN hwi)
#cfunc waveInStop "waveInStop" intptr

; uint waveInUnprepareHeader(winmdroot.Media.Audio.HWAVEIN hwi, winmdroot.Media.Audio.WAVEHDR* pwh, uint cbwh)
#cfunc waveInUnprepareHeader "waveInUnprepareHeader" intptr, var, int

; uint waveOutClose(winmdroot.Media.Audio.HWAVEOUT hwo)
#cfunc waveOutClose "waveOutClose" intptr

; uint waveOutBreakLoop(winmdroot.Media.Audio.HWAVEOUT hwo)
#cfunc waveOutBreakLoop "waveOutBreakLoop" intptr

; uint waveOutGetDevCapsW(nuint uDeviceID, winmdroot.Media.Audio.WAVEOUTCAPSW* pwoc, uint cbwoc)
#cfunc waveOutGetDevCapsW "waveOutGetDevCapsW" int, var, int

; uint waveOutGetErrorTextW(uint mmrError, winmdroot.Foundation.PWSTR pszText, uint cchText)
#cfunc waveOutGetErrorTextW "waveOutGetErrorTextW" int, wstr, int

; uint waveOutGetID(winmdroot.Media.Audio.HWAVEOUT hwo, uint* puDeviceID)
#cfunc waveOutGetID "waveOutGetID" intptr, var

; uint waveOutGetNumDevs()
#cfunc waveOutGetNumDevs "waveOutGetNumDevs"

; uint waveOutGetPitch(winmdroot.Media.Audio.HWAVEOUT hwo, uint* pdwPitch)
#cfunc waveOutGetPitch "waveOutGetPitch" intptr, var

; uint waveOutGetPlaybackRate(winmdroot.Media.Audio.HWAVEOUT hwo, uint* pdwRate)
#cfunc waveOutGetPlaybackRate "waveOutGetPlaybackRate" intptr, var

; uint waveOutGetPosition(winmdroot.Media.Audio.HWAVEOUT hwo, winmdroot.Media.MMTIME* pmmt, uint cbmmt)
#cfunc waveOutGetPosition "waveOutGetPosition" intptr, var, int

; uint waveOutGetVolume(winmdroot.Media.Audio.HWAVEOUT hwo, uint* pdwVolume)
#cfunc waveOutGetVolume "waveOutGetVolume" intptr, var

; uint waveOutMessage(winmdroot.Media.Audio.HWAVEOUT hwo, uint uMsg, nuint dw1, nuint dw2)
#cfunc waveOutMessage "waveOutMessage" intptr, int, int, int

; uint waveOutOpen([Optional] winmdroot.Media.Audio.HWAVEOUT* phwo, uint uDeviceID, winmdroot.Media.Audio.WAVEFORMATEX* pwfx, nuint dwCallback, nuint dwInstance, winmdroot.Media.Audio.MIDI_WAVE_OPEN_TYPE fdwOpen)
#cfunc waveOutOpen "waveOutOpen" intptr, int, var, int, int, int

; uint waveOutPause(winmdroot.Media.Audio.HWAVEOUT hwo)
#cfunc waveOutPause "waveOutPause" intptr

; uint waveOutPrepareHeader(winmdroot.Media.Audio.HWAVEOUT hwo, winmdroot.Media.Audio.WAVEHDR* pwh, uint cbwh)
#cfunc waveOutPrepareHeader "waveOutPrepareHeader" intptr, var, int

; uint waveOutReset(winmdroot.Media.Audio.HWAVEOUT hwo)
#cfunc waveOutReset "waveOutReset" intptr

; uint waveOutRestart(winmdroot.Media.Audio.HWAVEOUT hwo)
#cfunc waveOutRestart "waveOutRestart" intptr

; uint waveOutSetPitch(winmdroot.Media.Audio.HWAVEOUT hwo, uint dwPitch)
#cfunc waveOutSetPitch "waveOutSetPitch" intptr, int

; uint waveOutSetPlaybackRate(winmdroot.Media.Audio.HWAVEOUT hwo, uint dwRate)
#cfunc waveOutSetPlaybackRate "waveOutSetPlaybackRate" intptr, int

; uint waveOutSetVolume(winmdroot.Media.Audio.HWAVEOUT hwo, uint dwVolume)
#cfunc waveOutSetVolume "waveOutSetVolume" intptr, int

; uint waveOutUnprepareHeader(winmdroot.Media.Audio.HWAVEOUT hwo, winmdroot.Media.Audio.WAVEHDR* pwh, uint cbwh)
#cfunc waveOutUnprepareHeader "waveOutUnprepareHeader" intptr, var, int

; uint waveOutWrite(winmdroot.Media.Audio.HWAVEOUT hwo, winmdroot.Media.Audio.WAVEHDR* pwh, uint cbwh)
#cfunc waveOutWrite "waveOutWrite" intptr, var, int

#endif
