; ============================================================
;   userenv.dll ヘルプ (CsWin32 / win32metadata から自動抽出)
;   docs_ja.json に日本語訳があればそちらを使用、無ければ英語原文。
;   翻訳を追加するときは docs_ja.json を編集して再生成。
; ============================================================

%index
CreateAppContainerProfile
Windows ストアアプリ用に、ユーザー単位かつアプリ単位のプロファイルを作成する。
%group
Win32 userenv
%prm
pszAppContainerName, pszDisplayName, pszDescription, pCapabilities, dwCapabilityCount, ppSidAppContainerSid
pszAppContainerName : [wstr] アプリコンテナの名前。一意性を保つため、文字列にはアプリ名に加えて発行者名を含めることが推奨される。この文字列は最大 64 文字まで指定できる。さらに、正規表現 "[-_. A-Za-z0-9]+" に示すパターンに一致していなければならない。
pszDisplayName : [wstr] 表示名。この文字列は最大 512 文字まで指定できる。
pszDescription : [wstr] アプリコンテナの説明。この文字列は最大 2048 文字まで指定できる。
pCapabilities : [var] 要求するケーパビリティを定義する SID。
dwCapabilityCount : [int] pCapabilities 内の SID の数。
ppSidAppContainerSid : [var] プロファイルの SID。このバッファは FreeSid 関数で解放する必要がある。
%inst
Windows ストアアプリ用に、ユーザー単位かつアプリ単位のプロファイルを作成する。

[戻り値]
この関数が成功した場合は、次を含む標準的な HRESULT コードを返す。
（以下省略）

[備考]
プロファイルには、ユーザー単位かつアプリ単位のフォルダとレジストリ領域が含まれる。フォルダには他のユーザーやアプリからのアクセスを防ぐ
ACL が設定されている。これらのフォルダは SHGetKnownFolderPath
を呼び出してアクセスできる。この関数は現在のユーザーに対するプロファイルを作成する。別のユーザーに代わってプロファイルを作成するには、そのユーザーとして偽装する必要がある。同じアプリを使う複数のユーザー向けにプロファイルを作成するには、ユーザーごとに
CreateAppContainerProfile を呼び出す必要がある。


%index
CreateEnvironmentBlock
指定ユーザーの環境変数を取得する。このブロックは CreateProcessAsUser に渡せる。
%group
Win32 userenv
%prm
lpEnvironment, hToken, bInherit
lpEnvironment : [var] 型: LPVOID* 関数復帰時、新しい環境ブロックへのポインタを受け取る。環境ブロックは NULL 終端 Unicode 文字列の配列で、2 つの NULL (\0\0) で終わる。
hToken : [intptr] 型: HANDLE ユーザーのトークン。LogonUser などで取得する。プライマリトークンの場合は TOKEN_QUERY および TOKEN_DUPLICATE アクセスが必要。インパーソネーショントークンなら TOKEN_QUERY のみでよい。
bInherit : [int] 型: BOOL 現プロセスの環境を継承するか。TRUE で継承、FALSE で非継承。
%inst
指定ユーザーの環境変数を取得する。このブロックは CreateProcessAsUser に渡せる。

[戻り値]
型: BOOL 成功時は TRUE、失敗時は FALSE。拡張エラー情報は GetLastError で取得する。

[備考]
使用後は DestroyEnvironmentBlock でバッファを解放する。CreateProcessAsUser に渡す場合は
CREATE_UNICODE_ENVIRONMENT フラグを必ず指定する。CreateProcessAsUser
から復帰後、新プロセスは環境ブロックのコピーを持つため DestroyEnvironmentBlock
を安全に呼べる。%USERPROFILE% などユーザー固有変数はユーザープロファイルがロードされているときのみ設定されるため、必要なら
LoadUserProfile を呼ぶ。


%index
CreateProfile
新しいユーザープロファイルを作成する。
%group
Win32 userenv
%prm
pszUserSid, pszUserName, pszProfilePath, cchProfilePath
pszUserSid : [wstr] 型: LPCWSTR ユーザーの SID を文字列として指すポインタ。
pszUserName : [wstr] 型: LPCWSTR 新規ユーザーのユーザー名。この名前はプロファイルディレクトリのベース名として使用される。
pszProfilePath : [wstr] 型: LPWSTR 関数が戻るときに、プロファイルのフルパスへのポインタを格納する。
cchProfilePath : [int] 型: DWORD pszProfilePath が指すバッファのサイズ (文字単位)。
%inst
新しいユーザープロファイルを作成する。

[戻り値]
型: HRESULT 成功した場合は S_OK を、それ以外の場合はエラー値を返す。次のようなエラーを含む。
（以下省略）

[備考]
この関数を呼び出すには、呼び出し側に管理者権限が必要である。


%index
DeleteAppContainerProfile
指定したユーザー単位かつアプリ単位のプロファイルを削除する。
%group
Win32 userenv
%prm
pszAppContainerName
pszAppContainerName : [wstr] CreateAppContainerProfile 関数の呼び出しで指定したプロファイル名。この文字列は最大 64 文字で、正規表現 "[-_. A-Za-z0-9]+" に示すパターンに一致する。
%inst
指定したユーザー単位かつアプリ単位のプロファイルを削除する。

[戻り値]
この関数が成功した場合は、次を含む標準的な HRESULT コードを返す。
（以下省略）

[備考]
最良の結果を得るには、DeleteAppContainerProfile
関数を呼び出す前にプロファイル格納場所内のすべてのファイルハンドルを閉じること。そうしないと、この関数はプロファイルの格納場所を完全には削除できない可能性がある。この関数は現在のユーザーのプロファイルを削除する。別のユーザーのプロファイルを削除するには、そのユーザーとして偽装する必要がある。関数が失敗した場合、プロファイルの状態は不定となり、操作を完了するために
DeleteAppContainerProfile を再度呼び出す必要がある。


%index
DeleteProfileW
指定したコンピューターからユーザープロファイルとすべてのユーザー関連設定を削除する。呼び出し側はユーザーのプロファイルを削除するための管理者権限が必要である。(Unicode)
%group
Win32 userenv
%prm
lpSidString, lpProfilePath, lpComputerName
lpSidString : [wstr] 型: LPCTSTR ユーザー SID を指定する文字列へのポインタ。
lpProfilePath : [wstr] 型: LPCTSTR プロファイルパスを指定する文字列へのポインタ。このパラメータが NULL の場合、関数はレジストリからパスを取得する。
lpComputerName : [wstr] 型: LPCTSTR プロファイルを削除するコンピューターの名前を指定する文字列へのポインタ。このパラメータが NULL の場合、ローカルコンピューター名が使われる。
%inst

指定したコンピューターからユーザープロファイルとすべてのユーザー関連設定を削除する。呼び出し側はユーザーのプロファイルを削除するための管理者権限が必要である。(Unicode)

[戻り値]
型: BOOL 成功した場合は TRUE、それ以外は FALSE を返す。拡張エラー情報を取得するには GetLastError
を呼び出す。

[備考]
DeleteProfile は、ローカルシステムアカウント (S-1-5-18) のセキュリティ識別子 (SID)
を渡した場合に失敗することがある。
> [!NOTE] > userenv.h ヘッダーは DeleteProfile をエイリアスとして定義しており、UNICODE
プリプロセッサ定数の定義に応じて ANSI 版または Unicode
版を自動的に選択する。エンコーディング非依存のエイリアスと、エンコーディング非依存でないコードを混在して使うと、コンパイルエラーや実行時エラーの原因になる可能性がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
DeriveAppContainerSidFromAppContainerName
指定したプロファイルの SID を取得する。
%group
Win32 userenv
%prm
pszAppContainerName, ppsidAppContainerSid
pszAppContainerName : [wstr] プロファイルの名前。
ppsidAppContainerSid : [var] プロファイルの SID。このバッファは FreeSid 関数で解放する必要がある。
%inst
指定したプロファイルの SID を取得する。

[戻り値]
この関数は次のいずれかの値を返す。
（以下省略）


%index
DeriveRestrictedAppContainerSidFromAppContainerSidAndRestrictedName
DeriveRestrictedAppContainerSidFromAppContainerSidAndRestrictedName は将来の利用のために予約されている。
%group
Win32 userenv
%prm
psidAppContainerSid, pszRestrictedAppContainerName, ppsidRestrictedAppContainerSid
psidAppContainerSid : [int] 予約済み。
pszRestrictedAppContainerName : [wstr] 予約済み。
ppsidRestrictedAppContainerSid : [var] 予約済み。
%inst
DeriveRestrictedAppContainerSidFromAppContainerSidAndRestrictedName
は将来の利用のために予約されている。

[戻り値]
予約済み。


%index
DestroyEnvironmentBlock
CreateEnvironmentBlock で作成された環境変数を解放する。
%group
Win32 userenv
%prm
lpEnvironment
lpEnvironment : [intptr] 型: LPVOID CreateEnvironmentBlock で作成された環境ブロックへのポインタ。NULL 終端 Unicode 文字列の配列で、2 つの NULL (\0\0) で終わる。
%inst
CreateEnvironmentBlock で作成された環境変数を解放する。

[戻り値]
型: BOOL 成功時は TRUE、失敗時は FALSE。拡張エラー情報は GetLastError で取得する。


%index
EnterCriticalPolicySection
EnterCriticalPolicySection 関数は、アプリケーションがポリシー設定を安全に読み取れるようにするため、ポリシーの適用を一時停止する。
%group
Win32 userenv
%prm
bMachine
bMachine : [int] コンピューターポリシーとユーザーポリシーのどちらの適用を停止するかを指定する値。TRUE の場合、システムはコンピューターポリシーの適用を停止する。FALSE の場合、システムはユーザーポリシーの適用を停止する。
%inst
EnterCriticalPolicySection
関数は、アプリケーションがポリシー設定を安全に読み取れるようにするため、ポリシーの適用を一時停止する。

[戻り値]
関数が成功した場合は、ポリシーセクションへのハンドルを返す。失敗した場合は NULL を返す。拡張エラー情報を取得するには
GetLastError 関数を呼び出す。

[備考]
アプリケーションがクリティカルセクションを保持できる最大時間は 10 分である。10
分経過するとシステムはクリティカルセクションを解放し、ポリシーが再び適用される。コンピューターとユーザーの両方のクリティカルセクションオブジェクトを取得するには、ユーザーのクリティカルセクションオブジェクトをコンピューターのものより先に取得する。これによりデッドロックを防げる。ハンドルを閉じるには
LeaveCriticalPolicySection 関数を呼び出す。ポリシーセクションハンドルは他の Windows 関数では使えない。


%index
ExpandEnvironmentStringsForUserW
指定ユーザー用に確立された環境ブロックを使用してソース文字列を展開する。(Unicode)
%group
Win32 userenv
%prm
hToken, lpSrc, lpDest, dwSize
hToken : [intptr] 型: HANDLE ユーザーのトークン。LogonUser、CreateRestrictedToken、DuplicateToken、OpenProcessToken、OpenThreadToken などで取得する。TOKEN_IMPERSONATE、TOKEN_QUERY、Windows 7 以降は TOKEN_DUPLICATE も必要。NULL の場合、環境ブロックはシステム変数のみを含む。
lpSrc : [wstr] 型: LPCTSTR 展開対象の NULL 終端ソース文字列へのポインタ。
lpDest : [wstr] 型: LPTSTR 展開後の文字列を受け取るバッファへのポインタ。
dwSize : [int] 型: DWORD lpDest バッファのサイズ(TCHAR 単位)。
%inst
指定ユーザー用に確立された環境ブロックを使用してソース文字列を展開する。(Unicode)

[戻り値]
型: BOOL 成功時は TRUE、失敗時は FALSE。拡張エラー情報は GetLastError で取得する。

[備考]
ソース文字列の例は以下の通り。
（以下省略）


%index
FreeGPOListW
FreeGPOList 関数は指定した GPO のリストを解放する。(Unicode)
%group
Win32 userenv
%prm
pGPOList
pGPOList : [var] GPO 構造体のリストへのポインタ。このリストは GetGPOList または GetAppliedGPOList 関数から返される。詳細は GROUP_POLICY_OBJECT を参照。
%inst
FreeGPOList 関数は指定した GPO のリストを解放する。(Unicode)

[戻り値]
関数が成功した場合は 0 以外の値を返し、失敗した場合は 0 を返す。拡張エラー情報を取得するには GetLastError を呼び出す。

[備考]
> [!NOTE] > userenv.h ヘッダーは FreeGPOList をエイリアスとして定義しており、UNICODE
プリプロセッサ定数の定義に応じて ANSI 版または Unicode
版を自動的に選択する。エンコーディング非依存のエイリアスと、エンコーディング非依存でないコードを混在して使うと、コンパイルエラーや実行時エラーの原因になる可能性がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
GenerateGPNotification
(no summary)
%group
Win32 userenv
%prm
bMachine, lpwszMgmtProduct, dwMgmtProductOptions
bMachine : [int] 
lpwszMgmtProduct : [wstr] 
dwMgmtProductOptions : [int] 
%inst



%index
GetAllUsersProfileDirectoryW
すべてのユーザーで共有されるプログラムデータが格納されるディレクトリのルートへのパスを取得する。(Unicode)
%group
Win32 userenv
%prm
lpProfileDir, lpcchSize
lpProfileDir : [wstr] 型: LPTSTR 関数が成功して戻るときにパスを受け取るバッファへのポインタ。必要なバッファサイズ (終端の null 文字を含む) を調べるには NULL を設定する。
lpcchSize : [var] 型: LPDWORD lpProfileDir バッファのサイズ (TCHAR 単位) へのポインタ。
%inst
すべてのユーザーで共有されるプログラムデータが格納されるディレクトリのルートへのパスを取得する。(Unicode)

[戻り値]
型: BOOL 成功した場合は TRUE、それ以外は FALSE を返す。拡張エラー情報を取得するには GetLastError
を呼び出す。

[備考]
以下は Windows XP で GetAllUsersProfileDirectory が返すパスの例である。
（以下省略）


%index
GetAppContainerFolderPath
指定したアプリコンテナのローカルアプリデータフォルダのパスを取得する。
%group
Win32 userenv
%prm
pszAppContainerSid, ppszPath
pszAppContainerSid : [wstr] アプリコンテナの SID へのポインタ。
ppszPath : [var] 関数が成功して戻るときにローカルフォルダのパスを受け取る文字列へのポインタのアドレス。呼び出し側は、文字列が不要になったら CoTaskMemFree 関数を呼び出して解放する責任を負う。
%inst
指定したアプリコンテナのローカルアプリデータフォルダのパスを取得する。

[戻り値]
この関数は次を含む HRESULT コードを返す。
（以下省略）

[備考]
この関数で取得できるパスは、SHGetKnownFolderPath 関数に FOLDERID_LocalAppData
を指定して呼び出したときに得られるパスと同じである。スレッドトークンが設定されている場合、この関数は現在のユーザー向けのアプリコンテナを使う。スレッドトークンが設定されていない場合は、プロセス
ID に関連付けられたアプリコンテナを使う。


%index
GetAppContainerRegistryLocation
アプリコンテナに関連付けられたレジストリ格納場所を取得する。
%group
Win32 userenv
%prm
desiredAccess, phAppContainerKey
desiredAccess : [int] 型: REGSAM 望むレジストリアクセス。
phAppContainerKey : [intptr] 型: PHKEY 関数が成功して戻るときに、現在のプロファイルのレジストリ格納場所を受け取る HKEY へのポインタ。
%inst
アプリコンテナに関連付けられたレジストリ格納場所を取得する。

[戻り値]
型: HRESULT この関数は次を含む HRESULT コードを返す。
（以下省略）

[備考]

この関数は現在のユーザーのレジストリ格納場所を取得する。別のユーザーのレジストリ格納場所を取得するには、そのユーザーとして偽装する必要がある。


%index
GetAppliedGPOListW
GetAppliedGPOList 関数は、指定したユーザーまたはコンピューターに適用された GPO の一覧を取得する。(Unicode)
%group
Win32 userenv
%prm
dwFlags, pMachineName, pSidUser, pGuidExtension, ppGPOList
dwFlags : [int] ポリシーの種類を指定する値。このパラメータには次の値を指定できる。
pMachineName : [wstr] リモートコンピューターの名前へのポインタ。名前の形式は "\\computer_name"。このパラメータが NULL の場合、ローカルコンピューター名が使われる。
pSidUser : [int] ユーザーの SID を指定する値。pMachineName が NULL でなく、かつ dwFlags がユーザーポリシーを指定する場合、pSidUser は NULL にできない。pMachineName が NULL かつ pSidUser が NULL の場合、ユーザーは現在ログオン中のユーザーとなる。pMachineName が NULL かつ pSidUser が NULL でない場合、ユーザーはローカルコンピューター上で pSidUser により表される。詳細は Security Identifiers を参照。
pGuidExtension : [var] 拡張機能の GUID を指定する値。
ppGPOList : [var] GPO 構造体のリストを受け取るポインタ。詳細は GROUP_POLICY_OBJECT を参照。
%inst
GetAppliedGPOList 関数は、指定したユーザーまたはコンピューターに適用された GPO の一覧を取得する。(Unicode)

[戻り値]
関数が成功した場合は ERROR_SUCCESS を返す。そうでない場合はシステムエラーコードを返す。完全なエラーコード一覧は
System Error Codes またはヘッダーファイル WinError.h を参照。

[備考]
GPO リストの処理を終えたら FreeGPOList 関数を呼び出して解放すること。
> [!NOTE] > userenv.h ヘッダーは GetAppliedGPOList をエイリアスとして定義しており、UNICODE
プリプロセッサ定数の定義に応じて ANSI 版または Unicode
版を自動的に選択する。エンコーディング非依存のエイリアスと、エンコーディング非依存でないコードを混在して使うと、コンパイルエラーや実行時エラーの原因になる可能性がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
GetDefaultUserProfileDirectoryW
デフォルトユーザーのプロファイルのルートへのパスを取得する。(Unicode)
%group
Win32 userenv
%prm
lpProfileDir, lpcchSize
lpProfileDir : [wstr] 型: LPTSTR 関数が成功して戻るときにデフォルトユーザーのプロファイルディレクトリへのパスを受け取るバッファへのポインタ。必要なバッファサイズを調べるには NULL を設定する。
lpcchSize : [var] 型: LPDWORD lpProfileDir バッファのサイズ (TCHAR 単位) を指定する。
%inst
デフォルトユーザーのプロファイルのルートへのパスを取得する。(Unicode)

[戻り値]
型: BOOL 成功した場合は TRUE、それ以外は FALSE を返す。拡張エラー情報を取得するには GetLastError
を呼び出す。

[備考]
以下は Windows XP で GetDefaultUserProfileDirectory が返すパスの例である。
（以下省略）


%index
GetGPOListW
GetGPOList 関数は、指定したユーザーまたはコンピューターに対する GPO の一覧を取得する。(Unicode)
%group
Win32 userenv
%prm
hToken, lpName, lpHostName, lpComputerName, dwFlags, pGPOList
hToken : [intptr] LogonUser、CreateRestrictedToken、DuplicateToken、OpenProcessToken、OpenThreadToken 関数から返される、ユーザーまたはコンピューターのトークン。このトークンには TOKEN_IMPERSONATE と TOKEN_QUERY のアクセス権が必要である。詳細は Access Rights for Access-Token Objects および以下の解説セクションを参照。このパラメータが NULL の場合、lpName と lpHostName パラメータに値を指定する必要がある。
lpName : [wstr] 完全修飾識別名形式のユーザーまたはコンピューター名へのポインタ (例: "CN=user, OU=users, DC=contoso, DC=com")。hToken パラメータが NULL でない場合、このパラメータは NULL でなければならない。
lpHostName : [wstr] DNS ドメイン名 (推奨) またはドメインコントローラー名。ドメインコントローラー名は DsGetDcName 関数の flags パラメータに DS_DIRECTORY_SERVICE_REQUIRED を指定して取得できる。hToken パラメータが NULL でない場合、このパラメータは NULL でなければならない。
lpComputerName : [wstr] サイト位置を決定するために使うコンピューター名へのポインタ。名前の形式は "\\computer_name"。このパラメータが NULL の場合、ローカルコンピューター名が使われる。
dwFlags : [int] 情報取得の制御に使う追加フラグを指定する値。GPO_LIST_FLAG_MACHINE を指定すると、関数はコンピューターのポリシー情報を取得する。GPO_LIST_FLAG_MACHINE を指定しない場合、関数はユーザーのポリシー情報を取得する。GPO_LIST_FLAG_SITEONLY を指定すると、関数はコンピューターまたはユーザーのサイト情報のみを返す。
pGPOList : [var] GPO 構造体のリストを受け取るポインタ。詳細は GROUP_POLICY_OBJECT を参照。
%inst
GetGPOList 関数は、指定したユーザーまたはコンピューターに対する GPO の一覧を取得する。(Unicode)

[戻り値]
関数が成功した場合は 0 以外の値を返し、失敗した場合は 0 を返す。拡張エラー情報を取得するには GetLastError を呼び出す。

[備考]
GetGPOList
関数は、ユーザーまたはコンピューターの代理として動作するサービスで使うことを意図している。サービスはこの関数を呼び出して GPO
の一覧を取得し、各 GPO
をサービス固有のポリシーについて確認する。トークンを指定してこの関数を呼び出すと最も正確な一覧が得られる。システムはユーザーまたはコンピューターのためのアクセスチェックを実行できる。ユーザーまたはコンピューター名とドメインコントローラー名を指定して呼び出す方がトークンを指定するより高速である。ただし、トークンを指定しない場合、システムは呼び出し側のセキュリティアクセスを使うため、対象のユーザーまたはコンピューターに対して一覧が完全に正確でない可能性がある。GetGPOList
を呼び出してコンピューター向けの最も正確な GPO 一覧を取得するには、呼び出し側はコンピュータードメイン内の各 OU
とサイトに対する読み取りアクセス権、およびそのドメインのサイト、ドメイン、または OU にリンクされているすべての GPO
に対する読み取りおよびグループポリシー適用アクセス権を持っている必要がある。呼び出し側の例としては、lpName
パラメータで指定されたコンピューター上で実行中のサービスが挙げられる。GPO 一覧を取得するもう 1
つの方法は、RsopPlanningModeProvider WMI クラスの RsopCreateSession
メソッドを呼び出すことである。このメソッドは仮想的なシナリオでコンピューターまたはユーザーアカウントの結果ポリシーデータを生成できる。GPO
リストの処理を終えたら FreeGPOList 関数を呼び出して解放すること。一般的に、次のコード例のようにユーザー向けの GPO
一覧を取得するときはトークンを指定して GetGPOList を呼び出すべきである。
（以下省略）


%index
GetProfileType
現在のユーザーに対して読み込まれているプロファイルの種類を取得する。
%group
Win32 userenv
%prm
dwFlags
dwFlags : [var] 型: DWORD*
%inst
現在のユーザーに対して読み込まれているプロファイルの種類を取得する。

[戻り値]
型: BOOL 成功した場合は TRUE、それ以外は FALSE を返す。拡張エラー情報を取得するには GetLastError
を呼び出す。

[備考]
ユーザープロファイルが読み込まれていない場合、関数は失敗する。呼び出し側は HKEY_LOCAL_MACHINE に対する
KEY_READ アクセス権を持っている必要がある点に注意。このアクセス権は既定で付与される。詳細は Registry Key
Security and Access Rights を参照。プロファイルの種類が PT_ROAMING_PREEXISTING
の場合、Explorer はマシン上で初めてプロファイルが読み込まれるときに既定のプログラムの関連付けを再初期化しない。


%index
GetProfilesDirectoryW
ユーザープロファイルが格納されるルートディレクトリへのパスを取得する。(Unicode)
%group
Win32 userenv
%prm
lpProfileDir, lpcchSize
lpProfileDir : [wstr] 型: LPTSTR 関数が成功して戻るときにプロファイルディレクトリへのパスを受け取るバッファへのポインタ。必要なバッファサイズを調べるには NULL を設定する。
lpcchSize : [var] 型: LPDWORD lpProfilesDir バッファのサイズ (TCHAR 単位) を指定する。
%inst
ユーザープロファイルが格納されるルートディレクトリへのパスを取得する。(Unicode)

[戻り値]
型: BOOL 成功した場合は TRUE、それ以外は FALSE を返す。拡張エラー情報を取得するには GetLastError
を呼び出す。

[備考]
以下は Windows XP で GetProfilesDirectory が返すパスの例である。
（以下省略）


%index
GetUserProfileDirectoryW
指定ユーザーのプロファイルルートディレクトリへのパスを取得する。(Unicode)
%group
Win32 userenv
%prm
hToken, lpProfileDir, lpcchSize
hToken : [intptr] 型: HANDLE ユーザーのトークン。LogonUser などで取得。TOKEN_QUERY アクセスが必要。
lpProfileDir : [wstr] 型: LPTSTR 成功時、ユーザープロファイルディレクトリへのパスを受け取るバッファへのポインタ。
lpcchSize : [var] 型: LPDWORD lpProfileDir バッファのサイズ(TCHAR 単位)。バッファが小さすぎる場合または lpProfileDir が NULL の場合、失敗し必要サイズ(終端 NULL 含む)を受け取る。
%inst
指定ユーザーのプロファイルルートディレクトリへのパスを取得する。(Unicode)

[戻り値]
型: BOOL 成功時は TRUE、失敗時は FALSE。拡張エラー情報は GetLastError で取得する。

[備考]
Windows XP では、GetUserProfileDirectory が返すパスの例は以下の通り。
（以下省略）


%index
LeaveCriticalPolicySection
LeaveCriticalPolicySection 関数は、バックグラウンドでのポリシー適用を再開する。この関数はポリシーセクションへのハンドルを閉じる。
%group
Win32 userenv
%prm
hSection
hSection : [intptr] EnterCriticalPolicySection 関数から返されるポリシーセクションへのハンドル。
%inst
LeaveCriticalPolicySection
関数は、バックグラウンドでのポリシー適用を再開する。この関数はポリシーセクションへのハンドルを閉じる。

[戻り値]
関数が成功した場合は 0 以外の値を返し、失敗した場合は 0 を返す。拡張エラー情報を取得するには GetLastError を呼び出す。


%index
LoadUserProfileW
指定したユーザーのプロファイルを読み込む。プロファイルはローカルユーザープロファイルまたは移動ユーザープロファイルのいずれかである。(Unicode)
%group
Win32 userenv
%prm
hToken, lpProfileInfo
hToken : [intptr] 型: HANDLE LogonUser、CreateRestrictedToken、DuplicateToken、OpenProcessToken、OpenThreadToken 関数から返されるユーザーのトークン。このトークンには TOKEN_QUERY、TOKEN_IMPERSONATE、TOKEN_DUPLICATE のアクセス権が必要である。詳細は Access Rights for Access-Token Objects を参照。
lpProfileInfo : [var] 型: LPPROFILEINFO PROFILEINFO 構造体へのポインタ。構造体の dwSize メンバーが sizeof(PROFILEINFO) に設定されていない場合、または lpUserName メンバーが NULL の場合、LoadUserProfile は失敗して ERROR_INVALID_PARAMETER を返す。詳細は解説を参照。
%inst

指定したユーザーのプロファイルを読み込む。プロファイルはローカルユーザープロファイルまたは移動ユーザープロファイルのいずれかである。(Unicode)

[戻り値]
型: BOOL 成功した場合は TRUE、それ以外は FALSE を返す。拡張エラー情報を取得するには GetLastError
を呼び出す。
lpProfileInfo の構造体の dwSize メンバーが sizeof(PROFILEINFO) に設定されていない場合、または
lpUserName メンバーが NULL の場合、関数は失敗して ERROR_INVALID_PARAMETER を返す。

[備考]

ユーザーが対話的にログオンすると、システムは自動的にユーザープロファイルを読み込む。サービスやアプリケーションがユーザーを偽装している場合、システムはユーザープロファイルを読み込まない。そのためサービスやアプリケーションは
LoadUserProfile を使ってユーザープロファイルを読み込む必要がある。LoadUserProfile
を呼び出すサービスやアプリケーションは、ユーザーが移動プロファイルを持っているかどうかを確認するべきである。ユーザーが移動プロファイルを持っている場合は、そのパスを
PROFILEINFO の lpProfilePath メンバーに指定する。ユーザーの移動プロファイルパスは NetUserGetInfo
関数で情報レベル 3 または 4 を指定して取得できる。成功して戻ると、PROFILEINFO の hProfile
メンバーはユーザーのハイブのルートに対して開かれたレジストリキーハンドルとなり、フルアクセス (KEY_ALL_ACCESS)
で開かれている。ユーザーを偽装しているサービスがユーザーのレジストリファイルを読み書きする必要がある場合、HKEY_CURRENT_USER
の代わりにこのハンドルを使うべきである。hProfile ハンドルは閉じず、UnloadUserProfile
関数に渡すこと。同関数がハンドルを閉じる。ユーザーのレジストリハイブ内のすべてのキーハンドルが閉じられていることを確認する必要がある。すべての開いているレジストリハンドルを閉じないと、ユーザープロファイルのアンロードに失敗する。詳細は
Registry Key Security and Access Rights および Registry Hives
を参照。CreateProcessAsUser を呼び出す前に、LoadUserProfile 関数でユーザーのレジストリハイブを
HKEY_USERS レジストリキーに読み込むのは呼び出し側の責任である点に注意。CreateProcessAsUser
は指定したユーザーのプロファイルを HKEY_USERS に読み込まないためである。これは、HKEY_CURRENT_USER
レジストリキー内の情報へのアクセスが通常の対話的ログオンと一致する結果を生成しない可能性があることを意味する。呼び出しプロセスは
SE_RESTORE_NAME および SE_BACKUP_NAME 特権を持っている必要がある。詳細は Running with
Special Privileges を参照。Windows XP Service Pack 2 (SP2) および Windows
Server 2003 以降では、呼び出し側は管理者または LocalSystem アカウントでなければならない。単に管理者または
LocalSystem アカウントを偽装するだけでは不十分である。
> [!NOTE] > userenv.h ヘッダーは LoadUserProfile をエイリアスとして定義しており、UNICODE
プリプロセッサ定数の定義に応じて ANSI 版または Unicode
版を自動的に選択する。エンコーディング非依存のエイリアスと、エンコーディング非依存でないコードを混在して使うと、コンパイルエラーや実行時エラーの原因になる可能性がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
ProcessGroupPolicyCompleted
ProcessGroupPolicyCompleted 関数は、指定した拡張機能がポリシーの適用を完了したことをシステムに通知する。
%group
Win32 userenv
%prm
extensionId, pAsyncHandle, dwStatus
extensionId : [var] 拡張機能を識別する一意の GUID を指定する。
pAsyncHandle : [int] 非同期完了ハンドル。このハンドルは ProcessGroupPolicy 関数に渡される。
dwStatus : [int] 非同期処理の完了状態を指定する。
%inst
ProcessGroupPolicyCompleted 関数は、指定した拡張機能がポリシーの適用を完了したことをシステムに通知する。

[戻り値]
関数が成功した場合は ERROR_SUCCESS を返す。そうでない場合はシステムエラーコードのいずれかを返す。完全なエラーコード一覧は
System Error Codes またはヘッダーファイル WinError.h を参照。


%index
ProcessGroupPolicyCompletedEx
ProcessGroupPolicyCompletedEx 関数は、指定したポリシー拡張機能がポリシーの適用を完了したことをシステムに通知する。この関数は RSoP ログの状態も報告する。
%group
Win32 userenv
%prm
extensionId, pAsyncHandle, dwStatus, RsopStatus
extensionId : [var] ポリシー拡張機能を識別する一意の GUID を指定する。
pAsyncHandle : [int] 非同期完了ハンドル。このハンドルは ProcessGroupPolicyEx コールバック関数に渡される。
dwStatus : [int] ポリシーの非同期処理の完了状態を指定する。
RsopStatus : [intptr] RSoP ログの状態を示す HRESULT 戻り値を指定する。
%inst
ProcessGroupPolicyCompletedEx
関数は、指定したポリシー拡張機能がポリシーの適用を完了したことをシステムに通知する。この関数は RSoP ログの状態も報告する。

[戻り値]
関数が成功した場合は ERROR_SUCCESS を返す。そうでない場合はシステムエラーコードのいずれかを返す。完全なエラーコード一覧は
System Error Codes またはヘッダーファイル WinError.h を参照。


%index
RefreshPolicy
RefreshPolicy 関数は、クライアントコンピューター上でポリシーを即座に適用する。
%group
Win32 userenv
%prm
bMachine
bMachine : [int] コンピューターポリシーとユーザーポリシーのどちらを更新するかを指定する。TRUE の場合、システムはコンピューターポリシーを更新する。FALSE の場合、システムはユーザーポリシーを更新する。
%inst
RefreshPolicy 関数は、クライアントコンピューター上でポリシーを即座に適用する。

[戻り値]
関数が成功した場合は 0 以外の値を返し、失敗した場合は 0 を返す。拡張エラー情報を取得するには GetLastError を呼び出す。

[備考]
既定では、ポリシーは 90 分ごとに再適用される。


%index
RefreshPolicyEx
RefreshPolicyEx 関数はコンピューター上でポリシーを即座に適用する。この拡張関数は適用するポリシー更新の種類を指定できる。
%group
Win32 userenv
%prm
bMachine, dwOptions
bMachine : [int] コンピューターポリシーとユーザーポリシーのどちらを更新するかを指定する。TRUE の場合、システムはコンピューターポリシーを更新する。FALSE の場合、システムはユーザーポリシーを更新する。
dwOptions : [int] 適用するポリシー更新の種類を指定する。このパラメータには次の値を指定できる。
%inst
RefreshPolicyEx 関数はコンピューター上でポリシーを即座に適用する。この拡張関数は適用するポリシー更新の種類を指定できる。

[戻り値]
関数が成功した場合は 0 以外の値を返し、失敗した場合は 0 を返す。拡張エラー情報を取得するには GetLastError を呼び出す。

[備考]
dwOptions パラメータを指定する必要がない場合は、代わりに RefreshPolicy 関数を呼び出せる。既定では、ポリシーは
90 分ごとに再適用される。


%index
RegisterGPNotification
RegisterGPNotification 関数は、ポリシーに変更があったときにアプリケーションが通知を受け取れるようにする。ポリシー変更が発生すると、指定したイベントオブジェクトがシグナル状態に設定される。
%group
Win32 userenv
%prm
hEvent, bMachine
hEvent : [intptr] イベントオブジェクトへのハンドル。イベントオブジェクトの作成には CreateEvent 関数を使う。
bMachine : [int] ポリシー変更の種類を指定する。TRUE の場合はコンピューターポリシーの変更が通知される。FALSE の場合はユーザーポリシーの変更が通知される。
%inst
RegisterGPNotification
関数は、ポリシーに変更があったときにアプリケーションが通知を受け取れるようにする。ポリシー変更が発生すると、指定したイベントオブジェクトがシグナル状態に設定される。

[戻り値]
関数が成功した場合は 0 以外の値を返し、失敗した場合は 0 を返す。拡張エラー情報を取得するには GetLastError を呼び出す。

[備考]
ポリシー変更通知の受信を解除するには UnregisterGPNotification 関数を呼び出す。不要になったハンドルを閉じるには
CloseHandle 関数を呼び出す。アプリケーションは WM_SETTINGCHANGE
メッセージがブロードキャストされたときにもポリシー変更について通知を受け取れる。この場合、wParam
パラメータ値はコンピューターポリシーが適用されたなら 1 で、ユーザーポリシーが適用されたなら 0 になる。lParam
パラメータは文字列 "Policy" を指す。


%index
RsopAccessCheckByType
RSoPAccessCheckByType 関数は、RSOPTOKEN で識別されるクライアントに対してセキュリティ記述子が指定したアクセス権セットを付与するかどうかを判定する。
%group
Win32 userenv
%prm
pSecurityDescriptor, pPrincipalSelfSid, pRsopToken, dwDesiredAccessMask, pObjectTypeList, ObjectTypeListLength, pGenericMapping, pPrivilegeSet, pdwPrivilegeSetLength, pdwGrantedAccessMask, pbAccessStatus
pSecurityDescriptor : [int] オブジェクトに対するアクセスをチェックする SECURITY_DESCRIPTOR へのポインタ。
pPrincipalSelfSid : [int] SID へのポインタ。セキュリティ記述子がプリンシパル (例: ユーザーオブジェクト) を表すオブジェクトに関連付けられている場合、このパラメータはそのオブジェクトの SID であるべきである。アクセスを評価するとき、この SID は、既知の PRINCIPAL_SELF SID ("S-1-5-10") を含む任意の ACE 内の SID を論理的に置き換える。詳細は Security Identifiers および Well-Known SIDs を参照。保護対象オブジェクトがプリンシパルを表さない場合、このパラメータは NULL にするべきである。
pRsopToken : [intptr] オブジェクトにアクセスしようとするクライアントを表す有効な RSOPTOKEN へのポインタ。
dwDesiredAccessMask : [int] チェックするアクセス権を示すアクセスマスクを指定する。このマスクには汎用、標準、特定アクセス権の組み合わせを含めることができる。詳細は Access Rights and Access Masks を参照。
pObjectTypeList : [var] アクセスをチェックするオブジェクトタイプの階層を識別する OBJECT_TYPE_LIST 構造体配列へのポインタ。配列の各要素はオブジェクトタイプを識別する GUID と、オブジェクトタイプ階層におけるレベルを示す値を持つ。配列内に同じ GUID を持つ要素を 2 つ以上含めてはならない。配列は少なくとも 1 つの要素を持つ必要がある。配列の最初の要素はレベル 0 でオブジェクト自身を識別する。配列内のレベル 0 の要素は 1 つだけである。2 番目の要素はレベル 1 のプロパティセットのようなサブオブジェクトである。各レベル 1 エントリの後には、レベル 2 から 4 のサブオブジェクトの下位エントリが続く。したがって、配列内の要素のレベルは {0, 1, 2, 2, 1, 2, 3} のようになる可能性がある。オブジェクトタイプリストの順序が正しくない場合、RSoPAccessCheckByType は失敗し、GetLastError は ERROR_INVALID_PARAMETER を返す。
ObjectTypeListLength : [int] pObjectTypeList 配列内の要素数を指定する。
pGenericMapping : [var] アクセスをチェックするオブジェクトに関連付けられた GENERIC_MAPPING 構造体へのポインタ。
pPrivilegeSet : [var] このパラメータは現在使われていない。
pdwPrivilegeSetLength : [var] このパラメータは現在使われていない。
pdwGrantedAccessMask : [var] 付与されたアクセス権を受け取るアクセスマスクへのポインタ。関数が成功して pbAccessStatus が TRUE に設定された場合、マスクは付与された標準および特定のアクセス権を含むように更新される。pbAccessStatus が FALSE に設定された場合、このパラメータは 0 に設定される。関数が失敗した場合、マスクは変更されない。
pbAccessStatus : [var] アクセスチェックの結果を受け取る変数へのポインタ。関数が成功し要求されたアクセス権セットが付与された場合、このパラメータは TRUE に設定される。それ以外の場合は FALSE に設定される。関数が失敗した場合、状態は変更されない。
%inst
RSoPAccessCheckByType 関数は、RSOPTOKEN
で識別されるクライアントに対してセキュリティ記述子が指定したアクセス権セットを付与するかどうかを判定する。

[戻り値]
関数が成功した場合は S_OK を返す。そうでない場合は Platform SDK ヘッダーファイル WinError.h
に定義されている COM エラーコードのいずれかを返す。

[備考]
RSoPAccessCheckByType 関数は、指定したセキュリティ記述子を指定した RSOPTOKEN
と比較し、アクセスが付与されるか拒否されるかを pbAccessStatus パラメータで示す。


%index
RsopFileAccessCheck
RSoPFileAccessCheck 関数は、ファイルのセキュリティ記述子が RSOPTOKEN で識別されるクライアントに対して指定したファイルアクセス権セットを付与するかどうかを判定する。
%group
Win32 userenv
%prm
pszFileName, pRsopToken, dwDesiredAccessMask, pdwGrantedAccessMask, pbAccessStatus
pszFileName : [wstr] 対象ファイルの名前へのポインタ。ファイルは既に存在している必要がある。
pRsopToken : [intptr] ファイルにアクセスしようとするクライアントを表す有効な RSOPTOKEN へのポインタ。
dwDesiredAccessMask : [int] チェックするアクセス権を示すアクセスマスクを指定する。このマスクには汎用、標準、特定アクセス権の組み合わせを含めることができる。詳細は Access Rights and Access Masks を参照。
pdwGrantedAccessMask : [var] 付与されたアクセス権を受け取るアクセスマスクへのポインタ。関数が成功して pbAccessStatus が TRUE に設定された場合、マスクは付与された標準および特定のアクセス権を含むように更新される。pbAccessStatus が FALSE に設定された場合、このパラメータは 0 に設定される。関数が失敗した場合、マスクは変更されない。
pbAccessStatus : [var] アクセスチェックの結果を受け取る変数へのポインタ。関数が成功し要求されたアクセス権セットが付与された場合、このパラメータは TRUE に設定される。それ以外の場合は FALSE に設定される。関数が失敗した場合、状態は変更されない。
%inst
RSoPFileAccessCheck 関数は、ファイルのセキュリティ記述子が RSOPTOKEN
で識別されるクライアントに対して指定したファイルアクセス権セットを付与するかどうかを判定する。

[戻り値]
関数が成功した場合は S_OK を返す。そうでない場合は Platform SDK ヘッダーファイル WinError.h
に定義されている COM エラーコードのいずれかを返す。

[備考]
RSoPFileAccessCheck 関数は、RSOPTOKEN で識別されるクライアントに対してアクセスが付与されるか拒否されるかを
pbAccessStatus
パラメータで示す。アクセスが付与された場合、要求されたアクセスマスクはオブジェクトの付与アクセスマスクとなる。


%index
RsopResetPolicySettingStatus
RSoPResetPolicySettingStatus 関数は、RSOP_PolicySettingStatus インスタンスを RSOP_PolicySetting インスタンスからリンク解除する。
%group
Win32 userenv
%prm
dwFlags, pServices, pSettingInstance
dwFlags : [int] このパラメータは現在使われていない。
pServices : [var] ポリシーデータを書き込む RSoP ネームスペースへの WMI サービスポインタを指定する。このパラメータは必須である。
pSettingInstance : [var] ポリシー設定を含む RSOP_PolicySetting のインスタンスへのポインタ。このパラメータは必須で、インスタンスの子を指すこともできる。
%inst
RSoPResetPolicySettingStatus 関数は、RSOP_PolicySettingStatus インスタンスを
RSOP_PolicySetting インスタンスからリンク解除する。

[戻り値]
関数が成功した場合は S_OK を返す。そうでない場合は Platform SDK ヘッダーファイル WinError.h
に定義されている COM エラーコードのいずれかを返す。

[備考]
RSOP_PolicySettingStatus インスタンスを RSOP_PolicySetting インスタンスにリンク (関連付け)
するには、RSoPSetPolicySettingStatus 関数を呼び出せる。


%index
RsopSetPolicySettingStatus
RSoPSetPolicySettingStatus 関数は、RSOP_PolicySettingStatus のインスタンスと RSOP_PolicySettingLink のインスタンスを作成する。この関数は RSOP_PolicySettingStatus をその RSOP_PolicySetting インスタンスにリンク (関連付け) する。
%group
Win32 userenv
%prm
dwFlags, pServices, pSettingInstance, nInfo, pStatus
dwFlags : [int] このパラメータは現在使われていない。
pServices : [var] ポリシーデータを書き込む RSoP ネームスペースへの WMI サービスポインタを指定する。このパラメータは必須である。
pSettingInstance : [var] ポリシー設定を含む RSOP_PolicySetting のインスタンスへのポインタ。このパラメータは必須で、インスタンスの子を指すこともできる。
nInfo : [int] pStatus 配列内の要素数を指定する。
pStatus : [var] POLICYSETTINGSTATUSINFO 構造体の配列へのポインタ。
%inst
RSoPSetPolicySettingStatus 関数は、RSOP_PolicySettingStatus のインスタンスと
RSOP_PolicySettingLink のインスタンスを作成する。この関数は RSOP_PolicySettingStatus
をその RSOP_PolicySetting インスタンスにリンク (関連付け) する。

[戻り値]
関数が成功した場合は S_OK を返す。そうでない場合は Platform SDK ヘッダーファイル WinError.h
に定義されている COM エラーコードのいずれかを返す。

[備考]
RSOP_PolicySettingStatus インスタンスを RSOP_PolicySetting
インスタンスからリンク解除するには、RSoPResetPolicySettingStatus 関数を呼び出せる。


%index
UnloadUserProfile
LoadUserProfile 関数で読み込まれたユーザーのプロファイルをアンロードする。呼び出し側はコンピューター上で管理者権限を持っている必要がある。詳細は LoadUserProfile 関数の解説セクションを参照。
%group
Win32 userenv
%prm
hToken, hProfile
hToken : [intptr] 型: HANDLE LogonUser、CreateRestrictedToken、DuplicateToken、OpenProcessToken、OpenThreadToken 関数から返されるユーザーのトークン。このトークンには TOKEN_IMPERSONATE と TOKEN_DUPLICATE のアクセス権が必要である。詳細は Access Rights for Access-Token Objects を参照。
hProfile : [intptr] 型: HANDLE レジストリキーへのハンドル。この値は PROFILEINFO 構造体の hProfile メンバーである。詳細は LoadUserProfile の解説セクションおよび Registry Key Security and Access Rights を参照。
%inst
LoadUserProfile
関数で読み込まれたユーザーのプロファイルをアンロードする。呼び出し側はコンピューター上で管理者権限を持っている必要がある。詳細は
LoadUserProfile 関数の解説セクションを参照。

[戻り値]
型: BOOL 成功した場合は TRUE、それ以外は FALSE を返す。拡張エラー情報を取得するには GetLastError
を呼び出す。

[備考]
UnloadUserProfile
を呼び出す前に、ユーザーのレジストリハイブ内で開いたすべてのキーハンドルが閉じられていることを確認する必要がある。すべての開いているレジストリハンドルを閉じないと、ユーザープロファイルのアンロードに失敗する。詳細は
Registry Key Security and Access Rights および Registry Hives
を参照。管理者権限を必要とする関数呼び出しの詳細については、Running with Special Privileges を参照。


%index
UnregisterGPNotification
UnregisterGPNotification 関数は、指定したポリシー通知ハンドルをポリシー変更通知の受信対象から登録解除する。
%group
Win32 userenv
%prm
hEvent
hEvent : [intptr] RegisterGPNotification 関数に渡したポリシー通知ハンドル。
%inst
UnregisterGPNotification 関数は、指定したポリシー通知ハンドルをポリシー変更通知の受信対象から登録解除する。

[戻り値]
関数が成功した場合は 0 以外の値を返し、失敗した場合は 0 を返す。拡張エラー情報を取得するには GetLastError を呼び出す。

[備考]
呼び出し側は、ハンドルが不要になったら CloseHandle 関数を呼び出して閉じる必要がある。

