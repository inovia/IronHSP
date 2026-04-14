; ============================================================
;   wininet.dll ヘルプ (CsWin32 / win32metadata から自動抽出)
;   docs_ja.json に日本語訳があればそちらを使用、無ければ英語原文。
;   翻訳を追加するときは docs_ja.json を編集して再生成。
; ============================================================

%index
HttpOpenRequestW
HTTP リクエストハンドルを作成する。(Unicode)
%group
Win32 wininet
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
HttpQueryInfoW
HTTP リクエストに関連するヘッダ情報を取得する。(Unicode)
%group
Win32 wininet
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
%group
Win32 wininet
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
InternetCloseHandle
単一のインターネットハンドルを閉じる。
%group
Win32 wininet
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
InternetConnectW
指定サイトに対する FTP または HTTP セッションを開く。(Unicode)
%group
Win32 wininet
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
InternetOpenW
アプリケーションによる WinINet 関数の使用を初期化する。(Unicode)
%group
Win32 wininet
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
%group
Win32 wininet
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
InternetReadFile
InternetOpenUrl、FtpOpenFile、HttpOpenRequest が返したハンドルからデータを読み取る。
%group
Win32 wininet
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
InternetSetOptionW
インターネットオプションを設定する。(Unicode)
%group
Win32 wininet
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

