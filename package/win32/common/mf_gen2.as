; ============================================================
;   Auto-generated from CsWin32 / win32metadata
;   dll:    mf.dll
;   tool:   tools/cswin32_bridge/gen_from_cswin32.py
;   Do not edit by hand ? regenerate via the python script.
;   Needs hsp3net (intptr / NSTRUCT / wstr).
; ============================================================

#ifndef __mf_gen2_as__
#define global __mf_gen2_as__

; Shared NSTRUCT + #define constants for all win32 *_gen2.as
#include "win32_types_gen2.as"

;--- functions ---
#uselib "mf.dll"
; winmdroot.Foundation.HRESULT MFCreate3GPMediaSink(winmdroot.Media.MediaFoundation.IMFByteStream* pIByteStream, [Optional] winmdroot.Media.MediaFoundation.IMFMediaType* pVideoMediaType, [Optional] winmdroot.Media.MediaFoundation.IMFMediaType* pAudioMediaType, winmdroot.Media.MediaFoundation.IMFMediaSink** ppIMediaSink)
#cfunc global MFCreate3GPMediaSink "MFCreate3GPMediaSink" var, var, var, var

; winmdroot.Foundation.HRESULT MFCreateAC3MediaSink(winmdroot.Media.MediaFoundation.IMFByteStream* pTargetByteStream, winmdroot.Media.MediaFoundation.IMFMediaType* pAudioMediaType, winmdroot.Media.MediaFoundation.IMFMediaSink** ppMediaSink)
#cfunc global MFCreateAC3MediaSink "MFCreateAC3MediaSink" var, var, var

; winmdroot.Foundation.HRESULT MFCreateADTSMediaSink(winmdroot.Media.MediaFoundation.IMFByteStream* pTargetByteStream, winmdroot.Media.MediaFoundation.IMFMediaType* pAudioMediaType, winmdroot.Media.MediaFoundation.IMFMediaSink** ppMediaSink)
#cfunc global MFCreateADTSMediaSink "MFCreateADTSMediaSink" var, var, var

; winmdroot.Foundation.HRESULT MFCreateASFContentInfo(winmdroot.Media.MediaFoundation.IMFASFContentInfo** ppIContentInfo)
#cfunc global MFCreateASFContentInfo "MFCreateASFContentInfo" var

; winmdroot.Foundation.HRESULT MFCreateASFIndexer(winmdroot.Media.MediaFoundation.IMFASFIndexer** ppIIndexer)
#cfunc global MFCreateASFIndexer "MFCreateASFIndexer" var

; winmdroot.Foundation.HRESULT MFCreateASFIndexerByteStream(winmdroot.Media.MediaFoundation.IMFByteStream* pIContentByteStream, ulong cbIndexStartOffset, winmdroot.Media.MediaFoundation.IMFByteStream** pIIndexByteStream)
#cfunc global MFCreateASFIndexerByteStream "MFCreateASFIndexerByteStream" var, int64, var

; winmdroot.Foundation.HRESULT MFCreateASFMediaSink(winmdroot.Media.MediaFoundation.IMFByteStream* pIByteStream, winmdroot.Media.MediaFoundation.IMFMediaSink** ppIMediaSink)
#cfunc global MFCreateASFMediaSink "MFCreateASFMediaSink" var, var

; winmdroot.Foundation.HRESULT MFCreateASFMediaSinkActivate(winmdroot.Foundation.PCWSTR pwszFileName, winmdroot.Media.MediaFoundation.IMFASFContentInfo* pContentInfo, winmdroot.Media.MediaFoundation.IMFActivate** ppIActivate)
#cfunc global MFCreateASFMediaSinkActivate "MFCreateASFMediaSinkActivate" wstr, var, var

; winmdroot.Foundation.HRESULT MFCreateASFMultiplexer(winmdroot.Media.MediaFoundation.IMFASFMultiplexer** ppIMultiplexer)
#cfunc global MFCreateASFMultiplexer "MFCreateASFMultiplexer" var

; winmdroot.Foundation.HRESULT MFCreateASFProfile(winmdroot.Media.MediaFoundation.IMFASFProfile** ppIProfile)
#cfunc global MFCreateASFProfile "MFCreateASFProfile" var

; winmdroot.Foundation.HRESULT MFCreateASFProfileFromPresentationDescriptor(winmdroot.Media.MediaFoundation.IMFPresentationDescriptor* pIPD, winmdroot.Media.MediaFoundation.IMFASFProfile** ppIProfile)
#cfunc global MFCreateASFProfileFromPresentationDescriptor "MFCreateASFProfileFromPresentationDescriptor" var, var

; winmdroot.Foundation.HRESULT MFCreateASFSplitter(winmdroot.Media.MediaFoundation.IMFASFSplitter** ppISplitter)
#cfunc global MFCreateASFSplitter "MFCreateASFSplitter" var

; winmdroot.Foundation.HRESULT MFCreateASFStreamSelector(winmdroot.Media.MediaFoundation.IMFASFProfile* pIASFProfile, winmdroot.Media.MediaFoundation.IMFASFStreamSelector** ppSelector)
#cfunc global MFCreateASFStreamSelector "MFCreateASFStreamSelector" var, var

; winmdroot.Foundation.HRESULT MFCreateASFStreamingMediaSink(winmdroot.Media.MediaFoundation.IMFByteStream* pIByteStream, winmdroot.Media.MediaFoundation.IMFMediaSink** ppIMediaSink)
#cfunc global MFCreateASFStreamingMediaSink "MFCreateASFStreamingMediaSink" var, var

; winmdroot.Foundation.HRESULT MFCreateASFStreamingMediaSinkActivate(winmdroot.Media.MediaFoundation.IMFActivate* pByteStreamActivate, winmdroot.Media.MediaFoundation.IMFASFContentInfo* pContentInfo, winmdroot.Media.MediaFoundation.IMFActivate** ppIActivate)
#cfunc global MFCreateASFStreamingMediaSinkActivate "MFCreateASFStreamingMediaSinkActivate" var, var, var

; winmdroot.Foundation.HRESULT MFCreateCredentialCache(winmdroot.Media.MediaFoundation.IMFNetCredentialCache** ppCache)
#cfunc global MFCreateCredentialCache "MFCreateCredentialCache" var

; winmdroot.Foundation.HRESULT MFCreateFMPEG4MediaSink(winmdroot.Media.MediaFoundation.IMFByteStream* pIByteStream, [Optional] winmdroot.Media.MediaFoundation.IMFMediaType* pVideoMediaType, [Optional] winmdroot.Media.MediaFoundation.IMFMediaType* pAudioMediaType, winmdroot.Media.MediaFoundation.IMFMediaSink** ppIMediaSink)
#cfunc global MFCreateFMPEG4MediaSink "MFCreateFMPEG4MediaSink" var, var, var, var

; winmdroot.Foundation.HRESULT MFCreateMP3MediaSink(winmdroot.Media.MediaFoundation.IMFByteStream* pTargetByteStream, winmdroot.Media.MediaFoundation.IMFMediaSink** ppMediaSink)
#cfunc global MFCreateMP3MediaSink "MFCreateMP3MediaSink" var, var

; winmdroot.Foundation.HRESULT MFCreateMPEG4MediaSink(winmdroot.Media.MediaFoundation.IMFByteStream* pIByteStream, [Optional] winmdroot.Media.MediaFoundation.IMFMediaType* pVideoMediaType, [Optional] winmdroot.Media.MediaFoundation.IMFMediaType* pAudioMediaType, winmdroot.Media.MediaFoundation.IMFMediaSink** ppIMediaSink)
#cfunc global MFCreateMPEG4MediaSink "MFCreateMPEG4MediaSink" var, var, var, var

; winmdroot.Foundation.HRESULT MFCreateMuxSink(global::System.Guid guidOutputSubType, [Optional] winmdroot.Media.MediaFoundation.IMFAttributes* pOutputAttributes, [Optional] winmdroot.Media.MediaFoundation.IMFByteStream* pOutputByteStream, winmdroot.Media.MediaFoundation.IMFMediaSink** ppMuxSink)
#cfunc global MFCreateMuxSink "MFCreateMuxSink" int, var, var, var

; winmdroot.Foundation.HRESULT MFCreateNetSchemePlugin(global::System.Guid* riid, void** ppvHandler)
#cfunc global MFCreateNetSchemePlugin "MFCreateNetSchemePlugin" var, var

; winmdroot.Foundation.HRESULT MFCreatePresentationDescriptorFromASFProfile(winmdroot.Media.MediaFoundation.IMFASFProfile* pIProfile, winmdroot.Media.MediaFoundation.IMFPresentationDescriptor** ppIPD)
#cfunc global MFCreatePresentationDescriptorFromASFProfile "MFCreatePresentationDescriptorFromASFProfile" var, var

; winmdroot.Foundation.HRESULT MFCreateProtectedEnvironmentAccess(winmdroot.Media.MediaFoundation.IMFProtectedEnvironmentAccess** ppAccess)
#cfunc global MFCreateProtectedEnvironmentAccess "MFCreateProtectedEnvironmentAccess" var

; winmdroot.Foundation.HRESULT MFCreateProxyLocator(winmdroot.Foundation.PCWSTR pszProtocol, winmdroot.UI.Shell.PropertiesSystem.IPropertyStore* pProxyConfig, winmdroot.Media.MediaFoundation.IMFNetProxyLocator** ppProxyLocator)
#cfunc global MFCreateProxyLocator "MFCreateProxyLocator" wstr, var, var

; winmdroot.Foundation.HRESULT MFCreateRemoteDesktopPlugin(winmdroot.Media.MediaFoundation.IMFRemoteDesktopPlugin** ppPlugin)
#cfunc global MFCreateRemoteDesktopPlugin "MFCreateRemoteDesktopPlugin" var

; winmdroot.Foundation.HRESULT MFCreateVideoRenderer(global::System.Guid* riidRenderer, void** ppVideoRenderer)
#cfunc global MFCreateVideoRenderer "MFCreateVideoRenderer" var, var

; winmdroot.Foundation.HRESULT MFCreateVideoRendererActivate(winmdroot.Foundation.HWND hwndVideo, winmdroot.Media.MediaFoundation.IMFActivate** ppActivate)
#cfunc global MFCreateVideoRendererActivate "MFCreateVideoRendererActivate" intptr, var

; winmdroot.Foundation.HRESULT MFGetLocalId(byte* verifier, uint size, winmdroot.Foundation.PWSTR* id)
#cfunc global MFGetLocalId "MFGetLocalId" var, int, var

; winmdroot.Foundation.HRESULT MFGetSystemId(winmdroot.Media.MediaFoundation.IMFSystemId** ppId)
#cfunc global MFGetSystemId "MFGetSystemId" var

; winmdroot.Foundation.HRESULT MFLoadSignedLibrary(winmdroot.Foundation.PCWSTR pszName, winmdroot.Media.MediaFoundation.IMFSignedLibrary** ppLib)
#cfunc global MFLoadSignedLibrary "MFLoadSignedLibrary" wstr, var

; winmdroot.Foundation.HRESULT MFShutdownObject(winmdroot.System.Com.IUnknown* pUnk)
#cfunc global MFShutdownObject "MFShutdownObject" var

#endif
