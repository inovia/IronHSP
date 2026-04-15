; ============================================================
;   mf.dll ヘルプ (CsWin32 / win32metadata から自動抽出)
;   docs_ja.json に日本語訳があればそちらを使用、無ければ英語原文。
;   翻訳を追加するときは docs_ja.json を編集して再生成。
; ============================================================

%index
MFCreate3GPMediaSink
3GP ファイル作成用のメディアシンクを作成する。
%group
Win32 mf
%prm
pIByteStream, pVideoMediaType, pAudioMediaType, ppIMediaSink
pIByteStream : [var] バイトストリームの IMFByteStream インターフェースへのポインタ。メディアシンクは 3GP ファイルをこのバイトストリームに書き込む。バイトストリームは書き込み可能かつシーク対応でなければならない。
pVideoMediaType : [var] ビデオメディアタイプの IMFMediaType インターフェースへのポインタ。このタイプはビデオストリームの形式を指定する。このパラメータは NULL でもよいが、pAudioMediaType が NULL の場合は NULL にできない。
pAudioMediaType : [var] オーディオメディアタイプの IMFMediaType インターフェースへのポインタ。このタイプはオーディオストリームの形式を指定する。このパラメータは NULL でもよいが、pVideoMediaType が NULL の場合は NULL にできない。
ppIMediaSink : [var] 3GP メディアシンクの IMFMediaSink インターフェースへのポインタを受け取る。呼び出し元はインターフェースを解放する必要がある。
%inst
3GP ファイル作成用のメディアシンクを作成する。

[戻り値]
関数が成功すると S_OK を返す。そうでない場合は HRESULT エラーコードを返す。

[備考]
3GP メディアシンクは最大 1 つのビデオストリームと 1 つのオーディオストリームをサポートする。初期のストリーム形式は
pVideoMediaType および pAudioMediaType パラメータで指定する。片方のみのストリームで MP4
ファイルを作成するには、もう一方のストリームタイプを NULL に設定する。例えば音声のみのファイルを作成するには
pVideoMediaType を NULL にする。ストリーム数はメディアシンク作成時に固定され、シンクは
IMFMediaSink::AddStreamSink メソッドをサポートしない。MP4 ファイルを作成するには
MFCreateMPEG4MediaSink 関数を使用する。


%index
MFCreateAC3MediaSink
AC-3 メディアシンクのインスタンスを作成する。
%group
Win32 mf
%prm
pTargetByteStream, pAudioMediaType, ppMediaSink
pTargetByteStream : [var] バイトストリームの IMFByteStream インターフェースへのポインタ。メディアシンクは AC-3 ファイルをこのバイトストリームに書き込む。バイトストリームは書き込み可能でなければならない。
pAudioMediaType : [var] IMFMediaType インターフェースへのポインタ。このパラメータは AC-3 オーディオストリームのメディアタイプを指定する。メディアタイプは以下の属性を含んでいなければならない。
ppMediaSink : [var] IMFMediaSink インターフェースへのポインタを受け取る。呼び出し元はインターフェースを解放する必要がある。
%inst
AC-3 メディアシンクのインスタンスを作成する。

[戻り値]
関数が成功すると S_OK を返す。そうでない場合は HRESULT エラーコードを返す。

[備考]
AC-3 メディアシンクは圧縮済み AC-3
オーディオを入力として受け取り、変更せずにバイトストリームへ書き込む。このメディアシンクの主な用途はネットワーク越しの AC-3
オーディオストリーミングである。メディアシンク自体は AC-3 エンコードを行わない。


%index
MFCreateADTSMediaSink
Audio Data Transport Stream (ADTS) メディアシンクのインスタンスを作成する。
%group
Win32 mf
%prm
pTargetByteStream, pAudioMediaType, ppMediaSink
pTargetByteStream : [var] バイトストリームの IMFByteStream インターフェースへのポインタ。メディアシンクは ADTS ストリームをこのバイトストリームに書き込む。バイトストリームは書き込み可能でなければならない。
pAudioMediaType : [var] IMFMediaType インターフェースへのポインタ。このパラメータは ADTS ストリームのメディアタイプを指定する。メディアタイプは以下の属性を含んでいなければならない。
ppMediaSink : [var] IMFMediaSink インターフェースへのポインタを受け取る。呼び出し元はインターフェースを解放する必要がある。
%inst
Audio Data Transport Stream (ADTS) メディアシンクのインスタンスを作成する。

[戻り値]
関数が成功すると S_OK を返す。そうでない場合は HRESULT エラーコードを返す。

[備考]
ADTS メディアシンクは Advanced Audio Coding (AAC) オーディオパケットを ADTS
ストリームに変換する。このメディアシンクの主な用途はネットワーク越しの ADTS
ストリーミングである。出力はオーディオファイルではなく、ADTS ヘッダ付きのオーディオフレームのストリームである。メディアシンクは生の
AAC フレーム (MF_MT_AAC_PAYLOAD_TYPE = 0) または ADTS パケット
(MF_MT_AAC_PAYLOAD_TYPE = 1) を受け入れる。入力が生の AAC
の場合、メディアシンクは各オーディオフレームの先頭に ADTS ヘッダを挿入する。入力が ADTS
パケットの場合、メディアシンクはパケットをそのままバイトストリームに渡す。


%index
MFCreateASFContentInfo
ASF ヘッダオブジェクトオブジェクトを作成する。
%group
Win32 mf
%prm
ppIContentInfo
ppIContentInfo : [var] IMFASFContentInfo インターフェースへのポインタを受け取る。呼び出し元はインターフェースを解放する必要がある。
%inst
ASF ヘッダオブジェクトオブジェクトを作成する。

[戻り値]
関数は HRESULT を返す。発生しうる値は次の表に示すものに限定されない。
このドキュメントは省略されている。


%index
MFCreateASFIndexer
ASF インデクサーオブジェクトを作成する。
%group
Win32 mf
%prm
ppIIndexer
ppIIndexer : [var] IMFASFIndexer インターフェースへのポインタを受け取る。呼び出し元はインターフェースを解放する必要がある。
%inst
ASF インデクサーオブジェクトを作成する。

[戻り値]
関数は HRESULT を返す。発生しうる値は次の表に示すものに限定されない。
このドキュメントは省略されている。


%index
MFCreateASFIndexerByteStream
ASF ストリーム内のインデックスにアクセスするためのバイトストリームを作成する。
%group
Win32 mf
%prm
pIContentByteStream, cbIndexStartOffset, pIIndexByteStream
pIContentByteStream : [var] ASF ストリームを含むバイトストリームの IMFByteStream インターフェースへのポインタ。
cbIndexStartOffset : [int64] ASF ストリーム内のインデックスのバイトオフセット。この値を取得するには IMFASFIndexer::GetIndexPosition を呼び出す。
pIIndexByteStream : [var] IMFByteStream インターフェースへのポインタを受け取る。このインターフェースを使用してインデックスの読み取りまたは書き込みを行う。呼び出し元はインターフェースを解放する必要がある。
%inst
ASF ストリーム内のインデックスにアクセスするためのバイトストリームを作成する。

[戻り値]
関数は HRESULT を返す。発生しうる値は次の表に示すものに限定されない。
このドキュメントは省略されている。


%index
MFCreateASFMediaSink
ASF メディアシンクを作成する。
%group
Win32 mf
%prm
pIByteStream, ppIMediaSink
pIByteStream : [var] ASF ストリームの書き込みに使用されるバイトストリームへのポインタ。
ppIMediaSink : [var] IMFMediaSink インターフェースへのポインタを受け取る。呼び出し元はインターフェースを解放する必要がある。
%inst
ASF メディアシンクを作成する。

[戻り値]
関数は HRESULT を返す。発生しうる値は次の表に示すものに限定されない。
このドキュメントは省略されている。


%index
MFCreateASFMediaSinkActivate
ASF メディアシンクを作成するために使用できるアクティベーションオブジェクトを作成する。
%group
Win32 mf
%prm
pwszFileName, pContentInfo, ppIActivate
pwszFileName : [wstr] 出力ファイル名を含む NULL 終端ワイド文字列。
pContentInfo : [var] 初期化済みの ASF ヘッダオブジェクトの IMFASFContentInfo インターフェースへのポインタ。このインターフェースを使用して ASF メディアシンクを構成する。
ppIActivate : [var] IMFActivate インターフェースへのポインタを受け取る。呼び出し元はインターフェースを解放する必要がある。
%inst
ASF メディアシンクを作成するために使用できるアクティベーションオブジェクトを作成する。

[戻り値]
関数は HRESULT を返す。発生しうる値は次の表に示すものに限定されない。
このドキュメントは省略されている。


%index
MFCreateASFMultiplexer
ASF マルチプレクサを作成する。
%group
Win32 mf
%prm
ppIMultiplexer
ppIMultiplexer : [var] IMFASFMultiplexer インターフェースへのポインタを受け取る。呼び出し元はインターフェースを解放する必要がある。
%inst
ASF マルチプレクサを作成する。

[戻り値]
関数は HRESULT を返す。発生しうる値は次の表に示すものに限定されない。
このドキュメントは省略されている。


%index
MFCreateASFProfile
ASF プロファイルオブジェクトを作成する。
%group
Win32 mf
%prm
ppIProfile
ppIProfile : [var] IMFASFProfile インターフェースへのポインタを受け取る。呼び出し元はインターフェースを解放する必要がある。
%inst
ASF プロファイルオブジェクトを作成する。

[戻り値]
関数は HRESULT を返す。発生しうる値は次の表に示すものに限定されない。
このドキュメントは省略されている。


%index
MFCreateASFProfileFromPresentationDescriptor
プレゼンテーションディスクリプタから ASF プロファイルオブジェクトを作成する。
%group
Win32 mf
%prm
pIPD, ppIProfile
pIPD : [var] プロファイル情報を含むプレゼンテーションディスクリプタの IMFPresentationDescriptor インターフェースへのポインタ。
ppIProfile : [var] IMFASFProfile インターフェースへのポインタを受け取る。呼び出し元はインターフェースを解放する必要がある。
%inst
プレゼンテーションディスクリプタから ASF プロファイルオブジェクトを作成する。

[戻り値]
関数は HRESULT を返す。発生しうる値は次の表に示すものに限定されない。
このドキュメントは省略されている。


%index
MFCreateASFSplitter
ASF スプリッタを作成する。
%group
Win32 mf
%prm
ppISplitter
ppISplitter : [var] IMFASFSplitter インターフェースへのポインタを受け取る。呼び出し元はインターフェースを解放する必要がある。
%inst
ASF スプリッタを作成する。

[戻り値]
関数は HRESULT を返す。発生しうる値は次の表に示すものに限定されない。
このドキュメントは省略されている。


%index
MFCreateASFStreamSelector
ASF ストリームセレクタを作成する。
%group
Win32 mf
%prm
pIASFProfile, ppSelector
pIASFProfile : [var] IMFASFProfile インターフェースへのポインタ。
ppSelector : [var] IMFASFStreamSelector インターフェースへのポインタを受け取る。呼び出し元はインターフェースを解放する必要がある。
%inst
ASF ストリームセレクタを作成する。

[戻り値]
関数は HRESULT を返す。発生しうる値は次の表に示すものに限定されない。
このドキュメントは省略されている。


%index
MFCreateASFStreamingMediaSink
ASF ストリーミングシンク用のアクティベーションオブジェクトを作成する。(MFCreateASFStreamingMediaSink)
%group
Win32 mf
%prm
pIByteStream, ppIMediaSink
pIByteStream : [var] ASF メディアシンクがストリーミングコンテンツを書き込むバイトストリームオブジェクトへのポインタ。
ppIMediaSink : [var] ASF ストリーミングメディアシンクオブジェクトの IMFMediaSink インターフェースへのポインタを受け取る。メディアシンクを作成するには、アプリケーションは受け取ったポインタに対し IMFActivate::ActivateObject を呼び出す必要がある。呼び出し元はインターフェースポインタを解放する必要がある。
%inst
ASF ストリーミングシンク用のアクティベーションオブジェクトを作成する。(MFCreateASFStreamingMediaSink)

[戻り値]
関数が成功すると S_OK を返す。そうでない場合は HRESULT エラーコードを返す。

[備考]
別プロセスで ASF ストリーミングシンクを作成するには MFCreateASFStreamingMediaSinkActivate
を呼び出す。
アプリケーションは ppIMediaSink パラメータで受け取ったメディアシンクオブジェクトに対し
IUnknown::QueryInterface を呼び出すことで ASF ContentInfo
オブジェクトへのポインタを取得できる。ContentInfo オブジェクトはエンコーダ設定の指定、ASF
プロファイルが提供するストリームプロパティの指定、メタデータ情報の追加に使用される。これらの設定はエンコード後 ASF ファイルの各種
ASF ヘッダオブジェクトに反映される。詳細は Setting Properties in the ContentInfo Object
を参照のこと。


%index
MFCreateASFStreamingMediaSinkActivate
ASF ストリーミングシンク用のアクティベーションオブジェクトを作成する。(MFCreateASFStreamingMediaSinkActivate)
%group
Win32 mf
%prm
pByteStreamActivate, pContentInfo, ppIActivate
pByteStreamActivate : [var] アクティベーションオブジェクトの IMFActivate インターフェースへのポインタ。このインターフェースは呼び出し元が実装する。アクティベーションオブジェクトの IMFActivate::ActivateObject メソッドはバイトストリームオブジェクトを作成する必要がある。バイトストリームは IMFByteStream インターフェースを公開する。ASF ストリーミングシンクはこのバイトストリームにデータを書き込む。
pContentInfo : [var] ASF コンテンツを記述するプロパティを含む ASF ContentInfo オブジェクトへのポインタ。これらの設定はストリーム設定、エンコードプロパティ、メタデータを含みうる。これらのプロパティの詳細は Setting Properties in the ContentInfo Object を参照のこと。
ppIActivate : [var] ASF ストリーミングメディアシンクを作成するのに使用するアクティベーションオブジェクトの IMFActivate インターフェースへのポインタを受け取る。メディアシンクを作成するには、受け取ったポインタを使用してアプリケーションが IMFActivate::ActivateObject を呼び出す必要がある。ActivateObject メソッドは pByteStreamActivate で指定したバイトストリームアクティベートオブジェクトに対しても IMFActivate::Activate を呼び出して作成し、メディアシンクがストリーミングコンテンツをバイトストリームに書き込めるようにする。呼び出し元は ppIActivate で受け取ったメディアシンクアクティベーションオブジェクトの IMFActivate インターフェースポインタを解放する必要がある。
%inst
ASF
ストリーミングシンク用のアクティベーションオブジェクトを作成する。(MFCreateASFStreamingMediaSinkActivate)

[戻り値]
関数が成功すると S_OK を返す。そうでない場合は HRESULT エラーコードを返す。

[備考]
Windows 7 以降、Media Foundation はライブストリーミングシナリオにおいてコンテンツを書き込む ASF
ストリーミングシンクを提供している。この関数は、このメディアシンクをリモートプロセスで作成・構成する必要があるセキュアトランスコードシナリオで使用すべきである。ASF
ファイルシンクと同様に、新しいメディアシンクは ASF ヘッダの書き込みやデータパケットの生成 (マルチプレクシング) といった ASF
関連タスクを実行する。コンテンツは HTTP
バイトストリームなど呼び出し元が実装するバイトストリームに書き込まれる。呼び出し元はまた、メディアシンクがリモートでバイトストリームを作成するために使用できるアクティベーションオブジェクトを提供する必要がある。さらに、保護されたコンテンツをストリーミングするためのトランスクリプションも実行する。ライセンス要求とレスポンスを処理する
Windows Media Digital Rights Management (DRM) for Network Devices
Output Trust Authority (OTA) をホストする。詳細は IMFDRMNetHelper
インターフェースを参照のこと。新しいメディアシンクは時間調整を行わない。クロックがシークしても、タイムスタンプは変更されない。


%index
MFCreateCredentialCache
資格情報キャッシュオブジェクトを作成する。アプリケーションはこのオブジェクトを使用してカスタム資格情報マネージャを実装できる。
%group
Win32 mf
%prm
ppCache
ppCache : [var] 新しい資格情報キャッシュオブジェクトの IMFNetCredentialCache インターフェースへのポインタを受け取る。呼び出し元はインターフェースを解放する必要がある。
%inst
資格情報キャッシュオブジェクトを作成する。アプリケーションはこのオブジェクトを使用してカスタム資格情報マネージャを実装できる。

[戻り値]
関数は HRESULT を返す。発生しうる値は次の表に示すものに限定されない。
このドキュメントは省略されている。


%index
MFCreateFMPEG4MediaSink
フラグメント化 MP4 ファイル作成用のメディアシンクを作成する。
%group
Win32 mf
%prm
pIByteStream, pVideoMediaType, pAudioMediaType, ppIMediaSink
pIByteStream : [var] バイトストリームの IMFByteStream インターフェースへのポインタ。メディアシンクは MP4 ファイルをこのバイトストリームに書き込む。バイトストリームは書き込み可能かつシーク対応でなければならない。
pVideoMediaType : [var] ビデオメディアタイプの IMFMediaType インターフェースへのポインタ。このタイプはビデオストリームの形式を指定する。このパラメータは NULL でもよいが、pAudioMediaType が NULL の場合は NULL にできない。
pAudioMediaType : [var] オーディオメディアタイプの IMFMediaType インターフェースへのポインタ。このタイプはオーディオストリームの形式を指定する。このパラメータは NULL でもよいが、pVideoMediaType が NULL の場合は NULL にできない。
ppIMediaSink : [var] MP4 メディアシンクの IMFMediaSink インターフェースへのポインタを受け取る。呼び出し元はインターフェースを解放する必要がある。
%inst
フラグメント化 MP4 ファイル作成用のメディアシンクを作成する。

[戻り値]
関数が成功すると S_OK を返す。そうでない場合は HRESULT エラーコードを返す。


%index
MFCreateMP3MediaSink
MP3 メディアシンクを作成する。
%group
Win32 mf
%prm
pTargetByteStream, ppMediaSink
pTargetByteStream : [var] バイトストリームの IMFByteStream インターフェースへのポインタ。メディアシンクは MP3 ファイルをこのバイトストリームに書き込む。バイトストリームは書き込み可能でなければならない。
ppMediaSink : [var] MP3 メディアシンクの IMFMediaSink インターフェースへのポインタを受け取る。呼び出し元はインターフェースを解放する必要がある。
%inst
MP3 メディアシンクを作成する。

[戻り値]
関数が成功すると S_OK を返す。そうでない場合は HRESULT エラーコードを返す。

[備考]
MP3 メディアシンクは圧縮済み MP3 オーディオサンプルを入力として受け取り、ID3 ヘッダ付きの MP3 ファイルを出力する。MP3
メディアシンクは MP3 オーディオエンコードを行わない。


%index
MFCreateMPEG4MediaSink
MP4 ファイル作成用のメディアシンクを作成する。
%group
Win32 mf
%prm
pIByteStream, pVideoMediaType, pAudioMediaType, ppIMediaSink
pIByteStream : [var] バイトストリームの IMFByteStream インターフェースへのポインタ。メディアシンクは MP4 ファイルをこのバイトストリームに書き込む。バイトストリームは書き込み可能かつシーク対応でなければならない。
pVideoMediaType : [var] ビデオメディアタイプの IMFMediaType インターフェースへのポインタ。このタイプはビデオストリームの形式を指定する。このパラメータは NULL でもよいが、pAudioMediaType が NULL の場合は NULL にできない。
pAudioMediaType : [var] オーディオメディアタイプの IMFMediaType インターフェースへのポインタ。このタイプはオーディオストリームの形式を指定する。このパラメータは NULL でもよいが、pVideoMediaType が NULL の場合は NULL にできない。
ppIMediaSink : [var] MP4 メディアシンクの IMFMediaSink インターフェースへのポインタを受け取る。呼び出し元はインターフェースを解放する必要がある。
%inst
MP4 ファイル作成用のメディアシンクを作成する。

[戻り値]
関数が成功すると S_OK を返す。そうでない場合は HRESULT エラーコードを返す。

[備考]
MP4 メディアシンクは最大 1 つのビデオストリームと 1 つのオーディオストリームをサポートする。初期のストリーム形式は
pVideoMediaType および pAudioMediaType パラメータで指定する。片方のみのストリームで MP4
ファイルを作成するには、もう一方のストリームタイプを NULL に設定する。例えば音声のみのファイルを作成するには
pVideoMediaType を NULL にする。ストリーム数はメディアシンク作成時に固定され、シンクは
IMFMediaSink::AddStreamSink メソッドをサポートしない。3GP ファイルを作成するには
MFCreate3GPMediaSink 関数を使用する。


%index
MFCreateMuxSink
マルチプレクサ Microsoft Media Foundation Transform (MFT) をラップする汎用メディアシンクを作成する。
%group
Win32 mf
%prm
guidOutputSubType, pOutputAttributes, pOutputByteStream, ppMuxSink
guidOutputSubType : [int] MFT の出力タイプのサブタイプ GUID。
pOutputAttributes : [var] MFT 出力タイプの形式属性リスト。このパラメータは省略可能で NULL でも構わない。
pOutputByteStream : [var] バイトストリームの IMFByteStream インターフェースへのポインタ。MFT からの出力はこのバイトストリームに書き込まれる。このパラメータは NULL でも構わない。
ppMuxSink : [var] メディアシンクの IMFMediaSink インターフェースへのポインタを受け取る。呼び出し元はインターフェースを解放する必要がある。
%inst
マルチプレクサ Microsoft Media Foundation Transform (MFT)
をラップする汎用メディアシンクを作成する。

[戻り値]
関数が成功すると S_OK を返す。そうでない場合は HRESULT エラーコードを返す。

[備考]
この関数は次の定義を持つ出力タイプをサポートするマルチプレクサ MFT の検索を試みる。
このドキュメントは省略されている。


%index
MFCreateNetSchemePlugin
ネットワークソース用のスキームハンドラを作成する。
%group
Win32 mf
%prm
riid, ppvHandler
riid : [var] 取得するインターフェースの IID。
ppvHandler : [var] 要求されたインターフェースへのポインタを受け取る。呼び出し元はインターフェースを解放する必要がある。スキームハンドラは IMFSchemeHandler インターフェースを公開する。
%inst
ネットワークソース用のスキームハンドラを作成する。

[戻り値]
関数は HRESULT を返す。発生しうる値は次の表に示すものに限定されない。
このドキュメントは省略されている。


%index
MFCreatePresentationDescriptorFromASFProfile
ASF プロファイルオブジェクトからプレゼンテーションディスクリプタを作成する。
%group
Win32 mf
%prm
pIProfile, ppIPD
pIProfile : [var] ASF プロファイルオブジェクトの IMFASFProfile インターフェースへのポインタ。
ppIPD : [var] IMFPresentationDescriptor インターフェースへのポインタを受け取る。呼び出し元はインターフェースを解放する必要がある。
%inst
ASF プロファイルオブジェクトからプレゼンテーションディスクリプタを作成する。

[戻り値]
関数は HRESULT を返す。発生しうる値は次の表に示すものに限定されない。
このドキュメントは省略されている。


%index
MFCreateProtectedEnvironmentAccess
コンテンツ保護システムが保護された環境とハンドシェイクを実行できるようにする IMFProtectedEnvironmentAccess オブジェクトを作成する。
%group
Win32 mf
%prm
ppAccess
ppAccess : [var] IMFProtectedEnvironmentAccess インターフェースへのポインタを受け取る。
%inst
コンテンツ保護システムが保護された環境とハンドシェイクを実行できるようにする IMFProtectedEnvironmentAccess
オブジェクトを作成する。


%index
MFCreateProxyLocator
既定のプロキシロケータを作成する。
%group
Win32 mf
%prm
pszProtocol, pProxyConfig, ppProxyLocator
pszProtocol : [wstr] プロトコル名。注: このリリースの Media Foundation では、既定のプロキシロケータは RTSP をサポートしない。
pProxyConfig : [var] MFNETSOURCE_PROXYSETTINGS プロパティにプロキシ設定を含むプロパティストアの IPropertyStore インターフェースへのポインタ。
ppProxyLocator : [var] IMFNetProxyLocator インターフェースへのポインタを受け取る。呼び出し元はインターフェースを解放する必要がある。
%inst
既定のプロキシロケータを作成する。

[戻り値]
関数は HRESULT を返す。発生しうる値は次の表に示すものに限定されない。
このドキュメントは省略されている。


%index
MFCreateRemoteDesktopPlugin
リモートデスクトッププラグインオブジェクトを作成する。アプリケーションがターミナルサービスクライアントセッションで実行されている場合にこのオブジェクトを使用する。
%group
Win32 mf
%prm
ppPlugin
ppPlugin : [var] プラグインオブジェクトの IMFRemoteDesktopPlugin インターフェースへのポインタを受け取る。呼び出し元はインターフェースを解放する必要がある。
%inst

リモートデスクトッププラグインオブジェクトを作成する。アプリケーションがターミナルサービスクライアントセッションで実行されている場合にこのオブジェクトを使用する。

[戻り値]
関数は HRESULT を返す。発生しうる値は次の表に示すものに限定されない。
このドキュメントは省略されている。


%index
MFCreateVideoRenderer
Enhanced Video Renderer (EVR) メディアシンクのインスタンスを作成する。
%group
Win32 mf
%prm
riidRenderer, ppVideoRenderer
riidRenderer : [var] EVR で要求するインターフェースの IID。
ppVideoRenderer : [var] 要求されたインターフェースへのポインタを受け取る。呼び出し元はインターフェースを解放する必要がある。
%inst
Enhanced Video Renderer (EVR) メディアシンクのインスタンスを作成する。

[戻り値]
関数は HRESULT を返す。発生しうる値は次の表に示すものに限定されない。
このドキュメントは省略されている。

[備考]
この関数は Media Foundation 版の EVR を作成する。DirectShow の EVR
フィルターを作成するには、クラス識別子 CLSID_EnhancedVideoRenderer を指定して
CoCreateInstance を呼び出す。


%index
MFCreateVideoRendererActivate
Enhanced Video Renderer (EVR) メディアシンク用のアクティベーションオブジェクトを作成する。
%group
Win32 mf
%prm
hwndVideo, ppActivate
hwndVideo : [intptr] ビデオを表示するウィンドウへのハンドル。
ppActivate : [var] IMFActivate インターフェースへのポインタを受け取る。このインターフェースを使用して EVR を作成する。呼び出し元はインターフェースを解放する必要がある。
%inst
Enhanced Video Renderer (EVR) メディアシンク用のアクティベーションオブジェクトを作成する。

[戻り値]
関数は HRESULT を返す。発生しうる値は次の表に示すものに限定されない。
このドキュメントは省略されている。

[備考]
EVR を作成するには、取得した IMFActivate ポインタに対し IMFActivate::ActivateObject
を呼び出す (Media Session を使用している場合、Media Session はトポロジをキューに入れる際に自動的に
ActivateObject を呼び出す)。EVR を構成するには、ActivateObject を呼び出す前に IMFActivate
オブジェクトに以下の属性を設定する。
このドキュメントは省略されている。


%index
MFGetLocalId
ローカルシステム ID を取得する。
%group
Win32 mf
%prm
verifier, size, id
verifier : [var] アプリケーション固有の検証値。
size : [int] verifier の長さ (バイト単位)。
id : [var] 返される ID 文字列。この値は呼び出し元が CoTaskMemFree を呼び出して解放する必要がある。
%inst
ローカルシステム ID を取得する。

[戻り値]
関数は HRESULT を返す。発生しうる値は次の表に示すものに限定されない。


%index
MFGetSystemId
システム ID データを取得するための IMFSystemId オブジェクトを返す。
%group
Win32 mf
%prm
ppId
ppId : [var] IMFSystemId インターフェースへのポインタを受け取る。
%inst
システム ID データを取得するための IMFSystemId オブジェクトを返す。


%index
MFLoadSignedLibrary
保護された環境向けに署名されたダイナミックリンクライブラリをロードする。
%group
Win32 mf
%prm
pszName, ppLib
pszName : [wstr] ロードするダイナミックリンクライブラリの名前。このダイナミックリンクライブラリは保護された環境向けに署名されていなければならない。
ppLib : [var] ライブラリの IMFSignedLibrary インターフェースへのポインタを受け取る。
%inst
保護された環境向けに署名されたダイナミックリンクライブラリをロードする。

[備考]
ダイナミックリンクライブラリには (LoadLibrary と同様に)
単一モジュールのロードカウントが維持される。このロードカウントは、IMFSignedLibrary
オブジェクトの最終リリースが呼び出された時点で解放される。


%index
MFShutdownObject
Media Foundation オブジェクトをシャットダウンし、そのオブジェクトに関連付けられたすべてのリソースを解放する。(MFShutdownObject)
%group
Win32 mf
%prm
pUnk
pUnk : [var] オブジェクトの IUnknown インターフェースへのポインタ。
%inst
Media Foundation
オブジェクトをシャットダウンし、そのオブジェクトに関連付けられたすべてのリソースを解放する。(MFShutdownObject)

[戻り値]
関数は HRESULT を返す。発生しうる値は次の表に示すものに限定されない。
このドキュメントは省略されている。

[備考]
この関数は Media Foundation プラットフォームをシャットダウンする MFShutdown 関数とは無関係である。詳細は
Initializing Media Foundation を参照のこと。

