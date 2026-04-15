; ============================================================
;   mfreadwrite.dll ヘルプ (CsWin32 / win32metadata から自動抽出)
;   docs_ja.json に日本語訳があればそちらを使用、無ければ英語原文。
;   翻訳を追加するときは docs_ja.json を編集して再生成。
; ============================================================

%index
MFCreateSinkWriterFromMediaSink
メディアシンクからシンクライターを作成する。
%group
Win32 mfreadwrite
%prm
pMediaSink, pAttributes, ppSinkWriter
pMediaSink : [var] メディアシンクの IMFMediaSink インターフェースへのポインタ。
pAttributes : [var] IMFAttributes インターフェースへのポインタ。このパラメータを使用してシンクライターを構成できる。詳細は Sink Writer Attributes を参照のこと。このパラメータは NULL でも構わない。
ppSinkWriter : [var] IMFSinkWriter インターフェースへのポインタを受け取る。呼び出し元はインターフェースを解放する必要がある。
%inst
メディアシンクからシンクライターを作成する。

[戻り値]
関数が成功すると S_OK を返す。そうでない場合は HRESULT エラーコードを返す。

[備考]
この関数を呼び出す前に CoInitialize(Ex) と MFStartup
を呼び出すこと。メディアシンクの使用が終わったら、メディアシンクの IMFMediaSink::Shutdown メソッドを呼び出す
(シンクライターはメディアシンクをシャットダウンしない)。メディアシンクで Shutdown
を呼び出す前にシンクライターを解放する。この関数は Platform Update Supplement for Windows
Vista がインストールされていれば Windows Vista でも利用可能である。


%index
MFCreateSinkWriterFromURL
URL またはバイトストリームからシンクライターを作成する。
%group
Win32 mfreadwrite
%prm
pwszOutputURL, pByteStream, pAttributes, ppSinkWriter
pwszOutputURL : [wstr] 出力ファイルの URL を含む NULL 終端文字列。このパラメータは NULL でも構わない。
pByteStream : [var] バイトストリームの IMFByteStream インターフェースへのポインタ。このパラメータは NULL でも構わない。有効なポインタであればシンクライターは指定のバイトストリームに書き込む (そのバイトストリームは書き込み可能でなければならない)。一方 pByteStream が NULL の場合、シンクライターは pwszOutputURL という新しいファイルを作成する。
pAttributes : [var] IMFAttributes インターフェースへのポインタ。このパラメータを使用してシンクライターを構成できる。詳細は Sink Writer Attributes を参照のこと。このパラメータは NULL でも構わない。
ppSinkWriter : [var] IMFSinkWriter インターフェースへのポインタを受け取る。呼び出し元はインターフェースを解放する必要がある。
%inst
URL またはバイトストリームからシンクライターを作成する。

[戻り値]
この関数は次のいずれかの値を返しうる。
このドキュメントは省略されている。

[備考]
この関数を呼び出す前に CoInitialize(Ex) と MFStartup を呼び出すこと。この関数の最初の 3 つのパラメータは
NULL でもよいが、有効な組み合わせは限られる。
このドキュメントは省略されている。


%index
MFCreateSourceReaderFromByteStream
バイトストリームからソースリーダーを作成する。
%group
Win32 mfreadwrite
%prm
pByteStream, pAttributes, ppSourceReader
pByteStream : [var] バイトストリームの IMFByteStream インターフェースへのポインタ。このバイトストリームがソースリーダーへのソースデータを提供する。
pAttributes : [var] IMFAttributes インターフェースへのポインタ。このパラメータを使用してソースリーダーを構成できる。詳細は Source Reader Attributes を参照のこと。このパラメータは NULL でも構わない。
ppSourceReader : [var] IMFSourceReader インターフェースへのポインタを受け取る。呼び出し元はインターフェースを解放する必要がある。
%inst
バイトストリームからソースリーダーを作成する。

[戻り値]
関数が成功すると S_OK を返す。そうでない場合は HRESULT エラーコードを返す。

[備考]
この関数を呼び出す前に CoInitialize(Ex) と MFStartup を呼び出すこと。内部でソースリーダーは
IMFSourceResolver::CreateObjectFromByteStream
メソッドを呼び出してバイトストリームからメディアソースを作成する。従って、対応するバイトストリームハンドラが登録されている必要がある。バイトストリームハンドラの詳細は
Scheme Handlers and Byte-Stream Handlers を参照のこと。
この関数は Platform Update Supplement for Windows Vista がインストールされていれば
Windows Vista でも利用可能である。


%index
MFCreateSourceReaderFromMediaSource
メディアソースからソースリーダーを作成する。
%group
Win32 mfreadwrite
%prm
pMediaSource, pAttributes, ppSourceReader
pMediaSource : [var] メディアソースの IMFMediaSource インターフェースへのポインタ。
pAttributes : [var] IMFAttributes インターフェースへのポインタ。このパラメータを使用してソースリーダーを構成できる。詳細は Source Reader Attributes を参照のこと。このパラメータは NULL でも構わない。
ppSourceReader : [var] IMFSourceReader インターフェースへのポインタを受け取る。呼び出し元はインターフェースを解放する必要がある。
%inst
メディアソースからソースリーダーを作成する。

[戻り値]
メソッドは HRESULT を返す。発生しうる値は次の表に示すものに限定されない。
このドキュメントは省略されている。

[備考]
この関数を呼び出す前に CoInitialize(Ex) と MFStartup
を呼び出すこと。既定では、アプリケーションがソースリーダーを解放すると、ソースリーダーはメディアソースに対し
IMFMediaSource::Shutdown
を呼び出してシャットダウンする。その時点で、アプリケーションはそのメディアソースを使用できなくなる。この既定動作を変更するには、pAttributes
パラメータで MF_SOURCE_READER_DISCONNECT_MEDIASOURCE_ON_SHUTDOWN
属性を設定する。この属性が TRUE の場合、メディアソースのシャットダウンはアプリケーションの責任となる。
このドキュメントは省略されている。


%index
MFCreateSourceReaderFromURL
URL からソースリーダーを作成する。
%group
Win32 mfreadwrite
%prm
pwszURL, pAttributes, ppSourceReader
pwszURL : [wstr] 開くメディアファイルの URL。
pAttributes : [var] IMFAttributes インターフェースへのポインタ。このパラメータを使用してソースリーダーを構成できる。詳細は Source Reader Attributes を参照のこと。このパラメータは NULL でも構わない。
ppSourceReader : [var] IMFSourceReader インターフェースへのポインタを受け取る。呼び出し元はインターフェースを解放する必要がある。
%inst
URL からソースリーダーを作成する。

[戻り値]
関数が成功すると S_OK を返す。そうでない場合は HRESULT エラーコードを返す。

[備考]
この関数を呼び出す前に CoInitialize(Ex) と MFStartup を呼び出すこと。内部でソースリーダーは
IMFSourceResolver::CreateObjectFromURL メソッドを呼び出して URL からメディアソースを作成する。
この関数は Platform Update Supplement for Windows Vista がインストールされていれば
Windows Vista でも利用可能である。

