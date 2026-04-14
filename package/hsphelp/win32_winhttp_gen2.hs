; ============================================================
;   winhttp.dll ヘルプ (CsWin32 / win32metadata から自動抽出)
;   docs_ja.json に日本語訳があればそちらを使用、無ければ英語原文。
;   翻訳を追加するときは docs_ja.json を編集して再生成。
; ============================================================

%index
WinHttpAddRequestHeaders
HTTP リクエストハンドルに 1 つ以上の HTTP リクエストヘッダを追加する。(WinHttpAddRequestHeaders)
%group
Win32 winhttp
%prm
hRequest, lpszHeaders, dwHeadersLength, dwModifiers
hRequest : [intptr] WinHttpOpenRequest が返した HINTERNET ハンドル。
lpszHeaders : [wstr] リクエストに追加するヘッダ文字列へのポインタ。最後以外の各ヘッダは CR/LF で終端すること。
dwHeadersLength : [int] pwszHeaders の長さ(文字数)。-1L なら NULL 終端とみなし長さが計算される。
dwModifiers : [int] 関数の意味を変更するフラグ群。以下のフラグを 1 つ以上組み合わせられる。
%inst
HTTP リクエストハンドルに 1 つ以上の HTTP リクエストヘッダを追加する。(WinHttpAddRequestHeaders)

[戻り値]
成功時は TRUE、失敗時は FALSE を返す。拡張エラー情報は GetLastError で取得する。主なエラーコードは以下の通り。
（以下省略）

[備考]
ヘッダはリダイレクト間で引き継がれる。これはセキュリティ上の問題になりうるため、WINHTTP_STATUS_CALLBACK
を使用してリダイレクト時に該当ヘッダを修正することが推奨される。非同期モード (WINHTTP_FLAG_ASYNC)
でも本関数は同期動作する。ヘッダ名と値は検証される。不正なヘッダを渡すと本関数は失敗し GetLastError は
ERROR_INVALID_PARAMETER を返す。Date: ヘッダを送るときは WinHttpTimeFromSystemTime
で構造体を作れる。単一呼び出しで複数ヘッダを渡せる。


%index
WinHttpCloseHandle
単一の **HINTERNET** ハンドルを閉じる。
%group
Win32 winhttp
%prm
hInternet
hInternet : [intptr] 閉じる有効な **HINTERNET** ハンドル。
%inst
単一の **HINTERNET** ハンドルを閉じる。

[戻り値]
ハンドルが正常に閉じられた場合は **TRUE**、そうでなければ **FALSE**。拡張エラー情報は GetLastError
で取得する。主なエラーコードは以下の通り。
（以下省略）

[備考]
非同期モード (WINHTTP_FLAG_ASYNC)
でも本関数は同期動作する。閉じるハンドルに状態コールバックが登録されており、ハンドルに非 NULL
コンテキスト値が設定されている場合、WINHTTP_CALLBACK_STATUS_HANDLE_CLOSING
コールバックが呼ばれる。これがそのハンドルからの最後のコールバックであり、ハンドルが破棄されることを示す。WinHttpCloseHandle
で進行中の非同期リクエストを中断できる。留意事項は以下の通り:
（以下省略）


%index
WinHttpConnect
HTTP リクエストの初期ターゲットサーバーを指定し、その初期ターゲットに対する HTTP セッション用の HINTERNET 接続ハンドルを返す。
%group
Win32 winhttp
%prm
hSession, pswzServerName, nServerPort, dwReserved
hSession : [intptr] 以前の WinHttpOpen 呼び出しが返した有効な HINTERNET WinHTTP セッションハンドル。
pswzServerName : [wstr] HTTP サーバーのホスト名を含む NULL 終端文字列へのポインタ。ASCII 形式の IP アドレス(例: 10.0.1.45)でもよい。WinHttp は国際化ホスト名を先に Punycode に変換せずに受け付けないので注意。
nServerPort : [int] 
dwReserved : [int] 予約。0 を指定する。
%inst
HTTP リクエストの初期ターゲットサーバーを指定し、その初期ターゲットに対する HTTP セッション用の HINTERNET
接続ハンドルを返す。

[戻り値]
接続成功時は HTTP セッションへの有効な接続ハンドルを返し、それ以外は NULL を返す。拡張エラー情報は GetLastError
で取得する。主なエラーコードは以下の通り。
（以下省略）

[備考]
非同期モードでも同期動作する。戻り値は成否を示す。WinHttpConnect が返した HINTERNET ハンドルは使用後
WinHttpCloseHandle で閉じる必要がある。WinHttpConnect はターゲット HTTP
サーバーを指定するが、リダイレクトされた場合は別のサーバーから応答が来ることがある。応答サーバーの URL は
WinHttpQueryOption を WINHTTP_OPTION_URL フラグで呼び出して取得できる。


%index
WinHttpOpen
アプリケーションに対して WinHTTP 関数の使用を初期化し、WinHTTP セッションハンドルを返す。
%group
Win32 winhttp
%prm
pszAgentW, dwAccessType, pszProxyW, pszProxyBypassW, dwFlags
pszAgentW : [wstr] WinHTTP 関数を呼び出すアプリケーション名または主体名を含む文字列へのポインタ。HTTP プロトコルで user agent として使用される。
dwAccessType : [int] 
pszProxyW : [wstr] dwAccessType が WINHTTP_ACCESS_TYPE_NAMED_PROXY のとき使用するプロキシサーバー名を含む文字列へのポインタ。WinHTTP は HTTP 用の CERN 型プロキシのみ認識する。それ以外の dwAccessType では WINHTTP_NO_PROXY_NAME を指定する。
pszProxyBypassW : [wstr] WINHTTP_ACCESS_TYPE_NAMED_PROXY 時にプロキシを経由しないホスト名/IP アドレスのセミコロン区切りリスト(省略可)へのポインタ。ワイルドカード可。空文字列は使わないこと。それ以外の dwAccessType では WINHTTP_NO_PROXY_BYPASS を指定する。
dwFlags : [int] 動作オプションを示すフラグ。以下の値を指定できる。
%inst
アプリケーションに対して WinHTTP 関数の使用を初期化し、WinHTTP セッションハンドルを返す。

[戻り値]
成功時は有効なセッションハンドル、それ以外は NULL を返す。拡張エラー情報は GetLastError
で取得する。主なエラーコードは以下の通り。
（以下省略）

[備考]
非同期モード (WINHTTP_FLAG_ASYNC) での使用が強く推奨される。WinHttpOpen はアプリケーションが最初に呼ぶ
WinHTTP 関数であり、内部データ構造を初期化し以降の呼び出しに備える。使用終了時は WinHttpCloseHandle
でセッションハンドルを解放する必要がある。複数回呼んでも構わないが、通常 1
回で十分。ユーザーデータは複数セッションコンテキスト間で共有されないため、複数ユーザーの代理でリクエストを行うアプリは各ユーザーごとに別セッションを作成すべき。


%index
WinHttpOpenRequest
HTTP リクエストハンドルを作成する。
%group
Win32 winhttp
%prm
hConnect, pwszVerb, pwszObjectName, pwszVersion, pwszReferrer, ppwszAcceptTypes, dwFlags
hConnect : [intptr] WinHttpConnect が返した HTTP セッションへの HINTERNET 接続ハンドル。
pwszVerb : [wstr] 使用する HTTP verb を含む文字列へのポインタ。NULL なら GET を使用する。大文字で書くこと。多くのサーバーは verb を大文字小文字区別するため。
pwszObjectName : [wstr] 指定 HTTP verb のターゲットリソース名を含む文字列へのポインタ。通常はファイル名、実行モジュール、検索指定子。
pwszVersion : [wstr] HTTP バージョンを含む文字列へのポインタ。NULL なら HTTP/1.1 を使用する。
pwszReferrer : [wstr] pwszObjectName の URL の元ドキュメント URL を指定する文字列へのポインタ。WINHTTP_NO_REFERER を指定すると referer は指定されない。
ppwszAcceptTypes : [var] クライアントが受け入れるメディアタイプを指定する NULL 終端文字列ポインタ配列。WINHTTP_DEFAULT_ACCEPT_TYPES の場合、クライアントは何も受け入れない。
dwFlags : [int] 
%inst
HTTP リクエストハンドルを作成する。

[戻り値]
成功時は有効な HTTP リクエストハンドル、失敗時は NULL を返す。拡張エラー情報は GetLastError
で取得する。主なエラーコードは以下の通り。
（以下省略）

[備考]
新しい HTTP リクエストハンドルを作成し指定パラメータを格納する。HTTP リクエストハンドルは HTTP
サーバーに送るリクエストと、リクエストの一部として送られるすべての RFC822/MIME/HTTP ヘッダを保持する。pwszVerb
が "HEAD" の場合、Content-Length ヘッダは無視される。WinHttpSetStatusCallback
で状態コールバックが登録されている場合、WINHTTP_CALLBACK_STATUS_HANDLE_CREATED
通知が行われる。使用後は WinHttpCloseHandle で閉じること。


%index
WinHttpQueryDataAvailable
WinHttpReadData で読み取り可能なデータ量(バイト単位)を返す。
%group
Win32 winhttp
%prm
hRequest, lpdwNumberOfBytesAvailable
hRequest : [intptr] WinHttpOpenRequest が返した有効な HINTERNET ハンドル。WinHttpQueryDataAvailable を呼ぶ前に WinHttpReceiveResponse を完了させておく必要がある。
lpdwNumberOfBytesAvailable : [var] 利用可能バイト数を受け取る ULONG 変数へのポインタ。非同期モードでは必ず NULL にしてコールバックで取得すること。
%inst
WinHttpReadData で読み取り可能なデータ量(バイト単位)を返す。

[戻り値]
成功時は TRUE、失敗時は FALSE。拡張エラー情報は GetLastError で取得する。主なエラーコードは以下の通り。
（以下省略）

[備考]
非同期モード (WINHTTP_FLAG_ASYNC) でも同期/非同期のどちらでも動作する。FALSE を返した場合は
GetLastError で原因取得。TRUE を返した場合は
WINHTTP_CALLBACK_STATUS_DATA_AVAILABLE 完了コールバックで結果とパラメータを判断する。警告:
非同期モードでは lpdwNumberOfBytesAvailable に必ず NULL
を渡し、コールバック関数内でバイト数を取得すること。そうしないとメモリフォールトが発生する可能性がある。本関数は、次の
WinHttpReadData 呼び出しで即座に読み取れるバイト数を返す。応答終了の判定には WinHttpReadData
の戻り値を使うこと。WinHttpOpenRequest で作成し WinHttpSendRequest
で送信したハンドルでは、WinHttpReceiveResponse を先に呼ぶ必要がある。


%index
WinHttpQueryHeaders
HTTP リクエストに関連するヘッダ情報を取得する。
%group
Win32 winhttp
%prm
hRequest, dwInfoLevel, pwszName, lpBuffer, lpdwBufferLength, lpdwIndex
hRequest : [intptr] WinHttpOpenRequest が返した HINTERNET リクエストハンドル。WinHttpReceiveResponse を完了させておく必要がある。
dwInfoLevel : [int] 属性フラグと修飾フラグの組み合わせ。Query Info Flags を参照。
pwszName : [wstr] ヘッダ名を含む文字列へのポインタ。dwInfoLevel のフラグが WINHTTP_QUERY_CUSTOM でない場合は WINHTTP_HEADER_NAME_BY_INDEX を指定する。
lpBuffer : [intptr] 情報を受け取るバッファへのポインタ。WINHTTP_NO_OUTPUT_BUFFER を指定すると関数は FALSE を返し、GetLastError は ERROR_INSUFFICIENT_BUFFER を返して lpdwBufferLength に必要バイト数を格納する。
lpdwBufferLength : [var] データバッファ長を保持する DWORD へのポインタ。復帰後はバッファに書き込まれた情報のサイズを受け取る。文字列を返す場合のルールは以下の通り。
lpdwIndex : [var] 同名の複数ヘッダを列挙するための 0 始まりのヘッダインデックス。呼び出し時は返したいヘッダのインデックス、復帰時は次のヘッダのインデックスを受け取る。WINHTTP_NO_HEADER_INDEX を指定すると最初の出現のみ返す。
%inst
HTTP リクエストに関連するヘッダ情報を取得する。

[戻り値]
成功時は TRUE、失敗時は FALSE。拡張エラー情報は GetLastError で取得する。主なエラーコードは以下の通り。
（以下省略）

[備考]
非同期モードでも本関数は同期動作する。既定では文字列を返すが、dwInfoLevel に修飾フラグを付けて SYSTEMTIME や
DWORD として取得することもできる。返せるデータ型と対応フラグは以下の通り。
（以下省略）


%index
WinHttpReadData
WinHttpOpenRequest で開いたハンドルからデータを読み取る。
%group
Win32 winhttp
%prm
hRequest, lpBuffer, dwNumberOfBytesToRead, lpdwNumberOfBytesRead
hRequest : [intptr] WinHttpOpenRequest が返した有効な HINTERNET ハンドル。WinHttpReceiveResponse または WinHttpQueryDataAvailable を完了させておく必要がある。
lpBuffer : [intptr] 読み取ったデータを受け取るバッファへのポインタ。WinHttpReadData 完了まで有効である必要がある。
dwNumberOfBytesToRead : [int] 読み取るバイト数。
lpdwNumberOfBytesRead : [var] 読み取ったバイト数を受け取る ULONG 変数へのポインタ。本関数は作業前にこの値を 0 に設定する。非同期モードでは必ず NULL にしてコールバックで取得すること。
%inst
WinHttpOpenRequest で開いたハンドルからデータを読み取る。

[戻り値]
成功時は TRUE、失敗時は FALSE。拡張エラー情報は GetLastError で取得する。返されるエラーコード一覧は以下の通り。
（以下省略）

[備考]
Windows Vista/Windows Server 2008 以降、WinHttp
はサーバー送信データのチャンク転送エンコードに対応する。Transfer-Encoding
ヘッダが応答にある場合、WinHttpReadData
はチャンク情報を取り除いてからアプリにデータを渡す。非同期モードでも同期/非同期どちらでも動作する。警告: 非同期モードでは
lpdwNumberOfBytesRead に必ず NULL
を渡し、コールバックで取得すること。読み取りバッファが非常に小さいと本関数は同期的に完了することがあり、WINHTTP_CALLBACK_STATUS_READ_COMPLETE
で再度 WinHttpReadData を呼ぶとスタックオーバーフローを招くため、内部バッファと同程度 (8 KB)
以上のバッファを使うのが望ましい。同期モードで TRUE かつ読み取りバイト数 0 の場合は応答終了を意味する。


%index
WinHttpReceiveResponse
WinHttpSendRequest で開始された HTTP リクエストに対する応答受信を待つ。
%group
Win32 winhttp
%prm
hRequest, lpReserved
hRequest : [intptr] WinHttpOpenRequest が返し WinHttpSendRequest で送信した HINTERNET ハンドル。WinHttpSendRequest が完了するまで待ってから呼び出す。
lpReserved : [intptr] 予約。NULL を指定する必要がある。
%inst
WinHttpSendRequest で開始された HTTP リクエストに対する応答受信を待つ。

[戻り値]
成功時は TRUE、失敗時は FALSE。拡張エラー情報は GetLastError で取得する。主なエラーコードは以下の通り。
（以下省略）

[備考]
非同期モードでは同期/非同期いずれでも動作する。TRUE を返した場合、成功なら
WINHTTP_CALLBACK_STATUS_HEADERS_AVAILABLE、非同期完了の失敗なら
WINHTTP_CALLBACK_STATUS_REQUEST_ERROR コールバックが呼ばれる。進捗通知は以下の通り。
（以下省略）


%index
WinHttpSendRequest
指定のリクエストを HTTP サーバーに送信する。(WinHttpSendRequest)
%group
Win32 winhttp
%prm
hRequest, lpszHeaders, dwHeadersLength, lpOptional, dwOptionalLength, dwTotalLength, dwContext
hRequest : [intptr] WinHttpOpenRequest が返した HINTERNET ハンドル。
lpszHeaders : [wstr] リクエストに追加するヘッダ文字列へのポインタ。追加ヘッダがなければ WINHTTP_NO_ADDITIONAL_HEADERS を指定する。
dwHeadersLength : [int] 追加ヘッダの長さ(文字単位)。-1L で pwszHeaders が NULL でない場合は NULL 終端とみなして計算する。
lpOptional : [intptr] リクエストヘッダ直後に送信するオプションデータを含むバッファへのポインタ。通常 POST/PUT で使用する。送らない場合は WINHTTP_NO_REQUEST_DATA を指定する。dwOptionalLength が 0 なら無視され NULL に設定される。本バッファはリクエストハンドルが閉じられるか WinHttpReceiveResponse が完了するまで有効である必要がある。
dwOptionalLength : [int] オプションデータの長さ(バイト単位)。送らない場合は 0 を指定する。lpOptional が NULL でない場合は有効な長さを指定する必要がある。
dwTotalLength : [int] 送信する合計データ長(バイト単位)。リクエストの Content-Length ヘッダに設定される。dwOptionalLength を超える場合、WinHttpWriteData で追加データを送信できる。同じリクエストの WinHttpSendRequest 呼び出し間で変更してはならず、必要なら新しいリクエストを作成すること。
dwContext : [int] リクエストハンドルと共にコールバック関数に渡される、アプリケーション定義値を保持するポインタサイズの変数へのポインタ。
%inst
指定のリクエストを HTTP サーバーに送信する。(WinHttpSendRequest)

[戻り値]
成功時は TRUE、失敗時は FALSE。拡張エラー情報は GetLastError で取得する。エラーコード一覧は以下の通り。
（以下省略）

[備考]
非同期モードでは同期/非同期のどちらでも動作する。いずれの場合も送信成功時
WINHTTP_CALLBACK_STATUS_SENDREQUEST_COMPLETE が呼ばれる。これを受けてから
WinHttpReceiveResponse を呼び、それ以前に他の非同期関数を呼ぶと
ERROR_WINHTTP_INCORRECT_HANDLE_STATE を返す。lpOptional
が指すバッファはリクエストハンドルが閉じられるか WinHttpReceiveResponse
が完了するまで変更/削除しないこと。同期モードでは応答を受信するには WinHttpSendRequest 復帰後に
WinHttpReceiveResponse
を呼べばよい。同じリクエストハンドルで複数回呼び出して同じリクエストを再送できるが、前回の全データを読み終わってから呼び出すこと。


%index
WinHttpSetOption
インターネットオプションを設定する。
%group
Win32 winhttp
%prm
hInternet, dwOption, lpBuffer, dwBufferLength
hInternet : [intptr] データを設定する HINTERNET ハンドル。オプションに応じてセッションハンドルでもリクエストハンドルでもよい。
dwOption : [int] 設定するインターネットオプション。Option Flags のいずれかの値。
lpBuffer : [intptr] オプション設定値を含むバッファへのポインタ。
dwBufferLength : [int] lpBuffer バッファの長さ。以下のオプションでは文字単位、それ以外ではバイト単位。
%inst
インターネットオプションを設定する。

[戻り値]
成功時は TRUE、失敗時は FALSE。拡張エラー情報は GetLastError で取得する。主なエラーコードは以下の通り。
（以下省略）

[備考]
WinHttpSetOption で渡された資格情報は平文で送信される可能性があるため、資格情報設定には
WinHttpQueryAuthSchemes と WinHttpSetCredentials の使用が強く推奨される。Passport
認証で 407 応答に対処する場合のみ、プロキシ資格情報設定に WinHttpSetOption
を使う必要がある。非同期モードでも本関数は同期動作する。GetLastError は設定できないオプションに対しては
ERROR_INVALID_PARAMETER を返す。

