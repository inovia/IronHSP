; ============================================================
;   Auto-generated from CsWin32 / win32metadata
;   dll:    mfplat.dll
;   tool:   tools/cswin32_bridge/gen_from_cswin32.py
;   Do not edit by hand ? regenerate via the python script.
;   Needs hsp3net (intptr / NSTRUCT / wstr).
; ============================================================

#ifndef __mfplat_gen2_as__
#define global __mfplat_gen2_as__

; Shared NSTRUCT + #define constants for all win32 *_gen2.as
#include "win32_types_gen2.as"

;--- functions ---
#uselib "mfplat.dll"
; winmdroot.Foundation.HRESULT MFCreateSourceResolver(winmdroot.Media.MediaFoundation.IMFSourceResolver** ppISourceResolver)
#cfunc global MFCreateSourceResolver "MFCreateSourceResolver" var

; winmdroot.Foundation.HRESULT MFGetSupportedMimeTypes(winmdroot.System.Com.StructuredStorage.PROPVARIANT* pPropVarMimeTypeArray)
#cfunc global MFGetSupportedMimeTypes "MFGetSupportedMimeTypes" var

; winmdroot.Foundation.HRESULT MFGetSupportedSchemes(winmdroot.System.Com.StructuredStorage.PROPVARIANT* pPropVarSchemeArray)
#cfunc global MFGetSupportedSchemes "MFGetSupportedSchemes" var

; winmdroot.Foundation.HRESULT CreatePropertyStore(winmdroot.UI.Shell.PropertiesSystem.IPropertyStore** ppStore)
#cfunc global CreatePropertyStore "CreatePropertyStore" var

; winmdroot.Foundation.HRESULT MFAllocateWorkQueue(uint* pdwWorkQueue)
#cfunc global MFAllocateWorkQueue "MFAllocateWorkQueue" var

; winmdroot.Foundation.HRESULT MFAverageTimePerFrameToFrameRate(ulong unAverageTimePerFrame, uint* punNumerator, uint* punDenominator)
#cfunc global MFAverageTimePerFrameToFrameRate "MFAverageTimePerFrameToFrameRate" int64, var, var

; winmdroot.Foundation.HRESULT MFBeginCreateFile(winmdroot.Media.MediaFoundation.MF_FILE_ACCESSMODE AccessMode, winmdroot.Media.MediaFoundation.MF_FILE_OPENMODE OpenMode, winmdroot.Media.MediaFoundation.MF_FILE_FLAGS fFlags, winmdroot.Foundation.PCWSTR pwszFilePath, winmdroot.Media.MediaFoundation.IMFAsyncCallback* pCallback, winmdroot.System.Com.IUnknown* pState, winmdroot.System.Com.IUnknown** ppCancelCookie)
#cfunc global MFBeginCreateFile "MFBeginCreateFile" int, int, int, wstr, var, var, var

; winmdroot.Foundation.HRESULT MFBeginRegisterWorkQueueWithMMCSS(uint dwWorkQueueId, winmdroot.Foundation.PCWSTR wszClass, uint dwTaskId, winmdroot.Media.MediaFoundation.IMFAsyncCallback* pDoneCallback, winmdroot.System.Com.IUnknown* pDoneState)
#cfunc global MFBeginRegisterWorkQueueWithMMCSS "MFBeginRegisterWorkQueueWithMMCSS" int, wstr, int, var, var

; winmdroot.Foundation.HRESULT MFCalculateBitmapImageSize(winmdroot.Graphics.Gdi.BITMAPINFOHEADER* pBMIH, uint cbBufSize, uint* pcbImageSize, [Optional] winmdroot.Foundation.BOOL* pbKnown)
#cfunc global MFCalculateBitmapImageSize "MFCalculateBitmapImageSize" var, int, var, var

; winmdroot.Foundation.HRESULT MFCalculateImageSize(global::System.Guid* guidSubtype, uint unWidth, uint unHeight, uint* pcbImageSize)
#cfunc global MFCalculateImageSize "MFCalculateImageSize" var, int, int, var

; winmdroot.Foundation.HRESULT MFCancelCreateFile(winmdroot.System.Com.IUnknown* pCancelCookie)
#cfunc global MFCancelCreateFile "MFCancelCreateFile" var

; winmdroot.Foundation.HRESULT MFCombineSamples(winmdroot.Media.MediaFoundation.IMFSample* pSample, winmdroot.Media.MediaFoundation.IMFSample* pSampleToAdd, uint dwMaxMergedDurationInMS, winmdroot.Foundation.BOOL* pMerged)
#cfunc global MFCombineSamples "MFCombineSamples" var, var, int, var

; winmdroot.Foundation.BOOL MFCompareFullToPartialMediaType(winmdroot.Media.MediaFoundation.IMFMediaType* pMFTypeFull, winmdroot.Media.MediaFoundation.IMFMediaType* pMFTypePartial)
#cfunc global MFCompareFullToPartialMediaType "MFCompareFullToPartialMediaType" var, var

; winmdroot.Foundation.HRESULT MFConvertColorInfoFromDXVA(winmdroot.Media.MediaFoundation.MFVIDEOFORMAT* pToFormat, uint dwFromDXVA)
#cfunc global MFConvertColorInfoFromDXVA "MFConvertColorInfoFromDXVA" var, int

; winmdroot.Foundation.HRESULT MFConvertColorInfoToDXVA(uint* pdwToDXVA, winmdroot.Media.MediaFoundation.MFVIDEOFORMAT* pFromFormat)
#cfunc global MFConvertColorInfoToDXVA "MFConvertColorInfoToDXVA" var, var

; winmdroot.Foundation.HRESULT MFConvertFromFP16Array(float* pDest, ushort* pSrc, uint dwCount)
#cfunc global MFConvertFromFP16Array "MFConvertFromFP16Array" var, var, int

; winmdroot.Foundation.HRESULT MFConvertToFP16Array(ushort* pDest, float* pSrc, uint dwCount)
#cfunc global MFConvertToFP16Array "MFConvertToFP16Array" var, var, int

; winmdroot.Foundation.HRESULT MFCopyImage(byte* pDest, int lDestStride, byte* pSrc, int lSrcStride, uint dwWidthInBytes, uint dwLines)
#cfunc global MFCopyImage "MFCopyImage" var, int, var, int, int, int

; winmdroot.Foundation.HRESULT MFCreate2DMediaBuffer(uint dwWidth, uint dwHeight, uint dwFourCC, winmdroot.Foundation.BOOL fBottomUp, winmdroot.Media.MediaFoundation.IMFMediaBuffer** ppBuffer)
#cfunc global MFCreate2DMediaBuffer "MFCreate2DMediaBuffer" int, int, int, int, var

; winmdroot.Foundation.HRESULT MFCreateAMMediaTypeFromMFMediaType(winmdroot.Media.MediaFoundation.IMFMediaType* pMFType, global::System.Guid guidFormatBlockType, winmdroot.Media.MediaFoundation.AM_MEDIA_TYPE** ppAMType)
#cfunc global MFCreateAMMediaTypeFromMFMediaType "MFCreateAMMediaTypeFromMFMediaType" var, int, var

; winmdroot.Foundation.HRESULT MFCreateAlignedMemoryBuffer(uint cbMaxLength, uint cbAligment, winmdroot.Media.MediaFoundation.IMFMediaBuffer** ppBuffer)
#cfunc global MFCreateAlignedMemoryBuffer "MFCreateAlignedMemoryBuffer" int, int, var

; winmdroot.Foundation.HRESULT MFCreateAttributes(winmdroot.Media.MediaFoundation.IMFAttributes** ppMFAttributes, uint cInitialSize)
#cfunc global MFCreateAttributes "MFCreateAttributes" var, int

; winmdroot.Foundation.HRESULT MFCreateAudioMediaType(winmdroot.Media.Audio.WAVEFORMATEX* pAudioFormat, winmdroot.Media.MediaFoundation.IMFAudioMediaType** ppIAudioMediaType)
#cfunc global MFCreateAudioMediaType "MFCreateAudioMediaType" var, var

; winmdroot.Foundation.HRESULT MFCreateCollection(winmdroot.Media.MediaFoundation.IMFCollection** ppIMFCollection)
#cfunc global MFCreateCollection "MFCreateCollection" var

; winmdroot.Foundation.HRESULT MFCreateContentDecryptorContext(global::System.Guid* guidMediaProtectionSystemId, [Optional] winmdroot.Media.MediaFoundation.IMFDXGIDeviceManager* pD3DManager, winmdroot.Media.MediaFoundation.IMFContentProtectionDevice* pContentProtectionDevice, winmdroot.Media.MediaFoundation.IMFContentDecryptorContext** ppContentDecryptorContext)
#cfunc global MFCreateContentDecryptorContext "MFCreateContentDecryptorContext" var, var, var, var

; winmdroot.Foundation.HRESULT MFCreateContentProtectionDevice(global::System.Guid* ProtectionSystemId, winmdroot.Media.MediaFoundation.IMFContentProtectionDevice** ContentProtectionDevice)
#cfunc global MFCreateContentProtectionDevice "MFCreateContentProtectionDevice" var, var

; winmdroot.Foundation.HRESULT MFCreateD3D12SynchronizationObject(winmdroot.Graphics.Direct3D12.ID3D12Device* pDevice, global::System.Guid* riid, void** ppvSyncObject)
#cfunc global MFCreateD3D12SynchronizationObject "MFCreateD3D12SynchronizationObject" var, var, var

; winmdroot.Foundation.HRESULT MFCreateDXGIDeviceManager(uint* resetToken, winmdroot.Media.MediaFoundation.IMFDXGIDeviceManager** ppDeviceManager)
#cfunc global MFCreateDXGIDeviceManager "MFCreateDXGIDeviceManager" var, var

; winmdroot.Foundation.HRESULT MFCreateDXGISurfaceBuffer(global::System.Guid* riid, winmdroot.System.Com.IUnknown* punkSurface, uint uSubresourceIndex, winmdroot.Foundation.BOOL fBottomUpWhenLinear, winmdroot.Media.MediaFoundation.IMFMediaBuffer** ppBuffer)
#cfunc global MFCreateDXGISurfaceBuffer "MFCreateDXGISurfaceBuffer" var, var, int, int, var

; winmdroot.Foundation.HRESULT MFCreateDXSurfaceBuffer(global::System.Guid* riid, winmdroot.System.Com.IUnknown* punkSurface, winmdroot.Foundation.BOOL fBottomUpWhenLinear, winmdroot.Media.MediaFoundation.IMFMediaBuffer** ppBuffer)
#cfunc global MFCreateDXSurfaceBuffer "MFCreateDXSurfaceBuffer" var, var, int, var

; winmdroot.Foundation.HRESULT MFCreateEventQueue(winmdroot.Media.MediaFoundation.IMFMediaEventQueue** ppMediaEventQueue)
#cfunc global MFCreateEventQueue "MFCreateEventQueue" var

; winmdroot.Foundation.HRESULT MFCreateFile(winmdroot.Media.MediaFoundation.MF_FILE_ACCESSMODE AccessMode, winmdroot.Media.MediaFoundation.MF_FILE_OPENMODE OpenMode, winmdroot.Media.MediaFoundation.MF_FILE_FLAGS fFlags, winmdroot.Foundation.PCWSTR pwszFileURL, winmdroot.Media.MediaFoundation.IMFByteStream** ppIByteStream)
#cfunc global MFCreateFile "MFCreateFile" int, int, int, wstr, var

; winmdroot.Foundation.HRESULT MFCreateLegacyMediaBufferOnMFMediaBuffer([Optional] winmdroot.Media.MediaFoundation.IMFSample* pSample, winmdroot.Media.MediaFoundation.IMFMediaBuffer* pMFMediaBuffer, uint cbOffset, winmdroot.Media.DxMediaObjects.IMediaBuffer** ppMediaBuffer)
#cfunc global MFCreateLegacyMediaBufferOnMFMediaBuffer "MFCreateLegacyMediaBufferOnMFMediaBuffer" var, var, int, var

; winmdroot.Foundation.HRESULT MFCreateMFByteStreamOnStream(winmdroot.System.Com.IStream* pStream, winmdroot.Media.MediaFoundation.IMFByteStream** ppByteStream)
#cfunc global MFCreateMFByteStreamOnStream "MFCreateMFByteStreamOnStream" var, var

; winmdroot.Foundation.HRESULT MFCreateMFByteStreamOnStreamEx(winmdroot.System.Com.IUnknown* punkStream, winmdroot.Media.MediaFoundation.IMFByteStream** ppByteStream)
#cfunc global MFCreateMFByteStreamOnStreamEx "MFCreateMFByteStreamOnStreamEx" var, var

; winmdroot.Foundation.HRESULT MFCreateMFByteStreamWrapper(winmdroot.Media.MediaFoundation.IMFByteStream* pStream, winmdroot.Media.MediaFoundation.IMFByteStream** ppStreamWrapper)
#cfunc global MFCreateMFByteStreamWrapper "MFCreateMFByteStreamWrapper" var, var

; winmdroot.Foundation.HRESULT MFCreateMFVideoFormatFromMFMediaType(winmdroot.Media.MediaFoundation.IMFMediaType* pMFType, winmdroot.Media.MediaFoundation.MFVIDEOFORMAT** ppMFVF, [Optional] uint* pcbSize)
#cfunc global MFCreateMFVideoFormatFromMFMediaType "MFCreateMFVideoFormatFromMFMediaType" var, var, var

; winmdroot.Foundation.HRESULT MFCreateMediaBufferFromMediaType(winmdroot.Media.MediaFoundation.IMFMediaType* pMediaType, long llDuration, uint dwMinLength, uint dwMinAlignment, winmdroot.Media.MediaFoundation.IMFMediaBuffer** ppBuffer)
#cfunc global MFCreateMediaBufferFromMediaType "MFCreateMediaBufferFromMediaType" var, int64, int, int, var

; winmdroot.Foundation.HRESULT MFCreateMediaBufferWrapper(winmdroot.Media.MediaFoundation.IMFMediaBuffer* pBuffer, uint cbOffset, uint dwLength, winmdroot.Media.MediaFoundation.IMFMediaBuffer** ppBuffer)
#cfunc global MFCreateMediaBufferWrapper "MFCreateMediaBufferWrapper" var, int, int, var

; winmdroot.Foundation.HRESULT MFCreateMediaEvent(uint met, global::System.Guid* guidExtendedType, winmdroot.Foundation.HRESULT hrStatus, [Optional] winmdroot.System.Com.StructuredStorage.PROPVARIANT* pvValue, winmdroot.Media.MediaFoundation.IMFMediaEvent** ppEvent)
#cfunc global MFCreateMediaEvent "MFCreateMediaEvent" int, var, intptr, var, var

; winmdroot.Foundation.HRESULT MFCreateMediaExtensionActivate(winmdroot.Foundation.PCWSTR szActivatableClassId, [Optional] winmdroot.System.Com.IUnknown* pConfiguration, global::System.Guid* riid, void** ppvObject)
#cfunc global MFCreateMediaExtensionActivate "MFCreateMediaExtensionActivate" wstr, var, var, var

; winmdroot.Foundation.HRESULT MFCreateMediaType(winmdroot.Media.MediaFoundation.IMFMediaType** ppMFType)
#cfunc global MFCreateMediaType "MFCreateMediaType" var

; winmdroot.Foundation.HRESULT MFCreateMediaTypeFromProperties(winmdroot.System.Com.IUnknown* punkStream, winmdroot.Media.MediaFoundation.IMFMediaType** ppMediaType)
#cfunc global MFCreateMediaTypeFromProperties "MFCreateMediaTypeFromProperties" var, var

; winmdroot.Foundation.HRESULT MFCreateMediaTypeFromRepresentation(global::System.Guid guidRepresentation, void* pvRepresentation, winmdroot.Media.MediaFoundation.IMFMediaType** ppIMediaType)
#cfunc global MFCreateMediaTypeFromRepresentation "MFCreateMediaTypeFromRepresentation" int, intptr, var

; winmdroot.Foundation.HRESULT MFCreateMemoryBuffer(uint cbMaxLength, winmdroot.Media.MediaFoundation.IMFMediaBuffer** ppBuffer)
#cfunc global MFCreateMemoryBuffer "MFCreateMemoryBuffer" int, var

; winmdroot.Foundation.HRESULT MFCreateMuxStreamAttributes(winmdroot.Media.MediaFoundation.IMFCollection* pAttributesToMux, winmdroot.Media.MediaFoundation.IMFAttributes** ppMuxAttribs)
#cfunc global MFCreateMuxStreamAttributes "MFCreateMuxStreamAttributes" var, var

; winmdroot.Foundation.HRESULT MFCreateMuxStreamMediaType(winmdroot.Media.MediaFoundation.IMFCollection* pMediaTypesToMux, winmdroot.Media.MediaFoundation.IMFMediaType** ppMuxMediaType)
#cfunc global MFCreateMuxStreamMediaType "MFCreateMuxStreamMediaType" var, var

; winmdroot.Foundation.HRESULT MFCreateMuxStreamSample(winmdroot.Media.MediaFoundation.IMFCollection* pSamplesToMux, winmdroot.Media.MediaFoundation.IMFSample** ppMuxSample)
#cfunc global MFCreateMuxStreamSample "MFCreateMuxStreamSample" var, var

; winmdroot.Foundation.HRESULT MFCreatePresentationDescriptor(uint cStreamDescriptors, [Optional] winmdroot.Media.MediaFoundation.IMFStreamDescriptor** apStreamDescriptors, winmdroot.Media.MediaFoundation.IMFPresentationDescriptor** ppPresentationDescriptor)
#cfunc global MFCreatePresentationDescriptor "MFCreatePresentationDescriptor" int, var, var

; winmdroot.Foundation.HRESULT MFCreatePropertiesFromMediaType(winmdroot.Media.MediaFoundation.IMFMediaType* pMediaType, global::System.Guid* riid, void** ppv)
#cfunc global MFCreatePropertiesFromMediaType "MFCreatePropertiesFromMediaType" var, var, var

; winmdroot.Foundation.HRESULT MFCreateSample(winmdroot.Media.MediaFoundation.IMFSample** ppIMFSample)
#cfunc global MFCreateSample "MFCreateSample" var

; winmdroot.Foundation.HRESULT MFCreateStreamDescriptor(uint dwStreamIdentifier, uint cMediaTypes, winmdroot.Media.MediaFoundation.IMFMediaType** apMediaTypes, winmdroot.Media.MediaFoundation.IMFStreamDescriptor** ppDescriptor)
#cfunc global MFCreateStreamDescriptor "MFCreateStreamDescriptor" int, int, var, var

; winmdroot.Foundation.HRESULT MFCreateStreamOnMFByteStream(winmdroot.Media.MediaFoundation.IMFByteStream* pByteStream, winmdroot.System.Com.IStream** ppStream)
#cfunc global MFCreateStreamOnMFByteStream "MFCreateStreamOnMFByteStream" var, var

; winmdroot.Foundation.HRESULT MFCreateStreamOnMFByteStreamEx(winmdroot.Media.MediaFoundation.IMFByteStream* pByteStream, global::System.Guid* riid, void** ppv)
#cfunc global MFCreateStreamOnMFByteStreamEx "MFCreateStreamOnMFByteStreamEx" var, var, var

; winmdroot.Foundation.HRESULT MFCreateSystemTimeSource(winmdroot.Media.MediaFoundation.IMFPresentationTimeSource** ppSystemTimeSource)
#cfunc global MFCreateSystemTimeSource "MFCreateSystemTimeSource" var

; winmdroot.Foundation.HRESULT MFCreateTempFile(winmdroot.Media.MediaFoundation.MF_FILE_ACCESSMODE AccessMode, winmdroot.Media.MediaFoundation.MF_FILE_OPENMODE OpenMode, winmdroot.Media.MediaFoundation.MF_FILE_FLAGS fFlags, winmdroot.Media.MediaFoundation.IMFByteStream** ppIByteStream)
#cfunc global MFCreateTempFile "MFCreateTempFile" int, int, int, var

; winmdroot.Foundation.HRESULT MFCreateTrackedSample(winmdroot.Media.MediaFoundation.IMFTrackedSample** ppMFSample)
#cfunc global MFCreateTrackedSample "MFCreateTrackedSample" var

; winmdroot.Foundation.HRESULT MFCreateTransformActivate(winmdroot.Media.MediaFoundation.IMFActivate** ppActivate)
#cfunc global MFCreateTransformActivate "MFCreateTransformActivate" var

; winmdroot.Foundation.HRESULT MFCreateVideoMediaType(winmdroot.Media.MediaFoundation.MFVIDEOFORMAT* pVideoFormat, winmdroot.Media.MediaFoundation.IMFVideoMediaType** ppIVideoMediaType)
#cfunc global MFCreateVideoMediaType "MFCreateVideoMediaType" var, var

; winmdroot.Foundation.HRESULT MFCreateVideoMediaTypeFromBitMapInfoHeader(winmdroot.Graphics.Gdi.BITMAPINFOHEADER* pbmihBitMapInfoHeader, uint dwPixelAspectRatioX, uint dwPixelAspectRatioY, winmdroot.Media.MediaFoundation.MFVideoInterlaceMode InterlaceMode, ulong VideoFlags, ulong qwFramesPerSecondNumerator, ulong qwFramesPerSecondDenominator, uint dwMaxBitRate, winmdroot.Media.MediaFoundation.IMFVideoMediaType** ppIVideoMediaType)
#cfunc global MFCreateVideoMediaTypeFromBitMapInfoHeader "MFCreateVideoMediaTypeFromBitMapInfoHeader" var, int, int, int, int64, int64, int64, int, var

; winmdroot.Foundation.HRESULT MFCreateVideoMediaTypeFromBitMapInfoHeaderEx(winmdroot.Graphics.Gdi.BITMAPINFOHEADER* pbmihBitMapInfoHeader, uint cbBitMapInfoHeader, uint dwPixelAspectRatioX, uint dwPixelAspectRatioY, winmdroot.Media.MediaFoundation.MFVideoInterlaceMode InterlaceMode, ulong VideoFlags, uint dwFramesPerSecondNumerator, uint dwFramesPerSecondDenominator, uint dwMaxBitRate, winmdroot.Media.MediaFoundation.IMFVideoMediaType** ppIVideoMediaType)
#cfunc global MFCreateVideoMediaTypeFromBitMapInfoHeaderEx "MFCreateVideoMediaTypeFromBitMapInfoHeaderEx" var, int, int, int, int, int64, int, int, int, var

; winmdroot.Foundation.HRESULT MFCreateVideoMediaTypeFromSubtype(global::System.Guid* pAMSubtype, winmdroot.Media.MediaFoundation.IMFVideoMediaType** ppIVideoMediaType)
#cfunc global MFCreateVideoMediaTypeFromSubtype "MFCreateVideoMediaTypeFromSubtype" var, var

; winmdroot.Foundation.HRESULT MFCreateVideoSampleAllocatorEx(global::System.Guid* riid, void** ppSampleAllocator)
#cfunc global MFCreateVideoSampleAllocatorEx "MFCreateVideoSampleAllocatorEx" var, var

; winmdroot.Foundation.HRESULT MFCreateWICBitmapBuffer(global::System.Guid* riid, winmdroot.System.Com.IUnknown* punkSurface, winmdroot.Media.MediaFoundation.IMFMediaBuffer** ppBuffer)
#cfunc global MFCreateWICBitmapBuffer "MFCreateWICBitmapBuffer" var, var, var

; winmdroot.Foundation.HRESULT MFCreateWaveFormatExFromMFMediaType(winmdroot.Media.MediaFoundation.IMFMediaType* pMFType, winmdroot.Media.Audio.WAVEFORMATEX** ppWF, [Optional] uint* pcbSize, uint Flags)
#cfunc global MFCreateWaveFormatExFromMFMediaType "MFCreateWaveFormatExFromMFMediaType" var, var, var, int

; winmdroot.Foundation.HRESULT MFDeserializeAttributesFromStream(winmdroot.Media.MediaFoundation.IMFAttributes* pAttr, uint dwOptions, winmdroot.System.Com.IStream* pStm)
#cfunc global MFDeserializeAttributesFromStream "MFDeserializeAttributesFromStream" var, int, var

; winmdroot.Foundation.HRESULT MFDeserializePresentationDescriptor(uint cbData, byte* pbData, winmdroot.Media.MediaFoundation.IMFPresentationDescriptor** ppPD)
#cfunc global MFDeserializePresentationDescriptor "MFDeserializePresentationDescriptor" int, var, var

; winmdroot.Foundation.HRESULT MFEndCreateFile(winmdroot.Media.MediaFoundation.IMFAsyncResult* pResult, winmdroot.Media.MediaFoundation.IMFByteStream** ppFile)
#cfunc global MFEndCreateFile "MFEndCreateFile" var, var

; winmdroot.Foundation.HRESULT MFFrameRateToAverageTimePerFrame(uint unNumerator, uint unDenominator, ulong* punAverageTimePerFrame)
#cfunc global MFFrameRateToAverageTimePerFrame "MFFrameRateToAverageTimePerFrame" int, int, var

; winmdroot.Foundation.HRESULT MFGetAttributesAsBlob(winmdroot.Media.MediaFoundation.IMFAttributes* pAttributes, byte* pBuf, uint cbBufSize)
#cfunc global MFGetAttributesAsBlob "MFGetAttributesAsBlob" var, var, int

; winmdroot.Foundation.HRESULT MFGetAttributesAsBlobSize(winmdroot.Media.MediaFoundation.IMFAttributes* pAttributes, uint* pcbBufSize)
#cfunc global MFGetAttributesAsBlobSize "MFGetAttributesAsBlobSize" var, var

; winmdroot.Foundation.HRESULT MFGetContentProtectionSystemCLSID(global::System.Guid* guidProtectionSystemID, global::System.Guid* pclsid)
#cfunc global MFGetContentProtectionSystemCLSID "MFGetContentProtectionSystemCLSID" var, var

; winmdroot.Foundation.HRESULT MFGetMFTMerit(winmdroot.System.Com.IUnknown* pMFT, uint cbVerifier, byte* verifier, uint* merit)
#cfunc global MFGetMFTMerit "MFGetMFTMerit" var, int, var, var

; winmdroot.Foundation.HRESULT MFGetPluginControl(winmdroot.Media.MediaFoundation.IMFPluginControl** ppPluginControl)
#cfunc global MFGetPluginControl "MFGetPluginControl" var

; winmdroot.Foundation.HRESULT MFGetStrideForBitmapInfoHeader(uint format, uint dwWidth, int* pStride)
#cfunc global MFGetStrideForBitmapInfoHeader "MFGetStrideForBitmapInfoHeader" int, int, var

; long MFGetSystemTime()
#cfunc global MFGetSystemTime "MFGetSystemTime"

; winmdroot.Foundation.HRESULT MFGetTimerPeriodicity(uint* Periodicity)
#cfunc global MFGetTimerPeriodicity "MFGetTimerPeriodicity" var

; uint MFGetUncompressedVideoFormat(winmdroot.Media.MediaFoundation.MFVIDEOFORMAT* pVideoFormat)
#cfunc global MFGetUncompressedVideoFormat "MFGetUncompressedVideoFormat" var

; void* MFHeapAlloc(nuint nSize, uint dwFlags, winmdroot.Foundation.PSTR pszFile, int line, winmdroot.Media.MediaFoundation.EAllocationType eat)
#cfunc global MFHeapAlloc "MFHeapAlloc" int, int, str, int, int

; void MFHeapFree(void* pv)
#func global MFHeapFree "MFHeapFree" intptr

; winmdroot.Foundation.HRESULT MFInitAMMediaTypeFromMFMediaType(winmdroot.Media.MediaFoundation.IMFMediaType* pMFType, global::System.Guid guidFormatBlockType, winmdroot.Media.MediaFoundation.AM_MEDIA_TYPE* pAMType)
#cfunc global MFInitAMMediaTypeFromMFMediaType "MFInitAMMediaTypeFromMFMediaType" var, int, var

; winmdroot.Foundation.HRESULT MFInitAttributesFromBlob(winmdroot.Media.MediaFoundation.IMFAttributes* pAttributes, byte* pBuf, uint cbBufSize)
#cfunc global MFInitAttributesFromBlob "MFInitAttributesFromBlob" var, var, int

; winmdroot.Foundation.HRESULT MFInitMediaTypeFromAMMediaType(winmdroot.Media.MediaFoundation.IMFMediaType* pMFType, winmdroot.Media.MediaFoundation.AM_MEDIA_TYPE* pAMType)
#cfunc global MFInitMediaTypeFromAMMediaType "MFInitMediaTypeFromAMMediaType" var, var

; winmdroot.Foundation.HRESULT MFInitMediaTypeFromMFVideoFormat(winmdroot.Media.MediaFoundation.IMFMediaType* pMFType, winmdroot.Media.MediaFoundation.MFVIDEOFORMAT* pMFVF, uint cbBufSize)
#cfunc global MFInitMediaTypeFromMFVideoFormat "MFInitMediaTypeFromMFVideoFormat" var, var, int

; winmdroot.Foundation.HRESULT MFInitMediaTypeFromMPEG1VideoInfo(winmdroot.Media.MediaFoundation.IMFMediaType* pMFType, winmdroot.Media.MediaFoundation.MPEG1VIDEOINFO* pMP1VI, uint cbBufSize, [Optional] global::System.Guid* pSubtype)
#cfunc global MFInitMediaTypeFromMPEG1VideoInfo "MFInitMediaTypeFromMPEG1VideoInfo" var, var, int, var

; winmdroot.Foundation.HRESULT MFInitMediaTypeFromMPEG2VideoInfo(winmdroot.Media.MediaFoundation.IMFMediaType* pMFType, winmdroot.Media.MediaFoundation.MPEG2VIDEOINFO* pMP2VI, uint cbBufSize, [Optional] global::System.Guid* pSubtype)
#cfunc global MFInitMediaTypeFromMPEG2VideoInfo "MFInitMediaTypeFromMPEG2VideoInfo" var, var, int, var

; winmdroot.Foundation.HRESULT MFInitMediaTypeFromVideoInfoHeader(winmdroot.Media.MediaFoundation.IMFMediaType* pMFType, winmdroot.Media.MediaFoundation.VIDEOINFOHEADER* pVIH, uint cbBufSize, [Optional] global::System.Guid* pSubtype)
#cfunc global MFInitMediaTypeFromVideoInfoHeader "MFInitMediaTypeFromVideoInfoHeader" var, var, int, var

; winmdroot.Foundation.HRESULT MFInitMediaTypeFromVideoInfoHeader2(winmdroot.Media.MediaFoundation.IMFMediaType* pMFType, winmdroot.Media.MediaFoundation.VIDEOINFOHEADER2* pVIH2, uint cbBufSize, [Optional] global::System.Guid* pSubtype)
#cfunc global MFInitMediaTypeFromVideoInfoHeader2 "MFInitMediaTypeFromVideoInfoHeader2" var, var, int, var

; winmdroot.Foundation.HRESULT MFInitMediaTypeFromWaveFormatEx(winmdroot.Media.MediaFoundation.IMFMediaType* pMFType, winmdroot.Media.Audio.WAVEFORMATEX* pWaveFormat, uint cbBufSize)
#cfunc global MFInitMediaTypeFromWaveFormatEx "MFInitMediaTypeFromWaveFormatEx" var, var, int

; winmdroot.Foundation.HRESULT MFInitVideoFormat(winmdroot.Media.MediaFoundation.MFVIDEOFORMAT* pVideoFormat, winmdroot.Media.MediaFoundation.MFStandardVideoFormat type)
#cfunc global MFInitVideoFormat "MFInitVideoFormat" var, int

; winmdroot.Foundation.HRESULT MFInitVideoFormat_RGB(winmdroot.Media.MediaFoundation.MFVIDEOFORMAT* pVideoFormat, uint dwWidth, uint dwHeight, uint D3Dfmt)
#cfunc global MFInitVideoFormat_RGB "MFInitVideoFormat_RGB" var, int, int, int

; winmdroot.Foundation.HRESULT MFIsContentProtectionDeviceSupported(global::System.Guid* ProtectionSystemId, winmdroot.Foundation.BOOL* isSupported)
#cfunc global MFIsContentProtectionDeviceSupported "MFIsContentProtectionDeviceSupported" var, var

; winmdroot.Foundation.HRESULT MFLockDXGIDeviceManager([Optional] uint* pResetToken, winmdroot.Media.MediaFoundation.IMFDXGIDeviceManager** ppManager)
#cfunc global MFLockDXGIDeviceManager "MFLockDXGIDeviceManager" var, var

; winmdroot.Graphics.Dxgi.Common.DXGI_FORMAT MFMapDX9FormatToDXGIFormat(uint dx9)
#cfunc global MFMapDX9FormatToDXGIFormat "MFMapDX9FormatToDXGIFormat" int

; uint MFMapDXGIFormatToDX9Format(winmdroot.Graphics.Dxgi.Common.DXGI_FORMAT dx11)
#cfunc global MFMapDXGIFormatToDX9Format "MFMapDXGIFormatToDX9Format" int

; winmdroot.Foundation.HRESULT MFPutWorkItem(uint dwQueue, winmdroot.Media.MediaFoundation.IMFAsyncCallback* pCallback, winmdroot.System.Com.IUnknown* pState)
#cfunc global MFPutWorkItem "MFPutWorkItem" int, var, var

; winmdroot.Foundation.HRESULT MFPutWorkItem2(uint dwQueue, int Priority, winmdroot.Media.MediaFoundation.IMFAsyncCallback* pCallback, [Optional] winmdroot.System.Com.IUnknown* pState)
#cfunc global MFPutWorkItem2 "MFPutWorkItem2" int, int, var, var

; winmdroot.Foundation.HRESULT MFPutWorkItemEx(uint dwQueue, winmdroot.Media.MediaFoundation.IMFAsyncResult* pResult)
#cfunc global MFPutWorkItemEx "MFPutWorkItemEx" int, var

; winmdroot.Foundation.HRESULT MFPutWorkItemEx2(uint dwQueue, int Priority, winmdroot.Media.MediaFoundation.IMFAsyncResult* pResult)
#cfunc global MFPutWorkItemEx2 "MFPutWorkItemEx2" int, int, var

; winmdroot.Foundation.HRESULT MFRegisterLocalByteStreamHandler(winmdroot.Foundation.PCWSTR szFileExtension, winmdroot.Foundation.PCWSTR szMimeType, winmdroot.Media.MediaFoundation.IMFActivate* pActivate)
#cfunc global MFRegisterLocalByteStreamHandler "MFRegisterLocalByteStreamHandler" wstr, wstr, var

; winmdroot.Foundation.HRESULT MFRegisterLocalSchemeHandler(winmdroot.Foundation.PCWSTR szScheme, winmdroot.Media.MediaFoundation.IMFActivate* pActivate)
#cfunc global MFRegisterLocalSchemeHandler "MFRegisterLocalSchemeHandler" wstr, var

; winmdroot.Foundation.HRESULT MFScheduleWorkItem(winmdroot.Media.MediaFoundation.IMFAsyncCallback* pCallback, winmdroot.System.Com.IUnknown* pState, long Timeout, [Optional] ulong* pKey)
#cfunc global MFScheduleWorkItem "MFScheduleWorkItem" var, var, int64, var

; winmdroot.Foundation.HRESULT MFSerializeAttributesToStream(winmdroot.Media.MediaFoundation.IMFAttributes* pAttr, uint dwOptions, winmdroot.System.Com.IStream* pStm)
#cfunc global MFSerializeAttributesToStream "MFSerializeAttributesToStream" var, int, var

; winmdroot.Foundation.HRESULT MFSerializePresentationDescriptor(winmdroot.Media.MediaFoundation.IMFPresentationDescriptor* pPD, uint* pcbData, byte** ppbData)
#cfunc global MFSerializePresentationDescriptor "MFSerializePresentationDescriptor" var, var, var

; winmdroot.Foundation.HRESULT MFShutdown()
#cfunc global MFShutdown "MFShutdown"

; winmdroot.Foundation.HRESULT MFSplitSample(winmdroot.Media.MediaFoundation.IMFSample* pSample, winmdroot.Media.MediaFoundation.IMFSample** pOutputSamples, uint dwOutputSampleMaxCount, uint* pdwOutputSampleCount)
#cfunc global MFSplitSample "MFSplitSample" var, var, int, var

; winmdroot.Foundation.HRESULT MFStartup(uint Version, uint dwFlags)
#cfunc global MFStartup "MFStartup" int, int

; winmdroot.Foundation.HRESULT MFTEnum(global::System.Guid guidCategory, uint Flags, [Optional] winmdroot.Media.MediaFoundation.MFT_REGISTER_TYPE_INFO* pInputType, [Optional] winmdroot.Media.MediaFoundation.MFT_REGISTER_TYPE_INFO* pOutputType, [Optional] winmdroot.Media.MediaFoundation.IMFAttributes* pAttributes, global::System.Guid** ppclsidMFT, uint* pcMFTs)
#cfunc global MFTEnum "MFTEnum" int, int, var, var, var, var, var

; winmdroot.Foundation.HRESULT MFTEnum2(global::System.Guid guidCategory, uint Flags, [Optional] winmdroot.Media.MediaFoundation.MFT_REGISTER_TYPE_INFO* pInputType, [Optional] winmdroot.Media.MediaFoundation.MFT_REGISTER_TYPE_INFO* pOutputType, [Optional] winmdroot.Media.MediaFoundation.IMFAttributes* pAttributes, winmdroot.Media.MediaFoundation.IMFActivate*** pppMFTActivate, uint* pnumMFTActivate)
#cfunc global MFTEnum2 "MFTEnum2" int, int, var, var, var, var, var

; winmdroot.Foundation.HRESULT MFTEnumEx(global::System.Guid guidCategory, uint Flags, [Optional] winmdroot.Media.MediaFoundation.MFT_REGISTER_TYPE_INFO* pInputType, [Optional] winmdroot.Media.MediaFoundation.MFT_REGISTER_TYPE_INFO* pOutputType, winmdroot.Media.MediaFoundation.IMFActivate*** pppMFTActivate, uint* pnumMFTActivate)
#cfunc global MFTEnumEx "MFTEnumEx" int, int, var, var, var, var

; winmdroot.Foundation.HRESULT MFTGetInfo(global::System.Guid clsidMFT, [Optional] winmdroot.Foundation.PWSTR* pszName, [Optional] winmdroot.Media.MediaFoundation.MFT_REGISTER_TYPE_INFO** ppInputTypes, [Optional] uint* pcInputTypes, [Optional] winmdroot.Media.MediaFoundation.MFT_REGISTER_TYPE_INFO** ppOutputTypes, [Optional] uint* pcOutputTypes, [Optional] winmdroot.Media.MediaFoundation.IMFAttributes** ppAttributes)
#cfunc global MFTGetInfo "MFTGetInfo" int, var, var, var, var, var, var

; winmdroot.Foundation.HRESULT MFTRegister(global::System.Guid clsidMFT, global::System.Guid guidCategory, winmdroot.Foundation.PWSTR pszName, uint Flags, uint cInputTypes, [Optional] winmdroot.Media.MediaFoundation.MFT_REGISTER_TYPE_INFO* pInputTypes, uint cOutputTypes, [Optional] winmdroot.Media.MediaFoundation.MFT_REGISTER_TYPE_INFO* pOutputTypes, [Optional] winmdroot.Media.MediaFoundation.IMFAttributes* pAttributes)
#cfunc global MFTRegister "MFTRegister" int, int, wstr, int, int, var, int, var, var

; winmdroot.Foundation.HRESULT MFTRegisterLocal(winmdroot.System.Com.IClassFactory* pClassFactory, global::System.Guid* guidCategory, winmdroot.Foundation.PCWSTR pszName, uint Flags, uint cInputTypes, [Optional] winmdroot.Media.MediaFoundation.MFT_REGISTER_TYPE_INFO* pInputTypes, uint cOutputTypes, [Optional] winmdroot.Media.MediaFoundation.MFT_REGISTER_TYPE_INFO* pOutputTypes)
#cfunc global MFTRegisterLocal "MFTRegisterLocal" var, var, wstr, int, int, var, int, var

; winmdroot.Foundation.HRESULT MFTRegisterLocalByCLSID(global::System.Guid* clisdMFT, global::System.Guid* guidCategory, winmdroot.Foundation.PCWSTR pszName, uint Flags, uint cInputTypes, [Optional] winmdroot.Media.MediaFoundation.MFT_REGISTER_TYPE_INFO* pInputTypes, uint cOutputTypes, [Optional] winmdroot.Media.MediaFoundation.MFT_REGISTER_TYPE_INFO* pOutputTypes)
#cfunc global MFTRegisterLocalByCLSID "MFTRegisterLocalByCLSID" var, var, wstr, int, int, var, int, var

; winmdroot.Foundation.HRESULT MFTUnregister(global::System.Guid clsidMFT)
#cfunc global MFTUnregister "MFTUnregister" int

; winmdroot.Foundation.HRESULT MFTUnregisterLocal([Optional] winmdroot.System.Com.IClassFactory* pClassFactory)
#cfunc global MFTUnregisterLocal "MFTUnregisterLocal" var

; winmdroot.Foundation.HRESULT MFTUnregisterLocalByCLSID(global::System.Guid clsidMFT)
#cfunc global MFTUnregisterLocalByCLSID "MFTUnregisterLocalByCLSID" int

; winmdroot.Foundation.HRESULT MFUnlockDXGIDeviceManager()
#cfunc global MFUnlockDXGIDeviceManager "MFUnlockDXGIDeviceManager"

; winmdroot.Foundation.HRESULT MFUnwrapMediaType(winmdroot.Media.MediaFoundation.IMFMediaType* pWrap, winmdroot.Media.MediaFoundation.IMFMediaType** ppOrig)
#cfunc global MFUnwrapMediaType "MFUnwrapMediaType" var, var

; winmdroot.Foundation.HRESULT MFValidateMediaTypeSize(global::System.Guid FormatType, [Optional] byte* pBlock, uint cbSize)
#cfunc global MFValidateMediaTypeSize "MFValidateMediaTypeSize" int, var, int

; winmdroot.Foundation.HRESULT MFWrapMediaType(winmdroot.Media.MediaFoundation.IMFMediaType* pOrig, global::System.Guid* MajorType, global::System.Guid* SubType, winmdroot.Media.MediaFoundation.IMFMediaType** ppWrap)
#cfunc global MFWrapMediaType "MFWrapMediaType" var, var, var, var

; long MFllMulDiv(long a, long b, long c, long d)
#cfunc global MFllMulDiv "MFllMulDiv" int64, int64, int64, int64

#endif
