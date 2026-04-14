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
; winmdroot.Foundation.BOOL PlaySoundW(winmdroot.Foundation.PCWSTR pszSound, winmdroot.Foundation.HMODULE hmod, winmdroot.Media.Audio.SND_FLAGS fdwSound)
#cfunc PlaySoundW "PlaySoundW" wstr, intptr, int

; uint mciSendStringW(winmdroot.Foundation.PCWSTR lpstrCommand, winmdroot.Foundation.PWSTR lpstrReturnString, uint uReturnLength, winmdroot.Foundation.HWND hwndCallback)
#cfunc mciSendStringW "mciSendStringW" wstr, wstr, int, intptr

; winmdroot.Foundation.BOOL mciGetErrorStringW(uint mcierr, winmdroot.Foundation.PWSTR pszText, uint cchText)
#cfunc mciGetErrorStringW "mciGetErrorStringW" int, wstr, int

; uint timeBeginPeriod(uint uPeriod)
#cfunc timeBeginPeriod "timeBeginPeriod" int

; uint timeEndPeriod(uint uPeriod)
#cfunc timeEndPeriod "timeEndPeriod" int

; uint timeGetTime()
#cfunc timeGetTime "timeGetTime"

; uint timeKillEvent(uint uTimerID)
#cfunc timeKillEvent "timeKillEvent" int

; uint timeSetEvent(uint uDelay, uint uResolution, delegate *unmanaged[Stdcall]<uint,uint,nuint,nuint,nuint,void> fptc, nuint dwUser, uint fuEvent)
#cfunc timeSetEvent "timeSetEvent" int, int, int, int, int

; uint waveInClose(winmdroot.Media.Audio.HWAVEIN hwi)
#cfunc waveInClose "waveInClose" intptr

; uint waveInOpen([Optional] winmdroot.Media.Audio.HWAVEIN* phwi, uint uDeviceID, winmdroot.Media.Audio.WAVEFORMATEX* pwfx, nuint dwCallback, nuint dwInstance, winmdroot.Media.Audio.MIDI_WAVE_OPEN_TYPE fdwOpen)
#cfunc waveInOpen "waveInOpen" intptr, int, var, int, int, int

; uint waveInStart(winmdroot.Media.Audio.HWAVEIN hwi)
#cfunc waveInStart "waveInStart" intptr

; uint waveInStop(winmdroot.Media.Audio.HWAVEIN hwi)
#cfunc waveInStop "waveInStop" intptr

; uint waveOutClose(winmdroot.Media.Audio.HWAVEOUT hwo)
#cfunc waveOutClose "waveOutClose" intptr

; uint waveOutOpen([Optional] winmdroot.Media.Audio.HWAVEOUT* phwo, uint uDeviceID, winmdroot.Media.Audio.WAVEFORMATEX* pwfx, nuint dwCallback, nuint dwInstance, winmdroot.Media.Audio.MIDI_WAVE_OPEN_TYPE fdwOpen)
#cfunc waveOutOpen "waveOutOpen" intptr, int, var, int, int, int

; uint waveOutReset(winmdroot.Media.Audio.HWAVEOUT hwo)
#cfunc waveOutReset "waveOutReset" intptr

; uint waveOutWrite(winmdroot.Media.Audio.HWAVEOUT hwo, winmdroot.Media.Audio.WAVEHDR* pwh, uint cbwh)
#cfunc waveOutWrite "waveOutWrite" intptr, var, int

#endif
