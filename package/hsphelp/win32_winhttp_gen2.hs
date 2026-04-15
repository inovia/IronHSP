; ============================================================
;   winhttp.dll ヘルプ (CsWin32 / win32metadata から自動抽出)
;   docs_ja.json に日本語訳があればそちらを使用、無ければ英語原文。
;   翻訳を追加するときは docs_ja.json を編集して再生成。
; ============================================================

%type
拡張命令
%ver
1.0
%dll
winhttp.dll
%date
2026/04/16
%author
IronHSP / CsWin32 bridge
%url
https://github.com/inovia/IronHSP
%port
Win

%note
Win32 API の winhttp.dll 関数群。CsWin32 + win32metadata から自動生成。
hsp3net 専用 (intptr / NSTRUCT / wstr を使用)。

%group
Win32API

%index
WinHttpAddRequestHeaders
HTTP リクエストハンドルに 1 つ以上の HTTP リクエストヘッダを追加する。(WinHttpAddRequestHeaders)
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
WinHttpAddRequestHeadersEx
HTTP リクエストハンドルに 1 つまたは複数の HTTP リクエストヘッダーを追加し、名前と値の文字列を個別に使えるようにする。
%prm
hRequest, dwModifiers, ullFlags, ullExtra, cHeaders, pHeaders
hRequest : [intptr] 型: IN **[HINTERNET](/windows/win32/winhttp/hinternet-handles-in-winhttp)** [WinHttpOpenRequest](/windows/win32/api/winhttp/nf-winhttp-winhttpopenrequest) の呼び出しから返される **HINTERNET** ハンドル。
dwModifiers : [int] 型: IN **[DWORD](/windows/win32/winprog/windows-data-types)** この関数の動作を変更するためのフラグを含む unsigned long 整数値。次のフラグのいずれか 1 つ以上を指定できる。
ullFlags : [int64] 型: IN **[ULONGLONG](/windows/win32/winprog/windows-data-types)** 渡された文字列が Unicode 文字列であることを示すには **WINHTTP_EXTENDED_HEADER_FLAG_UNICODE** を渡す。
ullExtra : [int64] 型: IN **[ULONGLONG](/windows/win32/winprog/windows-data-types)** 予約済み。
cHeaders : [int] 型: IN **[DWORD](/windows/win32/winprog/windows-data-types)** *pHeaders* 内の要素数。
pHeaders : [var] 型: \_In\_reads\_(cHeaders) **[WINHTTP_EXTENDED_HEADER](/windows/win32/api/winhttp/ns-winhttp-winhttp_extended_header)\*** **WINHTTP_EXTENDED_HEADER** 構造体の配列。
%inst
HTTP リクエストハンドルに 1 つまたは複数の HTTP リクエストヘッダーを追加し、名前と値の文字列を個別に使えるようにする。

[戻り値]
操作の結果を示すステータスコード。返されるエラーコードには次のものがある。
（以下省略）


%index
WinHttpCheckPlatform
WinHttpCheckPlatform 関数は、現在のプラットフォームがこのバージョンの Microsoft Windows HTTP Services (WinHTTP) でサポートされているかを判定する。
%prm

%inst
WinHttpCheckPlatform 関数は、現在のプラットフォームがこのバージョンの Microsoft Windows HTTP
Services (WinHTTP) でサポートされているかを判定する。

[戻り値]
プラットフォームが Microsoft Windows HTTP Services (WinHTTP) によってサポートされている場合は
TRUE を、そうでない場合は FALSE を返す。

[備考]
この関数は、アプリケーションが Microsoft Windows HTTP Services (WinHTTP)
を利用する一方で、WinHTTP が対応しないプラットフォームもサポートする場合に便利である。WinHTTP が非同期モード
(WinHttpOpen で WINHTTP_FLAG_ASYNC が設定されている状態)
で使われる場合でも、この関数は同期的に動作する。戻り値は成功または失敗を示す。拡張エラー情報を取得するには GetLastError
を呼び出す。WinHTTP バージョン 5.1 は、Windows 2000 Service Pack 3 (SP3) 以降
(Datacenter Server を除く)、Windows XP Service Pack 1 (SP1) 以降、および
Windows Server 2003 のオペレーティングシステムコンポーネントである。Windows Server 2003
では、WinHTTP はシステムの side-by-side アセンブリである。詳細は Run-Time Requirements
を参照。


%index
WinHttpCloseHandle
単一の **HINTERNET** ハンドルを閉じる。
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
WinHttpCrackUrl
WinHttpCrackUrl 関数は、URL をホスト名やパスといった構成要素に分解する。
%prm
pwszUrl, dwUrlLength, dwFlags, lpUrlComponents
pwszUrl : [wstr] 分解する正規 URL を格納した文字列へのポインタ。WinHttpCrackUrl は分解を試みる前にこの URL が有効かつ正しい形式かどうかのチェックを行わない。
dwUrlLength : [int] pwszUrl 文字列の長さ (文字単位)。dwUrlLength を 0 に設定すると、WinHttpCrackUrl は pwszUrl 文字列が null 終端であると仮定し、その前提で pwszUrl の長さを決定する。
dwFlags : [int] 動作を制御するフラグ。このパラメータには次のフラグの組み合わせ (ビット単位の OR) を指定できる。また、特別な操作を行わない場合は 0 を指定できる。
lpUrlComponents : [var] URL の各要素を受け取る URL_COMPONENTS 構造体へのポインタ。
%inst
WinHttpCrackUrl 関数は、URL をホスト名やパスといった構成要素に分解する。

[戻り値]
関数が成功した場合は TRUE を、失敗した場合は FALSE を返す。拡張エラー情報を取得するには GetLastError
を呼び出す。返されるエラーコードには次のものがある。
（以下省略）

[備考]
WinHTTP が非同期モード (WinHttpOpen で WINHTTP_FLAG_ASYNC が設定されている状態)
で使われる場合でも、この関数は同期的に動作する。戻り値は成功または失敗を示す。拡張エラー情報を取得するには GetLastError
を呼び出す。必要な構成要素は URL_COMPONENTS
構造体のメンバーで示される。各要素は値へのポインタと、格納された値の長さを保持するメンバーを持つ。要素の値と長さがいずれも 0
の場合、その要素は返されない。要素の値へのポインタが NULL でなく、かつ対応する長さメンバーの値が 0 でない場合、pwszUrl
文字列内の対応する要素の最初の文字のアドレスがポインタに格納され、要素の長さが長さメンバーに格納される。ポインタがユーザー指定のバッファのアドレスを含む場合、長さメンバーにはバッファのサイズを含む必要がある。WinHttpCrackUrl
関数は要素をそのバッファにコピーし、長さメンバーにはコピーされた要素の長さから終端の文字列終端子の 1
を引いた値が設定される。ユーザー指定のバッファが十分でない場合、WinHttpCrackUrl は FALSE
を返し、GetLastError は ERROR_INSUFFICIENT_BUFFER を返す。WinHttpCrackUrl
が正しく動作するには、URL_COMPONENTS 構造体のサイズがその構造体の dwStructSize
メンバーに格納されていなければならない。pwszUrl に渡された URL のインターネットプロトコルが HTTP または HTTPS
でない場合、WinHttpCrackUrl は FALSE を返し、GetLastError は
ERROR_WINHTTP_UNRECOGNIZED_SCHEME を示す。WinHttpCrackUrl は分解を試みる前に URL
の妥当性や形式をチェックしない。そのため、"http://server?Bad=URL"
のような文字列を渡すと関数は誤った結果を返す。注: Windows XP および Windows 2000 については WinHttp
の開始ページの Run-Time Requirements セクションを参照。


%index
WinHttpCreateProxyResolver
WinHttpGetProxyForUrlEx で使うためのハンドルを作成する。
%prm
hSession, phResolver
hSession : [intptr] WinHttpOpen への以前の呼び出しで返された有効な HINTERNET WinHTTP セッションハンドル。セッションハンドルは WINHTTP_FLAG_ASYNC を指定して開かれている必要がある。
phResolver : [var] WinHttpGetProxyForUrlEx で使うための新しいハンドルへのポインタ。保留中の操作を終えたまたはキャンセルしたら、WinHttpCloseHandle でこのハンドルを閉じる。
%inst
WinHttpGetProxyForUrlEx で使うためのハンドルを作成する。

[戻り値]
操作の結果を示すステータスコード。
（以下省略）


%index
WinHttpCreateUrl
ホスト名やパスなどの構成要素から URL を作成する。
%prm
lpUrlComponents, dwFlags, pwszUrl, pdwUrlLength
lpUrlComponents : [var] URL を作成する元となる構成要素を含む URL_COMPONENTS 構造体へのポインタ。
dwFlags : [int] 
pwszUrl : [wstr] URL をワイド文字 (Unicode) 文字列として受け取る文字バッファへのポインタ。
pdwUrlLength : [var] pwszUrl バッファの長さをワイド (Unicode) 文字単位で受け取る unsigned long 整数型の変数へのポインタ。関数が戻るとき、このパラメータには URL 文字列のワイド文字単位の長さから終端文字の分の 1 を引いた値が格納される。GetLastError が ERROR_INSUFFICIENT_BUFFER を返した場合、このパラメータには作成された URL を保持するのに必要なワイド文字数が格納される。
%inst
ホスト名やパスなどの構成要素から URL を作成する。

[戻り値]
関数が成功した場合は TRUE を、失敗した場合は FALSE を返す。拡張エラーデータを取得するには GetLastError
を呼び出す。返されるエラーコードには次のものがある。
（以下省略）

[備考]
WinHTTP が非同期モード (WinHttpOpen で WINHTTP_FLAG_ASYNC が設定されている状態)
で使われる場合でも、この関数は同期的に動作する。戻り値は成功または失敗を示す。拡張エラーデータを取得するには GetLastError
を呼び出す。注: Windows XP および Windows 2000 については WinHttp の開始ページの Run-Time
Requirements セクションを参照。


%index
WinHttpDetectAutoProxyConfigUrl
プロキシ自動構成 (PAC) ファイルの URL を検出する。
%prm
dwAutoDetectFlags, ppwstrAutoConfigUrl
dwAutoDetectFlags : [int] PAC ファイルの位置を特定するために使用するプロトコルを指定するデータ型。DHCP と DNS の両方の自動検出フラグが設定されている場合、まず DHCP が使われ、DHCP で PAC URL が見つからなかった場合に DNS が使われる。
ppwstrAutoConfigUrl : [var] プロキシデータを受け取るための構成 URL を含む、null 終端の Unicode 文字列へのポインタを返すデータ型。ppwszAutoConfigUrl が指す文字列は GlobalFree 関数を使って解放しなければならない。
%inst
プロキシ自動構成 (PAC) ファイルの URL を検出する。

[戻り値]
成功した場合は TRUE を、失敗した場合は FALSE を返す。拡張エラー情報は GetLastError
で取得する。返されるエラーコードには次のものがある。
（以下省略）

[備考]
WinHTTP は Web Proxy Auto-Discovery (WPAD) プロトコル (しばしば autoproxy
と呼ばれる) を実装する。よく知られた場所についての詳細は WPAD プロトコルドキュメントの Discovery Process
セクションを参照。WinHttpDetectAutoProxyConfigUrl 関数は完了までに時間がかかるため、UI
スレッドから呼び出すべきではない点に注意。


%index
WinHttpFreeProxyResult
WinHttpFreeProxyResult 関数は、WinHttpGetProxyResult への以前の呼び出しで取得したデータを解放する。
%prm
pProxyResult
pProxyResult : [var] WinHttpGetProxyResult への以前の呼び出しで取得した WINHTTP_PROXY_RESULT 構造体へのポインタ。
%inst
WinHttpFreeProxyResult 関数は、WinHttpGetProxyResult
への以前の呼び出しで取得したデータを解放する。

[戻り値]
この関数は値を返さない。

[備考]
完了時、pProxyResult
のすべての内部メンバーはゼロクリアされ、それらのメンバーに割り当てられたメモリは解放される。pProxyResult
自体が割り当てられたポインタである場合、呼び出し側がそのポインタを解放しなければならない。


%index
WinHttpFreeProxyResultEx
(no summary)
%prm
pProxyResultEx
pProxyResultEx : [var] 
%inst



%index
WinHttpFreeProxySettings
(no summary)
%prm
pWinHttpProxySettings
pWinHttpProxySettings : [var] 
%inst



%index
WinHttpGetDefaultProxyConfiguration
既定の WinHTTP プロキシ構成をレジストリから取得する。
%prm
pProxyInfo
pProxyInfo : [var] 既定のプロキシ構成を受け取る WINHTTP_PROXY_INFO 型の変数へのポインタ。
%inst
既定の WinHTTP プロキシ構成をレジストリから取得する。

[戻り値]
成功した場合は TRUE を、失敗した場合は FALSE を返す。特定のエラーメッセージを取得するには GetLastError
を呼び出す。返されるエラーコードには次のものがある。
（以下省略）

[備考]
WinHttpGetDefaultProxyConfiguration
は、WinHttpSetDefaultProxyConfiguration または ProxyCfg.exe
で設定されたプロキシ構成を取得する。WinHTTP セッションの既定のプロキシ構成は、WinHttpSetOption を呼び出して
WINHTTP_OPTION_PROXY
フラグを指定することで上書きできる。WinHttpGetDefaultProxyConfiguration
は現在のセッションの構成を取得するのではなく、レジストリに指定されている構成を取得する。レジストリにプロキシサーバーの一覧が含まれている場合、pProxyInfo
の dwAccessType メンバーは WINHTTP_ACCESS_TYPE_NAMED_PROXY に設定される。そうでない場合は
WINHTTP_ACCESS_TYPE_NO_PROXY
に設定される。WinHttpGetDefaultProxyConfiguration は pProxyInfo
の文字列メンバーのためにメモリを割り当てる。このメモリを解放するには GlobalFree を呼び出す。WinHTTP が非同期モード
(WinHttpOpen で WINHTTP_FLAG_ASYNC が設定されている状態)
で使われる場合でも、この関数は同期的に動作する。戻り値は成功または失敗を示す。拡張エラー情報は GetLastError で取得する。注:
Windows XP および Windows 2000 については WinHTTP の開始ページの Run-Time
Requirements セクションを参照。


%index
WinHttpGetIEProxyConfigForCurrentUser
現在のユーザーの Internet Explorer プロキシ構成を取得する。
%prm
pProxyConfig
pProxyConfig : [var] 入力時には WINHTTP_CURRENT_USER_IE_PROXY_CONFIG 構造体へのポインタ。出力時には、現在アクティブなネットワーク接続 (LAN、ダイヤルアップ、VPN など) に対する Internet Explorer のプロキシ設定を構造体が保持する。
%inst
現在のユーザーの Internet Explorer プロキシ構成を取得する。

[戻り値]
成功した場合は TRUE を、失敗した場合は FALSE を返す。拡張エラー情報は GetLastError
で取得する。返されるエラーコードには次のものがある。
（以下省略）

[備考]
Internet Explorer では、プロキシ設定は [ツール] / [インターネットオプション] メニューの [接続]
タブにある。プロキシ設定は接続ごとに構成される。つまり LAN 接続のプロキシ設定とダイヤルアップや VPN
接続のプロキシ設定は別々である。WinHttpGetIEProxyConfigForCurrentUser
は現在アクティブな接続のプロキシ設定を返す。この関数は、Web Proxy Auto-Discovery (WPAD)
プロトコルが実装されていない (プロキシ自動構成ファイルが利用できない)
ネットワーク環境で動作するクライアントアプリケーションで役立つ。PAC
ファイルが利用できない場合、WinHttpGetProxyForUrl
関数は失敗する。WinHttpGetIEProxyConfigForCurrentUser 関数は、Internet Explorer
内のユーザーのプロキシ構成を取得することで、動作するプロキシ構成を発見するフォールバック機構として使える。この関数は、ログオン中のユーザーを偽装しないサービスプロセスでは使うべきではない。呼び出し側がログオン中のユーザーを偽装しない場合、WinHTTP
は現在のサービスプロセス (例: local service や network service) の Internet Explorer
設定を取得しようとする。これらのシステムアカウントに対して Internet Explorer
設定が構成されていない場合、WinHttpGetIEProxyConfigForCurrentUser
の呼び出しは失敗する。WINHTTP_CURRENT_USER_IE_PROXY_CONFIG 構造体内の
lpszProxy、lpszProxyBypass、lpszAutoConfigUrl 文字列が NULL
でない場合、呼び出し側はそれらを解放しなければならない。文字列の解放には GlobalFree を使う。


%index
WinHttpGetProxyForUrl
指定した URL に対するプロキシデータを取得する。(WinHttpGetProxyForUrl)
%prm
hSession, lpcwszUrl, pAutoProxyOptions, pProxyInfo
hSession : [intptr] WinHttpOpen 関数から返される WinHTTP セッションハンドル。
lpcwszUrl : [wstr] アプリケーションが送信しようとする HTTP リクエストの URL を含む、null 終端の Unicode 文字列へのポインタ。
pAutoProxyOptions : [var] 使用する auto-proxy オプションを指定する WINHTTP_AUTOPROXY_OPTIONS 構造体へのポインタ。
pProxyInfo : [var] プロキシ設定を受け取る WINHTTP_PROXY_INFO 構造体へのポインタ。この構造体は WINHTTP_OPTION_PROXY オプションを使ってリクエストハンドルに適用される。この構造体に含まれる lpszProxy と lpszProxyBypass 文字列は、NULL でない場合 GlobalFree 関数で解放する。
%inst
指定した URL に対するプロキシデータを取得する。(WinHttpGetProxyForUrl)

[戻り値]
関数が成功した場合は TRUE を返す。
失敗した場合は FALSE を返す。拡張エラーデータは GetLastError で取得する。考えられるエラーコードには次のものがある。
（以下省略）

[備考]
この関数は HTTP リクエストのプロキシ設定を自動構成するための Web Proxy Auto-Discovery (WPAD)
プロトコルを実装する。WPAD プロトコルはプロキシ自動構成 (PAC) ファイルをダウンロードする。PAC ファイルは対象 URL
に対して使用するプロキシサーバーを特定するスクリプトである。PAC ファイルは通常、企業ネットワーク環境で IT
部門によって展開される。PAC ファイルの URL は明示的に指定することも、WinHttpGetProxyForUrl
にローカルネットワーク上の PAC ファイルの位置を自動検出させることもできる。WinHttpGetProxyForUrl は
ECMAScript ベースの PAC ファイルのみをサポートする。PAC ファイルは URL
ごとに異なるプロキシサーバーを返す可能性があるため、WinHttpGetProxyForUrl は URL
ごとに呼び出す必要がある。これは IT 部門が対象 URL (lpcwszUrl パラメータで指定)
をプロキシサーバー配列内の特定のプロキシにマッピング (ハッシュ)
することで、プロキシサーバーの負荷分散を実装できるため有用である。WinHttpGetProxyForUrl は
pAutoProxyOptions 構造体の dwFlags メンバーで自動検出が指定されている場合、autoproxy URL と
autoproxy スクリプトをキャッシュする。詳細は Autoproxy Cache を参照。


%index
WinHttpGetProxyForUrlEx
指定した URL に対するプロキシデータを取得する。(WinHttpGetProxyForUrlEx)
%prm
hResolver, pcwszUrl, pAutoProxyOptions, pContext
hResolver : [intptr] WinHttpCreateProxyResolver 関数から返される WinHTTP リゾルバーハンドル。
pcwszUrl : [wstr] プロキシ情報を決定する対象の URL を含む、null 終端の Unicode 文字列へのポインタ。
pAutoProxyOptions : [var] 使用する auto-proxy オプションを指定する WINHTTP_AUTOPROXY_OPTIONS 構造体へのポインタ。
pContext : [int] 完了コールバック関数に渡されるコンテキストデータ。
%inst
指定した URL に対するプロキシデータを取得する。(WinHttpGetProxyForUrlEx)

[戻り値]
操作の結果を示すステータスコード。
（以下省略）

[備考]
この関数は HTTP リクエストのプロキシ設定を自動構成するための Web Proxy Auto-Discovery (WPAD)
プロトコルを実装する。WPAD プロトコルはプロキシ自動構成 (PAC) ファイルをダウンロードする。PAC ファイルは対象 URL
に対して使用するプロキシサーバーを特定するスクリプトである。PAC ファイルは通常、企業ネットワーク環境で IT
部門によって展開される。PAC ファイルの URL は明示的に指定することも、WinHttpGetProxyForUrlEx
にローカルネットワーク上の PAC ファイルの位置を自動検出させることもできる。WinHttpGetProxyForUrlEx は
ECMAScript ベースの PAC ファイルのみをサポートする。PAC ファイルは URL
ごとに異なるプロキシサーバーを返す可能性があるため、WinHttpGetProxyForUrlEx は URL
ごとに呼び出す必要がある。これは IT 部門が対象 URL (lpcwszUrl パラメータで指定)
をプロキシサーバー配列内の特定のプロキシにマッピング (ハッシュ)
することで、プロキシサーバーの負荷分散を実装できるため有用である。WinHttpGetProxyForUrlEx は
pAutoProxyOptions 構造体の dwFlags メンバーで自動検出が指定されている場合、autoproxy URL と
autoproxy スクリプトをキャッシュする。詳細は Autoproxy Cache
を参照。WinHttpGetProxyForUrlEx は完全に非同期でキャンセル可能な API
を提供するのに対し、WinHttpGetProxyForUrl はそうではない。また、WinHttpGetProxyForUrlEx は
PAC スクリプトから返された完全なプロキシ一覧をアプリケーションに提供し、"DIRECT"
へのフェールオーバーをよりよく扱えるようにし、必要に応じて SOCKS
を理解できるようにする。WinHttpGetProxyForUrlEx は常に非同期で実行され、成功時には即座に
ERROR_IO_PENDING を返す。コールバックは WinHttpOpen が提供する hSession に対して
WinHttpSetStatusCallback を呼び出して設定する。代わりに、WinHttpCreateProxyResolver
が提供する hResolver に対して WinHttpSetStatusCallback
を呼び出して、各呼び出しごとに固有のコールバックを設定できる。WinHttpSetStatusCallback は
WinHttpCreateProxyResolver の前に呼び出さなければならない。WinHttpSetStatusCallback
を呼び出すときは WINHTTP_CALLBACK_FLAG_REQUEST_ERROR |
WINHTTP_CALLBACK_FLAG_GETPROXYFORURL_COMPLETE を使う。コールバックの使い方の詳細は
WINHTTP_STATUS_CALLBACK
を参照。WINHTTP_CALLBACK_STATUS_GETPROXYFORURL_COMPLETE
のステータスでコールバックが返されたら、アプリケーションは WinHttpGetProxyForUrlEx
の呼び出しに使ったリゾルバーハンドルに対して WinHttpGetProxyResult を呼び出して、その呼び出しの結果を受け取れる。
ERROR_IO_PENDING
を返した後に呼び出しが失敗した場合は、WINHTTP_CALLBACK_STATUS_REQUEST_ERROR
のコールバックが発行される。この関数は常にプロセス外で実行される。


%index
WinHttpGetProxyForUrlEx2
(no summary)
%prm
hResolver, pcwszUrl, pAutoProxyOptions, cbInterfaceSelectionContext, pInterfaceSelectionContext, pContext
hResolver : [intptr] 
pcwszUrl : [wstr] 
pAutoProxyOptions : [var] 
cbInterfaceSelectionContext : [int] 
pInterfaceSelectionContext : [var] 
pContext : [int] 
%inst



%index
WinHttpGetProxyResult
WinHttpGetProxyResult 関数は、WinHttpGetProxyForUrlEx の呼び出しの結果を取得する。
%prm
hResolver, pProxyResult
hResolver : [intptr] 先に完了した WinHttpGetProxyForUrlEx の呼び出しに使用したリゾルバーハンドル。
pProxyResult : [var] WinHttpGetProxyForUrlEx への以前の呼び出しの結果を格納する WINHTTP_PROXY_RESULT 構造体へのポインタ。結果は WinHttpFreeProxyResult を呼び出して解放しなければならない。
%inst
WinHttpGetProxyResult 関数は、WinHttpGetProxyForUrlEx の呼び出しの結果を取得する。

[戻り値]
操作の結果を示すステータスコード。
（以下省略）


%index
WinHttpGetProxyResultEx
(no summary)
%prm
hResolver, pProxyResultEx
hResolver : [intptr] 
pProxyResultEx : [var] 
%inst



%index
WinHttpGetProxySettingsVersion
(no summary)
%prm
hSession, pdwProxySettingsVersion
hSession : [intptr] 
pdwProxySettingsVersion : [var] 
%inst



%index
WinHttpOpen
アプリケーションに対して WinHTTP 関数の使用を初期化し、WinHTTP セッションハンドルを返す。
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
WinHttpQueryAuthSchemes
WinHttpQueryAuthSchemes 関数は、サーバーがサポートする認証スキームを返す。
%prm
hRequest, lpdwSupportedSchemes, lpdwFirstScheme, pdwAuthTarget
hRequest : [intptr] WinHttpOpenRequest から返される有効な HINTERNET ハンドル。
lpdwSupportedSchemes : [var] サポートされている認証スキームを含むフラグを指定する unsigned int。このパラメータは次の表で定義される 1 つ以上のフラグを返すことがある。
lpdwFirstScheme : [var] サーバーが最初に列挙した認証スキームを含むフラグを指定する unsigned int。このパラメータは次の表で定義される 1 つ以上のフラグを返すことがある。
pdwAuthTarget : [var] 認証ターゲットを含むフラグを指定する unsigned int。このパラメータは次の表で定義される 1 つ以上のフラグを返すことがある。
%inst
WinHttpQueryAuthSchemes 関数は、サーバーがサポートする認証スキームを返す。

[戻り値]
成功した場合は TRUE を、失敗した場合は FALSE を返す。拡張エラー情報は GetLastError
で取得する。次の表は返されるエラーコードを示す。
（以下省略）

[備考]
WinHTTP が非同期モード (WinHttpOpen で WINHTTP_FLAG_ASYNC が設定されている状態)
で使われる場合でも、この関数は同期的に動作する。戻り値は成功または失敗を示す。拡張エラー情報は GetLastError
で取得する。WinHttpQueryAuthSchemes は WinHttpQueryHeaders を呼び出す前には使えない。注:
Windows XP および Windows 2000 については WinHttp の開始ページの Run-Time
Requirements セクションを参照。


%index
WinHttpQueryDataAvailable
WinHttpReadData で読み取り可能なデータ量(バイト単位)を返す。
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
WinHttpQueryOption
WinHttpQueryOption 関数は、指定したハンドルに対してインターネットオプションを問い合わせる。
%prm
hInternet, dwOption, lpBuffer, lpdwBufferLength
hInternet : [intptr] 情報を問い合わせる HINTERNET ハンドル。これはオプションの内容に応じてセッションハンドルまたはリクエストハンドルのいずれかを指定できる点に注意。どのハンドルを使うかは Option Flags のトピックで確認する。
dwOption : [int] 問い合わせるインターネットオプションを含む unsigned long 整数値。Option Flags の値のいずれかを指定できる。
lpBuffer : [intptr] オプション設定を受け取るバッファへのポインタ。WinHttpQueryOption 関数が返す文字列はグローバルに割り当てられているので、呼び出し側アプリケーションは使い終わった後に GlobalFree で解放しなければならない。このパラメータを NULL に設定すると関数は FALSE を返す。その後 GetLastError を呼び出すと ERROR_INSUFFICIENT_BUFFER が返り、lpdwBufferLength には要求された情報を保持するのに必要なバイト数が格納される。
lpdwBufferLength : [var] lpBuffer の長さをバイト単位で含む unsigned long 整数変数へのポインタ。関数が戻るとき、変数には lpBuffer に格納されたデータの長さが格納される。GetLastError が ERROR_INSUFFICIENT_BUFFER を返した場合、このパラメータには要求された情報を保持するのに必要なバイト数が格納される。
%inst
WinHttpQueryOption 関数は、指定したハンドルに対してインターネットオプションを問い合わせる。

[戻り値]
成功した場合は TRUE を、失敗した場合は FALSE を返す。特定のエラーメッセージを取得するには GetLastError
を呼び出す。返されるエラーコードには次のものがある:
（以下省略）

[備考]
WinHTTP が非同期モード (WinHttpOpen で WINHTTP_FLAG_ASYNC が設定されている状態)
で使われる場合でも、この関数は同期的に動作する。戻り値は成功または失敗を示す。拡張エラー情報は GetLastError で取得する。
指定したハンドルの種類に対して無効なオプションフラグが dwOption パラメータに渡された場合、GetLastError は
ERROR_INVALID_PARAMETER を返す。注: Windows XP および Windows 2000 については
WinHttp の開始ページの Run-Time Requirements セクションを参照。


%index
WinHttpReadData
WinHttpOpenRequest で開いたハンドルからデータを読み取る。
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
WinHttpReadProxySettings
(no summary)
%prm
hSession, pcwszConnectionName, fFallBackToDefaultSettings, fSetAutoDiscoverForDefaultSettings, pdwSettingsVersion, pfDefaultSettingsAreReturned, pWinHttpProxySettings
hSession : [intptr] 
pcwszConnectionName : [wstr] 
fFallBackToDefaultSettings : [int] 
fSetAutoDiscoverForDefaultSettings : [int] 
pdwSettingsVersion : [var] 
pfDefaultSettingsAreReturned : [var] 
pWinHttpProxySettings : [var] 
%inst



%index
WinHttpReceiveResponse
WinHttpSendRequest で開始された HTTP リクエストに対する応答受信を待つ。
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
WinHttpResetAutoProxy
自動プロキシをリセットする。
%prm
hSession, dwFlags
hSession : [intptr] WinHttpOpen 関数への以前の呼び出しから返される有効な HINTERNET WinHTTP セッションハンドル。
dwFlags : [int] リセット操作に影響を与えるフラグのセット。
%inst
自動プロキシをリセットする。

[戻り値]
操作の成功または失敗を示すコード。
（以下省略）

[備考]
すべてをリセットするには、dwFlags パラメータに WINHTTP_RESET_ALL と
WINHTTP_RESET_OUT_OF_PROC を含める。
注: WinHttpResetAutoProxy
関数を連続して呼び出す場合、自動プロキシの状態をリセットするには呼び出しの間隔が少なくとも 30 秒必要である。30
秒未満で呼び出すと、WinHttpResetAutoProxy 関数は ERROR_SUCCESS
を返すかもしれないが、リセットは発生しない。


%index
WinHttpSendRequest
指定のリクエストを HTTP サーバーに送信する。(WinHttpSendRequest)
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
WinHttpSetCredentials
WinHttpSetCredentials 関数は、必要な認証資格情報をサーバーに渡す。
%prm
hRequest, AuthTargets, AuthScheme, pwszUserName, pwszPassword, pAuthParams
hRequest : [intptr] WinHttpOpenRequest から返される有効な HINTERNET ハンドル。
AuthTargets : [int] 認証ターゲットを含むフラグを指定する unsigned int。次の表の値のいずれかを指定できる。
AuthScheme : [int] 認証スキームを含むフラグを指定する unsigned int。WinHttpQueryAuthSchemes から返されるサポートされている認証スキームのいずれかでなければならない。次の表は指定可能な値を示す。
pwszUserName : [wstr] 有効なユーザー名を含む文字列へのポインタ。
pwszPassword : [wstr] 有効なパスワードを含む文字列へのポインタ。パスワードは空でもよい。
pAuthParams : [intptr] このパラメータは予約済みで、NULL でなければならない。
%inst
WinHttpSetCredentials 関数は、必要な認証資格情報をサーバーに渡す。

[戻り値]
成功した場合は TRUE を、失敗した場合は FALSE を返す。拡張エラー情報は GetLastError
で取得する。次の表は返されるエラーコードを示す。
（以下省略）

[備考]
WinHTTP が非同期モード (WinHttpOpen で WINHTTP_FLAG_ASYNC が設定されている状態)
で使われる場合でも、この関数は同期的に動作する。戻り値は成功または失敗を示す。拡張エラー情報は GetLastError
で取得する。WinHttpSetCredentials で設定された資格情報は 1 回のリクエストでのみ使用され、WinHTTP
は後続のリクエストのためにキャッシュしない。そのためアプリケーションは複数の認証要求に応答できるように書かれていなければならない。認証済みの接続が再利用される場合、後続のリクエストに対して認証要求は行われないかもしれないが、コードはいつでも認証要求に応答できるようにしておく必要がある。WinHttpSetCredentials
の使用例は Authentication in WinHTTP を参照。注: Passport 認証を使って 407
ステータスコードに応答する場合、WinHTTP アプリケーションは WinHttpSetCredentials ではなく
WinHttpSetOption を使ってプロキシ資格情報を提供しなければならない。これは Passport
認証を使う場合のみ当てはまる。それ以外の場合は WinHttpSetOption はセキュリティが低いため
WinHttpSetCredentials を使うこと。注: Windows XP および Windows 2000 については
WinHttp の開始ページの Run-Time Requirements セクションを参照。


%index
WinHttpSetDefaultProxyConfiguration
既定の WinHTTP プロキシ構成をレジストリに設定する。
%prm
pProxyInfo
pProxyInfo : [var] 既定のプロキシ構成を指定する WINHTTP_PROXY_INFO 型の変数へのポインタ。
%inst
既定の WinHTTP プロキシ構成をレジストリに設定する。

[戻り値]
成功した場合は TRUE を、失敗した場合は FALSE を返す。拡張エラー情報は GetLastError
で取得する。返されるエラーコードには次のものがある。
（以下省略）

[備考]
**WinHttpSetDefaultProxyConfiguration**
で設定した既定のプロキシ構成は、WinHttpSetOption を呼び出し WINHTTP_OPTION_PROXY
フラグを指定することで、既存の WinHTTP セッションに対して上書きできる。新しいセッションに対する既定のプロキシ構成は
WinHttpOpen 関数で構成を指定することで上書きできる。プロキシを指定する場合、pProxyInfo が指す
WINHTTP_PROXY_INFO 構造体の *dwAccessType* メンバーを
WINHTTP_ACCESS_TYPE_NAMED_PROXY に設定する必要がある。そうでない場合は
WINHTTP_ACCESS_TYPE_DEFAULT_PROXY
に設定する。この関数の呼び出し後に作成された新しいセッションは、新しい既定のプロキシ構成を使う。WinHTTP が非同期モード
(WinHttpOpen で WINHTTP_FLAG_ASYNC が設定されている状態)
で使われる場合でも、この関数は同期的に動作する。戻り値は成功または失敗を示す。拡張エラー情報は GetLastError で取得する。注:
Windows XP および Windows 2000 については WinHTTP の開始ページの Run-Time
Requirements セクションを参照。


%index
WinHttpSetOption
インターネットオプションを設定する。
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


%index
WinHttpSetProxySettingsPerUser
(no summary)
%prm
fProxySettingsPerUser
fProxySettingsPerUser : [int] 
%inst



%index
WinHttpSetTimeouts
HTTP トランザクションに関わるタイムアウトを設定する。
%prm
hInternet, nResolveTimeout, nConnectTimeout, nSendTimeout, nReceiveTimeout
hInternet : [intptr] WinHttpOpen または WinHttpOpenRequest から返される HINTERNET ハンドル。
nResolveTimeout : [int] 名前解決に使うタイムアウト値 (ミリ秒単位) を指定する整数型の値。解決がこのタイムアウト値より長くかかった場合、処理はキャンセルされる。初期値は 0 で、タイムアウトしない (無限) ことを意味する。Windows Vista および Windows XP: NAME_RESOLUTION_TIMEOUT で DNS タイムアウトを指定すると、リクエストごとに 1 スレッドのオーバーヘッドが発生する。
nConnectTimeout : [int] サーバー接続要求に使うタイムアウト値 (ミリ秒単位) を指定する整数型の値。接続要求がこのタイムアウト値より長くかかった場合、リクエストはキャンセルされる。初期値は 60,000 (60 秒)。TCP/IP は、このパラメータの値に関わらず、3 段階の SYN/ACK 交換中のソケットセットアップ時にタイムアウトすることがある。
nSendTimeout : [int] リクエストの送信に使うタイムアウト値 (ミリ秒単位) を指定する整数型の値。リクエスト送信がこのタイムアウト値より長くかかった場合、送信はキャンセルされる。初期値は 30,000 (30 秒)。
nReceiveTimeout : [int] リクエストに対するレスポンス受信に使うタイムアウト値 (ミリ秒単位) を指定する整数型の値。レスポンスがこのタイムアウト値より長くかかった場合、リクエストはキャンセルされる。初期値は 30,000 (30 秒)。
%inst
HTTP トランザクションに関わるタイムアウトを設定する。

[戻り値]
成功した場合は TRUE を、失敗した場合は FALSE を返す。拡張エラー情報は GetLastError
で取得する。返されるエラーコードには次のものがある。
（以下省略）

[備考]
WinHTTP が非同期モード (WinHttpOpen で WINHTTP_FLAG_ASYNC が設定されている状態)
で使われる場合でも、この関数は同期的に動作する。戻り値は成功または失敗を示す。拡張エラー情報は GetLastError で取得する。0
または -1 の値は、タイムアウトを無期限待機に設定する。0 より大きい値はタイムアウト値をミリ秒単位で設定する。たとえば 30,000
はタイムアウトを 30 秒に設定する。-1 以外の負の値はすべて関数を ERROR_INVALID_PARAMETER
で失敗させる。重要: WinHttpSetOption と WINHTTP_OPTION_RECEIVE_TIMEOUT
を使って小さなタイムアウトを設定すると、dwReceiveTimeout
パラメータで設定した値を上書きしてしまい、レスポンスが想定より早く終了することがある。これを避けるには、WINHTTP_OPTION_RECEIVE_TIMEOUT
オプションで dwReceiveTimeout より小さな値を設定しないこと。注: Windows XP および Windows 2000
については WinHTTP の開始ページの Run-Time Requirements セクションを参照。


%index
WinHttpTimeFromSystemTime
日付と時刻を HTTP バージョン 1.0 仕様に従って書式化する。(WinHttpTimeFromSystemTime)
%prm
pst, pwszTime
pst : [var] 書式化する日付と時刻を含む SYSTEMTIME 構造体へのポインタ。
pwszTime : [wstr] 書式化された日付と時刻を受け取る文字列バッファへのポインタ。バッファのサイズは WINHTTP_TIME_FORMAT_BUFSIZE (バイト単位) と等しくする必要がある。
%inst
日付と時刻を HTTP バージョン 1.0 仕様に従って書式化する。(WinHttpTimeFromSystemTime)

[戻り値]
成功した場合は TRUE を、失敗した場合は FALSE を返す。拡張エラー情報は GetLastError
で取得する。エラーコードには次のものがある。
（以下省略）

[備考]
WinHTTP が非同期モード (WinHttpOpen で WINHTTP_FLAG_ASYNC が設定されている状態)
で使われる場合でも、この関数は同期的に動作する。戻り値は成功または失敗を示す。拡張エラー情報は GetLastError で取得する。注:
Windows XP および Windows 2000 については WinHTTP の開始ページの Run-Time
Requirements セクションを参照。


%index
WinHttpTimeToSystemTime
WinHttpTimeToSystemTime 関数は、HTTP 日時文字列を受け取り SYSTEMTIME 構造体に変換する。
%prm
pwszTime, pst
pwszTime : [wstr] 変換する null 終端の日時文字列へのポインタ。この値は RFC2616 の 3.3 節で定義された形式を使う必要がある。
pst : [var] 変換された時刻を受け取る SYSTEMTIME 構造体へのポインタ。
%inst
WinHttpTimeToSystemTime 関数は、HTTP 日時文字列を受け取り SYSTEMTIME 構造体に変換する。

[戻り値]
成功した場合は TRUE を、失敗した場合は FALSE を返す。拡張エラー情報は GetLastError
で取得する。返されるエラーコードには次のものがある:
（以下省略）

[備考]
WinHTTP が非同期モード (WinHttpOpen で WINHTTP_FLAG_ASYNC が設定されている状態)
で使われる場合でも、この関数は同期的に動作する。戻り値は成功または失敗を示す。拡張エラー情報は GetLastError で取得する。注:
Windows XP および Windows 2000 については WinHttp の開始ページの Run-Time
Requirements セクションを参照。


%index
WinHttpWebSocketClose
WebSocket 接続を閉じる。
%prm
hWebSocket, usStatus, pvReason, dwReasonLength
hWebSocket : [intptr] 型: HINTERNET WebSocket へのハンドル。注: WinHttpWebSocketClose はこのハンドルを閉じない。ハンドルを閉じるには、不要になった時点で hWebSocket に対して WinHttpCloseHandle を呼び出す。
usStatus : [int] 型: USHORT クローズステータスコード。指定可能な値は WINHTTP_WEB_SOCKET_CLOSE_STATUS を参照。
pvReason : [intptr] 型: PVOID クローズの詳細な理由。
dwReasonLength : [int] 型: DWORD pvReason の長さ (バイト単位)。pvReason が NULL の場合はこれを 0 にしなければならない。値は 0 から 123 の範囲でなければならない。
%inst
WebSocket 接続を閉じる。

[戻り値]
型: DWORD 次の例外を除いて、すべてのエラーコードは基礎となる TCP 接続が中断されたことを示す。
（以下省略）

[備考]
WinHttpWebSocketClose は WebSocket
接続を完全に閉じる。送信チャネルを閉じたまま受信チャネルを開いたままにするには WinHttpWebSocketShutdown
を使う。通常の受信操作中にクローズフレームを受信することがある。この場合 WinHttpWebSocketClose
もクローズフレームを送信する。クローズタイマーはプロパティ WINHTTP_OPTION_WEB_SOCKET_CLOSE_TIMEOUT
で設定できる。既定は 10 秒。


%index
WinHttpWebSocketCompleteUpgrade
WinHttpSendRequest で開始した WebSocket ハンドシェイクを完了する。
%prm
hRequest, pContext
hRequest : [intptr] 型: HINTERNET WebSocket ハンドシェイクの送信に使われた HTTP リクエストハンドル。
pContext : [int] 型: DWORD_PTR 新しいハンドルに関連付けるコンテキスト。
%inst
WinHttpSendRequest で開始した WebSocket ハンドシェイクを完了する。

[戻り値]
型: HINTERNET 新しい WebSocket ハンドル。NULL の場合は GetLastError
を呼び出して失敗の原因を判定する。

[備考]
WinHttpWebSocketCompleteUpgrade は、開かれた HTTP リクエストに対して呼び出し、他の
WebSocket 操作を行うための WebSocket ハンドルを取得できる。リクエストを送信する前に、WinHttpSetOption
を WINHTTP_OPTION_UPGRADE_TO_WEB_SOCKET で呼び出してリクエストハンドルを WebSocket
アップグレードとしてマークする必要がある。呼び出し側はサーバーが返した HTTP ステータスコードを確認し、ステータスコードが 101
の場合にのみこの関数を呼び出すべきである。それ以外のステータスコードで呼び出すと失敗する。


%index
WinHttpWebSocketQueryCloseStatus
サーバーが送信したクローズステータスを取得する。
%prm
hWebSocket, pusStatus, pvReason, dwReasonLength, pdwReasonLengthConsumed
hWebSocket : [intptr] 型: HINTERNET WebSocket へのハンドル。
pusStatus : [var] 型: USHORT* 戻り時に埋められるクローズステータスコードへのポインタ。指定可能な値は WINHTTP_WEB_SOCKET_CLOSE_STATUS を参照。
pvReason : [intptr] 型: PVOID 戻り時にクローズ理由を受け取るバッファへのポインタ。
dwReasonLength : [int] 型: DWORD pvReason バッファの長さ (バイト単位)。
pdwReasonLengthConsumed : [var] 型: DWORD* 消費されたバイト数。pvReason が NULL かつ dwReasonLength が 0 の場合、pdwReasonLengthConsumed には呼び出し側アプリケーションが確保する必要のあるバッファサイズが格納される。
%inst
サーバーが送信したクローズステータスを取得する。

[戻り値]
型: DWORD 成功時は NO_ERROR。それ以外の場合はエラーコード。
（以下省略）

[備考]
WinHttpWebSocketQueryCloseStatus は WinHttpWebSocketClose が成功した後、または
WinHttpWebSocketReceive が WINHTTP_WEB_SOCKET_CLOSE_BUFFER_TYPE
を返した後にのみ呼び出す。pdwReasonLengthConsumed は 123 を超えないため、少なくとも 123
バイトのバッファを確保すれば ERROR_INSUFFICIENT_BUFFER が返ることはない。


%index
WinHttpWebSocketReceive
WebSocket 接続からデータを受信する。
%prm
hWebSocket, pvBuffer, dwBufferLength, pdwBytesRead, peBufferType
hWebSocket : [intptr] 型: HINTERNET WebSocket へのハンドル。
pvBuffer : [intptr] 型: PVOID データを受け取るバッファへのポインタ。
dwBufferLength : [int] 型: DWORD pvBuffer の長さ (バイト単位)。
pdwBytesRead : [var] 型: DWORD* 操作終了時に接続から読み取られたバイト数を受け取る DWORD へのポインタ。WinHttpWebSocketReceive が NO_ERROR を返し、ハンドルが同期モードで開かれている場合にのみ設定される。
peBufferType : [var] 型: WINHTTP_WEB_SOCKET_BUFFER_TYPE* 返されたバッファの種類。WinHttpWebSocketReceive が NO_ERROR を返し、ハンドルが同期モードで開かれている場合にのみ設定される。
%inst
WebSocket 接続からデータを受信する。

[戻り値]
型: DWORD 成功時は NO_ERROR。それ以外の場合はエラーコード。
（以下省略）


%index
WinHttpWebSocketSend
WebSocket 接続でデータを送信する。
%prm
hWebSocket, eBufferType, pvBuffer, dwBufferLength
hWebSocket : [intptr] 型: HINTERNET WebSocket へのハンドル。
eBufferType : [int] 型: WINHTTP_WEB_SOCKET_BUFFER_TYPE バッファの種類。注: WINHTTP_WEB_SOCKET_CLOSE_BUFFER_TYPE は指定しないこと。接続を閉じるには WinHttpWebSocketClose または WinHttpWebSocketShutdown を使う。
pvBuffer : [intptr] 型: PVOID 送信するデータを含むバッファへのポインタ。dwBufferLength が 0 の場合にのみ NULL にできる。
dwBufferLength : [int] 型: DWORD pvBuffer の長さ。
%inst
WebSocket 接続でデータを送信する。

[戻り値]
型: DWORD 成功時は NO_ERROR。それ以外の場合はエラーコード。
（以下省略）


%index
WinHttpWebSocketShutdown
WebSocket サーバーにクローズフレームを送信して送信チャネルを閉じるが、受信チャネルは開いたままにする。
%prm
hWebSocket, usStatus, pvReason, dwReasonLength
hWebSocket : [intptr] 型: HINTERNET WebSocket へのハンドル。注: WinHttpWebSocketShutdown はこのハンドルを閉じない。ハンドルを閉じるには、不要になった時点で hWebSocket に対して WinHttpCloseHandle を呼び出す。
usStatus : [int] 型: USHORT クローズステータスコード。指定可能な値は WINHTTP_WEB_SOCKET_CLOSE_STATUS を参照。
pvReason : [intptr] 型: PVOID クローズの詳細な理由。
dwReasonLength : [int] 型: DWORD pvReason の長さ (バイト単位)。pvReason が NULL の場合はこれを 0 にしなければならない。値は 0 から 123 の範囲でなければならない。
%inst
WebSocket サーバーにクローズフレームを送信して送信チャネルを閉じるが、受信チャネルは開いたままにする。

[戻り値]
型: DWORD 次の例外を除いて、すべてのエラーコードは基礎となる TCP 接続が中断されたことを示す。
（以下省略）

[備考]
WinHttpWebSocketShutdown はクローズフレームを送信し、WebSocket
接続で追加のデータが送信されないようにする。受信チャネルは閉じない。接続を完全に閉じて後続の受信操作を防ぎたい場合は
WinHttpWebSocketClose を使う。アプリケーションは (通常の受信操作で)
サーバーからのクローズフレームを受信する責任がある。WinHttpWebSocketShutdown
を呼び出した後、アプリケーションが自分でクローズフレームを受信する必要がなく、スタックに委ねたい場合は
WinHttpWebSocketClose を呼び出せる。


%index
WinHttpWriteData
WinHttpWriteData 関数は、HTTP サーバーにリクエストデータを書き込む。
%prm
hRequest, lpBuffer, dwNumberOfBytesToWrite, lpdwNumberOfBytesWritten
hRequest : [intptr] WinHttpOpenRequest から返される有効な HINTERNET ハンドル。この関数を呼び出す前に WinHttpSendRequest が完了するのを待つ。
lpBuffer : [intptr] サーバーに送信するデータを含むバッファへのポインタ。WinHttpWriteData が完了するまでこのバッファが有効であり続けるようにすること。
dwNumberOfBytesToWrite : [int] ファイルに書き込むバイト数を含む unsigned long 整数値。
lpdwNumberOfBytesWritten : [var] バッファに書き込まれたバイト数を受け取る unsigned long 整数変数へのポインタ。WinHttpWriteData 関数は処理やエラーチェックを行う前にこの値を 0 に設定する。WinHTTP を非同期で使う場合は、このパラメータを NULL に設定し、情報はコールバック関数で取得しなければならない。そうしないとメモリフォールトを引き起こす可能性がある。
%inst
WinHttpWriteData 関数は、HTTP サーバーにリクエストデータを書き込む。

[戻り値]
成功した場合は TRUE を、失敗した場合は FALSE を返す。拡張エラー情報は GetLastError
で取得する。返されるエラーコードには次のものがある:
（以下省略）

[備考]
WinHTTP が非同期モード (WinHttpOpen で WINHTTP_FLAG_ASYNC が設定されている状態)
で使われる場合でも、この関数は同期的にも非同期的にも動作しうる。この関数が FALSE を返した場合、GetLastError
で拡張エラー情報を取得できる。TRUE を返した場合、WINHTTP_CALLBACK_STATUS_WRITE_COMPLETE
完了通知を使ってこの関数が成功したかとパラメータの値を確認する。WINHTTP_CALLBACK_STATUS_REQUEST_ERROR
完了通知は、操作が非同期に完了したが失敗したことを示す。警告: WinHTTP を非同期で使う場合は、必ず
lpdwNumberOfBytesWritten パラメータを NULL
に設定し、書き込まれたバイト数はコールバック関数で取得すること。そうしないとメモリフォールトが発生する可能性がある。アプリケーションがデータを送信している間、WinHttpReceiveResponse
を呼び出してデータ転送を終了できる。WinHttpCloseHandle
が呼び出されるとデータ転送は中止される。WinHttpSetStatusCallback
でステータスコールバック関数がインストールされている場合、WinHttpSetStatusCallback の
dwNotificationFlags パラメータで設定された次の通知のうち該当するものがサーバーへのデータ送信の進捗を示す:
（以下省略）


%index
WinHttpWriteProxySettings
(no summary)
%prm
hSession, fForceUpdate, pWinHttpProxySettings
hSession : [intptr] 
fForceUpdate : [int] 
pWinHttpProxySettings : [var] 
%inst


