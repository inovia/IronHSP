; ============================================================
;   httpapi.dll ヘルプ (CsWin32 / win32metadata から自動抽出)
;   docs_ja.json に日本語訳があればそちらを使用、無ければ英語原文。
;   翻訳を追加するときは docs_ja.json を編集して再生成。
; ============================================================

%index
HttpAddFragmentToCache
HttpAddFragmentToCache 関数は指定された名前でデータフラグメントをキャッシュし、後から取得できるようにする。または既存のキャッシュを更新する。
%group
Win32 httpapi
%prm
RequestQueueHandle, UrlPrefix, DataChunk, CachePolicy, Overlapped
RequestQueueHandle : [intptr] このキャッシュが関連付けられるリクエストキューへのハンドル。リクエストキューは HttpCreateRequestQueue 関数で作成される。Windows Server 2003 SP1 および Windows XP SP2 ではハンドルは HttpCreateHttpHandle により作成される。
UrlPrefix : [wstr] HttpSendHttpResponse で後から参照するためにアプリケーションが使用する UrlPrefix 文字列へのポインタ。アプリケーションは事前に同じリクエストキューハンドルに対してこの UrlPrefix または妥当な接頭辞を HttpAddUrl で登録しておく必要がある。この文字列は "scheme://host:port/relativeURI" の形式 (例: `http://www.mysite.com:80/image1.gif`) でなければならない。
DataChunk : [var] pUrlPrefix で指定する名前のもとにキャッシュするエンティティボディデータブロックを指定する HTTP_DATA_CHUNK 構造体へのポインタ。
CachePolicy : [var] このデータフラグメントをどのようにキャッシュすべきかを指定する HTTP_CACHE_POLICY 構造体へのポインタ。
Overlapped : [var] 非同期呼び出しの場合は pOverlapped に OVERLAPPED 構造体へのポインタを設定する。同期呼び出しの場合は NULL に設定する。同期呼び出しはキャッシュ操作が完了するまで呼び出し元スレッドをブロックする。非同期呼び出しは直ちに ERROR_IO_PENDING を返し、呼び出し元は GetOverlappedResult または I/O 完了ポートを使って完了を判定する。
%inst
HttpAddFragmentToCache
関数は指定された名前でデータフラグメントをキャッシュし、後から取得できるようにする。または既存のキャッシュを更新する。

[戻り値]
関数が成功すると戻り値は NO_ERROR となる。非同期で使用された場合、ERROR_IO_PENDING
はキャッシュ要求がキューに入れられ後で通常の重複 I/O
完了機構により完了することを示す。関数が失敗した場合、戻り値は次のいずれかのエラーコードとなる。このドキュメントは省略されている。


%index
HttpAddUrl
指定された URL を登録し、合致するリクエストが HTTP Server API の指定リクエストキューにルーティングされるようにする。
%group
Win32 httpapi
%prm
RequestQueueHandle, FullyQualifiedUrl, Reserved
RequestQueueHandle : [intptr] 指定 URL へのリクエストをルーティングするリクエストキューへのハンドル。リクエストキューは HttpCreateRequestQueue 関数で作成される。Windows Server 2003 SP1 および Windows XP SP2 ではハンドルは HttpCreateHttpHandle により作成される。
FullyQualifiedUrl : [wstr] 登録する URL を識別する、正しく形成された UrlPrefix 文字列を含む Unicode 文字列へのポインタ。
Reserved : [intptr] 予約されている。NULL でなければならない。
%inst
指定された URL を登録し、合致するリクエストが HTTP Server API の指定リクエストキューにルーティングされるようにする。

[戻り値]
関数が成功すると戻り値は NO_ERROR
となる。関数が失敗した場合、戻り値は次のいずれかのエラーコードとなる。このドキュメントは省略されている。

[備考]
UrlPrefix 文字列トピックにあるとおり、登録する UrlPrefix のスキーム指定は小文字の "http" か "https"
のみ有効である。同一ポートで異なるスキームの URL を登録することはできない ("http" と "https"
は同一ポート上で共存できない)。HttpAddUrl は文字列が正しく形成されている限り渡された UrlPrefix
を登録する。指定された URL 名前空間の存在・アクセス可否・所有権等の検証はアプリケーション側で行う必要がある。HttpAddUrl
による登録で確保したリソースを解放するには、名前空間の利用が終わった時点で対応する HttpRemoveUrl を呼び出す。


%index
HttpAddUrlToUrlGroup
URL グループ ID で識別される URL グループに指定 URL を追加する。
%group
Win32 httpapi
%prm
UrlGroupId, pFullyQualifiedUrl, UrlContext, Reserved
UrlGroupId : [int64] 指定 URL へのリクエストをルーティングする URL グループのグループ ID。URL グループは HttpCreateUrlGroup 関数で作成される。
pFullyQualifiedUrl : [wstr] 登録する URL を識別する、正しく形成された UrlPrefix 文字列を含む Unicode 文字列へのポインタ。管理者として実行していない場合は 1024 より大きいポート番号を指定すること。そうでない場合 ERROR_ACCESS_DENIED が発生する可能性がある。
UrlContext : [int64] この呼び出しで登録される URL に関連付けられるコンテキスト。URL コンテキストは pFullyQualifiedUrl で指定された URL で受信される全てのリクエストの HTTP_REQUEST 構造体で返される。
Reserved : [int] 予約されている。0 でなければならない。
%inst
URL グループ ID で識別される URL グループに指定 URL を追加する。

[戻り値]
関数が成功すると NO_ERROR を返す。関数が失敗した場合、次のいずれかのエラーコードを返す。このドキュメントは省略されている。

[備考]
HTTP Server API はバージョン 1.0 の URL 登録を使用する既存アプリケーションをサポートするが、新規開発では
HttpAddUrlToUrlGroup を使用すべきで、HttpAddUrl
は使用すべきではない。HttpAddUrlToUrlGroup を繰り返し呼ぶことで URL グループに複数の URL
を追加できる。合致するリクエストは URL グループに関連付けられたリクエストキューにルーティングされる。


%index
HttpCancelHttpRequest
HttpCancelHttpRequest 関数は指定されたリクエストをキャンセルする。
%group
Win32 httpapi
%prm
RequestQueueHandle, RequestId, Overlapped
RequestQueueHandle : [intptr] リクエスト元のリクエストキューへのハンドル。
RequestId : [int64] キャンセルするリクエストの ID。
Overlapped : [var] 非同期呼び出しの場合は pOverlapped に OVERLAPPED 構造体へのポインタを設定する。同期呼び出しの場合は NULL にする。
%inst
HttpCancelHttpRequest 関数は指定されたリクエストをキャンセルする。

[戻り値]
関数が成功すると NO_ERROR を返す。

[備考]
**HttpCancelHttpRequest**
関数でリクエストをキャンセルすると、そのリクエストに使われていた基礎トランスポート接続は閉じられる。


%index
HttpCloseRequestQueue
HttpCreateRequestQueue で作成された指定リクエストキューのハンドルを閉じる。
%group
Win32 httpapi
%prm
RequestQueueHandle
RequestQueueHandle : [intptr] 閉じるリクエストキューへのハンドル。リクエストキューは HttpCreateRequestQueue 関数で作成される。
%inst
HttpCreateRequestQueue で作成された指定リクエストキューのハンドルを閉じる。

[戻り値]
関数が成功すると NO_ERROR を返す。関数が失敗した場合、次のいずれかのエラーコードを返す。このドキュメントは省略されている。

[備考]
アプリケーションはリクエストキューハンドルに対して CloseHandle を呼んではならない。代わりに
HttpCloseRequestQueue を呼び、全リソースが解放されるようにすること。


%index
HttpCloseServerSession
サーバーセッション ID で識別されるサーバーセッションを削除する。
%group
Win32 httpapi
%prm
ServerSessionId
ServerSessionId : [int64] 閉じるサーバーセッションの ID。
%inst
サーバーセッション ID で識別されるサーバーセッションを削除する。

[戻り値]
関数が成功すると NO_ERROR
を返す。関数が失敗した場合、次のいずれかのエラーコードを返す可能性がある。このドキュメントは省略されている。

[備考]
アプリケーションはサーバーセッションを閉じる前に HttpCloseUrlGroup を呼び、そのサーバーセッションに関連付けられた全
URL グループを閉じておく必要がある。


%index
HttpCloseUrlGroup
URL グループ ID で識別される URL グループを閉じる。
%group
Win32 httpapi
%prm
UrlGroupId
UrlGroupId : [int64] 削除する URL グループの ID。
%inst
URL グループ ID で識別される URL グループを閉じる。

[戻り値]
関数が成功すると NO_ERROR を返す。関数が失敗した場合、次のいずれかのエラーコードを返す。このドキュメントは省略されている。

[備考]
アプリケーションは HttpCloseServerSession を呼ぶ前に HttpCloseUrlGroup
を呼び、サーバーセッションに関連付けられた全 URL グループを閉じておく必要がある。


%index
HttpCreateHttpHandle
呼び出し元アプリケーション用の HTTP リクエストキューを作成し、そのハンドルを返す。
%group
Win32 httpapi
%prm
RequestQueueHandle, Reserved
RequestQueueHandle : [intptr] リクエストキューへのハンドルを受け取る変数へのポインタ。
Reserved : [int] 予約されている。0 でなければならない。
%inst
呼び出し元アプリケーション用の HTTP リクエストキューを作成し、そのハンドルを返す。

[戻り値]
関数が成功すると戻り値は NO_ERROR
となる。関数が失敗した場合、戻り値は次のいずれかのエラーコードとなる。このドキュメントは省略されている。

[備考]
リクエストキューにより呼び出し元アプリケーションは特定の URL に対するリクエストを受け取れるようになる。受信したい URL は
HttpAddUrl
関数で指定する。リクエスト受信には単一のリクエストキューを使うべきである。単一プロセスから複数のリクエストキューを使っても応答時間やスループットは向上しない。受信が終わったら
CloseHandle でハンドルを閉じる。


%index
HttpCreateRequestQueue
新しいリクエストキューを作成するか、既存のリクエストキューを開く。
%group
Win32 httpapi
%prm
Version, Name, SecurityAttributes, Flags, RequestQueueHandle
Version : [var] リクエストキューのバージョンを示す HTTPAPI_VERSION 構造体。バージョン 2.0 の場合は構造体をインスタンス化し事前定義値 HTTPAPI_VERSION_2 に設定してから渡す。バージョンは 2.0 でなければならない。HttpCreateRequestQueue は 1.0 のリクエストキューをサポートしない。
Name : [wstr] リクエストキューの名前。バイト長は MAX_PATH を超えてはならない。オプションの名前は他プロセスが名前でキューにアクセスできるようにする。
SecurityAttributes : [var] リクエストキューのアクセス権を含む SECURITY_ATTRIBUTES 構造体へのポインタ。既存リクエストキューを開く場合は NULL でなければならない。
Flags : [int] Flags パラメータはリクエストキューのスコープを定義する。次の値を 1 つ以上指定できる。このドキュメントは省略されている。
RequestQueueHandle : [intptr] リクエストキューへのハンドルを受け取る変数へのポインタ。有効なポインタが必要で、NULL にはできない。
%inst
新しいリクエストキューを作成するか、既存のリクエストキューを開く。

[戻り値]
関数が成功すると NO_ERROR を返す。関数が失敗した場合、次のいずれかのエラーコードを返す。このドキュメントは省略されている。

[備考]
HTTP Server API は 1.0 のリクエストキューを使う既存アプリケーションをサポートするが、新規開発では
HttpCreateRequestQueue を使用すべきで、HttpCreateHttpHandle は使用すべきではない。バージョン
2.0 API は HttpCreateRequestQueue で作成された 2.0 リクエストキューとのみ互換である。バージョン 2
のリクエストキューは手動構成が必要で、アプリケーションは URL グループを作成し HttpSetUrlGroupProperty で
HttpServerBindingProperty を設定してキューと関連付ける必要がある。リクエストキューの設定は
HttpSetRequestQueueProperty を呼んで Property パラメータに希望の設定を指定して行う。URL
グループの作成や構成については HttpCreateUrlGroup および HttpSetUrlGroupProperty
を参照。セキュリティ属性はリクエストキューを作成するときだけ pSecurityAttributes
に指定できる。キューを作成したアプリケーションのみが ACL を設定でき、他プロセスに開閉・受信・応答の権限を付与できる。デフォルトでは
ACL で許可されない限りアプリケーションはキューを開けない。作成プロセスは
HTTP_CREATE_REQUEST_QUEUE_FLAG_CONTROLLER
を使って自身がリクエストを受信しないことを示せる。HttpCreateRequestQueue では
HTTP_CREATE_REQUEST_QUEUE_FLAG_OPEN_EXISTING で既存キューを開ける。作成プロセスのみが
HttpSetRequestQueueProperty でプロパティを設定できる。HttpCreateRequestQueue
で作成したハンドルはアプリ終了前またはセッション不要時に HttpCloseRequestQueue
で閉じる必要がある。HttpCreateRequestQueue 呼び出し前に HttpInitialize を呼び出すこと。


%index
HttpCreateServerSession
指定されたバージョンのサーバーセッションを作成する。
%group
Win32 httpapi
%prm
Version, ServerSessionId, Reserved
Version : [var] サーバーセッションのバージョンを示す HTTPAPI_VERSION 構造体。バージョン 2.0 の場合は構造体をインスタンス化し HTTPAPI_VERSION_2 に設定してから渡す。バージョンは 2.0 でなければならない。HttpCreateServerSession は 1.0 のリクエストキューをサポートしない。
ServerSessionId : [var] サーバーセッションの ID を受け取る変数へのポインタ。
Reserved : [int] 予約されている。0 でなければならない。
%inst
指定されたバージョンのサーバーセッションを作成する。

[戻り値]
関数が成功すると NO_ERROR を返す。関数が失敗した場合、次のいずれかのエラーコードを返す。このドキュメントは省略されている。

[備考]
サーバーセッションは URL グループの集合を所有する。これは配下の全 URL
グループに適用される設定情報のトップレベルコンテナである。サーバーセッションの設定については
HttpSetServerSessionProperty を参照。HTTP Server API はサーバーセッションに対する非同期
I/O をサポートしない。サーバーセッションが不要になるかアプリケーション終了前に HttpCloseServerSession
で削除すること。サーバーセッションを削除すると関連する全 URL グループも自動的に削除される。


%index
HttpCreateUrlGroup
指定サーバーセッション配下に URL グループを作成する。
%group
Win32 httpapi
%prm
ServerSessionId, pUrlGroupId, Reserved
ServerSessionId : [int64] URL グループを作成するサーバーセッションの識別子。
pUrlGroupId : [var] URL グループの ID を受け取る変数へのポインタ。
Reserved : [int] 予約されている。0 でなければならない。
%inst
指定サーバーセッション配下に URL グループを作成する。

[戻り値]
関数が成功すると NO_ERROR を返す。関数が失敗した場合、次のいずれかのエラーコードを返す。このドキュメントは省略されている。

[備考]
URL グループは URL 集合のための設定コンテナで、サーバーセッションの配下に作成され、そのセッションの設定を継承する。URL
グループに設定を行うとサーバーセッションの設定を上書きする。設定については HttpSetUrlGroupProperty を参照。URL
グループを作成したらリクエストキューに関連付ける必要がある。HttpSetUrlGroupProperty で
HttpServerBindingProperty
を設定して関連付ける。このプロパティが設定されていないと合致リクエストはキューに配信されず、HTTP Server API は 503
応答を生成する。URL グループとリクエストキューの関連付けは動的である。サーバーセッションとの関連付けはセッションまたは URL
グループが削除されるまで変更できない。サーバーセッション削除時には全ての関連 URL グループも自動的に閉じられる。URL
グループは最初空で作成され、URL は HttpAddUrlToUrlGroup で追加する必要がある。このドキュメントは省略されている。


%index
HttpDeclarePush
HTTP サーバープッシュで使うリソース対サブリソースの関係を宣言する。プロトコル・接続・クライアント・ポリシーが許す場合、HTTP.sys は該当リソースに対する HTTP 2.0 サーバープッシュを実行する。
%group
Win32 httpapi
%prm
RequestQueueHandle, RequestId, Verb, Path, Query, Headers
RequestQueueHandle : [intptr] HttpCreateRequestQueue 関数が返した HTTP.sys リクエストキューへのハンドル。
RequestId : [int64] プッシュ操作を宣言するリクエストの不透明識別子。指定されたキューハンドルから来たリクエストでなければならない。
Verb : [int] プッシュ操作で使用する HTTP 動詞。HTTP.sys のプッシュ操作は HttpVerbGET と HttpVerbHEAD のみサポートする。
Path : [wstr] プッシュ対象リソースの URL のパス部。
Query : [str] プッシュ対象リソースの URL のクエリ部。先頭のクエスチョンマーク (?) は含めない。
Headers : [var] プッシュ操作のリクエストヘッダ。Host ヘッダを指定してはならない。HTTP.sys がクライアントの元リクエストに一致する Host 情報を自動生成・強制する。プッシュリクエストはエンティティボディを持てないため、非ゼロの Content-Length や Transfer-Encoding ヘッダは含められない。
%inst
HTTP
サーバープッシュで使うリソース対サブリソースの関係を宣言する。プロトコル・接続・クライアント・ポリシーが許す場合、HTTP.sys
は該当リソースに対する HTTP 2.0 サーバープッシュを実行する。

[戻り値]
関数が成功すると NO_ERROR を返す。関数が失敗した場合、WinError.h で定義されるシステムエラーコードを返す。

[備考]
クライアントが自身でサブリソースを発見するような応答バイトを送る前に HttpDeclarePush
を呼ぶこと。順序を守らないとサーバーのプッシュとクライアントの取得が競合し帯域を無駄にする可能性がある。サーバーアプリケーションは必要かつクライアントがまだキャッシュしていないと強く確信できるリソースに対してのみ
HttpDeclarePush を使用すべきである。そうでないと帯域と CPU を無駄に使う。


%index
HttpDelegateRequestEx
送信元リクエストキューから対象リクエストキューへリクエストを委譲する。
%group
Win32 httpapi
%prm
RequestQueueHandle, DelegateQueueHandle, RequestId, DelegateUrlGroupId, PropertyInfoSetSize, PropertyInfoSet
RequestQueueHandle : [intptr] 型: _In_ **HANDLE** 送信元リクエストキューへのハンドル。
DelegateQueueHandle : [intptr] 型: _In_ **HANDLE** 対象リクエストキューへのハンドル。
RequestId : [int64] 型: _In_ **HTTP_REQUEST_ID** HttpReceiveHttpRequest で受け取った一意なリクエスト ID。
DelegateUrlGroupId : [int64] 型: _In_ **HTTP_URL_GROUP_ID** 対象 URL グループの URL グループ ID。
PropertyInfoSetSize : [int] 型: _In_ **ULONG** PropertyInfoSet 配列のエントリ数。
PropertyInfoSet : [var] 型: _In_ **PHTTP_DELEGATE_REQUEST_PROPERTY_INFO** 委譲時にリクエストに設定するプロパティの配列。
%inst
送信元リクエストキューから対象リクエストキューへリクエストを委譲する。

[戻り値]
NTSTATUS 完了ステータスを含む **ULONG**。


%index
HttpDeleteServiceConfiguration
IP アドレスや SSL 証明書などの指定データを HTTP Server API 設定ストアから 1 レコードずつ削除する。
%group
Win32 httpapi
%prm
ServiceHandle, ConfigId, pConfigInformation, ConfigInformationLength, pOverlapped
ServiceHandle : [intptr] このパラメータは予約されており 0 でなければならない。
ConfigId : [int] 設定の型。HTTP_SERVICE_CONFIG_ID 列挙の値のいずれか。このドキュメントは省略されている。
pConfigInformation : [intptr] ConfigId で指定された設定種別に必要なデータを含むバッファへのポインタ。このドキュメントは省略されている。
ConfigInformationLength : [int] pConfigInformation バッファのサイズ (バイト単位)。
pOverlapped : [var] 将来の非同期操作のために予約されている。NULL に設定しなければならない。
%inst
IP アドレスや SSL 証明書などの指定データを HTTP Server API 設定ストアから 1 レコードずつ削除する。

[戻り値]
関数が成功すると NO_ERROR を返す。関数が失敗した場合、次のいずれかのエラーコードを返す。このドキュメントは省略されている。


%index
HttpFindUrlGroupId
URL とリクエストキューに対応する URL グループ ID を取得する。
%group
Win32 httpapi
%prm
FullyQualifiedUrl, RequestQueueHandle, UrlGroupId
FullyQualifiedUrl : [wstr] 型: _In_ **PCWSTR** URL グループを問い合わせる対象の URL。
RequestQueueHandle : [intptr] 型: _In_ **HANDLE** URL グループに関連付けられたリクエストキュー。
UrlGroupId : [var] 型: _Out_ **PHTTP_URL_GROUP_ID** 合致する URL グループ ID。
%inst
URL とリクエストキューに対応する URL グループ ID を取得する。

[戻り値]
NTSTATUS 完了ステータスを含む **ULONG**。


%index
HttpFlushResponseCache
指定リクエストキューに関連付けられた HTTP Server API キャッシュから、名前のサイト部が指定 UrlPrefix に一致する全応答フラグメントを削除する。
%group
Win32 httpapi
%prm
RequestQueueHandle, UrlPrefix, Flags, Overlapped
RequestQueueHandle : [intptr] このキャッシュが関連付けられるリクエストキューへのハンドル。リクエストキューは HttpCreateRequestQueue で作成される。Windows Server 2003 SP1 および Windows XP SP2 ではハンドルは HttpCreateHttpHandle により作成される。
UrlPrefix : [wstr] フラグメント名のサイト部と照合する UrlPrefix 文字列へのポインタ。アプリケーションは事前に HttpAddUrl でこの UrlPrefix または妥当な接頭辞を該当リクエストキューに追加し、HttpAddFragmentToCache で関連応答フラグメントをキャッシュしておく必要がある。
Flags : [int] 次のフラグを含められる。
Overlapped : [var] 非同期呼び出しの場合は pOverlapped に OVERLAPPED 構造体へのポインタを設定する。同期呼び出しの場合は NULL にする。同期呼び出しはキャッシュ操作完了までブロックし、非同期呼び出しは直ちに ERROR_IO_PENDING を返す。
%inst
指定リクエストキューに関連付けられた HTTP Server API キャッシュから、名前のサイト部が指定 UrlPrefix
に一致する全応答フラグメントを削除する。

[戻り値]
関数が成功すると戻り値は NO_ERROR となる。非同期で使用した場合 ERROR_IO_PENDING
はキャッシュ要求がキューに入れられたことを示す。関数が失敗した場合、戻り値は次のいずれかのエラーコードとなる。このドキュメントは省略されている。


%index
HttpGetExtension
(no summary)
%group
Win32 httpapi
%prm
Version, Extension, Buffer, BufferSize
Version : [var] 
Extension : [int] 
Buffer : [intptr] 
BufferSize : [int] 
%inst



%index
HttpInitialize
HttpInitialize 関数は HTTP Server API ドライバを初期化し、まだ開始されていなければ開始し、応答キュー作成その他の操作をサポートするためのデータ構造を確保する。
%group
Win32 httpapi
%prm
Version, Flags, pReserved
Version : [var] HTTP バージョン。このパラメータは HTTPAPI_VERSION 構造体である。現行バージョンの場合は構造体をインスタンス化し事前定義値 **HTTPAPI_VERSION_1** に設定してから渡す。
Flags : [int] 
pReserved : [intptr] このパラメータは予約されており NULL でなければならない。
%inst
HttpInitialize 関数は HTTP Server API
ドライバを初期化し、まだ開始されていなければ開始し、応答キュー作成その他の操作をサポートするためのデータ構造を確保する。

[戻り値]
関数が成功すると戻り値は **NO_ERROR**
となる。関数が失敗した場合、戻り値は次のいずれかのエラーコードとなる。このドキュメントは省略されている。

[備考]
アプリケーション終了時に HttpTerminate を呼ぶこと。HttpInitialize の Flags に渡したフラグは
HttpTerminate にも同様に渡す必要がある。各 HttpInitialize 呼び出しに対応する HttpTerminate
呼び出しがあれば、HttpInitialize は繰り返し呼び出せる。


%index
HttpIsFeatureSupported
特定の機能がサポートされているかを調べる。
%group
Win32 httpapi
%prm
FeatureId
FeatureId : [int] 型: _In_ **HTTP_FEATURE_ID** 機能の識別子。
%inst
特定の機能がサポートされているかを調べる。

[戻り値]
機能がサポートされていれば `TRUE`、そうでなければ `FALSE`。


%index
HttpPrepareUrl
非正規化な Unicode または punycode URL を解析・分析・正規化し、他の HTTP 関数で安全かつ有効に使える形にする。
%group
Win32 httpapi
%prm
Reserved, Flags, Url, PreparedUrl
Reserved : [intptr] 予約されている。NULL でなければならない。
Flags : [int] 予約されている。0 でなければならない。
Url : [wstr] 正規化されていない Unicode または punycode の URL を表す文字列へのポインタ。
PreparedUrl : [var] 出力成功時、正規化済み URL を表す文字列へのポインタ。注: PreparedUrl は HeapFree で解放する。
%inst
非正規化な Unicode または punycode URL を解析・分析・正規化し、他の HTTP 関数で安全かつ有効に使える形にする。

[戻り値]
関数が成功すると ERROR_SUCCESS を返す。関数が失敗した場合、次のいずれか、または WinError.h
で定義されるシステムエラーコードを返す。


%index
HttpQueryRequestQueueProperty
指定ハンドルのリクエストキューのプロパティを問い合わせる。
%group
Win32 httpapi
%prm
RequestQueueHandle, Property, PropertyInformation, PropertyInformationLength, Reserved1, ReturnLength, Reserved2
RequestQueueHandle : [intptr] 
Property : [int] 設定されるプロパティ種別を表す HTTP_SERVER_PROPERTY 列挙のメンバ。次のいずれか。このドキュメントは省略されている。
PropertyInformation : [intptr] プロパティ情報を受け取るバッファへのポインタ。このドキュメントは省略されている。
PropertyInformationLength : [int] pPropertyInformation が指すバッファの長さ (バイト単位)。
Reserved1 : [int] 予約されている。0 でなければならない。
ReturnLength : [var] pPropertyInformation バッファに返されるバイト数 (NULL でなければ)。出力バッファが小さすぎる場合、呼び出しは ERROR_MORE_DATA で失敗する。pReturnLength が指す値から呼び出し成功に必要なバッファ最小長を判定できる。
Reserved2 : [intptr] このパラメータは予約されており NULL でなければならない。
%inst
指定ハンドルのリクエストキューのプロパティを問い合わせる。

[戻り値]
関数が成功すると NO_ERROR を返す。関数が失敗した場合、次のいずれかのエラーコードを返す。このドキュメントは省略されている。


%index
HttpQueryServerSessionProperty
指定サーバーセッションのサーバープロパティを問い合わせる。
%group
Win32 httpapi
%prm
ServerSessionId, Property, PropertyInformation, PropertyInformationLength, ReturnLength
ServerSessionId : [int64] プロパティ設定を取得するサーバーセッション。
Property : [int] 問い合わせるプロパティ種別を表す HTTP_SERVER_PROPERTY 列挙のメンバ。次のいずれか。このドキュメントは省略されている。
PropertyInformation : [intptr] プロパティデータを受け取るバッファへのポインタ。このドキュメントは省略されている。
PropertyInformationLength : [int] pPropertyInformation が指すバッファの長さ (バイト単位)。
ReturnLength : [var] pPropertyInformation バッファに返されるバイト数。出力バッファが小さすぎる場合、ERROR_MORE_DATA で失敗する。pReturnLength で必要なバッファ最小長を判定できる。
%inst
指定サーバーセッションのサーバープロパティを問い合わせる。

[戻り値]
関数が成功すると NO_ERROR を返す。関数が失敗した場合、次のいずれかのエラーコードを返す。このドキュメントは省略されている。

[備考]
HttpServerLoggingProperty の問い合わせはサポートされていない。pPropertyInformation
はプロパティ種別の設定構造体を指す。PropertyInformationLength はその構造体のバイトサイズを指定する。例えば
HttpServerTimeoutsProperty を問い合わせる場合、pPropertyInformation は少なくとも
HTTP_TIMEOUT_LIMIT_INFO 構造体サイズのバッファを指す必要がある。HttpServerQosProperty
を指定するには HTTP_QOS_SETTING_INFO の QosType に HttpQosSettingTypeBandwidth
を設定し、その構造体へのポインタを渡す。


%index
HttpQueryServiceConfiguration
1 つ以上の HTTP Server API 設定レコードを取得する。
%group
Win32 httpapi
%prm
ServiceHandle, ConfigId, pInput, InputLength, pOutput, OutputLength, pReturnLength, pOverlapped
ServiceHandle : [intptr] 予約されている。0 でなければならない。
ConfigId : [int] 
pInput : [intptr] 問い合わせをさらに定義する構造体へのポインタで、型は ConfigId に応じる。このドキュメントは省略されている。
InputLength : [int] pInputConfigInfo バッファのサイズ (バイト単位)。
pOutput : [intptr] 問い合わせ結果を受け取るバッファへのポインタ。バッファ型は ConfigId に応じる。このドキュメントは省略されている。
OutputLength : [int] pOutputConfigInfo バッファのサイズ (バイト単位)。
pReturnLength : [var] 出力バッファに書き込まれるバイト数を受け取る変数へのポインタ。出力バッファが小さすぎる場合、ERROR_INSUFFICIENT_BUFFER で失敗する。pReturnLength から必要な最小長を判定できる。
pOverlapped : [var] 非同期操作のために予約されており NULL に設定しなければならない。
%inst
1 つ以上の HTTP Server API 設定レコードを取得する。

[戻り値]
関数が成功すると戻り値は NO_ERROR
となる。関数が失敗した場合、戻り値は次のいずれかのエラーコードとなる。このドキュメントは省略されている。


%index
HttpQueryUrlGroupProperty
指定 URL グループのプロパティを問い合わせる。
%group
Win32 httpapi
%prm
UrlGroupId, Property, PropertyInformation, PropertyInformationLength, ReturnLength
UrlGroupId : [int64] プロパティ設定を取得する URL グループの ID。
Property : [int] 問い合わせるプロパティ種別を表す HTTP_SERVER_PROPERTY 列挙のメンバ。次のいずれか。このドキュメントは省略されている。
PropertyInformation : [intptr] プロパティ情報を受け取るバッファへのポインタ。このドキュメントは省略されている。
PropertyInformationLength : [int] pPropertyInformation が指すバッファの長さ (バイト単位)。
ReturnLength : [var] pPropertyInformation バッファに返されるバイト数。出力バッファが小さすぎる場合、ERROR_MORE_DATA で失敗する。pReturnLength で必要な最小長を判定できる。
%inst
指定 URL グループのプロパティを問い合わせる。

[戻り値]
関数が成功すると NO_ERROR を返す。関数が失敗した場合、次のいずれかのエラーコードを返す。このドキュメントは省略されている。

[備考]
HttpServerLoggingProperty の問い合わせはサポートされていない。


%index
HttpReadFragmentFromCache
HttpReadFragmentFromCache 関数は HTTP Server API キャッシュから指定名の応答フラグメントを取得する。
%group
Win32 httpapi
%prm
RequestQueueHandle, UrlPrefix, ByteRange, Buffer, BufferLength, BytesRead, Overlapped
RequestQueueHandle : [intptr] 指定応答フラグメントが関連付けられたリクエストキューへのハンドル。リクエストキューは HttpCreateRequestQueue で作成される。Windows Server 2003 SP1 および Windows XP SP2 ではハンドルは HttpCreateHttpHandle により作成される。
UrlPrefix : [wstr] 取得するフラグメントの名前を含む UrlPrefix 文字列へのポインタ。これは過去の HttpAddFragmentToCache 成功呼び出しで使った UrlPrefix に一致する必要がある。
ByteRange : [var] 指定フラグメント内の開始オフセットと返すバイト数を示す HTTP_BYTE_RANGE 構造体への任意ポインタ。使用しない場合は NULL で、この場合フラグメント全体が返される。
Buffer : [intptr] 要求されたフラグメントをコピーするバッファへのポインタ。
BufferLength : [int] pBuffer バッファのサイズ (バイト単位)。
BytesRead : [var] 出力バッファに書き込まれるバイト数を受け取る任意の変数へのポインタ。BufferLength がこの数未満の場合、ERROR_INSUFFICIENT_BUFFER で失敗し、pBytesRead から必要な最小長を判定できる。pOverlapped を使う非同期呼び出しでは pBytesRead を NULL にする。それ以外の同期呼び出しでは有効なアドレスが必要である。
Overlapped : [var] 非同期呼び出しの場合は pOverlapped に OVERLAPPED 構造体へのポインタを設定する。同期呼び出しの場合は NULL にする。
%inst
HttpReadFragmentFromCache 関数は HTTP Server API
キャッシュから指定名の応答フラグメントを取得する。

[戻り値]
関数が成功すると戻り値は NO_ERROR となる。非同期の場合 ERROR_IO_PENDING
はキャッシュ要求がキューに入れられたことを示す。関数が失敗した場合、戻り値は次のいずれかのエラーコードとなる。このドキュメントは省略されている。


%index
HttpReceiveClientCertificate
HttpReceiveClientCertificate 関数はサーバーアプリケーションがクライアント SSL 証明書またはチャネルバインディングトークン (CBT) を取得するために使用する。
%group
Win32 httpapi
%prm
RequestQueueHandle, ConnectionId, Flags, SslClientCertInfo, SslClientCertInfoSize, BytesReceived, Overlapped
RequestQueueHandle : [intptr] 指定 SSL クライアントまたは CBT が関連付けられたリクエストキューへのハンドル。リクエストキューは HttpCreateRequestQueue で作成される。Windows Server 2003 SP1 および Windows XP SP2 ではハンドルは HttpCreateHttpHandle により作成される。
ConnectionId : [int64] クライアントへの接続を識別する値。HttpReceiveHttpRequest で取得した HTTP_REQUEST の ConnectionId メンバから得る。
Flags : [int] HttpReceiveClientCertificate の動作を変更する値。このドキュメントは省略されている。
SslClientCertInfo : [var] Flags が 0 の場合、このパラメータは HTTP_SSL_CLIENT_CERT_INFO 構造体を指し、関数はここに要求クライアント証明書情報を書き込む。バッファは HTTP_SSL_CLIENT_CERT_INFO 構造体とその CertEncodedSize メンバの値を合わせたサイズ以上が必要である。Flags が HTTP_RECEIVE_SECURE_CHANNEL_TOKEN の場合は HTTP_REQUEST_CHANNEL_BIND_STATUS 構造体を指し、そこに CBT 情報が書き込まれる。
SslClientCertInfoSize : [int] pSslClientCertInfo が指すバッファのサイズ (バイト単位)。
BytesReceived : [var] pSslClientCertInfo が指す構造体に書き込まれるバイト数を受け取る任意の変数へのポインタ。使用しない場合は NULL にする。pOverlapped で非同期呼び出しをする場合は NULL にし、それ以外 (pOverlapped が NULL) は有効なアドレスが必要である。
Overlapped : [var] 非同期呼び出しの場合は pOverlapped に OVERLAPPED 構造体へのポインタを設定する。同期呼び出しの場合は NULL にする。
%inst
HttpReceiveClientCertificate 関数はサーバーアプリケーションがクライアント SSL
証明書またはチャネルバインディングトークン (CBT) を取得するために使用する。

[戻り値]
このドキュメントは省略されている。

[備考]
HttpReceiveClientCertificate の動作はクライアント SSL
証明書を要求するかチャネルバインディングトークンを要求するかで変わる。同期呼び出しの場合、受信バイト数は pBytesReceived
が指す値で返される。非同期呼び出しの場合、受信バイト数は標準的な非同期機構で返される (GetOverlappedResult が返す
lpNumberOfBytesTransferred)。


%index
HttpReceiveHttpRequest
指定リクエストキューから次の利用可能な HTTP リクエストを同期または非同期で取得する。
%group
Win32 httpapi
%prm
RequestQueueHandle, RequestId, Flags, RequestBuffer, RequestBufferLength, BytesReturned, Overlapped
RequestQueueHandle : [intptr] 次に利用可能なリクエストを取得するリクエストキューへのハンドル。リクエストキューは HttpCreateRequestQueue で作成される。Windows Server 2003 SP1 および Windows XP SP2 ではハンドルは HttpCreateHttpHandle により作成される。
RequestId : [int64] 最初の呼び出し時は HTTP_NULL_ID を指定する。リクエスト全体を取得するのに複数回呼び出しが必要な場合は、pRequestBuffer が指す HTTP_REQUEST の RequestId メンバで返された値を RequestID に設定して HttpReceiveHttpRequest または HttpReceiveRequestEntityBody を呼び出す。
Flags : [int] 
RequestBuffer : [var] HTTP_REQUEST 構造体とエンティティボディがコピーされるバッファへのポインタ。HTTP_REQUEST.RequestId はこの HTTP リクエストの識別子を含み、後続の HttpReceiveRequestEntityBody、HttpSendHttpResponse、HttpSendResponseEntityBody で使用できる。
RequestBufferLength : [int] pRequestBuffer バッファのサイズ (バイト単位)。
BytesReturned : [var] 任意。エンティティボディまたはその残りのバイトサイズを受け取る変数へのポインタ。pOverlapped で非同期呼び出しをする場合は pBytesReceived を NULL にする。同期の場合は有効なアドレスが必要である。
Overlapped : [var] 非同期呼び出しの場合は pOverlapped に OVERLAPPED 構造体へのポインタを設定する。同期呼び出しの場合は NULL にする。同期呼び出しはリクエスト到着まで、あるいはその一部が取得されるまでブロックする。
%inst
指定リクエストキューから次の利用可能な HTTP リクエストを同期または非同期で取得する。

[戻り値]
関数が成功すると戻り値は NO_ERROR となる。非同期の場合 ERROR_IO_PENDING
は次のリクエストがまだ準備できていないことを示す。関数が失敗した場合、戻り値は次のいずれかのエラーコードとなる。このドキュメントは省略されている。

[備考]
1 つのリクエストを取得するのに複数回の呼び出しが必要になることがある。Flags が 0 の場合
HttpReceiveHttpRequest
はリクエストヘッダ構造体だけをバッファにコピーし、エンティティボディはコピーしない。エンティティボディは
HttpReceiveRequestEntityBody で取得するか、HttpReceiveHttpRequest
を再度呼ぶ。アプリが提供するバッファが小さすぎる場合もある。少なくとも 4 KB のバッファを用意することを推奨する (多くの HTTP
リクエストに対応する)。認証ヘッダは最大 12 KB 追加され得るので、認証/認可を使う場合は少なくとも 16 KB
を推奨する。HttpReceiveHttpRequest が ERROR_MORE_DATA を返した場合、最初の呼び出しで返された
HTTP_REQUEST.RequestId を渡しつつ ERROR_HANDLE_EOF が返るまで追加呼び出しを続ける。注:
アプリケーションは全関連リクエストヘッダ (コンテンツネゴシエーションヘッダを含む)
を検査し、必要に応じてリクエストを失敗させる必要がある。HttpReceiveHttpRequest
はヘッダ行の終端と不正文字非含有を保証するだけである。


%index
HttpReceiveRequestEntityBody
指定 HTTP リクエストの追加エンティティボディデータを受信する。
%group
Win32 httpapi
%prm
RequestQueueHandle, RequestId, Flags, EntityBuffer, EntityBufferLength, BytesReturned, Overlapped
RequestQueueHandle : [intptr] 指定エンティティボディデータを取得するリクエストキューへのハンドル。リクエストキューは HttpCreateRequestQueue で作成される。Windows Server 2003 SP1 および Windows XP SP2 ではハンドルは HttpCreateHttpHandle により作成される。
RequestId : [int64] 取得するエンティティボディを含む HTTP リクエストの識別子。HttpReceiveHttpRequest で返される HTTP_REQUEST の RequestId メンバの値。HTTP_NULL_ID は不可。
Flags : [int] 次のフラグ値を指定できる。Windows Server 2003 SP1 および Windows XP SP2 ではこのパラメータは予約されており 0 でなければならない。このドキュメントは省略されている。
EntityBuffer : [intptr] エンティティボディデータを受け取るバッファへのポインタ。
EntityBufferLength : [int] pBuffer が指すバッファのサイズ (バイト単位)。
BytesReturned : [var] 任意。pBuffer に返されるエンティティボディデータのバイトサイズを受け取る変数へのポインタ。非同期呼び出し時は NULL にし、同期呼び出し時は有効なアドレスが必要である。
Overlapped : [var] 非同期呼び出しの場合は pOverlapped に OVERLAPPED 構造体へのポインタを設定する。同期呼び出しの場合は NULL にする。
%inst
指定 HTTP リクエストの追加エンティティボディデータを受信する。

[戻り値]
関数が成功すると戻り値は NO_ERROR となる。非同期で使用した場合 ERROR_IO_PENDING
は次のリクエストがまだ準備できていないことを示す。関数が失敗した場合、戻り値は次のいずれかのエラーコードとなる。このドキュメントは省略されている。

[備考]
エンティティボディ全体を取得するには、新しいバッファを渡しながら関数が ERROR_HANDLE_EOF を返すまで
HttpReceiveRequestEntityBody
を呼び続ける。バッファ一杯のエンティティボディが正常にコピーされ、まだ残りがある場合は NO_ERROR を返す。


%index
HttpRemoveUrl
指定 UrlPrefix 文字列に合致するリクエストを指定リクエストキューにルーティングすることをシステムに停止させる。
%group
Win32 httpapi
%prm
RequestQueueHandle, FullyQualifiedUrl
RequestQueueHandle : [intptr] URL 登録を削除するリクエストキューへのハンドル。リクエストキューは HttpCreateRequestQueue で作成される。Windows Server 2003 SP1 および Windows XP SP2 ではハンドルは HttpCreateHttpHandle により作成される。
FullyQualifiedUrl : [wstr] 指定リクエストキューに登録された UrlPrefix 文字列へのポインタ。この文字列は HttpAddUrl に渡したものと完全一致しなければならない (IPv6 アドレスの表記揺れすら許されない)。
%inst
指定 UrlPrefix 文字列に合致するリクエストを指定リクエストキューにルーティングすることをシステムに停止させる。

[戻り値]
関数が成功すると戻り値は NO_ERROR
となる。関数が失敗した場合、戻り値は次のいずれかのエラーコードとなる。このドキュメントは省略されている。


%index
HttpRemoveUrlFromUrlGroup
URL グループ ID で識別されるグループから指定 URL を削除する。
%group
Win32 httpapi
%prm
UrlGroupId, pFullyQualifiedUrl, Flags
UrlGroupId : [int64] pFullyQualifiedUrl で指定された URL を削除する URL グループの ID。
pFullyQualifiedUrl : [wstr] 削除する URL を識別する、正しく形成された UrlPrefix 文字列を含む Unicode 文字列へのポインタ。Flags に HTTP_URL_FLAG_REMOVE_ALL を指定した場合は UrlGroupId の URL グループの全既存 URL 登録が削除される。この場合 pFullyQualifiedUrl は NULL でなければならない。
Flags : [int] 削除する URL を修飾する URL フラグ。次のいずれかのフラグを指定できる。このドキュメントは省略されている。
%inst
URL グループ ID で識別されるグループから指定 URL を削除する。

[戻り値]
関数が成功すると NO_ERROR を返す。関数が失敗した場合、次のいずれかのエラーコードを返す。このドキュメントは省略されている。

[備考]
HTTP Server API はバージョン 1.0 の URL 登録を使う既存アプリケーションをサポートするが、新規開発では
HttpRemoveUrlFromUrlGroup を使用すべきで HttpRemoveUrl は使用すべきではない。不要になった URL
は HttpAddUrlToUrlGroup で追加した URL を削除する。


%index
HttpSendHttpResponse
指定 HTTP リクエストに対する HTTP 応答を送信する。
%group
Win32 httpapi
%prm
RequestQueueHandle, RequestId, Flags, HttpResponse, CachePolicy, BytesSent, Reserved1, Reserved2, Overlapped, LogData
RequestQueueHandle : [intptr] 指定リクエストを取得したリクエストキューへのハンドル。リクエストキューは HttpCreateRequestQueue で作成される。Windows Server 2003 SP1 および Windows XP SP2 ではハンドルは HttpCreateHttpHandle により作成される。
RequestId : [int64] この応答が対応する HTTP リクエストの識別子。HttpReceiveHttpRequest で返される HTTP_REQUEST の RequestId メンバの値。HTTP_NULL_ID は不可。
Flags : [int] 次のフラグ値の組み合わせを指定できる。相互排他なものは明示される。このドキュメントは省略されている。
HttpResponse : [var] HTTP 応答を定義する HTTP_RESPONSE 構造体へのポインタ。
CachePolicy : [var] 応答をキャッシュするために使う HTTP_CACHE_POLICY 構造体へのポインタ。Windows Server 2003 SP1 および Windows XP SP2 ではこのパラメータは予約されており NULL でなければならない。
BytesSent : [var] 任意。同期動作時に送信したバイト数を受け取る変数へのポインタ。pOverlapped で非同期呼び出しをする場合は NULL にし、同期時は有効なアドレスが必要である。
Reserved1 : [intptr] 予約されている。NULL でなければならない。
Reserved2 : [int] 予約されている。0 でなければならない。
Overlapped : [var] 非同期呼び出しの場合は pOverlapped に OVERLAPPED 構造体へのポインタを設定する。同期呼び出しの場合は NULL にする。
LogData : [var] 応答のログ記録に使う HTTP_LOG_DATA 構造体へのポインタ。HTTP_LOG_FIELDS_DATA 構造体へのポインタを PHTTP_LOG_DATA にキャストして渡す。URL グループやサーバーセッションでログ記録が有効でも、アプリがログフィールドデータ構造体を渡さないとログされない。Windows Server 2003 および Windows XP SP2 ではこのパラメータは予約されており NULL でなければならない。Windows Vista および Windows Server 2008 で新規。
%inst
指定 HTTP リクエストに対する HTTP 応答を送信する。

[戻り値]
関数が成功すると NO_ERROR を返す。非同期で使用した場合 ERROR_IO_PENDING
は次のリクエストがまだ準備できていないことを示す。関数が失敗した場合、次のいずれかのエラーコードを返す。このドキュメントは省略されている。

[備考]
HttpSendHttpResponse は応答ヘッダを生成・送信するために使用し、必要に応じて
HttpSendResponseEntityBody でエンティティボディを送れる。Content-Length ヘッダも
Transfer-Encoding ヘッダも応答に含まれない場合、アプリケーションは
HTTP_SEND_RESPONSE_DISCONNECT
フラグで接続を明示的に閉じて応答終了を示す必要がある。HTTP_KNOWN_HEADER の HttpHeaderServer 識別子で
"Server:" ヘッダを指定すると、その値にスペースと "Microsoft-HTTPAPI/1.0" が続けて配置される。未指定なら
"Microsoft-HTTPAPI/1.0" がサーバーヘッダとして付けられる。注: 同一 RequestId に対し
HttpSendHttpResponse と HttpSendResponseEntityBody
を別スレッドから同時に呼んではならない。


%index
HttpSendResponseEntityBody
HTTP 応答に関連付けられたエンティティボディデータを送信する。
%group
Win32 httpapi
%prm
RequestQueueHandle, RequestId, Flags, EntityChunkCount, EntityChunks, BytesSent, Reserved1, Reserved2, Overlapped, LogData
RequestQueueHandle : [intptr] 指定リクエストを取得したリクエストキューへのハンドル。リクエストキューは HttpCreateRequestQueue で作成される。Windows Server 2003 SP1 および Windows XP SP2 ではハンドルは HttpCreateHttpHandle により作成される。
RequestId : [int64] この応答が対応する HTTP リクエストの識別子。HttpReceiveHttpRequest で返される HTTP_REQUEST の RequestId メンバの値。HTTP_NULL_ID は不可。
Flags : [int] 次の相互排他フラグ値のうち 1 つを含められるパラメータ。このドキュメントは省略されている。
EntityChunkCount : [int] pEntityChunks の配列内の構造体数。9999 を超えてはならない。
EntityChunks : [var] エンティティボディデータとして送る HTTP_DATA_CHUNK 構造体の配列へのポインタ。
BytesSent : [var] 任意。同期動作時に送信したバイト数を受け取る変数へのポインタ。非同期時は NULL にし、同期時は有効なアドレスが必要である。
Reserved1 : [intptr] 予約されている。NULL でなければならない。
Reserved2 : [int] 予約されている。0 でなければならない。
Overlapped : [var] 非同期呼び出しの場合は pOverlapped に OVERLAPPED 構造体へのポインタを設定する。同期呼び出しの場合は NULL にする。
LogData : [var] 応答のログ記録に使う HTTP_LOG_DATA 構造体へのポインタ。HTTP_LOG_FIELDS_DATA へのポインタを PHTTP_LOG_DATA にキャストして渡す。アプリがログフィールドデータ構造体を渡さないとログされない。Windows Server 2003 および Windows XP SP2 ではこのパラメータは予約されており NULL でなければならない。Windows Vista および Windows Server 2008 で新規。
%inst
HTTP 応答に関連付けられたエンティティボディデータを送信する。

[戻り値]
関数が成功すると戻り値は NO_ERROR となる。非同期で使用した場合 ERROR_IO_PENDING
は次のリクエストがまだ準備できていないことを示す。関数が失敗した場合、戻り値は次のいずれかのエラーコードとなる。このドキュメントは省略されている。

[備考]
Content-Length ヘッダも Transfer-Encoding
ヘッダも応答ヘッダに含まれない場合、HTTP_SEND_RESPONSE_DISCONNECT
フラグで接続を明示的に閉じて応答終了を示す必要がある。注: 同一 RequestId に対し
HttpSendResponseEntityBody (または HttpSendHttpResponse) と
HttpSendResponseEntityBody を別スレッドから同時に呼んではならない。


%index
HttpSetRequestQueueProperty
指定ハンドルのリクエストキューに新しいプロパティを設定するか既存プロパティを変更する。
%group
Win32 httpapi
%prm
RequestQueueHandle, Property, PropertyInformation, PropertyInformationLength, Reserved1, Reserved2
RequestQueueHandle : [intptr] プロパティを設定するリクエストキューへのハンドル。リクエストキューは HttpCreateRequestQueue で作成される。
Property : [int] 設定するプロパティ種別を表す HTTP_SERVER_PROPERTY 列挙のメンバ。次のいずれかでなければならない。このドキュメントは省略されている。
PropertyInformation : [intptr] プロパティ情報を含むバッファへのポインタ。このドキュメントは省略されている。
PropertyInformationLength : [int] pPropertyInformation が指すバッファの長さ (バイト単位)。
Reserved1 : [int] 予約されている。0 でなければならない。
Reserved2 : [intptr] 予約されている。NULL でなければならない。
%inst
指定ハンドルのリクエストキューに新しいプロパティを設定するか既存プロパティを変更する。

[戻り値]
関数が成功すると NO_ERROR を返す。関数が失敗した場合、次のいずれかのエラーコードを返す。このドキュメントは省略されている。


%index
HttpSetServerSessionProperty
指定サーバーセッションに新しいプロパティを設定するか既存プロパティを変更する。
%group
Win32 httpapi
%prm
ServerSessionId, Property, PropertyInformation, PropertyInformationLength
ServerSessionId : [int64] プロパティを設定するサーバーセッション。
Property : [int] 設定するプロパティ種別を表す HTTP_SERVER_PROPERTY 列挙のメンバ。次のいずれか。このドキュメントは省略されている。
PropertyInformation : [intptr] プロパティデータを含むバッファへのポインタ。このドキュメントは省略されている。
PropertyInformationLength : [int] pPropertyInformation が指すバッファの長さ (バイト単位)。
%inst
指定サーバーセッションに新しいプロパティを設定するか既存プロパティを変更する。

[戻り値]
関数が成功すると NO_ERROR を返す。関数が失敗した場合、次のいずれかのエラーコードを返す。このドキュメントは省略されている。

[備考]
サーバーセッションは配下の全 URL グループに適用される設定データのトップレベルコンテナである。サーバーセッションは
HttpCreateServerSession で作成する。pPropertyInformation
はプロパティ種別の設定構造体を指し、PropertyInformationLength はその構造体のバイトサイズを指定する。例えば
HttpServerTimeoutsProperty 設定時、pPropertyInformation は
HTTP_TIMEOUT_LIMIT_INFO サイズ以上のバッファを指す必要がある。


%index
HttpSetServiceConfiguration
HTTP Server API 設定ストアに設定レコードを作成・設定する。
%group
Win32 httpapi
%prm
ServiceHandle, ConfigId, pConfigInformation, ConfigInformationLength, pOverlapped
ServiceHandle : [intptr] 予約されている。0 でなければならない。
ConfigId : [int] 
pConfigInformation : [intptr] 設定するレコード種別に対応する適切なデータを含むバッファへのポインタ。このドキュメントは省略されている。
ConfigInformationLength : [int] pConfigInformation バッファのサイズ (バイト単位)。
pOverlapped : [var] このパラメータは予約されており NULL でなければならない。
%inst
HTTP Server API 設定ストアに設定レコードを作成・設定する。

[戻り値]
関数が成功すると戻り値は NO_ERROR
となる。関数が失敗した場合、戻り値は次のいずれかのエラーコードとなる。このドキュメントは省略されている。

[備考]
HttpSetServiceConfiguration で設定した構成パラメータはマシン上の全 HTTP Server API
アプリに適用され、HTTP Server API 終了時やコンピュータ再起動時にも永続する。


%index
HttpSetUrlGroupProperty
指定 URL グループに新しいプロパティを設定するか既存プロパティを変更する。
%group
Win32 httpapi
%prm
UrlGroupId, Property, PropertyInformation, PropertyInformationLength
UrlGroupId : [int64] プロパティを設定する URL グループの ID。
Property : [int] 変更・設定するプロパティ種別を表す HTTP_SERVER_PROPERTY 列挙のメンバ。次のいずれか。このドキュメントは省略されている。
PropertyInformation : [intptr] プロパティ情報を含むバッファへのポインタ。このドキュメントは省略されている。
PropertyInformationLength : [int] pPropertyInformation が指すバッファの長さ (バイト単位)。
%inst
指定 URL グループに新しいプロパティを設定するか既存プロパティを変更する。

[戻り値]
関数が成功すると NO_ERROR を返す。関数が失敗した場合、次のいずれかのエラーコードを返す。このドキュメントは省略されている。

[備考]
URL グループ作成後はリクエストキューに関連付ける必要がある。HttpSetUrlGroupProperty で
HttpServerBindingProperty
を設定して関連付ける。このプロパティが設定されないと合致リクエストはリクエストキューに配信されず、HTTP Server API は
503 応答を生成する。


%index
HttpShutdownRequestQueue
指定リクエストキュープロセスへのリクエストのキューイングを停止する。
%group
Win32 httpapi
%prm
RequestQueueHandle
RequestQueueHandle : [intptr] シャットダウンするリクエストキューへのハンドル。リクエストキューは HttpCreateRequestQueue で作成される。
%inst
指定リクエストキュープロセスへのリクエストのキューイングを停止する。

[戻り値]
関数が成功すると NO_ERROR を返す。関数が失敗した場合、次のいずれかのエラーコードを返す。このドキュメントは省略されている。

[備考]
HttpShutdownRequestQueue
は未処理リクエストをキャンセルし、リクエストキュープロセス上の全処理を停止する。呼び出し時には次の手順が実行される。このドキュメントは省略されている。


%index
HttpTerminate
HTTP Server API がアプリの呼び出しを処理するために使用するリソースをクリーンアップする。
%group
Win32 httpapi
%prm
Flags, pReserved
Flags : [int] 
pReserved : [intptr] このパラメータは予約されており NULL でなければならない。
%inst
HTTP Server API がアプリの呼び出しを処理するために使用するリソースをクリーンアップする。

[戻り値]
関数が成功すると戻り値は NO_ERROR
となる。関数が失敗した場合、戻り値は次のいずれかのエラーコードとなる。このドキュメントは省略されている。

[備考]
各 HttpInitialize 呼び出しには対応する HttpTerminate 呼び出しが必要である。例えば
HTTP_INITIALIZE_SERVER で HttpInitialize
を呼び出したら、HTTP_INITIALIZE_SERVER で HttpTerminate
を呼び出す必要がある。HTTP_INITIALIZE_SERVER と HTTP_INITIALIZE_CONFIG で
HttpInitialize を 2 回呼んだ場合、両フラグを指定して HttpTerminate を 1 回呼べば良い。


%index
HttpUpdateServiceConfiguration
HTTP Server API 設定ストア内の設定レコードで、TLS 証明書を指定するサービス構成パラメータをアトミックに更新する。
%group
Win32 httpapi
%prm
Handle, ConfigId, ConfigInfo, ConfigInfoLength, Overlapped
Handle : [intptr] 予約されており NULL でなければならない。
ConfigId : [int] 
ConfigInfo : [intptr] 更新するレコード種別に対応する適切なデータを含むバッファへのポインタ。ConfigId の値に応じてバッファに含めるデータの型は異なる。このドキュメントは省略されている。
ConfigInfoLength : [int] ConfigInfo バッファのサイズ (バイト単位)。
Overlapped : [var] 予約されており NULL でなければならない。
%inst
HTTP Server API 設定ストア内の設定レコードで、TLS 証明書を指定するサービス構成パラメータをアトミックに更新する。

[戻り値]
関数が成功すると戻り値は ERROR_SUCCESS
となる。関数が失敗した場合、戻り値は次のいずれかのエラーコードとなる。このドキュメントは省略されている。

[備考]
HttpUpdateServiceConfiguration で更新する構成パラメータはマシン上の全 HTTP Server API
アプリに適用され、HTTP Server API 終了時やコンピュータ再起動時にも永続する。


%index
HttpWaitForDemandStart
新しいリクエストキュープロセスで処理可能な新しいリクエストの到着を待つ。
%group
Win32 httpapi
%prm
RequestQueueHandle, Overlapped
RequestQueueHandle : [intptr] デマンドスタートを登録するリクエストキューへのハンドル。リクエストキューは HttpCreateRequestQueue で作成される。
Overlapped : [var] 非同期呼び出しの場合は pOverlapped に OVERLAPPED 構造体へのポインタを設定する。同期呼び出しの場合は NULL にする。
%inst
新しいリクエストキュープロセスで処理可能な新しいリクエストの到着を待つ。

[戻り値]
関数が成功すると NO_ERROR を返す。関数が失敗した場合、次のいずれかのエラーコードを返す。このドキュメントは省略されている。

[備考]
コントローラプロセスのみが HttpWaitForDemandStart
を呼んでデマンドスタート通知を登録できる。コントローラプロセスとはリクエストキューを作成しコントローラであることを
HTTP_CREATE_REQUEST_QUEUE_FLAG_CONTROLLER
で示したプロセスのことである。そうでないプロセスが呼ぶと ERROR_INVALID_ID_AUTHORITY
を返す。HttpWaitForDemandStart
は新しいリクエストが到着したときに完了する。このときコントローラプロセスは新しいワーカープロセスを起動し、待機中リクエストを処理させられる。ワーカー起動の遅延により必要時までリソース消費を避けられる。HTTP
Server API は同時に 1
つだけ未処理通知登録を許容する。同一リクエストキューに対して連続で何度でも呼び出せる。同一キュー上で同時に動作するプロセス数に制限はない。CancelIoEx
と pOverlapped で非同期呼び出しをキャンセル可能である。


%index
HttpWaitForDisconnect
何らかの理由で HTTP クライアントへの接続が切断されたときにアプリケーションに通知する。
%group
Win32 httpapi
%prm
RequestQueueHandle, ConnectionId, Overlapped
RequestQueueHandle : [intptr] 指定接続からのリクエストを扱うリクエストキューへのハンドル。リクエストキューは HttpCreateRequestQueue で作成される。Windows Server 2003 SP1 および Windows XP SP2 ではハンドルは HttpCreateHttpHandle により作成される。
ConnectionId : [int64] クライアントコンピュータへの接続の識別子。HttpReceiveHttpRequest が返す HTTP_REQUEST の ConnectionID メンバの値。
Overlapped : [var] 非同期呼び出しの場合は pOverlapped に OVERLAPPED 構造体へのポインタを設定する。同期呼び出しの場合は NULL にする。
%inst
何らかの理由で HTTP クライアントへの接続が切断されたときにアプリケーションに通知する。

[戻り値]
関数が成功すると戻り値は NO_ERROR となる。非同期で使用した場合 ERROR_IO_PENDING
は次のリクエストがまだ準備できていないことを示す。関数が失敗した場合、戻り値は次のいずれかのエラーコードとなる。このドキュメントは省略されている。


%index
HttpWaitForDisconnectEx
この関数は HttpWaitForDisconnect の拡張版である。
%group
Win32 httpapi
%prm
RequestQueueHandle, ConnectionId, Reserved, Overlapped
RequestQueueHandle : [intptr] 
ConnectionId : [int64] 
Reserved : [int] 
Overlapped : [var] 
%inst
この関数は HttpWaitForDisconnect の拡張版である。

