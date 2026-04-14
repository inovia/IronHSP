; ============================================================
;   Auto-generated from CsWin32 / win32metadata
;   dll:    winmm.dll
;   tool:   tools/cswin32_bridge/gen_from_cswin32.py
;   Do not edit by hand ? regenerate via the python script.
;   Needs hsp3net (intptr / NSTRUCT / wstr).
; ============================================================

#ifndef __winmm_gen2_as__
#define global __winmm_gen2_as__

; Shared NSTRUCT + #define constants for all win32 *_gen2.as
#include "win32_types_gen2.as"

;--- functions ---
#uselib "winmm.dll"
; uint timeBeginPeriod(uint uPeriod)
#cfunc global timeBeginPeriod "timeBeginPeriod" int

; uint timeEndPeriod(uint uPeriod)
#cfunc global timeEndPeriod "timeEndPeriod" int

; uint timeGetDevCaps(winmdroot.Media.TIMECAPS* ptc, uint cbtc)
#cfunc global timeGetDevCaps "timeGetDevCaps" var, int

; uint timeGetSystemTime(winmdroot.Media.MMTIME* pmmt, uint cbmmt)
#cfunc global timeGetSystemTime "timeGetSystemTime" var, int

; uint timeGetTime()
#cfunc global timeGetTime "timeGetTime"

; winmdroot.Foundation.LRESULT CloseDriver(winmdroot.Media.Multimedia.HDRVR hDriver, winmdroot.Foundation.LPARAM lParam1, winmdroot.Foundation.LPARAM lParam2)
#cfunc global CloseDriver "CloseDriver" intptr, intptr, intptr

; winmdroot.Foundation.LRESULT DefDriverProc(nuint dwDriverIdentifier, winmdroot.Media.Multimedia.HDRVR hdrvr, uint uMsg, winmdroot.Foundation.LPARAM lParam1, winmdroot.Foundation.LPARAM lParam2)
#cfunc global DefDriverProc "DefDriverProc" int, intptr, int, intptr, intptr

; winmdroot.Foundation.BOOL DriverCallback(nuint dwCallback, uint dwFlags, winmdroot.Media.Multimedia.HDRVR hDevice, uint dwMsg, nuint dwUser, nuint dwParam1, nuint dwParam2)
#cfunc global DriverCallback "DriverCallback" int, int, intptr, int, int, int, int

; winmdroot.Foundation.HMODULE DrvGetModuleHandle(winmdroot.Media.Multimedia.HDRVR hDriver)
#cfunc global DrvGetModuleHandle "DrvGetModuleHandle" intptr

; winmdroot.Foundation.HMODULE GetDriverModuleHandle(winmdroot.Media.Multimedia.HDRVR hDriver)
#cfunc global GetDriverModuleHandle "GetDriverModuleHandle" intptr

; winmdroot.Media.Multimedia.HDRVR OpenDriver(winmdroot.Foundation.PCWSTR szDriverName, winmdroot.Foundation.PCWSTR szSectionName, winmdroot.Foundation.LPARAM lParam2)
#cfunc global OpenDriver "OpenDriver" wstr, wstr, intptr

; winmdroot.Foundation.BOOL PlaySoundW(winmdroot.Foundation.PCWSTR pszSound, winmdroot.Foundation.HMODULE hmod, winmdroot.Media.Audio.SND_FLAGS fdwSound)
#cfunc global PlaySoundW "PlaySoundW" wstr, intptr, int

; winmdroot.Foundation.LRESULT SendDriverMessage(winmdroot.Media.Multimedia.HDRVR hDriver, uint message, winmdroot.Foundation.LPARAM lParam1, winmdroot.Foundation.LPARAM lParam2)
#cfunc global SendDriverMessage "SendDriverMessage" intptr, int, intptr, intptr

; uint auxGetDevCapsW(nuint uDeviceID, winmdroot.Media.Audio.AUXCAPSW* pac, uint cbac)
#cfunc global auxGetDevCapsW "auxGetDevCapsW" int, var, int

; uint auxGetNumDevs()
#cfunc global auxGetNumDevs "auxGetNumDevs"

; uint auxGetVolume(uint uDeviceID, uint* pdwVolume)
#cfunc global auxGetVolume "auxGetVolume" int, var

; uint auxOutMessage(uint uDeviceID, uint uMsg, nuint dw1, nuint dw2)
#cfunc global auxOutMessage "auxOutMessage" int, int, int, int

; uint auxSetVolume(uint uDeviceID, uint dwVolume)
#cfunc global auxSetVolume "auxSetVolume" int, int

; uint joyConfigChanged(uint dwFlags)
#cfunc global joyConfigChanged "joyConfigChanged" int

; uint joyGetDevCapsW(nuint uJoyID, winmdroot.Media.Multimedia.JOYCAPSW* pjc, uint cbjc)
#cfunc global joyGetDevCapsW "joyGetDevCapsW" int, var, int

; uint joyGetNumDevs()
#cfunc global joyGetNumDevs "joyGetNumDevs"

; uint joyGetPos(uint uJoyID, winmdroot.Media.Multimedia.JOYINFO* pji)
#cfunc global joyGetPos "joyGetPos" int, var

; uint joyGetPosEx(uint uJoyID, winmdroot.Media.Multimedia.JOYINFOEX* pji)
#cfunc global joyGetPosEx "joyGetPosEx" int, var

; uint joyGetThreshold(uint uJoyID, uint* puThreshold)
#cfunc global joyGetThreshold "joyGetThreshold" int, var

; uint joyReleaseCapture(uint uJoyID)
#cfunc global joyReleaseCapture "joyReleaseCapture" int

; uint joySetCapture(winmdroot.Foundation.HWND hwnd, uint uJoyID, uint uPeriod, winmdroot.Foundation.BOOL fChanged)
#cfunc global joySetCapture "joySetCapture" intptr, int, int, int

; uint joySetThreshold(uint uJoyID, uint uThreshold)
#cfunc global joySetThreshold "joySetThreshold" int, int

; winmdroot.Foundation.BOOL mciDriverNotify(winmdroot.Foundation.HANDLE hwndCallback, uint wDeviceID, uint uStatus)
#cfunc global mciDriverNotify "mciDriverNotify" intptr, int, int

; uint mciDriverYield(uint wDeviceID)
#cfunc global mciDriverYield "mciDriverYield" int

; winmdroot.Foundation.BOOL mciFreeCommandResource(uint wTable)
#cfunc global mciFreeCommandResource "mciFreeCommandResource" int

; winmdroot.Media.HTASK mciGetCreatorTask(uint mciId)
#cfunc global mciGetCreatorTask "mciGetCreatorTask" int

; uint mciGetDeviceIDA(winmdroot.Foundation.PCSTR pszDevice)
#cfunc global mciGetDeviceIDA "mciGetDeviceIDA" str

; uint mciGetDeviceIDFromElementIDA(uint dwElementID, winmdroot.Foundation.PCSTR lpstrType)
#cfunc global mciGetDeviceIDFromElementIDA "mciGetDeviceIDFromElementIDA" int, str

; uint mciGetDeviceIDFromElementIDW(uint dwElementID, winmdroot.Foundation.PCWSTR lpstrType)
#cfunc global mciGetDeviceIDFromElementIDW "mciGetDeviceIDFromElementIDW" int, wstr

; uint mciGetDeviceIDW(winmdroot.Foundation.PCWSTR pszDevice)
#cfunc global mciGetDeviceIDW "mciGetDeviceIDW" wstr

; nuint mciGetDriverData(uint wDeviceID)
#cfunc global mciGetDriverData "mciGetDriverData" int

; winmdroot.Foundation.BOOL mciGetErrorStringW(uint mcierr, winmdroot.Foundation.PWSTR pszText, uint cchText)
#cfunc global mciGetErrorStringW "mciGetErrorStringW" int, wstr, int

; uint mciLoadCommandResource(winmdroot.Foundation.HANDLE hInstance, winmdroot.Foundation.PCWSTR lpResName, uint wType)
#cfunc global mciLoadCommandResource "mciLoadCommandResource" intptr, wstr, int

; uint mciSendCommandW(uint mciId, uint uMsg, nuint dwParam1, nuint dwParam2)
#cfunc global mciSendCommandW "mciSendCommandW" int, int, int, int

; uint mciSendStringW(winmdroot.Foundation.PCWSTR lpstrCommand, winmdroot.Foundation.PWSTR lpstrReturnString, uint uReturnLength, winmdroot.Foundation.HWND hwndCallback)
#cfunc global mciSendStringW "mciSendStringW" wstr, wstr, int, intptr

; winmdroot.Foundation.BOOL mciSetDriverData(uint wDeviceID, nuint dwData)
#cfunc global mciSetDriverData "mciSetDriverData" int, int

; winmdroot.Foundation.BOOL mciSetYieldProc(uint mciId, delegate *unmanaged[Stdcall]<uint,uint,uint> fpYieldProc, uint dwYieldData)
#cfunc global mciSetYieldProc "mciSetYieldProc" int, int, int

; uint midiOutClose(winmdroot.Media.Audio.HMIDIOUT hmo)
#cfunc global midiOutClose "midiOutClose" intptr

; uint midiConnect(winmdroot.Media.Audio.HMIDI hmi, winmdroot.Media.Audio.HMIDIOUT hmo, [Optional] void* pReserved)
#cfunc global midiConnect "midiConnect" intptr, intptr, intptr

; uint midiDisconnect(winmdroot.Media.Audio.HMIDI hmi, winmdroot.Media.Audio.HMIDIOUT hmo, [Optional] void* pReserved)
#cfunc global midiDisconnect "midiDisconnect" intptr, intptr, intptr

; uint midiInClose(winmdroot.Media.Audio.HMIDIIN hmi)
#cfunc global midiInClose "midiInClose" intptr

; uint midiInAddBuffer(winmdroot.Media.Audio.HMIDIIN hmi, winmdroot.Media.Audio.MIDIHDR* pmh, uint cbmh)
#cfunc global midiInAddBuffer "midiInAddBuffer" intptr, var, int

; uint midiInGetDevCapsW(nuint uDeviceID, winmdroot.Media.Audio.MIDIINCAPSW* pmic, uint cbmic)
#cfunc global midiInGetDevCapsW "midiInGetDevCapsW" int, var, int

; uint midiInGetErrorTextW(uint mmrError, winmdroot.Foundation.PWSTR pszText, uint cchText)
#cfunc global midiInGetErrorTextW "midiInGetErrorTextW" int, wstr, int

; uint midiInGetID(winmdroot.Media.Audio.HMIDIIN hmi, uint* puDeviceID)
#cfunc global midiInGetID "midiInGetID" intptr, var

; uint midiInGetNumDevs()
#cfunc global midiInGetNumDevs "midiInGetNumDevs"

; uint midiInMessage(winmdroot.Media.Audio.HMIDIIN hmi, uint uMsg, nuint dw1, nuint dw2)
#cfunc global midiInMessage "midiInMessage" intptr, int, int, int

; uint midiInOpen(winmdroot.Media.Audio.HMIDIIN* phmi, uint uDeviceID, nuint dwCallback, nuint dwInstance, winmdroot.Media.Audio.MIDI_WAVE_OPEN_TYPE fdwOpen)
#cfunc global midiInOpen "midiInOpen" intptr, int, int, int, int

; uint midiInPrepareHeader(winmdroot.Media.Audio.HMIDIIN hmi, winmdroot.Media.Audio.MIDIHDR* pmh, uint cbmh)
#cfunc global midiInPrepareHeader "midiInPrepareHeader" intptr, var, int

; uint midiInReset(winmdroot.Media.Audio.HMIDIIN hmi)
#cfunc global midiInReset "midiInReset" intptr

; uint midiInStart(winmdroot.Media.Audio.HMIDIIN hmi)
#cfunc global midiInStart "midiInStart" intptr

; uint midiInStop(winmdroot.Media.Audio.HMIDIIN hmi)
#cfunc global midiInStop "midiInStop" intptr

; uint midiInUnprepareHeader(winmdroot.Media.Audio.HMIDIIN hmi, winmdroot.Media.Audio.MIDIHDR* pmh, uint cbmh)
#cfunc global midiInUnprepareHeader "midiInUnprepareHeader" intptr, var, int

; uint midiOutCacheDrumPatches(winmdroot.Media.Audio.HMIDIOUT hmo, uint uPatch, ushort* pwkya, uint fuCache)
#cfunc global midiOutCacheDrumPatches "midiOutCacheDrumPatches" intptr, int, var, int

; uint midiOutCachePatches(winmdroot.Media.Audio.HMIDIOUT hmo, uint uBank, ushort* pwpa, uint fuCache)
#cfunc global midiOutCachePatches "midiOutCachePatches" intptr, int, var, int

; uint midiOutGetDevCapsW(nuint uDeviceID, winmdroot.Media.Audio.MIDIOUTCAPSW* pmoc, uint cbmoc)
#cfunc global midiOutGetDevCapsW "midiOutGetDevCapsW" int, var, int

; uint midiOutGetErrorTextW(uint mmrError, winmdroot.Foundation.PWSTR pszText, uint cchText)
#cfunc global midiOutGetErrorTextW "midiOutGetErrorTextW" int, wstr, int

; uint midiOutGetID(winmdroot.Media.Audio.HMIDIOUT hmo, uint* puDeviceID)
#cfunc global midiOutGetID "midiOutGetID" intptr, var

; uint midiOutGetNumDevs()
#cfunc global midiOutGetNumDevs "midiOutGetNumDevs"

; uint midiOutGetVolume(winmdroot.Media.Audio.HMIDIOUT hmo, uint* pdwVolume)
#cfunc global midiOutGetVolume "midiOutGetVolume" intptr, var

; uint midiOutLongMsg(winmdroot.Media.Audio.HMIDIOUT hmo, winmdroot.Media.Audio.MIDIHDR* pmh, uint cbmh)
#cfunc global midiOutLongMsg "midiOutLongMsg" intptr, var, int

; uint midiOutMessage(winmdroot.Media.Audio.HMIDIOUT hmo, uint uMsg, nuint dw1, nuint dw2)
#cfunc global midiOutMessage "midiOutMessage" intptr, int, int, int

; uint midiOutOpen(winmdroot.Media.Audio.HMIDIOUT* phmo, uint uDeviceID, nuint dwCallback, nuint dwInstance, winmdroot.Media.Audio.MIDI_WAVE_OPEN_TYPE fdwOpen)
#cfunc global midiOutOpen "midiOutOpen" intptr, int, int, int, int

; uint midiOutPrepareHeader(winmdroot.Media.Audio.HMIDIOUT hmo, winmdroot.Media.Audio.MIDIHDR* pmh, uint cbmh)
#cfunc global midiOutPrepareHeader "midiOutPrepareHeader" intptr, var, int

; uint midiOutReset(winmdroot.Media.Audio.HMIDIOUT hmo)
#cfunc global midiOutReset "midiOutReset" intptr

; uint midiOutSetVolume(winmdroot.Media.Audio.HMIDIOUT hmo, uint dwVolume)
#cfunc global midiOutSetVolume "midiOutSetVolume" intptr, int

; uint midiOutShortMsg(winmdroot.Media.Audio.HMIDIOUT hmo, uint dwMsg)
#cfunc global midiOutShortMsg "midiOutShortMsg" intptr, int

; uint midiOutUnprepareHeader(winmdroot.Media.Audio.HMIDIOUT hmo, winmdroot.Media.Audio.MIDIHDR* pmh, uint cbmh)
#cfunc global midiOutUnprepareHeader "midiOutUnprepareHeader" intptr, var, int

; uint midiStreamClose(winmdroot.Media.Audio.HMIDISTRM hms)
#cfunc global midiStreamClose "midiStreamClose" intptr

; uint midiStreamOpen(winmdroot.Media.Audio.HMIDISTRM* phms, uint* puDeviceID, uint cMidi, nuint dwCallback, nuint dwInstance, uint fdwOpen)
#cfunc global midiStreamOpen "midiStreamOpen" intptr, var, int, int, int, int

; uint midiStreamOut(winmdroot.Media.Audio.HMIDISTRM hms, winmdroot.Media.Audio.MIDIHDR* pmh, uint cbmh)
#cfunc global midiStreamOut "midiStreamOut" intptr, var, int

; uint midiStreamPause(winmdroot.Media.Audio.HMIDISTRM hms)
#cfunc global midiStreamPause "midiStreamPause" intptr

; uint midiStreamPosition(winmdroot.Media.Audio.HMIDISTRM hms, winmdroot.Media.MMTIME* lpmmt, uint cbmmt)
#cfunc global midiStreamPosition "midiStreamPosition" intptr, var, int

; uint midiStreamProperty(winmdroot.Media.Audio.HMIDISTRM hms, byte* lppropdata, uint dwProperty)
#cfunc global midiStreamProperty "midiStreamProperty" intptr, var, int

; uint midiStreamRestart(winmdroot.Media.Audio.HMIDISTRM hms)
#cfunc global midiStreamRestart "midiStreamRestart" intptr

; uint midiStreamStop(winmdroot.Media.Audio.HMIDISTRM hms)
#cfunc global midiStreamStop "midiStreamStop" intptr

; uint mixerClose(winmdroot.Media.Audio.HMIXER hmx)
#cfunc global mixerClose "mixerClose" intptr

; uint mixerGetControlDetailsW(winmdroot.Media.Audio.HMIXEROBJ hmxobj, winmdroot.Media.Audio.MIXERCONTROLDETAILS* pmxcd, uint fdwDetails)
#cfunc global mixerGetControlDetailsW "mixerGetControlDetailsW" intptr, var, int

; uint mixerGetDevCapsW(nuint uMxId, winmdroot.Media.Audio.MIXERCAPSW* pmxcaps, uint cbmxcaps)
#cfunc global mixerGetDevCapsW "mixerGetDevCapsW" int, var, int

; uint mixerGetID(winmdroot.Media.Audio.HMIXEROBJ hmxobj, uint* puMxId, uint fdwId)
#cfunc global mixerGetID "mixerGetID" intptr, var, int

; uint mixerGetLineControlsW(winmdroot.Media.Audio.HMIXEROBJ hmxobj, winmdroot.Media.Audio.MIXERLINECONTROLSW* pmxlc, uint fdwControls)
#cfunc global mixerGetLineControlsW "mixerGetLineControlsW" intptr, var, int

; uint mixerGetLineInfoW(winmdroot.Media.Audio.HMIXEROBJ hmxobj, winmdroot.Media.Audio.MIXERLINEW* pmxl, uint fdwInfo)
#cfunc global mixerGetLineInfoW "mixerGetLineInfoW" intptr, var, int

; uint mixerGetNumDevs()
#cfunc global mixerGetNumDevs "mixerGetNumDevs"

; uint mixerMessage(winmdroot.Media.Audio.HMIXER hmx, uint uMsg, nuint dwParam1, nuint dwParam2)
#cfunc global mixerMessage "mixerMessage" intptr, int, int, int

; uint mixerOpen([Optional] winmdroot.Media.Audio.HMIXER* phmx, uint uMxId, nuint dwCallback, nuint dwInstance, uint fdwOpen)
#cfunc global mixerOpen "mixerOpen" intptr, int, int, int, int

; uint mixerSetControlDetails(winmdroot.Media.Audio.HMIXEROBJ hmxobj, winmdroot.Media.Audio.MIXERCONTROLDETAILS* pmxcd, uint fdwDetails)
#cfunc global mixerSetControlDetails "mixerSetControlDetails" intptr, var, int

; uint mmioAdvance(winmdroot.Media.Multimedia.HMMIO hmmio, [Optional] winmdroot.Media.Multimedia.MMIOINFO* pmmioinfo, uint fuAdvance)
#cfunc global mmioAdvance "mmioAdvance" intptr, var, int

; uint mmioAscend(winmdroot.Media.Multimedia.HMMIO hmmio, winmdroot.Media.Multimedia.MMCKINFO* pmmcki, uint fuAscend)
#cfunc global mmioAscend "mmioAscend" intptr, var, int

; uint mmioClose(winmdroot.Media.Multimedia.HMMIO hmmio, uint fuClose)
#cfunc global mmioClose "mmioClose" intptr, int

; uint mmioCreateChunk(winmdroot.Media.Multimedia.HMMIO hmmio, winmdroot.Media.Multimedia.MMCKINFO* pmmcki, uint fuCreate)
#cfunc global mmioCreateChunk "mmioCreateChunk" intptr, var, int

; uint mmioDescend(winmdroot.Media.Multimedia.HMMIO hmmio, winmdroot.Media.Multimedia.MMCKINFO* pmmcki, [Optional] winmdroot.Media.Multimedia.MMCKINFO* pmmckiParent, uint fuDescend)
#cfunc global mmioDescend "mmioDescend" intptr, var, var, int

; uint mmioFlush(winmdroot.Media.Multimedia.HMMIO hmmio, uint fuFlush)
#cfunc global mmioFlush "mmioFlush" intptr, int

; uint mmioGetInfo(winmdroot.Media.Multimedia.HMMIO hmmio, winmdroot.Media.Multimedia.MMIOINFO* pmmioinfo, uint fuInfo)
#cfunc global mmioGetInfo "mmioGetInfo" intptr, var, int

; winmdroot.Media.Multimedia.HMMIO mmioOpenW(winmdroot.Foundation.PWSTR pszFileName, [Optional] winmdroot.Media.Multimedia.MMIOINFO* pmmioinfo, uint fdwOpen)
#cfunc global mmioOpenW "mmioOpenW" wstr, var, int

; int mmioRead(winmdroot.Media.Multimedia.HMMIO hmmio, sbyte* pch, int cch)
#cfunc global mmioRead "mmioRead" intptr, var, int

; uint mmioRenameW(winmdroot.Foundation.PCWSTR pszFileName, winmdroot.Foundation.PCWSTR pszNewFileName, [Optional] winmdroot.Media.Multimedia.MMIOINFO* pmmioinfo, uint fdwRename)
#cfunc global mmioRenameW "mmioRenameW" wstr, wstr, var, int

; int mmioSeek(winmdroot.Media.Multimedia.HMMIO hmmio, int lOffset, int iOrigin)
#cfunc global mmioSeek "mmioSeek" intptr, int, int

; winmdroot.Foundation.LRESULT mmioSendMessage(winmdroot.Media.Multimedia.HMMIO hmmio, uint uMsg, winmdroot.Foundation.LPARAM lParam1, winmdroot.Foundation.LPARAM lParam2)
#cfunc global mmioSendMessage "mmioSendMessage" intptr, int, intptr, intptr

; uint mmioSetBuffer(winmdroot.Media.Multimedia.HMMIO hmmio, winmdroot.Foundation.PSTR pchBuffer, int cchBuffer, uint fuBuffer)
#cfunc global mmioSetBuffer "mmioSetBuffer" intptr, str, int, int

; uint mmioSetInfo(winmdroot.Media.Multimedia.HMMIO hmmio, winmdroot.Media.Multimedia.MMIOINFO* pmmioinfo, uint fuInfo)
#cfunc global mmioSetInfo "mmioSetInfo" intptr, var, int

; uint mmioStringToFOURCCA(winmdroot.Foundation.PCSTR sz, uint uFlags)
#cfunc global mmioStringToFOURCCA "mmioStringToFOURCCA" str, int

; uint mmioStringToFOURCCW(winmdroot.Foundation.PCWSTR sz, uint uFlags)
#cfunc global mmioStringToFOURCCW "mmioStringToFOURCCW" wstr, int

; int mmioWrite(winmdroot.Media.Multimedia.HMMIO hmmio, winmdroot.Foundation.PCSTR pch, int cch)
#cfunc global mmioWrite "mmioWrite" intptr, str, int

; winmdroot.Foundation.BOOL sndPlaySoundW(winmdroot.Foundation.PCWSTR pszSound, uint fuSound)
#cfunc global sndPlaySoundW "sndPlaySoundW" wstr, int

; uint timeKillEvent(uint uTimerID)
#cfunc global timeKillEvent "timeKillEvent" int

; uint timeSetEvent(uint uDelay, uint uResolution, delegate *unmanaged[Stdcall]<uint,uint,nuint,nuint,nuint,void> fptc, nuint dwUser, uint fuEvent)
#cfunc global timeSetEvent "timeSetEvent" int, int, int, int, int

; uint waveInClose(winmdroot.Media.Audio.HWAVEIN hwi)
#cfunc global waveInClose "waveInClose" intptr

; uint waveInAddBuffer(winmdroot.Media.Audio.HWAVEIN hwi, winmdroot.Media.Audio.WAVEHDR* pwh, uint cbwh)
#cfunc global waveInAddBuffer "waveInAddBuffer" intptr, var, int

; uint waveInGetDevCapsW(nuint uDeviceID, winmdroot.Media.Audio.WAVEINCAPSW* pwic, uint cbwic)
#cfunc global waveInGetDevCapsW "waveInGetDevCapsW" int, var, int

; uint waveInGetErrorTextW(uint mmrError, winmdroot.Foundation.PWSTR pszText, uint cchText)
#cfunc global waveInGetErrorTextW "waveInGetErrorTextW" int, wstr, int

; uint waveInGetID(winmdroot.Media.Audio.HWAVEIN hwi, uint* puDeviceID)
#cfunc global waveInGetID "waveInGetID" intptr, var

; uint waveInGetNumDevs()
#cfunc global waveInGetNumDevs "waveInGetNumDevs"

; uint waveInGetPosition(winmdroot.Media.Audio.HWAVEIN hwi, winmdroot.Media.MMTIME* pmmt, uint cbmmt)
#cfunc global waveInGetPosition "waveInGetPosition" intptr, var, int

; uint waveInMessage(winmdroot.Media.Audio.HWAVEIN hwi, uint uMsg, nuint dw1, nuint dw2)
#cfunc global waveInMessage "waveInMessage" intptr, int, int, int

; uint waveInOpen([Optional] winmdroot.Media.Audio.HWAVEIN* phwi, uint uDeviceID, winmdroot.Media.Audio.WAVEFORMATEX* pwfx, nuint dwCallback, nuint dwInstance, winmdroot.Media.Audio.MIDI_WAVE_OPEN_TYPE fdwOpen)
#cfunc global waveInOpen "waveInOpen" intptr, int, var, int, int, int

; uint waveInPrepareHeader(winmdroot.Media.Audio.HWAVEIN hwi, winmdroot.Media.Audio.WAVEHDR* pwh, uint cbwh)
#cfunc global waveInPrepareHeader "waveInPrepareHeader" intptr, var, int

; uint waveInReset(winmdroot.Media.Audio.HWAVEIN hwi)
#cfunc global waveInReset "waveInReset" intptr

; uint waveInStart(winmdroot.Media.Audio.HWAVEIN hwi)
#cfunc global waveInStart "waveInStart" intptr

; uint waveInStop(winmdroot.Media.Audio.HWAVEIN hwi)
#cfunc global waveInStop "waveInStop" intptr

; uint waveInUnprepareHeader(winmdroot.Media.Audio.HWAVEIN hwi, winmdroot.Media.Audio.WAVEHDR* pwh, uint cbwh)
#cfunc global waveInUnprepareHeader "waveInUnprepareHeader" intptr, var, int

; uint waveOutClose(winmdroot.Media.Audio.HWAVEOUT hwo)
#cfunc global waveOutClose "waveOutClose" intptr

; uint waveOutBreakLoop(winmdroot.Media.Audio.HWAVEOUT hwo)
#cfunc global waveOutBreakLoop "waveOutBreakLoop" intptr

; uint waveOutGetDevCapsW(nuint uDeviceID, winmdroot.Media.Audio.WAVEOUTCAPSW* pwoc, uint cbwoc)
#cfunc global waveOutGetDevCapsW "waveOutGetDevCapsW" int, var, int

; uint waveOutGetErrorTextW(uint mmrError, winmdroot.Foundation.PWSTR pszText, uint cchText)
#cfunc global waveOutGetErrorTextW "waveOutGetErrorTextW" int, wstr, int

; uint waveOutGetID(winmdroot.Media.Audio.HWAVEOUT hwo, uint* puDeviceID)
#cfunc global waveOutGetID "waveOutGetID" intptr, var

; uint waveOutGetNumDevs()
#cfunc global waveOutGetNumDevs "waveOutGetNumDevs"

; uint waveOutGetPitch(winmdroot.Media.Audio.HWAVEOUT hwo, uint* pdwPitch)
#cfunc global waveOutGetPitch "waveOutGetPitch" intptr, var

; uint waveOutGetPlaybackRate(winmdroot.Media.Audio.HWAVEOUT hwo, uint* pdwRate)
#cfunc global waveOutGetPlaybackRate "waveOutGetPlaybackRate" intptr, var

; uint waveOutGetPosition(winmdroot.Media.Audio.HWAVEOUT hwo, winmdroot.Media.MMTIME* pmmt, uint cbmmt)
#cfunc global waveOutGetPosition "waveOutGetPosition" intptr, var, int

; uint waveOutGetVolume(winmdroot.Media.Audio.HWAVEOUT hwo, uint* pdwVolume)
#cfunc global waveOutGetVolume "waveOutGetVolume" intptr, var

; uint waveOutMessage(winmdroot.Media.Audio.HWAVEOUT hwo, uint uMsg, nuint dw1, nuint dw2)
#cfunc global waveOutMessage "waveOutMessage" intptr, int, int, int

; uint waveOutOpen([Optional] winmdroot.Media.Audio.HWAVEOUT* phwo, uint uDeviceID, winmdroot.Media.Audio.WAVEFORMATEX* pwfx, nuint dwCallback, nuint dwInstance, winmdroot.Media.Audio.MIDI_WAVE_OPEN_TYPE fdwOpen)
#cfunc global waveOutOpen "waveOutOpen" intptr, int, var, int, int, int

; uint waveOutPause(winmdroot.Media.Audio.HWAVEOUT hwo)
#cfunc global waveOutPause "waveOutPause" intptr

; uint waveOutPrepareHeader(winmdroot.Media.Audio.HWAVEOUT hwo, winmdroot.Media.Audio.WAVEHDR* pwh, uint cbwh)
#cfunc global waveOutPrepareHeader "waveOutPrepareHeader" intptr, var, int

; uint waveOutReset(winmdroot.Media.Audio.HWAVEOUT hwo)
#cfunc global waveOutReset "waveOutReset" intptr

; uint waveOutRestart(winmdroot.Media.Audio.HWAVEOUT hwo)
#cfunc global waveOutRestart "waveOutRestart" intptr

; uint waveOutSetPitch(winmdroot.Media.Audio.HWAVEOUT hwo, uint dwPitch)
#cfunc global waveOutSetPitch "waveOutSetPitch" intptr, int

; uint waveOutSetPlaybackRate(winmdroot.Media.Audio.HWAVEOUT hwo, uint dwRate)
#cfunc global waveOutSetPlaybackRate "waveOutSetPlaybackRate" intptr, int

; uint waveOutSetVolume(winmdroot.Media.Audio.HWAVEOUT hwo, uint dwVolume)
#cfunc global waveOutSetVolume "waveOutSetVolume" intptr, int

; uint waveOutUnprepareHeader(winmdroot.Media.Audio.HWAVEOUT hwo, winmdroot.Media.Audio.WAVEHDR* pwh, uint cbwh)
#cfunc global waveOutUnprepareHeader "waveOutUnprepareHeader" intptr, var, int

; uint waveOutWrite(winmdroot.Media.Audio.HWAVEOUT hwo, winmdroot.Media.Audio.WAVEHDR* pwh, uint cbwh)
#cfunc global waveOutWrite "waveOutWrite" intptr, var, int

#endif
