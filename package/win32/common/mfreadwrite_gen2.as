; ============================================================
;   Auto-generated from CsWin32 / win32metadata
;   dll:    mfreadwrite.dll
;   tool:   tools/cswin32_bridge/gen_from_cswin32.py
;   Do not edit by hand ? regenerate via the python script.
;   Needs hsp3net (intptr / NSTRUCT / wstr).
; ============================================================

#ifndef __mfreadwrite_gen2_as__
#define global __mfreadwrite_gen2_as__

; Shared NSTRUCT + #define constants for all win32 *_gen2.as
#include "win32_types_gen2.as"

;--- functions ---
#uselib "mfreadwrite.dll"
; winmdroot.Foundation.HRESULT MFCreateSinkWriterFromMediaSink(winmdroot.Media.MediaFoundation.IMFMediaSink* pMediaSink, [Optional] winmdroot.Media.MediaFoundation.IMFAttributes* pAttributes, winmdroot.Media.MediaFoundation.IMFSinkWriter** ppSinkWriter)
#cfunc global MFCreateSinkWriterFromMediaSink "MFCreateSinkWriterFromMediaSink" var, var, var

; winmdroot.Foundation.HRESULT MFCreateSinkWriterFromURL(winmdroot.Foundation.PCWSTR pwszOutputURL, [Optional] winmdroot.Media.MediaFoundation.IMFByteStream* pByteStream, [Optional] winmdroot.Media.MediaFoundation.IMFAttributes* pAttributes, winmdroot.Media.MediaFoundation.IMFSinkWriter** ppSinkWriter)
#cfunc global MFCreateSinkWriterFromURL "MFCreateSinkWriterFromURL" wstr, var, var, var

; winmdroot.Foundation.HRESULT MFCreateSourceReaderFromByteStream(winmdroot.Media.MediaFoundation.IMFByteStream* pByteStream, [Optional] winmdroot.Media.MediaFoundation.IMFAttributes* pAttributes, winmdroot.Media.MediaFoundation.IMFSourceReader** ppSourceReader)
#cfunc global MFCreateSourceReaderFromByteStream "MFCreateSourceReaderFromByteStream" var, var, var

; winmdroot.Foundation.HRESULT MFCreateSourceReaderFromMediaSource(winmdroot.Media.MediaFoundation.IMFMediaSource* pMediaSource, [Optional] winmdroot.Media.MediaFoundation.IMFAttributes* pAttributes, winmdroot.Media.MediaFoundation.IMFSourceReader** ppSourceReader)
#cfunc global MFCreateSourceReaderFromMediaSource "MFCreateSourceReaderFromMediaSource" var, var, var

; winmdroot.Foundation.HRESULT MFCreateSourceReaderFromURL(winmdroot.Foundation.PCWSTR pwszURL, [Optional] winmdroot.Media.MediaFoundation.IMFAttributes* pAttributes, winmdroot.Media.MediaFoundation.IMFSourceReader** ppSourceReader)
#cfunc global MFCreateSourceReaderFromURL "MFCreateSourceReaderFromURL" wstr, var, var

#endif
