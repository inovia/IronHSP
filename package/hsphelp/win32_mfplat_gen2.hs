; ============================================================
;   mfplat.dll ヘルプ (CsWin32 / win32metadata から自動抽出)
;   docs_ja.json に日本語訳があればそちらを使用、無ければ英語原文。
;   翻訳を追加するときは docs_ja.json を編集して再生成。
; ============================================================

%index
MFCreateSourceResolver
Creates the source resolver, which is used to create a media source from a URL or byte stream.
%group
Win32 mfplat
%prm
ppISourceResolver
ppISourceResolver : [var] Receives a pointer to the source resolver's IMFSourceResolver interface. The caller must release the interface.
%inst
Creates the source resolver, which is used to create a media source
from a URL or byte stream.

[戻り値]
If this function succeeds, it returns S_OK. Otherwise, it returns an
HRESULT error code.

[備考]
Note Prior to Windows 7, this function was exported from mf.dll.
Starting in Windows 7, this function is exported from mfplat.dll, and
mf.dll exports a stub function that calls into mfplat.dll. For more
information, see Library Changes in Windows 7.


%index
MFGetSupportedMimeTypes
Retrieves the MIME types that are registered for the source resolver.
%group
Win32 mfplat
%prm
pPropVarMimeTypeArray
pPropVarMimeTypeArray : [var] Pointer to a PROPVARIANT that receives the MIME types. Before calling this method, call PropVariantInit to initialize the PROPVARIANT. If the method succeeds, the PROPVARIANT contains an array of wide-character strings. The PROPVARIANT data type is VT_VECTOR | VT_LPWSTR. The caller must release the PROPVARIANT by calling PropVariantClear.
%inst
Retrieves the MIME types that are registered for the source resolver.

[戻り値]
The function returns an HRESULT. Possible values include, but are not
limited to, those in the following table.
This doc was truncated.


%index
MFGetSupportedSchemes
Retrieves the URL schemes that are registered for the source resolver.
%group
Win32 mfplat
%prm
pPropVarSchemeArray
pPropVarSchemeArray : [var] Pointer to a PROPVARIANT that receives the URL schemes. Before calling this method, call PropVariantInit to initialize the PROPVARIANT. If the method succeeds, the PROPVARIANT contains an array of wide-character strings. The PROPVARIANT data type is VT_VECTOR | VT_LPWSTR. The caller must release the PROPVARIANT by calling PropVariantClear.
%inst
Retrieves the URL schemes that are registered for the source
resolver.

[戻り値]
The function returns an HRESULT. Possible values include, but are not
limited to, those in the following table.
This doc was truncated.


%index
CreatePropertyStore
Creates an empty property store object.
%group
Win32 mfplat
%prm
ppStore
ppStore : [var] Receives a pointer to the IPropertyStore interface. The caller must release the interface.
%inst
Creates an empty property store object.

[戻り値]
If this function succeeds, it returns S_OK. Otherwise, it returns an
HRESULT error code.

[備考]
This function is available on the following platforms if the Windows
Media Format 11 SDK redistributable components are installed:
This doc was truncated.


%index
MFAllocateWorkQueue
Creates a new work queue. (MFAllocateWorkQueue)
%group
Win32 mfplat
%prm
pdwWorkQueue
pdwWorkQueue : [var] Receives an identifier for the work queue.
%inst
Creates a new work queue. (MFAllocateWorkQueue)

[戻り値]
The function returns an HRESULT. Possible values include, but are not
limited to, those in the following table.
This doc was truncated.

[備考]
When you are done using the work queue, call MFUnlockWorkQueue.


%index
MFAverageTimePerFrameToFrameRate
Calculates the frame rate, in frames per second, from the average duration of a video frame.
%group
Win32 mfplat
%prm
unAverageTimePerFrame, punNumerator, punDenominator
unAverageTimePerFrame : [int64] The average duration of a video frame, in 100-nanosecond units.
punNumerator : [var] Receives the numerator of the frame rate.
punDenominator : [var] Receives the denominator of the frame rate.
%inst
Calculates the frame rate, in frames per second, from the average
duration of a video frame.

[戻り値]
The function returns an HRESULT. Possible values include, but are not
limited to, those in the following table.
This doc was truncated.

[備考]
Average time per frame is used in the older VIDEOINFOHEADER and
VIDEOINFOHEADER2 format structures. This function provides a standard
conversion so that all components in the pipeline can use consistent
values, if they need to translate between the older format structures
and the media type attributes used in Media Foundation. This function
uses a look-up table for certain common durations. The table is
listed in the Remarks section for the
MFFrameRateToAverageTimePerFrame function.


%index
MFBeginCreateFile
Begins an asynchronous request to create a byte stream from a file.
%group
Win32 mfplat
%prm
AccessMode, OpenMode, fFlags, pwszFilePath, pCallback, pState, ppCancelCookie
AccessMode : [int] The requested access mode, specified as a member of the MF_FILE_ACCESSMODE enumeration.
OpenMode : [int] The behavior of the function if the file already exists or does not exist, specified as a member of the MF_FILE_OPENMODE enumeration.
fFlags : [int] Bitwise OR of values from the MF_FILE_FLAGS enumeration.
pwszFilePath : [wstr] Pointer to a null-terminated string containing the file name.
pCallback : [var] Pointer to the IMFAsyncCallback interface of a callback object. The caller must implement this interface
pState : [var] Pointer to the IUnknown interface of a state object, defined by the caller. This parameter can be NULL. You can use this object to hold state information. The object is returned to the caller when the callback is invoked.
ppCancelCookie : [var] Receives an IUnknown pointer or the value NULL. If the value is not NULL, you can cancel the asynchronous operation by passing this pointer to the MFCancelCreateFile function. The caller must release the interface. This parameter is optional and can be NULL.
%inst
Begins an asynchronous request to create a byte stream from a file.

[戻り値]
The function returns an HRESULT. Possible values include, but are not
limited to, those in the following table.
This doc was truncated.

[備考]
When the request is completed, the callback object's
IMFAsyncCallback::Invoke method is called. The callback object should
then call the MFEndCreateFile function to get a pointer to the byte
stream.


%index
MFBeginRegisterWorkQueueWithMMCSS
Associates a work queue with a Multimedia Class Scheduler Service (MMCSS) task. (MFBeginRegisterWorkQueueWithMMCSS)
%group
Win32 mfplat
%prm
dwWorkQueueId, wszClass, dwTaskId, pDoneCallback, pDoneState
dwWorkQueueId : [int] The identifier of the work queue.  For private work queues, the identifier is returned by the MFAllocateWorkQueue function. For platform work queues, see Work Queue Identifiers.
wszClass : [wstr] The name of the MMCSS task.For more information, see Multimedia Class Scheduler Service.
dwTaskId : [int] The unique task identifier. To obtain a new task identifier, set this value to zero.
pDoneCallback : [var] A pointer to the IMFAsyncCallback interface of a callback object. The caller must implement this interface.
pDoneState : [var] A pointer to the IUnknown interface of a state object, defined by the caller. This parameter can be NULL. You can use this object to hold state information. The object is returned to the caller when the callback is invoked.
%inst
Associates a work queue with a Multimedia Class Scheduler Service
(MMCSS) task. (MFBeginRegisterWorkQueueWithMMCSS)

[戻り値]
The function returns an HRESULT. Possible values include, but are not
limited to, those in the following table.
This doc was truncated.

[備考]
This function is asynchronous. When the operation completes, the
callback object's IMFAsyncCallback::Invoke method is called. At that
point, the application should call MFEndRegisterWorkQueueWithMMCSS to
complete the asynchronous request. To unregister the work queue from
the MMCSS task, call MFBeginUnregisterWorkQueueWithMMCSS.


%index
MFCalculateBitmapImageSize
Retrieves the image size for a video format.
%group
Win32 mfplat
%prm
pBMIH, cbBufSize, pcbImageSize, pbKnown
pBMIH : [var] Pointer to a BITMAPINFOHEADER structure that describes the format.
cbBufSize : [int] Size of the pBMIH buffer, in bytes. The size includes any color masks or palette entries that follow the BITMAPINFOHEADER structure.
pcbImageSize : [var] Receives the image size, in bytes.
pbKnown : [var] Receives the value TRUE if the function recognizes the video format. Otherwise, receives the value FALSE. This parameter can be NULL.
%inst
Retrieves the image size for a video format.

[戻り値]
The function returns an HRESULT. Possible values include, but are not
limited to, those in the following table.
This doc was truncated.

[備考]
Before calling this function, you must set at least the following
members of the BITMAPINFOHEADER structure:
This doc was truncated.


%index
MFCalculateImageSize
Retrieves the image size, in bytes, for an uncompressed video format. (MFCalculateImageSize)
%group
Win32 mfplat
%prm
guidSubtype, unWidth, unHeight, pcbImageSize
guidSubtype : [var] Media subtype for the video format. For a list of subtypes, see Media Type GUIDs.
unWidth : [int] Width of the image, in pixels.
unHeight : [int] Height of the image, in pixels.
pcbImageSize : [var] Receives the size of each frame, in bytes. If the format is compressed or is not recognized, the value is zero.
%inst
Retrieves the image size, in bytes, for an uncompressed video format.
(MFCalculateImageSize)

[戻り値]
The function returns an HRESULT. Possible values include, but are not
limited to, those in the following table.
This doc was truncated.


%index
MFCancelCreateFile
Cancels an asynchronous request to create a byte stream from a file.
%group
Win32 mfplat
%prm
pCancelCookie
pCancelCookie : [var] A pointer to the IUnknown interface of the cancellation object. This pointer is received in the ppCancelCookie parameter of the MFBeginCreateFile function.
%inst
Cancels an asynchronous request to create a byte stream from a file.

[戻り値]
The function returns an HRESULT. Possible values include, but are not
limited to, those in the following table.
This doc was truncated.

[備考]
You can use this function to cancel a previous call to
MFBeginCreateFile. Because that function is asynchronous, however, it
might complete before the operation can be canceled. Therefore, your
callback might still be invoked after you call this function.


%index
MFCombineSamples
Concatenates a media sample onto another sample if their combined duration does not exceed the specified duration.
%group
Win32 mfplat
%prm
pSample, pSampleToAdd, dwMaxMergedDurationInMS, pMerged
pSample : [var] A pointer to an [IMFSample](../mfobjects/nn-mfobjects-imfsample.md) to which the the sample provided in the *pSampleToAdd* parameter is appended.
pSampleToAdd : [var] A pointer to an [IMFSample](../mfobjects/nn-mfobjects-imfsample.md) to append to the sample provided in the  *pSample* parameter.
dwMaxMergedDurationInMS : [int] The maximum duration in milliseconds that the combined sample can fill for the operation to be successful.
pMerged : [var] Output parameter that receives a BOOL indicating whether the sample was successfully appended.
%inst
Concatenates a media sample onto another sample if their combined
duration does not exceed the specified duration.

[戻り値]
Returns HRESULT.

[備考]
Split combined samples by calling
[MFSplitSample](nf-mfapi-mfsplitsample.md)


%index
MFCompareFullToPartialMediaType
Compares a full media type to a partial media type.
%group
Win32 mfplat
%prm
pMFTypeFull, pMFTypePartial
pMFTypeFull : [var] Pointer to the IMFMediaType interface of the full media type.
pMFTypePartial : [var] Pointer to the IMFMediaType interface of the partial media type.
%inst
Compares a full media type to a partial media type.

[戻り値]
If the full media type is compatible with the partial media type, the
function returns TRUE. Otherwise, the function returns FALSE.

[備考]
A pipeline component can return a partial media type to describe a
range of possible formats the component might accept. A partial media
type has at least a major type GUID, but might be missing some of the
other attributes that are needed to fully describe the type. The
missing attributes represent "don't care" values for the partial
type. For example, a partial video type might be missing the
attributes for the width and height of the video. This function
returns TRUE if the following conditions are both true:
This doc was truncated.


%index
MFConvertColorInfoFromDXVA
Sets the extended color information in a MFVIDEOFORMAT structure.
%group
Win32 mfplat
%prm
pToFormat, dwFromDXVA
pToFormat : [var] Pointer to an MFVIDEOFORMAT structure. The function fills in the structure members that correspond to the DXVA color information in the dwFromDXVA parameter. The function does not modify the other structure members.
dwFromDXVA : [int] DWORD that contains extended color information. The bitfields in the DWORD are defined in the DXVA2_ExtendedFormat structure.
%inst
Sets the extended color information in a MFVIDEOFORMAT structure.

[戻り値]
If this function succeeds, it returns S_OK. Otherwise, it returns an
HRESULT error code.

[備考]
This function sets the following fields in the MFVIDEOFORMAT
structure.
This doc was truncated.


%index
MFConvertColorInfoToDXVA
Converts the extended color information from an MFVIDEOFORMAT to the equivalent DirectX Video Acceleration (DXVA) color information.
%group
Win32 mfplat
%prm
pdwToDXVA, pFromFormat
pdwToDXVA : [var] Receives the DXVA extended color information. The bitfields in the DWORD are defined in the DXVA2_ExtendedFormat structure.
pFromFormat : [var] Pointer to an MFVIDEOFORMAT structure that describes the video format.
%inst
Converts the extended color information from an MFVIDEOFORMAT to the
equivalent DirectX Video Acceleration (DXVA) color information.

[戻り値]
If this function succeeds, it returns S_OK. Otherwise, it returns an
HRESULT error code.

[備考]
Note Prior to Windows 7, this function was exported from evr.dll.
Starting in Windows 7, this function is exported from mfplat.dll, and
evr.dll exports a stub function that calls into mfplat.dll. For more
information, see Library Changes in Windows 7.


%index
MFConvertFromFP16Array
Converts an array of 16-bit floating-point numbers into an array of 32-bit floating-point numbers.
%group
Win32 mfplat
%prm
pDest, pSrc, dwCount
pDest : [var] Pointer to an array of float values. The array must contain at least dwCount elements.
pSrc : [var] Pointer to an array of 16-bit floating-point values, typed as WORD values. The array must contain at least dwCount elements.
dwCount : [int] Number of elements in the pSrc array to convert.
%inst
Converts an array of 16-bit floating-point numbers into an array of
32-bit floating-point numbers.

[戻り値]
If this function succeeds, it returns S_OK. Otherwise, it returns an
HRESULT error code.

[備考]
The function converts dwCount values in the pSrc array and writes
them into the pDest array.
Note Prior to Windows 7, this function was exported from evr.dll.
Starting in Windows 7, this function is exported from mfplat.dll, and
evr.dll exports a stub function that calls into mfplat.dll. For more
information, see Library Changes in Windows 7.


%index
MFConvertToFP16Array
Converts an array of 32-bit floating-point numbers into an array of 16-bit floating-point numbers.
%group
Win32 mfplat
%prm
pDest, pSrc, dwCount
pDest : [var] Pointer to an array of 16-bit floating-point values, typed as WORD values. The array must contain at least dwCount elements.
pSrc : [var] Pointer to an array of float values. The array must contain at least dwCount elements.
dwCount : [int] Number of elements in the pSrc array to convert.
%inst
Converts an array of 32-bit floating-point numbers into an array of
16-bit floating-point numbers.

[戻り値]
If this function succeeds, it returns S_OK. Otherwise, it returns an
HRESULT error code.

[備考]
The function converts the values in the pSrc array and writes them
into the pDest array.
Note Prior to Windows 7, this function was exported from evr.dll.
Starting in Windows 7, this function is exported from mfplat.dll, and
evr.dll exports a stub function that calls into mfplat.dll. For more
information, see Library Changes in Windows 7.


%index
MFCopyImage
Copies an image or image plane from one buffer to another.
%group
Win32 mfplat
%prm
pDest, lDestStride, pSrc, lSrcStride, dwWidthInBytes, dwLines
pDest : [var] Pointer to the start of the first row of pixels in the destination buffer.
lDestStride : [int] Stride of the destination buffer, in bytes.
pSrc : [var] Pointer to the start of the first row of pixels in the source image.
lSrcStride : [int] Stride of the source image, in bytes.
dwWidthInBytes : [int] Width of the image, in bytes.
dwLines : [int] Number of rows of pixels to copy.
%inst
Copies an image or image plane from one buffer to another.

[戻り値]
If this function succeeds, it returns S_OK. Otherwise, it returns an
HRESULT error code.

[備考]
This function copies a single plane of the image. For planar YUV
formats, you must call the function once for each plane. In this
case, pDest and pSrc must point to the start of each plane.
This function is optimized if the MMX, SSE, or SSE2 instruction sets
are available on the processor. The function performs a non-temporal
store (the data is written to memory directly without polluting the
cache).
Note Prior to Windows 7, this function was exported from evr.dll.
Starting in Windows 7, this function is exported from mfplat.dll, and
evr.dll exports a stub function that calls into mfplat.dll. For more
information, see Library Changes in Windows 7.


%index
MFCreate2DMediaBuffer
Creates a system-memory buffer object to hold 2D image data.
%group
Win32 mfplat
%prm
dwWidth, dwHeight, dwFourCC, fBottomUp, ppBuffer
dwWidth : [int] Width of the image, in pixels.
dwHeight : [int] Height of the image, in pixels.
dwFourCC : [int] A FOURCC code or D3DFORMAT value that specifies the video format. If you have a video subtype GUID, you can use the first DWORD of the subtype.
fBottomUp : [int] If TRUE, the buffer's IMF2DBuffer::ContiguousCopyTo method copies the buffer into a bottom-up format. The bottom-up format is compatible with GDI for uncompressed RGB images. If this parameter is FALSE, the ContiguousCopyTo method copies the buffer into a top-down format, which is compatible with DirectX.
ppBuffer : [var] Receives a pointer to the IMFMediaBuffer interface.
%inst
Creates a system-memory buffer object to hold 2D image data.

[戻り値]
This function can return one of these values.
This doc was truncated.

[備考]
The returned buffer object also exposes the IMF2DBuffer2 interface.


%index
MFCreateAMMediaTypeFromMFMediaType
Creates a DirectShow AM_MEDIA_TYPE structure from a Media Foundation media type.
%group
Win32 mfplat
%prm
pMFType, guidFormatBlockType, ppAMType
pMFType : [var] Pointer to the IMFMediaType interface of the media type to convert.
guidFormatBlockType : [int] Format type GUID. This value corresponds to the formattype member of the AM_MEDIA_TYPE structure and specifies the type of format block to allocate. If the value is GUID_NULL, the function attempts to deduce the correct format block, based on the major type and subtype.
ppAMType : [var] Receives a pointer to an AM_MEDIA_TYPE structure. The caller must release the memory allocated for the structure by calling CoTaskMemFree. The function also allocates memory for the format block, which the caller must release by calling CoTaskMemFree on the pbFormat member.
%inst
Creates a DirectShow AM_MEDIA_TYPE structure from a Media Foundation
media type.

[戻り値]
The function returns an HRESULT. Possible values include, but are not
limited to, those in the following table.
This doc was truncated.

[備考]
This function can also be used with the following format structures
that are equivalent to AM_MEDIA_TYPE:
This doc was truncated.


%index
MFCreateAlignedMemoryBuffer
Allocates system memory with a specified byte alignment and creates a media buffer to manage the memory.
%group
Win32 mfplat
%prm
cbMaxLength, cbAligment, ppBuffer
cbMaxLength : [int] Size of the buffer, in bytes.
cbAligment : [int] Specifies the memory alignment for the buffer. Use one of the following constants.
ppBuffer : [var] Receives a pointer to the IMFMediaBuffer interface of the media buffer. The caller must release the interface.
%inst
Allocates system memory with a specified byte alignment and creates a
media buffer to manage the memory.

[戻り値]
The function returns an HRESULT. Possible values include, but are not
limited to, those in the following table.
This doc was truncated.

[備考]
When the media buffer object is destroyed, it releases the allocated
memory.


%index
MFCreateAttributes
Creates an empty attribute store.
%group
Win32 mfplat
%prm
ppMFAttributes, cInitialSize
ppMFAttributes : [var] Receives a pointer to the IMFAttributes interface. The caller must release the interface.
cInitialSize : [int] The initial number of elements allocated for the attribute store. The attribute store grows as needed.
%inst
Creates an empty attribute store.

[戻り値]
If this function succeeds, it returns S_OK. Otherwise, it returns an
HRESULT error code.

[備考]
Attributes are used throughout Microsoft Media Foundation to
configure objects, describe media formats, query object properties,
and other purposes. For more information, see Attributes in Media
Foundation. For a complete list of all the defined attribute GUIDs in
Media Foundation, see Media Foundation Attributes.


%index
MFCreateAudioMediaType
Creates an audio media type from a WAVEFORMATEX structure.
%group
Win32 mfplat
%prm
pAudioFormat, ppIAudioMediaType
pAudioFormat : [var] Pointer to a WAVEFORMATEX structure that describes the audio format.
ppIAudioMediaType : [var] Receives a pointer to the IMFAudioMediaType interface. The caller must release the interface.
%inst
Creates an audio media type from a WAVEFORMATEX structure.

[戻り値]
If this function succeeds, it returns S_OK. Otherwise, it returns an
HRESULT error code.

[備考]
The IMFAudioMediaType interface is deprecated, so applications should
avoid using this function. To create a media type from a WAVEFORMATEX
structure, do the following:
This doc was truncated.


%index
MFCreateCollection
Creates an empty collection object.
%group
Win32 mfplat
%prm
ppIMFCollection
ppIMFCollection : [var] Receives a pointer to the collection object's IMFCollection interface. The caller must release the interface.
%inst
Creates an empty collection object.

[戻り値]
The function returns an HRESULT. Possible values include, but are not
limited to, those in the following table.
This doc was truncated.


%index
MFCreateContentDecryptorContext
Creates an IMFContentDecryptorContext interface for the specified media protection system.
%group
Win32 mfplat
%prm
guidMediaProtectionSystemId, pD3DManager, pContentProtectionDevice, ppContentDecryptorContext
guidMediaProtectionSystemId : [var] The identifier of the media protection system for which you want to create an IMFContentDecryptorContext interface.
pD3DManager : [var] Pointer to the IMFDXGIDeviceManager interface that you want to use for sharing the Direct3D?11 device.
pContentProtectionDevice : [var] The IMFContentProtectionDevice interface for the specified media protection system.
ppContentDecryptorContext : [var] Pointer to the created IMFContentDecryptorContext interface.
%inst
Creates an IMFContentDecryptorContext interface for the specified
media protection system.


%index
MFCreateContentProtectionDevice
Creates an IMFContentProtectionDevice interface for the specified media protection system.
%group
Win32 mfplat
%prm
ProtectionSystemId, ContentProtectionDevice
ProtectionSystemId : [var] The identifier of the media protection system for which you want to create the IMFContentProtectionDevice interface.
ContentProtectionDevice : [var] Pointer to the created IMFContentProtectionDevice interface.
%inst
Creates an IMFContentProtectionDevice interface for the specified
media protection system.


%index
MFCreateD3D12SynchronizationObject
Instantiates an a Media Foundation D3D12 synchronization primitive used to synchronize access to a D3D12 resource stored in an Media Foundation object.
%group
Win32 mfplat
%prm
pDevice, riid, ppvSyncObject
pDevice : [var] The [ID3D12Device](../d3d12/nn-d3d12-id3d12device.md) associated with the resource and primitive being created.
riid : [var] The GUID identifying the interface of the synchronization object that will be created.
ppvSyncObject : [var] Receives a **void\*\*** pointing to the created synchronization object.
%inst
Instantiates an a Media Foundation D3D12 synchronization primitive
used to synchronize access to a D3D12 resource stored in an Media
Foundation object.

[戻り値]
An HRESULT including but not limited to the following values: | Value
| Description | |-------|-------------| | S_OK | Success | |
MF_E_OPERATION_UNSUPPORTED_AT_D3D_FEATURE_LEVEL | The attempted call
or command is not supported with the DirectX version used by the
component. | | o MF_E_UNSUPPORTED_MEDIATYPE_AT_D3D_FEATURE_LEVEL |
The specified media type is not supported with the DirectX version
used by the component. |


%index
MFCreateDXGIDeviceManager
Creates an instance of the Microsoft DirectX Graphics Infrastructure (DXGI) Device Manager.
%group
Win32 mfplat
%prm
resetToken, ppDeviceManager
resetToken : [var] Receives a token that identifies this instance of the DXGI Device Manager. Use this token when calling IMFDXGIDeviceManager::ResetDevice.
ppDeviceManager : [var] Receives a pointer to the IMFDXGIDeviceManager interface. The caller must release the interface.
%inst
Creates an instance of the Microsoft DirectX Graphics Infrastructure
(DXGI) Device Manager.

[戻り値]
If this function succeeds, it returns S_OK. Otherwise, it returns an
HRESULT error code.

[備考]
When you create an IMFDXGIDeviceManager with
MFCreateDXGIDeviceManager, a Microsoft Direct3D 11 device is not
associated with the device manager. To associate a Direct3D 11 device
with the device manager, call IMFDXGIDeviceManager::ResetDevice,
passing in the pointer to the Direct3D 11 device. To create a
Direct3D 11 device, call D3D11CreateDevice. The device should be
created with the D3D11_CREATE_DEVICE_VIDEO_SUPPORT device creation
flag which is defined in the D3D11_CREATE_DEVICE_FLAG enumeration.


%index
MFCreateDXGISurfaceBuffer
Creates a media buffer to manage a Microsoft DirectX Graphics Infrastructure (DXGI) surface.
%group
Win32 mfplat
%prm
riid, punkSurface, uSubresourceIndex, fBottomUpWhenLinear, ppBuffer
riid : [var] Identifies the type of DXGI surface. This value must be IID_ID3D11Texture2D.
punkSurface : [var] A pointer to the IUnknown interface of the DXGI surface.
uSubresourceIndex : [int] The zero-based index of a subresource of the surface. The media buffer object is associated with this subresource.
fBottomUpWhenLinear : [int] If TRUE, the buffer's IMF2DBuffer::ContiguousCopyTo method copies the buffer into a bottom-up format. The bottom-up format is compatible with GDI for uncompressed RGB images. If this parameter is FALSE, the ContiguousCopyTo method copies the buffer into a top-down format, which is compatible with Direct3D.
ppBuffer : [var] Receives a pointer to the IMFMediaBuffer interface. The caller must release the buffer.
%inst
Creates a media buffer to manage a Microsoft DirectX Graphics
Infrastructure (DXGI) surface.

[戻り値]
If this function succeeds, it returns S_OK. Otherwise, it returns an
HRESULT error code.

[備考]
The returned buffer object supports the following interfaces:
This doc was truncated.


%index
MFCreateDXSurfaceBuffer
Creates a media buffer object that manages a Direct3D 9 surface.
%group
Win32 mfplat
%prm
riid, punkSurface, fBottomUpWhenLinear, ppBuffer
riid : [var] Identifies the type of Direct3D 9 surface. Currently this value must be IID_IDirect3DSurface9.
punkSurface : [var] A pointer to the IUnknown interface of the DirectX surface.
fBottomUpWhenLinear : [int] If TRUE, the buffer's IMF2DBuffer::ContiguousCopyTo method copies the buffer into a bottom-up format. The bottom-up format is compatible with GDI for uncompressed RGB images. If this parameter is FALSE, the ContiguousCopyTo method copies the buffer into a top-down format, which is compatible with DirectX.
ppBuffer : [var] Receives a pointer to the IMFMediaBuffer interface. The caller must release the buffer.
%inst
Creates a media buffer object that manages a Direct3D 9 surface.

[戻り値]
The function returns an HRESULT. Possible values include, but are not
limited to, those in the following table.
This doc was truncated.

[備考]
This function creates a media buffer object that holds a pointer to
the Direct3D surface specified in punkSurface. Locking the buffer
gives the caller access to the surface memory. When the buffer object
is destroyed, it releases the surface. For more information about
media buffers, see Media Buffers. Note This function does not
allocate the Direct3D surface itself. The buffer object created by
this function also exposes the IMF2DBuffer interface. For more
information, see DirectX Surface Buffer.
This function does not support DXGI surfaces.


%index
MFCreateEventQueue
Creates an event queue.
%group
Win32 mfplat
%prm
ppMediaEventQueue
ppMediaEventQueue : [var] Receives a pointer to the IMFMediaEventQueue interface of the event queue. The caller must release the interface.
%inst
Creates an event queue.

[戻り値]
The function returns an HRESULT. Possible values include, but are not
limited to, those in the following table.
This doc was truncated.

[備考]
This function creates a helper object that you can use to implement
the IMFMediaEventGenerator interface. This function is available on
the following platforms if the Windows Media Format 11 SDK
redistributable components are installed:
This doc was truncated.


%index
MFCreateFile
Creates a byte stream from a file.
%group
Win32 mfplat
%prm
AccessMode, OpenMode, fFlags, pwszFileURL, ppIByteStream
AccessMode : [int] The requested access mode, specified as a member of the MF_FILE_ACCESSMODE enumeration.
OpenMode : [int] The behavior of the function if the file already exists or does not exist, specified as a member of the MF_FILE_OPENMODE enumeration.
fFlags : [int] Bitwise OR of values from the MF_FILE_FLAGS enumeration.
pwszFileURL : [wstr] Pointer to a null-terminated string that contains the file name.
ppIByteStream : [var] Receives a pointer to the IMFByteStream interface of the byte stream. The caller must release the interface.
%inst
Creates a byte stream from a file.

[戻り値]
If this function succeeds, it returns S_OK. Otherwise, it returns an
HRESULT error code.

[備考]
This function is available on the following platforms if the Windows
Media Format 11 SDK redistributable components are installed:
This doc was truncated.


%index
MFCreateLegacyMediaBufferOnMFMediaBuffer
Converts a Media Foundation media buffer into a buffer that is compatible with DirectX Media Objects (DMOs).
%group
Win32 mfplat
%prm
pSample, pMFMediaBuffer, cbOffset, ppMediaBuffer
pSample : [var] Pointer to the IMFSample interface of the sample that contains the Media Foundation buffer. This parameter can be NULL.
pMFMediaBuffer : [var] Pointer to the IMFMediaBuffer interface of the Media Foundation buffer.
cbOffset : [int] Offset in bytes from the start of the Media Foundation buffer. This offset defines where the DMO buffer starts. If this parameter is zero, the DMO buffer starts at the beginning of the Media Foundation buffer.
ppMediaBuffer : [var] Receives a pointer to the IMediaBuffer interface. This interface is documented in the DirectShow SDK documentation. The caller must release the interface.
%inst
Converts a Media Foundation media buffer into a buffer that is
compatible with DirectX Media Objects (DMOs).

[戻り値]
The function returns an HRESULT. Possible values include, but are not
limited to, those in the following table.
This doc was truncated.

[備考]
The DMO buffer created by this function also exposes the IMFSample
interface. If pIMFSample is NULL, all of the IMFSample methods return
MF_E_NOT_INITIALIZED. Otherwise, they call through to the pIMFSample
pointer. If the Media Foundation buffer specified by pIMFMediaBuffer
exposes the IMF2DBuffer interface, the DMO buffer also exposes
IMF2DBuffer.


%index
MFCreateMFByteStreamOnStream
Creates a Microsoft Media Foundation byte stream that wraps an IStream pointer.
%group
Win32 mfplat
%prm
pStream, ppByteStream
pStream : [var] A pointer to the IStream interface.
ppByteStream : [var] Receives a pointer to the IMFByteStream interface. The caller must release the interface.
%inst
Creates a Microsoft Media Foundation byte stream that wraps an
IStream pointer.

[戻り値]
Returns an HRESULT value.

[備考]
This function enables applications to pass an IStream object to a
Media Foundation API that takes an IMFByteStream pointer.


%index
MFCreateMFByteStreamOnStreamEx
Creates a Microsoft Media Foundation byte stream that wraps an IRandomAccessStream object.
%group
Win32 mfplat
%prm
punkStream, ppByteStream
punkStream : [var] A pointer to the IRandomAccessStream interface.
ppByteStream : [var] Receives a pointer to the IMFByteStream interface. The caller must release the interface.
%inst
Creates a Microsoft Media Foundation byte stream that wraps an
IRandomAccessStream object.

[戻り値]
If this function succeeds, it returns S_OK. Otherwise, it returns an
HRESULT error code.


%index
MFCreateMFByteStreamWrapper
Creates a wrapper for a byte stream.
%group
Win32 mfplat
%prm
pStream, ppStreamWrapper
pStream : [var] A pointer to the IMFByteStream interface of the original byte stream.
ppStreamWrapper : [var] Receives a pointer to the IMFByteStream interface of the wrapper. The caller must release the interface.
%inst
Creates a wrapper for a byte stream.

[戻り値]
If this function succeeds, it returns S_OK. Otherwise, it returns an
HRESULT error code.

[備考]
The IMFByteStream methods on the wrapper call directly through to the
original byte stream, except for the IMFByteStream::Close method.
Calling Close on the wrapper closes the wrapper object, but leaves
the original byte stream open.


%index
MFCreateMFVideoFormatFromMFMediaType
Creates an MFVIDEOFORMAT structure from a video media type.
%group
Win32 mfplat
%prm
pMFType, ppMFVF, pcbSize
pMFType : [var] Pointer to the IMFMediaType interface of a video media type.
ppMFVF : [var] Receives a pointer to an MFVIDEOFORMAT structure. The caller must release the memory allocated for the structure by calling CoTaskMemFree.
pcbSize : [var] Receives the size of the MFVIDEOFORMAT structure.
%inst
Creates an MFVIDEOFORMAT structure from a video media type.

[戻り値]
If this function succeeds, it returns S_OK. Otherwise, it returns an
HRESULT error code.


%index
MFCreateMediaBufferFromMediaType
Allocates a system-memory buffer that is optimal for a specified media type.
%group
Win32 mfplat
%prm
pMediaType, llDuration, dwMinLength, dwMinAlignment, ppBuffer
pMediaType : [var] A pointer to the IMFMediaType interface of the media type.
llDuration : [int64] The sample duration. This value is required for audio formats.
dwMinLength : [int] The minimum size of the buffer, in bytes. The actual buffer size might be larger. Specify zero to allocate the default buffer size for the media type.
dwMinAlignment : [int] The minimum memory alignment for the buffer. Specify zero to use the default memory alignment.
ppBuffer : [var] Receives a pointer to the IMFMediaBuffer interface. The caller must release the interface.
%inst
Allocates a system-memory buffer that is optimal for a specified
media type.

[戻り値]
If this function succeeds, it returns S_OK. Otherwise, it returns an
HRESULT error code.

[備考]
For video formats, if the format is recognized, the function creates
a 2-D buffer that implements the IMF2DBuffer2 interface. Otherwise it
creates a linear buffer. To get the IMF2DBuffer2 interface, call
QueryInterface on the pointer returned in ppBuffer. If the
QueryInterface method fails, use the IMFMediaBuffer interface to
access the buffer memory. For audio formats, the function allocates a
buffer that is large enough to contain llDuration audio samples, or
dwMinLength, whichever is larger. This function always allocates
system memory. For Direct3D surfaces, use the
MFCreateDXGISurfaceBuffer or MFCreateDXSurfaceBuffer function.


%index
MFCreateMediaBufferWrapper
Creates a media buffer that wraps an existing media buffer.
%group
Win32 mfplat
%prm
pBuffer, cbOffset, dwLength, ppBuffer
pBuffer : [var] A pointer to the IMFMediaBuffer interface of the original media buffer.
cbOffset : [int] The start of the new buffer, as an offset in bytes from the start of the original buffer.
dwLength : [int] The size of the new buffer. The value of cbOffset + dwLength must be less than or equal to the size of valid data the original buffer. (The size of the valid data is returned by the IMFMediaBuffer::GetCurrentLength method.)
ppBuffer : [var] Receives a pointer to the IMFMediaBuffer interface. The caller must release the interface.
%inst
Creates a media buffer that wraps an existing media buffer.

[戻り値]
The function returns an HRESULT. Possible values include, but are not
limited to, those in the following table.
This doc was truncated.

[備考]
The maximum size of the wrapper buffer is limited to the size of the
valid data in the original buffer. This might be less than the
allocated size of the original buffer. To set the size of the valid
data, call IMFMediaBuffer::SetCurrentLength. This function is
available on the following platforms if the Windows Media Format 11
SDK redistributable components are installed:
This doc was truncated.


%index
MFCreateMediaEvent
Creates a media event object.
%group
Win32 mfplat
%prm
met, guidExtendedType, hrStatus, pvValue, ppEvent
met : [int] The event type. See IMFMediaEvent::GetType. For a list of event types, see Media Foundation Events.
guidExtendedType : [var] The extended type. See IMFMediaEvent::GetExtendedType. If the event type does not have an extended type, use the value GUID_NULL.
hrStatus : [intptr] The event status. See IMFMediaEvent::GetStatus
pvValue : [var] The value associated with the event, if any. See IMFMediaEvent::GetValue. This parameter can be NULL.
ppEvent : [var] Receives a pointer to the IMFMediaEvent interface. The caller must release the interface.
%inst
Creates a media event object.

[戻り値]
The function returns an HRESULT. Possible values include, but are not
limited to, those in the following table.
This doc was truncated.

[備考]
This function is available on the following platforms if the Windows
Media Format 11 SDK redistributable components are installed:
This doc was truncated.


%index
MFCreateMediaExtensionActivate
Creates an activation object for a Windows Runtime class.
%group
Win32 mfplat
%prm
szActivatableClassId, pConfiguration, riid, ppvObject
szActivatableClassId : [wstr] The class identifier that is associated with the activatable runtime class.
pConfiguration : [var] A pointer to an optional IPropertySet object, which is used to configure the Windows Runtime class. This parameter can be NULL.
riid : [var] The interface identifier (IID) of the interface being requested. The activation object created  by this function supports the following interfaces:
ppvObject : [var] Receives a pointer to the requested interface. The caller must release the interface.
%inst
Creates an activation object for a Windows Runtime class.

[戻り値]
If this function succeeds, it returns S_OK. Otherwise, it returns an
HRESULT error code.

[備考]
To create the Windows Runtime object, call
IMFActivate::ActivateObject or IClassFactory::CreateInstance.


%index
MFCreateMediaType
Creates an empty media type.
%group
Win32 mfplat
%prm
ppMFType
ppMFType : [var] Receives a pointer to the IMFMediaType interface. The caller must release the interface.
%inst
Creates an empty media type.

[戻り値]
If this function succeeds, it returns S_OK. Otherwise, it returns an
HRESULT error code.

[備考]
The media type is created without any attributes.


%index
MFCreateMediaTypeFromProperties
Create an IMFMediaType from properties.
%group
Win32 mfplat
%prm
punkStream, ppMediaType
punkStream : [var] A pointer to properties.
ppMediaType : [var] Receives a pointer to the IMFMediaType. The caller must release the interface.
%inst
Create an IMFMediaType from properties.

[戻り値]
If this function succeeds, it returns S_OK. Otherwise, it returns an
HRESULT error code.


%index
MFCreateMediaTypeFromRepresentation
Creates a Media Foundation media type from another format representation.
%group
Win32 mfplat
%prm
guidRepresentation, pvRepresentation, ppIMediaType
guidRepresentation : [int] GUID that specifies which format representation to convert. The following value is defined.
pvRepresentation : [intptr] Pointer to a buffer that contains the format representation to convert. The layout of the buffer depends on the value of guidRepresentation.
ppIMediaType : [var] Receives a pointer to the IMFMediaType interface. The caller must release the interface.
%inst
Creates a Media Foundation media type from another format
representation.

[戻り値]
The function returns an HRESULT. Possible values include, but are not
limited to, those in the following table.
This doc was truncated.

[備考]
If the original format is a DirectShow audio media type, and the
format type is not recognized, the function sets the following
attributes on the converted media type.
This doc was truncated.


%index
MFCreateMemoryBuffer
Allocates system memory and creates a media buffer to manage it.
%group
Win32 mfplat
%prm
cbMaxLength, ppBuffer
cbMaxLength : [int] Size of the buffer, in bytes.
ppBuffer : [var] Receives a pointer to the IMFMediaBuffer interface of the media buffer. The caller must release the interface.
%inst
Allocates system memory and creates a media buffer to manage it.

[戻り値]
The function returns an HRESULT. Possible values include, but are not
limited to, those in the following table.
This doc was truncated.

[備考]
The function allocates a buffer with a 1-byte memory alignment. To
allocate a buffer that is aligned to a larger memory boundary, call
MFCreateAlignedMemoryBuffer. When the media buffer object is
destroyed, it releases the allocated memory. This function is
available on the following platforms if the Windows Media Format 11
SDK redistributable components are installed:
This doc was truncated.


%index
MFCreateMuxStreamAttributes
Creates an IMFAttributes describing the content of multiplexed substreams.
%group
Win32 mfplat
%prm
pAttributesToMux, ppMuxAttribs
pAttributesToMux : [var] The collection containing the  IMFAttributes for each multiplexed substream.
ppMuxAttribs : [var] The IMFAttributes containing the attributes for the multiplexed substreams.
%inst
Creates an IMFAttributes describing the content of multiplexed
substreams.

[戻り値]
The function returns an HRESULT. Possible values include, but are not
limited to, those in the following table.
This doc was truncated.


%index
MFCreateMuxStreamMediaType
Creates an IMFMediaType describing the media types of multiplexed substreams.
%group
Win32 mfplat
%prm
pMediaTypesToMux, ppMuxMediaType
pMediaTypesToMux : [var] The collection containing the  IMFMediaType for each multiplexed substream.
ppMuxMediaType : [var] The IMFMediaType containing the media types for the multiplexed substreams.
%inst
Creates an IMFMediaType describing the media types of multiplexed
substreams.

[戻り値]
The function returns an HRESULT. Possible values include, but are not
limited to, those in the following table.
This doc was truncated.


%index
MFCreateMuxStreamSample
Creates an IMFSample containing the samples of multiplexed substreams.
%group
Win32 mfplat
%prm
pSamplesToMux, ppMuxSample
pSamplesToMux : [var] The collection containing the  IMFSample for each multiplexed substream.
ppMuxSample : [var] The IMFSample containing the samples for the multiplexed substreams.
%inst
Creates an IMFSample containing the samples of multiplexed
substreams.

[戻り値]
The function returns an HRESULT. Possible values include, but are not
limited to, those in the following table.
This doc was truncated.


%index
MFCreatePresentationDescriptor
Creates a presentation descriptor.
%group
Win32 mfplat
%prm
cStreamDescriptors, apStreamDescriptors, ppPresentationDescriptor
cStreamDescriptors : [int] Number of elements in the apStreamDescriptors array.
apStreamDescriptors : [var] Array of IMFStreamDescriptor interface pointers. Each pointer represents a stream descriptor for one stream in the presentation.
ppPresentationDescriptor : [var] Receives a pointer to an IMFPresentationDescriptor interface of the presentation descriptor. The caller must release the interface.
%inst
Creates a presentation descriptor.

[戻り値]
If this function succeeds, it returns S_OK. Otherwise, it returns an
HRESULT error code.

[備考]
If you are writing a custom media source, you can use this function
to create the source presentation descriptor. The presentation
descriptor is created with no streams selected. Generally, a media
source should select at least one stream by default. To select a
stream, call IMFPresentationDescriptor::SelectStream.
This function is available on the following platforms if the Windows
Media Format 11 SDK redistributable components are installed:
This doc was truncated.


%index
MFCreatePropertiesFromMediaType
Creates properties from a IMFMediaType.
%group
Win32 mfplat
%prm
pMediaType, riid, ppv
pMediaType : [var] A pointer to the IMFMediaType interface.
riid : [var] The interface identifier (IID) of the interface being requested.
ppv : [var] Receives a pointer to the requested interface. The caller must release the interface.
%inst
Creates properties from a IMFMediaType.

[戻り値]
If this function succeeds, it returns S_OK. Otherwise, it returns an
HRESULT error code.


%index
MFCreateSample
Creates an empty media sample.
%group
Win32 mfplat
%prm
ppIMFSample
ppIMFSample : [var] Receives a pointer to the IMFSample interface of the media sample. The caller must release the interface.
%inst
Creates an empty media sample.

[戻り値]
The function returns an HRESULT. Possible values include, but are not
limited to, those in the following table.
This doc was truncated.

[備考]
Initially the sample does not contain any media buffers. This
function is available on the following platforms if the Windows Media
Format 11 SDK redistributable components are installed:
This doc was truncated.


%index
MFCreateStreamDescriptor
Creates a stream descriptor.
%group
Win32 mfplat
%prm
dwStreamIdentifier, cMediaTypes, apMediaTypes, ppDescriptor
dwStreamIdentifier : [int] Stream identifier.
cMediaTypes : [int] Number of elements in the apMediaTypes array.
apMediaTypes : [var] Pointer to an array of IMFMediaType interface pointers. These pointers are used to initialize the media type handler for the stream descriptor.
ppDescriptor : [var] Receives a pointer to the IMFStreamDescriptor interface of the new stream descriptor. The caller must release the interface.
%inst
Creates a stream descriptor.

[戻り値]
If this function succeeds, it returns S_OK. Otherwise, it returns an
HRESULT error code.

[備考]
If you are writing a custom media source, you can use this function
to create stream descriptors for the source. This function
automatically creates the stream descriptor media type handler and
initializes it with the list of types given in apMediaTypes. The
function does not set the current media type on the handler, however.
To set the type, call IMFMediaTypeHandler::SetCurrentMediaType.
This function is available on the following platforms if the Windows
Media Format 11 SDK redistributable components are installed:
This doc was truncated.


%index
MFCreateStreamOnMFByteStream
Returns an IStream pointer that wraps a Microsoft Media Foundation byte stream.
%group
Win32 mfplat
%prm
pByteStream, ppStream
pByteStream : [var] A pointer to the IMFByteStream interface of the Media Foundation byte stream.
ppStream : [var] Receives a pointer to the IStream interface. The caller must release the interface.
%inst
Returns an IStream pointer that wraps a Microsoft Media Foundation
byte stream.

[戻り値]
If this function succeeds, it returns S_OK. Otherwise, it returns an
HRESULT error code.

[備考]
This function enables an application to pass a Media Foundation byte
stream to an API that takes an IStream pointer.


%index
MFCreateStreamOnMFByteStreamEx
Creates an IRandomAccessStream object that wraps a Microsoft Media Foundation byte stream.
%group
Win32 mfplat
%prm
pByteStream, riid, ppv
pByteStream : [var] A pointer to the IMFByteStream interface of the Media Foundation byte stream.
riid : [var] The interface identifier (IID) of the interface being requested.
ppv : [var] Receives a pointer to the requested interface. The caller must release the interface.
%inst
Creates an IRandomAccessStream object that wraps a Microsoft Media
Foundation byte stream.

[戻り値]
If this function succeeds, it returns S_OK. Otherwise, it returns an
HRESULT error code.

[備考]
The returned byte stream object exposes the IMFGetService interface.
To get the original IMFByteStream pointer, call
IMFGetService::GetService using the service identifier
MF_WRAPPED_OBJECT.


%index
MFCreateSystemTimeSource
Creates a presentation time source that is based on the system time.
%group
Win32 mfplat
%prm
ppSystemTimeSource
ppSystemTimeSource : [var] Receives a pointer to the object's IMFPresentationTimeSource interface. The caller must release the interface.
%inst
Creates a presentation time source that is based on the system time.

[戻り値]
The function returns an HRESULT. Possible values include, but are not
limited to, those in the following table.
This doc was truncated.


%index
MFCreateTempFile
Creates a byte stream that is backed by a temporary local file.
%group
Win32 mfplat
%prm
AccessMode, OpenMode, fFlags, ppIByteStream
AccessMode : [int] The requested access mode, specified as a member of the MF_FILE_ACCESSMODE enumeration.
OpenMode : [int] The behavior of the function if the file already exists or does not exist, specified as a member of the MF_FILE_OPENMODE enumeration.
fFlags : [int] Bitwise OR of values from the MF_FILE_FLAGS enumeration.
ppIByteStream : [var] Receives a pointer to the IMFByteStream interface of the byte stream. The caller must release the interface.
%inst
Creates a byte stream that is backed by a temporary local file.

[戻り値]
If this function succeeds, it returns S_OK. Otherwise, it returns an
HRESULT error code.

[備考]
This function creates a file in the system temporary folder, and then
returns a byte stream object for that file. The full path name of the
file is stored in the MF_BYTESTREAM_ORIGIN_NAME attribute. The file
is created with the FILE_FLAG_DELETE_ON_CLOSE flag, and is deleted
after the byte stream is released. This function is available on the
following platforms if the Windows Media Format 11 SDK
redistributable components are installed:
This doc was truncated.


%index
MFCreateTrackedSample
Creates an IMFTrackedSample object that tracks the reference counts on a video media sample.
%group
Win32 mfplat
%prm
ppMFSample
ppMFSample : [var] Receives a pointer to the IMFTrackedSample interface.
%inst
Creates an IMFTrackedSample object that tracks the reference counts
on a video media sample.


%index
MFCreateTransformActivate
Creates a generic activation object for Media Foundation transforms (MFTs).
%group
Win32 mfplat
%prm
ppActivate
ppActivate : [var] Receives a pointer to the IMFActivate interface. The caller must release the interface.
%inst
Creates a generic activation object for Media Foundation transforms
(MFTs).

[戻り値]
If this function succeeds, it returns S_OK. Otherwise, it returns an
HRESULT error code.

[備考]
Most applications will not use this function; it is used internally
by the MFTEnumEx function. An activation object is a helper object
that creates another object, somewhat similar to a class factory. The
MFCreateTransformActivate function creates an activation object for
MFTs. Before this activation object can create an MFT, the caller
must initialize the activation object by setting one or more
attributes on it.
This doc was truncated.


%index
MFCreateVideoMediaType
Creates a video media type from an MFVIDEOFORMAT structure.
%group
Win32 mfplat
%prm
pVideoFormat, ppIVideoMediaType
pVideoFormat : [var] Pointer to an MFVIDEOFORMAT structure that describes the video format.
ppIVideoMediaType : [var] Receives a pointer to the IMFVideoMediaType interface. The caller must release the interface.
%inst
Creates a video media type from an MFVIDEOFORMAT structure.

[戻り値]
If this function succeeds, it returns S_OK. Otherwise, it returns an
HRESULT error code.

[備考]
Instead of using the MFVIDEOFORMAT structure to initialize a video
media type, you can call MFCreateMediaType and set the media type
attributes directly.
Note Prior to Windows 7, this function was exported from evr.dll.
Starting in Windows 7, this function is exported from mfplat.dll, and
evr.dll exports a stub function that calls into mfplat.dll. For more
information, see Library Changes in Windows 7.


%index
MFCreateVideoMediaTypeFromBitMapInfoHeader
This function is not implemented. (MFCreateVideoMediaTypeFromBitMapInfoHeader)
%group
Win32 mfplat
%prm
pbmihBitMapInfoHeader, dwPixelAspectRatioX, dwPixelAspectRatioY, InterlaceMode, VideoFlags, qwFramesPerSecondNumerator, qwFramesPerSecondDenominator, dwMaxBitRate, ppIVideoMediaType
pbmihBitMapInfoHeader : [var] Reserved.
dwPixelAspectRatioX : [int] Reserved.
dwPixelAspectRatioY : [int] Reserved.
InterlaceMode : [int] Reserved.
VideoFlags : [int64] Reserved.
qwFramesPerSecondNumerator : [int64] Reserved.
qwFramesPerSecondDenominator : [int64] Reserved.
dwMaxBitRate : [int] Reserved.
ppIVideoMediaType : [var] Reserved.
%inst
This function is not implemented.
(MFCreateVideoMediaTypeFromBitMapInfoHeader)

[戻り値]
Returns E_FAIL.

[備考]
Note Prior to Windows 7, this function was exported from evr.dll.
Starting in Windows 7, this function is exported from mfplat.dll, and
evr.dll exports a stub function that calls into mfplat.dll. For more
information, see Library Changes in Windows 7.


%index
MFCreateVideoMediaTypeFromBitMapInfoHeaderEx
Creates a video media type from a BITMAPINFOHEADER structure.
%group
Win32 mfplat
%prm
pbmihBitMapInfoHeader, cbBitMapInfoHeader, dwPixelAspectRatioX, dwPixelAspectRatioY, InterlaceMode, VideoFlags, dwFramesPerSecondNumerator, dwFramesPerSecondDenominator, dwMaxBitRate, ppIVideoMediaType
pbmihBitMapInfoHeader : [var] A pointer to the BITMAPINFOHEADER structure to convert.
cbBitMapInfoHeader : [int] The size of the BITMAPINFOHEADER structure in bytes, including the size of any palette entries or color masks that follow the structure.
dwPixelAspectRatioX : [int] The X dimension of the pixel aspect ratio.
dwPixelAspectRatioY : [int] The Y dimension of the pixel aspect ratio.
InterlaceMode : [int] A member of the MFVideoInterlaceMode enumeration, specifying how the video is interlaced.
VideoFlags : [int64] A bitwise OR of flags from the MFVideoFlags enumeration.
dwFramesPerSecondNumerator : [int] The numerator of the frame rate in frames per second.
dwFramesPerSecondDenominator : [int] The denominator of the frame rate in frames per second
dwMaxBitRate : [int] The approximate data rate of the video stream, in bits per second. If the rate is unknown, set this parameter to zero.
ppIVideoMediaType : [var] Receives a pointer to the IMFVideoMediaType interface. The caller must release the interface.
%inst
Creates a video media type from a BITMAPINFOHEADER structure.

[戻り値]
If the function succeeds, it returns S_OK. Otherwise, it returns an
HRESULT error code.


%index
MFCreateVideoMediaTypeFromSubtype
Creates a partial video media type with a specified subtype.
%group
Win32 mfplat
%prm
pAMSubtype, ppIVideoMediaType
pAMSubtype : [var] Pointer to a GUID that specifies the subtype. See Video Subtype GUIDs.
ppIVideoMediaType : [var] Receives a pointer to the IMFVideoMediaType interface. The caller must release the interface.
%inst
Creates a partial video media type with a specified subtype.

[戻り値]
If this function succeeds, it returns S_OK. Otherwise, it returns an
HRESULT error code.

[備考]
This function creates a media type and sets the major type equal to
MFMediaType_Video and the subtype equal to the value specified in
pAMSubtype.
You can get the same result with the following steps:
This doc was truncated.


%index
MFCreateVideoSampleAllocatorEx
Creates an object that allocates video samples that are compatible with Microsoft DirectX Graphics Infrastructure (DXGI).
%group
Win32 mfplat
%prm
riid, ppSampleAllocator
riid : [var] 
ppSampleAllocator : [var] Receives a pointer to the requested interface. The caller must release the interface.
%inst
Creates an object that allocates video samples that are compatible
with Microsoft DirectX Graphics Infrastructure (DXGI).

[戻り値]
If this function succeeds, it returns S_OK. Otherwise, it returns an
HRESULT error code.

[備考]
This function creates an allocator for DXGI video surfaces. The
buffers created by this allocator expose the IMFDXGIBuffer interface.
To create an allocator for Microsoft Direct3D 9 video surfaces, call
MFCreateVideoSampleAllocator.


%index
MFCreateWICBitmapBuffer
Creates a media buffer object that manages a Windows Imaging Component (WIC).
%group
Win32 mfplat
%prm
riid, punkSurface, ppBuffer
riid : [var] Set this parameter to __uuidof(IWICBitmap).
punkSurface : [var] A pointer to the IUnknown interface of the bitmap surface. The bitmap surface must be a WIC bitmap that exposes the IWICBitmap interface.
ppBuffer : [var] Receives a pointer to the IMFMediaBuffer interface. The caller must release the interface.
%inst
Creates a media buffer object that manages a Windows Imaging
Component (WIC).

[戻り値]
If this function succeeds, it returns S_OK. Otherwise, it returns an
HRESULT error code.


%index
MFCreateWaveFormatExFromMFMediaType
Converts a Media Foundation audio media type to a WAVEFORMATEX structure.
%group
Win32 mfplat
%prm
pMFType, ppWF, pcbSize, Flags
pMFType : [var] Pointer to the IMFMediaType interface of the media type.
ppWF : [var] Receives a pointer to the WAVEFORMATEX structure. The caller must release the memory allocated for the structure by calling CoTaskMemFree.
pcbSize : [var] Receives the size of the WAVEFORMATEX structure.
Flags : [int] Contains a flag from the MFWaveFormatExConvertFlags enumeration.
%inst
Converts a Media Foundation audio media type to a WAVEFORMATEX
structure.

[戻り値]
The function returns an HRESULT. Possible values include, but are not
limited to, those in the following table.
This doc was truncated.

[備考]
If the wFormatTag member of the returned structure is
WAVE_FORMAT_EXTENSIBLE, you can cast the pointer to a
WAVEFORMATEXTENSIBLE structure.


%index
MFDeserializeAttributesFromStream
Loads attributes from a stream into an attribute store.
%group
Win32 mfplat
%prm
pAttr, dwOptions, pStm
pAttr : [var] Pointer to the IMFAttributes interface of the attribute store.
dwOptions : [int] Bitwise OR of zero or more flags from the MF_ATTRIBUTE_SERIALIZE_OPTIONS enumeration.
pStm : [var] Pointer to the IStream interface of the stream from which to read the attributes.
%inst
Loads attributes from a stream into an attribute store.

[戻り値]
The function returns an HRESULT. Possible values include, but are not
limited to, those in the following table.
This doc was truncated.

[備考]
Use this function to deserialize an attribute store that was
serialized with the MFSerializeAttributesToStream function. If
dwOptions contains the MF_ATTRIBUTE_SERIALIZE_UNKNOWN_BYREF flag, the
function deserializes IUnknown pointers from the stream, as follows:
This doc was truncated.


%index
MFDeserializePresentationDescriptor
Deserializes a presentation descriptor from a byte array.
%group
Win32 mfplat
%prm
cbData, pbData, ppPD
cbData : [int] Size of the pbData array, in bytes.
pbData : [var] Pointer to an array of bytes that contains the serialized presentation descriptor.
ppPD : [var] Receives a pointer to the IMFPresentationDescriptor interface of the presentation descriptor. The caller must release the interface.
%inst
Deserializes a presentation descriptor from a byte array.

[戻り値]
The function returns an HRESULT. Possible values include, but are not
limited to, those in the following table.
This doc was truncated.


%index
MFEndCreateFile
Completes an asynchronous request to create a byte stream from a file.
%group
Win32 mfplat
%prm
pResult, ppFile
pResult : [var] Pointer to the IMFAsyncResult interface. Pass in the same pointer that your callback object received in the Invoke method.
ppFile : [var] Receives a pointer to the IMFByteStream interface of the byte stream. The caller must release the interface.
%inst
Completes an asynchronous request to create a byte stream from a
file.

[戻り値]
The function returns an HRESULT. Possible values include, but are not
limited to, those in the following table.
This doc was truncated.

[備考]
Call this function when the MFBeginCreateFile function completes
asynchronously.


%index
MFFrameRateToAverageTimePerFrame
Converts a video frame rate into a frame duration.
%group
Win32 mfplat
%prm
unNumerator, unDenominator, punAverageTimePerFrame
unNumerator : [int] The numerator of the frame rate.
unDenominator : [int] The denominator of the frame rate.
punAverageTimePerFrame : [var] Receives the average duration of a video frame, in 100-nanosecond units.
%inst
Converts a video frame rate into a frame duration.

[戻り値]
If this function succeeds, it returns S_OK. Otherwise, it returns an
HRESULT error code.

[備考]
This function is useful for calculating time stamps on a sample,
given the frame rate. Also, average time per frame is used in the
older VIDEOINFOHEADER and VIDEOINFOHEADER2 format structures. This
function provides a standard conversion so that all components in the
pipeline can use consistent values, if they need to translate between
the older format structures and the media type attributes used in
Media Foundation. For certain common frame rates, the function gets
the frame duration from a look-up table:
This doc was truncated.


%index
MFGetAttributesAsBlob
Converts the contents of an attribute store to a byte array.
%group
Win32 mfplat
%prm
pAttributes, pBuf, cbBufSize
pAttributes : [var] Pointer to the IMFAttributes interface of the attribute store.
pBuf : [var] Pointer to an array that receives the attribute data.
cbBufSize : [int] Size of the pBuf array, in bytes. To get the required size of the buffer, call MFGetAttributesAsBlobSize.
%inst
Converts the contents of an attribute store to a byte array.

[戻り値]
The function returns an HRESULT. Possible values include, but are not
limited to, those in the following table.
This doc was truncated.

[備考]
The function skips any attributes with IUnknown pointer values
(MF_ATTRIBUTE_IUNKNOWN); they are not stored in the array. To convert
the byte array back into an attribute store, call
MFInitAttributesFromBlob. To write an attribute store to a stream,
call the MFSerializeAttributesToStream function.


%index
MFGetAttributesAsBlobSize
Retrieves the size of the buffer needed for the MFGetAttributesAsBlob function.
%group
Win32 mfplat
%prm
pAttributes, pcbBufSize
pAttributes : [var] Pointer to the IMFAttributes interface of the attribute store.
pcbBufSize : [var] Receives the required size of the array, in bytes.
%inst
Retrieves the size of the buffer needed for the MFGetAttributesAsBlob
function.

[戻り値]
The function returns an HRESULT. Possible values include, but are not
limited to, those in the following table.
This doc was truncated.

[備考]
Use this function to find the size of the array that is needed for
the MFGetAttributesAsBlob function.


%index
MFGetContentProtectionSystemCLSID
Gets the class identifier for a content protection system.
%group
Win32 mfplat
%prm
guidProtectionSystemID, pclsid
guidProtectionSystemID : [var] The GUID that identifies the content protection system.
pclsid : [var] Receives the class identifier to the content protection system.
%inst
Gets the class identifier for a content protection system.

[戻り値]
If this function succeeds, it returns S_OK. Otherwise, it returns an
HRESULT error code.

[備考]
The class identifier can be used to create the input trust authority
(ITA) for the content protection system. Call CoCreateInstance or
IMFPMPHost::CreateObjectByCLSID to get an IMFTrustedInput pointer.


%index
MFGetMFTMerit
Gets the merit value of a hardware codec.
%group
Win32 mfplat
%prm
pMFT, cbVerifier, verifier, merit
pMFT : [var] A pointer to the IUnknown interface of the Media Foundation transform (MFT) that represents the codec.
cbVerifier : [int] The size, in bytes, of the verifier array.
verifier : [var] The address of a buffer that contains one of the following:
merit : [var] Receives the merit value.
%inst
Gets the merit value of a hardware codec.

[戻り値]
If this function succeeds, it returns S_OK. Otherwise, it returns an
HRESULT error code.

[備考]
The function fails if the MFT does not represent a hardware device
with a valid Output Protection Manager (OPM) certificate.


%index
MFGetPluginControl
Gets a pointer to the Microsoft Media Foundation plug-in manager.
%group
Win32 mfplat
%prm
ppPluginControl
ppPluginControl : [var] Receives a pointer to the IMFPluginControl interface. The caller must release the interface.
%inst
Gets a pointer to the Microsoft Media Foundation plug-in manager.

[戻り値]
If this function succeeds, it returns S_OK. Otherwise, it returns an
HRESULT error code.


%index
MFGetStrideForBitmapInfoHeader
Calculates the minimum surface stride for a video format.
%group
Win32 mfplat
%prm
format, dwWidth, pStride
format : [int] FOURCC code or D3DFORMAT value that specifies the video format. If you have a video subtype GUID, you can use the first DWORD of the subtype.
dwWidth : [int] Width of the image, in pixels.
pStride : [var] Receives the minimum surface stride, in pixels.
%inst
Calculates the minimum surface stride for a video format.

[戻り値]
If this function succeeds, it returns S_OK. Otherwise, it returns an
HRESULT error code.

[備考]
This function calculates the minimum stride needed to hold the image
in memory. Use this function if you are allocating buffers in system
memory. Surfaces allocated in video memory might require a larger
stride, depending on the graphics card.
If you are working with a DirectX surface buffer, use the
IMF2DBuffer::Lock2D method to find the surface stride.
For planar YUV formats, this function returns the stride for the Y
plane. Depending on the format, the chroma planes might have a
different stride.
Note Prior to Windows 7, this function was exported from evr.dll.
Starting in Windows 7, this function is exported from mfplat.dll, and
evr.dll exports a stub function that calls into mfplat.dll. For more
information, see Library Changes in Windows 7.


%index
MFGetSystemTime
Returns the system time.
%group
Win32 mfplat
%prm

%inst
Returns the system time.

[戻り値]
Returns the system time, in 100-nanosecond units.


%index
MFGetTimerPeriodicity
Retrieves the timer interval for the MFAddPeriodicCallback function.
%group
Win32 mfplat
%prm
Periodicity
Periodicity : [var] Receives the timer interval, in milliseconds.
%inst
Retrieves the timer interval for the MFAddPeriodicCallback function.

[戻り値]
The function returns an HRESULT. Possible values include, but are not
limited to, those in the following table.
This doc was truncated.


%index
MFGetUncompressedVideoFormat
Returns the FOURCC or D3DFORMAT value for an uncompressed video format.
%group
Win32 mfplat
%prm
pVideoFormat
pVideoFormat : [var] Pointer to an MFVIDEOFORMAT structure.
%inst
Returns the FOURCC or D3DFORMAT value for an uncompressed video
format.

[戻り値]
Returns a FOURCC or D3DFORMAT value that identifies the video format.
If the video format is compressed or not recognized, the return value
is D3DFMT_UNKNOWN.

[備考]
Note Prior to Windows 7, this function was exported from evr.dll.
Starting in Windows 7, this function is exported from mfplat.dll, and
evr.dll exports a stub function that calls into mfplat.dll. For more
information, see Library Changes in Windows 7.


%index
MFHeapAlloc
Allocates a block of memory. (MFHeapAlloc)
%group
Win32 mfplat
%prm
nSize, dwFlags, pszFile, line, eat
nSize : [int] Number of bytes to allocate.
dwFlags : [int] Zero or more flags. For a list of valid flags, see HeapAlloc in the Windows SDK documentation.
pszFile : [str] Reserved. Set to NULL.
line : [int] Reserved. Set to zero.
eat : [int] Reserved. Set to eAllocationTypeIgnore.
%inst
Allocates a block of memory. (MFHeapAlloc)

[戻り値]
If the function succeeds, it returns a pointer to the allocated
memory block. If the function fails, it returns NULL.

[備考]
In the current version of Media Foundation, this function is
equivalent to calling the HeapAlloc function and specifying the heap
of the calling process. To free the allocated memory, call
MFHeapFree.


%index
MFHeapFree
Frees a block of memory that was allocated by calling the MFHeapAlloc function.
%group
Win32 mfplat
%prm
pv
pv : [intptr] Pointer to the memory to free.
%inst
Frees a block of memory that was allocated by calling the MFHeapAlloc
function.


%index
MFInitAMMediaTypeFromMFMediaType
Initializes a DirectShow AM_MEDIA_TYPE structure from a Media Foundation media type.
%group
Win32 mfplat
%prm
pMFType, guidFormatBlockType, pAMType
pMFType : [var] Pointer to the IMFMediaType interface of the media type to convert.
guidFormatBlockType : [int] Format type GUID. This value corresponds to the formattype member of the AM_MEDIA_TYPE structure and specifies the type of format block to allocate. If the value is GUID_NULL, the function attempts to deduce the correct format block, based on the major type and subtype.
pAMType : [var] Pointer to an AM_MEDIA_TYPE structure. The function allocates memory for the format block. The caller must release the format block by calling CoTaskMemFree on the pbFormat member.
%inst
Initializes a DirectShow AM_MEDIA_TYPE structure from a Media
Foundation media type.

[戻り値]
The function returns an HRESULT. Possible values include, but are not
limited to, those in the following table.
This doc was truncated.

[備考]
This function can also be used with the following format structures
that are equivalent to AM_MEDIA_TYPE:
This doc was truncated.


%index
MFInitAttributesFromBlob
Initializes the contents of an attribute store from a byte array.
%group
Win32 mfplat
%prm
pAttributes, pBuf, cbBufSize
pAttributes : [var] Pointer to the IMFAttributes interface of the attribute store.
pBuf : [var] Pointer to the array that contains the initialization data.
cbBufSize : [int] Size of the pBuf array, in bytes.
%inst
Initializes the contents of an attribute store from a byte array.

[戻り値]
The function returns an HRESULT. Possible values include, but are not
limited to, those in the following table.
This doc was truncated.

[備考]
Use this function to deserialize an attribute store that was
serialized with the MFGetAttributesAsBlob function. This function
deletes any attributes that were previously stored in pAttributes.


%index
MFInitMediaTypeFromAMMediaType
Initializes a media type from a DirectShow AM_MEDIA_TYPE structure.
%group
Win32 mfplat
%prm
pMFType, pAMType
pMFType : [var] Pointer to the IMFMediaType interface of the media type to initialize. To create the uninitialized media type object, call MFCreateMediaType.
pAMType : [var] Pointer to an AM_MEDIA_TYPE structure that describes the media type. The caller must fill in the structure members before calling this function.
%inst
Initializes a media type from a DirectShow AM_MEDIA_TYPE structure.

[戻り値]
The function returns an HRESULT. Possible values include, but are not
limited to, those in the following table.
This doc was truncated.

[備考]
This function can also be used with the following format structures
that are equivalent to AM_MEDIA_TYPE:
This doc was truncated.


%index
MFInitMediaTypeFromMFVideoFormat
Initializes a media type from an MFVIDEOFORMAT structure.
%group
Win32 mfplat
%prm
pMFType, pMFVF, cbBufSize
pMFType : [var] Pointer to the IMFMediaType interface of the media type to initialize. To create the uninitialized media type object, call MFCreateMediaType.
pMFVF : [var] Pointer to an MFVIDEOFORMAT structure that describes the media type. The caller must fill in the structure members before calling this function.
cbBufSize : [int] Size of the MFVIDEOFORMAT structure, in bytes.
%inst
Initializes a media type from an MFVIDEOFORMAT structure.

[戻り値]
If this function succeeds, it returns S_OK. Otherwise, it returns an
HRESULT error code.


%index
MFInitMediaTypeFromMPEG1VideoInfo
Initializes a media type from a DirectShow MPEG1VIDEOINFO structure.
%group
Win32 mfplat
%prm
pMFType, pMP1VI, cbBufSize, pSubtype
pMFType : [var] Pointer to the IMFMediaType interface of the media type to initialize. To create the uninitialized media type object, call MFCreateMediaType.
pMP1VI : [var] Pointer to a MPEG1VIDEOINFO structure that describes the media type. The caller must fill in the structure members before calling this function.
cbBufSize : [int] Size of the MPEG1VIDEOINFO structure, in bytes.
pSubtype : [var] Pointer to a subtype GUID. This parameter can be NULL. If the subtype GUID is specified, the function uses it to set the media subtype. Otherwise, the function attempts to deduce the subtype from the biCompression field contained in the MPEG1VIDEOINFO structure.
%inst
Initializes a media type from a DirectShow MPEG1VIDEOINFO structure.

[戻り値]
The function returns an HRESULT. Possible values include, but are not
limited to, those in the following table.
This doc was truncated.


%index
MFInitMediaTypeFromMPEG2VideoInfo
Initializes a media type from a DirectShow MPEG2VIDEOINFO structure.
%group
Win32 mfplat
%prm
pMFType, pMP2VI, cbBufSize, pSubtype
pMFType : [var] Pointer to the IMFMediaType interface of the media type to initialize. To create the uninitialized media type object, call MFCreateMediaType.
pMP2VI : [var] Pointer to a MPEG2VIDEOINFO structure that describes the media type. The caller must fill in the structure members before calling this function.
cbBufSize : [int] Size of the MPEG2VIDEOINFO structure, in bytes.
pSubtype : [var] Pointer to a subtype GUID. This parameter can be NULL. If the subtype GUID is specified, the function uses it to set the media subtype. Otherwise, the function attempts to deduce the subtype from the biCompression field contained in the MPEG2VIDEOINFO structure.
%inst
Initializes a media type from a DirectShow MPEG2VIDEOINFO structure.

[戻り値]
The function returns an HRESULT. Possible values include, but are not
limited to, those in the following table.
This doc was truncated.


%index
MFInitMediaTypeFromVideoInfoHeader
Initializes a media type from a DirectShow VIDEOINFOHEADER structure.
%group
Win32 mfplat
%prm
pMFType, pVIH, cbBufSize, pSubtype
pMFType : [var] Pointer to the IMFMediaType interface of the media type to initialize. To create the uninitialized media type object, call MFCreateMediaType.
pVIH : [var] Pointer to a VIDEOINFOHEADER structure that describes the media type. The caller must fill in the structure members before calling this function.
cbBufSize : [int] Size of the VIDEOINFOHEADER structure, in bytes.
pSubtype : [var] Pointer to a subtype GUID. This parameter can be NULL. If the subtype GUID is specified, the function uses it to set the media subtype. Otherwise, the function attempts to deduce the subtype from the biCompression field contained in the VIDEOINFOHEADER structure.
%inst
Initializes a media type from a DirectShow VIDEOINFOHEADER structure.

[戻り値]
If this function succeeds, it returns S_OK. Otherwise, it returns an
HRESULT error code.

[備考]
This function is available on the following platforms if the Windows
Media Format 11 SDK redistributable components are installed:
This doc was truncated.


%index
MFInitMediaTypeFromVideoInfoHeader2
Initializes a media type from a DirectShow VIDEOINFOHEADER2 structure.
%group
Win32 mfplat
%prm
pMFType, pVIH2, cbBufSize, pSubtype
pMFType : [var] Pointer to the IMFMediaType interface of the media type to initialize. To create the uninitialized media type object, call MFCreateMediaType.
pVIH2 : [var] Pointer to a VIDEOINFOHEADER2 structure that describes the media type. The caller must fill in the structure members before calling this function.
cbBufSize : [int] Size of the VIDEOINFOHEADER2 structure, in bytes.
pSubtype : [var] Pointer to a subtype GUID. This parameter can be NULL. If the subtype GUID is specified, the function uses it to set the media subtype. Otherwise, the function attempts to deduce the subtype from the biCompression field contained in the VIDEOINFOHEADER2 structure.
%inst
Initializes a media type from a DirectShow VIDEOINFOHEADER2
structure.

[戻り値]
The function returns an HRESULT. Possible values include, but are not
limited to, those in the following table.
This doc was truncated.


%index
MFInitMediaTypeFromWaveFormatEx
Initializes a media type from a WAVEFORMATEX structure.
%group
Win32 mfplat
%prm
pMFType, pWaveFormat, cbBufSize
pMFType : [var] Pointer to the IMFMediaType interface of the media type to initialize. To create the uninitialized media type object, call MFCreateMediaType.
pWaveFormat : [var] Pointer to a WAVEFORMATEX structure that describes the media type. The caller must fill in the structure members before calling this function.
cbBufSize : [int] Size of the WAVEFORMATEX structure, in bytes.
%inst
Initializes a media type from a WAVEFORMATEX structure.

[戻り値]
The function returns an HRESULT. Possible values include, but are not
limited to, those in the following table.
This doc was truncated.


%index
MFInitVideoFormat
Initializes an MFVIDEOFORMAT structure for a standard video format such as DVD, analog television, or ATSC digital television.
%group
Win32 mfplat
%prm
pVideoFormat, type
pVideoFormat : [var] A pointer to an MFVIDEOFORMAT structure. The function fills in the structure members based on the video format specified in the type parameter.
type : [int] The video format, specified as a member of the MFStandardVideoFormat enumeration.
%inst
Initializes an MFVIDEOFORMAT structure for a standard video format
such as DVD, analog television, or ATSC digital television.

[戻り値]
If this function succeeds, it returns S_OK. Otherwise, it returns an
HRESULT error code.

[備考]
Note Prior to Windows 7, this function was exported from evr.dll.
Starting in Windows 7, this function is exported from mfplat.dll, and
evr.dll exports a stub function that calls into mfplat.dll. For more
information, see Library Changes in Windows 7.


%index
MFInitVideoFormat_RGB
Initializes an MFVIDEOFORMAT structure for an uncompressed RGB video format.
%group
Win32 mfplat
%prm
pVideoFormat, dwWidth, dwHeight, D3Dfmt
pVideoFormat : [var] A pointer to an MFVIDEOFORMAT structure. The functions fills in the structure members with the format information.
dwWidth : [int] The width of the video, in pixels.
dwHeight : [int] The height of the video, in pixels.
D3Dfmt : [int] A D3DFORMAT value that specifies the RGB format.
%inst
Initializes an MFVIDEOFORMAT structure for an uncompressed RGB video
format.

[戻り値]
If this function succeeds, it returns S_OK. Otherwise, it returns an
HRESULT error code.

[備考]
This function fills in some reasonable default values for the
specified RGB format.
Developers are encouraged to use media type attributes instead of
using the MFVIDEOFORMAT structure. See Media Type Attributes.
In general, you should avoid calling this function. If you know all
of the format details, you can fill in the MFVIDEOFORMAT structure
without this function. If you do not know all of the format details,
attributes are preferable to using the MFVIDEOFORMAT structure.
Note Prior to Windows 7, this function was exported from evr.dll.
Starting in Windows 7, this function is exported from mfplat.dll, and
evr.dll exports a stub function that calls into mfplat.dll. For more
information, see Library Changes in Windows 7.


%index
MFIsContentProtectionDeviceSupported
Checks whether a hardware security processor is supported for the specified media protection system.
%group
Win32 mfplat
%prm
ProtectionSystemId, isSupported
ProtectionSystemId : [var] The identifier of the protection system that you want to check.
isSupported : [var] TRUE if the hardware security processor is supported for the specified protection system; otherwise FALSE.
%inst
Checks whether a hardware security processor is supported for the
specified media protection system.


%index
MFLockDXGIDeviceManager
Locks the shared Microsoft DirectX Graphics Infrastructure (DXGI) Device Manager.
%group
Win32 mfplat
%prm
pResetToken, ppManager
pResetToken : [var] Receives a token that identifies this instance of the DXGI Device Manager. Use this token when calling IMFDXGIDeviceManager::ResetDevice. This parameter can be NULL.
ppManager : [var] Receives a pointer to the IMFDXGIDeviceManager interface. The caller must release the interface.
%inst
Locks the shared Microsoft DirectX Graphics Infrastructure (DXGI)
Device Manager.

[戻り値]
If this function succeeds, it returns S_OK. Otherwise, it returns an
HRESULT error code.

[備考]
This function obtains a pointer to a DXGI Device Manager instance
that can be shared between components. The Microsoft Media Foundation
platform creates this instance of the DXGI Device Manager as a
singleton object. Alternatively, you can create a new DXGI Device
Manager by calling MFCreateDXGIDeviceManager. The first time this
function is called, the Media Foundation platform creates the shared
DXGI Device Manager. When you are done use the IMFDXGIDeviceManager
pointer, call the MFUnlockDXGIDeviceManager.


%index
MFMapDX9FormatToDXGIFormat
Converts a Microsoft Direct3D?9 format identifier to a Microsoft DirectX Graphics Infrastructure (DXGI) format identifier.
%group
Win32 mfplat
%prm
dx9
dx9 : [int] The D3DFORMAT value or FOURCC code to convert.
%inst
Converts a Microsoft Direct3D 9 format identifier to a Microsoft
DirectX Graphics Infrastructure (DXGI) format identifier.

[戻り値]
Returns a DXGI_FORMAT value.


%index
MFMapDXGIFormatToDX9Format
Converts a Microsoft DirectX Graphics Infrastructure (DXGI) format identifier to a Microsoft Direct3D?9 format identifier.
%group
Win32 mfplat
%prm
dx11
dx11 : [int] The DXGI_FORMAT value to convert.
%inst
Converts a Microsoft DirectX Graphics Infrastructure (DXGI) format
identifier to a Microsoft Direct3D 9 format identifier.

[戻り値]
Returns a D3DFORMAT value or FOURCC code.


%index
MFPutWorkItem
Puts an asynchronous operation on a work queue. (MFPutWorkItem)
%group
Win32 mfplat
%prm
dwQueue, pCallback, pState
dwQueue : [int] The identifier for the work queue. This value can specify one of the standard Media Foundation work queues, or a work queue created by the application. For list of standard Media Foundation work queues, see Work Queue Identifiers. To create a new work queue, call MFAllocateWorkQueue or MFAllocateWorkQueueEx.
pCallback : [var] A pointer to the IMFAsyncCallback interface. The caller must implement this interface.
pState : [var] A pointer to the IUnknown interface of a state object, defined by the caller. This parameter can be NULL. You can use this object to hold state information. The object is returned to the caller when the callback is invoked.
%inst
Puts an asynchronous operation on a work queue. (MFPutWorkItem)

[戻り値]
Returns an HRESULT value. Possible values include the following.
This doc was truncated.

[備考]
This function creates an asynchronous result object and puts the
result object on the work queue. The work queue calls the
IMFAsyncCallback::Invoke method specified by pCallback.


%index
MFPutWorkItem2
Puts an asynchronous operation on a work queue, with a specified priority. (MFPutWorkItem2)
%group
Win32 mfplat
%prm
dwQueue, Priority, pCallback, pState
dwQueue : [int] The identifier for the work queue. This value can specify one of the standard Media Foundation work queues, or a work queue created by the application. For list of standard Media Foundation work queues, see Work Queue Identifiers. To create a new work queue, call MFAllocateWorkQueue or  MFAllocateWorkQueueEx.
Priority : [int] The priority of the work item. Work items are performed in order of priority.
pCallback : [var] A pointer to the IMFAsyncCallback interface. The caller must implement this interface.
pState : [var] A pointer to the IUnknown interface of a state object, defined by the caller. This parameter can be NULL. You can use this object to hold state information. The object is returned to the caller when the callback is invoked.
%inst
Puts an asynchronous operation on a work queue, with a specified
priority. (MFPutWorkItem2)

[戻り値]
Returns an HRESULT value. Possible values include the following.
This doc was truncated.


%index
MFPutWorkItemEx
Puts an asynchronous operation on a work queue. (MFPutWorkItemEx)
%group
Win32 mfplat
%prm
dwQueue, pResult
dwQueue : [int] The identifier for the work queue. This value can specify one of the standard Media Foundation work queues, or a work queue created by the application. For list of standard Media Foundation work queues, see Work Queue Identifiers. To create a new work queue, call MFAllocateWorkQueue or MFAllocateWorkQueueEx.
pResult : [var] A pointer to the IMFAsyncResult interface of an asynchronous result object. To create the result object, call MFCreateAsyncResult.
%inst
Puts an asynchronous operation on a work queue. (MFPutWorkItemEx)

[戻り値]
Returns an HRESULT value. Possible values include the following.
This doc was truncated.

[備考]
To invoke the work-item, this function passes pResult to the
MFInvokeCallback function. The callback is specified when you create
the result object specified by pResult.
This function is available on the following platforms if the Windows
Media Format 11 SDK redistributable components are installed:
This doc was truncated.


%index
MFPutWorkItemEx2
Puts an asynchronous operation on a work queue, with a specified priority. (MFPutWorkItemEx2)
%group
Win32 mfplat
%prm
dwQueue, Priority, pResult
dwQueue : [int] The identifier for the work queue. This value can specify one of the standard Media Foundation work queues, or a work queue created by the application. For list of standard Media Foundation work queues, see Work Queue Identifiers. To create a new work queue, call MFAllocateWorkQueue or  MFAllocateWorkQueueEx.
Priority : [int] The priority of the work item. This value should be 1, 0, or -1. Items with a value of 1 are executed before items with a value of 0. Items with a value of  -1 are executed after items with a value of 0.
pResult : [var] A pointer to the IMFAsyncResult interface of an asynchronous result object. To create the result object, call MFCreateAsyncResult.
%inst
Puts an asynchronous operation on a work queue, with a specified
priority. (MFPutWorkItemEx2)

[戻り値]
Returns an HRESULT value. Possible values include the following.
This doc was truncated.

[備考]
To invoke the work item, this function passes pResult to the
MFInvokeCallback function. The callback is specified when you create
the result object specified by pResult.


%index
MFRegisterLocalByteStreamHandler
Registers a byte-stream handler in the caller's process.
%group
Win32 mfplat
%prm
szFileExtension, szMimeType, pActivate
szFileExtension : [wstr] A string that contains the file name extension for this handler.
szMimeType : [wstr] A string that contains the MIME type for this handler.
pActivate : [var] A pointer to the IMFActivate interface of an activation object. The caller implements this interface. The IMFActivate::ActivateObject method of the activation object must create a byte-stream handler. The byte-stream handler exposes the IMFByteStreamHandler interface.
%inst
Registers a byte-stream handler in the caller's process.

[戻り値]
If this function succeeds, it returns S_OK. Otherwise, it returns an
HRESULT error code.

[備考]
Byte-stream handlers are used in Microsoft Media Foundation during
the source resolution process, which creates a media source from a
URL. For more information, see Scheme Handlers and Byte-Stream
Handlers. Within a process, local byte-stream handlers take
precedence over byte-stream handlers that are registered in the
registry. Local byte-stream handlers are not visible to other
processes. Use this function if you want to register a custom
byte-stream handler for your application, but do not want the handler
available to other applications. Either szFileExtension or szMimeType
can be NULL; at least one must be non-NULL.


%index
MFRegisterLocalSchemeHandler
Registers a scheme handler in the caller's process.
%group
Win32 mfplat
%prm
szScheme, pActivate
szScheme : [wstr] A string that contains the scheme. The scheme includes the trailing ':' character; for example, "http:".
pActivate : [var] A pointer to the IMFActivate interface of an activation object. The caller implements this interface. The IMFActivate::ActivateObject method of the activation object must create a scheme handler object. The scheme handler exposes the IMFSchemeHandler interface.
%inst
Registers a scheme handler in the caller's process.

[戻り値]
If this function succeeds, it returns S_OK. Otherwise, it returns an
HRESULT error code.

[備考]
Scheme handlers are used in Microsoft Media Foundation during the
source resolution process, which creates a media source from a URL.
For more information, see Scheme Handlers and Byte-Stream Handlers.
Within a process, local scheme handlers take precedence over scheme
handlers that are registered in the registry. Local scheme handlers
are not visible to other processes. Use this function if you want to
register a custom scheme handler for your application, but do not
want the handler available to other applications.


%index
MFScheduleWorkItem
Schedules an asynchronous operation to be completed after a specified interval. (MFScheduleWorkItem)
%group
Win32 mfplat
%prm
pCallback, pState, Timeout, pKey
pCallback : [var] Pointer to the IMFAsyncCallback interface. The caller must implement this interface.
pState : [var] Pointer to the IUnknown interface of a state object, defined by the caller. This parameter can be NULL. You can use this object to hold state information. The object is returned to the caller when the callback is invoked.
Timeout : [int64] Time-out interval, in milliseconds. Set this parameter to a negative value. The callback is invoked after －Timeout milliseconds. For example, if Timeout is －5000, the callback is invoked after 5000 milliseconds.
pKey : [var] Receives a key that can be used to cancel the timer. To cancel the timer, call MFCancelWorkItem and pass this key in the Key parameter.
%inst
Schedules an asynchronous operation to be completed after a specified
interval. (MFScheduleWorkItem)

[戻り値]
The function returns an HRESULT. Possible values include, but are not
limited to, those in the following table.
This doc was truncated.

[備考]
This function creates an asynchronous result object. When the timer
interval elapses, the IMFAsyncCallback::Invoke method specified by
pCallback is called. This function is available on the following
platforms if the Windows Media Format 11 SDK redistributable
components are installed:
This doc was truncated.


%index
MFSerializeAttributesToStream
Writes the contents of an attribute store to a stream.
%group
Win32 mfplat
%prm
pAttr, dwOptions, pStm
pAttr : [var] Pointer to the IMFAttributes interface of the attribute store.
dwOptions : [int] Bitwise OR of zero or more flags from the MF_ATTRIBUTE_SERIALIZE_OPTIONS enumeration.
pStm : [var] Pointer to the IStream interface of the stream where the attributes are saved.
%inst
Writes the contents of an attribute store to a stream.

[戻り値]
The function returns an HRESULT. Possible values include, but are not
limited to, those in the following table.
This doc was truncated.

[備考]
If dwOptions contains the MF_ATTRIBUTE_SERIALIZE_UNKNOWN_BYREF flag,
the function serializes IUnknown pointers in the attribute store, as
follows:
This doc was truncated.


%index
MFSerializePresentationDescriptor
Serializes a presentation descriptor to a byte array.
%group
Win32 mfplat
%prm
pPD, pcbData, ppbData
pPD : [var] Pointer to the IMFPresentationDescriptor interface of the presentation descriptor to serialize.
pcbData : [var] Receives the size of the ppbData array, in bytes.
ppbData : [var] Receives a pointer to an array of bytes containing the serialized presentation descriptor. The caller must free the memory for the array by calling CoTaskMemFree.
%inst
Serializes a presentation descriptor to a byte array.

[戻り値]
The function returns an HRESULT. Possible values include, but are not
limited to, those in the following table.
This doc was truncated.

[備考]
To deserialize the presentation descriptor, pass the byte array to
the MFDeserializePresentationDescriptor function.


%index
MFShutdown
Shuts down the Microsoft Media Foundation platform.
%group
Win32 mfplat
%prm

%inst
Shuts down the Microsoft Media Foundation platform.

[戻り値]
If this function succeeds, it returns S_OK. Otherwise, it returns an
HRESULT error code.

[備考]
**MFShutdown** should be called during should be called during app
uninitialization and not from static destructors during process exit.
This function is available on the following platforms if the Windows
Media Format 11 SDK redistributable components are installed:
This doc was truncated.


%index
MFSplitSample
Split up a combined media sample back into individual samples.
%group
Win32 mfplat
%prm
pSample, pOutputSamples, dwOutputSampleMaxCount, pdwOutputSampleCount
pSample : [var] A pointer to an [IMFSample](../mfobjects/nn-mfobjects-imfsample.md) representing a combined sample to be split.
pOutputSamples : [var] Receives a pointer to an array of output samples from the split operation.
dwOutputSampleMaxCount : [int] The maximum output array size. Call [IMFSample::GetBufferCount](../mfobjects/nf-mfobjects-imfsample-getbuffercount.md) on the sample provided in *pSample* to find out an upper bound.
pdwOutputSampleCount : [var] Output parameter that receives the number of samples contained in the pOutputSamples array.
%inst
Split up a combined media sample back into individual samples.

[備考]
Combine samples by calling
[MFCombineSamples](nf-mfapi-mfsplitsample.md)


%index
MFStartup
Initializes Microsoft Media Foundation.
%group
Win32 mfplat
%prm
Version, dwFlags
Version : [int] Version number. Use the value MF_VERSION, defined in mfapi.h.
dwFlags : [int] This parameter is optional when using C++ but required in C. The value must be one of the following flags:
%inst
Initializes Microsoft Media Foundation.

[戻り値]
The function returns an HRESULT. Possible values include, but are not
limited to, those in the following table.
This doc was truncated.

[備考]
An application must call this function before using Media Foundation.
Before your application quits, call MFShutdown once for every
previous call to MFStartup. **MFStartup** should be called during
should be called during app initialization and not from static
constructors during process initialization. Do not call MFStartup or
MFShutdown from work queue threads. For more information about work
queues, see Work Queues.
This function is available on the following platforms if the Windows
Media Format 11 SDK redistributable components are installed:
This doc was truncated.


%index
MFTEnum
Enumerates Media Foundation transforms (MFTs) in the registry.
%group
Win32 mfplat
%prm
guidCategory, Flags, pInputType, pOutputType, pAttributes, ppclsidMFT, pcMFTs
guidCategory : [int] GUID that specifies the category of MFTs to enumerate. For a list of MFT categories, see MFT_CATEGORY.
Flags : [int] Reserved. Must be zero.
pInputType : [var] Pointer to an MFT_REGISTER_TYPE_INFO structure that specifies an input media type to match. This parameter can be NULL. If NULL, all input types are matched.
pOutputType : [var] Pointer to an MFT_REGISTER_TYPE_INFO structure that specifies an output media type to match. This parameter can be NULL. If NULL, all output types are matched.
pAttributes : [var] Reserved. Set to NULL. Note??Windows?Vista and Windows Server?2008: This parameter can specify a pointer to the IMFAttributes interface of an attribute store. The MFTEnum function matches the attributes in this object against the attributes stored in the registry. (Registry attributes are specified in the pAttributes parameter of the MFTRegister function.) Only MFTs with matching attributes are returned in the enumeration results. ? Note??Windows?7 and later: This parameter is ignored.
ppclsidMFT : [var] Receives a pointer to an array of CLSIDs. To create an MFT from this list, call CoCreateInstance with one of the CLSIDs. To get information about a particular MFT from its CLSID, call MFTGetInfo. The caller must free the memory for the array by calling CoTaskMemFree.
pcMFTs : [var] Receives the number of elements in the ppclsidMFT array. The value can be zero.
%inst
Enumerates Media Foundation transforms (MFTs) in the registry.

[戻り値]
If this function succeeds, it returns S_OK. Otherwise, it returns an
HRESULT error code.

[備考]
This function returns a list of all the MFTs in the specified
category that match the search criteria given by the pInputType,
pOutputType, and pAttributes parameters. Any of those parameters can
be NULL.
If no MFTs match the criteria, the method succeeds but returns the
value zero in pcMFTs.


%index
MFTEnum2
Gets a list of Microsoft Media Foundation transforms (MFTs) that match specified search criteria.
%group
Win32 mfplat
%prm
guidCategory, Flags, pInputType, pOutputType, pAttributes, pppMFTActivate, pnumMFTActivate
guidCategory : [int] A GUID that specifies the category of MFTs to enumerate. For a list of MFT categories, see MFT_CATEGORY.
Flags : [int] The bitwise OR of zero or more flags from the _MFT_ENUM_FLAG enumeration.
pInputType : [var] A pointer to an MFT_REGISTER_TYPE_INFO structure that specifies an input media type to match. This parameter can be NULL. If NULL, all input types are matched.
pOutputType : [var] A pointer to an MFT_REGISTER_TYPE_INFO structure that specifies an output media type to match. This parameter can be NULL. If NULL, all output types are matched.
pAttributes : [var] A pointer to an IMFAttributes interface that enables access to the standard attribute store. To specify a specific hardware adapter for which MFTs are queried, set the  MFT_ENUM_ADAPTER_LUID attribute to the LUID of the adapter. If you do this, you must also specify the MFT_ENUM_FLAG_HARDWARE flag or E_INVALIDARG is returned.
pppMFTActivate : [var] Receives an array of IMFActivate interface pointers. Each pointer represents an activation object for an MFT that matches the search criteria. The function allocates the memory for the array. The caller must release the pointers and call the CoTaskMemFree function to free the memory for the array.
pnumMFTActivate : [var] Receives the number of elements in the pppMFTActivate array. If no MFTs match the search criteria, this parameter receives the value zero.
%inst
Gets a list of Microsoft Media Foundation transforms (MFTs) that
match specified search criteria.

[戻り値]
If the method succeeds, it returns S_OK. If it fails, possible return
codes include, but are not limited to, the values shown in the
following table.
This doc was truncated.

[備考]
The Flags parameter controls which MFTs are enumerated, and the order
in which they are returned. The flags for this parameter fall into
several groups.
The first set of flags specifies how an MFT processes data.
This doc was truncated.


%index
MFTEnumEx
Gets a list of Microsoft Media Foundation transforms (MFTs) that match specified search criteria. This function extends the MFTEnum function.
%group
Win32 mfplat
%prm
guidCategory, Flags, pInputType, pOutputType, pppMFTActivate, pnumMFTActivate
guidCategory : [int] A GUID that specifies the category of MFTs to enumerate. For a list of MFT categories, see MFT_CATEGORY.
Flags : [int] The bitwise OR of zero or more flags from the _MFT_ENUM_FLAG enumeration.
pInputType : [var] A pointer to an MFT_REGISTER_TYPE_INFO structure that specifies an input media type to match. This parameter can be NULL. If NULL, all input types are matched.
pOutputType : [var] A pointer to an MFT_REGISTER_TYPE_INFO structure that specifies an output media type to match. This parameter can be NULL. If NULL, all output types are matched.
pppMFTActivate : [var] Receives an array of IMFActivate interface pointers. Each pointer represents an activation object for an MFT that matches the search criteria. The function allocates the memory for the array. The caller must release the pointers and call the CoTaskMemFree function to free the memory for the array.
pnumMFTActivate : [var] Receives the number of elements in the pppMFTActivate array. If no MFTs match the search criteria, this parameter receives the value zero.
%inst
Gets a list of Microsoft Media Foundation transforms (MFTs) that
match specified search criteria. This function extends the MFTEnum
function.

[戻り値]
If this function succeeds, it returns S_OK. Otherwise, it returns an
HRESULT error code.

[備考]
The Flags parameter controls which MFTs are enumerated, and the order
in which they are returned. The flags for this parameter fall into
several groups.
The first set of flags specifies how an MFT processes data.
This doc was truncated.


%index
MFTGetInfo
Gets information from the registry about a Media Foundation transform (MFT).
%group
Win32 mfplat
%prm
clsidMFT, pszName, ppInputTypes, pcInputTypes, ppOutputTypes, pcOutputTypes, ppAttributes
clsidMFT : [int] The CLSID of the MFT.
pszName : [var] Receives a pointer to a wide-character string containing the friendly name of the MFT. The caller must free the string by calling CoTaskMemFree. This parameter can be NULL.
ppInputTypes : [var] Receives a pointer to an array of MFT_REGISTER_TYPE_INFO structures. Each member of the array describes an input format that the MFT supports. The caller must free the array by calling CoTaskMemFree. This parameter can be NULL.
pcInputTypes : [var] Receives the number of elements in the ppInputTypes array. If ppInputTypes is NULL, this parameter is ignored and can be NULL.
ppOutputTypes : [var] Receives a pointer to an array of MFT_REGISTER_TYPE_INFO structures. Each member of the array describes an output format that the MFT supports. The caller must free the array by calling CoTaskMemFree. This parameter can be NULL.
pcOutputTypes : [var] Receives the number of elements in the ppOutputType array. If ppOutputTypes is NULL, this parameter is ignored and can be NULL.
ppAttributes : [var] Receives a pointer to the IMFAttributes interface of an attribute store. The caller must release the interface. The attribute store might contain attributes that are stored in the registry for the specified MFT. (For more information, see MFTRegister.)  If no attributes are stored in the registry for this MFT, the attribute store is empty. This parameter can be NULL.
%inst
Gets information from the registry about a Media Foundation transform
(MFT).

[戻り値]
If this function succeeds, it returns S_OK. Otherwise, it returns an
HRESULT error code.


%index
MFTRegister
Adds information about a Media Foundation transform (MFT) to the registry.
%group
Win32 mfplat
%prm
clsidMFT, guidCategory, pszName, Flags, cInputTypes, pInputTypes, cOutputTypes, pOutputTypes, pAttributes
clsidMFT : [int] The CLSID of the MFT. The MFT must also be registered as a COM object using the same CLSID.
guidCategory : [int] GUID that specifies the category of the MFT. For a list of MFT categories, see MFT_CATEGORY.
pszName : [wstr] Wide-character string that contains the friendly name of the MFT.
Flags : [int] Bitwise OR of zero or more of the following flags from the _MFT_ENUM_FLAG  enumeration:
cInputTypes : [int] Number of elements in the pInputTypes array.
pInputTypes : [var] Pointer to an array of MFT_REGISTER_TYPE_INFO structures. Each member of the array specifies an input format that the MFT supports.  This parameter can be NULL. This parameter can be NULL. However, if the parameter is NULL, the MFT will be enumerated only when an application specifies NULL for the desired input type.
cOutputTypes : [int] Number of elements in the pOutputTypes array.
pOutputTypes : [var] Pointer to an array of MFT_REGISTER_TYPE_INFO structures. Each member of the array defines an output format that the MFT supports. This parameter can be NULL. However, if the parameter is NULL, the MFT will be enumerated only when an application specifies NULL for the desired output type.
pAttributes : [var] Pointer to the IMFAttributes interface of an attribute store that contains additional registry information. This parameter can be NULL. If the parameter is non-NULL, the attributes are written to the registry as a byte array. You can use the MFTGetInfo function to retrieve the attributes. The following attribute is defined for this parameter:
%inst
Adds information about a Media Foundation transform (MFT) to the
registry.

[戻り値]
If this function succeeds, it returns S_OK. Otherwise, it returns an
HRESULT error code.

[備考]
The registry entries created by this function are read by the
following functions:
This doc was truncated.


%index
MFTRegisterLocal
Registers a Media Foundation transform (MFT) in the caller's process. (MFTRegisterLocal)
%group
Win32 mfplat
%prm
pClassFactory, guidCategory, pszName, Flags, cInputTypes, pInputTypes, cOutputTypes, pOutputTypes
pClassFactory : [var] A pointer to the IClassFactory interface of a class factory object. The class factory creates the MFT.
guidCategory : [var] A GUID that specifies the category of the MFT. For a list of MFT categories, see MFT_CATEGORY.
pszName : [wstr] A wide-character null-terminated string that contains the friendly name of the MFT.
Flags : [int] A bitwise OR of zero or more flags from the _MFT_ENUM_FLAG enumeration.
cInputTypes : [int] The number of elements in the pInputTypes array.
pInputTypes : [var] A pointer to an array of MFT_REGISTER_TYPE_INFO structures. Each member of the array specifies an input format that the MFT supports. This parameter can be NULL if cInputTypes is zero.
cOutputTypes : [int] The number of elements in the pOutputTypes array.
pOutputTypes : [var] A pointer to an array of MFT_REGISTER_TYPE_INFO structures. Each member of the array defines an output format that the MFT supports. This parameter can be NULL if cOutputTypes is zero.
%inst
Registers a Media Foundation transform (MFT) in the caller's process.
(MFTRegisterLocal)

[戻り値]
If this function succeeds, it returns S_OK. Otherwise, it returns an
HRESULT error code.

[備考]
The primary purpose of this function is to make an MFT available for
automatic topology resolution without making the MFT available to
other processes or applications. After you call this function, the
MFT can be enumerated by calling the MFTEnumEx function with the
MFT_ENUM_FLAG_LOCALMFT flag. The MFT can be enumerated from within
the same process, but is not visible to other processes. The
pClassFactory parameter specifies a class factory object that creates
the MFT. The class factory's IClassFactory::CreateInstance method
must return an object that supports the IMFTransform interface. Note
The MFTEnumEx function retrieves a list of IMFActivate pointers.
However, the class factory does not need to support the IMFActivate
interface. Instead, the MFTEnumEx function provides an implementation
of IMFActivate that wraps the class factory. To unregister the MFT
from the current process, call MFTUnregisterLocal. If you need to
register an MFT in the Protected Media Path (PMP) process, use the
IMFLocalMFTRegistration interface.


%index
MFTRegisterLocalByCLSID
Registers a Media Foundation transform (MFT) in the caller's process. (MFTRegisterLocalByCLSID)
%group
Win32 mfplat
%prm
clisdMFT, guidCategory, pszName, Flags, cInputTypes, pInputTypes, cOutputTypes, pOutputTypes
clisdMFT : [var] The class identifier (CLSID) of the MFT.
guidCategory : [var] A GUID that specifies the category of the MFT. For a list of MFT categories, see MFT_CATEGORY.
pszName : [wstr] A wide-character null-terminated string that contains the friendly name of the MFT.
Flags : [int] A bitwise OR of zero or more flags from the _MFT_ENUM_FLAG enumeration.
cInputTypes : [int] The number of elements in the pInputTypes array.
pInputTypes : [var] A pointer to an array of MFT_REGISTER_TYPE_INFO structures. Each member of the array specifies an input format that the MFT supports. This parameter can be NULL if cInputTypes is zero.
cOutputTypes : [int] The number of elements in the pOutputTypes array.
pOutputTypes : [var] A pointer to an array of MFT_REGISTER_TYPE_INFO structures. Each member of the array defines an output format that the MFT supports. This parameter can be NULL if cOutputTypes is zero.
%inst
Registers a Media Foundation transform (MFT) in the caller's process.
(MFTRegisterLocalByCLSID)

[戻り値]
If this function succeeds, it returns S_OK. Otherwise, it returns an
HRESULT error code.

[備考]
The primary purpose of this function is to make an MFT available for
automatic topology resolution without making the MFT available to
other processes or applications. After you call this function, the
MFT can be enumerated by calling the MFTEnumEx function with the
MFT_ENUM_FLAG_LOCALMFT flag. The MFT can be enumerated from within
the same process, but is not visible to other processes. To
unregister the MFT from the current process, call
MFTUnregisterLocalByCLSID. If you need to register an MFT in the
Protected Media Path (PMP) process, use the IMFLocalMFTRegistration
interface.


%index
MFTUnregister
Unregisters a Media Foundation transform (MFT).
%group
Win32 mfplat
%prm
clsidMFT
clsidMFT : [int] The CLSID of the MFT.
%inst
Unregisters a Media Foundation transform (MFT).

[戻り値]
If this function succeeds, it returns S_OK. Otherwise, it returns an
HRESULT error code.

[備考]
This function removes the registry entries created by the MFTRegister
function. It is safe to call MFTUnregister twice with the same CLSID.
If the CLSID is not found in the registry, the function succeeds and
does nothing.


%index
MFTUnregisterLocal
Unregisters one or more Media Foundation transforms (MFTs) from the caller's process.
%group
Win32 mfplat
%prm
pClassFactory
pClassFactory : [var] A pointer to the IClassFactory interface of a class factory object. This parameter can be NULL.
%inst
Unregisters one or more Media Foundation transforms (MFTs) from the
caller's process.

[戻り値]
The function returns an HRESULT. Possible values include, but are not
limited to, those in the following table.
This doc was truncated.

[備考]
Use this function to unregister a local MFT that was previously
registered through the MFTRegisterLocal function. If the
pClassFactory parameter is NULL, all local MFTs in the process are
unregistered. Otherwise, the function unregisters the MFT associated
with the class factory specified by the pClassFactory parameter. In
that case, the pClassFactory parameter should equal a pointer value
that was previously passed to the MFTRegisterLocal function.


%index
MFTUnregisterLocalByCLSID
Unregisters a Media Foundation transform (MFT) from the caller's process.
%group
Win32 mfplat
%prm
clsidMFT
clsidMFT : [int] The class identifier (CLSID) of the MFT.
%inst
Unregisters a Media Foundation transform (MFT) from the caller's
process.

[戻り値]
The function returns an HRESULT. Possible values include, but are not
limited to, those in the following table.
This doc was truncated.

[備考]
Use this function to unregister a local MFT that was previously
registered through the MFTRegisterLocalByCLSID function.


%index
MFUnlockDXGIDeviceManager
Unlocks the shared Microsoft DirectX Graphics Infrastructure (DXGI) Device Manager.
%group
Win32 mfplat
%prm

%inst
Unlocks the shared Microsoft DirectX Graphics Infrastructure (DXGI)
Device Manager.

[戻り値]
If this function succeeds, it returns S_OK. Otherwise, it returns an
HRESULT error code.

[備考]
Call this function after a successful call to the
MFLockDXGIDeviceManager function.


%index
MFUnwrapMediaType
Retrieves a media type that was wrapped in another media type by the MFWrapMediaType function.
%group
Win32 mfplat
%prm
pWrap, ppOrig
pWrap : [var] Pointer to the IMFMediaType interface of the media type that was retrieved by MFWrapMediaType.
ppOrig : [var] Receives a pointer to the IMFMediaType interface of the original media type. The caller must release the interface.
%inst
Retrieves a media type that was wrapped in another media type by the
MFWrapMediaType function.

[戻り値]
If this function succeeds, it returns S_OK. Otherwise, it returns an
HRESULT error code.

[備考]
This function is available on the following platforms if the Windows
Media Format 11 SDK redistributable components are installed:
This doc was truncated.


%index
MFValidateMediaTypeSize
Validates the size of a buffer for a video format block.
%group
Win32 mfplat
%prm
FormatType, pBlock, cbSize
FormatType : [int] 
pBlock : [var] Pointer to a buffer that contains the format block.
cbSize : [int] Size of the pBlock buffer, in bytes.
%inst
Validates the size of a buffer for a video format block.

[戻り値]
The function returns an HRESULT. Possible values include, but are not
limited to, those in the following table.
This doc was truncated.

[備考]
This function is available on the following platforms if the Windows
Media Format 11 SDK redistributable components are installed:
This doc was truncated.


%index
MFWrapMediaType
Creates a media type that wraps another media type.
%group
Win32 mfplat
%prm
pOrig, MajorType, SubType, ppWrap
pOrig : [var] A pointer to the IMFMediaType interface of the media type to wrap in a new media type.
MajorType : [var] A GUID that specifies the major type for the new media type. For a list of possible values, see Major Media Types.
SubType : [var] A GUID that specifies the subtype for the new media type. For possible values, see:
ppWrap : [var] Receives a pointer to the IMFMediaType interface of the new media type that wraps the original media type. The caller must release the interface.
%inst
Creates a media type that wraps another media type.

[戻り値]
If this function succeeds, it returns S_OK. Otherwise, it returns an
HRESULT error code.

[備考]
The original media type (pOrig) is stored in the new media type under
the MF_MT_WRAPPED_TYPE attribute. To extract the original media type,
call MFUnwrapMediaType.
This function is available on the following platforms if the Windows
Media Format 11 SDK redistributable components are installed:
This doc was truncated.


%index
MFllMulDiv
Calculates ((a * b) + d) / c, where each term is a 64-bit signed value.
%group
Win32 mfplat
%prm
a, b, c, d
a : [int64] A multiplier.
b : [int64] Another multiplier.
c : [int64] The divisor.
d : [int64] The rounding factor.
%inst
Calculates ((a * b) + d) / c, where each term is a 64-bit signed
value.

[戻り値]
Returns the result of the calculation. If numeric overflow occurs,
the function returns _I64_MAX (positive overflow) or LLONG_MIN
(negative overflow). If Mfplat.dll cannot be loaded, the function
returns _I64_MAX.

[備考]
Note A previous version of this topic described the parameters
incorrectly. The divisor is c and the rounding factor is d.

