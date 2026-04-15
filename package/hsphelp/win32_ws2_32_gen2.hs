; ============================================================
;   ws2_32.dll ヘルプ (CsWin32 / win32metadata から自動抽出)
;   docs_ja.json に日本語訳があればそちらを使用、無ければ英語原文。
;   翻訳を追加するときは docs_ja.json を編集して再生成。
; ============================================================

%type
拡張命令
%ver
1.0
%dll
ws2_32.dll
%date
2026/04/16
%author
IronHSP / CsWin32 bridge
%url
https://github.com/inovia/IronHSP
%port
Win

%note
Win32 API の ws2_32.dll 関数群。CsWin32 + win32metadata から自動生成。
hsp3net 専用 (intptr / NSTRUCT / wstr を使用)。

%group
Win32API

%index
FreeAddrInfoW
GetAddrInfoW 関数が addrinfoW 構造体に動的に確保したアドレス情報を解放する。
%prm
pAddrInfo
pAddrInfo : [var] 解放する addrinfoW 構造体、または addrinfoW 構造体のリンクリストへのポインタ。addrinfoW 構造体内から指されている動的に確保されたすべての領域も解放される。
%inst
GetAddrInfoW 関数が addrinfoW 構造体に動的に確保したアドレス情報を解放する。

[戻り値]
この関数は値を返さない。

[備考]
FreeAddrInfoW 関数は、Unicode 版の GetAddrInfoW 関数によって動的に確保された addrinfoW
構造体を解放する。FreeAddrInfoW 関数は、まず pAddrInfo パラメータが指す最初の addrinfoW
構造体を、構造体メンバが指すバッファ類も含めて解放し、続いて addrinfoW 構造体の ai_next メンバによってリンクされている
addrinfoW 構造体を順次解放していく。FreeAddrInfoW 関数は、ai_next メンバが NULL
になるまでリンクされた構造体の解放を続ける。Winsock ヘッダファイルのマクロは、大文字小文字混在の関数名 FreeAddrInfo
と ADDRINFOT 構造体を定義している。この FreeAddrInfo 関数は、ADDRINFOT 型へのポインタを
pAddrInfo パラメータとして呼び出す必要がある。UNICODE または _UNICODE
が定義されている場合、FreeAddrInfo は Unicode 版の FreeAddrInfoW として定義され、ADDRINFOT
は addrinfoW 構造体として定義される。UNICODE または _UNICODE が定義されていない場合、FreeAddrInfo
は ANSI 版の freeaddrinfo として定義され、ADDRINFOT は addrinfo
構造体として定義される。Windows 8.1 および Windows Server 2012 R2: この関数は、Windows
8.1、Windows Server 2012 R2 以降の Windows ストアアプリでサポートされる。
> [!NOTE] > ws2tcpip.h ヘッダは、UNICODE プリプロセッサ定数の定義に基づいて本関数の ANSI 版と
Unicode 版を自動的に選択するエイリアスとして FreeAddrInfo
を定義している。エンコーディング中立なエイリアスとエンコーディング中立でないコードを混在させると、コンパイルエラーや実行時エラーを招く不整合が発生しうる。詳しくは
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
FreeAddrInfoEx
FreeAddrInfoEx 関数 (ws2tcpip.h) は、GetAddrInfoEx 関数が addrinfoex 構造体に動的に確保したアドレス情報を解放する。
%prm
pAddrInfoEx
pAddrInfoEx : [var] 解放する addrinfoex 構造体、または addrinfoex 構造体のリンクリストへのポインタ。addrinfoex 構造体内から指されている動的に確保されたすべての領域も解放される。
%inst
FreeAddrInfoEx 関数 (ws2tcpip.h) は、GetAddrInfoEx 関数が addrinfoex
構造体に動的に確保したアドレス情報を解放する。

[戻り値]
この関数は値を返さない。

[備考]
FreeAddrInfoEx 関数は、GetAddrInfoEx 関数によって動的に確保された addrinfoex
構造体を解放する。FreeAddrInfoEx 関数は、まず pAddrInfo パラメータが指す最初の addrinfoex
構造体を、構造体メンバが指すバッファ類も含めて解放し、続いて addrinfoex 構造体の ai_next
メンバによってリンクされている addrinfoex 構造体を順次解放していく。FreeAddrInfoEx 関数は、ai_next
メンバが NULL になるまでリンクされた構造体の解放を続ける。UNICODE または _UNICODE
が定義されている場合、FreeAddrInfoEx は Unicode 版の FreeAddrInfoExW
として定義され、ADDRINFOEX は addrinfoexW 構造体として定義される。UNICODE または _UNICODE
が定義されていない場合、FreeAddrInfoEx は ANSI 版の FreeAddrInfoExA
として定義され、ADDRINFOEX は addrinfoexA 構造体として定義される。Windows 8.1 および Windows
Server 2012 R2: FreeAddrInfoExW 関数は、Windows 8.1、Windows Server 2012
R2 以降の Windows ストアアプリでサポートされる。


%index
GetAddrInfoW
Unicode のホスト名からアドレスへのプロトコル非依存な変換を提供する。
%prm
pNodeName, pServiceName, pHints, ppResult
pNodeName : [wstr] ホスト (ノード) 名または数値形式のホストアドレス文字列を格納した NULL 終端 Unicode 文字列へのポインタ。インターネットプロトコルの場合、数値形式のホストアドレス文字列はドット区切り十進表記の IPv4 アドレスまたは 16 進表記の IPv6 アドレスである。
pServiceName : [wstr] サービス名、または文字列として表現されたポート番号のいずれかを格納した NULL 終端 Unicode 文字列へのポインタ。サービス名はポート番号の文字列エイリアスである。たとえば "http" は、HTTP プロトコルで Web サーバが既定で使用するポートとして IETF が定めたポート 80 のエイリアスである。ポート番号を指定しない場合の pServiceName パラメータとして使用可能な値は、次のファイルに列挙されている: %WINDIR%\system32\drivers\etc\services
pHints : [var] 呼び出し元がサポートするソケットの種類についてのヒントを与える addrinfoW 構造体へのポインタ。pHints パラメータが指す addrinfoW 構造体の ai_addrlen、ai_canonname、ai_addr、ai_next メンバはゼロまたは NULL でなければならない。そうでない場合、GetAddrInfoEx 関数は WSANO_RECOVERY で失敗する。詳細は備考を参照。
ppResult : [var] ホストに関する応答情報を含む 1 つ以上の addrinfoW 構造体のリンクリストへのポインタ。
%inst
Unicode のホスト名からアドレスへのプロトコル非依存な変換を提供する。

[戻り値]
成功時はゼロを返す。失敗時は Windows Sockets エラーコード一覧にある 0 以外の Windows Sockets
エラーコードを返す。GetAddrInfoW 関数が返す 0 以外のエラーコードのほとんどは、IETF
の勧告で概説されているエラーの集合にマップされる。Winsock プログラマにとって馴染みがあり包括的なエラー情報を提供するため、WSA
エラーコードの使用を推奨する。
（以下省略）

[備考]
GetAddrInfoW 関数は、ホスト名からアドレスへのプロトコル非依存な変換を提供する関数の Unicode 版である。ANSI 版は
getaddrinfo である。GetAddrInfoW 関数は NS_DNS
名前空間に対する結果を返す。複数のネームスペースプロバイダから情報が返された場合、GetAddrInfoW
関数はそれらの応答をすべて集約する。IPv6 および IPv4 プロトコルで NS_DNS 名前空間を使う場合、名前解決は
DNS、ローカルの hosts ファイル、その他の命名メカニズムによって行える。Winsock
ヘッダファイルのマクロは、大文字小文字混在の関数名 GetAddrInfo と ADDRINFOT 構造体を定義している。この
GetAddrInfo 関数は、pNodeName および pServiceName パラメータに TCHAR
型のポインタを、pHints および ppResult パラメータに ADDRINFOT 型のポインタを指定して呼び出す。UNICODE
または _UNICODE が定義されている場合、GetAddrInfo は Unicode 版の GetAddrInfoW
として定義され、ADDRINFOT は addrinfoW 構造体として定義される。UNICODE または _UNICODE
が定義されていない場合、GetAddrInfo は ANSI 版の getaddrinfo として定義され、ADDRINFOT は
addrinfo 構造体として定義される。pNodeName または pServiceName パラメータの少なくとも一方は NULL
終端 Unicode 文字列を指していなければならない。通常は両方を指定する。成功時には addrinfoW 構造体のリンクリストが
ppResult パラメータに返される。リストは返された各 addrinfoW 構造体の ai_next
メンバが指すポインタをたどり、NULL ポインタに出会うまで処理できる。返された各 addrinfoW 構造体の
ai_family、ai_socktype、ai_protocol メンバは、socket または WSASocket
関数呼び出しのそれぞれの引数に対応する。また、返された各 addrinfoW 構造体の ai_addr
メンバは、内容が埋められたソケットアドレス構造体を指し、その長さは ai_addrlen メンバで指定される。pNodeName
パラメータがコンピュータ名を指している場合、送信元アドレスとして使用可能な当該コンピュータの永続アドレスがすべて返される。pNodeName
パラメータが "localhost"
と等しい文字列を指している場合、ローカルコンピュータ上のすべてのループバックアドレスが返される。pNodeName
パラメータが空文字列を含む場合、ローカルコンピュータに登録済みのすべてのアドレスが返される。Windows Server 2003 以降で
pNodeName パラメータが "..localmachine"
と等しい文字列を指している場合、ローカルコンピュータに登録済みのすべてのアドレスが返される。pNodeName
パラメータがクラスタ仮想サーバ名を参照している場合、仮想サーバアドレスのみが返される。
呼び出し元は、pHints パラメータが指す addrinfoW 構造体を通じて、サポートするソケットの種類に関するヒントを
GetAddrInfoW 関数に渡せる。pHints パラメータを使う場合、それに関連付けられた addrinfoW
構造体には次の規則が適用される。
（以下省略）


%index
GetAddrInfoExW
リクエストを処理すべきネームスペースプロバイダを特定するための追加パラメータを持つ、プロトコル非依存な名前解決を提供する。(Unicode)
%prm
pName, pServiceName, dwNameSpace, lpNspId, hints, ppResult, timeout, lpOverlapped, lpCompletionRoutine, lpHandle
pName : [wstr] ホスト (ノード) 名または数値形式のホストアドレス文字列を格納した NULL 終端文字列へのポインタ。インターネットプロトコルの場合、数値形式のホストアドレス文字列はドット区切り十進表記の IPv4 アドレスまたは 16 進表記の IPv6 アドレスである。
pServiceName : [wstr] サービス名、または文字列として表現されたポート番号のいずれかを格納した NULL 終端文字列へのオプションのポインタ。サービス名はポート番号の文字列エイリアスである。たとえば "http" は、HTTP プロトコルで Web サーバが既定で使用するポートとして IETF が定めたポート 80 のエイリアスである。ポート番号を指定しない場合の pServiceName パラメータとして使用可能な値は、次のファイルに列挙されている: %WINDIR%\system32\drivers\etc\services
dwNameSpace : [int] 問い合わせ対象のネームスペースプロバイダを決定するオプションの名前空間識別子。特定の名前空間識別子を渡すと、指定した名前空間をサポートするネームスペースプロバイダのみが問い合わせ対象となる。NS_ALL を指定するとインストール済みかつアクティブなすべてのネームスペースプロバイダが問い合わせ対象となる。
lpNspId : [var] NS_DNS のような単一の名前空間の下に複数のネームスペースプロバイダが登録されている場合に、問い合わせ対象の特定ネームスペースプロバイダを示すオプションの GUID へのポインタ。特定のネームスペースプロバイダの GUID を渡すと、指定したネームスペースプロバイダのみが問い合わせ対象となる。ネームスペースプロバイダの GUID を取得するには WSAEnumNameSpaceProviders 関数を呼び出せばよい。
hints : [var] 呼び出し元がサポートするソケットの種類についてのヒントを与える addrinfoex 構造体へのポインタ。pHints パラメータが指す addrinfoex 構造体の ai_addrlen、ai_canonname、ai_addr、ai_next メンバはゼロまたは NULL でなければならない。そうでない場合、GetAddrInfoEx 関数は WSANO_RECOVERY で失敗する。詳細は備考を参照。
ppResult : [var] ホストに関する応答情報を含む 1 つ以上の addrinfoex 構造体のリンクリストへのポインタ。
timeout : [var] ネームスペースプロバイダからの応答を待ってから呼び出しを中止するまでの時間 (ミリ秒) を示すオプションのパラメータ。このパラメータは、GetAddrInfoEx 関数を呼び出す前にソース内で UNICODE または _UNICODE マクロが定義されている場合のみサポートされる。そうでない場合、タイムアウトオプションがサポートされないため、このパラメータは予約されており NULL を設定しなければならない。
lpOverlapped : [var] 非同期操作に使われる overlapped 構造体へのオプションのポインタ。このパラメータは、GetAddrInfoEx 関数を呼び出す前にソース内で UNICODE または _UNICODE マクロが定義されている場合のみサポートされる。Windows 8 および Windows Server 2012 においては、lpCompletionRoutine パラメータが指定されていない場合、OVERLAPPED 構造体の hEvent メンバには非同期呼び出しの完了時に通知を受け取る手動リセットイベントを設定する必要がある。完了ルーチンを指定している場合は hEvent メンバを NULL にしなければならない。hEvent で指定したイベントがセットされたら、GetAddrInfoExOverlappedResult 関数を呼び出して操作結果を取得できる。Windows 8 および Windows Server 2012 において、UNICODE または _UNICODE マクロが定義されていない場合、このパラメータは現在予約されており NULL を設定しなければならない。Windows 7 および Windows Server 2008 R2 以前では非同期操作をサポートしないため、このパラメータは予約されており NULL を設定しなければならない。
lpCompletionRoutine : [int] 型: \_In_opt\_ [**LPWSAOVERLAPPED_COMPLETION_ROUTINE**](../winsock2/nc-winsock2-lpwsaoverlapped_completion_routine.md) 非同期操作の正常完了時に呼び出される関数へのオプションのポインタ。このパラメータは、GetAddrInfoEx 関数を呼び出す前にソース内で UNICODE または _UNICODE マクロが定義されている場合のみサポートされる。Windows 8 および Windows Server 2012 においては、このパラメータを指定する場合、以下のシグネチャを持つ関数へのポインタでなければならない。
lpHandle : [intptr] 未定。
%inst

リクエストを処理すべきネームスペースプロバイダを特定するための追加パラメータを持つ、プロトコル非依存な名前解決を提供する。(Unicode)

[戻り値]
成功時、GetAddrInfoEx は NO_ERROR (0) を返す。失敗時は Windows Sockets エラーコード一覧にある
0 以外の Windows Sockets エラーコードを返す。GetAddrInfoEx 関数が返す 0
以外のエラーコードのほとんどは、IETF の勧告で概説されているエラーの集合にマップされる。次の表は、これらのエラーコードとそれに対応する
WSA エラーを示す。Winsock プログラマにとって馴染みがあり包括的なエラー情報を提供するため、WSA
エラーコードの使用を推奨する。
（以下省略）

[備考]
GetAddrInfoEx
関数は、ホスト名からアドレスへ、サービス名からポート番号へのプロトコル非依存な変換を提供する。GetAddrInfoEx 関数は
getaddrinfo 関数および GetAddrInfoW 関数の拡張版である。GetAddrInfoEx
関数では問い合わせを解決するネームスペースプロバイダを指定できる。GetAddrInfoEx
関数は、特定のネームスペースプロバイダが指定されていない限り、複数のネームスペースプロバイダからの結果を集約して返す。IPv6 および
IPv4 プロトコルでは、名前解決は DNS (Domain Name System)、ローカルの hosts ファイル、メールプロバイダ
(NS_EMAIL 名前空間)、その他の命名メカニズムによって行える。UNICODE または _UNICODE
が定義されている場合、GetAddrInfoEx は Unicode 版の GetAddrInfoExW
として定義される。文字列パラメータは PWSTR データ型として定義され、ADDRINFOEXW 構造体が使われる。Windows 8
および Windows Server 2012
では、timeout、lpOverlapped、lpCompletionRoutine、lpNameHandle パラメータを使って
GetAddrInfoEx 関数を非同期で完了させる呼び出しを行える。UNICODE または _UNICODE
が定義されていない場合、GetAddrInfoEx は ANSI 版の GetAddrInfoExA として定義される。文字列パラメータは
PCSTR データ型となり、ADDRINFOEXA
構造体が使われる。timeout、lpOverlapped、lpCompletionRoutine、lpNameHandle パラメータは
NULL に設定しなければならない。pName または pServiceName パラメータの少なくとも一方は NULL
終端文字列を指していなければならない。通常は両方を指定する。成功時には addrinfoex 構造体のリンクリストが ppResult
パラメータに返される。リストは返された各 addrinfoex 構造体の ai_next メンバが指すポインタをたどり、NULL
ポインタに出会うまで処理できる。返された各 addrinfoex 構造体の
ai_family、ai_socktype、ai_protocol メンバは、socket または WSASocket
関数呼び出しのそれぞれの引数に対応する。また、返された各 addrinfoex 構造体の ai_addr
メンバは、内容が埋められたソケットアドレス構造体を指し、その長さは ai_addrlen メンバで指定される。pName
パラメータがコンピュータ名を指している場合、送信元アドレスとして使用可能な当該コンピュータの永続アドレスがすべて返される。Windows
Vista 以降では、これらのアドレスには GetUnicastIpAddressTable または
GetUnicastIpAddressEntry 関数が返す、MIB_UNICASTIPADDRESS_ROW 構造体の
SkipAsSource メンバが false に設定されているユニキャスト IP アドレスすべてが含まれる。pName パラメータが
"localhost" と等しい文字列を指している場合、ローカルコンピュータ上のすべてのループバックアドレスが返される。pName
パラメータが空文字列を含む場合、ローカルコンピュータに登録済みのすべてのアドレスが返される。Windows Server 2003 以降で
pName パラメータが "..localmachine"
と等しい文字列を指している場合、ローカルコンピュータに登録済みのすべてのアドレスが返される。pName
パラメータがクラスタ仮想サーバ名を参照している場合、仮想サーバアドレスのみが返される。Windows Vista
以降では、これらのアドレスには GetUnicastIpAddressTable または GetUnicastIpAddressEntry
関数が返す、MIB_UNICASTIPADDRESS_ROW 構造体の SkipAsSource メンバが true
に設定されているユニキャスト IP アドレスすべてが含まれる。クラスタリングの詳細は Windows Clustering
を参照。Windows 7 SP1 および Windows Server 2008 R2 SP1 では、Netsh.exe での IP
アドレスの SkipAsSource 属性設定がサポートされ、MIB_UNICASTIPADDRESS_ROW 構造体の
SkipAsSource メンバが false の場合は当該 IP アドレスが DNS に登録され、true
の場合は登録されないように動作が変更されている。Windows 7 および Windows Server 2008 R2
にも同様の動作変更を行うホットフィックスが用意されている。詳しくは Knowledge Base (KB) 2386184
を参照。Windows Vista SP2 および Windows Server 2008 SP2
にも同様のホットフィックスが用意されている。
呼び出し元は、pHints パラメータが指す addrinfoex 構造体を通じて、サポートするソケットの種類に関するヒントを
GetAddrInfoEx 関数に渡せる。pHints パラメータを使う場合、それに関連付けられた addrinfoex
構造体には次の規則が適用される。
（以下省略）


%index
GetAddrInfoExCancel
GetAddrInfoEx 関数による非同期操作をキャンセルする。
%prm
lpHandle
lpHandle : [intptr] キャンセルする非同期操作のハンドル。これは GetAddrInfoEx 関数が lpNameHandle パラメータで返したハンドルである。
%inst
GetAddrInfoEx 関数による非同期操作をキャンセルする。

[戻り値]
成功時、GetAddrInfoExCancel は NO_ERROR (0) を返す。失敗時は Windows Sockets
エラーコード一覧にある 0 以外の Windows Sockets エラーコードを返す。

[備考]
GetAddrInfoExCancel 関数は、非同期の GetAddrInfoEx
操作をキャンセルする。その結果、ユーザーの完了通知機構 (コールバックまたはイベント)
が直ちに呼び出される。結果は返されず、GetAddrInfoEx の非同期操作に対するエラーコードは WSA_E_CANCELLED
に設定される。GetAddrInfoEx
要求が既に完了またはタイムアウトしているか、ハンドルが無効である場合、GetAddrInfoExCancel 関数は
WSA_INVALID_HANDLE を返す。
内部処理の多く (たとえばレガシーなネームサービスプロバイダ)
は同期的なので、これらの処理は実際にはキャンセルされない。これらの処理は実行を継続しリソースを消費し続ける。最後に残っていたネームサービスプロバイダの要求が完了した時点でリソースが解放される。Windows
8.1 および Windows Server 2012 R2: この関数は、Windows 8.1、Windows Server 2012
R2 以降の Windows ストアアプリでサポートされる。


%index
GetAddrInfoExOverlappedResult
GetAddrInfoEx 関数の非同期操作で使用される OVERLAPPED 構造体の戻りコードを取得する。
%prm
lpOverlapped
lpOverlapped : [var] 非同期操作用の OVERLAPPED 構造体へのポインタ。
%inst
GetAddrInfoEx 関数の非同期操作で使用される OVERLAPPED 構造体の戻りコードを取得する。

[戻り値]
成功時、GetAddrInfoExOverlappedResult 関数は NO_ERROR (0)
を返す。内部操作がまだ完了していない場合、GetAddrInfoExOverlappedResult 関数は WSAEINPROGRESS
を返す。失敗時は WSAEINVAL を返す。

[備考]
GetAddrInfoExOverlappedResult 関数は、非同期操作のために GetAddrInfoEx
関数と共に使用される。GetAddrInfoExOverlappedResult 関数が WSAEINVAL
を返した場合、エラーを返したのが GetAddrInfoExOverlappedResult
関数自身か非同期操作かを区別する唯一の方法は、lpOverlapped パラメータが NULL
でないことを確認することである。lpOverlapped パラメータが NULL
だった場合は、GetAddrInfoExOverlappedResult 関数に NULL
ポインタが渡されて失敗したことを意味する。Windows 8.1 および Windows Server 2012 R2:
この関数は、Windows 8.1、Windows Server 2012 R2 以降の Windows ストアアプリでサポートされる。


%index
GetHostNameW
GetHostNameW 関数は、ローカルコンピュータの標準ホスト名を Unicode 文字列として取得する。
%prm
name, namelen
name : [wstr] ローカルホスト名を NULL 終端 Unicode 文字列として受け取るバッファへのポインタ。
namelen : [int] name パラメータが指すバッファの長さ (ワイド文字数)。
%inst
GetHostNameW 関数は、ローカルコンピュータの標準ホスト名を Unicode 文字列として取得する。

[戻り値]
エラーがない場合、GetHostNameW はゼロを返す。そうでない場合は SOCKET_ERROR
を返し、WSAGetLastError を呼び出すことで特定のエラーコードを取得できる。
（以下省略）

[備考]
GetHostNameW 関数は、name パラメータで指定されたバッファにローカルホスト名を Unicode (UTF-16)
で返す。ホスト名は NULL 終端 Unicode 文字列として返される。ホスト名の形式は Windows Sockets
プロバイダに依存し、単純なホスト名の場合も完全修飾ドメイン名 (FQDN) の場合もある。ただし、返される名前は GetAddrInfoW
で正常に解析できることが保証されている。インターネットの普及により、ASCII
文字では表現できない言語のインターネットホスト名を識別する必要性が高まっている。非 ASCII 文字 (Unicode) を特殊な
ASCII 文字列 (Punycode) として表現することを可能にする識別子は、国際化ドメイン名 (IDN) として知られている。IDN
を標準的に扱う仕組みは IDNA (Internationalizing Domain Names in Applications)
と呼ばれる。GetHostNameW 関数はローカルホスト名を Punycode と Unicode
間で変換しない。GetAddrInfoW 関数は IDN の解析サポートを提供し、Punycode/IDN
のエンコードと変換を行う。Windows Server 2012 のクラスタリソース上で GetHostNameW
関数を使用し、_CLUSTER_NETWORK_NAME_
環境変数が定義されている場合、その値が実際のホスト名より優先されて返される。クラスタリソース上では、_CLUSTER_NETWORK_NAME_
環境変数にクラスタの名前が格納されている。GetHostNameW 関数は、Svgguid.h ヘッダファイルに定義されている
SVCID_HOSTNAME GUID
を用いてネームスペースプロバイダに問い合わせてローカルホスト名を決定する。どのネームスペースプロバイダも応答しない場合、GetHostNameW
関数はローカルコンピュータの NetBIOS 名を Unicode で返す。name パラメータが指すバッファに返される文字列の最大長
(ワイド文字数) はネームスペースプロバイダに依存するが、256 ワイド文字以下でなければならない。そのため、name パラメータに
256 ワイド文字のバッファを渡し、namelen パラメータを 256 に設定すれば、バッファサイズは常に十分である。
注 ローカルホスト名が設定されていない場合でも、GetHostNameW は成功し、GetAddrInfoW
で解決可能なトークンホスト名を返さなければならない。
Windows Phone 8: この関数は Windows Phone 8 以降の Windows Phone
ストアアプリでサポートされる。Windows 8.1 および Windows Server 2012 R2: この関数は、Windows
8.1、Windows Server 2012 R2 以降の Windows ストアアプリでサポートされる。


%index
GetNameInfoW
アドレスから Unicode ホスト名への、またポート番号から Unicode サービス名への、プロトコル非依存な名前解決を提供する。
%prm
pSockaddr, SockaddrLength, pNodeBuffer, NodeBufferSize, pServiceBuffer, ServiceBufferSize, Flags
pSockaddr : [var] ソケットの IP アドレスとポート番号を含むソケットアドレス構造体へのポインタ。IPv4 の場合、pSockaddr パラメータは sockaddr_in 構造体を指す。IPv6 の場合、pSockaddr パラメータは sockaddr_in6 構造体を指す。
SockaddrLength : [int] pSockaddr パラメータが指す構造体の長さ (バイト単位)。
pNodeBuffer : [wstr] ホスト名を格納する Unicode 文字列へのポインタ。成功時には既定で FQDN としての Unicode ホスト名が返される。pNodeBuffer パラメータが NULL の場合、呼び出し元がホスト名文字列を必要としていないことを意味する。
NodeBufferSize : [int] pNodeBuffer パラメータが指すバッファの WCHAR 文字数。呼び出し元は、終端の NULL 文字を含めて Unicode ホスト名を格納するのに十分な大きさのバッファを用意しなければならない。
pServiceBuffer : [wstr] サービス名を格納する Unicode 文字列へのポインタ。成功時には、ポート番号に関連付けられたサービス名を表す Unicode 文字列へのポインタが返される。pServiceBuffer パラメータが NULL の場合、呼び出し元がサービス名文字列を必要としていないことを意味する。
ServiceBufferSize : [int] pServiceBuffer パラメータが指すバッファの WCHAR 文字数。呼び出し元は、終端の NULL 文字を含めて Unicode サービス名を格納するのに十分な大きさのバッファを用意しなければならない。
Flags : [int] GetNameInfoW 関数の処理をカスタマイズするために使う値。備考セクションを参照。
%inst
アドレスから Unicode ホスト名への、またポート番号から Unicode サービス名への、プロトコル非依存な名前解決を提供する。

[戻り値]
成功時、GetNameInfoW はゼロを返す。0 以外の戻り値は失敗を示し、WSAGetLastError
を呼び出すことで特定のエラーコードを取得できる。GetNameInfoW 関数が返す 0 以外のエラーコードは、IETF
の勧告で概説されているエラーの集合にもマップされる。次の表は、これらのエラーコードとそれに対応する WSA エラーを示す。Winsock
プログラマにとって馴染みがあり包括的なエラー情報を提供するため、WSA エラーコードの使用を推奨する。
（以下省略）

[備考]
GetNameInfoW 関数は、プロトコル非依存な名前解決を提供する関数の Unicode 版である。GetNameInfoW
関数は、ソケットアドレス構造体の内容をノード名やサービス名に変換するために使用される。IPv6 および IPv4
プロトコルでは、名前解決は DNS、ローカルの hosts ファイル、その他の命名メカニズムによって行える。この関数は、IPv4 または
IPv6 アドレスのホスト名を調べる逆引き DNS
ルックアップや、ポート番号のサービス名を調べるために使用できる。GetNameInfoW 関数は、SOCKADDR 構造体に含まれる IP
アドレスやポート番号を Unicode 文字列に変換するためにも使用できる。また、ホスト名から IP
アドレスを調べるためにも使える。この関数の ANSI 版は getnameinfo である。Winsock
ヘッダファイルのマクロは、アプリケーションが Windows XP SP2 以降 (_WIN32_WINNT >= 0x0502)
を対象としている場合に使える、大文字小文字混在の関数名 GetNameInfo を定義する。この GetNameInfo
関数は、pNodeBuffer および pServiceBuffer パラメータに TCHAR
型のポインタを指定して呼び出す。UNICODE または _UNICODE が定義されている場合、GetNameInfo は Unicode
版として定義され、host および serv パラメータに char 型へのポインタを指定して GetNameInfoW
が呼び出される。UNICODE または _UNICODE が定義されていない場合、GetNameInfo は ANSI
版として定義され、pNodeBuffer および pServiceBuffer パラメータに PWCHAR 型へのポインタを指定して
getnameinfo が呼び出される。pNodeBuffer および pServiceBuffer
パラメータのバッファ要件を簡単に決められるよう、Ws2tcpip.h
ヘッダファイルでは最大ホスト名長と最大サービス名長の値が定義されている。
（以下省略）


%index
InetNtopW
InetNtop 関数は、IPv4 または IPv6 のインターネットネットワークアドレスをインターネット標準形式の文字列に変換する。この関数の ANSI 版は inet_ntop である。(InetNtopW)
%prm
Family, pAddr, pStringBuf, StringBufSize
Family : [int] アドレスファミリ。アドレスファミリとして指定可能な値は Ws2def.h ヘッダファイルに定義されている。なお、Ws2def.h ヘッダファイルは Winsock2.h に自動的にインクルードされるため、直接使用すべきではない。AF_ アドレスファミリ定数と PF_ プロトコルファミリ定数の値は同一 (たとえば AF_INET と PF_INET) なので、どちらの定数を使ってもよい。現在サポートされている値は AF_INET と AF_INET6 である。
pAddr : [intptr] 文字列に変換する、ネットワークバイトオーダーの IP アドレスへのポインタ。Family パラメータが AF_INET の場合、pAddr パラメータは変換対象の IPv4 アドレスを持つ IN_ADDR 構造体を指さなければならない。Family パラメータが AF_INET6 の場合、pAddr パラメータは変換対象の IPv6 アドレスを持つ IN6_ADDR 構造体を指さなければならない。
pStringBuf : [wstr] IP アドレスの NULL 終端文字列表現を格納するバッファへのポインタ。IPv4 アドレスの場合、このバッファは少なくとも 16 文字分の大きさが必要である。IPv6 アドレスの場合、このバッファは少なくとも 46 文字分の大きさが必要である。
StringBufSize : [int] 入力時、pStringBuf パラメータが指すバッファの長さ (文字数)。
%inst
InetNtop 関数は、IPv4 または IPv6
のインターネットネットワークアドレスをインターネット標準形式の文字列に変換する。この関数の ANSI 版は inet_ntop
である。(InetNtopW)

[戻り値]
エラーがない場合、InetNtop 関数は IP アドレスの標準形式の文字列表現を格納したバッファへのポインタを返す。そうでない場合は
NULL が返され、WSAGetLastError
を呼び出すことで拡張エラー情報を取得できる。関数が失敗した場合、WSAGetLastError
が返す拡張エラーコードは次のいずれかになる。
（以下省略）

[備考]
InetNtop 関数は Windows Vista 以降でサポートされる。InetNtop
関数は、プロトコル非依存なアドレスから文字列への変換を提供する。InetNtop 関数は、pAddr
パラメータで指定されたインターネットアドレス構造体を取り、その IP アドレスを表す NULL 終端文字列を返す。inet_ntoa
関数が IPv4 アドレスのみを扱うのに対し、InetNtop 関数は IPv4 と IPv6 のどちらのアドレスも扱える。この関数の
ANSI 版は RFC 2553 で定義された inet_ntop である。詳しくは IETF の Web サイトにある RFC 2553
を参照。InetNtop 関数は IP アドレスから文字列への変換を行うのに Windows Sockets DLL
をロードする必要がない。Family パラメータに AF_INET を指定した場合、pAddr パラメータは変換対象の IPv4
アドレスを持つ IN_ADDR 構造体を指さなければならない。pStringBuf
パラメータが指すバッファに返されるアドレス文字列は、"192.168.16.0" のようなドット区切り十進表記である。Family
パラメータに AF_INET6 を指定した場合、pAddr パラメータは変換対象の IPv6 アドレスを持つ IN6_ADDR
構造体を指さなければならない。pStringBuf
パラメータが指すバッファに返されるアドレス文字列は、インターネット標準形式である。基本的な文字列表現は、コロンで区切られた 8 個の 16
進数から成る。連続するゼロの列はダブルコロンに置き換えられる。IPv6 アドレスの文字列表現には、ダブルコロンは 1
つしか現れてはならない。アドレスが IPv4 互換アドレスの場合、末尾 32 ビットは IPv4
形式のドット区切り表記で表現される。pStringBuf パラメータが指すバッファの長さが IP
アドレスの文字列表現を受け取るのに十分でない場合、InetNtop は ERROR_INVALID_PARAMETER
を返す。UNICODE または _UNICODE が定義されている場合、InetNtop は Unicode 版の InetNtopW
として定義される。pStringBuf パラメータは PSTR データ型として定義される。UNICODE または _UNICODE
が定義されていない場合、InetNtop は ANSI 版の InetNtopA として定義される。この関数の ANSI 版は常に
inet_ntop としても定義される。pStringBuf パラメータは PWSTR データ型として定義される。IN_ADDR 構造体は
Inaddr.h ヘッダファイルで定義されている。IN6_ADDR 構造体は In6addr.h
ヘッダファイルで定義されている。Windows Vista 以降では、RtlIpv4AddressToString および
RtlIpv4AddressToStringEx 関数を使って、IN_ADDR 構造体として表現された IPv4
アドレスをインターネット標準のドット区切り十進表記の文字列に変換できる。Windows Vista
以降では、RtlIpv6AddressToString および RtlIpv6AddressToStringEx
関数を使って、IN6_ADDR 構造体として表現された IPv6
アドレスを文字列表現に変換できる。RtlIpv6AddressToStringEx 関数は、IPv6 アドレス、スコープ
ID、ポートを標準形式の IPv6 文字列に変換できるため、より柔軟である。Windows 8.1 および Windows Server
2012 R2: InetNtopW 関数は、Windows 8.1、Windows Server 2012 R2 以降の Windows
ストアアプリでサポートされる。


%index
InetPtonW
InetPton 関数は、標準テキスト表現形式の IPv4 または IPv6 インターネットネットワークアドレスを数値バイナリ形式に変換する。この関数の ANSI 版は inet_pton である。(InetPtonW)
%prm
Family, pszAddrString, pAddrBuf
Family : [int] アドレスファミリ。アドレスファミリとして指定可能な値は Ws2def.h ヘッダファイルに定義されている。なお、Ws2def.h ヘッダファイルは Winsock2.h に自動的にインクルードされるため、直接使用すべきではない。AF_ アドレスファミリ定数と PF_ プロトコルファミリ定数の値は同一 (たとえば AF_INET と PF_INET) なので、どちらの定数を使ってもよい。現在サポートされている値は AF_INET と AF_INET6 である。
pszAddrString : [wstr] 数値バイナリ形式に変換する IP アドレスのテキスト表現を格納した NULL 終端文字列へのポインタ。Family パラメータが AF_INET の場合、pszAddrString パラメータは標準のドット区切り十進表記による IPv4 アドレスのテキスト表現を指さなければならない。Family パラメータが AF_INET6 の場合、pszAddrString パラメータは標準表記による IPv6 アドレスのテキスト表現を指さなければならない。
pAddrBuf : [intptr] IP アドレスの数値バイナリ表現を格納するバッファへのポインタ。IP アドレスはネットワークバイトオーダーで返される。Family パラメータが AF_INET の場合、このバッファは IN_ADDR 構造体を格納できる大きさでなければならない。Family パラメータが AF_INET6 の場合、このバッファは IN6_ADDR 構造体を格納できる大きさでなければならない。
%inst
InetPton 関数は、標準テキスト表現形式の IPv4 または IPv6
インターネットネットワークアドレスを数値バイナリ形式に変換する。この関数の ANSI 版は inet_pton
である。(InetPtonW)

[戻り値]
エラーがない場合、InetPton 関数は値 1 を返し、pAddrBuf
パラメータが指すバッファにはネットワークバイトオーダーのバイナリ数値 IP アドレスが格納される。pAddrBuf パラメータが有効な
IPv4 ドット区切り十進表記文字列や有効な IPv6 アドレス文字列でない文字列を指していた場合、InetPton 関数は値 0
を返す。そうでない場合は -1 が返され、WSAGetLastError
を呼び出すことで拡張エラー情報を取得できる。関数がエラーになった場合、WSAGetLastError
が返す拡張エラーコードは次のいずれかになる。
（以下省略）

[備考]
InetPton 関数は Windows Vista 以降でサポートされる。InetPton
関数は、標準テキスト表現形式のインターネットネットワークアドレスを数値バイナリ形式に変換するプロトコル非依存な機能を提供する。InetPton
関数は、pszAddrString パラメータが指すインターネットアドレスのテキスト表現を取り、pAddrBuf パラメータに数値バイナリ
IP アドレスへのポインタを返す。inet_addr 関数が IPv4 アドレス文字列のみを扱うのに対し、InetPton 関数は
IPv4 と IPv6 のどちらのアドレス文字列も扱える。この関数の ANSI 版は RFC 2553 で定義された inet_pton
である。詳しくは IETF の Web サイトにある RFC 2553 を参照。InetPton 関数は、IP
アドレスを表すテキスト文字列を数値バイナリ IP アドレスに変換するのに Windows Sockets DLL
をロードする必要がない。Family パラメータに AF_INET を指定した場合、pszAddrString パラメータは
"192.168.16.0" のようなドット区切り十進表記の IPv4 アドレスのテキスト文字列を指さなければならない。Family
パラメータに AF_INET6 を指定した場合、pszAddrString パラメータはインターネット標準形式の IPv6
アドレスのテキスト文字列を指さなければならない。基本的な文字列表現はコロンで区切られた 8 個の 16
進数から成る。連続するゼロの列はダブルコロンに置き換えてもよい。IPv6 アドレスの文字列表現には、ダブルコロンは 1
つしか現れてはならない。アドレスが IPv4 互換アドレスの場合、末尾 32 ビットを IPv4
形式のドット区切り表記で表現してもよい。UNICODE または _UNICODE が定義されている場合、InetPton は
Unicode 版の InetPtonW として定義される。pszAddrString パラメータは PCWSTR
データ型として定義される。UNICODE または _UNICODE が定義されていない場合、InetPton は ANSI 版の
InetPtonA として定義される。この関数の ANSI 版は常に inet_pton としても定義される。pszAddrString
パラメータは PCSTR データ型として定義される。IN_ADDR 構造体は Inaddr.h
ヘッダファイルで定義されている。IN6_ADDR 構造体は In6addr.h ヘッダファイルで定義されている。Windows Vista
以降では、RtlIpv4StringToAddress および RtlIpv4StringToAddressEx
関数を使って、インターネット標準のドット区切り十進表記の IPv4 アドレステキスト表現を IN_ADDR
構造体として表現された数値バイナリアドレスに変換できる。Windows Vista 以降では、RtlIpv6StringToAddress
および RtlIpv6StringToAddressEx 関数を使って、IPv6 アドレスの文字列表現を IN6_ADDR
構造体として表現された数値バイナリ IPv6 アドレスに変換できる。RtlIpv6StringToAddressEx 関数は、スコープ
ID やポートを含む標準表記の IPv6 アドレス文字列表現も数値バイナリ形式に変換できるため、より柔軟である。Windows 8.1
および Windows Server 2012 R2: InetPtonW 関数は、Windows 8.1、Windows Server
2012 R2 以降の Windows ストアアプリでサポートされる。


%index
SetAddrInfoExW
名前、サービス名、および関連アドレスを特定のネームスペースプロバイダに登録または登録解除する。(Unicode)
%prm
pName, pServiceName, pAddresses, dwAddressCount, lpBlob, dwFlags, dwNameSpace, lpNspId, timeout, lpOverlapped, lpCompletionRoutine, lpNameHandle
pName : [wstr] アドレスを登録または登録解除する名前を格納する NULL 終端文字列へのポインタ。このパラメータの解釈はネームスペースプロバイダ固有である。
pServiceName : [wstr] 登録する名前に関連付けられたサービス名を格納する NULL 終端文字列へのオプションのポインタ。このパラメータの解釈はネームスペースプロバイダ固有である。
pAddresses : [var] ネームスペースプロバイダに登録するアドレスのオプションのリストへのポインタ。
dwAddressCount : [int] pAddresses パラメータで渡されるアドレスの数。このパラメータがゼロの場合、pName パラメータはネームスペースプロバイダから登録解除される。
lpBlob : [var] pName パラメータに関連付けられるプロバイダ固有の名前空間情報を、アドレスリストを越えて設定するために使うデータへのオプションのポインタ。pAddresses パラメータで渡せない情報は lpBlob パラメータで渡すことができる。この情報の形式はネームスペースプロバイダ固有である。
dwFlags : [int] pName および pServiceName パラメータをネームスペースプロバイダにどのように登録するかを制御するフラグのセット。この情報の解釈はネームスペースプロバイダ固有である。
dwNameSpace : [int] どのネームスペースプロバイダに情報を登録するかを決定する名前空間識別子。特定の名前空間識別子を渡すと、指定した名前空間をサポートするネームスペースプロバイダのみに情報が登録される。NS_ALL を指定するとインストール済みかつアクティブなすべてのネームスペースプロバイダに情報が登録される。
lpNspId : [var] NS_DNS のような単一の名前空間の下に複数のネームスペースプロバイダが登録されている場合に、情報を登録する特定ネームスペースプロバイダを示すオプションの GUID へのポインタ。特定のネームスペースプロバイダの GUID を渡すと、指定したネームスペースプロバイダのみに情報が登録される。ネームスペースプロバイダの GUID を取得するには WSAEnumNameSpaceProviders 関数を呼び出せばよい。
timeout : [var] ネームスペースプロバイダからの応答を待ってから呼び出しを中止するまでの時間 (ミリ秒) を示すオプションのパラメータ。タイムアウトオプションがサポートされないため、このパラメータは現在予約されており NULL を設定しなければならない。
lpOverlapped : [var] 非同期操作に使われる overlapped 構造体へのオプションのポインタ。非同期操作がサポートされないため、このパラメータは現在予約されており NULL を設定しなければならない。
lpCompletionRoutine : [int] 非同期操作の正常完了時に呼び出される関数へのオプションのポインタ。非同期操作がサポートされないため、このパラメータは現在予約されており NULL を設定しなければならない。
lpNameHandle : [intptr] 非同期操作用のオプションのポインタ。非同期操作がサポートされないため、このパラメータは現在予約されており NULL を設定しなければならない。
%inst
名前、サービス名、および関連アドレスを特定のネームスペースプロバイダに登録または登録解除する。(Unicode)

[戻り値]
成功時、SetAddrInfoEx は NO_ERROR (0) を返す。失敗時は Windows Sockets エラーコード一覧にある
0 以外の Windows Sockets エラーコードを返す。
（以下省略）

[備考]
SetAddrInfoEx 関数は、名前と 1
つ以上のアドレスをネームスペースプロバイダに登録または登録解除するプロトコル非依存な方法を提供する。Windows Vista 以降の
NS_EMAIL ネームスペースプロバイダはアドレスの登録および登録解除をサポートする。既定の
NS_DNS、NS_PNRPNAME、NS_PNRPNAME
ネームスペースプロバイダは、現時点では名前登録をサポートしない。SetAddrInfoEx 関数を dwNameSpace パラメータに
NS_ALL を指定し、かつ lpNspId パラメータを指定せずに呼び出した場合、SetAddrInfoEx
はインストール済みかつアクティブなすべての名前空間に対して名前と関連アドレスの登録または登録解除を試みる。いずれかのネームスペースプロバイダが名前の登録または登録解除に成功すれば
SetAddrInfoEx 関数は成功を返すが、どのネームスペースプロバイダが成功または失敗したかは通知されない。UNICODE または
_UNICODE が定義されている場合、SetAddrInfoEx は Unicode 版の SetAddrInfoExW
として定義される。文字列パラメータは PWSTR データ型として定義される。UNICODE または _UNICODE
が定義されていない場合、SetAddrInfoEx は ANSI 版の SetAddrInfoExA として定義される。文字列パラメータは
PCSTR
データ型となる。ネームスペースプロバイダに登録された情報は、GetAddrInfoEx、getaddrinfo、GetAddrInfoW
関数を呼び出すことで取得できる。GetAddrInfoEx 関数は getaddrinfo および GetAddrInfoW
関数の拡張版である。Windows Vista 以降で SetAddrInfoEx
がサービスから呼び出され、その操作がユーザープロセスによるサービス呼び出しの結果である場合、セキュリティとルーティングの区画を正しく適用するために、サービスはそのユーザーになりすます必要がある。
Windows 8.1 および Windows Server 2012 R2: SetAddrInfoExW 関数は、Windows
8.1、Windows Server 2012 R2 以降の Windows ストアアプリでサポートされる。
> [!NOTE] > ws2tcpip.h ヘッダは、UNICODE プリプロセッサ定数の定義に基づいて本関数の ANSI 版と
Unicode 版を自動的に選択するエイリアスとして SetAddrInfoEx
を定義している。エンコーディング中立なエイリアスとエンコーディング中立でないコードを混在させると、コンパイルエラーや実行時エラーを招く不整合が発生しうる。詳しくは
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
closesocket
closesocket 関数 (winsock.h) は、既存のソケットを閉じる。
%prm
s
s : [int] 閉じるソケットを識別する記述子。
%inst
closesocket 関数 (winsock.h) は、既存のソケットを閉じる。

[戻り値]
エラーがない場合、closesocket はゼロを返す。そうでない場合は SOCKET_ERROR
が返され、WSAGetLastError で特定のエラーコードを取得できる。
このドキュメントは省略されている。

[備考]
closesocket 関数はソケットを閉じる。s 引数に渡したソケット記述子を解放するために使う。closesocket
発行直後に、その記述子はシステムによって再利用される可能性がある。そのため、同記述子への以降の参照が WSAENOTSOCK
で失敗することを期待するのは信頼性がない。Winsock クライアントは、他の Winsock 関数呼び出しと同時に同じ s に対して
closesocket を発行してはならない。このプロセスの任意スレッドが発行した、オーバーラップソケット上の保留中オーバーラップ
send/receive 操作 (WSASend / WSASendTo / WSARecv / WSARecvFrom)
はすべてキャンセルされる。これらに対して指定されたイベント、完了ルーチン、完了ポートアクションは実行される。保留中のオーバーラップ操作は
WSA_OPERATION_ABORTED エラーステータスで失敗する。closesocket が戻った時点で未完了 I/O
操作のすべてが保証付きで完了しているとは仮定すべきではない。closesocket は保留中 I/O
のキャンセルを開始するが、それが完了することまで保証するわけではない。したがって未完了 I/O で参照されている資源
(WSAOVERLAPPED 構造体など) は、I/O が実際に完了するまでクリーンアップしてはならない。
ソケット資源をシステムに返却するため、socket の各成功呼び出しに対して対応する closesocket
呼び出しを常に行うべきである。linger 構造体は、データ送信待ちのキューがある状態で closesocket
が呼ばれたときのソケット挙動を指定する情報を保持する。linger 構造体の l_onoff
メンバは、指定時間の間ソケットを開いたままにするかを決める
このドキュメントは省略されている。


%index
WPUCompleteOverlappedRequest
WPUCompleteOverlappedRequest 関数は、オーバーラップ I/O 操作の完了通知を行う。
%prm
s, lpOverlapped, dwError, cbTransferred, lpErrno
s : [int] WPUCreateSocketHandle で生成されたサービスプロバイダソケット。
lpOverlapped : [var] 完了通知対象のオーバーラップ I/O 操作に関連付けられた WSAOVERLAPPED 構造体へのポインタ。
dwError : [int] 完了通知対象のオーバーラップ I/O 操作の完了ステータス。
cbTransferred : [int] クライアントバッファとの間で転送されたバイト数 (転送方向は、完了通知対象のオーバーラップ I/O 操作が送信・受信のどちらの性質であるかに依存する)。
lpErrno : [var] この関数の実行結果として得られるエラーコードへのポインタ。
%inst
WPUCompleteOverlappedRequest 関数は、オーバーラップ I/O 操作の完了通知を行う。

[戻り値]
エラーがない場合、**WPUCompleteOverlappedRequest** はゼロを返し、クライアントが選択した機構
(lpOverlapped が参照する WSAOVERLAPPED
構造体内のイベントのシグナリングや、ソケットに完了ポートが関連付けられている場合は完了ポートへの完了ステータスレポートのキューイング)
に従ってオーバーラップ I/O 操作の完了を通知する。そうでない場合、**WPUCompleteOverlappedRequest** は
SOCKET_ERROR を返し、具体的なエラーコードは lpErrno で取得できる。
（以下省略）

[備考]
**WPUCompleteOverlappedRequest**
関数は、クライアントが指定した完了通知機構がユーザーモード非同期プロシージャコール (APC) 以外である場合のオーバーラップ I/O
操作の完了通知を行う。この関数は WPUCreateSocketHandle
で生成されたソケットハンドルに対してのみ使用できる。**注** この関数は、"WPU"
プレフィックスを持つ他の関数とは異なり、アップコールテーブル経由ではアクセスされない。代わりに Ws2_32.dll
から直接エクスポートされる。この関数を呼び出す必要があるサービスプロバイダは WS2_32.lib とリンクするか、LoadLibrary
や GetProcAddress 等の適切な OS
関数を使って関数ポインタを取得すべきである。**WPUCompleteOverlappedRequest**
関数は、公開するソケットハンドルに対して IFS (Installable File System)
機能を直接実装していないサービスプロバイダが使用する。この関数は、完了通知がユーザーモード APC 以外であるオーバーラップ I/O
リクエストに対して完了通知を行う。**WPUCompleteOverlappedRequest** は
WPUCreateSocketHandle
で生成されたソケットハンドルに対してのみサポートされ、サービスプロバイダが直接生成したソケットにはサポートされない。クライアントが通知方法としてユーザーモード
APC を選んだ場合、サービスプロバイダは WPUQueueApc または他の適切な OS
関数を使って完了通知を行うべきである。ユーザーモード APC がクライアントから選択されていない場合、IFS
機能を直接実装していないサービスプロバイダは、クライアントが完了ポートをソケットハンドルに関連付けているかを知ることができない。したがって、完了通知方法が完了ポートへのステータスレコードキューイングであるべきか、WSAOVERLAPPED
構造体内のイベントのシグナリングであるべきかを判断できない。Windows Socket 2
アーキテクチャは、WPUCreateSocketHandle
で生成されたソケットと完了ポートとの関連付けを追跡しており、完了ポート方式かイベント方式かを正しく判断できる。**WPUCompleteOverlappedRequest**
は完了通知をキューイングする際、WSAOVERLAPPED 構造体の **InternalHigh**
メンバに転送バイト数を設定し、その後 **Internal** メンバを特殊値 WSS_OPERATION_IN_PROGRESS 以外の
OS 依存値に設定する。処理は非同期に行われる可能性があるため、**WPUCompleteOverlappedRequest**
の戻りから実際にこれらの値が見えるまでにはわずかな遅延が生じうる。ただし、**InternalHigh** 値 (バイト数) は
**Internal**
が設定される時点までに必ず設定されることが保証される。**WPUCompleteOverlappedRequest**
は、ソケットハンドルが完了ポートと関連付けられているかどうかに関わらず、記載の通り (クライアントが要求した完了通知を行う)
動作する。**WSPGetOverlappedResult との相互作用**
**WPUCompleteOverlappedRequest** の動作は、サービスプロバイダによる
WSPGetOverlappedResult の実装方法にいくつかの制約を与える。これは、WSAOVERLAPPED
構造体のうちサービスプロバイダが排他的に制御できるのは **Offset** と **OffsetHigh** の 2
メンバのみであるのに対し、**WSPGetOverlappedResult** はバイト数、フラグ、エラーの 3
つの値を構造体から取得しなければならないためである。サービスプロバイダは、**WPUCompleteOverlappedRequest**
の動作と正しく連携する限り、この要件を任意の方法で満たせる。ただし、典型的な実装は次の通りである。
- オーバーラップ処理の開始時、サービスプロバイダは **Internal** を WSS_OPERATION_IN_PROGRESS
に設定する。- I/O 操作が完了したら、プロバイダは **OffsetHigh** に Windows Socket 2
エラーコードを、**Offset** に I/O 操作で得られたフラグを設定し、転送バイト数をパラメータとして
**WPUCompleteOverlappedRequest**
を呼び出す。**WPUCompleteOverlappedRequest** は最終的に **InternalHigh**
に転送バイト数を設定し、その後 **Internal** を WSS_OPERATION_IN_PROGRESS 以外の値に設定する。-
WSPGetOverlappedResult が呼び出されたら、サービスプロバイダは **Internal** を確認する。それが
WSS_OPERATION_IN_PROGRESS ならば、プロバイダは **WSPGetOverlappedResult** の
FWAIT フラグの設定に応じて **hEvent**
メンバのイベントハンドルで待機するか、エラーを返す。進行中でない場合、または待機完了後には、プロバイダは
**InternalHigh**、**OffsetHigh**、**Offset**
の値をそれぞれ転送数、操作結果エラーコード、フラグとして返す。


%index
WSAAccept
WSAAccept 関数は、条件関数の戻り値に基づいて接続を条件付きで受理し、QoS フロー仕様を指定し、接続データの受け渡しを可能にする。
%prm
s, addr, addrlen, lpfnCondition, dwCallbackData
s : [int] listen 関数の呼び出し後に接続を待ち受けているソケットを識別するディスクリプタ。
addr : [var] 通信層から見た接続元エンティティのアドレスを受け取る sockaddr 構造体へのオプションのポインタ。addr パラメータの正確な形式は、ソケット生成時に確立されたアドレスファミリによって決まる。
addrlen : [var] addr パラメータが指す sockaddr 構造体の長さ (バイト単位) を格納する整数へのオプションのポインタ。
lpfnCondition : [int] パラメータとして渡された呼び出し元情報に基づいて受理・拒否を判定し、必要に応じてこの関数の結果パラメータ g に適切な値を設定することでソケットグループを生成または参加するかを判定する、アプリケーションが指定するオプションの条件関数のアドレス。このパラメータが NULL の場合、条件関数は呼び出されない。
dwCallbackData : [int] アプリケーションが指定した条件関数に、その dwCallbackData パラメータの値として渡し戻されるコールバックデータ。このパラメータは lpfnCondition パラメータが NULL でない場合のみ有効である。Windows Sockets はこのパラメータを解釈しない。
%inst
WSAAccept 関数は、条件関数の戻り値に基づいて接続を条件付きで受理し、QoS
フロー仕様を指定し、接続データの受け渡しを可能にする。

[戻り値]
エラーがない場合、WSAAccept は受理したソケットのディスクリプタとして SOCKET 型の値を返す。そうでない場合は
INVALID_SOCKET が返され、WSAGetLastError を呼び出すことで特定のエラーコードを取得できる。addrlen
が参照する整数には、初期値として addr が指す領域の大きさが格納されている。戻り時には、返されたアドレスの実際の長さ (バイト単位)
が格納される。
（以下省略）

[備考]
WSAAccept 関数は、ソケット s の保留中接続キューの先頭から最初の接続を取り出し、条件関数が指定されている (NULL でない)
場合はそれに照らして確認する。条件関数が CF_ACCEPT を返した場合、WSAAccept
は新しいソケットを生成する。新たに生成されたソケットは、WSAAsyncSelect や WSAEventSelect
で登録された非同期イベントを含め、元のソケット s と同じプロパティを持つ。条件関数が CF_REJECT
を返した場合、WSAAccept
は接続要求を拒否する。条件関数は本関数と同じスレッド内で実行されるため、できるだけ速やかに戻るべきである。判定を即座に行えない場合、条件関数は
CF_DEFER
を返して判定が未決であり、サービスプロバイダはこの接続要求に対して何もしないことを示すべきである。アプリケーションが接続要求への対応準備が整ったら、再度
WSAAccept を呼び出し、条件関数の戻り値として CF_ACCEPT か CF_REJECT のどちらかを返せばよい。既定モード
(ブロッキング) のソケットでは、キューに保留接続がない状態で WSAAccept
が呼び出されると、接続が到着するまでブロックする。ノンブロッキングモードのソケットでは、キューに保留接続がない状態で WSAAccept
を呼び出すと WSAEWOULDBLOCK エラーで失敗する。WSAAccept
が成功して新しいソケットハンドルを返した後、受理したソケットを使ってさらに接続を受理することはできない。元のソケットはオープンのままで新しい接続要求をリッスンし続ける。addr
パラメータは結果パラメータで、通信層から見た接続元エンティティのアドレスが格納される。addr
パラメータの正確な形式は通信が行われるアドレスファミリによって決まる。addrlen は入出力両用のパラメータで、初期値として addr
が指す領域の大きさを格納しておく必要がある。関数から戻ると、返されたアドレスの実際の長さ (バイト単位) が格納される。この呼び出しは
SOCK_STREAM のような接続指向ソケットで使用される。addr や addrlen が NULL
の場合、受理したソケットのリモートアドレスに関する情報は返されない。それ以外の場合、接続が正常に受理されれば両パラメータに情報が格納される。条件関数のプロトタイプは、Winsock2.h
ヘッダファイルで LPCONDITIONPROC として次のように定義されている。
（以下省略）


%index
WSAAddressToStringW
sockaddr 構造体のすべての構成要素を、アドレスの人間可読な文字列表現に変換する。(Unicode)
%prm
lpsaAddress, dwAddressLength, lpProtocolInfo, lpszAddressString, lpdwAddressStringLength
lpsaAddress : [var] 文字列に変換する sockaddr 構造体へのポインタ。
dwAddressLength : [int] lpsaAddress パラメータが指す sockaddr 構造体に含まれるアドレスの長さ (バイト単位)。dwAddressLength パラメータの大きさはプロトコルによって異なりうる。
lpProtocolInfo : [var] 特定のプロバイダの WSAPROTOCOL_INFO 構造体へのポインタ。このパラメータが NULL の場合、呼び出しは lpsaAddress パラメータで指定したアドレスファミリをサポートする最初のプロトコルのプロバイダにルーティングされる。
lpszAddressString : [wstr] 人間可読なアドレス文字列を受け取るバッファへのポインタ。
lpdwAddressStringLength : [var] 入力時、このパラメータは lpszAddressString パラメータが指すバッファの長さを指定する。長さは ANSI 文字列ではバイト、Unicode 文字列では WCHAR で表される。出力時、このパラメータは lpszAddressString パラメータが指すバッファに実際にコピーされた文字列の長さ (NULL 終端を含む) を返す。指定されたバッファが十分でない場合、この関数は WSAEFAULT エラーで失敗し、このパラメータには必要なサイズが設定される。
%inst
sockaddr 構造体のすべての構成要素を、アドレスの人間可読な文字列表現に変換する。(Unicode)

[戻り値]
エラーがない場合、WSAAddressToString はゼロを返す。そうでない場合は SOCKET_ERROR
を返し、WSAGetLastError を呼び出すことで特定のエラー番号を取得できる。
（以下省略）

[備考]
WSAAddressToString 関数は、プロトコル非依存なアドレスから文字列への変換を提供する。WSAAddressToString
関数は、lpsaAddress パラメータが指すソケットアドレス構造体を取り、ソケットアドレスを表す NULL 終端文字列へのポインタを
lpszAddressString パラメータに返す。inet_ntoa 関数が IPv4
アドレスのみを扱うのに対し、WSAAddressToString 関数は、IPv6 アドレスを含め、ローカルコンピュータ上の
Winsock プロバイダがサポートする任意のソケットアドレスを扱える。lpsaAddress パラメータが IPv4 ソケットアドレス
(アドレスファミリが AF_INET) を指している場合、lpszAddressString
パラメータが指すバッファに返されるアドレス文字列は、"192.168.16.0"
のようなドット区切り十進表記である。lpsaAddress パラメータが IPv6 ソケットアドレス (アドレスファミリが
AF_INET6) を指している場合、lpszAddressString
パラメータが指すバッファに返されるアドレス文字列はインターネット標準形式である。基本的な文字列表現は、コロンで区切られた 8 個の 16
進数から成る。連続するゼロの列はダブルコロンに置き換えられる。IPv6 アドレスの文字列表現には、ダブルコロンは 1
つしか現れてはならない。lpszAddressString
パラメータが指すバッファの長さがソケットアドレスの文字列表現を受け取るのに十分でない場合、WSAAddressToString は
WSAEFAULT を返す。WSAAddressToString 関数による IPv6 アドレスサポートは Windows XP SP1
以降で追加された。WSAAddressToString 関数が IPv6 アドレスをサポートするには、ローカルコンピュータに IPv6
もインストールされている必要がある。Windows Phone 8: WSAAddressToStringW 関数は Windows
Phone 8 以降の Windows Phone ストアアプリでサポートされる。Windows 8.1 および Windows
Server 2012 R2: WSAAddressToStringW 関数は、Windows 8.1、Windows Server
2012 R2 以降の Windows ストアアプリでサポートされる。
> [!NOTE] > winsock2.h ヘッダは、UNICODE プリプロセッサ定数の定義に基づいて本関数の ANSI 版と
Unicode 版を自動的に選択するエイリアスとして WSAAddressToString
を定義している。エンコーディング中立なエイリアスとエンコーディング中立でないコードを混在させると、コンパイルエラーや実行時エラーを招く不整合が発生しうる。詳しくは
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
WSAAdvertiseProvider
特定のネームスペース バージョン 2 プロバイダをすべての対象クライアントに対して使用可能にする。
%prm
puuidProviderId, pNSPv2Routine
puuidProviderId : [var] 広告するネームスペースプロバイダのプロバイダ ID へのポインタ。
pNSPv2Routine : [var] プロバイダがサポートするネームスペースサービスプロバイダ バージョン 2 のエントリーポイントを持つ **NSPV2_ROUTINE** 構造体へのポインタ。
%inst
特定のネームスペース バージョン 2 プロバイダをすべての対象クライアントに対して使用可能にする。

[戻り値]
エラーがない場合、WSAProviderCompleteAsyncCall はゼロを返す。関数が失敗した場合、戻り値は
SOCKET_ERROR となる。拡張エラー情報を取得するには、WSAGetLastError
を呼び出す。これは次の拡張エラー値のいずれかを返す。
（以下省略）

[備考]
**WSAAdvertiseProvider** 関数は、Windows Vista 以降で利用可能なネームスペースサービスプロバイダ
バージョン 2 (NSPv2) アーキテクチャの一部として使用される。Windows Vista および Windows Server
2008 では、**WSAAdvertiseProvider** 関数は NS_EMAIL
ネームスペースプロバイダの操作にのみ使用できる。**WSAAdvertiseProvider** 関数は、クライアントが検出できるように
NSPv2 プロバイダのインスタンスを広告する。広告するインスタンスがアプリケーション種別プロバイダのインスタンス
(NAPI_PROVIDER_INSTALLATION_BLOB 構造体の **dwProvideType** メンバが
**ProviderType_Application** のネームスペースプロバイダ)
である場合、広告されたプロバイダインスタンスは、**WSAAdvertiseProvider**
の呼び出し元と同じユーザーかつ同じセッションで動作するすべてのクライアントプロセスから可視となる。一般に、NSPv2
プロバイダは呼び出し側アプリケーション以外のプロセス内で実装される。NSPv2
プロバイダはクライアントの動作によりアクティブ化されない。各プロバイダホスティングアプリケーションは、**WSAAdvertiseProvider**
と WSAUnadvertiseProvider
関数を呼び出すことで、特定のプロバイダを使用可能あるいは使用不可にするタイミングを決定する。クライアントの動作は、プロバイダが
(ネームスペースプロバイダが広告されている)
使用可能状態のときにプロバイダへの接続を試みるだけである。**WSAAdvertiseProvider**
関数は、特定のプロバイダをすべての対象クライアント
(現在はホスティングアプリケーションと同じ資格情報かつ同じユーザーセッションで動作するすべてのアプリケーション)
に対して使用可能にしたいアプリケーションから呼び出される。
1 つのプロセスが複数のプロバイダを同時に実装・広告できる。Windows Sockets
はネームスペースプロバイダを管理し、呼び出しを正しいプロバイダにディスパッチする。また RPC
インターフェースの詳細を隠蔽し、プロセス間呼び出しをプロセス内呼び出しに変換する。したがって NSPv2 プロバイダは、NSPv1
プロバイダが使う NSP_ROUTINE 構造体と類似のエントリーポイント関数のテーブルを実装するだけでよい。NSPv2 プロバイダは
RPC 固有の要件 (例: データのマーシャリングとシリアライゼーション) を気にする必要がない。
**WSAAdvertiseProvider** 呼び出し元は、プロバイダがサポートする NSPv2 エントリーポイントを持つ
NSPV2_ROUTINE 構造体へのポインタを pNSPv2Routine パラメータで渡す。
WSAUnadvertiseProvider 関数は、特定のネームスペースプロバイダをクライアントから使用不可にする。


%index
WSAAsyncGetHostByAddr
WSAAsyncGetHostByAddr マクロ関数 (wsipv6ok.h) は、アドレスに対応するホスト情報を非同期に取得する。
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
の非同期版である。ネットワークアドレスに対応するホスト名およびアドレス情報を取得するために使用される。Windows Sockets
は操作を開始して直ちに呼び出し元に戻り、アプリケーションが操作を識別するのに使える不透明な非同期タスクハンドルを返す。操作が完了すると、結果
(あれば)
が呼び出し元から提供されたバッファにコピーされ、アプリケーションのウィンドウにメッセージが送信される。非同期操作が完了すると、hWnd
パラメータで指定されたアプリケーションウィンドウが wMsg パラメータで指定されたメッセージを受け取る。wParam
パラメータには元の関数呼び出しが返した非同期タスクハンドルが格納される。lParam の上位 16
ビットにはエラーコードが格納される。エラーコードは Winsock2.h
で定義された任意のエラーになりうる。エラーコードがゼロなら非同期操作が正常完了したことを示す。正常完了時には、元の関数呼び出しに指定したバッファに
hostent 構造体が格納される。この構造体のメンバにアクセスするには、元のバッファアドレスを hostent
構造体ポインタにキャストして適宜アクセスする。エラーコードが WSAENOBUFS の場合、元の呼び出しで buflen
に指定したバッファサイズがすべての結果情報を格納するには小さすぎたことを意味する。この場合、lParam の下位 16
ビットに必要なバッファサイズが格納される。アプリケーションが部分データでは不十分と判断した場合、すべての情報を受け取るのに十分な
(すなわち lParam の下位 16 ビット以上の) バッファを用意して WSAAsyncGetHostByAddr
関数を再発行できる。この関数に指定するバッファは、Windows Sockets が hostent
構造体と、そのメンバが参照するデータ領域の内容をまとめて構築するのに使用される。WSAENOBUFS
エラーを避けるため、アプリケーションは少なくとも MAXGETHOSTSTRUCT バイト (Winsock2.h で定義)
のバッファを用意するべきである。エラーコードとバッファ長は、Winsock2.h で次のように定義されている
WSAGETASYNCERROR および WSAGETASYNCBUFLEN マクロを使って lParam から取り出すべきである。
（以下省略）


%index
WSAAsyncGetHostByName
WSAAsyncGetHostByName マクロ関数 (wsipv6ok.h) は、ホスト名に対応するホスト情報を非同期に取得する。
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
の非同期版であり、ホスト名に対応するホスト名およびアドレス情報を取得するために使用される。Windows Sockets
は操作を開始して直ちに呼び出し元に戻り、アプリケーションが操作を識別するのに使える不透明な非同期タスクハンドルを返す。操作が完了すると、結果
(あれば)
が呼び出し元から提供されたバッファにコピーされ、アプリケーションのウィンドウにメッセージが送信される。非同期操作が完了すると、hWnd
パラメータで指定されたアプリケーションウィンドウが wMsg パラメータで指定されたメッセージを受け取る。wParam
パラメータには元の関数呼び出しが返した非同期タスクハンドルが格納される。lParam の上位 16
ビットにはエラーコードが格納される。エラーコードは Winsock2.h
で定義された任意のエラーになりうる。エラーコードがゼロなら非同期操作が正常完了したことを示す。正常完了時には、元の関数呼び出しに指定したバッファに
hostent 構造体が格納される。この構造体の要素にアクセスするには、元のバッファアドレスを hostent
構造体ポインタにキャストして適宜アクセスする。エラーコードが WSAENOBUFS の場合、元の呼び出しで buflen
に指定したバッファサイズがすべての結果情報を格納するには小さすぎたことを意味する。この場合、lParam の下位 16
ビットに必要なバッファサイズが格納される。アプリケーションが部分データでは不十分と判断した場合、すべての情報を受け取るのに十分なバッファを用意して
WSAAsyncGetHostByName 関数を再発行できる。この関数に指定するバッファは、Windows Sockets が
hostent 構造体と、そのメンバが参照するデータ領域の内容をまとめて構築するのに使用される。WSAENOBUFS
エラーを避けるため、アプリケーションは少なくとも MAXGETHOSTSTRUCT バイト (Winsock2.h で定義)
のバッファを用意するべきである。エラーコードとバッファ長は、Winsock2.h で次のように定義されている
WSAGETASYNCERROR および WSAGETASYNCBUFLEN マクロを使って lParam から取り出すべきである。
（以下省略）


%index
WSAAsyncGetProtoByName
WSAAsyncGetProtoByName 関数 (winsock.h) は、プロトコル名に対応するプロトコル情報を非同期に取得する。
%prm
hWnd, wMsg, name, buf, buflen
hWnd : [intptr] 非同期リクエストの完了時にメッセージを受け取るウィンドウのハンドル。
wMsg : [int] 非同期リクエストの完了時に受け取るメッセージ。
name : [str] 解決する、NULL 終端のプロトコル名へのポインタ。
buf : [str] protoent データを受け取るためのデータ領域へのポインタ。データ領域は、Windows Sockets が protoent 構造体とそのメンバが参照するすべてのデータを格納するために使うため、protoent 構造体のサイズより大きくなければならない。MAXGETHOSTSTRUCT バイトのバッファが推奨される。
buflen : [int] buf パラメータ用のデータ領域のサイズ (バイト単位)。
%inst
WSAAsyncGetProtoByName 関数 (winsock.h) は、プロトコル名に対応するプロトコル情報を非同期に取得する。

[戻り値]

戻り値は、非同期操作の開始に成功したかどうかを示す。操作自体の成否を意味するものではない。エラーがない場合、WSAAsyncGetProtoByName
はそのリクエストに対する非同期タスクハンドルを表す、HANDLE 型の 0 以外の値を返す (これは Windows の HTASK
とは異なる)。この値は 2 通りの使い方ができる。WSACancelAsyncRequest
を使って操作をキャンセルするために使うか、wParam
メッセージパラメータを調べて非同期操作と完了メッセージを対応付けるために使える。非同期操作を開始できなかった場合、WSAAsyncGetProtoByName
はゼロを返し、WSAGetLastError
を呼び出すことで特定のエラー番号を取得できる。アプリケーションウィンドウがメッセージを受け取ったとき、次のエラーコードが設定されうる。前述の通り、これらは
WSAGETASYNCERROR マクロを使って返信メッセージの lParam から取り出せる。
（以下省略）

[備考]
WSAAsyncGetProtoByName 関数は getprotobyname
の非同期版である。指定したプロトコル名に対応するプロトコル名と番号を Windows Sockets
データベースから取得するために使用される。Windows Sockets
は操作を開始して直ちに呼び出し元に戻り、アプリケーションが操作を識別するのに使える不透明な非同期タスクハンドルを返す。操作が完了すると、結果
(あれば)
が呼び出し元から提供されたバッファにコピーされ、アプリケーションのウィンドウにメッセージが送信される。非同期操作が完了すると、hWnd
パラメータで指定されたアプリケーションウィンドウが wMsg パラメータで指定されたメッセージを受け取る。wParam
パラメータには元の関数呼び出しが返した非同期タスクハンドルが格納される。lParam の上位 16
ビットにはエラーコードが格納される。エラーコードは Winsock2.h
で定義された任意のエラーになりうる。エラーコードがゼロなら非同期操作が正常完了したことを示す。正常完了時には、元の関数呼び出しに指定したバッファに
protoent 構造体が格納される。エラーコードが WSAENOBUFS の場合、元の呼び出しで buflen
に指定したバッファサイズがすべての結果情報を格納するには小さすぎたことを意味する。この場合、lParam の下位 16
ビットに必要なバッファサイズが格納される。WSAENOBUFS エラーを避けるため、アプリケーションは少なくとも
MAXGETHOSTSTRUCT バイトのバッファを用意するべきである。エラーコードとバッファ長は、Winsock2.h で定義されている
WSAGETASYNCERROR および WSAGETASYNCBUFLEN マクロを使って lParam から取り出すべきである。
（以下省略）


%index
WSAAsyncGetProtoByNumber
WSAAsyncGetProtoByNumber 関数 (winsock.h) は、プロトコル番号に対応するプロトコル情報を非同期に取得する。
%prm
hWnd, wMsg, number, buf, buflen
hWnd : [intptr] 非同期リクエストの完了時にメッセージを受け取るウィンドウのハンドル。
wMsg : [int] 非同期リクエストの完了時に受け取るメッセージ。
number : [int] 解決するプロトコル番号 (ホストバイトオーダー)。
buf : [str] protoent データを受け取るためのデータ領域へのポインタ。データ領域は、Windows Sockets が protoent 構造体とそのメンバが参照するすべてのデータを格納するために使うため、protoent 構造体のサイズより大きくなければならない。MAXGETHOSTSTRUCT バイトのバッファが推奨される。
buflen : [int] buf パラメータ用のデータ領域のサイズ (バイト単位)。
%inst
WSAAsyncGetProtoByNumber 関数 (winsock.h)
は、プロトコル番号に対応するプロトコル情報を非同期に取得する。

[戻り値]

戻り値は、非同期操作の開始に成功したかどうかを示す。操作自体の成否を意味するものではない。エラーがない場合、WSAAsyncGetProtoByNumber
はそのリクエストに対する非同期タスクハンドルを表す、HANDLE 型の 0 以外の値を返す。この値は
WSACancelAsyncRequest でのキャンセルや wParam
の照合に使える。非同期操作を開始できなかった場合、WSAAsyncGetProtoByNumber
はゼロを返し、WSAGetLastError
を呼び出すことで特定のエラー番号を取得できる。アプリケーションウィンドウがメッセージを受け取ったとき、次のエラーコードが設定されうる。前述の通り、これらは
WSAGETASYNCERROR マクロを使って返信メッセージの lParam から取り出せる。
（以下省略）

[備考]
WSAAsyncGetProtoByNumber 関数は getprotobynumber
の非同期版であり、プロトコル番号に対応するプロトコル名と番号を取得するために使用される。Windows Sockets
は操作を開始して直ちに呼び出し元に戻り、アプリケーションが操作を識別するのに使える不透明な非同期タスクハンドルを返す。操作が完了すると、結果
(あれば)
が呼び出し元から提供されたバッファにコピーされ、アプリケーションのウィンドウにメッセージが送信される。非同期操作が完了すると、hWnd
パラメータで指定されたアプリケーションウィンドウが wMsg パラメータで指定されたメッセージを受け取る。wParam
パラメータには元の関数呼び出しが返した非同期タスクハンドルが格納される。lParam の上位 16
ビットにはエラーコードが格納される。エラーコードは Winsock2.h
で定義された任意のエラーになりうる。エラーコードがゼロなら非同期操作が正常完了したことを示す。正常完了時には、元の関数呼び出しに指定したバッファに
protoent 構造体が格納される。エラーコードが WSAENOBUFS の場合、元の呼び出しで buflen
に指定したバッファサイズがすべての結果情報を格納するには小さすぎたことを意味する。この場合、lParam の下位 16
ビットに必要なバッファサイズが格納される。WSAENOBUFS エラーを避けるため、アプリケーションは少なくとも
MAXGETHOSTSTRUCT バイトのバッファを用意するべきである。エラーコードとバッファ長は、Winsock2.h で定義されている
WSAGETASYNCERROR および WSAGETASYNCBUFLEN マクロを使って lParam から取り出すべきである。
（以下省略）


%index
WSAAsyncGetServByName
WSAAsyncGetServByName 関数 (winsock.h) は、サービス名とポートに対応するサービス情報を非同期に取得する。
%prm
hWnd, wMsg, name, proto, buf, buflen
hWnd : [intptr] 非同期リクエストの完了時にメッセージを受け取るウィンドウのハンドル。
wMsg : [int] 非同期リクエストの完了時に受け取るメッセージ。
name : [str] NULL 終端のサービス名へのポインタ。
proto : [str] プロトコル名へのポインタ。NULL にすることもでき、その場合 WSAAsyncGetServByName は s_name または s_aliases のいずれかが指定した name と一致する最初のサービスエントリを検索する。それ以外の場合、WSAAsyncGetServByName は name と proto の両方に一致するものを探す。
buf : [str] servent データを受け取るためのデータ領域へのポインタ。データ領域は、Windows Sockets が servent 構造体とそのメンバが参照するすべてのデータを格納するために使うため、servent 構造体のサイズより大きくなければならない。MAXGETHOSTSTRUCT バイトのバッファが推奨される。
buflen : [int] buf パラメータ用のデータ領域のサイズ (バイト単位)。
%inst
WSAAsyncGetServByName 関数 (winsock.h) は、サービス名とポートに対応するサービス情報を非同期に取得する。

[戻り値]

戻り値は、非同期操作の開始に成功したかどうかを示す。操作自体の成否を意味するものではない。エラーがない場合、WSAAsyncGetServByName
はそのリクエストに対する非同期タスクハンドルを表す、HANDLE 型の 0
以外の値を返す。非同期操作を開始できなかった場合、WSAAsyncServByName はゼロを返し、WSAGetLastError
を呼び出すことで特定のエラー番号を取得できる。アプリケーションウィンドウがメッセージを受け取ったとき、次のエラーコードが設定されうる。前述の通り、これらは
WSAGETASYNCERROR マクロを使って返信メッセージの lParam から取り出せる。
（以下省略）

[備考]
WSAAsyncGetServByName 関数は getservbyname
の非同期版であり、サービス名に対応するサービス情報を取得するために使用される。Windows Sockets
は操作を開始して直ちに呼び出し元に戻り、アプリケーションが操作を識別するのに使える不透明な非同期タスクハンドルを返す。操作が完了すると、結果
(あれば)
が呼び出し元から提供されたバッファにコピーされ、アプリケーションのウィンドウにメッセージが送信される。非同期操作が完了すると、hWnd
パラメータで指定されたアプリケーションウィンドウが wMsg パラメータで指定されたメッセージを受け取る。wParam
パラメータには元の関数呼び出しが返した非同期タスクハンドルが格納される。lParam の上位 16
ビットにはエラーコードが格納される。エラーコードは Winsock2.h
で定義された任意のエラーになりうる。エラーコードがゼロなら非同期操作が正常完了したことを示す。正常完了時には、元の関数呼び出しに指定したバッファに
servent 構造体が格納される。エラーコードが WSAENOBUFS の場合、元の呼び出しで buflen
に指定したバッファサイズがすべての結果情報を格納するには小さすぎたことを意味する。この場合、lParam の下位 16
ビットに必要なバッファサイズが格納される。WSAENOBUFS エラーを避けるため、アプリケーションは少なくとも
MAXGETHOSTSTRUCT バイトのバッファを用意するべきである。エラーコードとバッファ長は、Winsock2.h で定義されている
WSAGETASYNCERROR および WSAGETASYNCBUFLEN マクロを使って lParam から取り出すべきである。
（以下省略）


%index
WSAAsyncGetServByPort
WSAAsyncGetServByPort 関数 (winsock.h) は、ポートとプロトコルに対応するサービス情報を非同期に取得する。
%prm
hWnd, wMsg, port, proto, buf, buflen
hWnd : [intptr] 非同期リクエストの完了時にメッセージを受け取るウィンドウのハンドル。
wMsg : [int] 非同期リクエストの完了時に受け取るメッセージ。
port : [int] サービスのポート (ネットワークバイトオーダー)。
proto : [str] プロトコル名へのポインタ。NULL にすることもでき、その場合 WSAAsyncGetServByPort は s_port が指定した port と一致する最初のサービスエントリを検索する。それ以外の場合、WSAAsyncGetServByPort は port と proto の両方に一致するものを探す。
buf : [str] servent データを受け取るためのデータ領域へのポインタ。データ領域は、Windows Sockets が servent 構造体とそのメンバが参照するすべてのデータを格納するために使うため、servent 構造体のサイズより大きくなければならない。MAXGETHOSTSTRUCT バイトのバッファが推奨される。
buflen : [int] buf パラメータ用のデータ領域のサイズ (バイト単位)。
%inst
WSAAsyncGetServByPort 関数 (winsock.h) は、ポートとプロトコルに対応するサービス情報を非同期に取得する。

[戻り値]

戻り値は、非同期操作の開始に成功したかどうかを示す。操作自体の成否を意味するものではない。エラーがない場合、WSAAsyncGetServByPort
はそのリクエストに対する非同期タスクハンドルを表す、HANDLE 型の 0
以外の値を返す。非同期操作を開始できなかった場合、WSAAsyncGetServByPort はゼロを返し、WSAGetLastError
を呼び出すことで特定のエラー番号を取得できる。アプリケーションウィンドウがメッセージを受け取ったとき、次のエラーコードが設定されうる。前述の通り、これらは
WSAGETASYNCERROR マクロを使って返信メッセージの lParam から取り出せる。
（以下省略）

[備考]
WSAAsyncGetServByPort 関数は getservbyport
の非同期版であり、ポート番号に対応するサービス情報を取得するために使用される。Windows Sockets
は操作を開始して直ちに呼び出し元に戻り、アプリケーションが操作を識別するのに使える不透明な非同期タスクハンドルを返す。操作が完了すると、結果
(あれば)
が呼び出し元から提供されたバッファにコピーされ、アプリケーションのウィンドウにメッセージが送信される。非同期操作が完了すると、hWnd
パラメータで指定されたアプリケーションウィンドウが wMsg パラメータで指定されたメッセージを受け取る。wParam
パラメータには元の関数呼び出しが返した非同期タスクハンドルが格納される。lParam の上位 16
ビットにはエラーコードが格納される。エラーコードは Winsock2.h
で定義された任意のエラーになりうる。エラーコードがゼロなら非同期操作が正常完了したことを示す。正常完了時には、元の関数呼び出しに指定したバッファに
servent 構造体が格納される。エラーコードが WSAENOBUFS の場合、元の呼び出しで buflen
に指定したバッファサイズがすべての結果情報を格納するには小さすぎたことを意味する。この場合、lParam の下位 16
ビットに必要なバッファサイズが格納される。WSAENOBUFS エラーを避けるため、アプリケーションは少なくとも
MAXGETHOSTSTRUCT バイトのバッファを用意するべきである。エラーコードとバッファ長は、Winsock2.h で定義されている
WSAGETASYNCERROR および WSAGETASYNCBUFLEN マクロを使って lParam から取り出すべきである。
（以下省略）


%index
WSAAsyncSelect
WSAAsyncSelect 関数 (winsock.h) は、ソケットに対するネットワークイベントの Windows メッセージベース通知を要求する。
%prm
s, hWnd, wMsg, lEvent
s : [int] イベント通知が必要なソケットを識別するディスクリプタ。
hWnd : [intptr] ネットワークイベント発生時にメッセージを受け取るウィンドウを識別するハンドル。
wMsg : [int] ネットワークイベント発生時に受け取るメッセージ。
lEvent : [int] アプリケーションが関心を持つネットワークイベントの組み合わせを指定するビットマスク。
%inst
WSAAsyncSelect 関数 (winsock.h) は、ソケットに対するネットワークイベントの Windows
メッセージベース通知を要求する。

[戻り値]
WSAAsyncSelect
関数が成功した場合、アプリケーションのネットワークイベント一覧の関心宣言が成功したことを表すため、戻り値はゼロである。そうでない場合は
SOCKET_ERROR を返し、WSAGetLastError を呼び出すことで特定のエラー番号を取得できる。
（以下省略）

[備考]
WSAAsyncSelect 関数は、lEvent パラメータで指定したネットワークイベントを検出したときに WS2_32.DLL
がウィンドウ hWnd にメッセージを送るよう要求するために使用される。送信すべきメッセージは wMsg
パラメータで指定する。通知対象のソケットは s パラメータで識別する。WSAAsyncSelect 関数は、lEvent
の値にかかわらずソケット s を自動的にノンブロッキングモードに設定する。ソケット s をブロッキングモードに戻すには、まず
WSAAsyncSelect を lEvent をゼロに設定して呼び出し、ソケット s
に関連付けられたイベントレコードをクリアする必要がある。その後、ioctlsocket または WSAIoctl
を呼び出してソケットをブロッキングモードに戻せる。ノンブロッキングソケットをブロッキングモードに戻す方法の詳細については、ioctlsocket
および WSAIoctl 関数を参照。lEvent パラメータは、次の表に列挙する値のいずれかをビット単位の OR
演算子で組み合わせて構築する。
（以下省略）


%index
WSACancelAsyncRequest
WSACancelAsyncRequest 関数 (winsock.h) は、未完了の非同期操作をキャンセルする。
%prm
hAsyncTaskHandle
hAsyncTaskHandle : [intptr] キャンセルする非同期操作を指定するハンドル。
%inst
WSACancelAsyncRequest 関数 (winsock.h) は、未完了の非同期操作をキャンセルする。

[戻り値]
WSACancelAsyncRequest が返す値は、操作が正常にキャンセルされた場合はゼロである。そうでない場合は
SOCKET_ERROR を返し、WSAGetLastError を呼び出すことで特定のエラー番号を取得できる。
（以下省略）

[備考]
WSACancelAsyncRequest 関数は、WSAAsyncGetHostByName などの WSAAsyncGetXByY
関数のいずれかによって開始された非同期操作をキャンセルするために使用される。キャンセル対象の操作は hAsyncTaskHandle
パラメータで識別され、これには開始した WSAAsyncGetXByY 関数が返した非同期タスクハンドルを設定する。既存の非同期
WSAAsyncGetXByY 操作のキャンセル試行は、2 つの理由により WSAEALREADY エラーコードで失敗することがある。第
1 に、元の操作が既に完了しアプリケーションが結果のメッセージを処理し終えている場合。第 2
に、元の操作は既に完了したが結果のメッセージがまだアプリケーションウィンドウのキューに残っている場合。


%index
WSACancelBlockingCall
WSACancelBlockingCall 関数は、Windows Sockets 2 仕様リビジョン 2.2.0 への準拠のため削除された。
%prm

%inst
WSACancelBlockingCall 関数は、Windows Sockets 2 仕様リビジョン 2.2.0
への準拠のため削除された。


%index
WSACleanup
WSACleanup 関数 (winsock.h) は、WS2_32.dll の使用を終了する。
%prm

%inst
WSACleanup 関数 (winsock.h) は、WS2_32.dll の使用を終了する。

[戻り値]
操作が成功すれば戻り値はゼロである。そうでない場合は SOCKET_ERROR を返し、WSAGetLastError
を呼び出すことで特定のエラー番号を取得できる。マルチスレッド環境では、WSACleanup はすべてのスレッドの Windows
Sockets 操作を終了させる。
（以下省略）

[備考]
アプリケーションまたは DLL は、Windows Sockets サービスを使用する前に WSAStartup
の呼び出しに成功する必要がある。Windows Sockets の利用を終えたら、アプリケーションまたは DLL は WSACleanup
を呼び出して Windows Sockets
実装から登録解除し、自身のために確保されたリソースを実装に解放させる必要がある。WSACleanup
が呼び出されると、このプロセス内のどのスレッドが発行した未処理のブロッキングまたは非同期 Windows Sockets
呼び出しも、通知メッセージや任意のイベントオブジェクトのシグナリングなしにキャンセルされる。このプロセス内のどのスレッドが発行した未処理のオーバーラップ送受信操作
(たとえば WSASend、WSASendTo、WSARecv、WSARecvFrom のオーバーラップソケットでの呼び出し)
も、イベントオブジェクトのセットや完了ルーチンの呼び出し (指定されていた場合)
なしにキャンセルされる。この場合、未処理のオーバーラップ操作は WSA_OPERATION_ABORTED
エラーで失敗する。WSACleanup 呼び出し時にオープンされていたソケットは、closesocket
が呼ばれたかのようにリセットされ自動的に解放される。closesocket
でクローズされたがまだ送信すべきデータが残っているソケットは、WSACleanup
の呼び出しによって影響を受けることがある。この場合、アプリケーション終了時に WS2_32.DLL
がメモリからアンロードされると、保留データが失われる可能性がある。すべての保留データが送信されることを保証するには、アプリケーションは
shutdown で接続を閉じ、クローズが完了するのを待ってから closesocket と WSACleanup
を呼び出すべきである。キュー内の未投稿または投稿済みメッセージなど、すべてのリソースと内部状態は、次のユーザーが使えるよう解放される必要がある。WSAStartup
呼び出しの成功それぞれに対し 1 回の WSACleanup 呼び出しが必要である。最後の WSACleanup
呼び出しのみが実際のクリーンアップを行う。それ以前の呼び出しは WS2_32.DLL 内の内部参照カウントをデクリメントするだけである。注
WSACleanup は、PNRP (Peer Name Resolution Protocol) ネームスペースプロバイダのような
Windows Sockets ネームスペースプロバイダに登録されている名前 (例: ピア名) の登録解除は行わない。Windows
Sockets 1.1 では、ブロッキングフック内から WSACleanup
を呼び出し、戻り値を確認しないのがよくあるプログラミングミスだった。Winsock 1.1
アプリケーションがブロッキング呼び出し中に終了する必要がある場合、アプリケーションはまず WSACancelBlockingCall
でブロッキング呼び出しをキャンセルし、制御がアプリケーションに戻ってから WSACleanup
呼び出しを発行しなければならなかった。Windows Sockets 2
ではこの問題は存在せず、WSACancelBlockingCall 関数は削除されている。WSACleanup
関数は通常、プロトコル固有のヘルパ DLL のアンロードを引き起こす。そのため、WSACleanup 関数をアプリケーション DLL の
DllMain 関数から呼び出してはならない。これはデッドロックを引き起こす可能性がある。詳しくは DLL Main Function
を参照。Windows Phone 8: この関数は Windows Phone 8 以降の Windows Phone
ストアアプリでサポートされる。Windows 8.1 および Windows Server 2012 R2: この関数は、Windows
8.1、Windows Server 2012 R2 以降の Windows ストアアプリでサポートされる。


%index
WSACloseEvent
WSACloseEvent 関数は、オープンされているイベントオブジェクトハンドルをクローズする。
%prm
hEvent
hEvent : [intptr] オープンされたイベントを識別するオブジェクトハンドル。
%inst
WSACloseEvent 関数は、オープンされているイベントオブジェクトハンドルをクローズする。

[戻り値]
関数が成功した場合、戻り値は TRUE である。関数が失敗した場合、戻り値は FALSE
である。拡張エラー情報を取得するには、WSAGetLastError を呼び出す。
（以下省略）

[備考]
WSACloseEvent
関数は、イベントオブジェクトのハンドルをクローズし、イベントオブジェクトに関連付けられたリソースを解放する。この関数は、WSACreateEvent
関数で生成されたハンドルをクローズするために使用される。イベントオブジェクトのハンドルがクローズされた後、このハンドルへの参照は
WSA_INVALID_HANDLE エラーで失敗する。Windows Phone 8: この関数は Windows Phone 8
以降の Windows Phone ストアアプリでサポートされる。Windows 8.1 および Windows Server 2012
R2: この関数は、Windows 8.1、Windows Server 2012 R2 以降の Windows
ストアアプリでサポートされる。


%index
WSAConnect
WSAConnect 関数は、別のソケットアプリケーションへの接続を確立し、接続データを交換し、指定された FLOWSPEC 構造体に基づいて必要な QoS を指定する。
%prm
s, name, namelen, lpCallerData, lpCalleeData, lpSQOS, lpGQOS
s : [int] 未接続のソケットを識別するディスクリプタ。
name : [var] 接続先アドレスを指定する sockaddr 構造体へのポインタ。IPv4 では、sockaddr にアドレスファミリとして AF_INET、接続先の IPv4 アドレス、接続先のポートが含まれる。IPv6 では、sockaddr 構造体にアドレスファミリとして AF_INET6、接続先の IPv6 アドレス、接続先のポートが含まれ、追加のフロー情報やスコープ ID 情報を含むこともある。
namelen : [int] name パラメータが指す sockaddr 構造体の長さ (バイト単位)。
lpCallerData : [var] 接続確立中に相手側ソケットに転送されるユーザーデータへのポインタ。備考を参照。
lpCalleeData : [var] 接続確立中に相手側ソケットから返されるユーザーデータへのポインタ。備考を参照。
lpSQOS : [var] ソケット s 用の FLOWSPEC 構造体への、各方向に 1 つずつのポインタ。
lpGQOS : [var] 将来ソケットグループで使用するために予約されている。該当する場合、ソケットグループ用の FLOWSPEC 構造体へのポインタ。このパラメータは NULL にすべきである。
%inst
WSAConnect 関数は、別のソケットアプリケーションへの接続を確立し、接続データを交換し、指定された FLOWSPEC
構造体に基づいて必要な QoS を指定する。

[戻り値]
エラーがない場合、WSAConnect はゼロを返す。そうでない場合は SOCKET_ERROR を返し、WSAGetLastError
を呼び出すことで特定のエラーコードを取得できる。ブロッキングソケットでは、戻り値は接続試行の成否を示す。ノンブロッキングソケットでは、接続試行を即座に完了できない。この場合、WSAConnect
は SOCKET_ERROR を返し、WSAGetLastError は WSAEWOULDBLOCK
を返す。そのため、アプリケーションは次のようにできる。
（以下省略）

[備考]
WSAConnect 関数は、指定された接続先への接続を作成し、接続時に発生するその他多数の付随的操作を行うために使用される。ソケット s
がバインドされていない場合、ローカルな結合にシステムが一意な値を割り当て、ソケットはバインド済みとしてマークされる。Windows
Vista 以降を対象とするアプリケーションでは、クライアントアプリケーションの設計を大幅に簡素化する WSAConnectByList
や WSAConnectByName 関数の使用を検討するべきである。接続指向ソケット (たとえば SOCK_STREAM 型)
の場合、name (ソケットの名前空間上のアドレス。詳しくは bind を参照)
を使って外部ホストへのアクティブな接続が開始される。この呼び出しが成功して戻った時点で、ソケットはデータの送受信準備ができている。name
構造体のアドレスパラメータがすべてゼロの場合、WSAConnect はエラー WSAEADDRNOTAVAIL
を返す。既にアクティブな接続を再接続しようとするとエラーコード WSAEISCONN で失敗する。注 ソケットをオープンして
setsockopt を呼び出し、その後 sendto を呼び出すと、Windows Sockets は暗黙の bind
関数呼び出しを行う。接続指向のノンブロッキングソケットでは、接続を即時に完了できないことが多い。そのような場合、この関数はエラー
WSAEWOULDBLOCK
を返す。しかし操作は継続する。成功または失敗の結果が判明したら、クライアントが通知を登録した方法に応じていくつかの形で報告される。クライアントが
select を使っていれば、成功は writefds 集合で、失敗は exceptfds 集合で報告される。クライアントが
WSAAsyncSelect や WSAEventSelect を使っていれば、FD_CONNECT で通知され、FD_CONNECT
に付随するエラーコードが成功か特定の失敗理由かを示す。コネクションレスソケット (たとえば SOCK_DGRAM 型)
の場合、WSAConnect の操作は単に既定の接続先アドレスを設定するだけで、ソケットはその後の接続指向の送受信操作
(send、WSASend、recv、WSARecv)
で利用できるようになる。指定した接続先アドレス以外から受信したデータグラムは破棄される。name 構造体全体がすべてゼロ
(アドレスパラメータだけでなく)
の場合、ソケットは切断される。以後、既定のリモートアドレスは不定になるため、send、WSASend、recv、WSARecv
呼び出しはエラーコード WSAENOTCONN を返すようになる。ただし
sendto、WSASendTo、recvfrom、WSARecvFrom
は引き続き使用できる。ソケットが既に接続済みでも、WSAConnect をもう一度呼び出すだけで既定の接続先を変更できる。name
が前回の WSAConnect と異なる場合、受信待ちキューに入っているデータグラムは破棄される。コネクションレスソケットでは、name
はブロードキャストアドレスを含む任意の有効なアドレスを指定できる。ただし、ブロードキャストアドレスに接続するには、ソケットで
setsockopt SO_BROADCAST を有効にする必要がある。そうでなければ WSAConnect はエラーコード
WSAEACCES
で失敗する。コネクションレスソケットでは、ユーザー間データの交換はできず、該当するパラメータは黙って無視される。アプリケーションは、自身が指定するパラメータが直接的または間接的に指すメモリ領域の確保に責任を持つ。lpCallerData
パラメータには、接続要求とともに送信される任意のユーザーデータ (接続データと呼ばれる)
へのポインタを格納する。これは通常のネットワークデータストリームには含まれない追加データで、接続確立のためのネットワーク要求とともに送信される。このオプションは
DECNet、OSI TP4 などのレガシープロトコルで使用される。注 Windows の TCP/IP
プロトコルでは接続データはサポートされない。接続データは、生のソケット上の ATM (RAWWAN) でのみサポートされる。
lpCallerData が NULL の場合、相手側にユーザーデータは渡されない。lpCalleeData
は結果パラメータであり、接続確立の一環として相手側ソケットから渡されたユーザーデータを WSABUF
構造体の中に格納する。lpCalleeData パラメータが指す WSABUF 構造体の len
メンバには、初期値としてアプリケーションが buf
メンバ用に確保したバッファの長さを設定しておく。ユーザーデータが返されなかった場合、WSABUF 構造体の len
メンバにはゼロが設定される。lpCalleeData 情報は接続操作が完了した時点で有効になる。ブロッキングソケットでは接続操作は
WSAConnect 関数が戻った時点で完了する。ノンブロッキングソケットでは、FD_CONNECT
通知が発生した後に完了する。lpCalleeData が NULL
の場合、ユーザーデータは返されない。ユーザーデータの正確な形式は、ソケットが属するアドレスファミリに固有である。接続時、アプリケーションは
lpSQOS と lpGQOS パラメータを使って、WSAIoctl を SIO_SET_QOS または
SIO_SET_GROUP_QOS オペコードで呼び出して以前に指定した QoS 仕様をオーバーライドできる。lpSQOS
パラメータはソケット s 用の FLOWSPEC 構造体 (各方向に 1 つずつ)
と、それに続くプロバイダ固有のパラメータを指定する。関連するトランスポートプロバイダ全般もしくは特定のソケット種別が QoS
要求を満たせない場合、以下に示すようにエラーが返される。一方向ソケットに対しては、該当しない方向の送受信フロー仕様値はそれぞれ無視される。プロバイダ固有パラメータを指定しない場合、lpCalleeData
パラメータが指す WSABUF 構造体の buf と len メンバはそれぞれ NULL とゼロに設定すべきである。lpSQOS
パラメータが NULL の場合、アプリケーションが指定する QoS がないことを示す。将来ソケットグループで使用するために予約されている
lpGQOS は、該当する場合ソケットグループ用の FLOWSPEC 構造体 (各方向に 1 つずつ)
と、それに続くプロバイダ固有のパラメータを指定する。プロバイダ固有パラメータを指定しない場合、lpCalleeData パラメータが指す
WSABUF 構造体の buf と len メンバはそれぞれ NULL とゼロに設定すべきである。lpGQOS が NULL
の場合、アプリケーションが指定するグループ QoS がないことを示す。このパラメータは、s
がソケットグループの作成元でない場合は無視される。接続済みソケットが何らかの理由でクローズされた場合、それらを破棄して再生成すべきである。接続済みソケットで何かがおかしくなった場合、安定した状態に戻るためにアプリケーションは必要なソケットを破棄して再生成しなければならないと想定するのが最も安全である。注
WSAConnect のようなブロッキング Winsock 呼び出しを発行する際、呼び出しが完了する前に Winsock
がネットワークイベントを待つ必要がある場合がある。この状況では Winsock は警告待機を行い、同一スレッドにスケジュールされた APC
(非同期プロシージャコール) によって中断されることがある。同一スレッド上で進行中のブロッキング Winsock 呼び出しを中断した
APC の内部でさらに別のブロッキング Winsock 呼び出しを発行すると動作は未定義となり、Winsock
クライアントは決してそれを試みてはならない。Windows Phone 8: この関数は Windows Phone 8 以降の
Windows Phone ストアアプリでサポートされる。Windows 8.1 および Windows Server 2012 R2:
この関数は、Windows 8.1、Windows Server 2012 R2 以降の Windows ストアアプリでサポートされる。


%index
WSAConnectByList
接続先アドレスの集合 (ホスト名とポート) で表される複数の候補エンドポイントのいずれか 1 つへの接続を確立する。
%prm
s, SocketAddress, LocalAddressLength, LocalAddress, RemoteAddressLength, RemoteAddress, timeout, Reserved
s : [int] バインドされておらず、未接続のソケットを識別するディスクリプタ。WSAConnect のような接続確立のための他の Winsock 呼び出しと異なり、WSAConnectByList 関数はバインドされていないソケットを必要とする点に注意。
SocketAddress : [var] ピアに接続するための、考えられる接続先アドレスとポートの組を表す SOCKET_ADDRESS_LIST 構造体へのポインタ。SOCKET_ADDRESS_LIST 内の各 SOCKET_ADDRESS 構造体にポート番号を設定するのはアプリケーションの責任である。
LocalAddressLength : [var] 入力時、呼び出し元が用意した LocalAddress バッファのサイズ (バイト単位) へのポインタ。出力時、呼び出しが成功した際にシステムが LocalAddress バッファに格納したローカルアドレス用 SOCKADDR のサイズ (バイト単位) へのポインタ。
LocalAddress : [var] 接続のローカルアドレスを受け取る SOCKADDR 構造体へのポインタ。パラメータのサイズは LocalAddressLength で返されるサイズと完全に一致する。これは getsockname 関数が返すのと同じ情報である。このパラメータは NULL でもよく、その場合 LocalAddressLength パラメータは無視される。
RemoteAddressLength : [var] 入力時、呼び出し元が用意した RemoteAddress バッファのサイズ (バイト単位) へのポインタ。出力時、呼び出しが成功した際にシステムが RemoteAddress バッファに格納したリモートアドレス用 SOCKADDR のサイズ (バイト単位) へのポインタ。
RemoteAddress : [var] 接続のリモートアドレスを受け取る SOCKADDR 構造体へのポインタ。これは getpeername 関数が返すのと同じ情報である。このパラメータは NULL でもよく、その場合 RemoteAddressLength は無視される。
timeout : [var] リモートアプリケーションからの応答を待ってから呼び出しを中止するまでの時間 (ミリ秒)。このパラメータは NULL にすることもでき、その場合 WSAConnectByList は、接続が正常に確立されるか、考えられるすべてのローカル・リモートアドレスペアで接続試行が行われ失敗した後に完了する。
Reserved : [var] 将来の実装のために予約されている。このパラメータは NULL に設定しなければならない。
%inst
接続先アドレスの集合 (ホスト名とポート) で表される複数の候補エンドポイントのいずれか 1 つへの接続を確立する。

[戻り値]
接続が確立された場合、WSAConnectByList は TRUE を返し、呼び出し元がバッファを提供していれば
LocalAddress および RemoteAddress パラメータに値が設定される。呼び出しが失敗した場合は FALSE
を返す。その後、WSAGetLastError を呼び出して拡張エラー情報を取得できる。
（以下省略）

[備考]
WSAConnectByList は WSAConnectByName 関数と似ている。単一のホスト名とサービス名 (ポート)
を取る代わりに、WSAConnectByList はアドレスのリスト (ホストアドレスとポート) を取り、そのうちの 1
つに接続する。WSAConnectByList
関数は、アプリケーションが候補ノードのリストから接続可能な任意のノードに接続する必要があるピアツーピアコラボレーションシナリオをサポートするよう設計されている。WSAConnectByList
は IPv6 と IPv4
の両バージョンに対応する。考えられる接続先の集合は、アドレスのリストとして呼び出し元が提供する。WSAConnectByList
は、単に考えられる複数の接続先アドレスのいずれかへの接続を試みるだけではない。具体的には、呼び出し元から渡されたすべてのリモートアドレスとすべてのローカルアドレスを取り、成功の可能性が最も高いアドレスペアから順に接続を試みる。これにより、WSAConnectByList
は接続が可能な場合は必ず接続を確立するだけでなく、接続確立までの時間も最小化する。呼び出し元は LocalAddress および
RemoteAddress のバッファと長さを指定して、接続が正常に確立されたローカル・リモートアドレスを受け取れる。timeout
パラメータにより、接続確立に費やす時間を制限できる。内部的には WSAConnectByList は複数の操作 (接続試行)
を実行する。各操作の合間にタイムアウトを超過していないかを確認し、超過していれば呼び出しを中止する。個別の操作 (connect)
がタイムアウト超過時点で中断されるわけではないため、WSAConnectByList 呼び出しは timeout
パラメータで指定した値より長くかかってタイムアウトすることがある点に注意。WSAConnectByList には制約がある:
SOCK_STREAM のような接続指向ソケットでのみ動作する。オーバーラップ I/O
やノンブロッキング動作はサポートしない。ソケットがノンブロッキングモードであっても WSAConnectByList
はブロックする。WSAConnectByList は、呼び出し元から渡された各種アドレスに対して 1
つずつ接続を試みる。これらの接続試行はそれぞれ異なるエラーコードで失敗する可能性がある。返せるエラーコードは 1
つだけなので、返される値は最後の接続試行のエラーコードとなる。IPv6 と IPv4
の両方のアドレスを関数が受け付ける単一のアドレスリストで渡せるようにするには、関数呼び出し前に次の手順を踏む必要がある。
（以下省略）


%index
WSAConnectByNameW
指定したホストとポートへの接続を確立する。(Unicode)
%prm
s, nodename, servicename, LocalAddressLength, LocalAddress, RemoteAddressLength, RemoteAddress, timeout, Reserved
s : [int] 未接続のソケットを識別するディスクリプタ。注 Windows 7、Windows Server 2008 R2 以前では、WSAConnectByName 関数はバインドされておらず、未接続のソケットを必要とする。これは WSAConnect など接続確立のための他の Winsock 呼び出しと異なる。
nodename : [wstr] IPv4 または IPv6 で接続するホストの名前、またはホストの IP アドレスを格納する NULL 終端文字列。
servicename : [wstr] IPv4 または IPv6 で接続するホスト上のサービス名または接続先ポートを格納する NULL 終端文字列。サービス名はポート番号の文字列エイリアスである。たとえば "http" は、HTTP プロトコルで Web サーバが既定で使用するポートとして IETF が定めたポート 80 のエイリアスである。ポート番号を指定しない場合の servicename パラメータとして使用可能な値は、次のファイルに列挙されている: %WINDIR%\system32\drivers\etc\services
LocalAddressLength : [var] 入力時、呼び出し元が用意した LocalAddress バッファのサイズ (バイト単位) へのポインタ。出力時、呼び出しが成功した際にシステムが LocalAddress バッファに格納したローカルアドレス用 SOCKADDR のサイズ (バイト単位) へのポインタ。
LocalAddress : [var] 接続のローカルアドレスを受け取る SOCKADDR 構造体へのポインタ。パラメータのサイズは LocalAddressLength で返されるサイズと完全に一致する。これは getsockname 関数が返すのと同じ情報である。このパラメータは NULL でもよく、その場合 LocalAddressLength パラメータは無視される。
RemoteAddressLength : [var] 入力時、呼び出し元が用意した RemoteAddress バッファのサイズ (バイト単位) へのポインタ。出力時、呼び出しが成功した際にシステムが RemoteAddress バッファに格納したリモートアドレス用 SOCKADDR のサイズ (バイト単位) へのポインタ。
RemoteAddress : [var] 接続のリモートアドレスを受け取る SOCKADDR 構造体へのポインタ。これは getpeername 関数が返すのと同じ情報である。このパラメータは NULL でもよく、その場合 RemoteAddressLength は無視される。
timeout : [var] リモートアプリケーションからの応答を待ってから呼び出しを中止するまでの時間 (ミリ秒)。
Reserved : [var] 将来の実装のために予約されている。このパラメータは NULL に設定しなければならない。
%inst
指定したホストとポートへの接続を確立する。(Unicode)

[戻り値]
接続が確立された場合、WSAConnectByName は TRUE を返し、呼び出し元がバッファを提供していれば
LocalAddress および RemoteAddress パラメータに値が設定される。呼び出しが失敗した場合は FALSE
を返す。その後、WSAGetLastError を呼び出して拡張エラー情報を取得できる。
（以下省略）

[備考]
WSAConnectByName は、指定のポートでリモートホストに高速かつ透過的に接続するために提供されている。IPv6 と IPv4
の両バージョンに対応する。
（以下省略）


%index
WSACreateEvent
WSACreateEvent 関数は、新しいイベントオブジェクトを作成する。
%prm

%inst
WSACreateEvent 関数は、新しいイベントオブジェクトを作成する。

[戻り値]
エラーがない場合、WSACreateEvent はイベントオブジェクトのハンドルを返す。そうでない場合の戻り値は
WSA_INVALID_EVENT である。拡張エラー情報を取得するには、WSAGetLastError を呼び出す。
（以下省略）

[備考]
WSACreateEvent
関数は、初期状態が非シグナル状態の手動リセットイベントオブジェクトを作成する。返されるイベントオブジェクトのハンドルは子プロセスから継承できない。イベントオブジェクトには名前がない。WSASetEvent
関数を呼び出すとイベントオブジェクトの状態をシグナル状態に設定できる。WSAResetEvent
関数を呼び出すとイベントオブジェクトの状態を非シグナル状態に設定できる。イベントオブジェクトが不要になったら、WSACloseEvent
関数を呼び出して関連するリソースを解放すべきである。Windows Sockets 2 のイベントオブジェクトは Windows
環境ではシステムオブジェクトである。したがって、Windows
アプリケーションで手動リセットではなく自動リセットイベントを使いたい場合は、アプリケーションから直接 CreateEvent
関数を呼び出せばよい。イベントオブジェクトのスコープは生成したプロセス内に限られる。Windows Phone 8: この関数は
Windows Phone 8 以降の Windows Phone ストアアプリでサポートされる。Windows 8.1 および
Windows Server 2012 R2: この関数は、Windows 8.1、Windows Server 2012 R2 以降の
Windows ストアアプリでサポートされる。


%index
WSADuplicateSocketW
WSADuplicateSocket 関数は、共有ソケット用の新しいソケットディスクリプタを作成するために使える WSAPROTOCOL_INFO 構造体を返す。WSADuplicateSocket 関数は QoS 対応ソケットには使用できない。(Unicode)
%prm
s, dwProcessId, lpProtocolInfo
s : [int] ローカルソケットを識別するディスクリプタ。
dwProcessId : [int] 複製されたソケットを使用するターゲットプロセスのプロセス ID。
lpProtocolInfo : [var] クライアントが確保した、WSAPROTOCOL_INFO 構造体を格納できるだけの大きさを持つバッファへのポインタ。サービスプロバイダはプロトコル情報構造体の内容をこのバッファにコピーする。
%inst
WSADuplicateSocket 関数は、共有ソケット用の新しいソケットディスクリプタを作成するために使える
WSAPROTOCOL_INFO 構造体を返す。WSADuplicateSocket 関数は QoS
対応ソケットには使用できない。(Unicode)

[戻り値]
エラーがない場合、WSADuplicateSocket はゼロを返す。そうでない場合は SOCKET_ERROR
を返し、WSAGetLastError を呼び出すことで特定のエラーコードを取得できる。
（以下省略）

[備考]
WSADuplicateSocket 関数は、プロセス間でのソケット共有を可能にするために使用される。ソースプロセスは
WSADuplicateSocket を呼び出して特殊な WSAPROTOCOL_INFO 構造体を取得する。何らかのプロセス間通信
(IPC) 機構を使ってこの構造体の内容をターゲットプロセスに渡し、ターゲットプロセスはそれを WSASocket
の呼び出しに使って複製されたソケットのディスクリプタを取得する。特殊な WSAPROTOCOL_INFO
構造体は、ターゲットプロセスで一度だけ使用できる。ソケットディスクリプタはプロセス内のすべてのスレッドで有効なため、WSADuplicateSocket
関数を使わずとも、プロセス内のスレッド間ではソケットを共有できる。共有ソケットを確立して受け渡す 1 つのシナリオを次の表に示す。
（以下省略）


%index
WSAEnumNameSpaceProvidersW
WSAEnumNameSpaceProviders 関数は、利用可能なネームスペースプロバイダに関する情報を取得する。(Unicode)
%prm
lpdwBufferLength, lpnspBuffer
lpdwBufferLength : [var] 入力時、lpnspBuffer が指すバッファに含まれるバイト数。出力時 (関数が WSAEFAULT エラーで失敗した場合)、要求したすべての情報を取得するために lpnspBuffer に渡す必要がある最小バイト数。WSAEnumNameSpaceProviders に渡すバッファは、すべての名前空間情報を格納するのに十分でなければならない。
lpnspBuffer : [var] WSANAMESPACE_INFO 構造体で埋められるバッファ。返される構造体はバッファの先頭に連続して配置される。構造体内のポインタが参照する可変サイズ情報は、固定サイズ構造体の終端とバッファ終端の間の位置を指す。埋められた構造体の数は WSAEnumNameSpaceProviders の戻り値となる。
%inst
WSAEnumNameSpaceProviders 関数は、利用可能なネームスペースプロバイダに関する情報を取得する。(Unicode)

[戻り値]
WSAEnumNameSpaceProviders 関数は、lpnspBuffer にコピーされた WSANAMESPACE_INFO
構造体の数を返す。そうでない場合は SOCKET_ERROR を返し、WSAGetLastError
を呼び出すことで特定のエラー番号を取得できる。
（以下省略）

[備考]
WSAEnumNameSpaceProviders 関数は、利用可能なネームスペースプロバイダに関する情報を lpnspBuffer
パラメータが指すバッファに返す。返されるバッファには、先頭に連続して配置された WSANAMESPACE_INFO
構造体の配列が含まれる。WSANAMESPACE_INFO 構造体内のポインタが参照する可変サイズ情報は、固定サイズの
WSANAMESPACE_INFO 構造体の終端とバッファ終端の間の位置を指す。埋められた WSANAMESPACE_INFO
構造体の数は WSAEnumNameSpaceProviders 関数の戻り値として返される。各 WSANAMESPACE_INFO
構造体のエントリには、当該ネームスペースプロバイダのインストール時に WSCInstallNameSpace および
WSCInstallNameSpace32
関数に渡された名前空間エントリのプロバイダ固有情報が含まれる。WSAEnumNameSpaceProvidersEx 関数は
WSAEnumNameSpaceProviders 関数の拡張版である。WSCEnumNameSpaceProvidersEx32 関数は
WSAEnumNameSpaceProviders 関数の拡張版で、64 ビットプラットフォーム上で使用するために利用可能な 32
ビットネームスペースプロバイダの情報を返す。サンプルコード 次の例は、WSAEnumNameSpaceProviders
関数を使って利用可能なネームスペースプロバイダ情報を取得する方法を示す。
（以下省略）


%index
WSAEnumNameSpaceProvidersExW
利用可能なネームスペースプロバイダに関する情報を取得する。(Unicode)
%prm
lpdwBufferLength, lpnspBuffer
lpdwBufferLength : [var] 入力時、lpnspBuffer が指すバッファに含まれるバイト数。出力時 (関数が WSAEFAULT エラーで失敗した場合)、要求したすべての情報を取得するために lpnspBuffer バッファに割り当てる必要がある最小バイト数。WSAEnumNameSpaceProvidersEx に渡すバッファは、すべての名前空間情報を格納するのに十分でなければならない。
lpnspBuffer : [var] WSANAMESPACE_INFOEX 構造体で埋められるバッファ。返される構造体はバッファの先頭に連続して配置される。構造体内のポインタが参照する可変サイズ情報は、固定サイズ構造体の終端とバッファ終端の間の位置を指す。埋められた構造体の数は WSAEnumNameSpaceProvidersEx の戻り値となる。
%inst
利用可能なネームスペースプロバイダに関する情報を取得する。(Unicode)

[戻り値]
WSAEnumNameSpaceProvidersEx 関数は、lpnspBuffer にコピーされた
WSANAMESPACE_INFOEX 構造体の数を返す。そうでない場合は SOCKET_ERROR
を返し、WSAGetLastError を呼び出すことで特定のエラー番号を取得できる。
（以下省略）

[備考]
WSAEnumNameSpaceProvidersEx 関数は WSAEnumNameSpaceProviders
関数の拡張版である。WSCInstallNameSpaceEx 関数の lpProviderInfo
パラメータに渡された名前空間エントリに関連付けられたプロバイダ固有のデータブロブは、WSAEnumNameSpaceProvidersEx
関数で問い合わせることができる。現状、Windows に含まれるネームスペースプロバイダのうち WSANAMESPACE_INFOEX
構造体の ProviderSpecific メンバに情報を設定するのは NS_EMAIL プロバイダのみである。NS_EMAIL
ネームスペースプロバイダの場合、ProviderSpecific メンバの形式は
NAPI_PROVIDER_INSTALLATION_BLOB 構造体である。UNICODE または _UNICODE
が定義されている場合、WSAEnumNameSpaceProvidersEx は Unicode 版の
WSAEnumNameSpaceProvidersExW として定義される。lpnspBuffer パラメータは
LPSAWSANAMESPACE_INFOEXW データ型として定義され、成功時には WSANAMESPACE_INFOEXW
構造体が返される。UNICODE または _UNICODE が定義されていない場合、WSAEnumNameSpaceProvidersEx
は ANSI 版の WSAEnumNameSpaceProvidersExA として定義される。lpnspBuffer パラメータは
LPSAWSANAMESPACE_INFOEXA データ型として定義され、成功時には WSANAMESPACE_INFOEXA
構造体が返される。Windows 8.1 および Windows Server 2012 R2:
WSAEnumNameSpaceProvidersExW 関数は、Windows 8.1、Windows Server 2012 R2
以降の Windows ストアアプリでサポートされる。
> [!NOTE] > winsock2.h ヘッダは、UNICODE プリプロセッサ定数の定義に基づいて本関数の ANSI 版と
Unicode 版を自動的に選択するエイリアスとして WSAEnumNameSpaceProvidersEx
を定義している。エンコーディング中立なエイリアスとエンコーディング中立でないコードを混在させると、コンパイルエラーや実行時エラーを招く不整合が発生しうる。詳しくは
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
WSAEnumNetworkEvents
WSAEnumNetworkEvents 関数は、指定したソケットに対するネットワークイベントの発生を検出し、内部のネットワークイベント記録をクリアし、イベントオブジェクトをリセットする (オプション)。
%prm
s, hEventObject, lpNetworkEvents
s : [int] ソケットを識別するディスクリプタ。
hEventObject : [intptr] リセットする関連イベントオブジェクトを識別するオプションのハンドル。
lpNetworkEvents : [var] 発生したネットワークイベントと関連エラーコードの記録を格納する WSANETWORKEVENTS 構造体へのポインタ。
%inst
WSAEnumNetworkEvents
関数は、指定したソケットに対するネットワークイベントの発生を検出し、内部のネットワークイベント記録をクリアし、イベントオブジェクトをリセットする
(オプション)。

[戻り値]
操作が成功すれば戻り値はゼロである。そうでない場合は SOCKET_ERROR を返し、WSAGetLastError
を呼び出すことで特定のエラー番号を取得できる。
（以下省略）

[備考]
WSAEnumNetworkEvents
関数は、前回この関数を呼び出してから指定したソケットに対してどのネットワークイベントが発生したかを調べるために使用される。1
つ以上のネットワークイベントにイベントオブジェクトを関連付ける WSAEventSelect
と組み合わせて使うことを想定している。ネットワークイベントの記録は、lNetworkEvents パラメータを 0 以外で
WSAEventSelect を呼び出した時点から開始され、lNetworkEvents を 0 に設定して WSAEventSelect
を呼び出すか、WSAAsyncSelect が呼び出されるまで有効である。WSAEnumNetworkEvents
は、WSAEventSelect で指定されたネットワーク活動とエラーだけを報告する。select と WSAAsyncSelect
がネットワーク活動とエラーをどのように報告するかは、それぞれの説明を参照。ソケットの内部ネットワークイベント記録は
lpNetworkEvents が参照する構造体にコピーされ、その後内部のネットワークイベント記録はクリアされる。hEventObject
パラメータが NULL でなければ、指定したイベントオブジェクトもリセットされる。Windows Sockets
プロバイダは、ネットワークイベント記録のコピー、そのクリア、関連付けられたイベントオブジェクトのリセットという一連の操作が原子的であることを保証する。したがって、次に指定ネットワークイベントが発生するとイベントオブジェクトが設定状態になる。この関数が
SOCKET_ERROR
を返す場合、関連イベントオブジェクトはリセットされず、ネットワークイベント記録もクリアされない。WSANETWORKEVENTS 構造体の
lNetworkEvents メンバは、発生した FD_XXX ネットワークイベントを示す。iErrorCode
配列は、lNetworkEvents
中のイベントビット位置に対応する添字で関連エラーコードを格納するのに使用される。FD_READ_BIT や FD_WRITE_BIT
といった識別子を iErrorCode 配列の添字として使える。iErrorCode 配列のうち、lNetworkEvents
パラメータでセットされているビットに対応する要素のみが設定される。その他のパラメータは変更されない (これは、新しい
FD_ROUTING_INTERFACE_CHANGE や FD_ADDRESS_LIST_CHANGE
イベントを認識しないアプリケーションとの後方互換性のために重要である)。対応するネットワークイベントとともに返されうるエラーコードを次に示す。イベント:
FD_CONNECT
（以下省略）


%index
WSAEnumProtocolsW
WSAEnumProtocols 関数は、利用可能なトランスポートプロトコルに関する情報を取得する。(Unicode)
%prm
lpiProtocols, lpProtocolBuffer, lpdwBufferLength
lpiProtocols : [var] iProtocol 値の NULL 終端配列。このパラメータはオプションで、lpiProtocols が NULL の場合は利用可能なすべてのプロトコルの情報が返される。そうでない場合、配列に列挙されたプロトコルの情報のみが取得される。
lpProtocolBuffer : [var] WSAPROTOCOL_INFO 構造体で埋められるバッファへのポインタ。
lpdwBufferLength : [var] 入力時、WSAEnumProtocols に渡される lpProtocolBuffer バッファのバイト数。出力時、要求したすべての情報を取得するために WSAEnumProtocols に渡すことができる最小バッファサイズ。このルーチンは複数の呼び出しにわたって列挙する機能を持たず、ルーチンが成功するためには渡されるバッファがすべてのエントリを保持できる大きさでなければならない。これにより API の複雑さが減り、通常コンピュータにロードされているプロトコル数は少ないので問題にはならない。
%inst
WSAEnumProtocols 関数は、利用可能なトランスポートプロトコルに関する情報を取得する。(Unicode)

[戻り値]
エラーがない場合、WSAEnumProtocols は報告されるプロトコルの数を返す。そうでない場合は SOCKET_ERROR
を返し、WSAGetLastError を呼び出すことで特定のエラーコードを取得できる。
（以下省略）

[備考]
WSAEnumProtocols
関数は、ローカルコンピュータにインストールされたトランスポートプロトコル群の情報を調べるために使用される。レイヤードプロトコルは、プロトコルチェーンにインストールされている場合のみアプリケーションから使用できる。レイヤードプロトコル自体の情報は返されないが、チェーン長ゼロでインストールされたダミーのレイヤードサービスプロバイダ
(LSP) は lpProtocolBuffer に含まれる。注 レイヤードサービスプロバイダは非推奨となった。Windows 8 および
Windows Server 2012 以降では、Windows Filtering Platform
を使用すべきである。lpiProtocols
パラメータは、返される情報量を制限するフィルタとして使用できる。多くの場合、lpiProtocols に NULL
ポインタを指定し、利用可能なすべてのトランスポートプロトコルとプロトコルチェーンの情報を取得する。WSAEnumProtocols
関数は、WSCEnumProtocols および WSCEnumProtocols32
関数と異なり、インストール済みのすべてのプロトコルの WSAPROTOCOL_INFO 構造体を返さない。WSAEnumProtocols
関数は、サービスプロバイダが WSAPROTOCOL_INFO 構造体の dwProviderFlags メンバに PFL_HIDDEN
フラグを設定したプロトコル (WSAEnumProtocols が生成する結果バッファに含めないよう Ws2_32.dll
に指示するもの) を除外する。さらに、WSAEnumProtocols 関数はチェーン長が 1 以上の WSAPROTOCOL_INFO
構造体 (LSP プロバイダ) のデータを返さない。WSAEnumProtocols は、PFL_HIDDEN
フラグが無く、プロトコルチェーン長がゼロでない基本プロトコルとプロトコルチェーンの情報のみを返す。要求された各プロトコルについて、lpProtocolBuffer
が指すバッファに WSAPROTOCOL_INFO 構造体が提供される。指定したバッファが十分でない場合
(lpdwBufferLength の入力値で示される)、lpdwBufferLength
が指す値は必要なバッファサイズを示すよう更新される。アプリケーションは十分に大きなバッファを用意して、WSAEnumProtocols
を再度呼び出すべきである。WSAPROTOCOL_INFO 構造体がバッファに現れる順序は、サービスプロバイダが WS2_32.DLL
経由でプロトコルエントリを登録した順序、または Windows Sockets アプリケーションや既定の TCP/IP
プロバイダ確立用に提供された DLL によって後から並べ替えが行われた場合の順序と一致する。Windows Phone 8:
WSAEnumProtocolsW 関数は Windows Phone 8 以降の Windows Phone
ストアアプリでサポートされる。Windows 8.1 および Windows Server 2012 R2:
WSAEnumProtocolsW 関数は、Windows 8.1、Windows Server 2012 R2 以降の Windows
ストアアプリでサポートされる。


%index
WSAEventSelect
WSAEventSelect 関数は、指定した FD_XXX ネットワークイベントのセットに関連付けるイベントオブジェクトを指定する。
%prm
s, hEventObject, lNetworkEvents
s : [int] ソケットを識別するディスクリプタ。
hEventObject : [intptr] 指定した FD_XXX ネットワークイベントのセットに関連付けるイベントオブジェクトを識別するハンドル。
lNetworkEvents : [int] アプリケーションが関心を持つ FD_XXX ネットワークイベントの組み合わせを指定するビットマスク。
%inst
WSAEventSelect 関数は、指定した FD_XXX ネットワークイベントのセットに関連付けるイベントオブジェクトを指定する。

[戻り値]
アプリケーションのネットワークイベントと関連イベントオブジェクトの指定が成功した場合、戻り値はゼロである。そうでない場合は
SOCKET_ERROR を返し、WSAGetLastError を呼び出すことで特定のエラー番号を取得できる。select や
WSAAsyncSelect 関数と同様、WSAEventSelect は即時成功を期待してデータ転送操作 (send や recv)
を発行できるタイミングを知るためによく使われる。とはいえ、堅牢なアプリケーションは、イベントオブジェクトがセットされてから発行した
Winsock 呼び出しが即座に WSAEWOULDBLOCK
を返す可能性にも備えなければならない。たとえば次のような操作の並びが起こりうる。
（以下省略）

[備考]
WSAEventSelect 関数は、選択した FD_XXX ネットワークイベント (lNetworkEvents)
に関連付けるイベントオブジェクト (hEventObject) を指定するために使用する。イベントオブジェクトを指定するソケットは s
パラメータで識別する。指定したネットワークイベントのいずれかが発生すると、イベントオブジェクトがセットされる。WSAEventSelect
関数の動作は WSAAsyncSelect
とよく似ており、違いは指定されたネットワークイベント発生時に行う動作である。WSAAsyncSelect 関数はアプリケーション指定の
Windows メッセージを投稿させる。WSAEventSelect
は関連付けられたイベントオブジェクトを設定し、このイベントの発生を内部のネットワークイベント記録に記録する。アプリケーションは
WSAWaitForMultipleEvents
を使ってイベントオブジェクトを待機またはポーリングし、WSAEnumNetworkEvents
を使って内部のネットワークイベント記録の内容を取得し、指定したネットワークイベントのうちどれが発生したかを特定できる。WSAEventSelect
関数で使用するイベントオブジェクトの状態を正しくリセットするには、hEventObject
パラメータにそのイベントオブジェクトのハンドルを指定して WSAEnumNetworkEvents
関数に渡せばよい。これにより、イベントオブジェクトがリセットされ、ソケット上のアクティブな FD
イベントの状態が原子的に調整される。ネットワーク活動とエラーを記録して WSAEnumNetworkEvents
経由で取得できるようにするのは WSAEventSelect のみである。select と WSAAsyncSelect
がネットワーク活動とエラーをどのように報告するかは、それぞれの説明を参照。WSAEventSelect
関数は、lNetworkEvents の値にかかわらずソケット s を自動的にノンブロッキングモードに設定する。ソケット s
をブロッキングモードに戻すには、まず WSAEventSelect を lNetworkEvents を 0 かつ
hEventObject を NULL に設定して呼び出し、ソケット s
に関連付けられたイベントレコードをクリアする必要がある。その後、ioctlsocket または WSAIoctl
を呼び出してソケットをブロッキングモードに戻せる。lNetworkEvents パラメータは、次のリストに示す値をビット単位の OR
演算子で組み合わせて構築する。
（以下省略）


%index
WSAGetLastError
WSAGetLastError 関数 (winsock.h) は、最後に失敗した Windows Sockets 操作のエラーステータスを返す。
%prm

%inst
WSAGetLastError 関数 (winsock.h) は、最後に失敗した Windows Sockets
操作のエラーステータスを返す。

[戻り値]
戻り値は、このスレッドで最後に失敗した Windows Sockets 操作のエラーコードを示す。

[備考]
WSAGetLastError 関数は、呼び出し元スレッドで最後に発生したエラーを返す。特定の Windows Sockets
関数がエラー発生を示した場合、失敗した関数呼び出しの拡張エラーコードを取得するには、直ちにこの関数を呼び出すべきである。この拡張エラーコードは、getsockopt
を SO_ERROR の optname パラメータで呼び出したときに得られるエラーコードとは異なることがある。getsockopt
はソケット固有であるのに対し、WSAGetLastError
はすべてのスレッド固有ソケットに対して機能する。関数呼び出しの戻り値が、エラーまたは関連データがエラーコードに返されたことを示す場合は、直ちに
WSAGetLastError を呼び出すべきである。これは、一部の関数は成功時に最後の拡張エラーコードを 0
にリセットし、直前に失敗した関数が返した拡張エラーコードを上書きしてしまうことがあるため必要である。拡張エラーコードを明示的にリセットするには、iError
パラメータを 0 にして WSASetLastError 関数を呼び出す。SO_ERROR の optname パラメータで
getsockopt 関数を呼び出しても、拡張エラーコードはゼロにリセットされる。非同期メッセージの受信時に拡張エラー値を調べるのに
WSAGetLastError 関数を使うべきではない。この場合、拡張エラー値はメッセージの lParam
パラメータで渡されるため、WSAGetLastError が返す値とは異なることがある。
注 アプリケーションは、他の Windows ソケット関数の拡張エラーコードを調べるために、Windows Sockets
で通常行うのと同じように WSAGetLastError 関数を呼び出すことができる。これは、WSAStartup
関数が失敗した場合や、Windows Sockets 関数を呼び出す前に WSAStartup 関数を呼び出して Windows
Sockets を適切に初期化していない場合でも同様である。WSAGetLastError 関数は、WSAStartup
が失敗した場合でも呼び出せる Winsock 2.2 DLL 内の数少ない関数の 1 つである。
この関数が返す Windows Sockets 拡張エラーコードとエラーの説明文は、Windows Sockets
エラーコードに列挙されている。これらのエラーコードとそれに関連する簡単な説明は Winerror.h
ヘッダファイルに定義されている。FormatMessage
関数を使って、返されたエラーに対応するメッセージ文字列を取得できる。ソケットアプリケーションを Winsock
に移植する際のエラーコードの扱いについては、「Error Codes - errno, h_errno and
WSAGetLastError」を参照。
Windows Phone 8: この関数は Windows Phone 8 以降の Windows Phone
ストアアプリでサポートされる。Windows 8.1 および Windows Server 2012 R2: この関数は、Windows
8.1、Windows Server 2012 R2 以降の Windows ストアアプリでサポートされる。


%index
WSAGetOverlappedResult
WSAGetOverlappedResult 関数は、指定したソケットでのオーバーラップ操作の結果を取得する。
%prm
s, lpOverlapped, lpcbTransfer, fWait, lpdwFlags
s : [int] ソケットを識別するディスクリプタ。これは、オーバーラップ操作をサポートする Winsock 関数 (AcceptEx、ConnectEx、DisconnectEx、TransmitFile、TransmitPackets、WSARecv、WSARecvFrom、LPFN_WSARECVMSG (WSARecvMsg)、WSASend、WSASendMsg、WSASendTo、WSAIoctl) のいずれかでオーバーラップ操作を開始した時に指定したのと同じソケットである。
lpOverlapped : [var] オーバーラップ操作開始時に指定された WSAOVERLAPPED 構造体へのポインタ。このパラメータは NULL ポインタであってはならない。
lpcbTransfer : [var] 送信や受信、または WSAIoctl 関数によって実際に転送されたバイト数を受け取る 32 ビット変数へのポインタ。このパラメータは NULL ポインタであってはならない。
fWait : [int] 関数が保留中のオーバーラップ操作の完了を待つかを指定するフラグ。TRUE の場合、操作が完了するまで関数は戻らない。FALSE でかつ操作が保留中の場合、関数は FALSE を返し、WSAGetLastError 関数は WSA_IO_INCOMPLETE を返す。fWait パラメータを TRUE に設定できるのは、オーバーラップ操作がイベントベースの完了通知を選択している場合のみである。
lpdwFlags : [var] 完了ステータスを補う 1 つ以上のフラグを受け取る 32 ビット変数へのポインタ。オーバーラップ操作が WSARecv または WSARecvFrom で開始されていた場合、このパラメータには lpFlags パラメータの結果値が格納される。このパラメータは NULL ポインタであってはならない。
%inst
WSAGetOverlappedResult 関数は、指定したソケットでのオーバーラップ操作の結果を取得する。

[戻り値]
WSAGetOverlappedResult が成功した場合、戻り値は TRUE
である。これは、オーバーラップ操作が正常に完了し、lpcbTransfer
が指す値が更新されたことを意味する。WSAGetOverlappedResult が FALSE
を返した場合、オーバーラップ操作が完了していないか、エラー付きで完了したか、WSAGetOverlappedResult への 1
つ以上のパラメータのエラーによりオーバーラップ操作の完了ステータスを特定できなかったかのいずれかを意味する。失敗時は、lpcbTransfer
が指す値は更新されない。失敗の原因 (WSAGetOverlappedResult
関数自身の原因か、関連付けられたオーバーラップ操作の原因か) を調べるには WSAGetLastError を使用する。
（以下省略）

[備考]
WSAGetOverlappedResult 関数は、s パラメータで指定したソケットに対する lpOverlapped
パラメータで指定したオーバーラップ操作の結果を報告する。WSAGetOverlappedResult
関数には、オーバーラップ関数が呼ばれた時に指定したソケットディスクリプタと WSAOVERLAPPED
構造体を渡す。操作が保留中であることは、操作を開始した関数が FALSE を返し、WSAGetLastError 関数が
WSA_IO_PENDING を返すことで示される。WSARecv のような I/O 操作が保留状態にある場合、操作を開始した関数は
WSAOVERLAPPED 構造体の hEvent
メンバを非シグナル状態にリセットする。その後、保留中の操作が完了するとシステムはイベントオブジェクトをシグナル状態に設定する。fWait
パラメータが TRUE の場合、WSAGetOverlappedResult
はイベントオブジェクトがシグナル状態になるのを待って、保留操作が完了したかを判断する。クライアントは、I/O
操作要求時にイベントベースの完了通知を選択している場合に限り、fWait パラメータを TRUE
に設定してよい。別の通知方式を選んでいる場合、WSAOVERLAPPED 構造体の hEvent パラメータの用途が異なり、fWait を
TRUE に設定すると結果は予測不能である。Windows Vista で WSAGetOverlappedResult 関数が
lpOverlapped、lpcbTransfer、lpdwFlags のいずれかのパラメータを NULL
ポインタとして呼び出されると、アクセス違反となる。Windows Server 2003 以前で
WSAGetOverlappedResult 関数が同様に呼び出されると、WSAEFAULT エラーコードが返される。注
スレッド終了時にはすべての I/O
がキャンセルされる。オーバーラップソケットでは、操作完了前にスレッドがクローズされると保留中の非同期操作が失敗することがある。詳しくは
ExitThread を参照。Windows Phone 8: この関数は Windows Phone 8 以降の Windows
Phone ストアアプリでサポートされる。Windows 8.1 および Windows Server 2012 R2:
この関数は、Windows 8.1、Windows Server 2012 R2 以降の Windows ストアアプリでサポートされる。


%index
WSAGetQOSByName
WSAGetQOSByName 関数は、名前付きテンプレートに基づいて QOS 構造体を初期化するか、利用可能なテンプレート名の列挙を取得するためのバッファを提供する。
%prm
s, lpQOSName, lpQOS
s : [int] ソケットを識別するディスクリプタ。
lpQOSName : [var] 特定の QoS テンプレートへのポインタ。
lpQOS : [var] 値を格納する QOS 構造体へのポインタ。
%inst
WSAGetQOSByName 関数は、名前付きテンプレートに基づいて QOS
構造体を初期化するか、利用可能なテンプレート名の列挙を取得するためのバッファを提供する。

[戻り値]
WSAGetQOSByName が成功した場合、戻り値は TRUE である。関数が失敗した場合、戻り値は FALSE
である。拡張エラー情報を取得するには、WSAGetLastError を呼び出す。
（以下省略）

[備考]
WSAGetQOSByName 関数は、アプリケーションが QOS
構造体を特定のサービスクラスやメディアタイプに合った既知の値セットで初期化するために使用する。これらの値は既知の名前で参照されるテンプレートに格納されている。クライアントは、lpQOSName
が指す WSABUF 構造体の buf パラメータを非ゼロ長の文字列 (テンプレート名)
に設定することでこれらの値を取得できる。この場合、lpQOSName は入力専用として使われ、結果は lpQOS
に返される。代わりにこの関数を使って利用可能なテンプレート名の列挙を取得することもできる。その場合、クライアントは lpQOSName
が指す WSABUF の buf パラメータを長さ 0 の NULL 終端文字列に設定する。この場合、buf
が指すバッファは、lpQOSName が指す WSABUF の len パラメータで示される範囲内に収まる限りの、NULL
終端された利用可能なテンプレート名の並びで上書きされる。名前のリストは、長さ 0 の名前で終端される。WSAGetQOSByName
関数をテンプレート名の取得に使用する場合、lpQOS パラメータは無視される。


%index
WSAGetServiceClassInfoW
WSAGetServiceClassInfo 関数は、指定したネームスペースプロバイダから、指定したサービスクラスに関するクラス情報 (スキーマ) を取得する。(Unicode)
%prm
lpProviderId, lpServiceClassId, lpdwBufSize, lpServiceClassInfo
lpProviderId : [var] 特定のネームスペースプロバイダを識別する GUID へのポインタ。
lpServiceClassId : [var] サービスクラスを識別する GUID へのポインタ。
lpdwBufSize : [var] 入力時、lpServiceClassInfo パラメータが指すバッファに含まれるバイト数。出力時、関数が失敗しエラーが WSAEFAULT である場合、このパラメータはレコードを取得するために lpServiceClassInfo が指すバッファに必要な最小サイズ (バイト単位) を示す。
lpServiceClassInfo : [var] 指定したネームスペースプロバイダから取得した、指定したサービスクラスに関するサービスクラス情報を含む WSASERVICECLASSINFO 構造体へのポインタ。
%inst
WSAGetServiceClassInfo 関数は、指定したネームスペースプロバイダから、指定したサービスクラスに関するクラス情報
(スキーマ) を取得する。(Unicode)

[戻り値]
WSAGetServiceClassInfo が成功した場合、戻り値はゼロである。そうでない場合は SOCKET_ERROR
を返し、WSAGetLastError を呼び出すことで特定のエラー番号を取得できる。
（以下省略）

[備考]
WSAGetServiceClassInfo
関数は、ネームスペースプロバイダからサービスクラス情報を取得する。特定のネームスペースプロバイダから取得したサービスクラス情報は、そのサービスクラスがインストールされた時点で指定されたクラス情報の完全な集合でないことがある。個別のネームスペースプロバイダは、自身がサポートする名前空間に関連するサービスクラス情報のみを保持すれば十分である。詳しくは
Service Class Data Structures のセクションを参照。
> [!NOTE] > winsock2.h ヘッダは、UNICODE プリプロセッサ定数の定義に基づいて本関数の ANSI 版と
Unicode 版を自動的に選択するエイリアスとして WSAGetServiceClassInfo
を定義している。エンコーディング中立なエイリアスとエンコーディング中立でないコードを混在させると、コンパイルエラーや実行時エラーを招く不整合が発生しうる。詳しくは
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
WSAGetServiceClassNameByClassIdW
WSAGetServiceClassNameByClassId 関数は、指定された型に関連付けられたサービスの名前を取得する。これは FTP や SNA といった一般的なサービス名であり、サービスの個別インスタンスの名前ではない。(Unicode)
%prm
lpServiceClassId, lpszServiceClassName, lpdwBufferLength
lpServiceClassId : [var] サービスクラスの GUID へのポインタ。
lpszServiceClassName : [wstr] サービス名へのポインタ。
lpdwBufferLength : [var] 入力時、lpszServiceClassName が返すバッファの長さ (文字数)。出力時、lpszServiceClassName にコピーされたサービス名の長さ (文字数)。
%inst
WSAGetServiceClassNameByClassId 関数は、指定された型に関連付けられたサービスの名前を取得する。これは
FTP や SNA といった一般的なサービス名であり、サービスの個別インスタンスの名前ではない。(Unicode)

[戻り値]
WSAGetServiceClassNameByClassId 関数は、成功時はゼロを返す。そうでない場合は SOCKET_ERROR
を返し、WSAGetLastError を呼び出すことで特定のエラー番号を取得できる。
（以下省略）

[備考]
> [!NOTE] > winsock2.h ヘッダは、UNICODE プリプロセッサ定数の定義に基づいて本関数の ANSI 版と
Unicode 版を自動的に選択するエイリアスとして WSAGetServiceClassNameByClassId
を定義している。エンコーディング中立なエイリアスとエンコーディング中立でないコードを混在させると、コンパイルエラーや実行時エラーを招く不整合が発生しうる。詳しくは
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
WSAHtonl
WSAHtonl 関数は、u_long をホストバイトオーダーからネットワークバイトオーダーに変換する。
%prm
s, hostlong, lpnetlong
s : [int] ソケットを識別するディスクリプタ。
hostlong : [int] ホストバイトオーダーの 32 ビット数値。
lpnetlong : [var] ネットワークバイトオーダーの数値を受け取る 32 ビット数値へのポインタ。
%inst
WSAHtonl 関数は、u_long をホストバイトオーダーからネットワークバイトオーダーに変換する。

[戻り値]
エラーがない場合、WSAHtonl はゼロを返す。そうでない場合は SOCKET_ERROR を返し、WSAGetLastError
を呼び出すことで特定のエラーコードを取得できる。
（以下省略）

[備考]
WSAHtonl 関数は、ホストバイトオーダーの 32 ビット数値を受け取り、ネットワークバイトオーダーの 32 ビット数値を
lpnetlong パラメータが指す 32 ビット数値に返す。s パラメータで渡されたソケットは、当該ソケットに関連付けられた
Winsock
カタログのプロトコルエントリに基づいて必要なネットワークバイトオーダーを決定するために使われる。この機能は、異なるネットワークバイトオーダーを使う
Winsock プロバイダをサポートする。ソケットが AF_INET または AF_INET6 アドレスファミリ用の場合、WSAHtonl
関数はホストバイトオーダーの IPv4 アドレスをネットワークバイトオーダーの IPv4 アドレスに変換するために使える。この関数は
hostlong パラメータが有効な IPv4 アドレスかどうかの検査は行わない。WSAHtonl 関数は、事前に WSAStartup
関数の呼び出しが成功して Winsock DLL がロードされていることを必要とする。AF_INET または AF_INET6
ファミリで使う場合、htonl 関数は Winsock DLL のロードを必要としない。Windows Phone 8: この関数は
Windows Phone 8 以降の Windows Phone ストアアプリでサポートされる。Windows 8.1 および
Windows Server 2012 R2: この関数は、Windows 8.1、Windows Server 2012 R2 以降の
Windows ストアアプリでサポートされる。


%index
WSAHtons
WSAHtons 関数は、u_short をホストバイトオーダーからネットワークバイトオーダーに変換する。
%prm
s, hostshort, lpnetshort
s : [int] ソケットを識別するディスクリプタ。
hostshort : [int] ホストバイトオーダーの 16 ビット数値。
lpnetshort : [var] ネットワークバイトオーダーの数値を受け取る 16 ビットバッファへのポインタ。
%inst
WSAHtons 関数は、u_short をホストバイトオーダーからネットワークバイトオーダーに変換する。

[戻り値]
エラーがない場合、WSAHtons はゼロを返す。そうでない場合は SOCKET_ERROR を返し、WSAGetLastError
を呼び出すことで特定のエラーコードを取得できる。
（以下省略）

[備考]
WSAHtons 関数は、ホストバイトオーダーの 16 ビット数値を受け取り、ネットワークバイトオーダーの 16 ビット数値を
lpnetshort パラメータが指す 16 ビット数値に返す。s パラメータで渡されたソケットは、当該ソケットに関連付けられた
Winsock
カタログのプロトコルエントリに基づいて必要なネットワークバイトオーダーを決定するために使われる。この機能は、異なるネットワークバイトオーダーを使う
Winsock プロバイダをサポートする。ソケットが AF_INET または AF_INET6 アドレスファミリ用の場合、WSAHtons
関数はホストバイトオーダーの IP ポート番号をネットワークバイトオーダーの IP ポート番号に変換するために使える。WSAHtons
関数は、事前に WSAStartup 関数の呼び出しが成功して Winsock DLL がロードされていることを必要とする。AF_INET
または AF_INET6 アドレスファミリで使う場合、htons 関数は Winsock DLL のロードを必要としない。Windows
Phone 8: この関数は Windows Phone 8 以降の Windows Phone
ストアアプリでサポートされる。Windows 8.1 および Windows Server 2012 R2: この関数は、Windows
8.1、Windows Server 2012 R2 以降の Windows ストアアプリでサポートされる。


%index
WSAInstallServiceClassW
WSAInstallServiceClass 関数は、名前空間内にサービスクラススキーマを登録する。(Unicode)
%prm
lpServiceClassInfo
lpServiceClassInfo : [var] サービスクラスから名前空間固有型へのマッピング情報。複数のマッピングを一度に扱える。
%inst
WSAInstallServiceClass 関数は、名前空間内にサービスクラススキーマを登録する。(Unicode)

[戻り値]
操作が成功すれば戻り値はゼロである。そうでない場合は SOCKET_ERROR を返し、WSAGetLastError
を呼び出すことで特定のエラー番号を取得できる。
（以下省略）

[備考]
> [!NOTE] > winsock2.h ヘッダは、UNICODE プリプロセッサ定数の定義に基づいて本関数の ANSI 版と
Unicode 版を自動的に選択するエイリアスとして WSAInstallServiceClass
を定義している。エンコーディング中立なエイリアスとエンコーディング中立でないコードを混在させると、コンパイルエラーや実行時エラーを招く不整合が発生しうる。詳しくは
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
WSAIoctl
WSAIoctl 関数は、ソケットのモードを制御する。
%prm
s, dwIoControlCode, lpvInBuffer, cbInBuffer, lpvOutBuffer, cbOutBuffer, lpcbBytesReturned, lpOverlapped, lpCompletionRoutine
s : [int] ソケットを識別するディスクリプタ。
dwIoControlCode : [int] 実行する操作の制御コード。
lpvInBuffer : [intptr] 入力バッファへのポインタ。
cbInBuffer : [int] 入力バッファのサイズ (バイト単位)。
lpvOutBuffer : [intptr] 出力バッファへのポインタ。
cbOutBuffer : [int] 出力バッファのサイズ (バイト単位)。
lpcbBytesReturned : [var] 実際の出力バイト数へのポインタ。
lpOverlapped : [var] WSAOVERLAPPED 構造体へのポインタ (非オーバーラップソケットでは無視される)。
lpCompletionRoutine : [int] 型: \_In_opt\_ [**LPWSAOVERLAPPED_COMPLETION_ROUTINE**](./nc-winsock2-lpwsaoverlapped_completion_routine.md) 注 操作完了時に呼び出される完了ルーチンへのポインタ (非オーバーラップソケットでは無視される)。備考を参照。
%inst
WSAIoctl 関数は、ソケットのモードを制御する。

[戻り値]
正常完了時、WSAIoctl はゼロを返す。そうでない場合は SOCKET_ERROR を返し、WSAGetLastError
を呼び出すことで特定のエラーコードを取得できる。
（以下省略）

[備考]
WSAIoctl
関数は、ソケット、トランスポートプロトコル、または通信サブシステムに関連する動作パラメータを設定または取得するために使用される。lpOverlapped
と lpCompletionRoutine の両方が NULL
の場合、この関数内のソケットは非オーバーラップソケットとして扱われる。非オーバーラップソケットでは lpOverlapped と
lpCompletionRoutine パラメータは無視され、関数は標準の ioctlsocket 関数と同様に動作する。ただし、ソケット
s がブロッキングモードであれば関数がブロックする可能性がある点が異なる。ソケット s
がノンブロッキングモードの場合、この関数は指定した操作を即座に完了できないと WSAEWOULDBLOCK
を返すことがある。この場合、アプリケーションはソケットをブロッキングモードに変更してリクエストを再発行するか、対応するネットワークイベント
(たとえば SIO_ROUTING_INTERFACE_CHANGE に対する
FD_ROUTING_INTERFACE_CHANGE、SIO_ADDRESS_LIST_CHANGE に対する
FD_ADDRESS_LIST_CHANGE) を Windows メッセージベース (WSAAsyncSelect)
またはイベントベース (WSAEventSelect)
の通知機構で待つことができる。オーバーラップソケットでは、即座に完了できない操作は開始され、後で完了が通知される。lpcbBytesReturned
パラメータが指す DWORD
値の返値は無視してよい。最終的な完了ステータスと返されたバイト数は、操作完了時に適切な完了方法がシグナルされたタイミングで取得できる。
IOCTL は、サービスプロバイダの実装によっては無期限にブロックしうる。アプリケーションが WSAIoctl
呼び出しでのブロックを許容できない場合、特にブロックしやすい次の IOCTL にはオーバーラップ I/O の使用が推奨される:
SIO_ADDRESS_LIST_CHANGE、SIO_FINDROUTE、SIO_FLUSH、SIO_GET_QOS、SIO_GET_GROUP_QOS、SIO_ROUTING_INTERFACE_CHANGE、SIO_SET_QOS、SIO_SET_GROUP_QOS。プロトコル固有の
IOCTL
の中にも特にブロックしやすいものがある。利用可能な情報については該当プロトコル固有の付録を確認する。lpCompletionRoutine
パラメータが指す完了ルーチンのプロトタイプは次のとおりである。
（以下省略）


%index
WSAIsBlocking
この関数は、Windows Sockets 2 仕様リビジョン 2.2.0 への準拠のため削除された。(WSAIsBlocking)
%prm

%inst
この関数は、Windows Sockets 2 仕様リビジョン 2.2.0 への準拠のため削除された。(WSAIsBlocking)


%index
WSAJoinLeaf
WSAJoinLeaf 関数は、リーフノードをマルチポイントセッションに参加させ、接続データを交換し、指定された FLOWSPEC 構造体に基づいて必要な QoS を指定する。
%prm
s, name, namelen, lpCallerData, lpCalleeData, lpSQOS, lpGQOS, dwFlags
s : [int] マルチポイントソケットを識別する記述子。
name : [var] このソケットを参加させるピアの名前。
namelen : [int] name の長さ (バイト単位)。
lpCallerData : [var] マルチポイントセッション確立時にピアへ転送されるユーザーデータへのポインタ。
lpCalleeData : [var] マルチポイントセッション確立時にピアから返されるユーザーデータへのポインタ。
lpSQOS : [var] ソケット s 用の FLOWSPEC 構造体へのポインタ。方向ごとに 1 つずつ指定する。
lpGQOS : [var] 将来のソケットグループ用に予約されている。ソケットグループ用の FLOWSPEC 構造体へのポインタ (該当する場合)。
dwFlags : [int] ソケットが送信側 (JL_SENDER_ONLY)、受信側 (JL_RECEIVER_ONLY)、またはその両方 (JL_BOTH) として振る舞うことを示すフラグ。
%inst
WSAJoinLeaf 関数は、リーフノードをマルチポイントセッションに参加させ、接続データを交換し、指定された FLOWSPEC
構造体に基づいて必要な QoS を指定する。

[戻り値]
エラーが発生しない場合、WSAJoinLeaf は新しく作成されたマルチポイントソケットの記述子となる SOCKET
型の値を返す。そうでない場合は INVALID_SOCKET が返され、WSAGetLastError
を呼び出して特定のエラーコードを取得できる。ブロッキングソケットでは戻り値は join
操作の成否を示す。非ブロッキングソケットでは、有効なソケット記述子が返された時点で join
操作が正常に開始されたことを示す。その後、join 操作が成功か失敗で完了したかを、元のソケット s に対する FD_CONNECT
通知で知ることができる。アプリケーションは WSAAsyncSelect または WSAEventSelect で FD_CONNECT
イベントに対する通知を登録し、関連するエラーコードを調べて join 操作の成否を判断しなければならない。join
操作の完了を検出するために select 関数を使うことはできない。また、マルチポイントセッションの join
試行が完了するまで、同じソケットに対する以降の WSAJoinLeaf 呼び出しはすべて WSAEALREADY
で失敗する。WSAJoinLeaf 操作が正常に完了した後の以降の呼び出しは通常 WSAEISCONN
で失敗する。ルート起動の参加を許容する c_root ソケットではこの例外があり、先行する WSAJoinLeaf が完了した後に別の
join を開始してもよい。戻り値がマルチポイントセッション参加の失敗を示している場合
(WSAECONNREFUSED、WSAENETUNREACH、WSAETIMEDOUT
など)、アプリケーションは同じソケットに対して再度 WSAJoinLeaf を呼び出せる。
このドキュメントは省略されている。

[備考]
WSAJoinLeaf
関数は、リーフノードをマルチポイントセッションに参加させるとともに、セッション参加時に発生するその他いくつかの補助的な処理を行う。ソケット
s
がバインドされていない場合、システムが一意な値をローカル関連付けに割り当て、ソケットはバインド済みとしてマークされる。WSAJoinLeaf
関数は、ソケット記述子を返す点 (WSAAccept と同様) と dwFlags 引数が追加されている点を除き、WSAConnect
と同じ引数およびセマンティクスを持つ。この関数の入力 s には、適切なマルチポイントフラグを立てて WSASocket
で作成したマルチポイントソケットのみを渡せる。返されるソケット記述子は、join
操作が完了するまでは利用できない。たとえばソケットが非ブロッキングモードにある場合、元のソケット s に対する
WSAAsyncSelect または WSAEventSelect で対応する FD_CONNECT
通知を受信した後に利用可能となる。ただし、この新しいソケット記述子に対して closesocket を呼び出して、保留中の join
操作をキャンセルすることはできる。マルチポイントセッションのルートアプリケーションは、複数のリーフノードを追加するために
WSAJoinLeaf を繰り返し呼び出してもよいが、保留中のマルチポイント接続要求は同時に最大 1 つまでである。詳しくは
Multipoint and Multicast Semantics
を参照。非ブロッキングソケットでは、接続を即座に完了できないことが多い。その場合、本関数はまだ使用不能なソケット記述子を返し、処理は続行される。このとき
WSAEWOULDBLOCK
のようなエラーコードは返されない。関数は正常に開始された旨を返したことになるからだ。最終的な成否は、クライアントが元のソケット s
に対して WSAAsyncSelect または WSAEventSelect のどちらで通知を登録したかによって通知される。いずれの場合も
FD_CONNECT で通知され、それに付随するエラーコードが成功か失敗の具体的理由を示す。WSAJoinLeaf
の完了通知を検出するために select 関数を使うことはできない。WSAJoinLeaf が返すソケット記述子は、入力ソケット s が
c_root か c_leaf かによって異なる。c_root ソケットに対して使用した場合、name
引数は追加するリーフノードを指定し、返されるソケット記述子は新規追加されたリーフノードに対応する c_leaf
ソケットとなる。新しく作られたソケットは、WSAAsyncSelect や WSAEventSelect で登録された非同期イベントを含め
s と同じプロパティを持つ。これはマルチポイントデータ交換ではなく、その特定の c_leaf に対するネットワークイベント通知
(FD_CLOSE など)
を受け取るために使う。マルチポイント実装によっては、ルートと個々のリーフノード間のサイドチャットにこのソケットを使うことを許可するものもある。対応するリーフノードが
closesocket を呼び出してマルチポイントセッションから離脱すると、このソケットに対して FD_CLOSE
通知が届く。対称的に、WSAJoinLeaf から返された c_leaf ソケットに対して closesocket
を呼ぶと、対応するリーフノード側のソケットは FD_CLOSE 通知を受け取る。c_leaf ソケットで WSAJoinLeaf
を呼び出した場合、name 引数はルートアプリケーション (ルート制御方式) または既存のマルチポイントセッション (非ルート制御方式)
のアドレスを含み、返されるソケット記述子は入力ソケット記述子と同じである。言い換えると、新しいソケット記述子は割り当てられない。ルート制御方式では、ルートアプリケーションは
listen 呼び出しで c_root ソケットをリスンモードに置く。リーフノードがセッションへの参加を要求すると、通常の
FD_ACCEPT 通知が配信される。ルートアプリケーションは通常の accept または WSAAccept
関数で新しいリーフノードを受け入れる。accept および WSAAccept の戻り値も、WSAJoinLeaf
から返されるものと同様の c_leaf
ソケット記述子である。ルート起動の参加とリーフ起動の参加の両方を許容するマルチポイント方式に対応するため、既にリスンモードの c_root
ソケットを WSAJoinLeaf
の入力として使用することも許される。引数によって直接または間接に指し示されるメモリ領域の確保は、呼び出し元の責任である。lpCallerData
は値引数で、マルチポイントセッション参加要求と一緒に送信されるユーザーデータを含む。lpCallerData が NULL
の場合、ユーザーデータはピアへ渡されない。lpCalleeData
は結果引数で、マルチポイントセッション確立の一部としてピアから返されるユーザーデータを格納する。lpCalleeData が指す
WSABUF 構造体の len メンバは、最初はアプリケーションが確保した buf
メンバ先のバッファ長を表す。ユーザーデータが返されなかった場合、len メンバはゼロに設定される。lpCalleeData
情報はマルチポイント join 操作の完了時点で有効になる。ブロッキングソケットでは WSAJoinLeaf
のリターン時、非ブロッキングソケットでは join 完了時 (元のソケット s に対する FD_CONNECT 通知後など)
である。lpCalleeData が NULL
の場合、ユーザーデータは返されない。ユーザーデータの正確な形式は、ソケットが属するアドレスファミリ固有のものである。マルチポイントセッション確立時、アプリケーションは
lpSQOS および lpGQOS 引数を使って、WSAIoctl の SIO_SET_QOS または SIO_SET_GROUP_QOS
オペコードで設定済みの QoS 仕様を上書きできる。lpSQOS 引数は、ソケット s 用の方向ごとの FLOWSPEC
構造体と、それに続く追加のプロバイダ固有引数を指定する。関連トランスポートプロバイダ全般または特定のソケット種別が QoS
要求に応えられない場合は、後述のエラーが返される。単方向ソケットでは、該当しない方向のフロー仕様値は無視される。プロバイダ固有引数を指定しない場合、lpCalleeData
が指す WSABUF 構造体の buf と len はそれぞれ NULL と 0 に設定すべきである。lpSQOS が NULL
のときは、アプリケーションが QoS を指定していないことを意味する。lpGQOS
は将来のソケットグループ用に予約されている。lpGQOS 引数はソケットグループ (該当する場合) 用の FLOWSPEC
構造体を方向ごとに指定し、続いてプロバイダ固有の追加引数を指定する。プロバイダ固有引数を指定しない場合、lpCalleeData が指す
WSABUF 構造体の buf と len はそれぞれ NULL と 0 に設定すべきである。lpGQOS が NULL
のときはアプリケーションがグループ QoS を指定していないことを意味する。s
がソケットグループの作成者でない場合、この引数は無視される。接続済みソケットが (何らかの理由で閉じられて)
壊れた場合、破棄して作り直すべきである。何か問題が発生したときは必要なソケットを破棄して作り直し、安定点に戻すのが最も安全である。注:
WSAJoinLeaf のようなブロッキング Winsock 呼び出しを発行すると、Winsock
はネットワークイベントの発生を待ってから呼び出しを完了する場合がある。この待機はアラート可能な待機で、同じスレッドにスケジュールされた
APC によって中断され得る。他のブロッキング Winsock 呼び出しを中断中の APC 内からさらにブロッキング Winsock
呼び出しを発行すると未定義動作となるため、Winsock クライアントは決してそれを行ってはならない。Windows Phone 8:
この関数は Windows Phone 8 以降の Windows Phone ストアアプリでサポートされる。Windows 8.1
および Windows Server 2012 R2: この関数は Windows 8.1、Windows Server 2012 R2
以降の Windows ストアアプリでサポートされる。


%index
WSALookupServiceBeginW
WSALookupServiceBegin 関数は、WSAQUERYSET 構造体に格納された情報によって制約されたクライアント問い合わせを開始する。(Unicode)
%prm
lpqsRestrictions, dwControlFlags, lphLookup
lpqsRestrictions : [var] 検索条件へのポインタ。詳細は備考を参照。
dwControlFlags : [int] 検索の深さを制御するフラグの集合。dwControlFlags 引数に指定可能な値は Winsock2.h ヘッダファイルに定義されており、以下のオプションを組み合わせて指定できる。
lphLookup : [intptr] 結果セットの取得を開始するために WSALookupServiceNext 呼び出し時に使用するハンドル。
%inst
WSALookupServiceBegin 関数は、WSAQUERYSET
構造体に格納された情報によって制約されたクライアント問い合わせを開始する。(Unicode)

[戻り値]
操作が成功した場合の戻り値はゼロ。そうでない場合は SOCKET_ERROR が返され、WSAGetLastError
を呼び出すことで特定のエラー番号を取得できる。
このドキュメントは省略されている。

[備考]
lpqsRestrictions 引数は WSAQUERYSET 構造体を含むバッファを指す。WSALookupServiceBegin
を呼び出す前に、少なくとも WSAQUERYSET の dwSize
メンバにはバッファ長を設定しておかなければならない。アプリケーションは WSAQUERYSET
の他のメンバを指定することで検索を絞り込める。多くの場合、特定のトランスポートプロトコルにのみ関心があるアプリケーションは
dwNameSpace で名前空間を指定するのではなく、dwNumberOfProtocols と lpafpProtocols
を使ってアドレスファミリとプロトコルで検索を絞るべきである。サポートされているネットワークトランスポートプロトコルの情報は
EnumProtocols、WSAEnumProtocols、WSCEnumProtocols、WSCEnumProtocols32
関数で取得できる。検索を単一の名前空間に限定することも可能で、たとえば DNS からのみ結果を得たい場合は dwNameSpace を
NS_DNS に設定する。Bluetooth デバイス検出であれば dwNameSpace を NS_BTH
に設定する。lpNSProviderId メンバにプロバイダの GUID
を指定することで、検索を特定のネームスペースプロバイダに限定することもできる。ローカルコンピュータのネームスペースプロバイダ情報は
WSAEnumNameSpaceProviders、WSAEnumNameSpaceProvidersEx、WSCEnumNameSpaceProviders32、WSCEnumNameSpaceProvidersEx32
関数で取得できる。呼び出しで LUP_CONTAINERS
を指定する場合、他の制限値は指定しない方がよい。指定した場合、コンテナ上でその制限をサポートできるかはネームサービスプロバイダの判断に委ねられる。サポートできなければエラーを返すべきである。他の方法でコンテナを見つけられるプロバイダもある。たとえばコンテナはすべて既知の型または既知の型集合であって、その検索用の制限クエリが作れる場合がある。どのような方法でコンテナを見つけられるとしても、LUP_CONTAINERS
と LUP_NOCONTAINERS が優先される。したがって、コンテナを含むクエリ制限を指定した状態で LUP_NOCONTAINERS
を指定するとコンテナ項目は返されない。同様に、どのようなクエリ制限があっても LUP_CONTAINERS
が指定されているとコンテナのみが返される。名前空間がコンテナをサポートしていない状態で LUP_CONTAINERS
が指定された場合、WSANO_DATA を返すべきである。別のコンテナ内のコンテナを取得する推奨方法は次の呼び出しである。
このドキュメントは省略されている。


%index
WSALookupServiceEnd
WSALookupServiceEnd 関数は、WSALookupServiceBegin および WSALookupServiceNext の先行呼び出し後にハンドルを解放するために呼び出される。
%prm
hLookup
hLookup : [intptr] WSALookupServiceBegin の呼び出しで事前に取得したハンドル。
%inst
WSALookupServiceEnd 関数は、WSALookupServiceBegin および
WSALookupServiceNext の先行呼び出し後にハンドルを解放するために呼び出される。

[戻り値]
操作が成功した場合の戻り値はゼロ。そうでない場合は SOCKET_ERROR が返され、WSAGetLastError
を呼び出すことで特定のエラー番号を取得できる。
このドキュメントは省略されている。

[備考]
Windows Phone 8: この関数は Windows Phone 8 以降の Windows Phone
ストアアプリでサポートされる。Windows 8.1 および Windows Server 2012 R2: この関数は Windows
8.1、Windows Server 2012 R2 以降の Windows ストアアプリでサポートされる。


%index
WSALookupServiceNextW
WSALookupServiceNext 関数は、WSALookupServiceBegin の呼び出しで取得したハンドルを使って、要求されたサービス情報を取得するために呼び出される。(Unicode)
%prm
hLookup, dwControlFlags, lpdwBufferLength, lpqsResults
hLookup : [intptr] WSALookupServiceBegin への直前の呼び出しで返されたハンドル。
dwControlFlags : [int] 操作を制御するフラグの集合。指定可能な基準は WSALookupServiceBegin 呼び出し時の dwControlFlags で決まる。WSALookupServiceNext で渡される dwControlFlags はサービス検索条件をさらに絞り込む。現在、結果セットが大きすぎる場合に対処する手段として LUP_FLUSHPREVIOUS が定義されている。アプリケーションが十分な大きさのバッファを用意できない場合、LUP_FLUSHPREVIOUS を指定するとプロバイダは直前の (大きすぎた) 結果セットを破棄して次の結果セットへ進む。指定可能な値は Winsock2.h に定義されており、以下のオプションを組み合わせて指定できる。
lpdwBufferLength : [var] 入力時は lpqsResults が指すバッファのバイト数。出力時、関数が WSAEFAULT で失敗したときはレコード取得のために lpqsResults に渡すべき最小バイト数が格納される。
lpqsResults : [var] メモリブロックへのポインタ。戻り時に WSAQUERYSET 構造体に格納された 1 つの結果セットを含む。
%inst
WSALookupServiceNext 関数は、WSALookupServiceBegin
の呼び出しで取得したハンドルを使って、要求されたサービス情報を取得するために呼び出される。(Unicode)

[戻り値]
操作が成功した場合の戻り値はゼロ。そうでない場合は SOCKET_ERROR が返され、WSAGetLastError
を呼び出すことで特定のエラー番号を取得できる。
このドキュメントは省略されている。

[備考]
本関数と WSALookupServiceBegin で指定された dwControlFlags
は組み合わせのための制約として扱われる。両者の制限は組み合わされるため、WSALookupServiceNext 時のフラグによって
WSALookupServiceBegin
時に要求した以上のデータを返させることはできないが、多い/少ないフラグ指定はエラーではない。ある呼び出しで
WSALookupServiceNext に指定したフラグはその呼び出しにのみ適用される。dwControlFlags の
LUP_FLUSHPREVIOUS および LUP_RES_SERVICE はこの組み合わせ制約の例外である
(制限フラグではなく振る舞いフラグのため)。これらを WSALookupServiceNext
で指定すると、WSALookupServiceBegin でのフラグ指定に関係なく定義された効果を発揮する。たとえば
WSALookupServiceBegin で LUP_RETURN_VERSION
が指定されていればサービスプロバイダはバージョン情報付きでレコードを取得する。WSALookupServiceNext で
LUP_RETURN_VERSION が指定されていなければ、バージョン情報は取得可能であっても返されない。エラーは発生しない。同様に
LUP_RETURN_BLOB が WSALookupServiceBegin で指定されていないが
WSALookupServiceNext
で指定された場合、プライベートデータは返らずエラーも発生しない。WSALookupServiceNext が WSAEFAULT
で失敗した場合、lpqsResults が指すバッファがクエリ結果を格納するには小さすぎたことを意味する。lpdwBufferLength
が示す大きさの新しい WSAQUERYSET 用バッファを用意すべきである。新しいバッファでは、WSALookupServiceNext
を再度呼び出す前にいくつかの WSAQUERYSET メンバを設定する必要がある。少なくとも dwSize
メンバには新しいバッファサイズを設定しなければならない。クエリ結果: クエリ結果が WSAQUERYSET
構造体にどのように表現されるかは次表に示す。
このドキュメントは省略されている。


%index
WSANSPIoctl
開発者が登録済みの名前空間に対して I/O 制御呼び出しを行えるようにする。
%prm
hLookup, dwControlCode, lpvInBuffer, cbInBuffer, lpvOutBuffer, cbOutBuffer, lpcbBytesReturned, lpCompletion
hLookup : [intptr] WSALookupServiceBegin への直前の呼び出しで返された検索ハンドル。
dwControlCode : [int] 実行する操作の制御コード。
lpvInBuffer : [intptr] 入力バッファへのポインタ。
cbInBuffer : [int] 入力バッファのサイズ (バイト単位)。
lpvOutBuffer : [intptr] 出力バッファへのポインタ。
cbOutBuffer : [int] 出力バッファのサイズ (バイト単位)。
lpcbBytesReturned : [var] 返されたバイト数へのポインタ。
lpCompletion : [var] 非同期処理に使う WSACOMPLETION 構造体へのポインタ。ブロッキング (同期) 実行を強制するには lpCompletion を NULL にする。
%inst
開発者が登録済みの名前空間に対して I/O 制御呼び出しを行えるようにする。

[戻り値]
成功時は NO_ERROR を返す。失敗時は SOCKET_ERROR を返し、WSAGetLastError
で特定のエラーコードを取得できる。エラーコードは次表に示す。
このドキュメントは省略されている。

[備考]
WSANSPIoctl 関数は、ネームスペースプロバイダへのクエリハンドルに関連する動作パラメータの設定や取得に用いる。hLookup
引数は WSALookupServiceBegin
で事前に返されたネームスペースプロバイダのクエリハンドルであり、ソケットハンドルではない。ネームスペースプロバイダに送られる IOCTL
は、その実装によっては無期限にブロックする可能性がある。ブロッキングに耐えられないアプリケーションは、オーバーラップ I/O を使い
lpCompletion に WSACOMPLETION 構造体を指定すべきである。WSANSPIoctl
呼び出しを非ブロッキングで直ちに返させるには、WSACOMPLETION の Type メンバを
NSP_NOTIFY_IMMEDIATELY に設定する。lpCompletion が NULL の場合、WSANSPIoctl
はブロッキング呼び出しとして実行される。ネームスペースプロバイダは即座に返りブロックすべきではないが、各プロバイダがこの振る舞いを守る責任を負う。次の
IOCTL コードはいくつかの Microsoft ネームスペースプロバイダでサポートされている:
SIO_NSP_NOTIFY_CHANGE。この操作は、hLookup
を使った先行呼び出しで返された結果がまだ有効かを確認する。先行呼び出しには、hLookup を取得した最初の
WSALookupServiceBegin 呼び出しや、hLookup を使う後続の WSALookupServiceNext
呼び出しが含まれる。
このドキュメントは省略されている。


%index
WSANtohl
WSANtohl 関数は u_long をネットワークバイトオーダーからホストバイトオーダーに変換する。
%prm
s, netlong, lphostlong
s : [int] ソケットを識別する記述子。
netlong : [int] ネットワークバイトオーダーの 32 ビット数値。
lphostlong : [var] ホストバイトオーダーの数値を受け取る 32 ビット数値へのポインタ。
%inst
WSANtohl 関数は u_long をネットワークバイトオーダーからホストバイトオーダーに変換する。

[戻り値]
エラーがない場合、WSANtohl はゼロを返す。そうでない場合は SOCKET_ERROR が返され、WSAGetLastError
を呼び出すことで特定のエラーコードを取得できる。
このドキュメントは省略されている。

[備考]
WSANtohl 関数は、ネットワークバイトオーダーの 32 ビット数値を受け取り、lphostlong が指す 32
ビット数値にホストバイトオーダーの 32 ビット数値を返す。s 引数に渡したソケットは、ソケットに関連付けられた Winsock
カタログのプロトコルエントリに基づいて必要なネットワークバイトオーダーを決めるために使われる。この機能は異なるネットワークバイトオーダーを使う
Winsock プロバイダをサポートするためである。ソケットが AF_INET または AF_INET6
アドレスファミリのものであれば、WSANtohl はネットワークバイトオーダーの IPv4
アドレスをホストバイトオーダーに変換するために使える。この関数は netlong が有効な IPv4
アドレスかのチェックは行わない。WSANtohl を使うには、事前に WSAStartup の成功呼び出しで Winsock DLL
がロードされていなければならない。AF_INET または AF_INET6 ファミリに対して ntohl 関数を使う場合は、Winsock
DLL のロードは不要である。Windows Phone 8: この関数は Windows Phone 8 以降の Windows
Phone ストアアプリでサポートされる。Windows 8.1 および Windows Server 2012 R2: この関数は
Windows 8.1、Windows Server 2012 R2 以降の Windows ストアアプリでサポートされる。


%index
WSANtohs
WSANtohs 関数は u_short をネットワークバイトオーダーからホストバイトオーダーに変換する。
%prm
s, netshort, lphostshort
s : [int] ソケットを識別する記述子。
netshort : [int] ネットワークバイトオーダーの 16 ビット数値。
lphostshort : [var] ホストバイトオーダーの数値を受け取る 16 ビット数値へのポインタ。
%inst
WSANtohs 関数は u_short をネットワークバイトオーダーからホストバイトオーダーに変換する。

[戻り値]
エラーがない場合、WSANtohs はゼロを返す。そうでない場合は SOCKET_ERROR が返され、WSAGetLastError
を呼び出すことで特定のエラーコードを取得できる。
このドキュメントは省略されている。

[備考]
WSANtohs 関数は、ネットワークバイトオーダーの 16 ビット数値を受け取り、lphostshort が指す 16
ビット数値にホストバイトオーダーの 16 ビット数値を返す。s 引数に渡したソケットは、ソケットに関連付けられた Winsock
カタログのプロトコルエントリに基づいて必要なネットワークバイトオーダーを決めるために使われる。この機能は異なるネットワークバイトオーダーを使う
Winsock プロバイダをサポートするためである。ソケットが AF_INET または AF_INET6
アドレスファミリのものであれば、WSANtohs はネットワークバイトオーダーの IP
ポート番号をホストバイトオーダーに変換するために使える。WSANtohs を使うには、事前に WSAStartup の成功呼び出しで
Winsock DLL がロードされていなければならない。AF_INET または AF_INET6 ファミリに対して ntohs
関数を使う場合は、Winsock DLL のロードは不要である。Windows Phone 8: この関数は Windows Phone
8 以降の Windows Phone ストアアプリでサポートされる。Windows 8.1 および Windows Server
2012 R2: この関数は Windows 8.1、Windows Server 2012 R2 以降の Windows
ストアアプリでサポートされる。


%index
WSAPoll
WSAPoll 関数は 1 つ以上のソケットの状態を判定する。
%prm
fdArray, fds, timeout
fdArray : [var] 状態を要求するソケット集合を指定する 1 つ以上の POLLFD 構造体の配列。配列には有効なソケットを含む構造体が少なくとも 1 つ含まれていなければならない。戻り時には、状態問い合わせ条件に合致したソケットそれぞれに対して更新後の revents ステータスフラグが設定された形で返される。
fds : [int] fdarray 内の WSAPOLLFD 構造体の数。状態を要求しているソケット数と一致するとは限らない。
timeout : [int] 以下の値に基づいて待機の挙動を指定する値。
%inst
WSAPoll 関数は 1 つ以上のソケットの状態を判定する。

[戻り値]
次のいずれかの値を返す。
このドキュメントは省略されている。

[備考]
WSAPoll 関数は Windows Vista 以降で定義されている。アプリケーションは WSAPOLLFD 構造体の events
メンバに適切なフラグを設定し、対応するソケットに要求する状態種別を指定する。WSAPoll 関数は WSAPOLLFD の revents
メンバにソケットの状態を返す。各ソケットについて、呼び出し元は読み出し状態または書き込み状態の情報を要求できる。エラー条件は常に返されるので、明示的に要求する必要はない。指定した条件を満たさずエラー条件もないソケットは、対応する
revents メンバが 0 に設定される。
このドキュメントは省略されている。


%index
WSAProviderCompleteAsyncCall
ネームスペース version-2 プロバイダへの非同期呼び出しが完了したことをクライアントに通知する。
%prm
hAsyncCall, iRetCode
hAsyncCall : [intptr] 完了される非同期呼び出しに渡されたハンドル。このハンドルは非同期関数呼び出しにおいてクライアントからネームスペース version-2 プロバイダに渡されたものである。
iRetCode : [int] ネームスペース version-2 プロバイダへの非同期呼び出しに対する戻りコード。
%inst
ネームスペース version-2 プロバイダへの非同期呼び出しが完了したことをクライアントに通知する。

[戻り値]
エラーがない場合、**WSAProviderCompleteAsyncCall** はゼロを返す。関数が失敗した場合の戻り値は
SOCKET_ERROR である。拡張エラー情報を取得するには WSAGetLastError
を呼び出す。以下のいずれかの拡張エラー値が返される。
このドキュメントは省略されている。

[備考]
**WSAProviderCompleteAsyncCall** 関数は、Windows Vista
以降で利用可能なネームスペースサービスプロバイダ version-2 (NSPv2) アーキテクチャの一部として使用される。Windows
Vista および Windows Server 2008 では、WSAUnadvertiseProvider 関数は NS_EMAIL
ネームスペースプロバイダに対する操作のみに使用できる。NSPv2 プロバイダへの非同期呼び出しは Windows Vista および
Windows Server 2008 ではサポートされないため、**WSAProviderCompleteAsyncCall**
は現時点では適用できない。この関数は、ネームスペースプロバイダへの非同期呼び出しがサポートされる将来の Windows
バージョンでの使用を計画されている。一般に NSPv2 プロバイダは呼び出し元アプリケーションとは別のプロセスで実装される。NSPv2
プロバイダはクライアントのアクティビティに応じてアクティブ化されるものではない。プロバイダをホストするアプリケーションが、WSAAdvertiseProvider
と WSAUnadvertiseProvider を呼び出すタイミングで各プロバイダの利用可否を決める。クライアント側の活動は、利用可能な
(広告されている) プロバイダへの接続試行という形でしか現れない。


%index
WSAProviderConfigChange
WSAProviderConfigChange 関数は、プロバイダ構成が変更されたときにアプリケーションへ通知する。
%prm
lpNotificationHandle, lpOverlapped, lpCompletionRoutine
lpNotificationHandle : [intptr] 通知ハンドルへのポインタ。通知ハンドル (ポインタではなくハンドル値) が NULL の場合、関数は lpNotificationHandle が指す場所に通知ハンドルを返す。
lpOverlapped : [var] WSAOVERLAPPED 構造体へのポインタ。
lpCompletionRoutine : [int] 型: \_In_opt\_ [**LPWSAOVERLAPPED_COMPLETION_ROUTINE**](./nc-winsock2-lpwsaoverlapped_completion_routine.md) プロバイダ変更通知を受けたときに呼び出される完了ルーチンへのポインタ。
%inst
WSAProviderConfigChange 関数は、プロバイダ構成が変更されたときにアプリケーションへ通知する。

[戻り値]
エラーがない場合、WSAProviderConfigChange は 0 を返す。そうでない場合は SOCKET_ERROR
を返し、WSAGetLastError で特定のエラーコードを取得できる。WSA_IO_PENDING
エラーコードはオーバーラップ操作が正常に開始され、後で完了 (すなわち変更イベント) が通知されることを示す。
このドキュメントは省略されている。

[備考]
WSAProviderConfigChange 関数は、再起動せずに構成変更が可能な Windows 環境において、プロバイダ
(トランスポートおよびネームスペース) のインストール/削除をアプリケーションに通知する。最初の呼び出し時
(lpNotificationHandle が NULL ハンドルを指しているとき)
は即座に完了し、以降の呼び出しでプロバイダのインストール/削除通知を受けるのに使える通知ハンドルを
lpNotificationHandle に返す。2 回目以降の呼び出しは、呼び出し時からプロバイダ情報が変化したときにのみ完了する。2
回目以降の呼び出しではオーバーラップ I/O の使用が期待されるが必須ではない。オーバーラップ I/O
を使うと呼び出しは即座に戻り、指定されたオーバーラップ完了引数に従って通知される。WSAProviderConfigChange
が返す通知ハンドルは通常の OS ハンドルと同じで、不要になったら Windows の CloseHandle
で閉じるべきである。常に最新のプロトコル構成情報を得るための手順は次のとおりである。
このドキュメントは省略されている。


%index
WSARecv
接続済みソケットまたはバインド済みコネクションレスソケットからデータを受信する。(WSARecv)
%prm
s, lpBuffers, dwBufferCount, lpNumberOfBytesRecvd, lpFlags, lpOverlapped, lpCompletionRoutine
s : [int] 接続済みソケットを識別する記述子。
lpBuffers : [var] WSABUF 構造体の配列へのポインタ。各 WSABUF 構造体はバッファへのポインタとそのバイト長を含む。
dwBufferCount : [int] lpBuffers 配列内の WSABUF 構造体の数。
lpNumberOfBytesRecvd : [var] 受信操作が即時完了した場合に、この呼び出しで受信したバイト数へのポインタ。lpOverlapped が NULL でない場合、誤った結果を避けるために本引数を NULL にする。本引数を NULL にできるのは lpOverlapped が NULL でない場合のみ。
lpFlags : [var] WSARecv の動作を変更するためのフラグへのポインタ。詳細は備考を参照。
lpOverlapped : [var] WSAOVERLAPPED 構造体へのポインタ (非オーバーラップソケットでは無視される)。
lpCompletionRoutine : [int] 型: \_In_opt\_ [**LPWSAOVERLAPPED_COMPLETION_ROUTINE**](./nc-winsock2-lpwsaoverlapped_completion_routine.md) 受信操作が完了した時に呼び出される完了ルーチンへのポインタ (非オーバーラップソケットでは無視される)。
%inst
接続済みソケットまたはバインド済みコネクションレスソケットからデータを受信する。(WSARecv)

[戻り値]
エラーがなく受信操作が即時完了した場合、WSARecv
はゼロを返す。この場合、呼び出し元スレッドがアラート可能状態になった時点で完了ルーチンが呼び出されるようスケジュール済みとなる。そうでない場合は
SOCKET_ERROR が返され、WSAGetLastError で特定のエラーコードを取得できる。WSA_IO_PENDING
エラーコードは、オーバーラップ操作が正常に開始され、完了が後で通知されることを示す。それ以外のエラーコードはオーバーラップ操作が正常に開始されず、完了通知は発生しないことを示す。
このドキュメントは省略されている。

[備考]
WSARecv 関数は、標準の recv 関数と比べて次の 3 つの重要な領域で追加機能を提供する。
このドキュメントは省略されている。


%index
WSARecvDisconnect
WSARecvDisconnect 関数は、ソケットの受信を終了し、コネクション指向ソケットであれば切断データを取得する。
%prm
s, lpInboundDisconnectData
s : [int] ソケットを識別する記述子。
lpInboundDisconnectData : [var] 受信側の切断データへのポインタ。
%inst
WSARecvDisconnect 関数は、ソケットの受信を終了し、コネクション指向ソケットであれば切断データを取得する。

[戻り値]
エラーがない場合、WSARecvDisconnect はゼロを返す。そうでない場合は SOCKET_ERROR
が返され、WSAGetLastError で特定のエラーコードを取得できる。
このドキュメントは省略されている。

[備考]
WSARecvDisconnect
関数はコネクション指向ソケットで使用され、受信を無効化するとともにリモートから切断データを取得する。これは shutdown
(SD_RECEIVE)
と等価だが、プロトコルが対応していれば切断データの受信もできる点が異なる。この関数が正常に発行された後は、ソケット上のそれ以降の受信は不許可となる。WSARecvDisconnect
を呼んでも下位プロトコル層には影響しない。TCP
ソケットでは、ソケットにまだ受信待ちのデータが溜まっているか新たにデータが到着すると、ユーザーに配信できないため接続はリセットされる。UDP
では受信データグラムは受理されキューに入る。いずれも ICMP エラーパケットが生成されることはない。注: Windows のネイティブ
TCP/IP 実装は切断データをサポートしていない。切断データは、WSAPROTOCOL_INFO 構造体で
XP1_DISCONNECT_DATA フラグが立っている Windows Sockets
プロバイダでのみサポートされる。インストール済みプロバイダの WSAPROTOCOL_INFO 構造体を取得するには
WSAEnumProtocols
を使う。受信側切断データを正常に受け取るには、回路が閉じられたことをアプリケーション自身が別の手段で判定する必要がある。たとえば
FD_CLOSE 通知の受信、recv/WSARecv からの 0 返却または WSAEDISCON/WSAECONNRESET
エラーコードの受信などである。WSARecvDisconnect はソケットを閉じないので、closesocket
が呼ばれるまでソケットに紐付くリソースは解放されない。WSARecvDisconnect はソケットの SO_LINGER
設定に関係なくブロックしない。WSARecvDisconnect 後に同じソケットを再利用できると期待すべきではない。特に、Winsock
プロバイダがそのようなソケットに対する connect/WSAConnect の使用を保証する必要はない。注:
WSARecvDisconnect のようなブロッキング Winsock 呼び出しを発行すると、Winsock
はネットワークイベントの発生を待ってから呼び出しを完了する場合がある。この待機はアラート可能な待機で、同じスレッドにスケジュールされた
APC によって中断され得る。中断中の APC 内からさらにブロッキング Winsock
呼び出しを発行すると未定義動作となるため、Winsock クライアントは決してそれを行ってはならない。


%index
WSARecvFrom
データグラムを受信し、送信元アドレスを格納する。
%prm
s, lpBuffers, dwBufferCount, lpNumberOfBytesRecvd, lpFlags, lpFrom, lpFromlen, lpOverlapped, lpCompletionRoutine
s : [int] ソケットを識別する記述子。
lpBuffers : [var] WSABUF 構造体の配列へのポインタ。各 WSABUF 構造体はバッファへのポインタとその長さを含む。
dwBufferCount : [int] lpBuffers 配列内の WSABUF 構造体の数。
lpNumberOfBytesRecvd : [var] WSARecvFrom 操作が即時完了した場合に、この呼び出しで受信したバイト数へのポインタ。lpOverlapped が NULL でない場合、誤った結果を避けるために本引数を NULL にする。本引数を NULL にできるのは lpOverlapped が NULL でない場合のみ。
lpFlags : [var] WSARecvFrom の動作を変更するためのフラグへのポインタ。下記の備考を参照。
lpFrom : [var] オーバーラップ操作の完了時に送信元アドレスを格納するバッファへのオプションのポインタ。
lpFromlen : [var] lpFrom を指定したときだけ必要となる "from" バッファのサイズ (バイト単位) へのポインタ。
lpOverlapped : [var] WSAOVERLAPPED 構造体へのポインタ (非オーバーラップソケットでは無視される)。
lpCompletionRoutine : [int] 型: \_In_opt\_ [**LPWSAOVERLAPPED_COMPLETION_ROUTINE**](./nc-winsock2-lpwsaoverlapped_completion_routine.md) WSARecvFrom 操作が完了した時に呼び出される完了ルーチンへのポインタ (非オーバーラップソケットでは無視される)。
%inst
データグラムを受信し、送信元アドレスを格納する。

[戻り値]
エラーがなく受信操作が即時完了した場合、WSARecvFrom
はゼロを返す。この場合、呼び出し元スレッドがアラート可能状態になった時点で完了ルーチンが呼び出されるようスケジュール済みとなる。そうでない場合は
SOCKET_ERROR が返され、WSAGetLastError で特定のエラーコードを取得できる。WSA_IO_PENDING
エラーコードはオーバーラップ操作が正常に開始され、完了が後で通知されることを示す。それ以外のエラーコードはオーバーラップ操作が正常に開始されず、完了通知は発生しないことを示す。
このドキュメントは省略されている。

[備考]
WSARecvFrom 関数は、標準の recvfrom 関数に対して次の 3 つの重要な領域で機能を追加する。
このドキュメントは省略されている。


%index
WSARemoveServiceClass
WSARemoveServiceClass 関数は、サービスクラスのスキーマをレジストリから永久に削除する。
%prm
lpServiceClassId
lpServiceClassId : [var] 削除したいサービスクラスの GUID へのポインタ。
%inst
WSARemoveServiceClass 関数は、サービスクラスのスキーマをレジストリから永久に削除する。

[戻り値]
操作が成功した場合の戻り値はゼロ。そうでない場合は SOCKET_ERROR が返され、WSAGetLastError
で特定のエラー番号を取得できる。
このドキュメントは省略されている。


%index
WSAResetEvent
WSAResetEvent 関数は、指定したイベントオブジェクトの状態を非シグナル状態にリセットする。
%prm
hEvent
hEvent : [intptr] 開いたイベントオブジェクトハンドルを識別するハンドル。
%inst
WSAResetEvent 関数は、指定したイベントオブジェクトの状態を非シグナル状態にリセットする。

[戻り値]
WSAResetEvent 関数が成功すると戻り値は TRUE である。失敗すると FALSE を返す。拡張エラー情報を取得するには
WSAGetLastError を呼び出す。
このドキュメントは省略されている。

[備考]
WSAResetEvent 関数は、イベントオブジェクトの状態を非シグナル状態に設定する。WSAEventSelect
と共に使われるイベントオブジェクトの状態をリセットする適切な方法は、WSAEnumNetworkEvents 関数の
hEventObject 引数にそのハンドルを渡すことである。これによりイベントオブジェクトのリセットとソケット上のアクティブな FD
イベント状態の調整がアトミックに行われる。Windows Phone 8: この関数は Windows Phone 8 以降の
Windows Phone ストアアプリでサポートされる。Windows 8.1 および Windows Server 2012 R2:
この関数は Windows 8.1、Windows Server 2012 R2 以降の Windows ストアアプリでサポートされる。


%index
WSASend
接続済みソケットでデータを送信する。(WSASend)
%prm
s, lpBuffers, dwBufferCount, lpNumberOfBytesSent, dwFlags, lpOverlapped, lpCompletionRoutine
s : [int] 接続済みソケットを識別する記述子。
lpBuffers : [var] WSABUF 構造体の配列へのポインタ。各 WSABUF 構造体はバッファへのポインタとそのバイト長を含む。Winsock アプリケーションでは、WSASend 呼び出し後はこれらバッファの所有権はシステムにあり、アプリケーションはアクセスしてはならない。この配列は送信操作の間有効でなければならない。
dwBufferCount : [int] lpBuffers 配列内の WSABUF 構造体の数。
lpNumberOfBytesSent : [var] I/O 操作が即時完了した場合にこの呼び出しで送信したバイト数へのポインタ。lpOverlapped が NULL でない場合、誤った結果を避けるために本引数を NULL にする。本引数を NULL にできるのは lpOverlapped が NULL でない場合のみ。
dwFlags : [int] WSASend の動作を変更するためのフラグ。詳細は備考の「Using dwFlags」を参照。
lpOverlapped : [var] WSAOVERLAPPED 構造体へのポインタ。非オーバーラップソケットでは無視される。
lpCompletionRoutine : [int] 型: \_In_opt\_ [**LPWSAOVERLAPPED_COMPLETION_ROUTINE**](./nc-winsock2-lpwsaoverlapped_completion_routine.md) 送信操作が完了した時に呼び出される完了ルーチンへのポインタ。非オーバーラップソケットでは無視される。
%inst
接続済みソケットでデータを送信する。(WSASend)

[戻り値]
エラーがなく送信操作が即時完了した場合、WSASend
はゼロを返す。この場合、呼び出し元スレッドがアラート可能状態になった時点で完了ルーチンが呼び出されるようスケジュール済みとなる。そうでない場合は
SOCKET_ERROR が返され、WSAGetLastError で特定のエラーコードを取得できる。WSA_IO_PENDING
エラーコードはオーバーラップ操作が正常に開始され、完了が後で通知されることを示す。それ以外のエラーコードはオーバーラップ操作が正常に開始されず、完了通知は発生しないことを示す。
このドキュメントは省略されている。

[備考]
WSASend 関数は、標準の send 関数に対して次の 2 つの重要な領域で機能を追加する。
このドキュメントは省略されている。


%index
WSASendDisconnect
WSASendDisconnect 関数は、ソケットの接続終了を開始し切断データを送信する。
%prm
s, lpOutboundDisconnectData
s : [int] ソケットを識別する記述子。
lpOutboundDisconnectData : [var] 送信する切断データへのポインタ。
%inst
WSASendDisconnect 関数は、ソケットの接続終了を開始し切断データを送信する。

[戻り値]
エラーがない場合、WSASendDisconnect はゼロを返す。そうでない場合は SOCKET_ERROR
が返され、WSAGetLastError で特定のエラーコードを取得できる。
このドキュメントは省略されている。

[備考]
WSASendDisconnect 関数はコネクション指向ソケットで使用され、送信を無効化するとともに、切断データ (存在する場合)
の送信も含めて接続終了を開始する。これは shutdown (SD_SEND)
と等価だが、プロトコルが対応していれば切断データの送信もできる点が異なる。この関数が正常に発行された後は、以降の送信は不許可となる。lpOutboundDisconnectData
が NULL でなければ、WSARecvDisconnect で取得されるリモートへの切断データを含むバッファを指す。注: Windows
のネイティブ TCP/IP 実装は切断データをサポートしていない。切断データは、WSAPROTOCOL_INFO 構造体で
XP1_DISCONNECT_DATA フラグが立っている Winsock プロバイダでのみサポートされる。インストール済みプロバイダの
WSAPROTOCOL_INFO 構造体を取得するには WSAEnumProtocols を使う。WSASendDisconnect
はソケットを閉じないので、closesocket が呼ばれるまでソケットに紐付くリソースは解放されない。WSASendDisconnect
はソケットの SO_LINGER 設定に関係なくブロックしない。WSASendDisconnect
後に同じソケットを再利用できると期待すべきではない。特に、Winsock プロバイダがそのようなソケットに対する
connect/WSAConnect の使用を保証する必要はない。注: WSASendDisconnect のようなブロッキング
Winsock 呼び出しを発行すると、Winsock
はネットワークイベントの発生を待ってから呼び出しを完了する場合がある。この待機はアラート可能な待機で、同じスレッドにスケジュールされた
APC によって中断され得る。中断中の APC 内からさらにブロッキング Winsock
呼び出しを発行すると未定義動作となるため、Winsock クライアントは決してそれを行ってはならない。


%index
WSASendMsg
接続済み/非接続のソケットからデータとオプションの制御情報を送信する。注: この関数は Winsock 仕様に対する Microsoft 独自の拡張である。
%prm
Handle, lpMsg, dwFlags, lpNumberOfBytesSent, lpOverlapped, lpCompletionRoutine
Handle : [int] ソケットを識別する記述子。
lpMsg : [var] Posix.1g msghdr 構造体を格納する WSAMSG 構造体。
dwFlags : [int] WSASendMsg の動作を変更するためのフラグ。詳細は備考の「Using dwFlags」を参照。
lpNumberOfBytesSent : [var] I/O 操作が即時完了した場合にこの呼び出しで送信したバイト数へのポインタ。lpOverlapped が NULL でない場合、誤った結果を避けるために本引数を NULL にする。本引数を NULL にできるのは lpOverlapped が NULL でない場合のみ。
lpOverlapped : [var] WSAOVERLAPPED 構造体へのポインタ。非オーバーラップソケットでは無視される。
lpCompletionRoutine : [int] 型: \_In_opt\_ [**LPWSAOVERLAPPED_COMPLETION_ROUTINE**](./nc-winsock2-lpwsaoverlapped_completion_routine.md) 送信操作が完了した時に呼び出される完了ルーチンへのポインタ。非オーバーラップソケットでは無視される。
%inst
接続済み/非接続のソケットからデータとオプションの制御情報を送信する。注: この関数は Winsock 仕様に対する Microsoft
独自の拡張である。

[戻り値]

成功かつ即時完了の場合はゼロを返す。ゼロが返った場合、呼び出しスレッドがアラート可能状態になった時点で指定された完了ルーチンが呼び出される。SOCKET_ERROR
が返り、続く WSAGetLastError が WSA_IO_PENDING
を返す場合は、オーバーラップ操作が正常に開始されたことを示し、完了はイベントや完了ポートなど他の手段で通知される。失敗時は
SOCKET_ERROR が返り、WSAGetLastError は WSA_IO_PENDING
以外の値を返す。次の表はエラーコードの一覧である。
このドキュメントは省略されている。

[備考]
WSASendMsg 関数は WSASend および WSASendTo の代わりに使うことができる。WSASendMsg
はデータグラムおよび raw ソケットでのみ使える。s 引数のソケット記述子は、ソケット種別を SOCK_DGRAM または
SOCK_RAW として開いていなければならない。dwFlags 引数には次の制御フラグの組み合わせのみ指定できる:
MSG_DONTROUTE、MSG_PARTIAL、MSG_OOB。lpMsg が指す WSAMSG 構造体の dwFlags
メンバは入力時に無視され出力では使われない。
注: WSASendMsg の関数ポインタは、WSAIoctl 関数に
SIO_GET_EXTENSION_FUNCTION_POINTER オペコードを指定して実行時に取得する必要がある。WSAIoctl
に渡す入力バッファには、WSASendMsg 拡張関数を識別する GUID WSAID_WSASENDMSG を入れる。成功すれば
WSAIoctl の出力に WSASendMsg のポインタが格納される。WSAID_WSASENDMSG GUID は
Mswsock.h に定義されている。
オーバーラップソケットは WSA_FLAG_OVERLAPPED 付きで WSASocket
を呼ぶことで作成される。オーバーラップソケットでは lpOverlapped と lpCompletionRoutine の両方が
NULL でない限りオーバーラップ I/O で送信が行われる。両方が NULL
の場合は非オーバーラップソケットとして扱う。オーバーラップソケットでは、バッファが転送に消費された時点で完了ルーチンが呼ばれるかイベントオブジェクトがセットされる。操作が即時完了しない場合、最終的な完了状態は完了ルーチンまたは
WSAGetOverlappedResult で取得する。非オーバーラップソケットでは lpOverlapped と
lpCompletionRoutine は無視され、WSASendMsg は send
と同じブロッキングセマンティクスを持つ。すなわちデータはバッファからトランスポートのバッファへコピーされる。ソケットが非ブロッキングかつストリーム指向で、トランスポートのバッファ容量が不足している場合、WSASendMsg
はアプリケーションのバッファの一部のみ消費して戻る。一方、ブロッキングソケットでは全バッファが消費されるまで WSASendMsg
はブロックする。
この関数がオーバーラップ方式で完了する場合、Winsock サービスプロバイダは呼び出しから戻る前に WSABUF
構造体を取り込む責任がある。これによりアプリケーションは lpMsg が指す WSAMSG の lpBuffers にスタック上の
WSABUF 配列を指すこともできる。メッセージ指向ソケットでは、下位プロバイダの最大メッセージサイズ (SO_MAX_MSG_SIZE
ソケットオプションで取得可能)
を超えないよう注意する必要がある。データが下位プロトコルでアトミックに送信するには長すぎる場合、WSAEMSGSIZE
エラーが返り何も送信されない。
IPv4 の SOCK_DGRAM または SOCK_RAW ソケットでは、アプリケーションは WSAMSG の制御データオブジェクトに
in_pktinfo 構造体を含めて送信元 IPv4 アドレスを指定できる。IPv6 の SOCK_DGRAM または SOCK_RAW
ソケットでは、in6_pktinfo 構造体を含めて送信元 IPv6 アドレスを指定できる。デュアルスタックソケットでは、宛先 IP
に応じて方法が異なる。IPv4 宛先または IPv4 マップ IPv6 宛先に送る場合は in_pktinfo を、IPv4 マップでない
IPv6 宛先に送る場合は in6_pktinfo を使う。注: SO_SNDTIMEO
ソケットオプションはブロッキングソケットにのみ適用される。注: WSASendMsg
の成功完了は、データが正常に配信されたことを示すものではない。注: lpOverlapped を NULL にして WSASendMsg
のようなブロッキング Winsock 呼び出しを発行すると、Winsock
はネットワークイベントを待つ場合がある。この待機はアラート可能で APC で中断されうる。中断中の APC 内から別のブロッキング
Winsock 呼び出しを発行すると未定義動作となる。dwFlags
このドキュメントは省略されている。


%index
WSASendTo
可能であればオーバーラップ I/O を用いて、指定した宛先にデータを送信する。
%prm
s, lpBuffers, dwBufferCount, lpNumberOfBytesSent, dwFlags, lpTo, iTolen, lpOverlapped, lpCompletionRoutine
s : [int] (接続済みの場合もある) ソケットを識別する記述子。
lpBuffers : [var] WSABUF 構造体の配列へのポインタ。各 WSABUF 構造体はバッファへのポインタとそのバイト長を含む。Winsock アプリケーションでは、WSASendTo 呼び出し後はこれらバッファの所有権はシステムにあり、アプリケーションはアクセスしてはならない。この配列は送信操作の間有効でなければならない。
dwBufferCount : [int] lpBuffers 配列内の WSABUF 構造体の数。
lpNumberOfBytesSent : [var] I/O 操作が即時完了した場合にこの呼び出しで送信したバイト数へのポインタ。lpOverlapped が NULL でない場合、誤った結果を避けるために本引数を NULL にする。本引数を NULL にできるのは lpOverlapped が NULL でない場合のみ。
dwFlags : [int] WSASendTo の動作を変更するためのフラグ。
lpTo : [var] SOCKADDR 構造体で表される送信先ソケットのアドレスへのオプションのポインタ。
iTolen : [int] lpTo 引数のアドレスのサイズ (バイト単位)。
lpOverlapped : [var] WSAOVERLAPPED 構造体へのポインタ (非オーバーラップソケットでは無視される)。
lpCompletionRoutine : [int] 型: \_In_opt\_ [**LPWSAOVERLAPPED_COMPLETION_ROUTINE**](./nc-winsock2-lpwsaoverlapped_completion_routine.md) 送信操作が完了した時に呼び出される完了ルーチンへのポインタ (非オーバーラップソケットでは無視される)。
%inst
可能であればオーバーラップ I/O を用いて、指定した宛先にデータを送信する。

[戻り値]
エラーがなく送信操作が即時完了した場合、WSASendTo
はゼロを返す。この場合、呼び出し元スレッドがアラート可能状態になった時点で完了ルーチンが呼び出されるようスケジュール済みとなる。そうでない場合は
SOCKET_ERROR が返され、WSAGetLastError で特定のエラーコードを取得できる。WSA_IO_PENDING
エラーコードはオーバーラップ操作が正常に開始され、完了が後で通知されることを示す。それ以外のエラーコードはオーバーラップ操作が正常に開始されず、完了通知は発生しないことを示す。
このドキュメントは省略されている。

[備考]
WSASendTo 関数は、標準の sendto 関数に対して次の 2 つの重要な領域で機能を追加する。
このドキュメントは省略されている。


%index
WSASetBlockingHook
この関数は Windows Sockets 2 仕様 revision 2.2.0 に従って削除された。(WSASetBlockingHook)
%prm
lpBlockFunc
lpBlockFunc : [var] 
%inst
この関数は Windows Sockets 2 仕様 revision 2.2.0
に従って削除された。(WSASetBlockingHook)


%index
WSASetEvent
WSASetEvent 関数は、指定したイベントオブジェクトの状態をシグナル状態に設定する。
%prm
hEvent
hEvent : [intptr] 開いたイベントオブジェクトを識別するハンドル。
%inst
WSASetEvent 関数は、指定したイベントオブジェクトの状態をシグナル状態に設定する。

[戻り値]
関数が成功すると戻り値は TRUE である。失敗すると FALSE を返す。拡張エラー情報を取得するには WSAGetLastError
を呼び出す。
このドキュメントは省略されている。

[備考]
WSASetEvent 関数は、イベントオブジェクトの状態をシグナル状態に設定する。Windows Phone 8: この関数は
Windows Phone 8 以降の Windows Phone ストアアプリでサポートされる。Windows 8.1 および
Windows Server 2012 R2: この関数は Windows 8.1、Windows Server 2012 R2 以降の
Windows ストアアプリでサポートされる。


%index
WSASetLastError
WSASetLastError 関数 (winsock.h) は、WSAGetLastError 関数で取得されるエラーコードを設定する。
%prm
iError
iError : [int] 以降の WSAGetLastError 呼び出しが返すエラーコードを指定する整数。
%inst
WSASetLastError 関数 (winsock.h) は、WSAGetLastError 関数で取得されるエラーコードを設定する。

[戻り値]
この関数に戻り値はない。
このドキュメントは省略されている。

[備考]
WSASetLastError 関数は、現在のスレッドに対して以降の WSAGetLastError
呼び出しが返すエラーコードをアプリケーションから設定できるようにする。注意として、以降アプリケーションが呼び出す任意の Winsock
ルーチンは、このルーチンで設定したエラーコードを上書きする。WSASetLastError で設定するエラーコードは、getsockopt
に SO_ERROR を指定してリセットするエラーコードとは別物である。この関数で使う Windows Sockets エラーコードは
Windows Sockets Error Codes の項に列挙されている。Windows Phone 8: この関数は Windows
Phone 8 以降の Windows Phone ストアアプリでサポートされる。Windows 8.1 および Windows
Server 2012 R2: この関数は Windows 8.1、Windows Server 2012 R2 以降の Windows
ストアアプリでサポートされる。


%index
WSASetServiceW
WSASetService 関数は、1 つ以上の名前空間内のサービスインスタンスをレジストリに登録または削除する。(Unicode)
%prm
lpqsRegInfo, essoperation, dwControlFlags
lpqsRegInfo : [var] 登録または登録解除のサービス情報へのポインタ。
essoperation : [int] 要求する操作を決める値。Winsock2.h ヘッダファイルに定義された WSAESETSERVICEOP 列挙型の値のいずれか。
dwControlFlags : [int] WSASetService 関数の動作をさらに制御するサービスインストールフラグ値。指定可能な値は Winsock2.h ヘッダファイルに定義されている。
%inst
WSASetService 関数は、1 つ以上の名前空間内のサービスインスタンスをレジストリに登録または削除する。(Unicode)

[戻り値]
操作が成功した場合の戻り値はゼロ。そうでない場合は SOCKET_ERROR が返され、WSAGetLastError
で特定のエラー番号を取得できる。
このドキュメントは省略されている。

[備考]
WSASetService
関数は、特定のネームスペースプロバイダ、特定の名前空間に関連付けられた全プロバイダ、または全名前空間の全プロバイダに作用させることができる。essOperation
と dwControlFlags の組み合わせで WSASetService の動作を制御する (次表参照)。
このドキュメントは省略されている。


%index
WSASocketW
WSASocket 関数は、特定のトランスポートサービスプロバイダにバインドされたソケットを作成する。(Unicode)
%prm
af, type, protocol, lpProtocolInfo, g, dwFlags
af : [int] アドレスファミリ指定。可能な値は Winsock2.h に定義されている。Windows Vista 以降向け SDK ではヘッダ構成が変更され、可能な値は Ws2def.h に定義されている。Ws2def.h は Winsock2.h に自動的にインクルードされるため、直接使うべきではない。現在サポートされている値は AF_INET または AF_INET6 で、これらはそれぞれ IPv4 と IPv6 のインターネットアドレスファミリ形式である。そのアドレスファミリの Winsock サービスプロバイダがインストールされていれば、他のアドレスファミリ (NetBIOS 用の AF_NETBIOS など) もサポートされる。AF_ アドレスファミリ定数と PF_ プロトコルファミリ定数の値は同一なので (例: AF_INET と PF_INET)、どちらの定数を使ってもよい。次の表は一般的な値を示すが、他にも多くの値が存在しうる。
type : [int] 新規ソケットの種別。
protocol : [int] 使用するプロトコル。指定可能な値はアドレスファミリとソケット種別に依存し、Winsock2.h と Wsrm.h に定義されている。Windows Vista 以降向け SDK ではヘッダ構成が変更され、Ws2def.h に定義された IPPROTO 列挙型の値から指定できる。Ws2def.h は Winsock2.h に自動的にインクルードされるため、直接使うべきではない。0 を指定するとプロトコル指定なしを意味し、サービスプロバイダが使用するプロトコルを選択する。
lpProtocolInfo : [var] 作成するソケットの特性を定義する WSAPROTOCOL_INFO 構造体へのポインタ。NULL でなければ、ソケットは指定された WSAPROTOCOL_INFO に関連付けられたプロバイダにバインドされる。
g : [int] 既存のソケットグループ ID、または新規ソケットと新規ソケットグループを作るときの適切なアクション。g が既存のソケットグループ ID であれば、そのグループの要件を満たす限り新しいソケットはそのソケットグループに参加する。そうでない場合は次の値が指定できる。
dwFlags : [int] ソケットの追加属性を指定するフラグ集合。組み合わせ可能だが、一部は許可されない。
%inst
WSASocket 関数は、特定のトランスポートサービスプロバイダにバインドされたソケットを作成する。(Unicode)

[戻り値]
エラーがない場合、WSASocket は新しいソケットを参照する記述子を返す。そうでない場合は INVALID_SOCKET
を返し、WSAGetLastError で特定のエラーコードを取得できる。注: このエラーコードの説明は Microsoft
独自のものである。
このドキュメントは省略されている。

[備考]
WSASocket
関数はソケット記述子とそれに関連するリソースを割り当て、トランスポートサービスプロバイダに関連付ける。ほとんどのソケットは dwFlags
に WSA_FLAG_OVERLAPPED 属性を指定して作成すべきである。この属性付きソケットはより高性能なオーバーラップ I/O
をサポートする。WSASocket でソケットを作成する場合、既定ではこのオーバーラップ属性は付かない。一方、socket
関数で作成したソケットは既定でオーバーラップ I/O をサポートする。lpProtocolInfo が NULL の場合、Winsock
は af、type、protocol で要求された組み合わせをサポートする最初のトランスポートサービスプロバイダを使用する。NULL
でない場合、ソケットは指定された WSAPROTOCOL_INFO
に関連付けられたプロバイダにバインドされる。この場合、af、type、protocol のいずれかに FROM_PROTOCOL_INFO
を指定することで、WSAPROTOCOL_INFO 構造体の対応値
(iAddressFamily、iSocketType、iProtocol)
を使うことを意味する。いずれにせよ、af、type、protocol
に指定した値は変更されずにトランスポートサービスプロバイダへ渡される。af、type、protocol
に基づいてプロトコルとサポートするサービスプロバイダを選択する際、この手順はベースプロトコルまたはプロトコルチェーンのみを選び、プロトコル層単独は選ばない。チェーン化されていないプロトコル層は
type や af について部分一致とも見なさず、適切なプロトコルが見つからないときに WSAEAFNOSUPPORT や
WSAEPROTONOSUPPORT を返すこともない。注: AF_UNSPEC 定数は引き続きヘッダに定義されているが、protocol
引数の解釈が曖昧になるため使用は強く推奨しない。アプリケーションは af に AF_INET6 を指定して IPv4 と IPv6
の両方で使えるデュアルモードソケットを作ることが推奨される。WSASocket で作成したソケットで SO_RCVTIMEO や
SO_SNDTIMEO を正しく機能させるには、dwFlags に WSA_FLAG_OVERLAPPED
を設定しなければならない。そうでなければタイムアウトはソケットに反映されない。SOCK_STREAM
のようなコネクション指向ソケットは全二重接続を提供し、データ送受信前に接続状態でなければならない。接続は connect または
WSAConnect で確立する。接続後は send/WSASend、recv/WSARecv でデータを転送できる。セッション終了時は
closesocket でソケット資源を解放する。コネクション指向ソケットの場合、closesocket 前に shutdown
でデータ転送を停止すべきである。信頼性のあるコネクション指向ソケットの通信プロトコルはデータの喪失・重複を防ぐ。相手のバッファに入るはずのデータを妥当な時間内に送信できなかった場合、接続は切れたと見なされ以降の呼び出しは
WSAETIMEDOUT で失敗する。コネクションレスのメッセージ指向ソケットは sendto/WSASendTo と
recvfrom/WSARecvFrom で任意のピアとデータグラムを送受信できる。特定のピアに接続しておけば、そのピアに対しては
send/WSASend で送信、recv/WSARecv で受信が可能になる。SOCK_RAW
のサポートは必須ではないが、可能ならサポートすることが推奨される。WSASocket
はサービス用に使うソケットを作成する用途にも使える。別のソケットが同じポートにバインドしようとすると監査レコードが生成される。そのためには次の手順が必要である。
このドキュメントは省略されている。


%index
WSAStringToAddressW
WSAStringToAddress 関数は、標準テキスト表現のネットワークアドレスを sockaddr 構造体の数値バイナリ形式に変換し、同構造体を必要とする Winsock ルーチンに渡せる形で返す。(Unicode)
%prm
AddressString, AddressFamily, lpProtocolInfo, lpAddress, lpAddressLength
AddressString : [wstr] 変換対象となる、標準テキスト形式のネットワークアドレスを含むゼロ終端文字列へのポインタ。
AddressFamily : [int] AddressString が指すネットワークアドレスのアドレスファミリ。
lpProtocolInfo : [var] 使用するプロバイダに関連付けられた WSAPROTOCOL_INFO 構造体。NULL の場合、呼び出しは指定された AddressFamily をサポートする最初のプロトコルのプロバイダにルーティングされる。
lpAddress : [var] 関数が成功した場合に、アドレス文字列に対応する sockaddr 構造体が書き込まれるバッファへのポインタ。
lpAddressLength : [var] lpAddress が指すバッファの長さ (バイト単位) へのポインタ。関数呼び出しが成功すると、lpAddress に返された sockaddr 構造体のサイズを指す値が返される。バッファが小さすぎる場合は WSAEFAULT で失敗し、本引数には必要なサイズ (バイト単位) が設定される。
%inst
WSAStringToAddress 関数は、標準テキスト表現のネットワークアドレスを sockaddr
構造体の数値バイナリ形式に変換し、同構造体を必要とする Winsock ルーチンに渡せる形で返す。(Unicode)

[戻り値]
操作が成功した場合の戻り値はゼロ。そうでない場合は SOCKET_ERROR が返され、WSAGetLastError
で特定のエラー番号を取得できる。
このドキュメントは省略されている。

[備考]
WSAStringToAddress 関数は、標準テキスト形式のネットワークアドレスを sockaddr
構造体の数値バイナリ形式に変換する。不足している要素は可能な限り妥当な既定値で埋める。たとえばポート番号がなければ 0
が既定となる。特定のプロバイダで変換を行いたい場合、lpProtocolInfo に対応する WSAPROTOCOL_INFO
を渡す。WSAStringToAddress は、lpAddress に sockaddr として渡された SOCKADDR_IN の
sin_family メンバが AF_INET または AF_INET6 でない場合に WSAEINVAL
で失敗する。WSAStringToAddress での IPv6 アドレスサポートは Windows XP SP1
以降で追加された。IPv6 サポートにはローカルコンピュータに IPv6 がインストールされている必要もある。Windows Phone
8: この関数は Windows Phone 8 以降の Windows Phone ストアアプリでサポートされる。Windows 8.1
および Windows Server 2012 R2: この関数は Windows 8.1、Windows Server 2012 R2
以降の Windows ストアアプリでサポートされる。
> [!NOTE] > winsock2.h ヘッダは、UNICODE プリプロセッサ定数の定義に基づいて本関数の ANSI 版と
Unicode 版を自動的に選択するエイリアスとして WSAStringToAddress
を定義している。エンコーディング中立なエイリアスとエンコーディング中立でないコードを混在させると、コンパイルエラーや実行時エラーを招く不整合が発生しうる。詳しくは
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
WSAUnadvertiseProvider
特定のネームスペース version-2 プロバイダをクライアントから利用不可にする。
%prm
puuidProviderId
puuidProviderId : [var] ネームスペースプロバイダのプロバイダ ID へのポインタ。
%inst
特定のネームスペース version-2 プロバイダをクライアントから利用不可にする。

[戻り値]
エラーがない場合、**WSAUnadvertiseProvider** はゼロを返す。そうでない場合は **SOCKET_ERROR**
を返し、WSAGetLastError で特定のエラーコードを取得できる。
このドキュメントは省略されている。

[備考]
**WSAUnadvertiseProvider** 関数は、Windows Vista 以降で利用可能な NSPv2
アーキテクチャの一部として使用される。Windows Vista および Windows Server 2008
では、**WSAUnadvertiseProvider** は NS_EMAIL
ネームスペースプロバイダに対する操作のみに使用できる。一般に NSPv2
プロバイダは呼び出し元アプリケーションとは別のプロセスで実装され、クライアントの動作に応じて活性化されるものではない。各プロバイダホスティングアプリケーションが、WSAAdvertiseProvider
と **WSAUnadvertiseProvider** 呼び出しによって当該プロバイダの公開可否を決定する。クライアント側は公開中
(広告中) のプロバイダに対して接続を試みるのみである。


%index
WSAUnhookBlockingHook
この関数は Windows Sockets 2 仕様 revision 2.2.0 に従って削除された。(WSAUnhookBlockingHook)
%prm

%inst
この関数は Windows Sockets 2 仕様 revision 2.2.0
に従って削除された。(WSAUnhookBlockingHook)


%index
WSAWaitForMultipleEvents
指定したイベントオブジェクトのいずれか、またはすべてがシグナル状態になる、タイムアウトが経過する、または I/O 完了ルーチンが実行されたときに戻る。
%prm
cEvents, lphEvents, fWaitAll, dwTimeout, fAlertable
cEvents : [int] lphEvents が指す配列内のイベントオブジェクトハンドル数。最大値は WSA_MAXIMUM_WAIT_EVENTS。1 つ以上のイベントを指定しなければならない。
lphEvents : [intptr] イベントオブジェクトハンドル配列へのポインタ。配列には異なる型のオブジェクトハンドルを含められる。fWaitAll が TRUE のときは同じハンドルを複数含めてはならない。待機中にいずれかのハンドルが閉じられた場合の動作は未定義である。ハンドルは SYNCHRONIZE アクセス権を持たなければならない。詳しくは Standard Access Rights を参照。
fWaitAll : [int] 待機種別を指定する値。TRUE の場合、lphEvents 配列内のすべてのオブジェクトがシグナル状態になったとき関数が戻る。FALSE の場合、いずれかのイベントがシグナル状態になったときに関数が戻る。後者の場合、戻り値から WSA_WAIT_EVENT_0 を引いた値がどのイベントでシグナルが立ったかを示すインデックスとなる。呼び出し中に複数のイベントがシグナル状態になった場合、最小インデックスのものを示す。
dwTimeout : [int] タイムアウト時間 (ミリ秒単位)。fWaitAll で指定した条件が満たされなくてもタイムアウトが経過すれば WSAWaitForMultipleEvents は戻る。dwTimeout が 0 ならば、WSAWaitForMultipleEvents は指定イベントの状態を調べて即座に戻る。WSA_INFINITE ならば無限に待機する。
fAlertable : [int] スレッドを I/O 完了ルーチンが実行可能なアラート可能待機状態に置くかを指定する値。TRUE の場合、スレッドはアラート可能待機状態に置かれ、システムが I/O 完了ルーチンを実行したときに WSAWaitForMultipleEvents が戻ることがある。このとき WSA_WAIT_IO_COMPLETION が返り、待機中のイベントはまだシグナル状態ではない。アプリケーションは WSAWaitForMultipleEvents を再度呼び出さなければならない。FALSE の場合、アラート可能待機状態には置かれず I/O 完了ルーチンは実行されない。
%inst
指定したイベントオブジェクトのいずれか、またはすべてがシグナル状態になる、タイムアウトが経過する、または I/O
完了ルーチンが実行されたときに戻る。

[戻り値]
WSAWaitForMultipleEvents 関数が成功した場合、戻り値は次のいずれかとなる。
このドキュメントは省略されている。

[備考]
WSAWaitForMultipleEvents
関数は、待機条件が満たされているかを判定する。満たされていない場合、呼び出しスレッドは待機状態に入る。待機中は CPU
時間を消費しない。指定オブジェクトのいずれか、またはすべてがシグナル状態になったとき、あるいはタイムアウトが経過したときに
WSAWaitForMultipleEvents は戻る。bWaitAll が TRUE
のとき、待機はすべてのオブジェクトがシグナル状態になった時点でのみ完了する。bWaitAll が FALSE
のとき、WSAWaitForMultipleEvents は lphEvents
を先頭から順にチェックし、最初にシグナル状態になったオブジェクトのインデックスを返す。fAlertable を TRUE
にすれば、アラート可能待機が可能となり、呼び出しスレッドで I/O 完了ルーチンが実行されたときに関数が戻る。スレッドは I/O
完了ルーチン (APC) を実行させるためにアラート可能待機状態にある必要がある。したがって、I/O
完了ルーチンを持つ保留中の非同期操作があっても fAlertable が FALSE なら、それら I/O
完了ルーチンは完了時であっても実行されない。fAlertable が TRUE で保留中の操作のいずれかが完了すると、APC が実行され
WSAWaitForMultipleEvents は WSA_IO_COMPLETION
を返す。このとき待機イベントはまだシグナル状態ではなく、アプリケーションは再度 WSAWaitForMultipleEvents
を呼び出さなければならない。イベントを待たずにアラート可能待機だけ行いたい場合は Windows の SleepEx
を使うべきである。現在の実装では WSAWaitForMultipleEvents は WaitForMultipleObjectsEx
を呼び出している。注: ウィンドウを直接/間接に作成するコードと共に WSAWaitForMultipleEvents
を使う場合は注意が必要である。スレッドがウィンドウを作成すればメッセージ処理が必要となる。メッセージブロードキャストはシステム内のすべてのウィンドウに送られる。dwTimeout
に WSA_INFINITE を指定したスレッドがウィンドウを持つとデッドロックの原因になりうる。サンプルコード: 次は
WSAWaitForMultipleEvents の使い方の例である。
このドキュメントは省略されている。


%index
WSCDeinstallProvider
指定したトランスポートプロバイダをシステム構成データベースから削除する。
%prm
lpProviderId, lpErrno
lpProviderId : [var] プロバイダの GUID へのポインタ。この値は各 WSAProtocol_Info 構造体に格納されている。
lpErrno : [var] 関数が失敗した場合のエラーコードへのポインタ。
%inst
指定したトランスポートプロバイダをシステム構成データベースから削除する。

[戻り値]
エラーがない場合、**WSCDeinstallProvider** はゼロを返す。そうでない場合は **SOCKET_ERROR**
を返し、lpErrno に特定のエラーコードが格納される。
このドキュメントは省略されている。

[備考]
**WSCDeinstallProvider** 関数は、指定したプロバイダの共通 Winsock 2
構成情報を削除する。正常終了後、レジストリ内の構成情報は変更されるが、現在メモリ上にある Ws2_32.dll
のインスタンスはこの変更を認識できない。成功した場合、**WSCDeinstallProvider**
は変更通知を登録した関心を持つアプリケーションに対し WSAProviderConfigChange
経由で通知を試みる。**WSCDeinstallProvider** は Administrators
グループのメンバとしてログオンしているユーザーのみが呼び出せる。そうでないユーザーが呼び出した場合は失敗し、lpErrno に
**WSANO_RECOVERY** が返される。
Windows Vista や Windows Server 2008 を実行しているコンピュータでは、ユーザーアカウント制御 (UAC)
が原因で失敗することもある。組み込みの Administrator 以外の Administrators
グループメンバが、マニフェストファイルで **requestedExecutionLevel** を
**requireAdministrator**
に設定していないアプリケーションを実行すると失敗する。マニフェストファイルが無い場合、組み込み Administrator 以外の
Administrators グループメンバは、組み込み Administrator として (RunAs administrator)
昇格済みシェルからアプリケーションを実行しなければ成功しない。

本関数の呼び出し元は、サービスプロバイダを完全にアンインストールするために必要な追加ファイルやサービスプロバイダ固有の構成情報を別途削除しなければならない。


%index
WSCEnableNSProvider
指定したネームスペースプロバイダの状態を変更する。
%prm
lpProviderId, fEnable
lpProviderId : [var] ネームスペースプロバイダの GUID へのポインタ。
fEnable : [int] **TRUE** ならプロバイダをアクティブ状態に、**FALSE** なら無効化してクエリ操作やサービス登録で使えなくする Boolean 値。
%inst
指定したネームスペースプロバイダの状態を変更する。

[戻り値]
エラーがない場合、**WSCEnableNSProvider** は **NO_ERROR** (0) を返す。関数が失敗すると
**SOCKET_ERROR** が返され、WSAGetLastError で適切なエラーコードを取得しなければならない。
このドキュメントは省略されている。

[備考]
**WSCEnableNSProvider** 関数はネームスペースプロバイダの状態を変更するために使う。独立系ソフトウェアベンダー
(ISV)
は、自社のプロバイダを有効化するために他社のネームスペースプロバイダを無効化すべきではない。選択はユーザーに委ねるべきである。**WSCEnableNSProvider**
はすでに実行中のアプリケーションには影響しない。新規インストールされたネームスペースプロバイダや状態変化はアプリケーションからは見えない。**WSCEnableNSProvider**
呼び出し後に起動されたアプリケーションにのみ変更が反映される。**WSCEnableNSProvider** は
Administrators グループのメンバとしてログオンしているユーザーのみが呼び出せる。そうでない場合は失敗する。
Windows Vista や Windows Server 2008 を実行しているコンピュータでは、UAC
が原因で失敗することもある。組み込みの Administrator 以外の Administrators グループメンバが、マニフェストで
**requireAdministrator** を設定していないアプリケーションを実行すると失敗する。マニフェストが無い場合、組み込み
Administrator 以外の Administrators メンバは RunAs administrator で実行する必要がある。


%index
WSCEnumProtocols
WSCEnumProtocols 関数は、利用可能なトランスポートプロトコルに関する情報を取得する。
%prm
lpiProtocols, lpProtocolBuffer, lpdwBufferLength, lpErrno
lpiProtocols : [var] iProtocol 値の **NULL** 終端配列。この引数は省略可能で、NULL にするとすべての利用可能プロトコルの情報が返される。そうでない場合は配列に列挙されたプロトコルのみ情報が取得される。
lpProtocolBuffer : [var] WSAPROTOCOL_INFOW 構造体を格納するバッファへのポインタ。
lpdwBufferLength : [var] 入力時は **WSCEnumProtocols** に渡す lpProtocolBuffer バッファのサイズ (バイト単位)。出力時は、要求した全情報を取得するために **WSCEnumProtocols** に渡すべき最小バッファサイズ (バイト単位)。
lpErrno : [var] エラーコードへのポインタ。
%inst
WSCEnumProtocols 関数は、利用可能なトランスポートプロトコルに関する情報を取得する。

[戻り値]
エラーがない場合、**WSCEnumProtocols** は報告対象のプロトコル数を返す。そうでない場合は SOCKET_ERROR
を返し、lpErrno に特定のエラーコードが格納される。
このドキュメントは省略されている。

[備考]
**WSCEnumProtocols**
関数は、ローカルコンピュータにインストールされたトランスポートプロトコルの集合に関する情報を取得するために使う。この関数は API 相当の
WSAEnumProtocols とは異なり、インストール済みすべてのプロトコルの WSAPROTOCOL_INFOW
構造体を返す。これには、Ws2_32.dll に対して WSAEnumProtocols の結果バッファには返さないことを示すため
**WSAPROTOCOL_INFOW** の **dwProviderFlags** に **PFL_HIDDEN**
を立てたプロバイダや、chain 長が 0 のダミー LSP プロバイダも含まれる。WSAEnumProtocols
はベースプロトコルと、**PFL_HIDDEN** フラグが立たず chain 長が 0
でないプロトコルチェーンしか返さない。**注**: Layered Service Provider は非推奨である。Windows 8
および Windows Server 2012 以降は Windows Filtering Platform
を使うこと。lpiProtocols を使えば取得情報を絞れる。通常は NULL
を渡し、全トランスポートプロトコルの情報を取得する。要求された各プロトコルについて WSAPROTOCOL_INFOW 構造体が
lpProtocolBuffer が指すバッファに格納される。バッファが小さすぎる場合、lpdwBufferLength
が必要サイズで更新される。Winsock SPI
クライアントは十分なバッファを確保して再度呼び出すべきである。**WSCEnumProtocols**
は複数回の呼び出しで分割列挙できない。渡すバッファは必要な全エントリを格納できる大きさでなければならない。これにより関数の複雑さが減り、ローカルコンピュータにインストールされるプロトコル数は通常少ないため問題にならない。構造体がバッファ内に並ぶ順序は、サービスプロバイダが
WS2_32.dll に登録した順、あるいはその後 Winsock アプレットで並び替えられた順と一致する。


%index
WSCGetApplicationCategory
アプリケーションに関連付けられた LSP (Layered Service Provider) カテゴリを取得する。
%prm
Path, PathLength, Extra, ExtraLength, pPermittedLspCategories, lpErrno
Path : [wstr] アプリケーションの実行イメージへのロードパスを含む Unicode 文字列へのポインタ。通常のパス解決規則に従い、%SystemRoot% などの埋め込み環境変数文字列を含めることもできる。
PathLength : [int] Path 引数の長さ (文字数)。終端の **NULL** は含まない。
Extra : [wstr] Path 引数で指定されたアプリケーション起動時のコマンドライン引数を表す Unicode 文字列へのポインタ。Extra 引数は、同じコマンドラインで起動される複数の異なるアプリケーションインスタンスを区別するために使う。Svchost.exe や Rundll32.exe の異なるインスタンスに対して異なる分類を行うためのものである。Path のみで十分でコマンドライン引数が不要な場合、Extra は **NULL** にすべきである。
ExtraLength : [int] Extra 引数の長さ (文字数)。終端の **NULL** は含まない。
pPermittedLspCategories : [var] このアプリケーションの全インスタンスで許可される LSP カテゴリを表す DWORD 値へのポインタ。アプリケーションは Path と Extra の組み合わせで識別される。
lpErrno : [var] 関数が失敗した場合のエラーコードへのポインタ。
%inst
アプリケーションに関連付けられた LSP (Layered Service Provider) カテゴリを取得する。

[戻り値]
エラーがない場合、**WSCGetApplicationCategory** は **ERROR_SUCCESS** (0)
を返す。そうでない場合は **SOCKET_ERROR** を返し、lpErrno に特定のエラーコードが格納される。
このドキュメントは省略されている。

[備考]
**WSCGetApplicationCategory** は、アプリケーションインスタンスに関連付けられた LSP
カテゴリフラグを取得するために使う。アプリケーションはそのコンテキスト内でどの LSP 挙動が許容されるか判断できる。許可する LSP
カテゴリを指定することで、その挙動を実装する Layered Service Provider のみがロードされるようにできる。Extra
引数は、同じ実行ファイル内でホストされる異なるアプリケーションやサービスをコマンドラインで区別する必要があるときに必須である。Svchost.exe
と Rundll32.exe はその代表例で、SvcHost.exe の **-k <svcinstance>**
スイッチでプロセスインスタンスを定義する。サービスではサービス名だけでは不十分で、Winsock カタログはプロセスにグローバルであり、1
プロセスが複数サービスをホストすることがあるためである。Winsock は最初の WSAStartup
呼び出し時にアプリケーションの識別と許可 LSP カテゴリの取得を行う。これがそのアプリケーションインスタンスの生存期間中の許可 LSP
カテゴリ集合となる。以降の変更は次のインスタンスまで反映されず、インスタンスの生存期間中に許可カテゴリは変化しない。Winsock 2
はレイヤードプロトコルに対応する。レイヤードプロトコルは高レベル通信機能のみを実装し、実際のデータ交換は下位のトランスポートスタックに依存する。例として、認証と暗号化合意のためにプロトコルを追加するセキュリティ層が挙げられる。このようなセキュリティプロトコルは
TCP や SPX など下位の信頼できるトランスポートを必要とする。ベースプロトコルは TCP や SPX
のように単独で通信可能なプロトコル、レイヤードプロトコルは単独では使えないプロトコルである。LSP 初期化時、LSP は Winsock
SPI 関数の関数ポインタを用意する。IFS を実装する LSP は自分で実装するか直下層のポインタをそのまま返すかを選択できる。非
IFS LSP は独自ハンドルを提供するので全 SPI を実装しなければならない。LSP は SPI
の部分集合に特有の追加処理を行うのが通常である。実装している SPI の部分集合と追加処理の性質に基づいて LSP
カテゴリを定義できる。LSP と Winsock ソケットを使うアプリケーションを分類することで、実行時に特定プロセスで LSP
を関与させるかを選択的に決められる。Windows Vista 以降では、LSP は Winsock
呼び出しやデータとの相互作用のしかたに基づいて分類できる。LSP カテゴリは Winsock SPI
関数部分集合に対する識別可能な挙動グループである。たとえば HTTP コンテンツフィルタはデータインスペクタ
(LSP_INSPECTOR) に分類される。LSP_INSPECTOR はデータ転送 SPI
関数の引数を検査するが変更はしない。アプリケーションは LSP のカテゴリをクエリし、許可カテゴリ集合に基づいて LSP
を読み込まない選択ができる。
このドキュメントは省略されている。


%index
WSCGetProviderInfo
Layered Service Provider (LSP) の情報クラスに関連付けられたデータを取得する。
%prm
lpProviderId, InfoType, Info, InfoSize, Flags, lpErrno
lpProviderId : [var] プロバイダの GUID へのポインタ。
InfoType : [int] この LSP プロトコルエントリに対して要求する情報クラス。
Info : [var] 要求された LSP プロトコルエントリの情報クラスデータを受け取るバッファへのポインタ。**NULL** の場合、**WSCGetProviderInfo** は失敗し、必要バッファサイズが InfoSize で返される。
InfoSize : [var] Info が指すバッファのサイズ (バイト単位)。Info が **NULL** なら **WSCGetProviderInfo** は失敗し、InfoSize に必要なサイズが返される。
Flags : [int] **WSCGetProviderInfo** 呼び出しの動作を変更するフラグ。
lpErrno : [var] 関数が失敗した場合のエラーコードへのポインタ。
%inst
Layered Service Provider (LSP) の情報クラスに関連付けられたデータを取得する。

[戻り値]
エラーがない場合、**WSCGetProviderInfo** は **ERROR_SUCCESS** (0) を返す。そうでない場合は
**SOCKET_ERROR** を返し、lpErrno に特定のエラーコードが格納される。
このドキュメントは省略されている。

[備考]
**WSCGetProviderInfo** は、Layered Service Provider
の情報クラスデータを取得するために使う。InfoType に **ProviderInfoLspCategories**
を指定した場合、成功時に **WSCGetProviderInfo** は LSP が実装する適切な LSP カテゴリフラグを Info
に設定して返す。Winsock 2
はレイヤードプロトコルに対応する。レイヤードプロトコルは高レベル通信機能のみを実装し、下位トランスポートスタックに実データ交換を依存する。認証と暗号化合意のためにプロトコルを追加するセキュリティ層が例で、このようなプロトコルは
TCP や SPX
等を必要とする。ベースプロトコルは単独で通信可能なプロトコル、レイヤードプロトコルは単独では使えないプロトコルである。プロトコルチェーンは
1 つ以上のレイヤードプロトコルをベースプロトコルで終端したものである。WSAProtocol_Info 構造体の
**ChainLen** が **BASE_PROTOCOL** (1) ならベース、**LAYERED_PROTOCOL** (0)
ならレイヤード、1 より大きければチェーンである。LSP 初期化時、LSP は Winsock SPI
関数のポインタを提供しなければならない。IFS LSP は自前実装か直下層のポインタをそのまま返すかを選択できる。非 IFS LSP
は独自ハンドルを持つため全 SPI を実装する必要がある。LSP は SPI の部分集合に追加処理を行う。これを基に LSP
カテゴリが定義される。Windows Vista 以降では Winsock 呼び出しとデータへの作用方法で分類される。LSP カテゴリは
SPI 部分集合上の識別可能な挙動群で、例えば HTTP コンテンツフィルタは LSP_INSPECTOR
に分類される。LSP_INSPECTOR はデータ転送 SPI 関数の引数を検査するが変更しない。アプリケーションは LSP
のカテゴリを問い合わせ、許可カテゴリに基づきロードしない選択ができる。
このドキュメントは省略されている。


%index
WSCGetProviderPath
WSCGetProviderPath 関数は、指定したプロバイダの DLL パスを取得する。
%prm
lpProviderId, lpszProviderDllPath, lpProviderDllPathLen, lpErrno
lpProviderId : [var] プロバイダの GUID へのポインタ。この値は WSCEnumProtocols で取得される。
lpszProviderDllPath : [wstr] プロバイダ DLL のパス文字列を返すバッファへのポインタ。パスは NULL 終端文字列で、%SystemRoot% のような埋め込み環境変数文字列は展開されない。
lpProviderDllPathLen : [var] lpszProviderDllPath が指すバッファのサイズ (文字数)。
lpErrno : [var] 関数が失敗した場合のエラーコードへのポインタ。
%inst
WSCGetProviderPath 関数は、指定したプロバイダの DLL パスを取得する。

[戻り値]
エラーがない場合、**WSCGetProviderPath** はゼロを返す。そうでない場合は SOCKET_ERROR
を返し、特定のエラーコードは lpErrno から取得できる。
このドキュメントは省略されている。

[備考]
**WSCGetProviderPath** 関数は、指定されたプロバイダの DLL パスを取得する。DLL パスには
%SystemRoot% のような埋め込み環境変数文字列が含まれる可能性があるため、Windows の LoadLibrary
で使う前に展開する必要がある。詳しくは **LoadLibrary** を参照。


%index
WSCInstallNameSpace
ネームスペースプロバイダをインストールする。(WSCInstallNameSpace)
%prm
lpszIdentifier, lpszPathName, dwNameSpace, dwVersion, lpProviderId
lpszIdentifier : [wstr] lpProviderId の GUID に関連付けられたプロバイダを識別する文字列へのポインタ。
lpszPathName : [wstr] プロバイダ DLL へのロードパスを含む Unicode 文字列へのポインタ。通常のパス解決規則に従い、%SystemRoot% などの埋め込み環境変数文字列を含めてよい。埋め込み環境変数文字列は、Ws2_32.dll がアプリケーションのためにプロバイダ DLL をロードするときに展開される。展開後、Ws2_32.dll は結果の文字列を LoadLibrary に渡してプロバイダをメモリにロードする。詳しくは **LoadLibrary** を参照。
dwNameSpace : [int] このプロバイダがサポートする名前空間。
dwVersion : [int] プロバイダのバージョン番号。
lpProviderId : [var] プロバイダの GUID へのポインタ。この GUID は Uuidgen.exe で生成すべきである。
%inst
ネームスペースプロバイダをインストールする。(WSCInstallNameSpace)

[戻り値]
エラーがない場合、**WSCInstallNameSpace** は **NO_ERROR** (0) を返す。関数が失敗すると
**SOCKET_ERROR** が返され、WSAGetLastError で適切なエラーコードを取得しなければならない。
このドキュメントは省略されている。

[備考]

名前空間構成関数はすでに実行中のアプリケーションには影響しない。新規インストールされたネームスペースプロバイダや状態変化はアプリケーションからは見えず、**WSCInstallNameSpace**
呼び出し後に起動されたアプリケーションにのみ変更が反映される。**WSCInstallNameSpace** は
Administrators グループのメンバとしてログオンしているユーザーのみが呼び出せる。そうでない場合は失敗する。Windows
Vista や Windows Server 2008 では、UAC が原因で失敗することもある。マニフェストで
**requireAdministrator** を設定していない場合、組み込み Administrator 以外の
Administrators メンバは RunAs administrator で実行する必要がある。


%index
WSCInstallNameSpaceEx
ネームスペースプロバイダをインストールする。(WSCInstallNameSpaceEx)
%prm
lpszIdentifier, lpszPathName, dwNameSpace, dwVersion, lpProviderId, lpProviderSpecific
lpszIdentifier : [wstr] lpProviderId の GUID に関連付けられたプロバイダを識別する文字列へのポインタ。
lpszPathName : [wstr] プロバイダ DLL へのロードパスを含む Unicode 文字列へのポインタ。通常のパス解決規則に従い、%SystemRoot% などの埋め込み環境変数文字列を含めてよい。埋め込み環境変数文字列は、Ws2_32.dll がアプリケーションのためにプロバイダ DLL をロードするときに展開される。展開後、Ws2_32.dll は結果の文字列を LoadLibrary に渡してプロバイダをメモリにロードする。詳しくは **LoadLibrary** を参照。
dwNameSpace : [int] このプロバイダがサポートする名前空間。
dwVersion : [int] プロバイダのバージョン番号。
lpProviderId : [var] プロバイダの GUID へのポインタ。この GUID は Uuidgen.exe で生成すべきである。
lpProviderSpecific : [var] 名前空間エントリに関連付けられたプロバイダ固有データブロブ。
%inst
ネームスペースプロバイダをインストールする。(WSCInstallNameSpaceEx)

[戻り値]
エラーがない場合、**WSCInstallNameSpaceEx** は **NO_ERROR** (0) を返す。関数が失敗すると
**SOCKET_ERROR** が返され、WSAGetLastError で適切なエラーコードを取得しなければならない。
このドキュメントは省略されている。

[備考]

名前空間構成関数はすでに実行中のアプリケーションには影響しない。新規インストールされたネームスペースプロバイダや状態変化はアプリケーションからは見えず、**WSCInstallNameSpaceEx**
呼び出し後に起動されたアプリケーションにのみ変更が反映される。lpProviderInfo
引数で渡される名前空間エントリ関連のプロバイダ固有データブロブは、WSAEnumNameSpaceProvidersEx
で問い合わせ可能である。Windows に同梱されているネームスペースプロバイダで lpProviderInfo を使うのは
NS_EMAIL プロバイダのみである。NS_EMAIL のデータブロブは NAPI_PROVIDER_INSTALLATION_BLOB
構造体である。**WSCInstallNameSpaceEx** は Administrators
グループのメンバとしてログオンしているユーザーのみが呼び出せる。そうでない場合は失敗する。Windows Vista や Windows
Server 2008 では UAC が原因で失敗することもある。マニフェストで **requireAdministrator**
を設定していない場合、組み込み Administrator 以外の Administrators メンバは RunAs
administrator で実行する必要がある。


%index
WSCInstallProvider
指定したトランスポートプロバイダをシステム構成データベースにインストールする。
%prm
lpProviderId, lpszProviderDllPath, lpProtocolInfoList, dwNumberOfEntries, lpErrno
lpProviderId : [var] プロバイダの GUID へのポインタ。
lpszProviderDllPath : [wstr] プロバイダ DLL へのロードパスを含む Unicode 文字列へのポインタ。通常のパス解決規則に従い、%SystemRoot% などの埋め込み環境変数文字列を含めてよい。埋め込み環境変数文字列は、Ws2_32.dll がアプリケーションのためにプロバイダ DLL をロードするときに展開される。展開後、Ws2_32.dll は結果の文字列を LoadLibrary に渡してプロバイダをメモリにロードする。詳しくは **LoadLibrary** を参照。
lpProtocolInfoList : [var] WSAProtocol_Info 構造体の配列へのポインタ。各構造体は、プロバイダがサポートするプロトコル、アドレスファミリ、ソケット種別を定義する。
dwNumberOfEntries : [int] lpProtocolInfoList 配列のエントリ数。
lpErrno : [var] 関数が失敗した場合のエラーコードへのポインタ。
%inst
指定したトランスポートプロバイダをシステム構成データベースにインストールする。

[戻り値]
成功した場合、**WSCInstallProvider** はゼロを返す。そうでない場合は **SOCKET_ERROR**
を返し、lpErrno に特定のエラーコードが格納される。
このドキュメントは省略されている。

[備考]
**WSCInstallProvider**
は単一のトランスポートサービスプロバイダをインストールするために使う。このルーチンは指定プロバイダのための共通 Winsock 2
構成情報を作成する。ベースプロトコル、レイヤードプロトコル、プロトコルチェーンに適用できる。LSP をインストールする場合は
WSCInstallProviderAndChains を使うべきである。**WSCInstallProviderAndChains**
は 1 回の呼び出しでレイヤードプロトコルと 1 つ以上のプロトコルチェーンをインストールできる。同じことを
**WSCInstallProvider** で行うには複数回の呼び出しが必要である。Winsock 2
はレイヤードプロトコルに対応する。レイヤードプロトコルは高レベル通信機能のみを実装し、実データ交換は下位トランスポートスタックに依存する。ベースプロトコルは
TCP や SPX
のように単独で通信可能なプロトコル、レイヤードプロトコルは単独で使えないプロトコルである。lpProtocolInfoList
はインストールするプロトコルエントリのリストで、呼び出し元が適切に用意する必要がある。NULL
であってはならない。呼び出しが成功すると、以降の WSAEnumProtocols や WSCEnumProtocols
呼び出しは新しく作られたプロトコルエントリも返す。Windows 環境では、成功後に WSAStartup で作成された
Ws2_32.dll インスタンスのみが新しいエントリを **WSAEnumProtocols** や
**WSCEnumProtocols** の戻り値に含む。**注**: WSAEnumProtocols
はレイヤードプロトコルエントリを列挙しないが、WSCEnumProtocols は列挙する。
成功した場合、**WSCInstallProvider** は変更通知を登録した関心を持つアプリケーションに対し
WSAProviderConfigChange 経由で通知を試みる。**WSCInstallProvider** は
Administrators グループのメンバとしてログオンしているユーザーのみが呼び出せる。そうでない場合は失敗し、lpErrno に
WSANO_RECOVERY が返される。Windows Vista や Windows Server 2008 では UAC
が原因で失敗することもある。マニフェストで **requireAdministrator** を設定していない場合、組み込み
Administrator 以外の Administrators メンバは **RunAs administrator**
で実行する必要がある。ファイルのインストールやサービスプロバイダ固有の構成は呼び出し元が行う。


%index
WSCSetApplicationCategory
アプリケーションに関連付けられた許可 LSP (Layered Service Provider) カテゴリを設定する。
%prm
Path, PathLength, Extra, ExtraLength, PermittedLspCategories, pPrevPermLspCat, lpErrno
Path : [wstr] アプリケーションの実行イメージへのロードパスを含む Unicode 文字列へのポインタ。通常のパス解決規則に従い、%SystemRoot% などの埋め込み環境変数文字列を含めてよい。
PathLength : [int] Path 引数の長さ (文字数)。終端の **NULL** は含まない。
Extra : [wstr] Path 引数で指定されたアプリケーション起動時のコマンドライン引数を表す Unicode 文字列へのポインタ。Extra 引数は同じコマンドラインで起動される複数の異なるインスタンスを区別するために使う。Path のみで十分な場合、Extra は **NULL** にすべきである。
ExtraLength : [int] Extra 引数の長さ (文字数)。終端の **NULL** は含まない。
PermittedLspCategories : [int] このアプリケーションの全インスタンスで許可する LSP カテゴリの DWORD 値。アプリケーションは Path と Extra の組み合わせで識別される。
pPrevPermLspCat : [var] このアプリケーションの全インスタンスで以前許可されていた LSP カテゴリ集合を受け取るポインタ。省略可能で **NULL** にできる。
lpErrno : [var] 関数が失敗した場合のエラーコードへのポインタ。
%inst
アプリケーションに関連付けられた許可 LSP (Layered Service Provider) カテゴリを設定する。

[戻り値]
エラーがない場合、**WSCSetApplicationCategory** は **ERROR_SUCCESS** (0)
を返す。そうでない場合は **SOCKET_ERROR** を返し、lpErrno に特定のエラーコードが格納される。
このドキュメントは省略されている。

[備考]
**WSCSetApplicationCategory** はアプリケーションインスタンスに関連付ける LSP
カテゴリフラグを設定するために使う。アプリケーションはどの LSP 挙動が許容されるかを判断でき、指定した挙動を実装する LSP
のみをロードできるようにできる。Extra
引数はコマンドラインで同一実行ファイル内のアプリケーション/サービスインスタンスを区別する必要があるときに必須である。代表例は
Svchost.exe と Rundll32.exe である。SvcHost.exe では **-k <svcinstance>**
スイッチでプロセスインスタンスを定義する。サービスではサービス名だけでは不十分である。Winsock カタログはプロセスにグローバルで、1
プロセスが複数サービスをホストできるためである。同じアプリケーション (フルパス、EXE 名、引数が同一) に対して
**WSCSetApplicationCategory** を複数回呼ぶと、カテゴリは OR 結合される。たとえば "c:\foo.exe
-param" に LSP_SYSTEM を設定後に LSP_REDIRECTOR を設定すると、エントリは LSP_SYSTEM |
LSP_REDIRECTOR となる。これは 1 つの EXE が複数アプリケーションをホストする状況 (svchost.exe など)
に対応するための設計である。
Winsock は最初の WSAStartup 呼び出し時にアプリケーションを識別し、許可 LSP
カテゴリを取得する。インスタンスの生存期間中はその集合が許可カテゴリとなる。以降の変更は次のインスタンス起動まで反映されず、生存期間中は不変である。Winsock
2 はレイヤードプロトコルに対応する (以下、WSCGetApplicationCategory の説明と同様)。LSP
カテゴリの分類基準も同様で、たとえば HTTP コンテンツフィルタは **LSP_INSPECTOR** に分類される。アプリケーションは
LSP のカテゴリを問い合わせ、許可カテゴリ集合に基づいてロードしない選択ができる。
このドキュメントは省略されている。


%index
WSCSetProviderInfo
Layered Service Provider (LSP) の指定情報クラスに対するデータ値を設定する。
%prm
lpProviderId, InfoType, Info, InfoSize, Flags, lpErrno
lpProviderId : [var] プロバイダの GUID へのポインタ。
InfoType : [int] この LSP プロトコルエントリに対して設定する情報クラス。
Info : [var] LSP プロトコルエントリに設定する情報クラスデータを含むバッファへのポインタ。
InfoSize : [int] Info が指すバッファのサイズ (バイト単位)。
Flags : [int] **WSCSetProviderInfo** 呼び出しの動作を変更するフラグ。
lpErrno : [var] 関数が失敗した場合のエラーコードへのポインタ。
%inst
Layered Service Provider (LSP) の指定情報クラスに対するデータ値を設定する。

[戻り値]
エラーがない場合、**WSCSetProviderInfo** は **ERROR_SUCCESS** (0) を返す。そうでない場合は
**SOCKET_ERROR** を返し、lpErrno に特定のエラーコードが格納される。
このドキュメントは省略されている。

[備考]
**WSCSetProviderInfo** は、Layered Service Provider
の情報クラスデータを設定するために使う。InfoType に **ProviderInfoLspCategories**
を指定した場合、Info 引数に渡した値に基づいてプロバイダが実装する LSP カテゴリフラグを設定する。Winsock 2
はレイヤードプロトコルに対応する (以下、WSCGetProviderInfo の説明と同様)。LSP カテゴリは SPI
部分集合上の識別可能な挙動群で、例えば HTTP コンテンツフィルタは **LSP_INSPECTOR**
に分類される。**LSP_INSPECTOR** はデータ転送 SPI 関数の引数を検査するが変更しない。アプリケーションは LSP
のカテゴリを問い合わせ、許可カテゴリ集合に基づいてロードしない選択ができる。
このドキュメントは省略されている。


%index
WSCUnInstallNameSpace
指定したネームスペースプロバイダをアンインストールする。
%prm
lpProviderId
lpProviderId : [var] アンインストールするネームスペースプロバイダの GUID へのポインタ。
%inst
指定したネームスペースプロバイダをアンインストールする。

[戻り値]
エラーがない場合、**WSCUnInstallNameSpace** は **NO_ERROR** (0) を返す。関数が失敗すると
**SOCKET_ERROR** が返され、WSAGetLastError で適切なエラーコードを取得しなければならない。
このドキュメントは省略されている。

[備考]

名前空間構成関数はすでに実行中のアプリケーションには影響しない。新規インストールされたネームスペースプロバイダや状態変化はアプリケーションからは見えず、**WSCUnInstallNameSpace**
呼び出し後に起動されたアプリケーションにのみ変更が反映される。成功した場合、**WSCUnInstallNameSpace**
は変更通知を登録した関心を持つアプリケーションに対し WSAProviderConfigChange
経由で通知を試みる。**WSCUnInstallNameSpace** は Administrators
グループのメンバとしてログオンしているユーザーのみが呼び出せる。そうでない場合は失敗し、lpErrno に
**WSANO_RECOVERY** が返される。
Windows Vista や Windows Server 2008 では UAC が原因で失敗することもある。マニフェストで
**requireAdministrator** を設定していない場合、組み込み Administrator 以外の
Administrators メンバは RunAs administrator で実行する必要がある。

本関数の呼び出し元は、サービスプロバイダを完全にアンインストールするために必要な追加ファイルやサービスプロバイダ固有の構成情報を別途削除しなければならない。


%index
WSCUpdateProvider
指定したトランスポートプロバイダをシステム構成データベース内で変更する。
%prm
lpProviderId, lpszProviderDllPath, lpProtocolInfoList, dwNumberOfEntries, lpErrno
lpProviderId : [var] プロバイダの GUID へのポインタ。
lpszProviderDllPath : [wstr] プロバイダの 64 ビット DLL へのロードパスを含む Unicode 文字列へのポインタ。通常のパス解決規則に従い、%SystemRoot% などの埋め込み環境変数文字列を含めてよい。埋め込み環境変数文字列は、Ws2_32.dll がアプリケーションのためにプロバイダ DLL をロードするときに展開される。展開後、Ws2_32.dll は結果の文字列を LoadLibrary に渡してプロバイダをメモリにロードする。詳しくは **LoadLibrary** を参照。
lpProtocolInfoList : [var] WSAProtocol_Info 構造体の配列へのポインタ。各構造体は、プロバイダがサポートするプロトコル、アドレスファミリ、ソケット種別を指定または変更する。
dwNumberOfEntries : [int] lpProtocolInfoList 配列のエントリ数。
lpErrno : [var] 関数が失敗した場合のエラーコードへのポインタ。
%inst
指定したトランスポートプロバイダをシステム構成データベース内で変更する。

[戻り値]
エラーがない場合、**WSCUpdateProvider** はゼロを返す。そうでない場合は **SOCKET_ERROR**
を返し、lpErrno に特定のエラーコードが格納される。
このドキュメントは省略されている。

[備考]
**WSCUpdateProvider** 関数は、指定されたプロバイダの Winsock 2
構成情報を変更する。ベースプロトコル、レイヤードプロトコル、プロトコルチェーンに適用できる。Winsock 2
はレイヤードプロトコルに対応する (以下、他 LSP 関数と同様の説明)。成功した場合、**WSCUpdateProvider**
は変更通知を登録した関心を持つアプリケーションに対し WSAProviderConfigChange
経由で通知を試みる。**WSCUpdateProvider** は Administrators
グループのメンバとしてログオンしているユーザーのみが呼び出せる。そうでない場合は失敗する。
Windows Vista や Windows Server 2008 では UAC が原因で失敗することもある。マニフェストで
**requireAdministrator** を設定していない場合、組み込み Administrator 以外の
Administrators メンバは RunAs administrator
で実行する必要がある。ファイルのインストールやサービスプロバイダ固有の構成は呼び出し元が行う。


%index
WSCWriteNameSpaceOrder
利用可能な Windows Sockets (Winsock) 2 ネームスペースプロバイダの順序を変更する。ネームスペースプロバイダの順序は、名前解決で列挙/問い合わせされる際の名前空間の優先度を決める。
%prm
lpProviderId, dwNumberOfEntries
lpProviderId : [var] WSANAMESPACE_INFO 構造体に含まれる NSProviderId 要素の配列。NSProviderId 要素の並びがネームスペースプロバイダの新しい優先順位となる。
dwNumberOfEntries : [int] NSProviderId 配列の要素数。
%inst
利用可能な Windows Sockets (Winsock) 2
ネームスペースプロバイダの順序を変更する。ネームスペースプロバイダの順序は、名前解決で列挙/問い合わせされる際の名前空間の優先度を決める。

[戻り値]
ルーチンが成功すると ERROR_SUCCESS (0) を返す。そうでない場合は特定のエラーコードを返す。
このドキュメントは省略されている。

[備考]
ネームスペースプロバイダは WSCInstallNameSpace 関数でインストールされる。インストール順は
WSAEnumNameSpaceProviders での既定の列挙順を決め、名前解決時に考慮される順も決める。この順序は
WSCWriteNameSpaceOrder 関数で変更できる。64 ビットプラットフォームでは、64 ビットプロセスから 32
ビットネームスペースプロバイダカタログの順序を変更できるよう WSCWriteNameSpaceOrder32 関数が用意されている。64
ビットプラットフォームでは、32 ビットネームスペースプロバイダカタログには WSCInstallNameSpace32
でインストールする。現在のネームスペースプロバイダカタログは HKEY_LOCAL_MACHINE\SYSTEM\Current
Control Set\Services\Winsock2\Parameters\NameSpace_Catalog5 に格納されている。
名前解決要求は
WSALookupServiceBegin、WSALookupServiceNext、WSALookupServiceEnd
ルーチンで行う。WSALookupServiceBegin に渡す WSAQUERYSET の dwNameSpace
メンバには、検索を制限する単一名前空間 (例: NS_DNS) または NS_ALL を設定する。特定名前空間 (例: NS_DNS)
を複数プロバイダがサポートしている場合、lpNSProviderId
を特定プロバイダに設定しない限り全プロバイダの結果が返される。dwNameSpace が NS_ALL
なら全プロバイダの結果が返る。返される順序はカタログ上のプロバイダ順に依存する。Windows SDK には SpOrder.exe
が含まれており、インストール済みネームスペースプロバイダのカタログを表示できる。Winsock 2 には ws2_32.dll
が含まれ、カタログを並び替える WSCWriteNameSpaceOrder をエクスポートしている。このインターフェースは
WS2_32.lib とリンクすることで取り込める。Windows XP SP2、Windows Server 2003 SP1
以降では、netsh.exe winsock show catalog
コマンドでプロトコル/ネームスペースプロバイダを表示できる。WSCWriteNameSpaceOrder は Administrators
グループメンバのみ呼び出せる。そうでない場合は失敗し、lpErrno に WSANO_RECOVERY が返される。Windows
Vista や Windows Server 2008 では UAC が原因で失敗することもある。以下は
WSCWriteNameSpaceOrder が失敗するシナリオ例である。
このドキュメントは省略されている。


%index
WSCWriteProviderOrder
利用可能なトランスポートプロバイダの順序を変更するために使う。
%prm
lpwdCatalogEntryId, dwNumberOfEntries
lpwdCatalogEntryId : [var] WSAPROTOCOL_INFO 構造体に含まれる CatalogEntryId 要素の配列へのポインタ。CatalogEntryId 要素の並びがプロトコルの新しい優先順位となる。
dwNumberOfEntries : [int] lpwdCatalogEntryId 配列の要素数。
%inst
利用可能なトランスポートプロバイダの順序を変更するために使う。

[戻り値]
ルーチンが成功すると ERROR_SUCCESS (0) を返す。そうでない場合は特定のエラーコードを返す。
このドキュメントは省略されている。

[備考]
トランスポートサービスプロバイダのインストール順は、サービスプロバイダインターフェースの
WSCEnumProtocols、アプリケーションインターフェースの WSAEnumProtocols
で列挙される順を決める。この順はクライアントがアドレスファミリ、種別、プロトコル ID
に基づいてソケット作成を要求するときに考慮される順も決める。Winsock 2 には Sporder.exe
が含まれ、インストール済みプロトコルのカタログを対話的に並び替えられる。Winsock 2 には補助 DLL Sporder.dll
もあり、プロトコル並び替えの手続き型インターフェースをエクスポートしている。Sporder.lib とリンクすることで取り込める。
以下は WSCWriteProviderOrder が失敗するシナリオである。
このドキュメントは省略されている。

