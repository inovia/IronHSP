; ============================================================
;   Auto-generated from CsWin32 / win32metadata
;   dll:    evr.dll
;   tool:   tools/cswin32_bridge/gen_from_cswin32.py
;   Do not edit by hand ? regenerate via the python script.
;   Needs hsp3net (intptr / NSTRUCT / wstr).
; ============================================================

#ifndef __evr_gen2_as__
#define global __evr_gen2_as__

; Shared NSTRUCT + #define constants for all win32 *_gen2.as
#include "win32_types_gen2.as"

;--- functions ---
#uselib "evr.dll"
; winmdroot.Foundation.HRESULT MFGetPlaneSize(uint format, uint dwWidth, uint dwHeight, uint* pdwPlaneSize)
#cfunc global MFGetPlaneSize "MFGetPlaneSize" int, int, int, var

; winmdroot.Foundation.HRESULT MFCreateVideoMixer([Optional] winmdroot.System.Com.IUnknown* pOwner, global::System.Guid* riidDevice, global::System.Guid* riid, void** ppv)
#cfunc global MFCreateVideoMixer "MFCreateVideoMixer" var, var, var, var

; winmdroot.Foundation.HRESULT MFCreateVideoMixerAndPresenter([Optional] winmdroot.System.Com.IUnknown* pMixerOwner, [Optional] winmdroot.System.Com.IUnknown* pPresenterOwner, global::System.Guid* riidMixer, void** ppvVideoMixer, global::System.Guid* riidPresenter, void** ppvVideoPresenter)
#cfunc global MFCreateVideoMixerAndPresenter "MFCreateVideoMixerAndPresenter" var, var, var, var, var, var

; winmdroot.Foundation.HRESULT MFCreateVideoPresenter([Optional] winmdroot.System.Com.IUnknown* pOwner, global::System.Guid* riidDevice, global::System.Guid* riid, void** ppVideoPresenter)
#cfunc global MFCreateVideoPresenter "MFCreateVideoPresenter" var, var, var, var

; winmdroot.Foundation.HRESULT MFCreateVideoSampleAllocator(global::System.Guid* riid, void** ppSampleAllocator)
#cfunc global MFCreateVideoSampleAllocator "MFCreateVideoSampleAllocator" var, var

; winmdroot.Foundation.HRESULT MFCreateVideoSampleFromSurface(winmdroot.System.Com.IUnknown* pUnkSurface, winmdroot.Media.MediaFoundation.IMFSample** ppSample)
#cfunc global MFCreateVideoSampleFromSurface "MFCreateVideoSampleFromSurface" var, var

; winmdroot.Foundation.BOOL MFIsFormatYUV(uint Format)
#cfunc global MFIsFormatYUV "MFIsFormatYUV" int

#endif
