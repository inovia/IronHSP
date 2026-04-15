; ============================================================
;   wininet.dll ヘルプ (CsWin32 / win32metadata から自動抽出)
;   docs_ja.json に日本語訳があればそちらを使用、無ければ英語原文。
;   翻訳を追加するときは docs_ja.json を編集して再生成。
; ============================================================

%type
拡張命令
%ver
1.0
%dll
wininet.dll
%date
2026/04/16
%author
IronHSP / CsWin32 bridge
%url
https://github.com/inovia/IronHSP
%port
Win

%note
Win32 API の wininet.dll 関数群。CsWin32 + win32metadata から自動生成。
hsp3net 専用 (intptr / NSTRUCT / wstr を使用)。

%group
Win32API

%index
AppCacheCheckManifest
(no summary)
%prm
pwszMasterUrl, pwszManifestUrl, pbManifestData, dwManifestDataSize, pbManifestResponseHeaders, dwManifestResponseHeadersSize, peState, phNewAppCache
pwszMasterUrl : [wstr] 
pwszManifestUrl : [wstr] 
pbManifestData : [var] 
dwManifestDataSize : [int] 
pbManifestResponseHeaders : [var] 
dwManifestResponseHeadersSize : [int] 
peState : [var] 
phNewAppCache : [var] 
%inst



%index
AppCacheCloseHandle
(no summary)
%prm
hAppCache
hAppCache : [intptr] 
%inst



%index
AppCacheCreateAndCommitFile
(no summary)
%prm
hAppCache, pwszSourceFilePath, pwszUrl, pbResponseHeaders, dwResponseHeadersSize
hAppCache : [intptr] 
pwszSourceFilePath : [wstr] 
pwszUrl : [wstr] 
pbResponseHeaders : [var] 
dwResponseHeadersSize : [int] 
%inst



%index
AppCacheDeleteGroup
(no summary)
%prm
pwszManifestUrl
pwszManifestUrl : [wstr] 
%inst



%index
AppCacheDeleteIEGroup
(no summary)
%prm
pwszManifestUrl
pwszManifestUrl : [wstr] 
%inst



%index
AppCacheDuplicateHandle
(no summary)
%prm
hAppCache, phDuplicatedAppCache
hAppCache : [intptr] 
phDuplicatedAppCache : [var] 
%inst



%index
AppCacheFinalize
(no summary)
%prm
hAppCache, pbManifestData, dwManifestDataSize, peState
hAppCache : [intptr] 
pbManifestData : [var] 
dwManifestDataSize : [int] 
peState : [var] 
%inst



%index
AppCacheFreeDownloadList
(no summary)
%prm
pDownloadList
pDownloadList : [var] 
%inst



%index
AppCacheFreeGroupList
(no summary)
%prm
pAppCacheGroupList
pAppCacheGroupList : [var] 
%inst



%index
AppCacheFreeIESpace
(no summary)
%prm
ftCutOff
ftCutOff : [int] 
%inst



%index
AppCacheFreeSpace
(no summary)
%prm
ftCutOff
ftCutOff : [int] 
%inst



%index
AppCacheGetDownloadList
(no summary)
%prm
hAppCache, pDownloadList
hAppCache : [intptr] 
pDownloadList : [var] 
%inst



%index
AppCacheGetFallbackUrl
(no summary)
%prm
hAppCache, pwszUrl, ppwszFallbackUrl
hAppCache : [intptr] 
pwszUrl : [wstr] 
ppwszFallbackUrl : [var] 
%inst



%index
AppCacheGetGroupList
(no summary)
%prm
pAppCacheGroupList
pAppCacheGroupList : [var] 
%inst



%index
AppCacheGetIEGroupList
(no summary)
%prm
pAppCacheGroupList
pAppCacheGroupList : [var] 
%inst



%index
AppCacheGetInfo
(no summary)
%prm
hAppCache, pAppCacheInfo
hAppCache : [intptr] 
pAppCacheInfo : [var] 
%inst



%index
AppCacheGetManifestUrl
(no summary)
%prm
hAppCache, ppwszManifestUrl
hAppCache : [intptr] 
ppwszManifestUrl : [var] 
%inst



%index
AppCacheLookup
(no summary)
%prm
pwszUrl, dwFlags, phAppCache
pwszUrl : [wstr] 
dwFlags : [int] 
phAppCache : [var] 
%inst



%index
CommitUrlCacheEntryW
指定したファイル内のデータをインターネットキャッシュに格納し、指定した URL に関連付ける。(Unicode)
%prm
lpszUrlName, lpszLocalFileName, ExpireTime, LastModifiedTime, CacheEntryType, lpszHeaderInfo, cchHeaderInfo, lpszFileExtension, lpszOriginalUrl
lpszUrlName : [wstr] キャッシュエントリのソース名を格納した文字列変数へのポインタ。名前文字列は一意でなければならず、エスケープ文字を含めてはならない。
lpszLocalFileName : [wstr] キャッシュされるローカルファイルの名前を格納した文字列変数へのポインタ。CreateUrlCacheEntryW で返された名前と同じ名前を指定する。
ExpireTime : [int] キャッシュ対象ファイルの有効期限の日時 (グリニッジ標準時) を格納した FILETIME 構造体。有効期限が不明な場合は、本パラメータを 0 に設定する。
LastModifiedTime : [int] キャッシュ対象 URL の最終更新日時 (グリニッジ標準時) を格納した FILETIME 構造体。最終更新日時が不明な場合は、本パラメータを 0 に設定する。
CacheEntryType : [int] キャッシュエントリの種別とプロパティを示すビットマスク。キャッシュエントリ種別には、履歴エントリ (URLHISTORY_CACHE_ENTRY)、クッキーエントリ (COOKIE_CACHE_ENTRY)、通常のキャッシュコンテンツ (NORMAL_CACHE_ENTRY) がある。本パラメータには、以下のプロパティフラグおよびキャッシュ種別フラグを 0 個以上指定できる。
lpszHeaderInfo : [wstr] ヘッダー情報を格納したバッファへのポインタ。本パラメータが NULL でない場合、ヘッダー情報は INTERNET_CACHE_ENTRY_INFO 構造体の lpHeaderInfo メンバとして返される、URL の拡張属性として扱われる。
cchHeaderInfo : [int] ヘッダー情報のサイズ (TCHAR 単位)。lpHeaderInfo が NULL でない場合、この値はヘッダー情報を格納するバッファのサイズを示すものとみなされる。アプリケーションはヘッダーをデータの一部として保持し、lpHeaderInfo に NULL を指定したうえで cchHeaderInfo を指定することもできる。
lpszFileExtension : [wstr] 本パラメータは予約されており、NULL を指定しなければならない。
lpszOriginalUrl : [wstr] リダイレクトが発生した場合の元の URL を格納した文字列へのポインタ。
%inst
指定したファイル内のデータをインターネットキャッシュに格納し、指定した URL に関連付ける。(Unicode)

[戻り値]
成功した場合は TRUE を、失敗した場合は FALSE を返す。拡張エラー情報を取得するには GetLastError
を呼び出す。以下は想定されるエラー値である。
（以下省略）

[備考]
STICKY_CACHE_ENTRY
種別は、キャッシュエントリをスカベンジ対象から除外するために使用する。CommitUrlCacheEntryW
で設定したエントリの既定の除外時間は 10 分である。除外時間は、SetUrlCacheEntryInfo 関数を呼び出して
INTERNET_CACHE_ENTRY_INFO
構造体の有効期限パラメータを設定することで変更できる。キャッシュ領域が満杯の場合、CommitUrlCacheEntryW
は新しいファイル用の領域を確保するためにキャッシュクリーンアップを呼び出す。キャッシュエントリが既に存在する場合、関数は使用中でなければエントリを上書きする。エントリは
RetrieveUrlCacheEntryStream または RetrieveUrlCacheEntryFile
で取得されている間、使用中とみなされる。キャッシュにエントリを追加するクライアントは、ヘッダーを少なくとも "HTTP/1.0 200
OK\r\n\r\n" に設定する必要がある。そうしない場合、Microsoft Internet Explorer
などのクライアントアプリケーションはエントリを無視する可能性がある。CreateUrlCacheEntryW
を呼び出すサンプルコードについては Caching を参照のこと。WinINet API の他のすべての側面と同様に、本関数は
DllMain やグローバルオブジェクトのコンストラクタ・デストラクタの中から安全に呼び出すことはできない。注意: WinINet
はサーバー実装をサポートしていない。さらに、サービスから使用すべきでもない。サーバー実装やサービスでは Microsoft Windows
HTTP Services (WinHTTP) を使用すること。
> [!NOTE] > wininet.h ヘッダーは CommitUrlCacheEntry
をエイリアスとして定義しており、UNICODE プリプロセッサ定数の定義に基づいて本関数の ANSI 版または Unicode
版を自動的に選択する。エンコーディング中立のエイリアスとエンコーディング中立でないコードを混在させると、コンパイルエラーや実行時エラーの原因となるミスマッチが発生する可能性がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照のこと。


%index
CommitUrlCacheEntryBinaryBlob
(no summary)
%prm
pwszUrlName, dwType, ftExpireTime, ftModifiedTime, pbBlob, cbBlob
pwszUrlName : [wstr] 
dwType : [int] 
ftExpireTime : [int] 
ftModifiedTime : [int] 
pbBlob : [var] 
cbBlob : [int] 
%inst



%index
CreateMD5SSOHash
CreateMD5SSOHash 関数 (wininet.h) は Microsoft Passport パスワードを取得し、特定の文字列を用いて MD5 ハッシュを作成し、その結果を返す。
%prm
pszChallengeInfo, pwszRealm, pwszTarget, pbHexHash
pszChallengeInfo : [wstr] MD5 ハッシュに使用するワイド文字のチャレンジ文字列へのポインタ。
pwszRealm : [wstr] パスワードを取得する対象のレルム名を格納した文字列へのポインタ。本パラメータは pwszTarget が NULL の場合にのみ使用される。pwszTarget と pwszRealm の両方が NULL の場合、既定のレルムが使用される。
pwszTarget : [wstr] パスワードを取得する対象のアカウント名を格納した文字列へのポインタ。pwszTarget が NULL の場合、pwszRealm で指定されたレルムが使用される。
pbHexHash : [var] MD5 ハッシュが 16 進文字列形式で返される出力バッファへのポインタ。このバッファは少なくとも 33 バイトの長さがなければならない。
%inst
CreateMD5SSOHash 関数 (wininet.h) は Microsoft Passport
パスワードを取得し、特定の文字列を用いて MD5 ハッシュを作成し、その結果を返す。

[戻り値]
成功した場合は TRUE を、失敗した場合は FALSE を返す。

[備考]
CreateMD5SSOHash 関数は、指定されたアカウントまたはレルムに対する Microsoft Passport
パスワードの取得に成功すると、チャレンジ文字列とパスワードの両方をワイド文字からマルチバイト文字 (一般に 8 ビット)
に変換し、それらを連結して、結果のキーから MD5 ハッシュを生成するために RSA ライブラリを使用する。続いてハッシュを
(小文字を使用した) 8 ビット 16 進数の null 終端文字列に変換し、pbHexHash
パラメータが指すバッファに格納する。したがって pbHexHash が指す出力バッファは、ハッシュの 16 バイト分それぞれに 2
バイト、加えて終端 null 文字 1 バイトの、合計 33 バイトを格納できる長さでなければならない。WinINet API
の他のすべての側面と同様に、本関数は DllMain
やグローバルオブジェクトのコンストラクタ・デストラクタの中から安全に呼び出すことはできない。注意: WinINet
はサーバー実装をサポートしていない。さらに、サービスから使用すべきでもない。サーバー実装やサービスでは Microsoft Windows
HTTP Services (WinHTTP) を使用すること。


%index
CreateUrlCacheContainerW
指定したキャッシュパスに、指定した名前・キャッシュプレフィックス・コンテナ種別に基づいてキャッシュエントリを保持するキャッシュコンテナを作成する。(Unicode)
%prm
Name, lpCachePrefix, lpszCachePath, KBCacheLimit, dwContainerType, dwOptions, pvBuffer, cbBuffer
Name : [wstr] キャッシュに付ける名前。
lpCachePrefix : [wstr] キャッシュの基準とするキャッシュプレフィックス。
lpszCachePath : [wstr] キャッシュを作成するキャッシュプレフィックス。
KBCacheLimit : [int] キャッシュのサイズ上限 (キロバイト単位、整数)。既定サイズを使用する場合は 0 を指定する。
dwContainerType : [int] キャッシュの基準とするコンテナ種別。
dwOptions : [int] 本パラメータは予約されており、0 を指定しなければならない。
pvBuffer : [intptr] 本パラメータは予約されており、NULL を指定しなければならない。
cbBuffer : [var] 本パラメータは予約されており、NULL を指定しなければならない。
%inst

指定したキャッシュパスに、指定した名前・キャッシュプレフィックス・コンテナ種別に基づいてキャッシュエントリを保持するキャッシュコンテナを作成する。(Unicode)

[戻り値]
成功した場合は TRUE を、失敗した場合は FALSE を返す。拡張エラー情報を取得するには GetLastError を呼び出す。

[備考]
> [!NOTE] > winineti.h ヘッダーは CreateUrlCacheContainer
をエイリアスとして定義しており、UNICODE プリプロセッサ定数の定義に基づいて本関数の ANSI 版または Unicode
版を自動的に選択する。エンコーディング中立のエイリアスとエンコーディング中立でないコードを混在させると、コンパイルエラーや実行時エラーの原因となるミスマッチが発生する可能性がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照のこと。


%index
CreateUrlCacheEntryW
指定した URL とファイル拡張子に基づいて、キャッシュエントリを保存するためのローカルファイル名を作成する。(Unicode)
%prm
lpszUrlName, dwExpectedFileSize, lpszFileExtension, lpszFileName, dwReserved
lpszUrlName : [wstr] URL の名前を格納した文字列値へのポインタ。文字列は値を含む必要があり、空文字列を指定すると CreateUrlCacheEntry は失敗する。さらに、文字列にエスケープ文字を含めてはならない。
dwExpectedFileSize : [int] ソースエンティティに対応するデータを格納するために必要なファイルの予想サイズ (TCHAR 単位)。予想サイズが不明な場合は 0 を指定する。
lpszFileExtension : [wstr] ローカルストレージ上のファイルの拡張子名を格納した文字列値へのポインタ。
lpszFileName : [wstr] ファイル名を受け取るバッファへのポインタ。バッファは作成されたファイルのパスを格納するのに十分な大きさ (少なくとも MAX_PATH 文字以上) でなければならない。
dwReserved : [int] 本パラメータは予約されており、0 を指定しなければならない。
%inst
指定した URL とファイル拡張子に基づいて、キャッシュエントリを保存するためのローカルファイル名を作成する。(Unicode)

[戻り値]
関数が成功した場合、戻り値は TRUE である。
関数が失敗した場合、戻り値は FALSE である。拡張エラー情報を取得するには GetLastError を呼び出す。

[備考]
CreateUrlCacheEntry
を呼び出した後、アプリケーションはローカルストレージ上のファイルに直接書き込むことができる。ファイルを完全に受信したら、呼び出し側は
CommitUrlCacheEntry を呼び出してエントリをキャッシュにコミットしなければならない。WinINet
はシステムのコードページに従って Unicode パラメータをデコードしようとする。アプリケーションは Unicode
パラメータがシステムのコードページ用に正しくエンコードされていることを保証する必要がある。アプリケーションは次のコード例のように
InternetSetOption を使ってシステムのコードページを設定できる。
（以下省略）


%index
CreateUrlCacheEntryExW
(no summary)
%prm
lpszUrlName, dwExpectedFileSize, lpszFileExtension, lpszFileName, dwReserved, fPreserveIncomingFileName
lpszUrlName : [wstr] 
dwExpectedFileSize : [int] 
lpszFileExtension : [wstr] 
lpszFileName : [wstr] 
dwReserved : [int] 
fPreserveIncomingFileName : [int] 
%inst



%index
CreateUrlCacheGroup
キャッシュグループの識別子を生成する。
%prm
dwFlags, lpReserved
dwFlags : [int] キャッシュグループの作成を制御する。本パラメータには CACHEGROUP_FLAG_GIDONLY を指定でき、これにより CreateUrlCacheGroup は一意の GROUPID を生成するが、物理的なグループは作成しない。
lpReserved : [intptr] 本パラメータは予約されており、NULL を指定しなければならない。
%inst
キャッシュグループの識別子を生成する。

[戻り値]
成功した場合は有効な GROUPID を、失敗した場合は FALSE を返す。具体的なエラー情報を取得するには GetLastError
を呼び出す。

[備考]
注意: WinINet はサーバー実装をサポートしていない。さらに、サービスから使用すべきでもない。サーバー実装やサービスでは
Microsoft Windows HTTP Services (WinHTTP) を使用すること。


%index
DeleteIE3Cache
(no summary)
%prm
hwnd, hinst, lpszCmd, nCmdShow
hwnd : [intptr] 
hinst : [intptr] 
lpszCmd : [str] 
nCmdShow : [int] 
%inst



%index
DeleteUrlCacheContainerW
指定した名前に基づいて、キャッシュエントリを保持するキャッシュコンテナを削除する。(Unicode)
%prm
Name, dwOptions
Name : [wstr] 削除するキャッシュコンテナの名前。
dwOptions : [int] 本パラメータは予約されており、0 を指定しなければならない。
%inst
指定した名前に基づいて、キャッシュエントリを保持するキャッシュコンテナを削除する。(Unicode)

[戻り値]
成功した場合は TRUE を、失敗した場合は FALSE を返す。拡張エラー情報を取得するには GetLastError を呼び出す。

[備考]
注意: WinINet
はサーバー実装をサポートしていない。さらに、サービスから使用したり、セキュリティコンテキストの偽装中に使用すべきでもない。サーバー実装やサービスでは
Microsoft Windows HTTP Services (WinHTTP) を使用すること。
> [!NOTE] > winineti.h ヘッダーは DeleteUrlCacheContainer
をエイリアスとして定義しており、UNICODE プリプロセッサ定数の定義に基づいて本関数の ANSI 版または Unicode
版を自動的に選択する。エンコーディング中立のエイリアスとエンコーディング中立でないコードを混在させると、コンパイルエラーや実行時エラーの原因となるミスマッチが発生する可能性がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照のこと。


%index
DeleteUrlCacheEntry
DeleteUrlCacheEntry 関数 (wininet.h) は、指定したソース名に関連付けられたファイルがキャッシュに存在する場合、それを削除する。
%prm
lpszUrlName
lpszUrlName : [str] キャッシュエントリに対応するソース名を格納した文字列へのポインタ。
%inst
DeleteUrlCacheEntry 関数 (wininet.h)
は、指定したソース名に関連付けられたファイルがキャッシュに存在する場合、それを削除する。

[戻り値]
成功した場合は TRUE を、失敗した場合は FALSE を返す。拡張エラー情報を取得するには GetLastError
を呼び出す。想定されるエラー値は以下のとおりである。
（以下省略）

[備考]
注意: WinINet はサーバー実装をサポートしていない。さらに、サービスから使用すべきでもない。サーバー実装やサービスでは
Microsoft Windows HTTP Services (WinHTTP) を使用すること。


%index
DeleteUrlCacheGroup
指定した GROUPID と、キャッシュインデックスファイル内の関連する状態を解放する。
%prm
GroupId, dwFlags, lpReserved
GroupId : [int64] 解放するキャッシュグループの ID。
dwFlags : [int] キャッシュグループの削除を制御する。キャッシュグループ定数のいずれかを指定できる。本パラメータに CACHEGROUP_FLAG_FLUSHURL_ONDELETE を指定すると、DeleteUrlCacheGroup はこのグループに関連付けられたすべてのキャッシュエントリを削除する (ただし、エントリが別のグループにも属している場合を除く)。
lpReserved : [intptr] 本パラメータは予約されており、NULL を指定しなければならない。
%inst
指定した GROUPID と、キャッシュインデックスファイル内の関連する状態を解放する。

[戻り値]
成功した場合は TRUE を、失敗した場合は FALSE を返す。具体的なエラー情報を取得するには GetLastError を呼び出す。

[備考]
注意: WinINet はサーバー実装をサポートしていない。さらに、サービスから使用すべきでもない。サーバー実装やサービスでは
Microsoft Windows HTTP Services (WinHTTP) を使用すること。


%index
DeleteWpadCacheForNetworks
(no summary)
%prm
param0
param0 : [int] 
%inst



%index
DetectAutoProxyUrl
DetectAutoProxyUrl 関数 (wininet.h) は WPAD 自動プロキシスクリプトの場所を検出しようとする。
%prm
pszAutoProxyUrl, cchAutoProxyUrl, dwDetectFlags
pszAutoProxyUrl : [str] WPAD 自動プロキシスクリプトのダウンロード元 URL を受け取るバッファへのポインタ。
cchAutoProxyUrl : [int] lpszAutoProxyUrl が指すバッファのサイズ (バイト単位)。
dwDetectFlags : [int] 
%inst
DetectAutoProxyUrl 関数 (wininet.h) は WPAD 自動プロキシスクリプトの場所を検出しようとする。

[戻り値]
成功した場合は TRUE を、失敗した場合は FALSE を返す。拡張エラー情報を取得するには GetLastError を呼び出す。

[備考]
注意: WinINet はサーバー実装をサポートしていない。さらに、サービスから使用すべきでもない。サーバー実装やサービスでは
Microsoft Windows HTTP Services (WinHTTP) を使用すること。


%index
FindCloseUrlCache
指定したキャッシュ列挙ハンドルを閉じる。
%prm
hEnumHandle
hEnumHandle : [intptr] FindFirstUrlCacheEntry 関数の以前の呼び出しで返されたハンドル。
%inst
指定したキャッシュ列挙ハンドルを閉じる。

[戻り値]
成功した場合は TRUE を、失敗した場合は FALSE を返す。拡張エラー情報を取得するには GetLastError を呼び出す。

[備考]
注意: WinINet はサーバー実装をサポートしていない。さらに、サービスから使用すべきでもない。サーバー実装やサービスでは
Microsoft Windows HTTP Services (WinHTTP) を使用すること。


%index
FindFirstUrlCacheContainerW
(no summary)
%prm
pdwModified, lpContainerInfo, lpcbContainerInfo, dwOptions
pdwModified : [var] 
lpContainerInfo : [var] 
lpcbContainerInfo : [var] 
dwOptions : [int] 
%inst



%index
FindFirstUrlCacheEntryW
インターネットキャッシュの列挙を開始する。(Unicode)
%prm
lpszUrlSearchPattern, lpFirstCacheEntryInfo, lpcbCacheEntryInfo
lpszUrlSearchPattern : [wstr] 検索するソース名のパターンを格納した文字列へのポインタ。本パラメータには "cookie:"、"visited:"、または NULL のみを指定できる。クッキーを列挙するには "cookie:" を、URL 履歴エントリを列挙するには "visited:" を指定する。本パラメータが NULL の場合、FindFirstUrlCacheEntry はキャッシュ内のすべてのコンテンツエントリを返す。
lpFirstCacheEntryInfo : [var] INTERNET_CACHE_ENTRY_INFO 構造体へのポインタ。
lpcbCacheEntryInfo : [var] lpFirstCacheEntryInfo バッファのサイズ (バイト単位) を指定する変数へのポインタ。関数が戻ると、変数にはバッファにコピーされたバイト数、またはキャッシュエントリの取得に必要なサイズ (バイト単位) が格納される。
%inst
インターネットキャッシュの列挙を開始する。(Unicode)

[戻り値]
アプリケーションが FindNextUrlCacheEntry
関数で後続のキャッシュエントリを取得するために使用できるハンドルを返す。関数が失敗した場合、戻り値は NULL
である。拡張エラー情報を取得するには GetLastError を呼び出す。ERROR_INSUFFICIENT_BUFFER
は、lpdwFirstCacheEntryInfoBufferSize で指定された lpFirstCacheEntryInfo
のサイズが、すべての情報を格納するのに十分でないことを示す。lpdwFirstCacheEntryInfoBufferSize
に返される値は、すべての情報を格納するのに必要なバッファサイズを示す。

[備考]
FindFirstUrlCacheEntry から返されたハンドルは、それ以降のすべての FindNextUrlCacheEntry
の呼び出しで使用される。列挙の終了時に、アプリケーションは FindCloseUrlCache
を呼び出すべきである。FindFirstUrlCacheEntry と FindNextUrlCacheEntry
は可変サイズの情報を返す。ERROR_INSUFFICIENT_BUFFER が返された場合、アプリケーションは
lpdwFirstCacheEntryInfoBufferSize で指定されたサイズのバッファを割り当てるべきである。詳細は Using
Buffers を参照のこと。WinINet API の他のすべての側面と同様に、本関数は DllMain
やグローバルオブジェクトのコンストラクタ・デストラクタの中から安全に呼び出すことはできない。注意: WinINet
はサーバー実装をサポートしていない。さらに、サービスから使用すべきでもない。サーバー実装やサービスでは Microsoft Windows
HTTP Services (WinHTTP) を使用すること。
> [!NOTE] > wininet.h ヘッダーは FindFirstUrlCacheEntry
をエイリアスとして定義しており、UNICODE プリプロセッサ定数の定義に基づいて本関数の ANSI 版または Unicode
版を自動的に選択する。エンコーディング中立のエイリアスとエンコーディング中立でないコードを混在させると、コンパイルエラーや実行時エラーの原因となるミスマッチが発生する可能性がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照のこと。


%index
FindFirstUrlCacheEntryExW
インターネットキャッシュのフィルタ付き列挙を開始する。(Unicode)
%prm
lpszUrlSearchPattern, dwFlags, dwFilter, GroupId, lpFirstCacheEntryInfo, lpcbCacheEntryInfo, lpGroupAttributes, lpcbGroupAttributes, lpReserved
lpszUrlSearchPattern : [wstr] 検索するソース名のパターンを格納した文字列へのポインタ。本パラメータには "cookie:"、"visited:"、または NULL のみを指定できる。クッキーを列挙するには "cookie:" を、URL 履歴エントリを列挙するには "visited:" を指定する。本パラメータが NULL の場合、FindFirstUrlCacheEntryEx はキャッシュ内のすべてのコンテンツエントリを返す。
dwFlags : [int] 列挙を制御する。現時点でフラグは実装されておらず、本パラメータは 0 に設定しなければならない。
dwFilter : [int] キャッシュエントリの種別とプロパティを示すビットマスク。キャッシュエントリ種別には、履歴エントリ (URLHISTORY_CACHE_ENTRY)、クッキーエントリ (COOKIE_CACHE_ENTRY)、通常のキャッシュコンテンツ (NORMAL_CACHE_ENTRY) がある。本パラメータには、以下のプロパティフラグおよびキャッシュ種別フラグを 0 個以上指定できる。
GroupId : [int64] 列挙対象のキャッシュグループの ID。グループに属さないすべてのエントリを列挙するには、本パラメータを 0 に設定する。
lpFirstCacheEntryInfo : [var] キャッシュエントリ情報を受け取る INTERNET_CACHE_ENTRY_INFO 構造体へのポインタ。
lpcbCacheEntryInfo : [var] lpFirstCacheEntryInfo パラメータが参照する構造体のサイズ (バイト単位) を示す変数へのポインタ。
lpGroupAttributes : [intptr] 本パラメータは予約されており、NULL を指定しなければならない。
lpcbGroupAttributes : [var] 本パラメータは予約されており、NULL を指定しなければならない。
lpReserved : [intptr] 本パラメータは予約されており、NULL を指定しなければならない。
%inst
インターネットキャッシュのフィルタ付き列挙を開始する。(Unicode)

[戻り値]
成功した場合は有効なハンドルを、失敗した場合は NULL を返す。具体的なエラー情報を取得するには GetLastError
を呼び出す。一致するファイルが見つからなかった場合、GetLastError は ERROR_NO_MORE_FILES を返す。

[備考]
FindFirstUrlCacheEntryEx から返されたハンドルは、それ以降のすべての
FindNextUrlCacheEntryEx の呼び出しで使用される。列挙の終了時に、アプリケーションは
FindCloseUrlCache を呼び出すべきである。WinINet API の他のすべての側面と同様に、本関数は DllMain
やグローバルオブジェクトのコンストラクタ・デストラクタの中から安全に呼び出すことはできない。注意: WinINet
はサーバー実装をサポートしていない。さらに、サービスから使用すべきでもない。サーバー実装やサービスでは Microsoft Windows
HTTP Services (WinHTTP) を使用すること。
> [!NOTE] > wininet.h ヘッダーは FindFirstUrlCacheEntryEx
をエイリアスとして定義しており、UNICODE プリプロセッサ定数の定義に基づいて本関数の ANSI 版または Unicode
版を自動的に選択する。エンコーディング中立のエイリアスとエンコーディング中立でないコードを混在させると、コンパイルエラーや実行時エラーの原因となるミスマッチが発生する可能性がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照のこと。


%index
FindFirstUrlCacheGroup
インターネットキャッシュ内のキャッシュグループの列挙を開始する。
%prm
dwFlags, dwFilter, lpSearchCondition, dwSearchCondition, lpGroupId, lpReserved
dwFlags : [int] 本パラメータは予約されており、0 を指定しなければならない。
dwFilter : [int] 
lpSearchCondition : [intptr] 本パラメータは予約されており、NULL を指定しなければならない。
dwSearchCondition : [int] 本パラメータは予約されており、0 を指定しなければならない。
lpGroupId : [var] 検索条件に一致する最初のキャッシュグループの ID へのポインタ。
lpReserved : [intptr] 本パラメータは予約されており、NULL を指定しなければならない。
%inst
インターネットキャッシュ内のキャッシュグループの列挙を開始する。

[戻り値]
成功した場合は列挙の最初の項目への有効なハンドルを、失敗した場合は NULL を返す。具体的なエラー情報を取得するには
GetLastError を呼び出す。一致するファイルが見つからなかった場合、GetLastError は
ERROR_NO_MORE_FILES を返す。

[備考]
FindFirstUrlCacheGroup から返されたハンドルは、それ以降の FindNextUrlCacheGroup
の呼び出しで使用される。列挙の終了時に、アプリケーションは FindCloseUrlCache を呼び出すべきである。WinINet
API の他のすべての側面と同様に、本関数は DllMain
やグローバルオブジェクトのコンストラクタ・デストラクタの中から安全に呼び出すことはできない。注意: WinINet
はサーバー実装をサポートしていない。さらに、サービスから使用すべきでもない。サーバー実装やサービスでは Microsoft Windows
HTTP Services (WinHTTP) を使用すること。


%index
FindNextUrlCacheContainerW
(no summary)
%prm
hEnumHandle, lpContainerInfo, lpcbContainerInfo
hEnumHandle : [intptr] 
lpContainerInfo : [var] 
lpcbContainerInfo : [var] 
%inst



%index
FindNextUrlCacheEntryW
インターネットキャッシュ内の次のエントリを取得する。(Unicode)
%prm
hEnumHandle, lpNextCacheEntryInfo, lpcbCacheEntryInfo
hEnumHandle : [intptr] FindFirstUrlCacheEntry の以前の呼び出しで取得した列挙のハンドル。
lpNextCacheEntryInfo : [var] キャッシュエントリの情報を受け取る INTERNET_CACHE_ENTRY_INFO 構造体へのポインタ。
lpcbCacheEntryInfo : [var] lpNextCacheEntryInfo バッファのサイズ (バイト単位) を指定する変数へのポインタ。関数が戻ると、変数にはバッファにコピーされたバイト数、またはキャッシュエントリの取得に必要なバッファサイズ (バイト単位) が格納される。
%inst
インターネットキャッシュ内の次のエントリを取得する。(Unicode)

[戻り値]
成功した場合は TRUE を、失敗した場合は FALSE を返す。拡張エラー情報を取得するには GetLastError
を呼び出す。想定されるエラー値は以下のとおりである。
（以下省略）

[備考]
キャッシュ内の最後の項目が返されるまで、FindNextUrlCacheEntry の呼び出しを続けること。WinINet API
の他のすべての側面と同様に、本関数は DllMain
やグローバルオブジェクトのコンストラクタ・デストラクタの中から安全に呼び出すことはできない。注意: WinINet
はサーバー実装をサポートしていない。さらに、サービスから使用すべきでもない。サーバー実装やサービスでは Microsoft Windows
HTTP Services (WinHTTP) を使用すること。
> [!NOTE] > wininet.h ヘッダーは FindNextUrlCacheEntry
をエイリアスとして定義しており、UNICODE プリプロセッサ定数の定義に基づいて本関数の ANSI 版または Unicode
版を自動的に選択する。エンコーディング中立のエイリアスとエンコーディング中立でないコードを混在させると、コンパイルエラーや実行時エラーの原因となるミスマッチが発生する可能性がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照のこと。


%index
FindNextUrlCacheEntryExW
FindFirstUrlCacheEntryEx 関数で開始されたキャッシュ列挙の次のキャッシュエントリを取得する。(Unicode)
%prm
hEnumHandle, lpNextCacheEntryInfo, lpcbCacheEntryInfo, lpGroupAttributes, lpcbGroupAttributes, lpReserved
hEnumHandle : [intptr] キャッシュ列挙を開始した FindFirstUrlCacheEntryEx から返されたハンドル。
lpNextCacheEntryInfo : [var] キャッシュエントリ情報を受け取る INTERNET_CACHE_ENTRY_INFO 構造体へのポインタ。
lpcbCacheEntryInfo : [var] バッファのサイズ (バイト単位) を示す変数へのポインタ。
lpGroupAttributes : [intptr] 本パラメータは予約されており、NULL を指定しなければならない。
lpcbGroupAttributes : [var] 本パラメータは予約されており、NULL を指定しなければならない。
lpReserved : [intptr] 本パラメータは予約されている。
%inst
FindFirstUrlCacheEntryEx 関数で開始されたキャッシュ列挙の次のキャッシュエントリを取得する。(Unicode)

[戻り値]
成功した場合は TRUE を、失敗した場合は FALSE を返す。具体的なエラー情報を取得するには GetLastError を呼び出す。

[備考]
キャッシュ内の最後の項目が返されるまで、FindNextUrlCacheEntryEx の呼び出しを続けること。WinINet API
の他のすべての側面と同様に、本関数は DllMain
やグローバルオブジェクトのコンストラクタ・デストラクタの中から安全に呼び出すことはできない。注意: WinINet
はサーバー実装をサポートしていない。さらに、サービスから使用すべきでもない。サーバー実装やサービスでは Microsoft Windows
HTTP Services (WinHTTP) を使用すること。
> [!NOTE] > wininet.h ヘッダーは FindNextUrlCacheEntryEx
をエイリアスとして定義しており、UNICODE プリプロセッサ定数の定義に基づいて本関数の ANSI 版または Unicode
版を自動的に選択する。エンコーディング中立のエイリアスとエンコーディング中立でないコードを混在させると、コンパイルエラーや実行時エラーの原因となるミスマッチが発生する可能性がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照のこと。


%index
FindNextUrlCacheGroup
FindFirstUrlCacheGroup で開始されたキャッシュグループ列挙の次のキャッシュグループを取得する。
%prm
hFind, lpGroupId, lpReserved
hFind : [intptr] FindFirstUrlCacheGroup から返されたキャッシュグループ列挙ハンドル。
lpGroupId : [var] キャッシュグループ識別子を受け取る変数へのポインタ。
lpReserved : [intptr] 本パラメータは予約されており、NULL を指定しなければならない。
%inst
FindFirstUrlCacheGroup で開始されたキャッシュグループ列挙の次のキャッシュグループを取得する。

[戻り値]
成功した場合は TRUE を、失敗した場合は FALSE を返す。具体的なエラー情報を取得するには GetLastError を呼び出す。

[備考]
キャッシュ内の最後の項目が返されるまで、FindNextUrlCacheGroup の呼び出しを続けること。WinINet API
の他のすべての側面と同様に、本関数は DllMain
やグローバルオブジェクトのコンストラクタ・デストラクタの中から安全に呼び出すことはできない。注意: WinINet
はサーバー実装をサポートしていない。さらに、サービスから使用すべきでもない。サーバー実装やサービスでは Microsoft Windows
HTTP Services (WinHTTP) を使用すること。


%index
FreeUrlCacheSpaceW
キャッシュ内の領域を解放する。(Unicode)
%prm
lpszCachePath, dwSize, dwFilter
lpszCachePath : [wstr] キャッシュのパス。
dwSize : [int] 解放するキャッシュの割合 (1 から 100 の範囲、両端を含む)。
dwFilter : [int] 本パラメータは予約されており、0 を指定しなければならない。
%inst
キャッシュ内の領域を解放する。(Unicode)

[戻り値]
成功した場合は TRUE を、失敗した場合は FALSE を返す。拡張エラー情報を取得するには GetLastError を呼び出す。

[備考]
注意: WinINet
はサーバー実装をサポートしていない。さらに、サービスから使用したり、セキュリティコンテキストの偽装中に使用すべきでもない。サーバー実装やサービスでは
Microsoft Windows HTTP Services (WinHTTP) を使用すること。
> [!NOTE] > winineti.h ヘッダーは FreeUrlCacheSpace
をエイリアスとして定義しており、UNICODE プリプロセッサ定数の定義に基づいて本関数の ANSI 版または Unicode
版を自動的に選択する。エンコーディング中立のエイリアスとエンコーディング中立でないコードを混在させると、コンパイルエラーや実行時エラーの原因となるミスマッチが発生する可能性がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照のこと。


%index
FtpCommandW
FTP サーバーに直接コマンドを送信する。(Unicode)
%prm
hConnect, fExpectResponse, dwFlags, lpszCommand, dwContext, phFtpCommand
hConnect : [intptr] InternetConnect の呼び出しから返されたハンドル。
fExpectResponse : [int] アプリケーションが FTP サーバーによるデータ接続の確立を期待するかどうかを示すブール値。データ接続が期待される場合は TRUE を、そうでない場合は FALSE を指定する。
dwFlags : [int] 
lpszCommand : [wstr] FTP サーバーに送信するコマンドを格納した文字列へのポインタ。
dwContext : [int] コールバック処理でアプリケーションコンテキストを識別するために使用されるアプリケーション定義の値を格納した変数へのポインタ。
phFtpCommand : [var] 有効なデータソケットが開かれた場合に作成されるハンドルへのポインタ。phFtpCommand を埋めるには、fExpectResponse パラメータを TRUE に設定しなければならない。
%inst
FTP サーバーに直接コマンドを送信する。(Unicode)

[戻り値]
成功した場合は TRUE を、失敗した場合は FALSE を返す。具体的なエラーメッセージを取得するには GetLastError
を呼び出す。

[備考]
クライアントアプリケーションがオフラインの場合、GetLastError は
ERROR_INTERNET_NO_DIRECT_ACCESS を返すことがある。1
つ以上のパラメータが無効である場合、GetLastError は ERROR_INVALID_PARAMETER を返す。WinINet
API の他のすべての側面と同様に、本関数は DllMain
やグローバルオブジェクトのコンストラクタ・デストラクタの中から安全に呼び出すことはできない。注意: WinINet
はサーバー実装をサポートしていない。さらに、サービスから使用すべきでもない。サーバー実装やサービスでは Microsoft Windows
HTTP Services (WinHTTP) を使用すること。
> [!NOTE] > wininet.h ヘッダーは FtpCommand をエイリアスとして定義しており、UNICODE
プリプロセッサ定数の定義に基づいて本関数の ANSI 版または Unicode
版を自動的に選択する。エンコーディング中立のエイリアスとエンコーディング中立でないコードを混在させると、コンパイルエラーや実行時エラーの原因となるミスマッチが発生する可能性がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照のこと。


%index
FtpCreateDirectoryW
FTP サーバー上に新しいディレクトリを作成する。(Unicode)
%prm
hConnect, lpszDirectory
hConnect : [intptr] INTERNET_SERVICE_FTP を指定した InternetConnect の以前の呼び出しから返されたハンドル。
lpszDirectory : [wstr] 作成するディレクトリの名前を格納した null 終端文字列へのポインタ。完全修飾パス、またはカレントディレクトリからの相対名のいずれかを指定できる。
%inst
FTP サーバー上に新しいディレクトリを作成する。(Unicode)

[戻り値]
成功した場合は TRUE を、失敗した場合は FALSE を返す。具体的なエラーメッセージを取得するには GetLastError
を呼び出す。エラーメッセージが FTP
サーバーによってディレクトリ作成要求が拒否されたことを示している場合は、InternetGetLastResponseInfo
を使用して理由を確認すること。

[備考]

アプリケーションは、リモートシステムが階層的なディレクトリ命名スキームを使用していると仮定するのではなく、FtpGetCurrentDirectory
を使用してリモートサイトのカレント作業ディレクトリを判定すべきである。lpszDirectory
パラメータには、カレントディレクトリからの部分修飾または完全修飾のファイル名を指定できる。WinINet API
の他のすべての側面と同様に、本関数は DllMain
やグローバルオブジェクトのコンストラクタ・デストラクタの中から安全に呼び出すことはできない。注意: WinINet
はサーバー実装をサポートしていない。さらに、サービスから使用すべきでもない。サーバー実装やサービスでは Microsoft Windows
HTTP Services (WinHTTP) を使用すること。
> [!NOTE] > wininet.h ヘッダーは FtpCreateDirectory
をエイリアスとして定義しており、UNICODE プリプロセッサ定数の定義に基づいて本関数の ANSI 版または Unicode
版を自動的に選択する。エンコーディング中立のエイリアスとエンコーディング中立でないコードを混在させると、コンパイルエラーや実行時エラーの原因となるミスマッチが発生する可能性がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照のこと。


%index
FtpDeleteFileW
FTP サーバーに保存されているファイルを削除する。(Unicode)
%prm
hConnect, lpszFileName
hConnect : [intptr] INTERNET_SERVICE_FTP を指定した InternetConnect の以前の呼び出しから返されたハンドル。
lpszFileName : [wstr] 削除するファイルの名前を格納した null 終端文字列へのポインタ。
%inst
FTP サーバーに保存されているファイルを削除する。(Unicode)

[戻り値]
成功した場合は TRUE を、失敗した場合は FALSE を返す。具体的なエラーメッセージを取得するには GetLastError
を呼び出す。

[備考]
lpszFileName パラメータには、カレントディレクトリからの部分修飾または完全修飾のファイル名を指定できる。WinINet API
の他のすべての側面と同様に、本関数は DllMain
やグローバルオブジェクトのコンストラクタ・デストラクタの中から安全に呼び出すことはできない。注意: WinINet
はサーバー実装をサポートしていない。さらに、サービスから使用すべきでもない。サーバー実装やサービスでは Microsoft Windows
HTTP Services (WinHTTP) を使用すること。
> [!NOTE] > wininet.h ヘッダーは FtpDeleteFile をエイリアスとして定義しており、UNICODE
プリプロセッサ定数の定義に基づいて本関数の ANSI 版または Unicode
版を自動的に選択する。エンコーディング中立のエイリアスとエンコーディング中立でないコードを混在させると、コンパイルエラーや実行時エラーの原因となるミスマッチが発生する可能性がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照のこと。


%index
FtpFindFirstFileW
指定された FTP セッションのディレクトリを検索する。ファイルとディレクトリのエントリは WIN32_FIND_DATA 構造体としてアプリケーションに返される。(Unicode)
%prm
hConnect, lpszSearchFile, lpFindFileData, dwFlags, dwContext
hConnect : [intptr] InternetConnect から返された FTP セッションへのハンドル。
lpszSearchFile : [wstr] FTP サーバーのファイルシステム上の有効なディレクトリパスまたはファイル名を指定する null 終端文字列へのポインタ。文字列にはワイルドカードを含めることができるが、空白は許可されない。lpszSearchFile の値が NULL または空文字列の場合、関数はサーバー上のカレントディレクトリで最初のファイルを検索する。
lpFindFileData : [var] 見つかったファイルまたはディレクトリの情報を受け取る WIN32_FIND_DATA 構造体へのポインタ。
dwFlags : [int] 
dwContext : [int] 本検索を任意のアプリケーションデータと関連付けるアプリケーション定義の値を指定する変数へのポインタ。本パラメータは、アプリケーションが既に InternetSetStatusCallback を呼び出してステータスコールバック関数を設定している場合にのみ使用される。
%inst
指定された FTP セッションのディレクトリを検索する。ファイルとディレクトリのエントリは WIN32_FIND_DATA
構造体としてアプリケーションに返される。(Unicode)

[戻り値]
ディレクトリ列挙が正常に開始された場合は要求に対する有効なハンドルを、そうでない場合は NULL
を返す。具体的なエラーメッセージを取得するには GetLastError を呼び出す。一致するファイルが見つからない場合などに
GetLastError が ERROR_INTERNET_EXTENDED_ERROR
を返した場合は、InternetGetLastResponseInfo 関数を呼び出して拡張エラーテキストを取得すること
(Handling Errors を参照)。

[備考]
FtpFindFirstFile では、WIN32_FIND_DATA
構造体に返されるファイル時刻はローカルタイムゾーンであり、協定世界時 (UTC) 形式ではない。FtpFindFirstFile は
FindFirstFile 関数に類似している。ただし、特定の FTP セッション内で同時に発生できる FtpFindFirstFile
は 1 つだけであることに注意すること。したがって、列挙は FTP セッションハンドルと相関する。これは FTP
プロトコルがセッションごとに 1 つのディレクトリ列挙のみを許可しているためである。FtpFindFirstFile
を呼び出した後、InternetCloseHandle を呼び出すまで、アプリケーションは指定した FTP セッションハンドルで
FtpFindFirstFile を再度呼び出すことができない。そのハンドルで FtpFindFirstFile を呼び出すと、関数は
ERROR_FTP_TRANSFER_IN_PROGRESS で失敗する。呼び出し側アプリケーションが FtpFindFirstFile
によって返された HINTERNET ハンドルの使用を終えたら、InternetCloseHandle
関数で閉じなければならない。FtpFindFirstFile によるディレクトリ列挙の開始後、InternetFindNextFile
関数を使用して列挙を継続できる。FTP
プロトコルには列挙の標準的な手段がないため、ファイル作成日時など、ファイルに関する一般的な情報の一部は常に利用できるとは限らず、正確でない場合もある。そのような場合、FtpFindFirstFile
と InternetFindNextFile
は、利用可能な情報に基づく最善の推測で利用できない情報を埋める。例えば、作成日や最終アクセス日は、しばしばファイルの更新日と同じになる。アプリケーションは
FtpOpenFile と InternetCloseHandle の呼び出しの間に FtpFindFirstFile
を呼び出すことができない。WinINet API の他のすべての側面と同様に、本関数は DllMain
やグローバルオブジェクトのコンストラクタ・デストラクタの中から安全に呼び出すことはできない。注意: WinINet
はサーバー実装をサポートしていない。さらに、サービスから使用すべきでもない。サーバー実装やサービスでは Microsoft Windows
HTTP Services (WinHTTP) を使用すること。
> [!NOTE] > wininet.h ヘッダーは FtpFindFirstFile をエイリアスとして定義しており、UNICODE
プリプロセッサ定数の定義に基づいて本関数の ANSI 版または Unicode
版を自動的に選択する。エンコーディング中立のエイリアスとエンコーディング中立でないコードを混在させると、コンパイルエラーや実行時エラーの原因となるミスマッチが発生する可能性がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照のこと。


%index
FtpGetCurrentDirectoryW
指定した FTP セッションのカレントディレクトリを取得する。(Unicode)
%prm
hConnect, lpszCurrentDirectory, lpdwCurrentDirectory
hConnect : [intptr] FTP セッションへのハンドル。
lpszCurrentDirectory : [wstr] カレントディレクトリの絶対パスを受け取る null 終端文字列へのポインタ。
lpdwCurrentDirectory : [var] バッファの長さ (TCHAR 単位) を指定する変数へのポインタ。バッファの長さには終端 null 文字の領域を含めなければならない。MAX_PATH の長さがあればすべてのパスに十分である。関数が戻ると、変数にはバッファにコピーされた文字数が格納される。
%inst
指定した FTP セッションのカレントディレクトリを取得する。(Unicode)

[戻り値]
成功した場合は TRUE を、失敗した場合は FALSE を返す。具体的なエラーメッセージを取得するには GetLastError
を呼び出す。

[備考]
lpszCurrentDirectory バッファが十分大きくない場合、lpdwCurrentDirectory
には完全なカレントディレクトリ名を取得するために必要なバイト数が返される。WinINet API の他のすべての側面と同様に、本関数は
DllMain やグローバルオブジェクトのコンストラクタ・デストラクタの中から安全に呼び出すことはできない。注意: WinINet
はサーバー実装をサポートしていない。さらに、サービスから使用すべきでもない。サーバー実装やサービスでは Microsoft Windows
HTTP Services (WinHTTP) を使用すること。
> [!NOTE] > wininet.h ヘッダーは FtpGetCurrentDirectory
をエイリアスとして定義しており、UNICODE プリプロセッサ定数の定義に基づいて本関数の ANSI 版または Unicode
版を自動的に選択する。エンコーディング中立のエイリアスとエンコーディング中立でないコードを混在させると、コンパイルエラーや実行時エラーの原因となるミスマッチが発生する可能性がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照のこと。


%index
FtpGetFileW
FTP サーバーからファイルを取得し、指定したファイル名で保存する。その過程で新しいローカルファイルを作成する。(Unicode)
%prm
hConnect, lpszRemoteFile, lpszNewFile, fFailIfExists, dwFlagsAndAttributes, dwFlags, dwContext
hConnect : [intptr] FTP セッションへのハンドル。
lpszRemoteFile : [wstr] 取得するファイルの名前を格納した null 終端文字列へのポインタ。
lpszNewFile : [wstr] ローカルシステム上に作成するファイルの名前を格納した null 終端文字列へのポインタ。
fFailIfExists : [int] 指定された名前のローカルファイルが既に存在する場合に関数を続行するかどうかを示す。fFailIfExists が TRUE でローカルファイルが存在する場合、FtpGetFile は失敗する。
dwFlagsAndAttributes : [int] 新しいファイルのファイル属性。本パラメータには CreateFile 関数で使用される FILE_ATTRIBUTE_* フラグの任意の組み合わせを指定できる。
dwFlags : [int] 関数がファイルダウンロードをどう処理するかを制御する。最初のフラグ値の組は、転送が発生する条件を示す。これらの転送種別フラグは、キャッシュを制御する 2 番目のフラグ組と組み合わせて使用できる。
dwContext : [int] 本検索を任意のアプリケーションデータと関連付けるアプリケーション定義の値を格納した変数へのポインタ。本パラメータは、アプリケーションが既に InternetSetStatusCallback を呼び出してステータスコールバック関数を設定している場合にのみ使用される。
%inst
FTP サーバーからファイルを取得し、指定したファイル名で保存する。その過程で新しいローカルファイルを作成する。(Unicode)

[戻り値]
成功した場合は TRUE を、失敗した場合は FALSE を返す。具体的なエラーメッセージを取得するには GetLastError
を呼び出す。

[備考]
FtpGetFile は、FTP
サーバーからのファイル読み取りとローカルへの保存に伴うすべての管理処理を扱う高レベルなルーチンである。ファイルデータのみを取得する必要があるアプリケーション、またはファイル転送の細かな制御を必要とするアプリケーションは、FtpOpenFile
と InternetReadFile 関数を使用すべきである。dwFlags パラメータに FTP_TRANSFER_TYPE_ASCII
を指定すると、ファイルデータの変換により制御文字や書式文字がローカルの相当する文字に変換される。既定の転送はバイナリモードであり、ファイルはサーバー上に保存されたままの形式でダウンロードされる。lpszRemoteFile
と lpszNewFile の両方には、カレントディレクトリからの部分修飾または完全修飾のファイル名を指定できる。WinINet API
の他のすべての側面と同様に、本関数は DllMain
やグローバルオブジェクトのコンストラクタ・デストラクタの中から安全に呼び出すことはできない。注意: WinINet
はサーバー実装をサポートしていない。さらに、サービスから使用すべきでもない。サーバー実装やサービスでは Microsoft Windows
HTTP Services (WinHTTP) を使用すること。
> [!NOTE] > wininet.h ヘッダーは FtpGetFile をエイリアスとして定義しており、UNICODE
プリプロセッサ定数の定義に基づいて本関数の ANSI 版または Unicode
版を自動的に選択する。エンコーディング中立のエイリアスとエンコーディング中立でないコードを混在させると、コンパイルエラーや実行時エラーの原因となるミスマッチが発生する可能性がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照のこと。


%index
FtpGetFileEx
(no summary)
%prm
hFtpSession, lpszRemoteFile, lpszNewFile, fFailIfExists, dwFlagsAndAttributes, dwFlags, dwContext
hFtpSession : [intptr] 
lpszRemoteFile : [str] 
lpszNewFile : [wstr] 
fFailIfExists : [int] 
dwFlagsAndAttributes : [int] 
dwFlags : [int] 
dwContext : [int] 
%inst



%index
FtpGetFileSize
要求された FTP リソースのファイルサイズを取得する。
%prm
hFile, lpdwFileSizeHigh
hFile : [intptr] FtpOpenFile の呼び出しから返されたハンドル。
lpdwFileSizeHigh : [var] 要求された FTP リソースのファイルサイズの上位 unsigned long 整数へのポインタ。
%inst
要求された FTP リソースのファイルサイズを取得する。

[戻り値]
要求された FTP リソースのファイルサイズの下位 unsigned long 整数を返す。

[備考]
注意: WinINet はサーバー実装をサポートしていない。さらに、サービスから使用すべきでもない。サーバー実装やサービスでは
Microsoft Windows HTTP Services (WinHTTP) を使用すること。


%index
FtpOpenFileW
FTP サーバー上のリモートファイルへの読み取りまたは書き込みアクセスを開始する。(Unicode)
%prm
hConnect, lpszFileName, dwAccess, dwFlags, dwContext
hConnect : [intptr] FTP セッションへのハンドル。
lpszFileName : [wstr] アクセスするファイルの名前を格納した null 終端文字列へのポインタ。
dwAccess : [int] ファイルアクセス。本パラメータには GENERIC_READ または GENERIC_WRITE を指定できるが、両方を指定することはできない。
dwFlags : [int] 転送が発生する条件。アプリケーションは 1 つの転送種別と、ファイルのキャッシュ方法を制御するフラグの任意の組み合わせを選択すべきである。
dwContext : [int] 本検索を任意のアプリケーションデータと関連付けるアプリケーション定義の値を格納した変数へのポインタ。本パラメータは、アプリケーションが既に InternetSetStatusCallback を呼び出してステータスコールバック関数を設定している場合にのみ使用される。
%inst
FTP サーバー上のリモートファイルへの読み取りまたは書き込みアクセスを開始する。(Unicode)

[戻り値]
成功した場合はハンドルを、失敗した場合は NULL を返す。具体的なエラーメッセージを取得するには GetLastError を呼び出す。

[備考]
FtpOpenFile を呼び出した後、InternetCloseHandle を呼び出すまで、同じ FTP セッションハンドルに対する
FTP 関数の他のすべての呼び出しは失敗し、エラーメッセージとして ERROR_FTP_TRANSFER_IN_PROGRESS
が設定される。呼び出し側アプリケーションが FtpOpenFile によって返された HINTERNET
ハンドルの使用を終えたら、InternetCloseHandle 関数で閉じなければならない。1 つの FTP セッションでは 1
つのファイルしか開くことができない。したがって、ファイルハンドルは返されず、アプリケーションは必要に応じて FTP
セッションハンドルを使用するだけである。lpszFileName
パラメータには、カレントディレクトリからの部分修飾または完全修飾のファイル名を指定できる。WinINet API
の他のすべての側面と同様に、本関数は DllMain
やグローバルオブジェクトのコンストラクタ・デストラクタの中から安全に呼び出すことはできない。注意: WinINet
はサーバー実装をサポートしていない。さらに、サービスから使用すべきでもない。サーバー実装やサービスでは Microsoft Windows
HTTP Services (WinHTTP) を使用すること。
> [!NOTE] > wininet.h ヘッダーは FtpOpenFile をエイリアスとして定義しており、UNICODE
プリプロセッサ定数の定義に基づいて本関数の ANSI 版または Unicode
版を自動的に選択する。エンコーディング中立のエイリアスとエンコーディング中立でないコードを混在させると、コンパイルエラーや実行時エラーの原因となるミスマッチが発生する可能性がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照のこと。


%index
FtpPutFileW
FTP サーバー上にファイルを保存する。(Unicode)
%prm
hConnect, lpszLocalFile, lpszNewRemoteFile, dwFlags, dwContext
hConnect : [intptr] FTP セッションへのハンドル。
lpszLocalFile : [wstr] ローカルシステムから送信するファイルの名前を格納した null 終端文字列へのポインタ。
lpszNewRemoteFile : [wstr] リモートシステム上に作成するファイルの名前を格納した null 終端文字列へのポインタ。
dwFlags : [int] 転送が発生する条件。アプリケーションは 1 つの転送種別と、ファイルのキャッシュ方法を制御するフラグの任意の組み合わせを選択すべきである。
dwContext : [int] 本検索を任意のアプリケーションデータと関連付けるアプリケーション定義の値を格納した変数へのポインタ。本パラメータは、アプリケーションが既に InternetSetStatusCallback を呼び出してステータスコールバックを設定している場合にのみ使用される。
%inst
FTP サーバー上にファイルを保存する。(Unicode)

[戻り値]
成功した場合は TRUE を、失敗した場合は FALSE を返す。具体的なエラーメッセージを取得するには GetLastError
を呼び出す。

[備考]
FtpPutFile は、ローカルでのファイル読み取りと FTP
サーバーへの保存に伴うすべての管理処理を扱う高レベルなルーチンである。ファイルデータの送信のみを必要とする、またはファイル転送の細かな制御を必要とするアプリケーションは、FtpOpenFile
と InternetWriteFile 関数を使用すべきである。dwFlags パラメータに
FILE_TRANSFER_TYPE_ASCII
を指定すると、ファイルデータの変換により制御文字や書式文字がローカルの相当する文字に変換される。lpszNewRemoteFile と
lpszLocalFile の両方には、カレントディレクトリからの部分修飾または完全修飾のファイル名を指定できる。WinINet API
の他のすべての側面と同様に、本関数は DllMain
やグローバルオブジェクトのコンストラクタ・デストラクタの中から安全に呼び出すことはできない。注意: WinINet
はサーバー実装をサポートしていない。さらに、サービスから使用すべきでもない。サーバー実装やサービスでは Microsoft Windows
HTTP Services (WinHTTP) を使用すること。
> [!NOTE] > wininet.h ヘッダーは FtpPutFile をエイリアスとして定義しており、UNICODE
プリプロセッサ定数の定義に基づいて本関数の ANSI 版または Unicode
版を自動的に選択する。エンコーディング中立のエイリアスとエンコーディング中立でないコードを混在させると、コンパイルエラーや実行時エラーの原因となるミスマッチが発生する可能性がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照のこと。


%index
FtpPutFileEx
(no summary)
%prm
hFtpSession, lpszLocalFile, lpszNewRemoteFile, dwFlags, dwContext
hFtpSession : [intptr] 
lpszLocalFile : [wstr] 
lpszNewRemoteFile : [str] 
dwFlags : [int] 
dwContext : [int] 
%inst



%index
FtpRemoveDirectoryW
FTP サーバー上の指定したディレクトリを削除する。(Unicode)
%prm
hConnect, lpszDirectory
hConnect : [intptr] FTP セッションへのハンドル。
lpszDirectory : [wstr] 削除するディレクトリの名前を格納した null 終端文字列へのポインタ。完全修飾パス、またはカレントディレクトリからの相対名のいずれかを指定できる。
%inst
FTP サーバー上の指定したディレクトリを削除する。(Unicode)

[戻り値]
成功した場合は TRUE を、失敗した場合は FALSE を返す。具体的なエラーメッセージを取得するには GetLastError
を呼び出す。エラーメッセージが FTP
サーバーによってディレクトリ削除要求が拒否されたことを示している場合は、InternetGetLastResponseInfo
を使用して理由を確認すること。

[備考]

アプリケーションは、リモートシステムが階層的なディレクトリ命名スキームを使用していると仮定するのではなく、FtpGetCurrentDirectory
を使用してリモートサイトのカレント作業ディレクトリを判定すべきである。lpszDirectory
パラメータには、カレントディレクトリからの部分修飾または完全修飾のファイル名を指定できる。WinINet API
の他のすべての側面と同様に、本関数は DllMain
やグローバルオブジェクトのコンストラクタ・デストラクタの中から安全に呼び出すことはできない。注意: WinINet
はサーバー実装をサポートしていない。さらに、サービスから使用すべきでもない。サーバー実装やサービスでは Microsoft Windows
HTTP Services (WinHTTP) を使用すること。
> [!NOTE] > wininet.h ヘッダーは FtpRemoveDirectory
をエイリアスとして定義しており、UNICODE プリプロセッサ定数の定義に基づいて本関数の ANSI 版または Unicode
版を自動的に選択する。エンコーディング中立のエイリアスとエンコーディング中立でないコードを混在させると、コンパイルエラーや実行時エラーの原因となるミスマッチが発生する可能性がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照のこと。


%index
FtpRenameFileW
FTP サーバー上に保存されているファイルの名前を変更する。(Unicode)
%prm
hConnect, lpszExisting, lpszNew
hConnect : [intptr] FTP セッションへのハンドル。
lpszExisting : [wstr] 名前を変更するファイルの名前を格納した null 終端文字列へのポインタ。
lpszNew : [wstr] リモートファイルの新しい名前を格納した null 終端文字列へのポインタ。
%inst
FTP サーバー上に保存されているファイルの名前を変更する。(Unicode)

[戻り値]
成功した場合は TRUE を、失敗した場合は FALSE を返す。具体的なエラーメッセージを取得するには GetLastError
を呼び出す。

[備考]
lpszExisting と lpszNew
パラメータには、カレントディレクトリからの部分修飾または完全修飾のファイル名を指定できる。WinINet API
の他のすべての側面と同様に、本関数は DllMain
やグローバルオブジェクトのコンストラクタ・デストラクタの中から安全に呼び出すことはできない。注意: WinINet
はサーバー実装をサポートしていない。さらに、サービスから使用すべきでもない。サーバー実装やサービスでは Microsoft Windows
HTTP Services (WinHTTP) を使用すること。
> [!NOTE] > wininet.h ヘッダーは FtpRenameFile をエイリアスとして定義しており、UNICODE
プリプロセッサ定数の定義に基づいて本関数の ANSI 版または Unicode
版を自動的に選択する。エンコーディング中立のエイリアスとエンコーディング中立でないコードを混在させると、コンパイルエラーや実行時エラーの原因となるミスマッチが発生する可能性がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照のこと。


%index
FtpSetCurrentDirectoryW
FTP サーバー上の作業ディレクトリを変更する。(Unicode)
%prm
hConnect, lpszDirectory
hConnect : [intptr] FTP セッションへのハンドル。
lpszDirectory : [wstr] カレント作業ディレクトリにするディレクトリの名前を格納した null 終端文字列へのポインタ。完全修飾パス、またはカレントディレクトリからの相対名のいずれかを指定できる。
%inst
FTP サーバー上の作業ディレクトリを変更する。(Unicode)

[戻り値]
成功した場合は TRUE を、失敗した場合は FALSE を返す。具体的なエラーメッセージを取得するには GetLastError
を呼び出す。エラーメッセージが FTP
サーバーによってディレクトリ変更要求が拒否されたことを示している場合は、InternetGetLastResponseInfo
を使用して理由を確認すること。

[備考]

アプリケーションは、リモートシステムが階層的なディレクトリ命名スキームを使用していると仮定するのではなく、FtpGetCurrentDirectory
を使用してリモートサイトのカレント作業ディレクトリを判定すべきである。lpszDirectory
パラメータには、カレントディレクトリからの部分修飾または完全修飾のファイル名を指定できる。WinINet API
の他のすべての側面と同様に、本関数は DllMain
やグローバルオブジェクトのコンストラクタ・デストラクタの中から安全に呼び出すことはできない。注意: WinINet
はサーバー実装をサポートしていない。さらに、サービスから使用すべきでもない。サーバー実装やサービスでは Microsoft Windows
HTTP Services (WinHTTP) を使用すること。
> [!NOTE] > wininet.h ヘッダーは FtpSetCurrentDirectory
をエイリアスとして定義しており、UNICODE プリプロセッサ定数の定義に基づいて本関数の ANSI 版または Unicode
版を自動的に選択する。エンコーディング中立のエイリアスとエンコーディング中立でないコードを混在させると、コンパイルエラーや実行時エラーの原因となるミスマッチが発生する可能性がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照のこと。


%index
GetUrlCacheConfigInfoW
キャッシュ構成に関する情報を取得する。(Unicode)
%prm
lpCacheConfigInfo, lpcbCacheConfigInfo, dwFieldControl
lpCacheConfigInfo : [var] キャッシュ構成情報を受け取る INTERNET_CACHE_CONFIG_INFO 構造体へのポインタ。構造体の dwStructSize フィールドは INTERNET_CACHE_CONFIG_INFO のサイズで初期化しなければならない。
lpcbCacheConfigInfo : [var] 本パラメータは予約されており、NULL を指定しなければならない。
dwFieldControl : [int] 
%inst
キャッシュ構成に関する情報を取得する。(Unicode)

[戻り値]
成功した場合は TRUE を、失敗した場合は FALSE を返す。拡張エラー情報を取得するには GetLastError を呼び出す。

[備考]
注意: WinINet はサーバー実装をサポートしていない。さらに、サービスから使用すべきでもない。サーバー実装やサービスでは
Microsoft Windows HTTP Services (WinHTTP) を使用すること。
> [!NOTE] > winineti.h ヘッダーは GetUrlCacheConfigInfo
をエイリアスとして定義しており、UNICODE プリプロセッサ定数の定義に基づいて本関数の ANSI 版または Unicode
版を自動的に選択する。エンコーディング中立のエイリアスとエンコーディング中立でないコードを混在させると、コンパイルエラーや実行時エラーの原因となるミスマッチが発生する可能性がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照のこと。


%index
GetUrlCacheEntryBinaryBlob
(no summary)
%prm
pwszUrlName, dwType, pftExpireTime, pftAccessTime, pftModifiedTime, ppbBlob, pcbBlob
pwszUrlName : [wstr] 
dwType : [var] 
pftExpireTime : [var] 
pftAccessTime : [var] 
pftModifiedTime : [var] 
ppbBlob : [var] 
pcbBlob : [var] 
%inst



%index
GetUrlCacheEntryInfoW
キャッシュエントリの情報を取得する。(Unicode)
%prm
lpszUrlName, lpCacheEntryInfo, lpcbCacheEntryInfo
lpszUrlName : [wstr] キャッシュエントリの名前を格納した null 終端文字列へのポインタ。名前文字列にエスケープ文字を含めてはならない。
lpCacheEntryInfo : [var] キャッシュエントリ情報を受け取る INTERNET_CACHE_ENTRY_INFO 構造体へのポインタ。本パラメータ用にバッファを割り当てる必要がある。バッファに必要なサイズは事前に分からないため、ほとんどの INTERNET_CACHE_ENTRY_INFO エントリのサイズを扱える程度のバッファを割り当てるのが最良である。キャッシュエントリのサイズに上限はないため、キャッシュを列挙する必要があるアプリケーションは可変サイズのバッファを割り当てる用意が必要である。
lpcbCacheEntryInfo : [var] lpCacheEntryInfo バッファのサイズ (バイト単位) を指定する変数へのポインタ。関数が戻ると、変数にはバッファにコピーされたバイト数、またはバッファに必要なサイズ (バイト単位) が格納される。
%inst
キャッシュエントリの情報を取得する。(Unicode)

[戻り値]
成功した場合は TRUE を、失敗した場合は FALSE を返す。拡張エラー情報を取得するには GetLastError
を呼び出す。想定されるエラー値は以下のとおりである。
（以下省略）

[備考]
GetUrlCacheEntryInfo は URL の解析を一切行わないため、アンカー (#) を含む URL
は、リソースがキャッシュされていてもキャッシュ内で見つからない。例えば
`http://example.com/example.htm#sample`
を渡した場合、`http://example.com/example.htm` がキャッシュにあっても関数は
ERROR_FILE_NOT_FOUND を返す。WinINet API の他のすべての側面と同様に、本関数は DllMain
やグローバルオブジェクトのコンストラクタ・デストラクタの中から安全に呼び出すことはできない。注意: WinINet
はサーバー実装をサポートしていない。さらに、サービスから使用すべきでもない。サーバー実装やサービスでは Microsoft Windows
HTTP Services (WinHTTP) を使用すること。
> [!NOTE] > wininet.h ヘッダーは GetUrlCacheEntryInfo
をエイリアスとして定義しており、UNICODE プリプロセッサ定数の定義に基づいて本関数の ANSI 版または Unicode
版を自動的に選択する。エンコーディング中立のエイリアスとエンコーディング中立でないコードを混在させると、コンパイルエラーや実行時エラーの原因となるミスマッチが発生する可能性がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照のこと。


%index
GetUrlCacheEntryInfoExW
指定した URL に関連付けられたキャッシュエントリの情報を取得する。HttpSendRequest 関数によりオフラインモードで適用されるリダイレクトを考慮する。(Unicode)
%prm
lpszUrl, lpCacheEntryInfo, lpcbCacheEntryInfo, lpszRedirectUrl, lpcbRedirectUrl, lpReserved, dwFlags
lpszUrl : [wstr] キャッシュエントリの名前を格納した null 終端文字列へのポインタ。名前文字列にエスケープ文字を含めてはならない。
lpCacheEntryInfo : [var] キャッシュエントリ情報を受け取る INTERNET_CACHE_ENTRY_INFO 構造体へのポインタ。本パラメータ用にバッファを割り当てる必要がある。バッファに必要なサイズは事前に分からないため、ほとんどの INTERNET_CACHE_ENTRY_INFO エントリのサイズを扱える程度のバッファを割り当てるのが最良である。キャッシュエントリのサイズに上限はないため、キャッシュを列挙する必要があるアプリケーションは可変サイズのバッファを割り当てる用意が必要である。
lpcbCacheEntryInfo : [var] lpCacheEntryInfo バッファのサイズ (バイト単位) を指定する変数へのポインタ。関数が戻ると、変数にはバッファにコピーされたバイト数、またはバッファに必要なサイズ (バイト単位) が格納される。
lpszRedirectUrl : [wstr] 本パラメータは予約されており、NULL を指定しなければならない。
lpcbRedirectUrl : [var] 本パラメータは予約されており、NULL を指定しなければならない。
lpReserved : [intptr] 本パラメータは予約されており、NULL を指定しなければならない。
dwFlags : [int] 本パラメータは予約されており、0 を指定しなければならない。
%inst
指定した URL に関連付けられたキャッシュエントリの情報を取得する。HttpSendRequest
関数によりオフラインモードで適用されるリダイレクトを考慮する。(Unicode)

[戻り値]
URL が見つかった場合は TRUE を、見つからなかった場合は FALSE を返す。具体的なエラー情報を取得するには
GetLastError を呼び出す。想定されるエラーには次のものがある。
（以下省略）

[備考]
GetUrlCacheEntryInfoEx は URL の解析を一切行わないため、アンカー (#) を含む URL
は、リソースがキャッシュされていてもキャッシュ内で見つからない。例えば
`http://example.com/example.htm#sample`
を渡した場合、`http://example.com/example.htm` がキャッシュにあっても関数は
ERROR_FILE_NOT_FOUND を返す。WinINet API の他のすべての側面と同様に、本関数は DllMain
やグローバルオブジェクトのコンストラクタ・デストラクタの中から安全に呼び出すことはできない。注意: WinINet
はサーバー実装をサポートしていない。さらに、サービスから使用すべきでもない。サーバー実装やサービスでは Microsoft Windows
HTTP Services (WinHTTP) を使用すること。
> [!NOTE] > wininet.h ヘッダーは GetUrlCacheEntryInfoEx
をエイリアスとして定義しており、UNICODE プリプロセッサ定数の定義に基づいて本関数の ANSI 版または Unicode
版を自動的に選択する。エンコーディング中立のエイリアスとエンコーディング中立でないコードを混在させると、コンパイルエラーや実行時エラーの原因となるミスマッチが発生する可能性がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照のこと。


%index
GetUrlCacheGroupAttributeW
指定したキャッシュグループの属性情報を取得する。(Unicode)
%prm
gid, dwFlags, dwAttributes, lpGroupInfo, lpcbGroupInfo, lpReserved
gid : [int64] キャッシュグループの識別子。
dwFlags : [int] 本パラメータは予約されており、0 を指定しなければならない。
dwAttributes : [int] 
lpGroupInfo : [var] 要求された情報を受け取る INTERNET_CACHE_GROUP_INFO 構造体へのポインタ。
lpcbGroupInfo : [var] lpGroupInfo バッファのサイズを格納する変数へのポインタ。関数が戻ると、変数にはバッファにコピーされたバイト数、またはバッファに必要なサイズ (バイト単位) が格納される。
lpReserved : [intptr] 本パラメータは予約されており、NULL を指定しなければならない。
%inst
指定したキャッシュグループの属性情報を取得する。(Unicode)

[戻り値]
成功した場合は TRUE を、失敗した場合は FALSE を返す。具体的なエラー情報を取得するには GetLastError を呼び出す。

[備考]
注意: WinINet はサーバー実装をサポートしていない。さらに、サービスから使用すべきでもない。サーバー実装やサービスでは
Microsoft Windows HTTP Services (WinHTTP) を使用すること。
> [!NOTE] > wininet.h ヘッダーは GetUrlCacheGroupAttribute
をエイリアスとして定義しており、UNICODE プリプロセッサ定数の定義に基づいて本関数の ANSI 版または Unicode
版を自動的に選択する。エンコーディング中立のエイリアスとエンコーディング中立でないコードを混在させると、コンパイルエラーや実行時エラーの原因となるミスマッチが発生する可能性がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照のこと。


%index
GetUrlCacheHeaderData
(no summary)
%prm
nIdx, lpdwData
nIdx : [int] 
lpdwData : [var] 
%inst



%index
GopherCreateLocatorW
セレクタ文字列の構成要素から Gopher または Gopher+ ロケータ文字列を作成する。(Unicode)
%prm
lpszHost, nServerPort, lpszDisplayString, lpszSelectorString, dwGopherType, lpszLocator, lpdwBufferLength
lpszHost : [wstr] ホスト名、またはドット区切り 10 進 IP アドレス (例: 198.105.232.1) を格納した null 終端文字列へのポインタ。
nServerPort : [int] lpszHost にある Gopher サーバーが使用するポート番号 (ホストバイトオーダー)。nServerPort が INTERNET_INVALID_PORT_NUMBER の場合、既定の Gopher ポートが使用される。
lpszDisplayString : [wstr] 表示する Gopher 文書またはディレクトリを格納した null 終端文字列へのポインタ。本パラメータが NULL の場合、関数は Gopher サーバーの既定のディレクトリを返す。
lpszSelectorString : [wstr] 情報を取得するために Gopher サーバーに送信するセレクタ文字列へのポインタ。本パラメータには NULL を指定できる。
dwGopherType : [int] lpszSelectorString がディレクトリと文書のどちらを参照するか、また要求が Gopher+ か Gopher かを決定する。dwGopherType の値が 0 の場合、既定値である GOPHER_TYPE_DIRECTORY が使用される。Gopher 種別値のいずれかを指定できる。
lpszLocator : [wstr] ロケータ文字列を受け取るバッファへのポインタ。lpszLocator が NULL の場合、lpdwBufferLength に必要なバッファ長が返されるが、関数は他の処理を行わない。
lpdwBufferLength : [var] lpszLocator バッファの長さ (文字単位) を格納する変数へのポインタ。関数が戻ると、本パラメータにはバッファに書き込まれた文字数が格納される。GetLastError が ERROR_INSUFFICIENT_BUFFER を返した場合、本パラメータには必要な文字数が格納される。
%inst
セレクタ文字列の構成要素から Gopher または Gopher+ ロケータ文字列を作成する。(Unicode)

[戻り値]
成功した場合は TRUE を、失敗した場合は FALSE を返す。拡張エラー情報を取得するには GetLastError または
InternetGetLastResponseInfo を呼び出す。

[備考]
Gopher サーバーから情報を取得するには、アプリケーションはまず Gopher サーバーから Gopher
「ロケータ」を取得しなければならない。アプリケーションが不透明なトークンとして扱うべきロケータは、通常、特定の情報を取得するための
GopherFindFirstFile 関数の呼び出しに使用される。WinINet API の他のすべての側面と同様に、本関数は
DllMain やグローバルオブジェクトのコンストラクタ・デストラクタの中から安全に呼び出すことはできない。注意: WinINet
はサーバー実装をサポートしていない。さらに、サービスから使用すべきでもない。サーバー実装やサービスでは Microsoft Windows
HTTP Services (WinHTTP) を使用すること。
> [!NOTE] > wininet.h ヘッダーは GopherCreateLocator
をエイリアスとして定義しており、UNICODE プリプロセッサ定数の定義に基づいて本関数の ANSI 版または Unicode
版を自動的に選択する。エンコーディング中立のエイリアスとエンコーディング中立でないコードを混在させると、コンパイルエラーや実行時エラーの原因となるミスマッチが発生する可能性がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照のこと。


%index
GopherFindFirstFileW
Gopher ロケータと検索条件を使用してサーバーとのセッションを作成し、要求された文書、バイナリファイル、インデックスサーバー、またはディレクトリツリーを検索する。(Unicode)
%prm
hConnect, lpszLocator, lpszSearchString, lpFindData, dwFlags, dwContext
hConnect : [intptr] InternetConnect から返された Gopher セッションへのハンドル。
lpszLocator : [wstr] 検索する項目の名前を格納した null 終端文字列へのポインタ。次のいずれかを指定できる。
lpszSearchString : [wstr] 本要求がインデックスサーバーへのものである場合、検索する文字列を格納したバッファへのポインタ。それ以外の場合、本パラメータは NULL を指定すべきである。
lpFindData : [var] 本関数で取得した情報を受け取る GOPHER_FIND_DATA 構造体へのポインタ。
dwFlags : [int] 
dwContext : [int] 本検索を任意のアプリケーションデータと関連付けるアプリケーション定義の値を格納した変数へのポインタ。
%inst
Gopher
ロケータと検索条件を使用してサーバーとのセッションを作成し、要求された文書、バイナリファイル、インデックスサーバー、またはディレクトリツリーを検索する。(Unicode)

[戻り値]
成功した場合は有効な検索ハンドルを、失敗した場合は NULL を返す。拡張エラー情報を取得するには GetLastError または
InternetGetLastResponseInfo を呼び出す。

[備考]
GopherFindFirstFile は FindFirstFile 関数によく似ている。Gopher
サーバーとの接続を作成し、ロケータ文字列が参照する最初の Gopher
オブジェクトに関する情報を含む単一の構造体を返す。GopherFindFirstFile を呼び出して列挙の最初の Gopher
オブジェクトを取得した後、アプリケーションは InternetFindNextFile 関数を使用して後続の Gopher
オブジェクトを取得できる。呼び出し側アプリケーションが GopherFindFirstFile によって返された HINTERNET
ハンドルの使用を終えたら、InternetCloseHandle 関数で閉じなければならない。WinINet API
の他のすべての側面と同様に、本関数は DllMain
やグローバルオブジェクトのコンストラクタ・デストラクタの中から安全に呼び出すことはできない。注意: WinINet
はサーバー実装をサポートしていない。さらに、サービスから使用すべきでもない。サーバー実装やサービスでは Microsoft Windows
HTTP Services (WinHTTP) を使用すること。
> [!NOTE] > wininet.h ヘッダーは GopherFindFirstFile
をエイリアスとして定義しており、UNICODE プリプロセッサ定数の定義に基づいて本関数の ANSI 版または Unicode
版を自動的に選択する。エンコーディング中立のエイリアスとエンコーディング中立でないコードを混在させると、コンパイルエラーや実行時エラーの原因となるミスマッチが発生する可能性がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照のこと。


%index
GopherGetAttributeW
サーバーから特定の属性情報を取得する。(Unicode)
%prm
hConnect, lpszLocator, lpszAttributeName, lpBuffer, dwBufferLength, lpdwCharactersReturned, lpfnEnumerator, dwContext
hConnect : [intptr] InternetConnect から返された Gopher セッションへのハンドル。
lpszLocator : [wstr] 属性情報を返す Gopher サーバー上の項目を識別する null 終端文字列へのポインタ。
lpszAttributeName : [wstr] 返す属性名を指定するスペース区切り文字列へのポインタ。lpszAttributeName が NULL の場合、GopherGetAttribute はすべての属性に関する情報を返す。
lpBuffer : [var] 属性情報を取得するアプリケーション定義のバッファへのポインタ。
dwBufferLength : [int] lpBuffer バッファのサイズ (TCHAR 単位)。
lpdwCharactersReturned : [var] lpBuffer バッファに読み取られた文字数を格納する変数へのポインタ。
lpfnEnumerator : [int] ロケータの各属性を列挙する GopherAttributeEnumerator コールバック関数へのポインタ。本パラメータは省略可能である。NULL の場合、Gopher 属性情報のすべてが lpBuffer に格納される。lpfnEnumerator が指定されている場合、コールバック関数はオブジェクトの属性ごとに 1 回呼び出される。
dwContext : [int] 本操作を任意のアプリケーションデータと関連付けるアプリケーション定義の値。
%inst
サーバーから特定の属性情報を取得する。(Unicode)

[戻り値]
要求が満たされた場合は TRUE を、そうでない場合は FALSE を返す。拡張エラー情報を取得するには GetLastError または
InternetGetLastResponseInfo を呼び出す。

[備考]
一般に、アプリケーションは GopherFindFirstFile または InternetFindNextFile
を呼び出した後に本関数を呼び出す。lpBuffer パラメータのサイズは MIN_GOPHER_ATTRIBUTE_LENGTH
の値以上でなければならない。WinINet API の他のすべての側面と同様に、本関数は DllMain
やグローバルオブジェクトのコンストラクタ・デストラクタの中から安全に呼び出すことはできない。注意: WinINet
はサーバー実装をサポートしていない。さらに、サービスから使用すべきでもない。サーバー実装やサービスでは Microsoft Windows
HTTP Services (WinHTTP) を使用すること。
> [!NOTE] > wininet.h ヘッダーは GopherGetAttribute
をエイリアスとして定義しており、UNICODE プリプロセッサ定数の定義に基づいて本関数の ANSI 版または Unicode
版を自動的に選択する。エンコーディング中立のエイリアスとエンコーディング中立でないコードを混在させると、コンパイルエラーや実行時エラーの原因となるミスマッチが発生する可能性がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照のこと。


%index
GopherGetLocatorTypeW
Gopher ロケータを解析してその属性を判定する。(Unicode)
%prm
lpszLocator, lpdwGopherType
lpszLocator : [wstr] 解析する Gopher ロケータを指定する null 終端文字列へのポインタ。
lpdwGopherType : [var] ロケータの種別を受け取る変数へのポインタ。種別は Gopher 種別値の組み合わせから成るビットマスクである。
%inst
Gopher ロケータを解析してその属性を判定する。(Unicode)

[戻り値]
成功した場合は TRUE を、失敗した場合は FALSE を返す。拡張エラー情報を取得するには GetLastError を呼び出す。

[備考]
GopherGetLocatorType は Gopher
ロケータが参照する項目に関する情報を返す。なお、ファイルには複数の属性が設定されている場合がある。例えば、Gopher+
サーバーに格納されたテキストファイルには GOPHER_TYPE_TEXT_FILE と GOPHER_TYPE_GOPHER_PLUS
の両方が設定される。WinINet API の他のすべての側面と同様に、本関数は DllMain
やグローバルオブジェクトのコンストラクタ・デストラクタの中から安全に呼び出すことはできない。注意: WinINet
はサーバー実装をサポートしていない。さらに、サービスから使用すべきでもない。サーバー実装やサービスでは Microsoft Windows
HTTP Services (WinHTTP) を使用すること。
> [!NOTE] > wininet.h ヘッダーは GopherGetLocatorType
をエイリアスとして定義しており、UNICODE プリプロセッサ定数の定義に基づいて本関数の ANSI 版または Unicode
版を自動的に選択する。エンコーディング中立のエイリアスとエンコーディング中立でないコードを混在させると、コンパイルエラーや実行時エラーの原因となるミスマッチが発生する可能性がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照のこと。


%index
GopherOpenFileW
Gopher サーバーから Gopher データファイルの読み取りを開始する。(Unicode)
%prm
hConnect, lpszLocator, lpszView, dwFlags, dwContext
hConnect : [intptr] InternetConnect から返された Gopher セッションへのハンドル。
lpszLocator : [wstr] 開くファイルを指定する null 終端文字列へのポインタ。一般に、このロケータは GopherFindFirstFile または InternetFindNextFile の呼び出しから返される。Gopher プロトコルにはカレントディレクトリの概念がないため、ロケータは常に完全修飾である。
lpszView : [wstr] サーバー上にファイルの複数のビューが存在する場合に開くビューを記述する null 終端文字列へのポインタ。lpszView が NULL の場合、関数は既定のファイルビューを使用する。
dwFlags : [int] 
dwContext : [int] 本操作を任意のアプリケーションデータと関連付けるアプリケーション定義の値を格納した変数へのポインタ。
%inst
Gopher サーバーから Gopher データファイルの読み取りを開始する。(Unicode)

[戻り値]
成功した場合はハンドルを、ファイルを開けなかった場合は NULL を返す。拡張エラー情報を取得するには GetLastError または
InternetGetLastResponseInfo を呼び出す。

[備考]
GopherOpenFile は Gopher
サーバー上のファイルを開く。サーバー上で実際にファイルを開いたりロックしたりすることはできないため、本関数は単に、InternetReadFile
や GopherGetAttribute
などのファイルベースの操作にアプリケーションが使用できるハンドルに位置情報を関連付けるだけである。呼び出し側アプリケーションが
GopherOpenFile によって返された HINTERNET ハンドルの使用を終えたら、InternetCloseHandle
関数で閉じなければならない。WinINet API の他のすべての側面と同様に、本関数は DllMain
やグローバルオブジェクトのコンストラクタ・デストラクタの中から安全に呼び出すことはできない。注意: WinINet
はサーバー実装をサポートしていない。さらに、サービスから使用すべきでもない。サーバー実装やサービスでは Microsoft Windows
HTTP Services (WinHTTP) を使用すること。
> [!NOTE] > wininet.h ヘッダーは GopherOpenFile をエイリアスとして定義しており、UNICODE
プリプロセッサ定数の定義に基づいて本関数の ANSI 版または Unicode
版を自動的に選択する。エンコーディング中立のエイリアスとエンコーディング中立でないコードを混在させると、コンパイルエラーや実行時エラーの原因となるミスマッチが発生する可能性がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照のこと。


%index
HttpAddRequestHeadersW
1 つ以上の HTTP リクエストヘッダーを HTTP リクエストハンドルに追加する。(HttpAddRequestHeadersW)
%prm
hRequest, lpszHeaders, dwHeadersLength, dwModifiers
hRequest : [intptr] HttpOpenRequest 関数の呼び出しから返されたハンドル。
lpszHeaders : [wstr] リクエストに追加するヘッダーを格納した文字列変数へのポインタ。各ヘッダーは CR/LF (キャリッジリターン/ラインフィード) のペアで終端しなければならない。
dwHeadersLength : [int] lpszHeaders のサイズ (TCHAR 単位)。本パラメータが -1L の場合、関数は lpszHeaders がゼロ終端 (ASCIIZ) であると仮定し、長さを計算する。
dwModifiers : [int] 
%inst
1 つ以上の HTTP リクエストヘッダーを HTTP リクエストハンドルに追加する。(HttpAddRequestHeadersW)

[戻り値]
成功した場合は TRUE を、失敗した場合は FALSE を返す。拡張エラー情報を取得するには GetLastError を呼び出す。

[備考]
HttpAddRequestHeaders は HTTP リクエストハンドルに追加の自由形式ヘッダーを追加するもので、HTTP
サーバーに送信される正確なリクエストを細かく制御する必要がある高度なクライアントによる使用を想定している。なお基本的な
HttpAddRequestHeaders
では、アプリケーションは複数のヘッダーを単一のバッファで渡すことができる。アプリケーションがヘッダーの削除または置換を試みる場合、lpszHeaders
に指定できるヘッダーは 1 つだけである。注意: HttpAddRequestHeadersA 関数はヘッダーを ANSI 文字ではなく
ISO-8859-1 文字として表現する。HttpAddRequestHeadersW 関数はヘッダーを ISO-8859-1 文字を
UTF-16LE 文字に変換したものとして表現する。その結果、追加するヘッダーに非 ASCII
文字を含む可能性がある場合、HttpAddRequestHeadersW 関数を使用するのは決して安全ではない。代わりにアプリケーションは
MultiByteToWideChar および WideCharToMultiByte 関数で Codepage パラメータに 28591
を指定し、ANSI 文字と UTF-16LE 文字の間でマッピングできる。WinINet API の他のすべての側面と同様に、本関数は
DllMain やグローバルオブジェクトのコンストラクタ・デストラクタの中から安全に呼び出すことはできない。注意: WinINet
はサーバー実装をサポートしていない。さらに、サービスから使用すべきでもない。サーバー実装やサービスでは Microsoft Windows
HTTP Services (WinHTTP) を使用すること。
> [!NOTE] > wininet.h ヘッダーは HttpAddRequestHeaders
をエイリアスとして定義しており、UNICODE プリプロセッサ定数の定義に基づいて本関数の ANSI 版または Unicode
版を自動的に選択する。エンコーディング中立のエイリアスとエンコーディング中立でないコードを混在させると、コンパイルエラーや実行時エラーの原因となるミスマッチが発生する可能性がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照のこと。


%index
HttpCheckDavComplianceW
(no summary)
%prm
lpszUrl, lpszComplianceToken, lpfFound, hWnd, lpvReserved
lpszUrl : [wstr] 
lpszComplianceToken : [wstr] 
lpfFound : [var] 
hWnd : [intptr] 
lpvReserved : [intptr] 
%inst



%index
HttpCloseDependencyHandle
(no summary)
%prm
hDependencyHandle
hDependencyHandle : [intptr] 
%inst



%index
HttpDuplicateDependencyHandle
(no summary)
%prm
hDependencyHandle, phDuplicatedDependencyHandle
hDependencyHandle : [intptr] 
phDuplicatedDependencyHandle : [var] 
%inst



%index
HttpEndRequestW
HttpSendRequestEx によって開始された HTTP リクエストを終了する。(Unicode)
%prm
hRequest, lpBuffersOut, dwFlags, dwContext
hRequest : [intptr] HttpOpenRequest によって返され、HttpSendRequestEx で送信されたハンドル。
lpBuffersOut : [var] 本パラメータは予約されており、NULL を指定しなければならない。
dwFlags : [int] 本パラメータは予約されており、0 を指定しなければならない。
dwContext : [int] 本パラメータは予約されており、0 を指定しなければならない。
%inst
HttpSendRequestEx によって開始された HTTP リクエストを終了する。(Unicode)

[戻り値]
関数が成功した場合、戻り値は TRUE である。
関数が失敗した場合、戻り値は FALSE である。拡張エラー情報を取得するには GetLastError を呼び出す。

[備考]
lpBuffersOut が NULL に設定されていない場合、HttpEndRequest は
ERROR_INVALID_PARAMETER を返す。
WinINet API の他のすべての側面と同様に、本関数は DllMain
やグローバルオブジェクトのコンストラクタ・デストラクタの中から安全に呼び出すことはできない。注意: WinINet
はサーバー実装をサポートしていない。さらに、サービスから使用すべきでもない。サーバー実装やサービスでは Microsoft Windows
HTTP Services (WinHTTP) を使用すること。
> [!NOTE] > wininet.h ヘッダーは HttpEndRequest をエイリアスとして定義しており、UNICODE
プリプロセッサ定数の定義に基づいて本関数の ANSI 版または Unicode
版を自動的に選択する。エンコーディング中立のエイリアスとエンコーディング中立でないコードを混在させると、コンパイルエラーや実行時エラーの原因となるミスマッチが発生する可能性がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照のこと。


%index
HttpGetServerCredentials
(no summary)
%prm
pwszUrl, ppwszUserName, ppwszPassword
pwszUrl : [wstr] 
ppwszUserName : [var] 
ppwszPassword : [var] 
%inst



%index
HttpIndicatePageLoadComplete
(no summary)
%prm
hDependencyHandle
hDependencyHandle : [intptr] 
%inst



%index
HttpIsHostHstsEnabled
(no summary)
%prm
pcwszUrl, pfIsHsts
pcwszUrl : [wstr] 
pfIsHsts : [var] 
%inst



%index
HttpOpenDependencyHandle
(no summary)
%prm
hRequestHandle, fBackground, phDependencyHandle
hRequestHandle : [intptr] 
fBackground : [int] 
phDependencyHandle : [var] 
%inst



%index
HttpOpenRequestW
HTTP リクエストハンドルを作成する。(Unicode)
%prm
hConnect, lpszVerb, lpszObjectName, lpszVersion, lpszReferrer, lplpszAcceptTypes, dwFlags, dwContext
hConnect : [intptr] InternetConnect が返した HTTP セッションへのハンドル。
lpszVerb : [wstr] リクエストで使用する HTTP verb を含む NULL 終端文字列へのポインタ。NULL なら GET を使用。
lpszObjectName : [wstr] 指定 HTTP verb のターゲットオブジェクト名を含む NULL 終端文字列へのポインタ。通常はファイル名、実行モジュール、検索指定子。
lpszVersion : [wstr] 使用する HTTP バージョンを含む NULL 終端文字列へのポインタ。IE 設定によって上書きされる。NULL の場合、IE 設定に応じて HTTP/1.1 または 1.0 を使用する。
lpszReferrer : [wstr] lpszObjectName の URL の元ドキュメント URL を指定する NULL 終端文字列へのポインタ。NULL なら referer は指定されない。
lplpszAcceptTypes : [var] クライアントが受け入れるメディアタイプを示す NULL 終端文字列配列へのポインタ。例: PCTSTR rgpszAcceptTypes[] = {_T("text/*"), NULL}; 配列を NULL ポインタで正しく終端しないとクラッシュする。NULL なら何も受け入れない。
dwFlags : [int] 
dwContext : [int] この操作とアプリケーションデータを関連付けるアプリケーション定義値を保持する変数へのポインタ。
%inst
HTTP リクエストハンドルを作成する。(Unicode)

[戻り値]
成功時は HTTP リクエストハンドル、失敗時は NULL を返す。拡張エラー情報は GetLastError で取得する。

[備考]
HttpOpenRequest は新しい HTTP リクエストハンドルを作成し指定パラメータを格納する。リクエストハンドルは HTTP
サーバーに送信するリクエストと関連ヘッダを保持する。"GET" や "POST" 以外の verb を指定した場合は
INTERNET_FLAG_NO_CACHE_WRITE と INTERNET_FLAG_RELOAD が自動設定される。IE5
以降、lpszVerb が "HEAD" の場合、HTTP/1.1 サーバーからの応答の Content-Length
ヘッダは無視される。Windows 7/Windows Server 2008 R2 以降は lpszVersion が Internet
Explorer 設定で上書きされる。使用後は InternetCloseHandle で閉じること。WinINet
はサービスやサーバー実装で使用すべきでない。サーバー用途では WinHTTP を使用すること。
> [!NOTE] > wininet.h は UNICODE マクロに応じて HttpOpenRequest を
ANSI/Unicode 版のエイリアスとして定義する。


%index
HttpPushClose
(no summary)
%prm
hWait
hWait : [intptr] 
%inst



%index
HttpPushEnable
(no summary)
%prm
hRequest, pTransportSetting, phWait
hRequest : [intptr] 
pTransportSetting : [var] 
phWait : [intptr] 
%inst



%index
HttpPushWait
(no summary)
%prm
hWait, eType, pNotificationStatus
hWait : [intptr] 
eType : [int] 
pNotificationStatus : [var] 
%inst



%index
HttpQueryInfoW
HTTP リクエストに関連するヘッダ情報を取得する。(Unicode)
%prm
hRequest, dwInfoLevel, lpBuffer, lpdwBufferLength, lpdwIndex
hRequest : [intptr] HttpOpenRequest または InternetOpenUrl が返したハンドル。
dwInfoLevel : [int] 取得する属性とリクエストを変更するフラグの組み合わせ。可能な値は Query Info Flags を参照。
lpBuffer : [intptr] 要求情報を受け取るバッファへのポインタ。NULL は不可。
lpdwBufferLength : [var] lpvBuffer のバイト数を保持する変数へのポインタ。成功時は書き込まれた情報のバイト数を受け取る。ERROR_INSUFFICIENT_BUFFER で失敗した場合は必要なバッファサイズを受け取る。
lpdwIndex : [var] 同名の複数ヘッダを列挙するための 0 始まりのヘッダインデックス。呼び出し時は返したいヘッダのインデックス、復帰時は次のインデックス。見つからない場合は ERROR_HTTP_HEADER_NOT_FOUND を返す。
%inst
HTTP リクエストに関連するヘッダ情報を取得する。(Unicode)

[戻り値]
成功時は TRUE、失敗時は FALSE。拡張エラー情報は GetLastError で取得する。

[備考]
次の種類のデータを取得できる。
（以下省略）


%index
HttpSendRequestW
指定のリクエストを HTTP サーバーに送信する。(Unicode) HttpSendRequestEx より多くのデータを送信できる。
%prm
hRequest, lpszHeaders, dwHeadersLength, lpOptional, dwOptionalLength
hRequest : [intptr] HttpOpenRequest が返したハンドル。
lpszHeaders : [wstr] リクエストに追加するヘッダを含む NULL 終端文字列へのポインタ。追加ヘッダがなければ NULL 可。
dwHeadersLength : [int] 追加ヘッダのサイズ(TCHAR 単位)。-1L で lpszHeaders が NULL でない場合、NULL 終端とみなして計算する(ANSI 版のみ)。
lpOptional : [intptr] リクエストヘッダ直後に送信するオプションデータを含むバッファへのポインタ。通常 POST/PUT で使用する。送らない場合は NULL 可。
dwOptionalLength : [int] オプションデータのサイズ(バイト単位)。送らない場合は 0 可。
%inst
指定のリクエストを HTTP サーバーに送信する。(Unicode) HttpSendRequestEx より多くのデータを送信できる。

[戻り値]
成功時は TRUE、失敗時は FALSE。拡張エラー情報は GetLastError で取得する。

[備考]
リクエスト送信後、HTTP
サーバーからのステータスコードと応答ヘッダを読み取る。これらのヘッダは内部に保持され、HttpQueryInfo
でクライアントから取得できる。オフラインモードでは、リソースがキャッシュになければ ERROR_FILE_NOT_FOUND
を返す。HttpSendRequestA と HttpSendRequestW の 2 種類があり、dwHeadersLength が
-1L で lpszHeaders が NULL でない場合の動作が異なる(W 版では
ERROR_INVALID_PARAMETER)。HttpSendRequestW は ISO-8859-1 を UTF-16LE
に変換したものとしてヘッダを扱うため、非 ASCII 文字を含むヘッダには安全に使えない。WinINet
はサービスやサーバー実装から使用すべきでない。


%index
HttpSendRequestExW
指定されたリクエストを HTTP サーバーに送信する。(HttpSendRequestExW)
%prm
hRequest, lpBuffersIn, lpBuffersOut, dwFlags, dwContext
hRequest : [intptr] HttpOpenRequest 関数の呼び出しから返されたハンドル。
lpBuffersIn : [var] 省略可能。INTERNET_BUFFERS 構造体へのポインタ。
lpBuffersOut : [var] 予約済み。NULL を指定しなければならない。
dwFlags : [int] 予約済み。0 を指定しなければならない。
dwContext : [int] ステータスコールバック関数が登録されている場合に使用される、アプリケーション定義のコンテキスト値。
%inst
指定されたリクエストを HTTP サーバーに送信する。(HttpSendRequestExW)

[戻り値]
関数が成功した場合、戻り値は TRUE である。
関数が失敗した場合、戻り値は FALSE である。拡張エラー情報を取得するには GetLastError を呼び出す。

[備考]
HttpSendRequestEx はレスポンスの送信と受信の両方を実行する。これにより、アプリケーションは
HttpSendRequestEx に渡された単一バッファ以外の余分なデータを送信できない。HttpSendRequestEx
に通常渡される範囲を超えて余分なデータを送信する必要がある呼び出し側は、代わりに HttpSendRequest
を呼び出すことができる。HttpSendRequestEx の呼び出し後、InternetWriteFile
を呼び出して残りのデータを送信する。最後に HttpEndRequest の呼び出しで処理を完了する。注意:
HttpSendRequestExA 関数は送信するデータを ANSI 文字ではなく ISO-8859-1
文字として表現する。HttpSendRequestExW 関数は送信するデータを ISO-8859-1 文字を UTF-16LE
文字に変換したものとして表現する。その結果、追加するヘッダーに非 ASCII
文字を含む可能性がある場合、HttpSendRequestExW 関数を使用するのは決して安全ではない。代わりにアプリケーションは
MultiByteToWideChar および WideCharToMultiByte 関数で Codepage パラメータに 28591
を指定し、ANSI 文字と UTF-16LE 文字の間でマッピングできる。注意: WinINet
はサーバー実装をサポートしていない。さらに、サービスから使用すべきでもない。サーバー実装やサービスでは Microsoft Windows
HTTP Services (WinHTTP) を使用すること。
> [!NOTE] > wininet.h ヘッダーは HttpSendRequestEx をエイリアスとして定義しており、UNICODE
プリプロセッサ定数の定義に基づいて本関数の ANSI 版または Unicode
版を自動的に選択する。エンコーディング中立のエイリアスとエンコーディング中立でないコードを混在させると、コンパイルエラーや実行時エラーの原因となるミスマッチが発生する可能性がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照のこと。


%index
HttpWebSocketClose
(no summary)
%prm
hWebSocket, usStatus, pvReason, dwReasonLength
hWebSocket : [intptr] 
usStatus : [int] 
pvReason : [intptr] 
dwReasonLength : [int] 
%inst



%index
HttpWebSocketCompleteUpgrade
(no summary)
%prm
hRequest, dwContext
hRequest : [intptr] 
dwContext : [int] 
%inst



%index
HttpWebSocketQueryCloseStatus
(no summary)
%prm
hWebSocket, pusStatus, pvReason, dwReasonLength, pdwReasonLengthConsumed
hWebSocket : [intptr] 
pusStatus : [var] 
pvReason : [intptr] 
dwReasonLength : [int] 
pdwReasonLengthConsumed : [var] 
%inst



%index
HttpWebSocketReceive
(no summary)
%prm
hWebSocket, pvBuffer, dwBufferLength, pdwBytesRead, pBufferType
hWebSocket : [intptr] 
pvBuffer : [intptr] 
dwBufferLength : [int] 
pdwBytesRead : [var] 
pBufferType : [var] 
%inst



%index
HttpWebSocketSend
(no summary)
%prm
hWebSocket, BufferType, pvBuffer, dwBufferLength
hWebSocket : [intptr] 
BufferType : [int] 
pvBuffer : [intptr] 
dwBufferLength : [int] 
%inst



%index
HttpWebSocketShutdown
(no summary)
%prm
hWebSocket, usStatus, pvReason, dwReasonLength
hWebSocket : [intptr] 
usStatus : [int] 
pvReason : [intptr] 
dwReasonLength : [int] 
%inst



%index
IncrementUrlCacheHeaderData
(no summary)
%prm
nIdx, lpdwData
nIdx : [int] 
lpdwData : [var] 
%inst



%index
InternetAlgIdToStringW
(no summary)
%prm
ai, lpstr, lpdwstrLength, dwReserved
ai : [int] 
lpstr : [wstr] 
lpdwstrLength : [var] 
dwReserved : [int] 
%inst



%index
InternetAttemptConnect
インターネットへの接続を試みる。
%prm
dwReserved
dwReserved : [int] 本パラメータは予約されており、0 を指定しなければならない。
%inst
インターネットへの接続を試みる。

[戻り値]
成功した場合は ERROR_SUCCESS を、失敗した場合はシステムエラーコードを返す。

[備考]

本関数を使用すると、アプリケーションはリクエストを発行する前にまず接続を試みることができる。クライアントプログラムはこれを利用してダイアルアップダイアログを表示できる。試行が失敗した場合、アプリケーションはオフラインモードに入るべきである。WinINet
API の他のすべての側面と同様に、本関数は DllMain
やグローバルオブジェクトのコンストラクタ・デストラクタの中から安全に呼び出すことはできない。注意: WinINet
はサーバー実装をサポートしていない。さらに、サービスから使用すべきでもない。サーバー実装やサービスでは Microsoft Windows
HTTP Services (WinHTTP) を使用すること。


%index
InternetAutodial
InternetAutodial 関数 (wininet.h) はモデムに既定のインターネット接続を自動でダイアルさせる。
%prm
dwFlags, hwndParent
dwFlags : [int] 
hwndParent : [intptr] 親ウィンドウへのハンドル。
%inst
InternetAutodial 関数 (wininet.h) はモデムに既定のインターネット接続を自動でダイアルさせる。

[戻り値]
関数が成功した場合、戻り値は TRUE である。
関数が失敗した場合、戻り値は FALSE である。アプリケーションは GetLastError を呼び出してエラーコードを取得できる。

[備考]
InternetAutodial はダブルダイアル接続、SmartCard
認証、レジストリベースの証明書を必要とする接続をサポートしていない。注意: Windows Vista および Windows
Server 2008 以降、WinINet のダイアルアップ関数はダイアルアップ接続を確立するために RAS
関数を使用する。WinINet は RasDialDlg
関数で文書化されている機能をサポートしている。システム上に既存のダイアルアップ接続がある場合、InternetAutodial
はダイアルを試みない。また、既存の LAN 接続があり、InternetAutodial が強制ダイアル (dwFlags パラメータに
INTERNET_AUTODIAL_FORCE_ONLINE を設定) するように構成されていない場合、InternetAutodial
は接続のダイアルを試みず TRUE を返す。WinINet API の他のすべての側面と同様に、本関数は DllMain
やグローバルオブジェクトのコンストラクタ・デストラクタの中から安全に呼び出すことはできない。注意: WinINet
はサーバー実装をサポートしていない。さらに、サービスから使用すべきでもない。サーバー実装やサービスでは Microsoft Windows
HTTP Services (WinHTTP) を使用すること。


%index
InternetAutodialHangup
InternetAutodialHangup 関数 (wininet.h) は自動ダイアルアップ接続を切断する。
%prm
dwReserved
dwReserved : [int] 本パラメータは予約されており、0 を指定しなければならない。
%inst
InternetAutodialHangup 関数 (wininet.h) は自動ダイアルアップ接続を切断する。

[戻り値]
関数が成功した場合、戻り値は TRUE である。
関数が失敗した場合、戻り値は FALSE である。アプリケーションは GetLastError を呼び出してエラーコードを取得できる。

[備考]
InternetAutoDialHangup
は、自動ダイアルが有効でない場合、または自動ダイアルが有効でも構成済みのエントリがコンピュータにない場合、TRUE を返す。WinINet
API の他のすべての側面と同様に、本関数は DllMain
やグローバルオブジェクトのコンストラクタ・デストラクタの中から安全に呼び出すことはできない。注意: WinINet
はサーバー実装をサポートしていない。さらに、サービスから使用すべきでもない。サーバー実装やサービスでは Microsoft Windows
HTTP Services (WinHTTP) を使用すること。


%index
InternetCanonicalizeUrlW
URL を正規化する。安全でない文字や空白をエスケープシーケンスに変換する処理を含む。(Unicode)
%prm
lpszUrl, lpszBuffer, lpdwBufferLength, dwFlags
lpszUrl : [wstr] 正規化する URL を格納した文字列へのポインタ。
lpszBuffer : [wstr] 正規化された URL を受け取るバッファへのポインタ。
lpdwBufferLength : [var] lpszBuffer バッファのサイズ (文字単位) を格納する変数へのポインタ。関数が成功した場合、本パラメータには lpszBuffer バッファに実際にコピーされた文字数 (終端 null 文字を除く) が格納される。関数が失敗した場合、本パラメータには必要なバッファサイズ (文字単位、終端 null 文字を含む) が格納される。
dwFlags : [int] 正規化を制御する。フラグが指定されない場合、関数はすべての安全でない文字とメタシーケンス (\.、\..、\... など) をエスケープシーケンスに変換する。
%inst
URL を正規化する。安全でない文字や空白をエスケープシーケンスに変換する処理を含む。(Unicode)

[戻り値]
成功した場合は TRUE を、失敗した場合は FALSE を返す。拡張エラー情報を取得するには GetLastError
関数を呼び出す。想定されるエラーには次のものがある。
（以下省略）

[備考]
Internet Explorer 4.0 以降では、InternetCanonicalizeUrl は常に
ICU_BROWSER_MODE フラグが設定されているかのように動作する。URL
全体を正規化する必要があるクライアントアプリケーションは、CoInternetParseUrl (アクション
PARSE_CANONICALIZE およびフラグ URL_ESCAPE_UNSAFE を指定) または UrlCanonicalize
のいずれかを使用すべきである。InternetCanonicalizeUrl は、ICU_DECODE
フラグが指定されていても、既定で常にエンコードを行う。再エンコードせずにデコードするには、ICU_DECODE |
ICU_NO_ENCODE を使用すること。ICU_NO_ENCODE なしで ICU_DECODE フラグを使用すると、URL
は解析前にデコードされ、安全でない文字は解析後に再エンコードされる。本関数は任意のプロトコルスキームを処理できるが、そのためには安全でない文字集合から推論を行わなければならない。Internet
Explorer 3.0 を使用する際 (または Internet Explorer 5 以降で ICU_ENCODE_PERCENT
フラグを設定する際) に InternetCanonicalizeUrl を呼び出すアプリケーションは、特定の URL
に対する本関数の使用状況を追跡すべきである。URL 内の安全でない文字がエスケープシーケンスに変換されている場合、その URL
に対して再度 (フラグなしで) InternetCanonicalizeUrl
を使用すると、エスケープシーケンスが別のエスケープシーケンスに変換される。例えば、URL 内の空白はエスケープシーケンス %20
に変換される。その URL に対して再度 InternetCanonicalizeUrl を呼び出すと、%
記号がエスケープシーケンス用に予約された安全でない文字であり関数によって %25 に置き換えられるため、エスケープシーケンス %20
がエスケープシーケンス %2520 に変換される。WinINet API の他のすべての側面と同様に、本関数は DllMain
やグローバルオブジェクトのコンストラクタ・デストラクタの中から安全に呼び出すことはできない。注意: WinINet
はサーバー実装をサポートしていない。さらに、サービスから使用すべきでもない。サーバー実装やサービスでは Microsoft Windows
HTTP Services (WinHTTP) を使用すること。
> [!NOTE] > wininet.h ヘッダーは InternetCanonicalizeUrl
をエイリアスとして定義しており、UNICODE プリプロセッサ定数の定義に基づいて本関数の ANSI 版または Unicode
版を自動的に選択する。エンコーディング中立のエイリアスとエンコーディング中立でないコードを混在させると、コンパイルエラーや実行時エラーの原因となるミスマッチが発生する可能性がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照のこと。


%index
InternetCheckConnectionW
アプリケーションがインターネットへの接続を確立できるかどうかをチェックできるようにする。(Unicode)
%prm
lpszUrl, dwFlags, dwReserved
lpszUrl : [wstr] 接続をチェックするために使用する URL を指定する null 終端文字列へのポインタ。本値には NULL を指定できる。
dwFlags : [int] オプション。現在使用可能なフラグは FLAG_ICC_FORCE_CONNECTION のみである。このフラグが設定されると、接続が強制される。ソケット接続は次の順序で試みられる。
dwReserved : [int] 本パラメータは予約されており、0 を指定しなければならない。
%inst
アプリケーションがインターネットへの接続を確立できるかどうかをチェックできるようにする。(Unicode)

[戻り値]
接続が成功した場合は TRUE を、そうでない場合は FALSE を返す。エラーコードを取得するには GetLastError
を使用する。接続できない場合、またはソケットデータベースが無条件にオフラインである場合、GetLastError は
ERROR_NOT_CONNECTED を返す。

[備考]
InternetCheckConnection は非推奨である。InternetCheckConnection
はインターネットへのアクセスに Web プロキシサーバーを使用する環境では機能しない。環境に応じて、代わりに
NetworkInformation.GetInternetConnectionProfile または NLM
インターフェイスを使用してインターネットアクセスをチェックすべきである。注意: WinINet
はサーバー実装をサポートしていない。さらに、サービスから使用すべきでもない。サーバー実装やサービスでは Microsoft Windows
HTTP Services (WinHTTP) を使用すること。
> [!NOTE] > wininet.h ヘッダーは InternetCheckConnection
をエイリアスとして定義しており、UNICODE プリプロセッサ定数の定義に基づいて本関数の ANSI 版または Unicode
版を自動的に選択する。エンコーディング中立のエイリアスとエンコーディング中立でないコードを混在させると、コンパイルエラーや実行時エラーの原因となるミスマッチが発生する可能性がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照のこと。


%index
InternetClearAllPerSiteCookieDecisions
サイトごとに行われたクッキーに関するすべての判断をクリアする。
%prm

%inst
サイトごとに行われたクッキーに関するすべての判断をクリアする。

[戻り値]
すべての判断がクリアされた場合は TRUE を、そうでない場合は FALSE を返す。

[備考]
注意: WinINet はサーバー実装をサポートしていない。さらに、サービスから使用すべきでもない。サーバー実装やサービスでは
Microsoft Windows HTTP Services (WinHTTP) を使用すること。


%index
InternetCloseHandle
単一のインターネットハンドルを閉じる。
%prm
hInternet
hInternet : [intptr] 閉じるハンドル。
%inst
単一のインターネットハンドルを閉じる。

[戻り値]
成功時は TRUE、失敗時は FALSE。拡張エラー情報は GetLastError で取得する。

[備考]
ハンドルの保留中の操作を終了し未処理データを破棄する。API 呼び出し中でなければ安全に呼べる。API が
ERROR_IO_PENDING を返した後、それ以降に API 呼び出しを行わない限り安全に I/O
をキャンセルできる。閉じるハンドルのコールバック内から呼んでも安全。閉じるハンドルに状態コールバックが登録されていて非 NULL
コンテキストが設定されている場合、INTERNET_STATUS_HANDLE_CLOSING
コールバックが呼ばれる。非同期リクエストが保留中の場合、ハンドルは即座に閉じられないが無効化される。WinINet
はサービスやサーバー実装から使用すべきでない。


%index
InternetCombineUrlW
ベース URL と相対 URL を 1 つの URL に結合する。結合された URL は正規化される (InternetCanonicalizeUrl を参照)。(Unicode)
%prm
lpszBaseUrl, lpszRelativeUrl, lpszBuffer, lpdwBufferLength, dwFlags
lpszBaseUrl : [wstr] ベース URL を格納した null 終端文字列へのポインタ。
lpszRelativeUrl : [wstr] 相対 URL を格納した null 終端文字列へのポインタ。
lpszBuffer : [wstr] 結合後の URL を受け取るバッファへのポインタ。
lpdwBufferLength : [var] lpszBuffer バッファのサイズ (文字単位) を格納する変数へのポインタ。関数が成功した場合、本パラメータには結合後の URL のサイズ (文字単位、終端 null 文字を含まない) が格納される。関数が失敗した場合、本パラメータには必要なバッファのサイズ (文字単位、終端 null 文字を含む) が格納される。
dwFlags : [int] 
%inst
ベース URL と相対 URL を 1 つの URL に結合する。結合された URL は正規化される
(InternetCanonicalizeUrl を参照)。(Unicode)

[戻り値]
成功した場合は TRUE を、失敗した場合は FALSE を返す。拡張エラー情報を取得するには GetLastError
を呼び出す。想定されるエラーには次のものがある。
（以下省略）

[備考]
注意: WinINet はサーバー実装をサポートしていない。さらに、サービスから使用すべきでもない。サーバー実装やサービスでは
Microsoft Windows HTTP Services (WinHTTP) を使用すること。
> [!NOTE] > wininet.h ヘッダーは InternetCombineUrl
をエイリアスとして定義しており、UNICODE プリプロセッサ定数の定義に基づいて本関数の ANSI 版または Unicode
版を自動的に選択する。エンコーディング中立のエイリアスとエンコーディング中立でないコードを混在させると、コンパイルエラーや実行時エラーの原因となるミスマッチが発生する可能性がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照のこと。


%index
InternetConfirmZoneCrossing
InternetConfirmZoneCrossing 関数 (wininet.h) はセキュア URL と非セキュア URL の間の変更をチェックする。
%prm
hWnd, szUrlPrev, szUrlNew, bPost
hWnd : [intptr] 必要となるダイアログの親ウィンドウへのハンドル。
szUrlPrev : [str] 現在の要求が行われる前に表示されていた URL を指定する null 終端文字列へのポインタ。
szUrlNew : [str] ユーザーが表示を要求した新しい URL を指定する null 終端文字列へのポインタ。
bPost : [int] 実装されていない。
%inst
InternetConfirmZoneCrossing 関数 (wininet.h) はセキュア URL と非セキュア URL
の間の変更をチェックする。

[戻り値]
次のいずれかの値を返す。
（以下省略）

[備考]

セキュリティレベルの変更が発生した場合は常にユーザーに通知すること。さもなければ、ユーザーを意図しない情報開示にさらすおそれがある。WinINet
API の他のすべての側面と同様に、本関数は DllMain
やグローバルオブジェクトのコンストラクタ・デストラクタの中から安全に呼び出すことはできない。注意: WinINet
はサーバー実装をサポートしていない。さらに、サービスから使用すべきでもない。サーバー実装やサービスでは Microsoft Windows
HTTP Services (WinHTTP) を使用すること。


%index
InternetConnectW
指定サイトに対する FTP または HTTP セッションを開く。(Unicode)
%prm
hInternet, lpszServerName, nServerPort, lpszUserName, lpszPassword, dwService, dwFlags, dwContext
hInternet : [intptr] InternetOpen の呼び出しが返したハンドル。
lpszServerName : [wstr] インターネットサーバーのホスト名を指定する NULL 終端文字列へのポインタ。ASCII ドット区切り IP アドレスでも可。
nServerPort : [int] サーバーの TCP/IP ポート。ポートのみ設定し、サービスは dwService で設定する。
lpszUserName : [wstr] ログインするユーザー名を指定する NULL 終端文字列へのポインタ。NULL の場合、適切な既定値が使用される。FTP では既定は "anonymous"。
lpszPassword : [wstr] ログインに使うパスワードを含む NULL 終端文字列へのポインタ。lpszPassword と lpszUsername が両方 NULL の場合、既定の "anonymous" パスワードが使われる。FTP では既定パスワードはユーザーのメール名。lpszUsername のみ NULL でない場合は空パスワードが使われる。
dwService : [int] 
dwFlags : [int] サービス固有のオプション。dwService が INTERNET_SERVICE_FTP の場合、INTERNET_FLAG_PASSIVE でパッシブ FTP セマンティクスを使用する。
dwContext : [int] 返されたハンドルのコールバックで、アプリケーションコンテキストを識別するためのアプリケーション定義値を含む変数へのポインタ。
%inst
指定サイトに対する FTP または HTTP セッションを開く。(Unicode)

[戻り値]
接続成功時はセッションへの有効なハンドル、それ以外は NULL を返す。拡張エラー情報は GetLastError
で取得する。InternetGetLastResponseInfo でサービスアクセス拒否の原因も取得できる。

[備考]
lpszUsername と lpszPassword の 4 つの組み合わせに対する動作は以下の表の通り。
（以下省略）


%index
InternetConvertUrlFromWireToWideChar
(no summary)
%prm
pcszUrl, cchUrl, pcwszBaseUrl, dwCodePageHost, dwCodePagePath, fEncodePathExtra, dwCodePageExtra, ppwszConvertedUrl
pcszUrl : [str] 
cchUrl : [int] 
pcwszBaseUrl : [wstr] 
dwCodePageHost : [int] 
dwCodePagePath : [int] 
fEncodePathExtra : [int] 
dwCodePageExtra : [int] 
ppwszConvertedUrl : [var] 
%inst



%index
InternetCrackUrlW
URL を構成要素に分解する。(Unicode)
%prm
lpszUrl, dwUrlLength, dwFlags, lpUrlComponents
lpszUrl : [wstr] 解析する正規化された URL を格納した文字列へのポインタ。
dwUrlLength : [int] lpszUrl 文字列のサイズ (TCHAR 単位)。lpszUrl が ASCIIZ 文字列の場合は 0。
dwFlags : [int] 
lpUrlComponents : [var] URL コンポーネントを受け取る URL_COMPONENTS 構造体へのポインタ。
%inst
URL を構成要素に分解する。(Unicode)

[戻り値]
関数が成功した場合は TRUE を、失敗した場合は FALSE を返す。拡張エラー情報を取得するには GetLastError
を呼び出す。

[備考]
必要なコンポーネントは URL_COMPONENTS
構造体のメンバで指定する。各コンポーネントは値へのポインタと、格納された値の長さを保持するメンバを持つ。コンポーネントの値と長さの両方が
0 の場合、そのコンポーネントは返されない。Windows Vista 以降: コンポーネントの値へのポインタが NULL
で、対応する長さメンバの値が 0 でない場合、lpszUrl
文字列内の対応するコンポーネントの先頭文字のアドレスがポインタに格納され、コンポーネントの長さが長さメンバに格納される。

ポインタにユーザー指定のバッファのアドレスが格納されている場合、長さメンバにはバッファのサイズが格納されていなければならない。InternetCrackUrl
はコンポーネントをバッファにコピーし、長さメンバはコピーされたコンポーネントの長さから末尾の文字列終端用の 1
を引いた値に設定される。InternetCrackUrl が正しく動作するためには、URL_COMPONENTS 構造体のサイズ
(バイト単位) を dwStructSize メンバに格納しなければならない。注意: 空白を含む "file://" URL に対しては
InternetCrackUrl を使用しないこと。lpUrlComponents が指す URL_COMPONENTS 構造体の
dwUrlPathLength メンバに返される値が大きすぎるためである。ただしこれは空白文字を含む "file://" URL
の場合のみである。WinINet API の他のすべての側面と同様に、本関数は DllMain
やグローバルオブジェクトのコンストラクタ・デストラクタの中から安全に呼び出すことはできない。注意: WinINet
はサーバー実装をサポートしていない。さらに、サービスから使用すべきでもない。サーバー実装やサービスでは Microsoft Windows
HTTP Services (WinHTTP) を使用すること。
> [!NOTE] > wininet.h ヘッダーは InternetCrackUrl をエイリアスとして定義しており、UNICODE
プリプロセッサ定数の定義に基づいて本関数の ANSI 版または Unicode
版を自動的に選択する。エンコーディング中立のエイリアスとエンコーディング中立でないコードを混在させると、コンパイルエラーや実行時エラーの原因となるミスマッチが発生する可能性がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照のこと。


%index
InternetCreateUrlW
構成要素から URL を作成する。(Unicode)
%prm
lpUrlComponents, dwFlags, lpszUrl, lpdwUrlLength
lpUrlComponents : [var] URL を作成するための構成要素を格納した URL_COMPONENTS 構造体へのポインタ。
dwFlags : [int] 
lpszUrl : [wstr] URL を受け取るバッファへのポインタ。
lpdwUrlLength : [var] URL lpszUrl バッファのサイズ (TCHAR 単位) を指定する変数へのポインタ。関数が戻ると、本パラメータには URL 文字列のサイズ (NULL 終端を除く) が格納される。GetLastError が ERROR_INSUFFICIENT_BUFFER を返した場合、本パラメータには作成された URL を保持するために必要なバイト数が格納される。
%inst
構成要素から URL を作成する。(Unicode)

[戻り値]
関数が成功した場合は TRUE を、失敗した場合は FALSE を返す。拡張エラー情報を取得するには GetLastError
を呼び出す。

[備考]
lpUrlComponents に渡す URL_COMPONENTS 構造体でスキームを指定する場合、lpszScheme が NULL
でなければそれがスキームとして使用される。lpszScheme が NULL の場合、nScheme に必要な
INTERNET_SCHEME 値または INTERNET_SCHEME_DEFAULT を設定することで、INTERNET_SCHEME
列挙を使用してスキームを指定できる。注意: WinINet
はサーバー実装をサポートしていない。さらに、サービスから使用すべきでもない。サーバー実装やサービスでは Microsoft Windows
HTTP Services (WinHTTP) を使用すること。
> [!NOTE] > wininet.h ヘッダーは InternetCreateUrl をエイリアスとして定義しており、UNICODE
プリプロセッサ定数の定義に基づいて本関数の ANSI 版または Unicode
版を自動的に選択する。エンコーディング中立のエイリアスとエンコーディング中立でないコードを混在させると、コンパイルエラーや実行時エラーの原因となるミスマッチが発生する可能性がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照のこと。


%index
InternetDial
InternetDial 関数 (wininet.h) はモデムを使用してインターネットへの接続を開始する。
%prm
hwndParent, lpszConnectoid, dwFlags, lpdwConnection, dwReserved
hwndParent : [intptr] 親ウィンドウへのハンドル。
lpszConnectoid : [str] 使用するダイアルアップ接続の名前を指定する null 終端文字列へのポインタ。本パラメータに空文字列 ("") を指定した場合、ユーザーが接続を選択する。本パラメータが NULL の場合、関数は自動ダイアル接続に接続する。
dwFlags : [int] 
lpdwConnection : [var] 接続番号を指定する変数へのポインタ。この番号は接続の一意な識別子であり、InternetHangUp など他の関数で使用できる。
dwReserved : [int] 本パラメータは予約されており、NULL を指定しなければならない。
%inst
InternetDial 関数 (wininet.h) はモデムを使用してインターネットへの接続を開始する。

[戻り値]
成功した場合は ERROR_SUCCESS を、失敗した場合はエラー値を返す。エラーコードは次のいずれかである。
（以下省略）

[備考]
InternetDial はダブルダイアル接続、SmartCard
認証、レジストリベースの証明書を必要とする接続をサポートしていない。注意: Windows Vista および Windows
Server 2008 以降、WinINet のダイアルアップ関数はダイアルアップ接続を確立するために RAS
関数を使用する。WinINet は RasDialDlg 関数で文書化されている機能をサポートしている。WinINet API
の他のすべての側面と同様に、本関数は DllMain
やグローバルオブジェクトのコンストラクタ・デストラクタの中から安全に呼び出すことはできない。注意: WinINet
はサーバー実装をサポートしていない。さらに、サービスから使用すべきでもない。サーバー実装やサービスでは Microsoft Windows
HTTP Services (WinHTTP) を使用すること。


%index
InternetEnumPerSiteCookieDecisionW
InternetEnumPerSiteCookieDecisionW (Unicode) 関数 (wininet.h) は、サイト固有のクッキー規制が設定された Web サイトのドメインとクッキー設定を取得する。
%prm
pszSiteName, pcSiteNameSize, pdwDecision, dwIndex
pszSiteName : [wstr] Web サイトドメインを指定する文字列を受け取る LPSTR。
pcSiteNameSize : [var] InternetEnumPerSiteCookieDecision 関数の呼び出し時に提供される pcSiteNameSize パラメータのサイズを指定する unsigned long へのポインタ。InternetEnumPerSiteCookieDecision が戻ると、pcSiteNameSize には pszSiteName に返されたドメイン文字列の実際の長さが格納される。
pdwDecision : [var] pszSiteName に対応する InternetCookieState 列挙値を受け取る unsigned long へのポインタ。
dwIndex : [int] 取得する Web サイトと対応するクッキー設定のインデックスを指定する unsigned long。
%inst
InternetEnumPerSiteCookieDecisionW (Unicode) 関数 (wininet.h)
は、サイト固有のクッキー規制が設定された Web サイトのドメインとクッキー設定を取得する。

[戻り値]
指定したドメインのクッキー設定を取得した場合は TRUE を、そうでない場合は FALSE を返す。

[備考]
InternetEnumPerSiteCookieDecision は最初に dwIndex を 0
にして呼び出すべきである。dwIndex パラメータをインクリメントすることで Web
サイトとクッキー設定のリストを順に辿る。InternetEnumPerSiteCookieDecision が FALSE
を返し、wininet エラー ERROR_NO_MORE_ITEMS を発生させた時点でリストの末尾に到達する。WinINet API
の他のすべての側面と同様に、本関数は DllMain
やグローバルオブジェクトのコンストラクタ・デストラクタの中から安全に呼び出すことはできない。注意: WinINet
はサーバー実装をサポートしていない。さらに、サービスから使用すべきでもない。サーバー実装やサービスでは Microsoft Windows
HTTP Services (WinHTTP) を使用すること。
> [!NOTE] > wininet.h ヘッダーは InternetEnumPerSiteCookieDecision
をエイリアスとして定義しており、UNICODE プリプロセッサ定数の定義に基づいて本関数の ANSI 版または Unicode
版を自動的に選択する。エンコーディング中立のエイリアスとエンコーディング中立でないコードを混在させると、コンパイルエラーや実行時エラーの原因となるミスマッチが発生する可能性がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照のこと。


%index
InternetErrorDlg
適切なダイアログが存在する場合、InternetErrorDlg に渡されたエラーに対するダイアログを表示する。
%prm
hWnd, hRequest, dwError, dwFlags, lppvData
hWnd : [intptr] 必要となるダイアログの親ウィンドウへのハンドル。ダイアログが不要で、dwFlags に FLAGS_ERROR_UI_FLAGS_NO_UI が渡される場合、本パラメータには NULL を指定できる。
hRequest : [intptr] HttpSendRequest の呼び出しで使用されたインターネット接続へのハンドル。
dwError : [int] 
dwFlags : [int] 
lppvData : [var] データ構造体のアドレスへのポインタ。構造体は処理が必要な各エラーごとに異なる場合がある。
%inst
適切なダイアログが存在する場合、InternetErrorDlg に渡されたエラーに対するダイアログを表示する。

[戻り値]
次のいずれかの値、またはエラー値を返す。
（以下省略）

[備考]
（以下省略）


%index
InternetFindNextFileW
FtpFindFirstFile の以前の呼び出しの結果として開始されたファイル検索を継続する。Windows XP および Windows Server 2003 R2 以前: GopherFindFirstFile の以前の呼び出しの結果としてのファイル検索の継続にも使用できる。(Unicode)
%prm
hFind, lpvFindData
hFind : [intptr] FtpFindFirstFile または InternetOpenUrl (ディレクトリのみ) から返されたハンドル。Windows XP および Windows Server 2003 R2 以前: GopherFindFirstFile から返されたハンドルも指定可能。
lpvFindData : [intptr] ファイルまたはディレクトリに関する情報を受け取るバッファへのポインタ。バッファに格納される情報の形式は使用するプロトコルに依存する。FTP プロトコルは WIN32_FIND_DATA 構造体を返す。Windows XP および Windows Server 2003 R2 以前: Gopher プロトコルは GOPHER_FIND_DATA 構造体を返す。
%inst
FtpFindFirstFile の以前の呼び出しの結果として開始されたファイル検索を継続する。Windows XP および
Windows Server 2003 R2 以前: GopherFindFirstFile
の以前の呼び出しの結果としてのファイル検索の継続にも使用できる。(Unicode)

[戻り値]
関数が成功した場合は TRUE を、失敗した場合は FALSE を返す。拡張エラー情報を取得するには GetLastError
を呼び出す。一致するファイルが見つからない場合、GetLastError は ERROR_NO_MORE_FILES を返す。

[備考]
注意: WinINet はサーバー実装をサポートしていない。さらに、サービスから使用すべきでもない。サーバー実装やサービスでは
Microsoft Windows HTTP Services (WinHTTP) を使用すること。
> [!NOTE] > wininet.h ヘッダーは InternetFindNextFile
をエイリアスとして定義しており、UNICODE プリプロセッサ定数の定義に基づいて本関数の ANSI 版または Unicode
版を自動的に選択する。エンコーディング中立のエイリアスとエンコーディング中立でないコードを混在させると、コンパイルエラーや実行時エラーの原因となるミスマッチが発生する可能性がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照のこと。


%index
InternetFortezzaCommand
(no summary)
%prm
dwCommand, hwnd, dwReserved
dwCommand : [int] 
hwnd : [intptr] 
dwReserved : [int] 
%inst



%index
InternetFreeCookies
INTERNET_COOKIE2 構造体の配列を解放する。
%prm
pCookies, dwCookieCount
pCookies : [var] [**INTERNET\_COOKIE2**](ns-wininet-internet_cookie2.md) 構造体の配列へのポインタ。
dwCookieCount : [int] 配列内の構造体の数。
%inst
INTERNET_COOKIE2 構造体の配列を解放する。

[備考]
> [!NOTE] > WinINet
はサーバー実装をサポートしていない。さらに、サービスから使用すべきでもない。サーバー実装やサービスでは [Microsoft
Windows HTTP Services
(WinHTTP)](/windows/desktop/winhttp/winhttp-start-page) を使用すること。


%index
InternetFreeProxyInfoList
(no summary)
%prm
pProxyInfoList
pProxyInfoList : [var] 
%inst



%index
InternetGetConnectedState
InternetGetConnectedState 関数 (wininet.h) はローカルシステムの接続状態を取得する。使用は推奨されない。
%prm
lpdwFlags, dwReserved
lpdwFlags : [var] 
dwReserved : [int] 本パラメータは予約されており、0 を指定しなければならない。
%inst
InternetGetConnectedState 関数 (wininet.h)
はローカルシステムの接続状態を取得する。使用は推奨されない。

[戻り値]
アクティブなモデムまたは LAN インターネット接続がある場合は TRUE
を、インターネット接続がない場合、または可能なすべてのインターネット接続が現在アクティブでない場合は FALSE
を返す。詳細は備考の節を参照のこと。InternetGetConnectedState が FALSE を返したとき、アプリケーションは
GetLastError を呼び出してエラーコードを取得できる。

[備考]
InternetGetConnectedState から TRUE が返されることは、インターネットへの接続が少なくとも 1
つ利用可能であることを示す。特定のホストへの接続を確立できることを保証するものではない。アプリケーションは常にサーバーに接続する API
呼び出しから返されるエラーをチェックすべきである。InternetCheckConnection
を呼び出して特定の宛先への接続が確立できるかどうかを判定できる。TRUE という戻り値は、モデム接続がアクティブであるか、LAN
接続がアクティブで LAN 用にプロキシが正しく構成されていることを示す。FALSE という戻り値は、モデムも LAN
も接続されていないことを示す。FALSE
が返された場合、自動ダイアルが「常にダイアル」に構成されているが現在アクティブでないことを示すために
INTERNET_CONNECTION_CONFIGURED フラグが設定される場合がある。自動ダイアルが構成されていない場合、関数は
FALSE を返す。WinINet API の他のすべての側面と同様に、本関数は DllMain
やグローバルオブジェクトのコンストラクタ・デストラクタの中から安全に呼び出すことはできない。注意: WinINet
はサーバー実装をサポートしていない。さらに、サービスから使用すべきでもない。サーバー実装やサービスでは Microsoft Windows
HTTP Services (WinHTTP) を使用すること。


%index
InternetGetConnectedStateEx
InternetGetConnectedStateEx 関数 (wininet.h) は指定したインターネット接続の接続状態を取得する。使用は推奨されない。
%prm
lpdwFlags, lpszConnectionName, dwNameLen, dwReserved
lpdwFlags : [var] 
lpszConnectionName : [str] 接続名を受け取る文字列値へのポインタ。
dwNameLen : [int] lpszConnectionName 文字列のサイズ (TCHAR 単位)。
dwReserved : [int] 本パラメータは予約されており、NULL を指定しなければならない。
%inst
InternetGetConnectedStateEx 関数 (wininet.h)
は指定したインターネット接続の接続状態を取得する。使用は推奨されない。

[戻り値]
インターネット接続がある場合は TRUE
を、インターネット接続がない場合、または可能なすべてのインターネット接続が現在アクティブでない場合は FALSE
を返す。詳細は備考の節を参照のこと。InternetGetConnectedState が FALSE を返したとき、アプリケーションは
GetLastError を呼び出してエラーコードを取得できる。

[備考]
InternetGetConnectedState から TRUE が返されることは、インターネットへの接続が少なくとも 1
つ利用可能であることを示す。特定のホストへの接続を確立できることを保証するものではない。アプリケーションは常にサーバーに接続する API
呼び出しから返されるエラーをチェックすべきである。InternetCheckConnection
を呼び出して特定の宛先への接続が確立できるかどうかを判定できる。TRUE という戻り値は、モデム接続がアクティブであるか、LAN
接続がアクティブで LAN 用にプロキシが正しく構成されていることを示す。FALSE という戻り値は、モデムも LAN
も接続されていないことを示す。FALSE
が返された場合、自動ダイアルが「常にダイアル」に構成されているが現在アクティブでないことを示すために
INTERNET_CONNECTION_CONFIGURED フラグが設定される場合がある。自動ダイアルが構成されていない場合、関数は
FALSE を返す。WinINet API の他のすべての側面と同様に、本関数は DllMain
やグローバルオブジェクトのコンストラクタ・デストラクタの中から安全に呼び出すことはできない。注意: WinINet
はサーバー実装をサポートしていない。さらに、サービスから使用すべきでもない。サーバー実装やサービスでは Microsoft Windows
HTTP Services (WinHTTP) を使用すること。


%index
InternetGetCookieW
指定した URL のクッキーを取得する。(Unicode)
%prm
lpszUrl, lpszCookieName, lpszCookieData, lpdwSize
lpszUrl : [wstr] クッキーを取得する対象の URL を指定する null 終端文字列へのポインタ。
lpszCookieName : [wstr] 実装されていない。
lpszCookieData : [wstr] クッキーデータを受け取るバッファへのポインタ。本パラメータには NULL を指定できる。
lpdwSize : [var] lpszCookieData パラメータバッファのサイズ (TCHAR 単位) を指定する変数へのポインタ。関数が成功した場合、バッファには lpszCookieData バッファにコピーされたデータ量が返される。lpszCookieData が NULL の場合、本パラメータにはすべてのクッキーデータをコピーするために必要なバッファのサイズ (バイト数) を指定する値が返される。
%inst
指定した URL のクッキーを取得する。(Unicode)

[戻り値]
関数が成功した場合、戻り値は TRUE である。
関数が失敗した場合、戻り値は FALSE である。拡張エラーデータを取得するには GetLastError
を呼び出す。InternetGetCookie には次のエラー値が適用される。
（以下省略）

[備考]
InternetGetCookie は InternetOpen の呼び出しを必要としない。InternetGetCookie は
windows\cookies
ディレクトリで、有効期限が将来に設定された永続的なクッキーをチェックする。InternetGetCookie
はメモリ内のセッションクッキー、つまり同じプロセス内で InternetSetCookie
によって作成された有効期限を持たないクッキーも検索する。これらはどのファイルにも書き込まれないためである。クッキーファイルの作成規則はシステム内部のものであり、将来変更される可能性がある。HTTP
Cookies に記載されているように、InternetGetCookie はサーバーが Set-Cookie
ヘッダーで「HttpOnly」属性によりスクリプトから利用不可とマークしたクッキーを返さない。WinINet API
の他のすべての側面と同様に、本関数は DllMain
やグローバルオブジェクトのコンストラクタ・デストラクタの中から安全に呼び出すことはできない。注意: WinINet
はサーバー実装をサポートしていない。さらに、サービスから使用すべきでもない。サーバー実装やサービスでは Microsoft Windows
HTTP Services (WinHTTP) を使用すること。
> [!NOTE] > wininet.h ヘッダーは InternetGetCookie をエイリアスとして定義しており、UNICODE
プリプロセッサ定数の定義に基づいて本関数の ANSI 版または Unicode
版を自動的に選択する。エンコーディング中立のエイリアスとエンコーディング中立でないコードを混在させると、コンパイルエラーや実行時エラーの原因となるミスマッチが発生する可能性がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照のこと。


%index
InternetGetCookieExW
指定した URL に関連付けられたクッキーに格納されているデータを取得する。(Unicode)
%prm
lpszUrl, lpszCookieName, lpszCookieData, lpdwSize, dwFlags, lpReserved
lpszUrl : [wstr] 取得するクッキーが関連付けられている URL を格納した null 終端文字列へのポインタ。本パラメータに NULL を指定することはできない。NULL を指定すると InternetGetCookieEx は失敗し、ERROR_INVALID_PARAMETER エラーを返す。
lpszCookieName : [wstr] 取得するクッキーの名前を格納した null 終端文字列へのポインタ。この名前は大文字小文字を区別する。
lpszCookieData : [wstr] クッキーデータを受け取るバッファへのポインタ。
lpdwSize : [var] DWORD 変数へのポインタ。入力時、変数には pchCookieData パラメータが指すバッファのサイズ (TCHAR 単位) を格納しなければならない。出力時、関数が成功した場合、変数にはバッファにコピーされたクッキーデータの TCHAR 数が格納される。lpszCookieData パラメータに NULL が渡された場合、または関数が ERROR_INSUFFICIENT_BUFFER エラーで失敗した場合、変数にはクッキーデータを受け取るために必要なバッファのサイズ (バイト単位) が格納される。本パラメータに NULL を指定することはできない。NULL を指定すると InternetGetCookieEx は失敗し、ERROR_INVALID_PARAMETER エラーを返す。
dwFlags : [int] 
lpReserved : [intptr] 将来の使用のために予約されている。NULL を設定すること。
%inst
指定した URL に関連付けられたクッキーに格納されているデータを取得する。(Unicode)

[戻り値]
関数が成功した場合、戻り値は TRUE である。
関数が失敗した場合、戻り値は FALSE である。具体的なエラー値を取得するには GetLastError
を呼び出す。lpszCookieData に NULL を渡した場合、呼び出しは成功し、関数は
ERROR_INSUFFICIENT_BUFFER を設定しない。
本関数は次のエラーコードを設定することがある。
（以下省略）

[備考]
注意: WinINet はサーバー実装をサポートしていない。さらに、サービスから使用すべきでもない。サーバー実装やサービスでは
Microsoft Windows HTTP Services (WinHTTP) を使用すること。
> [!NOTE] > wininet.h ヘッダーは InternetGetCookieEx
をエイリアスとして定義しており、UNICODE プリプロセッサ定数の定義に基づいて本関数の ANSI 版または Unicode
版を自動的に選択する。エンコーディング中立のエイリアスとエンコーディング中立でないコードを混在させると、コンパイルエラーや実行時エラーの原因となるミスマッチが発生する可能性がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照のこと。


%index
InternetGetCookieEx2
指定した URL に関連付けられた 1 つ以上のクッキーを取得する。
%prm
pcwszUrl, pcwszCookieName, dwFlags, ppCookies, pdwCookieCount
pcwszUrl : [wstr] クッキーを取得する URL。
pcwszCookieName : [wstr] 取得するクッキーの名前。NULL を指定可能。
dwFlags : [int] 取得するクッキーのフラグ。次のフラグが利用できる。 | 値 | 意味 | |-------|---------| | INTERNET_COOKIE_THIRD_PARTY | サードパーティとしてクッキーを取得し、ファーストパーティ専用クッキーを除外する。 | | INTERNET_COOKIE_NON_SCRIPT | 本クエリが JavaScript からトリガーされたものではないことを示し、HTTP-only クッキーの取得を許可する。 | | INTERNET_COOKIE_SAME_SITE_LEVEL_CROSS_SITE | クロスサイトコンテキストにいるかのようにクッキーを取得し、SameSite プロパティが設定されたクッキーを除外する。 | | INTERNET_FLAG_RESTRICTED_ZONE | 指定された URL が信頼されていない場合 (URLZONE_UNTRUSTED ゾーンに属する場合) に許可されるクッキーのみを取得する。 |
ppCookies : [var] [INTERNET\_COOKIE2](ns-wininet-internet_cookie2.md) 構造体の配列を受け取るポインタ。返された配列は [InternetFreeCookies](nf-wininet-internetfreecookies.md) で解放しなければならない。
pdwCookieCount : [var] 配列内の構造体の数を受け取る DWORD へのポインタ。
%inst
指定した URL に関連付けられた 1 つ以上のクッキーを取得する。

[戻り値]
成功した場合は ERROR_SUCCESS
を、失敗した場合は[システムエラーコード](/windows/desktop/debug/system-error-codes)を返す。

[備考]
> [!NOTE] > WinINet
はサーバー実装をサポートしていない。さらに、サービスから使用すべきでもない。サーバー実装やサービスでは [Microsoft
Windows HTTP Services
(WinHTTP)](/windows/desktop/winhttp/winhttp-start-page) を使用すること。


%index
InternetGetLastResponseInfoW
本関数を呼び出したスレッド上での最後のエラー説明またはサーバーレスポンスを取得する。(Unicode)
%prm
lpdwError, lpszBuffer, lpdwBufferLength
lpdwError : [var] 失敗した操作に関連するエラーメッセージを受け取る変数へのポインタ。
lpszBuffer : [wstr] エラーテキストを受け取るバッファへのポインタ。
lpdwBufferLength : [var] lpszBuffer バッファのサイズ (TCHAR 単位) を格納する変数へのポインタ。関数が戻ると、本パラメータにはバッファに書き込まれた文字列のサイズ (終端の 0 を含まない) が格納される。
%inst
本関数を呼び出したスレッド上での最後のエラー説明またはサーバーレスポンスを取得する。(Unicode)

[戻り値]
エラーテキストがバッファに正常に書き込まれた場合は TRUE を、そうでない場合は FALSE を返す。拡張エラー情報を取得するには
GetLastError を呼び出す。バッファがすべてのエラーテキストを保持するには小さすぎる場合、GetLastError は
ERROR_INSUFFICIENT_BUFFER を返し、lpdwBufferLength
パラメータにはすべてのエラーテキストを返すために必要な最小バッファサイズが格納される。

[備考]
FTP プロトコルはほとんどのエラーとともに追加のテキスト情報を返すことができる。この拡張エラー情報は、(失敗した関数呼び出しの後に)
GetLastError が ERROR_INTERNET_EXTENDED_ERROR
を返すたびに、InternetGetLastResponseInfo 関数を使用して取得できる。lpszBuffer
が指すバッファは、エラー文字列と末尾のゼロ終端の両方を保持できる十分な大きさでなければならない。ただし、lpdwBufferLength
に返される値は終端のゼロを含まないことに注意。InternetGetLastResponseInfo
は、本スレッドで別の関数が呼び出されるまで複数回呼び出すことができる。別の関数が呼び出されると、最後のレスポンス情報を保存する内部バッファはクリアされる。WinINet
API の他のすべての側面と同様に、本関数は DllMain
やグローバルオブジェクトのコンストラクタ・デストラクタの中から安全に呼び出すことはできない。注意: WinINet
はサーバー実装をサポートしていない。さらに、サービスから使用すべきでもない。サーバー実装やサービスでは Microsoft Windows
HTTP Services (WinHTTP) を使用すること。
> [!NOTE] > wininet.h ヘッダーは InternetGetLastResponseInfo
をエイリアスとして定義しており、UNICODE プリプロセッサ定数の定義に基づいて本関数の ANSI 版または Unicode
版を自動的に選択する。エンコーディング中立のエイリアスとエンコーディング中立でないコードを混在させると、コンパイルエラーや実行時エラーの原因となるミスマッチが発生する可能性がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照のこと。


%index
InternetGetPerSiteCookieDecisionW
指定したドメインのクッキーに関する判断を取得する。(Unicode)
%prm
pchHostName, pResult
pchHostName : [wstr] ドメインを格納した文字列を指す LPCTSTR。
pResult : [var] InternetCookieState 列挙値のいずれかを格納する unsigned long へのポインタ。
%inst
指定したドメインのクッキーに関する判断を取得する。(Unicode)

[戻り値]
判断が取得された場合は TRUE を、そうでない場合は FALSE を返す。

[備考]
FALSE という戻り値は、pchHostName のドメインにサイト固有のクッキー規制が設定されていないことを示す場合がある。
WinINet は pchHostName
パラメータで指定されたドメインを最小化し、最小の有効ドメインにクッキーポリシーを設定する。例えば、指定されたホスト名が
widgets.microsoft.com の場合、ポリシーは最小化されたホスト名 microsoft.com
に設定される。WinINet API の他のすべての側面と同様に、本関数は DllMain
やグローバルオブジェクトのコンストラクタ・デストラクタの中から安全に呼び出すことはできない。注意: WinINet
はサーバー実装をサポートしていない。さらに、サービスから使用すべきでもない。サーバー実装やサービスでは Microsoft Windows
HTTP Services (WinHTTP) を使用すること。
> [!NOTE] > wininet.h ヘッダーは InternetGetPerSiteCookieDecision
をエイリアスとして定義しており、UNICODE プリプロセッサ定数の定義に基づいて本関数の ANSI 版または Unicode
版を自動的に選択する。エンコーディング中立のエイリアスとエンコーディング中立でないコードを混在させると、コンパイルエラーや実行時エラーの原因となるミスマッチが発生する可能性がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照のこと。


%index
InternetGetProxyForUrl
(no summary)
%prm
hInternet, pcwszUrl, pProxyInfoList
hInternet : [intptr] 
pcwszUrl : [wstr] 
pProxyInfoList : [var] 
%inst



%index
InternetGetSecurityInfoByURL
(no summary)
%prm
lpszURL, ppCertChain, pdwSecureFlags
lpszURL : [str] 
ppCertChain : [var] 
pdwSecureFlags : [var] 
%inst



%index
InternetGetSecurityInfoByURLA
(no summary)
%prm
lpszURL, ppCertChain, pdwSecureFlags
lpszURL : [str] 
ppCertChain : [var] 
pdwSecureFlags : [var] 
%inst



%index
InternetGetSecurityInfoByURLW
(no summary)
%prm
lpszURL, ppCertChain, pdwSecureFlags
lpszURL : [wstr] 
ppCertChain : [var] 
pdwSecureFlags : [var] 
%inst



%index
InternetGoOnline
InternetGoOnline 関数 (wininet.h) は URL への接続開始の許可をユーザーに求める。
%prm
lpszURL, hwndParent, dwFlags
lpszURL : [str] 接続先 Web サイトの URL を指定する null 終端文字列へのポインタ。
hwndParent : [intptr] 親ウィンドウへのハンドル。
dwFlags : [int] 本パラメータには 0、または次のフラグを指定できる。
%inst
InternetGoOnline 関数 (wininet.h) は URL への接続開始の許可をユーザーに求める。

[戻り値]
関数が成功した場合、戻り値は TRUE である。
関数が失敗した場合、戻り値は FALSE である。アプリケーションは GetLastError
を呼び出してエラーコードを取得できる。関数が失敗した場合、次のエラーコードを返すことがある。
（以下省略）

[備考]
注意: WinINet はサーバー実装をサポートしていない。さらに、サービスから使用すべきでもない。サーバー実装やサービスでは
Microsoft Windows HTTP Services (WinHTTP) を使用すること。


%index
InternetHangUp
InternetHangUp 関数 (wininet.h) はモデムにインターネットからの切断を指示する。
%prm
dwConnection, dwReserved
dwConnection : [int] 切断する接続の接続番号。
dwReserved : [int] 本パラメータは予約されており、0 を指定しなければならない。
%inst
InternetHangUp 関数 (wininet.h) はモデムにインターネットからの切断を指示する。

[戻り値]
成功した場合は ERROR_SUCCESS を、失敗した場合はエラー値を返す。

[備考]
注意: WinINet はサーバー実装をサポートしていない。さらに、サービスから使用すべきでもない。サーバー実装やサービスでは
Microsoft Windows HTTP Services (WinHTTP) を使用すること。


%index
InternetInitializeAutoProxyDll
InternetInitializeAutoProxyDll 関数 (wininet.h) は、InternetInitializeAutoProxyDll という名前を持つ 2 つの WinINet 関数のうちの 1 つである。
%prm
dwReserved
dwReserved : [int] 本パラメータは予約されており、0 を指定しなければならない。
%inst
InternetInitializeAutoProxyDll 関数 (wininet.h)
は、InternetInitializeAutoProxyDll という名前を持つ 2 つの WinINet 関数のうちの 1 つである。

[戻り値]
成功した場合は TRUE を、失敗した場合は FALSE を返す。拡張エラー情報を取得するには GetLastError を呼び出す。

[備考]
InternetInitializeAutoProxyDll 関数は処理の完了に時間を要するため、UI
スレッドから呼び出すべきではない。WinINet API の他のすべての側面と同様に、本関数は DllMain
やグローバルオブジェクトのコンストラクタ・デストラクタの中から安全に呼び出すことはできない。注意: WinINet
はサーバー実装をサポートしていない。さらに、サービスから使用すべきでもない。サーバー実装やサービスでは Microsoft Windows
HTTP Services (WinHTTP) を使用すること。


%index
InternetLockRequestFile
使用中のファイルにロックを掛ける。
%prm
hInternet, lphLockRequestInfo
hInternet : [intptr] FtpOpenFile、GopherOpenFile、HttpOpenRequest、または InternetOpenUrl 関数によって返されたハンドル。
lphLockRequestInfo : [intptr] ロック要求ハンドルを受け取るハンドルへのポインタ。
%inst
使用中のファイルにロックを掛ける。

[戻り値]
成功した場合は TRUE を、失敗した場合は FALSE を返す。具体的なエラーメッセージを取得するには GetLastError
を呼び出す。

[備考]
hInternet に渡された HINTERNET ハンドルが INTERNET_FLAG_NO_CACHE_WRITE または
INTERNET_FLAG_DONT_CACHE で作成されている場合、HTTPS リソースでない限り、関数は拡張子 .tmp
の一時ファイルを作成する。ハンドルが INTERNET_FLAG_NO_CACHE_WRITE または
INTERNET_FLAG_DONT_CACHE で作成され、HTTPS
リソースにアクセスしている場合、InternetLockRequestFile は失敗する。WinINet API
の他のすべての側面と同様に、本関数は DllMain
やグローバルオブジェクトのコンストラクタ・デストラクタの中から安全に呼び出すことはできない。注意: WinINet
はサーバー実装をサポートしていない。さらに、サービスから使用すべきでもない。サーバー実装やサービスでは Microsoft Windows
HTTP Services (WinHTTP) を使用すること。


%index
InternetOpenW
アプリケーションによる WinINet 関数の使用を初期化する。(Unicode)
%prm
lpszAgent, dwAccessType, lpszProxy, lpszProxyBypass, dwFlags
lpszAgent : [wstr] WinINet 関数を呼び出すアプリ名または主体名を指定する NULL 終端文字列へのポインタ。HTTP の user agent として使用される。
dwAccessType : [int] 
lpszProxy : [wstr] dwAccessType が INTERNET_OPEN_TYPE_PROXY のときに使用するプロキシサーバー名を指定する NULL 終端文字列へのポインタ。空文字列は使わないこと。WinINet は HTTP の CERN 型プロキシと FTP の TIS FTP ゲートウェイのみ認識する。IE がインストールされていれば SOCKS プロキシも対応。それ以外の dwAccessType では無視され NULL 可。
lpszProxyBypass : [wstr] INTERNET_OPEN_TYPE_PROXY 時にプロキシ経由しないホスト名/IP アドレスのリスト(セミコロン区切り、ワイルドカード可)を指定する NULL 終端文字列へのポインタ。空文字列は使わないこと。"<local>" マクロを指定するとピリオドを含まないホスト名をバイパスする。既定で WinINet は "localhost"、"loopback"、"127.0.0.1"、"[::1]" のプロキシをバイパスする。"<-loopback>" マクロでローカルコンピュータをバイパスリストから除外できる (IE9)。それ以外の dwAccessType では無視され NULL 可。
dwFlags : [int] 
%inst
アプリケーションによる WinINet 関数の使用を初期化する。(Unicode)

[戻り値]
成功時はアプリが後続の WinINet 関数に渡す有効なハンドルを返す。失敗時は NULL。特定のエラーメッセージは
GetLastError で取得する。

[備考]
InternetOpen はアプリケーションが最初に呼ぶ WinINet 関数。インターネット DLL
に内部データ構造を初期化させ後続呼び出しに備えさせる。使用終了時は InternetCloseHandle
でハンドルと関連リソースを解放する。複数回呼び出しも可能だが通常 1 回で十分。使用後は InternetCloseHandle
で閉じる。WinINet はサービスやサーバー実装から使用すべきでない。
> [!NOTE] > wininet.h は UNICODE マクロに応じて InternetOpen を ANSI/Unicode
版のエイリアスとして定義する。


%index
InternetOpenUrlW
完全な FTP または HTTP URL で指定されたリソースを開く。(Unicode)
%prm
hInternet, lpszUrl, lpszHeaders, dwHeadersLength, dwFlags, dwContext
hInternet : [intptr] 現在のインターネットセッションへのハンドル。InternetOpen が返したハンドルである必要がある。
lpszUrl : [wstr] 読み取り開始する URL を指定する NULL 終端文字列変数へのポインタ。ftp:、http:、https: で始まる URL のみサポート。
lpszHeaders : [wstr] HTTP サーバーに送るヘッダを指定する NULL 終端文字列へのポインタ。詳細は HttpSendRequest の lpszHeaders を参照。
dwHeadersLength : [int] 追加ヘッダのサイズ(TCHAR 単位)。-1L で lpszHeaders が NULL でない場合、NULL 終端とみなして計算する。
dwFlags : [int] 
dwContext : [int] 返されたハンドルと共にコールバックに渡されるアプリケーション定義値を指定する変数へのポインタ。
%inst
完全な FTP または HTTP URL で指定されたリソースを開く。(Unicode)

[戻り値]
接続成功時は URL への有効なハンドル、失敗時は NULL を返す。特定のエラーメッセージは GetLastError
で取得する。アクセス拒否の原因は InternetGetLastResponseInfo で取得する。

[備考]
相対 URL とベース URL が空白で区切られている URL の場合、先に InternetCanonicalizeUrl
を呼び出すこと。WinINet がサポートするプロトコルのデータを取得するための汎用関数で、プロトコルの詳細にアクセスする必要がなく
URL 対応データのみ必要な場合に便利。URL 文字列を解析しサーバーに接続し、URL
で識別されるデータのダウンロード準備をする。InternetReadFile(ファイル)または
InternetFindNextFile(ディレクトリ)で URL データを取得できる。InternetConnect
を先に呼ぶ必要はない。使用後は InternetCloseHandle で閉じる。WinINet
はサービスやサーバー実装から使用すべきでない。
> [!NOTE] > wininet.h は UNICODE マクロに応じて InternetOpenUrl を
ANSI/Unicode 版のエイリアスとして定義する。


%index
InternetQueryDataAvailable
サーバーに問い合わせて利用可能なデータの量を取得する。
%prm
hFile, lpdwNumberOfBytesAvailable, dwFlags, dwContext
hFile : [intptr] InternetOpenUrl、FtpOpenFile、GopherOpenFile、または HttpOpenRequest 関数から返されたハンドル。
lpdwNumberOfBytesAvailable : [var] 利用可能なバイト数を受け取る変数へのポインタ。NULL を指定可能。
dwFlags : [int] 本パラメータは予約されており、0 を指定しなければならない。
dwContext : [int] 本パラメータは予約されており、0 を指定しなければならない。
%inst
サーバーに問い合わせて利用可能なデータの量を取得する。

[戻り値]
関数が成功した場合は TRUE を、失敗した場合は FALSE を返す。拡張エラー情報を取得するには GetLastError
を呼び出す。一致するファイルが見つからない場合、GetLastError は ERROR_NO_MORE_FILES を返す。

[備考]
本関数は、後続の InternetReadFile
の呼び出しによって即座に読み取り可能なデータのバイト数を返す。現在利用できるデータがなく、ファイルの末尾にも到達していない場合、要求はデータが利用可能になるまで待機する。残りのデータ量は、InternetQueryDataAvailable
の呼び出しで示された利用可能なすべてのデータが読み取られるまで再計算されない。HttpOpenRequest で作成され
HttpSendRequestEx で送信された HINTERNET ハンドルの場合、InternetQueryDataAvailable
を使用する前にハンドルに対して HttpEndRequest を呼び出さなければならない。WinINet API
の他のすべての側面と同様に、本関数は DllMain
やグローバルオブジェクトのコンストラクタ・デストラクタの中から安全に呼び出すことはできない。注意: WinINet
はサーバー実装をサポートしていない。さらに、サービスから使用すべきでもない。サーバー実装やサービスでは Microsoft Windows
HTTP Services (WinHTTP) を使用すること。


%index
InternetQueryFortezzaStatus
(no summary)
%prm
pdwStatus, dwReserved
pdwStatus : [var] 
dwReserved : [int] 
%inst



%index
InternetQueryOptionW
指定したハンドル上のインターネットオプションを問い合わせる。(Unicode)
%prm
hInternet, dwOption, lpBuffer, lpdwBufferLength
hInternet : [intptr] 情報を問い合わせる対象のハンドル。
dwOption : [int] 問い合わせるインターネットオプション。Option Flags 値のいずれかを指定できる。
lpBuffer : [intptr] オプション設定を受け取るバッファへのポインタ。InternetQueryOption が返す文字列はグローバルに割り当てられているため、呼び出し側アプリケーションは使用が終わったらそれらを解放しなければならない。
lpdwBufferLength : [var] lpBuffer のサイズ (バイト単位) を格納する変数へのポインタ。InternetQueryOption が戻ると、lpdwBufferLength には lpBuffer に格納されたデータのサイズが指定される。GetLastError が ERROR_INSUFFICIENT_BUFFER を返した場合、本パラメータは要求された情報を保持するために必要なバイト数を指す。
%inst
指定したハンドル上のインターネットオプションを問い合わせる。(Unicode)

[戻り値]
成功した場合は TRUE を、失敗した場合は FALSE を返す。具体的なエラーメッセージを取得するには GetLastError
を呼び出す。

[備考]
指定したハンドル種別に対して無効なオプションフラグが dwOption パラメータに渡された場合、GetLastError は
ERROR_INVALID_PARAMETER を返す。詳細は Setting and Retrieving Internet
Options を参照のこと。WinINet API の他のすべての側面と同様に、本関数は DllMain
やグローバルオブジェクトのコンストラクタ・デストラクタの中から安全に呼び出すことはできない。注意: WinINet
はサーバー実装をサポートしていない。さらに、サービスから使用すべきでもない。サーバー実装やサービスでは Microsoft Windows
HTTP Services (WinHTTP) を使用すること。
> [!NOTE] > wininet.h ヘッダーは InternetQueryOption
をエイリアスとして定義しており、UNICODE プリプロセッサ定数の定義に基づいて本関数の ANSI 版または Unicode
版を自動的に選択する。エンコーディング中立のエイリアスとエンコーディング中立でないコードを混在させると、コンパイルエラーや実行時エラーの原因となるミスマッチが発生する可能性がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照のこと。


%index
InternetReadFile
InternetOpenUrl、FtpOpenFile、HttpOpenRequest が返したハンドルからデータを読み取る。
%prm
hFile, lpBuffer, dwNumberOfBytesToRead, lpdwNumberOfBytesRead
hFile : [intptr] InternetOpenUrl、FtpOpenFile、HttpOpenRequest から返されたハンドル。
lpBuffer : [intptr] データを受け取るバッファへのポインタ。
dwNumberOfBytesToRead : [int] 読み取るバイト数。
lpdwNumberOfBytesRead : [var] 読み取ったバイト数を受け取る変数へのポインタ。作業前に 0 に設定される。
%inst
InternetOpenUrl、FtpOpenFile、HttpOpenRequest が返したハンドルからデータを読み取る。

[戻り値]
成功時は TRUE、失敗時は FALSE。拡張エラー情報は GetLastError で取得する。必要に応じて
InternetGetLastResponseInfo も使う。

[備考]
基本的な ReadFile とほぼ同じだが、いくつかの違いがある。通常 HINTERNET
ハンドルから順次バイトストリームとしてデータを取得する。読み取るバイト数を dwNumberOfBytesToRead で指定し、データは
lpBuffer に返される。全データ取得には TRUE かつ lpdwNumberOfBytesRead が 0
になるまで繰り返し呼ぶ必要がある。これはキャッシュ更新にも重要。InternetOpenUrl で取得したハンドルの場合、WinINet
は FTP ディレクトリリストなどを HTML ストリームに変換する。バッファが小さすぎて 1 行の HTML が入らない場合
ERROR_INSUFFICIENT_BUFFER を返す。非同期実行中に完了しなかった場合は FALSE を返し
GetLastError が ERROR_IO_PENDING を返す。完了時は InternetStatusCallback が
INTERNET_STATUS_REQUEST_COMPLETE で呼ばれる。WinINet はサービス実装では使用しないこと。


%index
InternetReadFileExW
InternetOpenUrl または HttpOpenRequest 関数で開かれたハンドルからデータを読み取る。(Unicode)
%prm
hFile, lpBuffersOut, dwFlags, dwContext
hFile : [intptr] InternetOpenUrl または HttpOpenRequest 関数から返されたハンドル。
lpBuffersOut : [var] ダウンロードされたデータを受け取る INTERNET_BUFFERS 構造体へのポインタ。
dwFlags : [int] 
dwContext : [int] 非同期操作で使用される、呼び出し側が提供するコンテキスト値。
%inst
InternetOpenUrl または HttpOpenRequest 関数で開かれたハンドルからデータを読み取る。(Unicode)

[戻り値]
成功した場合は TRUE を、失敗した場合は FALSE を返す。拡張エラー情報を取得するには GetLastError
を呼び出す。アプリケーションは必要に応じて InternetGetLastResponseInfo も使用できる。

[備考]
注意: WinINet はサーバー実装をサポートしていない。さらに、サービスから使用すべきでもない。サーバー実装やサービスでは
Microsoft Windows HTTP Services (WinHTTP) を使用すること。
> [!NOTE] > wininet.h ヘッダーは InternetReadFileEx
をエイリアスとして定義しており、UNICODE プリプロセッサ定数の定義に基づいて本関数の ANSI 版または Unicode
版を自動的に選択する。エンコーディング中立のエイリアスとエンコーディング中立でないコードを混在させると、コンパイルエラーや実行時エラーの原因となるミスマッチが発生する可能性がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照のこと。


%index
InternetSecurityProtocolToStringW
(no summary)
%prm
dwProtocol, lpstr, lpdwstrLength, dwReserved
dwProtocol : [int] 
lpstr : [wstr] 
lpdwstrLength : [var] 
dwReserved : [int] 
%inst



%index
InternetSetCookieW
指定した URL に関連付けられたクッキーを作成する。(InternetSetCookieW)
%prm
lpszUrl, lpszCookieName, lpszCookieData
lpszUrl : [wstr] クッキーを設定する URL を指定する null 終端文字列へのポインタ。
lpszCookieName : [wstr] クッキーデータに関連付ける名前を指定する null 終端文字列へのポインタ。本パラメータが NULL の場合、クッキーには名前が関連付けられない。
lpszCookieData : [wstr] URL に関連付ける実際のデータへのポインタ。
%inst
指定した URL に関連付けられたクッキーを作成する。(InternetSetCookieW)

[戻り値]
成功した場合は TRUE を、失敗した場合は FALSE を返す。具体的なエラーメッセージを取得するには GetLastError
を呼び出す。

[備考]
InternetSetCookie
で有効期限なしに作成されたクッキーはメモリに格納され、それらを作成した同一プロセス内でのみ利用可能である。有効期限を含むクッキーは
windows\cookies
ディレクトリに格納される。新しいクッキーの作成は、ユーザーのプライバシー設定に基づいて、本サイトからのクッキーを許可するか拒否するかをユーザーに尋ねるダイアログボックスを画面に表示することがある。
注意: InternetSetCookie は、Internet Explorer
で「すべてのクッキーをブロック」が設定されている場合でも、無条件にクッキーを作成する。「すべてのクッキーをブロック」設定が有効な間、そのようなクッキーがその後サーバーに送り返されることはないが、この動作はプライバシーの侵害と見なされる可能性がある。アプリケーションはユーザーのプライバシー設定を正しく尊重するために
InternetSetCookieEx を使用すべきである。クッキーの内部仕様の詳細については
http://blogs.msdn.com/ieinternals/archive/2009/08/20/WinINET-IE-Cookie-Internals-FAQ.aspx
を参照のこと。
WinINet API の他のすべての側面と同様に、本関数は DllMain
やグローバルオブジェクトのコンストラクタ・デストラクタの中から安全に呼び出すことはできない。注意: WinINet
はサーバー実装をサポートしていない。さらに、サービスから使用すべきでもない。サーバー実装やサービスでは Microsoft Windows
HTTP Services (WinHTTP) を使用すること。
> [!NOTE] > wininet.h ヘッダーは InternetSetCookie をエイリアスとして定義しており、UNICODE
プリプロセッサ定数の定義に基づいて本関数の ANSI 版または Unicode
版を自動的に選択する。エンコーディング中立のエイリアスとエンコーディング中立でないコードを混在させると、コンパイルエラーや実行時エラーの原因となるミスマッチが発生する可能性がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照のこと。


%index
InternetSetCookieExW
InternetSetCookieEx 関数は、指定された URL に関連付けられた指定の名前のクッキーを作成する。本関数はサードパーティクッキーを作成できる点で InternetSetCookie 関数と異なる。(Unicode)
%prm
lpszUrl, lpszCookieName, lpszCookieData, dwFlags, dwReserved
lpszUrl : [wstr] クッキーを設定する URL を格納した null 終端文字列へのポインタ。本ポインタが NULL の場合、InternetSetCookieEx は ERROR_INVALID_PARAMETER エラーで失敗する。
lpszCookieName : [wstr] 本クッキーに関連付ける名前を格納した null 終端文字列へのポインタ。本ポインタが NULL の場合、クッキーには名前が関連付けられない。
lpszCookieData : [wstr] 新しいクッキーに関連付けるデータを格納した null 終端文字列へのポインタ。本ポインタが NULL の場合、InternetSetCookieEx は ERROR_INVALID_PARAMETER エラーで失敗する。
dwFlags : [int] 関数がクッキーデータを取得する方法を制御するフラグ。
dwReserved : [int] NULL、またはクッキーに関連付ける Platform-for-Privacy-Protection (P3P) ヘッダーへのポインタ。
%inst
InternetSetCookieEx 関数は、指定された URL
に関連付けられた指定の名前のクッキーを作成する。本関数はサードパーティクッキーを作成できる点で InternetSetCookie
関数と異なる。(Unicode)

[戻り値]
成功した場合は InternetCookieState 列挙のメンバを、失敗した場合は FALSE を返す。失敗時に
GetLastError の呼び出しが ERROR_NOT_ENOUGH_MEMORY
を返した場合、システムメモリが不足していたことを示す。

[備考]
注意: WinINet はサーバー実装をサポートしていない。さらに、サービスから使用すべきでもない。サーバー実装やサービスでは
Microsoft Windows HTTP Services (WinHTTP) を使用すること。
> [!NOTE] > wininet.h ヘッダーは InternetSetCookieEx
をエイリアスとして定義しており、UNICODE プリプロセッサ定数の定義に基づいて本関数の ANSI 版または Unicode
版を自動的に選択する。エンコーディング中立のエイリアスとエンコーディング中立でないコードを混在させると、コンパイルエラーや実行時エラーの原因となるミスマッチが発生する可能性がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照のこと。


%index
InternetSetCookieEx2
指定した URL に関連付けられたクッキーを作成する。(InternetSetCookieEx2)
%prm
pcwszUrl, pCookie, pcwszP3PPolicy, dwFlags, pdwCookieState
pcwszUrl : [wstr] クッキーを設定する URL。
pCookie : [var] クッキーデータを格納した [INTERNET\_COOKIE2](ns-wininet-internet_cookie2.md) 構造体へのポインタ。
pcwszP3PPolicy : [wstr] クッキーに対する Platform-for-Privacy-Protection (P3P) ポリシーを格納した文字列。NULL を指定可能。
dwFlags : [int] 設定するクッキーのフラグ。次のフラグが利用できる。 | 値 | 意味 | |-------|---------| | INTERNET_COOKIE_THIRD_PARTY | 本クッキーをサードパーティコンテキストで設定する。 | | INTERNET_COOKIE_PROMPT_REQUIRED | ユーザーが本クッキーを承諾または拒否するための UI プロンプトを表示する。 | | INTERNET_COOKIE_EVALUATE_P3P | 本クッキーに対して指定された P3P ポリシーを評価する。*pcwszP3PPolicy* が NULL の場合は既定のポリシーを評価する。 | | INTERNET_COOKIE_NON_SCRIPT | 本クッキーが JavaScript 経由で設定されているのではないことを示し、HTTP-only クッキーの設定を許可する。 | | INTERNET_COOKIE_APPLY_HOST_ONLY | 本クッキーにホストのみのポリシーを適用する。ドメイン属性が設定されていない場合、本クッキーはホストのみとマークされる。 |
pdwCookieState : [var] クッキー設定の結果を受け取る DWORD へのポインタ。可能な値については [InternetCookieState](/windows/win32/api/wininet/ne-wininet-internetcookiestate) を参照のこと。
%inst
指定した URL に関連付けられたクッキーを作成する。(InternetSetCookieEx2)

[戻り値]
成功した場合は ERROR_SUCCESS
を、失敗した場合は[システムエラーコード](/windows/desktop/debug/system-error-codes)を返す。

[備考]
> [!NOTE] > WinINet
はサーバー実装をサポートしていない。さらに、サービスから使用すべきでもない。サーバー実装やサービスでは [Microsoft
Windows HTTP Services
(WinHTTP)](/windows/desktop/winhttp/winhttp-start-page) を使用すること。


%index
InternetSetDialState
InternetSetDialState 関数 (wininet.h) はサポートされておらず、廃止されており、使用すべきではない。
%prm
lpszConnectoid, dwState, dwReserved
lpszConnectoid : [str] 未使用。
dwState : [int] 未使用。
dwReserved : [int] 未使用。
%inst
InternetSetDialState 関数 (wininet.h) はサポートされておらず、廃止されており、使用すべきではない。

[戻り値]
本関数は値を返さない。

[備考]
注意: WinINet はサーバー実装をサポートしていない。さらに、サービスから使用すべきでもない。サーバー実装やサービスでは
Microsoft Windows HTTP Services (WinHTTP) を使用すること。


%index
InternetSetFilePointer
InternetReadFile のファイル位置を設定する。本呼び出しは同期だが、後続の InternetReadFile の呼び出しは、データがキャッシュから利用可能でなく、かつサーバーがランダムアクセスをサポートしていない場合にブロックしたり pending を返したりする可能性がある。
%prm
hFile, lDistanceToMove, lpDistanceToMoveHigh, dwMoveMethod, dwContext
hFile : [intptr] InternetOpenUrl (HTTP または HTTPS URL に対するもの)、または HttpOpenRequest (GET または HEAD HTTP 動詞を使用し HttpSendRequest または HttpSendRequestEx に渡されたもの) の以前の呼び出しから返されたハンドル。本ハンドルは INTERNET_FLAG_DONT_CACHE または INTERNET_FLAG_NO_CACHE_WRITE を設定して作成されたものであってはならない。
lDistanceToMove : [int] ファイルポインタを移動する符号付き 64 ビットバイト数の下位 32 ビット。Internet Explorer 7 以前: InternetSetFilePointer はポインタを LONG の範囲内でのみ移動していた。この古いバージョンの関数を呼び出す際、lpDistanceToMoveHigh は予約されており 0 に設定すべきである。正の値はファイル内でポインタを前方に、負の値は後方に移動する。
lpDistanceToMoveHigh : [var] 符号付き 64 ビット移動距離の上位 32 ビットへのポインタ。上位 32 ビットが不要な場合、本ポインタは NULL に設定しなければならない。NULL でない場合、本パラメータは新しいファイルポインタ値の上位 DWORD も受け取る。正の値はファイル内でポインタを前方に、負の値は後方に移動する。Internet Explorer 7 以前: InternetSetFilePointer はポインタを LONG の範囲内でのみ移動していた。この古いバージョンの関数を呼び出す際、lpDistanceToMoveHigh は予約されており 0 に設定すべきである。
dwMoveMethod : [int] 
dwContext : [int] 本パラメータは予約されており、0 を指定しなければならない。
%inst
InternetReadFile のファイル位置を設定する。本呼び出しは同期だが、後続の InternetReadFile
の呼び出しは、データがキャッシュから利用可能でなく、かつサーバーがランダムアクセスをサポートしていない場合にブロックしたり pending
を返したりする可能性がある。

[戻り値]
関数が成功した場合、現在のファイル位置を返す。INVALID_SET_FILE_POINTER という戻り値は失敗の可能性を示し、その後
GetLastError の呼び出しが必要である。INVALID_SET_FILE_POINTER は新しいファイルポインタの下位
DWORD として有効な値であるため、呼び出し側はエラーが発生したかどうかを判断するために、関数の戻り値と GetLastError
によって返されるエラーコードの両方をチェックしなければならない。エラーが発生した場合、InternetSetFilePointer
の戻り値は INVALID_SET_FILE_POINTER となり、GetLastError は NO_ERROR
以外の値を返す。関数が成功し lpDistanceToMoveHigh が NULL の場合、戻り値は新しいファイルポインタの下位
DWORD である。なお関数が INVALID_SET_FILE_POINTER
以外の値を返した場合、InternetSetFilePointer の呼び出しは成功しており GetLastError
を呼び出す必要はない。関数が成功し lpDistanceToMoveHigh が NULL
でない場合、戻り値は新しいファイルポインタの下位 DWORD であり、lpDistanceToMoveHigh
には新しいファイルポインタの上位 DWORD
が格納される。新しいファイルポインタが負の値である場合、関数は失敗し、ファイルポインタは移動されず、GetLastError
によって返されるコードは ERROR_NEGATIVE_SEEK となる。lpDistanceToMoveHigh が NULL
であり、新しいファイル位置が 32 ビット値に収まらない場合、関数は失敗し INVALID_SET_FILE_POINTER を返す。

[備考]
InternetReadFile によってファイルの末尾に到達した後は、本関数を使用できない。HttpOpenRequest で作成され
HttpSendRequestEx で送信された HINTERNET ハンドルの場合、InternetSetFilePointer
を使用する前にハンドルに対して HttpEndRequest
を呼び出さなければならない。コンテンツ長が不明な場合、InternetSetFilePointer
を確実に使用することはできない。WinINet API の他のすべての側面と同様に、本関数は DllMain
やグローバルオブジェクトのコンストラクタ・デストラクタの中から安全に呼び出すことはできない。InternetSetFilePointer
は時間とともに変更されてきた。Internet Explorer 7 以前ではポインタを LONG
の範囲内でのみ移動していた。この古いバージョンの関数を呼び出す際、lDistanceToMove
に値全体が格納される。正の値はファイル内でポインタを前方に、負の値は後方に移動する。lpDistanceToMoveHigh
は予約されており 0 に設定される。現行バージョンでは lpDistanceToMoveHigh
は意味のある値であり、負の値も指定可能である。注意: WinINet
はサーバー実装をサポートしていない。さらに、サービスから使用すべきでもない。サーバー実装やサービスでは Microsoft Windows
HTTP Services (WinHTTP) を使用すること。


%index
InternetSetOptionW
インターネットオプションを設定する。(Unicode)
%prm
hInternet, dwOption, lpBuffer, dwBufferLength
hInternet : [intptr] 情報を設定するハンドル。
dwOption : [int] 設定するインターネットオプション。Option Flags のいずれかの値。
lpBuffer : [intptr] オプション設定値を含むバッファへのポインタ。
dwBufferLength : [int] lpBuffer バッファのサイズ。文字列を含む場合は TCHAR 単位、それ以外はバイト単位。
%inst
インターネットオプションを設定する。(Unicode)

[戻り値]
成功時は TRUE、失敗時は FALSE。特定のエラーメッセージは GetLastError で取得する。

[備考]
GetLastError は設定できないオプションに対して ERROR_INVALID_PARAMETER を返す。詳細は Setting
and Retrieving Internet Options を参照。WinINet はサービスから使用すべきでない。
> [!NOTE] > wininet.h は UNICODE マクロに応じて InternetSetOption を
ANSI/Unicode 版のエイリアスとして定義する。


%index
InternetSetOptionExW
サポートされていない。InternetSetOption 関数を呼び出すスタブとしてのみ実装されており、InternetSetOptionEx 自体には機能がない。現時点では本関数を使用しないこと。(Unicode)
%prm
hInternet, dwOption, lpBuffer, dwBufferLength, dwFlags
hInternet : [intptr] 未使用。
dwOption : [int] 未使用。
lpBuffer : [intptr] 未使用。
dwBufferLength : [int] 未使用。
dwFlags : [int] 未使用。
%inst
サポートされていない。InternetSetOption
関数を呼び出すスタブとしてのみ実装されており、InternetSetOptionEx
自体には機能がない。現時点では本関数を使用しないこと。(Unicode)

[戻り値]
本関数は値を返さない。

[備考]
注意: WinINet はサーバー実装をサポートしていない。さらに、サービスから使用すべきでもない。サーバー実装やサービスでは
Microsoft Windows HTTP Services (WinHTTP) を使用すること。
> [!NOTE] > wininet.h ヘッダーは InternetSetOptionEx
をエイリアスとして定義しており、UNICODE プリプロセッサ定数の定義に基づいて本関数の ANSI 版または Unicode
版を自動的に選択する。エンコーディング中立のエイリアスとエンコーディング中立でないコードを混在させると、コンパイルエラーや実行時エラーの原因となるミスマッチが発生する可能性がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照のこと。


%index
InternetSetPerSiteCookieDecisionW
指定したドメインのクッキーに関する判断を設定する。(Unicode)
%prm
pchHostName, dwDecision
pchHostName : [wstr] ドメインを格納した文字列を指す LPCTSTR。
dwDecision : [int] InternetCookieState 列挙値のいずれかを格納する DWORD 型の値。
%inst
指定したドメインのクッキーに関する判断を設定する。(Unicode)

[戻り値]
判断が設定された場合は TRUE を、そうでない場合は FALSE を返す。

[備考]
WinINet は pchHostName
パラメータで指定されたドメインを最小化し、最小の有効ドメインにクッキーポリシーを設定する。例えば、指定されたホスト名が
widgets.microsoft.com の場合、ポリシーは最小化されたホスト名 microsoft.com
に設定される。WinINet API の他のすべての側面と同様に、本関数は DllMain
やグローバルオブジェクトのコンストラクタ・デストラクタの中から安全に呼び出すことはできない。注意: WinINet
はサーバー実装をサポートしていない。さらに、サービスから使用すべきでもない。サーバー実装やサービスでは Microsoft Windows
HTTP Services (WinHTTP) を使用すること。
> [!NOTE] > wininet.h ヘッダーは InternetSetPerSiteCookieDecision
をエイリアスとして定義しており、UNICODE プリプロセッサ定数の定義に基づいて本関数の ANSI 版または Unicode
版を自動的に選択する。エンコーディング中立のエイリアスとエンコーディング中立でないコードを混在させると、コンパイルエラーや実行時エラーの原因となるミスマッチが発生する可能性がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照のこと。


%index
InternetShowSecurityInfoByURL
(no summary)
%prm
lpszURL, hwndParent
lpszURL : [str] 
hwndParent : [intptr] 
%inst



%index
InternetShowSecurityInfoByURLA
(no summary)
%prm
lpszURL, hwndParent
lpszURL : [str] 
hwndParent : [intptr] 
%inst



%index
InternetShowSecurityInfoByURLW
(no summary)
%prm
lpszURL, hwndParent
lpszURL : [wstr] 
hwndParent : [intptr] 
%inst



%index
InternetTimeFromSystemTime
InternetTimeFromSystemTime 関数 (wininet.h) は HTTP バージョン 1.0 仕様に従って日時を書式化する。
%prm
pst, dwRFC, lpszTime, cbTime
pst : [var] 書式化する日時を格納した SYSTEMTIME 構造体へのポインタ。
dwRFC : [int] 使用する RFC 形式。現在、有効な形式は INTERNET_RFC1123_FORMAT のみである。
lpszTime : [str] 書式化された日時を受け取る文字列バッファへのポインタ。バッファのサイズは INTERNET_RFC1123_BUFSIZE であるべきである。
cbTime : [int] lpszTime バッファのサイズ (バイト単位)。
%inst
InternetTimeFromSystemTime 関数 (wininet.h) は HTTP バージョン 1.0
仕様に従って日時を書式化する。

[戻り値]
関数が成功した場合は TRUE を、失敗した場合は FALSE を返す。拡張エラー情報を取得するには GetLastError
を呼び出す。

[備考]
注意: WinINet はサーバー実装をサポートしていない。さらに、サービスから使用すべきでもない。サーバー実装やサービスでは
Microsoft Windows HTTP Services (WinHTTP) を使用すること。


%index
InternetTimeToSystemTime
InternetTimeToSystemTime 関数 (wininet.h) は HTTP の時刻/日付文字列を SYSTEMTIME 構造体に変換する。
%prm
lpszTime, pst, dwReserved
lpszTime : [str] 変換する日時を指定する null 終端文字列へのポインタ。
pst : [var] 変換された時刻を受け取る SYSTEMTIME 構造体へのポインタ。
dwReserved : [int] 本パラメータは予約されており、0 を指定しなければならない。
%inst
InternetTimeToSystemTime 関数 (wininet.h) は HTTP の時刻/日付文字列を SYSTEMTIME
構造体に変換する。

[戻り値]
文字列が変換された場合は TRUE を、そうでない場合は FALSE を返す。拡張エラー情報を取得するには GetLastError
を呼び出す。

[備考]
注意: WinINet はサーバー実装をサポートしていない。さらに、サービスから使用すべきでもない。サーバー実装やサービスでは
Microsoft Windows HTTP Services (WinHTTP) を使用すること。


%index
InternetUnlockRequestFile
InternetLockRequestFile を使用してロックされたファイルのロックを解除する。
%prm
hLockRequestInfo
hLockRequestInfo : [intptr] InternetLockRequestFile によって返されたロック要求へのハンドル。
%inst
InternetLockRequestFile を使用してロックされたファイルのロックを解除する。

[戻り値]
成功した場合は TRUE を、失敗した場合は FALSE を返す。具体的なエラーメッセージを取得するには GetLastError
を呼び出す。

[備考]
注意: WinINet はサーバー実装をサポートしていない。さらに、サービスから使用すべきでもない。サーバー実装やサービスでは
Microsoft Windows HTTP Services (WinHTTP) を使用すること。


%index
InternetWriteFile
開かれたインターネットファイルにデータを書き込む。
%prm
hFile, lpBuffer, dwNumberOfBytesToWrite, lpdwNumberOfBytesWritten
hFile : [intptr] FtpOpenFile の以前の呼び出しから返されたハンドル、または HttpSendRequestEx で送信された HINTERNET ハンドル。
lpBuffer : [intptr] ファイルに書き込むデータを格納したバッファへのポインタ。
dwNumberOfBytesToWrite : [int] ファイルに書き込むバイト数。
lpdwNumberOfBytesWritten : [var] ファイルに書き込まれたバイト数を受け取る変数へのポインタ。InternetWriteFile は処理やエラーチェックを行う前に本値をゼロに設定する。
%inst
開かれたインターネットファイルにデータを書き込む。

[戻り値]
関数が成功した場合は TRUE を、失敗した場合は FALSE を返す。拡張エラー情報を取得するには GetLastError
を呼び出す。アプリケーションは必要に応じて InternetGetLastResponseInfo も使用できる。

[備考]
アプリケーションがデータを送信しているとき、データ転送を終了するために InternetCloseHandle
を呼び出さなければならない。WinINet API の他のすべての側面と同様に、本関数は DllMain
やグローバルオブジェクトのコンストラクタ・デストラクタの中から安全に呼び出すことはできない。注意: WinINet
はサーバー実装をサポートしていない。さらに、サービスから使用すべきでもない。サーバー実装やサービスでは Microsoft Windows
HTTP Services (WinHTTP) を使用すること。


%index
InternetWriteFileExW
(no summary)
%prm
hFile, lpBuffersIn, dwFlags, dwContext
hFile : [intptr] 
lpBuffersIn : [var] 
dwFlags : [int] 
dwContext : [int] 
%inst



%index
IsHostInProxyBypassList
(no summary)
%prm
tScheme, lpszHost, cchHost
tScheme : [int] 
lpszHost : [str] 
cchHost : [int] 
%inst



%index
IsUrlCacheEntryExpiredW
(no summary)
%prm
lpszUrlName, dwFlags, pftLastModified
lpszUrlName : [wstr] 
dwFlags : [int] 
pftLastModified : [var] 
%inst



%index
LoadUrlCacheContent
(no summary)
%prm

%inst



%index
ParseX509EncodedCertificateForListBoxEntry
(no summary)
%prm
lpCert, cbCert, lpszListBoxEntry, lpdwListBoxEntry
lpCert : [var] 
cbCert : [int] 
lpszListBoxEntry : [str] 
lpdwListBoxEntry : [var] 
%inst



%index
PrivacyGetZonePreferenceW
PrivacyGetZonePreferenceW (Unicode) 関数 (wininet.h) は、指定された URLZONE と PrivacyType のプライバシー設定を取得する。
%prm
dwZone, dwType, pdwTemplate, pszBuffer, pdwBufferLength
dwZone : [int] プライバシー設定を取得する URLZONE を指定する DWORD 型の値。
dwType : [int] プライバシー設定を取得する PrivacyType を指定する DWORD 型の値。
pdwTemplate : [var] 本 dwZone と dwType に対して使用されている PrivacyTemplates のどれを格納する DWORD へのポインタを返す LPDWORD。
pszBuffer : [wstr] pdwTemplate の文字列バージョンを表す LPCWSTR、または pdwTemplate が PRIVACY_TEMPLATE_CUSTOM に設定されている場合はカスタマイズされた文字列を含むバッファを指す LPWSTR。カスタマイズされたプライバシー設定文字列の説明については PrivacySetZonePreferenceW を参照のこと。
pdwBufferLength : [var] バッファ長 (文字単位) を格納する LPDWORD。バッファ長が十分でない場合、PrivacyGetZonePreferenceW は本パラメータに必要な文字数を設定し、戻り値 ERROR_MORE_DATA で戻る。
%inst
PrivacyGetZonePreferenceW (Unicode) 関数 (wininet.h) は、指定された URLZONE と
PrivacyType のプライバシー設定を取得する。

[戻り値]
成功した場合は 0 を返す。それ以外の場合は winerr.h で定義されたエラーメッセージのいずれかを返す。

[備考]
インターネットゾーンのこれらのプライバシー設定は、インターネットオプションダイアログのプライバシータブにある。WinINet API
の他のすべての側面と同様に、本関数は DllMain
やグローバルオブジェクトのコンストラクタ・デストラクタの中から安全に呼び出すことはできない。注意: WinINet
はサーバー実装をサポートしていない。さらに、サービスから使用すべきでもない。サーバー実装やサービスでは Microsoft Windows
HTTP Services (WinHTTP) を使用すること。


%index
PrivacySetZonePreferenceW
PrivacySetZonePreferenceW (Unicode) 関数 (wininet.h) は、指定された URLZONE と PrivacyType のプライバシー設定を行う。
%prm
dwZone, dwType, dwTemplate, pszPreference
dwZone : [int] プライバシー設定を行う URLZONE を指定する DWORD 型の値。
dwType : [int] プライバシー設定を行う PrivacyType を指定する DWORD 型の値。
dwTemplate : [int] プライバシー設定の設定に使用するプライバシーテンプレートを指定する DWORD 型の値。
pszPreference : [wstr] dwTemplate が PRIVACY_TEMPLATE_CUSTOM に設定されている場合、本パラメータはカスタム設定の文字列表現である。それ以外の場合、NULL に設定すべきである。この文字列表現の説明は備考の節に含まれている。
%inst
PrivacySetZonePreferenceW (Unicode) 関数 (wininet.h) は、指定された URLZONE と
PrivacyType のプライバシー設定を行う。

[戻り値]
成功した場合は 0 を返す。それ以外の場合は winerr.h で定義されたエラーのいずれかを返す。

[備考]

インターネットゾーンのこれらのプライバシー設定は、インターネットオプションダイアログのプライバシータブにある。URLZONE_INTERNET
のプライバシーオプションを設定するには、両方の PrivacyType
に対するプライバシーテンプレートを設定する必要がある。インターネットオプションのプライバシーメニューのスライダーは、両方の
PrivacyType にプライバシーが設定されている場合にのみ移動する。指定された URLZONE と PrivacyType
のカスタムプライバシー設定は pszPreference パラメータを通じて設定できる。pszPreference
パラメータには、プライバシー設定を記述する空白で区切られた一連のルールを含めることができる。ルール自体には空白を含めることができない点に注意することが重要である。pszPreference
は次の構造を持ち、複数の論理ルールを含めることができる: <signature> <logical-rule>
<special-rule>。現在、signature は IE6-P3PSettings/V1:
に設定しなければならない。論理ルールは次の形式を持つ: /<expression>=<decision>/。expression は &
(論理 AND) と ! (論理 NOT)
演算子を使用したコンパクトポリシートークンで構成されるブール文である。コンパクトポリシートークンは大文字小文字を区別する
(Platform for Privacy Preferences (P3P)
のプライバシーポリシーとコンパクトポリシートークンの詳細については、W3C: Platform for Privacy
Preferences (P3P) Project 仕様を参照のこと)。decision
は、指定したトークンを含むコンパクトポリシーを持つクッキーに対して取るアクションを定義する単一の小文字である。次の表は有効な
decision 文字を示す。
（以下省略）


%index
ReadUrlCacheEntryStream
RetrieveUrlCacheEntryStream 関数を使用して開かれたストリームから、キャッシュされたデータを読み取る。
%prm
hUrlCacheStream, dwLocation, lpBuffer, lpdwLen, Reserved
hUrlCacheStream : [intptr] RetrieveUrlCacheEntryStream 関数によって返されたハンドル。
dwLocation : [int] 読み取り開始位置のオフセット。
lpBuffer : [intptr] データを受け取るバッファへのポインタ。
lpdwLen : [var] lpBuffer バッファのサイズ (バイト単位) を指定する変数へのポインタ。関数が戻ると、変数にはバッファにコピーされたバイト数、またはバッファに必要なサイズ (バイト単位) が格納される。
Reserved : [int] 本パラメータは予約されており、0 を指定しなければならない。
%inst
RetrieveUrlCacheEntryStream 関数を使用して開かれたストリームから、キャッシュされたデータを読み取る。

[戻り値]
成功した場合は TRUE を、失敗した場合は FALSE を返す。拡張エラー情報を取得するには GetLastError を呼び出す。

[備考]
バッファサイズが十分でない場合、GetLastError は ERROR_INSUFFICIENT_BUFFER を返し、lpdwLen
にはすべての情報を格納するために必要なサイズが設定される。WinINet API の他のすべての側面と同様に、本関数は DllMain
やグローバルオブジェクトのコンストラクタ・デストラクタの中から安全に呼び出すことはできない。注意: WinINet
はサーバー実装をサポートしていない。さらに、サービスから使用すべきでもない。サーバー実装やサービスでは Microsoft Windows
HTTP Services (WinHTTP) を使用すること。


%index
ReadUrlCacheEntryStreamEx
(no summary)
%prm
hUrlCacheStream, qwLocation, lpBuffer, lpdwLen
hUrlCacheStream : [intptr] 
qwLocation : [int64] 
lpBuffer : [intptr] 
lpdwLen : [var] 
%inst



%index
RegisterUrlCacheNotification
(no summary)
%prm
hWnd, uMsg, gid, dwOpsFilter, dwReserved
hWnd : [intptr] 
uMsg : [int] 
gid : [int64] 
dwOpsFilter : [int] 
dwReserved : [int] 
%inst



%index
ResumeSuspendedDownload
ResumeSuspendedDownload 関数は、ユーザーインターフェイスダイアログによって中断された要求を再開する。
%prm
hRequest, dwResultCode
hRequest : [intptr] ユーザーインターフェイスダイアログによって中断された要求のハンドル。
dwResultCode : [int] InternetErrorDlg から返されたエラー結果。別のダイアログが呼び出された場合は 0。
%inst
ResumeSuspendedDownload 関数は、ユーザーインターフェイスダイアログによって中断された要求を再開する。

[戻り値]
成功した場合は TRUE を、そうでない場合は FALSE を返す。拡張エラー情報を取得するには GetLastError を呼び出す。

[備考]
WinINet 関数を非同期に使用するアプリケーションは、ユーザーインターフェイスダイアログによって中断された要求を再開するために
ResumeSuspendedDownload を呼び出すことができる。例えば、InternetErrorDlg の呼び出し後に、または
InternetStatusCallback 関数内で lpvStatusInformation パラメータが
INTERNET_STATUS_USER_INPUT_REQUIRED と等しいときに呼び出す。次のコード例はコールバック内での
ResumeSuspendedDownload 関数の使用方法を示す。WinINet API の他のすべての側面と同様に、本関数は
DllMain やグローバルオブジェクトのコンストラクタ・デストラクタの中から安全に呼び出すことはできない。注意: WinINet
はサーバー実装をサポートしていない。さらに、サービスから使用すべきでもない。サーバー実装やサービスでは Microsoft Windows
HTTP Services (WinHTTP) を使用すること。


%index
RetrieveUrlCacheEntryFileW
指定した URL に関連付けられたキャッシュエントリファイルをロックする。(Unicode)
%prm
lpszUrlName, lpCacheEntryInfo, lpcbCacheEntryInfo, dwReserved
lpszUrlName : [wstr] キャッシュエントリに関連付けられたリソースの URL を格納した文字列へのポインタ。これは一意な名前でなければならない。名前文字列にエスケープ文字を含めてはならない。
lpCacheEntryInfo : [var] キャッシュエントリ情報バッファへのポインタ。バッファが十分でない場合、本関数は ERROR_INSUFFICIENT_BUFFER を返し、lpdwCacheEntryInfoBufferSize に必要なバイト数を設定する。
lpcbCacheEntryInfo : [var] lpCacheEntryInfo バッファのサイズ (バイト単位) を指定する unsigned long 整数変数へのポインタ。関数が戻ると、変数には実際に使用されたバッファのサイズ (バイト単位)、またはキャッシュエントリファイルの取得に必要なバイト数が格納される。呼び出し側は本パラメータの戻り値をチェックすべきである。戻りサイズが渡されたサイズ以下であれば、関連するすべてのデータが返されている。
dwReserved : [int] 本パラメータは予約されており、0 を指定しなければならない。
%inst
指定した URL に関連付けられたキャッシュエントリファイルをロックする。(Unicode)

[戻り値]
成功した場合は TRUE を、失敗した場合は FALSE を返す。拡張エラー情報を取得するには GetLastError
を呼び出す。想定されるエラー値には次のものがある。
（以下省略）

[備考]
RetrieveUrlCacheEntryFile は URL の解析を一切行わないため、アンカー (#) を含む URL
は、リソースがキャッシュされていてもキャッシュ内で見つからない。例えば
http://adatum.com/example.htm#sample
を渡した場合、http://adatum.com/example.htm がキャッシュにあっても関数は
ERROR_FILE_NOT_FOUND
を返す。ファイルは取得時に呼び出し側のためにロックされる。呼び出し側はファイルの使用が終わったらロックを解除すべきである。キャッシュマネージャは一定間隔の後にファイルのロックを自動的に解除する。ファイルがロックされている間、キャッシュマネージャはキャッシュからファイルを削除しない。本関数はキャッシュの内部実装に応じて効率的に動作する場合とそうでない場合があることに注意することが重要である。例えば、URL
データが他の URL
のデータも含むパックファイルに格納されている場合、キャッシュはキャッシュが管理する一時ディレクトリ内のファイルにデータをコピーする。コピーは最終的にキャッシュによって削除される。本関数はアプリケーションを起動するためにファイル名が必要な状況でのみ使用することを推奨する。ほとんどの場合、RetrieveUrlCacheEntryStream
および関連するストリーム関数を使用すべきである。WinINet API の他のすべての側面と同様に、本関数は DllMain
やグローバルオブジェクトのコンストラクタ・デストラクタの中から安全に呼び出すことはできない。注意: WinINet
はサーバー実装をサポートしていない。さらに、サービスから使用すべきでもない。サーバー実装やサービスでは Microsoft Windows
HTTP Services (WinHTTP) を使用すること。
> [!NOTE] > wininet.h ヘッダーは RetrieveUrlCacheEntryFile
をエイリアスとして定義しており、UNICODE プリプロセッサ定数の定義に基づいて本関数の ANSI 版または Unicode
版を自動的に選択する。エンコーディング中立のエイリアスとエンコーディング中立でないコードを混在させると、コンパイルエラーや実行時エラーの原因となるミスマッチが発生する可能性がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照のこと。


%index
RetrieveUrlCacheEntryStreamW
キャッシュデータにアクセスするための、最も効率的で実装非依存な手段を提供する。(Unicode)
%prm
lpszUrlName, lpCacheEntryInfo, lpcbCacheEntryInfo, fRandomRead, dwReserved
lpszUrlName : [wstr] キャッシュエントリのソース名を格納した null 終端文字列へのポインタ。これは一意な名前でなければならない。名前文字列にエスケープ文字を含めてはならない。
lpCacheEntryInfo : [var] キャッシュエントリの情報を受け取る INTERNET_CACHE_ENTRY_INFO 構造体へのポインタ。
lpcbCacheEntryInfo : [var] lpCacheEntryInfo バッファのサイズ (バイト単位) を指定する変数へのポインタ。関数が戻ると、変数にはバッファにコピーされたバイト数、またはバッファに必要なサイズ (バイト単位) が格納される。本バッファサイズは INTERNET_CACHE_ENTRY_INFO 構造体と、その直後に格納される関連文字列の両方を収容できなければならない点に注意。
fRandomRead : [int] ストリームをランダムアクセス用に開くかどうか。ランダムアクセス用にストリームを開くにはフラグを TRUE に設定する。
dwReserved : [int] 本パラメータは予約されており、0 を指定しなければならない。
%inst
キャッシュデータにアクセスするための、最も効率的で実装非依存な手段を提供する。(Unicode)

[戻り値]
関数が成功した場合、戻り値は ReadUrlCacheEntryStream および UnlockUrlCacheEntryStream
関数で使用できる有効なハンドルである。関数が失敗した場合、戻り値は NULL である。拡張エラー情報を取得するには
GetLastError を呼び出す。想定されるエラー値には次のものがある。
（以下省略）

[備考]
RetrieveUrlCacheEntryStream は URL の解析を一切行わないため、アンカー (#) を含む URL
は、リソースがキャッシュされていてもキャッシュ内で見つからない。例えば
http://adatum.com/example.htm#sample
を渡した場合、http://adatum.com/example.htm がキャッシュにあっても関数は
ERROR_FILE_NOT_FOUND を返す。ファイル形式での URL データが必要ないキャッシュクライアントは、特定の URL
のデータにアクセスするために本関数を使用すべきである。WinINet API の他のすべての側面と同様に、本関数は DllMain
やグローバルオブジェクトのコンストラクタ・デストラクタの中から安全に呼び出すことはできない。注意: WinINet
はサーバー実装をサポートしていない。さらに、サービスから使用すべきでもない。サーバー実装やサービスでは Microsoft Windows
HTTP Services (WinHTTP) を使用すること。
> [!NOTE] > wininet.h ヘッダーは RetrieveUrlCacheEntryStream
をエイリアスとして定義しており、UNICODE プリプロセッサ定数の定義に基づいて本関数の ANSI 版または Unicode
版を自動的に選択する。エンコーディング中立のエイリアスとエンコーディング中立でないコードを混在させると、コンパイルエラーや実行時エラーの原因となるミスマッチが発生する可能性がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照のこと。


%index
RunOnceUrlCache
(no summary)
%prm
hwnd, hinst, lpszCmd, nCmdShow
hwnd : [intptr] 
hinst : [intptr] 
lpszCmd : [str] 
nCmdShow : [int] 
%inst



%index
SetUrlCacheConfigInfoW
(no summary)
%prm
lpCacheConfigInfo, dwFieldControl
lpCacheConfigInfo : [var] 
dwFieldControl : [int] 
%inst



%index
SetUrlCacheEntryGroup
SetUrlCacheEntryGroup 関数 (wininet.h) はキャッシュグループへエントリを追加するか、キャッシュグループからエントリを削除する。
%prm
lpszUrlName, dwFlags, GroupId, pbGroupAttributes, cbGroupAttributes, lpReserved
lpszUrlName : [str] キャッシュされたリソースの URL を指定する null 終端文字列値へのポインタ。
dwFlags : [int] 
GroupId : [int64] エントリを追加または削除する対象のキャッシュグループの識別子。
pbGroupAttributes : [var] 本パラメータは予約されており、NULL を指定しなければならない。
cbGroupAttributes : [int] 本パラメータは予約されており、0 を指定しなければならない。
lpReserved : [intptr] 本パラメータは予約されており、NULL を指定しなければならない。
%inst
SetUrlCacheEntryGroup 関数 (wininet.h)
はキャッシュグループへエントリを追加するか、キャッシュグループからエントリを削除する。

[戻り値]
成功した場合は TRUE を、失敗した場合は FALSE を返す。

[備考]
キャッシュエントリは複数のキャッシュグループに属することができる。WinINet API の他のすべての側面と同様に、本関数は
DllMain やグローバルオブジェクトのコンストラクタ・デストラクタの中から安全に呼び出すことはできない。注意: WinINet
はサーバー実装をサポートしていない。さらに、サービスから使用すべきでもない。サーバー実装やサービスでは Microsoft Windows
HTTP Services (WinHTTP) を使用すること。


%index
SetUrlCacheEntryInfoW
INTERNET_CACHE_ENTRY_INFO 構造体の指定したメンバを設定する。(Unicode)
%prm
lpszUrlName, lpCacheEntryInfo, dwFieldControl
lpszUrlName : [wstr] キャッシュエントリの名前を指定する null 終端文字列へのポインタ。名前文字列にエスケープ文字を含めてはならない。
lpCacheEntryInfo : [var] lpszUrlName で指定されたキャッシュエントリに割り当てる値を含む INTERNET_CACHE_ENTRY_INFO 構造体へのポインタ。
dwFieldControl : [int] 
%inst
INTERNET_CACHE_ENTRY_INFO 構造体の指定したメンバを設定する。(Unicode)

[戻り値]
成功した場合は TRUE を、失敗した場合は FALSE を返す。拡張エラー情報を取得するには GetLastError
を呼び出す。想定されるエラー値は以下のとおりである。
（以下省略）

[備考]
注意: WinINet はサーバー実装をサポートしていない。さらに、サービスから使用すべきでもない。サーバー実装やサービスでは
Microsoft Windows HTTP Services (WinHTTP) を使用すること。
> [!NOTE] > wininet.h ヘッダーは SetUrlCacheEntryInfo
をエイリアスとして定義しており、UNICODE プリプロセッサ定数の定義に基づいて本関数の ANSI 版または Unicode
版を自動的に選択する。エンコーディング中立のエイリアスとエンコーディング中立でないコードを混在させると、コンパイルエラーや実行時エラーの原因となるミスマッチが発生する可能性がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照のこと。


%index
SetUrlCacheGroupAttributeW
指定したキャッシュグループの属性情報を設定する。(Unicode)
%prm
gid, dwFlags, dwAttributes, lpGroupInfo, lpReserved
gid : [int64] キャッシュグループの識別子。
dwFlags : [int] 本パラメータは予約されており、0 を指定しなければならない。
dwAttributes : [int] 
lpGroupInfo : [var] 格納する属性情報を指定する INTERNET_CACHE_GROUP_INFO 構造体へのポインタ。
lpReserved : [intptr] 本パラメータは予約されており、NULL を指定しなければならない。
%inst
指定したキャッシュグループの属性情報を設定する。(Unicode)

[戻り値]
成功した場合は TRUE を、失敗した場合は FALSE を返す。具体的なエラー情報を取得するには GetLastError を呼び出す。

[備考]
注意: WinINet はサーバー実装をサポートしていない。さらに、サービスから使用すべきでもない。サーバー実装やサービスでは
Microsoft Windows HTTP Services (WinHTTP) を使用すること。
> [!NOTE] > wininet.h ヘッダーは SetUrlCacheGroupAttribute
をエイリアスとして定義しており、UNICODE プリプロセッサ定数の定義に基づいて本関数の ANSI 版または Unicode
版を自動的に選択する。エンコーディング中立のエイリアスとエンコーディング中立でないコードを混在させると、コンパイルエラーや実行時エラーの原因となるミスマッチが発生する可能性がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照のこと。


%index
SetUrlCacheHeaderData
(no summary)
%prm
nIdx, dwData
nIdx : [int] 
dwData : [int] 
%inst



%index
ShowClientAuthCerts
(no summary)
%prm
hWndParent
hWndParent : [intptr] 
%inst



%index
ShowSecurityInfo
(no summary)
%prm
hWndParent, pSecurityInfo
hWndParent : [intptr] 
pSecurityInfo : [var] 
%inst



%index
ShowX509EncodedCertificate
(no summary)
%prm
hWndParent, lpCert, cbCert
hWndParent : [intptr] 
lpCert : [var] 
cbCert : [int] 
%inst



%index
UnlockUrlCacheEntryFile
UnlockUrlCacheEntryFile 関数 (wininet.h) は、キャッシュからの使用のためにファイルが取得される際にロックされたキャッシュエントリのロックを解除する。
%prm
lpszUrlName, dwReserved
lpszUrlName : [str] ロックを解除するキャッシュエントリのソース名を指定する null 終端文字列へのポインタ。名前文字列にエスケープ文字を含めてはならない。
dwReserved : [int] 本パラメータは予約されており、0 を指定しなければならない。
%inst
UnlockUrlCacheEntryFile 関数 (wininet.h)
は、キャッシュからの使用のためにファイルが取得される際にロックされたキャッシュエントリのロックを解除する。

[戻り値]
成功した場合は TRUE を、失敗した場合は FALSE を返す。拡張エラー情報を取得するには GetLastError
を呼び出す。ERROR_FILE_NOT_FOUND
は、ソース名で指定されたキャッシュエントリがキャッシュストレージ内に見つからないことを示す。

[備考]

本関数を呼び出した後、アプリケーションはファイルにアクセスすべきではない。本関数が戻ると、キャッシュマネージャはキャッシュエントリを自由に削除できる。WinINet
API の他のすべての側面と同様に、本関数は DllMain
やグローバルオブジェクトのコンストラクタ・デストラクタの中から安全に呼び出すことはできない。注意: WinINet
はサーバー実装をサポートしていない。さらに、サービスから使用すべきでもない。サーバー実装やサービスでは Microsoft Windows
HTTP Services (WinHTTP) を使用すること。


%index
UnlockUrlCacheEntryStream
RetrieveUrlCacheEntryStream 関数を使用して取得されたストリームを閉じる。
%prm
hUrlCacheStream, Reserved
hUrlCacheStream : [intptr] RetrieveUrlCacheEntryStream 関数によって返されたハンドル。
Reserved : [int] 本パラメータは予約されており、NULL を指定しなければならない。
%inst
RetrieveUrlCacheEntryStream 関数を使用して取得されたストリームを閉じる。

[戻り値]
成功した場合は TRUE を、失敗した場合は FALSE を返す。拡張エラー情報を取得するには GetLastError を呼び出す。

[備考]
注意: WinINet はサーバー実装をサポートしていない。さらに、サービスから使用すべきでもない。サーバー実装やサービスでは
Microsoft Windows HTTP Services (WinHTTP) を使用すること。


%index
UpdateUrlCacheContentPath
(no summary)
%prm
szNewPath
szNewPath : [str] 
%inst



%index
UrlCacheCheckEntriesExist
(no summary)
%prm
rgpwszUrls, cEntries, rgfExist
rgpwszUrls : [var] 
cEntries : [int] 
rgfExist : [var] 
%inst



%index
UrlCacheCloseEntryHandle
(no summary)
%prm
hEntryFile
hEntryFile : [intptr] 
%inst



%index
UrlCacheContainerSetEntryMaximumAge
(no summary)
%prm
pwszPrefix, dwEntryMaxAge
pwszPrefix : [wstr] 
dwEntryMaxAge : [int] 
%inst



%index
UrlCacheCreateContainer
(no summary)
%prm
pwszName, pwszPrefix, pwszDirectory, ullLimit, dwOptions
pwszName : [wstr] 
pwszPrefix : [wstr] 
pwszDirectory : [wstr] 
ullLimit : [int64] 
dwOptions : [int] 
%inst



%index
UrlCacheFindFirstEntry
(no summary)
%prm
pwszPrefix, dwFlags, dwFilter, GroupId, pCacheEntryInfo, phFind
pwszPrefix : [wstr] 
dwFlags : [int] 
dwFilter : [int] 
GroupId : [int64] 
pCacheEntryInfo : [var] 
phFind : [intptr] 
%inst



%index
UrlCacheFindNextEntry
(no summary)
%prm
hFind, pCacheEntryInfo
hFind : [intptr] 
pCacheEntryInfo : [var] 
%inst



%index
UrlCacheFreeEntryInfo
(no summary)
%prm
pCacheEntryInfo
pCacheEntryInfo : [var] 
%inst



%index
UrlCacheFreeGlobalSpace
(no summary)
%prm
ullTargetSize, dwFilter
ullTargetSize : [int64] 
dwFilter : [int] 
%inst



%index
UrlCacheGetContentPaths
(no summary)
%prm
pppwszDirectories, pcDirectories
pppwszDirectories : [var] 
pcDirectories : [var] 
%inst



%index
UrlCacheGetEntryInfo
(no summary)
%prm
hAppCache, pcwszUrl, pCacheEntryInfo
hAppCache : [intptr] 
pcwszUrl : [wstr] 
pCacheEntryInfo : [var] 
%inst



%index
UrlCacheGetGlobalCacheSize
(no summary)
%prm
dwFilter, pullSize, pullLimit
dwFilter : [int] 
pullSize : [var] 
pullLimit : [var] 
%inst



%index
UrlCacheGetGlobalLimit
(no summary)
%prm
limitType, pullLimit
limitType : [int] 
pullLimit : [var] 
%inst



%index
UrlCacheReadEntryStream
(no summary)
%prm
hUrlCacheStream, ullLocation, pBuffer, dwBufferLen, pdwBufferLen
hUrlCacheStream : [intptr] 
ullLocation : [int64] 
pBuffer : [intptr] 
dwBufferLen : [int] 
pdwBufferLen : [var] 
%inst



%index
UrlCacheReloadSettings
(no summary)
%prm

%inst



%index
UrlCacheRetrieveEntryFile
(no summary)
%prm
hAppCache, pcwszUrl, pCacheEntryInfo, phEntryFile
hAppCache : [intptr] 
pcwszUrl : [wstr] 
pCacheEntryInfo : [var] 
phEntryFile : [var] 
%inst



%index
UrlCacheRetrieveEntryStream
(no summary)
%prm
hAppCache, pcwszUrl, fRandomRead, pCacheEntryInfo, phEntryStream
hAppCache : [intptr] 
pcwszUrl : [wstr] 
fRandomRead : [int] 
pCacheEntryInfo : [var] 
phEntryStream : [var] 
%inst



%index
UrlCacheServer
(no summary)
%prm

%inst



%index
UrlCacheSetGlobalLimit
(no summary)
%prm
limitType, ullLimit
limitType : [int] 
ullLimit : [int64] 
%inst



%index
UrlCacheUpdateEntryExtraData
(no summary)
%prm
hAppCache, pcwszUrl, pbExtraData, cbExtraData
hAppCache : [intptr] 
pcwszUrl : [wstr] 
pbExtraData : [var] 
cbExtraData : [int] 
%inst


