; ============================================================
;   windowscodecs.dll ヘルプ (CsWin32 / win32metadata から自動抽出)
;   docs_ja.json に日本語訳があればそちらを使用、無ければ英語原文。
;   翻訳を追加するときは docs_ja.json を編集して再生成。
; ============================================================

%type
拡張命令
%ver
1.0
%dll
windowscodecs.dll
%date
2026/04/16
%author
IronHSP / CsWin32 bridge
%url
https://github.com/inovia/IronHSP
%port
Win

%note
Win32 API の windowscodecs.dll 関数群。CsWin32 + win32metadata から自動生成。
hsp3net 専用 (intptr / NSTRUCT / wstr を使用)。

%group
Win32API

%index
WICConvertBitmapSource
指定された IWICBitmapSource から、目的のピクセル形式の IWICBitmapSource を取得する。
%prm
dstFormat, pISrc, ppIDst
dstFormat : [var] 型: REFWICPixelFormatGUID 変換先のピクセル形式。
pISrc : [var] 型: IWICBitmapSource* 変換元のビットマップ。
ppIDst : [var] 型: IWICBitmapSource** NULL で初期化された変換先ビットマップポインタへのポインタ。
%inst
指定された IWICBitmapSource から、目的のピクセル形式の IWICBitmapSource を取得する。

[戻り値]
型: HRESULT 関数が成功すると **S_OK** を返す。失敗時は **HRESULT** エラーコードを返す。

[備考]
pISrc のビットマップがすでに目的の形式である場合、pISrc
が変換先ビットマップポインタにコピーされ、参照が追加される。そうでない場合、WICConvertBitmapSource は
dstFormat 形式のフォーマットコンバータをインスタンス化し、pISrc で初期化する。


%index
WICCreateBitmapFromSection
Windows Graphics Device Interface (GDI) セクションハンドルのピクセル領域を背後に持つ IWICBitmapSource を返す。(WICCreateBitmapFromSection)
%prm
width, height, pixelFormat, hSection, stride, offset, ppIBitmap
width : [int] 型: UINT ビットマップピクセルの幅。
height : [int] 型: UINT ビットマップピクセルの高さ。
pixelFormat : [var] 型: REFWICPixelFormatGUID ビットマップのピクセル形式。
hSection : [intptr] 型: HANDLE セクションハンドル。CreateFileMapping 関数が返すファイルマッピングオブジェクトのハンドルである。
stride : [int] 型: UINT 各走査線のバイト数。
offset : [int] 型: UINT セクション内のオフセット。
ppIBitmap : [var] 型: IWICBitmap** ビットマップを受け取るポインタ。
%inst
Windows Graphics Device Interface (GDI) セクションハンドルのピクセル領域を背後に持つ
IWICBitmapSource を返す。(WICCreateBitmapFromSection)

[戻り値]
型: HRESULT 関数が成功すると S_OK を返す。失敗時は HRESULT エラーコードを返す。

[備考]
WICCreateBitmapFromSection 関数は、desiredAccessLevel パラメータに
WICSectionAccessLevelRead を指定して WICCreateBitmapFromSectionEx 関数を呼び出す。


%index
WICCreateBitmapFromSectionEx
Windows Graphics Device Interface (GDI) セクションハンドルのピクセル領域を背後に持つ IWICBitmapSource を返す。(WICCreateBitmapFromSectionEx)
%prm
width, height, pixelFormat, hSection, stride, offset, desiredAccessLevel, ppIBitmap
width : [int] 型: UINT ビットマップピクセルの幅。
height : [int] 型: UINT ビットマップピクセルの高さ。
pixelFormat : [var] 型: REFWICPixelFormatGUID ビットマップのピクセル形式。
hSection : [intptr] 型: HANDLE セクションハンドル。CreateFileMapping 関数が返すファイルマッピングオブジェクトのハンドルである。
stride : [int] 型: UINT 各走査線のバイト数。
offset : [int] 型: UINT セクション内のオフセット。
desiredAccessLevel : [int] 型: WICSectionAccessLevel 希望するアクセスレベル。
ppIBitmap : [var] 型: IWICBitmap** ビットマップを受け取るポインタ。
%inst
Windows Graphics Device Interface (GDI) セクションハンドルのピクセル領域を背後に持つ
IWICBitmapSource を返す。(WICCreateBitmapFromSectionEx)

[戻り値]
型: HRESULT 関数が成功すると S_OK を返す。失敗時は HRESULT エラーコードを返す。


%index
WICGetMetadataContentSize
指定された IWICMetadataWriter が保持するメタデータ内容のサイズを返す。返されるサイズにはヘッダとメタデータの長さも含まれる。
%prm
guidContainerFormat, pIWriter, pcbSize
guidContainerFormat : [var] 型: REFGUID コンテナ GUID。
pIWriter : [var] 型: IWICMetadataWriter* 内容を保持する IWICMetadataWriter。
pcbSize : [var] 型: ULARGE_INTEGER* メタデータ内容のサイズを受け取るポインタ。
%inst
指定された IWICMetadataWriter
が保持するメタデータ内容のサイズを返す。返されるサイズにはヘッダとメタデータの長さも含まれる。

[戻り値]
型: HRESULT 関数が成功すると S_OK を返す。失敗時は HRESULT エラーコードを返す。


%index
WICMapGuidToShortName
指定された GUID に関連付けられたショートネームを取得する。
%prm
guid, cchName, wzName, pcchActual
guid : [var] 型: REFGUID ショートネームを取得する対象の GUID。
cchName : [int] 型: UINT wzName バッファのサイズ。
wzName : [wstr] 型: WCHAR* GUID に関連付けられたショートネームを受け取るポインタ。
pcchActual : [var] 型: UINT* GUID に関連付けられたショートネーム全体を取得するために実際に必要なサイズ。
%inst
指定された GUID に関連付けられたショートネームを取得する。

[戻り値]
型: HRESULT 関数が成功すると S_OK を返す。失敗時は HRESULT エラーコードを返す。

[備考]
Windows Imaging Component (WIC) のショートネームマッピングは、次のレジストリキー配下で確認できる:
HKEY_CLASSES_ROOT CLSID {FAE3D380-FEA4-4623-8C75-C6B61110B681}
Namespace ...


%index
WICMapSchemaToName
指定されたスキーマに関連付けられた名前を取得する。
%prm
guidMetadataFormat, pwzSchema, cchName, wzName, pcchActual
guidMetadataFormat : [var] 型: REFGUID メタデータフォーマットの GUID。
pwzSchema : [wstr] 型: LPWSTR 名前を取得する対象のスキーマを表す URI 文字列。
cchName : [int] 型: UINT wzName バッファのサイズ。
wzName : [wstr] 型: WCHAR* スキーマ名を受け取るバッファへのポインタ。必要なバッファサイズを取得するには、cchName を 0、wzName を NULL にして WICMapSchemaToName を呼び出す。
pcchActual : [var] 型: UINT スキーマ名全体を取得するために実際に必要なバッファサイズ。
%inst
指定されたスキーマに関連付けられた名前を取得する。

[戻り値]
型: HRESULT 関数が成功すると S_OK を返す。失敗時は HRESULT エラーコードを返す。

[備考]
次のレジストリキー配下にエントリを追加することで、スキーマ名のマッピングを拡張できる。
HKEY_CLASSES_ROOT CLSID {FAE3D380-FEA4-4623-8C75-C6B61110B681}
Schemas BB5ACC38-F216-4CEC-A6C5-5F6E739763A9 ...
詳細は How to Write a WIC-Enabled Codec を参照。


%index
WICMapShortNameToGuid
指定されたショートネームに関連付けられた GUID を取得する。
%prm
wzName, pguid
wzName : [wstr] 型: const WCHAR* ショートネームへのポインタ。
pguid : [var] 型: GUID* 指定されたショートネームに関連付けられた GUID を受け取るポインタ。
%inst
指定されたショートネームに関連付けられた GUID を取得する。

[戻り値]
型: HRESULT 関数が成功すると S_OK を返す。失敗時は HRESULT エラーコードを返す。

[備考]
次のレジストリキー配下にエントリを追加することで、ショートネームのマッピングを拡張できる。
HKEY_CLASSES_ROOT CLSID {FAE3D380-FEA4-4623-8C75-C6B61110B681}
Namespace ...
詳細は How to Write a WIC-Enabled Codec を参照。


%index
WICMatchMetadataContent
指定されたコンテナフォーマットおよびベンダに対し、与えられたストリーム内のコンテンツに最も合致するメタデータフォーマット GUID を取得する。
%prm
guidContainerFormat, pguidVendor, pIStream, pguidMetadataFormat
guidContainerFormat : [var] 型: REFGUID コンテナフォーマットの GUID。
pguidVendor : [var] 型: const GUID* ベンダ GUID。
pIStream : [var] 型: IStream* メタデータフォーマットをマッチさせる対象のコンテンツストリーム。
pguidMetadataFormat : [var] 型: GUID* 指定されたパラメータに対するメタデータフォーマット GUID を受け取るポインタ。
%inst
指定されたコンテナフォーマットおよびベンダに対し、与えられたストリーム内のコンテンツに最も合致するメタデータフォーマット GUID
を取得する。

[戻り値]
型: HRESULT 関数が成功すると S_OK を返す。失敗時は HRESULT エラーコードを返す。


%index
WICSerializeMetadataContent
指定されたストリームにメタデータを書き込む。
%prm
guidContainerFormat, pIWriter, dwPersistOptions, pIStream
guidContainerFormat : [var] 型: REFGUID コンテナフォーマットの GUID。
pIWriter : [var] 型: IWICMetadataWriter* ストリームにメタデータを書き込むためのメタデータライター。
dwPersistOptions : [int] 型: DWORD メタデータを書き込む際に使用する WICPersistOptions オプション。
pIStream : [var] 型: IStream* メタデータを書き込むストリームへのポインタ。
%inst
指定されたストリームにメタデータを書き込む。

[戻り値]
型: HRESULT 関数が成功すると S_OK を返す。失敗時は HRESULT エラーコードを返す。

