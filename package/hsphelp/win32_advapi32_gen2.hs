; ============================================================
;   advapi32.dll ヘルプ (CsWin32 / win32metadata から自動抽出)
;   docs_ja.json に日本語訳があればそちらを使用、無ければ英語原文。
;   翻訳を追加するときは docs_ja.json を編集して再生成。
; ============================================================

%index
FreeSid
AllocateAndInitializeSid 関数を使用して以前に割り当てたセキュリティ識別子 (SID) を解放する。
%group
Win32 advapi32
%prm
pSid
pSid : [int] 解放する SID 構造体へのポインタ。
%inst
AllocateAndInitializeSid 関数を使用して以前に割り当てたセキュリティ識別子 (SID) を解放する。

[戻り値]
関数が成功した場合、NULL を返す。失敗した場合、pSid パラメータで表される SID 構造体へのポインタを返す。


%index
CreateProcessAsUserW
新しいプロセスとそのプライマリスレッドを作成する。新しいプロセスは、指定したトークンが表すユーザーのセキュリティコンテキストで動作する。(Unicode)
%group
Win32 advapi32
%prm
hToken, lpApplicationName, lpCommandLine, lpProcessAttributes, lpThreadAttributes, bInheritHandles, dwCreationFlags, lpEnvironment, lpCurrentDirectory, lpStartupInfo, lpProcessInformation
hToken : [intptr] ユーザーを表すプライマリトークンへのハンドル。ハンドルは TOKEN_QUERY、TOKEN_DUPLICATE、TOKEN_ASSIGN_PRIMARY アクセス権を持っている必要がある。詳細は「Access Rights for Access-Token Objects」を参照のこと。トークンが表すユーザーは、lpApplicationName または lpCommandLine パラメータで指定されたアプリケーションに対して読み取りおよび実行アクセス権を持っている必要がある。
lpApplicationName : [wstr] 実行するモジュールの名前。このモジュールは Windows ベースのアプリケーションでもよい。ローカルコンピュータで適切なサブシステムが利用可能であれば、MS-DOS や OS/2 などの他の種類のモジュールでもよい。
lpCommandLine : [wstr] 実行するコマンドライン。この文字列の最大長は 32K 文字である。lpApplicationName が NULL の場合、lpCommandLine のモジュール名部分は MAX_PATH 文字に制限される。本関数の Unicode 版 CreateProcessAsUserW はこの文字列の内容を変更することがある。したがって、このパラメータは読み取り専用メモリ（const 変数やリテラル文字列など）へのポインタであってはならない。このパラメータが定数文字列の場合、関数はアクセス違反を引き起こすことがある。lpCommandLine パラメータは NULL にできる。その場合、関数は lpApplicationName が指す文字列をコマンドラインとして使用する。lpApplicationName と lpCommandLine が両方とも NULL でない場合、*lpApplicationName が実行するモジュールを指定し、*lpCommandLine がコマンドラインを指定する。新しいプロセスは GetCommandLine を使用してコマンドライン全体を取得できる。C で書かれたコンソールプロセスは argc と argv 引数を使ってコマンドラインを解析できる。argv[0] はモジュール名であるため、C プログラマは通常コマンドラインの最初のトークンとしてモジュール名を繰り返す。lpApplicationName が NULL の場合、コマンドラインの最初の空白区切りトークンがモジュール名を指定する。空白を含む長いファイル名を使用する場合は、ファイル名の終わりと引数の始まりを示すために引用符で囲む（lpApplicationName パラメータの説明を参照）。ファイル名に拡張子が含まれない場合、.exe が付加される。したがって、ファイル名の拡張子が .com の場合、このパラメータには .com 拡張子を含める必要がある。拡張子のないピリオド (.) で終わるファイル名、またはパスを含むファイル名の場合、.exe は付加されない。ファイル名にディレクトリパスが含まれない場合、システムは以下の順序で実行可能ファイルを検索する:
lpProcessAttributes : [var] 新しいプロセスオブジェクトのセキュリティ記述子を指定し、子プロセスがプロセスへの返されたハンドルを継承できるかどうかを決定する SECURITY_ATTRIBUTES 構造体へのポインタ。lpProcessAttributes が NULL または lpSecurityDescriptor が NULL の場合、プロセスは既定のセキュリティ記述子を取得し、ハンドルは継承できない。既定のセキュリティ記述子は、hToken パラメータで参照されるユーザーのものである。このセキュリティ記述子は呼び出し元へのアクセスを許可しない場合があり、その場合、プロセスは実行後に再度開けないことがある。プロセスハンドルは有効で、引き続き完全なアクセス権を持つ。
lpThreadAttributes : [var] 新しいスレッドオブジェクトのセキュリティ記述子を指定し、子プロセスがスレッドへの返されたハンドルを継承できるかどうかを決定する SECURITY_ATTRIBUTES 構造体へのポインタ。lpThreadAttributes が NULL または lpSecurityDescriptor が NULL の場合、スレッドは既定のセキュリティ記述子を取得し、ハンドルは継承できない。既定のセキュリティ記述子は、hToken パラメータで参照されるユーザーのものである。このセキュリティ記述子は呼び出し元へのアクセスを許可しない場合がある。
bInheritHandles : [int] このパラメータが TRUE の場合、呼び出し元プロセス内の継承可能なハンドルはそれぞれ新しいプロセスに継承される。FALSE の場合、ハンドルは継承されない。継承されたハンドルは元のハンドルと同じ値およびアクセス権を持つことに注意。継承可能なハンドルに関する追加の議論については「注釈」を参照のこと。ターミナルサービス: セッションをまたいでハンドルを継承することはできない。また、このパラメータが TRUE の場合、呼び出し元と同じセッション内でプロセスを作成する必要がある。Protected Process Light (PPL) プロセス: PPL プロセスが非 PPL プロセスを作成する場合、非 PPL プロセスから PPL プロセスへの PROCESS_DUP_HANDLE が許可されないため、一般的なハンドル継承はブロックされる。「Process Security and Access Rights」を参照のこと。
dwCreationFlags : [int] プライオリティクラスとプロセスの作成を制御するフラグ。値の一覧は「Process Creation Flags」を参照のこと。
lpEnvironment : [intptr] 新しいプロセスの環境ブロックへのポインタ。このパラメータが NULL の場合、新しいプロセスは呼び出し元プロセスの環境を使用する。
lpCurrentDirectory : [wstr] プロセスの現在のディレクトリへのフルパス。UNC パスも指定できる。このパラメータが NULL の場合、新しいプロセスは呼び出し元プロセスと同じ現在のドライブとディレクトリを持つ。（この機能は主に、アプリケーションを起動して初期のドライブと作業ディレクトリを指定する必要があるシェルのために提供されている。）
lpStartupInfo : [var] STARTUPINFO または STARTUPINFOEX 構造体へのポインタ。ユーザーは指定したウィンドウステーションとデスクトップの両方に完全なアクセス権を持っている必要がある。プロセスをインタラクティブにしたい場合は winsta0\default を指定する。lpDesktop メンバが NULL の場合、新しいプロセスは親プロセスのデスクトップとウィンドウステーションを継承する。このメンバが空文字列 "" の場合、新しいプロセスは「Process Connection to a Window Station」に記載されているルールに従ってウィンドウステーションに接続する。拡張属性を設定するには、STARTUPINFOEX 構造体を使用し、dwCreationFlags パラメータに EXTENDED_STARTUPINFO_PRESENT を指定する。STARTUPINFO または STARTUPINFOEX 内のハンドルは不要になったときに CloseHandle で閉じる必要がある。重要: 呼び出し元は STARTUPINFO 内の標準ハンドルフィールドが有効なハンドル値を含むことを保証する責任がある。これらのフィールドは、dwFlags メンバが STARTF_USESTDHANDLES を指定している場合でも、検証なしに子プロセスにそのままコピーされる。不正な値は子プロセスの不正動作やクラッシュを引き起こす可能性がある。不正なハンドルを検出するには Application Verifier 実行時検証ツールを使用する。
lpProcessInformation : [var] 新しいプロセスに関する識別情報を受け取る PROCESS_INFORMATION 構造体へのポインタ。
%inst

新しいプロセスとそのプライマリスレッドを作成する。新しいプロセスは、指定したトークンが表すユーザーのセキュリティコンテキストで動作する。(Unicode)

[戻り値]
関数が成功した場合、戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼び出す。関数はプロセスの初期化が完了する前に復帰することに注意。必要な DLL
が見つからないか初期化に失敗した場合、プロセスは終了される。プロセスの終了ステータスを取得するには GetExitCodeProcess
を呼び出す。

[備考]
CreateProcessAsUser は、呼び出し元プロセスのプライマリトークンを TOKEN_DUPLICATE および
TOKEN_IMPERSONATE アクセス権で開けなければならない。既定では、CreateProcessAsUser
はユーザーから見えず入力を受け取れない、非インタラクティブなウィンドウステーション上の非表示デスクトップで新しいプロセスを作成する。新しいプロセスとのユーザー操作を可能にするには、STARTUPINFO
構造体の lpDesktop メンバで既定のインタラクティブなウィンドウステーションとデスクトップの名前
"winsta0\default" を指定する必要がある。さらに、CreateProcessAsUser
を呼び出す前に、既定のインタラクティブなウィンドウステーションと既定のデスクトップの両方の任意アクセス制御リスト (DACL)
を変更する必要がある。ウィンドウステーションとデスクトップの DACL は、hToken
パラメータで表されるユーザーまたはログオンセッションへのアクセスを許可する必要がある。CreateProcessAsUser
は指定したユーザーのプロファイルを HKEY_USERS レジストリキーに読み込まない。したがって、HKEY_CURRENT_USER
レジストリキー内の情報にアクセスするには、CreateProcessAsUser を呼び出す前に LoadUserProfile
関数でユーザーのプロファイル情報を HKEY_USERS に読み込む必要がある。新しいプロセスが終了した後は必ず
UnloadUserProfile を呼び出すこと。lpEnvironment パラメータが NULL
の場合、新しいプロセスは呼び出し元プロセスの環境を継承する。CreateProcessAsUser は hToken
が表すユーザー固有の環境変数を含むように環境ブロックを自動的に変更しない。たとえば、lpEnvironment が NULL
の場合、USERNAME と USERDOMAIN
変数は呼び出し元プロセスから継承される。新しいプロセスのために環境ブロックを準備し、lpEnvironment
で指定するのは呼び出し側の責任である。CreateProcessWithLogonW および
CreateProcessWithTokenW 関数は、呼び出し元がユーザーを認証してトークンを取得するために LogonUser
関数を呼び出す必要がない点を除き、CreateProcessAsUser と同様である。CreateProcessAsUser
は、呼び出し元または対象ユーザーのセキュリティコンテキストで指定したディレクトリと実行可能イメージにアクセスすることを可能にする。既定では、CreateProcessAsUser
は呼び出し元のセキュリティコンテキストでディレクトリと実行可能イメージにアクセスする。この場合、呼び出し元がディレクトリと実行可能イメージへのアクセスを持たないと関数は失敗する。対象ユーザーのセキュリティコンテキストを使用してディレクトリと実行可能イメージにアクセスするには、CreateProcessAsUser
を呼び出す前に ImpersonateLoggedOnUser 関数の呼び出しで hToken
を指定する。プロセスにはプロセス識別子が割り当てられる。識別子はプロセスが終了するまで有効である。プロセスの識別、または
OpenProcess
関数でプロセスへのハンドルを開くために指定できる。プロセスの初期スレッドにもスレッド識別子が割り当てられる。OpenThread
関数でスレッドへのハンドルを開くために指定できる。識別子はスレッドが終了するまで有効で、システム内でスレッドを一意に識別するのに使用できる。これらの識別子は
PROCESS_INFORMATION
構造体で返される。呼び出し元スレッドは、新しいプロセスが初期化を完了し入力保留なしでユーザー入力を待機する状態になるまで待つために
WaitForInputIdle 関数を使用できる。これは親プロセスと子プロセス間の同期に便利である。なぜなら
CreateProcessAsUser
は新しいプロセスが初期化を完了するのを待たずに復帰するからである。たとえば、作成元プロセスは新しいプロセスに関連付けられたウィンドウを見つけようとする前に
WaitForInputIdle を使用する。プロセスをシャットダウンする推奨方法は ExitProcess
関数を使用することである。なぜならこの関数はプロセスにアタッチされているすべての DLL
に終了の接近を通知するからである。プロセスをシャットダウンする他の手段はアタッチされた DLL に通知しない。スレッドが
ExitProcess を呼び出すと、プロセスの他のスレッドは（アタッチされた DLL
のスレッド終了コードを含む）追加コードを実行する機会なしに終了されることに注意。詳細は「Terminating a
Process」を参照のこと。既定では、bInheritHandles パラメータの値として TRUE
を渡すと、すべての継承可能なハンドルが新しいプロセスに継承される。これは、複数のスレッドから同時にプロセスを作成するが各プロセスに異なるハンドルを継承させたいアプリケーションでは問題となりうる。アプリケーションは、PROC_THREAD_ATTRIBUTE_HANDLE_LIST
パラメータ付きの UpdateProcThreadAttributeList
関数を使用して、特定のプロセスに継承させるハンドルのリストを提供できる。セキュリティに関する注意事項 lpApplicationName
パラメータは NULL にでき、その場合は実行可能名が lpCommandLine
内で最初の空白区切り文字列でなければならない。実行可能ファイルやパス名に空白が含まれると、関数が空白を解析する方法のために別の実行可能ファイルが実行されるリスクがある。次の例は危険である。なぜなら関数は
"MyApp.exe" の代わりに "Program.exe" が存在すればそれを実行しようとするからである。
（以下省略）


%index
RegCloseKey
指定したレジストリキーへのハンドルを閉じる。
%group
Win32 advapi32
%prm
hKey
hKey : [intptr] 閉じるオープンキーへのハンドル。RegCreateKeyEx、RegCreateKeyTransacted、RegOpenKeyEx、RegOpenKeyTransacted、RegConnectRegistry のいずれかで開かれたものでなければならない。
%inst
指定したレジストリキーへのハンドルを閉じる。

[戻り値]
関数が成功した場合、戻り値は ERROR_SUCCESS。失敗した場合は Winerror.h で定義された 0
以外のエラーコード。FORMAT_MESSAGE_FROM_SYSTEM フラグで FormatMessage
を呼ぶことで一般的な説明が得られる。

[備考]

指定されたキーのハンドルは閉じた後は無効となるため使用してはならない。キーハンドルは必要以上に長く開いたままにすべきでない。RegCloseKey
は戻る前に必ずしもレジストリに情報を書き込まない。キャッシュがディスクにフラッシュされるまで数秒かかることがある。明示的に書き込む必要がある場合は
RegFlushKey を使えるが、多くのシステムリソースを消費するので必要時のみ呼ぶこと。


%index
RegCopyTreeW
指定したレジストリキーとその値およびサブキーを、指定した宛先キーにコピーする。(Unicode)
%group
Win32 advapi32
%prm
hKeySrc, lpSubKey, hKeyDest
hKeySrc : [intptr] 開かれているレジストリキーへのハンドル。キーは KEY_READ アクセス権で開かれている必要がある。詳細はレジストリキーのセキュリティとアクセス権を参照のこと。
lpSubKey : [wstr] キーの名前。このキーは hKeySrc パラメータで識別されるキーのサブキーでなければならない。このパラメータは NULL でもよい。
hKeyDest : [intptr] コピー先キーへのハンドル。呼び出し側プロセスはそのキーに対する KEY_CREATE_SUB_KEY アクセス権を持っている必要がある。
%inst
指定したレジストリキーとその値およびサブキーを、指定した宛先キーにコピーする。(Unicode)

[戻り値]
関数が成功した場合、戻り値は ERROR_SUCCESS となる。関数が失敗した場合、戻り値は Winerror.h で定義された 0
以外のエラーコードとなる。FormatMessage 関数に FORMAT_MESSAGE_FROM_SYSTEM
フラグを指定して呼び出すと、エラーの一般的な説明を取得できる。

[備考]
この関数はキーのセキュリティ記述子もコピーする。この関数を使用するアプリケーションをコンパイルするには、_WIN32_WINNT を
0x0600 以降に定義する。詳細は Windows ヘッダの使用を参照のこと。
> [!NOTE] > winreg.h ヘッダは RegCopyTree をエイリアスとして定義しており、UNICODE
プリプロセッサ定数の定義に基づいて ANSI または Unicode
版を自動的に選択する。エンコーディングに中立なエイリアスをエンコーディング中立でないコードと混在させると、コンパイル時または実行時エラーとなる可能性がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照のこと。


%index
RegCreateKeyExW
指定したレジストリキーを作成する。キーが既に存在する場合は開く。キー名は大文字小文字を区別しない。(Unicode)
%group
Win32 advapi32
%prm
hKey, lpSubKey, Reserved, lpClass, dwOptions, samDesired, lpSecurityAttributes, phkResult, lpdwDisposition
hKey : [intptr] オープン中のレジストリキーへのハンドル。呼び出し元プロセスはキーへの KEY_CREATE_SUB_KEY アクセス権を持っている必要がある。RegCreateKeyEx または RegOpenKeyEx で返されたハンドル、または HKEY_CLASSES_ROOT、HKEY_CURRENT_CONFIG、HKEY_CURRENT_USER、HKEY_LOCAL_MACHINE、HKEY_USERS のいずれか。
lpSubKey : [wstr] この関数が開くか作成するサブキーの名前。hKey で識別されるキーのサブキーでなければならず、レジストリツリーで最大 32 レベルまで深くできる。空文字列へのポインタの場合、phkResult は hKey で指定されたキーへの新しいハンドルを受け取る。NULL にしてはならない。
Reserved : [int] このパラメータは予約されており 0 でなければならない。
lpClass : [wstr] このキーのユーザー定義クラスタイプ。無視される場合がある。NULL を指定できる。
dwOptions : [int] 
samDesired : [int] 作成するキーのアクセス権を指定するマスク。詳細は Registry Key Security and Access Rights を参照。
lpSecurityAttributes : [var] 返されたハンドルが子プロセスに継承可能かを決定する SECURITY_ATTRIBUTES 構造体へのポインタ。NULL の場合、ハンドルは継承されない。
phkResult : [intptr] 開かれたまたは作成されたキーへのハンドルを受け取る変数へのポインタ。定義済みキーでない場合、使用後は RegCloseKey を呼び出す。
lpdwDisposition : [var] ディスポジション値を受け取る変数へのポインタ。
%inst
指定したレジストリキーを作成する。キーが既に存在する場合は開く。キー名は大文字小文字を区別しない。(Unicode)

[戻り値]
関数が成功した場合、戻り値は ERROR_SUCCESS。失敗した場合は Winerror.h で定義された 0 以外のエラーコード。

[備考]
RegCreateKeyEx が作成するキーには値がない。アプリケーションは RegSetValueEx
でキー値を設定できる。RegCreateKeyEx は指定パス内に存在しないキーをすべて作成するため、1
回の呼び出しで複数レベルのキーを作成できる。HKEY_USERS または HKEY_LOCAL_MACHINE
の直接の子は作成できない。サービスやアプリケーションが複数ユーザーを偽装する場合、HKEY_CURRENT_USER とともに使用せず
RegOpenCurrentUser を使うこと。一部のレジストリキーへのアクセスはリダイレクトされる(Registry
Virtualization)。


%index
RegDeleteKeyExW
指定されたプラットフォーム固有のレジストリビューから、サブキーとその値を削除する。(Unicode)
%group
Win32 advapi32
%prm
hKey, lpSubKey, samDesired, Reserved
hKey : [intptr] 開かれているレジストリキーへのハンドル。このキーのアクセス権は削除操作に影響しない。アクセス権の詳細はレジストリキーのセキュリティとアクセス権を参照のこと。このハンドルは RegCreateKeyEx または RegOpenKeyEx 関数が返すか、以下の定義済みキーのいずれかを指定できる: HKEY_CLASSES_ROOT HKEY_CURRENT_CONFIG HKEY_CURRENT_USER HKEY_LOCAL_MACHINE HKEY_USERS
lpSubKey : [wstr] 削除するキーの名前。このキーは hKey パラメータの値で指定されるキーのサブキーでなければならない。関数は DELETE アクセス権でサブキーを開く。キー名は大文字小文字を区別しない。このパラメータの値を NULL にすることはできない。
samDesired : [int] レジストリのプラットフォーム固有のビューを指定するアクセスマスク。
Reserved : [int] このパラメータは予約されており、0 でなければならない。
%inst
指定されたプラットフォーム固有のレジストリビューから、サブキーとその値を削除する。(Unicode)

[戻り値]
関数が成功した場合、戻り値は ERROR_SUCCESS となる。関数が失敗した場合、戻り値は Winerror.h で定義された 0
以外のエラーコードとなる。FormatMessage 関数に FORMAT_MESSAGE_FROM_SYSTEM
フラグを指定して呼び出すと、エラーの一般的な説明を取得できる。

[備考]
削除されたキーは、それに対する最後のハンドルが閉じられるまで実際には削除されない。WOW64 では、32 ビットアプリケーションは 64
ビットアプリケーションが参照するレジストリツリーとは別のレジストリツリーを参照する。この関数を使用すると、アプリケーションはもう一方のレジストリビュー内のエントリを削除できる。削除するサブキーはサブキーを持っていてはならない。キーとそのすべてのサブキーを削除するには、サブキーを列挙して個別に削除する必要がある。キーを再帰的に削除するには
RegDeleteTree または SHDeleteKey 関数を使用する。関数が成功した場合、RegDeleteKeyEx
は指定したキーをレジストリから削除する。キー全体（すべての値を含む）が削除される。> [!NOTE] > 古いバージョンの Windows
では、この API は kernel32.dll 経由でも公開されている。
> [!NOTE] > winreg.h ヘッダは RegDeleteKeyEx をエイリアスとして定義しており、UNICODE
プリプロセッサ定数の定義に基づいて ANSI または Unicode
版を自動的に選択する。エンコーディングに中立なエイリアスをエンコーディング中立でないコードと混在させると、コンパイル時または実行時エラーとなる可能性がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照のこと。


%index
RegDeleteTreeW
指定したキーのサブキーと値を再帰的に削除する。(Unicode)
%group
Win32 advapi32
%prm
hKey, lpSubKey
hKey : [intptr] 開かれているレジストリキーへのハンドル。キーは次のアクセス権で開かれている必要がある: DELETE、KEY_ENUMERATE_SUB_KEYS、KEY_QUERY_VALUE。詳細はレジストリキーのセキュリティとアクセス権を参照のこと。このハンドルは RegCreateKeyEx、RegCreateKeyTransacted、RegOpenKeyEx、または RegOpenKeyTransacted 関数が返すか、以下の定義済みキーのいずれかを指定できる: HKEY_CLASSES_ROOT HKEY_CURRENT_CONFIG HKEY_CURRENT_USER HKEY_LOCAL_MACHINE HKEY_USERS
lpSubKey : [wstr] キーの名前。このキーは hKey パラメータで識別されるキーのサブキーでなければならない。このパラメータが NULL の場合、hKey のサブキーと値が削除される。
%inst
指定したキーのサブキーと値を再帰的に削除する。(Unicode)

[戻り値]
関数が成功した場合、戻り値は ERROR_SUCCESS となる。関数が失敗した場合、戻り値は Winerror.h で定義された 0
以外のエラーコードとなる。FormatMessage 関数に FORMAT_MESSAGE_FROM_SYSTEM
フラグを指定して呼び出すと、エラーの一般的な説明を取得できる。

[備考]
キーに値がある場合、KEY_SET_VALUE で開かれていなければ、この関数は ERROR_ACCESS_DENIED
で失敗する。この関数を使用するアプリケーションをコンパイルするには、_WIN32_WINNT を 0x0600 以降に定義する。詳細は
Windows ヘッダの使用を参照のこと。
> [!NOTE] > 古いバージョンの Windows では、この API は kernel32.dll 経由でも公開されている。>
[!NOTE] > winreg.h ヘッダは RegDeleteTree をエイリアスとして定義しており、UNICODE
プリプロセッサ定数の定義に基づいて ANSI または Unicode
版を自動的に選択する。エンコーディングに中立なエイリアスをエンコーディング中立でないコードと混在させると、コンパイル時または実行時エラーとなる可能性がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照のこと。


%index
RegDeleteValueW
指定されたレジストリキーから名前付き値を削除する。(Unicode)
%group
Win32 advapi32
%prm
hKey, lpValueName
hKey : [intptr] オープン中のレジストリキーへのハンドル。KEY_SET_VALUE アクセス権で開かれている必要がある。
lpValueName : [wstr] 削除するレジストリ値。NULL または空文字列の場合、RegSetValue で設定された値が削除される。
%inst
指定されたレジストリキーから名前付き値を削除する。(Unicode)

[戻り値]
関数が成功した場合、戻り値は ERROR_SUCCESS。失敗した場合は Winerror.h で定義された 0 以外のエラーコード。

[備考]
winreg.h ヘッダは UNICODE プリプロセッサ定数の定義に基づいて RegDeleteValue を ANSI/Unicode
版のエイリアスとして定義する。


%index
RegDisablePredefinedCacheEx
現在のプロセスにおいて、すべての定義済みレジストリハンドルのハンドルキャッシュを無効にする。
%group
Win32 advapi32
%prm

%inst
現在のプロセスにおいて、すべての定義済みレジストリハンドルのハンドルキャッシュを無効にする。

[戻り値]
関数が成功した場合、戻り値は ERROR_SUCCESS となる。関数が失敗した場合、戻り値はシステムエラーコードとなる。

[備考]

この関数はリモートコンピュータでは動作しない。インパーソネーションを変更するサービスは、定義済みハンドルを使用する前にこの関数を呼び出すべきである。たとえば、この関数を呼び出した後に
HKEY_CURRENT_USER にアクセスすると、HKEY_USERS\SID_of_current_user
に対して、または現在のユーザのハイブがロードされていない場合は HKEY_USERS\.DEFAULT
に対して開く・閉じる操作が実行される。SID の詳細はセキュリティ識別子を参照のこと。


%index
RegEnumKeyExW
指定されたオープンレジストリキーのサブキーを列挙する。1 回の呼び出しにつき 1 つのサブキーの情報を取得する。(Unicode)
%group
Win32 advapi32
%prm
hKey, dwIndex, lpName, lpcchName, lpReserved, lpClass, lpcchClass, lpftLastWriteTime
hKey : [intptr] オープン中のレジストリキーへのハンドル。KEY_ENUMERATE_SUB_KEYS アクセス権で開かれている必要がある。RegCreateKeyEx 等で取得したもの、または定義済みキーのいずれか。
dwIndex : [int] 取得するサブキーのインデックス。最初の呼び出しでは 0、その後の呼び出しではインクリメントする。サブキーは順序付けされていないので新しいサブキーは任意のインデックスを持つ。
lpName : [wstr] サブキー名(終端 NULL を含む)を受け取るバッファへのポインタ。関数はサブキー名のみをバッファにコピーし、完全なキー階層はコピーしない。失敗時は何もコピーされない。
lpcchName : [var] lpName バッファのサイズ(終端 NULL を含む文字数)を指定する変数へのポインタ。成功時、終端 NULL を含まない文字数が格納される。必要なバッファサイズは RegQueryInfoKey で取得できる。
lpReserved : [var] このパラメータは予約されており NULL でなければならない。
lpClass : [wstr] 列挙されたサブキーのユーザー定義クラスを受け取るバッファへのポインタ。NULL を指定可能。
lpcchClass : [var] lpClass バッファのサイズ(終端 NULL を含む文字数)を指定する変数へのポインタ。成功時は終端 NULL を含まない格納文字数。lpClass が NULL の場合のみ NULL を指定可能。
lpftLastWriteTime : [var] 列挙されたサブキーが最後に書き込まれた時刻を受け取る FILETIME 構造体へのポインタ。NULL を指定可能。
%inst
指定されたオープンレジストリキーのサブキーを列挙する。1 回の呼び出しにつき 1 つのサブキーの情報を取得する。(Unicode)

[戻り値]
関数が成功した場合、戻り値は ERROR_SUCCESS。失敗した場合はシステムエラーコード。サブキーがもうない場合は
ERROR_NO_MORE_ITEMS。lpName バッファが小さすぎる場合は ERROR_MORE_DATA。

[備考]
サブキーを列挙するには最初 dwIndex を 0 にして呼び、ERROR_NO_MORE_ITEMS
が返るまでインクリメントしながら呼び出す。列挙中に列挙対象キーを変更する他のレジストリ関数を呼ばないこと。一部のレジストリキーへのアクセスはリダイレクトされる点に注意。


%index
RegEnumValueW
指定されたオープンレジストリキーの値を列挙する。呼び出しごとに 1 つのインデックス付きの値名とデータブロックをキーからコピーする。(Unicode)
%group
Win32 advapi32
%prm
hKey, dwIndex, lpValueName, lpcchValueName, lpReserved, lpType, lpData, lpcbData
hKey : [intptr] オープン中のレジストリキーへのハンドル。KEY_QUERY_VALUE アクセス権で開かれている必要がある。
dwIndex : [int] 取得する値のインデックス。最初の呼び出しでは 0 で、以降インクリメントする。値は順序付けされていないので新しい値は任意のインデックスを持つ。
lpValueName : [wstr] 値の名前(NULL 終端文字列)を受け取るバッファへのポインタ。終端 NULL を含められる大きさが必要。
lpcchValueName : [var] lpValueName バッファのサイズ(文字単位)を指定する変数へのポインタ。戻り時、終端 NULL を含まない格納文字数。レジストリ値名は 32,767 バイトに制限されている。
lpReserved : [var] このパラメータは予約されており NULL でなければならない。
lpType : [var] 指定された値に格納されているデータタイプを示すコードを受け取る変数へのポインタ。タイプコードが不要なら NULL を指定可能。
lpData : [var] 値エントリのデータを受け取るバッファへのポインタ。データが不要なら NULL 可。
lpcbData : [var] lpData が指すバッファのサイズ(バイト単位)を指定する変数へのポインタ。戻り時、バッファに格納されたバイト数を受け取る。lpData が NULL の場合のみ NULL 可。REG_SZ、REG_MULTI_SZ、REG_EXPAND_SZ の場合、終端 NULL 分が含まれる。バッファが小さすぎる場合 ERROR_MORE_DATA が返り、必要サイズが格納される。
%inst
指定されたオープンレジストリキーの値を列挙する。呼び出しごとに 1
つのインデックス付きの値名とデータブロックをキーからコピーする。(Unicode)

[戻り値]
関数が成功した場合、戻り値は ERROR_SUCCESS。失敗した場合はシステムエラーコード。値がもうない場合は
ERROR_NO_MORE_ITEMS。lpData バッファが小さすぎる場合は ERROR_MORE_DATA。

[備考]
値を列挙するには最初 dwIndex を 0 にして呼び、ERROR_NO_MORE_ITEMS
が返るまでインクリメントしながら呼び出す。列挙中に照会中のキーを変更するレジストリ関数を呼ばないこと。REG_SZ、REG_MULTI_SZ、REG_EXPAND_SZ
の場合、文字列が正しく NULL 終端されていない可能性があるので、使用前に確認する。名前とデータの最大サイズは
RegQueryInfoKey で取得できる。


%index
RegFlushKey
指定した開かれているレジストリキーのすべての属性をレジストリに書き込む。
%group
Win32 advapi32
%prm
hKey
hKey : [intptr] 開かれているレジストリキーへのハンドル。キーは KEY_QUERY_VALUE アクセス権で開かれている必要がある。詳細はレジストリキーのセキュリティとアクセス権を参照のこと。
%inst
指定した開かれているレジストリキーのすべての属性をレジストリに書き込む。

[戻り値]
関数が成功した場合、戻り値は ERROR_SUCCESS となる。関数が失敗した場合、戻り値は Winerror.h で定義された 0
以外のエラーコードとなる。FormatMessage 関数に FORMAT_MESSAGE_FROM_SYSTEM
フラグを指定して呼び出すと、エラーの一般的な説明を取得できる。

[備考]
RegFlushKey
の呼び出しは非常にコストの高い操作で、ディスク帯域を消費し、フラッシュ操作が完了するまでフラッシュ対象のレジストリハイブ内のすべてのキーに対する変更を全プロセスでブロックするため、システム全体のパフォーマンスに大きな影響を与える。RegFlushKey
は、変更直後にレジストリの変更をディスクに永続化することをアプリケーションが保証しなければならない場合にのみ明示的に呼び出すべきである。キーに加えられたすべての変更は、ディスクにフラッシュされなくても他のプロセスから参照可能である。代わりに、レジストリは一定時間ごとにレジストリの変更をディスクにフラッシュする「遅延フラッシュ」機構を持っている。この通常のフラッシュ操作に加え、システムシャットダウン時にもレジストリの変更がディスクにフラッシュされる。「遅延フラッシュ」に任せることが、ディスク上のレジストリストアへの書き込みを管理する最も効率的な方法である。RegFlushKey
関数は、指定したキーを含むハイブのすべてのデータがディスク上のレジストリストアに書き込まれた時のみ復帰する。RegFlushKey
関数は、前回の遅延フラッシュまたはシステム起動以降に変更されたハイブ内の他のキーのデータも書き出す。RegFlushKey
から復帰した後は、RegCloseKey を使用してレジストリキーへのハンドルを閉じる。


%index
RegGetKeySecurity
指定した開かれているレジストリキーを保護しているセキュリティ記述子のコピーを取得する。
%group
Win32 advapi32
%prm
hKey, SecurityInformation, pSecurityDescriptor, lpcbSecurityDescriptor
hKey : [intptr] セキュリティ記述子を取得する対象の、開かれているキーへのハンドル。
SecurityInformation : [int] 要求するセキュリティ情報を示す SECURITY_INFORMATION 値。
pSecurityDescriptor : [int] 要求したセキュリティ記述子のコピーを受け取るバッファへのポインタ。
lpcbSecurityDescriptor : [var] pSecurityDescriptor パラメータが指すバッファのサイズ（バイト単位）を指定する変数へのポインタ。関数が復帰するとき、この変数はバッファに書き込まれたバイト数を格納する。
%inst
指定した開かれているレジストリキーを保護しているセキュリティ記述子のコピーを取得する。

[戻り値]
関数が成功した場合、関数は ERROR_SUCCESS を返す。
関数が失敗した場合、WinError.h で定義された 0 以外のエラーコードを返す。FormatMessage 関数に
FORMAT_MESSAGE_FROM_SYSTEM フラグを指定して呼び出すと、エラーの一般的な説明を取得できる。

[備考]
pSecurityDescriptor パラメータで指定されたバッファが小さすぎる場合、関数は
ERROR_INSUFFICIENT_BUFFER を返し、lpcbSecurityDescriptor
パラメータには要求したセキュリティ記述子に必要なバイト数が格納される。キーのセキュリティ記述子から所有者、グループ、任意アクセス制御リスト
(DACL) を読み取るには、ハンドルを開く際に呼び出し側プロセスに READ_CONTROL
アクセスが付与されている必要がある。READ_CONTROL アクセスを取得するには、呼び出し側がキーの所有者であるか、キーの DACL
がそのアクセスを許可している必要がある。セキュリティ記述子からシステムアクセス制御リスト (SACL)
を読み取るには、キーを開く際に呼び出し側プロセスに ACCESS_SYSTEM_SECURITY
アクセスが付与されている必要がある。このアクセスを取得する正しい方法は、呼び出し側の現在のトークンで SE_SECURITY_NAME
特権を有効にし、ACCESS_SYSTEM_SECURITY アクセスでハンドルを開き、その後特権を無効にすることである。


%index
RegGetValueW
指定したレジストリ値の型とデータを取得する。(Unicode)
%group
Win32 advapi32
%prm
hkey, lpSubKey, lpValue, dwFlags, pdwType, pvData, pcbData
hkey : [intptr] 開かれているレジストリキーへのハンドル。キーは KEY_QUERY_VALUE アクセス権で開かれている必要がある。詳細はレジストリキーのセキュリティとアクセス権を参照のこと。
lpSubKey : [wstr] *hkey* パラメータで指定されるキーに対する相対的なレジストリキーのパス。このサブキーからレジストリ値が取得される。パスは大文字小文字を区別しない。このパラメータが **NULL** または空文字列 "" の場合、値は *hkey* で指定されたキー自体から読み取られる。
lpValue : [wstr] レジストリ値の名前。このパラメータが **NULL** または空文字列 "" の場合、関数はキーの無名値または既定値（存在する場合）の型とデータを取得する。キーは自動的には無名値または既定値を持たず、無名値は任意の型にできる。詳細は [Registry Element Size Limits](/windows/win32/sysinfo/registry-element-size-limits) を参照のこと。
dwFlags : [int] 
pdwType : [var] 指定した値に格納されているデータの型を示すコードを受け取る変数へのポインタ。型コードの一覧についてはレジストリ値の型を参照のこと。型が不要な場合、このパラメータは NULL にできる。
pvData : [intptr] 値のデータを受け取るバッファへのポインタ。データが不要な場合、このパラメータは NULL にできる。データが文字列の場合、関数は終端 null 文字の有無を確認する。存在しない場合、バッファが余分な文字を収容するのに十分大きければ、文字列は null で終端されて格納される。そうでなければ関数は失敗して ERROR_MORE_DATA を返す。
pcbData : [var] pvData パラメータが指すバッファのサイズ（バイト単位）を指定する変数へのポインタ。関数が復帰するとき、この変数は pvData にコピーされたデータのサイズを格納する。
%inst
指定したレジストリ値の型とデータを取得する。(Unicode)

[戻り値]
関数が成功した場合、戻り値は ERROR_SUCCESS となる。関数が失敗した場合、戻り値はシステムエラーコードとなる。pvData
バッファが値を受け取るには小さすぎる場合、関数は ERROR_MORE_DATA を返す。lpValue
レジストリ値が存在しない場合、関数は ERROR_FILE_NOT_FOUND を返す。dwFlags に
RRF_SUBKEY_WOW6464KEY と RRF_SUBKEY_WOW6432KEY の両方の組み合わせが指定されている場合、関数は
ERROR_INVALID_PARAMETER を返す。

[備考]
通常、アプリケーションは RegEnumValue を呼び出して値名を決定し、次に RegGetValue
を呼び出して名前に対応するデータを取得する。データが REG_SZ、REG_MULTI_SZ、または REG_EXPAND_SZ
型で、この関数の ANSI 版が（明示的に RegGetValueA を呼び出すか、Windows.h のインクルード前に UNICODE
を定義しないことで）使用されている場合、関数は格納されている Unicode 文字列を ANSI 文字列に変換してから pvData
が指すバッファにコピーする。hkey に HKEY_PERFORMANCE_DATA
ハンドルと指定されたオブジェクトの値文字列を指定してこの関数を呼び出した場合、返されるデータ構造には要求していないオブジェクトが含まれることがあるが、これは正常な動作である。要求したオブジェクトを探すために返されたデータ構造を走査することを常に想定すること。特定のレジストリキーへのアクセスはリダイレクトされる点に注意のこと。詳細はレジストリ仮想化およびレジストリ内の
32 ビットおよび 64
ビットアプリケーションデータを参照のこと。この関数を使用するアプリケーションをコンパイルするには、_WIN32_WINNT を
0x0600 以降に定義する。詳細は Windows ヘッダの使用を参照のこと。
> [!NOTE] > winreg.h ヘッダは RegGetValue をエイリアスとして定義しており、UNICODE
プリプロセッサ定数の定義に基づいて ANSI または Unicode
版を自動的に選択する。エンコーディングに中立なエイリアスをエンコーディング中立でないコードと混在させると、コンパイル時または実行時エラーとなる可能性がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照のこと。


%index
RegLoadKeyW
HKEY_USERS または HKEY_LOCAL_MACHINE の下にサブキーを作成し、指定したレジストリハイブからのデータをそのサブキーにロードする。(Unicode)
%group
Win32 advapi32
%prm
hKey, lpSubKey, lpFile
hKey : [intptr] サブキーを作成する対象のキーへのハンドル。これは RegConnectRegistry の呼び出しで返されたハンドル、または以下の定義済みハンドルのいずれかである:
lpSubKey : [wstr] hKey の下に作成するキーの名前。このサブキーに、ファイルからのレジストリ情報がロードされる。
lpFile : [wstr] レジストリデータを含むファイルの名前。このファイルは RegSaveKey 関数で作成されたローカルファイルでなければならない。ファイルが存在しない場合、指定した名前でファイルが作成される。
%inst
HKEY_USERS または HKEY_LOCAL_MACHINE
の下にサブキーを作成し、指定したレジストリハイブからのデータをそのサブキーにロードする。(Unicode)

[戻り値]
関数が成功した場合、戻り値は ERROR_SUCCESS となる。関数が失敗した場合、戻り値は Winerror.h で定義された 0
以外のエラーコードとなる。FormatMessage 関数に FORMAT_MESSAGE_FROM_SYSTEM
フラグを指定して呼び出すと、エラーの一般的な説明を取得できる。

[備考]
レジストリハイブファイルには 2
つの形式がある。現在のオペレーティングシステムで作成されたレジストリハイブは、通常、それ以前のバージョンではロードできない。hKey が
RegConnectRegistry で返されたハンドルである場合、lpFile
で指定されたパスはリモートコンピュータに対する相対となる。呼び出し側プロセスはレジストリが存在するコンピュータ上で
SE_RESTORE_NAME および SE_BACKUP_NAME
特権を持っている必要がある。詳細は特殊な特権での実行を参照のこと。これらの特殊な特権を必要とせずにハイブをロードするには、RegLoadAppKey
関数を使用する。
> [!NOTE] > winreg.h ヘッダは RegLoadKey をエイリアスとして定義しており、UNICODE
プリプロセッサ定数の定義に基づいて ANSI または Unicode
版を自動的に選択する。エンコーディングに中立なエイリアスをエンコーディング中立でないコードと混在させると、コンパイル時または実行時エラーとなる可能性がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照のこと。


%index
RegLoadMUIStringW
指定したキーとサブキーから指定した文字列をロードする。(Unicode)
%group
Win32 advapi32
%prm
hKey, pszValue, pszOutBuf, cbOutBuf, pcbData, Flags, pszDirectory
hKey : [intptr] 開かれているレジストリキーへのハンドル。キーは KEY_QUERY_VALUE アクセス権で開かれている必要がある。詳細はレジストリキーのセキュリティとアクセス権を参照のこと。このハンドルは RegCreateKeyEx または RegOpenKeyEx 関数が返す。以下の定義済みキーのいずれかを指定することもできる: HKEY_CLASSES_ROOT HKEY_CURRENT_CONFIG HKEY_CURRENT_USER HKEY_LOCAL_MACHINE HKEY_USERS
pszValue : [wstr] レジストリ値の名前。
pszOutBuf : [wstr] 文字列を受け取るバッファへのポインタ。次の形式の文字列は特別に処理される: @[path]\dllname,-strID 識別子 strID の文字列が dllname からロードされる。path は省略可能。pszDirectory パラメータが NULL でない場合、ディレクトリはレジストリデータで指定されたパスの前に付加される。dllname には展開される環境変数を含めることができる。
cbOutBuf : [int] pszOutBuf バッファのサイズ（バイト単位）。
pcbData : [var] pszOutBuf バッファにコピーされたデータのサイズ（バイト単位）を受け取る変数へのポインタ。バッファがデータを保持するには小さすぎる場合、関数は ERROR_MORE_DATA を返し、pcbData が指す変数に必要なバッファサイズを格納する。この場合、バッファの内容は未定義となる。
Flags : [int] このパラメータは 0 または次の値にできる。
pszDirectory : [wstr] ディレクトリパス。
%inst
指定したキーとサブキーから指定した文字列をロードする。(Unicode)

[戻り値]
関数が成功した場合、戻り値は ERROR_SUCCESS となる。関数が失敗した場合、戻り値はシステムエラーコードとなる。pcbData
バッファが文字列を受け取るには小さすぎる場合、関数は ERROR_MORE_DATA を返す。この関数の ANSI 版は
ERROR_CALL_NOT_IMPLEMENTED を返す。

[備考]
RegLoadMUIString 関数は Unicode でのみサポートされている。この関数の Unicode 版 (W) と ANSI
版 (A) の両方が宣言されているが、RegLoadMUIStringA 関数は ERROR_CALL_NOT_IMPLEMENTED
を返す。アプリケーションは明示的に RegLoadMUIStringW を呼び出すか、プラットフォーム呼び出し (PInvoke)
で文字セットとして Unicode を指定すべきである。この関数を使用するアプリケーションをコンパイルするには、_WIN32_WINNT
を 0x0600 以降に定義する。詳細は Windows ヘッダの使用を参照のこと。
> [!NOTE] > winreg.h ヘッダは RegLoadMUIString をエイリアスとして定義しており、UNICODE
プリプロセッサ定数の定義に基づいて ANSI または Unicode
版を自動的に選択する。エンコーディングに中立なエイリアスをエンコーディング中立でないコードと混在させると、コンパイル時または実行時エラーとなる可能性がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照のこと。


%index
RegNotifyChangeKeyValue
指定したレジストリキーの属性または内容の変更を呼び出し側に通知する。
%group
Win32 advapi32
%prm
hKey, bWatchSubtree, dwNotifyFilter, hEvent, fAsynchronous
hKey : [intptr] 開かれているレジストリキーへのハンドル。このハンドルは RegCreateKeyEx または RegOpenKeyEx 関数が返す。以下の定義済みキーのいずれかを指定することもできる:
bWatchSubtree : [int] このパラメータが TRUE の場合、関数は指定したキーとそのサブキーの変更を報告する。FALSE の場合、指定したキーの変更のみを報告する。
dwNotifyFilter : [int] 
hEvent : [intptr] イベントへのハンドル。fAsynchronous パラメータが TRUE の場合、関数はただちに復帰し、変更はこのイベントをシグナル状態にすることで報告される。fAsynchronous が FALSE の場合、hEvent は無視される。
fAsynchronous : [int] このパラメータが TRUE の場合、関数はただちに復帰し、指定したイベントをシグナル状態にすることで変更を報告する。このパラメータが FALSE の場合、関数は変更が発生するまで復帰しない。
%inst
指定したレジストリキーの属性または内容の変更を呼び出し側に通知する。

[戻り値]
関数が成功した場合、戻り値は ERROR_SUCCESS となる。関数が失敗した場合、戻り値は Winerror.h で定義された 0
以外のエラーコードとなる。FormatMessage 関数に FORMAT_MESSAGE_FROM_SYSTEM
フラグを指定して呼び出すと、エラーの一般的な説明を取得できる。

[備考]
この関数は単一の変更を検出する。呼び出し側が通知イベントを受け取った後、次の通知を受けるにはこの関数を再度呼び出す必要がある。注意:
Windows NT、Windows 2000、Windows XP では、特定のキーハンドルに対して
RegNotifyChangeKeyValue
を呼び出すと、そのキーハンドルが有効である限り変更通知が継続して発生する。これにより、最初の呼び出しと 2
回目の呼び出しの間に変更が発生していた場合、2 回目の RegNotifyChangeKeyValue 呼び出しはただちに復帰する。API
が非同期で使用されている場合、間に変更が発生していれば渡されたイベントハンドルはただちにシグナル状態になる。この関数は、RegRestoreKey
関数の使用に起因するレジストリへの変更を検出するために使用できない。指定したキーが閉じられると、イベントはシグナル状態になる。つまり、アプリケーションはイベントに対する待機操作から復帰した後もキーが開いたままであると想定すべきではない。Windows
8 で導入された REG_NOTIFY_THREAD_AGNOSTIC フラグにより、ThreadPool スレッドでの
RegNotifyChangeKeyValue の使用が可能になる。RegNotifyChangeKeyValue
を呼び出したスレッドが終了すると、イベントはシグナル状態になる。キー値の追加の変更を引き続き監視するには、別のスレッドから
RegNotifyChangeKeyValue を再度呼び出す。REG_NOTIFY_THREAD_AGNOSTIC を設定した
RegNotifyChangeKeyValue
呼び出しを除いて、この関数は永続スレッド上で呼び出さなければならない。呼び出し側スレッドがスレッドプールからのもので永続的でない場合、スレッドが終了するたびにイベントがシグナル状態になり、レジストリ変更時のみではない。正確な結果を得るには、SetThreadpoolCallbackPersistent
関数を使用して永続スレッドでスレッドプール作業を実行するか、CreateThread 関数で独自のスレッドを作成する。（元のスレッドプール
API では、QueueUserWorkItem 関数で WT_EXECUTEINPERSISTENTTHREAD
を指定する。）この関数は、同じ hKey に対して異なる bWatchSubtree と dwNotifyFilter
パラメータの値で複数回呼び出すべきではない。関数は成功するが変更は無視される。監視パラメータを変更するには、まず RegCloseKey
を呼び出してキーハンドルを閉じ、RegOpenKeyEx を呼び出してキーハンドルを開き直し、新しいパラメータで
RegNotifyChangeKeyValue を呼び出す必要がある。プロセスが同じパラメータセットで
RegNotifyChangeKeyValue
を呼び出すたびに、別の待機操作が確立され、リソースリークが発生する。したがって、以前の待機操作が完了するまで、同じパラメータで
RegNotifyChangeKeyValue
を呼び出していないことを確認すること。レジストリ操作をより詳細に監視するには、レジストリを参照のこと。Windows XP/2000
では、特定のキーハンドルに対して RegNotifyChangeKeyValue
が呼び出されたとき、キーハンドルが有効である限り変更通知が発生する。これにより、最初の呼び出しと 2
回目の呼び出しの間に変更が発生していた場合、2 回目の RegNotifyChangeKeyValue
呼び出しはただちに復帰する。関数が非同期で使用されている場合、間に変更が発生していれば渡されたイベントハンドルはただちにシグナル状態になる。


%index
RegOpenCurrentUser
現在のスレッドがインパーソネートしているユーザの HKEY_CURRENT_USER キーへのハンドルを取得する。
%group
Win32 advapi32
%prm
samDesired, phkResult
samDesired : [int] キーに対して要求するアクセス権を指定するマスク。キーのセキュリティ記述子が呼び出し側プロセスに対して要求されたアクセスを許可しない場合、関数は失敗する。詳細はレジストリキーのセキュリティとアクセス権を参照のこと。
phkResult : [intptr] 開かれたキーへのハンドルを受け取る変数へのポインタ。返されたハンドルが不要になったら、RegCloseKey 関数を呼び出して閉じる。
%inst
現在のスレッドがインパーソネートしているユーザの HKEY_CURRENT_USER キーへのハンドルを取得する。

[戻り値]
関数が成功した場合、戻り値は ERROR_SUCCESS となる。関数が失敗した場合、戻り値は Winerror.h で定義された 0
以外のエラーコードとなる。FormatMessage 関数に FORMAT_MESSAGE_FROM_SYSTEM
フラグを指定して呼び出すと、エラーの一般的な説明を取得できる。

[備考]
HKEY_CURRENT_USER キーは、HKEY_USERS
キー内の現在のユーザのブランチのルートにマップされる。これはプロセス内のすべてのスレッドに対してキャッシュされる。したがって、別のユーザのプロファイルがロードされてもこの値は変化しない。RegOpenCurrentUser
は、スレッドのトークンを使用して適切なキーにアクセスするか、プロファイルがロードされていない場合は既定にアクセスする。


%index
RegOpenKeyExW
指定したレジストリキーを開く。キー名は大文字小文字を区別しない。(Unicode)
%group
Win32 advapi32
%prm
hKey, lpSubKey, ulOptions, samDesired, phkResult
hKey : [intptr] オープン中のレジストリキーへのハンドル。RegCreateKeyEx または RegOpenKeyEx で取得したもの、または HKEY_CLASSES_ROOT、HKEY_CURRENT_CONFIG、HKEY_CURRENT_USER、HKEY_LOCAL_MACHINE、HKEY_USERS のいずれか。
lpSubKey : [wstr] 開くレジストリサブキーの名前。キー名は大文字小文字を区別しない。NULL または空文字列で hKey が定義済みキーの場合、システムは定義済みキーをリフレッシュし phkResult は hKey と同じハンドルを受け取る。
ulOptions : [int] キーを開く際のオプション。0 または次のいずれかを指定する:
samDesired : [int] 開くキーに対する希望アクセス権を指定するマスク。キーのセキュリティ記述子が要求アクセスを許可しない場合、関数は失敗する。
phkResult : [intptr] 開かれたキーへのハンドルを受け取る変数へのポインタ。定義済みキーでない場合、使用後は RegCloseKey を呼ぶ。
%inst
指定したレジストリキーを開く。キー名は大文字小文字を区別しない。(Unicode)

[戻り値]
関数が成功した場合、戻り値は ERROR_SUCCESS。失敗した場合は Winerror.h で定義された 0 以外のエラーコード。

[備考]
RegCreateKeyEx
とは異なり、指定されたキーが存在しない場合でもキーを作成しない。一部のレジストリ操作はキーのセキュリティ記述子に対してアクセスチェックを行う点に注意。サービスやアプリケーションが複数ユーザーを偽装する場合は
HKEY_CURRENT_USER と一緒に使わず RegOpenCurrentUser を使うこと。


%index
RegOpenUserClassesRoot
指定したユーザの HKEY_CLASSES_ROOT キーへのハンドルを取得する。ユーザはアクセストークンによって識別される。
%group
Win32 advapi32
%prm
hToken, dwOptions, samDesired, phkResult
hToken : [intptr] 対象のユーザを識別するプライマリまたはインパーソネーションアクセストークンへのハンドル。これは LogonUser、CreateRestrictedToken、DuplicateToken、DuplicateTokenEx、OpenProcessToken、OpenThreadToken 関数の呼び出しで返されるトークンハンドルである。
dwOptions : [int] このパラメータは予約されており、0 でなければならない。
samDesired : [int] キーに対して要求するアクセス権を指定するマスク。キーのセキュリティ記述子が呼び出し側プロセスに対して要求されたアクセスを許可しない場合、関数は失敗する。詳細はレジストリキーのセキュリティとアクセス権を参照のこと。
phkResult : [intptr] 開かれたキーへのハンドルを受け取る変数へのポインタ。返されたハンドルが不要になったら、RegCloseKey 関数を呼び出して閉じる。
%inst
指定したユーザの HKEY_CLASSES_ROOT キーへのハンドルを取得する。ユーザはアクセストークンによって識別される。

[戻り値]
関数が成功した場合、戻り値は ERROR_SUCCESS となる。関数が失敗した場合、戻り値は Winerror.h で定義された 0
以外のエラーコードとなる。FormatMessage 関数に FORMAT_MESSAGE_FROM_SYSTEM
フラグを指定して呼び出すと、エラーの一般的な説明を取得できる。

[備考]
RegOpenUserClassesRoot 関数を使用すると、対話的ユーザ以外のユーザに対してマージされた
HKEY_CLASSES_ROOT
情報を取得できる。たとえば、クライアント/サーバアプリケーションのサーバコンポーネントは、RegOpenUserClassesRoot
を使用してクライアントのマージされた情報を取得できる。指定したユーザのユーザプロファイルがロードされていない場合、RegOpenUserClassesRoot
は失敗する。ユーザが対話的にログオンすると、システムは自動的にユーザのプロファイルをロードする。それ以外のユーザについては、LoadUserProfile
関数を呼び出してユーザのプロファイルをロードできる。ただし、LoadUserProfile
は非常に時間がかかる可能性があるため、ユーザのマージされた HKEY_CLASSES_ROOT
情報を取得することがどうしても必要な場合を除き、この目的で呼び出さないこと。対話的にログオンしたユーザのセキュリティコンテキストで実行されているアプリケーションは、RegOpenUserClassesRoot
を使用する必要はない。これらのアプリケーションは、RegOpenKeyEx 関数を呼び出して対話的ユーザの
HKEY_CLASSES_ROOT キーのマージされたビューを取得できる。


%index
RegQueryInfoKeyW
指定されたレジストリキーに関する情報を取得する。(Unicode)
%group
Win32 advapi32
%prm
hKey, lpClass, lpcchClass, lpReserved, lpcSubKeys, lpcbMaxSubKeyLen, lpcbMaxClassLen, lpcValues, lpcbMaxValueNameLen, lpcbMaxValueLen, lpcbSecurityDescriptor, lpftLastWriteTime
hKey : [intptr] オープン中のレジストリキーへのハンドル。KEY_QUERY_VALUE アクセス権で開かれている必要がある。
lpClass : [wstr] キーのユーザー定義クラスを受け取るバッファへのポインタ。NULL を指定可能。
lpcchClass : [var] lpClass バッファのサイズ(終端 NULL を含む文字数)を指定する変数へのポインタ。関数が戻ると、バッファに格納されたクラス文字列のサイズ(終端 NULL を含まない)が格納される。バッファが小さければ ERROR_MORE_DATA を返す。
lpReserved : [var] このパラメータは予約されており NULL でなければならない。
lpcSubKeys : [var] 指定されたキーが含むサブキーの数を受け取る変数へのポインタ。NULL を指定可能。
lpcbMaxSubKeyLen : [var] キーのサブキーの最も長い名前のサイズ(終端 NULL を含まない Unicode 文字数)を受け取る変数へのポインタ。NULL を指定可能。
lpcbMaxClassLen : [var] サブキークラスを指定する最も長い文字列のサイズ(終端 NULL を含まない Unicode 文字数)を受け取る変数へのポインタ。NULL を指定可能。
lpcValues : [var] キーに関連付けられた値の数を受け取る変数へのポインタ。NULL を指定可能。
lpcbMaxValueNameLen : [var] キーの最も長い値名のサイズ(終端 NULL を含まない Unicode 文字数)を受け取る変数へのポインタ。NULL を指定可能。
lpcbMaxValueLen : [var] キーの値の中で最も長いデータコンポーネントのサイズ(バイト単位)を受け取る変数へのポインタ。NULL を指定可能。
lpcbSecurityDescriptor : [var] キーのセキュリティ記述子のサイズ(バイト単位)を受け取る変数へのポインタ。NULL を指定可能。
lpftLastWriteTime : [var] 最終書き込み時刻を受け取る FILETIME 構造体へのポインタ。NULL を指定可能。
%inst
指定されたレジストリキーに関する情報を取得する。(Unicode)

[戻り値]
関数が成功した場合、戻り値は ERROR_SUCCESS。失敗した場合はシステムエラーコード。lpClass
バッファがクラス名を受け取るには小さすぎる場合は ERROR_MORE_DATA。

[備考]
winreg.h ヘッダは RegQueryInfoKey を UNICODE プリプロセッサ定数に基づく ANSI/Unicode
版のエイリアスとして定義する。


%index
RegQueryValueExW
オープンレジストリキーに関連付けられた指定された値名のタイプとデータを取得する。(Unicode)
%group
Win32 advapi32
%prm
hKey, lpValueName, lpReserved, lpType, lpData, lpcbData
hKey : [intptr] オープン中のレジストリキーへのハンドル。KEY_QUERY_VALUE アクセス権で開かれている必要がある。
lpValueName : [wstr] レジストリ値の名前。
lpReserved : [var] このパラメータは予約されており NULL でなければならない。
lpType : [var] 指定された値に格納されているデータタイプを示すコードを受け取る変数へのポインタ。タイプコードが不要なら NULL 可。
lpData : [var] 値のデータを受け取るバッファへのポインタ。データが不要なら NULL 可。
lpcbData : [var] lpData が指すバッファのサイズ(バイト単位)を指定する変数へのポインタ。関数が戻ると、コピーされたデータサイズが格納される。
%inst
オープンレジストリキーに関連付けられた指定された値名のタイプとデータを取得する。(Unicode)

[戻り値]
関数が成功した場合、戻り値は ERROR_SUCCESS。失敗した場合はシステムエラーコード。lpData バッファが小さすぎる場合は
ERROR_MORE_DATA。指定された値が存在しない場合は ERROR_FILE_NOT_FOUND。

[備考]
通常、アプリケーションは RegEnumValue で値名を決定した後、RegQueryValueEx
でデータを取得する。REG_SZ、REG_MULTI_SZ、REG_EXPAND_SZ の場合、文字列が正しく NULL
終端されていない可能性があるため、使用前に確認する(REG_MULTI_SZ は 2 つの終端 NULL が必要)。RegGetValue
は必要に応じて NULL 終端を追加する。ANSI 版を使う場合、内部格納の Unicode 文字列を ANSI
に変換してからコピーする。HKEY_PERFORMANCE_DATA
を照会すると、要求していないオブジェクトが返されることがある(通常動作)。


%index
RegRestoreKeyW
指定したファイル内のレジストリ情報を読み取り、指定したキーの上にコピーする。このレジストリ情報はキーと複数レベルのサブキーの形式をとることができる。(Unicode)
%group
Win32 advapi32
%prm
hKey, lpFile, dwFlags
hKey : [intptr] 開かれているレジストリキーへのハンドル。このハンドルは RegCreateKeyEx または RegOpenKeyEx 関数が返す。以下の定義済みキーのいずれかを指定することもできる:
lpFile : [wstr] レジストリ情報を含むファイルの名前。このファイルは通常、RegSaveKey 関数を使用して作成される。
dwFlags : [int] 
%inst

指定したファイル内のレジストリ情報を読み取り、指定したキーの上にコピーする。このレジストリ情報はキーと複数レベルのサブキーの形式をとることができる。(Unicode)

[戻り値]
関数が成功した場合、戻り値は ERROR_SUCCESS となる。関数が失敗した場合、戻り値は Winerror.h で定義された 0
以外のエラーコードとなる。FormatMessage 関数に FORMAT_MESSAGE_FROM_SYSTEM
フラグを指定して呼び出すと、エラーの一般的な説明を取得できる。

[備考]
レジストリハイブファイルには 2
つの異なる形式がある。現在のオペレーティングシステムで作成されたレジストリハイブは、通常、それ以前のバージョンではロードできない。hKey
パラメータのサブキーが開かれている場合、RegRestoreKey は失敗する。呼び出し側プロセスはレジストリが存在するコンピュータ上で
SE_RESTORE_NAME および SE_BACKUP_NAME
特権を持っている必要がある。詳細は特殊な特権での実行を参照のこと。この関数は、ファイル内の最上位キーの名前にかかわらず、指定したキー配下のキーと値を、ファイル内の最上位キーに従属するキーと値で置き換える。たとえば、hKey
がサブキー B と C を持つキー A を識別し、lpFile パラメータがサブキー Y と Z を持つキー X
を含むファイルを指定する場合、RegRestoreKey の呼び出し後、レジストリはサブキー Y と Z を持つキー A
を含むことになる。A の値エントリは X の値エントリで置き換えられる。キー名を除き、lpFile で指定したファイル内の新しい情報が
hKey パラメータで指定したキーの内容を上書きする。hKey がリモートコンピュータ上のキーを表す場合、lpFile
で指定されたパスはリモートコンピュータに対する相対となる。
> [!NOTE] > winreg.h ヘッダは RegRestoreKey をエイリアスとして定義しており、UNICODE
プリプロセッサ定数の定義に基づいて ANSI または Unicode
版を自動的に選択する。エンコーディングに中立なエイリアスをエンコーディング中立でないコードと混在させると、コンパイル時または実行時エラーとなる可能性がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照のこと。


%index
RegSaveKeyExW
指定したキーとそのすべてのサブキーおよび値を、指定した形式でレジストリファイルに保存する。(Unicode)
%group
Win32 advapi32
%prm
hKey, lpFile, lpSecurityAttributes, Flags
hKey : [intptr] 開かれているレジストリキーへのハンドル。この関数は HKEY_CLASSES_ROOT 定義済みキーをサポートしない。
lpFile : [wstr] 指定したキーとサブキーを保存するファイルの名前。ファイルがすでに存在する場合、関数は失敗する。
lpSecurityAttributes : [var] 新しいファイルのセキュリティ記述子を指定する SECURITY_ATTRIBUTES 構造体へのポインタ。lpSecurityAttributes が NULL の場合、ファイルには既定のセキュリティ記述子が割り当てられる。ファイルの既定のセキュリティ記述子の ACL は、親ディレクトリから継承される。
Flags : [int] 
%inst
指定したキーとそのすべてのサブキーおよび値を、指定した形式でレジストリファイルに保存する。(Unicode)

[戻り値]
関数が成功した場合、戻り値は ERROR_SUCCESS となる。関数が失敗した場合、戻り値は Winerror.h で定義された 0
以外のエラーコードとなる。FormatMessage 関数に FORMAT_MESSAGE_FROM_SYSTEM
フラグを指定して呼び出すと、エラーの一般的な説明を取得できる。この関数への 1 回の呼び出しで Flags
パラメータに上記の複数の値が指定された場合（たとえば 2 つ以上の値が OR されている場合）、または
REG_NO_COMPRESSION が指定されているが hKey がハイブのルートでないキーを指定している場合、この関数は
ERROR_INVALID_PARAMETER を返す。

[備考]
RegSaveKey とは異なり、この関数は HKEY_CLASSES_ROOT 定義済みキーをサポートしない。hKey
がリモートコンピュータ上のキーを表す場合、lpFile で指定されたパスはリモートコンピュータに対する相対となる。RegSaveKeyEx
関数は不揮発性キーのみを保存し、揮発性キーは保存しない。キーは作成時に揮発性または不揮発性となる。RegCreateKeyEx
を参照のこと。RegSaveKeyEx で作成したファイルは、RegLoadKey、RegReplaceKey、または
RegRestoreKey 関数の後続の呼び出しで使用できる。RegSaveKeyEx
が操作の途中で失敗した場合、ファイルは破損し、そのファイルに対する
RegLoadKey、RegReplaceKey、RegRestoreKey の後続の呼び出しは失敗する。RegSaveKeyEx と
RegRestoreKey
を併用してレジストリ内のサブツリーをコピーすることは推奨されない。この方法は通知をトリガーせず、他のアプリケーションが使用しているハンドルを無効にする可能性がある。代わりに
SHCopyKey 関数または RegCopyTree 関数を使用すること。呼び出し側プロセスは SE_BACKUP_NAME
特権を有効にしておく必要がある。詳細は特殊な特権での実行を参照のこと。
> [!NOTE] > winreg.h ヘッダは RegSaveKeyEx をエイリアスとして定義しており、UNICODE
プリプロセッサ定数の定義に基づいて ANSI または Unicode
版を自動的に選択する。エンコーディングに中立なエイリアスをエンコーディング中立でないコードと混在させると、コンパイル時または実行時エラーとなる可能性がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照のこと。


%index
RegSetKeySecurity
開かれているレジストリキーのセキュリティを設定する。
%group
Win32 advapi32
%prm
hKey, SecurityInformation, pSecurityDescriptor
hKey : [intptr] セキュリティ記述子を設定する対象の、開かれているキーへのハンドル。
SecurityInformation : [int] 設定するセキュリティ情報の種類を示すビットフラグの集合。このパラメータには SECURITY_INFORMATION ビットフラグの組み合わせを指定できる。
pSecurityDescriptor : [int] 指定したキーに設定するセキュリティ属性を指定する SECURITY_DESCRIPTOR 構造体へのポインタ。
%inst
開かれているレジストリキーのセキュリティを設定する。

[戻り値]
関数が成功した場合、関数は ERROR_SUCCESS を返す。
関数が失敗した場合、WinError.h で定義された 0 以外のエラーコードを返す。FormatMessage 関数に
FORMAT_MESSAGE_FROM_SYSTEM フラグを指定して呼び出すと、エラーの一般的な説明を取得できる。

[備考]
hKey
が定義済みキーのいずれかである場合、次回定義済みキーが参照されたときに新しいセキュリティ情報が有効になるように、RegCloseKey
関数を使用して定義済みキーを閉じる。


%index
RegSetValueExW
レジストリキー配下の指定された値のデータとタイプを設定する。(Unicode)
%group
Win32 advapi32
%prm
hKey, lpValueName, Reserved, dwType, lpData, cbData
hKey : [intptr] オープン中のレジストリキーへのハンドル。KEY_SET_VALUE アクセス権で開かれている必要がある。RegCreateKeyEx 等で取得したもの、または定義済みキーのいずれか。
lpValueName : [wstr] 設定する値の名前。キーにない場合は追加される。NULL または空文字列の場合、キーの名前なし/既定値のタイプとデータを設定する。
Reserved : [int] このパラメータは予約されており 0 でなければならない。
dwType : [int] lpData が指すデータタイプ。指定可能なタイプは Registry Value Types を参照。
lpData : [var] 保存するデータ。REG_SZ のような文字列ベースのタイプでは NULL 終端されていなければならない。REG_MULTI_SZ は 2 つの終端 NULL が必要。NULL 値を示す場合は cbData を 0 にする必要がある。
cbData : [int] lpData が指す情報のサイズ(バイト単位)。REG_SZ、REG_EXPAND_SZ、REG_MULTI_SZ の場合、終端 NULL のサイズを含めなければならない。
%inst
レジストリキー配下の指定された値のデータとタイプを設定する。(Unicode)

[戻り値]
関数が成功した場合、戻り値は ERROR_SUCCESS。失敗した場合は Winerror.h で定義された 0 以外のエラーコード。

[備考]
値サイズは利用可能メモリに制限されるが、大きな値を保存するとパフォーマンスに影響する。長い値(2,048
バイト超)はファイルとして保存し、レジストリにはパスのみを保存すべきである。アイコン、ビットマップ、実行ファイルなどはファイルとして保存すること。REG_SZ/REG_MULTI_SZ/REG_EXPAND_SZ
で ANSI 版を使う場合、lpData は ANSI 文字列で、レジストリに保存される前に Unicode
に変換される。RegSetKeyValue の方が便利な場合がある。


%index
RegUnLoadKeyW
指定したレジストリキーとそのサブキーをレジストリからアンロードする。(Unicode)
%group
Win32 advapi32
%prm
hKey, lpSubKey
hKey : [intptr] アンロードするレジストリキーへのハンドル。このパラメータは RegConnectRegistry 関数の呼び出しで返されたハンドル、または以下の定義済みハンドルのいずれかにできる: * HKEY_LOCAL_MACHINE * HKEY_USERS
lpSubKey : [wstr] アンロードするサブキーの名前。lpSubKey パラメータが参照するキーは、RegLoadKey 関数を使用して作成されたものでなければならない。
%inst
指定したレジストリキーとそのサブキーをレジストリからアンロードする。(Unicode)

[戻り値]
関数が成功した場合、戻り値は ERROR_SUCCESS となる。関数が失敗した場合、戻り値は Winerror.h で定義された 0
以外のエラーコードとなる。FormatMessage 関数に FORMAT_MESSAGE_FROM_SYSTEM
フラグを指定して呼び出すと、エラーの一般的な説明を取得できる。

[備考]

この関数はレジストリからハイブを削除するが、レジストリ情報を含むファイルは変更しない。ハイブは、レジストリ階層の最上位をルートとするキー、サブキー、値の個別の本体である。呼び出し側プロセスはレジストリが存在するコンピュータ上で
SE_RESTORE_NAME および SE_BACKUP_NAME 特権を持っている必要がある。詳細は特殊な特権での実行を参照のこと。
> [!NOTE] > winreg.h ヘッダは RegUnLoadKey をエイリアスとして定義しており、UNICODE
プリプロセッサ定数の定義に基づいて ANSI または Unicode
版を自動的に選択する。エンコーディングに中立なエイリアスをエンコーディング中立でないコードと混在させると、コンパイル時または実行時エラーとなる可能性がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照のこと。


%index
AbortSystemShutdownW
開始済みのシステムシャットダウンを中止する。(Unicode)
%group
Win32 advapi32
%prm
lpMachineName
lpMachineName : [wstr] シャットダウンを中止するコンピュータのネットワーク名。lpMachineName が NULL または空文字列の場合、本関数はローカルコンピュータのシャットダウンを停止する。
%inst
開始済みのシステムシャットダウンを中止する。(Unicode)

[戻り値]
関数が成功した場合、戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼び出す。

[備考]
InitiateSystemShutdown および InitiateSystemShutdownEx
関数は、システムがシャットダウンされることをユーザーに通知するダイアログボックスを表示する。シャットダウンのタイムアウト期間中、AbortSystemShutdown
関数によってシステムのシャットダウンを阻止できる。Windows Server 2003 および Windows XP with SP1:
シャットダウン対象のコンピュータがターミナルサービスサーバである場合、システムはすべてのローカルおよびリモートユーザーに対し、シャットダウンが開始されたことを知らせるダイアログボックスを表示する。AbortSystemShutdown
によってシャットダウンが阻止された場合、サーバがもうシャットダウンされないことをユーザーに知らせるダイアログボックスを表示する。ローカルコンピュータのシャットダウンを停止するには、呼び出し元プロセスが
SE_SHUTDOWN_NAME
特権を持っている必要がある。リモートコンピュータのシャットダウンを停止するには、呼び出し元プロセスがそのリモートコンピュータ上で
SE_REMOTE_SHUTDOWN_NAME 特権を持っている必要がある。既定では、ユーザーは自身がログオンしているコンピュータ上で
SE_SHUTDOWN_NAME 特権を有効化でき、管理者はリモートコンピュータ上で SE_REMOTE_SHUTDOWN_NAME
特権を有効化できる。詳細は「特殊な特権を持って実行する」を参照のこと。失敗する主な原因としては、無効なコンピュータ名、アクセスできないコンピュータ、特権不足などが挙げられる。


%index
AccessCheck
セキュリティ記述子が、アクセストークンによって識別されるクライアントに対して指定された一連のアクセス権を許可するかどうかを判定する。(AccessCheck)
%group
Win32 advapi32
%prm
pSecurityDescriptor, ClientToken, DesiredAccess, GenericMapping, PrivilegeSet, PrivilegeSetLength, GrantedAccess, AccessStatus
pSecurityDescriptor : [int] アクセスチェック対象の SECURITY_DESCRIPTOR 構造体へのポインタ。
ClientToken : [intptr] アクセスを試みるクライアントを表す偽装トークンへのハンドル。このハンドルは対象のトークンに対する TOKEN_QUERY アクセス権を持っている必要がある。そうでない場合、関数は ERROR_ACCESS_DENIED で失敗する。
DesiredAccess : [int] チェックするアクセス権を指定するアクセスマスク。このマスクは MapGenericMask 関数によって汎用アクセス権を含まないようにマッピング済みでなければならない。
GenericMapping : [var] アクセスチェック対象のオブジェクトに関連付けられた GENERIC_MAPPING 構造体へのポインタ。
PrivilegeSet : [var] アクセス検証の実行に使用された特権を受け取る PRIVILEGE_SET 構造体へのポインタ。特権が一切使用されなかった場合、関数は PrivilegeCount メンバを 0 に設定する。
PrivilegeSetLength : [var] PrivilegeSet パラメータが指すバッファのサイズ（バイト単位）。
GrantedAccess : [var] 許可されたアクセス権を受け取るアクセスマスクへのポインタ。AccessStatus が FALSE に設定された場合、関数はアクセスマスクを 0 に設定する。関数が失敗した場合は、アクセスマスクを設定しない。
AccessStatus : [var] アクセスチェックの結果を受け取る変数へのポインタ。セキュリティ記述子がアクセストークンによって識別されるクライアントに対して要求されたアクセス権を許可する場合、AccessStatus には TRUE が設定される。そうでない場合は FALSE が設定され、GetLastError を呼び出すことで拡張エラー情報を取得できる。
%inst

セキュリティ記述子が、アクセストークンによって識別されるクライアントに対して指定された一連のアクセス権を許可するかどうかを判定する。(AccessCheck)

[戻り値]
関数が成功した場合、戻り値は 0 以外となる。
関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには GetLastError を呼び出す。

[備考]
詳細は「How AccessCheck Works」概説を参照のこと。AccessCheck
関数は、指定されたセキュリティ記述子と指定されたアクセストークンを比較し、アクセスが許可されたか拒否されたかを AccessStatus
パラメータで返す。アクセスが許可された場合、要求されたアクセスマスクがオブジェクトの許可済みアクセスマスクとなる。セキュリティ記述子の
DACL が NULL の場合、AccessStatus パラメータは TRUE
を返し、クライアントが要求されたアクセス権を持っていることを示す。セキュリティ記述子が所有者 SID とグループ SID
を含まない場合、AccessCheck 関数は ERROR_INVALID_SECURITY_DESCR
で失敗する。AccessCheck
関数は監査を生成しない。アプリケーションでアクセスチェック時の監査が必要な場合は、AccessCheck の代わりに
AccessCheckAndAuditAlarm、AccessCheckByTypeAndAuditAlarm、AccessCheckByTypeResultListAndAuditAlarm、AccessCheckByTypeResultListAndAuditAlarmByHandle
などの関数を使用する。


%index
AccessCheckAndAuditAlarmW
セキュリティ記述子が、呼び出し元スレッドが偽装しているクライアントに対して指定された一連のアクセス権を許可するかどうかを判定する。
%group
Win32 advapi32
%prm
SubsystemName, HandleId, ObjectTypeName, ObjectName, SecurityDescriptor, DesiredAccess, GenericMapping, ObjectCreation, GrantedAccess, AccessStatus, pfGenerateOnClose
SubsystemName : [wstr] 関数を呼び出しているサブシステムの名前を指定する、null 終端文字列へのポインタ。この文字列は関数が生成する監査メッセージに表示される。
HandleId : [intptr] クライアントのオブジェクトに対するハンドルを表す一意な値へのポインタ。アクセスが拒否された場合、システムはこの値を無視する。
ObjectTypeName : [wstr] 作成中またはアクセス中のオブジェクトの種類を指定する、null 終端文字列へのポインタ。この文字列は関数が生成する監査メッセージに表示される。
ObjectName : [wstr] 作成中またはアクセス中のオブジェクトの名前を指定する、null 終端文字列へのポインタ。この文字列は関数が生成する監査メッセージに表示される。
SecurityDescriptor : [int] アクセスチェック対象の SECURITY_DESCRIPTOR 構造体へのポインタ。
DesiredAccess : [int] チェックするアクセス権を指定するアクセスマスク。このマスクは MapGenericMask 関数によって汎用アクセス権を含まないようにマッピング済みでなければならない。このパラメータが MAXIMUM_ALLOWED の場合、関数はセキュリティ記述子がクライアントに対して許可する最大のアクセス権を示すように GrantedAccess アクセスマスクを設定する。
GenericMapping : [var] アクセスチェック対象のオブジェクトに関連付けられた GENERIC_MAPPING 構造体へのポインタ。
ObjectCreation : [int] アクセスが許可されたときに呼び出し側アプリケーションが新しいオブジェクトを作成するかどうかを決定するフラグ。TRUE はアプリケーションが新しいオブジェクトを作成することを示し、FALSE はアプリケーションが既存のオブジェクトを開くことを示す。
GrantedAccess : [var] 許可されたアクセス権を受け取るアクセスマスクへのポインタ。AccessStatus が FALSE に設定された場合、関数はアクセスマスクを 0 に設定する。関数が失敗した場合は、アクセスマスクを設定しない。
AccessStatus : [var] アクセスチェックの結果を受け取る変数へのポインタ。セキュリティ記述子がクライアントに対して要求されたアクセス権を許可する場合、AccessStatus には TRUE が設定される。そうでない場合は FALSE が設定される。
pfGenerateOnClose : [var] 関数の復帰時に監査生成ルーチンがセットするフラグへのポインタ。オブジェクトハンドルを閉じるときに ObjectCloseAuditAlarm 関数にこのフラグを渡す。
%inst
セキュリティ記述子が、呼び出し元スレッドが偽装しているクライアントに対して指定された一連のアクセス権を許可するかどうかを判定する。

[戻り値]
関数が成功した場合、戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼び出す。

[備考]
詳細は「How AccessCheck Works」概説を参照のこと。AccessCheckAndAuditAlarm
関数は、呼び出し元プロセスが SE_AUDIT_NAME
特権を有効にしている必要がある。この特権は、呼び出し元プロセスのプライマリトークンに対してテストされ、スレッドの偽装トークンは対象とならない。呼び出し元スレッドがクライアントを偽装していない場合、AccessCheckAndAuditAlarm
関数は失敗する。


%index
AccessCheckByType
セキュリティ記述子が、アクセストークンによって識別されるクライアントに対して指定された一連のアクセス権を許可するかどうかを判定する。(AccessCheckByType)
%group
Win32 advapi32
%prm
pSecurityDescriptor, PrincipalSelfSid, ClientToken, DesiredAccess, ObjectTypeList, ObjectTypeListLength, GenericMapping, PrivilegeSet, PrivilegeSetLength, GrantedAccess, AccessStatus
pSecurityDescriptor : [int] アクセスチェック対象の SECURITY_DESCRIPTOR 構造体へのポインタ。
PrincipalSelfSid : [int] SID へのポインタ。セキュリティ記述子がプリンシパルを表すオブジェクト（ユーザーオブジェクトなど）に関連付けられている場合、PrincipalSelfSid パラメータにはそのオブジェクトの SID を指定する。アクセス評価時には、この SID は周知 SID PRINCIPAL_SELF (S-1-5-10) を含む任意のアクセス制御エントリ内の SID を論理的に置き換える。周知 SID の詳細は「Well-known SIDs」を参照のこと。
ClientToken : [intptr] アクセスを試みるクライアントを表す偽装トークンへのハンドル。このハンドルは対象のトークンに対する TOKEN_QUERY アクセス権を持っている必要がある。そうでない場合、関数は ERROR_ACCESS_DENIED で失敗する。
DesiredAccess : [int] チェックするアクセス権を指定するアクセスマスク。このマスクは MapGenericMask 関数によって汎用アクセス権を含まないようにマッピング済みでなければならない。
ObjectTypeList : [var] アクセスをチェックするオブジェクト型の階層を識別する OBJECT_TYPE_LIST 構造体の配列へのポインタ。配列の各要素には、オブジェクト型を識別する GUID と、オブジェクト型階層におけるレベルを示す値を指定する。配列内に同じ GUID を持つ要素が 2 つ存在してはならない。
ObjectTypeListLength : [int] ObjectTypeList 配列の要素数を指定する。
GenericMapping : [var] アクセスチェック対象のオブジェクトに関連付けられた GENERIC_MAPPING 構造体へのポインタ。GENERIC_MAPPING 構造体の GenericAll メンバには、STANDARD_RIGHTS_ALL および GenericRead、GenericWrite、GenericExecute メンバに設定されたすべての権限を含め、リソースマネージャが許可できるすべてのアクセス権が含まれている必要がある。
PrivilegeSet : [var] アクセス検証の実行に使用された特権を受け取る PRIVILEGE_SET 構造体へのポインタ。特権が一切使用されなかった場合、関数は PrivilegeCount メンバを 0 に設定する。
PrivilegeSetLength : [var] PrivilegeSet パラメータが指すバッファのサイズ（バイト単位）。
GrantedAccess : [var] 許可されたアクセス権を受け取るアクセスマスクへのポインタ。AccessStatus が FALSE に設定された場合、関数はアクセスマスクを 0 に設定する。関数が失敗した場合は、アクセスマスクを設定しない。
AccessStatus : [var] アクセスチェックの結果を受け取る変数へのポインタ。セキュリティ記述子がアクセストークンによって識別されるクライアントに対して要求されたアクセス権を許可する場合、AccessStatus には TRUE が設定される。そうでない場合は FALSE が設定され、GetLastError を呼び出すことで拡張エラー情報を取得できる。
%inst

セキュリティ記述子が、アクセストークンによって識別されるクライアントに対して指定された一連のアクセス権を許可するかどうかを判定する。(AccessCheckByType)

[戻り値]
関数が成功した場合、戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼び出す。

[備考]
詳細は「How AccessCheck Works」概説を参照のこと。AccessCheckByType
関数は、指定されたセキュリティ記述子と指定されたアクセストークンを比較し、アクセスが許可されたか拒否されたかを AccessStatus
パラメータで返す。ObjectTypeList
配列は必ずしも定義済みオブジェクト全体を表すものではなく、アクセスをチェックしたいオブジェクトのサブセットを表す。たとえば、プロパティセット内の
2 つのプロパティへのアクセスをチェックするには、レベル 0 にオブジェクト自体、レベル 1 にプロパティセット、レベル 2 に 2
つのプロパティという 4 要素のオブジェクト型リストを指定する。AccessCheckByType 関数は、オブジェクト自体に適用される
ACE と、ObjectTypeList 配列に列挙されたオブジェクト型に対するオブジェクト固有の ACE
を評価する。配列に列挙されていないオブジェクト型に対するオブジェクト固有の ACE は無視される。したがって、AccessStatus
パラメータで返される結果は、オブジェクト全体ではなく ObjectTypeList
パラメータで定義されたオブジェクトのサブセットに対して許可されたアクセスを示す。ACE
の階層がオブジェクトおよびそのサブオブジェクトへのアクセスをどのように制御するかの詳細は「ACEs to Control Access
to an Object's Properties」を参照のこと。セキュリティ記述子の DACL が NULL
の場合、AccessStatus パラメータは TRUE
を返し、クライアントが要求されたアクセス権を持っていることを示す。セキュリティ記述子が所有者 SID とグループ SID
を含まない場合、AccessCheckByType は ERROR_INVALID_SECURITY_DESCR で失敗する。


%index
AccessCheckByTypeAndAuditAlarmW
セキュリティ記述子が、呼び出し元スレッドが偽装しているクライアントに対して指定された一連のアクセス権を許可するかどうかを判定する。(AccessCheckByTypeAndAuditAlarmW)
%group
Win32 advapi32
%prm
SubsystemName, HandleId, ObjectTypeName, ObjectName, SecurityDescriptor, PrincipalSelfSid, DesiredAccess, AuditType, Flags, ObjectTypeList, ObjectTypeListLength, GenericMapping, ObjectCreation, GrantedAccess, AccessStatus, pfGenerateOnClose
SubsystemName : [wstr] 関数を呼び出しているサブシステムの名前を指定する、null 終端文字列へのポインタ。この文字列は関数が生成する監査メッセージに表示される。
HandleId : [intptr] クライアントのオブジェクトに対するハンドルを表す一意な値へのポインタ。アクセスが拒否された場合、システムはこの値を無視する。
ObjectTypeName : [wstr] 作成中またはアクセス中のオブジェクトの種類を指定する、null 終端文字列へのポインタ。この文字列は関数が生成する監査メッセージに表示される。
ObjectName : [wstr] 作成中またはアクセス中のオブジェクトの名前を指定する、null 終端文字列へのポインタ。この文字列は関数が生成する監査メッセージに表示される。
SecurityDescriptor : [int] アクセスチェック対象の SECURITY_DESCRIPTOR 構造体へのポインタ。
PrincipalSelfSid : [int] SID へのポインタ。セキュリティ記述子がプリンシパルを表すオブジェクト（ユーザーオブジェクトなど）に関連付けられている場合、PrincipalSelfSid パラメータにはそのオブジェクトの SID を指定する。アクセス評価時には、この SID は周知 SID PRINCIPAL_SELF (S-1-5-10) を含む任意の ACE 内の SID を論理的に置き換える。周知 SID の詳細は「Well-known SIDs」を参照のこと。保護対象オブジェクトがプリンシパルを表さない場合、このパラメータは NULL に設定する。
DesiredAccess : [int] チェックするアクセス権を指定するアクセスマスク。このマスクは MapGenericMask 関数によって汎用アクセス権を含まないようにマッピング済みでなければならない。このパラメータが MAXIMUM_ALLOWED の場合、関数はセキュリティ記述子がクライアントに対して許可する最大のアクセス権を示すように GrantedAccess アクセスマスクを設定する。
AuditType : [int] 生成する監査の種類。AUDIT_EVENT_TYPE 列挙型の値のいずれかを指定する。
Flags : [int] 呼び出し元プロセスが SE_AUDIT_NAME 特権を有効にしていない場合の関数の挙動を制御するフラグ。AUDIT_ALLOW_NO_PRIVILEGE フラグがセットされている場合、特権が有効になっていないときに関数は監査メッセージを生成せずにアクセスチェックを実行する。このパラメータが 0 の場合、特権が有効になっていないと関数は失敗する。
ObjectTypeList : [var] アクセスをチェックするオブジェクト型の階層を識別する OBJECT_TYPE_LIST 構造体の配列へのポインタ。配列の各要素には、オブジェクト型を識別する GUID と、オブジェクト型階層におけるレベルを示す値を指定する。配列内に同じ GUID を持つ要素が 2 つ存在してはならない。配列には少なくとも 1 つの要素が必要である。配列の最初の要素はレベル 0 でなければならず、オブジェクト自体を識別する。配列にはレベル 0 の要素を 1 つだけ含めることができる。2 番目の要素はサブオブジェクト（プロパティセットなど）であり、レベル 1 となる。各レベル 1 のエントリの後には、レベル 2 から 4 のサブオブジェクトに対する下位エントリが続く。したがって、配列要素のレベルは例えば {0, 1, 2, 2, 1, 2, 3} のようになる。オブジェクト型リストの順序が不正な場合、AccessCheckByTypeAndAuditAlarm は失敗し、GetLastError は ERROR_INVALID_PARAMETER を返す。
ObjectTypeListLength : [int] ObjectTypeList 配列の要素数。
GenericMapping : [var] アクセスチェック対象のオブジェクトに関連付けられた GENERIC_MAPPING 構造体へのポインタ。
ObjectCreation : [int] アクセスが許可されたときに呼び出し側アプリケーションが新しいオブジェクトを作成するかどうかを決定するフラグ。TRUE はアプリケーションが新しいオブジェクトを作成することを示し、FALSE はアプリケーションが既存のオブジェクトを開くことを示す。
GrantedAccess : [var] 許可されたアクセス権を受け取るアクセスマスクへのポインタ。AccessStatus が FALSE に設定された場合、関数はアクセスマスクを 0 に設定する。関数が失敗した場合は、アクセスマスクを設定しない。
AccessStatus : [var] アクセスチェックの結果を受け取る変数へのポインタ。セキュリティ記述子がクライアントに対して要求されたアクセス権を許可する場合、AccessStatus には TRUE が設定される。そうでない場合は FALSE が設定され、GetLastError を呼び出すことで拡張エラー情報を取得できる。
pfGenerateOnClose : [var] 関数の復帰時に監査生成ルーチンがセットするフラグへのポインタ。オブジェクトハンドルを閉じるときに ObjectCloseAuditAlarm 関数にこのフラグを渡す。
%inst

セキュリティ記述子が、呼び出し元スレッドが偽装しているクライアントに対して指定された一連のアクセス権を許可するかどうかを判定する。(AccessCheckByTypeAndAuditAlarmW)

[戻り値]
関数が成功した場合、戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼び出す。

[備考]
詳細は「How AccessCheck Works」概説を参照のこと。PrincipalSelfSid パラメータと
ObjectTypeList パラメータが NULL、AuditType パラメータが
AuditEventObjectAccess、Flags パラメータが 0
の場合、AccessCheckByTypeAndAuditAlarm は AccessCheckAndAuditAlarm
関数と同じ動作をする。ObjectTypeList
配列は必ずしも定義済みオブジェクト全体を表すものではなく、アクセスをチェックしたいオブジェクトのサブセットを表す。たとえば、プロパティセット内の
2 つのプロパティへのアクセスをチェックするには、レベル 0 にオブジェクト自体、レベル 1 にプロパティセット、レベル 2 に 2
つのプロパティという 4 要素のオブジェクト型リストを指定する。AccessCheckByTypeAndAuditAlarm
関数は、オブジェクト自体に適用される ACE と、ObjectTypeList 配列に列挙されたオブジェクト型に対するオブジェクト固有の
ACE を評価する。配列に列挙されていないオブジェクト型に対するオブジェクト固有の ACE
は無視される。したがって、AccessStatus パラメータで返される結果は、オブジェクト全体ではなく ObjectTypeList
パラメータで定義されたオブジェクトのサブセットに対して許可されたアクセスを示す。ACE
の階層がオブジェクトおよびそのサブオブジェクトへのアクセスをどのように制御するかの詳細は「ACEs to Control Access
to an Object's
Properties」を参照のこと。セキュリティイベントログに監査メッセージを生成するには、呼び出し元プロセスが
SE_AUDIT_NAME
特権を有効にしている必要がある。システムはこの特権を、スレッドの偽装トークンではなく呼び出し元プロセスのプライマリトークンに対して確認する。Flags
パラメータに AUDIT_ALLOW_NO_PRIVILEGE
フラグが含まれている場合、特権が有効になっていないときに関数は監査メッセージを生成せずにアクセスチェックを実行する。呼び出し元スレッドがクライアントを偽装していない場合、AccessCheckByTypeAndAuditAlarm
関数は失敗する。セキュリティ記述子が所有者 SID とグループ SID
を含まない場合、AccessCheckByTypeAndAuditAlarm は ERROR_INVALID_SECURITY_DESCR
で失敗する。


%index
AccessCheckByTypeResultList
セキュリティ記述子が、アクセストークンによって識別されるクライアントに対して指定された一連のアクセス権を許可するかどうかを判定する。(AccessCheckByTypeResultList)
%group
Win32 advapi32
%prm
pSecurityDescriptor, PrincipalSelfSid, ClientToken, DesiredAccess, ObjectTypeList, ObjectTypeListLength, GenericMapping, PrivilegeSet, PrivilegeSetLength, GrantedAccessList, AccessStatusList
pSecurityDescriptor : [int] アクセスチェック対象の SECURITY_DESCRIPTOR 構造体へのポインタ。
PrincipalSelfSid : [int] SID へのポインタ。セキュリティ記述子がプリンシパルを表すオブジェクト（ユーザーオブジェクトなど）に関連付けられている場合、PrincipalSelfSid パラメータにはそのオブジェクトの SID を指定する。アクセス評価時には、この SID は周知 SID PRINCIPAL_SELF (S-1-5-10) を含む任意の ACE 内の SID を論理的に置き換える。周知 SID の詳細は「Well-known SIDs」を参照のこと。
ClientToken : [intptr] アクセスを試みるクライアントを表す偽装トークンへのハンドル。このハンドルは対象のトークンに対する TOKEN_QUERY アクセス権を持っている必要がある。そうでない場合、関数は ERROR_ACCESS_DENIED で失敗する。
DesiredAccess : [int] チェックするアクセス権を指定するアクセスマスク。このマスクは MapGenericMask 関数によって汎用アクセス権を含まないようにマッピング済みでなければならない。
ObjectTypeList : [var] アクセスをチェックするオブジェクト型の階層を識別する OBJECT_TYPE_LIST 構造体の配列へのポインタ。配列の各要素には、オブジェクト型を識別する GUID と、オブジェクト型階層におけるレベルを示す値を指定する。配列内に同じ GUID を持つ要素が 2 つ存在してはならない。
ObjectTypeListLength : [int] ObjectTypeList 配列の要素数。これは GrantedAccessList および AccessStatusList パラメータが指す配列の要素数でもある。
GenericMapping : [var] アクセスチェック対象のオブジェクトに関連付けられた GENERIC_MAPPING 構造体へのポインタ。
PrivilegeSet : [var] アクセス検証の実行に使用された特権を受け取る PRIVILEGE_SET 構造体へのポインタ。特権が一切使用されなかった場合、関数は PrivilegeCount メンバを 0 に設定する。
PrivilegeSetLength : [var] PrivilegeSet パラメータが指すバッファのサイズ（バイト単位）。
GrantedAccessList : [var] アクセスマスクの配列へのポインタ。関数は、オブジェクト型リストの対応する要素に対して許可されたアクセス権を示すように各アクセスマスクを設定する。関数が失敗した場合、アクセスマスクは設定されない。
AccessStatusList : [var] オブジェクト型リストの各要素に対応するステータスコードの配列へのポインタ。関数は、アクセスチェックの成功を示す場合に要素を 0 に、特定のエラーを示す場合に 0 以外の値に設定する。関数が失敗した場合、配列の要素は一切設定されない。
%inst

セキュリティ記述子が、アクセストークンによって識別されるクライアントに対して指定された一連のアクセス権を許可するかどうかを判定する。(AccessCheckByTypeResultList)

[戻り値]
関数が成功した場合、戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼び出す。

[備考]
詳細は「How AccessCheck Works」概説を参照のこと。AccessCheckByTypeResultList
関数は、指定されたセキュリティ記述子と指定されたアクセストークンを比較し、オブジェクト型リストの各要素について、アクセスが許可されたか拒否されたかを
AccessStatusList パラメータで返す。ObjectTypeList
配列は必ずしも定義済みオブジェクト全体を表すものではなく、アクセスをチェックしたいオブジェクトのサブセットを表す。たとえば、プロパティセット内の
2 つのプロパティへのアクセスをチェックするには、レベル 0 にオブジェクト自体、レベル 1 にプロパティセット、レベル 2 に 2
つのプロパティという 4 要素のオブジェクト型リストを指定する。AccessCheckByTypeResultList
関数は、オブジェクト自体に適用される ACE と、ObjectTypeList 配列に列挙されたオブジェクト型に対するオブジェクト固有の
ACE を評価する。配列に列挙されていないオブジェクト型に対するオブジェクト固有の ACE
は無視される。したがって、AccessStatusList パラメータの要素 0 で返される結果は、オブジェクト全体ではなく
ObjectTypeList パラメータで定義されたオブジェクトのサブセットに対して許可されたアクセスを示す。ACE
の階層がオブジェクトおよびそのサブオブジェクトへのアクセスをどのように制御するかの詳細は「ACEs to Control Access
to an Object's Properties」を参照のこと。セキュリティ記述子の任意アクセス制御リスト（DACL）が NULL
の場合、関数はオブジェクト型リストのすべての要素に対して要求されたアクセスを許可する。セキュリティ記述子が所有者 SID とグループ
SID を含まない場合、AccessCheckByTypeResultList は
ERROR_INVALID_SECURITY_DESCR で失敗する。


%index
AccessCheckByTypeResultListAndAuditAlarmW
セキュリティ記述子が、呼び出し元スレッドが偽装しているクライアントに対して指定された一連のアクセス権を許可するかどうかを判定する。(AccessCheckByTypeResultListAndAuditAlarmW)
%group
Win32 advapi32
%prm
SubsystemName, HandleId, ObjectTypeName, ObjectName, SecurityDescriptor, PrincipalSelfSid, DesiredAccess, AuditType, Flags, ObjectTypeList, ObjectTypeListLength, GenericMapping, ObjectCreation, GrantedAccessList, AccessStatusList, pfGenerateOnClose
SubsystemName : [wstr] 関数を呼び出しているサブシステムの名前を指定する、null 終端文字列へのポインタ。この文字列は関数が生成する監査メッセージに表示される。
HandleId : [intptr] クライアントのオブジェクトに対するハンドルを表す一意な値へのポインタ。アクセスが拒否された場合、システムはこの値を無視する。
ObjectTypeName : [wstr] 作成中またはアクセス中のオブジェクトの種類を指定する、null 終端文字列へのポインタ。この文字列は関数が生成する監査メッセージに表示される。
ObjectName : [wstr] 作成中またはアクセス中のオブジェクトの名前を指定する、null 終端文字列へのポインタ。この文字列は関数が生成する監査メッセージに表示される。
SecurityDescriptor : [int] アクセスチェック対象の SECURITY_DESCRIPTOR 構造体へのポインタ。
PrincipalSelfSid : [int] SID へのポインタ。セキュリティ記述子がプリンシパルを表すオブジェクト（ユーザーオブジェクトなど）に関連付けられている場合、PrincipalSelfSid パラメータにはそのオブジェクトの SID を指定する。アクセス評価時には、この SID は周知 SID PRINCIPAL_SELF (S-1-5-10) を含む任意の ACE 内の SID を論理的に置き換える。周知 SID の詳細は「Well-known SIDs」を参照のこと。保護対象オブジェクトがプリンシパルを表さない場合、このパラメータは NULL に設定する。
DesiredAccess : [int] チェックするアクセス権を指定するアクセスマスク。このマスクは、汎用アクセス権を含まないように MapGenericMask 関数によってマッピング済みでなければならない。このパラメータが MAXIMUM_ALLOWED の場合、関数はセキュリティ記述子がクライアントに対して許可する最大のアクセス権を示すように GrantedAccess のアクセスマスクを設定する。
AuditType : [int] 生成する監査の種類。AUDIT_EVENT_TYPE 列挙型の値のいずれかを指定する。
Flags : [int] 呼び出し元プロセスが SE_AUDIT_NAME 特権を有効にしていない場合の関数の挙動を制御するフラグ。AUDIT_ALLOW_NO_PRIVILEGE フラグがセットされている場合、特権が有効になっていないときに関数は監査メッセージを生成せずにアクセスチェックを実行する。このパラメータが 0 の場合、特権が有効になっていないと関数は失敗する。
ObjectTypeList : [var] アクセスをチェックするオブジェクト型の階層を識別する OBJECT_TYPE_LIST 構造体の配列へのポインタ。配列の各要素には、オブジェクト型を識別する GUID と、オブジェクト型階層におけるレベルを示す値を指定する。配列内に同じ GUID を持つ要素が 2 つ存在してはならない。配列には少なくとも 1 つの要素が必要である。配列の最初の要素はレベル 0 でなければならず、オブジェクト自体を識別する。配列にはレベル 0 の要素を 1 つだけ含めることができる。2 番目の要素はサブオブジェクト（プロパティセットなど）であり、レベル 1 となる。各レベル 1 のエントリの後には、レベル 2 から 4 のサブオブジェクトに対する下位エントリが続く。したがって、配列要素のレベルは例えば {0, 1, 2, 2, 1, 2, 3} のようになる。オブジェクト型リストの順序が不正な場合、AccessCheckByTypeResultListAndAuditAlarm は失敗し、GetLastError は ERROR_INVALID_PARAMETER を返す。
ObjectTypeListLength : [int] ObjectTypeList 配列の要素数。
GenericMapping : [var] アクセスチェック対象のオブジェクトに関連付けられた GENERIC_MAPPING 構造体へのポインタ。
ObjectCreation : [int] アクセスが許可されたときに呼び出し側アプリケーションが新しいオブジェクトを作成するかどうかを決定するフラグ。TRUE はアプリケーションが新しいオブジェクトを作成することを示し、FALSE はアプリケーションが既存のオブジェクトを開くことを示す。
GrantedAccessList : [var] 
AccessStatusList : [var] オブジェクト型リストの各要素に対応するステータスコードの配列へのポインタ。関数は、アクセスチェックの成功を示す場合に要素を 0 に、特定のエラーを示す場合に 0 以外の値に設定する。関数が失敗した場合、配列の要素は一切設定されない。
pfGenerateOnClose : [var] 関数の復帰時に監査生成ルーチンがセットするフラグへのポインタ。オブジェクトハンドルを閉じるときに ObjectCloseAuditAlarm 関数にこのフラグを渡す。
%inst

セキュリティ記述子が、呼び出し元スレッドが偽装しているクライアントに対して指定された一連のアクセス権を許可するかどうかを判定する。(AccessCheckByTypeResultListAndAuditAlarmW)

[戻り値]
関数が成功した場合、戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼び出す。

[備考]
詳細は「How AccessCheck
Works」概説を参照のこと。AccessCheckByTypeResultListAndAuditAlarm
関数は、AccessCheckByTypeResultList と AccessCheckAndAuditAlarm
関数を組み合わせたものである。ObjectTypeList
配列は必ずしも定義済みオブジェクト全体を表すものではなく、アクセスをチェックしたいオブジェクトのサブセットを表す。たとえば、プロパティセット内の
2 つのプロパティへのアクセスをチェックするには、レベル 0 にオブジェクト自体、レベル 1 にプロパティセット、レベル 2 に 2
つのプロパティという 4
要素のオブジェクト型リストを指定する。AccessCheckByTypeResultListAndAuditAlarm
関数は、オブジェクト自体に適用される ACE と、ObjectTypeList 配列に列挙されたオブジェクト型に対するオブジェクト固有の
ACE を評価する。配列に列挙されていないオブジェクト型に対するオブジェクト固有の ACE は無視される。ACE
の階層がオブジェクトおよびそのサブオブジェクトへのアクセスをどのように制御するかの詳細は「ACEs to Control Access
to an Object's
Properties」を参照のこと。セキュリティイベントログに監査メッセージを生成するには、呼び出し元プロセスが
SE_AUDIT_NAME
特権を有効にしている必要がある。システムはこの特権を、スレッドの偽装トークンではなく呼び出し元プロセスのプライマリトークンに対して確認する。Flags
パラメータに AUDIT_ALLOW_NO_PRIVILEGE
フラグが含まれている場合、特権が有効になっていないときに関数は監査メッセージを生成せずにアクセスチェックを実行する。呼び出し元スレッドがクライアントを偽装していない場合、AccessCheckByTypeResultListAndAuditAlarm
関数は失敗する。セキュリティ記述子が所有者 SID とグループ SID
を含まない場合、AccessCheckByTypeResultListAndAuditAlarm は
ERROR_INVALID_SECURITY_DESCR で失敗する。


%index
AccessCheckByTypeResultListAndAuditAlarmByHandleW
AccessCheckByTypeResultListAndAuditAlarmByHandleW (Unicode) 関数 (securitybaseapi.h) は、セキュリティ記述子が呼び出し元スレッドが偽装しているクライアントに対してアクセス権を許可するかどうかを判定する。
%group
Win32 advapi32
%prm
SubsystemName, HandleId, ClientToken, ObjectTypeName, ObjectName, SecurityDescriptor, PrincipalSelfSid, DesiredAccess, AuditType, Flags, ObjectTypeList, ObjectTypeListLength, GenericMapping, ObjectCreation, GrantedAccessList, AccessStatusList, pfGenerateOnClose
SubsystemName : [wstr] 関数を呼び出しているサブシステムの名前を指定する、null 終端文字列へのポインタ。この文字列は関数が生成する監査メッセージに表示される。
HandleId : [intptr] クライアントのオブジェクトに対するハンドルを表す一意な値へのポインタ。アクセスが拒否された場合、システムはこの値を無視する。
ClientToken : [intptr] 操作を要求したクライアントを表すトークンオブジェクトへのハンドル。このハンドルは、セキュリティポリシー違反を防ぐために、ローカル名前付きパイプなどの通信セッション層を介して取得しなければならない。呼び出し元は、指定されたトークンに対して TOKEN_QUERY アクセス権を持っている必要がある。
ObjectTypeName : [wstr] 作成中またはアクセス中のオブジェクトの種類を指定する、null 終端文字列へのポインタ。この文字列は関数が生成する監査メッセージに表示される。
ObjectName : [wstr] 作成中またはアクセス中のオブジェクトの名前を指定する、null 終端文字列へのポインタ。この文字列は関数が生成する監査メッセージに表示される。
SecurityDescriptor : [int] アクセスチェック対象の SECURITY_DESCRIPTOR 構造体へのポインタ。
PrincipalSelfSid : [int] SID へのポインタ。セキュリティ記述子がプリンシパルを表すオブジェクト（ユーザーオブジェクトなど）に関連付けられている場合、PrincipalSelfSid パラメータにはそのオブジェクトの SID を指定する。アクセス評価時には、この SID は周知 SID PRINCIPAL_SELF (S-1-5-10) を含む任意の ACE 内の SID を論理的に置き換える。周知 SID の詳細は「Well-known SIDs」を参照のこと。保護対象オブジェクトがプリンシパルを表さない場合、このパラメータは NULL に設定する。
DesiredAccess : [int] チェックするアクセス権を指定するアクセスマスク。このマスクは、汎用アクセス権を含まないように MapGenericMask 関数によってマッピング済みでなければならない。このパラメータが MAXIMUM_ALLOWED の場合、関数はセキュリティ記述子がクライアントに対して許可する最大のアクセス権を示すように GrantedAccess のアクセスマスクを設定する。
AuditType : [int] 生成する監査の種類。AUDIT_EVENT_TYPE 列挙型の値のいずれかを指定する。
Flags : [int] 呼び出し元プロセスが SE_AUDIT_NAME 特権を有効にしていない場合の関数の挙動を制御するフラグ。AUDIT_ALLOW_NO_PRIVILEGE フラグがセットされている場合、特権が有効になっていないときに関数は監査メッセージを生成せずにアクセスチェックを実行する。このパラメータが 0 の場合、特権が有効になっていないと関数は失敗する。
ObjectTypeList : [var] アクセスをチェックするオブジェクト型の階層を識別する OBJECT_TYPE_LIST 構造体の配列へのポインタ。配列の各要素には、オブジェクト型を識別する GUID と、オブジェクト型階層におけるレベルを示す値を指定する。配列内に同じ GUID を持つ要素が 2 つ存在してはならない。配列には少なくとも 1 つの要素が必要である。配列の最初の要素はレベル 0 でなければならず、オブジェクト自体を識別する。配列にはレベル 0 の要素を 1 つだけ含めることができる。2 番目の要素はサブオブジェクト（プロパティセットなど）であり、レベル 1 となる。各レベル 1 のエントリの後には、レベル 2 から 4 のサブオブジェクトに対する下位エントリが続く。したがって、配列要素のレベルは例えば {0, 1, 2, 2, 1, 2, 3} のようになる。オブジェクト型リストの順序が不正な場合、AccessCheckByTypeResultListAndAuditAlarmByHandle は失敗し、GetLastError は ERROR_INVALID_PARAMETER を返す。
ObjectTypeListLength : [int] ObjectTypeList 配列の要素数。
GenericMapping : [var] アクセスチェック対象のオブジェクトに関連付けられた GENERIC_MAPPING 構造体へのポインタ。
ObjectCreation : [int] アクセスが許可されたときに呼び出し側アプリケーションが新しいオブジェクトを作成するかどうかを決定するフラグ。TRUE はアプリケーションが新しいオブジェクトを作成することを示し、FALSE はアプリケーションが既存のオブジェクトを開くことを示す。
GrantedAccessList : [var] 
AccessStatusList : [var] オブジェクト型リストの各要素に対応するステータスコードの配列へのポインタ。関数は、アクセスチェックの成功を示す場合に要素を 0 に、特定のエラーを示す場合に 0 以外の値に設定する。関数が失敗した場合、配列の要素は一切設定されない。
pfGenerateOnClose : [var] 関数の復帰時に監査生成ルーチンがセットするフラグへのポインタ。オブジェクトハンドルを閉じるときに ObjectCloseAuditAlarm 関数にこのフラグを渡す。
%inst
AccessCheckByTypeResultListAndAuditAlarmByHandleW (Unicode) 関数
(securitybaseapi.h)
は、セキュリティ記述子が呼び出し元スレッドが偽装しているクライアントに対してアクセス権を許可するかどうかを判定する。

[戻り値]
関数が成功した場合、戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼び出す。

[備考]
詳細は「How AccessCheck
Works」概説を参照のこと。AccessCheckByTypeResultListAndAuditAlarm
と同様に、AccessCheckByTypeResultListAndAuditAlarmByHandle 関数は
AccessCheckByTypeResultList と AccessCheckAndAuditAlarm
関数を組み合わせたものである。ただし、AccessCheckByTypeResultListAndAuditAlarmByHandle
はクライアントのセキュリティ情報を提供するためにクライアントトークンハンドルも必要とする。ObjectTypeList
配列は必ずしも定義済みオブジェクト全体を表すものではなく、アクセスをチェックしたいオブジェクトのサブセットを表す。たとえば、プロパティセット内の
2 つのプロパティへのアクセスをチェックするには、レベル 0 にオブジェクト自体、レベル 1 にプロパティセット、レベル 2 に 2
つのプロパティという 4
要素のオブジェクト型リストを指定する。AccessCheckByTypeResultListAndAuditAlarmByHandle
関数は、オブジェクト自体に適用される ACE と、ObjectTypeList 配列に列挙されたオブジェクト型に対するオブジェクト固有の
ACE を評価する。配列に列挙されていないオブジェクト型に対するオブジェクト固有の ACE は無視される。ACE
の階層がオブジェクトおよびそのサブオブジェクトへのアクセスをどのように制御するかの詳細は「ACEs to Control Access
to an Object's
Properties」を参照のこと。セキュリティイベントログに監査メッセージを生成するには、呼び出し元プロセスが
SE_AUDIT_NAME
特権を有効にしている必要がある。システムはこの特権を、スレッドの偽装トークンではなく呼び出し元プロセスのプライマリトークンに対して確認する。Flags
パラメータに AUDIT_ALLOW_NO_PRIVILEGE
フラグが含まれている場合、特権が有効になっていないときに関数は監査メッセージを生成せずにアクセスチェックを実行する。呼び出し元スレッドがクライアントを偽装していない場合、AccessCheckByTypeResultListAndAuditAlarmByHandle
関数は失敗する。セキュリティ記述子が所有者 SID とグループ SID
を含まない場合、AccessCheckByTypeResultListAndAuditAlarmByHandle は
ERROR_INVALID_SECURITY_DESCR で失敗する。


%index
AddAccessAllowedAce
アクセス制御リスト (ACL) にアクセス許可アクセス制御エントリ (ACE) を追加する。アクセスは指定したセキュリティ識別子 (SID) に対して許可される。
%group
Win32 advapi32
%prm
pAcl, dwAceRevision, AccessMask, pSid
pAcl : [var] ACL へのポインタ。本関数はこの ACL の末尾にアクセス許可 ACE を追加する。ACE は ACCESS_ALLOWED_ACE 構造体の形式で格納される。
dwAceRevision : [int] 変更する ACL のリビジョンレベルを指定する。
AccessMask : [int] 指定した SID に許可するアクセス権のマスクを指定する。
pSid : [int] アクセスを許可するユーザー、グループ、またはログオンアカウントを表す SID へのポインタ。
%inst
アクセス制御リスト (ACL) にアクセス許可アクセス制御エントリ (ACE) を追加する。アクセスは指定したセキュリティ識別子
(SID) に対して許可される。

[戻り値]
関数が成功した場合、戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼び出す。以下のエラー値が返される可能性がある。
（以下省略）

[備考]
ACL へのアクセス許可 ACE の追加は、ACL 変更の最も一般的な形態である。AddAccessAllowedAce および
AddAccessDeniedAce 関数は、ACL の ACE リストの末尾に新しい ACE を追加する。これらの関数は、新しい ACE
を正しい正規順序に自動的には配置しない。正しい順序で ACE を追加し、ACL
が正規順序になるようにするのは呼び出し側の責任である。AddAccessAllowedAce 関数が ACE に配置する
ACE_HEADER 構造体は、種類とサイズを指定するが、継承情報や ACE フラグは設定しない。


%index
AddAccessAllowedAceEx
任意アクセス制御リスト (DACL) の末尾にアクセス許可アクセス制御エントリ (ACE) を追加する。(AddAccessAllowedAceEx)
%group
Win32 advapi32
%prm
pAcl, dwAceRevision, AceFlags, AccessMask, pSid
pAcl : [var] DACL へのポインタ。AddAccessAllowedAceEx 関数はこの DACL の末尾にアクセス許可 ACE を追加する。ACE は ACCESS_ALLOWED_ACE 構造体の形式で格納される。
dwAceRevision : [int] 変更する DACL のリビジョンレベルを指定する。この値には ACL_REVISION または ACL_REVISION_DS を指定できる。DACL にオブジェクト固有の ACE が含まれる場合は ACL_REVISION_DS を使用する。
AceFlags : [int] ACE の継承を制御するビットフラグのセット。関数はこれらのフラグを AceFlags メンバに設定する。
AccessMask : [int] ACCESS_MASK 形式のビットフラグのセット。これらのフラグは、新しい ACE が指定した SID に対して許可するアクセス権を指定する。
pSid : [int] 新しい ACE がアクセスを許可するユーザー、グループ、またはログオンセッションを識別する SID へのポインタ。
%inst
任意アクセス制御リスト (DACL) の末尾にアクセス許可アクセス制御エントリ (ACE)
を追加する。(AddAccessAllowedAceEx)

[戻り値]
関数が成功した場合、戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼び出す。以下のエラー値が返される可能性がある。
（以下省略）

[備考]
呼び出し側は、ACE を正しい順序で DACL に追加する必要がある。詳細は「Order of ACEs in a
DACL」を参照のこと。


%index
AddAccessAllowedObjectAce
任意アクセス制御リスト (DACL) の末尾にアクセス許可アクセス制御エントリ (ACE) を追加する。(AddAccessAllowedObjectAce)
%group
Win32 advapi32
%prm
pAcl, dwAceRevision, AceFlags, AccessMask, ObjectTypeGuid, InheritedObjectTypeGuid, pSid
pAcl : [var] DACL へのポインタ。AddAccessAllowedObjectAce 関数はこの DACL の末尾にアクセス許可 ACE を追加する。ACE は ACCESS_ALLOWED_OBJECT_ACE 構造体の形式で格納される。
dwAceRevision : [int] 変更する DACL のリビジョンレベルを指定する。この値は ACL_REVISION_DS でなければならない。DACL のリビジョンレベルが ACL_REVISION_DS より低い場合、関数はそれを ACL_REVISION_DS に変更する。
AceFlags : [int] ACE の継承を制御するビットフラグのセット。関数はこれらのフラグを AceFlags メンバに設定する。
AccessMask : [int] ACCESS_MASK 形式のビットフラグのセット。これらのフラグは、新しい ACE が指定した SID に対して許可するアクセス権を指定する。
ObjectTypeGuid : [var] 新しい ACE で保護されるオブジェクト、プロパティセット、またはプロパティの種類を識別する GUID 構造体へのポインタ。このパラメータが NULL の場合、新しい ACE は DACL が割り当てられているオブジェクトを保護する。
InheritedObjectTypeGuid : [var] 新しい ACE を継承できるオブジェクトの種類を識別する GUID 構造体へのポインタ。このパラメータが非 NULL の場合、指定された種類のオブジェクトのみが ACE を継承できる。NULL の場合、任意の種類の子オブジェクトが ACE を継承できる。いずれの場合も、継承は AceFlags パラメータの値と、子オブジェクトに設定された継承防止によっても制御される。
pSid : [int] 新しい ACE がアクセスを許可するユーザー、グループ、またはログオンセッションを識別する SID へのポインタ。
%inst
任意アクセス制御リスト (DACL) の末尾にアクセス許可アクセス制御エントリ (ACE)
を追加する。(AddAccessAllowedObjectAce)

[戻り値]
関数が成功した場合、戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼び出す。以下のエラー値が返される可能性がある。
（以下省略）

[備考]
ObjectTypeGuid と InheritedObjectTypeGuid の両方が NULL
の場合、AddAccessAllowedObjectAce ではなく AddAccessAllowedAceEx
関数を使用する。これは、ACCESS_ALLOWED_ACE が ACCESS_ALLOWED_OBJECT_ACE
より小さく効率的であるためである。呼び出し側は、ACE を正しい順序で DACL に追加する必要がある。詳細は「Order of ACEs
in a DACL」を参照のこと。


%index
AddAccessDeniedAce
アクセス制御リスト (ACL) にアクセス拒否アクセス制御エントリ (ACE) を追加する。アクセスは指定したセキュリティ識別子 (SID) に対して拒否される。
%group
Win32 advapi32
%prm
pAcl, dwAceRevision, AccessMask, pSid
pAcl : [var] ACL へのポインタ。本関数はこの ACL の末尾にアクセス拒否 ACE を追加する。ACE は ACCESS_DENIED_ACE 構造体の形式で格納される。
dwAceRevision : [int] 変更する ACL のリビジョンレベルを指定する。
AccessMask : [int] 指定した SID に対して拒否するアクセス権のマスクを指定する。
pSid : [int] アクセスを拒否されるユーザー、グループ、またはログオンアカウントを表す SID 構造体へのポインタ。
%inst
アクセス制御リスト (ACL) にアクセス拒否アクセス制御エントリ (ACE) を追加する。アクセスは指定したセキュリティ識別子
(SID) に対して拒否される。

[戻り値]
関数が成功した場合、戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼び出す。以下のエラー値が返される可能性がある。
（以下省略）

[備考]
AddAccessAllowedAce および AddAccessDeniedAce 関数は、ACL の ACE リストの末尾に新しい
ACE を追加する。これらの関数は、新しい ACE を正しい正規順序に自動的には配置しない。正しい順序で ACE を追加し、ACL
が正規順序になるようにするのは呼び出し側の責任である。AddAccessDeniedAce 関数が ACE に配置する
ACE_HEADER 構造体は、種類とサイズを指定するが、ACE フラグは設定しない。AddAccessDeniedAce で追加される
ACE は継承不可である。


%index
AddAccessDeniedAceEx
任意アクセス制御リスト (DACL) の末尾にアクセス拒否アクセス制御エントリ (ACE) を追加する。
%group
Win32 advapi32
%prm
pAcl, dwAceRevision, AceFlags, AccessMask, pSid
pAcl : [var] DACL へのポインタ。AddAccessDeniedAceEx 関数はこの DACL の末尾にアクセス拒否 ACE を追加する。ACE は ACCESS_DENIED_ACE 構造体の形式で格納される。
dwAceRevision : [int] 変更する DACL のリビジョンレベルを指定する。この値には ACL_REVISION または ACL_REVISION_DS を指定できる。DACL にオブジェクト固有の ACE が含まれる場合は ACL_REVISION_DS を使用する。
AceFlags : [int] ACE の継承を制御するビットフラグのセット。関数はこれらのフラグを AceFlags メンバに設定する。
AccessMask : [int] ACCESS_MASK 形式のビットフラグのセット。新しい ACE が指定した SID に対して拒否するアクセス権を指定する。
pSid : [int] 新しい ACE がアクセスを拒否するユーザー、グループ、またはログオンセッションを識別する SID へのポインタ。
%inst
任意アクセス制御リスト (DACL) の末尾にアクセス拒否アクセス制御エントリ (ACE) を追加する。

[戻り値]
関数が成功した場合、戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼び出す。以下のエラー値が返される可能性がある。
（以下省略）

[備考]
AddAccessDeniedAceEx 関数は新しい ACE を DACL の末尾に追加するが、アクセス拒否 ACE は DACL
の先頭に配置されるべきである。呼び出し側は、ACE を正しい順序で DACL に追加する必要がある。詳細は「Order of ACEs
in a DACL」を参照のこと。


%index
AddAccessDeniedObjectAce
任意アクセス制御リスト (DACL) の末尾にアクセス拒否アクセス制御エントリ (ACE) を追加する。新しい ACE は、オブジェクト、またはオブジェクト上のプロパティセットやプロパティへのアクセスを拒否できる。
%group
Win32 advapi32
%prm
pAcl, dwAceRevision, AceFlags, AccessMask, ObjectTypeGuid, InheritedObjectTypeGuid, pSid
pAcl : [var] DACL へのポインタ。AddAccessDeniedObjectAce 関数はこの DACL の末尾にアクセス拒否 ACE を追加する。ACE は ACCESS_DENIED_OBJECT_ACE 構造体の形式で格納される。
dwAceRevision : [int] 変更する DACL のリビジョンレベルを指定する。この値は ACL_REVISION_DS でなければならない。DACL のリビジョンレベルが ACL_REVISION_DS より低い場合、関数はそれを ACL_REVISION_DS に変更する。
AceFlags : [int] ACE の継承を制御するビットフラグのセット。関数はこれらのフラグを AceFlags メンバに設定する。
AccessMask : [int] ACCESS_MASK 形式のビットフラグのセット。新しい ACE が指定した SID に対して拒否するアクセス権を指定する。
ObjectTypeGuid : [var] 新しい ACE で保護されるオブジェクト、プロパティセット、またはプロパティの種類を識別する GUID 構造体へのポインタ。このパラメータが NULL の場合、新しい ACE は ACL が割り当てられているオブジェクトを保護する。
InheritedObjectTypeGuid : [var] 新しい ACE を継承できるオブジェクトの種類を識別する GUID 構造体へのポインタ。このパラメータが非 NULL の場合、指定された種類のオブジェクトのみが ACE を継承できる。NULL の場合、任意の種類の子オブジェクトが ACE を継承できる。いずれの場合も、継承は AceFlags パラメータの値と、子オブジェクトに設定された継承防止によっても制御される。
pSid : [int] 新しい ACE がアクセスを許可するユーザー、グループ、またはログオンセッションを識別する SID へのポインタ。
%inst
任意アクセス制御リスト (DACL) の末尾にアクセス拒否アクセス制御エントリ (ACE) を追加する。新しい ACE
は、オブジェクト、またはオブジェクト上のプロパティセットやプロパティへのアクセスを拒否できる。

[戻り値]
関数が成功した場合、戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼び出す。以下のエラー値が返される可能性がある。
（以下省略）

[備考]
ObjectTypeGuid と InheritedObjectTypeGuid の両方が NULL
の場合、AddAccessDeniedObjectAce ではなく AddAccessDeniedAceEx
関数を使用する。これは、ACCESS_DENIED_ACE が ACCESS_DENIED_OBJECT_ACE
より小さく効率的であるためである。AddAccessDeniedObjectAce 関数は新しい ACE を ACL
の末尾に追加するが、アクセス拒否 ACE は ACL の先頭に配置されるべきである。呼び出し側は、ACE を正しい順序で DACL
に追加する必要がある。詳細は「Order of ACEs in a DACL」を参照のこと。


%index
AddAce
指定したアクセス制御リスト (ACL) に 1 つ以上のアクセス制御エントリ (ACE) を追加する。
%group
Win32 advapi32
%prm
pAcl, dwAceRevision, dwStartingAceIndex, pAceList, nAceListLength
pAcl : [var] ACL へのポインタ。本関数はこの ACL に ACE を追加する。
dwAceRevision : [int] 変更する ACL のリビジョンレベルを指定する。
dwStartingAceIndex : [int] 新しい ACE を追加する、ACL の ACE リスト内の位置を指定する。0 を指定するとリストの先頭に挿入され、MAXDWORD を指定するとリストの末尾に追加される。
pAceList : [intptr] 指定した ACL に追加する 1 つ以上の ACE のリストへのポインタ。リスト内の ACE は連続して格納されている必要がある。
nAceListLength : [int] pAceList パラメータが指す入力バッファのサイズ（バイト単位）。
%inst
指定したアクセス制御リスト (ACL) に 1 つ以上のアクセス制御エントリ (ACE) を追加する。

[戻り値]
関数が成功した場合、戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼び出す。以下のエラー値が返される可能性がある。
（以下省略）

[備考]
アプリケーションは、ACL を操作する目的で AddAce 関数を使用する際に、FindFirstFreeAce および GetAce
関数をよく併用する。また、GetAclInformation 関数で取得できる ACL_SIZE_INFORMATION
構造体には、ACL のサイズと含まれる ACE の数が格納されている。


%index
AddAuditAccessAce
システムアクセス制御リスト (ACL) にシステム監査アクセス制御エントリ (ACE) を追加する。指定したセキュリティ識別子 (SID) のアクセスが監査される。
%group
Win32 advapi32
%prm
pAcl, dwAceRevision, dwAccessMask, pSid, bAuditSuccess, bAuditFailure
pAcl : [var] ACL へのポインタ。本関数はこの ACL にシステム監査 ACE を追加する。ACE は SYSTEM_AUDIT_ACE 構造体の形式で格納される。
dwAceRevision : [int] 変更する ACL のリビジョンレベルを指定する。
dwAccessMask : [int] 指定した SID について監査するアクセス権のマスクを指定する。
pSid : [int] アクセスが監査されるプロセスを表す SID へのポインタ。
bAuditSuccess : [int] 成功したアクセス試行を監査するかどうかを指定する。監査を有効にするにはこのフラグを TRUE に、そうでなければ FALSE に設定する。
bAuditFailure : [int] 失敗したアクセス試行を監査するかどうかを指定する。監査を有効にするにはこのフラグを TRUE に、そうでなければ FALSE に設定する。
%inst
システムアクセス制御リスト (ACL) にシステム監査アクセス制御エントリ (ACE) を追加する。指定したセキュリティ識別子 (SID)
のアクセスが監査される。

[戻り値]
関数が成功した場合、戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼び出す。以下のエラー値が返される可能性がある。
（以下省略）

[備考]
AddAuditAccessAce 関数が ACE に配置する ACE_HEADER 構造体は、種類とサイズを指定するが、ACE
フラグは設定しない。


%index
AddAuditAccessAceEx
システムアクセス制御リスト (SACL) の末尾にシステム監査アクセス制御エントリ (ACE) を追加する。(AddAuditAccessAceEx)
%group
Win32 advapi32
%prm
pAcl, dwAceRevision, AceFlags, dwAccessMask, pSid, bAuditSuccess, bAuditFailure
pAcl : [var] SACL へのポインタ。AddAuditAccessAceEx 関数はこの SACL にシステム監査 ACE を追加する。ACE は SYSTEM_AUDIT_ACE 構造体の形式で格納される。
dwAceRevision : [int] 変更する SACL のリビジョンレベルを指定する。この値には ACL_REVISION または ACL_REVISION_DS を指定できる。SACL にオブジェクト固有の ACE が含まれる場合は ACL_REVISION_DS を使用する。
AceFlags : [int] 
dwAccessMask : [int] ACCESS_MASK 形式のビットフラグのセット。新しい ACE が指定した SID について監査するアクセス権を指定する。
pSid : [int] 新しい ACE がアクセスを監査するユーザー、グループ、またはログオンセッションを識別する SID へのポインタ。
bAuditSuccess : [int] 指定したアクセス権の使用成功時に、システムがセキュリティイベントログに監査レコードを生成するかどうかを指定する。このフラグが TRUE の場合、または AceFlags パラメータで SUCCESSFUL_ACCESS_ACE_FLAG フラグを指定した場合、システムは成功したアクセス試行を記録する。そうでなければ記録しない。
bAuditFailure : [int] 指定したアクセス権の使用失敗時に、システムがセキュリティイベントログに監査レコードを生成するかどうかを指定する。このフラグが TRUE の場合、または AceFlags パラメータで FAILED_ACCESS_ACE_FLAG フラグを指定した場合、システムは失敗したアクセス試行を記録する。そうでなければ記録しない。
%inst
システムアクセス制御リスト (SACL) の末尾にシステム監査アクセス制御エントリ (ACE)
を追加する。(AddAuditAccessAceEx)

[戻り値]
関数が成功した場合、戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼び出す。以下のエラー値が返される可能性がある。
（以下省略）


%index
AddAuditAccessObjectAce
システムアクセス制御リスト (SACL) の末尾にシステム監査アクセス制御エントリ (ACE) を追加する。(AddAuditAccessObjectAce)
%group
Win32 advapi32
%prm
pAcl, dwAceRevision, AceFlags, AccessMask, ObjectTypeGuid, InheritedObjectTypeGuid, pSid, bAuditSuccess, bAuditFailure
pAcl : [var] SACL へのポインタ。AddAuditAccessObjectAce 関数はこの SACL の末尾にシステム監査 ACE を追加する。ACE は SYSTEM_AUDIT_OBJECT_ACE 構造体の形式で格納される。
dwAceRevision : [int] 変更する SACL のリビジョンレベルを指定する。この値は ACL_REVISION_DS でなければならない。SACL のリビジョンレベルが ACL_REVISION_DS より低い場合、関数はそれを ACL_REVISION_DS に変更する。
AceFlags : [int] ACE の継承および監査するアクセス試行の種類を制御するビットフラグのセット。関数はこれらのフラグを AceFlags メンバに設定する。
AccessMask : [int] 新しい ACE が指定した SID について監査するアクセス権を指定する ACCESS_MASK。
ObjectTypeGuid : [var] 新しい ACE で保護されるオブジェクト、プロパティセット、またはプロパティの種類を識別する GUID 構造体へのポインタ。このパラメータが NULL の場合、新しい ACE は ACL が割り当てられているオブジェクトを保護する。
InheritedObjectTypeGuid : [var] 新しい ACE を継承できるオブジェクトの種類を識別する GUID 構造体へのポインタ。このパラメータが非 NULL の場合、指定された種類のオブジェクトのみが ACE を継承できる。NULL の場合、任意の種類の子オブジェクトが ACE を継承できる。いずれの場合も、継承は AceFlags パラメータの値と、子オブジェクトに設定された継承防止によっても制御される。
pSid : [int] 新しい ACE がアクセスを監査するユーザー、グループ、またはログオンセッションを識別する SID へのポインタ。
bAuditSuccess : [int] 指定したアクセス権の使用成功時に、システムがセキュリティイベントログに監査レコードを生成するかどうかを指定する。このフラグが TRUE の場合、または AceFlags パラメータで SUCCESSFUL_ACCESS_ACE_FLAG フラグを指定した場合、システムは成功したアクセス試行を記録する。そうでなければ記録しない。
bAuditFailure : [int] 指定したアクセス権の使用失敗時に、システムがセキュリティイベントログに監査レコードを生成するかどうかを指定する。このフラグが TRUE の場合、または AceFlags パラメータで FAILED_ACCESS_ACE_FLAG フラグを指定した場合、システムは失敗したアクセス試行を記録する。そうでなければ記録しない。
%inst
システムアクセス制御リスト (SACL) の末尾にシステム監査アクセス制御エントリ (ACE)
を追加する。(AddAuditAccessObjectAce)

[戻り値]
関数が成功した場合、戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼び出す。以下のエラー値が返される可能性がある。
（以下省略）

[備考]
ObjectTypeGuid と InheritedObjectTypeGuid の両方が NULL
の場合、AddAuditAccessObjectAce ではなく AddAuditAccessAceEx
関数を使用する。これは、SYSTEM_AUDIT_ACE が SYSTEM_AUDIT_OBJECT_ACE
より小さく効率的であるためである。


%index
AddConditionalAce
指定したアクセス制御リスト (ACL) に条件付きアクセス制御エントリ (ACE) を追加する。
%group
Win32 advapi32
%prm
pAcl, dwAceRevision, AceFlags, AceType, AccessMask, pSid, ConditionStr, ReturnLength
pAcl : [var] ACL へのポインタ。本関数はこの ACL に ACE を追加する。このパラメータの値を NULL にすることはできない。
dwAceRevision : [int] 変更する ACL のリビジョンレベルを指定する。この値には ACL_REVISION または ACL_REVISION_DS を指定できる。ACL にオブジェクト固有の ACE が含まれる場合は ACL_REVISION_DS を使用する。
AceFlags : [int] ACE の継承を制御するビットフラグのセット。関数はこれらのフラグを AceFlags メンバに設定する。
AceType : [int] ACE の種類。
AccessMask : [int] 指定した SID に許可するアクセス権のマスクを指定する。
pSid : [int] アクセスを許可するユーザー、グループ、またはログオンアカウントを表す SID へのポインタ。
ConditionStr : [wstr] ACE について評価する条件式を指定する文字列。
ReturnLength : [var] ACL のサイズ（バイト単位）。pACL パラメータで指定したバッファが十分なサイズでない場合、このパラメータの値は必要なサイズとなる。
%inst
指定したアクセス制御リスト (ACL) に条件付きアクセス制御エントリ (ACE) を追加する。

[戻り値]
関数が成功した場合、TRUE を返す。関数が失敗した場合、FALSE を返す。拡張エラー情報を取得するには GetLastError
を呼び出す。以下のエラー値が返される可能性がある。
（以下省略）


%index
AddUsersToEncryptedFile
指定した暗号化ファイルにユーザーキーを追加する。
%group
Win32 advapi32
%prm
lpFileName, pEncryptionCertificates
lpFileName : [wstr] 暗号化ファイルの名前。
pEncryptionCertificates : [var] ファイルに追加する新しいユーザーキーの一覧を含む ENCRYPTION_CERTIFICATE_LIST 構造体へのポインタ。
%inst
指定した暗号化ファイルにユーザーキーを追加する。

[戻り値]
関数が成功した場合、戻り値は ERROR_SUCCESS
となる。関数が失敗した場合、戻り値はシステムエラーコードとなる。エラーコードの完全な一覧については、システムエラーコードまたはヘッダファイル
WinError.h を参照のこと。

[備考]
Windows 8 および Windows Server 2012 以降では、本関数は以下の技術によってサポートされる。
（以下省略）


%index
AdjustTokenGroups
指定したアクセストークンに既に存在するグループを有効化または無効化する。アクセストークン内のグループを有効化または無効化するには TOKEN_ADJUST_GROUPS へのアクセスが必要である。
%group
Win32 advapi32
%prm
TokenHandle, ResetToDefault, NewState, BufferLength, PreviousState, ReturnLength
TokenHandle : [intptr] 有効化または無効化するグループを含むアクセストークンへのハンドル。ハンドルはトークンに対する TOKEN_ADJUST_GROUPS アクセス権を持っている必要がある。PreviousState パラメータが NULL でない場合、ハンドルは TOKEN_QUERY アクセス権も持っている必要がある。
ResetToDefault : [int] グループを既定の有効/無効状態に設定するかどうかを示すブール値。この値が TRUE の場合、グループは既定状態に設定され NewState パラメータは無視される。FALSE の場合、グループは NewState パラメータが指す情報に従って設定される。
NewState : [var] 有効化または無効化するグループを含む TOKEN_GROUPS 構造体へのポインタ。ResetToDefault パラメータが FALSE の場合、関数は TOKEN_GROUPS 構造体内の各グループの SE_GROUP_ENABLED 属性の値に従って各グループを設定する。ResetToDefault が TRUE の場合、このパラメータは無視される。
BufferLength : [int] PreviousState パラメータが指すバッファのサイズ（バイト単位）。PreviousState パラメータが NULL の場合、このパラメータは 0 にできる。
PreviousState : [var] 関数が変更するグループの以前の状態を格納する TOKEN_GROUPS 構造体を受け取るバッファへのポインタ。すなわち、本関数によって変更されたグループがあれば、そのグループと以前の状態が PreviousState で参照される TOKEN_GROUPS 構造体に格納される。TOKEN_GROUPS の GroupCount メンバが 0 の場合、本関数によって変更されたグループはない。このパラメータは NULL にできる。
ReturnLength : [var] PreviousState パラメータが指すバッファに必要な実際のバイト数を受け取る変数へのポインタ。このパラメータは NULL にでき、PreviousState が NULL の場合は無視される。
%inst
指定したアクセストークンに既に存在するグループを有効化または無効化する。アクセストークン内のグループを有効化または無効化するには
TOKEN_ADJUST_GROUPS へのアクセスが必要である。

[戻り値]
関数が成功した場合、戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼び出す。

[備考]
PreviousState パラメータで取得される情報は TOKEN_GROUPS
構造体の形式となる。つまり、バッファへのポインタを後続の AdjustTokenGroups 関数呼び出しの NewState
パラメータとして渡すことで、グループの元の状態を復元できる。NewState
パラメータには、アクセストークンに存在しない変更対象グループを列挙してもかまわない。これはトークン内のグループの変更成功には影響しない。AdjustTokenGroups
関数は、TOKEN_GROUPS 構造体内の SE_GROUP_MANDATORY 属性を持つグループを無効化できない。その場合は
CreateRestrictedToken を使用する。SE_GROUP_USE_FOR_DENY_ONLY
属性を持つグループは有効化できない。


%index
AdjustTokenPrivileges
指定したアクセストークンの特権を有効化または無効化する。アクセストークンの特権を有効化または無効化するには TOKEN_ADJUST_PRIVILEGES アクセスが必要である。
%group
Win32 advapi32
%prm
TokenHandle, DisableAllPrivileges, NewState, BufferLength, PreviousState, ReturnLength
TokenHandle : [intptr] 変更する特権を含むアクセストークンへのハンドル。ハンドルはトークンに対する TOKEN_ADJUST_PRIVILEGES アクセス権を持っている必要がある。PreviousState パラメータが NULL でない場合、ハンドルは TOKEN_QUERY アクセス権も持っている必要がある。
DisableAllPrivileges : [int] 関数がトークンのすべての特権を無効化するかどうかを指定する。この値が TRUE の場合、関数はすべての特権を無効化し NewState パラメータを無視する。FALSE の場合、関数は NewState パラメータが指す情報に基づいて特権を変更する。
NewState : [var] 特権とその属性の配列を指定する TOKEN_PRIVILEGES 構造体へのポインタ。DisableAllPrivileges パラメータが FALSE の場合、AdjustTokenPrivileges 関数はトークンに対してこれらの特権を有効化・無効化・削除する。AdjustTokenPrivileges 関数が特権属性に基づいて取る動作を次の表に示す。
BufferLength : [int] PreviousState パラメータが指すバッファのサイズ（バイト単位）を指定する。PreviousState パラメータが NULL の場合、このパラメータは 0 にできる。
PreviousState : [var] 関数が変更する特権の以前の状態を格納する TOKEN_PRIVILEGES 構造体で満たされるバッファへのポインタ。すなわち、本関数によって変更された特権があれば、その特権と以前の状態が PreviousState で参照される TOKEN_PRIVILEGES 構造体に格納される。TOKEN_PRIVILEGES の PrivilegeCount メンバが 0 の場合、本関数によって変更された特権はない。このパラメータは NULL にできる。
ReturnLength : [var] PreviousState パラメータが指すバッファに必要なサイズ（バイト単位）を受け取る変数へのポインタ。PreviousState が NULL の場合、このパラメータは NULL にできる。
%inst
指定したアクセストークンの特権を有効化または無効化する。アクセストークンの特権を有効化または無効化するには
TOKEN_ADJUST_PRIVILEGES アクセスが必要である。

[戻り値]
関数が成功した場合、戻り値は 0
以外となる。関数が指定されたすべての特権を調整したかどうかを判断するには、関数が成功したときに以下のいずれかの値を返す
GetLastError を呼び出す。
（以下省略）

[備考]
AdjustTokenPrivileges
関数はアクセストークンに新しい特権を追加できない。トークンの既存の特権を有効化または無効化できるだけである。トークンの特権を調べるには
GetTokenInformation 関数を呼び出す。NewState
パラメータには、トークンが持っていない特権を指定しても関数は失敗しない。この場合、関数はトークンが持つ特権を調整し、それ以外の特権は無視するため、関数は成功する。関数が指定されたすべての特権を調整したかどうかを判断するには、GetLastError
関数を呼び出す。PreviousState パラメータは調整された特権を示す。PreviousState
パラメータは、調整された特権の元の状態を含む TOKEN_PRIVILEGES 構造体を取得する。元の状態を復元するには、後続の
AdjustTokenPrivileges 関数呼び出しの NewState パラメータとして PreviousState
ポインタを渡す。


%index
AllocateAndInitializeSid
最大 8 個のサブオーソリティを持つセキュリティ識別子 (SID) を割り当て、初期化する。
%group
Win32 advapi32
%prm
pIdentifierAuthority, nSubAuthorityCount, nSubAuthority0, nSubAuthority1, nSubAuthority2, nSubAuthority3, nSubAuthority4, nSubAuthority5, nSubAuthority6, nSubAuthority7, pSid
pIdentifierAuthority : [var] SID_IDENTIFIER_AUTHORITY 構造体へのポインタ。この構造体は SID に設定する最上位の識別子オーソリティ値を提供する。
nSubAuthorityCount : [int] SID に格納するサブオーソリティの数を指定する。このパラメータは、意味のある値を持つサブオーソリティパラメータの数も示す。このパラメータには 1 から 8 までの値を指定する必要がある。
nSubAuthority0 : [int] SID に格納するサブオーソリティ値。
nSubAuthority1 : [int] SID に格納するサブオーソリティ値。
nSubAuthority2 : [int] SID に格納するサブオーソリティ値。
nSubAuthority3 : [int] SID に格納するサブオーソリティ値。
nSubAuthority4 : [int] SID に格納するサブオーソリティ値。
nSubAuthority5 : [int] SID に格納するサブオーソリティ値。
nSubAuthority6 : [int] SID に格納するサブオーソリティ値。
nSubAuthority7 : [int] SID に格納するサブオーソリティ値。
pSid : [var] 割り当てられ初期化された SID 構造体へのポインタを受け取る変数へのポインタ。
%inst
最大 8 個のサブオーソリティを持つセキュリティ識別子 (SID) を割り当て、初期化する。

[戻り値]
関数が成功した場合、戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼び出す。

[備考]
AllocateAndInitializeSid 関数で割り当てた SID は、FreeSid 関数を使って解放する必要がある。この関数は
32 ビット RID 値を持つ SID を作成する。より長い RID 値が必要なアプリケーションでは CreateWellKnownSid
を使用する。


%index
AllocateLocallyUniqueId
ローカルで一意な識別子 (LUID) を割り当てる。
%group
Win32 advapi32
%prm
Luid
Luid : [var] 割り当てられた LUID を受け取る LUID 構造体へのポインタ。
%inst
ローカルで一意な識別子 (LUID) を割り当てる。

[戻り値]
関数が成功した場合、戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼び出す。

[備考]
割り当てられる LUID
はローカルシステムに対してのみ一意であり、一意性はシステムが次に再起動されるまでしか保証されない。本関数が成功した場合、割り当てられる
LUID は必ず 0 以外であることが保証される。


%index
AreAllAccessesGranted
要求された一連のアクセス権が許可されたかどうかをチェックする。アクセス権はアクセスマスク内のビットフラグとして表される。
%group
Win32 advapi32
%prm
GrantedAccess, DesiredAccess
GrantedAccess : [int] 許可されたアクセス権を指定するアクセスマスク。
DesiredAccess : [int] 要求されたアクセス権を指定するアクセスマスク。このマスクは通常 MapGenericMask 関数を呼び出すことで、汎用アクセス権から特定アクセス権および標準アクセス権にマッピング済みでなければならない。
%inst
要求された一連のアクセス権が許可されたかどうかをチェックする。アクセス権はアクセスマスク内のビットフラグとして表される。

[戻り値]
要求されたすべてのアクセス権が許可された場合、戻り値は 0 以外となる。要求されたアクセス権の一部でも許可されていない場合、戻り値は 0
となる。

[備考]
AreAllAccessesGranted
関数は、サーバアプリケーションがオブジェクトへのアクセスを試みるクライアントのアクセス権をチェックする際によく使用される。DesiredAccess
パラメータに設定されたビットが GrantedAccess
パラメータに設定されたビットと一致する場合、要求されたすべての権限が許可されたことになる。


%index
AreAnyAccessesGranted
要求された一連のアクセス権のいずれかが許可されたかどうかをテストする。アクセス権はアクセスマスク内のビットフラグとして表される。
%group
Win32 advapi32
%prm
GrantedAccess, DesiredAccess
GrantedAccess : [int] 許可されたアクセスマスクを指定する。
DesiredAccess : [int] 要求されるアクセスマスクを指定する。このマスクは通常 MapGenericMask 関数を呼び出すことで、汎用アクセス権から特定アクセス権および標準アクセス権にマッピング済みでなければならない。
%inst
要求された一連のアクセス権のいずれかが許可されたかどうかをテストする。アクセス権はアクセスマスク内のビットフラグとして表される。

[戻り値]
要求されたアクセス権のいずれかが許可された場合、戻り値は 0 以外となる。要求されたアクセス権がいずれも許可されていない場合、戻り値は 0
となる。

[備考]
AreAnyAccessesGranted
関数は、サーバアプリケーションがオブジェクトへのアクセスを試みるクライアントのアクセス権をチェックする際によく使用される。DesiredAccess
パラメータに設定されたビットのいずれかが GrantedAccess
パラメータに設定されたビットと一致する場合、要求されたアクセス権のうち少なくとも 1 つが許可されたことになる。


%index
AuditComputeEffectivePolicyBySid
指定したセキュリティプリンシパルに対する 1 つ以上のサブカテゴリの実効監査ポリシーを計算する。本関数は、システム監査ポリシーとユーザー単位ポリシーを組み合わせることで実効監査ポリシーを計算する。
%group
Win32 advapi32
%prm
pSid, pSubCategoryGuids, dwPolicyCount, ppAuditPolicy
pSid : [int] 実効監査ポリシーを計算するプリンシパルに関連付けられた SID 構造体へのポインタ。グループ SID に対するユーザー単位ポリシーは現在サポートされていない。
pSubCategoryGuids : [var] 実効監査ポリシーを計算するサブカテゴリを指定する GUID 値の配列へのポインタ。定義されているサブカテゴリの一覧については、監査定数を参照のこと。
dwPolicyCount : [int] pSubCategoryGuids および ppAuditPolicy 配列それぞれの要素数。
ppAuditPolicy : [var] AUDIT_POLICY_INFORMATION 構造体へのポインタの配列と、それらの構造体自体の両方を含む単一のバッファへのポインタ。AUDIT_POLICY_INFORMATION 構造体は、pSubCategoryGuids 配列で指定されたサブカテゴリに対する実効監査ポリシーを表す。このバッファの使用を終えたら AuditFree 関数を呼び出して解放する。
%inst
指定したセキュリティプリンシパルに対する 1
つ以上のサブカテゴリの実効監査ポリシーを計算する。本関数は、システム監査ポリシーとユーザー単位ポリシーを組み合わせることで実効監査ポリシーを計算する。

[戻り値]
関数が成功した場合、TRUE を返す。関数が失敗した場合、FALSE を返す。拡張エラー情報を取得するには GetLastError
を呼び出す。GetLastError は WinError.h で定義されている以下のエラーコードのいずれかを返す場合がある。
（以下省略）

[備考]
本関数を正常に呼び出すには、呼び出し元が SeSecurityPrivilege を持っているか、Audit
セキュリティオブジェクトに対する AUDIT_QUERY_SYSTEM_POLICY および
AUDIT_QUERY_USER_POLICY アクセスを持っている必要がある。


%index
AuditComputeEffectivePolicyByToken
指定したトークンに関連付けられたセキュリティプリンシパルに対する 1 つ以上のサブカテゴリの実効監査ポリシーを計算する。本関数は、システム監査ポリシーとユーザー単位ポリシーを組み合わせることで実効監査ポリシーを計算する。
%group
Win32 advapi32
%prm
hTokenHandle, pSubCategoryGuids, dwPolicyCount, ppAuditPolicy
hTokenHandle : [intptr] 実効監査ポリシーを計算するプリンシパルに関連付けられたアクセストークンへのハンドル。トークンは TOKEN_QUERY アクセス権で開かれている必要がある。グループ SID に対するユーザー単位ポリシーは現在サポートされていない。
pSubCategoryGuids : [var] 実効監査ポリシーを計算するサブカテゴリを指定する GUID 値の配列へのポインタ。定義されているサブカテゴリの一覧については、監査定数を参照のこと。
dwPolicyCount : [int] pSubCategoryGuids および ppAuditPolicy 配列それぞれの要素数。
ppAuditPolicy : [var] AUDIT_POLICY_INFORMATION 構造体へのポインタの配列と、それらの構造体自体の両方を含む単一のバッファへのポインタ。AUDIT_POLICY_INFORMATION 構造体は、pSubCategoryGuids 配列で指定されたサブカテゴリに対する実効監査ポリシーを表す。このバッファの使用を終えたら AuditFree 関数を呼び出して解放する。
%inst
指定したトークンに関連付けられたセキュリティプリンシパルに対する 1
つ以上のサブカテゴリの実効監査ポリシーを計算する。本関数は、システム監査ポリシーとユーザー単位ポリシーを組み合わせることで実効監査ポリシーを計算する。

[戻り値]
関数が成功した場合、TRUE を返す。関数が失敗した場合、FALSE を返す。拡張エラー情報を取得するには GetLastError
を呼び出す。GetLastError は WinError.h で定義されている以下のエラーコードのいずれかを返す場合がある。
（以下省略）

[備考]
本関数を正常に呼び出すには、呼び出し元が SeSecurityPrivilege を持っているか、Audit
セキュリティオブジェクトに対する AUDIT_QUERY_SYSTEM_POLICY および
AUDIT_QUERY_USER_POLICY アクセスの両方を持っている必要がある。


%index
AuditEnumerateCategories
利用可能な監査ポリシーカテゴリを列挙する。
%group
Win32 advapi32
%prm
ppAuditCategoriesArray, pdwCountReturned
ppAuditCategoriesArray : [var] GUID 構造体へのポインタの配列と、それらの構造体自体の両方を含む単一のバッファへのポインタ。GUID 構造体は、コンピュータで利用可能な監査ポリシーカテゴリを表す。このバッファの使用を終えたら AuditFree 関数を呼び出して解放する。
pdwCountReturned : [var] ppAuditCategoriesArray 配列の要素数へのポインタ。
%inst
利用可能な監査ポリシーカテゴリを列挙する。

[戻り値]
関数が成功した場合、TRUE を返す。関数が失敗した場合、FALSE を返す。拡張エラー情報を取得するには GetLastError
を呼び出す。


%index
AuditEnumeratePerUserPolicy
ユーザー単位の監査ポリシーが指定されているユーザーを列挙する。
%group
Win32 advapi32
%prm
ppAuditSidArray
ppAuditSidArray : [var] POLICY_AUDIT_SID_ARRAY 構造体へのポインタの配列と、それらの構造体自体の両方を含む単一のバッファへのポインタ。POLICY_AUDIT_SID_ARRAY 構造体は、ユーザー単位の監査ポリシーが指定されているユーザーを表す。このバッファの使用を終えたら AuditFree 関数を呼び出して解放する。
%inst
ユーザー単位の監査ポリシーが指定されているユーザーを列挙する。

[戻り値]
関数が成功した場合、TRUE を返す。関数が失敗した場合、FALSE を返す。拡張エラー情報を取得するには GetLastError
を呼び出す。GetLastError は WinError.h で定義されている以下のエラーコードのいずれかを返す場合がある。
（以下省略）

[備考]
本関数を正常に呼び出すには、呼び出し元が SeSecurityPrivilege を持っているか、Audit
セキュリティオブジェクトに対する AUDIT_ENUMERATE_USERS アクセスを持っている必要がある。


%index
AuditEnumerateSubCategories
利用可能な監査ポリシーサブカテゴリを列挙する。
%group
Win32 advapi32
%prm
pAuditCategoryGuid, bRetrieveAllSubCategories, ppAuditSubCategoriesArray, pdwCountReturned
pAuditCategoryGuid : [var] サブカテゴリを列挙する監査ポリシーカテゴリの GUID。bRetrieveAllSubCategories パラメータの値が TRUE の場合、このパラメータは無視される。
bRetrieveAllSubCategories : [int] すべての監査ポリシーサブカテゴリを列挙する場合は TRUE、pAuditCategoryGuid パラメータで指定した監査ポリシーカテゴリのサブカテゴリのみを列挙する場合は FALSE。
ppAuditSubCategoriesArray : [var] GUID 構造体へのポインタの配列と、それらの構造体自体の両方を含む単一のバッファへのポインタ。GUID 構造体は、コンピュータで利用可能な監査ポリシーサブカテゴリを表す。このバッファの使用を終えたら AuditFree 関数を呼び出して解放する。
pdwCountReturned : [var] ppAuditSubCategoriesArray 配列で返される監査ポリシーサブカテゴリの数へのポインタ。
%inst
利用可能な監査ポリシーサブカテゴリを列挙する。

[戻り値]
関数が成功した場合、TRUE を返す。関数が失敗した場合、FALSE を返す。拡張エラー情報を取得するには GetLastError
を呼び出す。


%index
AuditFree
監査関数が指定したバッファに対して確保したメモリを解放する。
%group
Win32 advapi32
%prm
Buffer
Buffer : [intptr] 解放するバッファへのポインタ。
%inst
監査関数が指定したバッファに対して確保したメモリを解放する。


%index
AuditLookupCategoryGuidFromCategoryId
指定した監査ポリシーカテゴリを表す GUID 構造体を取得する。
%group
Win32 advapi32
%prm
AuditCategoryId, pAuditCategoryGuid
AuditCategoryId : [int] 監査ポリシーカテゴリを指定する POLICY_AUDIT_EVENT_TYPE 列挙型の要素。
pAuditCategoryGuid : [var] AuditCategoryId で指定した監査ポリシーカテゴリを表す GUID 構造体へのポインタ。
%inst
指定した監査ポリシーカテゴリを表す GUID 構造体を取得する。

[戻り値]
関数が成功した場合、TRUE を返す。関数が失敗した場合、FALSE を返す。拡張エラー情報を取得するには GetLastError
を呼び出す。


%index
AuditLookupCategoryIdFromCategoryGuid
指定した監査ポリシーカテゴリを表す POLICY_AUDIT_EVENT_TYPE 列挙型の要素を取得する。
%group
Win32 advapi32
%prm
pAuditCategoryGuid, pAuditCategoryId
pAuditCategoryGuid : [var] 監査ポリシーカテゴリを指定する GUID 構造体へのポインタ。
pAuditCategoryId : [var] pAuditCategoryGuid パラメータで指定した監査ポリシーカテゴリを表す POLICY_AUDIT_EVENT_TYPE 列挙型の要素へのポインタ。
%inst
指定した監査ポリシーカテゴリを表す POLICY_AUDIT_EVENT_TYPE 列挙型の要素を取得する。

[戻り値]
関数が成功した場合、TRUE を返す。関数が失敗した場合、FALSE を返す。拡張エラー情報を取得するには GetLastError
を呼び出す。


%index
AuditLookupCategoryNameW
指定した監査ポリシーカテゴリの表示名を取得する。(Unicode)
%group
Win32 advapi32
%prm
pAuditCategoryGuid, ppszCategoryName
pAuditCategoryGuid : [var] 監査ポリシーカテゴリを指定する GUID 構造体へのポインタ。
ppszCategoryName : [var] pAuditCategoryGuid 関数で指定した監査ポリシーカテゴリの表示名を含む null 終端文字列へのポインタのアドレス。この文字列の使用を終えたら AuditFree 関数を呼び出して解放する。
%inst
指定した監査ポリシーカテゴリの表示名を取得する。(Unicode)

[戻り値]
関数が成功した場合、TRUE を返す。関数が失敗した場合、FALSE を返す。拡張エラー情報を取得するには GetLastError
を呼び出す。

[備考]
> [!NOTE] > ntsecapi.h ヘッダは、AuditLookupCategoryName を UNICODE
プリプロセッサ定数の定義に基づいて ANSI 版または Unicode
版を自動選択するエイリアスとして定義している。エンコーディング中立のエイリアスとエンコーディング中立でないコードを混在させると、コンパイルエラーや実行時エラーを引き起こす不一致が生じる可能性がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照のこと。


%index
AuditLookupSubCategoryNameW
指定した監査ポリシーサブカテゴリの表示名を取得する。(Unicode)
%group
Win32 advapi32
%prm
pAuditSubCategoryGuid, ppszSubCategoryName
pAuditSubCategoryGuid : [var] 監査ポリシーサブカテゴリを指定する GUID 構造体へのポインタ。
ppszSubCategoryName : [var] pAuditSubCategoryGuid パラメータで指定した監査ポリシーサブカテゴリの表示名を含む null 終端文字列へのポインタのアドレス。この文字列の使用を終えたら AuditFree 関数を呼び出して解放する。
%inst
指定した監査ポリシーサブカテゴリの表示名を取得する。(Unicode)

[戻り値]
関数が成功した場合、TRUE を返す。関数が失敗した場合、FALSE を返す。拡張エラー情報を取得するには GetLastError
を呼び出す。

[備考]
> [!NOTE] > ntsecapi.h ヘッダは、AuditLookupSubCategoryName を UNICODE
プリプロセッサ定数の定義に基づいて ANSI 版または Unicode
版を自動選択するエイリアスとして定義している。エンコーディング中立のエイリアスとエンコーディング中立でないコードを混在させると、コンパイルエラーや実行時エラーを引き起こす不一致が生じる可能性がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照のこと。


%index
AuditQueryGlobalSaclW
監査メッセージへのアクセスを委任するグローバルシステムアクセス制御リスト (SACL) を取得する。(Unicode)
%group
Win32 advapi32
%prm
ObjectTypeName, Acl
ObjectTypeName : [wstr] アクセスされるオブジェクトの種類を指定する null 終端文字列へのポインタ。このパラメータは、対象がファイルかレジストリかに応じて "File" または "Key" のいずれかでなければならない。この文字列は関数が生成する監査メッセージに表示される。
Acl : [var] SACL 情報を含む ACL 構造体へのポインタ。後で LocalFree 関数を呼び出して解放すること。
%inst
監査メッセージへのアクセスを委任するグローバルシステムアクセス制御リスト (SACL) を取得する。(Unicode)

[戻り値]
関数が成功した場合、TRUE を返す。関数が失敗した場合、FALSE を返す。拡張エラー情報を取得するには GetLastError
を呼び出す。GetLastError は WinError.h で定義されている以下のエラーコードのいずれかを返す場合がある。
（以下省略）

[備考]
本関数を正常に呼び出すには、呼び出し元が SeSecurityPrivilege を持っている必要がある。
> [!NOTE] > ntsecapi.h ヘッダは、AuditQueryGlobalSacl を UNICODE
プリプロセッサ定数の定義に基づいて ANSI 版または Unicode
版を自動選択するエイリアスとして定義している。エンコーディング中立のエイリアスとエンコーディング中立でないコードを混在させると、コンパイルエラーや実行時エラーを引き起こす不一致が生じる可能性がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照のこと。


%index
AuditQueryPerUserPolicy
指定したプリンシパルに対する 1 つ以上の監査ポリシーサブカテゴリのユーザー単位監査ポリシーを取得する。
%group
Win32 advapi32
%prm
pSid, pSubCategoryGuids, dwPolicyCount, ppAuditPolicy
pSid : [int] 監査ポリシーを問い合わせるプリンシパルに関連付けられた SID 構造体へのポインタ。グループ SID に対するユーザー単位ポリシーは現在サポートされていない。
pSubCategoryGuids : [var] 監査ポリシーを問い合わせるサブカテゴリを指定する GUID 値の配列へのポインタ。定義されている監査ポリシーサブカテゴリの一覧については、監査定数を参照のこと。
dwPolicyCount : [int] pSubCategoryGuids および ppAuditPolicy 配列それぞれの要素数。
ppAuditPolicy : [var] AUDIT_POLICY_INFORMATION 構造体へのポインタの配列と、それらの構造体自体の両方を含む単一のバッファへのポインタ。AUDIT_POLICY_INFORMATION 構造体は、pSubCategoryGuids 配列で指定されたサブカテゴリに対するユーザー単位監査ポリシーを表す。このバッファの使用を終えたら AuditFree 関数を呼び出して解放する。
%inst
指定したプリンシパルに対する 1 つ以上の監査ポリシーサブカテゴリのユーザー単位監査ポリシーを取得する。

[戻り値]
関数が成功した場合、TRUE を返す。関数が失敗した場合、FALSE を返す。拡張エラー情報を取得するには GetLastError
を呼び出す。GetLastError は WinError.h で定義されている以下のエラーコードのいずれかを返す場合がある。
（以下省略）

[備考]
本関数を正常に呼び出すには、呼び出し元が SeSecurityPrivilege を持っているか、Audit
セキュリティオブジェクトに対する AUDIT_QUERY_USER_POLICY アクセスを持っている必要がある。


%index
AuditQuerySecurity
監査ポリシーへのアクセスを委任するセキュリティ記述子を取得する。
%group
Win32 advapi32
%prm
SecurityInformation, ppSecurityDescriptor
SecurityInformation : [int] 本関数が設定するセキュリティ記述子の部分を指定する SECURITY_INFORMATION 値。SACL_SECURITY_INFORMATION と DACL_SECURITY_INFORMATION のみがサポートされ、それ以外の値は無視される。SACL_SECURITY_INFORMATION も DACL_SECURITY_INFORMATION も指定されていない場合、本関数は失敗し ERROR_INVALID_PARAMETER を返す。
ppSecurityDescriptor : [var] Audit セキュリティオブジェクトへのアクセスを制御する、整形式の SECURITY_DESCRIPTOR 構造体へのポインタのアドレス。
%inst
監査ポリシーへのアクセスを委任するセキュリティ記述子を取得する。

[戻り値]
関数が成功した場合、TRUE を返す。関数が失敗した場合、FALSE を返す。拡張エラー情報を取得するには GetLastError
を呼び出す。GetLastError は WinError.h で定義されている以下のエラーコードのいずれかを返す場合がある。
（以下省略）

[備考]
本関数を正常に呼び出すには、呼び出し元が SeSecurityPrivilege を持っている必要がある。


%index
AuditQuerySystemPolicy
1 つ以上の監査ポリシーサブカテゴリに対するシステム監査ポリシーを取得する。
%group
Win32 advapi32
%prm
pSubCategoryGuids, dwPolicyCount, ppAuditPolicy
pSubCategoryGuids : [var] 監査ポリシーを問い合わせるサブカテゴリを指定する GUID 値の配列へのポインタ。定義されている監査ポリシーサブカテゴリの一覧については、監査定数を参照のこと。
dwPolicyCount : [int] pSubCategoryGuids および ppAuditPolicy 配列それぞれの要素数。
ppAuditPolicy : [var] AUDIT_POLICY_INFORMATION 構造体へのポインタの配列と、それらの構造体自体の両方を含む単一のバッファへのポインタ。AUDIT_POLICY_INFORMATION 構造体は、pSubCategoryGuids 配列で指定されたサブカテゴリに対するシステム監査ポリシーを表す。このバッファの使用を終えたら AuditFree 関数を呼び出して解放する。
%inst
1 つ以上の監査ポリシーサブカテゴリに対するシステム監査ポリシーを取得する。

[戻り値]
関数が成功した場合、TRUE を返す。関数が失敗した場合、FALSE を返す。拡張エラー情報を取得するには GetLastError
を呼び出す。GetLastError は WinError.h で定義されている以下のエラーコードのいずれかを返す場合がある。
（以下省略）

[備考]
本関数を正常に呼び出すには、呼び出し元が SeSecurityPrivilege を持っているか、監査セキュリティオブジェクトに対する
AUDIT_QUERY_SYSTEM_POLICY アクセスを持っている必要がある。


%index
AuditSetGlobalSaclW
監査メッセージへのアクセスを委任するグローバルシステムアクセス制御リスト (SACL) を設定する。(Unicode)
%group
Win32 advapi32
%prm
ObjectTypeName, Acl
ObjectTypeName : [wstr] 作成中またはアクセス中のオブジェクトの種類を指定する null 終端文字列へのポインタ。ファイルに対してグローバル SACL を設定する場合は "File" に、レジストリに対してグローバル SACL を設定する場合は "Key" に設定する。この文字列は関数が生成する監査メッセージに表示される。
Acl : [var] ACL 構造体へのポインタ。
%inst
監査メッセージへのアクセスを委任するグローバルシステムアクセス制御リスト (SACL) を設定する。(Unicode)

[戻り値]
関数が成功した場合、TRUE を返す。関数が失敗した場合、FALSE を返す。拡張エラー情報を取得するには GetLastError
を呼び出す。GetLastError は WinError.h で定義されている以下のエラーコードのいずれかを返す場合がある。
（以下省略）

[備考]
本関数を正常に呼び出すには、呼び出し元が SeSecurityPrivilege を持っている必要がある。
> [!NOTE] > ntsecapi.h ヘッダは、AuditSetGlobalSacl を UNICODE
プリプロセッサ定数の定義に基づいて ANSI 版または Unicode
版を自動選択するエイリアスとして定義している。エンコーディング中立のエイリアスとエンコーディング中立でないコードを混在させると、コンパイルエラーや実行時エラーを引き起こす不一致が生じる可能性がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照のこと。


%index
AuditSetPerUserPolicy
指定したプリンシパルに対して、1 つ以上の監査サブカテゴリのユーザー単位監査ポリシーを設定する。
%group
Win32 advapi32
%prm
pSid, pAuditPolicy, dwPolicyCount
pSid : [int] 監査ポリシーを設定するプリンシパルに関連付けられた SID 構造体へのポインタ。グループ SID に対するユーザー単位ポリシーは現在サポートされていない。
pAuditPolicy : [var] AUDIT_POLICY_INFORMATION 構造体の配列へのポインタ。各構造体は、1 つの監査サブカテゴリに対するユーザー単位監査ポリシーを指定する。これらの構造体の AuditCategoryGuid メンバは無視される。
dwPolicyCount : [int] pAuditPolicy 配列の要素数。
%inst
指定したプリンシパルに対して、1 つ以上の監査サブカテゴリのユーザー単位監査ポリシーを設定する。

[戻り値]
関数が成功した場合、TRUE を返す。関数が失敗した場合、FALSE を返す。拡張エラー情報を取得するには GetLastError
を呼び出す。GetLastError は WinError.h で定義されている以下のエラーコードのいずれかを返す場合がある。
（以下省略）

[備考]
本関数を正常に呼び出すには、呼び出し元が SeSecurityPrivilege を持っているか、Audit
セキュリティオブジェクトに対する AUDIT_SET_USER_POLICY アクセスを持っている必要がある。


%index
AuditSetSecurity
監査ポリシーへのアクセスを委任するセキュリティ記述子を設定する。
%group
Win32 advapi32
%prm
SecurityInformation, pSecurityDescriptor
SecurityInformation : [int] 本関数が設定するセキュリティ記述子の部分を指定する SECURITY_INFORMATION 値。SACL_SECURITY_INFORMATION と DACL_SECURITY_INFORMATION のみがサポートされ、それ以外の値は無視される。SACL_SECURITY_INFORMATION も DACL_SECURITY_INFORMATION も指定されていない場合、本関数は失敗し ERROR_INVALID_PARAMETER を返す。
pSecurityDescriptor : [int] Audit セキュリティオブジェクトへのアクセスを制御する、整形式の SECURITY_DESCRIPTOR 構造体へのポインタ。このパラメータが NULL の場合、本関数は失敗し ERROR_INVALID_PARAMETER を返す。
%inst
監査ポリシーへのアクセスを委任するセキュリティ記述子を設定する。

[戻り値]
関数が成功した場合、TRUE を返す。関数が失敗した場合、FALSE を返す。拡張エラー情報を取得するには GetLastError
を呼び出す。GetLastError は WinError.h で定義されている以下のエラーコードのいずれかを返す場合がある。
（以下省略）

[備考]
本関数を正常に呼び出すには、呼び出し元が SeSecurityPrivilege を持っている必要がある。


%index
AuditSetSystemPolicy
1 つ以上の監査ポリシーサブカテゴリに対するシステム監査ポリシーを設定する。
%group
Win32 advapi32
%prm
pAuditPolicy, dwPolicyCount
pAuditPolicy : [var] AUDIT_POLICY_INFORMATION 構造体の配列へのポインタ。各構造体は、1 つの監査ポリシーサブカテゴリに対するシステム監査ポリシーを指定する。これらの構造体の AuditCategoryGuid メンバは無視される。
dwPolicyCount : [int] pAuditPolicy 配列の要素数。
%inst
1 つ以上の監査ポリシーサブカテゴリに対するシステム監査ポリシーを設定する。

[戻り値]
関数が成功した場合、TRUE を返す。関数が失敗した場合、FALSE を返す。拡張エラー情報を取得するには GetLastError
を呼び出す。GetLastError は WinError.h で定義されている以下のエラーコードのいずれかを返す場合がある。
（以下省略）

[備考]
本関数を正常に呼び出すには、呼び出し元が SeSecurityPrivilege を持っているか、Audit
セキュリティオブジェクトに対する AUDIT_SET_SYSTEM_POLICY アクセスを持っている必要がある。


%index
BackupEventLogW
指定したイベントログをバックアップファイルに保存する。(Unicode)
%group
Win32 advapi32
%prm
hEventLog, lpBackupFileName
hEventLog : [intptr] 開いているイベントログへのハンドル。OpenEventLog 関数はこのハンドルを返す。
lpBackupFileName : [wstr] バックアップファイルの絶対パスまたは相対パス。
%inst
指定したイベントログをバックアップファイルに保存する。(Unicode)

[戻り値]
関数が成功した場合、戻り値は 0 以外となる。
関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには GetLastError を呼び出す。

[備考]
ユーザーが SE_BACKUP_NAME 特権を持っていない場合、BackupEventLog 関数は
ERROR_PRIVILEGE_NOT_HELD エラーで失敗する。
> [!NOTE] > winbase.h ヘッダは、BackupEventLog を UNICODE プリプロセッサ定数の定義に基づいて
ANSI 版または Unicode
版を自動選択するエイリアスとして定義している。エンコーディング中立のエイリアスとエンコーディング中立でないコードを混在させると、コンパイルエラーや実行時エラーを引き起こす不一致が生じる可能性がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照のこと。


%index
BuildExplicitAccessWithNameW
呼び出し側が指定したデータで EXPLICIT_ACCESS 構造体を初期化する。トラスティは名前文字列で識別される。(Unicode)
%group
Win32 advapi32
%prm
pExplicitAccess, pTrusteeName, AccessPermissions, AccessMode, Inheritance
pExplicitAccess : [var] 初期化する EXPLICIT_ACCESS 構造体へのポインタ。BuildExplicitAccessWithName 関数はメモリを一切確保しない。このパラメータを NULL にすることはできない。
pTrusteeName : [wstr] TRUSTEE 構造体の ptstrName メンバに対するトラスティの名前を含む null 終端文字列へのポインタ。BuildExplicitAccessWithName 関数は TRUSTEE 構造体の他のメンバを以下のように設定する。
AccessPermissions : [int] EXPLICIT_ACCESS 構造体の grfAccessPermissions メンバに対するアクセスマスクを指定する。マスクは ACCESS_MASK 形式を使用するビットフラグのセットで、ACE がトラスティに対して許可、拒否、または監査するアクセス権を指定する。EXPLICIT_ACCESS 構造体を使用する関数は、このマスク内のビットを変換、解釈、検証しない。
AccessMode : [int] EXPLICIT_ACCESS 構造体の grfAccessMode メンバに対するアクセスモードを指定する。アクセスモードは、ACE が指定した権限を許可、拒否、または監査するかを示す。DACL の場合、このパラメータには ACCESS_MODE 列挙型の値のいずれかを指定できる。SACL の場合、このパラメータには ACCESS_MODE 値の組み合わせを指定できる。
Inheritance : [int] EXPLICIT_ACCESS 構造体の grfInheritance メンバに対する継承型を指定する。この値は、他のコンテナやオブジェクトが、ACL がアタッチされているプライマリオブジェクトから ACE を継承できるかどうかを決定するビットフラグのセットである。このメンバの値は AceFlags メンバの継承部分（下位バイト）に対応する。
%inst
呼び出し側が指定したデータで EXPLICIT_ACCESS 構造体を初期化する。トラスティは名前文字列で識別される。(Unicode)

[備考]
> [!NOTE] > aclapi.h ヘッダは、BuildExplicitAccessWithName を UNICODE
プリプロセッサ定数の定義に基づいて ANSI 版または Unicode
版を自動選択するエイリアスとして定義している。エンコーディング中立のエイリアスとエンコーディング中立でないコードを混在させると、コンパイルエラーや実行時エラーを引き起こす不一致が生じる可能性がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照のこと。


%index
BuildImpersonateExplicitAccessWithNameW
(no summary)
%group
Win32 advapi32
%prm
pExplicitAccess, pTrusteeName, pTrustee, AccessPermissions, AccessMode, Inheritance
pExplicitAccess : [var] 
pTrusteeName : [wstr] 
pTrustee : [var] 
AccessPermissions : [int] 
AccessMode : [int] 
Inheritance : [int] 
%inst



%index
BuildImpersonateTrusteeW
(no summary)
%group
Win32 advapi32
%prm
pTrustee, pImpersonateTrustee
pTrustee : [var] 
pImpersonateTrustee : [var] 
%inst



%index
BuildSecurityDescriptorW
新しいセキュリティ記述子を割り当てて初期化する。(Unicode)
%group
Win32 advapi32
%prm
pOwner, pGroup, cCountOfAccessEntries, pListOfAccessEntries, cCountOfAuditEntries, pListOfAuditEntries, pOldSD, pSizeNewSD, pNewSD
pOwner : [var] 新しいセキュリティ記述子の所有者を識別する TRUSTEE 構造体へのポインタ。構造体が TRUSTEE_IS_NAME 形式を使用している場合、BuildSecurityDescriptor は指定したトラスティ名に関連付けられた SID を検索する。
pGroup : [var] 新しいセキュリティ記述子のプライマリグループ SID を識別する TRUSTEE 構造体へのポインタ。構造体が TRUSTEE_IS_NAME 形式を使用している場合、BuildSecurityDescriptor は指定したトラスティ名に関連付けられた SID を検索する。
cCountOfAccessEntries : [int] pListOfAccessEntries 配列内の EXPLICIT_ACCESS 構造体の数。
pListOfAccessEntries : [var] 新しいセキュリティ記述子の DACL に対するアクセス制御情報を記述する EXPLICIT_ACCESS 構造体の配列へのポインタ。関数は、配列内の情報を pOldSD 内の DACL（あれば）とマージして新しい DACL を作成する。pOldSD が NULL か、pOldSD の DACL が NULL の場合、関数は配列内の情報のみに基づいて新しい DACL を作成する。EXPLICIT_ACCESS 構造体の配列から ACL を作成するルールの説明については、SetEntriesInAcl 関数を参照のこと。
cCountOfAuditEntries : [int] pListOfAuditEntries 配列内の EXPLICIT_ACCESS 構造体の数。
pListOfAuditEntries : [var] 新しいセキュリティ記述子の SACL に対する監査制御情報を記述する EXPLICIT_ACCESS 構造体の配列へのポインタ。関数は、配列内の情報を pOldSD 内の SACL（あれば）とマージして新しい SACL を作成する。pOldSD が NULL か、pOldSD の SACL が NULL の場合、関数は配列内の情報のみに基づいて新しい SACL を作成する。
pOldSD : [int] 既存の自己相対 SECURITY_DESCRIPTOR 構造体とそれに関連するセキュリティ情報へのポインタ。関数は、指定した所有者、グループ、アクセス制御、監査制御の情報をこのセキュリティ記述子内の情報とマージすることで新しいセキュリティ記述子を構築する。このパラメータは NULL にできる。
pSizeNewSD : [var] セキュリティ記述子のサイズ（バイト単位）を受け取る変数へのポインタ。
pNewSD : [var] 新しいセキュリティ記述子へのポインタを受け取る変数へのポインタ。関数は新しいセキュリティ記述子用のメモリを確保する。返されたバッファを解放するには LocalFree 関数を呼び出す必要がある。
%inst
新しいセキュリティ記述子を割り当てて初期化する。(Unicode)

[戻り値]
関数が成功した場合、ERROR_SUCCESS を返す。
関数が失敗した場合、WinError.h で定義されている 0 以外のエラーコードを返す。

[備考]
BuildSecurityDescriptor
関数は、独自のオブジェクトに対してセキュリティを実装または公開する信頼できるサーバを対象としている。本関数は、ストリームへのシリアライズやディスクへの保存に適した自己相対セキュリティ記述子を使用する。
> [!NOTE] > aclapi.h ヘッダは、BuildSecurityDescriptor を UNICODE
プリプロセッサ定数の定義に基づいて ANSI 版または Unicode
版を自動選択するエイリアスとして定義している。エンコーディング中立のエイリアスとエンコーディング中立でないコードを混在させると、コンパイルエラーや実行時エラーを引き起こす不一致が生じる可能性がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照のこと。


%index
BuildTrusteeWithNameW
TRUSTEE 構造体を初期化する。呼び出し側はトラスティ名を指定する。関数は構造体の他のメンバを既定値に設定する。(Unicode)
%group
Win32 advapi32
%prm
pTrustee, pName
pTrustee : [var] 初期化する TRUSTEE 構造体へのポインタ。BuildTrusteeWithName 関数はメモリを一切確保しない。このパラメータが NULL か有効でないポインタの場合、結果は不定となる。
pName : [wstr] TRUSTEE 構造体の ptstrName メンバに対するトラスティの名前を含む null 終端文字列へのポインタ。BuildTrusteeWithName 関数は TRUSTEE 構造体の他のメンバを以下のように設定する。
%inst
TRUSTEE 構造体を初期化する。呼び出し側はトラスティ名を指定する。関数は構造体の他のメンバを既定値に設定する。(Unicode)

[備考]
> [!NOTE] > aclapi.h ヘッダは、BuildTrusteeWithName を UNICODE
プリプロセッサ定数の定義に基づいて ANSI 版または Unicode
版を自動選択するエイリアスとして定義している。エンコーディング中立のエイリアスとエンコーディング中立でないコードを混在させると、コンパイルエラーや実行時エラーを引き起こす不一致が生じる可能性がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照のこと。


%index
BuildTrusteeWithObjectsAndNameW
オブジェクト固有のアクセス制御エントリ (ACE) 情報を用いて TRUSTEE 構造体を初期化し、構造体の残りのメンバを既定値に初期化する。呼び出し側はトラスティの名前も指定する。(Unicode)
%group
Win32 advapi32
%prm
pTrustee, pObjName, ObjectType, ObjectTypeName, InheritedObjectTypeName, Name
pTrustee : [var] 本関数によって初期化される TRUSTEE 構造体へのポインタ。このパラメータの値が NULL か有効でないポインタの場合、結果は不定となる。
pObjName : [var] トラスティとセキュリティ保護可能オブジェクトに関する情報を含む OBJECTS_AND_NAME 構造体へのポインタ。
ObjectType : [int] セキュリティ保護可能オブジェクトの種類に関する情報を含む SE_OBJECT_TYPE 列挙体へのポインタ。
ObjectTypeName : [wstr] pTrustee パラメータで返される TRUSTEE 構造体に追加する ObjectType GUID に対応する名前を指定する文字列へのポインタ。本関数は、この名前に対応する ObjectType GUID を決定する。
InheritedObjectTypeName : [wstr] pTrustee パラメータで返される TRUSTEE 構造体に追加する InheritedObjectType GUID に対応する名前を指定する文字列へのポインタ。本関数は、この名前に対応する InheritedObjectType GUID を決定する。
Name : [wstr] トラスティを識別するために使用される名前を指定する文字列へのポインタ。
%inst
オブジェクト固有のアクセス制御エントリ (ACE) 情報を用いて TRUSTEE
構造体を初期化し、構造体の残りのメンバを既定値に初期化する。呼び出し側はトラスティの名前も指定する。(Unicode)

[備考]
本関数は TRUSTEE 構造体や OBJECTS_AND_NAME 構造体のためのメモリを確保しない。オブジェクト固有 ACE
の詳細については「Object-specific ACEs」を参照のこと。
> [!NOTE] > aclapi.h ヘッダは、BuildTrusteeWithObjectsAndName を UNICODE
プリプロセッサ定数の定義に基づいて ANSI 版または Unicode
版を自動選択するエイリアスとして定義している。エンコーディング中立のエイリアスとエンコーディング中立でないコードを混在させると、コンパイルエラーや実行時エラーを引き起こす不一致が生じる可能性がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照のこと。


%index
BuildTrusteeWithObjectsAndSidW
オブジェクト固有のアクセス制御エントリ (ACE) 情報を用いて TRUSTEE 構造体を初期化し、構造体の残りのメンバを既定値に初期化する。(Unicode)
%group
Win32 advapi32
%prm
pTrustee, pObjSid, pObjectGuid, pInheritedObjectGuid, pSid
pTrustee : [var] 初期化する TRUSTEE 構造体へのポインタ。BuildTrusteeWithObjectsAndSid 関数はメモリを一切確保しない。このパラメータが NULL か有効でないポインタの場合、結果は不定となる。
pObjSid : [var] トラスティとセキュリティ保護可能オブジェクトに関する情報を含む OBJECTS_AND_SID 構造体へのポインタ。
pObjectGuid : [var] TRUSTEE 構造体に追加する ObjectType GUID を記述する GUID 構造体へのポインタ。
pInheritedObjectGuid : [var] TRUSTEE 構造体に追加する InheritedObjectType GUID を記述する GUID 構造体へのポインタ。
pSid : [int] トラスティを識別する SID 構造体へのポインタ。
%inst
オブジェクト固有のアクセス制御エントリ (ACE) 情報を用いて TRUSTEE
構造体を初期化し、構造体の残りのメンバを既定値に初期化する。(Unicode)

[備考]
本関数は TRUSTEE 構造体や OBJECTS_AND_SID 構造体のためのメモリを確保しない。オブジェクト固有 ACE
の詳細については「Object-specific ACEs」を参照のこと。
> [!NOTE] > aclapi.h ヘッダは、BuildTrusteeWithObjectsAndSid を UNICODE
プリプロセッサ定数の定義に基づいて ANSI 版または Unicode
版を自動選択するエイリアスとして定義している。エンコーディング中立のエイリアスとエンコーディング中立でないコードを混在させると、コンパイルエラーや実行時エラーを引き起こす不一致が生じる可能性がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照のこと。


%index
BuildTrusteeWithSidW
TRUSTEE 構造体を初期化する。呼び出し側はトラスティのセキュリティ識別子 (SID) を指定する。関数は構造体の他のメンバを既定値に設定し、SID に関連付けられた名前の検索は行わない。(Unicode)
%group
Win32 advapi32
%prm
pTrustee, pSid
pTrustee : [var] 初期化する TRUSTEE 構造体へのポインタ。BuildTrusteeWithSid 関数はメモリを一切確保しない。このパラメータが NULL か有効でないポインタの場合、結果は不定となる。
pSid : [int] トラスティを識別する SID 構造体へのポインタ。BuildTrusteeWithSid 関数はこのポインタを TRUSTEE 構造体の ptstrName メンバに代入する。関数は TRUSTEE 構造体の他のメンバを以下のように設定する。
%inst
TRUSTEE 構造体を初期化する。呼び出し側はトラスティのセキュリティ識別子 (SID)
を指定する。関数は構造体の他のメンバを既定値に設定し、SID に関連付けられた名前の検索は行わない。(Unicode)

[備考]
> [!NOTE] > aclapi.h ヘッダは、BuildTrusteeWithSid を UNICODE
プリプロセッサ定数の定義に基づいて ANSI 版または Unicode
版を自動選択するエイリアスとして定義している。エンコーディング中立のエイリアスとエンコーディング中立でないコードを混在させると、コンパイルエラーや実行時エラーを引き起こす不一致が生じる可能性がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照のこと。


%index
CloseServiceHandle
サービス制御マネージャまたはサービスオブジェクトへのハンドルを閉じる。
%group
Win32 advapi32
%prm
hSCObject
hSCObject : [intptr] 閉じるサービス制御マネージャオブジェクトまたはサービスオブジェクトへのハンドル。サービス制御マネージャオブジェクトへのハンドルは OpenSCManager 関数が返し、サービスオブジェクトへのハンドルは OpenService または CreateService 関数が返す。
%inst
サービス制御マネージャまたはサービスオブジェクトへのハンドルを閉じる。

[戻り値]
関数が成功した場合、戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError
を呼び出す。以下のエラーコードがサービス制御マネージャによって設定される場合がある。そのほかのエラーコードは、サービス制御マネージャが呼び出すレジストリ関数によって設定される場合がある。
（以下省略）

[備考]
CloseServiceHandle
関数は、ハンドルが参照するサービス制御マネージャオブジェクト自体を破棄しない。サービス制御マネージャオブジェクトは破棄できない。サービスオブジェクトは
DeleteService 関数を呼び出すことで破棄できる。


%index
ChangeServiceConfigW
サービスの構成パラメータを変更する。(Unicode)
%group
Win32 advapi32
%prm
hService, dwServiceType, dwStartType, dwErrorControl, lpBinaryPathName, lpLoadOrderGroup, lpdwTagId, lpDependencies, lpServiceStartName, lpPassword, lpDisplayName
hService : [intptr] サービスへのハンドル。このハンドルは OpenService または CreateService 関数が返すもので、SERVICE_CHANGE_CONFIG アクセス権を持っている必要がある。詳細はサービスのセキュリティとアクセス権を参照のこと。
dwServiceType : [int] サービスの種類。既存のサービス種別を変更しない場合は SERVICE_NO_CHANGE を指定する。そうでなければ、以下のサービス種別のいずれかを指定する。
dwStartType : [int] 
dwErrorControl : [int] 
lpBinaryPathName : [wstr] サービスバイナリファイルへの完全修飾パス。既存のパスを変更しない場合は NULL を指定する。パスに空白が含まれる場合、正しく解釈されるように引用符で囲む必要がある。たとえば "d:\\my share\\myservice.exe" は "\"d:\\my share\\myservice.exe\"" のように指定する。
lpLoadOrderGroup : [wstr] このサービスがメンバとなっているロード順序グループの名前。既存のグループを変更しない場合は NULL を指定する。サービスがグループに属さない場合は空文字列を指定する。
lpdwTagId : [var] lpLoadOrderGroup パラメータで指定したグループ内で一意となるタグ値を受け取る変数へのポインタ。既存のタグを変更しない場合は NULL を指定する。
lpDependencies : [wstr] このサービスが開始される前にシステムが起動しなければならないサービスまたはロード順序グループの、null 区切りの名前からなる二重 null 終端配列へのポインタ。（グループへの依存は、グループのすべてのメンバを開始しようとした後に少なくとも 1 つのメンバが動作していれば、このサービスが動作できることを意味する。）既存の依存関係を変更しない場合は NULL を指定する。サービスに依存関係がない場合は空文字列を指定する。
lpServiceStartName : [wstr] サービスが動作するアカウントの名前。既存のアカウント名を変更しない場合は NULL を指定する。サービス種別が SERVICE_WIN32_OWN_PROCESS の場合、DomainName\UserName 形式のアカウント名を使用する。サービスプロセスはこのユーザーとしてログオンされる。アカウントが組み込みドメインに属する場合は .\UserName を指定できる（対応する C/C++ 文字列は ".\\UserName" となる点に注意）。詳細は「Service User Accounts」および「注釈」セクションの警告を参照のこと。
lpPassword : [wstr] lpServiceStartName パラメータで指定したアカウント名のパスワード。既存のパスワードを変更しない場合は NULL を指定する。アカウントにパスワードがない場合や、サービスが LocalService、NetworkService、または LocalSystem アカウントで動作する場合は空文字列を指定する。詳細は「Service Record List」を参照のこと。
lpDisplayName : [wstr] アプリケーションがユーザーに対しサービスを識別するために使用する表示名。既存の表示名を変更しない場合は NULL を指定する。そうでなければ、この文字列の最大長は 256 文字である。名前はサービス制御マネージャ内で大文字小文字が保持される。表示名の比較は常に大文字小文字を区別しない。このパラメータには以下の形式でローカライズ文字列を指定できる: @[path\]dllname,-strID 識別子 strID を持つ文字列は dllname から読み込まれる。パスは省略可能である。詳細は RegLoadMUIString を参照のこと。Windows Server 2003 および Windows XP: ローカライズ文字列は Windows Vista までサポートされない。
%inst
サービスの構成パラメータを変更する。(Unicode)

[戻り値]
関数が成功した場合、戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError
を呼び出す。以下のエラーコードがサービス制御マネージャによって設定される場合がある。そのほかのエラーコードは、サービス制御マネージャが呼び出すレジストリ関数によって設定される場合がある。
（以下省略）

[備考]
ChangeServiceConfig
関数は、指定したサービスについてサービス制御マネージャのデータベース内の構成情報を変更する。現在の構成情報は
QueryServiceConfig 関数で取得できる。実行中のサービスの構成が変更された場合、lpDisplayName
を除き、変更はサービスが停止されるまで有効にならない。サービスを再起動することなく資格情報を更新するには、LsaCallAuthenticationPackage
関数を使用する。セキュリティに関する注意事項 lpServiceStartName
パラメータの設定は、サービスのログオンアカウントを変更する。これは問題を引き起こす可能性がある。サービスプリンシパル名 (SPN)
を登録していた場合、現在は誤ったアカウントに登録されていることになる。同様に、サービスへのアクセスを許可するために ACE
を使用していた場合、現在は誤ったアカウントにアクセスが許可されることになる。


%index
ChangeServiceConfig2A
サービスの省略可能な構成パラメータを変更する。(ANSI)
%group
Win32 advapi32
%prm
hService, dwInfoLevel, lpInfo
hService : [intptr] サービスへのハンドル。このハンドルは OpenService または CreateService 関数が返すもので、SERVICE_CHANGE_CONFIG アクセス権を持っている必要がある。詳細はサービスのセキュリティとアクセス権を参照のこと。
dwInfoLevel : [int] 
lpInfo : [intptr] 構成情報に設定する新しい値へのポインタ。このデータの形式は dwInfoLevel パラメータの値に依存する。この値が NULL の場合、情報は変更されない。
%inst
サービスの省略可能な構成パラメータを変更する。(ANSI)

[戻り値]
関数が成功した場合、戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼び出す。

[備考]
ChangeServiceConfig2
関数は、指定したサービスについてサービス制御マネージャのデータベース内の省略可能な構成情報を変更する。現在の省略可能な構成情報は
QueryServiceConfig2
関数で取得できる。サービス制御マネージャのプロセスを共有するサービスに対しては、SERVICE_CONFIG_FAILURE_ACTIONS
値を設定できない。これには実行可能イメージが "Services.exe"
であるすべてのサービスが含まれる。追加の構成情報は、ChangeServiceConfig および QueryServiceConfig
関数を使用してそれぞれ変更・問い合わせができる。エラー後に再起動するよう構成されたサービスは、サービス制御マネージャが指定された時間遅延後に再起動アクションをキューに入れる。キューに入った再起動アクションはキャンセルできない。サービスが手動で再起動され、キューに入った再起動アクションが発生する前に停止した場合、時間遅延が経過するとサービスが予期せず再起動される。再起動を防ぐには、サービスを明示的に無効化する必要がある。SERVICE_CONFIG_LAUNCH_PROTECTED
値を使用すると、サービスを保護付きで起動できる。保護付きで起動するには、サービスが特別な証明書で署名されている必要がある。
SERVICE_CONFIG_LAUNCH_PROTECTED の例:
（以下省略）


%index
ChangeServiceConfig2W
サービスの省略可能な構成パラメータを変更する。(Unicode)
%group
Win32 advapi32
%prm
hService, dwInfoLevel, lpInfo
hService : [intptr] サービスへのハンドル。このハンドルは OpenService または CreateService 関数が返すもので、SERVICE_CHANGE_CONFIG アクセス権を持っている必要がある。詳細はサービスのセキュリティとアクセス権を参照のこと。
dwInfoLevel : [int] 
lpInfo : [intptr] 構成情報に設定する新しい値へのポインタ。このデータの形式は dwInfoLevel パラメータの値に依存する。この値が NULL の場合、情報は変更されない。
%inst
サービスの省略可能な構成パラメータを変更する。(Unicode)

[戻り値]
関数が成功した場合、戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼び出す。

[備考]
ChangeServiceConfig2
関数は、指定したサービスについてサービス制御マネージャのデータベース内の省略可能な構成情報を変更する。現在の省略可能な構成情報は
QueryServiceConfig2
関数で取得できる。サービス制御マネージャのプロセスを共有するサービスに対しては、SERVICE_CONFIG_FAILURE_ACTIONS
値を設定できない。これには実行可能イメージが "Services.exe"
であるすべてのサービスが含まれる。追加の構成情報は、ChangeServiceConfig および QueryServiceConfig
関数を使用してそれぞれ変更・問い合わせができる。エラー後に再起動するよう構成されたサービスは、サービス制御マネージャが指定された時間遅延後に再起動アクションをキューに入れる。キューに入った再起動アクションはキャンセルできない。サービスが手動で再起動され、キューに入った再起動アクションが発生する前に停止した場合、時間遅延が経過するとサービスが予期せず再起動される。再起動を防ぐには、サービスを明示的に無効化する必要がある。SERVICE_CONFIG_LAUNCH_PROTECTED
値を使用すると、サービスを保護付きで起動できる。保護付きで起動するには、サービスが特別な証明書で署名されている必要がある。
SERVICE_CONFIG_LAUNCH_PROTECTED の例:
（以下省略）


%index
CheckForHiberboot
(no summary)
%group
Win32 advapi32
%prm
pHiberboot, bClearFlag
pHiberboot : [var] 
bClearFlag : [int] 
%inst



%index
CheckTokenMembership
指定したセキュリティ識別子 (SID) がアクセストークン内で有効になっているかを判定する。
%group
Win32 advapi32
%prm
TokenHandle, SidToCheck, IsMember
TokenHandle : [intptr] アクセストークンへのハンドル。ハンドルはトークンに対する TOKEN_QUERY アクセス権を持っている必要がある。トークンは偽装トークンでなければならない。
SidToCheck : [int] SID 構造体へのポインタ。CheckTokenMembership 関数はこの SID がアクセストークンのユーザー SID およびグループ SID に存在するかをチェックする。
IsMember : [var] チェック結果を受け取る変数へのポインタ。SID が存在し SE_GROUP_ENABLED 属性を持つ場合、IsMember は TRUE を返す。そうでなければ FALSE を返す。
%inst
指定したセキュリティ識別子 (SID) がアクセストークン内で有効になっているかを判定する。

[戻り値]
関数が成功した場合、戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼び出す。

[備考]
CheckTokenMembership 関数は、SID
がアクセストークンに存在しかつ有効になっているかを判定する処理を簡素化する。SID
がトークンに存在していても、システムがアクセスチェックでその SID を使用しない場合がある。SID
は無効化されているか、SE_GROUP_USE_FOR_DENY_ONLY
属性を持っている可能性がある。システムはアクセスチェックを行う際、有効な SID のみを使用してアクセスを許可する。詳細は「SID
Attributes in an Access Token」を参照のこと。TokenHandle が制限付きトークンである場合、または
TokenHandle が NULL
で呼び出し元スレッドの現在の実効トークンが制限付きトークンである場合、CheckTokenMembership は制限する SID
のリストにも SID が存在するかをチェックする。


%index
ClearEventLogW
指定したイベントログをクリアし、任意でログの現在のコピーをバックアップファイルに保存する。(Unicode)
%group
Win32 advapi32
%prm
hEventLog, lpBackupFileName
hEventLog : [intptr] クリアするイベントログへのハンドル。OpenEventLog 関数はこのハンドルを返す。
lpBackupFileName : [wstr] バックアップファイルの絶対パスまたは相対パス。このファイルが既に存在する場合、関数は失敗する。
%inst
指定したイベントログをクリアし、任意でログの現在のコピーをバックアップファイルに保存する。(Unicode)

[戻り値]
関数が成功した場合、戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼び出す。イベントログが空であるかバックアップファイルが既に存在する場合、ClearEventLog
関数は失敗することがある。

[備考]
本関数の復帰後、クリアされたイベントログを参照するハンドルはログの読み取りに使用できない。
> [!NOTE] > winbase.h ヘッダは、ClearEventLog を UNICODE プリプロセッサ定数の定義に基づいて
ANSI 版または Unicode
版を自動選択するエイリアスとして定義している。エンコーディング中立のエイリアスとエンコーディング中立でないコードを混在させると、コンパイルエラーや実行時エラーを引き起こす不一致が生じる可能性がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照のこと。


%index
CloseEncryptedFileRaw
バックアップまたは復元操作の後に暗号化ファイルを閉じ、関連するシステムリソースを解放する。
%group
Win32 advapi32
%prm
pvContext
pvContext : [intptr] システム定義のコンテキストブロックへのポインタ。OpenEncryptedFileRaw 関数がコンテキストブロックを返す。
%inst
バックアップまたは復元操作の後に暗号化ファイルを閉じ、関連するシステムリソースを解放する。

[備考]
CloseEncryptedFileRaw
関数は、システム定義のコンテキストブロックなど確保されたシステムリソースを解放し、ファイルを閉じる。暗号化されていないファイルのバックアップと復元は
BackupRead および BackupWrite 関数が扱う。Windows 8、Windows Server 2012
以降では、本関数は以下の技術によってサポートされる。
（以下省略）


%index
CloseEventLog
指定したイベントログを閉じる。(CloseEventLog)
%group
Win32 advapi32
%prm
hEventLog
hEventLog : [intptr] 閉じるイベントログへのハンドル。OpenEventLog または OpenBackupEventLog 関数がこのハンドルを返す。
%inst
指定したイベントログを閉じる。(CloseEventLog)

[戻り値]
関数が成功した場合、戻り値は 0 以外となる。
関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには GetLastError を呼び出す。


%index
CloseThreadWaitChainSession
指定した WCT セッションを閉じ、未解決の非同期操作をキャンセルする。
%group
Win32 advapi32
%prm
WctHandle
WctHandle : [intptr] OpenThreadWaitChainSession 関数で作成した WCT セッションへのハンドル。
%inst
指定した WCT セッションを閉じ、未解決の非同期操作をキャンセルする。

[備考]
WCT セッションが非同期モード（WCT_ASYNC_OPEN_FLAG
付き）で開かれていた場合、関数は未解決の操作のコールバック関数が呼び出されて復帰した後にそれらをキャンセルし、その後に復帰する。


%index
CloseTrace
CloseTrace 関数は、OpenTrace で作成されたトレース処理セッションを閉じる。
%group
Win32 advapi32
%prm
TraceHandle
TraceHandle : [int] 閉じるトレース処理セッションへのハンドル。[OpenTrace](/windows/win32/api/evntrace/nf-evntrace-opentracea) 関数がこのハンドルを返す。
%inst
CloseTrace 関数は、OpenTrace で作成されたトレース処理セッションを閉じる。

[戻り値]
関数が成功した場合、戻り値は ERROR_SUCCESS となる。関数が失敗した場合、戻り値は
[システムエラーコード](/windows/win32/debug/system-error-codes)
のいずれかとなる。以下に一般的なエラーとその原因を示す。- **ERROR_INVALID_HANDLE** 以下のいずれかが真である:
- _TraceHandle_ が **0** である。- _TraceHandle_ が
**INVALID_PROCESSTRACE_HANDLE** である。- _TraceHandle_ が有効なハンドルではない。-
**ERROR_BUSY** Windows Vista
より前では、[ProcessTrace](/windows/win32/api/evntrace/nf-evntrace-processtrace)
関数が完了するまでトレースを閉じることはできない。- **ERROR_CTX_CLOSE_PENDING**
呼び出しは成功した。[ProcessTrace](/windows/win32/api/evntrace/nf-evntrace-processtrace)
関数は、バッファ内のすべてのリアルタイムイベントを処理した後に停止する（新しいイベントは受け取らない）。

[備考]
コンシューマは本関数を呼び出して **OpenTrace** が返したトレースハンドルを閉じる。> [!Important] >
**StartTrace**
が返したトレースハンドルを閉じるのに本関数を使用してはならない。ログファイルからイベントを処理している場合、本関数は
[ProcessTrace](/windows/win32/api/evntrace/nf-evntrace-processtrace)
関数が復帰した後にのみ呼び出す。ただし、リアルタイムイベントを処理している場合は、**ProcessTrace**
が復帰する前に本関数を呼び出してもよい（トレース処理を停止する別の方法は
[BufferCallback](/windows/win32/api/evntrace/nc-evntrace-pevent_trace_buffer_callbacka)
から FALSE を返すことである）。**ProcessTrace** が復帰する前に本関数を呼び出した場合、**CloseTrace**
関数は ERROR_CTX_CLOSE_PENDING を返す。ERROR_CTX_CLOSE_PENDING コードは
**CloseTrace** 関数呼び出しが成功したことを示す。**ProcessTrace**
関数は、以前にキューに入れられたイベントをすべて処理した後にイベント処理を停止する（**CloseTrace**
関数を呼び出した後は新しいイベントを受け取らない）。**CloseTrace** 関数は
[BufferCallback](/windows/desktop/ETW/buffercallback)、[EventCallback](/windows/desktop/ETW/eventcallback)、[EventClassCallback](/windows/desktop/ETW/eventclasscallback)
コールバックから呼び出すことができる。> **Windows Vista 以前:** **CloseTrace** は >
[ProcessTrace](/windows/win32/api/evntrace/nf-evntrace-processtrace)
が復帰した後にのみ呼び出せる。


%index
CommandLineFromMsiDescriptor
(no summary)
%group
Win32 advapi32
%prm
Descriptor, CommandLine, CommandLineLength
Descriptor : [wstr] 
CommandLine : [wstr] 
CommandLineLength : [var] 
%inst



%index
ControlService
サービスに制御コードを送信する。(ControlService)
%group
Win32 advapi32
%prm
hService, dwControl, lpServiceStatus
hService : [intptr] サービスへのハンドル。このハンドルは OpenService または CreateService 関数が返す。このハンドルに必要なアクセス権は要求する dwControl コードに依存する。
dwControl : [int] このパラメータには以下の制御コードのいずれかを指定できる。
lpServiceStatus : [var] 最新のサービス状態情報を受け取る SERVICE_STATUS 構造体へのポインタ。返される情報は、サービスがサービス制御マネージャに報告した最新の状態を反映する。
%inst
サービスに制御コードを送信する。(ControlService)

[戻り値]
関数が成功した場合、戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError
を呼び出す。以下のエラーコードがサービス制御マネージャによって設定される場合がある。そのほかのエラーコードは、サービス制御マネージャが呼び出すレジストリ関数によって設定される場合がある。
（以下省略）

[備考]
ControlService 関数は、要求された制御コードをサービスに送信するようサービス制御マネージャ (SCM) に依頼する。SCM
は、サービスがそのコードを受け入れると指定しており、制御コードを送信できる状態にある場合にコードを送信する。SCM
はサービス制御通知を直列に処理する。つまり、1
つのサービスが制御通知の処理を完了するまで待ってから次の通知を送信する。このため、いずれかのサービスが制御コードの処理で忙しい場合、ControlService
の呼び出しは 30 秒間ブロックする。タイムアウト時点で忙しいサービスがハンドラ関数から復帰していない場合、ControlService
は ERROR_SERVICE_REQUEST_TIMEOUT
で失敗する。サービスを停止したり開始したりするには、それを許可するセキュリティ記述子が必要である。既定のセキュリティ記述子では、LocalSystem
アカウントと Administrators および Power Users
グループのメンバにサービスの停止と開始が許可されている。サービスのセキュリティ記述子を変更するには「Modifying the DACL
for a Service」を参照のこと。QueryServiceStatusEx 関数は、実行中のサービスが受け入れる現在の状態と制御を
dwCurrentState および dwControlsAccepted メンバで示す SERVICE_STATUS_PROCESS
構造体を返す。実行中のすべてのサービスは既定で SERVICE_CONTROL_INTERROGATE 制御コードを受け入れる。ドライバは
SERVICE_CONTROL_STOP および SERVICE_CONTROL_INTERROGATE
以外の制御コードを受け入れない。各サービスは、SetServiceStatus
関数を呼び出して状態を報告する際に、受け入れるその他の制御コードを指定する。サービスは実行中であれば、何をしていてもこれらのコードを常に受け入れるべきである。SCM
が各サービス状態で取るアクションを次の表に示す。
（以下省略）


%index
ControlServiceExW
サービスに制御コードを送信する。(ControlServiceExW)
%group
Win32 advapi32
%prm
hService, dwControl, dwInfoLevel, pControlParams
hService : [intptr] サービスへのハンドル。このハンドルは OpenService または CreateService 関数が返す。このハンドルに必要なアクセス権は要求する dwControl コードに依存する。
dwControl : [int] このパラメータには以下の制御コードのいずれかを指定できる。
dwInfoLevel : [int] サービス制御パラメータの情報レベル。このパラメータは SERVICE_CONTROL_STATUS_REASON_INFO (1) に設定する必要がある。
pControlParams : [intptr] サービス制御パラメータへのポインタ。dwInfoLevel が SERVICE_CONTROL_STATUS_REASON_INFO の場合、このメンバは SERVICE_CONTROL_STATUS_REASON_PARAMS 構造体へのポインタである。
%inst
サービスに制御コードを送信する。(ControlServiceExW)

[戻り値]
関数が成功した場合、戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError
を呼び出す。以下のエラーコードがサービス制御マネージャによって設定される場合がある。そのほかのエラーコードは、サービス制御マネージャが呼び出すレジストリ関数によって設定される場合がある。
（以下省略）

[備考]
ControlServiceEx 関数は、要求された制御コードをサービスに送信するようサービス制御マネージャ (SCM)
に依頼する。SCM は、サービスがそのコードを受け入れると指定しており、制御コードを送信できる状態にある場合にコードを送信する。SCM
はサービス制御通知を直列に処理する。つまり、1
つのサービスが制御通知の処理を完了するまで待ってから次の通知を送信する。このため、いずれかのサービスが制御コードの処理で忙しい場合、ControlServiceEx
の呼び出しは 30
秒間ブロックする。タイムアウト時点で忙しいサービスがハンドラ関数から復帰していない場合、ControlServiceEx は
ERROR_SERVICE_REQUEST_TIMEOUT
で失敗する。サービスを停止したり開始したりするには、それを許可するセキュリティ記述子が必要である。既定のセキュリティ記述子では、LocalSystem
アカウントと Administrators および Power Users
グループのメンバにサービスの停止と開始が許可されている。サービスのセキュリティ記述子を変更するには「Modifying the DACL
for a Service」を参照のこと。QueryServiceStatusEx 関数は、実行中のサービスが受け入れる現在の状態と制御を
dwCurrentState および dwControlsAccepted メンバで示す SERVICE_STATUS_PROCESS
構造体を返す。実行中のすべてのサービスは既定で SERVICE_CONTROL_INTERROGATE 制御コードを受け入れる。ドライバは
SERVICE_CONTROL_STOP および SERVICE_CONTROL_INTERROGATE
以外の制御コードを受け入れない。各サービスは、SetServiceStatus
関数を呼び出して状態を報告する際に、受け入れるその他の制御コードを指定する。サービスは実行中であれば、何をしていてもこれらのコードを常に受け入れるべきである。SCM
が各サービス状態で取るアクションを次の表に示す。
（以下省略）


%index
ControlTraceW
ControlTraceW (Unicode) 関数 (evntrace.h) は、指定したイベントトレースセッションをフラッシュ、問い合わせ、更新、または停止する。
%group
Win32 advapi32
%prm
TraceHandle, InstanceName, Properties, ControlCode
TraceHandle : [int] イベントトレースセッションへのハンドル、または 0。_InstanceName_ が **NULL** の場合は 0 以外の _TraceHandle_ を指定する必要がある。_InstanceName_ が **NULL** でない場合、ETW はハンドルを無視する。[StartTrace](/windows/win32/api/evntrace/nf-evntrace-starttracew) 関数は新しいトレースが開始されるとこのハンドルを返す。既存のトレースのハンドルを取得するには、**ControlTrace** を使ってトレース名に基づきトレースプロパティを問い合わせ、返された `EVENT_TRACE_PROPERTIES` データの **Wnode.HistoricalContext** フィールドからハンドルを取得する。
InstanceName : [wstr] イベントトレースセッションの名前、または **NULL**。_TraceHandle_ が 0 の場合は _InstanceName_ を指定する必要がある。NT カーネルロガーセッションを指定するには、_InstanceName_ を **KERNEL_LOGGER_NAME** に設定する。
Properties : [var] 初期化済みの [EVENT_TRACE_PROPERTIES](/windows/win32/api/evntrace/ns-evntrace-event_trace_properties) 構造体へのポインタ。この構造体はフィールドを設定する前にゼロクリアしておく必要がある。_ControlCode_ が **EVENT_TRACE_CONTROL_STOP**、**EVENT_TRACE_CONTROL_QUERY**、または **EVENT_TRACE_CONTROL_FLUSH** を指定する場合、[EVENT_TRACE_PROPERTIES](/windows/win32/api/evntrace/ns-evntrace-event_trace_properties) 構造体の **Wnode.BufferSize**、**Wnode.Guid**、**LoggerNameOffset**、**LogFileNameOffset** メンバのみ設定すればよい。セッションがプライベートセッションの場合は **LogFileMode** も設定する必要がある。バッファサイズとオフセットを算出する際に不明な場合は、最大セッション名長 (1024 文字) と最大ログファイル名長 (1024 文字) を使用できる。_ControlCode_ が **EVENT_TRACE_CONTROL_UPDATE** を指定する場合、入力時のメンバには更新するプロパティの新しい値を指定する必要がある。出力時、_Properties_ にはイベントトレースセッションのプロパティと統計情報が格納される。以下のプロパティを更新できる。- **EnableFlags**: すべてのシステムプロバイダを無効化するには 0 を設定する。有効化または有効な状態を維持したいシステムプロバイダを指定するには 0 以外の値を設定する。これは [システムロガー](/windows/win32/api/evntrace/nf-evntrace-starttracew#system-loggers) に対してのみ 0 以外でありえる。- **FlushTimer**: バッファのフラッシュを待つ時間を変更する場合に設定する。このメンバが 0 の場合、メンバは更新されない。- **LogFileNameOffset**: 別のログファイルに切り替えたい場合、またはバッファリングモードのトレースを新しいログファイルにフラッシュしたい場合に設定する。このメンバが 0 の場合、ファイル名は更新されない。オフセットが 0 でなくログファイル名を変更しない場合、関数はエラーを返す。- **LogFileMode**: **EVENT_TRACE_REAL_TIME_MODE** のオン/オフを切り替えたい場合に設定する。リアルタイム消費をオフにするにはこのメンバを 0 に設定する。リアルタイム消費をオンにする（ディスクへの記録とリアルタイムイベント配信を同時に行うセッションを作成する）にはこのメンバを **EVENT_TRACE_REAL_TIME_MODE** に設定する。これは現在のモードと OR される。- **MaximumBuffers**: ETW が使用する最大バッファ数を変更する場合に設定する。このメンバが 0 の場合、メンバは更新されない。プライベートロガーセッションでは、**LogFileNameOffset** と **FlushTimer** メンバのみ更新できる。新しく初期化した [EVENT_TRACE_PROPERTIES](/windows/win32/api/evntrace/ns-evntrace-event_trace_properties) 構造体を使用する場合は、構造体をゼロクリアしてから **Wnode.BufferSize**、**Wnode.Guid**、**Wnode.Flags** と、更新する値を設定する。**EVENT_TRACE_PROPERTIES** 構造体を再利用する場合（以前 [StartTrace](/windows/win32/api/evntrace/nf-evntrace-starttracew) または **ControlTrace** に渡した構造体を使用する場合）、ログファイル名を変更しない限り **LogFileNameOffset** メンバを 0 に設定し、[EVENT_TRACE_PROPERTIES.Wnode.Flags](/windows/win32/api/evntrace/ns-evntrace-event_trace_properties) を **WNODE_FLAG_TRACED_GUID** に設定することを忘れないこと。> **Windows 10 バージョン 1703 以降:** クロスプロセスシナリオでのパフォーマンス向上のため、システム全体のプライベートロガーに対して **ControlTrace** にフィルタリング情報を渡せるようになった。フィルタリング情報を含めるには > [EVENT_TRACE_PROPERTIES_V2](/windows/win32/api/evntrace/ns-evntrace-event_trace_properties_v2) > 構造体を使用する必要がある。詳細は > [Configuring and Starting a Private Logger Session](/windows/win32/etw/configuring-and-starting-a-private-logger-session) > を参照のこと。
ControlCode : [int] 
%inst
ControlTraceW (Unicode) 関数 (evntrace.h)
は、指定したイベントトレースセッションをフラッシュ、問い合わせ、更新、または停止する。

[戻り値]
関数が成功した場合、戻り値は ERROR_SUCCESS となる。関数が失敗した場合、戻り値は
[システムエラーコード](/windows/win32/debug/system-error-codes)
のいずれかとなる。以下に一般的なエラーとその原因を示す。- **ERROR_BAD_LENGTH** 以下のいずれかが真である: -
_Properties_ の **Wnode.BufferSize** メンバに不正なサイズが指定されている。- _Properties_
がセッション名とログファイル名（使用する場合）のコピーを保持するのに十分な領域を割り当てていない。-
**ERROR_INVALID_PARAMETER** 以下のいずれかが真である: - _Properties_ が **NULL**
である。- _InstanceName_ と _TraceHandle_ の両方が **NULL** である。-
_InstanceName_ が **NULL** で _TraceHandle_ が有効なハンドルではない。- _Properties_
の **LogFileNameOffset** メンバが有効でない。- _Properties_ の
**LoggerNameOffset** メンバが有効でない。- _Properties_ の **LogFileMode**
メンバに無効なフラグの組み合わせが指定されている。- _Properties_ の **Wnode.Guid** メンバが
**SystemTraceControlGuid** だが、_InstanceName_ パラメータが
`KERNEL_LOGGER_NAME` ではない。- **ERROR_BAD_PATHNAME** _Properties_ 構造体の
**LogFileNameOffset** メンバで指定したファイル名が既に別のセッションで使用されている。-
**ERROR_MORE_DATA**
[EVENT_TRACE_PROPERTIES](/windows/win32/api/evntrace/ns-evntrace-event_trace_properties)
のバッファが、セッションのすべての情報を保持するには小さすぎる。セッションのプロパティ情報が不要であれば、このエラーは無視してよい。セッションの停止時にこのエラーを受け取った場合、ETW
はこのエラーを生成する前に既にセッションを停止している。- **ERROR_ACCESS_DENIED**
管理者特権を持って実行されているユーザー、Performance Log Users
グループに属するユーザー、LocalSystem、LocalService、NetworkService
として動作しているサービスのみがイベントトレースセッションを制御できる。制限付きユーザーにトレースセッションを制御する権限を付与するには、Performance
Log Users グループに追加する。NT カーネルロガーセッションを制御できるのは、管理者特権を持つユーザーおよび
LocalSystem として動作するサービスのみである。**Windows XP および Windows 2000:**
誰でもトレースセッションを制御できる。- **ERROR_WMI_INSTANCE_NOT_FOUND**
指定したセッションが実行されていない。- **ERROR_ACTIVE_CONNECTIONS**
EVENT_TRACE_CONTROL_STOP 呼び出しから返された場合、セッションが既に停止処理中であることを示す。

[備考]
イベントトレースコントローラが本関数を呼び出す。本関数は
[FlushTrace](/windows/win32/api/evntrace/nf-evntrace-flushtracew)、[QueryTrace](/windows/win32/api/evntrace/nf-evntrace-querytracew)、[StopTrace](/windows/win32/api/evntrace/nf-evntrace-stoptracew)、[UpdateTrace](/windows/win32/api/evntrace/nf-evntrace-updatetracew)
関数に取って代わる。> [!NOTE] > evntrace.h ヘッダは、ControlTrace を UNICODE
プリプロセッサ定数の定義に基づいて ANSI 版または Unicode
版を自動選択するエイリアスとして定義している。エンコーディング中立のエイリアスとエンコーディング中立でないコードを混在させると、コンパイルエラーや実行時エラーを引き起こす不一致が生じる可能性がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照のこと。


%index
ConvertSecurityDescriptorToStringSecurityDescriptorW
セキュリティ記述子を文字列形式に変換する。文字列形式はセキュリティ記述子の保存や送信に使用できる。(Unicode)
%group
Win32 advapi32
%prm
SecurityDescriptor, RequestedStringSDRevision, SecurityInformation, StringSecurityDescriptor, StringSecurityDescriptorLen
SecurityDescriptor : [int] 変換するセキュリティ記述子へのポインタ。セキュリティ記述子は絶対形式または自己相対形式のいずれでもよい。
RequestedStringSDRevision : [int] 出力する StringSecurityDescriptor 文字列のリビジョンレベルを指定する。現在、この値は SDDL_REVISION_1 でなければならない。
SecurityInformation : [int] 出力文字列に含めるセキュリティ記述子の構成要素を示す SECURITY_INFORMATION ビットフラグの組み合わせを指定する。BACKUP_SECURITY_INFORMATION フラグは本関数には適用されない。BACKUP_SECURITY_INFORMATION フラグを渡した場合、SecurityInformation パラメータは null 文字列出力で TRUE を返す。
StringSecurityDescriptor : [var] null 終端のセキュリティ記述子文字列へのポインタを受け取る変数へのポインタ。文字列形式の説明については「Security Descriptor String Format」を参照のこと。返されたバッファを解放するには LocalFree 関数を呼び出す。
StringSecurityDescriptorLen : [var] StringSecurityDescriptor バッファに返されるセキュリティ記述子文字列のサイズ（TCHAR 単位）を受け取る変数へのポインタ。サイズを取得する必要がない場合、このパラメータは NULL にできる。このサイズは WCHAR 単位のバッファサイズを表すものであり、文字列内の WCHAR 数ではない。
%inst
セキュリティ記述子を文字列形式に変換する。文字列形式はセキュリティ記述子の保存や送信に使用できる。(Unicode)

[戻り値]
関数が成功した場合、戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼び出す。GetLastError 関数は以下のエラーコードのいずれかを返す場合がある。
（以下省略）

[備考]
DACL が NULL で入力セキュリティ記述子に SE_DACL_PRESENT
制御ビットが設定されている場合、関数は失敗する。DACL が NULL で入力セキュリティ記述子に SE_DACL_PRESENT
制御ビットが設定されていない場合、結果のセキュリティ記述子文字列には D: コンポーネントは含まれない。詳細は「Security
Descriptor String Format」を参照のこと。
> [!NOTE] > sddl.h
ヘッダは、ConvertSecurityDescriptorToStringSecurityDescriptor を UNICODE
プリプロセッサ定数の定義に基づいて ANSI 版または Unicode
版を自動選択するエイリアスとして定義している。エンコーディング中立のエイリアスとエンコーディング中立でないコードを混在させると、コンパイルエラーや実行時エラーを引き起こす不一致が生じる可能性がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照のこと。


%index
ConvertSidToStringSidW
セキュリティ識別子 (SID) を、表示・保存・送信に適した文字列形式に変換する。(Unicode)
%group
Win32 advapi32
%prm
Sid, StringSid
Sid : [int] 変換する SID 構造体へのポインタ。
StringSid : [var] null 終端の SID 文字列へのポインタを受け取る変数へのポインタ。返されたバッファを解放するには LocalFree 関数を呼び出す。
%inst
セキュリティ識別子 (SID) を、表示・保存・送信に適した文字列形式に変換する。(Unicode)

[戻り値]
関数が成功した場合、戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼び出す。GetLastError 関数は以下のエラーコードのいずれかを返す場合がある。
（以下省略）

[備考]
ConvertSidToStringSid 関数は、SID 文字列に対する標準の S-R-I-S-S… 形式を使用する。SID
文字列表記の詳細については「SID Components」を参照のこと。
> [!NOTE] > sddl.h ヘッダは、ConvertSidToStringSid を UNICODE
プリプロセッサ定数の定義に基づいて ANSI 版または Unicode
版を自動選択するエイリアスとして定義している。エンコーディング中立のエイリアスとエンコーディング中立でないコードを混在させると、コンパイルエラーや実行時エラーを引き起こす不一致が生じる可能性がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照のこと。


%index
ConvertStringSecurityDescriptorToSecurityDescriptorW
文字列形式のセキュリティ記述子を、有効で機能的なセキュリティ記述子に変換する。(Unicode)
%group
Win32 advapi32
%prm
StringSecurityDescriptor, StringSDRevision, SecurityDescriptor, SecurityDescriptorSize
StringSecurityDescriptor : [wstr] 変換する文字列形式のセキュリティ記述子を含む null 終端文字列へのポインタ。
StringSDRevision : [int] StringSecurityDescriptor 文字列のリビジョンレベルを指定する。現在、この値は SDDL_REVISION_1 でなければならない。
SecurityDescriptor : [var] 変換されたセキュリティ記述子へのポインタを受け取る変数へのポインタ。返されるセキュリティ記述子は自己相対形式である。返されたバッファを解放するには LocalFree 関数を呼び出す。セキュリティ記述子を絶対セキュリティ記述子に変換するには MakeAbsoluteSD 関数を使用する。
SecurityDescriptorSize : [var] 変換されたセキュリティ記述子のサイズ（バイト単位）を受け取る変数へのポインタ。このパラメータは NULL にできる。
%inst
文字列形式のセキュリティ記述子を、有効で機能的なセキュリティ記述子に変換する。(Unicode)

[戻り値]
関数が成功した場合、戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼び出す。GetLastError は以下のエラーコードのいずれかを返す場合がある。
（以下省略）

[備考]
ace_type が ACCESS_ALLOWED_OBJECT_ACE_TYPE で、object_guid と
inherit_object_guid のどちらにも GUID
が指定されていない場合、ConvertStringSecurityDescriptorToSecurityDescriptor は
ace_type を ACCESS_ALLOWED_ACE_TYPE
に変換する。ace_type、object_guid、inherit_object_guid フィールドの詳細は「Ace
Strings」を参照のこと。
> [!NOTE] > sddl.h
ヘッダは、ConvertStringSecurityDescriptorToSecurityDescriptor を UNICODE
プリプロセッサ定数の定義に基づいて ANSI 版または Unicode
版を自動選択するエイリアスとして定義している。エンコーディング中立のエイリアスとエンコーディング中立でないコードを混在させると、コンパイルエラーや実行時エラーを引き起こす不一致が生じる可能性がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照のこと。


%index
ConvertStringSidToSidW
文字列形式のセキュリティ識別子 (SID) を、有効で機能的な SID に変換する。本関数を使用して、ConvertSidToStringSid 関数で文字列形式に変換された SID を取得できる。(Unicode)
%group
Win32 advapi32
%prm
StringSid, Sid
StringSid : [wstr] 変換する文字列形式の SID を含む null 終端文字列へのポインタ。
Sid : [var] 変換された SID へのポインタを受け取る変数へのポインタ。返されたバッファを解放するには LocalFree 関数を呼び出す。
%inst
文字列形式のセキュリティ識別子 (SID) を、有効で機能的な SID
に変換する。本関数を使用して、ConvertSidToStringSid 関数で文字列形式に変換された SID
を取得できる。(Unicode)

[戻り値]
関数が成功した場合、戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼び出す。GetLastError 関数は以下のエラーコードのいずれかを返す場合がある。
（以下省略）

[備考]
> [!NOTE] > sddl.h ヘッダは、ConvertStringSidToSid を UNICODE
プリプロセッサ定数の定義に基づいて ANSI 版または Unicode
版を自動選択するエイリアスとして定義している。エンコーディング中立のエイリアスとエンコーディング中立でないコードを混在させると、コンパイルエラーや実行時エラーを引き起こす不一致が生じる可能性がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照のこと。


%index
ConvertToAutoInheritPrivateObjectSecurity
セキュリティ記述子とそのアクセス制御リスト (ACL) を、継承可能なアクセス制御エントリ (ACE) の自動伝播をサポートする形式に変換する。
%group
Win32 advapi32
%prm
ParentDescriptor, CurrentSecurityDescriptor, NewSecurityDescriptor, ObjectType, IsDirectoryObject, GenericMapping
ParentDescriptor : [int] オブジェクトの親コンテナのセキュリティ記述子へのポインタ。親コンテナがない場合、このパラメータは NULL にする。
CurrentSecurityDescriptor : [int] オブジェクトの現在のセキュリティ記述子へのポインタ。
NewSecurityDescriptor : [var] 新しく割り当てられた自己相対セキュリティ記述子へのポインタを受け取る変数へのポインタ。このセキュリティ記述子を解放するために DestroyPrivateObjectSecurity 関数を呼び出すのは呼び出し側の責任である。
ObjectType : [var] CurrentSecurityDescriptor パラメータに関連付けられたオブジェクトの種類を識別する GUID 構造体へのポインタ。オブジェクトが GUID を持たない場合、このパラメータは NULL でなければならない。
IsDirectoryObject : [int] TRUE の場合、新しいオブジェクトはコンテナであり、他のオブジェクトを含むことができる。FALSE の場合、新しいオブジェクトはコンテナではない。
GenericMapping : [var] オブジェクトに対する各汎用権限から特定権限へのマッピングを指定する GENERIC_MAPPING 構造体へのポインタ。
%inst
セキュリティ記述子とそのアクセス制御リスト (ACL) を、継承可能なアクセス制御エントリ (ACE)
の自動伝播をサポートする形式に変換する。

[戻り値]
関数が成功した場合、戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼び出す。

[備考]
ConvertToAutoInheritPrivateObjectSecurity 関数は、現在のセキュリティ記述子の DACL および
SACL 内の ACE が親セキュリティ記述子から継承されたものかどうかを判定しようとする。関数は、ParentDescriptor
パラメータを CreatePrivateObjectSecurityEx 関数に渡して、継承された ACE のみを含む ACL
を取得する。次に、これらの ACE を元のセキュリティ記述子の ACE と比較して、どの元の ACE が継承されたものかを判定する。ACE
は 1 対 1 で一致する必要はない。たとえば、トラスティに読み取りと書き込みのアクセスを許可する 1 つの ACE
は、読み取りを許可する ACE と書き込みを許可する ACE の 2 つの ACE と等価である。親セキュリティ記述子から継承された
ACE と等価な元のセキュリティ記述子内の ACE はすべて、INHERITED_ACE
フラグでマークされ、新しいセキュリティ記述子に追加される。元のセキュリティ記述子内のその他すべての ACE は、非継承 ACE
として新しいセキュリティ記述子に追加される。元の DACL が継承された ACE
を持たない場合、関数は新しいセキュリティ記述子の制御ビットに SE_DACL_PROTECTED フラグを設定する。同様に、SACL
のいずれの ACE も継承されたものでない場合は SE_SACL_PROTECTED フラグが設定される。継承された ACE を持つ
DACL については、関数は ACE を 2 つのグループに並べ替える。最初のグループにはオブジェクトに直接適用された ACE
が含まれ、2 番目のグループには継承された ACE が含まれる。この順序により、非継承 ACE が継承 ACE
より優先される。詳細は「Order of ACEs in a DACL」を参照のこと。関数は新しいセキュリティ記述子の制御ビットに
SE_DACL_AUTO_INHERITED および SE_SACL_AUTO_INHERITED フラグを設定する。関数は、DACL
内のアクセス許可 ACE とアクセス拒否 ACE
の相対順序を変更しない。変更すると結果のセキュリティ記述子の意味が変わってしまうためである。意味を変えずに DACL
を変換できない場合、関数は DACL を変更しないまま SE_DACL_PROTECTED
フラグを設定する。新しいセキュリティ記述子は、元のセキュリティ記述子と同じ所有者とプライマリグループを持つ。新しいセキュリティ記述子は元のセキュリティ記述子と等価なので、呼び出し側はセキュリティ記述子を新しい形式に更新するためのアクセス権や特権を必要としない。本関数は
ACL_REVISION および ACL_REVISION_DS の ACL に対して動作する。


%index
CopySid
セキュリティ識別子 (SID) をバッファにコピーする。
%group
Win32 advapi32
%prm
nDestinationSidLength, pDestinationSid, pSourceSid
nDestinationSidLength : [int] SID のコピーを受け取るバッファの長さ（バイト単位）を指定する。
pDestinationSid : [int] ソース SID 構造体のコピーを受け取るバッファへのポインタ。
pSourceSid : [int] 本関数が pDestinationSid パラメータが指すバッファにコピーする SID 構造体へのポインタ。
%inst
セキュリティ識別子 (SID) をバッファにコピーする。

[戻り値]
関数が成功した場合、戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼び出す。

[備考]
アプリケーションは、アクセス制御エントリ (ACE) で使用するために、アクセストークン内の SID（たとえば TOKEN_GROUPS
構造体内の SID）のコピーを作成する目的で CopySid 関数を使用できる。


%index
CreatePrivateObjectSecurity
新しいプライベートオブジェクト用の自己相対セキュリティ記述子を割り当てて初期化する。保護されたサーバが新しいプライベートオブジェクトを作成する際に本関数を呼び出す。
%group
Win32 advapi32
%prm
ParentDescriptor, CreatorDescriptor, NewDescriptor, IsDirectoryObject, Token, GenericMapping
ParentDescriptor : [int] 新しいオブジェクトが作成される親ディレクトリのセキュリティ記述子へのポインタ。親ディレクトリがない場合、このパラメータは NULL にできる。
CreatorDescriptor : [int] オブジェクトの作成者が提供するセキュリティ記述子へのポインタ。オブジェクトの作成者が新しいオブジェクト用のセキュリティ情報を明示的に渡さない場合、このパラメータは NULL にすることを想定している。
NewDescriptor : [var] 新しく割り当てられた自己相対セキュリティ記述子へのポインタを受け取る変数へのポインタ。このセキュリティ記述子を解放するために呼び出し側は DestroyPrivateObjectSecurity 関数を呼び出す必要がある。
IsDirectoryObject : [int] 新しいオブジェクトがコンテナであるかどうかを指定する。TRUE の場合、オブジェクトはディレクトリなどの他のオブジェクトを含むことを示す。
Token : [intptr] オブジェクトが作成される代理となるクライアントプロセスのアクセストークンへのハンドル。これが偽装トークンである場合、SecurityIdentification レベル以上でなければならない。SecurityIdentification 偽装レベルの完全な説明については、SECURITY_IMPERSONATION_LEVEL 列挙型を参照のこと。
GenericMapping : [var] オブジェクトに対する各汎用権限から特定権限へのマッピングを指定する GENERIC_MAPPING 構造体へのポインタ。
%inst

新しいプライベートオブジェクト用の自己相対セキュリティ記述子を割り当てて初期化する。保護されたサーバが新しいプライベートオブジェクトを作成する際に本関数を呼び出す。

[戻り値]
関数が成功した場合、戻り値は 0 以外となる。
関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには GetLastError を呼び出す。

[備考]
CreatorDescriptor パラメータで指定した SECURITY_DESCRIPTOR にシステムアクセス制御リスト
(SACL) が指定されている場合、Token パラメータは SE_SECURITY_NAME
特権を有効にしていなければならない。CreatePrivateObjectSecurity
関数はこの特権をチェックし、処理中に監査を生成する可能性がある。


%index
CreatePrivateObjectSecurityEx
本関数を呼び出すリソースマネージャが作成する新しいプライベートオブジェクトのための自己相対セキュリティ記述子を割り当てて初期化する。(CreatePrivateObjectSecurityEx)
%group
Win32 advapi32
%prm
ParentDescriptor, CreatorDescriptor, NewDescriptor, ObjectType, IsContainerObject, AutoInheritFlags, Token, GenericMapping
ParentDescriptor : [int] オブジェクトの親コンテナのセキュリティ記述子へのポインタ。親コンテナがない場合、このパラメータは NULL にする。
CreatorDescriptor : [int] オブジェクトの作成者が提供するセキュリティ記述子へのポインタ。オブジェクトの作成者が新しいオブジェクト用のセキュリティ情報を明示的に渡さない場合、このパラメータは NULL にできる。あるいは、このパラメータは既定のセキュリティ記述子を指すこともできる。
NewDescriptor : [var] 新しく割り当てられた自己相対セキュリティ記述子へのポインタを受け取る変数へのポインタ。セキュリティ記述子の使用を終えたら、DestroyPrivateObjectSecurity 関数を呼び出して解放する。
ObjectType : [var] NewDescriptor に関連付けられたオブジェクトの種類を識別する GUID 構造体へのポインタ。オブジェクトが GUID を持たない場合、ObjectType を NULL に設定する。
IsContainerObject : [int] 新しいオブジェクトが他のオブジェクトを含めるかどうかを指定する。TRUE は新しいオブジェクトがコンテナであることを示し、FALSE は新しいオブジェクトがコンテナでないことを示す。
AutoInheritFlags : [int] 
Token : [intptr] オブジェクトが作成される代理となるクライアントプロセスのアクセストークンへのハンドル。これが偽装トークンである場合、SecurityIdentification レベル以上でなければならない。SecurityIdentification 偽装レベルの完全な説明については、SECURITY_IMPERSONATION_LEVEL 列挙型を参照のこと。
GenericMapping : [var] オブジェクトに対する各汎用権限から特定権限へのマッピングを指定する GENERIC_MAPPING 構造体へのポインタ。
%inst

本関数を呼び出すリソースマネージャが作成する新しいプライベートオブジェクトのための自己相対セキュリティ記述子を割り当てて初期化する。(CreatePrivateObjectSecurityEx)

[戻り値]
関数が成功した場合、戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼び出す。拡張エラーコードとその意味の一部を次の表に示す。
（以下省略）

[備考]
CreatePrivateObjectSecurity 関数は、ObjectType を NULL、AutoInheritFlags を
0 に設定して CreatePrivateObjectSecurityEx 関数を呼び出すのと同一である。AutoInheritFlags
パラメータは、SECURITY_DESCRIPTOR 構造体の Control
メンバ内の類似名のビットとは異なる。制御ビットの説明については SECURITY_DESCRIPTOR_CONTROL
を参照のこと。AutoInheritFlags が SEF_DACL_AUTO_INHERIT
ビットを指定している場合、関数は新しいセキュリティ記述子内の DACL に以下のルールを適用する:
（以下省略）


%index
CreatePrivateObjectSecurityWithMultipleInheritance
本関数を呼び出すリソースマネージャが作成する新しいプライベートオブジェクトのための自己相対セキュリティ記述子を割り当てて初期化する。(CreatePrivateObjectSecurityWithMultipleInheritance)
%group
Win32 advapi32
%prm
ParentDescriptor, CreatorDescriptor, NewDescriptor, ObjectTypes, GuidCount, IsContainerObject, AutoInheritFlags, Token, GenericMapping
ParentDescriptor : [int] オブジェクトの親コンテナのセキュリティ記述子へのポインタ。親コンテナがない場合、このパラメータは NULL にする。
CreatorDescriptor : [int] オブジェクトの作成者が提供するセキュリティ記述子へのポインタ。オブジェクトの作成者が新しいオブジェクト用のセキュリティ情報を明示的に渡さない場合、このパラメータは NULL にできる。あるいは、このパラメータは既定のセキュリティ記述子を指すこともできる。
NewDescriptor : [var] 新しく割り当てられた自己相対セキュリティ記述子へのポインタを受け取る変数へのポインタ。セキュリティ記述子の使用を終えたら、DestroyPrivateObjectSecurity 関数を呼び出して解放する。
ObjectTypes : [var] NewDescriptor に関連付けられたオブジェクトのオブジェクト型またはクラスを識別する GUID 構造体へのポインタの配列。Active Directory オブジェクトの場合、この配列にはオブジェクトの構造クラスとアタッチされているすべての補助クラスのクラス GUID へのポインタが含まれる。オブジェクトが GUID を持たない場合、ObjectTypes を NULL に設定する。
GuidCount : [int] ObjectTypes パラメータに存在する GUID の数。
IsContainerObject : [int] 新しいオブジェクトが他のオブジェクトを含めるかどうかを指定する。TRUE は新しいオブジェクトがコンテナであることを示し、FALSE は新しいオブジェクトがコンテナでないことを示す。
AutoInheritFlags : [int] 
Token : [intptr] オブジェクトが作成される代理となるクライアントプロセスのアクセストークンへのハンドル。これが偽装トークンである場合、SecurityIdentification レベル以上でなければならない。SecurityIdentification 偽装レベルの完全な説明については、SECURITY_IMPERSONATION_LEVEL 列挙型を参照のこと。
GenericMapping : [var] オブジェクトに対する各汎用権限から特定権限へのマッピングを指定する GENERIC_MAPPING 構造体へのポインタ。
%inst

本関数を呼び出すリソースマネージャが作成する新しいプライベートオブジェクトのための自己相対セキュリティ記述子を割り当てて初期化する。(CreatePrivateObjectSecurityWithMultipleInheritance)

[戻り値]
関数が成功した場合、戻り値は 0 以外の値となる。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼び出す。拡張エラーコードとその意味の一部を次の表に示す。
（以下省略）

[備考]
CreatePrivateObjectSecurityEx 関数は、ObjectTypes に単一の GUID を指定して
CreatePrivateObjectSecurityWithMultipleInheritance
関数を呼び出すのと同一である。AutoInheritFlags は、SECURITY_DESCRIPTOR 構造体の Control
メンバ内の類似名のビットとは異なる。制御ビットの説明については SECURITY_DESCRIPTOR_CONTROL
を参照のこと。AutoInheritFlags が SEF_DACL_AUTO_INHERIT
ビットを指定している場合、関数は新しいセキュリティ記述子内の DACL に以下のルールを適用する:
（以下省略）


%index
CreateProcessWithLogonW
新しいプロセスとそのプライマリスレッドを作成する。次に、新しいプロセスは指定した資格情報（ユーザー、ドメイン、パスワード）のセキュリティコンテキストで指定した実行可能ファイルを実行する。任意で指定したユーザーのユーザープロファイルを読み込むこともできる。
%group
Win32 advapi32
%prm
lpUsername, lpDomain, lpPassword, dwLogonFlags, lpApplicationName, lpCommandLine, dwCreationFlags, lpEnvironment, lpCurrentDirectory, lpStartupInfo, lpProcessInformation
lpUsername : [wstr] ユーザーの名前。ログオンするユーザーアカウントの名前である。UPN 形式 user@DNS_domain_name を使用する場合、lpDomain パラメータは NULL でなければならない。
lpDomain : [wstr] lpUsername アカウントを含むアカウントデータベースを持つドメインまたはサーバの名前。このパラメータが NULL の場合、ユーザー名は UPN 形式で指定する必要がある。
lpPassword : [wstr] lpUsername アカウントの平文パスワード。
dwLogonFlags : [int] 
lpApplicationName : [wstr] 実行するモジュールの名前。このモジュールは Windows ベースのアプリケーションでもよい。ローカルコンピュータで適切なサブシステムが利用可能であれば、MS-DOS や OS/2 などの他の種類のモジュールでもよい。
lpCommandLine : [wstr] 実行するコマンドライン。この文字列の最大長は 1024 文字である。lpApplicationName が NULL の場合、lpCommandLine のモジュール名部分は MAX_PATH 文字に制限される。関数はこの文字列の内容を変更することがある。したがって、このパラメータは読み取り専用メモリ（const 変数やリテラル文字列など）へのポインタであってはならない。このパラメータが定数文字列の場合、関数はアクセス違反を引き起こすことがある。lpCommandLine パラメータは NULL にでき、その場合、関数は lpApplicationName が指す文字列をコマンドラインとして使用する。lpApplicationName と lpCommandLine が両方とも NULL でない場合、*lpApplicationName が実行するモジュールを指定し、*lpCommandLine がコマンドラインを指定する。新しいプロセスは GetCommandLine を使用してコマンドライン全体を取得できる。C で書かれたコンソールプロセスは argc と argv 引数を使ってコマンドラインを解析できる。argv[0] はモジュール名であるため、C プログラマは通常コマンドラインの最初のトークンとしてモジュール名を繰り返す。lpApplicationName が NULL の場合、コマンドラインの最初の空白区切りトークンがモジュール名を指定する。空白を含む長いファイル名を使用する場合は、ファイル名の終わりと引数の始まりを示すために引用符で囲む（lpApplicationName パラメータの説明を参照）。ファイル名に拡張子が含まれない場合、.exe が付加される。したがって、ファイル名の拡張子が .com の場合、このパラメータには .com 拡張子を含める必要がある。拡張子のないピリオドで終わるファイル名、またはパスを含むファイル名の場合、.exe は付加されない。ファイル名にディレクトリパスが含まれない場合、システムは以下の順序で実行可能ファイルを検索する:
dwCreationFlags : [int] プロセスの作成方法を制御するフラグ。既定で CREATE_DEFAULT_ERROR_MODE、CREATE_NEW_CONSOLE、CREATE_NEW_PROCESS_GROUP フラグが有効になっている。値の一覧は「Process Creation Flags」を参照のこと。
lpEnvironment : [intptr] 新しいプロセスの環境ブロックへのポインタ。このパラメータが NULL の場合、新しいプロセスは lpUsername で指定したユーザーのプロファイルから作成された環境を使用する。
lpCurrentDirectory : [wstr] プロセスの現在のディレクトリへのフルパス。UNC パスも指定できる。このパラメータが NULL の場合、新しいプロセスは呼び出し元プロセスと同じ現在のドライブとディレクトリを持つ。この機能は主に、アプリケーションを起動して初期のドライブと作業ディレクトリを指定する必要があるシェルのために提供されている。
lpStartupInfo : [var] STARTUPINFO 構造体へのポインタ。
lpProcessInformation : [var] プロセスへのハンドルを含む、新しいプロセスの識別情報を受け取る PROCESS_INFORMATION 構造体へのポインタ。
%inst

新しいプロセスとそのプライマリスレッドを作成する。次に、新しいプロセスは指定した資格情報（ユーザー、ドメイン、パスワード）のセキュリティコンテキストで指定した実行可能ファイルを実行する。任意で指定したユーザーのユーザープロファイルを読み込むこともできる。

[戻り値]
関数が成功した場合、戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0（ゼロ）となる。拡張エラー情報を取得するには
GetLastError を呼び出す。関数はプロセスの初期化が完了する前に復帰することに注意。必要な DLL
が見つからないか初期化に失敗した場合、プロセスは終了される。プロセスの終了ステータスを取得するには GetExitCodeProcess
を呼び出す。

[備考]
既定では、CreateProcessWithLogonW は指定したユーザープロファイルを HKEY_USERS
レジストリキーに読み込まない。つまり、HKEY_CURRENT_USER
レジストリキー内の情報へのアクセスは、通常のインタラクティブログオンと整合しない結果をもたらすことがある。CreateProcessWithLogonW
を呼び出す前に、LOGON_WITH_PROFILE を使用するか LoadUserProfile
関数を呼び出してユーザーレジストリハイブを HKEY_USERS に読み込むのは呼び出し側の責任である。lpEnvironment
パラメータが NULL の場合、新しいプロセスは lpUserName
で指定したユーザーのプロファイルから作成された環境ブロックを使用する。HOMEDRIVE および HOMEPATH
変数が設定されていない場合、CreateProcessWithLogonW
は環境ブロックを変更してユーザーの作業ディレクトリのドライブとパスを使用する。作成されると、新しいプロセスとスレッドハンドルは完全なアクセス権
(PROCESS_ALL_ACCESS および THREAD_ALL_ACCESS)
を受け取る。いずれのハンドルについても、セキュリティ記述子が提供されない場合、ハンドルはその種類のオブジェクトハンドルを必要とする任意の関数で使用できる。セキュリティ記述子が提供された場合、アクセスが許可される前に、ハンドルの後続のすべての使用に対してアクセスチェックが実行される。アクセスが拒否されると、要求元プロセスはハンドルを使用してプロセスまたはスレッドへのアクセスを得ることができない。セキュリティトークンを取得するには、PROCESS_INFORMATION
構造体内のプロセスハンドルを OpenProcessToken
関数に渡す。プロセスにはプロセス識別子が割り当てられる。識別子はプロセスが終了するまで有効である。プロセスの識別、または
OpenProcess
関数でプロセスへのハンドルを開くために指定できる。プロセスの初期スレッドにもスレッド識別子が割り当てられる。OpenThread
関数でスレッドへのハンドルを開くために指定できる。識別子はスレッドが終了するまで有効で、システム内でスレッドを一意に識別するのに使用できる。これらの識別子は
PROCESS_INFORMATION
で返される。呼び出し元スレッドは、新しいプロセスが初期化を完了し入力保留なしでユーザー入力を待機する状態になるまで待つために
WaitForInputIdle 関数を使用できる。これは親プロセスと子プロセス間の同期に便利である。なぜなら
CreateProcessWithLogonW
は新しいプロセスが初期化を完了するのを待たずに復帰するからである。たとえば、作成元プロセスは新しいプロセスに関連付けられたウィンドウを見つけようとする前に
WaitForInputIdle を使用する。プロセスをシャットダウンする推奨方法は ExitProcess
関数を使用することである。なぜならこの関数はプロセスにアタッチされているすべての DLL
に終了の接近を通知するからである。プロセスをシャットダウンする他の手段はアタッチされた DLL に通知しない。スレッドが
ExitProcess を呼び出すと、プロセスの他のスレッドは（アタッチされた DLL
のスレッド終了コードを含む）追加コードを実行する機会なしに終了されることに注意。詳細は「Terminating a
Process」を参照のこと。CreateProcessWithLogonW
は対象ユーザーのセキュリティコンテキストで指定したディレクトリと実行可能イメージにアクセスする。実行可能イメージがネットワーク上にありパスにネットワークドライブ文字が指定されている場合、ネットワークドライブ文字はログオンごとに割り当てられるため、対象ユーザーには利用できない。ネットワークドライブ文字を指定している場合、本関数は失敗する。実行可能イメージがネットワーク上にある場合は
UNC パスを使用する。本関数で同時に作成して実行できる子プロセスの数には制限がある。たとえば Windows XP ではこの制限は
MAXIMUM_WAIT_OBJECTS*4
である。しかし、システム全体のクォータ制限により、これだけの数のプロセスを作成できない場合がある。Windows XP
SP2、Windows Server 2003 以降: "LocalSystem" アカウントで実行されているプロセスからは
CreateProcessWithLogonW を呼び出せない。これは、本関数が呼び出し元トークン内のログオン SID
を使用し、"LocalSystem" アカウントのトークンにはこの SID
が含まれないためである。代替として、CreateProcessAsUser および LogonUser
関数を使用する。この関数を使用するアプリケーションをコンパイルするには、_WIN32_WINNT を 0x0500
以上に定義する。詳細は「Using the Windows Headers」を参照のこと。セキュリティに関する注意事項
lpApplicationName パラメータは NULL にでき、その場合は実行可能名が lpCommandLine
内で最初の空白区切り文字列でなければならない。実行可能ファイルやパス名に空白が含まれると、関数が空白を解析する方法のために別の実行可能ファイルが実行されるリスクがある。関数は
"MyApp.exe" の代わりに "Program.exe" が存在すればそれを実行しようとするため、以下の例は避けること。
（以下省略）


%index
CreateProcessWithTokenW
新しいプロセスとそのプライマリスレッドを作成する。新しいプロセスは、指定したトークンのセキュリティコンテキストで動作する。任意で指定したユーザーのユーザープロファイルを読み込むこともできる。
%group
Win32 advapi32
%prm
hToken, dwLogonFlags, lpApplicationName, lpCommandLine, dwCreationFlags, lpEnvironment, lpCurrentDirectory, lpStartupInfo, lpProcessInformation
hToken : [intptr] ユーザーを表すプライマリトークンへのハンドル。ハンドルは TOKEN_QUERY、TOKEN_DUPLICATE、TOKEN_ASSIGN_PRIMARY アクセス権を持っている必要がある。詳細は「Access Rights for Access-Token Objects」を参照のこと。トークンが表すユーザーは、lpApplicationName または lpCommandLine パラメータで指定されたアプリケーションに対して読み取りおよび実行アクセス権を持っている必要がある。
dwLogonFlags : [int] 
lpApplicationName : [wstr] 実行するモジュールの名前。このモジュールは Windows ベースのアプリケーションでもよい。ローカルコンピュータで適切なサブシステムが利用可能であれば、MS-DOS や OS/2 などの他の種類のモジュールでもよい。
lpCommandLine : [wstr] 実行するコマンドライン。
dwCreationFlags : [int] プロセスの作成方法を制御するフラグ。既定で CREATE_DEFAULT_ERROR_MODE、CREATE_NEW_CONSOLE、CREATE_NEW_PROCESS_GROUP フラグが有効になっている。値の一覧は「Process Creation Flags」を参照のこと。
lpEnvironment : [intptr] 新しいプロセスの環境ブロックへのポインタ。このパラメータが NULL の場合、新しいプロセスは lpUsername で指定したユーザーのプロファイルから作成された環境を使用する。
lpCurrentDirectory : [wstr] プロセスの現在のディレクトリへのフルパス。UNC パスも指定できる。このパラメータが NULL の場合、新しいプロセスは呼び出し元プロセスと同じ現在のドライブとディレクトリを持つ。（この機能は主に、アプリケーションを起動して初期のドライブと作業ディレクトリを指定する必要があるシェルのために提供されている。）
lpStartupInfo : [var] STARTUPINFO または STARTUPINFOEX 構造体へのポインタ。
lpProcessInformation : [var] プロセスへのハンドルを含む、新しいプロセスの識別情報を受け取る PROCESS_INFORMATION 構造体へのポインタ。
%inst

新しいプロセスとそのプライマリスレッドを作成する。新しいプロセスは、指定したトークンのセキュリティコンテキストで動作する。任意で指定したユーザーのユーザープロファイルを読み込むこともできる。

[戻り値]
関数が成功した場合、戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼び出す。関数はプロセスの初期化が完了する前に復帰することに注意。必要な DLL
が見つからないか初期化に失敗した場合、プロセスは終了される。プロセスの終了ステータスを取得するには GetExitCodeProcess
を呼び出す。

[備考]
既定では、CreateProcessWithTokenW は指定したユーザーのプロファイルを HKEY_USERS
レジストリキーに読み込まない。つまり、HKEY_CURRENT_USER
レジストリキー内の情報へのアクセスは、通常のインタラクティブログオンと整合しない結果をもたらすことがある。本関数を呼び出す前に、LOGON_WITH_PROFILE
を使用するか LoadUserProfile 関数を呼び出してユーザーのレジストリハイブを HKEY_USERS
に読み込むのは呼び出し側の責任である。lpEnvironment パラメータが NULL の場合、新しいプロセスは lpUserName
で指定したユーザーのプロファイルから作成された環境ブロックを使用する。HOMEDRIVE および HOMEPATH
変数が設定されていない場合、CreateProcessWithTokenW
は環境ブロックを変更してユーザーの作業ディレクトリのドライブとパスを使用する。作成されると、新しいプロセスとスレッドハンドルは完全なアクセス権
(PROCESS_ALL_ACCESS および THREAD_ALL_ACCESS)
を受け取る。いずれのハンドルについても、セキュリティ記述子が提供されない場合、ハンドルはその種類のオブジェクトハンドルを必要とする任意の関数で使用できる。セキュリティ記述子が提供された場合、アクセスが許可される前に、ハンドルの後続のすべての使用に対してアクセスチェックが実行される。アクセスが拒否されると、要求元プロセスはハンドルを使用してプロセスまたはスレッドへのアクセスを得ることができない。セキュリティトークンを取得するには、PROCESS_INFORMATION
構造体内のプロセスハンドルを OpenProcessToken
関数に渡す。プロセスにはプロセス識別子が割り当てられる。識別子はプロセスが終了するまで有効である。プロセスの識別、または
OpenProcess
関数でプロセスへのハンドルを開くために指定できる。プロセスの初期スレッドにもスレッド識別子が割り当てられる。OpenThread
関数でスレッドへのハンドルを開くために指定できる。識別子はスレッドが終了するまで有効で、システム内でスレッドを一意に識別するのに使用できる。これらの識別子は
PROCESS_INFORMATION
で返される。呼び出し元スレッドは、新しいプロセスが初期化を完了し入力保留なしでユーザー入力を待機する状態になるまで待つために
WaitForInputIdle 関数を使用できる。これは親プロセスと子プロセス間の同期に便利である。なぜなら
CreateProcessWithTokenW
は新しいプロセスが初期化を完了するのを待たずに復帰するからである。たとえば、作成元プロセスは新しいプロセスに関連付けられたウィンドウを見つけようとする前に
WaitForInputIdle を使用する。プロセスをシャットダウンする推奨方法は ExitProcess
関数を使用することである。なぜならこの関数はプロセスにアタッチされているすべての DLL
に終了の接近を通知するからである。プロセスをシャットダウンする他の手段はアタッチされた DLL に通知しない。スレッドが
ExitProcess を呼び出すと、プロセスの他のスレッドは（アタッチされた DLL
のスレッド終了コードを含む）追加コードを実行する機会なしに終了されることに注意。詳細は「Terminating a
Process」を参照のこと。この関数を使用するアプリケーションをコンパイルするには、_WIN32_WINNT を 0x0500
以上に定義する。詳細は「Using the Windows Headers」を参照のこと。セキュリティに関する注意事項
lpApplicationName パラメータは NULL にでき、その場合は実行可能名が lpCommandLine
内で最初の空白区切り文字列でなければならない。実行可能ファイルやパス名に空白が含まれると、関数が空白を解析する方法のために別の実行可能ファイルが実行されるリスクがある。次の例は危険である。なぜなら関数は
"MyApp.exe" の代わりに "Program.exe" が存在すればそれを実行しようとするからである。
（以下省略）


%index
CreateRestrictedToken
既存のアクセストークンの制限付きバージョンである新しいアクセストークンを作成する。制限付きトークンは、無効化されたセキュリティ識別子 (SID)、削除された特権、制限する SID のリストを持つことができる。
%group
Win32 advapi32
%prm
ExistingTokenHandle, Flags, DisableSidCount, SidsToDisable, DeletePrivilegeCount, PrivilegesToDelete, RestrictedSidCount, SidsToRestrict, NewTokenHandle
ExistingTokenHandle : [intptr] プライマリトークンまたは偽装トークンへのハンドル。トークンは制限付きトークンでもよい。ハンドルは対象のトークンに対する TOKEN_DUPLICATE アクセス権を持っている必要がある。
Flags : [int] 
DisableSidCount : [int] SidsToDisable 配列の要素数を指定する。
SidsToDisable : [var] 制限付きトークン内の拒否のみ SID を指定する SID_AND_ATTRIBUTES 構造体の配列へのポインタ。システムは、セキュリティ保護可能オブジェクトへのアクセスを拒否するために拒否のみ SID を使用する。拒否のみ SID がないことがアクセスを許可するわけではない。
DeletePrivilegeCount : [int] PrivilegesToDelete 配列の要素数を指定する。
PrivilegesToDelete : [var] 制限付きトークンで削除する特権を指定する LUID_AND_ATTRIBUTES 構造体の配列へのポインタ。
RestrictedSidCount : [int] SidsToRestrict 配列の要素数を指定する。
SidsToRestrict : [var] 新しいトークンの制限する SID のリストを指定する SID_AND_ATTRIBUTES 構造体の配列へのポインタ。既存のトークンが制限付きトークンである場合、新しいトークンの制限する SID のリストは、この配列と既存のトークンの制限する SID のリストの共通部分となる。SidsToRestrict パラメータに配置された重複 SID を削除するチェックは行われない。重複 SID を使用すると、制限付きトークンが制限する SID リスト内に冗長な情報を持つことが可能である。
NewTokenHandle : [intptr] 新しい制限付きトークンへのハンドルを受け取る変数へのポインタ。このハンドルは ExistingTokenHandle と同じアクセス権を持つ。新しいトークンは既存のトークンと同じ種別（プライマリまたは偽装）である。NewTokenHandle で返されるハンドルは複製可能である。
%inst
既存のアクセストークンの制限付きバージョンである新しいアクセストークンを作成する。制限付きトークンは、無効化されたセキュリティ識別子
(SID)、削除された特権、制限する SID のリストを持つことができる。

[戻り値]
関数が成功した場合、戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼び出す。

[備考]
CreateRestrictedToken 関数は、以下の方法でトークンを制限できる:
（以下省略）


%index
CreateServiceW
サービスオブジェクトを作成し、指定したサービス制御マネージャデータベースに追加する。(Unicode)
%group
Win32 advapi32
%prm
hSCManager, lpServiceName, lpDisplayName, dwDesiredAccess, dwServiceType, dwStartType, dwErrorControl, lpBinaryPathName, lpLoadOrderGroup, lpdwTagId, lpDependencies, lpServiceStartName, lpPassword
hSCManager : [intptr] サービス制御マネージャデータベースへのハンドル。このハンドルは OpenSCManager 関数が返すもので、SC_MANAGER_CREATE_SERVICE アクセス権を持っている必要がある。詳細は「Service Security and Access Rights」を参照のこと。
lpServiceName : [wstr] インストールするサービスの名前。文字列の最大長は 256 文字である。サービス制御マネージャデータベースは文字の大文字小文字を保持するが、サービス名の比較は常に大文字小文字を区別しない。スラッシュ (/) とバックスラッシュ (\\) は有効なサービス名文字ではない。
lpDisplayName : [wstr] サービスを識別するためにユーザーインターフェイスプログラムが使用する表示名。この文字列の最大長は 256 文字である。名前はサービス制御マネージャ内で大文字小文字が保持される。表示名の比較は常に大文字小文字を区別しない。
dwDesiredAccess : [int] サービスへのアクセス。要求されたアクセスを許可する前に、システムは呼び出し元プロセスのアクセストークンをチェックする。値の一覧は「Service Security and Access Rights」を参照のこと。
dwServiceType : [int] 
dwStartType : [int] 
dwErrorControl : [int] 
lpBinaryPathName : [wstr] サービスバイナリファイルへの完全修飾パス。パスに空白が含まれる場合、正しく解釈されるように引用符で囲む必要がある。たとえば "d:\\my share\\myservice.exe" は "\"d:\\my share\\myservice.exe\"" のように指定する。
lpLoadOrderGroup : [wstr] このサービスがメンバとなっているロード順序グループの名前。サービスがグループに属さない場合は NULL または空文字列を指定する。
lpdwTagId : [var] lpLoadOrderGroup パラメータで指定したグループ内で一意となるタグ値を受け取る変数へのポインタ。既存のタグを変更しない場合は NULL を指定する。
lpDependencies : [wstr] このサービスより前にシステムが起動しなければならないサービスまたはロード順序グループの、null 区切りの名前からなる二重 null 終端配列へのポインタ。サービスに依存関係がない場合は NULL または空文字列を指定する。グループへの依存は、グループのすべてのメンバを開始しようとした後に少なくとも 1 つのメンバが動作していれば、このサービスが動作できることを意味する。
lpServiceStartName : [wstr] サービスが動作するアカウントの名前。サービス種別が SERVICE_WIN32_OWN_PROCESS の場合、DomainName\UserName 形式のアカウント名を使用する。サービスプロセスはこのユーザーとしてログオンされる。アカウントが組み込みドメインに属する場合は .\UserName を指定できる。
lpPassword : [wstr] lpServiceStartName パラメータで指定したアカウント名のパスワード。アカウントにパスワードがない場合や、サービスが LocalService、NetworkService、または LocalSystem アカウントで動作する場合は空文字列を指定する。詳細は「Service Record List」を参照のこと。
%inst
サービスオブジェクトを作成し、指定したサービス制御マネージャデータベースに追加する。(Unicode)

[戻り値]
関数が成功した場合、戻り値はサービスへのハンドルとなる。関数が失敗した場合、戻り値は NULL となる。拡張エラー情報を取得するには
GetLastError
を呼び出す。以下のエラーコードがサービス制御マネージャによって設定される場合がある。そのほかのエラーコードは、サービス制御マネージャが呼び出すレジストリ関数によって設定される場合がある。
（以下省略）

[備考]
CreateService
関数はサービスオブジェクトを作成し、以下のレジストリキーの下にサービスと同じ名前のキーを作成することで、サービス制御マネージャデータベースにインストールする:
HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services
CreateService、ChangeServiceConfig、ChangeServiceConfig2
で指定した情報は、このキーの下の値として保存される。サービスに対して格納される値の例を以下に示す。
（以下省略）


%index
CreateWellKnownSid
定義済みエイリアスの SID を作成する。
%group
Win32 advapi32
%prm
WellKnownSidType, DomainSid, pSid, cbSid
WellKnownSidType : [int] SID が識別する対象を指定する WELL_KNOWN_SID_TYPE 列挙型のメンバ。
DomainSid : [int] SID を作成する際に使用するドメインを識別する SID へのポインタ。ローカルコンピュータを使用するには NULL を渡す。
pSid : [int] CreateWellKnownSid が新しい SID を格納するメモリへのポインタ。
cbSid : [var] pSid で利用可能なバイト数を含む DWORD へのポインタ。CreateWellKnownSid 関数は、実際に使用したバイト数をこの場所に格納する。
%inst
定義済みエイリアスの SID を作成する。

[戻り値]
関数が成功した場合、戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼び出す。


%index
CredDeleteW
ユーザーの資格情報セットから資格情報を削除する。(Unicode)
%group
Win32 advapi32
%prm
TargetName, Type, Flags
TargetName : [wstr] 削除する資格情報の名前を含む null 終端文字列へのポインタ。
Type : [int] 削除する資格情報の種類。CRED_TYPE_* 定義済み型のいずれかでなければならない。定義済み型の一覧については、CREDENTIAL 構造体の Type メンバを参照のこと。このパラメータの値が CRED_TYPE_DOMAIN_EXTENDED の場合、本関数は同じターゲットに対して複数の資格情報が存在するときにユーザー名を指定する資格情報を削除できる。TargetName パラメータの値は Target|UserName としてユーザー名を指定する必要がある。
Flags : [int] 予約済みで、0 でなければならない。
%inst
ユーザーの資格情報セットから資格情報を削除する。(Unicode)

[戻り値]
関数は成功時に TRUE、失敗時に FALSE を返す。より具体的なステータスコードを取得するには GetLastError
関数を呼び出す。以下のステータスコードが返される可能性がある。
（以下省略）

[備考]
> [!NOTE] > wincred.h ヘッダは、CredDelete を UNICODE プリプロセッサ定数の定義に基づいて
ANSI 版または Unicode
版を自動選択するエイリアスとして定義している。エンコーディング中立のエイリアスとエンコーディング中立でないコードを混在させると、コンパイルエラーや実行時エラーを引き起こす不一致が生じる可能性がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照のこと。


%index
CredEnumerateW
ユーザーの資格情報セットから資格情報を列挙する。(Unicode)
%group
Win32 advapi32
%prm
Filter, Flags, Count, Credential
Filter : [wstr] 返される資格情報のフィルタを含む null 終端文字列へのポインタ。フィルタに一致する TargetName を持つ資格情報のみが返される。フィルタは名前プレフィックスの後にアスタリスクを付けて指定する。たとえば、フィルタ "FRED*" は "FRED" で始まる TargetName を持つすべての資格情報を返す。
Flags : [int] 
Count : [var] Credentials 配列で返される資格情報の数。
Credential : [var] 資格情報へのポインタの配列へのポインタ。返される資格情報は単一の割り当てブロックである。バッファ内に含まれるポインタはすべてこの単一の割り当てブロック内の位置へのポインタである。返される単一のバッファは CredFree を呼び出して解放する必要がある。
%inst
ユーザーの資格情報セットから資格情報を列挙する。(Unicode)

[戻り値]
関数は成功時に TRUE、失敗時に FALSE を返す。より具体的なステータスコードを取得するには GetLastError
関数を呼び出す。以下のステータスコードが返される可能性がある。
（以下省略）

[備考]
> [!NOTE] > wincred.h ヘッダは、CredEnumerate を UNICODE プリプロセッサ定数の定義に基づいて
ANSI 版または Unicode
版を自動選択するエイリアスとして定義している。エンコーディング中立のエイリアスとエンコーディング中立でないコードを混在させると、コンパイルエラーや実行時エラーを引き起こす不一致が生じる可能性がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照のこと。


%index
CredFindBestCredentialW
資格情報管理 (CredMan) データベースを検索し、現在のログオンセッションに関連付けられていて、指定したターゲットリソースに最もよく一致する汎用資格情報のセットを取得する。(Unicode)
%group
Win32 advapi32
%prm
TargetName, Type, Flags, Credential
TargetName : [wstr] 資格情報を検索するターゲットリソースの名前を含む null 終端文字列へのポインタ。
Type : [int] 検索する資格情報の種類。現在、本関数は CRED_TYPE_GENERIC のみをサポートする。
Flags : [int] 予約済み。
Credential : [var] 本関数が検出する資格情報セットを指定する CREDENTIAL 構造体へのポインタのアドレス。この構造体の使用を終えたら CredFree 関数を呼び出して解放する。
%inst
資格情報管理 (CredMan)
データベースを検索し、現在のログオンセッションに関連付けられていて、指定したターゲットリソースに最もよく一致する汎用資格情報のセットを取得する。(Unicode)

[戻り値]
関数が成功した場合、TRUE を返す。関数が失敗した場合、FALSE を返す。拡張エラー情報を取得するには GetLastError
を呼び出す。

[備考]
> [!NOTE] > wincred.h ヘッダは、CredFindBestCredential を UNICODE
プリプロセッサ定数の定義に基づいて ANSI 版または Unicode
版を自動選択するエイリアスとして定義している。エンコーディング中立のエイリアスとエンコーディング中立でないコードを混在させると、コンパイルエラーや実行時エラーを引き起こす不一致が生じる可能性がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照のこと。


%index
CredFree
CredFree 関数は、資格情報管理関数のいずれかが返したバッファを解放する。
%group
Win32 advapi32
%prm
Buffer
Buffer : [intptr] 解放するバッファへのポインタ。
%inst
CredFree 関数は、資格情報管理関数のいずれかが返したバッファを解放する。


%index
CredGetSessionTypes
CredGetSessionTypes 関数は、現在のログオンセッションでサポートされる最大持続性を返す。各資格情報種別ごとに別個の最大持続性が返される。
%group
Win32 advapi32
%prm
MaximumPersistCount, MaximumPersist
MaximumPersistCount : [int] MaximumPersist 配列内の要素数。現在定義されているすべての資格情報種別を返すには CRED_TYPE_MAXIMUM を使用する。
MaximumPersist : [var] 持続性値を返す配列へのポインタ。渡す配列は MaximumPersistCount 要素長である必要がある。復帰時、各要素は対応する資格情報の種類でサポートされる最大持続性を指定する。呼び出し側は以下の定義のいずれかを使用して配列にインデックスを付けるべきである:
%inst
CredGetSessionTypes
関数は、現在のログオンセッションでサポートされる最大持続性を返す。各資格情報種別ごとに別個の最大持続性が返される。

[戻り値]
本関数は成功時に TRUE、失敗時に FALSE を返す。より具体的なステータスコードを取得するには GetLastError
関数を呼び出す。以下のステータスコードが返される可能性がある: ERROR_NO_SUCH_LOGON_SESSION
ログオンセッションが存在しないか、このログオンセッションに関連付けられた資格情報セットがない。ネットワークログオンセッションには関連付けられた資格情報セットがない。


%index
CredGetTargetInfoW
CredGetTargetInfo 関数は、指定した名前のターゲットコンピュータに対する既知のターゲット名情報をすべて取得する。(Unicode)
%group
Win32 advapi32
%prm
TargetName, Flags, TargetInfo
TargetName : [wstr] 情報を取得する対象のターゲットコンピュータの名前を含む null 終端文字列へのポインタ。
Flags : [int] 関数の動作を制御するフラグ。以下のフラグを使用できる:
TargetInfo : [var] ターゲット情報を含む単一の割り当てブロックバッファへのポインタ。TargetInfo の返されるメンバの少なくとも 1 つは非 NULL となる。バッファ内に含まれるポインタはすべてこの単一の割り当てブロック内の位置へのポインタである。返される単一のバッファは CredFree を呼び出して解放する必要がある。
%inst
CredGetTargetInfo
関数は、指定した名前のターゲットコンピュータに対する既知のターゲット名情報をすべて取得する。(Unicode)

[戻り値]
関数は成功時に TRUE、失敗時に FALSE を返す。より具体的なステータスコードを取得するには GetLastError
関数を呼び出す。以下のステータスコードが返される可能性がある:
（以下省略）

[備考]
> [!NOTE] > wincred.h ヘッダは、CredGetTargetInfo を UNICODE
プリプロセッサ定数の定義に基づいて ANSI 版または Unicode
版を自動選択するエイリアスとして定義している。エンコーディング中立のエイリアスとエンコーディング中立でないコードを混在させると、コンパイルエラーや実行時エラーを引き起こす不一致が生じる可能性がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照のこと。


%index
CredIsMarshaledCredentialW
指定したユーザー名文字列が以前に CredMarshalCredential によってマーシャリングされた資格情報かどうかを判定する。(Unicode)
%group
Win32 advapi32
%prm
MarshaledCredential
MarshaledCredential : [wstr] マーシャリングされた資格情報を含む null 終端文字列へのポインタ。
%inst
指定したユーザー名文字列が以前に CredMarshalCredential
によってマーシャリングされた資格情報かどうかを判定する。(Unicode)

[戻り値]
本関数は、MarshaledCredential がマーシャリングされた資格情報であれば TRUE を、そうでなければ FALSE
を返す。

[備考]
> [!NOTE] > wincred.h ヘッダは、CredIsMarshaledCredential を UNICODE
プリプロセッサ定数の定義に基づいて ANSI 版または Unicode
版を自動選択するエイリアスとして定義している。エンコーディング中立のエイリアスとエンコーディング中立でないコードを混在させると、コンパイルエラーや実行時エラーを引き起こす不一致が生じる可能性がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照のこと。


%index
CredIsProtectedW
指定した資格情報が、以前に呼び出された CredProtect 関数によって暗号化されているかどうかを示す。(Unicode)
%group
Win32 advapi32
%prm
pszProtectedCredentials, pProtectionType
pszProtectedCredentials : [wstr] テストする資格情報を指定する null 終端文字列へのポインタ。
pProtectionType : [var] pszProtectedCredentials パラメータで指定した資格情報が保護されているかどうかを指定する CRED_PROTECTION_TYPE 列挙型の値へのポインタ。
%inst
指定した資格情報が、以前に呼び出された CredProtect 関数によって暗号化されているかどうかを示す。(Unicode)

[戻り値]
関数が成功した場合は TRUE、それ以外の場合は FALSE。拡張エラー情報を取得するには GetLastError 関数を呼び出す。

[備考]
> [!NOTE] > wincred.h ヘッダは、CredIsProtected を UNICODE
プリプロセッサ定数の定義に基づいて ANSI 版または Unicode
版を自動選択するエイリアスとして定義している。エンコーディング中立のエイリアスとエンコーディング中立でないコードを混在させると、コンパイルエラーや実行時エラーを引き起こす不一致が生じる可能性がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照のこと。


%index
CredMarshalCredentialW
CredMarshalCredential 関数は、資格情報をテキスト文字列に変換する。(Unicode)
%group
Win32 advapi32
%prm
CredType, Credential, MarshaledCredential
CredType : [int] マーシャリングする資格情報の型。
Credential : [intptr] マーシャリングする資格情報。
MarshaledCredential : [var] マーシャリング済み資格情報を格納する、null 終端文字列へのポインタ。呼び出し側は返されたバッファを CredFree を使用して解放する必要がある。
%inst
CredMarshalCredential 関数は、資格情報をテキスト文字列に変換する。(Unicode)

[戻り値]
この関数は成功時に TRUE、失敗時に FALSE を返す。より詳細なステータスコードを取得するには GetLastError
関数を呼び出す。以下のステータスコードが返される可能性がある。ERROR_INVALID_PARAMETER: CredType
が有効ではない。

[備考]
> [!NOTE] > wincred.h ヘッダーは CredMarshalCredential
をエイリアスとして定義しており、UNICODE プリプロセッサ定数の定義に応じて、この関数の ANSI 版と Unicode
版を自動的に選択する。エンコーディングに依存しないエイリアスと、エンコーディングに依存しないコードとを混在させると、コンパイルエラーや実行時エラーを引き起こす不整合が生じる可能性がある。詳細は
[関数プロトタイプの規約](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
CredProtectW
指定した資格情報を、現在のセキュリティコンテキストでのみ復号できるように暗号化する。(Unicode)
%group
Win32 advapi32
%prm
fAsSelf, pszCredentials, cchCredentials, pszProtectedCredentials, pcchMaxChars, ProtectionType
fAsSelf : [int] 資格情報を現在のプロセスのセキュリティコンテキストで暗号化する場合は TRUE を指定する。呼び出し側スレッドのセキュリティコンテキストで暗号化する場合は FALSE を指定する。
pszCredentials : [wstr] 暗号化する資格情報を指定する文字列へのポインタ。関数は cchCredentials パラメータで指定された文字数を暗号化する。
cchCredentials : [int] pszCredentials バッファの文字単位のサイズ。
pszProtectedCredentials : [wstr] 出力時に暗号化された資格情報を受け取る文字列へのポインタ。
pcchMaxChars : [var] pszProtectedCredentials バッファの文字単位のサイズ。出力時、pszProtectedCredentials のサイズが暗号化された資格情報を受け取るのに十分でない場合、このパラメータには pszProtectedCredentials バッファに必要な文字単位のサイズが格納される。
ProtectionType : [var] CRED_PROTECTION_TYPE 列挙型へのポインタで、出力時に保護の種類を示す。
%inst
指定した資格情報を、現在のセキュリティコンテキストでのみ復号できるように暗号化する。(Unicode)

[戻り値]
関数が成功した場合は TRUE、そうでなければ FALSE を返す。拡張エラー情報を取得するには GetLastError
関数を呼び出す。

[備考]
CredProtect 関数の出力は整合性保護されていないため、出力が改変されても CredUnprotect
関数は更新されず、誤った結果が返される可能性がある。
> [!NOTE] > wincred.h ヘッダーは CredProtect をエイリアスとして定義しており、UNICODE
プリプロセッサ定数の定義に応じて、この関数の ANSI 版と Unicode
版を自動的に選択する。エンコーディングに依存しないエイリアスと、エンコーディングに依存しないコードとを混在させると、コンパイルエラーや実行時エラーを引き起こす不整合が生じる可能性がある。詳細は
[関数プロトタイプの規約](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
CredReadW
ユーザーの資格情報セットから資格情報を読み取る。(Unicode)
%group
Win32 advapi32
%prm
TargetName, Type, Flags, Credential
TargetName : [wstr] 読み取る資格情報の名前を格納する、null 終端文字列へのポインタ。
Type : [int] 読み取る資格情報の型。Type は CRED_TYPE_* で定義された型のいずれかでなければならない。
Flags : [int] 現在予約されており、ゼロでなければならない。
Credential : [var] 資格情報を返すための、単一の割り当てブロックバッファへのポインタ。バッファ内のすべてのポインタは、この単一の割り当てブロック内の位置を指す。返される単一のバッファは CredFree を呼び出して解放する必要がある。
%inst
ユーザーの資格情報セットから資格情報を読み取る。(Unicode)

[戻り値]
この関数は成功時に TRUE、失敗時に FALSE を返す。より詳細なステータスコードを取得するには GetLastError
関数を呼び出す。以下のステータスコードが返される可能性がある。
（以下省略）

[備考]
Credential パラメータで指定される CREDENTIAL 構造体の Type メンバが
CRED_TYPE_DOMAIN_EXTENDED
である場合、ターゲット名に名前空間を指定する必要がある。この関数は指定した型の資格情報を 1 つだけ返すことができる。
> [!NOTE] > wincred.h ヘッダーは CredRead をエイリアスとして定義しており、UNICODE
プリプロセッサ定数の定義に応じて、この関数の ANSI 版と Unicode
版を自動的に選択する。エンコーディングに依存しないエイリアスと、エンコーディングに依存しないコードとを混在させると、コンパイルエラーや実行時エラーを引き起こす不整合が生じる可能性がある。詳細は
[関数プロトタイプの規約](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
CredReadDomainCredentialsW
ユーザーの資格情報セットからドメイン資格情報を読み取る。(Unicode)
%group
Win32 advapi32
%prm
TargetInfo, Flags, Count, Credential
TargetInfo : [var] 対象サーバを識別するターゲット情報。命名メンバのうち少なくとも 1 つは NULL ではない必要がある。NetbiosServerName、DnsServerName、NetbiosDomainName、DnsDomainName、DnsTreeName のいずれか。
Flags : [int] 関数の動作を制御するフラグ。
Count : [var] Credentials 配列に返される資格情報の数。
Credential : [var] 資格情報へのポインタの配列へのポインタ。TargetInfo に一致する最も具体的な既存の資格情報が返される。異なる種類の資格情報 (たとえば CRED_TYPE_DOMAIN_PASSWORD と CRED_TYPE_DOMAIN_CERTIFICATE) が存在する場合、各種類から 1 つずつ返される。指定されたターゲットに接続する場合、この最も具体的な資格情報が使用されることになる。
%inst
ユーザーの資格情報セットからドメイン資格情報を読み取る。(Unicode)

[戻り値]
この関数は成功時に TRUE、失敗時に FALSE を返す。より詳細なステータスコードを取得するには GetLastError
関数を呼び出す。以下のステータスコードが返される可能性がある。
（以下省略）

[備考]

この関数は、命名パラメータに一致する最も具体的な資格情報を返す。たとえば、対象サーバ名に一致する資格情報と対象ドメイン名に一致する資格情報が存在する場合、サーバ固有の資格情報のみが返される。これは実際に使用される資格情報である。次の一覧は、複数の資格情報が一致する場合に、どの資格情報が返されるかの順序
(最も具体的なものから最も汎用的なものまで) を示す。
（以下省略）


%index
CredRenameW
CredRename は現在サポートされていない。(Unicode)
%group
Win32 advapi32
%prm
OldTargetName, NewTargetName, Type, Flags
OldTargetName : [wstr] 名前を変更する資格情報の現在の名前を格納する、null 終端文字列へのポインタ。
NewTargetName : [wstr] 資格情報の新しい名前を格納する、null 終端文字列へのポインタ。
Type : [int] 名前を変更する資格情報の型。CRED_TYPE_* の定義のいずれかでなければならない。
Flags : [int] 関数の動作を制御するフラグ。現在予約されており、ゼロでなければならない。
%inst
CredRename は現在サポートされていない。(Unicode)

[戻り値]
この関数は成功時に TRUE、失敗時に FALSE を返す。より詳細なステータスコードを取得するには GetLastError
関数を呼び出す。以下のステータスコードが返される可能性がある。
（以下省略）

[備考]
> [!NOTE] > wincred.h ヘッダーは CredRename をエイリアスとして定義しており、UNICODE
プリプロセッサ定数の定義に応じて、この関数の ANSI 版と Unicode
版を自動的に選択する。エンコーディングに依存しないエイリアスと、エンコーディングに依存しないコードとを混在させると、コンパイルエラーや実行時エラーを引き起こす不整合が生じる可能性がある。詳細は
[関数プロトタイプの規約](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
CredUnmarshalCredentialW
CredUnmarshalCredential 関数は、マーシャリング済み資格情報を元の形式に変換する。(Unicode)
%group
Win32 advapi32
%prm
MarshaledCredential, CredType, Credential
MarshaledCredential : [wstr] マーシャリング済み資格情報を格納する、null 終端文字列へのポインタ。
CredType : [var] MarshaledCredential で指定された資格情報の型。
Credential : [var] アンマーシャリングされた資格情報へのポインタ。CredType が CertCredential を返す場合、返されるポインタは CERT_CREDENTIAL_INFO 構造体を指す。CredType が UsernameTargetCredential を返す場合、返されるポインタは USERNAME_TARGET_CREDENTIAL_INFO 構造体を指す。呼び出し側は返されたバッファを CredFree を使用して解放する必要がある。
%inst
CredUnmarshalCredential 関数は、マーシャリング済み資格情報を元の形式に変換する。(Unicode)

[戻り値]
この関数は成功時に TRUE、失敗時に FALSE を返す。より詳細なステータスコードを取得するには GetLastError
関数を呼び出す。以下のステータスコードが返される可能性がある。ERROR_INVALID_PARAMETER:
MarshaledCredential が有効ではない。

[備考]
> [!NOTE] > wincred.h ヘッダーは CredUnmarshalCredential
をエイリアスとして定義しており、UNICODE プリプロセッサ定数の定義に応じて、この関数の ANSI 版と Unicode
版を自動的に選択する。エンコーディングに依存しないエイリアスと、エンコーディングに依存しないコードとを混在させると、コンパイルエラーや実行時エラーを引き起こす不整合が生じる可能性がある。詳細は
[関数プロトタイプの規約](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
CredUnprotectW
CredProtect 関数を使用して以前に暗号化された資格情報を復号する。(Unicode)
%group
Win32 advapi32
%prm
fAsSelf, pszProtectedCredentials, cchProtectedCredentials, pszCredentials, pcchMaxChars
fAsSelf : [int] 資格情報が現在のプロセスのセキュリティコンテキストで暗号化されたことを指定する場合は TRUE を指定する。呼び出し側スレッドのセキュリティコンテキストで暗号化された場合は FALSE を指定する。
pszProtectedCredentials : [wstr] 暗号化された資格情報を指定する文字列へのポインタ。
cchProtectedCredentials : [int] pszProtectedCredentials バッファの文字単位のサイズ。
pszCredentials : [wstr] 出力時に復号された資格情報を受け取る文字列へのポインタ。
pcchMaxChars : [var] pszCredentials バッファの文字単位のサイズ。出力時、pszCredentials のサイズが暗号化された資格情報を受け取るのに十分でない場合、このパラメータには pszCredentials バッファに必要な文字単位のサイズが格納される。
%inst
CredProtect 関数を使用して以前に暗号化された資格情報を復号する。(Unicode)

[戻り値]
関数が成功した場合は TRUE、そうでなければ FALSE を返す。拡張エラー情報を取得するには GetLastError
関数を呼び出す。次の表は GetLastError 関数の一般的な値を示す。
（以下省略）

[備考]
> [!NOTE] > wincred.h ヘッダーは CredUnprotect をエイリアスとして定義しており、UNICODE
プリプロセッサ定数の定義に応じて、この関数の ANSI 版と Unicode
版を自動的に選択する。エンコーディングに依存しないエイリアスと、エンコーディングに依存しないコードとを混在させると、コンパイルエラーや実行時エラーを引き起こす不整合が生じる可能性がある。詳細は
[関数プロトタイプの規約](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
CredWriteW
ユーザーの資格情報セットに新しい資格情報を作成するか、既存の資格情報を変更する。(Unicode)
%group
Win32 advapi32
%prm
Credential, Flags
Credential : [var] 書き込む CREDENTIAL 構造体へのポインタ。
Flags : [int] 関数の動作を制御するフラグ。以下のフラグが定義されている。
%inst
ユーザーの資格情報セットに新しい資格情報を作成するか、既存の資格情報を変更する。(Unicode)

[戻り値]
関数が成功した場合は TRUE を返す。失敗した場合は FALSE を返す。より詳細なステータスコードを取得するには
GetLastError 関数を呼び出す。以下のステータスコードが返される可能性がある。CRED_TYPE_CERTIFICATE
資格情報を書き込むとき、他にもスマートカードのエラーが返されることがある。
（以下省略）

[備考]
この関数は、指定された TargetName と Type を持つ資格情報が存在しない場合に資格情報を作成する。指定された
TargetName と Type を持つ資格情報が既に存在する場合、新しい資格情報が既存のものを置き換える。この関数が
CRED_TYPE_CERTIFICATE 資格情報を書き込むとき、Credential->CredentialBlob メンバは
Credential->UserName メンバで指定される証明書の秘密鍵を保護する PIN を指定する。資格情報マネージャは PIN
を保持しない。代わりに、PIN は証明書に示される暗号化サービスプロバイダ (CSP) に渡され、その後 CSP
と認証パッケージで使用される。CSP が PIN の有効期間を定義する。ほとんどの CSP
はスマートカードがスマートカードリーダーから取り外された時点で PIN を破棄する。Credential パラメータで指定される
CREDENTIAL 構造体の Type メンバが CRED_TYPE_DOMAIN_EXTENDED
である場合、ターゲット名に名前空間を指定する必要がある。この関数はワイルドカードを含むターゲット名への書き込みをサポートしない。
> [!NOTE] > wincred.h ヘッダーは CredWrite をエイリアスとして定義しており、UNICODE
プリプロセッサ定数の定義に応じて、この関数の ANSI 版と Unicode
版を自動的に選択する。エンコーディングに依存しないエイリアスと、エンコーディングに依存しないコードとを混在させると、コンパイルエラーや実行時エラーを引き起こす不整合が生じる可能性がある。詳細は
[関数プロトタイプの規約](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
CredWriteDomainCredentialsW
ユーザーの資格情報セットにドメイン資格情報を書き込む。(Unicode)
%group
Win32 advapi32
%prm
TargetInfo, Credential, Flags
TargetInfo : [var] 対象サーバを識別する。命名メンバのうち少なくとも 1 つは NULL 以外でなければならず、NetbiosServerName、DnsServerName、NetbiosDomainName、DnsDomainName、DnsTreeName のいずれかとなる。
Credential : [var] 書き込む資格情報。
Flags : [int] API の動作を制御するフラグ。以下のフラグが定義されている。
%inst
ユーザーの資格情報セットにドメイン資格情報を書き込む。(Unicode)

[戻り値]
関数が成功した場合は TRUE を返す。失敗した場合は FALSE を返す。より詳細なステータスコードを取得するには
GetLastError 関数を呼び出す。以下のステータスコードが返される可能性がある。CRED_TYPE_CERTIFICATE
資格情報を書き込むとき、他にもスマートカードのエラーが返されることがある。
（以下省略）

[備考]
この関数が CRED_TYPE_CERTIFICATE 資格情報を書き込むとき、Credential->CredentialBlob
メンバは Credential->UserName で指定される証明書の秘密鍵を保護する PIN を指定する。資格情報マネージャは PIN
を保持しない。代わりに、PIN は証明書の CSP に渡され、その後 CSP と認証パッケージで使用される。CSP が PIN
の有効期間を定義する。たとえば、ほとんどの CSP はスマートカードが取り外された時点で PIN
を破棄する。CredWriteDomainCredentials は CredWrite とは異なり、ドメイン
(CRED_TYPE_DOMAIN_PASSWORD または CRED_TYPE_DOMAIN_CERTIFICATE)
資格情報に固有の事情を処理する。ドメイン資格情報は複数のターゲットメンバを含む。Credential パラメータで指定される
CREDENTIAL 構造体の Type メンバが CRED_TYPE_DOMAIN_EXTENDED
である場合、ターゲット名に名前空間を指定する必要がある。
> [!NOTE] > wincred.h ヘッダーは CredWriteDomainCredentials
をエイリアスとして定義しており、UNICODE プリプロセッサ定数の定義に応じて、この関数の ANSI 版と Unicode
版を自動的に選択する。エンコーディングに依存しないエイリアスと、エンコーディングに依存しないコードとを混在させると、コンパイルエラーや実行時エラーを引き起こす不整合が生じる可能性がある。詳細は
[関数プロトタイプの規約](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
CryptAcquireContextW
特定の暗号化サービスプロバイダ (CSP) 内の特定のキーコンテナへのハンドルを取得するために使用する。返されたハンドルは、選択した CSP を使用する CryptoAPI 関数の呼び出しで使用される。(Unicode)
%group
Win32 advapi32
%prm
phProv, szContainer, szProvider, dwProvType, dwFlags
phProv : [var] CSP のハンドルへのポインタ。CSP の使用が終わったら、CryptReleaseContext 関数を呼び出してハンドルを解放する。
szContainer : [wstr] キーコンテナ名。CSP にキーコンテナを識別させる null 終端文字列である。この名前は、鍵の格納方法とは無関係である。CSP によってはキーコンテナを内部 (ハードウェア内) に格納するものもあれば、システムのレジストリを使用するもの、ファイルシステムを使用するものもある。ほとんどの場合、dwFlags が CRYPT_VERIFYCONTEXT に設定されているとき、pszContainer は NULL に設定する必要がある。ただし、スマートカード CSP のようなハードウェアベースの CSP の場合、指定したコンテナ内で公開されている情報にアクセスできる。pszContainer パラメータの使用方法の詳細は「Remarks」を参照。
szProvider : [wstr] 使用する CSP の名前を格納する null 終端文字列。
dwProvType : [int] 取得するプロバイダの種類を指定する。定義されているプロバイダの種類については Cryptographic Provider Types を参照。
dwFlags : [int] 以下のフラグのうちの 1 つ以上。ほとんどのアプリケーションでは、デジタル署名の作成やメッセージの復号が必要でない限り、CRYPT_VERIFYCONTEXT フラグを設定することが推奨される。
%inst
特定の暗号化サービスプロバイダ (CSP) 内の特定のキーコンテナへのハンドルを取得するために使用する。返されたハンドルは、選択した
CSP を使用する CryptoAPI 関数の呼び出しで使用される。(Unicode)

[戻り値]
関数が成功した場合はゼロ以外 (TRUE) を返す。失敗した場合はゼロ (FALSE) を返す。拡張エラー情報を取得するには
GetLastError を呼び出す。NTE で始まるエラーコードは使用中の特定の CSP が生成する。Winerror.h
で定義されている主なエラーコードを以下に示す。
（以下省略）

[備考]
pszContainer パラメータは、鍵を保持するために使用するコンテナの名前を指定する。各コンテナには 1
つの鍵を格納できる。鍵を作成する際に既存のコンテナ名を指定すると、新しい鍵は既存の鍵を上書きする。CSP
名とキーコンテナ名の組み合わせにより、システム上で 1
つの鍵が一意に識別される。あるアプリケーションが使用中のキーコンテナを別のアプリケーションが変更しようとすると、予期しない動作を招く可能性がある。pszContainer
パラメータを NULL に設定すると、既定のキーコンテナ名が使用される。Microsoft ソフトウェア CSP
をこの方法で呼び出した場合、CryptAcquireContext 関数が呼び出されるたびに新しいコンテナが作成される。ただし、CSP
によって挙動は異なる可能性がある。特に、CSP が CSP にアクセスするすべてのアプリケーション間で共有される既定のコンテナを 1
つだけ持つ場合がある。したがって、アプリケーションは秘密鍵の格納に既定のキーコンテナを使用してはならない。代わりに、dwFlags
パラメータに CRYPT_VERIFYCONTEXT
フラグを渡して鍵の格納を抑止するか、他のアプリケーションで使用される可能性が低いアプリケーション固有のコンテナを使用する。アプリケーションは
CryptGetProvParam 関数で PP_CONTAINER
値を読み取ることで、使用中のキーコンテナ名を取得できる。パフォーマンス上の理由から、永続化された鍵が必要でない場合は、pszContainer
パラメータを NULL に、dwFlags パラメータを CRYPT_VERIFYCONTEXT
に設定することを推奨する。特に次のような場面では pszContainer を NULL、dwFlags を
CRYPT_VERIFYCONTEXT に設定することを検討すべきである。
（以下省略）


%index
CryptContextAddRef
HCRYPTPROV 暗号化サービスプロバイダ (CSP) ハンドルの参照カウントに 1 を加算する。
%group
Win32 advapi32
%prm
hProv, pdwReserved, dwFlags
hProv : [int] 参照カウントをインクリメントする HCRYPTPROV ハンドル。このハンドルは CryptAcquireContext で既に作成されている必要がある。
pdwReserved : [var] 将来の使用のために予約されており、NULL でなければならない。
dwFlags : [int] 将来の使用のために予約されており、ゼロでなければならない。
%inst
HCRYPTPROV 暗号化サービスプロバイダ (CSP) ハンドルの参照カウントに 1 を加算する。

[戻り値]
関数が成功した場合、戻り値はゼロ以外 (TRUE) となる。失敗した場合はゼロ (FALSE) となる。拡張エラー情報を取得するには
GetLastError を呼び出す。次のエラーコードが返される可能性がある。
（以下省略）

[備考]
この関数は HCRYPTPROV ハンドルの参照カウントを増加させ、実際にハンドルを解放するには複数回の
CryptReleaseContext 呼び出しが必要となるようにする。


%index
CryptCreateHash
データストリームのハッシュ処理を開始する。暗号化サービスプロバイダ (CSP) のハッシュオブジェクトへのハンドルを生成し、呼び出し元に返す。
%group
Win32 advapi32
%prm
hProv, Algid, hKey, dwFlags, phHash
hProv : [int] CryptAcquireContext の呼び出しで作成された CSP へのハンドル。
Algid : [int] 使用するハッシュアルゴリズムを識別する ALG_ID 値。このパラメータの有効な値は使用する CSP によって異なる。既定のアルゴリズムの一覧は「Remarks」を参照。
hKey : [int] ハッシュアルゴリズムが Hash-Based Message Authentication Code (HMAC) や Message Authentication Code (MAC) などのキー付きハッシュである場合、ハッシュに使用する鍵をこのパラメータで渡す。キーを使用しないアルゴリズムの場合、このパラメータはゼロに設定する必要がある。キー付きアルゴリズムの場合、鍵は RC2 などの暗号ブロック連鎖 (CBC) モードを持つブロック暗号鍵でなければならない。
dwFlags : [int] 以下のフラグ値が定義されている。
phHash : [var] 関数が新しいハッシュオブジェクトへのハンドルをコピーするアドレス。ハッシュオブジェクトの使用が終わったら、CryptDestroyHash 関数を呼び出してハンドルを解放する。
%inst
データストリームのハッシュ処理を開始する。暗号化サービスプロバイダ (CSP)
のハッシュオブジェクトへのハンドルを生成し、呼び出し元に返す。

[戻り値]
関数が成功した場合は TRUE を返す。失敗した場合は FALSE を返す。拡張エラー情報を取得するには GetLastError
を呼び出す。NTE で始まるエラーコードは使用中の特定の CSP が生成する。次の表は、返される可能性のあるエラーコードの一部を示す。
（以下省略）

[備考]
Microsoft のサービスプロバイダとそれらが実装するアルゴリズムの一覧は Microsoft Cryptographic
Service Providers を参照。実際のハッシュの計算は CryptHashData 関数と
CryptHashSessionKey
関数で行う。これらの関数にはハッシュオブジェクトへのハンドルが必要である。すべてのデータをハッシュオブジェクトに追加した後、以下の操作のいずれかを実行できる。
（以下省略）


%index
CryptDecrypt
CryptEncrypt 関数で以前に暗号化されたデータを復号する。
%group
Win32 advapi32
%prm
hKey, hHash, Final, dwFlags, pbData, pdwDataLen
hKey : [int] 復号に使用する鍵へのハンドル。アプリケーションはこのハンドルを CryptGenKey または CryptImportKey 関数を使用して取得する。
hHash : [int] ハッシュオブジェクトへのハンドル。データを復号と同時にハッシュ化する場合、このパラメータでハッシュオブジェクトへのハンドルを渡す。ハッシュ値は復号された平文で更新される。このオプションは、署名の検証と復号を同時に行う場合に有用である。
Final : [int] 復号対象の一連のデータのうち、これが最後のセクションかどうかを指定するブール値。これが最後または唯一のブロックであれば TRUE とする。そうでなければ FALSE とする。詳細は「Remarks」を参照。
dwFlags : [int] 以下のフラグ値が定義されている。
pbData : [var] 復号対象のデータを格納するバッファへのポインタ。復号が実行されると、平文は同じバッファに格納される。
pdwDataLen : [var] pbData バッファの長さを示す DWORD 値へのポインタ。この関数を呼び出す前に、呼び出し側は DWORD 値に復号するバイト数を設定する。戻り時には、DWORD 値には復号された平文のバイト数が格納される。
%inst
CryptEncrypt 関数で以前に暗号化されたデータを復号する。

[戻り値]
関数が成功した場合はゼロ以外 (TRUE) を返す。
失敗した場合はゼロ (FALSE) を返す。拡張エラー情報を取得するには GetLastError を呼び出す。NTE
で始まるエラーコードは使用中の特定の CSP が生成する。以下のエラーコードが返される可能性がある。
（以下省略）

[備考]
大量のデータを復号する場合は、CryptDecrypt を繰り返し呼び出すことで複数セクションに分けて行える。Final パラメータは
CryptDecrypt の最後の呼び出しでのみ TRUE
に設定し、復号エンジンが復号処理を正しく完了できるようにする必要がある。Final が TRUE のときには以下の追加処理が実行される。
（以下省略）


%index
CryptDeriveKey
基準データから派生した暗号セッション鍵を生成する。
%group
Win32 advapi32
%prm
hProv, Algid, hBaseData, dwFlags, phKey
hProv : [int] CryptAcquireContext の呼び出しで作成された CSP の HCRYPTPROV ハンドル。
Algid : [int] 鍵を生成する対称暗号アルゴリズムを識別する ALG_ID 構造体。利用できるアルゴリズムは CSP ごとに異なる可能性が高い。AT_KEYEXCHANGE と AT_SIGNATURE のキー仕様に対して各プロバイダが使用するアルゴリズム識別子の詳細は ALG_ID を参照。Microsoft Base Cryptographic Provider で使用する ALG_ID 値の詳細は Base Provider Algorithms を参照。Microsoft Strong Cryptographic Provider や Microsoft Enhanced Cryptographic Provider で使用する ALG_ID 値の詳細は Enhanced Provider Algorithms を参照。
hBaseData : [int] 基準データが与えられたハッシュオブジェクトへのハンドル。このハンドルを取得するには、アプリケーションはまず CryptCreateHash でハッシュオブジェクトを作成し、次に CryptHashData で基準データをハッシュオブジェクトに追加する必要がある。この処理の詳細は Hashes and Digital Signatures を参照。
dwFlags : [int] 生成される鍵の種類を指定する。鍵生成時にセッション鍵のサイズを設定できる。鍵サイズ (鍵のモジュラス長をビットで表したもの) は、このパラメータの上位 16 ビットで設定する。したがって、128 ビット RC4 セッション鍵を生成する場合は値 0x00800000 を、他の dwFlags 事前定義値とビット単位の OR 演算で組み合わせる。輸出規制の変更により、既定の CSP と既定の鍵長は OS リリース間で変わる可能性がある。相互運用性を確保するため、暗号化と復号で同じ CSP を使用し、dwFlags パラメータを使って鍵長を明示的に設定することが重要である。このパラメータの下位 16 ビットはゼロにするか、ビット単位の OR 演算で次のフラグのうちの 1 つ以上を組み合わせて指定できる。
phKey : [var] 新しく生成された鍵のハンドルのアドレスを受け取る HCRYPTKEY 変数へのポインタ。鍵の使用が終わったら、CryptDestroyKey 関数を呼び出してハンドルを解放する。
%inst
基準データから派生した暗号セッション鍵を生成する。

[戻り値]
関数が成功した場合はゼロ以外 (TRUE) を返す。失敗した場合はゼロ (FALSE) を返す。拡張エラー情報を取得するには
GetLastError を呼び出す。「NTE」で始まるエラーコードは使用中の特定の CSP
が生成する。次の表は、返される可能性のあるエラーコードの一部を示す。
（以下省略）

[備考]
対称ブロック暗号用の鍵を生成するとき、既定では鍵は初期化ベクトルがゼロの暗号ブロック連鎖 (CBC)
モードで設定される。この暗号モードは大量のデータを一括暗号化するための良好な既定手法である。これらのパラメータを変更するには
CryptSetKeyParam 関数を使用する。CryptDeriveKey 関数はハッシュを確定させる。CryptDeriveKey
が呼び出された後はハッシュにデータを追加できない。CryptHashData または CryptHashSessionKey
の追加呼び出しは失敗する。アプリケーションがハッシュの使用を終えた後は、CryptDestroyHash
を呼び出してハッシュオブジェクトを破棄しなければならない。適切な鍵長を選択するには、次の方法が推奨される。
（以下省略）


%index
CryptDestroyHash
hHash パラメータで参照されるハッシュオブジェクトを破棄する。
%group
Win32 advapi32
%prm
hHash
hHash : [int] 破棄するハッシュオブジェクトのハンドル。
%inst
hHash パラメータで参照されるハッシュオブジェクトを破棄する。

[戻り値]
関数が成功した場合、戻り値はゼロ以外となる。失敗した場合、戻り値はゼロとなる。拡張エラー情報を取得するには GetLastError
を呼び出す。「NTE」で始まるエラーコードは使用中の特定の暗号化サービスプロバイダ (CSP)
が生成する。以下のエラーコードが返される可能性がある。
（以下省略）

[備考]
ハッシュオブジェクトが破棄されると、多くの CSP ではハッシュオブジェクトが格納されていた CSP
内のメモリを上書きする。その後、CSP のメモリが解放される。CryptCreateHash の呼び出しと
CryptDestroyHash の呼び出しは 1 対 1 で対応している必要がある。特定の CSP
を使用して作成されたすべてのハッシュオブジェクトは、その CSP ハンドルを CryptReleaseContext
関数で解放する前に破棄されなければならない。


%index
CryptDestroyKey
hKey パラメータで参照されるハンドルを解放する。
%group
Win32 advapi32
%prm
hKey
hKey : [int] 破棄する鍵のハンドル。
%inst
hKey パラメータで参照されるハンドルを解放する。

[戻り値]
関数が成功した場合、戻り値はゼロ以外となる。失敗した場合、戻り値はゼロとなる。拡張エラー情報を取得するには GetLastError
を呼び出す。「NTE」で始まるエラーコードは使用中の特定の CSP が生成する。次の表は、返される可能性のあるエラーコードの一部を示す。
（以下省略）

[備考]
鍵は OS のメモリ空間と CSP のメモリ空間の両方を占有する。一部の CSP
はメモリリソースが限られたハードウェアに実装されている。アプリケーションは鍵の使用が終わったら CryptDestroyKey
関数ですべての鍵を破棄する必要がある。特定の CSP を使用して作成またはインポートされたすべての鍵ハンドルは、その CSP ハンドルを
CryptReleaseContext 関数で解放する前に破棄しなければならない。


%index
CryptDuplicateHash
複製が行われた時点までのハッシュの正確なコピーを作成する。
%group
Win32 advapi32
%prm
hHash, pdwReserved, dwFlags, phHash
hHash : [int] 複製するハッシュのハンドル。
pdwReserved : [var] 将来の使用のために予約されており、ゼロでなければならない。
dwFlags : [int] 将来の使用のために予約されており、ゼロでなければならない。
phHash : [var] 複製されたハッシュのハンドルのアドレス。ハッシュの使用が終わったら、CryptDestroyHash 関数を呼び出してハンドルを解放する。
%inst
複製が行われた時点までのハッシュの正確なコピーを作成する。

[戻り値]
関数が成功した場合は TRUE を返す。失敗した場合は FALSE を返す。拡張エラー情報を取得するには GetLastError
を呼び出す。「NTE」で始まるエラーコードは使用中の特定の暗号化サービスプロバイダ (CSP)
が生成する。以下のエラーコードが返される可能性がある。
（以下省略）

[備考]
CryptDuplicateHash はハッシュとその正確な状態のコピーを作成する。この関数は、呼び出し元のアプリケーションで 2
つのハッシュを生成する必要があり、どちらのハッシュも共通のデータをハッシュ化した状態から開始する必要がある場合に使用されうる。たとえば、ハッシュを作成して共通データをハッシュ化し、CryptDuplicateHash
関数で複製を作成してから、各ハッシュに固有のデータを追加する。CryptDuplicateHash
で作成されたハッシュを破棄するには、CryptDestroyHash
関数を呼び出さなければならない。元のハッシュを破棄しても、複製されたハッシュは破棄されない。複製ハッシュが作成された後は、元のハッシュとは独立している。2
つのハッシュの間に共有状態は存在しない。


%index
CryptDuplicateKey
鍵とその状態の正確なコピーを作成する。
%group
Win32 advapi32
%prm
hKey, pdwReserved, dwFlags, phKey
hKey : [int] 複製する鍵へのハンドル。
pdwReserved : [var] 将来の使用のために予約されており、NULL でなければならない。
dwFlags : [int] 将来の使用のために予約されており、ゼロでなければならない。
phKey : [var] 複製された鍵へのハンドルのアドレス。鍵の使用が終わったら、CryptDestroyKey 関数を呼び出してハンドルを解放する。
%inst
鍵とその状態の正確なコピーを作成する。

[戻り値]
関数が成功した場合、戻り値はゼロ以外 (TRUE) となる。失敗した場合、戻り値はゼロ (FALSE)
となる。拡張エラー情報を取得するには GetLastError を呼び出す。「NTE」で始まるエラーコードは使用中の特定の CSP
が生成する。次の表は、返される可能性のあるエラーコードの一部を示す。
（以下省略）

[備考]
CryptDuplicateKey は鍵とその正確な状態のコピーを作成する。この関数が使用できるシナリオの 1
つは、アプリケーションが同じ鍵で異なるソルト値を用いて 2 つの別々のメッセージを暗号化する必要がある場合である。元の鍵を生成してから
CryptDuplicateKey 関数で複製鍵を作成し、それぞれの鍵に異なるソルト値を CryptSetKeyParam
関数で個別に設定する。
CryptDuplicateKey で作成された鍵を破棄するには、CryptDestroyKey
を呼び出さなければならない。元の鍵を破棄しても、複製鍵は破棄されない。複製鍵が作成された後は、元の鍵とは独立している。2
つの鍵の間に共有状態は存在しない。


%index
CryptEncrypt
データを暗号化する。データの暗号化に使用されるアルゴリズムは、CSP モジュールが保持する鍵で指定され、hKey パラメータから参照される。
%group
Win32 advapi32
%prm
hKey, hHash, Final, dwFlags, pbData, pdwDataLen, dwBufLen
hKey : [int] 暗号化鍵へのハンドル。アプリケーションはこのハンドルを CryptGenKey または CryptImportKey 関数を使用して取得する。鍵が使用する暗号化アルゴリズムを指定する。
hHash : [int] ハッシュオブジェクトへのハンドル。データをハッシュ化しながら同時に暗号化する場合は、hHash パラメータにハッシュオブジェクトへのハンドルを渡す。ハッシュ値は渡された平文で更新される。このオプションは署名付きの暗号文を生成するときに有用である。CryptEncrypt を呼び出す前に、アプリケーションは CryptCreateHash 関数を呼び出してハッシュオブジェクトへのハンドルを取得する必要がある。暗号化完了後、CryptGetHashParam 関数でハッシュ値を取得するか、CryptSignHash 関数でハッシュに署名できる。ハッシュ化を行わない場合、このパラメータは NULL でなければならない。
Final : [int] 暗号化対象の一連のデータのうち、これが最後のセクションかどうかを指定するブール値。最後または唯一のブロックであれば Final を TRUE に設定し、暗号化すべきブロックがまだ残っていれば FALSE に設定する。詳細は「Remarks」を参照。
dwFlags : [int] 次の dwFlags 値は定義されているが、将来の使用のために予約されている。
pbData : [var] 暗号化対象の平文を格納するバッファへのポインタ。このバッファ内の平文は、この関数が作成した暗号文で上書きされる。pdwDataLen パラメータは平文の長さ (バイト単位) を格納する変数を指す。dwBufLen パラメータはこのバッファの総サイズ (バイト単位) を格納する。このパラメータが NULL の場合、関数は暗号文に必要なサイズを計算し、pdwDataLen が指す値に格納する。
pdwDataLen : [var] DWORD 値へのポインタ。入力時には pbData バッファ内の平文の長さ (バイト単位) を含む。出力時には、この DWORD には pbData バッファに書き込まれた暗号文の長さ (バイト単位) が格納される。pbData 用に確保したバッファが暗号化データを保持するのに十分でない場合、GetLastError は ERROR_MORE_DATA を返し、必要なバッファサイズ (バイト単位) を pdwDataLen が指す DWORD 値に格納する。pbData が NULL の場合、エラーは返されず、関数は暗号化データのサイズ (バイト単位) を pdwDataLen が指す DWORD 値に格納する。これによりアプリケーションは正しいバッファサイズを判定できる。ブロック暗号が使用される場合、このデータ長はブロックサイズの倍数でなければならない。ただし、これが暗号化対象データの最終セクションで Final パラメータが TRUE である場合を除く。
dwBufLen : [int] 入力 pbData バッファの総サイズ (バイト単位) を指定する。使用するアルゴリズムに応じて、暗号文は元の平文より大きくなる可能性がある。この場合、pbData バッファは暗号文とパディングを格納するのに十分な大きさでなければならない。原則として、ストリーム暗号を使用する場合、暗号文は平文と同じサイズとなる。ブロック暗号を使用する場合、暗号文は平文より最大 1 ブロック長大きくなる。
%inst
データを暗号化する。データの暗号化に使用されるアルゴリズムは、CSP モジュールが保持する鍵で指定され、hKey
パラメータから参照される。

[戻り値]
関数が成功した場合はゼロ以外 (TRUE) を返す。
失敗した場合はゼロ (FALSE) を返す。拡張エラー情報を取得するには GetLastError を呼び出す。NTE
で始まるエラーコードは使用中の特定の CSP が生成する。以下のエラーコードが返される可能性がある。
（以下省略）

[備考]
大量のデータを暗号化する場合は、CryptEncrypt を繰り返し呼び出すことで複数セクションに分けて行える。Final パラメータは
CryptEncrypt の最後の呼び出しで TRUE
に設定し、暗号化エンジンが暗号化処理を正しく完了できるようにする必要がある。Final が TRUE
のときには以下の追加処理が実行される。
（以下省略）


%index
CryptEnumProviderTypesW
コンピュータでサポートされている暗号化サービスプロバイダ (CSP) の種類を、最初のものから順に取得する。(Unicode)
%group
Win32 advapi32
%prm
dwIndex, pdwReserved, dwFlags, pdwProvType, szTypeName, pcbTypeName
dwIndex : [int] 次に列挙するプロバイダの種類のインデックス。
pdwReserved : [var] 将来の使用のために予約されており、NULL でなければならない。
dwFlags : [int] 将来の使用のために予約されており、ゼロでなければならない。
pdwProvType : [var] 列挙されたプロバイダの種類を示す DWORD 値のアドレス。
szTypeName : [wstr] 列挙されたプロバイダの種類のデータを受け取るバッファへのポインタ。これは終端の NULL 文字を含む文字列である。一部のプロバイダの種類には表示名が存在せず、その場合は名前が返されず、pcbTypeName が指す値はゼロとなる。
pcbTypeName : [var] pszTypeName パラメータが指すバッファのサイズ (バイト単位) を指定する DWORD 値へのポインタ。関数が戻るとき、DWORD 値にはバッファに格納された、または格納されるバイト数が含まれる。一部のプロバイダの種類には表示名が存在せず、その場合は名前が返されず、pcbTypeName が指す値はゼロとなる。
%inst
コンピュータでサポートされている暗号化サービスプロバイダ (CSP) の種類を、最初のものから順に取得する。(Unicode)

[戻り値]
関数が成功した場合、戻り値はゼロ以外 (TRUE) となる。失敗した場合、戻り値はゼロ (FALSE)
となる。拡張エラー情報を取得するには GetLastError を呼び出す。NTE で始まるエラーコードは使用中の特定の CSP
が生成する。以下のエラーコードが返される可能性がある。
（以下省略）

[備考]
この関数はコンピュータで利用可能なプロバイダの種類を列挙する。特定のプロバイダの種類に対するプロバイダは
CryptEnumProviders を使用して列挙できる。


%index
CryptEnumProvidersW
重要: この API は非推奨である。(CryptEnumProvidersW)
%group
Win32 advapi32
%prm
dwIndex, pdwReserved, dwFlags, pdwProvType, szProvName, pcbProvName
dwIndex : [int] 次に列挙するプロバイダのインデックス。
pdwReserved : [var] 将来の使用のために予約されており、NULL でなければならない。
dwFlags : [int] 将来の使用のために予約されており、ゼロでなければならない。
pdwProvType : [var] 列挙されたプロバイダの種類を示す DWORD 値のアドレス。
szProvName : [wstr] 列挙されたプロバイダのデータを受け取るバッファへのポインタ。これは終端の null 文字を含む文字列である。メモリ確保のために名前のサイズを設定する目的で、このパラメータは NULL にできる。詳細は Retrieving Data of Unknown Length を参照。
pcbProvName : [var] pszProvName パラメータが指すバッファのサイズ (バイト単位) を指定する DWORD 値へのポインタ。関数が戻るとき、DWORD 値にはバッファに格納されたバイト数が含まれる。注: バッファに返されたデータを処理する際、アプリケーションは返されたデータの実際のサイズを使用しなければならない。実際のサイズは入力時に指定したバッファサイズよりわずかに小さい可能性がある (入力時には通常、想定される最大出力データが収まるようバッファサイズを大きめに指定するためである)。出力時、このパラメータが指す変数はバッファにコピーされたデータの実際のサイズを反映するように更新される。
%inst
重要: この API は非推奨である。(CryptEnumProvidersW)

[戻り値]
関数が成功した場合、戻り値はゼロ以外 (TRUE) となる。失敗した場合、戻り値はゼロ (FALSE)
となる。拡張エラー情報を取得するには GetLastError を呼び出す。NTE で始まるエラーコードは使用中の特定の CSP
が生成する。以下のエラーコードが返される可能性がある。
（以下省略）

[備考]
この関数はコンピュータで利用可能なプロバイダを列挙する。プロバイダの種類は CryptEnumProviderTypes
を使用して列挙できる。


%index
CryptExportKey
暗号化サービスプロバイダ (CSP) から暗号鍵または鍵ペアを安全にエクスポートする。
%group
Win32 advapi32
%prm
hKey, hExpKey, dwBlobType, dwFlags, pbData, pdwDataLen
hKey : [int] エクスポートする鍵へのハンドル。
hExpKey : [int] 送信先ユーザーの暗号鍵へのハンドル。エクスポートされた鍵 BLOB 内の鍵データはこの鍵で暗号化される。これにより、送信先ユーザーだけが鍵 BLOB を利用できることが保証される。hExpKey と hKey は同じ CSP から取得しなければならない。
dwBlobType : [int] pbData にエクスポートする鍵 BLOB の種類を指定する。以下の定数のいずれかでなければならず、詳細は Cryptographic Key Storage and Exchange を参照。
dwFlags : [int] 
pbData : [var] 鍵 BLOB データを受け取るバッファへのポインタ。この BLOB のフォーマットは、dwBlobType パラメータで要求される BLOB の種類によって異なる。PRIVATEKEYBLOB、PUBLICKEYBLOB、SIMPLEBLOB のフォーマットについては Base Provider Key BLOBs を参照。このパラメータが NULL の場合、必要なバッファサイズが pdwDataLen パラメータが指す値に格納される。詳細は Retrieving Data of Unknown Length を参照。
pdwDataLen : [var] DWORD 値へのポインタ。入力時には pbData パラメータが指すバッファのサイズ (バイト単位) を含む。関数が戻ると、この値にはバッファに格納されたバイト数が含まれる。注: バッファに返されたデータを処理する際、アプリケーションは返されたデータの実際のサイズを使用しなければならない。実際のサイズは入力時に指定したバッファサイズよりわずかに小さい可能性がある。入力時には通常、想定される最大出力データが収まるようバッファサイズを大きめに指定する。出力時、このパラメータが指す変数はバッファにコピーされたデータの実際のサイズを反映するように更新される。pbData に必要なサイズを取得するには、pbData に NULL を渡す。必要なバッファサイズはこのパラメータが指す値に格納される。
%inst
暗号化サービスプロバイダ (CSP) から暗号鍵または鍵ペアを安全にエクスポートする。

[戻り値]
関数が成功した場合はゼロ以外 (TRUE) を返す。失敗した場合はゼロ (FALSE) を返す。拡張エラー情報を取得するには
GetLastError を呼び出す。「NTE」で始まるエラーコードは使用中の特定の CSP
が生成する。次の表は、返される可能性のあるエラーコードの一部を示す。
（以下省略）

[備考]
PLAINTEXTKEYBLOB を使用する DES
鍵の任意の順列については、パリティビットを含めた完全な鍵サイズのみがエクスポートできる。サポートされる鍵サイズを以下に示す。
（以下省略）


%index
CryptGenKey
ランダムな暗号セッション鍵または公開/秘密鍵ペアを生成する。鍵または鍵ペアへのハンドルが phKey に返される。このハンドルは、鍵ハンドルを必要とする任意の CryptoAPI 関数で使用できる。
%group
Win32 advapi32
%prm
hProv, Algid, dwFlags, phKey
hProv : [int] CryptAcquireContext の呼び出しで作成された暗号化サービスプロバイダ (CSP) へのハンドル。
Algid : [int] 鍵を生成するアルゴリズムを識別する ALG_ID 値。このパラメータの値は使用する CSP によって異なる。Microsoft Base Cryptographic Provider で使用する ALG_ID 値については Base Provider Algorithms を参照。Microsoft Strong Cryptographic Provider や Microsoft Enhanced Cryptographic Provider で使用する ALG_ID 値については Enhanced Provider Algorithms を参照。
dwFlags : [int] 生成される鍵の種類を指定する。セッション鍵、RSA 署名鍵、RSA 鍵交換鍵のサイズは鍵生成時に設定できる。鍵サイズ (鍵のモジュラス長をビットで表したもの) は、このパラメータの上位 16 ビットで設定する。したがって 2048 ビット RSA 署名鍵を生成する場合は、値 0x08000000 を他の dwFlags 事前定義値とビット単位の OR 演算で組み合わせる。0x08000000 の上位 16 ビットは 0x0800 (10 進で 2048) となる。RSA1024BIT_KEY 値を使用して 1024 ビット RSA 鍵を指定できる。輸出規制の変更により、既定の CSP と既定の鍵長は OS のバージョン間で変わる可能性がある。相互運用性を確保するため、暗号化と復号で同じ CSP を使用し、dwFlags パラメータで鍵長を明示的に設定することが重要である。特に、既定の RSA Full Cryptographic Service Provider は Microsoft RSA Strong Cryptographic Provider である。既定の DSS Signature Diffie-Hellman Cryptographic Service Provider は Microsoft Enhanced DSS Diffie-Hellman Cryptographic Provider である。いずれの CSP も、RC2 および RC4 の既定の対称鍵長は 128 ビット、公開鍵アルゴリズムの既定の鍵長は 1024 ビットである。上位 16 ビットがゼロの場合、既定の鍵サイズが生成される。最大値より大きいか最小値より小さい鍵を指定すると、呼び出しは ERROR_INVALID_PARAMETER で失敗する。次の表は Windows XP 以降の署名鍵と交換鍵の最小、既定、最大の長さを示す。
phKey : [var] 関数が新しく生成された鍵のハンドルをコピーするアドレス。鍵の使用が終わったら、CryptDestroyKey 関数を呼び出して鍵のハンドルを削除する。
%inst
ランダムな暗号セッション鍵または公開/秘密鍵ペアを生成する。鍵または鍵ペアへのハンドルが phKey
に返される。このハンドルは、鍵ハンドルを必要とする任意の CryptoAPI 関数で使用できる。

[戻り値]
成功した場合はゼロ以外、そうでなければゼロを返す。拡張エラー情報を取得するには GetLastError
を呼び出す。「NTE」で始まるエラーコードは使用中の特定の CSP が生成する。次の表は、返される可能性のあるエラーコードの一部を示す。
（以下省略）

[備考]
対称ブロック暗号用の鍵を生成するとき、既定では鍵は初期化ベクトルがゼロの暗号ブロック連鎖 (CBC)
モードで設定される。この暗号モードは大量のデータを暗号化するための良好な既定手法である。これらのパラメータを変更するには
CryptSetKeyParam 関数を使用する。適切な鍵長を選択するには、次の方法が推奨される。
（以下省略）


%index
CryptGenRandom
バッファを暗号論的に乱数なバイト列で満たす。
%group
Win32 advapi32
%prm
hProv, dwLen, pbBuffer
hProv : [int] CryptAcquireContext の呼び出しで作成された暗号化サービスプロバイダ (CSP) のハンドル。
dwLen : [int] 生成する乱数データのバイト数。
pbBuffer : [var] 返されるデータを受け取るバッファ。このバッファは少なくとも dwLen バイトの長さが必要である。
%inst
バッファを暗号論的に乱数なバイト列で満たす。

[戻り値]
関数が成功した場合、戻り値はゼロ以外 (TRUE) となる。失敗した場合、戻り値はゼロ (FALSE)
となる。拡張エラー情報を取得するには GetLastError を呼び出す。「NTE」で始まるエラーコードは使用中の特定の CSP
が生成する。次の表は、返される可能性のあるエラーコードの一部を示す。
（以下省略）

[備考]
この関数が生成するデータは暗号論的に乱数である。C
コンパイラに付属する典型的な乱数発生器が生成するデータよりもはるかにランダム性が高い。この関数は、ランダムな初期化ベクトルやソルト値の生成によく使用される。ソフトウェア乱数発生器は基本的に同じ方法で動作する。シードと呼ばれる乱数から始め、アルゴリズムを使用してその値に基づいた疑似乱数ビット列を生成する。この過程で最も難しいのは、真にランダムなシードを取得することである。これは通常、ユーザー入力の遅延や
1 つ以上のハードウェア コンポーネントのジッタに基づく。Microsoft の CSP では、CryptGenRandom
は他のセキュリティ
コンポーネントが使用する乱数発生器と同じものを使用する。これにより、多数のプロセスがシステム全体のシードに寄与できる。CryptoAPI
は中間の乱数シードをユーザーごとに格納する。乱数発生器のシードを形成するために、呼び出し元のアプリケーションは保持しているビット
(たとえばマウスやキーボードのタイミング入力) を提供し、それが格納されたシードや、プロセス ID、スレッド ID、システム
クロック、システム時間、システム カウンタ、メモリ状態、空きディスク クラスタ、ハッシュ化されたユーザー環境ブロックなどの各種システム
データおよびユーザー データと結合される。この結果は擬似乱数発生器 (PRNG) のシードに使用される。Windows Vista
Service Pack 1 (SP1) 以降では、NIST Special Publication 800-90 で規定された AES
カウンタモードベースの PRNG の実装が使用される。Windows Vista、Windows Storage Server
2003、Windows XP では、Federal Information Processing Standard (FIPS)
186-2 で規定された PRNG が使用される。アプリケーションが良好な乱数ソースにアクセスできる場合、CryptGenRandom
を呼び出す前に pbBuffer バッファにいくつかの乱数データを入れておくことができる。CSP
はこのデータを使用して内部シードをさらにランダム化する。CryptGenRandom を呼び出す前に pbBuffer
バッファを初期化する手順は省略してもよい。


%index
CryptGetDefaultProviderW
ローカルコンピュータまたは現在のユーザーに対する、指定したプロバイダ種別の既定の暗号化サービスプロバイダ (CSP) を取得する。(Unicode)
%group
Win32 advapi32
%prm
dwProvType, pdwReserved, dwFlags, pszProvName, pcbProvName
dwProvType : [int] 既定の CSP 名を見つけるプロバイダの種類。定義されているプロバイダの種類は以下のとおり。
pdwReserved : [var] このパラメータは将来の使用のために予約されており、NULL でなければならない。
dwFlags : [int] 以下のフラグ値が定義されている。
pszProvName : [wstr] 既定の CSP の名前を受け取る null 終端文字列バッファへのポインタ。メモリ確保のためにバッファのサイズを取得する目的で、このパラメータは NULL にできる。詳細は Retrieving Data of Unknown Length を参照。
pcbProvName : [var] pszProvName パラメータが指すバッファのサイズ (バイト単位) を指定する DWORD 値へのポインタ。関数が戻るとき、DWORD 値にはバッファに格納された、または格納されるバイト数が含まれる。注: バッファに返されたデータを処理する際、アプリケーションは返されたデータの実際のサイズを使用しなければならない。実際のサイズは入力時に指定したバッファサイズよりわずかに小さい可能性がある (入力時には通常、想定される最大出力データが収まるようバッファサイズを大きめに指定するためである)。出力時、このパラメータが指す変数はバッファにコピーされたデータの実際のサイズを反映するように更新される。
%inst
ローカルコンピュータまたは現在のユーザーに対する、指定したプロバイダ種別の既定の暗号化サービスプロバイダ (CSP)
を取得する。(Unicode)

[戻り値]
関数が成功した場合、戻り値はゼロ以外 (TRUE) となる。
失敗した場合、戻り値はゼロ (FALSE) となる。拡張エラー情報を取得するには GetLastError を呼び出す。NTE
で始まるエラーコードは使用中の特定の CSP が生成する。返される可能性のあるエラーコードは以下のとおり。
（以下省略）

[備考]
この関数は、ローカルコンピュータまたは現在のユーザーに対して現在既定として設定されているインストール済み CSP
を判別する。この情報はユーザーに表示されることが多い。


%index
CryptGetHashParam
ハッシュオブジェクトの動作を制御するデータを取得する。
%group
Win32 advapi32
%prm
hHash, dwParam, pbData, pdwDataLen, dwFlags
hHash : [int] クエリ対象のハッシュオブジェクトのハンドル。
dwParam : [int] クエリの種類。このパラメータは次のクエリのいずれかに設定できる。
pbData : [var] 指定した値データを受け取るバッファへのポインタ。このデータの形式は値番号によって異なる。
pdwDataLen : [var] pbData バッファのサイズ (バイト単位) を指定する DWORD 値へのポインタ。関数が戻るとき、DWORD 値にはバッファに格納されたバイト数が含まれる。
dwFlags : [int] 将来の使用のために予約されており、ゼロでなければならない。
%inst
ハッシュオブジェクトの動作を制御するデータを取得する。

[戻り値]
関数が成功した場合、戻り値は TRUE となる。失敗した場合、戻り値は FALSE となる。拡張エラー情報を取得するには
GetLastError を呼び出す。「NTE」で始まるエラーコードは使用中の特定の CSP
が生成する。以下のエラーコードが返される可能性がある。
（以下省略）


%index
CryptGetKeyParam
鍵の動作を制御するデータを取得する。
%group
Win32 advapi32
%prm
hKey, dwParam, pbData, pdwDataLen, dwFlags
hKey : [int] クエリ対象の鍵のハンドル。
dwParam : [int] 実行するクエリの種類を指定する。
pbData : [var] データを受け取るバッファへのポインタ。このデータの形式は dwParam の値によって異なる。このバッファのサイズが不明な場合、このパラメータに NULL を渡し、pdwDataLen が指す値をゼロに設定することで、実行時に必要なサイズを取得できる。この関数は pdwDataLen が指す値に、必要なバッファサイズ (バイト単位) を格納する。詳細は Retrieving Data of Unknown Length を参照。
pdwDataLen : [var] DWORD 値へのポインタ。入力時には pbData パラメータが指すバッファのサイズ (バイト単位) を含む。関数が戻ると、この値にはバッファに格納されたバイト数が含まれる。注: バッファに返されたデータを処理する際、アプリケーションは返されたデータの実際のサイズを使用しなければならない。実際のサイズは入力時に指定したバッファサイズよりわずかに小さい可能性がある。入力時には、想定される最大出力データが収まるようバッファサイズを大きめに指定することがある。出力時、このパラメータが指す変数はバッファにコピーされたデータの実際のサイズを反映するように更新される。
dwFlags : [int] このパラメータは将来の使用のために予約されており、ゼロに設定しなければならない。
%inst
鍵の動作を制御するデータを取得する。

[戻り値]
関数が成功した場合、戻り値はゼロ以外となる。失敗した場合はゼロを返す。拡張エラー情報を取得するには GetLastError
を呼び出す。「NTE」で始まるエラーコードは使用中の特定の CSP が生成する。返される可能性のあるエラーコードには以下のものがある。
（以下省略）


%index
CryptGetProvParam
暗号化サービスプロバイダ (CSP) の動作を制御するパラメータを取得する。
%group
Win32 advapi32
%prm
hProv, dwParam, pbData, pdwDataLen, dwFlags
hProv : [int] クエリ対象となる CSP のハンドル。このハンドルは CryptAcquireContext 関数を使用して作成されていなければならない。
dwParam : [int] クエリの内容。以下のクエリが定義されている。
pbData : [var] データを受け取るバッファへのポインタ。このデータの形式は dwParam の値によって異なる。dwParam が PP_USE_HARDWARE_RNG に設定されている場合、pbData は NULL に設定しなければならない。メモリ確保のためにこの情報のサイズを設定する目的で、このパラメータは NULL にできる。詳細は Retrieving Data of Unknown Length を参照。
pdwDataLen : [var] pbData パラメータが指すバッファのサイズ (バイト単位) を指定する DWORD 値へのポインタ。関数が戻るとき、DWORD 値にはバッファに格納された、または格納されるバイト数が含まれる。注: バッファに返されたデータを処理する際、アプリケーションは返されたデータの実際のサイズを使用しなければならない。実際のサイズは入力時に指定したバッファサイズよりわずかに小さい可能性がある (入力時には通常、想定される最大出力データが収まるようバッファサイズを大きめに指定するためである)。出力時、このパラメータが指す変数はバッファにコピーされたデータの実際のサイズを反映するように更新される。PP_ENUMALGS や PP_ENUMALGS_EX が設定されている場合、pdwDataLen パラメータは若干異なる動作をする。pbData が NULL、または pdwDataLen が指す値が小さすぎる場合、このパラメータで返される値は現在読み取っている項目のサイズではなく、列挙リスト内の最大項目のサイズとなる。PP_ENUMCONTAINERS が設定されている場合、関数の最初の呼び出しでは現在のプロバイダが許可する最大キーコンテナのサイズが返される。これは、既存の最長コンテナの長さや現在のコンテナの長さを返すといった他の挙動とは対照的である。後続の列挙呼び出しでは dwLen パラメータは変更されない。列挙された各コンテナについて、呼び出し元は必要に応じてプログラム的に null 終端文字列の長さを判定できる。列挙値のいずれかが読み取られ、pbData パラメータが NULL の場合、サイズ情報を正しく取得するには CRYPT_FIRST フラグを指定する必要がある。
dwFlags : [int] dwParam が PP_KEYSET_SEC_DESCR の場合、鍵が格納されているキーコンテナのセキュリティ記述子が取得される。このケースでは、要求するセキュリティ情報を示す SECURITY_INFORMATION ビット フラグを dwFlags で渡す。これらのフラグは Platform SDK で定義されている。SECURITY_INFORMATION ビット フラグはビット単位の OR 演算で組み合わせられる。
%inst
暗号化サービスプロバイダ (CSP) の動作を制御するパラメータを取得する。

[戻り値]
関数が成功した場合、戻り値はゼロ以外 (TRUE) となる。失敗した場合、戻り値はゼロ (FALSE)
となる。拡張エラー情報を取得するには GetLastError を呼び出す。NTE で始まるエラーコードは使用中の特定の CSP
が生成する。以下のエラーコードが返される可能性がある。
（以下省略）

[備考]
この関数はマルチスレッドプログラムのスレッド上で使用してはならない。dwParam が PP_IMPTYPE の場合、pbData
に次の値が返される。
（以下省略）


%index
CryptGetUserKey
ユーザーの 2 つの公開/秘密鍵ペアのいずれかのハンドルを取得する。
%group
Win32 advapi32
%prm
hProv, dwKeySpec, phUserKey
hProv : [int] CryptAcquireContext の呼び出しで作成された暗号化サービスプロバイダ (CSP) の HCRYPTPROV ハンドル。
dwKeySpec : [int] キーコンテナから使用する秘密鍵を識別する。AT_KEYEXCHANGE または AT_SIGNATURE を指定できる。
phUserKey : [var] 取得された鍵の HCRYPTKEY ハンドルへのポインタ。鍵の使用が終わったら、CryptDestroyKey 関数を呼び出してハンドルを削除する。
%inst
ユーザーの 2 つの公開/秘密鍵ペアのいずれかのハンドルを取得する。

[戻り値]
関数が成功した場合、戻り値はゼロ以外 (TRUE) となる。失敗した場合、戻り値はゼロ (FALSE)
となる。拡張エラー情報を取得するには GetLastError を呼び出す。「NTE」で始まるエラーコードは使用中の特定の CSP
が生成する。以下のエラーコードが返される可能性がある。
（以下省略）


%index
CryptHashData
指定したハッシュオブジェクトにデータを追加する。
%group
Win32 advapi32
%prm
hHash, pbData, dwDataLen, dwFlags
hHash : [int] ハッシュオブジェクトのハンドル。
pbData : [var] ハッシュオブジェクトに追加するデータを格納するバッファへのポインタ。
dwDataLen : [int] 追加するデータのバイト数。CRYPT_USERDATA フラグが設定されている場合はゼロでなければならない。
dwFlags : [int] 以下のフラグ値が定義されている。
%inst
指定したハッシュオブジェクトにデータを追加する。

[戻り値]
関数が成功した場合、戻り値は TRUE となる。失敗した場合、戻り値は FALSE となる。拡張エラー情報を取得するには
GetLastError を呼び出す。「NTE」で始まるエラーコードは使用中の特定の CSP
が生成する。以下のエラーコードが返される可能性がある。
（以下省略）


%index
CryptHashSessionKey
セッション鍵オブジェクトの暗号ハッシュを計算する。
%group
Win32 advapi32
%prm
hHash, hKey, dwFlags
hHash : [int] ハッシュオブジェクトへのハンドル。
hKey : [int] ハッシュ化する鍵オブジェクトへのハンドル。
dwFlags : [int] 以下のフラグ値が定義されている。
%inst
セッション鍵オブジェクトの暗号ハッシュを計算する。

[戻り値]
関数が成功した場合、戻り値は TRUE となる。失敗した場合、戻り値は FALSE となる。拡張エラー情報を取得するには
GetLastError を呼び出す。「NTE」で始まるエラーコードは使用中の特定の CSP
が生成する。以下のエラーコードが返される可能性がある。
（以下省略）


%index
CryptImportKey
鍵 BLOB から暗号化サービスプロバイダ (CSP) に暗号鍵を転送する。
%group
Win32 advapi32
%prm
hProv, pbData, dwDataLen, hPubKey, dwFlags, phKey
hProv : [int] CryptAcquireContext 関数で取得した CSP のハンドル。
pbData : [var] PUBLICKEYSTRUC BLOB ヘッダーに続いて暗号化された鍵を含む BYTE 配列。この鍵 BLOB は、このアプリケーションまたは別のコンピュータで実行されている可能性のある別のアプリケーションで、CryptExportKey 関数によって作成される。
dwDataLen : [int] 鍵 BLOB の長さ (バイト単位)。
hPubKey : [int] pbData に格納された鍵を復号する暗号鍵へのハンドル。この鍵は hProv が参照するものと同じ CSP から取得しなければならない。このパラメータの意味は、CSP の種類とインポートする鍵 BLOB の種類によって異なる。
dwFlags : [int] 現在、PRIVATEKEYBLOB 形式の公開/秘密鍵ペアを CSP にインポートする場合にのみ使用される。
phKey : [var] インポートされた鍵のハンドルを受け取る HCRYPTKEY 値へのポインタ。鍵の使用が終わったら、CryptDestroyKey 関数を呼び出してハンドルを解放する。
%inst
鍵 BLOB から暗号化サービスプロバイダ (CSP) に暗号鍵を転送する。

[戻り値]
関数が成功した場合はゼロ以外を返す。失敗した場合はゼロを返す。拡張エラー情報を取得するには GetLastError
を呼び出す。「NTE」で始まるエラーコードは使用中の特定の CSP が生成する。以下のエラーコードが返される可能性がある。
（以下省略）

[備考]
Hash-Based Message Authentication Code (HMAC)
鍵をインポートするとき、呼び出し側はインポートされる鍵を PLAINTEXTKEYBLOB 型と識別し、PUBLICKEYSTRUC
BLOB ヘッダーの aiKeyAlg フィールドに適切なアルゴリズム識別子を設定しなければならない。CryptImportKey
関数は対称アルゴリズム用の平文鍵をインポートするために使用できる。ただし、使いやすさのため、代わりに CryptGenKey
関数を使用することを推奨する。平文鍵をインポートする際、pbData パラメータで渡される鍵 BLOB の構造は
PLAINTEXTKEYBLOB となる。PLAINTEXTKEYBLOB 型は、使用中の CSP
がサポートする任意のアルゴリズムや鍵種別の組み合わせで使用できる。平文鍵のインポート例については、Example C Program:
Importing a Plaintext Key を参照。次の例は、ヘッダーフィールドの設定方法を示す。
（以下省略）


%index
CryptReleaseContext
暗号化サービスプロバイダ (CSP) とキーコンテナのハンドルを解放する。
%group
Win32 advapi32
%prm
hProv, dwFlags
hProv : [int] CryptAcquireContext の呼び出しで作成された暗号化サービスプロバイダ (CSP) のハンドル。
dwFlags : [int] 将来の使用のために予約されており、ゼロでなければならない。dwFlags がゼロ以外の場合、この関数は FALSE を返すが、CSP は解放される。
%inst
暗号化サービスプロバイダ (CSP) とキーコンテナのハンドルを解放する。

[戻り値]
関数が成功した場合、戻り値はゼロ以外 (TRUE) となる。失敗した場合、戻り値はゼロ (FALSE)
となる。拡張エラー情報を取得するには GetLastError を呼び出す。次の表は、返される可能性のあるエラーコードの一部を示す。
（以下省略）

[備考]
この関数が呼び出された後、CSP セッションは終了し、hProv
ハンドルを使用して作成された既存のセッション鍵とハッシュオブジェクトはすべて無効となる。実際には、CryptReleaseContext
を呼び出す前に、これらのオブジェクトをすべて CryptDestroyKey と CryptDestroyHash
の呼び出しで破棄しておくべきである。


%index
CryptSetHashParam
ハッシュオブジェクトの動作をカスタマイズする。初期ハッシュ内容の設定や特定のハッシュアルゴリズムの選択などを行う。
%group
Win32 advapi32
%prm
hHash, dwParam, pbData, dwFlags
hHash : [int] パラメータを設定するハッシュオブジェクトへのハンドル。
dwParam : [int] 
pbData : [var] 値データのバッファ。CryptSetHashParam を呼び出す前に、このバッファに値データを格納する。このデータの形式は値番号によって異なる。
dwFlags : [int] このパラメータは将来の使用のために予約されており、ゼロに設定しなければならない。
%inst
ハッシュオブジェクトの動作をカスタマイズする。初期ハッシュ内容の設定や特定のハッシュアルゴリズムの選択などを行う。

[戻り値]
関数が成功した場合は TRUE を返す。失敗した場合は FALSE を返す。拡張エラー情報を取得するには GetLastError
を呼び出す。「NTE」で始まるエラーコードは使用中の特定の CSP が生成する。以下のエラーコードが返される可能性がある。
（以下省略）

[備考]
ときどき、別の場所で生成されたハッシュ値に署名する必要がある。これは次の操作の順序で実行できる。
（以下省略）


%index
CryptSetKeyParam
セッション鍵の動作のさまざまな側面をカスタマイズする。
%group
Win32 advapi32
%prm
hKey, dwParam, pbData, dwFlags
hKey : [int] 値を設定する鍵へのハンドル。
dwParam : [int] 以下の表に、使用できる事前定義値を示す。
pbData : [var] CryptSetKeyParam を呼び出す前に設定する値で初期化されたバッファへのポインタ。このデータの形式は dwParam の値によって異なる。
dwFlags : [int] dwParam が KP_ALGID のときにのみ使用される。dwFlags パラメータは有効化される鍵のフラグ値を渡すために使用される。dwFlags パラメータは、鍵サイズや、CryptGenKey で同じ種類の鍵を生成するときに許可される他のフラグ値などを保持できる。指定可能なフラグ値については CryptGenKey を参照。
%inst
セッション鍵の動作のさまざまな側面をカスタマイズする。

[戻り値]
関数が成功した場合、戻り値はゼロ以外 (TRUE) となる。失敗した場合、戻り値はゼロ (FALSE)
となる。拡張エラー情報を取得するには GetLastError を呼び出す。「NTE」で始まるエラーコードは使用中の特定の CSP
が生成する。以下のエラーコードが返される可能性がある。
（以下省略）

[備考]
KP_Q、KP_P、または KP_X パラメータを PREGEN Diffie-Hellman または DSS
鍵に設定する場合、鍵の長さは、鍵が CryptGenKey で作成されたときに dwFlags パラメータの上位 16
ビットを使って設定した鍵長と互換である必要がある。CryptGenKey
で鍵長が設定されていなかった場合、既定の鍵長が使用されていた。P、Q、X を設定するために既定以外の鍵長が使用されると、エラーとなる。


%index
CryptSetProvParam
暗号化サービスプロバイダ (CSP) の動作をカスタマイズする。この関数は、CSP に関連付けられたキーコンテナにセキュリティ記述子を設定して、そのキーコンテナ内の秘密鍵へのアクセスを制御するためによく使用される。
%group
Win32 advapi32
%prm
hProv, dwParam, pbData, dwFlags
hProv : [int] 値を設定する CSP のハンドル。このハンドルは CryptAcquireContext 関数を使用して既に作成されていなければならない。
dwParam : [int] 
pbData : [var] プロバイダパラメータとして設定する値を格納するデータバッファへのポインタ。このデータの形式は dwParam の値によって異なる。dwParam が PP_USE_HARDWARE_RNG を含む場合、このパラメータは NULL でなければならない。
dwFlags : [int] dwParam が PP_KEYSET_SEC_DESCR を含む場合、dwFlags には Platform SDK で定義された SECURITY_INFORMATION の該当するビット フラグが入る。キーコンテナのセキュリティは SetFileSecurity と GetFileSecurity を使って処理される。これらのビット フラグはビット単位の OR 演算で組み合わせることができる。詳細は CryptGetProvParam を参照。dwParam が PP_USE_HARDWARE_RNG または PP_DELETEKEY の場合、dwFlags はゼロに設定しなければならない。
%inst
暗号化サービスプロバイダ (CSP) の動作をカスタマイズする。この関数は、CSP
に関連付けられたキーコンテナにセキュリティ記述子を設定して、そのキーコンテナ内の秘密鍵へのアクセスを制御するためによく使用される。

[戻り値]
関数が成功した場合、戻り値はゼロ以外 (TRUE) となる。失敗した場合、戻り値はゼロ (FALSE)
となる。拡張エラー情報を取得するには GetLastError を呼び出す。「NTE」で始まるエラーコードは使用中の特定の CSP
が生成する。エラーコードには以下のものがある。
（以下省略）


%index
CryptSetProviderW
現在のユーザーの既定の暗号化サービスプロバイダ (CSP) を指定する。(Unicode)
%group
Win32 advapi32
%prm
pszProvName, dwProvType
pszProvName : [wstr] 新しい既定の CSP の名前。指定した CSP はコンピュータにインストールされていなければならない。利用可能な暗号化プロバイダの一覧については Cryptographic Provider Names を参照。
dwProvType : [int] pszProvName で指定される CSP のプロバイダ種別。
%inst
現在のユーザーの既定の暗号化サービスプロバイダ (CSP) を指定する。(Unicode)

[戻り値]
関数が成功した場合、戻り値はゼロ以外 (TRUE) となる。失敗した場合、戻り値はゼロ (FALSE)
となる。拡張エラー情報を取得するには GetLastError を呼び出す。次の表は、返される可能性のあるエラーコードの一部を示す。
（以下省略）

[備考]
一般的なアプリケーションは CryptAcquireContext を呼び出すときに CSP
名を指定しない。ただし、アプリケーションには特定の CSP を選択するオプションがある。これによりユーザーは適切なセキュリティレベルの
CSP を自由に選択できる。CryptSetProvider
の呼び出しは、それ以降に実行されるすべてのアプリケーションが使用する特定の種類の CSP
を決定するため、この関数はユーザーの同意なしに呼び出してはならない。
> [!NOTE] > wincrypt.h ヘッダーは CryptSetProvider をエイリアスとして定義しており、UNICODE
プリプロセッサ定数の定義に応じて、この関数の ANSI 版と Unicode
版を自動的に選択する。エンコーディングに依存しないエイリアスと、エンコーディングに依存しないコードとを混在させると、コンパイルエラーや実行時エラーを引き起こす不整合が生じる可能性がある。詳細は
[関数プロトタイプの規約](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
CryptSetProviderExW
ローカルコンピュータまたは現在のユーザーに対して、指定したプロバイダ種別の既定の暗号化サービスプロバイダ (CSP) を指定する。(Unicode)
%group
Win32 advapi32
%prm
pszProvName, dwProvType, pdwReserved, dwFlags
pszProvName : [wstr] 新しい既定の CSP の名前。コンピュータにインストールされている CSP でなければならない。利用可能な暗号化プロバイダの一覧については Cryptographic Provider Names を参照。
dwProvType : [int] pszProvName で指定される CSP のプロバイダ種別。
pdwReserved : [var] このパラメータは将来の使用のために予約されており、NULL でなければならない。
dwFlags : [int] 以下のフラグ値が定義されている。
%inst
ローカルコンピュータまたは現在のユーザーに対して、指定したプロバイダ種別の既定の暗号化サービスプロバイダ (CSP)
を指定する。(Unicode)

[戻り値]
関数が成功した場合、戻り値はゼロ以外 (TRUE) となる。失敗した場合、戻り値はゼロ (FALSE)
となる。拡張エラー情報を取得するには GetLastError を呼び出す。返される可能性のあるエラーコードには以下の表に示すものがある。
（以下省略）

[備考]
ほとんどのアプリケーションは CryptAcquireContext 関数を呼び出すときに CSP
名を指定しない。ただし、アプリケーションは CSP 名を指定することができ、これにより適切なセキュリティレベルの CSP
を選択できる。CryptSetProviderEx の呼び出しは、それ以降にすべてのアプリケーションが使用する特定の種類の CSP
を決定するため、CryptSetProviderEx はユーザーの同意なしに呼び出してはならない。
> [!NOTE] > wincrypt.h ヘッダーは CryptSetProviderEx
をエイリアスとして定義しており、UNICODE プリプロセッサ定数の定義に応じて、この関数の ANSI 版と Unicode
版を自動的に選択する。エンコーディングに依存しないエイリアスと、エンコーディングに依存しないコードとを混在させると、コンパイルエラーや実行時エラーを引き起こす不整合が生じる可能性がある。詳細は
[関数プロトタイプの規約](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
CryptSignHashW
データに署名する。(CryptSignHashW)
%group
Win32 advapi32
%prm
hHash, dwKeySpec, szDescription, dwFlags, pbSignature, pdwSigLen
hHash : [int] 署名するハッシュオブジェクトのハンドル。
dwKeySpec : [int] プロバイダのコンテナから使用する秘密鍵を識別する。AT_KEYEXCHANGE または AT_SIGNATURE を指定できる。
szDescription : [wstr] このパラメータは既に使用されておらず、セキュリティ上の脆弱性を防ぐために NULL に設定しなければならない。ただし、Microsoft Base Cryptographic Provider の後方互換性のため、引き続きサポートされている。
dwFlags : [int] 以下のフラグ値が定義されている。
pbSignature : [var] 署名データを受け取るバッファへのポインタ。
pdwSigLen : [var] pbSignature バッファのサイズ (バイト単位) を指定する DWORD 値へのポインタ。関数が戻るとき、DWORD 値にはバッファに格納されたバイト数が含まれる。
%inst
データに署名する。(CryptSignHashW)

[戻り値]
関数が成功した場合は TRUE を返す。失敗した場合は FALSE を返す。拡張エラー情報を取得するには GetLastError
を呼び出す。「NTE」で始まるエラーコードは使用中の特定の CSP が生成する。以下のエラーコードが返される可能性がある。
（以下省略）

[備考]
この関数を呼び出す前に、CryptCreateHash 関数を呼び出してハッシュオブジェクトへのハンドルを取得しなければならない。続いて
CryptHashData または CryptHashSessionKey
関数を使用して、データまたはセッション鍵をハッシュオブジェクトに追加する。CryptSignHash 関数はハッシュを確定させる。DSS
CSP は MD5 および SHA ハッシュアルゴリズムによるハッシュ化をサポートしているが、DSS CSP で署名できるのは SHA
ハッシュのみである。この関数が呼び出された後は、ハッシュにデータを追加できない。CryptHashData や
CryptHashSessionKey
の追加呼び出しは失敗する。アプリケーションがハッシュの使用を終えた後は、CryptDestroyHash
関数を呼び出してハッシュオブジェクトを破棄する。既定では、Microsoft の RSA プロバイダは署名に PKCS #1
パディング方式を使用する。署名の DigestInfo 要素内のハッシュ OID は、ハッシュオブジェクトに関連付けられたアルゴリズム
OID に自動的に設定される。CRYPT_NOHASHOID フラグを使用すると、この OID
が署名から省略される。ときどき、別の場所で生成されたハッシュ値に署名する必要がある。これは次の操作の順序で実行できる。
（以下省略）


%index
CryptVerifySignatureW
ハッシュオブジェクトの署名を検証する。(Unicode)
%group
Win32 advapi32
%prm
hHash, pbSignature, dwSigLen, hPubKey, szDescription, dwFlags
hHash : [int] 検証するハッシュオブジェクトへのハンドル。
pbSignature : [var] 検証する署名データのアドレス。
dwSigLen : [int] pbSignature 署名データのバイト数。
hPubKey : [int] 署名を認証するために使用する公開鍵へのハンドル。この公開鍵は、元々デジタル署名を作成するために使用された鍵ペアに属している必要がある。
szDescription : [wstr] このパラメータはもはや使用すべきではなく、セキュリティ上の脆弱性を防ぐために NULL に設定しなければならない。ただし、Microsoft Base Cryptographic Provider の後方互換性のため、引き続きサポートされている。
dwFlags : [int] 以下のフラグ値が定義されている。
%inst
ハッシュオブジェクトの署名を検証する。(Unicode)

[戻り値]
関数が成功した場合、戻り値は TRUE となる。失敗した場合、戻り値は FALSE となる。拡張エラー情報を取得するには
GetLastError を呼び出す。「NTE」で始まるエラーコードは使用中の特定の CSP
が生成する。以下のエラーコードが返される可能性がある。
（以下省略）

[備考]
CryptVerifySignature
関数はハッシュを確定させる。この呼び出しの後は、ハッシュにデータを追加できない。CryptHashData や
CryptHashSessionKey
の追加呼び出しは失敗する。アプリケーションがハッシュの使用を終えた後は、CryptDestroyHash
を呼び出してハッシュオブジェクトを破棄する。.NET Framework API で署名を生成し、それを
CryptVerifySignature 関数で検証しようとすると、関数は失敗し GetLastError は
NTE_BAD_SIGNATURE を返す。これはネイティブ Win32 API と .NET Framework API
でバイト順序が異なるためである。ネイティブ暗号 API はリトルエンディアンのバイト順を使用するが、.NET Framework API
はビッグエンディアンのバイト順を使用する。.NET Framework API
で生成した署名を検証する場合は、CryptVerifySignature
関数を呼び出して署名を検証する前に、署名バイトの順序を入れ替えなければならない。


%index
DecryptFileW
暗号化されたファイルまたはディレクトリを復号する。(Unicode)
%group
Win32 advapi32
%prm
lpFileName, dwReserved
lpFileName : [wstr] 復号するファイルまたはディレクトリの名前。呼び出し側は FILE_READ_DATA、FILE_WRITE_DATA、FILE_READ_ATTRIBUTES、FILE_WRITE_ATTRIBUTES、SYNCHRONIZE の各アクセス権を持っている必要がある。詳細は File Security and Access Rights を参照。
dwReserved : [int] 予約済み。ゼロでなければならない。
%inst
暗号化されたファイルまたはディレクトリを復号する。(Unicode)

[戻り値]
関数が成功した場合、戻り値はゼロ以外となる。失敗した場合、戻り値はゼロとなる。拡張エラー情報を取得するには GetLastError
を呼び出す。

[備考]
DecryptFile
関数は復号対象のファイルへの排他アクセスを必要とし、他のプロセスがそのファイルを使用している場合は失敗する。ファイルが暗号化されていない場合、DecryptFile
は単にゼロ以外の値を返し、成功を示す。lpFileName
が読み取り専用のファイルを指定している場合、関数は失敗し、GetLastError は ERROR_FILE_READ_ONLY
を返す。lpFileName
が読み取り専用ファイルを含むディレクトリを指定している場合、関数は成功するがディレクトリは復号されない。Windows 8、Windows
Server 2012 以降では、この関数は次の技術でサポートされている。
（以下省略）


%index
DeleteAce
アクセス制御リスト (ACL) からアクセス制御エントリ (ACE) を削除する。
%group
Win32 advapi32
%prm
pAcl, dwAceIndex
pAcl : [var] ACL へのポインタ。dwAceIndex パラメータで指定された ACE がこの ACL から削除される。
dwAceIndex : [int] 削除する ACE。値ゼロは ACL の最初の ACE、1 は 2 番目の ACE に対応する。
%inst
アクセス制御リスト (ACL) からアクセス制御エントリ (ACE) を削除する。

[戻り値]
関数が成功した場合はゼロ以外を返す。失敗した場合は戻り値がゼロとなる。拡張エラー情報を取得するには GetLastError を呼び出す。

[備考]
アプリケーションは GetAclInformation 関数で取得した ACL_SIZE_INFORMATION 構造体を使用して、ACL
のサイズとそれに含まれる ACE の数を確認できる。GetAce 関数は個々の ACE に関する情報を取得する。


%index
DeleteService
指定したサービスをサービスコントロールマネージャデータベースから削除するようにマークする。
%group
Win32 advapi32
%prm
hService
hService : [intptr] サービスへのハンドル。このハンドルは OpenService または CreateService 関数によって返され、DELETE アクセス権を持っている必要がある。詳細は Service Security and Access Rights を参照。
%inst
指定したサービスをサービスコントロールマネージャデータベースから削除するようにマークする。

[戻り値]
関数が成功した場合、戻り値はゼロ以外となる。失敗した場合、戻り値はゼロとなる。拡張エラー情報を取得するには GetLastError
を呼び出す。以下のエラーコードはサービスコントロールマネージャによって設定される可能性がある。他のエラーコードは、サービスコントロールマネージャが呼び出すレジストリ関数によって設定される可能性がある。
（以下省略）

[備考]
DeleteService
関数はサービスをサービスコントロールマネージャデータベースから削除するようにマークする。すべての開いているサービスへのハンドルが
CloseServiceHandle 関数の呼び出しで閉じられ、かつサービスが実行中でない状態になるまで、データベース
エントリは削除されない。実行中のサービスは、SERVICE_CONTROL_STOP 制御コードを指定した ControlService
関数の呼び出しで停止される。サービスを停止できない場合、データベース
エントリはシステムが再起動されたときに削除される。サービスコントロールマネージャは、レジストリからサービスキーとそのサブキーを削除することでサービスを削除する。


%index
DeregisterEventSource
指定したイベントログを閉じる。(DeregisterEventSource)
%group
Win32 advapi32
%prm
hEventLog
hEventLog : [intptr] イベントログへのハンドル。RegisterEventSource 関数がこのハンドルを返す。
%inst
指定したイベントログを閉じる。(DeregisterEventSource)

[戻り値]
関数が成功した場合、戻り値はゼロ以外となる。
失敗した場合、戻り値はゼロとなる。拡張エラー情報を取得するには GetLastError を呼び出す。


%index
DestroyPrivateObjectSecurity
プライベートオブジェクトのセキュリティ記述子を削除する。
%group
Win32 advapi32
%prm
ObjectDescriptor
ObjectDescriptor : [var] 削除する SECURITY_DESCRIPTOR 構造体へのポインタへのポインタ。このセキュリティ記述子は CreatePrivateObjectSecurity 関数の呼び出しで作成されたものでなければならない。
%inst
プライベートオブジェクトのセキュリティ記述子を削除する。

[戻り値]
関数が成功した場合、戻り値はゼロ以外となる。失敗した場合、戻り値はゼロとなる。拡張エラー情報を取得するには GetLastError
を呼び出す。


%index
DuplicateEncryptionInfoFile
あるファイルまたはディレクトリから別のファイルまたはディレクトリに EFS メタデータをコピーする。
%group
Win32 advapi32
%prm
SrcFileName, DstFileName, dwCreationDistribution, dwAttributes, lpSecurityAttributes
SrcFileName : [wstr] EFS メタデータのコピー元となるファイルまたはディレクトリの名前。このコピー元ファイルまたはディレクトリは暗号化されている必要がある。
DstFileName : [wstr] EFS メタデータのコピー先となるファイルまたはディレクトリの名前。
dwCreationDistribution : [int] DstFileName パラメータの値で指定されるコピー先のファイルまたはディレクトリをどのように開くかを記述する。このパラメータの有効な値は以下のとおり。
dwAttributes : [int] コピー先のファイルまたはディレクトリのファイル属性。FILE_READ_ONLY 属性は現在、この関数では処理されない。
lpSecurityAttributes : [var] コピー先のファイルまたはディレクトリが存在しない場合、そのセキュリティ属性を指定する SECURITY_ATTRIBUTES 構造体へのポインタ。NULL を指定した場合、ファイルまたはディレクトリには既定のセキュリティ記述子が与えられる。ファイルまたはディレクトリ用の既定のセキュリティ記述子の ACL は親ディレクトリから継承される。
%inst
あるファイルまたはディレクトリから別のファイルまたはディレクトリに EFS メタデータをコピーする。

[戻り値]
関数が成功した場合、戻り値は ERROR_SUCCESS
となる。失敗した場合、戻り値はシステムエラーコードとなる。エラーコードの完全な一覧は System Error Codes または
WinError.h ヘッダーファイルを参照。

[備考]
この関数の呼び出しには、コピー先のファイルまたはディレクトリへの排他アクセスが EFS
に必要である。このアクセスが提供されない場合、この関数は失敗する。呼び出し側はコピー元のファイルまたはディレクトリに対する EFS
キーを持ち、少なくともコピー元のファイルまたはディレクトリに対する READ_ATTRIBUTE ACL
を持つ必要がある。指定されたコピー元とコピー先のファイルまたはディレクトリは同じコンピュータに存在する必要があり、そうでない場合はエラーが返される。Windows
8 および Windows Server 2012 では、この関数は次の技術でサポートされている。
（以下省略）


%index
DuplicateToken
既存のアクセストークンを複製して新しいアクセストークンを作成する。
%group
Win32 advapi32
%prm
ExistingTokenHandle, ImpersonationLevel, DuplicateTokenHandle
ExistingTokenHandle : [intptr] TOKEN_DUPLICATE アクセスで開いたアクセストークンへのハンドル。
ImpersonationLevel : [int] 新しいトークンの偽装レベルを指定する SECURITY_IMPERSONATION_LEVEL 列挙型を指定する。
DuplicateTokenHandle : [intptr] 複製されたトークンへのハンドルを受け取る変数へのポインタ。このハンドルは新しいトークンに対して TOKEN_IMPERSONATE および TOKEN_QUERY のアクセス権を持つ。新しいトークンの使用が終わったら、CloseHandle 関数を呼び出してトークンハンドルを閉じる。
%inst
既存のアクセストークンを複製して新しいアクセストークンを作成する。

[戻り値]
関数が成功した場合、戻り値はゼロ以外となる。失敗した場合、戻り値はゼロとなる。拡張エラー情報を取得するには GetLastError
を呼び出す。

[備考]
DuplicateToken 関数は偽装トークンを作成し、SetThreadToken や ImpersonateLoggedOnUser
などの関数で使用できる。DuplicateToken で作成したトークンは、プライマリトークンを必要とする
CreateProcessAsUser 関数では使用できない。CreateProcessAsUser
に渡せるトークンを作成するには、DuplicateTokenEx 関数を使用する。


%index
DuplicateTokenEx
既存のトークンを複製して新しいアクセストークンを作成する。この関数は、プライマリトークンまたは偽装トークンのいずれかを作成できる。
%group
Win32 advapi32
%prm
hExistingToken, dwDesiredAccess, lpTokenAttributes, ImpersonationLevel, TokenType, phNewToken
hExistingToken : [intptr] TOKEN_DUPLICATE アクセスで開いたアクセストークンへのハンドル。
dwDesiredAccess : [int] 新しいトークンに要求するアクセス権を指定する。DuplicateTokenEx 関数は要求されたアクセス権を既存のトークンの任意アクセス制御リスト (DACL) と比較して、どの権利が許可または拒否されるかを判定する。既存のトークンと同じアクセス権を要求するにはゼロを指定する。呼び出し側に対して有効なすべてのアクセス権を要求するには MAXIMUM_ALLOWED を指定する。
lpTokenAttributes : [var] 新しいトークンのセキュリティ記述子を指定し、子プロセスがそのトークンを継承できるかどうかを決定する SECURITY_ATTRIBUTES 構造体へのポインタ。lpTokenAttributes が NULL の場合、トークンは既定のセキュリティ記述子を取得し、ハンドルは継承できない。セキュリティ記述子にシステム アクセス制御リスト (SACL) が含まれている場合、dwDesiredAccess で要求されていなくてもトークンには ACCESS_SYSTEM_SECURITY アクセス権が与えられる。新しいトークンのセキュリティ記述子に所有者を設定するには、呼び出し元プロセスのトークンが SE_RESTORE_NAME 特権を設定している必要がある。
ImpersonationLevel : [int] 新しいトークンの偽装レベルを示す SECURITY_IMPERSONATION_LEVEL 列挙の値を指定する。
TokenType : [int] 
phNewToken : [intptr] 新しいトークンを受け取る HANDLE 変数へのポインタ。新しいトークンの使用が終わったら、CloseHandle 関数を呼び出してトークンハンドルを閉じる。
%inst
既存のトークンを複製して新しいアクセストークンを作成する。この関数は、プライマリトークンまたは偽装トークンのいずれかを作成できる。

[戻り値]
関数が成功した場合はゼロ以外の値を返す。失敗した場合はゼロを返す。拡張エラー情報を取得するには GetLastError を呼び出す。

[備考]
DuplicateTokenEx 関数を使用すると、CreateProcessAsUser
関数で使用できるプライマリトークンを作成できる。これにより、クライアントを偽装しているサーバアプリケーションが、クライアントのセキュリティコンテキストを持つプロセスを作成できる。DuplicateToken
関数は偽装トークンしか作成できず、これは CreateProcessAsUser には無効である点に注意する。以下は
DuplicateTokenEx
を使用してプライマリトークンを作成する典型的なシナリオである。サーバアプリケーションが、ImpersonateNamedPipeClient
などの偽装関数のいずれかを呼び出すスレッドを作成してクライアントを偽装する。偽装中のスレッドは OpenThreadToken
関数を呼び出して自身のトークンを取得する。これはクライアントのセキュリティコンテキストを持つ偽装トークンである。スレッドはこの偽装トークンを
DuplicateTokenEx の呼び出しで指定し、TokenPrimary フラグを指定する。DuplicateTokenEx
関数はクライアントのセキュリティコンテキストを持つプライマリトークンを作成する。


%index
EnableTrace
トレースセッション コントローラは、EnableTrace を呼び出して ETW イベントプロバイダがトレースセッションにイベントをどのようにログ記録するかを構成する。EnableTraceEx2 関数がこの関数に代わる。
%group
Win32 advapi32
%prm
Enable, EnableFlag, EnableLevel, ControlGuid, TraceHandle
Enable : [int] プロバイダからのイベント受信を有効化する場合、またはプロバイダからのイベント受信時に使用する設定を調整する場合 (たとえばレベルやキーワードを変更する場合) は 1 を設定する。プロバイダからのイベント受信を無効化する場合は 0 を設定する。
EnableFlag : [int] プロバイダに書き込ませたいイベントのカテゴリを決定するキーワードの 32 ビット ビットマスク。プロバイダは通常、イベントのキーワード ビットがこの値で設定されたビットの **いずれか** と一致する場合、またはイベントにキーワード ビットが設定されていない場合、加えて _EnableLevel_ の条件を満たす場合にイベントを書き込む。> [!Note] > EventRegister ベースのプロバイダは 64 ビット キーワードをサポートする。64 ビット _MatchAnyKeyword_ マスクを使用してプロバイダを有効化するには **EnableTraceEx2** を使用する。
EnableLevel : [int] プロバイダに書き込ませたいイベントの最大レベルを示す値。プロバイダは通常、イベントのレベルがこの値以下であり、かつ _EnableFlag_ の条件を満たす場合にイベントを書き込む。この値は 1 から 255 の範囲でなければならない。Microsoft はレベル 1 から 5 のセマンティクスを以下のように定義している。値が小さいほど重大なイベントを示す。各 _EnableLevel_ 値は、指定されたレベルとそれより重大なすべてのレベルを有効化する。たとえば `TRACE_LEVEL_WARNING` を指定すると、コンシューマは警告、エラー、致命的イベントを受け取る。| 値                              | 意味                                       | | ------------------------------- | ------------------------------------------ | | **TRACE_LEVEL_CRITICAL** (1)    | 異常終了または終了イベント                 | | **TRACE_LEVEL_ERROR** (2)       | 重大なエラーイベント                       | | **TRACE_LEVEL_WARNING** (3)     | 割り当て失敗などの警告イベント             | | **TRACE_LEVEL_INFORMATION** (4) | エラーではない情報イベント                 | | **TRACE_LEVEL_VERBOSE** (5)     | 詳細な診断イベント                         | `TRACE_LEVEL` 定数は _evntrace.h_ で定義されている。同等の `WINMETA_LEVEL` 定数は _winmeta.h_ で定義されている。
ControlGuid : [var] 有効化または無効化するイベントプロバイダの制御 GUID (プロバイダ ID)。
TraceHandle : [int] プロバイダを構成するイベントトレーシングセッションのハンドル。新しいトレースが開始されたとき、[StartTrace](/windows/win32/api/evntrace/nf-evntrace-starttracea) 関数がこのハンドルを返す。既存のトレースのハンドルを取得するには、[ControlTrace](/windows/win32/api/evntrace/nf-evntrace-controltracew) を使用してトレース名に基づいてトレースプロパティをクエリし、返された `EVENT_TRACE_PROPERTIES` データの **Wnode.HistoricalContext** フィールドからハンドルを取得する。
%inst
トレースセッション コントローラは、EnableTrace を呼び出して ETW
イベントプロバイダがトレースセッションにイベントをどのようにログ記録するかを構成する。EnableTraceEx2
関数がこの関数に代わる。

[戻り値]
関数が成功した場合、戻り値は ERROR_SUCCESS となる。失敗した場合、戻り値は [system error
codes](/windows/win32/debug/system-error-codes)
のいずれかとなる。一般的なエラーとその原因を以下に示す。- **ERROR_INVALID_PARAMETER**
次のいずれかが真である。- _ControlGuid_ が **NULL** である。- _TraceHandle_ が **NULL**
である。- **ERROR_INVALID_FUNCTION** プロバイダが登録されていない場合は有効化フラグとレベルを変更できない。-
**ERROR_WMI_GUID_NOT_FOUND** プロバイダが登録されていない。KB307331 または Windows 2000
Service Pack 4
がインストールされていて、プロバイダが登録されていない場合に発生する。このエラーを避けるために、プロバイダをあらかじめ登録する必要がある。-
**ERROR_NO_SYSTEM_RESOURCES** プロバイダを有効にできるトレース セッション数を超過した。-
**ERROR_ACCESS_DENIED** 管理者特権を持つユーザー、`Performance Log Users`
グループのユーザー、`LocalSystem`、`LocalService`、`NetworkService`
として実行されているサービスのみが、クロス プロセス
セッションに対してイベントプロバイダを有効化できる。制限付きユーザーにイベントプロバイダを有効化する機能を付与するには、そのユーザーを
`Performance Log Users`
グループに追加するか、[EventAccessControl](/windows/desktop/api/evntcons/nf-evntcons-eventaccesscontrol)
を参照する。**Windows XP と Windows 2000:** 誰でもイベントプロバイダを有効化できる。

[備考]
イベント トレース
コントローラは、この関数を呼び出してセッションにイベントを書き込むイベントプロバイダを構成する。たとえば、コントローラはプロバイダからのイベント収集を開始する、プロバイダから収集しているイベントのレベルやキーワードを調整する、またはプロバイダからのイベント収集を停止するためにこの関数を呼び出すことができる。この関数は非推奨である。追加機能のため、新しいコードでは
[EnableTraceEx2](/windows/win32/api/evntrace/nf-evntrace-enabletraceex2)
を使用すべきである。次の 2 つの関数呼び出しは等価である。
（以下省略）


%index
EnableTraceEx
トレースセッション コントローラは、EnableTraceEx を呼び出して ETW イベントプロバイダがトレースセッションにイベントをどのようにログ記録するかを構成する。EnableTraceEx2 関数がこの関数に代わる。
%group
Win32 advapi32
%prm
ProviderId, SourceId, TraceHandle, IsEnabled, Level, MatchAnyKeyword, MatchAllKeyword, EnableProperty, EnableFilterDesc
ProviderId : [var] 構成したいイベントプロバイダのプロバイダ ID (制御 GUID)。
SourceId : [var] この構成要求のソースを一意に識別できる GUID、またはソース ID が不要な場合は **NULL** (_SourceId_ を `&GUID_NULL` に設定するのと同等)。指定された場合、この値はプロバイダの [EnableCallback](/windows/win32/api/evntprov/nc-evntprov-penablecallback) を呼び出すときの _SourceId_ パラメータとして使用される。> [!Note] > **EnableTrace** の呼び出しとプロバイダの **EnableCallback** の対応する呼び出しとの間に、常に直接的なマッピングがあるとは限らない。たとえば、まだ登録されていないプロバイダに対して **EnableTrace** が呼び出された場合、**EnableCallback** の呼び出しは登録が発生するまで延期される。また、トレース コンシューマ セッションが停止された場合、対応する **EnableTrace** の呼び出しがなくても ETW は **EnableCallback** を呼び出す。そのような場合、**EnableTrace** は _SourceId_ が **GUID_NULL** に設定された状態で呼び出される。
TraceHandle : [int] プロバイダを構成するイベントトレーシングセッションのハンドル。新しいトレースが開始されたとき、[StartTrace](/windows/win32/api/evntrace/nf-evntrace-starttracea) 関数がこのハンドルを返す。既存のトレースのハンドルを取得するには、[ControlTrace](/windows/win32/api/evntrace/nf-evntrace-controltracew) を使用してトレース名に基づいてトレースプロパティをクエリし、返された `EVENT_TRACE_PROPERTIES` データの **Wnode.HistoricalContext** フィールドからハンドルを取得する。
IsEnabled : [int] プロバイダからのイベント受信を有効化する場合、またはプロバイダからのイベント受信時に使用する設定を調整する場合 (たとえばレベルやキーワードを変更する場合) は 1 を設定する。プロバイダからのイベント受信を無効化する場合は 0 を設定する。
Level : [int] プロバイダに書き込ませたいイベントの最大レベルを示す値。プロバイダは通常、イベントのレベルがこの値以下であり、かつ _MatchAnyKeyword_ と _MatchAllKeyword_ の条件を満たす場合にイベントを書き込む。Microsoft はレベル 1 から 5 のセマンティクスを以下のように定義している。値が小さいほど重大なイベントを示す。各 _EnableLevel_ の値は、指定されたレベルとそれより重大なすべてのレベルを有効化する。たとえば `TRACE_LEVEL_WARNING` を指定すると、コンシューマは警告、エラー、致命的イベントを受け取る。| 値                              | 意味                                       | | ------------------------------- | ------------------------------------------ | | **TRACE_LEVEL_CRITICAL** (1)    | 異常終了または終了イベント                 | | **TRACE_LEVEL_ERROR** (2)       | 重大なエラーイベント                       | | **TRACE_LEVEL_WARNING** (3)     | 割り当て失敗などの警告イベント             | | **TRACE_LEVEL_INFORMATION** (4) | エラーではない情報イベント                 | | **TRACE_LEVEL_VERBOSE** (5)     | 詳細な診断イベント                         | `TRACE_LEVEL` 定数は _evntrace.h_ で定義されている。同等の `WINMETA_LEVEL` 定数は _winmeta.h_ で定義されている。
MatchAnyKeyword : [int64] プロバイダに書き込ませたいイベントのカテゴリを決定するキーワードの 64 ビット ビットマスク。プロバイダは通常、イベントのキーワード ビットがこの値で設定されたビットの **いずれか** と一致する場合、またはイベントにキーワード ビットが設定されていない場合、加えて _Level_ と _MatchAllKeyword_ の条件を満たす場合にイベントを書き込む。
MatchAllKeyword : [int64] プロバイダに書き込ませたいイベントを制限するキーワードの 64 ビット ビットマスク。プロバイダは通常、イベントのキーワード ビットがこの値で設定されたビットの **すべて** と一致する場合、またはイベントにキーワード ビットが設定されていない場合、加えて _Level_ と _MatchAnyKeyword_ の条件を満たす場合にイベントを書き込む。この値はしばしば 0 に設定される。
EnableProperty : [int] ETW ランタイムがこのプロバイダからイベントを収集するときに有効化すべき特別な動作を指定するフラグ。特別な動作を有効化するには、次のフラグの 1 つ以上を指定する。それ以外の場合は _EnableProperty_ を 0 に設定する。> [!Note] > これらのフラグのいくつかは、ETW が各イベントに追加情報を含めるべきであることを示す。データはイベントの [extended data item](/windows/win32/api/evntcons/ns-evntcons-event_header_extended_data_item) セクションに書き込まれる。| 値                                         | 意味                                                                        | | ------------------------------------------ | --------------------------------------------------------------------------- | | **EVENT_ENABLE_PROPERTY_SID**              | 拡張データにユーザーのセキュリティ識別子 (SID) を含める。                   | | **EVENT_ENABLE_PROPERTY_TS_ID**            | 拡張データにターミナル セッション識別子を含める。                           | | **EVENT_ENABLE_PROPERTY_IGNORE_KEYWORD_0** | トレースセッションはキーワードが 0 のイベントを記録してはならない。         |
EnableFilterDesc : [var] フィルタ データを指す [EVENT_FILTER_DESCRIPTOR](/windows/desktop/api/evntprov/ns-evntprov-event_filter_descriptor) 構造体。プロバイダはこれを使用してフィルタ条件と一致しないイベントがセッションに書き込まれないようにする。プロバイダがデータのレイアウトと、フィルタをイベントのデータにどのように適用するかを決定する。セッションはプロバイダに 1 つのフィルタのみを渡すことができる。セッションは [TdhEnumerateProviderFilters](/windows/desktop/api/tdh/nf-tdh-tdhenumerateproviderfilters) 関数を呼び出して、プロバイダが登録サポートを提供しているフィルタを調べることができる。
%inst
トレースセッション コントローラは、EnableTraceEx を呼び出して ETW
イベントプロバイダがトレースセッションにイベントをどのようにログ記録するかを構成する。EnableTraceEx2
関数がこの関数に代わる。

[戻り値]
関数が成功した場合、戻り値は ERROR_SUCCESS となる。失敗した場合、戻り値は [system error
codes](/windows/win32/debug/system-error-codes)
のいずれかとなる。一般的なエラーとその原因を以下に示す。- **ERROR_INVALID_PARAMETER**
次のいずれかが真である。- _ProviderId_ が **NULL** である。- _TraceHandle_ が **NULL**
である。- **ERROR_INVALID_FUNCTION** プロバイダが登録されていない場合はレベルを更新できない。-
**ERROR_NO_SYSTEM_RESOURCES** プロバイダを有効にできるトレース セッション数を超過した。-
**ERROR_ACCESS_DENIED** 管理者特権を持つユーザー、`Performance Log Users`
グループのユーザー、`LocalSystem`、`LocalService`、`NetworkService`
として実行されているサービスのみが、クロス プロセス
セッションに対してイベントプロバイダを有効化できる。制限付きユーザーにイベントプロバイダを有効化する機能を付与するには、そのユーザーを
`Performance Log Users`
グループに追加するか、[EventAccessControl](/windows/desktop/api/evntcons/nf-evntcons-eventaccesscontrol)
を参照する。**Windows XP と Windows 2000:** 誰でもイベントプロバイダを有効化できる。

[備考]
イベント トレース
コントローラは、この関数を呼び出してセッションにイベントを書き込むイベントプロバイダを構成する。たとえば、コントローラはプロバイダからのイベント収集を開始する、プロバイダから収集しているイベントのレベルやキーワードを調整する、またはプロバイダからのイベント収集を停止するためにこの関数を呼び出すことができる。この関数は非推奨である。追加機能のため、新しいコードでは
[EnableTraceEx2](/windows/win32/api/evntrace/nf-evntrace-enabletraceex2)
を使用すべきである。ほとんどの場合、**EnableTraceEx** の呼び出しは次のように **EnableTraceEx2**
に変換できる。
（以下省略）


%index
EnableTraceEx2
トレースセッション コントローラは、EnableTraceEx2 を呼び出して ETW イベントプロバイダがトレースセッションにイベントをどのようにログ記録するかを構成する。
%group
Win32 advapi32
%prm
TraceHandle, ProviderId, ControlCode, Level, MatchAnyKeyword, MatchAllKeyword, Timeout, EnableParameters
TraceHandle : [int] プロバイダを構成するイベントトレーシングセッションのハンドル。新しいトレースが開始されたとき、[StartTrace](/windows/win32/api/evntrace/nf-evntrace-starttracea) 関数がこのハンドルを返す。既存のトレースのハンドルを取得するには、[ControlTrace](/windows/win32/api/evntrace/nf-evntrace-controltracew) を使用してトレース名に基づいてトレースプロパティをクエリし、返された `EVENT_TRACE_PROPERTIES` データの **Wnode.HistoricalContext** フィールドからハンドルを取得する。
ProviderId : [var] 構成したいイベントプロバイダのプロバイダ ID (制御 GUID)。
ControlCode : [int] 次の制御コードのいずれかを指定できる。| 値                                      | 意味                                                                                   | | --------------------------------------- | -------------------------------------------------------------------------------------- | | **EVENT_CONTROL_CODE_DISABLE_PROVIDER** | セッション構成を更新してセッションがプロバイダからイベントを受信しないようにする。     | | **EVENT_CONTROL_CODE_ENABLE_PROVIDER**  | セッション構成を更新してセッションがプロバイダから要求されたイベントを受信できるようにする。 | | **EVENT_CONTROL_CODE_CAPTURE_STATE**    | プロバイダに状態情報をログ記録するよう要求する。                                       |
Level : [int] プロバイダに書き込ませたいイベントの最大レベルを示す値。プロバイダは通常、イベントのレベルがこの値以下であり、かつ _MatchAnyKeyword_ と _MatchAllKeyword_ の条件を満たす場合にイベントを書き込む。Microsoft はレベル 1 から 5 のセマンティクスを以下のように定義している。値が小さいほど重大なイベントを示す。各 _Level_ の値は、指定されたレベルとそれより重大なすべてのレベルを有効化する。たとえば `TRACE_LEVEL_WARNING` を指定すると、コンシューマは警告、エラー、致命的イベントを受け取る。| 値                              | 意味                                       | | ------------------------------- | ------------------------------------------ | | **TRACE_LEVEL_CRITICAL** (1)    | 異常終了または終了イベント                 | | **TRACE_LEVEL_ERROR** (2)       | 重大なエラーイベント                       | | **TRACE_LEVEL_WARNING** (3)     | 割り当て失敗などの警告イベント             | | **TRACE_LEVEL_INFORMATION** (4) | エラーではない情報イベント                 | | **TRACE_LEVEL_VERBOSE** (5)     | 詳細な診断イベント                         | `TRACE_LEVEL` 定数は _evntrace.h_ で定義されている。同等の `WINMETA_LEVEL` 定数は _winmeta.h_ で定義されている。
MatchAnyKeyword : [int64] プロバイダに書き込ませたいイベントのカテゴリを決定するキーワードの 64 ビット ビットマスク。プロバイダは通常、イベントのキーワード ビットがこの値で設定されたビットの **いずれか** と一致する場合、またはイベントにキーワード ビットが設定されていない場合、加えて _Level_ と _MatchAllKeyword_ の条件を満たす場合にイベントを書き込む。
MatchAllKeyword : [int64] プロバイダに書き込ませたいイベントを制限するキーワードの 64 ビット ビットマスク。プロバイダは通常、イベントのキーワード ビットがこの値で設定されたビットの **すべて** と一致する場合、またはイベントにキーワード ビットが設定されていない場合、加えて _Level_ と _MatchAnyKeyword_ の条件を満たす場合にイベントを書き込む。この値はしばしば 0 に設定される。
Timeout : [int] _Timeout_ が 0 の場合、この関数はプロバイダを非同期で構成し始め、即座に戻る (つまり、プロバイダコールバックの完了を待たずに戻る)。それ以外の場合、この関数はプロバイダの構成を開始し、構成が完了するのを待つ (すべてのプロバイダコールバックの完了を待つことを含む)。指定したタイムアウト前に構成が完了した場合、この関数は **ERROR_SUCCESS** を返す。それ以外の場合は **ERROR_TIMEOUT** を返す。無限に待機するには **INFINITE** を指定する。
EnableParameters : [var] プロバイダを有効化するために使用するトレース パラメータ。詳細は [ENABLE_TRACE_PARAMETERS](/windows/win32/api/evntrace/ns-evntrace-enable_trace_parameters) を参照。
%inst
トレースセッション コントローラは、EnableTraceEx2 を呼び出して ETW
イベントプロバイダがトレースセッションにイベントをどのようにログ記録するかを構成する。

[戻り値]
関数が成功した場合、戻り値は **ERROR_SUCCESS** となる。失敗した場合、戻り値は [system error
codes](/windows/win32/debug/system-error-codes)
のいずれかとなる。一般的なエラーとその原因を以下に示す。- **ERROR_INVALID_PARAMETER**
パラメータが正しくない。次のいずれかが該当する。- _ProviderId_ が **NULL** である。- _TraceHandle_
が **0** である。- **ERROR_TIMEOUT** 有効化コールバックの完了前にタイムアウト値が経過した。詳細は
_Timeout_ パラメータを参照。- **ERROR_INVALID_FUNCTION**
プロバイダが登録されていない場合はレベルを更新できない。- **ERROR_NO_SYSTEM_RESOURCES**
プロバイダを有効にできるトレース セッション数を超過した。- **ERROR_ACCESS_DENIED**
管理者特権を持つユーザー、`Performance Log Users`
グループのユーザー、`LocalSystem`、`LocalService`、`NetworkService`
として実行されているサービスのみが、クロス プロセス
セッションに対してイベントプロバイダを有効化できる。制限付きユーザーにイベントプロバイダを有効化する機能を付与するには、そのユーザーを
`Performance Log Users`
グループに追加するか、[EventAccessControl](/windows/desktop/api/evntcons/nf-evntcons-eventaccesscontrol)
を参照する。**Windows XP と Windows 2000:** 誰でもイベントプロバイダを有効化できる。

[備考]
イベント トレース
コントローラは、この関数を呼び出してセッションにイベントを書き込むイベントプロバイダを構成する。たとえば、コントローラはプロバイダからのイベント収集を開始する、プロバイダから収集しているイベントのレベルやキーワードを調整する、またはプロバイダからのイベント収集を停止するためにこの関数を呼び出すことができる。プロバイダの有効化動作は、そのプロバイダが使用する
API によって異なる。-
[RegisterTraceGuids](/windows/win32/api/evntrace/nf-evntrace-registertraceguidsa)
を使用するプロバイダ (TMF ベースの WPP や MOF を使用するプロバイダなど) は、レガシーの有効化システム
(古くは「クラシック ETW」と呼ばれる) を使用する。レガシー プロバイダがセッションに対して有効化または再構成されると、ETW
ランタイムはプロバイダに通知し、レベル、MatchAnyKeyword マスクの下位 32 ビット、およびセッション ID
へのアクセスを提供する。プロバイダは独自のロジックを使用してどのイベントを有効化すべきかを決定し、それらのイベントを指定されたセッションに直接送信する。実行時に
ETW に送信されるイベントデータにはイベントのデコード GUID とメッセージ ID が含まれるが、イベントの制御
GUID、レベル、キーワードは含まれない。ETW
はプロバイダが必要な権限を持っていることを確認した後、イベントデータを指定されたセッションに追加する。- 制御
GUID、レベル、キーワードの情報なしにイベントが特定のセッションに直接送信されるため、ETW
はレガシーの有効化システムを使用するプロバイダに対して追加のフィルタリングやルーティングを実行できない。各イベントは最大 1
つのセッションにしかルーティングできない。-
[EventRegister](/windows/win32/api/evntprov/nf-evntprov-eventregister)
を使用するプロバイダ (マニフェスト ベースのプロバイダや TraceLogging プロバイダなど) はモダンな有効化システム
(古くは「crimson ETW」と呼ばれる) を使用する。モダン プロバイダがセッションに対して有効化または再構成されると、ETW
ランタイムはプロバイダに対してレベル、64 ビット MatchAnyKeyword マスク、64 ビット MatchAllKeyword
マスク、およびトレース コントローラが指定したカスタム プロバイダ側フィルタリング
データを通知する。プロバイダは独自のロジックを使用してどのイベントを有効化すべきかを決定する。ただし、ほとんどのプロバイダは
[EventProviderEnabled](/windows/win32/api/evntprov/nf-evntprov-eventproviderenabled)
のロジックをそのまま用いる。プロバイダは、ETW にルーティング用に有効化されたイベントを送信する。ETW
に送信されるイベントデータにはイベントの制御 GUID、メッセージ ID、レベル、キーワードが含まれる。ETW
は必要に応じて追加のフィルタリングを実行し、イベントを適切なセッションにルーティングする。- 記述情報を伴ってイベントが ETW
に送信されるため、ETW
はイベントをセッションに追加する前に追加のフィルタリングとルーティングを実行できる。適切な場合、イベントを複数のセッションにルーティングできる。
（以下省略）


%index
EncryptFileW
ファイルまたはディレクトリを暗号化する。(Unicode)
%group
Win32 advapi32
%prm
lpFileName
lpFileName : [wstr] 暗号化するファイルまたはディレクトリの名前。呼び出し側は FILE_READ_DATA、FILE_WRITE_DATA、FILE_READ_ATTRIBUTES、FILE_WRITE_ATTRIBUTES、SYNCHRONIZE の各アクセス権を持っている必要がある。詳細は File Security and Access Rights を参照。
%inst
ファイルまたはディレクトリを暗号化する。(Unicode)

[戻り値]
関数が成功した場合、戻り値はゼロ以外となる。失敗した場合、戻り値はゼロとなる。拡張エラー情報を取得するには GetLastError
を呼び出す。

[備考]
EncryptFile
関数は暗号化対象のファイルへの排他アクセスを必要とし、他のプロセスがそのファイルを使用している場合は失敗する。ファイルが既に暗号化されている場合、EncryptFile
は単にゼロ以外の値を返し、成功を示す。ファイルが圧縮されている場合、EncryptFile
は暗号化前にファイルを展開する。lpFileName が読み取り専用のファイルを指定している場合、関数は失敗し、GetLastError
は ERROR_FILE_READ_ONLY を返す。lpFileName
が読み取り専用ファイルを含むディレクトリを指定している場合、関数は成功するがディレクトリは暗号化されない。暗号化されたファイルを復号するには
DecryptFile 関数を使用する。Windows 8、Windows Server 2012
以降では、この関数は次の技術でサポートされている。
（以下省略）


%index
EncryptionDisable
指定したディレクトリとその中のファイルの暗号化を無効化または有効化する。
%group
Win32 advapi32
%prm
DirPath, Disable
DirPath : [wstr] 暗号化を有効化または無効化するディレクトリの名前。
Disable : [int] 暗号化を無効化する場合は TRUE、有効化する場合は FALSE を示す。
%inst
指定したディレクトリとその中のファイルの暗号化を無効化または有効化する。

[戻り値]
関数が成功した場合、戻り値はゼロ以外となる。失敗した場合、戻り値はゼロとなる。拡張エラー情報を取得するには GetLastError
を呼び出す。

[備考]
通常、EncryptFile は FILE_ATTRIBUTE_SYSTEM
属性が設定されたファイルやディレクトリを暗号化しない。FILE_ATTRIBUTE_SYSTEM
属性を上書きしてファイルを暗号化することは可能である。また、ファイルやディレクトリに FILE_ATTRIBUTE_SYSTEM
属性が設定されている場合、通常はディレクトリ一覧や Windows エクスプローラのディレクトリ
ウィンドウでユーザーに対して不可視となる。EncryptionDisable はディレクトリとファイルの暗号化を無効化する。これは
FILE_ATTRIBUTE_SYSTEM 属性が設定されたファイルの可視性に影響しない。
TRUE を渡した場合、EncryptionDisable は必要に応じてディレクトリ内の Desktop.ini
ファイルに以下を書き込む (必要に応じてファイルを作成する)。
（以下省略）


%index
EnumDependentServicesW
指定したサービスに依存する各サービスの名前と状態を取得する。(Unicode)
%group
Win32 advapi32
%prm
hService, dwServiceState, lpServices, cbBufSize, pcbBytesNeeded, lpServicesReturned
hService : [intptr] サービスへのハンドル。このハンドルは OpenService または CreateService 関数によって返され、SERVICE_ENUMERATE_DEPENDENTS アクセス権を持っている必要がある。詳細は Service Security and Access Rights を参照。
dwServiceState : [int] 
lpServices : [var] データベース内の各依存サービスの名前とサービス状態情報を受け取る ENUM_SERVICE_STATUS 構造体の配列へのポインタ。バッファは構造体とそれらのメンバが指す文字列を格納するのに十分な大きさでなければならない。配列内のサービスの順序は、サービスの開始順の逆順となる。つまり、配列の最初のサービスは最後に開始されるもので、最後のサービスは最初に開始されるものである。この配列の最大サイズは 64,000 バイトである。必要なサイズを判別するには、このパラメータに NULL を、cbBufSize パラメータに 0 を指定する。関数は失敗し、GetLastError は ERROR_MORE_DATA を返す。pcbBytesNeeded パラメータが必要なサイズを受け取る。
cbBufSize : [int] lpServices パラメータが指すバッファのサイズ (バイト単位)。
pcbBytesNeeded : [var] サービスエントリの配列を格納するのに必要なバイト数を受け取る変数へのポインタ。変数がこの値を受け取るのは、lpServices が指すバッファが小さすぎる場合 (関数の失敗と ERROR_MORE_DATA エラーで示される) のみである。そうでない場合、pcbBytesNeeded の内容は未定義である。
lpServicesReturned : [var] 返されたサービスエントリの数を受け取る変数へのポインタ。
%inst
指定したサービスに依存する各サービスの名前と状態を取得する。(Unicode)

[戻り値]
関数が成功した場合、戻り値はゼロ以外となる。失敗した場合、戻り値はゼロとなる。拡張エラー情報を取得するには GetLastError
を呼び出す。以下のエラーコードはサービスコントロールマネージャによって設定される可能性がある。他のエラーコードは、サービスコントロールマネージャが呼び出すレジストリ関数によって設定される可能性がある。
（以下省略）

[備考]
返されるサービス
エントリは、グループ順序を考慮した開始順の逆順で並べられている。依存サービスを停止する必要がある場合、lpServices
バッファに書き込まれたエントリの順序を使用して、依存サービスを適切な順序で停止できる。


%index
EnumDynamicTimeZoneInformation
レジストリに格納されている DYNAMIC_TIME_ZONE_INFORMATION エントリを列挙する。
%group
Win32 advapi32
%prm
dwIndex, lpTimeZoneInformation
dwIndex : [int] DYNAMIC_TIME_ZONE_INFORMATION エントリの位置を表すインデックス値。
lpTimeZoneInformation : [var] タイムゾーンと動的な夏時間の設定を指定する。
%inst
レジストリに格納されている DYNAMIC_TIME_ZONE_INFORMATION エントリを列挙する。

[戻り値]
この関数は DWORD を返す。返される可能性のある値は次のとおり: | 値 | 説明 |
|-------------------------|-----------------------------------------------|
| ERROR_SUCCESS | 操作が成功した。 | | ERROR_NO_MORE_ITEMS |
指定したインデックスに対して利用可能なデータはない。 | | ERROR_INVALID_PARAMETER | パラメータが無効である。
| | その他の値 | 操作が失敗した。 |

[備考]
次の例は、**ERROR_NO_MORE_ITEMS** が返されるまで (レジストリにタイム ゾーン エントリがこれ以上ないことを示す)
候補のタイム ゾーンをループで処理する方法を示す。
（以下省略）


%index
EnumServicesStatusW
指定したサービスコントロールマネージャデータベース内のサービスを列挙する。各サービスの名前と状態が提供される。(Unicode)
%group
Win32 advapi32
%prm
hSCManager, dwServiceType, dwServiceState, lpServices, cbBufSize, pcbBytesNeeded, lpServicesReturned, lpResumeHandle
hSCManager : [intptr] サービスコントロールマネージャデータベースへのハンドル。このハンドルは OpenSCManager 関数によって返され、SC_MANAGER_ENUMERATE_SERVICE アクセス権を持っている必要がある。詳細は Service Security and Access Rights を参照。
dwServiceType : [int] 
dwServiceState : [int] 
lpServices : [var] データベース内の各サービスの名前とサービス状態情報を受け取る ENUM_SERVICE_STATUS 構造体の配列を格納するバッファへのポインタ。バッファは構造体と、それらのメンバが指す文字列を格納するのに十分な大きさでなければならない。この配列の最大サイズは 256K バイトである。必要なサイズを判別するには、このパラメータに NULL を、cbBufSize パラメータに 0 を指定する。関数は失敗し、GetLastError は ERROR_INSUFFICIENT_BUFFER を返す。pcbBytesNeeded パラメータが必要なサイズを受け取る。Windows Server 2003 および Windows XP: この配列の最大サイズは 64K バイトである。この制限は Windows Server 2003 with SP1 および Windows XP with SP2 以降で引き上げられた。
cbBufSize : [int] lpServices パラメータが指すバッファのサイズ (バイト単位)。
pcbBytesNeeded : [var] バッファが小さすぎる場合、残りのサービスエントリを返すために必要なバイト数を受け取る変数へのポインタ。
lpServicesReturned : [var] 返されたサービスエントリの数を受け取る変数へのポインタ。
lpResumeHandle : [var] 入力時に列挙の開始点を指定する変数へのポインタ。この関数を初めて呼び出すときにはこの値をゼロに設定しなければならない。出力時、関数が成功した場合この値はゼロとなる。ただし、関数が 0 を返し、GetLastError 関数が ERROR_MORE_DATA を返した場合、この値は関数が追加データを取得するために呼び出されるときに次に読み取るサービスエントリを示すために使用される。
%inst
指定したサービスコントロールマネージャデータベース内のサービスを列挙する。各サービスの名前と状態が提供される。(Unicode)

[戻り値]
関数が成功した場合、戻り値はゼロ以外となる。
失敗した場合、戻り値はゼロとなる。拡張エラー情報を取得するには GetLastError
を呼び出す。以下のエラーコードはサービスコントロールマネージャによって設定される可能性がある。他のエラーコードは、サービスコントロールマネージャが呼び出すレジストリ関数によって設定される可能性がある。
（以下省略）

[備考]
> [!NOTE] > winsvc.h ヘッダーは EnumServicesStatus をエイリアスとして定義しており、UNICODE
プリプロセッサ定数の定義に応じて、この関数の ANSI 版と Unicode
版を自動的に選択する。エンコーディングに依存しないエイリアスと、エンコーディングに依存しないコードとを混在させると、コンパイルエラーや実行時エラーを引き起こす不整合が生じる可能性がある。詳細は
[関数プロトタイプの規約](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
EnumServicesStatusExW
指定したサービスコントロールマネージャデータベース内のサービスを列挙する。各サービスの名前と状態が提供されるとともに、指定した情報レベルに基づく追加データが提供される。(Unicode)
%group
Win32 advapi32
%prm
hSCManager, InfoLevel, dwServiceType, dwServiceState, lpServices, cbBufSize, pcbBytesNeeded, lpServicesReturned, lpResumeHandle, pszGroupName
hSCManager : [intptr] サービスコントロールマネージャデータベースへのハンドル。このハンドルは OpenSCManager 関数によって返され、SC_MANAGER_ENUMERATE_SERVICE アクセス権を持っている必要がある。詳細は Service Security and Access Rights を参照。
InfoLevel : [int] 返されるサービス属性。データベース内の各サービスの名前とサービス状態情報を取得するには SC_ENUM_PROCESS_INFO を使用する。lpServices パラメータは ENUM_SERVICE_STATUS_PROCESS 構造体の配列を受け取るバッファへのポインタである。バッファは構造体と、それらのメンバが指す文字列を格納するのに十分な大きさでなければならない。現在、他の情報レベルは定義されていない。
dwServiceType : [int] 
dwServiceState : [int] 
lpServices : [var] 状態情報を受け取るバッファへのポインタ。このデータの形式は InfoLevel パラメータの値によって異なる。この配列の最大サイズは 256K バイトである。必要なサイズを判別するには、このパラメータに NULL を、cbBufSize パラメータに 0 を指定する。関数は失敗し、GetLastError は ERROR_MORE_DATA を返す。pcbBytesNeeded パラメータが必要なサイズを受け取る。Windows Server 2003 および Windows XP: この配列の最大サイズは 64K バイトである。この制限は Windows Server 2003 with SP1 および Windows XP with SP2 以降で引き上げられた。
cbBufSize : [int] lpServices パラメータが指すバッファのサイズ (バイト単位)。
pcbBytesNeeded : [var] バッファが小さすぎる場合、残りのサービスエントリを返すために必要なバイト数を受け取る変数へのポインタ。
lpServicesReturned : [var] 返されたサービスエントリの数を受け取る変数へのポインタ。
lpResumeHandle : [var] 入力時に列挙の開始点を指定する変数へのポインタ。EnumServicesStatusEx 関数を初めて呼び出すときにはこの値をゼロに設定しなければならない。出力時、関数が成功した場合この値はゼロとなる。ただし、関数が 0 を返し、GetLastError 関数が ERROR_MORE_DATA を返した場合、この値は EnumServicesStatusEx 関数が追加データを取得するために呼び出されるときに次に読み取るサービスエントリを示す。
pszGroupName : [wstr] 読み込み順グループ名。このパラメータが文字列の場合、列挙されるのは文字列で指定された名前のグループに属するサービスのみとなる。このパラメータが空文字列の場合、どのグループにも属さないサービスだけが列挙される。このパラメータが NULL の場合、グループのメンバシップは無視され、すべてのサービスが列挙される。
%inst

指定したサービスコントロールマネージャデータベース内のサービスを列挙する。各サービスの名前と状態が提供されるとともに、指定した情報レベルに基づく追加データが提供される。(Unicode)

[戻り値]
関数が成功した場合、戻り値はゼロ以外となる。失敗した場合、戻り値はゼロとなる。拡張エラー情報を取得するには GetLastError
を呼び出す。以下のエラーが返される可能性がある。
（以下省略）

[備考]
呼び出し側がサービスに対する SERVICE_QUERY_STATUS
アクセス権を持っていない場合、そのサービスはクライアントに返されるサービス一覧から静かに省略される。
> [!NOTE] > winsvc.h ヘッダーは EnumServicesStatusEx
をエイリアスとして定義しており、UNICODE プリプロセッサ定数の定義に応じて、この関数の ANSI 版と Unicode
版を自動的に選択する。エンコーディングに依存しないエイリアスと、エンコーディングに依存しないコードとを混在させると、コンパイルエラーや実行時エラーを引き起こす不整合が生じる可能性がある。詳細は
[関数プロトタイプの規約](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
EnumerateTraceGuids
現在コンピュータで動作しているイベント トレース プロバイダに関する情報を取得する。EnumerateTraceGuidsEx 関数がこの関数に代わる。
%group
Win32 advapi32
%prm
GuidPropertiesArray, PropertyArrayCount, GuidCount
GuidPropertiesArray : [var] [TRACE_GUID_PROPERTIES](/windows/win32/api/evntrace/ns-evntrace-trace_guid_properties) 構造体へのポインタの配列。配列内の各ポインタは、**TRACE_GUID_PROPERTIES** 構造体を格納するのに十分な領域を持つバッファを指す必要がある。
PropertyArrayCount : [int] _GuidPropertiesArray_ 配列内のポインタの数。
GuidCount : [var] コンピュータに登録されているイベントトレーシングプロバイダの実際の数を受け取る。
%inst
現在コンピュータで動作しているイベント トレース プロバイダに関する情報を取得する。EnumerateTraceGuidsEx
関数がこの関数に代わる。

[戻り値]
関数が成功した場合、戻り値は ERROR_SUCCESS となる。失敗した場合、戻り値は [system error
codes](/windows/win32/debug/system-error-codes)
のいずれかとなる。一般的なエラーとその原因を以下に示す。- **ERROR_INVALID_PARAMETER**
次のいずれかが真である。- _PropertyArrayCount_ がゼロ- _GuidPropertiesArray_ が
**NULL** である。- **ERROR_MORE_DATA**
プロパティ配列が、登録済みのすべてのプロバイダの情報を受け取るには小さすぎる (_GuidCount_ が
_PropertyArrayCount_ より大きい)。関数は _PropertyArrayCount_ で指定された数の構造体で
_GuidPropertiesArray_ を埋める。

[備考]
この関数は、開始されたがまだ停止されていないイベント トレース プロバイダ
([RegisterTraceGuids](/windows/win32/api/evntrace/nf-evntrace-registertraceguidsa)
や
[EventRegister](/windows/win32/api/evntprov/nf-evntprov-eventregister)
で開始されたもの) に関する情報を返す。> [!Note] > システムに登録されているプロバイダ マニフェスト (たとえば
`wevtutil` で登録されたマニフェスト)
に関する情報を取得するには、[TdhEnumerateProviders](/windows/win32/api/tdh/nf-tdh-tdhenumerateproviders)
を使用する。**TRACE_GUID_PROPERTIES.IsEnable** が **TRUE**
の場合、[TRACE_GUID_PROPERTIES](ns-evntrace-trace_guid_properties.md) の
LoggerId メンバを使用して、そのプロバイダを最も最近に有効化したセッションを特定できる。この一覧に
SystemTraceProvider のプロバイダは含まれない。


%index
EnumerateTraceGuidsEx
現在コンピュータで動作しているイベント トレース プロバイダに関する情報を取得する。
%group
Win32 advapi32
%prm
TraceQueryInfoClass, InBuffer, InBufferSize, OutBuffer, OutBufferSize, ReturnLength
TraceQueryInfoClass : [int] 返す情報の種類を決定する。指定可能な値については [TRACE_QUERY_INFO_CLASS](/windows/win32/api/evntrace/ne-evntrace-trace_query_info_class) 列挙を参照。
InBuffer : [intptr] 情報を取得するプロバイダまたはプロバイダ グループの GUID。_TraceQueryInfoClass_ が **TraceGuidQueryInfo** または **TraceGroupQueryInfo** の場合にのみ GUID を指定する。
InBufferSize : [int] _InBuffer_ データのサイズ (バイト単位)。
OutBuffer : [intptr] 列挙された情報を含む、アプリケーションが割り当てたバッファ。情報の形式は _TraceQueryInfoClass_ の値によって異なる。
OutBufferSize : [int] _OutBuffer_ バッファのサイズ (バイト単位)。関数が成功した場合、_ReturnLength_ パラメータには使用されたバッファのサイズが格納される。バッファが小さすぎる場合、関数は `ERROR_INSUFFICIENT_BUFFER` を返し、_ReturnLength_ パラメータには必要なバッファサイズが格納される。入力時にバッファサイズがゼロの場合、バッファにデータは返されず、_ReturnLength_ パラメータには必要なバッファサイズが格納される。
ReturnLength : [var] _OutBuffer_ 内のデータの実際のサイズ (バイト単位)。
%inst
現在コンピュータで動作しているイベント トレース プロバイダに関する情報を取得する。

[戻り値]
関数が成功した場合、戻り値は ERROR_SUCCESS となる。失敗した場合、戻り値は [system error
codes](/windows/win32/debug/system-error-codes)
のいずれかとなる。一般的なエラーとその原因を以下に示す。- **ERROR_INVALID_PARAMETER**
パラメータのいずれかが有効でない。- **ERROR_INSUFFICIENT_BUFFER** _OutBuffer_
バッファが、登録済みのすべてのプロバイダの情報を受け取るには小さすぎる。_ReturnLength_
で返されたサイズを使用してバッファを再確保する。

[備考]
この関数は、開始されたがまだ停止されていないイベント トレース プロバイダ
([RegisterTraceGuids](/windows/win32/api/evntrace/nf-evntrace-registertraceguidsa)
や
[EventRegister](/windows/win32/api/evntprov/nf-evntprov-eventregister)
で開始されたもの) に関する情報を返す。> [!Note] > システムに登録されているプロバイダ
マニフェストに関する情報を取得するには、[TdhEnumerateProviders](/windows/win32/api/tdh/nf-tdh-tdhenumerateproviders)
を使用する。_TraceQueryInfoClass_ が **TraceGuidQueryInfo** の場合、ETW
は情報のヘッダーとなる
[TRACE_GUID_INFO](/windows/win32/api/evntrace/ns-evntrace-trace_guid_info)
ブロックでデータを返す。情報ブロックには、同じ GUID を使用する各プロバイダの
[TRACE_PROVIDER_INSTANCE_INFO](/windows/win32/api/evntrace/ns-evntrace-trace_provider_instance_info)
ブロックが含まれる。各インスタンス情報ブロックには、プロバイダを有効化した各セッションの
[TRACE_ENABLE_INFO](/windows/win32/api/evntrace/ns-evntrace-trace_enable_info)
構造体が含まれる。


%index
EqualDomainSid
2 つの SID が同じドメインのものであるかどうかを判定する。
%group
Win32 advapi32
%prm
pSid1, pSid2, pfEqual
pSid1 : [int] 比較する 2 つの SID のうちの一方へのポインタ。この SID はアカウント ドメイン SID または BUILTIN SID のいずれかでなければならない。
pSid2 : [int] 比較する 2 つの SID のうちの一方へのポインタ。この SID はアカウント ドメイン SID または BUILTIN SID のいずれかでなければならない。
pfEqual : [var] BOOL へのポインタ。EqualDomainSid は、2 つの SID のドメインが等しければ TRUE に、等しくなければ FALSE に設定する。この値を NULL にすることはできない。
%inst
2 つの SID が同じドメインのものであるかどうかを判定する。

[戻り値]
両方の SID がアカウント ドメイン SID および/または BUILTIN SID である場合、戻り値はゼロ以外となる。さらに、2
つの SID のドメインが等しい場合は *pfEqual が TRUE に、等しくない場合は *pfEqual が FALSE
に設定される。いずれかの SID がアカウント ドメイン SID でも BUILTIN SID でもない場合、戻り値は FALSE
となる。拡張エラー情報を取得するには GetLastError を呼び出す。いずれかの SID がアカウント ドメイン SID または
BUILTIN SID ではない場合、GetLastError は ERROR_NON_DOMAIN_SID を返す。


%index
EqualPrefixSid
2 つのセキュリティ識別子 (SID) のプレフィックス値が等しいかどうかを検査する。SID プレフィックスとは、最後のサブ機関値を除く SID 全体のことである。
%group
Win32 advapi32
%prm
pSid1, pSid2
pSid1 : [int] 比較する最初の SID 構造体へのポインタ。この構造体は有効であると仮定される。
pSid2 : [int] 比較する 2 番目の SID 構造体へのポインタ。この構造体は有効であると仮定される。
%inst
2 つのセキュリティ識別子 (SID) のプレフィックス値が等しいかどうかを検査する。SID プレフィックスとは、最後のサブ機関値を除く
SID 全体のことである。

[戻り値]
SID プレフィックスが等しい場合、戻り値はゼロ以外となる。SID
プレフィックスが等しくない場合、戻り値はゼロとなる。拡張エラー情報を取得するには GetLastError を呼び出す。

[備考]
EqualPrefixSid
関数は、あるドメイン内のサーバアプリケーションが、ユーザーが別のドメインにログオンしようとする試みを検証できるようにする。たとえば、ユーザーが
LocalDomain 内のワークステーションから RemoteDomain にログオンしようとする場合、LocalDomain
のサーバは RemoteDomain にユーザーとユーザーのグループの SID を要求できる。RemoteDomain のドメイン
コントローラは該当する SID で応答する。指定したドメインのすべての SID は同じプレフィックスを持つ。サーバがユーザーの SID
を受け取ると、EqualPrefixSid 関数を各 SID に対して呼び出し、ユーザーまたはグループの SID を
RemoteDomain の SID と比較できる。SID
プレフィックスのいずれかが等しくない場合、サーバはログオン試行を拒否する。ドメインの SID をグループまたはユーザー SID
と比較する前に、ドメインの SID を変更することが推奨される。RemoteDomain の SID が S-1-1234-8
の場合、そのドメインの各グループまたはユーザー SID は S-1-1234-8 をプレフィックスとして持つ。EqualPrefixSid
関数を使用して SID を比較するために、アプリケーションはドメイン SID をコピーし、そのコピーに任意のサブ機関 (RID)
値を追加して S-1-1234-8-0 の形の SID を作成する。次にアプリケーションは、変更したドメイン SID
を、グループやユーザーの SID と比較するテンプレートとして使用する。


%index
EqualSid
2 つのセキュリティ識別子 (SID) の値が等しいかどうかを検査する。2 つの SID は等しいと判断されるためには完全に一致する必要がある。
%group
Win32 advapi32
%prm
pSid1, pSid2
pSid1 : [int] 比較する最初の SID 構造体へのポインタ。この構造体は有効であると仮定される。
pSid2 : [int] 比較する 2 番目の SID 構造体へのポインタ。この構造体は有効であると仮定される。
%inst
2 つのセキュリティ識別子 (SID) の値が等しいかどうかを検査する。2 つの SID
は等しいと判断されるためには完全に一致する必要がある。

[戻り値]
SID 構造体が等しい場合、戻り値はゼロ以外となる。SID 構造体が等しくない場合、戻り値はゼロとなる。拡張エラー情報を取得するには
GetLastError を呼び出す。いずれかの SID 構造体が有効でない場合、戻り値は未定義である。


%index
EventAccessControl
指定したプロバイダまたはセッションの権限を追加または変更する。
%group
Win32 advapi32
%prm
Guid, Operation, Sid, Rights, AllowOrDeny
Guid : [var] 権限を追加または変更するプロバイダまたはセッションを一意に識別する GUID。
Operation : [int] 実行する操作の種類。たとえば、セッションの GUID またはプロバイダの GUID に DACL を追加する。指定可能な値は EVENTSECURITYOPERATION 列挙を参照。
Sid : [int] 権限を付与または拒否するユーザーまたはグループのセキュリティ識別子 (SID)。
Rights : [int] 次の権限のうちの 1 つ以上を指定できる。
AllowOrDeny : [int] TRUE の場合、ユーザーにセッションまたはプロバイダへの権限を付与する。そうでない場合は権限を拒否する。Operation の値が EventSecuritySetSACL または EventSecurityAddSACL の場合、この値は無視される。
%inst
指定したプロバイダまたはセッションの権限を追加または変更する。

[戻り値]
成功した場合は ERROR_SUCCESS を返す。

[備考]
既定では、コンピュータの管理者、Performance Log Users
グループのユーザー、LocalSystem、LocalService、NetworkService
として実行されているサービスのみがトレースセッションを制御し、イベントデータを提供および消費できる。NT Kernel Logger
セッションを開始および制御できるのは管理者特権を持つユーザーと LocalSystem
として実行されているサービスのみである。Windows Server 2003:
管理者特権を持つユーザーのみがトレースセッションを制御し、イベントデータを消費できる。任意のユーザーがイベントデータを提供できる。Windows
XP と Windows 2000:
任意のユーザーがトレースセッションを制御し、イベントデータを提供および消費できる。セッションの制御に使用するツールが「管理者として実行」で開かれたコマンド
プロンプト
ウィンドウから起動された場合、管理者特権を持つユーザーはトレースセッションを制御できる。制限付きユーザーにトレースセッションを制御する機能を付与するには、そのユーザーを
Performance Log Users グループに追加するか、この関数を呼び出して権限を付与する。たとえば、ユーザー A
にトレースセッションの開始と停止の権限を付与し、ユーザー B
にはセッションのクエリ権限のみを付与できる。セッションにイベントをログできるユーザーを制限するには、TRACELOG_LOG_EVENT
の権限を参照する。ログファイルの ACL
がログファイルからイベントデータを消費できるユーザーを決定する。セッションからイベントをリアルタイムで消費するには、ユーザーに
TRACELOG_ACCESS_REALTIME 権限を付与するか、ユーザーが Performance Log Users
グループのメンバである必要がある。プロバイダの GUID
を指定して、プロバイダを登録できるユーザーやプロバイダを有効化できるユーザーを制限することもできる。


%index
EventAccessQuery
指定したコントローラまたはプロバイダの権限を取得する。
%group
Win32 advapi32
%prm
Guid, Buffer, BufferSize
Guid : [var] プロバイダまたはセッションを一意に識別する GUID。
Buffer : [int] コントローラまたはプロバイダのセキュリティ記述子を格納する、アプリケーションが割り当てたバッファ。
BufferSize : [var] セキュリティ記述子バッファのサイズ (バイト単位)。関数が成功した場合、このパラメータは使用されたバッファのサイズを受け取る。バッファが小さすぎる場合、関数は ERROR_MORE_DATA を返し、このパラメータは必要なバッファサイズを受け取る。入力時にバッファサイズがゼロの場合、バッファにデータは返されず、このパラメータは必要なバッファサイズを受け取る。
%inst
指定したコントローラまたはプロバイダの権限を取得する。

[戻り値]
成功した場合は ERROR_SUCCESS を返す。エラーが発生した場合、関数は次のリターン コードを返す。
（以下省略）

[備考]
GUID がレジストリに存在しない場合、ETW はプロバイダまたはコントローラの既定の権限を返す。レジストリで GUID
を指定する方法の詳細は EventAccessControl を参照。セキュリティ記述子のコンポーネントにアクセスする方法の詳細は
Getting Information from an
ACL、GetSecurityDescriptorDacl、GetSecurityDescriptorSacl、GetAce 関数、および
ACE 構造体を参照。


%index
EventAccessRemove
指定したプロバイダまたはセッションについてレジストリに定義された権限を削除する。
%group
Win32 advapi32
%prm
Guid
Guid : [var] レジストリから権限を削除するプロバイダまたはセッションを一意に識別する GUID。
%inst
指定したプロバイダまたはセッションについてレジストリに定義された権限を削除する。

[戻り値]
成功した場合は ERROR_SUCCESS を返す。

[備考]
レジストリから権限を削除すると、プロバイダまたはセッションに既定の権限が適用される。既定の権限の詳細は
EventAccessControl を参照。


%index
FileEncryptionStatusW
指定したファイルの暗号化状態を取得する。(Unicode)
%group
Win32 advapi32
%prm
lpFileName, lpStatus
lpFileName : [wstr] ファイルの名前。
lpStatus : [var] ファイルの暗号化状態を受け取る変数へのポインタ。このパラメータは以下の値のいずれかとなる。
%inst
指定したファイルの暗号化状態を取得する。(Unicode)

[戻り値]
関数が成功した場合、戻り値はゼロ以外となる。失敗した場合、戻り値はゼロとなる。拡張エラー情報を取得するには GetLastError
を呼び出す。

[備考]
Windows 8 および Windows Server 2012 では、この関数は次の技術でサポートされている。
（以下省略）


%index
FindFirstFreeAce
アクセス制御リスト (ACL) の最初の空きバイトへのポインタを取得する。
%group
Win32 advapi32
%prm
pAcl, pAce
pAcl : [var] ACL へのポインタ。
pAce : [var] 関数が戻ったときに、作成された ACL の最初の空き位置へのポインタのアドレス。ACL が有効でない場合、このパラメータは NULL となる。ACL が一杯の場合、このパラメータは ACL の直後のバイトを指す。
%inst
アクセス制御リスト (ACL) の最初の空きバイトへのポインタを取得する。

[戻り値]
関数が成功した場合はゼロ以外を返す。
失敗した場合はゼロを返す。拡張エラー情報を取得するには GetLastError を呼び出す。


%index
FlushTraceW
FlushTraceW (Unicode) 関数 (evntrace.h) は、指定したセッションに対してイベントトレーシングセッションがバッファリングされたイベントを直ちに配信するようにする。
%group
Win32 advapi32
%prm
TraceHandle, InstanceName, Properties
TraceHandle : [int] フラッシュするイベントトレーシングセッションのハンドル、または 0。_InstanceName_ が **NULL** の場合、ゼロ以外の _TraceHandle_ を指定しなければならない。このパラメータは _InstanceName_ が **NULL** の場合にのみ使用される。ハンドルは [StartTrace](/windows/win32/api/evntrace/nf-evntrace-starttracew) によって返される。
InstanceName : [wstr] フラッシュするイベントトレーシングセッションの名前、または **NULL**。_TraceHandle_ が 0 の場合は _InstanceName_ を指定しなければならない。NT Kernel Logger セッションを指定するには _InstanceName_ を **KERNEL_LOGGER_NAME** に設定する。
Properties : [var] 初期化済みの [EVENT_TRACE_PROPERTIES](/windows/desktop/ETW/event-trace-properties) 構造体へのポインタ。新しく初期化された構造体を使用する場合、構造体の **Wnode.BufferSize**、**Wnode.Guid**、**LoggerNameOffset**、および **LogFileNameOffset** メンバだけを設定すれば十分である。わからない場合は、最大セッション名 (1024 文字) と最大ログ ファイル名 (1024 文字) の長さを使用してバッファ サイズとオフセットを計算できる。出力時、構造体はフラッシュ後のセッション状態を反映するイベントトレーシングセッションのプロパティ設定とセッション統計を受け取る。
%inst
FlushTraceW (Unicode) 関数 (evntrace.h)
は、指定したセッションに対してイベントトレーシングセッションがバッファリングされたイベントを直ちに配信するようにする。

[戻り値]
関数が成功した場合、戻り値は ERROR_SUCCESS となる。失敗した場合、戻り値は [system error
codes](/windows/win32/debug/system-error-codes)
のいずれかとなる。次の表は一般的なエラーとその原因を示す。- **ERROR_INVALID_PARAMETER**
次のいずれかが真である。- _Properties_ が **NULL** である。- _InstanceName_ と
_TraceHandle_ の両方が **NULL** である。- _InstanceName_ が **NULL**
で、_TraceHandle_ が有効なハンドルではない。- **ERROR_BAD_LENGTH** 次のいずれかが真である。-
_Properties_ の **Wnode.BufferSize** メンバが正しくないサイズを指定している。-
_Properties_ に、セッション名とログ ファイル名 (使用されている場合)
のコピーを保持するのに十分な領域が割り当てられていない。- **ERROR_ACCESS_DENIED**
管理者特権を持つユーザー、Performance Log Users
グループのユーザー、LocalSystem、LocalService、NetworkService
として実行されているサービスのみがイベント トレース
セッションを制御できる。制限付きユーザーにトレースセッションを制御する機能を付与するには、そのユーザーを Performance Log
Users グループに追加する。**Windows XP と Windows 2000:** 誰でもトレースセッションを制御できる。

[備考]
イベント トレース
コントローラはこの関数を呼び出す。この関数は非推奨である。代わりに、[ControlTrace](/windows/win32/api/evntrace/nf-evntrace-controltracew)
を使用し、_ControlCode_ を **EVENT_TRACE_CONTROL_FLUSH** に設定する。この関数はインメモリ
セッション (**EVENT_TRACE_BUFFERING_MODE** フラグで開始されたセッション)
で使用でき、トレースからファイルにデータを書き込む。ファイル ベースまたはリアルタイム セッションでは通常、バッファが一杯になった場合
(すなわち次のイベントを収容する余地がない場合)、トレースセッションの FlushTimer
が満了した場合、またはトレースセッションが閉じられた場合に ETW
が自動的にバッファをフラッシュするため、手動でフラッシュする必要はない。DllMain から **FlushTrace**
を呼び出してはならない (デッドロックを引き起こす可能性がある)。
> [!NOTE] > evntrace.h ヘッダーは FlushTrace をエイリアスとして定義しており、UNICODE
プリプロセッサ定数の定義に応じて、この関数の ANSI 版と Unicode
版を自動的に選択する。エンコーディングに依存しないエイリアスと、エンコーディングに依存しないコードとを混在させると、コンパイルエラーや実行時エラーを引き起こす不整合が生じる可能性がある。詳細は
[関数プロトタイプの規約](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
FreeEncryptedFileMetadata
(no summary)
%group
Win32 advapi32
%prm
pbMetadata
pbMetadata : [var] 
%inst



%index
FreeEncryptionCertificateHashList
証明書ハッシュリストを解放する。
%group
Win32 advapi32
%prm
pUsers
pUsers : [var] QueryUsersOnEncryptedFile または QueryRecoveryAgentsOnEncryptedFile 関数によって返された証明書ハッシュリスト構造体 ENCRYPTION_CERTIFICATE_HASH_LIST へのポインタ。
%inst
証明書ハッシュリストを解放する。

[備考]
ReFS: この関数はサポートされていない。


%index
FreeInheritedFromArray
GetInheritanceSource 関数によって割り当てられたメモリを解放する。
%group
Win32 advapi32
%prm
pInheritArray, AceCnt, pfnArray
pInheritArray : [var] GetInheritanceSource によって返された INHERITED_FROM 構造体の配列へのポインタ。
AceCnt : [int] pInheritArray 内のエントリ数。
pfnArray : [var] 未使用。NULL に設定する。
%inst
GetInheritanceSource 関数によって割り当てられたメモリを解放する。

[戻り値]
関数が成功した場合、ERROR_SUCCESS を返す。失敗した場合は WinError.h で定義されるゼロ以外のエラーコードを返す。


%index
GetAce
アクセス制御リスト (ACL) 内のアクセス制御エントリ (ACE) へのポインタを取得する。
%group
Win32 advapi32
%prm
pAcl, dwAceIndex, pAce
pAcl : [var] 取得する ACE を含む ACL へのポインタ。
dwAceIndex : [int] 取得する ACE のインデックス。値ゼロは ACL の最初の ACE、1 は 2 番目の ACE に対応する。
pAce : [var] 関数が ACE のアドレスを設定するポインタへのポインタ。
%inst
アクセス制御リスト (ACL) 内のアクセス制御エントリ (ACE) へのポインタを取得する。

[戻り値]
関数が成功した場合はゼロ以外を返す。失敗した場合はゼロを返す。拡張エラー情報を取得するには GetLastError を呼び出す。


%index
GetAclInformation
アクセス制御リスト (ACL) に関する情報を取得する。
%group
Win32 advapi32
%prm
pAcl, pAclInformation, nAclInformationLength, dwAclInformationClass
pAcl : [var] ACL へのポインタ。関数はこの ACL に関する情報を取得する。null 値を渡すと、関数はアクセス違反を引き起こす。
pAclInformation : [intptr] 要求された情報を受け取るバッファへのポインタ。バッファに配置される構造体は dwAclInformationClass パラメータで要求された情報クラスによって異なる。
nAclInformationLength : [int] pAclInformation パラメータが指すバッファのサイズ (バイト単位)。
dwAclInformationClass : [int] 要求される情報のクラスを示す ACL_INFORMATION_CLASS 列挙の値。このパラメータはこの列挙の 2 つの値のいずれかを指定できる。
%inst
アクセス制御リスト (ACL) に関する情報を取得する。

[戻り値]
関数が成功した場合はゼロ以外を返す。
失敗した場合はゼロを返す。拡張エラー情報を取得するには GetLastError を呼び出す。


%index
GetAuditedPermissionsFromAclW
指定した受益者 (trustee) の監査対象アクセス権を取得する。(Unicode)
%group
Win32 advapi32
%prm
pacl, pTrustee, pSuccessfulAuditedRights, pFailedAuditRights
pacl : [var] 受益者の監査対象アクセス権を取得する元となる ACL 構造体へのポインタ。
pTrustee : [var] 受益者を識別する TRUSTEE 構造体へのポインタ。受益者はユーザー、グループ、またはプログラム (Windows サービスなど) である。受益者を識別するには名前またはセキュリティ識別子 (SID) を使用できる。SID 構造体の詳細は SID を参照。
pSuccessfulAuditedRights : [var] pTrustee パラメータで指定される受益者 (trustee) に対して監査される権限の成功時監査マスクを受け取る ACCESS_MASK 構造体へのポインタ。受益者がこれらのアクセス権を使用して成功した場合、システムが監査レコードを生成する。
pFailedAuditRights : [var] pTrustee パラメータで指定される受益者 (trustee) に対して監査される権限の失敗時監査マスクを受け取る ACCESS_MASK 構造体へのポインタ。受益者がこれらの権限の使用に失敗した場合、システムが監査レコードを生成する。
%inst
指定した受益者 (trustee) の監査対象アクセス権を取得する。(Unicode)

[戻り値]
関数が成功した場合、ERROR_SUCCESS を返す。失敗した場合、WinError.h で定義されるゼロ以外のエラーコードを返す。

[備考]
GetAuditedPermissionsFromAcl 関数は、ACL 内のすべてのシステム監査 ACE
を確認して受益者に対する監査対象の権限を判定する。グループに対して監査対象の権限を指定するすべての ACE
について、GetAuditedPermissionsFromAcl
はグループのメンバを列挙して受益者がメンバかどうかを判定する。グループのメンバを列挙できない場合、関数はエラーを返す。
> [!NOTE] > aclapi.h ヘッダーは GetAuditedPermissionsFromAcl
をエイリアスとして定義しており、UNICODE プリプロセッサ定数の定義に応じて、この関数の ANSI 版と Unicode
版を自動的に選択する。エンコーディングに依存しないエイリアスと、エンコーディングに依存しないコードとを混在させると、コンパイルエラーや実行時エラーを引き起こす不整合が生じる可能性がある。詳細は
[関数プロトタイプの規約](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
GetCurrentHwProfileW
ローカルコンピュータの現在のハードウェアプロファイルに関する情報を取得する。(Unicode)
%group
Win32 advapi32
%prm
lpHwProfileInfo
lpHwProfileInfo : [var] 現在のハードウェアプロファイルに関する情報を受け取る HW_PROFILE_INFO 構造体へのポインタ。
%inst
ローカルコンピュータの現在のハードウェアプロファイルに関する情報を取得する。(Unicode)

[戻り値]
関数が成功した場合、戻り値はゼロ以外の値となる。失敗した場合、戻り値はゼロとなる。拡張エラー情報を取得するには GetLastError
を呼び出す。

[備考]
GetCurrentHwProfile 関数は、ハードウェアプロファイルの表示名とグローバル一意識別子 (GUID)
文字列を取得する。ポータブル コンピュータ用のドッキング ステーションの報告されたドッキング状態も取得する。システムはハードウェア
プロファイルごとに GUID を生成し、それを文字列としてレジストリに格納する。GetCurrentHwProfile を使用して
GUID 文字列を取得し、HKEY_CURRENT_USER 内のアプリケーション構成設定キーの下のレジストリ
サブキーとして使用できる。これにより、ハードウェア プロファイルごとに各ユーザーの設定を保存できる。たとえば、Colors コントロール
パネル アプリケーションは、ドッキング/非ドッキング状態などの異なるハードウェア
プロファイルでの各ユーザーの色の設定を保存するためにサブキーを使用できる。この機能を使用するアプリケーションは、起動時に現在のハードウェア
プロファイルを確認し、それに応じて設定を更新できる。アプリケーションは、DBT_CONFIGCHANGED などのシステム デバイス
メッセージによってハードウェア
プロファイルが変更されたことが示されたときにも設定を更新できる。この関数を使用するアプリケーションをコンパイルするには、_WIN32_WINNT
マクロを 0x0400 以上に定義する。詳細は Using the Windows Headers を参照。


%index
GetDynamicTimeZoneInformationEffectiveYears
DYNAMIC_TIME_ZONE_INFORMATION に有効なエントリがある範囲 (年単位) を取得する。
%group
Win32 advapi32
%prm
lpTimeZoneInformation, FirstYear, LastYear
lpTimeZoneInformation : [var] タイムゾーンと動的な夏時間の設定を指定する。
FirstYear : [var] GetTimeZoneInformationForYear に渡す範囲の開始を示す年。
LastYear : [var] GetTimeZoneInformationForYear に渡す範囲の終了を示す年。
%inst
DYNAMIC_TIME_ZONE_INFORMATION に有効なエントリがある範囲 (年単位) を取得する。

[戻り値]
（以下省略）


%index
GetEffectiveRightsFromAclW
ACL 構造体が指定した受益者に付与する実効アクセス権を取得する。受益者の実効アクセス権は、ACL が受益者またはその受益者がメンバであるグループに付与するアクセス権である。(Unicode)
%group
Win32 advapi32
%prm
pacl, pTrustee, pAccessRights
pacl : [var] 受益者の実効アクセス権を取得する元となる ACL 構造体へのポインタ。
pTrustee : [var] 受益者を識別する TRUSTEE 構造体へのポインタ。受益者はユーザー、グループ、またはプログラム (Windows サービスなど) である。受益者を識別するには名前またはセキュリティ識別子 (SID) を使用できる。
pAccessRights : [var] 受益者の実効アクセス権を受け取る ACCESS_MASK 変数へのポインタ。
%inst
ACL 構造体が指定した受益者に付与する実効アクセス権を取得する。受益者の実効アクセス権は、ACL
が受益者またはその受益者がメンバであるグループに付与するアクセス権である。(Unicode)

[戻り値]
関数が成功した場合、ERROR_SUCCESS を返す。失敗した場合、WinError.h で定義されるゼロ以外のエラーコードを返す。

[備考]
GetEffectiveRightsFromAcl 関数は、アクセス制御リスト (ACL) 内のすべてのアクセス許可 ACE
とアクセス拒否 ACE を確認して受益者の実効権を判定する。グループに対して権限を許可または拒否するすべての ACE
について、GetEffectiveRightsFromAcl
はグループのメンバを列挙して受益者がメンバかどうかを判定する。グループのメンバを列挙できない場合、関数はエラーを返す。受益者のグループ権限は
GetEffectiveRightsFromAcl によってローカル コンピュータ上で列挙される。受益者がリモート
コンピュータ上のオブジェクトにアクセスしている場合でも同様である。この関数はリモート
コンピュータでのグループ権限を評価しない。GetEffectiveRightsFromAcl 関数は次のものを考慮しない。
（以下省略）


%index
GetEncryptedFileMetadata
(no summary)
%group
Win32 advapi32
%prm
lpFileName, pcbMetadata, ppbMetadata
lpFileName : [wstr] 
pcbMetadata : [var] 
ppbMetadata : [var] 
%inst



%index
GetEventLogInformation
指定したイベントログに関する情報を取得する。
%group
Win32 advapi32
%prm
hEventLog, dwInfoLevel, lpBuffer, cbBufSize, pcbBytesNeeded
hEventLog : [intptr] イベントログへのハンドル。OpenEventLog または RegisterEventSource 関数がこのハンドルを返す。
dwInfoLevel : [int] 返されるイベントログ情報のレベル。このパラメータは次の値を指定できる。
lpBuffer : [intptr] イベントログ情報を受け取るアプリケーションが割り当てたバッファ。このデータの形式は dwInfoLevel パラメータの値によって異なる。
cbBufSize : [int] lpBuffer バッファのサイズ (バイト単位)。
pcbBytesNeeded : [var] 関数の成否にかかわらず、要求された情報に必要なバッファサイズをこのパラメータに設定する。関数が ERROR_INSUFFICIENT_BUFFER で失敗した場合、この値を使用して正しいサイズのバッファを割り当てる。
%inst
指定したイベントログに関する情報を取得する。

[戻り値]
関数が成功した場合、戻り値はゼロ以外となる。
失敗した場合、戻り値はゼロとなる。拡張エラー情報を取得するには GetLastError を呼び出す。


%index
GetExplicitEntriesFromAclW
アクセス制御リスト (ACL) 内のアクセス制御エントリ (ACE) を記述する構造体の配列を取得する。(Unicode)
%group
Win32 advapi32
%prm
pacl, pcCountOfExplicitEntries, pListOfExplicitEntries
pacl : [var] ACE 情報を取得する元となる ACL 構造体へのポインタ。
pcCountOfExplicitEntries : [var] pListOfExplicitEntries 配列で返される EXPLICIT_ACCESS 構造体の数を受け取る変数へのポインタ。
pListOfExplicitEntries : [var] ACL 内の ACE を記述する EXPLICIT_ACCESS 構造体の配列へのポインタを受け取る変数へのポインタ。関数が成功した場合、LocalFree 関数を呼び出して返されたバッファを解放しなければならない。
%inst
アクセス制御リスト (ACL) 内のアクセス制御エントリ (ACE) を記述する構造体の配列を取得する。(Unicode)

[戻り値]
関数が成功した場合、ERROR_SUCCESS を返す。失敗した場合、WinError.h で定義されるゼロ以外のエラーコードを返す。

[備考]
EXPLICIT_ACCESS 構造体の配列内の各エントリは、受益者用の ACE
からのアクセス制御情報を記述する。受益者はユーザー、グループ、またはプログラム (Windows サービスなど) である。各
EXPLICIT_ACCESS 構造体は、アクセス権のセットと、ACE が指定した権限を許可、拒否、または監査するかを示すアクセス モード
フラグを指定する。任意アクセス制御リスト (DACL) の場合、アクセス モード フラグは GRANT_ACCESS または
DENY_ACCESS を指定できる。これらの値の詳細は ACCESS_MODE を参照。システム アクセス制御リスト (SACL)
の場合、アクセス モード フラグは
SET_AUDIT_ACCESS、SET_AUDIT_FAILURE、またはその両方を指定できる。これらの値の詳細は
ACCESS_MODE を参照。
> [!NOTE] > aclapi.h ヘッダーは GetExplicitEntriesFromAcl
をエイリアスとして定義しており、UNICODE プリプロセッサ定数の定義に応じて、この関数の ANSI 版と Unicode
版を自動的に選択する。エンコーディングに依存しないエイリアスと、エンコーディングに依存しないコードとを混在させると、コンパイルエラーや実行時エラーを引き起こす不整合が生じる可能性がある。詳細は
[関数プロトタイプの規約](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
GetFileSecurityW
ファイルまたはディレクトリのセキュリティに関する指定された情報を取得する。取得できる情報は、呼び出し側のアクセス権と特権によって制約される。(GetFileSecurityW)
%group
Win32 advapi32
%prm
lpFileName, RequestedInformation, pSecurityDescriptor, nLength, lpnLengthNeeded
lpFileName : [wstr] セキュリティ情報を取得するファイルまたはディレクトリを指定する null 終端文字列へのポインタ。
RequestedInformation : [int] 要求するセキュリティ情報を識別する SECURITY_INFORMATION 値。
pSecurityDescriptor : [int] lpFileName パラメータで指定されたオブジェクトのセキュリティ記述子のコピーを受け取るバッファへのポインタ。呼び出し元プロセスは、そのオブジェクトのセキュリティ状態の指定された側面を表示する権限を持っている必要がある。SECURITY_DESCRIPTOR 構造体は自己相対セキュリティ記述子形式で返される。
nLength : [int] pSecurityDescriptor パラメータが指すバッファのサイズ (バイト単位) を指定する。
lpnLengthNeeded : [var] 完全なセキュリティ記述子を格納するのに必要なバイト数を受け取る変数へのポインタ。返されたバイト数が nLength 以下の場合、セキュリティ記述子全体が出力バッファに返される。そうでない場合、記述子は返されない。
%inst

ファイルまたはディレクトリのセキュリティに関する指定された情報を取得する。取得できる情報は、呼び出し側のアクセス権と特権によって制約される。(GetFileSecurityW)

[戻り値]
関数が成功した場合、戻り値はゼロ以外となる。失敗した場合、戻り値はゼロとなる。拡張エラー情報を取得するには GetLastError
を呼び出す。

[備考]
指定したファイルまたはディレクトリのセキュリティ記述子から所有者、グループ、または DACL
を読み取るには、そのファイルまたはディレクトリの DACL が呼び出し側に READ_CONTROL
アクセスを許可しているか、呼び出し側がファイルまたはディレクトリの所有者である必要がある。ファイルまたはディレクトリの SACL
を読み取るには、呼び出し元プロセスで SE_SECURITY_NAME 特権を有効にしなければならない。


%index
GetInheritanceSourceW
アクセス制御リスト (ACL) 内の継承されたアクセス制御エントリ (ACE) のソースに関する情報を返す。(Unicode)
%group
Win32 advapi32
%prm
pObjectName, ObjectType, SecurityInfo, Container, pObjectClassGuids, GuidCount, pAcl, pfnArray, pGenericMapping, pInheritArray
pObjectName : [wstr] チェックする ACL を使用するオブジェクトの名前へのポインタ。
ObjectType : [int] pObjectName が示すオブジェクトの型。指定可能な値は SE_FILE_OBJECT、SE_REGISTRY_KEY、SE_DS_OBJECT、SE_DS_OBJECT_ALL。
SecurityInfo : [int] オブジェクトで使用される ACL の種類。指定可能な値は DACL_SECURITY_INFORMATION または SACL_SECURITY_INFORMATION。
Container : [int] オブジェクトがコンテナ オブジェクトの場合は TRUE、リーフ オブジェクトの場合は FALSE。唯一のリーフ オブジェクトは SE_FILE_OBJECT である点に注意する。
pObjectClassGuids : [var] pObjectName に関連付けられたオブジェクトの型または名前を識別する GUID のオプションの一覧。オブジェクト マネージャが 1 つのオブジェクト クラスのみをサポートする場合、またはオブジェクト クラスに関連付けられた GUID を持たない場合、これは NULL でもよい。
GuidCount : [int] pObjectClassGuids が指す GUID の数。
pAcl : [var] オブジェクトの ACL。
pfnArray : [var] 予約済み。このパラメータは NULL に設定する。
pGenericMapping : [var] オブジェクトに対する汎用権限から特定権限へのマッピング。
pInheritArray : [var] GetInheritanceSource 関数が継承情報を入れる INHERITED_FROM 構造体の配列へのポインタ。呼び出し側は ACL 内の各 ACE 用のエントリに十分なメモリを割り当てなければならない。
%inst
アクセス制御リスト (ACL) 内の継承されたアクセス制御エントリ (ACE) のソースに関する情報を返す。(Unicode)

[戻り値]
関数が成功した場合、ERROR_SUCCESS を返す。失敗した場合、WinError.h で定義されるゼロ以外のエラーコードを返す。

[備考]
GetInheritanceSource 関数は、INHERITED_FROM
構造体で返される名前のためにメモリを割り当てる。関数がこのメモリの使用を終えたら、呼び出し元プログラムは
FreeInheritedFromArray
を呼び出してそれを解放しなければならない。呼び出し側は配列自体のメモリを提供する必要がある点に注意する。呼び出し側がそのメモリを割り当てた場合、呼び出し側は
FreeInheritedFromArray
を呼び出した後にそのメモリを解放しなければならない。この関数は競合状態を処理しない。スレッドがこの関数を呼び出したのとほぼ同じ時刻に別のスレッドがオブジェクトのセキュリティ記述子を変更した場合、この関数は失敗する可能性がある。
> [!NOTE] > aclapi.h ヘッダーは GetInheritanceSource
をエイリアスとして定義しており、UNICODE プリプロセッサ定数の定義に応じて、この関数の ANSI 版と Unicode
版を自動的に選択する。エンコーディングに依存しないエイリアスと、エンコーディングに依存しないコードとを混在させると、コンパイルエラーや実行時エラーを引き起こす不整合が生じる可能性がある。詳細は
[関数プロトタイプの規約](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
GetKernelObjectSecurity
カーネル オブジェクトを保護するセキュリティ記述子のコピーを取得する。
%group
Win32 advapi32
%prm
Handle, RequestedInformation, pSecurityDescriptor, nLength, lpnLengthNeeded
Handle : [intptr] カーネル オブジェクトへのハンドル。
RequestedInformation : [int] 要求するセキュリティ情報を識別する SECURITY_INFORMATION 値を指定する。
pSecurityDescriptor : [int] 関数が指定したオブジェクトのセキュリティ記述子のコピーで埋めるバッファへのポインタ。呼び出し元プロセスは、オブジェクトのセキュリティ状態の指定された側面を表示する権限を持っている必要がある。SECURITY_DESCRIPTOR 構造体は自己相対形式で返される。
nLength : [int] pSecurityDescriptor パラメータが指すバッファのサイズ (バイト単位) を指定する。
lpnLengthNeeded : [var] pSecurityDescriptor パラメータが指すバッファに必要なバイト数を受け取る変数へのポインタ。この変数の値が関数が戻るときに nLength パラメータの値より大きい場合、セキュリティ記述子はバッファにコピーされない。
%inst
カーネル オブジェクトを保護するセキュリティ記述子のコピーを取得する。

[戻り値]
関数が成功した場合、戻り値はゼロ以外となる。失敗した場合、戻り値はゼロとなる。拡張エラー情報を取得するには GetLastError
を呼び出す。

[備考]
カーネル オブジェクトのセキュリティ記述子から所有者、グループ、または DACL
を読み取るには、ハンドルを開いたときに呼び出し元プロセスが READ_CONTROL
アクセスを付与されている必要がある。READ_CONTROL
アクセスを取得するには、呼び出し側がオブジェクトの所有者であるか、オブジェクトの DACL
がそのアクセスを許可している必要がある。セキュリティ記述子から SACL を読み取るには、ハンドルを開いたときに呼び出し元プロセスが
ACCESS_SYSTEM_SECURITY
アクセスを付与されている必要がある。このアクセスを取得する適切な方法は、呼び出し元の現在のトークンで SE_SECURITY_NAME
特権を有効にし、ACCESS_SYSTEM_SECURITY アクセスでハンドルを開き、その後で特権を無効にすることである。


%index
GetLengthSid
有効なセキュリティ識別子 (SID) の長さ (バイト単位) を返す。
%group
Win32 advapi32
%prm
pSid
pSid : [int] 長さが返される SID 構造体へのポインタ。構造体は有効であると仮定される。
%inst
有効なセキュリティ識別子 (SID) の長さ (バイト単位) を返す。

[戻り値]
SID 構造体が有効であれば、戻り値は SID 構造体の長さ (バイト単位) となる。SID
構造体が有効でない場合、戻り値は未定義である。GetLengthSid を呼び出す前に、SID を IsValidSid 関数に渡して
SID が有効であることを確認する。


%index
GetLocalManagedApplicationData
(no summary)
%group
Win32 advapi32
%prm
ProductCode, DisplayName, SupportUrl
ProductCode : [wstr] 
DisplayName : [var] 
SupportUrl : [var] 
%inst



%index
GetLocalManagedApplications
GetLocalManagedApplications 関数は、対象コンピュータで実行して、そのコンピュータ上の管理対象アプリケーションの一覧を取得するために使用できる。
%group
Win32 advapi32
%prm
bUserApps, pdwApps, prgLocalApps
bUserApps : [int] TRUE の場合、prgLocalApps パラメータにはユーザーに適用される管理対象アプリケーションの一覧が含まれる。このパラメータの値が FALSE の場合、prgLocalApps パラメータにはローカル コンピュータに適用される管理対象アプリケーションの一覧が含まれる。
pdwApps : [var] prgLocalApps によって返される一覧内のアプリケーション数を指定する DWORD のアドレス。
prgLocalApps : [var] 管理対象アプリケーションの一覧を含む配列のアドレス。内容が不要になったら、LocalFree を呼び出してこの配列を解放しなければならない。このパラメータは NULL にできない。一覧は LOCALMANAGEDAPPLICATION 構造体として返される。
%inst
GetLocalManagedApplications
関数は、対象コンピュータで実行して、そのコンピュータ上の管理対象アプリケーションの一覧を取得するために使用できる。

[戻り値]
関数が成功した場合、戻り値は ERROR_SUCCESS
となる。そうでない場合、関数はシステムエラーコードのいずれかを返す。エラーコードの完全な一覧は System Error Codes
または WinError.h ヘッダーファイルを参照。


%index
GetManagedApplicationCategories
GetManagedApplicationCategories 関数は、ドメインのアプリケーション カテゴリの一覧を取得する。一覧はドメイン内のすべてのユーザーに対して同じである。
%group
Win32 advapi32
%prm
dwReserved, pAppCategory
dwReserved : [int] このパラメータは予約済みである。値は 0 でなければならない。
pAppCategory : [var] アプリケーション カテゴリの一覧を含む APPCATEGORYINFOLIST 構造体。この構造体は、一覧が不要になったら LocalFree を呼び出して解放しなければならない。
%inst
GetManagedApplicationCategories 関数は、ドメインのアプリケーション
カテゴリの一覧を取得する。一覧はドメイン内のすべてのユーザーに対して同じである。

[戻り値]
関数が成功した場合、戻り値は ERROR_SUCCESS
となる。そうでない場合、関数はシステムエラーコードのいずれかを返す。エラーコードの完全な一覧は System Error Codes
または WinError.h ヘッダーファイルを参照。

[備考]
GetManagedApplicationCategories によって返される構造体は、一覧が不要になったら LocalFree
を呼び出して解放しなければならない。


%index
GetManagedApplications
GetManagedApplications 関数は、指定したユーザー コンテキストに対してプログラムの追加と削除 (ARP) の追加ペインに表示されるアプリケーションの一覧を取得する。
%group
Win32 advapi32
%prm
pCategory, dwQueryFlags, dwInfoLevel, pdwApps, prgManagedApps
pCategory : [var] 一覧表示するアプリケーションのカテゴリを指定する GUID へのポインタ。pCategory が null でない場合、dwQueryFlags には MANAGED_APPS_FROMCATEGORY が含まれなければならない。pCategory が null の場合、dwQueryFlags には MANAGED_APPS_FROMCATEGORY を含めてはならない。
dwQueryFlags : [int] 
dwInfoLevel : [int] このパラメータは MANAGED_APPS_INFOLEVEL_DEFAULT でなければならない。
pdwApps : [var] この関数によって返される一覧内のアプリケーション数。
prgManagedApps : [var] このパラメータは MANAGEDAPPLICATION 構造体の配列へのポインタである。この配列には、プログラムの追加と削除 (ARP) の追加ペインに一覧表示されるアプリケーションの一覧が含まれる。配列が不要になったら、LocalFree を呼び出して配列を解放しなければならない。
%inst
GetManagedApplications 関数は、指定したユーザー コンテキストに対してプログラムの追加と削除 (ARP)
の追加ペインに表示されるアプリケーションの一覧を取得する。

[戻り値]
関数が成功した場合、戻り値は ERROR_SUCCESS
となる。そうでない場合、関数はシステムエラーコードのいずれかを返す。エラーコードの完全な一覧は System Error Codes
または WinError.h ヘッダーファイルを参照。


%index
GetMultipleTrusteeW
(no summary)
%group
Win32 advapi32
%prm
pTrustee
pTrustee : [var] 
%inst



%index
GetMultipleTrusteeOperationW
(no summary)
%group
Win32 advapi32
%prm
pTrustee
pTrustee : [var] 
%inst



%index
GetNamedSecurityInfoW
名前で指定したオブジェクトのセキュリティ記述子のコピーを取得する。(Unicode)
%group
Win32 advapi32
%prm
pObjectName, ObjectType, SecurityInfo, ppsidOwner, ppsidGroup, ppDacl, ppSacl, ppSecurityDescriptor
pObjectName : [wstr] セキュリティ情報を取得するオブジェクトの名前を指定する null 終端文字列へのポインタ。異なるオブジェクト型の文字列形式の説明については SE_OBJECT_TYPE を参照。
ObjectType : [int] pObjectName パラメータで名前が示されるオブジェクトの型を示す SE_OBJECT_TYPE 列挙の値を指定する。
SecurityInfo : [int] 取得するセキュリティ情報の種類を示すビット フラグのセット。このパラメータは SECURITY_INFORMATION ビット フラグの組み合わせを指定できる。
ppsidOwner : [var] ppSecurityDescriptor で返されるセキュリティ記述子内の所有者 SID へのポインタを受け取る変数へのポインタ。セキュリティ記述子に所有者 SID がない場合は NULL となる。返されるポインタは OWNER_SECURITY_INFORMATION フラグを設定した場合にのみ有効である。また、所有者 SID が不要な場合、このパラメータは NULL にできる。
ppsidGroup : [var] 返されるセキュリティ記述子内のプライマリ グループ SID へのポインタを受け取る変数へのポインタ。セキュリティ記述子にグループ SID がない場合は NULL となる。返されるポインタは GROUP_SECURITY_INFORMATION フラグを設定した場合にのみ有効である。また、グループ SID が不要な場合、このパラメータは NULL にできる。
ppDacl : [var] 返されるセキュリティ記述子内の DACL へのポインタを受け取る変数へのポインタ。セキュリティ記述子に DACL がない場合は NULL となる。返されるポインタは DACL_SECURITY_INFORMATION フラグを設定した場合にのみ有効である。また、DACL が不要な場合、このパラメータは NULL にできる。
ppSacl : [var] 返されるセキュリティ記述子内の SACL へのポインタを受け取る変数へのポインタ。セキュリティ記述子に SACL がない場合は NULL となる。返されるポインタは SACL_SECURITY_INFORMATION フラグを設定した場合にのみ有効である。また、SACL が不要な場合、このパラメータは NULL にできる。
ppSecurityDescriptor : [var] オブジェクトのセキュリティ記述子へのポインタを受け取る変数へのポインタ。ポインタの使用が終わったら、LocalFree 関数を呼び出して返されたバッファを解放する。ppsidOwner、ppsidGroup、ppDacl、または ppSacl のいずれか一つでも NULL でない場合、このパラメータは必須である。
%inst
名前で指定したオブジェクトのセキュリティ記述子のコピーを取得する。(Unicode)

[戻り値]
関数が成功した場合、戻り値は ERROR_SUCCESS となる。失敗した場合、戻り値は WinError.h
で定義されるゼロ以外のエラーコードとなる。

[備考]
ppsidOwner、ppsidGroup、ppDacl、または ppSacl のいずれかが NULL でなく、SecurityInfo
パラメータがそれらをオブジェクトから取得するよう指定している場合、それらのパラメータは ppSecurityDescriptor
で返されるセキュリティ記述子内の対応するパラメータを指す。セキュリティ記述子が要求された情報を含まない場合、対応するパラメータは NULL
に設定される。オブジェクトのセキュリティ記述子から所有者、グループ、または DACL を読み取るには、オブジェクトの DACL
が呼び出し側に READ_CONTROL
アクセスを付与しているか、呼び出し側がオブジェクトの所有者である必要がある。オブジェクトのシステム
アクセス制御リストを読み取るには、呼び出し元プロセスで SE_SECURITY_NAME
特権を有効にしなければならない。特権を有効にすることのセキュリティ上の意味については Running with Special
Privileges を参照。GetNamedSecurityInfo 関数は次の種類のオブジェクトで使用できる。
（以下省略）


%index
GetNumberOfEventLogRecords
指定したイベントログ内のレコード数を取得する。
%group
Win32 advapi32
%prm
hEventLog, NumberOfRecords
hEventLog : [intptr] 開いているイベントログへのハンドル。OpenEventLog または OpenBackupEventLog 関数がこのハンドルを返す。
NumberOfRecords : [var] 指定したイベントログ内のレコード数を受け取る変数へのポインタ。
%inst
指定したイベントログ内のレコード数を取得する。

[戻り値]
関数が成功した場合、戻り値はゼロ以外となる。
失敗した場合、戻り値はゼロとなる。拡張エラー情報を取得するには GetLastError を呼び出す。

[備考]
イベントログ内の最も古いレコードが必ずしもレコード番号 1 とは限らない。イベントログ内の最も古いレコード番号を判別するには
GetOldestEventLogRecord 関数を使用する。


%index
GetOldestEventLogRecord
指定したイベントログ内の最も古いレコードの絶対レコード番号を取得する。
%group
Win32 advapi32
%prm
hEventLog, OldestRecord
hEventLog : [intptr] 開いているイベントログへのハンドル。OpenEventLog または OpenBackupEventLog 関数がこのハンドルを返す。
OldestRecord : [var] 指定したイベントログ内の最も古いレコードの絶対レコード番号を受け取る変数へのポインタ。
%inst
指定したイベントログ内の最も古いレコードの絶対レコード番号を取得する。

[戻り値]
関数が成功した場合、戻り値はゼロ以外となる。
失敗した場合、戻り値はゼロとなる。拡張エラー情報を取得するには GetLastError を呼び出す。

[備考]
イベントログ内の最も古いレコードが必ずしもレコード番号 1 とは限らない。詳細は Event Log Records を参照。


%index
GetPrivateObjectSecurity
プライベート オブジェクトのセキュリティ記述子から情報を取得する。
%group
Win32 advapi32
%prm
ObjectDescriptor, SecurityInformation, ResultantDescriptor, DescriptorLength, ReturnLength
ObjectDescriptor : [int] SECURITY_DESCRIPTOR 構造体へのポインタ。これはクエリ対象のセキュリティ記述子である。
SecurityInformation : [int] 取得するセキュリティ記述子の部分を示すビット フラグのセット。このパラメータは SECURITY_INFORMATION ビット フラグの組み合わせを指定できる。
ResultantDescriptor : [int] 指定したセキュリティ記述子から要求された情報のコピーを受け取るバッファへのポインタ。SECURITY_DESCRIPTOR 構造体は自己相対形式で返される。
DescriptorLength : [int] ResultantDescriptor パラメータが指すバッファのサイズ (バイト単位) を指定する。
ReturnLength : [var] 記述子が正常にコピーされた場合、関数はこの変数にゼロを設定する。バッファがセキュリティ記述子に対して小さすぎる場合、この変数には必要なバイト数が格納される。関数が戻るときにこの変数の値が DescriptorLength パラメータの値より大きい場合、関数は FALSE を返し、セキュリティ記述子はバッファにコピーされない。
%inst
プライベート オブジェクトのセキュリティ記述子から情報を取得する。

[戻り値]
関数が成功した場合、戻り値はゼロ以外となる。失敗した場合、戻り値はゼロとなる。拡張エラー情報を取得するには GetLastError
を呼び出す。

[備考]
この関数はリソース
マネージャでのみ使用されることを意図している。セキュリティ記述子を更新する標準のアクセス制御セマンティクスを実装するために、リソース
マネージャは GetPrivateObjectSecurity を呼び出す前に、次の条件が満たされていることを確認すべきである。
（以下省略）


%index
GetSecurityDescriptorControl
セキュリティ記述子の制御情報とリビジョン情報を取得する。
%group
Win32 advapi32
%prm
pSecurityDescriptor, pControl, lpdwRevision
pSecurityDescriptor : [int] 関数が制御情報とリビジョン情報を取得する SECURITY_DESCRIPTOR 構造体へのポインタ。
pControl : [var] セキュリティ記述子の制御情報を受け取る SECURITY_DESCRIPTOR_CONTROL 構造体へのポインタ。
lpdwRevision : [var] セキュリティ記述子のリビジョン値を受け取る変数へのポインタ。この値は、GetSecurityDescriptorControl がエラーを返した場合でも常に設定される。
%inst
セキュリティ記述子の制御情報とリビジョン情報を取得する。

[戻り値]
関数が成功した場合、戻り値はゼロ以外となる。失敗した場合、戻り値はゼロとなる。拡張エラー情報を取得するには GetLastError
を呼び出す。


%index
GetSecurityDescriptorDacl
指定したセキュリティ記述子内の任意アクセス制御リスト (DACL) へのポインタを取得する。
%group
Win32 advapi32
%prm
pSecurityDescriptor, lpbDaclPresent, pDacl, lpbDaclDefaulted
pSecurityDescriptor : [int] DACL を含む SECURITY_DESCRIPTOR 構造体へのポインタ。関数はそれへのポインタを取得する。
lpbDaclPresent : [var] 指定したセキュリティ記述子に DACL が存在するかどうかを示す値へのポインタ。lpbDaclPresent が TRUE の場合、セキュリティ記述子は DACL を含み、この関数の残りの出力パラメータは有効な値を受け取る。lpbDaclPresent が FALSE の場合、セキュリティ記述子は DACL を含まず、残りの出力パラメータは有効な値を受け取らない。lpbDaclPresent の値が TRUE であっても pDacl が NULL でないことを意味するわけではない。すなわち、lpbDaclPresent が TRUE で pDacl が NULL のことがあり、これは NULL DACL が有効であることを意味する。NULL DACL は暗黙的にオブジェクトへのすべてのアクセスを許可し、空の DACL とは異なる。空の DACL はオブジェクトへのアクセスを一切許可しない。適切な DACL の作成方法については Creating a DACL を参照。
pDacl : [var] アクセス制御リスト (ACL) へのポインタへのポインタ。DACL が存在する場合、関数は pDacl が指すポインタにセキュリティ記述子の DACL のアドレスを設定する。DACL が存在しない場合、値は格納されない。
lpbDaclDefaulted : [var] セキュリティ記述子に DACL が存在する場合、SECURITY_DESCRIPTOR_CONTROL 構造体の SE_DACL_DEFAULTED フラグの値に設定されるフラグへのポインタ。このフラグが TRUE の場合、DACL は既定の仕組みによって取得されている。FALSE の場合、DACL はユーザーによって明示的に指定されている。
%inst
指定したセキュリティ記述子内の任意アクセス制御リスト (DACL) へのポインタを取得する。

[戻り値]
関数が成功した場合はゼロ以外を返す。失敗した場合はゼロを返す。拡張エラー情報を取得するには GetLastError を呼び出す。


%index
GetSecurityDescriptorGroup
セキュリティ記述子からプライマリ グループ情報を取得する。
%group
Win32 advapi32
%prm
pSecurityDescriptor, pGroup, lpbGroupDefaulted
pSecurityDescriptor : [int] 関数がプライマリ グループ情報を取得する SECURITY_DESCRIPTOR 構造体へのポインタ。
pGroup : [var] 関数が戻るときにプライマリ グループを識別するセキュリティ識別子 (SID) へのポインタへのポインタ。セキュリティ記述子にプライマリ グループが含まれない場合、関数は pGroup が指すポインタを NULL に設定し、残りの出力パラメータ lpbGroupDefaulted を無視する。セキュリティ記述子にプライマリ グループが含まれる場合、関数は pGroup が指すポインタにセキュリティ記述子のグループ SID のアドレスを設定し、lpbGroupDefaulted が指す変数に有効な値を提供する。
lpbGroupDefaulted : [var] 関数が戻るときに、SECURITY_DESCRIPTOR_CONTROL 構造体の SE_GROUP_DEFAULTED フラグの値に設定されるフラグへのポインタ。pGroup パラメータが指す変数に格納された値が NULL の場合、値は設定されない。
%inst
セキュリティ記述子からプライマリ グループ情報を取得する。

[戻り値]
関数が成功した場合はゼロ以外を返す。失敗した場合はゼロを返す。拡張エラー情報を取得するには GetLastError を呼び出す。


%index
GetSecurityDescriptorLength
構造的に有効なセキュリティ記述子の長さ (バイト単位) を返す。長さには関連付けられたすべての構造体の長さが含まれる。
%group
Win32 advapi32
%prm
pSecurityDescriptor
pSecurityDescriptor : [int] 関数が長さを返す SECURITY_DESCRIPTOR 構造体へのポインタ。ポインタは有効であると仮定される。
%inst
構造的に有効なセキュリティ記述子の長さ (バイト単位) を返す。長さには関連付けられたすべての構造体の長さが含まれる。

[戻り値]
関数が成功した場合、SECURITY_DESCRIPTOR 構造体の長さ (バイト単位) を返す。SECURITY_DESCRIPTOR
構造体が有効でない場合、戻り値は未定義である。

[備考]
セキュリティ記述子の最小長は SECURITY_DESCRIPTOR_MIN_LENGTH
である。この長さのセキュリティ記述子には関連するセキュリティ識別子 (SID) やアクセス制御リスト (ACL) は含まれない。


%index
GetSecurityDescriptorOwner
セキュリティ記述子から所有者情報を取得する。
%group
Win32 advapi32
%prm
pSecurityDescriptor, pOwner, lpbOwnerDefaulted
pSecurityDescriptor : [int] 関数が所有者情報を取得する SECURITY_DESCRIPTOR 構造体へのポインタ。
pOwner : [var] 関数が戻るときに所有者を識別するセキュリティ識別子 (SID) へのポインタへのポインタ。セキュリティ記述子に所有者が含まれない場合、関数は pOwner が指すポインタを NULL に設定し、残りの出力パラメータ lpbOwnerDefaulted を無視する。セキュリティ記述子に所有者が含まれる場合、関数は pOwner が指すポインタにセキュリティ記述子の所有者 SID のアドレスを設定し、lpbOwnerDefaulted が指す変数に有効な値を提供する。
lpbOwnerDefaulted : [var] 関数が戻るときに、SECURITY_DESCRIPTOR_CONTROL 構造体の SE_OWNER_DEFAULTED フラグの値に設定されるフラグへのポインタ。pOwner パラメータが指す変数に格納された値が NULL の場合、値は設定されない。
%inst
セキュリティ記述子から所有者情報を取得する。

[戻り値]
関数が成功した場合、戻り値はゼロ以外となる。
失敗した場合はゼロを返す。拡張エラー情報を取得するには GetLastError を呼び出す。


%index
GetSecurityDescriptorRMControl
リソース マネージャ制御ビットを取得する。
%group
Win32 advapi32
%prm
SecurityDescriptor, RMControl
SecurityDescriptor : [int] リソース マネージャ制御ビットを含む SECURITY_DESCRIPTOR 構造体へのポインタ。Control メンバの値は SE_RM_CONTROL_VALID に設定される。
RMControl : [var] リソース マネージャ制御ビットを受け取るバッファへのポインタ。
%inst
リソース マネージャ制御ビットを取得する。

[戻り値]
関数が成功した場合、戻り値は ERROR_SUCCESS となる。失敗した場合、次の値が返される。
（以下省略）

[備考]
リソース マネージャ制御ビットは、SECURITY_DESCRIPTOR 構造体の Sbz1 メンバにある 8
ビットであり、構造体にアクセスするリソース マネージャ固有の情報を含む。これらのビットは
GetSecurityDescriptorRMControl 関数と SetSecurityDescriptorRMControl
関数を通してのみアクセスすべきである。


%index
GetSecurityDescriptorSacl
指定したセキュリティ記述子内のシステム アクセス制御リスト (SACL) へのポインタを取得する。
%group
Win32 advapi32
%prm
pSecurityDescriptor, lpbSaclPresent, pSacl, lpbSaclDefaulted
pSecurityDescriptor : [int] 関数がポインタを取得する SACL を含む SECURITY_DESCRIPTOR 構造体へのポインタ。
lpbSaclPresent : [var] 指定したセキュリティ記述子に SACL が存在することを示すために関数が設定するフラグへのポインタ。このパラメータが TRUE の場合、セキュリティ記述子は SACL を含み、この関数の残りの出力パラメータは有効な値を受け取る。このパラメータが FALSE の場合、セキュリティ記述子は SACL を含まず、残りの出力パラメータは有効な値を受け取らない。
pSacl : [var] アクセス制御リスト (ACL) へのポインタへのポインタ。SACL が存在する場合、関数は pSacl が指すポインタにセキュリティ記述子の SACL のアドレスを設定する。SACL が存在しない場合、値は格納されない。
lpbSaclDefaulted : [var] セキュリティ記述子に SACL が存在する場合、SECURITY_DESCRIPTOR_CONTROL 構造体の SE_SACL_DEFAULTED フラグの値に設定されるフラグへのポインタ。
%inst
指定したセキュリティ記述子内のシステム アクセス制御リスト (SACL) へのポインタを取得する。

[戻り値]
関数が成功した場合はゼロ以外を返す。
失敗した場合はゼロを返す。拡張エラー情報を取得するには GetLastError を呼び出す。


%index
GetSecurityInfo
ハンドルで指定したオブジェクトのセキュリティ記述子のコピーを取得する。
%group
Win32 advapi32
%prm
handle, ObjectType, SecurityInfo, ppsidOwner, ppsidGroup, ppDacl, ppSacl, ppSecurityDescriptor
handle : [intptr] セキュリティ情報を取得するオブジェクトへのハンドル。
ObjectType : [int] オブジェクトの型を示す SE_OBJECT_TYPE 列挙の値。
SecurityInfo : [int] 取得するセキュリティ情報の種類を示すビット フラグのセット。このパラメータは SECURITY_INFORMATION ビット フラグの組み合わせを指定できる。
ppsidOwner : [var] ppSecurityDescriptor で返されるセキュリティ記述子内の所有者 SID へのポインタを受け取る変数へのポインタ。返されるポインタは OWNER_SECURITY_INFORMATION フラグを設定した場合にのみ有効である。所有者 SID が不要な場合、このパラメータは NULL にできる。
ppsidGroup : [var] 返されるセキュリティ記述子内のプライマリ グループ SID へのポインタを受け取る変数へのポインタ。返されるポインタは GROUP_SECURITY_INFORMATION フラグを設定した場合にのみ有効である。グループ SID が不要な場合、このパラメータは NULL にできる。
ppDacl : [var] 返されるセキュリティ記述子内の DACL へのポインタを受け取る変数へのポインタ。返されるポインタは DACL_SECURITY_INFORMATION フラグを設定した場合にのみ有効である。DACL が不要な場合、このパラメータは NULL にできる。
ppSacl : [var] 返されるセキュリティ記述子内の SACL へのポインタを受け取る変数へのポインタ。返されるポインタは SACL_SECURITY_INFORMATION フラグを設定した場合にのみ有効である。SACL が不要な場合、このパラメータは NULL にできる。
ppSecurityDescriptor : [var] オブジェクトのセキュリティ記述子へのポインタを受け取る変数へのポインタ。ポインタの使用が終わったら、LocalFree 関数を呼び出して返されたバッファを解放する。ppsidOwner、ppsidGroup、ppDacl、または ppSacl のいずれか一つでも NULL でない場合、このパラメータは必須である。
%inst
ハンドルで指定したオブジェクトのセキュリティ記述子のコピーを取得する。

[戻り値]
関数が成功した場合、戻り値は ERROR_SUCCESS となる。失敗した場合、戻り値は WinError.h
で定義されるゼロ以外のエラーコードとなる。

[備考]
ppsidOwner、ppsidGroup、ppDacl、ppSacl パラメータが NULL でなく、SecurityInfo
パラメータがそれらをオブジェクトから取得するよう指定している場合、それらのパラメータは ppSecurityDescriptor
で返されるセキュリティ記述子内の対応するパラメータを指す。オブジェクトのセキュリティ記述子から所有者、グループ、または DACL
を読み取るには、ハンドルを開いたときに呼び出し元プロセスが READ_CONTROL
アクセスを付与されている必要がある。READ_CONTROL
アクセスを取得するには、呼び出し側がオブジェクトの所有者であるか、オブジェクトの DACL
がそのアクセスを許可している必要がある。セキュリティ記述子から SACL を読み取るには、ハンドルを開いたときに呼び出し元プロセスが
ACCESS_SYSTEM_SECURITY
アクセスを付与されている必要がある。このアクセスを取得する適切な方法は、呼び出し元の現在のトークンで SE_SECURITY_NAME
特権を有効にし、ACCESS_SYSTEM_SECURITY
アクセスでハンドルを開き、その後で特権を無効にすることである。特権を有効にすることのセキュリティ上の意味については Running
with Special Privileges を参照。GetSecurityInfo 関数は次の種類のオブジェクトで使用できる。
（以下省略）


%index
GetServiceDisplayNameW
指定したサービスの表示名を取得する。(Unicode)
%group
Win32 advapi32
%prm
hSCManager, lpServiceName, lpDisplayName, lpcchBuffer
hSCManager : [intptr] OpenSCManager 関数によって返されるサービスコントロールマネージャデータベースへのハンドル。
lpServiceName : [wstr] サービス名。この名前はサービスのレジストリ キー名と同じである。256 文字未満の名前を選択することが推奨される。
lpDisplayName : [wstr] サービスの表示名を受け取るバッファへのポインタ。関数が失敗した場合、このバッファには空文字列が格納される。この配列の最大サイズは 4K バイトである。必要なサイズを判別するには、このパラメータに NULL を、lpcchBuffer パラメータに 0 を指定する。関数は失敗し、GetLastError は ERROR_INSUFFICIENT_BUFFER を返す。lpcchBuffer パラメータは必要なサイズを受け取る。このパラメータは次の形式でローカライズされた文字列を指定できる: @[path\]dllname,-strID 識別子 strID の文字列は dllname から読み込まれ、path は任意である。詳細は RegLoadMUIString を参照。Windows Server 2003 および Windows XP: ローカライズされた文字列は Windows Vista までサポートされていない。
lpcchBuffer : [var] lpDisplayName が指すバッファのサイズを TCHAR 単位で指定する変数へのポインタ。
%inst
指定したサービスの表示名を取得する。(Unicode)

[戻り値]
関数が成功した場合、戻り値はゼロ以外となる。失敗した場合、戻り値はゼロとなる。拡張エラー情報を取得するには GetLastError
を呼び出す。

[備考]
サービスには 2 つの名前がある。サービス名と表示名である。サービス名はレジストリ内のサービスのキーの名前である。表示名は
Services コントロール パネル アプリケーションに表示されるユーザーフレンドリな名前であり、NET START
コマンドで使用される。サービス名を表示名にマップするには GetServiceDisplayName
関数を使用する。表示名をサービス名にマップするには GetServiceKeyName 関数を使用する。
> [!NOTE] > winsvc.h ヘッダーは GetServiceDisplayName
をエイリアスとして定義しており、UNICODE プリプロセッサ定数の定義に応じて、この関数の ANSI 版と Unicode
版を自動的に選択する。エンコーディングに依存しないエイリアスと、エンコーディングに依存しないコードとを混在させると、コンパイルエラーや実行時エラーを引き起こす不整合が生じる可能性がある。詳細は
[関数プロトタイプの規約](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
GetServiceKeyNameW
指定したサービスのサービス名を取得する。(Unicode)
%group
Win32 advapi32
%prm
hSCManager, lpDisplayName, lpServiceName, lpcchBuffer
hSCManager : [intptr] OpenSCManager によって返されるコンピュータのサービスコントロールマネージャデータベースへのハンドル。
lpDisplayName : [wstr] サービスの表示名。この文字列の最大長は 256 文字である。
lpServiceName : [wstr] サービス名を受け取るバッファへのポインタ。関数が失敗した場合、このバッファには空文字列が格納される。この配列の最大サイズは 4K バイトである。必要なサイズを求めるには、このパラメータに NULL、lpcchBuffer パラメータに 0 を指定する。関数は失敗し、GetLastError は ERROR_INSUFFICIENT_BUFFER を返す。lpcchBuffer パラメータが必要なサイズを受け取る。
lpcchBuffer : [var] lpServiceName パラメータが指すバッファのサイズを TCHAR 単位で指定する変数へのポインタ。関数が戻るとき、このパラメータには終端 null 文字を除いたサービス名のサイズが TCHAR 単位で格納される。lpServiceName が指すバッファがサービス名を格納するには小さすぎる場合、関数はそこにデータを格納しない。関数が戻るとき、lpcchBuffer には NULL 終端を除くサービス名のサイズが格納される。
%inst
指定したサービスのサービス名を取得する。(Unicode)

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 である。拡張エラー情報を取得するには
GetLastError を呼び出す。

[備考]
サービスには 2 つの名前がある。サービス名と表示名である。サービス名はレジストリ上のサービスのキー名である。表示名は [サービス]
コントロールパネルアプリケーションに表示されるユーザーフレンドリーな名前で、NET START コマンドでも使用される。どちらの名前も
CreateService 関数で指定し、ChangeServiceConfig
関数で変更できる。サービスに指定された情報は、HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\ServiceName
レジストリキーの下に、サービス名と同じ名前のキーに格納される。サービス名を表示名にマップするには
GetServiceDisplayName 関数を使用する。表示名をサービス名にマップするには GetServiceKeyName
関数を使用する。
> [!NOTE] > winsvc.h ヘッダーは GetServiceKeyName をエイリアスとして定義し、UNICODE
プリプロセッサ定数の定義に基づいて、この関数の ANSI 版または Unicode
版を自動的に選択する。エンコーディング中立でないコードとエンコーディング中立のエイリアスを混在させると、コンパイルや実行時エラーの原因となる不一致が発生することがある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
GetSidIdentifierAuthority
指定されたセキュリティ識別子 (SID) 内の SID_IDENTIFIER_AUTHORITY 構造体へのポインタを返す。
%group
Win32 advapi32
%prm
pSid
pSid : [int] SID_IDENTIFIER_AUTHORITY 構造体へのポインタが返される SID 構造体へのポインタ。この関数は無効な SID 構造体を処理しない。この関数を呼び出す前に IsValidSid 関数を呼び出して SID 構造体が有効であることを確認すること。
%inst
指定されたセキュリティ識別子 (SID) 内の SID_IDENTIFIER_AUTHORITY 構造体へのポインタを返す。

[戻り値]
関数が成功した場合、戻り値は指定された SID 構造体の SID_IDENTIFIER_AUTHORITY
構造体へのポインタである。関数が失敗した場合、戻り値は未定義である。pSid パラメータが指す SID
構造体が有効でない場合、関数は失敗する。拡張エラー情報を取得するには GetLastError を呼び出す。

[備考]
この関数は 32 ビットの RID 値を使用する。より大きな RID 値が必要なアプリケーションでは、CreateWellKnownSid
および関連関数を使用する。


%index
GetSidLengthRequired
指定された数のサブオーソリティを持つ SID を格納するのに必要なバッファの長さをバイト単位で返す。
%group
Win32 advapi32
%prm
nSubAuthorityCount
nSubAuthorityCount : [int] SID 構造体に格納するサブオーソリティの数を指定する。
%inst
指定された数のサブオーソリティを持つ SID を格納するのに必要なバッファの長さをバイト単位で返す。

[戻り値]
戻り値は、SID 構造体を格納するのに必要なバッファのバイト数である。この関数は失敗することがない。

[備考]
nSubAuthorityCount で指定される SID 構造体は 32 ビットの RID 値を使用する。より長い RID
値が必要なアプリケーションでは、CreateWellKnownSid および関連関数を使用する。


%index
GetSidSubAuthority
セキュリティ識別子 (SID) 内の指定されたサブオーソリティへのポインタを返す。サブオーソリティ値は相対識別子 (RID) である。
%group
Win32 advapi32
%prm
pSid, nSubAuthority
pSid : [int] サブオーソリティへのポインタを返す SID 構造体へのポインタ。この関数は無効な SID 構造体を処理しない。この関数を呼び出す前に IsValidSid 関数を呼び出して SID 構造体が有効であることを確認すること。
nSubAuthority : [int] 関数がアドレスを返すサブオーソリティ配列要素を示すインデックス値を指定する。関数はこの値に対して検証を行わない。アプリケーションは GetSidSubAuthorityCount 関数を呼び出して、受け入れ可能な値の範囲を調べることができる。
%inst
セキュリティ識別子 (SID) 内の指定されたサブオーソリティへのポインタを返す。サブオーソリティ値は相対識別子 (RID) である。

[戻り値]
関数が成功した場合、戻り値は指定された SID のサブオーソリティへのポインタである。拡張エラー情報を取得するには
GetLastError を呼び出す。関数が失敗した場合、戻り値は未定義である。指定された SID
構造体が無効であるか、nSubAuthority パラメータで指定されたインデックス値が範囲外の場合、関数は失敗する。

[備考]
pSid で指定される SID 構造体は 32 ビットの RID 値を使用する。より長い RID
値が必要なアプリケーションでは、CreateWellKnownSid および関連関数を使用する。


%index
GetSidSubAuthorityCount
セキュリティ識別子 (SID) 構造体内のサブオーソリティ数を保持するメンバへのポインタを返す。
%group
Win32 advapi32
%prm
pSid
pSid : [int] サブオーソリティ数へのポインタを返す SID 構造体へのポインタ。この関数は無効な SID 構造体を処理しない。この関数を呼び出す前に IsValidSid 関数を呼び出して SID 構造体が有効であることを確認すること。
%inst
セキュリティ識別子 (SID) 構造体内のサブオーソリティ数を保持するメンバへのポインタを返す。

[戻り値]
関数が成功した場合、戻り値は指定された SID
構造体のサブオーソリティ数へのポインタである。関数が失敗した場合、戻り値は未定義である。指定された SID
構造体が無効な場合、関数は失敗する。拡張エラー情報を取得するには GetLastError を呼び出す。

[備考]
pSid で指定される SID 構造体は 32 ビット値を使用する。より長い RID
値が必要なアプリケーションでは、CreateWellKnownSid および関連関数を使用する。


%index
GetThreadWaitChain
指定したスレッドの待機チェーンを取得する。
%group
Win32 advapi32
%prm
WctHandle, Context, Flags, ThreadId, NodeCount, NodeInfoArray, IsCycle
WctHandle : [intptr] OpenThreadWaitChainSession 関数で作成した WCT セッションへのハンドル。
Context : [int] 非同期セッションのコールバック関数に渡される、アプリケーション定義のコンテキスト構造体へのポインタ。
Flags : [int] 
ThreadId : [int] スレッドの識別子。
NodeCount : [var] 入力時は、待機チェーン内のノード数を指定する 1 から WCT_MAX_NODE_COUNT までの値。戻り時は、取得されたノード数。配列が待機チェーンの全ノードを格納できない場合、関数は失敗し、GetLastError は ERROR_MORE_DATA を返し、このパラメータには全ノードを格納するために必要な配列要素数が格納される。非同期セッションでは、コールバック関数に渡される値を確認する。コールバック関数が戻るまで変数を解放してはならない。
NodeInfoArray : [var] 待機チェーンを受け取る WAITCHAIN_NODE_INFO 構造体の配列。非同期セッションでは、コールバック関数に渡される値を確認する。コールバック関数が戻るまで配列を解放してはならない。
IsCycle : [var] 関数がデッドロックを検出した場合、この変数は TRUE に設定される。それ以外は FALSE に設定される。非同期セッションでは、コールバック関数に渡される値を確認する。コールバック関数が戻るまで変数を解放してはならない。
%inst
指定したスレッドの待機チェーンを取得する。

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 である。拡張エラー情報を取得するには
GetLastError を呼び出す。
（以下省略）

[備考]
セッションが非同期の場合、関数は FALSE を返し、GetLastError は ERROR_IO_PENDING
を返す。結果を取得するには WaitChainCallback
コールバック関数を参照。指定したスレッドがブロックされていないか、サポートされていない同期オブジェクトでブロックされている場合、関数は
NodeInfoArray に 1 個の項目を返す。呼び出し元は SE_DEBUG_NAME
特権を持っている必要がある。呼び出し元の権限が不足している場合、最初のスレッドにアクセスできないと関数は失敗する。それ以外の場合は、配列の最後のノードの
ObjectStatus メンバが WctStatusNoAcces
に設定される。配列内のノードの部分集合がサイクルを形成している場合、関数は IsCycle パラメータを TRUE
に設定する。待機チェーン情報は動的である。関数呼び出し時点では正しいが、呼び出し元が確認する時点では古くなっている可能性がある。


%index
GetTokenInformation
アクセストークンに関する指定された種類の情報を取得する。呼び出し元プロセスは、情報を取得するための適切なアクセス権を持つ必要がある。
%group
Win32 advapi32
%prm
TokenHandle, TokenInformationClass, TokenInformation, TokenInformationLength, ReturnLength
TokenHandle : [intptr] 情報を取得するアクセストークンへのハンドル。TokenInformationClass が TokenSource を指定する場合、ハンドルは TOKEN_QUERY_SOURCE アクセスを持つ必要がある。それ以外のすべての TokenInformationClass 値では、ハンドルは TOKEN_QUERY アクセスを持つ必要がある。
TokenInformationClass : [int] 関数が取得する情報の種類を識別するため、TOKEN_INFORMATION_CLASS 列挙型の値を指定する。TokenIsAppContainer を確認し、0 が返される場合、呼び出し元トークンが識別レベルの偽装トークンでないことも確認すること。現在のトークンがアプリコンテナではなく識別レベルのトークンである場合、AccessDenied を返すべきである。
TokenInformation : [intptr] 関数が要求された情報を格納するバッファへのポインタ。このバッファに格納される構造体は、TokenInformationClass パラメータで指定された情報の種類に依存する。
TokenInformationLength : [int] TokenInformation パラメータが指すバッファのサイズをバイト単位で指定する。TokenInformation が NULL の場合、このパラメータは 0 でなければならない。
ReturnLength : [var] TokenInformation パラメータが指すバッファに必要なバイト数を受け取る変数へのポインタ。この値が TokenInformationLength パラメータで指定した値より大きい場合、関数は失敗し、バッファにデータを格納しない。TokenInformationClass の値が TokenDefaultDacl で、トークンにデフォルト DACL がない場合、関数は ReturnLength が指す変数を sizeof(TOKEN_DEFAULT_DACL) に設定し、TOKEN_DEFAULT_DACL 構造体の DefaultDacl メンバを NULL に設定する。
%inst
アクセストークンに関する指定された種類の情報を取得する。呼び出し元プロセスは、情報を取得するための適切なアクセス権を持つ必要がある。

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 である。拡張エラー情報を取得するには
GetLastError を呼び出す。


%index
GetTrusteeFormW
指定された TRUSTEE 構造体からトラスティ名を取得する。この値は、構造体が名前文字列を使用するかセキュリティ識別子 (SID) を使用してトラスティを識別するかを示す。(Unicode)
%group
Win32 advapi32
%prm
pTrustee
pTrustee : [var] TRUSTEE 構造体へのポインタ。
%inst
指定された TRUSTEE 構造体からトラスティ名を取得する。この値は、構造体が名前文字列を使用するかセキュリティ識別子 (SID)
を使用してトラスティを識別するかを示す。(Unicode)

[戻り値]
戻り値は TRUSTEE_FORM 列挙型の定数の 1 つである。

[備考]
> [!NOTE] > aclapi.h ヘッダーは GetTrusteeForm をエイリアスとして定義し、UNICODE
プリプロセッサ定数の定義に基づいて、この関数の ANSI 版または Unicode
版を自動的に選択する。エンコーディング中立でないコードとエンコーディング中立のエイリアスを混在させると、コンパイルや実行時エラーの原因となる不一致が発生することがある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
GetTrusteeNameW
指定された TRUSTEE 構造体からトラスティ名を取得する。(Unicode)
%group
Win32 advapi32
%prm
pTrustee
pTrustee : [var] TRUSTEE 構造体へのポインタ。
%inst
指定された TRUSTEE 構造体からトラスティ名を取得する。(Unicode)

[戻り値]
TRUSTEE 構造体の TrusteeForm メンバが TRUSTEE_IS_NAME の場合、戻り値は構造体の ptstrName
メンバに割り当てられたポインタである。TrusteeForm メンバが TRUSTEE_IS_SID の場合、戻り値は NULL
である。関数はセキュリティ識別子 (SID) に関連付けられた名前を検索しない。

[備考]
GetTrusteeName 関数はメモリの確保を行わない。
> [!NOTE] > aclapi.h ヘッダーは GetTrusteeName をエイリアスとして定義し、UNICODE
プリプロセッサ定数の定義に基づいて、この関数の ANSI 版または Unicode
版を自動的に選択する。エンコーディング中立でないコードとエンコーディング中立のエイリアスを混在させると、コンパイルや実行時エラーの原因となる不一致が発生することがある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
GetTrusteeTypeW
指定された TRUSTEE 構造体からトラスティ種別を取得する。この値は、トラスティがユーザー、グループ、または不明のいずれであるかを示す。(Unicode)
%group
Win32 advapi32
%prm
pTrustee
pTrustee : [var] TRUSTEE 構造体へのポインタ。
%inst
指定された TRUSTEE
構造体からトラスティ種別を取得する。この値は、トラスティがユーザー、グループ、または不明のいずれであるかを示す。(Unicode)

[戻り値]
戻り値は TRUSTEE_TYPE 列挙型の定数の 1 つである。

[備考]
> [!NOTE] > aclapi.h ヘッダーは GetTrusteeType をエイリアスとして定義し、UNICODE
プリプロセッサ定数の定義に基づいて、この関数の ANSI 版または Unicode
版を自動的に選択する。エンコーディング中立でないコードとエンコーディング中立のエイリアスを混在させると、コンパイルや実行時エラーの原因となる不一致が発生することがある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
GetUserNameW
現在のスレッドに関連付けられたユーザーの名前を取得する。(Unicode)
%group
Win32 advapi32
%prm
lpBuffer, pcbBuffer
lpBuffer : [wstr] ユーザーのログオン名を受け取るバッファへのポインタ。このバッファがユーザー名全体を格納するのに十分な大きさでない場合、関数は失敗する。(UNLEN + 1) 文字のバッファサイズで、終端 null 文字を含む最大長のユーザー名を格納できる。UNLEN は Lmcons.h で定義される。
pcbBuffer : [var] 入力時、この変数は lpBuffer バッファのサイズを TCHAR 単位で指定する。出力時、変数にはバッファにコピーされた TCHAR 数 (終端 null 文字を含む) が格納される。
%inst
現在のスレッドに関連付けられたユーザーの名前を取得する。(Unicode)

[戻り値]
関数が成功した場合、戻り値は 0 以外であり、lpnSize が指す変数には終端 null 文字を含めて lpBuffer
で指定されたバッファにコピーされた TCHAR 数が格納される。関数が失敗した場合、戻り値は 0 である。拡張エラー情報を取得するには
GetLastError を呼び出す。

[備考]
現在のスレッドが別のクライアントを偽装している場合、GetUserName
関数はスレッドが偽装しているクライアントのユーザー名を返す。GetUserName が "NETWORK SERVICE"
アカウントで実行されているプロセスから呼び出された場合、lpBuffer に返される文字列は Windows
のバージョンによって異なる。Windows XP では "NETWORK SERVICE" 文字列が返される。Windows Vista
では "<HOSTNAME>$" 文字列が返される。


%index
GetWindowsAccountDomainSid
セキュリティ識別子 (SID) を受け取り、その SID のドメインを表す SID を返す。
%group
Win32 advapi32
%prm
pSid, pDomainSid, cbDomainSid
pSid : [int] 調査対象の SID へのポインタ。
pDomainSid : [int] GetWindowsAccountDomainSid がドメインを表す SID へのポインタを格納するポインタ。
cbDomainSid : [var] GetWindowsAccountDomainSid がドメイン SID のサイズをバイト単位で格納する DWORD へのポインタ。
%inst
セキュリティ識別子 (SID) を受け取り、その SID のドメインを表す SID を返す。

[戻り値]
成功した場合は TRUE を返す。それ以外は FALSE を返す。拡張エラー情報を取得するには GetLastError を呼び出す。


%index
ImpersonateAnonymousToken
指定したスレッドがシステムの匿名ログオントークンを偽装できるようにする。
%group
Win32 advapi32
%prm
ThreadHandle
ThreadHandle : [intptr] システムの匿名ログオントークンを偽装するスレッドへのハンドル。スレッドがシステムの匿名ログオントークンを偽装するためには、スレッドハンドルが THREAD_IMPERSONATE アクセス権を持つ必要がある。このアクセス権を付与するには、THREAD_IMPERSONATE 所望のアクセス権で OpenThread を呼び出してスレッドを開く必要がある。
%inst
指定したスレッドがシステムの匿名ログオントークンを偽装できるようにする。

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 である。拡張エラー情報を取得するには
GetLastError を呼び出す。ACCESS_DENIED
エラーは、トークンが制限付きプロセスのものである可能性を示す。[OpenProcessToken](/windows/win32/api/processthreadsapi/nf-processthreadsapi-openprocesstoken)
と
[IsTokenRestricted](/windows/win32/api/securitybaseapi/nf-securitybaseapi-istokenrestricted)
を使用してプロセスが制限付きかどうかを確認する。スレッドハンドルが THREAD_IMPERSONATE へのアクセス権を欠いている場合も
ACCESS_DENIED が返される。

[備考]

匿名トークンには、HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa\EveryoneIncludesAnonymous
レジストリ値を DWORD=1 に設定してシステム既定を上書きしない限り、"Everyone" グループ SID
は含まれない。偽装を取り消すには RevertToSelf を呼び出す。


%index
ImpersonateLoggedOnUser
呼び出し元スレッドがログオン済みユーザーのセキュリティコンテキストを偽装できるようにする。ユーザーはトークンハンドルによって表される。
%group
Win32 advapi32
%prm
hToken
hToken : [intptr] ログオン済みユーザーを表すプライマリまたは偽装アクセストークンへのハンドル。これは、LogonUser、CreateRestrictedToken、DuplicateToken、DuplicateTokenEx、OpenProcessToken、OpenThreadToken の呼び出しによって返されるトークンハンドルでよい。hToken がプライマリトークンのハンドルである場合、トークンは TOKEN_QUERY および TOKEN_DUPLICATE アクセスを持つ必要がある。hToken が偽装トークンのハンドルである場合、トークンは TOKEN_QUERY および TOKEN_IMPERSONATE アクセスを持つ必要がある。
%inst
呼び出し元スレッドがログオン済みユーザーのセキュリティコンテキストを偽装できるようにする。ユーザーはトークンハンドルによって表される。

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 である。拡張エラー情報を取得するには
GetLastError を呼び出す。

[備考]
偽装はスレッドが終了するか、RevertToSelf を呼び出すまで続く。呼び出し元スレッドは
ImpersonateLoggedOnUser を呼び出すために特別な特権を必要としない。ImpersonateLoggedOnUser
の呼び出しが失敗した場合、クライアント接続は偽装されず、クライアント要求はプロセスのセキュリティコンテキストで行われる。プロセスが
LocalSystem
のような高特権アカウントや管理グループのメンバとして実行されている場合、ユーザーは本来許可されない操作を行える可能性がある。したがって、常に呼び出しの戻り値を確認することが重要であり、失敗した場合はエラーを発生させ、クライアント要求の実行を継続しないこと。ImpersonateLoggedOnUser
を含むすべての偽装関数は、以下のいずれかが真の場合に要求された偽装を許可する。
（以下省略）


%index
ImpersonateNamedPipeClient
名前付きパイプのクライアントアプリケーションを偽装する。
%group
Win32 advapi32
%prm
hNamedPipe
hNamedPipe : [intptr] 名前付きパイプへのハンドル。
%inst
名前付きパイプのクライアントアプリケーションを偽装する。

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 である。拡張エラー情報を取得するには
GetLastError を呼び出す。

[備考]
ImpersonateNamedPipeClient
関数は、名前付きパイプのサーバー側がクライアント側を偽装できるようにする。この関数を呼び出すと、名前付きパイプファイルシステムは呼び出し元プロセスのスレッドを、パイプから読み取った最後のメッセージのセキュリティコンテキストを偽装するように変更する。この関数を呼び出せるのはパイプのサーバー側のみである。偽装が完了したら、サーバーは
RevertToSelf 関数を呼び出せる。重要 ImpersonateNamedPipeClient
関数が失敗した場合、クライアントは偽装されず、以降のクライアント要求はすべて関数を呼び出したプロセスのセキュリティコンテキストで実行される。呼び出し元プロセスが特権アカウントで実行されている場合、クライアントには許可されない操作を実行できる可能性がある。セキュリティリスクを回避するため、呼び出し元プロセスは常に戻り値を確認すること。戻り値が関数呼び出しの失敗を示す場合、クライアント要求を実行してはならない。ImpersonateNamedPipeClient
を含むすべての偽装関数は、以下のいずれかが真の場合に要求された偽装を許可する。
（以下省略）


%index
ImpersonateSelf
呼び出し元プロセスのセキュリティコンテキストを偽装するアクセストークンを取得する。トークンは呼び出し元スレッドに割り当てられる。
%group
Win32 advapi32
%prm
ImpersonationLevel
ImpersonationLevel : [int] 新しいトークンの偽装レベルを与える SECURITY_IMPERSONATION_LEVEL 列挙型を指定する。
%inst
呼び出し元プロセスのセキュリティコンテキストを偽装するアクセストークンを取得する。トークンは呼び出し元スレッドに割り当てられる。

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 である。拡張エラー情報を取得するには
GetLastError を呼び出す。

[備考]
ImpersonateSelf
関数は、プロセス全体ではなく単一のスレッドで特権を有効にしたり、単一のスレッドで既定の随意アクセス制御リスト (DACL)
を変更したりするなどのタスクに使用する。偽装が完了したら、サーバーは RevertToSelf
関数を呼び出せる。この関数が成功するには、プロセストークンを保護する DACL がそれ自身に TOKEN_DUPLICATE
権を付与する必要がある。


%index
InitializeAcl
新しい ACL 構造体を初期化する。
%group
Win32 advapi32
%prm
pAcl, nAclLength, dwAclRevision
pAcl : [var] この関数で初期化する ACL 構造体へのポインタ。この関数を呼び出す前に pAcl のメモリを確保すること。
nAclLength : [int] pAcl パラメータが指すバッファの長さをバイト単位で指定する。この値は ACL ヘッダーと、ACL に格納されるすべての ACE を含むのに十分な大きさである必要がある。さらに、この値は DWORD 境界に整列する必要がある。ACL のサイズ計算の詳細については「備考」を参照。
dwAclRevision : [int] 作成する ACL 構造体のリビジョンレベル。
%inst
新しい ACL 構造体を初期化する。

[戻り値]
関数が成功した場合、0 以外を返す。
関数が失敗した場合、0 を返す。拡張エラー情報を取得するには GetLastError を呼び出す。

[備考]
InitializeAcl 関数は空の ACL 構造体を作成する。ACL には ACE が含まれていない。空の ACL
をオブジェクトに適用すると、そのオブジェクトへのすべてのアクセスが拒否される。ACL の初期サイズは、使用前に ACL に追加する予定の
ACE の数に依存する。例えば、ACL にユーザーとグループの ACE を含める予定であれば、2 つの ACE に基づいて ACL
を初期化する。既存の ACL の変更については「Modifying the ACLs of an Object」を参照。ACL
の初期サイズを計算するには、以下を合計し、最も近い DWORD に整列する。
（以下省略）


%index
InitializeSecurityDescriptor
新しいセキュリティ記述子を初期化する。
%group
Win32 advapi32
%prm
pSecurityDescriptor, dwRevision
pSecurityDescriptor : [int] この関数で初期化する SECURITY_DESCRIPTOR 構造体へのポインタ。
dwRevision : [int] セキュリティ記述子に割り当てるリビジョンレベル。このパラメータは SECURITY_DESCRIPTOR_REVISION でなければならない。
%inst
新しいセキュリティ記述子を初期化する。

[戻り値]
関数が成功した場合、0 以外を返す。
関数が失敗した場合、0 を返す。拡張エラー情報を取得するには GetLastError を呼び出す。

[備考]
InitializeSecurityDescriptor
関数はセキュリティ記述子を自己相対形式ではなく絶対形式で初期化する。InitializeSecurityDescriptor
関数はセキュリティ記述子を、システムアクセス制御リスト (SACL)、随意アクセス制御リスト
(DACL)、所有者、プライマリグループがなく、すべての制御フラグが FALSE (NULL)
に設定された状態に初期化する。したがって、リビジョンレベルを除けば空である。


%index
InitializeSid
セキュリティ識別子 (SID) を初期化する。
%group
Win32 advapi32
%prm
Sid, pIdentifierAuthority, nSubAuthorityCount
Sid : [int] 初期化する SID 構造体へのポインタ。
pIdentifierAuthority : [var] SID 構造体に設定する SID_IDENTIFIER_AUTHORITY 構造体へのポインタ。
nSubAuthorityCount : [int] SID に設定するサブオーソリティの数を指定する。サブオーソリティの値は、後述の「備考」のとおり別途設定する必要がある。
%inst
セキュリティ識別子 (SID) を初期化する。

[戻り値]
関数が成功した場合、戻り値は 0 以外である。
関数が失敗した場合、戻り値は 0 である。拡張エラー情報を取得するには GetLastError を呼び出す。

[備考]
InitializeSid 関数は SID のサブオーソリティ数を設定するが、サブオーソリティ値は設定しない。サブオーソリティ値は
GetSidSubAuthority などの関数を使用して別途設定する必要がある。アプリケーションは
AllocateAndInitializeSid 関数を使用して SID を初期化し、そのサブオーソリティ値を設定できる。この関数は 32
ビットの RID 値を使用する。より大きな RID 値が必要なアプリケーションでは、CreateWellKnownSid を使用する。


%index
InitiateShutdownW
指定したコンピュータのシャットダウンと再起動を開始し、再起動のために登録されているアプリケーションを再起動する。(Unicode)
%group
Win32 advapi32
%prm
lpMachineName, lpMessage, dwGracePeriod, dwShutdownFlags, dwReason
lpMachineName : [wstr] シャットダウンするコンピュータの名前。このパラメータの値が NULL の場合、ローカルコンピュータがシャットダウンされる。
lpMessage : [wstr] 対話型シャットダウンダイアログボックスに表示するメッセージ。
dwGracePeriod : [int] コンピュータをシャットダウンするまで待機する秒数。このパラメータの値が 0 の場合、コンピュータは即座にシャットダウンされる。この値は MAX_SHUTDOWN_TIMEOUT に制限される。このパラメータの値が 0 より大きく、dwShutdownFlags パラメータが SHUTDOWN_GRACE_OVERRIDE フラグを指定している場合、関数は失敗し、エラーコード ERROR_BAD_ARGUMENTS を返す。
dwShutdownFlags : [int] シャットダウンのオプションを指定する 1 つ以上のビットフラグ。以下の値が定義されている。
dwReason : [int] シャットダウンを開始する理由。このパラメータは、システムシャットダウン理由コードの 1 つでなければならない。このパラメータが 0 の場合、既定は「No title for this reason could be found」としてログに記録される未定義のシャットダウンとなる。既定では計画外のシャットダウンでもある。システムの構成によっては、計画外のシャットダウンはシステム状態情報を含むファイルの作成を引き起こし、シャットダウンを遅らせる可能性がある。したがって、このパラメータに 0 を指定しないこと。
%inst
指定したコンピュータのシャットダウンと再起動を開始し、再起動のために登録されているアプリケーションを再起動する。(Unicode)

[戻り値]
関数が成功した場合、ERROR_SUCCESS を返す。関数が失敗した場合、以下のいずれかのエラーコードを返す。
（以下省略）

[備考]
ローカルコンピュータをシャットダウンするには、呼び出し元スレッドが SE_SHUTDOWN_NAME
特権を持っている必要がある。リモートコンピュータをシャットダウンするには、呼び出し元スレッドがリモートコンピュータ上で
SE_REMOTE_SHUTDOWN_NAME 特権を持っている必要がある。既定では、ユーザーはログオンしているコンピュータ上で
SE_SHUTDOWN_NAME 特権を有効にでき、管理者はリモートコンピュータ上で SE_REMOTE_SHUTDOWN_NAME
特権を有効にできる。詳細については「Running with Special
Privileges」を参照。失敗の一般的な原因には、無効またはアクセスできないコンピュータ名、不十分な特権などがある。指定したコンピュータで既にシャットダウンが進行中の場合、ERROR_SHUTDOWN_IN_PROGRESS
エラーが返される。高速ユーザー切り替えが有効だがログオンしているユーザーがいない場合、ERROR_NOT_READY
エラーが返されることがある。0
以外の戻り値はログオフが成功した、または成功することを意味するものではない。シャットダウンは非同期処理であり、API
呼び出しが戻ってからかなり後に発生することもあれば、まったく発生しないこともある。タイムアウト値が 0
であっても、シャットダウンはアプリケーション、サービス、またはシステム自身によって中止されることがある。0
以外の戻り値は、権限とパラメータの検証が成功し、システムがシャットダウン要求を受け入れたことを示す。
> [!NOTE] > winreg.h ヘッダーは InitiateShutdown をエイリアスとして定義し、UNICODE
プリプロセッサ定数の定義に基づいて、この関数の ANSI 版または Unicode
版を自動的に選択する。エンコーディング中立でないコードとエンコーディング中立のエイリアスを混在させると、コンパイルや実行時エラーの原因となる不一致が発生することがある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
InitiateSystemShutdownW
指定したコンピュータのシャットダウンと任意の再起動を開始する。(Unicode)
%group
Win32 advapi32
%prm
lpMachineName, lpMessage, dwTimeout, bForceAppsClosed, bRebootAfterShutdown
lpMachineName : [wstr] シャットダウンするコンピュータのネットワーク名。lpMachineName が NULL または空文字列の場合、関数はローカルコンピュータをシャットダウンする。
lpMessage : [wstr] シャットダウンダイアログボックスに表示するメッセージ。メッセージが不要な場合、このパラメータは NULL でよい。Windows Server 2003 および Windows XP: この文字列はイベントログエントリのコメントとしても保存される。Windows Server 2003 および Windows XP SP1: 文字列は 3072 TCHAR に制限される。
dwTimeout : [int] シャットダウンダイアログボックスを表示する時間 (秒単位)。このダイアログボックスが表示されている間、シャットダウンは AbortSystemShutdown 関数で停止できる。dwTimeout が 0 でない場合、InitiateSystemShutdown は指定されたコンピュータにダイアログボックスを表示する。ダイアログボックスには関数を呼び出したユーザーの名前、lpMessage パラメータで指定されたメッセージが表示され、ユーザーにログオフを促す。ダイアログボックスは作成時にビープ音を鳴らし、システム内の他のウィンドウの上に留まる。ダイアログボックスは移動できるが閉じることはできない。タイマーが強制シャットダウンまでの残り時間をカウントダウンする。dwTimeout が 0 の場合、コンピュータはダイアログボックスを表示せずにシャットダウンし、AbortSystemShutdown でシャットダウンを停止できない。Windows Server 2003 および Windows XP SP1: タイムアウト値は MAX_SHUTDOWN_TIMEOUT 秒に制限される。
bForceAppsClosed : [int] このパラメータが TRUE の場合、未保存の変更があるアプリケーションを強制的に閉じる。これはデータ損失につながる可能性があることに注意すること。このパラメータが FALSE の場合、システムはユーザーにアプリケーションを閉じるよう指示するダイアログボックスを表示する。
bRebootAfterShutdown : [int] このパラメータが TRUE の場合、シャットダウン後にコンピュータを即座に再起動する。このパラメータが FALSE の場合、システムはすべてのキャッシュをディスクにフラッシュし、システムを安全にシャットダウンする。
%inst
指定したコンピュータのシャットダウンと任意の再起動を開始する。(Unicode)

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 である。拡張エラー情報を取得するには
GetLastError を呼び出す。

[備考]
ローカルコンピュータをシャットダウンするには、呼び出し元スレッドが SE_SHUTDOWN_NAME
特権を持っている必要がある。リモートコンピュータをシャットダウンするには、呼び出し元スレッドがリモートコンピュータ上で
SE_REMOTE_SHUTDOWN_NAME 特権を持っている必要がある。既定では、ユーザーはログオンしているコンピュータ上で
SE_SHUTDOWN_NAME 特権を有効にでき、管理者はリモートコンピュータ上で SE_REMOTE_SHUTDOWN_NAME
特権を有効にできる。詳細については「Running with Special
Privileges」を参照。失敗の一般的な原因には、無効またはアクセスできないコンピュータ名、不十分な特権などがある。指定したコンピュータで既にシャットダウンが進行中の場合、ERROR_SHUTDOWN_IN_PROGRESS
エラーが返される。高速ユーザー切り替えが有効だがログオンしているユーザーがいない場合、ERROR_NOT_READY
エラーが返されることがある。0
以外の戻り値は、シャットダウン要求の検証が成功し、システムが受け入れたことを示すだけで、ログオフの成功を意味するものではない。この関数を呼び出すとき、呼び出し元は未保存の変更があるアプリケーションを強制的に閉じるかどうかを指定する必要がある。強制しないことを選択し、未保存の変更があるアプリケーションがコンソールセッションで実行されている場合、コンソールセッションにログオンしているユーザーがシャットダウンを中止するか、変更を保存してアプリケーションを閉じるか、強制的にアプリケーションを閉じるまで、シャットダウンは進行中のままとなる。この期間中、シャットダウンはコンソールユーザー以外では中止できず、別のシャットダウンを開始することもできない。bForceAppsClosed
パラメータに TRUE
を指定してこの関数を呼び出すことで、この状況を回避できる。ただし、データ損失につながる可能性があることに注意すること。Windows
Server 2003 および Windows XP: コンピュータがロックされ、bForceAppsClosed パラメータが
FALSE の場合、最後のエラーコードは ERROR_MACHINE_LOCKED
となる。システムが要求を処理する準備ができていない場合、最後のエラーコードは ERROR_NOT_READY
となる。アプリケーションは少し待って呼び出しを再試行すること。


%index
InitiateSystemShutdownExW
指定したコンピュータのシャットダウンと任意の再起動を開始し、任意でシャットダウンの理由を記録する。(Unicode)
%group
Win32 advapi32
%prm
lpMachineName, lpMessage, dwTimeout, bForceAppsClosed, bRebootAfterShutdown, dwReason
lpMachineName : [wstr] シャットダウンするコンピュータのネットワーク名。lpMachineName が NULL または空文字列の場合、関数はローカルコンピュータをシャットダウンする。
lpMessage : [wstr] シャットダウンダイアログボックスに表示するメッセージ。メッセージが不要な場合、このパラメータは NULL でよい。
dwTimeout : [int] シャットダウンダイアログボックスを表示する時間 (秒単位)。このダイアログボックスが表示されている間、シャットダウンは AbortSystemShutdown 関数で停止できる。
bForceAppsClosed : [int] このパラメータが TRUE の場合、未保存の変更があるアプリケーションを強制的に閉じる。このパラメータが FALSE の場合、システムはユーザーにアプリケーションを閉じるよう指示するダイアログボックスを表示する。
bRebootAfterShutdown : [int] このパラメータが TRUE の場合、シャットダウン後にコンピュータを即座に再起動する。このパラメータが FALSE の場合、システムはすべてのキャッシュをディスクにフラッシュし、システムを安全にシャットダウンする。
dwReason : [int] シャットダウンを開始する理由。このパラメータはシステムシャットダウン理由コードの 1 つでなければならない。
%inst
指定したコンピュータのシャットダウンと任意の再起動を開始し、任意でシャットダウンの理由を記録する。(Unicode)

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 である。拡張エラー情報を取得するには
GetLastError を呼び出す。

[備考]
ローカルコンピュータをシャットダウンするには、呼び出し元スレッドが SE_SHUTDOWN_NAME
特権を持っている必要がある。リモートコンピュータをシャットダウンするには、呼び出し元スレッドがリモートコンピュータ上で
SE_REMOTE_SHUTDOWN_NAME 特権を持っている必要がある。既定では、ユーザーはログオンしているコンピュータ上で
SE_SHUTDOWN_NAME 特権を有効にでき、管理者はリモートコンピュータ上で SE_REMOTE_SHUTDOWN_NAME
特権を有効にできる。詳細については「Running with Special
Privileges」を参照。失敗の一般的な原因には、無効またはアクセスできないコンピュータ名、不十分な特権などがある。指定したコンピュータで既にシャットダウンが進行中の場合、ERROR_SHUTDOWN_IN_PROGRESS
エラーが返される。高速ユーザー切り替えが有効だがログオンしているユーザーがいない場合、ERROR_NOT_READY
エラーが返されることがある。0
以外の戻り値は、シャットダウン要求の検証が成功し、システムが受け入れたことを示すだけで、ログオフの成功を意味するものではない。この関数を呼び出すとき、呼び出し元は未保存の変更があるアプリケーションを強制的に閉じるかどうかを指定する必要がある。強制しないことを選択し、未保存の変更があるアプリケーションがコンソールセッションで実行されている場合、コンソールセッションにログオンしているユーザーがシャットダウンを中止するか、変更を保存してアプリケーションを閉じるか、強制的にアプリケーションを閉じるまで、シャットダウンは進行中のままとなる。この期間中、シャットダウンはコンソールユーザー以外では中止できず、別のシャットダウンを開始することもできない。bForceAppsClosed
パラメータに TRUE
を指定してこの関数を呼び出すことで、この状況を回避できる。ただし、データ損失につながる可能性があることに注意すること。Windows
Server 2003 および Windows XP: コンピュータがロックされ、bForceAppsClosed パラメータが
FALSE の場合、最後のエラーコードは ERROR_MACHINE_LOCKED
となる。システムが要求を処理する準備ができていない場合、最後のエラーコードは ERROR_NOT_READY
となる。アプリケーションは少し待って呼び出しを再試行すること。
> [!NOTE] > winreg.h ヘッダーは InitiateSystemShutdownEx
をエイリアスとして定義し、UNICODE プリプロセッサ定数の定義に基づいて、この関数の ANSI 版または Unicode
版を自動的に選択する。詳細は [Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
InstallApplication
InstallApplication 関数は、ドメインに所属する対象ユーザーに配置されたアプリケーションをインストールできる。
%group
Win32 advapi32
%prm
pInstallInfo
pInstallInfo : [var] インストールするアプリケーションを指定する INSTALLDATA 構造体へのポインタ。
%inst
InstallApplication 関数は、ドメインに所属する対象ユーザーに配置されたアプリケーションをインストールできる。

[戻り値]
関数が成功した場合、戻り値は ERROR_SUCCESS である。それ以外の場合、関数はシステムエラーコードの 1
つを返す。エラーコードの完全なリストについては、System Error Codes または WinError.h
ヘッダーファイルを参照。

[備考]
InstallApplication
関数は、グループポリシーを使用して配置されたアプリケーションのみをインストールできる。ドメイン管理者は、グループポリシーオブジェクト
(GPO) のユーザー構成セクションを使用して、対象ユーザーにアプリケーションを配置できる。対象ユーザーは対象ドメインに所属し、GPO
が対象ドメイン内のこのユーザーに適用される必要がある。InstallApplication
関数は、標準のグループポリシー継承規則に従ってアプリケーションをインストールする。同じアプリケーションが複数の GPO
で配置されている場合、関数は最高優先度の GPO
で配置されたバージョンをインストールする。ユーザー用にアプリケーションがインストールされた後は、コンピュータ上の他のユーザーには表示されない。これはユーザーグループポリシーで配置されたアプリケーションの標準動作である。InstallApplication
関数は、Windows Installer (.msi ファイル) またはソフトウェアインストール設定 (.zap ファイル)
を使用してセットアップとインストールを処理する配置済みアプリケーションをインストールできる。
（以下省略）


%index
IsTextUnicode
バッファが Unicode テキストの形式を含んでいる可能性があるかを判定する。
%group
Win32 advapi32
%prm
lpv, iSize, lpiResult
lpv : [intptr] 調査する入力バッファへのポインタ。
iSize : [int] lpv が指す入力バッファのサイズをバイト単位で指定する。
lpiResult : [var] 入力時、入力バッファのテキストに適用するテストへのポインタ。出力時、このパラメータには指定されたテストの結果が格納される。バッファの内容がテストに合格した場合は 1、失敗した場合は 0 となる。関数への入力時に設定されたフラグのみが出力時に意味を持つ。lpiResult が NULL の場合、関数はバッファ内のデータが Unicode テキストである可能性を判定するために利用可能なすべてのテストを使用する。
%inst
バッファが Unicode テキストの形式を含んでいる可能性があるかを判定する。

[戻り値]
バッファ内のデータが指定されたテストに合格した場合、0 以外の値を返す。バッファ内のデータが指定されたテストに合格しなかった場合、0
を返す。

[備考]
この関数は lpiResult
パラメータで渡されるフラグの制御下で、様々な統計的・決定論的手法を使用して判定を行う。関数が戻るとき、これらのテスト結果は同じパラメータを使用して報告される。IS_TEXT_UNICODE_STATISTICS
および IS_TEXT_UNICODE_REVERSE_STATISTICS
テストは統計分析を使用する。これらのテストは完全ではない。統計テストは文字列の下位バイトと上位バイトの間にある程度の変動を想定しており、一部の
ASCII 文字列はすり抜けることがある。例えば、lpv が ASCII 文字列 0x41, 0x0A, 0x0D, 0x1D
(A\n\r^Z) を示す場合、この文字列は IS_TEXT_UNICODE_STATISTICS
テストに合格してしまうが、失敗する方が望ましい。


%index
IsTokenRestricted
トークンが制限付きセキュリティ識別子 (SID) のリストを含んでいるかどうかを示す。
%group
Win32 advapi32
%prm
TokenHandle
TokenHandle : [intptr] テスト対象のアクセストークンへのハンドル。
%inst
トークンが制限付きセキュリティ識別子 (SID) のリストを含んでいるかどうかを示す。

[戻り値]
トークンが制限 SID のリストを含む場合、戻り値は 0 以外である。トークンが制限 SID のリストを含まない場合、戻り値は 0
である。エラーが発生した場合、戻り値は 0 である。拡張エラー情報を取得するには GetLastError を呼び出す。

[備考]
CreateRestrictedToken 関数は、SID の無効化、特権の削除、制限 SID
のリスト指定によってトークンを制限できる。IsTokenRestricted 関数は制限 SID のリストのみを確認する。トークンに制限
SID がない場合、IsTokenRestricted は、たとえトークンが CreateRestrictedToken
の呼び出しで作成されていたとしても FALSE を返す。


%index
IsTokenUntrusted
(no summary)
%group
Win32 advapi32
%prm
TokenHandle
TokenHandle : [intptr] 
%inst



%index
IsValidAcl
アクセス制御リスト (ACL) を検証する。
%group
Win32 advapi32
%prm
pAcl
pAcl : [var] この関数で検証する ACL 構造体へのポインタ。この値は NULL であってはならない。
%inst
アクセス制御リスト (ACL) を検証する。

[戻り値]
ACL が有効な場合、関数は 0 以外を返す。
ACL が有効でない場合、関数は 0 を返す。この関数には拡張エラー情報はない。GetLastError を呼び出してはならない。

[備考]
この関数は ACL のリビジョンレベルを確認し、ACL 構造体の AceCount メンバで指定された ACE 数が AclSize
メンバで指定された領域に収まることを検証する。pAcl が NULL の場合、アプリケーションはアクセス違反で失敗する。


%index
IsValidSecurityDescriptor
セキュリティ記述子の構成要素が有効かどうかを判定する。
%group
Win32 advapi32
%prm
pSecurityDescriptor
pSecurityDescriptor : [int] 関数が検証する SECURITY_DESCRIPTOR 構造体へのポインタ。
%inst
セキュリティ記述子の構成要素が有効かどうかを判定する。

[戻り値]
セキュリティ記述子の構成要素が有効な場合、戻り値は 0 以外である。セキュリティ記述子の構成要素のいずれかが有効でない場合、戻り値は 0
である。この関数には拡張エラー情報はない。GetLastError を呼び出してはならない。

[備考]
IsValidSecurityDescriptor
関数はセキュリティ記述子に存在する構成要素の妥当性を確認する。特定の構成要素の有無や、個々の ACE または ACL の内容は検証しない。


%index
IsValidSid
セキュリティ識別子 (SID) を、リビジョン番号が既知の範囲内にあり、サブオーソリティ数が最大値未満であることを確認して検証する。
%group
Win32 advapi32
%prm
pSid
pSid : [int] 検証する SID 構造体へのポインタ。このパラメータは NULL にできない。
%inst
セキュリティ識別子 (SID) を、リビジョン番号が既知の範囲内にあり、サブオーソリティ数が最大値未満であることを確認して検証する。

[戻り値]
SID 構造体が有効な場合、戻り値は 0 以外である。SID 構造体が有効でない場合、戻り値は 0
である。この関数には拡張エラー情報はない。GetLastError を呼び出してはならない。

[備考]
pSid が NULL の場合、アプリケーションはアクセス違反で失敗する。


%index
IsWellKnownSid
SID を既知の SID と比較し、一致する場合は TRUE を返す。
%group
Win32 advapi32
%prm
pSid, WellKnownSidType
pSid : [int] テスト対象の SID へのポインタ。
WellKnownSidType : [int] pSid の SID と比較する WELL_KNOWN_SID_TYPE 列挙型のメンバ。
%inst
SID を既知の SID と比較し、一致する場合は TRUE を返す。

[戻り値]
pSid の SID が WellKnownSidType で示される既知の SID と一致する場合、TRUE を返す。それ以外の場合は
FALSE を返す。


%index
LockServiceDatabase
サービスコントロールマネージャ (SCM) データベースロックの所有権を要求する。任意の時点でロックを所有できるのは 1 つのプロセスだけである。
%group
Win32 advapi32
%prm
hSCManager
hSCManager : [intptr] SCM データベースへのハンドル。このハンドルは OpenSCManager 関数によって返され、SC_MANAGER_LOCK アクセス権を持つ必要がある。詳細については「Service Security and Access Rights」を参照。
%inst
サービスコントロールマネージャ (SCM) データベースロックの所有権を要求する。任意の時点でロックを所有できるのは 1
つのプロセスだけである。

[戻り値]
関数が成功した場合、戻り値は指定された SCM データベースへのロックである。関数が失敗した場合、戻り値は NULL
である。拡張エラー情報を取得するには GetLastError を呼び出す。以下のエラーコードが SCM によって設定されることがある。
（以下省略）

[備考]
ロックはセットアップおよび構成プログラムと SCM
が、レジストリ内のサービスツリーへのアクセスを直列化するために使用するプロトコルである。SCM
がロックの所有権を要求するのはサービスを開始するときだけである。SCM データベースロックを取得してそれを解放しないプログラムは、SCM
が他のサービスを開始することを妨げる。この問題の重大性のため、プロセスはもはやデータベースをロックすることが許されていない。古いアプリケーションとの互換性のため、LockServiceDatabase
関数はロックを返すが、それ以外の効果はない。
（以下省略）


%index
LogonUserW
Win32 LogonUser 関数は、ユーザーをローカルコンピュータにログオンしようとする。LogonUser はユーザーを偽装するために使用できるユーザートークンへのハンドルを返す。(Unicode)
%group
Win32 advapi32
%prm
lpszUsername, lpszDomain, lpszPassword, dwLogonType, dwLogonProvider, phToken
lpszUsername : [wstr] ユーザーの名前を指定する null 終端文字列へのポインタ。これはログオン先のユーザーアカウントの名前である。ユーザープリンシパル名 (UPN) 形式 (User@DNSDomainName) を使用する場合、lpszDomain パラメータは NULL でなければならない。
lpszDomain : [wstr] lpszUsername アカウントが含まれるアカウントデータベースを持つドメインまたはサーバーの名前を指定する null 終端文字列へのポインタ。このパラメータが NULL の場合、ユーザー名は UPN 形式で指定する必要がある。このパラメータが "." の場合、関数はローカルアカウントデータベースのみを使用してアカウントを検証する。
lpszPassword : [wstr] lpszUsername で指定されたユーザーアカウントの平文パスワードを指定する null 終端文字列へのポインタ。パスワードの使用が終わったら、SecureZeroMemory 関数を呼び出してメモリからパスワードをクリアする。パスワード保護の詳細については「Handling Passwords」を参照。
dwLogonType : [int] 
dwLogonProvider : [int] 
phToken : [intptr] 指定したユーザーを表すトークンへのハンドルを受け取るハンドル変数へのポインタ。返されたハンドルは ImpersonateLoggedOnUser 関数の呼び出しで使用できる。ほとんどの場合、返されるハンドルは CreateProcessAsUser 関数の呼び出しで使用できるプライマリトークンである。ただし、LOGON32_LOGON_NETWORK フラグを指定した場合、LogonUser は偽装トークンを返す。これは DuplicateTokenEx を呼び出してプライマリトークンに変換しない限り、CreateProcessAsUser では使用できない。このハンドルが不要になったら、CloseHandle 関数を呼び出して閉じる。
%inst
Win32 LogonUser 関数は、ユーザーをローカルコンピュータにログオンしようとする。LogonUser
はユーザーを偽装するために使用できるユーザートークンへのハンドルを返す。(Unicode)

[戻り値]
関数が成功した場合、0 以外を返す。関数が失敗した場合、0 を返す。拡張エラー情報を取得するには GetLastError を呼び出す。

[備考]
LOGON32_LOGON_NETWORK ログオンタイプは最速だが、以下の制限がある。
（以下省略）


%index
LogonUserExW
LogonUserEx 関数は、ユーザーをローカルコンピュータにログオンしようとする。(Unicode)
%group
Win32 advapi32
%prm
lpszUsername, lpszDomain, lpszPassword, dwLogonType, dwLogonProvider, phToken, ppLogonSid, ppProfileBuffer, pdwProfileLength, pQuotaLimits
lpszUsername : [wstr] ユーザーの名前を指定する null 終端文字列へのポインタ。これはログオン先のユーザーアカウントの名前である。ユーザープリンシパル名 (UPN) 形式 (user@DNS_domain_name) を使用する場合、lpszDomain パラメータは NULL でなければならない。
lpszDomain : [wstr] lpszUsername アカウントが含まれるアカウントデータベースを持つドメインまたはサーバーの名前を指定する null 終端文字列へのポインタ。このパラメータが NULL の場合、ユーザー名は UPN 形式で指定する必要がある。このパラメータが "." の場合、関数はローカルアカウントデータベースのみを使用してアカウントを検証する。
lpszPassword : [wstr] lpszUsername で指定されたユーザーアカウントの平文パスワードを指定する null 終端文字列へのポインタ。パスワードの使用が終わったら、SecureZeroMemory 関数を呼び出してメモリからパスワードをクリアする。パスワード保護の詳細については「Handling Passwords」を参照。
dwLogonType : [int] 
dwLogonProvider : [int] 
phToken : [intptr] 指定したユーザーを表すトークンへのハンドルを受け取るハンドル変数へのポインタ。返されたハンドルは ImpersonateLoggedOnUser 関数の呼び出しで使用できる。ほとんどの場合、返されるハンドルは CreateProcessAsUser 関数の呼び出しで使用できるプライマリトークンである。ただし、LOGON32_LOGON_NETWORK フラグを指定した場合、LogonUserEx は偽装トークンを返す。これは DuplicateTokenEx を呼び出して偽装トークンをプライマリトークンに変換しない限り、CreateProcessAsUser では使用できない。このハンドルが不要になったら、CloseHandle 関数を呼び出して閉じる。
ppLogonSid : [var] ログオンしたユーザーの SID を受け取るセキュリティ識別子 (SID) へのポインタへのポインタ。SID の使用が終わったら、LocalFree 関数を呼び出して解放する。
ppProfileBuffer : [var] ログオンしたユーザーのプロファイルを含むバッファのアドレスを受け取るポインタへのポインタ。
pdwProfileLength : [var] プロファイルバッファの長さを受け取る DWORD へのポインタ。
pQuotaLimits : [var] ログオンしたユーザーのクォータに関する情報を受け取る QUOTA_LIMITS 構造体へのポインタ。
%inst
LogonUserEx 関数は、ユーザーをローカルコンピュータにログオンしようとする。(Unicode)

[戻り値]
関数が成功した場合、関数は 0 以外を返す。関数が失敗した場合、0 を返す。拡張エラー情報を取得するには GetLastError
を呼び出す。

[備考]
LOGON32_LOGON_NETWORK ログオンタイプは最速だが、以下の制限がある。
（以下省略）


%index
LookupAccountNameW
システム名とアカウントを入力として受け取る。アカウントのセキュリティ識別子 (SID) と、アカウントが見つかったドメインの名前を取得する。(Unicode)
%group
Win32 advapi32
%prm
lpSystemName, lpAccountName, Sid, cbSid, ReferencedDomainName, cchReferencedDomainName, peUse
lpSystemName : [wstr] システムの名前を指定する null 終端文字列へのポインタ。この文字列はリモートコンピュータの名前でもよい。この文字列が NULL の場合、アカウント名の変換はローカルシステムで開始される。ローカルシステムで名前を解決できない場合、この関数はローカルシステムが信頼するドメインコントローラを使用して名前を解決しようとする。一般に、lpSystemName の値は、アカウントが信頼されていないドメインに存在し、そのドメイン内のコンピュータ名が既知である場合にのみ指定する。
lpAccountName : [wstr] アカウント名を指定する null 終端文字列へのポインタ。LookupAccountName が目的のドメインでアカウントを確実に検索できるよう、domain_name\user_name 形式の完全修飾文字列を使用する。
Sid : [int] lpAccountName パラメータで指定されたアカウント名に対応する SID 構造体を受け取るバッファへのポインタ。このパラメータが NULL の場合、cbSid は 0 でなければならない。
cbSid : [var] 変数へのポインタ。入力時、この値は Sid バッファのサイズをバイト単位で指定する。バッファが小さすぎて関数が失敗した場合、または cbSid が 0 の場合、この変数は必要なバッファサイズを受け取る。
ReferencedDomainName : [wstr] アカウント名が見つかったドメインの名前を受け取るバッファへのポインタ。ドメインに参加していないコンピュータの場合、このバッファはコンピュータ名を受け取る。このパラメータが NULL の場合、関数は必要なバッファサイズを返す。
cchReferencedDomainName : [var] 変数へのポインタ。入力時、この値は ReferencedDomainName バッファのサイズを TCHAR 単位で指定する。バッファが小さすぎて関数が失敗した場合、この変数は終端 null 文字を含む必要なバッファサイズを受け取る。ReferencedDomainName パラメータが NULL の場合、このパラメータは 0 でなければならない。
peUse : [var] 関数が戻るときにアカウントの種類を示す SID_NAME_USE 列挙型へのポインタ。
%inst
システム名とアカウントを入力として受け取る。アカウントのセキュリティ識別子 (SID)
と、アカウントが見つかったドメインの名前を取得する。(Unicode)

[戻り値]
関数が成功した場合、関数は 0 以外を返す。関数が失敗した場合、0 を返す。拡張エラー情報を取得するには GetLastError
を呼び出す。

[備考]
LookupAccountName 関数は、まず既知の SID のリストを確認することによって、指定された名前の SID
を見つけようとする。名前が既知の SID
に対応しない場合、関数は組み込みおよび管理上定義されたローカルアカウントを確認する。次に、関数はプライマリドメインを確認する。名前がそこで見つからない場合、信頼されたドメインが確認される。完全修飾アカウント名
(例: domain_name\user_name) を孤立した名前 (例: user_name)
の代わりに使用すること。完全修飾名はあいまいでなく、ルックアップを実行する際のパフォーマンスも優れている。
> [!NOTE] > winbase.h ヘッダーは LookupAccountName をエイリアスとして定義し、UNICODE
プリプロセッサ定数の定義に基づいて、この関数の ANSI 版または Unicode 版を自動的に選択する。詳細は [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
LookupAccountSidW
セキュリティ識別子 (SID) を入力として受け取る。この SID のアカウント名と、この SID が見つかった最初のドメインの名前を取得する。(Unicode)
%group
Win32 advapi32
%prm
lpSystemName, Sid, Name, cchName, ReferencedDomainName, cchReferencedDomainName, peUse
lpSystemName : [wstr] 対象コンピュータを指定する null 終端文字列へのポインタ。この文字列はリモートコンピュータの名前でもよい。このパラメータが NULL の場合、アカウント名の変換はローカルシステムで開始される。ローカルシステムで名前を解決できない場合、この関数はローカルシステムが信頼するドメインコントローラを使用して名前を解決しようとする。
Sid : [int] ルックアップする SID へのポインタ。
Name : [wstr] lpSid パラメータに対応するアカウント名を含む null 終端文字列を受け取るバッファへのポインタ。
cchName : [var] 入力時、lpName バッファのサイズを TCHAR 単位で指定する。バッファが小さすぎて関数が失敗した場合、または cchName が 0 の場合、cchName は終端 null 文字を含む必要なバッファサイズを受け取る。
ReferencedDomainName : [wstr] アカウント名が見つかったドメインの名前を含む null 終端文字列を受け取るバッファへのポインタ。サーバーでは、ローカルコンピュータのセキュリティデータベース内のほとんどのアカウントに対して返されるドメイン名は、そのサーバーがドメインコントローラとなっているドメインの名前である。
cchReferencedDomainName : [var] 入力時、lpReferencedDomainName バッファのサイズを TCHAR 単位で指定する。バッファが小さすぎて関数が失敗した場合、または cchReferencedDomainName が 0 の場合、cchReferencedDomainName は終端 null 文字を含む必要なバッファサイズを受け取る。
peUse : [var] アカウントの種類を示す SID_NAME_USE 値を受け取る変数へのポインタ。
%inst
セキュリティ識別子 (SID) を入力として受け取る。この SID のアカウント名と、この SID
が見つかった最初のドメインの名前を取得する。(Unicode)

[戻り値]
関数が成功した場合、関数は 0 以外を返す。関数が失敗した場合、0 を返す。拡張エラー情報を取得するには GetLastError
を呼び出す。

[備考]
LookupAccountSid 関数は、まず既知の SID のリストを確認することによって、指定された SID
の名前を見つけようとする。指定された SID が既知の SID
に対応しない場合、関数は組み込みおよび管理上定義されたローカルアカウントを確認する。次に、関数はプライマリドメインを確認する。プライマリドメインで認識されないセキュリティ識別子は、その
SID プレフィックスに対応する信頼されたドメインと照合される。関数が SID
のアカウント名を見つけられない場合、GetLastError は ERROR_NONE_MAPPED
を返す。これはネットワークタイムアウトが関数が名前を見つけることを妨げた場合に発生することがある。また、ログオンセッションを識別するログオン
SID のように対応するアカウント名がない SID
でも発生する。ローカルアカウント、ローカルドメインアカウント、明示的に信頼されたドメインアカウントの SID
の検索に加えて、LookupAccountSid はフォレスト内の任意のドメインの任意のアカウントの SID
を検索できる。これには、フォレスト内のアカウントの SIDhistory フィールドにのみ現れる SID も含まれる。SIDhistory
フィールドは、別のドメインから移動されたアカウントの以前の SID を保存する。SID
をルックアップするために、LookupAccountSid はフォレストのグローバルカタログをクエリする。


%index
LookupPrivilegeDisplayNameW
指定された特権を表す表示名を取得する。(Unicode)
%group
Win32 advapi32
%prm
lpSystemName, lpName, lpDisplayName, cchDisplayName, lpLanguageId
lpSystemName : [wstr] 特権名が取得されるシステムの名前を指定する null 終端文字列へのポインタ。null 文字列が指定された場合、関数はローカルシステムで表示名を見つけようとする。
lpName : [wstr] Winnt.h で定義されている特権名を指定する null 終端文字列へのポインタ。例えば、このパラメータは定数 SE_REMOTE_SHUTDOWN_NAME、またはそれに対応する文字列 "SeRemoteShutdownPrivilege" を指定できる。値のリストについては Privilege Constants を参照。
lpDisplayName : [wstr] 特権表示名を指定する null 終端文字列を受け取るバッファへのポインタ。例えば、lpName パラメータが SE_REMOTE_SHUTDOWN_NAME の場合、特権表示名は "Force shutdown from a remote system." となる。
cchDisplayName : [var] lpDisplayName バッファのサイズを TCHAR 単位で指定する変数へのポインタ。関数が戻るとき、このパラメータには終端 null 文字を含まない特権表示名の長さが格納される。lpDisplayName パラメータが指すバッファが小さすぎる場合、この変数には必要なサイズが格納される。
lpLanguageId : [var] 返された表示名の言語識別子を受け取る変数へのポインタ。
%inst
指定された特権を表す表示名を取得する。(Unicode)

[戻り値]
関数が成功した場合、戻り値は 0 以外である。
関数が失敗した場合、戻り値は 0 である。拡張エラー情報を取得するには GetLastError を呼び出す。

[備考]
LookupPrivilegeDisplayName 関数は、Winnt.h の Defined Privileges
セクションで指定された特権の表示名のみを取得する。
> [!NOTE] > winbase.h ヘッダーは LookupPrivilegeDisplayName
をエイリアスとして定義し、UNICODE プリプロセッサ定数の定義に基づいて、この関数の ANSI 版または Unicode
版を自動的に選択する。詳細は [Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
LookupPrivilegeNameW
指定されたローカル一意識別子 (LUID) によって特定のシステム上で表される特権に対応する名前を取得する。(Unicode)
%group
Win32 advapi32
%prm
lpSystemName, lpLuid, lpName, cchName
lpSystemName : [wstr] 特権名が取得されるシステムの名前を指定する null 終端文字列へのポインタ。null 文字列が指定された場合、関数はローカルシステムで特権名を見つけようとする。
lpLuid : [var] 対象システム上で特権が認識される LUID へのポインタ。
lpName : [wstr] 特権名を表す null 終端文字列を受け取るバッファへのポインタ。例えば、この文字列は "SeSecurityPrivilege" となる。
cchName : [var] lpName バッファのサイズを TCHAR 値単位で指定する変数へのポインタ。関数が戻るとき、このパラメータには終端 null 文字を含まない特権名の長さが格納される。lpName パラメータが指すバッファが小さすぎる場合、この変数には必要なサイズが格納される。
%inst
指定されたローカル一意識別子 (LUID) によって特定のシステム上で表される特権に対応する名前を取得する。(Unicode)

[戻り値]
関数が成功した場合、関数は 0 以外を返す。
関数が失敗した場合、0 を返す。拡張エラー情報を取得するには GetLastError を呼び出す。

[備考]
LookupPrivilegeName 関数は、Winnt.h の Defined Privileges
セクションで指定された特権のみをサポートする。値のリストについては Privilege Constants を参照。
> [!NOTE] > winbase.h ヘッダーは LookupPrivilegeName をエイリアスとして定義し、UNICODE
プリプロセッサ定数の定義に基づいて、この関数の ANSI 版または Unicode 版を自動的に選択する。詳細は [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
LookupPrivilegeValueW
指定されたシステム上で指定された特権名をローカルに表すために使用されるローカル一意識別子 (LUID) を取得する。(Unicode)
%group
Win32 advapi32
%prm
lpSystemName, lpName, lpLuid
lpSystemName : [wstr] 特権名が取得されるシステムの名前を指定する null 終端文字列へのポインタ。null 文字列が指定された場合、関数はローカルシステムで特権名を見つけようとする。
lpName : [wstr] Winnt.h ヘッダーファイルで定義されている特権名を指定する null 終端文字列へのポインタ。例えば、このパラメータは定数 SE_SECURITY_NAME またはそれに対応する文字列 "SeSecurityPrivilege" を指定できる。
lpLuid : [var] lpSystemName パラメータで指定されたシステムで特権が認識される LUID を受け取る変数へのポインタ。
%inst
指定されたシステム上で指定された特権名をローカルに表すために使用されるローカル一意識別子 (LUID) を取得する。(Unicode)

[戻り値]
関数が成功した場合、関数は 0 以外を返す。
関数が失敗した場合、0 を返す。拡張エラー情報を取得するには GetLastError を呼び出す。

[備考]
LookupPrivilegeValue 関数は、Winnt.h の Defined Privileges
セクションで指定された特権のみをサポートする。値のリストについては Privilege Constants を参照。


%index
LookupSecurityDescriptorPartsW
自己相対セキュリティ記述子からセキュリティ情報を取得する。(Unicode)
%group
Win32 advapi32
%prm
ppOwner, ppGroup, pcCountOfAccessEntries, ppListOfAccessEntries, pcCountOfAuditEntries, ppListOfAuditEntries, pSD
ppOwner : [var] TRUSTEE 構造体へのポインタを受け取る変数へのポインタ。関数は pSD セキュリティ記述子の所有者セキュリティ識別子 (SID) に関連付けられた名前を検索し、TRUSTEE 構造体の ptstrName メンバに名前へのポインタを返す。関数は TrusteeForm メンバを TRUSTEE_IS_NAME に設定する。
ppGroup : [var] TRUSTEE 構造体へのポインタを受け取る変数へのポインタ。関数はセキュリティ記述子のプライマリグループ SID に関連付けられた名前を検索し、TRUSTEE 構造体の ptstrName メンバに名前へのポインタを返す。関数は TrusteeForm メンバを TRUSTEE_IS_NAME に設定する。
pcCountOfAccessEntries : [var] pListOfAccessEntries 配列で返される EXPLICIT_ACCESS 構造体の数を受け取る ULONG へのポインタ。このパラメータは pListOfAccessEntries パラメータも NULL の場合にのみ NULL にできる。
ppListOfAccessEntries : [var] セキュリティ記述子の随意アクセス制御リスト (DACL) 内のアクセス制御エントリ (ACE) を記述する EXPLICIT_ACCESS 構造体の配列へのポインタを受け取る変数へのポインタ。これらの EXPLICIT_ACCESS 構造体内の TRUSTEE 構造体は TRUSTEE_IS_NAME 形式を使用する。EXPLICIT_ACCESS 構造体の配列がアクセス制御リスト (ACL) 内の ACE をどのように記述するかについては、GetExplicitEntriesFromAcl 関数を参照。このパラメータが NULL の場合、cCountOfAccessEntries パラメータも NULL でなければならない。
pcCountOfAuditEntries : [var] pListOfAuditEntries 配列で返される EXPLICIT_ACCESS 構造体の数を受け取る ULONG へのポインタ。このパラメータは pListOfAuditEntries パラメータも NULL の場合にのみ NULL にできる。
ppListOfAuditEntries : [var] セキュリティ記述子のシステムアクセス制御リスト (SACL) 内の ACE を記述する EXPLICIT_ACCESS 構造体の配列へのポインタを受け取る変数へのポインタ。これらの EXPLICIT_ACCESS 構造体内の TRUSTEE 構造体は TRUSTEE_IS_NAME 形式を使用する。このパラメータが NULL の場合、cCountOfAuditEntries パラメータも NULL でなければならない。
pSD : [int] 関数がセキュリティ情報を取得する既存の自己相対セキュリティ記述子へのポインタ。
%inst
自己相対セキュリティ記述子からセキュリティ情報を取得する。(Unicode)

[戻り値]
関数が成功した場合、関数は ERROR_SUCCESS を返す。関数が失敗した場合、WinError.h で定義されている 0
以外のエラーコードを返す。

[備考]
LookupSecurityDescriptorParts
関数はセキュリティ記述子の所有者とプライマリグループの名前を取得する。この関数はまた、セキュリティ記述子の DACL 内の ACE と
SACL 内の監査制御エントリの記述も返す。pSD 以外のパラメータは、情報が不要な場合 NULL でよい。DACL
に関する情報が不要な場合、pListOfAccessEntries と cCountOfAuditEntries の両方を NULL
にする必要がある。SACL に関する情報が不要な場合、pListOfAuditEntries と cCountOfAuditEntries
の両方を NULL にする必要がある。同様に、DACL または SACL の情報が必要な場合、対応する両方のパラメータが NULL
であってはならない。pOwner、pGroup、pListOfAccessEntries、または pListOfAuditEntries
パラメータによって返されたバッファの使用が終わったら、LocalFree 関数を呼び出して解放する。
> [!NOTE] > aclapi.h ヘッダーは LookupSecurityDescriptorParts
をエイリアスとして定義し、UNICODE プリプロセッサ定数の定義に基づいて、この関数の ANSI 版または Unicode
版を自動的に選択する。詳細は [Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
LsaClose
LsaClose 関数は、Policy または TrustedDomain オブジェクトへのハンドルを閉じる。
%group
Win32 advapi32
%prm
ObjectHandle
ObjectHandle : [intptr] LsaOpenPolicy 関数によって返された Policy オブジェクトへのハンドル、または LsaOpenTrustedDomainByName 関数によって返された TrustedDomain オブジェクトへのハンドル。この呼び出しの完了後、ハンドルは無効になる。
%inst
LsaClose 関数は、Policy または TrustedDomain オブジェクトへのハンドルを閉じる。

[戻り値]
関数が成功した場合、戻り値は STATUS_SUCCESS である。関数が失敗した場合、戻り値は NTSTATUS
コードである。詳細は「LSA Policy Function Return
Values」を参照。LsaNtStatusToWinError 関数を使用して NTSTATUS コードを Windows
エラーコードに変換できる。


%index
LsaAddAccountRights
アカウントに 1 つ以上の特権を割り当てる。
%group
Win32 advapi32
%prm
PolicyHandle, AccountSid, UserRights, CountOfRights
PolicyHandle : [intptr] Policy オブジェクトへのハンドル。ハンドルは POLICY_LOOKUP_NAMES アクセス権を持つ必要がある。AccountSid パラメータで指定されたアカウントが存在しない場合、ハンドルは POLICY_CREATE_ACCOUNT アクセス権も持つ必要がある。詳細は「Opening a Policy Object Handle」を参照。
AccountSid : [int] 特権を割り当てるアカウントの SID へのポインタ。
UserRights : [var] LSA_UNICODE_STRING 構造体の配列へのポインタ。各構造体にはアカウントに追加する特権の名前が含まれる。特権名のリストについては Privilege Constants を参照。
CountOfRights : [int] UserRights 配列の要素数を指定する。
%inst
アカウントに 1 つ以上の特権を割り当てる。

[戻り値]
関数が成功した場合、戻り値は STATUS_SUCCESS である。関数が失敗した場合、戻り値は NTSTATUS
コードであり、以下の値または LSA Policy Function Return Values のいずれかとなる。
（以下省略）

[備考]
既にアカウントに付与されている特権を指定した場合、無視される。この関数の呼び出しを実演する例については「Managing Account
Permissions」を参照。


%index
LsaCreateTrustedDomainEx
LsaCreateTrustedDomainEx 関数は、新しい TrustedDomain オブジェクトを作成して新しい信頼されたドメインを確立する。
%group
Win32 advapi32
%prm
PolicyHandle, TrustedDomainInformation, AuthenticationInformation, DesiredAccess, TrustedDomainHandle
PolicyHandle : [intptr] Policy オブジェクトへのハンドル。オブジェクトを作成するには、呼び出し元が System コンテナに子を作成する権限を持つ必要がある。ポリシーオブジェクトハンドルの情報については「Opening a Policy Object Handle」を参照。
TrustedDomainInformation : [var] 新しい信頼されたドメインの名前と SID を含む TRUSTED_DOMAIN_INFORMATION_EX 構造体へのポインタ。
AuthenticationInformation : [var] 新しい信頼されたドメインの認証情報を含む TRUSTED_DOMAIN_AUTH_INFORMATION 構造体へのポインタ。
DesiredAccess : [int] 新しい信頼されたドメインに付与するアクセスを指定する ACCESS_MASK 構造体。
TrustedDomainHandle : [intptr] リモート信頼ドメインの LSA ポリシーハンドルを受け取る。このハンドルを LSA 関数呼び出しに渡して、信頼ドメインの LSA ポリシーを管理できる。
%inst
LsaCreateTrustedDomainEx 関数は、新しい TrustedDomain
オブジェクトを作成して新しい信頼されたドメインを確立する。

[戻り値]
関数が成功した場合、関数は STATUS_SUCCESS を返す。関数が失敗した場合、NTSTATUS コードを返す。以下の値または
LSA Policy Function Return Values のいずれかとなる。
（以下省略）

[備考]
LsaCreateTrustedDomainEx は、指定されたドメイン名が指定された SID と一致するかどうか、または SID
と名前が実際のドメインを表すかどうかを確認しない。


%index
LsaDeleteTrustedDomain
LsaDeleteTrustedDomain 関数は、システムの信頼されたドメインのリストから信頼されたドメインを削除し、関連する TrustedDomain オブジェクトを削除する。
%group
Win32 advapi32
%prm
PolicyHandle, TrustedDomainSid
PolicyHandle : [intptr] Policy オブジェクトへのハンドル。詳細は「Opening a Policy Object Handle」を参照。
TrustedDomainSid : [int] 削除する信頼されたドメインの SID へのポインタ。
%inst
LsaDeleteTrustedDomain 関数は、システムの信頼されたドメインのリストから信頼されたドメインを削除し、関連する
TrustedDomain オブジェクトを削除する。

[戻り値]
関数が成功した場合、戻り値は STATUS_SUCCESS である。関数が失敗した場合、戻り値は NTSTATUS
コードである。詳細は「LSA Policy Function Return
Values」を参照。LsaNtStatusToWinError 関数を使用して NTSTATUS コードを Windows
エラーコードに変換できる。


%index
LsaEnumerateAccountRights
LsaEnumerateAccountRights 関数は、アカウントに割り当てられた特権を列挙する。
%group
Win32 advapi32
%prm
PolicyHandle, AccountSid, UserRights, CountOfRights
PolicyHandle : [intptr] Policy オブジェクトへのハンドル。ハンドルは POLICY_LOOKUP_NAMES アクセス権を持つ必要がある。詳細は「Opening a Policy Object Handle」を参照。
AccountSid : [int] 特権を列挙するアカウントの SID へのポインタ。
UserRights : [var] LSA_UNICODE_STRING 構造体の配列へのポインタを受け取る。各構造体にはアカウントが保持する特権の名前が含まれる。特権名のリストについては Privilege Constants を参照。情報が不要になったら、返されたポインタを LsaFreeMemory に渡す。
CountOfRights : [var] UserRights 配列内の特権数を受け取る変数へのポインタ。
%inst
LsaEnumerateAccountRights 関数は、アカウントに割り当てられた特権を列挙する。

[戻り値]
少なくとも 1 つのアカウント権が見つかった場合、関数は成功して STATUS_SUCCESS
を返す。アカウント権が見つからない場合や他の理由で関数が失敗した場合、関数は FILE_NOT_FOUND などの NTSTATUS
コードを返す。詳細は「LSA Policy Function Return
Values」を参照。LsaNtStatusToWinError 関数を使用して NTSTATUS コードを Windows
エラーコードに変換する。


%index
LsaEnumerateAccountsWithUserRight
指定された特権を保持するローカルセキュリティ機関 (LSA) Policy オブジェクトのデータベース内のアカウントを返す。
%group
Win32 advapi32
%prm
PolicyHandle, UserRight, Buffer, CountReturned
PolicyHandle : [intptr] Policy オブジェクトへのハンドル。ハンドルは POLICY_LOOKUP_NAMES および POLICY_VIEW_LOCAL_INFORMATION ユーザー権を持つ必要がある。詳細は「Opening a Policy Object Handle」を参照。
UserRight : [var] 特権の名前を指定する LSA_UNICODE_STRING 構造体へのポインタ。特権のリストについては Privilege Constants および Account Rights Constants を参照。
Buffer : [var] LSA_ENUMERATION_INFORMATION 構造体の配列へのポインタを受け取る変数へのポインタ。各構造体の Sid メンバは、指定された特権を保持するアカウントのセキュリティ識別子 (SID) へのポインタである。
CountReturned : [var] EnumerationBuffer パラメータで返されたエントリ数を受け取る変数へのポインタ。
%inst
指定された特権を保持するローカルセキュリティ機関 (LSA) Policy オブジェクトのデータベース内のアカウントを返す。

[戻り値]
関数が成功した場合、関数は STATUS_SUCCESS を返す。関数が失敗した場合、NTSTATUS コードを返す。以下の値または
LSA Policy Function Return Values のいずれかとなる。
（以下省略）


%index
LsaEnumerateTrustedDomains
LsaEnumerateTrustedDomains 関数は、ログオン資格情報を認証するために信頼されたドメインの名前と SID を取得する。
%group
Win32 advapi32
%prm
PolicyHandle, EnumerationContext, Buffer, PreferedMaximumLength, CountReturned
PolicyHandle : [intptr] Policy オブジェクトへのハンドル。ハンドルは POLICY_VIEW_LOCAL_INFORMATION アクセス権を持つ必要がある。詳細は「Opening a Policy Object Handle」を参照。
EnumerationContext : [var] 列挙ハンドルへのポインタで、LsaEnumerateTrustedDomains を複数回呼び出してすべての信頼されたドメインを列挙できるようにする。LsaEnumerateTrustedDomains の最初の呼び出しでは、EnumerationContext はゼロに初期化された変数を指す必要がある。LsaEnumerateTrustedDomains の後続の呼び出しでは、EnumerationContext は前回の呼び出しによって返された列挙ハンドルを指す必要がある。
Buffer : [var] 1 つ以上の信頼されたドメインの名前と SID を含む LSA_TRUST_INFORMATION 構造体の配列へのポインタを受け取る。
PreferedMaximumLength : [int] 返されるバッファの推奨最大サイズをバイト単位で指定する。この情報は概算である。実際に返されるバイト数はこの値より大きくなることがある。
CountReturned : [var] Buffer パラメータで返された要素数を受け取る変数へのポインタ。
%inst
LsaEnumerateTrustedDomains 関数は、ログオン資格情報を認証するために信頼されたドメインの名前と SID
を取得する。

[戻り値]
関数が成功した場合、戻り値は以下の NTSTATUS 値のいずれかである。
（以下省略）

[備考]
Windows NT 4.0 以前のバージョンの Windows NT
のみのドメインコントローラを持つドメインでは、LsaEnumerateTrustedDomains
はすべての信頼されたドメインのリストを返す。Windows NT のリリース 4.0
までのリリースでは、すべての信頼されたドメインは直接信頼されていた。Windows XP および Windows 2000
の混在モードドメインでは、ドメインコントローラが Windows XP、Windows 2000、または Windows NT
を実行している場合がある。したがって、混在モードドメインでは、一部の信頼されたドメインは直接信頼され、他のドメインは間接的に信頼される。混在モードドメイン内のシステムの信頼されたドメインを列挙する場合、LsaEnumerateTrustedDomains
は直接信頼されたドメインのみを返す。対照的に、Windows XP および Windows 2000 のネイティブモードドメインには
Windows 2000 ドメインコントローラのみが含まれる (ただし、ドメイン内のメンバーには Windows NT 4.0
以前のバージョンを実行しているものもある)。ネイティブモードの Windows XP および Windows 2000
ドメイン内のシステムの信頼されたドメインを列挙する場合、LsaEnumerateTrustedDomains
は直接信頼されたドメインと間接的に信頼されたドメインの両方を返す。すべての信頼情報を取得するには、LsaEnumerateTrustedDomains
の呼び出しを複数回行う必要がある場合がある。
（以下省略）


%index
LsaEnumerateTrustedDomainsEx
ローカルシステムによって信頼されたドメインに関する情報を返す。
%group
Win32 advapi32
%prm
PolicyHandle, EnumerationContext, Buffer, PreferedMaximumLength, CountReturned
PolicyHandle : [intptr] Policy オブジェクトへのハンドル。この呼び出しには Policy オブジェクトへの POLICY_VIEW_LOCAL_INFORMATION アクセスが必要である。詳細は「Opening a Policy Object Handle」を参照。
EnumerationContext : [var] LsaEnumerateTrustedDomainsEx を複数回呼び出してすべての信頼ドメイン情報を取得するために使用できる LSA_ENUMERATION_HANDLE へのポインタ。詳細は「備考」を参照。
Buffer : [var] 列挙された信頼されたドメインに関する情報を含む TRUSTED_DOMAIN_INFORMATION_EX 構造体のリストを受け取るバッファへのポインタ。
PreferedMaximumLength : [int] 返されるデータの推奨最大長 (バイト単位)。これは厳密な上限ではなくガイドとして機能する。自然なデータサイズが異なるシステム間のデータ変換により、実際に返されるデータ量はこの値より大きくなることがある。
CountReturned : [var] 返された信頼ドメインオブジェクトの数を受け取る LONG へのポインタ。
%inst
ローカルシステムによって信頼されたドメインに関する情報を返す。

[戻り値]
関数が成功した場合、関数は STATUS_SUCCESS を返す。関数が失敗した場合、NTSTATUS コードを返す。以下の値または
LSA Policy Function Return Values のいずれかとなる。
（以下省略）

[備考]
すべての信頼情報を取得するには、LsaEnumerateTrustedDomainsEx
の呼び出しを複数回行う必要がある場合がある。EnumerationContext パラメータを使用して複数回の呼び出しを行う方法
（以下省略）


%index
LsaFreeMemory
LsaFreeMemory 関数は、LSA 関数呼び出しによって出力バッファに確保されたメモリを解放する。
%group
Win32 advapi32
%prm
Buffer
Buffer : [intptr] LSA 関数呼び出しで確保されたメモリバッファへのポインタ。LsaFreeMemory が成功した場合、このバッファは解放される。
%inst
LsaFreeMemory 関数は、LSA 関数呼び出しによって出力バッファに確保されたメモリを解放する。

[戻り値]
関数が成功した場合、戻り値は STATUS_SUCCESS である。関数が失敗した場合、戻り値は NTSTATUS
コードである。以下の値または LSA Policy Function Return Values のいずれかとなる。
（以下省略）


%index
LsaGetAppliedCAPIDs
特定のコンピュータに適用されているすべての CAP のセントラルアクセスポリシー (CAP) 識別子 (CAPID) の配列を返す。
%group
Win32 advapi32
%prm
SystemName, CAPIDs, CAPIDCount
SystemName : [var] 特定のコンピュータの名前を含む LSA_UNICODE_STRING 構造体へのポインタ。名前の形式は "ComputerName" または "\\ComputerName" でよい。このパラメータが NULL の場合、関数はローカルコンピュータの CAPID を返す。
CAPIDs : [var] 指定されたコンピュータ上で利用可能な CAP を識別する CAPID へのポインタの配列を受け取る変数へのポインタ。CAPID の使用が終わったら、配列の各要素と配列全体に対して LsaFreeMemory 関数を呼び出す。
CAPIDCount : [var] 指定されたコンピュータ上で利用可能な CAP の数を受け取る変数へのポインタ。CAPIDs パラメータで返される配列には、CAPIDCount パラメータと同じ数の要素が含まれる。
%inst
特定のコンピュータに適用されているすべての CAP のセントラルアクセスポリシー (CAP) 識別子 (CAPID) の配列を返す。

[戻り値]
関数が成功した場合、戻り値は STATUS_SUCCESS である。関数が失敗した場合、戻り値は LSA Policy Function
Return Values のいずれかである。LsaNtStatusToWinError 関数を使用して NTSTATUS コードを
Windows エラーコードに変換できる。

[備考]
セントラルアクセスポリシーに関する具体的な詳細については、指定されたコンピュータのドメインコントローラの Active Directory
でセントラルアクセスポリシーオブジェクトの属性をクエリできる。msAuthz-CentralAccessPolicyID 属性が返された
CAPID のいずれかと一致するオブジェクトを探す。


%index
LsaLookupNames
ユーザー、グループ、またはローカルグループ名の配列に対応するセキュリティ識別子 (SID) を取得する。
%group
Win32 advapi32
%prm
PolicyHandle, Count, Names, ReferencedDomains, Sids
PolicyHandle : [intptr] Policy オブジェクトへのハンドル。ハンドルは POLICY_LOOKUP_NAMES アクセス権を持つ必要がある。詳細は「Opening a Policy Object Handle」を参照。
Count : [int] Names 配列内の名前数を指定する。これは Sids 配列で返されるエントリ数でもある。この値は 1000 以下でなければならない。
Names : [var] ルックアップする名前を含む LSA_UNICODE_STRING 構造体の配列へのポインタ。これらの構造体内の文字列は、ユーザー、グループ、ローカルグループアカウントの名前、またはドメインの名前でよい。ドメイン名は DNS ドメイン名または NetBIOS ドメイン名でよい。
ReferencedDomains : [var] LSA_REFERENCED_DOMAIN_LIST 構造体へのポインタを受け取る。この構造体の Domains メンバは、名前が見つかった各ドメインのエントリを含む配列である。Sids 配列の各エントリの DomainIndex メンバは、名前が見つかったドメインの Domains 配列エントリのインデックスである。
Sids : [var] LSA_TRANSLATED_SID 構造体の配列へのポインタを受け取る。Sids 配列の各エントリには、Names 配列の対応するエントリの SID 情報が含まれる。
%inst
ユーザー、グループ、またはローカルグループ名の配列に対応するセキュリティ識別子 (SID) を取得する。

[戻り値]
関数が成功した場合、関数は以下の NTSTATUS 値のいずれかを返す。
（以下省略）

[備考]
> [!WARNING] > 孤立した名前 (例: user_name) の代わりに完全修飾アカウント名 (例:
domain_name\user_name)
を使用する。完全修飾名はあいまいでなく、ルックアップを実行する際のパフォーマンスも優れている。この関数は、完全修飾 DNS 名 (例:
example.example.com\user_name) およびユーザープリンシパル名 (UPN) (例:
someone@example.com) もサポートする。
（以下省略）


%index
LsaLookupNames2
指定されたアカウント名のセキュリティ識別子 (SID) を取得する。LsaLookupNames2 は、Windows フォレスト内の任意のドメインの任意のアカウントの SID を検索できる。
%group
Win32 advapi32
%prm
PolicyHandle, Flags, Count, Names, ReferencedDomains, Sids
PolicyHandle : [intptr] Policy オブジェクトへのハンドル。ハンドルは POLICY_LOOKUP_NAMES アクセス権を持つ必要がある。詳細は「Opening a Policy Object Handle」を参照。
Flags : [int] この関数の動作を制御する値。現在以下の値が定義されている。
Count : [int] Names 配列内の名前数を指定する。これは Sids 配列で返されるエントリ数でもある。
Names : [var] ルックアップする名前を含む LSA_UNICODE_STRING 構造体の配列へのポインタ。これらの文字列は、ユーザー、グループ、ローカルグループアカウントの名前、またはドメインの名前でよい。ドメイン名は DNS ドメイン名または NetBIOS ドメイン名でよい。
ReferencedDomains : [var] LSA_REFERENCED_DOMAIN_LIST 構造体へのポインタを受け取る。この構造体の Domains メンバは、名前が見つかった各ドメインのエントリを含む配列である。Sids 配列の各エントリの DomainIndex メンバは、名前が見つかったドメインの Domains 配列エントリのインデックスである。返されたポインタの使用が終わったら、LsaFreeMemory 関数を呼び出して解放する。このメモリは、関数がエラーコード STATUS_NONE_MAPPED または STATUS_SOME_NOT_MAPPED のいずれかで失敗した場合でも解放する必要がある。
Sids : [var] LSA_TRANSLATED_SID2 構造体の配列へのポインタを受け取る。Sids 配列の各エントリには、Names 配列の対応するエントリの SID 情報が含まれる。
%inst
指定されたアカウント名のセキュリティ識別子 (SID) を取得する。LsaLookupNames2 は、Windows
フォレスト内の任意のドメインの任意のアカウントの SID を検索できる。

[戻り値]
関数が成功した場合、関数は以下の NTSTATUS 値のいずれかを返す。
（以下省略）

[備考]
孤立した名前 (例: UserName) の代わりに完全修飾アカウント名 (例: DomainName\UserName)
を使用する。完全修飾名はあいまいでなく、ルックアップを実行する際のパフォーマンスも優れている。この関数は、完全修飾 DNS 名 (例:
Example.Example.com\UserName) およびユーザープリンシパル名 (UPN) (例:
Someone@Example.com)
もサポートする。孤立した名前の変換では、同じ名前が複数のドメインで使用される可能性があるため、名前の衝突の可能性がある。LsaLookupNames2
関数は、孤立した名前を変換するために以下のアルゴリズムを使用する。孤立した名前を変換するには
（以下省略）


%index
LsaLookupSids
セキュリティ識別子 (SID) の配列に対応する名前をルックアップする。LsaLookupSids が SID に対応する名前を見つけられない場合、関数は SID を文字形式で返す。
%group
Win32 advapi32
%prm
PolicyHandle, Count, Sids, ReferencedDomains, Names
PolicyHandle : [intptr] Policy オブジェクトへのハンドル。このハンドルは POLICY_LOOKUP_NAMES アクセス権を持つ必要がある。詳細は「Opening a Policy Object Handle」を参照。
Count : [int] Sids 配列内の SID の数を指定する。これは Names 配列で返されるエントリ数でもある。この値は 20480 以下でなければならない。
Sids : [var] ルックアップする SID ポインタの配列へのポインタ。SID は既知の SID、ユーザー、グループ、ローカルグループアカウントの SID、またはドメインの SID でよい。
ReferencedDomains : [var] LSA_REFERENCED_DOMAIN_LIST 構造体へのポインタへのポインタを受け取る。この構造体の Domains メンバは、SID が見つかった各ドメインのエントリを含む配列である。各ドメインのエントリにはドメインの SID とフラット名が含まれる。Windows ドメインの場合、フラット名は NetBIOS 名である。非 Windows ドメインへのリンクの場合、フラット名はそのドメインの識別名か、NULL である。
Names : [var] LSA_TRANSLATED_NAME 構造体の配列へのポインタを受け取る。Names 配列の各エントリには、Sids 配列の対応するエントリの名前情報が含まれる。アカウント SID の場合、各構造体の Name メンバにはアカウントの孤立した名前が含まれる。ドメイン SID の場合、Name メンバは無効である。
%inst
セキュリティ識別子 (SID) の配列に対応する名前をルックアップする。LsaLookupSids が SID
に対応する名前を見つけられない場合、関数は SID を文字形式で返す。

[戻り値]
関数が成功した場合、戻り値は以下の NTSTATUS 値のいずれかである。
（以下省略）

[備考]
アカウント SID の場合、Name メンバに返される文字列はアカウントの孤立した名前である (例:
user_name)。アカウントの複合名が必要な場合 (例: Acctg\user_name)、ReferencedDomains
バッファからドメイン名を取得し、バックスラッシュと孤立した名前を付加する。LsaLookupSids 関数が SID
を変換できない場合、関数は以下のアルゴリズムを使用する。
（以下省略）


%index
LsaLookupSids2
セキュリティ識別子 (SID) の配列に対応する名前をルックアップし、インターネットプロバイダの ID をサポートする。LsaLookupSids2 が SID に対応する名前を見つけられない場合、関数は SID を文字形式で返す。
%group
Win32 advapi32
%prm
PolicyHandle, LookupOptions, Count, Sids, ReferencedDomains, Names
PolicyHandle : [intptr] Policy オブジェクトへのハンドル。このハンドルは POLICY_LOOKUP_NAMES アクセス権を持つ必要がある。詳細は「Opening a Policy Object Handle」を参照。
LookupOptions : [int] ルックアップの動作を変更するフラグ。
Count : [int] Sids 配列内の SID の数を指定する。これは Names 配列で返されるエントリ数でもある。この値は 20480 以下でなければならない。
Sids : [var] ルックアップする SID ポインタの配列へのポインタ。SID は既知の SID、ユーザー、グループ、ローカルグループアカウントの SID、またはドメインの SID でよい。
ReferencedDomains : [var] LSA_REFERENCED_DOMAIN_LIST 構造体へのポインタへのポインタを受け取る。この構造体の Domains メンバは、SID が見つかった各ドメインのエントリを含む配列である。各ドメインのエントリにはドメインの SID とフラット名が含まれる。Windows ドメインの場合、フラット名は NetBIOS 名である。非 Windows ドメインへのリンクの場合、フラット名はそのドメインの識別名か、NULL である。
Names : [var] LSA_TRANSLATED_NAME 構造体の配列へのポインタを受け取る。Names 配列の各エントリには、Sids 配列の対応するエントリの名前情報が含まれる。アカウント SID の場合、各構造体の Name メンバにはアカウントの孤立した名前が含まれる。ドメイン SID の場合、Name メンバは無効である。
%inst
セキュリティ識別子 (SID) の配列に対応する名前をルックアップし、インターネットプロバイダの ID
をサポートする。LsaLookupSids2 が SID に対応する名前を見つけられない場合、関数は SID を文字形式で返す。

[戻り値]
関数が成功した場合、戻り値は以下の NTSTATUS 値のいずれかである。
（以下省略）

[備考]
LSA_LOOKUP_PREFER_INTERNET_NAMES フラグは、MicrosoftAccount や Azure Active
Directory アカウントなどのインターネットアカウントに使用する。このフラグが指定されている場合、SID-Name
ルックアップは、MicrosoftAccount\foo@outlook.com や AzureAD\foo@contoso.com
の形式でアカウントの UPN を返す。Microsoft アカウントの場合、このフラグが指定されていれば、ローカル SAM SID
とインターネット SID の両方で UPN が返される。LSA_LOOKUP_PREFER_INTERNET_NAMES
が指定されていない場合、AAD アカウントでは AzureAD\foo の形式の NT4 スタイル名が返される。NT4
スタイル名はマシン固有であり、その使用は慎重に評価され、可能であれば避けるべきである。
（以下省略）


%index
LsaNtStatusToWinError
LsaNtStatusToWinError 関数は、LSA 関数によって返された NTSTATUS コードを Windows エラーコードに変換する。
%group
Win32 advapi32
%prm
Status
Status : [intptr] LSA 関数呼び出しによって返された NTSTATUS コード。この値はシステムエラーコードに変換される。
%inst
LsaNtStatusToWinError 関数は、LSA 関数によって返された NTSTATUS コードを Windows
エラーコードに変換する。

[戻り値]
戻り値は Status パラメータに対応する Windows エラーコードである。対応する Windows
エラーコードがない場合、戻り値は ERROR_MR_MID_NOT_FOUND である。


%index
LsaOpenPolicy
ローカルまたはリモートシステムの Policy オブジェクトへのハンドルを開く。
%group
Win32 advapi32
%prm
SystemName, ObjectAttributes, DesiredAccess, PolicyHandle
SystemName : [var] 対象システムの名前を含む LSA_UNICODE_STRING 構造体へのポインタ。名前の形式は "ComputerName" または "\\ComputerName" でよい。このパラメータが NULL の場合、関数はローカルシステムの Policy オブジェクトを開く。
ObjectAttributes : [var] 接続属性を指定する LSA_OBJECT_ATTRIBUTES 構造体へのポインタ。構造体のメンバは使用されない。NULL またはゼロに初期化すること。
DesiredAccess : [int] 要求されるアクセス権を指定する ACCESS_MASK。対象システムの DACL が呼び出し元に要求されたアクセスを許可しない場合、関数は失敗する。必要なアクセス権を判断するには、ポリシーハンドルで使用する LSA 関数のドキュメントを参照。
PolicyHandle : [intptr] Policy オブジェクトへのハンドルを受け取る LSA_HANDLE 変数へのポインタ。このハンドルが不要になったら、LsaClose 関数に渡して閉じる。
%inst
ローカルまたはリモートシステムの Policy オブジェクトへのハンドルを開く。

[戻り値]
関数が成功した場合、関数は STATUS_SUCCESS を返す。関数が失敗した場合、NTSTATUS コードを返す。詳細は「LSA
Policy Function Return Values」を参照。LsaNtStatusToWinError 関数を使用して
NTSTATUS コードを Windows エラーコードに変換できる。

[備考]
ローカルまたはリモートシステムのローカルセキュリティポリシーを管理するには、LsaOpenPolicy 関数を呼び出してそのシステムの
LSA サブシステムとのセッションを確立する必要がある。LsaOpenPolicy は対象システムの LSA に接続し、そのシステムの
Policy オブジェクトへのハンドルを返す。このハンドルを後続の LSA
関数呼び出しで使用して、対象システムのローカルセキュリティポリシー情報を管理できる。この関数の呼び出しを実演する例については「Opening
a Policy Object Handle」を参照。


%index
LsaOpenTrustedDomainByName
LsaOpenTrustedDomainByName 関数は、リモート信頼ドメインの LSA ポリシーハンドルを開く。このハンドルを LSA 関数呼び出しに渡して、リモートマシンの LSA ポリシーを設定またはクエリできる。
%group
Win32 advapi32
%prm
PolicyHandle, TrustedDomainName, DesiredAccess, TrustedDomainHandle
PolicyHandle : [intptr] Policy オブジェクトへのハンドル。これはローカルマシンのポリシーハンドルである。詳細は「Opening a Policy Object Handle」を参照。
TrustedDomainName : [var] 信頼されたドメインの名前。この名前はフラット名または DNS ドメイン名でよい。
DesiredAccess : [int] リモート信頼ドメインオブジェクトで要求されるアクセス許可を指定する ACCESS_MASK 構造体。
TrustedDomainHandle : [intptr] リモート信頼ドメインの LSA ポリシーハンドルのアドレスを受け取るポインタ。このハンドルを LSA 関数呼び出しに渡して、リモートマシンの LSA ポリシーをクエリおよび管理できる。
%inst
LsaOpenTrustedDomainByName 関数は、リモート信頼ドメインの LSA ポリシーハンドルを開く。このハンドルを
LSA 関数呼び出しに渡して、リモートマシンの LSA ポリシーを設定またはクエリできる。

[戻り値]
関数が成功した場合、戻り値は STATUS_SUCCESS である。関数が失敗した場合、戻り値は NTSTATUS
コードである。以下の値または LSA Policy Function Return Values のいずれかとなる。
（以下省略）


%index
LsaQueryCAPs
指定された ID のセントラルアクセスポリシー (CAP) を返す。
%group
Win32 advapi32
%prm
CAPIDs, CAPIDCount, CAPs, CAPCount
CAPIDs : [var] クエリされる CAP を識別する CAPID へのポインタの配列を含む変数へのポインタ。
CAPIDCount : [int] CAPIDs パラメータの ID 数。
CAPs : [var] クエリされた CAP を表す CENTRAL_ACCESS_POLICY 構造体へのポインタの配列へのポインタを受け取る。
CAPCount : [var] CAPs パラメータで返される CENTRAL_ACCESS_POLICY 構造体ポインタの数。
%inst
指定された ID のセントラルアクセスポリシー (CAP) を返す。

[戻り値]
関数が成功した場合、戻り値は STATUS_SUCCESS である。関数が失敗した場合、戻り値は NTSTATUS コードであり、LSA
Policy Function Return Values のいずれかとなる。


%index
LsaQueryDomainInformationPolicy
Policy オブジェクトからドメイン情報を取得する。
%group
Win32 advapi32
%prm
PolicyHandle, InformationClass, Buffer
PolicyHandle : [intptr] システムの Policy オブジェクトへのハンドル。
InformationClass : [int] Policy オブジェクトから返される情報を指定する POLICY_DOMAIN_INFORMATION_CLASS 列挙型。以下の表に可能な値を示す。
Buffer : [var] 要求された情報を受け取るバッファへのポインタ。
%inst
Policy オブジェクトからドメイン情報を取得する。

[戻り値]
関数が成功した場合、戻り値は STATUS_SUCCESS である。関数が失敗した場合、戻り値は NTSTATUS
コードである。以下の値または LSA Policy Function Return Values のいずれかとなる。
（以下省略）

[備考]
Policy オブジェクトからドメイン情報を取得するには、POLICY_VIEW_LOCAL_INFORMATION
アクセスタイプが必要である。詳細は「Policy Object Access Rights」を参照。


%index
LsaQueryForestTrustInformation
指定されたローカルセキュリティ機関 TrustedDomain オブジェクトのフォレスト信頼情報を取得する。
%group
Win32 advapi32
%prm
PolicyHandle, TrustedDomainName, ForestTrustInfo
PolicyHandle : [intptr] システムの Policy オブジェクトへのハンドル。
TrustedDomainName : [var] フォレスト信頼情報を取得する TrustedDomain オブジェクトの名前を含む LSA_UNICODE_STRING 構造体へのポインタ。
ForestTrustInfo : [var] TrustedDomainName パラメータで指定された TrustedDomain オブジェクトのフォレスト信頼情報を返す LSA_FOREST_TRUST_INFORMATION 構造体へのポインタ。
%inst
指定されたローカルセキュリティ機関 TrustedDomain オブジェクトのフォレスト信頼情報を取得する。

[戻り値]
関数が成功した場合、戻り値は STATUS_SUCCESS である。関数が失敗した場合、戻り値は NTSTATUS
コードである。以下の値または LSA Policy Function Return Values のいずれかとなる。
（以下省略）

[備考]
この関数へのアクセスは、セキュリティ保護可能オブジェクトによって保護される。


%index
LsaQueryForestTrustInformation2
(no summary)
%group
Win32 advapi32
%prm
PolicyHandle, TrustedDomainName, HighestRecordType, ForestTrustInfo
PolicyHandle : [intptr] 
TrustedDomainName : [var] 
HighestRecordType : [int] 
ForestTrustInfo : [var] 
%inst



%index
LsaQueryInformationPolicy
Policy オブジェクトに関する情報を取得する。
%group
Win32 advapi32
%prm
PolicyHandle, InformationClass, Buffer
PolicyHandle : [intptr] Policy オブジェクトへのハンドル。このハンドルに必要なアクセス権は InformationClass パラメータの値に依存する。詳細は「Opening a Policy Object Handle」を参照。
InformationClass : [int] 
Buffer : [var] 要求された情報を含む構造体へのポインタを受け取る変数へのポインタ。構造体の型は InformationClass パラメータの値に依存する。
%inst
Policy オブジェクトに関する情報を取得する。

[戻り値]
LsaQueryInformationPolicy 関数が成功した場合、戻り値は STATUS_SUCCESS
である。関数が失敗した場合、戻り値は NTSTATUS コードである。詳細は「LSA Policy Function Return
Values」を参照。LsaNtStatusToWinError 関数を使用して NTSTATUS コードを Windows
エラーコードに変換できる。

[備考]
この関数の呼び出しを実演する例については「Managing Policy Information」を参照。


%index
LsaQueryTrustedDomainInfo
LsaQueryTrustedDomainInfo 関数は、信頼されたドメインに関する情報を取得する。
%group
Win32 advapi32
%prm
PolicyHandle, TrustedDomainSid, InformationClass, Buffer
PolicyHandle : [intptr] TrustedDomainSid パラメータで識別されるドメインと信頼関係があるドメインコントローラの Policy オブジェクトへのハンドル。ハンドルは POLICY_VIEW_LOCAL_INFORMATION アクセス権を持つ必要がある。詳細は「Opening a Policy Object Handle」を参照。
TrustedDomainSid : [int] クエリする信頼されたドメインの SID へのポインタ。
InformationClass : [int] 
Buffer : [var] 要求された情報を含む構造体へのポインタを受け取るバッファへのポインタ。構造体の型は InformationClass パラメータの値に依存する。
%inst
LsaQueryTrustedDomainInfo 関数は、信頼されたドメインに関する情報を取得する。

[戻り値]
関数が成功した場合、関数は STATUS_SUCCESS を返す。関数が失敗した場合、エラーを示す NTSTATUS
値を返す。詳細は「LSA Policy Function Return Values」を参照。LsaNtStatusToWinError
関数を使用して NTSTATUS 値を Windows エラーコードに変換できる。


%index
LsaQueryTrustedDomainInfoByName
LsaQueryTrustedDomainInfoByName 関数は、信頼されたドメインに関する情報を返す。
%group
Win32 advapi32
%prm
PolicyHandle, TrustedDomainName, InformationClass, Buffer
PolicyHandle : [intptr] Policy オブジェクトへのハンドル。このハンドルは POLICY_VIEW_LOCAL_INFORMATION アクセス権を持つ必要がある。詳細は「Opening a Policy Object Handle」を参照。
TrustedDomainName : [var] 信頼されたドメインの名前を含む文字列。ドメイン名またはフラット名のいずれかでよい。
InformationClass : [int] 
Buffer : [var] 要求された情報を含む返されたバッファへのポインタを受け取る。このバッファの形式と内容は情報クラスに依存する。例えば、InformationClass が TrustedDomainInformationEx に設定されている場合、Buffer は TRUSTED_DOMAIN_INFORMATION_EX 構造体へのポインタを受け取る。詳細は TRUSTED_INFORMATION_CLASS を参照。
%inst
LsaQueryTrustedDomainInfoByName 関数は、信頼されたドメインに関する情報を返す。

[戻り値]
関数が成功した場合、関数は STATUS_SUCCESS を返す。関数が失敗した場合、NTSTATUS 値を返す。以下の値または LSA
Policy Function Return Values のいずれかとなる。
（以下省略）


%index
LsaRemoveAccountRights
アカウントから 1 つ以上の特権を削除する。
%group
Win32 advapi32
%prm
PolicyHandle, AccountSid, AllRights, UserRights, CountOfRights
PolicyHandle : [intptr] Policy オブジェクトへのハンドル。ハンドルは POLICY_LOOKUP_NAMES アクセス権を持つ必要がある。詳細は「Opening a Policy Object Handle」を参照。
AccountSid : [int] 特権を削除するアカウントのセキュリティ識別子 (SID) へのポインタ。
AllRights : [int] TRUE の場合、関数はすべての特権を削除し、アカウントを削除する。この場合、関数は UserRights パラメータを無視する。FALSE の場合、関数は UserRights パラメータで指定された特権を削除する。
UserRights : [var] LSA_UNICODE_STRING 構造体の配列へのポインタ。各構造体にはアカウントから削除する特権の名前が含まれる。特権名のリストについては Privilege Constants を参照。
CountOfRights : [int] UserRights 配列の要素数を指定する。
%inst
アカウントから 1 つ以上の特権を削除する。

[戻り値]
関数が成功した場合、戻り値は STATUS_SUCCESS である。関数が失敗した場合、戻り値は NTSTATUS
コードである。以下の値または LSA Policy Function Return Values のいずれかとなる。
（以下省略）


%index
LsaRetrievePrivateData
LSA プライベートデータ関数は使用しないこと。代わりに CryptProtectData および CryptUnprotectData 関数を使用する。(LsaRetrievePrivateData)
%group
Win32 advapi32
%prm
PolicyHandle, KeyName, PrivateData
PolicyHandle : [intptr] Policy オブジェクトへのハンドル。ハンドルは POLICY_GET_PRIVATE_INFORMATION アクセス権を持つ必要がある。詳細は「Opening a Policy Object Handle」を参照。
KeyName : [var] プライベートデータが格納されているキーの名前を含む LSA_UNICODE_STRING 構造体へのポインタ。特殊なオブジェクトを作成するには、キー名に以下のプレフィックスのいずれかを追加する。
PrivateData : [var] プライベートデータを含む LSA_UNICODE_STRING 構造体へのポインタを受け取る変数へのポインタ。情報が不要になったら、返されたポインタを LsaFreeMemory に渡す。
%inst
LSA プライベートデータ関数は使用しないこと。代わりに CryptProtectData および CryptUnprotectData
関数を使用する。(LsaRetrievePrivateData)

[戻り値]
関数が成功した場合、関数は STATUS_SUCCESS を返す。関数が失敗した場合、NTSTATUS 値を返す。以下の値または LSA
Policy Function Return Values のいずれかとなる。
（以下省略）

[備考]
このプロセスは「管理者として」実行する必要がある。そうでない場合、呼び出しは ERROR_ACCESS_DENIED で失敗する。


%index
LsaSetCAPs
(no summary)
%group
Win32 advapi32
%prm
CAPDNs, CAPDNCount, Flags
CAPDNs : [var] 
CAPDNCount : [int] 
Flags : [int] 
%inst



%index
LsaSetDomainInformationPolicy
Policy オブジェクトにドメイン情報を設定する。
%group
Win32 advapi32
%prm
PolicyHandle, InformationClass, Buffer
PolicyHandle : [intptr] システムの Policy オブジェクトへのハンドル。
InformationClass : [int] Policy オブジェクトに設定する情報を指定する POLICY_DOMAIN_INFORMATION_CLASS 列挙型。以下の表に可能な値を示す。
Buffer : [intptr] Policy オブジェクトに設定する情報を含むバッファへのポインタ。
%inst
Policy オブジェクトにドメイン情報を設定する。

[戻り値]
関数が成功した場合、戻り値は STATUS_SUCCESS である。関数が失敗した場合、戻り値は NTSTATUS
コードである。以下の値または LSA Policy Function Return Values のいずれかとなる。
（以下省略）

[備考]
Policy オブジェクトにドメイン情報を設定するには、POLICY_TRUST_ADMIN
アクセスタイプが必要である。詳細は「Policy Object Access Rights」を参照。


%index
LsaSetForestTrustInformation
指定されたローカルセキュリティ機関 TrustedDomain オブジェクトのフォレスト信頼情報を設定する。
%group
Win32 advapi32
%prm
PolicyHandle, TrustedDomainName, ForestTrustInfo, CheckOnly, CollisionInfo
PolicyHandle : [intptr] システムの Policy オブジェクトへのハンドル。
TrustedDomainName : [var] ForestTrustInfo パラメータで指定されたフォレスト信頼情報を設定する TrustedDomain オブジェクトの名前を含む LSA_UNICODE_STRING 構造体へのポインタ。
ForestTrustInfo : [var] TrustedDomainName パラメータで指定された TrustedDomain オブジェクトに設定するフォレスト信頼情報を含む LSA_FOREST_TRUST_INFORMATION 構造体へのポインタ。
CheckOnly : [int] TrustedDomain オブジェクトへの変更が永続化されるかどうかを指定するブール値。この値が TRUE の場合、関数は指定されたパラメータの衝突を確認するが、ForestTrustInfo パラメータで指定されたフォレスト信頼情報を TrustedDomainName パラメータで指定された TrustedDomain オブジェクトに設定しない。この値が FALSE の場合、フォレスト信頼情報が TrustedDomain オブジェクトに設定される。
CollisionInfo : [var] 発生した衝突に関する情報を返す LSA_FOREST_TRUST_COLLISION_INFORMATION 構造体へのポインタへのポインタ。
%inst
指定されたローカルセキュリティ機関 TrustedDomain オブジェクトのフォレスト信頼情報を設定する。

[戻り値]
関数が成功した場合、戻り値は STATUS_SUCCESS である。関数が失敗した場合、戻り値は NTSTATUS
コードである。以下の値または LSA Policy Function Return Values のいずれかとなる。
（以下省略）


%index
LsaSetForestTrustInformation2
(no summary)
%group
Win32 advapi32
%prm
PolicyHandle, TrustedDomainName, HighestRecordType, ForestTrustInfo, CheckOnly, CollisionInfo
PolicyHandle : [intptr] 
TrustedDomainName : [var] 
HighestRecordType : [int] 
ForestTrustInfo : [var] 
CheckOnly : [int] 
CollisionInfo : [var] 
%inst



%index
LsaSetInformationPolicy
Policy オブジェクト内の情報を変更する。
%group
Win32 advapi32
%prm
PolicyHandle, InformationClass, Buffer
PolicyHandle : [intptr] Policy オブジェクトへのハンドル。このハンドルに必要なアクセス権は InformationClass パラメータの値に依存する。詳細は「Opening a Policy Object Handle」を参照。
InformationClass : [int] 
Buffer : [intptr] 設定する情報を含む構造体へのポインタ。構造体の型は InformationClass パラメータの値に依存する。
%inst
Policy オブジェクト内の情報を変更する。

[戻り値]
関数が成功した場合、戻り値は STATUS_SUCCESS である。関数が失敗した場合、戻り値は NTSTATUS
コードである。詳細は「LSA Policy Function Return
Values」を参照。LsaNtStatusToWinError 関数を使用して NTSTATUS コードを Windows
エラーコードに変換できる。


%index
LsaSetTrustedDomainInfoByName
LsaSetTrustedDomainInfoByName 関数は、TrustedDomain オブジェクトの値を設定する。
%group
Win32 advapi32
%prm
PolicyHandle, TrustedDomainName, InformationClass, Buffer
PolicyHandle : [intptr] Policy オブジェクトへのハンドル。信頼ドメインオブジェクトのセキュリティ記述子が、呼び出し元の変更が受け入れられるかどうかを決定する。ポリシーオブジェクトハンドルの情報については「Opening a Policy Object Handle」を参照。
TrustedDomainName : [var] 値を設定する信頼されたドメインの名前。ドメイン名またはフラット名のいずれかでよい。
InformationClass : [int] 
Buffer : [intptr] 設定する情報を含む構造体へのポインタ。構造体の型は InformationClass パラメータの値に依存する。
%inst
LsaSetTrustedDomainInfoByName 関数は、TrustedDomain オブジェクトの値を設定する。

[戻り値]
関数が成功した場合、戻り値は STATUS_SUCCESS である。関数が失敗した場合、戻り値は NTSTATUS
コードである。詳細は「Security Management Return Values」の "LSA Policy Function
Return Values" セクションを参照。LsaNtStatusToWinError 関数を使用して NTSTATUS コードを
Windows エラーコードに変換できる。


%index
LsaSetTrustedDomainInformation
LsaSetTrustedDomainInformation 関数は、信頼されたドメインに関する Policy オブジェクトの情報を変更する。
%group
Win32 advapi32
%prm
PolicyHandle, TrustedDomainSid, InformationClass, Buffer
PolicyHandle : [intptr] ドメインコントローラの Policy オブジェクトへのハンドル。このハンドルに必要なユーザー権は InformationClass パラメータの値に依存する。詳細は「Opening a Policy Object Handle」を参照。
TrustedDomainSid : [int] 情報が変更される信頼されたドメインの SID へのポインタ。InformationClass パラメータが TrustedDomainNameInformation に設定されている場合、このパラメータは信頼されたドメインのリストに追加するドメインの SID を指す必要がある。
InformationClass : [int] 
Buffer : [intptr] 設定する情報を含む構造体へのポインタ。構造体の型は InformationClass パラメータの値に依存する。
%inst
LsaSetTrustedDomainInformation 関数は、信頼されたドメインに関する Policy
オブジェクトの情報を変更する。

[戻り値]
関数が成功した場合、戻り値は STATUS_SUCCESS である。関数が失敗した場合、戻り値は NTSTATUS
コードである。詳細は「LSA Policy Function Return
Values」を参照。LsaNtStatusToWinError 関数を使用して NTSTATUS コードを Windows
エラーコードに変換できる。


%index
LsaStorePrivateData
LSA プライベートデータ関数は使用しないこと。代わりに CryptProtectData および CryptUnprotectData 関数を使用する。(LsaStorePrivateData)
%group
Win32 advapi32
%prm
PolicyHandle, KeyName, PrivateData
PolicyHandle : [intptr] Policy オブジェクトへのハンドル。KeyName パラメータで指定されたキーの下にデータを格納するのが初めての場合、ハンドルは POLICY_CREATE_SECRET アクセス権を持つ必要がある。詳細は「Opening a Policy Object Handle」を参照。
KeyName : [var] プライベートデータが格納されるキーの名前を含む LSA_UNICODE_STRING 構造体へのポインタ。
PrivateData : [var] 格納するプライベートデータを含む LSA_UNICODE_STRING 構造体へのポインタ。関数は格納前にこのデータを暗号化する。このパラメータが NULL の場合、関数はキーの下に格納されているプライベートデータを削除し、キーを削除する。キーからデータを取得する後続の試みは STATUS_OBJECT_NAME_NOT_FOUND エラーコードを返す。
%inst
LSA プライベートデータ関数は使用しないこと。代わりに CryptProtectData および CryptUnprotectData
関数を使用する。(LsaStorePrivateData)

[戻り値]
関数が成功した場合、戻り値は STATUS_SUCCESS である。関数が失敗した場合、戻り値は NTSTATUS
コードである。詳細は「LSA Policy Function Return
Values」を参照。LsaNtStatusToWinError 関数を使用して NTSTATUS コードを Windows
エラーコードに変換できる。

[備考]
LsaStorePrivateData
関数は、サーバーアプリケーションがクライアントおよびマシンのパスワードを保存するために使用できる。プライベートデータオブジェクトにはローカル、グローバル、マシンの
3 種類の特殊なタイプが含まれる。特殊なオブジェクトはキー名のプレフィックスによって識別される。ローカルオブジェクトは
"L$"、グローバルオブジェクトは "G$"、マシンオブジェクトは "M$"
である。ローカルオブジェクトはリモートからアクセスできない。マシンオブジェクトはオペレーティングシステムからのみアクセスできる。LsaStorePrivateData
関数によって格納されたデータは絶対的に保護されるわけではない。ただし、データは格納前に暗号化され、キーには作成者と管理者のみがデータを読み取れる
DACL がある。LsaStorePrivateData によって格納された値を取得するには LsaRetrievePrivateData
関数を使用する。


%index
MSChapSrvChangePassword
ユーザーアカウントのパスワードを変更する。
%group
Win32 advapi32
%prm
ServerName, UserName, LmOldPresent, LmOldOwfPassword, LmNewOwfPassword, NtOldOwfPassword, NtNewOwfPassword
ServerName : [wstr] 操作対象のサーバーの汎用名前付け規則 (UNC) 名を指定する null 終端 Unicode 文字列へのポインタ。このパラメータが NULL の場合、関数はローカルコンピュータで動作する。
UserName : [wstr] パスワードを変更するユーザーの名前を指定する null 終端 Unicode 文字列へのポインタ。
LmOldPresent : [int] LmOldOwfPassword で指定されたパスワードが有効かどうかを指定する BOOLEAN。LmOldOwfPassword パスワードの長さが 128 ビットを超えており、LM 一方向関数 (OWF) パスワードで表現できない場合、LmOldPresent は FALSE になる。それ以外の場合は TRUE である。
LmOldOwfPassword : [var] ユーザーの現在の LM パスワードの OWF を含む LM_OWF_PASSWORD 構造体へのポインタ。LmOldPresent が FALSE の場合、このパラメータは無視される。
LmNewOwfPassword : [var] ユーザーの新しい LM パスワードの OWF を含む LM_OWF_PASSWORD 構造体へのポインタ。
NtOldOwfPassword : [var] ユーザーの現在の NT パスワードの OWF を含む NT_OWF_PASSWORD 構造体へのポインタ。
NtNewOwfPassword : [var] ユーザーの新しい NT パスワードの OWF を含む NT_OWF_PASSWORD 構造体へのポインタ。
%inst
ユーザーアカウントのパスワードを変更する。

[戻り値]
関数が成功した場合、戻り値は STATUS_SUCCESS (0x00000000) である。関数が失敗した場合、戻り値は
ntstatus.h の以下のエラーコードのいずれかである。
（以下省略）

[備考]
LmNewOwfPassword で指定される値は常に有効な OWF を含む必要がある。新しいパスワードの長さが 128
ビットを超えており、LAN Manager (LM) パスワードで表現できない場合、LmNewOwfPassword は NULL
パスワードの LM OWF にする必要がある。この関数は、USER_CHANGE_PASSWORD
アクセスを持つ場合にのみユーザー自身のパスワードを変更できる。パスワード変更の試みが管理パスワード制限と競合する場合、この関数は
STATUS_PASSWORD_RESTRICTION で失敗する。


%index
MSChapSrvChangePassword2
MSChapSrvChangePassword2 関数は、相互暗号化をサポートしながらユーザーアカウントのパスワードを変更する。
%group
Win32 advapi32
%prm
ServerName, UserName, NewPasswordEncryptedWithOldNt, OldNtOwfPasswordEncryptedWithNewNt, LmPresent, NewPasswordEncryptedWithOldLm, OldLmOwfPasswordEncryptedWithNewLmOrNt
ServerName : [wstr] 操作対象のサーバーの汎用名前付け規則 (UNC) 名を指定する null 終端 Unicode 文字列へのポインタ。このパラメータが NULL の場合、関数はローカルコンピュータで動作する。
UserName : [wstr] パスワードを変更するユーザーの名前を指定する null 終端 Unicode 文字列へのポインタ。
NewPasswordEncryptedWithOldNt : [var] 現在の NT 一方向関数 (OWF) パスワードハッシュを暗号化キーとして使用して暗号化された新しい平文パスワードを含む SAMPR_ENCRYPTED_USER_PASSWORD 構造体へのポインタ。注: NewPasswordEncryptedWithOldNt の暗号を計算するには、RFC 2433 section A.11 で定義されている NewPasswordEncryptedWithOldNtPasswordHash() 関数を使用する。
OldNtOwfPasswordEncryptedWithNewNt : [var] 新しい NT OWF パスワードハッシュを暗号化キーとして使用して暗号化された古い NT OWF パスワードハッシュを含む ENCRYPTED_NT_OWF_PASSWORD 構造体へのポインタ。
LmPresent : [int] 現在の Lan Manager (LM) または NT OWF パスワードハッシュを、NewPasswordEncryptedWithOldNt および OldNtOwfPasswordEncryptedWithNewNt 暗号を生成する際の暗号化キーとして使用するかどうかを指定する BOOLEAN。TRUE の場合、NT OWF パスワードハッシュではなく LM OWF パスワードハッシュが使用される。
NewPasswordEncryptedWithOldLm : [var] 現在の LM OWF パスワードハッシュを使用して暗号化された新しい平文パスワードを含む SAMPR_ENCRYPTED_USER_PASSWORD 構造体へのポインタ。注: NewPasswordEncryptedWithOldLm の暗号を計算するには、RFC 2433 section A.15 で定義されている NewPasswordEncryptedWithOldLmPasswordHash() 関数を使用する。
OldLmOwfPasswordEncryptedWithNewLmOrNt : [var] 新しい LM OWF パスワードハッシュを使用して暗号化された現在の LM OWF パスワードハッシュを含む ENCRYPTED_LM_OWF_PASSWORD 構造体へのポインタ。
%inst
MSChapSrvChangePassword2 関数は、相互暗号化をサポートしながらユーザーアカウントのパスワードを変更する。

[戻り値]
関数が成功した場合、戻り値は STATUS_SUCCESS (0x00000000) である。関数が失敗した場合、戻り値は
ntstatus.h の以下のエラーコードのいずれかである。
（以下省略）

[備考]
この関数は、USER_CHANGE_PASSWORD
アクセスを持つ場合にのみユーザー自身のパスワードを変更できる。パスワード変更の試みが管理パスワード制限と競合する場合、この関数は
STATUS_PASSWORD_RESTRICTION で失敗する。


%index
MakeAbsoluteSD
自己相対形式のセキュリティ記述子をテンプレートとして使用して、絶対形式のセキュリティ記述子を作成する。
%group
Win32 advapi32
%prm
pSelfRelativeSecurityDescriptor, pAbsoluteSecurityDescriptor, lpdwAbsoluteSecurityDescriptorSize, pDacl, lpdwDaclSize, pSacl, lpdwSaclSize, pOwner, lpdwOwnerSize, pPrimaryGroup, lpdwPrimaryGroupSize
pSelfRelativeSecurityDescriptor : [int] 自己相対形式の SECURITY_DESCRIPTOR 構造体へのポインタ。関数は元のセキュリティ記述子を変更せずに、このセキュリティ記述子の絶対形式バージョンを作成する。
pAbsoluteSecurityDescriptor : [int] 関数が絶対形式のセキュリティ記述子の本体で埋めるバッファへのポインタ。この情報は SECURITY_DESCRIPTOR 構造体として整形される。
lpdwAbsoluteSecurityDescriptorSize : [var] pAbsoluteSD パラメータが指すバッファのサイズを指定する変数へのポインタ。バッファがセキュリティ記述子に対して十分な大きさでない場合、関数は失敗し、この変数を必要な最小サイズに設定する。
pDacl : [var] 関数が絶対形式のセキュリティ記述子の随意アクセス制御リスト (DACL) で埋めるバッファへのポインタ。絶対形式のセキュリティ記述子の本体がこのポインタを参照する。
lpdwDaclSize : [var] pDacl パラメータが指すバッファのサイズを指定する変数へのポインタ。バッファがアクセス制御リスト (ACL) に対して十分な大きさでない場合、関数は失敗し、この変数を必要な最小サイズに設定する。
pSacl : [var] 関数が絶対形式のセキュリティ記述子のシステムアクセス制御リスト (SACL) で埋めるバッファへのポインタ。絶対形式のセキュリティ記述子の本体がこのポインタを参照する。
lpdwSaclSize : [var] pSacl パラメータが指すバッファのサイズを指定する変数へのポインタ。バッファが ACL に対して十分な大きさでない場合、関数は失敗し、この変数を必要な最小サイズに設定する。
pOwner : [int] 関数が絶対形式のセキュリティ記述子の所有者のセキュリティ識別子 (SID) で埋めるバッファへのポインタ。絶対形式のセキュリティ記述子の本体がこのポインタを参照する。
lpdwOwnerSize : [var] pOwner パラメータが指すバッファのサイズを指定する変数へのポインタ。バッファが SID に対して十分な大きさでない場合、関数は失敗し、この変数を必要な最小サイズに設定する。
pPrimaryGroup : [int] 関数が絶対形式のセキュリティ記述子のプライマリグループの SID で埋めるバッファへのポインタ。絶対形式のセキュリティ記述子の本体がこのポインタを参照する。
lpdwPrimaryGroupSize : [var] pPrimaryGroup パラメータが指すバッファのサイズを指定する変数へのポインタ。バッファが SID に対して十分な大きさでない場合、関数は失敗し、この変数を必要な最小サイズに設定する。
%inst
自己相対形式のセキュリティ記述子をテンプレートとして使用して、絶対形式のセキュリティ記述子を作成する。

[戻り値]
関数が成功した場合、関数は 0 以外を返す。関数が失敗した場合、0 を返す。拡張エラー情報を取得するには GetLastError
を呼び出す。可能な戻りコードは以下を含むがこれに限定されない。
（以下省略）

[備考]

絶対形式のセキュリティ記述子は、情報そのものではなく情報へのポインタを含む。自己相対形式のセキュリティ記述子は、情報を連続したメモリブロックに含む。自己相対セキュリティ記述子では、SECURITY_DESCRIPTOR
構造体が常に情報の先頭に来るが、セキュリティ記述子の他の構成要素は任意の順序で構造体に続くことができる。メモリアドレスを使用する代わりに、自己相対セキュリティ記述子の構成要素はセキュリティ記述子の先頭からのオフセットによって識別される。この形式は、セキュリティ記述子をフロッピーディスクに保存したり、通信プロトコルで送信したりする必要がある場合に有用である。セキュリティ保護されたオブジェクトを様々なメディアにコピーするサーバーは、MakeAbsoluteSD
関数を使用して自己相対セキュリティ記述子から絶対セキュリティ記述子を作成し、MakeSelfRelativeSD
関数を使用して絶対セキュリティ記述子から自己相対セキュリティ記述子を作成できる。


%index
MakeSelfRelativeSD
絶対形式のセキュリティ記述子をテンプレートとして使用して、自己相対形式のセキュリティ記述子を作成する。
%group
Win32 advapi32
%prm
pAbsoluteSecurityDescriptor, pSelfRelativeSecurityDescriptor, lpdwBufferLength
pAbsoluteSecurityDescriptor : [int] 絶対形式の SECURITY_DESCRIPTOR 構造体へのポインタ。関数は元のセキュリティ記述子を変更せずに、このセキュリティ記述子の自己相対形式バージョンを作成する。
pSelfRelativeSecurityDescriptor : [int] 関数が自己相対形式のセキュリティ記述子で埋めるバッファへのポインタ。
lpdwBufferLength : [var] pSelfRelativeSD パラメータが指すバッファのサイズを指定する変数へのポインタ。バッファがセキュリティ記述子に対して十分な大きさでない場合、関数は失敗し、この変数を必要な最小サイズに設定する。
%inst
絶対形式のセキュリティ記述子をテンプレートとして使用して、自己相対形式のセキュリティ記述子を作成する。

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 である。拡張エラー情報を取得するには
GetLastError を呼び出す。可能な戻りコードは以下を含むがこれに限定されない。
（以下省略）

[備考]

絶対形式のセキュリティ記述子は、情報そのものを含むのではなく情報へのポインタを含む。自己相対形式のセキュリティ記述子は、情報を連続したメモリブロックに含む。自己相対セキュリティ記述子では、SECURITY_DESCRIPTOR
構造体が常に情報の先頭に来るが、セキュリティ記述子の他の構成要素は任意の順序で構造体に続くことができる。メモリアドレスを使用する代わりに、セキュリティ記述子の構成要素はセキュリティ記述子の先頭からのオフセットによって識別される。この形式は、セキュリティ記述子をフロッピーディスクに保存したり、通信プロトコルで送信したりする必要がある場合に有用である。セキュリティ保護されたオブジェクトを様々なメディアにコピーするサーバーは、MakeSelfRelativeSD
関数を使用して絶対セキュリティ記述子から自己相対セキュリティ記述子を作成し、MakeAbsoluteSD
関数を使用して自己相対セキュリティ記述子から絶対セキュリティ記述子を作成できる。


%index
MapGenericMask
アクセスマスク内の汎用アクセス権を特定および標準アクセス権にマップする。関数は GENERIC_MAPPING 構造体で提供されるマッピングを適用する。
%group
Win32 advapi32
%prm
AccessMask, GenericMapping
AccessMask : [var] アクセスマスクへのポインタ。
GenericMapping : [var] 汎用アクセス型の特定および標準アクセス型へのマッピングを指定する GENERIC_MAPPING 構造体へのポインタ。
%inst
アクセスマスク内の汎用アクセス権を特定および標準アクセス権にマップする。関数は GENERIC_MAPPING
構造体で提供されるマッピングを適用する。

[備考]
MapGenericMask 関数の呼び出し後、AccessMask パラメータが指すアクセスマスクは、汎用ビット
(GenericRead、GenericWrite、GenericExecute、GenericAll)
や未定義ビットが設定されていない状態になるが、他のビットは設定されることがある。入力時に汎用ビット以外のビットが指定されている場合、この関数はそれらをクリアしない。


%index
NotifyBootConfigStatus
ブート状態をサービスコントロールマネージャに報告する。ブート検証プログラムによって使用される。
%group
Win32 advapi32
%prm
BootAcceptable
BootAcceptable : [int] 値が TRUE の場合、システムは構成を最後に確認された正常な構成として保存する。値が FALSE の場合、システムは以前に保存された最後に確認された正常な構成を使用して即座に再起動する。
%inst
ブート状態をサービスコントロールマネージャに報告する。ブート検証プログラムによって使用される。

[戻り値]
BootAcceptable パラメータが FALSE の場合、関数は戻らない。最後に確認された正常な構成が正常に保存された場合、戻り値は
0 以外である。エラーが発生した場合、戻り値は 0 である。拡張エラー情報を取得するには GetLastError
を呼び出す。以下のエラーコードがサービスコントロールマネージャによって設定されることがある。
（以下省略）

[備考]

この関数で実行中システムの構成を保存することは、最後に確認された正常な構成を保存するための受け入れ可能な方法である。ブート構成が受け入れ可能でない場合、この関数を使用して既存の最後に確認された正常な構成を使用してシステムを再起動する。この関数呼び出しには、呼び出し元のトークンが
SC_MANAGER_MODIFY_BOOT_CONFIG アクセス権を取得する権限を持つ必要がある。詳細は「Service
Security and Access Rights」を参照。


%index
NotifyChangeEventLog
指定したイベントログにイベントが書き込まれたときにアプリケーションが通知を受け取れるようにする。
%group
Win32 advapi32
%prm
hEventLog, hEvent
hEventLog : [intptr] イベントログへのハンドル。OpenEventLog 関数がこのハンドルを返す。
hEvent : [intptr] 手動リセットまたは自動リセットイベントオブジェクトへのハンドル。イベントオブジェクトの作成には CreateEvent 関数を使用する。
%inst
指定したイベントログにイベントが書き込まれたときにアプリケーションが通知を受け取れるようにする。

[戻り値]
関数が成功した場合、戻り値は 0 以外である。
関数が失敗した場合、戻り値は 0 である。拡張エラー情報を取得するには GetLastError を呼び出す。

[備考]
NotifyChangeEventLog 関数はリモートハンドルでは動作しない。hEventLog
パラメータがリモートコンピュータ上のイベントログへのハンドルの場合、NotifyChangeEventLog は 0
を返し、GetLastError は ERROR_INVALID_HANDLE を返す。システムが PulseEvent
を呼び出したときにスレッドがイベントで待機していない場合、スレッドは通知を受け取らない。したがって、通知を待つために別のスレッドを作成するべきである。イベントログへのハンドルを閉じるまで、システムは変更の通知を続ける。イベントログを閉じるには
CloseEventLog または DeregisterEventSource 関数を使用する。


%index
NotifyServiceStatusChangeW
指定したサービスが作成または削除されたとき、またはその状態が変化したときにアプリケーションが通知を受け取れるようにする。(Unicode)
%group
Win32 advapi32
%prm
hService, dwNotifyMask, pNotifyBuffer
hService : [intptr] サービスまたはサービスコントロールマネージャへのハンドル。サービスへのハンドルは OpenService または CreateService 関数によって返され、SERVICE_QUERY_STATUS アクセス権を持つ必要がある。サービスコントロールマネージャへのハンドルは OpenSCManager 関数によって返され、SC_MANAGER_ENUMERATE_SERVICE アクセス権を持つ必要がある。詳細は「Service Security and Access Rights」を参照。サービスごとに未処理の通知要求は 1 つだけ存在できる。
dwNotifyMask : [int] 
pNotifyBuffer : [var] コールバック関数へのポインタなどの通知情報を含む SERVICE_NOTIFY 構造体へのポインタ。この構造体は、コールバック関数が呼び出されるか、呼び出し元スレッドが通知要求を取り消すまで有効でなければならない。最初の呼び出しのコールバック関数がバッファの使用を終えるか、最初の通知要求が取り消されるまで、同じバッファパラメータで NotifyServiceStatusChange を複数回呼び出してはならない。そうしないと、コールバック関数がどのバージョンのバッファを受け取るかが保証されない。Windows Vista: コールバック関数のアドレスはロードされたモジュールのアドレス範囲内になければならない。したがって、コールバック関数は実行時に生成されたコード (JIT コンパイラによって生成されたマネージコードなど) や実行時に展開されるネイティブコードであってはならない。この制限は Windows Server 2008 および Windows Vista SP1 で削除された。
%inst
指定したサービスが作成または削除されたとき、またはその状態が変化したときにアプリケーションが通知を受け取れるようにする。(Unicode)

[戻り値]
関数が成功した場合、戻り値は ERROR_SUCCESS である。サービスが削除対象としてマークされている場合、戻り値は
ERROR_SERVICE_MARKED_FOR_DELETE
であり、サービスへのハンドルを閉じる必要がある。サービス通知がシステム状態から大きく遅れている場合、関数は
ERROR_SERVICE_NOTIFY_CLIENT_LAGGING を返す。この場合、クライアントは SCM
へのハンドルを閉じ、新しいハンドルを開いてこの関数を再度呼び出す必要がある。関数が失敗した場合、戻り値はシステムエラーコードのいずれかである。

[備考]
NotifyServiceStatusChange
関数は、サービスアプリケーションに関する通知を受け取るために使用できる。ドライバサービスに関する通知を受け取るためには使用できない。サービス状態が変更されると、システムは呼び出し元スレッドにキューイングされた非同期プロシージャ呼び出し
(APC) として指定されたコールバック関数を呼び出す。通知を受け取るには、呼び出し元スレッドはアラート可能待機に入る必要がある (例えば
SleepEx 関数を呼び出す)。詳細は「Asynchronous Procedure
Calls」を参照。NotifyServiceStatusChange
が呼び出されたときにサービスが既に要求された状態のいずれかにある場合、コールバック関数は即座にキューイングされる。同じサービスと状態で関数が次に呼び出されるまでにサービス状態が変化していない場合、コールバック関数は即座にキューイングされない。コールバック関数はサービスが次に要求された状態に入ったときにキューイングされる。
> [!NOTE] > winsvc.h ヘッダーは NotifyServiceStatusChange
をエイリアスとして定義し、UNICODE プリプロセッサ定数の定義に基づいて、この関数の ANSI 版または Unicode
版を自動的に選択する。詳細は [Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
ObjectCloseAuditAlarmW
プライベートオブジェクトへのハンドルが削除されたときに、セキュリティイベントログに監査メッセージを生成する。(ObjectCloseAuditAlarmW)
%group
Win32 advapi32
%prm
SubsystemName, HandleId, GenerateOnClose
SubsystemName : [wstr] 関数を呼び出すサブシステムの名前を指定する null 終端文字列へのポインタ。この文字列は関数が生成する監査メッセージに現れる。
HandleId : [intptr] オブジェクトへのクライアントのハンドルを表す一意の値。これは AccessCheckAndAuditAlarm または ObjectOpenAuditAlarm 関数に渡された値と同じでなければならない。
GenerateOnClose : [int] オブジェクトハンドルが作成されたときに AccessCheckAndAuditAlarm または ObjectCloseAuditAlarm 関数の呼び出しによって設定されるフラグを指定する。このフラグが TRUE の場合、関数は監査メッセージを生成する。FALSE の場合、関数は監査メッセージを生成しない。
%inst

プライベートオブジェクトへのハンドルが削除されたときに、セキュリティイベントログに監査メッセージを生成する。(ObjectCloseAuditAlarmW)

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 である。拡張エラー情報を取得するには
GetLastError を呼び出す。

[備考]
ObjectCloseAuditAlarm 関数は、呼び出し元アプリケーションが SE_AUDIT_NAME
特権を有効にしていることを必要とする。この特権のテストは常に呼び出し元プロセスのプライマリトークンに対して実行されるため、呼び出し元プロセスはクライアントを偽装できる。


%index
ObjectDeleteAuditAlarmW
ObjectDeleteAuditAlarmW (Unicode) 関数 (securitybaseapi.h) は、オブジェクトが削除されたときに監査メッセージを生成する。
%group
Win32 advapi32
%prm
SubsystemName, HandleId, GenerateOnClose
SubsystemName : [wstr] 関数を呼び出すサブシステムの名前を指定する null 終端文字列へのポインタ。この文字列は関数が生成する監査メッセージに現れる。
HandleId : [intptr] オブジェクトへのクライアントのハンドルを表す一意の値を指定する。これは AccessCheckAndAuditAlarm または ObjectOpenAuditAlarm 関数に渡された値と同じでなければならない。
GenerateOnClose : [int] オブジェクトハンドルが作成されたときに AccessCheckAndAuditAlarm または ObjectOpenAuditAlarm 関数の呼び出しによって設定されるフラグを指定する。
%inst
ObjectDeleteAuditAlarmW (Unicode) 関数 (securitybaseapi.h)
は、オブジェクトが削除されたときに監査メッセージを生成する。

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 である。拡張エラー情報を取得するには
GetLastError を呼び出す。

[備考]
ObjectDeleteAuditAlarm 関数は、呼び出し元アプリケーションが SE_AUDIT_NAME
特権を有効にしていることを必要とする。この特権のテストは常に呼び出し元プロセスのプライマリトークンに対して実行されるため、呼び出し元プロセスはクライアントを偽装できる。


%index
ObjectOpenAuditAlarmW
クライアントアプリケーションがオブジェクトへのアクセスまたは新しいオブジェクトの作成を試みたときに監査メッセージを生成する。(ObjectOpenAuditAlarmW)
%group
Win32 advapi32
%prm
SubsystemName, HandleId, ObjectTypeName, ObjectName, pSecurityDescriptor, ClientToken, DesiredAccess, GrantedAccess, Privileges, ObjectCreation, AccessGranted, GenerateOnClose
SubsystemName : [wstr] 関数を呼び出すサブシステムの名前を指定する null 終端文字列へのポインタ。この文字列は関数が生成する監査メッセージに現れる。
HandleId : [intptr] オブジェクトへのクライアントのハンドルを表す一意の値へのポインタ。アクセスが拒否された場合、このパラメータは無視される。クロスプラットフォーム互換性のため、このポインタが指す値は sizeof(LPVOID) バイト長でなければならない。
ObjectTypeName : [wstr] クライアントがアクセスを要求しているオブジェクトの型を指定する null 終端文字列へのポインタ。この文字列は関数が生成する監査メッセージに現れる。
ObjectName : [wstr] クライアントがアクセスを要求しているオブジェクトの名前を指定する null 終端文字列へのポインタ。この文字列は関数が生成する監査メッセージに現れる。
pSecurityDescriptor : [int] アクセスされているオブジェクトの SECURITY_DESCRIPTOR 構造体へのポインタ。
ClientToken : [intptr] 操作を要求するクライアントを表すアクセストークンを識別する。このハンドルはクライアントを偽装するスレッドのトークンを開くことによって取得する必要がある。トークンは TOKEN_QUERY アクセスで開く必要がある。
DesiredAccess : [int] 所望のアクセスマスクを指定する。このマスクは、汎用アクセス権を含まないように MapGenericMask 関数で事前にマップされている必要がある。
GrantedAccess : [int] 付与されるアクセス権を示すアクセスマスクを指定する。このアクセスマスクは、アクセスチェック関数のいずれかがその GrantedAccess パラメータに設定した値と同じであることが意図されている。アクセスチェック関数の例には AccessCheckAndAuditAlarm や AccessCheck がある。
Privileges : [var] アクセス試行に必要な特権のセットを指定する PRIVILEGE_SET 構造体へのポインタ。このパラメータは NULL でよい。
ObjectCreation : [int] アクセスが許可されたときにアプリケーションが新しいオブジェクトを作成するかどうかを決定するフラグを指定する。この値が TRUE の場合、アプリケーションは新しいオブジェクトを作成する。FALSE の場合、アプリケーションは既存のオブジェクトを開く。
AccessGranted : [int] AccessCheck などのアクセスチェック関数の以前の呼び出しでアクセスが許可されたか拒否されたかを示すフラグを指定する。アクセスが許可された場合、この値は TRUE である。そうでない場合は FALSE である。
GenerateOnClose : [var] 関数が戻るときに監査生成ルーチンによって設定されるフラグへのポインタ。オブジェクトハンドルが閉じられるときに、この値を ObjectCloseAuditAlarm 関数に渡す必要がある。
%inst

クライアントアプリケーションがオブジェクトへのアクセスまたは新しいオブジェクトの作成を試みたときに監査メッセージを生成する。(ObjectOpenAuditAlarmW)

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 である。拡張エラー情報を取得するには
GetLastError を呼び出す。

[備考]
ObjectOpenAuditAlarm 関数は、呼び出し元アプリケーションが SE_AUDIT_NAME
特権を有効にしていることを必要とする。この特権のテストは常に呼び出し元プロセスのプライマリトークンに対して実行され、スレッドの偽装トークンに対しては実行されない。これにより、呼び出し元プロセスは呼び出し中にクライアントを偽装できる。


%index
ObjectPrivilegeAuditAlarmW
セキュリティイベントログに監査メッセージを生成する。(ObjectPrivilegeAuditAlarmW)
%group
Win32 advapi32
%prm
SubsystemName, HandleId, ClientToken, DesiredAccess, Privileges, AccessGranted
SubsystemName : [wstr] 関数を呼び出すサブシステムの名前を指定する null 終端文字列へのポインタ。この文字列は監査メッセージに現れる。
HandleId : [intptr] オブジェクトへのクライアントのハンドルを表す一意の値へのポインタ。
ClientToken : [intptr] 操作を要求したクライアントを表すアクセストークンを識別する。このハンドルはクライアントを偽装するスレッドのトークンを開くことによって取得する必要がある。トークンは TOKEN_QUERY アクセスで開く必要がある。関数は監査メッセージのクライアントの ID を取得するためにこのトークンを使用する。
DesiredAccess : [int] 使用されている、または使用が試みられている特権アクセスの種類を示すアクセスマスクを指定する。アクセスマスクは、汎用アクセス型を含まないように MapGenericMask 関数でマップできる。
Privileges : [var] クライアントが使用しようとした特権を含む PRIVILEGE_SET 構造体へのポインタ。特権の名前は監査メッセージに現れる。
AccessGranted : [int] クライアントの特権使用の試みが成功したかどうかを示す。この値が TRUE の場合、監査メッセージは成功を示す。この値が FALSE の場合、監査メッセージは失敗を示す。
%inst
セキュリティイベントログに監査メッセージを生成する。(ObjectPrivilegeAuditAlarmW)

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 である。拡張エラー情報を取得するには
GetLastError を呼び出す。

[備考]
ObjectPrivilegeAuditAlarm
関数はクライアントのオブジェクトへのアクセスを確認したり、特権が保持または有効になっているかどうかを判断するためにクライアントのアクセストークンを確認したりしない。通常、特定の特権がアクセストークンで有効になっているかどうかを判断するために
PrivilegeCheck 関数を呼び出し、AccessCheck
関数を呼び出してクライアントのオブジェクトへのアクセスを確認し、その後 ObjectPrivilegeAuditAlarm
を呼び出して結果をログに記録する。ObjectPrivilegeAuditAlarm 関数は、呼び出し元プロセスが
SE_AUDIT_NAME
特権を有効にしていることを必要とする。この特権のテストは常に呼び出し元プロセスのプライマリトークンに対して実行され、スレッドの偽装トークンに対しては実行されない。これにより、呼び出し元プロセスは呼び出し中にクライアントを偽装できる。


%index
OpenBackupEventLogW
BackupEventLog 関数で作成されたバックアップイベントログへのハンドルを開く。(Unicode)
%group
Win32 advapi32
%prm
lpUNCServerName, lpFileName
lpUNCServerName : [wstr] この操作を実行するリモートサーバーの汎用名前付け規則 (UNC) 名。このパラメータが NULL の場合、ローカルコンピュータが使用される。
lpFileName : [wstr] バックアップファイルの完全パス。
%inst
BackupEventLog 関数で作成されたバックアップイベントログへのハンドルを開く。(Unicode)

[戻り値]
関数が成功した場合、戻り値はバックアップイベントログへのハンドルである。
関数が失敗した場合、戻り値は NULL である。拡張エラー情報を取得するには GetLastError を呼び出す。

[備考]
バックアップファイル名がリモートサーバーを指定している場合、lpUNCServerName パラメータは NULL
でなければならない。この関数が Windows Vista 以降のコンピュータで使用される場合、Windows Vista
以降のコンピュータで BackupEventLog 関数で保存されたバックアップイベントログのみを開くことができる。
> [!NOTE] > winbase.h ヘッダーは OpenBackupEventLog をエイリアスとして定義し、UNICODE
プリプロセッサ定数の定義に基づいて、この関数の ANSI 版または Unicode 版を自動的に選択する。詳細は [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
OpenEncryptedFileRawW
バックアップ (エクスポート) または復元 (インポート) のために暗号化されたファイルを開く。(Unicode)
%group
Win32 advapi32
%prm
lpFileName, ulFlags, pvContext
lpFileName : [wstr] 開くファイルの名前。文字列は Windows 文字セットの文字で構成される必要がある。
ulFlags : [int] 実行する操作。このパラメータは以下の値のいずれかとなる。
pvContext : [var] ReadEncryptedFileRaw、WriteEncryptedFileRaw、または CloseEncryptedFileRaw の後続の呼び出しで渡される必要があるコンテキストブロックのアドレス。変更してはならない。
%inst
バックアップ (エクスポート) または復元 (インポート) のために暗号化されたファイルを開く。(Unicode)

[戻り値]
関数が成功した場合、ERROR_SUCCESS を返す。関数が失敗した場合、WinError.h で定義されている 0
以外のエラーコードを返す。

[備考]
呼び出し元はファイルへの読み取りまたは書き込みアクセスを持つか、ファイルが存在するマシンで SeBackupPrivilege
バックアップ特権を持つ必要がある。暗号化されたファイルをバックアップするには、OpenEncryptedFileRaw
を呼び出してファイルを開き、次に ReadEncryptedFileRaw
を呼び出す。バックアップが完了したら、CloseEncryptedFileRaw
を呼び出す。暗号化されたファイルを復元するには、ulFlags パラメータに CREATE_FOR_IMPORT を指定して
OpenEncryptedFileRaw を呼び出し、次に WriteEncryptedFileRaw を 1 回呼び出す。
（以下省略）


%index
OpenEventLogW
指定したイベントログへのハンドルを開く。(Unicode)
%group
Win32 advapi32
%prm
lpUNCServerName, lpSourceName
lpUNCServerName : [wstr] イベントログを開くリモートサーバーの汎用名前付け規則 (UNC) 名。このパラメータが NULL の場合、ローカルコンピュータが使用される。
lpSourceName : [wstr] ログの名前。カスタムログを指定し、それが見つからない場合、イベントログサービスはアプリケーションログを開く。ただし、関連するメッセージやカテゴリ文字列ファイルはない。
%inst
指定したイベントログへのハンドルを開く。(Unicode)

[戻り値]
関数が成功した場合、戻り値はイベントログへのハンドルである。
関数が失敗した場合、戻り値は NULL である。拡張エラー情報を取得するには GetLastError を呼び出す。

[備考]
イベントログへのハンドルを閉じるには CloseEventLog 関数を使用する。


%index
OpenProcessToken
プロセスに関連付けられたアクセストークンを開く。
%group
Win32 advapi32
%prm
ProcessHandle, DesiredAccess, TokenHandle
ProcessHandle : [intptr] アクセストークンを開くプロセスへのハンドル。プロセスは PROCESS_QUERY_LIMITED_INFORMATION アクセス許可を持つ必要がある。詳細は [Process Security and Access Rights](/windows/win32/procthread/process-security-and-access-rights) を参照。
DesiredAccess : [int] アクセストークンに要求するアクセスの種類を指定するアクセスマスクを指定する。これらの要求されたアクセス型は、トークンの随意アクセス制御リスト (DACL) と比較され、どのアクセスが許可または拒否されるかが決定される。
TokenHandle : [intptr] 関数が戻るときに新しく開かれたアクセストークンを識別するハンドルへのポインタ。
%inst
プロセスに関連付けられたアクセストークンを開く。

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 である。拡張エラー情報を取得するには
GetLastError を呼び出す。

[備考]

昇格されていないプロセスから昇格されたプロセスへのハンドルを取得するには、両方のプロセスが同じアカウントから起動されている必要がある。チェック対象のプロセスが別のアカウントによって起動された場合、チェックを行うプロセスは
SE_DEBUG_NAME 特権を有効にする必要がある。詳細は [Privilege Constants
(Authorization)](/windows/win32/secauthz/privilege-constants)
を参照。TokenHandle パラメータで返されたアクセストークンハンドルを閉じるには CloseHandle を呼び出す。


%index
OpenSCManagerW
指定したコンピュータ上のサービスコントロールマネージャへの接続を確立し、指定したサービスコントロールマネージャデータベースを開く。(Unicode)
%group
Win32 advapi32
%prm
lpMachineName, lpDatabaseName, dwDesiredAccess
lpMachineName : [wstr] 対象コンピュータの名前。ポインタが NULL または空文字列を指す場合、関数はローカルコンピュータ上のサービスコントロールマネージャに接続する。
lpDatabaseName : [wstr] サービスコントロールマネージャデータベースの名前。このパラメータは SERVICES_ACTIVE_DATABASE に設定するべきである。NULL の場合、SERVICES_ACTIVE_DATABASE データベースが既定で開かれる。
dwDesiredAccess : [int] サービスコントロールマネージャへのアクセス。アクセス権のリストについては「Service Security and Access Rights」を参照。
%inst

指定したコンピュータ上のサービスコントロールマネージャへの接続を確立し、指定したサービスコントロールマネージャデータベースを開く。(Unicode)

[戻り値]
関数が成功した場合、戻り値は指定されたサービスコントロールマネージャデータベースへのハンドルである。関数が失敗した場合、戻り値は NULL
である。拡張エラー情報を取得するには GetLastError を呼び出す。以下のエラーコードが SCM によって設定されることがある。
（以下省略）

[備考]
プロセスが OpenSCManager
関数を使用してサービスコントロールマネージャデータベースへのハンドルを開くとき、システムは要求されたアクセスを付与する前にセキュリティチェックを実行する。詳細は「Service
Security and Access
Rights」を参照。現在のユーザーが別のコンピュータ上のサービスに接続する際に適切なアクセスを持たない場合、OpenSCManager
関数呼び出しは失敗する。サービスにリモートで接続するには、LOGON32_LOGON_NEW_CREDENTIALS を指定して
LogonUser 関数を呼び出し、次に OpenSCManager を呼び出す前に ImpersonateLoggedOnUser
を呼び出す。サービスへのリモート接続の詳細については「Services and
RPC/TCP」を参照。管理者特権を持つプロセスのみが、CreateService
関数で使用できるデータベースハンドルを開くことができる。返されたハンドルは OpenSCManager
関数を呼び出したプロセスでのみ有効である。CloseServiceHandle 関数を呼び出して閉じることができる。


%index
OpenServiceW
既存のサービスを開く。(Unicode)
%group
Win32 advapi32
%prm
hSCManager, lpServiceName, dwDesiredAccess
hSCManager : [intptr] サービスコントロールマネージャデータベースへのハンドル。OpenSCManager 関数がこのハンドルを返す。詳細は「Service Security and Access Rights」を参照。
lpServiceName : [wstr] 開くサービスの名前。これはサービスオブジェクトが作成されたときに CreateService 関数の lpServiceName パラメータで指定された名前であり、ユーザーインターフェイスアプリケーションがサービスを識別するために表示するサービス表示名ではない。最大文字列長は 256 文字である。サービスコントロールマネージャデータベースは文字の大文字と小文字を保持するが、サービス名の比較は常に大文字小文字を区別しない。スラッシュ (/) とバックスラッシュ (\\) は無効なサービス名文字である。
dwDesiredAccess : [int] サービスへのアクセス。アクセス権のリストについては「Service Security and Access Rights」を参照。
%inst
既存のサービスを開く。(Unicode)

[戻り値]
関数が成功した場合、戻り値はサービスへのハンドルである。関数が失敗した場合、戻り値は NULL である。拡張エラー情報を取得するには
GetLastError を呼び出す。以下のエラーコードがサービスコントロールマネージャによって設定されることがある。
（以下省略）

[備考]
返されたハンドルは OpenService を呼び出したプロセスでのみ有効である。CloseServiceHandle
関数を呼び出して閉じることができる。OpenService を使用するために、SC_MANAGER_CONNECT 以外の特権は必要ない。


%index
OpenThreadToken
スレッドに関連付けられたアクセストークンを開く。
%group
Win32 advapi32
%prm
ThreadHandle, DesiredAccess, OpenAsSelf, TokenHandle
ThreadHandle : [intptr] アクセストークンを開くスレッドへのハンドル。
DesiredAccess : [int] アクセストークンに要求するアクセスの種類を指定するアクセスマスクを指定する。これらの要求されたアクセス型はトークンの随意アクセス制御リスト (DACL) と照合され、どのアクセスが許可または拒否されるかが決定される。
OpenAsSelf : [int] プロセスレベルのセキュリティコンテキストに対してアクセスチェックを行う場合は TRUE、OpenThreadToken 関数を呼び出すスレッドの現在のセキュリティコンテキストに対してアクセスチェックを行う場合は FALSE。OpenAsSelf パラメータは、呼び出し元が SecurityIdentification レベルでトークンを偽装している場合に、指定したスレッドのアクセストークンを開くことを可能にする。このパラメータがないと、呼び出し元スレッドは SecurityIdentification 偽装レベルを使用してエグゼクティブレベルのオブジェクトを開くことが不可能であるため、指定したスレッドのアクセストークンを開くことができない。
TokenHandle : [intptr] 新しく開かれたアクセストークンへのハンドルを受け取る変数へのポインタ。
%inst
スレッドに関連付けられたアクセストークンを開く。

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 である。拡張エラー情報を取得するには
GetLastError を呼び出す。トークンが匿名偽装レベルを持つ場合、トークンは開かれず、OpenThreadToken
はエラーとして ERROR_CANT_OPEN_ANONYMOUS を設定する。

[備考]
匿名偽装レベルを持つトークンは開くことができない。TokenHandle パラメータで返されたアクセストークンハンドルを
CloseHandle を呼び出して閉じる。


%index
OpenThreadWaitChainSession
新しい WCT セッションを作成する。
%group
Win32 advapi32
%prm
Flags, callback
Flags : [int] 
callback : [int] セッションが非同期の場合、このパラメータは WaitChainCallback コールバック関数へのポインタでよい。
%inst
新しい WCT セッションを作成する。

[戻り値]
関数が成功した場合、戻り値は新しく作成されたセッションへのハンドルである。関数が失敗した場合、戻り値は NULL
である。拡張エラー情報を取得するには GetLastError を呼び出す。

[備考]
セッションの使用が終わったら、CloseThreadWaitChainSession 関数を呼び出す。


%index
OpenTraceW
OpenTraceW (Unicode) 関数 (evntrace.h) は、ETW リアルタイムトレースセッションまたは ETW ログファイルからイベントを取得するための ETW トレース処理ハンドルを開く。
%group
Win32 advapi32
%prm
Logfile
Logfile : [var] [EVENT_TRACE_LOGFILE](/windows/win32/api/evntrace/ns-evntrace-event_trace_logfilew) 構造体へのポインタ。構造体は、イベントを取得するソース (ETW ログファイルまたはリアルタイム ETW セッション) を指定し、コンシューマがイベントを受け取るために使用するコールバックを指定する。成功時には **OpenTrace** は、開いたファイルまたはセッションからの情報で構造体を更新する。
%inst
OpenTraceW (Unicode) 関数 (evntrace.h) は、ETW リアルタイムトレースセッションまたは ETW
ログファイルからイベントを取得するための ETW トレース処理ハンドルを開く。

[戻り値]
関数が成功した場合、トレース処理ハンドルを返す。ハンドルは
[CloseTrace](/windows/win32/api/evntrace/nf-evntrace-closetrace)
を使用して閉じる必要がある。関数が失敗した場合、**INVALID_PROCESSTRACE_HANDLE** を返す。
（以下省略）

[備考]
トレースコンシューマは、トレース処理セッションを開くためにこの関数を呼び出す。**OpenTrace**
を呼び出した後、[ProcessTrace](/windows/win32/api/evntrace/nf-evntrace-processtrace)
関数を呼び出してイベントを処理する。イベントの処理が完了したら、[CloseTrace](/windows/win32/api/evntrace/nf-evntrace-closetrace)
関数を呼び出してトレース処理ハンドルを閉じる。


%index
OperationEnd
アプリケーションが操作を終了しようとしていることをシステムに通知する。
%group
Win32 advapi32
%prm
OperationEndParams
OperationEndParams : [var] VERSION、OPERATION_ID、FLAGS を指定する _OPERATION_END_PARAMETERS 構造体。
%inst
アプリケーションが操作を終了しようとしていることをシステムに通知する。

[戻り値]
すべての有効なパラメータに対して TRUE、それ以外は FALSE。拡張エラー情報を取得するには GetLastError を呼び出す。

[備考]
_OPERATION_END_PARAMETERS 構造体のバージョンは Windows SDK で
OPERATION_API_VERSION として定義されている。OperationEnd 関数はどのスレッドからでも安全に呼び出せる。


%index
OperationStart
アプリケーションが操作を開始しようとしていることをシステムに通知する。
%group
Win32 advapi32
%prm
OperationStartParams
OperationStartParams : [var] VERSION、OPERATION_ID、FLAGS を指定する _OPERATION_START_PARAMETERS 構造体。
%inst
アプリケーションが操作を開始しようとしていることをシステムに通知する。

[戻り値]
すべての有効なパラメータに対して TRUE、それ以外は FALSE。拡張エラー情報を取得するには GetLastError を呼び出す。

[備考]
_OPERATION_START_PARAMETERS 構造体のバージョンは Windows SDK で
OPERATION_API_VERSION として定義されている。OperationStart
関数は同期的であるため、戻るまで数秒かかることがある。最高の応答性のため、UI スレッドでは避けるべきである。プロセス内には 1
つの操作レコーダインスタンスが存在する。操作レコーダ API
はプロセス内の複数のスレッドから呼び出せるが、すべての呼び出しは単一のインスタンスに作用する。
（以下省略）


%index
PerfAddCounters
指定したクエリにパフォーマンスカウンタ仕様を追加する。
%group
Win32 advapi32
%prm
hQuery, pCounters, cbCounters
hQuery : [intptr] パフォーマンスカウンタ仕様を追加するクエリへのハンドル。
pCounters : [var] 追加するパフォーマンスカウンタ仕様へのポインタ。
cbCounters : [int] pCounters パラメータで指定されるバッファのサイズ (バイト単位)。
%inst
指定したクエリにパフォーマンスカウンタ仕様を追加する。

[戻り値]
関数が成功した場合、ERROR_SUCCESS を返す。
関数が失敗した場合、戻り値はシステムエラーコードである。

[備考]
pCounters パラメータは PERF_COUNTER_IDENTIFIER ブロックのシーケンスを指す必要がある。各
PERF_COUNTER_IDENTIFIER ブロックは PERF_COUNTER_IDENTIFIER 構造体で構成され、任意で
null 終端 UTF-16LE インスタンス名文字列が続き、その後にブロックのサイズを 8 バイトの倍数にするパディングが続く。各
PERF_COUNTER_IDENTIFIER ブロックに対して
（以下省略）


%index
PerfCloseQueryHandle
PerfOpenQueryHandle を呼び出して開いたクエリハンドルを閉じる。
%group
Win32 advapi32
%prm
hQuery
hQuery : [intptr] 閉じるクエリへのハンドル。
%inst
PerfOpenQueryHandle を呼び出して開いたクエリハンドルを閉じる。

[戻り値]
関数が成功した場合、ERROR_SUCCESS を返す。
関数が失敗した場合、戻り値はシステムエラーコードである。


%index
PerfDeleteCounters
指定したクエリから指定したパフォーマンスカウンタ仕様を削除する。
%group
Win32 advapi32
%prm
hQuery, pCounters, cbCounters
hQuery : [intptr] パフォーマンスカウンタ仕様を削除するクエリへのハンドル。
pCounters : [var] 削除するパフォーマンスカウンタ仕様へのポインタ。
cbCounters : [int] pCounters パラメータで指定されるバッファのサイズ (バイト単位)。
%inst
指定したクエリから指定したパフォーマンスカウンタ仕様を削除する。

[戻り値]
関数が成功した場合、ERROR_SUCCESS を返す。
関数が失敗した場合、戻り値はシステムエラーコードである。

[備考]
pCounters パラメータは PERF_COUNTER_IDENTIFIER ブロックのシーケンスを指す必要がある。各
PERF_COUNTER_IDENTIFIER ブロックは PERF_COUNTER_IDENTIFIER 構造体で構成され、任意で
null 終端 UTF-16LE インスタンス名文字列が続き、その後にブロックのサイズを 8 バイトの倍数にするパディングが続く。各
PERF_COUNTER_IDENTIFIER ブロックを PerfAddCounters の「備考」で説明した方法と同じように構成する。
PerfDeleteCounters は、各 PERF_COUNTER_IDENTIFIER ブロックについて 1
つのカウンタ仕様をクエリから削除しようとし、試みの結果を各ブロックの PERF_COUNTER_IDENTIFIER 構造体の
Status メンバで更新する。


%index
PerfEnumerateCounterSet
指定したシステムに登録されているカウンタセットのカウンタセット識別子を取得する。カウンタセット識別子はグローバル一意識別子 (GUID) である。
%group
Win32 advapi32
%prm
szMachine, pCounterSetIds, cCounterSetIds, pcCounterSetIdsActual
szMachine : [wstr] カウンタセット識別子を取得するマシンの名前。NULL の場合、関数はローカルマシンのカウンタセット識別子を取得する。
pCounterSetIds : [var] cCounterSetIds パラメータで指定される数の GUID を受け取るのに十分な領域を持つバッファへのポインタ。cCounterSetIds が 0 の場合は NULL でよい。
cCounterSetIds : [int] pCounterSetIds パラメータで指定されるバッファのサイズ (GUID 単位)。
pcCounterSetIdsActual : [var] カウンタセット識別子を取得するのに実際に必要なバッファのサイズ。意味は関数が返す値に依存する。
%inst
指定したシステムに登録されているカウンタセットのカウンタセット識別子を取得する。カウンタセット識別子はグローバル一意識別子 (GUID)
である。

[戻り値]
（以下省略）


%index
PerfEnumerateCounterSetInstances
指定したシステム上のカウンタセットのアクティブインスタンスの名前と識別子を取得する。
%group
Win32 advapi32
%prm
szMachine, pCounterSetId, pInstances, cbInstances, pcbInstancesActual
szMachine : [wstr] pCounterSet パラメータで指定されたカウンタセットのアクティブインスタンスに関する情報を取得するマシンの名前。NULL の場合、関数はローカルマシンの指定したカウンタセットのアクティブインスタンスに関する情報を取得する。
pCounterSetId : [var] アクティブインスタンスに関する情報を取得するカウンタセットのカウンタセット識別子。
pInstances : [var] cbInstances パラメータで指定される量のデータを受け取るのに十分な大きさのバッファへのポインタ。cbInstances が 0 の場合は NULL でよい。
cbInstances : [int] pInstances パラメータで指定されるバッファのサイズ (バイト単位)。
pcbInstancesActual : [var] アクティブインスタンスに関する情報を取得するのに実際に必要なバッファのサイズ。意味は関数が返す値に依存する。
%inst
指定したシステム上のカウンタセットのアクティブインスタンスの名前と識別子を取得する。

[戻り値]
（以下省略）

[備考]
指定したカウンタセットのアクティブインスタンスに関する情報は、pInstances で指定されたバッファに
PERF_INSTANCE_HEADER ブロックのシーケンスとして書き込まれる。ブロックシーケンスのバイト単位のサイズは
pcbInstancesActual に書き込まれる。各 PERF_INSTANCE_HEADER ブロックは
PERF_INSTANCE_HEADER 構造体で構成され、直後に null 終端 UTF-16LE インスタンス名が続き、その後に
PERF_INSTANCE_HEADER ブロックのサイズが 8 バイトの倍数になるようにパディングが続く。


%index
PerfOpenQueryHandle
指定したシステム上のクエリを参照するハンドルを作成する。クエリはカウンタ仕様のリストである。
%group
Win32 advapi32
%prm
szMachine, phQuery
szMachine : [wstr] クエリハンドルを取得するマシンの名前。
phQuery : [intptr] クエリへのハンドル。不要になったら PerfCloseQueryHandle を呼び出してこのハンドルを閉じる。
%inst
指定したシステム上のクエリを参照するハンドルを作成する。クエリはカウンタ仕様のリストである。

[戻り値]
関数が成功した場合、ERROR_SUCCESS を返す。
関数が失敗した場合、戻り値はシステムエラーコードである。

[備考]
リストにカウンタ仕様を追加または削除するには PerfAddCounters および PerfDeleteCounters
を使用する。現在リストにあるカウンタ仕様を取得し、PerfQueryCounterData
が各カウンタのデータを返すインデックスを決定するには PerfQueryCounterInfo
を使用する。カウンタ仕様に一致するカウンタの値を取得するには PerfQueryCounterData を使用する。


%index
PerfQueryCounterData
指定したクエリ内のカウンタ仕様に一致するパフォーマンスカウンタの値を取得する。
%group
Win32 advapi32
%prm
hQuery, pCounterBlock, cbCounterBlock, pcbCounterBlockActual
hQuery : [intptr] 値を取得するパフォーマンスカウンタのカウンタ仕様のクエリへのハンドル。
pCounterBlock : [var] cbCounterBlock パラメータで指定される量のデータをバイト単位で受け取るのに十分な領域を持つバッファへのポインタ。cbCounterBlock が 0 の場合は NULL でよい。
cbCounterBlock : [int] pCounterBlock パラメータで指定されるバッファのサイズ (バイト単位)。
pcbCounterBlockActual : [var] パフォーマンスカウンタ値を取得するのに実際に必要なバッファのサイズ。意味は関数が返す値に依存する。
%inst
指定したクエリ内のカウンタ仕様に一致するパフォーマンスカウンタの値を取得する。

[戻り値]
（以下省略）

[備考]
パフォーマンスカウンタ値に関する情報は、pCounterBlock で指定されたバッファに PERF_DATA_HEADER
ブロックとして書き込まれる。これは PERF_DATA_HEADER 構造体と PERF_COUNTER_HEADER
ブロックのシーケンスで構成される。


%index
PerfQueryCounterInfo
指定したクエリ内のカウンタ仕様を取得する。
%group
Win32 advapi32
%prm
hQuery, pCounters, cbCounters, pcbCountersActual
hQuery : [intptr] カウンタ仕様を取得するクエリへのハンドル。
pCounters : [var] cbCounters パラメータで指定される量のデータをバイト単位で保持するのに十分な大きさのバッファへのポインタ。cbCounters が 0 の場合は NULL でよい。
cbCounters : [int] pCounters バッファのサイズ (バイト単位)。
pcbCountersActual : [var] カウンタ仕様を取得するのに実際に必要なバッファのサイズ。意味は関数が返す値に依存する。
%inst
指定したクエリ内のカウンタ仕様を取得する。

[戻り値]
（以下省略）

[備考]
カウンタ仕様に関する情報は、pCounters で指定されたバッファに PERF_COUNTER_IDENTIFIER
ブロックのシーケンスとして書き込まれる。ブロックシーケンスのバイト単位のサイズは pcbCountersActual に書き込まれる。各
PERF_COUNTER_IDENTIFIER ブロックは PERF_COUNTER_IDENTIFIER 構造体で構成され、任意で
null 終端 UTF-16LE インスタンス名が続き、その後に PERF_COUNTER_IDENTIFIER ブロックのサイズが 8
バイトの倍数になるようにパディングが続く。


%index
PerfQueryCounterSetRegistrationInfo
指定したシステム上のカウンタセットに関する情報を取得する。
%group
Win32 advapi32
%prm
szMachine, pCounterSetId, requestCode, requestLangId, pbRegInfo, cbRegInfo, pcbRegInfoActual
szMachine : [wstr] pCounterSet パラメータで指定されたカウンタセットに関する情報を取得するマシンの名前。NULL の場合、関数はローカルマシンの指定したカウンタセットに関する情報を取得する。
pCounterSetId : [var] 情報を取得するカウンタセットのカウンタセット識別子。
requestCode : [int] カウンタセットに関して取得したい情報の種類。可能な値のリストについては PerfRegInfoType を参照。
requestLangId : [int] requestCode が PERF_REG_COUNTERSET_NAME_STRING、PERF_REG_COUNTERSET_HELP_STRING、PERF_REG_COUNTER_NAME_STRINGS、または PERF_REG_COUNTER_HELP_STRINGS の場合、要求された情報を含む文字列の優先ロケール識別子。requestCode が PERF_REG_COUNTER_STRUCT の場合、データを取得するカウンタのカウンタ識別子。requestCode の他のすべての値では 0 に設定する。
pbRegInfo : [var] cbRegInfo パラメータで指定される量のデータをバイト単位で受け取るのに十分な大きさのバッファへのポインタ。cbRegInfo が 0 の場合は NULL でよい。
cbRegInfo : [int] pbRegInfo パラメータで指定されるバッファのサイズ (バイト単位)。
pcbRegInfoActual : [var] カウンタセットに関する情報を取得するのに実際に必要なバッファのサイズ。意味は関数が返す値に依存する。
%inst
指定したシステム上のカウンタセットに関する情報を取得する。

[戻り値]
（以下省略）

[備考]
要求できるデータの種類と各種要求で提供されるデータの形式については PerfRegInfoType を参照。


%index
PrivilegeCheck
指定した特権のセットがアクセストークンで有効かどうかを判定する。
%group
Win32 advapi32
%prm
ClientToken, RequiredPrivileges, pfResult
ClientToken : [intptr] クライアントプロセスを表すアクセストークンへのハンドル。このハンドルはクライアントを偽装するスレッドのトークンを開くことで取得する必要がある。トークンは TOKEN_QUERY アクセスで開く必要がある。
RequiredPrivileges : [var] PRIVILEGE_SET 構造体へのポインタ。この構造体の Privilege メンバは LUID_AND_ATTRIBUTES 構造体の配列である。PrivilegeCheck を呼び出す前に、確認する特権のセットを示すために Privilege 配列を使用する。すべての特権が有効でなければならない場合は Control メンバを PRIVILEGE_SET_ALL_NECESSARY に設定する。特権のいずれか 1 つが有効であれば十分な場合はゼロに設定する。
pfResult : [var] 指定された特権のいずれか、またはすべてがアクセストークンで有効かどうかを示すために関数が設定する値へのポインタ。PRIVILEGE_SET 構造体の Control メンバが PRIVILEGE_SET_ALL_NECESSARY を指定する場合、すべての特権が有効な場合にのみこの値は TRUE になる。それ以外の場合、いずれかの特権が有効であればこの値は TRUE になる。
%inst
指定した特権のセットがアクセストークンで有効かどうかを判定する。

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 である。拡張エラー情報を取得するには
GetLastError を呼び出す。

[備考]

アクセストークンには、トークンに関連付けられたアカウントが保持する特権のリストが含まれる。これらの特権は有効または無効にできるが、ほとんどは既定で無効である。PrivilegeCheck
関数は有効な特権のみを確認する。アクセストークンが保持するすべての有効および無効な特権のリストを取得するには、GetTokenInformation
関数を呼び出す。アクセストークン内の特権のセットを有効または無効にするには、AdjustTokenPrivileges 関数を呼び出す。


%index
PrivilegedServiceAuditAlarmW
セキュリティイベントログに監査メッセージを生成する。(PrivilegedServiceAuditAlarmW)
%group
Win32 advapi32
%prm
SubsystemName, ServiceName, ClientToken, Privileges, AccessGranted
SubsystemName : [wstr] 関数を呼び出すサブシステムの名前を指定する null 終端文字列へのポインタ。この情報はセキュリティイベントログレコードに現れる。
ServiceName : [wstr] 特権サブシステムサービスの名前を指定する null 終端文字列へのポインタ。この情報はセキュリティイベントログレコードに現れる。
ClientToken : [intptr] 操作を要求したクライアントを表すアクセストークンを識別する。このハンドルはクライアントを偽装するスレッドのトークンを開くことで取得する必要がある。トークンは TOKEN_QUERY アクセスで開く必要がある。関数はセキュリティイベントログレコードのクライアント ID を取得するためにこのトークンを使用する。
Privileges : [var] クライアントが使用しようとした特権を含む PRIVILEGE_SET 構造体へのポインタ。特権の名前はセキュリティイベントログレコードに現れる。
AccessGranted : [int] クライアントの特権使用の試みが成功したかどうかを示す。この値が TRUE の場合、セキュリティイベントログレコードは成功を示す。この値が FALSE の場合、セキュリティイベントログレコードは失敗を示す。
%inst
セキュリティイベントログに監査メッセージを生成する。(PrivilegedServiceAuditAlarmW)

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 である。拡張エラー情報を取得するには
GetLastError を呼び出す。

[備考]
PrivilegedServiceAuditAlarm
関数はクライアントのアクセストークンを確認して特権が保持または有効になっているかどうかを判断しない。通常、最初に
PrivilegeCheck 関数を呼び出して特定の特権がアクセストークンで有効かどうかを判断し、次に
PrivilegedServiceAuditAlarm
を呼び出して結果をログに記録する。PrivilegedServiceAuditAlarm 関数は、呼び出し元プロセスが
SE_AUDIT_NAME
特権を有効にしていることを必要とする。この特権のテストは常に呼び出し元プロセスのプライマリトークンに対して実行される。これにより、呼び出し元プロセスは呼び出し中にクライアントを偽装できる。


%index
ProcessTrace
1 つ以上のトレース処理セッションからコンシューマにイベントを配信する。
%group
Win32 advapi32
%prm
HandleArray, HandleCount, StartTime, EndTime
HandleArray : [var] 以前の [OpenTrace](/windows/win32/api/evntrace/nf-evntrace-opentracea) 関数の呼び出しで取得したトレース処理セッションハンドルの配列へのポインタ。配列には最大 64 個のファイル処理セッションハンドル、または 1 個のリアルタイム処理セッションハンドルを含めることができる。配列にファイル処理セッションハンドルとリアルタイム処理セッションハンドルの両方を含めることはできない。
HandleCount : [int] _HandleArray_ の要素数。
StartTime : [var] イベントを受け取る開始時刻を指定する任意の [FILETIME](/windows/win32/api/minwinbase/ns-minwinbase-filetime) 構造体へのポインタ。関数は _StartTime_ より前のタイムスタンプを持つイベントを配信しない。
EndTime : [var] イベントを受け取る終了時刻を指定する任意の [FILETIME](/windows/win32/api/minwinbase/ns-minwinbase-filetime) 構造体へのポインタ。関数は _EndTime_ 以降のタイムスタンプを持つイベントを配信しない。**Windows Server 2003:** この値はリアルタイムイベント配信では無視される。
%inst
1 つ以上のトレース処理セッションからコンシューマにイベントを配信する。

[戻り値]
関数が成功した場合、戻り値は ERROR_SUCCESS である。関数が失敗した場合、戻り値は [system error
codes](/windows/win32/debug/system-error-codes) のいずれかである。
（以下省略）

[備考]
トレースコンシューマは、1
つ以上のトレース処理セッションからイベントを処理するためにこの関数を呼び出す。この関数は処理が終了するまでブロックする。**ProcessTrace**
を呼び出す前に、[OpenTrace](/windows/win32/api/evntrace/nf-evntrace-opentracea)
を使用してトレース処理セッションへのハンドルを開く。**ProcessTrace** 関数は、コンシューマの
[BufferCallback](/windows/win32/api/evntrace/nc-evntrace-pevent_trace_buffer_callbacka)、[EventCallback](/windows/win32/api/evntrace/nc-evntrace-pevent_callback)、[EventRecordCallback](/windows/win32/api/evntrace/nc-evntrace-pevent_record_callback)
コールバック関数を呼び出すことで、セッションからのイベントを配信する。
（以下省略）


%index
QueryAllTracesW
QueryAllTracesW (Unicode) 関数 (evntrace.h) は、呼び出し元がクエリできるすべてのイベントトレースセッションのプロパティと統計を取得する。
%group
Win32 advapi32
%prm
PropertyArray, PropertyArrayCount, LoggerCount
PropertyArray : [var] イベントトレースセッションのセッションプロパティと統計を受け取る [EVENT_TRACE_PROPERTIES](/windows/desktop/ETW/event-trace-properties) 構造体へのポインタの配列。[EVENT_TRACE_PROPERTIES](/windows/desktop/ETW/event-trace-properties) 構造体の **Wnode.BufferSize**、**LoggerNameOffset**、**LogFileNameOffset** メンバのみを設定すればよい。他のメンバはすべてゼロに設定する必要がある。
PropertyArrayCount : [int] _PropertyArray_ 配列の構造体の数。この値は ETW がサポートする最大イベントトレースセッション数である 64 以下でなければならない。**Windows 10:** _PropertyArrayCount_ は 64 より大きくてもよく、一部のシステムでは 64 を超えるトレースセッションをサポートすることがある。
LoggerCount : [var] コンピュータ上で開始されたイベントトレースセッションの実際の数。
%inst
QueryAllTracesW (Unicode) 関数 (evntrace.h)
は、呼び出し元がクエリできるすべてのイベントトレースセッションのプロパティと統計を取得する。

[戻り値]
関数が成功した場合、戻り値は ERROR_SUCCESS である。関数が失敗した場合、戻り値は [system error
codes](/windows/win32/debug/system-error-codes) のいずれかである。
（以下省略）

[備考]

イベントトレースコントローラがこの関数を呼び出す。この関数は、呼び出し元がクエリする権限を持つトレースセッションを取得する。昇格された管理者特権で実行しているユーザー、Performance
Log Users グループのユーザー、LocalSystem、LocalService、NetworkService
として実行されているサービスは、すべてのトレースセッションを表示できる。この関数はプライベートロギングセッションを返さない。単一セッションの情報を取得するには、[ControlTrace](/windows/desktop/ETW/controltrace)
関数を使用し、_ControlCode_ パラメータを **EVENT_TRACE_CONTROL_QUERY** に設定する。


%index
QueryRecoveryAgentsOnEncryptedFile
指定されたファイルに対する回復エージェントの一覧を取得する。
%group
Win32 advapi32
%prm
lpFileName, pRecoveryAgents
lpFileName : [wstr] ファイルの名前。
pRecoveryAgents : [var] 回復エージェントの一覧を受け取る ENCRYPTION_CERTIFICATE_HASH_LIST 構造体へのポインタ。
%inst
指定されたファイルに対する回復エージェントの一覧を取得する。

[戻り値]
関数が成功した場合、戻り値は ERROR_SUCCESS
となる。関数が失敗した場合、戻り値はシステムエラーコードとなる。エラーコードの完全な一覧については、システムエラーコードまたはヘッダファイル
WinError.h を参照のこと。

[備考]
回復エージェントの一覧が不要になったら、FreeEncryptionCertificateHashList
関数を呼び出して解放する。Windows 8、Windows Server 2012 以降では、本関数は以下の技術によってサポートされる。
（以下省略）


%index
QuerySecurityAccessMask
指定したオブジェクトのセキュリティ情報を問い合わせるために必要となるアクセス権限を表すアクセスマスクを作成する。
%group
Win32 advapi32
%prm
SecurityInformation, DesiredAccess
SecurityInformation : [int] 問い合わせ対象のセキュリティ情報を指定する SECURITY_INFORMATION 構造体。
DesiredAccess : [var] この関数が作成するアクセスマスクへのポインタ。
%inst
指定したオブジェクトのセキュリティ情報を問い合わせるために必要となるアクセス権限を表すアクセスマスクを作成する。


%index
QueryServiceConfigW
指定したサービスの構成パラメータを取得する。(Unicode)
%group
Win32 advapi32
%prm
hService, lpServiceConfig, cbBufSize, pcbBytesNeeded
hService : [intptr] サービスへのハンドル。このハンドルは OpenService または CreateService 関数が返すもので、SERVICE_QUERY_CONFIG アクセス権を持っている必要がある。詳細はサービスのセキュリティとアクセス権を参照のこと。
lpServiceConfig : [var] サービス構成情報を受け取るバッファへのポインタ。データの形式は QUERY_SERVICE_CONFIG 構造体である。この配列の最大サイズは 8K バイトである。必要なサイズを調べるには、このパラメータに NULL、cbBufSize パラメータに 0 を指定する。関数は失敗し、GetLastError は ERROR_INSUFFICIENT_BUFFER を返す。pcbBytesNeeded パラメータが必要なサイズを受け取る。
cbBufSize : [int] lpServiceConfig パラメータが指すバッファのサイズ（バイト単位）。
pcbBytesNeeded : [var] 関数が ERROR_INSUFFICIENT_BUFFER で失敗した場合に、構成情報全体を格納するために必要なバイト数を受け取る変数へのポインタ。
%inst
指定したサービスの構成パラメータを取得する。(Unicode)

[戻り値]
関数が成功した場合、戻り値は 0 以外となる。
関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには GetLastError
を呼び出す。以下のエラーコードがサービス制御マネージャによって設定される場合がある。そのほかのエラーコードは、サービス制御マネージャが呼び出すレジストリ関数によって設定される場合がある。
（以下省略）

[備考]
QueryServiceConfig
関数は、特定のサービスについてレジストリに保持されているサービス構成情報を返す。この構成情報は、最初にサービス制御プログラムが
CreateService 関数で設定する。その後、サービス構成プログラムが ChangeServiceConfig
関数で更新している場合もある。構成情報が最後に変更されたときにサービスが実行中であった場合、QueryServiceConfig
が返す情報はサービスの現在の構成を反映せず、次回実行時の構成を反映する。ただし DisplayName
キーは例外で、変更するとサービスが実行中かどうかに関わらず即座に反映される。


%index
QueryServiceConfig2A
指定したサービスの省略可能な構成パラメータを取得する。(ANSI)
%group
Win32 advapi32
%prm
hService, dwInfoLevel, lpBuffer, cbBufSize, pcbBytesNeeded
hService : [intptr] サービスへのハンドル。このハンドルは OpenService または CreateService 関数が返すもので、SERVICE_QUERY_CONFIG アクセス権を持っている必要がある。詳細はサービスのセキュリティとアクセス権を参照のこと。
dwInfoLevel : [int] 
lpBuffer : [var] サービス構成情報を受け取るバッファへのポインタ。このデータの形式は dwInfoLevel パラメータの値に依存する。この配列の最大サイズは 8K バイトである。必要なサイズを調べるには、このパラメータに NULL、cbBufSize パラメータに 0 を指定する。関数は失敗し、GetLastError は ERROR_INSUFFICIENT_BUFFER を返す。pcbBytesNeeded パラメータが必要なサイズを受け取る。
cbBufSize : [int] lpBuffer パラメータが指すバッファのサイズ（バイト単位）。
pcbBytesNeeded : [var] 関数が ERROR_INSUFFICIENT_BUFFER で失敗した場合に、構成情報を格納するために必要なバイト数を受け取る変数へのポインタ。
%inst
指定したサービスの省略可能な構成パラメータを取得する。(ANSI)

[戻り値]
関数が成功した場合、戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError
を呼び出す。以下のエラーコードがサービス制御マネージャによって設定される場合がある。そのほかのエラーコードは、サービス制御マネージャが呼び出すレジストリ関数によって設定される場合がある。
（以下省略）

[備考]
QueryServiceConfig2
関数は、指定したサービスについてサービス制御マネージャのデータベースに格納されている省略可能な構成情報を返す。この構成情報は
ChangeServiceConfig2 関数で変更できる。追加の構成情報は、ChangeServiceConfig および
QueryServiceConfig 関数を使用してそれぞれ変更・問い合わせができる。


%index
QueryServiceConfig2W
指定したサービスの省略可能な構成パラメータを取得する。(Unicode)
%group
Win32 advapi32
%prm
hService, dwInfoLevel, lpBuffer, cbBufSize, pcbBytesNeeded
hService : [intptr] サービスへのハンドル。このハンドルは OpenService または CreateService 関数が返すもので、SERVICE_QUERY_CONFIG アクセス権を持っている必要がある。詳細はサービスのセキュリティとアクセス権を参照のこと。
dwInfoLevel : [int] 
lpBuffer : [var] サービス構成情報を受け取るバッファへのポインタ。このデータの形式は dwInfoLevel パラメータの値に依存する。この配列の最大サイズは 8K バイトである。必要なサイズを調べるには、このパラメータに NULL、cbBufSize パラメータに 0 を指定する。関数は失敗し、GetLastError は ERROR_INSUFFICIENT_BUFFER を返す。pcbBytesNeeded パラメータが必要なサイズを受け取る。
cbBufSize : [int] lpBuffer パラメータが指すバッファのサイズ（バイト単位）。
pcbBytesNeeded : [var] 関数が ERROR_INSUFFICIENT_BUFFER で失敗した場合に、構成情報を格納するために必要なバイト数を受け取る変数へのポインタ。
%inst
指定したサービスの省略可能な構成パラメータを取得する。(Unicode)

[戻り値]
関数が成功した場合、戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError
を呼び出す。以下のエラーコードがサービス制御マネージャによって設定される場合がある。そのほかのエラーコードは、サービス制御マネージャが呼び出すレジストリ関数によって設定される場合がある。
（以下省略）

[備考]
QueryServiceConfig2
関数は、指定したサービスについてサービス制御マネージャのデータベースに格納されている省略可能な構成情報を返す。この構成情報は
ChangeServiceConfig2 関数で変更できる。追加の構成情報は、ChangeServiceConfig および
QueryServiceConfig 関数を使用してそれぞれ変更・問い合わせができる。


%index
QueryServiceDynamicInformation
現在のサービス開始に関連する動的情報を取得する。
%group
Win32 advapi32
%prm
hServiceStatus, dwInfoLevel, ppDynamicInfo
hServiceStatus : [intptr] RegisterServiceCtrlHandlerEx によって提供されるサービスステータスハンドル。
dwInfoLevel : [int] 情報のレベルを示す。
ppDynamicInfo : [var] 動的情報バッファ。このパラメータが有効な場合、コールバック関数は使用後に LocalFree 関数でバッファを解放しなければならない。
%inst
現在のサービス開始に関連する動的情報を取得する。

[戻り値]
関数が成功した場合、戻り値は TRUE となる。関数が失敗した場合、戻り値は FALSE となる。この場合、GetLastError
関数を呼び出してエラーコードを取得する。


%index
QueryServiceLockStatusW
指定したサービス制御マネージャデータベースのロック状態を取得する。(Unicode)
%group
Win32 advapi32
%prm
hSCManager, lpLockStatus, cbBufSize, pcbBytesNeeded
hSCManager : [intptr] サービス制御マネージャデータベースへのハンドル。OpenSCManager 関数がこのハンドルを返し、SC_MANAGER_QUERY_LOCK_STATUS アクセス権を持っている必要がある。詳細はサービスのセキュリティとアクセス権を参照のこと。
lpLockStatus : [var] 指定したデータベースのロック状態を受け取る QUERY_SERVICE_LOCK_STATUS 構造体へのポインタ。メンバが指す文字列も併せて返される。
cbBufSize : [int] lpLockStatus パラメータが指すバッファのサイズ（バイト単位）。
pcbBytesNeeded : [var] 関数が失敗した場合に、すべてのロック状態情報を返すために必要なバイト数を受け取る変数へのポインタ。
%inst
指定したサービス制御マネージャデータベースのロック状態を取得する。(Unicode)

[戻り値]
関数が成功した場合、戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError
を呼び出す。以下のエラーコードがサービス制御マネージャによって設定される場合がある。そのほかのエラーコードは、サービス制御マネージャが呼び出すレジストリ関数によって設定される場合がある。
（以下省略）

[備考]
QueryServiceLockStatus 関数は、指定したデータベースがロックされているかどうかを示す
QUERY_SERVICE_LOCK_STATUS
構造体を返す。データベースがロックされている場合、この構造体はロックを所有するユーザのアカウント名とロックが保持されている時間の長さを提供する。プロセスは
LockServiceDatabase
関数を呼び出してサービス制御マネージャデータベースのロックの所有権を取得し、UnlockServiceDatabase
関数を呼び出してロックを解放する。
> [!NOTE] > winsvc.h ヘッダは QueryServiceLockStatus
をエイリアスとして定義しており、UNICODE プリプロセッサ定数の定義に基づいて ANSI または Unicode
版を自動的に選択する。エンコーディングに中立なエイリアスをエンコーディング中立でないコードと混在させると、コンパイル時または実行時エラーとなる可能性がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照のこと。


%index
QueryServiceObjectSecurity
サービスオブジェクトに関連付けられたセキュリティ記述子のコピーを取得する。
%group
Win32 advapi32
%prm
hService, dwSecurityInformation, lpSecurityDescriptor, cbBufSize, pcbBytesNeeded
hService : [intptr] サービス制御マネージャまたはサービスへのハンドル。サービス制御マネージャへのハンドルは OpenSCManager 関数が返し、サービスへのハンドルは OpenService または CreateService 関数が返す。ハンドルは READ_CONTROL アクセス権を持っている必要がある。
dwSecurityInformation : [int] 取得するセキュリティ情報の種類を示すビットフラグの集合。このパラメータには SECURITY_INFORMATION ビットフラグの組み合わせを指定できるが、本関数は LABEL_SECURITY_INFORMATION 値をサポートしない。
lpSecurityDescriptor : [int] 指定したサービスオブジェクトのセキュリティ記述子のコピーを受け取るバッファへのポインタ。呼び出し側プロセスは、セキュリティ記述子の指定された部分を参照するための適切なアクセス権を持っている必要がある。SECURITY_DESCRIPTOR 構造体は自己相対形式で返される。
cbBufSize : [int] lpSecurityDescriptor パラメータが指すバッファのサイズ（バイト単位）。最大サイズは 8 キロバイトである。
pcbBytesNeeded : [var] 関数が失敗した場合に、要求したセキュリティ記述子情報を返すために必要なバイト数を受け取る変数へのポインタ。
%inst
サービスオブジェクトに関連付けられたセキュリティ記述子のコピーを取得する。

[戻り値]
関数が成功した場合、戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError
を呼び出す。以下のエラーコードがサービス制御マネージャによって設定される場合がある。そのほかのエラーコードは、サービス制御マネージャが呼び出すレジストリ関数によって設定される場合がある。
（以下省略）

[備考]

サービスが作成されると、サービス制御マネージャはそのサービスオブジェクトに既定のセキュリティ記述子を割り当てる。サービスオブジェクトのセキュリティ記述子のコピーを取得するには、QueryServiceObjectSecurity
関数を呼び出す。セキュリティ記述子を変更するには、SetServiceObjectSecurity
関数を呼び出す。サービスオブジェクトの既定のセキュリティ記述子については、サービスのセキュリティとアクセス権を参照のこと。サービスオブジェクトのセキュリティ記述子から所有者、グループ、DACL
を読み取るには、ハンドルを開く際に呼び出し側プロセスに READ_CONTROL
アクセスが付与されている必要がある。READ_CONTROL
アクセスを取得するには、呼び出し側がオブジェクトの所有者であるか、オブジェクトの DACL
がそのアクセスを許可している必要がある。セキュリティ記述子から SACL を読み取るには、ハンドルを開く際に呼び出し側プロセスに
ACCESS_SYSTEM_SECURITY
アクセスが付与されている必要がある。このアクセスを取得する正しい方法は、呼び出し側の現在のトークンで SE_SECURITY_NAME
特権を有効にし、ACCESS_SYSTEM_SECURITY アクセスでハンドルを開き、その後特権を無効にすることである。


%index
QueryServiceStatus
指定したサービスの現在の状態を取得する。
%group
Win32 advapi32
%prm
hService, lpServiceStatus
hService : [intptr] サービスへのハンドル。このハンドルは OpenService または CreateService 関数が返すもので、SERVICE_QUERY_STATUS アクセス権を持っている必要がある。詳細はサービスのセキュリティとアクセス権を参照のこと。
lpServiceStatus : [var] 状態情報を受け取る SERVICE_STATUS 構造体へのポインタ。
%inst
指定したサービスの現在の状態を取得する。

[戻り値]
関数が成功した場合、戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError
を呼び出す。以下のエラーコードがサービス制御マネージャによって設定される場合がある。そのほかのエラーコードは、サービス制御マネージャが呼び出すレジストリ関数によって設定される場合がある。
（以下省略）

[備考]
QueryServiceStatus
関数は、サービス制御マネージャに最後に報告されたサービス状態情報を返す。サービスが状態を変更した直後であれば、まだサービス制御マネージャに反映されていない場合がある。


%index
QueryServiceStatusEx
指定した情報レベルに基づき、指定したサービスの現在の状態を取得する。
%group
Win32 advapi32
%prm
hService, InfoLevel, lpBuffer, cbBufSize, pcbBytesNeeded
hService : [intptr] サービスへのハンドル。このハンドルは CreateService または OpenService 関数が返すもので、SERVICE_QUERY_STATUS アクセス権を持っている必要がある。詳細はサービスのセキュリティとアクセス権を参照のこと。
InfoLevel : [int] 返すべきサービス属性。サービスの状態情報を取得するには SC_STATUS_PROCESS_INFO を使用する。lpBuffer パラメータは SERVICE_STATUS_PROCESS 構造体へのポインタとなる。
lpBuffer : [var] 状態情報を受け取るバッファへのポインタ。このデータの形式は InfoLevel パラメータの値に依存する。この配列の最大サイズは 8K バイトである。必要なサイズを調べるには、このパラメータに NULL、cbBufSize パラメータに 0 を指定する。関数は失敗し、GetLastError は ERROR_INSUFFICIENT_BUFFER を返す。pcbBytesNeeded パラメータが必要なサイズを受け取る。
cbBufSize : [int] lpBuffer パラメータが指すバッファのサイズ（バイト単位）。
pcbBytesNeeded : [var] 関数が ERROR_INSUFFICIENT_BUFFER で失敗した場合に、すべての状態情報を格納するために必要なバイト数を受け取る変数へのポインタ。
%inst
指定した情報レベルに基づき、指定したサービスの現在の状態を取得する。

[戻り値]
関数が成功した場合、戻り値は 0 以外となる。
関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには GetLastError
を呼び出す。次のエラーが返される場合がある。
（以下省略）

[備考]
QueryServiceStatusEx
関数は、サービス制御マネージャに最後に報告されたサービス状態情報を返す。サービスが状態を変更した直後であれば、まだサービス制御マネージャに反映されていない場合がある。SERVICE_STATUS_PROCESS
構造体で返されるプロセス識別子は、サービスの状態が
SERVICE_RUNNING、SERVICE_PAUSE_PENDING、SERVICE_PAUSED、SERVICE_CONTINUE_PENDING
のいずれかである場合に有効である。サービスが SERVICE_START_PENDING または SERVICE_STOP_PENDING
の状態の場合、プロセス識別子は有効でない場合があり、SERVICE_STOPPED 状態ではけっして有効ではない。


%index
QueryTraceW
QueryTraceW (Unicode) 関数 (evntrace.h) は、指定したイベントトレースセッションのプロパティ設定とセッション統計情報を取得する。
%group
Win32 advapi32
%prm
TraceHandle, InstanceName, Properties
TraceHandle : [int] 問い合わせ対象のイベントトレースセッションへのハンドル、または 0。_InstanceName_ が **NULL** の場合は、0 以外の _TraceHandle_ を指定する必要がある。このパラメータは _InstanceName_ が **NULL** の場合にのみ使用される。ハンドルは [StartTrace](/windows/win32/api/evntrace/nf-evntrace-starttracew) が返す。
InstanceName : [wstr] 問い合わせ対象のイベントトレースセッションの名前、または **NULL**。_TraceHandle_ が 0 の場合は _InstanceName_ を指定する必要がある。NT カーネルロガーセッションを指定するには、_InstanceName_ に **KERNEL_LOGGER_NAME** を設定する。
Properties : [var] 初期化済みの [EVENT_TRACE_PROPERTIES](/windows/desktop/ETW/event-trace-properties) 構造体へのポインタ。[EVENT_TRACE_PROPERTIES](/windows/desktop/ETW/event-trace-properties) 構造体の **Wnode.BufferSize** メンバのみ設定する必要がある。バッファサイズとオフセットが不明な場合、最大セッション名（1024 文字）と最大ログファイル名（1024 文字）の長さを用いて計算できる。出力時には、構造体のメンバにイベントトレースセッションのプロパティ設定とセッション統計情報が格納される。**Windows 10 バージョン 1703 以降:** プロセス間シナリオでのパフォーマンス向上のため、システムワイドなプライベートロガーに対して **QueryTrace** にフィルタリング情報を渡せるようになった。フィルタリング情報を含めるには、新しい [EVENT_TRACE_PROPERTIES_V2](/windows/desktop/ETW/event-trace-properties-v2) 構造体を渡す必要がある。詳細については [Configuring and Starting a Private Logger Session](/windows/desktop/ETW/configuring-and-starting-a-private-logger-session) を参照のこと。
%inst
QueryTraceW (Unicode) 関数 (evntrace.h)
は、指定したイベントトレースセッションのプロパティ設定とセッション統計情報を取得する。

[戻り値]
関数が成功した場合、戻り値は ERROR_SUCCESS となる。関数が失敗した場合、戻り値は
[システムエラーコード](/windows/win32/debug/system-error-codes)
のいずれかとなる。以下は代表的なエラーとその原因である。- **ERROR_BAD_LENGTH** 次のいずれかが発生している: -
_Properties_ の **Wnode.BufferSize** メンバが不正なサイズを指定している。- _Properties_
にセッション名とログファイル名（使用時）のコピーを保持するための十分な領域が割り当てられていない。-
**ERROR_INVALID_PARAMETER** 次のいずれかが発生している: - _Properties_ が
**NULL**。- _InstanceName_ と _TraceHandle_ の両方が **NULL**。-
_InstanceName_ が **NULL** で _TraceHandle_ が有効なハンドルでない。-
**ERROR_ACCESS_DENIED** 管理者特権で実行しているユーザ、Performance Log Users
グループのユーザ、および LocalSystem / LocalService / NetworkService
として実行中のサービスのみイベントトレースセッションを問い合わせできる。制限付きユーザにトレースセッションの問い合わせ権限を付与するには、Performance
Log Users
グループに追加するか、[EventAccessControl](/windows/desktop/api/evntcons/nf-evntcons-eventaccesscontrol)
を参照のこと。**Windows XP および Windows 2000:** 誰でもトレースセッションを制御できる。-
**ERROR_WMI_INSTANCE_NOT_FOUND** 指定されたセッションが実行されていない。

[備考]
イベントトレースコントローラがこの関数を呼び出す。この関数は廃止予定である。代わりに、_ControlCode_ を
**EVENT_TRACE_CONTROL_QUERY** に設定した
[ControlTrace](/windows/win32/api/evntrace/nf-evntrace-controltracew)
を使用する。> [!NOTE] > evntrace.h ヘッダは QueryTrace をエイリアスとして定義しており、UNICODE
プリプロセッサ定数の定義に基づいて ANSI または Unicode
版を自動的に選択する。エンコーディングに中立なエイリアスをエンコーディング中立でないコードと混在させると、コンパイル時または実行時エラーとなる可能性がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照のこと。


%index
QueryTraceProcessingHandle
OpenTrace によって開かれた ETW トレース処理セッションに関する情報を取得する。
%group
Win32 advapi32
%prm
ProcessingHandle, InformationClass, InBuffer, InBufferSize, OutBuffer, OutBufferSize, ReturnLength
ProcessingHandle : [int] データの問い合わせ対象となる、[OpenTrace](/windows/win32/api/evntrace/nf-evntrace-opentracea) で作成された有効なハンドル。
InformationClass : [int] ハンドルに対して行う操作の種類を指定する [ETW_PROCESS_HANDLE_INFO_TYPE](/windows/win32/api/evntrace/ne-evntrace-etw_process_handle_info_type) の値。
InBuffer : [intptr] 将来のために予約されている。NULL でもよい。
InBufferSize : [int] _InBuffer_ のサイズ（バイト単位）。
OutBuffer : [intptr] 出力データを受け取るために呼び出し側が用意するバッファ。
OutBufferSize : [int] _OutBuffer_ のサイズ（バイト単位）。
ReturnLength : [var] API が _OutBuffer_ に書き込んだデータのサイズ（バイト単位）。可変長の戻り値用に使用する。
%inst
OpenTrace によって開かれた ETW トレース処理セッションに関する情報を取得する。

[戻り値]
関数が成功した場合、戻り値は ERROR_SUCCESS となる。関数が失敗した場合、戻り値は
[システムエラーコード](/windows/win32/debug/system-error-codes) のいずれかとなる。


%index
QueryUsersOnEncryptedFile
指定されたファイルに対するユーザの一覧を取得する。
%group
Win32 advapi32
%prm
lpFileName, pUsers
lpFileName : [wstr] ファイルの名前。
pUsers : [var] ユーザの一覧を受け取る ENCRYPTION_CERTIFICATE_HASH_LIST 構造体へのポインタ。
%inst
指定されたファイルに対するユーザの一覧を取得する。

[戻り値]
関数が成功した場合、戻り値は ERROR_SUCCESS
となる。関数が失敗した場合、戻り値はシステムエラーコードとなる。エラーコードの完全な一覧については、システムエラーコードまたはヘッダファイル
WinError.h を参照のこと。

[備考]
ユーザの一覧が不要になったら、FreeEncryptionCertificateHashList 関数を呼び出して解放する。Windows
8、Windows Server 2012 以降では、本関数は以下の技術によってサポートされる。
（以下省略）


%index
ReadEncryptedFileRaw
暗号化されたファイルをバックアップ（エクスポート）する。
%group
Win32 advapi32
%prm
pfExportCallback, pvCallbackContext, pvContext
pfExportCallback : [int] エクスポートコールバック関数へのポインタ。システムはコールバック関数を複数回呼び出し、ファイル全体が読み取られるまで、その都度ファイルのデータブロックをコールバック関数に渡す。詳細については ExportCallback を参照のこと。
pvCallbackContext : [intptr] アプリケーションで定義および割り当てたコンテキストブロックへのポインタ。システムはこのポインタをパラメータとしてコールバック関数に渡し、コールバック関数がアプリケーション固有のデータにアクセスできるようにする。構造体でもよく、暗号化されたファイルのバックアップコピーを保持するファイルへのハンドルなど、アプリケーションが必要とする任意のデータを含めることができる。
pvContext : [intptr] システム定義のコンテキストブロックへのポインタ。このコンテキストブロックは OpenEncryptedFileRaw 関数が返す。変更してはならない。
%inst
暗号化されたファイルをバックアップ（エクスポート）する。

[戻り値]
関数が成功した場合、戻り値は ERROR_SUCCESS となる。関数が失敗した場合、WinError.h で定義された 0
以外のエラーコードを返す。FormatMessage に FORMAT_MESSAGE_FROM_SYSTEM
フラグを指定して呼び出すと、エラーの一般的なテキスト説明を取得できる。

[備考]

バックアップ対象のファイルは復号されず、暗号化されたままの状態でバックアップされる。暗号化されたファイルをバックアップするには、OpenEncryptedFileRaw
を呼び出してファイルを開き、次にアプリケーション定義のエクスポートコールバック関数のアドレスを渡して
ReadEncryptedFileRaw
を呼び出す。システムはこのコールバック関数を複数回呼び出し、ファイル全体の内容を読み取ってバックアップする。バックアップが完了したら、CloseEncryptedFileRaw
を呼び出してリソースを解放しファイルを閉じる。エクスポートコールバック関数の宣言方法については ExportCallback
を参照のこと。暗号化されたファイルを復元するには、ulFlags パラメータに CREATE_FOR_IMPORT を指定して
OpenEncryptedFileRaw を呼び出す。次に、アプリケーション定義のインポートコールバック関数のアドレスを渡して
WriteEncryptedFileRaw
を呼び出す。システムはこのコールバック関数を複数回呼び出し、ファイル全体の内容を読み取って復元する。復元が完了したら、CloseEncryptedFileRaw
を呼び出してリソースを解放しファイルを閉じる。インポートコールバック関数の宣言方法については ImportCallback
を参照のこと。この関数は暗号化されたファイルのみのバックアップを目的としている。暗号化されていないファイルのバックアップについては
BackupRead を参照のこと。Windows 8、Windows Server 2012
以降では、本関数は以下の技術によってサポートされる。
（以下省略）


%index
ReadEventLogW
指定したイベントログから、指定した数のエントリを読み取る。(Unicode)
%group
Win32 advapi32
%prm
hEventLog, dwReadFlags, dwRecordOffset, lpBuffer, nNumberOfBytesToRead, pnBytesRead, pnMinNumberOfBytesNeeded
hEventLog : [intptr] 読み取り対象のイベントログへのハンドル。OpenEventLog 関数がこのハンドルを返す。
dwReadFlags : [int] 
dwRecordOffset : [int] 読み取り操作を開始するログエントリのレコード番号。このパラメータは dwReadFlags に EVENTLOG_SEEK_READ フラグが含まれる場合以外は無視される。
lpBuffer : [intptr] 1 つ以上の EVENTLOGRECORD 構造体を受け取る、アプリケーションで割り当てたバッファ。このパラメータは、nNumberOfBytesToRead パラメータが 0 であっても NULL にできない。
nNumberOfBytesToRead : [int] lpBuffer バッファのサイズ（バイト単位）。この関数はバッファに収まるだけのログエントリを読み取る。部分的なエントリは返さない。
pnBytesRead : [var] 関数が読み取ったバイト数を受け取る変数へのポインタ。
pnMinNumberOfBytesNeeded : [var] lpBuffer バッファに必要なサイズを受け取る変数へのポインタ。この値は、関数が 0 を返し GetLastError が ERROR_INSUFFICIENT_BUFFER を返した場合にのみ有効である。
%inst
指定したイベントログから、指定した数のエントリを読み取る。(Unicode)

[戻り値]
関数が成功した場合、戻り値は 0 以外となる。
関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには GetLastError を呼び出す。

[備考]
この関数が正常に復帰すると、イベントログ内の読み取り位置は読み取ったレコード数の分だけ進められる。注意:
このソースの構成されたファイル名は、他のソースの構成されたファイル名でもある場合がある（複数のソースが 1
つのログのサブキーとして存在できる）。そのため、この関数は複数のソースによってログに記録されたイベントを返す場合がある。


%index
RegConnectRegistryW
別のコンピュータ上の定義済みレジストリキーへの接続を確立する。(Unicode)
%group
Win32 advapi32
%prm
lpMachineName, hKey, phkResult
lpMachineName : [wstr] リモートコンピュータの名前。文字列は次の形式である:
hKey : [intptr] 定義済みのレジストリハンドル。リモートコンピュータ上の以下の定義済みキーのいずれかを指定できる。
phkResult : [intptr] リモートコンピュータ上の定義済みハンドルを識別するキーハンドルを受け取る変数へのポインタ。
%inst
別のコンピュータ上の定義済みレジストリキーへの接続を確立する。(Unicode)

[戻り値]
関数が成功した場合、戻り値は ERROR_SUCCESS となる。関数が失敗した場合、戻り値は Winerror.h で定義された 0
以外のエラーコードとなる。FormatMessage 関数に FORMAT_MESSAGE_FROM_SYSTEM
フラグを指定して呼び出すと、エラーの一般的な説明を取得できる。

[備考]
RegConnectRegistry はリモートコンピュータ上で Remote Registry
サービスが実行されていることを要求する。既定では、このサービスは手動起動で構成されている。Remote Registry
サービスを自動起動するように構成するには、Services.msc を実行してサービスのスタートアップ種別を自動に変更する。Windows
Server 2003 および Windows XP/2000 では、Remote Registry
サービスは既定で自動起動するよう構成されている。RegConnectRegistry
が返したハンドルが不要になった場合、RegCloseKey
を呼び出して閉じるべきである。コンピュータがワークグループに参加しており、「ローカルアカウントの共有とセキュリティモデル」ポリシーで「ローカルアカウントへのネットワークログオンをゲストとして認証する」が有効になっている場合、関数は失敗する。このポリシーはコンピュータがワークグループに参加している場合、既定で有効になる点に注意のこと。現在のユーザがリモートコンピュータへの適切なアクセス権を持っていない場合、RegConnectRegistry
の呼び出しは失敗する。リモートレジストリに接続するには、RegConnectRegistry を呼び出す前に
LOGON32_LOGON_NEW_CREDENTIALS を指定して LogonUser
を呼び出し、ImpersonateLoggedOnUser を呼び出す。Windows 2000 では、別の資格情報を使用して IPC$
などの管理共有にセッションを確立する回避策が考えられる。現在のユーザ以外の資格情報を指定するには、WNetAddConnection2
関数を使用して共有に接続する。レジストリへのアクセスが完了したら、接続をキャンセルする。Windows XP Home Edition
では、この関数を使用して Windows XP Home Edition
を実行しているリモートコンピュータに接続することはできない。この関数は、Windows XP Home Edition
を実行しているローカルコンピュータ名でも動作する。これは認証層をバイパスするためである。
> [!NOTE] > winreg.h ヘッダは RegConnectRegistry をエイリアスとして定義しており、UNICODE
プリプロセッサ定数の定義に基づいて ANSI または Unicode
版を自動的に選択する。エンコーディングに中立なエイリアスをエンコーディング中立でないコードと混在させると、コンパイル時または実行時エラーとなる可能性がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照のこと。


%index
RegConnectRegistryExW
(no summary)
%group
Win32 advapi32
%prm
lpMachineName, hKey, Flags, phkResult
lpMachineName : [wstr] 
hKey : [intptr] 
Flags : [int] 
phkResult : [intptr] 
%inst



%index
RegCreateKeyW
指定したレジストリキーを作成する。キーがレジストリにすでに存在する場合、関数はそれを開く。(Unicode)
%group
Win32 advapi32
%prm
hKey, lpSubKey, phkResult
hKey : [intptr] 開かれているレジストリキーへのハンドル。呼び出し側プロセスはそのキーに対する KEY_CREATE_SUB_KEY アクセス権を持っている必要がある。詳細はレジストリキーのセキュリティとアクセス権を参照のこと。
lpSubKey : [wstr] この関数が開くか作成するキーの名前。このキーは hKey パラメータで識別されるキーのサブキーでなければならない。
phkResult : [intptr] 開いたまたは作成したキーへのハンドルを受け取る変数へのポインタ。キーが定義済みレジストリキーでない場合、ハンドルの使用が終わったら RegCloseKey 関数を呼び出す。
%inst
指定したレジストリキーを作成する。キーがレジストリにすでに存在する場合、関数はそれを開く。(Unicode)

[戻り値]
関数が成功した場合、戻り値は ERROR_SUCCESS となる。関数が失敗した場合、戻り値は Winerror.h で定義された 0
以外のエラーコードとなる。FormatMessage 関数に FORMAT_MESSAGE_FROM_SYSTEM
フラグを指定して呼び出すと、エラーの一般的な説明を取得できる。

[備考]
アプリケーションは HKEY_USERS や HKEY_LOCAL_MACHINE の直下のキーを作成できない。HKEY_USERS や
HKEY_LOCAL_MACHINE
ツリーのより下位のレベルではサブキーを作成できる。サービスやアプリケーションが複数のユーザをインパーソネートする場合、この関数を
HKEY_CURRENT_USER に対して使用してはならない。代わりに RegOpenCurrentUser
関数を呼び出す。RegCreateKey
関数は指定したパス内の不足するすべてのキーを作成する。この動作を利用して、複数のキーを一度に作成できる。たとえば、lpSubKey
パラメータに subkey1\subkey2\subkey3\subkey4 のような文字列を指定することで、4
レベル下のサブキーと同時に先行する 3
つのサブキーを作成できる。なお、パス内の既存キーのつづりが誤っている場合、この動作によって意図しないキーが作成される。
> [!NOTE] > winreg.h ヘッダは RegCreateKey をエイリアスとして定義しており、UNICODE
プリプロセッサ定数の定義に基づいて ANSI または Unicode
版を自動的に選択する。エンコーディングに中立なエイリアスをエンコーディング中立でないコードと混在させると、コンパイル時または実行時エラーとなる可能性がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照のこと。


%index
RegCreateKeyTransactedW
指定したレジストリキーを作成し、トランザクションに関連付ける。(Unicode)
%group
Win32 advapi32
%prm
hKey, lpSubKey, Reserved, lpClass, dwOptions, samDesired, lpSecurityAttributes, phkResult, lpdwDisposition, hTransaction, pExtendedParemeter
hKey : [intptr] 開かれているレジストリキーへのハンドル。呼び出し側プロセスはそのキーに対する KEY_CREATE_SUB_KEY アクセス権を持っている必要がある。詳細はレジストリキーのセキュリティとアクセス権を参照のこと。キー作成のアクセス権は、ハンドル取得時に指定したアクセスマスクではなく、レジストリキーのセキュリティ記述子に対して検査される。したがって、hKey が KEY_READ の samDesired で開かれていても、セキュリティ記述子が許可していればキー作成操作に使用できる。このハンドルは RegCreateKeyTransacted または RegOpenKeyTransacted 関数が返すか、以下の定義済みキーのいずれかを指定できる:
lpSubKey : [wstr] この関数が開くか作成するサブキーの名前。指定するサブキーは hKey パラメータで識別されるキーのサブキーでなければならず、レジストリツリー内で最大 32 レベルの深さまで指定できる。キー名に関する詳細はレジストリの構造を参照のこと。lpSubKey が空文字列へのポインタである場合、phkResult は hKey で指定したキーへの新しいハンドルを受け取る。このパラメータは NULL にできない。
Reserved : [int] このパラメータは予約されており、0 でなければならない。
lpClass : [wstr] このキーのユーザ定義クラス。このパラメータは無視される場合がある。NULL を指定できる。
dwOptions : [int] 
samDesired : [int] 作成するキーに対するアクセス権を指定するマスク。詳細はレジストリキーのセキュリティとアクセス権を参照のこと。
lpSecurityAttributes : [var] 子プロセスが返されたハンドルを継承できるかどうかを決定する SECURITY_ATTRIBUTES 構造体へのポインタ。lpSecurityAttributes が NULL の場合、ハンドルは継承できない。
phkResult : [intptr] 開いたまたは作成したキーへのハンドルを受け取る変数へのポインタ。キーが定義済みレジストリキーでない場合、ハンドルの使用が終わったら RegCloseKey 関数を呼び出す。
lpdwDisposition : [var] 次の処理結果値のいずれかを受け取る変数へのポインタ。
hTransaction : [intptr] アクティブなトランザクションへのハンドル。このハンドルは CreateTransaction 関数が返す。
pExtendedParemeter : [intptr] このパラメータは予約されており、NULL でなければならない。
%inst
指定したレジストリキーを作成し、トランザクションに関連付ける。(Unicode)

[戻り値]
関数が成功した場合、戻り値は ERROR_SUCCESS となる。関数が失敗した場合、戻り値は Winerror.h で定義された 0
以外のエラーコードとなる。FormatMessage 関数に FORMAT_MESSAGE_FROM_SYSTEM
フラグを指定して呼び出すと、エラーの一般的な説明を取得できる。

[備考]

この関数を使用してキーを作成すると、そのキーに対する後続の操作はトランザクション化される。トランザクションがコミットされる前に非トランザクション操作がキーに対して実行されると、トランザクションはロールバックされる。トランザクションがコミットまたはロールバックされた後、追加の操作をトランザクション化するには、アクティブなトランザクションハンドルを指定して
RegCreateKeyTransacted または RegOpenKeyTransacted
でキーを開き直す必要がある。トランザクションの詳細についてはカーネルトランザクションマネージャを参照のこと。このキーのサブキーに対する後続の操作は自動的にはトランザクション化されない点に注意のこと。したがって、RegDeleteKeyEx
はトランザクション化された削除操作を行わない。代わりに RegDeleteKeyTransacted
関数を使用すること。RegCreateKeyTransacted 関数が作成するキーには値はない。アプリケーションは
RegSetValueEx 関数を使用してキー値を設定できる。RegCreateKeyTransacted
関数は指定したパス内の不足するすべてのキーを作成する。この動作を利用して、複数のキーを一度に作成できる。たとえば、lpSubKey
パラメータに subkey1\subkey2\subkey3\subkey4 のような文字列を指定することで、4
レベル下のサブキーと同時に先行する 3
つのサブキーを作成できる。なお、パス内の既存キーのつづりが誤っている場合、この動作によって意図しないキーが作成される。アプリケーションは
HKEY_USERS や HKEY_LOCAL_MACHINE の直下のキーを作成できない。HKEY_USERS や
HKEY_LOCAL_MACHINE ツリーのより下位のレベルではサブキーを作成できる。
> [!NOTE] > winreg.h ヘッダは RegCreateKeyTransacted
をエイリアスとして定義しており、UNICODE プリプロセッサ定数の定義に基づいて ANSI または Unicode
版を自動的に選択する。エンコーディングに中立なエイリアスをエンコーディング中立でないコードと混在させると、コンパイル時または実行時エラーとなる可能性がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照のこと。


%index
RegDeleteKeyW
サブキーとその値を削除する。(Unicode)
%group
Win32 advapi32
%prm
hKey, lpSubKey
hKey : [intptr] オープン中のレジストリキーへのハンドル。このキーのアクセス権は削除操作に影響しない。RegCreateKeyEx または RegOpenKeyEx で取得したもの、または HKEY_CLASSES_ROOT、HKEY_CURRENT_CONFIG、HKEY_CURRENT_USER、HKEY_LOCAL_MACHINE、HKEY_USERS のいずれか。
lpSubKey : [wstr] 削除するキーの名前。hKey で識別されるキーのサブキーでなければならず、サブキーを持っていてはならない。NULL にしてはならない。関数は DELETE アクセス権でサブキーを開く。キー名は大文字小文字を区別しない。
%inst
サブキーとその値を削除する。(Unicode)

[戻り値]
関数が成功した場合、戻り値は ERROR_SUCCESS。失敗した場合は Winerror.h で定義された 0 以外のエラーコード。

[備考]

削除されたキーは、最後のハンドルが閉じられるまで実際には削除されない。削除対象サブキーはサブキーを持っていてはならない。キーとそのサブキーをすべて削除するには、サブキーを列挙して個別に削除する必要があるか、RegDeleteTree
または SHDeleteKey を使う。


%index
RegDeleteKeyTransactedW
指定されたプラットフォーム固有のレジストリビューから、サブキーとその値をトランザクション化された操作として削除する。(Unicode)
%group
Win32 advapi32
%prm
hKey, lpSubKey, samDesired, Reserved, hTransaction, pExtendedParameter
hKey : [intptr] 開かれているレジストリキーへのハンドル。このキーのアクセス権は削除操作に影響しない。アクセス権の詳細はレジストリキーのセキュリティとアクセス権を参照のこと。このハンドルは RegCreateKeyEx、RegCreateKeyTransacted、RegOpenKeyEx、または RegOpenKeyTransacted 関数が返す。以下の定義済みキーのいずれかを指定することもできる: HKEY_CLASSES_ROOT HKEY_CURRENT_CONFIG HKEY_CURRENT_USER HKEY_LOCAL_MACHINE HKEY_USERS
lpSubKey : [wstr] 削除するキーの名前。このキーは hKey パラメータの値で指定されるキーのサブキーでなければならない。関数は DELETE アクセス権でサブキーを開く。キー名は大文字小文字を区別しない。このパラメータの値を NULL にすることはできない。
samDesired : [int] レジストリのプラットフォーム固有のビューを指定するアクセスマスク。
Reserved : [int] このパラメータは予約されており、0 でなければならない。
hTransaction : [intptr] アクティブなトランザクションへのハンドル。このハンドルは CreateTransaction 関数が返す。
pExtendedParameter : [intptr] このパラメータは予約されており、NULL でなければならない。
%inst
指定されたプラットフォーム固有のレジストリビューから、サブキーとその値をトランザクション化された操作として削除する。(Unicode)

[戻り値]
関数が成功した場合、戻り値は ERROR_SUCCESS となる。関数が失敗した場合、戻り値は Winerror.h で定義された 0
以外のエラーコードとなる。FormatMessage 関数に FORMAT_MESSAGE_FROM_SYSTEM
フラグを指定して呼び出すと、エラーの一般的な説明を取得できる。

[備考]
削除されたキーは、それに対する最後のハンドルが閉じられるまで実際には削除されない。WOW64 では、32 ビットアプリケーションは 64
ビットアプリケーションが参照するレジストリツリーとは別のレジストリツリーを参照する。この関数を使用すると、アプリケーションはもう一方のレジストリビュー内のエントリを削除できる。削除するサブキーはサブキーを持っていてはならない。キーとそのすべてのサブキーを削除するには、サブキーを列挙して個別に削除する必要がある。キーを再帰的に削除するには
RegDeleteTree または SHDeleteKey
関数を使用する。関数が成功した場合、RegDeleteKeyTransacted
は指定したキーをレジストリから削除する。キー全体（すべての値を含む）が削除される。ツリー全体をトランザクション化された操作として削除するには、RegCreateKeyTransacted
または RegOpenKeyTransacted が返したハンドルを指定して RegDeleteTree 関数を使用する。
> [!NOTE] > winreg.h ヘッダは RegDeleteKeyTransacted
をエイリアスとして定義しており、UNICODE プリプロセッサ定数の定義に基づいて ANSI または Unicode
版を自動的に選択する。エンコーディングに中立なエイリアスをエンコーディング中立でないコードと混在させると、コンパイル時または実行時エラーとなる可能性がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照のこと。


%index
RegDeleteKeyValueW
指定したレジストリキーおよびサブキーから、指定した値を削除する。(Unicode)
%group
Win32 advapi32
%prm
hKey, lpSubKey, lpValueName
hKey : [intptr] 開かれているレジストリキーへのハンドル。キーは KEY_SET_VALUE アクセス権で開かれている必要がある。詳細はレジストリキーのセキュリティとアクセス権を参照のこと。
lpSubKey : [wstr] レジストリキーの名前。このキーは hKey パラメータで識別されるキーのサブキーでなければならない。
lpValueName : [wstr] キーから削除するレジストリ値。
%inst
指定したレジストリキーおよびサブキーから、指定した値を削除する。(Unicode)

[戻り値]
関数が成功した場合、戻り値は ERROR_SUCCESS となる。関数が失敗した場合、戻り値は Winerror.h で定義された 0
以外のエラーコードとなる。FormatMessage 関数に FORMAT_MESSAGE_FROM_SYSTEM
フラグを指定して呼び出すと、エラーの一般的な説明を取得できる。

[備考]
この関数を使用するアプリケーションをコンパイルするには、_WIN32_WINNT を 0x0600 以降に定義する。詳細は Windows
ヘッダの使用を参照のこと。
> [!NOTE] > 古いバージョンの Windows では、この API は kernel32.dll 経由でも公開されている。
> [!NOTE] > winreg.h ヘッダは RegDeleteKeyValue をエイリアスとして定義しており、UNICODE
プリプロセッサ定数の定義に基づいて ANSI または Unicode
版を自動的に選択する。エンコーディングに中立なエイリアスをエンコーディング中立でないコードと混在させると、コンパイル時または実行時エラーとなる可能性がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照のこと。


%index
RegDisablePredefinedCache
現在のプロセスにおいて、HKEY_CURRENT_USER 定義済みレジストリハンドルのハンドルキャッシュを無効にする。
%group
Win32 advapi32
%prm

%inst
現在のプロセスにおいて、HKEY_CURRENT_USER 定義済みレジストリハンドルのハンドルキャッシュを無効にする。

[戻り値]
関数が成功した場合、戻り値は ERROR_SUCCESS となる。関数が失敗した場合、戻り値はシステムエラーコードとなる。

[備考]
この関数を呼び出した後に HKEY_CURRENT_USER
にアクセスすると、HKEY_USERS\SID_of_current_user
に対して、または現在のユーザのハイブがロードされていない場合は HKEY_USERS\.DEFAULT に対して操作が実行される。SID
の詳細はセキュリティ識別子を参照のこと。


%index
RegDisableReflectionKey
指定したキーのレジストリリフレクションを無効にする。キーのリフレクションを無効にしても、そのサブキーのリフレクションには影響しない。
%group
Win32 advapi32
%prm
hBase
hBase : [intptr] 開かれているレジストリキーへのハンドル。このハンドルは RegCreateKeyEx、RegCreateKeyTransacted、RegOpenKeyEx、または RegOpenKeyTransacted 関数が返す。リモートコンピュータ上のキーを指定することはできない。キーがリフレクション対象リストにない場合、関数は成功するが何も行わない。詳細はレジストリリダイレクタとレジストリリフレクションを参照のこと。
%inst
指定したキーのレジストリリフレクションを無効にする。キーのリフレクションを無効にしても、そのサブキーのリフレクションには影響しない。

[戻り値]
関数が成功した場合、戻り値は ERROR_SUCCESS となる。関数が失敗した場合、戻り値は Winerror.h で定義された 0
以外のエラーコードとなる。FormatMessage 関数に FORMAT_MESSAGE_FROM_SYSTEM
フラグを指定して呼び出すと、エラーの一般的な説明を取得できる。

[備考]
WOW64 では、32 ビットアプリケーションは 64
ビットアプリケーションが参照するレジストリツリーとは別のレジストリツリーを参照する。レジストリリフレクションは、2
つのビュー間で特定のレジストリキーと値をコピーする。無効化したキーのレジストリリフレクションを復元するには、RegEnableReflectionKey
関数を使用する。


%index
RegEnableReflectionKey
指定した無効化済みキーのレジストリリフレクションを復元する。キーのリフレクションを復元しても、そのサブキーのリフレクションには影響しない。
%group
Win32 advapi32
%prm
hBase
hBase : [intptr] RegDisableReflectionKey 関数によって以前に無効化されたレジストリキーへのハンドル。このハンドルは RegCreateKeyEx、RegCreateKeyTransacted、RegOpenKeyEx、または RegOpenKeyTransacted 関数が返す。リモートコンピュータ上のキーを指定することはできない。キーがリフレクション対象リストにない場合、関数は成功するが何も行わない。詳細はレジストリリダイレクタとレジストリリフレクションを参照のこと。
%inst
指定した無効化済みキーのレジストリリフレクションを復元する。キーのリフレクションを復元しても、そのサブキーのリフレクションには影響しない。

[戻り値]
関数が成功した場合、戻り値は ERROR_SUCCESS となる。関数が失敗した場合、戻り値は Winerror.h で定義された 0
以外のエラーコードとなる。FormatMessage 関数に FORMAT_MESSAGE_FROM_SYSTEM
フラグを指定して呼び出すと、エラーの一般的な説明を取得できる。

[備考]
WOW64 では、32 ビットアプリケーションは 64
ビットアプリケーションが参照するレジストリツリーとは別のレジストリツリーを参照する。レジストリリフレクションは、2
つのビュー間で特定のレジストリキーと値をコピーする。


%index
RegEnumKeyW
指定した開かれているレジストリキーのサブキーを列挙する。(RegEnumKeyW)
%group
Win32 advapi32
%prm
hKey, dwIndex, lpName, cchName
hKey : [intptr] 開かれているレジストリキーへのハンドル。キーは KEY_ENUMERATE_SUB_KEYS アクセス権で開かれている必要がある。詳細はレジストリキーのセキュリティとアクセス権を参照のこと。
dwIndex : [int] 取得する hKey のサブキーのインデックス。この値は RegEnumKey 関数の最初の呼び出し時には 0 とし、後続の呼び出しで増分する。
lpName : [wstr] 終端 null 文字を含むサブキーの名前を受け取るバッファへのポインタ。この関数はサブキーの名前のみをコピーし、キー階層全体はコピーしない。
cchName : [int] lpName パラメータが指すバッファのサイズ（TCHAR 単位）。必要なバッファサイズを決定するには、RegQueryInfoKey 関数を使用して hKey パラメータで識別されるキーの最大サブキーのサイズを調べる。
%inst
指定した開かれているレジストリキーのサブキーを列挙する。(RegEnumKeyW)

[戻り値]
関数が成功した場合、戻り値は ERROR_SUCCESS
となる。関数が失敗した場合、戻り値はシステムエラーコードとなる。これ以上サブキーがない場合、関数は ERROR_NO_MORE_ITEMS
を返す。lpName バッファがキーの名前を受け取るには小さすぎる場合、関数は ERROR_MORE_DATA を返す。

[備考]
サブキーを列挙するには、アプリケーションはまず dwIndex パラメータを 0 に設定して RegEnumKey
関数を呼び出す。その後、アプリケーションは dwIndex パラメータを増分し、さらにサブキーがなくなるまで（関数が
ERROR_NO_MORE_ITEMS を返すまで）RegEnumKey 関数を呼び出す。アプリケーションは、最初の関数呼び出し時に
dwIndex を最後のキーのインデックスに設定し、インデックス 0
のサブキーが列挙されるまでインデックスを減分することもできる。最後のサブキーのインデックスを取得するには、RegQueryInfoKey
を使用する。アプリケーションが RegEnumKey
関数を使用している間、問い合わせ対象のキーを変更する可能性のある登録関数を呼び出してはならない。
> [!NOTE] > winreg.h ヘッダは RegEnumKey をエイリアスとして定義しており、UNICODE
プリプロセッサ定数の定義に基づいて ANSI または Unicode
版を自動的に選択する。エンコーディングに中立なエイリアスをエンコーディング中立でないコードと混在させると、コンパイル時または実行時エラーとなる可能性がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照のこと。


%index
RegLoadAppKeyW
指定したレジストリハイブをアプリケーションハイブとしてロードする。(Unicode)
%group
Win32 advapi32
%prm
lpFile, phkResult, samDesired, dwOptions, Reserved
lpFile : [wstr] ハイブファイルの名前。このハイブは RegSaveKey または RegSaveKeyEx 関数で作成されている必要がある。ファイルが存在しない場合、指定した名前で空のハイブファイルが作成される。
phkResult : [intptr] ロードされたハイブのルートキーのハンドルへのポインタ。ハイブ内のキーにアクセスする唯一の方法はこのハンドル経由である。レジストリは、キーへの絶対パスを使用してこのハイブ内のキーにアクセスすることを防ぐ。結果として、レジストリの名前空間を通じてこのハイブに移動することはできない。
samDesired : [int] 返されるルートキーに対して要求するアクセス権を指定するマスク。詳細はレジストリキーのセキュリティとアクセス権を参照のこと。
dwOptions : [int] このパラメータが REG_PROCESS_APPKEY の場合、呼び出し側によってロードされている間、ハイブを再度ロードすることはできない。これにより、別の呼び出し側がこのレジストリハイブにアクセスすることを防ぐ。
Reserved : [int] このパラメータは予約されている。
%inst
指定したレジストリハイブをアプリケーションハイブとしてロードする。(Unicode)

[戻り値]
関数が成功した場合、戻り値は ERROR_SUCCESS となる。関数が失敗した場合、戻り値は Winerror.h で定義された 0
以外のエラーコードとなる。FormatMessage 関数に FORMAT_MESSAGE_FROM_SYSTEM
フラグを指定して呼び出すと、エラーの一般的な説明を取得できる。

[備考]
RegLoadKey とは異なり、RegLoadAppKey はハイブを HKEY_LOCAL_MACHINE や HKEY_USERS
の下にロードしない。代わりに、ハイブは列挙できない特別なルートの下にロードされる。その結果、RegLoadAppKey
で現在ロードされているハイブを列挙する方法はない。RegLoadAppKey
でロードされたハイブに対するすべての操作は、phkResult で返されたハンドルに対する相対で実行する必要がある。
2 つのプロセスが同じハイブに対して操作を実行する必要がある場合、各プロセスはハンドルを取得するために RegLoadAppKey
を呼び出さなければならない。RegLoadAppKey
操作中、レジストリはファイルがすでにロードされているかを検証する。ロードされていた場合、ハイブを再ロードするのではなく、以前にロードされたハイブへのハンドルを返す。

ハイブ内のすべてのキーは同じセキュリティ記述子を持っていなければならず、そうでなければ関数は失敗する。このセキュリティ記述子は、samDesired
パラメータで指定されたアクセスを呼び出し側に付与する必要があり、そうでなければ関数は失敗する。ハイブ内のキーに対して
RegSetKeySecurity 関数を使用することはできない。Windows 8 以降では、各プロセスは RegLoadAppKey
を呼び出して複数のハイブをロードできる。Windows 7 以前では、各プロセスは同時に 1 つのハイブしか RegLoadAppKey
でロードできない。RegLoadAppKey でロードされたハイブは、ハイブ内のキーへのすべてのハンドルが RegCloseKey
で閉じられると自動的にアンロードされる。この関数を使用するアプリケーションをコンパイルするには、_WIN32_WINNT を 0x0600
以降に定義する。詳細は Windows ヘッダの使用を参照のこと。
> [!NOTE] > winreg.h ヘッダは RegLoadAppKey をエイリアスとして定義しており、UNICODE
プリプロセッサ定数の定義に基づいて ANSI または Unicode
版を自動的に選択する。エンコーディングに中立なエイリアスをエンコーディング中立でないコードと混在させると、コンパイル時または実行時エラーとなる可能性がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照のこと。


%index
RegOpenKeyW
指定したレジストリキーを開く。(Unicode)
%group
Win32 advapi32
%prm
hKey, lpSubKey, phkResult
hKey : [intptr] 開かれているレジストリキーへのハンドル。このハンドルは RegCreateKeyEx または RegOpenKeyEx 関数が返すか、以下の定義済みキーのいずれかを指定できる: * HKEY_CLASSES_ROOT * HKEY_CURRENT_CONFIG * HKEY_CURRENT_USER * HKEY_LOCAL_MACHINE * HKEY_USERS
lpSubKey : [wstr] 開くレジストリキーの名前。このキーは hKey パラメータで識別されるキーのサブキーでなければならない。キー名は大文字小文字を区別しない。このパラメータが NULL または空文字列へのポインタである場合、関数は渡されたものと同じハンドルを返す。詳細はレジストリ要素サイズ制限を参照のこと。
phkResult : [intptr] 開かれたキーへのハンドルを受け取る変数へのポインタ。キーが定義済みレジストリキーでない場合、ハンドルの使用が終わったら RegCloseKey 関数を呼び出す。
%inst
指定したレジストリキーを開く。(Unicode)

[戻り値]
関数が成功した場合、戻り値は ERROR_SUCCESS となる。関数が失敗した場合、戻り値は Winerror.h で定義された 0
以外のエラーコードとなる。FormatMessage 関数に FORMAT_MESSAGE_FROM_SYSTEM
フラグを指定して呼び出すと、エラーの一般的な説明を取得できる。

[備考]
RegOpenKey
関数は既定のセキュリティアクセスマスクを使用してキーを開く。キーを開くのに異なるアクセス権が必要な場合、関数は失敗して
ERROR_ACCESS_DENIED を返す。この状況ではアプリケーションは RegOpenKeyEx
関数を使用してアクセスマスクを指定すべきである。RegOpenKey
は、キーがデータベースに存在しない場合に指定したキーを作成しない。サービスやアプリケーションが複数のユーザをインパーソネートする場合、この関数を
HKEY_CURRENT_USER に対して使用してはならない。代わりに RegOpenCurrentUser 関数を呼び出す。
> [!NOTE] > winreg.h ヘッダは RegOpenKey をエイリアスとして定義しており、UNICODE
プリプロセッサ定数の定義に基づいて ANSI または Unicode
版を自動的に選択する。エンコーディングに中立なエイリアスをエンコーディング中立でないコードと混在させると、コンパイル時または実行時エラーとなる可能性がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照のこと。


%index
RegOpenKeyTransactedW
指定したレジストリキーを開き、トランザクションに関連付ける。(Unicode)
%group
Win32 advapi32
%prm
hKey, lpSubKey, ulOptions, samDesired, phkResult, hTransaction, pExtendedParemeter
hKey : [intptr] 開かれているレジストリキーへのハンドル。このハンドルは RegCreateKeyEx、RegCreateKeyTransacted、RegOpenKeyEx、または RegOpenKeyTransacted 関数が返す。以下の定義済みキーのいずれかを指定することもできる: HKEY_CLASSES_ROOT HKEY_CURRENT_USER HKEY_LOCAL_MACHINE HKEY_USERS
lpSubKey : [wstr] 開くレジストリサブキーの名前。キー名は大文字小文字を区別しない。lpSubKey パラメータが NULL または空文字列へのポインタで、hKey が定義済みキーである場合、システムは定義済みキーをリフレッシュし、phkResult は関数に渡されたものと同じ hKey ハンドルを受け取る。そうでない場合、phkResult は開かれたキーへの新しいハンドルを受け取る。詳細はレジストリ要素サイズ制限を参照のこと。
ulOptions : [int] このパラメータは予約されており、0 でなければならない。
samDesired : [int] キーに対して要求するアクセス権を指定するマスク。キーのセキュリティ記述子が呼び出し側プロセスに対して要求されたアクセスを許可しない場合、関数は失敗する。詳細はレジストリキーのセキュリティとアクセス権を参照のこと。
phkResult : [intptr] 開かれたキーへのハンドルを受け取る変数へのポインタ。キーが定義済みレジストリキーでない場合、ハンドルの使用が終わったら RegCloseKey 関数を呼び出す。
hTransaction : [intptr] アクティブなトランザクションへのハンドル。このハンドルは CreateTransaction 関数が返す。
pExtendedParemeter : [intptr] このパラメータは予約されており、NULL でなければならない。
%inst
指定したレジストリキーを開き、トランザクションに関連付ける。(Unicode)

[戻り値]
関数が成功した場合、戻り値は ERROR_SUCCESS となる。関数が失敗した場合、戻り値は Winerror.h で定義された 0
以外のエラーコードとなる。FormatMessage 関数に FORMAT_MESSAGE_FROM_SYSTEM
フラグを指定して呼び出すと、エラーの一般的な説明を取得できる。

[備考]

この関数を使用してキーを開くと、そのキーに対する後続の操作はトランザクション化される。トランザクションがコミットされる前に非トランザクション操作がキーに対して実行されると、トランザクションはロールバックされる。トランザクションがコミットまたはロールバックされた後、追加の操作をトランザクション化するには、アクティブなトランザクションハンドルを指定して
RegCreateKeyTransacted または RegOpenKeyTransacted
関数でキーを開き直す必要がある。トランザクションの詳細についてはカーネルトランザクションマネージャを参照のこと。このキーのサブキーに対する後続の操作は自動的にはトランザクション化されない点に注意のこと。したがって、RegDeleteKeyEx
関数はトランザクション化された削除操作を行わない。代わりに RegDeleteKeyTransacted
関数を使用すること。RegCreateKeyTransacted 関数とは異なり、RegOpenKeyTransacted
関数は指定したキーがレジストリに存在しない場合にキーを作成しない。サービスやアプリケーションが複数のユーザをインパーソネートする場合、この関数を
HKEY_CURRENT_USER に対して使用してはならない。代わりに RegOpenCurrentUser
関数を呼び出す。phkResult
で返されるキーが定義済みレジストリキーである場合、そのキーは提供されたトランザクションには含まれない。単一のレジストリキーは 65,534
回しか開くことができない。65,535 回目のオープン操作を試行すると、この関数は ERROR_NO_SYSTEM_RESOURCES
で失敗する。
> [!NOTE] > winreg.h ヘッダは RegOpenKeyTransacted
をエイリアスとして定義しており、UNICODE プリプロセッサ定数の定義に基づいて ANSI または Unicode
版を自動的に選択する。エンコーディングに中立なエイリアスをエンコーディング中立でないコードと混在させると、コンパイル時または実行時エラーとなる可能性がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照のこと。


%index
RegOverridePredefKey
定義済みレジストリキーを指定したレジストリキーにマップする。
%group
Win32 advapi32
%prm
hKey, hNewHKey
hKey : [intptr] 以下の定義済みキーのいずれかへのハンドル: - HKEY_CLASSES_ROOT - HKEY_CURRENT_CONFIG - HKEY_CURRENT_USER - HKEY_LOCAL_MACHINE - HKEY_PERFORMANCE_DATA - HKEY_USERS
hNewHKey : [intptr] 開かれているレジストリキーへのハンドル。このハンドルは RegCreateKeyEx または RegOpenKeyEx 関数が返す。定義済みキーを指定することはできない。関数は hKey を hNewHKey キーを参照するようにマップする。これは呼び出し側プロセスのみに影響する。hNewHKey が NULL の場合、関数は定義済みキーの既定のマッピングを復元する。
%inst
定義済みレジストリキーを指定したレジストリキーにマップする。

[戻り値]
関数が成功した場合、戻り値は ERROR_SUCCESS となる。関数が失敗した場合、戻り値は Winerror.h で定義された 0
以外のエラーコードとなる。FormatMessage 関数に FORMAT_MESSAGE_FROM_SYSTEM
フラグを指定して呼び出すと、エラーの一般的な説明を取得できる。

[備考]
RegOverridePredefKey
関数はソフトウェアインストールプログラム向けのものである。これにより、定義済みキーを再マップし、システムにインストールされる DLL
コンポーネントをロードし、DLL
内のエントリポイントを呼び出し、コンポーネントがレジストリに対して試みた変更を調べることができる。インストールプログラムはその後、それらの変更を
DLL が意図した場所に書き込むか、書き込む前にデータに変更を加えることができる。たとえば、アプリケーションインストールの一部として
ActiveX
コントロールをインストールするインストールプログラムを考える。インストールプログラムは、コントロールが自身を登録できるようにするため、コントロールの
DllRegisterServer エントリポイントを呼び出す必要がある。この呼び出しの前に、インストールプログラムは
RegOverridePredefKey を呼び出して HKEY_CLASSES_ROOT を
HKEY_CURRENT_USER\TemporaryInstall\DllRegistration などの一時キーに再マップできる。次に
DllRegisterServer を呼び出すと、ActiveX
コントロールは自身のレジストリエントリを一時キーに書き込む。その後、インストールプログラムは再度 RegOverridePredefKey
を呼び出して HKEY_CLASSES_ROOT
の元のマッピングを復元する。インストールプログラムは、必要に応じて一時キーに書き込まれたキーを変更した上で、元の
HKEY_CLASSES_ROOT にコピーできる。RegOverridePredefKey の呼び出し後、RegCloseKey
を呼び出して hNewHKey ハンドルを安全に閉じることができる。システムは hNewHKey への独自の参照を保持する。


%index
RegQueryMultipleValuesW
開かれているレジストリキーに関連付けられた一連の値名について、型とデータを取得する。(Unicode)
%group
Win32 advapi32
%prm
hKey, val_list, num_vals, lpValueBuf, ldwTotsize
hKey : [intptr] 開かれているレジストリキーへのハンドル。キーは KEY_QUERY_VALUE アクセス権で開かれている必要がある。詳細はレジストリキーのセキュリティとアクセス権を参照のこと。
val_list : [var] 1 つ以上の値エントリを記述する [VALENT](./ns-winreg-valentw.md) 構造体の配列へのポインタ。入力時、各構造体の ve_valuename メンバは取得する値の名前へのポインタを含まなければならない。指定された値のいずれかが指定されたキーに存在しない場合、関数は失敗する。
num_vals : [int] val_list 配列内の要素数。
lpValueBuf : [wstr] バッファへのポインタ。関数が成功した場合、バッファは各値のデータを受け取る。
ldwTotsize : [var] lpValueBuf パラメータが指すバッファのサイズ（バイト単位）を指定する変数へのポインタ。関数が成功した場合、ldwTotsize はバッファにコピーされたバイト数を受け取る。バッファが小さすぎて関数が失敗した場合、ldwTotsize は必要なサイズ（バイト単位）を受け取る。
%inst
開かれているレジストリキーに関連付けられた一連の値名について、型とデータを取得する。(Unicode)

[戻り値]
関数が成功した場合、戻り値は ERROR_SUCCESS となる。関数が失敗した場合、戻り値は次のエラーコードのいずれかとなる。
（以下省略）

[備考]
RegQueryMultipleValues 関数により、アプリケーションは静的または動的キーの 1
つ以上の値を問い合わせることができる。対象キーが静的キーである場合、システムはすべての値をアトミックに提供する。過剰な直列化を防ぐため、関数が返す集約データは
1
メガバイトを超えることはできない。対象キーが動的キーの場合、そのプロバイダはすべての値をアトミックに提供する必要がある。つまり、プロバイダは過剰な直列化を避けつつ、バッファ内のすべての値に対する一貫したビューを提供しながら、結果バッファを同期的に埋める必要がある。この関数へのアトミックな呼び出しの間に、プロバイダは最大
1 メガバイトの合計出力データを提供できる。RegQueryMultipleValues
はリモートでサポートされている。つまり、関数に渡される hKey パラメータはリモートコンピュータを参照できる。
> [!NOTE] > winreg.h ヘッダは RegQueryMultipleValues
をエイリアスとして定義しており、UNICODE プリプロセッサ定数の定義に基づいて ANSI または Unicode
版を自動的に選択する。エンコーディングに中立なエイリアスをエンコーディング中立でないコードと混在させると、コンパイル時または実行時エラーとなる可能性がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照のこと。


%index
RegQueryReflectionKey
指定したキーに対してリフレクションが無効化されているか有効化されているかを判定する。
%group
Win32 advapi32
%prm
hBase, bIsReflectionDisabled
hBase : [intptr] レジストリキーへのハンドル。このハンドルは RegCreateKeyEx、RegCreateKeyTransacted、RegOpenKeyEx、または RegOpenKeyTransacted 関数が返す。リモートコンピュータ上のキーを指定することはできない。
bIsReflectionDisabled : [var] RegDisableReflectionKey でリフレクションが無効化されているか、RegEnableReflectionKey で有効化されているかを示す値。
%inst
指定したキーに対してリフレクションが無効化されているか有効化されているかを判定する。

[戻り値]
関数が成功した場合、戻り値は ERROR_SUCCESS となる。関数が失敗した場合、戻り値は Winerror.h で定義された 0
以外のエラーコードとなる。FormatMessage 関数に FORMAT_MESSAGE_FROM_SYSTEM
フラグを指定して呼び出すと、エラーの一般的な説明を取得できる。

[備考]
WOW64 では、32 ビットアプリケーションは 64
ビットアプリケーションが参照するレジストリツリーとは別のレジストリツリーを参照する。レジストリリフレクションは、2
つのビュー間で特定のレジストリキーと値をコピーする。レジストリリフレクションを無効にするには、RegDisableReflectionKey
関数を使用する。無効化したキーのリフレクションを復元するには、RegEnableReflectionKey 関数を使用する。


%index
RegQueryValueW
指定したレジストリキーの既定値または無名値に関連付けられたデータを取得する。データは null で終端された文字列でなければならない。(Unicode)
%group
Win32 advapi32
%prm
hKey, lpSubKey, lpData, lpcbData
hKey : [intptr] 開かれているレジストリキーへのハンドル。キーは KEY_QUERY_VALUE アクセス権で開かれている必要がある。詳細はレジストリキーのセキュリティとアクセス権を参照のこと。
lpSubKey : [wstr] 既定値を取得する hKey パラメータのサブキーの名前。キー名は大文字小文字を区別しない。このパラメータが NULL または空文字列を指す場合、関数は hKey で識別されるキーの既定値を取得する。詳細はレジストリ要素サイズ制限を参照のこと。
lpData : [wstr] 指定したキーの既定値を受け取るバッファへのポインタ。
lpcbData : [var] lpValue パラメータが指すバッファのサイズ（バイト単位）を指定する変数へのポインタ。関数が復帰するとき、この変数は lpValue にコピーされたデータのサイズ（終端 null 文字を含む）を格納する。
%inst
指定したレジストリキーの既定値または無名値に関連付けられたデータを取得する。データは null
で終端された文字列でなければならない。(Unicode)

[戻り値]
関数が成功した場合、戻り値は ERROR_SUCCESS となる。関数が失敗した場合、戻り値はシステムエラーコードとなる。lpValue
バッファが値を受け取るには小さすぎる場合、関数は ERROR_MORE_DATA を返す。

[備考]
この関数の ANSI 版が（明示的に RegQueryValueA を呼び出すか、Windows.h のインクルード前に UNICODE
を定義しないことで）使用されている場合、関数は格納されている Unicode 文字列を ANSI 文字列に変換してから lpValue
パラメータで指定したバッファにコピーする。データが REG_SZ、REG_MULTI_SZ、または REG_EXPAND_SZ
型の場合、文字列は適切な終端 null 文字で格納されていない可能性がある。したがって、関数が ERROR_SUCCESS
を返しても、アプリケーションは文字列を使用する前に文字列が正しく終端されていることを確認すべきである。そうでないと、バッファを上書きする可能性がある。（REG_MULTI_SZ
文字列は 2 つの終端 null
文字を持つべきである点に注意のこと。）特定のレジストリキーへのアクセスはリダイレクトされる点に注意のこと。詳細はレジストリ仮想化およびレジストリ内の
32 ビットおよび 64 ビットアプリケーションデータを参照のこと。
> [!NOTE] > winreg.h ヘッダは RegQueryValue をエイリアスとして定義しており、UNICODE
プリプロセッサ定数の定義に基づいて ANSI または Unicode
版を自動的に選択する。エンコーディングに中立なエイリアスをエンコーディング中立でないコードと混在させると、コンパイル時または実行時エラーとなる可能性がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照のこと。


%index
RegRenameKey
指定したレジストリキーの名前を変更する。(RegRenameKey)
%group
Win32 advapi32
%prm
hKey, lpSubKeyName, lpNewKeyName
hKey : [intptr] 名前を変更するキーへのハンドル。ハンドルは KEY_WRITE アクセス権で開かれている必要がある。詳細は [Registry Key Security and Access Rights](/windows/win32/SysInfo/registry-key-security-and-access-rights) を参照のこと。このハンドルは [RegCreateKeyEx](nf-winreg-regcreatekeyexa.md) または [RegOpenKeyEx](nf-winreg-regopenkeyexa.md) 関数が返すか、以下の [定義済みキー](/windows/win32/SysInfo/predefined-keys) のいずれかを指定できる: * HKEY_CLASSES_ROOT * HKEY_CURRENT_CONFIG * HKEY_CURRENT_USER * HKEY_LOCAL_MACHINE * HKEY_USERS
lpSubKeyName : [wstr] 名前を変更するサブキーの名前。このキーは *hKey* パラメータで識別されるキーのサブキーでなければならない。このパラメータは **NULL** でもよく、その場合、*hKey* パラメータで識別されるキー自体の名前が変更される。
lpNewKeyName : [wstr] キーの新しい名前。新しい名前はまだ存在していてはならない。
%inst
指定したレジストリキーの名前を変更する。(RegRenameKey)

[戻り値]
関数が成功した場合、戻り値は ERROR_SUCCESS となる。関数が失敗した場合、戻り値は Winerror.h で定義された 0
以外のエラーコードとなる。[FormatMessage](/windows/desktop/api/winbase/nf-winbase-formatmessage)
関数に FORMAT_MESSAGE_FROM_SYSTEM
フラグを指定して呼び出すと、エラーの一般的な説明を取得できる。STATUS_ACCESS_DENIED
のエラーコードは、呼び出し側が指定したレジストリキーまたはサブキーに対して必要なアクセス権を持っていないことを示す。

[備考]
この関数はレジストリのサブツリー全体の名前を変更するのに使用できる。呼び出し側は、指定したキーの親に対する
KEY_CREATE_SUB_KEY アクセス権、および名前変更対象のサブツリー全体に対する DELETE アクセス権を持つ必要がある。


%index
RegReplaceKeyW
レジストリキーおよびそのすべてのサブキーを支えるファイルを別のファイルに置き換えることで、次回のシステム起動時にキーとサブキーが新しいファイルに格納された値を持つようにする。(Unicode)
%group
Win32 advapi32
%prm
hKey, lpSubKey, lpNewFile, lpOldFile
hKey : [intptr] 開かれているレジストリキーへのハンドル。このハンドルは RegCreateKeyEx または RegOpenKeyEx 関数が返すか、以下の定義済みキーのいずれかを指定できる:
lpSubKey : [wstr] サブキーと値が置き換えられるレジストリキーの名前。キーが存在する場合、hKey パラメータで識別されるキーのサブキーでなければならない。サブキーが存在しない場合、作成される。このパラメータは NULL にできる。
lpNewFile : [wstr] レジストリ情報を含むファイルの名前。このファイルは通常、RegSaveKey 関数を使用して作成される。
lpOldFile : [wstr] 置き換えられるレジストリ情報のバックアップコピーを受け取るファイルの名前。
%inst

レジストリキーおよびそのすべてのサブキーを支えるファイルを別のファイルに置き換えることで、次回のシステム起動時にキーとサブキーが新しいファイルに格納された値を持つようにする。(Unicode)

[戻り値]
関数が成功した場合、戻り値は ERROR_SUCCESS となる。関数が失敗した場合、戻り値は Winerror.h で定義された 0
以外のエラーコードとなる。FormatMessage 関数に FORMAT_MESSAGE_FROM_SYSTEM
フラグを指定して呼び出すと、エラーの一般的な説明を取得できる。

[備考]
レジストリハイブファイルには 2
つの異なる形式がある。現在のオペレーティングシステムで作成されたレジストリハイブは、通常、それ以前のバージョンではロードできない。lpNewFile
パラメータで指定したファイルは、システムが再起動されるまで開いたままになる。hKey が RegConnectRegistry
で返されたハンドルである場合、lpNewFile と lpOldFile
で指定されたパスはリモートコンピュータに対する相対となる。呼び出し側プロセスはレジストリが存在するコンピュータ上で
SE_RESTORE_NAME および SE_BACKUP_NAME 特権を持っている必要がある。詳細は特殊な特権での実行を参照のこと。
> [!NOTE] > winreg.h ヘッダは RegReplaceKey をエイリアスとして定義しており、UNICODE
プリプロセッサ定数の定義に基づいて ANSI または Unicode
版を自動的に選択する。エンコーディングに中立なエイリアスをエンコーディング中立でないコードと混在させると、コンパイル時または実行時エラーとなる可能性がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照のこと。


%index
RegSaveKeyW
指定したキーとそのすべてのサブキーおよび値を、標準形式で新しいファイルに保存する。(Unicode)
%group
Win32 advapi32
%prm
hKey, lpFile, lpSecurityAttributes
hKey : [intptr] 開かれているレジストリキーへのハンドル。このハンドルは RegCreateKeyEx または RegOpenKeyEx 関数が返すか、以下の定義済みキーのいずれかを指定できる:
lpFile : [wstr] 指定したキーとサブキーを保存するファイルの名前。ファイルがすでに存在する場合、関数は失敗する。
lpSecurityAttributes : [var] 新しいファイルのセキュリティ記述子を指定する SECURITY_ATTRIBUTES 構造体へのポインタ。lpSecurityAttributes が NULL の場合、ファイルには既定のセキュリティ記述子が割り当てられる。ファイルの既定のセキュリティ記述子の ACL は、親ディレクトリから継承される。
%inst
指定したキーとそのすべてのサブキーおよび値を、標準形式で新しいファイルに保存する。(Unicode)

[戻り値]
関数が成功した場合、戻り値は ERROR_SUCCESS となる。関数が失敗した場合、戻り値は Winerror.h で定義された 0
以外のエラーコードとなる。FormatMessage 関数に FORMAT_MESSAGE_FROM_SYSTEM
フラグを指定して呼び出すと、エラーの一般的な説明を取得できる。ファイルがすでに存在する場合、関数は
ERROR_ALREADY_EXISTS エラーで失敗する。

[備考]
hKey がリモートコンピュータ上のキーを表す場合、lpFile
で指定されたパスはリモートコンピュータに対する相対となる。RegSaveKey
関数は不揮発性キーのみを保存し、揮発性キーは保存しない。キーは作成時に揮発性または不揮発性となる。RegCreateKeyEx
を参照のこと。RegSaveKey で作成したファイルは、RegLoadKey、RegReplaceKey、または
RegRestoreKey 関数の後続の呼び出しで使用できる。RegSaveKey
が操作の途中で失敗した場合、ファイルは破損し、そのファイルに対する
RegLoadKey、RegReplaceKey、RegRestoreKey の後続の呼び出しは失敗する。RegSaveKey と
RegRestoreKey
を併用してレジストリ内のサブツリーをコピーすることは推奨されない。この方法は通知をトリガーせず、他のアプリケーションが使用しているハンドルを無効にする可能性がある。代わりに
SHCopyKey 関数または RegCopyTree 関数を使用すること。呼び出し側プロセスは SE_BACKUP_NAME
特権を有効にしておく必要がある。詳細は特殊な特権での実行を参照のこと。
> [!NOTE] > winreg.h ヘッダは RegSaveKey をエイリアスとして定義しており、UNICODE
プリプロセッサ定数の定義に基づいて ANSI または Unicode
版を自動的に選択する。エンコーディングに中立なエイリアスをエンコーディング中立でないコードと混在させると、コンパイル時または実行時エラーとなる可能性がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照のこと。


%index
RegSetKeyValueW
指定したレジストリキーおよびサブキー内の指定した値にデータを設定する。(Unicode)
%group
Win32 advapi32
%prm
hKey, lpSubKey, lpValueName, dwType, lpData, cbData
hKey : [intptr] 開かれているレジストリキーへのハンドル。キーは KEY_SET_VALUE アクセス権で開かれている必要がある。詳細はレジストリキーのセキュリティとアクセス権を参照のこと。
lpSubKey : [wstr] hKey で識別されるキーに対する相対的なサブキーの名前。サブキーが存在しない場合、既定のセキュリティ記述子を持つ不揮発性キーとして作成される。このパラメータが NULL の場合、hKey で指定されたキーに値が作成される。
lpValueName : [wstr] データを更新するレジストリ値の名前。
dwType : [int] lpData パラメータが指すデータの型。型の一覧についてはレジストリ値の型を参照のこと。
lpData : [intptr] 指定した値名と一緒に格納するデータ。REG_SZ などの文字列ベースの型では、文字列は null で終端されている必要がある。REG_MULTI_SZ データ型では、文字列は 2 つの null 文字で終端されている必要がある。
cbData : [int] lpData パラメータが指す情報のサイズ（バイト単位）。データの型が REG_SZ、REG_EXPAND_SZ、または REG_MULTI_SZ の場合、cbData には終端 null 文字のサイズを含めなければならない。
%inst
指定したレジストリキーおよびサブキー内の指定した値にデータを設定する。(Unicode)

[戻り値]
関数が成功した場合、戻り値は ERROR_SUCCESS となる。関数が失敗した場合、戻り値は Winerror.h で定義された 0
以外のエラーコードとなる。FormatMessage 関数に FORMAT_MESSAGE_FROM_SYSTEM
フラグを指定して呼び出すと、エラーの一般的な説明を取得できる。

[備考]
この関数を使用するアプリケーションをコンパイルするには、_WIN32_WINNT を 0x0600 以降に定義する。詳細は Windows
ヘッダの使用を参照のこと。
> [!NOTE] > winreg.h ヘッダは RegSetKeyValue をエイリアスとして定義しており、UNICODE
プリプロセッサ定数の定義に基づいて ANSI または Unicode
版を自動的に選択する。エンコーディングに中立なエイリアスをエンコーディング中立でないコードと混在させると、コンパイル時または実行時エラーとなる可能性がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照のこと。


%index
RegSetValueW
指定したレジストリキーの既定値または無名値にデータを設定する。データはテキスト文字列でなければならない。(Unicode)
%group
Win32 advapi32
%prm
hKey, lpSubKey, dwType, lpData, cbData
hKey : [intptr] 開かれているレジストリキーへのハンドル。キーは KEY_SET_VALUE アクセス権で開かれている必要がある。詳細はレジストリキーのセキュリティとアクセス権を参照のこと。
lpSubKey : [wstr] hKey パラメータのサブキーの名前。関数は指定したサブキーの既定値を設定する。lpSubKey が存在しない場合、関数はそれを作成する。キー名は大文字小文字を区別しない。このパラメータが NULL または空文字列を指す場合、関数は hKey で識別されるキーの既定値を設定する。詳細はレジストリ要素サイズ制限を参照のこと。
dwType : [int] 格納する情報の型。このパラメータは REG_SZ 型でなければならない。その他のデータ型を格納するには RegSetValueEx 関数を使用する。
lpData : [wstr] 格納するデータ。このパラメータは NULL にできない。
cbData : [int] このパラメータは無視される。関数は lpData パラメータのデータのサイズに基づいてこの値を計算する。
%inst
指定したレジストリキーの既定値または無名値にデータを設定する。データはテキスト文字列でなければならない。(Unicode)

[戻り値]
関数が成功した場合、戻り値は ERROR_SUCCESS となる。関数が失敗した場合、戻り値は Winerror.h で定義された 0
以外のエラーコードとなる。FormatMessage 関数に FORMAT_MESSAGE_FROM_SYSTEM
フラグを指定して呼び出すと、エラーの一般的な説明を取得できる。

[備考]
lpSubKey パラメータで指定したキーが存在しない場合、RegSetValue 関数はそれを作成する。この関数の ANSI
版が（明示的に RegSetValueA を呼び出すか、Windows.h のインクルード前に UNICODE
を定義しないことで）使用されている場合、lpData パラメータは ANSI 文字列でなければならない。文字列はレジストリに格納される前に
Unicode に変換される。
> [!NOTE] > winreg.h ヘッダは RegSetValue をエイリアスとして定義しており、UNICODE
プリプロセッサ定数の定義に基づいて ANSI または Unicode
版を自動的に選択する。エンコーディングに中立なエイリアスをエンコーディング中立でないコードと混在させると、コンパイル時または実行時エラーとなる可能性がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照のこと。


%index
RegisterEventSourceW
指定したイベントログに対する登録済みハンドルを取得する。(Unicode)
%group
Win32 advapi32
%prm
lpUNCServerName, lpSourceName
lpUNCServerName : [wstr] この操作を実行するリモートサーバの UNC (Universal Naming Convention) 名。このパラメータが NULL の場合、ローカルコンピュータが使用される。
lpSourceName : [wstr] ハンドルを取得するイベントソースの名前。ソース名は Eventlog レジストリキーの下のログのサブキーでなければならない。Security ログはシステム専用である点に注意のこと。注意: この文字列には、&lt; や &gt; のような XML エスケープシーケンスを除き、XML 属性で禁止されている文字を含めてはならない。
%inst
指定したイベントログに対する登録済みハンドルを取得する。(Unicode)

[戻り値]
関数が成功した場合、戻り値はイベントログへのハンドルとなる。
関数が失敗した場合、戻り値は NULL となる。拡張エラー情報を取得するには GetLastError
を呼び出す。lpSourceName が Security イベントログを指定している場合、関数は ERROR_ACCESS_DENIED
を返す。

[備考]
ソース名が見つからない場合、イベントログサービスは Application
ログを使用する。イベントは報告されるが、イベント識別子に関連する説明を検索するためのメッセージおよびカテゴリメッセージファイルがないため、説明は含まれない。イベントログへのハンドルを閉じるには、DeregisterEventSource
関数を使用する。


%index
RegisterServiceCtrlHandlerW
サービス制御要求を処理する関数を登録する。(Unicode)
%group
Win32 advapi32
%prm
lpServiceName, lpHandlerProc
lpServiceName : [wstr] 呼び出しスレッドが実行するサービスの名前。これは、サービス制御プログラムがサービス作成時に CreateService 関数で指定したサービス名である。
lpHandlerProc : [int] 登録するハンドラ関数へのポインタ。詳細は Handler を参照のこと。
%inst
サービス制御要求を処理する関数を登録する。(Unicode)

[戻り値]
関数が成功した場合、戻り値はサービスステータスハンドルとなる。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼び出す。以下のエラーコードがサービス制御マネージャによって設定される場合がある。
（以下省略）

[備考]
新しいサービスの ServiceMain 関数は、ただちに RegisterServiceCtrlHandler
関数を呼び出してコントロールディスパッチャに制御ハンドラ関数を登録すべきである。これにより、コントロールディスパッチャはこのサービスに対する制御要求を受け取ったときに指定した関数を呼び出せるようになる。指定可能な制御コードの一覧については
Handler を参照のこと。呼び出し側プロセスのスレッドは、この関数が返すサービスステータスハンドルを使用して、その後の
SetServiceStatus 関数の呼び出しでサービスを識別できる。RegisterServiceCtrlHandler 関数は最初の
SetServiceStatus 呼び出しより前に呼び出す必要がある。これは RegisterServiceCtrlHandler
が呼び出し側で使用するサービスステータスハンドルを返し、他のサービスがこのサービス状態を誤って設定できないようにするためである。さらに、サービスが
SetServiceStatus
関数を通じて受け入れる制御を指定するまでに、制御ハンドラが制御要求を受け取れる状態になっていなければならない。制御ハンドラ関数が制御要求とともに呼び出されたとき、サービスはサービス状態が変化した場合にのみ（停止やシャットダウン制御の処理時など）SetServiceStatus
を呼び出してサービス制御マネージャに状態を報告する必要がある。サービス状態が変化していない場合、サービスはサービス制御マネージャに状態を報告すべきではない。サービスステータスハンドルは閉じる必要はない。


%index
RegisterServiceCtrlHandlerExW
拡張サービス制御要求を処理する関数を登録する。(Unicode)
%group
Win32 advapi32
%prm
lpServiceName, lpHandlerProc, lpContext
lpServiceName : [wstr] 呼び出しスレッドが実行するサービスの名前。これは、サービス制御プログラムがサービス作成時に CreateService 関数で指定したサービス名である。
lpHandlerProc : [int] 登録するハンドラ関数へのポインタ。詳細は HandlerEx を参照のこと。
lpContext : [intptr] ユーザ定義のデータ。ハンドラ関数に渡されるこのパラメータは、複数のサービスがプロセスを共有しているときにサービスを識別するのに役立つ。
%inst
拡張サービス制御要求を処理する関数を登録する。(Unicode)

[戻り値]
関数が成功した場合、戻り値はサービスステータスハンドルとなる。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼び出す。以下のエラーコードがサービス制御マネージャによって設定される場合がある。
（以下省略）

[備考]
新しいサービスの ServiceMain 関数は、ただちに RegisterServiceCtrlHandlerEx
関数を呼び出してコントロールディスパッチャに制御ハンドラ関数を登録すべきである。これにより、コントロールディスパッチャはこのサービスに対する制御要求を受け取ったときに指定した関数を呼び出せるようになる。指定可能な制御コードの一覧については
HandlerEx を参照のこと。呼び出し側プロセスのスレッドは、この関数が返すサービスステータスハンドルを使用して、その後の
SetServiceStatus 関数の呼び出しでサービスを識別できる。RegisterServiceCtrlHandlerEx
関数は最初の SetServiceStatus 呼び出しより前に呼び出す必要がある。これは
RegisterServiceCtrlHandlerEx
が呼び出し側で使用するサービスステータスハンドルを返し、他のサービスがこのサービス状態を誤って設定できないようにするためである。さらに、サービスが
SetServiceStatus
関数を通じて受け入れる制御を指定するまでに、制御ハンドラが制御要求を受け取れる状態になっていなければならない。制御ハンドラ関数が制御要求とともに呼び出されたとき、サービスはサービス状態が変化した場合にのみ（停止やシャットダウン制御の処理時など）SetServiceStatus
を呼び出してサービス制御マネージャに状態を報告する必要がある。サービス状態が変化していない場合、サービスはサービス制御マネージャに状態を報告すべきではない。サービスステータスハンドルは閉じる必要はない。
> [!NOTE] > winsvc.h ヘッダは RegisterServiceCtrlHandlerEx
をエイリアスとして定義しており、UNICODE プリプロセッサ定数の定義に基づいて ANSI または Unicode
版を自動的に選択する。エンコーディングに中立なエイリアスをエンコーディング中立でないコードと混在させると、コンパイル時または実行時エラーとなる可能性がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照のこと。


%index
RegisterWaitChainCOMCallback
WCT 用の COM コールバック関数を登録する。
%group
Win32 advapi32
%prm
CallStateCallback, ActivationStateCallback
CallStateCallback : [int] CoGetCallState 関数のアドレス。
ActivationStateCallback : [int] CoGetActivationState 関数のアドレス。
%inst
WCT 用の COM コールバック関数を登録する。

[備考]
スレッドが COM 呼び出しでブロックされている場合、WCT はこれらのコールバック関数を使用して COM
の所有権情報を取得できる。この関数が複数回呼び出された場合、最後に取得されたアドレスのみが使用される。


%index
RemoveUsersFromEncryptedFile
指定したファイルから指定した証明書ハッシュを削除する。
%group
Win32 advapi32
%prm
lpFileName, pHashes
lpFileName : [wstr] ファイルの名前。
pHashes : [var] ファイルから削除する証明書ハッシュのリストを含む ENCRYPTION_CERTIFICATE_HASH_LIST 構造体へのポインタ。
%inst
指定したファイルから指定した証明書ハッシュを削除する。

[戻り値]
関数が成功した場合、戻り値は ERROR_SUCCESS
となる。関数が失敗した場合、戻り値はシステムエラーコードとなる。エラーコードの完全な一覧については、システムエラーコードまたはヘッダファイル
WinError.h を参照のこと。

[備考]
RemoveUsersFromEncryptedFile
関数は、指定したファイルに存在する場合に指定した証明書ハッシュを削除する。指定したファイルに証明書ハッシュが見つからない場合は無視され、エラーコードは返されない。Windows
8 および Windows Server 2012 以降では、本関数は以下の技術によってサポートされる。
（以下省略）


%index
ReportEventW
指定したイベントログの末尾にエントリを書き込む。(Unicode)
%group
Win32 advapi32
%prm
hEventLog, wType, wCategory, dwEventID, lpUserSid, wNumStrings, dwDataSize, lpStrings, lpRawData
hEventLog : [intptr] イベントログへのハンドル。RegisterEventSource 関数がこのハンドルを返す。Windows XP SP2 以降、このパラメータは Security ログへのハンドルにできない。Security ログにイベントを書き込むには、AuthzReportSecurityEvent 関数を使用する。
wType : [int] 
wCategory : [int] イベントカテゴリ。これはソース固有の情報で、カテゴリは任意の値にできる。詳細はイベントカテゴリを参照のこと。
dwEventID : [int] イベント識別子。イベント識別子はイベントソースに関連付けられたメッセージファイル内のエントリを指定する。詳細はイベント識別子を参照のこと。
lpUserSid : [int] 現在のユーザのセキュリティ識別子へのポインタ。セキュリティ識別子が不要な場合、このパラメータは NULL にできる。
wNumStrings : [int] lpStrings パラメータが指す配列内の挿入文字列の数。値 0 は文字列が存在しないことを示す。
dwDataSize : [int] ログに書き込むイベント固有の生 (バイナリ) データのバイト数。このパラメータが 0 の場合、イベント固有のデータは存在しない。
lpStrings : [var] イベントビューアがユーザに文字列を表示する前にメッセージにマージされる、null 終端文字列の配列を含むバッファへのポインタ。このパラメータは、wNumStrings が 0 であっても有効なポインタ（または NULL）でなければならない。各文字列は 31,839 文字までに制限される。Windows Vista より前: 各文字列は 32K 文字までに制限される。
lpRawData : [intptr] バイナリデータを含むバッファへのポインタ。このパラメータは、dwDataSize パラメータが 0 であっても有効なポインタ（または NULL）でなければならない。
%inst
指定したイベントログの末尾にエントリを書き込む。(Unicode)

[戻り値]
関数が成功した場合、戻り値は 0 以外となり、エントリがログに書き込まれたことを示す。
関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには GetLastError
を呼び出す。以下の拡張エラーコードのいずれかが返される。
（以下省略）

[備考]
この関数はイベントを記録するために使用する。エントリは hEventLog
パラメータで識別されるソース用に構成されたログの末尾に書き込まれる。ReportEvent
関数は、エントリをログに格納する前に時刻、エントリの長さ、オフセットを追加する。関数がユーザ名を追加できるようにするには、lpUserSid
パラメータにユーザの SID
を指定する必要がある。記録できるメッセージデータのサイズ制限は、アプリケーションを実行するクライアントとメッセージが記録されるサーバの
Windows バージョンに応じて異なる。サーバは RegisterEventSource 関数に渡される lpUNCServerName
パラメータによって決定される。サイズ制限を超えた場合、Windows のバージョンに応じて異なるエラーが返される。ログに記録する文字列に
%n（n は整数値、たとえば %1）が含まれる場合、イベントビューアはそれを挿入文字列として扱う。IPv6
アドレスにはこの文字シーケンスを含めることができるため、IPv6 アドレスを含むイベントメッセージを記録するにはフォーマット指定子
(!S!) を指定する必要がある。この指定子は書式化コードに対して文字列をそのまま使用しさらなる展開を行わないよう指示する（たとえば
"my IPv6 address is: %1!S!" のように）。


%index
RevertToSelf
クライアントアプリケーションのインパーソネーションを終了する。
%group
Win32 advapi32
%prm

%inst
クライアントアプリケーションのインパーソネーションを終了する。

[戻り値]
関数が成功した場合、戻り値は 0 以外となる。
関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには GetLastError を呼び出す。

[備考]

プロセスは、DdeImpersonateClient、ImpersonateDdeClientWindow、ImpersonateLoggedOnUser、ImpersonateNamedPipeClient、ImpersonateSelf、ImpersonateAnonymousToken、または
SetThreadToken 関数を使用して開始したインパーソネーションを終了した後、RevertToSelf
関数を呼び出すべきである。RpcImpersonateClient 関数を使用してクライアントをインパーソネートした RPC
サーバは、RpcRevertToSelf または RpcRevertToSelfEx
を呼び出してインパーソネーションを終了する必要がある。RevertToSelf
が失敗した場合、アプリケーションは引き続きクライアントのコンテキストで実行されるが、これは適切でない。RevertToSelf
が失敗した場合はプロセスをシャットダウンすべきである。


%index
SaferCloseLevel
SaferIdentifyLevel 関数または SaferCreateLevel 関数を使用して開かれた SAFER_LEVEL_HANDLE を閉じる。
%group
Win32 advapi32
%prm
hLevelHandle
hLevelHandle : [intptr] 閉じる SAFER_LEVEL_HANDLE。
%inst
SaferIdentifyLevel 関数または SaferCreateLevel 関数を使用して開かれた
SAFER_LEVEL_HANDLE を閉じる。

[戻り値]
関数が成功した場合は TRUE、そうでなければ FALSE。拡張エラー情報を取得するには GetLastError を呼び出す。


%index
SaferComputeTokenFromLevel
SAFER_LEVEL_HANDLE で指定された制限を使用してトークンを制限する。
%group
Win32 advapi32
%prm
LevelHandle, InAccessToken, OutAccessToken, dwFlags, lpReserved
LevelHandle : [intptr] 入力トークンに適用する制限を含む SAFER_LEVEL_HANDLE。LevelId が SAFER_LEVELID_FULLYTRUSTED または SAFER_LEVELID_DISALLOWED のハンドルをこの関数に渡してはならない。これは、SAFER_LEVELID_FULLYTRUSTED は制限がなく、SAFER_LEVELID_DISALLOWED はトークンを含まないためである。
InAccessToken : [intptr] 制限するトークン。このパラメータが NULL の場合、現在のスレッドのトークンが使用される。現在のスレッドがトークンを保持していない場合、現在のプロセスのトークンが使用される。
OutAccessToken : [intptr] 結果として得られる制限付きトークン。
dwFlags : [int] 
lpReserved : [intptr] SAFER_TOKEN_COMPARE_ONLY フラグが設定されている場合、このパラメータは出力時にトークン比較の結果を指定する。出力値は LPDWORD である。値 ?1 は、結果として得られるトークンが InAccessToken パラメータで指定されたトークンよりも特権が少ないことを示す。SAFER_TOKEN_WANT_FLAGS フラグが設定され、SAFER_TOKEN_COMPARE_ONLY フラグが設定されていない場合、このパラメータは制限付きトークンの作成に使用されたフラグを指定する LPDWORD 値となる。
%inst
SAFER_LEVEL_HANDLE で指定された制限を使用してトークンを制限する。

[戻り値]
関数が成功した場合は TRUE、そうでなければ FALSE。拡張情報を取得するには GetLastError を呼び出す。


%index
SaferCreateLevel
SAFER_LEVEL_HANDLE を開く。
%group
Win32 advapi32
%prm
dwScopeId, dwLevelId, OpenFlags, pLevelHandle, lpReserved
dwScopeId : [int] 作成するレベルのスコープ。次の表に指定可能な値を示す。
dwLevelId : [int] 開くハンドルのレベル。次の表に指定可能な値を示す。
OpenFlags : [int] 次の値を指定できる。
pLevelHandle : [intptr] 返された SAFER_LEVEL_HANDLE。ハンドルの使用が終わったら、SaferCloseLevel 関数を呼び出して閉じる。
lpReserved : [intptr] このパラメータは将来のために予約されている。NULL に設定すること。
%inst
SAFER_LEVEL_HANDLE を開く。

[戻り値]
成功した場合は 0 以外、そうでない場合は 0 を返す。
拡張エラー情報を取得するには GetLastError を呼び出す。


%index
SaferGetLevelInformation
ポリシーレベルに関する情報を取得する。
%group
Win32 advapi32
%prm
LevelHandle, dwInfoType, lpQueryBuffer, dwInBufferSize, lpdwOutBufferSize
LevelHandle : [intptr] 問い合わせ対象のレベルのハンドル。
dwInfoType : [int] 返すべきオブジェクト情報の種類を指定する SAFER_OBJECT_INFO_CLASS 列挙値。指定された値によって lpQueryBuffer パラメータのサイズと型が決まる。次の表に指定可能な値を示す。
lpQueryBuffer : [intptr] 問い合わせ結果を格納するバッファ。dwInfoType パラメータの各値に対して返される情報の型については、dwInfoType パラメータを参照のこと。
dwInBufferSize : [int] lpQueryBuffer パラメータのサイズ（バイト単位）。
lpdwOutBufferSize : [var] lpQueryBuffer パラメータの出力サイズを返すためのポインタ。
%inst
ポリシーレベルに関する情報を取得する。

[戻り値]
関数が成功した場合は TRUE、そうでなければ FALSE。拡張エラー情報を取得するには GetLastError を呼び出す。


%index
SaferGetPolicyInformation
ポリシーに関する情報を取得する。
%group
Win32 advapi32
%prm
dwScopeId, SaferPolicyInfoClass, InfoBufferSize, InfoBuffer, InfoBufferRetSize, lpReserved
dwScopeId : [int] 問い合わせのスコープ。次の表に指定可能な値を示す。
SaferPolicyInfoClass : [int] 返すべきポリシー情報の種類を指定する SAFER_POLICY_INFO_CLASS 列挙値。指定された値によって InfoBuffer パラメータのサイズと型が決まる。次の表に指定可能な値を示す。
InfoBufferSize : [int] InfoBuffer パラメータのサイズ（バイト単位）。
InfoBuffer : [intptr] 問い合わせ結果を格納するバッファ。返される情報のサイズと型は SaferPolicyInfoClass パラメータによって決まる。SaferPolicyInfoClass パラメータの各値に対して返される情報の型については、SaferPolicyInfoClass パラメータを参照のこと。
InfoBufferRetSize : [var] InfoBuffer パラメータにポリシー情報が書き込まれたバイト数。
lpReserved : [intptr] 将来のために予約されている。このパラメータは NULL に設定すること。
%inst
ポリシーに関する情報を取得する。

[戻り値]
関数が成功した場合は TRUE、そうでなければ FALSE。拡張エラー情報を取得するには GetLastError を呼び出す。


%index
SaferIdentifyLevel
レベルに関する情報を取得する。
%group
Win32 advapi32
%prm
dwNumProperties, pCodeProperties, pLevelHandle, lpReserved
dwNumProperties : [int] pCodeproperties パラメータ内の SAFER_CODE_PROPERTIES 構造体の数。
pCodeProperties : [var] SAFER_CODE_PROPERTIES 構造体の配列。各構造体は、チェックするコードファイルとそのファイルのチェックに使用する基準を含む。
pLevelHandle : [intptr] 返された SAFER_LEVEL_HANDLE。ハンドルの使用が終わったら、SaferCloseLevel 関数を呼び出して閉じる。
lpReserved : [intptr] 将来のために予約されている。NULL に設定すること。Windows 8 および Windows Server 2012 以降、SRP_POLICY_APPX は Windows ストアアプリとして定義される。
%inst
レベルに関する情報を取得する。

[戻り値]
SAFER_LEVEL_HANDLE が開かれた場合は TRUE、そうでなければ FALSE。拡張エラー情報を取得するには
GetLastError を呼び出す。


%index
SaferRecordEventLogEntry
メッセージをイベントログに保存する。
%group
Win32 advapi32
%prm
hLevel, szTargetPath, lpReserved
hLevel : [intptr] イベントログに送信するルールの詳細を含む SAFER_LEVEL_HANDLE。
szTargetPath : [wstr] 実行を試みたファイルのパス。
lpReserved : [intptr] 将来のために予約されている。このパラメータは NULL に設定すること。
%inst
メッセージをイベントログに保存する。

[戻り値]
関数が成功した場合は TRUE、そうでなければ FALSE。拡張エラー情報を取得するには GetLastError を呼び出す。

[備考]
SaferIdentifyLevel が SAFER_LEVELID_FULLYTRUSTED (0x40000) 以外の LevelId
を持つ SAFER_LEVEL_HANDLE を返す場合、SaferRecordEventLogEntry
を呼び出してトラブルシューティングを容易にできる。たとえば、excel.exe
内のボタンをクリックすると、完全には信頼されていない別のプロセスが起動されることがある。プログラムが CreateProcess
から返されたエラーを再マップするため、分かりにくいエラーメッセージが表示されることがある。トラブルシューティングを容易にするため、一部の
Safer 関数は SaferRecordEventLogEntry を呼び出してイベントをイベントログに送信する。


%index
SaferSetLevelInformation
ポリシーレベルに関する情報を設定する。
%group
Win32 advapi32
%prm
LevelHandle, dwInfoType, lpQueryBuffer, dwInBufferSize
LevelHandle : [intptr] 設定するレベルのハンドル。
dwInfoType : [int] 設定すべきオブジェクト情報の種類を指定する SAFER_OBJECT_INFO_CLASS 列挙値。指定された値によって lpQueryBuffer パラメータのサイズと型が決まる。次の表に指定可能な値を示す。
lpQueryBuffer : [intptr] 問い合わせ結果を格納するバッファ。dwInfoType パラメータの各値に対して返される情報の型については、dwInfoType パラメータを参照のこと。
dwInBufferSize : [int] lpQueryBuffer パラメータのサイズ（バイト単位）。
%inst
ポリシーレベルに関する情報を設定する。

[戻り値]
関数が成功した場合は TRUE、そうでなければ FALSE。拡張エラー情報を取得するには GetLastError を呼び出す。


%index
SaferSetPolicyInformation
グローバルポリシー制御を設定する。
%group
Win32 advapi32
%prm
dwScopeId, SaferPolicyInfoClass, InfoBufferSize, InfoBuffer, lpReserved
dwScopeId : [int] 問い合わせのスコープ。次の表に指定可能な値を示す。
SaferPolicyInfoClass : [int] 設定すべきポリシー情報の種類を指定する SAFER_POLICY_INFO_CLASS 列挙値。指定された値によって InfoBuffer パラメータのサイズと型が決まる。次の表に指定可能な値を示す。
InfoBufferSize : [int] InfoBuffer パラメータのサイズ（バイト単位）。
InfoBuffer : [intptr] 問い合わせ結果を格納するバッファ。返される情報のサイズと型は SaferPolicyInfoClass パラメータによって決まる。SaferPolicyInfoClass パラメータの各値に対して返される情報の型については、SaferPolicyInfoClass パラメータを参照のこと。
lpReserved : [intptr] 将来のために予約されている。このパラメータは NULL に設定すること。
%inst
グローバルポリシー制御を設定する。

[戻り値]
関数が成功した場合は TRUE、そうでなければ FALSE。拡張エラー情報を取得するには GetLastError を呼び出す。


%index
SaferiIsExecutableFileType
指定したファイルが実行可能ファイルかどうかを判定する。
%group
Win32 advapi32
%prm
szFullPathname, bFromShellExecute
szFullPathname : [wstr] ファイルの名前を表す null 終端 Unicode 文字列へのポインタ。ファイル名拡張子のみが評価されるため、パスは省略可能である。ファイル名拡張子の評価は大文字小文字を区別しない。このパラメータを NULL や空文字列にすることはできず、指定したファイルはファイル名拡張子を含んでいなければならない。
bFromShellExecute : [int] ファイル種別の評価において .exe ファイルを実行可能ファイルとして扱うかどうかを決定するブール値。評価から .exe ファイルを除外するにはこの値を TRUE に、含めるには FALSE に設定する。
%inst
指定したファイルが実行可能ファイルかどうかを判定する。

[戻り値]
関数がファイル名の拡張子を実行可能ファイル種別として正常に認識した場合、戻り値は TRUE となる。関数が失敗した場合、または
szFullPath が実行可能でない拡張子のファイル名を識別する場合、関数は FALSE を返す。

[備考]
以下のファイル名拡張子は実行可能ファイル種別の例である。完全な一覧ではない。
（以下省略）


%index
SetAclInformation
アクセス制御リスト (ACL) に関する情報を設定する。
%group
Win32 advapi32
%prm
pAcl, pAclInformation, nAclInformationLength, dwAclInformationClass
pAcl : [var] ACL へのポインタ。この関数はこの ACL に情報を設定する。
pAclInformation : [intptr] 設定する情報を含むバッファへのポインタ。これは ACL_REVISION_INFORMATION 構造体へのポインタでなければならない。
nAclInformationLength : [int] pAclInfo パラメータが指すバッファのサイズ（バイト単位）。
dwAclInformationClass : [int] 要求された情報のクラスを与える ACL_INFORMATION_CLASS 列挙型。
%inst
アクセス制御リスト (ACL) に関する情報を設定する。

[戻り値]
関数が成功した場合、関数は 0 以外を返す。
関数が失敗した場合、0 を返す。拡張エラー情報を取得するには GetLastError を呼び出す。


%index
SetEncryptedFileMetadata
(no summary)
%group
Win32 advapi32
%prm
lpFileName, pbOldMetadata, pbNewMetadata, pOwnerHash, dwOperation, pCertificatesAdded
lpFileName : [wstr] 
pbOldMetadata : [var] 
pbNewMetadata : [var] 
pOwnerHash : [var] 
dwOperation : [int] 
pCertificatesAdded : [var] 
%inst



%index
SetEntriesInAclW
既存の ACL 構造体に新しいアクセス制御情報または監査制御情報をマージして、新しいアクセス制御リスト (ACL) を作成する。(Unicode)
%group
Win32 advapi32
%prm
cCountOfExplicitEntries, pListOfExplicitEntries, OldAcl, NewAcl
cCountOfExplicitEntries : [int] pListOfExplicitEntries 配列内の EXPLICIT_ACCESS 構造体の数。
pListOfExplicitEntries : [var] 既存の ACL にマージするアクセス制御情報を記述する EXPLICIT_ACCESS 構造体の配列へのポインタ。
OldAcl : [var] 既存の ACL へのポインタ。このパラメータは NULL にできる。その場合、関数は EXPLICIT_ACCESS エントリに基づいて新しい ACL を作成する。
NewAcl : [var] 新しい ACL へのポインタを受け取る変数へのポインタ。関数が成功した場合、返されたバッファを解放するために LocalFree 関数を呼び出す必要がある。
%inst
既存の ACL 構造体に新しいアクセス制御情報または監査制御情報をマージして、新しいアクセス制御リスト (ACL)
を作成する。(Unicode)

[戻り値]
関数が成功した場合、関数は ERROR_SUCCESS を返す。関数が失敗した場合、WinError.h で定義された 0
以外のエラーコードを返す。

[備考]
EXPLICIT_ACCESS 構造体の配列内の各エントリは、指定された受託者 (trustee)
に対するアクセス制御または監査制御情報を指定する。受託者は、ユーザ、グループ、またはログオン識別子やログオン種別（たとえば Windows
サービスやバッチジョブ）などのその他のセキュリティ識別子 (SID) 値にできる。受託者を識別するには、名前または SID
を使用できる。SetEntriesInAcl 関数を使用して、任意アクセス制御リスト (DACL) またはシステムアクセス制御リスト
(SACL) 内のアクセス制御エントリ (ACE) のリストを変更できる。SetEntriesInAcl は同一の ACL
内でアクセス制御情報と監査制御情報が混在することを防がない点に注意のこと。ただし、その結果生じる ACL
は意味のないエントリを含むことになる。DACL の場合、EXPLICIT_ACCESS 構造体の grfAccessMode
メンバは、受託者に対するアクセス権を許可、拒否、または取り消すかを指定する。このメンバには次のいずれかの値を指定できる:
（以下省略）


%index
SetFileSecurityW
SetFileSecurityW (Unicode) 関数 (securitybaseapi.h) は、ファイルまたはディレクトリオブジェクトのセキュリティを設定する。
%group
Win32 advapi32
%prm
lpFileName, SecurityInformation, pSecurityDescriptor
lpFileName : [wstr] セキュリティを設定する対象のファイルまたはディレクトリを指定する null 終端文字列へのポインタ。ディレクトリに適用されるセキュリティはその子には継承されない点に注意のこと。
SecurityInformation : [int] pSecurityDescriptor パラメータが指すセキュリティ記述子の内容を識別する SECURITY_INFORMATION 構造体を指定する。
pSecurityDescriptor : [int] SECURITY_DESCRIPTOR 構造体へのポインタ。
%inst
SetFileSecurityW (Unicode) 関数 (securitybaseapi.h)
は、ファイルまたはディレクトリオブジェクトのセキュリティを設定する。

[戻り値]
関数が成功した場合、関数は 0 以外を返す。関数が失敗した場合、0 を返す。拡張エラー情報を取得するには GetLastError
を呼び出す。

[備考]
SetFileSecurity 関数は、次の条件を満たす場合にのみ成功する:
（以下省略）


%index
SetKernelObjectSecurity
カーネルオブジェクトのセキュリティを設定する。
%group
Win32 advapi32
%prm
Handle, SecurityInformation, SecurityDescriptor
Handle : [intptr] セキュリティ情報を設定する対象のカーネルオブジェクトへのハンドル。
SecurityInformation : [int] 設定するセキュリティ情報の種類を示すビットフラグの集合。このパラメータには SECURITY_INFORMATION ビットフラグの組み合わせを指定できる。
SecurityDescriptor : [int] 新しいセキュリティ情報を含む SECURITY_DESCRIPTOR 構造体へのポインタ。
%inst
カーネルオブジェクトのセキュリティを設定する。

[戻り値]
関数が成功した場合、関数は 0 以外を返す。
関数が失敗した場合、0 を返す。拡張エラー情報を取得するには GetLastError を呼び出す。


%index
SetNamedSecurityInfoW
指定したオブジェクトのセキュリティ記述子に、指定したセキュリティ情報を設定する。(Unicode)
%group
Win32 advapi32
%prm
pObjectName, ObjectType, SecurityInfo, psidOwner, psidGroup, pDacl, pSacl
pObjectName : [wstr] セキュリティ情報を設定する対象のオブジェクトの名前を指定する null 終端文字列へのポインタ。これは NTFS ファイルシステム上のローカルまたはリモートファイル/ディレクトリ、ネットワーク共有、レジストリキー、セマフォ、イベント、ミューテックス、ファイルマッピング、または待機可能タイマの名前にできる。
ObjectType : [int] pObjectName パラメータで指定されるオブジェクトの種類を示す SE_OBJECT_TYPE 列挙の値。
SecurityInfo : [int] 設定するセキュリティ情報の種類を示すビットフラグの集合。このパラメータには SECURITY_INFORMATION ビットフラグの組み合わせを指定できる。
psidOwner : [int] オブジェクトの所有者を識別する SID 構造体へのポインタ。呼び出し側が SeRestorePrivilege 定数（特権定数を参照のこと）を持たない場合、この SID は呼び出し側のトークンに含まれている必要があり、SE_GROUP_OWNER パーミッションが有効になっている必要がある。SecurityInfo パラメータには OWNER_SECURITY_INFORMATION フラグが含まれている必要がある。所有者を設定するには、呼び出し側はオブジェクトに対する WRITE_OWNER アクセス権を持つか、SE_TAKE_OWNERSHIP_NAME 特権を有効にしている必要がある。所有者 SID を設定しない場合、このパラメータは NULL にできる。
psidGroup : [int] オブジェクトのプライマリグループを識別する SID へのポインタ。SecurityInfo パラメータには GROUP_SECURITY_INFORMATION フラグが含まれている必要がある。プライマリグループ SID を設定しない場合、このパラメータは NULL にできる。
pDacl : [var] オブジェクトの新しい DACL へのポインタ。SecurityInfo パラメータには DACL_SECURITY_INFORMATION フラグが含まれている必要がある。呼び出し側はオブジェクトに対する WRITE_DAC アクセス権を持っているか、オブジェクトの所有者でなければならない。DACL を設定しない場合、このパラメータは NULL にできる。
pSacl : [var] オブジェクトの新しい SACL へのポインタ。SecurityInfo パラメータは、SACL_SECURITY_INFORMATION、LABEL_SECURITY_INFORMATION、ATTRIBUTE_SECURITY_INFORMATION、SCOPE_SECURITY_INFORMATION、または BACKUP_SECURITY_INFORMATION のいずれかのフラグを含んでいる必要がある。
%inst
指定したオブジェクトのセキュリティ記述子に、指定したセキュリティ情報を設定する。(Unicode)

[戻り値]
関数が成功した場合、関数は ERROR_SUCCESS を返す。関数が失敗した場合、WinError.h で定義された 0
以外のエラーコードを返す。

[備考]
オブジェクトの任意アクセス制御リスト (DACL) またはシステムアクセス制御リスト (SACL)
の要素を設定する場合、システムは継承規則に従って、継承可能なアクセス制御エントリ (ACE)
を既存の子オブジェクトに自動的に伝播する。SetNamedSecurityInfo 関数は以下の種類のオブジェクトに使用できる:
（以下省略）


%index
SetPrivateObjectSecurity
プライベートオブジェクトのセキュリティ記述子を変更する。
%group
Win32 advapi32
%prm
SecurityInformation, ModificationDescriptor, ObjectsSecurityDescriptor, GenericMapping, Token
SecurityInformation : [int] 設定するセキュリティ記述子の部分を示す。この値は SECURITY_INFORMATION ビットフラグの組み合わせにできる。
ModificationDescriptor : [int] SECURITY_DESCRIPTOR 構造体へのポインタ。SecurityInformation パラメータで示されるこのセキュリティ記述子の部分が、ObjectsSecurityDescriptor セキュリティ記述子に適用される。
ObjectsSecurityDescriptor : [var] SECURITY_DESCRIPTOR 構造体へのポインタへのポインタ。このセキュリティ記述子は自己相対形式でなければならない。**セキュリティ記述子のメモリはプロセスヒープ (GetProcessHeap) から HeapAlloc 関数で割り当てる必要がある。**
GenericMapping : [var] 各汎用アクセス権に対応する特定アクセス権と標準アクセス権を指定する GENERIC_MAPPING 構造体へのポインタ。
Token : [intptr] プライベートオブジェクトのセキュリティが変更されるクライアントのアクセストークンへのハンドル。このパラメータは、クライアントが新しい所有者のセキュリティ識別子 (SID) として正当な値を提供したことを確認するために必要である。トークンは TOKEN_QUERY アクセスで開かれている必要がある。
%inst
プライベートオブジェクトのセキュリティ記述子を変更する。

[戻り値]
関数が成功した場合、関数は 0 以外を返す。関数が失敗した場合、0 を返す。拡張エラー情報を取得するには GetLastError
を呼び出す。

[備考]

この関数はリソースマネージャのみの使用を目的としている。セキュリティ記述子を更新するための標準的なアクセス制御セマンティクスを実装するには、リソースマネージャは
SetPrivateObjectSecurity を呼び出す前に以下の条件を満たすことを確認する必要がある:
（以下省略）


%index
SetPrivateObjectSecurityEx
この関数を呼び出すリソースマネージャが管理するプライベートオブジェクトのセキュリティ記述子を変更する。
%group
Win32 advapi32
%prm
SecurityInformation, ModificationDescriptor, ObjectsSecurityDescriptor, AutoInheritFlags, GenericMapping, Token
SecurityInformation : [int] 設定するセキュリティ記述子の部分。この値は SECURITY_INFORMATION ビットフラグの組み合わせにできる。
ModificationDescriptor : [int] SECURITY_DESCRIPTOR 構造体へのポインタ。SecurityInformation パラメータで示されるこのセキュリティ記述子の部分が、ObjectsSecurityDescriptor セキュリティ記述子に適用される。
ObjectsSecurityDescriptor : [var] SECURITY_DESCRIPTOR 構造体へのポインタへのポインタ。このセキュリティ記述子は自己相対形式でなければならない。**セキュリティ記述子のメモリはプロセスヒープ (GetProcessHeap) から HeapAlloc 関数で割り当てる必要がある。**
AutoInheritFlags : [int] 
GenericMapping : [var] 各汎用アクセス権に対応する特定アクセス権と標準アクセス権を指定する GENERIC_MAPPING 構造体へのポインタ。
Token : [intptr] プライベートオブジェクトのセキュリティが変更されるクライアントのアクセストークンを識別する。このパラメータは、クライアントが新しい所有者のセキュリティ識別子 (SID) として正当な値を提供したことを確認するために必要である。トークンは TOKEN_QUERY アクセスで開かれている必要がある。
%inst
この関数を呼び出すリソースマネージャが管理するプライベートオブジェクトのセキュリティ記述子を変更する。

[戻り値]
関数が成功した場合、関数は 0 以外を返す。
関数が失敗した場合、0 を返す。拡張エラー情報を取得するには GetLastError を呼び出す。

[備考]
AutoInheritFlags パラメータが 0 の場合、SetPrivateObjectSecurityEx は
SetPrivateObjectSecurity
関数と同一である。この関数はリソースマネージャのみの使用を目的としている。セキュリティ記述子を更新するための標準的な Windows
アクセス制御セマンティクスを実装するには、リソースマネージャは SetPrivateObjectSecurityEx
を呼び出す前に以下の条件を満たすことを確認する必要がある:
（以下省略）


%index
SetSecurityAccessMask
指定したオブジェクトのセキュリティ情報を設定するために必要となるアクセス権限を表すアクセスマスクを作成する。
%group
Win32 advapi32
%prm
SecurityInformation, DesiredAccess
SecurityInformation : [int] 設定するセキュリティ情報を指定する SECURITY_INFORMATION 構造体。
DesiredAccess : [var] この関数が作成するアクセスマスクへのポインタ。
%inst
指定したオブジェクトのセキュリティ情報を設定するために必要となるアクセス権限を表すアクセスマスクを作成する。


%index
SetSecurityDescriptorControl
セキュリティ記述子の制御ビットを設定する。この関数は ACE の自動継承に関連する制御ビットのみを設定できる。
%group
Win32 advapi32
%prm
pSecurityDescriptor, ControlBitsOfInterest, ControlBitsToSet
pSecurityDescriptor : [int] 制御情報およびリビジョン情報が設定される SECURITY_DESCRIPTOR 構造体へのポインタ。
ControlBitsOfInterest : [int] 設定する制御ビットを示す SECURITY_DESCRIPTOR_CONTROL マスク。
ControlBitsToSet : [int] ControlBitsOfInterest マスクで指定された制御ビットの新しい値を示す SECURITY_DESCRIPTOR_CONTROL マスク。
%inst
セキュリティ記述子の制御ビットを設定する。この関数は ACE の自動継承に関連する制御ビットのみを設定できる。

[戻り値]
関数が成功した場合、戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼び出す。

[備考]
SetSecurityDescriptorControl 関数は、変更する制御ビットと、そのビットをオンにするかオフにするかを指定する。


%index
SetSecurityDescriptorDacl
任意アクセス制御リスト (DACL) に情報を設定する。セキュリティ記述子にすでに DACL が存在する場合、DACL は置き換えられる。
%group
Win32 advapi32
%prm
pSecurityDescriptor, bDaclPresent, pDacl, bDaclDefaulted
pSecurityDescriptor : [int] 関数が DACL を追加する SECURITY_DESCRIPTOR 構造体へのポインタ。このセキュリティ記述子は絶対形式でなければならず、そのメンバは連続データへのオフセットではなく他の構造体へのポインタでなければならない。
bDaclPresent : [int] セキュリティ記述子に DACL があることを示すフラグ。このパラメータが TRUE の場合、関数は SECURITY_DESCRIPTOR_CONTROL 構造体に SE_DACL_PRESENT フラグを設定し、pDacl および bDaclDefaulted パラメータの値を使用する。このパラメータが FALSE の場合、関数は SE_DACL_PRESENT フラグをクリアし、pDacl および bDaclDefaulted は無視される。
pDacl : [var] セキュリティ記述子の DACL を指定する ACL 構造体へのポインタ。このパラメータが NULL の場合、NULL DACL がセキュリティ記述子に割り当てられ、オブジェクトへのすべてのアクセスが許可される。DACL はセキュリティ記述子にコピーされるのではなく参照される。
bDaclDefaulted : [int] DACL のソースを示すフラグ。このフラグが TRUE の場合、DACL は何らかの既定メカニズムによって取得されたものである。FALSE の場合、DACL はユーザが明示的に指定したものである。関数はこの値を SECURITY_DESCRIPTOR_CONTROL 構造体の SE_DACL_DEFAULTED フラグに格納する。このパラメータが指定されない場合、SE_DACL_DEFAULTED フラグはクリアされる。
%inst
任意アクセス制御リスト (DACL) に情報を設定する。セキュリティ記述子にすでに DACL が存在する場合、DACL は置き換えられる。

[戻り値]
関数が成功した場合、関数は 0 以外を返す。関数が失敗した場合、0 を返す。拡張エラー情報を取得するには GetLastError
を呼び出す。

[備考]
空の DACL と存在しない DACL には重要な違いがある。DACL が空の場合、アクセス制御エントリ (ACE)
は含まれないため、アクセス権は明示的には付与されない。その結果、オブジェクトへのアクセスは暗黙的に拒否される。オブジェクトに DACL
がない場合（pDacl パラメータが NULL
の場合）、オブジェクトには保護が割り当てられず、すべてのアクセス要求が許可される。セキュリティを維持するため、DACL
を使用してアクセスを制限する。bDaclPresent フラグと pDacl パラメータの構成の違いによって、次の 3
通りの結果がありうる:
（以下省略）


%index
SetSecurityDescriptorGroup
絶対形式のセキュリティ記述子のプライマリグループ情報を設定し、セキュリティ記述子内に既に存在するプライマリグループ情報を置き換える。
%group
Win32 advapi32
%prm
pSecurityDescriptor, pGroup, bGroupDefaulted
pSecurityDescriptor : [int] この関数によってプライマリグループが設定される SECURITY_DESCRIPTOR 構造体へのポインタ。関数は既存のプライマリグループを新しいプライマリグループで置き換える。
pGroup : [int] セキュリティ記述子の新しいプライマリグループを表す SID 構造体へのポインタ。SID 構造体はセキュリティ記述子にコピーされるのではなく参照される。このパラメータが NULL の場合、関数はセキュリティ記述子のプライマリグループ情報をクリアする。これにより、セキュリティ記述子はプライマリグループを持たないものとしてマークされる。
bGroupDefaulted : [int] プライマリグループ情報が既定メカニズムから派生したものかどうかを示す。この値が TRUE の場合、既定情報であり、関数はこの値を SECURITY_DESCRIPTOR_CONTROL 構造体の SE_GROUP_DEFAULTED フラグとして格納する。このパラメータが 0 の場合、SE_GROUP_DEFAULTED フラグはクリアされる。
%inst
絶対形式のセキュリティ記述子のプライマリグループ情報を設定し、セキュリティ記述子内に既に存在するプライマリグループ情報を置き換える。

[戻り値]
関数が成功した場合、戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼び出す。


%index
SetSecurityDescriptorOwner
絶対形式のセキュリティ記述子の所有者情報を設定する。セキュリティ記述子内に既に存在する所有者情報は置き換えられる。
%group
Win32 advapi32
%prm
pSecurityDescriptor, pOwner, bOwnerDefaulted
pSecurityDescriptor : [int] この関数によって所有者が設定される SECURITY_DESCRIPTOR 構造体へのポインタ。関数は既存の所有者を新しい所有者で置き換える。
pOwner : [int] セキュリティ記述子の新しいプライマリ所有者を表す SID 構造体へのポインタ。SID 構造体はセキュリティ記述子にコピーされるのではなく参照される。このパラメータが NULL の場合、関数はセキュリティ記述子の所有者情報をクリアする。これにより、セキュリティ記述子は所有者を持たないものとしてマークされる。
bOwnerDefaulted : [int] 所有者情報が既定メカニズムから派生したものかどうかを示す。この値が TRUE の場合、既定情報である。関数はこの値を SECURITY_DESCRIPTOR_CONTROL 構造体の SE_OWNER_DEFAULTED フラグとして格納する。このパラメータが 0 の場合、SE_OWNER_DEFAULTED フラグはクリアされる。
%inst
絶対形式のセキュリティ記述子の所有者情報を設定する。セキュリティ記述子内に既に存在する所有者情報は置き換えられる。

[戻り値]
関数が成功した場合、戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼び出す。


%index
SetSecurityDescriptorRMControl
SECURITY_DESCRIPTOR 構造体内のリソースマネージャ制御ビットを設定する。
%group
Win32 advapi32
%prm
SecurityDescriptor, RMControl
SecurityDescriptor : [int] リソースマネージャ制御ビットを含む SECURITY_DESCRIPTOR 構造体へのポインタ。
RMControl : [var] SECURITY_DESCRIPTOR 構造体内のリソースマネージャ制御ビットに設定するビットフィールド値へのポインタ。このパラメータの値が NULL の場合、リソースマネージャ制御ビットはクリアされる。
%inst
SECURITY_DESCRIPTOR 構造体内のリソースマネージャ制御ビットを設定する。

[戻り値]
戻り値は ERROR_SUCCESS である。

[備考]
リソースマネージャ制御ビットは、この構造体にアクセスするリソースマネージャ固有の情報を含む SECURITY_INFORMATION
構造体の Sbz1 メンバ内の 8 ビットである。これらのビットへのアクセスは
GetSecurityDescriptorRMControl および SetSecurityDescriptorRMControl
関数を通じてのみ行うべきである。


%index
SetSecurityDescriptorSacl
システムアクセス制御リスト (SACL) に情報を設定する。セキュリティ記述子にすでに SACL が存在する場合、置き換えられる。
%group
Win32 advapi32
%prm
pSecurityDescriptor, bSaclPresent, pSacl, bSaclDefaulted
pSecurityDescriptor : [int] 関数が SACL を追加する SECURITY_DESCRIPTOR 構造体へのポインタ。このセキュリティ記述子は絶対形式でなければならず、そのメンバは連続データへのオフセットではなく他の構造体へのポインタでなければならない。
bSaclPresent : [int] セキュリティ記述子に SACL があることを示す。このパラメータが TRUE の場合、関数は SECURITY_DESCRIPTOR_CONTROL 構造体に SE_SACL_PRESENT フラグを設定し、pSacl および bSaclDefaulted パラメータの値を使用する。FALSE の場合、関数は SE_SACL_PRESENT フラグを設定せず、pSacl および bSaclDefaulted は無視される。
pSacl : [var] セキュリティ記述子の SACL を指定する ACL 構造体へのポインタ。このパラメータが NULL の場合、NULL SACL がセキュリティ記述子に割り当てられる。SACL はセキュリティ記述子にコピーされるのではなく参照される。
bSaclDefaulted : [int] SACL のソースを示す。このフラグが TRUE の場合、SACL は何らかの既定メカニズムによって取得されたものである。FALSE の場合、SACL はユーザが明示的に指定したものである。関数はこの値を SECURITY_DESCRIPTOR_CONTROL 構造体の SE_SACL_DEFAULTED フラグに格納する。このパラメータが指定されない場合、SE_SACL_DEFAULTED フラグはクリアされる。
%inst
システムアクセス制御リスト (SACL) に情報を設定する。セキュリティ記述子にすでに SACL が存在する場合、置き換えられる。

[戻り値]
関数が成功した場合、関数は 0 以外を返す。関数が失敗した場合、0 を返す。拡張エラー情報を取得するには GetLastError
を呼び出す。


%index
SetSecurityInfo
指定したオブジェクトのセキュリティ記述子に、指定したセキュリティ情報を設定する。呼び出し側はハンドルによってオブジェクトを識別する。
%group
Win32 advapi32
%prm
handle, ObjectType, SecurityInfo, psidOwner, psidGroup, pDacl, pSacl
handle : [intptr] セキュリティ情報を設定する対象のオブジェクトへのハンドル。
ObjectType : [int] handle パラメータで識別されるオブジェクトの種類を示す SE_OBJECT_TYPE 列挙のメンバ。
SecurityInfo : [int] 設定するセキュリティ情報の種類を示すビットフラグの集合。このパラメータには SECURITY_INFORMATION ビットフラグの組み合わせを指定できる。
psidOwner : [int] オブジェクトの所有者を識別する SID へのポインタ。SID は、セキュリティ記述子の所有者 SID として割り当て可能なものでなければならない。SecurityInfo パラメータには OWNER_SECURITY_INFORMATION フラグが含まれている必要がある。所有者 SID を設定しない場合、このパラメータは NULL にできる。
psidGroup : [int] オブジェクトのプライマリグループを識別する SID へのポインタ。SecurityInfo パラメータには GROUP_SECURITY_INFORMATION フラグが含まれている必要がある。プライマリグループ SID を設定しない場合、このパラメータは NULL にできる。
pDacl : [var] オブジェクトの新しい DACL へのポインタ。このパラメータは、SecurityInfo パラメータの値に DACL_SECURITY_INFORMATION フラグが含まれない限り無視される。SecurityInfo パラメータの値に DACL_SECURITY_INFORMATION フラグが含まれ、このパラメータの値が NULL に設定されている場合、オブジェクトへの完全アクセスがすべてのユーザに付与される。NULL DACL の詳細については、DACL の作成を参照のこと。
pSacl : [var] オブジェクトの新しい SACL へのポインタ。SecurityInfo パラメータは、SACL_SECURITY_INFORMATION、LABEL_SECURITY_INFORMATION、ATTRIBUTE_SECURITY_INFORMATION、SCOPE_SECURITY_INFORMATION、または BACKUP_SECURITY_INFORMATION のいずれかのフラグを含んでいる必要がある。SACL_SECURITY_INFORMATION または SCOPE_SECURITY_INFORMATION を設定する場合、呼び出し側は SE_SECURITY_NAME 特権を有効にしている必要がある。SACL を設定しない場合、このパラメータは NULL にできる。
%inst
指定したオブジェクトのセキュリティ記述子に、指定したセキュリティ情報を設定する。呼び出し側はハンドルによってオブジェクトを識別する。

[戻り値]
関数が成功した場合、関数は ERROR_SUCCESS を返す。関数が失敗した場合、WinError.h で定義された 0
以外のエラーコードを返す。

[備考]
オブジェクトの任意アクセス制御リスト (DACL) またはシステムアクセス制御リスト (SACL) の要素を設定する場合、システムは
ACE 継承規則に従って、継承可能なアクセス制御エントリ (ACE) を既存の子オブジェクトに自動的に伝播する。
SetSecurityInfo 関数は以下の種類のオブジェクトに使用できる:
（以下省略）


%index
SetServiceBits
サービスの種類をサービス制御マネージャおよび Server サービスに登録する。
%group
Win32 advapi32
%prm
hServiceStatus, dwServiceBits, bSetBitsOn, bUpdateImmediately
hServiceStatus : [intptr] サービスのステータス情報構造体へのハンドル。サービスは RegisterServiceCtrlHandlerEx 関数を呼び出してハンドルを取得する。
dwServiceBits : [int] サービスの種類。
bSetBitsOn : [int] この値が TRUE の場合、dwServiceBit のビットが設定される。この値が FALSE の場合、ビットはクリアされる。
bUpdateImmediately : [int] この値が TRUE の場合、Server サービスが即座に更新を実行する。この値が FALSE の場合、更新は即座には実行されない。
%inst
サービスの種類をサービス制御マネージャおよび Server サービスに登録する。

[戻り値]
関数が成功した場合、戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼び出す。


%index
SetServiceObjectSecurity
サービスオブジェクトのセキュリティ記述子を設定する。
%group
Win32 advapi32
%prm
hService, dwSecurityInformation, lpSecurityDescriptor
hService : [intptr] サービスへのハンドル。このハンドルは OpenService または CreateService 関数が返す。このハンドルに必要なアクセス権は、dwSecurityInformation パラメータで指定されるセキュリティ情報によって異なる。
dwSecurityInformation : [int] 
lpSecurityDescriptor : [int] 新しいセキュリティ情報を含む SECURITY_DESCRIPTOR 構造体へのポインタ。
%inst
サービスオブジェクトのセキュリティ記述子を設定する。

[戻り値]
関数が成功した場合、関数は 0 以外を返す。関数が失敗した場合、0 を返す。拡張エラー情報を取得するには GetLastError
を呼び出す。以下のエラーコードがサービス制御マネージャによって設定される場合がある。そのほかのエラーコードは、サービス制御マネージャが呼び出すレジストリ関数によって設定される場合がある。
（以下省略）

[備考]
SetServiceObjectSecurity 関数は、lpSecurityDescriptor
バッファで指定された情報に基づいて、サービスオブジェクトのセキュリティ記述子の指定された部分を設定する。この関数は、dwSecurityInformation
パラメータに設定されたフラグに従って、呼び出し側プロセスのアクセス権の範囲内で、サービスオブジェクトに関連付けられたセキュリティ情報の一部またはすべてを置き換える。サービスが作成されると、サービス制御マネージャはそのサービスオブジェクトに既定のセキュリティ記述子を割り当てる。サービスオブジェクトのセキュリティ記述子のコピーを取得するには、QueryServiceObjectSecurity
関数を呼び出す。サービスオブジェクトの既定のセキュリティ記述子については、サービスのセキュリティとアクセス権を参照のこと。信頼されていないユーザに対して特定のアクセス（SERVICE_CHANGE_CONFIG
や SERVICE_STOP など）を付与すると、そのユーザがサービスの実行を妨害したり、LocalSystem
アカウントでアプリケーションを実行したりすることができてしまう点に注意のこと。


%index
SetServiceStatus
呼び出し側サービスについて、サービス制御マネージャのステータス情報を更新する。
%group
Win32 advapi32
%prm
hServiceStatus, lpServiceStatus
hServiceStatus : [intptr] 現在のサービスのステータス情報構造体へのハンドル。このハンドルは RegisterServiceCtrlHandlerEx 関数が返す。
lpServiceStatus : [var] 呼び出し側サービスの最新のステータス情報を含む SERVICE_STATUS 構造体へのポインタ。
%inst
呼び出し側サービスについて、サービス制御マネージャのステータス情報を更新する。

[戻り値]
関数が成功した場合、戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError
を呼び出す。以下のエラーコードがサービス制御マネージャによって設定される場合がある。そのほかのエラーコードは、サービス制御マネージャが呼び出すレジストリ関数によって設定される場合がある。
（以下省略）

[備考]
ServiceMain 関数は最初に RegisterServiceCtrlHandlerEx 関数を呼び出してサービスの
SERVICE_STATUS_HANDLE を取得する。その後、ただちに SetServiceStatus
関数を呼び出してサービス制御マネージャに状態が SERVICE_START_PENDING
であることを通知する。初期化中、サービスは進行中であるが追加の時間が必要であることを示すために更新ステータスを提供できる。よくあるバグは、メインスレッドで初期化を行う一方、別のスレッドが
SetServiceStatus
を呼び出し続けて、サービス制御マネージャがハングとしてマークするのを防ぐというものである。しかし、メインスレッドがハングした場合、ワーカースレッドはメインスレッドが進行中であると報告し続けるため、サービスの起動は無限ループになる。制御要求を処理した後、サービスの
Handler 関数はサービス状態が変化した場合にサービス制御マネージャに新しい状態を報告するために SetServiceStatus
を呼び出さなければならない。これは、サービスが状態を変更する場合（停止やシャットダウン制御の処理時など）にのみ必要である。サービスは、回復可能なエラーによって停止しなければならない場合など、状態変更をサービス制御マネージャに通知するために、サービスの任意のスレッドから任意のタイミングでこの関数を使用することもできる。サービスがサービスステータスハンドルを取得するために
RegisterServiceCtrlHandlerEx を呼び出した後にのみ、この関数を呼び出すことができる。サービスが
dwCurrentState メンバを SERVICE_STOPPED に、dwWin32ExitCode メンバを 0
以外の値に設定して SetServiceStatus を呼び出すと、次のエントリがシステムイベントログに書き込まれる:
（以下省略）


%index
SetThreadToken
インパーソネーショントークンをスレッドに割り当てる。この関数は、スレッドがインパーソネーショントークンの使用を停止するようにすることもできる。
%group
Win32 advapi32
%prm
Thread, Token
Thread : [intptr] インパーソネーショントークンが割り当てられるスレッドへのハンドルへのポインタ。
Token : [intptr] スレッドに割り当てるインパーソネーショントークンへのハンドル。このハンドルは TOKEN_IMPERSONATE アクセス権で開かれている必要がある。詳細はアクセストークンオブジェクトのアクセス権を参照のこと。
%inst

インパーソネーショントークンをスレッドに割り当てる。この関数は、スレッドがインパーソネーショントークンの使用を停止するようにすることもできる。

[戻り値]
関数が成功した場合、戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼び出す。

[備考]
SetThreadToken 関数を使用してインパーソネートする場合、インパーソネート特権を持ち、RevertToSelf
関数を呼び出す前に SetThreadToken 関数が成功していることを確認する必要がある。


%index
SetTokenInformation
指定したアクセストークンに対して各種情報を設定する。
%group
Win32 advapi32
%prm
TokenHandle, TokenInformationClass, TokenInformation, TokenInformationLength
TokenHandle : [intptr] 情報を設定する対象のアクセストークンへのハンドル。
TokenInformationClass : [int] 関数が設定する情報の種類を識別する TOKEN_INFORMATION_CLASS 列挙型の値。TOKEN_INFORMATION_CLASS の有効な値は TokenInformation パラメータで説明されている。
TokenInformation : [intptr] アクセストークンに設定する情報を含むバッファへのポインタ。このバッファの構造は TokenInformationClass パラメータで指定される情報の種類によって異なる。
TokenInformationLength : [int] TokenInformation が指すバッファの長さをバイト単位で指定する。
%inst
指定したアクセストークンに対して各種情報を設定する。

[戻り値]
関数が成功した場合、関数は 0 以外を返す。関数が失敗した場合、0 を返す。拡張エラー情報を取得するには GetLastError
を呼び出す。

[備考]
特権情報を設定するには、アプリケーションは AdjustTokenPrivileges
関数を呼び出せる。トークンのグループを設定するには、アプリケーションは AdjustTokenGroups
関数を呼び出せる。トークン型情報はアクセストークンが作成されたときにのみ設定できる。


%index
SetUserFileEncryptionKey
ユーザの現在のキーを指定した証明書に設定する。
%group
Win32 advapi32
%prm
pEncryptionCertificate
pEncryptionCertificate : [var] ユーザのキーとなる証明書へのポインタ。このパラメータは ENCRYPTION_CERTIFICATE 構造体へのポインタである。
%inst
ユーザの現在のキーを指定した証明書に設定する。

[戻り値]
関数が成功した場合、戻り値は ERROR_SUCCESS
となる。関数が失敗した場合、戻り値はシステムエラーコードとなる。エラーコードの完全な一覧については、システムエラーコードまたはヘッダファイル
WinError.h を参照のこと。

[備考]
Windows 8 および Windows Server 2012 では、本関数は以下の技術によってサポートされる。
（以下省略）


%index
SetUserFileEncryptionKeyEx
(no summary)
%group
Win32 advapi32
%prm
pEncryptionCertificate, dwCapabilities, dwFlags, pvReserved
pEncryptionCertificate : [var] 
dwCapabilities : [int] 
dwFlags : [int] 
pvReserved : [intptr] 
%inst



%index
StartServiceW
サービスを開始する。(Unicode)
%group
Win32 advapi32
%prm
hService, dwNumServiceArgs, lpServiceArgVectors
hService : [intptr] サービスへのハンドル。このハンドルは OpenService または CreateService 関数が返すもので、SERVICE_START アクセス権を持っている必要がある。詳細はサービスのセキュリティとアクセス権を参照のこと。
dwNumServiceArgs : [int] lpServiceArgVectors 配列内の文字列数。lpServiceArgVectors が NULL の場合、このパラメータは 0 でよい。
lpServiceArgVectors : [var] サービスの ServiceMain 関数に引数として渡される null 終端文字列。引数がない場合、このパラメータは NULL にできる。そうでなければ、最初の引数 (lpServiceArgVectors[0]) はサービスの名前で、続いて追加の引数 (lpServiceArgVectors[1] から lpServiceArgVectors[dwNumServiceArgs-1]) が続く。ドライバサービスはこれらの引数を受け取らない。
%inst
サービスを開始する。(Unicode)

[戻り値]
関数が成功した場合、戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError
を呼び出す。以下のエラーコードがサービス制御マネージャによって設定される場合がある。そのほかのエラーコードは、サービス制御マネージャが呼び出すレジストリ関数によって設定される場合がある。
（以下省略）

[備考]
ドライバサービスが開始されるとき、StartService
関数はデバイスドライバが初期化を完了するまで復帰しない。サービスが開始されるとき、サービス制御マネージャ (SCM)
は必要に応じてサービスプロセスを生成する。指定したサービスが他のサービスとプロセスを共有している場合、必要なプロセスがすでに存在している可能性がある。StartService
関数は、新しいサービスからの最初のステータス更新を待たない。これには時間がかかる可能性があるためである。代わりに、SCM
がサービスコントロールディスパッチャからこのサービスの ServiceMain スレッドが正常に作成された通知を受け取ると復帰する。SCM
は StartService から復帰する前に次の既定のステータス値を設定する:
（以下省略）


%index
StartServiceCtrlDispatcherW
サービスプロセスのメインスレッドをサービス制御マネージャに接続し、そのスレッドを呼び出し側プロセスのサービス制御ディスパッチャスレッドにする。(Unicode)
%group
Win32 advapi32
%prm
lpServiceStartTable
lpServiceStartTable : [var] 呼び出し側プロセスで実行できる各サービスについて 1 エントリを含む SERVICE_TABLE_ENTRY 構造体の配列へのポインタ。テーブルの終わりを示すため、テーブルの最後のエントリのメンバは NULL 値を持たなければならない。
%inst

サービスプロセスのメインスレッドをサービス制御マネージャに接続し、そのスレッドを呼び出し側プロセスのサービス制御ディスパッチャスレッドにする。(Unicode)

[戻り値]
関数が成功した場合、戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError
を呼び出す。以下のエラーコードがサービス制御マネージャによって設定される場合がある。そのほかのエラーコードは、サービス制御マネージャが呼び出すレジストリ関数によって設定される場合がある。
（以下省略）

[備考]
サービス制御マネージャがサービスプロセスを起動すると、プロセスが StartServiceCtrlDispatcher
関数を呼び出すのを待つ。サービスプロセスのメインスレッドは、起動後できるだけ早く（30
秒以内に）この呼び出しを行うべきである。StartServiceCtrlDispatcher
が成功した場合、呼び出し側スレッドをサービス制御マネージャに接続し、プロセス内のすべての実行中サービスが SERVICE_STOPPED
状態になるまで復帰しない。サービス制御マネージャはこの接続を使用して、サービスプロセスのメインスレッドに制御要求とサービス開始要求を送信する。メインスレッドは、制御要求を処理するために適切な
HandlerEx 関数を呼び出したり、新しいサービスが開始されたときに適切な ServiceMain
関数を実行する新しいスレッドを作成したりするディスパッチャとして機能する。lpServiceTable
パラメータには、呼び出し側プロセスで実行できる各サービスのエントリが含まれる。各エントリはそのサービスの ServiceMain
関数を指定する。SERVICE_WIN32_SHARE_PROCESS
サービスでは、各エントリにサービス名を含める必要がある。この名前は、サービスがインストールされたときに CreateService
関数によって指定されたサービス名である。SERVICE_WIN32_OWN_PROCESS
サービスでは、テーブルエントリのサービス名は無視される。サービスが独自のプロセスで実行される場合、サービスプロセスのメインスレッドは直ちに
StartServiceCtrlDispatcher を呼び出すべきである。すべての初期化タスクは、サービスが開始されたときにサービスの
ServiceMain 関数内で行う。複数のサービスがプロセスを共有していて、いずれかの ServiceMain
関数が呼び出される前にプロセス全体の共通初期化を行う必要がある場合、メインスレッドは 30 秒未満であれば
StartServiceCtrlDispatcher
を呼び出す前にその作業を行える。そうでなければ、別のスレッドを作成してプロセス全体の初期化を行い、その間にメインスレッドが
StartServiceCtrlDispatcher
を呼び出してサービス制御ディスパッチャになる必要がある。サービス固有の初期化は、引き続き個々のサービスメイン関数で行うべきである。サービスはユーザインターフェイスを直接表示しようとすべきではない。詳細は対話型サービスを参照のこと。


%index
StartTraceW
StartTrace 関数はイベントトレースセッションを開始する。(Unicode)
%group
Win32 advapi32
%prm
TraceHandle, InstanceName, Properties
TraceHandle : [var] [ControlTrace](/windows/win32/api/evntrace/nf-evntrace-controltracew) などの API での後続の使用のために、イベントトレースセッションへのハンドルを受け取る。関数が失敗した場合、このハンドルを使用してはならない。セッションハンドルを INVALID_HANDLE_VALUE と比較してはならない。ハンドルが有効でない場合、セッションハンドルは 0 となる。
InstanceName : [wstr] イベントトレースセッションの名前を含む null 終端文字列。セッション名は 1,024 文字までに制限され、大文字小文字を区別せず、一意でなければならない。> [!Important] > セッションの所有者と使用目的がセッション名から判断できるように、セッションに説明的な名前を使用すること。GUID などの非決定論的または非記述的な値は使用しないこと。セッション名を一意にするためにランダムな数字を付加しないこと。ETW セッションは限られたリソースであるため、コンポーネントが複数のセッションを開始すべきではない。コンポーネントの開始時にコンポーネントのセッションがすでに実行中の場合、コンポーネントは 2 番目のセッションを作成するのではなく、孤立したセッションをクリーンアップすべきである。この関数は、指定されたセッション名を _Properties_ の **LoggerNameOffset** メンバが指すオフセットにコピーする。
Properties : [var] セッションの動作を指定する [EVENT_TRACE_PROPERTIES](/windows/win32/api/evntrace/ns-evntrace-event_trace_properties) 構造体へのポインタ。設定すべき主要な構造体メンバは次のとおり: - **Wnode.BufferSize** - **Wnode.Guid** - **Wnode.ClientContext** - **Wnode.Flags** - **LogFileMode** - **LogFileNameOffset** - **LoggerNameOffset** 作成するログファイルの種類に応じて、**MaximumFileSize** の値を指定する必要がある場合もある。_Properties_ パラメータの設定方法およびセッションの動作の詳細については、注釈セクションを参照のこと。**Windows 10 バージョン 1703 以降:** プロセス間シナリオでのパフォーマンス向上のため、システムワイドなプライベートロガーの開始時に **StartTrace** にフィルタリング情報を渡せるようになった。フィルタリング情報を含めるには、新しい [EVENT_TRACE_PROPERTIES_V2](/windows/win32/api/evntrace/ns-evntrace-event_trace_properties_v2) 構造体を渡す必要がある。詳細については [Configuring and Starting a Private Logger Session](/windows/win32/etw/configuring-and-starting-a-private-logger-session) を参照のこと。
%inst
StartTrace 関数はイベントトレースセッションを開始する。(Unicode)

[戻り値]
関数が成功した場合、戻り値は ERROR_SUCCESS となる。関数が失敗した場合、戻り値は
[システムエラーコード](/windows/win32/debug/system-error-codes)
のいずれかとなる。以下は代表的なエラーとその原因である。- **ERROR_BAD_LENGTH** 次のいずれかが発生している: -
_Properties_ の **Wnode.BufferSize** メンバが不正なサイズを指定している。- _Properties_
に _InstanceName_ のコピーを保持するための十分な領域が割り当てられていない。-
**ERROR_INVALID_PARAMETER** 次のいずれかが発生している: - _Properties_ が
**NULL**。- _TraceHandle_ が **NULL**。- _Properties_ の
**LogFileNameOffset** メンバが不正。- _Properties_ の **LoggerNameOffset**
メンバが不正。- _Properties_ の **LogFileMode** メンバが不正なフラグの組み合わせを指定している。-
**Wnode.Guid** メンバが **SystemTraceControlGuid** だが、_InstanceName_
パラメータが **KERNEL_LOGGER_NAME** でない。- **ERROR_ALREADY_EXISTS** 同じ名前または
GUID を持つセッションがすでに実行中である。- **ERROR_BAD_PATHNAME**
次のいずれかの理由でこのエラーが発生する可能性がある: - 別のセッションがすでに _Properties_ 構造体の
**LogFileNameOffset** メンバで指定されたファイル名を使用している。- **LogFileMode** と
**LogFileNameOffset** の両方が 0 である。- **ERROR_DISK_FULL**
ログファイル用のドライブに十分な空き領域がない。これは次の場合に発生する: - **MaximumFileSize** が 0
以外で、ログファイル用に **MaximumFileSize** バイトが利用可能でない - ドライブがシステムドライブで、追加の 200
MB が利用可能でない - **MaximumFileSize** が 0 で、追加の 200 MB が利用可能でない
より多くの空き領域のあるドライブを選ぶか、（使用している場合は）**MaximumFileSize** で指定するサイズを減らすこと。-
**ERROR_ACCESS_DENIED** 管理者特権を持つユーザ、Performance Log Users
グループのユーザ、LocalSystem / LocalService / NetworkService
として実行中のサービスのみがイベントトレースセッションを制御できる。制限付きユーザにトレースセッション制御権限を付与するには、Performance
Log Users グループに追加すること。管理者特権を持つユーザおよび LocalSystem として実行中のサービスのみが NT
カーネルロガーセッションを制御できる。ユーザが Performance Log Users
グループのメンバである場合、指定したフォルダにログファイルを作成する権限がない場合がある。-
**ERROR_NO_SYSTEM_RESOURCES** 次のいずれかが発生している: - ログセッションが
**EVENT_TRACE_SYSTEM_LOGGER_MODE** フラグを使用していて、システムロガーの最大数 (8) に達した。-
システム上のログセッションの最大数に達した。ログセッションが停止されるまで新しいロガーを作成することはできない。ほとんどのシステムでは、ログセッションの最大数は
64
である。`HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\WMI@EtwMaxLoggers`
の **REG_DWORD** キーを編集することで、システムのログセッションの最大数を変更できる。設定可能な値は 32 ～ 256
（両端含む）。変更を反映するには再起動が必要。ロガーはシステムリソースを使用する。これらのスロットが埋まる場合、システム上のロガー数を増やすとパフォーマンスコストがかかる。この制限はシステムリソースの過剰使用を防ぐために存在する。>
[!Important] >
この制限は特定のシナリオを有効にするためにシステム管理者が手動でのみ調整すべきである。EtwMaxLoggers
設定はプログラムやドライバによって自動的に変更してはならない。Windows 10 バージョン 1709
より前では、これは非プライベートロガーに対して 64 ロガーの固定上限である。

[備考]
イベントトレースコントローラがこの関数を呼び出す。セッションは、セッションが停止されるか、コンピュータが再起動されるか、I/O
エラーが発生するか、非循環ログで最大ファイルサイズに達するまでアクティブなままである。イベントトレースセッションを停止するには、_ControlCode_
パラメータを **EVENT_TRACE_CONTROL_STOP** に設定して
[ControlTrace](/windows/win32/api/evntrace/nf-evntrace-controltracew)
関数を呼び出す。同じセッション GUID（`Properties.Wnode.Guid`
で指定）を持つセッションを複数開始することはできない。ほとんどの場合、ETW システムがセッション用の新しい GUID
を生成できるように、`Properties.Wnode.Guid` をすべて 0 （つまり
**GUID_NULL**）に設定する。プライベートロガーセッションを指定するには、_Properties_ の
**Wnode.Guid** メンバをプロバイダの制御 GUID に設定する。プライベートロガーセッションの制御 GUID
ではない。プロバイダは **StartTrace** を呼び出す前にその GUID
を登録している必要がある。この関数はグローバルロガーセッション（廃止予定）の開始には使用しない。グローバルロガーセッションの開始の詳細については、[Configuring
and Starting the Global Logger
Session](/windows/win32/etw/configuring-and-starting-the-global-logger-session)
を参照のこと。


%index
StopTraceW
StopTraceW (Unicode) 関数 (evntrace.h) は、指定したイベントトレースセッションを停止する。ControlTrace 関数がこの関数に取って代わる。
%group
Win32 advapi32
%prm
TraceHandle, InstanceName, Properties
TraceHandle : [int] 停止するイベントトレースセッションへのハンドル、または 0。_InstanceName_ が **NULL** の場合は、0 以外の _TraceHandle_ を指定する必要がある。このパラメータは _InstanceName_ が **NULL** の場合にのみ使用される。ハンドルは [StartTrace](/windows/win32/api/evntrace/nf-evntrace-starttracew) が返す。
InstanceName : [wstr] 停止するイベントトレースセッションの名前、または **NULL**。_TraceHandle_ が 0 の場合は _InstanceName_ を指定する必要がある。NT カーネルロガーセッションを指定するには、_InstanceName_ に **KERNEL_LOGGER_NAME** を設定する。
Properties : [var] セッションの最終的なプロパティと統計情報を受け取る [EVENT_TRACE_PROPERTIES](/windows/desktop/ETW/event-trace-properties) 構造体へのポインタ。新しく初期化した構造体を使用する場合、構造体の **Wnode.BufferSize**、**Wnode.Guid**、**LoggerNameOffset**、および **LogFileNameOffset** メンバのみ設定する必要がある。バッファサイズとオフセットが不明な場合、最大セッション名（1024 文字）と最大ログファイル名（1024 文字）の長さを使用して計算できる。**Windows 10 バージョン 1703 以降:** プロセス間シナリオでのパフォーマンス向上のため、システムワイドなプライベートロガーに対して **StopTrace** にフィルタリング情報を渡せるようになった。フィルタリング情報を含めるには、新しい [EVENT_TRACE_PROPERTIES_V2](/windows/desktop/ETW/event-trace-properties-v2) 構造体を渡す必要がある。詳細については [Configuring and Starting a Private Logger Session](/windows/desktop/ETW/configuring-and-starting-a-private-logger-session) を参照のこと。
%inst
StopTraceW (Unicode) 関数 (evntrace.h)
は、指定したイベントトレースセッションを停止する。ControlTrace 関数がこの関数に取って代わる。

[戻り値]
関数が成功した場合、戻り値は ERROR_SUCCESS となる。関数が失敗した場合、戻り値は
[システムエラーコード](/windows/win32/debug/system-error-codes)
のいずれかとなる。以下は代表的なエラーとその原因である。- **ERROR_BAD_LENGTH** 次のいずれかが発生している: -
_Properties_ の **Wnode.BufferSize** メンバが不正なサイズを指定している。- _Properties_
にセッション名とログファイル名（使用時）のコピーを保持するための十分な領域が割り当てられていない。-
**ERROR_INVALID_PARAMETER** 次のいずれかが発生している: - _Properties_ が
**NULL**。- _InstanceName_ と _TraceHandle_ の両方が **NULL**。-
_InstanceName_ が **NULL** で _TraceHandle_ が有効なハンドルでない。-
**ERROR_ACCESS_DENIED** 管理者特権を持つユーザ、Performance Log Users
グループのユーザ、LocalSystem / LocalService / NetworkService
として実行中のサービスのみがイベントトレースセッションを制御できる。制限付きユーザにトレースセッション制御権限を付与するには、Performance
Log Users グループに追加すること。**Windows XP および Windows 2000:**
誰でもトレースセッションを制御できる。

[備考]
イベントトレースコントローラがこの関数を呼び出す。この関数は廃止予定である。代わりに、_ControlCode_ を
**EVENT_TRACE_CONTROL_STOP** に設定した
[ControlTrace](/windows/win32/api/evntrace/nf-evntrace-controltracew)
を使用する。**LogFileMode** に **EVENT_TRACE_FILE_MODE_PREALLOCATE**
が含まれる場合、[StartTrace](/windows/desktop/ETW/starttrace) はログファイルを
**MaximumFileSize**
バイトに拡張する。ファイルは、循環ログおよびシーケンシャルログの両方について、ログ記録中は領域全体を占有する。ロガーを停止すると、ログファイルは必要なサイズに縮小される。DllMain
から **StopTrace** を呼び出さないこと（デッドロックの原因となる可能性がある）。> [!NOTE] > evntrace.h
ヘッダは StopTrace をエイリアスとして定義しており、UNICODE プリプロセッサ定数の定義に基づいて ANSI または
Unicode
版を自動的に選択する。エンコーディングに中立なエイリアスをエンコーディング中立でないコードと混在させると、コンパイル時または実行時エラーとなる可能性がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照のこと。


%index
TraceSetInformation
イベントトレースセッションの設定を構成する。
%group
Win32 advapi32
%prm
SessionHandle, InformationClass, TraceInformation, InformationLength
SessionHandle : [int] 構成するイベントトレースセッションのハンドル。新しいトレースが開始されたとき、[StartTrace](/windows/win32/api/evntrace/nf-evntrace-starttracea) 関数はこのハンドルを返す。既存のトレースのハンドルを取得するには、[ControlTrace](/windows/win32/api/evntrace/nf-evntrace-controltracew) を使用してトレースの名前に基づいてトレースプロパティを問い合わせ、返された `EVENT_TRACE_PROPERTIES` データの **Wnode.HistoricalContext** フィールドからハンドルを取得する。
InformationClass : [int] 有効または無効にする情報クラス。クラスがキャプチャする情報は、イベントの拡張データセクションに含まれる。有効にできる情報クラスの一覧については、[TRACE_QUERY_INFO_CLASS](/windows/win32/api/evntrace/ne-evntrace-trace_query_info_class) 列挙を参照のこと。
TraceInformation : [intptr] 情報クラス固有のデータへのポインタ。情報クラスによってこのパラメータの内容が決まる。
InformationLength : [int] _TraceInformation_ バッファ内のデータのサイズ（バイト単位）。
%inst
イベントトレースセッションの設定を構成する。

[戻り値]
関数が成功した場合、戻り値は ERROR_SUCCESS となる。関数が失敗した場合、戻り値は次のエラーコードのいずれかとなる。-
**ERROR_BAD_LENGTH** プログラムがコマンドを発行したが、コマンド長が不正。このエラーは
_InformationLength_ パラメータが最小サイズ未満の場合に返される。-
**ERROR_INVALID_PARAMETER** パラメータが不正。- **ERROR_NOT_SUPPORTED**
要求はサポートされていない。- **そのほか** 返されたエラーのメッセージ文字列を取得するには
[FormatMessage](/windows/desktop/api/winbase/nf-winbase-formatmessage)
を使用する。

[備考]
[StartTrace](/windows/desktop/ETW/starttrace)
を呼び出した後にこの関数を呼び出す。_InformationClass_ パラメータが **TraceStackTracingInfo**
に設定されている場合、この関数を呼び出すことで指定したカーネルイベントのスタックトレースが有効になる。この関数を後続の呼び出しで呼び出すと、スタックトレースが有効になっていたカーネルイベントの以前のリストが上書きされる。スタックトレースを無効にするには、_InformationClass_
を **TraceStackTracingInfo** に、_InformationLength_ を 0
に設定してこの関数を呼び出す。イベントの拡張データセクションにはコールスタックが含まれる。[StackWalk_Event](/windows/desktop/ETW/stackwalk-event)
MOF クラスが拡張データのレイアウトを定義する。通常、64
ビットコンピュータでは、ページフォールトが許可されていない特定のコンテキストでカーネルスタックをキャプチャすることはできない。x64
でカーネルスタックのウォークを有効にするには、`DisablePagingExecutive` メモリ管理レジストリ値を 1
に設定する。`DisablePagingExecutive` レジストリ値は、次のレジストリキーの下にある:
`HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session
Manager\Memory Management`。これはシステムのメモリ使用量を増加させるため、一時的な診断目的でのみ行うべきである。


%index
TreeResetNamedSecurityInfoW
指定したオブジェクトツリーのセキュリティ記述子内の指定したセキュリティ情報をリセットする。(Unicode)
%group
Win32 advapi32
%prm
pObjectName, ObjectType, SecurityInfo, pOwner, pGroup, pDacl, pSacl, KeepExplicit, fnProgress, ProgressInvokeSetting, Args
pObjectName : [wstr] セキュリティ情報の更新を受けるオブジェクトのルートノードオブジェクトの名前を指定する null 終端文字列へのポインタ。サポートされるオブジェクトはレジストリキーとファイルオブジェクトである。オブジェクトの種類ごとの文字列形式の説明については、SE_OBJECT_TYPE を参照のこと。
ObjectType : [int] pObjectName パラメータで指定されるオブジェクトの種類を示す SE_OBJECT_TYPE 列挙の値。サポートされる値はレジストリキー用の SE_REGISTRY_KEY およびファイルオブジェクト用の SE_FILE_OBJECT である。
SecurityInfo : [int] リセットするセキュリティ情報の種類を示すビットフラグの集合。このパラメータには SECURITY_INFORMATION ビットフラグの組み合わせを指定できる。
pOwner : [int] オブジェクトの所有者を識別する SID 構造体へのポインタ。SID は、セキュリティ記述子の所有者 SID として割り当て可能なものでなければならない。SecurityInfo パラメータには OWNER_SECURITY_INFORMATION フラグが含まれている必要がある。所有者を設定するには、呼び出し側はルートオブジェクトを含む各オブジェクトに対して WRITE_OWNER アクセス権を持つ必要がある。所有者 SID を設定しない場合、このパラメータは NULL にできる。
pGroup : [int] オブジェクトのプライマリグループを識別する SID 構造体へのポインタ。SecurityInfo パラメータには GROUP_SECURITY_INFORMATION フラグが含まれている必要がある。グループを設定するには、呼び出し側はルートオブジェクトを含む各オブジェクトに対して WRITE_OWNER アクセス権を持つ必要がある。プライマリグループ SID を設定しない場合、このパラメータは NULL にできる。
pDacl : [var] リセットされるオブジェクトの新しい DACL を表すアクセス制御リスト (ACL) 構造体へのポインタ。SecurityInfo パラメータには DACL_SECURITY_INFORMATION フラグが含まれている必要がある。呼び出し側は、ルートオブジェクトを含め、各オブジェクトに対して READ_CONTROL および WRITE_DAC アクセス権を持つ必要がある。DACL を設定しない場合、このパラメータは NULL にできる。
pSacl : [var] リセットされるオブジェクトの新しい SACL を表す ACL 構造体へのポインタ。SecurityInfo パラメータは、SACL_SECURITY_INFORMATION、LABEL_SECURITY_INFORMATION、ATTRIBUTE_SECURITY_INFORMATION、SCOPE_SECURITY_INFORMATION、または BACKUP_SECURITY_INFORMATION のいずれかのフラグを含んでいる必要がある。SACL_SECURITY_INFORMATION または SCOPE_SECURITY_INFORMATION を設定する場合、呼び出し側は SE_SECURITY_NAME 特権を有効にしている必要がある。SACL を設定しない場合、このパラメータは NULL にできる。
KeepExplicit : [int] サブツリーに対して明示的に定義された ACE を保持するか削除するかを定義するブール値。KeepExplicit が TRUE の場合、各サブツリーの DACL および SACL について明示的に定義された ACE は保持され、継承された ACE は pDacl および pSacl から継承された ACE で置き換えられる。KeepExplicit が FALSE の場合、各サブツリーの DACL および SACL について明示的に定義された ACE は、継承された ACE が pDacl および pSacl からの継承された ACE で置き換えられる前に削除される。
fnProgress : [int] TreeResetNamedSecurityInfo 関数の進捗を追跡するために使用される関数へのポインタ。進捗関数のプロトタイプは次のとおり:
ProgressInvokeSetting : [int] 進捗関数の初期設定を指定する PROG_INVOKE_SETTING 列挙の値。
Args : [intptr] 呼び出し側が指定する進捗関数の引数用の VOID へのポインタ。
%inst
指定したオブジェクトツリーのセキュリティ記述子内の指定したセキュリティ情報をリセットする。(Unicode)

[戻り値]
関数が成功した場合、関数は ERROR_SUCCESS を返す。関数が失敗した場合、WinError.h で定義されたエラーコードを返す。

[備考]
この関数は NULL の所有者、グループ、DACL、SACL
の設定をサポートしない。呼び出し側が要求された所有者、グループ、DACL、および SACL
の更新をサポートする適切な特権と権限を持っていない場合、どの更新も実行されない。この関数は
TreeSetNamedSecurityInfo 関数と類似している:
（以下省略）


%index
TreeSetNamedSecurityInfoW
指定したオブジェクトツリーのセキュリティ記述子内の指定したセキュリティ情報を設定する。(Unicode)
%group
Win32 advapi32
%prm
pObjectName, ObjectType, SecurityInfo, pOwner, pGroup, pDacl, pSacl, dwAction, fnProgress, ProgressInvokeSetting, Args
pObjectName : [wstr] セキュリティ情報の更新を受けるオブジェクトのルートノードオブジェクトの名前を指定する null 終端文字列へのポインタ。サポートされるオブジェクトはレジストリキーとファイルオブジェクトである。オブジェクトの種類ごとの文字列形式の説明については、SE_OBJECT_TYPE を参照のこと。
ObjectType : [int] pObjectName パラメータで指定されるオブジェクトの種類を示す SE_OBJECT_TYPE 列挙の値。サポートされる値はレジストリキー用の SE_REGISTRY_KEY およびファイルオブジェクト用の SE_FILE_OBJECT である。
SecurityInfo : [int] 設定するセキュリティ情報の種類を示すビットフラグの集合。このパラメータには SECURITY_INFORMATION ビットフラグの組み合わせを指定できる。
pOwner : [int] オブジェクトの所有者を識別する SID 構造体へのポインタ。SID は、セキュリティ記述子の所有者 SID として割り当て可能なものでなければならない。SecurityInfo パラメータには OWNER_SECURITY_INFORMATION フラグが含まれている必要がある。所有者を設定するには、呼び出し側はルートオブジェクトを含む各オブジェクトに対して WRITE_OWNER アクセス権を持つ必要がある。所有者 SID を設定しない場合、このパラメータは NULL にできる。
pGroup : [int] オブジェクトのプライマリグループを識別する SID 構造体へのポインタ。SecurityInfo パラメータには GROUP_SECURITY_INFORMATION フラグが含まれている必要がある。グループを設定するには、呼び出し側はルートオブジェクトを含む各オブジェクトに対して WRITE_OWNER アクセス権を持つ必要がある。プライマリグループ SID を設定しない場合、このパラメータは NULL にできる。
pDacl : [var] リセットされるオブジェクトの新しい DACL を表すアクセス制御リスト (ACL) 構造体へのポインタ。SecurityInfo パラメータには DACL_SECURITY_INFORMATION フラグが含まれている必要がある。呼び出し側は、ルートオブジェクトを含め、各オブジェクトに対して READ_CONTROL および WRITE_DAC アクセス権を持つ必要がある。DACL を設定しない場合、このパラメータは NULL にできる。
pSacl : [var] リセットされるオブジェクトの新しい SACL を表す ACL 構造体へのポインタ。SecurityInfo パラメータは、SACL_SECURITY_INFORMATION、LABEL_SECURITY_INFORMATION、ATTRIBUTE_SECURITY_INFORMATION、SCOPE_SECURITY_INFORMATION、または BACKUP_SECURITY_INFORMATION のいずれかのフラグを含んでいる必要がある。SACL_SECURITY_INFORMATION または SCOPE_SECURITY_INFORMATION を設定する場合、呼び出し側は SE_SECURITY_NAME 特権を有効にしている必要がある。SACL を設定しない場合、このパラメータは NULL にできる。
dwAction : [int] 
fnProgress : [int] TreeSetNamedSecurityInfo 関数の進捗を追跡するために使用される関数へのポインタ。進捗関数のプロトタイプは次のとおり:
ProgressInvokeSetting : [int] 進捗関数の初期設定を指定する PROG_INVOKE_SETTING 列挙の値。
Args : [intptr] 呼び出し側が指定する進捗関数の引数用の VOID へのポインタ。
%inst
指定したオブジェクトツリーのセキュリティ記述子内の指定したセキュリティ情報を設定する。(Unicode)

[戻り値]
関数が成功した場合、関数は ERROR_SUCCESS を返す。関数が失敗した場合、WinError.h で定義されたエラーコードを返す。

[備考]
この関数は NULL の所有者、グループ、DACL、SACL
の設定をサポートしない。呼び出し側が要求された所有者、グループ、DACL、および SACL
の更新をサポートする適切な特権と権限を持っていない場合、どの更新も実行されない。この関数は、dwAction パラメータの値が
TREE_SEC_INFO_SET に設定され、ProgressInvokeSetting パラメータの値が
ProgressInvokePrePostError に設定され、fnProgress パラメータが指す関数がその
pInvokeSetting パラメータの値を ProgressInvokePrePostError に設定する場合の
SetNamedSecurityInfo 関数と同じ機能を提供する。この関数は TreeResetNamedSecurityInfo
関数と類似している:
（以下省略）


%index
UninstallApplication
UninstallApplication 関数は、Windows インストーラ .msi ファイルを使用してセットアップとインストールを処理するグループポリシーアプリケーションをアンインストールする。
%group
Win32 advapi32
%prm
ProductCode, dwStatus
ProductCode : [wstr] アンインストール対象の製品の Windows インストーラ製品コード。アプリケーションの製品コードは、波かっこで囲まれた文字列としての Windows インストーラ GUID の形式で提供する必要がある。
dwStatus : [int] アンインストールの試行結果のステータス。dwStatus パラメータは、MsiConfigureProduct が返すアンインストール試行の Windows 成功コードである。システムはこれを使用して、結果として得られるポリシーの結果セット (RSoP) がアンインストールの成功または失敗を示すことを保証できる。
%inst
UninstallApplication 関数は、Windows インストーラ .msi
ファイルを使用してセットアップとインストールを処理するグループポリシーアプリケーションをアンインストールする。

[戻り値]
関数が成功した場合、戻り値は ERROR_SUCCESS
となる。そうでない場合、関数はシステムエラーコードのいずれかを返す。エラーコードの完全な一覧については、システムエラーコードまたはヘッダファイル
WinError.h を参照のこと。

[備考]
Windows インストーラ関数 MsiConfigureProduct
を呼び出してアプリケーションをアンインストールすることで、.msi ファイルを使用するグループポリシーアプリケーションを削除する。次に
UninstallApplication
を呼び出して、アプリケーションがクライアント上でグループポリシーによって管理されなくなったことをシステムに通知する。RSoP
を正確に保つために、アンインストールが失敗した場合でも UninstallApplication
を呼び出すべきである。ソフトウェアインストール設定 (.zap ファイル)
を使用してインストールされたアプリケーションを削除するには、インストールアプリケーション固有のアンインストール関数またはコマンドを呼び出す。Windows
インストーラ以外のインストールアプリケーションの使用については、Microsoft Knowledge Base の記事
231747「How to Publish non-MSI Programs with .zap Files」を参照のこと。


%index
UnlockServiceDatabase
指定したロックを解放してサービス制御マネージャデータベースのロックを解除する。
%group
Win32 advapi32
%prm
ScLock
ScLock : [intptr] LockServiceDatabase 関数の以前の呼び出しから取得したロック。
%inst
指定したロックを解放してサービス制御マネージャデータベースのロックを解除する。

[戻り値]
関数が成功した場合、戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError
を呼び出す。以下のエラーコードがサービス制御マネージャによって設定される場合がある。そのほかのエラーコードは、サービス制御マネージャが呼び出すレジストリ関数によって設定される場合がある。
（以下省略）


%index
UpdateTraceW
UpdateTraceW (Unicode) 関数 (evntrace.h) は、指定したイベントトレースセッションのプロパティ設定を更新する。
%group
Win32 advapi32
%prm
TraceHandle, InstanceName, Properties
TraceHandle : [int] 更新するイベントトレースセッションへのハンドル、または 0。_InstanceName_ が **NULL** の場合は、0 以外の _TraceHandle_ を指定する必要がある。このパラメータは _InstanceName_ が **NULL** の場合にのみ使用される。ハンドルは [StartTrace](/windows/win32/api/evntrace/nf-evntrace-starttracew) が返す。
InstanceName : [wstr] 更新するイベントトレースセッションの名前、または **NULL**。_TraceHandle_ が 0 の場合は _InstanceName_ を指定する必要がある。NT カーネルロガーセッションを指定するには、_InstanceName_ に **KERNEL_LOGGER_NAME** を設定する。
Properties : [var] 初期化済みの [EVENT_TRACE_PROPERTIES](/windows/desktop/ETW/event-trace-properties) 構造体へのポインタ。入力時、メンバには更新するプロパティの新しい値を指定しなければならない。更新できるプロパティについては、注釈を参照のこと。出力時、構造体メンバはイベントトレースセッションの更新された設定と統計情報を含む。
%inst
UpdateTraceW (Unicode) 関数 (evntrace.h)
は、指定したイベントトレースセッションのプロパティ設定を更新する。

[戻り値]
関数が成功した場合、戻り値は ERROR_SUCCESS となる。関数が失敗した場合、戻り値は
[システムエラーコード](/windows/win32/debug/system-error-codes)
のいずれかとなる。次の表に代表的なエラーとその原因を示す。- **ERROR_BAD_LENGTH** _Properties_ の
**Wnode** メンバの **BufferSize** メンバが不正なサイズを指定している。-
**ERROR_INVALID_PARAMETER** 次のいずれかが発生している: - _Properties_ が
**NULL**。- _InstanceName_ と _TraceHandle_ の両方が **NULL**。-
_InstanceName_ が **NULL** で _TraceHandle_ が有効なハンドルでない。- _Properties_
の **LogFileNameOffset** メンバが不正。- _Properties_ の **LoggerNameOffset**
メンバが不正。**Windows Server 2003 および Windows XP:** **Wnode** 構造体の
**Guid** メンバが SystemTraceControlGuid だが、_InstanceName_ パラメータが
KERNEL_LOGGER_NAME でない。- **ERROR_ACCESS_DENIED**
管理者特権を持つユーザ、Performance Log Users グループのユーザ、LocalSystem / LocalService
/ NetworkService
として実行中のサービスのみがイベントトレースセッションを制御できる。制限付きユーザにトレースセッション制御権限を付与するには、Performance
Log Users グループに追加すること。**Windows XP および Windows 2000:**
誰でもトレースセッションを制御できる。

[備考]
イベントトレースコントローラがこの関数を呼び出す。この関数は廃止予定である。代わりに、_ControlCode_ を
**EVENT_TRACE_CONTROL_UPDATE** に設定した
[ControlTrace](/windows/win32/api/evntrace/nf-evntrace-controltracew)
を使用する。入力時、メンバには更新するプロパティの新しい値を指定しなければならない。以下のプロパティを更新できる。-
**EnableFlags**: すべてのカーネルプロバイダを無効にするにはこのメンバを 0
に設定する。そうでない場合、有効または有効なままにしたいカーネルプロバイダを指定する必要がある。システムロガーセッションにのみ適用される。-
**FlushTimer**: バッファをフラッシュするまでの時間を変更する場合、このメンバを設定する。このメンバが 0
の場合、メンバは更新されない。- **LogFileNameOffset**:
別のログファイルに切り替える場合、このメンバを設定する。このメンバが 0 の場合、ファイル名は更新されない。オフセットが 0
以外でログファイル名を変更しない場合、関数はエラーを返す。- **LogFileMode**:
**EVENT_TRACE_REAL_TIME_MODE**
のオン/オフを切り替える場合、このメンバを設定する。リアルタイム消費をオフにするにはこのメンバを 0
に設定する。リアルタイム消費をオンにするには、このメンバを **EVENT_TRACE_REAL_TIME_MODE**
に設定する。現在のモードと OR される。- **MaximumBuffers**: ETW
が使用する最大バッファ数を変更する場合、このメンバを設定する。このメンバが 0
の場合、メンバは更新されない。プライベートロガーセッションの場合、更新できるのは **LogFileNameOffset** と
**FlushTimer** のみである。新しく初期化した
[EVENT_TRACE_PROPERTIES](/windows/desktop/ETW/event-trace-properties)
構造体を使用する場合、更新するメンバ以外に指定する必要があるのは
**Wnode.BufferSize**、**Wnode.Guid**、および **Wnode.Flags**
のみである。[StartTrace](/windows/desktop/ETW/starttrace)
に渡したプロパティ構造体を使用する場合、ログファイル名を変更する場合を除き **LogFileNameOffset** メンバが 0
であることを確認する。[ControlTrace](/windows/desktop/ETW/controltrace)
関数を呼び出して現在のセッションプロパティを問い合わせてからそれらのプロパティを更新してセッションを更新する場合、**LogFileNameOffset**
を 0
に（ログファイル名を変更する場合を除き）、[EVENT_TRACE_PROPERTIES.Wnode.Flags](/windows/desktop/ETW/event-trace-properties)
を **WNODE_FLAG_TRACED_GUID**
に設定することを確認する。イベントトレースセッションのプロパティ設定とセッション統計情報を取得するには、[ControlTrace](/windows/desktop/ETW/controltrace)
関数を呼び出す。


%index
WaitServiceState
(no summary)
%group
Win32 advapi32
%prm
hService, dwNotify, dwTimeout, hCancelEvent
hService : [intptr] 
dwNotify : [int] 
dwTimeout : [int] 
hCancelEvent : [intptr] 
%inst



%index
WriteEncryptedFileRaw
暗号化されたファイルを復元（インポート）する。
%group
Win32 advapi32
%prm
pfImportCallback, pvCallbackContext, pvContext
pfImportCallback : [int] インポートコールバック関数へのポインタ。システムはコールバック関数を複数回呼び出し、バックアップされたファイルのデータの一部がコールバック関数によって満たされるバッファを毎回渡す。コールバック関数がファイル全体が処理されたことをシグナルで伝えると、復元操作が終了したことをシステムに伝える。詳細については ImportCallback を参照のこと。
pvCallbackContext : [intptr] アプリケーションで定義および割り当てたコンテキストブロックへのポインタ。システムはこのポインタをパラメータとしてコールバック関数に渡し、コールバック関数がアプリケーション固有のデータにアクセスできるようにする。構造体でもよく、暗号化されたファイルのバックアップコピーを保持するファイルへのハンドルなど、アプリケーションが必要とする任意のデータを含めることができる。
pvContext : [intptr] システム定義のコンテキストブロックへのポインタ。このコンテキストブロックは OpenEncryptedFileRaw 関数が返す。変更してはならない。
%inst
暗号化されたファイルを復元（インポート）する。

[戻り値]
関数が成功した場合、戻り値は ERROR_SUCCESS となる。関数が失敗した場合、WinError.h で定義された 0
以外のエラーコードを返す。FormatMessage に FORMAT_MESSAGE_FROM_SYSTEM
フラグを指定して呼び出すと、エラーの一般的なテキスト説明を取得できる。

[備考]

復元対象のファイルは復号されず、暗号化されたままの状態で復元される。暗号化されたファイルをバックアップするには、OpenEncryptedFileRaw
を呼び出してファイルを開き、次にアプリケーション定義のエクスポートコールバック関数のアドレスを渡して
ReadEncryptedFileRaw
を呼び出す。システムはこのコールバック関数を複数回呼び出し、ファイル全体の内容を読み取ってバックアップする。バックアップが完了したら、CloseEncryptedFileRaw
を呼び出してリソースを解放しファイルを閉じる。エクスポートコールバック関数の宣言方法については ExportCallback
を参照のこと。暗号化されたファイルを復元するには、ulFlags パラメータに CREATE_FOR_IMPORT を指定して
OpenEncryptedFileRaw を呼び出す。次に、アプリケーション定義のインポートコールバック関数のアドレスを渡して
WriteEncryptedFileRaw
を呼び出す。システムはこのコールバック関数を複数回呼び出し、ファイル全体の内容を読み取って復元する。復元が完了したら、CloseEncryptedFileRaw
を呼び出してリソースを解放しファイルを閉じる。エクスポートコールバック関数の宣言方法については ImportCallback
を参照のこと。ファイルがスパースファイルで、スパース割り当て単位サイズが小さいボリュームからバックアップされ、より大きなスパース割り当て単位サイズのボリュームに復元される場合、ファイル中央のスパースブロックが大きなブロックと適切に整列せず、関数呼び出しは失敗して
ERROR_INVALID_PARAMETER 最終エラーコードを設定する可能性がある。スパース割り当て単位サイズは 16 クラスタまたは
64 KB のうち小さい方である。この関数は暗号化されたファイルのみの復元を目的としている。暗号化されていないファイルの復元については
BackupWrite を参照のこと。Windows 8、Windows Server 2012
以降では、本関数は以下の技術によってサポートされる。
（以下省略）

