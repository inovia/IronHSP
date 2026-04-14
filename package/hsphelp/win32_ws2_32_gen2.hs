; ============================================================
;   ws2_32.dll ヘルプ (CsWin32 / win32metadata から自動抽出)
;   docs_ja.json に日本語訳があればそちらを使用、無ければ英語原文。
;   翻訳を追加するときは docs_ja.json を編集して再生成。
; ============================================================

%index
FreeAddrInfoW
GetAddrInfoW 関数が addrinfoW 構造体に動的に確保したアドレス情報を解放する。
%group
Win32 ws2_32
%prm
pAddrInfo
pAddrInfo : [var] 解放する addrinfoW 構造体、または addrinfoW 構造体の連結リストへのポインタ。addrinfoW 構造体内から指し示される動的に確保された領域もすべて解放される。
%inst
GetAddrInfoW 関数が addrinfoW 構造体に動的に確保したアドレス情報を解放する。

[戻り値]
この関数は値を返さない。

[備考]
FreeAddrInfoW 関数は、Unicode 版の GetAddrInfoW 関数によって動的に確保された addrinfoW
構造体を解放する。FreeAddrInfoW 関数はまず pAddrInfo パラメータで指し示される先頭の addrinfoW
構造体を、そのメンバが指すバッファも含めて解放し、続けて ai_next メンバで連結されている後続の addrinfoW
構造体を解放していく。FreeAddrInfoW 関数は ai_next メンバが NULL
になるまで連結された構造体を解放し続ける。Winsock ヘッダファイル内のマクロによって、大文字小文字混在の関数名
FreeAddrInfo と ADDRINFOT 構造体が定義されている。この FreeAddrInfo 関数は、pAddrInfo
パラメータに ADDRINFOT 型へのポインタを渡して呼び出す必要がある。UNICODE または _UNICODE
が定義されている場合、FreeAddrInfo は Unicode 版である FreeAddrInfoW
として定義され、ADDRINFOT は addrinfoW 構造体として定義される。UNICODE または _UNICODE
が定義されていない場合、FreeAddrInfo は ANSI 版である freeaddrinfo として定義され、ADDRINFOT は
addrinfo 構造体として定義される。Windows 8.1 および Windows Server 2012 R2: この関数は
Windows 8.1、Windows Server 2012 R2 以降の Windows ストアアプリでサポートされる。
> [!NOTE] > ws2tcpip.h ヘッダは FreeAddrInfo をエイリアスとして定義しており、UNICODE
プリプロセッサ定数の定義に基づいて ANSI 版または Unicode
版を自動的に選択する。エンコーディング中立なエイリアスの使用をエンコーディング中立でないコードと混在させると、コンパイルエラーや実行時エラーにつながる不整合を招くおそれがある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
FreeAddrInfoEx
FreeAddrInfoEx 関数 (ws2tcpip.h) は、GetAddrInfoEx 関数が addrinfoex 構造体に動的に確保したアドレス情報を解放する。
%group
Win32 ws2_32
%prm
pAddrInfoEx
pAddrInfoEx : [var] 解放する addrinfoex 構造体、または addrinfoex 構造体の連結リストへのポインタ。addrinfoex 構造体内から指し示される動的に確保された領域もすべて解放される。
%inst
FreeAddrInfoEx 関数 (ws2tcpip.h) は、GetAddrInfoEx 関数が addrinfoex
構造体に動的に確保したアドレス情報を解放する。

[戻り値]
この関数は値を返さない。

[備考]
FreeAddrInfoEx 関数は、GetAddrInfoEx 関数によって動的に確保された addrinfoex
構造体を解放する。FreeAddrInfoEx 関数はまず pAddrInfo パラメータで指し示される先頭の addrinfoex
構造体を、そのメンバが指すバッファも含めて解放し、続けて ai_next メンバで連結されている後続の addrinfoex
構造体を解放していく。FreeAddrInfoEx 関数は ai_next メンバが NULL
になるまで連結された構造体を解放し続ける。UNICODE または _UNICODE が定義されている場合、FreeAddrInfoEx は
Unicode 版である FreeAddrInfoExW として定義され、ADDRINFOEX は addrinfoexW
構造体として定義される。UNICODE または _UNICODE が定義されていない場合、FreeAddrInfoEx は ANSI
版である FreeAddrInfoExA として定義され、ADDRINFOEX は addrinfoexA
構造体として定義される。Windows 8.1 および Windows Server 2012 R2: FreeAddrInfoExW
関数は Windows 8.1、Windows Server 2012 R2 以降の Windows ストアアプリでサポートされる。


%index
GetAddrInfoW
Unicode ホスト名からアドレスへのプロトコル非依存な変換を提供する。
%group
Win32 ws2_32
%prm
pNodeName, pServiceName, pHints, ppResult
pNodeName : [wstr] ホスト (ノード) 名または数値ホストアドレス文字列を含む NULL 終端 Unicode 文字列へのポインタ。インターネットプロトコルでは、数値ホストアドレス文字列はドット区切り10進表記の IPv4 アドレス、または16進表記の IPv6 アドレスである。
pServiceName : [wstr] サービス名、または文字列として表現されたポート番号を含む NULL 終端 Unicode 文字列へのポインタ。サービス名はポート番号の文字列エイリアスである。例えば "http" は、HTTP プロトコルで Web サーバーが使用する既定のポートとして IETF が定義したポート 80 のエイリアスである。ポート番号を指定しない場合に pServiceName パラメータに指定できる値は、%WINDIR%\system32\drivers\etc\services に一覧されている。
pHints : [var] 呼び出し側がサポートするソケットの種類に関するヒントを提供する addrinfoW 構造体へのポインタ。pHints パラメータが指す addrinfoW 構造体の ai_addrlen、ai_canonname、ai_addr、ai_next の各メンバはゼロまたは NULL でなければならない。そうでない場合、GetAddrInfoEx 関数は WSANO_RECOVERY で失敗する。詳細は「解説」を参照。
ppResult : [var] ホストに関する応答情報を含む 1 つ以上の addrinfoW 構造体の連結リストへのポインタ。
%inst
Unicode ホスト名からアドレスへのプロトコル非依存な変換を提供する。

[戻り値]
成功した場合はゼロを返す。失敗した場合は非ゼロの Windows ソケットエラーコード (Windows Sockets Error
Codes に記載) を返す。GetAddrInfoW 関数が返す非ゼロのエラーコードの多くは、IETF
勧告で定義されているエラー集合に対応している。以下の表はこれらのエラーコードとそれぞれに対応する WSA のエラーを示す。Winsock
プログラマにとって馴染みがあり包括的なエラー情報を提供するため、WSA エラーコードの使用が推奨される。
（以下省略）

[備考]
GetAddrInfoW 関数は、ホスト名からアドレスへのプロトコル非依存な変換を提供する関数の Unicode 版である。この関数の
ANSI 版は getaddrinfo である。GetAddrInfoW 関数は NS_DNS
名前空間についての結果を返す。複数の名前空間プロバイダから情報が返された場合、GetAddrInfoW
関数はすべての応答を集約する。IPv6 および IPv4 プロトコルで使用する場合、NS_DNS 名前空間における名前解決は
DNS、ローカルの hosts ファイル、あるいはその他の名前付け機構によって行うことができる。Winsock
ヘッダファイル内のマクロによって、大文字小文字混在の関数名 GetAddrInfo および ADDRINFOT
構造体が定義されている。この GetAddrInfo 関数は、pNodeName および pServiceName パラメータに
TCHAR 型ポインタを、pHints および ppResult パラメータに ADDRINFOT
型ポインタを指定して呼び出す必要がある。UNICODE または _UNICODE が定義されている場合、GetAddrInfo は
Unicode 版の GetAddrInfoW として定義され、ADDRINFOT は addrinfoW
構造体として定義される。UNICODE または _UNICODE が定義されていない場合、GetAddrInfo は ANSI 版の
getaddrinfo として定義され、ADDRINFOT は addrinfo 構造体として定義される。pNodeName および
pServiceName パラメータの一方または両方が NULL 終端 Unicode
文字列を指していなければならず、通常は両方指定される。成功すると、ppResult パラメータに addrinfoW
構造体の連結リストが返される。各 addrinfoW 構造体の ai_next メンバをたどって NULL
ポインタに達するまでリストを処理できる。各 addrinfoW 構造体の
ai_family、ai_socktype、ai_protocol メンバは、socket または WSASocket
関数呼び出しのそれぞれの引数に対応する。また、ai_addr メンバは ai_addrlen
メンバに長さが示されたソケットアドレス構造体を指す。pNodeName
パラメータがコンピュータ名を指す場合、送信元アドレスとして使用可能なそのコンピュータの永続アドレスがすべて返される。以降の条件分岐は
GetAddrInfoExW の解説と同様である。
GetAddrInfoW 関数の呼び出し側は、pHints パラメータで指し示す addrinfoW
構造体を通じて、サポートするソケットの種類に関するヒントを与えることができる。pHints パラメータを使用する場合、関連付けられた
addrinfoW 構造体には次のルールが適用される。
（以下省略）


%index
GetAddrInfoExW
要求を処理する名前空間プロバイダを限定する追加パラメータを伴って、プロトコル非依存の名前解決を提供する。(Unicode)
%group
Win32 ws2_32
%prm
pName, pServiceName, dwNameSpace, lpNspId, hints, ppResult, timeout, lpOverlapped, lpCompletionRoutine, lpHandle
pName : [wstr] ホスト (ノード) 名または数値ホストアドレス文字列を含む NULL 終端文字列へのポインタ。インターネットプロトコルでは、数値ホストアドレス文字列はドット区切り10進表記の IPv4 アドレス、または16進表記の IPv6 アドレスである。
pServiceName : [wstr] サービス名、または文字列として表現されたポート番号を含むオプションの NULL 終端文字列へのポインタ。サービス名はポート番号の文字列エイリアスである。例えば "http" は、HTTP プロトコルで Web サーバーが使用する既定のポートとして IETF (Internet Engineering Task Force) が定義したポート 80 のエイリアスである。ポート番号が指定されていない場合の pServiceName パラメータに指定可能な値は、%WINDIR%\system32\drivers\etc\services に一覧されている。
dwNameSpace : [int] 問い合わせ対象の名前空間プロバイダを決定するオプションの名前空間識別子。特定の名前空間識別子を指定すると、その名前空間をサポートする名前空間プロバイダのみが問い合わせられる。NS_ALL を指定すると、インストール済みかつ有効なすべての名前空間プロバイダが問い合わせられる。
lpNspId : [var] NS_DNS のような単一の名前空間に複数の名前空間プロバイダが登録されている場合に、問い合わせる特定の名前空間プロバイダのオプションの GUID へのポインタ。特定の名前空間プロバイダの GUID を渡すと、指定した名前空間プロバイダのみが問い合わせられる。名前空間プロバイダの GUID を取得するには WSAEnumNameSpaceProviders 関数を呼び出す。
hints : [var] 呼び出し側がサポートするソケットの種類についてのヒントを提供する addrinfoex 構造体へのポインタ。pHints パラメータが指す addrinfoex 構造体の ai_addrlen、ai_canonname、ai_addr、ai_next の各メンバは、ゼロまたは NULL でなければならない。そうでない場合、GetAddrInfoEx 関数は WSANO_RECOVERY で失敗する。詳細は「解説」を参照。
ppResult : [var] ホストに関する応答情報を含む 1 つ以上の addrinfoex 構造体の連結リストへのポインタ。
timeout : [var] 呼び出しを中止するまで、名前空間プロバイダからの応答を待機する時間をミリ秒単位で示すオプションのパラメータ。このパラメータは、GetAddrInfoEx 関数を呼び出す前にソース内で UNICODE または _UNICODE マクロが定義されている場合にのみサポートされる。それ以外の場合、タイムアウトオプションはサポートされないため、このパラメータは現在予約されており NULL に設定しなければならない。
lpOverlapped : [var] 非同期操作に使用されるオーバーラップ構造体へのオプションのポインタ。このパラメータは、GetAddrInfoEx 関数を呼び出す前にソース内で UNICODE または _UNICODE マクロが定義されている場合にのみサポートされる。Windows 8 および Windows Server 2012 では、lpCompletionRoutine パラメータが指定されていない場合、非同期呼び出しの完了時に通知されるよう、OVERLAPPED 構造体の hEvent メンバには手動リセットイベントを設定しなければならない。完了ルーチンが指定されている場合、hEvent メンバは NULL でなければならない。hEvent で指定したイベントがセットされた後、GetAddrInfoExOverlappedResult 関数を呼び出すことで操作結果を取得できる。Windows 8 および Windows Server 2012 で UNICODE または _UNICODE マクロが定義されていない場合、このパラメータは現在予約されており、NULL に設定しなければならない。Windows 7 および Windows Server 2008 R2 以前では、非同期操作がサポートされていないため、このパラメータは現在予約されており NULL に設定しなければならない。
lpCompletionRoutine : [int] 型: \_In_opt\_ [**LPWSAOVERLAPPED_COMPLETION_ROUTINE**](../winsock2/nc-winsock2-lpwsaoverlapped_completion_routine.md) 非同期操作の正常完了時に呼び出される関数へのオプションのポインタ。このパラメータは、GetAddrInfoEx 関数を呼び出す前にソース内で UNICODE または _UNICODE マクロが定義されている場合にのみサポートされる。Windows 8 および Windows Server 2012 では、このパラメータを指定する場合、以下のシグネチャを持つ関数へのポインタでなければならない。
lpHandle : [intptr] TBD
%inst
要求を処理する名前空間プロバイダを限定する追加パラメータを伴って、プロトコル非依存の名前解決を提供する。(Unicode)

[戻り値]
成功した場合、GetAddrInfoEx は NO_ERROR (0) を返す。失敗した場合は非ゼロの Windows
ソケットエラーコードを返す。エラーコードは Windows Sockets Error Codes を参照。GetAddrInfoEx
関数が返す非ゼロのエラーコードの多くは、IETF
勧告で定義されているエラー集合に対応している。以下の表はこれらのエラーコードとそれぞれに対応する WSA のエラーを示す。Winsock
プログラマにとってより馴染みがあり包括的なエラー情報を提供するため、WSA エラーコードの使用が推奨される。
（以下省略）

[備考]
GetAddrInfoEx
関数は、ホスト名からアドレスへ、およびサービス名からポート番号へのプロトコル非依存な変換を提供する。GetAddrInfoEx 関数は
getaddrinfo および GetAddrInfoW 関数の拡張版である。GetAddrInfoEx
関数では、問い合わせを解決する名前空間プロバイダを指定できる。GetAddrInfoEx
関数は、特定の名前空間プロバイダが指定されていない限り、複数の名前解決プロバイダからの結果を集約して返す。IPv6 および IPv4
プロトコルで使用する場合、名前解決はドメインネームシステム (DNS)、ローカルの hosts ファイル、電子メールプロバイダ
(NS_EMAIL 名前空間)、あるいはその他の名前付け機構によって行うことができる。UNICODE または _UNICODE
が定義されている場合、GetAddrInfoEx は Unicode 版である GetAddrInfoExW
として定義される。文字列パラメータは PWSTR 型で定義され、ADDRINFOEXW 構造体が使用される。Windows 8 および
Windows Server 2012
では、timeout、lpOverlapped、lpCompletionRoutine、lpNameHandle の各パラメータを使用して
GetAddrInfoEx 関数を非同期完了するよう呼び出すことができる。UNICODE または _UNICODE
が定義されていない場合、GetAddrInfoEx は ANSI 版である GetAddrInfoExA
として定義される。文字列パラメータは PCSTR 型で、ADDRINFOEXA
構造体が使用される。timeout、lpOverlapped、lpCompletionRoutine、lpNameHandle
の各パラメータは NULL に設定しなければならない。pName および pServiceName パラメータの一方または両方が NULL
終端文字列を指していなければならない。通常は両方が指定される。成功すると、ppResult パラメータに addrinfoex
構造体の連結リストが返される。返された各 addrinfoex 構造体の ai_next メンバのポインタをたどり、NULL
ポインタに達するまでリストを処理できる。返された各 addrinfoex 構造体の
ai_family、ai_socktype、ai_protocol メンバは、socket または WSASocket
関数呼び出しのそれぞれの引数に対応する。また、返された各 addrinfoex 構造体の ai_addr メンバは、ai_addrlen
メンバに長さが指定されたソケットアドレス構造体を指す。pName
パラメータがコンピュータ名を指す場合、送信元アドレスとして使用可能なそのコンピュータの永続アドレスがすべて返される。Windows
Vista 以降では、これらのアドレスには MIB_UNICASTIPADDRESS_ROW 構造体の SkipAsSource メンバが
false に設定されている GetUnicastIpAddressTable または GetUnicastIpAddressEntry
関数が返すすべてのユニキャスト IP アドレスが含まれる。pName パラメータが "localhost"
と等しい文字列を指している場合、ローカルコンピュータのすべてのループバックアドレスが返される。pName
パラメータが空文字列を含む場合、ローカルコンピュータに登録されたすべてのアドレスが返される。Windows Server 2003
以降では、pName パラメータが "..localmachine"
と等しい文字列を指している場合、ローカルコンピュータに登録されたすべてのアドレスが返される。pName
パラメータがクラスタ仮想サーバー名を参照する場合、仮想サーバーのアドレスのみが返される。Windows Vista
以降では、これらのアドレスには SkipAsSource メンバが true に設定されている
GetUnicastIpAddressTable または GetUnicastIpAddressEntry 関数が返すすべてのユニキャスト
IP アドレスが含まれる。クラスタリングの詳細は Windows Clustering を参照。Windows 7 SP1 および
Windows Server 2008 R2 SP1 では、Netsh.exe に対して IP アドレスの SkipAsSource
属性を設定するサポートが追加されている。この変更により、MIB_UNICASTIPADDRESS_ROW 構造体の
SkipAsSource メンバが false に設定されている場合、IP アドレスは DNS に登録される。SkipAsSource
メンバが true に設定されている場合、IP アドレスは DNS に登録されない。同種のホットフィックスが Windows 7 および
Windows Server 2008 R2 用にも提供されている。詳細はナレッジベース (KB) 2386184
を参照。同様のホットフィックスは Windows Vista SP2 および Windows Server 2008 SP2
にも提供されている。
GetAddrInfoEx 関数の呼び出し側は、pHints パラメータで指し示す addrinfoex
構造体を通じて、サポートするソケットの種類に関するヒントを与えることができる。pHints パラメータを使用する場合、関連付けられた
addrinfoex 構造体には次のルールが適用される。
（以下省略）


%index
GetAddrInfoExCancel
GetAddrInfoEx 関数による非同期操作をキャンセルする。
%group
Win32 ws2_32
%prm
lpHandle
lpHandle : [intptr] キャンセルする非同期操作のハンドル。これは GetAddrInfoEx 関数が lpNameHandle パラメータで返したハンドルである。
%inst
GetAddrInfoEx 関数による非同期操作をキャンセルする。

[戻り値]
成功した場合、GetAddrInfoExCancel は NO_ERROR (0) を返す。失敗した場合は非ゼロの Windows
ソケットエラーコードを返す。エラーコードは Windows Sockets Error Codes に記載されている。

[備考]
GetAddrInfoExCancel 関数は、非同期の GetAddrInfoEx
操作をキャンセルする。その結果、ユーザーの完了通知機構 (コールバックまたはイベント)
が直ちに呼び出される。結果は返されず、GetAddrInfoEx 非同期操作のエラーコードは WSA_E_CANCELLED
に設定される。GetAddrInfoEx
要求が既に完了している、タイムアウトした、あるいはハンドルが無効である場合、GetAddrInfoExCancel 関数は
WSA_INVALID_HANDLE を返す。
基盤となる多くの操作 (例えばレガシーな名前サービスプロバイダ)
は同期的であるため、これらの操作は実際にはキャンセルされない。これらの操作は実行とリソースの消費を続ける。最後の未完了の名前サービスプロバイダ要求が完了した時点でリソースが解放される。Windows
8.1 および Windows Server 2012 R2: この関数は Windows 8.1、Windows Server 2012
R2 以降の Windows ストアアプリでサポートされる。


%index
GetAddrInfoExOverlappedResult
GetAddrInfoEx 関数の非同期操作で使用される OVERLAPPED 構造体に関する戻り値コードを取得する。
%group
Win32 ws2_32
%prm
lpOverlapped
lpOverlapped : [var] 非同期操作用の OVERLAPPED 構造体へのポインタ。
%inst
GetAddrInfoEx 関数の非同期操作で使用される OVERLAPPED 構造体に関する戻り値コードを取得する。

[戻り値]
成功した場合、GetAddrInfoExOverlappedResult 関数は NO_ERROR (0)
を返す。基盤となる操作がまだ完了していない場合、GetAddrInfoExOverlappedResult 関数は
WSAEINPROGRESS を返す。失敗した場合、GetAddrInfoExOverlappedResult 関数は WSAEINVAL
を返す。

[備考]
GetAddrInfoExOverlappedResult 関数は、非同期操作のために GetAddrInfoEx
関数と組み合わせて使用する。GetAddrInfoExOverlappedResult 関数が WSAEINVAL
を返した場合、そのエラーを返したのが GetAddrInfoExOverlappedResult
関数自身なのか、非同期操作なのかを区別する唯一の方法は、lpOverlapped パラメータが NULL
でなかったかを確認することである。lpOverlapped パラメータが NULL
であれば、GetAddrInfoExOverlappedResult 関数に NULL
ポインタが渡されて失敗したことを意味する。Windows 8.1 および Windows Server 2012 R2: この関数は
Windows 8.1、Windows Server 2012 R2 以降の Windows ストアアプリでサポートされる。


%index
GetHostNameW
GetHostNameW 関数は、ローカルコンピュータの標準ホスト名を Unicode 文字列として取得する。
%group
Win32 ws2_32
%prm
name, namelen
name : [wstr] ローカルホスト名を null 終端 Unicode 文字列として受け取るバッファへのポインタ。
namelen : [int] name パラメータが指すバッファの長さをワイド文字数で指定する。
%inst
GetHostNameW 関数は、ローカルコンピュータの標準ホスト名を Unicode 文字列として取得する。

[戻り値]
エラーがない場合、GetHostNameW はゼロを返す。それ以外の場合は SOCKET_ERROR
を返し、WSAGetLastError を呼び出すことで具体的なエラーコードを取得できる。
（以下省略）

[備考]
GetHostNameW 関数は、name パラメータで指定したバッファにローカルホスト名を Unicode (UTF-16)
で返す。ホスト名は null 終端 Unicode 文字列として返される。ホスト名の形式は Windows
ソケットプロバイダに依存し、単純なホスト名の場合も完全修飾ドメイン名 (FQDN) の場合もある。いずれにしても、返される名前は
GetAddrInfoW で正常に解析できることが保証される。インターネットの普及に伴い、ASCII
文字集合で表現できない言語のインターネットホスト名を識別する必要性が高まっている。非 ASCII 文字 (Unicode) を特殊な
ASCII 文字列 (Punycode) として表現できるようにする識別子は国際化ドメイン名 (IDN)
と呼ばれる。これを標準的に扱う仕組みが IDNA (Internationalizing Domain Names in
Applications) である。GetHostNameW 関数はローカルホスト名の Punycode と Unicode
の変換は行わない。GetAddrInfoW 関数は IDN の解析および Punycode/IDN 変換をサポートする。Windows
Server 2012 でクラスタリソース上で GetHostNameW 関数を使用する場合、_CLUSTER_NETWORK_NAME_
環境変数が定義されていれば、その値が実際のホスト名より優先されて返される。クラスタリソース上では、_CLUSTER_NETWORK_NAME_
環境変数にクラスタ名が含まれる。GetHostNameW 関数は Svgguid.h ヘッダファイルで定義された
SVCID_HOSTNAME GUID
を用いて名前空間プロバイダに問い合わせ、ローカルホスト名を決定する。応答する名前空間プロバイダがない場合、GetHostNameW
関数はローカルコンピュータの NetBIOS 名を Unicode で返す。name パラメータが指すバッファに返される文字列の最大長
(ワイド文字) は名前空間プロバイダに依存するが、256 ワイド文字以下でなければならない。従って、name パラメータに 256
ワイド文字のバッファを渡し namelen に 256 を設定すれば常にバッファサイズは十分である。
Note ローカルホスト名が設定されていない場合でも、GetHostNameW は成功し、GetAddrInfoW
が解決できるトークン用ホスト名を返さなければならない。
Windows Phone 8: この関数は Windows Phone 8 以降の Windows Phone
ストアアプリでサポートされる。Windows 8.1 および Windows Server 2012 R2: この関数は Windows
8.1、Windows Server 2012 R2 以降の Windows ストアアプリでサポートされる。


%index
GetNameInfoW
アドレスから Unicode ホスト名へ、およびポート番号から Unicode サービス名へのプロトコル非依存な名前解決を提供する。
%group
Win32 ws2_32
%prm
pSockaddr, SockaddrLength, pNodeBuffer, NodeBufferSize, pServiceBuffer, ServiceBufferSize, Flags
pSockaddr : [var] ソケットの IP アドレスおよびポート番号を含むソケットアドレス構造体へのポインタ。IPv4 の場合は sockaddr_in 構造体を、IPv6 の場合は sockaddr_in6 構造体を指す。
SockaddrLength : [int] pSockaddr パラメータが指す構造体の長さをバイト数で指定する。
pNodeBuffer : [wstr] ホスト名を保持する Unicode 文字列へのポインタ。成功すると、既定で完全修飾ドメイン名 (FQDN) として Unicode ホスト名へのポインタが返される。pNodeBuffer パラメータが NULL の場合、呼び出し側はホスト名文字列を受け取らないことを示す。
NodeBufferSize : [int] pNodeBuffer パラメータが指すバッファの WCHAR 文字数。呼び出し側は、終端の NULL 文字を含む Unicode ホスト名を保持できる十分な大きさのバッファを用意しなければならない。
pServiceBuffer : [wstr] サービス名を保持する Unicode 文字列へのポインタ。成功すると、ポート番号に対応するサービス名を表す Unicode 文字列へのポインタが返される。pServiceBuffer パラメータが NULL の場合、呼び出し側はサービス名文字列を受け取らないことを示す。
ServiceBufferSize : [int] pServiceBuffer パラメータが指すバッファの WCHAR 文字数。呼び出し側は、終端の NULL 文字を含む Unicode サービス名を保持できる十分な大きさのバッファを用意しなければならない。
Flags : [int] GetNameInfoW 関数の処理をカスタマイズするために使用する値。「解説」を参照。
%inst
アドレスから Unicode ホスト名へ、およびポート番号から Unicode サービス名へのプロトコル非依存な名前解決を提供する。

[戻り値]
成功した場合、GetNameInfoW はゼロを返す。非ゼロの戻り値は失敗を示し、WSAGetLastError
を呼び出すことで具体的なエラーコードを取得できる。GetNameInfoW 関数が返す非ゼロのエラーコードは、IETF
勧告で定義されているエラー集合にも対応している。以下の表はこれらのエラーコードと WSA の対応を示す。Winsock
プログラマにとって馴染みがあり包括的なエラー情報を提供するため、WSA エラーコードの使用が推奨される。
（以下省略）

[備考]
GetNameInfoW 関数は、プロトコル非依存な名前解決を提供する関数の Unicode 版である。GetNameInfoW
関数は、ソケットアドレス構造体の内容をノード名やサービス名に変換するために使用する。IPv6 および IPv4 プロトコルで、名前解決は
DNS、ローカルの hosts ファイル、あるいはその他の名前付け機構によって行うことができる。この関数は、IPv4 または IPv6
アドレスのホスト名を決定 (逆 DNS ルックアップ)
したり、ポート番号のサービス名を決定したりするために使用できる。GetNameInfoW 関数は、SOCKADDR 構造体内の IP
アドレスやポート番号を Unicode 文字列へ変換することもできる。また、ホスト名の IP
アドレスを決定するためにも使用できる。この関数の ANSI 版は getnameinfo である。Winsock
ヘッダファイル内のマクロは、アプリケーションが Windows XP SP2 以降を対象 (_WIN32_WINNT >= 0x0502)
とする場合に使用できる大文字小文字混在の関数名 GetNameInfo を定義する。この GetNameInfo
関数は、pNodeBuffer および pServiceBuffer パラメータに TCHAR
型ポインタを指定して呼び出す必要がある。UNICODE または _UNICODE が定義されている場合、GetNameInfo は
Unicode 版として定義され、GetNameInfoW が host および serv パラメータに char
型ポインタで呼び出される。UNICODE または _UNICODE が定義されていない場合、GetNameInfo は ANSI
版として定義され、getnameinfo が pNodeBuffer および pServiceBuffer パラメータに PWCHAR
型ポインタで呼び出される。pNodeBuffer および pServiceBuffer
パラメータのバッファ要件を簡単に判断できるよう、ホスト名の最大長とサービス名の最大長を表す値が Ws2tcpip.h
ヘッダファイルに定義されている。
（以下省略）


%index
InetNtopW
InetNtop 関数は、IPv4 または IPv6 インターネットネットワークアドレスをインターネット標準形式の文字列に変換する。この関数の ANSI 版は inet_ntop である。(InetNtopW)
%group
Win32 ws2_32
%prm
Family, pAddr, pStringBuf, StringBufSize
Family : [int] アドレスファミリ。アドレスファミリとして指定可能な値は Ws2def.h ヘッダファイルで定義されている。Ws2def.h ヘッダファイルは Winsock2.h に自動的にインクルードされるため、直接使用してはならない。AF_ アドレスファミリと PF_ プロトコルファミリの定数値は同一 (例えば AF_INET と PF_INET) であるため、どちらの定数も使用できる。現在サポートされている値は AF_INET および AF_INET6 である。
pAddr : [intptr] 文字列に変換する IP アドレス (ネットワークバイトオーダー) へのポインタ。Family パラメータが AF_INET の場合、pAddr パラメータは変換する IPv4 アドレスを含む IN_ADDR 構造体を指さなければならない。Family パラメータが AF_INET6 の場合、pAddr パラメータは変換する IPv6 アドレスを含む IN6_ADDR 構造体を指さなければならない。
pStringBuf : [wstr] IP アドレスの NULL 終端文字列表現を格納するバッファへのポインタ。IPv4 アドレスの場合、このバッファは少なくとも 16 文字以上保持できる大きさが必要である。IPv6 アドレスの場合、少なくとも 46 文字以上保持できる大きさが必要である。
StringBufSize : [int] 入力時、pStringBuf パラメータが指すバッファの長さを文字数で指定する。
%inst
InetNtop 関数は、IPv4 または IPv6
インターネットネットワークアドレスをインターネット標準形式の文字列に変換する。この関数の ANSI 版は inet_ntop
である。(InetNtopW)

[戻り値]
エラーがない場合、InetNtop 関数は IP アドレスの標準形式文字列表現を含むバッファへのポインタを返す。それ以外の場合は NULL
が返され、WSAGetLastError を呼び出すことで拡張エラー情報を取得できる。関数が失敗した場合、WSAGetLastError
が返す拡張エラーコードは以下のいずれかとなる。
（以下省略）

[備考]
InetNtop 関数は Windows Vista 以降でサポートされる。InetNtop
関数はプロトコル非依存なアドレスから文字列への変換を提供する。InetNtop 関数は、pAddr
パラメータで指定したインターネットアドレス構造体を受け取り、IP アドレスを表す NULL 終端文字列を返す。inet_ntoa 関数は
IPv4 アドレスのみを扱うが、InetNtop 関数は IPv4 および IPv6 の両方のアドレスを扱える。この関数の ANSI 版は
RFC 2553 で定義されている inet_ntop である。詳細は IETF サイトの RFC 2553 を参照。InetNtop
関数は、IP アドレスから文字列への変換に Windows ソケット DLL のロードを必要としない。Family パラメータに
AF_INET を指定した場合、pAddr パラメータは変換する IPv4 アドレスを含む IN_ADDR
構造体を指さなければならない。pStringBuf パラメータが指すバッファに返されるアドレス文字列は、"192.168.16.0"
のようなドット区切り10進表記である。Family パラメータに AF_INET6 を指定した場合、pAddr パラメータは変換する
IPv6 アドレスを含む IN6_ADDR 構造体を指さなければならない。pStringBuf
パラメータが指すバッファに返されるアドレス文字列はインターネット標準形式である。基本的な文字列表現はコロン区切りの 8 個の 16
進数で構成される。連続するゼロの並びは二重コロンで置き換えられる。IPv6 アドレスの文字列表現中に二重コロンを含められるのは 1
か所のみである。IPv4 互換アドレスの場合、下位 32 ビットは IPv4 形式のドット区切り表記で表現される。pStringBuf
パラメータが指すバッファの長さが IP アドレスの文字列表現を受け取るのに十分でない場合、InetNtop は
ERROR_INVALID_PARAMETER を返す。UNICODE または _UNICODE が定義されている場合、InetNtop
は Unicode 版の InetNtopW として定義される。pStringBuf パラメータは PSTR
型で定義される。UNICODE または _UNICODE が定義されていない場合、InetNtop は ANSI 版の InetNtopA
として定義される。この関数の ANSI 版は常に inet_ntop として定義される。pStringBuf パラメータは PWSTR
型で定義される。IN_ADDR 構造体は Inaddr.h ヘッダファイルで、IN6_ADDR 構造体は In6addr.h
ヘッダファイルで定義される。Windows Vista 以降では、RtlIpv4AddressToString および
RtlIpv4AddressToStringEx 関数を使用して IN_ADDR 構造体の IPv4
アドレスをインターネット標準のドット区切り10進表記の文字列表現に変換できる。Windows Vista
以降では、RtlIpv6AddressToString および RtlIpv6AddressToStringEx 関数を使用して
IN6_ADDR 構造体の IPv6 アドレスを文字列表現に変換できる。RtlIpv6AddressToStringEx 関数は IPv6
アドレス、スコープ ID、ポートを標準形式の IPv6 文字列に変換できるため、より柔軟である。Windows 8.1 および
Windows Server 2012 R2: InetNtopW 関数は Windows 8.1、Windows Server 2012
R2 以降の Windows ストアアプリでサポートされる。


%index
InetPtonW
InetPton 関数は、IPv4 または IPv6 インターネットネットワークアドレスの標準テキスト表現を数値バイナリ形式に変換する。この関数の ANSI 版は inet_pton である。(InetPtonW)
%group
Win32 ws2_32
%prm
Family, pszAddrString, pAddrBuf
Family : [int] アドレスファミリ。アドレスファミリとして指定可能な値は Ws2def.h ヘッダファイルで定義されている。Ws2def.h ヘッダファイルは Winsock2.h に自動的にインクルードされるため、直接使用してはならない。AF_ アドレスファミリと PF_ プロトコルファミリの定数値は同一 (例えば AF_INET と PF_INET) であるため、どちらの定数も使用できる。現在サポートされている値は AF_INET および AF_INET6 である。
pszAddrString : [wstr] 数値バイナリ形式へ変換する IP アドレスのテキスト表現を含む NULL 終端文字列へのポインタ。Family パラメータが AF_INET の場合、pszAddrString パラメータは標準のドット区切り10進表記の IPv4 アドレスのテキスト表現を指さなければならない。Family パラメータが AF_INET6 の場合、pszAddrString パラメータは標準表記の IPv6 アドレスのテキスト表現を指さなければならない。
pAddrBuf : [intptr] IP アドレスの数値バイナリ表現を格納するバッファへのポインタ。IP アドレスはネットワークバイトオーダーで返される。Family パラメータが AF_INET の場合、このバッファは IN_ADDR 構造体を保持できる大きさでなければならない。Family パラメータが AF_INET6 の場合、IN6_ADDR 構造体を保持できる大きさでなければならない。
%inst
InetPton 関数は、IPv4 または IPv6
インターネットネットワークアドレスの標準テキスト表現を数値バイナリ形式に変換する。この関数の ANSI 版は inet_pton
である。(InetPtonW)

[戻り値]
エラーがない場合、InetPton 関数は 1 を返し、pAddrBuf
パラメータが指すバッファにはネットワークバイトオーダーのバイナリ数値 IP アドレスが格納される。pAddrBuf パラメータが有効な
IPv4 ドット区切り10進文字列または有効な IPv6 アドレス文字列でない文字列を指す場合、InetPton 関数は 0
を返す。それ以外の場合は -1 が返され、WSAGetLastError
を呼び出すことで拡張エラー情報を取得できる。関数がエラーになった場合、WSAGetLastError
が返す拡張エラーコードは以下のいずれかとなる。
（以下省略）

[備考]
InetPton 関数は Windows Vista 以降でサポートされる。InetPton
関数は、インターネットネットワークアドレスの標準テキスト表現から数値バイナリ形式へのプロトコル非依存な変換を提供する。InetPton
関数は pszAddrString パラメータが指すインターネットアドレスのテキスト表現を受け取り、pAddrBuf
パラメータに数値バイナリ IP アドレスへのポインタを返す。inet_addr 関数は IPv4
アドレス文字列のみを扱うが、InetPton 関数は IPv4 および IPv6 の両方のアドレス文字列を扱える。この関数の ANSI
版は RFC 2553 で定義されている inet_pton である。詳細は IETF サイトの RFC 2553
を参照。InetPton 関数は、IP アドレスを表すテキスト文字列から数値バイナリ IP アドレスへの変換に Windows ソケット
DLL のロードを必要としない。Family パラメータに AF_INET を指定した場合、pszAddrString パラメータは
"192.168.16.0" のようなドット区切り10進表記の IPv4 アドレスのテキスト文字列を指さなければならない。Family
パラメータに AF_INET6 を指定した場合、pszAddrString パラメータはインターネット標準形式の IPv6
アドレスのテキスト文字列を指さなければならない。基本的な文字列表現はコロン区切りの 8 個の 16
進数で構成される。連続するゼロの並びは二重コロンで置き換えることができる。IPv6 アドレスの文字列表現中に二重コロンを含められるのは 1
か所のみである。IPv4 互換アドレスの場合、下位 32 ビットは IPv4 形式のドット区切り表記で表現できる。UNICODE または
_UNICODE が定義されている場合、InetPton は Unicode 版の InetPtonW
として定義される。pszAddrString パラメータは PCWSTR 型で定義される。UNICODE または _UNICODE
が定義されていない場合、InetPton は ANSI 版の InetPtonA として定義される。この関数の ANSI 版は常に
inet_pton として定義される。pszAddrString パラメータは PCSTR 型で定義される。IN_ADDR 構造体は
Inaddr.h ヘッダファイルで、IN6_ADDR 構造体は In6addr.h ヘッダファイルで定義される。Windows Vista
以降では、RtlIpv4StringToAddress および RtlIpv4StringToAddressEx
関数を使用して、インターネット標準のドット区切り10進表記の IPv4 アドレスのテキスト表現を IN_ADDR
構造体として表される数値バイナリアドレスに変換できる。Windows Vista 以降では、RtlIpv6StringToAddress
および RtlIpv6StringToAddressEx 関数を使用して IPv6 アドレスの文字列表現を IN6_ADDR
構造体として表される数値バイナリ IPv6 アドレスに変換できる。RtlIpv6StringToAddressEx 関数はスコープ ID
とポートを含む標準表記の IPv6 アドレス文字列も数値バイナリ形式に変換できるため、より柔軟である。Windows 8.1 および
Windows Server 2012 R2: InetPtonW 関数は Windows 8.1、Windows Server 2012
R2 以降の Windows ストアアプリでサポートされる。


%index
SetAddrInfoExW
名前、サービス名、関連付けられたアドレスを、特定の名前空間プロバイダに登録または登録解除する。(Unicode)
%group
Win32 ws2_32
%prm
pName, pServiceName, pAddresses, dwAddressCount, lpBlob, dwFlags, dwNameSpace, lpNspId, timeout, lpOverlapped, lpCompletionRoutine, lpNameHandle
pName : [wstr] アドレスを登録または登録解除する名前を含む NULL 終端文字列へのポインタ。このパラメータの解釈は名前空間プロバイダ固有である。
pServiceName : [wstr] 登録する名前に関連付けられたサービス名を含むオプションの NULL 終端文字列へのポインタ。このパラメータの解釈は名前空間プロバイダ固有である。
pAddresses : [var] 名前空間プロバイダに登録するオプションのアドレスリストへのポインタ。
dwAddressCount : [int] pAddresses パラメータで渡すアドレスの数。このパラメータが 0 の場合、pName パラメータは名前空間プロバイダから登録解除される。
lpBlob : [var] アドレスのリスト以外に pName パラメータに関連付けるプロバイダ固有の名前空間情報を設定するために使用するデータへのオプションのポインタ。pAddresses パラメータで渡せない情報を lpBlob パラメータで渡すことができる。この情報の形式は名前空間プロバイダ固有である。
dwFlags : [int] pName および pServiceName パラメータを名前空間プロバイダにどのように登録するかを制御するフラグの集合。この情報の解釈は名前空間プロバイダ固有である。
dwNameSpace : [int] 情報を登録する名前空間プロバイダを決定する名前空間識別子。特定の名前空間識別子を渡すと、その名前空間をサポートする名前空間プロバイダにのみ情報が登録される。NS_ALL を指定すると、インストール済みで有効なすべての名前空間プロバイダに情報が登録される。
lpNspId : [var] NS_DNS のような単一の名前空間に複数の名前空間プロバイダが登録されている場合に、情報を登録する特定の名前空間プロバイダのオプションの GUID へのポインタ。特定の名前空間プロバイダの GUID を渡すと、その指定した名前空間プロバイダにのみ情報が登録される。名前空間プロバイダの GUID を取得するには WSAEnumNameSpaceProviders 関数を呼び出す。
timeout : [var] 呼び出しを中止するまで名前空間プロバイダからの応答を待機する時間をミリ秒単位で示すオプションのパラメータ。タイムアウトオプションはサポートされていないため、このパラメータは現在予約されており NULL に設定しなければならない。
lpOverlapped : [var] 非同期操作で使用されるオーバーラップ構造体へのオプションのポインタ。非同期操作はサポートされていないため、このパラメータは現在予約されており NULL に設定しなければならない。
lpCompletionRoutine : [int] 非同期操作の正常完了時に呼び出される関数へのオプションのポインタ。非同期操作はサポートされていないため、このパラメータは現在予約されており NULL に設定しなければならない。
lpNameHandle : [intptr] 非同期操作でのみ使用されるオプションのポインタ。非同期操作はサポートされていないため、このパラメータは現在予約されており NULL に設定しなければならない。
%inst
名前、サービス名、関連付けられたアドレスを、特定の名前空間プロバイダに登録または登録解除する。(Unicode)

[戻り値]
成功した場合、SetAddrInfoEx は NO_ERROR (0) を返す。失敗した場合は非ゼロの Windows
ソケットエラーコード (Windows Sockets Error Codes に記載) を返す。
（以下省略）

[備考]
SetAddrInfoEx 関数は、名前および 1
つ以上のアドレスを名前空間プロバイダに登録または登録解除するプロトコル非依存な方法を提供する。Windows Vista 以降の
NS_EMAIL 名前空間プロバイダはアドレスの登録と登録解除をサポートする。既定の
NS_DNS、NS_PNRPNAME、NS_PNRPNAME
名前空間プロバイダは、現時点では名前登録をサポートしていない。dwNameSpace パラメータに NS_ALL を設定し lpNspId
パラメータを未指定で SetAddrInfoEx 関数を呼び出した場合、SetAddrInfoEx
はインストール済みで有効なすべての名前空間に対して名前と関連アドレスの登録または登録解除を試みる。いずれかの名前空間プロバイダが登録または登録解除に成功すれば、SetAddrInfoEx
関数は成功を返すが、どの名前空間プロバイダが成功し、どれが失敗したかは示されない。UNICODE または _UNICODE
が定義されている場合、SetAddrInfoEx は Unicode 版の SetAddrInfoExW
として定義される。文字列パラメータは PWSTR 型で定義される。UNICODE または _UNICODE
が定義されていない場合、SetAddrInfoEx は ANSI 版の SetAddrInfoExA として定義される。文字列パラメータは
PCSTR 型である。名前空間プロバイダに登録された情報は、GetAddrInfoEx、getaddrinfo、GetAddrInfoW
関数の呼び出しによって取得できる。GetAddrInfoEx 関数は getaddrinfo および GetAddrInfoW
関数の拡張版である。Windows Vista 以降では、サービスから SetAddrInfoEx
を呼び出す場合、操作がユーザープロセスによるサービス呼び出しの結果であるなら、サービスはユーザーを偽装する必要がある。これはセキュリティとルーティングコンパートメントを適切に適用するためである。
Windows 8.1 および Windows Server 2012 R2: SetAddrInfoExW 関数は Windows
8.1、Windows Server 2012 R2 以降の Windows ストアアプリでサポートされる。
> [!NOTE] > ws2tcpip.h ヘッダは SetAddrInfoEx をエイリアスとして定義しており、UNICODE
プリプロセッサ定数の定義に基づいて ANSI 版または Unicode
版を自動的に選択する。エンコーディング中立なエイリアスの使用をエンコーディング中立でないコードと混在させると、コンパイルエラーや実行時エラーにつながる不整合を招くおそれがある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
closesocket
The closesocket function (winsock.h) closes an existing socket.
%group
Win32 ws2_32
%prm
s
s : [int] A descriptor identifying the socket to close.
%inst
The closesocket function (winsock.h) closes an existing socket.

[戻り値]
If no error occurs, closesocket returns zero. Otherwise, a value of
SOCKET_ERROR is returned, and a specific error code can be retrieved
by calling WSAGetLastError.
This doc was truncated.

[備考]
The closesocket function closes a socket. Use it to release the
socket descriptor passed in the s parameter. Note that the socket
descriptor passed in the s parameter may immediately be reused by the
system as soon as closesocket function is issued. As a result, it is
not reliable to expect further references to the socket descriptor
passed in the s parameter to fail with the error WSAENOTSOCK. A
Winsock client must never issue closesocket on s concurrently with
another Winsock function call. Any pending overlapped send and
receive operations ( WSASend/ WSASendTo/ WSARecv/ WSARecvFrom with an
overlapped socket) issued by any thread in this process are also
canceled. Any event, completion routine, or completion port action
specified for these overlapped operations is performed. The pending
overlapped operations fail with the error status
WSA_OPERATION_ABORTED. An application should not assume that any
outstanding I/O operations on a socket will all be guaranteed to
completed when closesocket returns. The closesocket function will
initiate cancellation on the outstanding I/O operations, but that
does not mean that an application will receive I/O completion for
these I/O operations by the time the closesocket function returns.
Thus, an application should not cleanup any resources (WSAOVERLAPPED
structures, for example) referenced by the outstanding I/O requests
until the I/O requests are indeed completed.
An application should always have a matching call to closesocket for
each successful call to socket to return any socket resources to the
system. The linger structure maintains information about a specific
socket that specifies how that socket should behave when data is
queued to be sent and the closesocket function is called on the
socket. The l_onoff member of the linger structure determines whether
a socket should remain open for a specified amount of time after a
This doc was truncated.


%index
WPUCompleteOverlappedRequest
WPUCompleteOverlappedRequest 関数は、オーバーラップ I/O 操作のオーバーラップ I/O 完了通知を行う。
%group
Win32 ws2_32
%prm
s, lpOverlapped, dwError, cbTransferred, lpErrno
s : [int] WPUCreateSocketHandle によって作成されたサービスプロバイダソケット。
lpOverlapped : [var] 完了通知の対象となるオーバーラップ I/O 操作に関連付けられた WSAOVERLAPPED 構造体へのポインタ。
dwError : [int] 完了通知の対象となるオーバーラップ I/O 操作の完了ステータス。
cbTransferred : [int] クライアントバッファとの間で転送されたバイト数 (転送方向は完了通知の対象となるオーバーラップ I/O 操作が送信か受信かによる)。
lpErrno : [var] この関数の実行から生じるエラーコードへのポインタ。
%inst
WPUCompleteOverlappedRequest 関数は、オーバーラップ I/O 操作のオーバーラップ I/O 完了通知を行う。

[戻り値]
エラーがない場合、**WPUCompleteOverlappedRequest**
はゼロを返し、クライアントが選択した機構に従ってオーバーラップ I/O 操作の完了通知を行う (lpOverlapped が参照する
WSAOVERLAPPED
構造体内のイベントをシグナル化する、あるいは完了ポートがソケットに関連付けられていれば完了ステータスレポートを完了ポートにキューイングする)。それ以外の場合、**WPUCompleteOverlappedRequest**
は SOCKET_ERROR を返し、具体的なエラーコードは lpErrno から取得できる。
（以下省略）

[備考]
**WPUCompleteOverlappedRequest**
関数は、クライアントが指定した完了通知機構がユーザーモード非同期プロシージャ呼び出し (APC) 以外であるオーバーラップ I/O
操作の完了通知を行う。この関数は WPUCreateSocketHandle
によって作成されたソケットハンドルに対してのみ使用できる。**Note** この関数は、"WPU"
プレフィックスを持つ他の関数と異なり、アップコールテーブル経由でアクセスされない。その代わり Ws2_32.dll
によって直接エクスポートされている。この関数を呼び出す必要があるサービスプロバイダは、WS2_32.lib
とリンクするか、LoadLibrary や GetProcAddress などの適切な OS
関数を使って関数ポインタを取得する必要がある。**WPUCompleteOverlappedRequest**
関数は、公開するソケットハンドルに対してインストール可能ファイルシステム (IFS)
機能を直接実装しないサービスプロバイダが使用する。クライアントが指定した完了通知がユーザーモード APC 以外であるオーバーラップ I/O
要求の完了通知を行う。**WPUCompleteOverlappedRequest** は WPUCreateSocketHandle
によって作成されたソケットハンドルに対してのみサポートされ、サービスプロバイダが直接作成したソケットに対してはサポートされない。クライアントが通知方法としてユーザーモード
APC を選択した場合、サービスプロバイダは WPUQueueApc などの適切な OS 関数で完了通知を行う必要がある。ユーザーモード
APC が選択されていない場合、IFS
機能を直接実装していないサービスプロバイダは、クライアントが完了ポートをソケットハンドルに関連付けているかどうかを判断できないため、完了通知の方法が完了ポートへの完了ステータスレコードのキューイングなのか、WSAOVERLAPPED
構造体内のイベントのシグナル化なのかを判断できない。Windows Socket 2 アーキテクチャは
WPUCreateSocketHandle
で作成されたソケットに関連付けられた完了ポートを追跡し、完了ポートベース通知とイベントベース通知のどちらが適切かを正しく判断できる。**WPUCompleteOverlappedRequest**
は完了通知をキューに入れる際、WSAOVERLAPPED 構造体の **InternalHigh**
メンバに転送バイト数を設定する。その後、**Internal** メンバを、特殊値 WSS_OPERATION_IN_PROGRESS
以外の OS
依存の値に設定する。処理が非同期的に行われる可能性があるため、**WPUCompleteOverlappedRequest**
の戻り後、これらの値が現れるまでに若干の遅延があることがある。ただし、**InternalHigh** の値 (バイト数) は
**Internal**
がセットされる時点までにセットされていることが保証される。**WPUCompleteOverlappedRequest**
は、ソケットハンドルが完了ポートに関連付けられているかどうかに関わらず、前述のとおり (クライアントが要求した完了通知を実行)
動作する。**WSPGetOverlappedResult との相互作用**
**WPUCompleteOverlappedRequest** の動作は、WSPGetOverlappedResult
をサービスプロバイダがどのように実装するかに制約を課す。WSAOVERLAPPED 構造体のうち **Offset** および
**OffsetHigh** メンバのみがサービスプロバイダが排他的に制御できるが、3 つの値 (バイト数、フラグ、エラー) を
**WSPGetOverlappedResult**
で構造体から取得しなければならないためである。サービスプロバイダはその方法を選択できるが、**WPUCompleteOverlappedRequest**
の動作と正しく連携しなければならない。典型的な実装は次のとおりである:
- オーバーラップ処理開始時、サービスプロバイダは **Internal** を WSS_OPERATION_IN_PROGRESS
に設定する。 - I/O 操作が完了したとき、プロバイダは **OffsetHigh** を操作から生じた Windows Socket
2 エラーコードに、**Offset** を I/O 操作の結果のフラグに設定し、転送バイト数をパラメータの 1 つとして
**WPUCompleteOverlappedRequest**
を呼び出す。**WPUCompleteOverlappedRequest** は最終的に **InternalHigh**
を転送バイト数に設定し、**Internal** を WSS_OPERATION_IN_PROGRESS 以外の値に設定する。 -
WSPGetOverlappedResult が呼び出されたとき、サービスプロバイダは **Internal**
を確認する。WSS_OPERATION_IN_PROGRESS であれば、**WSPGetOverlappedResult** の
FWAIT フラグの設定に応じて **hEvent**
メンバのイベントハンドルで待機するかエラーを返す。進行中でない場合、または待機完了後、プロバイダは
**InternalHigh**、**OffsetHigh**、**Offset**
の値をそれぞれ転送バイト数、操作結果のエラーコード、フラグとして返す。


%index
WSAAccept
WSAAccept 関数は、条件関数の戻り値に基づいて条件付きで接続を受け入れ、QoS フロー仕様を提供し、接続データの転送を可能にする。
%group
Win32 ws2_32
%prm
s, addr, addrlen, lpfnCondition, dwCallbackData
s : [int] listen 関数呼び出し後、接続を待ち受けているソケットを識別する記述子。
addr : [var] 通信層が認識している接続相手のアドレスを受け取る sockaddr 構造体へのオプションのポインタ。addr パラメータの正確な形式は、ソケット作成時に確立されたアドレスファミリによって決定される。
addrlen : [var] addr パラメータが指す sockaddr 構造体の長さ (バイト単位) を含む整数へのオプションのポインタ。
lpfnCondition : [int] パラメータとして渡される呼び出し元情報に基づいて受け入れ/拒否判断を行い、さらにこの関数の result パラメータ g に適切な値を代入することでソケットグループを作成または参加するオプションのアプリケーション指定条件関数のアドレス。このパラメータが NULL の場合、条件関数は呼び出されない。
dwCallbackData : [int] コールバックデータ。アプリケーション指定の条件関数に、その dwCallbackData パラメータ値として渡される。このパラメータは lpfnCondition パラメータが NULL でない場合のみ有効である。このパラメータは Windows ソケットによっては解釈されない。
%inst
WSAAccept 関数は、条件関数の戻り値に基づいて条件付きで接続を受け入れ、QoS フロー仕様を提供し、接続データの転送を可能にする。

[戻り値]
エラーがない場合、WSAAccept は受け入れたソケットの記述子となる SOCKET 型の値を返す。それ以外の場合は
INVALID_SOCKET を返し、WSAGetLastError を呼び出すことで具体的なエラーコードを取得できる。addrlen
が参照する整数は、最初は addr が指す領域の大きさを含んでおり、戻り時には実際に返されたアドレスの長さ (バイト単位) を含む。
（以下省略）

[備考]
WSAAccept 関数は、ソケット s の保留接続キューから最初の接続を取り出し、条件関数が指定されていれば (つまり NULL
でなければ) それに対してチェックを行う。条件関数が CF_ACCEPT を返すと、WSAAccept
は新しいソケットを作成する。新しく作成されたソケットは、WSAAsyncSelect や WSAEventSelect
で登録された非同期イベントを含め、ソケット s と同じプロパティを持つ。条件関数が CF_REJECT を返すと、WSAAccept
は接続要求を拒否する。条件関数はこの関数と同じスレッドで実行されるため、できるだけ早く戻るべきである。判断を直ちに行えない場合、条件関数は
CF_DEFER
を返して判断が行われていないことを示す必要があり、サービスプロバイダは接続要求に対して何もすべきでない。アプリケーションが接続要求に対して動作可能になったら、再度
WSAAccept を呼び出し、条件関数の戻り値として CF_ACCEPT か CF_REJECT を返す。既定モード (ブロッキング)
のソケットは、アプリケーションが WSAAccept
を呼び出したときキューに保留接続がない場合、接続が現れるまでブロックする。ノンブロッキングモードのソケットは、WSAAccept
を呼び出してもキューに保留接続がない場合、WSAEWOULDBLOCK エラーで失敗する。WSAAccept
が成功して新しいソケットハンドルを返した後、その受け入れたソケットはそれ以上接続を受け入れるためには使用できない。元のソケットは開いたまま残り、新しい接続要求をリッスンし続ける。addr
パラメータは通信層が認識する接続相手のアドレスで埋められる結果パラメータである。addr
パラメータの正確な形式は通信が行われているアドレスファミリによって決定される。addrlen は値-結果パラメータで、最初に addr
が指す領域の大きさを含んでいなければならず、戻り時には実際に返されたアドレスの長さ (バイト単位) が含まれる。この呼び出しは
SOCK_STREAM のような接続指向ソケットタイプで使用する。addr や addrlen が NULL
の場合、受け入れたソケットのリモートアドレスに関する情報は返されない。それ以外の場合は、接続が正常に受け入れられればこれら 2
つのパラメータが埋められる。条件関数のプロトタイプは Winsock2.h ヘッダファイルに LPCONDITIONPROC
として以下のように定義される。
（以下省略）


%index
WSAAddressToStringW
sockaddr 構造体のすべての要素を、可読なアドレスの文字列表現に変換する。(Unicode)
%group
Win32 ws2_32
%prm
lpsaAddress, dwAddressLength, lpProtocolInfo, lpszAddressString, lpdwAddressStringLength
lpsaAddress : [var] 文字列に変換する sockaddr 構造体へのポインタ。
dwAddressLength : [int] lpsaAddress パラメータが指す sockaddr 構造体のアドレス長 (バイト単位)。dwAddressLength パラメータの大きさはプロトコルによって異なる。
lpProtocolInfo : [var] 特定のプロバイダの WSAPROTOCOL_INFO 構造体へのポインタ。このパラメータが NULL の場合、呼び出しは lpsaAddress パラメータで示されたアドレスファミリをサポートする最初のプロトコルのプロバイダにルーティングされる。
lpszAddressString : [wstr] 可読アドレス文字列を受け取るバッファへのポインタ。
lpdwAddressStringLength : [var] 入力時、このパラメータは lpszAddressString パラメータが指すバッファの長さを指定する。長さは ANSI 文字列ではバイト単位、Unicode 文字列では WCHAR 単位で表現される。出力時、このパラメータは lpszAddressString パラメータが指すバッファに実際にコピーされた NULL 終端を含む文字列の長さを返す。指定したバッファが十分な大きさでない場合、関数は WSAEFAULT エラーで失敗し、このパラメータには必要なサイズが設定される。
%inst
sockaddr 構造体のすべての要素を、可読なアドレスの文字列表現に変換する。(Unicode)

[戻り値]
エラーがない場合、WSAAddressToString はゼロを返す。それ以外の場合は SOCKET_ERROR
を返し、WSAGetLastError を呼び出すことで具体的なエラー番号を取得できる。
（以下省略）

[備考]
WSAAddressToString 関数は、プロトコル非依存なアドレスから文字列への変換を提供する。WSAAddressToString
関数は lpsaAddress パラメータが指すソケットアドレス構造体を受け取り、lpszAddressString
パラメータにソケットアドレスを表す NULL 終端文字列へのポインタを返す。inet_ntoa 関数は IPv4
アドレスのみを扱うが、WSAAddressToString 関数はローカルコンピュータ上の Winsock
プロバイダがサポートする任意のソケットアドレス (IPv6 アドレスを含む) を扱える。lpsaAddress パラメータが IPv4
ソケットアドレス (アドレスファミリが AF_INET) を指す場合、lpszAddressString
パラメータが指すバッファに返されるアドレス文字列は "192.168.16.0"
のようなドット区切り10進表記である。lpsaAddress パラメータが IPv6 ソケットアドレス (アドレスファミリが
AF_INET6) を指す場合、lpszAddressString
パラメータが指すバッファに返されるアドレス文字列はインターネット標準形式である。基本的な文字列表現はコロン区切りの 8 個の 16
進数で構成される。連続するゼロの並びは二重コロンで置き換えられる。IPv6 アドレスの文字列表現中に二重コロンを含められるのは 1
か所のみである。lpszAddressString
パラメータが指すバッファの長さがソケットアドレスの文字列表現を受け取るのに十分でない場合、WSAAddressToString は
WSAEFAULT を返す。IPv6 アドレスのサポートは Windows XP SP1 以降で WSAAddressToString
関数に追加された。WSAAddressToString 関数が IPv6 アドレスをサポートするには、ローカルコンピュータに IPv6
もインストールされている必要がある。Windows Phone 8: WSAAddressToStringW 関数は Windows
Phone 8 以降の Windows Phone ストアアプリでサポートされる。Windows 8.1 および Windows
Server 2012 R2: WSAAddressToStringW 関数は Windows 8.1、Windows Server
2012 R2 以降の Windows ストアアプリでサポートされる。
> [!NOTE] > winsock2.h ヘッダは WSAAddressToString
をエイリアスとして定義しており、UNICODE プリプロセッサ定数の定義に基づいて ANSI 版または Unicode
版を自動的に選択する。エンコーディング中立なエイリアスの使用をエンコーディング中立でないコードと混在させると、コンパイルエラーや実行時エラーにつながる不整合を招くおそれがある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
WSAAdvertiseProvider
特定の名前空間バージョン 2 プロバイダを、対象のすべてのクライアントに対して利用可能にする。
%group
Win32 ws2_32
%prm
puuidProviderId, pNSPv2Routine
puuidProviderId : [var] アドバタイズする名前空間プロバイダのプロバイダ ID へのポインタ。
pNSPv2Routine : [var] プロバイダがサポートする名前空間サービスプロバイダバージョン 2 のエントリポイントを含む **NSPV2_ROUTINE** 構造体へのポインタ。
%inst
特定の名前空間バージョン 2 プロバイダを、対象のすべてのクライアントに対して利用可能にする。

[戻り値]
エラーがない場合、WSAProviderCompleteAsyncCall はゼロを返す。関数が失敗した場合、戻り値は
SOCKET_ERROR である。拡張エラー情報を取得するには WSAGetLastError
を呼び出す。以下のいずれかの拡張エラー値が返される。
（以下省略）

[備考]
**WSAAdvertiseProvider** 関数は、Windows Vista 以降で利用可能な名前空間サービスプロバイダバージョン
2 (NSPv2) アーキテクチャの一部として使用される。Windows Vista および Windows Server 2008
では、**WSAAdvertiseProvider** 関数は NS_EMAIL
名前空間プロバイダに対する操作にのみ使用できる。**WSAAdvertiseProvider** 関数は、クライアントが発見できるように
NSPv2 プロバイダのインスタンスをアドバタイズする。アドバタイズするインスタンスがアプリケーション型プロバイダ
(NAPI_PROVIDER_INSTALLATION_BLOB 構造体の **dwProvideType** メンバが
**ProviderType_Application** である名前空間プロバイダ)
のインスタンスである場合、アドバタイズされたプロバイダインスタンスは、**WSAAdvertiseProvider**
の呼び出し元と同じユーザー、同じセッションで実行されているすべてのクライアントプロセスから可視となる。一般に NSPv2
プロバイダは呼び出し元アプリケーションとは別のプロセスで実装される。NSPv2
プロバイダはクライアントの活動によってアクティブ化されるわけではない。各プロバイダホスティングアプリケーションは、**WSAAdvertiseProvider**
および WSAUnadvertiseProvider 関数を呼び出すことで、特定のプロバイダを利用可能にする /
利用不可にするタイミングを決定する。クライアントの活動はプロバイダが利用可能 (名前空間プロバイダがアドバタイズ済み)
であるときにプロバイダへの接触を試みるだけである。**WSAAdvertiseProvider** 関数は、対象のすべてのクライアント
(現在はホスティングアプリケーションと同じ資格情報、同じユーザーセッションで実行されているすべてのアプリケーション)
に対して特定のプロバイダを利用可能にしたいアプリケーションによって呼び出される。
プロセスは複数のプロバイダを同時に実装しアドバタイズできる。Windows
ソケットは呼び出しを正しいプロバイダにディスパッチして名前空間プロバイダを管理する。また、RPC
インターフェイスの詳細を隠蔽し、プロセス間呼び出しをプロセス内呼び出しに変換する。そのため、NSPv2 プロバイダは NSPv1
プロバイダが使用する NSP_ROUTINE 構造体に類似したエントリポイント関数のテーブルを実装するだけで済む。NSPv2 プロバイダは
RPC 固有の要件 (データのマーシャリングやシリアライゼーションなど) を気にする必要はない。
**WSAAdvertiseProvider** の呼び出し元は、プロバイダがサポートする NSPv2 エントリポイントを持つ
NSPV2_ROUTINE 構造体へのポインタを pNSPv2Routine パラメータに渡す。
WSAUnadvertiseProvider 関数は、特定の名前空間プロバイダをクライアントから利用不可にする。


%index
WSAAsyncGetHostByAddr
WSAAsyncGetHostByAddr マクロ関数 (wsipv6ok.h) は、アドレスに対応するホスト情報を非同期に取得する。
%group
Win32 ws2_32
%prm
hWnd, wMsg, addr, len, type, buf, buflen
hWnd : [intptr] 
wMsg : [int] 
addr : [str] 
len : [int] 
type : [int] 
buf : [str] 
buflen : [int] 
%inst
WSAAsyncGetHostByAddr マクロ関数 (wsipv6ok.h) は、アドレスに対応するホスト情報を非同期に取得する。

[備考]
WSAAsyncGetHostByAddr 関数は gethostbyaddr
の非同期版である。ネットワークアドレスに対応するホスト名とアドレス情報を取得するために使用される。Windows
ソケットは操作を開始し、呼び出し元に直ちに制御を戻し、アプリケーションが操作を識別するために使用できる不透明な非同期タスクハンドルを返す。操作が完了すると、結果
(もしあれば)
が呼び出し元から提供されたバッファにコピーされ、アプリケーションのウィンドウにメッセージが送信される。非同期操作が完了すると、hWnd
パラメータで示されたアプリケーションウィンドウは wMsg パラメータで指定されたメッセージを受信する。wParam
パラメータには元の関数呼び出しによって返された非同期タスクハンドルが含まれる。lParam の上位 16
ビットにはエラーコードが含まれる。エラーコードは Winsock2.h
で定義されている任意のエラーである。エラーコードがゼロの場合は非同期操作の正常完了を示す。正常完了時、元の関数呼び出しで指定したバッファには
hostent 構造体が含まれる。この構造体のメンバにアクセスするには、元のバッファアドレスを hostent
構造体ポインタにキャストして適切にアクセスする。エラーコードが WSAENOBUFS の場合は、元の呼び出しで buflen
が指定したバッファサイズがすべての結果情報を含むには小さすぎたことを示す。この場合、lParam の下位 16
ビットには必要情報を提供するために必要なバッファのサイズが含まれる。アプリケーションが部分データが不十分であると判断した場合、必要な情報をすべて受け取れるだけの大きさのバッファを用意して
WSAAsyncGetHostByAddr 関数呼び出しを再発行できる (lParam の下位 16
ビット以上)。この関数に指定されたバッファは、Windows ソケットが hostent
構造体とそのメンバが参照するデータ領域の内容を一緒に構築するために使用される。WSAENOBUFS
エラーを回避するため、アプリケーションは少なくとも MAXGETHOSTSTRUCT バイト (Winsock2.h で定義)
のバッファを提供すべきである。エラーコードとバッファ長は Winsock2.h に以下のように定義されているマクロ
WSAGETASYNCERROR および WSAGETASYNCBUFLEN を用いて lParam から取り出すべきである。
（以下省略）


%index
WSAAsyncGetHostByName
WSAAsyncGetHostByName マクロ関数 (wsipv6ok.h) は、ホスト名に対応するホスト情報を非同期に取得する。
%group
Win32 ws2_32
%prm
hWnd, wMsg, name, buf, buflen
hWnd : [intptr] 
wMsg : [int] 
name : [str] 
buf : [str] 
buflen : [int] 
%inst
WSAAsyncGetHostByName マクロ関数 (wsipv6ok.h) は、ホスト名に対応するホスト情報を非同期に取得する。

[備考]
WSAAsyncGetHostByName 関数は gethostbyname
の非同期版であり、ホスト名に対応するホスト名とアドレス情報を取得するために使用される。Windows
ソケットは操作を開始し、呼び出し元に直ちに制御を戻し、アプリケーションが操作を識別するために使用できる不透明な非同期タスクハンドルを返す。操作が完了すると、結果
(もしあれば)
が呼び出し元から提供されたバッファにコピーされ、アプリケーションのウィンドウにメッセージが送信される。非同期操作が完了すると、hWnd
パラメータで示されたアプリケーションウィンドウは wMsg パラメータで指定されたメッセージを受信する。wParam
パラメータには元の関数呼び出しによって返された非同期タスクハンドルが含まれる。lParam の上位 16
ビットにはエラーコードが含まれる。エラーコードは Winsock2.h
で定義されている任意のエラーである。エラーコードがゼロの場合は非同期操作の正常完了を示す。正常完了時、元の関数呼び出しで指定したバッファには
hostent 構造体が含まれる。この構造体の要素にアクセスするには、元のバッファアドレスを hostent
構造体ポインタにキャストして適切にアクセスする。エラーコードが WSAENOBUFS の場合、元の呼び出しで buflen
が指定したバッファサイズが結果情報をすべて含むには小さすぎたことを示す。この場合、lParam の下位 16
ビットには必要情報を提供するために必要なバッファサイズが含まれる。アプリケーションが部分データが不十分であると判断した場合、WSAAsyncGetHostByName
関数呼び出しを必要な情報をすべて受け取れる十分大きさのバッファで再発行できる (lParam の下位 16
ビット以上)。この関数に指定されたバッファは、Windows ソケットが hostent
構造体とそのメンバが参照するデータ領域の内容を一緒に構築するために使用される。WSAENOBUFS
エラーを回避するため、アプリケーションは少なくとも MAXGETHOSTSTRUCT バイト (Winsock2.h で定義)
のバッファを提供すべきである。エラーコードとバッファ長は Winsock2.h に以下のように定義されているマクロ
WSAGETASYNCERROR および WSAGETASYNCBUFLEN を使って lParam から取り出すべきである。
（以下省略）


%index
WSAAsyncGetProtoByName
WSAAsyncGetProtoByName 関数 (winsock.h) は、プロトコル名に対応するプロトコル情報を非同期に取得する。
%group
Win32 ws2_32
%prm
hWnd, wMsg, name, buf, buflen
hWnd : [intptr] 非同期要求が完了したときにメッセージを受信するウィンドウのハンドル。
wMsg : [int] 非同期要求が完了したときに受信するメッセージ。
name : [str] 解決対象のプロトコル名 (null 終端) へのポインタ。
buf : [str] protoent データを受け取るデータ領域へのポインタ。データ領域は protoent 構造体とそのメンバが参照するすべてのデータを格納するために使用されるため、protoent 構造体のサイズより大きくなければならない。MAXGETHOSTSTRUCT バイトのバッファが推奨される。
buflen : [int] buf パラメータのデータ領域のサイズ (バイト単位)。
%inst
WSAAsyncGetProtoByName 関数 (winsock.h) は、プロトコル名に対応するプロトコル情報を非同期に取得する。

[戻り値]

戻り値は、非同期操作が正常に開始されたかどうかを示す。操作自体の成功または失敗を意味するものではない。エラーがない場合、WSAAsyncGetProtoByName
は要求の非同期タスクハンドルとなる HANDLE 型の非ゼロ値を返す (Windows の HTASK と混同しないこと)。この値は 2
通りに使用できる。WSACancelAsyncRequest を使って操作をキャンセルするために使うか、wParam
メッセージパラメータを調べて非同期操作と完了メッセージを対応付けるために使うことができる。非同期操作を開始できなかった場合、WSAAsyncGetProtoByName
はゼロを返し、具体的なエラー番号は WSAGetLastError
を呼び出すことで取得できる。以下のエラーコードはアプリケーションウィンドウがメッセージを受信したときに設定される可能性がある。前述のとおり、これらは
WSAGETASYNCERROR マクロを使って応答メッセージの lParam から取り出せる。
（以下省略）

[備考]
WSAAsyncGetProtoByName 関数は getprotobyname
の非同期版である。指定したプロトコル名に対応するプロトコル名と番号を、Windows
ソケットデータベースから取得するために使用される。Windows
ソケットは操作を開始し、呼び出し元に直ちに制御を戻し、アプリケーションが操作を識別するために使用できる不透明な非同期タスクハンドルを返す。操作が完了すると、結果
(もしあれば)
が呼び出し元から提供されたバッファにコピーされ、アプリケーションのウィンドウにメッセージが送信される。非同期操作が完了すると、hWnd
パラメータで示されたアプリケーションウィンドウは wMsg パラメータで指定されたメッセージを受信する。wParam
パラメータには元の関数呼び出しによって返された非同期タスクハンドルが含まれる。lParam の上位 16
ビットにはエラーコードが含まれる。エラーコードは Winsock2.h
で定義されている任意のエラーである。エラーコードがゼロの場合は非同期操作の正常完了を示す。正常完了時、元の関数呼び出しで指定したバッファには
protoent 構造体が含まれる。この構造体のメンバにアクセスするには、元のバッファアドレスを protoent
構造体ポインタにキャストして適切にアクセスする。エラーコードが WSAENOBUFS の場合、元の呼び出しで buflen
が指定したバッファサイズが結果情報をすべて含むには小さすぎたことを示す。この場合、lParam の下位 16
ビットには必要情報を提供するために必要なバッファサイズが含まれる。アプリケーションが部分データを不十分と判断した場合、WSAAsyncGetProtoByName
関数呼び出しを必要な情報をすべて受け取れる十分大きさのバッファで再発行できる (lParam の下位 16
ビット以上)。この関数に指定されたバッファは、Windows ソケットが protoent
構造体とそのメンバが参照するデータ領域の内容を一緒に構築するために使用される。WSAENOBUFS
エラーを回避するため、アプリケーションは少なくとも MAXGETHOSTSTRUCT バイト (Winsock2.h で定義)
のバッファを提供すべきである。エラーコードとバッファ長は Winsock2.h に以下のように定義されているマクロ
WSAGETASYNCERROR および WSAGETASYNCBUFLEN を使って lParam から取り出すべきである。
（以下省略）


%index
WSAAsyncGetProtoByNumber
WSAAsyncGetProtoByNumber 関数 (winsock.h) は、プロトコル番号に対応するプロトコル情報を非同期に取得する。
%group
Win32 ws2_32
%prm
hWnd, wMsg, number, buf, buflen
hWnd : [intptr] 非同期要求が完了したときにメッセージを受信するウィンドウのハンドル。
wMsg : [int] 非同期要求が完了したときに受信するメッセージ。
number : [int] 解決対象のプロトコル番号 (ホストバイトオーダー)。
buf : [str] protoent データを受け取るデータ領域へのポインタ。データ領域は protoent 構造体とそのメンバが参照するすべてのデータを格納するために使用されるため、protoent 構造体のサイズより大きくなければならない。MAXGETHOSTSTRUCT バイトのバッファが推奨される。
buflen : [int] buf パラメータのデータ領域のサイズ (バイト単位)。
%inst
WSAAsyncGetProtoByNumber 関数 (winsock.h)
は、プロトコル番号に対応するプロトコル情報を非同期に取得する。

[戻り値]

戻り値は、非同期操作が正常に開始されたかどうかを示す。操作自体の成功または失敗を意味するものではない。エラーがない場合、WSAAsyncGetProtoByNumber
は要求の非同期タスクハンドルとなる HANDLE 型の非ゼロ値を返す (Windows の HTASK と混同しないこと)。この値は 2
通りに使用できる。WSACancelAsyncRequest を使って操作をキャンセルするために使うか、wParam
メッセージパラメータを調べて非同期操作と完了メッセージを対応付けるために使うことができる。非同期操作を開始できなかった場合、WSAAsyncGetProtoByNumber
はゼロを返し、具体的なエラー番号は WSAGetLastError
を呼び出すことで取得できる。以下のエラーコードはアプリケーションウィンドウがメッセージを受信したときに設定される可能性がある。前述のとおり、これらは
WSAGETASYNCERROR マクロを使って応答メッセージの lParam から取り出せる。
（以下省略）

[備考]
WSAAsyncGetProtoByNumber 関数は getprotobynumber
の非同期版であり、指定したプロトコル番号に対応するプロトコル名と番号を取得するために使用される。Windows
ソケットは操作を開始し、呼び出し元に直ちに制御を戻し、アプリケーションが操作を識別するために使用できる不透明な非同期タスクハンドルを返す。操作が完了すると、結果
(もしあれば)
が呼び出し元から提供されたバッファにコピーされ、アプリケーションのウィンドウにメッセージが送信される。非同期操作が完了すると、hWnd
パラメータで示されたアプリケーションウィンドウは wMsg パラメータで指定されたメッセージを受信する。wParam
パラメータには元の関数呼び出しによって返された非同期タスクハンドルが含まれる。lParam の上位 16
ビットにはエラーコードが含まれる。エラーコードは Winsock2.h
で定義されている任意のエラーである。エラーコードがゼロの場合は非同期操作の正常完了を示す。正常完了時、元の関数呼び出しで指定したバッファには
protoent 構造体が含まれる。この構造体のメンバにアクセスするには、元のバッファアドレスを protoent
構造体ポインタにキャストして適切にアクセスする。エラーコードが WSAENOBUFS の場合、元の呼び出しで buflen
が指定したバッファサイズが結果情報をすべて含むには小さすぎたことを示す。この場合、lParam の下位 16
ビットには必要情報を提供するために必要なバッファサイズが含まれる。アプリケーションが部分データが不十分であると判断した場合、WSAAsyncGetProtoByNumber
関数呼び出しを必要な情報をすべて受け取れる十分大きさのバッファで再発行できる (lParam の下位 16
ビット以上)。この関数に指定されたバッファは、Windows ソケットが protoent
構造体とそのメンバが参照するデータ領域の内容を一緒に構築するために使用される。上述の WSAENOBUFS
エラーを回避するため、アプリケーションは少なくとも MAXGETHOSTSTRUCT バイト (Winsock2.h で定義)
のバッファを提供すべきである。エラーコードとバッファ長は Winsock2.h に以下のように定義されているマクロ
WSAGETASYNCERROR および WSAGETASYNCBUFLEN を使って lParam から取り出すべきである。
（以下省略）


%index
WSAAsyncGetServByName
WSAAsyncGetServByName 関数 (winsock.h) は、サービス名とポートに対応するサービス情報を非同期に取得する。
%group
Win32 ws2_32
%prm
hWnd, wMsg, name, proto, buf, buflen
hWnd : [intptr] 非同期要求が完了したときにメッセージを受信するウィンドウのハンドル。
wMsg : [int] 非同期要求が完了したときに受信するメッセージ。
name : [str] null 終端のサービス名へのポインタ。
proto : [str] プロトコル名へのポインタ。これは NULL にできる。その場合、WSAAsyncGetServByName は s_name または s_aliases のいずれかが指定された名前に一致する最初のサービスエントリを検索する。NULL でない場合、WSAAsyncGetServByName は name と proto の両方を一致させる。
buf : [str] servent データを受け取るデータ領域へのポインタ。データ領域は servent 構造体とそのメンバが参照するすべてのデータを格納するために使用されるため、servent 構造体のサイズより大きくなければならない。MAXGETHOSTSTRUCT バイトのバッファが推奨される。
buflen : [int] buf パラメータのデータ領域のサイズ (バイト単位)。
%inst
WSAAsyncGetServByName 関数 (winsock.h) は、サービス名とポートに対応するサービス情報を非同期に取得する。

[戻り値]

戻り値は、非同期操作が正常に開始されたかどうかを示す。操作自体の成功または失敗を意味するものではない。エラーがない場合、WSAAsyncGetServByName
は要求の非同期タスクハンドルとなる HANDLE 型の非ゼロ値を返す (Windows の HTASK と混同しないこと)。この値は 2
通りに使用できる。WSACancelAsyncRequest を使って操作をキャンセルするために使うか、wParam
メッセージパラメータを調べて非同期操作と完了メッセージを対応付けるために使うことができる。非同期操作を開始できなかった場合、WSAAsyncServByName
はゼロを返し、具体的なエラー番号は WSAGetLastError
を呼び出すことで取得できる。以下のエラーコードはアプリケーションウィンドウがメッセージを受信したときに設定される可能性がある。前述のとおり、これらは
WSAGETASYNCERROR マクロを使って応答メッセージの lParam から取り出せる。
（以下省略）

[備考]
WSAAsyncGetServByName 関数は getservbyname
の非同期版であり、サービス名に対応するサービス情報を取得するために使用される。Windows
ソケットは操作を開始し、呼び出し元に直ちに制御を戻し、アプリケーションが操作を識別するために使用できる不透明な非同期タスクハンドルを返す。操作が完了すると、結果
(もしあれば)
が呼び出し元から提供されたバッファにコピーされ、アプリケーションのウィンドウにメッセージが送信される。非同期操作が完了すると、hWnd
パラメータで示されたアプリケーションウィンドウは wMsg パラメータで指定されたメッセージを受信する。wParam
パラメータには元の関数呼び出しによって返された非同期タスクハンドルが含まれる。lParam の上位 16
ビットにはエラーコードが含まれる。エラーコードは Winsock2.h
で定義されている任意のエラーである。エラーコードがゼロの場合は非同期操作の正常完了を示す。正常完了時、元の関数呼び出しで指定したバッファには
servent 構造体が含まれる。この構造体のメンバにアクセスするには、元のバッファアドレスを servent
構造体ポインタにキャストして適切にアクセスする。エラーコードが WSAENOBUFS の場合、元の呼び出しで buflen
が指定したバッファサイズが結果情報をすべて含むには小さすぎたことを示す。この場合、lParam の下位 16
ビットには必要情報を提供するために必要なバッファサイズが含まれる。アプリケーションが部分データを不十分と判断した場合、WSAAsyncGetServByName
関数呼び出しを必要な情報をすべて受け取れる十分大きさのバッファで再発行できる (lParam の下位 16
ビット以上)。この関数に指定されたバッファは、Windows ソケットが servent
構造体とそのメンバが参照するデータ領域の内容を一緒に構築するために使用される。WSAENOBUFS
エラーを回避するため、アプリケーションは少なくとも MAXGETHOSTSTRUCT バイト (Winsock2.h で定義)
のバッファを提供すべきである。エラーコードとバッファ長は Winsock2.h に以下のように定義されているマクロ
WSAGETASYNCERROR および WSAGETASYNCBUFLEN を使って lParam から取り出すべきである。
（以下省略）


%index
WSAAsyncGetServByPort
WSAAsyncGetServByPort 関数 (winsock.h) は、ポートとプロトコルに対応するサービス情報を非同期に取得する。
%group
Win32 ws2_32
%prm
hWnd, wMsg, port, proto, buf, buflen
hWnd : [intptr] 非同期要求が完了したときにメッセージを受信するウィンドウのハンドル。
wMsg : [int] 非同期要求が完了したときに受信するメッセージ。
port : [int] サービスのポート (ネットワークバイトオーダー)。
proto : [str] プロトコル名へのポインタ。これは NULL にできる。その場合、WSAAsyncGetServByPort は s_port が指定されたポートに一致する最初のサービスエントリを検索する。NULL でない場合、WSAAsyncGetServByPort は port と proto の両方を一致させる。
buf : [str] servent データを受け取るデータ領域へのポインタ。データ領域は servent 構造体とそのメンバが参照するすべてのデータを格納するために使用されるため、servent 構造体のサイズより大きくなければならない。MAXGETHOSTSTRUCT バイトのバッファが推奨される。
buflen : [int] buf パラメータのデータ領域のサイズ (バイト単位)。
%inst
WSAAsyncGetServByPort 関数 (winsock.h) は、ポートとプロトコルに対応するサービス情報を非同期に取得する。

[戻り値]

戻り値は、非同期操作が正常に開始されたかどうかを示す。操作自体の成功または失敗を意味するものではない。エラーがない場合、WSAAsyncGetServByPort
は要求の非同期タスクハンドルとなる HANDLE 型の非ゼロ値を返す (Windows の HTASK と混同しないこと)。この値は 2
通りに使用できる。WSACancelAsyncRequest を使って操作をキャンセルするために使うか、wParam
メッセージパラメータを調べて非同期操作と完了メッセージを対応付けるために使うことができる。非同期操作を開始できなかった場合、WSAAsyncGetServByPort
はゼロを返し、具体的なエラー番号は WSAGetLastError
を呼び出すことで取得できる。以下のエラーコードはアプリケーションウィンドウがメッセージを受信したときに設定される可能性がある。前述のとおり、これらは
WSAGETASYNCERROR マクロを使って応答メッセージの lParam から取り出せる。
（以下省略）

[備考]
WSAAsyncGetServByPort 関数は getservbyport
の非同期版であり、ポート番号に対応するサービス情報を取得するために使用される。Windows
ソケットは操作を開始し、呼び出し元に直ちに制御を戻し、アプリケーションが操作を識別するために使用できる不透明な非同期タスクハンドルを返す。操作が完了すると、結果
(もしあれば)
が呼び出し元から提供されたバッファにコピーされ、アプリケーションのウィンドウにメッセージが送信される。非同期操作が完了すると、hWnd
パラメータで示されたアプリケーションウィンドウは wMsg パラメータで指定されたメッセージを受信する。wParam
パラメータには元の関数呼び出しによって返された非同期タスクハンドルが含まれる。lParam の上位 16
ビットにはエラーコードが含まれる。エラーコードは Winsock2.h
で定義されている任意のエラーである。エラーコードがゼロの場合は非同期操作の正常完了を示す。正常完了時、元の関数呼び出しで指定したバッファには
servent 構造体が含まれる。この構造体のメンバにアクセスするには、元のバッファアドレスを servent
構造体ポインタにキャストして適切にアクセスする。エラーコードが WSAENOBUFS の場合、元の呼び出しで buflen
が指定したバッファサイズが結果情報をすべて含むには小さすぎたことを示す。この場合、lParam の下位 16
ビットには必要情報を提供するために必要なバッファサイズが含まれる。アプリケーションが部分データを不十分と判断した場合、WSAAsyncGetServByPort
関数呼び出しを必要な情報をすべて受け取れる十分大きさのバッファで再発行できる (lParam の下位 16
ビット以上)。この関数に指定されたバッファは、Windows ソケットが servent
構造体とそのメンバが参照するデータ領域の内容を一緒に構築するために使用される。WSAENOBUFS
エラーを回避するため、アプリケーションは少なくとも MAXGETHOSTSTRUCT バイト (Winsock2.h で定義)
のバッファを提供すべきである。エラーコードとバッファ長は Winsock2.h に以下のように定義されているマクロ
WSAGETASYNCERROR および WSAGETASYNCBUFLEN を使って lParam から取り出すべきである。
（以下省略）


%index
WSAAsyncSelect
WSAAsyncSelect 関数 (winsock.h) は、ソケットに対するネットワークイベントの Windows メッセージベース通知を要求する。
%group
Win32 ws2_32
%prm
s, hWnd, wMsg, lEvent
s : [int] イベント通知を必要とするソケットを識別する記述子。
hWnd : [intptr] ネットワークイベントが発生したときにメッセージを受信するウィンドウを識別するハンドル。
wMsg : [int] ネットワークイベントが発生したときに受信するメッセージ。
lEvent : [int] アプリケーションが関心を持つネットワークイベントの組み合わせを指定するビットマスク。
%inst
WSAAsyncSelect 関数 (winsock.h) は、ソケットに対するネットワークイベントの Windows
メッセージベース通知を要求する。

[戻り値]
WSAAsyncSelect
関数が成功した場合、アプリケーションによるネットワークイベントセットへの関心表明が成功したことを示すゼロが返される。それ以外の場合は
SOCKET_ERROR が返され、WSAGetLastError を呼び出すことで具体的なエラー番号を取得できる。
（以下省略）

[備考]
WSAAsyncSelect 関数は、lEvent パラメータで指定したネットワークイベントを検出したときに WS2_32.DLL
がウィンドウ hWnd にメッセージを送信するよう要求するために使用される。送信するメッセージは wMsg
パラメータで指定する。通知が必要なソケットは s パラメータで識別される。WSAAsyncSelect 関数は lEvent
の値に関係なく、ソケット s を自動的にノンブロッキングモードに設定する。ソケット s をブロッキングモードに戻すには、まず lEvent
をゼロに設定して WSAAsyncSelect を呼び出し、ソケット s
に関連付けられたイベントレコードをクリアする必要がある。その後、ioctlsocket または WSAIoctl
を呼び出してソケットをブロッキングモードに戻すことができる。ノンブロッキングソケットをブロッキングモードに戻す方法の詳細は、ioctlsocket
および WSAIoctl 関数を参照。lEvent パラメータは、以下の表に示す値をビット単位の OR 演算子で組み合わせて構築する。
（以下省略）


%index
WSACancelAsyncRequest
WSACancelAsyncRequest 関数 (winsock.h) は、未完了の非同期操作をキャンセルする。
%group
Win32 ws2_32
%prm
hAsyncTaskHandle
hAsyncTaskHandle : [intptr] キャンセルする非同期操作を指定するハンドル。
%inst
WSACancelAsyncRequest 関数 (winsock.h) は、未完了の非同期操作をキャンセルする。

[戻り値]
操作が正常にキャンセルされた場合、WSACancelAsyncRequest の戻り値はゼロである。それ以外の場合は
SOCKET_ERROR が返され、WSAGetLastError を呼び出すことで具体的なエラー番号を取得できる。
（以下省略）

[備考]
WSACancelAsyncRequest 関数は、WSAAsyncGetHostByName などの WSAAsyncGetXByY
関数で開始された非同期操作をキャンセルするために使用される。キャンセルする操作は hAsyncTaskHandle
パラメータで識別され、開始元の WSAAsyncGetXByY 関数が返した非同期タスクハンドルを設定する必要がある。既存の非同期
WSAAsyncGetXByY 操作をキャンセルしようとしたとき、WSAEALREADY エラーコードで失敗することがある。これには 2
つの理由がある。第 1 に、元の操作が既に完了し、アプリケーションが結果のメッセージを処理済みである場合。第 2
に、元の操作は既に完了しているが、結果のメッセージがまだアプリケーションのウィンドウキューで待機している場合である。


%index
WSACancelBlockingCall
WSACancelBlockingCall 関数は、Windows Sockets 2 仕様リビジョン 2.2.0 への準拠のため削除された。
%group
Win32 ws2_32
%prm

%inst
WSACancelBlockingCall 関数は、Windows Sockets 2 仕様リビジョン 2.2.0
への準拠のため削除された。


%index
WSACleanup
WSACleanup 関数 (winsock.h) は、WS2_32.dll の使用を終了する。
%group
Win32 ws2_32
%prm

%inst
WSACleanup 関数 (winsock.h) は、WS2_32.dll の使用を終了する。

[戻り値]
操作が成功した場合、戻り値はゼロである。それ以外の場合は SOCKET_ERROR が返され、WSAGetLastError
を呼び出すことで具体的なエラー番号を取得できる。マルチスレッド環境では、WSACleanup はすべてのスレッドの Windows
ソケット操作を終了させる。
（以下省略）

[備考]
アプリケーションまたは DLL は Windows ソケットサービスを使用する前に WSAStartup
の呼び出しを成功させる必要がある。Windows ソケットの使用を完了したら、アプリケーションまたは DLL は WSACleanup
を呼び出して Windows ソケット実装から登録解除し、実装が確保したリソースを解放できるようにしなければならない。WSACleanup
が呼び出されると、このプロセス内の任意のスレッドが発行した保留中のブロッキングまたは非同期 Windows
ソケット呼び出しは、通知メッセージを投稿することもイベントオブジェクトをシグナル化することもなくキャンセルされる。このプロセス内の任意のスレッドが発行した保留中のオーバーラップ送受信操作
(オーバーラップソケットでの WSASend、WSASendTo、WSARecv、WSARecvFrom など)
もキャンセルされ、指定されていればイベントオブジェクトはセットされず、完了ルーチンも呼び出されない。この場合、保留中のオーバーラップ操作は
WSA_OPERATION_ABORTED エラーステータスで失敗する。WSACleanup
が呼び出された時点で開いていたソケットはリセットされ、closesocket
が呼び出されたかのように自動的に解放される。closesocket
で閉じられたがまだ送信待ちのデータがあるソケットは、WSACleanup
の呼び出しによって影響を受けることがある。この場合、アプリケーションの終了時に WS2_32.DLL
がメモリからアンロードされると、保留中のデータは失われることがある。すべての保留中データが送信されるようにするには、shutdown
を使って接続をクローズし、クローズが完了するまで待ってから closesocket および WSACleanup
を呼び出すべきである。キューに積まれた未投稿または投稿済みメッセージなどのすべてのリソースと内部状態は、次のユーザーが利用できるように解放されなければならない。WSAStartup
の成功呼び出しごとに WSACleanup を呼び出す必要がある。実際のクリーンアップを行うのは最後の WSACleanup
関数呼び出しのみで、それまでの呼び出しは WS2_32.DLL 内の内部参照カウントをデクリメントするだけである。Note
WSACleanup は、Peer Name Resolution Protocol (PNRP) 名前空間プロバイダなどの
Windows ソケット名前空間プロバイダに登録された名前 (ピア名など) を登録解除しない。Windows Sockets 1.1
では、ブロッキングフック内から WSACleanup
を呼び出し戻り値をチェックしないことが一般的なプログラミングエラーであった。Winsock 1.1
アプリケーションがブロッキング呼び出しが未完了の状態で終了する必要がある場合、まず WSACancelBlockingCall
でブロッキング呼び出しをキャンセルし、制御がアプリケーションに戻った後に WSACleanup を呼び出す必要があった。Windows
Sockets 2 ではこの問題は存在せず、WSACancelBlockingCall 関数は削除された。WSACleanup
関数は一般にプロトコル固有のヘルパー DLL をアンロードする。そのため、アプリケーション DLL の DllMain 関数から
WSACleanup を呼び出すべきではない。これはデッドロックを引き起こす可能性がある。詳細は DLL Main Function
を参照。Windows Phone 8: この関数は Windows Phone 8 以降の Windows Phone
ストアアプリでサポートされる。Windows 8.1 および Windows Server 2012 R2: この関数は Windows
8.1、Windows Server 2012 R2 以降の Windows ストアアプリでサポートされる。


%index
WSACloseEvent
WSACloseEvent 関数は、開いているイベントオブジェクトのハンドルをクローズする。
%group
Win32 ws2_32
%prm
hEvent
hEvent : [intptr] 開いているイベントを識別するオブジェクトハンドル。
%inst
WSACloseEvent 関数は、開いているイベントオブジェクトのハンドルをクローズする。

[戻り値]
関数が成功した場合、戻り値は TRUE である。関数が失敗した場合、戻り値は FALSE である。拡張エラー情報を取得するには
WSAGetLastError を呼び出す。
（以下省略）

[備考]
WSACloseEvent
関数は、イベントオブジェクトのハンドルをクローズし、イベントオブジェクトに関連付けられたリソースを解放する。この関数は
WSACreateEvent
関数で作成されたハンドルをクローズするために使用する。イベントオブジェクトのハンドルがクローズされた後、このハンドルへの参照は
WSA_INVALID_HANDLE エラーで失敗する。Windows Phone 8: この関数は Windows Phone 8
以降の Windows Phone ストアアプリでサポートされる。Windows 8.1 および Windows Server 2012
R2: この関数は Windows 8.1、Windows Server 2012 R2 以降の Windows
ストアアプリでサポートされる。


%index
WSAConnect
WSAConnect 関数は、別のソケットアプリケーションへの接続を確立し、接続データを交換し、指定した FLOWSPEC 構造体に基づいて必要な QoS を指定する。
%group
Win32 ws2_32
%prm
s, name, namelen, lpCallerData, lpCalleeData, lpSQOS, lpGQOS
s : [int] 未接続のソケットを識別する記述子。
name : [var] 接続先アドレスを指定する sockaddr 構造体へのポインタ。IPv4 の場合、sockaddr にはアドレスファミリの AF_INET、宛先 IPv4 アドレス、宛先ポートが含まれる。IPv6 の場合、sockaddr 構造体にはアドレスファミリの AF_INET6、宛先 IPv6 アドレス、宛先ポートが含まれ、さらに追加のフローとスコープ ID の情報が含まれることがある。
namelen : [int] name パラメータが指す sockaddr 構造体の長さ (バイト単位)。
lpCallerData : [var] 接続確立中にもう一方のソケットへ転送されるユーザーデータへのポインタ。「解説」を参照。
lpCalleeData : [var] 接続確立中にもう一方のソケットから返されるユーザーデータへのポインタ。「解説」を参照。
lpSQOS : [var] ソケット s の FLOWSPEC 構造体へのポインタ。各方向に 1 つずつ指定する。
lpGQOS : [var] ソケットグループでの将来の使用のために予約されている。該当する場合のソケットグループの FLOWSPEC 構造体へのポインタ。このパラメータは NULL にすべきである。
%inst
WSAConnect 関数は、別のソケットアプリケーションへの接続を確立し、接続データを交換し、指定した FLOWSPEC
構造体に基づいて必要な QoS を指定する。

[戻り値]
エラーがない場合、WSAConnect はゼロを返す。それ以外の場合は SOCKET_ERROR を返し、WSAGetLastError
を呼び出すことで具体的なエラーコードを取得できる。ブロッキングソケットでは、戻り値は接続試行の成功または失敗を示す。ノンブロッキングソケットでは、接続試行を直ちに完了できない。この場合、WSAConnect
は SOCKET_ERROR を返し、WSAGetLastError は WSAEWOULDBLOCK
を返す。従って、アプリケーションは次のいずれかを行える。
（以下省略）

[備考]
WSAConnect
関数は、指定した宛先への接続を作成するため、および接続時に発生するその他の付随的な操作を実行するために使用される。ソケット s
がバインドされていない場合、システムがローカルアソシエーションに一意の値を割り当て、ソケットはバインド済みとしてマークされる。Windows
Vista 以降を対象とするアプリケーションでは、クライアントアプリケーションの設計を大幅に簡素化する WSAConnectByList
または WSAConnectByName 関数の使用を検討すること。接続指向ソケット (例えば SOCK_STREAM タイプ)
の場合、name (ソケットの名前空間内のアドレス。詳細は bind を参照)
を使ってリモートホストへの能動的な接続が開始される。この呼び出しが正常に完了すると、ソケットはデータの送受信の準備が整う。name
構造体の address パラメータがすべてゼロの場合、WSAConnect は WSAEADDRNOTAVAIL
エラーを返す。アクティブな接続を再接続しようとすると、WSAEISCONN エラーコードで失敗する。Note
ソケットが開かれ、setsockopt 呼び出しが行われ、その後 sendto 呼び出しが行われた場合、Windows ソケットは暗黙の
bind 関数呼び出しを実行する。接続指向のノンブロッキングソケットの場合、接続を直ちに完了できないことが多い。そのような場合、この関数は
WSAEWOULDBLOCK
エラーを返すが、操作は続行される。成功または失敗の結果が判明すると、クライアントが通知を登録する方法に応じていくつかの方法で報告される可能性がある。クライアントが
select を使用する場合、成功は writefds セットで、失敗は exceptfds セットで報告される。クライアントが
WSAAsyncSelect または WSAEventSelect を使用する場合、通知は FD_CONNECT
で通知され、FD_CONNECT に関連付けられたエラーコードは成功または失敗の具体的な理由を示す。非接続型ソケット (例えば
SOCK_DGRAM タイプ) では、WSAConnect によって行われる操作は、ソケットがその後の接続指向の送受信操作
(send、WSASend、recv、WSARecv)
で使用できるように既定の宛先アドレスを単に確立することだけである。指定された宛先アドレス以外のアドレスから受信したデータグラムは破棄される。name
構造体全体がすべてゼロの場合 (name 構造体の address
パラメータだけでなく)、ソケットは切断される。その後、既定のリモートアドレスは未確定となるため、send、WSASend、recv、WSARecv
の呼び出しは WSAENOTCONN
エラーコードを返す。しかし、sendto、WSASendTo、recvfrom、WSARecvFrom
は引き続き使用できる。既定の宛先は、ソケットが既に接続されていても、単純に WSAConnect を再度呼び出すことで変更できる。name
が前回の WSAConnect と異なる場合、受信待ちのキューにあるデータグラムは破棄される。非接続型ソケットでは、name
は任意の有効なアドレス (ブロードキャストアドレスを含む) を指定できる。ただし、ブロードキャストアドレスに接続するには、ソケットで
setsockopt SO_BROADCAST が有効になっている必要がある。そうでない場合、WSAConnect は WSAEACCES
エラーコードで失敗する。非接続型ソケットでは、ユーザー間のデータ交換は不可能で、対応するパラメータは黙って無視される。アプリケーションは、指定するパラメータによって直接的または間接的に参照されるメモリ空間の確保を担当する。lpCallerData
パラメータは、接続要求と共に送信されるユーザーデータ (connect data と呼ばれる)
へのポインタを含む。これは、通常のネットワークデータストリームではなく、接続を確立するためのネットワーク要求と共に送信される追加データである。このオプションは
DECNet や OSI TP4 などのレガシープロトコルで使用される。Note Windows では TCP/IP プロトコルは
Connect data をサポートしていない。Connect data は ATM (RAWWAN) 上の raw
ソケットでのみサポートされる。
lpCallerData が NULL の場合、ピアにユーザーデータは渡されない。lpCalleeData
は結果パラメータで、接続確立の一部としてもう一方のソケットから渡されたユーザーデータを WSABUF
構造体で受け取る。lpCalleeData パラメータが指す WSABUF 構造体の len メンバは、最初、アプリケーションが
WSABUF 構造体の buf メンバに対して確保したバッファの長さを含む。ユーザーデータが返されなかった場合、lpCalleeData
パラメータが指す WSABUF 構造体の len メンバは 0 に設定される。接続操作が完了すると lpCalleeData
情報が有効になる。ブロッキングソケットでは、WSAConnect
関数が戻ると接続操作が完了する。ノンブロッキングソケットでは、FD_CONNECT 通知が発生した後に完了する。lpCalleeData
が NULL
の場合、ユーザーデータは返されない。ユーザーデータの正確な形式は、ソケットが属するアドレスファミリ固有である。接続時、アプリケーションは
lpSQOS および lpGQOS パラメータを使って、WSAIoctl の SIO_SET_QOS または
SIO_SET_GROUP_QOS オペコードによって以前にソケットに対して行われた QoS 仕様を上書きできる。lpSQOS
パラメータはソケット s の FLOWSPEC 構造体 (各方向 1 つずつ)
と、続くプロバイダ固有の追加パラメータを指定する。関連するトランスポートプロバイダ全般または特定のソケットタイプが QoS
要求を満たせない場合、以下に示すようにエラーが返される。送信または受信のフロー仕様値は、単方向ソケットに対してはそれぞれ無視される。プロバイダ固有のパラメータが指定されない場合、lpCalleeData
パラメータが指す WSABUF 構造体の buf メンバと len メンバはそれぞれ NULL および 0
に設定すべきである。lpSQOS パラメータが NULL の場合、アプリケーションが QoS
を指定しないことを示す。ソケットグループで将来の使用のために予約されている lpGQOS は、該当する場合のソケットグループの
FLOWSPEC 構造体 (各方向 1 つずつ) と、続くプロバイダ固有の追加パラメータを指定する。lpGQOS が NULL
の場合、アプリケーションがグループ QoS を指定しないことを示す。このパラメータは s
がソケットグループの作成者でない場合は無視される。接続済みソケットが何らかの理由でクローズされると、破棄して再作成すべきである。接続済みソケットで何らかの問題が発生した場合、安定した状態に戻すためにアプリケーションは必要なソケットを破棄して再作成しなければならないと想定するのが最も安全である。Note
WSAConnect などのブロッキング Winsock
呼び出しを発行するとき、呼び出しが完了する前にネットワークイベントを待機する必要がある場合がある。Winsock
はこの状況で警告可能な待機を行い、同じスレッドでスケジュールされた非同期プロシージャ呼び出し (APC)
によって割り込まれることがある。同じスレッドで進行中のブロッキング Winsock 呼び出しに割り込んだ APC 内で別のブロッキング
Winsock 呼び出しを発行すると未定義動作となるため、Winsock クライアントは決して試みてはならない。 Windows
Phone 8: この関数は Windows Phone 8 以降の Windows Phone
ストアアプリでサポートされる。Windows 8.1 および Windows Server 2012 R2: この関数は Windows
8.1、Windows Server 2012 R2 以降の Windows ストアアプリでサポートされる。


%index
WSAConnectByList
宛先アドレス (ホスト名およびポート) の集合で表される複数の候補エンドポイントの 1 つへの接続を確立する。
%group
Win32 ws2_32
%prm
s, SocketAddress, LocalAddressLength, LocalAddress, RemoteAddressLength, RemoteAddress, timeout, Reserved
s : [int] バインドされていない未接続のソケットを識別する記述子。接続を確立する他の Winsock 呼び出し (例えば WSAConnect) と異なり、WSAConnectByList 関数は未バインドのソケットを必要とすることに注意。
SocketAddress : [var] ピアに接続するための宛先アドレスとポートのペアの候補を表す SOCKET_ADDRESS_LIST 構造体へのポインタ。SOCKET_ADDRESS_LIST 内の各 SOCKET_ADDRESS 構造体にポート番号を設定するのはアプリケーションの責任である。
LocalAddressLength : [var] 入力時、呼び出し元が提供する LocalAddress バッファのサイズ (バイト単位) へのポインタ。出力時、呼び出しが正常に完了した際にシステムによって LocalAddress バッファに格納されるローカルアドレスの SOCKADDR のサイズ (バイト単位) へのポインタ。
LocalAddress : [var] 接続のローカルアドレスを受け取る SOCKADDR 構造体へのポインタ。このパラメータのサイズは、LocalAddressLength で返されるサイズと正確に等しい。これは getsockname 関数が返す情報と同じである。このパラメータは NULL にでき、その場合 LocalAddressLength パラメータは無視される。
RemoteAddressLength : [var] 入力時、呼び出し元が提供する RemoteAddress バッファのサイズ (バイト単位) へのポインタ。出力時、呼び出しが正常に完了した際にシステムによって RemoteAddress バッファに格納されるリモートアドレスの SOCKADDR のサイズ (バイト単位) へのポインタ。
RemoteAddress : [var] 接続のリモートアドレスを受け取る SOCKADDR 構造体へのポインタ。これは getpeername 関数が返す情報と同じである。このパラメータは NULL にでき、その場合 RemoteAddressLength は無視される。
timeout : [var] 呼び出しを中止するまで、リモートアプリケーションからの応答を待機する時間をミリ秒単位で指定する。このパラメータは NULL にでき、その場合 WSAConnectByList は接続が正常に確立された後、またはすべての可能なローカル-リモートアドレスペアで接続を試みて失敗した後に完了する。
Reserved : [var] 将来の実装のために予約されている。このパラメータは NULL に設定しなければならない。
%inst
宛先アドレス (ホスト名およびポート) の集合で表される複数の候補エンドポイントの 1 つへの接続を確立する。

[戻り値]
接続が確立された場合、WSAConnectByList は TRUE を返し、呼び出し元がこれらのバッファを指定していれば
LocalAddress および RemoteAddress パラメータが埋められる。呼び出しが失敗した場合、FALSE
を返す。拡張エラー情報を取得するには WSAGetLastError を呼び出す。
（以下省略）

[備考]
WSAConnectByList は WSAConnectByName 関数に似ている。単一のホスト名とサービス名 (ポート)
を受け取る代わりに、WSAConnectByList はアドレスのリスト (ホストアドレスとポート)
を受け取り、それらのアドレスのいずれかに接続する。WSAConnectByList
関数は、潜在的なノードのリストから利用可能な任意のノードに接続する必要があるピアツーピアコラボレーションシナリオをサポートするように設計されている。WSAConnectByList
は IPv6 および IPv4 の両バージョンと互換性がある。宛先候補の集合 (アドレスのリストで表現)
は呼び出し元が提供する。WSAConnectByList
は、複数の宛先アドレスのいずれかに接続を試みる以上のことを行う。具体的には、呼び出し元から渡されたすべてのリモートアドレス、すべてのローカルアドレスを受け取り、最も成功する可能性の高いアドレスペアから順に接続を試みる。これにより、WSAConnectByList
は接続が可能であれば必ず接続が確立されることを保証するだけでなく、接続を確立するまでの時間も最小化する。呼び出し元は
LocalAddress および RemoteAddress
バッファと長さを指定して、接続が正常に確立されたローカルおよびリモートアドレスを決定できる。timeout
パラメータにより、呼び出し元は接続確立に要する時間を制限できる。WSAConnectByList は内部で複数の操作 (接続試行)
を実行する。各操作の合間に timeout パラメータが超過していないかチェックされ、超過していれば呼び出しは中止される。個々の操作
(connect) は timeout を超過しても中断されないため、WSAConnectByList の呼び出しは timeout
パラメータで指定した値よりも長くかかる可能性があることに注意。WSAConnectByList には制限がある: 接続指向ソケット
(SOCK_STREAM タイプなど) でのみ動作する。関数はオーバーラップ I/O
やノンブロッキング動作をサポートしない。ソケットがノンブロッキングモードであっても WSAConnectByList
はブロックする。WSAConnectByList は呼び出し元から渡された各アドレスへの接続を 1
つずつ試みる。これらの接続試行のそれぞれが異なるエラーコードで失敗する可能性があり、1
つのエラーコードしか返せないため、返される値は最後の接続試行のエラーコードである。この関数が受け付ける単一のアドレスリストに IPv6 と
IPv4 の両方のアドレスを渡せるようにするには、関数を呼び出す前に以下の手順を実行しなければならない。
（以下省略）


%index
WSAConnectByNameW
指定したホストおよびポートへの接続を確立する。(Unicode)
%group
Win32 ws2_32
%prm
s, nodename, servicename, LocalAddressLength, LocalAddress, RemoteAddressLength, RemoteAddress, timeout, Reserved
s : [int] 未接続のソケットを識別する記述子。Note  Windows 7、Windows Server 2008 R2 以前では、WSAConnectByName 関数は未バインドかつ未接続のソケットを必要とする。これは接続を確立する他の Winsock 呼び出し (例えば WSAConnect) とは異なる。
nodename : [wstr] IPv4 または IPv6 で接続するホスト名またはホストの IP アドレスを含む NULL 終端文字列。
servicename : [wstr] IPv4 または IPv6 で接続するホストのサービス名または宛先ポートを含む NULL 終端文字列。サービス名はポート番号の文字列エイリアスである。例えば "http" は、HTTP プロトコルで Web サーバーが使用する既定のポートとして IETF が定義したポート 80 のエイリアスである。ポート番号を指定しない場合に servicename パラメータに指定できる値は、%WINDIR%\system32\drivers\etc\services に一覧されている。
LocalAddressLength : [var] 入力時、呼び出し元が提供する LocalAddress バッファのサイズ (バイト単位) へのポインタ。出力時、呼び出しが正常に完了した際にシステムによって LocalAddress バッファに格納されるローカルアドレスの SOCKADDR のサイズ (バイト単位) へのポインタ。
LocalAddress : [var] 接続のローカルアドレスを受け取る SOCKADDR 構造体へのポインタ。このパラメータのサイズは、LocalAddressLength で返されるサイズと正確に等しい。これは getsockname 関数が返す情報と同じである。このパラメータは NULL にでき、その場合 LocalAddressLength パラメータは無視される。
RemoteAddressLength : [var] 入力時、呼び出し元が提供する RemoteAddress バッファのサイズ (バイト単位) へのポインタ。出力時、呼び出しが正常に完了した際にシステムによって RemoteAddress バッファに格納されるリモートアドレスの SOCKADDR のサイズ (バイト単位) へのポインタ。
RemoteAddress : [var] 接続のリモートアドレスを受け取る SOCKADDR 構造体へのポインタ。これは getpeername 関数が返す情報と同じである。このパラメータは NULL にでき、その場合 RemoteAddressLength は無視される。
timeout : [var] 呼び出しを中止するまでリモートアプリケーションからの応答を待機する時間をミリ秒単位で指定する。
Reserved : [var] 将来の実装のために予約されている。このパラメータは NULL に設定しなければならない。
%inst
指定したホストおよびポートへの接続を確立する。(Unicode)

[戻り値]
接続が確立された場合、WSAConnectByName は TRUE を返し、呼び出し元がこれらのバッファを指定していれば
LocalAddress および RemoteAddress パラメータが埋められる。呼び出しが失敗した場合、FALSE
を返す。拡張エラー情報を取得するには WSAGetLastError を呼び出す。
（以下省略）

[備考]
WSAConnectByName は、特定のポート上のリモートホストへの迅速かつ透過的な接続を可能にするために提供されている。IPv6
および IPv4 の両バージョンと互換性がある。
（以下省略）


%index
WSACreateEvent
WSACreateEvent 関数は、新しいイベントオブジェクトを作成する。
%group
Win32 ws2_32
%prm

%inst
WSACreateEvent 関数は、新しいイベントオブジェクトを作成する。

[戻り値]
エラーがない場合、WSACreateEvent はイベントオブジェクトのハンドルを返す。それ以外の場合、戻り値は
WSA_INVALID_EVENT である。拡張エラー情報を取得するには WSAGetLastError を呼び出す。
（以下省略）

[備考]
WSACreateEvent
関数は、初期状態が非シグナル状態の手動リセットイベントオブジェクトを作成する。返されるイベントオブジェクトのハンドルは子プロセスに継承できない。イベントオブジェクトは無名である。イベントオブジェクトの状態をシグナル状態に設定するには
WSASetEvent 関数を呼び出すことができる。非シグナル状態に設定するには WSAResetEvent
関数を呼び出す。イベントオブジェクトが不要になったら、WSACloseEvent
関数を呼び出してイベントオブジェクトに関連付けられたリソースを解放すべきである。Windows Sockets 2
のイベントオブジェクトは Windows 環境ではシステムオブジェクトである。そのため、Windows
アプリケーションが手動リセットイベントではなく自動リセットイベントを使用したい場合、アプリケーションは直接 CreateEvent
関数を呼び出すことができる。イベントオブジェクトのスコープは、それが作成されたプロセスに限定される。Windows Phone 8:
この関数は Windows Phone 8 以降の Windows Phone ストアアプリでサポートされる。Windows 8.1
および Windows Server 2012 R2: この関数は Windows 8.1、Windows Server 2012 R2
以降の Windows ストアアプリでサポートされる。


%index
WSADuplicateSocketW
WSADuplicateSocket 関数は、共有ソケット用の新しいソケット記述子を作成するために使用できる WSAPROTOCOL_INFO 構造体を返す。WSADuplicateSocket 関数は QoS 対応ソケットでは使用できない。(Unicode)
%group
Win32 ws2_32
%prm
s, dwProcessId, lpProtocolInfo
s : [int] ローカルソケットを識別する記述子。
dwProcessId : [int] 複製されたソケットが使用されるターゲットプロセスのプロセス識別子。
lpProtocolInfo : [var] WSAPROTOCOL_INFO 構造体を格納できる十分な大きさの、クライアントが確保したバッファへのポインタ。サービスプロバイダはプロトコル情報構造体の内容をこのバッファにコピーする。
%inst
WSADuplicateSocket 関数は、共有ソケット用の新しいソケット記述子を作成するために使用できる
WSAPROTOCOL_INFO 構造体を返す。WSADuplicateSocket 関数は QoS
対応ソケットでは使用できない。(Unicode)

[戻り値]
エラーがない場合、WSADuplicateSocket はゼロを返す。それ以外の場合は SOCKET_ERROR
を返し、WSAGetLastError を呼び出すことで具体的なエラーコードを取得できる。
（以下省略）

[備考]
WSADuplicateSocket 関数は、プロセス間でソケットを共有できるようにするために使用される。ソースプロセスが
WSADuplicateSocket を呼び出して特殊な WSAPROTOCOL_INFO 構造体を取得する。何らかのプロセス間通信
(IPC) 機構を使用してこの構造体の内容をターゲットプロセスに渡し、ターゲットプロセスはそれを WSASocket
呼び出しで使用して複製されたソケットの記述子を取得する。特殊な WSAPROTOCOL_INFO
構造体はターゲットプロセスで一度しか使用できない。特定のプロセス内のスレッド間でソケットを共有する場合、ソケット記述子はプロセス内のすべてのスレッドで有効であるため、WSADuplicateSocket
関数を使わずに共有できる。共有ソケットを確立して引き渡すシナリオの 1 つを以下の表に示す。
（以下省略）


%index
WSAEnumNameSpaceProvidersW
WSAEnumNameSpaceProviders 関数は、利用可能な名前空間プロバイダに関する情報を取得する。(Unicode)
%group
Win32 ws2_32
%prm
lpdwBufferLength, lpnspBuffer
lpdwBufferLength : [var] 入力時、lpnspBuffer が指すバッファに含まれるバイト数。出力時 (関数が失敗し、エラーが WSAEFAULT の場合)、要求された情報をすべて取得するために lpnspBuffer に渡すべき最小バイト数。WSAEnumNameSpaceProviders に渡すバッファはすべての名前空間情報を保持できる十分な大きさでなければならない。
lpnspBuffer : [var] WSANAMESPACE_INFO 構造体で埋められるバッファ。返される構造体はバッファ先頭に連続して配置される。構造体内のポインタによって参照される可変長情報は、固定サイズ構造体の終端からバッファ終端までの間に配置される。埋められた構造体の数は WSAEnumNameSpaceProviders の戻り値となる。
%inst
WSAEnumNameSpaceProviders 関数は、利用可能な名前空間プロバイダに関する情報を取得する。(Unicode)

[戻り値]
WSAEnumNameSpaceProviders 関数は、lpnspBuffer にコピーされた WSANAMESPACE_INFO
構造体の数を返す。それ以外の場合は SOCKET_ERROR を返し、WSAGetLastError
を呼び出すことで具体的なエラー番号を取得できる。
（以下省略）

[備考]
WSAEnumNameSpaceProviders 関数は、lpnspBuffer
パラメータが指すバッファに、利用可能な名前空間プロバイダに関する情報を返す。返されるバッファには、バッファ先頭に連続して配置された
WSANAMESPACE_INFO 構造体の配列が含まれる。WSANAMESPACE_INFO
構造体内のポインタが参照する可変長情報は、固定長の WSANAMESPACE_INFO
構造体の終端からバッファ終端までの間に配置される。埋められた WSANAMESPACE_INFO 構造体の数は
WSAEnumNameSpaceProviders 関数が返す。各 WSANAMESPACE_INFO
構造体エントリには、名前空間プロバイダをインストールする際に WSCInstallNameSpace および
WSCInstallNameSpace32
関数に渡された名前空間エントリのプロバイダ固有の情報が含まれる。WSAEnumNameSpaceProvidersEx 関数は
WSAEnumNameSpaceProviders 関数の拡張版である。WSCEnumNameSpaceProvidersEx32 関数は
64 ビットプラットフォームで使用する 32 ビット名前空間プロバイダに関する情報を返す
WSAEnumNameSpaceProviders 関数の拡張版である。例コード 次の例は
WSAEnumNameSpaceProviders 関数を使用して利用可能な名前空間プロバイダに関する情報を取得する方法を示す。
（以下省略）


%index
WSAEnumNameSpaceProvidersExW
利用可能な名前空間プロバイダに関する情報を取得する。(Unicode)
%group
Win32 ws2_32
%prm
lpdwBufferLength, lpnspBuffer
lpdwBufferLength : [var] 入力時、lpnspBuffer が指すバッファに含まれるバイト数。出力時 (関数が失敗し、エラーが WSAEFAULT の場合)、要求された情報をすべて取得するために lpnspBuffer バッファに確保すべき最小バイト数。WSAEnumNameSpaceProvidersEx に渡すバッファはすべての名前空間情報を保持できる十分なものでなければならない。
lpnspBuffer : [var] WSANAMESPACE_INFOEX 構造体で埋められるバッファ。返される構造体はバッファ先頭に連続して配置される。構造体内のポインタによって参照される可変長情報は、固定サイズ構造体の終端からバッファ終端までの間に配置される。埋められた構造体の数は WSAEnumNameSpaceProvidersEx の戻り値となる。
%inst
利用可能な名前空間プロバイダに関する情報を取得する。(Unicode)

[戻り値]
WSAEnumNameSpaceProvidersEx 関数は、lpnspBuffer にコピーされた
WSANAMESPACE_INFOEX 構造体の数を返す。それ以外の場合は SOCKET_ERROR
を返し、WSAGetLastError を呼び出すことで具体的なエラー番号を取得できる。
（以下省略）

[備考]
WSAEnumNameSpaceProvidersEx 関数は WSAEnumNameSpaceProviders
関数の拡張版である。WSCInstallNameSpaceEx 関数の lpProviderInfo
パラメータで名前空間エントリに関連付けられたプロバイダ固有のデータブロブは、WSAEnumNameSpaceProvidersEx
関数で問い合わせることができる。現時点で Windows に含まれる名前空間プロバイダのうち WSANAMESPACE_INFOEX
構造体の ProviderSpecific メンバに情報を設定するのは NS_EMAIL プロバイダのみである。NS_EMAIL
名前空間プロバイダの ProviderSpecific メンバの形式は NAPI_PROVIDER_INSTALLATION_BLOB
構造体である。UNICODE または _UNICODE が定義されている場合、WSAEnumNameSpaceProvidersEx は
Unicode 版の WSAEnumNameSpaceProvidersExW として定義される。lpnspBuffer パラメータは
LPSAWSANAMESPACE_INFOEXW 型で定義され、成功時には WSANAMESPACE_INFOEXW
構造体が返される。UNICODE または _UNICODE が定義されていない場合、WSAEnumNameSpaceProvidersEx
は ANSI 版の WSAEnumNameSpaceProvidersExA として定義される。lpnspBuffer パラメータは
LPSAWSANAMESPACE_INFOEXA 型で定義され、成功時には WSANAMESPACE_INFOEXA
構造体が返される。Windows 8.1 および Windows Server 2012 R2:
WSAEnumNameSpaceProvidersExW 関数は Windows 8.1、Windows Server 2012 R2
以降の Windows ストアアプリでサポートされる。
> [!NOTE] > winsock2.h ヘッダは WSAEnumNameSpaceProvidersEx
をエイリアスとして定義しており、UNICODE プリプロセッサ定数の定義に基づいて ANSI 版または Unicode
版を自動的に選択する。エンコーディング中立なエイリアスの使用をエンコーディング中立でないコードと混在させると、コンパイルエラーや実行時エラーにつながる不整合を招くおそれがある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
WSAEnumNetworkEvents
WSAEnumNetworkEvents 関数は、指定したソケットに対して発生したネットワークイベントを検出し、内部ネットワークイベントレコードをクリアし、イベントオブジェクトをリセットする (オプション)。
%group
Win32 ws2_32
%prm
s, hEventObject, lpNetworkEvents
s : [int] ソケットを識別する記述子。
hEventObject : [intptr] リセットする関連イベントオブジェクトを識別するオプションのハンドル。
lpNetworkEvents : [var] 発生したネットワークイベントとそれに関連するエラーコードの記録で埋められる WSANETWORKEVENTS 構造体へのポインタ。
%inst
WSAEnumNetworkEvents
関数は、指定したソケットに対して発生したネットワークイベントを検出し、内部ネットワークイベントレコードをクリアし、イベントオブジェクトをリセットする
(オプション)。

[戻り値]
操作が成功した場合、戻り値はゼロである。それ以外の場合は SOCKET_ERROR を返し、WSAGetLastError
を呼び出すことで具体的なエラー番号を取得できる。
（以下省略）

[備考]
WSAEnumNetworkEvents
関数は、この関数の前回呼び出し以降に指定したソケットで発生したネットワークイベントを検出するために使用される。この関数は、1
つ以上のネットワークイベントにイベントオブジェクトを関連付ける WSAEventSelect
と組み合わせて使用することを想定している。ネットワークイベントの記録は、lNetworkEvents パラメータを非ゼロで
WSAEventSelect を呼び出したときに開始され、lNetworkEvents パラメータをゼロにして
WSAEventSelect を再度呼び出すか、WSAAsyncSelect
を呼び出すまで有効である。WSAEnumNetworkEvents は WSAEventSelect
で指定されたネットワーク活動とエラーのみを報告する。select および WSAAsyncSelect
がどのようにネットワーク活動とエラーを報告するかについては、それぞれの説明を参照。ソケットの内部ネットワークイベントレコードは
lpNetworkEvents
が参照する構造体にコピーされ、その後、内部ネットワークイベントレコードはクリアされる。hEventObject パラメータが NULL
でない場合、指定されたイベントオブジェクトもリセットされる。Windows
ソケットプロバイダは、ネットワークイベントレコードのコピー、クリア、関連イベントオブジェクトのリセットの各操作がアトミックに行われることを保証し、次に指定されたネットワークイベントが発生したときにイベントオブジェクトがセット状態になるようにする。この関数が
SOCKET_ERROR
を返す場合、関連イベントオブジェクトはリセットされず、ネットワークイベントレコードもクリアされない。WSANETWORKEVENTS
構造体の lNetworkEvents メンバは、どの FD_XXX ネットワークイベントが発生したかを示す。iErrorCode
配列は、lNetworkEvents
内のイベントビットの位置に対応する配列インデックスで関連エラーコードを格納する。FD_READ_BIT や FD_WRITE_BIT
などの識別子は iErrorCode 配列のインデックスとして使用できる。lNetworkEvents
パラメータでセットされたビットに対応する iErrorCode 配列の要素のみがセットされ、他のパラメータは変更されないことに注意
(これは新しい FD_ROUTING_INTERFACE_CHANGE および FD_ADDRESS_LIST_CHANGE
イベントを認識しないアプリケーションとの後方互換性のために重要である)。対応するネットワークイベントと共に返され得るエラーコードを以下に示す。イベント:
FD_CONNECT
（以下省略）


%index
WSAEnumProtocolsW
WSAEnumProtocols 関数は、利用可能なトランスポートプロトコルに関する情報を取得する。(Unicode)
%group
Win32 ws2_32
%prm
lpiProtocols, lpProtocolBuffer, lpdwBufferLength
lpiProtocols : [var] iProtocol 値の NULL 終端配列。このパラメータはオプションで、lpiProtocols が NULL の場合、すべての利用可能なプロトコルに関する情報が返される。それ以外の場合は、配列に列挙されたプロトコルについてのみ情報が取得される。
lpProtocolBuffer : [var] WSAPROTOCOL_INFO 構造体で埋められるバッファへのポインタ。
lpdwBufferLength : [var] 入力時、WSAEnumProtocols に渡す lpProtocolBuffer バッファのバイト数。出力時、要求した情報をすべて取得するために WSAEnumProtocols に渡せる最小バッファサイズ。このルーチンは複数の呼び出しにわたって列挙を継続する機能を持たない。ルーチンを成功させるには、渡されたバッファがすべてのエントリを保持できる十分な大きさでなければならない。これは API の複雑さを軽減し、通常コンピュータにロードされるプロトコルの数は少ないため問題にならない。
%inst
WSAEnumProtocols 関数は、利用可能なトランスポートプロトコルに関する情報を取得する。(Unicode)

[戻り値]
エラーがない場合、WSAEnumProtocols は報告するプロトコルの数を返す。それ以外の場合は SOCKET_ERROR
を返し、WSAGetLastError を呼び出すことで具体的なエラーコードを取得できる。
（以下省略）

[備考]
WSAEnumProtocols
関数は、ローカルコンピュータにインストールされているトランスポートプロトコルの集合に関する情報を検出するために使用される。階層化プロトコルはプロトコルチェーンにインストールされた場合のみアプリケーションから使用可能である。階層化プロトコルの情報は、チェーン長がゼロのダミーの階層化サービスプロバイダ
(LSP) を除いて lpProtocolBuffer に返されない。Note 階層化サービスプロバイダは非推奨である。Windows 8
および Windows Server 2012 以降では、Windows Filtering Platform
を使用すること。lpiProtocols
パラメータは提供される情報量を絞り込むためのフィルタとして使用できる。多くの場合、lpiProtocols は NULL
ポインタとして指定され、利用可能なすべてのトランスポートプロトコルとプロトコルチェーンに関する情報を返させる。WSAEnumProtocols
関数は、インストール済みのすべてのプロトコルに対する WSAPROTOCOL_INFO 構造体を返さない点で
WSCEnumProtocols および WSCEnumProtocols32 関数と異なる。WSAEnumProtocols
関数は、サービスプロバイダが WSAPROTOCOL_INFO 構造体の dwProviderFlags メンバに PFL_HIDDEN
フラグを設定して、WSAEnumProtocols 関数によって生成される結果バッファにこのプロトコルを返さないよう Ws2_32.dll
に指示したプロトコルを除外する。さらに、WSAEnumProtocols 関数は、チェーン長が 1 以上の (LSP プロバイダである)
WSAPROTOCOL_INFO 構造体のデータは返さない。WSAEnumProtocols は、PFL_HIDDEN
フラグがなく、プロトコルチェーン長がゼロでないベースプロトコルとプロトコルチェーンに関する情報のみを返す。要求した各プロトコルについて、lpProtocolBuffer
が指すバッファに WSAPROTOCOL_INFO 構造体が提供される。指定したバッファが十分な大きさでない場合
(lpdwBufferLength の入力値で示される)、lpdwBufferLength
が指す値が必要なバッファサイズを示すよう更新される。その後、アプリケーションは十分な大きさのバッファを取得して
WSAEnumProtocols を再度呼び出すべきである。WSAPROTOCOL_INFO
構造体がバッファ内に現れる順序は、サービスプロバイダが WS2_32.DLL を使ってプロトコルエントリを登録した順序、または既定の
TCP/IP プロバイダを確立するために Windows ソケットアプリケーションや DLL
によって提供された後続の並べ替えによる順序と一致する。Windows Phone 8: WSAEnumProtocolsW 関数は
Windows Phone 8 以降の Windows Phone ストアアプリでサポートされる。Windows 8.1 および
Windows Server 2012 R2: WSAEnumProtocolsW 関数は Windows 8.1、Windows
Server 2012 R2 以降の Windows ストアアプリでサポートされる。


%index
WSAEventSelect
WSAEventSelect 関数は、指定した FD_XXX ネットワークイベントの集合に関連付けるイベントオブジェクトを指定する。
%group
Win32 ws2_32
%prm
s, hEventObject, lNetworkEvents
s : [int] ソケットを識別する記述子。
hEventObject : [intptr] 指定した FD_XXX ネットワークイベントの集合に関連付けるイベントオブジェクトを識別するハンドル。
lNetworkEvents : [int] アプリケーションが関心を持つ FD_XXX ネットワークイベントの組み合わせを指定するビットマスク。
%inst
WSAEventSelect 関数は、指定した FD_XXX ネットワークイベントの集合に関連付けるイベントオブジェクトを指定する。

[戻り値]
アプリケーションによるネットワークイベントと関連イベントオブジェクトの指定が成功した場合、戻り値はゼロである。それ以外の場合は
SOCKET_ERROR を返し、WSAGetLastError を呼び出すことで具体的なエラー番号を取得できる。select および
WSAAsyncSelect 関数と同様、WSAEventSelect はデータ送信操作 (send または recv)
がただちに成功する見込みで発行できるタイミングを判断するためによく使われる。それでも、堅牢なアプリケーションは、イベントオブジェクトがセットされた上で発行した
Windows ソケット呼び出しが即座に WSAEWOULDBLOCK
を返す可能性に備えておく必要がある。例えば、以下のような一連の操作が起こり得る。
（以下省略）

[備考]
WSAEventSelect 関数は、選択された FD_XXX ネットワークイベント (lNetworkEvents)
に関連付けるイベントオブジェクト (hEventObject) を指定するために使用される。イベントオブジェクトが指定されるソケットは s
パラメータで識別される。指定したネットワークイベントのいずれかが発生したときにイベントオブジェクトがセットされる。WSAEventSelect
関数は WSAAsyncSelect
と非常に似た動作をするが、指定したネットワークイベントが発生したときに取られるアクションが異なる。WSAAsyncSelect
関数はアプリケーション指定の Windows メッセージを投稿させる。WSAEventSelect
は関連付けられたイベントオブジェクトをセットし、このイベントの発生を内部ネットワークイベントレコードに記録する。アプリケーションは
WSAWaitForMultipleEvents
を使ってイベントオブジェクトを待機またはポーリングし、WSAEnumNetworkEvents
を使って内部ネットワークイベントレコードの内容を取得することで、指定したネットワークイベントのうちどれが発生したかを判断できる。WSAEventSelect
関数で使用するイベントオブジェクトの状態をリセットする正しい方法は、イベントオブジェクトのハンドルを
WSAEnumNetworkEvents 関数の hEventObject
パラメータに渡すことである。これによりイベントオブジェクトがリセットされ、ソケット上のアクティブな FD
イベントの状態がアトミックに調整される。WSAEventSelect は、WSAEnumNetworkEvents
を通じてネットワーク活動とエラーを記録・取得できるようにする唯一の関数である。select および WSAAsyncSelect
がどのようにネットワーク活動とエラーを報告するかについては、それぞれの説明を参照。WSAEventSelect 関数は
lNetworkEvents の値に関係なく、ソケット s を自動的にノンブロッキングモードに設定する。ソケット s
をブロッキングモードに戻すには、まず lNetworkEvents をゼロに設定し、hEventObject パラメータを NULL
にして WSAEventSelect を呼び出し、ソケット s
に関連付けられたイベントレコードをクリアする必要がある。その後、ioctlsocket または WSAIoctl
を呼び出してソケットをブロッキングモードに戻すことができる。lNetworkEvents パラメータは、以下の一覧に示す値をビット単位の
OR 演算子で組み合わせて構築する。
（以下省略）


%index
WSAGetLastError
WSAGetLastError 関数 (winsock.h) は、最後に失敗した Windows ソケット操作のエラーステータスを返す。
%group
Win32 ws2_32
%prm

%inst
WSAGetLastError 関数 (winsock.h) は、最後に失敗した Windows ソケット操作のエラーステータスを返す。

[戻り値]
戻り値は、このスレッドの最後に失敗した Windows ソケット操作のエラーコードを示す。

[備考]
WSAGetLastError 関数は、呼び出し元スレッドで発生した最後のエラーを返す。特定の Windows
ソケット関数がエラーの発生を示した場合、失敗した関数呼び出しの拡張エラーコードを取得するために、この関数をただちに呼び出すべきである。この拡張エラーコードは、optname
パラメータに SO_ERROR を指定して getsockopt
を呼び出したときに取得されるエラーコードとは異なる場合がある。getsockopt
はソケット固有であるのに対し、WSAGetLastError
はすべてのスレッド固有のソケットに関するものであるためである。関数呼び出しの戻り値がエラーや他の関連データがエラーコードで返されたことを示す場合、WSAGetLastError
をただちに呼び出すべきである。これは、一部の関数が成功した場合に最後の拡張エラーコードを 0
にリセットし、以前に失敗した関数が返した拡張エラーコードを上書きする可能性があるために必要である。拡張エラーコードを明示的にリセットするには、iError
パラメータをゼロに設定して WSASetLastError 関数を呼び出す。optname パラメータに SO_ERROR を指定した
getsockopt 関数も拡張エラーコードをゼロにリセットする。WSAGetLastError
関数は、非同期メッセージの受信時に拡張エラー値を確認するために使用すべきではない。この場合、拡張エラー値はメッセージの lParam
パラメータで渡され、これは WSAGetLastError が返す値と異なる場合がある。
Note アプリケーションは、WSAStartup が失敗した場合や、Windows ソケット関数を呼び出す前に適切に Windows
ソケットを初期化するために WSAStartup が呼ばれていない場合でも、他の Windows
ソケット関数の拡張エラーコードを決定するために通常通り WSAGetLastError
関数を呼び出すことができる。WSAGetLastError 関数は、WSAStartup の失敗時でも呼び出せる Winsock 2.2
DLL 内の数少ない関数の 1 つである。
この関数が返す Windows ソケットの拡張エラーコードとエラーのテキスト説明は Windows Sockets Error Codes
に一覧されている。これらのエラーコードとエラーコードに関連する短いテキスト説明は Winerror.h
ヘッダファイルで定義されている。FormatMessage
関数を使って返されたエラーに対するメッセージ文字列を取得できる。ソケットアプリケーションを Winsock
に移植する際のエラーコード処理の方法については、Error Codes - errno, h_errno and
WSAGetLastError を参照。
Windows Phone 8: この関数は Windows Phone 8 以降の Windows Phone
ストアアプリでサポートされる。Windows 8.1 および Windows Server 2012 R2: この関数は Windows
8.1、Windows Server 2012 R2 以降の Windows ストアアプリでサポートされる。


%index
WSAGetOverlappedResult
WSAGetOverlappedResult 関数は、指定したソケットに対するオーバーラップ操作の結果を取得する。
%group
Win32 ws2_32
%prm
s, lpOverlapped, lpcbTransfer, fWait, lpdwFlags
s : [int] ソケットを識別する記述子。これはオーバーラップ操作をサポートする Winsock 関数 (AcceptEx、ConnectEx、DisconnectEx、TransmitFile、TransmitPackets、WSARecv、WSARecvFrom、LPFN_WSARECVMSG (WSARecvMsg)、WSASend、WSASendMsg、WSASendTo、WSAIoctl など) のいずれかを呼び出してオーバーラップ操作を開始したときに指定したソケットと同じでなければならない。
lpOverlapped : [var] オーバーラップ操作を開始したときに指定した WSAOVERLAPPED 構造体へのポインタ。このパラメータは NULL ポインタであってはならない。
lpcbTransfer : [var] 送受信操作または WSAIoctl 関数によって実際に転送されたバイト数を受け取る 32 ビット変数へのポインタ。このパラメータは NULL ポインタであってはならない。
fWait : [int] 保留中のオーバーラップ操作が完了するまで関数が待機するかどうかを指定するフラグ。TRUE の場合、関数は操作が完了するまで戻らない。FALSE で操作がまだ保留中の場合、関数は FALSE を返し、WSAGetLastError 関数は WSA_IO_INCOMPLETE を返す。fWait パラメータを TRUE に設定できるのは、オーバーラップ操作がイベントベースの完了通知を選択した場合のみである。
lpdwFlags : [var] 完了ステータスを補足する 1 つ以上のフラグを受け取る 32 ビット変数へのポインタ。オーバーラップ操作が WSARecv または WSARecvFrom を通じて開始された場合、このパラメータには lpFlags パラメータの結果値が格納される。このパラメータは NULL ポインタであってはならない。
%inst
WSAGetOverlappedResult 関数は、指定したソケットに対するオーバーラップ操作の結果を取得する。

[戻り値]
WSAGetOverlappedResult が成功した場合、戻り値は TRUE
である。これはオーバーラップ操作が正常に完了し、lpcbTransfer
が指す値が更新されたことを意味する。WSAGetOverlappedResult が FALSE
を返した場合、オーバーラップ操作が完了していないか、オーバーラップ操作がエラーで完了したか、WSAGetOverlappedResult
の 1
つ以上のパラメータにエラーがあってオーバーラップ操作の完了ステータスを判断できなかったことを意味する。失敗時、lpcbTransfer
が指す値は更新されない。失敗の原因 (WSAGetOverlappedResult
関数によるものか、関連するオーバーラップ操作によるものか) を判断するには WSAGetLastError を使用する。
（以下省略）

[備考]
WSAGetOverlappedResult 関数は、s パラメータで指定したソケットに対する lpOverlapped
パラメータで指定したオーバーラップ操作の結果を報告する。WSAGetOverlappedResult
関数には、オーバーラップ関数を呼び出したときに指定したソケット記述子と WSAOVERLAPPED 構造体を渡す。操作を開始した関数が
FALSE を返し、WSAGetLastError 関数が WSA_IO_PENDING
を返した場合、保留中の操作があることを示す。WSARecv のような I/O 操作が保留中の場合、操作を開始した関数は
WSAOVERLAPPED 構造体の hEvent
メンバを非シグナル状態にリセットする。その後、保留中の操作が完了すると、システムはイベントオブジェクトをシグナル状態に設定する。fWait
パラメータが TRUE の場合、WSAGetOverlappedResult
はイベントオブジェクトがシグナル状態になるのを待機して、保留中の操作が完了したかどうかを判断する。クライアントは fWait パラメータを
TRUE に設定できるが、I/O
操作を要求したときにイベントベースの完了通知を選択した場合のみである。他の通知形式が選択された場合、WSAOVERLAPPED 構造体の
hEvent パラメータの使用方法が異なり、fWait を TRUE に設定すると予測不能な結果を引き起こす。Windows Vista
で lpOverlapped、lpcbTransfer、lpdwFlags のいずれかのパラメータを NULL ポインタで
WSAGetOverlappedResult 関数を呼び出すと、アクセス違反が発生する。Windows Server 2003
以前でこれらを NULL にすると WSAEFAULT エラーコードが返される。Note スレッドが終了するとすべての I/O
がキャンセルされる。オーバーラップソケットでは、操作が完了する前にスレッドが閉じられると保留中の非同期操作が失敗することがある。詳細は
ExitThread を参照。Windows Phone 8: この関数は Windows Phone 8 以降の Windows
Phone ストアアプリでサポートされる。Windows 8.1 および Windows Server 2012 R2: この関数は
Windows 8.1、Windows Server 2012 R2 以降の Windows ストアアプリでサポートされる。


%index
WSAGetQOSByName
WSAGetQOSByName 関数は、名前付きテンプレートに基づいて QOS 構造体を初期化するか、利用可能なテンプレート名の列挙を取得するためのバッファを提供する。
%group
Win32 ws2_32
%prm
s, lpQOSName, lpQOS
s : [int] ソケットを識別する記述子。
lpQOSName : [var] 特定の QoS テンプレートへのポインタ。
lpQOS : [var] 埋められる QOS 構造体へのポインタ。
%inst
WSAGetQOSByName 関数は、名前付きテンプレートに基づいて QOS
構造体を初期化するか、利用可能なテンプレート名の列挙を取得するためのバッファを提供する。

[戻り値]
WSAGetQOSByName が成功した場合、戻り値は TRUE である。関数が失敗した場合、戻り値は FALSE
である。拡張エラー情報を取得するには WSAGetLastError を呼び出す。
（以下省略）

[備考]
WSAGetQOSByName 関数は、アプリケーションが特定のサービスクラスまたはメディアタイプに適した既知の値の集合で QOS
構造体を初期化するために使用する。これらの値はよく知られた名前で参照されるテンプレートに格納されている。クライアントは lpQOSName
で示される WSABUF 構造体の buf
パラメータを、テンプレート名を指定する長さ非ゼロの文字列に設定することで、これらの値を取得できる。この場合、lpQOSName
の使用方法は IN のみで、結果は lpQOS
を通じて返される。あるいは、クライアントはこの関数を使って利用可能なテンプレート名の列挙を取得することもできる。これを行うには、lpQOSName
で示される WSABUF の buf パラメータを長さゼロの null 終端文字列に設定する。この場合、buf
で示されるバッファは、WSABUF の len パラメータで示される buf の利用可能バイト数まで、利用可能な null
終端テンプレート名の並びで上書きされる。名前のリスト自体は長さゼロの名前で終端される。WSAGetQOSByName
関数がテンプレート名を取得するために使用される場合、lpQOS パラメータは無視される。


%index
WSAGetServiceClassInfoW
WSAGetServiceClassInfo 関数は、指定した名前空間プロバイダから、指定したサービスクラスに関するクラス情報 (スキーマ) を取得する。(Unicode)
%group
Win32 ws2_32
%prm
lpProviderId, lpServiceClassId, lpdwBufSize, lpServiceClassInfo
lpProviderId : [var] 特定の名前空間プロバイダを識別する GUID へのポインタ。
lpServiceClassId : [var] サービスクラスを識別する GUID へのポインタ。
lpdwBufSize : [var] 入力時、lpServiceClassInfo パラメータが指すバッファに含まれるバイト数。出力時、関数が失敗しエラーが WSAEFAULT の場合、このパラメータはレコードを取得するために lpServiceClassInfo が指すバッファに必要な最小サイズ (バイト単位) を指定する。
lpServiceClassInfo : [var] 指定したサービスクラスについて、指定した名前空間プロバイダからのサービスクラス情報を含む WSASERVICECLASSINFO 構造体へのポインタ。
%inst
WSAGetServiceClassInfo 関数は、指定した名前空間プロバイダから、指定したサービスクラスに関するクラス情報
(スキーマ) を取得する。(Unicode)

[戻り値]
WSAGetServiceClassInfo が成功した場合、戻り値はゼロである。それ以外の場合は SOCKET_ERROR
を返し、WSAGetLastError を呼び出すことで具体的なエラー番号を取得できる。
（以下省略）

[備考]
WSAGetServiceClassInfo
関数は、名前空間プロバイダからサービスクラス情報を取得する。特定の名前空間プロバイダから取得されるサービスクラス情報は、サービスクラスがインストールされたときに指定されたクラス情報の完全なセットでない場合がある。個々の名前空間プロバイダは、サポートする名前空間に適用可能なサービスクラス情報のみ保持すればよい。詳細は
Service Class Data Structures セクションを参照。
> [!NOTE] > winsock2.h ヘッダは WSAGetServiceClassInfo
をエイリアスとして定義しており、UNICODE プリプロセッサ定数の定義に基づいて ANSI 版または Unicode
版を自動的に選択する。エンコーディング中立なエイリアスの使用をエンコーディング中立でないコードと混在させると、コンパイルエラーや実行時エラーにつながる不整合を招くおそれがある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
WSAGetServiceClassNameByClassIdW
WSAGetServiceClassNameByClassId 関数は、指定したタイプに関連付けられたサービスの名前を取得する。この名前は FTP や SNA のような一般的なサービス名であり、そのサービスの特定インスタンスの名前ではない。(Unicode)
%group
Win32 ws2_32
%prm
lpServiceClassId, lpszServiceClassName, lpdwBufferLength
lpServiceClassId : [var] サービスクラスの GUID へのポインタ。
lpszServiceClassName : [wstr] サービス名へのポインタ。
lpdwBufferLength : [var] 入力時、lpszServiceClassName で返されるバッファの長さを文字数で指定する。出力時、lpszServiceClassName にコピーされたサービス名の長さを文字数で指定する。
%inst
WSAGetServiceClassNameByClassId 関数は、指定したタイプに関連付けられたサービスの名前を取得する。この名前は
FTP や SNA のような一般的なサービス名であり、そのサービスの特定インスタンスの名前ではない。(Unicode)

[戻り値]
WSAGetServiceClassNameByClassId 関数は、成功した場合にゼロを返す。それ以外の場合は
SOCKET_ERROR を返し、WSAGetLastError を呼び出すことで具体的なエラー番号を取得できる。
（以下省略）

[備考]
> [!NOTE] > winsock2.h ヘッダは WSAGetServiceClassNameByClassId
をエイリアスとして定義しており、UNICODE プリプロセッサ定数の定義に基づいて ANSI 版または Unicode
版を自動的に選択する。エンコーディング中立なエイリアスの使用をエンコーディング中立でないコードと混在させると、コンパイルエラーや実行時エラーにつながる不整合を招くおそれがある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
WSAHtonl
WSAHtonl 関数は、u_long をホストバイトオーダーからネットワークバイトオーダーに変換する。
%group
Win32 ws2_32
%prm
s, hostlong, lpnetlong
s : [int] ソケットを識別する記述子。
hostlong : [int] ホストバイトオーダーの 32 ビット数値。
lpnetlong : [var] ネットワークバイトオーダーの数値を受け取る 32 ビット数値へのポインタ。
%inst
WSAHtonl 関数は、u_long をホストバイトオーダーからネットワークバイトオーダーに変換する。

[戻り値]
エラーがない場合、WSAHtonl はゼロを返す。それ以外の場合は SOCKET_ERROR を返し、WSAGetLastError
を呼び出すことで具体的なエラーコードを取得できる。
（以下省略）

[備考]
WSAHtonl 関数は、ホストバイトオーダーの 32 ビット数値を受け取り、lpnetlong パラメータが指す 32
ビット数値にネットワークバイトオーダーの 32 ビット数値を返す。s パラメータで渡されたソケットは、そのソケットに関連付けられた
Winsock
カタログプロトコルエントリに基づいて、必要なネットワークバイトオーダーを決定するために使用される。この機能は異なるネットワークバイトオーダーを使用する
Winsock プロバイダをサポートする。ソケットが AF_INET または AF_INET6 アドレスファミリ用の場合、WSAHtonl
関数はホストバイトオーダーの IPv4 アドレスをネットワークバイトオーダーの IPv4 アドレスに変換するために使用できる。この関数は
hostlong パラメータが有効な IPv4 アドレスかどうかのチェックは行わない。WSAHtonl 関数は、WSAStartup
関数の成功呼び出しによって Winsock DLL が事前にロードされていることを要求する。AF_INET または AF_INET6
ファミリで使用する場合、htonl 関数は Winsock DLL がロードされている必要がない。Windows Phone 8:
この関数は Windows Phone 8 以降の Windows Phone ストアアプリでサポートされる。Windows 8.1
および Windows Server 2012 R2: この関数は Windows 8.1、Windows Server 2012 R2
以降の Windows ストアアプリでサポートされる。


%index
WSAHtons
WSAHtons 関数は、u_short をホストバイトオーダーからネットワークバイトオーダーに変換する。
%group
Win32 ws2_32
%prm
s, hostshort, lpnetshort
s : [int] ソケットを識別する記述子。
hostshort : [int] ホストバイトオーダーの 16 ビット数値。
lpnetshort : [var] ネットワークバイトオーダーの数値を受け取る 16 ビットバッファへのポインタ。
%inst
WSAHtons 関数は、u_short をホストバイトオーダーからネットワークバイトオーダーに変換する。

[戻り値]
エラーがない場合、WSAHtons はゼロを返す。それ以外の場合は SOCKET_ERROR を返し、WSAGetLastError
を呼び出すことで具体的なエラーコードを取得できる。
（以下省略）

[備考]
WSAHtons 関数は、ホストバイトオーダーの 16 ビット数値を受け取り、lpnetshort パラメータが指す 16
ビット数値にネットワークバイトオーダーの 16 ビット数値を返す。s パラメータで渡されたソケットは、そのソケットに関連付けられた
Winsock
カタログプロトコルエントリに基づいて、必要なネットワークバイトオーダーを決定するために使用される。この機能は異なるネットワークバイトオーダーを使用する
Winsock プロバイダをサポートする。ソケットが AF_INET または AF_INET6 アドレスファミリ用の場合、WSAHtons
関数はホストバイトオーダーの IP ポート番号をネットワークバイトオーダーの IP ポート番号に変換するために使用できる。WSAHtons
関数は、WSAStartup 関数の成功呼び出しによって Winsock DLL が事前にロードされていることを要求する。AF_INET
または AF_INET6 アドレスファミリで使用する場合、htons 関数は Winsock DLL
がロードされている必要がない。Windows Phone 8: この関数は Windows Phone 8 以降の Windows
Phone ストアアプリでサポートされる。Windows 8.1 および Windows Server 2012 R2: この関数は
Windows 8.1、Windows Server 2012 R2 以降の Windows ストアアプリでサポートされる。


%index
WSAInstallServiceClassW
WSAInstallServiceClass 関数は、名前空間内にサービスクラススキーマを登録する。(Unicode)
%group
Win32 ws2_32
%prm
lpServiceClassInfo
lpServiceClassInfo : [var] サービスクラスから名前空間固有の型へのマッピング情報。複数のマッピングを同時に扱うことができる。
%inst
WSAInstallServiceClass 関数は、名前空間内にサービスクラススキーマを登録する。(Unicode)

[戻り値]
操作が成功した場合、戻り値はゼロである。それ以外の場合は SOCKET_ERROR を返し、WSAGetLastError
を呼び出すことで具体的なエラー番号を取得できる。
（以下省略）

[備考]
> [!NOTE] > winsock2.h ヘッダは WSAInstallServiceClass
をエイリアスとして定義しており、UNICODE プリプロセッサ定数の定義に基づいて ANSI 版または Unicode
版を自動的に選択する。エンコーディング中立なエイリアスの使用をエンコーディング中立でないコードと混在させると、コンパイルエラーや実行時エラーにつながる不整合を招くおそれがある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
WSAIoctl
WSAIoctl 関数は、ソケットのモードを制御する。
%group
Win32 ws2_32
%prm
s, dwIoControlCode, lpvInBuffer, cbInBuffer, lpvOutBuffer, cbOutBuffer, lpcbBytesReturned, lpOverlapped, lpCompletionRoutine
s : [int] ソケットを識別する記述子。
dwIoControlCode : [int] 実行する操作の制御コード。
lpvInBuffer : [intptr] 入力バッファへのポインタ。
cbInBuffer : [int] 入力バッファのサイズ (バイト単位)。
lpvOutBuffer : [intptr] 出力バッファへのポインタ。
cbOutBuffer : [int] 出力バッファのサイズ (バイト単位)。
lpcbBytesReturned : [var] 実際の出力バイト数へのポインタ。
lpOverlapped : [var] WSAOVERLAPPED 構造体へのポインタ (非オーバーラップソケットでは無視される)。
lpCompletionRoutine : [int] 型: \_In_opt\_ [**LPWSAOVERLAPPED_COMPLETION_ROUTINE**](./nc-winsock2-lpwsaoverlapped_completion_routine.md) Note  操作が完了したときに呼び出される完了ルーチンへのポインタ (非オーバーラップソケットでは無視される)。「解説」を参照。
%inst
WSAIoctl 関数は、ソケットのモードを制御する。

[戻り値]
正常に完了した場合、WSAIoctl はゼロを返す。それ以外の場合は SOCKET_ERROR を返し、WSAGetLastError
を呼び出すことで具体的なエラーコードを取得できる。
（以下省略）

[備考]
WSAIoctl
関数は、ソケット、トランスポートプロトコル、または通信サブシステムに関連付けられた操作パラメータを設定または取得するために使用する。lpOverlapped
と lpCompletionRoutine の両方が NULL
の場合、この関数内のソケットは非オーバーラップソケットとして扱われる。非オーバーラップソケットでは、lpOverlapped および
lpCompletionRoutine パラメータは無視され、関数は標準の ioctlsocket 関数と同様に動作する。ただし、ソケット
s がブロッキングモードの場合は関数がブロックする可能性がある。ソケット s
がノンブロッキングモードの場合、指定した操作を直ちに完了できないときに WSAEWOULDBLOCK
を返すことがある。この場合、アプリケーションはソケットをブロッキングモードに変更して要求を再発行するか、Windows メッセージベース
(WSAAsyncSelect を使用) またはイベントベース (WSAEventSelect を使用)
の通知機構を使って対応するネットワークイベント (SIO_ROUTING_INTERFACE_CHANGE や
SIO_ADDRESS_LIST_CHANGE の場合の FD_ROUTING_INTERFACE_CHANGE や
FD_ADDRESS_LIST_CHANGE など)
を待つことができる。オーバーラップソケットでは、直ちに完了できない操作が開始され、完了は後で通知される。返される
lpcbBytesReturned パラメータが指す DWORD
値は無視してよい。最終的な完了ステータスと返されたバイト数は、操作が完了して適切な完了方法がシグナル化されたときに取得できる。
サービスプロバイダの実装によっては、IOCTL は無期限にブロックする可能性がある。アプリケーションが WSAIoctl
呼び出しでのブロックを許容できない場合、特にブロックしやすい IOCTL にはオーバーラップ I/O の使用が推奨される。対象は
SIO_ADDRESS_LIST_CHANGE、SIO_FINDROUTE、SIO_FLUSH、SIO_GET_QOS、SIO_GET_GROUP_QOS、SIO_ROUTING_INTERFACE_CHANGE、SIO_SET_QOS、SIO_SET_GROUP_QOS
などである。一部のプロトコル固有 IOCTL
も特にブロックしやすい可能性がある。利用可能な情報については関連するプロトコル固有の付録を確認すること。lpCompletionRoutine
パラメータが指す完了ルーチンのプロトタイプは以下のとおり。
（以下省略）


%index
WSAIsBlocking
この関数は、Windows Sockets 2 仕様リビジョン 2.2.0 への準拠のため削除された。(WSAIsBlocking)
%group
Win32 ws2_32
%prm

%inst
この関数は、Windows Sockets 2 仕様リビジョン 2.2.0 への準拠のため削除された。(WSAIsBlocking)


%index
WSAJoinLeaf
The WSAJoinLeaf function joins a leaf node into a multipoint session, exchanges connect data, and specifies needed quality of service based on the specified FLOWSPEC structures.
%group
Win32 ws2_32
%prm
s, name, namelen, lpCallerData, lpCalleeData, lpSQOS, lpGQOS, dwFlags
s : [int] Descriptor identifying a multipoint socket.
name : [var] Name of the peer to which the socket is to be joined.
namelen : [int] Length of name, in bytes.
lpCallerData : [var] Pointer to the user data that is to be transferred to the peer during multipoint session establishment.
lpCalleeData : [var] Pointer to the user data that is to be transferred back from the peer during multipoint session establishment.
lpSQOS : [var] Pointer to the FLOWSPEC structures for socket s, one for each direction.
lpGQOS : [var] Reserved for future use with socket groups. A pointer to the FLOWSPEC structures for the socket group (if applicable).
dwFlags : [int] Flags to indicate that the socket is acting as a sender (JL_SENDER_ONLY), receiver (JL_RECEIVER_ONLY), or both (JL_BOTH).
%inst
The WSAJoinLeaf function joins a leaf node into a multipoint session,
exchanges connect data, and specifies needed quality of service based
on the specified FLOWSPEC structures.

[戻り値]
If no error occurs, WSAJoinLeaf returns a value of type SOCKET that
is a descriptor for the newly created multipoint socket. Otherwise, a
value of INVALID_SOCKET is returned, and a specific error code can be
retrieved by calling WSAGetLastError. On a blocking socket, the
return value indicates success or failure of the join operation. With
a nonblocking socket, successful initiation of a join operation is
indicated by a return of a valid socket descriptor. Subsequently, an
FD_CONNECT indication will be given on the original socket s when the
join operation completes, either successfully or otherwise. The
application must use either WSAAsyncSelect or WSAEventSelect with
interest registered for the FD_CONNECT event in order to determine
when the join operation has completed and checks the associated error
code to determine the success or failure of the operation. The select
function cannot be used to determine when the join operation
completes. Also, until the multipoint session join attempt completes
all subsequent calls to WSAJoinLeaf on the same socket will fail with
the error code WSAEALREADY. After the WSAJoinLeaf operation completes
successfully, a subsequent attempt will usually fail with the error
code WSAEISCONN. An exception to the WSAEISCONN rule occurs for a
c_root socket that allows root-initiated joins. In such a case,
another join may be initiated after a prior WSAJoinLeaf operation
completes. If the return error code indicates the multipoint session
join attempt failed (that is, WSAECONNREFUSED, WSAENETUNREACH,
WSAETIMEDOUT) the application can call WSAJoinLeaf again for the same
socket.
This doc was truncated.

[備考]
The WSAJoinLeaf function is used to join a leaf node to a multipoint
session, and to perform a number of other ancillary operations that
occur at session join time as well. If the socket s is unbound,
unique values are assigned to the local association by the system,
and the socket is marked as bound. The WSAJoinLeaf function has the
same parameters and semantics as WSAConnect except that it returns a
socket descriptor (as in WSAAccept), and it has an additional dwFlags
parameter. Only multipoint sockets created using WSASocket with
appropriate multipoint flags set can be used for input parameter s in
this function. The returned socket descriptor will not be usable
until after the join operation completes. For example, if the socket
is in nonblocking mode after a corresponding FD_CONNECT indication
has been received from WSAAsyncSelect or WSAEventSelect on the
original socket s, except that closesocket may be invoked on this new
socket descriptor to cancel a pending join operation. A root
application in a multipoint session may call WSAJoinLeaf one or more
times in order to add a number of leaf nodes, however at most one
multipoint connection request may be outstanding at a time. Refer to
Multipoint and Multicast Semantics for additional information. For
nonblocking sockets it is often not possible to complete the
connection immediately. In such a case, this function returns an
as-yet unusable socket descriptor and the operation proceeds. There
is no error code such as WSAEWOULDBLOCK in this case, since the
function has effectively returned a successful start indication. When
the final outcome success or failure becomes known, it may be
reported through WSAAsyncSelect or WSAEventSelect depending on how
the client registers for notification on the original socket s. In
either case, the notification is announced with FD_CONNECT and the
error code associated with the FD_CONNECT indicates either success or
a specific reason for failure. The select function cannot be used to
detect completion notification for WSAJoinLeaf. The socket descriptor
returned by WSAJoinLeaf is different depending on whether the input
socket descriptor, s, is a c_root or a c_leaf. When used with a
c_root socket, the name parameter designates a particular leaf node
to be added and the returned socket descriptor is a c_leaf socket
corresponding to the newly added leaf node. The newly created socket
has the same properties as s, including asynchronous events
registered with WSAAsyncSelect or with WSAEventSelect. It is not
intended to be used for exchange of multipoint data, but rather is
used to receive network event indications (for example, FD_CLOSE) for
the connection that exists to the particular c_leaf. Some multipoint
implementations can also allow this socket to be used for side chats
between the root and an individual leaf node. An FD_CLOSE indication
will be received for this socket if the corresponding leaf node calls
closesocket to drop out of the multipoint session. Symmetrically,
invoking closesocket on the c_leaf socket returned from WSAJoinLeaf
will cause the socket in the corresponding leaf node to get an
FD_CLOSE notification. When WSAJoinLeaf is invoked with a c_leaf
socket, the name parameter contains the address of the root
application (for a rooted control scheme) or an existing multipoint
session (nonrooted control scheme), and the returned socket
descriptor is the same as the input socket descriptor. In other
words, a new socket descriptor is not allocated. In a rooted control
scheme, the root application would put its c_root socket in listening
mode by calling listen. The standard FD_ACCEPT notification will be
delivered when the leaf node requests to join itself to the
multipoint session. The root application uses the usual accept or
WSAAccept functions to admit the new leaf node. The value returned
from either accept or WSAAccept is also a c_leaf socket descriptor
just like those returned from WSAJoinLeaf. To accommodate multipoint
schemes that allow both root-initiated and leaf-initiated joins, it
is acceptable for a c_root socket that is already in listening mode
to be used as an input to WSAJoinLeaf. The application is responsible
for allocating any memory space pointed to directly or indirectly by
any of the parameters it specifies. The lpCallerData is a value
parameter that contains any user data that is to be sent along with
the multipoint session join request. If lpCallerData is NULL, no user
data will be passed to the peer. The lpCalleeData is a result
parameter that will contain any user data passed back from the peer
as part of the multipoint session establishment. The len member of
the WSABUF structure pointed to by the lpCalleeData parameter
initially contains the length of the buffer allocated by the
application and pointed to by the buf member of the WSABUF structure.
The len member of the WSABUF structure pointed to by the lpCalleeData
parameter will be set to zero if no user data has been passed back.
The lpCalleeData information will be valid when the multipoint join
operation is complete. For blocking sockets, this will be when the
WSAJoinLeaf function returns. For nonblocking sockets, this will be
after the join operation has completed. For example, this could occur
after FD_CONNECT notification on the original socket s). If
lpCalleeData is NULL, no user data will be passed back. The exact
format of the user data is specific to the address family to which
the socket belongs. At multipoint session establishment time, an
application can use the lpSQOS and/or lpGQOS parameters to override
any previous quality of service specification made for the socket
through WSAIoctl with the SIO_SET_QOS or SIO_SET_GROUP_QOS opcodes.
The lpSQOS parameter specifies the FLOWSPEC structures for socket s,
one for each direction, followed by any additional provider-specific
parameters. If either the associated transport provider in general or
the specific type of socket in particular cannot honor the quality of
service request, an error will be returned as indicated in the
following. The respective sending or receiving flow specification
values will be ignored for any unidirectional sockets. If no
provider-specific parameters are specified, the buf and len members
of the WSABUF structure pointed to by the lpCalleeData parameter
should be set to NULL and zero, respectively. A NULL value for lpSQOS
indicates no application-supplied quality of service. Reserved for
future socket groups. The lpGQOS parameter specifies the FLOWSPEC
structures for the socket group (if applicable), one for each
direction, followed by any additional provider-specific parameters.
If no provider-specific parameters are specified, the the buf and len
members of the WSABUF structure pointed to by the lpCalleeData
parameter should be set to should be set to NULL and zero,
respectively. A NULL value for lpGQOS indicates no
application-supplied group quality of service. This parameter will be
ignored if s is not the creator of the socket group. When connected
sockets break (that is, become closed for whatever reason), they
should be discarded and recreated. It is safest to assume that when
things go awry for any reason on a connected socket, the application
must discard and recreate the needed sockets in order to return to a
stable point. Note When issuing a blocking Winsock call such as
WSAJoinLeaf, Winsock may need to wait for a network event before the
call can complete. Winsock performs an alertable wait in this
situation, which can be interrupted by an asynchronous procedure call
(APC) scheduled on the same thread. Issuing another blocking Winsock
call inside an APC that interrupted an ongoing blocking Winsock call
on the same thread will lead to undefined behavior, and must never be
attempted by Winsock clients. Windows Phone 8: This function is
supported for Windows Phone Store apps on Windows Phone 8 and later.
Windows 8.1 and Windows Server 2012 R2: This function is supported
for Windows Store apps on Windows 8.1, Windows Server 2012 R2, and
later.


%index
WSALookupServiceBeginW
The WSALookupServiceBegin function initiates a client query that is constrained by the information contained within a WSAQUERYSET structure. (Unicode)
%group
Win32 ws2_32
%prm
lpqsRestrictions, dwControlFlags, lphLookup
lpqsRestrictions : [var] A pointer to the search criteria. See the Remarks for details.
dwControlFlags : [int] A set of flags that controls the depth of the search. Supported values for the dwControlFlags parameter are defined in the Winsock2.h header file and can be a combination of the following options.
lphLookup : [intptr] A  handle to be used when calling WSALookupServiceNext in order to start retrieving the results set.
%inst
The WSALookupServiceBegin function initiates a client query that is
constrained by the information contained within a WSAQUERYSET
structure. (Unicode)

[戻り値]
The return value is zero if the operation was successful. Otherwise,
the value SOCKET_ERROR is returned, and a specific error number can
be retrieved by calling WSAGetLastError.
This doc was truncated.

[備考]
The lpqsRestrictions parameter points to a buffer containing a
WSAQUERYSET structure. At a minimum, the dwSize member of the
WSAQUERYSET must be set to the length of the buffer before calling
the WSALookupServiceBegin function. Applications can restrict the
query by specifying other members in the WSAQUERYSET. In most
instances, applications interested in only a particular transport
protocol should constrain their query by address family and protocol
using the dwNumberOfProtocols and lpafpProtocols members of the
WSAQUERYSET rather than by specifiying the namespace in the
dwNameSpace member. Information on supported network transport
protocols can be retreived using the EnumProtocols, WSAEnumProtocols,
WSCEnumProtocols, or WSCEnumProtocols32 function. It is also possible
to constrain the query to a single namespace. For example, a query
that only wants results from DNS (not results from the local hosts
file and other naming services) would set the dwNameSpace member to
NS_DNS. For example, a bluetooth device discovery would set the the
dwNameSpace member to NS_BTH. Applications can also restrict the
query to a specific namespace provider by specifying a pointer to the
GUID for the provider in the lpNSProviderId member. Information on
namespace providers on the local computer can be retrieved using the
WSAEnumNameSpaceProviders, WSAEnumNameSpaceProvidersEx,
WSCEnumNameSpaceProviders32, or WSCEnumNameSpaceProvidersEx32
function. If LUP_CONTAINERS is specified in a call, other restriction
values should be avoided. If any are specified, it is up to the name
service provider to decide if it can support this restriction over
the containers. If it cannot, it should return an error. Some name
service providers can have other means of finding containers. For
example, containers might all be of some well-known type, or of a set
of well-known types, and therefore a query restriction can be created
for finding them. No matter what other means the name service
provider has for locating containers, LUP_CONTAINERS and
LUP_NOCONTAINERS take precedence. Hence, if a query restriction is
given that includes containers, specifying LUP_NOCONTAINERS will
prevent the container items from being returned. Similarly, no matter
the query restriction, if LUP_CONTAINERS is given, only containers
should be returned. If a namespace does not support containers, and
LUP_CONTAINERS is specified, it should simply return WSANO_DATA. The
preferred method of obtaining the containers within another
container, is the call:
This doc was truncated.


%index
WSALookupServiceEnd
The WSALookupServiceEnd function is called to free the handle after previous calls to WSALookupServiceBegin and WSALookupServiceNext.
%group
Win32 ws2_32
%prm
hLookup
hLookup : [intptr] Handle previously obtained by calling WSALookupServiceBegin.
%inst
The WSALookupServiceEnd function is called to free the handle after
previous calls to WSALookupServiceBegin and WSALookupServiceNext.

[戻り値]
The return value is zero if the operation was successful. Otherwise,
the value SOCKET_ERROR is returned, and a specific error number can
be retrieved by calling WSAGetLastError.
This doc was truncated.

[備考]
Windows Phone 8: This function is supported for Windows Phone Store
apps on Windows Phone 8 and later. Windows 8.1 and Windows Server
2012 R2: This function is supported for Windows Store apps on Windows
8.1, Windows Server 2012 R2, and later.


%index
WSALookupServiceNextW
The WSALookupServiceNext function is called after obtaining a handle from a previous call to WSALookupServiceBegin in order to retrieve the requested service information. (Unicode)
%group
Win32 ws2_32
%prm
hLookup, dwControlFlags, lpdwBufferLength, lpqsResults
hLookup : [intptr] A handle returned from the previous call to WSALookupServiceBegin.
dwControlFlags : [int] A set of flags that controls the operation. The values passed in the dwControlFlags parameter to the WSALookupServiceBegin function determine the possible criteria. Any values passed in the dwControlFlags parameter to the WSALookupServiceNext function further restrict the criteria for the service lookup. Currently, LUP_FLUSHPREVIOUS is defined as a means to cope with a result set that is too large. If an application does not (or cannot) supply a large enough buffer, setting LUP_FLUSHPREVIOUS instructs the provider to discard the last result set?which was too large?and move on to the next set for this call. Supported values for the dwControlFlags parameter are defined in the Winsock2.h header file and can be a combination of the following options.
lpdwBufferLength : [var] On input, the number of bytes contained in the buffer pointed to by lpqsResults. On output, if the function fails and the error is WSAEFAULT, then it contains the minimum number of bytes to pass for the lpqsResults to retrieve the record.
lpqsResults : [var] A pointer to a block of memory, which will contain one result set in a WSAQUERYSET structure on return.
%inst
The WSALookupServiceNext function is called after obtaining a handle
from a previous call to WSALookupServiceBegin in order to retrieve
the requested service information. (Unicode)

[戻り値]
The return value is zero if the operation was successful. Otherwise,
the value SOCKET_ERROR is returned, and a specific error number can
be retrieved by calling WSAGetLastError.
This doc was truncated.

[備考]
The dwControlFlags parameter specified in this function and the ones
specified at the time of WSALookupServiceBegin are treated as
restrictions for the purpose of combination. The restrictions are
combined between the ones at WSALookupServiceBegin time and the ones
at WSALookupServiceNext time. Therefore the flags at
WSALookupServiceNext can never increase the amount of data returned
beyond what was requested at WSALookupServiceBegin, although it is
not an error to specify more or fewer flags. The flags specified at a
given WSALookupServiceNext apply only to that call. The
dwControlFlags LUP_FLUSHPREVIOUS and LUP_RES_SERVICE are exceptions
to the combined restrictions rule (because they are behavior flags
instead of restriction flags). If either of these flags are used in
WSALookupServiceNext they have their defined effect regardless of the
setting of the same flags at WSALookupServiceBegin. For example, if
LUP_RETURN_VERSION is specified at WSALookupServiceBegin the service
provider retrieves records including the version. If
LUP_RETURN_VERSION is NOT specified at WSALookupServiceNext, the
returned information does not include the version, even though it was
available. No error is generated. Also for example, if
LUP_RETURN_BLOB is NOT specified at WSALookupServiceBegin but is
specified at WSALookupServiceNext, the returned information does not
include the private data. No error is generated. If the
WSALookupServiceNext function fails with an error of WSAEFAULT, this
indicates that the buffer pointed to by the lpqsResults parameter was
too small to contain the query results. A new buffer for a
WSAQUERYSET should be provided with a size specified by the value
pointed to by the lpdwBufferLength parameter. This new buffer for the
WSAQUERYSET needs to have some of the members of the WSAQUERYSET
specified before calling the WSALookupServiceNext function again. At
a minimum, the dwSize member of the WSAQUERYSET must be set to the
new size of the buffer. Query Results The following table describes
how the query results are represented in the WSAQUERYSET structure.
This doc was truncated.


%index
WSANSPIoctl
Enables developers to make I/O control calls to a registered namespace.
%group
Win32 ws2_32
%prm
hLookup, dwControlCode, lpvInBuffer, cbInBuffer, lpvOutBuffer, cbOutBuffer, lpcbBytesReturned, lpCompletion
hLookup : [intptr] The lookup handle returned from a previous call to the WSALookupServiceBegin function.
dwControlCode : [int] The control code of the operation to perform.
lpvInBuffer : [intptr] A pointer to the input buffer.
cbInBuffer : [int] The size, in bytes, of the input buffer.
lpvOutBuffer : [intptr] A pointer to the output buffer.
cbOutBuffer : [int] The size, in bytes, of the output buffer.
lpcbBytesReturned : [var] A pointer to the number of bytes returned.
lpCompletion : [var] A pointer to a WSACOMPLETION structure, used for asynchronous processing. Set lpCompletion to NULL to force blocking (synchronous) execution.
%inst
Enables developers to make I/O control calls to a registered
namespace.

[戻り値]
Success returns NO_ERROR. Failure returns SOCKET_ERROR, and a
specific error code can be retrieved by calling the WSAGetLastError
function. The following table describes the error codes.
This doc was truncated.

[備考]
The WSANSPIoctl function is used to set or retrieve operating
parameters associated with a query handle to a namespace provider.
The hLookup parameter is a handle to the namespace provider query
previously returned by the WSALookupServiceBegin function (not a
socket handle). Any IOCTL sent to a namespace provider may block
indefinitely, depending upon the implementation of the namespace. If
an application cannot tolerate blocking in a WSANSPIoctl function
call, overlapped I/O should be used and the lpCompletion parameter
should point to a WSACOMPLETION structure. To make a WSANSPIoctl
function call nonblocking and return immediately, set the Type member
of the WSACOMPLETION structure to NSP_NOTIFY_IMMEDIATELY. If
lpCompletion is NULL, the WSANSPIoctl function executes as a blocking
call. The namespace provider should return immediately and should not
block. But each namespace is responsible for enforcing this behavior.
The following IOCTL code is supported by several Microsoft name space
provider: SIO_NSP_NOTIFY_CHANGE This operation checks if the results
returned with previous calls using the hLookup parameter are still
valid. These previous calls include the initial call to the
WSALookupServiceBegin function to retrieve the hLookup parameter.
These previous calls may also include calls to the
WSALookupServiceNext function using the hLookup parameter.
This doc was truncated.


%index
WSANtohl
The WSANtohl function converts a u_long from network byte order to host byte order.
%group
Win32 ws2_32
%prm
s, netlong, lphostlong
s : [int] A descriptor identifying a socket.
netlong : [int] A 32-bit number in network byte order.
lphostlong : [var] A pointer to a 32-bit number to receive the number in host byte order.
%inst
The WSANtohl function converts a u_long from network byte order to
host byte order.

[戻り値]
If no error occurs, WSANtohl returns zero. Otherwise, a value of
SOCKET_ERROR is returned, and a specific error code can be retrieved
by calling WSAGetLastError.
This doc was truncated.

[備考]
The WSANtohl function takes a 32-bit number in network byte order and
returns a 32-bit number in host byte order in the 32-bit number
pointed to by the lphostlong parameter. The socket passed in the s
parameter is used to determine the network byte order required based
on the Winsock catalog protocol entry associated with the socket.
This feature supports Winsock providers that use different network
byte orders. If the socket is for the AF_INET or AF_INET6 address
family, the WSANtohl function can be used to convert an IPv4 address
in network byte order to the IPv4 address in host byte order. This
function does not do any checking to determine if the netlong
parameter is a valid IPv4 address. The WSANtohl function requires
that the Winsock DLL has previously been loaded with a successful
call to the WSAStartup function. For use with the AF_INET or AF_INET6
family, the ntohl function does not require that the Winsock DLL be
loaded. Windows Phone 8: This function is supported for Windows Phone
Store apps on Windows Phone 8 and later. Windows 8.1 and Windows
Server 2012 R2: This function is supported for Windows Store apps on
Windows 8.1, Windows Server 2012 R2, and later.


%index
WSANtohs
The WSANtohs function converts a u_short from network byte order to host byte order.
%group
Win32 ws2_32
%prm
s, netshort, lphostshort
s : [int] A descriptor identifying a socket.
netshort : [int] A 16-bit number in network byte order.
lphostshort : [var] A pointer to a 16-bit number to receive the number in host byte order.
%inst
The WSANtohs function converts a u_short from network byte order to
host byte order.

[戻り値]
If no error occurs, WSANtohs returns zero. Otherwise, a value of
SOCKET_ERROR is returned, and a specific error code can be retrieved
by calling WSAGetLastError.
This doc was truncated.

[備考]
The WSANtohs function takes a 16-bit number in network byte order and
returns a 16-bit number in host byte order in the 16-bit number
pointed to by the lphostshort parameter. The socket passed in the s
parameter is used to determine the network byte order required based
on the Winsock catalog protocol entry associated with the socket.
This feature supports Winsock providers that use different network
byte orders. If the socket is for the AF_INET or AF_INET6 address
family, the WSANtohs function can be used to convert an IP port
number in network byte order to the IP port number in host byte
order. The WSANtohs function requires that the Winsock DLL has
previously been loaded with a successful call to the WSAStartup
function. For use with the AF_INET OR AF_INET6 address family, the
ntohs function does not require that the Winsock DLL be loaded.
Windows Phone 8: This function is supported for Windows Phone Store
apps on Windows Phone 8 and later. Windows 8.1 and Windows Server
2012 R2: This function is supported for Windows Store apps on Windows
8.1, Windows Server 2012 R2, and later.


%index
WSAPoll
The WSAPoll function determines status of one or more sockets.
%group
Win32 ws2_32
%prm
fdArray, fds, timeout
fdArray : [var] An array of one or more POLLFD structures specifying the set  of sockets for which status is requested. The   array must contain at least one structure with a valid socket. Upon return, this parameter receives the updated sockets with the revents status flags member set on each one that matches the status query criteria.
fds : [int] The number of WSAPOLLFD structures in fdarray. This is not necessarily the number of sockets for which status is requested.
timeout : [int] A value that specifies the wait behavior, based on the following values.
%inst
The WSAPoll function determines status of one or more sockets.

[戻り値]
Returns one of the following values.
This doc was truncated.

[備考]
The WSAPoll function is defined on Windows Vista and later. The
[WSAPOLLFD](./ns-winsock2-wsapollfd.md) structures. An application
sets the appropriate flags in the events member of the WSAPOLLFD
structure to specify the type of status requested for each
corresponding socket. The WSAPoll function returns the status of a
socket in the revents member of the WSAPOLLFD structure. For each
socket, a caller can request information on read or write status.
Error conditions are always returned, so information on them need not
be requested. The [WSAPOLLFD](./ns-winsock2-wsapollfd.md) structure
pointed to by the fdarray parameter. All sockets that do not meet
these criteria and have no error condition will have the
corresponding revents member set to 0.
This doc was truncated.


%index
WSAProviderCompleteAsyncCall
Notifies a client when an asynchronous call to a namespace version-2 provider is completed.
%group
Win32 ws2_32
%prm
hAsyncCall, iRetCode
hAsyncCall : [intptr] The handle passed to the asynchronous call being completed. This handle is passed by the client to the namespace version-2 provider in the asynchronous function call.
iRetCode : [int] The return code for the asynchronous call to the namespace version-2 provider.
%inst
Notifies a client when an asynchronous call to a namespace version-2
provider is completed.

[戻り値]
If no error occurs, **WSAProviderCompleteAsyncCall** returns zero. If
the function fails, the return value is SOCKET_ERROR. To get extended
error information, call WSAGetLastError, which returns one of the
following extended error values.
This doc was truncated.

[備考]
The **WSAProviderCompleteAsyncCall** function is used as part of the
namespace service provider version-2 (NSPv2) architecture available
on Windows Vista and later. On Windows Vista and Windows Server 2008,
the WSAUnadvertiseProvider function can only be used for operations
on NS_EMAIL namespace providers. Asynchronous calls to NSPv2
providers are not supported on Windows Vista and Windows Server 2008.
So the **WSAProviderCompleteAsyncCall** is not currently applicable.
This function is planned for use in later versions of Windows when
asynchronous calls to namespace providers are supported. In general,
NSPv2 providers are implemented in processes other than the calling
applications. NSPv2 providers are not activated as result of client
activity. Each provider hosting application decides when to make a
specific provider available or unavailable by calling the
WSAAdvertiseProvider and WSAUnadvertiseProvider functions. The client
activity only results in attempts to contact the provider, when
available (when the namespace provider is advertised).


%index
WSAProviderConfigChange
The WSAProviderConfigChange function notifies the application when the provider configuration is changed.
%group
Win32 ws2_32
%prm
lpNotificationHandle, lpOverlapped, lpCompletionRoutine
lpNotificationHandle : [intptr] Pointer to notification handle. If the notification handle is set to NULL (the handle value not the pointer itself), this function returns a notification handle in the location pointed to by lpNotificationHandle.
lpOverlapped : [var] Pointer to a WSAOVERLAPPED structure.
lpCompletionRoutine : [int] Type: \_In_opt\_ [**LPWSAOVERLAPPED_COMPLETION_ROUTINE**](./nc-winsock2-lpwsaoverlapped_completion_routine.md) Pointer to the completion routine called when the provider change notification is received.
%inst
The WSAProviderConfigChange function notifies the application when
the provider configuration is changed.

[戻り値]
If no error occurs the WSAProviderConfigChange returns 0. Otherwise,
a value of SOCKET_ERROR is returned and a specific error code may be
retrieved by calling WSAGetLastError. The error code WSA_IO_PENDING
indicates that the overlapped operation has been successfully
initiated and that completion (and thus change event) will be
indicated at a later time.
This doc was truncated.

[備考]
The WSAProviderConfigChange function notifies the application of
provider (both transport and namespace) installation or removal in
Windows operating environments that support such configuration change
without requiring a restart. When called for the first time
(lpNotificationHandle parameter points to NULL handle), this function
completes immediately and returns notification handle in the location
pointed by lpNotificationHandle that can be used in subsequent calls
to receive notifications of provider installation and removal. The
second and any subsequent calls only complete when provider
information changes since the time the call was made It is expected
(but not required) that the application uses overlapped I/O on second
and subsequent calls to WSAProviderConfigChange, in which case the
call will return immediately and application will be notified of
provider configuration changes using the completion mechanism chosen
through specified overlapped completion parameters. Notification
handle returned by WSAProviderConfigChange is like any regular
operating system handle that should be closed (when no longer needed)
using Windows CloseHandle call. The following sequence of actions can
be used to guarantee that application always has current protocol
configuration information:
This doc was truncated.


%index
WSARecv
Receives data from a connected socket or a bound connectionless socket. (WSARecv)
%group
Win32 ws2_32
%prm
s, lpBuffers, dwBufferCount, lpNumberOfBytesRecvd, lpFlags, lpOverlapped, lpCompletionRoutine
s : [int] A  descriptor identifying a connected socket.
lpBuffers : [var] A pointer to an array of WSABUF structures. Each WSABUF structure contains a pointer to a buffer and the length, in bytes, of the buffer.
dwBufferCount : [int] The number of WSABUF structures in the lpBuffers array.
lpNumberOfBytesRecvd : [var] A pointer to the number, in bytes, of data received by this call if the receive operation completes immediately. Use NULL for this parameter if the lpOverlapped parameter is not NULL to avoid potentially erroneous results. This parameter can be NULL only  if the lpOverlapped parameter is not NULL.
lpFlags : [var] A pointer to flags used to modify the behavior of the WSARecv function call. For more information, see the Remarks section.
lpOverlapped : [var] A pointer to a WSAOVERLAPPED structure (ignored for nonoverlapped sockets).
lpCompletionRoutine : [int] Type: \_In_opt\_ [**LPWSAOVERLAPPED_COMPLETION_ROUTINE**](./nc-winsock2-lpwsaoverlapped_completion_routine.md) A pointer to the completion routine called when the receive operation has been completed (ignored for nonoverlapped sockets).
%inst
Receives data from a connected socket or a bound connectionless
socket. (WSARecv)

[戻り値]
If no error occurs and the receive operation has completed
immediately, WSARecv returns zero. In this case, the completion
routine will have already been scheduled to be called once the
calling thread is in the alertable state. Otherwise, a value of
SOCKET_ERROR is returned, and a specific error code can be retrieved
by calling WSAGetLastError. The error code WSA_IO_PENDING indicates
that the overlapped operation has been successfully initiated and
that completion will be indicated at a later time. Any other error
code indicates that the overlapped operation was not successfully
initiated and no completion indication will occur.
This doc was truncated.

[備考]
The WSARecv function provides some additional features compared with
the standard recv function in three important areas:
This doc was truncated.


%index
WSARecvDisconnect
The WSARecvDisconnect function terminates reception on a socket, and retrieves the disconnect data if the socket is connection oriented.
%group
Win32 ws2_32
%prm
s, lpInboundDisconnectData
s : [int] A descriptor identifying a socket.
lpInboundDisconnectData : [var] A pointer to the incoming disconnect data.
%inst
The WSARecvDisconnect function terminates reception on a socket, and
retrieves the disconnect data if the socket is connection oriented.

[戻り値]
If no error occurs, WSARecvDisconnect returns zero. Otherwise, a
value of SOCKET_ERROR is returned, and a specific error code can be
retrieved by calling WSAGetLastError.
This doc was truncated.

[備考]
The WSARecvDisconnect function is used on connection-oriented sockets
to disable reception and retrieve any incoming disconnect data from
the remote party. This is equivalent to a shutdown (SD_RECEIVE),
except that WSARecvDisconnect also allows receipt of disconnect data
(in protocols that support it). After this function has been
successfully issued, subsequent receives on the socket will be
disallowed. Calling WSARecvDisconnect has no effect on the lower
protocol layers. For TCP sockets, if there is still data queued on
the socket waiting to be received, or data arrives subsequently, the
connection is reset, since the data cannot be delivered to the user.
For UDP, incoming datagrams are accepted and queued. In no case will
an ICMP error packet be generated. Note The native implementation of
TCP/IP on Windows does not support disconnect data. Disconnect data
is only supported with Windows Sockets providers that have the
XP1_DISCONNECT_DATA flag in their WSAPROTOCOL_INFO structure. Use the
WSAEnumProtocols function to obtain WSAPROTOCOL_INFO structures for
all installed providers. To successfully receive incoming disconnect
data, an application must use other mechanisms to determine that the
circuit has been closed. For example, an application needs to receive
an FD_CLOSE notification, to receive a zero return value, or to
receive a WSAEDISCON or WSAECONNRESET error code from recv/WSARecv.
The WSARecvDisconnect function does not close the socket, and
resources attached to the socket will not be freed until closesocket
is invoked. The WSARecvDisconnect function does not block regardless
of the SO_LINGER setting on the socket. An application should not
rely on being able to reuse a socket after it has been disconnected
using WSARecvDisconnect. In particular, a Windows Sockets provider is
not required to support the use of connect or WSAConnect on such a
socket. Note When issuing a blocking Winsock call such as
WSARecvDisconnect, Winsock may need to wait for a network event
before the call can complete. Winsock performs an alertable wait in
this situation, which can be interrupted by an asynchronous procedure
call (APC) scheduled on the same thread. Issuing another blocking
Winsock call inside an APC that interrupted an ongoing blocking
Winsock call on the same thread will lead to undefined behavior, and
must never be attempted by Winsock clients.


%index
WSARecvFrom
Receives a datagram and stores the source address.
%group
Win32 ws2_32
%prm
s, lpBuffers, dwBufferCount, lpNumberOfBytesRecvd, lpFlags, lpFrom, lpFromlen, lpOverlapped, lpCompletionRoutine
s : [int] A descriptor identifying a socket.
lpBuffers : [var] A pointer to an array of WSABUF structures. Each WSABUF structure contains a pointer to a buffer and the length of the buffer.
dwBufferCount : [int] The number of WSABUF structures in the lpBuffers array.
lpNumberOfBytesRecvd : [var] A pointer to the number of bytes received by this call if the WSARecvFrom operation completes immediately. Use NULL for this parameter if the lpOverlapped parameter is not NULL to avoid potentially erroneous results. This parameter can be NULL only if the lpOverlapped parameter is not NULL.
lpFlags : [var] A pointer to flags used to modify the behavior of the WSARecvFrom function call. See remarks below.
lpFrom : [var] An optional pointer to a buffer that will hold the source address upon the completion of the overlapped operation.
lpFromlen : [var] A pointer to the size, in bytes, of the "from" buffer required only if lpFrom is specified.
lpOverlapped : [var] A pointer to a WSAOVERLAPPED structure (ignored for nonoverlapped sockets).
lpCompletionRoutine : [int] Type: \_In_opt\_ [**LPWSAOVERLAPPED_COMPLETION_ROUTINE**](./nc-winsock2-lpwsaoverlapped_completion_routine.md) A pointer to the completion routine called when the WSARecvFrom operation has been completed (ignored for nonoverlapped sockets).
%inst
Receives a datagram and stores the source address.

[戻り値]
If no error occurs and the receive operation has completed
immediately, WSARecvFrom returns zero. In this case, the completion
routine will have already been scheduled to be called once the
calling thread is in the alertable state. Otherwise, a value of
SOCKET_ERROR is returned, and a specific error code can be retrieved
by calling WSAGetLastError. The error code WSA_IO_PENDING indicates
that the overlapped operation has been successfully initiated and
that completion will be indicated at a later time. Any other error
code indicates that the overlapped operation was not successfully
initiated and no completion indication will occur.
This doc was truncated.

[備考]
The WSARecvFrom function provides functionality over and above the
standard recvfrom function in three important areas:
This doc was truncated.


%index
WSARemoveServiceClass
The WSARemoveServiceClass function permanently removes the service class schema from the registry.
%group
Win32 ws2_32
%prm
lpServiceClassId
lpServiceClassId : [var] Pointer to the GUID for the service class you want to remove.
%inst
The WSARemoveServiceClass function permanently removes the service
class schema from the registry.

[戻り値]
The return value is zero if the operation was successful. Otherwise,
the value SOCKET_ERROR is returned, and a specific error number can
be retrieved by calling WSAGetLastError.
This doc was truncated.


%index
WSAResetEvent
The WSAResetEvent function resets the state of the specified event object to nonsignaled.
%group
Win32 ws2_32
%prm
hEvent
hEvent : [intptr] A handle that identifies an open event object handle.
%inst
The WSAResetEvent function resets the state of the specified event
object to nonsignaled.

[戻り値]
If the WSAResetEvent function succeeds, the return value is TRUE. If
the function fails, the return value is FALSE. To get extended error
information, call WSAGetLastError.
This doc was truncated.

[備考]
The WSAResetEvent function is used to set the state of the event
object to nonsignaled. The proper way to reset the state of an event
object used with the WSAEventSelect function is to pass the handle of
the event object to the WSAEnumNetworkEvents function in the
hEventObject parameter. This will reset the event object and adjust
the status of active FD events on the socket in an atomic fashion.
Windows Phone 8: This function is supported for Windows Phone Store
apps on Windows Phone 8 and later. Windows 8.1 and Windows Server
2012 R2: This function is supported for Windows Store apps on Windows
8.1, Windows Server 2012 R2, and later.


%index
WSASend
Sends data on a connected socket. (WSASend)
%group
Win32 ws2_32
%prm
s, lpBuffers, dwBufferCount, lpNumberOfBytesSent, dwFlags, lpOverlapped, lpCompletionRoutine
s : [int] A descriptor that identifies a connected socket.
lpBuffers : [var] A pointer to an array of WSABUF structures. Each WSABUF structure contains a pointer to a buffer and the length, in bytes, of the buffer. For a Winsock application, once the WSASend function is called, the system owns these buffers and the application may not access them. This array must remain valid for the duration of the send operation.
dwBufferCount : [int] The number of WSABUF structures in the lpBuffers array.
lpNumberOfBytesSent : [var] A pointer to the number, in bytes, sent by this call if the I/O operation completes immediately. Use NULL for this parameter if the lpOverlapped parameter is not NULL to avoid potentially erroneous results. This parameter can be NULL only  if the lpOverlapped parameter is not NULL.
dwFlags : [int] The flags used to modify the behavior of the WSASend function call. For more information, see Using dwFlags in the Remarks section.
lpOverlapped : [var] A pointer to a WSAOVERLAPPED structure. This parameter is ignored for nonoverlapped sockets.
lpCompletionRoutine : [int] Type: \_In_opt\_ [**LPWSAOVERLAPPED_COMPLETION_ROUTINE**](./nc-winsock2-lpwsaoverlapped_completion_routine.md) A pointer to the completion routine called when the send operation has been completed. This parameter is ignored for nonoverlapped sockets.
%inst
Sends data on a connected socket. (WSASend)

[戻り値]
If no error occurs and the send operation has completed immediately,
WSASend returns zero. In this case, the completion routine will have
already been scheduled to be called once the calling thread is in the
alertable state. Otherwise, a value of SOCKET_ERROR is returned, and
a specific error code can be retrieved by calling WSAGetLastError.
The error code WSA_IO_PENDING indicates that the overlapped operation
has been successfully initiated and that completion will be indicated
at a later time. Any other error code indicates that the overlapped
operation was not successfully initiated and no completion indication
will occur.
This doc was truncated.

[備考]
The WSASend function provides functionality over and above the
standard send function in two important areas:
This doc was truncated.


%index
WSASendDisconnect
The WSASendDisconnect function initiates termination of the connection for the socket and sends disconnect data.
%group
Win32 ws2_32
%prm
s, lpOutboundDisconnectData
s : [int] Descriptor identifying a socket.
lpOutboundDisconnectData : [var] A pointer to the outgoing disconnect data.
%inst
The WSASendDisconnect function initiates termination of the
connection for the socket and sends disconnect data.

[戻り値]
If no error occurs, WSASendDisconnect returns zero. Otherwise, a
value of SOCKET_ERROR is returned, and a specific error code can be
retrieved by calling WSAGetLastError.
This doc was truncated.

[備考]
The WSASendDisconnect function is used on connection-oriented sockets
to disable transmission and to initiate termination of the connection
along with the transmission of disconnect data, if any. This is
equivalent to a shutdown (SD_SEND), except that WSASendDisconnect
also allows sending disconnect data (in protocols that support it).
After this function has been successfully issued, subsequent sends
are disallowed. The lpOutboundDisconnectData parameter, if not NULL,
points to a buffer containing the outgoing disconnect data to be sent
to the remote party for retrieval by using WSARecvDisconnect. Note
The native implementation of TCP/IP on Windows does not support
disconnect data. Disconnect data is only supported with Windows
Sockets providers that have the XP1_DISCONNECT_DATA flag in their
WSAPROTOCOL_INFO structure. Use the WSAEnumProtocols function to
obtain WSAPROTOCOL_INFO structures for all installed providers. The
WSASendDisconnect function does not close the socket, and resources
attached to the socket will not be freed until closesocket is
invoked. The WSASendDisconnect function does not block regardless of
the SO_LINGER setting on the socket. An application should not rely
on being able to reuse a socket after calling WSASendDisconnect. In
particular, a Windows Sockets provider is not required to support the
use of connect/WSAConnect on such a socket. Note When issuing a
blocking Winsock call such as WSASendDisconnect, Winsock may need to
wait for a network event before the call can complete. Winsock
performs an alertable wait in this situation, which can be
interrupted by an asynchronous procedure call (APC) scheduled on the
same thread. Issuing another blocking Winsock call inside an APC that
interrupted an ongoing blocking Winsock call on the same thread will
lead to undefined behavior, and must never be attempted by Winsock
clients.


%index
WSASendMsg
Sends data and optional control information from connected and unconnected sockets. Note??This function is a Microsoft-specific extension to the Windows Sockets specification.?.
%group
Win32 ws2_32
%prm
Handle, lpMsg, dwFlags, lpNumberOfBytesSent, lpOverlapped, lpCompletionRoutine
Handle : [int] A descriptor identifying the  socket.
lpMsg : [var] A WSAMSG structure storing the Posix.1g msghdr structure.
dwFlags : [int] The flags used to modify the behavior of the WSASendMsg function call. For more information, see Using dwFlags in the Remarks section.
lpNumberOfBytesSent : [var] A pointer to the number, in bytes, sent by this call if the I/O operation completes immediately. Use NULL for this parameter if the lpOverlapped parameter is not NULL to avoid potentially erroneous results. This parameter can be NULL only  if the lpOverlapped parameter is not NULL.
lpOverlapped : [var] A pointer to a WSAOVERLAPPED structure. Ignored for non-overlapped sockets.
lpCompletionRoutine : [int] Type: \_In_opt\_ [**LPWSAOVERLAPPED_COMPLETION_ROUTINE**](./nc-winsock2-lpwsaoverlapped_completion_routine.md) A pointer to the completion routine called when the send operation completes. Ignored for non-overlapped sockets.
%inst
Sends data and optional control information from connected and
unconnected sockets. Note This function is a Microsoft-specific
extension to the Windows Sockets specification. .

[戻り値]
Returns zero when successful and immediate completion occurs. When
zero is returned, the specified completion routine is called when the
calling thread is in the alertable state. A return value of
SOCKET_ERROR, and subsequent call to WSAGetLastError that returns
WSA_IO_PENDING, indicates the overlapped operation has successfully
initiated; completion is then indicated through other means, such as
through events or completion ports. Upon failure, returns
SOCKET_ERROR and a subsequent call to WSAGetLastError returns a value
other than WSA_IO_PENDING. The following table lists error codes.
This doc was truncated.

[備考]
The WSASendMsg function can be used in place of the WSASend and
WSASendTo functions. The WSASendMsg function can only be used with
datagrams and raw sockets. The socket descriptor in the s parameter
must be opened with the socket type set to SOCK_DGRAM or SOCK_RAW.
The dwFlags parameter can only contain a combination of the following
control flags: MSG_DONTROUTE, MSG_PARTIAL, and MSG_OOB. The dwFlags
member of the WSAMSG structure pointed to by the lpMsg parameter is
ignored on input and not used on output.
Note The function pointer for the WSASendMsg function must be
obtained at run time by making a call to the WSAIoctl function with
the SIO_GET_EXTENSION_FUNCTION_POINTER opcode specified. The input
buffer passed to the WSAIoctl function must contain WSAID_WSASENDMSG,
a globally unique identifier (GUID) whose value identifies the
WSASendMsg extension function. On success, the output returned by the
WSAIoctl function contains a pointer to the WSASendMsg function. The
WSAID_WSASENDMSG GUID is defined in the Mswsock.h header file.
Overlapped sockets are created with a WSASocket function call that
has the WSA_FLAG_OVERLAPPED flag set. For overlapped sockets, sending
information uses overlapped I/O unless both lpOverlapped and
lpCompletionRoutine are NULL; when lpOverlapped and
lpCompletionRoutine are NULL, the socket is treated as a
nonoverlapped socket. A completion indication occurs with overlapped
sockets; once the buffer or buffers have been consumed by the
transport, a completion routine is triggered or an event object is
set. If the operation does not complete immediately, the final
completion status is retrieved through the completion routine or by
calling the WSAGetOverlappedResult function. For nonoverlapped
sockets, the lpOverlapped and lpCompletionRoutine parameters are
ignored and WSASendMsg adopts the same blocking semantics as the send
function: data is copied from the buffer or buffers into the
transport's buffer. If the socket is nonblocking and stream oriented,
and there is insufficient space in the transport's buffer, WSASendMsg
returns with only part of the application's buffers having been
consumed. In contrast, this buffer situation on a blocking socket
results in WSASendMsg blocking until all of the application's buffer
contents have been consumed.
If this function is completed in an overlapped manner, it is the
Winsock service provider's responsibility to capture this WSABUF
structure before returning from this call. This enables applications
to build stack-based WSABUF arrays pointed to by the lpBuffers member
of the WSAMSG structure pointed to by the lpMsg parameter. For
message-oriented sockets, care must be taken not to exceed the
maximum message size of the underlying provider, which can be
obtained by getting the value of socket option SO_MAX_MSG_SIZE. If
the data is too long to pass atomically through the underlying
protocol, the error WSAEMSGSIZE is returned and no data is
transmitted.
On an IPv4 socket of type SOCK_DGRAM or SOCK_RAW, an application can
specific the local IP source address to use for sending with the
WSASendMsg function. One of the control data objects passed in the
WSAMSG structure to the WSASendMsg function may contain an in_pktinfo
structure used to specify the local IPv4 source address to use for
sending. On an IPv6 socket of type SOCK_DGRAM or SOCK_RAW, an
application can specific the local IP source address to use for
sending with the WSASendMsg function. One of the control data objects
passed in the WSAMSG structure to the WSASendMsg function may contain
an in6_pktinfo structure used to specify the local IPv6 source
address to use for sending. For a dual-stack socket when sending
datagrams with the WSASendMsg function and an application wants to
specify a specific local IP source address to be used, the method to
handle this depends on the destination IP address. When sending to an
IPv4 destination address or an IPv4-mapped IPv6 destination address,
one of the control data objects passed in the WSAMSG structure
pointed to by the lpMsg parameter should contain an in_pktinfo
structure containing the local IPv4 source address to use for
sending. When sending to an IPv6 destination address that is not a an
IPv4-mapped IPv6 address, one of the control data objects passed in
the WSAMSG structure pointed to by the lpMsg parameter should contain
an in6_pktinfo structure containing the local IPv6 source address to
use for sending. Note The SO_SNDTIMEO socket option applies only to
blocking sockets. Note The successful completion of a WSASendMsg does
not indicate that the data was successfully delivered. Note When
issuing a blocking Winsock call such as WSASendMsg with the
lpOverlapped parameter set to NULL, Winsock may need to wait for a
network event before the call can complete. Winsock performs an
alertable wait in this situation, which can be interrupted by an
asynchronous procedure call (APC) scheduled on the same thread.
Issuing another blocking Winsock call inside an APC that interrupted
an ongoing blocking Winsock call on the same thread will lead to
undefined behavior, and must never be attempted by Winsock clients.
dwFlags
This doc was truncated.


%index
WSASendTo
Sends data to a specific destination, using overlapped I/O where applicable.
%group
Win32 ws2_32
%prm
s, lpBuffers, dwBufferCount, lpNumberOfBytesSent, dwFlags, lpTo, iTolen, lpOverlapped, lpCompletionRoutine
s : [int] A descriptor identifying a (possibly connected) socket.
lpBuffers : [var] A pointer to an array of WSABUF structures. Each WSABUF structure contains a pointer to a buffer and the length of the buffer, in bytes. For a Winsock application, once the WSASendTo function is called, the system owns these buffers and the application may not access them. This array must remain valid for the duration of the send operation.
dwBufferCount : [int] The number of WSABUF structures in the lpBuffers array.
lpNumberOfBytesSent : [var] A pointer to the number of bytes sent by this call if the I/O operation completes immediately. Use NULL for this parameter if the lpOverlapped parameter is not NULL to avoid potentially erroneous results. This parameter can be NULL only  if the lpOverlapped parameter is not NULL.
dwFlags : [int] The flags  used to modify the behavior of the WSASendTo function call.
lpTo : [var] An optional pointer to the address of the target socket in the SOCKADDR structure.
iTolen : [int] The size, in bytes, of the address in the lpTo parameter.
lpOverlapped : [var] A pointer to a WSAOVERLAPPED structure (ignored for nonoverlapped sockets).
lpCompletionRoutine : [int] Type: \_In_opt\_ [**LPWSAOVERLAPPED_COMPLETION_ROUTINE**](./nc-winsock2-lpwsaoverlapped_completion_routine.md) A pointer to the completion routine called when the send operation has been completed (ignored for nonoverlapped sockets).
%inst
Sends data to a specific destination, using overlapped I/O where
applicable.

[戻り値]
If no error occurs and the send operation has completed immediately,
WSASendTo returns zero. In this case, the completion routine will
have already been scheduled to be called once the calling thread is
in the alertable state. Otherwise, a value of SOCKET_ERROR is
returned, and a specific error code can be retrieved by calling
WSAGetLastError. The error code WSA_IO_PENDING indicates that the
overlapped operation has been successfully initiated and that
completion will be indicated at a later time. Any other error code
indicates that the overlapped operation was not successfully
initiated and no completion indication will occur.
This doc was truncated.

[備考]
The WSASendTo function provides enhanced features over the standard
sendto function in two important areas:
This doc was truncated.


%index
WSASetBlockingHook
This function has been removed in compliance with the Windows Sockets 2 specification, revision 2.2.0. (WSASetBlockingHook)
%group
Win32 ws2_32
%prm
lpBlockFunc
lpBlockFunc : [var] 
%inst
This function has been removed in compliance with the Windows Sockets
2 specification, revision 2.2.0. (WSASetBlockingHook)


%index
WSASetEvent
The WSASetEvent function sets the state of the specified event object to signaled.
%group
Win32 ws2_32
%prm
hEvent
hEvent : [intptr] Handle that identifies an open event object.
%inst
The WSASetEvent function sets the state of the specified event object
to signaled.

[戻り値]
If the function succeeds, the return value is TRUE. If the function
fails, the return value is FALSE. To get extended error information,
call WSAGetLastError.
This doc was truncated.

[備考]
The WSASetEvent function sets the state of the event object to be
signaled. Windows Phone 8: This function is supported for Windows
Phone Store apps on Windows Phone 8 and later. Windows 8.1 and
Windows Server 2012 R2: This function is supported for Windows Store
apps on Windows 8.1, Windows Server 2012 R2, and later.


%index
WSASetLastError
The WSASetLastError function (winsock.h) sets the error code that can be retrieved through the WSAGetLastError function.
%group
Win32 ws2_32
%prm
iError
iError : [int] Integer that specifies the error code to be returned by a subsequent WSAGetLastError call.
%inst
The WSASetLastError function (winsock.h) sets the error code that can
be retrieved through the WSAGetLastError function.

[戻り値]
This function generates no return values.
This doc was truncated.

[備考]
The WSASetLastError function allows an application to set the error
code to be returned by a subsequent WSAGetLastError call for the
current thread. Note that any subsequent Windows Sockets routine
called by the application will override the error code as set by this
routine. The error code set by WSASetLastError is different from the
error code reset by calling the function getsockopt with SO_ERROR.
The Windows Sockets error codes used by this function are listed
under Windows Sockets Error Codes. Windows Phone 8: This function is
supported for Windows Phone Store apps on Windows Phone 8 and later.
Windows 8.1 and Windows Server 2012 R2: This function is supported
for Windows Store apps on Windows 8.1, Windows Server 2012 R2, and
later.


%index
WSASetServiceW
The WSASetService function registers or removes from the registry a service instance within one or more namespaces. (Unicode)
%group
Win32 ws2_32
%prm
lpqsRegInfo, essoperation, dwControlFlags
lpqsRegInfo : [var] A pointer to the service information for registration or deregistration.
essoperation : [int] A value that determines that operation requested. This parameter can be one of the values from the WSAESETSERVICEOP enumeration type defined in the Winsock2.h header file.
dwControlFlags : [int] Service install flags value that further controls the operation performed of the WSASetService function. The possible values for this parameter are defined in the Winsock2.h header file.
%inst
The WSASetService function registers or removes from the registry a
service instance within one or more namespaces. (Unicode)

[戻り値]
The return value for WSASetService is zero if the operation was
successful. Otherwise, the value SOCKET_ERROR is returned, and a
specific error number can be retrieved by calling WSAGetLastError.
This doc was truncated.

[備考]
The WSASetService function can be used to affect a specific namespace
provider, all providers associated with a specific namespace, or all
providers across all namespaces. The available values for
essOperation and dwControlFlags combine to control operation of the
WSASetService function as shown in the following table.
This doc was truncated.


%index
WSASocketW
The WSASocket function creates a socket that is bound to a specific transport-service provider. (Unicode)
%group
Win32 ws2_32
%prm
af, type, protocol, lpProtocolInfo, g, dwFlags
af : [int] The address family specification. Possible values for the address family are defined in the Winsock2.h header file. On the Windows SDK released for Windows?Vista and later, the organization of header files has changed and the possible values for the address family are defined in the Ws2def.h header file. Note that the Ws2def.h header file is automatically included in Winsock2.h, and should never be used directly. The values currently supported are AF_INET or AF_INET6, which are the Internet address family formats for IPv4 and IPv6. Other options for address family (AF_NETBIOS for use with NetBIOS, for example) are supported if a Windows Sockets service provider for the address family is installed. Note that the values for the AF_ address family and PF_ protocol family constants  are identical (for example, AF_INET and PF_INET), so either constant can be used. The table below lists common values for address family although many other values are possible.
type : [int] The type specification for the new socket.
protocol : [int] The protocol to be used. The possible options for the protocol parameter are specific to the address family and socket type specified. Possible values for the protocol are defined are defined in the  Winsock2.h and Wsrm.h header files. On the Windows SDK released for Windows?Vista and later,, the organization of header files has changed and this parameter can be one of the values from the IPPROTO enumeration type defined in the Ws2def.h header file. Note that the Ws2def.h header file is automatically included in Winsock2.h, and should never be used directly. If a value of  0 is specified, the caller does not wish to specify a protocol and the service provider will choose the protocol to use.
lpProtocolInfo : [var] A pointer to a WSAPROTOCOL_INFO structure that defines the characteristics of the socket to be created. If this parameter is not NULL, the socket will be bound to the provider associated with the indicated WSAPROTOCOL_INFO structure.
g : [int] An existing socket group ID or an appropriate action to take when creating a new socket and a new socket group. If g is an existing socket group ID, join the new socket to this socket group, provided all the requirements set by this group are met. If g is not an existing socket group ID, then the following values are possible.
dwFlags : [int] A set of flags used to specify additional socket attributes. A combination of these flags may be set, although some combinations are not allowed.
%inst
The WSASocket function creates a socket that is bound to a specific
transport-service provider. (Unicode)

[戻り値]
If no error occurs, WSASocket returns a descriptor referencing the
new socket. Otherwise, a value of INVALID_SOCKET is returned, and a
specific error code can be retrieved by calling WSAGetLastError. Note
This error code description is Microsoft-specific.
This doc was truncated.

[備考]
The WSASocket function causes a socket descriptor and any related
resources to be allocated and associated with a transport-service
provider. Most sockets should be created with the WSA_FLAG_OVERLAPPED
attribute set in the dwFlags parameter. A socket created with this
attribute supports the use of overlapped I/O operations which provide
higher performance. By default, a socket created with the WSASocket
function will not have this overlapped attribute set. In contrast,
the socket function creates a socket that supports overlapped I/O
operations as the default behavior. If the lpProtocolInfo parameter
is NULL, Winsock will utilize the first available transport-service
provider that supports the requested combination of address family,
socket type and protocol specified in the af, type, and protocol
parameters. If the lpProtocolInfo parameter is not NULL, the socket
will be bound to the provider associated with the indicated
WSAPROTOCOL_INFO structure. In this instance, the application can
supply the manifest constant FROM_PROTOCOL_INFO as the value for any
of af, type, or protocol parameters. This indicates that the
corresponding values from the indicated WSAPROTOCOL_INFO structure
(iAddressFamily, iSocketType, iProtocol) are to be assumed. In any
case, the values specified for af, type, and protocol are passed
unmodified to the transport-service provider. When selecting a
protocol and its supporting service provider based on af, type, and
protocol, this procedure will only choose a base protocol or a
protocol chain, not a protocol layer by itself. Unchained protocol
layers are not considered to have partial matches on type or af,
either. That is, they do not lead to an error code of WSAEAFNOSUPPORT
or WSAEPROTONOSUPPORT, if no suitable protocol is found. Note The
manifest constant AF_UNSPEC continues to be defined in the header
file but its use is strongly discouraged, as this can cause ambiguity
in interpreting the value of the protocol parameter. Applications are
encouraged to use AF_INET6 for the af parameter and create a
dual-mode socket that can be used with both IPv4 and IPv6. If a
socket is created using the WSASocket function, then the dwFlags
parameter must have the WSA_FLAG_OVERLAPPED attribute set for the
SO_RCVTIMEO or SO_SNDTIMEO socket options to function properly.
Otherwise the timeout never takes effect on the socket.
Connection-oriented sockets such as SOCK_STREAM provide full-duplex
connections, and must be in a connected state before any data can be
sent or received on them. A connection to a specified socket is
established with a connect or WSAConnect function call. Once
connected, data can be transferred using send/WSASend and
recv/WSARecv calls. When a session has been completed, the
closesocket function should be called to release the resources
associated with the socket. For connection-oriented sockets, the
shutdown function should be called to stop data transfer on the
socket before calling the closesocket function. The communications
protocols used to implement a reliable, connection-oriented socket
ensure that data is not lost or duplicated. If data for which the
peer protocol has buffer space cannot be successfully transmitted
within a reasonable length of time, the connection is considered
broken and subsequent calls will fail with the error code set to
WSAETIMEDOUT. Connectionless, message-oriented sockets allow sending
and receiving of datagrams to and from arbitrary peers using
sendto/WSASendTo and recvfrom/WSARecvFrom. If such a socket is
connected to a specific peer, datagrams can be sent to that peer
using send/WSASend and can be received from (only) this peer using
recv/WSARecv. Support for sockets with type SOCK_RAW is not required,
but service providers are encouraged to support raw sockets whenever
possible. The WSASocket function can be used to create a socket to be
used by a service so that if another socket tries to bind to the same
port used by the service, and audit record is generated. To enable
this option, an application would need to do the following:
This doc was truncated.


%index
WSAStringToAddressW
The WSAStringToAddress function converts a network address in its standard text presentation form into its numeric binary form in a sockaddr structure, suitable for passing to Windows Sockets routines that take such a structure. (Unicode)
%group
Win32 ws2_32
%prm
AddressString, AddressFamily, lpProtocolInfo, lpAddress, lpAddressLength
AddressString : [wstr] A pointer to the zero-terminated string that contains the network address in standard text form to convert.
AddressFamily : [int] The address family of the network address pointed to by the AddressString parameter.
lpProtocolInfo : [var] The WSAPROTOCOL_INFO structure associated with the provider to be used. If this is NULL, the call is routed to the provider of the first protocol supporting the indicated AddressFamily.
lpAddress : [var] A pointer to a buffer that is filled with a  sockaddr structure for the address string if the function succeeds.
lpAddressLength : [var] A pointer to the length, in bytes, of the buffer pointed to by the lpAddress parameter. If the function call is successful, this parameter returns a pointer to the size of the sockaddr structure returned in the lpAddress parameter. If the specified buffer is not large enough, the function fails with a specific error of WSAEFAULT and this parameter is updated with the required size in bytes.
%inst
The WSAStringToAddress function converts a network address in its
standard text presentation form into its numeric binary form in a
sockaddr structure, suitable for passing to Windows Sockets routines
that take such a structure. (Unicode)

[戻り値]
The return value for WSAStringToAddress is zero if the operation was
successful. Otherwise, the value SOCKET_ERROR is returned, and a
specific error number can be retrieved by calling WSAGetLastError.
This doc was truncated.

[備考]
The WSAStringToAddress function converts a network address in
standard text form into its numeric binary form in a sockaddr
structure. Any missing components of the address will be defaulted to
a reasonable value, if possible. For example, a missing port number
will default to zero. If the caller wants the translation to be done
by a particular provider, it should supply the corresponding
WSAPROTOCOL_INFO structure in the lpProtocolInfo parameter. The
WSAStringToAddress function fails (and returns WSAEINVAL) if the
sin_family member of the SOCKADDR_IN structure, which is passed in
the lpAddress parameter in the form of a sockaddr structure, is not
set to AF_INET or AF_INET6. Support for IPv6 addresses using the
WSAStringToAddress function was added on Windows XP with Service Pack
1 (SP1)and later. IPv6 must also be installed on the local computer
for the WSAStringToAddress function to support IPv6 addresses.
Windows Phone 8: This function is supported for Windows Phone Store
apps on Windows Phone 8 and later. Windows 8.1 and Windows Server
2012 R2: This function is supported for Windows Store apps on Windows
8.1, Windows Server 2012 R2, and later.
> [!NOTE] > The winsock2.h header defines WSAStringToAddress as an
alias which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
WSAUnadvertiseProvider
Makes a specific namespace version-2 provider no longer available for clients.
%group
Win32 ws2_32
%prm
puuidProviderId
puuidProviderId : [var] A pointer to the provider ID of the namespace provider.
%inst
Makes a specific namespace version-2 provider no longer available for
clients.

[戻り値]
If no error occurs, **WSAUnadvertiseProvider** returns zero.
Otherwise, it returns **SOCKET_ERROR**, and a specific error code is
available by calling WSAGetLastError.
This doc was truncated.

[備考]
The **WSAUnadvertiseProvider** function is used as part of the
namespace service provider version-2 (NSPv2) architecture available
on Windows Vista and later. On Windows Vista and Windows Server 2008,
the **WSAUnadvertiseProvider** function can only be used for
operations on NS_EMAIL namespace providers. In general, NSPv2
providers are implemented in processes other than the calling
applications. NSPv2 providers are not activated as result of client
activity. Each provider hosting application decides when to make a
specific provider available or unavailable by calling the
WSAAdvertiseProvider and **WSAUnadvertiseProvider** functions. The
client activity only results in attempts to contact the provider,
when available (when the namespace provider is advertised).


%index
WSAUnhookBlockingHook
This function has been removed in compliance with the Windows Sockets 2 specification, revision 2.2.0. (WSAUnhookBlockingHook)
%group
Win32 ws2_32
%prm

%inst
This function has been removed in compliance with the Windows Sockets
2 specification, revision 2.2.0. (WSAUnhookBlockingHook)


%index
WSAWaitForMultipleEvents
Returns when one or all of the specified event objects are in the signaled state, when the time-out interval expires, or when an I/O completion routine has executed.
%group
Win32 ws2_32
%prm
cEvents, lphEvents, fWaitAll, dwTimeout, fAlertable
cEvents : [int] The number of event object handles in the array pointed to by lphEvents. The maximum number of event object handles is WSA_MAXIMUM_WAIT_EVENTS. One or more events must be specified.
lphEvents : [intptr] A pointer to an array of event object handles. The array can contain handles of objects of different types. It may not contain multiple copies of the same handle if the fWaitAll parameter is set to TRUE. If one of these handles is closed while the wait is still pending, the behavior of WSAWaitForMultipleEvents is undefined. The handles must have the SYNCHRONIZE access right.  For more information, see Standard Access Rights.
fWaitAll : [int] A value that specifies the wait type. If TRUE, the function returns when the state of all objects in the lphEvents array is signaled. If FALSE, the function returns when any  of the event objects is signaled. In the latter case, the return value minus WSA_WAIT_EVENT_0 indicates the index of the event object whose state caused the function to return. If more than one event object became signaled during the call, this is the array index to the signaled event object with the smallest index value of all the signaled event objects.
dwTimeout : [int] The time-out interval, in milliseconds. WSAWaitForMultipleEvents returns if the time-out interval expires, even if conditions specified by the fWaitAll parameter are not satisfied. If the dwTimeout parameter is zero, WSAWaitForMultipleEvents tests the state of the specified event objects and returns immediately. If dwTimeout is WSA_INFINITE, WSAWaitForMultipleEvents waits forever; that is, the time-out interval never expires.
fAlertable : [int] A value that specifies whether the thread is placed in an alertable wait state so the system can execute I/O completion routines. If TRUE, the thread is placed in an alertable wait state and WSAWaitForMultipleEvents can return when the system executes an I/O completion routine. In this case, WSA_WAIT_IO_COMPLETION is returned and the event that was being waited on is not signaled yet. The application must call the WSAWaitForMultipleEvents function again. If FALSE, the thread is not placed in an alertable wait state and I/O completion routines are not executed.
%inst
Returns when one or all of the specified event objects are in the
signaled state, when the time-out interval expires, or when an I/O
completion routine has executed.

[戻り値]
If the WSAWaitForMultipleEvents function succeeds, the return value
upon success is one of the following values.
This doc was truncated.

[備考]
The WSAWaitForMultipleEvents function determines whether the wait
criteria have been met. If the criteria have not been met, the
calling thread enters the wait state. It uses no processor time while
waiting for the criteria to be met. The WSAWaitForMultipleEvents
function returns when any one or all of the specified objects are in
the signaled state, or when the time-out interval elapses. When the
bWaitAll parameter is TRUE, the wait operation is completed only when
the states of all objects have been set to signaled. The function
does not modify the states of the specified objects until the states
of all objects have been set to signaled. When bWaitAll parameter is
FALSE, WSAWaitForMultipleEvents checks the handles in the lphEvents
array in order starting with index 0, until one of the objects is
signaled. If multiple objects become signaled, the function returns
the index of the first handle in the lphEvents array whose object was
signaled. This function is also used to perform an alertable wait by
setting the fAlertable parameter to TRUE. This enables the function
to return when the system executes an I/O completion routine by the
calling thread. A thread must be in an alertable wait state in order
for the system to execute I/O completion routines (asynchronous
procedure calls or APCs). So if an application calls
WSAWaitForMultipleEvents when there are pending asynchronous
operations that have I/O completion routines and the fAlertable
parameter is FALSE, then those I/O completion routines will not be
executed even if those I/O operations are completed. If the
fAlertable parameter is TRUE and one of the pending operations
completes, the APC is executed and WSAWaitForMultipleEvents will
return WSA_IO_COMPLETION. The pending event is not signaled yet. The
application must call the WSAWaitForMultipleEvents function again.
Applications that require an alertable wait state without waiting for
any event objects to be signaled should use the Windows SleepEx
function. The current implementation of WSAWaitForMultipleEvents
calls the WaitForMultipleObjectsEx function. Note Use caution when
calling the WSAWaitForMultipleEvents with code that directly or
indirectly creates windows. If a thread creates any windows, it must
process messages. Message broadcasts are sent to all windows in the
system. A thread that uses WSAWaitForMultipleEvents with no time-out
limit (the dwTimeout parameter set to WSA_INFINITE) may cause the
system to become deadlocked. Example Code The following code example
shows how to use the WSAWaitForMultipleEvents function.
This doc was truncated.


%index
WSCDeinstallProvider
Removes the specified transport provider from the system configuration database.
%group
Win32 ws2_32
%prm
lpProviderId, lpErrno
lpProviderId : [var] A pointer to a globally unique identifier (GUID)  for the provider. This value is stored within each WSAProtocol_Info structure.
lpErrno : [var] A pointer to the error code if the function fails.
%inst
Removes the specified transport provider from the system
configuration database.

[戻り値]
If no error occurs, **WSCDeinstallProvider** returns zero. Otherwise,
it returns **SOCKET_ERROR**, and a specific error code is available
in lpErrno.
This doc was truncated.

[備考]
The **WSCDeinstallProvider** function removes the common Windows
Sockets 2 configuration information for the specified provider. After
this routine completes successfully, the configuration information
stored in the registry will be changed. However, any Ws2_32.dll
instances currently in memory will not be able to recognize this
change. On success, **WSCDeinstallProvider** will attempt to alert
all interested applications that have registered for notification of
the change by calling WSAProviderConfigChange. The
**WSCDeinstallProvider** function can only be called by a user logged
on as a member of the Administrators group. If
**WSCDeinstallProvider** is called by a user that is not a member of
the Administrators group, the function call will fail and
**WSANO_RECOVERY** is returned in the lpErrno parameter.
For computers running Windows Vista or Windows Server 2008, this
function can also fail because of user account control (UAC). If an
application that contains this function is executed by a user logged
on as a member of the Administrators group other than the built-in
Administrator, this call will fail unless the application has been
marked in the manifest file with a **requestedExecutionLevel** set to
**requireAdministrator**. If the application on Windows Vista or
Windows Server 2008 lacks this manifest file, a user logged on as a
member of the Administrators group other than the built-in
Administrator must then be executing the application in an enhanced
shell as the built-in Administrator (RunAs administrator) for this
function to succeed.
The caller of this function must remove any additional files or
service provider?specific configuration information that is needed to
completely uninstall the service provider.


%index
WSCEnableNSProvider
Changes the state of a given namespace provider.
%group
Win32 ws2_32
%prm
lpProviderId, fEnable
lpProviderId : [var] A pointer to a globally unique identifier (GUID)  for the namespace provider.
fEnable : [int] A Boolean value that, if **TRUE**, the provider is set to the active state. If **FALSE**, the provider is disabled and will not be available for query operations or service registration.
%inst
Changes the state of a given namespace provider.

[戻り値]
If no error occurs, the **WSCEnableNSProvider** function returns
**NO_ERROR** (zero). Otherwise, it returns **SOCKET_ERROR** if the
function fails, and you must retrieve the appropriate error code
using the WSAGetLastError function.
This doc was truncated.

[備考]
The **WSCEnableNSProvider** function is intended to be used to change
the state of the namespace providers. An independent software vendor
(ISV) should not normally de-activate another ISV namespace provider
in order to activate its own. The choice should be left to the user.
The **WSCEnableNSProvider** function does not affect applications
that are already running. Newly installed namespace providers will
not be visible to applications nor will the changes in a namespace
provider's activation state be visible. Applications launched after
the call to **WSCEnableNSProvider** will see the changes. The
**WSCEnableNSProvider** function can only be called by a user logged
on as a member of the Administrators group. If
**WSCEnableNSProvider** is called by a user that is not a member of
the Administrators group, the function call will fail.
For computers running Windows Vista or Windows Server 2008, this
function can also fail because of user account control (UAC). If an
application that contains this function is executed by a user logged
on as a member of the Administrators group other than the built-in
Administrator, this call will fail unless the application has been
marked in the manifest file with a **requestedExecutionLevel** set to
**requireAdministrator**. If the application on Windows Vista or
Windows Server 2008 lacks this manifest file, a user logged on as a
member of the Administrators group other than the built-in
Administrator must then be executing the application in an enhanced
shell as the built-in Administrator (RunAs administrator) for this
function to succeed.


%index
WSCEnumProtocols
The WSCEnumProtocols function retrieves information about available transport protocols.
%group
Win32 ws2_32
%prm
lpiProtocols, lpProtocolBuffer, lpdwBufferLength, lpErrno
lpiProtocols : [var] A **NULL**-terminated array of iProtocol values. This parameter is optional; if lpiProtocols is NULL, information on all available protocols is returned. Otherwise, information is retrieved only for those protocols listed in the array.
lpProtocolBuffer : [var] A pointer to a buffer that is filled with WSAPROTOCOL_INFOW structures.
lpdwBufferLength : [var] On input, size of the lpProtocolBuffer buffer passed to **WSCEnumProtocols**, in bytes. On output, the minimum buffer size, in bytes, that can be passed to **WSCEnumProtocols** to retrieve all the requested information.
lpErrno : [var] A pointer to the error code.
%inst
The WSCEnumProtocols function retrieves information about available
transport protocols.

[戻り値]
If no error occurs, **WSCEnumProtocols** returns the number of
protocols to be reported on. Otherwise, a value of SOCKET_ERROR is
returned and a specific error code is available in lpErrno.
This doc was truncated.

[備考]
The **WSCEnumProtocols** function is used to discover information
about the collection of transport protocols installed on the local
computer. This function differs from its API counterpart
(WSAEnumProtocols) in that WSAPROTOCOL_INFOW structures for all
installed protocols are returned. This includes protocols that the
service provider has set the **PFL_HIDDEN** flag in the
**dwProviderFlags** member of the **WSAPROTOCOL_INFOW** structure to
indicate to the Ws2_32.dll that this protocol should not be returned
in the result buffer generated by **WSAEnumProtocols** function. In
addition, the **WSCEnumProtocols** also returns data for
**WSAPROTOCOL_INFOW** structures that have a chain length of zero ( a
dummy LSP provider). The **WSAEnumProtocols** only returns
information on base protocols and protocol chains that lack the
**PFL_HIDDEN** flag and don't have a protocol chain length of zero.
**Note** Layered Service Providers are deprecated. Starting with
Windows 8 and Windows Server 2012, use Windows Filtering Platform.
The lpiProtocols parameter can be used as a filter to constrain the
amount of information provided. Typically, a null pointer is supplied
so the function will return information on all available transport
protocols. A WSAPROTOCOL_INFOW structure is provided in the buffer
pointed to by lpProtocolBuffer for each requested protocol. If the
supplied buffer is not large enough (as indicated by the input value
of lpdwBufferLength), the value pointed to by lpdwBufferLength will
be updated to indicate the required buffer size. The Windows Sockets
SPI client should then obtain a large enough buffer and call this
function again. The **WSCEnumProtocols** function cannot enumerate
over multiple calls; the passed-in buffer must be large enough to
hold all expected entries in order for the function to succeed. This
reduces the complexity of the function and should not pose a problem
because the number of protocols loaded on a local computer is
typically small. The order in which the WSAPROTOCOL_INFOW structures
appear in the buffer coincides with the order in which the protocol
entries were registered by the service provider with the WS2_32.dll,
or with any subsequent reordering that may have occurred through the
Windows Sockets applet supplied for establishing default transport
providers.


%index
WSCGetApplicationCategory
Retrieves the layered service provider (LSP) categories associated with an application.
%group
Win32 ws2_32
%prm
Path, PathLength, Extra, ExtraLength, pPermittedLspCategories, lpErrno
Path : [wstr] A pointer to a Unicode string that contains the load path to the executable image for the application. This string observes the usual rules for path resolution and can contain embedded environment strings (such as %SystemRoot%).
PathLength : [int] The length, in characters, of the Path parameter. This length does not include the terminating **NULL**.
Extra : [wstr] A pointer to a Unicode string which represents the command line arguments used when starting the application specified in the Path parameter. The Extra parameter is used to distinguish between multiple, distinct instances of an application when launched with a consistent command line.  This is to support different application categorizations for different instances of Svchost.exe or Rundll32.exe. If only the Path parameter is required and no command line arguments are needed to further distinguish between instances of an application, then the Extra parameter should be set to **NULL**.
ExtraLength : [int] The length, in characters, of the Extra parameter. This length does not include the terminating **NULL**.
pPermittedLspCategories : [var] A pointer to a DWORD value of permitted LSP categories which are permitted for all instances of this application. The application is identified by the combination of the values of the Path and Extra parameters.
lpErrno : [var] A pointer to the error code if the function fails.
%inst
Retrieves the layered service provider (LSP) categories associated
with an application.

[戻り値]
If no error occurs, **WSCGetApplicationCategory** returns
**ERROR_SUCCESS** (zero). Otherwise, it returns **SOCKET_ERROR**, and
a specific error code is returned in the lpErrno parameter.
This doc was truncated.

[備考]
**WSCGetApplicationCategory** is used to retrieve the LSP category
flags associated with an application instance. Applications can
determine which LSP behaviors are acceptable within the application's
context. Therefore, by specifying permitted LSP categories, an
application can permit only those layered service providers which
implement acceptable behaviors to be loaded. The Extra parameter is
required when the command line is used to distinguish between
different instances of an application or service hosted within the
same executable. Each instance can have different application
categorization needs. Svchost.exe and Rundll32.exe are two examples
where the command line is required to differentiate between different
process instances. For SvcHost.exe, the **-k <svcinstance>** switch
defines the process instance. For services, using the Service Name is
not sufficient, since the Winsock Catalog is global to a given
process, and a process may host several services. Window sockets
determine an application's identity and retrieves the permitted LSP
categories during the first call to WSAStartup. This will be the set
of permitted LSP categories for the duration of the application
instance. Subsequent changes to the permitted LSP categories for a
given application identity will not be picked up until the next
instance of the application. The permitted LSP categories are not
mutable during the lifetime of the application instance. Winsock 2
accommodates layered protocols. A layered protocol is one that
implements only higher level communications functions, while relying
on an underlying transport stack for the actual exchange of data with
a remote endpoint. An example of a layered protocol or layered
service provider would be a security layer that adds protocol to the
connection establishment process in order to perform authentication
and to establish a mutually agreed upon encryption scheme. Such a
security protocol would generally require the services of an
underlying reliable transport protocol such as TCP or SPX. The term
base protocol refers to a protocol such as TCP or SPX which is
capable of performing data communications with a remote endpoint. The
term layered protocol is used to describe a protocol that cannot
stand alone. During LSP initialization, the LSP must provide pointers
to a number of Winsock SPI functions. These functions will be called
during normal processing by the layer directly above the LSP (either
another LSP or Ws2_32.DLL). An LSP that implements an installable
file system (IFS) can selectively choose to provide pointers to
functions which are implemented by itself, or pass back the pointers
provided by the layer directly below the LSP. Non-IFS LSPs, because
they provide their own handles, must implement all of the Winsock SPI
functions. This is because each SPI will require the LSP to map all
of the socket handles it created to the socket handle of the lower
provider (either another LSP or the base protocol). However, all LSPs
perform their specific work by doing extra processing on only a
subset of the Winsock SPI functions. It is possible to define LSP
categories based upon the subset of SPI functions an LSP implements
and the nature of the extra processing performed for each of those
functions. By classifying LSPs, as well as classifying applications
which use Winsock sockets, it becomes possible to selectively
determine if an LSP should be involved in a given process at runtime.
On Windows Vista and later, an LSP can be classified based on how it
interacts with Windows Sockets calls and data. An LSP category is an
identifiable group of behaviors on a subset of Winsock SPI functions.
For example, an HTTP content filter would be categorized as a data
inspector (the LSP_INSPECTOR category). The LSP_INSPECTOR category
will inspect (but not alter) parameters to data transfer SPI
functions. An application can query for the category of an LSP and
choose to not load the LSP based on the LSP category and the
application's set of permitted LSP categories.
This doc was truncated.


%index
WSCGetProviderInfo
Retrieves the data associated with an information class for a layered service provider (LSP).
%group
Win32 ws2_32
%prm
lpProviderId, InfoType, Info, InfoSize, Flags, lpErrno
lpProviderId : [var] A pointer to a globally unique identifier (GUID)  for the provider.
InfoType : [int] The information class that is requested for this LSP protocol entry.
Info : [var] A pointer to a buffer to receive the information class data for the requested LSP protocol entry. If this parameter is **NULL**, then **WSCGetProviderInfo** returns failure and the size required for this buffer is returned in the InfoSize parameter.
InfoSize : [var] The size, in bytes, of the buffer pointed to by the Info  parameter. If the Info parameter is **NULL**, then  **WSCGetProviderInfo** returns failure and the InfoSize parameter will receive the size of the required buffer.
Flags : [int] The flags used to modify the behavior of the **WSCGetProviderInfo** function call.
lpErrno : [var] A pointer to the error code if the function fails.
%inst
Retrieves the data associated with an information class for a layered
service provider (LSP).

[戻り値]
If no error occurs, **WSCGetProviderInfo** returns **ERROR_SUCCESS**
(zero). Otherwise, it returns **SOCKET_ERROR**, and a specific error
code is returned in the lpErrno parameter.
This doc was truncated.

[備考]
**WSCGetProviderInfo** is used to retrieve information class data for
a layered service provider. When the InfoType parameter is set to
**ProviderInfoLspCategories**, on success **WSCGetProviderInfo**
returns with the Info parameter set with appropriate LSP category
flags implemented by the LSP. Winsock 2 accommodates layered
protocols. A layered protocol is one that implements only higher
level communications functions, while relying on an underlying
transport stack for the actual exchange of data with a remote
endpoint. An example of a layered protocol or layered service
provider would be a security layer that adds protocol to the
connection establishment process in order to perform authentication
and to establish a mutually agreed upon encryption scheme. Such a
security protocol would generally require the services of an
underlying reliable transport protocol such as TCP or SPX. The term
base protocol refers to a protocol such as TCP or SPX which is
capable of performing data communications with a remote endpoint. The
term layered protocol is used to describe a protocol that cannot
stand alone. A protocol chain would then be defined as one or more
layered protocols strung together and anchored by a base protocol. A
base protocol has the **ChainLen** member of the WSAProtocol_Info
structure set to **BASE_PROTOCOL** which is defined to be 1. A
layered protocol has the **ChainLen** member of the
**WSAPROTOCOL_INFO** structure set to **LAYERED_PROTOCOL** which is
defined to be zero. A protocol chain has the **ChainLen** member of
the **WSAPROTOCOL_INFO** structure set to greater than 1. During LSP
initialization, the LSP must provide pointers to a number of Winsock
SPI functions. These functions will be called during normal
processing by the layer directly above the LSP (either another LSP or
Ws2_32.DLL). An LSP that implements an installable file system (IFS)
can selectively choose to provide pointers to functions which are
implemented by itself, or pass back the pointers provided by the
layer directly below the LSP. Non-IFS LSPs, because they provide
their own handles, must implement all of the Winsock SPI functions.
This is because each SPI will require the LSP to map all of the
socket handles it created to the socket handle of the lower provider
(either another LSP or the base protocol). However, all LSPs perform
their specific work by doing extra processing on only a subset of the
Winsock SPI functions. It is possible to define LSP categories based
upon the subset of SPI functions an LSP implements and the nature of
the extra processing performed for each of those functions. By
classifying LSPs, as well as classifying applications which use
Winsock sockets, it becomes possible to selectively determine if an
LSP should be involved in a given process at runtime.
On Windows Vista and later, an LSP can be classified based on how it
interacts with Windows Sockets calls and data. An LSP category is an
identifiable group of behaviors on a subset of Winsock SPI functions.
For example, an HTTP content filter would be categorized as a data
inspector (the LSP_INSPECTOR category). The LSP_INSPECTOR category
will inspect (but not alter) parameters to data transfer SPI
functions. An application can query for the category of an LSP and
choose to not load the LSP based on the LSP category and the
application's set of permitted LSP categories.
This doc was truncated.


%index
WSCGetProviderPath
The WSCGetProviderPath function retrieves the DLL path for the specified provider.
%group
Win32 ws2_32
%prm
lpProviderId, lpszProviderDllPath, lpProviderDllPathLen, lpErrno
lpProviderId : [var] A pointer to a globally unique identifier (GUID)  for the provider. This value is obtained by using WSCEnumProtocols.
lpszProviderDllPath : [wstr] A pointer to a buffer into which the provider DLL's path string is returned. The path is a null-terminated string and any embedded environment strings, such as %SystemRoot%, have not been expanded.
lpProviderDllPathLen : [var] The size, in characters, of the buffer pointed to by the lpszProviderDllPath parameter.
lpErrno : [var] A pointer to the error code if the function fails.
%inst
The WSCGetProviderPath function retrieves the DLL path for the
specified provider.

[戻り値]
If no error occurs, **WSCGetProviderPath** returns zero. Otherwise,
it returns SOCKET_ERROR. The specific error code is available in
lpErrno.
This doc was truncated.

[備考]
The **WSCGetProviderPath** function retrieves the DLL path for the
specified provider. The DLL path can contain embedded environment
strings, such as %SystemRoot%, and thus should be expanded prior to
being used with the Windows LoadLibrary function. For more
information, see **LoadLibrary**.


%index
WSCInstallNameSpace
Installs a namespace provider. (WSCInstallNameSpace)
%group
Win32 ws2_32
%prm
lpszIdentifier, lpszPathName, dwNameSpace, dwVersion, lpProviderId
lpszIdentifier : [wstr] A pointer to a string that identifies the provider associated with the globally unique identifier (GUID) passed in the lpProviderId parameter.
lpszPathName : [wstr] A pointer to a Unicode string that contains the load path to the provider DLL. This string observes the usual rules for path resolution and can contain embedded environment strings (such as %SystemRoot%). Such environment strings are expanded when the Ws2_32.dll must subsequently load the provider DLL on behalf of an application. After any embedded environment strings are expanded, the Ws2_32.dll passes the resulting string to the LoadLibrary function which loads the provider into memory. For more information, see **LoadLibrary**.
dwNameSpace : [int] The namespace supported by this provider.
dwVersion : [int] The version number of the provider.
lpProviderId : [var] A pointer to a GUID  for the provider. This GUID should be generated by Uuidgen.exe.
%inst
Installs a namespace provider. (WSCInstallNameSpace)

[戻り値]
If no error occurs, the **WSCInstallNameSpace** function returns
**NO_ERROR** (zero). Otherwise, it returns **SOCKET_ERROR** if the
function fails, and you must retrieve the appropriate error code
using the WSAGetLastError function.
This doc was truncated.

[備考]
The namespace?configuration functions do not affect applications that
are already running. Newly installed namespace providers will not be
visible to applications nor will the changes in a namespace
provider's activation state. Applications launched after the call to
**WSCInstallNameSpace** will see the changes. The
**WSCInstallNameSpace** function can only be called by a user logged
on as a member of the Administrators group. If
**WSCInstallNameSpace** is called by a user that is not a member of
the Administrators group, the function call will fail. For computers
running on Windows Vista or Windows Server 2008, this function can
also fail because of user account control (UAC). If an application
that contains this function is executed by a user logged on as a
member of the Administrators group other than the built-in
Administrator, this call will fail unless the application has been
marked in the manifest file with a **requestedExecutionLevel** set to
**requireAdministrator**. If the application on Windows Vista or
Windows Server 2008 lacks this manifest file, a user logged on as a
member of the Administrators group other than the built-in
Administrator must then be executing the application in an enhanced
shell as the built-in Administrator (RunAs administrator) for this
function to succeed.


%index
WSCInstallNameSpaceEx
Installs a namespace provider. (WSCInstallNameSpaceEx)
%group
Win32 ws2_32
%prm
lpszIdentifier, lpszPathName, dwNameSpace, dwVersion, lpProviderId, lpProviderSpecific
lpszIdentifier : [wstr] A pointer to a string that identifies the provider associated with the globally unique identifier (GUID) passed in the lpProviderId parameter.
lpszPathName : [wstr] A pointer to a Unicode string that contains the load path to the provider DLL. This string observes the usual rules for path resolution and can contain embedded environment strings (such as %SystemRoot%). Such environment strings are expanded when the Ws2_32.dll must subsequently load the provider DLL on behalf of an application. After any embedded environment strings are expanded, the Ws2_32.dll passes the resulting string to the LoadLibrary function which loads the provider into memory. For more information, see **LoadLibrary**.
dwNameSpace : [int] The namespace supported by this provider.
dwVersion : [int] The version number of the provider.
lpProviderId : [var] A pointer to a GUID  for the provider. This GUID should be generated by Uuidgen.exe.
lpProviderSpecific : [var] A provider-specific data blob associated with namespace entry.
%inst
Installs a namespace provider. (WSCInstallNameSpaceEx)

[戻り値]
If no error occurs, the **WSCInstallNameSpaceEx** function returns
**NO_ERROR** (zero). Otherwise, it returns **SOCKET_ERROR** if the
function fails, and you must retrieve the appropriate error code
using the WSAGetLastError function.
This doc was truncated.

[備考]
The namespace?configuration functions do not affect applications that
are already running. Newly installed name-space providers will not be
visible to applications nor will the changes in a name-space
provider's activation state. Applications launched after the call to
**WSCInstallNameSpaceEx** will see the changes. The provider-specific
data blob associated with namespace entry passed in the
lpProviderInfo parameter can be queried using the
WSAEnumNameSpaceProvidersEx function. Currently, the only namespace
provider included with Windows that uses the lpProviderInfo parameter
is the NS_EMAIL provider. The format of the buffer pointed to by the
lpProviderInfo parameter for an NS_EMAIL namespace provider is a
NAPI_PROVIDER_INSTALLATION_BLOB structure. The
**WSCInstallNameSpaceEx** function can only be called by a user
logged on as a member of the Administrators group. If
**WSCInstallNameSpaceEx** is called by a user that is not a member of
the Administrators group, the function call will fail. For computers
running on Windows Vista or Windows Server 2008, this function can
also fail because of user account control (UAC). If an application
that contains this function is executed by a user logged on as a
member of the Administrators group other than the built-in
Administrator, this call will fail unless the application has been
marked in the manifest file with a **requestedExecutionLevel** set to
**requireAdministrator**. If the application on Windows Vista or
Windows Server 2008 lacks this manifest file, a user logged on as a
member of the Administrators group other than the built-in
Administrator must then be executing the application in an enhanced
shell as the built-in Administrator (RunAs administrator) for this
function to succeed.


%index
WSCInstallProvider
Installs the specified transport provider into the system configuration database.
%group
Win32 ws2_32
%prm
lpProviderId, lpszProviderDllPath, lpProtocolInfoList, dwNumberOfEntries, lpErrno
lpProviderId : [var] A pointer to a globally unique identifier (GUID)  for the provider.
lpszProviderDllPath : [wstr] A pointer to a Unicode string that contains the load path to the provider DLL. This string observes the usual rules for path resolution and can contain embedded environment strings (such as %SystemRoot%). Such environment strings are expanded when the Ws2_32.dll must subsequently load the provider DLL on behalf of an application. After any embedded environment strings are expanded, the Ws2_32.dll passes the resulting string to the LoadLibrary function which loads the provider into memory. For more information, see **LoadLibrary**.
lpProtocolInfoList : [var] A pointer to an array of WSAProtocol_Info structures. Each structure defines a protocol, address family, and socket type supported by the provider.
dwNumberOfEntries : [int] The number of entries in the lpProtocolInfoList array.
lpErrno : [var] A pointer to the error code if the function fails.
%inst
Installs the specified transport provider into the system
configuration database.

[戻り値]
If **WSCInstallProvider** succeeds, it returns zero. Otherwise, it
returns **SOCKET_ERROR**, and a specific error code is returned in
the lpErrno parameter.
This doc was truncated.

[備考]
**WSCInstallProvider** is used to install a single transport service
provider. This routine creates the necessary common Windows Sockets 2
configuration information for the specified provider. It is
applicable to base protocols, layered protocols, and protocol chains.
If a layered service provider is being installed, then
WSCInstallProviderAndChains should be used.
**WSCInstallProviderAndChains** can install a layered protocol and
one or more protocol chains with a single function call. To
accomplish the same work using **WSCInstallProvider** would require
multiple function calls. Winsock 2 accommodates layered protocols. A
layered protocol is one that implements only higher level
communications functions while relying on an underlying transport
stack for the actual exchange of data with a remote endpoint. An
example of a layered protocol would be a security layer that adds a
protocol to the connection establishment process in order to perform
authentication and to establish a mutually agreed upon encryption
scheme. Such a security protocol would generally require the services
of an underlying reliable transport protocol such as TCP or SPX. The
term base protocol refers to a protocol such as TCP or SPX which is
capable of performing data communications with a remote endpoint. The
term layered protocol is used to describe a protocol that cannot
stand alone. A protocol chain would then be defined as one or more
layered protocols strung together and anchored by a base protocol. A
base protocol has the **ChainLen** member of the WSAProtocol_Info
structure set to **BASE_PROTOCOL** which is defined to be 1. A
layered protocol has the **ChainLen** member of the
**WSAPROTOCOL_INFO** structure set to **LAYERED_PROTOCOL** which is
defined to be zero. A protocol chain has the **ChainLen** member of
the **WSAPROTOCOL_INFO** structure set to greater than 1. The
lpProtocolInfoList parameter contains a list of protocol entries to
install. Callers of **WSCInstallProvider** are responsible for
setting up the proper protocol entries. The lpProtocolInfoList
parameter must not be **NULL**. Upon successful completion of this
call, any subsequent calls to WSAEnumProtocols or WSCEnumProtocols
will return the newly-created protocol entries. Be aware that in
Windows environments, only instances of Ws_32.dll created by calling
WSAStartup after the successful completion of **WSCInstallProvider**
will include the new entries when **WSAEnumProtocols** and
**WSCEnumProtocols** returns. **Note** The WSAEnumProtocols function
does not enumerate a layered protocol entry while WSCEnumProtocols
does.
On success, **WSCInstallProvider** will attempt to alert all
interested applications that have registered for notification of the
change by calling WSAProviderConfigChange. The **WSCInstallProvider**
function can only be called by a user logged on as a member of the
Administrators group. If **WSCInstallProvider** is called by a user
that is not a member of the Administrators group, the function call
will fail and WSANO_RECOVERY is returned in the lpErrno parameter.
For computers running Windows Vista or Windows Server 2008, this
function can also fail because of user account control (UAC). If an
application that contains this function is executed by a user logged
on as a member of the Administrators group other than the built-in
Administrator, this call will fail unless the application has been
marked in the manifest file with a **requestedExecutionLevel** set to
**requireAdministrator**. If the application on Windows Vista or
Windows Server 2008 lacks this manifest file, a user logged on as a
member of the Administrators group other than the built-in
Administrator must then be executing the application in an enhanced
shell as the built-in Administrator (**RunAs administrator**) for
this function to succeed. Any file installation or service
provider-specific configuration must be performed by the caller.


%index
WSCSetApplicationCategory
Sets the permitted layered service provider (LSP) categories associated with an application.
%group
Win32 ws2_32
%prm
Path, PathLength, Extra, ExtraLength, PermittedLspCategories, pPrevPermLspCat, lpErrno
Path : [wstr] A pointer to a Unicode string that contains the load path to the executable image for the application. This string observes the usual rules for path resolution and can contain embedded environment strings (such as %SystemRoot%).
PathLength : [int] The length, in characters, of the Path parameter. This length does not include the terminating **NULL**.
Extra : [wstr] A pointer to a Unicode string which represents the command line arguments used when starting the application specified in the Path parameter. The Extra parameter is used to distinguish between multiple, distinct instances of an application when launched with a consistent command line.  This is to support different application categorizations for different instances of Svchost.exe or Rundll32.exe. If only the Path parameter is required and no command line arguments are needed to further distinguish between instances of an application, then the Extra parameter should be set to **NULL**.
ExtraLength : [int] The length, in characters, of the Extra parameter. This length does not include the terminating **NULL**.
PermittedLspCategories : [int] A DWORD value of the LSP categories which are permitted for all instances of this application. The application is identified by the combination of the values of the Path and Extra parameters.
pPrevPermLspCat : [var] A pointer to receive the previous set of permitted LSP categories which were permitted for all instances of this application. This parameter is optional can  be **NULL**.
lpErrno : [var] A pointer to the error code if the function fails.
%inst
Sets the permitted layered service provider (LSP) categories
associated with an application.

[戻り値]
If no error occurs, **WSCSetApplicationCategory** returns
**ERROR_SUCCESS** (zero). Otherwise, it returns **SOCKET_ERROR**, and
a specific error code is returned in the lpErrno parameter.
This doc was truncated.

[備考]
**WSCSetApplicationCategory** is used to set the LSP category flags
associated with an application instance. Applications can determine
which LSP behaviors are acceptable within the application's context.
Therefore, through specifying permitted LSP categories, an
application can permit only those layered service providers which
implement acceptable behaviors to be loaded. The Extra parameter is
required when the command line is used to distinguish between
different instances of an application or service hosted within the
same executable. Each instance can have different application
categorization needs. Svchost.exe and Rundll32.exe are two examples
where the command line is required to differentiate between different
process instances. For SvcHost.exe, the **-k <svcinstance>** switch
defines the process instance. For services, using the Service Name is
not sufficient, because the Winsock Catalog is global to a given
process, and a process may host several services. If the
**WSCSetApplicationCategory** function is called on the same
application (the same fullpath, EXE name, and parameters) multiple
times, then the categories are ORed together. For example if you
categorized "c:\foo.exe -param" with LSP_SYSTEM and then called the
**WSCSetApplicationCategory** function again with LSP_REDIRECTOR, the
resulting entry for htis application contains LSP_SYSTEM |
LSP_REDIRECTOR. This behavior is designed to support a single
executable file that hosts multiple applications in a single EXE (the
Windows system services svchost.exe, for example).
Window sockets determine an application's identity and retrieves the
permitted LSP categories during the first call to WSAStartup. This
will be the set of permitted LSP categories for the duration of the
application instance. Subsequent changes to the permitted LSP
categories for a given application identity will not be picked up
until the next instance of the application. The permitted LSP
categories is not mutable during the lifetime of the application
instance. Winsock 2 accommodates layered protocols. A layered
protocol is one that implements only higher level communications
functions, while relying on an underlying transport stack for the
actual exchange of data with a remote endpoint. An example of a
layered protocol or layered service provider would be a security
layer that adds protocol to the connection establishment process in
order to perform authentication and to establish a mutually agreed
upon encryption scheme. Such a security protocol would generally
require the services of an underlying reliable transport protocol
such as TCP or SPX. The term base protocol refers to a protocol such
as TCP or SPX which is capable of performing data communications with
a remote endpoint. The term layered protocol is used to describe a
protocol that cannot stand alone. During LSP initialization, the LSP
must provide pointers to a number of Winsock SPI functions. These
functions will be called during normal processing by the layer
directly above the LSP (either another LSP or Ws2_32.dll). An LSP
that implements an installable file system (IFS) can selectively
choose to provide pointers to functions which are implemented by
itself, or pass back the pointers provided by the layer directly
below the LSP. Non-IFS LSPs, because they provide their own handles,
must implement all of the Winsock SPI functions. This is because each
SPI will require the LSP to map all of the socket handles it created
to the socket handle of the lower provider (either another LSP or the
base protocol). However, all LSPs perform their specific work by
doing extra processing on only a subset of the Winsock SPI functions.
It is possible to define LSP categories based upon the subset of SPI
functions an LSP implements and the nature of the extra processing
performed for each of those functions. By classifying LSPs, as well
as classifying applications which use Winsock sockets, it becomes
possible to selectively determine if an LSP should be involved in a
given process at runtime. On Windows Vista and later, an LSP can be
classified based on how it interacts with Windows Sockets calls and
data. An LSP category is an identifiable group of behaviors on a
subset of Winsock SPI functions. For example, an HTTP content filter
would be categorized as a data inspector (the **LSP_INSPECTOR**
category). The **LSP_INSPECTOR** category will inspect (but not
alter) parameters to data transfer SPI functions. An application can
query for the category of an LSP and choose to not load the LSP based
on the LSP category and the application's set of permitted LSP
categories.
This doc was truncated.


%index
WSCSetProviderInfo
Sets the data value for the specified information class for a layered service provider (LSP).
%group
Win32 ws2_32
%prm
lpProviderId, InfoType, Info, InfoSize, Flags, lpErrno
lpProviderId : [var] A pointer to a globally unique identifier (GUID)  for the provider.
InfoType : [int] The information class to be set for this LSP protocol entry.
Info : [var] A pointer to a buffer that contains the information class data to set for the LSP protocol entry.
InfoSize : [int] The size, in bytes, of the buffer pointed to by the Info parameter.
Flags : [int] The flags used to modify the behavior of the **WSCSetProviderInfo** function call.
lpErrno : [var] A pointer to the error code if the function fails.
%inst
Sets the data value for the specified information class for a layered
service provider (LSP).

[戻り値]
If no error occurs, **WSCSetProviderInfo** returns **ERROR_SUCCESS**
(zero). Otherwise, it returns **SOCKET_ERROR**, and a specific error
code is returned in the lpErrno parameter.
This doc was truncated.

[備考]
**WSCSetProviderInfo** is used to set the information class data for
a layered service provider. When the InfoType parameter is set to
**ProviderInfoLspCategories**, on success **WSCSetProviderInfo** sets
appropriate LSP category flags implemented by the provider based on
the value passed in the Info parameter. Winsock 2 accommodates
layered protocols. A layered protocol is one that implements only
higher level communications functions, while relying on an underlying
transport stack for the actual exchange of data with a remote
endpoint. An example of a layered protocol or layered service
provider would be a security layer that adds protocol to the
connection establishment process in order to perform authentication
and to establish a mutually agreed upon encryption scheme. Such a
security protocol would generally require the services of an
underlying reliable transport protocol such as TCP or SPX. The term
base protocol refers to a protocol such as TCP or SPX which is
capable of performing data communications with a remote endpoint. The
term layered protocol is used to describe a protocol that cannot
stand alone. A protocol chain would then be defined as one or more
layered protocols strung together and anchored by a base protocol. A
base protocol has the **ChainLen** member of the WSAPROTOCOL_INFO
structure set to **BASE_PROTOCOL** which is defined to be 1. A
layered protocol has the **ChainLen** member of the
**WSAPROTOCOL_INFO** structure set to **LAYERED_PROTOCOL** which is
defined to be zero. A protocol chain has the **ChainLen** member of
the **WSAPROTOCOL_INFO** structure set to greater than 1. During LSP
initialization, the LSP must provide pointers to a number of Winsock
SPI functions. These functions will be called during normal
processing by the layer directly above the LSP (either another LSP or
Ws2_32.dll). An LSP that implements an installable file system (IFS)
can selectively choose to provide pointers to functions which are
implemented by itself, or pass back the pointers provided by the
layer directly below the LSP. Non-IFS LSPs, because they provide
their own handles, must implement all of the Winsock SPI functions.
This is because each SPI will require the LSP to map all of the
socket handles it created to the socket handle of the lower provider
(either another LSP or the base protocol). However, all LSPs perform
their specific work by doing extra processing on only a subset of the
Winsock SPI functions. It is possible to define LSP categories based
upon the subset of SPI functions an LSP implements and the nature of
the extra processing performed for each of those functions. By
classifying LSPs, as well as classifying applications which use
Winsock sockets, it becomes possible to selectively determine if an
LSP should be involved in a given process at runtime. On Windows
Vista and later, an LSP can be classified based on how it interacts
with Windows Sockets calls and data. An LSP category is an
identifiable group of behaviors on a subset of Winsock SPI functions.
For example, an HTTP content filter would be categorized as a data
inspector (the **LSP_INSPECTOR** category). The **LSP_INSPECTOR**
category will inspect, but not alter, parameters to data transfer SPI
functions. An application can query for the category of an LSP and
choose to not load the LSP based on the LSP category and the
application's set of permitted LSP categories.
This doc was truncated.


%index
WSCUnInstallNameSpace
Uninstalls the indicated name-space provider.
%group
Win32 ws2_32
%prm
lpProviderId
lpProviderId : [var] A pointer to a globally unique identifier (GUID)  for the name-space provider to be uninstalled.
%inst
Uninstalls the indicated name-space provider.

[戻り値]
If no error occurs, **WSCUnInstallNameSpace** returns **NO_ERROR**
(zero). Otherwise, it returns **SOCKET_ERROR** if the function fails,
and you must retrieve the appropriate error code using the
WSAGetLastError function.
This doc was truncated.

[備考]
The namespace configuration functions do not affect applications that
are already running. Newly installed name-space providers will not be
visible to applications nor will the changes in a name-space
provider's activation state. Applications launched after the call to
**WSCUnInstallNameSpace** will see the changes. On success,
**WSCUnInstallNameSpace** will attempt to alert all interested
applications that have registered for notification of the change by
calling WSAProviderConfigChange. The **WSCUnInstallNameSpace**
function can only be called by a user logged on as a member of the
Administrators group. If **WSCUnInstallNameSpace** is called by a
user that is not a member of the Administrators group, the function
call will fail and **WSANO_RECOVERY** is returned in the lpErrno
parameter.
For computers running on Windows Vista or Windows Server 2008, this
function can also fail because of user account control (UAC). If an
application that contains this function is executed by a user logged
on as a member of the Administrators group other than the built-in
Administrator, this call will fail unless the application has been
marked in the manifest file with a **requestedExecutionLevel** set to
**requireAdministrator**. If the application on Windows Vista or
Windows Server 2008 lacks this manifest file, a user logged on as a
member of the Administrators group other than the built-in
Administrator must then be executing the application in an enhanced
shell as the built-in Administrator (RunAs administrator) for this
function to succeed.
The caller of this function must remove any additional files or
service provider?specific configuration information that is required
to completely uninstall the service provider.


%index
WSCUpdateProvider
Modifies the specified transport provider in the system configuration database.
%group
Win32 ws2_32
%prm
lpProviderId, lpszProviderDllPath, lpProtocolInfoList, dwNumberOfEntries, lpErrno
lpProviderId : [var] A pointer to a globally unique identifier (GUID)  for the provider.
lpszProviderDllPath : [wstr] A pointer to a Unicode string that contains the load path to the provider 64-bit DLL. This string observes the usual rules for path resolution and can contain embedded environment strings (such as %SystemRoot%). Such environment strings are expanded when the Ws2_32.dll must subsequently load the provider DLL on behalf of an application. After any embedded environment strings are expanded, the Ws2_32.dll passes the resulting string to the LoadLibrary function which loads the provider into memory. For more information, see **LoadLibrary**.
lpProtocolInfoList : [var] A pointer to an array of WSAProtocol_Info structures. Each structure specifies or modifies a protocol, address family, and socket type supported by the provider.
dwNumberOfEntries : [int] The number of entries in the lpProtocolInfoList array.
lpErrno : [var] A pointer to the error code if the function fails.
%inst
Modifies the specified transport provider in the system configuration
database.

[戻り値]
If no error occurs, **WSCUpdateProvider** returns zero. Otherwise, it
returns **SOCKET_ERROR**, and a specific error code is returned in
the lpErrno parameter.
This doc was truncated.

[備考]
The **WSCUpdateProvider** function modifies Windows Sockets 2
configuration information for the specified provider. It is
applicable to base protocols, layered protocols, and protocol chains.
Winsock 2 accommodates layered protocols. A layered protocol is one
that implements only higher level communications functions, while
relying on an underlying transport stack for the actual exchange of
data with a remote endpoint. An example of a layered protocol would
be a security layer that adds protocol to the connection
establishment process in order to perform authentication and to
establish a mutually agreed upon encryption scheme. Such a security
protocol would generally require the services of an underlying
reliable transport protocol such as TCP or SPX. The term base
protocol refers to a protocol such as TCP or SPX which is capable of
performing data communications with a remote endpoint. The term
layered protocol is used to describe a protocol that cannot stand
alone. A protocol chain would then be defined as one or more layered
protocols strung together and anchored by a base protocol. A base
protocol has the **ChainLen** member of the WSAProtocol_Info
structure set to **BASE_PROTOCOL** which is defined to be 1. A
layered protocol has the **ChainLen** member of the
**WSAPROTOCOL_INFO** structure set to **LAYERED_PROTOCOL** which is
defined to be zero. A protocol chain has the **ChainLen** member of
the **WSAPROTOCOL_INFO** structure set to greater than 1. On success,
**WSCUpdateProvider** will attempt to alert all interested
applications that have registered for notification of the change by
calling WSAProviderConfigChange. The **WSCUpdateProvider** function
can only be called by a user logged on as a member of the
Administrators group. If **WSCUpdateProvider** is called by a user
that is not a member of the Administrators group, the function call
will fail.
For computers running on Windows Vista or Windows Server 2008, this
function can also fail because of user account control (UAC). If an
application that contains this function is executed by a user logged
on as a member of the Administrators group other than the built-in
Administrator, this call will fail unless the application has been
marked in the manifest file with a **requestedExecutionLevel** set to
**requireAdministrator**. If the application on Windows Vista or
Windows Server 2008 lacks this manifest file, a user logged on as a
member of the Administrators group other than the built-in
Administrator must then be executing the application in an enhanced
shell as the built-in Administrator (RunAs administrator) for this
function to succeed. Any file installation or service
provider-specific configuration must be performed by the caller.


%index
WSCWriteNameSpaceOrder
Changes the order of available Windows Sockets (Winsock) 2 namespace providers. The order of the namespace providers determines the priority of the namespace when enumerated or queried for name resolution.
%group
Win32 ws2_32
%prm
lpProviderId, dwNumberOfEntries
lpProviderId : [var] An array of NSProviderId elements as found in the WSANAMESPACE_INFO structure.  The order of the NSProviderId elements is the new priority ordering for the namespace providers.
dwNumberOfEntries : [int] The number of elements in the NSProviderId array.
%inst
Changes the order of available Windows Sockets (Winsock) 2 namespace
providers. The order of the namespace providers determines the
priority of the namespace when enumerated or queried for name
resolution.

[戻り値]
The function returns ERROR_SUCCESS (zero) if the routine is
successful. Otherwise, it returns a specific error code.
This doc was truncated.

[備考]
Namespace providers are installed using the WSCInstallNameSpace
function. The order in which namespace providers are initially
installed governs the default order in which they are enumerated
through WSAEnumNameSpaceProviders. More importantly, this order also
governs the order in which namespace providers are considered when a
client requests name resolution. The order of namespace providers can
be changed using the WSCWriteNameSpaceOrder function. On 64-bit
platforms, the WSCWriteNameSpaceOrder32 function is provided to allow
64-bit processes to change the order of namespace providers in the
32-bit namespace provider catalog. On 64-bit platforms, namespace
providers are installed in the 32-bit namespace provider catalog
using the WSCInstallNameSpace32 function. The current namespace
provider catalog is stored in the registry under the following
registry key: HKEY_LOCAL_MACHINE\SYSTEM\Current Control
Set\Services\Winsock2\Parameters\NameSpace_Catalog5
A client request for name resolution uses the WSALookupServiceBegin,
WSALookupServiceNext, and WSALookupServiceEnd routines. The
dwNameSpace member of the WSAQUERYSET structure passed to
WSALookupServiceBegin is set to the identifier of a single namespace
(NS_DNS, for example) in which to constrain the search, or NS_ALL to
include all namespaces. If multiple namespace providers support a
specific namespace (NS_DNS, for example), then the results from all
namespace providers that match the requested dwNameSpace are returned
unless the lpNSProviderId member is set to a specific namespace
provider. The results from all namespace providers is returned if
NS_ALL is specified for the dwNameSpace member. The order that the
results are returned is dependent on the namespace provider order in
the catalog. The Windows SDK includes an application called
SpOrder.exe that allows the catalog of installed namespace providers
to be displayed. Windows Sockets 2 includes the ws2_32.dll that
exports the WSCWriteNameSpaceOrder function for reordering namespace
providers in the catalog. This interface can be imported by linking
with WS2_32.lib. For computers running on Windows XP with Service
Pack 2 (SP2) and Windows Server 2003 with Service Pack 1 (SP1) and
later, the netsh.exe winsock show catalog command will display both
the protocol and namespace providers installed on the system.
WSCWriteNameSpaceOrder can only be called by a user logged on as a
member of the Administrators group. If WSCWriteNameSpaceOrder is
called by a user that is not a member of the Administrators group,
the function call will fail and WSANO_RECOVERY is returned in the
lpErrno parameter. For computers running on Windows Vista and Windows
Vista, this function can also fail because of user account control
(UAC). If an application that contains this function is executed by a
user logged on as a member of the Administrators group other than the
Administrator, this call will fail unless the application has been
marked in the manifest file with a requestedExecutionLevel set to
requireAdministrator. If the application on Windows Vista and Windows
Vista lacks this setting in the manifest file used to build the
executable file, a user logged on as a member of the Administrators
group other than the Administrator must then be executing the
application in an enhanced shell as the Administrator (RunAs
administrator) for this function to succeed. The following list
describes scenarios in which the WSCWriteNameSpaceOrder function
could fail:
This doc was truncated.


%index
WSCWriteProviderOrder
Used to reorder the available transport providers.
%group
Win32 ws2_32
%prm
lpwdCatalogEntryId, dwNumberOfEntries
lpwdCatalogEntryId : [var] A pointer to an array of CatalogEntryId elements found in the WSAPROTOCOL_INFO structure. The order of the CatalogEntryId elements is the new priority ordering for the protocols.
dwNumberOfEntries : [int] The number of elements in the lpwdCatalogEntryId array.
%inst
Used to reorder the available transport providers.

[戻り値]
The function returns ERROR_SUCCESS (zero) if the routine is
successful. Otherwise, it returns a specific error code.
This doc was truncated.

[備考]
The order in which transport service providers are initially
installed governs the order in which they are enumerated through
WSCEnumProtocols at the service provider interface, or through
WSAEnumProtocols at the application interface. More importantly, this
order also governs the order in which protocols and service providers
are considered when a client requests creation of a socket based on
its address family, type, and protocol identifier. Windows Sockets 2
includes an application called Sporder.exe that allows the catalog of
installed protocols to be reordered interactively after protocols
have already been installed. Windows Sockets 2 also includes an
auxiliary DLL, Sporder.dll that exports this procedural interface for
reordering protocols. This interface can be imported by linking with
Sporder.lib.
The following are scenarios in which the WSCWriteProviderOrder
function could fail:
This doc was truncated.

