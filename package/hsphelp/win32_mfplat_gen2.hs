; ============================================================
;   mfplat.dll ヘルプ (CsWin32 / win32metadata から自動抽出)
;   docs_ja.json に日本語訳があればそちらを使用、無ければ英語原文。
;   翻訳を追加するときは docs_ja.json を編集して再生成。
; ============================================================

%index
MFCreateSourceResolver
URL またはバイトストリームからメディアソースを作成するためのソースリゾルバを作成する。
%group
Win32 mfplat
%prm
ppISourceResolver
ppISourceResolver : [var] ソースリゾルバの IMFSourceResolver インターフェイスへのポインタを受け取る。呼び出し元はインターフェイスを解放する必要がある。
%inst
URL またはバイトストリームからメディアソースを作成するためのソースリゾルバを作成する。

[戻り値]
関数が成功すると S_OK を返す。そうでなければ HRESULT エラーコードを返す。

[備考]
Windows 7 より前は mf.dll からエクスポートされていた。Windows 7 以降は mfplat.dll
からエクスポートされる。


%index
MFGetSupportedMimeTypes
ソースリゾルバに登録されている MIME 型を取得する。
%group
Win32 mfplat
%prm
pPropVarMimeTypeArray
pPropVarMimeTypeArray : [var] MIME 型を受け取る PROPVARIANT へのポインタ。呼び出し前に PropVariantInit で初期化する。成功時、PROPVARIANT はワイド文字列の配列 (VT_VECTOR | VT_LPWSTR) を含む。呼び出し元は PropVariantClear で解放する必要がある。
%inst
ソースリゾルバに登録されている MIME 型を取得する。

[戻り値]
関数は HRESULT を返す。このドキュメントは省略されている。


%index
MFGetSupportedSchemes
ソースリゾルバに登録されている URL スキームを取得する。
%group
Win32 mfplat
%prm
pPropVarSchemeArray
pPropVarSchemeArray : [var] URL スキームを受け取る PROPVARIANT へのポインタ。
%inst
ソースリゾルバに登録されている URL スキームを取得する。

[戻り値]
関数は HRESULT を返す。このドキュメントは省略されている。


%index
CreatePropertyStore
空のプロパティストアオブジェクトを作成する。
%group
Win32 mfplat
%prm
ppStore
ppStore : [var] IPropertyStore インターフェイスへのポインタを受け取る。呼び出し元はインターフェイスを解放する必要がある。
%inst
空のプロパティストアオブジェクトを作成する。

[戻り値]
関数が成功すると S_OK を返す。そうでなければ HRESULT エラーコードを返す。

[備考]
この関数は、Windows Media Format 11 SDK
再頒布可能コンポーネントがインストールされていれば以下のプラットフォームで利用可能である。
このドキュメントは省略されている。


%index
MFAllocateWorkQueue
新しいワークキューを作成する。(MFAllocateWorkQueue)
%group
Win32 mfplat
%prm
pdwWorkQueue
pdwWorkQueue : [var] ワークキューの識別子を受け取る。
%inst
新しいワークキューを作成する。(MFAllocateWorkQueue)

[戻り値]
関数は HRESULT を返す。取りうる値には次の表のものを含むがそれに限らない。このドキュメントは省略されている。

[備考]
ワークキューの使用が終わったら MFUnlockWorkQueue を呼び出す。


%index
MFAverageTimePerFrameToFrameRate
ビデオフレームの平均継続時間からフレームレート (フレーム/秒) を計算する。
%group
Win32 mfplat
%prm
unAverageTimePerFrame, punNumerator, punDenominator
unAverageTimePerFrame : [int64] ビデオフレームの平均継続時間を 100 ナノ秒単位で指定する。
punNumerator : [var] フレームレートの分子を受け取る。
punDenominator : [var] フレームレートの分母を受け取る。
%inst
ビデオフレームの平均継続時間からフレームレート (フレーム/秒) を計算する。

[戻り値]
関数は HRESULT を返す。このドキュメントは省略されている。

[備考]
平均フレーム時間は古い VIDEOINFOHEADER および VIDEOINFOHEADER2
フォーマット構造体で使用される。この関数は標準的な変換を提供し、古いフォーマット構造体と Media Foundation
のメディア型属性を変換する必要があるパイプラインコンポーネント間で一貫した値を使用できるようにする。この関数は一部の一般的な継続時間についてルックアップテーブルを使用する。テーブルは
MFFrameRateToAverageTimePerFrame 関数の Remarks 節に記載されている。


%index
MFBeginCreateFile
ファイルからバイトストリームを作成する非同期要求を開始する。
%group
Win32 mfplat
%prm
AccessMode, OpenMode, fFlags, pwszFilePath, pCallback, pState, ppCancelCookie
AccessMode : [int] 要求するアクセスモード。MF_FILE_ACCESSMODE 列挙型のメンバで指定する。
OpenMode : [int] ファイルが既に存在する場合または存在しない場合の関数の動作。MF_FILE_OPENMODE 列挙型のメンバで指定する。
fFlags : [int] MF_FILE_FLAGS 列挙型の値のビット単位 OR。
pwszFilePath : [wstr] ファイル名を格納する NULL 終端文字列へのポインタ。
pCallback : [var] コールバックオブジェクトの IMFAsyncCallback インターフェイスへのポインタ。呼び出し元はこのインターフェイスを実装する必要がある。
pState : [var] 呼び出し元が定義する状態オブジェクトの IUnknown インターフェイスへのポインタ。NULL でもよい。状態情報の保持に使用できる。コールバック呼び出し時に呼び出し元へ返される。
ppCancelCookie : [var] IUnknown ポインタまたは NULL を受け取る。NULL でない場合、このポインタを MFCancelCreateFile 関数に渡すことで非同期操作をキャンセルできる。呼び出し元はインターフェイスを解放する必要がある。このパラメータは省略可能で NULL でもよい。
%inst
ファイルからバイトストリームを作成する非同期要求を開始する。

[戻り値]
関数は HRESULT を返す。このドキュメントは省略されている。

[備考]
要求が完了すると、コールバックオブジェクトの IMFAsyncCallback::Invoke
メソッドが呼び出される。そこでコールバックオブジェクトは MFEndCreateFile
関数を呼び出してバイトストリームへのポインタを取得する。


%index
MFBeginRegisterWorkQueueWithMMCSS
ワークキューを Multimedia Class Scheduler Service (MMCSS) タスクに関連付ける。(MFBeginRegisterWorkQueueWithMMCSS)
%group
Win32 mfplat
%prm
dwWorkQueueId, wszClass, dwTaskId, pDoneCallback, pDoneState
dwWorkQueueId : [int] ワークキューの識別子。プライベートワークキューでは MFAllocateWorkQueue 関数から返される識別子を指定する。プラットフォームワークキューについては Work Queue Identifiers を参照。
wszClass : [wstr] MMCSS タスクの名前。詳細は Multimedia Class Scheduler Service を参照。
dwTaskId : [int] 一意のタスク識別子。新しいタスク識別子を取得するには、この値をゼロに設定する。
pDoneCallback : [var] コールバックオブジェクトの IMFAsyncCallback インターフェイスへのポインタ。呼び出し元はこのインターフェイスを実装する必要がある。
pDoneState : [var] 呼び出し元が定義する状態オブジェクトの IUnknown インターフェイスへのポインタ。NULL でもよい。
%inst
ワークキューを Multimedia Class Scheduler Service (MMCSS)
タスクに関連付ける。(MFBeginRegisterWorkQueueWithMMCSS)

[戻り値]
関数は HRESULT を返す。このドキュメントは省略されている。

[備考]
この関数は非同期である。操作完了時にコールバックの IMFAsyncCallback::Invoke
が呼ばれる。そのタイミングでアプリケーションは MFEndRegisterWorkQueueWithMMCSS
を呼び出して非同期要求を完了する。MMCSS タスクからワークキューの登録を解除するには
MFBeginUnregisterWorkQueueWithMMCSS を呼び出す。


%index
MFCalculateBitmapImageSize
ビデオフォーマットの画像サイズを取得する。
%group
Win32 mfplat
%prm
pBMIH, cbBufSize, pcbImageSize, pbKnown
pBMIH : [var] フォーマットを記述する BITMAPINFOHEADER 構造体へのポインタ。
cbBufSize : [int] pBMIH バッファのサイズ (バイト単位)。BITMAPINFOHEADER 構造体に続くカラーマスクやパレットエントリを含む。
pcbImageSize : [var] 画像サイズ (バイト単位) を受け取る。
pbKnown : [var] 関数がビデオフォーマットを認識した場合は TRUE、それ以外は FALSE を受け取る。NULL でもよい。
%inst
ビデオフォーマットの画像サイズを取得する。

[戻り値]
関数は HRESULT を返す。このドキュメントは省略されている。

[備考]
この関数を呼び出す前に BITMAPINFOHEADER
構造体の少なくとも次のメンバを設定する必要がある。このドキュメントは省略されている。


%index
MFCalculateImageSize
非圧縮ビデオフォーマットの画像サイズをバイト単位で取得する。(MFCalculateImageSize)
%group
Win32 mfplat
%prm
guidSubtype, unWidth, unHeight, pcbImageSize
guidSubtype : [var] ビデオフォーマットのメディアサブタイプ。サブタイプの一覧は Media Type GUIDs を参照。
unWidth : [int] 画像の幅 (ピクセル単位)。
unHeight : [int] 画像の高さ (ピクセル単位)。
pcbImageSize : [var] 各フレームのサイズ (バイト単位) を受け取る。フォーマットが圧縮されているか認識されない場合は 0 となる。
%inst
非圧縮ビデオフォーマットの画像サイズをバイト単位で取得する。(MFCalculateImageSize)

[戻り値]
関数は HRESULT を返す。このドキュメントは省略されている。


%index
MFCancelCreateFile
ファイルからバイトストリームを作成する非同期要求をキャンセルする。
%group
Win32 mfplat
%prm
pCancelCookie
pCancelCookie : [var] キャンセル用オブジェクトの IUnknown インターフェイスへのポインタ。このポインタは MFBeginCreateFile 関数の ppCancelCookie パラメータで受け取る。
%inst
ファイルからバイトストリームを作成する非同期要求をキャンセルする。

[戻り値]
関数は HRESULT を返す。このドキュメントは省略されている。

[備考]
この関数を使用して MFBeginCreateFile
の以前の呼び出しをキャンセルできる。ただしその関数は非同期であるため、操作がキャンセルされる前に完了する可能性がある。したがって、この関数を呼び出した後でもコールバックが呼び出される可能性がある。


%index
MFCombineSamples
合計継続時間が指定の時間を超えない場合、メディアサンプルを別のサンプルに連結する。
%group
Win32 mfplat
%prm
pSample, pSampleToAdd, dwMaxMergedDurationInMS, pMerged
pSample : [var] pSampleToAdd で指定されたサンプルを追加する先の IMFSample へのポインタ。
pSampleToAdd : [var] pSample で指定されたサンプルに追加する IMFSample へのポインタ。
dwMaxMergedDurationInMS : [int] 操作が成功するために結合後のサンプルが収まる最大継続時間 (ミリ秒)。
pMerged : [var] サンプルが正常に追加されたかを示す BOOL を受け取る出力パラメータ。
%inst
合計継続時間が指定の時間を超えない場合、メディアサンプルを別のサンプルに連結する。

[戻り値]
HRESULT を返す。

[備考]
結合されたサンプルを分割するには MFSplitSample を呼び出す。


%index
MFCompareFullToPartialMediaType
完全なメディア型を部分的なメディア型と比較する。
%group
Win32 mfplat
%prm
pMFTypeFull, pMFTypePartial
pMFTypeFull : [var] 完全なメディア型の IMFMediaType インターフェイスへのポインタ。
pMFTypePartial : [var] 部分的なメディア型の IMFMediaType インターフェイスへのポインタ。
%inst
完全なメディア型を部分的なメディア型と比較する。

[戻り値]
完全なメディア型が部分的なメディア型と互換性がある場合は TRUE を返し、そうでない場合は FALSE を返す。

[備考]

パイプラインコンポーネントは、受け入れ可能なフォーマットの範囲を記述するために部分的なメディア型を返す場合がある。部分的なメディア型は少なくともメジャータイプ
GUID を持つが、完全に記述するために必要な属性の一部が欠けている場合がある。欠けている属性は部分型にとって "don't care"
の値を表す。例えば部分的なビデオ型は幅や高さの属性が欠けている場合がある。このドキュメントは省略されている。


%index
MFConvertColorInfoFromDXVA
MFVIDEOFORMAT 構造体に拡張色情報を設定する。
%group
Win32 mfplat
%prm
pToFormat, dwFromDXVA
pToFormat : [var] MFVIDEOFORMAT 構造体へのポインタ。関数は dwFromDXVA の DXVA 色情報に対応する構造体メンバを埋める。他のメンバは変更しない。
dwFromDXVA : [int] 拡張色情報を含む DWORD。ビットフィールドは DXVA2_ExtendedFormat 構造体で定義される。
%inst
MFVIDEOFORMAT 構造体に拡張色情報を設定する。

[戻り値]
関数が成功すると S_OK を返す。そうでなければ HRESULT エラーコードを返す。

[備考]
この関数は MFVIDEOFORMAT 構造体の以下のフィールドを設定する。このドキュメントは省略されている。


%index
MFConvertColorInfoToDXVA
MFVIDEOFORMAT の拡張色情報を DXVA の色情報に変換する。
%group
Win32 mfplat
%prm
pdwToDXVA, pFromFormat
pdwToDXVA : [var] DXVA 拡張色情報を受け取る。ビットフィールドは DXVA2_ExtendedFormat 構造体で定義される。
pFromFormat : [var] ビデオフォーマットを記述する MFVIDEOFORMAT 構造体へのポインタ。
%inst
MFVIDEOFORMAT の拡張色情報を DXVA の色情報に変換する。

[戻り値]
関数が成功すると S_OK を返す。そうでなければ HRESULT エラーコードを返す。

[備考]
Windows 7 より前は evr.dll からエクスポートされていた。Windows 7 以降は mfplat.dll
からエクスポートされ、evr.dll は mfplat.dll を呼び出すスタブを提供する。


%index
MFConvertFromFP16Array
16 ビット浮動小数点数の配列を 32 ビット浮動小数点数の配列に変換する。
%group
Win32 mfplat
%prm
pDest, pSrc, dwCount
pDest : [var] float 値の配列へのポインタ。配列は少なくとも dwCount 要素を含む必要がある。
pSrc : [var] WORD 値として型付けされた 16 ビット浮動小数点値の配列へのポインタ。
dwCount : [int] 変換する pSrc 配列の要素数。
%inst
16 ビット浮動小数点数の配列を 32 ビット浮動小数点数の配列に変換する。

[戻り値]
関数が成功すると S_OK を返す。そうでなければ HRESULT エラーコードを返す。

[備考]
pSrc 配列の dwCount 個の値を変換して pDest 配列に書き込む。Windows 7 より前は evr.dll
からエクスポートされていた。


%index
MFConvertToFP16Array
32 ビット浮動小数点数の配列を 16 ビット浮動小数点数の配列に変換する。
%group
Win32 mfplat
%prm
pDest, pSrc, dwCount
pDest : [var] WORD 値として型付けされた 16 ビット浮動小数点値の配列へのポインタ。
pSrc : [var] float 値の配列へのポインタ。
dwCount : [int] 変換する pSrc 配列の要素数。
%inst
32 ビット浮動小数点数の配列を 16 ビット浮動小数点数の配列に変換する。

[戻り値]
関数が成功すると S_OK を返す。そうでなければ HRESULT エラーコードを返す。

[備考]
pSrc 配列の値を変換して pDest 配列に書き込む。Windows 7 より前は evr.dll からエクスポートされていた。


%index
MFCopyImage
画像または画像プレーンをあるバッファから別のバッファにコピーする。
%group
Win32 mfplat
%prm
pDest, lDestStride, pSrc, lSrcStride, dwWidthInBytes, dwLines
pDest : [var] コピー先バッファの最初の行の先頭ピクセルへのポインタ。
lDestStride : [int] コピー先バッファのストライド (バイト単位)。
pSrc : [var] コピー元画像の最初の行の先頭ピクセルへのポインタ。
lSrcStride : [int] コピー元画像のストライド (バイト単位)。
dwWidthInBytes : [int] 画像の幅 (バイト単位)。
dwLines : [int] コピーするピクセルの行数。
%inst
画像または画像プレーンをあるバッファから別のバッファにコピーする。

[戻り値]
関数が成功すると S_OK を返す。そうでなければ HRESULT エラーコードを返す。

[備考]
この関数は画像の単一プレーンをコピーする。プレーナ YUV フォーマットではプレーンごとに呼び出す必要があり、pDest と pSrc
は各プレーンの先頭を指す。MMX/SSE/SSE2 命令セットが利用可能な場合に最適化される。ノンテンポラルストアを実行する
(データはキャッシュを汚染せずメモリに直接書き込まれる)。


%index
MFCreate2DMediaBuffer
2D 画像データを保持するシステムメモリバッファオブジェクトを作成する。
%group
Win32 mfplat
%prm
dwWidth, dwHeight, dwFourCC, fBottomUp, ppBuffer
dwWidth : [int] 画像の幅 (ピクセル単位)。
dwHeight : [int] 画像の高さ (ピクセル単位)。
dwFourCC : [int] ビデオフォーマットを指定する FOURCC コードまたは D3DFORMAT 値。ビデオサブタイプ GUID がある場合、その先頭の DWORD を使用できる。
fBottomUp : [int] TRUE の場合、IMF2DBuffer::ContiguousCopyTo はボトムアップ形式でコピーする (GDI 互換)。FALSE の場合トップダウン形式 (DirectX 互換)。
ppBuffer : [var] IMFMediaBuffer インターフェイスへのポインタを受け取る。
%inst
2D 画像データを保持するシステムメモリバッファオブジェクトを作成する。

[戻り値]
以下の値のいずれかを返すことがある。このドキュメントは省略されている。

[備考]
返されるバッファオブジェクトは IMF2DBuffer2 インターフェイスも公開する。


%index
MFCreateAMMediaTypeFromMFMediaType
Media Foundation のメディア型から DirectShow AM_MEDIA_TYPE 構造体を作成する。
%group
Win32 mfplat
%prm
pMFType, guidFormatBlockType, ppAMType
pMFType : [var] 変換元となるメディア型の IMFMediaType インターフェイスへのポインタ。
guidFormatBlockType : [int] フォーマット型 GUID。AM_MEDIA_TYPE 構造体の formattype メンバに対応し、割り当てるフォーマットブロックの型を指定する。GUID_NULL の場合、関数はメジャータイプとサブタイプから正しいフォーマットブロックを推測しようとする。
ppAMType : [var] AM_MEDIA_TYPE 構造体へのポインタを受け取る。呼び出し元は CoTaskMemFree を呼んで構造体のメモリを解放する必要がある。フォーマットブロックのメモリも割り当てられ、pbFormat メンバに対して CoTaskMemFree を呼んで解放する。
%inst
Media Foundation のメディア型から DirectShow AM_MEDIA_TYPE 構造体を作成する。

[戻り値]
関数は HRESULT を返す。このドキュメントは省略されている。

[備考]
AM_MEDIA_TYPE と等価な以下のフォーマット構造体でも使用できる。このドキュメントは省略されている。


%index
MFCreateAlignedMemoryBuffer
指定したバイトアライメントでシステムメモリを確保し、それを管理するメディアバッファを作成する。
%group
Win32 mfplat
%prm
cbMaxLength, cbAligment, ppBuffer
cbMaxLength : [int] バッファのサイズ (バイト単位)。
cbAligment : [int] バッファのメモリアライメントを指定する。以下の定数のいずれかを使用する。このドキュメントは省略されている。
ppBuffer : [var] メディアバッファの IMFMediaBuffer インターフェイスへのポインタを受け取る。呼び出し元はインターフェイスを解放する必要がある。
%inst
指定したバイトアライメントでシステムメモリを確保し、それを管理するメディアバッファを作成する。

[戻り値]
関数は HRESULT を返す。このドキュメントは省略されている。

[備考]
メディアバッファオブジェクトが破棄される際に、割り当てたメモリが解放される。


%index
MFCreateAttributes
空の属性ストアを作成する。
%group
Win32 mfplat
%prm
ppMFAttributes, cInitialSize
ppMFAttributes : [var] IMFAttributes インターフェイスへのポインタを受け取る。呼び出し元はインターフェイスを解放する必要がある。
cInitialSize : [int] 属性ストアに初期割り当てする要素数。属性ストアは必要に応じて拡張される。
%inst
空の属性ストアを作成する。

[戻り値]
関数が成功すると S_OK を返す。そうでなければ HRESULT エラーコードを返す。

[備考]
属性は Microsoft Media Foundation
全体で、オブジェクトの構成、メディアフォーマットの記述、プロパティの問い合わせ等に使用される。詳細は Attributes in
Media Foundation を参照。


%index
MFCreateAudioMediaType
WAVEFORMATEX 構造体からオーディオメディア型を作成する。
%group
Win32 mfplat
%prm
pAudioFormat, ppIAudioMediaType
pAudioFormat : [var] オーディオフォーマットを記述する WAVEFORMATEX 構造体へのポインタ。
ppIAudioMediaType : [var] IMFAudioMediaType インターフェイスへのポインタを受け取る。呼び出し元はインターフェイスを解放する必要がある。
%inst
WAVEFORMATEX 構造体からオーディオメディア型を作成する。

[戻り値]
関数が成功すると S_OK を返す。そうでなければ HRESULT エラーコードを返す。

[備考]
IMFAudioMediaType
インターフェイスは非推奨であり、アプリケーションはこの関数の使用を避けるべきである。WAVEFORMATEX
構造体からメディア型を作成するには次の手順を行う。このドキュメントは省略されている。


%index
MFCreateCollection
空のコレクションオブジェクトを作成する。
%group
Win32 mfplat
%prm
ppIMFCollection
ppIMFCollection : [var] コレクションオブジェクトの IMFCollection インターフェイスへのポインタを受け取る。呼び出し元はインターフェイスを解放する必要がある。
%inst
空のコレクションオブジェクトを作成する。

[戻り値]
関数は HRESULT を返す。このドキュメントは省略されている。


%index
MFCreateContentDecryptorContext
指定したメディア保護システム用の IMFContentDecryptorContext インターフェイスを作成する。
%group
Win32 mfplat
%prm
guidMediaProtectionSystemId, pD3DManager, pContentProtectionDevice, ppContentDecryptorContext
guidMediaProtectionSystemId : [var] IMFContentDecryptorContext インターフェイスを作成するメディア保護システムの識別子。
pD3DManager : [var] Direct3D 11 デバイスを共有するために使用する IMFDXGIDeviceManager インターフェイスへのポインタ。
pContentProtectionDevice : [var] 指定されたメディア保護システム用の IMFContentProtectionDevice インターフェイス。
ppContentDecryptorContext : [var] 作成された IMFContentDecryptorContext インターフェイスへのポインタ。
%inst
指定したメディア保護システム用の IMFContentDecryptorContext インターフェイスを作成する。


%index
MFCreateContentProtectionDevice
指定したメディア保護システム用の IMFContentProtectionDevice インターフェイスを作成する。
%group
Win32 mfplat
%prm
ProtectionSystemId, ContentProtectionDevice
ProtectionSystemId : [var] IMFContentProtectionDevice インターフェイスを作成するメディア保護システムの識別子。
ContentProtectionDevice : [var] 作成された IMFContentProtectionDevice インターフェイスへのポインタ。
%inst
指定したメディア保護システム用の IMFContentProtectionDevice インターフェイスを作成する。


%index
MFCreateD3D12SynchronizationObject
Media Foundation オブジェクトに格納された D3D12 リソースへのアクセスを同期する Media Foundation D3D12 同期プリミティブをインスタンス化する。
%group
Win32 mfplat
%prm
pDevice, riid, ppvSyncObject
pDevice : [var] 作成するリソースおよびプリミティブに関連付けられる ID3D12Device。
riid : [var] 作成する同期オブジェクトのインターフェイスを識別する GUID。
ppvSyncObject : [var] 作成された同期オブジェクトを指す void** を受け取る。
%inst
Media Foundation オブジェクトに格納された D3D12 リソースへのアクセスを同期する Media Foundation
D3D12 同期プリミティブをインスタンス化する。

[戻り値]
HRESULT を返す (S_OK, MF_E_OPERATION_UNSUPPORTED_AT_D3D_FEATURE_LEVEL,
MF_E_UNSUPPORTED_MEDIATYPE_AT_D3D_FEATURE_LEVEL 等)。


%index
MFCreateDXGIDeviceManager
Microsoft DirectX Graphics Infrastructure (DXGI) Device Manager のインスタンスを作成する。
%group
Win32 mfplat
%prm
resetToken, ppDeviceManager
resetToken : [var] この DXGI Device Manager インスタンスを識別するトークンを受け取る。IMFDXGIDeviceManager::ResetDevice の呼び出し時にこのトークンを使用する。
ppDeviceManager : [var] IMFDXGIDeviceManager インターフェイスへのポインタを受け取る。呼び出し元はインターフェイスを解放する必要がある。
%inst
Microsoft DirectX Graphics Infrastructure (DXGI) Device Manager
のインスタンスを作成する。

[戻り値]
関数が成功すると S_OK を返す。そうでなければ HRESULT エラーコードを返す。

[備考]
MFCreateDXGIDeviceManager で IMFDXGIDeviceManager を作成した時点では Direct3D
11 デバイスは関連付けられていない。関連付けるには IMFDXGIDeviceManager::ResetDevice に
Direct3D 11 デバイスへのポインタを渡す。Direct3D 11 デバイスを作成するには D3D11CreateDevice
を呼び出す (D3D11_CREATE_DEVICE_VIDEO_SUPPORT フラグ付きで)。


%index
MFCreateDXGISurfaceBuffer
Microsoft DirectX Graphics Infrastructure (DXGI) サーフェスを管理するメディアバッファを作成する。
%group
Win32 mfplat
%prm
riid, punkSurface, uSubresourceIndex, fBottomUpWhenLinear, ppBuffer
riid : [var] DXGI サーフェスの型を識別する。この値は IID_ID3D11Texture2D でなければならない。
punkSurface : [var] DXGI サーフェスの IUnknown インターフェイスへのポインタ。
uSubresourceIndex : [int] サーフェスのサブリソースの 0 起点インデックス。メディアバッファオブジェクトはこのサブリソースに関連付けられる。
fBottomUpWhenLinear : [int] TRUE の場合、IMF2DBuffer::ContiguousCopyTo はボトムアップ形式でコピーする (GDI 互換)。FALSE の場合トップダウン形式 (Direct3D 互換)。
ppBuffer : [var] IMFMediaBuffer インターフェイスへのポインタを受け取る。呼び出し元はバッファを解放する必要がある。
%inst
Microsoft DirectX Graphics Infrastructure (DXGI)
サーフェスを管理するメディアバッファを作成する。

[戻り値]
関数が成功すると S_OK を返す。そうでなければ HRESULT エラーコードを返す。

[備考]
返されるバッファオブジェクトは以下のインターフェイスをサポートする。このドキュメントは省略されている。


%index
MFCreateDXSurfaceBuffer
Direct3D 9 サーフェスを管理するメディアバッファオブジェクトを作成する。
%group
Win32 mfplat
%prm
riid, punkSurface, fBottomUpWhenLinear, ppBuffer
riid : [var] Direct3D 9 サーフェスの型を識別する。現在この値は IID_IDirect3DSurface9 でなければならない。
punkSurface : [var] DirectX サーフェスの IUnknown インターフェイスへのポインタ。
fBottomUpWhenLinear : [int] TRUE の場合、IMF2DBuffer::ContiguousCopyTo はボトムアップ形式でコピーする (GDI 互換)。FALSE の場合トップダウン形式 (DirectX 互換)。
ppBuffer : [var] IMFMediaBuffer インターフェイスへのポインタを受け取る。呼び出し元はバッファを解放する必要がある。
%inst
Direct3D 9 サーフェスを管理するメディアバッファオブジェクトを作成する。

[戻り値]
関数は HRESULT を返す。このドキュメントは省略されている。

[備考]
この関数は punkSurface で指定された Direct3D
サーフェスへのポインタを保持するメディアバッファオブジェクトを作成する。バッファをロックすると呼び出し元はサーフェスメモリにアクセスできる。バッファオブジェクトが破棄されるとサーフェスが解放される。この関数は
Direct3D サーフェス自体を割り当てない。DXGI サーフェスには対応しない。


%index
MFCreateEventQueue
イベントキューを作成する。
%group
Win32 mfplat
%prm
ppMediaEventQueue
ppMediaEventQueue : [var] イベントキューの IMFMediaEventQueue インターフェイスへのポインタを受け取る。呼び出し元はインターフェイスを解放する必要がある。
%inst
イベントキューを作成する。

[戻り値]
関数は HRESULT を返す。このドキュメントは省略されている。

[備考]
この関数は IMFMediaEventGenerator
インターフェイスの実装に使用できるヘルパーオブジェクトを作成する。このドキュメントは省略されている。


%index
MFCreateFile
ファイルからバイトストリームを作成する。
%group
Win32 mfplat
%prm
AccessMode, OpenMode, fFlags, pwszFileURL, ppIByteStream
AccessMode : [int] 要求するアクセスモード。MF_FILE_ACCESSMODE 列挙型のメンバで指定する。
OpenMode : [int] ファイルが既に存在する場合または存在しない場合の関数の動作。MF_FILE_OPENMODE 列挙型のメンバで指定する。
fFlags : [int] MF_FILE_FLAGS 列挙型の値のビット単位 OR。
pwszFileURL : [wstr] ファイル名を格納する NULL 終端文字列へのポインタ。
ppIByteStream : [var] バイトストリームの IMFByteStream インターフェイスへのポインタを受け取る。呼び出し元はインターフェイスを解放する必要がある。
%inst
ファイルからバイトストリームを作成する。

[戻り値]
関数が成功すると S_OK を返す。そうでなければ HRESULT エラーコードを返す。

[備考]
Windows Media Format 11 SDK
再頒布可能コンポーネントがインストールされていれば以下のプラットフォームで利用可能である。このドキュメントは省略されている。


%index
MFCreateLegacyMediaBufferOnMFMediaBuffer
Media Foundation メディアバッファを DirectX Media Objects (DMO) 互換のバッファに変換する。
%group
Win32 mfplat
%prm
pSample, pMFMediaBuffer, cbOffset, ppMediaBuffer
pSample : [var] Media Foundation バッファを含むサンプルの IMFSample インターフェイスへのポインタ。NULL でもよい。
pMFMediaBuffer : [var] Media Foundation バッファの IMFMediaBuffer インターフェイスへのポインタ。
cbOffset : [int] Media Foundation バッファの先頭からの DMO バッファ開始位置 (バイト単位)。0 を指定すると DMO バッファは Media Foundation バッファの先頭から開始する。
ppMediaBuffer : [var] IMediaBuffer インターフェイスへのポインタを受け取る (DirectShow SDK ドキュメント参照)。呼び出し元はインターフェイスを解放する必要がある。
%inst
Media Foundation メディアバッファを DirectX Media Objects (DMO) 互換のバッファに変換する。

[戻り値]
関数は HRESULT を返す。このドキュメントは省略されている。

[備考]
この関数が作成する DMO バッファは IMFSample インターフェイスも公開する。pIMFSample が NULL
の場合、IMFSample のすべてのメソッドは MF_E_NOT_INITIALIZED を返す。そうでない場合 pIMFSample
に透過する。Media Foundation バッファが IMF2DBuffer を公開する場合、DMO バッファも
IMF2DBuffer を公開する。


%index
MFCreateMFByteStreamOnStream
IStream ポインタをラップする Microsoft Media Foundation バイトストリームを作成する。
%group
Win32 mfplat
%prm
pStream, ppByteStream
pStream : [var] IStream インターフェイスへのポインタ。
ppByteStream : [var] IMFByteStream インターフェイスへのポインタを受け取る。呼び出し元はインターフェイスを解放する必要がある。
%inst
IStream ポインタをラップする Microsoft Media Foundation バイトストリームを作成する。

[戻り値]
HRESULT 値を返す。

[備考]
アプリケーションが IStream オブジェクトを IMFByteStream ポインタを受け取る Media Foundation
API に渡せるようにする。


%index
MFCreateMFByteStreamOnStreamEx
IRandomAccessStream オブジェクトをラップする Microsoft Media Foundation バイトストリームを作成する。
%group
Win32 mfplat
%prm
punkStream, ppByteStream
punkStream : [var] IRandomAccessStream インターフェイスへのポインタ。
ppByteStream : [var] IMFByteStream インターフェイスへのポインタを受け取る。呼び出し元はインターフェイスを解放する必要がある。
%inst
IRandomAccessStream オブジェクトをラップする Microsoft Media Foundation
バイトストリームを作成する。

[戻り値]
関数が成功すると S_OK を返す。そうでなければ HRESULT エラーコードを返す。


%index
MFCreateMFByteStreamWrapper
バイトストリームのラッパーを作成する。
%group
Win32 mfplat
%prm
pStream, ppStreamWrapper
pStream : [var] 元のバイトストリームの IMFByteStream インターフェイスへのポインタ。
ppStreamWrapper : [var] ラッパーの IMFByteStream インターフェイスへのポインタを受け取る。呼び出し元はインターフェイスを解放する必要がある。
%inst
バイトストリームのラッパーを作成する。

[戻り値]
関数が成功すると S_OK を返す。そうでなければ HRESULT エラーコードを返す。

[備考]
ラッパー上の IMFByteStream メソッドは、IMFByteStream::Close
を除いて元のバイトストリームに直接透過する。ラッパーの Close
を呼び出すとラッパーは閉じられるが元のバイトストリームは開いたままとなる。


%index
MFCreateMFVideoFormatFromMFMediaType
ビデオメディア型から MFVIDEOFORMAT 構造体を作成する。
%group
Win32 mfplat
%prm
pMFType, ppMFVF, pcbSize
pMFType : [var] ビデオメディア型の IMFMediaType インターフェイスへのポインタ。
ppMFVF : [var] MFVIDEOFORMAT 構造体へのポインタを受け取る。呼び出し元は CoTaskMemFree を呼んで構造体に割り当てられたメモリを解放する必要がある。
pcbSize : [var] MFVIDEOFORMAT 構造体のサイズを受け取る。
%inst
ビデオメディア型から MFVIDEOFORMAT 構造体を作成する。

[戻り値]
関数が成功すると S_OK を返す。そうでなければ HRESULT エラーコードを返す。


%index
MFCreateMediaBufferFromMediaType
指定したメディア型に最適なシステムメモリバッファを割り当てる。
%group
Win32 mfplat
%prm
pMediaType, llDuration, dwMinLength, dwMinAlignment, ppBuffer
pMediaType : [var] メディア型の IMFMediaType インターフェイスへのポインタ。
llDuration : [int64] サンプルの継続時間。オーディオフォーマットで必要となる値。
dwMinLength : [int] バッファの最小サイズ (バイト単位)。実際のバッファサイズはこれより大きくなる可能性がある。0 を指定するとメディア型の既定のバッファサイズを割り当てる。
dwMinAlignment : [int] バッファの最小メモリアライメント。0 を指定すると既定値を使用する。
ppBuffer : [var] IMFMediaBuffer インターフェイスへのポインタを受け取る。呼び出し元はインターフェイスを解放する必要がある。
%inst
指定したメディア型に最適なシステムメモリバッファを割り当てる。

[戻り値]
関数が成功すると S_OK を返す。そうでなければ HRESULT エラーコードを返す。

[備考]
ビデオフォーマットでフォーマットが認識される場合、関数は IMF2DBuffer2 を実装する 2D
バッファを作成する。そうでなければ線形バッファを作成する。オーディオフォーマットでは、llDuration 個のオーディオサンプルまたは
dwMinLength のうち大きい方を含むのに十分なサイズのバッファを割り当てる。常にシステムメモリを割り当てる。Direct3D
サーフェスには MFCreateDXGISurfaceBuffer または MFCreateDXSurfaceBuffer を使用する。


%index
MFCreateMediaBufferWrapper
既存のメディアバッファをラップするメディアバッファを作成する。
%group
Win32 mfplat
%prm
pBuffer, cbOffset, dwLength, ppBuffer
pBuffer : [var] 元のメディアバッファの IMFMediaBuffer インターフェイスへのポインタ。
cbOffset : [int] 新しいバッファの先頭位置。元バッファの先頭からのバイトオフセットで指定する。
dwLength : [int] 新しいバッファのサイズ。cbOffset + dwLength は元バッファの有効データサイズ以下でなければならない (有効データサイズは IMFMediaBuffer::GetCurrentLength で取得できる)。
ppBuffer : [var] IMFMediaBuffer インターフェイスへのポインタを受け取る。呼び出し元はインターフェイスを解放する必要がある。
%inst
既存のメディアバッファをラップするメディアバッファを作成する。

[戻り値]
関数は HRESULT を返す。このドキュメントは省略されている。

[備考]

ラッパーバッファの最大サイズは元バッファの有効データサイズに制限される。これは元バッファの確保サイズより小さいことがある。有効データサイズを設定するには
IMFMediaBuffer::SetCurrentLength を呼び出す。このドキュメントは省略されている。


%index
MFCreateMediaEvent
メディアイベントオブジェクトを作成する。
%group
Win32 mfplat
%prm
met, guidExtendedType, hrStatus, pvValue, ppEvent
met : [int] イベント型。IMFMediaEvent::GetType を参照。イベント型の一覧は Media Foundation Events を参照。
guidExtendedType : [var] 拡張型。IMFMediaEvent::GetExtendedType を参照。イベント型に拡張型がない場合は GUID_NULL を使用する。
hrStatus : [intptr] イベントステータス。IMFMediaEvent::GetStatus を参照。
pvValue : [var] イベントに関連付けられる値 (あれば)。IMFMediaEvent::GetValue を参照。NULL でもよい。
ppEvent : [var] IMFMediaEvent インターフェイスへのポインタを受け取る。呼び出し元はインターフェイスを解放する必要がある。
%inst
メディアイベントオブジェクトを作成する。

[戻り値]
関数は HRESULT を返す。このドキュメントは省略されている。

[備考]
このドキュメントは省略されている。


%index
MFCreateMediaExtensionActivate
Windows ランタイムクラス用のアクティベーションオブジェクトを作成する。
%group
Win32 mfplat
%prm
szActivatableClassId, pConfiguration, riid, ppvObject
szActivatableClassId : [wstr] アクティベート可能なランタイムクラスに関連付けられたクラス識別子。
pConfiguration : [var] Windows ランタイムクラスを構成するための省略可能な IPropertySet オブジェクトへのポインタ。NULL でもよい。
riid : [var] 要求されるインターフェイスの識別子 (IID)。このドキュメントは省略されている。
ppvObject : [var] 要求されたインターフェイスへのポインタを受け取る。呼び出し元はインターフェイスを解放する必要がある。
%inst
Windows ランタイムクラス用のアクティベーションオブジェクトを作成する。

[戻り値]
関数が成功すると S_OK を返す。そうでなければ HRESULT エラーコードを返す。

[備考]
Windows ランタイムオブジェクトを作成するには IMFActivate::ActivateObject または
IClassFactory::CreateInstance を呼び出す。


%index
MFCreateMediaType
空のメディア型を作成する。
%group
Win32 mfplat
%prm
ppMFType
ppMFType : [var] IMFMediaType インターフェイスへのポインタを受け取る。呼び出し元はインターフェイスを解放する必要がある。
%inst
空のメディア型を作成する。

[戻り値]
関数が成功すると S_OK を返す。そうでなければ HRESULT エラーコードを返す。

[備考]
メディア型は属性なしで作成される。


%index
MFCreateMediaTypeFromProperties
プロパティから IMFMediaType を作成する。
%group
Win32 mfplat
%prm
punkStream, ppMediaType
punkStream : [var] プロパティへのポインタ。
ppMediaType : [var] IMFMediaType へのポインタを受け取る。呼び出し元はインターフェイスを解放する必要がある。
%inst
プロパティから IMFMediaType を作成する。

[戻り値]
関数が成功すると S_OK を返す。そうでなければ HRESULT エラーコードを返す。


%index
MFCreateMediaTypeFromRepresentation
別のフォーマット表現から Media Foundation メディア型を作成する。
%group
Win32 mfplat
%prm
guidRepresentation, pvRepresentation, ppIMediaType
guidRepresentation : [int] 変換元のフォーマット表現を指定する GUID。このドキュメントは省略されている。
pvRepresentation : [intptr] 変換するフォーマット表現を含むバッファへのポインタ。バッファのレイアウトは guidRepresentation の値に依存する。
ppIMediaType : [var] IMFMediaType インターフェイスへのポインタを受け取る。呼び出し元はインターフェイスを解放する必要がある。
%inst
別のフォーマット表現から Media Foundation メディア型を作成する。

[戻り値]
関数は HRESULT を返す。このドキュメントは省略されている。

[備考]
元フォーマットが DirectShow
オーディオメディア型でフォーマット型が認識されない場合、次の属性を変換後のメディア型に設定する。このドキュメントは省略されている。


%index
MFCreateMemoryBuffer
システムメモリを確保し、それを管理するメディアバッファを作成する。
%group
Win32 mfplat
%prm
cbMaxLength, ppBuffer
cbMaxLength : [int] バッファのサイズ (バイト単位)。
ppBuffer : [var] メディアバッファの IMFMediaBuffer インターフェイスへのポインタを受け取る。呼び出し元はインターフェイスを解放する必要がある。
%inst
システムメモリを確保し、それを管理するメディアバッファを作成する。

[戻り値]
関数は HRESULT を返す。このドキュメントは省略されている。

[備考]
1 バイトアライメントのバッファを割り当てる。より大きい境界にアライメントしたバッファには
MFCreateAlignedMemoryBuffer を使用する。このドキュメントは省略されている。


%index
MFCreateMuxStreamAttributes
多重化サブストリームの内容を記述する IMFAttributes を作成する。
%group
Win32 mfplat
%prm
pAttributesToMux, ppMuxAttribs
pAttributesToMux : [var] 多重化される各サブストリームの IMFAttributes を含むコレクション。
ppMuxAttribs : [var] 多重化サブストリームの属性を含む IMFAttributes。
%inst
多重化サブストリームの内容を記述する IMFAttributes を作成する。

[戻り値]
関数は HRESULT を返す。このドキュメントは省略されている。


%index
MFCreateMuxStreamMediaType
多重化サブストリームのメディア型を記述する IMFMediaType を作成する。
%group
Win32 mfplat
%prm
pMediaTypesToMux, ppMuxMediaType
pMediaTypesToMux : [var] 多重化される各サブストリームの IMFMediaType を含むコレクション。
ppMuxMediaType : [var] 多重化サブストリームのメディア型を含む IMFMediaType。
%inst
多重化サブストリームのメディア型を記述する IMFMediaType を作成する。

[戻り値]
関数は HRESULT を返す。このドキュメントは省略されている。


%index
MFCreateMuxStreamSample
多重化サブストリームのサンプルを含む IMFSample を作成する。
%group
Win32 mfplat
%prm
pSamplesToMux, ppMuxSample
pSamplesToMux : [var] 多重化される各サブストリームの IMFSample を含むコレクション。
ppMuxSample : [var] 多重化サブストリームのサンプルを含む IMFSample。
%inst
多重化サブストリームのサンプルを含む IMFSample を作成する。

[戻り値]
関数は HRESULT を返す。このドキュメントは省略されている。


%index
MFCreatePresentationDescriptor
プレゼンテーション記述子を作成する。
%group
Win32 mfplat
%prm
cStreamDescriptors, apStreamDescriptors, ppPresentationDescriptor
cStreamDescriptors : [int] apStreamDescriptors 配列の要素数。
apStreamDescriptors : [var] IMFStreamDescriptor インターフェイスポインタの配列。各ポインタはプレゼンテーション内の 1 ストリームのストリーム記述子を表す。
ppPresentationDescriptor : [var] プレゼンテーション記述子の IMFPresentationDescriptor インターフェイスへのポインタを受け取る。呼び出し元はインターフェイスを解放する必要がある。
%inst
プレゼンテーション記述子を作成する。

[戻り値]
関数が成功すると S_OK を返す。そうでなければ HRESULT エラーコードを返す。

[備考]

カスタムメディアソースを作成する場合にこの関数でソースプレゼンテーション記述子を作成できる。作成時はどのストリームも選択されていない。通常、メディアソースは既定で少なくとも
1 つのストリームを選択すべきであり、IMFPresentationDescriptor::SelectStream
を呼び出す。このドキュメントは省略されている。


%index
MFCreatePropertiesFromMediaType
IMFMediaType からプロパティを作成する。
%group
Win32 mfplat
%prm
pMediaType, riid, ppv
pMediaType : [var] IMFMediaType インターフェイスへのポインタ。
riid : [var] 要求されるインターフェイスの識別子 (IID)。
ppv : [var] 要求されたインターフェイスへのポインタを受け取る。呼び出し元はインターフェイスを解放する必要がある。
%inst
IMFMediaType からプロパティを作成する。

[戻り値]
関数が成功すると S_OK を返す。そうでなければ HRESULT エラーコードを返す。


%index
MFCreateSample
空のメディアサンプルを作成する。
%group
Win32 mfplat
%prm
ppIMFSample
ppIMFSample : [var] メディアサンプルの IMFSample インターフェイスへのポインタを受け取る。呼び出し元はインターフェイスを解放する必要がある。
%inst
空のメディアサンプルを作成する。

[戻り値]
関数は HRESULT を返す。このドキュメントは省略されている。

[備考]
当初のサンプルはメディアバッファを含まない。このドキュメントは省略されている。


%index
MFCreateStreamDescriptor
ストリーム記述子を作成する。
%group
Win32 mfplat
%prm
dwStreamIdentifier, cMediaTypes, apMediaTypes, ppDescriptor
dwStreamIdentifier : [int] ストリーム識別子。
cMediaTypes : [int] apMediaTypes 配列の要素数。
apMediaTypes : [var] IMFMediaType インターフェイスポインタの配列へのポインタ。これらのポインタはストリーム記述子のメディア型ハンドラの初期化に使用される。
ppDescriptor : [var] 新しいストリーム記述子の IMFStreamDescriptor インターフェイスへのポインタを受け取る。呼び出し元はインターフェイスを解放する必要がある。
%inst
ストリーム記述子を作成する。

[戻り値]
関数が成功すると S_OK を返す。そうでなければ HRESULT エラーコードを返す。

[備考]
カスタムメディアソースを作成する場合にストリーム記述子を作成できる。この関数はメディア型ハンドラを自動で作成し、apMediaTypes
の型リストで初期化する。ハンドラの現在のメディア型は設定しない。設定するには
IMFMediaTypeHandler::SetCurrentMediaType を呼び出す。このドキュメントは省略されている。


%index
MFCreateStreamOnMFByteStream
Microsoft Media Foundation バイトストリームをラップする IStream ポインタを返す。
%group
Win32 mfplat
%prm
pByteStream, ppStream
pByteStream : [var] Media Foundation バイトストリームの IMFByteStream インターフェイスへのポインタ。
ppStream : [var] IStream インターフェイスへのポインタを受け取る。呼び出し元はインターフェイスを解放する必要がある。
%inst
Microsoft Media Foundation バイトストリームをラップする IStream ポインタを返す。

[戻り値]
関数が成功すると S_OK を返す。そうでなければ HRESULT エラーコードを返す。

[備考]
アプリケーションが Media Foundation バイトストリームを IStream ポインタを受け取る API に渡せるようにする。


%index
MFCreateStreamOnMFByteStreamEx
Microsoft Media Foundation バイトストリームをラップする IRandomAccessStream オブジェクトを作成する。
%group
Win32 mfplat
%prm
pByteStream, riid, ppv
pByteStream : [var] Media Foundation バイトストリームの IMFByteStream インターフェイスへのポインタ。
riid : [var] 要求されるインターフェイスの識別子 (IID)。
ppv : [var] 要求されたインターフェイスへのポインタを受け取る。呼び出し元はインターフェイスを解放する必要がある。
%inst
Microsoft Media Foundation バイトストリームをラップする IRandomAccessStream
オブジェクトを作成する。

[戻り値]
関数が成功すると S_OK を返す。そうでなければ HRESULT エラーコードを返す。

[備考]
返されるバイトストリームオブジェクトは IMFGetService インターフェイスを公開する。元の IMFByteStream
ポインタを取得するには、サービス識別子 MF_WRAPPED_OBJECT で IMFGetService::GetService
を呼び出す。


%index
MFCreateSystemTimeSource
システム時刻に基づくプレゼンテーション時刻ソースを作成する。
%group
Win32 mfplat
%prm
ppSystemTimeSource
ppSystemTimeSource : [var] オブジェクトの IMFPresentationTimeSource インターフェイスへのポインタを受け取る。呼び出し元はインターフェイスを解放する必要がある。
%inst
システム時刻に基づくプレゼンテーション時刻ソースを作成する。

[戻り値]
関数は HRESULT を返す。このドキュメントは省略されている。


%index
MFCreateTempFile
一時ローカルファイルを裏付けとするバイトストリームを作成する。
%group
Win32 mfplat
%prm
AccessMode, OpenMode, fFlags, ppIByteStream
AccessMode : [int] 要求するアクセスモード。MF_FILE_ACCESSMODE 列挙型のメンバで指定する。
OpenMode : [int] ファイルが既に存在する場合または存在しない場合の関数の動作。MF_FILE_OPENMODE 列挙型のメンバで指定する。
fFlags : [int] MF_FILE_FLAGS 列挙型の値のビット単位 OR。
ppIByteStream : [var] バイトストリームの IMFByteStream インターフェイスへのポインタを受け取る。呼び出し元はインターフェイスを解放する必要がある。
%inst
一時ローカルファイルを裏付けとするバイトストリームを作成する。

[戻り値]
関数が成功すると S_OK を返す。そうでなければ HRESULT エラーコードを返す。

[備考]
システムの一時フォルダ内にファイルを作成し、そのファイル用のバイトストリームオブジェクトを返す。フルパス名は
MF_BYTESTREAM_ORIGIN_NAME 属性に格納される。ファイルは FILE_FLAG_DELETE_ON_CLOSE
フラグで作成され、バイトストリーム解放後に削除される。


%index
MFCreateTrackedSample
ビデオメディアサンプルの参照カウントを追跡する IMFTrackedSample オブジェクトを作成する。
%group
Win32 mfplat
%prm
ppMFSample
ppMFSample : [var] IMFTrackedSample インターフェイスへのポインタを受け取る。
%inst
ビデオメディアサンプルの参照カウントを追跡する IMFTrackedSample オブジェクトを作成する。


%index
MFCreateTransformActivate
Media Foundation transform (MFT) 用の汎用アクティベーションオブジェクトを作成する。
%group
Win32 mfplat
%prm
ppActivate
ppActivate : [var] IMFActivate インターフェイスへのポインタを受け取る。呼び出し元はインターフェイスを解放する必要がある。
%inst
Media Foundation transform (MFT) 用の汎用アクティベーションオブジェクトを作成する。

[戻り値]
関数が成功すると S_OK を返す。そうでなければ HRESULT エラーコードを返す。

[備考]
大半のアプリケーションはこの関数を使用しない。MFTEnumEx
関数が内部的に使用する。アクティベーションオブジェクトは他のオブジェクトを作成するヘルパーで、クラスファクトリに似ている。MFT
がアクティベートオブジェクトから作成される前に、呼び出し元は属性を設定して初期化する必要がある。このドキュメントは省略されている。


%index
MFCreateVideoMediaType
MFVIDEOFORMAT 構造体からビデオメディア型を作成する。
%group
Win32 mfplat
%prm
pVideoFormat, ppIVideoMediaType
pVideoFormat : [var] ビデオフォーマットを記述する MFVIDEOFORMAT 構造体へのポインタ。
ppIVideoMediaType : [var] IMFVideoMediaType インターフェイスへのポインタを受け取る。呼び出し元はインターフェイスを解放する必要がある。
%inst
MFVIDEOFORMAT 構造体からビデオメディア型を作成する。

[戻り値]
関数が成功すると S_OK を返す。そうでなければ HRESULT エラーコードを返す。

[備考]
MFVIDEOFORMAT 構造体を使用する代わりに MFCreateMediaType を呼び出して属性を直接設定することもできる。


%index
MFCreateVideoMediaTypeFromBitMapInfoHeader
この関数は実装されていない。(MFCreateVideoMediaTypeFromBitMapInfoHeader)
%group
Win32 mfplat
%prm
pbmihBitMapInfoHeader, dwPixelAspectRatioX, dwPixelAspectRatioY, InterlaceMode, VideoFlags, qwFramesPerSecondNumerator, qwFramesPerSecondDenominator, dwMaxBitRate, ppIVideoMediaType
pbmihBitMapInfoHeader : [var] 予約。
dwPixelAspectRatioX : [int] 予約。
dwPixelAspectRatioY : [int] 予約。
InterlaceMode : [int] 予約。
VideoFlags : [int64] 予約。
qwFramesPerSecondNumerator : [int64] 予約。
qwFramesPerSecondDenominator : [int64] 予約。
dwMaxBitRate : [int] 予約。
ppIVideoMediaType : [var] 予約。
%inst
この関数は実装されていない。(MFCreateVideoMediaTypeFromBitMapInfoHeader)

[戻り値]
E_FAIL を返す。

[備考]
Windows 7 より前は evr.dll からエクスポートされていた。


%index
MFCreateVideoMediaTypeFromBitMapInfoHeaderEx
BITMAPINFOHEADER 構造体からビデオメディア型を作成する。
%group
Win32 mfplat
%prm
pbmihBitMapInfoHeader, cbBitMapInfoHeader, dwPixelAspectRatioX, dwPixelAspectRatioY, InterlaceMode, VideoFlags, dwFramesPerSecondNumerator, dwFramesPerSecondDenominator, dwMaxBitRate, ppIVideoMediaType
pbmihBitMapInfoHeader : [var] 変換する BITMAPINFOHEADER 構造体へのポインタ。
cbBitMapInfoHeader : [int] BITMAPINFOHEADER 構造体のサイズ (バイト単位)。構造体に続くパレットエントリやカラーマスクのサイズを含む。
dwPixelAspectRatioX : [int] ピクセルアスペクト比の X 寸法。
dwPixelAspectRatioY : [int] ピクセルアスペクト比の Y 寸法。
InterlaceMode : [int] ビデオのインタレース方式を指定する MFVideoInterlaceMode 列挙型のメンバ。
VideoFlags : [int64] MFVideoFlags 列挙型のフラグのビット単位 OR。
dwFramesPerSecondNumerator : [int] フレームレートの分子 (フレーム/秒)。
dwFramesPerSecondDenominator : [int] フレームレートの分母 (フレーム/秒)。
dwMaxBitRate : [int] ビデオストリームのおおよそのデータレート (ビット/秒)。不明な場合は 0 を指定する。
ppIVideoMediaType : [var] IMFVideoMediaType インターフェイスへのポインタを受け取る。呼び出し元はインターフェイスを解放する必要がある。
%inst
BITMAPINFOHEADER 構造体からビデオメディア型を作成する。

[戻り値]
関数が成功すると S_OK を返す。そうでなければ HRESULT エラーコードを返す。


%index
MFCreateVideoMediaTypeFromSubtype
指定したサブタイプを持つ部分的なビデオメディア型を作成する。
%group
Win32 mfplat
%prm
pAMSubtype, ppIVideoMediaType
pAMSubtype : [var] サブタイプを指定する GUID へのポインタ。Video Subtype GUIDs を参照。
ppIVideoMediaType : [var] IMFVideoMediaType インターフェイスへのポインタを受け取る。呼び出し元はインターフェイスを解放する必要がある。
%inst
指定したサブタイプを持つ部分的なビデオメディア型を作成する。

[戻り値]
関数が成功すると S_OK を返す。そうでなければ HRESULT エラーコードを返す。

[備考]
この関数はメディア型を作成し、メジャータイプを MFMediaType_Video、サブタイプを pAMSubtype
で指定した値に設定する。このドキュメントは省略されている。


%index
MFCreateVideoSampleAllocatorEx
Microsoft DirectX Graphics Infrastructure (DXGI) と互換性のあるビデオサンプルを割り当てるオブジェクトを作成する。
%group
Win32 mfplat
%prm
riid, ppSampleAllocator
riid : [var] 
ppSampleAllocator : [var] 要求されたインターフェイスへのポインタを受け取る。呼び出し元はインターフェイスを解放する必要がある。
%inst
Microsoft DirectX Graphics Infrastructure (DXGI)
と互換性のあるビデオサンプルを割り当てるオブジェクトを作成する。

[戻り値]
関数が成功すると S_OK を返す。そうでなければ HRESULT エラーコードを返す。

[備考]
DXGI ビデオサーフェス用のアロケータを作成する。このアロケータが作成するバッファは IMFDXGIBuffer
インターフェイスを公開する。Direct3D 9 ビデオサーフェス用のアロケータを作成するには
MFCreateVideoSampleAllocator を呼び出す。


%index
MFCreateWICBitmapBuffer
Windows Imaging Component (WIC) を管理するメディアバッファオブジェクトを作成する。
%group
Win32 mfplat
%prm
riid, punkSurface, ppBuffer
riid : [var] このパラメータは __uuidof(IWICBitmap) に設定する。
punkSurface : [var] ビットマップサーフェスの IUnknown インターフェイスへのポインタ。IWICBitmap を公開する WIC ビットマップでなければならない。
ppBuffer : [var] IMFMediaBuffer インターフェイスへのポインタを受け取る。呼び出し元はインターフェイスを解放する必要がある。
%inst
Windows Imaging Component (WIC) を管理するメディアバッファオブジェクトを作成する。

[戻り値]
関数が成功すると S_OK を返す。そうでなければ HRESULT エラーコードを返す。


%index
MFCreateWaveFormatExFromMFMediaType
Media Foundation オーディオメディア型を WAVEFORMATEX 構造体に変換する。
%group
Win32 mfplat
%prm
pMFType, ppWF, pcbSize, Flags
pMFType : [var] メディア型の IMFMediaType インターフェイスへのポインタ。
ppWF : [var] WAVEFORMATEX 構造体へのポインタを受け取る。呼び出し元は CoTaskMemFree を呼んで構造体のメモリを解放する必要がある。
pcbSize : [var] WAVEFORMATEX 構造体のサイズを受け取る。
Flags : [int] MFWaveFormatExConvertFlags 列挙型のフラグ。
%inst
Media Foundation オーディオメディア型を WAVEFORMATEX 構造体に変換する。

[戻り値]
関数は HRESULT を返す。このドキュメントは省略されている。

[備考]
返された構造体の wFormatTag メンバが WAVE_FORMAT_EXTENSIBLE の場合、ポインタを
WAVEFORMATEXTENSIBLE 構造体にキャストできる。


%index
MFDeserializeAttributesFromStream
ストリームから属性を属性ストアに読み込む。
%group
Win32 mfplat
%prm
pAttr, dwOptions, pStm
pAttr : [var] 属性ストアの IMFAttributes インターフェイスへのポインタ。
dwOptions : [int] MF_ATTRIBUTE_SERIALIZE_OPTIONS 列挙型のフラグ 0 個以上のビット単位 OR。
pStm : [var] 属性を読み取るストリームの IStream インターフェイスへのポインタ。
%inst
ストリームから属性を属性ストアに読み込む。

[戻り値]
関数は HRESULT を返す。このドキュメントは省略されている。

[備考]
MFSerializeAttributesToStream でシリアライズされた属性ストアをデシリアライズする。dwOptions に
MF_ATTRIBUTE_SERIALIZE_UNKNOWN_BYREF が含まれる場合、IUnknown
ポインタを次のようにデシリアライズする。このドキュメントは省略されている。


%index
MFDeserializePresentationDescriptor
バイト配列からプレゼンテーション記述子をデシリアライズする。
%group
Win32 mfplat
%prm
cbData, pbData, ppPD
cbData : [int] pbData 配列のサイズ (バイト単位)。
pbData : [var] シリアライズされたプレゼンテーション記述子を含むバイト配列へのポインタ。
ppPD : [var] プレゼンテーション記述子の IMFPresentationDescriptor インターフェイスへのポインタを受け取る。呼び出し元はインターフェイスを解放する必要がある。
%inst
バイト配列からプレゼンテーション記述子をデシリアライズする。

[戻り値]
関数は HRESULT を返す。このドキュメントは省略されている。


%index
MFEndCreateFile
ファイルからバイトストリームを作成する非同期要求を完了する。
%group
Win32 mfplat
%prm
pResult, ppFile
pResult : [var] IMFAsyncResult インターフェイスへのポインタ。コールバックオブジェクトが Invoke メソッドで受け取ったのと同じポインタを渡す。
ppFile : [var] バイトストリームの IMFByteStream インターフェイスへのポインタを受け取る。呼び出し元はインターフェイスを解放する必要がある。
%inst
ファイルからバイトストリームを作成する非同期要求を完了する。

[戻り値]
関数は HRESULT を返す。このドキュメントは省略されている。

[備考]
MFBeginCreateFile 関数が非同期で完了したときにこの関数を呼び出す。


%index
MFFrameRateToAverageTimePerFrame
ビデオフレームレートをフレーム継続時間に変換する。
%group
Win32 mfplat
%prm
unNumerator, unDenominator, punAverageTimePerFrame
unNumerator : [int] フレームレートの分子。
unDenominator : [int] フレームレートの分母。
punAverageTimePerFrame : [var] ビデオフレームの平均継続時間を 100 ナノ秒単位で受け取る。
%inst
ビデオフレームレートをフレーム継続時間に変換する。

[戻り値]
関数が成功すると S_OK を返す。そうでなければ HRESULT エラーコードを返す。

[備考]

指定したフレームレートからサンプルのタイムスタンプを計算するのに便利。一般的なフレームレートについてはルックアップテーブルからフレーム継続時間を取得する。このドキュメントは省略されている。


%index
MFGetAttributesAsBlob
属性ストアの内容をバイト配列に変換する。
%group
Win32 mfplat
%prm
pAttributes, pBuf, cbBufSize
pAttributes : [var] 属性ストアの IMFAttributes インターフェイスへのポインタ。
pBuf : [var] 属性データを受け取る配列へのポインタ。
cbBufSize : [int] pBuf 配列のサイズ (バイト単位)。必要サイズは MFGetAttributesAsBlobSize で取得する。
%inst
属性ストアの内容をバイト配列に変換する。

[戻り値]
関数は HRESULT を返す。このドキュメントは省略されている。

[備考]
IUnknown ポインタ値 (MF_ATTRIBUTE_IUNKNOWN)
を持つ属性はスキップされ、配列には格納されない。バイト配列から属性ストアに戻すには MFInitAttributesFromBlob
を呼び出す。ストリームに書き込むには MFSerializeAttributesToStream を呼び出す。


%index
MFGetAttributesAsBlobSize
MFGetAttributesAsBlob 関数に必要なバッファサイズを取得する。
%group
Win32 mfplat
%prm
pAttributes, pcbBufSize
pAttributes : [var] 属性ストアの IMFAttributes インターフェイスへのポインタ。
pcbBufSize : [var] 必要な配列サイズ (バイト単位) を受け取る。
%inst
MFGetAttributesAsBlob 関数に必要なバッファサイズを取得する。

[戻り値]
関数は HRESULT を返す。このドキュメントは省略されている。

[備考]
MFGetAttributesAsBlob 関数に必要な配列サイズを取得するために使用する。


%index
MFGetContentProtectionSystemCLSID
コンテンツ保護システムのクラス識別子を取得する。
%group
Win32 mfplat
%prm
guidProtectionSystemID, pclsid
guidProtectionSystemID : [var] コンテンツ保護システムを識別する GUID。
pclsid : [var] コンテンツ保護システムのクラス識別子を受け取る。
%inst
コンテンツ保護システムのクラス識別子を取得する。

[戻り値]
関数が成功すると S_OK を返す。そうでなければ HRESULT エラーコードを返す。

[備考]
クラス識別子を使用して入力信頼機関 (ITA) を作成できる。CoCreateInstance または
IMFPMPHost::CreateObjectByCLSID を呼び出して IMFTrustedInput ポインタを取得する。


%index
MFGetMFTMerit
ハードウェアコーデックのメリット値を取得する。
%group
Win32 mfplat
%prm
pMFT, cbVerifier, verifier, merit
pMFT : [var] コーデックを表す Media Foundation transform (MFT) の IUnknown インターフェイスへのポインタ。
cbVerifier : [int] verifier 配列のサイズ (バイト単位)。
verifier : [var] 次のいずれかを含むバッファのアドレス。このドキュメントは省略されている。
merit : [var] メリット値を受け取る。
%inst
ハードウェアコーデックのメリット値を取得する。

[戻り値]
関数が成功すると S_OK を返す。そうでなければ HRESULT エラーコードを返す。

[備考]
MFT が有効な Output Protection Manager (OPM)
証明書を持つハードウェアデバイスを表していない場合、関数は失敗する。


%index
MFGetPluginControl
Microsoft Media Foundation プラグインマネージャへのポインタを取得する。
%group
Win32 mfplat
%prm
ppPluginControl
ppPluginControl : [var] IMFPluginControl インターフェイスへのポインタを受け取る。呼び出し元はインターフェイスを解放する必要がある。
%inst
Microsoft Media Foundation プラグインマネージャへのポインタを取得する。

[戻り値]
関数が成功すると S_OK を返す。そうでなければ HRESULT エラーコードを返す。


%index
MFGetStrideForBitmapInfoHeader
ビデオフォーマットの最小サーフェスストライドを計算する。
%group
Win32 mfplat
%prm
format, dwWidth, pStride
format : [int] ビデオフォーマットを指定する FOURCC コードまたは D3DFORMAT 値。
dwWidth : [int] 画像の幅 (ピクセル単位)。
pStride : [var] 最小サーフェスストライドをピクセル単位で受け取る。
%inst
ビデオフォーマットの最小サーフェスストライドを計算する。

[戻り値]
関数が成功すると S_OK を返す。そうでなければ HRESULT エラーコードを返す。

[備考]

画像をメモリに格納するために必要な最小ストライドを計算する。システムメモリにバッファを割り当てる場合に使用する。ビデオメモリのサーフェスはグラフィックスカードによってはより大きなストライドを要する場合がある。プレーナ
YUV フォーマットでは Y プレーンのストライドを返す。


%index
MFGetSystemTime
システム時刻を返す。
%group
Win32 mfplat
%prm

%inst
システム時刻を返す。

[戻り値]
システム時刻を 100 ナノ秒単位で返す。


%index
MFGetTimerPeriodicity
MFAddPeriodicCallback 関数のタイマー間隔を取得する。
%group
Win32 mfplat
%prm
Periodicity
Periodicity : [var] タイマー間隔をミリ秒単位で受け取る。
%inst
MFAddPeriodicCallback 関数のタイマー間隔を取得する。

[戻り値]
関数は HRESULT を返す。このドキュメントは省略されている。


%index
MFGetUncompressedVideoFormat
非圧縮ビデオフォーマットの FOURCC または D3DFORMAT 値を返す。
%group
Win32 mfplat
%prm
pVideoFormat
pVideoFormat : [var] MFVIDEOFORMAT 構造体へのポインタ。
%inst
非圧縮ビデオフォーマットの FOURCC または D3DFORMAT 値を返す。

[戻り値]
ビデオフォーマットを識別する FOURCC または D3DFORMAT 値を返す。圧縮または認識されない場合は
D3DFMT_UNKNOWN。

[備考]
Windows 7 より前は evr.dll からエクスポートされていた。


%index
MFHeapAlloc
メモリブロックを割り当てる。(MFHeapAlloc)
%group
Win32 mfplat
%prm
nSize, dwFlags, pszFile, line, eat
nSize : [int] 割り当てるバイト数。
dwFlags : [int] 0 個以上のフラグ。詳細は HeapAlloc を参照。
pszFile : [str] 予約。NULL を指定する。
line : [int] 予約。0 を指定する。
eat : [int] 予約。eAllocationTypeIgnore を指定する。
%inst
メモリブロックを割り当てる。(MFHeapAlloc)

[戻り値]
関数が成功すると割り当てたメモリブロックへのポインタを返す。失敗時は NULL を返す。

[備考]
現在の Media Foundation のバージョンでは、呼び出し元プロセスのヒープを指定して HeapAlloc
を呼び出すのと等価。解放には MFHeapFree を呼び出す。


%index
MFHeapFree
MFHeapAlloc で割り当てたメモリブロックを解放する。
%group
Win32 mfplat
%prm
pv
pv : [intptr] 解放するメモリへのポインタ。
%inst
MFHeapAlloc で割り当てたメモリブロックを解放する。


%index
MFInitAMMediaTypeFromMFMediaType
Media Foundation メディア型から DirectShow AM_MEDIA_TYPE 構造体を初期化する。
%group
Win32 mfplat
%prm
pMFType, guidFormatBlockType, pAMType
pMFType : [var] 変換元のメディア型の IMFMediaType インターフェイスへのポインタ。
guidFormatBlockType : [int] フォーマット型 GUID。AM_MEDIA_TYPE 構造体の formattype メンバに対応する。GUID_NULL の場合、メジャータイプとサブタイプから推測する。
pAMType : [var] AM_MEDIA_TYPE 構造体へのポインタ。関数がフォーマットブロックのメモリを割り当てる。呼び出し元は pbFormat メンバに CoTaskMemFree を呼んで解放する必要がある。
%inst
Media Foundation メディア型から DirectShow AM_MEDIA_TYPE 構造体を初期化する。

[戻り値]
関数は HRESULT を返す。このドキュメントは省略されている。

[備考]
AM_MEDIA_TYPE と等価な以下のフォーマット構造体でも使用できる。このドキュメントは省略されている。


%index
MFInitAttributesFromBlob
バイト配列から属性ストアの内容を初期化する。
%group
Win32 mfplat
%prm
pAttributes, pBuf, cbBufSize
pAttributes : [var] 属性ストアの IMFAttributes インターフェイスへのポインタ。
pBuf : [var] 初期化データを含む配列へのポインタ。
cbBufSize : [int] pBuf 配列のサイズ (バイト単位)。
%inst
バイト配列から属性ストアの内容を初期化する。

[戻り値]
関数は HRESULT を返す。このドキュメントは省略されている。

[備考]
MFGetAttributesAsBlob でシリアライズされた属性ストアをデシリアライズする。pAttributes
に以前格納されていた属性は削除される。


%index
MFInitMediaTypeFromAMMediaType
DirectShow AM_MEDIA_TYPE 構造体からメディア型を初期化する。
%group
Win32 mfplat
%prm
pMFType, pAMType
pMFType : [var] 初期化するメディア型の IMFMediaType インターフェイスへのポインタ。未初期化のメディア型オブジェクトは MFCreateMediaType で作成する。
pAMType : [var] メディア型を記述する AM_MEDIA_TYPE 構造体へのポインタ。呼び出し元は構造体メンバを事前に設定する必要がある。
%inst
DirectShow AM_MEDIA_TYPE 構造体からメディア型を初期化する。

[戻り値]
関数は HRESULT を返す。このドキュメントは省略されている。

[備考]
AM_MEDIA_TYPE と等価な以下のフォーマット構造体でも使用できる。このドキュメントは省略されている。


%index
MFInitMediaTypeFromMFVideoFormat
MFVIDEOFORMAT 構造体からメディア型を初期化する。
%group
Win32 mfplat
%prm
pMFType, pMFVF, cbBufSize
pMFType : [var] 初期化するメディア型の IMFMediaType インターフェイスへのポインタ。
pMFVF : [var] メディア型を記述する MFVIDEOFORMAT 構造体へのポインタ。
cbBufSize : [int] MFVIDEOFORMAT 構造体のサイズ (バイト単位)。
%inst
MFVIDEOFORMAT 構造体からメディア型を初期化する。

[戻り値]
関数が成功すると S_OK を返す。そうでなければ HRESULT エラーコードを返す。


%index
MFInitMediaTypeFromMPEG1VideoInfo
DirectShow MPEG1VIDEOINFO 構造体からメディア型を初期化する。
%group
Win32 mfplat
%prm
pMFType, pMP1VI, cbBufSize, pSubtype
pMFType : [var] 初期化するメディア型の IMFMediaType インターフェイスへのポインタ。
pMP1VI : [var] メディア型を記述する MPEG1VIDEOINFO 構造体へのポインタ。
cbBufSize : [int] MPEG1VIDEOINFO 構造体のサイズ (バイト単位)。
pSubtype : [var] サブタイプ GUID へのポインタ。NULL でもよい。NULL の場合 biCompression フィールドからサブタイプを推測する。
%inst
DirectShow MPEG1VIDEOINFO 構造体からメディア型を初期化する。

[戻り値]
関数は HRESULT を返す。このドキュメントは省略されている。


%index
MFInitMediaTypeFromMPEG2VideoInfo
DirectShow MPEG2VIDEOINFO 構造体からメディア型を初期化する。
%group
Win32 mfplat
%prm
pMFType, pMP2VI, cbBufSize, pSubtype
pMFType : [var] 初期化するメディア型の IMFMediaType インターフェイスへのポインタ。
pMP2VI : [var] メディア型を記述する MPEG2VIDEOINFO 構造体へのポインタ。
cbBufSize : [int] MPEG2VIDEOINFO 構造体のサイズ (バイト単位)。
pSubtype : [var] サブタイプ GUID へのポインタ。NULL でもよい。
%inst
DirectShow MPEG2VIDEOINFO 構造体からメディア型を初期化する。

[戻り値]
関数は HRESULT を返す。このドキュメントは省略されている。


%index
MFInitMediaTypeFromVideoInfoHeader
DirectShow VIDEOINFOHEADER 構造体からメディア型を初期化する。
%group
Win32 mfplat
%prm
pMFType, pVIH, cbBufSize, pSubtype
pMFType : [var] 初期化するメディア型の IMFMediaType インターフェイスへのポインタ。
pVIH : [var] メディア型を記述する VIDEOINFOHEADER 構造体へのポインタ。
cbBufSize : [int] VIDEOINFOHEADER 構造体のサイズ (バイト単位)。
pSubtype : [var] サブタイプ GUID へのポインタ。NULL でもよい。
%inst
DirectShow VIDEOINFOHEADER 構造体からメディア型を初期化する。

[戻り値]
関数が成功すると S_OK を返す。そうでなければ HRESULT エラーコードを返す。

[備考]
このドキュメントは省略されている。


%index
MFInitMediaTypeFromVideoInfoHeader2
DirectShow VIDEOINFOHEADER2 構造体からメディア型を初期化する。
%group
Win32 mfplat
%prm
pMFType, pVIH2, cbBufSize, pSubtype
pMFType : [var] 初期化するメディア型の IMFMediaType インターフェイスへのポインタ。
pVIH2 : [var] メディア型を記述する VIDEOINFOHEADER2 構造体へのポインタ。
cbBufSize : [int] VIDEOINFOHEADER2 構造体のサイズ (バイト単位)。
pSubtype : [var] サブタイプ GUID へのポインタ。NULL でもよい。
%inst
DirectShow VIDEOINFOHEADER2 構造体からメディア型を初期化する。

[戻り値]
関数は HRESULT を返す。このドキュメントは省略されている。


%index
MFInitMediaTypeFromWaveFormatEx
WAVEFORMATEX 構造体からメディア型を初期化する。
%group
Win32 mfplat
%prm
pMFType, pWaveFormat, cbBufSize
pMFType : [var] 初期化するメディア型の IMFMediaType インターフェイスへのポインタ。
pWaveFormat : [var] メディア型を記述する WAVEFORMATEX 構造体へのポインタ。
cbBufSize : [int] WAVEFORMATEX 構造体のサイズ (バイト単位)。
%inst
WAVEFORMATEX 構造体からメディア型を初期化する。

[戻り値]
関数は HRESULT を返す。このドキュメントは省略されている。


%index
MFInitVideoFormat
DVD、アナログテレビ、ATSC デジタルテレビなどの標準的なビデオフォーマット用に MFVIDEOFORMAT 構造体を初期化する。
%group
Win32 mfplat
%prm
pVideoFormat, type
pVideoFormat : [var] MFVIDEOFORMAT 構造体へのポインタ。関数は type パラメータで指定されたビデオフォーマットに基づいて構造体メンバを埋める。
type : [int] ビデオフォーマット。MFStandardVideoFormat 列挙型のメンバで指定する。
%inst
DVD、アナログテレビ、ATSC デジタルテレビなどの標準的なビデオフォーマット用に MFVIDEOFORMAT 構造体を初期化する。

[戻り値]
関数が成功すると S_OK を返す。そうでなければ HRESULT エラーコードを返す。

[備考]
Windows 7 より前は evr.dll からエクスポートされていた。


%index
MFInitVideoFormat_RGB
非圧縮 RGB ビデオフォーマット用に MFVIDEOFORMAT 構造体を初期化する。
%group
Win32 mfplat
%prm
pVideoFormat, dwWidth, dwHeight, D3Dfmt
pVideoFormat : [var] MFVIDEOFORMAT 構造体へのポインタ。関数がフォーマット情報で構造体メンバを埋める。
dwWidth : [int] ビデオの幅 (ピクセル単位)。
dwHeight : [int] ビデオの高さ (ピクセル単位)。
D3Dfmt : [int] RGB フォーマットを指定する D3DFORMAT 値。
%inst
非圧縮 RGB ビデオフォーマット用に MFVIDEOFORMAT 構造体を初期化する。

[戻り値]
関数が成功すると S_OK を返す。そうでなければ HRESULT エラーコードを返す。

[備考]
指定した RGB フォーマットに対して妥当な既定値を設定する。MFVIDEOFORMAT
構造体の代わりにメディア型属性を使用することが推奨される。


%index
MFIsContentProtectionDeviceSupported
指定したメディア保護システム向けにハードウェアセキュリティプロセッサがサポートされているかを確認する。
%group
Win32 mfplat
%prm
ProtectionSystemId, isSupported
ProtectionSystemId : [var] 確認する保護システムの識別子。
isSupported : [var] 指定した保護システムに対してハードウェアセキュリティプロセッサがサポートされている場合は TRUE、そうでなければ FALSE。
%inst
指定したメディア保護システム向けにハードウェアセキュリティプロセッサがサポートされているかを確認する。


%index
MFLockDXGIDeviceManager
共有の Microsoft DirectX Graphics Infrastructure (DXGI) Device Manager をロックする。
%group
Win32 mfplat
%prm
pResetToken, ppManager
pResetToken : [var] この DXGI Device Manager インスタンスを識別するトークンを受け取る。IMFDXGIDeviceManager::ResetDevice 呼び出し時に使用する。NULL でもよい。
ppManager : [var] IMFDXGIDeviceManager インターフェイスへのポインタを受け取る。呼び出し元はインターフェイスを解放する必要がある。
%inst
共有の Microsoft DirectX Graphics Infrastructure (DXGI) Device Manager
をロックする。

[戻り値]
関数が成功すると S_OK を返す。そうでなければ HRESULT エラーコードを返す。

[備考]
コンポーネント間で共有可能な DXGI Device Manager インスタンスへのポインタを取得する。Microsoft Media
Foundation プラットフォームはこのインスタンスをシングルトンとして作成する。使用後は
MFUnlockDXGIDeviceManager を呼び出す。


%index
MFMapDX9FormatToDXGIFormat
Microsoft Direct3D 9 フォーマット識別子を Microsoft DirectX Graphics Infrastructure (DXGI) フォーマット識別子に変換する。
%group
Win32 mfplat
%prm
dx9
dx9 : [int] 変換する D3DFORMAT 値または FOURCC コード。
%inst
Microsoft Direct3D 9 フォーマット識別子を Microsoft DirectX Graphics
Infrastructure (DXGI) フォーマット識別子に変換する。

[戻り値]
DXGI_FORMAT 値を返す。


%index
MFMapDXGIFormatToDX9Format
DXGI フォーマット識別子を Direct3D 9 フォーマット識別子に変換する。
%group
Win32 mfplat
%prm
dx11
dx11 : [int] 変換する DXGI_FORMAT 値。
%inst
DXGI フォーマット識別子を Direct3D 9 フォーマット識別子に変換する。

[戻り値]
D3DFORMAT 値または FOURCC コードを返す。


%index
MFPutWorkItem
非同期操作をワークキューに登録する。(MFPutWorkItem)
%group
Win32 mfplat
%prm
dwQueue, pCallback, pState
dwQueue : [int] ワークキューの識別子。
pCallback : [var] IMFAsyncCallback インターフェイスへのポインタ。
pState : [var] 呼び出し元が定義する状態オブジェクトの IUnknown インターフェイスへのポインタ。NULL でもよい。
%inst
非同期操作をワークキューに登録する。(MFPutWorkItem)

[戻り値]
HRESULT 値を返す。このドキュメントは省略されている。

[備考]
非同期結果オブジェクトを作成し、ワークキューに登録する。ワークキューは pCallback の
IMFAsyncCallback::Invoke メソッドを呼び出す。


%index
MFPutWorkItem2
非同期操作を指定した優先度でワークキューに登録する。(MFPutWorkItem2)
%group
Win32 mfplat
%prm
dwQueue, Priority, pCallback, pState
dwQueue : [int] ワークキューの識別子。Media Foundation の標準ワークキューまたはアプリケーションが作成したワークキューを指定できる。
Priority : [int] ワークアイテムの優先度。優先度順に実行される。
pCallback : [var] IMFAsyncCallback インターフェイスへのポインタ。
pState : [var] 呼び出し元が定義する状態オブジェクトの IUnknown インターフェイスへのポインタ。NULL でもよい。
%inst
非同期操作を指定した優先度でワークキューに登録する。(MFPutWorkItem2)

[戻り値]
HRESULT 値を返す。このドキュメントは省略されている。


%index
MFPutWorkItemEx
非同期操作をワークキューに登録する。(MFPutWorkItemEx)
%group
Win32 mfplat
%prm
dwQueue, pResult
dwQueue : [int] ワークキューの識別子。
pResult : [var] 非同期結果オブジェクトの IMFAsyncResult インターフェイスへのポインタ。
%inst
非同期操作をワークキューに登録する。(MFPutWorkItemEx)

[戻り値]
HRESULT 値を返す。このドキュメントは省略されている。

[備考]
pResult を MFInvokeCallback に渡す。このドキュメントは省略されている。


%index
MFPutWorkItemEx2
非同期操作を指定した優先度でワークキューに登録する。(MFPutWorkItemEx2)
%group
Win32 mfplat
%prm
dwQueue, Priority, pResult
dwQueue : [int] ワークキューの識別子。
Priority : [int] ワークアイテムの優先度。1, 0, -1 のいずれか。1 の項目は 0 より先に、-1 は 0 より後に実行される。
pResult : [var] 非同期結果オブジェクトの IMFAsyncResult インターフェイスへのポインタ。MFCreateAsyncResult で作成する。
%inst
非同期操作を指定した優先度でワークキューに登録する。(MFPutWorkItemEx2)

[戻り値]
HRESULT 値を返す。このドキュメントは省略されている。

[備考]
ワークアイテムを呼び出すために、この関数は pResult を MFInvokeCallback
に渡す。コールバックは結果オブジェクト作成時に指定される。


%index
MFRegisterLocalByteStreamHandler
呼び出し元プロセス内にバイトストリームハンドラを登録する。
%group
Win32 mfplat
%prm
szFileExtension, szMimeType, pActivate
szFileExtension : [wstr] このハンドラのファイル拡張子を含む文字列。
szMimeType : [wstr] このハンドラの MIME 型を含む文字列。
pActivate : [var] アクティベーションオブジェクトの IMFActivate インターフェイスへのポインタ。呼び出し元が実装する。ActivateObject メソッドはバイトストリームハンドラ (IMFByteStreamHandler 公開) を作成する必要がある。
%inst
呼び出し元プロセス内にバイトストリームハンドラを登録する。

[戻り値]
関数が成功すると S_OK を返す。そうでなければ HRESULT エラーコードを返す。

[備考]
バイトストリームハンドラはソース解決過程で URL
からメディアソースを作成するために使用される。プロセス内ではローカルハンドラがレジストリ登録のハンドラより優先される。ローカルハンドラは他プロセスから見えない。szFileExtension
または szMimeType のいずれかは NULL でもよいが、少なくとも一方は非 NULL でなければならない。


%index
MFRegisterLocalSchemeHandler
呼び出し元プロセス内にスキームハンドラを登録する。
%group
Win32 mfplat
%prm
szScheme, pActivate
szScheme : [wstr] スキームを含む文字列。末尾の ':' 文字を含む (例: "http:")。
pActivate : [var] アクティベーションオブジェクトの IMFActivate インターフェイスへのポインタ。ActivateObject メソッドはスキームハンドラ (IMFSchemeHandler 公開) を作成する必要がある。
%inst
呼び出し元プロセス内にスキームハンドラを登録する。

[戻り値]
関数が成功すると S_OK を返す。そうでなければ HRESULT エラーコードを返す。

[備考]
プロセス内ではローカルスキームハンドラがレジストリ登録のハンドラより優先される。


%index
MFScheduleWorkItem
指定した間隔後に非同期操作を完了するようスケジュールする。(MFScheduleWorkItem)
%group
Win32 mfplat
%prm
pCallback, pState, Timeout, pKey
pCallback : [var] IMFAsyncCallback インターフェイスへのポインタ。
pState : [var] 状態オブジェクトの IUnknown インターフェイスへのポインタ。NULL でもよい。
Timeout : [int64] タイムアウト間隔 (ミリ秒)。負の値を指定する。－Timeout ミリ秒後にコールバックが呼ばれる (例: －5000 なら 5000ms 後)。
pKey : [var] タイマーをキャンセルするためのキーを受け取る。MFCancelWorkItem の Key パラメータに渡してキャンセルする。
%inst
指定した間隔後に非同期操作を完了するようスケジュールする。(MFScheduleWorkItem)

[戻り値]
関数は HRESULT を返す。このドキュメントは省略されている。

[備考]
非同期結果オブジェクトを作成する。タイマー間隔が経過すると pCallback の IMFAsyncCallback::Invoke
が呼ばれる。このドキュメントは省略されている。


%index
MFSerializeAttributesToStream
属性ストアの内容をストリームに書き込む。
%group
Win32 mfplat
%prm
pAttr, dwOptions, pStm
pAttr : [var] 属性ストアの IMFAttributes インターフェイスへのポインタ。
dwOptions : [int] MF_ATTRIBUTE_SERIALIZE_OPTIONS のフラグ 0 個以上のビット単位 OR。
pStm : [var] 属性を保存するストリームの IStream インターフェイスへのポインタ。
%inst
属性ストアの内容をストリームに書き込む。

[戻り値]
関数は HRESULT を返す。このドキュメントは省略されている。

[備考]
dwOptions に MF_ATTRIBUTE_SERIALIZE_UNKNOWN_BYREF が含まれる場合、属性ストアの
IUnknown ポインタをシリアライズする。このドキュメントは省略されている。


%index
MFSerializePresentationDescriptor
プレゼンテーション記述子をバイト配列にシリアライズする。
%group
Win32 mfplat
%prm
pPD, pcbData, ppbData
pPD : [var] シリアライズするプレゼンテーション記述子の IMFPresentationDescriptor インターフェイスへのポインタ。
pcbData : [var] ppbData 配列のサイズ (バイト単位) を受け取る。
ppbData : [var] シリアライズされたプレゼンテーション記述子を含むバイト配列へのポインタを受け取る。呼び出し元は CoTaskMemFree で解放する必要がある。
%inst
プレゼンテーション記述子をバイト配列にシリアライズする。

[戻り値]
関数は HRESULT を返す。このドキュメントは省略されている。

[備考]
デシリアライズするにはバイト配列を MFDeserializePresentationDescriptor に渡す。


%index
MFShutdown
Microsoft Media Foundation プラットフォームをシャットダウンする。
%group
Win32 mfplat
%prm

%inst
Microsoft Media Foundation プラットフォームをシャットダウンする。

[戻り値]
関数が成功すると S_OK を返す。そうでなければ HRESULT エラーコードを返す。

[備考]
MFShutdown
はアプリケーションの終了時に呼び出すべきであり、プロセス終了時の静的デストラクタから呼び出してはならない。このドキュメントは省略されている。


%index
MFSplitSample
結合されたメディアサンプルを個別のサンプルに分割する。
%group
Win32 mfplat
%prm
pSample, pOutputSamples, dwOutputSampleMaxCount, pdwOutputSampleCount
pSample : [var] 分割される結合サンプルを表す IMFSample へのポインタ。
pOutputSamples : [var] 分割操作からの出力サンプルの配列へのポインタを受け取る。
dwOutputSampleMaxCount : [int] 出力配列の最大サイズ。pSample に対して IMFSample::GetBufferCount を呼び出して上限を取得する。
pdwOutputSampleCount : [var] pOutputSamples 配列に含まれるサンプル数を受け取る出力パラメータ。
%inst
結合されたメディアサンプルを個別のサンプルに分割する。

[備考]
サンプルを結合するには MFCombineSamples を呼び出す。


%index
MFStartup
Microsoft Media Foundation を初期化する。
%group
Win32 mfplat
%prm
Version, dwFlags
Version : [int] バージョン番号。mfapi.h で定義された MF_VERSION を使用する。
dwFlags : [int] C++ では省略可能、C では必須。次のいずれかのフラグ。このドキュメントは省略されている。
%inst
Microsoft Media Foundation を初期化する。

[戻り値]
関数は HRESULT を返す。このドキュメントは省略されている。

[備考]
アプリケーションは Media Foundation を使用する前にこの関数を呼ばなければならない。終了前に MFStartup
の呼び出し回数分 MFShutdown を呼び出す。MFStartup
はアプリケーション初期化中に呼ぶべきで、プロセス初期化時の静的コンストラクタからは呼んではならない。ワークキュースレッドからも呼び出さない。このドキュメントは省略されている。


%index
MFTEnum
レジストリ内の Media Foundation transform (MFT) を列挙する。
%group
Win32 mfplat
%prm
guidCategory, Flags, pInputType, pOutputType, pAttributes, ppclsidMFT, pcMFTs
guidCategory : [int] 列挙する MFT のカテゴリを指定する GUID。
Flags : [int] 予約。0 でなければならない。
pInputType : [var] マッチさせる入力メディア型を指定する MFT_REGISTER_TYPE_INFO 構造体へのポインタ。NULL でもよい。
pOutputType : [var] マッチさせる出力メディア型を指定する MFT_REGISTER_TYPE_INFO 構造体へのポインタ。NULL でもよい。
pAttributes : [var] 予約。NULL に設定する。Windows Vista/Server 2008 では属性ストアの IMFAttributes を指定でき、レジストリ属性と照合される。Windows 7 以降では無視される。
ppclsidMFT : [var] CLSID の配列へのポインタを受け取る。この一覧から MFT を作成するには CLSID の 1 つで CoCreateInstance を呼び出す。詳細情報は MFTGetInfo で取得する。呼び出し元は CoTaskMemFree で配列メモリを解放する必要がある。
pcMFTs : [var] ppclsidMFT 配列の要素数を受け取る。
%inst
レジストリ内の Media Foundation transform (MFT) を列挙する。

[戻り値]
関数が成功すると S_OK を返す。そうでなければ HRESULT エラーコードを返す。

[備考]
指定カテゴリで pInputType, pOutputType, pAttributes による検索条件に合致する MFT
の一覧を返す。いずれのパラメータも NULL でよい。マッチしない場合は pcMFTs に 0 を返す。


%index
MFTEnum2
指定した検索条件にマッチする Microsoft Media Foundation transform (MFT) の一覧を取得する。
%group
Win32 mfplat
%prm
guidCategory, Flags, pInputType, pOutputType, pAttributes, pppMFTActivate, pnumMFTActivate
guidCategory : [int] 列挙する MFT のカテゴリを指定する GUID。MFT カテゴリの一覧は MFT_CATEGORY を参照。
Flags : [int] _MFT_ENUM_FLAG 列挙型のフラグ 0 個以上のビット単位 OR。
pInputType : [var] マッチさせる入力メディア型を指定する MFT_REGISTER_TYPE_INFO 構造体へのポインタ。NULL でもよい。NULL の場合すべての入力型にマッチ。
pOutputType : [var] マッチさせる出力メディア型を指定する MFT_REGISTER_TYPE_INFO 構造体へのポインタ。NULL でもよい。
pAttributes : [var] 標準属性ストアへのアクセスを可能にする IMFAttributes インターフェイスへのポインタ。特定のハードウェアアダプタを指定するには MFT_ENUM_ADAPTER_LUID 属性にアダプタの LUID を設定する。その場合、MFT_ENUM_FLAG_HARDWARE フラグも指定しなければ E_INVALIDARG が返る。
pppMFTActivate : [var] IMFActivate インターフェイスポインタの配列を受け取る。各ポインタは検索条件に合致した MFT のアクティベーションオブジェクトを表す。関数が配列のメモリを割り当てる。呼び出し元はポインタを解放し CoTaskMemFree で配列メモリを解放する必要がある。
pnumMFTActivate : [var] pppMFTActivate 配列の要素数を受け取る。該当 MFT がない場合は 0 を受け取る。
%inst
指定した検索条件にマッチする Microsoft Media Foundation transform (MFT) の一覧を取得する。

[戻り値]
メソッドが成功すると S_OK を返す。失敗時の戻り値には次の表のものを含む。このドキュメントは省略されている。

[備考]
Flags パラメータは列挙する MFT と返却順を制御する。このドキュメントは省略されている。


%index
MFTEnumEx
指定条件に合致する MFT の一覧を取得する。MFTEnum を拡張した関数。
%group
Win32 mfplat
%prm
guidCategory, Flags, pInputType, pOutputType, pppMFTActivate, pnumMFTActivate
guidCategory : [int] 列挙する MFT のカテゴリを指定する GUID。
Flags : [int] _MFT_ENUM_FLAG 列挙型のフラグ 0 個以上のビット単位 OR。
pInputType : [var] マッチさせる入力メディア型を指定する MFT_REGISTER_TYPE_INFO 構造体へのポインタ。NULL でもよい。
pOutputType : [var] マッチさせる出力メディア型を指定する MFT_REGISTER_TYPE_INFO 構造体へのポインタ。NULL でもよい。
pppMFTActivate : [var] IMFActivate インターフェイスポインタの配列を受け取る。
pnumMFTActivate : [var] pppMFTActivate 配列の要素数を受け取る。
%inst
指定条件に合致する MFT の一覧を取得する。MFTEnum を拡張した関数。

[戻り値]
関数が成功すると S_OK を返す。そうでなければ HRESULT エラーコードを返す。

[備考]
Flags は列挙対象と順序を制御する。このドキュメントは省略されている。


%index
MFTGetInfo
レジストリから Media Foundation transform (MFT) に関する情報を取得する。
%group
Win32 mfplat
%prm
clsidMFT, pszName, ppInputTypes, pcInputTypes, ppOutputTypes, pcOutputTypes, ppAttributes
clsidMFT : [int] MFT の CLSID。
pszName : [var] MFT のフレンドリ名を含むワイド文字列へのポインタを受け取る。呼び出し元は CoTaskMemFree で解放する必要がある。NULL でもよい。
ppInputTypes : [var] MFT_REGISTER_TYPE_INFO 構造体の配列へのポインタを受け取る。各メンバは MFT がサポートする入力フォーマットを記述する。呼び出し元は CoTaskMemFree で解放する必要がある。NULL でもよい。
pcInputTypes : [var] ppInputTypes 配列の要素数を受け取る。ppInputTypes が NULL の場合は無視される。
ppOutputTypes : [var] MFT_REGISTER_TYPE_INFO 構造体の配列へのポインタを受け取る。各メンバは MFT がサポートする出力フォーマットを記述する。呼び出し元は CoTaskMemFree で解放する必要がある。NULL でもよい。
pcOutputTypes : [var] ppOutputType 配列の要素数を受け取る。ppOutputTypes が NULL の場合は無視される。
ppAttributes : [var] 属性ストアの IMFAttributes インターフェイスへのポインタを受け取る。呼び出し元はインターフェイスを解放する必要がある。MFT のレジストリに格納された属性を含む場合がある。NULL でもよい。
%inst
レジストリから Media Foundation transform (MFT) に関する情報を取得する。

[戻り値]
関数が成功すると S_OK を返す。そうでなければ HRESULT エラーコードを返す。


%index
MFTRegister
Media Foundation transform (MFT) の情報をレジストリに追加する。
%group
Win32 mfplat
%prm
clsidMFT, guidCategory, pszName, Flags, cInputTypes, pInputTypes, cOutputTypes, pOutputTypes, pAttributes
clsidMFT : [int] MFT の CLSID。MFT は同じ CLSID で COM オブジェクトとしても登録されている必要がある。
guidCategory : [int] MFT のカテゴリを指定する GUID。
pszName : [wstr] MFT のフレンドリ名を含むワイド文字列。
Flags : [int] _MFT_ENUM_FLAG 列挙型のフラグ 0 個以上のビット単位 OR。このドキュメントは省略されている。
cInputTypes : [int] pInputTypes 配列の要素数。
pInputTypes : [var] MFT_REGISTER_TYPE_INFO 構造体の配列へのポインタ。各メンバは MFT がサポートする入力フォーマットを指定する。NULL でもよい。NULL の場合、入力型を NULL と指定したときのみ列挙される。
cOutputTypes : [int] pOutputTypes 配列の要素数。
pOutputTypes : [var] MFT_REGISTER_TYPE_INFO 構造体の配列へのポインタ。各メンバは MFT がサポートする出力フォーマットを定義する。NULL でもよい。
pAttributes : [var] 追加のレジストリ情報を含む属性ストアの IMFAttributes インターフェイスへのポインタ。NULL でもよい。非 NULL の場合、属性はバイト配列としてレジストリに書き込まれ、MFTGetInfo で取得できる。このドキュメントは省略されている。
%inst
Media Foundation transform (MFT) の情報をレジストリに追加する。

[戻り値]
関数が成功すると S_OK を返す。そうでなければ HRESULT エラーコードを返す。

[備考]
この関数が作成したレジストリエントリは次の関数で読み取られる。このドキュメントは省略されている。


%index
MFTRegisterLocal
Media Foundation transform (MFT) を呼び出し元プロセスに登録する。(MFTRegisterLocal)
%group
Win32 mfplat
%prm
pClassFactory, guidCategory, pszName, Flags, cInputTypes, pInputTypes, cOutputTypes, pOutputTypes
pClassFactory : [var] MFT を作成するクラスファクトリオブジェクトの IClassFactory インターフェイスへのポインタ。
guidCategory : [var] MFT のカテゴリを指定する GUID。
pszName : [wstr] MFT のフレンドリ名を含むワイド文字 NULL 終端文字列。
Flags : [int] _MFT_ENUM_FLAG 列挙型のフラグ 0 個以上のビット単位 OR。
cInputTypes : [int] pInputTypes 配列の要素数。
pInputTypes : [var] MFT_REGISTER_TYPE_INFO 構造体の配列へのポインタ。cInputTypes が 0 なら NULL でもよい。
cOutputTypes : [int] pOutputTypes 配列の要素数。
pOutputTypes : [var] MFT_REGISTER_TYPE_INFO 構造体の配列へのポインタ。cOutputTypes が 0 なら NULL でもよい。
%inst
Media Foundation transform (MFT) を呼び出し元プロセスに登録する。(MFTRegisterLocal)

[戻り値]
関数が成功すると S_OK を返す。そうでなければ HRESULT エラーコードを返す。

[備考]
この関数の主目的は、他プロセスやアプリケーションに MFT を公開せずに自動トポロジ解決で利用可能にすることである。呼び出し後は
MFTEnumEx に MFT_ENUM_FLAG_LOCALMFT
を指定して列挙できる。同一プロセス内でのみ見える。pClassFactory の
IClassFactory::CreateInstance は IMFTransform
をサポートするオブジェクトを返す必要がある。登録解除には MFTUnregisterLocal を呼び出す。PMP
プロセス内で登録する場合は IMFLocalMFTRegistration を使用する。


%index
MFTRegisterLocalByCLSID
Media Foundation transform (MFT) を呼び出し元プロセスに登録する。(MFTRegisterLocalByCLSID)
%group
Win32 mfplat
%prm
clisdMFT, guidCategory, pszName, Flags, cInputTypes, pInputTypes, cOutputTypes, pOutputTypes
clisdMFT : [var] MFT のクラス識別子 (CLSID)。
guidCategory : [var] MFT のカテゴリを指定する GUID。
pszName : [wstr] MFT のフレンドリ名を含むワイド文字 NULL 終端文字列。
Flags : [int] _MFT_ENUM_FLAG 列挙型のフラグ 0 個以上のビット単位 OR。
cInputTypes : [int] pInputTypes 配列の要素数。
pInputTypes : [var] MFT_REGISTER_TYPE_INFO 構造体の配列へのポインタ。cInputTypes が 0 なら NULL でもよい。
cOutputTypes : [int] pOutputTypes 配列の要素数。
pOutputTypes : [var] MFT_REGISTER_TYPE_INFO 構造体の配列へのポインタ。cOutputTypes が 0 なら NULL でもよい。
%inst
Media Foundation transform (MFT)
を呼び出し元プロセスに登録する。(MFTRegisterLocalByCLSID)

[戻り値]
関数が成功すると S_OK を返す。そうでなければ HRESULT エラーコードを返す。

[備考]
主目的は自動トポロジ解決で MFT を利用可能にしつつ、他プロセス/アプリケーションには公開しないこと。登録解除には
MFTUnregisterLocalByCLSID を呼び出す。PMP プロセス内での登録には
IMFLocalMFTRegistration を使用する。


%index
MFTUnregister
Media Foundation transform (MFT) の登録を解除する。
%group
Win32 mfplat
%prm
clsidMFT
clsidMFT : [int] MFT の CLSID。
%inst
Media Foundation transform (MFT) の登録を解除する。

[戻り値]
関数が成功すると S_OK を返す。そうでなければ HRESULT エラーコードを返す。

[備考]
MFTRegister 関数が作成したレジストリエントリを削除する。同じ CLSID で 2 回呼び出しても安全である。CLSID
がレジストリにない場合、関数は成功して何もしない。


%index
MFTUnregisterLocal
呼び出し元プロセスから 1 つ以上の Media Foundation transform (MFT) を登録解除する。
%group
Win32 mfplat
%prm
pClassFactory
pClassFactory : [var] クラスファクトリオブジェクトの IClassFactory インターフェイスへのポインタ。NULL でもよい。
%inst
呼び出し元プロセスから 1 つ以上の Media Foundation transform (MFT) を登録解除する。

[戻り値]
関数は HRESULT を返す。このドキュメントは省略されている。

[備考]
MFTRegisterLocal で登録したローカル MFT の登録を解除する。pClassFactory が NULL
の場合、プロセス内のすべてのローカル MFT が登録解除される。そうでない場合、指定クラスファクトリに関連付けられた MFT
のみ解除される。


%index
MFTUnregisterLocalByCLSID
Media Foundation transform (MFT) を呼び出し元プロセスから登録解除する。
%group
Win32 mfplat
%prm
clsidMFT
clsidMFT : [int] MFT のクラス識別子 (CLSID)。
%inst
Media Foundation transform (MFT) を呼び出し元プロセスから登録解除する。

[戻り値]
関数は HRESULT を返す。このドキュメントは省略されている。

[備考]
MFTRegisterLocalByCLSID で登録したローカル MFT の登録を解除する。


%index
MFUnlockDXGIDeviceManager
共有の Microsoft DirectX Graphics Infrastructure (DXGI) Device Manager のロックを解除する。
%group
Win32 mfplat
%prm

%inst
共有の Microsoft DirectX Graphics Infrastructure (DXGI) Device Manager
のロックを解除する。

[戻り値]
関数が成功すると S_OK を返す。そうでなければ HRESULT エラーコードを返す。

[備考]
MFLockDXGIDeviceManager の呼び出しに成功した後に呼び出す。


%index
MFUnwrapMediaType
MFWrapMediaType で別のメディア型にラップされたメディア型を取得する。
%group
Win32 mfplat
%prm
pWrap, ppOrig
pWrap : [var] MFWrapMediaType で取得したメディア型の IMFMediaType インターフェイスへのポインタ。
ppOrig : [var] 元のメディア型の IMFMediaType インターフェイスへのポインタを受け取る。呼び出し元はインターフェイスを解放する必要がある。
%inst
MFWrapMediaType で別のメディア型にラップされたメディア型を取得する。

[戻り値]
関数が成功すると S_OK を返す。そうでなければ HRESULT エラーコードを返す。

[備考]
このドキュメントは省略されている。


%index
MFValidateMediaTypeSize
ビデオフォーマットブロックのバッファサイズを検証する。
%group
Win32 mfplat
%prm
FormatType, pBlock, cbSize
FormatType : [int] 
pBlock : [var] フォーマットブロックを含むバッファへのポインタ。
cbSize : [int] pBlock バッファのサイズ (バイト単位)。
%inst
ビデオフォーマットブロックのバッファサイズを検証する。

[戻り値]
関数は HRESULT を返す。このドキュメントは省略されている。

[備考]
このドキュメントは省略されている。


%index
MFWrapMediaType
別のメディア型をラップするメディア型を作成する。
%group
Win32 mfplat
%prm
pOrig, MajorType, SubType, ppWrap
pOrig : [var] 新しいメディア型にラップするメディア型の IMFMediaType インターフェイスへのポインタ。
MajorType : [var] 新しいメディア型のメジャータイプを指定する GUID。Major Media Types を参照。
SubType : [var] 新しいメディア型のサブタイプを指定する GUID。このドキュメントは省略されている。
ppWrap : [var] 元のメディア型をラップする新しいメディア型の IMFMediaType インターフェイスへのポインタを受け取る。
%inst
別のメディア型をラップするメディア型を作成する。

[戻り値]
関数が成功すると S_OK を返す。そうでなければ HRESULT エラーコードを返す。

[備考]
元のメディア型 (pOrig) は新しいメディア型内に MF_MT_WRAPPED_TYPE
属性として格納される。元のメディア型を取り出すには MFUnwrapMediaType を呼び出す。


%index
MFllMulDiv
((a * b) + d) / c を計算する。各項は 64 ビット符号付き値。
%group
Win32 mfplat
%prm
a, b, c, d
a : [int64] 乗数。
b : [int64] もう 1 つの乗数。
c : [int64] 除数。
d : [int64] 丸め係数。
%inst
((a * b) + d) / c を計算する。各項は 64 ビット符号付き値。

[戻り値]
計算結果を返す。数値オーバーフロー時は _I64_MAX (正のオーバーフロー) または LLONG_MIN (負のオーバーフロー)
を返す。Mfplat.dll をロードできない場合は _I64_MAX を返す。

[備考]
以前のバージョンのトピックではパラメータが誤って説明されていた。除数は c、丸め係数は d である。

