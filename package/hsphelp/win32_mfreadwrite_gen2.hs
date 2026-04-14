; ============================================================
;   mfreadwrite.dll ヘルプ (CsWin32 / win32metadata から自動抽出)
;   docs_ja.json に日本語訳があればそちらを使用、無ければ英語原文。
;   翻訳を追加するときは docs_ja.json を編集して再生成。
; ============================================================

%index
MFCreateSinkWriterFromMediaSink
Creates the sink writer from a media sink.
%group
Win32 mfreadwrite
%prm
pMediaSink, pAttributes, ppSinkWriter
pMediaSink : [var] Pointer to the IMFMediaSink interface of a media sink.
pAttributes : [var] Pointer to the IMFAttributes interface. You can use this parameter to configure the sink writer. For more information, see Sink Writer Attributes. This parameter can be NULL.
ppSinkWriter : [var] Receives a pointer to the IMFSinkWriter interface. The caller must release the interface.
%inst
Creates the sink writer from a media sink.

[戻り値]
If this function succeeds, it returns S_OK. Otherwise, it returns an
HRESULT error code.

[備考]
Call CoInitialize(Ex) and MFStartup before calling this function.
When you are done using the media sink, call the media sink's
IMFMediaSink::Shutdown method. (The sink writer does not shut down
the media sink.) Release the sink writer before calling Shutdown on
the media sink. This function is available on Windows Vista if
Platform Update Supplement for Windows Vista is installed.


%index
MFCreateSinkWriterFromURL
Creates the sink writer from a URL or byte stream.
%group
Win32 mfreadwrite
%prm
pwszOutputURL, pByteStream, pAttributes, ppSinkWriter
pwszOutputURL : [wstr] A null-terminated string that contains the URL of the output file. This parameter can be NULL.
pByteStream : [var] Pointer to the IMFByteStream interface of a byte stream. This parameter can be NULL. If this parameter is a valid pointer, the sink writer writes to the provided byte stream. (The byte stream must be writable.) Otherwise, if pByteStream is NULL, the sink writer creates a new file named pwszOutputURL.
pAttributes : [var] Pointer to the IMFAttributes interface. You can use this parameter to configure the sink writer. For more information, see Sink Writer Attributes. This parameter can be NULL.
ppSinkWriter : [var] Receives a pointer to the IMFSinkWriter interface. The caller must release the interface.
%inst
Creates the sink writer from a URL or byte stream.

[戻り値]
This function can return one of these values.
This doc was truncated.

[備考]
Call CoInitialize(Ex) and MFStartup before calling this function. The
first three parameters to this function can be NULL; however, only
certain combinations are valid:
This doc was truncated.


%index
MFCreateSourceReaderFromByteStream
Creates the source reader from a byte stream.
%group
Win32 mfreadwrite
%prm
pByteStream, pAttributes, ppSourceReader
pByteStream : [var] A pointer to the IMFByteStream interface of a byte stream. This byte stream will provide the source data for the source reader.
pAttributes : [var] Pointer to the IMFAttributes interface. You can use this parameter to configure the source reader. For more information, see Source Reader Attributes. This parameter can be NULL.
ppSourceReader : [var] Receives a pointer to the IMFSourceReader interface. The caller must release the interface.
%inst
Creates the source reader from a byte stream.

[戻り値]
If this function succeeds, it returns S_OK. Otherwise, it returns an
HRESULT error code.

[備考]
Call CoInitialize(Ex) and MFStartup before calling this function.
Internally, the source reader calls the
IMFSourceResolver::CreateObjectFromByteStream method to create a
media source from the byte stream. Therefore, a byte-stream handler
must be registered for the byte stream. For more information about
byte-stream handlers, see Scheme Handlers and Byte-Stream Handlers.
This function is available on Windows Vista if Platform Update
Supplement for Windows Vista is installed.


%index
MFCreateSourceReaderFromMediaSource
Creates the source reader from a media source.
%group
Win32 mfreadwrite
%prm
pMediaSource, pAttributes, ppSourceReader
pMediaSource : [var] A pointer to the IMFMediaSource interface of a media source.
pAttributes : [var] Pointer to the IMFAttributes interface. You can use this parameter to configure the source reader. For more information, see Source Reader Attributes. This parameter can be NULL.
ppSourceReader : [var] Receives a pointer to the IMFSourceReader interface. The caller must release the interface.
%inst
Creates the source reader from a media source.

[戻り値]
The method returns an HRESULT. Possible values include, but are not
limited to, those in the following table.
This doc was truncated.

[備考]
Call CoInitialize(Ex) and MFStartup before calling this function. By
default, when the application releases the source reader, the source
reader shuts down the media source by calling
IMFMediaSource::Shutdown on the media source. At that point, the
application can no longer use the media source. To change this
default behavior, set the
MF_SOURCE_READER_DISCONNECT_MEDIASOURCE_ON_SHUTDOWN attribute in the
pAttributes parameter. If this attribute is TRUE, the application is
responsible for shutting down the media source.
This doc was truncated.


%index
MFCreateSourceReaderFromURL
Creates the source reader from a URL.
%group
Win32 mfreadwrite
%prm
pwszURL, pAttributes, ppSourceReader
pwszURL : [wstr] The URL  of a media file to open.
pAttributes : [var] Pointer to the IMFAttributes interface. You can use this parameter to configure the source reader. For more information, see Source Reader Attributes. This parameter can be NULL.
ppSourceReader : [var] Receives a pointer to the IMFSourceReader interface. The caller must release the interface.
%inst
Creates the source reader from a URL.

[戻り値]
If this function succeeds, it returns S_OK. Otherwise, it returns an
HRESULT error code.

[備考]
Call CoInitialize(Ex) and MFStartup before calling this function.
Internally, the source reader calls the
IMFSourceResolver::CreateObjectFromURL method to create a media
source from the URL.
This function is available on Windows Vista if Platform Update
Supplement for Windows Vista is installed.

