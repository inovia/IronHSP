; ============================================================
;   mf.dll ヘルプ (CsWin32 / win32metadata から自動抽出)
;   docs_ja.json に日本語訳があればそちらを使用、無ければ英語原文。
;   翻訳を追加するときは docs_ja.json を編集して再生成。
; ============================================================

%index
MFCreate3GPMediaSink
Creates a media sink for authoring 3GP files.
%group
Win32 mf
%prm
pIByteStream, pVideoMediaType, pAudioMediaType, ppIMediaSink
pIByteStream : [var] A pointer to the IMFByteStream interface of a byte stream.  The media sink writes the 3GP file to this byte stream. The byte stream must be writable and support seeking.
pVideoMediaType : [var] A pointer to the IMFMediaType interface of a video media type. This type specifies the format of the video stream. This parameter can be NULL, but not if pAudioMediaType is NULL.
pAudioMediaType : [var] A pointer to the IMFMediaType interface of an audio media type. This type specifies the format of the audio stream. This parameter can be NULL, but not if pVideoMediaType is NULL.
ppIMediaSink : [var] Receives a pointer to the 3GP media sink's IMFMediaSink interface. The caller must release the interface.
%inst
Creates a media sink for authoring 3GP files.

[戻り値]
If this function succeeds, it returns S_OK. Otherwise, it returns an
HRESULT error code.

[備考]
The 3GP media sink supports a maximum of one video stream and one
audio stream. The initial stream formats are given in the
pVideoMediaType and pAudioMediaType parameters. To create an MP4 file
with one stream, set the other stream type to NULL. For example, to
create an audio-only file, set pVideoMediaType to NULL. The number of
streams is fixed when you create the media sink. The sink does not
support the IMFMediaSink::AddStreamSink method. To author MP4 files,
use the MFCreateMPEG4MediaSink function.


%index
MFCreateAC3MediaSink
Creates an instance of the AC-3 media sink.
%group
Win32 mf
%prm
pTargetByteStream, pAudioMediaType, ppMediaSink
pTargetByteStream : [var] A pointer to the IMFByteStream interface of a byte stream. The media sink writes the AC-3 file to this byte stream. The byte stream must be writable.
pAudioMediaType : [var] A pointer to the IMFMediaType interface. This parameter specifies the media type for the AC-3 audio stream. The media type must contain the following attributes.
ppMediaSink : [var] Receives a pointer to the IMFMediaSink interface. The caller must release the interface.
%inst
Creates an instance of the AC-3 media sink.

[戻り値]
If this function succeeds, it returns S_OK. Otherwise, it returns an
HRESULT error code.

[備考]
The AC-3 media sink takes compressed AC-3 audio as input and writes
the audio to the byte stream without modification. The primary use
for this media sink is to stream AC-3 audio over a network. The media
sink does not perform AC-3 audio encoding.


%index
MFCreateADTSMediaSink
Creates an instance of the audio data transport stream (ADTS) media sink.
%group
Win32 mf
%prm
pTargetByteStream, pAudioMediaType, ppMediaSink
pTargetByteStream : [var] A pointer to the IMFByteStream interface of a byte stream. The media sink writes the ADTS stream to this byte stream. The byte stream must be writable.
pAudioMediaType : [var] A pointer to the IMFMediaType interface. This parameter specifies the media type for the ADTS stream. The media type must contain the following attributes.
ppMediaSink : [var] Receives a pointer to the IMFMediaSink interface. The caller must release the interface.
%inst
Creates an instance of the audio data transport stream (ADTS) media
sink.

[戻り値]
If this function succeeds, it returns S_OK. Otherwise, it returns an
HRESULT error code.

[備考]
The ADTS media sink converts Advanced Audio Coding (AAC) audio
packets into an ADTS stream. The primary use for this media sink is
to stream ADTS over a network. The output is not an audio file, but a
stream of audio frames with ADTS headers. The media sink can accept
raw AAC frames (MF_MT_AAC_PAYLOAD_TYPE = 0) or ADTS packets
(MF_MT_AAC_PAYLOAD_TYPE = 1). If the input is raw AAC, the media sink
inserts an ADTS header at the start of each audio frame. If the input
is ADTS packets, the media sink passes the packets through to the
byte stream, without modification.


%index
MFCreateASFContentInfo
Creates the ASF Header Object object.
%group
Win32 mf
%prm
ppIContentInfo
ppIContentInfo : [var] Receives a pointer to the IMFASFContentInfo interface. The caller must release the interface.
%inst
Creates the ASF Header Object object.

[戻り値]
The function returns an HRESULT. Possible values include, but are not
limited to, those in the following table.
This doc was truncated.


%index
MFCreateASFIndexer
Creates the ASF Indexer object.
%group
Win32 mf
%prm
ppIIndexer
ppIIndexer : [var] Receives a pointer to the IMFASFIndexer interface. The caller must release the interface.
%inst
Creates the ASF Indexer object.

[戻り値]
The function returns an HRESULT. Possible values include, but are not
limited to, those in the following table.
This doc was truncated.


%index
MFCreateASFIndexerByteStream
Creates a byte stream to access the index in an ASF stream.
%group
Win32 mf
%prm
pIContentByteStream, cbIndexStartOffset, pIIndexByteStream
pIContentByteStream : [var] Pointer to the IMFByteStream interface of a byte stream that contains the ASF stream.
cbIndexStartOffset : [int64] Byte offset of the index within the ASF stream. To get this value, call IMFASFIndexer::GetIndexPosition.
pIIndexByteStream : [var] Receives a pointer to the IMFByteStream interface. Use this interface to read from the index or write to the index. The caller must release the interface.
%inst
Creates a byte stream to access the index in an ASF stream.

[戻り値]
The function returns an HRESULT. Possible values include, but are not
limited to, those in the following table:
This doc was truncated.


%index
MFCreateASFMediaSink
Creates the ASF media sink.
%group
Win32 mf
%prm
pIByteStream, ppIMediaSink
pIByteStream : [var] Pointer to a byte stream that will be used to write the ASF stream.
ppIMediaSink : [var] Receives a pointer to the IMFMediaSink interface. The caller must release the interface.
%inst
Creates the ASF media sink.

[戻り値]
The function returns an HRESULT. Possible values include, but are not
limited to, those in the following table.
This doc was truncated.


%index
MFCreateASFMediaSinkActivate
Creates an activation object that can be used to create the ASF media sink.
%group
Win32 mf
%prm
pwszFileName, pContentInfo, ppIActivate
pwszFileName : [wstr] Null-terminated wide-character string that contains the output file name.
pContentInfo : [var] A pointer to the IMFASFContentInfo interface of an initialized ASF Header Object object. Use this interface to configure the ASF media sink.
ppIActivate : [var] Receives a pointer to the IMFActivate interface. The caller must release the interface.
%inst
Creates an activation object that can be used to create the ASF media
sink.

[戻り値]
The function returns an HRESULT. Possible values include, but are not
limited to, those in the following table.
This doc was truncated.


%index
MFCreateASFMultiplexer
Creates the ASF Multiplexer.
%group
Win32 mf
%prm
ppIMultiplexer
ppIMultiplexer : [var] Receives a pointer to the IMFASFMultiplexer interface. The caller must release the interface.
%inst
Creates the ASF Multiplexer.

[戻り値]
The function returns an HRESULT. Possible values include, but are not
limited to, those in the following table.
This doc was truncated.


%index
MFCreateASFProfile
Creates the ASF profile object.
%group
Win32 mf
%prm
ppIProfile
ppIProfile : [var] Receives a pointer to the IMFASFProfile interface. The caller must release the interface.
%inst
Creates the ASF profile object.

[戻り値]
The function returns an HRESULT. Possible values include, but are not
limited to, those in the following table.
This doc was truncated.


%index
MFCreateASFProfileFromPresentationDescriptor
Creates an ASF profile object from a presentation descriptor.
%group
Win32 mf
%prm
pIPD, ppIProfile
pIPD : [var] Pointer to the IMFPresentationDescriptor interface of the presentation descriptor that contains the profile information.
ppIProfile : [var] Receives a pointer to the IMFASFProfile interface. The caller must release the interface.
%inst
Creates an ASF profile object from a presentation descriptor.

[戻り値]
The function returns an HRESULT. Possible values include, but are not
limited to, those in the following table.
This doc was truncated.


%index
MFCreateASFSplitter
Creates the ASF Splitter.
%group
Win32 mf
%prm
ppISplitter
ppISplitter : [var] Receives a pointer to the IMFASFSplitter interface. The caller must release the interface.
%inst
Creates the ASF Splitter.

[戻り値]
The function returns an HRESULT. Possible values include, but are not
limited to, those in the following table.
This doc was truncated.


%index
MFCreateASFStreamSelector
Creates the ASF stream selector.
%group
Win32 mf
%prm
pIASFProfile, ppSelector
pIASFProfile : [var] Pointer to the IMFASFProfile interface.
ppSelector : [var] Receives a pointer to the IMFASFStreamSelector interface. The caller must release the interface.
%inst
Creates the ASF stream selector.

[戻り値]
The function returns an HRESULT. Possible values include, but are not
limited to, those in the following table.
This doc was truncated.


%index
MFCreateASFStreamingMediaSink
Creates an activation object for the ASF streaming sink. (MFCreateASFStreamingMediaSink)
%group
Win32 mf
%prm
pIByteStream, ppIMediaSink
pIByteStream : [var] A pointer to a byte stream object in which the ASF media sink writes the streamed content.
ppIMediaSink : [var] Receives a pointer to the IMFMediaSink interface of the ASF streaming-media sink object. To create the media sink, the application must call IMFActivate::ActivateObject on the received pointer. The caller must release the interface pointer.
%inst
Creates an activation object for the ASF streaming sink.
(MFCreateASFStreamingMediaSink)

[戻り値]
If this function succeeds, it returns S_OK. Otherwise, it returns an
HRESULT error code.

[備考]
To create the ASF streaming sink in another process, call
MFCreateASFStreamingMediaSinkActivate.
An application can get a pointer to the ASF ContentInfo Object by
calling IUnknown::QueryInterface on the media sink object received in
the ppIMediaSink parameter. The ContentInfo object is used to set the
encoder configuration settings, provide stream properties supplied by
an ASF profile, and add metadata information. These configuration
settings populate the various ASF header objects of the encoded ASF
file. For more information, see Setting Properties in the ContentInfo
Object.


%index
MFCreateASFStreamingMediaSinkActivate
Creates an activation object for the ASF streaming sink. (MFCreateASFStreamingMediaSinkActivate)
%group
Win32 mf
%prm
pByteStreamActivate, pContentInfo, ppIActivate
pByteStreamActivate : [var] A pointer to the  IMFActivate interface of an activation object. The caller  implements this interface.  The IMFActivate::ActivateObject method of the activation object must create a byte-stream object. The byte stream exposes the IMFByteStream interface. The ASF streaming sink will write data to this byte stream.
pContentInfo : [var] A pointer to an ASF ContentInfo Object that contains the properties that describe the ASF content. These  settings can contain  stream settings, encoding properties, and metadata. For more information about these properties, see Setting Properties in the ContentInfo Object.
ppIActivate : [var] Receives a pointer to the IMFActivate interface of the activation object that is used to create the ASF streaming-media sink. To create the media sink, the application must call IMFActivate::ActivateObject by using the received pointer. The ActivateObject method also calls   IMFActivate::Activate on the byte stream activate object specified by  pByteStreamActivate, to create it so that the media sink can write streamed content in the byte stream. The caller must release the IMFActivate interface pointer of the media sink activation object received in ppIActivate.
%inst
Creates an activation object for the ASF streaming sink.
(MFCreateASFStreamingMediaSinkActivate)

[戻り値]
If this function succeeds, it returns S_OK. Otherwise, it returns an
HRESULT error code.

[備考]
Starting in Windows 7, Media Foundation provides an ASF streaming
sink that writes the content in a live streaming scenario. This
function should be used in secure transcode scenarios where this
media sink needs to be created and configured in the remote process.
Like the ASF file sink, the new media sink performs ASF related tasks
such as writing the ASF header, generating data packets (muxing). The
content is written to a caller-implemented byte stream such as an
HTTP byte stream. The caller must also provide an activation object
that media sink can use to create the byte stream remotely. In
addition, it performs transcryption for streaming protected content.
It hosts the Windows Media Digital Rights Management (DRM) for
Network Devices Output Trust Authority (OTA) that handles the license
request and response. For more information, see IMFDRMNetHelper
interface. The new media sink does not perform any time adjustments.
If the clock seeks, the timestamps are not changed.


%index
MFCreateCredentialCache
Creates a credential cache object. An application can use this object to implement a custom credential manager.
%group
Win32 mf
%prm
ppCache
ppCache : [var] Receives a pointer to the IMFNetCredentialCache interface of the new credential cache object. The caller must release the interface.
%inst
Creates a credential cache object. An application can use this object
to implement a custom credential manager.

[戻り値]
The function returns an HRESULT. Possible values include, but are not
limited to, those in the following table.
This doc was truncated.


%index
MFCreateFMPEG4MediaSink
Creates a media sink for authoring fragmented MP4 files.
%group
Win32 mf
%prm
pIByteStream, pVideoMediaType, pAudioMediaType, ppIMediaSink
pIByteStream : [var] A pointer to the IMFByteStream interface of a byte stream.  The media sink writes the MP4 file to this byte stream. The byte stream must be writable and support seeking.
pVideoMediaType : [var] A pointer to the IMFMediaType interface of a video media type. This type specifies the format of the video stream. This parameter can be NULL, but not if pAudioMediaType is NULL.
pAudioMediaType : [var] A pointer to the IMFMediaType interface of an audio media type. This type specifies the format of the audio stream. This parameter can be NULL, but not if pVideoMediaType is NULL.
ppIMediaSink : [var] Receives a pointer to the MP4 media sink's IMFMediaSink interface. The caller must release the interface.
%inst
Creates a media sink for authoring fragmented MP4 files.

[戻り値]
If this function succeeds, it returns S_OK. Otherwise, it returns an
HRESULT error code.


%index
MFCreateMP3MediaSink
Creates the MP3 media sink.
%group
Win32 mf
%prm
pTargetByteStream, ppMediaSink
pTargetByteStream : [var] A pointer to the IMFByteStream interface of a byte stream.  The media sink writes the MP3 file to this byte stream. The byte stream must be writable.
ppMediaSink : [var] Receives a pointer to the IMFMediaSink interface of the MP3 media sink.. The caller must release the interface.
%inst
Creates the MP3 media sink.

[戻り値]
If this function succeeds, it returns S_OK. Otherwise, it returns an
HRESULT error code.

[備考]
The MP3 media sink takes compressed MP3 audio samples as input, and
writes an MP3 file with ID3 headers as output. The MP3 media sink
does not perform MP3 audio encoding.


%index
MFCreateMPEG4MediaSink
Creates a media sink for authoring MP4 files.
%group
Win32 mf
%prm
pIByteStream, pVideoMediaType, pAudioMediaType, ppIMediaSink
pIByteStream : [var] A pointer to the IMFByteStream interface of a byte stream.  The media sink writes the MP4 file to this byte stream. The byte stream must be writable and support seeking.
pVideoMediaType : [var] A pointer to the IMFMediaType interface of a video media type. This type specifies the format of the video stream. This parameter can be NULL, but not if pAudioMediaType is NULL.
pAudioMediaType : [var] A pointer to the IMFMediaType interface of an audio media type. This type specifies the format of the audio stream. This parameter can be NULL, but not if pVideoMediaType is NULL.
ppIMediaSink : [var] Receives a pointer to the MP4 media sink's IMFMediaSink interface. The caller must release the interface.
%inst
Creates a media sink for authoring MP4 files.

[戻り値]
If this function succeeds, it returns S_OK. Otherwise, it returns an
HRESULT error code.

[備考]
The MP4 media sink supports a maximum of one video stream and one
audio stream. The initial stream formats are given in the
pVideoMediaType and pAudioMediaType parameters. To create an MP4 file
with one stream, set the other stream type to NULL. For example, to
create an audio-only file, set pVideoMediaType to NULL. The number of
streams is fixed when you create the media sink. The sink does not
support the IMFMediaSink::AddStreamSink method. To author 3GP files,
use the MFCreate3GPMediaSink function.


%index
MFCreateMuxSink
Creates a generic media sink that wraps a multiplexer Microsoft Media Foundation transform (MFT).
%group
Win32 mf
%prm
guidOutputSubType, pOutputAttributes, pOutputByteStream, ppMuxSink
guidOutputSubType : [int] The subtype GUID of the output type for the MFT.
pOutputAttributes : [var] A list of format attributes for the MFT output type. This parameter is optional and can be NULL.
pOutputByteStream : [var] A pointer to the IMFByteStream interface of a byte stream. The output from the MFT is written to this byte stream. This parameter can be NULL.
ppMuxSink : [var] Receives a pointer to the IMFMediaSink interface of the media sink. The caller must release the interface.
%inst
Creates a generic media sink that wraps a multiplexer Microsoft Media
Foundation transform (MFT).

[戻り値]
If this function succeeds, it returns S_OK. Otherwise, it returns an
HRESULT error code.

[備考]
This function attempts to find a multiplexer MFT that supports an
output type with the following definition:
This doc was truncated.


%index
MFCreateNetSchemePlugin
Creates the scheme handler for the network source.
%group
Win32 mf
%prm
riid, ppvHandler
riid : [var] Interface identifier (IID) of the interface to retrieve.
ppvHandler : [var] Receives a pointer to the requested interface. The caller must release the interface. The scheme handler exposes the IMFSchemeHandler interface.
%inst
Creates the scheme handler for the network source.

[戻り値]
The function returns an HRESULT. Possible values include, but are not
limited to, those in the following table.
This doc was truncated.


%index
MFCreatePresentationDescriptorFromASFProfile
Creates a presentation descriptor from an ASF profile object.
%group
Win32 mf
%prm
pIProfile, ppIPD
pIProfile : [var] Pointer to the IMFASFProfile interface of the ASF profile object.
ppIPD : [var] Receives a pointer to the IMFPresentationDescriptor interface. The caller must release the interface.
%inst
Creates a presentation descriptor from an ASF profile object.

[戻り値]
The function returns an HRESULT. Possible values include, but are not
limited to, those in the following table.
This doc was truncated.


%index
MFCreateProtectedEnvironmentAccess
Creates an IMFProtectedEnvironmentAccess object that allows content protection systems to perform a handshake with the protected environment.
%group
Win32 mf
%prm
ppAccess
ppAccess : [var] Receives a pointer to the IMFProtectedEnvironmentAccess interface.
%inst
Creates an IMFProtectedEnvironmentAccess object that allows content
protection systems to perform a handshake with the protected
environment.


%index
MFCreateProxyLocator
Creates a default proxy locator.
%group
Win32 mf
%prm
pszProtocol, pProxyConfig, ppProxyLocator
pszProtocol : [wstr] The name of the protocol. Note??In this release of Media Foundation, the default proxy locator does not support RTSP.
pProxyConfig : [var] Pointer to the IPropertyStore interface of a property store that contains the proxy configuration in the MFNETSOURCE_PROXYSETTINGS property.
ppProxyLocator : [var] Receives a pointer to the IMFNetProxyLocator interface. The caller must release the interface.
%inst
Creates a default proxy locator.

[戻り値]
The function returns an HRESULT. Possible values include, but are not
limited to, those in the following table.
This doc was truncated.


%index
MFCreateRemoteDesktopPlugin
Creates the remote desktop plug-in object. Use this object if the application is running in a Terminal Services client session.
%group
Win32 mf
%prm
ppPlugin
ppPlugin : [var] Receives a pointer to the IMFRemoteDesktopPlugin interface of the plug-in object. The caller must release the interface.
%inst
Creates the remote desktop plug-in object. Use this object if the
application is running in a Terminal Services client session.

[戻り値]
The function returns an HRESULT. Possible values include, but are not
limited to, those in the following table.
This doc was truncated.


%index
MFCreateVideoRenderer
Creates an instance of the enhanced video renderer (EVR) media sink.
%group
Win32 mf
%prm
riidRenderer, ppVideoRenderer
riidRenderer : [var] Interface identifier (IID) of the requested interface on the EVR.
ppVideoRenderer : [var] Receives a pointer to the requested interface. The caller must release the interface.
%inst
Creates an instance of the enhanced video renderer (EVR) media sink.

[戻り値]
The function returns an HRESULT. Possible values include, but are not
limited to, those in the following table.
This doc was truncated.

[備考]
This function creates the Media Foundation version of the EVR. To
create the DirectShow EVR filter, call CoCreateInstance with the
class identifier CLSID_EnhancedVideoRenderer.


%index
MFCreateVideoRendererActivate
Creates an activation object for the enhanced video renderer (EVR) media sink.
%group
Win32 mf
%prm
hwndVideo, ppActivate
hwndVideo : [intptr] Handle to the window where the video will be displayed.
ppActivate : [var] Receives a pointer to the IMFActivate interface. Use this interface to create the EVR. The caller must release the interface.
%inst
Creates an activation object for the enhanced video renderer (EVR)
media sink.

[戻り値]
The function returns an HRESULT. Possible values include, but are not
limited to, those in the following table.
This doc was truncated.

[備考]
To create the EVR, call IMFActivate::ActivateObject on the retrieved
IMFActivate pointer. (If you are using the Media Session, the Media
Session automatically calls ActivateObject when you queue the
topology.) To configure the EVR, set any of the following attributes
on the IMFActivate object before calling ActivateObject.
This doc was truncated.


%index
MFGetLocalId
Gets the local system ID.
%group
Win32 mf
%prm
verifier, size, id
verifier : [var] Application-specific verifier value.
size : [int] Length in bytes of verifier.
id : [var] Returned ID string.  This value must be freed by the caller by calling CoTaskMemFree.
%inst
Gets the local system ID.

[戻り値]
The function returns an HRESULT. Possible values include, but are not
limited to, those in the following table.


%index
MFGetSystemId
Returns an IMFSystemId object for retrieving system id data.
%group
Win32 mf
%prm
ppId
ppId : [var] Receives a pointer to the IMFSystemId interface.
%inst
Returns an IMFSystemId object for retrieving system id data.


%index
MFLoadSignedLibrary
Loads a dynamic link library that is signed for the protected environment.
%group
Win32 mf
%prm
pszName, ppLib
pszName : [wstr] The name of the dynamic link library to load.  This dynamic link library must be signed for the protected environment.
ppLib : [var] Receives a pointer to the IMFSignedLibrary interface for the library.
%inst
Loads a dynamic link library that is signed for the protected
environment.

[備考]
A singlemodule load count is maintained on the dynamic link library
(as it is with LoadLibrary). This load count is freed when the final
release is called on the IMFSignedLibrary object.


%index
MFShutdownObject
Shuts down a Media Foundation object and releases all resources associated with the object. (MFShutdownObject)
%group
Win32 mf
%prm
pUnk
pUnk : [var] Pointer to the IUnknown interface of the object.
%inst
Shuts down a Media Foundation object and releases all resources
associated with the object. (MFShutdownObject)

[戻り値]
The function returns an HRESULT. Possible values include, but are not
limited to, those in the following table.
This doc was truncated.

[備考]
This function is not related to the MFShutdown function, which shuts
down the Media Foundation platform, as described in Initializing
Media Foundation.

