; ============================================================
;   kernel32.dll ヘルプ (CsWin32 / win32metadata から自動抽出)
;   docs_ja.json に日本語訳があればそちらを使用、無ければ英語原文。
;   翻訳を追加するときは docs_ja.json を編集して再生成。
; ============================================================

%index
CloseHandle
開いているオブジェクトのハンドルを閉じる。
%group
Win32 kernel32
%prm
hObject
hObject : [intptr] 開いているオブジェクトへの有効なハンドル。
%inst
開いているオブジェクトのハンドルを閉じる。

[戻り値]
関数が成功した場合、戻り値は 0 以外。失敗した場合は 0。拡張エラー情報を得るには GetLastError
を呼び出す。デバッガ配下で実行中のアプリケーションは、無効なハンドル値や疑似ハンドル値を受け取った場合に例外を投げる。これはハンドルを二重に閉じたり、FindClose
の代わりに FindFirstFile の戻り値を CloseHandle に渡した場合などに発生する。

[備考]
CloseHandle 関数は次のオブジェクトのハンドルを閉じる:
（以下省略）


%index
FreeLibrary
ロードされたダイナミックリンクライブラリ(DLL)モジュールを解放し、必要に応じて参照カウントを減少させる。
%group
Win32 kernel32
%prm
hLibModule
hLibModule : [intptr] ロード済みライブラリモジュールへのハンドル。LoadLibrary、LoadLibraryEx、GetModuleHandle、GetModuleHandleEx のいずれかがこのハンドルを返す。
%inst
ロードされたダイナミックリンクライブラリ(DLL)モジュールを解放し、必要に応じて参照カウントを減少させる。

[戻り値]
関数が成功した場合、戻り値は 0 以外。失敗した場合は 0。拡張エラー情報を得るには GetLastError を呼び出す。

[備考]

システムはロード済みモジュールごとにプロセス単位の参照カウントを保持する。プロセス初期化時のロード時動的リンクによってロードされたモジュールは参照カウントが
1 となる。モジュールの参照カウントは LoadLibrary 呼び出しごとに 1 増加する。LoadLibraryEx
による呼び出しでも、モジュールが初回ロードかつデータ/イメージファイルとしてロードされる場合を除いて参照カウントが増加する。FreeLibrary
または FreeLibraryAndExitThread を呼び出すたびに参照カウントが減少する。参照カウントが 0
になるかプロセスが終了するとモジュールはアドレス空間からアンロードされる。ライブラリモジュールのアンロード前、システムはモジュールの
DllMain 関数が存在する場合に DLL_PROCESS_DETACH
値でそれを呼び出し、現在のプロセスのために確保したリソースをクリーンアップする機会を与える。エントリポイント関数が戻った後、ライブラリモジュールはアドレス空間から削除される。DllMain
から FreeLibrary を呼ぶのは安全ではない。詳細は DllMain の Remarks を参照。FreeLibrary
の呼び出しは同じモジュールを使用する他のプロセスには影響しない。GetModuleHandle が返したハンドルで FreeLibrary
を呼ぶ際は注意が必要。GetModuleHandle は参照カウントを増加させないため、そのハンドルを FreeLibrary
に渡すとモジュールが早期にアンロードされる可能性がある。実行中の DLL
をアンロードして自身を終了させるスレッドは、FreeLibrary と ExitThread を個別に呼ぶのではなく
FreeLibraryAndExitThread を呼ぶこと。そうしないとレース条件が発生しうる。詳細は
FreeLibraryAndExitThread の Remarks を参照。


%index
CopyFileW
既存のファイルを新しいファイルにコピーする。(Unicode)
%group
Win32 kernel32
%prm
lpExistingFileName, lpNewFileName, bFailIfExists
lpExistingFileName : [wstr] 既存ファイルの名前。ANSI 版では MAX_PATH 文字に制限される。Unicode 版で 32,767 文字まで拡張するには "\\?\" をパスに付加する。ファイルが存在しない場合は CopyFile は失敗し、GetLastError は ERROR_FILE_NOT_FOUND を返す。
lpNewFileName : [wstr] 新しいファイルの名前。ANSI 版では MAX_PATH 文字に制限される。Unicode 版で 32,767 文字まで拡張するには "\\?\" をパスに付加する。
bFailIfExists : [int] TRUE で lpNewFileName のファイルがすでに存在する場合、関数は失敗する。FALSE の場合は既存ファイルを上書きして成功する。
%inst
既存のファイルを新しいファイルにコピーする。(Unicode)

[戻り値]
関数が成功した場合、戻り値は 0 以外。失敗した場合は 0。拡張エラー情報を得るには GetLastError を呼び出す。

[備考]

既存ファイルのセキュリティリソースプロパティ(ATTRIBUTE_SECURITY_INFORMATION)は新ファイルにコピーされる(Windows
8 以降)。ファイル属性もコピーされ、例えば FILE_ATTRIBUTE_READONLY
を持つファイルのコピーも同属性を持つ。先ファイルが既存で FILE_ATTRIBUTE_HIDDEN または
FILE_ATTRIBUTE_READONLY を持つ場合は ERROR_ACCESS_DENIED
で失敗する。暗号化ファイルの場合は元のキーでの暗号化を試みる。元がシンボリックリンクの場合、コピーされるのはリンクの対象ファイル。
（以下省略）


%index
CreateEventW
名前付きまたは無名のイベントオブジェクトを作成または開く。(Unicode)
%group
Win32 kernel32
%prm
lpEventAttributes, bManualReset, bInitialState, lpName
lpEventAttributes : [var] SECURITY_ATTRIBUTES 構造体へのポインタ。NULL の場合、ハンドルは子プロセスに継承されない。
bManualReset : [int] TRUE なら手動リセットイベントオブジェクトを作成する(ResetEvent での明示的リセットが必要)。FALSE なら自動リセットイベントオブジェクトを作成する(単一待機スレッドが解放された後、システムが自動的にリセットする)。
bInitialState : [int] TRUE の場合、イベントオブジェクトの初期状態はシグナル状態。そうでない場合は非シグナル状態。
lpName : [wstr] イベントオブジェクトの名前。名前は MAX_PATH 文字に制限され、大文字小文字を区別する。既存の名前付きイベントオブジェクトと一致した場合、EVENT_ALL_ACCESS 権で既存オブジェクトを開く。NULL の場合は無名オブジェクトを作成する。"Global\" または "Local\" プレフィックスでグローバル/セッション名前空間を指定できる。
%inst
名前付きまたは無名のイベントオブジェクトを作成または開く。(Unicode)

[戻り値]

関数が成功した場合、戻り値はイベントオブジェクトへのハンドル。名前付きイベントオブジェクトが既存の場合は既存オブジェクトへのハンドルを返し、GetLastError
は ERROR_ALREADY_EXISTS を返す。失敗した場合は NULL。

[備考]
CreateEvent が返すハンドルは EVENT_ALL_ACCESS 権を持つ。手動リセットイベントはシグナル状態になると
ResetEvent
で明示的にリセットされるまでシグナル状態を維持し、待機中の全スレッドが解放されうる。自動リセットイベントはシグナル状態になると 1
つの待機スレッドが解放された後、自動的に非シグナル状態に戻る。複数プロセスで同じイベントオブジェクトのハンドルを持つことができ、プロセス間同期に使用できる。
（以下省略）


%index
CreateFileW
ファイルまたは I/O デバイスを作成または開く。よく使われる I/O デバイスはファイル、ファイルストリーム、ディレクトリ、物理ディスク、ボリューム、コンソールバッファ、テープドライブ、通信リソース、メールスロット、パイプなど。(Unicode)
%group
Win32 kernel32
%prm
lpFileName, dwDesiredAccess, dwShareMode, lpSecurityAttributes, dwCreationDisposition, dwFlagsAndAttributes, hTemplateFile
lpFileName : [wstr] 作成または開くファイルまたはデバイスの名前。スラッシュ(/)とバックスラッシュ(\\)のどちらも使用可能。ANSI 版では MAX_PATH 文字に制限される。Unicode 版で 32,767 文字まで拡張するには "\\?\" をパスに付加する。ファイルストリームを作成するには、ファイル名:ストリーム名 を指定する。
dwDesiredAccess : [int] 要求するファイルまたはデバイスへのアクセス。読み取り、書き込み、両方、または 0。最もよく使われる値は GENERIC_READ、GENERIC_WRITE、またはその組み合わせ。0 の場合、アプリケーションはファイル/ディレクトリ/デバイスの属性などのメタデータを参照できる。dwShareMode と競合するアクセスモードは要求できない。
dwShareMode : [int] 要求するファイルまたはデバイスの共有モード。読み取り、書き込み、両方、削除、全部、またはなし。0 で成功した場合、ハンドルを閉じるまでファイル/デバイスは共有できず再オープンできない。既存ハンドルのアクセスモードと競合する共有モードを要求するとエラー(ERROR_SHARING_VIOLATION)。
lpSecurityAttributes : [var] SECURITY_ATTRIBUTES 構造体へのポインタ。オプションのセキュリティ記述子と、返されたハンドルが子プロセスに継承可能かを決定する Boolean 値の 2 つのメンバを持つ。NULL の場合、ハンドルは継承されず、ファイル/デバイスには既定のセキュリティ記述子が割り当てられる。既存ファイル/デバイスを開く場合、CreateFile は lpSecurityDescriptor を無視する。
dwCreationDisposition : [int] ファイルまたはデバイスに対して、存在する場合および存在しない場合に取るアクション。ファイル以外のデバイスでは通常 OPEN_EXISTING を指定する。詳細は Remarks セクション参照。
dwFlagsAndAttributes : [int] ファイルまたはデバイスの属性およびフラグ。ファイルの場合、最も一般的な既定値は FILE_ATTRIBUTE_NORMAL。FILE_ATTRIBUTE_* とFILE_FLAG_* の任意の組み合わせ、および SECURITY_SQOS_PRESENT フラグによる SQOS 情報を含めることができる。既存ファイルを開く場合、一般に既存ファイルの属性とフラグが組み合わせられ、ここで指定した属性は無視される。
hTemplateFile : [intptr] GENERIC_READ アクセス権を持つテンプレートファイルへの有効なハンドル。テンプレートファイルは作成されるファイルのファイル属性と拡張属性を提供する。NULL を指定可能。既存ファイルを開く場合は無視される。新しい暗号化ファイルを開く場合、ファイルは親ディレクトリの DACL を継承する。
%inst
ファイルまたは I/O デバイスを作成または開く。よく使われる I/O
デバイスはファイル、ファイルストリーム、ディレクトリ、物理ディスク、ボリューム、コンソールバッファ、テープドライブ、通信リソース、メールスロット、パイプなど。(Unicode)

[戻り値]
関数が成功した場合、戻り値は指定したファイル、デバイス、名前付きパイプ、メールスロットへのオープンハンドル。失敗した場合は
INVALID_HANDLE_VALUE。拡張エラー情報は GetLastError で取得する。

[備考]
CreateFile は元々ファイル操作用に開発されたが、多くの I/O
デバイスや機構に対応するよう拡張された。オブジェクトハンドルの使用が終わったら CloseHandle
でハンドルを閉じること。これによりシステムリソースが解放され、ファイル共有やディスクへのコミットなどにも影響する。NTFS
ファイルシステムでは新しいファイルはディレクトリの圧縮・暗号化属性を継承する。CreateFile ではこれらを直接制御できない。
（以下省略）


%index
CreateMutexW
名前付きまたは無名のミューテックスオブジェクトを作成または開く。(Unicode)
%group
Win32 kernel32
%prm
lpMutexAttributes, bInitialOwner, lpName
lpMutexAttributes : [var] SECURITY_ATTRIBUTES 構造体へのポインタ。NULL の場合、ハンドルは子プロセスに継承されない。
bInitialOwner : [int] TRUE でかつ呼び出し元がミューテックスを作成した場合、呼び出し元スレッドがミューテックスの初期所有権を取得する。そうでない場合は所有権を取得しない。
lpName : [wstr] ミューテックスオブジェクトの名前。名前は MAX_PATH 文字に制限され、大文字小文字を区別する。既存の名前付きミューテックスと一致した場合は MUTEX_ALL_ACCESS で既存オブジェクトを開く。NULL の場合は無名オブジェクトを作成する。"Global\" または "Local\" プレフィックスでグローバル/セッション名前空間を指定できる。
%inst
名前付きまたは無名のミューテックスオブジェクトを作成または開く。(Unicode)

[戻り値]
関数が成功した場合、戻り値は新しく作成されたミューテックスオブジェクトへのハンドル。失敗した場合は
NULL。名前付きミューテックスで既存のオブジェクトがあった場合、戻り値は既存オブジェクトへのハンドルで GetLastError は
ERROR_ALREADY_EXISTS を返す。

[備考]
CreateMutex が返すハンドルは MUTEX_ALL_ACCESS
アクセス権を持つ。単一インスタンス制限のために名前付きミューテックスを使う場合、悪意あるユーザーがミューテックスを先に作成して起動を妨害する可能性があるため、ランダム名付きミューテックスを使うか承認済みユーザーのみが取得できるようにする。ミューテックスの状態は、どのスレッドも所有していない場合にシグナル状態。所有スレッドは
ReleaseMutex で所有権を解放する。同一ミューテックスを複数回待機した場合、取得した回数分 ReleaseMutex
を呼ぶ必要がある。
（以下省略）


%index
CreateProcessW
新しいプロセスとそのプライマリスレッドを作成する。新しいプロセスは呼び出し元プロセスのセキュリティコンテキストで実行される。(Unicode)
%group
Win32 kernel32
%prm
lpApplicationName, lpCommandLine, lpProcessAttributes, lpThreadAttributes, bInheritHandles, dwCreationFlags, lpEnvironment, lpCurrentDirectory, lpStartupInfo, lpProcessInformation
lpApplicationName : [wstr] 実行するモジュール名。Windows アプリケーションまたは他種(MS-DOS や OS/2 など)のモジュールを指定できる。フルパスまたは部分名を指定可能。部分名の場合は現在のドライブとディレクトリが使用される。NULL の場合、モジュール名は lpCommandLine の最初の空白区切りトークンとなる。スペースを含む長ファイル名では引用符を使う。
lpCommandLine : [wstr] 実行するコマンドライン。最大長は終端 NULL を含めて 32,767 文字。lpApplicationName が NULL の場合、モジュール名部分は MAX_PATH 文字に制限される。CreateProcessW はこの文字列を変更する可能性があるため、定数文字列や読み取り専用メモリへのポインタを渡してはならない。
lpProcessAttributes : [var] 新しいプロセスオブジェクトへのハンドルが子プロセスに継承可能かを決定する SECURITY_ATTRIBUTES 構造体へのポインタ。NULL の場合、ハンドルは継承されず、プロセスには既定のセキュリティ記述子が割り当てられる。
lpThreadAttributes : [var] 新しいスレッドオブジェクトへのハンドルが子プロセスに継承可能かを決定する SECURITY_ATTRIBUTES 構造体へのポインタ。NULL の場合、ハンドルは継承されず、スレッドには既定のセキュリティ記述子が割り当てられる。
bInheritHandles : [int] TRUE の場合、呼び出し元プロセスの継承可能ハンドルは新しいプロセスに継承される。FALSE の場合は継承されない。継承されたハンドルは元のハンドルと同じ値とアクセス権を持つ。Terminal Services では異なるセッション間でのハンドル継承はできない。
dwCreationFlags : [int] 優先クラスとプロセス作成を制御するフラグ。Process Creation Flags の一覧参照。
lpEnvironment : [intptr] 新しいプロセスの環境ブロックへのポインタ。NULL の場合は呼び出し元の環境が使用される。環境ブロックは NULL 終端文字列の NULL 終端ブロックで、各文字列は name=value\0 の形式。Unicode 文字を含む場合は dwCreationFlags に CREATE_UNICODE_ENVIRONMENT を含める必要がある。ANSI 環境ブロックは 2 バイトのゼロで、Unicode 環境ブロックは 4 バイトのゼロで終端される。
lpCurrentDirectory : [wstr] 新しいプロセスの現在のディレクトリへのフルパス。UNC パスも指定可能。NULL の場合、新しいプロセスは呼び出し元と同じドライブとディレクトリを持つ。
lpStartupInfo : [var] STARTUPINFO または STARTUPINFOEX 構造体へのポインタ。拡張属性を設定するには STARTUPINFOEX 構造体を使用し、dwCreationFlags に EXTENDED_STARTUPINFO_PRESENT を指定する。STARTUPINFO 内のハンドルは不要になったら CloseHandle で閉じる。呼び出し元は標準ハンドルフィールドに有効なハンドル値を設定する責任がある。
lpProcessInformation : [var] 新しいプロセスの識別情報を受け取る PROCESS_INFORMATION 構造体へのポインタ。
%inst

新しいプロセスとそのプライマリスレッドを作成する。新しいプロセスは呼び出し元プロセスのセキュリティコンテキストで実行される。(Unicode)

[戻り値]
関数が成功した場合、戻り値は 0 以外。失敗した場合は 0。拡張エラー情報は GetLastError
で取得する。この関数はプロセスが初期化を完了する前に戻る点に注意。必要な DLL
が見つからないか初期化に失敗した場合、プロセスは終了する。終了状態は GetExitCodeProcess で取得する。

[備考]
プロセスにはプロセス識別子が割り当てられ、終了まで有効。PROCESS_INFORMATION
構造体でハンドルと識別子が返される。呼び出し元スレッドは WaitForInputIdle
で新しいプロセスの初期化完了を待機できる。プロセスを終了する推奨方法は ExitProcess で、アタッチされた DLL
に通知が送られる。セキュリティ上の注意として、lpApplicationName が NULL で lpCommandLine
のパスにスペースが含まれる場合、意図しない実行ファイルが起動される可能性がある。
（以下省略）


%index
DeleteFileW
既存のファイルを削除する。(DeleteFileW)
%group
Win32 kernel32
%prm
lpFileName
lpFileName : [wstr] 削除するファイルの名前。ANSI 版では MAX_PATH 文字に制限される。Unicode 版で 32,767 文字まで拡張するには "\\?\" をパスに付加する。
%inst
既存のファイルを削除する。(DeleteFileW)

[戻り値]
関数が成功した場合、戻り値は 0 以外。失敗した場合は 0。拡張エラー情報は GetLastError で取得する。

[備考]
存在しないファイルを削除しようとすると DeleteFile は ERROR_FILE_NOT_FOUND
で失敗する。読み取り専用ファイルを削除しようとすると ERROR_ACCESS_DENIED で失敗する。
（以下省略）


%index
FindClose
FindFirstFile、FindFirstFileEx、FindFirstFileNameW、FindFirstFileNameTransactedW、FindFirstFileTransacted、FindFirstStreamTransactedW、FindFirstStreamW が開いたファイル検索ハンドルを閉じる。
%group
Win32 kernel32
%prm
hFindFile
hFindFile : [intptr] ファイル検索ハンドル。
%inst

FindFirstFile、FindFirstFileEx、FindFirstFileNameW、FindFirstFileNameTransactedW、FindFirstFileTransacted、FindFirstStreamTransactedW、FindFirstStreamW
が開いたファイル検索ハンドルを閉じる。

[戻り値]
関数が成功した場合、戻り値は 0 以外。失敗した場合は 0。拡張エラー情報は GetLastError で取得する。

[備考]
FindClose 呼び出し後、hFindFile で指定したハンドルは
FindNextFile、FindNextFileNameW、FindNextStreamW、FindClose
の呼び出しで使用できない。
（以下省略）


%index
FindFirstFileW
指定した名前(ワイルドカードを使用した部分名を含む)に一致するファイルまたはサブディレクトリをディレクトリ内から検索する。(Unicode)
%group
Win32 kernel32
%prm
lpFileName, lpFindFileData
lpFileName : [wstr] ディレクトリまたはパスおよびファイル名。ワイルドカード(* や ?)を含めることができる。NULL、無効な文字列、末尾バックスラッシュで終わる文字列であってはならない。ANSI 版では MAX_PATH 文字に制限。Unicode 版で 32,767 文字まで拡張するには "\\?\" をパスに付加する。
lpFindFileData : [var] 見つかったファイルまたはディレクトリに関する情報を受け取る WIN32_FIND_DATA 構造体へのポインタ。
%inst

指定した名前(ワイルドカードを使用した部分名を含む)に一致するファイルまたはサブディレクトリをディレクトリ内から検索する。(Unicode)

[戻り値]
関数が成功した場合、戻り値は FindNextFile または FindClose
の後続呼び出しで使用する検索ハンドルで、lpFindFileData
には最初に見つかったファイル/ディレクトリの情報が格納される。失敗した場合は INVALID_HANDLE_VALUE で
lpFindFileData の内容は不定。一致ファイルが見つからない場合、GetLastError は
ERROR_FILE_NOT_FOUND を返す。

[備考]
FindFirstFile は検索ハンドルを開き、指定パターンに一致する最初のファイルの情報を返す。これは必ずしも dir
コマンドなどのディレクトリリスト表示順とは一致しない。FindFirstFile は検索結果をソートしない。
（以下省略）


%index
FindNextFileW
FindFirstFile、FindFirstFileEx、FindFirstFileTransacted の以前の呼び出しによるファイル検索を続ける。(Unicode)
%group
Win32 kernel32
%prm
hFindFile, lpFindFileData
hFindFile : [intptr] FindFirstFile または FindFirstFileEx の前回の呼び出しで返された検索ハンドル。
lpFindFileData : [var] 見つかったファイルまたはサブディレクトリに関する情報を受け取る WIN32_FIND_DATA 構造体へのポインタ。
%inst
FindFirstFile、FindFirstFileEx、FindFirstFileTransacted
の以前の呼び出しによるファイル検索を続ける。(Unicode)

[戻り値]
関数が成功した場合、戻り値は 0 以外で lpFindFileData
には次に見つかったファイル/ディレクトリの情報が格納される。失敗した場合は 0 で lpFindFileData
は不定。一致がなくなった場合、GetLastError は ERROR_NO_MORE_FILES を返す。

[備考]
この関数は hFindFile
の作成時に使われた検索フィルタを再利用する。検索が返す順序はアルファベット順を含め保証されず、ファイルシステムに依存する。NTFS や
CDFS ではアルファベット順で返されることが多く、FAT
ではディスク書き込み順。シンボリックリンクの場合、WIN32_FIND_DATA にはリンク自体の情報が入る。
（以下省略）


%index
FormatMessageW
メッセージ文字列を書式化する。
%group
Win32 kernel32
%prm
dwFlags, lpSource, dwMessageId, dwLanguageId, lpBuffer, nSize, Arguments
dwFlags : [int] 書式化オプションおよび lpSource の解釈方法。dwFlags の下位バイトは出力バッファ内の改行の扱いを指定する。また、書式化された出力行の最大幅も指定できる。
lpSource : [intptr] メッセージ定義の場所。このパラメータの型は dwFlags の設定に依存する。
dwMessageId : [int] 要求するメッセージの識別子。dwFlags に FORMAT_MESSAGE_FROM_STRING が含まれる場合は無視される。
dwLanguageId : [int] 要求するメッセージの言語識別子。dwFlags に FORMAT_MESSAGE_FROM_STRING が含まれる場合は無視される。特定の LANGID を渡すとその LANGID のメッセージのみを返す。見つからない場合は Last-Error を ERROR_RESOURCE_LANG_NOT_FOUND に設定する。0 を渡すと順次複数の LANGID を検索する。
lpBuffer : [wstr] 書式化済みメッセージを指定する NULL 終端文字列を受け取るバッファへのポインタ。dwFlags に FORMAT_MESSAGE_ALLOCATE_BUFFER が含まれる場合、関数は LocalAlloc でバッファを割り当て、指定アドレスにポインタを格納する。64K バイトを超えてはならない。
nSize : [int] FORMAT_MESSAGE_ALLOCATE_BUFFER が設定されていない場合、このパラメータは出力バッファのサイズ(TCHAR 単位)。設定されている場合、割り当てる最小 TCHAR 数。64K バイトを超えてはならない。
Arguments : [var] 書式化メッセージ内の挿入値として使用される値の配列。書式文字列内の %1 は Arguments 配列の最初の値を、%2 は 2 番目を示す。既定では各値を NULL 終端文字列へのポインタとして扱う。通常型は va_list*。FORMAT_MESSAGE_ARGUMENT_ARRAY フラグを指定すると DWORD_PTR 配列へのポインタを渡す。
%inst
メッセージ文字列を書式化する。

[戻り値]
関数が成功した場合、戻り値は終端 NULL を含まない出力バッファに格納された TCHAR 数。失敗した場合は 0。拡張エラー情報は
GetLastError で取得する。

[備考]
メッセージテキスト内では動的書式化のためにパーセント文字(%)で始まるいくつかのエスケープシーケンスがサポートされる。
（以下省略）


%index
GetACP
オペレーティングシステムの現在の Windows ANSI コードページ識別子を取得する。注意: ANSI API 関数(TextOut の ANSI 版など)は暗黙的に GetACP を使って Unicode との変換を行う。
%group
Win32 kernel32
%prm

%inst
オペレーティングシステムの現在の Windows ANSI コードページ識別子を取得する。注意: ANSI API 関数(TextOut
の ANSI 版など)は暗黙的に GetACP を使って Unicode との変換を行う。

[戻り値]
オペレーティングシステムの現在の Windows ANSI コードページ(ACP)識別子を返す。

[備考]
ANSI
コードページはコンピュータによって異なり、また単一のコンピュータでも変更可能であるため、データ破損につながることがある。最も一貫した結果を得るには、可能な限り
UTF-8 または UTF-16 を使用すべき。


%index
GetCurrentDirectoryW
現在のプロセスの現在のディレクトリを取得する。
%group
Win32 kernel32
%prm
nBufferLength, lpBuffer
nBufferLength : [int] 現在のディレクトリ文字列用バッファの長さ(TCHAR 単位)。終端 NULL の分を含める必要がある。
lpBuffer : [wstr] 現在のディレクトリ文字列を受け取るバッファへのポインタ。絶対パス。必要なバッファサイズを知るには NULL と nBufferLength=0 を指定する。
%inst
現在のプロセスの現在のディレクトリを取得する。

[戻り値]
関数が成功した場合、戻り値は終端 NULL を含まないバッファに書き込まれた文字数。失敗した場合は
0。バッファが小さすぎる場合、戻り値は終端 NULL を含む必要なサイズ(文字単位)。

[備考]
各プロセスは 2 つの部分からなる単一の現在のディレクトリを持つ:
（以下省略）


%index
GetCurrentProcess
現在のプロセスの疑似ハンドルを取得する。
%group
Win32 kernel32
%prm

%inst
現在のプロセスの疑似ハンドルを取得する。

[戻り値]
戻り値は現在のプロセスへの疑似ハンドル。

[備考]
疑似ハンドルは現在のプロセスハンドルとして解釈される特別な定数(現在は (HANDLE)-1)。将来の OS
との互換性のため、この値をハードコードせず GetCurrentProcess
を呼び出すのが最良。疑似ハンドルは子プロセスに継承されず、PROCESS_ALL_ACCESS
アクセス権を持つ。DuplicateHandle で実ハンドルに変換可能。CloseHandle で閉じる必要はない(何もしない)。


%index
GetCurrentProcessId
呼び出し元プロセスのプロセス識別子を取得する。
%group
Win32 kernel32
%prm

%inst
呼び出し元プロセスのプロセス識別子を取得する。

[戻り値]
戻り値は呼び出し元プロセスのプロセス識別子。

[備考]
プロセスが終了するまで、プロセス識別子はシステム全体で一意にそのプロセスを識別する。


%index
GetCurrentThread
呼び出し元スレッドの疑似ハンドルを取得する。
%group
Win32 kernel32
%prm

%inst
呼び出し元スレッドの疑似ハンドルを取得する。

[戻り値]
戻り値は現在のスレッドの疑似ハンドル。

[備考]
疑似ハンドルは現在のスレッドハンドルとして解釈される特別な定数。子プロセスに継承されず、THREAD_ALL_ACCESS
アクセス権を持つ。このハンドルは使用中のスレッドを指すものとして常に解釈され、他スレッドが最初のスレッドを参照する実ハンドルとしては使えない。DuplicateHandle
で実ハンドルに変換可能。CloseHandle は何もしない。


%index
GetCurrentThreadId
呼び出し元スレッドのスレッド識別子を取得する。
%group
Win32 kernel32
%prm

%inst
呼び出し元スレッドのスレッド識別子を取得する。

[戻り値]
戻り値は呼び出し元スレッドのスレッド識別子。

[備考]
スレッドが終了するまで、スレッド識別子はシステム全体で一意にそのスレッドを識別する。


%index
GetEnvironmentVariableW
呼び出し元プロセスの環境ブロックから指定された変数の内容を取得する。
%group
Win32 kernel32
%prm
lpName, lpBuffer, nSize
lpName : [wstr] 環境変数の名前。
lpBuffer : [wstr] 指定された環境変数の内容を NULL 終端文字列として受け取るバッファへのポインタ。ユーザー定義環境変数の最大サイズは 32,767 文字。
nSize : [int] lpBuffer が指すバッファのサイズ(終端 NULL を含む文字数)。
%inst
呼び出し元プロセスの環境ブロックから指定された変数の内容を取得する。

[戻り値]
関数が成功した場合、戻り値は終端 NULL を含まないバッファに格納された文字数。lpBuffer が十分に大きくない場合、戻り値は終端
NULL を含む必要なサイズ(文字単位)で lpBuffer の内容は不定。失敗した場合は
0。指定された環境変数が環境ブロックで見つからない場合、GetLastError は ERROR_ENVVAR_NOT_FOUND
を返す。

[備考]
この関数はシステム環境変数またはユーザー環境変数のいずれも取得できる。


%index
GetExitCodeProcess
指定されたプロセスの終了状態を取得する。
%group
Win32 kernel32
%prm
hProcess, lpExitCode
hProcess : [intptr] プロセスへのハンドル。PROCESS_QUERY_INFORMATION または PROCESS_QUERY_LIMITED_INFORMATION アクセス権が必要。
lpExitCode : [var] プロセスの終了状態を受け取る変数へのポインタ。
%inst
指定されたプロセスの終了状態を取得する。

[戻り値]
関数が成功した場合、戻り値は 0 以外。失敗した場合は 0。拡張エラー情報は GetLastError で取得する。

[備考]
この関数はすぐに返る。プロセスがまだ終了しておらず関数が成功した場合、返される状態は
STILL_ACTIVE(STATUS_PENDING のマクロ)。プロセスが終了している場合、次のいずれかの値が返る:
（以下省略）


%index
GetFileAttributesW
指定されたファイルまたはディレクトリのファイルシステム属性を取得する。(Unicode)
%group
Win32 kernel32
%prm
lpFileName
lpFileName : [wstr] ファイルまたはディレクトリの名前。
%inst
指定されたファイルまたはディレクトリのファイルシステム属性を取得する。(Unicode)

[戻り値]
関数が成功した場合、戻り値には指定されたファイル/ディレクトリの属性が含まれる。失敗した場合は
INVALID_FILE_ATTRIBUTES。

[備考]

マウントされたフォルダに対して呼ぶと、そのディレクトリのファイルシステム属性が返され、マウント先のボリュームのルートディレクトリの属性ではない。関連付けられたボリュームの属性を取得するには
GetVolumeNameForVolumeMountPoint で名前を取得してから呼ぶ。ネットワーク共有に対して呼ぶと
ERROR_BAD_NETPATH で失敗する。
（以下省略）


%index
GetFileSize
指定されたファイルのサイズ(バイト単位)を取得する。
%group
Win32 kernel32
%prm
hFile, lpFileSizeHigh
hFile : [intptr] ファイルへのハンドル。
lpFileSizeHigh : [var] ファイルサイズの上位 DWORD を受け取る変数へのポインタ。上位 DWORD が不要ならば NULL を指定できる。
%inst
指定されたファイルのサイズ(バイト単位)を取得する。

[戻り値]
関数が成功した場合、戻り値はファイルサイズの下位 DWORD で、lpFileSizeHigh が非 NULL なら上位 DWORD
を格納する。失敗して lpFileSizeHigh が NULL の場合、戻り値は INVALID_FILE_SIZE。
（以下省略）

[備考]
パイプや通信デバイスなどのシークできないデバイスのハンドルには使用できない。GetFileSize は未圧縮サイズを返す(圧縮サイズは
GetCompressedFileSize を使う)。戻り値が
INVALID_FILE_SIZE(0xffffffff)の場合、アプリケーションは GetLastError
を呼んで成功か失敗かを判定する必要がある(lpFileSizeHigh が非 NULL かファイルサイズが実際に 0xffffffff
の可能性があるため)。GetFileSizeEx を使うのが推奨される。


%index
GetLocalTime
現在のローカル日時を取得する。
%group
Win32 kernel32
%prm
lpSystemTime
lpSystemTime : [var] 現在のローカル日時を受け取る SYSTEMTIME 構造体へのポインタ。
%inst
現在のローカル日時を取得する。

[備考]
現在のローカル日時を設定するには SetLocalTime を使う。


%index
GetModuleFileNameW
指定されたモジュールを含むファイルの完全修飾パスを取得する。モジュールは現在のプロセスによってロードされていなければならない。(Unicode)
%group
Win32 kernel32
%prm
hModule, lpFilename, nSize
hModule : [intptr] パスを取得する対象のロード済みモジュールへのハンドル。NULL の場合は現在のプロセスの実行ファイルのパスを取得する。LOAD_LIBRARY_AS_DATAFILE でロードされたモジュールは取得できない。
lpFilename : [wstr] モジュールの完全修飾パスを受け取るバッファへのポインタ。パス長が nSize より短ければ NULL 終端で返され、長ければ nSize 文字(終端 NULL 含む)に切り詰められる。
nSize : [int] lpFilename バッファのサイズ(TCHAR 単位)。
%inst

指定されたモジュールを含むファイルの完全修飾パスを取得する。モジュールは現在のプロセスによってロードされていなければならない。(Unicode)

[戻り値]
関数が成功した場合、戻り値は終端 NULL を含まないバッファにコピーされた文字列の長さ。バッファが小さい場合、文字列は nSize
文字(終端 NULL を含む)に切り詰められ、関数は nSize を返し、最後のエラーを
ERROR_INSUFFICIENT_BUFFER に設定する。nSize が 0 なら 0 を返す。失敗時は 0。

[備考]
DLL が 2 つのプロセスにロードされている場合、ファイル名の大文字小文字が異なる場合がある。グローバル変数 _pgmptr
は実行ファイルのフルパスで自動的に初期化される。


%index
GetModuleHandleW
指定されたモジュールのモジュールハンドルを取得する。モジュールは呼び出し元プロセスによってロードされていなければならない。(Unicode)
%group
Win32 kernel32
%prm
lpModuleName
lpModuleName : [wstr] ロード済みモジュール(.dll または .exe)の名前。拡張子省略時は既定 .dll が付加される。パス指定の必要はないが、指定する場合はバックスラッシュ(\\)を使う。大文字小文字を区別せずに、現在プロセスのアドレス空間にマップされているモジュール名と比較される。
%inst

指定されたモジュールのモジュールハンドルを取得する。モジュールは呼び出し元プロセスによってロードされていなければならない。(Unicode)

[戻り値]
関数が成功した場合、戻り値は指定されたモジュールへのハンドル。失敗した場合は NULL。

[備考]
返されるハンドルはグローバルではなく継承もされない。複製や他プロセスでの使用はできない。GetModuleHandle
は参照カウントを増加させないため、返されたハンドルを FreeLibrary に渡してはならない(DLL
モジュールが早期にアンロードされる可能性がある)。マルチスレッドアプリケーションでは、ハンドル取得から使用までの間にモジュールが解放されハンドルが別モジュールで再利用される可能性があるため注意が必要。


%index
GetOEMCP
オペレーティングシステムの現在の OEM(original equipment manufacturer)コードページ識別子を返す。
%group
Win32 kernel32
%prm

%inst
オペレーティングシステムの現在の OEM(original equipment manufacturer)コードページ識別子を返す。

[戻り値]
オペレーティングシステムの現在の OEM コードページ識別子を返す。

[備考]
OEM および他のコードページの一覧は Code Page Identifiers を参照。


%index
GetProcAddress
指定されたダイナミックリンクライブラリ(DLL)からエクスポートされた関数または変数のアドレスを取得する。
%group
Win32 kernel32
%prm
hModule, lpProcName
hModule : [intptr] 関数または変数を含む DLL モジュールへのハンドル。LoadLibrary、LoadLibraryEx、LoadPackagedLibrary、GetModuleHandle で取得する。LOAD_LIBRARY_AS_DATAFILE でロードされたモジュールからは取得できない。
lpProcName : [str] 関数名、変数名、または関数の序数値。序数値の場合は下位ワードに置き、上位ワードは 0 でなければならない。
%inst
指定されたダイナミックリンクライブラリ(DLL)からエクスポートされた関数または変数のアドレスを取得する。

[戻り値]
関数が成功した場合、戻り値はエクスポートされた関数または変数のアドレス。失敗した場合は NULL。拡張エラー情報は
GetLastError で取得する。

[備考]
lpProcName で指定する関数名のスペルと大文字小文字は、DLL の .def ファイル内 EXPORTS
ステートメントと完全に一致していなければならない。lpProcName には関数の序数値を指定することもでき、序数は 1
から最大序数値の範囲内でなければならない。ターゲットの DLL
モジュールに関数が存在しない可能性がある場合、序数ではなく名前で指定し、関数が利用できない場合の処理を設計する。
（以下省略）


%index
GetSystemTime
現在のシステム日時を協定世界時(UTC)形式で取得する。
%group
Win32 kernel32
%prm
lpSystemTime
lpSystemTime : [var] 現在のシステム日時を受け取る SYSTEMTIME 構造体へのポインタ。NULL にしてはならず、NULL を指定するとアクセス違反になる。
%inst
現在のシステム日時を協定世界時(UTC)形式で取得する。

[備考]
現在のシステム日時を設定するには SetSystemTime を使う。


%index
GetTempPathW
一時ファイル用に指定されたディレクトリのパスを取得する。(Unicode)
%group
Win32 kernel32
%prm
nBufferLength, lpBuffer
nBufferLength : [int] lpBuffer で識別される文字列バッファのサイズ(TCHAR 単位)。
lpBuffer : [wstr] 一時ファイルパスを指定する NULL 終端文字列を受け取るバッファへのポインタ。返される文字列はバックスラッシュで終わる(例 "C:\\TEMP\\")。
%inst
一時ファイル用に指定されたディレクトリのパスを取得する。(Unicode)

[戻り値]
関数が成功した場合、戻り値は終端 NULL を含まない lpBuffer にコピーされた文字列の長さ(TCHAR 単位)。戻り値が
nBufferLength より大きければ、それはパスを格納するために必要なバッファサイズ。失敗した場合は 0。最大戻り値は
MAX_PATH+1(261)。

[備考]
アプリケーションは GetTempPath ではなく GetTempPath2 を呼び出すべきである。GetTempPath
は環境変数の存在を特定の順序で確認し、最初に見つかったパスを使用する。
（以下省略）


%index
GetTickCount
システムが起動してからの経過ミリ秒数を取得する(最大 49.7 日)。
%group
Win32 kernel32
%prm

%inst
システムが起動してからの経過ミリ秒数を取得する(最大 49.7 日)。

[戻り値]
戻り値はシステムが起動してからの経過ミリ秒数。

[備考]
GetTickCount の分解能はシステムタイマーの分解能(通常 10~16 ミリ秒)に制限される。経過時間は DWORD
なので、システムが 49.7 日連続稼働すると 0 に戻る。この問題を避けるには GetTickCount64
を使うか、比較時にオーバーフロー状態を確認する。
（以下省略）


%index
GetTickCount64
システムが起動してからの経過ミリ秒数を取得する。
%group
Win32 kernel32
%prm

%inst
システムが起動してからの経過ミリ秒数を取得する。

[戻り値]
経過ミリ秒数。

[備考]
GetTickCount64 の分解能はシステムタイマー(通常 10~16
ミリ秒)に制限される。GetSystemTimeAdjustment
による調整の影響を受けない。より高分解能タイマーが必要ならマルチメディアタイマーまたは高分解能タイマーを使う。コンパイルには
_WIN32_WINNT を 0x0600 以上に定義する必要がある。
（以下省略）


%index
GlobalFree
指定されたグローバルメモリオブジェクトを解放し、そのハンドルを無効化する。
%group
Win32 kernel32
%prm
hMem
hMem : [int] グローバルメモリオブジェクトへのハンドル。GlobalAlloc または GlobalReAlloc で取得したものでなければならず、LocalAlloc で割り当てたメモリの解放には使えない。
%inst
指定されたグローバルメモリオブジェクトを解放し、そのハンドルを無効化する。

[戻り値]
関数が成功した場合、戻り値は NULL。失敗した場合、戻り値はグローバルメモリオブジェクトへのハンドルに等しい。

[備考]

解放後のメモリを参照・変更するとヒープ破損やアクセス違反例外(EXCEPTION_ACCESS_VIOLATION)が発生しうる。GlobalFree
はロック中のメモリオブジェクトも解放する。デバッグ版 OS
ではロック中オブジェクトを解放しようとするとメッセージが表示されブレークポイントが設定される。


%index
GlobalAlloc
指定されたバイト数をヒープから割り当てる。(GlobalAlloc)
%group
Win32 kernel32
%prm
uFlags, dwBytes
uFlags : [int] 
dwBytes : [int] 割り当てるバイト数。uFlags に GMEM_MOVEABLE が指定されてこの値が 0 の場合、関数は廃棄されたとマークされたメモリオブジェクトのハンドルを返す。
%inst
指定されたバイト数をヒープから割り当てる。(GlobalAlloc)

[戻り値]
関数が成功した場合、戻り値は新しく割り当てられたメモリオブジェクトへのハンドル。失敗した場合は NULL。拡張エラー情報は
GetLastError で取得する。

[備考]
Windows メモリ管理はローカルヒープとグローバルヒープを分離しないため、GlobalAlloc と LocalAlloc
は実質的に同じ。可搬メモリフラグ GHND と GMEM_MOVABLE
は不要なオーバーヘッドがかかり、安全に使うにはロックが必要なので、特別な理由がない限り避けるべき。新しいアプリケーションはヒープ関数(HeapAlloc
等)を使用すべきで、GlobalAlloc は DDE、クリップボード、OLE データオブジェクトなどで使用される。解放は
GlobalFree を使う(LocalFree では安全でない)。
（以下省略）


%index
GlobalLock
グローバルメモリオブジェクトをロックし、オブジェクトのメモリブロックの最初のバイトへのポインタを返す。
%group
Win32 kernel32
%prm
hMem
hMem : [int] グローバルメモリオブジェクトへのハンドル。GlobalAlloc または GlobalReAlloc で取得する。
%inst
グローバルメモリオブジェクトをロックし、オブジェクトのメモリブロックの最初のバイトへのポインタを返す。

[戻り値]
関数が成功した場合、戻り値はメモリブロックの最初のバイトへのポインタ。失敗した場合は NULL。

[備考]
各メモリオブジェクトは内部にロックカウントを持つ(初期値 0)。可搬メモリオブジェクトに対し GlobalLock はカウントを 1
増やし、GlobalUnlock は 1 減らす。GlobalLock の各呼び出しは対応する GlobalUnlock
の呼び出しとマッチングしなければならない。ロック中のメモリは GlobalReAlloc
による再割り当てを除き移動/廃棄されない。GMEM_FIXED で割り当てられたオブジェクトのロックカウントは常に 0
で、返されるポインタはハンドルの値に等しい。


%index
GlobalSize
指定されたグローバルメモリオブジェクトの現在のサイズ(バイト単位)を取得する。
%group
Win32 kernel32
%prm
hMem
hMem : [int] グローバルメモリオブジェクトへのハンドル。GlobalAlloc または GlobalReAlloc で取得する。
%inst
指定されたグローバルメモリオブジェクトの現在のサイズ(バイト単位)を取得する。

[戻り値]
関数が成功した場合、戻り値は指定されたグローバルメモリオブジェクトのサイズ(バイト単位)。ハンドルが無効または廃棄済みの場合は 0。

[備考]
メモリブロックのサイズは割り当てを要求したサイズより大きい場合がある。廃棄されていないことを確認するには、GlobalSize を呼ぶ前に
GlobalFlags を使う。


%index
GlobalUnlock
GMEM_MOVEABLE で割り当てられたメモリオブジェクトに関連付けられたロックカウントを減らす。
%group
Win32 kernel32
%prm
hMem
hMem : [int] グローバルメモリオブジェクトへのハンドル。GlobalAlloc または GlobalReAlloc で取得する。
%inst
GMEM_MOVEABLE で割り当てられたメモリオブジェクトに関連付けられたロックカウントを減らす。

[戻り値]
ロックカウントを減らした後もロック状態なら戻り値は 0 以外。ロックが解除された場合は 0 を返し GetLastError は
NO_ERROR を返す。失敗時は 0 で GetLastError は NO_ERROR 以外を返す。

[備考]
GlobalLock の各呼び出しは最終的に GlobalUnlock の呼び出しと対応させなければならない。ロック中のメモリは
GlobalReAlloc による再割り当てを除き移動/廃棄されない。GMEM_FIXED で割り当てられた固定メモリは常にロックカウント
0 で、この関数は TRUE を返す。既にアンロック済みなら FALSE を返し GetLastError は
ERROR_NOT_LOCKED を報告する。


%index
HeapAlloc
ヒープからメモリブロックを割り当てる。割り当てられたメモリは移動できない。
%group
Win32 kernel32
%prm
hHeap, dwFlags, dwBytes
hHeap : [intptr] メモリを割り当てるヒープへのハンドル。HeapCreate または GetProcessHeap で取得する。
dwFlags : [int] ヒープ割り当てオプション。これらの値を指定すると、HeapCreate 時に指定された対応する値を上書きする。
dwBytes : [int] 割り当てるバイト数。hHeap が「成長不可」ヒープの場合、dwBytes は 0x7FFF8 未満でなければならない。
%inst
ヒープからメモリブロックを割り当てる。割り当てられたメモリは移動できない。

[戻り値]
関数が成功した場合、戻り値は割り当てられたメモリブロックへのポインタ。失敗して HEAP_GENERATE_EXCEPTIONS
が指定されていない場合は NULL。指定されている場合は例外を生成する可能性がある。
（以下省略）

[備考]
HeapAlloc が成功した場合、少なくとも要求した量のメモリを割り当てる。プロセスの既定ヒープから割り当てるには
GetProcessHeap が返すハンドルを使う。解放は HeapFree で行う。HeapAlloc
で割り当てたメモリは移動不可で、アドレスは解放/再割り当てまで有効。システムはプライベートヒープをコンパクトできないためフラグメント化する可能性がある。アラインメントは
MEMORY_ALLOCATION_ALIGNMENT。
（以下省略）


%index
HeapCreate
呼び出し元プロセスが使用できるプライベートヒープオブジェクトを作成する。プロセス仮想アドレス空間に領域を予約し、指定された初期部分に物理ストレージを割り当てる。
%group
Win32 kernel32
%prm
flOptions, dwInitialSize, dwMaximumSize
flOptions : [int] 
dwInitialSize : [int] ヒープの初期サイズ(バイト単位)。初期にヒープにコミットされるメモリ量を決定する。システムページサイズの倍数に切り上げられる。dwMaximumSize より小さくなければならない。0 の場合、関数は 1 ページをコミットする。
dwMaximumSize : [int] ヒープの最大サイズ(バイト単位)。HeapCreate はこの値をシステムページサイズの倍数に切り上げる。0 以外ならヒープサイズは固定で、最大サイズを超えて拡張できない。32 ビットプロセスでは 512KB 弱、64 ビットプロセスでは 1024KB 弱が最大割り当てブロックサイズ。0 ならヒープは利用可能メモリに応じて拡張可能。
%inst

呼び出し元プロセスが使用できるプライベートヒープオブジェクトを作成する。プロセス仮想アドレス空間に領域を予約し、指定された初期部分に物理ストレージを割り当てる。

[戻り値]
関数が成功した場合、戻り値は新しく作成されたヒープへのハンドル。失敗した場合は NULL。

[備考]
HeapCreate
はプライベートヒープを作成する。初期サイズは最初にコミットされるページ数を決定し、最大サイズは予約される総ページ数を決定する。HeapAlloc
の要求が現在のコミットページサイズを超えると、物理ストレージが利用可能な限り自動的にコミットされる。プライベートヒープのメモリは作成プロセスのみがアクセスできる。HEAP_NO_SERIALIZE
が指定されていない場合、ヒープは呼び出し元プロセス内でアクセスを直列化する。
（以下省略）


%index
HeapDestroy
指定されたヒープオブジェクトを破棄する。プライベートヒープオブジェクトのすべてのページをデコミットおよび解放し、ヒープへのハンドルを無効化する。
%group
Win32 kernel32
%prm
hHeap
hHeap : [intptr] 破棄するヒープへのハンドル。HeapCreate で取得する。GetProcessHeap が返すプロセスヒープへのハンドルを使ってはならない。
%inst

指定されたヒープオブジェクトを破棄する。プライベートヒープオブジェクトのすべてのページをデコミットおよび解放し、ヒープへのハンドルを無効化する。

[戻り値]
関数が成功した場合、戻り値は 0 以外。失敗した場合は 0。拡張エラー情報は GetLastError で取得する。

[備考]
プロセスはヒープから割り当てたメモリを先に HeapFree で解放しなくても HeapDestroy を呼び出すことができる。


%index
HeapFree
HeapAlloc または HeapReAlloc でヒープから割り当てられたメモリブロックを解放する。
%group
Win32 kernel32
%prm
hHeap, dwFlags, lpMem
hHeap : [intptr] 解放するメモリブロックを含むヒープへのハンドル。HeapCreate または GetProcessHeap で取得する。
dwFlags : [int] ヒープ解放オプション。
lpMem : [intptr] 解放するメモリブロックへのポインタ。HeapAlloc または HeapReAlloc で返されたもの。NULL も指定可能。
%inst
HeapAlloc または HeapReAlloc でヒープから割り当てられたメモリブロックを解放する。

[戻り値]
関数が成功した場合、戻り値は 0 以外。失敗した場合は 0。拡張エラー情報は GetLastError で取得する。

[備考]
HeapFree で解放されたメモリは一切参照してはならない。HeapSize
などの情報取得関数も解放済みメモリには使用不可(不正なデータが返る可能性がある)。同じポインタで HeapFree を 2
度呼ぶとヒープ破損の原因となる。
（以下省略）


%index
LoadLibraryW
指定されたモジュールを呼び出し元プロセスのアドレス空間にロードする。(LoadLibraryW)
%group
Win32 kernel32
%prm
lpLibFileName
lpLibFileName : [wstr] モジュール名。ライブラリ(.dll)または実行可能モジュール(.exe)。フルパス指定の場合はそのパスのみ検索する。相対パスまたはパスなしの場合は標準検索戦略が使われる。パスにはバックスラッシュ(\\)を使う。拡張子省略時は ".DLL" が付加され、付加させないには末尾にピリオドを含める。
%inst
指定されたモジュールを呼び出し元プロセスのアドレス空間にロードする。(LoadLibraryW)

[戻り値]
関数が成功した場合、戻り値はモジュールへのハンドル。失敗した場合は NULL。拡張エラー情報は GetLastError で取得する。

[備考]
DLL のロード中にローダが表示するエラーメッセージを有効/無効にするには SetErrorMode を使う。LoadLibrary
はライブラリモジュールをプロセスのアドレス空間にロードし、GetProcAddress で DLL
関数のアドレスを取得するためのハンドルを返す。.exe ファイルをロードして FindResource/LoadResource
でリソースを取得するのにも使えるが、.exe を実行するのには使わず CreateProcess
を使う。システムはロード済みモジュールごとにプロセス単位の参照カウントを保持し、LoadLibrary
でインクリメント、FreeLibrary または FreeLibraryAndExitThread でデクリメントする。セキュリティ注意:
SearchPath で DLL のパスを取得してから LoadLibrary するのは避ける。
（以下省略）


%index
LoadLibraryExW
指定されたモジュールを呼び出し元プロセスのアドレス空間にロードする。(LoadLibraryExW)
%group
Win32 kernel32
%prm
lpLibFileName, hFile, dwFlags
lpLibFileName : [wstr] ロードするモジュールのファイル名を指定する文字列。ライブラリモジュール(.dll)または実行可能モジュール(.exe)。実行可能モジュールの場合、静的インポートはロードされず、DONT_RESOLVE_DLL_REFERENCES が指定されたかのようにロードされる。パスなしのモジュール名で拡張子がなくピリオドも含まない場合、既定のライブラリ拡張子 ".DLL" が付加される。完全修飾パスを指定すると、関数はそのパスのみ検索する。パス指定の場合はバックスラッシュ(\\)を使う。
hFile : [intptr] このパラメータは将来の使用のために予約されており、NULL でなければならない。
dwFlags : [int] モジュールロード時のアクション。フラグを指定しない場合の動作は LoadLibrary と同じ。
%inst
指定されたモジュールを呼び出し元プロセスのアドレス空間にロードする。(LoadLibraryExW)

[戻り値]
関数が成功した場合、戻り値はロードされたモジュールへのハンドル。失敗した場合は NULL。拡張エラー情報は GetLastError
で取得する。

[備考]
LoadLibraryEx は LoadLibrary と非常によく似ているが、LoadLibraryEx
はオプションの動作を一連提供する。
（以下省略）


%index
MoveFileW
既存のファイルまたはディレクトリ(子を含む)を移動する。
%group
Win32 kernel32
%prm
lpExistingFileName, lpNewFileName
lpExistingFileName : [wstr] ローカルコンピュータ上のファイルまたはディレクトリの現在の名前。ANSI 版では MAX_PATH 文字に制限される。Unicode 版で 32,767 文字まで拡張するには "\\?\" をパスに付加する。
lpNewFileName : [wstr] ファイルまたはディレクトリの新しい名前。既に存在してはならない。新しいファイルは異なるファイルシステムやドライブ上でもよいが、新しいディレクトリは同じドライブ上でなければならない。
%inst
既存のファイルまたはディレクトリ(子を含む)を移動する。

[戻り値]
関数が成功した場合、戻り値は 0 以外。失敗した場合は 0。拡張エラー情報は GetLastError で取得する。

[備考]
MoveFile
はファイルまたはディレクトリ(および子)を同じディレクトリ内または別ディレクトリ間で移動(リネーム)する。ただし、ディレクトリ移動の宛先が別ボリュームの場合は失敗する。ボリュームをまたいでファイルを移動する場合、セキュリティ記述子は移動されず、移動先ディレクトリの既定のセキュリティ記述子が割り当てられる。MoveFile
はリンク追跡サービスと連携して動作する。
（以下省略）


%index
MultiByteToWideChar
文字列を UTF-16(ワイド文字)文字列にマップする。
%group
Win32 kernel32
%prm
CodePage, dwFlags, lpMultiByteStr, cbMultiByte, lpWideCharStr, cchWideChar
CodePage : [int] 変換に使用するコードページ。システムにインストールまたは利用可能な任意のコードページ値を設定できる。
dwFlags : [int] 
lpMultiByteStr : [str] 変換する文字列へのポインタ。
cbMultiByte : [int] lpMultiByteStr が示す文字列のサイズ(バイト単位)。NULL 終端文字列なら -1 を指定可能。0 の場合、関数は失敗する。-1 なら終端 NULL を含む全入力文字列を処理し、結果の Unicode 文字列も終端 NULL を含み、戻り値にもこの文字が含まれる。正の整数なら指定バイト数ちょうどを処理する。
lpWideCharStr : [wstr] 変換された文字列を受け取るバッファへのポインタ。
cchWideChar : [int] lpWideCharStr バッファのサイズ(文字単位)。0 なら必要なバッファサイズ(終端 NULL を含む文字単位)を返し、lpWideCharStr バッファを使用しない。
%inst
文字列を UTF-16(ワイド文字)文字列にマップする。

[戻り値]
成功した場合、戻り値は lpWideCharStr に書き込まれた文字数。成功して cchWideChar が 0
の場合、戻り値は必要なバッファサイズ(文字単位)。関数が失敗した場合は 0 を返す。
（以下省略）

[備考]
既定の動作は入力文字列を precomposed 形式に変換すること。存在しない場合は composite
形式を試みる。MB_PRECOMPOSED フラグは多くの入力データが既に composed
のためコードページへの影響はほとんどない。NormalizeString の呼び出しを検討するとよい。lpMultiByteStr と
lpWideCharStr は同じポインタであってはならない。入力長が明示的に終端 NULL なしで指定された場合、出力は NULL
終端されない。-1 を渡すか終端 NULL を明示的にカウントすることで NULL 終端にできる。
（以下省略）


%index
OpenProcess
既存のローカルプロセスオブジェクトを開く。
%group
Win32 kernel32
%prm
dwDesiredAccess, bInheritHandle, dwProcessId
dwDesiredAccess : [int] プロセスオブジェクトへのアクセス。プロセスのセキュリティ記述子と照合される。1 つ以上のプロセスアクセス権を指定できる。SeDebugPrivilege 特権が有効な場合、セキュリティ記述子の内容に関わらず要求アクセスが付与される。
bInheritHandle : [int] TRUE の場合、このプロセスが作成するプロセスがハンドルを継承する。それ以外は継承しない。
dwProcessId : [int] 開くローカルプロセスの識別子。System Idle Process(0x00000000)を指定した場合、関数は失敗し、last error は ERROR_INVALID_PARAMETER。System プロセスや CSRSS プロセスの場合は ERROR_ACCESS_DENIED で失敗する。GetCurrentProcessId を引数に使う場合は、代わりに GetCurrentProcess を使うとよい。
%inst
既存のローカルプロセスオブジェクトを開く。

[戻り値]
関数が成功した場合、戻り値は指定されたプロセスへのオープンハンドル。失敗した場合は NULL。拡張エラー情報は GetLastError
で取得する。

[備考]
他のローカルプロセスへのフルアクセスハンドルを開くには SeDebugPrivilege
特権を有効にする必要がある。OpenProcess が返すハンドルは、適切なアクセス権が要求されていれば wait
関数などプロセスハンドルを必要とする任意の関数で使用できる。ハンドルの使用が終わったら CloseHandle で閉じること。


%index
OutputDebugStringW
文字列を表示するためにデバッガに送信する。(Unicode)
%group
Win32 kernel32
%prm
lpOutputString
lpOutputString : [wstr] 表示する NULL 終端文字列。
%inst
文字列を表示するためにデバッガに送信する。(Unicode)

[備考]
この関数を使うには Windows.h ヘッダをインクルードする必要がある(debugapi.h ではなく)。以前の OS は
OutputDebugStringW 経由で Unicode 文字列を返さなかった。新しい動作を有効にするにはデバッガが
WaitForDebugEventEx
を呼ぶ必要がある。アプリケーションにデバッガがない場合で、フィルタマスクが許可すればシステムデバッガが文字列を表示する。アプリケーションはデバッグ出力を最小限に抑え、ユーザが有効/無効を切り替える手段を提供すべきである。
（以下省略）


%index
QueryPerformanceCounter
高分解能(<1us)タイムスタンプであるパフォーマンスカウンタの現在値を取得する。時間間隔の計測に使用できる。
%group
Win32 kernel32
%prm
lpPerformanceCount
lpPerformanceCount : [var] 現在のパフォーマンスカウンタ値(カウント単位)を受け取る変数へのポインタ。
%inst
高分解能(<1us)タイムスタンプであるパフォーマンスカウンタの現在値を取得する。時間間隔の計測に使用できる。

[戻り値]
関数が成功した場合、戻り値は 0 以外。失敗した場合は 0。Windows XP 以降では常に成功し 0 を返すことはない。

[備考]
この関数の詳細については Acquiring high-resolution time stamps を参照。


%index
QueryPerformanceFrequency
パフォーマンスカウンタの周波数を取得する。
%group
Win32 kernel32
%prm
lpFrequency
lpFrequency : [var] 現在のパフォーマンスカウンタ周波数(秒あたりのカウント数)を受け取る変数へのポインタ。高分解能カウンタをサポートしないハードウェアでは 0 になる(Windows XP 以降では発生しない)。
%inst
パフォーマンスカウンタの周波数を取得する。

[戻り値]
インストールされているハードウェアが高分解能パフォーマンスカウンタをサポートする場合、戻り値は 0 以外。失敗した場合は
0。Windows XP 以降では常に成功し 0 を返すことはない。

[備考]
この関数の詳細については Acquiring high-resolution time stamps を参照。


%index
ReadFile
指定したファイルまたは I/O デバイスからデータを読み取る。デバイスがサポートする場合、読み取りはファイルポインタが示す位置で行われる。
%group
Win32 kernel32
%prm
hFile, lpBuffer, nNumberOfBytesToRead, lpNumberOfBytesRead, lpOverlapped
hFile : [intptr] デバイスへのハンドル(ファイル、ファイルストリーム、物理ディスク、ボリューム、コンソールバッファ、テープドライブ、ソケット、通信リソース、メールスロット、パイプなど)。読み取りアクセスで作成する必要がある。非同期読み取りでは FILE_FLAG_OVERLAPPED で開いた任意のハンドル、または socket/accept が返すソケットハンドルを指定できる。
lpBuffer : [var] ファイルまたはデバイスから読み取られたデータを受け取るバッファへのポインタ。読み取り操作中、このバッファは有効なままでなければならず、完了するまで呼び出し元はバッファを使用してはならない。
nNumberOfBytesToRead : [int] 読み取る最大バイト数。
lpNumberOfBytesRead : [var] 同期 hFile 使用時に読み取られたバイト数を受け取る変数へのポインタ。非同期操作では誤った結果を避けるため NULL を使う(この場合 lpOverlapped が非 NULL でなければならない)。
lpOverlapped : [var] hFile が FILE_FLAG_OVERLAPPED で開かれた場合に必要な OVERLAPPED 構造体へのポインタ。そうでなければ NULL。バイトオフセットをサポートする hFile でこのパラメータを使用する場合、Offset と OffsetHigh メンバで開始バイトオフセットを指定する。
%inst
指定したファイルまたは I/O デバイスからデータを読み取る。デバイスがサポートする場合、読み取りはファイルポインタが示す位置で行われる。

[戻り値]
関数が成功した場合、戻り値は 0 以外(TRUE)。失敗または非同期完了中の場合は 0(FALSE)。拡張エラー情報は
GetLastError で取得する。ERROR_IO_PENDING は失敗ではなく、非同期での完了待機を示す。

[備考]
ReadFile 関数は次のいずれかの条件が発生した場合に戻る:
（以下省略）


%index
ReleaseMutex
指定されたミューテックスオブジェクトの所有権を解放する。
%group
Win32 kernel32
%prm
hMutex
hMutex : [intptr] ミューテックスオブジェクトへのハンドル。CreateMutex または OpenMutex で取得する。
%inst
指定されたミューテックスオブジェクトの所有権を解放する。

[戻り値]
関数が成功した場合、戻り値は 0 以外。失敗した場合は 0。拡張エラー情報は GetLastError で取得する。

[備考]
呼び出し元スレッドがミューテックスを所有していない場合、ReleaseMutex は失敗する。スレッドは
bInitialOwner=TRUE で作成するか wait
関数で取得することで所有権を得る。所有権を解放すると他スレッドが取得できる。同じミューテックスを所有したまま wait
関数を呼ぶことができる(自己デッドロックを防ぐ)が、所有権を完全に解放するには取得した回数分 ReleaseMutex を呼ぶ必要がある。


%index
ResetEvent
指定されたイベントオブジェクトを非シグナル状態に設定する。
%group
Win32 kernel32
%prm
hEvent
hEvent : [intptr] イベントオブジェクトへのハンドル。CreateEvent または OpenEvent で取得したもの。
%inst
指定されたイベントオブジェクトを非シグナル状態に設定する。

[戻り値]
関数が成功した場合、戻り値は 0 以外。失敗した場合は 0。拡張エラー情報は GetLastError で取得する。

[備考]
イベントオブジェクトの状態は SetEvent または PulseEvent
で明示的にシグナル状態にされるまで非シグナル状態のままとなる。非シグナル状態ではイベントを待機中のスレッドはブロックされる。ResetEvent
は主に手動リセットイベント用(自動リセットは単一スレッド解放後に自動的に非シグナルに戻る)。既に非シグナル状態のイベントをリセットしても何も起こらない。


%index
SetCurrentDirectoryW
現在のプロセスの現在のディレクトリを変更する。
%group
Win32 kernel32
%prm
lpPathName
lpPathName : [wstr] 新しい現在のディレクトリへのパス。相対パスまたはフルパスを指定可能。いずれの場合も指定されたディレクトリのフルパスが計算されて現在のディレクトリとして保存される。ANSI 版では MAX_PATH 文字に制限され、末尾は NULL の前にバックスラッシュ('\\')でなければならない。
%inst
現在のプロセスの現在のディレクトリを変更する。

[戻り値]
関数が成功した場合、戻り値は 0 以外。失敗した場合は 0。拡張エラー情報は GetLastError で取得する。

[備考]
各プロセスは 2 つの部分からなる単一の現在のディレクトリを持つ:
（以下省略）


%index
SetEnvironmentVariableW
現在のプロセスの指定された環境変数の内容を設定する。
%group
Win32 kernel32
%prm
lpName, lpValue
lpName : [wstr] 環境変数の名前。この変数が存在せず lpValue が NULL でない場合、オペレーティングシステムはそれを作成する。
lpValue : [wstr] 環境変数の内容。ユーザー定義環境変数の最大サイズは 32,767 文字。NULL の場合、変数は現在のプロセスの環境から削除される。
%inst
現在のプロセスの指定された環境変数の内容を設定する。

[戻り値]
関数が成功した場合、戻り値は 0 以外。失敗した場合は 0。拡張エラー情報は GetLastError で取得する。

[備考]
この関数はシステム環境変数や他プロセスの環境変数には影響しない。


%index
SetEvent
指定されたイベントオブジェクトをシグナル状態に設定する。
%group
Win32 kernel32
%prm
hEvent
hEvent : [intptr] イベントオブジェクトへのハンドル。CreateEvent または OpenEvent で取得したもの。
%inst
指定されたイベントオブジェクトをシグナル状態に設定する。

[戻り値]
関数が成功した場合、戻り値は 0 以外。失敗した場合は 0。拡張エラー情報は GetLastError で取得する。

[備考]
手動リセットイベントオブジェクトの状態は、ResetEvent
で明示的に非シグナル状態に設定されるまでシグナル状態を維持する。この間、待機中の任意数のスレッドを解放できる。自動リセットイベントオブジェクトの状態は、単一の待機スレッドが解放されるまでシグナル状態を維持し、その時点でシステムが自動的に非シグナル状態に設定する。待機中スレッドがない場合、シグナル状態を維持する。既にシグナル状態のイベントを設定しても何も起こらない。


%index
SetFileAttributesW
ファイルまたはディレクトリの属性を設定する。(Unicode)
%group
Win32 kernel32
%prm
lpFileName, dwFileAttributes
lpFileName : [wstr] 属性を設定するファイルの名前。
dwFileAttributes : [int] ファイルに設定するファイル属性。ビット OR で複数の値を組み合わせ可能だが、他の値はすべて FILE_ATTRIBUTE_NORMAL を上書きする。この関数ですべての属性がサポートされるわけではない。
%inst
ファイルまたはディレクトリの属性を設定する。(Unicode)

[戻り値]
関数が成功した場合、戻り値は 0 以外。失敗した場合は 0。拡張エラー情報は GetLastError で取得する。

[備考]
SetFileAttributes では設定できない属性もある。すべての属性値とその説明については File Attribute
Constants を参照。
（以下省略）


%index
SetFilePointer
指定したファイルのファイルポインタを移動する。(SetFilePointer)
%group
Win32 kernel32
%prm
hFile, lDistanceToMove, lpDistanceToMoveHigh, dwMoveMethod
hFile : [intptr] ファイルへのハンドル。
lDistanceToMove : [int] ファイルポインタを移動するバイト数を指定する符号付き値の下位 32 ビット。
lpDistanceToMoveHigh : [var] 符号付き 64 ビット移動距離の上位 32 ビットへのポインタ。
dwMoveMethod : [int] ファイルポインタ移動の起点。
%inst
指定したファイルのファイルポインタを移動する。(SetFilePointer)

[戻り値]
関数が成功して lpDistanceToMoveHigh が NULL の場合、戻り値は新しいファイルポインタの下位
DWORD。INVALID_SET_FILE_POINTER 以外を返した場合は成功(GetLastError を呼ぶ必要はない)。
関数が失敗した場合、戻り値は INVALID_SET_FILE_POINTER。新しいファイルポインタが負になる場合は失敗し
ERROR_NEGATIVE_SEEK が返る。INVALID_SET_FILE_POINTER は下位 DWORD
の有効な値でもあるので、エラー判定には GetLastError も確認する必要がある。

[備考]
hFile で識別されるファイルポインタはオーバーラップ読み書き操作では使用されない。hFile
はディスクボリュームなどシーク可能デバイス上のファイルでなければならない。パイプや通信デバイスなどの非シークデバイスのハンドルでの呼び出しはサポートされず、動作は未定義。
（以下省略）


%index
SetLastError
呼び出し元スレッドの last-error コードを設定する。
%group
Win32 kernel32
%prm
dwErrCode
dwErrCode : [int] スレッドの last-error コード。
%inst
呼び出し元スレッドの last-error コードを設定する。

[備考]
last-error コードはスレッドローカルストレージに保持される。ほとんどの関数は失敗時のみ SetLastError
を呼ぶが、成功時にも呼ぶ一部のシステム関数もある(各関数のドキュメント参照)。GetLastError で即座に取得可能。エラーコードは
32 ビット値でビット 29
はアプリケーション定義エラーコード用に予約されている。システムエラーコードはこのビットをセットしないため、アプリケーション定義エラーコードはこのビットを使用する。


%index
SetLocalTime
現在のローカル時刻と日付を設定する。
%group
Win32 kernel32
%prm
lpSystemTime
lpSystemTime : [var] 新しいローカル日時を含む SYSTEMTIME 構造体へのポインタ。
%inst
現在のローカル時刻と日付を設定する。

[戻り値]
関数が成功した場合、戻り値は 0 以外。失敗した場合は 0。拡張エラー情報は GetLastError で取得する。

[備考]
呼び出し元プロセスは SE_SYSTEMTIME_NAME 特権を持っていなければならない(既定では無効)。SetLocalTime
は変更前に特権を有効にし、戻る前に無効にする。システムは内部で UTC を使用するので、SetLocalTime
は現在のタイムゾーン情報(サマータイム設定を含む)を使って変換を行う。正しい結果を得るには、最初の呼び出しがサマータイム設定を更新した後に
2 回目を呼び出すこと。


%index
Sleep
指定されたタイムアウト間隔が経過するまで現在のスレッドの実行を一時停止する。
%group
Win32 kernel32
%prm
dwMilliseconds
dwMilliseconds : [int] 実行を一時停止する時間間隔(ミリ秒単位)。0 の場合、実行可能な他スレッドにタイムスライスの残りを放棄する。他に実行可能なスレッドがない場合は即座に戻り実行を続ける。INFINITE はタイムアウトしないことを示す。
%inst
指定されたタイムアウト間隔が経過するまで現在のスレッドの実行を一時停止する。

[備考]
この関数は、dwMilliseconds
の値に基づいた間隔でスレッドがタイムスライスの残りを放棄し実行不能状態となる。システムクロックは一定の率で進み、分解能より小さい値を指定した場合は指定時間より短くスリープすることがある。スリープ間隔の精度を上げるには、timeGetDevCaps
で最小タイマー分解能を確認し、timeBeginPeriod で設定する。ready
状態のスレッドはすぐに実行されることは保証されず、スリープ間隔経過後すぐには実行されない場合がある。
（以下省略）


%index
TerminateProcess
指定したプロセスとそのすべてのスレッドを終了する。
%group
Win32 kernel32
%prm
hProcess, uExitCode
hProcess : [intptr] 終了するプロセスへのハンドル。PROCESS_TERMINATE アクセス権が必要。
uExitCode : [int] プロセスおよび終了するスレッドが使用する終了コード。プロセスの終了値は GetExitCodeProcess で取得する。
%inst
指定したプロセスとそのすべてのスレッドを終了する。

[戻り値]
関数が成功した場合、戻り値は 0 以外。失敗した場合は 0。拡張エラー情報は GetLastError で取得する。

[備考]
TerminateProcess はプロセスを無条件で終了するために使用される。ExitProcess の代わりに使うと DLL
が保持するグローバルデータの状態が損なわれる可能性がある。この関数はプロセス内全スレッドの実行を停止し、保留中の全 I/O
のキャンセルを要求する。終了プロセスはすべての保留 I/O が完了またはキャンセルされるまで終了できない。プロセスが自身を終了する場合
TerminateProcess は戻らない。他のプロセスを終了する場合は非同期で即座に戻る。


%index
VirtualAlloc
呼び出し元プロセスの仮想アドレス空間内のページ領域を予約、コミット、または状態変更する。(VirtualAlloc)
%group
Win32 kernel32
%prm
lpAddress, dwSize, flAllocationType, flProtect
lpAddress : [intptr] 割り当てる領域の開始アドレス。メモリが予約される場合、指定アドレスは割り当て粒度の最も近い倍数に切り下げられる。既に予約済みでコミットする場合は、次のページ境界に切り下げられる。NULL の場合、システムが割り当て場所を決定する。
dwSize : [int] 領域のサイズ(バイト単位)。lpAddress が NULL なら次のページ境界に切り上げられる。そうでなければ、lpAddress から lpAddress+dwSize の範囲にある 1 バイト以上を含むすべてのページが割り当て領域に含まれる。
flAllocationType : [int] 
flProtect : [int] 割り当てるページ領域のメモリ保護。ページをコミットする場合、Memory Protection Constants のいずれかを指定可能。
%inst
呼び出し元プロセスの仮想アドレス空間内のページ領域を予約、コミット、または状態変更する。(VirtualAlloc)

[戻り値]
関数が成功した場合、戻り値は割り当てられたページ領域のベースアドレス。失敗した場合は NULL。拡張エラー情報は GetLastError
で取得する。

[備考]
各ページには関連するページ状態がある。VirtualAlloc
は、予約ページ領域のコミット、空きページ領域の予約、空きページ領域の同時予約とコミットを実行できる。予約済みページを再予約することはできないが、既にコミット済みのページをコミットすることはできる。予約したアドレス空間を必要になるまで物理ストレージを消費せずに保持することが可能。動的生成コードを実行するには
VirtualAlloc でメモリを割り当て、VirtualProtect で PAGE_EXECUTE アクセスを付与する。AWE
メモリ領域の予約にも使える。


%index
VirtualFree
呼び出し元プロセスの仮想アドレス空間内のページ領域を解放、デコミット、または解放とデコミットする。
%group
Win32 kernel32
%prm
lpAddress, dwSize, dwFreeType
lpAddress : [intptr] 解放するページ領域のベースアドレスへのポインタ。dwFreeType が MEM_RELEASE の場合、VirtualAlloc でページ領域を予約したときに返されたベースアドレスでなければならない。
dwSize : [int] 解放するメモリ領域のサイズ(バイト単位)。dwFreeType が MEM_RELEASE の場合、このパラメータは 0 でなければならず、VirtualAlloc の初回呼び出しで予約された全領域が解放される。MEM_DECOMMIT の場合、lpAddress から (lpAddress+dwSize) の範囲の 1 バイト以上を含むすべてのページがデコミットされる。
dwFreeType : [int] 
%inst
呼び出し元プロセスの仮想アドレス空間内のページ領域を解放、デコミット、または解放とデコミットする。

[戻り値]
関数が成功した場合、戻り値は 0 以外。失敗した場合は 0。拡張エラー情報は GetLastError で取得する。

[備考]
各ページにはページ状態がある。VirtualFree
は異なる状態のページ(一部コミット、一部未コミット)の範囲をデコミットできる。デコミットはページの物理ストレージを解放し、状態を
reserved に変更する。VirtualFree は reserved と committed が混在するページ範囲も解放できる。元の
VirtualAlloc で予約された全ページ範囲を同時に解放する必要がある。解放後のメモリは二度と参照してはならない。


%index
VirtualProtect
呼び出し元プロセスの仮想アドレス空間内のコミット済みページ領域の保護を変更する。(VirtualProtect)
%group
Win32 kernel32
%prm
lpAddress, dwSize, flNewProtect, lpflOldProtect
lpAddress : [intptr] 保護属性を変更するページ領域の開始ページのアドレス。指定領域内の全ページは、MEM_RESERVE で VirtualAlloc/VirtualAllocEx が呼び出されたときに割り当てられた同じ予約領域内に存在しなければならない。
dwSize : [int] 保護属性を変更する領域のサイズ(バイト単位)。lpAddress から (lpAddress+dwSize) の範囲の 1 バイト以上を含むすべてのページが対象となる。
flNewProtect : [int] メモリ保護オプション。Memory Protection Constants のいずれか。マップビューでは、マップ時に指定されたアクセス保護と互換のある値でなければならない。
lpflOldProtect : [var] 指定領域の最初のページの以前のアクセス保護値を受け取る変数へのポインタ。NULL または無効な変数を指す場合、関数は失敗する。
%inst
呼び出し元プロセスの仮想アドレス空間内のコミット済みページ領域の保護を変更する。(VirtualProtect)

[戻り値]
関数が成功した場合、戻り値は 0 以外。失敗した場合は 0。拡張エラー情報は GetLastError で取得する。

[備考]
コミット済みページにのみアクセス保護値を設定できる。指定領域のどれかが非コミットなら関数は失敗し保護を変更しない。PAGE_GUARD
修飾子はガードページを作成する(一度だけのアクセスアラーム)。GlobalAlloc、HeapAlloc、LocalAlloc
で割り当てたブロックの保護を変更するのは避けるべきである(単一ページに複数のブロックが存在しうるため)。実行可能領域を保護する場合、コード配置後に
FlushInstructionCache を呼んでキャッシュコヒーレンシを確保する責任がある。


%index
WaitForMultipleObjects
指定したオブジェクトの 1 つまたはすべてがシグナル状態になるか、タイムアウト間隔が経過するまで待機する。
%group
Win32 kernel32
%prm
nCount, lpHandles, bWaitAll, dwMilliseconds
nCount : [int] lpHandles が指す配列内のオブジェクトハンドル数。最大は MAXIMUM_WAIT_OBJECTS。0 にはできない。
lpHandles : [intptr] オブジェクトハンドルの配列。配列には異なる種類のオブジェクトのハンドルを含めることができるが、同じハンドルの複数コピーを含めてはならない。ハンドルには SYNCHRONIZE アクセス権が必要。
bWaitAll : [int] TRUE なら lpHandles 内のすべてのオブジェクトがシグナル状態になったときに戻る。FALSE なら 1 つでもシグナル状態になったときに戻る。後者の場合、戻り値は関数を戻らせたオブジェクトを示す。
dwMilliseconds : [int] タイムアウト間隔(ミリ秒単位)。0 以外なら指定オブジェクトがシグナル状態になるか時間が経過するまで待機する。0 ならシグナル状態でない場合即座に戻る。INFINITE ならシグナル状態になるまで戻らない。
%inst
指定したオブジェクトの 1 つまたはすべてがシグナル状態になるか、タイムアウト間隔が経過するまで待機する。

[戻り値]
関数が成功した場合、戻り値は関数を戻らせたイベントを示す。
（以下省略）

[備考]
待機条件が満たされるかタイムアウトするまで呼び出し元スレッドは待機状態になる。bWaitAll が TRUE
の場合、すべてのオブジェクトの状態がシグナル状態にセットされるまで待機操作は完了しない。関数はすべてのオブジェクトの状態がシグナル状態になるまでオブジェクトの状態を変更しない。bWaitAll
が FALSE の場合、インデックス 0
から順にハンドルをチェックし、シグナル状態のオブジェクトが見つかると戻る。複数がシグナル状態になった場合、配列内の最初のインデックスを返す。MAXIMUM_WAIT_OBJECTS
を超えるハンドルを待機するには複数の方法がある。
（以下省略）


%index
WaitForSingleObject
指定されたオブジェクトがシグナル状態になるかタイムアウト間隔が経過するまで待機する。
%group
Win32 kernel32
%prm
hHandle, dwMilliseconds
hHandle : [intptr] オブジェクトへのハンドル。
dwMilliseconds : [int] タイムアウト間隔(ミリ秒単位)。0 以外ならオブジェクトがシグナル状態になるか時間が経過するまで待機する。0 ならシグナル状態でない場合即座に戻る。INFINITE ならシグナル状態になるまで戻らない。
%inst
指定されたオブジェクトがシグナル状態になるかタイムアウト間隔が経過するまで待機する。

[戻り値]
関数が成功した場合、戻り値は関数を戻らせたイベントを示す。
（以下省略）

[備考]

指定オブジェクトの現在の状態をチェックする。非シグナル状態ならオブジェクトがシグナル状態になるかタイムアウトするまで待機状態に入る。関数は一部の同期オブジェクトの状態を変更する(例:
セマフォのカウントを 1 減らす)。
（以下省略）


%index
WideCharToMultiByte
UTF-16(ワイド文字)文字列を新しい文字列にマップする。
%group
Win32 kernel32
%prm
CodePage, dwFlags, lpWideCharStr, cchWideChar, lpMultiByteStr, cbMultiByte, lpDefaultChar, lpUsedDefaultChar
CodePage : [int] 変換に使用するコードページ。
dwFlags : [int] 
lpWideCharStr : [wstr] 変換する Unicode 文字列へのポインタ。
cchWideChar : [int] lpWideCharStr が示す文字列のサイズ(文字単位)。NULL 終端文字列なら -1 を指定可能。0 なら関数は失敗する。-1 なら終端 NULL を含む全入力を処理し、結果も終端 NULL を含む。
lpMultiByteStr : [str] 変換された文字列を受け取るバッファへのポインタ。
cbMultiByte : [int] lpMultiByteStr が示すバッファのサイズ(バイト単位)。0 なら必要なバッファサイズ(バイト単位、終端 NULL を含む)を返し lpMultiByteStr を使用しない。
lpDefaultChar : [str] 指定コードページで表現できない文字がある場合に使用する文字へのポインタ。NULL でシステム既定値が使われる。CP_UTF7 および CP_UTF8 では NULL にしなければならない。
lpUsedDefaultChar : [var] 変換で既定文字が使われたかを示すフラグへのポインタ。元文字列の 1 つ以上の文字が指定コードページで表現できない場合 TRUE。NULL 可。CP_UTF7/CP_UTF8 では NULL にしなければならない。
%inst
UTF-16(ワイド文字)文字列を新しい文字列にマップする。

[戻り値]
成功した場合、戻り値は lpMultiByteStr に書き込まれたバイト数。成功して cbMultiByte が 0
の場合、戻り値は必要なバッファサイズ(バイト単位)。失敗した場合は 0。
（以下省略）

[備考]
lpMultiByteStr と lpWideCharStr は同じポインタであってはならない。入力長が明示的に終端 NULL
なしで指定された場合、出力は NULL 終端されない。-1 を渡すか終端 NULL を明示的にカウントすることで NULL
終端にできる。cbMultiByte が cchWideChar より小さい場合、cbMultiByte
で指定されたバイト数が書き込まれる。ただし CodePage が CP_SYMBOL
の場合は何も書き込まれない。lpDefaultChar と lpUsedDefaultChar をともに NULL
にすると最も効率的に動作する。
（以下省略）


%index
WriteFile
指定されたファイルまたは I/O デバイスにデータを書き込む。
%group
Win32 kernel32
%prm
hFile, lpBuffer, nNumberOfBytesToWrite, lpNumberOfBytesWritten, lpOverlapped
hFile : [intptr] ファイルまたは I/O デバイスへのハンドル(ファイル、ファイルストリーム、物理ディスク、ボリューム、コンソールバッファ、テープドライブ、ソケット、通信リソース、メールスロット、パイプなど)。書き込みアクセスで作成する必要がある。非同期書き込みでは FILE_FLAG_OVERLAPPED で開いたハンドル、または socket/accept が返すソケットハンドルを指定できる。
lpBuffer : [var] ファイルまたはデバイスに書き込むデータを含むバッファへのポインタ。書き込み操作中はバッファを有効に保ち、完了するまで呼び出し元はバッファを使用してはならない。
nNumberOfBytesToWrite : [int] ファイルまたはデバイスに書き込むバイト数。0 は null write 操作を指定し、基礎となるファイルシステムまたは通信技術に依存する動作をする。
lpNumberOfBytesWritten : [var] 同期 hFile 使用時に書き込まれたバイト数を受け取る変数へのポインタ。非同期操作では誤った結果を避けるため NULL を使う(この場合 lpOverlapped が非 NULL でなければならない)。
lpOverlapped : [var] hFile が FILE_FLAG_OVERLAPPED で開かれた場合に必要な OVERLAPPED 構造体へのポインタ。そうでなければ NULL。バイトオフセットをサポートする hFile でこのパラメータを使用する場合、Offset と OffsetHigh メンバで書き込み開始オフセットを指定する。ファイル末尾に書き込むには Offset/OffsetHigh を 0xFFFFFFFF に設定する。
%inst
指定されたファイルまたは I/O デバイスにデータを書き込む。

[戻り値]
関数が成功した場合、戻り値は 0 以外(TRUE)。失敗または非同期完了中の場合は 0(FALSE)。拡張エラー情報は
GetLastError で取得する。ERROR_IO_PENDING は失敗ではなく非同期完了待機を示す。

[備考]
WriteFile 関数は次のいずれかの条件が発生した場合に戻る:
（以下省略）

