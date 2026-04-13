; ============================================================
;   advapi32.dll ヘルプ (CsWin32 / win32metadata から自動抽出)
;   docs_ja.json に日本語訳があればそちらを使用、無ければ英語原文。
;   翻訳を追加するときは docs_ja.json を編集して再生成。
; ============================================================

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

