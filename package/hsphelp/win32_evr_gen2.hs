; ============================================================
;   evr.dll ヘルプ (CsWin32 / win32metadata から自動抽出)
;   docs_ja.json に日本語訳があればそちらを使用、無ければ英語原文。
;   翻訳を追加するときは docs_ja.json を編集して再生成。
; ============================================================

%index
MFGetPlaneSize
Retrieves the image size, in bytes, for an uncompressed video format. (MFGetPlaneSize)
%group
Win32 evr
%prm
format, dwWidth, dwHeight, pdwPlaneSize
format : [int] FOURCC code or D3DFORMAT value that specifies the video format.
dwWidth : [int] Width of the image, in pixels.
dwHeight : [int] Height of the image, in pixels.
pdwPlaneSize : [var] Receives the size of one frame, in bytes. If the format is compressed or is not recognized, this value is zero.
%inst
Retrieves the image size, in bytes, for an uncompressed video format.
(MFGetPlaneSize)

[戻り値]
The function returns an HRESULT. Possible values include, but are not
limited to, those in the following table.
This doc was truncated.

[備考]
This function is equivalent to the MFCalculateImageSize function.
Note Prior to Windows 7, this function was exported from evr.dll.
Starting in Windows 7, this function is exported from mfplat.dll, and
evr.dll exports a stub function that calls into mfplat.dll.


%index
MFCreateVideoMixer
Creates the default video mixer for the enhanced video renderer (EVR).
%group
Win32 evr
%prm
pOwner, riidDevice, riid, ppv
pOwner : [var] Pointer to the owner of this object. If the object is aggregated, pass a pointer to the aggregating object's IUnknown interface. Otherwise, set this parameter to NULL.
riidDevice : [var] Interface identifier (IID) of the video device interface that will be used for processing the video. Currently the only supported value is IID_IDirect3DDevice9.
riid : [var] IID of the requested interface on the video mixer.  The video mixer exposes the IMFTransform interface.
ppv : [var] Receives a pointer to the requested interface. The caller must release the interface.
%inst
Creates the default video mixer for the enhanced video renderer
(EVR).

[戻り値]
The function returns an HRESULT. Possible values include, but are not
limited to, those in the following table.
This doc was truncated.


%index
MFCreateVideoMixerAndPresenter
Creates the default video mixer and video presenter for the enhanced video renderer (EVR).
%group
Win32 evr
%prm
pMixerOwner, pPresenterOwner, riidMixer, ppvVideoMixer, riidPresenter, ppvVideoPresenter
pMixerOwner : [var] Pointer to the owner of the video mixer. If the mixer is aggregated, pass a pointer to the aggregating object's IUnknown interface. Otherwise, set this parameter to NULL.
pPresenterOwner : [var] Pointer to the owner of the video presenter. If the presenter is aggregated, pass a pointer to the aggregating object's IUnknown interface. Otherwise, set this parameter to NULL.
riidMixer : [var] Interface identifier (IID) of the requested interface on the video mixer. The video mixer exposes the IMFTransform interface.
ppvVideoMixer : [var] Receives a pointer to the requested interface on the video mixer. The caller must release the interface.
riidPresenter : [var] IID of the requested interface on the video presenter. The video presenter exposes the IMFVideoPresenter interface.
ppvVideoPresenter : [var] Receives a pointer to the requested interface on the video presenter. The caller must release the interface.
%inst
Creates the default video mixer and video presenter for the enhanced
video renderer (EVR).

[戻り値]
The function returns an HRESULT. Possible values include, but are not
limited to, those in the following table.
This doc was truncated.


%index
MFCreateVideoPresenter
Creates the default video presenter for the enhanced video renderer (EVR).
%group
Win32 evr
%prm
pOwner, riidDevice, riid, ppVideoPresenter
pOwner : [var] Pointer to the owner of the object. If the object is aggregated, pass a pointer to the aggregating object's IUnknown interface. Otherwise, set this parameter to NULL.
riidDevice : [var] Interface identifier (IID) of the video device interface that will be used for processing the video. Currently the only supported value is IID_IDirect3DDevice9.
riid : [var] IID of the requested interface on the video presenter. The video presenter exposes the IMFVideoPresenter interface.
ppVideoPresenter : [var] Receives a pointer to the requested interface on the video presenter. The caller must release the interface.
%inst
Creates the default video presenter for the enhanced video renderer
(EVR).

[戻り値]
The function returns an HRESULT. Possible values include, but are not
limited to, those in the following table.
This doc was truncated.


%index
MFCreateVideoSampleAllocator
Creates an object that allocates video samples.
%group
Win32 evr
%prm
riid, ppSampleAllocator
riid : [var] 
ppSampleAllocator : [var] Receives a pointer to the requested interface. The caller must release the interface.
%inst
Creates an object that allocates video samples.

[戻り値]
If the function succeeds, it returns S_OK. Otherwise, it returns an
HRESULT error code.


%index
MFCreateVideoSampleFromSurface
Creates a media sample that manages a Direct3D surface.
%group
Win32 evr
%prm
pUnkSurface, ppSample
pUnkSurface : [var] A pointer to the IUnknown interface of the Direct3D surface. This parameter can be NULL.
ppSample : [var] Receives a pointer to the sample's IMFSample interface. The caller must release the interface.
%inst
Creates a media sample that manages a Direct3D surface.

[戻り値]
If this callback function succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.

[備考]
The media sample created by this function exposes the following
interfaces in addition to IMFSample:
This doc was truncated.


%index
MFIsFormatYUV
Queries whether a FOURCC code or D3DFORMAT value is a YUV format.
%group
Win32 evr
%prm
Format
Format : [int] FOURCC code or D3DFORMAT value.
%inst
Queries whether a FOURCC code or D3DFORMAT value is a YUV format.

[戻り値]
The function returns one of the following values.
This doc was truncated.

[備考]
This function checks whether Format specifies a YUV format. Not every
YUV format is recognized by this function. However, if a YUV format
is not recognized by this function, it is probably not supported for
video rendering or DirectX video acceleration (DXVA).

