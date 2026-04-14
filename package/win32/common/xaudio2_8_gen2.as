; ============================================================
;   Auto-generated from CsWin32 / win32metadata
;   dll:    xaudio2_8.dll
;   tool:   tools/cswin32_bridge/gen_from_cswin32.py
;   Do not edit by hand ? regenerate via the python script.
;   Needs hsp3net (intptr / NSTRUCT / wstr).
; ============================================================

#ifndef __xaudio2_8_gen2_as__
#define global __xaudio2_8_gen2_as__

; Shared NSTRUCT + #define constants for all win32 *_gen2.as
#include "win32_types_gen2.as"

;--- functions ---
#uselib "xaudio2_8.dll"
; winmdroot.Foundation.HRESULT CreateAudioReverb(winmdroot.System.Com.IUnknown** ppApo)
#cfunc global CreateAudioReverb "CreateAudioReverb" var

; winmdroot.Foundation.HRESULT CreateAudioVolumeMeter(winmdroot.System.Com.IUnknown** ppApo)
#cfunc global CreateAudioVolumeMeter "CreateAudioVolumeMeter" var

; winmdroot.Foundation.HRESULT CreateFX(global::System.Guid* clsid, winmdroot.System.Com.IUnknown** pEffect, [Optional] void* pInitDat, uint InitDataByteSize)
#cfunc global CreateFX "CreateFX" var, var, intptr, int

; winmdroot.Foundation.HRESULT XAudio2CreateWithVersionInfo(winmdroot.Media.Audio.XAudio2.IXAudio2** ppXAudio2, uint Flags, uint XAudio2Processor, uint ntddiVersion)
#cfunc global XAudio2CreateWithVersionInfo "XAudio2CreateWithVersionInfo" var, int, int, int

#endif
