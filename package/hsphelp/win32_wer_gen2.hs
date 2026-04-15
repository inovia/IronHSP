; ============================================================
;   wer.dll ヘルプ (CsWin32 / win32metadata から自動抽出)
;   docs_ja.json に日本語訳があればそちらを使用、無ければ英語原文。
;   翻訳を追加するときは docs_ja.json を編集して再生成。
; ============================================================

%index
WerAddExcludedApplication
指定されたアプリケーションをエラー報告の対象から除外するアプリケーションリストに追加する。
%group
Win32 wer
%prm
pwzExeName, bAllUsers
pwzExeName : [wstr] アプリケーションの実行可能ファイルの名前 (ファイル拡張子を含む) を指定する Unicode 文字列へのポインタ。このパスの最大長は MAX_PATH 文字である。
bAllUsers : [int] このパラメータが TRUE の場合、アプリケーション名は全ユーザー向けの除外アプリケーションリストに追加される。そうでない場合は、現在のユーザーの除外リストにのみ追加される。
%inst
指定されたアプリケーションをエラー報告の対象から除外するアプリケーションリストに追加する。

[戻り値]
この関数は成功時に S_OK を返し、失敗時には以下を含むエラーコードを返す。
このドキュメントは省略されている。

[備考]
bAllUsers が TRUE の場合、除外アプリケーションリストは HKEY_LOCAL_MACHINE
レジストリハイブの下に格納される。呼び出し元プロセスは HKLM
レジストリハイブに書き込む権限を持っていなければならない。bAllUsers が FALSE の場合、除外アプリケーションリストは
HKEY_CURRENT_USER レジストリハイブの下に格納される。アプリケーションを除外リストから削除するには
WerRemoveExcludedApplication 関数を呼び出す。


%index
WerFreeString
レポートキー文字列を格納するために使用されたメモリを解放する。WerStoreGetFirstReportKey または WerStoreGetNextReportKey の各呼び出しの後、対応するレポートキー文字列を使用し終えて不要になったら呼び出す必要がある。
%group
Win32 wer
%prm
pwszStr
pwszStr : [wstr] 解放対象の文字列 (値が NULL に設定される)。
%inst
レポートキー文字列を格納するために使用されたメモリを解放する。WerStoreGetFirstReportKey または
WerStoreGetNextReportKey
の各呼び出しの後、対応するレポートキー文字列を使用し終えて不要になったら呼び出す必要がある。


%index
WerRemoveExcludedApplication
指定されたアプリケーションをエラー報告の除外リストから削除する。
%group
Win32 wer
%prm
pwzExeName, bAllUsers
pwzExeName : [wstr] アプリケーションの実行可能ファイルの名前 (ファイル拡張子を含む) を指定する Unicode 文字列へのポインタ。このパスの最大長は MAX_PATH 文字である。このファイルは WerAddExcludedApplication 関数によって除外されていなければならず、さもなくば WerRemoveExcludedApplication は失敗する。
bAllUsers : [int] このパラメータが TRUE の場合、アプリケーション名は全ユーザー向けの除外アプリケーションリストから削除される。そうでない場合は、現在のユーザーの除外リストからのみ削除される。
%inst
指定されたアプリケーションをエラー報告の除外リストから削除する。

[戻り値]
この関数は成功時に S_OK を返し、失敗時には以下を含むエラーコードを返す。
このドキュメントは省略されている。

[備考]
この関数は WerAddExcludedApplication
によって除外アプリケーションリストに追加されたアプリケーションを削除する。bAllUsers が TRUE
の場合、除外アプリケーションリストは HKEY_LOCAL_MACHINE レジストリハイブの下に格納される。呼び出し元プロセスは
HKLM レジストリハイブに書き込む権限を持っていなければならない。bAllUsers が FALSE
の場合、除外アプリケーションリストは HKEY_CURRENT_USER レジストリハイブの下に格納される。


%index
WerReportCloseHandle
指定されたレポートをクローズする。
%group
Win32 wer
%prm
hReportHandle
hReportHandle : [intptr] レポートへのハンドル。このハンドルは WerReportCreate 関数から返される。
%inst
指定されたレポートをクローズする。

[戻り値]
この関数は成功時に S_OK を返し、失敗時にはエラーコードを返す。


%index
WerReportAddFile
指定されたレポートにファイルを追加する。
%group
Win32 wer
%prm
hReportHandle, pwzPath, repFileType, dwFileFlags
hReportHandle : [intptr] レポートへのハンドル。このハンドルは WerReportCreate 関数から返される。
pwzPath : [wstr] 追加するファイルのフルパスを含む Unicode 文字列へのポインタ。このパスには環境変数を使用できる。最大長は MAX_PATH 文字である。
repFileType : [int] 
dwFileFlags : [int] 
%inst
指定されたレポートにファイルを追加する。

[戻り値]
この関数は成功時に S_OK を返し、失敗時には以下を含むエラーコードを返す。
このドキュメントは省略されている。

[備考]
この関数は (特定のフラグ付きで) メモリダンプをエラーレポートに追加するためにも使用できるが、メモリダンプ追加には
WerReportAddDump の使用が推奨される。自分でダンプを収集してレポートに追加したい場合のみ、この関数を使用するとよい。


%index
WerReportCreate
アプリケーションのイベントを記述する問題レポートを作成する。
%group
Win32 wer
%prm
pwzEventType, repType, pReportInformation, phReportHandle
pwzEventType : [wstr] イベントの名前を指定する Unicode 文字列へのポインタ。
repType : [int] 
pReportInformation : [var] レポートの情報を指定する WER_REPORT_INFORMATION 構造体へのポインタ。
phReportHandle : [intptr] レポートへのハンドル。関数が失敗した場合、このハンドルは NULL になる。
%inst
アプリケーションのイベントを記述する問題レポートを作成する。

[戻り値]
この関数は成功時に S_OK を返し、失敗時にはエラーコードを返す。

[備考]
送信する追加情報を指定するには次の関数を使用する:
WerReportAddDump、WerReportAddFile、WerReportSetParameter。情報を送信するには
WerReportSubmit 関数を呼び出す。レポートハンドルの使用が終わったら WerReportCloseHandle
関数を呼び出す。アプリケーションは障害時のデータ復旧や再起動の機会を希望することもできる。詳細は Application Recovery
and Restart を参照のこと。アプリケーションから送信されたレポートを確認するには Windows Quality Online
Services にアクセスする。


%index
WerReportSetParameter
指定されたレポートのイベントを一意に識別するパラメータを設定する。
%group
Win32 wer
%prm
hReportHandle, dwparamID, pwzName, pwzValue
hReportHandle : [intptr] レポートへのハンドル。このハンドルは WerReportCreate 関数から返される。
dwparamID : [int] 
pwzName : [wstr] パラメータの名前を含む Unicode 文字列へのポインタ。このパラメータが NULL の場合、既定の名前は Px であり、x は dwparamID に指定した値の整数部分に一致する。
pwzValue : [wstr] パラメータ値。
%inst
指定されたレポートのイベントを一意に識別するパラメータを設定する。

[戻り値]
この関数は成功時に S_OK を返し、失敗時には以下を含むエラーコードを返す。
このドキュメントは省略されている。

[備考]
各レポートは P0 から P9 までのパラメータをサポートする。この関数は一度に 1 つのパラメータを設定する。パラメータ Px
が設定される場合、P0 から Px までのすべてのパラメータを設定する必要がある。


%index
WerReportSetUIOption
指定されたレポートのユーザーインターフェースオプションを設定する。
%group
Win32 wer
%prm
hReportHandle, repUITypeID, pwzValue
hReportHandle : [intptr] レポートへのハンドル。このハンドルは WerReportCreate 関数から返される。
repUITypeID : [int] 
pwzValue : [wstr] カスタムテキストを指定する Unicode 文字列へのポインタ。詳細は repUITypeID の説明を参照のこと。
%inst
指定されたレポートのユーザーインターフェースオプションを設定する。

[戻り値]
この関数は成功時に S_OK を返し、失敗時にはエラーコードを返す。


%index
WerReportSubmit
指定されたレポートを送信する。
%group
Win32 wer
%prm
hReportHandle, consent, dwFlags, pSubmitResult
hReportHandle : [intptr] レポートへのハンドル。このハンドルは WerReportCreate 関数から返される。
consent : [int] 
dwFlags : [int] 
pSubmitResult : [var] 
%inst
指定されたレポートを送信する。

[戻り値]
この関数は成功時に S_OK を返し、失敗時にはエラーコードを返す。

[備考]
アプリケーションがこの関数を呼び出した後、WER は指定のデータを収集する。consent パラメータが
WerConsentApproved の場合、WER はレポートを Microsoft に送信する。consent が
WerConsentNotAsked の場合、WER は同意ダイアログを表示する。送信ステータスを判断するには pSubmitResult
パラメータを確認する。重大なアプリケーションイベントが発生した場合、再起動登録済みのアプリケーションは再起動される。コンピュータ識別子は次の場合にレポートとともに送信される。
このドキュメントは省略されている。


%index
WerStoreClose
格納されたレポートのコレクションをクローズする。
%group
Win32 wer
%prm
hReportStore
hReportStore : [intptr] クローズするエラーレポートストア (以前 WerStoreOpen で取得したもの)。
%inst
格納されたレポートのコレクションをクローズする。


%index
WerStoreGetFirstReportKey
レポートストア内の最初のレポートへの参照を取得する。
%group
Win32 wer
%prm
hReportStore, ppszReportKey
hReportStore : [intptr] エラーレポートストア (以前 WerStoreOpen で取得したもの)。
ppszReportKey : [var] レポートキー文字列へのポインタ。呼び出しが成功すると、取得されたレポートキーを指す。
%inst
レポートストア内の最初のレポートへの参照を取得する。

[戻り値]
この関数は成功時に S_OK を返し、失敗時には以下を含むエラーコードを返す。
このドキュメントは省略されている。


%index
WerStoreGetNextReportKey
エラーレポートストア内の次のレポートへの参照を取得する。
%group
Win32 wer
%prm
hReportStore, ppszReportKey
hReportStore : [intptr] エラーレポートストア (以前 WerStoreOpen で取得したもの)。
ppszReportKey : [var] レポートキー文字列へのポインタ。呼び出しが成功すると、取得されたレポートキーを指す。
%inst
エラーレポートストア内の次のレポートへの参照を取得する。

[戻り値]
この関数は成功時に S_OK を返し、失敗時には以下を含むエラーコードを返す。
このドキュメントは省略されている。


%index
WerStoreGetReportCount
(no summary)
%group
Win32 wer
%prm
hReportStore, pdwReportCount
hReportStore : [intptr] 
pdwReportCount : [var] 
%inst



%index
WerStoreGetSizeOnDisk
(no summary)
%group
Win32 wer
%prm
hReportStore, pqwSizeInBytes
hReportStore : [intptr] 
pqwSizeInBytes : [var] 
%inst



%index
WerStoreOpen
格納されたエラーレポートのコレクションをオープンする。
%group
Win32 wer
%prm
repStoreType, phReportStore
repStoreType : [int] オープンするレポートストアの種類。詳細は Remarks を参照のこと。
phReportStore : [intptr] レポートストアへのポインタ。呼び出しが成功すると、取得されたレポートストアを指す。
%inst
格納されたエラーレポートのコレクションをオープンする。

[戻り値]
この関数は成功時に S_OK を返し、失敗時には以下を含むエラーコードを返す。
このドキュメントは省略されている。

[備考]
storeType 値 E_STORE_MACHINE_QUEUE は、マシン上でまだ Microsoft
に送信されていないすべてのエラーレポートのキューをオープンする。E_STORE_MACHINE_ARCHIVE
は、既に送信されたエラーレポートのストアをオープンする。Windows Error Report (WER) ストアは、Microsoft
への送信対象としてマークされたがまだアップロードされていないエラーレポートのキューである。エラーレポートのアップロードはさまざまな状況で延期されうる。WerStore
系関数により、開発者は格納されたレポートにアクセスし、各レポートの状態を問い合わせることができる。


%index
WerStorePurge
(no summary)
%group
Win32 wer
%prm

%inst



%index
WerStoreQueryReportMetadataV1
(no summary)
%group
Win32 wer
%prm
hReportStore, pszReportKey, pReportMetadata
hReportStore : [intptr] 
pszReportKey : [wstr] 
pReportMetadata : [var] 
%inst



%index
WerStoreQueryReportMetadataV2
ストア内のレポートに関するメタデータを取得する。
%group
Win32 wer
%prm
hReportStore, pszReportKey, pReportMetadata
hReportStore : [intptr] エラーレポートストア (以前 WerStoreOpen で取得したもの)。
pszReportKey : [wstr] どのレポートを問い合わせるかを識別する文字列 (以前 WerStoreGetFirstReportKey または WerStoreGetNextReportKey で取得したもの)。
pReportMetadata : [var] WER_REPORT_METADATA_V2 構造体形式のレポートストアメタデータへのポインタ。初回呼び出し時には SizeOfFileNames フィールドを 0 に設定すること。関数はこのフィールドを、レポートに関連付けられたファイル名を格納するのに必要なサイズに更新する。その後、FileNames フィールドを SizeOfFileNames バイトで割り当て、再度関数を呼び出してすべてのファイル名を取得する。
%inst
ストア内のレポートに関するメタデータを取得する。

[戻り値]
この関数は成功時に S_OK を返し、失敗時には以下を含むエラーコードを返す。
このドキュメントは省略されている。


%index
WerStoreQueryReportMetadataV3
(no summary)
%group
Win32 wer
%prm
hReportStore, pszReportKey, pReportMetadata
hReportStore : [intptr] 
pszReportKey : [wstr] 
pReportMetadata : [var] 
%inst



%index
WerStoreUploadReport
(no summary)
%group
Win32 wer
%prm
hReportStore, pszReportKey, dwFlags, pSubmitResult
hReportStore : [intptr] 
pszReportKey : [wstr] 
dwFlags : [int] 
pSubmitResult : [var] 
%inst


