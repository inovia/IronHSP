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
ActivateActCtx
ActivateActCtx 関数は、指定されたアクティベーションコンテキストをアクティブ化する。
%group
Win32 kernel32
%prm
hActCtx, lpCookie
hActCtx : [intptr] アクティブ化するアクティベーションコンテキストに関する情報を含む ACTCTX 構造体へのハンドル。
lpCookie : [var] 特定のアクティブ化されたアクティベーションコンテキストを一意に識別するクッキーとして機能する ULONG_PTR へのポインタ。
%inst
ActivateActCtx 関数は、指定されたアクティベーションコンテキストをアクティブ化する。

[戻り値]
関数が成功した場合、TRUE を返す。そうでなければ FALSE を返す。本関数は GetLastError
で取得可能なエラーを設定する。例については Retrieving the Last-Error Code を参照。エラーコードの一覧は
System Error Codes を参照。

[備考]
lpCookie パラメータは後で DeactivateActCtx に渡され、ActivateActCtx と
DeactivateActCtx
の呼び出しの対応を検証し、適切なアクティベーションコンテキストが非アクティブ化されることを保証する。これは、アクティベーションコンテキストの非アクティブ化がアクティブ化と逆順で行われる必要があるためである。アクティベーションコンテキストのアクティブ化は、アクティベーションコンテキストをスタックに積む動作として理解できる。この関数でアクティブ化したアクティベーションコンテキストは、呼び出した
side-by-side API における DLL、ウィンドウクラス、COM
サーバー、タイプライブラリ、ミューテックスへのバインドをリダイレクトする。アクティベーションコンテキストスタックの先頭項目が現在のスレッドのアクティブなデフォルトアクティベーションコンテキストとなる。NULL
のアクティベーションコンテキストハンドルがスタックに積まれてアクティブ化された場合、元のマニフェストのデフォルト設定がスタック下位のすべてのアクティベーションコンテキストを上書きする。


%index
AddAtomW
ローカルアトムテーブルに文字列を追加し、その文字列を識別する一意の値（アトム）を返す。(Unicode)
%group
Win32 kernel32
%prm
lpString
lpString : [wstr] 型: LPCTSTR 追加する null 終端文字列。文字列の最大サイズは 255 バイト。大文字小文字のみ異なる文字列は同一とみなされる。最初に追加された文字列の大文字小文字は保持され、GetAtomName 関数で返される。代わりに、MAKEINTATOM マクロで変換した整数アトムを使用することもできる。詳細は備考を参照。
%inst
ローカルアトムテーブルに文字列を追加し、その文字列を識別する一意の値（アトム）を返す。(Unicode)

[戻り値]
型: ATOM 関数が成功した場合、戻り値は新しく作成されたアトム。関数が失敗した場合、戻り値はゼロ。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
AddAtom 関数は、同じ文字列についてアトムテーブルに 1
つのコピーしか格納しない。文字列がすでにテーブルに存在する場合、関数は既存のアトムを返し、文字列アトムの場合は文字列の参照カウントをインクリメントする。lpString
が "#1234" の形式の場合、AddAtom は文字列で指定された 10 進数の 16 ビット表現（この例では
0x04D2）を値とする整数アトムを返す。指定された 10 進値が 0x0000 の場合、または 0xC000
以上の場合、戻り値はゼロでエラーを示す。lpString が MAKEINTATOM マクロで作成された場合、下位ワードは 0x0001
から 0xBFFF の範囲でなければならない。下位ワードがこの範囲にない場合、関数が失敗する。lpString
がその他の形式の場合、AddAtom は文字列アトムを返す。
> [!NOTE] > winbase.h ヘッダーは AddAtom を UNICODE プリプロセッサ定数の定義に基づいて ANSI
版または Unicode
版を自動選択するエイリアスとして定義している。エンコード中立エイリアスとそうでないコードを混在させると、コンパイルエラーや実行時エラーにつながる不一致が生じる可能性がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
AddConsoleAliasW
指定された実行ファイルに対するコンソールエイリアスを定義する AddConsoleAlias 関数に関するリファレンス情報を参照のこと。
%group
Win32 kernel32
%prm
Source, Target, ExeName
Source : [wstr] *Target* で指定されたテキストにマップするコンソールエイリアス。
Target : [wstr] *Source* に置き換えられるテキスト。このパラメータが **NULL** の場合、コンソールエイリアスは削除される。
ExeName : [wstr] コンソールエイリアスを定義する対象の実行ファイル名。
%inst
指定された実行ファイルに対するコンソールエイリアスを定義する AddConsoleAlias 関数に関するリファレンス情報を参照のこと。

[戻り値]
関数が成功した場合、戻り値は **TRUE**。関数が失敗した場合、戻り値は **FALSE**。拡張エラー情報を取得するには
[**GetLastError**](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror)
を呼ぶ。

[備考]
この関数を使用するアプリケーションをコンパイルするには、**\_WIN32\_WINNT** を 0x0501 以降として定義する。詳細は
[Using the Windows
Headers](/windows/win32/winprog/using-the-windows-headers)
を参照。[!INCLUDE
[no-vt-equiv-shell-banner](./includes/no-vt-equiv-shell-banner.md)]


%index
AddIntegrityLabelToBoundaryDescriptor
指定された境界記述子に新しい必須のセキュリティ識別子 (SID) を追加する。
%group
Win32 kernel32
%prm
BoundaryDescriptor, IntegrityLabel
BoundaryDescriptor : [intptr] 境界記述子へのハンドル。このハンドルは CreateBoundaryDescriptor 関数が返す。
IntegrityLabel : [int] 名前空間に対する必須整合性レベルを表す SID 構造体へのポインタ。SID の作成には以下のいずれかの RID 値を使用する: SECURITY_MANDATORY_UNTRUSTED_RID、SECURITY_MANDATORY_LOW_RID、SECURITY_MANDATORY_MEDIUM_RID、SECURITY_MANDATORY_SYSTEM_RID、SECURITY_MANDATORY_PROTECTED_PROCESS_RID。詳細は Well-Known SIDs を参照。
%inst
指定された境界記述子に新しい必須のセキュリティ識別子 (SID) を追加する。

[戻り値]
関数が成功した場合、戻り値はゼロ以外。関数が失敗した場合、戻り値はゼロ。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]

プロセスは、現在の整合性レベル以下の整合性レベルでのみプライベート名前空間を作成できる。したがって、高整合性レベルのプロセスは高・中・低整合性レベルの名前空間を作成できる。中整合性レベルのプロセスは中または低整合性レベルの名前空間のみ作成できる。通常、プロセスは低整合性レベルのプロセスによるスクワット攻撃から保護するため、自身と同じ整合性レベルの名前空間を指定する。名前空間を開けるかどうかは作成者が付与したセキュリティ記述子によって決まる。このため、名前空間のセキュリティ記述子が許可する場合、低または中整合性レベルのプロセスに高整合性レベルの名前空間を開く権限を付与することもできる。この関数を使用するアプリケーションをコンパイルするには、_WIN32_WINNT
を 0x0601 以降として定義する。


%index
AddRefActCtx
AddRefActCtx 関数は、指定されたアクティベーションコンテキストの参照カウントをインクリメントする。
%group
Win32 kernel32
%prm
hActCtx
hActCtx : [intptr] 参照カウントをインクリメントするアクティベーションコンテキストの情報を含む ACTCTX 構造体へのハンドル。
%inst
AddRefActCtx 関数は、指定されたアクティベーションコンテキストの参照カウントをインクリメントする。

[備考]
この関数は、複数のクライアントから単一のアクティベーションコンテキストにアクセスできるようにするために提供されている。


%index
AddResourceAttributeAce
システムアクセス制御リスト (SACL) の末尾に SYSTEM_RESOURCE_ATTRIBUTE_ACE アクセス制御エントリ (ACE) を追加する。
%group
Win32 kernel32
%prm
pAcl, dwAceRevision, AceFlags, AccessMask, pSid, pAttributeInfo, pReturnLength
pAcl : [var] アクセス制御リスト (ACL) へのポインタ。この関数は ACL に ACE を追加する。このパラメータの値は NULL にできない。ACE は SYSTEM_RESOURCE_ATTRIBUTE_ACE 構造体の形式をとる。
dwAceRevision : [int] 変更対象の ACL のリビジョンレベルを指定する。この値は ACL_REVISION または ACL_REVISION_DS が指定できる。ACL にオブジェクト固有の ACE が含まれる場合は ACL_REVISION_DS を使用する。
AceFlags : [int] ACE の継承を制御するビットフラグのセット。この関数は新しい ACE の ACE_HEADER 構造体の AceFlags メンバーにこれらのフラグを設定する。Windows 8 の高度なファイル権限 UI との整合性のため、アプリケーションは AceFlags パラメータに CONTAINER_INHERIT_ACE と OBJECT_INHERIT_ACE を指定する必要がある。
AccessMask : [int] Windows 8 および Windows Server 2012 ではゼロでなければならない。
pSid : [int] Windows 8 および Windows Server 2012 では Everyone SID (S-1-1-0) でなければならない。
pAttributeInfo : [var] ACE の SID の後に付加される属性情報を指定する。
pReturnLength : [var] 実際に使用された ACL バッファのサイズ（バイト単位）。pAcl パラメータで指定したバッファが十分でない場合、このパラメータの値は必要な ACL バッファの合計サイズを示す。
%inst
システムアクセス制御リスト (SACL) の末尾に SYSTEM_RESOURCE_ATTRIBUTE_ACE アクセス制御エントリ
(ACE) を追加する。

[戻り値]
関数が成功した場合、TRUE を返す。関数が失敗した場合、FALSE を返す。拡張エラー情報を取得するには GetLastError
を呼ぶ。


%index
AddSIDToBoundaryDescriptor
指定された境界記述子にセキュリティ識別子 (SID) を追加する。
%group
Win32 kernel32
%prm
BoundaryDescriptor, RequiredSid
BoundaryDescriptor : [intptr] 境界記述子へのハンドル。このハンドルは CreateBoundaryDescriptor 関数が返す。
RequiredSid : [int] SID 構造体へのポインタ。
%inst
指定された境界記述子にセキュリティ識別子 (SID) を追加する。

[戻り値]
関数が成功した場合、戻り値はゼロ以外。関数が失敗した場合、戻り値はゼロ。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
AddSIDToBoundaryDescriptor 関数は、境界記述子に追加する SID ごとに 1
度ずつ呼び出す必要がある。この関数を使用するアプリケーションをコンパイルするには、_WIN32_WINNT を 0x0600
以降として定義する。


%index
AddScopedPolicyIDAce
システムアクセス制御リスト (SACL) の末尾に SYSTEM_SCOPED_POLICY_ID_ACE アクセス制御エントリ (ACE) を追加する。
%group
Win32 kernel32
%prm
pAcl, dwAceRevision, AceFlags, AccessMask, pSid
pAcl : [var] アクセス制御リスト (ACL) へのポインタ。この関数は ACL に ACE を追加する。このパラメータの値は NULL にできない。
dwAceRevision : [int] 変更対象の ACL のリビジョンレベル。この値は ACL_REVISION または ACL_REVISION_DS が指定できる。ACL にオブジェクト固有の ACE が含まれる場合は ACL_REVISION_DS を使用する。
AceFlags : [int] ACE の継承を制御するビットフラグのセット。この関数は新しい ACE の ACE_HEADER 構造体の AceFlags メンバーにこれらのフラグを設定する。Windows 8 の高度なファイル権限 UI との整合性のため、アプリケーションは AceFlags パラメータに CONTAINER_INHERIT_ACE と OBJECT_INHERIT_ACE を指定する必要がある。
AccessMask : [int] Windows 8 および Windows Server 2012 ではゼロでなければならない。
pSid : [int] リソースに関連付ける中央アクセスポリシーを識別する SID (S-1-17-*) へのポインタ。
%inst
システムアクセス制御リスト (SACL) の末尾に SYSTEM_SCOPED_POLICY_ID_ACE アクセス制御エントリ
(ACE) を追加する。

[戻り値]
関数が成功した場合、TRUE を返す。関数が失敗した場合、FALSE を返す。拡張エラー情報を取得するには GetLastError
を呼ぶ。


%index
AddSecureMemoryCacheCallback
セキュアなメモリ範囲が解放されたり、保護属性が変更されたりしたときに呼ばれるコールバック関数を登録する。
%group
Win32 kernel32
%prm
pfnCallBack
pfnCallBack : [int] 登録するアプリケーション定義の SecureMemoryCacheCallback 関数へのポインタ。
%inst
セキュアなメモリ範囲が解放されたり、保護属性が変更されたりしたときに呼ばれるコールバック関数を登録する。

[戻り値]
関数が成功した場合、コールバック関数を登録し TRUE を返す。関数が失敗した場合、FALSE を返す。拡張エラー情報を取得するには
GetLastError 関数を呼ぶ。

[備考]
高性能デバイスに対して直接 I/O を行うアプリケーションは、通常、I/O
用バッファに対する仮想アドレスから物理メモリへのマッピングをキャッシュする。デバイスドライバは通常、MmSecureVirtualMemory
ルーチンを呼んでこのメモリアドレス範囲をセキュアにし、ドライバがセキュア解除するまでメモリ範囲が解放されたり保護属性が変更されたりするのを防ぐ。アプリケーションは
AddSecureMemoryCacheCallback
を使って、メモリが解放されたり保護属性が変更されたりしたときに呼ばれるコールバック関数を登録し、キャッシュしたメモリマッピングを無効化できる。詳細は
SecureMemoryCacheCallback
を参照。この関数を使用するアプリケーションをコンパイルするには、_WIN32_WINNT を 0x0600 以降として定義する。詳細は
Using the Windows Headers を参照。


%index
AdjustCalendarDate
非推奨。指定された年、月、週、または日数だけ日付を調整する。
%group
Win32 kernel32
%prm
lpCalDateTime, calUnit, amount
lpCalDateTime : [var] 調整対象の日付とカレンダー情報を含む [**CALDATETIME**](caldatetime.md) 構造体へのポインタ。
calUnit : [int] 日付の単位を示す [**CALDATETIME\_DATEUNIT**](caldatetime-dateunit.md) 列挙値。例: DayUnit。
amount : [int] 指定された日付を調整する量。
%inst
非推奨。指定された年、月、週、または日数だけ日付を調整する。

[戻り値]
成功した場合 **TRUE** を、それ以外の場合 **FALSE** を返す。拡張エラー情報を取得するには、アプリケーションは
[**GetLastError**](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror)
を呼ぶことができ、以下のいずれかのエラーコードが返る可能性がある: -
ERROR\_DATE\_OUT\_OF\_RANGE。指定された日付が範囲外。-
ERROR\_INVALID\_PARAMETER。パラメータ値のいずれかが無効。

[備考]
この関数には関連付けられたヘッダーファイルやライブラリファイルがない。アプリケーションは
[**LoadLibrary**](/windows/win32/api/libloaderapi/nf-libloaderapi-loadlibrarya)
を DLL 名 (Kernel32.dll) で呼んでモジュールハンドルを取得し、その後
[**GetProcAddress**](/windows/win32/api/libloaderapi/nf-libloaderapi-getprocaddress)
にモジュールハンドルとこの関数名を渡して関数アドレスを取得する。


%index
AllocConsole
呼び出し側プロセスに新しいコンソールを割り当てる AllocConsole 関数に関するリファレンス情報を参照のこと。
%group
Win32 kernel32
%prm

%inst
呼び出し側プロセスに新しいコンソールを割り当てる AllocConsole 関数に関するリファレンス情報を参照のこと。

[戻り値]
この関数にはパラメータがない。
関数が成功した場合、戻り値はゼロ以外。関数が失敗した場合、戻り値はゼロ。拡張エラー情報を取得するには
[**GetLastError**](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror)
を呼ぶ。

[備考]
プロセスは 1
つのコンソールにのみ関連付けることができるため、呼び出し側プロセスがすでにコンソールを持っている場合、**AllocConsole**
関数は失敗する。プロセスは [**FreeConsole**](freeconsole.md)
関数を使って現在のコンソールから切り離し、その後 **AllocConsole**
を呼んで新しいコンソールを作成するか、[**AttachConsole**](attachconsole.md)
を呼んで別のコンソールにアタッチできる。呼び出し側プロセスが子プロセスを作成すると、子プロセスは新しいコンソールを継承する。**AllocConsole**
は新しいコンソール用に標準入力、標準出力、標準エラーのハンドルを初期化する。標準入力ハンドルはコンソールの入力バッファへのハンドル、標準出力と標準エラーのハンドルはコンソールのスクリーンバッファへのハンドルとなる。これらのハンドルを取得するには
[**GetStdHandle**](getstdhandle.md) 関数を使う。この関数は主に、コンソールウィンドウを作成する GUI
アプリケーションで利用される。GUI
アプリケーションはコンソールなしで初期化される。コンソールアプリケーションは、[**CreateProcess**](/windows/win32/api/processthreadsapi/nf-processthreadsapi-createprocessa)
を **DETACHED\_PROCESS**
フラグ付きで呼んで切り離しプロセスとして作成された場合を除き、コンソール付きで初期化される。


%index
AllocateUserPhysicalPages
指定されたプロセスの Address Windowing Extensions (AWE) 領域内でマップ／アンマップするための物理メモリページを割り当てる。
%group
Win32 kernel32
%prm
hProcess, NumberOfPages, PageArray
hProcess : [intptr] プロセスへのハンドル。関数は、後でこのプロセスの仮想アドレス空間にマップできるメモリを割り当てる。ハンドルは PROCESS_VM_OPERATION アクセス権を持っている必要がある。詳細は Process Security and Access Rights を参照。
NumberOfPages : [var] 割り当てる物理メモリのサイズ（ページ単位）。コンピュータのページサイズを決定するには GetSystemInfo 関数を使う。出力時、このパラメータは実際に割り当てられたページ数を受け取り、要求数より少ない場合がある。
PageArray : [var] 割り当てられたメモリのページフレーム番号を格納する配列へのポインタ。割り当てる配列のサイズは、少なくとも NumberOfPages × ULONG_PTR 型のサイズが必要。
%inst
指定されたプロセスの Address Windowing Extensions (AWE)
領域内でマップ／アンマップするための物理メモリページを割り当てる。

[戻り値]
関数が成功した場合、戻り値は TRUE。要求より少ないページが割り当てられることもある。呼び出し側は戻り値とは別に
NumberOfPages
パラメータの値を確認して、実際に何ページ割り当てられたかを確認する必要がある。割り当てられたすべてのページフレーム番号は
UserPfnArray パラメータが指すメモリに順番に格納される。
関数が失敗した場合、戻り値は FALSE で、フレームは何も割り当てられない。拡張エラー情報を取得するには GetLastError
を呼ぶ。

[備考]
AllocateUserPhysicalPages
関数は、後でプロセスの仮想アドレス空間にマップできる物理メモリを割り当てるために使われる。呼び出し側のトークンで
SeLockMemoryPrivilege 特権が有効になっている必要があり、そうでない場合は関数が
ERROR_PRIVILEGE_NOT_HELD で失敗する。詳細は Privilege Constants
を参照。この関数で割り当てられたメモリは物理的にシステムに存在する必要がある。メモリが割り当てられると、ロックされて仮想メモリ管理システムの他の部分では利用できなくなる。物理ページは同時に複数の仮想アドレスへマップすることはできない。物理ページは任意の物理アドレスに配置される。物理ページの連続性については仮定してはならない。この関数を使用するアプリケーションをコンパイルするには、_WIN32_WINNT
マクロを 0x0500 以降として定義する。詳細は Using the Windows Headers を参照。


%index
AllocateUserPhysicalPagesNuma
指定されたプロセスの Address Windowing Extensions (AWE) 領域内でマップ／アンマップするための物理メモリページを割り当て、物理メモリを配置する NUMA ノードを指定する。
%group
Win32 kernel32
%prm
hProcess, NumberOfPages, PageArray, nndPreferred
hProcess : [intptr] プロセスへのハンドル。関数は、後でこのプロセスの仮想アドレス空間にマップできるメモリを割り当てる。ハンドルは PROCESS_VM_OPERATION アクセス権を持っている必要がある。詳細は Process Security and Access Rights を参照。
NumberOfPages : [var] 割り当てる物理メモリのサイズ（ページ単位）。コンピュータのページサイズを決定するには GetSystemInfo 関数を使う。出力時、このパラメータは実際に割り当てられたページ数を受け取り、要求数より少ない場合がある。
PageArray : [var] 割り当てられたメモリのページフレーム番号を格納する配列へのポインタ。割り当てる配列のサイズは、少なくとも NumberOfPages × ULONG_PTR 型のサイズが必要。注意: このバッファを変更しないこと。OS のデータが含まれており、破損すると致命的となる。バッファ内の情報はアプリケーションにとって有用ではない。
nndPreferred : [int] 物理メモリを配置する NUMA ノード。
%inst
指定されたプロセスの Address Windowing Extensions (AWE)
領域内でマップ／アンマップするための物理メモリページを割り当て、物理メモリを配置する NUMA ノードを指定する。

[戻り値]
関数が成功した場合、戻り値は TRUE。要求より少ないページが割り当てられることもある。呼び出し側は NumberOfPages
パラメータの値を確認して、実際に何ページ割り当てられたかを確認する必要がある。割り当てられたすべてのページフレーム番号は
PageArray パラメータが指すメモリに順番に格納される。関数が失敗した場合、戻り値は FALSE
で、フレームは何も割り当てられない。拡張エラー情報を取得するには GetLastError 関数を呼ぶ。

[備考]
AllocateUserPhysicalPagesNuma 関数は、後でプロセスの仮想アドレス空間にマップできる物理メモリを NUMA
ノード内に割り当てるために使われる。呼び出し側のトークンで SeLockMemoryPrivilege
特権が有効になっている必要があり、そうでない場合は関数が ERROR_PRIVILEGE_NOT_HELD で失敗する。詳細は
Privilege Constants
を参照。この関数で割り当てられたメモリは物理的にシステムに存在する必要がある。メモリが割り当てられると、ロックされて仮想メモリ管理システムの他の部分では利用できなくなる。物理ページは同時に複数の仮想アドレスへマップすることはできない。物理ページは任意の物理アドレスに配置される。物理ページの連続性については仮定してはならない。この関数を使用するアプリケーションをコンパイルするには、_WIN32_WINNT
を 0x0600 以降として定義する。


%index
ApplicationRecoveryFinished
呼び出し側アプリケーションがデータのリカバリを完了したことを通知する。
%group
Win32 kernel32
%prm
bSuccess
bSuccess : [int] データのリカバリに成功した場合は TRUE、そうでない場合は FALSE を指定する。
%inst
呼び出し側アプリケーションがデータのリカバリを完了したことを通知する。

[備考]
この関数が呼ばれるとすぐにアプリケーションが終了するため、この呼び出しはコールバック中の最後の呼び出しにすべきである。


%index
ApplicationRecoveryInProgress
呼び出し側アプリケーションがデータのリカバリを続行中であることを通知する。
%group
Win32 kernel32
%prm
pbCancelled
pbCancelled : [var] ユーザーがリカバリ処理をキャンセルしたかどうかを示す。ユーザーがキャンセルボタンをクリックした場合 WER によって設定される。
%inst
呼び出し側アプリケーションがデータのリカバリを続行中であることを通知する。

[戻り値]
関数は成功時には S_OK を、失敗時には以下のいずれかのエラーコードを返す。
（以下省略）

[備考]
アプリケーションは、RegisterApplicationRecoveryCallback
関数を呼ぶ際に指定した間隔内にこの関数を呼ばなければならない。指定間隔内に呼ばなければ、WER
がアプリケーションを終了させる。この関数を呼び続けている限り、リカバリ処理を継続できる。ユーザーがリカバリ処理をキャンセルした場合、アプリケーションは終了するべきである。リカバリ処理が完了したことを示すには、ApplicationRecoveryFinished
関数を呼ぶ。


%index
AreFileApisANSI
ファイル I/O 関数群が ANSI と OEM のいずれの文字セットコードページを使用しているかを判定する。
%group
Win32 kernel32
%prm

%inst
ファイル I/O 関数群が ANSI と OEM のいずれの文字セットコードページを使用しているかを判定する。

[戻り値]
ファイル I/O 関数群が ANSI コードページを使っている場合、戻り値はゼロ以外。OEM コードページを使っている場合、戻り値はゼロ。

[備考]
SetFileApisToOEM 関数は一部のファイル I/O 関数が OEM
コードページを使うようにする。SetFileApisToANSI 関数は同じファイル I/O 関数群が ANSI
コードページを使うようにする。現在ファイル I/O 関数群がどのコードページを使っているかを判定するには AreFileApisANSI
を使う。これらの関数の使い方に関する議論については、SetFileApisToOEM と SetFileApisToANSI
の備考セクションを参照。AreFileApisANSI がコードページを判定するファイル I/O 関数は、KERNEL32.DLL
からエクスポートされ、ファイル名を受け取るか返すものである。SetFileApisToOEM と SetFileApisToANSI
はプロセスごとにコードページを設定するので、AreFileApisANSI はプロセス全体のコードページを示す値を返す。Windows 8
および Windows Server 2012 では、この関数は以下の技術でサポートされている。
（以下省略）


%index
AssignProcessToJobObject
既存のジョブオブジェクトにプロセスを割り当てる。
%group
Win32 kernel32
%prm
hJob, hProcess
hJob : [intptr] プロセスを関連付けるジョブオブジェクトへのハンドル。CreateJobObject または OpenJobObject 関数がこのハンドルを返す。ハンドルは JOB_OBJECT_ASSIGN_PROCESS アクセス権を持っている必要がある。詳細は Job Object Security and Access Rights を参照。
hProcess : [intptr] ジョブオブジェクトに関連付けるプロセスへのハンドル。ハンドルは PROCESS_SET_QUOTA および PROCESS_TERMINATE アクセス権を持っている必要がある。詳細は Process Security and Access Rights を参照。プロセスがすでにジョブに関連付けられている場合、hJob で指定されたジョブは空であるか、プロセスが既に属しているネスト済みジョブ階層に含まれている必要があり、UI 制限 (SetInformationJobObject と JobObjectBasicUIRestrictions) が設定されていてはならない。詳細は備考を参照。Windows 7、Windows Server 2008 R2、Windows XP SP3、Windows Server 2008、Windows Vista、Windows Server 2003: プロセスは既にジョブに割り当てられていてはならず、もし割り当てられていれば関数は ERROR_ACCESS_DENIED で失敗する。この動作は Windows 8 および Windows Server 2012 から変更された。ターミナルサービス: ジョブ内のすべてのプロセスは、ジョブと同じセッション内で実行されなければならない。
%inst
既存のジョブオブジェクトにプロセスを割り当てる。

[戻り値]
関数が成功した場合、戻り値はゼロ以外。関数が失敗した場合、戻り値はゼロ。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
AssignProcessToJobObject
を使ってプロセスをジョブオブジェクトに関連付けた後、プロセスはジョブに設定された制限の対象となる。ジョブの制限を設定するには
SetInformationJobObject
関数を使う。ジョブにユーザーモード時間制限があり、その時間制限が使い切られていた場合、AssignProcessToJobObject
は失敗し、指定されたプロセスは終了する。プロセスの関連付けにより時間制限を超過する場合でも
AssignProcessToJobObject
は成功するが、時間制限違反が報告される。ジョブにアクティブプロセス制限があり、このプロセスを関連付けることで制限を超える場合、AssignProcessToJobObject
は失敗し、指定されたプロセスは終了する。メモリ制限があるジョブに関連付けられたプロセスが行うメモリ操作は、そのメモリ制限の対象となる。プロセスがジョブに関連付けられる前に行ったメモリ操作は
AssignProcessToJobObject
によって検査されない。プロセスがすでに実行中で、ジョブにセキュリティ制限がある場合、AssignProcessToJobObject
は失敗する可能性がある。例えば、プロセスのプライマリトークンにローカル管理者グループが含まれているが、ジョブオブジェクトに
JOB_OBJECT_SECURITY_NO_ADMIN というセキュリティ制限がある場合、関数は失敗する。ジョブに
JOB_OBJECT_SECURITY_ONLY_TOKEN
というセキュリティ制限がある場合、プロセスはサスペンド状態で作成する必要がある。サスペンド状態でプロセスを作成するには、CreateProcess
関数を CREATE_SUSPENDED
フラグ付きで呼ぶ。プロセスはネストしたジョブ階層内で複数のジョブに関連付けることができる。優先度クラス、アフィニティ、コミットチャージ、プロセス単位の実行時間制限、スケジューリングクラス制限、ワーキングセットの最小値と最大値については、プロセスは親ジョブチェーン内のすべてのジョブのうち最も厳しい制限を実効制限として継承する。その他のリソース制限については、プロセスは階層内の直接のジョブから制限を継承する。アカウンティング情報は直接のジョブに追加され、親ジョブチェーン内の各親ジョブに集計される。既定では、すべての子プロセスは直接のジョブと親ジョブチェーン内のすべてのジョブに関連付けられる。同じジョブチェーンに属さない子プロセスを作成するには、CreateProcess
関数を CREATE_BREAKAWAY_FROM_JOB
フラグ付きで呼ぶ。子プロセスはジョブチェーン内のすべてのジョブから切り離されるが、ジョブがブレイクアウェイを許可していない場合は、そのジョブおよびそれより上位のジョブから切り離されない。詳細は
Nested Jobs を参照。Windows 7、Windows Server 2008 R2、Windows XP
SP3、Windows Server 2008、Windows Vista、Windows Server 2003: プロセスは 1
つのジョブにしか関連付けられない。プロセスは関連付けられたジョブから制限を継承し、アカウンティング情報をジョブに追加する。プロセスがジョブに関連付けられている場合、そのプロセスが作成するすべての子プロセスは既定でそのジョブに関連付けられる。同じジョブに属さない子プロセスを作成するには、CreateProcess
を CREATE_BREAKAWAY_FROM_JOB フラグ付きで呼ぶ。Windows 8 および Windows Server
2012 以降、プロセスは複数のジョブに関連付けられる。Windows 7、Windows Server 2008 R2、Windows
Server 2008、Windows Vista: プロセスが Program Compatibility Assistant
(PCA) によって監視されている場合、互換性ジョブに入れられる。したがって、プロセスを別のジョブに入れる前に
CREATE_BREAKAWAY_FROM_JOB を使って作成する必要がある。あるいは、ユーザーアカウント制御 (UAC)
レベルを指定するアプリケーションマニフェストを埋め込むことで、PCA がプロセスを互換性ジョブに追加しないようにできる。詳細は
Application Development Requirements for User Account Control
Compatibility を参照。AssignProcessToJob
が呼ばれた時点でジョブまたはジョブチェーン内の親ジョブのいずれかが終了中の場合、関数は失敗する。この関数を使用するアプリケーションをコンパイルするには、_WIN32_WINNT
を 0x0500 以降として定義する。詳細は Using the Windows Headers を参照。


%index
AttachConsole
呼び出し側プロセスを指定されたプロセスのコンソールにアタッチする AttachConsole 関数に関するリファレンス情報を参照のこと。
%group
Win32 kernel32
%prm
dwProcessId
dwProcessId : [int] 使用するコンソールを所有するプロセスの識別子。このパラメータには以下のいずれかの値が指定できる。 | 値 | 意味 | |-|-| | *pid* | 指定プロセスのコンソールを使う。 | | **ATTACH\_PARENT\_PROCESS** `(DWORD)-1` | 現在のプロセスの親のコンソールを使う。 |
%inst
呼び出し側プロセスを指定されたプロセスのコンソールにアタッチする AttachConsole 関数に関するリファレンス情報を参照のこと。

[戻り値]
関数が成功した場合、戻り値はゼロ以外。関数が失敗した場合、戻り値はゼロ。拡張エラー情報を取得するには
[**GetLastError**](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror)
を呼ぶ。

[備考]
プロセスは最大 1
つのコンソールにしかアタッチできない。呼び出し側プロセスが既にコンソールにアタッチされている場合、返されるエラーコードは
**ERROR\_ACCESS\_DENIED** である。指定プロセスがコンソールを持たない場合は
**ERROR\_INVALID\_HANDLE** が返る。指定プロセスが存在しない場合は
**ERROR\_INVALID\_PARAMETER** が返る。プロセスは
[**FreeConsole**](freeconsole.md)
を使って自身をコンソールから切り離せる。他のプロセスがコンソールを共有している場合、コンソールは破棄されないが、**FreeConsole**
を呼んだプロセスはそれを参照できなくなる。コンソールは、アタッチされている最後のプロセスが終了したり **FreeConsole**
を呼んだときに閉じられる。プロセスが **FreeConsole**
を呼んだ後、[**AllocConsole**](allocconsole.md)
で新しいコンソールを作成したり、**AttachConsole** で別のコンソールにアタッチしたりできる。この関数は、主に
[**/SUBSYSTEM:WINDOWS**](/cpp/build/reference/subsystem-specify-subsystem)
でリンクされたアプリケーションにとって有用である。これは OS
に対してプログラムのメインメソッドに入る前にコンソールが不要であることを示唆する。その場合、[**GetStdHandle**](getstdhandle.md)
で取得される標準ハンドルは **AttachConsole**
が呼ばれるまでは起動時には無効である可能性が高い。例外として、親プロセスがハンドル継承でアプリケーションを起動した場合を除く。この関数を使用するアプリケーションをコンパイルするには、**\_WIN32\_WINNT**
を `0x0501` 以降として定義する。詳細は [Using the Windows
Headers](/windows/win32/winprog/using-the-windows-headers) を参照。


%index
BackupRead
セキュリティ情報を含むファイルまたはディレクトリをバックアップする。
%group
Win32 kernel32
%prm
hFile, lpBuffer, nNumberOfBytesToRead, lpNumberOfBytesRead, bAbort, bProcessSecurity, lpContext
hFile : [intptr] バックアップ対象のファイルまたはディレクトリへのハンドル。ハンドルを取得するには CreateFile 関数を呼ぶ。ファイルハンドルが ACCESS_SYSTEM_SECURITY アクセス権付きで作成されていない限り、SACL は読み込まれない。詳細は [File security and access rights](/windows/win32/fileio/file-security-and-access-rights) を参照。ハンドルは同期（非オーバーラップ）でなければならない。つまり、CreateFile 呼び出し時に FILE_FLAG_OVERLAPPED フラグを設定してはならない。この関数は受け取ったハンドルが同期か検証しないため、同期ハンドルに対してはエラーコードを返さないが、非同期（オーバーラップ）ハンドルで呼ぶとデバッグが非常に難しい微妙なエラーを引き起こす可能性がある。CreateFile が FILE_FLAG_NO_BUFFERING フラグ付きで呼ばれた場合、BackupRead 関数が失敗することがある。この場合、GetLastError 関数は ERROR_INVALID_PARAMETER を返す。
lpBuffer : [var] データを受け取るバッファへのポインタ。
nNumberOfBytesToRead : [int] バッファの長さ（バイト単位）。バッファサイズは WIN32_STREAM_ID 構造体のサイズより大きくなければならない。
lpNumberOfBytesRead : [var] 読み込まれたバイト数を受け取る変数へのポインタ。関数がゼロ以外を返し、lpNumberOfBytesRead が指す変数がゼロの場合、そのファイルハンドルに関連付けられたすべてのデータが読み込まれたことを示す。
bAbort : [int] ハンドルに対する BackupRead の使用を終えたかどうかを示す。ファイルをバックアップしている間はこのパラメータを FALSE で指定する。BackupRead の使用を終えた後、もう一度 BackupRead をこのパラメータを TRUE にして適切な lpContext を渡して呼び出す必要がある。bAbort が TRUE のときは lpContext を渡さねばならず、それ以外のパラメータは無視される。
bProcessSecurity : [int] 関数がファイルまたはディレクトリのアクセス制御リスト (ACL) データをリストアするかどうかを示す。bProcessSecurity が TRUE の場合、ACL データがバックアップされる。
lpContext : [var] バックアップ処理中に BackupRead がコンテキスト情報を保持するために使う内部データ構造へのポインタを受け取る変数へのポインタ。指定ファイルまたはディレクトリに対する BackupRead の初回呼び出し前に lpContext が指す変数を NULL に設定しなければならない。関数がデータ構造用のメモリを割り当て、変数をその構造体へのポインタに設定する。BackupRead の呼び出し間で lpContext または lpContext が指す変数を変更してはならない。データ構造が使用するメモリを解放するには、バックアップ処理完了後に bAbort を TRUE にして BackupRead を呼ぶ。
%inst
セキュリティ情報を含むファイルまたはディレクトリをバックアップする。

[戻り値]
関数が成功した場合、戻り値はゼロ以外。関数が失敗した場合、戻り値はゼロで、I/O エラーが発生したことを示す。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
この関数は Encrypted File System で暗号化されたファイルのバックアップには使用しない。その用途には
ReadEncryptedFileRaw を使う。BackupRead がデータを読んでいる間にエラーが発生した場合、呼び出し側プロセスは
BackupSeek 関数を呼んで不良データをスキップできる。ファイルまたはディレクトリは BackupWrite
関数を使ってリストアする。


%index
BackupSeek
BackupRead または BackupWrite 関数で最初にアクセスされたデータストリーム内で前方にシークする。
%group
Win32 kernel32
%prm
hFile, dwLowBytesToSeek, dwHighBytesToSeek, lpdwLowByteSeeked, lpdwHighByteSeeked, lpContext
hFile : [intptr] ファイルまたはディレクトリへのハンドル。このハンドルは CreateFile 関数で作成する。ハンドルは同期（非オーバーラップ）でなければならない。つまり、CreateFile 呼び出し時に FILE_FLAG_OVERLAPPED フラグを設定してはならない。この関数は受け取ったハンドルが同期か検証しないため、同期ハンドルに対してはエラーコードを返さないが、非同期（オーバーラップ）ハンドルで呼ぶとデバッグが非常に難しい微妙なエラーを引き起こす可能性がある。
dwLowBytesToSeek : [int] シークするバイト数の下位部分。
dwHighBytesToSeek : [int] シークするバイト数の上位部分。
lpdwLowByteSeeked : [var] 関数が実際にシークしたバイト数の下位ビットを受け取る変数へのポインタ。
lpdwHighByteSeeked : [var] 関数が実際にシークしたバイト数の上位ビットを受け取る変数へのポインタ。
lpContext : [var] 関数が使う内部データ構造へのポインタ。この構造体は BackupRead または BackupWrite 関数によって初期化されたものと同一でなければならない。アプリケーションはこの構造体の内容に触れてはならない。
%inst
BackupRead または BackupWrite 関数で最初にアクセスされたデータストリーム内で前方にシークする。

[戻り値]
要求された量だけシークできた場合、関数はゼロ以外を返す。要求された量だけシークできなかった場合はゼロを返す。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
アプリケーションは BackupSeek
関数を使って、エラーを引き起こすデータストリームの一部をスキップする。この関数はストリームヘッダをまたいでシークできない。例えば、ストリーム名をスキップするためには使えない。サブストリームの終端を超えてシークしようとすると関数は失敗し、lpdwLowByteSeeked
と lpdwHighByteSeeked
パラメータに実際にシークしたバイト数が示され、ファイル位置は次のストリームヘッダの先頭に配置される。


%index
BackupWrite
BackupRead でバックアップされたファイルまたはディレクトリをリストアする。
%group
Win32 kernel32
%prm
hFile, lpBuffer, nNumberOfBytesToWrite, lpNumberOfBytesWritten, bAbort, bProcessSecurity, lpContext
hFile : [intptr] リストア対象のファイルまたはディレクトリへのハンドル。ハンドルを取得するには CreateFile 関数を呼ぶ。ファイルハンドルが ACCESS_SYSTEM_SECURITY アクセス権付きで作成されていない限り、SACL はリストアされない。整合性 ACE が正しくリストアされるようにするには、ファイルハンドルは WRITE_OWNER アクセス権付きでも作成されている必要がある。詳細は [File security and access rights](/windows/win32/fileio/file-security-and-access-rights) を参照。ハンドルは同期（非オーバーラップ）でなければならない。つまり、CreateFile 呼び出し時に FILE_FLAG_OVERLAPPED フラグを設定してはならない。この関数は受け取ったハンドルが同期か検証しないため、同期ハンドルに対してはエラーコードを返さないが、非同期（オーバーラップ）ハンドルで呼ぶとデバッグが非常に難しい微妙なエラーを引き起こす可能性がある。CreateFile が FILE_FLAG_NO_BUFFERING フラグ付きで呼ばれた場合、BackupWrite 関数は失敗することがある。この場合、GetLastError は ERROR_INVALID_PARAMETER を返す。
lpBuffer : [var] 関数がデータを書き込む元のバッファへのポインタ。
nNumberOfBytesToWrite : [int] バッファのサイズ（バイト単位）。バッファサイズは WIN32_STREAM_ID 構造体のサイズより大きくなければならない。
lpNumberOfBytesWritten : [var] 書き込まれたバイト数を受け取る変数へのポインタ。
bAbort : [int] ハンドルに対する BackupWrite の使用を終えたかどうかを示す。ファイルをリストアしている間はこのパラメータを FALSE で指定する。BackupWrite の使用を終えた後、もう一度 BackupWrite をこのパラメータを TRUE にして適切な lpContext を渡して呼び出す必要がある。bAbort が TRUE のときは lpContext を渡さねばならず、それ以外のパラメータは無視される。
bProcessSecurity : [int] 関数がファイルまたはディレクトリのアクセス制御リスト (ACL) データをリストアするかどうかを指定する。bProcessSecurity が TRUE の場合、ファイルまたはディレクトリのハンドルを開くときに WRITE_OWNER と WRITE_DAC アクセスを指定する必要がある。ハンドルがこれらのアクセス権を持たない場合、OS は ACL データへのアクセスを拒否し、ACL データのリストアは行われない。
lpContext : [var] リストア処理中に BackupWrite がコンテキスト情報を保持するために使う内部データ構造へのポインタを受け取る変数へのポインタ。指定ファイルまたはディレクトリに対する BackupWrite の初回呼び出し前に lpContext が指す変数を NULL に設定しなければならない。関数がデータ構造用のメモリを割り当て、変数をその構造体へのポインタに設定する。BackupWrite の呼び出し間で lpContext または lpContext が指す変数を変更してはならない。データ構造が使用するメモリを解放するには、リストア処理完了後に bAbort を TRUE にして BackupWrite を呼ぶ。
%inst
BackupRead でバックアップされたファイルまたはディレクトリをリストアする。

[戻り値]
関数が成功した場合、戻り値はゼロ以外。関数が失敗した場合、戻り値はゼロで、I/O エラーが発生したことを示す。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
この関数は Encrypted File System で暗号化されたファイルのリストアには使用しない。その用途には
WriteEncryptedFileRaw を使う。バックアップメディアから読まれたデータは、WIN32_STREAM_ID
構造体で区切られたサブストリームである必要がある。BACKUP_LINK
ストリームタイプを使うと、ハードリンク付きのファイルをリストアできる。


%index
Beep
スピーカーから単純なトーンを生成する。
%group
Win32 kernel32
%prm
dwFreq, dwDuration
dwFreq : [int] サウンドの周波数（ヘルツ単位）。このパラメータは 37 から 32,767（0x25 から 0x7FFF）の範囲でなければならない。
dwDuration : [int] サウンドの長さ（ミリ秒単位）。
%inst
スピーカーから単純なトーンを生成する。

[戻り値]
関数が成功した場合、戻り値はゼロ以外。関数が失敗した場合、戻り値はゼロ。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
かつてすべての PC では原始的なサウンド生成のために 8254 プログラマブルインターバルタイマチップが共通に使われていた。Beep
関数はそのハードウェア上でビープ音を発するために特別に書かれた。これらの旧世代システムではミュートや音量コントロールは Beep
に影響せず、それでも音が聞こえた。音を消すには次のコマンドを使った: net stop beep、sc config beep
start= disabled。その後、サウンドカードがほぼすべての PC
で標準装備となった。サウンドカードが一般化するにつれ、製造元はコンピュータから古いタイマチップを取り除き始めた。サーバーコンピュータの設計からもチップは除外された。結果として、チップを持たないすべてのコンピュータで
Beep は動作しなくなった。ほとんどの開発者は 8254 チップの代わりに既定のサウンドデバイスを使う MessageBeep
関数を呼ぶように移行していたので、これで問題はなかった。最終的には通信するハードウェアがないため、Windows Vista と
Windows XP 64 ビット版で Beep のサポートが打ち切られた。Windows 7 では、Beep
はセッションの既定のサウンドデバイスにビープを流すように書き直された。これは通常サウンドカードになるが、ターミナルサービスで実行されている場合はクライアントでビープが再生される。


%index
BeginUpdateResourceW
バイナリモジュール内のリソースを追加、削除、または置換するために UpdateResource 関数で使えるハンドルを取得する。(Unicode)
%group
Win32 kernel32
%prm
pFileName, bDeleteExistingResources
pFileName : [wstr] 型: LPCTSTR リソースを更新するバイナリファイル。アプリケーションはこのファイルに対する書き込みアクセスを取得できる必要がある。pFileName が参照するファイルは現在実行中であってはならない。pFileName が完全パスを指定しない場合、システムは現在のディレクトリでファイルを検索する。
bDeleteExistingResources : [int] 型: BOOL pFileName パラメータの既存リソースを削除するかどうかを示す。TRUE の場合、既存リソースは削除され、更新後のファイルには UpdateResource で追加されたリソースのみが含まれる。FALSE の場合、更新後のファイルには UpdateResource で明示的に削除または置換されない限り既存のリソースが含まれる。
%inst
バイナリモジュール内のリソースを追加、削除、または置換するために UpdateResource
関数で使えるハンドルを取得する。(Unicode)

[戻り値]
型: HANDLE 関数が成功した場合、戻り値は UpdateResource および EndUpdateResource
関数で使用できるハンドル。指定されたファイルが PE でない、ファイルが存在しない、またはファイルが書き込み用に開けない場合、戻り値は
NULL。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]

この関数を呼ぶ前にリソースファイルがロードされていないことが推奨される。ただし、すでにロードされていてもエラーは返されない。Resource
Configuration (RC Config) データを含むファイル（LN ファイルと関連する .mui
ファイル）におけるリソース更新にはいくつかの制限がある。これらのファイルでどの種類のリソースを更新できるかの詳細は
UpdateResource
関数の備考セクションを参照。この関数はコードとリソースを両方含むモジュール内のリソースを更新できる。上述のとおり、LN ファイルと
.mui ファイル（どちらも RC Config データを含む）でのリソース更新には制限があり、詳細は UpdateResource
関数のリファレンスを参照。


%index
BindIoCompletionCallback
スレッドプールが所有する I/O 完了ポートを指定されたファイルハンドルに関連付ける。このファイルに関する I/O 要求が完了すると、非 I/O ワーカースレッドが指定のコールバック関数を実行する。
%group
Win32 kernel32
%prm
FileHandle, Function, Flags
FileHandle : [intptr] オーバーラップ I/O 完了用に開かれたファイルへのハンドル。このハンドルは CreateFile 関数を FILE_FLAG_OVERLAPPED フラグ付きで呼んで返される。
Function : [int] I/O 操作が完了したときに非 I/O ワーカースレッドで実行されるコールバック関数へのポインタ。このコールバック関数は TerminateThread 関数を呼んではならない。完了ルーチンの詳細は FileIOCompletionRoutine を参照。
Flags : [int] このパラメータはゼロでなければならない。
%inst
スレッドプールが所有する I/O 完了ポートを指定されたファイルハンドルに関連付ける。このファイルに関する I/O 要求が完了すると、非
I/O ワーカースレッドが指定のコールバック関数を実行する。

[戻り値]
関数が成功した場合、戻り値はゼロ以外。関数が失敗した場合、戻り値はゼロ。拡張エラー情報を取得するには GetLastError
関数を呼ぶ。

[備考]
プロセスが FileHandle パラメータで指定されたファイルに対する非同期要求を発行したが、要求が ERROR_IO_PENDING
以外のエラーコードで直ちに戻った場合、コールバック関数は実行されないことがある。非同期 I/O
要求を開始したスレッドが要求完了前に終了しないよう注意する。また、DLL 内の関数がワーカースレッドにキューされる場合、DLL
がアンロードされる前にその関数の実行が完了していることを確認する。スレッドプールは I/O
完了ポートを保持している。BindIoCompletionCallback を呼ぶと、指定ファイルがスレッドプールの I/O
完了ポートに関連付けられる。そのファイルオブジェクトに対する非同期要求は完了ポートにポストされて完了し、スレッドプールのワーカースレッドに拾われる。非同期プロシージャ呼び出しとして完了する
I/O 要求を発行する必要があるコールバックのために、スレッドプールは I/O ワーカープールを提供する。I/O
ワーカースレッドは完了ポート上では待機せず、I/O
要求パケットの完了でウェイクアップできるようアラート可能な待機状態でスリープする。両方のタイプのワーカースレッドは保留中の I/O
があるかを確認し、あれば終了しない。詳細は Asynchronous Procedure Calls
を参照。この関数を使用するアプリケーションをコンパイルするには、_WIN32_WINNT を 0x0500 以降として定義する。詳細は
Using the Windows Headers を参照。


%index
BuildCommDCBA
デバイス制御文字列で指定された値で、指定された DCB 構造体を埋める。(ANSI)
%group
Win32 kernel32
%prm
lpDef, lpDCB
lpDef : [str] デバイス制御情報。関数はこの文字列を取得して解析し、lpDCB が指す DCB 構造体に適切な値を設定する。
lpDCB : [var] 情報を受け取る DCB 構造体へのポインタ。
%inst
デバイス制御文字列で指定された値で、指定された DCB 構造体を埋める。(ANSI)

[戻り値]
関数が成功した場合、戻り値はゼロ以外。関数が失敗した場合、戻り値はゼロ。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
BuildCommDCB 関数は、以下の例外を除き、lpDef パラメータで特に影響を受ける DCB 構造体のメンバーのみを調整する:
（以下省略）


%index
BuildCommDCBAndTimeoutsW
デバイス定義文字列を適切なデバイス制御ブロックコードに変換し、デバイス制御ブロックに配置する。(Unicode)
%group
Win32 kernel32
%prm
lpDef, lpDCB, lpCommTimeouts
lpDef : [wstr] デバイス制御情報。関数はこの文字列を取得して解析し、lpDCB が指す DCB 構造体に適切な値を設定する。文字列は mode コマンドのコマンドライン引数と同じ形式でなければならない: COMx[:][baud={11|110|15|150|30|300|60|600|12|1200|24|2400|48|4800|96|9600|19|19200}][parity={n|e|o|m|s}][data={5|6|7|8}][stop={1|1.5|2}][to={on|off}][xon={on|off}][odsr={on|off}][octs={on|off}][dtr={on|off|hs}][rts={on|off|hs|tg}][idsr={on|off}]。"baud" サブ文字列にはリストされたペアの値のいずれかを指定できる。2 桁の値は、それが表す値の先頭 2 桁である。例えば 11 は 110 ボー、19 は 19,200 ボーを表す。"parity" サブ文字列は、パリティビットを伝送エラー検出にどう使うかを示す。値はそれぞれ "none"、"even"、"odd"、"mark"、"space" を表す。詳細は TechNet の mode コマンドリファレンスを参照。例えば、次の文字列はボーレート 1200、パリティなし、データビット 8、ストップビット 1 を指定する: baud=1200 parity=N data=8 stop=1
lpDCB : [var] lpDef が指すデバイス制御情報文字列から情報を受け取る DCB 構造体へのポインタ。この DCB 構造体は通信デバイスの制御設定を定義する。
lpCommTimeouts : [var] タイムアウト情報を受け取る COMMTIMEOUTS 構造体へのポインタ。
%inst
デバイス定義文字列を適切なデバイス制御ブロックコードに変換し、デバイス制御ブロックに配置する。(Unicode)

[戻り値]
関数が成功した場合、戻り値はゼロ以外。関数が失敗した場合、戻り値はゼロ。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
BuildCommDCBAndTimeouts 関数は lpDef 内の "to={on|off}"
サブ文字列の有無に応じてタイムアウト設定の動作を変える:
（以下省略）


%index
BuildCommDCBW
デバイス制御文字列で指定された値で、指定された DCB 構造体を埋める。(Unicode)
%group
Win32 kernel32
%prm
lpDef, lpDCB
lpDef : [wstr] デバイス制御情報。関数はこの文字列を取得して解析し、lpDCB が指す DCB 構造体に適切な値を設定する。
lpDCB : [var] 情報を受け取る DCB 構造体へのポインタ。
%inst
デバイス制御文字列で指定された値で、指定された DCB 構造体を埋める。(Unicode)

[戻り値]
関数が成功した場合、戻り値はゼロ以外。関数が失敗した場合、戻り値はゼロ。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
BuildCommDCB 関数は、以下の例外を除き、lpDef パラメータで特に影響を受ける DCB 構造体のメンバーのみを調整する:
（以下省略）


%index
CallNamedPipeW
メッセージ型パイプに接続し（インスタンスが利用できない場合は待機する）、パイプへの書き込みと読み込みを行い、パイプを閉じる。(CallNamedPipeW)
%group
Win32 kernel32
%prm
lpNamedPipeName, lpInBuffer, nInBufferSize, lpOutBuffer, nOutBufferSize, lpBytesRead, nTimeOut
lpNamedPipeName : [wstr] パイプ名。
lpInBuffer : [intptr] パイプに書き込むデータ。
nInBufferSize : [int] 書き込みバッファのサイズ（バイト単位）。
lpOutBuffer : [intptr] パイプから読み込んだデータを受け取るバッファへのポインタ。
nOutBufferSize : [int] 読み込みバッファのサイズ（バイト単位）。
lpBytesRead : [var] パイプから読み込まれたバイト数を受け取る変数へのポインタ。
nTimeOut : [int] 名前付きパイプが利用可能になるまで待機するミリ秒数。数値に加え、以下の特殊値も指定できる。
%inst

メッセージ型パイプに接続し（インスタンスが利用できない場合は待機する）、パイプへの書き込みと読み込みを行い、パイプを閉じる。(CallNamedPipeW)

[戻り値]
関数が成功した場合、戻り値はゼロ以外。関数が失敗した場合、戻り値はゼロ。拡張エラー情報を取得するには GetLastError
を呼ぶ。サーバープロセスがパイプに書き込んだメッセージが nOutBufferSize より長い場合、CallNamedPipe は
FALSE を返し、GetLastError は ERROR_MORE_DATA を返す。CallNamedPipe
は戻る前にパイプへのハンドルを閉じるため、メッセージの残りは破棄される。

[備考]
CallNamedPipe を呼ぶことは、CreateFile（CreateFile が直ちにパイプを開けない場合は
WaitNamedPipe）、TransactNamedPipe、CloseHandle
の各関数を呼ぶのと同等である。CreateFile はアクセスフラグ GENERIC_READ |
GENERIC_WRITE、継承ハンドルフラグ FALSE で呼ばれる。パイプがバイト型パイプの場合、CallNamedPipe
は失敗する。Windows 10 バージョン 1709: パイプは app-container 内でのみサポートされ、つまり同じアプリの
UWP プロセス間でしか使えない。また、名前付きパイプはパイプ名に `\\.\pipe\LOCAL\` 構文を使う必要がある。


%index
CallbackMayRunLong
コールバックがすぐに戻らない可能性があることを示す。
%group
Win32 kernel32
%prm
pci
pci : [intptr] コールバックインスタンスを定義する TP_CALLBACK_INSTANCE 構造体へのポインタ。このポインタはコールバック関数に渡される。
%inst
コールバックがすぐに戻らない可能性があることを示す。

[戻り値]
関数は、スレッドプール内にコールバック処理に利用できる別スレッドがあるか、またはスレッドプールが新しいスレッドを作成できた場合に TRUE
を返す。この場合、現在のコールバック関数は現在のスレッドを無制限に使用してよい。関数は、スレッドプール内にコールバック処理に利用できる別スレッドがなく、スレッドプールが新しいスレッドを作成できなかった場合に
FALSE
を返す。スレッドプールは遅延後に新しいスレッドの作成を試みるが、現在のコールバック関数が長時間実行されるとスレッドプールの効率が低下する可能性がある。

[備考]
スレッドプールはこの情報を使って、新しいスレッドを作成すべきタイミングをより適切に判断できる。CallbackMayRunLong
関数はコールバックを処理中のスレッドからのみ呼ぶべきである。別のスレッドから呼ぶとレースコンディションを引き起こすおそれがある。CallbackMayRunLong
関数はコールバック処理用のスレッドが利用可能かどうかや、スレッドプールが新しいスレッドを割り当てられるかどうかに関わらず、常にコールバックを長時間実行としてマークする。したがって、FALSE
を返した場合であってもこの関数は一度だけ呼ぶべきである。この関数を使用するアプリケーションをコンパイルするには、_WIN32_WINNT
を 0x0600 以降として定義する。


%index
CancelDeviceWakeupRequest
(no summary)
%group
Win32 kernel32
%prm
hDevice
hDevice : [intptr] 
%inst



%index
CancelIo
指定ファイルに対して呼び出しスレッドが発行した、保留中の入出力 (I/O) 操作すべてをキャンセルする。
%group
Win32 kernel32
%prm
hFile
hFile : [intptr] ファイルへのハンドル。関数はこのファイルハンドルに対する保留中の I/O 操作をすべてキャンセルする。
%inst
指定ファイルに対して呼び出しスレッドが発行した、保留中の入出力 (I/O) 操作すべてをキャンセルする。

[戻り値]
関数が成功した場合、戻り値はゼロ以外。指定ファイルハンドルに対し呼び出しスレッドが発行した保留中の I/O
操作すべてのキャンセル要求が正常に送信された。スレッドは GetOverlappedResult 関数を使って I/O
操作自体が完了した時点を判定できる。関数が失敗した場合、戻り値はゼロ (0)。拡張エラー情報を取得するには GetLastError
関数を呼ぶ。

[備考]
指定ファイルハンドルに対して進行中の I/O 操作があり、それらが呼び出しスレッドによって発行されたものであれば、CancelIo
関数がそれらをキャンセルする。CancelIo はハンドル上の未完了 I/O
のみをキャンセルし、ハンドルの状態は変更しない。つまり、操作が正常に完了したのかキャンセルされたのかは分からないので、ハンドルの状態に依存してはならない。I/O
操作はオーバーラップ I/O として発行されなければならない。そうでないと I/O 操作は戻らず、スレッドが CancelIo
を呼び出すことができない。FILE_FLAG_OVERLAPPED で開かれていないファイルハンドルに対して CancelIo
を呼んでも何も起こらない。キャンセルされたすべての I/O 操作は ERROR_OPERATION_ABORTED エラーで完了し、I/O
操作の完了通知は通常どおりに発生する。Windows 8 および Windows Server 2012
では、この関数は以下の技術でサポートされている。
（以下省略）


%index
CancelIoEx
指定ファイルハンドルに対する未完了 I/O 操作にキャンセル印を付ける。この関数は、I/O 操作を作成したスレッドに関わらず、現在のプロセス内の I/O 操作のみをキャンセルする。
%group
Win32 kernel32
%prm
hFile, lpOverlapped
hFile : [intptr] ファイルへのハンドル。
lpOverlapped : [var] 非同期 I/O に使用されるデータを含む OVERLAPPED データ構造へのポインタ。このパラメータが NULL の場合、hFile パラメータのすべての I/O 要求がキャンセルされる。NULL でない場合、指定された lpOverlapped オーバーラップ構造体で発行された特定の I/O 要求のみがキャンセル対象としてマークされる。つまり、1 つまたは複数の要求をキャンセルできるのに対し、CancelIo 関数はファイルハンドル上のすべての未完了要求をキャンセルする。
%inst
指定ファイルハンドルに対する未完了 I/O 操作にキャンセル印を付ける。この関数は、I/O
操作を作成したスレッドに関わらず、現在のプロセス内の I/O 操作のみをキャンセルする。

[戻り値]
関数が成功した場合、戻り値はゼロ以外。指定ファイルハンドルに対し呼び出し側プロセスが発行した保留中の I/O
操作すべてのキャンセル要求が正常に送信された。アプリケーションはキャンセルした I/O 操作に関連付けられた OVERLAPPED
構造体が完了するまで、それを解放または再利用してはならない。スレッドは GetOverlappedResult 関数を使って I/O
操作自体が完了した時点を判定できる。関数が失敗した場合、戻り値は 0（ゼロ）。拡張エラー情報を取得するには GetLastError
関数を呼ぶ。キャンセル対象の要求が見つからなかった場合、戻り値は 0（ゼロ）で、GetLastError は
ERROR_NOT_FOUND を返す。

[備考]
CancelIoEx 関数は呼び出しスレッド以外のスレッドでも要求をキャンセルできる。CancelIo 関数は CancelIo
を呼んだスレッドと同じスレッド内の要求のみをキャンセルする。CancelIoEx はハンドル上の未完了 I/O
のみをキャンセルし、ハンドルの状態は変更しない。つまり、操作が正常に完了したのかキャンセルされたのかは分からないので、ハンドルの状態に依存してはならない。指定ファイルハンドルに対して進行中の
I/O 操作があれば、CancelIoEx
関数はそれらをキャンセル対象としてマークする。ほとんどの種類の操作は直ちにキャンセルできるが、他の操作は実際にキャンセルされて呼び出し側に通知される前に完了まで進行することもある。CancelIoEx
関数はキャンセルされたすべての操作の完了を待たない。ファイルハンドルが完了ポートに関連付けられている場合、同期操作が正常にキャンセルされたときは
I/O 完了パケットはポートにキューされない。まだ保留中の非同期操作については、キャンセル操作によって I/O
完了パケットがキューされる。キャンセルされる操作は 3
つのうちいずれかのステータスで完了する。どの状態で完了したかを判定するには完了ステータスを確認する必要がある。3
つのステータスは以下のとおり:
（以下省略）


%index
CancelSynchronousIo
指定スレッドが発行した保留中の同期 I/O 操作をキャンセル対象としてマークする。
%group
Win32 kernel32
%prm
hThread
hThread : [intptr] スレッドへのハンドル。
%inst
指定スレッドが発行した保留中の同期 I/O 操作をキャンセル対象としてマークする。

[戻り値]
関数が成功した場合、戻り値はゼロ以外。関数が失敗した場合、戻り値は 0（ゼロ）。拡張エラー情報を取得するには GetLastError
関数を呼ぶ。キャンセル対象の要求が見つからなかった場合、戻り値は 0（ゼロ）で、GetLastError は
ERROR_NOT_FOUND を返す。

[備考]
呼び出し側は THREAD_TERMINATE アクセス権を持っていなければならない。指定スレッドに対して進行中の I/O
操作があれば、CancelSynchronousIo
関数はそれらをキャンセル対象としてマークする。ほとんどの種類の操作は直ちにキャンセルできるが、他の操作は実際にキャンセルされて呼び出し側に通知される前に完了まで進行することもある。CancelSynchronousIo
関数はキャンセルされたすべての操作の完了を待たない。詳細は I/O Completion/Cancellation Guidelines
を参照。キャンセルされる操作は 3
つのうちいずれかのステータスで完了する。どの状態で完了したかを判定するには完了ステータスを確認する必要がある。3
つのステータスは以下のとおり:
（以下省略）


%index
CancelTimerQueueTimer
(no summary)
%group
Win32 kernel32
%prm
TimerQueue, Timer
TimerQueue : [intptr] 
Timer : [intptr] 
%inst



%index
CancelWaitableTimer
指定された待機可能タイマを非アクティブ状態に設定する。
%group
Win32 kernel32
%prm
hTimer
hTimer : [intptr] タイマオブジェクトへのハンドル。[CreateWaitableTimer](./nf-synchapi-createwaitabletimerw.md) または [OpenWaitableTimer](./nf-synchapi-openwaitabletimerw.md) 関数がこのハンドルを返す。ハンドルは TIMER_MODIFY_STATE アクセス権を持っている必要がある。詳細は Synchronization Object Security and Access Rights を参照。
%inst
指定された待機可能タイマを非アクティブ状態に設定する。

[戻り値]
関数が成功した場合、戻り値はゼロ以外。関数が失敗した場合、戻り値はゼロ。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
CancelWaitableTimer 関数はタイマのシグナル状態を変更しない。タイマがシグナル状態に設定されないうちに停止し、未完了の
APC
をキャンセルする。したがって、そのタイマで待機中のスレッドはタイムアウトするか、タイマが再有効化されてシグナル状態になるまで待機し続ける。タイマが既にシグナル状態であれば、その状態のままとなる。タイマを再有効化するには
SetWaitableTimer 関数を呼ぶ。この関数を使用するアプリケーションをコンパイルするには、_WIN32_WINNT を
0x0400 以降として定義する。詳細は Using the Windows Headers を参照。


%index
ChangeTimerQueueTimer
CreateTimerQueueTimer 関数で作成されたタイマキュータイマを更新する。
%group
Win32 kernel32
%prm
TimerQueue, Timer, DueTime, Period
TimerQueue : [intptr] タイマキューへのハンドル。このハンドルは CreateTimerQueue 関数が返す。
Timer : [intptr] タイマキュータイマへのハンドル。このハンドルは CreateTimerQueueTimer 関数が返す。
DueTime : [int] タイマが満了するまでの時間（ミリ秒単位）。
Period : [int] タイマの周期（ミリ秒単位）。このパラメータがゼロの場合、タイマは 1 度だけシグナルされる。ゼロより大きい場合、タイマは周期タイマとなる。周期タイマは、DeleteTimerQueueTimer 関数でキャンセルされるか ChangeTimerQueueTimer でリセットされるまで、周期が経過するたびに自動的に再有効化される。
%inst
CreateTimerQueueTimer 関数で作成されたタイマキュータイマを更新する。

[戻り値]
関数が成功した場合、戻り値はゼロ以外。関数が失敗した場合、戻り値はゼロ。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
この関数は、スレッドが impersonation
を使用している間に呼び出してはならない。その結果の動作は未定義である。タイマコールバック内で ChangeTimerQueueTimer
を呼ぶことができる。期間がゼロ（ワンショット）で既に満了したタイマに対して ChangeTimerQueueTimer
を呼んでも、タイマは更新されない。あるハンドルに対して DeleteTimerQueueTimer を呼んだ後に
ChangeTimerQueueTimer
を呼んではならない。この関数を使用するアプリケーションをコンパイルするには、_WIN32_WINNT を 0x0500
以降として定義する。詳細は Using the Windows Headers を参照。


%index
CheckNameLegalDOS8Dot3A
指定された名前が FAT ファイルシステム上でファイルを作成するために使用できるかを判定する。(ANSI)
%group
Win32 kernel32
%prm
lpName, lpOemName, OemNameSize, pbNameContainsSpaces, pbNameLegal
lpName : [str] 8.3 形式のファイル名。
lpOemName : [str] Name に対応する OEM 文字列を受け取るバッファへのポインタ。このパラメータは NULL でも構わない。
OemNameSize : [int] lpOemName バッファのサイズ（文字単位）。lpOemName が NULL の場合、このパラメータは 0 でなければならない。
pbNameContainsSpaces : [var] 名前にスペースが含まれているかを示す。このパラメータは NULL でも構わない。名前が有効な 8.3 FAT ファイルシステム名でない場合、このパラメータは未定義。
pbNameLegal : [var] 関数が成功した場合、このパラメータは、現在の OEM コードページを適用したときにファイル名が有効な 8.3 FAT ファイル名であるかを示す。
%inst
指定された名前が FAT ファイルシステム上でファイルを作成するために使用できるかを判定する。(ANSI)

[戻り値]
関数が成功した場合、戻り値はゼロ以外。関数が失敗した場合、戻り値は 0（ゼロ）。拡張エラー情報を取得するには GetLastError
を呼ぶ。

[備考]
この関数は、ファイル名を 16 ビット Windows ベースアプリケーションや MS-DOS
ベースアプリケーションに渡せるかを判定するために使用できる。Windows 8 および Windows Server 2012
では、この関数は以下の技術でサポートされている。
（以下省略）


%index
CheckNameLegalDOS8Dot3W
指定された名前が FAT ファイルシステム上でファイルを作成するために使用できるかを判定する。(Unicode)
%group
Win32 kernel32
%prm
lpName, lpOemName, OemNameSize, pbNameContainsSpaces, pbNameLegal
lpName : [wstr] 8.3 形式のファイル名。
lpOemName : [str] Name に対応する OEM 文字列を受け取るバッファへのポインタ。このパラメータは NULL でも構わない。
OemNameSize : [int] lpOemName バッファのサイズ（文字単位）。lpOemName が NULL の場合、このパラメータは 0 でなければならない。
pbNameContainsSpaces : [var] 名前にスペースが含まれているかを示す。このパラメータは NULL でも構わない。名前が有効な 8.3 FAT ファイルシステム名でない場合、このパラメータは未定義。
pbNameLegal : [var] 関数が成功した場合、このパラメータは、現在の OEM コードページを適用したときにファイル名が有効な 8.3 FAT ファイル名であるかを示す。
%inst
指定された名前が FAT ファイルシステム上でファイルを作成するために使用できるかを判定する。(Unicode)

[戻り値]
関数が成功した場合、戻り値はゼロ以外。関数が失敗した場合、戻り値は 0（ゼロ）。拡張エラー情報を取得するには GetLastError
を呼ぶ。

[備考]
この関数は、ファイル名を 16 ビット Windows ベースアプリケーションや MS-DOS
ベースアプリケーションに渡せるかを判定するために使用できる。Windows 8 および Windows Server 2012
では、この関数は以下の技術でサポートされている。
（以下省略）


%index
CheckRemoteDebuggerPresent
指定されたプロセスがデバッグ中かどうかを判定する。
%group
Win32 kernel32
%prm
hProcess, pbDebuggerPresent
hProcess : [intptr] プロセスへのハンドル。
pbDebuggerPresent : [var] 指定プロセスがデバッグ中であれば関数によって TRUE に設定される変数へのポインタ。そうでなければ FALSE に設定される。
%inst
指定されたプロセスがデバッグ中かどうかを判定する。

[戻り値]
関数が成功した場合、戻り値はゼロ以外。関数が失敗した場合、戻り値はゼロ。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
CheckRemoteDebuggerPresent の "remote"
は、デバッガが必ずしも別コンピュータ上にあることを意味せず、デバッガが別の並列プロセスに存在することを示している。呼び出し側プロセスがデバッガ下で動作しているかを検出するには
IsDebuggerPresent 関数を使う。この関数を使用するアプリケーションをコンパイルするには、_WIN32_WINNT マクロを
0x0501 以降として定義する。詳細は Using the Windows Headers を参照。


%index
CheckTokenCapability
指定されたトークンのケイパビリティを検査する。
%group
Win32 kernel32
%prm
TokenHandle, CapabilitySidToCheck, HasCapability
TokenHandle : [intptr] アクセストークンへのハンドル。ハンドルはトークンへの TOKEN_QUERY アクセス権を持っている必要がある。トークンは impersonation トークンでなければならない。
CapabilitySidToCheck : [int] capability SID 構造体へのポインタ。CheckTokenCapability 関数はこのアクセストークンのケイパビリティを検査する。
HasCapability : [var] 検査結果を受け取る。アクセストークンがそのケイパビリティを持っていれば TRUE、そうでなければ FALSE が返される。
%inst
指定されたトークンのケイパビリティを検査する。

[戻り値]
関数が成功した場合、戻り値はゼロ以外。関数が失敗した場合、戻り値はゼロ。拡張エラー情報を取得するには GetLastError を呼ぶ。


%index
CheckTokenMembershipEx
指定された SID が指定されたトークンで有効かどうかを判定する。
%group
Win32 kernel32
%prm
TokenHandle, SidToCheck, Flags, IsMember
TokenHandle : [intptr] アクセストークンへのハンドル。指定されている場合、このトークンが SID の有無について検査される。指定されていない場合、現在の実効トークンが使われる。これは impersonation トークンでなければならない。
SidToCheck : [int] SID 構造体へのポインタ。関数はこの SID がトークンに存在するかを検査する。
Flags : [int] 関数の動作に影響するフラグ。現在有効なフラグは CTMF_INCLUDE_APPCONTAINER のみで、指定されたグループが存在し有効であるなどのトークンの他の要件が満たされる限り、app container が呼び出しを通過できるようにする。
IsMember : [var] SID がトークンで有効なら TRUE、そうでなければ FALSE。
%inst
指定された SID が指定されたトークンで有効かどうかを判定する。

[戻り値]
関数が成功した場合、TRUE を返す。関数が失敗した場合、ゼロを返す。拡張エラー情報を取得するには GetLastError を呼ぶ。


%index
ClearCommBreak
指定された通信デバイスの文字送信を復帰させ、送信ラインを非ブレーク状態にする。
%group
Win32 kernel32
%prm
hFile
hFile : [intptr] 通信デバイスへのハンドル。CreateFile 関数がこのハンドルを返す。
%inst
指定された通信デバイスの文字送信を復帰させ、送信ラインを非ブレーク状態にする。

[戻り値]
関数が成功した場合、戻り値はゼロ以外。関数が失敗した場合、戻り値はゼロ。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
通信デバイスは SetCommBreak または EscapeCommFunction
関数によってブレーク状態に置かれる。その後、ClearCommBreak
の呼び出しによってブレーク状態が解除されるまで、文字の送信が中断される。


%index
ClearCommError
通信エラーに関する情報を取得し、通信デバイスの現在のステータスを報告する。
%group
Win32 kernel32
%prm
hFile, lpErrors, lpStat
hFile : [intptr] 通信デバイスへのハンドル。CreateFile 関数がこのハンドルを返す。
lpErrors : [var] 
lpStat : [var] デバイスのステータス情報を受け取る COMSTAT 構造体へのポインタ。このパラメータが NULL の場合、ステータス情報は返されない。
%inst
通信エラーに関する情報を取得し、通信デバイスの現在のステータスを報告する。

[戻り値]
関数が成功した場合、戻り値はゼロ以外。関数が失敗した場合、戻り値はゼロ。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
通信ポートがセットアップ時に DCB 構造体の fAbortOnError メンバーを TRUE
でセットアップされている場合、通信エラーが発生すると通信ソフトウェアはその通信ポート上のすべての読み書き操作を終了させる。アプリケーションが
ClearCommError 関数を呼んで通信エラーを承認するまで、新しい読み書き操作は受け付けられない。ClearCommError
関数は lpStat パラメータが指すステータスバッファに、hFile パラメータで指定された通信デバイスの現在のステータスを格納する。


%index
ClosePrivateNamespace
開いている名前空間ハンドルを閉じる。
%group
Win32 kernel32
%prm
Handle, Flags
Handle : [intptr] 名前空間のハンドル。このハンドルは CreatePrivateNamespace または OpenPrivateNamespace で作成される。
Flags : [int] このパラメータが PRIVATE_NAMESPACE_FLAG_DESTROY (0x00000001) の場合、名前空間が破棄される。
%inst
開いている名前空間ハンドルを閉じる。

[戻り値]
関数が成功した場合、戻り値はゼロ以外。関数が失敗した場合、戻り値はゼロ。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
この関数を使用するアプリケーションをコンパイルするには、_WIN32_WINNT を 0x0600 以降として定義する。


%index
ClosePseudoConsole
指定されたハンドルの疑似コンソールを閉じる ClosePseudoConsole 関数に関するリファレンス情報を参照のこと。
%group
Win32 kernel32
%prm
hPC
hPC : [intptr] [CreatePseudoConsole](createpseudoconsole.md) で開いたアクティブな疑似コンソールへのハンドル。
%inst
指定されたハンドルの疑似コンソールを閉じる ClosePseudoConsole 関数に関するリファレンス情報を参照のこと。

[戻り値]
*なし*

[備考]
疑似コンソールを閉じると、セッションにアタッチされているクライアントアプリケーションも終了する。この API
が呼ばれたとき、最後に描画されたフレームが [CreatePseudoConsole](createpseudoconsole.md)
に渡された元の `hOutput`
ハンドルに到着する可能性がある。呼び出し側は通信チャネルバッファからこの情報を取り出し、提示するか破棄することが期待される。バッファを取り出せない場合、Close
呼び出しが無期限に待機するか、通信チャネルが別の方法で破損するまで待機し続ける可能性がある。


%index
CommConfigDialogW
ドライバから提供される設定ダイアログボックスを表示する。(Unicode)
%group
Win32 kernel32
%prm
lpszName, hWnd, lpCC
lpszName : [wstr] ダイアログボックスを表示する対象のデバイス名。例えば、COM1 から COM9 はシリアルポート、LPT1 から LPT9 はパラレルポートである。
hWnd : [intptr] ダイアログボックスを所有するウィンドウへのハンドル。このパラメータには任意の有効なウィンドウハンドルを指定でき、ダイアログボックスに所有者を持たせない場合は NULL を指定する。
lpCC : [var] COMMCONFIG 構造体へのポインタ。この構造体には呼び出し前のダイアログボックスの初期設定と、呼び出し後の変更された値が格納される。
%inst
ドライバから提供される設定ダイアログボックスを表示する。(Unicode)

[戻り値]
関数が成功した場合、戻り値はゼロ以外。関数が失敗した場合、戻り値はゼロ。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
CommConfigDialog 関数は通信ハードウェアベンダーが提供する DLL を必要とする。
> [!NOTE] > winbase.h ヘッダーは CommConfigDialog を UNICODE
プリプロセッサ定数の定義に基づいて ANSI 版または Unicode
版を自動選択するエイリアスとして定義している。エンコード中立エイリアスとそうでないコードを混在させると、コンパイルエラーや実行時エラーにつながる不一致が生じる可能性がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
CompareFileTime
2 つのファイル時刻を比較する。
%group
Win32 kernel32
%prm
lpFileTime1, lpFileTime2
lpFileTime1 : [var] 1 つ目のファイル時刻を指定する FILETIME 構造体へのポインタ。
lpFileTime2 : [var] 2 つ目のファイル時刻を指定する FILETIME 構造体へのポインタ。
%inst
2 つのファイル時刻を比較する。

[戻り値]
戻り値は以下のいずれか。
（以下省略）


%index
CompareStringW
CompareStringW (Unicode) 関数 (stringapiset.h) は、識別子で指定されたロケールについて 2 つの文字列を比較する。
%group
Win32 kernel32
%prm
Locale, dwCmpFlags, lpString1, cchCount1, lpString2, cchCount2
Locale : [int] 比較に使用するロケールのロケール識別子。MAKELCID マクロを使ってロケール識別子を作成することも、以下の定義済み値のいずれかを使うこともできる。
dwCmpFlags : [int] 2 つの文字列の比較方法を示すフラグ。詳細な定義は CompareStringEx の dwCmpFlags パラメータを参照。
lpString1 : [wstr] 比較する 1 つ目の文字列へのポインタ。
cchCount1 : [int] lpString1 が示す文字列の長さ（終端 null 文字を除く）。この値は関数の ANSI 版ではバイト数、Unicode 版ではワイド文字数を表す。文字列が null 終端の場合、アプリケーションは負の値を指定できる。その場合、関数が長さを自動的に決定する。
lpString2 : [wstr] 比較する 2 つ目の文字列へのポインタ。
cchCount2 : [int] lpString2 が示す文字列の長さ（終端 null 文字を除く）。この値は関数の ANSI 版ではバイト数、Unicode 版ではワイド文字数を表す。文字列が null 終端の場合、アプリケーションは負の値を指定できる。その場合、関数が長さを自動的に決定する。
%inst
CompareStringW (Unicode) 関数 (stringapiset.h) は、識別子で指定されたロケールについて 2
つの文字列を比較する。

[戻り値]
CompareStringEx で説明された値を返す。

[備考]
備考は CompareStringEx を参照。アプリケーションが CompareString の ANSI
版を呼ぶ場合、関数は与えられたロケールの既定のコードページでパラメータを変換する。そのため、アプリケーションは CompareString
を使って UTF-8 テキストを処理することはできない。通常、大文字小文字を無視する比較では、CompareString
はロケールがトルコ語やアゼルバイジャン語であっても小文字の "i" を大文字の "I"
にマップする。NORM_LINGUISTIC_CASING
フラグはトルコ語やアゼルバイジャン語ではこの動作を上書きする。このフラグをトルコ語やアゼルバイジャン語と組み合わせて指定した場合、LATIN
SMALL LETTER DOTLESS I (U+0131) が LATIN CAPITAL LETTER I (U+0049)
の小文字形式、LATIN SMALL LETTER I (U+0069) が LATIN CAPITAL LETTER I WITH
DOT ABOVE (U+0130) の小文字形式となる。Windows 8 以降: 関数の ANSI 版は Winnls.h
で、Unicode 版は Stringapiset.h で宣言される。Windows 8 より前は両方とも Winnls.h
で宣言されていた。


%index
CompareStringEx
名前で指定されたロケールについて、2 つの Unicode（ワイド文字）文字列を比較する。注意: CompareStringEx を誤用するとアプリケーションのセキュリティを損なう可能性がある。
%group
Win32 kernel32
%prm
lpLocaleName, dwCmpFlags, lpString1, cchCount1, lpString2, cchCount2, lpVersionInformation, lpReserved, lParam
lpLocaleName : [wstr] ロケール名へのポインタ、または以下の定義済み値のいずれか。
dwCmpFlags : [int] 
lpString1 : [wstr] 比較する 1 つ目の文字列へのポインタ。
cchCount1 : [int] lpString1 が示す文字列の長さ（終端 null 文字を除く）。文字列が null 終端の場合、アプリケーションは負の値を指定できる。その場合、関数が長さを自動的に決定する。
lpString2 : [wstr] 比較する 2 つ目の文字列へのポインタ。
cchCount2 : [int] lpString2 が示す文字列の長さ（終端 null 文字を除く）。文字列が null 終端の場合、アプリケーションは負の値を指定できる。その場合、関数が長さを自動的に決定する。
lpVersionInformation : [var] 関連する NLS 機能に関するバージョン情報を含む NLSVERSIONINFOEX 構造体へのポインタ。通常は GetNLSVersionEx で取得する。Windows Vista、Windows 7: 予約済み。NULL に設定しなければならない。
lpReserved : [intptr] 予約済み。NULL に設定しなければならない。
lParam : [intptr] 予約済み。0 に設定しなければならない。
%inst
名前で指定されたロケールについて、2 つの Unicode（ワイド文字）文字列を比較する。注意: CompareStringEx
を誤用するとアプリケーションのセキュリティを損なう可能性がある。

[戻り値]
成功した場合は以下の値のいずれかを返す。C ランタイムの文字列比較慣習を維持するため、ゼロ以外の戻り値から 2
を引くことができる。そうすると <0、==0、>0 の意味が C ランタイムと一致する。
（以下省略）

[備考]
CompareString と CompareStringEx はいずれも、dwCmpFlags が 0 または
NORM_IGNORECASE に設定され、cchCount1 と cchCount2 が -1 に設定され、ロケールが言語圧縮（例:
伝統的なスペイン語ソートで "ch" を 1
文字として扱うような）をサポートしない場合に最大速度で実行されるように最適化されている。CompareString と
CompareStringEx はいずれも、比較時にアラビア語のカシーダを無視する。そのため、カシーダの有無以外が同一である 2
つの文字列については、関数は CSTR_EQUAL を返す。
アプリケーションがソート関数で NORM_IGNORENONSPACE および NORM_IGNORECASE
フラグを使用すると、文字列比較に干渉する可能性がある。これは、ロケールが非スペーシング文字や大文字小文字をサポートしないが、他の重要な操作を処理するために同等のウェイトレベルを使う場合に起こり得る。そのような場合、アプリケーションは
LINGUISTIC_IGNOREDIACRITIC および LINGUISTIC_IGNORECASE
フラグを使うべきである。これらのフラグは、大文字小文字や発音区別記号を使うコードポイントのソートに言語学的に適切な結果を提供し、他のコードポイントには影響を与えない。Windows
Vista 以降: CompareString と CompareStringEx
はカスタムロケールからデータを取得できる。データはコンピュータ間やアプリケーションの実行間で同じであることが保証されない。データを永続化または送信する必要がある場合は、Using
Persistent Locale Data を参照。
Windows 8 以降: アプリケーションが Windows.Globalization 名前空間からこの関数に言語タグを渡す場合、まず
ResolveLocaleName を呼んでタグを変換する必要がある。Windows 8 以降: CompareStringEx は
Stringapiset.h で宣言されている。Windows 8 より前では Winnls.h で宣言されていた。注意: ソート動作は
Windows のリリース間で変わることがある。例えば新しい Unicode
コードポイントが作成されることがある。ソートバージョンが変わったかどうかは GetNlsVersionEx で確認する。


%index
CompareStringOrdinal
2 つの Unicode 文字列を比較してバイナリの等価性を検査する。
%group
Win32 kernel32
%prm
lpString1, cchCount1, lpString2, cchCount2, bIgnoreCase
lpString1 : [wstr] 比較する 1 つ目の文字列へのポインタ。
cchCount1 : [int] lpString1 が示す文字列の長さ。文字列が null 終端の場合、アプリケーションは -1 を指定する。その場合、関数が長さを自動的に決定する。
lpString2 : [wstr] 比較する 2 つ目の文字列へのポインタ。
cchCount2 : [int] lpString2 が示す文字列の長さ。文字列が null 終端の場合、アプリケーションは -1 を指定する。その場合、関数が長さを自動的に決定する。
bIgnoreCase : [int] 関数が大文字小文字を無視する比較を実行する場合は TRUE。OS の大文字テーブル情報が使われる。関数が渡された文字列をそのまま厳密に比較する場合、アプリケーションはこのパラメータを FALSE に設定する。なお、この論理型パラメータに真の値を指定できる唯一の数値は 1 であり、他の値では無効なパラメータエラーになる。論理値は期待どおりに動作する。
%inst
2 つの Unicode 文字列を比較してバイナリの等価性を検査する。

[戻り値]
成功した場合は以下の値のいずれかを返す。C ランタイムの文字列比較慣習を維持するため、ゼロ以外の戻り値から 2
を引くことができる。そうすると <0、==0、>0 の意味が C ランタイムと一致する。
（以下省略）

[備考]
この関数は言語的な等価性ではなくバイナリの等価性を検査する。序数ソートにおけるこの関数の使い方については、Handling Sorting
in Your Applications
を参照。言語的な等価性が必要なアプリケーションは、CompareString、CompareStringEx、lstrcmp、lstrcmpi
を使うべきである。言語的ソートの詳細は Handling Sorting in Your Applications を参照。
Windows 8 以降: CompareStringOrdinal は Stringapiset.h で宣言されている。Windows
8 より前では Winnls.h で宣言されていた。


%index
ConnectNamedPipe
名前付きパイプサーバープロセスがクライアントプロセスからの名前付きパイプインスタンスへの接続を待機できるようにする。
%group
Win32 kernel32
%prm
hNamedPipe, lpOverlapped
hNamedPipe : [intptr] 名前付きパイプインスタンスのサーバー側へのハンドル。このハンドルは CreateNamedPipe 関数が返す。
lpOverlapped : [var] OVERLAPPED 構造体へのポインタ。
%inst
名前付きパイプサーバープロセスがクライアントプロセスからの名前付きパイプインスタンスへの接続を待機できるようにする。

[戻り値]
操作が同期の場合、ConnectNamedPipe
は操作が完了するまで戻らない。関数が成功した場合、戻り値はゼロ以外。関数が失敗した場合、戻り値はゼロ。拡張エラー情報を取得するには
GetLastError を呼ぶ。操作が非同期の場合、ConnectNamedPipe
は直ちに戻る。操作がまだ保留中の場合、戻り値はゼロで GetLastError は ERROR_IO_PENDING
を返す（HasOverlappedIoCompleted マクロを使って操作完了を判定できる）。関数が失敗した場合、戻り値はゼロで
GetLastError は ERROR_IO_PENDING または ERROR_PIPE_CONNECTED
以外の値を返す。関数呼び出し前にクライアントが接続した場合、関数はゼロを返し GetLastError は
ERROR_PIPE_CONNECTED を返す。これは CreateNamedPipe の呼び出しと ConnectNamedPipe
の呼び出しの間にクライアントが接続した場合に発生する。この状況では関数がゼロを返すもののクライアントとサーバー間の接続は正常に確立されている。

[備考]
名前付きパイプサーバープロセスは新しく作成したパイプインスタンスに対して ConnectNamedPipe
を使用できる。以前に別のクライアントプロセスに接続されていたインスタンスでも使用できる。この場合、ハンドルを新しいクライアントに再接続する前に、サーバープロセスはまず
DisconnectNamedPipe
関数を呼んで前のクライアントからハンドルを切断しなければならない。そうしないと、前のクライアントがハンドルを閉じていれば
ConnectNamedPipe はゼロを返し GetLastError は ERROR_NO_DATA
を返す。ハンドルを閉じていなければ ERROR_PIPE_CONNECTED を返す。ConnectNamedPipe の動作は 2
つの条件に依存する:
パイプハンドルの待機モードがブロッキングかノンブロッキングか、関数が同期実行かオーバーラップモードかである。サーバーは
CreateNamedPipe でパイプハンドルの待機モードを最初に指定し、SetNamedPipeHandleState
で変更できる。サーバープロセスは任意の待機関数や SleepEx
を使ってイベントオブジェクトがシグナル状態になったかを判定し、HasOverlappedIoCompleted マクロで
ConnectNamedPipe
操作の完了を判定できる。指定パイプハンドルがノンブロッキングモードの場合、ConnectNamedPipe
は常に直ちに戻る。ノンブロッキングモードでは、前のクライアントから切断されたパイプインスタンスに対する初回呼び出しでゼロ以外を返す。これはパイプが新しいクライアントプロセスに接続可能になったことを示す。ノンブロッキングモードでの他の状況ではすべて
ConnectNamedPipe はゼロを返す。これらの状況で GetLastError は、クライアントが接続されていない場合は
ERROR_PIPE_LISTENING、接続されている場合は
ERROR_PIPE_CONNECTED、前のクライアントがハンドルを閉じたがサーバーが切断していない場合は ERROR_NO_DATA
を返す。なお、ERROR_PIPE_CONNECTED エラーを受け取った後にのみクライアントとサーバー間の正常な接続が存在する。注意:
ノンブロッキングモードは Microsoft LAN Manager バージョン 2.0
との互換性のためにサポートされており、名前付きパイプで非同期入出力を実現するために使うべきではない。Windows 10 バージョン
1709: パイプは app-container 内でのみサポートされ、つまり同じアプリの UWP
プロセス間でしか使えない。また、名前付きパイプはパイプ名に `\\.\pipe\LOCAL\` 構文を使う必要がある。


%index
ContinueDebugEvent
デバッガが以前にデバッグイベントを報告したスレッドの実行を継続させる。
%group
Win32 kernel32
%prm
dwProcessId, dwThreadId, dwContinueStatus
dwProcessId : [int] 継続させるプロセスのプロセス識別子。
dwThreadId : [int] 継続させるスレッドのスレッド識別子。プロセス識別子とスレッド識別子の組み合わせは、以前にデバッグイベントを報告したスレッドを特定できなければならない。
dwContinueStatus : [intptr] デバッグイベントを報告したスレッドを継続させるオプション。
%inst
デバッガが以前にデバッグイベントを報告したスレッドの実行を継続させる。

[戻り値]
関数が成功した場合、戻り値はゼロ以外。関数が失敗した場合、戻り値はゼロ。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
CreateProcess 関数で dwProcessId を作成したスレッドのみが ContinueDebugEvent
を呼べる。ContinueDebugEvent
関数が成功した後、指定スレッドは継続する。スレッドが以前に報告したデバッグイベントに応じて、異なる動作が発生する。継続されたスレッドが以前に
EXIT_THREAD_DEBUG_EVENT デバッグイベントを報告していた場合、ContinueDebugEvent
はデバッガがそのスレッドに対して持っているハンドルを閉じる。継続されたスレッドが以前に EXIT_PROCESS_DEBUG_EVENT
デバッグイベントを報告していた場合、ContinueDebugEvent
はデバッガがそのプロセスとスレッドに対して持っているハンドルを閉じる。


%index
ConvertCalDateTimeToSystemTime
非推奨。指定された CALDATETIME 構造体を SYSTEMTIME 構造体に変換する。
%group
Win32 kernel32
%prm
lpCalDateTime, lpSysTime
lpCalDateTime : [var] 変換する [**CALDATETIME**](caldatetime.md) 構造体へのポインタ。
lpSysTime : [var] 変換後の [**SYSTEMTIME**](/windows/win32/api/minwinbase/ns-minwinbase-systemtime) 構造体へのポインタ。
%inst
非推奨。指定された CALDATETIME 構造体を SYSTEMTIME 構造体に変換する。

[戻り値]
成功した場合 **TRUE** を、それ以外の場合 **FALSE** を返す。拡張エラー情報を取得するには、アプリケーションは
[**GetLastError**](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror)
を呼ぶことができ、以下のいずれかのエラーコードが返る可能性がある: -
ERROR\_DATE\_OUT\_OF\_RANGE。指定された日付が範囲外。-
ERROR\_INVALID\_PARAMETER。パラメータ値のいずれかが無効。

[備考]
この関数には関連付けられたヘッダーファイルやライブラリファイルがない。アプリケーションは
[**LoadLibrary**](/windows/win32/api/libloaderapi/nf-libloaderapi-loadlibrarya)
を DLL 名 (Kernel32.dll) で呼んでモジュールハンドルを取得し、その後
[**GetProcAddress**](/windows/win32/api/libloaderapi/nf-libloaderapi-getprocaddress)
にモジュールハンドルとこの関数名を渡して関数アドレスを取得する。


%index
ConvertDefaultLocale
既定のロケール値を実際のロケール識別子に変換する。
%group
Win32 kernel32
%prm
Locale
Locale : [int] 変換する既定のロケール識別子値。MAKELCID マクロを使ってロケール識別子を作成することも、以下の定義済み値のいずれかを使うこともできる。
%inst
既定のロケール値を実際のロケール識別子に変換する。

[戻り値]
成功した場合は適切なロケール識別子を返す。この関数は成功しなかった場合 Locale パラメータの値を返す。Locale
値が上述の既定値のいずれでもない場合、関数は失敗する。

[備考]
LOCALE_SYSTEM_DEFAULT を指定した ConvertDefaultLocale の呼び出しは
GetSystemDefaultLCID の呼び出しと等価である。LOCALE_USER_DEFAULT を指定した
ConvertDefaultLocale の呼び出しは GetUserDefaultLCID の呼び出しと等価である。


%index
ConvertFiberToThread
現在のファイバをスレッドに変換する。
%group
Win32 kernel32
%prm

%inst
現在のファイバをスレッドに変換する。

[戻り値]
関数が成功した場合、戻り値はゼロ以外。関数が失敗した場合、戻り値はゼロ。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
この関数は ConvertThreadToFiber
関数で割り当てられたリソースを解放する。この関数を呼んだ後、スレッドからファイバ関数を呼ぶことはできない。この関数を使用するアプリケーションをコンパイルするには、\_WIN32_WINNT
を \_WIN32_WINNT_WS03 (0x0502) 以降として定義する。詳細は Using the Windows Headers
を参照。


%index
ConvertSystemTimeToCalDateTime
非推奨。指定された SYSTEMTIME 構造体を CALDATETIME 構造体に変換する。
%group
Win32 kernel32
%prm
lpSysTime, calId, lpCalDateTime
lpSysTime : [var] 変換する [**SYSTEMTIME**](/windows/win32/api/minwinbase/ns-minwinbase-systemtime) 構造体へのポインタ。
calId : [int] 変換に使用するシステム [calendar identifier](calendar-identifiers.md)。
lpCalDateTime : [var] 変換後の [**CALDATETIME**](caldatetime.md) 構造体へのポインタ。
%inst
非推奨。指定された SYSTEMTIME 構造体を CALDATETIME 構造体に変換する。

[戻り値]
成功した場合 **TRUE** を、それ以外の場合 **FALSE** を返す。拡張エラー情報を取得するには、アプリケーションは
[**GetLastError**](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror)
を呼ぶことができ、以下のいずれかのエラーコードが返る可能性がある: -
ERROR\_INVALID\_PARAMETER。パラメータ値のいずれかが無効。

[備考]
この関数でサポートされる最も古い日付は 1601 年 1 月 1
日である。この関数には関連付けられたヘッダーファイルやライブラリファイルがない。アプリケーションは
[**LoadLibrary**](/windows/win32/api/libloaderapi/nf-libloaderapi-loadlibrarya)
を DLL 名 (Kernel32.dll) で呼んでモジュールハンドルを取得し、その後
[**GetProcAddress**](/windows/win32/api/libloaderapi/nf-libloaderapi-getprocaddress)
にモジュールハンドルとこの関数名を渡して関数アドレスを取得する。


%index
ConvertThreadToFiber
現在のスレッドをファイバに変換する。他のファイバをスケジュールする前に、スレッドをファイバに変換しなければならない。(ConvertThreadToFiber)
%group
Win32 kernel32
%prm
lpParameter
lpParameter : [intptr] ファイバに渡される変数へのポインタ。ファイバは GetFiberData マクロを使ってこのデータを取得できる。
%inst

現在のスレッドをファイバに変換する。他のファイバをスケジュールする前に、スレッドをファイバに変換しなければならない。(ConvertThreadToFiber)

[戻り値]
関数が成功した場合、戻り値はファイバのアドレス。関数が失敗した場合、戻り値は NULL。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
他のファイバを実行できるのはファイバだけである。スレッドがファイバを実行する必要がある場合、まず ConvertThreadToFiber
または ConvertThreadToFiberEx
を呼んで、ファイバ状態情報を保存する領域を作成しなければならない。これによりスレッドが現在のファイバになる。このファイバの状態情報には
lpParameter
で指定されたファイバデータが含まれる。この関数を使用するアプリケーションをコンパイルするには、_WIN32_WINNT を 0x0400
以降として定義する。詳細は Using the Windows Headers を参照。


%index
ConvertThreadToFiberEx
現在のスレッドをファイバに変換する。他のファイバをスケジュールする前に、スレッドをファイバに変換しなければならない。(ConvertThreadToFiberEx)
%group
Win32 kernel32
%prm
lpParameter, dwFlags
lpParameter : [intptr] ファイバに渡される変数へのポインタ。ファイバは GetFiberData マクロを使ってこのデータを取得できる。
dwFlags : [int] このパラメータがゼロの場合、x86 システムで浮動小数点状態は切り替えられず、ファイバが浮動小数点演算を使うとデータが破損する可能性がある。FIBER_FLAG_FLOAT_SWITCH の場合、ファイバに対して浮動小数点状態が切り替えられる。
%inst

現在のスレッドをファイバに変換する。他のファイバをスケジュールする前に、スレッドをファイバに変換しなければならない。(ConvertThreadToFiberEx)

[戻り値]
関数が成功した場合、戻り値はファイバのアドレス。関数が失敗した場合、戻り値は NULL。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
他のファイバを実行できるのはファイバだけである。スレッドがファイバを実行する必要がある場合、まず ConvertThreadToFiber
または ConvertThreadToFiberEx
を呼んで、ファイバ状態情報を保存する領域を作成しなければならない。これによりスレッドが現在のファイバになる。このファイバの状態情報には
lpParameter
で指定されたファイバデータが含まれる。この関数を使用するアプリケーションをコンパイルするには、_WIN32_WINNT を 0x0400
以降として定義する。詳細は Using the Windows Headers を参照。


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
CopyFile2
既存ファイルを新しいファイルにコピーし、コールバック関数を通じて進捗をアプリケーションに通知する。(CopyFile2)
%group
Win32 kernel32
%prm
pwszExistingFileName, pwszNewFileName, pExtendedParameters
pwszExistingFileName : [wstr] 既存ファイルの名前。この制限を 32,767 ワイド文字まで拡張するには、パスの先頭に "\\?\" を付ける。詳細は Naming Files, Paths, and Namespaces を参照。ヒント: Windows 10 バージョン 1607 以降、"\\?\" を前置せずに MAX_PATH 文字数制限を取り除くことにオプトインできる。詳細は Naming Files, Paths, and Namespaces の "Maximum Path Limitation" セクションを参照。lpExistingFileName が存在しない場合、CopyFile2 関数は失敗し HRESULT_FROM_WIN32(ERROR_FILE_NOT_FOUND) を返す。
pwszNewFileName : [wstr] 新しいファイルの名前。この制限を 32,767 ワイド文字まで拡張するには、パスの先頭に "\\?\" を付ける。詳細は Naming Files, Paths, and Namespaces を参照。ヒント: Windows 10 バージョン 1607 以降、"\\?\" を前置せずに MAX_PATH 文字数制限を取り除くことにオプトインできる。詳細は Naming Files, Paths, and Namespaces の "Maximum Path Limitation" セクションを参照。
pExtendedParameters : [var] COPYFILE2_EXTENDED_PARAMETERS 構造体のアドレス（省略可）。
%inst
既存ファイルを新しいファイルにコピーし、コールバック関数を通じて進捗をアプリケーションに通知する。(CopyFile2)

[戻り値]
関数が成功した場合、戻り値は SUCCEEDED マクロに渡したときに TRUE となる。
（以下省略）

[備考]
この関数は拡張属性、OLE 構造化ストレージ、NTFS
代替データストリーム、ファイル属性を保持する。既存ファイルのセキュリティ属性は新しいファイルにはコピーされない。セキュリティ属性をコピーするには
SHFileOperation 関数を使う。コピー先ファイルがすでに存在し FILE_ATTRIBUTE_HIDDEN または
FILE_ATTRIBUTE_READONLY 属性が設定されている場合、この関数は
HRESULT_FROM_WIN32(ERROR_ACCESS_DENIED)
で失敗する。この関数を使用するアプリケーションをコンパイルするには、_WIN32_WINNT マクロを _WIN32_WINNT_WIN8
以降として定義する。詳細は Using the Windows Headers を参照。Windows 8 および Windows
Server 2012 では、この関数は以下の技術でサポートされている。
（以下省略）


%index
CopyFileExW
既存ファイルを新しいファイルにコピーし、コールバック関数を通じて進捗をアプリケーションに通知する。(CopyFileExW)
%group
Win32 kernel32
%prm
lpExistingFileName, lpNewFileName, lpProgressRoutine, lpData, pbCancel, dwCopyFlags
lpExistingFileName : [wstr] 既存ファイルの名前。
lpNewFileName : [wstr] 新しいファイルの名前。
lpProgressRoutine : [int] ファイルの一部がコピーされるたびに呼ばれる、LPPROGRESS_ROUTINE 型のコールバック関数のアドレス。このパラメータは NULL でも構わない。進捗コールバック関数の詳細は CopyProgressRoutine 関数を参照。
lpData : [intptr] コールバック関数に渡される引数。このパラメータは NULL でも構わない。
pbCancel : [var] コピー操作中にこのフラグが TRUE に設定されると、操作がキャンセルされる。そうでなければコピー操作は完了まで続行される。
dwCopyFlags : [int] ファイルのコピー方法を指定するフラグ。このパラメータは以下の値の組み合わせで指定できる。
%inst
既存ファイルを新しいファイルにコピーし、コールバック関数を通じて進捗をアプリケーションに通知する。(CopyFileExW)

[戻り値]
関数が成功した場合、戻り値はゼロ以外。関数が失敗した場合、戻り値はゼロ。拡張エラー情報を取得するには GetLastError
を呼ぶ。ユーザが操作をキャンセルして lpProgressRoutine が PROGRESS_CANCEL
を返した場合、CopyFileEx はゼロを返し GetLastError は ERROR_REQUEST_ABORTED
を返す。この場合、部分的にコピーされたコピー先ファイルは削除される。lpProgressRoutine が PROGRESS_STOP
を返した場合、CopyFileEx はゼロを返し GetLastError は ERROR_REQUEST_ABORTED
を返す。この場合、部分的にコピーされたコピー先ファイルはそのまま残される。

[備考]
この関数は拡張属性、OLE 構造化ストレージ、NTFS
代替データストリーム、セキュリティリソース属性、ファイル属性を保持する。Windows 7、Windows Server 2008
R2、Windows Server 2008、Windows Vista、Windows Server 2003、Windows XP:
既存ファイルのセキュリティリソース属性 (ATTRIBUTE_SECURITY_INFORMATION) は、Windows 8 および
Windows Server 2012 までは新しいファイルにコピーされなかった。既存ファイルのセキュリティリソースプロパティ
(ATTRIBUTE_SECURITY_INFORMATION) は新しいファイルにコピーされる。Windows 7、Windows
Server 2008 R2、Windows Server 2008、Windows Vista、Windows Server
2003、Windows XP: 既存ファイルのセキュリティリソースプロパティは、Windows 8 および Windows Server
2012 までは新しいファイルにコピーされなかった。コピー先ファイルがすでに存在し FILE_ATTRIBUTE_HIDDEN または
FILE_ATTRIBUTE_READONLY 属性が設定されている場合、この関数は ERROR_ACCESS_DENIED
で失敗する。暗号化されたファイルを CopyFileEx
でコピーする場合、関数はソースファイルの暗号化に使われた鍵でコピー先ファイルを暗号化しようとする。それができない場合、既定の鍵で暗号化を試みる。どちらもできない場合、CopyFileEx
は ERROR_ENCRYPTION_FAILED エラーコードで失敗する。コピー先ファイルが暗号化できない場合でも CopyFileEx
にコピー操作を完了させたいなら、dwCopyFlags パラメータに
COPY_FILE_ALLOW_DECRYPTED_DESTINATION を含める。
COPY_FILE_COPY_SYMLINK が指定された場合、以下のルールが適用される。
（以下省略）


%index
CopyFileTransactedW
既存ファイルを新しいファイルにトランザクション操作としてコピーし、コールバック関数を通じて進捗をアプリケーションに通知する。(Unicode)
%group
Win32 kernel32
%prm
lpExistingFileName, lpNewFileName, lpProgressRoutine, lpData, pbCancel, dwCopyFlags, hTransaction
lpExistingFileName : [wstr] 既存ファイルの名前。この関数の ANSI 版では、名前は MAX_PATH 文字に制限されている。この制限を 32,767 ワイド文字まで拡張するには、Unicode 版を呼びパスの先頭に "\\?\" を付ける。詳細は Naming a File を参照。lpExistingFileName が存在しない場合、CopyFileTransacted 関数は失敗し、GetLastError 関数は ERROR_FILE_NOT_FOUND を返す。ファイルはローカルコンピュータ上に存在しなければならない。そうでない場合、関数は失敗し最終エラーコードは ERROR_TRANSACTIONS_UNSUPPORTED_REMOTE に設定される。
lpNewFileName : [wstr] 新しいファイルの名前。この関数の ANSI 版では、名前は MAX_PATH 文字に制限されている。この制限を 32,767 ワイド文字まで拡張するには、Unicode 版を呼びパスの先頭に "\\?\" を付ける。詳細は Naming a File を参照。
lpProgressRoutine : [int] ファイルの一部がコピーされるたびに呼ばれる、LPPROGRESS_ROUTINE 型のコールバック関数のアドレス。このパラメータは NULL でも構わない。進捗コールバック関数の詳細は CopyProgressRoutine 関数を参照。
lpData : [intptr] コールバック関数に渡される引数。このパラメータは NULL でも構わない。
pbCancel : [var] コピー操作中にこのフラグが TRUE に設定されると、操作がキャンセルされる。そうでなければコピー操作は完了まで続行される。
dwCopyFlags : [int] ファイルのコピー方法を指定するフラグ。このパラメータは以下の値の組み合わせで指定できる。
hTransaction : [intptr] トランザクションへのハンドル。このハンドルは CreateTransaction 関数が返す。
%inst

既存ファイルを新しいファイルにトランザクション操作としてコピーし、コールバック関数を通じて進捗をアプリケーションに通知する。(Unicode)

[戻り値]
関数が成功した場合、戻り値はゼロ以外。関数が失敗した場合、戻り値はゼロ。拡張エラー情報を取得するには GetLastError
を呼ぶ。ユーザが操作をキャンセルして lpProgressRoutine が PROGRESS_CANCEL
を返した場合、CopyFileTransacted はゼロを返し GetLastError は ERROR_REQUEST_ABORTED
を返す。この場合、部分的にコピーされたコピー先ファイルは削除される。lpProgressRoutine が PROGRESS_STOP
を返した場合、CopyFileTransacted はゼロを返し GetLastError は ERROR_REQUEST_ABORTED
を返す。この場合、部分的にコピーされたコピー先ファイルはそのまま残される。すでにロールバックされたトランザクションのハンドルでこの関数を呼ぶと、CopyFileTransacted
は ERROR_TRANSACTION_NOT_ACTIVE または ERROR_INVALID_TRANSACTION を返す。

[備考]
この関数は拡張属性、OLE 構造化ストレージ、NTFS 代替データストリーム、セキュリティ属性、ファイル属性を保持する。Windows
7、Windows Server 2008 R2、Windows Server 2008、Windows Vista:
既存ファイルのセキュリティリソース属性 (ATTRIBUTE_SECURITY_INFORMATION) は、Windows 8 および
Windows Server 2012 までは新しいファイルにコピーされなかった。コピー先ファイルがすでに存在し
FILE_ATTRIBUTE_HIDDEN または FILE_ATTRIBUTE_READONLY 属性が設定されている場合、この関数は
ERROR_ACCESS_DENIED で失敗する。暗号化されたファイルは TxF ではサポートされない。
COPY_FILE_COPY_SYMLINK が指定された場合、以下のルールが適用される。
（以下省略）


%index
CopyLZFile
(no summary)
%group
Win32 kernel32
%prm
hfSource, hfDest
hfSource : [int] 
hfDest : [int] 
%inst



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
CreateActCtxW
CreateActCtx 関数はアクティベーションコンテキストを作成する。(Unicode)
%group
Win32 kernel32
%prm
pActCtx
pActCtx : [var] 作成するアクティベーションコンテキストに関する情報を含む ACTCTX 構造体へのポインタ。
%inst
CreateActCtx 関数はアクティベーションコンテキストを作成する。(Unicode)

[戻り値]
関数が成功した場合、アクティベーションコンテキストへのハンドルを返す。そうでなければ INVALID_HANDLE_VALUE
を返す。本関数は GetLastError で取得可能なエラーを設定する。例については Retrieving the Last-Error
Code を参照。エラーコードの一覧は System Error Codes を参照。

[備考]
ACTCTX の dwFlags の未定義ビットはすべて 0 に設定する。未定義ビットが 0
に設定されていない場合、CreateActCtx の呼び出しは失敗し無効なパラメータエラーコードを返す。CreateActCtx
から返されたハンドルは ActivateActCtx の呼び出しに渡され、現在のスレッドのコンテキストをアクティブ化する。
> [!NOTE] > winbase.h ヘッダーは CreateActCtx を UNICODE プリプロセッサ定数の定義に基づいて
ANSI 版または Unicode
版を自動選択するエイリアスとして定義している。エンコード中立エイリアスとそうでないコードを混在させると、コンパイルエラーや実行時エラーにつながる不一致が生じる可能性がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
CreateBoundaryDescriptorW
CreateBoundaryDescriptorW (Unicode) 関数 (namespaceapi.h) は境界記述子を作成する。
%group
Win32 kernel32
%prm
Name, Flags
Name : [wstr] 境界記述子の名前。
Flags : [int] ビット **OR** 演算で組み合わせる以下のフラグの組み合わせ。 | フラグ | 説明 | | --------------------------------------------------------------- | ----------- | | **CREATE_BOUNDARY_DESCRIPTOR_ADD_APPCONTAINER_SID** (0x01)**注意:** この値は Windows 8 より前ではサポートされない。     | appcontainer プロセスで境界記述子を作成するのに必要。プロデューサーかコンシューマーかに関わらず必要。       |
%inst
CreateBoundaryDescriptorW (Unicode) 関数 (namespaceapi.h) は境界記述子を作成する。

[戻り値]
関数が成功した場合、戻り値は境界記述子へのハンドル。関数が失敗した場合、戻り値は NULL。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
新しい境界記述子には少なくとも 1 つのセキュリティ識別子 (SID) が必要。境界記述子に SID を追加するには
AddSIDToBoundaryDescriptor
関数を使う。この関数を使用するアプリケーションをコンパイルするには、_WIN32_WINNT を 0x0600 以降として定義する。


%index
CreateConsoleScreenBuffer
CreateConsoleScreenBuffer 関数は Windows コンソール用のスクリーンバッファを作成する。
%group
Win32 kernel32
%prm
dwDesiredAccess, dwShareMode, lpSecurityAttributes, dwFlags, lpScreenBufferData
dwDesiredAccess : [int] コンソールスクリーンバッファへのアクセス。アクセス権の一覧は [Console Buffer Security and Access Rights](console-buffer-security-and-access-rights.md) を参照。
dwShareMode : [int] このパラメータはゼロ（バッファを共有できないことを示す）または以下の値のいずれか 1 つ以上の組み合わせが指定できる。 | 値 | 意味 | |-|-| | **FILE_SHARE_READ** 0x00000001 | コンソールスクリーンバッファに対する他の開く操作を読み取りアクセスで実行できる。 | | **FILE_SHARE_WRITE** 0x00000002 | コンソールスクリーンバッファに対する他の開く操作を書き込みアクセスで実行できる。 |
lpSecurityAttributes : [var] 返されるハンドルが子プロセスに継承可能かどうかを決定する [**SECURITY\_ATTRIBUTES**](/previous-versions/windows/desktop/legacy/aa379560(v=vs.85)) 構造体へのポインタ。*lpSecurityAttributes* が **NULL** の場合、ハンドルは継承できない。構造体の **lpSecurityDescriptor** メンバーが新しいコンソールスクリーンバッファのセキュリティ記述子を指定する。*lpSecurityAttributes* が **NULL** の場合、コンソールスクリーンバッファには既定のセキュリティ記述子が付与される。コンソールスクリーンバッファの既定セキュリティ記述子の ACL は作成者のプライマリトークンまたは impersonation トークンから取得される。
dwFlags : [int] 作成するコンソールスクリーンバッファの種類。サポートされているのは **CONSOLE\_TEXTMODE\_BUFFER** のみ。
lpScreenBufferData : [intptr] 予約済み。**NULL** を指定すべきである。
%inst
CreateConsoleScreenBuffer 関数は Windows コンソール用のスクリーンバッファを作成する。

[戻り値]
関数が成功した場合、戻り値は新しいコンソールスクリーンバッファへのハンドル。関数が失敗した場合、戻り値は
**INVALID\_HANDLE\_VALUE**。拡張エラー情報を取得するには
[**GetLastError**](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror)
を呼ぶ。

[備考]
コンソールは複数のスクリーンバッファを持てるが、アクティブなスクリーンバッファは 1
つだけである。非アクティブなスクリーンバッファも読み書きでアクセスできるが、表示されるのはアクティブなスクリーンバッファのみ。新しいスクリーンバッファをアクティブにするには
[**SetConsoleActiveScreenBuffer**](setconsoleactivescreenbuffer.md)
関数を使う。新しく作成されたスクリーンバッファは、この関数を呼んだ時点のアクティブスクリーンバッファから一部のプロパティをコピーする。動作は以下のとおり:
- `フォント` - アクティブスクリーンバッファからコピー - `表示ウィンドウサイズ` - アクティブスクリーンバッファからコピー -
`バッファサイズ` - `表示ウィンドウサイズ` に一致（コピーではない） - `既定属性` (色) -
アクティブスクリーンバッファからコピー - `既定ポップアップ属性` (色) - アクティブスクリーンバッファからコピー
呼び出し側プロセスは、*dwDesiredAccess*
パラメータで指定したアクセス制限の範囲内で、コンソールスクリーンバッファへのハンドルを必要とする任意の関数で返されたハンドルを使用できる。呼び出し側プロセスは
[**DuplicateHandle**](/windows/win32/api/handleapi/nf-handleapi-duplicatehandle)
関数を使って、元のハンドルとは異なるアクセスや継承性を持つスクリーンバッファハンドルの複製を作成できる。ただし
**DuplicateHandle**
は（継承を除いて）別プロセスで有効な複製を作成することはできない。コンソールスクリーンバッファのハンドルを閉じるには
[**CloseHandle**](/windows/win32/api/handleapi/nf-handleapi-closehandle)
関数を使う。[!INCLUDE
[no-vt-equiv-alt-buf](./includes/no-vt-equiv-alt-buf.md)]


%index
CreateDirectoryW
新しいディレクトリを作成する。(CreateDirectoryW)
%group
Win32 kernel32
%prm
lpPathName, lpSecurityAttributes
lpPathName : [wstr] 作成するディレクトリのパス。この関数の ANSI 版では、パスの既定の文字列サイズ制限は 248 文字 (MAX_PATH - 8.3 ファイル名のための余裕) である。この制限を 32,767 ワイド文字まで拡張するには、Unicode 版を呼びパスの先頭に "\\\\?\\" を付ける。詳細は Naming a File を参照。
lpSecurityAttributes : [var] SECURITY_ATTRIBUTES 構造体へのポインタ。構造体の lpSecurityDescriptor メンバーが新しいディレクトリのセキュリティ記述子を指定する。lpSecurityAttributes が NULL の場合、ディレクトリは既定のセキュリティ記述子を取得する。ディレクトリの既定セキュリティ記述子の ACL は親ディレクトリから継承される。対象ファイルシステムは、このパラメータを有効にするためにファイルとディレクトリに対するセキュリティをサポートしている必要がある（GetVolumeInformation が FS_PERSISTENT_ACLS を返すときに示される）。
%inst
新しいディレクトリを作成する。(CreateDirectoryW)

[戻り値]
関数が成功した場合、戻り値はゼロ以外。関数が失敗した場合、戻り値はゼロ。拡張エラー情報を取得するには GetLastError
を呼ぶ。想定されるエラーは以下のとおり。
（以下省略）

[備考]
NTFS
ファイルシステムのような一部のファイルシステムは個々のファイルとディレクトリの圧縮または暗号化をサポートしている。そのようなファイルシステムでフォーマットされたボリュームでは、新しいディレクトリは親ディレクトリの圧縮と暗号化の属性を継承する。アプリケーションは
CreateFile を FILE_FLAG_BACKUP_SEMANTICS
フラグ付きで呼ぶことでディレクトリへのハンドルを取得できる。コード例については CreateFile
を参照。継承機能をサポートするため、このオブジェクトのセキュリティ記述子を問い合わせる関数は、発見的に継承が有効であることを判定して報告する場合がある。詳細は
Automatic Propagation of Inheritable ACEs を参照。Windows 8 および Windows
Server 2012 では、この関数は以下の技術でサポートされている。
（以下省略）


%index
CreateDirectoryExW
指定されたテンプレートディレクトリの属性を持つ新しいディレクトリを作成する。(Unicode)
%group
Win32 kernel32
%prm
lpTemplateDirectory, lpNewDirectory, lpSecurityAttributes
lpTemplateDirectory : [wstr] 新しいディレクトリを作成する際にテンプレートとして使用するディレクトリのパス。この関数の ANSI 版では、名前は MAX_PATH 文字に制限されている。この制限を 32,767 ワイド文字まで拡張するには、Unicode 版を呼びパスの先頭に "\\?\" を付ける。詳細は Naming a File を参照。ヒント: Windows 10 バージョン 1607 以降、Unicode 版 (CreateDirectoryExW) では、"\\?\" を前置せずに MAX_PATH 文字数制限を取り除くことにオプトインできる。1 パスセグメントあたり 255 文字の制限は引き続き適用される。詳細は Naming Files, Paths, and Namespaces の "Maximum Path Length Limitation" セクションを参照。
lpNewDirectory : [wstr] 作成するディレクトリのパス。この関数の ANSI 版では、名前は MAX_PATH 文字に制限されている。この制限を 32,767 ワイド文字まで拡張するには、Unicode 版を呼びパスの先頭に "\\?\" を付ける。詳細は Naming a File を参照。ヒント: Windows 10 バージョン 1607 以降、Unicode 版 (CreateDirectoryExW) では、"\\?\" を前置せずに MAX_PATH 文字数制限を取り除くことにオプトインできる。1 パスセグメントあたり 255 文字の制限は引き続き適用される。詳細は Naming Files, Paths, and Namespaces の "Maximum Path Length Limitation" セクションを参照。
lpSecurityAttributes : [var] SECURITY_ATTRIBUTES 構造体へのポインタ。構造体の lpSecurityDescriptor メンバーが新しいディレクトリのセキュリティ記述子を指定する。lpSecurityAttributes が NULL の場合、ディレクトリは既定のセキュリティ記述子を取得する。ディレクトリの既定セキュリティ記述子に含まれるアクセス制御リスト (ACL) は親ディレクトリから継承される。対象ファイルシステムは、このパラメータを有効にするためにファイルとディレクトリに対するセキュリティをサポートしている必要がある。これは GetVolumeInformation が FS_PERSISTENT_ACLS を返すときに示される。
%inst
指定されたテンプレートディレクトリの属性を持つ新しいディレクトリを作成する。(Unicode)

[戻り値]
関数が成功した場合、戻り値はゼロ以外。関数が失敗した場合、戻り値はゼロ (0)。拡張エラー情報を取得するには GetLastError
を呼ぶ。想定されるエラーは以下のとおり。
（以下省略）

[備考]
CreateDirectoryEx
関数は、他のディレクトリからストリーム情報を継承するディレクトリを作成できる。この関数は例えば、属性としてディレクトリ内容を正しく識別するために必要なリソースストリームを持つ
Macintosh ディレクトリを使う場合に有用である。NTFS
ファイルシステムのような一部のファイルシステムは個々のファイルとディレクトリの圧縮または暗号化をサポートしている。そのようなファイルシステムでフォーマットされたボリュームでは、新しいディレクトリは親ディレクトリの圧縮と暗号化の属性を継承する。CreateFile
関数を FILE_FLAG_BACKUP_SEMANTICS
フラグ付きで呼ぶことでディレクトリへのハンドルを取得できる。コード例については CreateFile
を参照。継承機能をサポートするため、このオブジェクトのセキュリティ記述子を問い合わせる関数は、発見的に継承が有効であることを判定して報告する場合がある。詳細は
Automatic Propagation of Inheritable ACEs を参照。Windows 8 および Windows
Server 2012 では、この関数は以下の技術でサポートされている。
（以下省略）


%index
CreateDirectoryTransactedW
指定されたテンプレートディレクトリの属性を持つ新しいディレクトリをトランザクション操作として作成する。(Unicode)
%group
Win32 kernel32
%prm
lpTemplateDirectory, lpNewDirectory, lpSecurityAttributes, hTransaction
lpTemplateDirectory : [wstr] 新しいディレクトリを作成する際にテンプレートとして使用するディレクトリのパス。このパラメータは NULL でも構わない。この関数の ANSI 版では、名前は MAX_PATH 文字に制限されている。この制限を 32,767 ワイド文字まで拡張するには、Unicode 版を呼びパスの先頭に "\\?\" を付ける。詳細は Naming a File を参照。ディレクトリはローカルコンピュータ上に存在しなければならない。そうでない場合、関数は失敗し最終エラーコードは ERROR_TRANSACTIONS_UNSUPPORTED_REMOTE に設定される。
lpNewDirectory : [wstr] 作成するディレクトリのパス。この関数の ANSI 版では、名前は MAX_PATH 文字に制限されている。この制限を 32,767 ワイド文字まで拡張するには、Unicode 版を呼びパスの先頭に "\\?\" を付ける。詳細は Naming a File を参照。
lpSecurityAttributes : [var] SECURITY_ATTRIBUTES 構造体へのポインタ。構造体の lpSecurityDescriptor メンバーが新しいディレクトリのセキュリティ記述子を指定する。lpSecurityAttributes が NULL の場合、ディレクトリは既定のセキュリティ記述子を取得する。ディレクトリの既定セキュリティ記述子に含まれるアクセス制御リスト (ACL) は親ディレクトリから継承される。対象ファイルシステムは、このパラメータを有効にするためにファイルとディレクトリに対するセキュリティをサポートしている必要がある。これは GetVolumeInformation が FS_PERSISTENT_ACLS を返すときに示される。
hTransaction : [intptr] トランザクションへのハンドル。このハンドルは CreateTransaction 関数が返す。
%inst
指定されたテンプレートディレクトリの属性を持つ新しいディレクトリをトランザクション操作として作成する。(Unicode)

[戻り値]
関数が成功した場合、戻り値はゼロ以外。関数が失敗した場合、戻り値はゼロ (0)。拡張エラー情報を取得するには GetLastError
を呼ぶ。想定されるエラーは以下のとおり。
（以下省略）

[備考]
CreateDirectoryTransacted
関数は、他のディレクトリからストリーム情報を継承するディレクトリを作成できる。この関数は例えば、属性としてディレクトリ内容を正しく識別するために必要なリソースストリームを持つ
Macintosh ディレクトリを使う場合に有用である。NTFS
ファイルシステムのような一部のファイルシステムは個々のファイルとディレクトリの圧縮または暗号化をサポートしている。そのようなファイルシステムでフォーマットされたボリュームでは、新しいディレクトリは親ディレクトリの圧縮と暗号化の属性を継承する。暗号化が無効になっている親ディレクトリの下に子ディレクトリを作成しようとすると、この関数は
ERROR_EFS_NOT_ALLOWED_IN_TRANSACTION で失敗する。CreateFileTransacted 関数を
FILE_FLAG_BACKUP_SEMANTICS フラグ付きで呼ぶことでディレクトリへのハンドルを取得できる。Windows 8
および Windows Server 2012 では、この関数は以下の技術でサポートされている。
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
CreateEventExW
名前付きまたは名前なしのイベントオブジェクトを作成または開き、そのオブジェクトへのハンドルを返す。(Unicode)
%group
Win32 kernel32
%prm
lpEventAttributes, lpName, dwFlags, dwDesiredAccess
lpEventAttributes : [var] SECURITY_ATTRIBUTES 構造体へのポインタ。lpEventAttributes が NULL の場合、イベントハンドルは子プロセスに継承できない。構造体の lpSecurityDescriptor メンバーが新しいイベントのセキュリティ記述子を指定する。lpEventAttributes が NULL の場合、イベントは既定のセキュリティ記述子を取得する。イベントの既定セキュリティ記述子の ACL は作成者のプライマリトークンまたは impersonation トークンから取得される。
lpName : [wstr] イベントオブジェクトの名前。名前は MAX_PATH 文字に制限される。名前比較は大文字小文字を区別する。lpName が NULL の場合、名前なしでイベントオブジェクトが作成される。lpName が同じ名前空間内の他の種類のオブジェクト（既存のセマフォ、ミューテックス、待機可能タイマ、ジョブ、ファイルマッピングオブジェクトなど）の名前と一致する場合、関数は失敗し GetLastError は ERROR_INVALID_HANDLE を返す。これはこれらのオブジェクトが同じ名前空間を共有するために起こる。名前にはグローバル名前空間またはセッション名前空間にオブジェクトを明示的に作成するための "Global\" または "Local\" プレフィックスを付けられる。名前の残りの部分はバックスラッシュ文字 (\\) を除く任意の文字を含められる。詳細は Kernel Object Namespaces を参照。高速ユーザー切り替えはターミナルサービスセッションを使用して実装される。カーネルオブジェクト名は、アプリケーションが複数ユーザーをサポートできるよう、ターミナルサービス用に示されているガイドラインに従う必要がある。オブジェクトはプライベート名前空間に作成できる。詳細は Object Namespaces を参照。
dwFlags : [int] 
dwDesiredAccess : [int] イベントオブジェクトのアクセスマスク。アクセス権の一覧は Synchronization Object Security and Access Rights を参照。
%inst
名前付きまたは名前なしのイベントオブジェクトを作成または開き、そのオブジェクトへのハンドルを返す。(Unicode)

[戻り値]

関数が成功した場合、戻り値はイベントオブジェクトへのハンドル。関数呼び出し前に名前付きイベントオブジェクトが存在していた場合、関数は既存オブジェクトへのハンドルを返し、GetLastError
は ERROR_ALREADY_EXISTS を返す。
関数が失敗した場合、戻り値は NULL。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]

呼び出し側プロセスの任意のスレッドは、待機関数の呼び出しでイベントオブジェクトハンドルを指定できる。単一オブジェクト待機関数は指定オブジェクトの状態がシグナルされたときに戻る。複数オブジェクト待機関数は指定されたオブジェクトのいずれか
1 つ、またはすべてがシグナルされたときに戻るように指示できる。待機関数が戻ると、待機中のスレッドは実行を続けるために解放される。
イベントオブジェクトの初期状態は dwFlags パラメータで指定される。イベントオブジェクトの状態をシグナルに設定するには
SetEvent 関数を使う。イベントオブジェクトの状態を非シグナルにリセットするには ResetEvent 関数を使う。
マニュアルリセットイベントオブジェクトの状態がシグナルになると、ResetEvent
関数で明示的に非シグナルにリセットされるまでシグナル状態のままとなる。オブジェクトの状態がシグナルである間、待機中のスレッドや、指定イベントオブジェクトに対して後続の待機を開始するスレッドは何個でも解放される。

複数のプロセスが同じイベントオブジェクトのハンドルを持てるので、プロセス間同期にオブジェクトを使用できる。以下のオブジェクト共有機構が利用できる:
（以下省略）


%index
CreateFiber
ファイバオブジェクトを割り当て、スタックを割り当て、指定された開始アドレス（通常はファイバ関数）から実行を開始するように設定する。この関数はファイバをスケジュールしない。(CreateFiber)
%group
Win32 kernel32
%prm
dwStackSize, lpStartAddress, lpParameter
dwStackSize : [int] スタックの初期コミットサイズ（バイト単位）。このパラメータがゼロの場合、新しいファイバは実行ファイルの既定コミットスタックサイズを使用する。詳細は Thread Stack Size を参照。
lpStartAddress : [int] ファイバが実行するアプリケーション定義の関数へのポインタ。ファイバの開始アドレスを表す。新しく作成されたファイバの実行は、別のファイバがこのアドレスで SwitchToFiber 関数を呼ぶまで開始されない。ファイバコールバック関数の詳細は FiberProc を参照。
lpParameter : [intptr] ファイバに渡される変数へのポインタ。ファイバは GetFiberData マクロを使ってこのデータを取得できる。
%inst

ファイバオブジェクトを割り当て、スタックを割り当て、指定された開始アドレス（通常はファイバ関数）から実行を開始するように設定する。この関数はファイバをスケジュールしない。(CreateFiber)

[戻り値]
関数が成功した場合、戻り値はファイバのアドレス。関数が失敗した場合、戻り値は NULL。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
プロセスが作成できるファイバの数は利用可能な仮想メモリによって制限される。例えば、1
メガバイトの予約スタック領域で各ファイバを作成すると、最大 2028 個のファイバを作成できる。モジュール定義 (.def) ファイルの
STACKSIZE ステートメントや CreateFiberEx
を使って既定スタックサイズを減らせば、より多くのファイバを作成できる。ただし、これほど多くのファイバを作成するのではなく、代替戦略で要求を処理したほうがアプリケーションのパフォーマンスは向上する。スレッドが
SwitchToFiber 関数でファイバをスケジュールする前に、スレッドに関連付けられたファイバがあるように
ConvertThreadToFiber
関数を呼ぶ必要がある。この関数を使用するアプリケーションをコンパイルするには、_WIN32_WINNT を 0x0400
以降として定義する。詳細は Using the Windows Headers を参照。


%index
CreateFiberEx
ファイバオブジェクトを割り当て、スタックを割り当て、指定された開始アドレス（通常はファイバ関数）から実行を開始するように設定する。この関数はファイバをスケジュールしない。(CreateFiberEx)
%group
Win32 kernel32
%prm
dwStackCommitSize, dwStackReserveSize, dwFlags, lpStartAddress, lpParameter
dwStackCommitSize : [int] スタックの初期コミットサイズ（バイト単位）。このパラメータがゼロの場合、新しいファイバは実行ファイルの既定コミットスタックサイズを使用する。詳細は Thread Stack Size を参照。
dwStackReserveSize : [int] スタックの初期予約サイズ（バイト単位）。このパラメータがゼロの場合、新しいファイバは実行ファイルの既定予約スタックサイズを使用する。詳細は Thread Stack Size を参照。
dwFlags : [int] このパラメータがゼロの場合、x86 システムで浮動小数点状態は切り替えられず、ファイバが浮動小数点演算を使うとデータが破損する可能性がある。FIBER_FLAG_FLOAT_SWITCH の場合、ファイバに対して浮動小数点状態が切り替えられる。Windows XP: FIBER_FLAG_FLOAT_SWITCH フラグはサポートされない。
lpStartAddress : [int] ファイバが実行するアプリケーション定義の関数へのポインタ。ファイバの開始アドレスを表す。新しく作成されたファイバの実行は、別のファイバがこのアドレスで SwitchToFiber 関数を呼ぶまで開始されない。ファイバコールバック関数の詳細は FiberProc を参照。
lpParameter : [intptr] ファイバに渡される変数へのポインタ。ファイバは GetFiberData マクロを使ってこのデータを取得できる。
%inst

ファイバオブジェクトを割り当て、スタックを割り当て、指定された開始アドレス（通常はファイバ関数）から実行を開始するように設定する。この関数はファイバをスケジュールしない。(CreateFiberEx)

[戻り値]
関数が成功した場合、戻り値はファイバのアドレス。関数が失敗した場合、戻り値は NULL。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
プロセスが作成できるファイバの数は利用可能な仮想メモリによって制限される。既定では、各ファイバは 1
メガバイトの予約スタック領域を持つ。したがって、最大 2028
個のファイバを作成できる。既定のスタックサイズを減らせば、より多くのファイバを作成できる。ただし、代替戦略で要求を処理したほうがアプリケーションのパフォーマンスは向上する。スレッドが
SwitchToFiber 関数でファイバをスケジュールする前に、スレッドに関連付けられたファイバがあるように
ConvertThreadToFiber
関数を呼ぶ必要がある。この関数を使用するアプリケーションをコンパイルするには、_WIN32_WINNT を 0x0400
以降として定義する。詳細は Using the Windows Headers を参照。


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
CreateFile2
ファイルまたは I/O デバイスを作成または開く。
%group
Win32 kernel32
%prm
lpFileName, dwDesiredAccess, dwShareMode, dwCreationDisposition, pCreateExParams
lpFileName : [wstr] 作成または開くファイルまたはデバイスの名前。特殊なデバイス名については Defining an MS-DOS Device Name を参照。ファイルストリームを作成するには、ファイル名、コロン、ストリーム名の順に指定する。詳細は File Streams を参照。ヒント: Windows 10 バージョン 1607 以降、"\\?\" を前置せずに MAX_PATH 制限を取り除くことにオプトインできる。詳細は Naming Files, Paths, and Namespaces の "Maximum Path Length Limitation" セクションを参照。
dwDesiredAccess : [int] ファイルまたはデバイスに対する要求アクセス。読み取り、書き込み、両方、またはどちらでもない (ゼロ) にまとめられる。最も一般的に使われる値は GENERIC_READ、GENERIC_WRITE、またはその両方 (GENERIC_READ | GENERIC_WRITE) である。詳細は Generic Access Rights、File Security and Access Rights、File Access Rights Constants、ACCESS_MASK を参照。このパラメータがゼロの場合、アプリケーションは GENERIC_READ アクセスが拒否されるような場合であっても、ファイル、ディレクトリ、デバイスの属性などの特定のメタデータをアクセスせずに問い合わせることができる。開いているハンドルを持つ既存の open 要求で指定された共有モードと競合するアクセスモードを要求することはできない。詳細はこのトピックの備考および Creating and Opening Files を参照。
dwShareMode : [int] ファイルまたはデバイスの要求共有モード。読み取り、書き込み、両方、削除、これらすべて、またはどれでもない（以下の表を参照）が指定できる。属性または拡張属性へのアクセス要求はこのフラグの影響を受けない。このパラメータがゼロで CreateFile2 が成功した場合、ファイルまたはデバイスは共有できず、ハンドルが閉じられるまで再度開けない。詳細は備考を参照。開いているハンドルを持つ既存の要求で指定されたアクセスモードと競合する共有モードを要求することはできない。CreateFile2 は失敗し、GetLastError 関数は ERROR_SHARING_VIOLATION を返す。別プロセスがファイルやデバイスを開いている間に共有を有効にするには、
dwCreationDisposition : [int] 存在するか存在しないファイルまたはデバイスに対して行う動作。ファイル以外のデバイスでは、このパラメータは通常 OPEN_EXISTING に設定する。詳細は備考を参照。
pCreateExParams : [var] 省略可能な CREATEFILE2_EXTENDED_PARAMETERS 構造体へのポインタ。
%inst
ファイルまたは I/O デバイスを作成または開く。

[戻り値]

関数が成功した場合、戻り値は指定されたファイル、デバイス、名前付きパイプ、またはメールスロットへの開かれたハンドル。関数が失敗した場合、戻り値は
INVALID_HANDLE_VALUE。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
CreateFile2 関数を使用するアプリケーションをコンパイルするには、_WIN32_WINNT マクロを 0x0602
以降として定義する。詳細は Using the Windows Headers を参照。CreateFile2 は Windows
開発者が利用できるほとんどの種類の I/O
デバイスや仕組みと、ファイルの相互作用をサポートする。このセクションでは、異なるコンテキストや異なる I/O タイプで
CreateFile2
を使用する際に開発者が経験する可能性のあるさまざまな問題を扱う。本文では、ファイルという語は実際のファイルシステム上のファイルに格納されたデータを指す場合にのみ使用するよう努めているが、歴史的な理由によって定数名やパラメータ名ではファイル様の仕組みをサポートする
I/O オブジェクト全般を指してファイルという語が使われることもある。アプリケーションが CreateFile2
から返されたオブジェクトハンドルを使い終えたら、CloseHandle
関数を使ってハンドルを閉じる。これはシステムリソースを解放するだけでなく、ファイルやデバイスの共有やディスクへのデータのコミットなどに広く影響する。具体的な詳細はこのトピック内で必要に応じて記述される。NTFS
ファイルシステムのような一部のファイルシステムは個々のファイルとディレクトリの圧縮または暗号化をサポートしている。そのようなファイルシステムがマウントされたボリュームでは、新しいファイルは親ディレクトリの圧縮と暗号化の属性を継承する。CreateFile2
を使ってファイルやディレクトリの圧縮、解凍、復号化を制御することはできない。詳細は Creating and Opening
Files、File Compression and Decompression、File Encryption
を参照。pCreateExParams パラメータに渡された CREATEFILE2_EXTENDED_PARAMETERS 構造体の
lpSecurityAttributes メンバーが NULL の場合、CreateFile2
から返されたハンドルはアプリケーションが作成する子プロセスに継承されない。このメンバーに関する以下の情報も適用される:
（以下省略）


%index
CreateFileMappingW
指定ファイルに対して名前付きまたは名前なしのファイルマッピングオブジェクトを作成または開く。(CreateFileMappingW)
%group
Win32 kernel32
%prm
hFile, lpFileMappingAttributes, flProtect, dwMaximumSizeHigh, dwMaximumSizeLow, lpName
hFile : [intptr] ファイルマッピングオブジェクトを作成する元のファイルへのハンドル。ファイルは flProtect パラメータが指定する保護フラグと互換性のあるアクセス権で開かれている必要がある。必須ではないが、マップ対象のファイルは排他アクセスで開くことが推奨される。詳細は File Security and Access Rights を参照。hFile が INVALID_HANDLE_VALUE の場合、呼び出し側プロセスは dwMaximumSizeHigh と dwMaximumSizeLow パラメータでファイルマッピングオブジェクトのサイズも指定する必要がある。この場合、CreateFileMapping はファイルシステム上のファイルではなくシステムページングファイルがバックする、指定サイズのファイルマッピングオブジェクトを作成する。
lpFileMappingAttributes : [var] 返されるハンドルが子プロセスに継承可能かどうかを決定する SECURITY_ATTRIBUTES 構造体へのポインタ。SECURITY_ATTRIBUTES 構造体の lpSecurityDescriptor メンバーが新しいファイルマッピングオブジェクトのセキュリティ記述子を指定する。lpAttributes が NULL の場合、ハンドルは継承できず、ファイルマッピングオブジェクトは既定のセキュリティ記述子を取得する。ファイルマッピングオブジェクトの既定セキュリティ記述子の ACL は作成者のプライマリトークンまたは impersonation トークンから取得される。詳細は File Mapping Security and Access Rights を参照。
flProtect : [int] ファイルマッピングオブジェクトのページ保護を指定する。このオブジェクトのすべてのマップされたビューは、この保護と互換性がなければならない。
dwMaximumSizeHigh : [int] ファイルマッピングオブジェクトの最大サイズの上位 DWORD。
dwMaximumSizeLow : [int] ファイルマッピングオブジェクトの最大サイズの下位 DWORD。このパラメータと dwMaximumSizeHigh がともに 0 の場合、ファイルマッピングオブジェクトの最大サイズは hFile が示すファイルの現在のサイズに等しい。長さ 0 のファイルをマップしようとすると ERROR_FILE_INVALID エラーコードで失敗する。アプリケーションは長さ 0 のファイルを検査して拒否するべきである。
lpName : [wstr] ファイルマッピングオブジェクトの名前。このパラメータが既存のマッピングオブジェクトの名前と一致する場合、関数は flProtect が指定する保護でオブジェクトへのアクセスを要求する。NULL の場合、名前なしでファイルマッピングオブジェクトが作成される。lpName が既存のイベント、セマフォ、ミューテックス、待機可能タイマ、またはジョブオブジェクトの名前と一致する場合、関数は失敗し GetLastError 関数は ERROR_INVALID_HANDLE を返す。これはこれらのオブジェクトが同じ名前空間を共有するために起こる。名前にはグローバル名前空間またはセッション名前空間にオブジェクトを明示的に作成するための "Global\" または "Local\" プレフィックスを付けられる。名前の残りの部分はバックスラッシュ文字 (\\) を除く任意の文字を含められる。セッション 0 以外のセッションからグローバル名前空間にファイルマッピングオブジェクトを作成するには SeCreateGlobalPrivilege 特権が必要。詳細は Kernel Object Namespaces を参照。高速ユーザー切り替えはターミナルサービスセッションを使用して実装される。最初にログオンしたユーザーがセッション 0、次にログオンしたユーザーがセッション 1、以降同様。カーネルオブジェクト名はアプリケーションが複数ユーザーをサポートできるようターミナルサービスのガイドラインに従う必要がある。
%inst
指定ファイルに対して名前付きまたは名前なしのファイルマッピングオブジェクトを作成または開く。(CreateFileMappingW)

[戻り値]

関数が成功した場合、戻り値は新しく作成されたファイルマッピングオブジェクトへのハンドル。関数呼び出し前にオブジェクトが存在していた場合、関数は既存オブジェクトへのハンドル（指定サイズではなく現在のサイズ）を返し、GetLastError
は ERROR_ALREADY_EXISTS を返す。関数が失敗した場合、戻り値は NULL。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]

ファイルマッピングオブジェクトが作成された後、ファイルのサイズはファイルマッピングオブジェクトのサイズを超えてはならない。超えた場合、ファイル内容のすべてを共有できるとは限らない。アプリケーションがディスク上の実際の名前付きファイルのサイズよりも大きいファイルマッピングオブジェクトのサイズを指定し、かつページ保護が書き込みアクセスを許可する場合（すなわち
flProtect パラメータが PAGE_READWRITE または PAGE_EXECUTE_READWRITE
を指定する場合）、ディスク上のファイルは指定されたファイルマッピングオブジェクトのサイズに合うよう拡張される。ファイルが拡張された場合、古い終端と新しい終端の間の内容がゼロであることは保証されない。動作はファイルシステムによって定義される。ディスク上のファイルを拡張できない場合、CreateFileMapping
は失敗し GetLastError は ERROR_DISK_FULL を返す。OS
のページングファイルがバックするファイルマッピングオブジェクトのページの初期内容はゼロである。CreateFileMapping
が返すハンドルは新しいファイルマッピングオブジェクトへのフルアクセスを持ち、ファイルマッピングオブジェクトへのハンドルを必要とする任意の関数で使用できる。複数のプロセスは同じファイルをバックとする単一の共有ファイルマッピングオブジェクトを使うか、同じファイルをバックとする別々のファイルマッピングオブジェクトを作成して、同じファイルのビューを共有できる。単一のファイルマッピングオブジェクトは、プロセス作成時にハンドルを継承する、ハンドルを複製する、または名前でファイルマッピングオブジェクトを開くことで複数のプロセス間で共有できる。詳細は
CreateProcess、DuplicateHandle、OpenFileMapping
を参照。ファイルマッピングオブジェクトを作成しただけでは実際にはプロセスアドレス空間にビューをマップしない。MapViewOfFile
および MapViewOfFileEx 関数がファイルのビューをプロセスアドレス空間にマップする。1
つの重要な例外を除き、同じファイルをバックとする任意のファイルマッピングオブジェクトから得られるファイルビューは特定の時点でコヒーレントである。コヒーレンシはプロセス内のビューや、異なるプロセスによってマップされたビューについて保証される。例外はリモートファイルに関連する。CreateFileMapping
はリモートファイルに対して動作するが、それらをコヒーレントに保たない。例えば、2
台のコンピュータがファイルを書き込み可能としてマップし、両方が同じページを変更した場合、それぞれのコンピュータはそのページへの自身の書き込みしか見られない。ディスク上のデータが更新されるとき、マージは行われない。マップされたファイルと、入出力
(I/O) 関数 (ReadFile と WriteFile)
でアクセスされるファイルは必ずしもコヒーレントではない。マップされたファイルマッピングオブジェクトのビューはオブジェクトへの内部参照を保持し、ファイルマッピングオブジェクトは参照がすべて解放されるまで閉じられない。したがって、ファイルマッピングオブジェクトを完全に閉じるには、アプリケーションは
UnmapViewOfFile を呼んですべてのマップされたビューを解除し、CloseHandle
を呼んでファイルマッピングオブジェクトのハンドルを閉じる必要がある。これらの関数は任意の順序で呼べる。マップされたビューを通じてファイルを変更するとき、最終更新タイムスタンプが自動的に更新されないことがある。必要ならば呼び出し側は
SetFileTime を使ってタイムスタンプを設定する。セッション 0
以外のセッションからグローバル名前空間にファイルマッピングオブジェクトを作成するには SeCreateGlobalPrivilege
特権が必要である。なお、この特権チェックはファイルマッピングオブジェクトの作成に限られ、既存のものを開くことには適用されない。例えば、サービスやシステムがグローバル名前空間にファイルマッピングオブジェクトを作成した場合、呼び出し側が必要なアクセス権を持っていれば、任意のセッションで実行中の任意のプロセスがそのファイルマッピングオブジェクトにアクセスできる。Windows
XP: 前段落で説明した要件は Windows Server 2003 および Windows XP SP2
から導入された。ファイルビューへの書き込みや読み込みを行うコードを保護するには構造化例外処理を使う。詳細は Reading and
Writing From a File View を参照。実行可能な権限を持つマッピングを作成するには、アプリケーションは
PAGE_EXECUTE_READWRITE または PAGE_EXECUTE_READ で CreateFileMapping
を呼び、その後 FILE_MAP_EXECUTE | FILE_MAP_WRITE または FILE_MAP_EXECUTE |
FILE_MAP_READ で MapViewOfFile を呼ぶ必要がある。Windows Server 2012
では、この関数は以下の技術でサポートされている。
（以下省略）


%index
CreateFileMappingNumaW
指定ファイルに対して名前付きまたは名前なしのファイルマッピングオブジェクトを作成または開き、物理メモリの NUMA ノードを指定する。(CreateFileMappingNumaW)
%group
Win32 kernel32
%prm
hFile, lpFileMappingAttributes, flProtect, dwMaximumSizeHigh, dwMaximumSizeLow, lpName, nndPreferred
hFile : [intptr] ファイルマッピングオブジェクトを作成する元のファイルへのハンドル。ファイルは flProtect パラメータが指定する保護フラグと互換性のあるアクセス権で開かれている必要がある。必須ではないが、マップ対象のファイルは排他アクセスで開くことが推奨される。詳細は File Security and Access Rights を参照。hFile が INVALID_HANDLE_VALUE の場合、呼び出し側プロセスは dwMaximumSizeHigh と dwMaximumSizeLow パラメータでファイルマッピングオブジェクトのサイズも指定する必要がある。この場合、CreateFileMappingNuma はファイルシステム上のファイルではなくシステムページングファイルがバックする、指定サイズのファイルマッピングオブジェクトを作成する。
lpFileMappingAttributes : [var] 返されるハンドルが子プロセスに継承可能かどうかを決定する SECURITY_ATTRIBUTES 構造体へのポインタ。SECURITY_ATTRIBUTES 構造体の lpSecurityDescriptor メンバーが新しいファイルマッピングオブジェクトのセキュリティ記述子を指定する。lpFileMappingAttributes が NULL の場合、ハンドルは継承できず、ファイルマッピングオブジェクトは既定のセキュリティ記述子を取得する。ファイルマッピングオブジェクトの既定セキュリティ記述子の ACL は作成者のプライマリトークンまたは impersonation トークンから取得される。詳細は File Mapping Security and Access Rights を参照。
flProtect : [int] ファイルマッピングオブジェクトのページ保護を指定する。このオブジェクトのすべてのマップされたビューは、この保護と互換性がなければならない。
dwMaximumSizeHigh : [int] ファイルマッピングオブジェクトの最大サイズの上位 DWORD。
dwMaximumSizeLow : [int] ファイルマッピングオブジェクトの最大サイズの下位 DWORD。このパラメータと dwMaximumSizeHigh パラメータがともに 0 の場合、ファイルマッピングオブジェクトの最大サイズは hFile パラメータが示すファイルの現在のサイズに等しい。長さ 0 のファイルをマップしようとすると、ERROR_FILE_INVALID エラーコードで失敗する。アプリケーションは長さ 0 のファイルを検査して拒否するべきである。
lpName : [wstr] ファイルマッピングオブジェクトの名前。このパラメータが既存のファイルマッピングオブジェクトの名前と一致する場合、関数は flProtect パラメータで指定された保護でオブジェクトへのアクセスを要求する。NULL の場合、名前なしでファイルマッピングオブジェクトが作成される。lpName が既存のイベント、セマフォ、ミューテックス、待機可能タイマ、またはジョブオブジェクトの名前と一致する場合、関数は失敗し GetLastError は ERROR_INVALID_HANDLE を返す。これはこれらのオブジェクトが同じ名前空間を共有するために起こる。名前にはグローバル名前空間またはセッション名前空間にオブジェクトを明示的に作成するための "Global\" または "Local\" プレフィックスを付けられる。名前の残りの部分はバックスラッシュ文字 (\\) を除く任意の文字を含められる。グローバル名前空間にファイルマッピングオブジェクトを作成するには SeCreateGlobalPrivilege 特権が必要。詳細は Kernel Object Namespaces を参照。高速ユーザー切り替えはターミナルサービスセッションを使用して実装される。最初にログオンしたユーザーがセッション 0、次にログオンしたユーザーがセッション 1、以降同様。カーネルオブジェクト名はアプリケーションが複数ユーザーをサポートできるようガイドラインに従う必要がある。
nndPreferred : [int] 物理メモリを配置する NUMA ノード。
%inst
指定ファイルに対して名前付きまたは名前なしのファイルマッピングオブジェクトを作成または開き、物理メモリの NUMA
ノードを指定する。(CreateFileMappingNumaW)

[戻り値]

関数が成功した場合、戻り値はファイルマッピングオブジェクトへのハンドル。関数呼び出し前にオブジェクトが存在していた場合、関数は既存オブジェクトへのハンドル（指定サイズではなく現在のサイズ）を返し、GetLastError
関数は ERROR_ALREADY_EXISTS を返す。関数が失敗した場合、戻り値は NULL。拡張エラー情報を取得するには
GetLastError 関数を呼ぶ。

[備考]

ファイルマッピングオブジェクトが作成された後、ファイルのサイズはファイルマッピングオブジェクトのサイズを超えてはならない。超えた場合、ファイル内容のすべてを共有できるとは限らない。ファイルマッピングオブジェクトは複製、継承、または名前によって共有できる。ページファイルがバックするファイルマッピングオブジェクト内のページの初期内容はゼロである。アプリケーションがディスク上の実際の名前付きファイルのサイズよりも大きいファイルマッピングオブジェクトのサイズを指定し、かつページ保護が書き込みアクセスを許可する場合（すなわち
flProtect パラメータが PAGE_READWRITE または PAGE_EXECUTE_READWRITE
を指定する場合）、ディスク上のファイルは指定されたファイルマッピングオブジェクトのサイズに合うよう拡張される。ファイルが拡張された場合、ファイルの古い終端と新しい終端の間の内容がゼロであることは保証されない。動作はファイルシステムによって定義される。ファイルを拡張できない場合、ファイルマッピングオブジェクトの作成に失敗し、GetLastError
関数は ERROR_DISK_FULL を返す。CreateFileMappingNuma
関数が返すハンドルは、新しいファイルマッピングオブジェクトへのフルアクセスを持ち、ファイルマッピングオブジェクトへのハンドルを必要とする任意の関数で使用できる。ファイルマッピングオブジェクトはプロセス作成、ハンドル複製、または名前で共有できる。詳細は
DuplicateHandle および OpenFileMapping
関数を参照。ファイルマッピングオブジェクトを作成してもビューをマップする可能性を作り出すだけで、ビューをマップしない。MapViewOfFileExNuma
関数がファイルのビューをプロセスアドレス空間にマップする。1
つの重要な例外を除き、単一のファイルマッピングオブジェクトから得られるファイルビューは特定の時点でコヒーレント（同一）である。複数のプロセスが同じファイルマッピングオブジェクトのハンドルを持つ場合、ファイルのビューをマップするとデータのコヒーレントなビューを得られる。例外はリモートファイルに関連する。CreateFileMappingNuma
関数はリモートファイルに対して動作するが、それらをコヒーレントに保たない。例えば、2
台のコンピュータがファイルを書き込み可能としてマップし、両方が同じページを変更した場合、それぞれのコンピュータはそのページへの自身の書き込みしか見られない。ディスク上のデータが更新されるとき、ページはマージされない。マップされたファイルと、入出力
(I/O) 関数 (ReadFile と WriteFile)
でアクセスされるファイルは必ずしもコヒーレントではない。ファイルマッピングオブジェクトを完全に閉じるには、アプリケーションは
UnmapViewOfFile 関数を呼んですべてのマップされたビューを解除し、その後 CloseHandle
関数を呼んでファイルマッピングオブジェクトのハンドルを閉じる必要がある。これらの関数は任意の順序で呼べる。UnmapViewOfFile
の呼び出しは必要である。マップされたファイルマッピングオブジェクトのビューはオブジェクトへの内部オープンハンドルを保持しており、ファイルマッピングオブジェクトはそれへのすべてのオープンハンドルが閉じられるまで閉じられない。マップされたビューを通じてファイルを変更するとき、最終更新タイムスタンプが自動的に更新されないことがある。必要ならば呼び出し側は
SetFileTime を使ってタイムスタンプを設定する。セッション 0 以外のセッションからファイルマッピングオブジェクトを作成するには
SeCreateGlobalPrivilege
特権が必要である。なお、この特権チェックはファイルマッピングオブジェクトの作成に限られ、既存のものを開くことには適用されない。例えば、サービスやシステムがファイルマッピングオブジェクトを作成した場合、呼び出し側が必要なアクセス権を持っていれば、任意のセッションで実行中の任意のプロセスがそのファイルマッピングオブジェクトにアクセスできる。メモリマップビューに書き込みや読み込みを行うコードを保護するには構造化例外処理を使う。詳細は
Reading and Writing From a File View
を参照。実行可能な権限を持つマッピングを作成するには、アプリケーションは PAGE_EXECUTE_READWRITE または
PAGE_EXECUTE_READ で CreateFileMappingNuma を呼び、その後 FILE_MAP_EXECUTE |
FILE_MAP_WRITE または FILE_MAP_EXECUTE | FILE_MAP_READ で
MapViewOfFileExNuma を呼ぶ必要がある。Windows Server 2012
では、この関数は以下の技術でサポートされている。
（以下省略）


%index
CreateFileTransactedW
ファイル、ファイルストリーム、またはディレクトリをトランザクション操作として作成または開く。(Unicode)
%group
Win32 kernel32
%prm
lpFileName, dwDesiredAccess, dwShareMode, lpSecurityAttributes, dwCreationDisposition, dwFlagsAndAttributes, hTemplateFile, hTransaction, pusMiniVersion, lpExtendedParameter
lpFileName : [wstr] 作成または開くオブジェクトの名前。オブジェクトはローカルコンピュータ上に存在しなければならない。そうでない場合、関数は失敗し最終エラーコードは ERROR_TRANSACTIONS_UNSUPPORTED_REMOTE に設定される。この関数の ANSI 版では、名前は MAX_PATH 文字に制限されている。この制限を 32,767 ワイド文字まで拡張するには、Unicode 版を呼びパスの先頭に "\\?\" を付ける。詳細は Naming a File を参照。特殊なデバイス名については Defining an MS-DOS Device Name を参照。ファイルストリームを作成するには、ファイル名、コロン、ストリーム名の順に指定する。詳細は File Streams を参照。
dwDesiredAccess : [int] オブジェクトへのアクセス。読み取り、書き込み、両方、またはどちらでもない（ゼロ）にまとめられる。最も一般的に使われる値は GENERIC_READ、GENERIC_WRITE、またはその両方 (GENERIC_READ | GENERIC_WRITE) である。詳細は Generic Access Rights と File Security and Access Rights を参照。このパラメータがゼロの場合、アプリケーションはファイルやデバイスにアクセスせずに、ファイル、ディレクトリ、デバイスの属性を問い合わせることができる。詳細はこのトピックの備考を参照。開いているハンドルを持つ既存の open 要求で指定された共有モードと競合するアクセスモードを要求することはできない。詳細は Creating and Opening Files を参照。
dwShareMode : [int] オブジェクトの共有モード。読み取り、書き込み、両方、削除、これらすべて、またはどれでもない（以下の表を参照）が指定できる。このパラメータがゼロで CreateFileTransacted が成功した場合、オブジェクトは共有できず、ハンドルが閉じられるまで再度開けない。詳細はこのトピックの備考を参照。開いているハンドルを持つ既存の open 要求で指定されたアクセスモードと競合する共有モードを要求することはできない。要求した場合、ERROR_SHARING_VIOLATION の共有違反となる。詳細は Creating and Opening Files を参照。プロセスが別のプロセスがオブジェクトを開いている間にオブジェクトを共有できるようにするには、次のいずれか 1 つ以上を組み合わせて使う。
lpSecurityAttributes : [var] 省略可能なセキュリティ記述子を含み、返されるハンドルが子プロセスに継承可能かどうかを決定する SECURITY_ATTRIBUTES 構造体へのポインタ。このパラメータは NULL でも構わない。lpSecurityAttributes パラメータが NULL の場合、CreateFileTransacted から返されたハンドルはアプリケーションが作成する子プロセスに継承されず、返されたハンドルに関連付けられたオブジェクトには既定のセキュリティ記述子が付与される。構造体の bInheritHandle メンバーは返されたハンドルが継承可能かどうかを指定する。構造体の lpSecurityDescriptor メンバーはオブジェクトのセキュリティ記述子を指定するが、NULL でも構わない。lpSecurityDescriptor メンバーが NULL の場合、返されたハンドルに関連付けられたオブジェクトには既定のセキュリティ記述子が割り当てられる。既存ファイルを開くとき、CreateFileTransacted は lpSecurityDescriptor メンバーを無視するが、bInheritHandle メンバーは引き続き使用する。詳細はこのトピックの備考を参照。
dwCreationDisposition : [int] 存在するか存在しないファイルに対して行う動作。詳細はこのトピックの備考を参照。
dwFlagsAndAttributes : [int] ファイル属性とフラグ。最も一般的な既定値は FILE_ATTRIBUTE_NORMAL。このパラメータは利用可能なファイル属性 (FILE_ATTRIBUTE_*) の任意の組み合わせを含められる。他のすべてのファイル属性は FILE_ATTRIBUTE_NORMAL を上書きする。このパラメータはまた、バッファリング動作、アクセスモード、その他の特殊目的フラグを制御するフラグ (FILE_FLAG_*) の組み合わせを含められる。これらは任意の FILE_ATTRIBUTE_* 値と組み合わせられる。このパラメータはまた SECURITY_SQOS_PRESENT フラグを指定することで Security Quality of Service (SQOS) 情報を含められる。SQOS 関連のフラグ情報は属性とフラグの表に続く表で説明される。注意: CreateFileTransacted が既存ファイルを開くとき、通常はファイルフラグを既存ファイルのファイル属性と結合し、dwFlagsAndAttributes の一部として提供されたファイル属性を無視する。特殊なケースについては Creating and Opening Files を参照。以下のファイル属性とフラグはファイルオブジェクトにのみ使われ、CreateFileTransacted で開く他の種類のオブジェクトでは使われない（追加情報はこのトピックの備考を参照）。ファイル属性のより高度なアクセスについては SetFileAttributes を参照。すべてのファイル属性とその値と説明の完全な一覧は File Attribute Constants を参照。
hTemplateFile : [intptr] GENERIC_READ アクセス権を持つテンプレートファイルの有効なハンドル。テンプレートファイルは作成されるファイルにファイル属性と拡張属性を提供する。このパラメータは NULL でも構わない。既存ファイルを開くときは CreateFileTransacted がテンプレートファイルを無視する。新しい EFS 暗号化ファイルを開くとき、ファイルは親ディレクトリから DACL を継承する。
hTransaction : [intptr] トランザクションへのハンドル。このハンドルは CreateTransaction 関数が返す。
pusMiniVersion : [var] 開くミニバージョン。hTransaction で指定されたトランザクションがファイルを変更しているトランザクションでない場合、このパラメータは NULL であるべきである。そうでない場合、このパラメータには FSCTL_TXFS_CREATE_MINIVERSION 制御が返したミニバージョン識別子を指定できる。
lpExtendedParameter : [intptr] このパラメータは予約済みであり、NULL でなければならない。
%inst
ファイル、ファイルストリーム、またはディレクトリをトランザクション操作として作成または開く。(Unicode)

[戻り値]

関数が成功した場合、戻り値は指定されたファイル、デバイス、名前付きパイプ、またはメールスロットへの開かれたハンドル。関数が失敗した場合、戻り値は
INVALID_HANDLE_VALUE。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
CreateFileTransacted から返されたハンドルを使う場合、可能な限り標準のファイル I/O
関数の代わりにトランザクション対応版のファイル I/O 関数を使うこと。詳細は Programming Considerations
for Transactional NTFS を参照。ディレクトリに対するトランザクション対応ハンドルを開く場合、そのハンドルは
FILE_WRITE_DATA (FILE_ADD_FILE) と FILE_APPEND_DATA
(FILE_ADD_SUBDIRECTORY) の権限を持たなければならない。これらは FILE_GENERIC_WRITE
権限に含まれる。ファイルまたはサブディレクトリを作成するためだけにハンドルを使う場合、ディレクトリはより少ない権限で開くべきである。そうしないと共有違反が発生する可能性がある。ファイルが別のトランザクションの一部である場合（別のアプリケーションが
CreateFileTransacted を呼んで開いている場合）、FILE_EXECUTE
アクセスレベルでそのファイルを開くことはできない。これは、FILE_EXECUTE または FILE_ALL_ACCESS
アクセスレベルを指定すると CreateFileTransacted が失敗することを意味する。非トランザクション対応アプリケーションが
lpSecurityAttributes に MAXIMUM_ALLOWED を指定して CreateFileTransacted
を呼ぶと、ハンドルは常に同じアクセスレベルで開かれる。トランザクション対応アプリケーションが lpSecurityAttributes に
MAXIMUM_ALLOWED を指定して CreateFileTransacted
を呼ぶと、ファイルがトランザクションによってロックされているかどうかに応じて異なる量のアクセスでハンドルが開かれる。例えば、呼び出し側アプリケーションがファイルに対して
FILE_EXECUTE
アクセスレベルを持っている場合、そのファイルがトランザクションによってロックされていないか、そのファイルがトランザクションによってロックされておりアプリケーションが既にそのファイルのトランザクション読み取り側である場合にのみ、このアクセスが得られる。トランザクション操作の完全な説明は
Transactional NTFS を参照。CreateFileTransacted
から返されたオブジェクトハンドルが不要になり、トランザクションのコミットまたはロールバックの前に閉じるには CloseHandle
関数を使う。NTFS
ファイルシステムのような一部のファイルシステムは個々のファイルとディレクトリの圧縮または暗号化をサポートしている。そのようなファイルシステムでフォーマットされたボリュームでは、新しいファイルは親ディレクトリの圧縮と暗号化の属性を継承する。CreateFileTransacted
を使ってファイルやディレクトリの圧縮を制御することはできない。詳細は File Compression and Decompression
および File Encryption を参照。シンボリックリンクの動作 ?
この関数の呼び出しが新しいファイルを作成する場合、動作に変更はない。FILE_FLAG_OPEN_REPARSE_POINT
が指定された場合:
（以下省略）


%index
CreateHardLinkW
既存ファイルと新しいファイルの間にハードリンクを確立する。(Unicode)
%group
Win32 kernel32
%prm
lpFileName, lpExistingFileName, lpSecurityAttributes
lpFileName : [wstr] 新しいファイルの名前。
lpExistingFileName : [wstr] 既存ファイルの名前。
lpSecurityAttributes : [var] 予約済み。NULL でなければならない。
%inst
既存ファイルと新しいファイルの間にハードリンクを確立する。(Unicode)

[戻り値]
関数が成功した場合、戻り値はゼロ以外。関数が失敗した場合、戻り値はゼロ (0)。拡張エラー情報を取得するには GetLastError
を呼ぶ。この関数で作成できるハードリンクの最大数は 1 ファイルあたり 1023 個。1 ファイルに対して 1023
を超えるリンクを作成しようとするとエラーになる。この関数の ANSI 版または "\\\\?\\" を前置しない Unicode 版の
*lpFileName* または *lpExistingFileName* パラメータに MAX_PATH
文字より長い名前を渡すと、関数は ERROR_PATH_NOT_FOUND を返す。

[備考]
CreateFile または CreateHardLink
で作成されたファイルのディレクトリエントリは、関連付けられたファイルへのハードリンクである。CreateHardLink
関数で作成される追加のハードリンクを使うと、ファイルに対して複数のディレクトリエントリ、つまり同一ファイルへの複数のハードリンクを持つことができる。同じディレクトリ内で異なる名前でもよく、異なるディレクトリで同じ名前または異なる名前でもよい。ただし、ファイルへのすべてのハードリンクは同じボリューム上に存在しなければならない。ハードリンクはファイルに対するディレクトリエントリにすぎないため、そのファイルに対する多くの変更は、それを参照するハードリンクを通じてアクセスするアプリケーションに即座に可視になる。ただし、ディレクトリエントリのサイズと属性情報は、変更が行われたリンクについてのみ更新される。セキュリティ記述子はハードリンクが指すファイルに属する。リンク自体はディレクトリエントリにすぎず、セキュリティ記述子を持たない。したがって、ハードリンクのセキュリティ記述子を変更すると、基盤となるファイルのセキュリティ記述子を変更することになり、そのファイルを指すすべてのハードリンクが新たに指定されたアクセスを許可するようになる。ハードリンクごとに異なるセキュリティ記述子をファイルに与えることはできない。この関数は、lpSecurityAttributes
パラメータにセキュリティ記述子情報が渡された場合でも、リンク対象ファイルのセキュリティ記述子を変更しない。ハードリンクを削除するには
DeleteFile を使う。作成した順序に関わらず、任意の順序で削除できる。CreateFile
で指定されたフラグ、属性、アクセス、共有はファイル単位で動作する。つまり、共有を許可しないファイルを開いた場合、別のアプリケーションは新しいハードリンクを作成してもそのファイルを共有できない。NTFS
ファイルシステム上でハードリンクを作成するとき、ディレクトリエントリのファイル属性情報は、ファイルが開かれるときまたは特定のファイルのハンドルを指定して
GetFileInformationByHandle が呼ばれるときにのみ更新される。シンボリックリンクの動作 ?
パスがシンボリックリンクを指す場合、関数はシンボリックリンクへのハードリンクを作成する。Windows 8 および Windows
Server 2012 では、この関数は以下の技術でサポートされている。
（以下省略）


%index
CreateHardLinkTransactedW
既存ファイルと新しいファイルの間にハードリンクをトランザクション操作として確立する。(Unicode)
%group
Win32 kernel32
%prm
lpFileName, lpExistingFileName, lpSecurityAttributes, hTransaction
lpFileName : [wstr] 新しいファイルの名前。このパラメータにディレクトリ名を指定することはできない。
lpExistingFileName : [wstr] 既存ファイルの名前。このパラメータにディレクトリ名を指定することはできない。
lpSecurityAttributes : [var] 予約済み。NULL でなければならない。
hTransaction : [intptr] トランザクションへのハンドル。このハンドルは CreateTransaction 関数が返す。
%inst
既存ファイルと新しいファイルの間にハードリンクをトランザクション操作として確立する。(Unicode)

[戻り値]
関数が成功した場合、戻り値はゼロ以外。関数が失敗した場合、戻り値はゼロ (0)。拡張エラー情報を取得するには GetLastError
を呼ぶ。この関数で作成できるハードリンクの最大数は 1 ファイルあたり 1023 個。1 ファイルに対して 1023
を超えるリンクを作成しようとするとエラーになる。ファイルはローカルコンピュータ上に存在しなければならない。そうでない場合、関数は失敗し最終エラーコードは
ERROR_TRANSACTIONS_UNSUPPORTED_REMOTE に設定される。

[備考]
CreateFileTransacted または CreateHardLinkTransacted
で作成されたファイルのディレクトリエントリは、関連付けられたファイルへのハードリンクである。CreateHardLinkTransacted
関数で作成される追加のハードリンクを使うと、ファイルに対して複数のディレクトリエントリ、つまり同一ファイルへの複数のハードリンクを持つことができる。同じディレクトリ内で異なる名前でもよく、異なるディレクトリで同じ名前または異なる名前でもよい。ただし、ファイルへのすべてのハードリンクは同じボリューム上に存在しなければならない。ハードリンクはファイルに対するディレクトリエントリにすぎないため、アプリケーションがいずれかのハードリンクを通じてファイルを変更すると、他のハードリンクを使用するすべてのアプリケーションもその変更を見ることになる。また、ファイルが変更されればすべてのディレクトリエントリが更新される。例えば、ファイルサイズが変わると、そのファイルへのすべてのハードリンクは新しいサイズを示す。セキュリティ記述子はハードリンクが指すファイルに属する。リンク自体はディレクトリエントリにすぎず、セキュリティ記述子を持たない。したがって、ハードリンクのセキュリティ記述子を変更すると、基盤となるファイルのセキュリティ記述子を変更することになり、そのファイルを指すすべてのハードリンクが新たに指定されたアクセスを許可するようになる。ハードリンクごとに異なるセキュリティ記述子をファイルに与えることはできない。この関数は、lpSecurityAttributes
パラメータにセキュリティ記述子情報が渡された場合でも、リンク対象ファイルのセキュリティ記述子を変更しない。ハードリンクを削除するには
DeleteFileTransacted を使う。作成した順序に関わらず、任意の順序で削除できる。CreateFileTransacted
で指定されたフラグ、属性、アクセス、共有はファイル単位で動作する。つまり、共有を許可しないファイルを開いた場合、別のアプリケーションは新しいハードリンクを作成してもそのファイルを共有できない。NTFS
ファイルシステム上でハードリンクを作成するとき、ディレクトリエントリのファイル属性情報は、ファイルが開かれるときまたは特定のファイルのハンドルを指定して
GetFileInformationByHandle が呼ばれるときにのみ更新される。シンボリックリンク:
パスがシンボリックリンクを指す場合、関数はターゲットへのハードリンクを作成する。Windows 8 および Windows Server
2012 では、この関数は以下の技術でサポートされている。
（以下省略）


%index
CreateIoCompletionPort
入出力 (I/O) 完了ポートを作成し、指定されたファイルハンドルに関連付けるか、まだファイルハンドルに関連付けられていない I/O 完了ポートを作成し、後で関連付けができるようにする。
%group
Win32 kernel32
%prm
FileHandle, ExistingCompletionPort, CompletionKey, NumberOfConcurrentThreads
FileHandle : [intptr] 開かれたファイルハンドル、または INVALID_HANDLE_VALUE。ハンドルはオーバーラップ I/O をサポートするオブジェクトへのハンドルでなければならない。ハンドルを提供する場合、オーバーラップ I/O 完了のために開かれている必要がある。例えば、CreateFile 関数でハンドルを取得する際に FILE_FLAG_OVERLAPPED フラグを指定しなければならない。INVALID_HANDLE_VALUE が指定された場合、関数はファイルハンドルに関連付けずに I/O 完了ポートを作成する。この場合、ExistingCompletionPort パラメータは NULL でなければならず、CompletionKey パラメータは無視される。
ExistingCompletionPort : [intptr] 既存の I/O 完了ポートへのハンドル、または NULL。このパラメータが既存の I/O 完了ポートを指定する場合、関数はそれを FileHandle パラメータで指定されたハンドルに関連付ける。成功時、関数は既存の I/O 完了ポートのハンドルを返し、新しい I/O 完了ポートは作成しない。このパラメータが NULL の場合、関数は新しい I/O 完了ポートを作成し、FileHandle パラメータが有効であればそれを新しい I/O 完了ポートに関連付ける。そうでなければファイルハンドルの関連付けは行われない。成功時、関数は新しい I/O 完了ポートのハンドルを返す。
CompletionKey : [int] 指定されたファイルハンドルのすべての I/O 完了パケットに含まれる、ハンドルごとのユーザー定義完了キー。詳細は備考を参照。
NumberOfConcurrentThreads : [int] OS が I/O 完了ポートに対して I/O 完了パケットを同時に処理できるスレッドの最大数。このパラメータは ExistingCompletionPort が NULL でない場合は無視される。このパラメータがゼロの場合、システムはシステムにあるプロセッサ数と同数のスレッドを同時実行できるようにする。
%inst
入出力 (I/O) 完了ポートを作成し、指定されたファイルハンドルに関連付けるか、まだファイルハンドルに関連付けられていない I/O
完了ポートを作成し、後で関連付けができるようにする。

[戻り値]
関数が成功した場合、戻り値は I/O 完了ポートへのハンドル:
（以下省略）

[備考]
I/O システムは、I/O 完了通知パケットを I/O
完了ポートに送信するよう指示することができ、そこにキューされる。CreateIoCompletionPort
関数がこの機能を提供する。I/O
完了ポートとそのハンドルは、それを作成したプロセスに関連付けられており、プロセス間で共有できない。ただし、単一のハンドルは同じプロセス内のスレッド間で共有できる。CreateIoCompletionPort
は 3 つの異なるモードで使える:
（以下省略）


%index
CreateJobObjectW
ジョブオブジェクトを作成または開く。(CreateJobObjectW)
%group
Win32 kernel32
%prm
lpJobAttributes, lpName
lpJobAttributes : [var] ジョブオブジェクトのセキュリティ記述子を指定し、子プロセスが返されたハンドルを継承できるかを決定する SECURITY_ATTRIBUTES 構造体へのポインタ。lpJobAttributes が NULL の場合、ジョブオブジェクトは既定のセキュリティ記述子を取得し、ハンドルは継承できない。ジョブオブジェクトの既定セキュリティ記述子の ACL は作成者のプライマリトークンまたは impersonation トークンから取得される。
lpName : [wstr] ジョブの名前。名前は MAX_PATH 文字に制限される。名前比較は大文字小文字を区別する。
%inst
ジョブオブジェクトを作成または開く。(CreateJobObjectW)

[戻り値]
関数が成功した場合、戻り値はジョブオブジェクトへのハンドル。ハンドルは JOB_OBJECT_ALL_ACCESS
アクセス権を持つ。関数呼び出し前にオブジェクトが存在していた場合、関数は既存のジョブオブジェクトへのハンドルを返し、GetLastError
は ERROR_ALREADY_EXISTS を返す。関数が失敗した場合、戻り値は NULL。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]

ジョブが作成されると、そのアカウンティング情報はゼロに初期化され、すべての制限は非アクティブで、関連付けられたプロセスは存在しない。プロセスをジョブオブジェクトに割り当てるには
AssignProcessToJobObject 関数を使う。ジョブの制限を設定するには SetInformationJobObject
関数を使う。アカウンティング情報を問い合わせるには QueryInformationJobObject
関数を使う。ジョブに関連付けられたすべてのプロセスは同じセッションで実行されなければならない。ジョブは最初に割り当てられたプロセスのセッションに関連付けられる。Windows
Server 2003 および Windows XP:
ジョブはそれを作成したプロセスのセッションに関連付けられる。ジョブオブジェクトのハンドルを閉じるには CloseHandle
関数を使う。ジョブは最後のハンドルが閉じられ、かつ関連付けられたすべてのプロセスが終了したときに破棄される。ただし、ジョブに
JOB_OBJECT_LIMIT_KILL_ON_JOB_CLOSE
フラグが指定されている場合、最後のジョブオブジェクトハンドルを閉じると関連付けられたすべてのプロセスが終了してからジョブオブジェクト自体が破棄される。この関数を使用するアプリケーションをコンパイルするには、_WIN32_WINNT
を 0x0500 以降として定義する。詳細は Using the Windows Headers を参照。


%index
CreateJobSet
(no summary)
%group
Win32 kernel32
%prm
NumJob, UserJobSet, Flags
NumJob : [int] 
UserJobSet : [var] 
Flags : [int] 
%inst



%index
CreateMailslotW
指定された名前でメールスロットを作成し、メールスロットサーバーが操作に使用できるハンドルを返す。(Unicode)
%group
Win32 kernel32
%prm
lpName, nMaxMessageSize, lReadTimeout, lpSecurityAttributes
lpName : [wstr] メールスロットの名前。この名前は次の形式でなければならない: \\\\.\mailslot\\[path]name。name フィールドは一意である必要がある。name には、バックスラッシュで区切られた疑似ディレクトリの複数階層を含めてもよい。例えば、\\\\.\mailslot\example_mailslot_name や \\\\.\mailslot\abc\def\ghi はいずれも有効な名前である。
nMaxMessageSize : [int] メールスロットに書き込める 1 メッセージの最大サイズ（バイト単位）。メッセージを任意のサイズにするには、この値をゼロに設定する。
lReadTimeout : [int] タイムアウトが発生する前に、読み取り操作がメールスロットへのメッセージ書き込みを待機できる時間（ミリ秒単位）。以下の値には特別な意味がある。
lpSecurityAttributes : [var] SECURITY_ATTRIBUTES 構造体へのポインタ。構造体の bInheritHandle メンバーが、返されるハンドルを子プロセスが継承できるかどうかを決定する。lpSecurityAttributes が NULL の場合、ハンドルは継承できない。
%inst
指定された名前でメールスロットを作成し、メールスロットサーバーが操作に使用できるハンドルを返す。(Unicode)

[戻り値]

関数が成功した場合、戻り値はメールスロットへのハンドルで、サーバー側のメールスロット操作で使用する。この関数が返すハンドルは非同期（オーバーラップ）である。関数が失敗した場合、戻り値は
INVALID_HANDLE_VALUE。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
メールスロットは、以下のいずれかの条件が真になるまで存在する:
（以下省略）


%index
CreateMemoryResourceNotification
メモリリソース通知オブジェクトを作成する。
%group
Win32 kernel32
%prm
NotificationType
NotificationType : [int] オブジェクトがシグナルされるメモリ条件。このパラメータは MEMORY_RESOURCE_NOTIFICATION_TYPE 列挙から以下のいずれかの値を指定できる。
%inst
メモリリソース通知オブジェクトを作成する。

[戻り値]
関数が成功した場合、戻り値はメモリリソース通知オブジェクトへのハンドル。関数が失敗した場合、戻り値は NULL。拡張情報を取得するには
GetLastError を呼ぶ。

[備考]

アプリケーションはメモリリソース通知イベントを使ってメモリ使用量を適切にスケールできる。利用可能メモリが少ない場合、アプリケーションはワーキングセットを減らせる。利用可能メモリが多い場合、より多くのメモリを割り当てられる。呼び出し側プロセスの任意のスレッドは
QueryMemoryResourceNotification
関数または待機関数の呼び出しでメモリリソース通知ハンドルを指定できる。指定されたメモリ条件が存在するとき、オブジェクトの状態はシグナルされる。これはシステム全体のイベントであり、オブジェクトがシグナルされるとすべてのアプリケーションが通知を受け取る。LowMemoryResourceNotification
と HighMemoryResourceNotification
オブジェクトのいずれもシグナルされない利用可能メモリの範囲があることに注意。この場合、アプリケーションはメモリ使用量を一定に保つよう努めるべきである。ハンドルを閉じるには
CloseHandle
関数を使う。プロセスが終了するとシステムが自動的にハンドルを閉じる。メモリリソース通知オブジェクトは最後のハンドルが閉じられたときに破棄される。この関数を使用するアプリケーションをコンパイルするには、_WIN32_WINNT
マクロを 0x0501 以降として定義する。詳細は Using the Windows Headers を参照。


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
CreateMutexExW
名前付きまたは名前なしのミューテックスオブジェクトを作成または開き、そのオブジェクトへのハンドルを返す。(Unicode)
%group
Win32 kernel32
%prm
lpMutexAttributes, lpName, dwFlags, dwDesiredAccess
lpMutexAttributes : [var] SECURITY_ATTRIBUTES 構造体へのポインタ。このパラメータが NULL の場合、ミューテックスハンドルは子プロセスに継承できない。
lpName : [wstr] ミューテックスオブジェクトの名前。名前は MAX_PATH 文字に制限される。名前比較は大文字小文字を区別する。
dwFlags : [int] このパラメータは 0 または以下の値が指定できる。
dwDesiredAccess : [int] ミューテックスオブジェクトのアクセスマスク。アクセス権の一覧は Synchronization Object Security and Access Rights を参照。
%inst
名前付きまたは名前なしのミューテックスオブジェクトを作成または開き、そのオブジェクトへのハンドルを返す。(Unicode)

[戻り値]
関数が成功した場合、戻り値は新しく作成されたミューテックスオブジェクトへのハンドル。関数が失敗した場合、戻り値は
NULL。拡張エラー情報を取得するには GetLastError
を呼ぶ。ミューテックスが名前付きミューテックスで、関数呼び出し前にオブジェクトが存在していた場合、戻り値は既存オブジェクトへのハンドルで、[GetLastError](/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror)
関数は **ERROR_ALREADY_EXISTS** を返す。

[備考]

名前付きミューテックスを使ってアプリケーションを単一インスタンスに制限する場合、悪意あるユーザーが先にそのミューテックスを作成してアプリケーションの起動を妨げる可能性がある。これを防ぐには、ランダムな名前のミューテックスを作成し、認可されたユーザーだけが取得できるように名前を保存する。代わりにこの目的でファイルを使ってもよい。ユーザーごとに
1
インスタンスに制限するには、ユーザーのプロファイルディレクトリにロックされたファイルを作成する。呼び出し側プロセスの任意のスレッドは待機関数の呼び出しでミューテックスオブジェクトのハンドルを指定できる。単一オブジェクト待機関数は指定オブジェクトの状態がシグナルされたときに戻る。複数オブジェクト待機関数は指定されたオブジェクトのいずれか
1
つ、またはすべてがシグナルされたときに戻るように指示できる。待機関数が戻ると、待機中のスレッドは実行を続けるために解放される。ミューテックスオブジェクトの状態は、どのスレッドにも所有されていないときにシグナルされる。作成スレッドは
dwFlags
パラメータでミューテックスの即時所有を要求できる。そうでない場合、スレッドは所有権を要求するために待機関数を使う必要がある。ミューテックスの状態がシグナルされると、待機中の
1 つのスレッドが所有権を得、ミューテックスの状態は非シグナルになり、待機関数は戻る。任意の時点で 1
つのスレッドしかミューテックスを所有できない。所有スレッドは ReleaseMutex
関数で所有権を解放する。ミューテックスを所有するスレッドは、同じミューテックスを繰り返し待機関数呼び出しで指定してもブロックされない。通常、同じミューテックスに対して繰り返し待機することはないが、この仕組みにより、既に所有しているミューテックスを待機してスレッドが自身をデッドロックすることを防ぐ。ただし、所有権を解放するには、スレッドはミューテックスが待機を満たした回数だけ
ReleaseMutex を呼ぶ必要がある。2 つ以上のプロセスが CreateMutex
を呼んで同じ名前付きミューテックスを作成できる。最初のプロセスが実際にミューテックスを作成し、十分なアクセス権を持つ後続のプロセスは単に既存のミューテックスへのハンドルを開く。これにより複数のプロセスが同じミューテックスのハンドルを取得でき、作成プロセスが最初に起動していることを保証する責任からユーザーを解放する。この手法を使う場合、CREATE_MUTEX_INITIAL_OWNER
フラグを使うべきではない。そうしないとどのプロセスが最初の所有権を持つかを確実にするのが難しくなる。複数のプロセスが同じミューテックスオブジェクトのハンドルを持てるので、プロセス間同期にオブジェクトを使用できる。以下のオブジェクト共有機構が利用できる:
（以下省略）


%index
CreateNamedPipeW
CreateNamedPipeW (Unicode) 関数 (winbase.h) は名前付きパイプのインスタンスを作成し、後続のパイプ操作に使えるハンドルを返す。
%group
Win32 kernel32
%prm
lpName, dwOpenMode, dwPipeMode, nMaxInstances, nOutBufferSize, nInBufferSize, nDefaultTimeOut, lpSecurityAttributes
lpName : [wstr] 一意のパイプ名。この文字列は次の形式でなければならない: \\\\.\\pipe\pipename。名前の pipename 部分にはバックスラッシュ以外の任意の文字（数字や特殊文字を含む）を含められる。パイプ名文字列全体の長さは 256 文字までで、パイプ名は大文字小文字を区別しない。
dwOpenMode : [int] オープンモード。dwOpenMode に以下の表にあるフラグまたは 0 以外を指定した場合、関数は失敗する。このパラメータは以下のパイプアクセスモードのいずれかを指定する必要がある。パイプの各インスタンスに同じモードを指定しなければならない。
dwPipeMode : [int] パイプモード。dwPipeMode に以下の表にあるフラグまたは 0 以外を指定した場合、関数は失敗する。以下のタイプモードのいずれかを指定できる。パイプの各インスタンスに同じタイプモードを指定しなければならない。
nMaxInstances : [int] このパイプに対して作成できるインスタンスの最大数。パイプの最初のインスタンスがこの値を指定する。パイプの他のインスタンスには同じ数を指定しなければならない。許容値は 1 から PIPE_UNLIMITED_INSTANCES (255) の範囲。PIPE_UNLIMITED_INSTANCES の場合、作成可能なパイプインスタンス数はシステムリソースの可用性によってのみ制限される。nMaxInstances が PIPE_UNLIMITED_INSTANCES より大きい場合、戻り値は INVALID_HANDLE_VALUE で GetLastError は ERROR_INVALID_PARAMETER を返す。
nOutBufferSize : [int] 出力バッファに予約するバイト数。名前付きパイプバッファのサイズに関する議論は以下の備考を参照。
nInBufferSize : [int] 入力バッファに予約するバイト数。名前付きパイプバッファのサイズに関する議論は以下の備考を参照。
nDefaultTimeOut : [int] WaitNamedPipe 関数が NMPWAIT_USE_DEFAULT_WAIT を指定したときの既定のタイムアウト値（ミリ秒単位）。名前付きパイプの各インスタンスは同じ値を指定しなければならない。値ゼロは 50 ミリ秒の既定タイムアウトとなる。
lpSecurityAttributes : [var] 新しい名前付きパイプのセキュリティ記述子を指定し、返されるハンドルを子プロセスが継承できるかを決定する SECURITY_ATTRIBUTES 構造体へのポインタ。lpSecurityAttributes が NULL の場合、名前付きパイプは既定のセキュリティ記述子を取得し、ハンドルは継承できない。名前付きパイプの既定セキュリティ記述子の ACL は LocalSystem アカウント、管理者、作成者所有者にフルコントロールを、Everyone グループと匿名アカウントに読み取りアクセスを付与する。
%inst
CreateNamedPipeW (Unicode) 関数 (winbase.h)
は名前付きパイプのインスタンスを作成し、後続のパイプ操作に使えるハンドルを返す。

[戻り値]
関数が成功した場合、戻り値は名前付きパイプインスタンスのサーバー側へのハンドル。関数が失敗した場合、戻り値は
INVALID_HANDLE_VALUE。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
CreateNamedPipe を使って名前付きパイプのインスタンスを作成するには、ユーザーは名前付きパイプオブジェクトに対する
FILE_CREATE_PIPE_INSTANCE
アクセス権を持っていなければならない。新しい名前付きパイプが作成される場合、セキュリティ属性パラメータからのアクセス制御リスト (ACL)
がその名前付きパイプの任意アクセス制御を定義する。名前付きパイプのすべてのインスタンスは同じパイプタイプ（バイト型またはメッセージ型）、パイプアクセス（双方向、受信、送信）、インスタンス数、タイムアウト値を指定しなければならない。異なる値を使うと、この関数は失敗し
GetLastError は ERROR_ACCESS_DENIED を返す。クライアントプロセスは CreateFile または
CallNamedPipe
関数を使って名前付きパイプに接続する。名前付きパイプのクライアント側は、サーバー側がメッセージモードであってもバイトモードで開始される。データ受信の問題を避けるため、クライアント側もメッセージモードに設定する。パイプのモードを変更するには、パイプクライアントは
GENERIC_READ と FILE_WRITE_ATTRIBUTES
アクセス権で読み取り専用パイプを開く必要がある。パイプサーバーは、パイプクライアントが起動するまでブロッキング読み取り操作を実行すべきではない。そうしないとレースコンディションが発生する可能性がある。これは通常、C
ランタイムのような初期化コードが継承されたハンドルをロックして調べる必要があるときに発生する。名前付きパイプが作成されるたびに、システムは非ページプール（カーネルが使用する物理メモリ）を使って受信／送信バッファを作成する。作成できるパイプインスタンス数（およびスレッドやプロセスなどのオブジェクト）は、利用可能な非ページプールによって制限される。各読み書き要求には読み書きデータ分のバッファ容量に加えて、内部データ構造のための追加領域が必要である。入出力バッファサイズは助言的な値である。名前付きパイプの各端に実際に予約されるバッファサイズは、システム既定、システム最小、システム最大、または次の割り当て境界に丸められた指定サイズである。指定するバッファサイズは、プロセスが非ページプールを使い切らないように十分小さくし、典型的な要求を扱えるように十分大きくすべきである。パイプ書き込み操作が発生するたびに、システムはまずパイプ書き込みクォータに対してメモリを課金しようとする。残りのパイプ書き込みクォータが要求を満たすのに十分な場合、書き込み操作は直ちに完了する。残りのパイプ書き込みクォータが要求を満たすのに不十分な場合、システムはプロセス用に予約された非ページプールを使ってバッファを拡張しデータを受け入れようとする。書き込み操作は、追加のバッファクォータが解放されるようにデータがパイプから読み取られるまでブロックされる。したがって、指定したバッファサイズが小さすぎる場合、システムは必要に応じてバッファを拡張するが、操作がブロックされるという欠点がある。操作がオーバーラップの場合はシステムスレッドがブロックされ、そうでなければアプリケーションスレッドがブロックされる。名前付きパイプが使用するリソースを解放するため、アプリケーションはハンドルが不要になったら常に閉じるべきである。これは
CloseHandle
関数を呼ぶか、インスタンスハンドルに関連付けられたプロセスが終了することで達成される。名前付きパイプのインスタンスは複数のハンドルに関連付けられる可能性があるので注意。名前付きパイプのインスタンスは、その最後のハンドルが閉じられると常に削除される。Windows
10 バージョン 1709: パイプは app-container 内でのみサポートされ、つまり同じアプリの UWP
プロセス間でしか使えない。また、名前付きパイプはパイプ名に `\\.\pipe\LOCAL\` 構文を使う必要がある。


%index
CreatePipe
匿名パイプを作成し、パイプの読み取り端と書き込み端へのハンドルを返す。
%group
Win32 kernel32
%prm
hReadPipe, hWritePipe, lpPipeAttributes, nSize
hReadPipe : [intptr] パイプの読み取りハンドルを受け取る変数へのポインタ。
hWritePipe : [intptr] パイプの書き込みハンドルを受け取る変数へのポインタ。
lpPipeAttributes : [var] 返されるハンドルが子プロセスに継承可能かどうかを決定する SECURITY_ATTRIBUTES 構造体へのポインタ。lpPipeAttributes が NULL の場合、ハンドルは継承できない。
nSize : [int] パイプのバッファサイズ（バイト単位）。サイズはあくまで推奨値で、システムはこの値を使って適切なバッファリング機構を計算する。このパラメータがゼロの場合、システムは既定のバッファサイズを使用する。
%inst
匿名パイプを作成し、パイプの読み取り端と書き込み端へのハンドルを返す。

[戻り値]
関数が成功した場合、戻り値はゼロ以外。関数が失敗した場合、戻り値はゼロ。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
CreatePipe はパイプを作成し、指定されたパイプサイズをストレージバッファに割り当てる。CreatePipe
はまた、ReadFile および WriteFile
関数の後続呼び出しでバッファに読み書きするためにプロセスが使うハンドルを作成する。プロセスはパイプから読み取るために、ReadFile
関数の呼び出しで読み取りハンドルを使う。ReadFile は次のいずれかが真のときに戻る:
パイプの書き込み端で書き込み操作が完了した、要求されたバイト数が読み取られた、またはエラーが発生した。プロセスが WriteFile
を使って匿名パイプに書き込むとき、書き込み操作はすべてのバイトが書き込まれるまで完了しない。すべてのバイトが書き込まれる前にパイプバッファが一杯になると、別のプロセスやスレッドが
ReadFile を使ってバッファ領域を空けるまで WriteFile
は戻らない。匿名パイプは一意の名前を持つ名前付きパイプを使って実装されている。したがって、名前付きパイプへのハンドルを必要とする関数に匿名パイプへのハンドルをしばしば渡せる。CreatePipe
が失敗した場合、出力パラメータの内容は不定である。この場合、その内容について何も仮定すべきではない。パイプが使用するリソースを解放するため、アプリケーションはハンドルが不要になったら常に閉じるべきである。これは
CloseHandle
関数を呼ぶか、インスタンスハンドルに関連付けられたプロセスが終了することで達成される。パイプのインスタンスは複数のハンドルに関連付けられる可能性がある。パイプのインスタンスは、その名前付きパイプの最後のインスタンスハンドルが閉じられると常に削除される。


%index
CreatePrivateNamespaceW
CreatePrivateNamespaceW (Unicode) 関数 (namespaceapi.h) はプライベート名前空間を作成する。
%group
Win32 kernel32
%prm
lpPrivateNamespaceAttributes, lpBoundaryDescriptor, lpAliasPrefix
lpPrivateNamespaceAttributes : [var] 名前空間オブジェクトのセキュリティ属性を指定する SECURITY_ATTRIBUTES 構造体へのポインタ。
lpBoundaryDescriptor : [intptr] 名前空間の分離方法を定義する記述子。呼び出し側はこの境界の中にいなければならない。CreateBoundaryDescriptor 関数が境界記述子を作成する。
lpAliasPrefix : [wstr] 名前空間のプレフィックス。この名前空間内にオブジェクトを作成するには、オブジェクト名を prefix\objectname として指定する。システムは異なる境界を定義する限り、同じ名前を持つ複数のプライベート名前空間をサポートする。
%inst
CreatePrivateNamespaceW (Unicode) 関数 (namespaceapi.h)
はプライベート名前空間を作成する。

[戻り値]
関数が成功した場合、新しい名前空間へのハンドルを返す。関数が失敗した場合、戻り値は NULL。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
他のアプリケーションは OpenPrivateNamespace
関数を使って名前空間にアクセスできる。名前空間を作成したアプリケーションは ClosePrivateNamespace
関数を使って名前空間のハンドルを閉じることができる。作成プロセスが終了するとハンドルも閉じられる。名前空間のハンドルが閉じられた後、OpenPrivateNamespace
の呼び出しは失敗するが、名前空間内のオブジェクトに対するすべての操作は成功する。この関数を使用するアプリケーションをコンパイルするには、_WIN32_WINNT
を 0x0600 以降として定義する。


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
CreatePseudoConsole
呼び出し側プロセスに新しい疑似コンソールを割り当てる CreatePseudoConsole 関数に関するリファレンス情報を参照のこと。
%group
Win32 kernel32
%prm
size, hInput, hOutput, dwFlags, phPC
size : [var] 疑似コンソールの初期作成時に使用されるウィンドウ／バッファの文字数単位の寸法。後で [ResizePseudoConsole](resizepseudoconsole.md) で調整できる。
hInput : [intptr] デバイスへのユーザー入力を表すデータストリームへの開かれたハンドル。現在は[同期](/windows/desktop/Sync/synchronization-and-overlapped-input-and-output) I/O に制限されている。
hOutput : [intptr] デバイスからのアプリケーション出力を表すデータストリームへの開かれたハンドル。現在は[同期](/windows/desktop/Sync/synchronization-and-overlapped-input-and-output) I/O に制限されている。
dwFlags : [int] 値は以下のいずれか: | 値 | 意味 | |-|-| | **0** | 標準的な疑似コンソール作成を実行する。 | | **PSEUDOCONSOLE_INHERIT_CURSOR** (DWORD)1 | 作成される疑似コンソールセッションが親コンソールのカーソル位置を継承しようとする。 |
phPC : [intptr] 新しい疑似コンソールデバイスへのハンドルを受け取る場所へのポインタ。
%inst
呼び出し側プロセスに新しい疑似コンソールを割り当てる CreatePseudoConsole 関数に関するリファレンス情報を参照のこと。

[戻り値]
型: **HRESULT** 成功した場合は **S_OK** を返す。そうでない場合、**HRESULT** エラーコードを返す。

[備考]
この関数は主にコマンドラインユーザーインターフェイス (CUI)
アプリケーションのためのターミナルウィンドウになろうとするアプリケーションで使われる。呼び出し側は出力ストリームの情報の表示、ユーザー入力の収集と入力ストリームへのシリアライズに対する責任を持つ。UTF-8
でエンコードされた入出力ストリームには、[Virtual Terminal
Sequences](console-virtual-terminal-sequences.md)
と交互に平文テキストが含まれる。出力ストリームでは、呼び出し側アプリケーションが [virtual terminal
sequences](console-virtual-terminal-sequences.md)
をデコードして、平文テキストを表示ウィンドウ内にレイアウトして表示できる。入力ストリームでは、平文はユーザーが入力した標準キーボードキーを表す。より複雑な操作は、コントロールキーやマウスの動きを
[virtual terminal sequences](console-virtual-terminal-sequences.md)
としてストリームに埋め込むことで表現される。この関数で作成されたハンドルは、操作完了時に
[ClosePseudoConsole](closepseudoconsole.md)
で閉じなければならない。`PSEUDOCONSOLE_INHERIT_CURSOR`
を使用する場合、呼び出し側アプリケーションはカーソル状態の要求に対し、バックグラウンドスレッドで非同期的に応答する準備をしておく必要がある。これは
`hOutput` で受け取ったカーソル情報要求を転送または解釈し、`hInput`
で応答することによって行う。これを怠ると、疑似コンソールシステムへの別の要求を行っている間に呼び出し側アプリケーションがハングする可能性がある。


%index
CreateRemoteThread
別のプロセスの仮想アドレス空間で実行されるスレッドを作成する。
%group
Win32 kernel32
%prm
hProcess, lpThreadAttributes, dwStackSize, lpStartAddress, lpParameter, dwCreationFlags, lpThreadId
hProcess : [intptr] スレッドを作成するプロセスへのハンドル。ハンドルは PROCESS_CREATE_THREAD、PROCESS_QUERY_INFORMATION、PROCESS_VM_OPERATION、PROCESS_VM_WRITE、PROCESS_VM_READ のアクセス権が必要で、特定のプラットフォームではこれらなしでは失敗する可能性がある。詳細は Process Security and Access Rights を参照。
lpThreadAttributes : [var] 新しいスレッドのセキュリティ記述子を指定し、子プロセスが返されたハンドルを継承できるかを決定する SECURITY_ATTRIBUTES 構造体へのポインタ。lpThreadAttributes が NULL の場合、スレッドは既定のセキュリティ記述子を取得し、ハンドルは継承できない。スレッドの既定セキュリティ記述子の ACL は作成者のプライマリトークンから取得される。Windows XP: スレッドの既定セキュリティ記述子の ACL は作成者のプライマリトークンまたは impersonation トークンから取得される。この動作は Windows XP SP2 および Windows Server 2003 から変更された。
dwStackSize : [int] スタックの初期サイズ（バイト単位）。システムはこの値を最も近いページに丸める。このパラメータが 0 の場合、新しいスレッドは実行ファイルの既定サイズを使用する。詳細は Thread Stack Size を参照。
lpStartAddress : [int] スレッドが実行するアプリケーション定義の LPTHREAD_START_ROUTINE 型関数へのポインタで、リモートプロセス内のスレッドの開始アドレスを表す。関数はリモートプロセスに存在しなければならない。詳細は ThreadProc を参照。
lpParameter : [intptr] スレッド関数に渡される変数へのポインタ。
dwCreationFlags : [int] スレッドの作成を制御するフラグ。
lpThreadId : [var] スレッド識別子を受け取る変数へのポインタ。
%inst
別のプロセスの仮想アドレス空間で実行されるスレッドを作成する。

[戻り値]
関数が成功した場合、戻り値は新しいスレッドへのハンドル。関数が失敗した場合、戻り値は NULL。拡張エラー情報を取得するには
GetLastError を呼ぶ。lpStartAddress がデータやコード、またはアクセス不可能な場所を指していても
CreateRemoteThread
は成功することがある。スレッドが実行されるとき開始アドレスが無効であれば、例外が発生しスレッドは終了する。無効な開始アドレスによるスレッドの終了はスレッドのプロセスのエラー終了として扱われる。この動作は
CreateProcess の非同期的な性質に似ており、無効な DLL や欠落した DLL を参照していてもプロセスは作成される。

[備考]
CreateRemoteThread
関数は、指定されたプロセスのアドレス空間で新しい実行スレッドを開始する。スレッドはそのプロセスが開いているすべてのオブジェクトにアクセスできる。Windows
8
より前ではターミナルサービスは設計上各ターミナルセッションを分離する。したがって、ターゲットプロセスが呼び出し側プロセスとは別のセッションにある場合、CreateRemoteThread
は失敗する。新しいスレッドハンドルは新しいスレッドへのフルアクセスで作成される。セキュリティ記述子が提供されない場合、ハンドルはスレッドオブジェクトハンドルを必要とする任意の関数で使用できる。セキュリティ記述子が提供された場合、ハンドルの後続のすべての使用でアクセスチェックが実行される。アクセスチェックがアクセスを拒否した場合、要求側プロセスはスレッドへのアクセスを得るためにハンドルを使用できない。スレッドが実行可能状態で作成された場合（つまり
CREATE_SUSPENDED フラグが使われなかった場合）、スレッドは CreateThread
が戻る前に、特に呼び出し側が作成されたスレッドのハンドルと識別子を受け取る前に実行を開始する可能性がある。スレッドはスレッド優先度
THREAD_PRIORITY_NORMAL で作成される。スレッドの優先度値を取得・設定するには GetThreadPriority
および SetThreadPriority
関数を使う。スレッドが終了すると、スレッドオブジェクトはシグナル状態となり、オブジェクトを待機していたスレッドを満たす。スレッドオブジェクトは、スレッドが終了しそれへのすべてのハンドルが
CloseHandle
の呼び出しで閉じられるまでシステム内に残る。ExitProcess、ExitThread、CreateThread、CreateRemoteThread
関数と、CreateProcess
呼び出しの結果として起動するプロセスは、プロセス内で互いにシリアライズされる。これらのイベントはアドレス空間内で一度に 1
つしか発生しない。つまり、以下の制限が成り立つ:
（以下省略）


%index
CreateSemaphoreW
名前付きまたは名前なしのセマフォオブジェクトを作成または開く。(CreateSemaphoreW)
%group
Win32 kernel32
%prm
lpSemaphoreAttributes, lInitialCount, lMaximumCount, lpName
lpSemaphoreAttributes : [var] SECURITY_ATTRIBUTES 構造体へのポインタ。このパラメータが NULL の場合、ハンドルは子プロセスに継承できない。構造体の lpSecurityDescriptor メンバーが新しいセマフォのセキュリティ記述子を指定する。このパラメータが NULL の場合、セマフォは既定のセキュリティ記述子を取得する。セマフォの既定セキュリティ記述子の ACL は作成者のプライマリトークンまたは impersonation トークンから取得される。
lInitialCount : [int] セマフォオブジェクトの初期カウント。この値はゼロ以上 lMaximumCount 以下でなければならない。セマフォの状態はカウントがゼロより大きいときにシグナル、ゼロのときに非シグナルとなる。待機関数がセマフォを待機していたスレッドを解放するたびにカウントは 1 減る。ReleaseSemaphore 関数を呼ぶことでカウントを指定量だけ増やせる。
lMaximumCount : [int] セマフォオブジェクトの最大カウント。この値はゼロより大きくなければならない。
lpName : [wstr] セマフォオブジェクトの名前。名前は MAX_PATH 文字に制限される。名前比較は大文字小文字を区別する。lpName が既存の名前付きセマフォオブジェクトの名前と一致する場合、この関数は SEMAPHORE_ALL_ACCESS アクセス権を要求する。この場合、lInitialCount と lMaximumCount パラメータは作成プロセスによって既に設定されているため無視される。lpSemaphoreAttributes パラメータが NULL でない場合、ハンドルが継承可能かを決定するが、セキュリティ記述子メンバーは無視される。lpName が NULL の場合、セマフォオブジェクトは名前なしで作成される。lpName が既存のイベント、ミューテックス、待機可能タイマ、ジョブ、またはファイルマッピングオブジェクトの名前と一致する場合、関数は失敗し GetLastError 関数は ERROR_INVALID_HANDLE を返す。これはこれらのオブジェクトが同じ名前空間を共有するために起こる。名前にはグローバル名前空間またはセッション名前空間にオブジェクトを明示的に作成するための "Global\" または "Local\" プレフィックスを付けられる。名前の残りの部分はバックスラッシュ文字 (\\) を除く任意の文字を含められる。詳細は Kernel Object Namespaces を参照。高速ユーザー切り替えはターミナルサービスセッションを使用して実装される。カーネルオブジェクト名はアプリケーションが複数ユーザーをサポートできるようターミナルサービスのガイドラインに従う必要がある。オブジェクトはプライベート名前空間に作成できる。詳細は Object Namespaces を参照。
%inst
名前付きまたは名前なしのセマフォオブジェクトを作成または開く。(CreateSemaphoreW)

[戻り値]

関数が成功した場合、戻り値はセマフォオブジェクトへのハンドル。関数呼び出し前に名前付きセマフォオブジェクトが存在していた場合、関数は既存オブジェクトへのハンドルを返し、GetLastError
は ERROR_ALREADY_EXISTS を返す。関数が失敗した場合、戻り値は NULL。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
CreateSemaphore が返すハンドルは SEMAPHORE_ALL_ACCESS
アクセス権を持ち、呼び出し側がアクセスを許可されている限り、セマフォオブジェクトへのハンドルを必要とする任意の関数で使用できる。サービスや別ユーザーを
impersonation
しているスレッドからセマフォを作成する場合、作成時にセマフォにセキュリティ記述子を適用するか、作成プロセスの既定 DACL
を変更して既定のセキュリティ記述子を変更する。詳細は Synchronization Object Security and Access
Rights
を参照。セマフォオブジェクトの状態はカウントがゼロより大きいときにシグナル、カウントがゼロと等しいときに非シグナルとなる。lInitialCount
パラメータが初期カウントを指定する。カウントはゼロより小さくなることも lMaximumCount
パラメータで指定された値を超えることもない。呼び出し側プロセスの任意のスレッドは待機関数の呼び出しでセマフォオブジェクトのハンドルを指定できる。単一オブジェクト待機関数は指定オブジェクトの状態がシグナルされたときに戻る。複数オブジェクト待機関数は指定されたオブジェクトのいずれか
1
つ、またはすべてがシグナルされたときに戻るように指示できる。待機関数が戻ると、待機中のスレッドは実行を続けるために解放される。スレッドがセマフォオブジェクトの待機を完了するたびに、セマフォオブジェクトのカウントが
1 減る。スレッドが終了したら、ReleaseSemaphore
関数を呼んでセマフォオブジェクトのカウントを増やす。複数のプロセスが同じセマフォオブジェクトのハンドルを持てるので、プロセス間同期にオブジェクトを使用できる。以下のオブジェクト共有機構が利用できる:
（以下省略）


%index
CreateSemaphoreExW
名前付きまたは名前なしのセマフォオブジェクトを作成または開き、そのオブジェクトへのハンドルを返す。(CreateSemaphoreExW)
%group
Win32 kernel32
%prm
lpSemaphoreAttributes, lInitialCount, lMaximumCount, lpName, dwFlags, dwDesiredAccess
lpSemaphoreAttributes : [var] SECURITY_ATTRIBUTES 構造体へのポインタ。このパラメータが NULL の場合、セマフォハンドルは子プロセスに継承できない。
lInitialCount : [int] セマフォオブジェクトの初期カウント。この値はゼロ以上 lMaximumCount 以下でなければならない。セマフォの状態はカウントがゼロより大きいときにシグナル、ゼロのときに非シグナルとなる。待機関数がセマフォを待機していたスレッドを解放するたびにカウントは 1 減る。ReleaseSemaphore 関数を呼ぶことでカウントを指定量だけ増やせる。
lMaximumCount : [int] セマフォオブジェクトの最大カウント。この値はゼロより大きくなければならない。
lpName : [wstr] セマフォオブジェクトの名前を指定する null 終端文字列へのポインタ。名前は MAX_PATH 文字に制限される。名前比較は大文字小文字を区別する。lpName が既存の名前付きセマフォオブジェクトの名前と一致する場合、lInitialCount と lMaximumCount パラメータは作成プロセスによって既に設定されているため無視される。lpSemaphoreAttributes パラメータが NULL でない場合、ハンドルが継承可能かを決定する。lpName が NULL の場合、セマフォオブジェクトは名前なしで作成される。lpName が既存のイベント、ミューテックス、待機可能タイマ、ジョブ、またはファイルマッピングオブジェクトの名前と一致する場合、関数は失敗し GetLastError 関数は ERROR_INVALID_HANDLE を返す。これはこれらのオブジェクトが同じ名前空間を共有するために起こる。名前にはグローバル名前空間またはセッション名前空間にオブジェクトを明示的に作成するための "Global\" または "Local\" プレフィックスを付けられる。名前の残りの部分はバックスラッシュ文字 (\\) を除く任意の文字を含められる。詳細は Kernel Object Namespaces を参照。高速ユーザー切り替えはターミナルサービスセッションを使用して実装される。カーネルオブジェクト名はアプリケーションが複数ユーザーをサポートできるようターミナルサービスのガイドラインに従う必要がある。オブジェクトはプライベート名前空間に作成できる。詳細は Object Namespaces を参照。
dwFlags : [int] このパラメータは予約済みで、0 でなければならない。
dwDesiredAccess : [int] セマフォオブジェクトのアクセスマスク。アクセス権の一覧は Synchronization Object Security and Access Rights を参照。
%inst
名前付きまたは名前なしのセマフォオブジェクトを作成または開き、そのオブジェクトへのハンドルを返す。(CreateSemaphoreExW)

[戻り値]

関数が成功した場合、戻り値はセマフォオブジェクトへのハンドル。関数呼び出し前に名前付きセマフォオブジェクトが存在していた場合、関数は既存オブジェクトへのハンドルを返し、GetLastError
は ERROR_ALREADY_EXISTS を返す。関数が失敗した場合、戻り値は NULL。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]

セマフォオブジェクトの状態はカウントがゼロより大きいときにシグナル、カウントがゼロと等しいときに非シグナルとなる。lInitialCount
パラメータが初期カウントを指定する。カウントはゼロより小さくなることも lMaximumCount
パラメータで指定された値を超えることもない。呼び出し側プロセスの任意のスレッドは待機関数の呼び出しでセマフォオブジェクトのハンドルを指定できる。単一オブジェクト待機関数は指定オブジェクトの状態がシグナルされたときに戻る。複数オブジェクト待機関数は指定されたオブジェクトのいずれか
1
つ、またはすべてがシグナルされたときに戻るように指示できる。待機関数が戻ると、待機中のスレッドは実行を続けるために解放される。スレッドがセマフォオブジェクトの待機を完了するたびに、セマフォオブジェクトのカウントが
1 減る。スレッドが終了したら、ReleaseSemaphore
関数を呼んでセマフォオブジェクトのカウントを増やす。複数のプロセスが同じセマフォオブジェクトのハンドルを持てるので、プロセス間同期にオブジェクトを使用できる。以下のオブジェクト共有機構が利用できる:
（以下省略）


%index
CreateSymbolicLinkW
シンボリックリンクを作成する。(Unicode)
%group
Win32 kernel32
%prm
lpSymlinkFileName, lpTargetFileName, dwFlags
lpSymlinkFileName : [wstr] 作成するシンボリックリンク。このパラメータにはパスを含めてよい。この関数の ANSI 版では、名前は MAX_PATH 文字に制限されている。この制限を 32,767 ワイド文字まで拡張するには、Unicode 版を呼びパスの先頭に "\\?\" を付ける。詳細は Naming a File を参照。ヒント: Windows 10 バージョン 1607 以降、Unicode 版 (CreateSymbolicLinkW) では、"\\?\" を前置せずに MAX_PATH 制限を取り除くことにオプトインできる。詳細は Naming Files, Paths, and Namespaces の "Maximum Path Length Limitation" セクションを参照。
lpTargetFileName : [wstr] 作成するシンボリックリンクのターゲット名。lpTargetFileName にデバイス名が関連付けられている場合、リンクは絶対リンクとして扱われる。そうでない場合、リンクは相対リンクとして扱われる。このパラメータにはパスを含めてよい。この関数の ANSI 版では、名前は MAX_PATH 文字に制限されている。この制限を 32,767 ワイド文字まで拡張するには、Unicode 版を呼びパスの先頭に "\\?\" を付ける。詳細は Naming a File を参照。ヒント: Windows 10 バージョン 1607 以降、Unicode 版 (CreateSymbolicLinkW) では、"\\?\" を前置せずに MAX_PATH 制限を取り除くことにオプトインできる。詳細は Naming Files, Paths, and Namespaces の "Maximum Path Length Limitation" セクションを参照。
dwFlags : [int] リンクのターゲット lpTargetFileName がディレクトリかを示す。
%inst
シンボリックリンクを作成する。(Unicode)

[戻り値]
関数が成功した場合、戻り値はゼロ以外。関数が失敗した場合、戻り値はゼロ。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]

シンボリックリンクは絶対リンクまたは相対リンクのいずれかである。絶対リンクはパス名の各部分を指定するリンクである。相対リンクは、指定されたパス内の相対リンク指定子がある場所を基準として決定される。相対リンクは以下の規約を使って指定される:
（以下省略）


%index
CreateSymbolicLinkTransactedW
シンボリックリンクをトランザクション操作として作成する。(Unicode)
%group
Win32 kernel32
%prm
lpSymlinkFileName, lpTargetFileName, dwFlags, hTransaction
lpSymlinkFileName : [wstr] 作成するシンボリックリンク。
lpTargetFileName : [wstr] 作成するシンボリックリンクのターゲット名。lpTargetFileName にデバイス名が関連付けられている場合、リンクは絶対リンクとして扱われる。そうでない場合、リンクは相対リンクとして扱われる。
dwFlags : [int] リンクのターゲット lpTargetFileName がディレクトリかを示す。
hTransaction : [intptr] トランザクションへのハンドル。このハンドルは CreateTransaction 関数が返す。
%inst
シンボリックリンクをトランザクション操作として作成する。(Unicode)

[戻り値]
関数が成功した場合、戻り値はゼロ以外。関数が失敗した場合、戻り値はゼロ。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]

シンボリックリンクは絶対リンクまたは相対リンクのいずれかである。絶対リンクはパス名の各部分を指定するリンクである。相対リンクは、指定されたパス内の相対リンク指定子がある場所を基準として決定される。相対リンクは以下の規約を使って指定される:
（以下省略）


%index
CreateTapePartition
テープをフォーマットし直す。
%group
Win32 kernel32
%prm
hDevice, dwPartitionMethod, dwCount, dwSize
hDevice : [intptr] 新しいパーティションを作成するデバイスへのハンドル。このハンドルは CreateFile 関数で作成する。
dwPartitionMethod : [int] 
dwCount : [int] 作成するパーティションの数。GetTapeParameters 関数がテープがサポートできるパーティションの最大数を提供する。
dwSize : [int] 各パーティションのサイズ（メガバイト単位）。dwPartitionMethod パラメータが TAPE_SELECT_PARTITIONS の場合、この値は無視される。
%inst
テープをフォーマットし直す。

[戻り値]
関数が成功した場合、戻り値は NO_ERROR。関数が失敗した場合、以下のいずれかのエラーコードを返す。
（以下省略）

[備考]
パーティションの作成はテープをフォーマットし直す。テープに以前記録されていたすべての情報は破棄される。


%index
CreateThread
呼び出し側プロセスの仮想アドレス空間内で実行されるスレッドを作成する。
%group
Win32 kernel32
%prm
lpThreadAttributes, dwStackSize, lpStartAddress, lpParameter, dwCreationFlags, lpThreadId
lpThreadAttributes : [var] 返されるハンドルが子プロセスに継承可能かを決定する SECURITY_ATTRIBUTES 構造体へのポインタ。lpThreadAttributes が NULL の場合、ハンドルは継承できない。構造体の lpSecurityDescriptor メンバーが新しいスレッドのセキュリティ記述子を指定する。lpThreadAttributes が NULL の場合、スレッドは既定のセキュリティ記述子を取得する。スレッドの既定セキュリティ記述子の ACL は作成者のプライマリトークンから取得される。
dwStackSize : [int] スタックの初期サイズ（バイト単位）。システムはこの値を最も近いページに丸める。このパラメータがゼロの場合、新しいスレッドは実行ファイルの既定サイズを使用する。詳細は Thread Stack Size を参照。
lpStartAddress : [int] スレッドが実行するアプリケーション定義の関数へのポインタ。このポインタはスレッドの開始アドレスを表す。スレッド関数の詳細は ThreadProc を参照。
lpParameter : [intptr] スレッドに渡される変数へのポインタ。
dwCreationFlags : [int] スレッドの作成を制御するフラグ。
lpThreadId : [var] スレッド識別子を受け取る変数へのポインタ。このパラメータが NULL の場合、スレッド識別子は返されない。
%inst
呼び出し側プロセスの仮想アドレス空間内で実行されるスレッドを作成する。

[戻り値]
関数が成功した場合、戻り値は新しいスレッドへのハンドル。関数が失敗した場合、戻り値は NULL。拡張エラー情報を取得するには
GetLastError を呼ぶ。lpStartAddress がデータやコード、またはアクセス不可能な場所を指していても
CreateThread
は成功することがある。スレッドが実行されるとき開始アドレスが無効であれば、例外が発生しスレッドは終了する。無効な開始アドレスによるスレッドの終了はスレッドのプロセスのエラー終了として扱われる。この動作は
CreateProcess の非同期的な性質に似ており、無効な DLL や欠落した DLL を参照していてもプロセスは作成される。

[備考]
プロセスが作成できるスレッドの数は利用可能な仮想メモリによって制限される。既定では、各スレッドは 1
メガバイトのスタック領域を持つ。したがって、最大 2,048
個のスレッドを作成できる。既定のスタックサイズを減らせば、より多くのスレッドを作成できる。ただし、アプリケーションはプロセッサごとに 1
スレッドを作成し、アプリケーションがコンテキスト情報を保持する要求のキューを構築したほうがパフォーマンスが向上する。スレッドは次のキューの要求を処理する前に、そのキュー内のすべての要求を処理する。新しいスレッドハンドルは
THREAD_ALL_ACCESS
アクセス権で作成される。スレッド作成時にセキュリティ記述子が提供されない場合、スレッドを作成するプロセスのプライマリトークンを使って新しいスレッド用に既定のセキュリティ記述子が構築される。呼び出し側が
OpenThread
関数でスレッドにアクセスしようとすると、呼び出し側の実効トークンがこのセキュリティ記述子に対して評価され、アクセスが付与または拒否される。新しく作成されたスレッドは、GetCurrentThread
関数を呼ぶとき自身に対するフルアクセス権を持つ。Windows Server 2003:
スレッドの自身に対するアクセス権は、スレッドが作成されたプロセスのプライマリトークンをスレッド用に構築された既定のセキュリティ記述子に対して評価することで計算される。スレッドがリモートプロセスに作成された場合、リモートプロセスのプライマリトークンが使われる。結果として、新しく作成されたスレッドは
GetCurrentThread
を呼ぶとき自身に対するアクセス権が削減されている可能性がある。THREAD_SET_THREAD_TOKEN や
THREAD_GET_CONTEXT などのアクセス権が存在しないと、予期しない失敗につながる可能性がある。このため、別のユーザーを
impersonation している間にスレッドを作成することは推奨されない。スレッドが実行可能状態で作成された場合（つまり
CREATE_SUSPENDED フラグが使われなかった場合）、スレッドは CreateThread
が戻る前に、特に呼び出し側が作成されたスレッドのハンドルと識別子を受け取る前に実行を開始する可能性がある。スレッドの実行は
lpStartAddress パラメータで指定された関数から始まる。この関数が戻ると、その DWORD 戻り値が ExitThread
関数への暗黙的な呼び出しでスレッドを終了させるために使われる。スレッドの戻り値を取得するには GetExitCodeThread
関数を使う。スレッドはスレッド優先度 THREAD_PRIORITY_NORMAL で作成される。スレッドの優先度値を取得・設定するには
GetThreadPriority および SetThreadPriority
関数を使う。スレッドが終了すると、スレッドオブジェクトはシグナル状態となり、オブジェクトを待機していた任意のスレッドを満たす。スレッドオブジェクトは、スレッドが終了しそれへのすべてのハンドルが
CloseHandle
の呼び出しで閉じられるまでシステム内に残る。ExitProcess、ExitThread、CreateThread、CreateRemoteThread
関数と、CreateProcess
呼び出しの結果として起動するプロセスは、プロセス内で互いにシリアライズされる。これらのイベントはアドレス空間内で一度に 1
つしか発生しない。つまり、以下の制限が成り立つ:
（以下省略）


%index
CloseThreadpool
指定されたスレッドプールを閉じる。
%group
Win32 kernel32
%prm
ptpp
ptpp : [intptr] スレッドプールを定義する TP_POOL 構造体へのポインタ。CreateThreadpool 関数がこのポインタを返す。
%inst
指定されたスレッドプールを閉じる。

[備考]

プールにバインドされている未完了のワーク、I/O、タイマ、待機オブジェクトがない場合、スレッドプールは直ちに閉じられる。そうでない場合、未完了のオブジェクトが解放された後で非同期にスレッドプールが解放される。この関数を使用するアプリケーションをコンパイルするには、_WIN32_WINNT
を 0x0600 以降として定義する。


%index
CreateThreadpool
コールバックを実行するための新しいスレッドプールを割り当てる。
%group
Win32 kernel32
%prm
reserved
reserved : [intptr] このパラメータは予約済みで、NULL でなければならない。
%inst
コールバックを実行するための新しいスレッドプールを割り当てる。

[戻り値]
関数が成功した場合、新しく割り当てられたスレッドプールを表す TP_POOL
構造体へのポインタを返す。アプリケーションはこの構造体のメンバーを変更してはならない。関数が失敗した場合は NULL
を返す。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
新しいスレッドプールを作成した後、プールが割り当て可能なスレッドの最大数を指定するには
SetThreadpoolThreadMaximum を、プールで利用可能なスレッドの最小数を指定するには
SetThreadpoolThreadMinimum
を呼ぶべきである。プールを使うには、プールをコールバック環境に関連付ける必要がある。コールバック環境を作成するには
InitializeThreadpoolEnvironment を呼ぶ。その後、SetThreadpoolCallbackPool
を呼んでプールをコールバック環境に関連付ける。スレッドプールを解放するには CloseThreadpool
を呼ぶ。この関数を使用するアプリケーションをコンパイルするには、_WIN32_WINNT を 0x0600 以降として定義する。


%index
CloseThreadpoolCleanupGroup
指定されたクリーンアップグループを閉じる。
%group
Win32 kernel32
%prm
ptpcg
ptpcg : [intptr] クリーンアップグループを定義する TP_CLEANUP_GROUP 構造体へのポインタ。CreateThreadpoolCleanupGroup がこのポインタを返す。
%inst
指定されたクリーンアップグループを閉じる。

[備考]
この関数を呼ぶときクリーンアップグループにはメンバーがあってはならない。グループメンバーの削除については
CloseThreadpoolCleanupGroupMembers
を参照。この関数を使用するアプリケーションをコンパイルするには、_WIN32_WINNT を 0x0600 以降として定義する。


%index
CreateThreadpoolCleanupGroup
アプリケーションが 1 つ以上のスレッドプールコールバックを追跡するために使えるクリーンアップグループを作成する。
%group
Win32 kernel32
%prm

%inst
アプリケーションが 1 つ以上のスレッドプールコールバックを追跡するために使えるクリーンアップグループを作成する。

[戻り値]
関数が成功した場合、新しく割り当てられたクリーンアップグループの TP_CLEANUP_GROUP
構造体へのポインタを返す。アプリケーションはこの構造体のメンバーを変更してはならない。関数が失敗した場合は NULL
を返す。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
クリーンアップグループを作成した後、SetThreadpoolCallbackCleanupGroup
を呼んでクリーンアップグループをコールバック環境に関連付ける。
（以下省略）


%index
CloseThreadpoolIo
指定された I/O 完了オブジェクトを解放する。
%group
Win32 kernel32
%prm
pio
pio : [intptr] I/O 完了オブジェクトを定義する TP_IO 構造体へのポインタ。CreateThreadpoolIo 関数がこのポインタを返す。
%inst
指定された I/O 完了オブジェクトを解放する。

[備考]
未完了のコールバックがない場合、I/O
完了オブジェクトは直ちに解放される。そうでない場合、未完了のコールバックが完了した後で非同期に解放される。この関数を呼ぶ前に、関連するファイルハンドルを閉じ、すべての未完了のオーバーラップ
I/O 操作の完了を待つべきである。この関数を呼んだ後はそれ以上オーバーラップ I/O
操作を発生させてはならない。メモリリークを防ぐため、スレッドプール I/O 通知のキャンセルが必要な場合がある。詳細は
CancelThreadpoolIo を参照。この関数を使用するアプリケーションをコンパイルするには、_WIN32_WINNT を
0x0600 以降として定義する。


%index
CreateThreadpoolIo
新しい I/O 完了オブジェクトを作成する。
%group
Win32 kernel32
%prm
fl, pfnio, pv, pcbe
fl : [intptr] この I/O 完了オブジェクトにバインドするファイルハンドル。
pfnio : [int] ファイル上でオーバーラップ I/O 操作が完了するたびに呼ばれるコールバック関数。詳細は IoCompletionCallback を参照。
pv : [intptr] コールバック関数に渡す省略可能なアプリケーション定義データ。
pcbe : [var] コールバックを実行する環境を定義する TP_CALLBACK_ENVIRON 構造体へのポインタ。この関数を呼ぶ前に InitializeThreadpoolEnvironment 関数を使って構造体を初期化する。このパラメータが NULL の場合、コールバックは既定のコールバック環境で実行される。詳細は InitializeThreadpoolEnvironment を参照。
%inst
新しい I/O 完了オブジェクトを作成する。

[戻り値]
関数が成功した場合、I/O オブジェクトを定義する TP_IO
構造体へのポインタを返す。アプリケーションはこの構造体のメンバーを変更してはならない。関数が失敗した場合は NULL
を返す。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
オーバーラップ I/O 完了コールバックの受信を開始するには StartThreadpoolIo 関数を呼ぶ。I/O
完了オブジェクトにバインドされたファイルハンドルに FILE_SKIP_COMPLETION_PORT_ON_SUCCESS
通知モードがあり、非同期 I/O 操作が成功で直ちに戻る場合、I/O 完了コールバック関数は呼ばれず、スレッドプール I/O
通知をキャンセルする必要がある。詳細は CancelThreadpoolIo
を参照。この関数を使用するアプリケーションをコンパイルするには、_WIN32_WINNT を 0x0600 以降として定義する。


%index
CloseThreadpoolTimer
指定されたタイマオブジェクトを解放する。
%group
Win32 kernel32
%prm
pti
pti : [intptr] タイマオブジェクトを定義する TP_TIMER 構造体へのポインタ。CreateThreadpoolTimer 関数がこのポインタを返す。
%inst
指定されたタイマオブジェクトを解放する。

[備考]

未完了のコールバックがない場合、タイマオブジェクトは直ちに解放される。そうでない場合、未完了のコールバック関数が完了した後で非同期に解放される。場合によっては
CloseThreadpoolTimer 呼び出し後にコールバック関数が実行されることがある。この動作を防ぐには: *
SetThreadpoolTimer 関数または SetThreadpoolTimerEx 関数を、pftDueTime パラメータを
NULL、msPeriod および msWindowLength を 0 にして呼ぶ。*
WaitForThreadpoolTimerCallbacks 関数を fCancelPendingCallbacks を TRUE
にして呼ぶ。* CloseThreadpoolTimer
を呼ぶ。タイマオブジェクトに関連付けられたクリーンアップグループがある場合、この関数を呼ぶ必要はない。CloseThreadpoolCleanupGroupMembers
関数を呼ぶと、クリーンアップグループに関連付けられたワーク、待機、タイマオブジェクトが解放される。この関数を使用するアプリケーションをコンパイルするには、_WIN32_WINNT
を 0x0600 以降として定義する。


%index
CreateThreadpoolTimer
新しいタイマオブジェクトを作成する。
%group
Win32 kernel32
%prm
pfnti, pv, pcbe
pfnti : [int] タイマオブジェクトが満了するたびに呼ばれるコールバック関数。詳細は TimerCallback を参照。
pv : [intptr] コールバック関数に渡す省略可能なアプリケーション定義データ。
pcbe : [var] コールバックを実行する環境を定義する TP_CALLBACK_ENVIRON 構造体。InitializeThreadpoolEnvironment 関数がこの構造体を返す。このパラメータが NULL の場合、コールバックは既定のコールバック環境で実行される。詳細は InitializeThreadpoolEnvironment を参照。
%inst
新しいタイマオブジェクトを作成する。

[戻り値]
関数が成功した場合、タイマオブジェクトを定義する TP_TIMER
構造体へのポインタを返す。アプリケーションはこの構造体のメンバーを変更してはならない。関数が失敗した場合は NULL
を返す。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
タイマオブジェクトを設定するには SetThreadpoolTimer
関数を呼ぶ。この関数を使用するアプリケーションをコンパイルするには、_WIN32_WINNT を 0x0600 以降として定義する。


%index
CloseThreadpoolWait
指定された待機オブジェクトを解放する。
%group
Win32 kernel32
%prm
pwa
pwa : [intptr] 待機オブジェクトを定義する TP_WAIT 構造体へのポインタ。CreateThreadpoolWait 関数がこのポインタを返す。
%inst
指定された待機オブジェクトを解放する。

[備考]

未完了のコールバックがない場合、待機オブジェクトは直ちに解放される。そうでない場合、未完了のコールバックが完了した後で非同期に解放される。場合によっては
CloseThreadpoolWait 呼び出し後にコールバック関数が実行されることがある。この動作を防ぐには: *
SetThreadpoolWait 関数または SetThreadpoolWaitEx 関数を h パラメータを NULL にして呼ぶ。*
WaitForThreadpoolWaitCallbacks 関数を fCancelPendingCallbacks を TRUE
にして呼ぶ。* CloseThreadpoolWait
を呼ぶ。待機オブジェクトに関連付けられたクリーンアップグループがある場合、この関数を呼ぶ必要はない。CloseThreadpoolCleanupGroupMembers
関数を呼ぶと、クリーンアップグループに関連付けられたワーク、待機、タイマオブジェクトが解放される。この関数を使用するアプリケーションをコンパイルするには、_WIN32_WINNT
を 0x0600 以降として定義する。


%index
CreateThreadpoolWait
新しい待機オブジェクトを作成する。
%group
Win32 kernel32
%prm
pfnwa, pv, pcbe
pfnwa : [int] 待機が完了またはタイムアウトしたときに呼ばれるコールバック関数。詳細は WaitCallback を参照。
pv : [intptr] コールバック関数に渡す省略可能なアプリケーション定義データ。
pcbe : [var] コールバックを実行する環境を定義する TP_CALLBACK_ENVIRON 構造体。InitializeThreadpoolEnvironment 関数がこの構造体を返す。このパラメータが NULL の場合、コールバックは既定のコールバック環境で実行される。詳細は InitializeThreadpoolEnvironment を参照。
%inst
新しい待機オブジェクトを作成する。

[戻り値]
関数が成功した場合、待機オブジェクトを定義する TP_WAIT
構造体へのポインタを返す。アプリケーションはこの構造体のメンバーを変更してはならない。関数が失敗した場合は NULL
を返す。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
待機オブジェクトを設定するには SetThreadpoolWait または SetThreadpoolWaitEx
関数を呼ぶ。作業項目とそれが呼ぶ関数は、戻った後にスレッドに依存してはならない。したがって、REG_NOTIFY_THREAD_AGNOSTIC
フラグなしの RegNotifyChangeKeyValue
関数のような永続的なスレッドを必要とする非同期呼び出しを既定のコールバック環境から呼ぶことはできない。代わりに、寿命を自分で制御するスレッドを使う。この関数を使用するアプリケーションをコンパイルするには、_WIN32_WINNT
を 0x0600 以降として定義する。


%index
CloseThreadpoolWork
指定されたワークオブジェクトを解放する。
%group
Win32 kernel32
%prm
pwk
pwk : [intptr] ワークオブジェクトを定義する TP_WORK 構造体へのポインタ。CreateThreadpoolWork 関数がこのポインタを返す。
%inst
指定されたワークオブジェクトを解放する。

[備考]

未完了のコールバックがない場合、ワークオブジェクトは直ちに解放される。そうでない場合、未完了のコールバックが完了した後で非同期に解放される。ワークオブジェクトに関連付けられたクリーンアップグループがある場合、この関数を呼ぶ必要はない。CloseThreadpoolCleanupGroupMembers
関数を呼ぶと、クリーンアップグループに関連付けられたワーク、待機、タイマオブジェクトが解放される。この関数を使用するアプリケーションをコンパイルするには、_WIN32_WINNT
を 0x0600 以降として定義する。


%index
CreateThreadpoolWork
新しいワークオブジェクトを作成する。
%group
Win32 kernel32
%prm
pfnwk, pv, pcbe
pfnwk : [int] コールバック関数。SubmitThreadpoolWork を呼んでワークオブジェクトをポストするたびに、ワーカースレッドがこのコールバックを呼ぶ。詳細は WorkCallback を参照。
pv : [intptr] コールバック関数に渡す省略可能なアプリケーション定義データ。
pcbe : [var] コールバックを実行する環境を定義する TP_CALLBACK_ENVIRON 構造体へのポインタ。この関数を呼ぶ前に InitializeThreadpoolEnvironment 関数を使って構造体を初期化する。このパラメータが NULL の場合、コールバックは既定のコールバック環境で実行される。詳細は InitializeThreadpoolEnvironment を参照。
%inst
新しいワークオブジェクトを作成する。

[戻り値]
関数が成功した場合、ワークオブジェクトを定義する TP_WORK
構造体へのポインタを返す。アプリケーションはこの構造体のメンバーを変更してはならない。関数が失敗した場合は NULL
を返す。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
この関数を使用するアプリケーションをコンパイルするには、_WIN32_WINNT を 0x0600 以降として定義する。


%index
CreateTimerQueue
タイマ用のキューを作成する。
%group
Win32 kernel32
%prm

%inst
タイマ用のキューを作成する。

[戻り値]

関数が成功した場合、戻り値はタイマキューへのハンドル。このハンドルはタイマキューへのハンドルを必要とする関数でのみ使用できる。関数が失敗した場合、戻り値は
NULL。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
タイマをキューに追加するには CreateTimerQueueTimer 関数を呼ぶ。キューからタイマを削除するには
DeleteTimerQueueTimer 関数を呼ぶ。タイマキューを使い終えたら、DeleteTimerQueueEx
関数を呼んでタイマキューを削除する。キュー内の保留中のタイマはキャンセルされて削除される。この関数を使用するアプリケーションをコンパイルするには、_WIN32_WINNT
を 0x0500 以降として定義する。詳細は Using the Windows Headers を参照。


%index
CreateTimerQueueTimer
タイマキュータイマを作成する。このタイマは指定された DueTime で満了し、その後指定された周期ごとに満了する。タイマが満了するとコールバック関数が呼ばれる。
%group
Win32 kernel32
%prm
phNewTimer, TimerQueue, Callback, Parameter, DueTime, Period, Flags
phNewTimer : [intptr] 戻り時にタイマキュータイマへのハンドルを受け取るバッファへのポインタ。このハンドルが期限切れになり不要になったら、DeleteTimerQueueTimer を呼んで解放する。
TimerQueue : [intptr] タイマキューへのハンドル。このハンドルは CreateTimerQueue 関数が返す。このパラメータが NULL の場合、タイマは既定のタイマキューに関連付けられる。
Callback : [int] タイマが満了したときに実行されるアプリケーション定義の WAITORTIMERCALLBACK 型関数へのポインタ。詳細は WaitOrTimerCallback を参照。
Parameter : [intptr] コールバック関数に渡される 1 つのパラメータ値。
DueTime : [int] タイマが初めてシグナルされるまでに経過すべき、現在時刻からの相対時間（ミリ秒単位）。
Period : [int] タイマの周期（ミリ秒単位）。このパラメータがゼロの場合、タイマは 1 度だけシグナルされる。ゼロより大きい場合、タイマは周期タイマとなる。周期タイマはキャンセルされるまで周期が経過するたびに自動的に再有効化される。
Flags : [int] 
%inst
タイマキュータイマを作成する。このタイマは指定された DueTime
で満了し、その後指定された周期ごとに満了する。タイマが満了するとコールバック関数が呼ばれる。

[戻り値]
関数が成功した場合、戻り値はゼロ以外。関数が失敗した場合、戻り値はゼロ。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
DueTime と Period の両パラメータがゼロ以外の場合、タイマはまず DueTime
でシグナルされ、その後周期的にシグナルされる。コールバックは前回のコールバックの実行が終わっているかどうかに関わらず、周期が経過するたびに呼ばれる。コールバック関数はスレッドプールにキューされる。これらのスレッドはスケジューリング遅延の影響を受けるため、アプリケーションやシステムで他に何が起きているかによってタイミングが変動する可能性がある。システムがスリープやハイバネーションで過ごす時間はタイマの満了に加算されない。タイマは、システムが起動状態で過ごす累積時間がタイマの
DueTime または Period に一致したときにシグナルされる。Windows Server 2003 および Windows
XP:
システムがスリープやハイバネーションで過ごす時間はタイマの満了に加算される。システムがスリープ中にタイマが満了する場合、システムが起動したときに直ちにシグナルされる。タイマをキャンセルするには
DeleteTimerQueueTimer 関数を呼ぶ。タイマキュー内のすべてのタイマをキャンセルするには
DeleteTimerQueueEx 関数を呼ぶ。既定では、スレッドプールの最大スレッド数は 500
である。この上限を引き上げるには、WinNT.h で定義されている WT_SET_MAX_THREADPOOL_THREAD
マクロを使う。
（以下省略）


%index
CreateToolhelp32Snapshot
指定したプロセス、およびそれらのプロセスが使用するヒープ、モジュール、スレッドのスナップショットを取得する。
%group
Win32 kernel32
%prm
dwFlags, th32ProcessID
dwFlags : [int] 
th32ProcessID : [int] スナップショットに含めるプロセスのプロセス識別子。このパラメータを 0 にすると現在のプロセスを示す。このパラメータは TH32CS_SNAPHEAPLIST、TH32CS_SNAPMODULE、TH32CS_SNAPMODULE32、または TH32CS_SNAPALL 値が指定された場合に使用される。それ以外の場合は無視され、すべてのプロセスがスナップショットに含まれる。指定されたプロセスが Idle プロセスまたは CSRSS プロセスの 1 つである場合、それらのアクセス制限によりユーザーレベルのコードでは開けないため、関数は失敗し最後のエラーコードは ERROR_ACCESS_DENIED となる。指定されたプロセスが 64bit プロセスで呼び出し側が 32bit プロセスの場合、関数は失敗し最後のエラーコードは ERROR_PARTIAL_COPY (299) となる。
%inst
指定したプロセス、およびそれらのプロセスが使用するヒープ、モジュール、スレッドのスナップショットを取得する。

[戻り値]
関数が成功した場合、戻り値は指定したスナップショットへのオープンハンドルである。関数が失敗した場合、戻り値は
INVALID_HANDLE_VALUE となる。拡張エラー情報を取得するには GetLastError
を呼ぶ。発生し得るエラーコードには ERROR_BAD_LENGTH などが含まれる。

[備考]
この関数で取得したスナップショットは他の tool help
関数によって参照され結果が提供される。スナップショットへのアクセスは読み取り専用である。スナップショットハンドルはオブジェクトハンドルとして機能し、有効なプロセスやスレッドに関する同じ規則に従う。すべてのプロセスのヒープやモジュール状態を列挙するには、TH32CS_SNAPALL
を指定し th32ProcessID を 0 に設定する。次にスナップショット内の追加プロセスごとに、プロセス識別子と
TH32CS_SNAPHEAPLIST または TH32_SNAPMODULE 値を指定して再度
CreateToolhelp32Snapshot
を呼ぶ。現在のプロセス以外のヒープやモジュールを含むスナップショットを取得する際、CreateToolhelp32Snapshot
はさまざまな理由で失敗したり誤った情報を返したりすることがある。たとえば対象プロセスのローダーデータテーブルが破損していたり初期化されていなかったり、関数呼び出し中に
DLL のロード/アンロードによりモジュールリストが変化した場合、関数は ERROR_BAD_LENGTH
などのエラーコードで失敗することがある。対象プロセスがサスペンド状態で起動されていないことを確認し、関数を再度呼び出してみる。TH32CS_SNAPMODULE
または TH32CS_SNAPMODULE32 で呼び出した際 ERROR_BAD_LENGTH
で失敗する場合は、成功するまで関数を繰り返し呼ぶ。TH32CS_SNAPMODULE と TH32CS_SNAPMODULE32 フラグは
LOAD_LIBRARY_AS_DATAFILE などのフラグでロードされたモジュールのハンドルは取得しない。詳細は
LoadLibraryEx を参照。スナップショットを破棄するには CloseHandle 関数を使用する。なお
QueryFullProcessImageName 関数を使うと、32bit プロセスからでも 32bit/64bit
いずれのプロセスについても実行可能イメージのフルネームを取得できる。


%index
CreateUmsCompletionList
ユーザーモードスケジューリング (UMS) 完了リストを作成する。
%group
Win32 kernel32
%prm
UmsCompletionList
UmsCompletionList : [var] PUMS_COMPLETION_LIST 変数。出力時、このパラメータは空の UMS 完了リストへのポインタを受け取る。
%inst
ユーザーモードスケジューリング (UMS) 完了リストを作成する。

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼ぶ。発生し得るエラー値には次のものが含まれる。
（以下省略）

[備考]
完了リストはスケジューラスレッドを作成するために EnterUmsSchedulingMode 関数が呼ばれたとき UMS
スケジューラスレッドに関連付けられる。システムは新しく作成された UMS
ワーカースレッドを完了リストにキューする。また、以前にブロックされていた UMS
ワーカースレッドがブロック解除されたときも、それらを完了リストにキューする。アプリケーションの UmsSchedulerProc
エントリポイント関数が呼ばれたとき、アプリケーションのスケジューラは DequeueUmsCompletionListItems
を呼んで完了リストから項目を取得する必要がある。各完了リストには関連する完了リストイベントがあり、空のリストにシステムが項目をキューしたときに必ずシグナルされる。指定された完了リストのイベントへのハンドルを取得するには
GetUmsCompletionListEvent を使用する。完了リストが不要になったら DeleteUmsCompletionList
を使ってリストを解放する。解放する前にリストは空でなければならない。


%index
CreateUmsThreadContext
UMS ワーカースレッドを表すユーザーモードスケジューリング (UMS) スレッドコンテキストを作成する。
%group
Win32 kernel32
%prm
lpUmsThread
lpUmsThread : [var] PUMS_CONTEXT 変数。出力時、このパラメータは UMS スレッドコンテキストへのポインタを受け取る。
%inst
UMS ワーカースレッドを表すユーザーモードスケジューリング (UMS) スレッドコンテキストを作成する。

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼ぶ。発生し得るエラー値には次のものが含まれる。
（以下省略）

[備考]
UMS スレッドコンテキストは UMS ワーカースレッドの状態を表す。スレッドコンテキストは関数呼び出しで UMS
ワーカースレッドを指定するために使用される。UMS ワーカースレッドは、InitializeProcThreadAttributeList
と UpdateProcThreadAttribute を使ってスレッド用の UMS
属性リストを準備したのち、CreateRemoteThreadEx 関数を呼んで作成される。UMS
スレッドコンテキストの基となる構造体はシステムによって管理されており、直接変更してはならない。UMS
ワーカースレッドの情報を取得・設定するには QueryUmsThreadInformation と
SetUmsThreadInformation 関数を使用する。UMS ワーカースレッドが終了したあと、そのスレッドコンテキストは
DeleteUmsThreadContext を呼んで解放する必要がある。


%index
CreateWaitableTimerW
待機可能タイマーオブジェクトを作成または開く。
%group
Win32 kernel32
%prm
lpTimerAttributes, bManualReset, lpTimerName
lpTimerAttributes : [var] 新しいタイマーオブジェクトのセキュリティ記述子を指定し、返されたハンドルを子プロセスが継承できるかを決定する SECURITY_ATTRIBUTES 構造体へのポインタ。lpTimerAttributes が NULL の場合、タイマーオブジェクトはデフォルトセキュリティ記述子を取得しハンドルは継承できない。タイマーのデフォルトセキュリティ記述子の ACL は作成者のプライマリトークンまたは偽装トークンに由来する。
bManualReset : [int] このパラメータが TRUE の場合、タイマーは手動リセット通知タイマーとなる。それ以外の場合は同期タイマーとなる。
lpTimerName : [wstr] タイマーオブジェクトの名前。名前は MAX_PATH 文字までに制限される。名前比較は大文字小文字を区別する。
%inst
待機可能タイマーオブジェクトを作成または開く。

[戻り値]

関数が成功した場合、戻り値はタイマーオブジェクトへのハンドルである。関数呼び出しの前に名前付きタイマーオブジェクトが存在していた場合、関数は既存オブジェクトへのハンドルを返し、GetLastError
は ERROR_ALREADY_EXISTS を返す。関数が失敗した場合、戻り値は NULL である。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
CreateWaitableTimer によって返されるハンドルは TIMER_ALL_ACCESS
アクセス権で作成される。呼び出し側にアクセスが許可されていれば、タイマーオブジェクトへのハンドルを必要とする任意の関数で使用できる。タイマーが別ユーザーを偽装しているサービスやスレッドから作成された場合、作成時にタイマーへセキュリティ記述子を適用するか、作成プロセスのデフォルト
DACL を変更してデフォルトセキュリティ記述子を変更することができる。詳細は Synchronization Object
Security and Access Rights
を参照。呼び出し側プロセスの任意のスレッドが、待機関数の呼び出しでタイマーオブジェクトハンドルを指定できる。複数のプロセスが同じタイマーオブジェクトへのハンドルを持つことができ、プロセス間同期に使用できる。
（以下省略）


%index
CreateWaitableTimerExW
待機可能タイマーオブジェクトを作成または開き、そのオブジェクトへのハンドルを返す。
%group
Win32 kernel32
%prm
lpTimerAttributes, lpTimerName, dwFlags, dwDesiredAccess
lpTimerAttributes : [var] SECURITY_ATTRIBUTES 構造体へのポインタ。このパラメータが NULL の場合、タイマーハンドルは子プロセスに継承できない。lpTimerAttributes が NULL の場合、タイマーオブジェクトはデフォルトのセキュリティ記述子を取得し、ハンドルは継承できない。タイマーのデフォルトセキュリティ記述子の ACL は、作成者のプライマリトークンまたは偽装トークンに由来する。
lpTimerName : [wstr] タイマーオブジェクトの名前。名前は MAX_PATH 文字までに制限される。名前比較は大文字小文字を区別する。
dwFlags : [int] このパラメータには 0 または次の値を指定できる。
dwDesiredAccess : [int] タイマーオブジェクトのアクセスマスク。アクセス権の一覧については Synchronization Object Security and Access Rights を参照。
%inst
待機可能タイマーオブジェクトを作成または開き、そのオブジェクトへのハンドルを返す。

[戻り値]

関数が成功した場合、戻り値はタイマーオブジェクトへのハンドルである。関数呼び出しの前に名前付きタイマーオブジェクトが存在していた場合、関数は既存オブジェクトへのハンドルを返し、GetLastError
は ERROR_ALREADY_EXISTS を返す。関数が失敗した場合、戻り値は NULL である。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]

呼び出し側プロセスの任意のスレッドが、待機関数の呼び出しでタイマーオブジェクトハンドルを指定できる。複数のプロセスが同じタイマーオブジェクトへのハンドルを持つことができ、プロセス間同期に使用できる。*
CreateProcess 関数で作成されたプロセスは、CreateWaitableTimerEx の lpTimerAttributes
パラメータが継承を有効にしている場合、タイマーオブジェクトへのハンドルを継承できる。* プロセスは DuplicateHandle
関数の呼び出しでタイマーオブジェクトハンドルを指定できる。結果のハンドルは別のプロセスから使用できる。* プロセスは
[OpenWaitableTimer](./nf-synchapi-openwaitabletimerw.md) または
CreateWaitableTimerEx 関数の呼び出しでタイマーオブジェクトの名前を指定できる。ハンドルを閉じるには
CloseHandle
関数を使用する。プロセスが終了するとシステムが自動的にハンドルを閉じる。最後のハンドルが閉じられるとタイマーオブジェクトは破棄される。タイマーをウィンドウに関連付けるには
SetTimer 関数を使用する。


%index
DeactivateActCtx
DeactivateActCtx 関数は、指定されたクッキーに対応するアクティブ化コンテキストを非アクティブ化する。
%group
Win32 kernel32
%prm
dwFlags, ulCookie
dwFlags : [int] 非アクティブ化の方法を示すフラグ。
ulCookie : [int] ActivateActCtx の呼び出しに渡された ULONG_PTR。この値は、特定のアクティブ化されたアクティブ化コンテキストを識別するためのクッキーとして使われる。
%inst
DeactivateActCtx 関数は、指定されたクッキーに対応するアクティブ化コンテキストを非アクティブ化する。

[戻り値]
関数が成功した場合、TRUE を返す。それ以外の場合、FALSE を返す。この関数は GetLastError
を呼ぶことで取得できるエラーを設定する。例については Retrieving the Last-Error Code
を参照。エラーコードの完全な一覧は System Error Codes を参照。

[備考]

アクティブ化コンテキストの非アクティブ化はアクティブ化と逆の順序で行わなければならない。アクティブ化コンテキストをスタックからポップする操作と理解できる。


%index
DebugActiveProcess
デバッガがアクティブなプロセスにアタッチしてデバッグできるようにする。
%group
Win32 kernel32
%prm
dwProcessId
dwProcessId : [int] デバッグするプロセスの識別子。デバッガには、DEBUG_ONLY_THIS_PROCESS フラグでプロセスを作成したかのようにデバッグアクセスが付与される。詳細は本トピックの Remarks セクションを参照。
%inst
デバッガがアクティブなプロセスにアタッチしてデバッグできるようにする。

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
プロセスのデバッグを停止するには、プロセスを終了するか DebugActiveProcessStop
関数を呼び出さなければならない。DebugSetProcessKillOnExit
を使わない限り、デバッガを終了するとプロセスも終了する。デバッガは対象プロセスへの適切なアクセス権を持っている必要があり、PROCESS_ALL_ACCESS
でプロセスを開ける必要がある。対象プロセスがデバッガにフルアクセス未満を付与するセキュリティ記述子で作成されている場合、DebugActiveProcess
は失敗することがある。デバッグするプロセスに SE_DEBUG_NAME
特権が付与され有効になっていれば、任意のプロセスをデバッグできる。プロセス識別子をシステムがチェックし有効なデバッグアタッチが行われていると判断した後、関数は
TRUE を返す。その後デバッガは WaitForDebugEvent
関数を使ってデバッグイベントを待機することが期待される。システムはプロセス内のすべてのスレッドをサスペンドし、プロセスの現在の状態を表すデバッグイベントをデバッガに送る。システムはデバッガに、dwProcessId
パラメータで指定されたプロセスを表す単一の CREATE_PROCESS_DEBUG_EVENT
デバッグイベントを送る。CREATE_PROCESS_DEBUG_INFO 構造体の lpStartAddress メンバは NULL
である。プロセスの一部となっている各スレッドについて、システムは CREATE_THREAD_DEBUG_EVENT
デバッグイベントを送る。CREATE_THREAD_DEBUG_INFO 構造体の lpStartAddress メンバは NULL
である。対象プロセスのアドレス空間にロードされている各 DLL について、システムは LOAD_DLL_DEBUG_EVENT
デバッグイベントを送る。システムは、プロセス内の最初のスレッドが再開された後にブレークポイント命令を実行するように準備する。このスレッドを継続させると、デバッガがアタッチされる前と同じことを行うように戻る。これらすべてが完了すると、システムはプロセス内のすべてのスレッドを再開する。プロセス内の最初のスレッドが再開されたとき、ブレークポイント命令を実行し、EXCEPTION_DEBUG_EVENT
デバッグイベントがデバッガに送られる。これ以降のすべてのデバッグイベントは通常のメカニズムと規則に従ってデバッガに送られる。


%index
DebugActiveProcessStop
指定したプロセスのデバッグをデバッガに停止させる。
%group
Win32 kernel32
%prm
dwProcessId
dwProcessId : [int] デバッグを停止するプロセスの識別子。
%inst
指定したプロセスのデバッグをデバッガに停止させる。

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼ぶ。


%index
DebugBreak
現在のプロセスでブレークポイント例外を発生させる。これにより、呼び出し側スレッドはデバッガに例外処理をシグナルできる。
%group
Win32 kernel32
%prm

%inst
現在のプロセスでブレークポイント例外を発生させる。これにより、呼び出し側スレッドはデバッガに例外処理をシグナルできる。

[備考]

プロセスがデバッグされていない場合、関数は標準的な例外ハンドラの検索ロジックを使用する。多くの場合、これにより未処理のブレークポイント例外が発生し、呼び出し側プロセスが終了する。


%index
DebugBreakProcess
指定したプロセスでブレークポイント例外を発生させる。これにより、呼び出し側スレッドはデバッガに例外処理をシグナルできる。
%group
Win32 kernel32
%prm
Process
Process : [intptr] プロセスへのハンドル。
%inst
指定したプロセスでブレークポイント例外を発生させる。これにより、呼び出し側スレッドはデバッガに例外処理をシグナルできる。

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]

プロセスがデバッグされていない場合、関数は標準的な例外ハンドラの検索ロジックを使用する。多くの場合、これにより未処理のブレークポイント例外が発生し、プロセスが終了する。


%index
DebugSetProcessKillOnExit
呼び出し側スレッドが終了したときに実行されるアクションを設定する。
%group
Win32 kernel32
%prm
KillOnExit
KillOnExit : [int] このパラメータが TRUE の場合、スレッドは終了時にアタッチされているすべてのプロセスを終了させる（これがデフォルト）。それ以外の場合、スレッドは終了時にデバッグ中のすべてのプロセスからデタッチする。
%inst
呼び出し側スレッドが終了したときに実行されるアクションを設定する。

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
呼び出し側スレッドは、この関数を呼ぶ前に CreateProcess または DebugActiveProcess 関数を使って少なくとも
1 つのデバッグ接続を確立しておかなければならない。DebugSetProcessKillOnExit
は呼び出し側スレッドに接続されている現在および将来のデバッギに影響する。スレッドはこの関数を複数回呼び出して必要に応じて動作を変更できる。


%index
DefineDosDeviceW
MS-DOS デバイス名を定義、再定義、または削除する。(DefineDosDeviceW)
%group
Win32 kernel32
%prm
dwFlags, lpDeviceName, lpTargetPath
dwFlags : [int] DefineDosDevice 関数の制御可能な側面。このパラメータ
lpDeviceName : [wstr] 関数が定義、再定義、または削除するデバイスを指定する MS-DOS デバイス名文字列へのポインタ。デバイス名文字列は、ドライブ文字を定義、再定義、または削除する場合を除き、最後の文字としてコロンを持ってはならない。たとえばドライブ C なら文字列 "C:" となる。末尾のバックスラッシュ (\\) はいかなる場合も許されない。
lpTargetPath : [wstr] このデバイスを実装するパス文字列へのポインタ。DDD_RAW_TARGET_PATH フラグが指定されていない限り、文字列は MS-DOS パス文字列である。指定されている場合は単なるパス文字列となる。
%inst
MS-DOS デバイス名を定義、再定義、または削除する。(DefineDosDeviceW)

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
MS-DOS デバイス名はオブジェクト名前空間内のジャンクションとして格納される。MS-DOS
パスを対応するパスに変換するコードは、これらのジャンクションを使って MS-DOS
デバイスとドライブ文字をマップする。DefineDosDevice 関数は、MS-DOS
デバイス名前空間を実装するために使われるジャンクションをアプリケーションが変更できるようにする。特定の MS-DOS
デバイス名の現在のマッピングを取得したり、システムが認識しているすべての MS-DOS
デバイスのリストを取得するには、QueryDosDevice
関数を使用する。ブートをまたいで永続的かつネットワーク共有ではないドライブ文字割り当てを定義するには、SetVolumeMountPoint
関数を使用する。マウントするボリュームに既にドライブ文字が割り当てられている場合は、DeleteVolumeMountPoint
関数を使って割り当てを削除する。システムブート時に定義されたドライブ文字とデバイス名は、ユーザーが管理者でない限り再定義および削除から保護される。Windows
XP 以降、この関数は "LocalSystem" コンテキストで実行されていない呼び出し側用に、自身の Local MS-DOS
デバイス名前空間にデバイス名を作成する。呼び出し側が "LocalSystem" コンテキストで実行されている場合、関数は Global
MS-DOS デバイス名前空間にデバイス名を作成する。詳細は Defining an MS DOS Device Name と File
Names, Paths, and Namespaces を参照。Windows 8 および Windows Server 2012
では、この関数は次の技術でサポートされる。
（以下省略）


%index
DeleteAtom
ローカル文字列アトムの参照カウントを減らす。アトムの参照カウントが 0 まで減ると、DeleteAtom はそのアトムに関連付けられた文字列をローカルアトムテーブルから削除する。
%group
Win32 kernel32
%prm
nAtom
nAtom : [int] 型: ATOM 削除するアトム。
%inst
ローカル文字列アトムの参照カウントを減らす。アトムの参照カウントが 0 まで減ると、DeleteAtom
はそのアトムに関連付けられた文字列をローカルアトムテーブルから削除する。

[戻り値]
型: ATOM 関数が成功した場合、戻り値は 0 となる。関数が失敗した場合、戻り値は nAtom
パラメータとなる。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
文字列アトムの参照カウントは、アトムがアトムテーブルに追加された回数を表す。AddAtom
関数は呼び出しごとにカウントを増やす。DeleteAtom 関数は呼び出しごとにカウントを減らすが、アトムの参照カウントが 0
になった場合のみ文字列を削除する。AddAtom の各呼び出しには対応する DeleteAtom の呼び出しが必要である。AddAtom
より多く DeleteAtom を呼ぶと、他のクライアントが使用中にアトムを削除してしまうおそれがある。DeleteAtom
関数は整数アトム（0x0001 から 0xBFFF の範囲の値を持つアトム）には影響しない。整数アトムに対しては関数は常に 0 を返す。


%index
DeleteBoundaryDescriptor
指定された境界記述子を削除する。
%group
Win32 kernel32
%prm
BoundaryDescriptor
BoundaryDescriptor : [intptr] 境界記述子へのハンドル。CreateBoundaryDescriptor 関数がこのハンドルを返す。
%inst
指定された境界記述子を削除する。

[備考]
この関数を使うアプリケーションをコンパイルするには、_WIN32_WINNT を 0x0600 以降として定義する。


%index
DeleteFiber
既存のファイバを削除する。
%group
Win32 kernel32
%prm
lpFiber
lpFiber : [intptr] 削除するファイバのアドレス。
%inst
既存のファイバを削除する。

[備考]
DeleteFiber
関数はファイバに関連付けられているすべてのデータを削除する。このデータにはスタック、レジスタの一部、ファイバデータが含まれる。現在実行中のファイバが
DeleteFiber を呼び出すと、そのスレッドは ExitThread
を呼び終了する。ただし、現在実行中のファイバが別のファイバから削除された場合、削除されたファイバのスタックは解放されているため、その実行中スレッドは異常終了する可能性が高い。この関数を使うアプリケーションをコンパイルするには、_WIN32_WINNT
を 0x0400 以降として定義する。詳細は Using the Windows Headers を参照。


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
DeleteFileTransactedW
既存のファイルをトランザクション操作として削除する。(Unicode)
%group
Win32 kernel32
%prm
lpFileName, hTransaction
lpFileName : [wstr] 削除するファイルの名前。この関数の ANSI 版では名前は MAX_PATH 文字までに制限される。この制限を 32,767 ワイド文字まで拡張するには、関数の Unicode 版を呼び出してパスの先頭に "\\?\" を付加する。詳細は Naming a File を参照。ファイルはローカルコンピュータ上に存在しなければならない。そうでない場合、関数は失敗し最後のエラーコードは ERROR_TRANSACTIONS_UNSUPPORTED_REMOTE に設定される。
hTransaction : [intptr] トランザクションへのハンドル。このハンドルは CreateTransaction 関数が返す。
%inst
既存のファイルをトランザクション操作として削除する。(Unicode)

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
アプリケーションが存在しないファイルを削除しようとした場合、DeleteFileTransacted 関数は
ERROR_FILE_NOT_FOUND で失敗する。ファイルが読み取り専用ファイルの場合、関数は ERROR_ACCESS_DENIED
で失敗する。次のリストは、ファイルの削除、削除、またはクローズに関するヒントを示す。
（以下省略）


%index
DeleteSynchronizationBarrier
同期バリアを削除する。
%group
Win32 kernel32
%prm
lpBarrier
lpBarrier : [var] 削除する同期バリアへのポインタ。
%inst
同期バリアを削除する。

[戻り値]
DeleteSynchronizationBarrier 関数は常に TRUE を返す。

[備考]
DeleteSynchronizationBarrier
は、同期バリアが不要になったときに解放する。EnterSynchronizationBarrier を呼び出した直後に
DeleteSynchronizationBarrier
を呼び出しても安全である。バリア内のすべてのスレッドがバリアの使用を完了したことを保証してから解放できるようにしているためである。同期バリアが決して削除されない場合、スレッドはバリアに入る際に
SYNCHRONIZATION_BARRIER_FLAGS_NO_DELETE
フラグを指定できる。このフラグにより、関数は削除の安全性のために必要な追加処理をスキップでき、性能が向上する場合がある。バリアを使用するすべてのスレッドがこのフラグを指定する必要がある。1
つでもしていないスレッドがあると、フラグは無視される。SYNCHRONIZATION_BARRIER_FLAGS_NO_DELETE
を使用する際は注意が必要である。このフラグが有効な状態でバリアを削除すると、不正なハンドルアクセスが発生し、1
つ以上のスレッドが永久にブロックされるおそれがある。


%index
DeleteTimerQueue
タイマーキューを削除する。キュー内の保留中のタイマーはキャンセルされ削除される。(DeleteTimerQueue)
%group
Win32 kernel32
%prm
TimerQueue
TimerQueue : [intptr] タイマーキューへのハンドル。このハンドルは CreateTimerQueue 関数が返す。
%inst
タイマーキューを削除する。キュー内の保留中のタイマーはキャンセルされ削除される。(DeleteTimerQueue)

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
DeleteTimerQueue
は、タイマーに関連付けられたすべてのコールバック関数の完了を待たない。この関数を使うアプリケーションをコンパイルするには、_WIN32_WINNT
を 0x0500 以降として定義する。詳細は Using the Windows Headers を参照。


%index
DeleteTimerQueueEx
タイマーキューを削除する。キュー内の保留中のタイマーはキャンセルされ削除される。(DeleteTimerQueueEx)
%group
Win32 kernel32
%prm
TimerQueue, CompletionEvent
TimerQueue : [intptr] タイマーキューへのハンドル。このハンドルは CreateTimerQueue 関数が返す。
CompletionEvent : [intptr] 関数が成功しすべてのコールバック関数が完了したときにシグナルされるイベントオブジェクトへのハンドル。このパラメータは NULL でもよい。
%inst
タイマーキューを削除する。キュー内の保留中のタイマーはキャンセルされ削除される。(DeleteTimerQueueEx)

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
タイマーコールバック内から DeleteTimerQueueEx
へのブロッキング呼び出しを行ってはならない。この関数を使うアプリケーションをコンパイルするには、_WIN32_WINNT を 0x0500
以降として定義する。詳細は Using the Windows Headers を参照。


%index
DeleteTimerQueueTimer
タイマーをタイマーキューから削除する。オプションで、タイマーを削除する前に現在実行中のタイマーコールバック関数の完了を待つ。
%group
Win32 kernel32
%prm
TimerQueue, Timer, CompletionEvent
TimerQueue : [intptr] タイマーキューへのハンドル。このハンドルは CreateTimerQueue 関数が返す。
Timer : [intptr] タイマーキュータイマーへのハンドル。このハンドルは CreateTimerQueueTimer 関数が返す。
CompletionEvent : [intptr] システムがタイマーをキャンセルしすべてのコールバック関数が完了したときにシグナルされるイベントオブジェクトへのハンドル。このパラメータは NULL でもよい。
%inst
タイマーをタイマーキューから削除する。オプションで、タイマーを削除する前に現在実行中のタイマーコールバック関数の完了を待つ。

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼ぶ。エラーコードが ERROR_IO_PENDING
の場合、この関数を再度呼び出す必要はない。それ以外のエラーの場合、呼び出しを再試行すべきである。

[備考]

この関数はスレッドが偽装を使っている間は呼び出せない。動作は未定義となる。コールバック関数がタイマースレッド内で実行されない限り、別のタイマーのタイマーコールバック内からこの関数を呼ぶときに
CompletionEvent を INVALID_HANDLE_VALUE に設定できる。ただし、2
つのコールバック関数が互いのタイマーに対するブロッキング DeleteTimerQueueTimer
呼び出しを試みるとデッドロックが発生することがある。さらに、コールバックに関連付けられたタイマーに対するブロッキング削除呼び出しはできない。永続スレッドに対するブロッキング
DeleteTimerQueueTimer 呼び出しを行う際は注意が必要である。削除されるタイマーが
WT_EXECUTEINPERSISTENTTHREAD
で作成された場合、デッドロックが発生する可能性がある。未処理のコールバック関数が存在し CompletionEvent が NULL
の場合、関数は失敗しエラーコードを ERROR_IO_PENDING
に設定する。これは未処理のコールバック関数が存在することを示す。それらのコールバックは実行されるか、実行中のいずれかである。タイマーはコールバック関数の実行が終了したときにクリーンアップされる。タイマーキュー内のすべてのタイマーをキャンセルするには
DeleteTimerQueueEx 関数を呼ぶ。この関数を使うアプリケーションをコンパイルするには、_WIN32_WINNT を
0x0500 以降として定義する。詳細は Using the Windows Headers を参照。


%index
DeleteUmsCompletionList
指定されたユーザーモードスケジューリング (UMS) 完了リストを削除する。リストは空でなければならない。
%group
Win32 kernel32
%prm
UmsCompletionList
UmsCompletionList : [intptr] 削除する UMS 完了リストへのポインタ。CreateUmsCompletionList 関数がこのポインタを提供する。
%inst
指定されたユーザーモードスケジューリング (UMS) 完了リストを削除する。リストは空でなければならない。

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
完了リストが共有されている場合、呼び出し側はリストを削除する前に、アクティブな UMS
スレッドがリストへの参照を保持していないことを保証する責任がある。


%index
DeleteUmsThreadContext
指定されたユーザーモードスケジューリング (UMS) スレッドコンテキストを削除する。スレッドは終了している必要がある。
%group
Win32 kernel32
%prm
UmsThread
UmsThread : [intptr] 削除する UMS スレッドコンテキストへのポインタ。CreateUmsThreadContext 関数がこのポインタを提供する。
%inst
指定されたユーザーモードスケジューリング (UMS) スレッドコンテキストを削除する。スレッドは終了している必要がある。

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
UMS スレッドコンテキストは関連付けられたスレッドが終了するまで削除できない。UMS
ワーカースレッドが（たとえばスレッドエントリポイント関数から戻ることで）実行を完了すると、システムはスレッドを終了し、終了ステータスをスレッドの
UMS スレッドコンテキストに設定し、UMS
スレッドコンテキストを関連付けられた完了リストにキューする。スレッドは既に終了しているため、その UMS
スレッドの実行は失敗する。スレッドの終了ステータスを確認するには、アプリケーションのスケジューラは
UmsIsThreadTerminated 情報クラスで QueryUmsThreadInformation を呼ぶべきである。


%index
DeleteVolumeMountPointW
ドライブ文字またはマウントフォルダを削除する。(DeleteVolumeMountPointW)
%group
Win32 kernel32
%prm
lpszVolumeMountPoint
lpszVolumeMountPoint : [wstr] 削除するドライブ文字またはマウントフォルダ。末尾のバックスラッシュが必要。たとえば "X:\" や "Y:\MountX\"。
%inst
ドライブ文字またはマウントフォルダを削除する。(DeleteVolumeMountPointW)

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
マウントフォルダの削除は、その下にあるディレクトリが削除されることを意味しない。lpszVolumeMountPoint
パラメータがマウントフォルダではないディレクトリの場合、関数は何もしない。ディレクトリは削除されない。Windows 8 および
Windows Server 2012 では、この関数は次の技術でサポートされる。
（以下省略）


%index
DequeueUmsCompletionListItems
指定された UMS 完了リストからユーザーモードスケジューリング (UMS) ワーカースレッドを取得する。
%group
Win32 kernel32
%prm
UmsCompletionList, WaitTimeOut, UmsThreadList
UmsCompletionList : [intptr] ワーカースレッドを取得する完了リストへのポインタ。
WaitTimeOut : [int] 取得操作のタイムアウト間隔（ミリ秒）。完了リストにワーカースレッドがキューされていなくても、間隔が経過すると関数は戻る。WaitTimeOut パラメータが 0 の場合、ワーカースレッドが利用可能になるのを待たずに完了リストをチェックする。WaitTimeOut パラメータが INFINITE の場合、関数のタイムアウト間隔は決して経過しない。ただし、これは関数が 1 つ以上のワーカースレッドが利用可能になるまでブロックされるため推奨されない。
UmsThreadList : [var] UMS_CONTEXT 変数へのポインタ。出力時、このパラメータは UMS スレッドコンテキストのリスト内の最初の UMS スレッドコンテキストへのポインタを受け取る。WaitTimeOut パラメータで指定したタイムアウトまでにワーカースレッドが利用可能にならない場合、このパラメータは NULL に設定される。
%inst
指定された UMS 完了リストからユーザーモードスケジューリング (UMS) ワーカースレッドを取得する。

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼ぶ。発生し得るエラー値には次のものが含まれる。
（以下省略）

[備考]
システムは、UMS ワーカースレッドが作成されたとき、または以前にブロックされていたワーカースレッドのブロックが解除されたときに、UMS
ワーカースレッドを完了リストにキューする。DequeueUmsCompletionListItems
関数は、指定された完了リスト内のすべてのスレッドコンテキストのリストへのポインタを取得する。GetNextUmsListItem
関数を使うと、UMS
スレッドコンテキストをリストからスケジューラ自身のレディスレッドキューにポップできる。スケジューラはアプリケーションが選んだ優先度に基づいて実行するスレッドを選択する責任がある。DequeueUmsCompletionListItems
が提供するリストから直接 UMS
スレッドを実行したり、リストが完全に空になる前にレディスレッドキューに移したスレッドを実行したりしてはならない。これはアプリケーションで予測不能な動作を引き起こす可能性がある。複数の呼び出し側が共有完了リストからスレッドを取得しようとした場合、最初の呼び出し側だけがスレッドを取得する。後続の呼び出し側に対しては
DequeueUmsCompletionListItems は成功を返すが、UmsThreadList パラメータは NULL
に設定される。


%index
DeviceIoControl
指定したデバイスドライバに直接制御コードを送信し、対応するデバイスに対応する操作を実行させる。
%group
Win32 kernel32
%prm
hDevice, dwIoControlCode, lpInBuffer, nInBufferSize, lpOutBuffer, nOutBufferSize, lpBytesReturned, lpOverlapped
hDevice : [intptr] 操作を実行するデバイスへのハンドル。デバイスは通常、ボリューム、ディレクトリ、ファイル、またはストリームである。デバイスハンドルを取得するには CreateFile 関数を使用する。詳細は Remarks を参照。
dwIoControlCode : [int] 操作の制御コード。この値は実行する特定の操作と、その操作を実行するデバイスの種類を識別する。制御コードのリストについては Remarks を参照。各制御コードのドキュメントには lpInBuffer、nInBufferSize、lpOutBuffer、nOutBufferSize パラメータの使用方法が記載されている。
lpInBuffer : [intptr] 操作を実行するために必要なデータを含む入力バッファへのポインタ。このデータの形式は dwIoControlCode パラメータの値に依存する。dwIoControlCode が入力データを必要としない操作を指定する場合、このパラメータは NULL でよい。
nInBufferSize : [int] 入力バッファのサイズ（バイト数）。
lpOutBuffer : [intptr] 操作で返されたデータを受け取る出力バッファへのポインタ。このデータの形式は dwIoControlCode パラメータの値に依存する。dwIoControlCode がデータを返さない操作を指定する場合、このパラメータは NULL でよい。
nOutBufferSize : [int] 出力バッファのサイズ（バイト数）。
lpBytesReturned : [var] 出力バッファに格納されたデータのサイズ（バイト数）を受け取る変数へのポインタ。出力バッファが小さすぎてデータを受け取れない場合、呼び出しは失敗し GetLastError は ERROR_INSUFFICIENT_BUFFER を返し、lpBytesReturned は 0 となる。出力バッファがすべてのデータを格納するには小さいが一部のエントリは保持できる場合、ドライバによっては収まる分のデータを返す。この場合、呼び出しは失敗し GetLastError は ERROR_MORE_DATA を返し、lpBytesReturned は受け取ったデータ量を示す。アプリケーションは新しい開始位置を指定して同じ操作で DeviceIoControl を再度呼び出すべきである。lpOverlapped が NULL の場合、lpBytesReturned は NULL であってはならない。出力データを返さない操作で lpOutBuffer が NULL の場合でも、DeviceIoControl は lpBytesReturned を使用する。そのような操作の後、lpBytesReturned の値には意味がない。lpOverlapped が NULL でない場合、lpBytesReturned は NULL でもよい。このパラメータが NULL でなく操作がデータを返す場合、オーバーラップ操作が完了するまで lpBytesReturned には意味がない。返されたバイト数を取得するには GetOverlappedResult を呼ぶ。hDevice が I/O 完了ポートに関連付けられている場合、GetQueuedCompletionStatus を呼ぶことで返されたバイト数を取得できる。
lpOverlapped : [var] OVERLAPPED 構造体へのポインタ。FILE_FLAG_OVERLAPPED を指定せずに hDevice を開いた場合、lpOverlapped は無視される。FILE_FLAG_OVERLAPPED フラグで hDevice を開いた場合、操作はオーバーラップ（非同期）操作として実行される。この場合、lpOverlapped はイベントオブジェクトへのハンドルを含む有効な OVERLAPPED 構造体を指していなければならない。そうでないと、関数は予測不能な方法で失敗する。オーバーラップ操作の場合、DeviceIoControl は即座に戻り、操作が完了するとイベントオブジェクトがシグナルされる。それ以外の場合、関数は操作が完了するかエラーが発生するまで戻らない。
%inst
指定したデバイスドライバに直接制御コードを送信し、対応するデバイスに対応する操作を実行させる。

[戻り値]
操作が正常に完了した場合、戻り値は 0 以外 (TRUE) である。操作が失敗または保留中の場合、戻り値は 0
となる。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
デバイスへのハンドルを取得するには、デバイス名またはデバイスに関連付けられたドライバ名で CreateFile
関数を呼び出す必要がある。デバイス名を指定するには次の形式を使用する: \\\\.\DeviceName。DeviceIoControl
は特定のデバイスへのハンドルを受け取ることができる。たとえば論理ドライブ A: へのハンドルを CreateFile で開くには
\\\\.\a: を指定する。あるいは \\\\.\PhysicalDrive0、\\\\.\PhysicalDrive1
などの名前を使ってシステム上の物理ドライブへのハンドルを開くこともできる。デバイスドライバへのハンドルを開くために CreateFile
を呼ぶときは FILE_SHARE_READ と FILE_SHARE_WRITE
アクセスフラグを指定すべきである。ただし、シリアルポートのような通信リソースを開くときは排他アクセスを指定する必要がある。デバイスハンドルを開く際、その他の
CreateFile パラメータは次のように使用する。
（以下省略）


%index
DisableThreadLibraryCalls
指定された DLL に対する DLL_THREAD_ATTACH および DLL_THREAD_DETACH 通知を無効にする。
%group
Win32 kernel32
%prm
hLibModule
hLibModule : [intptr] DLL_THREAD_ATTACH および DLL_THREAD_DETACH 通知を無効にする DLL モジュールへのハンドル。LoadLibrary、LoadLibraryEx、または GetModuleHandle 関数がこのハンドルを返す。NULL を指定して GetModuleHandle を呼び出すことはできない。これは DLL イメージではなく実行可能イメージのベースアドレスを返すためである。
%inst
指定された DLL に対する DLL_THREAD_ATTACH および DLL_THREAD_DETACH 通知を無効にする。

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 となる。hModule で指定された DLL
がアクティブな静的スレッドローカルストレージを持っている場合、または hModule
が無効なモジュールハンドルである場合、DisableThreadLibraryCalls 関数は失敗する。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
DisableThreadLibraryCalls 関数を使うと、DLL は DLL_THREAD_ATTACH と
DLL_THREAD_DETACH 通知呼び出しを無効化できる。これは多くの DLL を持ち、頻繁にスレッドを作成・削除し、それらの
DLL がスレッドレベルのアタッチ/デタッチ通知を必要としないマルチスレッドアプリケーションにとって有用な最適化となる。RPC
サーバーアプリケーションがそのような例である。この種のアプリケーションでは、DLL の初期化ルーチンが DLL_THREAD_ATTACH
と DLL_THREAD_DETACH
通知に応答するためにメモリ上に残っていることが多い。通知を無効化することで、スレッドの作成や削除によって DLL
初期化コードがページインされなくなり、アプリケーションのワーキングコードセットのサイズを削減できる。最適化を実装するには、DLL の
DLL_PROCESS_ATTACH コードを変更して DisableThreadLibraryCalls を呼び出す。静的 C
ランタイムライブラリ (CRT) にリンクされた DLL からこの関数を呼び出してはならない。静的 CRT が正しく機能するためには
DLL_THREAD_ATTACH と DLL_THREAD_DETATCH 通知が必要である。静的 [Thread Local
Storage (TLS)](/windows/win32/procthread/thread-local-storage)
が有効な場合、この関数は何の最適化も行わない。静的 TLS は **thread_local** 変数、**__declspec(
thread )** 変数、または関数ローカルな **static** を使用するときに有効になる。


%index
DisableThreadProfiling
スレッドプロファイリングを無効にする。
%group
Win32 kernel32
%prm
PerformanceDataHandle
PerformanceDataHandle : [intptr] EnableThreadProfiling 関数が返したハンドル。
%inst
スレッドプロファイリングを無効にする。

[戻り値]
呼び出しが成功した場合 ERROR_SUCCESS を返す。それ以外の場合、システムエラーコード（Winerror.h を参照）を返す。

[備考]

この関数は、指定されたハンドルのプロファイリングを有効にしたのと同じスレッドから呼び出さなければならない。スレッドを終了する前にこの関数を呼ばなければならない。さもないとリソースをリーク（プロセスが終了するまでリソースは回収されない）する。


%index
DisconnectNamedPipe
名前付きパイプインスタンスのサーバー側をクライアントプロセスから切断する。
%group
Win32 kernel32
%prm
hNamedPipe
hNamedPipe : [intptr] 名前付きパイプのインスタンスへのハンドル。このハンドルは CreateNamedPipe 関数で作成されたものでなければならない。
%inst
名前付きパイプインスタンスのサーバー側をクライアントプロセスから切断する。

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
名前付きパイプのクライアント側が開いている場合、DisconnectNamedPipe
関数はその名前付きパイプ側を強制的に閉じる。クライアントは次にパイプにアクセスしようとしたときにエラーを受け取る。DisconnectNamedPipe
によりパイプから強制的に切断されたクライアントは、それでも CloseHandle
関数を使ってパイプ側を閉じる必要がある。サーバーまたはクライアントプロセスがパイプへのオープンハンドルを持っている限りパイプは存在する。サーバープロセスがパイプインスタンスを切断する際、パイプ内の未読データは破棄される。サーバーは切断する前に
FlushFileBuffers 関数を呼ぶことでデータが失われないことを確認できる。FlushFileBuffers
はクライアントプロセスがすべてのデータを読むまで戻らない。サーバープロセスは、ConnectNamedPipe
関数で別のクライアントにハンドルを接続する前に、DisconnectNamedPipe
を呼び出してパイプハンドルを以前のクライアントから切断しなければならない。Windows 10 バージョン 1709:
パイプはアプリコンテナ内でのみサポートされる。すなわち、同じアプリの一部である UWP プロセス間のみ。また、名前付きパイプはパイプ名に
`\\.\pipe\LOCAL\` 構文を使用しなければならない。


%index
DnsHostnameToComputerNameW
DNS 形式のホスト名を NetBIOS 形式のコンピュータ名に変換する。(Unicode)
%group
Win32 kernel32
%prm
Hostname, ComputerName, nSize
Hostname : [wstr] DNS 名。DNS 名が有効で変換可能な名前でない場合、関数は失敗する。詳細は Computer Names を参照。
ComputerName : [wstr] コンピュータ名を受け取るバッファへのポインタ。バッファサイズは MAX_COMPUTERNAME_LENGTH + 1 文字を含めるのに十分でなければならない。
nSize : [var] 入力時、バッファのサイズ（TCHAR 単位）を指定する。出力時、終端 NULL 文字を含まずに、宛先バッファにコピーされた TCHAR 数を受け取る。
%inst
DNS 形式のホスト名を NetBIOS 形式のコンピュータ名に変換する。(Unicode)

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼ぶ。発生し得る値には次のものが含まれる。
（以下省略）

[備考]
この関数は名前のテキスト的なマッピングを行う。この規約により、コンピュータ名は名前の共通サブセットに制限される。（具体的には、DNS
名の左端のラベルは 15 バイトの OEM 文字に切り詰められる。）したがって、DNS ドメイン名を NetBIOS
ドメイン名に変換するためにこの関数を使用してはならない。ドメイン名にはテキスト的なマッピングは存在しない。この関数を使うアプリケーションをコンパイルするには、_WIN32_WINNT
を 0x0500 以降として定義する。詳細は Using the Windows Headers を参照。
> [!NOTE] > winbase.h ヘッダは UNICODE プリプロセッサ定数の定義に基づき、この関数の ANSI 版または
Unicode 版を自動選択するエイリアスとして DnsHostnameToComputerName
を定義する。エンコーディング非依存のエイリアスとエンコーディング依存のコードを混在させると、コンパイルや実行時のエラーを引き起こす不整合が生じることがある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
DnsHostnameToComputerNameExW
(no summary)
%group
Win32 kernel32
%prm
Hostname, ComputerName, nSize
Hostname : [wstr] 
ComputerName : [wstr] 
nSize : [var] 
%inst



%index
DosDateTimeToFileTime
MS-DOS 日付・時刻値をファイル時刻に変換する。
%group
Win32 kernel32
%prm
wFatDate, wFatTime, lpFileTime
wFatDate : [int] MS-DOS 日付。日付は次の形式のパック値である。
wFatTime : [int] MS-DOS 時刻。時刻は次の形式のパック値である。
lpFileTime : [var] 変換されたファイル時刻を受け取る FILETIME 構造体へのポインタ。
%inst
MS-DOS 日付・時刻値をファイル時刻に変換する。

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼ぶ。


%index
DuplicateHandle
オブジェクトハンドルを複製する。
%group
Win32 kernel32
%prm
hSourceProcessHandle, hSourceHandle, hTargetProcessHandle, lpTargetHandle, dwDesiredAccess, bInheritHandle, dwOptions
hSourceProcessHandle : [intptr] 複製するハンドルを持つプロセスへのハンドル。
hSourceHandle : [intptr] 複製するハンドル。これはソースプロセスのコンテキストで有効なオープンオブジェクトハンドルである。複製可能なハンドルを持つオブジェクトのリストについては、以下の Remarks セクションを参照。
hTargetProcessHandle : [intptr] 複製されたハンドルを受け取るプロセスへのハンドル。ハンドルは PROCESS_DUP_HANDLE アクセス権を持っていなければならない。このパラメータはオプションであり、_Options_ に **DUPLICATE_CLOSE_SOURCE** フラグが設定されている場合は NULL を指定できる。
lpTargetHandle : [intptr] 複製ハンドルを受け取る変数へのポインタ。このハンドル値は対象プロセスのコンテキストで有効である。hSourceHandle が GetCurrentProcess または GetCurrentThread から返された擬似ハンドルである場合、DuplicateHandle はそれをそれぞれプロセスまたはスレッドへの実ハンドルに変換する。lpTargetHandle が NULL の場合、関数はハンドルを複製するが、複製ハンドルの値を呼び出し側に返さない。この動作はこの関数の以前のバージョンとの後方互換性のためにのみ存在する。対象プロセスが終了するまでシステムリソースを失うため、この機能を使用すべきではない。_hTargetProcessHandle_ が **NULL** の場合、このパラメータは無視される。
dwDesiredAccess : [int] 新しいハンドルに要求するアクセス権。各オブジェクト型に指定できるフラグについては、以下の Remarks セクションを参照。dwOptions パラメータが DUPLICATE_SAME_ACCESS フラグを指定している場合、このパラメータは無視される。それ以外の場合、指定できるフラグは複製対象のハンドルのオブジェクトの種類に依存する。_hTargetProcessHandle_ が **NULL** の場合、このパラメータは無視される。
bInheritHandle : [int] ハンドルが継承可能かどうかを示す変数。TRUE の場合、複製されたハンドルは対象プロセスから作成された新しいプロセスに継承できる。FALSE の場合、新しいハンドルは継承できない。_hTargetProcessHandle_ が **NULL** の場合、このパラメータは無視される。
dwOptions : [int] 
%inst
オブジェクトハンドルを複製する。

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]

複製されたハンドルは元のハンドルと同じオブジェクトを参照する。したがって、オブジェクトへの変更は両方のハンドルを通じて反映される。たとえばファイルハンドルを複製した場合、現在のファイル位置は両方のハンドルで常に同じである。ファイルハンドルが異なるファイル位置を持つようにするには、CreateFile
関数を使って同じファイルへのアクセスを共有するファイルハンドルを作成する。DuplicateHandle
はソースプロセスまたは対象プロセス（あるいはソースと対象の両方であるプロセス）のいずれからでも呼び出せる。たとえばプロセスは
DuplicateHandle
を使って、継承可能なハンドルの非継承複製、または元のハンドルとは異なるアクセス権を持つハンドルを作成できる。ソースプロセスは
GetCurrentProcess 関数を使って自身へのハンドルを取得する。このハンドルは擬似ハンドルだが、DuplicateHandle
はそれを実プロセスハンドルに変換する。対象プロセスのハンドルを取得するには、ソースプロセスにプロセス識別子を伝えるためのプロセス間通信（たとえば名前付きパイプや共有メモリ）を使う必要がある場合がある。ソースプロセスは、この識別子を
OpenProcess 関数で使って対象プロセスへのハンドルを取得できる。DuplicateHandle
を呼ぶプロセスが対象プロセスでもない場合、ソースプロセスは複製ハンドルの値を対象プロセスに渡すためにプロセス間通信を使わなければならない。DuplicateHandle
は 32bit プロセスと 64bit
プロセスの間でハンドルを複製するために使用できる。結果のハンドルは対象プロセスで動作するように適切なサイズになる。詳細は Process
Interoperability を参照。DuplicateHandle は次の種類のオブジェクトへのハンドルを複製できる。
（以下省略）


%index
EnableThreadProfiling
指定したスレッドでスレッドプロファイリングを有効にする。
%group
Win32 kernel32
%prm
ThreadHandle, Flags, HardwareCounters, PerformanceDataHandle
ThreadHandle : [intptr] プロファイリングを有効にするスレッドへのハンドル。これは現在のスレッドでなければならない。
Flags : [int] コンテキストスイッチカウントなどのスレッドプロファイリングデータを受け取るには、このパラメータを THREAD_PROFILING_FLAG_DISPATCH に設定する。それ以外の場合は 0 に設定する。
HardwareCounters : [int64] ハードウェアパフォーマンスカウンタデータを受け取るには、このパラメータに収集するハードウェアカウンタを識別するビットマスクを設定する。最大 16 個のパフォーマンスカウンタを指定できる。各ビットは、構成済みのハードウェアパフォーマンスカウンタの 0 ベースのハードウェアカウンタインデックスに直接対応する。ハードウェアカウンタデータを収集していない場合は 0 に設定する。構成されていないハードウェアカウンタのビットを設定した場合、そのカウンタについて読み取られるカウンタ値は 0 となる。
PerformanceDataHandle : [intptr] ReadThreadProfilingData および DisableThreadProfiling 関数を呼ぶ際に使用する不透明なハンドル。
%inst
指定したスレッドでスレッドプロファイリングを有効にする。

[戻り値]
呼び出しが成功した場合 ERROR_SUCCESS を返す。それ以外の場合、システムエラーコード（Winerror.h を参照）を返す。

[備考]
スレッドを終了する前に DisableThreadProfiling
関数を呼ばなければならない。ハードウェアパフォーマンスカウンタをプロファイリングするには、カウンタを構成するドライバが必要である。パフォーマンスカウンタはシステム全体でグローバルに構成されているため、すべてのスレッドが同じハードウェアカウンタデータにアクセスできる。プロファイリングを有効にする前にカウンタを構成しなければならない。ハードウェアパフォーマンスカウンタの構成については
Windows Driver Kit (WDK) の KeSetHardwareCounterConfiguration 関数を参照。


%index
EndUpdateResourceW
UpdateResource の呼び出し前に行われた変更をコミットまたは破棄する。(Unicode)
%group
Win32 kernel32
%prm
hUpdate, fDiscard
hUpdate : [intptr] 型: HANDLE BeginUpdateResource 関数が返したモジュールハンドル。UpdateResource が使用し、更新するファイルを参照する。
fDiscard : [int] 型: BOOL リソース更新をファイルに書き込むかどうかを示す。このパラメータが TRUE の場合、変更は行われない。FALSE の場合、変更が行われ、リソース更新が反映される。
%inst
UpdateResource の呼び出し前に行われた変更をコミットまたは破棄する。(Unicode)

[戻り値]
型: BOOL 関数が成功した場合 TRUE、それ以外の場合 FALSE を返す。関数が成功し fDiscard が TRUE
の場合、リソース更新はファイルに行われない。それ以外の場合、すべての成功したリソース更新がファイルに行われる。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
この関数を呼ぶ前に、BeginUpdateResource
が返したもの以外のすべてのファイルハンドルが閉じられていることを確認する。この関数はコードとリソースの両方を含むモジュール内のリソースを更新できる。LN
ファイルおよび .mui ファイルでのリソース更新には制限がある。両方ともリソース構成データを含む。制限の詳細は
UpdateResource 関数のリファレンスにある。


%index
EnterSynchronizationBarrier
呼び出し側スレッドを同期バリアで待機させ、最大数のスレッドがバリアに入るまで待つ。
%group
Win32 kernel32
%prm
lpBarrier, dwFlags
lpBarrier : [var] 初期化された同期バリアへのポインタ。バリアを初期化するには InitializeSynchronizationBarrier 関数を使用する。SYNCHRONIZATION_BARRIER は不透明な構造体で、アプリケーションから変更してはならない。
dwFlags : [int] このバリアに入るスレッドの動作を制御するフラグ。このパラメータには次の値の 1 つ以上を指定できる。
%inst
呼び出し側スレッドを同期バリアで待機させ、最大数のスレッドがバリアに入るまで待つ。

[戻り値]
バリアにシグナルした最後のスレッドに対しては TRUE。最後のスレッドの前にバリアにシグナルしたスレッドは FALSE
の戻り値を受け取る。

[備考]

同期バリアに入るスレッドのデフォルトの動作は、バリアの最大スピンカウントに達するまでスピンし、その後ブロックすることである。これにより、最後のスレッドが比較的短時間でバリアに入る場合、スレッドが速やかに再開できる。ただし、最後のスレッドの到着に比較的時間がかかる場合、既にバリアに入っているスレッドはブロックし、待機中にプロセッサ時間を消費しないようにする。スレッドは
SYNCHRONIZATION_BARRIER_FLAGS_BLOCK_ONLY または
SYNCHRONIZATION_BARRIER_FLAGS_SPIN_ONLY
を指定してバリアのデフォルト動作を上書きできる。ただし、これらのフラグの使用は性能に影響する可能性があることに留意する。無期限のスピンはプロセッサが他のスレッドを処理するのを妨げ、早すぎるブロックはスレッドをプロセッサからスワップアウトし、ブロック解除時にスレッドを起こし、再びプロセッサ上にスワップインするオーバーヘッドを伴う。一般的に、バリアにスレッドを管理させ、性能テストでアプリケーションがこれらのフラグから恩恵を受けることが示された場合にのみ使用する方がよい。


%index
EnterUmsSchedulingMode
呼び出し側スレッドをユーザーモードスケジューリング (UMS) スケジューラスレッドに変換する。
%group
Win32 kernel32
%prm
SchedulerStartupInfo
SchedulerStartupInfo : [var] スレッドの UMS 属性を指定する UMS_SCHEDULER_STARTUP_INFO 構造体へのポインタ。完了リストや UmsSchedulerProc エントリポイント関数を含む。
%inst
呼び出し側スレッドをユーザーモードスケジューリング (UMS) スケジューラスレッドに変換する。

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
アプリケーションの UMS スケジューラは、UMS スレッドを実行するために使用される各プロセッサごとに 1 つの UMS
スケジューラスレッドを作成する。スケジューラは通常、スケジューラスレッドのアフィニティを単一プロセッサに設定し、そのプロセッサをそのスケジューラスレッドの使用のために実質的に予約する。スレッドアフィニティの詳細は
Multiple Processors を参照。UMS スケジューラスレッドが作成されたとき、システムは
EnterUmsSchedulingMode 関数の呼び出しで指定された UmsSchedulerProc
エントリポイント関数を呼ぶ。アプリケーションのスケジューラはスケジューラスレッドのアプリケーション固有の初期化を完了し、実行する UMS
ワーカースレッドを選択する責任がある。アプリケーションのスケジューラは、ワーカースレッドの UMS スレッドコンテキストで
ExecuteUmsThread を呼び出して実行する UMS ワーカースレッドを選択する。ワーカースレッドは
UmsThreadYield
を呼び出して制御を譲るか、ブロックするか、終了するまで実行される。その後、スケジューラスレッドは別のワーカースレッドを実行できる。スケジューラスレッドは、すべてのワーカースレッドが自然な停止点に到達するまで（つまり、すべてのワーカースレッドが譲歩、ブロック、または終了するまで）実行を続けるべきである。


%index
EnumCalendarInfoW
指定したロケールのカレンダー情報を列挙する。注: カレンダー情報に加えてカレンダー識別子を受け取るには、アプリケーションは EnumCalendarInfoEx 関数を使うべきである。(Unicode)
%group
Win32 kernel32
%prm
lpCalInfoEnumProc, Locale, Calendar, CalType
lpCalInfoEnumProc : [int] アプリケーション定義のコールバック関数へのポインタ。詳細は EnumCalendarInfoProc を参照。
Locale : [int] カレンダー情報を取得するロケールを指定するロケール識別子。MAKELCID マクロを使ってロケール識別子を作成するか、以下の定義済み値のいずれかを使用できる。
Calendar : [int] 情報を要求するカレンダーを指定するカレンダー識別子。この識別子は、ロケールに関連付けられたすべてのカレンダーを列挙するために ENUM_ALL_CALENDARS にすることもできる。
CalType : [int] カレンダー情報の種類。詳細は Calendar Type Information を参照。注記がある場合を除き、この関数の呼び出しごとに指定できるカレンダー種別は 1 つだけである。
%inst
指定したロケールのカレンダー情報を列挙する。注: カレンダー情報に加えてカレンダー識別子を受け取るには、アプリケーションは
EnumCalendarInfoEx 関数を使うべきである。(Unicode)

[戻り値]
成功した場合 0 以外、それ以外の場合 0 を返す。拡張エラー情報を取得するには、アプリケーションは GetLastError
を呼ぶことができ、次のいずれかのエラーコードを返すことがある。
（以下省略）

[備考]
EnumCalendarInfoEx の Remarks を参照。
> [!NOTE] > winnls.h ヘッダは UNICODE プリプロセッサ定数の定義に基づき、この関数の ANSI 版または
Unicode 版を自動選択するエイリアスとして EnumCalendarInfo
を定義する。エンコーディング非依存のエイリアスとエンコーディング依存のコードを混在させると、コンパイルや実行時のエラーを引き起こす不整合が生じることがある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
EnumCalendarInfoExW
識別子で指定されたロケールのカレンダー情報を列挙する。注: Windows Vista 以降でのみ動作するアプリケーションはこの関数より EnumCalendarInfoExEx を使うべきである。(Unicode)
%group
Win32 kernel32
%prm
lpCalInfoEnumProcEx, Locale, Calendar, CalType
lpCalInfoEnumProcEx : [int] アプリケーション定義のコールバック関数へのポインタ。詳細は EnumCalendarInfoProcEx を参照。
Locale : [int] カレンダー情報を取得するロケールを指定するロケール識別子。MAKELCID マクロを使って識別子を作成するか、以下の定義済み値のいずれかを使用できる。
Calendar : [int] 情報を要求するカレンダーを指定するカレンダー識別子。この識別子は、ロケールに関連付けられたすべてのカレンダーを列挙するために ENUM_ALL_CALENDARS にすることもできる。
CalType : [int] カレンダー情報の種類。詳細は Calendar Type Information を参照。注記がある場合を除き、この関数の呼び出しごとに指定できるカレンダー種別は 1 つだけである。
%inst
識別子で指定されたロケールのカレンダー情報を列挙する。注: Windows Vista 以降でのみ動作するアプリケーションはこの関数より
EnumCalendarInfoExEx を使うべきである。(Unicode)

[戻り値]
成功した場合 0 以外、それ以外の場合 0 を返す。拡張エラー情報を取得するには、アプリケーションは GetLastError
を呼ぶことができ、次のいずれかのエラーコードを返すことがある。
（以下省略）

[備考]
この関数は、Calendar
パラメータの値に応じて、指定したロケールに該当するすべてのカレンダー、または要求された単一のカレンダーのカレンダー情報を列挙する。関数は指定されたアプリケーション定義のコールバック関数を呼び出してカレンダー情報を列挙する。コールバック関数には、要求されたカレンダー情報を含むバッファへのポインタが渡される。この処理は
EnumCalendarInfoEx が最後の該当するカレンダーを見つけるか、コールバック関数が FALSE
を返すまで続く。この関数はカスタムロケールからのデータを列挙できる。データはコンピュータ間やアプリケーションの実行間で同じであるとは保証されない。アプリケーションがデータを永続化または送信しなければならない場合は
Using Persistent Locale Data を参照。Unicode 専用ロケール識別子と共にこの関数の ANSI
版を使用すると、オペレーティングシステムがシステムコードページを使うため、関数は成功することがある。ただし、システムコードページで未定義の文字は文字列内で疑問符
(?) として表示される。
> [!NOTE] > winnls.h ヘッダは UNICODE プリプロセッサ定数の定義に基づき、この関数の ANSI 版または
Unicode 版を自動選択するエイリアスとして EnumCalendarInfoEx
を定義する。エンコーディング非依存のエイリアスとエンコーディング依存のコードを混在させると、コンパイルや実行時のエラーを引き起こす不整合が生じることがある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
EnumCalendarInfoExEx
名前で指定されたロケールのカレンダー情報を列挙する。注: Windows Vista 以降でのみ動作するように設計されている場合、アプリケーションは EnumCalendarInfo や EnumCalendarInfoEx よりもこの関数を呼び出すべきである。注: この関数はカスタムロケールなどによりリリース間で変化するデータを列挙することがある。アプリケーションがデータを永続化または送信しなければならない場合は Using Persistent Locale Data を参照。
%group
Win32 kernel32
%prm
pCalInfoEnumProcExEx, lpLocaleName, Calendar, lpReserved, CalType, lParam
pCalInfoEnumProcExEx : [int] アプリケーション定義のコールバック関数へのポインタ。詳細は EnumCalendarInfoProcExEx を参照。
lpLocaleName : [wstr] ロケール名へのポインタ、または以下の定義済み値のいずれか。
Calendar : [int] 情報を要求するカレンダーを指定するカレンダー識別子。この識別子は、ロケールに関連付けられたすべてのカレンダーを列挙するために ENUM_ALL_CALENDARS にすることもできる。
lpReserved : [wstr] 予約。NULL でなければならない。
CalType : [int] カレンダー情報の種類。詳細は Calendar Type Information を参照。注記がある場合を除き、この関数の呼び出しごとに指定できるカレンダー種別は 1 つだけである。
lParam : [intptr] コールバック関数に渡すアプリケーション提供のパラメータ。この値はマルチスレッドアプリケーションで特に有用である。
%inst
名前で指定されたロケールのカレンダー情報を列挙する。注: Windows Vista
以降でのみ動作するように設計されている場合、アプリケーションは EnumCalendarInfo や EnumCalendarInfoEx
よりもこの関数を呼び出すべきである。注:
この関数はカスタムロケールなどによりリリース間で変化するデータを列挙することがある。アプリケーションがデータを永続化または送信しなければならない場合は
Using Persistent Locale Data を参照。

[戻り値]
成功した場合 0 以外、それ以外の場合 0 を返す。拡張エラー情報を取得するには、アプリケーションは GetLastError
を呼ぶことができ、次のいずれかのエラーコードを返すことがある。
（以下省略）

[備考]
この関数は、Calendar
パラメータの値に応じて、指定したロケールに該当するすべてのカレンダー、または要求された単一のカレンダーのカレンダー情報を列挙する。関数は指定されたアプリケーション定義のコールバック関数を呼び出してカレンダー情報を列挙する。コールバック関数には、要求されたカレンダー情報を含むバッファへのポインタ、カレンダー識別子、およびマルチスレッドアプリケーションで有用なアプリケーション定義のパラメータが渡される。この処理は、EnumCalendarInfoExEx
が最後の該当するカレンダーを見つけるか、コールバック関数が FALSE を返すまで続く。Windows 8 以降: アプリが
Windows.Globalization 名前空間からこの関数に言語タグを渡す場合、まず ResolveLocaleName
を呼んでタグを変換しなければならない。


%index
EnumDateFormatsW
指定したロケールで利用可能な長い日付、短い日付、年/月の形式を列挙する。(Unicode)
%group
Win32 kernel32
%prm
lpDateFmtEnumProc, Locale, dwFlags
lpDateFmtEnumProc : [int] アプリケーション定義のコールバック関数へのポインタ。詳細は EnumDateFormatsProc を参照。
Locale : [int] 日付形式情報を取得するロケールを指定するロケール識別子。MAKELCID マクロを使って識別子を作成するか、以下の定義済み値のいずれかを使用できる。
dwFlags : [int] 日付形式を指定するフラグ。詳細な定義は EnumDateFormatsExEx の dwFlags パラメータを参照。
%inst
指定したロケールで利用可能な長い日付、短い日付、年/月の形式を列挙する。(Unicode)

[戻り値]
成功した場合 0 以外、それ以外の場合 0 を返す。拡張エラー情報を取得するには、アプリケーションは GetLastError
を呼ぶことができ、次のいずれかのエラーコードを返すことがある。
（以下省略）

[備考]
注: この API は 2019 年 5
月の日本の元号変更に対応するために更新されている。アプリケーションが日本のカレンダーをサポートしている場合、新元号を正しく処理することを検証する必要がある。詳細は
Prepare your application for the Japanese era change を参照。 この関数の動作の詳細は
EnumDateFormatsEx の Remarks を参照。注:
代替カレンダーを持つロケールの日付形式を列挙するために、アプリケーションは EnumDateFormatsEx を使うべきである。
> [!NOTE] > winnls.h ヘッダは UNICODE プリプロセッサ定数の定義に基づき、この関数の ANSI 版または
Unicode 版を自動選択するエイリアスとして EnumDateFormats
を定義する。エンコーディング非依存のエイリアスとエンコーディング依存のコードを混在させると、コンパイルや実行時のエラーを引き起こす不整合が生じることがある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
EnumDateFormatsExW
指定したロケールで利用可能な長い日付、短い日付、年/月の形式を列挙する。注: Windows Vista 以降でのみ動作するアプリケーションはこの関数より EnumDateFormatsExEx を使うべきである。(Unicode)
%group
Win32 kernel32
%prm
lpDateFmtEnumProcEx, Locale, dwFlags
lpDateFmtEnumProcEx : [int] アプリケーション定義のコールバック関数へのポインタ。詳細は EnumDateFormatsProcEx を参照。
Locale : [int] 日付形式情報を取得するロケールを指定するロケール識別子。MAKELCID マクロを使って識別子を作成するか、以下の定義済み値のいずれかを使用できる。
dwFlags : [int] 日付形式を指定するフラグ。詳細な定義は EnumDateFormatsExEx の dwFlags パラメータを参照。
%inst
指定したロケールで利用可能な長い日付、短い日付、年/月の形式を列挙する。注: Windows Vista
以降でのみ動作するアプリケーションはこの関数より EnumDateFormatsExEx を使うべきである。(Unicode)

[戻り値]
成功した場合 0 以外、それ以外の場合 0 を返す。拡張エラー情報を取得するには、アプリケーションは GetLastError
を呼ぶことができ、次のいずれかのエラーコードを返すことがある。
（以下省略）

[備考]
注: この API は 2019 年 5
月の日本の元号変更に対応するために更新されている。アプリケーションが日本のカレンダーをサポートしている場合、新元号を正しく処理することを検証する必要がある。詳細は
Prepare your application for the Japanese era change を参照。
関数は日付形式文字列ポインタを 1 つずつ、指定されたアプリケーション定義のコールバック関数に渡して列挙する。この処理は
EnumDateFormatsEx が最後の日付形式を見つけるか、コールバック関数が FALSE
を返すまで続く。この関数は、代替カレンダーがある場合を含めて、指定されたロケールのすべての日付形式を列挙する。ただし、カレンダー識別子は日付形式と一緒には列挙されないため、代替カレンダーを持つロケールの形式は使いにくい。この関数はカスタムロケールからのデータを列挙できる。データはコンピュータ間やアプリケーションの実行間で同じであるとは保証されない。アプリケーションがデータを永続化または送信しなければならない場合は
Using Persistent Locale Data を参照。Unicode 専用ロケール識別子と共にこの関数の ANSI
版を使用すると、オペレーティングシステムがシステムコードページを使うため、関数は成功することがある。ただし、システムコードページで未定義の文字は文字列内で疑問符
(?) として表示される。アプリケーションは代替カレンダーを持つロケールの日付形式を列挙するために EnumDateFormats
ではなく EnumDateFormatsEx を使うべきである。
> [!NOTE] > winnls.h ヘッダは UNICODE プリプロセッサ定数の定義に基づき、この関数の ANSI 版または
Unicode 版を自動選択するエイリアスとして EnumDateFormatsEx
を定義する。エンコーディング非依存のエイリアスとエンコーディング依存のコードを混在させると、コンパイルや実行時のエラーを引き起こす不整合が生じることがある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
EnumDateFormatsExEx
名前で指定されたロケールで利用可能な長い日付、短い日付、年/月の形式を列挙する。注: Windows Vista 以降でのみ動作するように設計されている場合、アプリケーションは EnumDateFormats や EnumDateFormatsEx よりもこの関数を呼び出すべきである。注: この関数はカスタムロケールなどによりリリース間で変化するデータを列挙することがある。アプリケーションがデータを永続化または送信しなければならない場合は Using Persistent Locale Data を参照。
%group
Win32 kernel32
%prm
lpDateFmtEnumProcExEx, lpLocaleName, dwFlags, lParam
lpDateFmtEnumProcExEx : [int] アプリケーション定義のコールバック関数へのポインタ。詳細は EnumDateFormatsProcExEx を参照。
lpLocaleName : [wstr] ロケール名へのポインタ、または以下の定義済み値のいずれか。
dwFlags : [int] 
lParam : [intptr] コールバック関数に渡すアプリケーション提供のパラメータ。この値はマルチスレッドアプリケーションで特に有用である。
%inst
名前で指定されたロケールで利用可能な長い日付、短い日付、年/月の形式を列挙する。注: Windows Vista
以降でのみ動作するように設計されている場合、アプリケーションは EnumDateFormats や EnumDateFormatsEx
よりもこの関数を呼び出すべきである。注:
この関数はカスタムロケールなどによりリリース間で変化するデータを列挙することがある。アプリケーションがデータを永続化または送信しなければならない場合は
Using Persistent Locale Data を参照。

[戻り値]
成功した場合 0 以外、それ以外の場合 0 を返す。拡張エラー情報を取得するには、アプリケーションは GetLastError
を呼ぶことができ、次のいずれかのエラーコードを返すことがある。
（以下省略）

[備考]
注: この API は 2019 年 5
月の日本の元号変更に対応するために更新されている。アプリケーションが日本のカレンダーをサポートしている場合、新元号を正しく処理することを検証する必要がある。詳細は
Prepare your application for the Japanese era change を参照。
関数は日付形式文字列ポインタを 1
つずつ、指定されたアプリケーション定義のコールバック関数に渡し、マルチスレッドアプリケーションで有用なアプリケーション定義の定数と共に列挙する。この処理は
EnumDateFormatsExEx が最後の日付形式を見つけるか、コールバック関数が FALSE を返すまで続く。Windows 8
以降: アプリが Windows.Globalization 名前空間からこの関数に言語タグを渡す場合、まず
ResolveLocaleName を呼んでタグを変換しなければならない。


%index
EnumLanguageGroupLocalesW
指定された言語グループ内のロケールを列挙する。(Unicode)
%group
Win32 kernel32
%prm
lpLangGroupLocaleEnumProc, LanguageGroup, dwFlags, lParam
lpLangGroupLocaleEnumProc : [int] アプリケーション定義のコールバック関数へのポインタ。詳細は EnumLanguageGroupLocalesProc を参照。
LanguageGroup : [int] 
dwFlags : [int] 予約。0 でなければならない。
lParam : [int] コールバック関数に渡すアプリケーション定義の値。この値はエラーチェックに使用できる。コールバック関数のスレッド安全性を保証するためにも使用できる。
%inst
指定された言語グループ内のロケールを列挙する。(Unicode)

[戻り値]
成功した場合 0 以外、それ以外の場合 0 を返す。拡張エラー情報を取得するには、アプリケーションは GetLastError
を呼ぶことができ、次のいずれかのエラーコードを返すことがある。
（以下省略）

[備考]
この関数は、指定された言語グループ内のロケールを 1 つずつアプリケーション定義のコールバック関数に渡して列挙する。この処理は
EnumLanguageGroupLocales が最後のロケール識別子を見つけるか、コールバック関数が FALSE を返すまで続く。
> [!NOTE] > winnls.h ヘッダは UNICODE プリプロセッサ定数の定義に基づき、この関数の ANSI 版または
Unicode 版を自動選択するエイリアスとして EnumLanguageGroupLocales
を定義する。エンコーディング非依存のエイリアスとエンコーディング依存のコードを混在させると、コンパイルや実行時のエラーを引き起こす不整合が生じることがある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
EnumResourceLanguagesW
バイナリモジュールに関連付けられた、指定された種類と名前の言語固有リソースを列挙する。(Unicode)
%group
Win32 kernel32
%prm
hModule, lpType, lpName, lpEnumFunc, lParam
hModule : [intptr] 型: HMODULE 検索するモジュールへのハンドル。Windows Vista 以降、これが言語中立な PE (LN) ファイルである場合、適切な .mui ファイル（存在する場合）も検索に含まれる。これが特定の .mui ファイルである場合、リソースを検索するのはそのファイルのみとなる。
lpType : [wstr] 型: LPCTSTR 言語を列挙するリソースの種類。あるいは、ポインタの代わりに MAKEINTRESOURCE(ID) を指定できる。ID は事前定義リソース種別を表す整数値。事前定義リソース種別の一覧は Resource Types を参照。詳細は以下の Remarks セクションを参照。
lpName : [wstr] 型: LPCTSTR 言語を列挙するリソースの名前。あるいは、ポインタの代わりに MAKEINTRESOURCE(ID) を指定できる。ID はリソースの整数識別子。詳細は以下の Remarks セクションを参照。
lpEnumFunc : [int] 型: ENUMRESLANGPROC 列挙された各リソース言語に対して呼び出されるコールバック関数へのポインタ。詳細は EnumResLangProc を参照。
lParam : [int] 型: LONG_PTR コールバック関数に渡すアプリケーション定義の値。このパラメータはエラーチェックに使用できる。
%inst
バイナリモジュールに関連付けられた、指定された種類と名前の言語固有リソースを列挙する。(Unicode)

[戻り値]
型: BOOL 成功した場合 TRUE、それ以外の場合 FALSE を返す。拡張エラー情報を取得するには GetLastError
を呼ぶ。

[備考]
IS_INTRESOURCE(lpType) が TRUE の場合、lpType
は指定されたリソース種別の整数識別子を指定する。それ以外の場合は NULL 終端文字列へのポインタである。文字列の最初の文字がポンド記号
(#) の場合、残りの文字はリソース種別の整数識別子を指定する 10 進数を表す。たとえば、文字列 "#258" は識別子 258
を表す。同様に、IS_INTRESOURCE(lpName) が TRUE の場合、lpName
は指定されたリソースの整数識別子を指定する。それ以外の場合は NULL 終端文字列へのポインタである。文字列の最初の文字がポンド記号
(#) の場合、残りの文字はリソースの整数識別子を指定する 10 進数を表す。Windows Vista
以降、バイナリモジュールは通常言語中立な PE (LN) ファイルであり、列挙には対応する言語固有リソースファイル (.mui ファイル)
からのリソースも含まれる。見つかった各リソースについて、EnumResourceLanguages
はアプリケーション定義のコールバック関数 lpEnumFunc を呼び、リソースが見つかった言語の言語識別子（Language
Identifiers を参照）と、EnumResourceLanguages
に渡されたその他のパラメータを渡す。あるいはアプリケーションは、列挙されるリソースのより精密な制御を提供する
EnumResourceLanguagesEx を呼ぶこともできる。EnumResourceLanguages 関数は、コールバック関数が
FALSE を返すか、すべてのリソース言語が列挙されるまで、リソース言語の列挙を続ける。Windows Vista 以降、hModule
が LN ファイルを指定する場合、列挙されるリソースは LN ファイル内または関連する .mui ファイル内に存在する場合がある。.mui
ファイルが見つからない場合、LN ファイルからのリソースのみが返される。EnumResourceNames や
EnumResourceTypes と異なり、この検索は複数の .mui ファイルを参照する。列挙は EnumUILanguages
に関連付けられたフォルダ内の .mui ファイルから始まる。これに続いて、MUI Resource Management
で説明されているスキームに従う他の .mui ファイルが続く。最後に、hModule
で指定されたファイルも検索される。列挙には重複は含まれない。同じ名前、種類、言語のリソースが LN ファイルと .mui
ファイルの両方に含まれている場合、リソースは 1 度だけ列挙される。


%index
EnumResourceLanguagesExW
指定されたバイナリモジュールに関連付けられた、指定された種類と名前の言語固有リソースを列挙する。EnumResourceLanguages を拡張し、列挙のより細かい制御を可能にする。(Unicode)
%group
Win32 kernel32
%prm
hModule, lpType, lpName, lpEnumFunc, lParam, dwFlags, LangId
hModule : [intptr] 型: HMODULE 検索するモジュールへのハンドル。通常これは言語中立な PE (LN) ファイルであり、フラグ RESOURCE_ENUM_MUI が設定されている場合は適切な .mui ファイルも検索に含まれる。あるいは .mui ファイルや別の LN ファイルへのハンドルでもよい。これが特定の .mui ファイルである場合、リソースを検索するのはそのファイルのみとなる。
lpType : [wstr] 型: LPCTSTR 言語を列挙するリソースの種類。あるいは、ポインタの代わりに MAKEINTRESOURCE(ID) を指定できる。ID は事前定義リソース種別を表す整数値。事前定義リソース種別の一覧は Resource Types を参照。詳細は以下の Remarks セクションを参照。
lpName : [wstr] 型: LPCTSTR 言語を列挙するリソースの名前。あるいは、ポインタの代わりに MAKEINTRESOURCE(ID) を指定できる。ID はリソースの整数識別子。詳細は以下の Remarks セクションを参照。
lpEnumFunc : [int] 型: ENUMRESLANGPROC 列挙された各リソース言語に対して呼び出されるコールバック関数へのポインタ。詳細は EnumResLangProc を参照。
lParam : [int] 型: LONG_PTR コールバック関数に渡すアプリケーション定義の値。このパラメータはエラーチェックに使用できる。
dwFlags : [int] 型: DWORD 検索するファイルの種類。次の値がサポートされている。dwFlags が 0 の場合、RESOURCE_ENUM_LN と RESOURCE_ENUM_MUI フラグが指定されているとみなされる。
LangId : [int] 型: LANGID .mui ファイル内の検索をフィルタリングするためのローカリゼーション言語。このパラメータは dwFlags に RESOURCE_ENUM_MUI フラグが設定されている場合にのみ使用される。0 を指定した場合、すべての .mui ファイルが検索に含まれる。0 以外の LangId が指定された場合、指定された LangId に一致する .mui ファイルだけが検索される。
%inst
指定されたバイナリモジュールに関連付けられた、指定された種類と名前の言語固有リソースを列挙する。EnumResourceLanguages
を拡張し、列挙のより細かい制御を可能にする。(Unicode)

[戻り値]
型: BOOL 関数が成功した場合 TRUE、関数が指定された種類のリソースを見つけられなかったり他の理由で失敗した場合は FALSE
を返す。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
IS_INTRESOURCE(lpType) が TRUE の場合、lpType
は指定されたリソース種別の整数識別子を指定する。それ以外の場合は NULL 終端文字列へのポインタである。文字列の最初の文字がポンド記号
(#) の場合、残りの文字はリソース種別の整数識別子を指定する 10 進数を表す。たとえば、文字列 "#258" は識別子 258
を表す。同様に、IS_INTRESOURCE(lpName) が TRUE の場合、lpName
は指定されたリソースの整数識別子を指定する。それ以外の場合は NULL 終端文字列へのポインタである。文字列の最初の文字がポンド記号
(#) の場合、残りの文字はリソースの整数識別子を指定する 10 進数を表す。Windows Vista 以降、バイナリモジュールは通常
LN ファイルであり、列挙には対応する言語固有リソースファイル (.mui ファイル)
からのリソースも含まれる。これらは翻訳可能な言語リソースを含む。見つかったそのようなリソースごとに、EnumResourceLanguagesEx
はアプリケーション定義のコールバック関数 lpEnumFunc を呼び、リソースが見つかった言語の言語識別子（Language
Identifiers を参照）と、EnumResourceLanguagesEx に渡されたその他のパラメータを渡す。検索は LN
ファイルと関連する .mui ファイルの両方を含むこともできる。任意の種類の単一バイナリモジュールに制限することもできる。または、単一の
LN ファイルに関連する .mui ファイルに制限することもできる。さらに、hModule パラメータに LN ファイルを指定し、0
以外の LangId パラメータを指定することで、その LN ファイルと言語に関連する一意の .mui
ファイルに検索を制限することもできる。EnumResourceLanguagesEx 関数は、コールバック関数が FALSE
を返すか、すべてのリソース言語が列挙されるまで、リソース言語の列挙を続ける。hModule が LN
ファイルを指定し、両方のフラグが選択されている場合、列挙される言語には LN ファイル内または関連する .mui
ファイル内に存在するリソースのすべての言語が含まれる。.mui ファイルが見つからない場合、LN
ファイルからの言語のみが返される。dwFlags が RESOURCE_ENUM_MUI または NULL を含み、LangId が 0
の場合、列挙にはまずシステムにインストールされているすべての .mui ファイルに関連する言語が含まれ、EnumUILanguages
から取得した言語が使用される。最後に RESOURCE_ENUM_LN フラグも設定されている場合、hModule
で指定されたファイルも検索される。LangId が 0 以外の場合、その言語識別子に対応する .mui
ファイルのみが検索される。言語フォールバックは使用されない。その言語の .mui
ファイルが存在しない場合、列挙は空になる（その言語のリソースが LN ファイル内に存在し、LN
ファイルも検索するフラグが設定されている場合を除く）。列挙には重複は含まれない。特定の言語のリソースが LN ファイルと .mui
ファイルの両方に含まれている場合、その種類は 1 度だけ列挙される。


%index
EnumResourceNamesW
バイナリモジュール内の指定された種類のリソースを列挙する。(Unicode)
%group
Win32 kernel32
%prm
hModule, lpType, lpEnumFunc, lParam
hModule : [intptr] 型: **HMODULE** 検索するモジュールへのハンドル。Windows Vista 以降、これが LN ファイルである場合、適切な .mui ファイル（存在する場合）も検索に含まれる。このパラメータが **NULL** の場合、現在のプロセスを作成するために使用したモジュールへのハンドルを渡すのと同等である。
lpType : [wstr] 型: **LPCTSTR** 名前を列挙するリソースの種類。あるいは、ポインタの代わりに [MAKEINTRESOURCE](/windows/desktop/api/winuser/nf-winuser-makeintresourcea)(ID) を指定できる。ID は事前定義リソース種別を表す整数値。事前定義リソース種別の一覧は [Resource Types](/windows/win32/menurc/resource-types) を参照。詳細は以下の [Remarks](#remarks) セクションを参照。
lpEnumFunc : [int] 型: **ENUMRESNAMEPROC** 列挙された各リソース名または ID に対して呼び出されるコールバック関数へのポインタ。詳細は [ENUMRESNAMEPROC](/windows/win32/api/libloaderapi/nc-libloaderapi-enumresnameprocw) を参照。
lParam : [int] 型: **LONG_PTR** コールバック関数に渡すアプリケーション定義の値。このパラメータはエラーチェックに使用できる。
%inst
バイナリモジュール内の指定された種類のリソースを列挙する。(Unicode)

[戻り値]
型: **BOOL** 戻り値は、関数が成功した場合
**TRUE**、関数が指定された種類のリソースを見つけられなかったり他の理由で失敗した場合 **FALSE**
となる。拡張エラー情報を取得するには
[GetLastError](/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror)
を呼ぶ。

[備考]

[IS_INTRESOURCE](/windows/desktop/api/winuser/nf-winuser-is_intresource)(*lpszType*)
が **TRUE** の場合、*lpszType* は指定されたリソース種別の整数識別子を指定する。それ以外の場合は NULL
終端文字列へのポインタである。文字列の最初の文字がポンド記号 (#) の場合、残りの文字はリソース種別の整数識別子を指定する 10
進数を表す。たとえば、文字列 "#258" は識別子 258 を表す。見つかったリソースごとに、**EnumResourceNames**
はアプリケーション定義のコールバック関数 *lpEnumFunc* を呼び、見つかった各リソースの名前または ID
と、**EnumResourceNames**
に渡されたその他のパラメータを渡す。あるいはアプリケーションは、列挙されるリソースのより精密な制御を提供する
[EnumResourceNamesEx](/windows/desktop/api/libloaderapi/nf-libloaderapi-enumresourcenamesexw)
を呼ぶこともできる。リソースに ID がある場合、ID
がコールバック関数に渡される。それ以外の場合、リソース名がコールバック関数に渡される。詳細は
[ENUMRESNAMEPROC](/windows/win32/api/libloaderapi/nc-libloaderapi-enumresnameprocw)
を参照。**EnumResourceNames** 関数は、コールバック関数が **FALSE**
を返すか、すべてのリソースが列挙されるまで、リソースの列挙を続ける。Windows Vista 以降、*hModule* が LN
ファイルを指定する場合、列挙されるリソースは LN ファイル内または関連する .mui ファイル内に存在する場合がある。.mui
ファイルが見つからない場合、LN ファイルからのリソースのみが返される。.mui
ファイルが検索される順序は、通常のリソースローダー検索順序である。詳細は [User Interface Language
Management](/windows/desktop/Intl/user-interface-language-management)
を参照。1 つの適切な .mui ファイルが見つかると、.mui ファイルの検索は停止する。単一の LN ファイルに対応するすべての
.mui ファイルが同じリソース種類を持っているため、見つかった .mui
ファイル内のリソースのみを列挙する必要がある。列挙には重複は含まれない。同じ名前のリソースが LN ファイルと .mui
ファイルの両方に含まれている場合、リソースは 1 度だけ列挙される。


%index
EnumResourceNamesExW
指定されたバイナリモジュールに関連付けられた、指定された種類のリソースを列挙する。検索は LN ファイルと関連する .mui ファイルの両方を含むこともでき、いくつかの方法で制限することもできる。(Unicode)
%group
Win32 kernel32
%prm
hModule, lpType, lpEnumFunc, lParam, dwFlags, LangId
hModule : [intptr] 型: HMODULE 検索するモジュールへのハンドル。通常これは LN ファイルであり、フラグ RESOURCE_ENUM_MUI が設定されている場合は適切な .mui ファイルも検索に含まれる。あるいは .mui ファイルや別の LN ファイルへのハンドルでもよい。このパラメータが NULL の場合、現在のプロセスを作成するために使用したモジュールへのハンドルを渡すのと同等である。
lpType : [wstr] 型: LPCTSTR 名前を列挙するリソースの種類。あるいは、ポインタの代わりに MAKEINTRESOURCE(ID) を指定できる。ID は事前定義リソース種別を表す整数値。事前定義リソース種別の一覧は Resource Types を参照。詳細は以下の Remarks セクションを参照。
lpEnumFunc : [int] 型: ENUMRESNAMEPROC 列挙された各リソース名に対して呼び出されるコールバック関数へのポインタ。詳細は EnumResNameProc を参照。
lParam : [int] 型: LONG_PTR コールバック関数に渡すアプリケーション定義の値。このパラメータはエラーチェックに使用できる。
dwFlags : [int] 型: DWORD 検索するファイルの種類。次の値がサポートされている。dwFlags が 0 の場合、RESOURCE_ENUM_LN と RESOURCE_ENUM_MUI フラグが指定されているとみなされる。
LangId : [int] 型: LANGID MUI モジュール内の検索をフィルタリングするためのローカリゼーション言語。このパラメータは dwFlags に RESOURCE_ENUM_MUI フラグが設定されている場合にのみ使用される。0 を指定した場合、現在の言語設定に一致するすべての .mui ファイルが、通常のリソースローダー戦略（User Interface Language Management を参照）に従って検索に含まれる。0 以外の LangId が指定された場合、指定された LangId に一致する .mui ファイルだけが検索される。
%inst
指定されたバイナリモジュールに関連付けられた、指定された種類のリソースを列挙する。検索は LN ファイルと関連する .mui
ファイルの両方を含むこともでき、いくつかの方法で制限することもできる。(Unicode)

[戻り値]
型: BOOL 成功した場合は TRUE、関数が指定された種類のリソースを見つけられなかったり他の理由で失敗した場合は FALSE
を返す。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
IS_INTRESOURCE(lpszType) が TRUE の場合、lpszType
は指定されたリソース種別の整数識別子を指定する。それ以外の場合は NULL 終端文字列へのポインタである。文字列の最初の文字がポンド記号
(#) の場合、残りの文字はリソース種別の整数識別子を指定する 10 進数を表す。たとえば、文字列 "#258" は識別子 258
を表す。列挙検索は LN ファイルと関連する .mui
ファイルの両方を含むことができる。任意の種類の単一バイナリモジュールに制限することもできる。単一の LN ファイルに関連する .mui
ファイルに制限することもできる。hModule パラメータに LN ファイルを指定し、0 以外の LangId
パラメータを指定することで、その LN ファイルと言語に関連する一意の .mui
ファイルに検索を制限することができる。見つかったリソースごとに、EnumResourceNamesEx
はアプリケーション定義のコールバック関数 lpEnumFunc を呼び、見つかった各リソースの名前または ID
と、EnumResourceNamesEx に渡されたその他のパラメータを渡す。リソースに ID がある場合、ID
がコールバック関数に返される。それ以外の場合、リソース名がコールバック関数に返される。詳細は EnumResNameProc
を参照。EnumResourceNamesEx 関数は、コールバック関数が FALSE
を返すか、この種類のすべてのリソース名が列挙されるまで、リソース名の列挙を続ける。hModule が LN
ファイルを指定し、両方のフラグが選択されている場合、列挙される名前は LN ファイル内または関連する .mui
ファイル内に存在するリソースに対応する。.mui ファイルが見つからない場合、LN ファイルからの名前のみが返される。1 つの適切な
.mui ファイルが見つかると、それ以降は検索されない。これは、単一の LN ファイルに対応するすべての .mui
ファイルが同じリソース名を持っているためである。dwFlags と LangId の両方が 0 の場合、関数は
EnumResourceNames と同様に動作する。LangId が 0 以外の場合、その言語識別子に対応する .mui
ファイルのみが検索される。言語フォールバックは使用されない。その言語の .mui
ファイルが存在しない場合、列挙は空になる（その言語のリソースが LN ファイル内に存在し、LN
ファイルも検索するフラグが設定されている場合を除く）。列挙には重複は含まれない。特定の言語のリソースが LN ファイルと .mui
ファイルの両方に含まれている場合、名前は 1 度だけ列挙される。


%index
EnumResourceTypesW
バイナリモジュール内のリソース種別を列挙する。(Unicode)
%group
Win32 kernel32
%prm
hModule, lpEnumFunc, lParam
hModule : [intptr] 型: HMODULE 検索するモジュールへのハンドル。このハンドルは LoadLibrary または LoadLibraryEx を通じて取得しなければならない。詳細は Remarks を参照。このパラメータが NULL の場合、現在のプロセスを作成するために使用したモジュールへのハンドルを渡すのと同等である。
lpEnumFunc : [int] 型: ENUMRESTYPEPROC 列挙された各リソース種別に対して呼び出されるコールバック関数へのポインタ。詳細は EnumResTypeProc 関数を参照。
lParam : [int] 型: LONG_PTR コールバック関数に渡すアプリケーション定義の値。
%inst
バイナリモジュール内のリソース種別を列挙する。(Unicode)

[戻り値]
型: BOOL 成功した場合 TRUE、それ以外の場合 FALSE を返す。拡張エラー情報を取得するには GetLastError
を呼ぶ。

[備考]
見つかったリソース種別ごとに、EnumResourceTypes はアプリケーション定義のコールバック関数 lpEnumFunc
を呼び、見つかった各リソース種別と EnumResourceTypes
に渡されたその他のパラメータを渡す。EnumResourceTypes はコールバック関数が FALSE
を返すか、すべてのリソース種別が列挙されるまで、リソース種別の列挙を続ける。Windows Vista 以降、hModule が LN
ファイルを指定する場合、列挙される種類は LN ファイル内および関連する .mui ファイル内に存在するリソースに対応する。.mui
ファイルが見つからない場合、LN ファイルからの種類のみが返される。.mui
ファイルが検索される順序は、通常のリソースローダー検索順序である。詳細は User Interface Language
Management を参照。1 つの適切な .mui ファイルが見つかると、LN ファイルに関連する他の .mui
ファイルへの検索は続行されない。これは、単一の LN ファイルに対応するすべての .mui
ファイルが同じリソース種類のセットを持っているためである。列挙には重複は含まれない。特定のリソース種別が LN ファイルと .mui
ファイルの両方に含まれている場合、その種類は 1 度だけ列挙される。


%index
EnumResourceTypesExW
指定されたバイナリモジュールに関連付けられたリソース種別を列挙する。(Unicode)
%group
Win32 kernel32
%prm
hModule, lpEnumFunc, lParam, dwFlags, LangId
hModule : [intptr] 型: HMODULE 検索するモジュールへのハンドル。通常これは LN ファイルであり、フラグ RESOURCE_ENUM_MUI が設定されている場合は適切な .mui ファイルも検索に含まれる。あるいは .mui ファイルや別の LN ファイルへのハンドルでもよい。このパラメータが NULL の場合、現在のプロセスを作成するために使用したモジュールへのハンドルを渡すのと同等である。
lpEnumFunc : [int] 型: ENUMRESTYPEPROC 列挙された各リソース種別に対して呼び出されるコールバック関数へのポインタ。詳細は EnumResTypeProc を参照。
lParam : [int] 型: LONG_PTR コールバック関数に渡すアプリケーション定義の値。
dwFlags : [int] 型: DWORD 検索するファイルの種類。次の値がサポートされている。dwFlags が 0 の場合、RESOURCE_ENUM_LN と RESOURCE_ENUM_MUI フラグが指定されているとみなされる。
LangId : [int] 型: LANGID MUI モジュール内の検索をフィルタリングするための言語。このパラメータは dwFlags に RESOURCE_ENUM_MUI フラグが設定されている場合にのみ使用される。0 を指定した場合、現在の言語設定に一致するすべての .mui ファイルが、通常のリソースローダー戦略（User Interface Language Management を参照）に従って検索に含まれる。0 以外の LangId が指定された場合、指定された LangId に一致する .mui ファイルだけが検索される。
%inst
指定されたバイナリモジュールに関連付けられたリソース種別を列挙する。(Unicode)

[戻り値]
型: BOOL 成功した場合 TRUE、関数が指定された種類のリソースを見つけられなかったり他の理由で失敗した場合は FALSE
を返す。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
EnumResourceTypesEx 関数は、コールバック関数が FALSE
を返すか、すべてのリソース種別が列挙されるまで、リソース種別の列挙を続ける。hModule が LN
ファイルを指定し、両方のフラグが選択されている場合、列挙される種類は LN ファイル内または関連する .mui
ファイル内に存在するリソースに対応する。.mui ファイルが見つからない場合、LN ファイルからの種類のみが返される。1 つの適切な
.mui ファイルが見つかると、それ以降は検索されない。これは、単一の LN ファイルに対応するすべての .mui
ファイルが同じリソース種類を持っているためである。dwFlags と LangId の両方が 0 の場合、関数は
EnumResourceTypes と同様に動作する。LangId が 0 以外の場合、その言語識別子に対応する .mui
ファイルのみが検索される。言語フォールバックは使用されない。その言語の .mui
ファイルが存在しない場合、列挙は空になる（その言語のリソースが LN ファイル内に存在し、LN
ファイルも検索するフラグが設定されている場合を除く）。列挙には重複は含まれない。特定の言語のリソースが LN ファイルと .mui
ファイルの両方に含まれている場合、種類は 1 度だけ列挙される。


%index
EnumSystemCodePagesW
OS にインストールされている、または OS がサポートしているコードページを列挙する。(Unicode)
%group
Win32 kernel32
%prm
lpCodePageEnumProc, dwFlags
lpCodePageEnumProc : [int] アプリケーション定義のコールバック関数へのポインタ。EnumSystemCodePages 関数はこのコールバック関数を繰り返し呼ぶことでコードページを列挙する。詳細は EnumCodePagesProc を参照。
dwFlags : [int] 
%inst
OS にインストールされている、または OS がサポートしているコードページを列挙する。(Unicode)

[戻り値]
成功した場合 0 以外、それ以外の場合 0 を返す。拡張エラー情報を取得するには、アプリケーションは GetLastError
を呼ぶことができ、次のいずれかのエラーコードを返すことがある。
（以下省略）

[備考]
この関数は、コードページ識別子を 1
つずつ指定されたアプリケーション定義のコールバック関数に渡してコードページを列挙する。この処理は、インストール済みまたはサポートされているすべてのコードページ識別子がコールバック関数に渡されるか、コールバック関数が
FALSE を返すまで続く。アプリケーションがデータの保存に適したコードページを決定するためにこの関数を使用する場合、可能な限り
Unicode を使うべきである。他のコードページは、関連する標準の実装が異なるため、ベンダー間や OS 間で Unicode
ほど移植性がない。
> [!NOTE] > winnls.h ヘッダは UNICODE プリプロセッサ定数の定義に基づき、この関数の ANSI 版または
Unicode 版を自動選択するエイリアスとして EnumSystemCodePages
を定義する。エンコーディング非依存のエイリアスとエンコーディング依存のコードを混在させると、コンパイルや実行時のエラーを引き起こす不整合が生じることがある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
EnumSystemFirmwareTables
指定された種類のシステムファームウェアテーブルをすべて列挙する。
%group
Win32 kernel32
%prm
FirmwareTableProviderSignature, pFirmwareTableEnumBuffer, BufferSize
FirmwareTableProviderSignature : [int] 
pFirmwareTableEnumBuffer : [var] ファームウェアテーブルのリストを受け取るバッファへのポインタ。このパラメータが NULL の場合、戻り値は必要なバッファサイズである。このバッファの内容の詳細は Remarks セクションを参照。
BufferSize : [int] pFirmwareTableBuffer バッファのサイズ（バイト数）。
%inst
指定された種類のシステムファームウェアテーブルをすべて列挙する。

[戻り値]
関数が成功した場合、戻り値はバッファに書き込まれたバイト数である。この値は常に BufferSize
以下である。バッファが十分に大きくないために関数が失敗した場合、戻り値は必要なバッファサイズ（バイト数）である。この値は常に
BufferSize より大きい。それ以外の理由で関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
Windows 10 バージョン 1803 以降、ユニバーサル Windows アプリはアプリマニフェストで smbios
制限付き機能を宣言することで System Management BIOS (SMBIOS) 情報にアクセスできる。詳細は Access
SMBIOS information from a Universal Windows App を参照。ユニバーサル Windows
アプリからは生の SMBIOS (RSMB) ファームウェアテーブルのみアクセスできる。Windows Server 2003 SP1
以降、アプリケーションは \Device\PhysicalMemory
オブジェクトにアクセスできない。このオブジェクトへのアクセスはカーネルモードドライバに制限されている。この変更は、物理メモリの最下位
1MB に格納されている System Management BIOS (SMBIOS) や他の BIOS
データを読み取るアプリケーションに影響する。アプリケーションには低物理メモリからデータを読み取るための次の代替手段がある。
（以下省略）


%index
EnumSystemGeoID
OS で利用可能な地理的位置識別子（GEOID 型）を列挙する。
%group
Win32 kernel32
%prm
GeoClass, ParentGeoId, lpGeoEnumProc
GeoClass : [int] 識別子を列挙する地理的位置クラス。現時点では GEOCLASS_NATION のみサポートされる。この種類により、関数は OS 上のすべての国の地理的識別子を列挙する。
ParentGeoId : [int] 予約。このパラメータは 0 でなければならない。
lpGeoEnumProc : [int] アプリケーション定義のコールバック関数 EnumGeoInfoProc へのポインタ。EnumSystemGeoID 関数は FALSE を返すまでこのコールバック関数を繰り返し呼ぶ。
%inst
OS で利用可能な地理的位置識別子（GEOID 型）を列挙する。

[戻り値]
成功した場合 0 以外、それ以外の場合 0 を返す。拡張エラー情報を取得するには、アプリケーションは GetLastError
を呼ぶことができ、次のいずれかのエラーコードを返すことがある。
（以下省略）


%index
EnumSystemGeoNames
OS で利用可能な地理的位置を表す 2 文字の国際標準化機構 (ISO) 3166-1 コードまたは数値の国連 (UN) Series M, Number 49 (M.49) コードを列挙する。
%group
Win32 kernel32
%prm
geoClass, geoEnumProc, data
geoClass : [int] 利用可能な 2 文字 ISO 3166-1 または数値 UN M.49 コードを列挙する地理的位置クラス。
geoEnumProc : [int] アプリケーション定義のコールバック関数 Geo_EnumNameProc へのポインタ。EnumSystemGeoNames 関数は、コールバック関数が FALSE を返すまで、OS で利用可能な地理的位置を表す 2 文字 ISO 3166-1 または数値 UN M.49 コードのそれぞれに対してこのコールバック関数を呼ぶ。
data : [intptr] geoEnumProc パラメータで指定されるコールバック関数に渡すアプリケーション固有の情報。
%inst
OS で利用可能な地理的位置を表す 2 文字の国際標準化機構 (ISO) 3166-1 コードまたは数値の国連 (UN) Series
M, Number 49 (M.49) コードを列挙する。

[戻り値]
成功した場合 0 以外、それ以外の場合 0 を返す。拡張エラー情報を取得するには GetLastError
を呼ぶことができ、次のいずれかのエラーコードを返すことがある。
（以下省略）

[備考]
2 文字 ISO 3166-1 コードに関する情報は Country Codes - ISO 3166 を参照。数値 UN M.49
コードに関する情報は Standard country or area codes for statistical use (M49)
を参照。


%index
EnumSystemLanguageGroupsW
OS にインストールされている、または OS がサポートしている言語グループを列挙する。(Unicode)
%group
Win32 kernel32
%prm
lpLanguageGroupEnumProc, dwFlags, lParam
lpLanguageGroupEnumProc : [int] アプリケーション定義のコールバック関数へのポインタ。詳細は EnumLanguageGroupsProc を参照。
dwFlags : [int] 
lParam : [int] コールバック関数に渡すアプリケーション定義の値。このパラメータはエラーチェックに使用できる。コールバック関数のスレッド安全性を保証するためにも使用できる。
%inst
OS にインストールされている、または OS がサポートしている言語グループを列挙する。(Unicode)

[戻り値]
成功した場合 TRUE、それ以外の場合 FALSE を返す。拡張エラー情報を取得するには、アプリケーションは GetLastError
を呼ぶことができ、次のいずれかのエラーコードを返すことがある。
（以下省略）

[備考]
この関数は、言語グループ識別子を 1
つずつ指定されたアプリケーション定義のコールバック関数に渡して言語グループを列挙する。この処理は最後の言語グループ識別子が見つかるか、コールバック関数が
FALSE を返すまで続く。
> [!NOTE] > winnls.h ヘッダは UNICODE プリプロセッサ定数の定義に基づき、この関数の ANSI 版または
Unicode 版を自動選択するエイリアスとして EnumSystemLanguageGroups
を定義する。エンコーディング非依存のエイリアスとエンコーディング依存のコードを混在させると、コンパイルや実行時のエラーを引き起こす不整合が生じることがある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
EnumSystemLocalesW
OS にインストールされている、または OS がサポートしているロケールを列挙する。注: 相互運用性の観点から、Microsoft は新しいロケールにロケール識別子の代わりにロケール名を使用する方向に移行しているため、アプリケーションは EnumSystemLocales よりも EnumSystemLocalesEx 関数を優先すべきである。Windows Vista 以降でのみ動作するアプリケーションは EnumSystemLocalesEx を使うべきである。(Unicode)
%group
Win32 kernel32
%prm
lpLocaleEnumProc, dwFlags
lpLocaleEnumProc : [int] アプリケーション定義のコールバック関数へのポインタ。詳細は EnumLocalesProc を参照。
dwFlags : [int] 列挙するロケール識別子を指定するフラグ。フラグは単独でも、バイナリ OR で結合しても使用できる。アプリケーションがこのパラメータに 0 を指定した場合、関数は LCID_SUPPORTED の場合と同様に動作する。
%inst
OS にインストールされている、または OS がサポートしているロケールを列挙する。注: 相互運用性の観点から、Microsoft
は新しいロケールにロケール識別子の代わりにロケール名を使用する方向に移行しているため、アプリケーションは
EnumSystemLocales よりも EnumSystemLocalesEx 関数を優先すべきである。Windows Vista
以降でのみ動作するアプリケーションは EnumSystemLocalesEx を使うべきである。(Unicode)

[戻り値]
成功した場合 0 以外、それ以外の場合 0 を返す。拡張エラー情報を取得するには、アプリケーションは GetLastError
を呼ぶことができ、次のいずれかのエラーコードを返すことがある。
（以下省略）

[備考]
この関数は、ロケール識別子を 1
つずつ指定されたアプリケーション定義のコールバック関数に渡してロケールを列挙する。これは、インストール済みまたはサポートされているすべてのロケール識別子がコールバック関数に渡されるか、コールバック関数が
FALSE を返すまで続く。
> [!NOTE] > winnls.h ヘッダは UNICODE プリプロセッサ定数の定義に基づき、この関数の ANSI 版または
Unicode 版を自動選択するエイリアスとして EnumSystemLocales
を定義する。エンコーディング非依存のエイリアスとエンコーディング依存のコードを混在させると、コンパイルや実行時のエラーを引き起こす不整合が生じることがある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
EnumSystemLocalesEx
OS にインストールされている、または OS がサポートしているロケールを列挙する。注: Windows Vista 以降でのみ動作するように設計されている場合、アプリケーションは EnumSystemLocales よりもこの関数を呼び出すべきである。
%group
Win32 kernel32
%prm
lpLocaleEnumProcEx, dwFlags, lParam, lpReserved
lpLocaleEnumProcEx : [int] アプリケーション定義のコールバック関数へのポインタ。EnumSystemLocalesEx 関数はこのコールバック関数を繰り返し呼ぶことでロケールを列挙する。詳細は EnumLocalesProcEx を参照。
dwFlags : [int] 列挙するロケールを識別するフラグ。フラグは単独でも、バイナリ OR で結合しても使用できる。アプリケーションがこのパラメータに 0 を指定した場合、関数は LOCALE_ALL の場合と同様に動作する。
lParam : [intptr] コールバック関数に渡すアプリケーション提供のパラメータ。これはマルチスレッドアプリケーションで特に有用である。
lpReserved : [intptr] 予約。NULL でなければならない。
%inst
OS にインストールされている、または OS がサポートしているロケールを列挙する。注: Windows Vista
以降でのみ動作するように設計されている場合、アプリケーションは EnumSystemLocales よりもこの関数を呼び出すべきである。

[戻り値]
成功した場合 0 以外、それ以外の場合 0 を返す。拡張エラー情報を取得するには、アプリケーションは GetLastError
を呼ぶことができ、次のいずれかのエラーコードを返すことがある。
（以下省略）

[備考]
この関数は、ロケール名を 1 つずつ lpLocaleEnumProcEx
で指定されたアプリケーション定義のコールバック関数に渡してロケールを列挙する。列挙は、インストール済みまたはサポートされているすべての名前がコールバック関数に渡されるか、コールバック関数が
FALSE を返すまで続く。dwFlags パラメータの選択肢は、インストール済みとサポート済みのロケールを区別する必要がある
EnumSystemLocales のものとは異なる。dwFlags が LOCALE_ALTERNATE_SORTS
を指定する場合、コールバック関数は代替ソート順を表すすべてのロケールに対して呼ばれる。たとえば、Spanish (Spain)
は国際ソート順をデフォルトとするが、伝統的なソート順を代替ソートとして利用できる。German (Germany)
は辞書ソート順をデフォルトとするが、電話帳ソート順という代替がある。


%index
EnumTimeFormatsW
識別子で指定されたロケールで利用可能な時刻形式を列挙する。注: 相互運用性の観点から、Microsoft は新しいロケールにロケール識別子の代わりにロケール名を使用する方向に移行しているため、アプリケーションは EnumTimeFormats よりも EnumTimeFormatsEx 関数を優先すべきである。Windows Vista 以降でのみ動作するアプリケーションは EnumTimeFormatsEx を使うべきである。(Unicode)
%group
Win32 kernel32
%prm
lpTimeFmtEnumProc, Locale, dwFlags
lpTimeFmtEnumProc : [int] アプリケーション定義のコールバック関数へのポインタ。詳細は EnumTimeFormatsProc を参照。
Locale : [int] 時刻形式情報を取得するロケールを指定するロケール識別子。MAKELCID マクロを使ってロケール識別子を作成するか、以下の定義済み値のいずれかを使用できる。
dwFlags : [int] 
%inst
識別子で指定されたロケールで利用可能な時刻形式を列挙する。注: 相互運用性の観点から、Microsoft
は新しいロケールにロケール識別子の代わりにロケール名を使用する方向に移行しているため、アプリケーションは EnumTimeFormats
よりも EnumTimeFormatsEx 関数を優先すべきである。Windows Vista 以降でのみ動作するアプリケーションは
EnumTimeFormatsEx を使うべきである。(Unicode)

[戻り値]
成功した場合 0 以外、それ以外の場合 0 を返す。拡張エラー情報を取得するには、アプリケーションは GetLastError
を呼ぶことができ、次のいずれかのエラーコードを返すことがある。
（以下省略）

[備考]

関数は、時刻形式を含むバッファへのポインタをアプリケーション定義のコールバック関数に渡して時刻形式を列挙する。列挙の最初の値は常にユーザーデフォルト（オーバーライド）値である。関数は最後の時刻形式が見つかるか、コールバック関数が
FALSE を返すまで列挙を続ける。

この関数はカスタムロケールからのデータを列挙できる。データはコンピュータ間やアプリケーションの実行間で同じであるとは保証されない。アプリケーションがデータを永続化または送信しなければならない場合は
Using Persistent Locale Data を参照。Unicode 専用ロケール識別子と共にこの関数の ANSI
版を使用すると、システムがシステムコードページを使うため、呼び出しは成功することがある。ただし、システムコードページで未定義の文字は文字列内で疑問符
("?") として表示される。将来導入される dwFlags の新しい値は ANSI 版では動作しないことに注意。
> [!NOTE] > winnls.h ヘッダは UNICODE プリプロセッサ定数の定義に基づき、この関数の ANSI 版または
Unicode 版を自動選択するエイリアスとして EnumTimeFormats
を定義する。エンコーディング非依存のエイリアスとエンコーディング依存のコードを混在させると、コンパイルや実行時のエラーを引き起こす不整合が生じることがある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
EnumTimeFormatsEx
名前で指定されたロケールで利用可能な時刻形式を列挙する。注: Windows Vista 以降でのみ動作するように設計されている場合、アプリケーションは EnumTimeFormats よりもこの関数を呼び出すべきである。注: この関数はカスタムロケールなどによりリリース間で変化するデータを列挙することがある。アプリケーションがデータを永続化または送信しなければならない場合は Using Persistent Locale Data を参照。
%group
Win32 kernel32
%prm
lpTimeFmtEnumProcEx, lpLocaleName, dwFlags, lParam
lpTimeFmtEnumProcEx : [int] アプリケーション定義のコールバック関数へのポインタ。詳細は EnumTimeFormatsProcEx を参照。
lpLocaleName : [wstr] ロケール名へのポインタ、または以下の定義済み値のいずれか。
dwFlags : [int] 時刻形式。現在のユーザーの長い時刻形式を使用するには 0 に、Windows 7 以降の短い時刻形式を使用するには TIME_NOSECONDS に設定する。
lParam : [intptr] コールバック関数に渡すアプリケーション提供のパラメータ。これはマルチスレッドアプリケーションで特に有用である。
%inst
名前で指定されたロケールで利用可能な時刻形式を列挙する。注: Windows Vista
以降でのみ動作するように設計されている場合、アプリケーションは EnumTimeFormats よりもこの関数を呼び出すべきである。注:
この関数はカスタムロケールなどによりリリース間で変化するデータを列挙することがある。アプリケーションがデータを永続化または送信しなければならない場合は
Using Persistent Locale Data を参照。

[戻り値]
成功した場合 0 以外、それ以外の場合 0 を返す。拡張エラー情報を取得するには、アプリケーションは GetLastError
を呼ぶことができ、次のいずれかのエラーコードを返すことがある。
（以下省略）

[備考]
この関数は、時刻形式文字列ポインタを 1
つずつ、指定されたアプリケーション定義のコールバック関数に渡し、マルチスレッドアプリケーションで有用なアプリケーション定義の定数と共に時刻形式を列挙する。列挙の最初の値は常にユーザーデフォルト（オーバーライド）値である。関数は最後の時刻形式が見つかるか、コールバック関数が
FALSE を返すまで列挙を続ける。Windows 8 以降: アプリが Windows.Globalization
名前空間からこの関数に言語タグを渡す場合、まず ResolveLocaleName を呼んでタグを変換しなければならない。


%index
EnumUILanguagesW
OS で利用可能なユーザーインターフェース言語を列挙し、リスト内の各言語に対してコールバック関数を呼ぶ。(Unicode)
%group
Win32 kernel32
%prm
lpUILanguageEnumProc, dwFlags, lParam
lpUILanguageEnumProc : [int] アプリケーション定義の EnumUILanguagesProc コールバック関数へのポインタ。EnumUILanguages はリスト内の言語を列挙するためにこの関数を繰り返し呼ぶ。
dwFlags : [int] 言語の形式とフィルタリングを識別するフラグ。次のフラグはコールバック関数に渡す言語の形式を指定する。形式フラグは互いに排他的で、MUI_LANGUAGE_ID がデフォルトである。
lParam : [int] アプリケーション定義の値。
%inst
OS で利用可能なユーザーインターフェース言語を列挙し、リスト内の各言語に対してコールバック関数を呼ぶ。(Unicode)

[戻り値]
成功した場合 TRUE、それ以外の場合 FALSE を返す。拡張エラー情報を取得するには、アプリケーションは GetLastError
を呼ぶことができ、次のいずれかのエラーコードを返すことがある。
（以下省略）

[備考]
この関数は、利用可能でフラグの指定に応じて OS
で使用するライセンスを持つユーザーインターフェース言語を列挙する。言語識別子または言語名を 1 つずつ
EnumUILanguagesProc コールバック関数に渡す。EnumUILanguages
関数は、最後の言語が見つかるか、コールバック関数が FALSE
を返すまで言語識別子または名前をコールバック関数に渡し続ける。Windows Vista
以降でのみ動作するアプリケーションでは、MUI_LANGUAGE_ID よりも MUI_LANGUAGE_NAME
を推奨する。MUI_LANGUAGE_NAME を使うと、補助ロケールに関連付けられた言語を区別できる。この関数の呼び出しで
MUI_LANGUAGE_ID フラグが指定されている場合、コールバック関数に渡される文字列は先頭に 0x を含まない 16
進数の言語識別子で、長さは 4 文字となる。たとえば en-US は "0409" として、en は "0009" として渡される。値
"1000" は補助ロケールに関連付けられた任意の言語に対してコールバック関数に渡される。これは
LOCALE_CUSTOM_UNSPECIFIED の 16 進数値に対応する。これは選択された言語がユーザー優先 UI
言語リストまたはシステム優先 UI 言語リストにある場合でも、補助ロケールを区別しない。C# シグネチャ
（以下省略）


%index
EraseTape
テープの全部または一部を消去する。
%group
Win32 kernel32
%prm
hDevice, dwEraseType, bImmediate
hDevice : [intptr] テープを消去するデバイスへのハンドル。このハンドルは CreateFile 関数を使って作成する。
dwEraseType : [int] 
bImmediate : [int] このパラメータが TRUE の場合、関数は即座に戻る。FALSE の場合、関数は消去操作が完了するまで戻らない。
%inst
テープの全部または一部を消去する。

[戻り値]
関数が成功した場合、戻り値は NO_ERROR である。関数が失敗した場合、次のエラーコードのいずれかを返すことがある。
（以下省略）

[備考]

一部のテープデバイスは特定のテープ操作をサポートしない。テープデバイスの機能を判断するには、テープデバイスのドキュメントを参照し、GetTapeParameters
関数を使用する。


%index
EscapeCommFunction
指定された通信デバイスに拡張機能を実行するよう指示する。
%group
Win32 kernel32
%prm
hFile, dwFunc
hFile : [intptr] 通信デバイスへのハンドル。CreateFile 関数がこのハンドルを返す。
dwFunc : [int] 
%inst
指定された通信デバイスに拡張機能を実行するよう指示する。

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼ぶ。


%index
ExecuteUmsThread
指定された UMS ワーカースレッドを実行する。
%group
Win32 kernel32
%prm
UmsThread
UmsThread : [intptr] 実行するワーカースレッドの UMS スレッドコンテキストへのポインタ。
%inst
指定された UMS ワーカースレッドを実行する。

[戻り値]
関数が成功した場合、値を返さない。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには GetLastError
を呼ぶ。発生し得るエラーコードには次のものが含まれる。
（以下省略）

[備考]
ExecuteUmsThread 関数は、指定された UMS ワーカースレッドの状態を呼び出し側 UMS
スケジューラスレッドの状態の上にロードし、ワーカースレッドが実行できるようにする。ワーカースレッドは UmsThreadYield
関数を呼んで譲歩するか、ブロックするか、終了するまで実行される。ワーカースレッドが譲歩またはブロックすると、システムはスケジューラスレッドの
UmsSchedulerProc
エントリポイント関数を呼ぶ。以前にブロックされていたワーカースレッドのブロックが解除されると、システムはワーカースレッドが作成されたときに
UpdateProcThreadAttribute
関数で指定された完了リストにワーカースレッドをキューする。ExecuteUmsThread 関数は、エラーが発生しない限り戻らない。関数が
ERROR_RETRY を返した場合、エラーは一時的なもので操作を再試行できる。関数が ERROR_RETRY
以外のエラーを返した場合、アプリケーションのスケジューラはそれぞれ UmsThreadIsSuspended または
UmsThreadIsTerminated で QueryUmsThreadInformation
を呼び、スレッドがサスペンドまたは終了しているかを確認すべきである。その他の発生し得るエラーには、UMS
スケジューラスレッドではないスレッド上で関数を呼び出した場合、無効な UMS
ワーカースレッドコンテキストを渡した場合、または既に別のスケジューラスレッド上で実行中のワーカースレッドを指定した場合などが含まれる。


%index
ExitProcess
呼び出し側プロセスとそのすべてのスレッドを終了する。
%group
Win32 kernel32
%prm
uExitCode
uExitCode : [int] プロセスとそのすべてのスレッドの終了コード。
%inst
呼び出し側プロセスとそのすべてのスレッドを終了する。

[備考]
プロセスの終了値を取得するには GetExitCodeProcess 関数を使用する。スレッドの終了値を取得するには
GetExitCodeThread 関数を使用する。プロセスを終了すると次のことが発生する。
（以下省略）


%index
ExpandEnvironmentStringsW
環境変数文字列を展開し、現在のユーザーに対して定義された値に置き換える。(Unicode)
%group
Win32 kernel32
%prm
lpSrc, lpDst, nSize
lpSrc : [wstr] %variableName% の形式で 1 つ以上の環境変数文字列を含むバッファ。そのような参照ごとに、%variableName% の部分はその環境変数の現在の値で置き換えられる。
lpDst : [wstr] lpSrc バッファ内の環境変数文字列の展開結果を受け取るバッファへのポインタ。このバッファは lpSrc バッファと同じであってはならないことに注意。
nSize : [int] lpDst パラメータが指すバッファに格納できる最大文字数。ANSI 文字列を使用する場合、バッファサイズは文字列長 + 終端 NULL 文字 + 1 でなければならない。Unicode 文字列を使用する場合、バッファサイズは文字列長 + 終端 NULL 文字でなければならない。
%inst
環境変数文字列を展開し、現在のユーザーに対して定義された値に置き換える。(Unicode)

[戻り値]
関数が成功した場合、戻り値は終端 NULL 文字を含む宛先バッファに格納された TCHAR
数である。宛先バッファが展開された文字列を保持するには小さすぎる場合、戻り値は必要なバッファサイズ（文字数）である。関数が失敗した場合、戻り値は
0 となる。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
lpSrc と lpDst バッファのサイズは 32K
に制限される。完全修飾パス内のフォルダ名を関連付けられた環境変数文字列に置き換えるには、PathUnExpandEnvStrings
関数を使用する。プロセスの環境変数のリストを取得するには、GetEnvironmentStrings 関数を使用する。


%index
ExpungeConsoleCommandHistoryW
(no summary)
%group
Win32 kernel32
%prm
ExeName
ExeName : [wstr] 
%inst



%index
FatalAppExitW
メッセージボックスを表示し、メッセージボックスが閉じられたときにアプリケーションを終了する。(Unicode)
%group
Win32 kernel32
%prm
uAction, lpMessageText
uAction : [int] このパラメータは 0 でなければならない。
lpMessageText : [wstr] メッセージボックスに表示される NULL 終端文字列。
%inst
メッセージボックスを表示し、メッセージボックスが閉じられたときにアプリケーションを終了する。(Unicode)

[備考]
アプリケーションは他の方法で終了できない場合にのみ FatalAppExit を呼ぶ。
> [!NOTE] > errhandlingapi.h ヘッダは UNICODE プリプロセッサ定数の定義に基づき、この関数の ANSI
版または Unicode 版を自動選択するエイリアスとして FatalAppExit
を定義する。エンコーディング非依存のエイリアスとエンコーディング依存のコードを混在させると、コンパイルや実行時のエラーを引き起こす不整合が生じることがある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
FatalExit
実行制御をデバッガに移す。デバッガのその後の動作は使用するデバッガの種類に依存する。
%group
Win32 kernel32
%prm
ExitCode
ExitCode : [int] 終了に関連付けられたエラーコード。
%inst
実行制御をデバッガに移す。デバッガのその後の動作は使用するデバッガの種類に依存する。

[戻り値]
この関数は値を返さない。

[備考]
アプリケーションはデバッグ目的のみに FatalExit
を使用すべきである。アプリケーションのリテール版でこの関数を呼んではならない。これを呼ぶとアプリケーションが終了するためである。


%index
FileTimeToDosDateTime
ファイル時刻を MS-DOS 日付・時刻値に変換する。
%group
Win32 kernel32
%prm
lpFileTime, lpFatDate, lpFatTime
lpFileTime : [var] MS-DOS 日付・時刻形式に変換するファイル時刻を含む FILETIME 構造体へのポインタ。
lpFatDate : [var] MS-DOS 日付を受け取る変数へのポインタ。日付は次の形式のパック値である。
lpFatTime : [var] MS-DOS 時刻を受け取る変数へのポインタ。時刻は次の形式のパック値である。
%inst
ファイル時刻を MS-DOS 日付・時刻値に変換する。

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
MS-DOS 日付形式は 1980/1/1 から 2107/12/31
までの日付しか表現できない。入力ファイル時刻がこの範囲外の場合、この変換は失敗する。


%index
FileTimeToLocalFileTime
ファイル時刻をローカルファイル時刻に変換する。
%group
Win32 kernel32
%prm
lpFileTime, lpLocalFileTime
lpFileTime : [var] ローカルファイル時刻に変換する UTC ベースのファイル時刻を含む FILETIME 構造体へのポインタ。
lpLocalFileTime : [var] 変換されたローカルファイル時刻を受け取る FILETIME 構造体へのポインタ。このパラメータは lpFileTime パラメータと同じであってはならない。
%inst
ファイル時刻をローカルファイル時刻に変換する。

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
ファイル時刻をローカル時刻に変換する際に夏時間を考慮するには、FileTimeToLocalFileTime
を使用する代わりに次の関数の順序を使用する。
（以下省略）


%index
FileTimeToSystemTime
ファイル時刻をシステム時刻形式に変換する。システム時刻は協定世界時 (UTC) に基づく。
%group
Win32 kernel32
%prm
lpFileTime, lpSystemTime
lpFileTime : [var] システム (UTC) 日付・時刻形式に変換するファイル時刻を含む FILETIME 構造体へのポインタ。この値は 0x8000000000000000 未満でなければならない。そうでない場合、関数は失敗する。
lpSystemTime : [var] 変換されたファイル時刻を受け取る SYSTEMTIME 構造体へのポインタ。
%inst
ファイル時刻をシステム時刻形式に変換する。システム時刻は協定世界時 (UTC) に基づく。

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼ぶ。


%index
FillConsoleOutputAttribute
スクリーンバッファ内の指定された座標から始まる、指定された数の文字セルに対して文字属性を設定する。
%group
Win32 kernel32
%prm
hConsoleOutput, wAttribute, nLength, dwWriteCoord, lpNumberOfAttrsWritten
hConsoleOutput : [intptr] コンソールスクリーンバッファへのハンドル。ハンドルは **GENERIC\_WRITE** アクセス権を持っていなければならない。詳細は [Console Buffer Security and Access Rights](console-buffer-security-and-access-rights.md) を参照。
wAttribute : [int] コンソールスクリーンバッファへ書き込む際に使用する属性。詳細は [Character Attributes](console-screen-buffers.md#character-attributes) を参照。
nLength : [int] 指定された色属性に設定する文字セル数。
dwWriteCoord : [var] 属性を設定する最初のセルの文字座標を指定する [**COORD**](coord-str.md) 構造体。
lpNumberOfAttrsWritten : [var] 実際に属性が設定された文字セル数を受け取る変数へのポインタ。
%inst
スクリーンバッファ内の指定された座標から始まる、指定された数の文字セルに対して文字属性を設定する。

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
[**GetLastError**](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror)
を呼ぶ。

[備考]

属性を設定する文字セル数がコンソールスクリーンバッファ内の指定された行の終わりを越える場合、次の行のセルが設定される。書き込むセル数がコンソールスクリーンバッファの終わりを越える場合、コンソールスクリーンバッファの終わりまでセルが書き込まれる。書き込まれた位置の文字値は変更されない。>
[!TIP] > この API は推奨されず、特定の
**[仮想ターミナル](console-virtual-terminal-sequences.md)**
に対応する機能はない。表示可能なウィンドウの外側の領域を埋めることはサポートされず、ターミナルの履歴空間用に予約されている。表示可能な領域を新しいテキストや色で埋めるには、**[カーソルを移動](console-virtual-terminal-sequences.md#cursor-positioning)**
し、**[新しい属性を設定](console-virtual-terminal-sequences.md#text-formatting)**
して、その領域に必要なテキストを書き込み、必要に応じて埋める実行のために文字を繰り返す。矩形領域を埋めるには、追加のカーソル移動とそれに続くテキストの書き込みが必要となることがある。クライアントアプリケーションは画面上にあるものを自身のメモリ内で保持することが期待され、リモート状態を問い合わせることはできない。詳細は
**[classic console versus virtual terminal](classic-vs-vt.md)**
ドキュメントを参照。


%index
FillConsoleOutputCharacterW
指定された座標から始めて、指定された回数だけコンソールスクリーンバッファに文字を書き込む。
%group
Win32 kernel32
%prm
hConsoleOutput, cCharacter, nLength, dwWriteCoord, lpNumberOfCharsWritten
hConsoleOutput : [intptr] コンソールスクリーンバッファへのハンドル。ハンドルは **GENERIC\_WRITE** アクセス権を持っていなければならない。詳細は [Console Buffer Security and Access Rights](console-buffer-security-and-access-rights.md) を参照。
cCharacter : [int] コンソールスクリーンバッファに書き込む文字。
nLength : [int] 文字を書き込む文字セル数。
dwWriteCoord : [var] 文字を書き込む最初のセルの文字座標を指定する [**COORD**](coord-str.md) 構造体。
lpNumberOfCharsWritten : [var] 実際にコンソールスクリーンバッファに書き込まれた文字数を受け取る変数へのポインタ。
%inst
指定された座標から始めて、指定された回数だけコンソールスクリーンバッファに文字を書き込む。

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
[**GetLastError**](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror)
を呼ぶ。

[備考]

書き込む文字数がコンソールスクリーンバッファ内の指定された行の終わりを越える場合、次の行に文字が書き込まれる。書き込む文字数がコンソールスクリーンバッファの終わりを越える場合、コンソールスクリーンバッファの終わりまで文字が書き込まれる。書き込まれた位置の属性値は変更されない。[!INCLUDE
[setting-codepage-mode-remarks](./includes/setting-codepage-mode-remarks.md)]
> [!TIP] > この API は推奨されず、特定の
**[仮想ターミナル](console-virtual-terminal-sequences.md)**
に対応する機能はない。表示可能なウィンドウの外側の領域を埋めることはサポートされず、ターミナルの履歴空間用に予約されている。表示可能な領域を新しいテキストや色で埋めるには、**[カーソルを移動](console-virtual-terminal-sequences.md#cursor-positioning)**
し、**[新しい属性を設定](console-virtual-terminal-sequences.md#text-formatting)**
して、その領域に必要なテキストを書き込み、必要に応じて埋める実行のために文字を繰り返す。矩形領域を埋めるには、追加のカーソル移動とそれに続くテキストの書き込みが必要となることがある。クライアントアプリケーションは画面上にあるものを自身のメモリ内で保持することが期待され、リモート状態を問い合わせることはできない。詳細は
**[classic console versus virtual terminal](classic-vs-vt.md)**
ドキュメントを参照。


%index
FindActCtxSectionGuid
FindActCtxSectionGuid 関数は、現在のアクティブ化コンテキスト内の特定の GUID に関する情報を取得し、ACTCTX_SECTION_KEYED_DATA 構造体を返す。
%group
Win32 kernel32
%prm
dwFlags, lpExtensionGuid, ulSectionId, lpGuidToFind, ReturnedData
dwFlags : [int] この関数の動作方法を決定するフラグ。現在は次のフラグのみ定義されている。
lpExtensionGuid : [var] 予約。null でなければならない。
ulSectionId : [int] 指定された GUID を検索するアクティブ化コンテキストのセクションの識別子。
lpGuidToFind : [var] 検索条件として使用する GUID へのポインタ。
ReturnedData : [var] 要求された GUID 情報が設定される ACTCTX_SECTION_KEYED_DATA 構造体へのポインタ。
%inst
FindActCtxSectionGuid 関数は、現在のアクティブ化コンテキスト内の特定の GUID
に関する情報を取得し、ACTCTX_SECTION_KEYED_DATA 構造体を返す。

[戻り値]
関数が成功した場合 TRUE を返す。それ以外の場合 FALSE を返す。この関数は GetLastError
を呼ぶことで取得できるエラーを設定する。例については Retrieving the Last-Error Code
を参照。エラーコードの完全な一覧は System Error Codes を参照。

[備考]
この関数は Side-by-side API 関数または COM
メソッドからのみ呼び出されるべきである。アプリケーションはこの関数を直接呼び出してはならない。


%index
FindActCtxSectionStringW
FindActCtxSectionString 関数は、現在のアクティブ化コンテキスト内の特定の文字列に関する情報を取得し、ACTCTX_SECTION_KEYED_DATA 構造体を返す。(Unicode)
%group
Win32 kernel32
%prm
dwFlags, lpExtensionGuid, ulSectionId, lpStringToFind, ReturnedData
dwFlags : [int] この関数の動作方法を決定するフラグ。現在は次のフラグのみ定義されている。
lpExtensionGuid : [var] 予約。null でなければならない。
ulSectionId : [int] 特定の文字列を検索するアクティブ化コンテキストの文字列セクションの識別子。
lpStringToFind : [wstr] 検索条件として使用する NULL 終端文字列へのポインタ。
ReturnedData : [var] 要求された文字列情報が設定される ACTCTX_SECTION_KEYED_DATA 構造体へのポインタ。
%inst
FindActCtxSectionString
関数は、現在のアクティブ化コンテキスト内の特定の文字列に関する情報を取得し、ACTCTX_SECTION_KEYED_DATA
構造体を返す。(Unicode)

[戻り値]
関数が成功した場合 TRUE を返す。それ以外の場合 FALSE を返す。この関数は GetLastError
を呼ぶことで取得できるエラーを設定する。例については Retrieving the Last-Error Code
を参照。エラーコードの完全な一覧は System Error Codes を参照。

[備考]
この関数は Side-by-side API 関数または COM
メソッドからのみ呼び出されるべきである。アプリケーションはこの関数を直接呼び出してはならない。
> [!NOTE] > winbase.h ヘッダは UNICODE プリプロセッサ定数の定義に基づき、この関数の ANSI 版または
Unicode 版を自動選択するエイリアスとして FindActCtxSectionString
を定義する。エンコーディング非依存のエイリアスとエンコーディング依存のコードを混在させると、コンパイルや実行時のエラーを引き起こす不整合が生じることがある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
FindAtomW
ローカルアトムテーブルから指定された文字列を検索し、その文字列に関連付けられたアトムを取得する。(Unicode)
%group
Win32 kernel32
%prm
lpString
lpString : [wstr] 型: LPCTSTR 検索する文字列。あるいは MAKEINTATOM マクロを使って変換した整数アトムを使用できる。詳細は Remarks を参照。
%inst
ローカルアトムテーブルから指定された文字列を検索し、その文字列に関連付けられたアトムを取得する。(Unicode)

[戻り値]
型: ATOM 関数が成功した場合、戻り値は指定された文字列に関連付けられたアトムである。関数が失敗した場合、戻り値は 0
となる。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
システムはアトムテーブル内の文字列の大文字小文字を保持するが、FindAtom
関数が実行する検索は大文字小文字を区別しない。lpString が MAKEINTATOM マクロで作成された場合、下位ワードは
0x0001 から 0xBFFF の範囲でなければならない。下位ワードがこの範囲にない場合、関数は失敗する。
> [!NOTE] > winbase.h ヘッダは UNICODE プリプロセッサ定数の定義に基づき、この関数の ANSI 版または
Unicode 版を自動選択するエイリアスとして FindAtom
を定義する。エンコーディング非依存のエイリアスとエンコーディング依存のコードを混在させると、コンパイルや実行時のエラーを引き起こす不整合が生じることがある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


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
FindCloseChangeNotification
変更通知ハンドルの監視を停止する。
%group
Win32 kernel32
%prm
hChangeHandle
hChangeHandle : [intptr] FindFirstChangeNotification 関数で作成された変更通知ハンドルへのハンドル。
%inst
変更通知ハンドルの監視を停止する。

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
FindCloseChangeNotification 関数を呼び出した後、hChangeHandle パラメータで指定されたハンドルは
FindNextChangeNotification や FindCloseChangeNotification
関数の以降の呼び出しで使用できなくなる。変更通知は待機関数でも使用できる。Windows 8 および Windows Server
2012 では、この関数は次の技術でサポートされる。
（以下省略）


%index
FindFirstChangeNotificationW
変更通知ハンドルを作成し、初期の変更通知フィルタ条件を設定する。(Unicode)
%group
Win32 kernel32
%prm
lpPathName, bWatchSubtree, dwNotifyFilter
lpPathName : [wstr] 監視するディレクトリのフルパス。
bWatchSubtree : [int] このパラメータが TRUE の場合、関数は指定されたディレクトリをルートとするディレクトリツリーを監視する。FALSE の場合、指定されたディレクトリのみを監視する。
dwNotifyFilter : [int] 
%inst
変更通知ハンドルを作成し、初期の変更通知フィルタ条件を設定する。(Unicode)

[戻り値]
関数が成功した場合、戻り値は変更通知オブジェクトの検索ハンドルである。関数が失敗した場合、戻り値は
INVALID_HANDLE_VALUE となる。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
待機関数は FindFirstChangeNotification
関数が返したハンドルを使って指定されたディレクトリやサブツリーを監視できる。監視対象のディレクトリやサブツリーでフィルタ条件のいずれかが発生すると待機が満たされる。待機が満たされた後、アプリケーションはこの状態に応答し、FindNextChangeNotification
関数と適切な待機関数を呼び出してディレクトリの監視を継続できる。ハンドルが不要になったら、FindCloseChangeNotification
関数を使って閉じることができる。リモートファイルシステムに対して FindFirstChangeNotification
を呼び出した場合、通知が返されないことがある。シンボリックリンクの動作:
パスがシンボリックリンクを指す場合、通知ハンドルはターゲットに対して作成される。アプリケーションがシンボリックリンクを含むディレクトリの変更通知を受け取るように登録した場合、ターゲットファイルではなくシンボリックリンク自体が変更されたときにのみ通知される。Windows
8 および Windows Server 2012 では、この関数は次の技術でサポートされる。
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
FindFirstFileExW
指定された名前と属性に一致するファイルまたはサブディレクトリをディレクトリから検索する。(FindFirstFileExW)
%group
Win32 kernel32
%prm
lpFileName, fInfoLevelId, lpFindFileData, fSearchOp, lpSearchFilter, dwAdditionalFlags
lpFileName : [wstr] ディレクトリまたはパスとファイル名。ファイル名にはワイルドカード文字（たとえばアスタリスク (*) や疑問符 (?)）を含めることができる。このパラメータは NULL、無効な文字列（たとえば空文字列や終端 NULL 文字を欠いた文字列）、または末尾のバックスラッシュ (\\) で終わる文字列であってはならない。文字列がワイルドカード、ピリオド、またはディレクトリ名で終わる場合、ユーザーはルートとパス上のすべてのサブディレクトリにアクセスできる必要がある。この関数の ANSI 版では名前は MAX_PATH 文字までに制限される。この制限を約 32,000 ワイド文字まで拡張するには、関数の Unicode 版 (FindFirstFileExW) を呼び出してパスの先頭に "\\\\?\\" を付加する。詳細は Naming a File を参照。ヒント: Windows 10 バージョン 1607 以降、この関数の Unicode 版 (FindFirstFileExW) では、"\\?\" を付けずに MAX_PATH 文字制限を取り除くオプトインができる。詳細は Naming Files, Paths, and Namespaces の "Maximum Path Limitation" セクションを参照。
fInfoLevelId : [int] 返されるデータの情報レベル。
lpFindFileData : [intptr] ファイルデータを受け取るバッファへのポインタ。
fSearchOp : [int] ワイルドカードマッチング以外で実行するフィルタリングの種類。
lpSearchFilter : [intptr] 指定された fSearchOp が構造化された検索情報を必要とする場合の検索条件へのポインタ。
dwAdditionalFlags : [int] 検索を制御する追加フラグを指定する。
%inst
指定された名前と属性に一致するファイルまたはサブディレクトリをディレクトリから検索する。(FindFirstFileExW)

[戻り値]
関数が成功した場合、戻り値は FindNextFile または FindClose
の以降の呼び出しで使用される検索ハンドルであり、lpFindFileData
パラメータには見つかった最初のファイルまたはディレクトリに関する情報が含まれる。関数が失敗するか、lpFileName
パラメータの検索文字列からファイルを見つけられない場合、戻り値は INVALID_HANDLE_VALUE
となり、lpFindFileData の内容は不定となる。拡張エラー情報を取得するには GetLastError 関数を呼ぶ。

[備考]
FindFirstFileEx
関数は検索ハンドルを開き、指定されたパターンに一致する名前を持つ最初のファイルに関する情報をファイルシステムが見つけたものとして返す。これは、同じファイル名文字列パターンが与えられたときに
dir コマンドのようなディレクトリ列挙アプリケーションに表示される最初のファイルやディレクトリと一致する場合もしないこともある。これは
FindFirstFileEx が検索結果のソートを行わないためである。詳細は FindNextFile
を参照。次のリストはその他の検索特性を示す。
（以下省略）


%index
FindFirstFileNameW
指定されたファイルへのすべてのハードリンクの列挙を作成する。FindFirstFileNameW 関数は以降の FindNextFileNameW 関数の呼び出しで使用できる列挙へのハンドルを返す。
%group
Win32 kernel32
%prm
lpFileName, dwFlags, StringLength, LinkName
lpFileName : [wstr] ファイル名。ヒント: Windows 10 バージョン 1607 以降、"\\?\" を付けずに MAX_PATH 制限を取り除くオプトインができる。詳細は Naming Files, Paths, and Namespaces の "Maximum Path Length Limitation" セクションを参照。
dwFlags : [int] 予約。0 を指定する。
StringLength : [var] LinkName パラメータが指すバッファのサイズ（文字数）。この呼び出しが失敗し GetLastError 関数から返されるエラーが ERROR_MORE_DATA (234) の場合、このパラメータが返す値は LinkName が指すバッファがすべてのデータを含むのに必要なサイズである。
LinkName : [wstr] lpFileName について見つかった最初のリンク名を格納するバッファへのポインタ。
%inst
指定されたファイルへのすべてのハードリンクの列挙を作成する。FindFirstFileNameW 関数は以降の
FindNextFileNameW 関数の呼び出しで使用できる列挙へのハンドルを返す。

[戻り値]
関数が成功した場合、戻り値は FindNextFileNameW 関数で使用または FindClose
関数で閉じられる検索ハンドルである。関数が失敗した場合、戻り値は INVALID_HANDLE_VALUE (0xffffffff)
となる。拡張エラー情報を取得するには GetLastError 関数を呼ぶ。

[備考]
Windows 8 および Windows Server 2012 では、この関数は次の技術でサポートされる。
（以下省略）


%index
FindFirstFileNameTransactedW
指定されたファイルへのすべてのハードリンクの列挙をトランザクション操作として作成する。関数は以降の FindNextFileNameW 関数の呼び出しで使用できる列挙へのハンドルを返す。
%group
Win32 kernel32
%prm
lpFileName, dwFlags, StringLength, LinkName, hTransaction
lpFileName : [wstr] ファイル名。ファイルはローカルコンピュータ上に存在しなければならない。そうでない場合、関数は失敗し最後のエラーコードは ERROR_TRANSACTIONS_UNSUPPORTED_REMOTE (6805) に設定される。
dwFlags : [int] 予約。0 を指定する。
StringLength : [var] LinkName パラメータが指すバッファのサイズ（文字数）。この呼び出しが失敗しエラーが ERROR_MORE_DATA (234) の場合、このパラメータが返す値は LinkName が指すバッファがすべてのデータを含むのに必要なサイズである。
LinkName : [wstr] lpFileName について見つかった最初のリンク名を格納するバッファへのポインタ。
hTransaction : [intptr] トランザクションへのハンドル。このハンドルは CreateTransaction 関数が返す。
%inst
指定されたファイルへのすべてのハードリンクの列挙をトランザクション操作として作成する。関数は以降の FindNextFileNameW
関数の呼び出しで使用できる列挙へのハンドルを返す。

[戻り値]
関数が成功した場合、戻り値は FindNextFileNameW 関数で使用または FindClose
関数で閉じられる検索ハンドルである。関数が失敗した場合、戻り値は INVALID_HANDLE_VALUE (0xffffffff)
となる。拡張エラー情報を取得するには GetLastError 関数を呼ぶ。

[備考]
Windows 8 および Windows Server 2012 では、この関数は次の技術でサポートされる。
（以下省略）


%index
FindFirstFileTransactedW
指定された名前に一致するファイルまたはサブディレクトリをディレクトリから検索する処理をトランザクション操作として実行する。(Unicode)
%group
Win32 kernel32
%prm
lpFileName, fInfoLevelId, lpFindFileData, fSearchOp, lpSearchFilter, dwAdditionalFlags, hTransaction
lpFileName : [wstr] ディレクトリまたはパスとファイル名。ファイル名にはワイルドカード文字（たとえばアスタリスク (*) や疑問符 (?)）を含めることができる。このパラメータは NULL、無効な文字列（たとえば空文字列や終端 NULL 文字を欠いた文字列）、または末尾のバックスラッシュ (\\) で終わる文字列であってはならない。文字列がワイルドカード、ピリオド (.)、またはディレクトリ名で終わる場合、ユーザーはルートとパス上のすべてのサブディレクトリにアクセスできる必要がある。この関数の ANSI 版では名前は MAX_PATH 文字までに制限される。この制限を 32,767 ワイド文字まで拡張するには、関数の Unicode 版を呼び出してパスの先頭に "\\?\" を付加する。詳細は Naming a File を参照。ファイルはローカルコンピュータ上に存在しなければならない。そうでない場合、関数は失敗し最後のエラーコードは ERROR_TRANSACTIONS_UNSUPPORTED_REMOTE に設定される。
fInfoLevelId : [int] 返されるデータの情報レベル。
lpFindFileData : [intptr] 見つかったファイルやサブディレクトリに関する情報を受け取る WIN32_FIND_DATA 構造体へのポインタ。
fSearchOp : [int] ワイルドカードマッチング以外で実行するフィルタリングの種類。
lpSearchFilter : [intptr] 指定された fSearchOp が構造化された検索情報を必要とする場合の検索条件へのポインタ。
dwAdditionalFlags : [int] 検索を制御する追加フラグを指定する。
hTransaction : [intptr] トランザクションへのハンドル。このハンドルは CreateTransaction 関数が返す。
%inst

指定された名前に一致するファイルまたはサブディレクトリをディレクトリから検索する処理をトランザクション操作として実行する。(Unicode)

[戻り値]
関数が成功した場合、戻り値は FindNextFile または FindClose
の以降の呼び出しで使用される検索ハンドルであり、lpFindFileData
パラメータには見つかった最初のファイルまたはディレクトリに関する情報が含まれる。関数が失敗するか、lpFileName
パラメータの検索文字列からファイルを見つけられない場合、戻り値は INVALID_HANDLE_VALUE
となり、lpFindFileData の内容は不定となる。拡張エラー情報を取得するには GetLastError 関数を呼ぶ。

[備考]
FindFirstFileTransacted
関数は検索ハンドルを開き、指定されたパターンに一致する名前を持つ最初のファイルに関する情報をファイルシステムが見つけたものとして返す。これは、同じファイル名文字列パターンが与えられたときに
dir コマンドのようなディレクトリ列挙アプリケーションに表示される最初のファイルやディレクトリと一致する場合もしないこともある。これは
FindFirstFileTransacted が検索結果のソートを行わないためである。詳細は FindNextFile
を参照。次のリストはその他の検索特性を示す。
（以下省略）


%index
FindFirstStreamTransactedW
指定されたファイルやディレクトリ内の最初のストリームをトランザクション操作として列挙する。
%group
Win32 kernel32
%prm
lpFileName, InfoLevel, lpFindStreamData, dwFlags, hTransaction
lpFileName : [wstr] 完全修飾ファイル名。ファイルはローカルコンピュータ上に存在しなければならない。そうでない場合、関数は失敗し最後のエラーコードは ERROR_TRANSACTIONS_UNSUPPORTED_REMOTE (6805) に設定される。
InfoLevel : [int] 返されるデータの情報レベル。このパラメータは STREAM_INFO_LEVELS 列挙型の値の 1 つである。
lpFindStreamData : [intptr] ファイルデータを受け取るバッファへのポインタ。このデータの形式は InfoLevel パラメータの値に依存する。
dwFlags : [int] 将来の使用のために予約。このパラメータは 0 でなければならない。
hTransaction : [intptr] トランザクションへのハンドル。このハンドルは CreateTransaction 関数が返す。
%inst
指定されたファイルやディレクトリ内の最初のストリームをトランザクション操作として列挙する。

[戻り値]
関数が成功した場合、戻り値は FindNextStreamW
関数の以降の呼び出しで使用できる検索ハンドルである。関数が失敗した場合、戻り値は INVALID_HANDLE_VALUE
となる。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
すべてのファイルにはデフォルトのデータストリームがある。NTFS では、ファイルは 1
つ以上の名前付きデータストリームを持つこともできる。FAT
ファイルシステムでは、ファイルはデフォルトのデータストリーム以外を持つことができないため、この関数は FAT
ファイルシステムのファイルに対して使用しても有効な結果を返さない。この関数はハードリンクをサポートするすべてのファイルシステムで動作する。それ以外の場合、関数は
ERROR_STATUS_NOT_IMPLEMENTED (6805) を返す。FindFirstStreamTransactedW
関数は検索ハンドルを開き、指定されたファイルやディレクトリ内の最初のストリームに関する情報を返す。ファイルの場合、これは常にデフォルトデータストリーム
::$DATA となる。検索ハンドルが確立されたら、FindNextStreamW
関数で指定されたファイルやディレクトリ内の他のストリームを検索するために使用する。検索ハンドルが不要になったら、FindClose
関数を使って閉じる必要がある。Windows 8 および Windows Server 2012
では、この関数は次の技術でサポートされる。
（以下省略）


%index
FindFirstVolumeW
コンピュータ上のボリュームの名前を取得する。(FindFirstVolumeW)
%group
Win32 kernel32
%prm
lpszVolumeName, cchBufferLength
lpszVolumeName : [wstr] 見つかった最初のボリュームのボリューム GUID パスを指定する NULL 終端文字列を受け取るバッファへのポインタ。
cchBufferLength : [int] ボリューム GUID パスを受け取るバッファの長さ（TCHAR 単位）。
%inst
コンピュータ上のボリュームの名前を取得する。(FindFirstVolumeW)

[戻り値]
関数が成功した場合、戻り値は FindNextVolume および FindVolumeClose
関数の以降の呼び出しで使用される検索ハンドルである。ボリュームが見つからない場合、戻り値は INVALID_HANDLE_VALUE
エラーコードとなる。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
FindFirstVolume
関数は、ボリューム検索ハンドルを開き、コンピュータ上で見つかった最初のボリュームに関する情報を返す。検索ハンドルが確立されたら、FindNextVolume
関数を使って他のボリュームを検索できる。検索ハンドルが不要になったら、FindVolumeClose
関数を使って閉じる。これらの関数が返すボリュームの順序とコンピュータ上のボリュームの順序との間に相関があると想定してはならない。特に、ボリューム順序と
BIOS（存在する場合）または Disk Administrator
によって割り当てられたドライブ文字との間に相関があると想定してはならない。Windows 8 および Windows Server
2012 では、この関数は次の技術でサポートされる。
（以下省略）


%index
FindFirstVolumeMountPointW
指定されたボリューム上のマウントフォルダの名前を取得する。(Unicode)
%group
Win32 kernel32
%prm
lpszRootPathName, lpszVolumeMountPoint, cchBufferLength
lpszRootPathName : [wstr] マウントフォルダをスキャンするボリュームのボリューム GUID パス。末尾のバックスラッシュが必要。
lpszVolumeMountPoint : [wstr] 見つかった最初のマウントフォルダの名前を受け取るバッファへのポインタ。
cchBufferLength : [int] マウントフォルダへのパスを受け取るバッファの長さ（TCHAR 単位）。
%inst
指定されたボリューム上のマウントフォルダの名前を取得する。(Unicode)

[戻り値]
関数が成功した場合、戻り値は FindNextVolumeMountPoint および FindVolumeMountPointClose
関数の以降の呼び出しで使用される検索ハンドルである。ボリューム上にマウントフォルダが見つからない場合、戻り値は
INVALID_HANDLE_VALUE エラーコードとなる。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
FindFirstVolumeMountPoint
関数は、マウントフォルダ検索ハンドルを開き、指定されたボリューム上で見つかった最初のマウントフォルダに関する情報を返す。検索ハンドルが確立されたら、FindNextVolumeMountPoint
関数を使って他のマウントフォルダを検索できる。検索ハンドルが不要になったら、FindVolumeMountPointClose
関数を使って閉じる。FindFirstVolumeMountPoint、FindNextVolumeMountPoint、FindVolumeMountPointClose
関数は、指定されたボリュームのマウントフォルダへのパスを返す。これらはドライブ文字やボリューム GUID
パスを返さない。ボリュームのボリューム GUID パスを列挙する方法については Enumerating Volume GUID Paths
を参照。これらの関数が返すマウントフォルダの順序と、他の関数やツールが返すマウントフォルダの順序との間に相関があると想定してはならない。Windows
8 および Windows Server 2012 では、この関数は次の技術でサポートされる。
（以下省略）


%index
FindNLSString
識別子で指定されたロケールに対して、Unicode 文字列（ワイド文字）またはその等価物を別の Unicode 文字列内で検索する。注意: 非常に異なるバイナリ表現を持つ文字列が同一として比較される可能性があるため、この関数は特定のセキュリティ上の懸念を引き起こすことがある。詳細は Security Considerations:_International Features 内の比較関数の説明を参照。注: 相互運用性の観点から、Microsoft は新しいロケールにロケール識別子の代わりにロケール名を使用する方向に移行しているため、アプリケーションは FindNLSStringEx 関数を優先すべきである。FindNLSString はカスタムロケールをサポートするが、ほとんどのアプリケーションはこの種のサポートに FindNLSStringEx を使うべきである。
%group
Win32 kernel32
%prm
Locale, dwFindNLSStringFlags, lpStringSource, cchSource, lpStringValue, cchValue, pcchFound
Locale : [int] ロケールを指定するロケール識別子。MAKELCID マクロを使って識別子を作成するか、以下の定義済み値のいずれかを使用できる。
dwFindNLSStringFlags : [int] 検索操作の詳細を指定するフラグ。詳細な定義は FindNLSStringEx の dwFindNLSStringFlags パラメータを参照。
lpStringSource : [wstr] lpStringValue で指定された文字列を関数が検索する対象のソース文字列へのポインタ。
cchSource : [int] lpStringSource が指す文字列のサイズ（終端 NULL 文字を除く文字数）。アプリケーションはこのパラメータに 0 や -1 以外の負の数を指定できない。ソース文字列が NULL 終端で関数がサイズを自動計算すべき場合、アプリケーションは -1 を指定する。
lpStringValue : [wstr] 関数がソース文字列内で検索する検索文字列へのポインタ。
cchValue : [int] lpStringValue が指す文字列のサイズ（終端 NULL 文字を除く文字数）。アプリケーションはこのパラメータに 0 や -1 以外の負の数を指定できない。検索文字列が NULL 終端で関数がサイズを自動計算すべき場合、アプリケーションは -1 を指定する。
pcchFound : [var] 関数が見つけた文字列の長さを含むバッファへのポインタ。詳細は FindNLSStringEx の pcchFound パラメータを参照。
%inst
識別子で指定されたロケールに対して、Unicode 文字列（ワイド文字）またはその等価物を別の Unicode 文字列内で検索する。注意:
非常に異なるバイナリ表現を持つ文字列が同一として比較される可能性があるため、この関数は特定のセキュリティ上の懸念を引き起こすことがある。詳細は
Security Considerations:_International Features 内の比較関数の説明を参照。注:
相互運用性の観点から、Microsoft
は新しいロケールにロケール識別子の代わりにロケール名を使用する方向に移行しているため、アプリケーションは FindNLSStringEx
関数を優先すべきである。FindNLSString はカスタムロケールをサポートするが、ほとんどのアプリケーションはこの種のサポートに
FindNLSStringEx を使うべきである。

[戻り値]
成功した場合、lpStringSource が示すソース文字列内の 0 ベースのインデックスを返す。pcchFound
の値と組み合わせて、このインデックスはソース文字列内の見つかった文字列全体の正確な位置を提供する。戻り値 0
はソース文字列内のエラーフリーなインデックスであり、一致した文字列はソース文字列のオフセット 0 にある。関数が成功しなかった場合、-1
を返す。拡張エラー情報を取得するには、アプリケーションは GetLastError
を呼ぶことができ、次のいずれかのエラーコードを返すことがある。
（以下省略）

[備考]
FindNLSStringEx の Remarks を参照。


%index
FindNLSStringEx
名前で指定されたロケールに対して、Unicode 文字列（ワイド文字）またはその等価物を別の Unicode 文字列内で検索する。注意: 非常に異なるバイナリ表現を持つ文字列が同一として比較される可能性があるため、この関数は特定のセキュリティ上の懸念を引き起こすことがある。詳細は Security Considerations:_International Features 内の比較関数の説明を参照。
%group
Win32 kernel32
%prm
lpLocaleName, dwFindNLSStringFlags, lpStringSource, cchSource, lpStringValue, cchValue, pcchFound, lpVersionInformation, lpReserved, sortHandle
lpLocaleName : [wstr] ロケール名へのポインタ、または以下の定義済み値のいずれか。
dwFindNLSStringFlags : [int] 検索操作の詳細を指定するフラグ。これらのフラグは互いに排他的で、FIND_FROMSTART がデフォルトである。アプリケーションは、次の表で定義されているフィルタリングフラグのいずれかと共に検索フラグの 1 つだけを指定できる。アプリケーションがフラグを指定しない場合、関数は指定されたロケールのデフォルト比較を使用する。Handling Sorting in Your Applications で説明されているように、バイナリ比較モードはない。
lpStringSource : [wstr] lpStringValue で指定された文字列を関数が検索する対象のソース文字列へのポインタ。
cchSource : [int] lpStringSource が指す文字列のサイズ（終端 NULL 文字を除く文字数）。アプリケーションはこのパラメータに 0 や -1 以外の負の数を指定できない。ソース文字列が NULL 終端で関数がサイズを自動計算すべき場合、アプリケーションは -1 を指定する。
lpStringValue : [wstr] 関数がソース文字列内で検索する検索文字列へのポインタ。
cchValue : [int] lpStringValue が指す文字列のサイズ（終端 NULL 文字を除く文字数）。アプリケーションはこのパラメータに 0 や -1 以外の負の数を指定できない。検索文字列が NULL 終端で関数がサイズを自動計算すべき場合、アプリケーションは -1 を指定する。
pcchFound : [var] 関数が見つけた文字列の長さを含むバッファへのポインタ。文字列は検索文字列より長くも短くもなりうる。関数が検索文字列を見つけられなかった場合、このパラメータは変更されない。関数はこのパラメータに NULL を取得することができる。この場合、関数は見つかった文字列の長さがソース文字列の長さと異なるかどうかを示さない。pcchFound の値はしばしば cchValue で提供された値と同じだが、次の場合に異なることがある。
lpVersionInformation : [var] 予約。NULL でなければならない。
lpReserved : [intptr] 予約。NULL でなければならない。
sortHandle : [intptr] 予約。0 でなければならない。
%inst
名前で指定されたロケールに対して、Unicode 文字列（ワイド文字）またはその等価物を別の Unicode 文字列内で検索する。注意:
非常に異なるバイナリ表現を持つ文字列が同一として比較される可能性があるため、この関数は特定のセキュリティ上の懸念を引き起こすことがある。詳細は
Security Considerations:_International Features 内の比較関数の説明を参照。

[戻り値]
成功した場合、lpStringSource が示すソース文字列内の 0 ベースのインデックスを返す。pcchFound
の値と組み合わせて、このインデックスはソース文字列内の見つかった文字列全体の正確な位置を提供する。戻り値 0
はソース文字列内のエラーフリーなインデックスであり、一致した文字列はソース文字列のオフセット 0 にある。関数が成功しなかった場合、-1
を返す。拡張エラー情報を取得するには、アプリケーションは GetLastError
を呼ぶことができ、次のいずれかのエラーコードを返すことがある。
（以下省略）

[備考]

この関数は検索方向、文字等価フィルタリング、ロケール固有のフィルタリングを含むさまざまな検索オプションを提供する。等価性は関数の呼び出しで指定されたロケールとフラグに依存する。フィルタリングフラグは検索結果を変更することがある。たとえば、関数が大文字小文字や発音記号を無視して検索を実行する場合、潜在的な一致が増える。デフォルトでは、Locale
パラメータが Turkish (Turkey) や Azerbaijani (Azerbaijan)
を指定している場合でも、この関数は小文字 "i" を大文字 "I" にマップする。Turkish や Azerbaijani
でこの動作を上書きするには、アプリケーションは NORM_LINGUISTIC_CASING
を指定すべきである。このフラグを正しいロケールで指定すると、"?"（小文字ドットレス I）は "I"（大文字ドットレス
I）の小文字形となり、"i"（小文字ドット I）は "?"（大文字ドット I）の小文字形となる。
多くのスクリプト（特にラテン文字スクリプト）では、NORM_IGNORENONSPACE は
LINGUISTIC_IGNOREDIACRITIC と一致し、NORM_IGNORECASE は
LINGUISTIC_IGNORECASE と一致するが、次の例外がある。
（以下省略）


%index
FindNextChangeNotification
オペレーティングシステムが次に適切な変更を検出したときに変更通知ハンドルにシグナルするように要求する。
%group
Win32 kernel32
%prm
hChangeHandle
hChangeHandle : [intptr] FindFirstChangeNotification 関数で作成された変更通知ハンドルへのハンドル。
%inst
オペレーティングシステムが次に適切な変更を検出したときに変更通知ハンドルにシグナルするように要求する。

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
FindNextChangeNotification
関数が正常に戻った後、アプリケーションは待機関数を使って変更が発生したことを待つことができる。FindFirstChangeNotification
の呼び出し後、FindNextChangeNotification
の呼び出し前に変更が発生した場合、オペレーティングシステムは変更を記録する。FindNextChangeNotification
が実行されると、記録された変更は即座に変更通知の待機を満たす。**FindNextChangeNotification**
の各成功した呼び出しの後には、待機関数の 1
つの呼び出しが続かなければならない。待機関数が変更通知ハンドルがシグナルされた以外の理由（たとえば待機がタイムアウトした場合など）で戻った場合、アプリケーションは待機を再試行しなければならない。この規則に従わないと、システムが最終的にリソース不足になる可能性がある。また、アプリケーションが一部の変更通知を見逃す可能性もある。hChangeHandle
が不要になったら、FindCloseChangeNotification 関数を使って閉じる。Windows 8 および Windows
Server 2012 では、この関数は次の技術でサポートされる。
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
FindNextFileNameW
FindFirstFileNameW 関数の成功した呼び出しが返したハンドルを使ってファイルへのハードリンクの列挙を続行する。
%group
Win32 kernel32
%prm
hFindStream, StringLength, LinkName
hFindStream : [intptr] FindFirstFileNameW の成功した呼び出しが返した列挙へのハンドル。
StringLength : [var] LinkName パラメータのサイズ（文字数）。この呼び出しが失敗しエラーが ERROR_MORE_DATA の場合、このパラメータが返す値は LinkName がすべてのデータを含むのに必要なサイズである。
LinkName : [wstr] lpFileName について見つかった最初のリンク名を格納するバッファへのポインタ。
%inst
FindFirstFileNameW 関数の成功した呼び出しが返したハンドルを使ってファイルへのハードリンクの列挙を続行する。

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼ぶ。一致するファイルが見つからない場合、GetLastError 関数は ERROR_HANDLE_EOF
を返す。

[備考]
関数が TRUE を返した場合、列挙すべきハードリンクがさらに存在する。Windows 8 および Windows Server 2012
では、この関数は次の技術でサポートされる。
（以下省略）


%index
FindNextVolumeW
FindFirstVolume 関数の呼び出しによって開始されたボリューム検索を続行する。(FindNextVolumeW)
%group
Win32 kernel32
%prm
hFindVolume, lpszVolumeName, cchBufferLength
hFindVolume : [intptr] FindFirstVolume 関数の以前の呼び出しが返したボリューム検索ハンドル。
lpszVolumeName : [wstr] 見つかったボリューム GUID パスを受け取る文字列へのポインタ。
cchBufferLength : [int] ボリューム GUID パスを受け取るバッファの長さ（TCHAR 単位）。
%inst
FindFirstVolume 関数の呼び出しによって開始されたボリューム検索を続行する。(FindNextVolumeW)

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼ぶ。一致するファイルが見つからない場合、GetLastError 関数は
ERROR_NO_MORE_FILES エラーコードを返す。その場合、FindVolumeClose 関数で検索を閉じる。

[備考]
FindFirstVolume を呼び出して検索ハンドルが確立されたら、FindNextVolume
関数を使って他のボリュームを検索できる。これらの関数が返すボリュームの順序とコンピュータ上のボリュームの順序との間に相関があると想定してはならない。特に、ボリューム順序と
BIOS（存在する場合）または Disk Administrator
によって割り当てられたドライブ文字との間に相関があると想定してはならない。Windows 8 および Windows Server
2012 では、この関数は次の技術でサポートされる。
（以下省略）


%index
FindNextVolumeMountPointW
FindFirstVolumeMountPoint 関数の呼び出しによって開始されたマウントフォルダ検索を続行する。(Unicode)
%group
Win32 kernel32
%prm
hFindVolumeMountPoint, lpszVolumeMountPoint, cchBufferLength
hFindVolumeMountPoint : [intptr] FindFirstVolumeMountPoint 関数の以前の呼び出しが返したマウントフォルダ検索ハンドル。
lpszVolumeMountPoint : [wstr] 見つかったマウントフォルダの名前を受け取るバッファへのポインタ。
cchBufferLength : [int] マウントフォルダ名を受け取るバッファの長さ（TCHAR 単位）。
%inst
FindFirstVolumeMountPoint 関数の呼び出しによって開始されたマウントフォルダ検索を続行する。(Unicode)

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼ぶ。これ以上マウントフォルダが見つからない場合、GetLastError 関数は
ERROR_NO_MORE_FILES エラーコードを返す。その場合、FindVolumeMountPointClose
関数で検索を閉じる。

[備考]
FindFirstVolumeMountPoint
を呼び出して検索ハンドルが確立されたら、FindNextVolumeMountPoint
関数を使って他のマウントフォルダを検索できる。FindFirstVolumeMountPoint、FindNextVolumeMountPoint、FindVolumeMountPointClose
関数は指定されたボリュームのマウントフォルダへのパスを返す。これらはドライブ文字やボリューム GUID
パスを返さない。ボリュームのボリューム GUID パスを列挙する方法については Enumerating Volume GUID Paths
を参照。これらの関数が返すマウントフォルダの順序と、他の関数やツールが返すマウントフォルダの順序との間に相関があると想定してはならない。Windows
8 および Windows Server 2012 では、この関数は次の技術でサポートされる。
（以下省略）


%index
FindResourceW
指定されたモジュール内で、指定された種類と名前のリソースの位置を決定する。(FindResourceW)
%group
Win32 kernel32
%prm
hModule, lpName, lpType
hModule : [intptr] 型: HMODULE リソースを含む PE ファイルまたは付随する MUI ファイルを持つモジュールへのハンドル。このパラメータが NULL の場合、関数は現在のプロセスを作成するために使用したモジュールを検索する。
lpName : [wstr] 型: LPCTSTR リソースの名前。あるいは、ポインタの代わりに MAKEINTRESOURCE(ID) を指定できる。ID はリソースの整数識別子。詳細は以下の Remarks セクションを参照。
lpType : [wstr] 型: LPCTSTR リソースの種類。あるいは、ポインタの代わりに MAKEINTRESOURCE(ID) を指定できる。ID は指定されたリソース種別の整数識別子。標準リソース種別については Resource Types を参照。詳細は以下の Remarks セクションを参照。
%inst
指定されたモジュール内で、指定された種類と名前のリソースの位置を決定する。(FindResourceW)

[戻り値]
型: HRSRC
関数が成功した場合、戻り値は指定されたリソースの情報ブロックへのハンドルである。リソースへのハンドルを取得するには、このハンドルを
LoadResource 関数に渡す。関数が失敗した場合、戻り値は NULL である。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
x = lpName または lpType について IS_INTRESOURCE が TRUE の場合、x
は指定されたリソースの名前または種類の整数識別子を指定する。それ以外の場合、これらのパラメータは NULL
終端文字列へのロングポインタである。文字列の最初の文字がポンド記号 (#)
の場合、残りの文字はリソースの名前または種類の整数識別子を指定する 10 進数を表す。たとえば、文字列 "#258" は整数識別子 258
を表す。リソースに必要なメモリ量を減らすために、アプリケーションは名前ではなく整数識別子でリソースを参照すべきである。アプリケーションは
FindResource を使って任意の種類のリソースを見つけることができるが、この関数はアプリケーションが LoadResource
とその後の LockResource
の呼び出しを行うことでバイナリリソースデータにアクセスする必要がある場合にのみ使用すべきである。リソースを即座に使用するには、アプリケーションは次のリソース固有の関数の
1 つを使用してリソースを見つけ、データをより使いやすい形式に変換すべきである。
（以下省略）


%index
FindResourceExW
指定されたモジュール内で、指定された種類、名前、言語のリソースの位置を決定する。(FindResourceExW)
%group
Win32 kernel32
%prm
hModule, lpType, lpName, wLanguage
hModule : [intptr] 型: HMODULE リソースを含む PE ファイルまたは付随する MUI ファイルを持つモジュールへのハンドル。このパラメータが NULL の場合、関数は現在のプロセスを作成するために使用したモジュールを検索する。
lpType : [wstr] 型: LPCTSTR リソースの種類。あるいは、ポインタの代わりに MAKEINTRESOURCE(ID) を指定できる。ID は指定されたリソース種別の整数識別子。標準リソース種別については Resource Types を参照。詳細は以下の Remarks セクションを参照。
lpName : [wstr] 型: LPCTSTR リソースの名前。あるいは、ポインタの代わりに MAKEINTRESOURCE(ID) を指定できる。ID はリソースの整数識別子。詳細は以下の Remarks セクションを参照。
wLanguage : [int] 型: WORD リソースの言語。このパラメータが MAKELANGID(LANG_NEUTRAL, SUBLANG_NEUTRAL) の場合、呼び出し側スレッドに関連付けられた現在の言語が使用される。現在の言語以外の言語を指定するには、このパラメータを作成するために MAKELANGID マクロを使用する。詳細は MAKELANGID を参照。
%inst
指定されたモジュール内で、指定された種類、名前、言語のリソースの位置を決定する。(FindResourceExW)

[戻り値]
型: HRSRC
関数が成功した場合、戻り値は指定されたリソースの情報ブロックへのハンドルである。リソースへのハンドルを取得するには、このハンドルを
LoadResource 関数に渡す。関数が失敗した場合、戻り値は NULL である。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
x = lpType または lpName について IS_INTRESOURCE が TRUE の場合、x
は指定されたリソースの種類または名前の整数識別子を指定する。それ以外の場合、これらのパラメータは NULL
終端文字列へのロングポインタである。文字列の最初の文字がポンド記号 (#)
の場合、残りの文字はリソースの名前または種類の整数識別子を指定する 10 進数を表す。たとえば、文字列 "#258" は整数識別子 258
を表す。リソースに必要なメモリ量を減らすために、アプリケーションは名前ではなく整数識別子でリソースを参照すべきである。アプリケーションは
FindResourceEx を使って任意の種類のリソースを見つけることができるが、この関数はアプリケーションが LoadResource
とその後の LockResource
の呼び出しを行うことでバイナリリソースデータにアクセスする必要がある場合にのみ使用すべきである。リソースを即座に使用するには、アプリケーションは次のリソース固有の関数の
1 つを使用してリソースを見つけ、データをより使いやすい形式に変換すべきである。
（以下省略）


%index
FindStringOrdinal
非言語的な比較のために Unicode 文字列（ワイド文字）を別の Unicode 文字列内で検索する。
%group
Win32 kernel32
%prm
dwFindStringOrdinalFlags, lpStringSource, cchSource, lpStringValue, cchValue, bIgnoreCase
dwFindStringOrdinalFlags : [int] 検索操作の詳細を指定するフラグ。これらのフラグは互いに排他的で、FIND_FROMSTART がデフォルトである。アプリケーションは検索フラグの 1 つだけを指定できる。
lpStringSource : [wstr] lpStringValue で指定された文字列を関数が検索する対象のソース文字列へのポインタ。
cchSource : [int] lpStringSource が指す文字列のサイズ（終端 NULL 文字を除く文字数）。アプリケーションは通常、正の数または 0 を指定する必要がある。ソース文字列が NULL 終端で関数がサイズを自動計算すべき場合、アプリケーションは -1 を指定できる。
lpStringValue : [wstr] 関数がソース文字列内で検索する検索文字列へのポインタ。
cchValue : [int] lpStringValue が指す文字列のサイズ（終端 NULL 文字を除く文字数）。アプリケーションは通常、正の数または 0 を指定する必要がある。文字列が NULL 終端で関数がサイズを自動計算すべき場合、アプリケーションは -1 を指定できる。
bIgnoreCase : [int] 関数が大文字小文字を区別しない比較を実行する場合は TRUE、それ以外の場合は FALSE。比較は言語的な操作ではなく、すべてのロケールや言語に適しているわけではない。動作は英語に対するものと類似している。
%inst
非言語的な比較のために Unicode 文字列（ワイド文字）を別の Unicode 文字列内で検索する。

[戻り値]
成功した場合、lpStringSource が示すソース文字列内の 0 ベースのインデックスを返す。関数が成功した場合、見つかった文字列は
lpStringValue の値と同じサイズである。戻り値 0
は、関数がソース文字列の先頭で一致を見つけたことを示す。関数が成功しなかったり検索文字列が見つからなかった場合、-1
を返す。拡張エラー情報を取得するには、アプリケーションは GetLastError
を呼ぶことができ、次のいずれかのエラーコードを返すことがある。
（以下省略）

[備考]
FindStringOrdinal
はバイナリ比較を提供するため、言語的に適切な結果を返さない。順序比較は英語のソート動作と誤認されることがある。ただし、文字が言語的に重要でない量だけ異なる場合に一致を見つけない。適切なソート関数の選択については
Sorting を参照。失敗時に 0 を返す NLS 関数とは対照的に、この関数は失敗した場合 -1 を返す。成功した場合、0
ベースのインデックスを返す。このインデックスを使用すると、関数は off-by-one エラーや 1
文字バッファオーバーランを避けられる。この関数は、成功した場合でも SetLastError を呼び出す数少ない NLS 関数の 1
つである。検索文字列に一致しなかった場合に、スレッド内の最後のエラーをクリアするためにこの呼び出しを行う。これは GetLastError
によって返される値をクリアする。Windows 8 以降: FindStringOrdinal は Libloaderapi.h
で宣言されている。Windows 8 より前では Winnls.h で宣言されていた。


%index
FindVolumeClose
指定されたボリューム検索ハンドルを閉じる。
%group
Win32 kernel32
%prm
hFindVolume
hFindVolume : [intptr] 閉じるボリューム検索ハンドル。このハンドルは以前に FindFirstVolume 関数によって開かれていなければならない。
%inst
指定されたボリューム検索ハンドルを閉じる。

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
FindVolumeClose 関数を呼び出した後、ハンドル hFindVolume は FindNextVolume または
FindVolumeClose の以降の呼び出しで使用できなくなる。Windows 8 および Windows Server 2012
では、この関数は次の技術でサポートされる。
（以下省略）


%index
FindVolumeMountPointClose
指定されたマウントフォルダ検索ハンドルを閉じる。
%group
Win32 kernel32
%prm
hFindVolumeMountPoint
hFindVolumeMountPoint : [intptr] 閉じるマウントフォルダ検索ハンドル。このハンドルは以前に FindFirstVolumeMountPoint 関数によって開かれていなければならない。
%inst
指定されたマウントフォルダ検索ハンドルを閉じる。

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
FindVolumeMountPointClose 関数を呼び出した後、ハンドル hFindVolumeMountPoint は
FindNextVolumeMountPoint または FindVolumeMountPointClose
の以降の呼び出しで使用できなくなる。FindFirstVolumeMountPoint、FindNextVolumeMountPoint、FindVolumeMountPointClose
関数は指定されたボリュームのマウントフォルダへのパスを返す。これらはドライブ文字やボリューム GUID
パスを返さない。ボリュームのボリューム GUID パスを列挙する方法については Enumerating Volume GUID Paths
を参照。Windows 8 および Windows Server 2012 では、この関数は次の技術でサポートされる。
（以下省略）


%index
FlsAlloc
ファイバローカルストレージ (FLS) インデックスを割り当てる。
%group
Win32 kernel32
%prm
lpCallback
lpCallback : [int] PFLS_CALLBACK_FUNCTION 型のアプリケーション定義のコールバック関数へのポインタ。このパラメータはオプションである。詳細は FlsCallback を参照。
%inst
ファイバローカルストレージ (FLS) インデックスを割り当てる。

[戻り値]
関数が成功した場合、戻り値は 0 で初期化された FLS インデックスである。関数が失敗した場合、戻り値は
FLS_OUT_OF_INDEXES となる。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
プロセスのファイバは、以降の FlsFree、FlsSetValue、または FlsGetValue 関数の呼び出しで FLS
インデックスを使用できる。FLS インデックスは通常、プロセスや DLL の初期化中に割り当てられる。FLS
インデックスが割り当てられた後、プロセスの各ファイバは自身の FLS ストレージスロットへのアクセスにそれを使用できる。FLS
スロットに値を格納するには、ファイバは FlsSetValue
の呼び出しでインデックスを指定する。ファイバは格納された値を取得するために以降の FlsGetValue
の呼び出しで同じインデックスを指定する。FLS インデックスはプロセス境界を越えて有効ではない。DLL
は、あるプロセスで割り当てられたインデックスが別のプロセスで有効であると想定してはならない。


%index
FlsFree
ファイバローカルストレージ (FLS) インデックスを解放し、再利用可能にする。
%group
Win32 kernel32
%prm
dwFlsIndex
dwFlsIndex : [int] FlsAlloc 関数によって割り当てられた FLS インデックス。
%inst
ファイバローカルストレージ (FLS) インデックスを解放し、再利用可能にする。

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
FLS インデックスを解放すると、現在のプロセス内のすべての FLS インスタンスのインデックスが解放される。FLS
インデックスを解放すると、対応する FLS スロットが NULL
でない値を含む場合、各ファイバに対して関連するコールバックルーチンも呼ばれる。プロセスのファイバがメモリを割り当て、メモリへのポインタを
FLS スロットに格納している場合、FlsFree を呼ぶ前にメモリを解放すべきである。FlsFree 関数は、アドレスが FLS
インデックスに関連付けられた FLS スロットに格納されているメモリブロックを解放しない。DLL
がこの関数を呼ぶ場合、DLL_PROCESS_DETACH のときのみに呼び出すことが期待される。


%index
FlsGetValue
指定された FLS インデックスについて呼び出し側ファイバのファイバローカルストレージ (FLS) スロットの値を取得する。各ファイバは各 FLS インデックスについて独自のスロットを持つ。
%group
Win32 kernel32
%prm
dwFlsIndex
dwFlsIndex : [int] FlsAlloc 関数によって割り当てられた FLS インデックス。
%inst
指定された FLS インデックスについて呼び出し側ファイバのファイバローカルストレージ (FLS) スロットの値を取得する。各ファイバは各
FLS インデックスについて独自のスロットを持つ。

[戻り値]
関数が成功した場合、戻り値は指定されたインデックスに関連付けられた呼び出し側ファイバの FLS
スロットに格納されている値である。関数が失敗した場合、戻り値は NULL である。拡張エラー情報を取得するには GetLastError
を呼ぶ。

[備考]
FLS インデックスは通常、プロセスや DLL の初期化中に FlsAlloc 関数によって割り当てられる。FLS
インデックスが割り当てられた後、プロセスの各ファイバはそのインデックスに対する自身の FLS
スロットへのアクセスにそれを使用できる。ファイバは FlsSetValue の呼び出しで FLS
インデックスを指定して自身のスロットに値を格納する。スレッドは格納された値を取得するために以降の FlsSetValue
の呼び出しで同じインデックスを指定する。


%index
FlsSetValue
指定された FLS インデックスについて呼び出し側ファイバのファイバローカルストレージ (FLS) スロットに値を格納する。各ファイバは各 FLS インデックスについて独自のスロットを持つ。
%group
Win32 kernel32
%prm
dwFlsIndex, lpFlsData
dwFlsIndex : [int] FlsAlloc 関数によって割り当てられた FLS インデックス。
lpFlsData : [intptr] 呼び出し側ファイバの FLS スロットに格納する値。
%inst
指定された FLS インデックスについて呼び出し側ファイバのファイバローカルストレージ (FLS) スロットに値を格納する。各ファイバは各
FLS インデックスについて独自のスロットを持つ。

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼ぶ。次のエラーが返ることがある。
（以下省略）

[備考]
FLS インデックスは通常、プロセスや DLL の初期化中に FlsAlloc 関数によって割り当てられる。FLS
インデックスが割り当てられた後、プロセスの各ファイバはそのインデックスに対する自身の FLS
スロットへのアクセスにそれを使用できる。スレッドは FlsSetValue の呼び出しで FLS
インデックスを指定して自身のスロットに値を格納する。スレッドは格納された値を取得するために以降の FlsGetValue
の呼び出しで同じインデックスを指定する。


%index
FlushConsoleInputBuffer
コンソール入力バッファをフラッシュする。入力バッファに現在ある入力レコードはすべて破棄される。
%group
Win32 kernel32
%prm
hConsoleInput
hConsoleInput : [intptr] コンソール入力バッファへのハンドル。ハンドルは **GENERIC\_WRITE** アクセス権を持っていなければならない。詳細は [Console Buffer Security and Access Rights](console-buffer-security-and-access-rights.md) を参照。
%inst
コンソール入力バッファをフラッシュする。入力バッファに現在ある入力レコードはすべて破棄される。

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
[**GetLastError**](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror)
を呼ぶ。

[備考]
> [!TIP] > この API
は推奨されず、**[仮想ターミナル](console-virtual-terminal-sequences.md)**
に対応する機能はない。入力キューを一度に空にしようとすると、予期しない方法でキュー内の状態が破棄される可能性がある。


%index
FlushFileBuffers
指定されたファイルのバッファをフラッシュし、すべてのバッファ済みデータをファイルに書き込ませる。
%group
Win32 kernel32
%prm
hFile
hFile : [intptr] 開かれているファイルへのハンドル。ファイルハンドルは GENERIC_WRITE アクセス権を持っていなければならない。詳細は File Security and Access Rights を参照。hFile が通信デバイスへのハンドルの場合、関数は送信バッファのみをフラッシュする。hFile が名前付きパイプのサーバー側へのハンドルの場合、関数はクライアントがパイプからすべてのバッファ済みデータを読み取るまで戻らない。
%inst
指定されたファイルのバッファをフラッシュし、すべてのバッファ済みデータをファイルに書き込ませる。

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼ぶ。hFile
がコンソール出力へのハンドルの場合、関数は失敗する。これはコンソール出力がバッファされないためである。関数は FALSE
を返し、GetLastError は ERROR_INVALID_HANDLE を返す。

[備考]
通常、WriteFile および WriteFileEx
関数は内部バッファにデータを書き込み、オペレーティングシステムが定期的にディスクや通信パイプに書き込む。FlushFileBuffers
関数は、指定されたファイルのすべてのバッファ済み情報をデバイスやパイプに書き込む。システム内のディスクキャッシュ相互作用により、多くの書き込みが個別に実行されている場合、ディスクドライブデバイスへの各書き込みの後で
FlushFileBuffers
関数を使うのは非効率である可能性がある。アプリケーションがディスクへの複数の書き込みを実行し、重要なデータが永続メディアに書き込まれることも保証する必要がある場合、頻繁に
FlushFileBuffers を呼び出すのではなくバッファなし I/O を使用すべきである。バッファなし I/O
用にファイルを開くには、FILE_FLAG_NO_BUFFERING および FILE_FLAG_WRITE_THROUGH
フラグを使って CreateFile
関数を呼ぶ。これにより、ファイルの内容がキャッシュされず、各書き込みごとにメタデータがディスクにフラッシュされる。詳細は
CreateFile を参照。ボリューム上のすべての開かれているファイルをフラッシュするには、ボリュームへのハンドルで
FlushFileBuffers を呼び出す。呼び出し側は管理者特権を持っていなければならない。詳細は Running with
Special Privileges を参照。CreateFile でボリュームを開くとき、lpFileName 文字列は \\.\x:
または \\?\Volume{GUID}
の形式でなければならない。末尾のバックスラッシュはドライブのルートディレクトリを示すため使用してはならない。Windows 8 および
Windows Server 2012 では、この関数は次の技術でサポートされる。
（以下省略）


%index
FlushInstructionCache
指定されたプロセスの命令キャッシュをフラッシュする。
%group
Win32 kernel32
%prm
hProcess, lpBaseAddress, dwSize
hProcess : [intptr] 命令キャッシュをフラッシュするプロセスへのハンドル。
lpBaseAddress : [intptr] フラッシュする領域のベースへのポインタ。このパラメータは NULL でもよい。
dwSize : [int] lpBaseAddress パラメータが NULL でない場合、フラッシュする領域のサイズ（バイト数）。
%inst
指定されたプロセスの命令キャッシュをフラッシュする。

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
アプリケーションは、メモリ内でコードを生成または変更した場合 FlushInstructionCache を呼ぶべきである。CPU
は変更を検出できず、キャッシュした古いコードを実行する可能性がある。


%index
FlushViewOfFile
ファイルのマップされたビュー内のバイト範囲をディスクに書き込む。
%group
Win32 kernel32
%prm
lpBaseAddress, dwNumberOfBytesToFlush
lpBaseAddress : [intptr] マップされたファイルのディスク表現にフラッシュするバイト範囲のベースアドレスへのポインタ。
dwNumberOfBytesToFlush : [int] フラッシュするバイト数。dwNumberOfBytesToFlush が 0 の場合、ファイルはベースアドレスからマッピングの末尾までフラッシュされる。
%inst
ファイルのマップされたビュー内のバイト範囲をディスクに書き込む。

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]

マップされたビューの範囲をフラッシュすると、その範囲内のダーティページのディスクへの書き込みが開始される。ダーティページとは、ファイルビューがマップされてから内容が変更されたページである。FlushViewOfFile
関数はファイルメタデータをフラッシュせず、変更が基となるハードウェアディスクキャッシュからフラッシュされ物理的にディスクに書き込まれるまで待たずに戻る。すべてのダーティページとファイルのメタデータをフラッシュし、それらが物理的にディスクに書き込まれることを保証するには、FlushViewOfFile
を呼び出した後に FlushFileBuffers
関数を呼ぶ。ネットワーク経由でメモリマップトファイルをフラッシュするとき、FlushViewOfFile
はデータがローカルコンピュータから書き込まれたことを保証するが、データがリモートコンピュータ上に存在することは保証しない。サーバーはリモート側でデータをキャッシュすることがある。したがって、FlushViewOfFile
はデータが物理的にディスクに書き込まれる前に戻ることがある。マップされたビューを通じてファイルを変更する際、最終変更タイムスタンプが自動的に更新されないことがある。必要であれば、呼び出し側は
SetFileTime を使ってタイムスタンプを設定すべきである。Windows Server 2012
では、この関数は次の技術でサポートされる。
（以下省略）


%index
FoldStringW
ある Unicode 文字列を別の Unicode 文字列にマップし、指定された変換を実行する。(FoldStringW)
%group
Win32 kernel32
%prm
dwMapFlags, lpSrcStr, cchSrc, lpDestStr, cchDest
dwMapFlags : [int] 
lpSrcStr : [wstr] 関数がマップするソース文字列へのポインタ。
cchSrc : [int] lpSrcStr が指すソース文字列のサイズ（終端 NULL 文字を除く文字数）。アプリケーションは、ソース文字列が NULL 終端であることを指定するために、このパラメータに任意の負の値を設定できる。この場合、関数は文字列の長さを自動的に計算し、lpDestStr が指すマップされた文字列を NULL 終端にする。
lpDestStr : [wstr] この関数がマップされた文字列を取得するバッファへのポインタ。
cchDest : [int] lpDestStr が指す宛先文字列のサイズ（文字数）。終端 NULL 文字の領域が cchSrc に含まれている場合、cchDest にも終端 NULL 文字の領域を含めなければならない。アプリケーションは cchDest を 0 に設定できる。この場合、関数は lpDestStr パラメータを使用せず、マップされた文字列に必要なバッファサイズを返す。MAP_FOLDDIGITS フラグが指定されている場合、戻り値は実際に必要な文字数が最大サイズより小さくても、必要な最大サイズである。最大サイズが渡されない場合、関数は ERROR_INSUFFICIENT_BUFFER で失敗する。
%inst
ある Unicode 文字列を別の Unicode 文字列にマップし、指定された変換を実行する。(FoldStringW)

[戻り値]
成功した場合、終端 NULL 文字を含む変換後の文字列内の文字数を返す。関数が成功し cchDest の値が 0 の場合、戻り値は終端
NULL 文字を含む変換後の文字列を保持するために必要なバッファのサイズである。この関数は成功しなかった場合 0
を返す。拡張エラー情報を取得するには、アプリケーションは GetLastError
を呼ぶことができ、次のいずれかのエラーコードを返すことがある。
（以下省略）

[備考]
lpSrcStr と lpDestStr パラメータの値は同じであってはならない。同じ場合、関数は
ERROR_INVALID_PARAMETER で失敗する。Unicode
内の互換性ゾーンは、文字用の他のエンコーディング標準からの文字に割り当てられているが、実際には既に Unicode
内の文字のバリアントである 0xF900 から 0xFFEF
の範囲の文字で構成される。互換性ゾーンはこれらの標準への往復マッピングをサポートするために使用される。アプリケーションは
MAP_FOLDCZONE フラグを使うことで、互換性ゾーン内の文字の重複をサポートしないようにできる。Windows Vista 以降:
この関数は Unicode 正規化をサポートする。すべての Unicode 互換性文字がマップされる。Windows Vista 以降:
MAP_FOLDCZONE、MAP_PRECOMPOSED、MAP_COMPOSITE フラグで示される変換は、マッピングを行うために
Unicode 正規化形式 KC、C、D（NormalizeString 関数を通じて）を使用する。Windows 8 以降: この関数の
ANSI 版は Winnls.h で宣言され、Unicode 版は Stringapiset.h で宣言されている。Windows 8
より前は、両方の版が Winnls.h で宣言されていた。


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
FreeConsole
呼び出し側プロセスを自身のコンソールからデタッチする FreeConsole 関数の参照情報を参照。
%group
Win32 kernel32
%prm

%inst
呼び出し側プロセスを自身のコンソールからデタッチする FreeConsole 関数の参照情報を参照。

[戻り値]
この関数にはパラメータがない。
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
[**GetLastError**](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror)
を呼ぶ。

[備考]
プロセスは多くて 1 つのコンソールにアタッチできる。プロセスは **FreeConsole**
関数を使って自身をコンソールからデタッチできる。他のプロセスがコンソールを共有している場合、コンソールは破棄されないが、**FreeConsole**
を呼び出したプロセスはそれを参照できなくなる。コンソールにアタッチされている最後のプロセスが終了するか **FreeConsole**
を呼び出すと、コンソールは閉じられる。プロセスが **FreeConsole** を呼び出した後、新しいコンソールを作成するために
[**AllocConsole**](allocconsole.md) 関数を呼び出すか、別のコンソールにアタッチするために
[**AttachConsole**](attachconsole.md)
を呼び出すことができる。呼び出し側プロセスがまだコンソールにアタッチされていない場合でも、**FreeConsole**
リクエストは成功する。


%index
FreeEnvironmentStringsW
環境文字列のブロックを解放する。(Unicode)
%group
Win32 kernel32
%prm
penv
penv : [int] 環境文字列ブロックへのポインタ。ブロックへのポインタは GetEnvironmentStrings 関数を呼び出すことで取得しなければならない。
%inst
環境文字列のブロックを解放する。(Unicode)

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
GetEnvironmentStrings の ANSI 版を使用した場合、必ず FreeEnvironmentStrings の
ANSI 版を使用すること。同様に、GetEnvironmentStrings の Unicode 版を使用した場合、必ず
FreeEnvironmentStrings の Unicode 版を使用すること。


%index
FreeLibraryAndExitThread
ロードされた DLL の参照カウントを 1 減らし、ExitThread を呼んで呼び出し側スレッドを終了する。
%group
Win32 kernel32
%prm
hLibModule, dwExitCode
hLibModule : [intptr] 関数が参照カウントを減らす DLL モジュールへのハンドル。LoadLibrary または GetModuleHandleEx 関数がこのハンドルを返す。GetModuleHandleEx 関数（GET_MODULE_HANDLE_EX_FLAG_UNCHANGED_REFCOUNT フラグ付き）または GetModuleHandle 関数が返したハンドルでこの関数を呼び出してはならない。これらはモジュールの参照カウントを保持しないためである。
dwExitCode : [int] 呼び出し側スレッドの終了コード。
%inst
ロードされた DLL の参照カウントを 1 減らし、ExitThread を呼んで呼び出し側スレッドを終了する。

[備考]
FreeLibraryAndExitThread 関数により、DLL 内で実行中のスレッドは、実行中の DLL
を安全に解放して自身を終了できる。FreeLibrary と ExitThread
を別々に呼ぶと、競合状態が存在する。ExitThread が呼ばれる前にライブラリがアンロードされる可能性がある。


%index
FreeMemoryJobObject
ジョブオブジェクト関連の関数が割り当てたメモリを解放する。メモリを割り当てるジョブオブジェクト関連の関数には QueryIoRateControlInformationJobObject などがある。
%group
Win32 kernel32
%prm
Buffer
Buffer : [intptr] 解放したい割り当て済みメモリのバッファへのポインタ。
%inst
ジョブオブジェクト関連の関数が割り当てたメモリを解放する。メモリを割り当てるジョブオブジェクト関連の関数には
QueryIoRateControlInformationJobObject などがある。


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
FreeResource
ロードされたリソースの参照カウントを 1 減らす。参照カウントが 0 になると、リソースが占有していたメモリが解放される。
%group
Win32 kernel32
%prm
hResData
hResData : [int] 型: HGLOBAL リソースのハンドル。hglbResource は LoadResource によって作成されたものとする。
%inst
ロードされたリソースの参照カウントを 1 減らす。参照カウントが 0 になると、リソースが占有していたメモリが解放される。

[戻り値]
型: BOOL 関数が成功した場合、戻り値は 0 となる。関数が失敗した場合、戻り値は 0
以外であり、リソースが解放されていないことを示す。

[備考]
他の関数でロードされたリソースについて、FreeResource は次の関数で置き換えられている。
（以下省略）


%index
FreeUserPhysicalPages
AllocateUserPhysicalPages または AllocateUserPhysicalPagesNuma を使って以前に割り当てられた物理メモリページを解放する。
%group
Win32 kernel32
%prm
hProcess, NumberOfPages, PageArray
hProcess : [intptr] プロセスへのハンドル。関数はこのプロセスの仮想アドレス空間内のメモリを解放する。
NumberOfPages : [var] 解放する物理メモリのサイズ（ページ単位）。戻り時に関数が失敗した場合、このパラメータは解放されたページ数を示す。
PageArray : [var] 解放する割り当て済みメモリのページフレーム番号の配列へのポインタ。
%inst
AllocateUserPhysicalPages または AllocateUserPhysicalPagesNuma
を使って以前に割り当てられた物理メモリページを解放する。

[戻り値]
関数が成功した場合、戻り値は TRUE である。関数が失敗した場合、戻り値は FALSE である。この場合、NumberOfPages
パラメータは実際に解放されたページ数を反映する。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]

マルチプロセッサ環境では、この関数はハードウェア変換バッファのコヒーレンスを維持する。この関数が戻ると、すべてのプロセッサ上のすべてのスレッドが正しいマッピングを見ることが保証される。この関数を使うアプリケーションをコンパイルするには、_WIN32_WINNT
マクロを 0x0500 以降として定義する。詳細は Using the Windows Headers を参照。


%index
GenerateConsoleCtrlEvent
呼び出し側プロセスに関連付けられたコンソールを共有するプロセスに、指定されたシグナルを送信する。
%group
Win32 kernel32
%prm
dwCtrlEvent, dwProcessGroupId
dwCtrlEvent : [int] 生成するシグナルの種類。このパラメータには次の値の 1 つを指定できる。| 値 | 意味 | |-|-| | **CTRL_C_EVENT** 0 | CTRL+C シグナルを生成する。このシグナルを特定のプロセスグループに限定することはできない。*dwProcessGroupId* が 0 以外の場合、この関数は成功するが、指定されたプロセスグループ内のプロセスは CTRL+C シグナルを受け取らない。| | **CTRL_BREAK_EVENT** 1 | CTRL+BREAK シグナルを生成する。|
dwProcessGroupId : [int] シグナルを受け取るプロセスグループの識別子。プロセスグループは、[**CreateProcess**](/windows/win32/api/processthreadsapi/nf-processthreadsapi-createprocessa) 関数の呼び出しで **CREATE\_NEW\_PROCESS\_GROUP** フラグが指定されたときに作成される。新しいプロセスのプロセス識別子は、新しいプロセスグループのプロセスグループ識別子でもある。プロセスグループにはルートプロセスの子孫であるすべてのプロセスが含まれる。グループ内のプロセスのうち、呼び出し側プロセスと同じコンソールを共有するプロセスのみがシグナルを受け取る。言い換えると、グループ内のプロセスが新しいコンソールを作成すると、そのプロセスはシグナルを受け取らず、その子孫も受け取らない。このパラメータが 0 の場合、シグナルは呼び出し側プロセスのコンソールを共有するすべてのプロセスで生成される。
%inst
呼び出し側プロセスに関連付けられたコンソールを共有するプロセスに、指定されたシグナルを送信する。

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
[**GetLastError**](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror)
を呼ぶ。

[備考]
**GenerateConsoleCtrlEvent**
は、ターゲットグループ内のプロセスの制御ハンドラ関数を呼び出させる。すべてのコンソールプロセスは、[**ExitProcess**](/windows/win32/api/processthreadsapi/nf-processthreadsapi-exitprocess)
関数を呼び出すデフォルトのハンドラ関数を持つ。コンソールプロセスは
[**SetConsoleCtrlHandler**](setconsolectrlhandler.md)
関数を使って他のハンドラ関数をインストールしたり削除したりできる。[**SetConsoleCtrlHandler**](setconsolectrlhandler.md)
は、呼び出し側プロセスが CTRL+C
シグナルを無視させる継承可能な属性を有効にすることもできる。**GenerateConsoleCtrlEvent**
がこの属性が有効になっているプロセスに CTRL+C
シグナルを送信した場合、そのプロセスのハンドラ関数は呼び出されない。CTRL+BREAK シグナルは常にハンドラ関数を呼び出させる。


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
GetActiveProcessorCount
プロセッサグループ内またはシステム内のアクティブなプロセッサ数を返す。
%group
Win32 kernel32
%prm
GroupNumber
GroupNumber : [int] プロセッサグループ番号。このパラメータが ALL_PROCESSOR_GROUPS の場合、関数はシステム内のアクティブなプロセッサ数を返す。
%inst
プロセッサグループ内またはシステム内のアクティブなプロセッサ数を返す。

[戻り値]
関数が成功した場合、戻り値は指定されたグループ内のアクティブなプロセッサ数である。関数が失敗した場合、戻り値は 0
となる。拡張エラー情報を取得するには GetLastError を使用する。

[備考]
この関数を使うアプリケーションをコンパイルするには、_WIN32_WINNT >= 0x0601 を設定する。詳細は Using the
Windows Headers を参照。


%index
GetActiveProcessorGroupCount
システム内のアクティブなプロセッサグループ数を返す。
%group
Win32 kernel32
%prm

%inst
システム内のアクティブなプロセッサグループ数を返す。

[戻り値]
関数が成功した場合、戻り値はシステム内のアクティブなプロセッサグループ数である。関数が失敗した場合、戻り値は 0 となる。

[備考]
この関数を使うアプリケーションをコンパイルするには、_WIN32_WINNT >= 0x0601 を設定する。詳細は Using the
Windows Headers を参照。


%index
GetAppContainerAce
パッケージまたは機能 SID が存在するかを示す値を取得する。
%group
Win32 kernel32
%prm
Acl, StartingAceIndex, AppContainerAce, AppContainerAceIndex
Acl : [var] [ACL](/windows/desktop/api/winnt/ns-winnt-acl) 構造体へのポインタ。
StartingAceIndex : [int] 新しい ACE を追加する ACL の ACE リスト内の位置を指定する。値 0 はリストの先頭に ACE を挿入する。値 MAXDWORD はリストの末尾に ACE を追加する。
AppContainerAce : [var] AppContainerAce オブジェクトへのポインタ。
AppContainerAceIndex : [var] ACL の ACE リスト内の位置。
%inst
パッケージまたは機能 SID が存在するかを示す値を取得する。

[戻り値]
関数が成功した場合 **TRUE** を返す。関数が失敗した場合 **FALSE** を返す。拡張エラー情報を取得するには
[GetLastError](/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror)
を呼ぶ。**GetLastError** は WinError.h で定義されたエラーコードの 1 つを返すことがある。


%index
GetAppContainerNamedObjectPath
アプリコンテナの名前付きオブジェクトパスを取得する。
%group
Win32 kernel32
%prm
Token, AppContainerSid, ObjectPathLength, ObjectPath, ReturnLength
Token : [intptr] トークンに関するハンドル。NULL が渡され AppContainerSid パラメータも渡されない場合、呼び出し側の現在のプロセストークンが使用されるか、偽装中ならスレッドトークンが使用される。
AppContainerSid : [int] アプリコンテナの SID。
ObjectPathLength : [int] バッファの長さ。
ObjectPath : [wstr] 名前付きオブジェクトパスが設定されるバッファ。
ReturnLength : [var] 名前付きオブジェクトパスの長さに対応するために必要な長さを返す。
%inst
アプリコンテナの名前付きオブジェクトパスを取得する。

[戻り値]
関数が成功した場合、戻り値として TRUE が返る。関数が失敗した場合、FALSE が返る。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
Windows ストアアプリとデスクトップアプリの両方にまたがって動作し、Windows
ストアアプリのコンテキストで読み込まれる機能を持つ支援技術ツールでは、コンテキスト内の機能をツールと同期させる必要が生じることがある。一般的にこのような同期は、ユーザーセッション内に名前付きオブジェクトを確立することで実現される。Windows
ストアアプリは、既定ではユーザーセッションやグローバルセッションの名前付きオブジェクトに Windows
ストアアプリからアクセスできないため、この仕組みにとって課題となる。こうした落とし穴を避けるため、支援技術ツールは UI
Automation API または Magnification API
を使うように更新することを推奨する。それまでの間は、引き続き名前付きオブジェクトを使う必要があるかもしれない。


%index
GetApplicationRecoveryCallback
指定したプロセスに登録されているコールバックルーチンへのポインタを取得する。返されるアドレスはそのプロセスの仮想アドレス空間内のものである。
%group
Win32 kernel32
%prm
hProcess, pRecoveryCallback, ppvParameter, pdwPingInterval, pdwFlags
hProcess : [intptr] プロセスへのハンドル。このハンドルは PROCESS_VM_READ アクセス権を持っている必要がある。
pRecoveryCallback : [var] リカバリコールバック関数へのポインタ。詳細は ApplicationRecoveryCallback を参照。
ppvParameter : [var] コールバックパラメータへのポインタ。
pdwPingInterval : [var] リカバリ ping 間隔。100 ナノ秒単位で指定する。
pdwFlags : [var] 将来のために予約されている。
%inst

指定したプロセスに登録されているコールバックルーチンへのポインタを取得する。返されるアドレスはそのプロセスの仮想アドレス空間内のものである。

[戻り値]
関数が成功した場合は S_OK を返す。失敗した場合は次のいずれかのエラーコードを返す。
（以下省略）


%index
GetApplicationRestartSettings
指定したプロセスに登録されている再起動情報を取得する。
%group
Win32 kernel32
%prm
hProcess, pwzCommandline, pcchSize, pdwFlags
hProcess : [intptr] プロセスへのハンドル。このハンドルは PROCESS_VM_READ アクセス権を持っている必要がある。
pwzCommandline : [wstr] アプリケーションが RegisterApplicationRestart 関数を呼び出した際に指定した再起動用コマンドラインを受け取るバッファへのポインタ。コマンドラインの最大サイズは文字数で RESTART_MAX_CMD_LINE である。pcchSize が 0 の場合は NULL でもよい。
pcchSize : [var] 入力時には pwzCommandLine バッファのサイズを文字数で指定する。バッファがコマンドラインを受け取るのに十分大きくない場合、関数は HRESULT_FROM_WIN32(ERROR_INSUFFICIENT_BUFFER) で失敗し、必要なバッファサイズを文字数でこのパラメータに設定する。出力時には使用したバッファのサイズが設定される。必要なバッファサイズを判定するには、pwzCommandLine を NULL に、このパラメータを 0 に設定する。サイズには NULL 終端文字の分が 1 含まれる。この場合、関数は HRESULT_FROM_WIN32(ERROR_INSUFFICIENT_BUFFER) ではなく S_OK を返すことに注意。
pdwFlags : [var] アプリケーションが RegisterApplicationRestart 関数を呼び出した際に指定したフラグを受け取る変数へのポインタ。
%inst
指定したプロセスに登録されている再起動情報を取得する。

[戻り値]
関数が成功した場合は S_OK を返す。失敗した場合は次のいずれかのエラーコードを返す。
（以下省略）

[備考]

この情報は現在のプロセスでのみ取得可能であり、プログラムが再起動された後にこの関数を呼び出して再起動コマンドラインを取得することはできない。再起動後にコマンドラインを取得するには、main
関数の argv パラメータを利用する。


%index
GetAtomNameW
指定したローカルアトムに関連付けられた文字列のコピーを取得する。(Unicode)
%group
Win32 kernel32
%prm
nAtom, lpBuffer, nSize
nAtom : [int] 型: ATOM 取得対象の文字列を識別するローカルアトム。
lpBuffer : [wstr] 型: LPTSTR 文字列。
nSize : [int] 型: int バッファのサイズ。文字数で指定する。
%inst
指定したローカルアトムに関連付けられた文字列のコピーを取得する。(Unicode)

[戻り値]
型: UINT 関数が成功した場合、戻り値はバッファにコピーされた文字列の長さ（文字数）であり、終端 NULL
文字は含まない。関数が失敗した場合、戻り値は 0 である。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
整数アトム（値が 0x0001 ～ 0xBFFF
の範囲にあるアトム）に対して返される文字列は、最初の文字がシャープ記号（#）で、残りの文字が符号なし整数のアトム値を表す NULL
終端文字列である。セキュリティ上の考慮事項: この関数を誤用するとプログラムのセキュリティを損なう可能性がある。誤用には lpBuffer
パラメータのサイズを正しく指定しないことが含まれる。
> [!NOTE] > winbase.h ヘッダでは GetAtomName が、UNICODE
プリプロセッサ定数の定義に応じて自動的にこの関数の ANSI 版または Unicode
版を選択するエイリアスとして定義されている。エンコーディング中立のエイリアスをエンコーディング中立でないコードと混在させると、コンパイルエラーや実行時エラーにつながる不一致が発生する可能性がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
GetBinaryTypeW
ファイルが実行可能（.exe）ファイルかどうか、そうである場合にどのサブシステムが実行ファイルを実行するかを判定する。(Unicode)
%group
Win32 kernel32
%prm
lpApplicationName, lpBinaryType
lpApplicationName : [wstr] 実行ファイル種別を判定するファイルのフルパス。この関数の ANSI 版では、名前は MAX_PATH 文字に制限される。この上限を 32,767 ワイド文字まで拡張するには、Unicode 版を呼び出し、パスの先頭に "\\?\" を付ける。詳細は Naming a File を参照。
lpBinaryType : [var] lpApplicationName で指定したファイルの実行ファイル種別に関する情報を受け取る変数へのポインタ。次の定数が定義されている。
%inst
ファイルが実行可能（.exe）ファイルかどうか、そうである場合にどのサブシステムが実行ファイルを実行するかを判定する。(Unicode)

[戻り値]
ファイルが実行可能な場合、戻り値は 0 以外である。関数は lpBinaryType
が指す変数にファイルの実行ファイル種別を設定する。ファイルが実行可能でない場合、または関数が失敗した場合、戻り値は 0
である。拡張エラー情報を取得するには GetLastError を呼ぶ。ファイルが DLL の場合、最後のエラーコードは
ERROR_BAD_EXE_FORMAT になる。

[備考]
代替手段として、SHGetFileInfo 関数を呼び出し、uFlags パラメータに SHGFI_EXETYPE
フラグを渡すことで同じ情報を取得できる。シンボリックリンクの動作:
パスがシンボリックリンクを指している場合、ターゲットファイルが使用される。Windows 8 および Windows Server
2012 では、この関数は次の技術によりサポートされる。
（以下省略）


%index
GetCPInfo
インストール済みまたは利用可能な任意の有効なコードページに関する情報を取得する。(GetCPInfo)
%group
Win32 kernel32
%prm
CodePage, lpCPInfo
CodePage : [int] 情報を取得するコードページの識別子。詳細は GetCPInfoEx の CodePage パラメータを参照。
lpCPInfo : [var] コードページに関する情報を受け取る CPINFO 構造体へのポインタ。Remarks セクションを参照。
%inst
インストール済みまたは利用可能な任意の有効なコードページに関する情報を取得する。(GetCPInfo)

[戻り値]
成功した場合は 1 を、それ以外の場合は 0 を返す。拡張エラー情報を取得するには GetLastError
を呼ぶ。次のエラーコードが返ることがある。
（以下省略）

[備考]
GetCPInfoEx の Remarks を参照。


%index
GetCPInfoExW
インストール済みまたは利用可能な任意の有効なコードページに関する情報を取得する。(GetCPInfoExW)
%group
Win32 kernel32
%prm
CodePage, dwFlags, lpCPInfoEx
CodePage : [int] 情報を取得するコードページの識別子。アプリケーションは、インストール済みまたは利用可能な任意のコードページの識別子か、次の定義済み値のいずれかを指定できる。ANSI など各種コードページの識別子一覧は Code Page Identifiers を参照。
dwFlags : [int] 予約。0 を指定する必要がある。
lpCPInfoEx : [var] コードページに関する情報を受け取る CPINFOEX 構造体へのポインタ。
%inst
インストール済みまたは利用可能な任意の有効なコードページに関する情報を取得する。(GetCPInfoExW)

[戻り値]
成功した場合は 0 以外、それ以外の場合は 0 を返す。拡張エラー情報を取得するには GetLastError
を呼び出すことができ、次のエラーコードが返ることがある。
（以下省略）

[備考]
CPINFOEX
構造体に取得される情報は、すべてのコードページにとって常に有用とは限らない。たとえばバッファサイズを判定するには、アプリケーションは
MultiByteToWideChar または WideCharToMultiByte
を呼び出して正確なバッファサイズを要求するべきである。CPINFOEX
の設定が先行バイトの存在を示している場合でも、変換関数が先行バイトを必ずしも特別扱いするわけではなく、たとえば後続バイトが欠落していたり不正であったりする場合がある。
> [!NOTE] > winnls.h ヘッダでは GetCPInfoEx が、UNICODE プリプロセッサ定数の定義に応じて自動的に
ANSI 版または Unicode
版を選択するエイリアスとして定義されている。エンコーディング中立のエイリアスを中立でないコードと混在させるとコンパイルや実行時のエラーになる可能性がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
GetCachedSigningLevel
キャッシュされた署名レベルを取得する。
%group
Win32 kernel32
%prm
File, Flags, SigningLevel, Thumbprint, ThumbprintSize, ThumbprintAlgorithm
File : [intptr] ファイルへのハンドル。
Flags : [var] ファイルに設定されたフラグへのポインタ。次の *Flags* がサポートされる。 | フラグ | 値 | |--------|--------| | **SIGNING_LEVEL_FILE_CACHE_FLAG_NOT_VALIDATED** | `0x01` | | **SIGNING_LEVEL_FILE_CACHE_FLAG_VALIDATE_ONLY** | `0x04` | これらのフラグを組み合わせて使う（**SIGNING_LEVEL_FILE_CACHE_FLAG_NOT_VALIDATED \| SIGNING_LEVEL_FILE_CACHE_FLAG_VALIDATE_ONLY**）と、ファイルが検証済みであることを示す。
SigningLevel : [var] 署名レベルへのポインタ。
Thumbprint : [var] 拇印へのポインタ。
ThumbprintSize : [var] 拇印サイズへのポインタ。
ThumbprintAlgorithm : [var] 拇印アルゴリズムへのポインタ。
%inst
キャッシュされた署名レベルを取得する。

[戻り値]
関数が成功した場合は **TRUE** を返す。関数が失敗した場合は **FALSE** を返す。拡張エラー情報を取得するには
[GetLastError](/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror)
を呼ぶ。**GetLastError** は WinError.h で定義されているエラーコードのいずれかを返すことがある。


%index
GetCalendarDateFormatEx
非推奨。
%group
Win32 kernel32
%prm
lpszLocale, dwFlags, lpCalDateTime, lpFormat, lpDateStr, cchDate
lpszLocale : [wstr] ロケール名へのポインタ、または次の定義済み値のいずれか。 -   [LOCALE\_NAME\_INVARIANT](locale-name-constants.md) -   [LOCALE\_NAME\_SYSTEM\_DEFAULT](locale-name-constants.md) -   [LOCALE\_NAME\_USER\_DEFAULT](locale-name-constants.md)
dwFlags : [int] 日付フォーマットオプションを指定するフラグ。*lpFormat* が **NULL** でない場合、このパラメータは 0 を指定する必要がある。*lpFormat* が **NULL** の場合、アプリケーションは次の値と [LOCALE\_NOUSEROVERRIDE](locale-nouseroverride.md) との組み合わせを指定できる。
lpCalDateTime : [var] 整形対象の日付とカレンダー情報を含む [**CALDATETIME**](caldatetime.md) 構造体へのポインタ。
lpFormat : [wstr] 日付文字列を組み立てるために使われるフォーマットピクチャ文字列へのポインタ。フォーマットピクチャ文字列に指定可能な値は [Day, Month, Year, and Era Format Pictures](day--month--year--and-era-format-pictures.md) で定義されている。フォーマットピクチャ文字列は NULL 終端でなければならない。関数はフォーマットピクチャ文字列で指定されていない情報（たとえばロケールの曜日名や月名）にのみロケールを使う。指定したロケールの日付形式を使わせる場合、アプリケーションはこのパラメータを **NULL** に設定する。
lpDateStr : [wstr] 整形済み日付文字列をこの関数が受け取るバッファへのポインタ。
cchDate : [int] *lpDateStr* バッファのサイズを文字数で指定する。あるいは、アプリケーションはこのパラメータに 0 を設定することもできる。その場合、関数は整形済み日付文字列を保持するのに必要な文字数を返し、*lpDateStr* パラメータは使われない。
%inst
非推奨。

[戻り値]
成功した場合は *lpDateStr* バッファに書き込まれた文字数を返す。*cchDate* パラメータが 0
に設定されている場合、関数は終端 NULL 文字を含む整形済み日付文字列を保持するのに必要な文字数を返す。成功しなかった場合は 0
を返す。拡張エラー情報を取得するには GetLastError を呼び出すことができ、次のいずれかのエラーコードが返ることがある。 -
ERROR\_DATE\_OUT\_OF\_RANGE: 指定された日付が範囲外。 -
ERROR\_INSUFFICIENT\_BUFFER: 指定されたバッファサイズが十分でないか、誤って **NULL**
に設定されていた。 - ERROR\_INVALID\_FLAGS: フラグに指定された値が無効。 -
ERROR\_INVALID\_PARAMETER: いずれかのパラメータ値が無効。

[備考]
この関数がサポートする最も古い日付は 1601 年 1 月 1
日である。この関数には対応するヘッダファイルやライブラリファイルがない。アプリケーションは
[**LoadLibrary**](/windows/win32/api/libloaderapi/nf-libloaderapi-loadlibrarya)
を DLL 名（Kernel32.dll）で呼び出してモジュールハンドルを取得し、そのモジュールハンドルとこの関数名を
[**GetProcAddress**](/windows/win32/api/libloaderapi/nf-libloaderapi-getprocaddress)
に渡して関数アドレスを取得できる。


%index
GetCalendarInfoW
識別子で指定したロケールのカレンダーに関する情報を取得する。(Unicode)
%group
Win32 kernel32
%prm
Locale, Calendar, CalType, lpCalData, cchData, lpValue
Locale : [int] カレンダー情報を取得するロケールを指定するロケール識別子。MAKELCID マクロでロケール識別子を作成することも、次の定義済み値のいずれかを使うこともできる。
Calendar : [int] カレンダー識別子。
CalType : [int] 取得する情報の種類。詳細は Calendar Type Information を参照。注意: GetCalendarInfo は、このパラメータが CAL_IYEAROFFSETRANGE または CAL_SERASTRING を指定している場合、文字列を 1 つだけ返す。どちらの場合も現在の時代が返される。CAL_USE_CP_ACP はこの関数の ANSI 版でのみ意味を持つ。CAL_NOUSEROVERRIDE の場合、関数は SetCalendarInfo で設定された値を無視し、現在のシステム既定ロケールのデータベース設定を使う。この種類は CAL_NOUSEROVERRIDE | CAL_ITWODIGITYEARMAX の組み合わせでのみ意味を持つ。CAL_ITWODIGITYEARMAX は SetCalendarInfo で設定可能な唯一の値である。
lpCalData : [wstr] 要求されたデータを文字列としてこの関数が取得するバッファへのポインタ。CalType に CAL_RETURN_NUMBER が指定されている場合、このパラメータは NULL を取得する必要がある。
cchData : [int] lpCalData バッファのサイズを文字数で指定する。アプリケーションはこのパラメータを 0 に設定することで、カレンダーデータバッファに必要なサイズを取得できる。その場合、lpCalData パラメータは使われない。CalType に CAL_RETURN_NUMBER が指定されている場合、cchData の値は 0 でなければならない。
lpValue : [var] 要求されたデータを数値として受け取る変数へのポインタ。CalType に CAL_RETURN_NUMBER が指定されている場合、lpValue は NULL であってはならない。CalType に CAL_RETURN_NUMBER が指定されていない場合、lpValue は NULL でなければならない。
%inst
識別子で指定したロケールのカレンダーに関する情報を取得する。(Unicode)

[戻り値]
成功した場合、cchData が 0 以外の値に設定されているとき、lpCalData
バッファに取得された文字数を返す。関数が成功し、cchData が 0 に設定され、CAL_RETURN_NUMBER
が指定されていない場合、戻り値はカレンダー情報を保持するのに必要なバッファサイズである。関数が成功し、cchData が 0
に設定され、CAL_RETURN_NUMBER が指定されている場合、戻り値は lpValue に取得される値のサイズ、すなわち
Unicode 版では 2、ANSI 版では 4 である。成功しなかった場合は 0 を返す。拡張エラー情報を取得するには
GetLastError を呼び出すことができ、次のいずれかのエラーコードが返ることがある。
（以下省略）

[備考]
注意: この API は 2019 年 5
月の日本の改元に対応するために更新中である。アプリケーションが日本のカレンダーをサポートする場合、新しい時代を正しく扱えることを検証する必要がある。詳細は「日本の改元に向けてアプリケーションを準備する」を参照。この関数の
ANSI 版を Unicode 専用ロケール識別子と共に使った場合、OS
がシステムコードページを使うため呼び出しが成功することがある。ただし、システムコードページで未定義の文字は文字列中で疑問符（?）として表示される。
> [!NOTE] > winnls.h ヘッダでは GetCalendarInfo が、UNICODE
プリプロセッサ定数の定義に応じて自動的に ANSI 版または Unicode
版を選択するエイリアスとして定義されている。エンコーディング中立のエイリアスを中立でないコードと混在させるとコンパイルや実行時のエラーになる可能性がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
GetCalendarInfoEx
名前で指定したロケールのカレンダーに関する情報を取得する。注意: アプリケーションが Windows Vista 以降でのみ動作するように設計されている場合、GetCalendarInfo よりこの関数を優先して呼び出すべきである。注意: この関数はリリース間で変化し得るデータ（たとえばカスタムロケール由来のもの）を取得することがある。アプリケーションがデータを永続化または送信する必要がある場合は、Using Persistent Locale Data を参照。
%group
Win32 kernel32
%prm
lpLocaleName, Calendar, lpReserved, CalType, lpCalData, cchData, lpValue
lpLocaleName : [wstr] ロケール名、または次の定義済み値のいずれかへのポインタ。
Calendar : [int] カレンダー識別子。
lpReserved : [wstr] 予約。NULL を指定する必要がある。
CalType : [int] 取得する情報の種類。詳細は Calendar Type Information を参照。
lpCalData : [wstr] 要求されたデータを文字列としてこの関数が取得するバッファへのポインタ。CalType に CAL_RETURN_NUMBER が指定されている場合、このパラメータは NULL を取得する必要がある。
cchData : [int] lpCalData バッファのサイズを文字数で指定する。アプリケーションはこのパラメータを 0 に設定することで、カレンダーデータバッファに必要なサイズを取得できる。その場合、lpCalData パラメータは使われない。CalType に CAL_RETURN_NUMBER が指定されている場合、cchData の値は 0 でなければならない。
lpValue : [var] 要求されたデータを数値として受け取る変数へのポインタ。CalType に CAL_RETURN_NUMBER が指定されている場合、lpValue は NULL であってはならない。CalType に CAL_RETURN_NUMBER が指定されていない場合、lpValue は NULL でなければならない。
%inst
名前で指定したロケールのカレンダーに関する情報を取得する。注意: アプリケーションが Windows Vista
以降でのみ動作するように設計されている場合、GetCalendarInfo よりこの関数を優先して呼び出すべきである。注意:
この関数はリリース間で変化し得るデータ（たとえばカスタムロケール由来のもの）を取得することがある。アプリケーションがデータを永続化または送信する必要がある場合は、Using
Persistent Locale Data を参照。

[戻り値]
成功した場合、lpCalData バッファに取得された文字数を返す。関数が成功し、cchData が 0
に設定され、CAL_RETURN_NUMBER
が指定されていない場合、戻り値はロケール情報を保持するのに必要なバッファサイズである。関数が成功し、cchData が 0
に設定され、CAL_RETURN_NUMBER が指定されている場合、戻り値は lpValue
パラメータに書き込まれた値のサイズである。このサイズは常に 2 である。成功しなかった場合は 0 を返す。拡張エラー情報を取得するには
GetLastError を呼び出すことができ、次のいずれかのエラーコードが返ることがある。
（以下省略）

[備考]
注意: この API は 2019 年 5
月の日本の改元に対応するために更新中である。アプリケーションが日本のカレンダーをサポートする場合、新しい時代を正しく扱えることを検証する必要がある。詳細は「日本の改元に向けてアプリケーションを準備する」を参照。Windows
8 以降: アプリケーションが Windows.Globalization 名前空間の言語タグをこの関数に渡す場合、まず
ResolveLocaleName を呼び出してタグを変換する必要がある。


%index
GetCalendarSupportedDateRange
非推奨。指定したカレンダーでサポートされている日付範囲を取得する。
%group
Win32 kernel32
%prm
Calendar, lpCalMinDateTime, lpCalMaxDateTime
Calendar : [int] サポートされている日付範囲を取得する [Calendar identifier](calendar-identifiers.md)。
lpCalMinDateTime : [var] サポートされる最小日付を定義する [**CALDATETIME**](caldatetime.md) 構造体へのポインタ。
lpCalMaxDateTime : [var] サポートされる最大日付を定義する [**CALDATETIME**](caldatetime.md) 構造体へのポインタ。
%inst
非推奨。指定したカレンダーでサポートされている日付範囲を取得する。

[戻り値]
成功した場合は **TRUE**、それ以外の場合は **FALSE** を返す。拡張エラー情報を取得するには
[**GetLastError**](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror)
を呼び出すことができ、次のエラーコードが返ることがある。 - ERROR\_INVALID\_PARAMETER:
いずれかのパラメータ値が無効。

[備考]
この関数がサポートする最も古い日付は 1601 年 1 月 1
日である。この関数には対応するヘッダファイルやライブラリファイルがない。アプリケーションは
[**LoadLibrary**](/windows/win32/api/libloaderapi/nf-libloaderapi-loadlibrarya)
を DLL 名（Kernel32.dll）で呼び出してモジュールハンドルを取得し、そのモジュールハンドルとこの関数名を
[**GetProcAddress**](/windows/win32/api/libloaderapi/nf-libloaderapi-getprocaddress)
に渡して関数アドレスを取得できる。


%index
GetCommConfig
通信デバイスの現在の構成を取得する。
%group
Win32 kernel32
%prm
hCommDev, lpCC, lpdwSize
hCommDev : [intptr] オープン済み通信デバイスへのハンドル。CreateFile 関数がこのハンドルを返す。
lpCC : [var] COMMCONFIG 構造体を受け取るバッファへのポインタ。
lpdwSize : [var] lpCC が指すバッファのサイズをバイト単位で指定する。関数が戻ると、関数が成功した場合はコピーされたバイト数、バッファが小さすぎた場合は必要なバイト数がこの変数に格納される。
%inst
通信デバイスの現在の構成を取得する。

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 である。拡張エラー情報を取得するには
GetLastError 関数を使う。


%index
GetCommMask
指定した通信デバイスに対するイベントマスクの値を取得する。
%group
Win32 kernel32
%prm
hFile, lpEvtMask
hFile : [intptr] 通信デバイスへのハンドル。CreateFile 関数がこのハンドルを返す。
lpEvtMask : [var] 
%inst
指定した通信デバイスに対するイベントマスクの値を取得する。

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 である。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
GetCommMask 関数は、特定の通信リソースで監視可能なイベントの集合を示すマスク変数を使う。通信リソースへのハンドルは
WaitCommEvent 関数の呼び出しで指定でき、WaitCommEvent
はそれらのイベントのうちのいずれかが発生するのを待つ。通信リソースのイベントマスクを変更するには SetCommMask 関数を使う。


%index
GetCommModemStatus
モデム制御レジスタの値を取得する。
%group
Win32 kernel32
%prm
hFile, lpModemStat
hFile : [intptr] 通信デバイスへのハンドル。CreateFile 関数がこのハンドルを返す。
lpModemStat : [var] 
%inst
モデム制御レジスタの値を取得する。

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 である。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
GetCommModemStatus 関数は、WaitCommEvent 関数で
CTS、RLSD、DSR、リング表示の信号を監視している場合に有用である。これらの信号が状態変化したことを検出するには、WaitCommEvent
を使った後に GetCommModemStatus
で変化後の状態を判定する。ハードウェアが制御レジスタ値をサポートしていない場合、関数は失敗する。


%index
GetCommProperties
指定した通信デバイスの通信プロパティに関する情報を取得する。
%group
Win32 kernel32
%prm
hFile, lpCommProp
hFile : [intptr] 通信デバイスへのハンドル。CreateFile 関数がこのハンドルを返す。
lpCommProp : [var] 通信プロパティ情報が返される COMMPROP 構造体へのポインタ。この情報は、通信デバイスを構成するための SetCommState、SetCommTimeouts、または SetupComm 関数の以降の呼び出しで使用できる。
%inst
指定した通信デバイスの通信プロパティに関する情報を取得する。

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 である。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
GetCommProperties 関数は、デバイスドライバがサポートする構成設定に関する情報をデバイスドライバから返す。


%index
GetCommState
指定した通信デバイスの現在の制御設定を取得する。
%group
Win32 kernel32
%prm
hFile, lpDCB
hFile : [intptr] 通信デバイスへのハンドル。CreateFile 関数がこのハンドルを返す。
lpDCB : [var] 制御設定情報を受け取る DCB 構造体へのポインタ。
%inst
指定した通信デバイスの現在の制御設定を取得する。

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 である。拡張エラー情報を取得するには
GetLastError を呼ぶ。


%index
GetCommTimeouts
指定した通信デバイスにおけるすべての読み書き操作に対するタイムアウトパラメータを取得する。
%group
Win32 kernel32
%prm
hFile, lpCommTimeouts
hFile : [intptr] 通信デバイスへのハンドル。CreateFile 関数がこのハンドルを返す。
lpCommTimeouts : [var] タイムアウト情報が返される COMMTIMEOUTS 構造体へのポインタ。
%inst
指定した通信デバイスにおけるすべての読み書き操作に対するタイムアウトパラメータを取得する。

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 である。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
通信デバイスのタイムアウト値の詳細については SetCommTimeouts 関数を参照。


%index
GetCommandLineW
現在のプロセスのコマンドライン文字列を取得する。(Unicode)
%group
Win32 kernel32
%prm

%inst
現在のプロセスのコマンドライン文字列を取得する。(Unicode)

[戻り値]
戻り値は現在のプロセスのコマンドライン文字列へのポインタである。

[備考]

返り値のライフタイムはシステムが管理しており、アプリケーションはこの値を解放したり変更したりしてはならない。コンソールプロセスはエントリポイントとして
main または wmain 関数を実装し、それらの argc と argv 引数を使うことができる。GUI
プロセスはエントリポイントとして WinMain または wWinMain 関数を実装し、それらの lpCmdLine
引数を使うことができる。コマンドラインを argv 形式の文字列配列に変換するには、GetCommandLineW の結果を
CommandLineToArgvW に渡す。注意: OS
がプロセスに提供するコマンドライン中の実行ファイル名は、CreateProcess
関数を呼び出した側のプロセスが渡したコマンドライン中のものと必ずしも同一ではない。OS
は完全修飾パスなしで指定された実行ファイル名の前に、完全修飾パスを付加することがある。
> [!NOTE] > processenv.h ヘッダでは GetCommandLine が、UNICODE
プリプロセッサ定数の定義に応じて自動的に ANSI 版または Unicode
版を選択するエイリアスとして定義されている。エンコーディング中立のエイリアスを中立でないコードと混在させるとコンパイルや実行時のエラーになる可能性がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
GetCompressedFileSizeW
指定したファイルを格納するために使われている実際のディスク使用バイト数を取得する。(Unicode)
%group
Win32 kernel32
%prm
lpFileName, lpFileSizeHigh
lpFileName : [wstr] ファイルの名前。
lpFileSizeHigh : [var] 圧縮ファイルサイズの上位 DWORD。関数の戻り値は圧縮ファイルサイズの下位 DWORD である。
%inst
指定したファイルを格納するために使われている実際のディスク使用バイト数を取得する。(Unicode)

[戻り値]
関数が成功した場合、戻り値は指定したファイルを格納するために使われている実際のディスク使用バイト数の下位 DWORD
であり、lpFileSizeHigh が NULL でない場合、その実際の値の上位 DWORD がそのパラメータが指す DWORD
に格納される。これは圧縮ファイルでは圧縮ファイルサイズ、非圧縮ファイルでは実際のファイルサイズである。関数が失敗し、かつ
lpFileSizeHigh が NULL の場合、戻り値は INVALID_FILE_SIZE である。拡張エラー情報を取得するには
GetLastError を呼ぶ。戻り値が INVALID_FILE_SIZE で lpFileSizeHigh が NULL
でない場合、アプリケーションは GetLastError を呼び出して関数が成功した（値が NO_ERROR）か失敗した（NO_ERROR
以外）かを判定する必要がある。

[備考]
アプリケーションは、GetVolumeInformation を呼び出し、その lpFileSystemFlags パラメータが指す
DWORD 値の FS_VOL_IS_COMPRESSED
フラグの状態を確認することで、ボリュームが圧縮されているかどうかを判定できる。ファイルが圧縮やスパースファイルをサポートするボリューム上にない場合、またはファイルが圧縮もスパースファイルでもない場合、取得される値は
GetFileSize の呼び出しで返される値と同じく実際のファイルサイズである。シンボリックリンクの動作:
パスがシンボリックリンクを指している場合、関数はターゲットのファイルサイズを返す。Windows 8 および Windows Server
2012 では、この関数は次の技術によりサポートされる。
（以下省略）


%index
GetCompressedFileSizeTransactedW
指定したファイルを格納するために使われている実際のディスク使用バイト数を、トランザクション操作として取得する。(Unicode)
%group
Win32 kernel32
%prm
lpFileName, lpFileSizeHigh, hTransaction
lpFileName : [wstr] ファイルの名前。
lpFileSizeHigh : [var] 圧縮ファイルサイズの上位 DWORD を受け取る変数へのポインタ。関数の戻り値は圧縮ファイルサイズの下位 DWORD である。
hTransaction : [intptr] トランザクションへのハンドル。このハンドルは CreateTransaction 関数によって返される。
%inst
指定したファイルを格納するために使われている実際のディスク使用バイト数を、トランザクション操作として取得する。(Unicode)

[戻り値]
関数が成功した場合、戻り値は指定したファイルを格納するために使われている実際のディスク使用バイト数の下位 DWORD
であり、lpFileSizeHigh が NULL でない場合、その実際の値の上位 DWORD がそのパラメータが指す DWORD
に格納される。これは圧縮ファイルでは圧縮ファイルサイズ、非圧縮ファイルでは実際のファイルサイズである。関数が失敗し、かつ
lpFileSizeHigh が NULL の場合、戻り値は INVALID_FILE_SIZE である。拡張エラー情報を取得するには
GetLastError を呼ぶ。戻り値が INVALID_FILE_SIZE で lpFileSizeHigh が NULL
でない場合、アプリケーションは GetLastError を呼び出して関数が成功した（値が NO_ERROR）か失敗した（NO_ERROR
以外）かを判定する必要がある。

[備考]
アプリケーションは、GetVolumeInformation を呼び出し、その lpFileSystemFlags パラメータが指す
DWORD 値の FS_VOL_IS_COMPRESSED
フラグの状態を確認することで、ボリュームが圧縮されているかどうかを判定できる。ファイルが圧縮やスパースファイルをサポートするボリューム上にない場合、またはファイルが圧縮もスパースファイルでもない場合、取得される値は
GetFileSize の呼び出しで返される値と同じく実際のファイルサイズである。シンボリックリンク:
パスがシンボリックリンクを指している場合、関数はターゲットのファイルサイズを返す。Windows 8 および Windows Server
2012 では、この関数は次の技術によりサポートされる。
（以下省略）


%index
GetComputerNameW
ローカルコンピュータの NetBIOS 名を取得する。この名前はシステム起動時にレジストリから読み込まれて確立される。(Unicode)
%group
Win32 kernel32
%prm
lpBuffer, nSize
lpBuffer : [wstr] コンピュータ名またはクラスタ仮想サーバー名を受け取るバッファへのポインタ。バッファサイズは MAX_COMPUTERNAME_LENGTH + 1 文字を含むのに十分な大きさである必要がある。
nSize : [var] 入力時にはバッファのサイズを TCHAR 単位で指定する。出力時には、終端 NULL 文字を含まずに、コピー先バッファにコピーされた TCHAR 数を指定する。
%inst
ローカルコンピュータの NetBIOS 名を取得する。この名前はシステム起動時にレジストリから読み込まれて確立される。(Unicode)

[戻り値]
関数が成功した場合、戻り値は 0 以外の値である。関数が失敗した場合、戻り値は 0 である。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
GetComputerName 関数はシステム起動時に確立された NetBIOS 名を取得する。SetComputerName または
SetComputerNameEx
関数による名前変更は、ユーザーがコンピュータを再起動するまで反映されない。呼び出し側がクライアントセッションで実行されている場合、この関数はサーバー名を返す。クライアント名を取得するには
WTSQuerySessionInformation 関数を使う。


%index
GetComputerNameExW
ローカルコンピュータに関連付けられた NetBIOS 名または DNS 名を取得する。これらの名前はシステム起動時にレジストリから読み込まれて確立される。(Unicode)
%group
Win32 kernel32
%prm
NameType, lpBuffer, nSize
NameType : [int] 取得する名前の種類。このパラメータは COMPUTER_NAME_FORMAT 列挙型の値である。次の表に追加情報を示す。
lpBuffer : [wstr] コンピュータ名またはクラスタ仮想サーバー名を受け取るバッファへのポインタ。
nSize : [var] 入力時にはバッファのサイズを TCHAR 単位で指定する。出力時には、終端 NULL 文字を含まずに、コピー先バッファにコピーされた TCHAR 数を受け取る。
%inst
ローカルコンピュータに関連付けられた NetBIOS 名または DNS
名を取得する。これらの名前はシステム起動時にレジストリから読み込まれて確立される。(Unicode)

[戻り値]
関数が成功した場合、戻り値は 0 以外の値である。関数が失敗した場合、戻り値は 0 である。拡張エラー情報を取得するには
GetLastError を呼ぶ。次のような値が返ることがある。
（以下省略）

[備考]
ローカルマシンに対するグループポリシーが設定されていない場合、GetComputerNameEx 関数はシステム起動時に確立された
NetBIOS 名または DNS
名を取得する。グループポリシーが設定されている場合、関数はグループポリシーで設定された主要なドメイン名を返す。SetComputerName
または SetComputerNameEx
関数による名前変更は、ユーザーがコンピュータを再起動するまで反映されない。ローカルコンピュータが DNS
名を使うように構成されていない場合、GetComputerNameEx は DNS
情報を返さない。コンピュータをそのように構成するには、OS のヘルプの手順に従い、コンピュータのプライマリ DNS
サフィックスを変更してから再起動する。ローカルコンピュータがクラスタのノードである場合、この関数の動作は影響を受けることがある。詳細は
ResUtilGetEnvironmentWithNetName と UseNetworkName を参照。コンピュータの FQDN
がそのドメインの FQDN と一致しないような、異なる DNS レイアウトを使う環境を扱う場合は、代わりに
LsaQueryInformationPolicy を使う。この関数を使うアプリケーションをコンパイルするには、_WIN32_WINNT
マクロを 0x0500 以降として定義する。詳細は Using the Windows Headers を参照。


%index
GetConsoleAliasW
指定したコンソールエイリアスのテキストと、その実行ファイル名を取得する。
%group
Win32 kernel32
%prm
Source, TargetBuffer, TargetBufferLength, ExeName
Source : [wstr] 
TargetBuffer : [wstr] 
TargetBufferLength : [int] *lpTargetBuffer* が指すバッファのサイズ。バイト単位。
ExeName : [wstr] 
%inst
指定したコンソールエイリアスのテキストと、その実行ファイル名を取得する。

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 である。拡張エラー情報を取得するには
[**GetLastError**](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror)
を呼ぶ。

[備考]
この関数を使うアプリケーションをコンパイルするには、**\_WIN32\_WINNT** を 0x0501 以降として定義する。詳細は
[Using the Windows
Headers](/windows/win32/winprog/using-the-windows-headers)
を参照。[!INCLUDE
[no-vt-equiv-shell-banner](./includes/no-vt-equiv-shell-banner.md)]


%index
GetConsoleAliasExesW
コンソールエイリアスが定義されているすべての実行ファイル名を取得する。
%group
Win32 kernel32
%prm
ExeNameBuffer, ExeNameBufferLength
ExeNameBuffer : [wstr] 
ExeNameBufferLength : [int] *lpExeNameBuffer* が指すバッファのサイズ。バイト単位。
%inst
コンソールエイリアスが定義されているすべての実行ファイル名を取得する。

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 である。拡張エラー情報を取得するには
[**GetLastError**](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror)
を呼ぶ。

[備考]
*lpExeNameBuffer*
バッファに必要なサイズを判定するには、[**GetConsoleAliasExesLength**](getconsolealiasexeslength.md)
関数を使う。この関数を使うアプリケーションをコンパイルするには、**\_WIN32\_WINNT** を 0x0501
以降として定義する。詳細は [Using the Windows
Headers](/windows/win32/winprog/using-the-windows-headers)
を参照。[!INCLUDE
[no-vt-equiv-shell-banner](./includes/no-vt-equiv-shell-banner.md)]


%index
GetConsoleAliasExesLengthW
GetConsoleAliasExes 関数が使うバッファに必要なサイズを取得する。
%group
Win32 kernel32
%prm

%inst
GetConsoleAliasExes 関数が使うバッファに必要なサイズを取得する。

[戻り値]
この関数にはパラメータがない。
コンソールエイリアスが定義されているすべての実行ファイル名を格納するために必要なバッファサイズ。バイト単位。

[備考]
この関数を使うアプリケーションをコンパイルするには、**\_WIN32\_WINNT** を 0x0501 以降として定義する。詳細は
[Using the Windows
Headers](/windows/win32/winprog/using-the-windows-headers)
を参照。[!INCLUDE
[no-vt-equiv-shell-banner](./includes/no-vt-equiv-shell-banner.md)]


%index
GetConsoleAliasesW
指定した実行ファイルに対して定義されているすべてのコンソールエイリアスを取得する。
%group
Win32 kernel32
%prm
AliasBuffer, AliasBufferLength, ExeName
AliasBuffer : [wstr] 
AliasBufferLength : [int] *lpAliasBuffer* が指すバッファのサイズ。バイト単位。
ExeName : [wstr] 
%inst
指定した実行ファイルに対して定義されているすべてのコンソールエイリアスを取得する。

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 である。拡張エラー情報を取得するには
[**GetLastError**](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror)
を呼ぶ。

[備考]
*lpExeName*
バッファに必要なサイズを判定するには、[**GetConsoleAliasesLength**](getconsolealiaseslength.md)
関数を使う。この関数を使うアプリケーションをコンパイルするには、**\_WIN32\_WINNT** を 0x0501
以降として定義する。詳細は [Using the Windows
Headers](/windows/win32/winprog/using-the-windows-headers)
を参照。[!INCLUDE
[no-vt-equiv-shell-banner](./includes/no-vt-equiv-shell-banner.md)]


%index
GetConsoleAliasesLengthW
GetConsoleAliases 関数が使うバッファに必要なサイズを取得する。
%group
Win32 kernel32
%prm
ExeName
ExeName : [wstr] 
%inst
GetConsoleAliases 関数が使うバッファに必要なサイズを取得する。

[戻り値]
この実行ファイルに対して定義されているすべてのコンソールエイリアスを格納するために必要なバッファサイズ。バイト単位。

[備考]
この関数を使うアプリケーションをコンパイルするには、**\_WIN32\_WINNT** を 0x0501 以降として定義する。詳細は
[Using the Windows
Headers](/windows/win32/winprog/using-the-windows-headers)
を参照。[!INCLUDE
[no-vt-equiv-shell-banner](./includes/no-vt-equiv-shell-banner.md)]


%index
GetConsoleCP
呼び出し側プロセスに関連付けられたコンソールが使用する入力コードページを取得する。
%group
Win32 kernel32
%prm

%inst
呼び出し側プロセスに関連付けられたコンソールが使用する入力コードページを取得する。

[戻り値]
この関数にはパラメータがない。
戻り値はコードページを識別するコードである。識別子の一覧は [Code Page
Identifiers](/windows/win32/intl/code-page-identifiers) を参照。戻り値が 0
の場合、関数は失敗している。拡張エラー情報を取得するには
[**GetLastError**](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror)
を呼ぶ。

[備考]
コードページは 256
個の文字コードを個々の文字にマッピングする。コードページごとに含まれる特殊文字は異なり、通常はある言語または言語グループ向けにカスタマイズされている。コードページに関する追加情報（名前を含む）を取得するには
[**GetCPInfoEx**](/windows/win32/api/winnls/nf-winnls-getcpinfoexa)
関数を参照。コンソールの入力コードページを設定するには [**SetConsoleCP**](setconsolecp.md)
関数を使う。コンソールの出力コードページを設定および取得するには、[**SetConsoleOutputCP**](setconsoleoutputcp.md)
と [**GetConsoleOutputCP**](getconsoleoutputcp.md) 関数を使う。


%index
GetConsoleCommandHistoryW
(no summary)
%group
Win32 kernel32
%prm
Commands, CommandBufferLength, ExeName
Commands : [wstr] 
CommandBufferLength : [int] 
ExeName : [wstr] 
%inst



%index
GetConsoleCommandHistoryLengthW
(no summary)
%group
Win32 kernel32
%prm
ExeName
ExeName : [wstr] 
%inst



%index
GetConsoleCursorInfo
指定したコンソール画面バッファのカーソルのサイズと表示状態に関する情報を取得する。
%group
Win32 kernel32
%prm
hConsoleOutput, lpConsoleCursorInfo
hConsoleOutput : [intptr] コンソール画面バッファへのハンドル。このハンドルは **GENERIC\_READ** アクセス権を持っている必要がある。詳細は [Console Buffer Security and Access Rights](console-buffer-security-and-access-rights.md) を参照。
lpConsoleCursorInfo : [var] コンソールのカーソルに関する情報を受け取る [**CONSOLE\_CURSOR\_INFO**](console-cursor-info-str.md) 構造体へのポインタ。
%inst
指定したコンソール画面バッファのカーソルのサイズと表示状態に関する情報を取得する。

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 である。拡張エラー情報を取得するには
[**GetLastError**](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror)
を呼ぶ。

[備考]
[!INCLUDE
[no-vt-equiv-user-priv](./includes/no-vt-equiv-user-priv.md)]


%index
GetConsoleDisplayMode
現在のコンソールの表示モードを取得する GetConsoleDisplayMode 関数のリファレンス情報を参照。
%group
Win32 kernel32
%prm
lpModeFlags
lpModeFlags : [var] コンソールの表示モード。このパラメータは次の値の 1 つまたは複数を取り得る。 | 値 | 意味 | |-|-| | **CONSOLE_FULLSCREEN** 1 | 全画面コンソール。ウィンドウが最大化されると同時にコンソールはこのモードになる。この時点でも全画面モードへの遷移は失敗する可能性がある。 | | **CONSOLE_FULLSCREEN_HARDWARE** 2 | ビデオハードウェアと直接通信する全画面コンソール。コンソールが **CONSOLE_FULLSCREEN** モードになった後にこのモードが設定され、全画面モードへの遷移が完了したことを示す。 | > [!NOTE] > 100% フル画面のビデオハードウェアモードへの遷移は、Windows Vista でグラフィックススタックが [WDDM](/windows-hardware/drivers/display/introduction-to-the-windows-vista-and-later-display-driver-model) に再プラットフォームされた際に削除された。それ以降の Windows では、結果として得られる最大状態は **CONSOLE_FULLSCREEN** であり、これは全画面に見える枠なしウィンドウを表すが、ハードウェアの排他的制御下にはない。
%inst
現在のコンソールの表示モードを取得する GetConsoleDisplayMode 関数のリファレンス情報を参照。

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 である。拡張エラー情報を取得するには
[**GetLastError**](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror)
を呼ぶ。

[備考]
この関数を使うアプリケーションをコンパイルするには、**\_WIN32\_WINNT** を 0x0500 以降として定義する。詳細は
[Using the Windows
Headers](/windows/win32/winprog/using-the-windows-headers)
を参照。[!INCLUDE
[no-vt-equiv-user-priv](./includes/no-vt-equiv-user-priv.md)]


%index
GetConsoleFontSize
指定したコンソール画面バッファで使われているフォントのサイズを取得する。
%group
Win32 kernel32
%prm
hConsoleOutput, nFont
hConsoleOutput : [intptr] コンソール画面バッファへのハンドル。このハンドルは **GENERIC\_READ** アクセス権を持っている必要がある。詳細は [Console Buffer Security and Access Rights](console-buffer-security-and-access-rights.md) を参照。
nFont : [int] サイズを取得するフォントのインデックス。このインデックスは [**GetCurrentConsoleFont**](getcurrentconsolefont.md) 関数を呼び出すことで得られる。
%inst
指定したコンソール画面バッファで使われているフォントのサイズを取得する。

[戻り値]
関数が成功した場合、戻り値はフォント内の各文字の幅と高さ（論理単位）を含む [**COORD**](coord-str.md)
構造体である。**X** メンバが幅、**Y** メンバが高さを保持する。関数が失敗した場合、幅と高さはともに 0
である。拡張エラー情報を取得するには
[**GetLastError**](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror)
を呼ぶ。

[備考]
この関数を使うアプリケーションをコンパイルするには、**\_WIN32\_WINNT** を 0x0500 以降として定義する。詳細は
[Using the Windows
Headers](/windows/win32/winprog/using-the-windows-headers)
を参照。[!INCLUDE
[no-vt-equiv-user-priv](./includes/no-vt-equiv-user-priv.md)]


%index
GetConsoleHistoryInfo
呼び出し側プロセスのコンソールに対する履歴設定を取得する GetConsoleHistoryInfo 関数のリファレンス情報を参照。
%group
Win32 kernel32
%prm
lpConsoleHistoryInfo
lpConsoleHistoryInfo : [var] 呼び出し側プロセスのコンソールに対する履歴設定を受け取る [**CONSOLE\_HISTORY\_INFO**](console-history-info.md) 構造体へのポインタ。
%inst
呼び出し側プロセスのコンソールに対する履歴設定を取得する GetConsoleHistoryInfo 関数のリファレンス情報を参照。

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 である。拡張エラー情報を取得するには
[**GetLastError**](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror)
を呼ぶ。

[備考]
呼び出し側プロセスがコンソールプロセスでない場合、関数は失敗し、最後のエラーに **ERROR\_ACCESS\_DENIED**
を設定する。[!INCLUDE
[no-vt-equiv-shell-banner](./includes/no-vt-equiv-shell-banner.md)]


%index
GetConsoleMode
コンソール入力バッファの現在の入力モード、またはコンソール画面バッファの現在の出力モードを取得する。
%group
Win32 kernel32
%prm
hConsoleHandle, lpMode
hConsoleHandle : [intptr] コンソール入力バッファまたはコンソール画面バッファへのハンドル。このハンドルは **GENERIC\_READ** アクセス権を持っている必要がある。詳細は [Console Buffer Security and Access Rights](console-buffer-security-and-access-rights.md) を参照。
lpMode : [var] 指定したバッファの現在のモードを受け取る変数へのポインタ。[!INCLUDE [console-mode-flags](./includes/console-mode-flags.md)]
%inst
コンソール入力バッファの現在の入力モード、またはコンソール画面バッファの現在の出力モードを取得する。

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 である。拡張エラー情報を取得するには
[**GetLastError**](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror)
を呼ぶ。

[備考]
[!INCLUDE [console-mode-remarks](./includes/console-mode-remarks.md)]
コンソールの I/O モードを変更するには [**SetConsoleMode**](setconsolemode.md)
関数を呼び出す。


%index
GetConsoleOriginalTitleW
現在のコンソールウィンドウの元のタイトルを取得する GetConsoleOriginalTitle 関数のリファレンス情報を参照。
%group
Win32 kernel32
%prm
lpConsoleTitle, nSize
lpConsoleTitle : [wstr] 元のタイトルを含む NULL 終端文字列を受け取るバッファへのポインタ。
nSize : [int] *lpConsoleTitle* バッファのサイズ。文字数で指定する。
%inst
現在のコンソールウィンドウの元のタイトルを取得する GetConsoleOriginalTitle 関数のリファレンス情報を参照。

[戻り値]
*nSize* が 0 の場合、戻り値は 0
である。関数が成功した場合、戻り値は元のコンソールタイトルの長さ（文字数）である。関数が失敗した場合、戻り値は 0
で、[**GetLastError**](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror)
がエラーコードを返す。

[備考]
コンソールウィンドウのタイトルを設定するには [**SetConsoleTitle**](setconsoletitle.md)
関数を使う。現在のタイトル文字列を取得するには [**GetConsoleTitle**](getconsoletitle.md)
関数を使う。この関数を使うアプリケーションをコンパイルするには、**\_WIN32\_WINNT** を 0x0600
以降として定義する。詳細は [Using the Windows
Headers](/windows/win32/winprog/using-the-windows-headers) を参照。>
[!TIP] > この API は推奨されておらず、**[virtual
terminal](console-virtual-terminal-sequences.md)**
に相当するものはない。この決定は意図的に Windows プラットフォームを他の OS と整合させるためのものである。SSH
のようなクロスプラットフォームのユーティリティやトランスポートを通じてリモート接続するアプリケーションでは、この API
を使うと期待どおりに動作しないことがある。


%index
GetConsoleOutputCP
呼び出し側プロセスに関連付けられたコンソールが使用する出力コードページを取得する。
%group
Win32 kernel32
%prm

%inst
呼び出し側プロセスに関連付けられたコンソールが使用する出力コードページを取得する。

[戻り値]
この関数にはパラメータがない。
戻り値はコードページを識別するコードである。識別子の一覧は [Code Page
Identifiers](/windows/win32/intl/code-page-identifiers) を参照。戻り値が 0
の場合、関数は失敗している。拡張エラー情報を取得するには
[**GetLastError**](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror)
を呼ぶ。

[備考]
コードページは 256
個の文字コードを個々の文字にマッピングする。コードページごとに含まれる特殊文字は異なり、通常はある言語または言語グループ向けにカスタマイズされている。コードページに関する追加情報（名前を含む）を取得するには
[**GetCPInfoEx**](/windows/win32/api/winnls/nf-winnls-getcpinfoexa)
関数を参照。コンソールの出力コードページを設定するには
[**SetConsoleOutputCP**](setconsoleoutputcp.md)
関数を使う。コンソールの入力コードページを設定および取得するには、[**SetConsoleCP**](setconsolecp.md)
と [**GetConsoleCP**](getconsolecp.md) 関数を使う。


%index
GetConsoleProcessList
現在のコンソールにアタッチされているプロセスのリストを取得する GetConsoleProcessList 関数のリファレンス情報を参照。
%group
Win32 kernel32
%prm
lpdwProcessList, dwProcessCount
lpdwProcessList : [var] 成功時にプロセス識別子の配列を受け取るバッファへのポインタ。これは有効なバッファでなければならず、`NULL` を指定できない。バッファには少なくとも 1 つのプロセス ID を受け取るためのスペースが必要である。
dwProcessCount : [int] *lpdwProcessList* バッファに格納できるプロセス識別子の最大数。0 より大きくなければならない。
%inst
現在のコンソールにアタッチされているプロセスのリストを取得する GetConsoleProcessList 関数のリファレンス情報を参照。

[戻り値]
関数が成功した場合、戻り値は *dwProcessCount* 以下であり、*lpdwProcessList*
バッファに格納されたプロセス識別子の数を表す。バッファがすべての有効なプロセス識別子を保持するには小さすぎる場合、戻り値は必要な配列要素数となる。この場合、関数はバッファに識別子を格納していない。この状況では戻り値を使ってリスト全体を格納できる十分な大きさのバッファを確保し、関数を再度呼び出す。戻り値が
0 の場合、すべてのコンソールには関連付けられたプロセスが少なくとも 1 つあるため、関数は失敗している。拡張エラー情報を取得するには
[**GetLastError**](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror)
を呼ぶ。`NULL` のプロセスリストが渡された場合、またはプロセス数が 0 の場合、呼び出しは 0 を返し、`GetLastError`
は `ERROR_INVALID_PARAMETER` を返す。この関数を呼ぶ際は少なくとも 1
要素のバッファを指定する。戻りコードが指定したバッファの長さより大きい場合は、より大きなバッファを確保して再度呼び出す。

[備考]
この関数を使うアプリケーションをコンパイルするには、**\_WIN32\_WINNT** を 0x0501 以降として定義する。詳細は
[Using the Windows
Headers](/windows/win32/winprog/using-the-windows-headers)
を参照。[!INCLUDE
[no-vt-equiv-local-context](./includes/no-vt-equiv-local-context.md)]


%index
GetConsoleScreenBufferInfo
指定したコンソール画面バッファに関する情報を取得する GetConsoleScreenBufferInfo 関数のリファレンス情報を参照。
%group
Win32 kernel32
%prm
hConsoleOutput, lpConsoleScreenBufferInfo
hConsoleOutput : [intptr] コンソール画面バッファへのハンドル。このハンドルは **GENERIC\_READ** アクセス権を持っている必要がある。詳細は [Console Buffer Security and Access Rights](console-buffer-security-and-access-rights.md) を参照。
lpConsoleScreenBufferInfo : [var] コンソール画面バッファ情報を受け取る [**CONSOLE\_SCREEN\_BUFFER\_INFO**](console-screen-buffer-info-str.md) 構造体へのポインタ。
%inst
指定したコンソール画面バッファに関する情報を取得する GetConsoleScreenBufferInfo 関数のリファレンス情報を参照。

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 である。拡張エラー情報を取得するには
[**GetLastError**](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror)
を呼ぶ。

[備考]

[**CONSOLE\_SCREEN\_BUFFER\_INFO**](console-screen-buffer-info-str.md)
構造体の **srWindow** メンバで返される矩形は変更してから
[**SetConsoleWindowInfo**](setconsolewindowinfo.md)
関数に渡すことで、ウィンドウ内のコンソール画面バッファをスクロールしたり、ウィンドウのサイズを変更したり、その両方を行ったりできる。[**CONSOLE\_SCREEN\_BUFFER\_INFO**](console-screen-buffer-info-str.md)
構造体で返されるすべての座標は文字セル座標で、原点 (0, 0) はコンソール画面バッファの左上隅にある。> [!TIP] > この
API には **[virtual terminal](console-virtual-terminal-sequences.md)**
に相当するものはない。列やグリッドを描画したり、表示を埋めるためにウィンドウサイズを取得しようとするアプリケーションでは依然として使う必要がある場合がある。このウィンドウ状態は通常のストリームフローの外側で
TTY/PTY/Pseudoconsole
によって管理されており、一般的にはクライアントアプリケーションが調整できないユーザー権限と見なされている。更新は
[**ReadConsoleInput**](readconsoleinput.md) で受け取ることができる。


%index
GetConsoleScreenBufferInfoEx
指定したコンソール画面バッファに関する拡張情報を取得する。
%group
Win32 kernel32
%prm
hConsoleOutput, lpConsoleScreenBufferInfoEx
hConsoleOutput : [intptr] コンソール画面バッファへのハンドル。このハンドルは **GENERIC\_READ** アクセス権を持っている必要がある。詳細は [Console Buffer Security and Access Rights](console-buffer-security-and-access-rights.md) を参照。
lpConsoleScreenBufferInfoEx : [var] 要求されたコンソール画面バッファ情報を受け取る [**CONSOLE\_SCREEN\_BUFFER\_INFOEX**](console-screen-buffer-infoex.md) 構造体。
%inst
指定したコンソール画面バッファに関する拡張情報を取得する。

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 である。拡張エラー情報を取得するには
[**GetLastError**](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror)
を呼ぶ。

[備考]

[**CONSOLE\_SCREEN\_BUFFER\_INFOEX**](console-screen-buffer-infoex.md)
構造体の **srWindow** メンバで返される矩形は変更してから
[**SetConsoleWindowInfo**](setconsolewindowinfo.md)
関数に渡すことで、ウィンドウ内のコンソール画面バッファをスクロールしたり、ウィンドウのサイズを変更したり、その両方を行ったりできる。[**CONSOLE\_SCREEN\_BUFFER\_INFOEX**](console-screen-buffer-infoex.md)
構造体で返されるすべての座標は文字セル座標で、原点 (0, 0) はコンソール画面バッファの左上隅にある。> [!TIP] > この
API には **[virtual terminal](console-virtual-terminal-sequences.md)**
に相当するものはない。列やグリッドを描画したり、表示を埋めるためにウィンドウサイズを取得しようとするアプリケーションでは依然として使う必要がある場合がある。このウィンドウ状態は通常のストリームフローの外側で
TTY/PTY/Pseudoconsole
によって管理されており、一般的にはクライアントアプリケーションが調整できないユーザー権限と見なされている。更新は
[**ReadConsoleInput**](readconsoleinput.md) で受け取ることができる。


%index
GetConsoleSelectionInfo
現在のコンソール選択範囲に関する情報を取得する GetConsoleSelectionInfo 関数のリファレンス情報を参照。
%group
Win32 kernel32
%prm
lpConsoleSelectionInfo
lpConsoleSelectionInfo : [var] 選択範囲情報を受け取る [**CONSOLE\_SELECTION\_INFO**](console-selection-info-str.md) 構造体へのポインタ。
%inst
現在のコンソール選択範囲に関する情報を取得する GetConsoleSelectionInfo 関数のリファレンス情報を参照。

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 である。拡張エラー情報を取得するには
[**GetLastError**](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror)
を呼ぶ。

[備考]
この関数を使うアプリケーションをコンパイルするには、**\_WIN32\_WINNT** を 0x0500 以降として定義する。詳細は
[Using the Windows
Headers](/windows/win32/winprog/using-the-windows-headers)
を参照。[!INCLUDE
[no-vt-equiv-user-priv](./includes/no-vt-equiv-user-priv.md)]


%index
GetConsoleTitleW
現在のコンソールウィンドウのタイトルとそのサイズを取得する。
%group
Win32 kernel32
%prm
lpConsoleTitle, nSize
lpConsoleTitle : [wstr] タイトルを含む NULL 終端文字列を受け取るバッファへのポインタ。バッファがタイトルを格納するには小さすぎる場合、関数はバッファに収まる分だけのタイトル文字を格納し、NULL 終端で締めくくる。
nSize : [int] *lpConsoleTitle* パラメータが指すバッファのサイズ。文字数で指定する。
%inst
現在のコンソールウィンドウのタイトルとそのサイズを取得する。

[戻り値]
関数が成功した場合、戻り値はコンソールウィンドウのタイトルの長さ（文字数）である。関数が失敗した場合、戻り値は 0
で、[**GetLastError**](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror)
がエラーコードを返す。

[備考]
コンソールウィンドウのタイトルを設定するには [**SetConsoleTitle**](setconsoletitle.md)
関数を使う。元のタイトル文字列を取得するには
[**GetConsoleOriginalTitle**](getconsoleoriginaltitle.md)
関数を使う。[!INCLUDE
[setting-codepage-mode-remarks](./includes/setting-codepage-mode-remarks.md)]
> [!TIP] > この API は推奨されておらず、**[virtual
terminal](console-virtual-terminal-sequences.md)**
に相当するものはない。この決定は意図的に Windows プラットフォームを他の OS と整合させるためのものである。SSH
のようなクロスプラットフォームのユーティリティやトランスポートを通じてリモート接続するアプリケーションでは、この API
を使うと期待どおりに動作しないことがある。


%index
GetConsoleWindow
呼び出し側プロセスに関連付けられたコンソールが使用するウィンドウハンドルを取得する。
%group
Win32 kernel32
%prm

%inst
呼び出し側プロセスに関連付けられたコンソールが使用するウィンドウハンドルを取得する。

[戻り値]
この関数にはパラメータがない。
戻り値は、呼び出し側プロセスに関連付けられたコンソールが使用するウィンドウへのハンドルである。関連付けられたコンソールがない場合は
**NULL** が返る。

[備考]
この関数を使うアプリケーションをコンパイルするには、**\_WIN32\_WINNT** を 0x0500 以降として定義する。詳細は
[Using the Windows
Headers](/windows/win32/winprog/using-the-windows-headers) を参照。
[!INCLUDE
[no-vt-equiv-local-context](./includes/no-vt-equiv-local-context.md)]
[**pseudoconsole**](pseudoconsoles.md)
セッション内でホストされるアプリケーションでは、この関数はメッセージキュー目的のためのウィンドウハンドルのみを返す。_pseudoconsole_
がすべての操作を別の場所のターミナルウィンドウで提示するためのストリームへとシリアライズしているため、関連するウィンドウはローカルには表示されない。


%index
GetCurrencyFormatW
識別子で指定したロケール用に数値文字列を通貨文字列として整形する。(Unicode)
%group
Win32 kernel32
%prm
Locale, dwFlags, lpValue, lpFormat, lpCurrencyStr, cchCurrency
Locale : [int] 通貨文字列を整形するロケールを指定するロケール識別子。MAKELCID マクロでロケール識別子を作成することも、次の定義済み値のいずれかを使うこともできる。
dwFlags : [int] 通貨書式を制御するフラグ。lpFormat が NULL でない場合、アプリケーションはこのパラメータを 0 に設定する必要がある。この場合、関数はロケールの既定の通貨形式に対するユーザーオーバーライドを使って文字列を整形する。lpFormat が NULL の場合、アプリケーションは LOCALE_NOUSEROVERRIDE を指定して、指定したロケールのシステム既定通貨形式を使って文字列を整形できる。注意: LOCALE_NOUSEROVERRIDE の使用はユーザー設定を無効にするため、強く推奨されない。
lpValue : [wstr] 詳細は GetCurrencyFormatEx の lpValue パラメータを参照。
lpFormat : [var] 通貨書式情報を含む CURRENCYFMT 構造体へのポインタ。構造体のすべてのメンバには適切な値が含まれていなければならない。指定したロケールの通貨形式を関数に使わせる場合、アプリケーションはこのパラメータを NULL に設定できる。このパラメータが NULL でない場合、関数は CURRENCYFMT 構造体で指定されていない書式情報（たとえばロケールで使われる負号の文字列値）に対してのみ指定したロケールを使う。
lpCurrencyStr : [wstr] 整形済み通貨文字列をこの関数が取得するバッファへのポインタ。
cchCurrency : [int] lpCurrencyStr バッファのサイズ。文字数で指定する。整形済み通貨文字列を保持するのに必要なバッファサイズを関数に返させる場合、アプリケーションはこのパラメータを 0 に設定する。この場合、lpCurrencyStr パラメータは使われない。
%inst
識別子で指定したロケール用に数値文字列を通貨文字列として整形する。(Unicode)

[戻り値]
成功した場合、lpCurrencyStr が示すバッファに取得された文字数を返す。cchCurrency パラメータが 0
に設定されている場合、関数は終端 NULL 文字を含む整形済み通貨文字列を保持するのに必要なバッファサイズを返す。成功しなかった場合は 0
を返す。拡張エラー情報を取得するには GetLastError を呼び出すことができ、次のいずれかのエラーコードが返ることがある。
（以下省略）

[備考]

この関数はカスタムロケールからデータを取得することがある。データはコンピュータ間でもアプリケーションの実行間でも同じであることは保証されない。アプリケーションがデータを永続化または送信する必要がある場合は
Using Persistent Locale Data を参照。この関数の ANSI 版を Unicode
専用ロケール識別子と共に使った場合、OS
がシステムコードページを使うため呼び出しが成功することがある。ただし、システムコードページで未定義の文字は文字列中で疑問符（?）として表示される。
> [!NOTE] > winnls.h ヘッダでは GetCurrencyFormat が、UNICODE
プリプロセッサ定数の定義に応じて自動的に ANSI 版または Unicode
版を選択するエイリアスとして定義されている。エンコーディング中立のエイリアスを中立でないコードと混在させるとコンパイルや実行時のエラーになる可能性がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
GetCurrencyFormatEx
名前で指定したロケール用に数値文字列を通貨文字列として整形する。注意: アプリケーションが Windows Vista 以降でのみ動作するように設計されている場合、GetCurrencyFormat よりこの関数を優先して呼び出すべきである。注意: この関数はリリース間で変化し得るデータ（たとえばカスタムロケール由来のもの）を整形することがある。アプリケーションがデータを永続化または送信する必要がある場合は Using Persistent Locale Data を参照。
%group
Win32 kernel32
%prm
lpLocaleName, dwFlags, lpValue, lpFormat, lpCurrencyStr, cchCurrency
lpLocaleName : [wstr] ロケール名、または次の定義済み値のいずれかへのポインタ。
dwFlags : [int] 関数の動作を制御するフラグ。lpFormat が NULL でない場合、アプリケーションはこのパラメータを 0 に設定する必要がある。この場合、関数はロケールの既定の通貨形式に対するユーザーオーバーライドを使って文字列を整形する。lpFormat が NULL の場合、アプリケーションは LOCALE_NOUSEROVERRIDE を指定して、指定したロケールのシステム既定通貨形式を使って文字列を整形できる。注意: LOCALE_NOUSEROVERRIDE の使用はユーザー設定を無効にするため、強く推奨されない。
lpValue : [wstr] 整形対象の数値文字列を含む NULL 終端文字列へのポインタ。この文字列には次の文字のみ含めることができる。それ以外の文字はすべて無効である。文字列がこれらの規則から逸脱している場合、関数はエラーを返す。
lpFormat : [var] 通貨書式情報を含む CURRENCYFMT 構造体へのポインタ。構造体のすべてのメンバには適切な値が含まれていなければならない。指定したロケールの通貨形式を関数に使わせる場合、アプリケーションはこのパラメータを NULL に設定できる。このパラメータが NULL でない場合、関数は CURRENCYFMT 構造体で指定されていない書式情報（たとえばロケールで使われる負号の文字列値）に対してのみ指定したロケールを使う。
lpCurrencyStr : [wstr] 整形済み通貨文字列をこの関数が取得するバッファへのポインタ。
cchCurrency : [int] lpCurrencyStr バッファのサイズ。文字数で指定する。アプリケーションはこのパラメータを 0 に設定することで、整形済み通貨文字列を保持するのに必要なバッファサイズを返すことができる。この場合、lpCurrencyStr が示すバッファは使われない。
%inst
名前で指定したロケール用に数値文字列を通貨文字列として整形する。注意: アプリケーションが Windows Vista
以降でのみ動作するように設計されている場合、GetCurrencyFormat よりこの関数を優先して呼び出すべきである。注意:
この関数はリリース間で変化し得るデータ（たとえばカスタムロケール由来のもの）を整形することがある。アプリケーションがデータを永続化または送信する必要がある場合は
Using Persistent Locale Data を参照。

[戻り値]
成功した場合、lpCurrencyStr が示すバッファに取得された文字数を返す。cchCurrency パラメータが 0
の場合、関数は終端 NULL 文字を含む整形済み通貨文字列を保持するのに必要なバッファサイズを返す。成功しなかった場合は 0
を返す。拡張エラー情報を取得するには GetLastError を呼び出すことができ、次のいずれかのエラーコードが返ることがある。
（以下省略）

[備考]
Windows 8 以降: アプリケーションが Windows.Globalization 名前空間の言語タグをこの関数に渡す場合、まず
ResolveLocaleName を呼び出してタグを変換する必要がある。


%index
GetCurrentActCtx
GetCurrentActCtx 関数は、呼び出し側スレッドのアクティブなアクティベーションコンテキストへのハンドルを返す。
%group
Win32 kernel32
%prm
lphActCtx
lphActCtx : [intptr] アクティブなアクティベーションコンテキストに関する情報を含む、返却される ACTCTX 構造体へのポインタ。
%inst
GetCurrentActCtx 関数は、呼び出し側スレッドのアクティブなアクティベーションコンテキストへのハンドルを返す。

[戻り値]
関数が成功した場合は TRUE を返す。それ以外の場合は FALSE を返す。この関数は GetLastError
を呼び出すことで取得できるエラーを設定する。例については Retrieving the Last-Error Code
を参照。エラーコードの一覧については System Error Codes を参照。

[備考]

返されたアクティベーションコンテキストのハンドルを解放するのは呼び出し側スレッドの責任である。このスレッドによってアクティベーションコンテキストがアクティブ化されていない場合、この関数は
NULL ハンドルを返すことがある。これはエラーではない。


%index
GetCurrentConsoleFont
指定したコンソール画面バッファの現在のコンソールフォントに関する情報を取得する。
%group
Win32 kernel32
%prm
hConsoleOutput, bMaximumWindow, lpConsoleCurrentFont
hConsoleOutput : [intptr] コンソール画面バッファへのハンドル。このハンドルは **GENERIC\_READ** アクセス権を持っている必要がある。詳細は [Console Buffer Security and Access Rights](console-buffer-security-and-access-rights.md) を参照。
bMaximumWindow : [int] このパラメータが **TRUE** の場合、最大ウィンドウサイズに対するフォント情報が取得される。**FALSE** の場合、現在のウィンドウサイズに対するフォント情報が取得される。
lpConsoleCurrentFont : [var] 要求されたフォント情報を受け取る [**CONSOLE\_FONT\_INFO**](console-font-info-str.md) 構造体へのポインタ。
%inst
指定したコンソール画面バッファの現在のコンソールフォントに関する情報を取得する。

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 である。拡張エラー情報を取得するには
[**GetLastError**](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror)
を呼ぶ。

[備考]
この関数を使うアプリケーションをコンパイルするには、**\_WIN32\_WINNT** を 0x0500 以降として定義する。詳細は
[Using the Windows
Headers](/windows/win32/winprog/using-the-windows-headers)
を参照。[!INCLUDE
[no-vt-equiv-user-priv](./includes/no-vt-equiv-user-priv.md)]


%index
GetCurrentConsoleFontEx
現在使われているコンソールフォントに関する拡張情報を取得する GetCurrentConsoleFontEx 関数のリファレンス情報を参照。
%group
Win32 kernel32
%prm
hConsoleOutput, bMaximumWindow, lpConsoleCurrentFontEx
hConsoleOutput : [intptr] コンソール画面バッファへのハンドル。このハンドルは **GENERIC\_READ** アクセス権を持っている必要がある。詳細は [Console Buffer Security and Access Rights](console-buffer-security-and-access-rights.md) を参照。
bMaximumWindow : [int] このパラメータが **TRUE** の場合、最大ウィンドウサイズに対するフォント情報が取得される。**FALSE** の場合、現在のウィンドウサイズに対するフォント情報が取得される。
lpConsoleCurrentFontEx : [var] 要求されたフォント情報を受け取る [**CONSOLE\_FONT\_INFOEX**](console-font-infoex.md) 構造体へのポインタ。
%inst
現在使われているコンソールフォントに関する拡張情報を取得する GetCurrentConsoleFontEx
関数のリファレンス情報を参照。

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 である。拡張エラー情報を取得するには
[**GetLastError**](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror)
を呼ぶ。[!INCLUDE
[no-vt-equiv-user-priv](./includes/no-vt-equiv-user-priv.md)]


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
GetCurrentUmsThread
呼び出し側 UMS スレッドのユーザーモードスケジューリング (UMS) スレッドコンテキストを返す。
%group
Win32 kernel32
%prm

%inst
呼び出し側 UMS スレッドのユーザーモードスケジューリング (UMS) スレッドコンテキストを返す。

[戻り値]
この関数は呼び出し側スレッドの UMS スレッドコンテキストへのポインタを返す。呼び出し側スレッドが UMS スレッドでない場合、関数は
NULL を返す。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
GetCurrentUmsThread 関数は UMS スケジューラスレッドまたは UMS ワーカースレッドで呼び出すことができる。


%index
GetDateFormatW
ロケール識別子で指定したロケール用に日付を日付文字列として整形する。(Unicode)
%group
Win32 kernel32
%prm
Locale, dwFlags, lpDate, lpFormat, lpDateStr, cchDate
Locale : [int] 日付文字列を整形するロケールを指定するロケール識別子。MAKELCID マクロでロケール識別子を作成することも、次の定義済み値のいずれかを使うこともできる。
dwFlags : [int] 日付フォーマットオプションを指定するフラグ。詳細な定義については GetDateFormatEx の dwFlags パラメータを参照。
lpDate : [var] 整形対象の日付情報を含む SYSTEMTIME 構造体へのポインタ。現在のローカルシステム日付を関数に使わせる場合、アプリケーションはこのパラメータを NULL に設定する。
lpFormat : [wstr] 日付を組み立てるために使われるフォーマットピクチャ文字列へのポインタ。フォーマットピクチャ文字列に指定可能な値は Day, Month, Year, and Era Format Pictures で定義されている。関数はフォーマットピクチャ文字列で指定されていない情報（たとえばロケールの曜日名や月名）にのみ指定したロケールを使う。指定したロケールの日付形式に従って文字列を整形させる場合、アプリケーションはこのパラメータを NULL に設定できる。
lpDateStr : [wstr] 整形済み日付文字列をこの関数が取得するバッファへのポインタ。
cchDate : [int] lpDateStr バッファのサイズ。文字数で指定する。アプリケーションはこのパラメータを 0 に設定することで、整形済み日付文字列を保持するのに必要なバッファサイズを返すことができる。この場合、lpDateStr が示すバッファは使われない。
%inst
ロケール識別子で指定したロケール用に日付を日付文字列として整形する。(Unicode)

[戻り値]
成功した場合、lpDateStr バッファに書き込まれた文字数を返す。cchDate パラメータが 0 に設定されている場合、関数は終端
NULL 文字を含む整形済み日付文字列を保持するのに必要な文字数を返す。成功しなかった場合は 0 を返す。拡張エラー情報を取得するには
GetLastError を呼び出すことができ、次のいずれかのエラーコードが返ることがある。
（以下省略）

[備考]
注意: この API は 2019 年 5
月の日本の改元に対応するために更新中である。アプリケーションが日本のカレンダーをサポートする場合、新しい時代を正しく扱えることを検証する必要がある。詳細は「日本の改元に向けてアプリケーションを準備する」を参照。GetDateFormatEx
の Remarks を参照。この関数の ANSI 版を Unicode 専用ロケール識別子と共に使った場合、OS
がシステムコードページを使うため関数が成功することがある。ただし、システムコードページで未定義の文字は文字列中で疑問符（"?"）として表示される。
Windows 8 以降: GetDateFormat は Datetimeapi.h で宣言されている。Windows 8 より前は
Winnls.h で宣言されていた。
> [!NOTE] > datetimeapi.h ヘッダでは GetDateFormat が、UNICODE
プリプロセッサ定数の定義に応じて自動的に ANSI 版または Unicode
版を選択するエイリアスとして定義されている。エンコーディング中立のエイリアスを中立でないコードと混在させるとコンパイルや実行時のエラーになる可能性がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
GetDateFormatEx
名前で指定したロケール用に日付を日付文字列として整形する。
%group
Win32 kernel32
%prm
lpLocaleName, dwFlags, lpDate, lpFormat, lpDateStr, cchDate, lpCalendar
lpLocaleName : [wstr] ロケール名、または次の定義済み値のいずれかへのポインタ。
dwFlags : [int] 
lpDate : [var] 整形対象の日付情報を含む SYSTEMTIME 構造体へのポインタ。現在のローカルシステム日付を関数に使わせる場合、アプリケーションはこのパラメータを NULL に設定できる。
lpFormat : [wstr] 日付を組み立てるために使われるフォーマットピクチャ文字列へのポインタ。フォーマットピクチャ文字列に指定可能な値は Day, Month, Year, and Era Format Pictures で定義されている。たとえば日付文字列 "Wed, Aug 31 94" を取得するには、アプリケーションはピクチャ文字列 "ddd',' MMM dd yy" を使う。関数はフォーマットピクチャ文字列で指定されていない情報（たとえばロケールの曜日名や月名）にのみ指定したロケールを使う。指定したロケールの日付形式に従って文字列を整形させる場合、アプリケーションはこのパラメータを NULL に設定できる。
lpDateStr : [wstr] 整形済み日付文字列をこの関数が取得するバッファへのポインタ。
cchDate : [int] lpDateStr バッファのサイズ。文字数で指定する。アプリケーションはこのパラメータを 0 に設定することで、整形済み日付文字列を保持するのに必要なバッファサイズを返すことができる。この場合、lpDateStr が示すバッファは使われない。
lpCalendar : [wstr] 予約。NULL を指定する必要がある。
%inst
名前で指定したロケール用に日付を日付文字列として整形する。

[戻り値]
成功した場合、lpDateStr バッファに書き込まれた文字数を返す。cchDate パラメータが 0 に設定されている場合、関数は終端
NULL 文字を含む整形済み日付文字列を保持するのに必要な文字数を返す。成功しなかった場合は 0 を返す。拡張エラー情報を取得するには
GetLastError を呼び出すことができ、次のいずれかのエラーコードが返ることがある。
（以下省略）

[備考]
注意: この API は 2019 年 5
月の日本の改元に対応するために更新中である。アプリケーションが日本のカレンダーをサポートする場合、新しい時代を正しく扱えることを検証する必要がある。詳細は「日本の改元に向けてアプリケーションを準備する」を参照。この関数がサポートする最も古い日付は
1601 年 1 月 1 日である。曜日名、曜日略称、月名、月略称はすべてロケール識別子に基づいてローカライズされる。lpDate
が示す構造体内の日付値は有効でなければならない。関数は年、月、日、曜日の各日付値をチェックする。曜日が誤っている場合、関数は正しい値を使い、エラーを返さない。それ以外の日付値が正しい範囲外である場合、関数は失敗し、最後のエラーに
ERROR_INVALID_PARAMETER を設定する。関数は lpDate が示す SYSTEMTIME
構造体の時刻メンバ（wHour、wMinute、wSecond、wMilliseconds）を無視する。lpFormat
パラメータに不正な書式文字列が含まれている場合、関数はエラーを返さず、可能な限り最良の日付文字列を構築する。たとえば、有効な年のピクチャは
L"yyyy" と L"yy" のみであり、"L" は Unicode（16 ビット文字）文字列を示す。L"y" が渡された場合、関数は
L"yy" を仮定する。L"yyy" が渡された場合、関数は L"yyyy" を仮定する。4
文字を超える日（L"dddd"）または月（L"MMMM"）のピクチャが渡された場合、関数は L"dddd" または L"MMMM"
を既定とする。日付文字列内でそのままの形で残したいテキストを囲むには、アプリケーションは日付フォーマットピクチャ内で単一引用符を使う。単一引用符はエスケープ文字としても使え、単一引用符自体を日付文字列に表示できる。ただしエスケープシーケンスは
2 つの単一引用符で囲まなければならない。たとえば日付を "May '93" として表示するには、書式文字列は L"MMMM
''''yy" となる。最初と最後の単一引用符は囲み引用符である。2 番目と 3
番目の単一引用符は、世紀の前に単一引用符を表示するためのエスケープシーケンスである。日付ピクチャに数値形式の日（d または dd
のいずれか）と完全な月名（MMMM）の両方が含まれる場合、月名の属格形が日付文字列に取得される。実際の整形を行わずに既定の短い日付および長い日付形式を取得するには、アプリケーションは
GetLocaleInfoEx を LOCALE_SSHORTDATE または LOCALE_SLONGDATE
定数と共に使うべきである。代替カレンダーの日付形式を取得するには、アプリケーションは GetLocaleInfoEx を
LOCALE_IOPTIONALCALENDAR
定数と共に使う。特定のカレンダーの日付形式を取得するには、アプリケーションは適切なカレンダー識別子を渡して
GetCalendarInfoEx を使う。EnumCalendarInfoEx または EnumDateFormatsEx
を呼び出すことで特定のカレンダーの日付形式を取得することもできる。この関数はカスタムロケールからデータを取得することがある。データはコンピュータ間でもアプリケーションの実行間でも同じであることは保証されない。アプリケーションがデータを永続化または送信する必要がある場合は
Using Persistent Locale Data を参照。
（以下省略）


%index
GetDefaultCommConfigW
指定した通信デバイスの既定の構成を取得する。(Unicode)
%group
Win32 kernel32
%prm
lpszName, lpCC, lpdwSize
lpszName : [wstr] デバイスの名前。たとえば COM1 ～ COM9 はシリアルポートで、LPT1 ～ LPT9 はパラレルポートである。
lpCC : [var] COMMCONFIG 構造体を受け取るバッファへのポインタ。
lpdwSize : [var] lpCC が指すバッファのサイズをバイト単位で指定する変数へのポインタ。関数が戻ると、関数が成功した場合はコピーされたバイト数、バッファが小さすぎた場合は必要なバイト数がこの変数に格納される。
%inst
指定した通信デバイスの既定の構成を取得する。(Unicode)

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 である。拡張エラー情報を取得するには
GetLastError 関数を使う。

[備考]
> [!NOTE] > winbase.h ヘッダでは GetDefaultCommConfig が、UNICODE
プリプロセッサ定数の定義に応じて自動的に ANSI 版または Unicode
版を選択するエイリアスとして定義されている。エンコーディング中立のエイリアスを中立でないコードと混在させるとコンパイルや実行時のエラーになる可能性がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
GetDevicePowerState
指定したデバイスの現在の電源状態を取得する。
%group
Win32 kernel32
%prm
hDevice, pfOn
hDevice : [intptr] ファイルやソケットなどデバイス上のオブジェクトへのハンドル、またはデバイス自体へのハンドル。
pfOn : [var] 電源状態を受け取る変数へのポインタ。デバイスが動作状態である場合、この値は TRUE である。それ以外の場合は FALSE である。
%inst
指定したデバイスの現在の電源状態を取得する。

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 である。

[備考]
アプリケーションは GetDevicePowerState
を使って、デバイスが動作状態にあるか低電力状態にあるかを判定できる。デバイスが低電力状態にある場合、デバイスへのアクセスは I/O
要求のキューイングや失敗、あるいはデバイスを動作状態に遷移させる原因になる可能性がある。正確な動作はデバイスの実装に依存する。ノートパソコンで最大限のバッテリ寿命を確保するには、GetDevicePowerState
を使って消費電力を抑える。たとえばディスクが現在電源オフになっている場合、ディスクにアクセスするとスピンアップが発生し、消費電力が増えてバッテリ寿命が短くなる。アプリケーションはシステムがバッテリ電力で動作している間は、可能な限りデバイスへのアクセスを延期または制限すべきである。システムがバッテリ電力で動作しているかどうか、および残りのバッテリ寿命を判定するには
GetSystemPowerStatus 関数を使う。


%index
GetDiskFreeSpaceW
指定したディスクに関する情報（ディスクの空き領域量を含む）を取得する。(Unicode)
%group
Win32 kernel32
%prm
lpRootPathName, lpSectorsPerCluster, lpBytesPerSector, lpNumberOfFreeClusters, lpTotalNumberOfClusters
lpRootPathName : [wstr] 情報を返すディスクのルートディレクトリ。このパラメータが NULL の場合、関数は現在のディスクのルートを使う。このパラメータが UNC 名の場合、末尾にバックスラッシュを含めなければならない（例: "\\\\MyServer\\MyShare\\"）。さらに、ドライブ指定には末尾にバックスラッシュが必要である（例: "C:\\"）。呼び出し側のアプリケーションはこのディレクトリに対する FILE_LIST_DIRECTORY アクセス権を持っていなければならない。
lpSectorsPerCluster : [var] クラスタあたりのセクタ数を受け取る変数へのポインタ。
lpBytesPerSector : [var] セクタあたりのバイト数を受け取る変数へのポインタ。
lpNumberOfFreeClusters : [var] 呼び出し側スレッドに関連付けられたユーザーが利用可能な、ディスク上の空きクラスタ総数を受け取る変数へのポインタ。ユーザーごとのディスククォータが使われている場合、この値はディスク上の空きクラスタ総数より小さくなることがある。
lpTotalNumberOfClusters : [var] 呼び出し側スレッドに関連付けられたユーザーが利用可能な、ディスク上のクラスタ総数を受け取る変数へのポインタ。ユーザーごとのディスククォータが使われている場合、この値はディスク上のクラスタ総数より小さくなることがある。
%inst
指定したディスクに関する情報（ディスクの空き領域量を含む）を取得する。(Unicode)

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 である。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
GetDiskFreeSpaceEx 関数を使うと、GetDiskFreeSpace
関数で必要となる演算の一部を避けることができる。シンボリックリンクの動作:
パスがシンボリックリンクを指している場合、操作はターゲットに対して実行される。
> [!NOTE] > fileapi.h ヘッダでは GetDiskFreeSpace が、UNICODE
プリプロセッサ定数の定義に応じて自動的に ANSI 版または Unicode
版を選択するエイリアスとして定義されている。エンコーディング中立のエイリアスを中立でないコードと混在させるとコンパイルや実行時のエラーになる可能性がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
GetDiskFreeSpaceExW
ディスクボリューム上で利用可能な領域に関する情報、すなわち領域総量、空き領域総量、および呼び出し側スレッドに関連付けられたユーザーが利用可能な空き領域総量を取得する。(Unicode)
%group
Win32 kernel32
%prm
lpDirectoryName, lpFreeBytesAvailableToCaller, lpTotalNumberOfBytes, lpTotalNumberOfFreeBytes
lpDirectoryName : [wstr] ディスク上のディレクトリ。このパラメータが NULL の場合、関数は現在のディスクのルートを使う。このパラメータが UNC 名の場合、末尾にバックスラッシュを含めなければならない（例: "\\\\MyServer\\MyShare\\"）。このパラメータはディスク上のルートディレクトリを指定する必要はない。関数はディスク上の任意のディレクトリを受け付ける。呼び出し側のアプリケーションはこのディレクトリに対する FILE_LIST_DIRECTORY アクセス権を持っていなければならない。
lpFreeBytesAvailableToCaller : [var] 呼び出し側スレッドに関連付けられたユーザーが利用可能な、ディスク上の空きバイト総数を受け取る変数へのポインタ。このパラメータは NULL でもよい。ユーザーごとのクォータが使われている場合、この値はディスク上の空きバイト総数より小さくなることがある。
lpTotalNumberOfBytes : [var] 呼び出し側スレッドに関連付けられたユーザーが利用可能な、ディスク上のバイト総数を受け取る変数へのポインタ。このパラメータは NULL でもよい。ユーザーごとのクォータが使われている場合、この値はディスク上のバイト総数より小さくなることがある。ディスクまたはボリュームのバイト総数を判定するには IOCTL_DISK_GET_LENGTH_INFO を使う。
lpTotalNumberOfFreeBytes : [var] ディスク上の空きバイト総数を受け取る変数へのポインタ。このパラメータは NULL でもよい。
%inst

ディスクボリューム上で利用可能な領域に関する情報、すなわち領域総量、空き領域総量、および呼び出し側スレッドに関連付けられたユーザーが利用可能な空き領域総量を取得する。(Unicode)

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 である。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
この関数で取得される値は ULARGE_INTEGER 型である。これらの値を 32
ビットに切り詰めてはならない。GetDiskFreeSpaceEx 関数は、CD-RW ドライブ内の未書き込み CD でない限り、すべての
CD 要求に対して lpTotalNumberOfFreeBytes と lpFreeBytesAvailable に 0
を返す。シンボリックリンクの動作: パスがシンボリックリンクを指している場合、操作はターゲットに対して実行される。
> [!NOTE] > fileapi.h ヘッダでは GetDiskFreeSpaceEx が、UNICODE
プリプロセッサ定数の定義に応じて自動的に ANSI 版または Unicode
版を選択するエイリアスとして定義されている。エンコーディング中立のエイリアスを中立でないコードと混在させるとコンパイルや実行時のエラーになる可能性がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
GetDllDirectoryW
アプリケーションが DLL を見つけるために使う検索パスのアプリケーション固有部分を取得する。(Unicode)
%group
Win32 kernel32
%prm
nBufferLength, lpBuffer
nBufferLength : [int] 出力バッファのサイズ。文字数で指定する。
lpBuffer : [wstr] 検索パスのアプリケーション固有部分を受け取るバッファへのポインタ。
%inst
アプリケーションが DLL を見つけるために使う検索パスのアプリケーション固有部分を取得する。(Unicode)

[戻り値]
関数が成功した場合、戻り値は lpBuffer にコピーされた文字列の長さ（文字数）であり、終端 NULL 文字は含まない。戻り値が
nBufferLength より大きい場合、それはパスに必要なバッファサイズを示す。関数が失敗した場合、戻り値は 0
である。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
この関数を使うアプリケーションをコンパイルするには、_WIN32_WINNT を 0x0502 以降として定義する。詳細は Using
the Windows Headers を参照。
> [!NOTE] > winbase.h ヘッダでは GetDllDirectory が、UNICODE
プリプロセッサ定数の定義に応じて自動的に ANSI 版または Unicode
版を選択するエイリアスとして定義されている。エンコーディング中立のエイリアスを中立でないコードと混在させるとコンパイルや実行時のエラーになる可能性がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
GetDriveTypeW
ディスクドライブがリムーバブル、固定、CD-ROM、RAM ディスク、ネットワークのいずれであるかを判定する。(Unicode)
%group
Win32 kernel32
%prm
lpRootPathName
lpRootPathName : [wstr] ドライブのルートディレクトリ。
%inst
ディスクドライブがリムーバブル、固定、CD-ROM、RAM ディスク、ネットワークのいずれであるかを判定する。(Unicode)

[戻り値]
戻り値はドライブの種類を示し、次のいずれかの値となる。
（以下省略）

[備考]
Windows 8 および Windows Server 2012 では、この関数は次の技術によりサポートされる。
（以下省略）


%index
GetDurationFormat
識別子で指定したロケール用に時間長を時刻文字列として整形する。
%group
Win32 kernel32
%prm
Locale, dwFlags, lpDuration, ullDuration, lpFormat, lpDurationStr, cchDuration
Locale : [int] この関数が時間長を整形するロケールを指定するロケール識別子。MAKELCID マクロでロケール識別子を作成することも、次の定義済み値のいずれかを使うこともできる。
dwFlags : [int] 関数オプションを指定するフラグ。lpFormat が NULL でない場合、このパラメータは 0 に設定する必要がある。lpFormat が NULL の場合、アプリケーションは LOCALE_NOUSEROVERRIDE を指定して、指定したロケールのシステム既定の時間長形式を使って文字列を整形できる。注意: LOCALE_NOUSEROVERRIDE の使用はユーザー設定を無効にするため、強く推奨されない。
lpDuration : [var] 整形対象の時間長情報を含む SYSTEMTIME 構造体へのポインタ。このポインタが NULL の場合、関数はこのパラメータを無視し、ullDuration を使う。
ullDuration : [int64] 時間長における 100 ナノ秒間隔の数を表す 64 ビット符号なし整数。lpDuration と ullDuration の両方が存在する場合、lpDuration が優先される。lpDuration が NULL に設定され、ullDuration が 0 に設定されている場合、時間長は 0 となる。
lpFormat : [wstr] 書式文字列へのポインタ。詳細は GetDurationFormatEx の lpFormat パラメータを参照。
lpDurationStr : [wstr] 時間長文字列をこの関数が取得するバッファへのポインタ。あるいは、cchDuration が 0 に設定されている場合、このパラメータには NULL を指定できる。その場合、関数は時間長文字列バッファに必要なサイズを返す。
cchDuration : [int] lpDurationStr が示すバッファのサイズ。文字数で指定する。あるいは、アプリケーションはこのパラメータを 0 に設定することもできる。その場合、関数は lpDurationStr に NULL を取得し、時間長文字列バッファに必要なサイズを返す。
%inst
識別子で指定したロケール用に時間長を時刻文字列として整形する。

[戻り値]
成功した場合、lpDurationStr が示すバッファに取得された文字数を返す。lpDurationStr が NULL
に設定され、cchDuration が 0 に設定されている場合、関数は終端 NULL
文字を含む時間長文字列バッファに必要なサイズを返す。たとえば 10 文字がバッファに書き込まれる場合、関数は終端 NULL 文字を含めた
11 を返す。成功しなかった場合は 0 を返す。拡張エラー情報を取得するには GetLastError
を呼び出すことができ、次のいずれかのエラーコードが返ることがある。
（以下省略）

[備考]
GetDurationFormatEx の Remarks を参照。


%index
GetDurationFormatEx
名前で指定したロケールに対し、時間の期間をタイム文字列として整形する。
%group
Win32 kernel32
%prm
lpLocaleName, dwFlags, lpDuration, ullDuration, lpFormat, lpDurationStr, cchDuration
lpLocaleName : [wstr] ロケール名へのポインタ、または以下の定義済み値のいずれか。
dwFlags : [int] 関数の動作を指定するフラグ。lpFormat が NULL でない場合、このパラメータは 0 に設定する必要がある。lpFormat が NULL の場合、アプリケーションは LOCALE_NOUSEROVERRIDE を指定して、指定したロケールのシステム既定の期間書式を用いて文字列を整形できる。注意: LOCALE_NOUSEROVERRIDE はユーザー設定を無効化するため、使用は強く非推奨である。
lpDuration : [var] 整形対象の期間情報を保持する SYSTEMTIME 構造体へのポインタ。本パラメータを無視して ullDuration を使用させたい場合、アプリケーションは NULL を設定する。
ullDuration : [int64] 期間に含まれる 100 ナノ秒間隔の数を表す 64 ビット符号なし整数。lpDuration と ullDuration の両方が設定されている場合、lpDuration パラメータが優先される。lpDuration が NULL かつ ullDuration が 0 の場合、期間は 0 になる。
lpFormat : [wstr] 後述する文字を含む書式文字列へのポインタ。指定したロケールの期間書式に従って文字列を整形する場合、アプリケーションは本パラメータに NULL を設定できる。lpFormat が NULL でない場合、関数は書式ピクチャ文字列で指定されていない情報のみロケールから参照する。
lpDurationStr : [wstr] 関数が期間文字列を取得するバッファへのポインタ。cchDuration が 0 の場合、本パラメータは NULL を取得することもできる。この場合、関数は期間文字列バッファに必要なサイズを返す。
cchDuration : [int] lpDurationStr が示すバッファのサイズ。文字数で指定する。あるいは、アプリケーションはこのパラメータを 0 に設定することもできる。その場合、関数は lpDurationStr に NULL を取得し、時間長文字列バッファに必要なサイズを返す。
%inst
名前で指定したロケールに対し、時間の期間をタイム文字列として整形する。

[戻り値]
成功した場合、lpDurationStr が示すバッファに取得した文字数を返す。lpDurationStr が NULL かつ
cchDuration が 0 の場合、関数は終端の null 文字を含む期間文字列バッファに必要なサイズを返す。例えば 10
文字をバッファに書き込む場合、終端の null 文字を含めて 11 を返す。関数が成功しなかった場合は 0
を返す。拡張エラー情報を取得するには GetLastError を呼ぶ。アプリケーションは以下のエラーコードのいずれかを取得できる。
（以下省略）

[備考]

本関数は、ファイル時刻を表示するマルチメディアアプリケーションや、フィニッシュタイムを表示するスポーツイベントアプリケーションで利用できる。本関数は
[SYSTEMTIME](https://learn.microsoft.com/en-us/windows/win32/api/minwinbase/ns-minwinbase-systemtime)
構造体の最初の 3 つのメンバ **wYear**、**wMonth**、**wDayOfWeek**
を無視する。本関数はカスタムロケールからもデータを取得できる。データはコンピュータ間やアプリケーションの実行間で同一であることは保証されない。アプリケーションがデータを永続化または送信する必要がある場合は、Using
Persistent Locale Data を参照すること。期間書式文字列の特徴は次のとおりである。
（以下省略）


%index
GetDynamicTimeZoneInformation
現在のタイムゾーンと動的な夏時間設定を取得する。これらの設定は協定世界時 (UTC) とローカル時刻間の変換を制御する。
%group
Win32 kernel32
%prm
pTimeZoneInformation
pTimeZoneInformation : [var] DYNAMIC_TIME_ZONE_INFORMATION 構造体へのポインタ。
%inst
現在のタイムゾーンと動的な夏時間設定を取得する。これらの設定は協定世界時 (UTC) とローカル時刻間の変換を制御する。

[戻り値]
関数が成功した場合、以下の値のいずれかを返す。
（以下省略）

[備考]
結果として得られる DYNAMIC_TIME_ZONE_INFORMATION 構造体の StandardName および
DaylightName メンバは、現在のユーザー既定の UI 言語に従ってローカライズされる。


%index
GetEnvironmentStrings
GetEnvironmentStrings 関数 (processenv.h) は、現在のプロセスの環境変数を取得する。
%group
Win32 kernel32
%prm

%inst
GetEnvironmentStrings 関数 (processenv.h) は、現在のプロセスの環境変数を取得する。

[戻り値]
関数が成功した場合、戻り値は現在のプロセスの環境ブロックへのポインタである。失敗した場合の戻り値は NULL である。

[備考]
GetEnvironmentStrings
関数は、呼び出し側プロセスの環境変数（システム環境変数とユーザー環境変数の両方）を含むメモリブロックへのポインタを返す。各環境ブロックは次の形式で環境変数を保持する:
*Var1*=*Value1*\0 *Var2*=*Value2*\0 *Var3*=*Value3*\0 ...
*VarN*=*ValueN*\0\0 環境変数名に等号 (=)
を含めることはできない。このメモリは読み取り専用として扱い、直接変更してはならない。環境変数を追加・変更するには、GetEnvironmentVariable
と SetEnvironmentVariable 関数を使用する。GetEnvironmentStrings
が返したブロックが不要になった場合は、FreeEnvironmentStrings 関数を呼んで解放すること。なお ANSI 版の
GetEnvironmentStringsA は OEM 文字を返す。


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
GetErrorMode
現在のプロセスのエラーモードを取得する。
%group
Win32 kernel32
%prm

%inst
現在のプロセスのエラーモードを取得する。

[戻り値]
プロセスのエラーモード。本関数は以下の値のいずれかを返す。
（以下省略）

[備考]

各プロセスは、深刻なエラーに対してアプリケーションがどう応答するかをシステムに伝えるエラーモードを持つ。子プロセスは親プロセスのエラーモードを継承する。プロセスのエラーモードを変更するには
SetErrorMode 関数を使用する。Windows 7: 呼び出し側はシステム全体の通常動作への影響が小さい
SetThreadErrorMode の使用を SetErrorMode より優先するべきである。GetThreadErrorMode が
GetErrorMode に対応する取得関数である。


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
GetExitCodeThread
指定したスレッドの終了状態を取得する。
%group
Win32 kernel32
%prm
hThread, lpExitCode
hThread : [intptr] スレッドへのハンドル。ハンドルは THREAD_QUERY_INFORMATION または THREAD_QUERY_LIMITED_INFORMATION アクセス権を持つ必要がある。詳細は Thread Security and Access Rights を参照。Windows Server 2003 および Windows XP: ハンドルは THREAD_QUERY_INFORMATION アクセス権を持つ必要がある。
lpExitCode : [var] スレッドの終了状態を受け取る変数へのポインタ。詳細は注釈を参照。
%inst
指定したスレッドの終了状態を取得する。

[戻り値]
関数が成功した場合、戻り値は 0 以外である。失敗した場合の戻り値は 0 である。拡張エラー情報を取得するには GetLastError
を呼ぶ。

[備考]
本関数は直ちに復帰する。指定したスレッドが終了しておらず、関数が成功した場合、返される状態は STILL_ACTIVE
である。スレッドが終了し、関数が成功した場合、返される状態は以下の値のいずれかである。
（以下省略）


%index
GetExpandedNameW
Lempel-Ziv アルゴリズムで圧縮されたファイルについて、元のファイル名を取得する。(Unicode)
%group
Win32 kernel32
%prm
lpszSource, lpszBuffer
lpszSource : [wstr] 圧縮ファイルの名前。
lpszBuffer : [wstr] 圧縮ファイルの元の名前を受け取るバッファへのポインタ。
%inst
Lempel-Ziv アルゴリズムで圧縮されたファイルについて、元のファイル名を取得する。(Unicode)

[戻り値]
関数が成功した場合の戻り値は 1 である。失敗した場合の戻り値は LZERROR_BADVALUE
である。本関数には拡張エラー情報はない。GetLastError は呼ばないこと。注: GetExpandedName は
SetLastError も SetLastErrorEx も呼ばないため、失敗してもスレッドの直近エラーコードには影響しない。

[備考]
lpszBuffer が指すバッファの内容は、ファイルが /r オプションで圧縮された場合は元のファイル名となる。/r
オプションが使われていない場合、本関数は lpszSource パラメータの名前を lpszBuffer
バッファに複製する。Windows 8 および Windows Server 2012 では、本関数は以下の技術によりサポートされている。
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
GetFileAttributesExW
指定したファイルまたはディレクトリの属性を取得する。(Unicode)
%group
Win32 kernel32
%prm
lpFileName, fInfoLevelId, lpFileInformation
lpFileName : [wstr] ファイルまたはディレクトリの名前。本関数の ANSI 版では名前は MAX_PATH 文字に制限される。この制限を 32,767 ワイド文字に拡張するには、Unicode 版 (GetFileAttributesExW) を呼び、パスの先頭に "\\?\" を付加する。詳細は Naming a File を参照。ヒント: Windows 10 バージョン 1607 以降、Unicode 版 (GetFileAttributesExW) では "\\?\" を付加せずに MAX_PATH 文字制限を解除するオプトインが可能。詳細は Naming Files, Paths, and Namespaces の "Maximum Path Limitation" 節を参照。
fInfoLevelId : [int] 取得する属性情報のクラス。本パラメータは GET_FILEEX_INFO_LEVELS 列挙体の以下の値を指定できる。
lpFileInformation : [intptr] 属性情報を受け取るバッファへのポインタ。このバッファに格納される属性情報の型は fInfoLevelId の値で決まる。
%inst
指定したファイルまたはディレクトリの属性を取得する。(Unicode)

[戻り値]
関数が成功した場合の戻り値は 0 以外である。失敗した場合の戻り値は 0 である。拡張エラー情報を取得するには GetLastError
を呼ぶ。

[備考]
GetFileAttributes 関数はファイルシステム属性情報を取得する。GetFileAttributesEx
は他のセットのファイルまたはディレクトリの属性情報を取得できる。現時点では GetFileAttributesEx
は、ファイルシステム属性情報のスーパーセットである標準属性のセットを取得する。マウントフォルダであるディレクトリに対して
GetFileAttributesEx
を呼び出した場合、そのディレクトリの属性を返し、マウントフォルダが関連付けられているボリュームのルートディレクトリの属性は返さない。関連付けられたボリュームの属性を取得するには、GetVolumeNameForVolumeMountPoint
を呼んで関連ボリュームの名前を取得し、その名前を使って GetFileAttributesEx
を呼ぶ。結果は関連ボリュームのルートディレクトリの属性となる。Windows 8 および Windows Server 2012
では、本関数は以下の技術によりサポートされている。
（以下省略）


%index
GetFileAttributesTransactedW
指定したファイルまたはディレクトリのファイルシステム属性をトランザクション操作として取得する。(Unicode)
%group
Win32 kernel32
%prm
lpFileName, fInfoLevelId, lpFileInformation, hTransaction
lpFileName : [wstr] ファイルまたはディレクトリの名前。
fInfoLevelId : [int] 取得する属性情報のレベル。
lpFileInformation : [intptr] 属性情報を受け取るバッファへのポインタ。
hTransaction : [intptr] トランザクションへのハンドル。このハンドルは CreateTransaction 関数によって返される。
%inst
指定したファイルまたはディレクトリのファイルシステム属性をトランザクション操作として取得する。(Unicode)

[戻り値]
関数が成功した場合の戻り値は 0 以外である。失敗した場合の戻り値は 0 である。拡張エラー情報を取得するには GetLastError
を呼ぶ。

[備考]
マウントフォルダであるディレクトリに対して GetFileAttributesTransacted
を呼び出した場合、そのディレクトリの属性を返し、マウントフォルダが関連付けられているボリュームのルートディレクトリの属性は返さない。関連付けられたボリュームの属性を取得するには、GetVolumeNameForVolumeMountPoint
を呼んで関連ボリュームの名前を取得し、その名前を使って GetFileAttributesTransacted
を呼ぶ。結果は関連ボリュームのルートディレクトリの属性となる。Windows 8 および Windows Server 2012
では、本関数は以下の技術によりサポートされている。
（以下省略）


%index
GetFileBandwidthReservation
指定したファイルが存在するボリュームの帯域予約プロパティを取得する。
%group
Win32 kernel32
%prm
hFile, lpPeriodMilliseconds, lpBytesPerPeriod, pDiscardable, lpTransferSize, lpNumOutstandingRequests
hFile : [intptr] ファイルへのハンドル。
lpPeriodMilliseconds : [var] 予約期間（ミリ秒単位）を受け取る変数へのポインタ。期間とは、I/O がカーネルに発行されてから完了すべき時刻までの時間である。本ハンドルに帯域が予約されていない場合、返される値はそのボリュームでサポートされる最小予約期間である。
lpBytesPerPeriod : [var] ボリューム上で予約可能な期間あたりの最大バイト数を受け取る変数へのポインタ。本ハンドルに帯域が予約されていない場合、返される値はそのボリュームでサポートされる期間あたりの最大バイト数である。
pDiscardable : [var] 期間内にドライバが I/O 操作を満たせない場合に I/O をエラーで完了させる必要がある場合は TRUE。下位サブシステムがこの方式での失敗をサポートしない場合は FALSE。
lpTransferSize : [var] アプリケーションが発行する個々の I/O 要求の最小サイズ。すべての I/O 要求は TransferSize の倍数であるべきである。本ハンドルに帯域が予約されていない場合、返される値はそのボリュームでサポートされる最小転送サイズである。
lpNumOutstandingRequests : [var] オペレーティングシステムに対して未処理のまま許される TransferSize チャンクの数。
%inst
指定したファイルが存在するボリュームの帯域予約プロパティを取得する。

[戻り値]
成功した場合は 0 以外、それ以外は 0 を返す。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
Windows 8 および Windows Server 2012 では、本関数は以下の技術によりサポートされている。
（以下省略）


%index
GetFileInformationByHandle
指定したファイルのファイル情報を取得する。(GetFileInformationByHandle)
%group
Win32 kernel32
%prm
hFile, lpFileInformation
hFile : [intptr] 取得する情報を含むファイルへのハンドル。このハンドルはパイプハンドルであってはならない。
lpFileInformation : [var] ファイル情報を受け取る BY_HANDLE_FILE_INFORMATION 構造体へのポインタ。
%inst
指定したファイルのファイル情報を取得する。(GetFileInformationByHandle)

[戻り値]
関数が成功した場合の戻り値は 0 以外であり、ファイル情報データは lpFileInformation
が指すバッファに格納される。失敗した場合の戻り値は 0 である。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
オペレーティングシステムの基盤となるネットワーク機能や接続先サーバーの種類によっては、GetFileInformationByHandle
関数は失敗したり、部分的または完全な情報を返したりすることがある。BY_HANDLE_FILE_INFORMATION 構造体で返される
VolumeSerialNumber と FileIndex メンバを比較すれば、2 つのパスが同じ対象を指しているかを判定できる。例えば
2 つのファイルパスが同じディレクトリを指しているかを判定できる。Windows 8 および Windows Server 2012
では、本関数は以下の技術によりサポートされている。
（以下省略）


%index
GetFileInformationByHandleEx
指定したファイルのファイル情報を取得する。(GetFileInformationByHandleEx)
%group
Win32 kernel32
%prm
hFile, FileInformationClass, lpFileInformation, dwBufferSize
hFile : [intptr] 取得する情報を含むファイルへのハンドル。このハンドルはパイプハンドルであってはならない。
FileInformationClass : [int] 取得する情報の種別を指定する FILE_INFO_BY_HANDLE_CLASS 列挙値。有効な値の一覧は注釈を参照。
lpFileInformation : [intptr] 要求したファイル情報を受け取るバッファへのポインタ。返される構造体は FileInformationClass で指定したクラスに対応する。有効な構造体型の表は注釈を参照。
dwBufferSize : [int] lpFileInformation バッファのサイズ（バイト単位）。
%inst
指定したファイルのファイル情報を取得する。(GetFileInformationByHandleEx)

[戻り値]
関数が成功した場合の戻り値は 0 以外であり、ファイル情報データは lpFileInformation
が指すバッファに格納される。失敗した場合の戻り値は 0 である。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
FileInformationClass が FileStreamInfo
で、呼び出しは成功したがストリームが返されなかった場合、GetLastError が返すエラーは ERROR_HANDLE_EOF
となる。一部のファイル情報クラスは、オペレーティングシステムのリリースによって挙動がわずかに異なる。これらのクラスは下位ドライバによってサポートされており、返される情報は
OS リリースごとに変わり得る。本関数で使用可能なファイル情報クラス型と対応データ構造体型を以下の表に示す。
（以下省略）


%index
GetFileMUIInfo
ファイルに関するリソース関連情報を取得する。
%group
Win32 kernel32
%prm
dwFlags, pcwszFilePath, pFileMUIInfo, pcbFileMUIInfo
dwFlags : [int] 取得する情報を指定するフラグ。次のフラグの任意の組み合わせを指定できる。フラグの既定値は MUI_QUERY_TYPE | MUI_QUERY_CHECKSUM である。
pcwszFilePath : [wstr] ファイルへのパスを示す null 終端文字列へのポインタ。通常、ファイルは LN ファイルか言語固有リソースファイルのいずれかである。これらの種類のいずれでもない場合、関数が取得する有意な値は MUI_FILETYPE_NOT_LANGUAGE_NEUTRAL のみである。本関数はこの値を MUI_QUERY_RESOURCE_TYPES フラグが設定されている場合にのみ取得する。
pFileMUIInfo : [var] FILEMUIINFO 構造体および場合によってはその後ろに続くデータとしてファイル情報を保持するバッファへのポインタ。情報バッファは構造体自体のサイズよりはるかに大きくなる場合がある。フラグ設定によっては、本関数は構造体の後ろに、構造体内で取得されるオフセットを使って大量の情報を格納し得る。詳細は注釈を参照。pcbFileMUIInfo を 0 に設定する場合、本パラメータを NULL にすることもできる。この場合、関数は情報バッファに必要なサイズを pcbFileMUIInfo に取得する。注: pFileMUIInfo の値が NULL でない場合、dwSize メンバは FILEMUIINFO 構造体（情報バッファを含む）のサイズに設定し、dwVersion メンバは現在のバージョン 0x001 に設定する必要がある。
pcbFileMUIInfo : [var] pFileMUIInfo が示すファイル情報のバッファサイズ（バイト単位）へのポインタ。関数からの正常復帰後、本パラメータには取得したファイル情報バッファとそれを含む FILEMUIINFO 構造体のサイズが格納される。pFileMUIInfo に NULL を設定する場合、本パラメータを 0 にすることもできる。この場合、関数は必要なファイル情報バッファサイズを pcbFileMUIInfo に取得する。正しい量のメモリを確保するには、この値に FILEMUIINFO 構造体自体のサイズを加える必要がある。注: pFileMUIInfo の値が NULL でない場合、本パラメータの値は FILEMUIINFO の dwSize メンバの値と一致しなければならない。
%inst
ファイルに関するリソース関連情報を取得する。

[戻り値]
成功した場合は TRUE、それ以外は FALSE を返す。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
MUI_QUERY_LANGUAGE_NAME フラグの場合、本関数は dwLanguageNameOffset メンバに
FILEMUIINFO
の先頭からのオフセット（バイト単位）を取得する。以下は入力ファイルに関連付けられた言語名にアクセスするサンプルコードである。
（以下省略）


%index
GetFileMUIPath
指定した LN ファイルに関連するすべての言語固有リソースファイルへのパスを取得する。アプリケーションは各リソースファイルのパスを取得するため本関数を繰り返し呼ぶ必要がある。
%group
Win32 kernel32
%prm
dwFlags, pcwszFilePath, pwszLanguage, pcchLanguage, pwszFileMUIPath, pcchFileMUIPath, pululEnumerator
dwFlags : [int] 言語の形式とフィルタリングを指定するフラグ。以下のフラグは pwszLanguage が示す言語の形式を指定する。これらのフラグは互いに排他的であり、既定は MUI_LANGUAGE_NAME である。
pcwszFilePath : [wstr] ファイルパスを指定する null 終端文字列へのポインタ。パスは既存の LN ファイル、または .txt、.inf、.msc などのファイルのいずれかである。ファイルが LN ファイルの場合、関数は関連する言語固有リソースを含むファイルを探す。それ以外の種類のファイルでは、関数は指定されたファイル名とパスに完全に一致するファイルを探す。アプリケーションは MUI_LANG_NEUTRAL_PE_FILE または MUI_NON_LANG_NEUTRAL_FILE フラグを使って、ファイル種別チェックの動作を上書きできる。詳細は注釈を参照。注: 指定するファイルパスはネットワークパスでもよい。例: "\\machinename\c$\windows\system32\notepad.exe"。
pwszLanguage : [wstr] 言語文字列を保持するバッファへのポインタ。入力時、このバッファには dwFlags の設定に応じて、アプリケーションが言語固有リソースファイルを探す対象の言語識別子または言語名が含まれる。関数からの正常復帰後、本パラメータには関数が見つけた言語固有リソースファイルの言語が含まれる。pcchLanguage が参照する値を 0 に設定したうえで、本パラメータを NULL にすることもできる。この場合、関数は必要なバッファサイズを pcchLanguage に取得する。
pcchLanguage : [var] pwszLanguage が示す言語文字列のバッファサイズ（文字単位）へのポインタ。アプリケーションが本パラメータが参照する値を 0 に設定し、pwszLanguage に NULL を渡した場合、必要なバッファサイズが pcchLanguage に返され、返されるバッファサイズは常に LOCALE_NAME_MAX_LENGTH である。これは本関数が通常連続して何度も呼ばれるためであり、関数は連続呼び出しのすべてに対して正確な言語名サイズを判別できず、後続呼び出しでバッファを拡張することもできないため、LOCALE_NAME_MAX_LENGTH のみが安全な最大値となる。
pwszFileMUIPath : [wstr] 言語固有リソースファイルへのパスを保持するバッファへのポインタ。このバッファはサイズ MAX_PATH で確保することを強く推奨する。pcchFileMUIPath が参照する値を 0 に設定する場合、本パラメータは NULL を取得することもできる。この場合、関数は必要なファイルパスバッファサイズを pcchFileMUIPath に取得する。
pcchFileMUIPath : [var] pwszFileMUIPath が示すファイルパスのバッファサイズ（文字単位）へのポインタ。関数からの正常復帰後、本パラメータには取得したファイルパスのサイズが格納される。アプリケーションが本パラメータが参照する値を 0 に設定すると、関数は pwszFileMUIPath に NULL を取得し、必要なバッファサイズを pcchFileMUIPath に返す。返されるバッファサイズは常に MAX_PATH である。これは本関数が通常連続して何度も呼ばれるためであり、関数は連続呼び出しのすべてに対して正確なパスサイズを判別できず、後続呼び出しでバッファを拡張することもできないため、MAX_PATH のみが安全な最大値となる。
pululEnumerator : [var] 列挙変数へのポインタ。本関数を最初に呼ぶときは、変数の値を 0 にする必要がある。後続の呼び出しの間、アプリケーションは本パラメータの値を変更してはならない。関数がすべての可能な言語固有リソースファイルパスを取得し終えた後は、FALSE を返す。
%inst
指定した LN
ファイルに関連するすべての言語固有リソースファイルへのパスを取得する。アプリケーションは各リソースファイルのパスを取得するため本関数を繰り返し呼ぶ必要がある。

[戻り値]
成功した場合は TRUE、それ以外は FALSE を返す。関数が失敗した場合、出力パラメータは変更されない。拡張エラー情報を取得するには
GetLastError を呼ぶ。次のエラーコードのいずれかが返ることがある。
（以下省略）

[備考]
本関数は言語固有リソースファイルが存在することは検証するが、それらが正しいかどうかは検証しない。本関数は Application
Deployment で説明されている保管規約に従ってリソースファイルが格納されていることを要求する。本関数の呼び出しで
MUI_LANGUAGE_ID フラグを指定する場合、指定する言語文字列は先頭の 0x を含まない 16 進言語識別子で長さ 4
文字でなければならない。例えば en-US は "0409"、en は "0009"
として渡す。返される言語文字列も同じ形式である。MUI_LANGUAGE_ID を指定する場合、指定する言語文字列の各 16
進値は実際の言語識別子を表していなければならない。特に、以下のロケールに対応する値は指定できない。
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
GetFileSizeEx
指定したファイルのサイズを取得する。
%group
Win32 kernel32
%prm
hFile, lpFileSize
hFile : [intptr] ファイルへのハンドル。ハンドルは FILE_READ_ATTRIBUTES アクセス権または同等のもので作成されているか、呼び出し側がそのファイルを含むディレクトリに対し十分なアクセス権を持つ必要がある。詳細は File Security and Access Rights を参照。
lpFileSize : [var] ファイルサイズ（バイト単位）を受け取る LARGE_INTEGER 構造体へのポインタ。
%inst
指定したファイルのサイズを取得する。

[戻り値]
関数が成功した場合の戻り値は 0 以外である。失敗した場合の戻り値は 0 である。拡張エラー情報を取得するには GetLastError
を呼ぶ。

[備考]
トランザクション操作:
ファイルハンドルにトランザクションがバインドされている場合、関数は分離されたファイルビューの情報を返す。Windows ストアアプリ:
GetFileSizeEx はサポートされない。代わりに GetFileInformationByHandleEx
を使用する。Windows 8 および Windows Server 2012 では、本関数は以下の技術によりサポートされている。
（以下省略）


%index
GetFileTime
ファイルまたはディレクトリの作成日時、最終アクセス日時、最終更新日時を取得する。
%group
Win32 kernel32
%prm
hFile, lpCreationTime, lpLastAccessTime, lpLastWriteTime
hFile : [intptr] 日付と時刻を取得するファイルまたはディレクトリへのハンドル。ハンドルは GENERIC_READ アクセス権付きで CreateFile 関数によって作成されている必要がある。詳細は File Security and Access Rights を参照。
lpCreationTime : [var] ファイルまたはディレクトリが作成された日時を受け取る FILETIME 構造体へのポインタ。アプリケーションがこの情報を必要としない場合、本パラメータを NULL にできる。
lpLastAccessTime : [var] ファイルまたはディレクトリに最後にアクセスした日時を受け取る FILETIME 構造体へのポインタ。最終アクセス時刻は、ファイルまたはディレクトリへの最後の書き込み・読み取り、実行可能ファイルの場合は最後の実行を含む。アプリケーションがこの情報を必要としない場合、本パラメータを NULL にできる。
lpLastWriteTime : [var] ファイルまたはディレクトリに最後に書き込み・切り詰め・上書き（例えば WriteFile や SetEndOfFile による）が行われた日時を受け取る FILETIME 構造体へのポインタ。この日時は、ファイル属性やセキュリティ記述子が変更されても更新されない。アプリケーションがこの情報を必要としない場合、本パラメータを NULL にできる。
%inst
ファイルまたはディレクトリの作成日時、最終アクセス日時、最終更新日時を取得する。

[戻り値]
関数が成功した場合の戻り値は 0 以外である。失敗した場合の戻り値は 0 である。拡張エラー情報を取得するには GetLastError
を呼ぶ。

[備考]
すべてのファイルシステムが作成時刻と最終アクセス時刻を記録できるわけではなく、また同じ方法で記録するとも限らない。例えば FAT
では、作成時刻の解像度は 10 ミリ秒、書き込み時刻の解像度は 2 秒、アクセス時刻の解像度は 1
日（実質はアクセス日付）である。したがって GetFileTime 関数が返すファイル時刻情報は SetFileTime
関数で設定したものと同じになるとは限らない。NTFS は、最終アクセス時刻の更新を最後のアクセスから最大 1 時間遅らせる。NTFS
は最終アクセス時刻の更新を無効化することもできる。NTFS ボリュームでは既定で最終アクセス時刻は更新されない。Windows
Server 2003 および Windows XP: NTFS ボリュームでは既定で最終アクセス時刻が更新される。詳細は File
Times を参照。ファイルの名前を変更したり削除した直後に復元する場合、Windows
は復元するファイル情報をキャッシュから検索する。キャッシュされる情報には短い名前と長い名前のペアおよび作成時刻が含まれる。


%index
GetFileType
指定したファイルのファイル種別を取得する。
%group
Win32 kernel32
%prm
hFile
hFile : [intptr] ファイルへのハンドル。
%inst
指定したファイルのファイル種別を取得する。

[戻り値]
本関数は以下の値のいずれかを返す。
（以下省略）

[備考]
Windows 8 および Windows Server 2012 では、本関数は以下の技術によりサポートされている。
（以下省略）


%index
GetFinalPathNameByHandleW
指定したファイルの最終パスを取得する。(Unicode)
%group
Win32 kernel32
%prm
hFile, lpszFilePath, cchFilePath, dwFlags
hFile : [intptr] ファイルまたはディレクトリへのハンドル。
lpszFilePath : [wstr] hFile のパスを受け取るバッファへのポインタ。
cchFilePath : [int] lpszFilePath のサイズ（TCHAR 単位）。この値は NULL 終端文字を含む必要がある。
dwFlags : [int] 
%inst
指定したファイルの最終パスを取得する。(Unicode)

[戻り値]
関数が成功した場合の戻り値は lpszFilePath が受け取った文字列の長さ（TCHAR 単位）である。この値には終端 null
文字のサイズは含まれない。Windows Server 2008 および Windows Vista: 本関数の ANSI 版
GetFinalPathNameByHandleA では、戻り値は終端 null 文字のサイズを含む。lpszFilePath
が文字列と終端 null 文字を保持するには小さすぎたために失敗した場合、戻り値は必要なバッファサイズ（TCHAR
単位）であり、この値には終端 null 文字のサイズが含まれる。それ以外の理由で失敗した場合の戻り値は 0
である。拡張エラー情報を取得するには GetLastError を呼ぶ。
（以下省略）

[備考]
Server Message Block (SMB) プロトコルは正規化済みパスのクエリをサポートしない。そのため、SMB
経由で開いたファイルのハンドルと FILE_NAME_NORMALIZED
フラグを指定して本関数を呼ぶと、関数はパスを構成要素に分割し、各構成要素の正規化名を順次クエリしようとする。ユーザーがそれらの構成要素のいずれかへのアクセス権を持っていない場合、関数呼び出しは
ERROR_ACCESS_DENIED で失敗する。最終パスとは、パスが完全に解決されたときに返されるパスである。例えば
"C:\tmp\mydir" という "D:\yourdir" を指すシンボリックリンクの場合、最終パスは "D:\yourdir"
となる。VOLUME_NAME_DOS を使用すると、本関数が返す文字列は "\\?\" 構文を使用する。詳細は CreateFile
を参照。VOLUME_NAME_GUID を使用すると、返されるパスは
"\\?\Volume{xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx}\" のような形式のボリューム GUID
パスで始まる。VOLUME_NAME_NT を使用すると、返されるパスは NT
デバイスオブジェクト用であり、"\Device\HarddiskVolume1\"
のようなデバイス名で始まる。この種類のパスは相対パスのように見えるため、Windows
プログラムが直接使用することはできない。一部のサードパーティドライバは Mount Manager
を使わずにドライブレターやマウントポイントを作成できる。Mount Manager
がドライブの作成に使われていない場合、VOLUME_NAME_DOS や VOLUME_NAME_GUID
は成功せず、VOLUME_NAME_NT
のみが利用可能である。ボリュームデバイスパスのドライブレターを判定するには、一致するデバイス名が見つかるまで全ドライブレターに対して
QueryDosDevice 関数を使用する。Windows 8 および Windows Server 2012
では、本関数は以下の技術によりサポートされている。
（以下省略）


%index
GetFirmwareEnvironmentVariableW
指定したファームウェア環境変数の値を取得する。(Unicode)
%group
Win32 kernel32
%prm
lpName, lpGuid, pBuffer, nSize
lpName : [wstr] ファームウェア環境変数の名前。ポインタは NULL であってはならない。
lpGuid : [wstr] ファームウェア環境変数の名前空間を表す GUID。GUID は "{xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx}" 形式の文字列でなければならず、'x' は 16 進値を表す。
pBuffer : [intptr] 指定したファームウェア環境変数の値を受け取るバッファへのポインタ。
nSize : [int] pBuffer バッファのサイズ（バイト単位）。
%inst
指定したファームウェア環境変数の値を取得する。(Unicode)

[戻り値]
関数が成功した場合の戻り値は pBuffer バッファに格納されたバイト数である。失敗した場合の戻り値は 0
である。拡張エラー情報を取得するには GetLastError を呼ぶ。発生し得るエラーコードには
ERROR_INVALID_FUNCTION が含まれる。

[備考]
Windows 10 バージョン 1803 以降、ユニバーサル Windows アプリは Unified Extensible
Firmware Interface (UEFI) ファームウェア変数を読み書きできる。詳細は Access UEFI firmware
variables from a Universal Windows App
を参照。ファームウェア環境変数を読むには、アプリを実行するユーザーアカウントに SE_SYSTEM_ENVIRONMENT_NAME
特権が必要である。ユニバーサル Windows アプリは管理者アカウントから実行され、Access UEFI firmware
variables from a Universal Windows App に記載された要件に従う必要がある。Windows 10
バージョン 1803 以降、UEFI 変数の読み取りは User-Mode Driver Framework (UMDF)
ドライバからもサポートされている。UMDF ドライバからの UEFI
変数の書き込みはサポートされていない。ファームウェア環境変数の正確なセットはブートファームウェアによって決まる。これらの環境変数の場所もファームウェアにより指定される。例えば
UEFI ベースのシステムでは NVRAM
がシステムブート設定を指定するファームウェア環境変数を保持する。使用される具体的な変数については UEFI 仕様を参照。UEFI と
Windows の詳細は UEFI and Windows を参照。ファームウェア変数はレガシ BIOS
ベースのシステムではサポートされない。GetFirmwareEnvironmentVariable 関数はレガシ BIOS
ベースのシステム、またはレガシ BIOS と UEFI の両方をサポートするシステムで Windows がレガシ BIOS
でインストールされている場合は常に失敗する。これらの状況を識別するには、lpName に空文字列 ("")
などのダミーのファームウェア環境名、lpGuid に "{00000000-0000-0000-0000-000000000000}"
などのダミー GUID を指定して関数を呼ぶ。レガシ BIOS ベースのシステム、またはレガシ BIOS と UEFI
の両方をサポートするシステムで Windows がレガシ BIOS でインストールされている場合、関数は
ERROR_INVALID_FUNCTION で失敗する。UEFI ベースのシステムでは、関数はダミーの GUID
名前空間が存在しないことを示すため、ERROR_NOACCESS
のようなファームウェア固有のエラーで失敗する。バックアップアプリを作成する場合、本関数を使ってシステムのすべてのブート設定を保存し、必要に応じて
SetFirmwareEnvironmentVariable
関数で復元できる。GetFirmwareEnvironmentVariable は
ExGetFirmwareEnvironmentVariable カーネルモードルーチンのユーザーモード相当である。
> [!NOTE] > winbase.h ヘッダは、UNICODE プリプロセッサ定数の定義に基づいて本関数の ANSI 版または
Unicode 版を自動選択するエイリアスとして GetFirmwareEnvironmentVariable
を定義する。エンコード非依存のエイリアスとエンコード依存のコードを混在させると、コンパイル時または実行時のエラーにつながる不一致が発生する可能性がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
GetFirmwareEnvironmentVariableExW
指定したファームウェア環境変数の値とその属性を取得する。(Unicode)
%group
Win32 kernel32
%prm
lpName, lpGuid, pBuffer, nSize, pdwAttribubutes
lpName : [wstr] ファームウェア環境変数の名前。ポインタは NULL であってはならない。
lpGuid : [wstr] ファームウェア環境変数の名前空間を表す GUID。GUID は "{xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx}" 形式の文字列でなければならず、'x' は 16 進値を表す。ポインタは NULL であってはならない。
pBuffer : [intptr] 指定したファームウェア環境変数の値を受け取るバッファへのポインタ。
nSize : [int] pValue バッファのサイズ（バイト単位）。
pdwAttribubutes : [var] 変数に関連付けられた UEFI 変数属性を識別するビットマスク。ビットマスクの定義は SetFirmwareEnvironmentVariableEx を参照。
%inst
指定したファームウェア環境変数の値とその属性を取得する。(Unicode)

[戻り値]
関数が成功した場合の戻り値は pValue バッファに格納されたバイト数である。失敗した場合の戻り値は 0
である。拡張エラー情報を取得するには GetLastError を呼ぶ。発生し得るエラーコードには
ERROR_INVALID_FUNCTION が含まれる。

[備考]
Windows 10 バージョン 1803 以降、ユニバーサル Windows アプリは UEFI
ファームウェア変数を読み書きできる。詳細は Access UEFI firmware variables from a Universal
Windows App を参照。UEFI ファームウェア環境変数を読むには、アプリを実行するユーザーアカウントに
SE_SYSTEM_ENVIRONMENT_NAME 特権が必要である。ユニバーサル Windows
アプリは管理者アカウントから実行され、Access UEFI firmware variables from a Universal
Windows App に記載された要件に従う必要がある。Windows 10 バージョン 1803 以降、UEFI 変数の読み取りは
User-Mode Driver Framework (UMDF) ドライバからもサポートされている。UMDF ドライバからの UEFI
変数の書き込みはサポートされていない。ファームウェア環境変数の正確なセットはブートファームウェアによって決まる。これらの環境変数の場所もファームウェアにより指定される。例えば
UEFI ベースのシステムでは NVRAM
がシステムブート設定を指定するファームウェア環境変数を保持する。使用される具体的な変数については UEFI 仕様を参照。UEFI と
Windows の詳細は UEFI and Windows を参照。ファームウェア変数はレガシ BIOS
ベースのシステムではサポートされない。GetFirmwareEnvironmentVariableEx 関数はレガシ BIOS
ベースのシステム、またはレガシ BIOS と UEFI の両方をサポートするシステムで Windows がレガシ BIOS
でインストールされている場合は常に失敗する。これらの状況を識別するには、lpName に空文字列 ("")
などのダミーのファームウェア環境名、lpGuid に "{00000000-0000-0000-0000-000000000000}"
などのダミー GUID を指定して関数を呼ぶ。レガシ BIOS ベースのシステム、またはレガシ BIOS と UEFI
の両方をサポートするシステムで Windows がレガシ BIOS でインストールされている場合、関数は
ERROR_INVALID_FUNCTION で失敗する。UEFI ベースのシステムでは、関数はダミーの GUID
名前空間が存在しないことを示すため、ERROR_NOACCESS
のようなファームウェア固有のエラーで失敗する。バックアップアプリを作成する場合、本関数を使ってシステムのすべてのブート設定を保存し、必要に応じて
SetFirmwareEnvironmentVariable 関数で復元できる。
> [!NOTE] > winbase.h ヘッダは、UNICODE プリプロセッサ定数の定義に基づいて本関数の ANSI 版または
Unicode 版を自動選択するエイリアスとして GetFirmwareEnvironmentVariableEx
を定義する。エンコード非依存のエイリアスとエンコード依存のコードを混在させると、コンパイル時または実行時のエラーにつながる不一致が発生する可能性がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
GetFirmwareType
ローカルコンピュータのファームウェア種別を取得する。
%group
Win32 kernel32
%prm
FirmwareType
FirmwareType : [var] FIRMWARE_TYPE 列挙体へのポインタ。
%inst
ローカルコンピュータのファームウェア種別を取得する。

[戻り値]
関数が成功した場合の戻り値は 0 以外である。失敗した場合の戻り値は 0 である。拡張エラー情報を取得するには GetLastError
関数を呼ぶ。


%index
GetFullPathNameW
指定したファイルのフルパスとファイル名を取得する。(Unicode)
%group
Win32 kernel32
%prm
lpFileName, nBufferLength, lpBuffer, lpFilePart
lpFileName : [wstr] ファイルの名前。本パラメータは短いファイル名 (8.3 形式) または長いファイル名のいずれも使用できる。共有名やボリューム名でもよい。本関数の ANSI 版では名前は MAX_PATH 文字に制限される。この制限を 32,767 ワイド文字に拡張するには、Unicode 版 (GetFullPathNameW) を呼ぶ。
nBufferLength : [int] ドライブとパスの null 終端文字列を受け取るバッファのサイズ（TCHAR 単位）。
lpBuffer : [wstr] ドライブとパスの null 終端文字列を受け取るバッファへのポインタ。
lpFilePart : [var] パスの末尾のファイル名コンポーネントのアドレス（lpBuffer 内）を受け取るバッファへのポインタ。本パラメータは NULL でもよい。lpBuffer がファイルではなくディレクトリを参照する場合、lpFilePart は 0 を受け取る。
%inst
指定したファイルのフルパスとファイル名を取得する。(Unicode)

[戻り値]
関数が成功した場合の戻り値は、終端 null 文字を含まずに lpBuffer にコピーされた文字列の長さ（TCHAR
単位）である。lpBuffer バッファがパスを保持するには小さすぎる場合、戻り値はパスと終端 null
文字を保持するために必要なバッファのサイズ（TCHAR 単位）である。それ以外の理由で失敗した場合の戻り値は 0
である。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
GetFullPathName
は現在のドライブとディレクトリの名前を、指定したファイル名と組み合わせて、指定したファイルのフルパスとファイル名を求める。また、フルパスとファイル名の中のファイル名部分のアドレスも算出する。本関数は、結果のパスとファイル名が有効かどうか、または関連ボリューム上に既存のファイルが見えるかどうかは検証しない。lpFilePart
パラメータは文字列バッファの領域を必要とせず、単一のアドレス分の領域だけで足りる。これは lpBuffer
用に既に存在するバッファ内のアドレスを返すだけだからである。共有名とボリューム名は lpFileName の有効な入力である。例えば
test-2 がリモートコンピュータで U:
がボリュームのルートを現在のディレクトリとするネットワークマップドライブの場合、返されるパスとファイル名は次のとおりである。
（以下省略）


%index
GetFullPathNameTransactedW
指定したファイルのフルパスとファイル名をトランザクション操作として取得する。(Unicode)
%group
Win32 kernel32
%prm
lpFileName, nBufferLength, lpBuffer, lpFilePart, hTransaction
lpFileName : [wstr] ファイルの名前。この文字列は短いファイル名 (8.3 形式) または長いファイル名のいずれも使用できる。共有名やボリューム名でもよい。ファイルはローカルコンピュータ上に存在しなければならない。そうでない場合、関数は失敗し、直近エラーコードに ERROR_TRANSACTIONS_UNSUPPORTED_REMOTE が設定される。
nBufferLength : [int] ドライブとパスの null 終端文字列を受け取るバッファのサイズ（TCHAR 単位）。
lpBuffer : [wstr] ドライブとパスの null 終端文字列を受け取るバッファへのポインタ。
lpFilePart : [var] パスの末尾のファイル名コンポーネントのアドレス（lpBuffer 内）を受け取るバッファへのポインタ。この情報を必要としない場合は NULL を指定する。lpBuffer がファイルではなくディレクトリを指す場合、lpFilePart は 0 を受け取る。
hTransaction : [intptr] トランザクションへのハンドル。このハンドルは CreateTransaction 関数によって返される。
%inst
指定したファイルのフルパスとファイル名をトランザクション操作として取得する。(Unicode)

[戻り値]
関数が成功した場合の戻り値は、終端 null 文字を含まずに lpBuffer にコピーされた文字列の長さ（TCHAR
単位）である。lpBuffer バッファがパスを保持するには小さすぎる場合、戻り値はパスと終端 null
文字を保持するために必要なバッファのサイズ（TCHAR 単位）である。それ以外の理由で失敗した場合の戻り値は 0
である。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
GetFullPathNameTransacted
は現在のドライブとディレクトリの名前を、指定したファイル名と組み合わせて、指定したファイルのフルパスとファイル名を求める。また、フルパスとファイル名の中のファイル名部分のアドレスも算出する。本関数は、結果のパスとファイル名が有効かどうか、または関連ボリューム上に既存のファイルが見えるかどうかは検証しない。共有名とボリューム名は
lpFileName の有効な入力である。例えば test-2 がリモートコンピュータで U:
がネットワークマップドライブの場合、返されるパスとファイル名は次のとおりである。
（以下省略）


%index
GetGeoInfoW
指定した地理的位置に関する情報を取得する。(Unicode)
%group
Win32 kernel32
%prm
Location, GeoType, lpGeoData, cchData, LangId
Location : [int] 情報を取得する地理的位置の識別子。詳細は Table of Geographical Locations を参照。EnumSystemGeoID を呼ぶことで利用可能な値を取得できる。
GeoType : [int] 取得する情報の種別。指定可能な値は SYSGEOTYPE 列挙体で定義される。GeoType の値が GEO_LCID の場合、関数はロケール識別子を取得する。GeoType の値が GEO_RFC1766 の場合、関数は RFC 4646 (Windows Vista) に準拠した文字列名を取得する。詳細は注釈を参照。Windows XP: GeoType に GEO_LCID を指定した場合、取得される文字列は 8 桁の 16 進値である。Windows Me: GeoType に GEO_LCID を指定した場合、取得される文字列は 10 進値である。
lpGeoData : [wstr] 本関数が情報を取得するバッファへのポインタ。
cchData : [int] lpGeoData が示すデータバッファのサイズ。サイズは ANSI 版ではバイト数、Unicode 版ではワード数である。アプリケーションが必要なバッファサイズを取得したい場合、本パラメータを 0 に設定できる。
LangId : [int] Location の値とともに使用される言語の識別子。アプリケーションは GeoType に GEO_RFC1766 または GEO_LCID を指定したうえで、本パラメータを 0 にできる。この設定では、関数は GetUserDefaultLangID を呼んで言語識別子を取得する。注: GeoType が GEO_RFC1766 や GEO_LCID 以外の値である場合、本パラメータは 0 に設定しなければならない。
%inst
指定した地理的位置に関する情報を取得する。(Unicode)

[戻り値]
成功した場合、出力バッファに取得した地理的位置情報のバイト数 (ANSI) またはワード数 (Unicode) を返す。cchData が
0 の場合、関数は必要なバッファサイズを返す。関数が成功しなかった場合は 0 を返す。拡張エラー情報を取得するには
GetLastError を呼ぶ。次のエラーコードのいずれかが返ることがある。
（以下省略）

[備考]
アプリケーションが GeoType に GEO_RFC1766 を指定する場合、指定する地理的位置識別子に適した言語識別子を LangId
に指定する必要がある。適切な言語とは、ロケール非依存の言語、または指定識別子に対応するロケールを持つ言語である。RFC 4646
(Windows Vista) に準拠する結果文字列はロケール名となる。例えば Location に United States の
0xF4、GeoType に GEO_RFC1766、LangId にロケール非依存英語の 0x09 または英語 (United
States) の 0x409 を指定すると、関数は正常復帰時に "en-US"
を取得する。実際には関数は言語のロケール固有部分を無視する。したがって LangId に英語 (United Kingdom) の
0x809 を指定しても、関数は lpGeoData に "en-US" を書き込む。別の例として、Location に United
States の 0xF4、GeoType に GEO_RFC1766、LangId に中国語の 0x04
を指定した場合、関数は正常復帰時に "zh-US" を取得する。これはサポートされるロケールの名前ではない。アプリケーションが
GeoType に GEO_LCID を指定する場合、関数は言語識別子をロケール識別子 (LCID)
として扱う。指定された地理識別子に何らかの形で関連付けられている場合、ロケール識別子の取得を試みる。
> [!NOTE] > winnls.h ヘッダは、UNICODE プリプロセッサ定数の定義に基づいて本関数の ANSI 版または
Unicode 版を自動選択するエイリアスとして GetGeoInfo
を定義する。エンコード非依存のエイリアスとエンコード依存のコードを混在させると、コンパイル時または実行時のエラーにつながる不一致が発生する可能性がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
GetGeoInfoEx
2 文字の国際標準化機構 (ISO) 3166-1 コードまたは国連 (UN) シリーズ M 番号 49 (M.49) 数値コードで指定した地理的位置に関する情報を取得する。
%group
Win32 kernel32
%prm
location, geoType, geoData, geoDataCount
location : [wstr] 情報を取得する地理的位置の 2 文字 ISO 3166-1 コード、または UN M.49 数値コード。利用可能なコードを取得するには EnumSystemGeoNames を呼ぶ。
geoType : [int] 取得したい情報の種別。指定可能な値は SYSGEOTYPE 列挙体で定義される。SYSGEOTYPE 列挙体の以下の値は GetGeoInfoEx と一緒に使用してはならない。
geoData : [wstr] GetGeoInfoEx が要求された情報を書き込むバッファへのポインタ。
geoDataCount : [int] geoData パラメータが指すバッファのサイズ（文字単位）。要求された情報をバッファに書き込まずに、その情報を格納するために必要なバッファサイズだけを返したい場合、本パラメータを 0 に設定する。
%inst
2 文字の国際標準化機構 (ISO) 3166-1 コードまたは国連 (UN) シリーズ M 番号 49 (M.49)
数値コードで指定した地理的位置に関する情報を取得する。

[戻り値]
関数が出力バッファに書き込んだ地理的位置情報のバイト数。geoDataCount が 0
の場合、関数は情報をバッファに書き込まずに必要なバッファサイズを返す。0 は関数が成功しなかったことを示す。拡張エラー情報を取得するには
GetLastError を呼ぶ。次のエラーコードのいずれかが返ることがある。
（以下省略）

[備考]
2 文字 ISO 3166-1 コードについては Country Codes - ISO 3166 を参照。UN M.49
数値コードについては Standard country or area codes for statistical use (M49)
を参照。


%index
GetHandleInformation
オブジェクトハンドルの一部のプロパティを取得する。
%group
Win32 kernel32
%prm
hObject, lpdwFlags
hObject : [intptr] 情報を取得するオブジェクトへのハンドル。
lpdwFlags : [var] オブジェクトハンドルのプロパティを指定するビットフラグの集合または 0 を受け取る変数へのポインタ。次の値が定義されている。
%inst
オブジェクトハンドルの一部のプロパティを取得する。

[戻り値]
関数が成功した場合の戻り値は 0 以外である。失敗した場合の戻り値は 0 である。拡張エラー情報を取得するには GetLastError
を呼ぶ。


%index
GetLargePageMinimum
ラージページの最小サイズを取得する。
%group
Win32 kernel32
%prm

%inst
ラージページの最小サイズを取得する。

[戻り値]
プロセッサがラージページをサポートする場合、戻り値はラージページの最小サイズである。プロセッサがラージページをサポートしない場合、戻り値は
0 である。

[備考]
ラージページの最小サイズはまちまちだが、典型的には 2 MB 以上である。


%index
GetLargestConsoleWindowSize
現在のフォントとディスプレイのサイズに基づいて、可能な最大コンソールウィンドウのサイズを取得する。
%group
Win32 kernel32
%prm
hConsoleOutput
hConsoleOutput : [intptr] コンソールスクリーンバッファへのハンドル。
%inst
現在のフォントとディスプレイのサイズに基づいて、可能な最大コンソールウィンドウのサイズを取得する。

[戻り値]
関数が成功した場合の戻り値は、可能な最大コンソールウィンドウの文字セル列数 (**X** メンバ) と行数 (**Y** メンバ)
を指定する [**COORD**](coord-str.md) 構造体である。それ以外の場合、構造体のメンバは 0
となる。拡張エラー情報を取得するには
[**GetLastError**](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror)
を呼ぶ。

[備考]

本関数はコンソールスクリーンバッファのサイズを考慮しないため、返されるウィンドウサイズはコンソールスクリーンバッファのサイズより大きくなることがある。現在のスクリーンバッファサイズ、現在のフォント、ディスプレイサイズに基づいて、コンソールウィンドウの最大サイズを判別するには、[**GetConsoleScreenBufferInfo**](getconsolescreenbufferinfo.md)
関数を使用できる。[!INCLUDE
[no-vt-equiv-user-priv](./includes/no-vt-equiv-user-priv.md)]


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
GetLocaleInfoW
識別子で指定したロケールに関する情報を取得する。(Unicode)
%group
Win32 kernel32
%prm
Locale, LCType, lpLCData, cchData
Locale : [int] 情報を取得するロケール識別子。MAKELCID マクロでロケール識別子を作成するか、以下の定義済み値のいずれかを使用できる。
LCType : [int] 取得するロケール情報。詳細な定義は GetLocaleInfoEx の LCType パラメータを参照。注: GetLocaleInfo では LOCALE_USE_CP_ACP の値は ANSI 版でのみ意味を持つ。
lpLCData : [wstr] 本関数が要求されたロケール情報を取得するバッファへのポインタ。cchData が 0 の場合、このポインタは使用されない。詳細は注釈を参照。
cchData : [int] lpLCData が示すデータバッファのサイズ（TCHAR 単位）。あるいは、アプリケーションは本パラメータを 0 に設定できる。この場合、関数は lpLCData パラメータを使用せず、終端 null 文字を含む必要なバッファサイズを返す。
%inst
識別子で指定したロケールに関する情報を取得する。(Unicode)

[戻り値]
成功し cchData が 0 以外の値の場合、ロケールデータバッファに取得された文字数を返す。関数が成功し、cchData が 0
以外で LOCALE_RETURN_NUMBER が指定されている場合、戻り値はデータバッファに取得された整数のサイズ、すなわち
Unicode 版の関数では 2、ANSI 版では 4 となる。関数が成功し cchData の値が 0
の場合、戻り値はロケールデータバッファに必要なサイズで、null 文字を含めた文字数である。関数が成功しなかった場合は 0
を返す。拡張エラー情報を取得するには GetLastError を呼ぶ。次のエラーコードのいずれかが返ることがある。
（以下省略）

[備考]
本関数の動作については GetLocaleInfoEx の注釈を参照。注: LCType を LOCALE_FONTSIGNATURE
と指定した場合でも、cchData と関数の戻り値は依然として TCHAR 数である。カウントは ANSI 版と Unicode
版で異なる。アプリケーションが LCType に LOCALE_FONTSIGNATURE を指定して汎用版の GetLocaleInfo
を呼ぶ場合、cchData は安全に sizeof(LOCALESIGNATURE) / sizeof(TCHAR)
と指定できる。次の例は、テキスト以外の値に対するバッファサイズを正しく扱う例である。
（以下省略）


%index
GetLocaleInfoEx
名前で指定したロケールに関する情報を取得する。注: アプリケーションが Windows Vista 以降のみで動作するように設計されている場合、GetLocaleInfo よりも本関数を優先して呼ぶべきである。注: 本関数は、カスタムロケールなどによりリリース間で変わり得るデータを取得することがある。アプリケーションがデータを永続化または送信する必要がある場合は、Using Persistent Locale Data を参照。
%group
Win32 kernel32
%prm
lpLocaleName, LCType, lpLCData, cchData
lpLocaleName : [wstr] ロケール名へのポインタ、または以下の定義済み値のいずれか。
LCType : [int] 取得するロケール情報。指定可能な値は Locale Information Constants の "Constants Used in the LCType Parameter of GetLocaleInfo, GetLocaleInfoEx, and SetLocaleInfo" 節を参照。1 回の呼び出しで指定できるロケール情報は 1 つのみであることに注意。アプリケーションはバイナリ OR 演算子を使って LOCALE_RETURN_NUMBER を他の許可された定数と組み合わせ可能である。この場合、関数は値を文字列ではなく数値として取得する。値を受け取るバッファは少なくとも DWORD 値の長さ (2) でなければならない。注意: LOCALE_NOUSEROVERRIDE を他の任意の定数と組み合わせることも可能だが、この定数の使用は強く非推奨である（現在のユーザー上書きを使用しなくても、データはコンピュータ間で異なり得るし、カスタムロケールでデータが変わることがある。例えば月名や曜日名でも綴り改革の影響を受け得る）。LCType を LOCALE_IOPTIONALCALENDAR に設定した場合、関数は最初の代替カレンダーのみを取得する。注: すべての代替カレンダーを取得するには、アプリケーションは EnumCalendarInfoEx を使用するべきである。Windows Vista 以降では、失敗や予期しないデータの取得を避けるため、LCType パラメータに LOCALE_ILANGUAGE を使用するべきではない。代わりに GetLocaleInfoEx を呼ぶことを推奨する。
lpLCData : [wstr] 本関数が要求されたロケール情報を取得するバッファへのポインタ。cchData が 0 の場合、このポインタは使用されない。
cchData : [int] lpLCData が示すデータバッファのサイズ（文字単位）。あるいは、アプリケーションは本パラメータを 0 に設定できる。この場合、関数は lpLCData パラメータを使用せず、終端 null 文字を含む必要なバッファサイズを返す。
%inst
名前で指定したロケールに関する情報を取得する。注: アプリケーションが Windows Vista
以降のみで動作するように設計されている場合、GetLocaleInfo よりも本関数を優先して呼ぶべきである。注:
本関数は、カスタムロケールなどによりリリース間で変わり得るデータを取得することがある。アプリケーションがデータを永続化または送信する必要がある場合は、Using
Persistent Locale Data を参照。

[戻り値]
成功し cchData が 0 以外の値の場合、ロケールデータバッファに取得された文字数を返す。関数が成功し、cchData が 0
以外で LOCALE_RETURN_NUMBER が指定されている場合、戻り値はデータバッファに取得された整数のサイズ、すなわち 2
となる。関数が成功し cchData の値が 0 の場合、戻り値はロケールデータバッファに必要なサイズで、null
文字を含めた文字数である。関数が成功しなかった場合は 0 を返す。拡張エラー情報を取得するには GetLastError
を呼ぶ。次のエラーコードのいずれかが返ることがある。
（以下省略）

[備考]
本関数は通常、情報をテキスト形式で取得する。情報が数値で、LCType の値が LOCALE_ILANGUAGE または
LOCALE_IDEFAULTLANGUAGE の場合、本関数は 16
進数を含む文字列を取得する。それ以外の場合、数値情報として取得されるテキストは 10 進数である。この規則には 2 つの例外がある。第 1
に、アプリケーションは LCType に LOCALE_RETURN_NUMBER を指定することで数値を整数として取得できる。第 2
に、LOCALE_FONTSIGNATURE は他のすべてのロケール情報定数と挙動が異なる。アプリケーションは少なくとも
sizeof(LOCALESIGNATURE) バイトのデータバッファを用意しなければならない。関数からの正常復帰時、バッファは
LOCALESIGNATURE 構造体として埋められる。注: LCType を LOCALE_FONTSIGNATURE
と指定した場合でも、cchData と関数の戻り値は依然として文字数である。アプリケーションが LCType に
LOCALE_FONTSIGNATURE を指定して GetLocaleInfoEx を呼ぶ場合、cchData は安全に
sizeof(LOCALESIGNATURE) / sizeof(WCHAR)
と指定できる。次の例は、テキスト以外の値に対するバッファサイズを正しく扱う例である。
（以下省略）


%index
GetLogicalDriveStringsW
システムの有効なドライブを指定する文字列でバッファを埋める。(GetLogicalDriveStringsW)
%group
Win32 kernel32
%prm
nBufferLength, lpBuffer
nBufferLength : [int] lpBuffer が指すバッファの最大サイズ（TCHAR 単位）。このサイズには終端 null 文字は含まれない。本パラメータが 0 の場合、lpBuffer は使用されない。
lpBuffer : [wstr] システムの有効な各ドライブにつき 1 つの null 終端文字列を一連で受け取り、さらに追加の null 文字を受け取るバッファへのポインタ。各文字列はデバイス名である。
%inst
システムの有効なドライブを指定する文字列でバッファを埋める。(GetLogicalDriveStringsW)

[戻り値]
関数が成功した場合の戻り値は、終端 null 文字を含まずにバッファにコピーされた文字列の長さ（文字単位）である。ANSI-ASCII の
null 文字は 1 バイト、Unicode (UTF-16) の null 文字は 2 バイトである。バッファが十分でない場合、戻り値は
nBufferLength より大きく、ドライブ文字列を保持するために必要なバッファのサイズである。失敗した場合の戻り値は 0
である。拡張エラー情報を取得するには GetLastError 関数を使用する。

[備考]
バッファ内の各文字列は、GetDriveType や GetDiskFreeSpace
関数のようにルートディレクトリが必要な場面で使用できる。本関数は Global と Local の MS-DOS
デバイス名前空間にあるドライブの連結を返す。両方の名前空間にドライブが存在する場合、本関数は Local MS-DOS
デバイス名前空間のエントリを返す。詳細は Defining an MS DOS Device Name を参照。Windows 8 および
Windows Server 2012 では、本関数は以下の技術によりサポートされている。
（以下省略）


%index
GetLogicalDrives
現在利用可能なディスクドライブを表すビットマスクを取得する。
%group
Win32 kernel32
%prm

%inst
現在利用可能なディスクドライブを表すビットマスクを取得する。

[戻り値]
関数が成功した場合の戻り値は、現在利用可能なディスクドライブを表すビットマスクである。ビット位置 0 (最下位ビット) はドライブ
A、ビット位置 1 はドライブ B、ビット位置 2 はドライブ C、以下同様である。失敗した場合の戻り値は 0
である。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
Windows 8 および Windows Server 2012 では、本関数は以下の技術によりサポートされている。
（以下省略）


%index
GetLogicalProcessorInformation
論理プロセッサと関連ハードウェアに関する情報を取得する。
%group
Win32 kernel32
%prm
Buffer, ReturnedLength
Buffer : [var] SYSTEM_LOGICAL_PROCESSOR_INFORMATION 構造体の配列を受け取るバッファへのポインタ。関数が失敗した場合、このバッファの内容は未定義である。
ReturnedLength : [var] 入力時、Buffer が指すバッファの長さ（バイト単位）を指定する。バッファがすべてのデータを格納するのに十分な大きさである場合、本関数は成功し、ReturnLength は返されたバイト数に設定される。バッファがすべてのデータを格納するのに十分でない場合、関数は失敗し、GetLastError は ERROR_INSUFFICIENT_BUFFER を返し、ReturnLength はすべてのデータを格納するのに必要なバッファ長に設定される。関数が ERROR_INSUFFICIENT_BUFFER 以外のエラーで失敗した場合、ReturnLength の値は未定義である。
%inst
論理プロセッサと関連ハードウェアに関する情報を取得する。

[戻り値]
関数が成功した場合の戻り値は TRUE であり、少なくとも 1 つの
SYSTEM_LOGICAL_PROCESSOR_INFORMATION 構造体が出力バッファに書き込まれる。失敗した場合の戻り値は
FALSE である。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
GetLogicalProcessorInformation
は、システム内の論理プロセッサ間の関係に関する情報を取得するために使用できる。取得できる情報には次のものが含まれる。
（以下省略）


%index
GetLongPathNameW
指定したパスを長い形式に変換する。(Unicode)
%group
Win32 kernel32
%prm
lpszShortPath, lpszLongPath, cchBuffer
lpszShortPath : [wstr] 変換するパス。本関数の ANSI 版 GetLongPathNameA では名前は MAX_PATH (260) 文字に制限される。この制限を 32,767 ワイド文字に拡張するには、Unicode 版 GetLongPathNameW を呼び、パスの先頭に "\\?\" を付加する。詳細は Naming Files, Paths, and Namespaces を参照。ヒント: Windows 10 バージョン 1607 以降、Unicode 版 (GetLongPathNameW) では "\\?\" を付加せずに MAX_PATH 制限を解除するオプトインが可能。詳細は Naming Files, Paths, and Namespaces の "Maximum Path Length Limitation" 節を参照。
lpszLongPath : [wstr] 長いパスを受け取るバッファへのポインタ。lpszShortPath パラメータに使用したものと同じバッファを使用できる。
cchBuffer : [int] lpszLongPath が指すバッファのサイズ（TCHAR 単位）。
%inst
指定したパスを長い形式に変換する。(Unicode)

[戻り値]
関数が成功した場合の戻り値は、終端 null 文字を含まずに lpszLongPath にコピーされた文字列の長さ（TCHAR
単位）である。lpBuffer バッファがパスを保持するには小さすぎる場合、戻り値はパスと終端 null
文字を保持するために必要なバッファのサイズ（TCHAR 単位）である。ファイルが存在しないなど、それ以外の理由で失敗した場合の戻り値は 0
である。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
多くのファイルシステムでは、短いファイル名にチルダ (~)
文字が含まれる。しかしすべてのファイルシステムがこの慣例に従うわけではない。したがって、パスにチルダ (~) 文字が含まれない場合でも
GetLongPathName
の呼び出しを省けると仮定してはならない。ファイルまたはディレクトリは存在するが長いパスが見つからない場合、GetLongPathName
は成功し、lpszShortPath パラメータが参照する文字列を lpszLongPath
パラメータが参照するバッファにコピーする。戻り値が cchBuffer
で指定された値より大きい場合、パスを保持するのに十分な大きさのバッファで関数を再度呼び出すことができる。この場合の例は
GetFullPathName のサンプルコード節を参照。注: この場合の戻り値は終端 null
文字を含む長さだが、成功時の戻り値はカウントに終端 null
文字を含めない。ファイルやディレクトリへのアクセス権はあるが、その親ディレクトリの一部にはアクセス権がないこともあり得る。その結果、GetLongPathName
は、パス構成要素の長い名前を判定するためにその親ディレクトリにクエリできない場合に失敗する可能性がある。3
文字より長い拡張子を持つディレクトリ構成要素や、合計長 12 文字を超えるディレクトリ構成要素については、このチェックを省略できる。詳細は
Naming Files, Paths, and Namespaces の Short vs. Long Names
節を参照。Windows 8 および Windows Server 2012 では、本関数は以下の技術によりサポートされている。
（以下省略）


%index
GetLongPathNameTransactedW
指定したパスをトランザクション操作として長い形式に変換する。(Unicode)
%group
Win32 kernel32
%prm
lpszShortPath, lpszLongPath, cchBuffer, hTransaction
lpszShortPath : [wstr] 変換するパス。本関数の ANSI 版では名前は MAX_PATH (260) 文字に制限される。この制限を 32,767 ワイド文字に拡張するには、Unicode 版を呼び、パスの先頭に "\\?\" を付加する。詳細は Naming Files, Paths, and Namespaces を参照。パスはローカルコンピュータ上に存在しなければならない。そうでない場合、関数は失敗し、直近エラーコードに ERROR_TRANSACTIONS_UNSUPPORTED_REMOTE が設定される。
lpszLongPath : [wstr] 長いパスを受け取るバッファへのポインタ。lpszShortPath パラメータに使用したものと同じバッファを使用できる。
cchBuffer : [int] lpszLongPath が指すバッファのサイズ（TCHAR 単位）。
hTransaction : [intptr] トランザクションへのハンドル。このハンドルは CreateTransaction 関数によって返される。
%inst
指定したパスをトランザクション操作として長い形式に変換する。(Unicode)

[戻り値]
関数が成功した場合の戻り値は、終端 null 文字を含まずに lpszLongPath にコピーされた文字列の長さ（TCHAR
単位）である。lpBuffer バッファがパスを保持するには小さすぎる場合、戻り値はパスと終端 null
文字を保持するために必要なバッファのサイズ（TCHAR 単位）である。ファイルが存在しないなど、それ以外の理由で失敗した場合の戻り値は 0
である。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
多くのファイルシステムでは、短いファイル名にチルダ (~)
文字が含まれる。しかしすべてのファイルシステムがこの慣例に従うわけではない。したがって、パスにチルダ (~) 文字が含まれない場合でも
GetLongPathNameTransacted の呼び出しを省けると仮定してはならない。長いパスが見つからない場合、本関数は
lpszShortPath パラメータで指定された名前を lpszLongPath パラメータに返す。戻り値が cchBuffer
で指定された値より大きい場合、パスを保持するのに十分な大きさのバッファで関数を再度呼び出すことができる。この場合の例は
GetFullPathName のサンプルコード節を参照。注: この場合の戻り値は終端 null
文字を含む長さだが、成功時の戻り値はカウントに終端 null
文字を含めない。ファイルやディレクトリへのアクセス権はあるが、その親ディレクトリの一部にはアクセス権がないこともあり得る。その結果、GetLongPathNameTransacted
は、パス構成要素の長い名前を判定するためにその親ディレクトリにクエリできない場合に失敗する可能性がある。3
文字より長い拡張子を持つディレクトリ構成要素や、合計長 12 文字を超えるディレクトリ構成要素については、このチェックを省略できる。詳細は
Naming Files, Paths, and Namespaces の Short vs. Long Names
節を参照。Windows 8 および Windows Server 2012 では、本関数は以下の技術によりサポートされている。
（以下省略）


%index
GetMailslotInfo
指定したメールスロットに関する情報を取得する。
%group
Win32 kernel32
%prm
hMailslot, lpMaxMessageSize, lpNextSize, lpMessageCount, lpReadTimeout
hMailslot : [intptr] メールスロットへのハンドル。CreateMailslot 関数でこのハンドルを作成しなければならない。
lpMaxMessageSize : [var] このメールスロットで許可される最大メッセージサイズ（バイト単位）。この値はメールスロットを作成した CreateMailslot 関数の cbMaxMsg パラメータで指定された値以上となり得る。本パラメータは NULL でもよい。
lpNextSize : [var] 次のメッセージのサイズ（バイト単位）。次の値は特別な意味を持つ。
lpMessageCount : [var] 関数が返るときに読み取り待ちのメッセージの総数。本パラメータは NULL でもよい。
lpReadTimeout : [var] 読み取り操作がメールスロットへのメッセージ書き込みを待機できる時間（ミリ秒単位）。タイムアウトが発生する前にこの時間を超えると待機は終了する。本パラメータは関数が返るときに格納される。本パラメータは NULL でもよい。
%inst
指定したメールスロットに関する情報を取得する。

[戻り値]
関数が成功した場合の戻り値は 0 以外である。失敗した場合の戻り値は 0 である。拡張エラー情報を取得するには GetLastError
を呼ぶ。


%index
GetMaximumProcessorCount
プロセッサグループまたはシステムが持ち得る論理プロセッサの最大数を返す。
%group
Win32 kernel32
%prm
GroupNumber
GroupNumber : [int] プロセッサグループ番号。本パラメータが ALL_PROCESSOR_GROUPS の場合、関数はシステムが持ち得るプロセッサの最大数を返す。
%inst
プロセッサグループまたはシステムが持ち得る論理プロセッサの最大数を返す。

[戻り値]
関数が成功した場合の戻り値は、指定したグループが持ち得るプロセッサの最大数である。失敗した場合の戻り値は 0
である。拡張エラー情報を取得するには GetLastError を使用する。

[備考]
本関数を使用するアプリケーションをコンパイルするには、_WIN32_WINNT >= 0x0601 を設定する。詳細は Using the
Windows Headers を参照。


%index
GetMaximumProcessorGroupCount
システムが持ち得るプロセッサグループの最大数を返す。
%group
Win32 kernel32
%prm

%inst
システムが持ち得るプロセッサグループの最大数を返す。

[戻り値]
関数が成功した場合の戻り値は、システムが持ち得るプロセッサグループの最大数である。失敗した場合の戻り値は 0 である。

[備考]
本関数を使用するアプリケーションをコンパイルするには、_WIN32_WINNT >= 0x0601 を設定する。詳細は Using the
Windows Headers を参照。


%index
GetMemoryErrorHandlingCapabilities
システムのメモリエラー処理機能を取得する。
%group
Win32 kernel32
%prm
Capabilities
Capabilities : [var] 次のフラグの 1 つ以上を受け取る PULONG。
%inst
システムのメモリエラー処理機能を取得する。

[戻り値]
関数が成功した場合の戻り値は 0 以外である。失敗した場合の戻り値は 0 である。拡張エラー情報を取得するには GetLastError
を呼ぶ。

[備考]
本関数を呼び出すアプリケーションをコンパイルするには、_WIN32_WINNT を _WIN32_WINNT_WIN8
以上として定義する。詳細は Using the Windows Headers を参照。


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
GetModuleHandleExW
指定したモジュールのモジュールハンドルを取得し、GET_MODULE_HANDLE_EX_FLAG_UNCHANGED_REFCOUNT が指定されない限りモジュールの参照カウントを増やす。モジュールは呼び出し側プロセスによってロード済みでなければならない。(Unicode)
%group
Win32 kernel32
%prm
dwFlags, lpModuleName, phModule
dwFlags : [int] 
lpModuleName : [wstr] ロード済みモジュール (.dll または .exe ファイル) の名前、またはモジュール内のアドレス (dwFlags が GET_MODULE_HANDLE_EX_FLAG_FROM_ADDRESS の場合)。
phModule : [intptr] 指定したモジュールへのハンドル。関数が失敗した場合、本パラメータは NULL となる。GetModuleHandleEx 関数は LOAD_LIBRARY_AS_DATAFILE フラグでロードされたモジュールのハンドルは取得しない。詳細は LoadLibraryEx を参照。
%inst
指定したモジュールのモジュールハンドルを取得し、GET_MODULE_HANDLE_EX_FLAG_UNCHANGED_REFCOUNT
が指定されない限りモジュールの参照カウントを増やす。モジュールは呼び出し側プロセスによってロード済みでなければならない。(Unicode)

[戻り値]
関数が成功した場合の戻り値は 0 以外である。失敗した場合の戻り値は 0 である。拡張エラー情報を取得するには GetLastError
を参照。

[備考]
返されるハンドルはグローバルでも継承可能でもない。複製したり別のプロセスで使用したりすることはできない。lpModuleName
にパスが含まれず、同じベース名と拡張子を持つロード済みモジュールが複数ある場合、どのモジュールのハンドルが返されるかは予測できない。この問題を回避するには、パスを指定するか、サイドバイサイドアセンブリを使用するか、lpModuleName
パラメータに DLL 名ではなくメモリ上の位置を指定する方法がある。dwFlags に
GET_MODULE_HANDLE_EX_FLAG_UNCHANGED_REFCOUNT
が含まれる場合、GetModuleHandleEx
関数はマッピング済みモジュールへのハンドルを参照カウントを増やさずに返す。ただし、このハンドルが FreeLibrary
関数に渡されると、マッピング済みモジュールの参照カウントは減らされる。したがって、GET_MODULE_HANDLE_EX_FLAG_UNCHANGED_REFCOUNT
付きの GetModuleHandleEx が返したハンドルを FreeLibrary 関数に渡してはならない。これを行うと DLL
モジュールが早期にアンマッピングされる原因となり得る。dwFlags に
GET_MODULE_HANDLE_EX_FLAG_UNCHANGED_REFCOUNT
が含まれる場合、本関数はマルチスレッドアプリケーションでは慎重に使用しなければならない。本関数がハンドルを返してから使用するまでの間に、そのモジュールハンドルが有効である保証はない。例えば、あるスレッドがモジュールハンドルを取得したが、それを使う前に第
2
のスレッドがそのモジュールを解放することがあり得る。システムが別のモジュールをロードすると、最近解放されたモジュールハンドルが再利用される可能性がある。したがって最初のスレッドは意図したものとは異なるモジュールへのハンドルを保持してしまう。本関数を使用するアプリケーションをコンパイルするには、_WIN32_WINNT
を 0x0501 以降として定義する。詳細は Using the Windows Headers を参照。
> [!NOTE] > libloaderapi.h ヘッダは、UNICODE プリプロセッサ定数の定義に基づいて本関数の ANSI
版または Unicode 版を自動選択するエイリアスとして GetModuleHandleEx
を定義する。エンコード非依存のエイリアスとエンコード依存のコードを混在させると、コンパイル時または実行時のエラーにつながる不一致が発生する可能性がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
GetNLSVersion
識別子で指定したロケールに対し、指定した NLS 機能の現在のバージョンに関する情報を取得する。注: 相互運用性のため、新しいロケールではロケール識別子の代わりにロケール名の使用に Microsoft が移行しているため、アプリケーションは GetNLSVersion よりも GetNLSVersionEx 関数を優先するべきである。この推奨は特にカスタムロケールに当てはまる。GetNLSVersionEx はソート動作が変わったかを判定するのに十分な情報を取得する。Windows Vista 以降のみで動作するアプリケーションは GetNLSVersionEx を使用するか、少なくとも追加のソートバージョン情報を取得するために GetNLSVersion を呼ぶ際に NLSVERSIONINFOEX 構造体を渡すべきである。
%group
Win32 kernel32
%prm
Function, Locale, lpVersionInformation
Function : [int] クエリする NLS 機能。この値は COMPARE_STRING でなければならない。SYSNLS_FUNCTION 列挙体を参照。
Locale : [int] ロケールを指定するロケール識別子。MAKELCID マクロで識別子を作成するか、以下の定義済み値のいずれかを使用できる。
lpVersionInformation : [var] NLSVERSIONINFO 構造体へのポインタ。アプリケーションは dwNLSVersionInfoSize メンバを sizeof(NLSVERSIONINFO) に初期化する必要がある。注: Windows Vista 以降では、本関数は代わりに NLSVERSIONINFOEX 構造体でバージョン情報を提供できる。
%inst
識別子で指定したロケールに対し、指定した NLS 機能の現在のバージョンに関する情報を取得する。注:
相互運用性のため、新しいロケールではロケール識別子の代わりにロケール名の使用に Microsoft が移行しているため、アプリケーションは
GetNLSVersion よりも GetNLSVersionEx
関数を優先するべきである。この推奨は特にカスタムロケールに当てはまる。GetNLSVersionEx
はソート動作が変わったかを判定するのに十分な情報を取得する。Windows Vista 以降のみで動作するアプリケーションは
GetNLSVersionEx を使用するか、少なくとも追加のソートバージョン情報を取得するために GetNLSVersion を呼ぶ際に
NLSVERSIONINFOEX 構造体を渡すべきである。

[戻り値]
アプリケーションが lpVersionInformation に有効な値を提供した場合のみ TRUE を返し、それ以外は FALSE
を返す。拡張エラー情報を取得するには GetLastError を呼ぶ。次のエラーコードのいずれかが返ることがある。
（以下省略）

[備考]
本関数により Active Directory のようなアプリケーションは、NLS
変更が特定のインデックステーブルで使用されるロケール識別子に影響するかを判定できる。影響しない場合、テーブルを再インデックスする必要はない。詳細は
Handling Sorting in Your Applications を参照。


%index
GetNLSVersionEx
名前で指定したロケールに対し、指定した NLS 機能の現在のバージョンに関する情報を取得する。注: アプリケーションが Windows Vista 以降のみで動作するように設計されている場合、GetNLSVersion よりも本関数を優先して呼ぶべきである。
%group
Win32 kernel32
%prm
function, lpLocaleName, lpVersionInformation
function : [int] クエリする NLS 機能。この値は COMPARE_STRING でなければならない。SYSNLS_FUNCTION 列挙体を参照。
lpLocaleName : [wstr] ロケール名へのポインタ、または以下の定義済み値のいずれか。
lpVersionInformation : [var] NLSVERSIONINFOEX 構造体へのポインタ。アプリケーションは dwNLSVersionInfoSize メンバを sizeof(NLSVERSIONINFOEX) に初期化する必要がある。注: Windows Vista 以降では、本関数は代わりに NLSVERSIONINFO 構造体でバージョン情報を提供できる。
%inst
名前で指定したロケールに対し、指定した NLS 機能の現在のバージョンに関する情報を取得する。注: アプリケーションが Windows
Vista 以降のみで動作するように設計されている場合、GetNLSVersion よりも本関数を優先して呼ぶべきである。

[戻り値]
アプリケーションが lpVersionInformation に有効な値を提供した場合のみ TRUE を返し、それ以外は FALSE
を返す。拡張エラー情報を取得するには GetLastError を呼ぶ。次のエラーコードのいずれかが返ることがある。
（以下省略）

[備考]
本関数により Active Directory のようなアプリケーションは、NLS
変更が特定のインデックステーブルで使用されるロケールに影響するかを判定できる。影響しない場合、テーブルを再インデックスする必要はない。詳細は
Handling Sorting in Your Applications
を参照。具体的に、ソートバージョンが変わって再インデックスが必要かを判別するには次のとおりである。
（以下省略）


%index
GetNamedPipeClientComputerNameW
GetNamedPipeClientComputerNameW (Unicode) 関数 (winbase.h) は、指定した名前付きパイプのクライアントコンピュータ名を取得する。
%group
Win32 kernel32
%prm
Pipe, ClientComputerName, ClientComputerNameLength
Pipe : [intptr] 名前付きパイプのインスタンスへのハンドル。このハンドルは CreateNamedPipe 関数で作成しなければならない。
ClientComputerName : [wstr] コンピュータ名。
ClientComputerNameLength : [int] ClientComputerName バッファのサイズ（バイト単位）。
%inst
GetNamedPipeClientComputerNameW (Unicode) 関数 (winbase.h)
は、指定した名前付きパイプのクライアントコンピュータ名を取得する。

[戻り値]
関数が成功した場合の戻り値は 0 以外である。失敗した場合の戻り値は 0 である。拡張エラー情報を取得するには GetLastError
関数を呼ぶ。

[備考]
Windows 10 バージョン 1709: パイプは app-container
内でのみサポートされる。すなわち、同じアプリの一部である UWP プロセス間でのみ使用可能である。また、名前付きパイプはパイプ名に
`\\.\pipe\LOCAL\` 構文を使用しなければならない。


%index
GetNamedPipeClientProcessId
指定した名前付きパイプのクライアントプロセス識別子を取得する。
%group
Win32 kernel32
%prm
Pipe, ClientProcessId
Pipe : [intptr] 名前付きパイプのインスタンスへのハンドル。このハンドルは CreateNamedPipe 関数で作成しなければならない。
ClientProcessId : [var] プロセス識別子。
%inst
指定した名前付きパイプのクライアントプロセス識別子を取得する。

[戻り値]
関数が成功した場合の戻り値は 0 以外である。失敗した場合の戻り値は 0 である。拡張エラー情報を取得するには GetLastError
関数を呼ぶ。

[備考]
Windows 10 バージョン 1709: パイプは app-container
内でのみサポートされる。すなわち、同じアプリの一部である UWP プロセス間でのみ使用可能である。また、名前付きパイプはパイプ名に
`\\.\pipe\LOCAL\` 構文を使用しなければならない。


%index
GetNamedPipeClientSessionId
指定した名前付きパイプのクライアントセッション識別子を取得する。
%group
Win32 kernel32
%prm
Pipe, ClientSessionId
Pipe : [intptr] 名前付きパイプのインスタンスへのハンドル。このハンドルは CreateNamedPipe 関数で作成しなければならない。
ClientSessionId : [var] セッション識別子。
%inst
指定した名前付きパイプのクライアントセッション識別子を取得する。

[戻り値]
関数が成功した場合の戻り値は 0 以外である。失敗した場合の戻り値は 0 である。拡張エラー情報を取得するには GetLastError
関数を呼ぶ。

[備考]
Windows 10 バージョン 1709: パイプは app-container
内でのみサポートされる。すなわち、同じアプリの一部である UWP プロセス間でのみ使用可能である。また、名前付きパイプはパイプ名に
`\\.\pipe\LOCAL\` 構文を使用しなければならない。


%index
GetNamedPipeHandleStateW
GetNamedPipeHandleStateW (Unicode) 関数 (winbase.h) は、指定した名前付きパイプに関する情報を取得する。
%group
Win32 kernel32
%prm
hNamedPipe, lpState, lpCurInstances, lpMaxCollectionCount, lpCollectDataTimeout, lpUserName, nMaxUserNameSize
hNamedPipe : [intptr] 情報を取得したい名前付きパイプへのハンドル。読み取り専用または読み書き両用パイプの場合、ハンドルは GENERIC_READ アクセス権を持つ必要があり、書き込み専用パイプの場合は GENERIC_WRITE と FILE_READ_ATTRIBUTES アクセス権を持つ必要がある。本パラメータは CreatePipe 関数が返した匿名パイプへのハンドルでもよい。
lpState : [var] 
lpCurInstances : [var] 現在のパイプインスタンス数を受け取る変数へのポインタ。この情報が不要な場合、本パラメータは NULL にできる。
lpMaxCollectionCount : [var] クライアントのコンピュータ上でサーバーへの送信前に収集される最大バイト数を受け取る変数へのポインタ。指定したパイプハンドルが名前付きパイプのサーバー側、またはクライアントとサーバープロセスが同じコンピュータ上にある場合、本パラメータは NULL でなければならない。この情報が不要な場合、本パラメータは NULL にできる。
lpCollectDataTimeout : [var] リモート名前付きパイプがネットワーク経由で情報を転送するまでに経過し得る最大時間（ミリ秒単位）を受け取る変数へのポインタ。指定したパイプハンドルが名前付きパイプのサーバー側、またはクライアントとサーバープロセスが同じコンピュータ上にある場合、本パラメータは NULL でなければならない。この情報が不要な場合、本パラメータは NULL にできる。
lpUserName : [wstr] クライアントアプリケーションに関連付けられたユーザー名文字列を受け取るバッファへのポインタ。クライアントが SECURITY_IMPERSONATION アクセス権でパイプを開いた場合のみ、サーバーはこの情報を取得できる。指定したパイプハンドルが名前付きパイプのクライアント側の場合、本パラメータは NULL でなければならない。この情報が不要な場合、本パラメータは NULL にできる。
nMaxUserNameSize : [int] lpUserName パラメータで指定したバッファのサイズ（TCHAR 単位）。lpUserName が NULL の場合、本パラメータは無視される。
%inst
GetNamedPipeHandleStateW (Unicode) 関数 (winbase.h)
は、指定した名前付きパイプに関する情報を取得する。

[戻り値]
関数が成功した場合の戻り値は 0 以外である。失敗した場合の戻り値は 0 である。拡張エラー情報を取得するには GetLastError
を呼ぶ。

[備考]
GetNamedPipeHandleState 関数は、渡されたすべてのポインタが NULL
であっても正常に返る。パイプハンドルの状態を設定するには SetNamedPipeHandleState 関数を使用する。Windows
10 バージョン 1709: パイプは app-container 内でのみサポートされる。すなわち、同じアプリの一部である UWP
プロセス間でのみ使用可能である。また、名前付きパイプはパイプ名に `\\.\pipe\LOCAL\` 構文を使用しなければならない。


%index
GetNamedPipeServerProcessId
指定した名前付きパイプのサーバープロセス識別子を取得する。
%group
Win32 kernel32
%prm
Pipe, ServerProcessId
Pipe : [intptr] 名前付きパイプのインスタンスへのハンドル。このハンドルは CreateNamedPipe 関数で作成しなければならない。
ServerProcessId : [var] プロセス識別子。
%inst
指定した名前付きパイプのサーバープロセス識別子を取得する。

[戻り値]
関数が成功した場合の戻り値は 0 以外である。失敗した場合の戻り値は 0 である。拡張エラー情報を取得するには GetLastError
関数を呼ぶ。

[備考]
Windows 10 バージョン 1709: パイプは app-container
内でのみサポートされる。すなわち、同じアプリの一部である UWP プロセス間でのみ使用可能である。また、名前付きパイプはパイプ名に
`\\.\pipe\LOCAL\` 構文を使用しなければならない。


%index
GetNamedPipeServerSessionId
指定した名前付きパイプのサーバーセッション識別子を取得する。
%group
Win32 kernel32
%prm
Pipe, ServerSessionId
Pipe : [intptr] 名前付きパイプのインスタンスへのハンドル。このハンドルは CreateNamedPipe 関数で作成しなければならない。
ServerSessionId : [var] セッション識別子。
%inst
指定した名前付きパイプのサーバーセッション識別子を取得する。

[戻り値]
関数が成功した場合の戻り値は 0 以外である。失敗した場合の戻り値は 0 である。拡張エラー情報を取得するには GetLastError
関数を呼ぶ。

[備考]
Windows 10 バージョン 1709: パイプは app-container
内でのみサポートされる。すなわち、同じアプリの一部である UWP プロセス間でのみ使用可能である。また、名前付きパイプはパイプ名に
`\\.\pipe\LOCAL\` 構文を使用しなければならない。


%index
GetNativeSystemInfo
WOW64 で動作するアプリケーションに対し、現在のシステムに関する情報を取得する。
%group
Win32 kernel32
%prm
lpSystemInfo
lpSystemInfo : [var] 情報を受け取る SYSTEM_INFO 構造体へのポインタ。
%inst
WOW64 で動作するアプリケーションに対し、現在のシステムに関する情報を取得する。

[備考]
Win32 ベースのアプリケーションが WOW64 で動作しているか (または 64 ビットシステムが Intel64 や x64
プロセッサを持たないか) を判別するには、IsWow64Process2
関数を呼ぶ。本関数を使用するアプリケーションをコンパイルするには、_WIN32_WINNT を 0x0501 以降として定義する。詳細は
Using the Windows Headers を参照。


%index
GetNextUmsListItem
スレッドコンテキストのリスト内の次のユーザーモードスケジューリング (UMS) スレッドコンテキストを返す。
%group
Win32 kernel32
%prm
UmsContext
UmsContext : [intptr] スレッドコンテキストのリストにある UMS コンテキストへのポインタ。このリストは DequeueUmsCompletionListItems 関数によって取得される。
%inst
スレッドコンテキストのリスト内の次のユーザーモードスケジューリング (UMS) スレッドコンテキストを返す。

[戻り値]
関数が成功した場合、リスト内の次のスレッドコンテキストへのポインタを返す。UmsContext
パラメータで指定したコンテキストの後にスレッドコンテキストがない場合、関数は NULL を返す。拡張エラー情報を取得するには
GetLastError を呼ぶ。


%index
GetNumaAvailableMemoryNode
指定したノードで利用可能なメモリの量を取得する。
%group
Win32 kernel32
%prm
Node, AvailableBytes
Node : [int] ノードの番号。
AvailableBytes : [var] ノードで利用可能なメモリの量（バイト単位）。
%inst
指定したノードで利用可能なメモリの量を取得する。

[戻り値]
関数が成功した場合の戻り値は 0 以外である。失敗した場合の戻り値は 0 である。拡張エラー情報を取得するには GetLastError
を呼ぶ。

[備考]
GetNumaAvailableMemoryNode
関数は、指定したノード上の空きページとゼロ化済みページが消費するメモリ量を返す。複数ノードを持つシステムでは、このメモリにスタンバイページは含まれない。したがって、システム内の全ノードの利用可能メモリ値の合計は
Free & Zero Page List Bytes メモリパフォーマンスカウンタの値に等しい。1
ノードのみのシステムでは、GetNumaAvailableMemoryNode が返す値はスタンバイページを含み、Available
Bytes メモリパフォーマンスカウンタの値に等しい。パフォーマンスカウンタの詳細は Memory Performance
Information を参照。


%index
GetNumaAvailableMemoryNodeEx
USHORT 値として指定したノードで利用可能なメモリの量を取得する。
%group
Win32 kernel32
%prm
Node, AvailableBytes
Node : [int] ノードの番号。
AvailableBytes : [var] ノードで利用可能なメモリの量（バイト単位）。
%inst
USHORT 値として指定したノードで利用可能なメモリの量を取得する。

[戻り値]
関数が成功した場合の戻り値は 0 以外である。失敗した場合の戻り値は 0 である。拡張エラー情報を取得するには GetLastError
を呼ぶ。

[備考]
GetNumaAvailableMemoryNodeEx
関数は、指定したノード上の空きページとゼロ化済みページが消費するメモリ量を返す。複数ノードを持つシステムでは、このメモリにスタンバイページは含まれない。したがって、システム内の全ノードの利用可能メモリ値の合計は
Free & Zero Page List Bytes メモリパフォーマンスカウンタの値に等しい。1
ノードのみのシステムでは、GetNumaAvailableMemoryNode が返す値はスタンバイページを含み、Available
Bytes メモリパフォーマンスカウンタの値に等しい。パフォーマンスカウンタの詳細は Memory Performance
Information を参照。GetNumaAvailableMemoryNodeEx 関数と
GetNumaAvailableMemoryNode 関数の唯一の違いは Node
パラメータのデータ型である。本関数を使用するアプリケーションをコンパイルするには、_WIN32_WINNT >= 0x0601
を設定する。詳細は Using the Windows Headers を参照。


%index
GetNumaHighestNodeNumber
現在最も高い番号を持つノードを取得する。
%group
Win32 kernel32
%prm
HighestNodeNumber
HighestNodeNumber : [var] 最も高いノードの番号。
%inst
現在最も高い番号を持つノードを取得する。

[戻り値]
関数が成功した場合の戻り値は 0 以外である。失敗した場合の戻り値は 0 である。拡張エラー情報を取得するには GetLastError
を呼ぶ。

[備考]

最も高いノードの番号は、ノードの総数と一致することは保証されない。ノード内の全プロセッサのリストを取得するには、GetNumaNodeProcessorMask
関数を使用する。


%index
GetNumaNodeNumberFromHandle
指定したファイルハンドルが表すファイルまたは I/O デバイスに関連付けられた NUMA ノードを取得する。
%group
Win32 kernel32
%prm
hFile, NodeNumber
hFile : [intptr] ファイルまたは I/O デバイスへのハンドル。I/O デバイスの例にはファイル、ファイルストリーム、ボリューム、物理ディスク、ソケットなどがある。詳細は CreateFile 関数を参照。
NodeNumber : [var] 指定したファイルハンドルに関連付けられた NUMA ノードの番号を受け取る変数へのポインタ。
%inst
指定したファイルハンドルが表すファイルまたは I/O デバイスに関連付けられた NUMA ノードを取得する。

[戻り値]
関数が成功した場合の戻り値は 0 以外である。失敗した場合の戻り値は 0 である。拡張エラー情報を取得するには GetLastError
を使用する。

[備考]
指定したハンドルに関連付けられたノードがない場合、関数は FALSE を返す。NodeNumber
パラメータの値は不定であり、使用するべきではない。本関数を使用するアプリケーションをコンパイルするには、_WIN32_WINNT >=
0x0601 を設定する。詳細は Using the Windows Headers を参照。


%index
GetNumaNodeProcessorMask
指定したノードのプロセッサマスクを取得する。
%group
Win32 kernel32
%prm
Node, ProcessorMask
Node : [int] ノードの番号。
ProcessorMask : [var] ノードのプロセッサマスク。プロセッサマスクは各ビットがプロセッサを表し、それがノード内にあるかを示すビットベクトルである。ノードに構成されたプロセッサがない場合、プロセッサマスクは 0 となる。64 を超えるプロセッサを持つシステムでは、ノードが呼び出し側スレッドと同じプロセッサグループにある場合のみ、本パラメータはそのノードのプロセッサマスクに設定される。それ以外の場合、本パラメータは 0 に設定される。
%inst
指定したノードのプロセッサマスクを取得する。

[戻り値]
関数が成功した場合の戻り値は 0 以外である。失敗した場合の戻り値は 0 である。拡張エラー情報を取得するには GetLastError
を呼ぶ。

[備考]
システム内で最も高い番号を持つノードを取得するには、GetNumaHighestNodeNumber
関数を使用する。この番号がシステム内のノードの総数と一致することは保証されないことに注意。プロセスのすべてのスレッドが同じノード上で実行されるようにするには、SetProcessAffinityMask
関数を使用し、同じノード内のプロセッサを指定するプロセスアフィニティマスクを使用する。任意のプロセッサグループのノードのプロセッサマスクを取得するには、GetNumaNodeProcessorMaskEx
関数を使用する。> [!NOTE] > *TBD Release Iron* 以降、本関数および他の NUMA 関数の動作は、64
を超えるプロセッサを含むノードを持つシステムをよりよくサポートするように変更されている。本 API
の以前の動作を有効にする方法を含む変更の詳細は [NUMA
Support](/windows/win32/procthread/numa-support) を参照。


%index
GetNumaNodeProcessorMaskEx
ノードが属するプロセッサグループに関わらず、ノードのプロセッサマスクを取得する。
%group
Win32 kernel32
%prm
Node, ProcessorMask
Node : [int] ノード番号。
ProcessorMask : [var] 指定したノードのプロセッサマスクを受け取る GROUP_AFFINITY 構造体へのポインタ。プロセッサマスクは各ビットがプロセッサを表し、それがノード内にあるかを示すビットベクトルである。指定したノードに構成されたプロセッサがない場合、Mask メンバは 0 となり、Group メンバは未定義である。
%inst
ノードが属するプロセッサグループに関わらず、ノードのプロセッサマスクを取得する。

[戻り値]
関数が成功した場合の戻り値は 0 以外である。失敗した場合の戻り値は 0 である。

[備考]
GetNumaNodeProcessorMaskEx 関数は GetNumaNodeProcessorMask
と異なり、ノードが属するグループに関わらずノードのプロセッサマスクを取得できる。すなわち、ノードは呼び出し側スレッドと同じグループにある必要はない。GetNumaNodeProcessorMask
関数は呼び出し側スレッドと同じグループにあるノードのプロセッサマスクのみを取得できる。システム内で最も高い番号を持つノードを取得するには、GetNumaHighestNodeNumber
関数を使用する。この番号がシステム内のノードの総数と一致することは保証されないことに注意。プロセスのすべてのスレッドが同じノード上で実行されるようにするには、SetProcessAffinityMask
関数を使用し、同じノード内のプロセッサを指定するプロセスアフィニティマスクを使用する。本関数を使用するアプリケーションをコンパイルするには、_WIN32_WINNT
>= 0x0601 を設定する。詳細は Using the Windows Headers を参照。
> [!NOTE] > *TBD Release Iron* 以降、本関数および他の NUMA 関数の動作は、64
を超えるプロセッサを含むノードを持つシステムをよりよくサポートするように変更されている。本 API
の以前の動作を有効にする方法を含む変更の詳細は [NUMA
Support](/windows/win32/procthread/numa-support) を参照。


%index
GetNumaProcessorNode
指定したプロセッサのノード番号を取得する。
%group
Win32 kernel32
%prm
Processor, NodeNumber
Processor : [int] プロセッサ番号。64 を超える論理プロセッサを持つシステムでは、プロセッサ番号は呼び出し側スレッドが動作しているプロセッサを含むプロセッサグループに対する相対値である。
NodeNumber : [var] ノード番号。プロセッサが存在しない場合、本パラメータは 0xFF となる。
%inst
指定したプロセッサのノード番号を取得する。

[戻り値]
関数が成功した場合の戻り値は 0 以外である。失敗した場合の戻り値は 0 である。拡張エラー情報を取得するには GetLastError
を呼ぶ。

[備考]
システム上のプロセッサのリストを取得するには、GetProcessAffinityMask 関数を使用する。


%index
GetNumaProcessorNodeEx
指定した論理プロセッサのノード番号を USHORT 値として取得する。
%group
Win32 kernel32
%prm
Processor, NodeNumber
Processor : [var] 論理プロセッサとそれが割り当てられているプロセッサグループを表す PROCESSOR_NUMBER 構造体へのポインタ。
NodeNumber : [var] ノード番号を受け取る変数へのポインタ。指定したプロセッサが存在しない場合、本パラメータは MAXUSHORT に設定される。
%inst
指定した論理プロセッサのノード番号を USHORT 値として取得する。

[戻り値]
関数が成功した場合、戻り値は 0 以外。関数が失敗した場合、戻り値は 0。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
この関数を使用するアプリケーションをコンパイルするには、_WIN32_WINNT >= 0x0601 を設定する。詳細は Using
the Windows Headers を参照。


%index
GetNumaProximityNode
指定した近接ドメイン識別子に対応する NUMA ノード番号を取得する。
%group
Win32 kernel32
%prm
ProximityId, NodeNumber
ProximityId : [int] ノードの近接ドメイン識別子。
NodeNumber : [var] ノード番号。プロセッサが存在しない場合、このパラメータは 0xFF。
%inst
指定した近接ドメイン識別子に対応する NUMA ノード番号を取得する。

[戻り値]
関数が成功した場合、戻り値は 0 以外。関数が失敗した場合、戻り値は 0。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
近接ドメイン識別子は、NUMA システム上の NUMA ノードへのインデックスである。近接ドメイン識別子は ACPI System
Resource Affinity Table (SRAT) に存在し、プロセッサやメモリ領域を特定の NUMA
ノードに関連付けるために使用される。また、ACPI 名前空間にも存在し、デバイスを特定の NUMA
ノードに関連付けるために使用される。近接ドメイン識別子は通常、システム製造元が提供する管理アプリケーションでのみ使用される。Windows
は NUMA ノードを識別するために近接ドメイン識別子を使用せず、代わりにシステム内の各 NUMA
ノードに固有の番号を割り当てる。システム上のノード間の相対距離は ACPI System Locality Distance
Information Table (SLIT) に格納されているが、Windows の関数からは公開されていない。ACPI
テーブルの詳細は ACPI 仕様を参照。


%index
GetNumaProximityNodeEx
指定した近接識別子に対応する NUMA ノード番号を USHORT 値として取得する。
%group
Win32 kernel32
%prm
ProximityId, NodeNumber
ProximityId : [int] ノードの近接識別子。
NodeNumber : [var] 指定した近接識別子に対するノード番号を受け取る変数を指す。
%inst
指定した近接識別子に対応する NUMA ノード番号を USHORT 値として取得する。

[戻り値]
関数が成功した場合、戻り値は 0 以外。関数が失敗した場合、戻り値は 0。

[備考]
近接ドメイン識別子は、NUMA システム上の NUMA ノードへのインデックスである。近接ドメイン識別子は ACPI System
Resource Affinity Table (SRAT) に存在し、プロセッサやメモリ領域を特定の NUMA
ノードに関連付けるために使用される。また、ACPI 名前空間にも存在し、デバイスを特定の NUMA
ノードに関連付けるために使用される。近接ドメイン識別子は通常、システム製造元が提供する管理アプリケーションでのみ使用される。Windows
は NUMA ノードを識別するために近接ドメイン識別子を使用せず、代わりにシステム内の各 NUMA
ノードに固有の番号を割り当てる。システム上のノード間の相対距離は ACPI System Locality Distance
Information Table (SLIT) に格納されているが、Windows の関数からは公開されていない。ACPI
テーブルの詳細は ACPI 仕様を参照。GetNumaProximityNodeEx と GetNumaProximityNode
の唯一の違いは、NodeNumber
パラメータのデータ型である。この関数を使用するアプリケーションをコンパイルするには、_WIN32_WINNT >= 0x0601
を設定する。詳細は Using the Windows Headers を参照。


%index
GetNumberFormatW
数値文字列を、識別子で指定したロケール用にカスタマイズした数値文字列としてフォーマットする。(Unicode)
%group
Win32 kernel32
%prm
Locale, dwFlags, lpValue, lpFormat, lpNumberStr, cchNumber
Locale : [int] ロケールを指定するロケール識別子。MAKELCID マクロを使用してロケール識別子を作成するか、以下の定義済み値のいずれかを使用できる。
dwFlags : [int] 関数の動作を制御するフラグ。lpFormat が NULL に設定されていない場合、アプリケーションはこのパラメータを 0 に設定する必要がある。この場合、関数はロケールの既定の数値形式に対するユーザー上書きを使用して文字列をフォーマットする。lpFormat が NULL に設定されている場合、アプリケーションは LOCALE_NOUSEROVERRIDE を指定して、指定したロケールに対するシステム既定の数値形式で文字列をフォーマットできる。注意 LOCALE_NOUSEROVERRIDE の使用はユーザー設定を無効にするため、強く非推奨である。
lpValue : [wstr] フォーマット対象の数値文字列を含む null 終端文字列へのポインタ。この文字列は以下の文字のみを含むことができる。それ以外の文字はすべて無効である。lpValue が示す文字列がこれらの規則から逸脱している場合、関数はエラーを返す。
lpFormat : [var] 数値書式情報を含む NUMBERFMT 構造体へのポインタ。すべてのメンバが適切な値に設定されている必要がある。このパラメータが NULL に設定されていない場合、関数は構造体で指定されていない書式情報（たとえば負号のロケール固有文字列値）にのみロケールを使用する。
lpNumberStr : [wstr] この関数がフォーマット済み数値文字列を取得するバッファへのポインタ。
cchNumber : [int] lpNumberStr が示す数値文字列バッファのサイズ（TCHAR 単位）。アプリケーションはこのパラメータを 0 に設定することもできる。その場合、関数は数値文字列バッファに必要なサイズを返し、lpNumberStr パラメータを使用しない。
%inst
数値文字列を、識別子で指定したロケール用にカスタマイズした数値文字列としてフォーマットする。(Unicode)

[戻り値]
成功した場合、lpNumberStr が示すバッファに取得された TCHAR 値の数を返す。cchNumber パラメータが 0
に設定されている場合、関数はフォーマット済み数値文字列を保持するために必要な文字数（終端 null
文字を含む）を返す。成功しなかった場合、関数は 0 を返す。拡張エラー情報を取得するには、アプリケーションは GetLastError
を呼ぶ。これは以下のいずれかのエラーコードを返す。
（以下省略）

[備考]

この関数はカスタムロケールからデータを取得できる。データはコンピュータ間やアプリケーションの実行間で同じであることは保証されない。アプリケーションがデータを永続化または送信する必要がある場合は、Using
Persistent Locale Data を参照。Unicode 専用ロケール識別子と共にこの関数の ANSI
版を使用する場合、オペレーティングシステムがシステムコードページを使用するため関数は成功し得る。ただし、システムコードページで未定義の文字は文字列内で疑問符
(?) として現れる。
> [!NOTE] > winnls.h ヘッダは GetNumberFormat を、UNICODE プリプロセッサ定数の定義に基づいて
ANSI または Unicode
版を自動選択するエイリアスとして定義する。エンコーディング中立なエイリアスとそうでないコードを混在させると、コンパイルや実行時のエラーを引き起こす不一致が生じうる。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
GetNumberFormatEx
数値文字列を、名前で指定したロケール用にカスタマイズした数値文字列としてフォーマットする。注意 Windows Vista 以降のみで動作するように設計されているアプリケーションは、GetNumberFormat よりもこの関数を優先して呼び出すべきである。注意 この関数は、カスタムロケールなどの理由でリリース間で変化するデータをフォーマットできる。アプリケーションがデータを永続化または送信する必要がある場合は、Using Persistent Locale Data を参照。
%group
Win32 kernel32
%prm
lpLocaleName, dwFlags, lpValue, lpFormat, lpNumberStr, cchNumber
lpLocaleName : [wstr] ロケール名へのポインタ、または以下の定義済み値のいずれか。
dwFlags : [int] 関数の動作を制御するフラグ。lpFormat が NULL に設定されていない場合、アプリケーションはこのパラメータを 0 に設定する必要がある。この場合、関数はロケールの既定の数値形式に対するユーザー上書きを使用して文字列をフォーマットする。lpFormat が NULL に設定されている場合、アプリケーションは LOCALE_NOUSEROVERRIDE を指定して、指定したロケールに対するシステム既定の数値形式で文字列をフォーマットできる。注意 LOCALE_NOUSEROVERRIDE の使用はユーザー設定を無効にするため、強く非推奨である。
lpValue : [wstr] フォーマット対象の数値文字列を含む null 終端文字列へのポインタ。この文字列は以下の文字のみを含むことができる。それ以外の文字はすべて無効である。lpValue が示す文字列がこれらの規則から逸脱している場合、関数はエラーを返す。
lpFormat : [var] 数値書式情報を含む NUMBERFMT 構造体へのポインタ。すべてのメンバが適切な値に設定されている必要がある。アプリケーションがこのパラメータを NULL に設定しない場合、関数は構造体で指定されていない書式情報（たとえば負号のロケール文字列値）にのみロケールを使用する。
lpNumberStr : [wstr] この関数がフォーマット済み数値文字列を取得するバッファへのポインタ。あるいは、cchNumber が 0 に設定されている場合、このパラメータは NULL を含む。その場合、関数は数値文字列バッファに必要なサイズを返す。
cchNumber : [int] lpNumberStr が示す数値文字列バッファのサイズ（文字数）。アプリケーションはこのパラメータを 0 に設定することもできる。その場合、関数は数値文字列バッファに必要なサイズを返し、lpNumberStr パラメータを使用しない。
%inst
数値文字列を、名前で指定したロケール用にカスタマイズした数値文字列としてフォーマットする。注意 Windows Vista
以降のみで動作するように設計されているアプリケーションは、GetNumberFormat よりもこの関数を優先して呼び出すべきである。注意
この関数は、カスタムロケールなどの理由でリリース間で変化するデータをフォーマットできる。アプリケーションがデータを永続化または送信する必要がある場合は、Using
Persistent Locale Data を参照。

[戻り値]
成功した場合、lpNumberStr が示すバッファに取得された文字数を返す。cchNumber パラメータが 0
に設定されている場合、関数はフォーマット済み数値文字列を保持するために必要な文字数（終端 null
文字を含む）を返す。成功しなかった場合、関数は 0 を返す。拡張エラー情報を取得するには、アプリケーションは GetLastError
を呼ぶ。これは以下のいずれかのエラーコードを返す。
（以下省略）

[備考]
Windows 8 以降: アプリケーションが Windows.Globalization 名前空間から言語タグをこの関数に渡す場合、まず
ResolveLocaleName を呼び出してタグを変換する必要がある。


%index
GetNumberOfConsoleInputEvents
コンソールの入力バッファ内の未読入力レコード数を取得する。
%group
Win32 kernel32
%prm
hConsoleInput, lpNumberOfEvents
hConsoleInput : [intptr] コンソール入力バッファのハンドル。ハンドルは **GENERIC\_READ** アクセス権を持つ必要がある。詳細は [Console Buffer Security and Access Rights](console-buffer-security-and-access-rights.md) を参照。
lpNumberOfEvents : [var] 
%inst
コンソールの入力バッファ内の未読入力レコード数を取得する。

[戻り値]
関数が成功した場合、戻り値は 0 以外。関数が失敗した場合、戻り値は 0。拡張エラー情報を取得するには
[**GetLastError**](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror)
を呼ぶ。

[備考]
**GetNumberOfConsoleInputEvents**
関数は、入力バッファ内の未読入力レコードの総数（キーボード、マウス、ウィンドウサイズ変更入力レコードを含む）を報告する。[**ReadFile**](/windows/win32/api/fileapi/nf-fileapi-readfile)
または [**ReadConsole**](readconsole.md)
関数を使用するプロセスはキーボード入力のみを読み取れる。[**ReadConsoleInput**](readconsoleinput.md)
関数を使用するプロセスはあらゆる種類の入力レコードを読み取れる。プロセスは、未読のコンソール入力があるタイミングを判定するために、待機関数の
1
つにコンソール入力バッファのハンドルを指定できる。入力バッファが空でない場合、コンソール入力バッファのハンドルの状態はシグナル状態となる。未読レコード数に影響を与えずにコンソール入力バッファから入力レコードを読み取るには、[**PeekConsoleInput**](peekconsoleinput.md)
関数を使用する。コンソールの入力バッファ内のすべての未読レコードを破棄するには、[**FlushConsoleInputBuffer**](flushconsoleinputbuffer.md)
関数を使用する。


%index
GetNumberOfConsoleMouseButtons
現在のコンソールが使用するマウスのボタン数を取得する。
%group
Win32 kernel32
%prm
lpNumberOfMouseButtons
lpNumberOfMouseButtons : [var] マウスボタン数を受け取る変数へのポインタ。
%inst
現在のコンソールが使用するマウスのボタン数を取得する。

[戻り値]
関数が成功した場合、戻り値は 0 以外。関数が失敗した場合、戻り値は 0。拡張エラー情報を取得するには
[**GetLastError**](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror)
を呼ぶ。

[備考]

コンソールがマウス入力を受信すると、[**MOUSE\_EVENT\_RECORD**](mouse-event-record-str.md)
構造体を含む [**INPUT\_RECORD**](input-record-str.md)
構造体がコンソールの入力バッファに置かれる。**MOUSE\_EVENT\_RECORD** の **dwButtonState**
メンバは、各マウスボタンの状態を示すビットを持つ。ボタンが押されている場合は 1、離されている場合は 0
となる。有効なビット数を判定するには **GetNumberOfConsoleMouseButtons** を使用する。> [!TIP]
> この API
は推奨されておらず、**[仮想ターミナル](console-virtual-terminal-sequences.md)**
に同等のものはない。この決定は意図的に Windows
プラットフォームを他のオペレーティングシステムと整合させるものである。この状態はローカルユーザー、セッション、特権コンテキストにのみ関係する。SSH
のようなクロスプラットフォームのユーティリティやトランスポート経由でリモート操作されるアプリケーションでは、この API
を使用すると期待通りに動作しない場合がある。


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
GetOverlappedResult
指定したファイル、名前付きパイプ、または通信デバイスに対するオーバーラップ処理の結果を取得する。
%group
Win32 kernel32
%prm
hFile, lpOverlapped, lpNumberOfBytesTransferred, bWait
hFile : [intptr] ファイル、名前付きパイプ、または通信デバイスのハンドル。これは以下のいずれかの関数の呼び出しによってオーバーラップ処理を開始した際に指定したものと同じハンドルである: - [ReadFile](../fileapi/nf-fileapi-readfile.md) - [WriteFile](../fileapi/nf-fileapi-writefile.md) - [ConnectNamedPipe](../namedpipeapi/nf-namedpipeapi-connectnamedpipe.md) - [TransactNamedPipe](../namedpipeapi/nf-namedpipeapi-transactnamedpipe.md) - [DeviceIoControl](./nf-ioapiset-deviceiocontrol.md) - [WaitCommEvent](../winbase/nf-winbase-waitcommevent.md) - [ReadDirectoryChangesW](../winbase/nf-winbase-readdirectorychangesw.md) - [LockFileEx](../fileapi/nf-fileapi-lockfileex.md) - [ReadDirectoryChangesW](../winbase/nf-winbase-readdirectorychangesw.md)
lpOverlapped : [var] オーバーラップ処理の開始時に指定された OVERLAPPED 構造体へのポインタ。
lpNumberOfBytesTransferred : [var] 読み取りまたは書き込み処理で実際に転送されたバイト数を受け取る変数へのポインタ。TransactNamedPipe 処理の場合、これはパイプから読み取られたバイト数である。DeviceIoControl 処理の場合、これはデバイスドライバから返された出力データのバイト数である。ConnectNamedPipe または WaitCommEvent 処理の場合、この値は未定義である。
bWait : [int] このパラメータが TRUE で、lpOverlapped 構造体の Internal メンバが STATUS_PENDING の場合、関数は処理が完了するまで戻らない。FALSE で処理がまだ保留中の場合、関数は FALSE を返し、GetLastError は ERROR_IO_INCOMPLETE を返す。
%inst
指定したファイル、名前付きパイプ、または通信デバイスに対するオーバーラップ処理の結果を取得する。

[戻り値]
関数が成功した場合、戻り値は 0 以外。関数が失敗した場合、戻り値は 0。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
GetOverlappedResult 関数によって報告される結果は、指定された OVERLAPPED
構造体が指定された、指定ハンドルの最後のオーバーラップ処理のもので、その処理結果が保留中のものである。処理を開始した関数が FALSE
を返し GetLastError が ERROR_IO_PENDING を返すと、保留中の処理であることが示される。I/O
処理が保留中のとき、処理を開始した関数は OVERLAPPED 構造体の hEvent
メンバを非シグナル状態にリセットする。その後、保留中の処理が完了すると、システムはイベントオブジェクトをシグナル状態に設定する。bWait
パラメータが TRUE の場合、GetOverlappedResult
はイベントオブジェクトがシグナル状態になるのを待つことで保留中の処理が完了したかどうかを判定する。OVERLAPPED 構造体の
hEvent メンバが NULL の場合、システムは hFile
ハンドルの状態を使用して処理完了をシグナル化する。この目的でファイル、名前付きパイプ、通信デバイスのハンドルを使用することは推奨されない。同じファイル、名前付きパイプ、通信デバイスに対して複数の同時オーバーラップ処理が行われたときに混乱が生じうるため、イベントオブジェクトを使用する方が安全である。この状況では、どの処理がオブジェクトの状態をシグナル化したのかを知る方法がない。


%index
GetPhysicallyInstalledSystemMemory
コンピュータに物理的に搭載されている RAM の量を取得する。
%group
Win32 kernel32
%prm
TotalMemoryInKilobytes
TotalMemoryInKilobytes : [var] 物理的に搭載された RAM のキロバイト単位の量を受け取る変数へのポインタ。
%inst
コンピュータに物理的に搭載されている RAM の量を取得する。

[戻り値]
関数が成功した場合、TRUE を返し、TotalMemoryInKilobytes パラメータを 0
以外の値に設定する。関数が失敗した場合、FALSE を返し、TotalMemoryInKilobytes
パラメータを変更しない。拡張エラー情報を取得するには GetLastError 関数を使用する。一般的なエラーは以下の表に示す。
（以下省略）

[備考]
GetPhysicallyInstalledSystemMemory 関数は、コンピュータの SMBIOS
ファームウェアテーブルから物理的に搭載された RAM の量を取得する。これは GlobalMemoryStatusEx
関数が報告する量とは異なる場合がある。GlobalMemoryStatusEx は MEMORYSTATUSEX 構造体の
ullTotalPhys メンバに、オペレーティングシステムが利用可能な物理メモリの量を設定する。BIOS
や一部のドライバがメモリマップドデバイス用の I/O
領域としてメモリを予約する場合があり、これによりオペレーティングシステムやアプリケーションが利用できないことがあるため、オペレーティングシステムが利用可能なメモリ量はコンピュータに物理的に搭載されたメモリ量より少ないことがある。GetPhysicallyInstalledSystemMemory
関数で取得される物理メモリ量は、GlobalMemoryStatusEx
が報告する量以上でなければならない。それ以下である場合、SMBIOS データが不正であり、関数は ERROR_INVALID_DATA
で失敗する。SMBIOS データが不正である場合、ユーザーのコンピュータに問題がある可能性がある。


%index
GetPriorityClass
指定したプロセスの優先度クラスを取得する。この値は、プロセスの各スレッドの優先度値と組み合わさって、各スレッドの基本優先度レベルを決定する。
%group
Win32 kernel32
%prm
hProcess
hProcess : [intptr] プロセスのハンドル。
%inst

指定したプロセスの優先度クラスを取得する。この値は、プロセスの各スレッドの優先度値と組み合わさって、各スレッドの基本優先度レベルを決定する。

[戻り値]
関数が成功した場合、戻り値は指定したプロセスの優先度クラス。関数が失敗した場合、戻り値は 0。拡張エラー情報を取得するには
GetLastError を呼ぶ。プロセスの優先度クラスは以下の値のいずれかである。
（以下省略）

[備考]

すべてのスレッドは、スレッドの優先度値とそのプロセスの優先度クラスによって決まる基本優先度レベルを持つ。オペレーティングシステムは、すべての実行可能スレッドの基本優先度レベルを使用して、次に
CPU
時間スライスを取得するスレッドを決定する。スレッドは各優先度レベルでラウンドロビン方式でスケジュールされ、より上位のレベルに実行可能スレッドがない場合にのみ、下位レベルのスレッドのスケジューリングが行われる。優先度クラスとスレッド優先度値の各組み合わせに対する基本優先度レベルを示す表は
Scheduling Priorities
を参照。優先度クラスはエグゼクティブによって維持されるため、すべてのプロセスはクエリ可能な優先度クラスを持つ。


%index
GetPrivateProfileIntW
GetPrivateProfileIntW (Unicode) 関数 (winbase.h) は、初期化ファイルの指定セクション内のキーに関連付けられた整数を取得する。
%group
Win32 kernel32
%prm
lpAppName, lpKeyName, nDefault, lpFileName
lpAppName : [wstr] 初期化ファイル内のセクション名。
lpKeyName : [wstr] 値を取得するキーの名前。この値は文字列形式である。GetPrivateProfileInt 関数は文字列を整数に変換して返す。
nDefault : [int] 初期化ファイル内でキー名が見つからない場合に返す既定値。
lpFileName : [wstr] 初期化ファイルの名前。このパラメータがファイルへのフルパスを含まない場合、システムは Windows ディレクトリ内でファイルを検索する。
%inst
GetPrivateProfileIntW (Unicode) 関数 (winbase.h)
は、初期化ファイルの指定セクション内のキーに関連付けられた整数を取得する。

[戻り値]
戻り値は、指定した初期化ファイル内の指定キー名に続く文字列の整数等価値。キーが見つからない場合、戻り値は指定した既定値である。

[備考]
関数は、lpAppName パラメータで指定したセクション名の下で lpKeyName
パラメータで指定した名前と一致するキーをファイルから検索する。初期化ファイル内のセクションは以下の形式でなければならない。
（以下省略）


%index
GetPrivateProfileSectionW
GetPrivateProfileSectionW (Unicode) 関数 (winbase.h) は、初期化ファイルの指定セクションのすべてのキーと値を取得する。
%group
Win32 kernel32
%prm
lpAppName, lpReturnedString, nSize, lpFileName
lpAppName : [wstr] 初期化ファイル内のセクション名。
lpReturnedString : [wstr] 指定したセクションに関連するキー名と値のペアを受け取るバッファへのポインタ。バッファは 1 つ以上の null 終端文字列で埋められ、最後の文字列の後にはさらに null 文字が続く。
nSize : [int] lpReturnedString パラメータが指すバッファのサイズ（文字数）。
lpFileName : [wstr] 初期化ファイルの名前。このパラメータがファイルへのフルパスを含まない場合、システムは Windows ディレクトリ内でファイルを検索する。
%inst
GetPrivateProfileSectionW (Unicode) 関数 (winbase.h)
は、初期化ファイルの指定セクションのすべてのキーと値を取得する。

[戻り値]
戻り値は、バッファにコピーされた文字数（終端 null
文字を除く）。バッファが指定したセクションに関連するすべてのキー名と値のペアを含むのに十分な大きさでない場合、戻り値は nSize から
2 を引いた値に等しい。

[備考]
lpReturnedString パラメータが指すバッファ内のデータは、1 つ以上の null 終端文字列で構成され、最後に null
文字が続く。各文字列は次の形式である: key=string GetPrivateProfileSection
関数は大文字と小文字を区別しない。lpAppName
パラメータが指す文字列は大文字と小文字の組み合わせでよい。この処理はアトミックである。セクションのキー名と値のペアが
lpReturnedString
パラメータが指すバッファにコピーされている間、指定した初期化ファイルへの更新は許可されない。システムはほとんどの .ini
ファイル参照を、以下のレジストリキーの下で定義されたマッピングを使用してレジストリにマップする:
HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows
NT\CurrentVersion\IniFileMapping
このマッピングは、Control.ini、System.ini、Winfile.ini
などのシステムコンポーネント初期化ファイルをアプリケーションが変更する場合に発生する可能性が高い。これらの場合、関数は初期化ファイルからではなくレジストリから情報を取得する。格納場所の変更は関数の動作に影響を与えない。プロファイル関数は以下の手順で初期化情報を見つける。
（以下省略）


%index
GetPrivateProfileSectionNamesW
GetPrivateProfileSectionNamesW (Unicode) 関数 (winbase.h) は、初期化ファイル内のすべてのセクション名を取得する。
%group
Win32 kernel32
%prm
lpszReturnBuffer, nSize, lpFileName
lpszReturnBuffer : [wstr] 指定したファイルに関連付けられたセクション名を受け取るバッファへのポインタ。バッファは 1 つ以上の null 終端文字列で埋められ、最後の文字列の後にはさらに null 文字が続く。
nSize : [int] lpszReturnBuffer パラメータが指すバッファのサイズ（文字数）。
lpFileName : [wstr] 初期化ファイルの名前。このパラメータが NULL の場合、関数は Win.ini ファイルを検索する。このパラメータがファイルへのフルパスを含まない場合、システムは Windows ディレクトリ内でファイルを検索する。
%inst
GetPrivateProfileSectionNamesW (Unicode) 関数 (winbase.h)
は、初期化ファイル内のすべてのセクション名を取得する。

[戻り値]
戻り値は、指定したバッファにコピーされた文字数（終端 null
文字を除く）。バッファが指定した初期化ファイルに関連するすべてのセクション名を含むのに十分な大きさでない場合、戻り値は nSize
で指定したサイズから 2 を引いた値に等しい。

[備考]
この処理はアトミックである。セクション名がバッファにコピーされている間、初期化ファイルへの更新は許可されない。システムはほとんどの
.ini ファイル参照を、以下のレジストリキーの下で定義されたマッピングを使用してレジストリにマップする:
HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows
NT\CurrentVersion\IniFileMapping
このマッピングは、Control.ini、System.ini、Winfile.ini
などのシステムコンポーネント初期化ファイルをアプリケーションが変更する場合に発生する可能性が高い。これらの場合、関数は初期化ファイルからではなくレジストリから情報を取得する。格納場所の変更は関数の動作に影響を与えない。プロファイル関数は以下の手順で初期化情報を見つける。
（以下省略）


%index
GetPrivateProfileStringW
GetPrivateProfileStringW (Unicode) 関数 (winbase.h) は、初期化ファイルの指定セクションから文字列を取得する。
%group
Win32 kernel32
%prm
lpAppName, lpKeyName, lpDefault, lpReturnedString, nSize, lpFileName
lpAppName : [wstr] キー名を含むセクションの名前。このパラメータが NULL の場合、GetPrivateProfileString 関数はファイル内のすべてのセクション名を指定バッファにコピーする。
lpKeyName : [wstr] 関連付けられた文字列を取得するキーの名前。このパラメータが NULL の場合、lpAppName パラメータで指定したセクション内のすべてのキー名が lpReturnedString パラメータで指定したバッファにコピーされる。
lpDefault : [wstr] 既定の文字列。lpKeyName キーが初期化ファイル内に見つからない場合、GetPrivateProfileString は既定の文字列を lpReturnedString バッファにコピーする。
lpReturnedString : [wstr] 取得した文字列を受け取るバッファへのポインタ。
nSize : [int] lpReturnedString パラメータが指すバッファのサイズ（文字数）。
lpFileName : [wstr] 初期化ファイルの名前。このパラメータがファイルへのフルパスを含まない場合、システムは Windows ディレクトリ内でファイルを検索する。
%inst
GetPrivateProfileStringW (Unicode) 関数 (winbase.h)
は、初期化ファイルの指定セクションから文字列を取得する。

[戻り値]
戻り値は、バッファにコピーされた文字数（終端 null 文字を除く）。lpAppName と lpKeyName のいずれも NULL
でなく、指定された宛先バッファが要求された文字列を保持するには小さすぎる場合、文字列は切り詰められて null 文字が続き、戻り値は
nSize から 1 を引いた値に等しい。lpAppName または lpKeyName のいずれかが NULL
で、指定された宛先バッファがすべての文字列を保持するには小さすぎる場合、最後の文字列は切り詰められて 2 つの null
文字が続く。この場合、戻り値は nSize から 2 を引いた値に等しい。lpFileName
で指定された初期化ファイルが見つからない、または無効な値を含む場合、この関数は errorno を '0x2' (File Not
Found) の値に設定する。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
GetPrivateProfileString 関数は、lpAppName パラメータで指定したセクション見出しの下で lpKeyName
パラメータで指定した名前と一致するキーを、指定した初期化ファイルから検索する。キーが見つかると、関数は対応する文字列をバッファにコピーする。キーが存在しない場合、関数は
lpDefault パラメータで指定した既定文字列をコピーする。初期化ファイル内のセクションは以下の形式でなければならない。
（以下省略）


%index
GetPrivateProfileStructW
GetPrivateProfileStructW (Unicode) 関数 (winbase.h) は、初期化ファイルの指定セクション内のキーに関連付けられたデータを取得する。
%group
Win32 kernel32
%prm
lpszSection, lpszKey, lpStruct, uSizeStruct, szFile
lpszSection : [wstr] 初期化ファイル内のセクション名。
lpszKey : [wstr] データを取得するキーの名前。
lpStruct : [intptr] ファイル名、セクション名、キー名に関連付けられたデータを受け取るバッファへのポインタ。
uSizeStruct : [int] lpStruct パラメータが指すバッファのサイズ（バイト数）。
szFile : [wstr] 初期化ファイルの名前。このパラメータがファイルへのフルパスを含まない場合、システムは Windows ディレクトリ内でファイルを検索する。
%inst
GetPrivateProfileStructW (Unicode) 関数 (winbase.h)
は、初期化ファイルの指定セクション内のキーに関連付けられたデータを取得する。

[戻り値]
関数が成功した場合、戻り値は 0 以外。関数が失敗した場合、戻り値は 0。

[備考]
初期化ファイル内のセクションは以下の形式でなければならない。
（以下省略）


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
GetProcessAffinityMask
指定したプロセスのプロセスアフィニティマスクと、システムのシステムアフィニティマスクを取得する。
%group
Win32 kernel32
%prm
hProcess, lpProcessAffinityMask, lpSystemAffinityMask
hProcess : [intptr] アフィニティマスクを取得したいプロセスのハンドル。このハンドルは PROCESS_QUERY_INFORMATION または PROCESS_QUERY_LIMITED_INFORMATION アクセス権を持つ必要がある。詳細は Process Security and Access Rights を参照。Windows Server 2003 および Windows XP: ハンドルは PROCESS_QUERY_INFORMATION アクセス権を持つ必要がある。
lpProcessAffinityMask : [var] 指定したプロセスのアフィニティマスクを受け取る変数へのポインタ。
lpSystemAffinityMask : [var] システムのアフィニティマスクを受け取る変数へのポインタ。
%inst
指定したプロセスのプロセスアフィニティマスクと、システムのシステムアフィニティマスクを取得する。

[戻り値]
関数が成功した場合、戻り値は 0 以外で、関数は lpProcessAffinityMask と lpSystemAffinityMask
が指す変数を適切なアフィニティマスクに設定する。64
を超えるプロセッサを持つシステムで、呼び出しプロセスのスレッドが単一のプロセッサグループに存在する場合、関数は
lpProcessAffinityMask と lpSystemAffinityMask
が指す変数を、プロセスアフィニティマスクとそのグループのアクティブな論理プロセッサのプロセッサマスクに設定する。呼び出しプロセスが複数のグループにスレッドを持つ場合、関数は両方のアフィニティマスクに
0 を返す。関数が失敗した場合、戻り値は 0 で、lpProcessAffinityMask と lpSystemAffinityMask
が指す変数の値は未定義となる。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]

プロセスアフィニティマスクは、各ビットがプロセスの実行を許可されたプロセッサを表すビットベクタである。システムアフィニティマスクは、各ビットがシステムに構成されているプロセッサを表すビットベクタである。プロセスアフィニティマスクはシステムアフィニティマスクのサブセットである。プロセスはシステムに構成されているプロセッサ上でのみ実行可能である。したがって、システムアフィニティマスクが特定のプロセッサに
0 ビットを指定している場合、プロセスアフィニティマスクはそのプロセッサに 1 ビットを指定できない。Windows 11 および
Windows Server 2022 以降では、64
を超えるプロセッサを持つシステムにおいて、プロセスとスレッドのアフィニティは既定でシステム内のすべてのプロセッサ群（すべてのプロセッサグループにまたがる）に及ぶ。GetProcessAffinityMask
関数は、lpProcessAffinityMask と lpSystemAffinityMask
をプロセスのプライマリグループ上のプロセスおよびシステムプロセッサマスクに設定する。プロセスがプロセスのプライマリグループ外で 1
つ以上のスレッドのアフィニティを明示的に設定していた場合、関数は両方のアフィニティマスクに 0 を返す。ただし、hHandle
が現在のプロセスへのハンドルを指定する場合、関数は常に呼び出しスレッドのプライマリグループ（既定ではプロセスのプライマリグループと同じ）を使用して
lpProcessAffinityMask と lpSystemAffinityMask を設定する。


%index
GetProcessDEPPolicy
指定した 32 ビットプロセスのデータ実行防止 (DEP) と DEP-ATL サンクエミュレーション設定を取得する。Windows XP with SP3: 現在のプロセスの DEP と DEP-ATL サンクエミュレーション設定を取得する。
%group
Win32 kernel32
%prm
hProcess, lpFlags, lpPermanent
hProcess : [intptr] プロセスのハンドル。プロセスの DEP ポリシーを取得するには PROCESS_QUERY_INFORMATION 特権が必要である。Windows XP with SP3: hProcess パラメータは無視される。
lpFlags : [var] DWORD で、以下のフラグの 1 つ以上を受け取る。
lpPermanent : [var] 指定したプロセスについて DEP が永続的に有効化または無効化されている場合は TRUE、そうでない場合は FALSE。lpPermanent が TRUE の場合、現在の DEP 設定はプロセスの存続期間中保持され、SetProcessDEPPolicy を呼び出して変更することはできない。
%inst
指定した 32 ビットプロセスのデータ実行防止 (DEP) と DEP-ATL サンクエミュレーション設定を取得する。Windows XP
with SP3: 現在のプロセスの DEP と DEP-ATL サンクエミュレーション設定を取得する。

[戻り値]
関数が成功した場合、TRUE を返す。関数が失敗した場合、FALSE を返す。この関数で定義されたエラー値を取得するには
GetLastError を呼ぶ。

[備考]
GetProcessDEPPolicy は 32 ビットプロセスでのみサポートされる。64 ビットプロセス上でこの関数を呼び出すと
ERROR_NOT_SUPPORTED で失敗する。この関数を呼び出すアプリケーションをコンパイルするには、_WIN32_WINNT を
0x0600 以降として定義する。詳細は Using the Windows Headers を参照。


%index
GetProcessGroupAffinity
指定したプロセスのプロセッサグループアフィニティを取得する。
%group
Win32 kernel32
%prm
hProcess, GroupCount, GroupArray
hProcess : [intptr] プロセスのハンドル。このハンドルは PROCESS_QUERY_INFORMATION または PROCESS_QUERY_LIMITED_INFORMATION アクセス権を持つ必要がある。詳細は Process Security and Access Rights を参照。
GroupCount : [var] 入力時には GroupArray 配列の要素数を指定する。出力時には配列に書き込まれたプロセッサグループ数を指定する。配列が小さすぎる場合、関数は ERROR_INSUFFICIENT_BUFFER で失敗し、必要な要素数を GroupCount パラメータに設定する。
GroupArray : [var] プロセッサグループ番号の配列。プロセス内のスレッドがグループ内のプロセッサに割り当てられている場合、グループ番号が配列に含まれる。
%inst
指定したプロセスのプロセッサグループアフィニティを取得する。

[戻り値]
関数が成功した場合、戻り値は 0 以外。関数が失敗した場合、戻り値は 0。拡張エラー情報を取得するには GetLastError
を使用する。エラー値が ERROR_INSUFFICIENT_BUFFER の場合、GroupCount
パラメータには必要なバッファサイズ（要素数）が含まれる。

[備考]
Windows 11 および Windows Server 2022 以降では、64
を超えるプロセッサを持つシステムにおいて、プロセスとスレッドのアフィニティは既定でシステム内のすべてのプロセッサ群（すべてのプロセッサグループにまたがる）に及ぶ。この関数を使用するアプリケーションをコンパイルするには、_WIN32_WINNT
>= 0x0601 を設定する。詳細は Using the Windows Headers を参照。


%index
GetProcessHandleCount
指定したプロセスに属する開いているハンドルの数を取得する。
%group
Win32 kernel32
%prm
hProcess, pdwHandleCount
hProcess : [intptr] ハンドル数を要求するプロセスのハンドル。ハンドルは PROCESS_QUERY_INFORMATION または PROCESS_QUERY_LIMITED_INFORMATION アクセス権を持つ必要がある。詳細は Process Security and Access Rights を参照。Windows Server 2003 および Windows XP: ハンドルは PROCESS_QUERY_INFORMATION アクセス権を持つ必要がある。
pdwHandleCount : [var] 指定したプロセスに属する開いているハンドル数を受け取る変数へのポインタ。
%inst
指定したプロセスに属する開いているハンドルの数を取得する。

[戻り値]
関数が成功した場合、戻り値は 0 以外。関数が失敗した場合、戻り値は 0。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
この関数はプロセスのエグゼクティブオブジェクトに関する情報を取得する。詳細は Kernel Objects
を参照。この関数を使用するアプリケーションをコンパイルするには、_WIN32_WINNT を 0x0501 以降として定義する。詳細は
Using the Windows Headers を参照。


%index
GetProcessHeap
呼び出し側プロセスの既定ヒープへのハンドルを取得する。
%group
Win32 kernel32
%prm

%inst
呼び出し側プロセスの既定ヒープへのハンドルを取得する。

[戻り値]
関数が成功した場合、戻り値は呼び出し側プロセスのヒープへのハンドル。関数が失敗した場合、戻り値は NULL。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
GetProcessHeap
関数は、呼び出し側プロセスの既定ヒープへのハンドルを取得する。プロセスはこのハンドルを使用して、HeapCreate
関数でプライベートヒープを作成しなくともプロセスヒープからメモリを確保できる。Windows Server 2003 および
Windows XP: プロセスの既定ヒープに対して低断片化ヒープを有効にするには、GetProcessHeap
が返したハンドルを使用して HeapSetInformation 関数を呼ぶ。


%index
GetProcessHeaps
アクティブなヒープの数を返し、呼び出し側プロセスのすべてのアクティブなヒープへのハンドルを取得する。
%group
Win32 kernel32
%prm
NumberOfHeaps, ProcessHeaps
NumberOfHeaps : [int] ProcessHeaps が指すバッファに格納できるヒープハンドルの最大数。
ProcessHeaps : [intptr] ヒープハンドルの配列を受け取るバッファへのポインタ。
%inst
アクティブなヒープの数を返し、呼び出し側プロセスのすべてのアクティブなヒープへのハンドルを取得する。

[戻り値]
戻り値は、呼び出し側プロセスでアクティブなヒープへのハンドル数。戻り値が NumberOfHeaps
以下の場合、関数はその数のヒープハンドルを ProcessHeaps が指すバッファに格納している。戻り値が NumberOfHeaps
より大きい場合、ProcessHeaps が指すバッファは呼び出し側プロセスのすべてのヒープハンドルを保持するには小さすぎるため、関数は
NumberOfHeaps
個のハンドルをバッファに格納する。すべてのハンドルを受け取るのに十分な大きさのバッファを確保するために戻り値を使用し、関数を再度呼び出す。戻り値が
0 の場合、すべてのプロセスは少なくとも 1
つのアクティブなヒープ（プロセスの既定ヒープ）を持つため、関数は失敗している。拡張エラー情報を取得するには GetLastError
を呼ぶ。

[備考]
GetProcessHeaps 関数は、呼び出し側プロセスの既定ヒープへのハンドルと、プロセス内の任意のスレッドで HeapCreate
関数を呼び出して作成された追加のプライベートヒープへのハンドルを取得する。GetProcessHeaps
関数は、関数で取得されるプライベートヒープの一部はプロセス内で動作する他のコードによって作成されている可能性があり、GetProcessHeaps
が戻った後に破棄される可能性があるため、主にデバッグに有用である。ヒープを破棄するとそのヒープのハンドルは無効になり、そのようなハンドルを継続して使用するとアプリケーションで未定義の動作が発生する可能性がある。ヒープ関数は呼び出し側プロセスの既定ヒープと、プロセスが作成・管理するプライベートヒープに対してのみ呼び出すべきである。呼び出し側プロセスのプロセスヒープへのハンドルを取得するには、GetProcessHeap
関数を使用する。


%index
GetProcessId
指定したプロセスのプロセス識別子を取得する。
%group
Win32 kernel32
%prm
Process
Process : [intptr] プロセスのハンドル。ハンドルは PROCESS_QUERY_INFORMATION または PROCESS_QUERY_LIMITED_INFORMATION アクセス権を持つ必要がある。詳細は Process Security and Access Rights を参照。Windows Server 2003 および Windows XP: ハンドルは PROCESS_QUERY_INFORMATION アクセス権を持つ必要がある。
%inst
指定したプロセスのプロセス識別子を取得する。

[戻り値]
関数が成功した場合、戻り値はプロセス識別子。関数が失敗した場合、戻り値は 0。拡張エラー情報を取得するには GetLastError
を呼ぶ。

[備考]
プロセスが終了するまで、そのプロセス識別子はシステム上で一意にプロセスを識別する。アクセス権の詳細は Process Security
and Access Rights を参照。


%index
GetProcessIdOfThread
指定したスレッドに関連付けられたプロセスのプロセス識別子を取得する。
%group
Win32 kernel32
%prm
Thread
Thread : [intptr] スレッドのハンドル。ハンドルは THREAD_QUERY_INFORMATION または THREAD_QUERY_LIMITED_INFORMATION アクセス権を持つ必要がある。詳細は Thread Security and Access Rights を参照。Windows Server 2003: ハンドルは THREAD_QUERY_INFORMATION アクセス権を持つ必要がある。
%inst
指定したスレッドに関連付けられたプロセスのプロセス識別子を取得する。

[戻り値]
関数が成功した場合、戻り値は指定したスレッドに関連付けられたプロセスのプロセス識別子。関数が失敗した場合、戻り値は
0。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
プロセスが終了するまで、そのプロセス識別子はシステム上で一意にプロセスを識別する。アクセス権の詳細は Thread Security
and Access Rights を参照。


%index
GetProcessInformation
指定したプロセスに関する情報を取得する。(GetProcessInformation)
%group
Win32 kernel32
%prm
hProcess, ProcessInformationClass, ProcessInformation, ProcessInformationSize
hProcess : [intptr] プロセスのハンドル。このハンドルは **PROCESS_SET_INFORMATION** アクセス権を持つ必要がある。詳細は [Process Security and Access Rights](/windows/win32/procthread/process-security-and-access-rights) を参照。
ProcessInformationClass : [int] 取得する情報の種類を指定する [PROCESS_INFORMATION_CLASS](./ne-processthreadsapi-process_information_class.md) 列挙型のメンバ。
ProcessInformation : [intptr] *ProcessInformationClass* パラメータで指定された情報の種類を受け取るオブジェクトへのポインタ。*ProcessInformationClass* パラメータが **ProcessMemoryPriority** の場合、このパラメータは [MEMORY_PRIORITY_INFORMATION 構造体](ns-processthreadsapi-memory_priority_information.md) を指す必要がある。*ProcessInformationClass* パラメータが **ProcessProtectionLevelInfo** の場合、このパラメータは [PROCESS_PROTECTION_LEVEL_INFORMATION 構造体](ns-processthreadsapi-process_protection_level_information.md) を指す必要がある。*ProcessInformationClass* パラメータが **ProcessLeapSecondInfo** の場合、このパラメータは [PROCESS_LEAP_SECOND_INFO 構造体](ns-processthreadsapi-process_leap_second_info.md) を指す必要がある。*ProcessInformationClass* パラメータが **ProcessAppMemoryInfo** の場合、このパラメータは [APP_MEMORY_INFORMATION 構造体](ns-processthreadsapi-app_memory_information.md) を指す必要がある。
ProcessInformationSize : [int] *ProcessInformation* パラメータで指定された構造体のバイト単位のサイズ。*ProcessInformationClass* パラメータが **ProcessMemoryPriority** の場合、このパラメータは `sizeof(MEMORY_PRIORITY_INFORMATION)` でなければならない。*ProcessInformationClass* パラメータが **ProcessPowerThrottling** の場合、このパラメータは `sizeof(PROCESS_POWER_THROTTLING_STATE)` でなければならない。*ProcessInformationClass* パラメータが **ProcessProtectionLevelInfo** の場合、このパラメータは `sizeof(PROCESS_PROTECTION_LEVEL_INFORMATION)` でなければならない。*ProcessInformationClass* パラメータが **ProcessLeapSecondInfo** の場合、このパラメータは `sizeof(PROCESS_LEAP_SECOND_INFO)` でなければならない。*ProcessInformationClass* パラメータが **ProcessAppMemoryInfo** の場合、このパラメータは `sizeof(APP_MEMORY_INFORMATION)` でなければならない。
%inst
指定したプロセスに関する情報を取得する。(GetProcessInformation)

[戻り値]
関数が成功した場合、戻り値は 0 以外。関数が失敗した場合、戻り値は 0。拡張エラー情報を取得するには [GetLastError
関数](../errhandlingapi/nf-errhandlingapi-getlasterror.md) を呼ぶ。


%index
GetProcessIoCounters
指定したプロセスが行ったすべての I/O 処理のアカウンティング情報を取得する。
%group
Win32 kernel32
%prm
hProcess, lpIoCounters
hProcess : [intptr] プロセスのハンドル。ハンドルは PROCESS_QUERY_INFORMATION または PROCESS_QUERY_LIMITED_INFORMATION アクセス権を持つ必要がある。詳細は Process Security and Access Rights を参照。Windows Server 2003 および Windows XP: ハンドルは PROCESS_QUERY_INFORMATION アクセス権を持つ必要がある。
lpIoCounters : [var] プロセスの I/O アカウンティング情報を受け取る IO_COUNTERS 構造体へのポインタ。
%inst
指定したプロセスが行ったすべての I/O 処理のアカウンティング情報を取得する。

[戻り値]
関数が成功した場合、戻り値は 0 以外。関数が失敗した場合、戻り値は 0。拡張エラー情報を取得するには GetLastError を呼ぶ。


%index
GetProcessPreferredUILanguages
プロセスの優先 UI 言語を取得する。詳細は User Interface Language Management を参照。
%group
Win32 kernel32
%prm
dwFlags, pulNumLanguages, pwszLanguagesBuffer, pcchLanguagesBuffer
dwFlags : [int] プロセスの優先 UI 言語に使用する言語形式を識別するフラグ。フラグは相互排他的で、既定は MUI_LANGUAGE_NAME である。
pulNumLanguages : [var] pwszLanguagesBuffer に取得される言語の数へのポインタ。
pwszLanguagesBuffer : [int] 省略可能。この関数が、最も優先される順に並べた null 区切りの順序付きリストを取得するダブル null 終端の複数文字列バッファへのポインタ。あるいは、このパラメータが NULL に設定され、pcchLanguagesBuffer が 0 に設定されている場合、関数は必要な言語バッファのサイズを pcchLanguagesBuffer に取得する。必要なサイズには 2 つの null 文字が含まれる。
pcchLanguagesBuffer : [var] pwszLanguagesBuffer が示す言語バッファのサイズ（文字数）へのポインタ。関数から正常に戻ったとき、このパラメータには取得された言語バッファのサイズが含まれる。あるいは、このパラメータが 0 に設定され、pwszLanguagesBuffer が NULL に設定されている場合、関数は必要な言語バッファのサイズを pcchLanguagesBuffer に取得する。
%inst
プロセスの優先 UI 言語を取得する。詳細は User Interface Language Management を参照。

[戻り値]
成功した場合は TRUE、それ以外の場合は FALSE を返す。拡張エラー情報を取得するには、アプリケーションは GetLastError
を呼ぶ。これは以下のいずれかのエラーコードを返す。
（以下省略）

[備考]
アプリケーションで指定されたフラグに応じて、この関数はプロセスの優先 UI
言語からなるリストを取得できる。重複する言語に遭遇した場合、関数は重複した言語の最初のインスタンスのみを取得する。MUI_LANGUAGE_ID
が指定されている場合、取得される言語文字列は先頭の 0x を含まない 16 進数の言語識別子で、長さは 4 文字となる。たとえば
en-US は "0409" として、en は "0009" として返される。注意 MUI_LANGUAGE_ID よりも
MUI_LANGUAGE_NAME の使用が推奨される。 C# シグネチャ
（以下省略）


%index
GetProcessPriorityBoost
指定したプロセスの優先度ブースト制御の状態を取得する。
%group
Win32 kernel32
%prm
hProcess, pDisablePriorityBoost
hProcess : [intptr] プロセスのハンドル。このハンドルは PROCESS_QUERY_INFORMATION または PROCESS_QUERY_LIMITED_INFORMATION アクセス権を持つ必要がある。詳細は Process Security and Access Rights を参照。Windows Server 2003 および Windows XP: ハンドルは PROCESS_QUERY_INFORMATION アクセス権を持つ必要がある。
pDisablePriorityBoost : [var] 優先度ブースト制御の状態を受け取る変数へのポインタ。TRUE の値は動的ブーストが無効であることを示す。FALSE の値は通常の動作を示す。
%inst
指定したプロセスの優先度ブースト制御の状態を取得する。

[戻り値]
関数が成功した場合、戻り値は 0 以外。その場合、pDisablePriorityBoost
パラメータが指す変数は優先度ブースト制御の状態を受け取る。関数が失敗した場合、戻り値は 0。拡張エラー情報を取得するには
GetLastError を呼ぶ。


%index
GetProcessShutdownParameters
現在の呼び出し側プロセスのシャットダウンパラメータを取得する。
%group
Win32 kernel32
%prm
lpdwLevel, lpdwFlags
lpdwLevel : [var] シャットダウンの優先度レベルを受け取る変数へのポインタ。レベルが高いほど先にシャットダウンされる。システムレベルのシャットダウン順序はシステムコンポーネント用に予約されている。番号が大きいほど先にシャットダウンされる。以下がレベル規約である。
lpdwFlags : [var] シャットダウンフラグを受け取る変数へのポインタ。このパラメータには以下の値を指定できる。
%inst
現在の呼び出し側プロセスのシャットダウンパラメータを取得する。

[戻り値]
関数が成功した場合、戻り値は 0 以外。関数が失敗した場合、戻り値は 0。拡張エラー情報を取得するには GetLastError を呼ぶ。


%index
GetProcessTimes
指定したプロセスのタイミング情報を取得する。
%group
Win32 kernel32
%prm
hProcess, lpCreationTime, lpExitTime, lpKernelTime, lpUserTime
hProcess : [intptr] タイミング情報を取得したいプロセスのハンドル。ハンドルは PROCESS_QUERY_INFORMATION または PROCESS_QUERY_LIMITED_INFORMATION アクセス権を持つ必要がある。詳細は Process Security and Access Rights を参照。Windows Server 2003 および Windows XP: ハンドルは PROCESS_QUERY_INFORMATION アクセス権を持つ必要がある。
lpCreationTime : [var] プロセスの作成時刻を受け取る FILETIME 構造体へのポインタ。
lpExitTime : [var] プロセスの終了時刻を受け取る FILETIME 構造体へのポインタ。プロセスが終了していない場合、この構造体の内容は未定義である。
lpKernelTime : [var] プロセスがカーネルモードで実行された時間を受け取る FILETIME 構造体へのポインタ。プロセスの各スレッドがカーネルモードで実行された時間が決定され、それらの時間がすべて合計されてこの値が得られる。
lpUserTime : [var] プロセスがユーザーモードで実行された時間を受け取る FILETIME 構造体へのポインタ。プロセスの各スレッドがユーザーモードで実行された時間が決定され、それらの時間がすべて合計されてこの値が得られる。プロセスが複数の CPU コアにまたがって実行される場合、この値は経過した実時間（lpCreationTime と lpExitTime の間）を超えうることに注意。
%inst
指定したプロセスのタイミング情報を取得する。

[戻り値]
関数が成功した場合、戻り値は 0 以外。関数が失敗した場合、戻り値は 0。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
すべての時刻は FILETIME データ構造体を使用して表される。このような構造体は、結合して 100 ナノ秒時間単位の 64
ビットカウントを形成する 2 つの 32 ビット値を含む。プロセスの作成および終了時刻は、1601 年 1 月 1 日午前 0
時（イギリス、グリニッジ）から経過した時間として表現された時点である。アプリケーションがこのような値をより一般的に有用な形式に変換するために使用できる関数がいくつかある。プロセスのカーネルモードおよびユーザーモード時間は時間量である。たとえば、プロセスがカーネルモードで
1 秒を費やした場合、この関数は lpKernelTime で指定された FILETIME 構造体を 64 ビット値の 1000
万で埋める。これは 1 秒間の 100 ナノ秒単位の数である。プロセスのスレッドが使用した CPU
クロックサイクル数を取得するには、QueryProcessCycleTime 関数を使用する。


%index
GetProcessVersion
指定したプロセスが実行を期待するシステムのメジャーバージョン番号とマイナーバージョン番号を取得する。
%group
Win32 kernel32
%prm
ProcessId
ProcessId : [int] 対象プロセスのプロセス識別子。0 を指定すると呼び出し側プロセスを示す。
%inst
指定したプロセスが実行を期待するシステムのメジャーバージョン番号とマイナーバージョン番号を取得する。

[戻り値]

関数が成功した場合、戻り値はプロセスが実行を期待するシステムのバージョン。戻り値の上位ワードはメジャーバージョン番号を含む。下位ワードはマイナーバージョン番号を含む。関数が失敗した場合、戻り値は
0。拡張エラー情報を取得するには GetLastError を呼ぶ。ProcessId が無効な値の場合、関数は失敗する。

[備考]
GetProcessVersion 関数は、ProcessId が 0
以外で呼び出し側プロセス以外のプロセスを指定する場合、動作が遅くなる。この関数が返すバージョン番号は、プロセスが実行している .exe
ファイルのイメージヘッダにスタンプされたバージョン番号である。リンカプログラムがこの値を設定する。WOW64 上で動作する 32
ビットアプリケーションからこの関数を呼び出すと、指定されたプロセスは 32 ビットプロセスでなければならず、そうでない場合は失敗する。


%index
GetProcessWorkingSetSize
指定したプロセスの最小および最大ワーキングセットサイズを取得する。(GetProcessWorkingSetSize)
%group
Win32 kernel32
%prm
hProcess, lpMinimumWorkingSetSize, lpMaximumWorkingSetSize
hProcess : [intptr] ワーキングセットサイズを取得するプロセスのハンドル。ハンドルは PROCESS_QUERY_INFORMATION または PROCESS_QUERY_LIMITED_INFORMATION アクセス権を持つ必要がある。詳細は Process Security and Access Rights を参照。Windows Server 2003 および Windows XP: ハンドルは PROCESS_QUERY_INFORMATION アクセス権を持つ必要がある。
lpMinimumWorkingSetSize : [var] 指定したプロセスの最小ワーキングセットサイズ（バイト単位）を受け取る変数へのポインタ。仮想メモリマネージャは、プロセスがアクティブな間、少なくともこの量のメモリを常駐させようとする。
lpMaximumWorkingSetSize : [var] 指定したプロセスの最大ワーキングセットサイズ（バイト単位）を受け取る変数へのポインタ。仮想メモリマネージャは、メモリが不足している場合にプロセスがアクティブな間、この量以下のメモリのみを常駐させようとする。
%inst
指定したプロセスの最小および最大ワーキングセットサイズを取得する。(GetProcessWorkingSetSize)

[戻り値]
関数が成功した場合、戻り値は 0 以外。関数が失敗した場合、戻り値は 0。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
プロセスの「ワーキングセット」とは、現在物理 RAM
メモリ上でプロセスから見えているメモリページのセットである。これらのページは常駐しており、ページフォールトを引き起こすことなくアプリケーションが使用できる。最小および最大ワーキングセットサイズはプロセスの仮想メモリページング動作に影響する。


%index
GetProcessWorkingSetSizeEx
指定したプロセスの最小および最大ワーキングセットサイズを取得する。(GetProcessWorkingSetSizeEx)
%group
Win32 kernel32
%prm
hProcess, lpMinimumWorkingSetSize, lpMaximumWorkingSetSize, Flags
hProcess : [intptr] ワーキングセットサイズを取得するプロセスのハンドル。ハンドルは PROCESS_QUERY_INFORMATION または PROCESS_QUERY_LIMITED_INFORMATION アクセス権を持つ必要がある。詳細は Process Security and Access Rights を参照。Windows Server 2003: ハンドルは PROCESS_QUERY_INFORMATION アクセス権を持つ必要がある。
lpMinimumWorkingSetSize : [var] 指定したプロセスの最小ワーキングセットサイズ（バイト単位）を受け取る変数へのポインタ。仮想メモリマネージャは、プロセスがアクティブな間、少なくともこの量のメモリを常駐させようとする。
lpMaximumWorkingSetSize : [var] 指定したプロセスの最大ワーキングセットサイズ（バイト単位）を受け取る変数へのポインタ。仮想メモリマネージャは、メモリが不足している場合にプロセスがアクティブな間、この量以下のメモリのみを常駐させようとする。
Flags : [var] 最小および最大ワーキングセットサイズの強制を制御するフラグ。
%inst
指定したプロセスの最小および最大ワーキングセットサイズを取得する。(GetProcessWorkingSetSizeEx)

[備考]
プロセスの「ワーキングセット」とは、現在物理 RAM
メモリ上でプロセスから見えているメモリページのセットである。これらのページは常駐しており、ページフォールトを引き起こすことなくアプリケーションが使用できる。最小および最大ワーキングセットサイズはプロセスの仮想メモリページング動作に影響する。


%index
GetProductInfo
ローカルコンピュータ上のオペレーティングシステムの製品の種類を取得し、その種類を指定したオペレーティングシステムでサポートされる製品の種類にマップする。
%group
Win32 kernel32
%prm
dwOSMajorVersion, dwOSMinorVersion, dwSpMajorVersion, dwSpMinorVersion, pdwReturnedProductType
dwOSMajorVersion : [int] オペレーティングシステムのメジャーバージョン番号。最小値は 6。dwOSMajorVersion、dwOSMinorVersion、dwSpMajorVersion、dwSpMinorVersion パラメータの組み合わせはアプリケーションの最大対象オペレーティングシステムバージョンを表す。たとえば、Windows Vista と Windows Server 2008 はバージョン 6.0.0.0 で、Windows 7 と Windows Server 2008 R2 はバージョン 6.1.0.0 である。すべての Windows 10 ベースのリリースはバージョン 6.3 として表記される。
dwOSMinorVersion : [int] オペレーティングシステムのマイナーバージョン番号。最小値は 0。
dwSpMajorVersion : [int] オペレーティングシステムサービスパックのメジャーバージョン番号。最小値は 0。
dwSpMinorVersion : [int] オペレーティングシステムサービスパックのマイナーバージョン番号。最小値は 0。
pdwReturnedProductType : [var] 製品の種類。このパラメータを NULL にはできない。指定したオペレーティングシステムが現在のオペレーティングシステムより古い場合、この情報は指定したオペレーティングシステムでサポートされる種類にマップされる。指定したオペレーティングシステムがサポートされる最高のオペレーティングシステムより新しい場合、この情報は現在のオペレーティングシステムでサポートされる種類にマップされる。
%inst

ローカルコンピュータ上のオペレーティングシステムの製品の種類を取得し、その種類を指定したオペレーティングシステムでサポートされる製品の種類にマップする。

[戻り値]
関数が成功した場合、戻り値は 0 以外の値。関数が失敗した場合、戻り値は 0。入力パラメータの 1 つが無効な場合、この関数は失敗する。

[備考]
サーバーロールや機能がインストールされているかどうかを検出するには、Server Feature WMI
プロバイダを使用する。Windows の後続リリースでは、サポートする製品の種類が、サポートされる以前の各 Windows
リリースでサポートされる製品の種類のセット（バージョン 6.0.0.0
まで遡る）にマップされる。したがって、これらの値のいずれかを等価性テストするアプリケーションは、新しい製品の種類が追加されても将来のリリースで動作し続ける。Windows
Server 2012 以降では PRODUCT_*_SERVER_CORE 値は返されない。たとえば、ベースサーバーエディション
Server Datacenter は「フルサーバー」と「コアサーバー」の 2
つの異なるインストールオプションを構築するために使用される。Windows Server 2012
では、製品インストール中に使用されたオプションに関係なく、GetProductInfo は PRODUCT_DATACENTER
を返す。前述のとおり、Windows Server 2012 以降の Server Core インストールでは、Determining
whether Server Core is running の方法を使用する。以下の表は、6.1.0.0
で導入された製品の種類と、6.1.0.0 システム上でバージョン 6.0.0.0 で GetProductInfo
を呼び出した場合に何にマップされるかを示す。
（以下省略）


%index
GetProfileIntW
Win.ini ファイルの指定セクション内のキーから整数を取得する。(Unicode)
%group
Win32 kernel32
%prm
lpAppName, lpKeyName, nDefault
lpAppName : [wstr] キー名を含むセクションの名前。
lpKeyName : [wstr] 値を取得するキーの名前。この値は文字列形式である。GetProfileInt 関数は文字列を整数に変換して返す。
nDefault : [int] 初期化ファイル内でキー名が見つからない場合に返す既定値。
%inst
Win.ini ファイルの指定セクション内のキーから整数を取得する。(Unicode)

[戻り値]
戻り値は、Win.ini 内の指定キー名に続く文字列の整数等価値。関数がキーを見つけられない場合、戻り値は既定値である。キーの値が 0
未満の場合、戻り値は 0 となる。

[備考]
キー名が数字の後に数値以外の文字が続く場合、関数は数字部分の値のみを返す。たとえば、KeyName=102abc という行に対して関数は
102 を返す。Windows Server 2003 および Windows XP/2000:
プロファイル関数の呼び出しは初期化ファイルではなくレジストリにマップされる場合がある。このマッピングは、初期化ファイルとセクションが以下のレジストリキーの下に指定されている場合に発生する:
HKEY_LOCAL_MACHINE\Software\Microsoft\Windows
NT\CurrentVersion\IniFileMapping 処理がマップされている場合、GetProfileInt
関数は初期化ファイルからではなくレジストリから情報を取得する。格納場所の変更は関数の動作に影響を与えない。プロファイル関数は以下の手順で初期化情報を見つける。
（以下省略）


%index
GetProfileSectionW
Win.ini ファイルの指定セクションのすべてのキーと値を取得する。(Unicode)
%group
Win32 kernel32
%prm
lpAppName, lpReturnedString, nSize
lpAppName : [wstr] Win.ini ファイル内のセクション名。
lpReturnedString : [wstr] 指定したセクションに関連するキーと値を受け取るバッファへのポインタ。バッファは 1 つ以上の null 終端文字列で埋められ、最後の文字列の後にはさらに null 文字が続く。
nSize : [int] lpReturnedString パラメータが指すバッファのサイズ（文字数）。
%inst
Win.ini ファイルの指定セクションのすべてのキーと値を取得する。(Unicode)

[戻り値]
戻り値は、指定したバッファにコピーされた文字数（終端 null
文字を除く）。バッファが指定したセクションに関連するすべてのキーと値を含むのに十分な大きさでない場合、戻り値は nSize
で指定したサイズから 2 を引いた値に等しい。

[備考]
返されるキーと値の形式は、1 つ以上の null 終端文字列の後に最後の null 文字が続く。各文字列は次の形式である:
key=string GetProfileSection
関数は大文字と小文字を区別しない。文字列は大文字と小文字の組み合わせでよい。この処理はアトミックである。セクションのキーと値がバッファにコピーされている間、Win.ini
ファイルへの更新は許可されない。Windows Server 2003 および Windows XP/2000:
プロファイル関数の呼び出しは初期化ファイルではなくレジストリにマップされる場合がある。このマッピングは、初期化ファイルとセクションが以下のレジストリキーの下に指定されている場合に発生する:
HKEY_LOCAL_MACHINE\Software\Microsoft\Windows
NT\CurrentVersion\IniFileMapping。処理がマップされている場合、GetProfileSection
関数は初期化ファイルからではなくレジストリから情報を取得する。格納場所の変更は関数の動作に影響を与えない。プロファイル関数は以下の手順で初期化情報を見つける。
（以下省略）


%index
GetProfileStringW
Win.ini ファイルの指定セクション内のキーに関連付けられた文字列を取得する。(Unicode)
%group
Win32 kernel32
%prm
lpAppName, lpKeyName, lpDefault, lpReturnedString, nSize
lpAppName : [wstr] キーを含むセクションの名前。このパラメータが NULL の場合、関数はファイル内のすべてのセクション名を指定バッファにコピーする。
lpKeyName : [wstr] 関連付けられた文字列を取得するキーの名前。このパラメータが NULL の場合、関数は指定セクション内のすべてのキーを指定バッファにコピーする。各文字列の後には null 文字が続き、最後の文字列の後にはさらに null 文字が続く。
lpDefault : [wstr] 既定の文字列。lpKeyName キーが初期化ファイル内に見つからない場合、GetProfileString は既定の文字列を lpReturnedString バッファにコピーする。このパラメータが NULL の場合、既定値は空文字列 "" となる。
lpReturnedString : [wstr] 文字列を受け取るバッファへのポインタ。
nSize : [int] lpReturnedString パラメータが指すバッファのサイズ（文字数）。
%inst
Win.ini ファイルの指定セクション内のキーに関連付けられた文字列を取得する。(Unicode)

[戻り値]
戻り値は、バッファにコピーされた文字数（終端 null 文字を除く）。lpAppName と lpKeyName のいずれも NULL
でなく、指定された宛先バッファが要求された文字列を保持するには小さすぎる場合、文字列は切り詰められて null 文字が続き、戻り値は
nSize から 1 を引いた値に等しい。lpAppName または lpKeyName のいずれかが NULL
で、指定された宛先バッファがすべての文字列を保持するには小さすぎる場合、最後の文字列は切り詰められて 2 つの null
文字が続く。この場合、戻り値は nSize から 2 を引いた値に等しい。

[備考]
lpKeyName パラメータに関連付けられた文字列が単一引用符または二重引用符で囲まれている場合、GetProfileString
関数が文字列を返すときに引用符は破棄される。GetProfileString
関数は大文字と小文字を区別しない。文字列は大文字と小文字の組み合わせを含むことができる。Win.ini
ファイル内のセクションは以下の形式でなければならない。
（以下省略）


%index
GetQueuedCompletionStatus
指定した I/O 完了ポートから I/O 完了パケットをデキューしようとする。
%group
Win32 kernel32
%prm
CompletionPort, lpNumberOfBytesTransferred, lpCompletionKey, lpOverlapped, dwMilliseconds
CompletionPort : [intptr] 完了ポートのハンドル。完了ポートを作成するには CreateIoCompletionPort 関数を使用する。
lpNumberOfBytesTransferred : [var] 完了した I/O 処理で転送されたバイト数を受け取る変数へのポインタ。
lpCompletionKey : [var] I/O 処理が完了したファイルハンドルに関連付けられた完了キー値を受け取る変数へのポインタ。完了キーは CreateIoCompletionPort の呼び出しで指定されたファイルごとのキーである。
lpOverlapped : [var] 完了した I/O 処理が開始されたときに指定された OVERLAPPED 構造体のアドレスを受け取る変数へのポインタ。完了ポートに関連付けられたファイルハンドルと有効な OVERLAPPED 構造体を関数に渡しても、アプリケーションは完了ポート通知を防ぐことができる。これは OVERLAPPED 構造体の hEvent メンバに有効なイベントハンドルを指定し、その下位ビットを設定することで行う。下位ビットが設定された有効なイベントハンドルは、オーバーラップ I/O の完了が完了パケットを完了ポートにエンキューするのを防ぐ。
dwMilliseconds : [int] 呼び出し側が完了パケットが完了ポートに現れるのを待つミリ秒数。指定時間内に完了パケットが現れない場合、関数はタイムアウトし、FALSE を返し、*lpOverlapped を NULL に設定する。dwMilliseconds が INFINITE の場合、関数はタイムアウトしない。dwMilliseconds が 0 でデキューする I/O 処理がない場合、関数はすぐにタイムアウトする。Windows XP、Windows Server 2003、Windows Vista、Windows 7、Windows Server 2008、Windows Server 2008 R2: dwMilliseconds 値は低電力状態で費やされた時間を含む。たとえば、コンピュータがスリープ中もタイムアウトはカウントダウンを続ける。Windows 8、Windows Server 2012、Windows 8.1、Windows Server 2012 R2、Windows 10、Windows Server 2016: dwMilliseconds 値は低電力状態で費やされた時間を含まない。たとえば、コンピュータがスリープ中はタイムアウトはカウントダウンを続けない。
%inst
指定した I/O 完了ポートから I/O 完了パケットをデキューしようとする。

[戻り値]
成功した場合は 0 以外 (TRUE)、それ以外の場合は 0 (FALSE) を返す。拡張エラー情報を取得するには
GetLastError を呼ぶ。詳細は備考セクションを参照。

[備考]
この関数は、スレッドを指定した完了ポートに関連付ける。スレッドは多くとも 1
つの完了ポートに関連付けられる。GetQueuedCompletionStatus
の呼び出しが、関連付けられた完了ポートのハンドルが呼び出し中に閉じられたために失敗した場合、関数は FALSE
を返し、*lpOverlapped は NULL になり、GetLastError は ERROR_ABANDONED_WAIT_0
を返す。Windows Server 2003 および Windows XP:
呼び出し中に完了ポートのハンドルを閉じても、前述の動作は発生しない。関数は、ポートからエントリが削除されるまで、または INFINITE
以外の値が指定されている場合はタイムアウトが発生するまで待ち続ける。GetQueuedCompletionStatus
関数が成功した場合、成功した I/O 処理の完了パケットを完了ポートからデキューし、以下のパラメータが指す変数に情報を格納している:
lpNumberOfBytes、lpCompletionKey、lpOverlapped。失敗した場合（戻り値が
FALSE）、それらの同じパラメータには以下のような特定の値の組み合わせが含まれる場合がある。
（以下省略）


%index
GetQueuedCompletionStatusEx
複数の完了ポートエントリを同時に取得する。
%group
Win32 kernel32
%prm
CompletionPort, lpCompletionPortEntries, ulCount, ulNumEntriesRemoved, dwMilliseconds, fAlertable
CompletionPort : [intptr] 完了ポートのハンドル。完了ポートを作成するには CreateIoCompletionPort 関数を使用する。
lpCompletionPortEntries : [var] 入力時には、事前に確保された OVERLAPPED_ENTRY 構造体の配列を指す。出力時には、エントリを保持する OVERLAPPED_ENTRY 構造体の配列を受け取る。配列要素の数は ulNumEntriesRemoved により提供される。各 I/O 中に転送されたバイト数、各 I/O が発生したファイルを示す完了キー、各オリジナル I/O で使用されたオーバーラップ構造体アドレスはすべて lpCompletionPortEntries 配列で返される。
ulCount : [int] 削除するエントリの最大数。
ulNumEntriesRemoved : [var] 実際に削除されたエントリの数を受け取る変数へのポインタ。
dwMilliseconds : [int] 呼び出し側が完了パケットが完了ポートに現れるのを待つミリ秒数。指定時間内に完了パケットが現れない場合、関数はタイムアウトし、FALSE を返す。dwMilliseconds が INFINITE (0xFFFFFFFF) の場合、関数はタイムアウトしない。dwMilliseconds が 0 でデキューする I/O 処理がない場合、関数はすぐにタイムアウトする。Windows XP、Windows Server 2003、Windows Vista、Windows 7、Windows Server 2008、Windows Server 2008 R2: dwMilliseconds 値は低電力状態で費やされた時間を含む。たとえば、コンピュータがスリープ中もタイムアウトはカウントダウンを続ける。Windows 8、Windows Server 2012、Windows 8.1、Windows Server 2012 R2、Windows 10、Windows Server 2016: dwMilliseconds 値は低電力状態で費やされた時間を含まない。たとえば、コンピュータがスリープ中はタイムアウトはカウントダウンを続けない。
fAlertable : [int] このパラメータが FALSE の場合、関数はタイムアウト期間が経過するか、エントリが取得されるまで戻らない。TRUE で利用可能なエントリがない場合、関数は警告可能な待機を実行する。システムがスレッドに I/O 完了ルーチンまたは APC をキューに入れ、スレッドが関数を実行するとスレッドは戻る。完了ルーチンは、それが指定された ReadFileEx または WriteFileEx 関数が完了し、呼び出しスレッドが処理を開始したスレッドである場合にキューに入れられる。APC は QueueUserAPC を呼ぶときにキューに入れられる。
%inst
複数の完了ポートエントリを同時に取得する。

[戻り値]
成功した場合は 0 以外 (TRUE)、それ以外の場合は 0 (FALSE) を返す。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
この関数は、スレッドを指定した完了ポートに関連付ける。スレッドは多くとも 1 つの完了ポートに関連付けられる。この関数は、少なくとも 1
つの保留中 I/O が完了したときに TRUE を返すが、1 つ以上の I/O 処理が失敗した可能性もある。失敗した I/O
処理に対応するエントリを判別するために、この関数のユーザーは lpCompletionPortEntries
パラメータで返されたエントリのリストをチェックし、各 OVERLAPPED_ENTRY 内の lpOverlapped
メンバに含まれる状態を見る必要があることに注意する。I/O 処理がデキューされなかった場合、この関数は FALSE
を返す。これは通常、この呼び出しのパラメータの処理中にエラーが発生したか、CompletionPort
ハンドルが閉じられたか無効になったことを意味する。GetLastError
関数は拡張エラー情報を提供する。GetQueuedCompletionStatusEx
の呼び出しが、関連付けられたハンドルが閉じられたために失敗した場合、関数は FALSE を返し、GetLastError は
ERROR_ABANDONED_WAIT_0 を返す。サーバーアプリケーションは、同じ完了ポートに対して
GetQueuedCompletionStatusEx 関数を呼び出す複数のスレッドを持つことができる。I/O
処理が完了すると、これらは先入れ先出し順でこのポートにキューに入れられる。スレッドがこの呼び出しを能動的に待機している場合、1
つ以上のキューに入れられた要求がそのスレッドのみの呼び出しを完了する。I/O 完了ポートの理論、使用法、関連する関数の詳細は I/O
Completion Ports を参照。Windows 8 および Windows Server 2012
では、この関数は以下の技術によりサポートされる。
（以下省略）


%index
GetShortPathNameW
指定したパスの短いパス形式を取得する。(GetShortPathNameW)
%group
Win32 kernel32
%prm
lpszLongPath, lpszShortPath, cchBuffer
lpszLongPath : [wstr] パス文字列。この関数の ANSI 版では、名前は MAX_PATH 文字に制限される。この制限を 32,767 ワイド文字に拡張するには、関数の Unicode 版を呼び出してパスの先頭に "\\\\?\\" を付加する。詳細は Naming Files, Paths, and Namespaces を参照。
lpszShortPath : [wstr] lpszLongPath が指定するパスの null 終端短縮形式を受け取るバッファへのポインタ。このパラメータに NULL を渡し、cchBuffer に 0 を渡すと、指定された lpszLongPath に必要なバッファサイズが常に返される。
cchBuffer : [int] lpszShortPath が指すバッファのサイズ（TCHAR 単位）。lpszShortPath が NULL に設定されている場合、このパラメータを 0 に設定する。
%inst
指定したパスの短いパス形式を取得する。(GetShortPathNameW)

[戻り値]
関数が成功した場合、戻り値は lpszShortPath にコピーされた文字列の長さ（TCHAR 単位）で、終端 null
文字を含まない。lpszShortPath バッファがパスを格納するには小さすぎる場合、戻り値はパスと終端 null
文字を保持するために必要なバッファのサイズ（TCHAR 単位）である。それ以外の理由で関数が失敗した場合、戻り値は
0。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
lpszLongPath パラメータが指定するパスはフルパスや長いパスである必要はない。短縮形式は指定パスより長くなる場合がある。戻り値が
cchBuffer
パラメータで指定された値より大きい場合、パスを保持するのに十分な大きさのバッファで関数を再度呼び出すことができる。動的確保のために長さ 0
のバッファを使用するこの場合の例については、サンプルコードセクションを参照。注意 この場合の戻り値は終端 null
文字を含む長さであるが、成功時の戻り値はカウントに終端 null
文字を含まない。指定されたパスが既に短縮形式で変換が不要な場合、関数は単に指定パスを lpszShortPath
パラメータで指定されたバッファにコピーする。lpszShortPath パラメータを lpszLongPath
パラメータと同じ値に設定できる。つまり、短縮パスの出力バッファを入力パス文字列のアドレスに設定できる。cchBuffer
パラメータが常にこのバッファの合計サイズ（TCHAR 単位）を正確に表すようにする。GetLongPathName
関数を呼び出すことで、短い名前からファイルの長い名前を取得できる。あるいは、GetLongPathName
が利用できない場合、パスの各コンポーネントに対して FindFirstFile
を呼び出して対応する長い名前を取得できる。ファイルやディレクトリへのアクセス権はあるが、そのファイルやディレクトリの親ディレクトリの一部にアクセス権がない場合がある。その結果、パスコンポーネントの親ディレクトリをクエリしてそのコンポーネントの短縮名を判別できない場合、GetShortPathName
は失敗する可能性がある。このチェックは、すでに短縮名の要件を満たすディレクトリコンポーネントについてはスキップ可能である。詳細は
Naming Files, Paths, and Namespaces の Short vs. Long Names
セクションを参照。Windows 8 および Windows Server 2012 では、この関数は以下の技術によりサポートされる。
（以下省略）


%index
GetStartupInfoW
呼び出し側プロセスが作成されたときに指定された STARTUPINFO 構造体の内容を取得する。
%group
Win32 kernel32
%prm
lpStartupInfo
lpStartupInfo : [var] 起動情報を受け取る STARTUPINFO 構造体へのポインタ。
%inst
呼び出し側プロセスが作成されたときに指定された STARTUPINFO 構造体の内容を取得する。

[備考]
STARTUPINFO
構造体は、呼び出し側プロセスを作成したプロセスによって指定された。これは呼び出し側プロセスのメインウィンドウに関連付けられたプロパティを指定するために使用できる。


%index
GetStdHandle
指定した標準デバイス（標準入力、標準出力、または標準エラー）のハンドルを取得する。
%group
Win32 kernel32
%prm
nStdHandle
nStdHandle : [int] 標準デバイス。このパラメータは以下のいずれかの値である。 | 値 | 意味 | |-|-| | **STD_INPUT_HANDLE** `((DWORD)-10)` | 標準入力デバイス。最初は、コンソールの入力バッファ `CONIN$` である。 | | **STD_OUTPUT_HANDLE** `((DWORD)-11)` | 標準出力デバイス。最初は、アクティブなコンソール画面バッファ `CONOUT$` である。 | | **STD_ERROR_HANDLE** `((DWORD)-12)` | 標準エラーデバイス。最初は、アクティブなコンソール画面バッファ `CONOUT$` である。 | > [!NOTE] > これらの定数の値は符号なしの数字だが、ヘッダファイルでは符号付き数字からのキャストとして定義され、C コンパイラがそれらを 32 ビット最大値直下にロールオーバーすることを利用している。これらのハンドルとヘッダを解析しない言語でやり取りし、定数を再定義する場合は、この制約に注意する。例として、`((DWORD)-10)` は実際には符号なしの数字 `4294967286` である。
%inst
指定した標準デバイス（標準入力、標準出力、または標準エラー）のハンドルを取得する。

[戻り値]
関数が成功した場合、戻り値は指定したデバイスへのハンドル、または以前の
[**SetStdHandle**](setstdhandle.md)
の呼び出しによって設定されたリダイレクト済みハンドル。アプリケーションが **SetStdHandle**
を使用してより少ないアクセス権で標準ハンドルを設定していない限り、ハンドルは **GENERIC\_READ** および
**GENERIC\_WRITE** アクセス権を持つ。> [!TIP] > 完了時にこのハンドルを
[**CloseHandle**](/windows/win32/api/handleapi/nf-handleapi-closehandle)
で破棄する必要はない。詳細は [**Remarks**](#handle-disposal) を参照。関数が失敗した場合、戻り値は
**INVALID\_HANDLE\_VALUE**。拡張エラー情報を取得するには
[**GetLastError**](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror)
を呼ぶ。アプリケーションに、対話型デスクトップ上で実行されているサービスのように標準ハンドルが関連付けられておらず、それらをリダイレクトしていない場合、戻り値は
**NULL** となる。

[備考]
**GetStdHandle**
が返すハンドルは、コンソールから読み取りまたは書き込みを行う必要があるアプリケーションで使用できる。コンソールが作成されると、標準入力ハンドルはコンソールの入力バッファへのハンドルとなり、標準出力と標準エラーハンドルはコンソールのアクティブな画面バッファへのハンドルとなる。これらのハンドルは
[**ReadFile**](/windows/win32/api/fileapi/nf-fileapi-readfile) と
[**WriteFile**](/windows/win32/api/fileapi/nf-fileapi-writefile)
関数、またはコンソールの入力バッファや画面バッファにアクセスする任意のコンソール関数（たとえば
[**ReadConsoleInput**](readconsoleinput.md)、[**WriteConsole**](writeconsole.md)、[**GetConsoleScreenBufferInfo**](getconsolescreenbufferinfo.md)
関数）で使用できる。プロセスの標準ハンドルは [**SetStdHandle**](setstdhandle.md)
を呼び出してリダイレクトされる場合があり、その場合 **GetStdHandle**
はリダイレクトされたハンドルを返す。標準ハンドルがリダイレクトされている場合、[**CreateFile**](/windows/win32/api/fileapi/nf-fileapi-createfilea)
関数の呼び出しで `CONIN$` 値を指定してコンソールの入力バッファへのハンドルを取得できる。同様に、`CONOUT$`
値を指定してコンソールのアクティブな画面バッファへのハンドルを取得できる。main
メソッドのエントリ時のプロセスの標準ハンドルは、アプリケーションがビルドされたときにリンカに渡された
[**/SUBSYSTEM**](/cpp/build/reference/subsystem-specify-subsystem)
フラグの構成によって決定される。**/SUBSYSTEM:CONSOLE**
を指定すると、親が継承により標準ハンドルテーブルを既に埋めていない場合、起動時にオペレーティングシステムにコンソールセッションでハンドルを埋めるよう要求する。逆に、**/SUBSYSTEM:WINDOWS**
はアプリケーションがコンソールを必要とせず、おそらく標準ハンドルを使用しないことを意味する。ハンドルの継承の詳細については、[**STARTF\_USESTDHANDLES**](/windows/win32/api/processthreadsapi/ns-processthreadsapi-startupinfoa)
のドキュメントを参照。一部のアプリケーションは宣言されたサブシステムの境界外で動作する。たとえば、**/SUBSYSTEM:WINDOWS**
アプリケーションがログまたはデバッグ目的で標準ハンドルをチェック/使用しつつ、グラフィカルユーザーインターフェイスで通常通り動作する場合がある。これらのアプリケーションは起動時に標準ハンドルの状態を慎重に調査し、必要に応じて
[**AttachConsole**](attachconsole.md)、[**AllocConsole**](allocconsole.md)、[**FreeConsole**](freeconsole.md)
を使用してコンソールを追加/削除する必要がある。一部のアプリケーションは、継承されたハンドルの種類によって動作を変える場合もある。コンソール、パイプ、ファイル、その他の種類を曖昧さを排除して判別するには
[**GetFileType**](/windows/win32/api/fileapi/nf-fileapi-getfiletype)
を使用する。


%index
GetStringScripts
指定した Unicode 文字列で使用されているスクリプトのリストを提供する。
%group
Win32 kernel32
%prm
dwFlags, lpString, cchString, lpScripts, cchScripts
dwFlags : [int] スクリプト取得のオプションを指定するフラグ。
lpString : [wstr] 解析対象の Unicode 文字列へのポインタ。
cchString : [int] lpString が示す Unicode 文字列のサイズ（文字数）。Unicode 文字列が null 終端されている場合、アプリケーションはこのパラメータを -1 に設定する。アプリケーションがこのパラメータを 0 に設定すると、関数は lpScripts に null Unicode 文字列 (L"\0") を取得し、1 を返す。
lpScripts : [wstr] この関数が、ISO 15924 で使用される 4 文字表記を用いてスクリプトのリストを表す null 終端文字列を取得するバッファへのポインタ。各スクリプト名は 4 つのラテン文字で構成され、名前はアルファベット順で取得される。最後を含む各名前の後にセミコロンが続く。あるいは、cchScripts が 0 に設定されている場合、このパラメータには NULL が含まれる。その場合、関数はスクリプトバッファに必要なサイズを返す。
cchScripts : [int] lpScripts が示すスクリプトバッファのサイズ（文字数）。あるいは、アプリケーションはこのパラメータを 0 に設定できる。その場合、関数は lpScripts に NULL を取得し、スクリプトバッファに必要なサイズを返す。
%inst
指定した Unicode 文字列で使用されているスクリプトのリストを提供する。

[戻り値]
成功して cchScripts が 0 以外の値に設定されている場合、出力バッファに取得された文字数（終端 null
文字を含む）を返す。関数は、入力文字列に COMMON または INHERITED
文字のみが含まれ、GSS_ALLOW_INHERITED_COMMON
が設定されていない場合など、スクリプトが見つからなかったことを示すために 1 を返す。各検出スクリプトは 5 文字（4 文字 +
区切り文字）を追加するため、簡単な計算でスクリプト数を (return_code - 1) / 5 として求められる。関数が成功し
cchScripts が 0 の場合、関数はスクリプトバッファに必要なサイズ（終端 null
文字を含む文字数）を返す。スクリプト数は前述のとおりである。成功しなかった場合、関数は 0
を返す。拡張エラー情報を取得するには、アプリケーションは GetLastError を呼ぶ。これは以下のいずれかのエラーコードを返す。
（以下省略）

[備考]
この関数は国際化ドメイン名 (IDN) 関連のセキュリティ問題を緩和する戦略の一部として有用である。スクリプトの判定は、未割り当ての文字が
"Zyyy" (COMMON) ではなく "Zzzz" (UNASSIGNED)
の値を持つことを除き、http://www.unicode.org/Public/4.1.0/ucd/Scripts.txt で
Unicode コンソーシアムが公開しているスクリプト値に基づく。この関数の動作の例を以下に示す。
（以下省略）


%index
GetStringTypeW
指定した Unicode ソース文字列内の文字の文字種情報を取得する。
%group
Win32 kernel32
%prm
dwInfoType, lpSrcStr, cchSrc, lpCharType
dwInfoType : [int] 取得する文字種情報を指定するフラグ。このパラメータには以下の値を指定できる。文字種は備考セクションで説明する異なるレベルに分割される。
lpSrcStr : [wstr] 文字種を取得する Unicode 文字列へのポインタ。cchSrc が任意の負の値に設定されている場合、文字列は null 終端されているとみなされる。
cchSrc : [int] lpSrcStr が示す文字列のサイズ（文字数）。サイズに終端 null 文字が含まれている場合、関数はその文字に対する文字種情報を取得する。アプリケーションがサイズを負の整数に設定した場合、ソース文字列は null 終端されているとみなされ、関数は null 終端のための追加文字とともに自動的にサイズを計算する。
lpCharType : [var] 16 ビット値の配列へのポインタ。この配列の長さは、ソース文字列の各文字に対して 1 つの 16 ビット値を受け取るのに十分な大きさでなければならない。cchSrc が負の数でない場合、lpCharType は cchSrc 個の要素を持つワード配列であるべきである。cchSrc が負の数に設定されている場合、lpCharType は lpSrcStr + 1 個の要素を持つワード配列となる。関数が戻ったとき、この配列にはソース文字列の各文字に対応する 1 つのワードが含まれる。
%inst
指定した Unicode ソース文字列内の文字の文字種情報を取得する。

[戻り値]
成功した場合は 0 以外、それ以外の場合は 0 を返す。拡張エラー情報を取得するには、アプリケーションは GetLastError
を呼ぶ。これは以下のいずれかのエラーコードを返す。
（以下省略）

[備考]
文字列関数の使用の概要については Strings を参照。lpSrcStr と lpCharType
パラメータの値は同じであってはならない。同じである場合、関数は ERROR_INVALID_PARAMETER で失敗する。対応する
GetStringTypeA 関数で使用される Locale
パラメータはこの関数では使用されない。パラメータの違いのため、アプリケーションは #define UNICODE スイッチを使用して
GetStringType* 関数の適切な ANSI または Unicode
版を自動的に呼び出すことができない。アプリケーションは推奨関数である GetStringTypeEx
を使用してこの制限を回避できる。サポートされる文字種 文字種ビットはいくつかのレベルに分割される。1
つのレベルの情報はこの関数の単一の呼び出しで取得できる。各レベルは 16 ビットの情報に制限されており、文字あたり 16
ビット表現に制限される他のマッピング関数も文字種情報を返せるようになっている。Ctype 1 これらの種別は ANSI C と POSIX
(LC_CTYPE) 文字型関数をサポートする。dwInfoType が CT_CTYPE1 に設定されている場合、これらの値のビット単位
OR が出力バッファ内の配列に取得される。DBCS
ロケールの場合、種別属性はナロー文字とワイド文字の両方に適用される。日本語のひらがなとカタカナの文字、漢字の表意文字はすべて
C1_ALPHA 属性を持つ。
（以下省略）


%index
GetStringTypeExW
指定したソース文字列内の文字の文字種情報を取得する。
%group
Win32 kernel32
%prm
Locale, dwInfoType, lpSrcStr, cchSrc, lpCharType
Locale : [int] ロケールを指定するロケール識別子。この値は ANSI コードページを一意に定義する。MAKELCID マクロを使用してロケール識別子を作成するか、以下の定義済み値のいずれかを使用できる。
dwInfoType : [int] 取得する文字種情報を指定するフラグ。可能なフラグ値については GetStringTypeW の dwInfoType パラメータを参照。文字種ビットの詳細は GetStringTypeW の備考を参照。
lpSrcStr : [wstr] 文字種を取得する文字列へのポインタ。cchSrc が任意の負の値に設定されている場合、文字列は null 終端されているとみなされる。
cchSrc : [int] lpSrcStr が示す文字列のサイズ（文字数）。サイズは関数の ANSI 版ではバイト数、Unicode 版ではワイド文字数を指す。サイズに終端 null 文字が含まれている場合、関数はその文字に対する文字種情報を取得する。アプリケーションがサイズを負の整数に設定した場合、ソース文字列は null 終端されているとみなされ、関数は null 終端のための追加文字とともに自動的にサイズを計算する。
lpCharType : [var] 16 ビット値の配列へのポインタ。この配列の長さは、ソース文字列の各文字に対して 1 つの 16 ビット値を受け取るのに十分な大きさでなければならない。cchSrc が負の数でない場合、lpCharType は cchSrc 個の要素を持つワード配列であるべきである。cchSrc が負の数に設定されている場合、lpCharType は lpSrcStr + 1 個の要素を持つワード配列となる。関数が戻ったとき、この配列にはソース文字列の各文字に対応する 1 つのワードが含まれる。
%inst
指定したソース文字列内の文字の文字種情報を取得する。

[戻り値]
成功した場合は 0 以外、それ以外の場合は 0 を返す。拡張エラー情報を取得するには、アプリケーションは GetLastError
を呼ぶ。これは以下のいずれかのエラーコードを返す。
（以下省略）

[備考]
文字列関数の使用の概要については Strings を参照。指定されたロケールの ANSI コードページを使用して、この関数はソース文字列を
ANSI から Unicode に変換する。次に各 Unicode 文字を文字種情報について解析する。この関数の ANSI
版はソース文字列を Unicode に変換し、対応する GetStringTypeW
関数を呼ぶ。したがって、出力バッファ内のワードはオリジナルの ANSI 文字列ではなく、その Unicode 等価物に対応する。ANSI
から Unicode への変換は文字列の長さを変える可能性がある。たとえば、ANSI 文字のペアは単一の Unicode
文字にマップされうる。したがって、出力バッファ内のワードとオリジナルの ANSI
文字列内の文字との対応は、たとえばマルチバイト文字列の場合、すべてのケースで 1 対 1 とは限らない。よって、この関数の ANSI
版はマルチ文字文字列に対しては有用性が限定される。代わりに Unicode 版が推奨される。この関数は、GetStringTypeA と
GetStringTypeW のパラメータの違いによる制約を回避する。パラメータの違いのため、アプリケーションは #define
UNICODE スイッチを使用して GetStringType* 関数の適切な ANSI または Unicode
版を自動的に呼び出すことができない。一方、GetStringTypeEx
はそのスイッチに関して適切に動作する。よって推奨される関数である。
Unicode 専用ロケール識別子と共にこの関数の ANSI
版を使用する場合、オペレーティングシステムがシステムコードページを使用するため関数は成功し得る。ただし、システムコードページで未定義の文字は文字列内で疑問符
(?) として現れる。lpSrcStr と lpCharType パラメータの値は同じであってはならない。同じである場合、関数は
ERROR_INVALID_PARAMETER で失敗する。Locale パラメータは Unicode
への文字列変換を行うためにのみ使用される。アプリケーションが提供する CTYPE* 値とは無関係である。これらの値は Unicode
コードポイントによってのみ決定され、ロケール単位で変化することはない。たとえば、ギリシャ文字は Locale の任意の値に対して
C1_ALPHA として指定される。


%index
GetSystemDEPPolicy
システムのデータ実行防止 (DEP) ポリシー設定を取得する。
%group
Win32 kernel32
%prm

%inst
システムのデータ実行防止 (DEP) ポリシー設定を取得する。

[戻り値]
この関数は DEP_SYSTEM_POLICY_TYPE 型の値を返す。これは以下の値のいずれかである。
（以下省略）

[備考]
システム全体の DEP ポリシーは、ブート構成データのポリシー設定に従ってブート時に構成される。システム全体の DEP
ポリシー設定を変更するには、BCDEdit /set コマンドを使用して nx ブートエントリオプションを設定する。システム DEP
ポリシーが OptIn または OptOut の場合、SetProcessDEPPolicy 関数を呼ぶことで現在のプロセスに対して
DEP を選択的に有効化または無効化できる。この関数は 32
ビットプロセスでのみ動作する。管理者特権を持つユーザーは、システムコントロールパネルアプリケーションを使用して選択したアプリケーションに対する
DEP を無効化できる。システム DEP ポリシーが OptOut の場合、これらのアプリケーションに対して DEP
は無効化される。Application Compatibility Toolkit を使用して DEP
から免除される個々のアプリケーションのリストを作成できる。システム DEP ポリシーが OptOut
の場合、リスト上のアプリケーションに対しては DEP が自動的に無効化される。


%index
GetSystemDefaultLCID
システムロケールのロケール識別子を返す。注意 Windows Vista 以降のみで動作するアプリケーションは、この関数よりも GetSystemDefaultLocaleName を優先して使用すべきである。
%group
Win32 kernel32
%prm

%inst
システムロケールのロケール識別子を返す。注意 Windows Vista 以降のみで動作するアプリケーションは、この関数よりも
GetSystemDefaultLocaleName を優先して使用すべきである。

[戻り値]
LOCALE_SYSTEM_DEFAULT で識別されるシステム既定ロケールのロケール識別子を返す。

[備考]

この関数はカスタムロケールからデータを取得できる。データはコンピュータ間やアプリケーションの実行間で同じであることは保証されない。アプリケーションがデータを永続化または送信する必要がある場合は、Using
Persistent Locale Data を参照。


%index
GetSystemDefaultLangID
システムロケールの言語識別子を返す。
%group
Win32 kernel32
%prm

%inst
システムロケールの言語識別子を返す。

[戻り値]
システムロケールの言語識別子を返す。これは Unicode
をサポートしないプログラムでテキストを表示するときに使用される言語である。これは管理者がコントロールパネル > 時計、言語、地域 >
日付、時刻、または数値形式の変更 > 管理タブで設定する。言語識別子の詳細は Language Identifier Constants
and Strings を参照。


%index
GetSystemDefaultLocaleName
システム既定ロケール名を取得する。注意 アプリケーションは GetUserDefaultLocaleName をこの関数より優先して呼び出すことが推奨される。
%group
Win32 kernel32
%prm
lpLocaleName, cchLocaleName
lpLocaleName : [wstr] この関数がロケール名を取得するバッファへのポインタ。
cchLocaleName : [int] lpLocaleName が示す出力バッファのサイズ（文字数）。ロケール名の最大可能文字長（終端 null 文字を含む）は LOCALE_NAME_MAX_LENGTH の値である。これが推奨サイズである。
%inst
システム既定ロケール名を取得する。注意 アプリケーションは GetUserDefaultLocaleName
をこの関数より優先して呼び出すことが推奨される。

[戻り値]
成功した場合、終端 null 文字を含むロケール名の長さを示す 0 より大きい値を返す。成功しなかった場合、関数は 0
を返す。拡張エラー情報を取得するには、アプリケーションは GetLastError を呼ぶ。これは以下のいずれかのエラーコードを返す。
（以下省略）

[備考]

この関数はカスタムロケールからデータを取得できる。データはコンピュータ間やアプリケーションの実行間で同じであることは保証されない。アプリケーションがデータを永続化または送信する必要がある場合は、Using
Persistent Locale Data を参照。


%index
GetSystemDefaultUILanguage
オペレーティングシステムのシステム既定 UI 言語の言語識別子を取得する。これは Windows Vista 以降では「インストール言語」とも呼ばれる。詳細は User Interface Language Management を参照。
%group
Win32 kernel32
%prm

%inst
オペレーティングシステムのシステム既定 UI 言語の言語識別子を取得する。これは Windows Vista
以降では「インストール言語」とも呼ばれる。詳細は User Interface Language Management を参照。

[戻り値]
オペレーティングシステムのシステム既定 UI 言語の言語識別子を返す。詳細は備考セクションを参照。

[備考]
この関数は Language Interface Pack (LIP) の言語識別子を決して返さない。また、ロケール識別子
[LOCALE_CUSTOM_UNSPECIFIED](/windows/desktop/Intl/locale-custom-constants)
または
[LOCALE_CUSTOM_UI_DEFAULT](/windows/desktop/Intl/locale-custom-constants)
に対応する言語識別子も決して返さない。この関数はシステムの優先 UI
言語リストの最初の言語の識別子を必ずしも返さないことに注意する。したがって戻り値は
[GetSystemPreferredUILanguages](/windows/desktop/api/winnls/nf-winnls-getsystempreferreduilanguages)
で取得される最初の要素と一致しない場合がある。


%index
GetSystemDirectoryW
システムディレクトリのパスを取得する。(Unicode)
%group
Win32 kernel32
%prm
lpBuffer, uSize
lpBuffer : [wstr] パスを受け取るバッファへのポインタ。システムディレクトリがルートディレクトリでない限り、このパスはバックスラッシュで終わらない。たとえば、システムディレクトリが C ドライブ上の Windows\System32 という名前である場合、この関数で取得されるシステムディレクトリのパスは C:\Windows\System32 となる。
uSize : [int] バッファの最大サイズ（TCHAR 単位）。
%inst
システムディレクトリのパスを取得する。(Unicode)

[戻り値]
関数が成功した場合、戻り値はバッファにコピーされた文字列の長さ（TCHAR 単位）で、終端 null
文字を含まない。長さがバッファのサイズより大きい場合、戻り値はパスを保持するために必要なバッファのサイズで、終端 null
文字を含む。関数が失敗した場合、戻り値は 0。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]

アプリケーションはシステムディレクトリにファイルを作成すべきではない。ユーザーが共有版のオペレーティングシステムを実行している場合、アプリケーションはシステムディレクトリへの書き込みアクセスを持たない。


%index
GetSystemFileCacheSize
システムキャッシュのワーキングセットの現在のサイズ制限を取得する。
%group
Win32 kernel32
%prm
lpMinimumFileCacheSize, lpMaximumFileCacheSize, lpFlags
lpMinimumFileCacheSize : [var] ファイルキャッシュの最小サイズ（バイト単位）を受け取る変数へのポインタ。FILE_CACHE_MIN_HARD_ENABLE フラグを指定した SetSystemFileCacheSize 関数の事前呼び出しがある場合、仮想メモリマネージャは少なくともこの量のメモリをシステムファイルキャッシュに常駐させようとする。
lpMaximumFileCacheSize : [var] ファイルキャッシュの最大サイズ（バイト単位）を受け取る変数へのポインタ。仮想メモリマネージャは、FILE_CACHE_MAX_HARD_ENABLE フラグを指定した SetSystemFileCacheSize の事前呼び出しがあった場合にのみ、この制限を強制する。
lpFlags : [var] ファイルキャッシュ制限のうちどれが有効かを示すフラグ。
%inst
システムキャッシュのワーキングセットの現在のサイズ制限を取得する。

[戻り値]
関数が成功した場合、戻り値は 0 以外の値。関数が失敗した場合、戻り値は 0。拡張エラー情報を取得するには GetLastError
を呼ぶ。

[備考]
この関数を使用するアプリケーションをコンパイルするには、_WIN32_WINNT を 0x0502 以降として定義する。詳細は Using
the Windows Headers を参照。FILE_CACHE 定数は Windows Server 2008 用 Windows
SDK 以降の Windows ヘッダファイルで定義される。以前のバージョンの SDK
のヘッダファイルを使用している場合、SetSystemFileCacheSize に示された定義をコードに追加する。


%index
GetSystemFirmwareTable
ファームウェアテーブルプロバイダから指定したファームウェアテーブルを取得する。
%group
Win32 kernel32
%prm
FirmwareTableProviderSignature, FirmwareTableID, pFirmwareTableBuffer, BufferSize
FirmwareTableProviderSignature : [int] 
FirmwareTableID : [int] ファームウェアテーブルの識別子。この識別子はリトルエンディアンであり、文字列内の文字を反転する必要がある。たとえば、FACP は ACPI プロバイダで、ACPI 仕様の DESCRIPTION_HEADER 構造体の Signature フィールドに記述されている（[Advanced Configuration and Power Interface (ACPI) Specification](https://uefi.org/htmlspecs/ACPI_Spec_6_4_html/) を参照）。したがって、以下の例のように FACP テーブルを指定するには 'PCAF' を使用する: retVal = GetSystemFirmwareTable('ACPI', 'PCAF', pBuffer, BUFSIZE); 詳細は EnumSystemFirmwareTables 関数の備考セクションを参照。
pFirmwareTableBuffer : [var] 要求されたファームウェアテーブルを受け取るバッファへのポインタ。このパラメータが NULL の場合、戻り値は必要なバッファサイズである。このバッファの内容の詳細は備考セクションを参照。
BufferSize : [int] pFirmwareTableBuffer バッファのサイズ（バイト単位）。
%inst
ファームウェアテーブルプロバイダから指定したファームウェアテーブルを取得する。

[戻り値]
関数が成功した場合、戻り値はバッファに書き込まれたバイト数。この値は常に BufferSize
以下となる。バッファが十分な大きさでないために関数が失敗した場合、戻り値は必要なバッファサイズ（バイト単位）。この値は常に
BufferSize より大きい。それ以外の理由で関数が失敗した場合、戻り値は 0。拡張エラー情報を取得するには GetLastError
を呼ぶ。

[備考]
Windows 10 バージョン 1803 以降、ユニバーサル Windows アプリはアプリマニフェストで smbios
制限機能を宣言することにより System Management BIOS (SMBIOS) 情報にアクセスできる。詳細は Access
SMBIOS information from a Universal Windows App を参照。ユニバーサル Windows
アプリからアクセスできるのは生の SMBIOS (RSMB) ファームウェアテーブルのみである。Windows Server 2003
with Service Pack 1 (SP1) 以降、アプリケーションは \Device\PhysicalMemory
オブジェクトにアクセスできない。このオブジェクトへのアクセスはカーネルモードドライバに制限されている。この変更は、System
Management BIOS (SMBIOS) または物理メモリの最下位 1MB に格納されたその他の BIOS
データを読み取るアプリケーションに影響する。アプリケーションには低物理メモリからデータを読み取る以下の代替手段がある。
（以下省略）


%index
GetSystemInfo
現在のシステムに関する情報を取得する。
%group
Win32 kernel32
%prm
lpSystemInfo
lpSystemInfo : [var] 情報を受け取る SYSTEM_INFO 構造体へのポインタ。
%inst
現在のシステムに関する情報を取得する。


%index
GetSystemPowerStatus
システムの電源状態を取得する。状態は、システムが AC 電源で動作しているか DC 電源で動作しているか、バッテリーが現在充電中か、バッテリー寿命がどれくらい残っているか、バッテリーセーバーがオンかオフかを示す。
%group
Win32 kernel32
%prm
lpSystemPowerStatus
lpSystemPowerStatus : [var] 状態情報を受け取る SYSTEM_POWER_STATUS 構造体へのポインタ。
%inst
システムの電源状態を取得する。状態は、システムが AC 電源で動作しているか DC
電源で動作しているか、バッテリーが現在充電中か、バッテリー寿命がどれくらい残っているか、バッテリーセーバーがオンかオフかを示す。

[戻り値]
関数が成功した場合、戻り値は 0 以外。関数が失敗した場合、戻り値は 0。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
この関数を使用するアプリケーションをコンパイルするには、_WIN32_WINNT マクロを 0x0400 以降として定義する。詳細は
Using the Windows Headers を参照。


%index
GetSystemPreferredUILanguages
システムの優先 UI 言語を取得する。詳細は User Interface Language Management を参照。
%group
Win32 kernel32
%prm
dwFlags, pulNumLanguages, pwszLanguagesBuffer, pcchLanguagesBuffer
dwFlags : [int] 言語形式とフィルタリングを識別するフラグ。以下のフラグはシステムの優先 UI 言語に使用する形式を指定する。フラグは相互排他的で、既定は MUI_LANGUAGE_NAME である。
pulNumLanguages : [var] pwszLanguagesBuffer に取得される言語の数へのポインタ。
pwszLanguagesBuffer : [int] 省略可能。dwFlags で指定された形式で、この関数が順序付けされた null 区切りのシステム優先 UI 言語リストを取得するバッファへのポインタ。このリストは 2 つの null 文字で終わる。あるいは、このパラメータが NULL に設定され、pcchLanguagesBuffer が 0 に設定されている場合、関数は必要な言語バッファのサイズを pcchLanguagesBuffer に取得する。必要なサイズには 2 つの null 文字が含まれる。
pcchLanguagesBuffer : [var] pwszLanguagesBuffer が示す言語バッファのサイズ（文字数）へのポインタ。関数から正常に戻ったとき、このパラメータには取得された言語バッファのサイズが含まれる。あるいは、このパラメータが 0 に設定され、pwszLanguagesBuffer が NULL に設定されている場合、関数は必要な言語バッファのサイズを pcchLanguagesBuffer に取得する。
%inst
システムの優先 UI 言語を取得する。詳細は User Interface Language Management を参照。

[戻り値]
成功した場合は TRUE、それ以外の場合は FALSE を返す。拡張エラー情報を取得するには、アプリケーションは GetLastError
を呼ぶ。これは以下のいずれかのエラーコードを返す。
（以下省略）

[備考]
MUI_LANGUAGE_ID が指定されている場合、取得される言語文字列は先頭の 0x を含まない 16 進数の言語識別子で、長さは 4
文字となる。たとえば en-US は "0409" として、en は "0009" として返される。システム優先 UI
言語は、補助ロケールに対応する Language Interface Pack (LIP) 言語を 1
つを超えて含むことはできない。リストにこれらの言語が複数含まれており、アプリケーションが関数の呼び出しで MUI_LANGUAGE_ID
を指定した場合、その言語に対して言語バッファには "1400" が含まれる。この文字列は LOCALE_CUSTOM_UI_DEFAULT
の 16 進数値に対応する。MUI_MACHINE_LANGUAGE_SETTINGS
フラグが設定されている場合、この関数はリスト内の各言語が有効な NLS
ロケールを表すかチェックする。取得されるリストには以下の項目が含まれることがある。
（以下省略）


%index
GetSystemRegistryQuota
レジストリの現在のサイズと、システムでレジストリが達することを許可されている最大サイズを取得する。
%group
Win32 kernel32
%prm
pdwQuotaAllowed, pdwQuotaUsed
pdwQuotaAllowed : [var] このシステムでレジストリが達することを許可されている最大サイズ（バイト単位）を受け取る変数へのポインタ。
pdwQuotaUsed : [var] レジストリの現在のサイズ（バイト単位）を受け取る変数へのポインタ。
%inst
レジストリの現在のサイズと、システムでレジストリが達することを許可されている最大サイズを取得する。

[戻り値]
関数が成功した場合、戻り値は 0 以外。関数が失敗した場合、戻り値は 0。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
この関数を使用するアプリケーションをコンパイルするには、_WIN32_WINNT を 0x0501 以降として定義する。詳細は Using
the Windows Headers を参照。


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
GetSystemTimeAdjustment
システムが時刻クロックに周期的時刻調整を適用しているかどうかを判定し、そのような調整の値と期間を取得する。
%group
Win32 kernel32
%prm
lpTimeAdjustment, lpTimeIncrement, lpTimeAdjustmentDisabled
lpTimeAdjustment : [var] システムが実際にカウントする時間が経過するごとに、関数が時刻クロックに加算する lpTimeIncrement 100 ナノ秒単位の数を設定する変数へのポインタ。この値は lpTimeAdjustmentDisabled が FALSE の場合のみ意味を持つ。
lpTimeIncrement : [var] システムが時刻クロックに lpTimeAdjustment を加算する 100 ナノ秒単位の間隔を設定する変数へのポインタ。この値は lpTimeAdjustmentDisabled が FALSE の場合のみ意味を持つ。
lpTimeAdjustmentDisabled : [var] 周期的時刻調整が有効かどうかを示すために関数が設定する変数へのポインタ。
%inst
システムが時刻クロックに周期的時刻調整を適用しているかどうかを判定し、そのような調整の値と期間を取得する。

[戻り値]
関数が成功した場合、戻り値は 0 以外。関数が失敗した場合、戻り値は 0。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
GetSystemTimeAdjustment と SetSystemTimeAdjustment 関数は、GetSystemTime と
GetLocalTime
によって報告される時刻クロックを、周期的時刻調整を使用して別の時刻ソースと同期させたいアルゴリズムをサポートするために使用できる。GetSystemTimeAdjustment
関数は、呼び出し側が周期的時刻調整が有効かどうかを判定し、有効な場合は各調整の量と調整間の時間を取得できる。SetSystemTimeAdjustment
関数は、呼び出し側が周期的時刻調整を有効化または無効化し、調整増分の値を設定できる。


%index
GetSystemTimeAsFileTime
現在のシステム日時を取得する。情報は協定世界時 (UTC) 形式である。
%group
Win32 kernel32
%prm
lpSystemTimeAsFileTime
lpSystemTimeAsFileTime : [var] 現在のシステム日時を UTC 形式で受け取る FILETIME 構造体へのポインタ。
%inst
現在のシステム日時を取得する。情報は協定世界時 (UTC) 形式である。


%index
GetSystemTimePreciseAsFileTime
GetSystemTimePreciseAsFileTime 関数は、可能な限り最高レベルの精度 (<1us) で現在のシステム日時を取得する。取得される情報は協定世界時 (UTC) 形式である。
%group
Win32 kernel32
%prm
lpSystemTimeAsFileTime
lpSystemTimeAsFileTime : [var] 型: LPFILETIME 現在のシステム日時を UTC 形式で含む FILETIME 構造体へのポインタ。
%inst
GetSystemTimePreciseAsFileTime 関数は、可能な限り最高レベルの精度 (<1us)
で現在のシステム日時を取得する。取得される情報は協定世界時 (UTC) 形式である。

[備考]
注意 この関数は高解像度の時刻測定や、UTC に同期されたタイムスタンプに最適である。高解像度の間隔測定には
QueryPerformanceCounter または KeQueryPerformanceCounter
を使用する。高解像度のタイムスタンプの取得の詳細は Acquiring high-resolution time stamps を参照。


%index
GetSystemTimes
システムタイミング情報を取得する。マルチプロセッサシステムでは、返される値はすべてのプロセッサにわたる指定時間の合計である。
%group
Win32 kernel32
%prm
lpIdleTime, lpKernelTime, lpUserTime
lpIdleTime : [var] システムがアイドル状態であった時間量を受け取る FILETIME 構造体へのポインタ。
lpKernelTime : [var] システムがカーネルモードで実行された時間量（すべてのプロセッサ上のすべてのプロセスのすべてのスレッドを含む）を受け取る FILETIME 構造体へのポインタ。この時間値はシステムがアイドル状態であった時間量も含む。
lpUserTime : [var] システムがユーザーモードで実行された時間量（すべてのプロセッサ上のすべてのプロセスのすべてのスレッドを含む）を受け取る FILETIME 構造体へのポインタ。
%inst
システムタイミング情報を取得する。マルチプロセッサシステムでは、返される値はすべてのプロセッサにわたる指定時間の合計である。

[戻り値]
関数が成功した場合、戻り値は 0 以外。関数が失敗した場合、戻り値は 0。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
この関数を使用するアプリケーションをコンパイルするには、_WIN32_WINNT を 0x0501 以降として定義する。詳細は Using
the Windows Headers を参照。


%index
GetSystemWindowsDirectoryW
マルチユーザーシステム上の共有 Windows ディレクトリのパスを取得する。(Unicode)
%group
Win32 kernel32
%prm
lpBuffer, uSize
lpBuffer : [wstr] パスを受け取るバッファへのポインタ。Windows ディレクトリがルートディレクトリでない限り、このパスはバックスラッシュで終わらない。たとえば、Windows ディレクトリが C ドライブ上の Windows という名前である場合、この関数で取得される Windows ディレクトリのパスは C:\Windows となる。システムが C ドライブのルートディレクトリにインストールされている場合、取得されるパスは C:\ となる。
uSize : [int] lpBuffer パラメータで指定したバッファの最大サイズ（TCHAR 単位）。
%inst
マルチユーザーシステム上の共有 Windows ディレクトリのパスを取得する。(Unicode)

[戻り値]
関数が成功した場合、戻り値はバッファにコピーされた文字列の長さ（TCHAR 単位）で、終端 null
文字を含まない。長さがバッファのサイズより大きい場合、戻り値はパスを保持するために必要なバッファのサイズ。関数が失敗した場合、戻り値は
0。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
ターミナルサービスを実行するシステムでは、各ユーザーに固有の Windows ディレクトリがある。システム Windows
ディレクトリはすべてのユーザーで共有されるため、すべてのユーザーに適用される初期化ファイルやヘルプファイルをアプリケーションが格納するべきディレクトリである。ターミナルサービスでは、GetSystemWindowsDirectory
関数はシステム Windows ディレクトリのパスを取得し、GetWindowsDirectory 関数は各ユーザー専用の Windows
ディレクトリのパスを取得する。シングルユーザーシステムでは、GetSystemWindowsDirectory は
GetWindowsDirectory と同じである。
> [!NOTE] > sysinfoapi.h ヘッダは GetSystemWindowsDirectory を、UNICODE
プリプロセッサ定数の定義に基づいて ANSI または Unicode
版を自動選択するエイリアスとして定義する。エンコーディング中立なエイリアスとそうでないコードを混在させると、コンパイルや実行時のエラーを引き起こす不一致が生じうる。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
GetSystemWow64DirectoryW
WOW64 が使用するシステムディレクトリのパスを取得する。(Unicode)
%group
Win32 kernel32
%prm
lpBuffer, uSize
lpBuffer : [wstr] パスを受け取るバッファへのポインタ。このパスはバックスラッシュで終わらない。
uSize : [int] バッファの最大サイズ（TCHAR 単位）。
%inst
WOW64 が使用するシステムディレクトリのパスを取得する。(Unicode)

[戻り値]
関数が成功した場合、戻り値はバッファにコピーされた文字列の長さ（TCHAR 単位）で、終端 null
文字を含まない。長さがバッファのサイズより大きい場合、戻り値はパスを保持するために必要なバッファのサイズ。関数が失敗した場合、戻り値は
0。拡張エラー情報を取得するには GetLastError を呼ぶ。32 ビット Windows では関数は常に失敗し、拡張エラーは
ERROR_CALL_NOT_IMPLEMENTED に設定される。

[備考]
WOW64 はシステムディレクトリを使用して、64 ビット Windows 上で共有 32
ビットコードを格納する。ほとんどのアプリケーションはこのディレクトリに明示的にアクセスする必要はない。WOW64 の詳細は Running
32-bit Applications を参照。この関数を使用するアプリケーションをコンパイルするには、_WIN32_WINNT を
0x0501 以降として定義する。詳細は Using the Windows Headers を参照。
> [!NOTE] > wow64apiset.h ヘッダは GetSystemWow64Directory を、UNICODE
プリプロセッサ定数の定義に基づいて ANSI または Unicode
版を自動選択するエイリアスとして定義する。エンコーディング中立なエイリアスとそうでないコードを混在させると、コンパイルや実行時のエラーを引き起こす不一致が生じうる。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
GetTapeParameters
テープまたはテープドライブを記述する情報を取得する。
%group
Win32 kernel32
%prm
hDevice, dwOperation, lpdwSize, lpTapeInformation
hDevice : [intptr] 情報を取得するデバイスのハンドル。このハンドルは CreateFile 関数を使用して作成される。
dwOperation : [int] 
lpdwSize : [var] lpTapeInformation パラメータで指定されたバッファのサイズ（バイト単位）を受け取る変数へのポインタ。バッファが小さすぎる場合、このパラメータは必要なサイズを受け取る。
lpTapeInformation : [intptr] 要求された情報を含む構造体へのポインタ。dwOperation パラメータが GET_TAPE_MEDIA_INFORMATION の場合、lpTapeInformation は TAPE_GET_MEDIA_PARAMETERS 構造体を指す。dwOperation が GET_TAPE_DRIVE_INFORMATION の場合、lpTapeInformation は TAPE_GET_DRIVE_PARAMETERS 構造体を指す。
%inst
テープまたはテープドライブを記述する情報を取得する。

[戻り値]
関数が成功した場合、戻り値は NO_ERROR。関数が失敗した場合、以下のいずれかのエラーコードを返す。
（以下省略）

[備考]
dwOperation パラメータを GET_TAPE_DRIVE_INFORMATION 値に設定して呼び出した
GetTapeParameters
関数が返すブロックサイズ範囲値（最大と最小）は、ドライブの制限ではなくシステム制限を示す。ただし、真のブロックサイズ制限を決定するのはテープドライブデバイスとドライブ内のメディアである。したがって、アプリケーションは
dwOperation に GET_TAPE_DRIVE_INFORMATION
を指定して取得した範囲内のすべてのブロックサイズを設定できるとは限らない。


%index
GetTapePosition
論理または絶対ブロック単位でテープの現在のアドレスを取得する。
%group
Win32 kernel32
%prm
hDevice, dwPositionType, lpdwPartition, lpdwOffsetLow, lpdwOffsetHigh
hDevice : [intptr] テープ位置を取得するデバイスのハンドル。このハンドルは CreateFile を使用して作成される。
dwPositionType : [int] 
lpdwPartition : [var] 現在のテープパーティションの番号を受け取る変数へのポインタ。パーティションは 1 から n まで論理的に番号付けされる。1 はテープ上の最初のパーティション、n は最後のパーティションである。デバイス固有のブロックアドレスが取得される場合、またはデバイスが 1 つのパーティションのみをサポートする場合、このパラメータは 0 を受け取る。
lpdwOffsetLow : [var] 現在のテープ位置の下位ビットを受け取る変数へのポインタ。
lpdwOffsetHigh : [var] 現在のテープ位置の上位ビットを受け取る変数へのポインタ。上位ビットが不要な場合、このパラメータは NULL でよい。
%inst
論理または絶対ブロック単位でテープの現在のアドレスを取得する。

[戻り値]
関数が成功した場合、戻り値は NO_ERROR。関数が失敗した場合、以下のいずれかのエラーコードを返す。
（以下省略）

[備考]
論理ブロックアドレスはパーティションに対する相対位置である。各パーティションの最初の論理ブロックアドレスは 0
である。テープドライブとメディアの状態、機能、容量に関する情報を取得するには GetTapeParameters 関数を呼ぶ。


%index
GetTapeStatus
テープデバイスがテープコマンドを処理する準備ができているかどうかを判定する。
%group
Win32 kernel32
%prm
hDevice
hDevice : [intptr] デバイスの状態を取得するデバイスのハンドル。このハンドルは CreateFile 関数を使用して作成される。
%inst
テープデバイスがテープコマンドを処理する準備ができているかどうかを判定する。

[戻り値]
テープデバイスがエラーを返さずに適切なテープアクセスコマンドを受け入れる準備ができている場合、戻り値は
NO_ERROR。関数が失敗した場合、以下のいずれかのエラーコードを返す。
（以下省略）


%index
GetTempFileNameW
一時ファイル用の名前を作成する。一意のファイル名が生成された場合、空のファイルが作成され、そのハンドルが解放される。それ以外の場合、ファイル名のみが生成される。(GetTempFileNameW)
%group
Win32 kernel32
%prm
lpPathName, lpPrefixString, uUnique, lpTempFileName
lpPathName : [wstr] ファイル名のディレクトリパス。アプリケーションは通常、現在のディレクトリにはピリオド (.) を、または GetTempPath 関数の結果を指定する。文字列は MAX_PATH?14 文字より長くすることはできない。そうでない場合 GetTempFileName は失敗する。このパラメータが NULL の場合、関数は失敗する。
lpPrefixString : [wstr] null 終端のプレフィックス文字列。関数はこの文字列の最初の 3 文字までをファイル名のプレフィックスとして使用する。この文字列は OEM 定義文字セットの文字で構成されなければならない。
uUnique : [int] 一時ファイル名の作成に使用される符号なし整数。詳細は備考を参照。uUnique が 0 の場合、関数は現在のシステム時刻を使用して一意のファイル名を作成しようとする。ファイルが既に存在する場合、番号は 1 つずつ増加し、関数はこのファイルが既に存在するかをテストする。これは一意のファイル名が見つかるまで続く。関数はその名前のファイルを作成して閉じる。uUnique が 0 以外の場合、関数はファイル名の一意性を検証しないことに注意する。
lpTempFileName : [wstr] 一時ファイル名を受け取るバッファへのポインタ。このバッファはパスと終端 null 文字を収容するために MAX_PATH 文字でなければならない。
%inst

一時ファイル用の名前を作成する。一意のファイル名が生成された場合、空のファイルが作成され、そのハンドルが解放される。それ以外の場合、ファイル名のみが生成される。(GetTempFileNameW)

[戻り値]
関数が成功した場合、戻り値は一時ファイル名で使用される一意の数値を指定する。uUnique パラメータが 0
以外の場合、戻り値は同じ番号を指定する。関数が失敗した場合、戻り値は 0。拡張エラー情報を取得するには GetLastError を呼ぶ。
以下は可能な戻り値である。
（以下省略）

[備考]
GetTempFileName 関数は次の形式の一時ファイル名を作成する: <path>\<pre><uuuu>.TMP
以下の表はファイル名の構文を説明する。
（以下省略）


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
GetThreadErrorMode
呼び出し側スレッドのエラーモードを取得する。
%group
Win32 kernel32
%prm

%inst
呼び出し側スレッドのエラーモードを取得する。

[戻り値]
プロセスのエラーモード。この関数は以下のいずれかの値を返す。
（以下省略）

[備考]
スレッドは実行されているプロセスのエラーモードを継承する。スレッドのエラーモードを変更するには SetThreadErrorMode
関数を使用する。


%index
GetThreadGroupAffinity
指定したスレッドのプロセッサグループアフィニティを取得する。
%group
Win32 kernel32
%prm
hThread, GroupAffinity
hThread : [intptr] プロセッサグループアフィニティを取得するスレッドのハンドル。ハンドルは THREAD_QUERY_INFORMATION または THREAD_QUERY_LIMITED_INFORMATION アクセス権を持つ必要がある。詳細は Thread Security and Access Rights を参照。
GroupAffinity : [var] スレッドのグループアフィニティを受け取る GROUP_AFFINITY 構造体へのポインタ。
%inst
指定したスレッドのプロセッサグループアフィニティを取得する。

[戻り値]
関数が成功した場合、戻り値は 0 以外。関数が失敗した場合、戻り値は 0。拡張エラー情報を取得するには GetLastError
を使用する。

[備考]
Windows 11 および Windows Server 2022 以降では、64
を超えるプロセッサを持つシステムにおいて、プロセスとスレッドのアフィニティは既定でシステム内のすべてのプロセッサ群（すべてのプロセッサグループにまたがる）に及ぶ。GetThreadGroupAffinity
関数はスレッドのプライマリグループ上のグループアフィニティを取得する。この関数を使用するアプリケーションをコンパイルするには、_WIN32_WINNT
>= 0x0601 を設定する。詳細は Using the Windows Headers を参照。


%index
GetThreadIOPendingFlag
指定したスレッドが I/O 要求を保留中かどうかを判定する。
%group
Win32 kernel32
%prm
hThread, lpIOIsPending
hThread : [intptr] 対象スレッドのハンドル。このハンドルは THREAD_QUERY_INFORMATION アクセス権で作成されている必要がある。詳細は Thread Security and Access Rights を参照。
lpIOIsPending : [var] 指定したスレッドに 1 つ以上の I/O 要求が保留中の場合は TRUE、そうでない場合は FALSE を関数が設定する変数へのポインタ。
%inst
指定したスレッドが I/O 要求を保留中かどうかを判定する。

[戻り値]
関数が成功した場合、戻り値は 0 以外。関数が失敗した場合、戻り値は 0。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
指定したスレッドの I/O
状態は急速に変化する可能性があり、関数が戻る時点ですでに変化している可能性があることに留意する。たとえば、関数が
lpIOIsPending を設定してから戻るまでの間に、保留中の I/O
処理が完了する可能性がある。この関数を使用するアプリケーションをコンパイルするには、_WIN32_WINNT を 0x0501
以降として定義する。詳細は Using the Windows Headers を参照。


%index
GetThreadId
指定したスレッドのスレッド識別子を取得する。
%group
Win32 kernel32
%prm
Thread
Thread : [intptr] スレッドのハンドル。ハンドルは THREAD_QUERY_INFORMATION または THREAD_QUERY_LIMITED_INFORMATION アクセス権を持つ必要がある。アクセス権の詳細は Thread Security and Access Rights を参照。Windows Server 2003: ハンドルは THREAD_QUERY_INFORMATION アクセス権を持つ必要がある。
%inst
指定したスレッドのスレッド識別子を取得する。

[戻り値]
関数が失敗した場合、戻り値は 0。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]

スレッドが終了するまで、そのスレッド識別子はシステム上で一意にスレッドを識別する。この関数を使用するアプリケーションをコンパイルするには、_WIN32_WINNT
を 0x0502 以降として定義する。詳細は Using the Windows Headers を参照。


%index
GetThreadIdealProcessorEx
指定したスレッドの理想プロセッサのプロセッサ番号を取得する。
%group
Win32 kernel32
%prm
hThread, lpIdealProcessor
hThread : [intptr] 理想プロセッサを取得するスレッドのハンドル。このハンドルは THREAD_QUERY_LIMITED_INFORMATION アクセス権で作成されている必要がある。詳細は Thread Security and Access Rights を参照。
lpIdealProcessor : [var] 理想プロセッサの番号を受け取る PROCESSOR_NUMBER 構造体を指す。
%inst
指定したスレッドの理想プロセッサのプロセッサ番号を取得する。

[戻り値]
関数が成功した場合、0 以外の値を返す。関数が失敗した場合、0 を返す。拡張エラー情報を取得するには GetLastError
を使用する。

[備考]
この関数を使用するアプリケーションをコンパイルするには、_WIN32_WINNT >= 0x0601 を設定する。詳細は Using
the Windows Headers を参照。


%index
GetThreadInformation
指定したスレッドに関する情報を取得する。(GetThreadInformation)
%group
Win32 kernel32
%prm
hThread, ThreadInformationClass, ThreadInformation, ThreadInformationSize
hThread : [intptr] スレッドのハンドル。ハンドルは THREAD_QUERY_INFORMATION アクセス権を持つ必要がある。詳細は [Thread Security and Access Rights](/windows/desktop/ProcThread/thread-security-and-access-rights) を参照。
ThreadInformationClass : [int] 取得する情報のクラス。この値は **ThreadMemoryPriority**、**ThreadAbsoluteCpuPriority**、または **ThreadDynamicCodePolicy** にできる。> [!NOTE] > **ThreadDynamicCodePolicy** は Windows Server 2016 以降、Windows 10 LTSB 2016 以降、Windows 10 バージョン 1607 以降でサポートされる。
ThreadInformation : [intptr] *ThreadInformationClass* パラメータで指定された情報の種類を受け取る構造体へのポインタ。*ThreadInformationClass* パラメータが **ThreadMemoryPriority** の場合、このパラメータは **MEMORY_PRIORITY_INFORMATION** 構造体を指す必要がある。*ThreadInformationClass* パラメータが **ThreadAbsoluteCpuPriority** の場合、このパラメータは **LONG** を指す必要がある。*ThreadInformationClass* パラメータが **ThreadDynamicCodePolicy** の場合、このパラメータは **DWORD** を指す必要がある。
ThreadInformationSize : [int] *ThreadInformation* パラメータで指定された構造体のバイト単位のサイズ。*ThreadInformationClass* パラメータが **ThreadMemoryPriority** の場合、このパラメータは `sizeof(MEMORY_PRIORITY_INFORMATION)` でなければならない。*ThreadInformationClass* パラメータが **ThreadAbsoluteCpuPriority** の場合、このパラメータは `sizeof(LONG)` でなければならない。*ThreadInformationClass* パラメータが **ThreadDynamicCodePolicy** の場合、このパラメータは `sizeof(DWORD)` でなければならない。
%inst
指定したスレッドに関する情報を取得する。(GetThreadInformation)

[戻り値]
関数が成功した場合、戻り値は 0 以外。関数が失敗した場合、戻り値は 0。拡張エラー情報を取得するには
[GetLastError](/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror)
を呼ぶ。


%index
GetThreadLocale
呼び出し側スレッドの現在のロケールのロケール識別子を返す。注意 この関数は、たとえばカスタムロケールなどの理由でリリース間で変化するデータを取得できる。
%group
Win32 kernel32
%prm

%inst
呼び出し側スレッドの現在のロケールのロケール識別子を返す。注意
この関数は、たとえばカスタムロケールなどの理由でリリース間で変化するデータを取得できる。

[戻り値]
呼び出し側スレッドに関連付けられた現在のロケールのロケール識別子を返す。Windows Vista:
この関数はカスタムロケールの識別子を返すことができる。現在のスレッドロケールがカスタムロケールの場合、関数は
LOCALE_CUSTOM_DEFAULT を返す。現在のスレッドロケールが補助カスタムロケールの場合、関数は
LOCALE_CUSTOM_UNSPECIFIED を返すことがある。すべての補助ロケールはこのロケール識別子を共有する。

[備考]
アプリケーションプロセスが起動すると、ロケールの Standards and Formats 変数を使用する。詳細は NLS
Terminology を参照。プロセス内で新しいスレッドが作成されると、作成したスレッドのロケールを継承する。このロケールは既定の
Standards and Formats ロケール、または SetThreadLocale
の呼び出しで作成元スレッドに設定された別のロケールである。GetThreadLocale と SetThreadLocale
は新しいスレッドのロケールを変更するために使用できる。


%index
GetThreadPreferredUILanguages
現在のスレッドのスレッド優先 UI 言語を取得する。詳細は User Interface Language Management を参照。
%group
Win32 kernel32
%prm
dwFlags, pulNumLanguages, pwszLanguagesBuffer, pcchLanguagesBuffer
dwFlags : [int] 言語形式とフィルタリングを識別するフラグ。以下のフラグはスレッドの優先 UI 言語に使用する言語形式を指定する。フラグは相互排他的で、既定は MUI_LANGUAGE_NAME である。
pulNumLanguages : [var] pwszLanguagesBuffer に取得される言語の数へのポインタ。
pwszLanguagesBuffer : [int] 省略可能。dwFlags で指定された形式で、この関数が順序付けされた null 区切りのスレッド優先 UI 言語リストを取得するバッファへのポインタ。このリストは 2 つの null 文字で終わる。あるいは、このパラメータが NULL に設定され、pcchLanguagesBuffer が 0 に設定されている場合、関数は必要な言語バッファのサイズを pcchLanguagesBuffer に取得する。必要なサイズには 2 つの null 文字が含まれる。
pcchLanguagesBuffer : [var] pwszLanguagesBuffer が示す言語バッファのサイズ（文字数）へのポインタ。関数から正常に戻ったとき、このパラメータには取得された言語バッファのサイズが含まれる。あるいは、このパラメータが 0 に設定され、pwszLanguagesBuffer が NULL に設定されている場合、関数は必要な言語バッファのサイズを pcchLanguagesBuffer に取得する。
%inst
現在のスレッドのスレッド優先 UI 言語を取得する。詳細は User Interface Language Management を参照。

[戻り値]
成功した場合は TRUE、それ以外の場合は FALSE を返す。拡張エラー情報を取得するには、アプリケーションは GetLastError
を呼ぶ。これは以下のいずれかのエラーコードを返す。
（以下省略）

[備考]
アプリケーションで指定されたフラグに応じて、この関数はスレッドの優先 UI 言語、プロセスの優先 UI 言語、ユーザーの優先 UI
言語、システムの優先 UI 言語、システム既定 UI
言語からなる複合リストを取得できる。重複する言語に遭遇した場合、関数は最初の言語のみを取得する。アプリケーションが
SetThreadPreferredUILanguages を MUI_CONSOLE_FILTER または
MUI_COMPLEX_SCRIPT_FILTER フラグで呼び出していた場合、GetThreadPreferredUILanguages
は結果リスト内の言語をフィルタする。関数はコンソールが表示できない言語を代替言語に置き換える。言語の代替は、その言語の
LOCALE_SCONSOLEFALLBACKNAME の値から決定される。コンソールに関する詳細は
SetThreadUILanguage の説明を参照。MUI_LANGUAGE_NAME フラグは補助ロケールに対応する Language
Interface Pack (LIP) 言語をより適切に処理できるため、MUI_LANGUAGE_ID よりも
MUI_LANGUAGE_NAME の使用が推奨される。MUI_LANGUAGE_ID が指定されている場合、取得される言語文字列は先頭の
0x を含まない 16 進数の言語識別子で、長さは 4 文字となる。たとえば en-US は "0409" として、en は "0009"
として返される。アプリケーションが MUI_LANGUAGE_ID フラグを設定する場合、スレッドの優先 UI
言語は補助ロケールに対応する 1
つ以上の言語を含むことができる。関数から正常に戻ったとき、補助ロケールに対応する言語に対しては言語バッファに "1400"
が含まれる。このリストにはそのような言語は 1 つしか含めない。文字列 "1400" は LOCALE_CUSTOM_UI_DEFAULT
の 16 進数値に対応する。また、関数から正常に戻ったとき、補助ロケールに対応する他の言語に対しては
pwszLanguagesBuffer に "1000" が含まれる。文字列 "1000" は
LOCALE_CUSTOM_UNSPECIFIED の 16
進数値に対応する。これは補助ロケール間を区別できないため、いかなる関数の入力としても有用ではない。C# シグネチャ
（以下省略）


%index
GetThreadPriority
指定したスレッドの優先度値を取得する。この値は、スレッドのプロセスの優先度クラスと組み合わさって、スレッドの基本優先度レベルを決定する。
%group
Win32 kernel32
%prm
hThread
hThread : [intptr] スレッドのハンドル。ハンドルは THREAD_QUERY_INFORMATION または THREAD_QUERY_LIMITED_INFORMATION アクセス権を持つ必要がある。詳細は Thread Security and Access Rights を参照。Windows Server 2003: ハンドルは THREAD_QUERY_INFORMATION アクセス権を持つ必要がある。
%inst
指定したスレッドの優先度値を取得する。この値は、スレッドのプロセスの優先度クラスと組み合わさって、スレッドの基本優先度レベルを決定する。

[戻り値]
関数が成功した場合、戻り値はスレッドの優先度レベル。関数が失敗した場合、戻り値は
THREAD_PRIORITY_ERROR_RETURN。拡張エラー情報を取得するには GetLastError を呼ぶ。Windows
Phone 8.1: この関数は常に THREAD_PRIORITY_NORMAL
を返す。スレッドの優先度レベルは以下の値のいずれかである。
（以下省略）

[備考]

すべてのスレッドは、スレッドの優先度値とそのプロセスの優先度クラスによって決まる基本優先度レベルを持つ。オペレーティングシステムは、すべての実行可能スレッドの基本優先度レベルを使用して、次に
CPU
時間スライスを取得するスレッドを決定する。スレッドは各優先度レベルでラウンドロビン方式でスケジュールされ、より上位のレベルに実行可能スレッドがない場合にのみ、下位レベルのスレッドのスケジューリングが行われる。優先度クラスとスレッド優先度値の各組み合わせに対する基本優先度レベルを示す表は
SetPriorityClass 関数を参照。Windows 8.1 および Windows Server 2012 R2: この関数は
Windows ストアアプリでサポートされる。Windows Phone 8.1: Windows Phone
ストアアプリはこの関数を呼び出せるが効果はない。


%index
GetThreadPriorityBoost
指定したスレッドの優先度ブースト制御の状態を取得する。
%group
Win32 kernel32
%prm
hThread, pDisablePriorityBoost
hThread : [intptr] スレッドのハンドル。ハンドルは THREAD_QUERY_INFORMATION または THREAD_QUERY_LIMITED_INFORMATION アクセス権を持つ必要がある。詳細は Thread Security and Access Rights を参照。Windows Server 2003 および Windows XP: ハンドルは THREAD_QUERY_INFORMATION アクセス権を持つ必要がある。
pDisablePriorityBoost : [var] 優先度ブースト制御の状態を受け取る変数へのポインタ。TRUE の値は動的ブーストが無効であることを示す。FALSE の値は通常の動作を示す。
%inst
指定したスレッドの優先度ブースト制御の状態を取得する。

[戻り値]
関数が成功した場合、戻り値は 0 以外。その場合、pDisablePriorityBoost
パラメータが指す変数は優先度ブースト制御の状態を受け取る。関数が失敗した場合、戻り値は 0。拡張エラー情報を取得するには
GetLastError を呼ぶ。


%index
GetThreadSelectorEntry
指定したセレクタとスレッドに対するディスクリプタテーブルエントリを取得する。
%group
Win32 kernel32
%prm
hThread, dwSelector, lpSelectorEntry
hThread : [intptr] 指定したセレクタを含むスレッドのハンドル。ハンドルは THREAD_QUERY_INFORMATION アクセス権を持つ必要がある。詳細は Thread Security and Access Rights を参照。
dwSelector : [int] スレッドのディスクリプタテーブルで参照するグローバルまたはローカルセレクタ値。
lpSelectorEntry : [var] 指定したセレクタが指定したスレッドのディスクリプタテーブルにエントリを持つ場合、ディスクリプタテーブルエントリのコピーを受け取る LDT_ENTRY 構造体へのポインタ。この情報はセグメント相対アドレスを線形仮想アドレスに変換するために使用できる。
%inst
指定したセレクタとスレッドに対するディスクリプタテーブルエントリを取得する。

[戻り値]
関数が成功した場合、戻り値は 0 以外。その場合、lpSelectorEntry
パラメータが指す構造体は指定したディスクリプタテーブルエントリのコピーを受け取る。関数が失敗した場合、戻り値は
0。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
GetThreadSelectorEntry は x86 ベースのシステムでのみ機能する。x86 ベースでないシステムでは、関数は
FALSE を返す。デバッガはこの関数を使用してセグメント相対アドレスを線形仮想アドレスに変換する。ReadProcessMemory と
WriteProcessMemory 関数は線形仮想アドレスを使用する。


%index
GetThreadTimes
指定したスレッドのタイミング情報を取得する。
%group
Win32 kernel32
%prm
hThread, lpCreationTime, lpExitTime, lpKernelTime, lpUserTime
hThread : [intptr] タイミング情報を取得したいスレッドのハンドル。ハンドルは THREAD_QUERY_INFORMATION または THREAD_QUERY_LIMITED_INFORMATION アクセス権を持つ必要がある。詳細は Thread Security and Access Rights を参照。Windows Server 2003 および Windows XP: ハンドルは THREAD_QUERY_INFORMATION アクセス権を持つ必要がある。
lpCreationTime : [var] スレッドの作成時刻を受け取る FILETIME 構造体へのポインタ。
lpExitTime : [var] スレッドの終了時刻を受け取る FILETIME 構造体へのポインタ。スレッドが終了していない場合、この構造体の内容は未定義である。
lpKernelTime : [var] スレッドがカーネルモードで実行された時間を受け取る FILETIME 構造体へのポインタ。
lpUserTime : [var] スレッドがユーザーモードで実行された時間を受け取る FILETIME 構造体へのポインタ。
%inst
指定したスレッドのタイミング情報を取得する。

[戻り値]
関数が成功した場合、戻り値は 0 以外。関数が失敗した場合、戻り値は 0。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
すべての時刻は FILETIME データ構造体を使用して表される。このような構造体は、結合して 100 ナノ秒時間単位の 64
ビットカウントを形成する 2 つの 32 ビット値を含む。スレッドの作成および終了時刻は、1601 年 1 月 1 日午前 0
時（イギリス、グリニッジ）から経過した時間として表現された時点である。アプリケーションがこのような値をより一般的に有用な形式に変換するために使用できる関数がいくつかある。Time
Functions を参照。スレッドのカーネルモードおよびユーザーモード時間は時間量である。たとえば、スレッドがカーネルモードで 1
秒を費やした場合、この関数は lpKernelTime で指定された FILETIME 構造体を 64 ビット値の 1000
万で埋める。これは 1 秒間の 100 ナノ秒単位の数である。スレッドが使用した CPU
クロックサイクル数を取得するには、QueryThreadCycleTime 関数を使用する。


%index
GetThreadUILanguage
現在のスレッドの最初のユーザーインターフェイス言語の言語識別子を返す。
%group
Win32 kernel32
%prm

%inst
現在のスレッドの最初のユーザーインターフェイス言語の言語識別子を返す。

[戻り値]
SetThreadUILanguage または SetThreadPreferredUILanguages
によってスレッドに明示的に関連付けられた言語の識別子を返す。あるいは、現在のスレッドに言語が明示的に関連付けられていない場合、識別子はユーザーまたはシステムのユーザーインターフェイス言語を示すことがある。

[備考]
この関数を呼び出すことは、dwFlags を MUI_MERGE_SYSTEM_FALLBACK |
MUI_MERGE_USER_FALLBACK | MUI_LANGUAGE_ID に設定して
GetThreadPreferredUILanguages
を呼び出し、取得されたリストの最初の言語を使用することと同じである。この関数の戻り値は、Language Interface Pack
(LIP)
言語が補助ロケールに対応する場合、その言語に関する有用な情報を提供しない。そのような言語に対して、関数はその言語がユーザーの優先 UI
言語リストに指定されている場合、LOCALE_CUSTOM_UI_DEFAULT に対応する 16 進数値 "1400"
を返す。言語がユーザーの優先 UI 言語リストに指定されていない場合、関数は LOCALE_CUSTOM_UNSPECIFIED
に対応する値 "1000" を返す。C# シグネチャ
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
GetTimeFormatW
時刻を、識別子で指定したロケール用の時刻文字列としてフォーマットする。関数は指定された時刻またはローカルシステム時刻のいずれかをフォーマットする。(Unicode)
%group
Win32 kernel32
%prm
Locale, dwFlags, lpTime, lpFormat, lpTimeStr, cchTime
Locale : [int] ロケールを指定するロケール識別子。MAKELCID マクロを使用してロケール識別子を作成するか、以下の定義済み値のいずれかを使用できる。
dwFlags : [int] 時刻形式オプションを指定するフラグ。詳細な定義については GetTimeFormatEx の dwFlags パラメータを参照。
lpTime : [var] フォーマットする時刻情報を含む SYSTEMTIME 構造体へのポインタ。関数が現在のローカルシステム時刻を使用する場合、アプリケーションはこのパラメータを NULL に設定できる。
lpFormat : [wstr] 時刻文字列のフォーマットに使用する書式絵へのポインタ。アプリケーションがこのパラメータを NULL に設定すると、関数は指定されたロケールの時刻形式に従って文字列をフォーマットする。アプリケーションがパラメータを NULL に設定しない場合、関数は書式絵文字列で指定されていない情報（たとえばロケール固有の時刻マーカ）にのみロケールを使用する。書式絵文字列の詳細は備考セクションを参照。
lpTimeStr : [wstr] この関数がフォーマット済み時刻文字列を取得するバッファへのポインタ。
cchTime : [int] lpTimeStr が示す時刻文字列バッファのサイズ（TCHAR 単位）。あるいは、アプリケーションはこのパラメータを 0 に設定できる。その場合、関数は時刻文字列バッファに必要なサイズを返し、lpTimeStr パラメータを使用しない。
%inst

時刻を、識別子で指定したロケール用の時刻文字列としてフォーマットする。関数は指定された時刻またはローカルシステム時刻のいずれかをフォーマットする。(Unicode)

[戻り値]
lpTimeStr が示すバッファに取得された TCHAR 値の数を返す。cchTime パラメータが 0
に設定されている場合、関数はフォーマット済み時刻文字列を保持するために必要なバッファのサイズ（終端 null
文字を含む）を返す。成功しなかった場合、関数は 0 を返す。拡張エラー情報を取得するには、アプリケーションは GetLastError
を呼ぶ。これは以下のいずれかのエラーコードを返す。
（以下省略）

[備考]
GetTimeFormatEx の備考を参照。Unicode 専用ロケール識別子と共にこの関数の ANSI
版を使用する場合、オペレーティングシステムがシステムコードページを使用するため関数は成功し得る。ただし、システムコードページで未定義の文字は文字列内で疑問符
(?) として現れる。
Windows 8 以降: GetTimeFormat は Datetimeapi.h で宣言されている。Windows 8 以前は
Winnls.h で宣言されていた。
> [!NOTE] > datetimeapi.h ヘッダは GetTimeFormat を、UNICODE
プリプロセッサ定数の定義に基づいて ANSI または Unicode
版を自動選択するエイリアスとして定義する。エンコーディング中立なエイリアスとそうでないコードを混在させると、コンパイルや実行時のエラーを引き起こす不一致が生じうる。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
GetTimeFormatEx
時刻を、名前で指定したロケール用の時刻文字列としてフォーマットする。
%group
Win32 kernel32
%prm
lpLocaleName, dwFlags, lpTime, lpFormat, lpTimeStr, cchTime
lpLocaleName : [wstr] ロケール名へのポインタ、または以下の定義済み値のいずれか。
dwFlags : [int] 
lpTime : [var] フォーマットする時刻情報を含む SYSTEMTIME 構造体へのポインタ。関数が現在のローカルシステム時刻を使用する場合、アプリケーションはこのパラメータを NULL に設定できる。
lpFormat : [wstr] 時刻文字列のフォーマットに使用する書式絵へのポインタ。アプリケーションがこのパラメータを NULL に設定すると、関数は指定されたロケールの時刻形式に従って文字列をフォーマットする。アプリケーションがパラメータを NULL に設定しない場合、関数は書式絵文字列で指定されていない情報（たとえばロケール固有の時刻マーカ）にのみロケールを使用する。書式絵文字列の詳細は備考セクションを参照。
lpTimeStr : [wstr] この関数がフォーマット済み時刻文字列を取得するバッファへのポインタ。
cchTime : [int] lpTimeStr が示す時刻文字列バッファのサイズ（文字数）。あるいは、アプリケーションはこのパラメータを 0 に設定できる。その場合、関数は時刻文字列バッファに必要なサイズを返し、lpTimeStr パラメータを使用しない。
%inst
時刻を、名前で指定したロケール用の時刻文字列としてフォーマットする。

[戻り値]
lpTimeStr が示すバッファに取得された文字数を返す。cchTime パラメータが 0
に設定されている場合、関数はフォーマット済み時刻文字列を保持するために必要なバッファのサイズ（終端 null
文字を含む）を返す。成功しなかった場合、関数は 0 を返す。拡張エラー情報を取得するには、アプリケーションは GetLastError
を呼ぶ。これは以下のいずれかのエラーコードを返す。
（以下省略）

[備考]
時刻マーカが存在し、TIME_NOTIMEMARKER
フラグが設定されていない場合、関数は指定されたロケール識別子に基づいて時刻マーカをローカライズする。時刻マーカの例は英語（米国）の
"AM" と "PM" である。lpTime
が示す構造体内の時刻値は有効でなければならない。関数は各時刻値が適切な値の範囲内にあるかをチェックする。時刻値のいずれかが正しい範囲外の場合、関数は失敗し、最後のエラーを
ERROR_INVALID_PARAMETER に設定する。関数は SYSTEMTIME 構造体の日付メンバを無視する。これらには
wYear、wMonth、wDayOfWeek、wDay が含まれる。TIME_NOMINUTESORSECONDS または
TIME_NOSECONDS が指定されている場合、関数は分や秒メンバの後に続く区切り文字を削除する。TIME_NOTIMEMARKER
が指定されている場合、関数は時刻マーカの前後の区切り文字を削除する。TIME_FORCE24HOURFORMAT
が指定されている場合、TIME_NOTIMEMARKER
フラグも設定されていない限り、関数は既存の時刻マーカを表示する。関数はフォーマット済み時刻文字列の一部としてミリ秒を含めない。関数は不正な書式文字列に対してエラーを返さず、可能な限り最良の時刻文字列を形成するだけである。時、分、秒、または時刻マーカの書式絵が
2 つを超えて渡された場合、関数は既定で 2 つを使用する。たとえば、有効な時刻マーカ絵は "t" と "tt" のみである。"ttt"
が渡された場合、関数は "tt" と仮定する。実際のフォーマットを行わずに時刻形式を取得するには、アプリケーションは
LOCALE_STIMEFORMAT を指定して GetLocaleInfoEx
関数を使用する必要がある。アプリケーションは以下の要素を使用して書式絵文字列を構築できる。書式文字列内の要素を区切るためにスペースが使用されている場合、これらのスペースは出力文字列の同じ位置に現れる。文字は表示どおり大文字または小文字でなければならない。たとえば
"SS" ではなく "ss"。書式文字列内で単一引用符で囲まれた文字は、出力文字列内の同じ位置に変更されずに現れる。
（以下省略）


%index
GetTimeZoneInformation
現在のタイムゾーン設定を取得する。これらの設定は協定世界時 (UTC) とローカル時刻間の変換を制御する。
%group
Win32 kernel32
%prm
lpTimeZoneInformation
lpTimeZoneInformation : [var] 現在の設定を受け取る TIME_ZONE_INFORMATION 構造体へのポインタ。
%inst
現在のタイムゾーン設定を取得する。これらの設定は協定世界時 (UTC) とローカル時刻間の変換を制御する。

[戻り値]
関数が成功した場合、以下のいずれかの値を返す。
（以下省略）

[備考]
UTC 時刻とローカル時刻の間のすべての変換は次の式に基づく: UTC = ローカル時刻 + バイアス バイアスは UTC
時刻とローカル時刻の差（分単位）である。結果の TIME_ZONE_INFORMATION 構造体の StandardName と
DaylightName メンバは、現在のユーザー既定 UI 言語に従ってローカライズされる。


%index
GetTimeZoneInformationForYear
指定した年とタイムゾーンのタイムゾーン設定を取得する。これらの設定は協定世界時 (UTC) とローカル時刻間の変換を制御する。
%group
Win32 kernel32
%prm
wYear, pdtzi, ptzi
wYear : [int] タイムゾーン設定を取得する年。wYear パラメータはローカル時刻値でなければならない。
pdtzi : [var] タイムゾーンを指定する DYNAMIC_TIME_ZONE_INFORMATION 構造体へのポインタ。このパラメータを設定するには、必要なタイムゾーンのインデックスを指定して EnumDynamicTimeZoneInformation を呼ぶ。このパラメータが NULL の場合、現在のタイムゾーンが使用される。
ptzi : [var] タイムゾーン設定を受け取る TIME_ZONE_INFORMATION 構造体へのポインタ。
%inst
指定した年とタイムゾーンのタイムゾーン設定を取得する。これらの設定は協定世界時 (UTC) とローカル時刻間の変換を制御する。

[戻り値]
関数が成功した場合、戻り値は 0 以外。関数が失敗した場合、戻り値は 0。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
wYear パラメータはローカル時刻値とみなされる。ローカル時刻が古い年と新しい年の遷移（1 月 1 日
00:00:00）に近い場合、UTC の年を GetTimeZoneInformationForYear
関数に渡すと、関数は誤った年のタイムゾーン設定を返す可能性がある。結果の TIME_ZONE_INFORMATION 構造体の
StandardName と DaylightName メンバは、現在のユーザー既定 UI 言語に従ってローカライズされる。


%index
GetUILanguageInfo
インストールされた UI 言語に関するさまざまな情報を取得する。
%group
Win32 kernel32
%prm
dwFlags, pwmszLanguage, pwszFallbackLanguages, pcchFallbackLanguages, pAttributes
dwFlags : [int] 指定した言語の形式を定義するフラグ。フラグは相互排他的で、既定は MUI_LANGUAGE_NAME である。
pwmszLanguage : [int] 関数が情報を取得する言語へのポインタ。このパラメータは、フラグ設定に応じて、言語識別子または言語名の順序付けられた null 区切りリストを示す。このパラメータの使用については備考セクションを参照。
pwszFallbackLanguages : [int] dwFlags の設定で定義された形式で、この関数が順序付けされた null 区切りのフォールバック言語リストを取得するバッファへのポインタ。このリストは 2 つの null 文字で終わる。あるいは、このパラメータが NULL に設定され、pcchLanguagesBuffer が 0 に設定されている場合、関数は必要な言語バッファのサイズを pcchLanguagesBuffer に取得する。必要なサイズには 2 つの null 文字が含まれる。
pcchFallbackLanguages : [var] pwszFallbackLanguages が示す言語バッファのサイズ（文字数）へのポインタ。関数から正常に戻ったとき、このパラメータには取得された言語バッファのサイズが含まれる。あるいは、このパラメータが 0 に設定され、pwszLanguagesBuffer が NULL に設定されている場合、関数は必要な言語バッファのサイズを pcchLanguagesBuffer に取得する。
pAttributes : [var] 入力言語リストの属性を示すフラグへのポインタ。関数は常に最後にリストされている言語を特徴付けるフラグを取得する。
%inst
インストールされた UI 言語に関するさまざまな情報を取得する。

[戻り値]
成功した場合は TRUE、それ以外の場合は FALSE を返す。拡張エラー情報を取得するには、アプリケーションは GetLastError
を呼ぶ。これは以下のエラーコードを返すことがある。
（以下省略）

[備考]
MUI_LANGUAGE_NAME は、定義済みロケールに対応せず代わりに補助ロケールに対応する LIP
言語をより適切に処理できるため、MUI_LANGUAGE_ID よりも推奨される。定義済みロケールに対応する LIP 言語は LIP
でない言語と同じように処理される。MUI_LANGUAGE_ID フラグが指定されている場合、提供される言語文字列は先頭の 0x
を含まない 16 進数の言語識別子を使用し、長さは 4 文字でなければならない。たとえば en-US は "0409" として、en は
"0009" として渡されるべきである。返される言語文字列も同じ形式となる。MUI_LANGUAGE_ID が指定され、ユーザーの優先
UI 言語リストにそのような言語がある場合、リスト内にそのような言語は 1 つしか含めない。その言語は
LOCALE_CUSTOM_UI_DEFAULT の 16 進数値に対応する "1400" として pwmszLanguage
に指定できる。MUI_LANGUAGE_ID を使用して他のそのような言語を指定することはできない。pwmszLanguage
が示す文字列内で LOCALE_CUSTOM_UNSPECIFIED の 16 進数値に対応する "1000"
を使用すると、ERROR_INVALID_PARAMETER
コードになる。部分的にローカライズされた言語が部分的にローカライズされたフォールバック言語を持つことがあり、完全な情報を取得するには
GetUILanguageInfo を繰り返し呼び出す必要がある。3
つのフォールバック言語の選択肢を提供する部分的にローカライズされた言語 Lang1 のケースを考える。Lang3
フォールバック言語は部分的にローカライズされており、2
つのフォールバック言語の選択肢を提供する。依存関係は次のとおりで、既定のフォールバックが最初にリストされている。
（以下省略）


%index
GetUmsCompletionListEvent
指定したユーザーモードスケジューリング (UMS) 完了リストに関連付けられたイベントへのハンドルを取得する。
%group
Win32 kernel32
%prm
UmsCompletionList, UmsCompletionEvent
UmsCompletionList : [intptr] UMS 完了リストへのポインタ。CreateUmsCompletionList 関数がこのポインタを提供する。
UmsCompletionEvent : [intptr] HANDLE 変数へのポインタ。出力時、UmsCompletionEvent パラメータは指定した完了リストに関連付けられたイベントへのハンドルに設定される。
%inst
指定したユーザーモードスケジューリング (UMS) 完了リストに関連付けられたイベントへのハンドルを取得する。

[戻り値]
関数が成功した場合、0 以外の値を返す。関数が失敗した場合、戻り値は 0。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
システムは、空の完了リストにアイテムをキューする際に UMS
完了リストイベントをシグナル化する。完了リストイベントハンドルは、イベントへのハンドルを取る任意の待機関数で使用できる。イベントがシグナル化されると、アプリケーションは通常
DequeueUmsCompletionListItems
を呼び出して完了リストの内容を取得する。イベントハンドルは完了リストが削除されるまで有効である。削除された、または削除中の完了リストの待機にイベントハンドルを使用してはならない。ハンドルが不要になったら、CloseHandle
関数を使用してハンドルを閉じる。


%index
GetUmsSystemThreadInformation
指定したスレッドが UMS スケジューラスレッド、UMS ワーカースレッド、非 UMS スレッドのどれであるかをクエリする。
%group
Win32 kernel32
%prm
ThreadHandle, SystemThreadInfo
ThreadHandle : [intptr] スレッドのハンドル。スレッドハンドルは THREAD_QUERY_INFORMATION アクセス権を持つ必要がある。詳細は Thread Security and Access Rights を参照。
SystemThreadInfo : [var] クエリ対象のスレッドの種類を指定する初期化済み UMS_SYSTEM_THREAD_INFORMATION 構造体へのポインタ。
%inst
指定したスレッドが UMS スケジューラスレッド、UMS ワーカースレッド、非 UMS スレッドのどれであるかをクエリする。

[戻り値]
指定したスレッドが SystemThreadInfo パラメータで指定されたスレッドの種類と一致する場合、TRUE
を返す。それ以外の場合、関数は FALSE を返す。

[備考]
GetUmsSystemThreadInformation
関数は、デバッガ、トラブルシューティングツール、プロファイリングアプリケーションでの使用を意図している。たとえば、命令を 1
ステップ実行する、またはスレッドを分離してトレースするには、プロセス内の他のすべてのスレッドを中断する必要があるかもしれない。ただし、トレース対象のスレッドが
UMS ワーカースレッドである場合、UMS スケジューラスレッドを中断するとデッドロックが発生する可能性がある。これは、UMS
ワーカースレッドが実行するために UMS
スケジューラスレッドの介入を必要とするためである。デバッガは中断する可能性がある各スレッドに対して
GetUmsSystemThreadInformation
を呼び出してスレッドの種類を判定し、デバッグ中のコードに必要に応じて中断するかどうかを決定できる。


%index
GetUserDefaultGeoName
ユーザーの既定地理的位置の 2 文字の国際標準化機構 (ISO) 3166-1 コードまたは数値の国連 (UN) Series M, Number 49 (M.49) コードを取得する。
%group
Win32 kernel32
%prm
geoName, geoNameCount
geoName : [wstr] この関数がユーザーの既定地理的位置の null 終端された 2 文字の ISO 3166-1 または数値の UN M.49 コードを書き込むバッファへのポインタ。
geoNameCount : [int] geoName パラメータで指定したバッファのサイズ。この値が 0 の場合、関数は出力バッファにコピーする文字数を返すだけで、ユーザーの既定地理的位置の名前をバッファに書き込まない。
%inst
ユーザーの既定地理的位置の 2 文字の国際標準化機構 (ISO) 3166-1 コードまたは数値の国連 (UN) Series M,
Number 49 (M.49) コードを取得する。

[戻り値]
geoNameCount パラメータの値が 0 の場合、関数が出力バッファにコピーする文字数。それ以外の場合、関数が geoName
パラメータで指定されたバッファにコピーした文字数。0 は関数が失敗したことを示す。拡張エラー情報を取得するには GetLastError
を呼ぶ。これは以下のいずれかのエラーコードを返す。
（以下省略）

[備考]
2 文字の ISO 3166-1 コードの詳細は Country Codes - ISO 3166 を参照。数値の UN M.49
コードの詳細は Standard country or area codes for statistical use (M49) を参照。


%index
GetUserDefaultLCID
ユーザー既定ロケールのロケール識別子を返す。注意 ユーザー既定ロケールがカスタムロケールである場合、アプリケーションはその値で正確にデータをタグ付けしたり交換したりできない。
%group
Win32 kernel32
%prm

%inst
ユーザー既定ロケールのロケール識別子を返す。注意
ユーザー既定ロケールがカスタムロケールである場合、アプリケーションはその値で正確にデータをタグ付けしたり交換したりできない。

[戻り値]
LOCALE_USER_DEFAULT
として表されるユーザー既定ロケールのロケール識別子を返す。ユーザー既定ロケールがカスタムロケールである場合、選択されているカスタムロケールに関係なくこの関数は常に
LOCALE_CUSTOM_DEFAULT を返す。たとえば、ユーザーロケールがハワイ語 (US) haw-US でも、フィジー語
(Fiji) fj-FJ でも、関数は同じ値を返す。

[備考]

この関数はカスタムロケールからデータを取得できる。データはコンピュータ間やアプリケーションの実行間で同じであることは保証されない。アプリケーションがデータを永続化または送信する必要がある場合は、Using
Persistent Locale Data を参照。


%index
GetUserDefaultLangID
現在のユーザーの地域形式設定の言語識別子を返す。
%group
Win32 kernel32
%prm

%inst
現在のユーザーの地域形式設定の言語識別子を返す。

[戻り値]
コントロールパネル > 時計、言語、地域 > 日付、時刻、または数値形式の変更 > 形式タブ >
形式ドロップダウンで設定された現在のユーザーの言語識別子を返す。言語識別子の詳細は Language Identifier
Constants and Strings を参照。

[備考]
戻り値はシングルユーザーコンピュータでも GetSystemDefaultLangID が返すものと必ずしも同じではない。


%index
GetUserDefaultLocaleName
ユーザー既定ロケール名を取得する。注意 Windows Vista 以降のみで動作するように設計されているアプリケーションは、GetUserDefaultLCID よりもこの関数を優先して呼び出すべきである。
%group
Win32 kernel32
%prm
lpLocaleName, cchLocaleName
lpLocaleName : [wstr] この関数がロケール名を取得するバッファへのポインタ。
cchLocaleName : [int] lpLocaleName が示すバッファのサイズ（文字数）。終端 null 文字を含むロケール名の最大可能長は LOCALE_NAME_MAX_LENGTH である。これがこのパラメータに指定する推奨サイズである。
%inst
ユーザー既定ロケール名を取得する。注意 Windows Vista
以降のみで動作するように設計されているアプリケーションは、GetUserDefaultLCID
よりもこの関数を優先して呼び出すべきである。

[戻り値]
成功した場合、終端 null 文字を含むロケール名を含むバッファのサイズを返す。注意 シングルユーザーシステムでは、戻り値は
GetSystemDefaultLocaleName が返すものと同じである。
成功しなかった場合、関数は 0 を返す。拡張エラー情報を取得するには、アプリケーションは GetLastError
を呼ぶ。これは以下のいずれかのエラーコードを返す。
（以下省略）

[備考]

この関数はカスタムロケールからデータを取得できる。データはコンピュータ間やアプリケーションの実行間で同じであることは保証されない。アプリケーションがデータを永続化または送信する必要がある場合は、Using
Persistent Locale Data を参照。


%index
GetUserDefaultUILanguage
現在のユーザーのユーザー UI 言語の言語識別子を返す。
%group
Win32 kernel32
%prm

%inst
現在のユーザーのユーザー UI 言語の言語識別子を返す。

[戻り値]
現在のユーザーのユーザー UI 言語の言語識別子を返す。

[備考]
この関数は言語識別子のみを返す。アプリケーションは GetUserPreferredUILanguages
関数を使用して言語名を取得できる。ユーザー UI 言語が Language Interface Pack (LIP)
の一部であり、補助ロケールに対応する場合、この関数は LOCALE_CUSTOM_UI_DEFAULT を返す。Windows
Me、Windows 2000、Windows XP、Windows Server 2003:
GetUserDefaultUILanguage 関数は現在のユーザー言語の言語識別子を取得する。MUI
がオペレーティングシステムにインストールされていない場合、関数は既定のコンピュータユーザーインターフェイス言語を取得する。C# シグネチャ
（以下省略）


%index
GetUserGeoID
ユーザーの地理的位置に関する情報を取得する。詳細は Table of Geographical Locations を参照。
%group
Win32 kernel32
%prm
GeoClass
GeoClass : [int] 返す地理的位置クラス。可能な値は SYSGEOCLASS 列挙型で定義される。
%inst
ユーザーの地理的位置に関する情報を取得する。詳細は Table of Geographical Locations を参照。

[戻り値]
識別子を設定するために以前に SetUserGeoID
が呼び出されていた場合、ユーザーの地理的位置識別子を返す。ユーザーに地理的位置識別子が設定されていない場合、関数は
GEOID_NOT_AVAILABLE を返す。


%index
GetUserPreferredUILanguages
ユーザーの優先 UI 言語に関する情報を取得する。詳細は User Interface Language Management を参照。
%group
Win32 kernel32
%prm
dwFlags, pulNumLanguages, pwszLanguagesBuffer, pcchLanguagesBuffer
dwFlags : [int] 言語形式とフィルタリングを識別するフラグ。以下のフラグは表示言語リストに使用する言語形式を指定する。フラグは相互排他的で、既定は MUI_LANGUAGE_NAME である。 | 値 | 意味 | | --- | --- | | **MUI_LANGUAGE_ID** | 言語文字列を [言語識別子](/windows/desktop/Intl/language-identifiers) で取得する | | **MUI_LANGUAGE_NAME** | 言語文字列を [言語名](/windows/desktop/Intl/language-names) 形式で取得する。 |
pulNumLanguages : [var] *pwszLanguagesBuffer* に取得される言語の数へのポインタ。
pwszLanguagesBuffer : [int] 省略可能。*dwflags* で指定された形式で、この関数が順序付けされた null 区切りの表示言語リストを取得するバッファへのポインタ。このリストは 2 つの null 文字で終わる。あるいは、このパラメータが **NULL** に設定され、*pcchLanguagesBuffer* が 0 に設定されている場合、関数は必要な言語バッファのサイズを *pcchLanguagesBuffer* に取得する。必要なサイズには 2 つの null 文字が含まれる。
pcchLanguagesBuffer : [var] *pwszLanguagesBuffer* が示す言語バッファのサイズ（文字数）へのポインタ。関数から正常に戻ったとき、このパラメータには取得された言語バッファのサイズが含まれる。あるいは、このパラメータが 0 に設定され、*pwszLanguagesBuffer* が **NULL** に設定されている場合、関数は必要な言語バッファのサイズを *pcchLanguagesBuffer* に取得する。
%inst
ユーザーの優先 UI 言語に関する情報を取得する。詳細は User Interface Language Management を参照。

[戻り値]
成功した場合は **TRUE**、それ以外の場合は **FALSE** を返す。拡張エラー情報を取得するには、アプリケーションは
[GetLastError
関数](../errhandlingapi/nf-errhandlingapi-getlasterror.md)
を呼ぶ。これは以下のいずれかのエラーコードを返す: -
ERROR_INSUFFICIENT_BUFFER。提供されたバッファサイズが十分でなかった、または誤って **NULL**
に設定された。それ以外の理由で関数が失敗した場合、*pulNumLanguages* と *pcchLanguagesBuffer*
の値は未定義である。

[備考]
MUI_LANGUAGE_ID が指定されている場合、取得される言語文字列は先頭の 0x を含まない 16 進数の言語識別子で、長さは 4
文字となる。たとえば en-US は "0409" として、en は "0009"
として返される。表示言語は、[補助ロケール](/windows/desktop/Intl/custom-locales) に対応する
Language Interface Pack (LIP) 言語を 1
つを超えて含むことはできない。リストにこれらの言語が複数含まれており、アプリケーションが関数の呼び出しで MUI_LANGUAGE_ID
を指定した場合、その言語に対して言語バッファには "1400" が含まれる。この文字列は
[LOCALE_CUSTOM_UI_DEFAULT](/windows/desktop/Intl/locale-custom-constants)
の 16 進数値に対応する。この関数で取得される言語リストは以下の特徴を持つ: - 各言語は有効な NLS ロケールを表す。 -
各言語はオペレーティングシステムにインストールされている。 - リストには言語ごとに 1 つのエントリがあり、重複エントリはない。 -
リストが空、またはこれらの検証基準を満たさない場合、システムの優先 UI 言語リストが代わりに使用される。


%index
GetVersion
Windows 8.1 のリリースに伴い、GetVersion API の動作はオペレーティングシステムバージョンの返り値において変更された。GetVersion 関数が返す値は、アプリケーションのマニフェスト方法に依存する。
%group
Win32 kernel32
%prm

%inst
Windows 8.1 のリリースに伴い、GetVersion API
の動作はオペレーティングシステムバージョンの返り値において変更された。GetVersion
関数が返す値は、アプリケーションのマニフェスト方法に依存する。

[戻り値]

関数が成功した場合、戻り値はオペレーティングシステムのメジャーバージョン番号とマイナーバージョン番号を下位ワードに、オペレーティングシステムのプラットフォーム情報を上位ワードに含む。すべてのプラットフォームで、下位ワードはオペレーティングシステムのバージョン番号を含む。このワードの下位バイトは
16 進表記でメジャーバージョン番号を指定する。上位バイトは 16 進表記でマイナーバージョン（リビジョン）番号を指定する。上位ビットは
0、次の 7 ビットはビルド番号を表し、下位バイトは 5 である。

[備考]
GetVersionEx 関数は、GetVersion が返すパックされた DWORD
値を調べる際にメジャーとマイナーバージョン番号を入れ替える既存のアプリケーションが多くあったため開発された。GetVersionEx
はアプリケーションにバージョン情報の各要素を明示的に調べることを強制する。VerifyVersionInfo
は、必要なシステムバージョンを現在のシステムバージョンと比較することで、エラーの可能性をさらに排除する。


%index
GetVersionExW
Windows 8.1 のリリースに伴い、GetVersionEx API の動作はオペレーティングシステムバージョンの返り値において変更された。GetVersionEx 関数が返す値は、アプリケーションのマニフェスト方法に依存する。(Unicode)
%group
Win32 kernel32
%prm
lpVersionInformation
lpVersionInformation : [var] オペレーティングシステム情報を受け取る OSVERSIONINFO または OSVERSIONINFOEX 構造体。
%inst
Windows 8.1 のリリースに伴い、GetVersionEx API
の動作はオペレーティングシステムバージョンの返り値において変更された。GetVersionEx
関数が返す値は、アプリケーションのマニフェスト方法に依存する。(Unicode)

[戻り値]
関数が成功した場合、戻り値は 0 以外の値。関数が失敗した場合、戻り値は 0。拡張エラー情報を取得するには GetLastError
を呼ぶ。OSVERSIONINFO または OSVERSIONINFOEX 構造体の dwOSVersionInfoSize
メンバに無効な値を指定した場合、関数は失敗する。

[備考]

現在のオペレーティングシステムを識別することは通常、特定のオペレーティングシステム機能が存在するかどうかを判定する最良の方法ではない。これは、再配布可能な
DLL によってオペレーティングシステムに新機能が追加されている可能性があるためである。GetVersionEx
を使用してオペレーティングシステムプラットフォームやバージョン番号を判定するのではなく、機能自体の存在をテストする。詳細は
Operating System Version を参照。GetSystemMetrics
関数は現在のオペレーティングシステムに関する追加情報を提供する。
（以下省略）


%index
GetVolumeInformationW
指定したルートディレクトリに関連付けられたファイルシステムとボリュームに関する情報を取得する。(Unicode)
%group
Win32 kernel32
%prm
lpRootPathName, lpVolumeNameBuffer, nVolumeNameSize, lpVolumeSerialNumber, lpMaximumComponentLength, lpFileSystemFlags, lpFileSystemNameBuffer, nFileSystemNameSize
lpRootPathName : [wstr] 記述するボリュームのルートディレクトリを含む文字列へのポインタ。このパラメータが NULL の場合、現在のディレクトリのルートが使用される。末尾のバックスラッシュが必要である。たとえば、\\\\MyServer\\MyShare は "\\\\MyServer\\MyShare\\" として、C ドライブは "C:\\" として指定する。
lpVolumeNameBuffer : [wstr] 指定したボリュームの名前を受け取るバッファへのポインタ。バッファサイズは nVolumeNameSize パラメータで指定する。
nVolumeNameSize : [int] ボリューム名バッファの長さ（TCHAR 単位）。最大バッファサイズは MAX_PATH+1。ボリューム名バッファが提供されていない場合、このパラメータは無視される。
lpVolumeSerialNumber : [var] ボリュームシリアル番号を受け取る変数へのポインタ。シリアル番号が不要な場合、このパラメータは NULL でよい。この関数は、ハードディスクがフォーマットされたときにオペレーティングシステムが割り当てるボリュームシリアル番号を返す。製造元が割り当てるハードディスクのシリアル番号をプログラムで取得するには、Windows Management Instrumentation (WMI) Win32_PhysicalMedia プロパティ SerialNumber を使用する。
lpMaximumComponentLength : [var] 指定したファイルシステムがサポートするファイル名コンポーネントの最大長（TCHAR 単位）を受け取る変数へのポインタ。ファイル名コンポーネントとは、ファイル名のバックスラッシュ間の部分である。*lpMaximumComponentLength が指す変数に格納される値は、指定したファイルシステムが長い名前をサポートすることを示すために使用される。たとえば、長い名前をサポートする FAT ファイルシステムでは、関数は以前の 8.3 インジケータではなく 255 を格納する。長い名前は NTFS ファイルシステムを使用するシステムでもサポートできる。
lpFileSystemFlags : [var] 指定したファイルシステムに関連付けられたフラグを受け取る変数へのポインタ。このパラメータは以下のフラグの 1 つ以上を含むことができる。ただし、FILE_FILE_COMPRESSION と FILE_VOL_IS_COMPRESSED は相互排他的である。
lpFileSystemNameBuffer : [wstr] ファイルシステムの名前を受け取るバッファへのポインタ。たとえば FAT ファイルシステムまたは NTFS ファイルシステム。バッファサイズは nFileSystemNameSize パラメータで指定する。
nFileSystemNameSize : [int] ファイルシステム名バッファの長さ（TCHAR 単位）。最大バッファサイズは MAX_PATH+1。ファイルシステム名バッファが提供されていない場合、このパラメータは無視される。
%inst
指定したルートディレクトリに関連付けられたファイルシステムとボリュームに関する情報を取得する。(Unicode)

[戻り値]
要求されたすべての情報が取得された場合、戻り値は 0 以外。要求されたすべての情報が取得されなかった場合、戻り値は
0。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
ユーザーがフロッピーディスクが入っていないフロッピードライブやコンパクトディスクが入っていない CD-ROM
ドライブに関する情報を取得しようとすると、システムはユーザーにフロッピーディスクまたはコンパクトディスクをそれぞれ挿入するよう求めるメッセージボックスを表示する。システムにこのメッセージボックスを表示させないようにするには、SEM_FAILCRITICALERRORS
を指定して SetErrorMode 関数を呼ぶ。FILE_VOL_IS_COMPRESSED
フラグはボリュームベースの圧縮の唯一のインジケータである。圧縮を示すためにファイルシステム名は変更されない。たとえば、このフラグは
DoubleSpace
ボリューム上で設定されて返される。圧縮がボリュームベースの場合、ボリューム全体が圧縮されるかされないかとなる。FILE_FILE_COMPRESSION
フラグは、ファイルシステムがファイルベースの圧縮をサポートするかどうかを示す。圧縮がファイルベースの場合、個々のファイルが圧縮されたりされなかったりする。FILE_FILE_COMPRESSION
と FILE_VOL_IS_COMPRESSED
フラグは相互排他的である。両方のビットが設定されて返されることはない。lpMaximumComponentLength
に格納される最大コンポーネント長値は、ボリュームが通常の FAT
ファイルシステム（または他のファイルシステム）のファイル名より長いものをサポートすることを示す唯一のインジケータである。長いファイル名のサポートを示すためにファイルシステム名は変更されない。GetCompressedFileSize
関数はファイルの圧縮サイズを取得する。GetFileAttributes
関数は個々のファイルが圧縮されているかを判定できる。シンボリックリンクの動作?
パスがシンボリックリンクを指す場合、関数はターゲットのボリューム情報を返す。Windows 8 および Windows Server
2012 以降、この関数は以下の技術によりサポートされる。
（以下省略）


%index
GetVolumeInformationByHandleW
指定したファイルに関連付けられたファイルシステムとボリュームに関する情報を取得する。
%group
Win32 kernel32
%prm
hFile, lpVolumeNameBuffer, nVolumeNameSize, lpVolumeSerialNumber, lpMaximumComponentLength, lpFileSystemFlags, lpFileSystemNameBuffer, nFileSystemNameSize
hFile : [intptr] ファイルのハンドル。
lpVolumeNameBuffer : [wstr] 指定したボリュームの名前を受け取るバッファへのポインタ。最大バッファサイズは `MAX_PATH+1`。
nVolumeNameSize : [int] ボリューム名バッファの長さ（**WCHAR** 単位）。最大バッファサイズは `MAX_PATH+1`。ボリューム名バッファが提供されていない場合、このパラメータは無視される。
lpVolumeSerialNumber : [var] ボリュームシリアル番号を受け取る変数へのポインタ。シリアル番号が不要な場合、このパラメータは **NULL** でよい。この関数は、ハードディスクがフォーマットされたときにオペレーティングシステムが割り当てるボリュームシリアル番号を返す。製造元が割り当てるハードディスクのシリアル番号をプログラムで取得するには、Windows Management Instrumentation (WMI) [Win32_PhysicalMedia](/previous-versions/windows/desktop/cimwin32a/win32-physicalmedia) プロパティ **SerialNumber** を使用する。
lpMaximumComponentLength : [var] 指定したファイルシステムがサポートするファイル名コンポーネントの最大長（**WCHAR** 単位）を受け取る変数へのポインタ。ファイル名コンポーネントとは、ファイル名のバックスラッシュ間の部分である。*_lpMaximumComponentLength_ が指す変数に格納される値は、指定したファイルシステムが長い名前をサポートすることを示すために使用される。たとえば、長い名前をサポートする FAT ファイルシステムでは、関数は以前の 8.3 インジケータではなく 255 を格納する。長い名前は NTFS ファイルシステムを使用するシステムでもサポートできる。
lpFileSystemFlags : [var] 指定したファイルシステムに関連付けられたフラグを受け取る変数へのポインタ。このパラメータは以下のフラグの 1 つ以上を含むことができる。ただし、**FILE_FILE_COMPRESSION** と **FILE_VOL_IS_COMPRESSED** は相互排他的である。
lpFileSystemNameBuffer : [wstr] ファイルシステムの名前を受け取るバッファへのポインタ。たとえば FAT ファイルシステムまたは NTFS ファイルシステム。バッファサイズは _nFileSystemNameSize_ パラメータで指定する。
nFileSystemNameSize : [int] ファイルシステム名バッファの長さ（**WCHAR** 単位）。最大バッファサイズは `MAX_PATH+1`。ファイルシステム名バッファが提供されていない場合、このパラメータは無視される。
%inst
指定したファイルに関連付けられたファイルシステムとボリュームに関する情報を取得する。

[戻り値]
要求されたすべての情報が取得された場合、戻り値は 0 以外。要求されたすべての情報が取得されなかった場合、戻り値は
0。拡張エラー情報を取得するには
[GetLastError](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror)
を呼ぶ。

[備考]
Windows 8 および Windows Server 2012 では、この関数は以下の技術によりサポートされる。 | 技術 |
サポート | |--------|--------| | Server Message Block (SMB) 3.0 protocol
| No | | SMB 3.0 Transparent Failover (TFO) | No | | SMB 3.0 with
Scale-out File Shares (SO) | No | | Cluster Shared Volume File System
(CsvFS) | Yes | | Resilient File System (ReFS) | Yes | SMB
はボリューム管理関数をサポートしない。


%index
GetVolumeNameForVolumeMountPointW
指定したボリュームマウントポイント（ドライブレター、ボリューム GUID パス、またはマウントされたフォルダ）に関連付けられたボリュームのボリューム GUID パスを取得する。(GetVolumeNameForVolumeMountPointW)
%group
Win32 kernel32
%prm
lpszVolumeMountPoint, lpszVolumeName, cchBufferLength
lpszVolumeMountPoint : [wstr] マウントされたフォルダのパス（たとえば "Y:\MountX\\"）またはドライブレター（たとえば "X:\\"）を含む文字列へのポインタ。文字列は末尾のバックスラッシュ ('\\') で終わる必要がある。
lpszVolumeName : [wstr] ボリューム GUID パスを受け取る文字列へのポインタ。このパスは "\\\\?\Volume{GUID}\\" の形式である。GUID はボリュームを識別する GUID である。ボリュームに複数のボリューム GUID パスがある場合、マウントマネージャのキャッシュ内の最初のもののみが返される。
cchBufferLength : [int] 出力バッファの長さ（TCHAR 単位）。最大のボリューム GUID パスを収容するバッファの妥当なサイズは 50 文字である。
%inst
指定したボリュームマウントポイント（ドライブレター、ボリューム GUID
パス、またはマウントされたフォルダ）に関連付けられたボリュームのボリューム GUID
パスを取得する。(GetVolumeNameForVolumeMountPointW)

[戻り値]
関数が成功した場合、戻り値は 0 以外。関数が失敗した場合、戻り値は 0。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
GetVolumeNameForVolumeMountPoint を使用して、ボリューム GUID パスを入力パラメータとして必要とする
SetVolumeMountPoint や FindFirstVolumeMountPoint などの関数で使用するボリューム GUID
パスを取得する。ボリューム GUID パスの詳細は Naming A Volume を参照。Windows 8 および Windows
Server 2012 では、この関数は以下の技術によりサポートされる。
（以下省略）


%index
GetVolumePathNameW
指定したパスがマウントされているボリュームマウントポイントを取得する。(GetVolumePathNameW)
%group
Win32 kernel32
%prm
lpszFileName, lpszVolumePathName, cchBufferLength
lpszFileName : [wstr] 入力パス文字列へのポインタ。絶対および相対のファイル・ディレクトリ名（たとえば ".."）はこのパスで受け入れられる。ボリューム修飾子なしで相対ディレクトリまたはファイル名を指定した場合、**GetVolumePathName** はブートボリュームのドライブレターを返す。このパラメータが空文字列 "" の場合、関数は失敗するが最後のエラーは **ERROR_SUCCESS** に設定される。
lpszVolumePathName : [wstr] 入力パスのボリュームマウントポイントを受け取る文字列へのポインタ。
cchBufferLength : [int] 出力バッファの長さ（**TCHAR** 単位）。
%inst
指定したパスがマウントされているボリュームマウントポイントを取得する。(GetVolumePathNameW)

[戻り値]
関数が成功した場合、戻り値は 0 以外。関数が失敗した場合、戻り値は 0。拡張エラー情報を取得するには
[GetLastError](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror)
を呼ぶ。

[備考]
指定されたパスが渡されると、**GetVolumePathName**
はボリュームマウントポイントへのパスを返す。これは、指定されたパスのエンドポイントが位置するボリュームのルートを返すことを意味する。たとえば、ボリューム
D が `C:\Mnt\Ddrive` にマウントされ、ボリューム E が `C:\Mnt\Ddrive\Mnt\Edrive`
にマウントされていると仮定する。さらに、`E:\Dir\Subdir\MyFile`
というパスのファイルがあると仮定する。`C:\Mnt\Ddrive\Mnt\Edrive\Dir\Subdir\MyFile` を
**GetVolumePathName** に渡すと、`C:\Mnt\Ddrive\Mnt\Edrive\`
というパスを返す。ボリューム修飾子なしで相対ディレクトリまたはファイルが渡された場合、関数はブートボリュームのドライブレターを返す。有効なボリューム修飾子なしで無効なファイルまたはディレクトリ名が指定された場合も、ブートボリュームのドライブレターが返される。有効なボリューム指定子が与えられ、ボリュームが存在するが無効なファイルまたはディレクトリ名が指定された場合、関数は成功し、そのボリューム名が返される。例については、このトピックの例セクションを参照。有効な
Win32 名前空間パスを指定する必要がある。NT 名前空間パス（たとえば `\DosDevices\H:` や
`\Device\HardDiskVolume6`）を指定した場合、関数はその NT
名前空間パスのドライブレターではなく、ブートボリュームのドライブレターを返す。パス名と名前空間の詳細は [Naming Files,
Paths, and Namespaces](/windows/win32/FileIO/naming-a-file)
を参照。ローカルとリモートの両方のパスを指定できる。ローカルパスを指定した場合、**GetVolumePathName**
はプレフィックスがボリュームを表す最も長いプレフィックスであるフルパスを返す。ネットワーク共有が指定された場合、**GetVolumePathName**
は [GetDriveType](/windows/win32/api/fileapi/nf-fileapi-getdrivetypea)
が **DRIVE_REMOTE**
を返す最短のパスを返す。これは、パスが現在のユーザーがアクセス可能な存在するリモートドライブとして検証されたことを意味する。末尾のバックスラッシュを返さない特殊なケースがいくつかある。これは、出力バッファ長が
1 文字短い場合に発生する。たとえば、_lpszFileName_ が `C:` で _lpszVolumePathName_ が 4
文字長の場合、返される値は `C:\` であるが、_lpszVolumePathName_ が 3 文字長の場合、返される値は `C:`
である。戻りバッファのサイズを設定するより安全だが遅い方法は、[GetFullPathName](/windows/win32/api/fileapi/nf-fileapi-getfullpathnamea)
関数を呼び出し、バッファサイズが **GetFullPathName**
が返すフルパスと少なくとも同じサイズであることを確認することである。出力バッファが 1
文字を超えて短い場合、関数は失敗してエラーを返す。Windows 8 および Windows Server 2012
では、この関数は以下の技術によりサポートされる。 技術 | サポート -----------|---------- Server
Message Block (SMB) 3.0 protocol|No SMB 3.0 Transparent Failover
(TFO)|No SMB 3.0 with Scale-out File Shares (SO)|No Cluster Shared
Volume File System (CsvFS)|Yes Resilient File System (ReFS)|Yes SMB
はボリューム管理関数をサポートしない。


%index
GetVolumePathNamesForVolumeNameW
指定したボリュームに対するドライブレターとマウントされたフォルダパスのリストを取得する。(GetVolumePathNamesForVolumeNameW)
%group
Win32 kernel32
%prm
lpszVolumeName, lpszVolumePathNames, cchBufferLength, lpcchReturnLength
lpszVolumeName : [wstr] ボリュームのボリューム GUID パス。ボリューム GUID パスは "\\\\?\\Volume{xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx}\\" の形式である。
lpszVolumePathNames : [int] ドライブレターとマウントされたフォルダパスのリストを受け取るバッファへのポインタ。リストは追加の NULL 文字で終了する null 終端文字列の配列である。バッファが完全なリストを保持するのに十分な大きさでない場合、バッファはリストのできるだけ多くを保持する。
cchBufferLength : [int] lpszVolumePathNames バッファの長さ（TCHAR 単位）で、すべての NULL 文字を含む。
lpcchReturnLength : [var] 呼び出しが成功した場合、このパラメータは lpszVolumePathNames バッファにコピーされた TCHAR の数。それ以外の場合、このパラメータは完全なリストを保持するために必要なバッファのサイズ（TCHAR 単位）。
%inst

指定したボリュームに対するドライブレターとマウントされたフォルダパスのリストを取得する。(GetVolumePathNamesForVolumeNameW)

[戻り値]
関数が成功した場合、戻り値は 0 以外。関数が失敗した場合、戻り値は 0。拡張エラー情報を取得するには GetLastError
を呼ぶ。バッファが完全なリストを保持するのに十分な大きさでない場合、エラーコードは ERROR_MORE_DATA
となり、lpcchReturnLength パラメータは必要なバッファサイズを受け取る。

[備考]
Windows 8 および Windows Server 2012 では、この関数は以下の技術によりサポートされる。
（以下省略）


%index
GetWindowsDirectoryW
Windows ディレクトリのパスを取得する。(Unicode)
%group
Win32 kernel32
%prm
lpBuffer, uSize
lpBuffer : [wstr] パスを受け取るバッファへのポインタ。Windows ディレクトリがルートディレクトリでない限り、このパスはバックスラッシュで終わらない。たとえば、Windows ディレクトリが C ドライブ上の Windows という名前である場合、この関数で取得される Windows ディレクトリのパスは C:\Windows となる。システムが C ドライブのルートディレクトリにインストールされている場合、取得されるパスは C:\ となる。
uSize : [int] lpBuffer パラメータで指定したバッファの最大サイズ（TCHAR 単位）。この値は MAX_PATH に設定すべきである。
%inst
Windows ディレクトリのパスを取得する。(Unicode)

[戻り値]
関数が成功した場合、戻り値はバッファにコピーされた文字列の長さ（TCHAR 単位）で、終端 null 文字を含まない。
長さがバッファのサイズより大きい場合、戻り値はパスを保持するために必要なバッファのサイズである。
関数が失敗した場合、戻り値は 0。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
Windows
ディレクトリは、一部のレガシーアプリケーションが初期化ファイルやヘルプファイルを格納するディレクトリである。新しいアプリケーションは
Windows
ディレクトリにファイルを格納すべきではなく、代わりにシステム全体のデータをアプリケーションのインストールディレクトリに、ユーザー固有のデータをユーザーのプロファイルに格納すべきである。ユーザーが共有版のシステムを実行している場合、Windows
ディレクトリは各ユーザーで非公開であることが保証される。
アプリケーションがユーザーごとに格納したい他のファイルを作成する場合、HOMEPATH
環境変数で指定されたディレクトリに配置すべきである。このディレクトリは、管理者がユーザーマネージャ管理ツールを介して指定した場合、各ユーザーで異なる。HOMEPATH
は常に、各ユーザーで非公開であることが保証されるユーザーのホームディレクトリ、または既定のディレクトリ（たとえば
C:\USERS\DEFAULT、ユーザーがすべてのアクセス権を持つ）のいずれかを指定する。
ターミナルサービス: アプリケーションがターミナルサービス環境で実行されている場合、各ユーザーは非公開の Windows
ディレクトリを持つ。システム用の共有 Windows ディレクトリも存在する。アプリケーションがターミナルサービス対応（イメージヘッダで
IMAGE_DLLCHARACTERISTICS_TERMINAL_SERVER_AWARE フラグが設定されている）の場合、この関数は
GetSystemWindowsDirectory 関数と同様にシステム Windows
ディレクトリのパスを返す。それ以外の場合、ユーザーの非公開 Windows ディレクトリのパスを取得する。


%index
GetWriteWatch
仮想メモリ領域内で書き込まれたページのアドレスを取得する。
%group
Win32 kernel32
%prm
dwFlags, lpBaseAddress, dwRegionSize, lpAddresses, lpdwCount, lpdwGranularity
dwFlags : [int] 関数が書き込み追跡状態をリセットするかどうかを示す。書き込み追跡状態をリセットするには、このパラメータを WRITE_WATCH_FLAG_RESET に設定する。このパラメータが 0 の場合、GetWriteWatch は書き込み追跡状態をリセットしない。詳細はこのトピックの備考セクションを参照。
lpBaseAddress : [intptr] 書き込み追跡情報を取得するメモリ領域のベースアドレス。このアドレスは、MEM_WRITE_WATCH を使用して VirtualAlloc 関数で確保されたメモリ領域内になければならない。
dwRegionSize : [int] 書き込み追跡情報を取得するメモリ領域のサイズ（バイト単位）。
lpAddresses : [var] メモリ領域内のページアドレスの配列を受け取るバッファへのポインタ。アドレスは、領域が確保されてから、または書き込み追跡状態がリセットされてから書き込まれたページを示す。
lpdwCount : [var] 入力時、この変数は lpAddresses 配列のサイズ（配列要素単位）を示す。出力時、変数は配列に返されたページアドレスの数を受け取る。
lpdwGranularity : [var] ページサイズ（バイト単位）を受け取る変数へのポインタ。
%inst
仮想メモリ領域内で書き込まれたページのアドレスを取得する。

[戻り値]
関数が成功した場合、戻り値は 0。関数が失敗した場合、戻り値は 0 以外の値。

[備考]
VirtualAlloc 関数を呼び出してメモリを予約またはコミットする際に MEM_WRITE_WATCH
を指定できる。この値はシステムにコミットされたメモリ領域内で書き込まれたページを追跡させる。GetWriteWatch
関数を呼び出して、領域が確保されてから、または書き込み追跡状態がリセットされてから書き込まれたページのアドレスを取得できる。書き込み追跡状態をリセットするには、dwFlags
パラメータに WRITE_WATCH_FLAG_RESET 値を設定する。あるいは、ResetWriteWatch
関数を呼び出して書き込み追跡状態をリセットできる。ただし、ResetWriteWatch を使用する場合、GetWriteWatch と
ResetWriteWatch
呼び出しの間にスレッドが領域に書き込まないようにする必要がある。そうしないと、検出されない書き込まれたページが存在する可能性がある。GetWriteWatch
関数はプロファイラ、デバッグツール、ガベージコレクタにとって有用である。


%index
GlobalAddAtomW
グローバルアトムテーブルに文字列を追加し、その文字列を識別する一意の値（アトム）を返す。(GlobalAddAtomW)
%group
Win32 kernel32
%prm
lpString
lpString : [wstr] 型: LPCTSTR 追加する null 終端文字列。文字列は最大 255 バイトのサイズを持つことができる。大文字小文字のみが異なる文字列は同一とみなされる。この名前で最初にテーブルに追加された文字列の大文字小文字が保持され、GlobalGetAtomName 関数によって返される。あるいは、MAKEINTATOM マクロを使用して変換した整数アトムを使用することもできる。詳細は備考を参照。
%inst
グローバルアトムテーブルに文字列を追加し、その文字列を識別する一意の値（アトム）を返す。(GlobalAddAtomW)

[戻り値]
型: ATOM 関数が成功した場合、戻り値は新しく作成されたアトム。関数が失敗した場合、戻り値は 0。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]

文字列が既にグローバルアトムテーブルに存在する場合、既存の文字列のアトムが返され、そのアトムの参照カウントが増分される。アトムに関連付けられた文字列は、参照カウントが
0 になるまでメモリから削除されない。詳細は GlobalDeleteAtom
関数を参照。グローバルアトムはアプリケーション終了時に自動的に削除されない。GlobalAddAtom 関数を呼び出すたびに、対応する
GlobalDeleteAtom 関数の呼び出しが必要である。lpString パラメータが "#1234"
の形式の場合、GlobalAddAtom は文字列で指定された 10 進数の 16 ビット表現の値を持つ整数アトムを返す（この例では
0x04D2）。指定された 10 進値が 0x0000、または 0xC000 以上の場合、戻り値は 0
となり、エラーを示す。lpString が MAKEINTATOM マクロによって作成された場合、下位ワードは 0x0001 から
0xBFFF の範囲内になければならない。下位ワードがこの範囲内にない場合、関数は失敗する。lpString
が他の形式の場合、GlobalAddAtom は文字列アトムを返す。
> [!NOTE] > winbase.h ヘッダは GlobalAddAtom を、UNICODE プリプロセッサ定数の定義に基づいて
ANSI または Unicode
版を自動選択するエイリアスとして定義する。エンコーディング中立なエイリアスとそうでないコードを混在させると、コンパイルや実行時のエラーを引き起こす不一致が生じうる。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
GlobalAddAtomExW
グローバルアトムテーブルに文字列を追加し、その文字列を識別する一意の値（アトム）を返す。(GlobalAddAtomExW)
%group
Win32 kernel32
%prm
lpString, Flags
lpString : [wstr] 追加する null 終端文字列。文字列は最大 255 バイトのサイズを持つことができる。大文字小文字のみが異なる文字列は同一とみなされる。この名前で最初にテーブルに追加された文字列の大文字小文字が保持され、GlobalGetAtomName 関数によって返される。あるいは、MAKEINTATOM マクロを使用して変換した整数アトムを使用することもできる。詳細は備考を参照。
Flags : [int] 
%inst
グローバルアトムテーブルに文字列を追加し、その文字列を識別する一意の値（アトム）を返す。(GlobalAddAtomExW)

[戻り値]
関数が成功した場合、戻り値は新しく作成されたアトム。関数が失敗した場合、戻り値は 0。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
> [!NOTE] > winbase.h ヘッダは GlobalAddAtomEx を、UNICODE
プリプロセッサ定数の定義に基づいて ANSI または Unicode
版を自動選択するエイリアスとして定義する。エンコーディング中立なエイリアスとそうでないコードを混在させると、コンパイルや実行時のエラーを引き起こす不一致が生じうる。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


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
GlobalCompact
(no summary)
%group
Win32 kernel32
%prm
dwMinFree
dwMinFree : [int] 
%inst



%index
GlobalDeleteAtom
グローバル文字列アトムの参照カウントを減らす。アトムの参照カウントが 0 になると、GlobalDeleteAtom はそのアトムに関連付けられた文字列をグローバルアトムテーブルから削除する。
%group
Win32 kernel32
%prm
nAtom
nAtom : [int] 型: ATOM 削除するアトムと文字列。
%inst
グローバル文字列アトムの参照カウントを減らす。アトムの参照カウントが 0 になると、GlobalDeleteAtom
はそのアトムに関連付けられた文字列をグローバルアトムテーブルから削除する。

[戻り値]
型: ATOM 関数は常に (ATOM) 0 を返す。関数が失敗したかどうかを判定するには、GlobalDeleteAtom
を呼び出す前に SetLastError を ERROR_SUCCESS で呼び、その後 GetLastError
を呼ぶ。最後のエラーコードがまだ ERROR_SUCCESS の場合、GlobalDeleteAtom は成功している。

[備考]
文字列アトムの参照カウントは、文字列がアトムテーブルに追加された回数を指定する。GlobalAddAtom
関数は、グローバルアトムテーブルに既に存在する文字列の参照カウントを呼び出されるたびに増分する。GlobalAddAtom
の各呼び出しは、対応する GlobalDeleteAtom の呼び出しを持つべきである。GlobalAddAtom
を呼び出した回数より多く GlobalDeleteAtom
を呼び出すと、他のクライアントが使用しているアトムを削除する可能性がある。Dynamic Data Exchange (DDE)
を使用するアプリケーションは、リークと早期削除を防ぐためにグローバルアトム管理のルールに従うべきである。GlobalDeleteAtom
は整数アトム（値が 0x0001 から 0xBFFF の範囲内のアトム）には影響を与えない。関数は整数アトムに対して常に 0 を返す。


%index
GlobalFindAtomW
グローバルアトムテーブルから指定した文字列を検索し、その文字列に関連付けられたグローバルアトムを取得する。(Unicode)
%group
Win32 kernel32
%prm
lpString
lpString : [wstr] 型: LPCTSTR 検索する null 終端文字列。あるいは、MAKEINTATOM マクロを使用して変換した整数アトムを使用することもできる。詳細は備考を参照。
%inst
グローバルアトムテーブルから指定した文字列を検索し、その文字列に関連付けられたグローバルアトムを取得する。(Unicode)

[戻り値]
型: ATOM 関数が成功した場合、戻り値は与えられた文字列に関連付けられたグローバルアトム。関数が失敗した場合、戻り値は
0。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
システムは、文字列がもともと入力されたとおりにアトムテーブル内の文字列の大文字小文字を保持するが、GlobalFindAtom
が実行する検索は大文字小文字を区別しない。lpString が MAKEINTATOM マクロによって作成された場合、下位ワードは
0x0001 から 0xBFFF の範囲内になければならない。下位ワードがこの範囲内にない場合、関数は失敗する。
> [!NOTE] > winbase.h ヘッダは GlobalFindAtom を、UNICODE プリプロセッサ定数の定義に基づいて
ANSI または Unicode
版を自動選択するエイリアスとして定義する。エンコーディング中立なエイリアスとそうでないコードを混在させると、コンパイルや実行時のエラーを引き起こす不一致が生じうる。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
GlobalFix
(no summary)
%group
Win32 kernel32
%prm
hMem
hMem : [int] 
%inst



%index
GlobalFlags
指定したグローバルメモリオブジェクトに関する情報を取得する。
%group
Win32 kernel32
%prm
hMem
hMem : [int] グローバルメモリオブジェクトのハンドル。このハンドルは GlobalAlloc または GlobalReAlloc 関数によって返される。
%inst
指定したグローバルメモリオブジェクトに関する情報を取得する。

[戻り値]
関数が成功した場合、戻り値はメモリオブジェクトの確保値とロックカウントを指定する。関数が失敗した場合、戻り値は
GMEM_INVALID_HANDLE で、グローバルハンドルが無効であることを示す。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
戻り値の下位ワードの下位バイトはオブジェクトのロックカウントを含む。戻り値からロックカウントを取得するには、GMEM_LOCKCOUNT
マスクをビット単位 AND (&) 演算子で使用する。GMEM_FIXED で確保されたメモリオブジェクトのロックカウントは常に 0
である。戻り値の下位ワードの上位バイトはメモリオブジェクトの確保値を示す。これは 0 または GMEM_DISCARDED
にできる。グローバル関数は他のメモリ管理関数より大きなオーバーヘッドを持ち、機能が少ない。新しいアプリケーションは、ドキュメントでグローバル関数を使用すべきと記載されていない限り、ヒープ関数を使用すべきである。詳細は
Global and Local Functions を参照。


%index
GlobalGetAtomNameW
指定したグローバルアトムに関連付けられた文字列のコピーを取得する。(Unicode)
%group
Win32 kernel32
%prm
nAtom, lpBuffer, nSize
nAtom : [int] 型: ATOM 取得する文字列に関連付けられたグローバルアトム。
lpBuffer : [wstr] 型: LPTSTR 文字列用のバッファ。
nSize : [int] 型: int バッファのサイズ（文字数）。
%inst
指定したグローバルアトムに関連付けられた文字列のコピーを取得する。(Unicode)

[戻り値]
型: UINT 関数が成功した場合、戻り値はバッファにコピーされた文字列の長さ（文字数）で、終端 null
文字を含まない。関数が失敗した場合、戻り値は 0。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
整数アトム（値が 0x0001 から 0xBFFF の範囲内のアトム）に対して返される文字列は null
終端文字列で、最初の文字はポンド記号 (#) で、残りの文字は符号なし整数アトム値を表す。セキュリティに関する考慮事項
この関数を誤って使用するとプログラムのセキュリティを損なう可能性がある。この関数の誤った使用には、lpBuffer
パラメータのサイズを正しく指定しないことが含まれる。また、グローバルアトムは誰でもアクセス可能であるため、その内容のプライバシーと完全性は保証されないことに注意する。
> [!NOTE] > winbase.h ヘッダは GlobalGetAtomName を、UNICODE
プリプロセッサ定数の定義に基づいて ANSI または Unicode
版を自動選択するエイリアスとして定義する。エンコーディング中立なエイリアスとそうでないコードを混在させると、コンパイルや実行時のエラーを引き起こす不一致が生じうる。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
GlobalHandle
指定したグローバルメモリブロックへのポインタに関連付けられたハンドルを取得する。
%group
Win32 kernel32
%prm
pMem
pMem : [intptr] グローバルメモリブロックの最初のバイトへのポインタ。このポインタは GlobalLock 関数によって返される。
%inst
指定したグローバルメモリブロックへのポインタに関連付けられたハンドルを取得する。

[戻り値]
関数が成功した場合、戻り値は指定したグローバルメモリオブジェクトへのハンドル。関数が失敗した場合、戻り値は
NULL。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
GlobalAlloc 関数が GMEM_MOVEABLE
でメモリオブジェクトを確保すると、オブジェクトへのハンドルを返す。GlobalLock
関数はこのハンドルをメモリブロックへのポインタに変換し、GlobalHandle はポインタをハンドルに戻す。


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
GlobalMemoryStatus
システムの物理および仮想メモリの両方の現在の使用に関する情報を取得する。(GlobalMemoryStatus)
%group
Win32 kernel32
%prm
lpBuffer
lpBuffer : [var] MEMORYSTATUS 構造体へのポインタ。GlobalMemoryStatus 関数は現在のメモリ可用性に関する情報をこの構造体に格納する。
%inst
システムの物理および仮想メモリの両方の現在の使用に関する情報を取得する。(GlobalMemoryStatus)

[備考]
4GB を超えるメモリを持つコンピュータでは、GlobalMemoryStatus 関数が誤った情報を返し、オーバーフローを示す ?1
の値を報告することがある。このため、アプリケーションは代わりに GlobalMemoryStatusEx 関数を使用すべきである。2GB
を超え 4GB 未満のメモリを持つ Intel x86 コンピュータでは、GlobalMemoryStatus 関数は
MEMORYSTATUS 構造体の dwTotalPhys メンバに常に 2GB を返す。同様に、利用可能な合計メモリが 2 から 4GB
の場合、MEMORYSTATUS 構造体の dwAvailPhys メンバは 2GB に切り捨てられる。実行可能ファイルが
/LARGEADDRESSAWARE リンカオプションを使用してリンクされている場合、GlobalMemoryStatus
関数は両方のメンバで正しい物理メモリ量を返す。GlobalMemoryStatus 関数が返す情報は揮発性である。この関数の連続する 2
回の呼び出しが同じ情報を返す保証はない。


%index
GlobalMemoryStatusEx
システムの物理および仮想メモリの両方の現在の使用に関する情報を取得する。(GlobalMemoryStatusEx)
%group
Win32 kernel32
%prm
lpBuffer
lpBuffer : [var] 現在のメモリ可用性に関する情報を受け取る MEMORYSTATUSEX 構造体へのポインタ。
%inst
システムの物理および仮想メモリの両方の現在の使用に関する情報を取得する。(GlobalMemoryStatusEx)

[戻り値]
関数が成功した場合、戻り値は 0 以外。関数が失敗した場合、戻り値は 0。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
GlobalMemoryStatusEx
関数を使用して、他のアプリケーションに深刻な影響を与えずにアプリケーションが確保できるメモリの量を判定できる。GlobalMemoryStatusEx
関数が返す情報は揮発性である。この関数の連続する 2 回の呼び出しが同じ情報を返す保証はない。lpBuffer の
MEMORYSTATUSEX 構造体の ullAvailPhys メンバはすべての NUMA ノードのメモリを含む。


%index
GlobalReAlloc
指定したグローバルメモリオブジェクトのサイズまたは属性を変更する。サイズは増加または減少できる。
%group
Win32 kernel32
%prm
hMem, dwBytes, uFlags
hMem : [int] 再確保するグローバルメモリオブジェクトのハンドル。このハンドルは GlobalAlloc または GlobalReAlloc 関数によって返される。
dwBytes : [int] メモリブロックの新しいサイズ（バイト単位）。uFlags が GMEM_MODIFY を指定する場合、このパラメータは無視される。
uFlags : [int] 再確保オプション。GMEM_MODIFY が指定されている場合、関数はメモリオブジェクトの属性のみを変更する（dwBytes パラメータは無視される）。それ以外の場合、関数はメモリオブジェクトを再確保する。GMEM_MODIFY をオプションで以下の値と組み合わせることができる。
%inst
指定したグローバルメモリオブジェクトのサイズまたは属性を変更する。サイズは増加または減少できる。

[戻り値]
関数が成功した場合、戻り値は再確保されたメモリオブジェクトへのハンドル。関数が失敗した場合、戻り値は
NULL。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
GlobalReAlloc
が移動可能オブジェクトを再確保する場合、戻り値はメモリオブジェクトへのハンドルである。ハンドルをポインタに変換するには
GlobalLock 関数を使用する。GlobalReAlloc
が固定オブジェクトを再確保する場合、返されるハンドルの値はメモリブロックの最初のバイトのアドレスである。メモリにアクセスするには、プロセスは戻り値を単にポインタにキャストできる。GlobalReAlloc
が失敗した場合、元のメモリは解放されず、元のハンドルとポインタは依然として有効である。


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
GlobalUnWire
(no summary)
%group
Win32 kernel32
%prm
hMem
hMem : [int] 
%inst



%index
GlobalUnfix
(no summary)
%group
Win32 kernel32
%prm
hMem
hMem : [int] 
%inst



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
GlobalWire
(no summary)
%group
Win32 kernel32
%prm
hMem
hMem : [int] 
%inst



%index
Heap32First
プロセスによって確保されたヒープの最初のブロックに関する情報を取得する。
%group
Win32 kernel32
%prm
lphe, th32ProcessID, th32HeapID
lphe : [var] HEAPENTRY32 構造体へのポインタ。
th32ProcessID : [int] ヒープを所有するプロセスコンテキストの識別子。
th32HeapID : [int] 列挙対象のヒープの識別子。
%inst
プロセスによって確保されたヒープの最初のブロックに関する情報を取得する。

[戻り値]
最初のヒープブロックの情報がバッファにコピーされた場合は TRUE、それ以外の場合は FALSE
を返す。ヒープが無効または空の場合、GetLastError 関数によって ERROR_NO_MORE_FILES エラー値が返される。

[備考]
呼び出し側アプリケーションは、HEAPENTRY32 の dwSize
メンバを構造体のバイト単位のサイズに設定する必要がある。Heap32First は dwSize
を構造体に書き込まれたバイト数に変更する。これは dwSize
の初期値より大きくなることはないが、より小さくなる可能性がある。値がより小さい場合、その値より大きいオフセットを持つメンバの値に依存してはならない。同じヒープの後続のブロックにアクセスするには、Heap32Next
関数を使用する。Heap32First と Heap32Next
を使用してヒープを巡回することは、特に大きなヒープに対しては非効率である。代わりに HeapWalk を使用する。


%index
Heap32ListFirst
指定したプロセスによって確保された最初のヒープに関する情報を取得する。
%group
Win32 kernel32
%prm
hSnapshot, lphl
hSnapshot : [intptr] CreateToolhelp32Snapshot 関数の前回の呼び出しから返されたスナップショットへのハンドル。
lphl : [var] HEAPLIST32 構造体へのポインタ。
%inst
指定したプロセスによって確保された最初のヒープに関する情報を取得する。

[戻り値]
ヒープリストの最初のエントリがバッファにコピーされた場合は TRUE、それ以外の場合は FALSE
を返す。ヒープリストが存在しない、またはスナップショットがヒープリスト情報を含まない場合、GetLastError 関数によって
ERROR_NO_MORE_FILES エラー値が返される。

[備考]
呼び出し側アプリケーションは、HEAPLIST32 の dwSize
メンバを構造体のバイト単位のサイズに設定する必要がある。Heap32ListFirst は dwSize
を構造体に書き込まれたバイト数に変更する。これは dwSize
の初期値より大きくなることはないが、より小さくなる可能性がある。値がより小さい場合、その値より大きいオフセットを持つメンバの値に依存してはならない。ヒープリスト内の他のヒープに関する情報を取得するには、Heap32ListNext
関数を使用する。


%index
Heap32ListNext
プロセスによって確保された次のヒープに関する情報を取得する。
%group
Win32 kernel32
%prm
hSnapshot, lphl
hSnapshot : [intptr] CreateToolhelp32Snapshot 関数の前回の呼び出しから返されたスナップショットへのハンドル。
lphl : [var] HEAPLIST32 構造体へのポインタ。
%inst
プロセスによって確保された次のヒープに関する情報を取得する。

[戻り値]
ヒープリストの次のエントリがバッファにコピーされた場合は TRUE、それ以外の場合は FALSE
を返す。ヒープリストにこれ以上エントリが存在しない場合、GetLastError 関数によって ERROR_NO_MORE_FILES
エラー値が返される。

[備考]
ヒープリスト内の最初のヒープに関する情報を取得するには、Heap32ListFirst 関数を使用する。


%index
Heap32Next
プロセスによって確保されたヒープの次のブロックに関する情報を取得する。
%group
Win32 kernel32
%prm
lphe
lphe : [var] HEAPENTRY32 構造体へのポインタ。
%inst
プロセスによって確保されたヒープの次のブロックに関する情報を取得する。

[戻り値]
ヒープ内の次のブロックに関する情報がバッファにコピーされた場合は TRUE、それ以外の場合は FALSE
を返す。ヒープにこれ以上オブジェクトが存在しない場合、GetLastError 関数は ERROR_NO_MORE_FILES
を返し、ヒープが破損しているように見える、または巡回中に Heap32Next が継続できないように変更された場合は
ERROR_INVALID_DATA を返す。

[備考]
ヒープの最初のブロックに関する情報を取得するには、Heap32First 関数を使用する。Heap32Next
関数はターゲットプロセスへの参照を維持しない。ターゲットプロセスが終了した場合、システムは同じプロセス識別子を使用して新しいプロセスを作成する可能性がある。したがって、呼び出し側は
Heap32Next を使用している間、ターゲットプロセスへの参照を維持すべきである。Heap32First と Heap32Next
を使用してヒープを巡回することは、特に大きなヒープに対しては非効率である。代わりに HeapWalk を使用する。


%index
HeapCompact
指定したヒープ内でコミット済みの最大の空きブロックのサイズを返す。Disable heap coalesce on free グローバルフラグが設定されている場合、この関数はヒープ内の隣接する空きメモリブロックも結合する。
%group
Win32 kernel32
%prm
hHeap, dwFlags
hHeap : [intptr] ヒープのハンドル。このハンドルは HeapCreate または GetProcessHeap 関数によって返される。
dwFlags : [int] ヒープアクセスオプション。このパラメータには以下の値を指定できる。
%inst
指定したヒープ内でコミット済みの最大の空きブロックのサイズを返す。Disable heap coalesce on free
グローバルフラグが設定されている場合、この関数はヒープ内の隣接する空きメモリブロックも結合する。

[戻り値]
関数が成功した場合、戻り値はヒープ内でコミット済みの最大の空きブロックのサイズ（バイト単位）となる。関数が失敗した場合、戻り値は 0
となる。拡張エラー情報を取得するには GetLastError を呼ぶ。ヒープにまったく空き領域が無いという稀なケースでは、関数の戻り値は
0 となり、GetLastError は NO_ERROR を返す。

[備考]
HeapCompact 関数は主にデバッグ用に使われる。通常、システムは HeapFree
関数が呼ばれるたびにヒープをコンパクションし、HeapCompact
関数はヒープ内で最大の空きブロックのサイズを返すだけで、それ以上のコンパクションは行わない。デバッグ中に Disable heap
coalesce on free グローバルフラグが設定されている場合、システムはヒープをコンパクションしないため、HeapCompact
関数を呼ぶとヒープをコンパクションする。グローバルフラグの詳細は GFlags のドキュメントを参照のこと。アプリケーションが
HeapCompact
の返すサイズのメモリブロックを必ず確保できるとは限らない。他のスレッドやコミットしきい値によって確保が妨げられることがある。シリアライゼーションは、2
つ以上のスレッドが同じヒープから同時にブロックを確保・解放しようとしたときに相互排他を保証する。シリアライゼーションには若干のパフォーマンスコストがあるが、複数のスレッドが同じヒープからメモリを確保・解放する場合は必ず使わなければならない。HEAP_NO_SERIALIZE
値を設定するとヒープ上の相互排他が無効になる。シリアライゼーションなしで同じヒープハンドルを使う 2
つ以上のスレッドが同時にメモリを確保・解放しようとすると、ヒープが破壊される可能性が高い。したがって HEAP_NO_SERIALIZE
値を安全に使えるのは次の状況に限られる:
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
HeapLock
指定したヒープに関連付けられたクリティカルセクションオブジェクト（ロック）の取得を試みる。
%group
Win32 kernel32
%prm
hHeap
hHeap : [intptr] ロック対象のヒープへのハンドル。このハンドルは HeapCreate もしくは GetProcessHeap 関数によって返される。
%inst
指定したヒープに関連付けられたクリティカルセクションオブジェクト（ロック）の取得を試みる。

[戻り値]
関数が成功した場合、戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]

関数が成功した場合、呼び出し側スレッドがヒープロックを所有する。呼び出し側スレッドだけがそのヒープからメモリを確保・解放できる。呼び出し側プロセスの他のスレッドがそのヒープからメモリを確保・解放しようとすると、その実行はブロックされる。これらのスレッドは、ヒープロックを所有するスレッドが
HeapUnlock 関数を呼ぶまでブロックされ続ける。HeapLock 関数は、呼び出し側スレッドが HeapWalk
関数を使っている間に、他のスレッドによるヒープメモリの確保・解放を防ぐために主に使われる。HEAP_NO_SERIALIZE
フラグ付きで作成されたヒープに対して HeapLock 関数を呼ぶと、結果は未定義となる。HeapLock
の成功した呼び出しそれぞれに対して、対応する HeapUnlock の呼び出しが必要となる。HeapUnlock
を呼び忘れると、呼び出し側プロセスのヒープへアクセスしようとする他のスレッドの実行がブロックされる。


%index
HeapQueryInformation
指定したヒープに関する情報を取得する。
%group
Win32 kernel32
%prm
HeapHandle, HeapInformationClass, HeapInformation, HeapInformationLength, ReturnLength
HeapHandle : [intptr] 情報を取得するヒープへのハンドル。このハンドルは HeapCreate もしくは GetProcessHeap 関数によって返される。
HeapInformationClass : [int] 取得する情報のクラス。このパラメータには HEAP_INFORMATION_CLASS 列挙型の次の値を指定できる。
HeapInformation : [intptr] ヒープ情報を受け取るバッファへのポインタ。このデータの形式は HeapInformationClass パラメータの値によって異なる。
HeapInformationLength : [int] 問い合わせるヒープ情報のサイズ（バイト単位）。
ReturnLength : [var] HeapInformation バッファに書き込まれたデータの長さを受け取る変数へのポインタ。バッファが小さすぎる場合、関数は失敗し、ReturnLength にはバッファに必要な最小サイズが設定される。
%inst
指定したヒープに関する情報を取得する。

[戻り値]
関数が成功した場合、戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
LFH や terminate-on-corruption 機能を有効にするには HeapSetInformation
関数を使う。Windows XP と Windows Server 2003
では、ルックアサイドリストは固定サイズのブロックのみを持つ高速なメモリ確保機構である。サポートするヒープに対してルックアサイドリストは既定で有効になっている。Windows
Vista 以降ではルックアサイドリストは使われず、LFH
が既定で有効になっている。ルックアサイドリストは、サイズが可変な一般プール確保よりも高速である。システムが確保サイズに合う空きメモリを探さないためである。さらに、ルックアサイドリストへのアクセスは通常、ミューテックスやスピンロックではなく高速なアトミック
プロセッサ交換命令で同期される。ルックアサイドリストはシステムまたはドライバによって作成でき、ページドプールまたは非ページドプールから確保できる。


%index
HeapSetInformation
指定したヒープに対して機能を有効にする。
%group
Win32 kernel32
%prm
HeapHandle, HeapInformationClass, HeapInformation, HeapInformationLength
HeapHandle : [intptr] 情報を設定するヒープへのハンドル。このハンドルは HeapCreate もしくは GetProcessHeap 関数によって返される。
HeapInformationClass : [int] 
HeapInformation : [intptr] ヒープ情報バッファ。データの形式は HeapInformationClass パラメータの値によって異なる。HeapInformationClass が HeapCompatibilityInformation の場合、HeapInformation は ULONG 変数へのポインタとなる。HeapInformationClass が HeapEnableTerminationOnCorruption の場合、HeapInformation は NULL、HeapInformationLength は 0 にする。
HeapInformationLength : [int] HeapInformation バッファのサイズ（バイト単位）。
%inst
指定したヒープに対して機能を有効にする。

[戻り値]
関数が成功した場合、戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
ヒープの現在の設定を取得するには HeapQueryInformation
関数を使う。HeapEnableTerminateOnCorruption
オプションを設定することを強く推奨する。破壊されたヒープを悪用するセキュリティ エクスプロイトに対するアプリケーションの露出を減らせる。


%index
HeapSummary
HeapSummary 関数 (heapapi.h) は、指定したヒープの概要情報を取得する。
%group
Win32 kernel32
%prm
hHeap, dwFlags, lpSummary
hHeap : [intptr] サマリを取得するヒープへのハンドル。このハンドルは HeapCreate もしくは GetProcessHeap 関数によって返される。
dwFlags : [int] ヒープサマリのオプション。
lpSummary : [var] ヒープサマリを表す [Heap_Summary](ns-heapapi-heap_summary.md) 構造体へのポインタを受け取る。
%inst
HeapSummary 関数 (heapapi.h) は、指定したヒープの概要情報を取得する。

[戻り値]
成功した場合は S_OK を返す。


%index
HeapUnlock
指定したヒープに関連付けられたクリティカルセクションオブジェクト（ロック）の所有権を解放する。
%group
Win32 kernel32
%prm
hHeap
hHeap : [intptr] ロックを解除するヒープへのハンドル。このハンドルは HeapCreate もしくは GetProcessHeap 関数によって返される。
%inst
指定したヒープに関連付けられたクリティカルセクションオブジェクト（ロック）の所有権を解放する。

[戻り値]
関数が成功した場合、戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
HeapLock 関数は、呼び出し側スレッドが HeapWalk
関数を使っている間に、他のスレッドによるヒープメモリの確保・解放を防ぐために主に使われる。HeapUnlock 関数は HeapLock
の逆の動作を行う。HeapLock の各呼び出しに対して、対応する HeapUnlock の呼び出しが必要である。HeapUnlock
を呼び忘れると、呼び出し側プロセスのヒープへアクセスしようとする他のスレッドの実行がブロックされる。HEAP_NO_SERIALIZATION
フラグ付きで作成されたヒープに対して HeapUnlock 関数を呼ぶと、結果は未定義となる。


%index
HeapValidate
指定したヒープを検証する。ヒープ内のすべてのメモリブロックをスキャンし、ヒープ マネージャが管理するヒープ制御構造体が整合した状態にあることを確認する。
%group
Win32 kernel32
%prm
hHeap, dwFlags, lpMem
hHeap : [intptr] 検証対象のヒープへのハンドル。このハンドルは HeapCreate もしくは GetProcessHeap 関数によって返される。
dwFlags : [int] ヒープアクセス オプション。このパラメータには次の値を指定できる。
lpMem : [intptr] 指定したヒープ内のメモリブロックへのポインタ。このパラメータは NULL にできる。
%inst
指定したヒープを検証する。ヒープ内のすべてのメモリブロックをスキャンし、ヒープ
マネージャが管理するヒープ制御構造体が整合した状態にあることを確認する。

[戻り値]
指定したヒープまたはメモリブロックが有効な場合、戻り値は 0 以外となる。無効な場合、戻り値は 0
となる。デバッグ用に設定されたシステムでは、HeapValidate 関数はヒープまたはメモリブロックのどの部分が無効かを説明するデバッグ
メッセージを表示し、ハードコードされたブレークポイントで停止するので、無効の原因を調べることができる。HeapValidate
関数はスレッドの直近エラー値を設定しない。この関数には拡張エラー情報はなく、GetLastError を呼んではならない。

[備考]
HeapValidate
関数は主にデバッグ用である。検証には時間がかかる可能性があるためだ。ヒープを検証すると、他のスレッドがヒープへアクセスできなくなり、特に対称型マルチプロセッシング
(SMP) コンピュータではパフォーマンスが低下することがある。これらの副作用は HeapValidate
が戻るまで続く。ヒープ内の各メモリブロックには、およびヒープ全体に対して、ヒープ制御構造体が存在する。HeapValidate
で完全なヒープを検証する場合、これらすべての制御構造体の整合性がチェックされる。ヒープ内の単一メモリブロックを検証する場合は、その要素に関連する制御構造体のみがチェックされる。HeapValidate
は確保済みメモリブロックのみを検証できる。解放済みメモリブロックに対して HeapValidate を呼ぶと、検証する制御構造体がないため
FALSE が返る。HeapWalk 関数で列挙したヒープ要素を検証したい場合は、PROCESS_HEAP_ENTRY 構造体の
wFlags メンバに PROCESS_HEAP_ENTRY_BUSY が立っている要素に対してのみ HeapValidate
を呼ぶべきである。HeapValidate はこのビットが立っていないヒープ要素すべてに対して FALSE
を返す。シリアライゼーションは、2
つ以上のスレッドが同じヒープから同時にブロックを確保・解放しようとしたときに相互排他を保証する。シリアライゼーションには若干のパフォーマンスコストがあるが、複数のスレッドが同じヒープからメモリを確保・解放する場合は必ず使わなければならない。HEAP_NO_SERIALIZE
値を設定するとヒープ上の相互排他が無効になる。シリアライゼーションなしで同じヒープハンドルを使う 2
つ以上のスレッドが同時にメモリを確保・解放しようとすると、ヒープが破壊される可能性が高い。したがって HEAP_NO_SERIALIZE
値を安全に使えるのは次の状況に限られる:
（以下省略）


%index
HeapWalk
指定したヒープ内のメモリブロックを列挙する。
%group
Win32 kernel32
%prm
hHeap, lpEntry
hHeap : [intptr] ヒープへのハンドル。このハンドルは HeapCreate もしくは GetProcessHeap 関数によって返される。
lpEntry : [var] 特定のヒープ列挙の状態情報を保持する PROCESS_HEAP_ENTRY 構造体へのポインタ。HeapWalk 関数が成功して TRUE を返すと、この構造体のメンバにはヒープ内の次のメモリブロックに関する情報が入る。ヒープ列挙を開始するには、PROCESS_HEAP_ENTRY 構造体の lpData フィールドを NULL に設定する。特定のヒープ列挙を続けるには、hHeap、lpEntry、および PROCESS_HEAP_ENTRY 構造体の各メンバを変更せずに HeapWalk 関数を繰り返し呼ぶ。
%inst
指定したヒープ内のメモリブロックを列挙する。

[戻り値]
関数が成功した場合、戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼ぶ。ヒープの終端に到達して列挙が正常に終了した場合、関数は FALSE を返し、GetLastError
はエラーコード ERROR_NO_MORE_ITEMS を返す。

[備考]
HeapWalk
関数は主にデバッグ用に使われる。ヒープを列挙する操作は時間がかかる可能性があるためである。列挙中にヒープをロックすると他のスレッドはヒープへアクセスできなくなり、特に対称型マルチプロセッシング
(SMP) コンピュータではパフォーマンスが低下することがある。この副作用はヒープがアンロックされるまで続く。ヒープ列挙中のヒープロックは
HeapLock と HeapUnlock 関数で制御する。ヒープ列挙を開始するには、lpEntry が指す
PROCESS_HEAP_ENTRY 構造体の lpData フィールドを NULL に設定して HeapWalk
を呼ぶ。ヒープ列挙を続けるには、同じ hHeap と lpEntry の値、および直前の HeapWalk 呼び出しから変更していない
PROCESS_HEAP_ENTRY 構造体で HeapWalk を呼ぶ。これ以上列挙する必要がなくなるまで、または関数が FALSE
を返し GetLastError が ERROR_NO_MORE_ITEMS
を返してヒープのすべてのメモリブロックが列挙されたことを示すまで、このプロセスを繰り返す。列挙状態のデータは
PROCESS_HEAP_ENTRY 構造体の内容以外に保持されないため、ヒープ列挙を終了するための特別な HeapWalk
呼び出しは不要である。マルチスレッド アプリケーションでは、ヒープ列挙中にヒープをロックしていないと HeapWalk
が失敗する可能性がある。


%index
IdnToNameprepUnicode
国際化ドメイン名 (IDN) またはその他の国際化ラベルを Network Working Group RFC 3491 で規定された NamePrep 形式に変換する。ただし、Punycode への追加変換は行わない。
%group
Win32 kernel32
%prm
dwFlags, lpUnicodeCharStr, cchUnicodeChar, lpNameprepCharStr, cchNameprepChar
dwFlags : [int] 変換オプションを指定するフラグ。詳細は IdnToAscii の dwFlags パラメータを参照のこと。
lpUnicodeCharStr : [wstr] IDN またはその他の国際化ラベルを表す Unicode 文字列へのポインタ。
cchUnicodeChar : [int] lpUnicodeCharStr が示す入力 Unicode 文字列内の Unicode 文字数。
lpNameprepCharStr : [wstr] NamePrep 処理によって変換された入力 Unicode 文字列を受け取るバッファへのポインタ。代わりに cchNameprepChar が 0 の場合は NULL を指定でき、この場合は関数がバッファに必要なサイズを返す。
cchNameprepChar : [int] lpNameprepCharStr が指すバッファのサイズ（文字数単位）。アプリケーションはサイズを 0 に設定して、lpNameprepCharStr に NULL を指定し、関数に必要なバッファサイズを返させることができる。
%inst
国際化ドメイン名 (IDN) またはその他の国際化ラベルを Network Working Group RFC 3491 で規定された
NamePrep 形式に変換する。ただし、Punycode への追加変換は行わない。

[戻り値]
成功した場合、lpNameprepCharStr に取得された文字数を返す。取得された文字列は、入力 Unicode 文字列が null
終端である場合に限り null 終端となる。関数が成功して cchNameprepChar の値が 0 の場合、入力バッファに終端
null 文字が含まれていたならそれを含む必要サイズ（文字数）を返す。失敗した場合は 0
を返す。拡張エラー情報を取得するには、アプリケーションから GetLastError を呼ぶ。次のいずれかのエラーコードが返る場合がある:
（以下省略）

[備考]
IdnToAscii の Remarks を参照のこと。


%index
InitAtomTable
ローカル アトムテーブルを初期化し、ハッシュ バケット数を指定したサイズに設定する。
%group
Win32 kernel32
%prm
nSize
nSize : [int] 型: DWORD アトムテーブルに使うハッシュ バケットの数。0 を指定すると既定数のハッシュ バケットが作成される。パフォーマンスを向上させるには nSize に素数を指定する。
%inst
ローカル アトムテーブルを初期化し、ハッシュ バケット数を指定したサイズに設定する。

[戻り値]
型: BOOL 関数が成功した場合、戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。

[備考]
アプリケーションはローカル アトムテーブルを使うためにこの関数を必ずしも呼ぶ必要はない。既定のハッシュ バケット数は 37
である。InitAtomTable を使うのであれば、他のアトム管理関数を呼ぶ前に呼ぶべきである。大量のローカル
アトムを扱うアプリケーションでは、テーブルのサイズを増やすことでローカル
アトムテーブルへのアトムの追加や検索に必要な時間を短縮できる。ただし、その分テーブルの維持に必要なメモリ量が増える。グローバル
アトムテーブルのバケット数は変更できない。以前の InitAtomTable
呼び出しによって明示的に、もしくはアトム管理関数の使用によって暗黙的に、すでにアトムテーブルが初期化されている場合、InitAtomTable
はハッシュ バケット数を変更せずに成功を返す。


%index
InitializeCriticalSectionAndSpinCount
クリティカルセクション オブジェクトを初期化し、クリティカルセクションのスピン カウントを設定する。
%group
Win32 kernel32
%prm
lpCriticalSection, dwSpinCount
lpCriticalSection : [var] クリティカルセクション オブジェクトへのポインタ。
dwSpinCount : [int] クリティカルセクション オブジェクトのスピン カウント。シングル プロセッサ システムでは、スピン カウントは無視されクリティカルセクションのスピン カウントは 0 に設定される。マルチ プロセッサ システムでは、クリティカルセクションが使用できないとき、呼び出し側スレッドはクリティカルセクションに関連付けられたセマフォでの待機に入る前に dwSpinCount 回スピンする。スピン動作中にクリティカルセクションが空けば、呼び出し側スレッドは待機を回避する。
%inst
クリティカルセクション オブジェクトを初期化し、クリティカルセクションのスピン カウントを設定する。

[戻り値]
この関数は常に成功し 0 以外の値を返す。Windows Server 2003 および Windows XP では、関数が成功した場合は
0 以外、失敗した場合は 0 を返す。拡張エラー情報を取得するには GetLastError を呼ぶ。Windows Vista
以降では、InitializeCriticalSectionAndSpinCount 関数は低メモリ状況でも常に成功する。

[備考]
単一プロセスのスレッドは、相互排他同期にクリティカルセクション
オブジェクトを使える。スレッドがクリティカルセクションの所有権を得る順序については保証されないが、システムはすべてのスレッドに公平である。プロセスはクリティカルセクション
オブジェクトで使うメモリの確保に責任を持ち、CRITICAL_SECTION
型の変数を宣言することで確保できる。クリティカルセクションを使う前に、プロセスのいずれかのスレッドがオブジェクトを初期化しなければならない。後から
SetCriticalSectionSpinCount 関数を呼んでスピン カウントを変更できる。クリティカルセクション
オブジェクトが初期化されると、プロセスのスレッドは
EnterCriticalSection、TryEnterCriticalSection、LeaveCriticalSection
関数でオブジェクトを指定し、共有リソースへの相互排他アクセスを提供できる。異なるプロセスのスレッド間で同様の同期を行うにはミューテックス
オブジェクトを使う。クリティカルセクション
オブジェクトは移動やコピーができない。プロセスはオブジェクトを変更してはならず、論理的に不透明なものとして扱う必要がある。クリティカルセクションの管理にはクリティカルセクション関数のみを使う。クリティカルセクションの使用を終えたら
DeleteCriticalSection 関数を呼ぶ。クリティカルセクション
オブジェクトは再初期化する前に削除しなければならない。既に初期化されたクリティカルセクションを初期化すると動作は未定義となる。スピン
カウントは、競合が激しくなり得る短時間のクリティカルセクションに有用である。最悪の場合として、SMP システム上のアプリケーションが
2～3
個のスレッドで常にヒープからメモリを確保・解放しており、ヒープをクリティカルセクションでシリアライズしている状況を考える。最悪のケースではクリティカルセクションの競合が継続し、各スレッドが
WaitForSingleObject 関数の処理負荷の高い呼び出しを行う。しかしスピン
カウントを適切に設定すれば、競合が発生しても呼び出し側スレッドはすぐに WaitForSingleObject
を呼ばず、スピン中にクリティカルセクションが解放されれば所有権を取得できる。短時間のクリティカルセクションで小さいスピン
カウントを選ぶことでパフォーマンスは大きく向上できる。例えばヒープ マネージャはヒープごとのクリティカルセクションに対しておよそ 4000
のスピン カウントを使っている。この関数を使うアプリケーションをコンパイルするには _WIN32_WINNT を 0x0403
以降に定義する。詳細は Using the Windows Headers を参照のこと。


%index
InitializeCriticalSectionEx
スピン カウントとオプションのフラグを指定してクリティカルセクション オブジェクトを初期化する。
%group
Win32 kernel32
%prm
lpCriticalSection, dwSpinCount, Flags
lpCriticalSection : [var] クリティカルセクション オブジェクトへのポインタ。
dwSpinCount : [int] クリティカルセクション オブジェクトのスピン カウント。シングル プロセッサ システムではスピン カウントは無視されクリティカルセクションのスピン カウントは 0 に設定される。マルチ プロセッサ システムでは、クリティカルセクションが使用できないとき、呼び出し側スレッドはクリティカルセクションに関連付けられたセマフォでの待機に入る前に dwSpinCount 回スピンする。スピン中にクリティカルセクションが空けば、呼び出し側スレッドは待機を回避する。
Flags : [int] このパラメータは 0 または次の値にできる。
%inst
スピン カウントとオプションのフラグを指定してクリティカルセクション オブジェクトを初期化する。

[戻り値]
関数が成功した場合、戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
単一プロセスのスレッドは、相互排他同期にクリティカルセクション
オブジェクトを使える。スレッドがクリティカルセクションの所有権を得る順序については保証されないが、システムはすべてのスレッドに公平である。プロセスはクリティカルセクション
オブジェクトで使うメモリの確保に責任を持ち、CRITICAL_SECTION
型の変数を宣言して確保できる。クリティカルセクションを使う前に、プロセスのいずれかのスレッドがオブジェクトを初期化しなければならない。後から
SetCriticalSectionSpinCount 関数でスピン カウントを変更できる。クリティカルセクション
オブジェクトが初期化されると、プロセスのスレッドは
EnterCriticalSection、TryEnterCriticalSection、LeaveCriticalSection
関数でオブジェクトを指定し、共有リソースへの相互排他アクセスを提供できる。異なるプロセスのスレッド間で同様の同期を行うにはミューテックス
オブジェクトを使う。クリティカルセクション
オブジェクトは移動やコピーができない。プロセスはオブジェクトを変更してはならず、論理的に不透明なものとして扱う必要がある。クリティカルセクションの管理にはクリティカルセクション関数のみを使う。クリティカルセクションの使用を終えたら
DeleteCriticalSection
関数を呼ぶ。再初期化する前に削除しなければならない。既に初期化されたクリティカルセクションを初期化すると動作は未定義となる。スピン
カウントは、競合が激しくなり得る短時間のクリティカルセクションに有用である。最悪の場合として、SMP システム上のアプリケーションが
2～3
個のスレッドで常にヒープからメモリを確保・解放し、ヒープをクリティカルセクションでシリアライズしている状況を考える。最悪のケースではクリティカルセクションの競合が継続し、各スレッドが
WaitForSingleObject の処理負荷の高い呼び出しを行う。しかしスピン
カウントを適切に設定すれば、呼び出し側スレッドは競合が発生してもすぐに WaitForSingleObject
を呼ばず、スピン中にクリティカルセクションが解放されれば所有権を取得できる。短時間のクリティカルセクションで小さいスピン
カウントを選ぶことでパフォーマンスは大きく向上できる。ヒープ マネージャはヒープごとのクリティカルセクションにおよそ 4000 のスピン
カウントを使っている。これにより、ほとんどの最悪ケースで優れたパフォーマンスとスケーラビリティが得られる。


%index
InitializeSynchronizationBarrier
新しい同期バリアを初期化する。
%group
Win32 kernel32
%prm
lpBarrier, lTotalThreads, lSpinCount
lpBarrier : [var] 初期化する SYNCHRONIZATION_BARRIER 構造体へのポインタ。これは不透明な構造体で、アプリケーションから変更してはならない。
lTotalThreads : [int] このバリアに入れるスレッドの最大数。最大数のスレッドがバリアに入ると、すべてのスレッドが続行する。
lSpinCount : [int] 他のスレッドがバリアに到達するのを待つ間、個々のスレッドがスピンする回数。-1 を指定するとスレッドは 2000 回スピンする。lSpinCount を超えると、スレッドは SYNCHRONIZATION_BARRIER_FLAGS_SPIN_ONLY を指定して EnterSynchronizationBarrier を呼んでいない限りブロックされる。
%inst
新しい同期バリアを初期化する。

[戻り値]
バリアの初期化に成功した場合は TRUE を返す。失敗した場合は FALSE を返す。拡張エラー情報を取得するには
GetLastError を使う。


%index
IsBadCodePtr
呼び出し側プロセスが指定アドレスのメモリに対して読み取りアクセス権を持つかを判定する。
%group
Win32 kernel32
%prm
lpfn
lpfn : [var] メモリ アドレスへのポインタ。
%inst
呼び出し側プロセスが指定アドレスのメモリに対して読み取りアクセス権を持つかを判定する。

[戻り値]
呼び出し側プロセスが指定したメモリに対して読み取りアクセス権を持つ場合、戻り値は 0 となる。持たない場合、戻り値は 0
以外となる。拡張エラー情報を取得するには GetLastError を呼ぶ。デバッグ
ビルドでコンパイルされたアプリケーションで、プロセスが指定メモリ位置に対して読み取りアクセス権を持たない場合、関数はアサートしデバッガに入る。デバッガを抜けると関数は通常どおり続行し
0 以外の値を返す。これはデバッグ支援として意図された動作である。

[備考]
プリエンプティブ
マルチタスク環境では、検査中のメモリに対するプロセスのアクセス権を他のスレッドが変更する可能性がある。たとえ関数が指定したメモリに対して読み取りアクセスがあると報告しても、メモリへアクセスするときは構造化例外処理を使うべきである。構造化例外処理を使えば、アクセス違反例外が発生した際にシステムからプロセスに通知され、プロセスは例外を処理する機会を得られる。


%index
IsBadHugeReadPtr
(no summary)
%group
Win32 kernel32
%prm
lp, ucb
lp : [intptr] 
ucb : [int] 
%inst



%index
IsBadHugeWritePtr
(no summary)
%group
Win32 kernel32
%prm
lp, ucb
lp : [intptr] 
ucb : [int] 
%inst



%index
IsBadReadPtr
呼び出し側プロセスが指定したメモリ範囲に対して読み取りアクセス権を持つかを検証する。(IsBadReadPtr)
%group
Win32 kernel32
%prm
lp, ucb
lp : [intptr] メモリ ブロックの先頭バイトへのポインタ。
ucb : [int] メモリ ブロックのサイズ（バイト単位）。このパラメータが 0 の場合、戻り値は 0 となる。
%inst
呼び出し側プロセスが指定したメモリ範囲に対して読み取りアクセス権を持つかを検証する。(IsBadReadPtr)

[戻り値]
呼び出し側プロセスが指定メモリ範囲のすべてのバイトに対して読み取りアクセス権を持つ場合、戻り値は 0 となる。持たない場合、戻り値は 0
以外となる。デバッグ
ビルドでコンパイルされ、指定メモリ範囲のすべてのバイトに対して読み取りアクセス権を持たない場合、関数はアサートしデバッガに入る。デバッガを抜けると関数は通常どおり続行し
0 以外の値を返す。これはデバッグ支援として意図された動作である。

[備考]
この関数は通常、サードパーティ ライブラリから返されたポインタを扱うときに使われる。サードパーティ DLL
のメモリ管理動作を判断できない場合である。プロセス内のスレッドは互いに協調し、一方が他方の必要とするメモリを解放しないようにすることが期待されている。この関数の使用はその必要性を排除しない。これを行わないと、アプリケーションは予測不能な形で失敗することがある。無効である可能性のあるポインタの参照解決は、他のスレッドのスタック拡張を無効にしてしまう可能性がある。スタック拡張が無効化された状態でスレッドがスタックを使い切ると、親プロセスはポップアップ
エラー
ウィンドウや診断情報を出さずに直ちに終了する。呼び出し側プロセスが指定メモリ範囲内の一部バイトに対してのみ読み取りアクセス権を持つ場合、戻り値は
0 以外となる。プリエンプティブ
マルチタスク環境では、検査中のメモリに対するプロセスのアクセス権を他のスレッドが変更する可能性がある。たとえ関数が読み取りアクセスありと報告してもメモリへアクセスする際は構造化例外処理を使うべきである。構造化例外処理を使えば、アクセス違反例外が発生した際にシステムからプロセスに通知され、プロセスは例外を処理する機会を得られる。


%index
IsBadStringPtrW
呼び出し側プロセスが指定したメモリ範囲に対して読み取りアクセス権を持つかを検証する。(IsBadStringPtrW)
%group
Win32 kernel32
%prm
lpsz, ucchMax
lpsz : [wstr] Unicode または ASCII の null 終端文字列へのポインタ。
ucchMax : [int] 文字列の最大サイズ (TCHAR 単位)。関数は、文字列の終端 null 文字まで、もしくはこのパラメータで指定した文字数のいずれか小さい方の文字数について読み取りアクセスをチェックする。このパラメータが 0 の場合、戻り値は 0 となる。
%inst
呼び出し側プロセスが指定したメモリ範囲に対して読み取りアクセス権を持つかを検証する。(IsBadStringPtrW)

[戻り値]
呼び出し側プロセスが、文字列の終端 null 文字または ucchMax
で指定した文字数までのすべての文字に対して読み取りアクセス権を持つ場合、戻り値は 0 となる。持たない場合、戻り値は 0
以外となる。デバッグ
ビルドでコンパイルされ、指定メモリ範囲全体に対して読み取りアクセス権を持たない場合、関数はアサートしデバッガに入る。デバッガを抜けると関数は通常どおり続行し
0 以外の値を返す。これはデバッグ支援として意図された動作である。

[備考]
この関数は通常、サードパーティ ライブラリから返されたポインタを扱うときに使われる。サードパーティ DLL
のメモリ管理動作を判断できない場合である。プロセス内のスレッドは互いに協調し、一方が他方の必要とするメモリを解放しないようにすることが期待される。この関数の使用はその必要性を排除しない。これを行わないと、アプリケーションは予測不能な形で失敗することがある。無効である可能性のあるポインタの参照解決は、他のスレッドのスタック拡張を無効にしてしまう可能性がある。スタック拡張が無効化された状態でスレッドがスタックを使い切ると、親プロセスはポップアップ
エラー ウィンドウや診断情報を出さずに直ちに終了する。呼び出し側プロセスが指定メモリ範囲の一部にのみ読み取りアクセス権を持つ場合、戻り値は
0 以外となる。プリエンプティブ
マルチタスク環境では、検査中のメモリに対するプロセスのアクセス権を他のスレッドが変更する可能性がある。たとえ関数が読み取りアクセスありと報告してもメモリへアクセスする際は構造化例外処理を使うべきである。構造化例外処理を使えば、アクセス違反例外が発生した際にシステムからプロセスに通知され、プロセスは例外を処理する機会を得られる。
> [!NOTE] > winbase.h ヘッダーは IsBadStringPtr を、UNICODE
プリプロセッサ定数の定義に基づいて ANSI 版か Unicode
版を自動選択するエイリアスとして定義している。エンコーディング中立のエイリアスとそうでないコードを混在させると、コンパイルまたは実行時エラーになるミスマッチが発生することがある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照のこと。


%index
IsBadWritePtr
呼び出し側プロセスが指定したメモリ範囲に対して書き込みアクセス権を持つかを検証する。
%group
Win32 kernel32
%prm
lp, ucb
lp : [intptr] メモリ ブロックの先頭バイトへのポインタ。
ucb : [int] メモリ ブロックのサイズ（バイト単位）。このパラメータが 0 の場合、戻り値は 0 となる。
%inst
呼び出し側プロセスが指定したメモリ範囲に対して書き込みアクセス権を持つかを検証する。

[戻り値]
呼び出し側プロセスが指定メモリ範囲のすべてのバイトに対して書き込みアクセス権を持つ場合、戻り値は 0 となる。持たない場合、戻り値は 0
以外となる。デバッガ下で実行されており指定メモリ範囲のすべてのバイトに対して書き込みアクセス権を持たない場合、関数は first
chance の STATUS_ACCESS_VIOLATION
例外を発生させる。この条件でブレークするようデバッガを設定できる。デバッガ内でプロセスの実行を再開すると、関数は通常どおり続行し 0
以外の値を返す。これはデバッグ支援として意図された動作である。

[備考]
この関数は通常、サードパーティ ライブラリから返されたポインタを扱うときに使われる。サードパーティ DLL
のメモリ管理動作を判断できない場合である。プロセス内のスレッドは互いに協調し、一方が他方の必要とするメモリを解放しないようにすることが期待される。この関数の使用はその必要性を排除しない。これを行わないとアプリケーションは予測不能な形で失敗することがある。無効である可能性のあるポインタの参照解決は、他のスレッドのスタック拡張を無効にしてしまう可能性がある。スタック拡張が無効化された状態でスレッドがスタックを使い切ると、親プロセスはポップアップ
エラー
ウィンドウや診断情報を出さずに直ちに終了する。呼び出し側プロセスが指定メモリ範囲の一部バイトに対してのみ書き込みアクセス権を持つ場合、戻り値は
0 以外となる。プリエンプティブ
マルチタスク環境では、検査中のメモリに対するプロセスのアクセス権を他のスレッドが変更する可能性がある。たとえ関数が書き込みアクセスありと報告してもメモリへアクセスする際は構造化例外処理を使うべきである。構造化例外処理を使えば、アクセス違反例外が発生した際にシステムからプロセスに通知され、プロセスは例外を処理する機会を得られる。IsBadWritePtr
はマルチスレッド セーフではない。複数のスレッドが共有するポインタに対して正しく使うには、検査中のメモリへアクセスするスレッドが 1
つだけになるクリティカル リージョン内で呼ぶ必要がある。クリティカル リージョンを作るにはクリティカルセクションやミューテックスなどの
OS レベルのオブジェクト、あるいはインターロック関数を使う。


%index
IsCalendarLeapYear
非推奨。指定した暦について、指定した元号の指定年が閏年かどうかを判定する。
%group
Win32 kernel32
%prm
calId, year, era
calId : [int] 閏年のチェックに使う [calendar identifier](calendar-identifiers.md)。
year : [int] チェックする年。
era : [int] チェックする元号。
%inst
非推奨。指定した暦について、指定した元号の指定年が閏年かどうかを判定する。

[戻り値]
指定した年が閏年であれば **TRUE**、そうでなければ **FALSE** を返す。拡張エラー情報を取得するには、アプリケーションから
[**GetLastError**](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror)
を呼ぶ。次のいずれかのエラーコードが返ることがある: -
ERROR\_INVALID\_PARAMETER。いずれかのパラメータ値が無効。

[備考]
この関数に関連付けられたヘッダーファイルやライブラリ ファイルは無い。アプリケーションは DLL 名 (Kernel32.dll)
を指定して
[**LoadLibrary**](/windows/win32/api/libloaderapi/nf-libloaderapi-loadlibrarya)
を呼び、モジュール ハンドルを取得できる。そのモジュール ハンドルとこの関数名を指定して
[**GetProcAddress**](/windows/win32/api/libloaderapi/nf-libloaderapi-getprocaddress)
を呼ぶことで関数アドレスが取得できる。


%index
IsDBCSLeadByte
指定した文字がシステム既定の Windows ANSI コードページ (CP_ACP) でリード バイトとなるかを判定する。リード バイトとは、コードページのダブルバイト文字セット (DBCS) において 2 バイト文字の先頭バイトである。
%group
Win32 kernel32
%prm
TestChar
TestChar : [int] テストする文字。
%inst
指定した文字がシステム既定の Windows ANSI コードページ (CP_ACP) でリード バイトとなるかを判定する。リード
バイトとは、コードページのダブルバイト文字セット (DBCS) において 2 バイト文字の先頭バイトである。

[戻り値]
テスト文字がリード バイトになりうる場合は 0 以外の値を返す。リード バイトでない、または 1 バイト文字の場合は 0
を返す。拡張エラー情報を取得するには、アプリケーションから GetLastError を呼ぶ。

[備考]
注意: この関数はトレール バイトの存在や有効性を検証しない。そのため、IsDBCSLeadByte を使うアプリケーションがリード
バイトとして報告したシーケンスを MultiByteToWideChar が認識しないことがある。アプリケーションは
MultiByteToWideChar
の結果と容易にずれてしまい、予期しないエラーやバッファサイズ不一致の原因となりうる。一般的には、コードページ
データの低レベル操作を試みる代わりに、アプリケーションは MultiByteToWideChar でデータを UTF-16
に変換しそのエンコーディングで処理するべきである。リード バイト値は DBCS ごとに固有である。同じコードページ内で、ある 1
バイト値が DBCS 文字のリード バイトにもトレール バイトにもなることがある。DBCS
文字列を正しく解釈するには、アプリケーションは通常文字列の先頭から前方にスキャンし、リード
バイトを見つけたら次のバイトを同じ文字の末尾として扱う。戻る必要がある場合は、自前のアルゴリズムを作らず CharPrev
を使うべきである。


%index
IsDBCSLeadByteEx
指定した文字がリード バイトになりうるかを判定する。リード バイトとは、コードページのダブルバイト文字セット (DBCS) において 2 バイト文字の先頭バイトである。
%group
Win32 kernel32
%prm
CodePage, TestChar
CodePage : [int] リード バイト範囲のチェックに使うコードページの識別子。このパラメータには Unicode and Character Set Constants で定義されたコードページ識別子、もしくは次の定義済み値のいずれかを指定できる。この関数はコードページ 932、936、949、950、1361 に対してのみリード バイト値を検証する。
TestChar : [int] テストする文字。
%inst
指定した文字がリード バイトになりうるかを判定する。リード バイトとは、コードページのダブルバイト文字セット (DBCS) において 2
バイト文字の先頭バイトである。

[戻り値]
指定バイトがリード バイトの場合は 0 以外の値を返す。リード バイトでない、または 1 バイト文字の場合は 0
を返す。拡張エラー情報を取得するには、アプリケーションから GetLastError を呼ぶ。

[備考]
注意: この関数はトレール バイトの存在や有効性を検証しない。そのため、IsDBCSLeadByte を使うアプリケーションがリード
バイトとして報告したシーケンスを MultiByteToWideChar が認識しないことがある。アプリケーションは
MultiByteToWideChar
の結果と容易にずれてしまい、予期しないエラーやバッファサイズ不一致の原因となりうる。一般的には、コードページ
データの低レベル操作を試みる代わりに、アプリケーションは MultiByteToWideChar でデータを UTF-16
に変換しそのエンコーディングで処理するべきである。リード バイト値は DBCS ごとに固有である。同じコードページ内で、ある 1
バイト値が DBCS 文字のリード バイトにもトレール バイトにもなることがあるため、IsDBCSLeadByteEx が示せるのはリード
バイトになりうる値だけである。DBCS 文字列を正しく解釈するには、アプリケーションは通常文字列の先頭から前方にスキャンし、リード
バイトを見つけたら次のバイトを同じ文字の末尾として扱う。戻る必要がある場合は自前のアルゴリズムを作らず CharPrevExA
を使うべきである。


%index
IsDebuggerPresent
呼び出し側プロセスがユーザーモード デバッガによってデバッグされているかを判定する。
%group
Win32 kernel32
%prm

%inst
呼び出し側プロセスがユーザーモード デバッガによってデバッグされているかを判定する。

[戻り値]
現在のプロセスがデバッガのコンテキストで実行されている場合、戻り値は 0 以外となる。されていない場合、戻り値は 0 となる。

[備考]
この関数によりアプリケーションは自身がデバッグされているかを判定でき、それに応じて動作を変更できる。例えば、デバッグ中であれば
OutputDebugString 関数で追加情報を出力することができる。リモート プロセスがデバッグされているかを判定するには
CheckRemoteDebuggerPresent 関数を使う。この関数を使うアプリケーションをコンパイルするには
_WIN32_WINNT マクロを 0x0400 以降に定義する。詳細は Using the Windows Headers
を参照のこと。


%index
IsNLSDefinedString
文字列内の各文字が、指定した NLS 機能について定義された結果を持つかを判定する。
%group
Win32 kernel32
%prm
Function, dwFlags, lpVersionInformation, lpString, cchStr
Function : [int] 問い合わせる NLS 機能。この値は COMPARE_STRING でなければならない。SYSNLS_FUNCTION 列挙体を参照のこと。
dwFlags : [int] 関数を定義するフラグ。0 でなければならない。
lpVersionInformation : [var] バージョン情報を含む NLSVERSIONINFO 構造体へのポインタ。通常、この情報は GetNLSVersion を呼んで取得する。現在のバージョンを使わせる場合、アプリケーションはこのパラメータを NULL に設定する。
lpString : [wstr] 検査する UTF-16 文字列へのポインタ。
cchStr : [int] lpString が示す文字列内の UTF-16 文字数。終端 null 文字を含めてもよい。終端 null 文字は常に定義済みとして扱われるので、カウントに含めてもチェック動作に影響しない。文字列が null 終端の場合はアプリケーションから -1 を指定すべきであり、この場合は関数自身が文字列長を計算する。
%inst
文字列内の各文字が、指定した NLS 機能について定義された結果を持つかを判定する。

[戻り値]
成功し、かつ入力文字列が有効な場合のみ TRUE を返し、そうでなければ FALSE
を返す。拡張エラー情報を取得するには、アプリケーションから GetLastError を呼ぶ。次のいずれかのエラーコードが返ることがある:
（以下省略）

[備考]
この関数は定義済み文字列と未定義文字列を区別するので、Active Directory のようなアプリケーションが未定義コード
ポイントを含む文字列を拒否できる。この関数を使うと、アプリケーションがデータベースを再インデックスする必要性を最小限にできる。詳細は
Handling Sorting in Your Applications を参照のこと。例えば Function に
COMPARE_STRING を指定した場合、IsNLSDefinedString は未定義コード ポイント、未定義 Unicode
文字を表すサロゲート ペア、または不正な形式のサロゲート ペアをチェックする。特定の文字列に対して関数が TRUE
を返す場合、CompareString または LCMAP_SORTKEY を指定した LCMapString で取得した結果は、対応する
NLS バージョンが変わらない限り同一であることが保証される。


%index
IsNativeVhdBoot
OS が VHD コンテナから起動されたかを示す。
%group
Win32 kernel32
%prm
NativeVhdBoot
NativeVhdBoot : [var] OS が VHD から起動されたかを示すブール値を受け取る変数へのポインタ。
%inst
OS が VHD コンテナから起動されたかを示す。

[戻り値]
OS がネイティブ VHD から起動された場合は TRUE、それ以外は FALSE。拡張エラー情報を取得するには GetLastError
を呼ぶ。


%index
IsNormalizedString
文字列が Unicode 4.0 TR#15 に従って正規化されているかを検証する。詳細は Using Unicode Normalization to Represent Strings を参照のこと。
%group
Win32 kernel32
%prm
NormForm, lpString, cwLength
NormForm : [int] 使う正規化形式。NORM_FORM は標準の Unicode 正規化形式を指定する。
lpString : [wstr] テストする文字列へのポインタ。
cwLength : [int] 入力文字列の長さ（文字単位）。終端 null 文字を含む。-1 の場合、関数は文字列を null 終端と見なし、長さを自動計算する。
%inst
文字列が Unicode 4.0 TR#15 に従って正規化されているかを検証する。詳細は Using Unicode
Normalization to Represent Strings を参照のこと。

[戻り値]
入力文字列が既に指定形式に正規化されていれば TRUE、そうでなければ FALSE
を返す。拡張エラー情報を取得するには、アプリケーションから GetLastError を呼ぶ。次のいずれかのエラーコードが返ることがある:
（以下省略）

[備考]
Windows XP および Windows Server 2003 では既にサポートされない。必要なヘッダーファイルと DLL は
Microsoft Internationalized Domain Name (IDN) Mitigation API
の一部であり、もうダウンロードできない。


%index
IsProcessInJob
プロセスが指定したジョブ内で実行されているかを判定する。
%group
Win32 kernel32
%prm
ProcessHandle, JobHandle, Result
ProcessHandle : [intptr] テスト対象のプロセスへのハンドル。ハンドルは PROCESS_QUERY_INFORMATION または PROCESS_QUERY_LIMITED_INFORMATION アクセス権を持っていなければならない。詳細は Process Security and Access Rights を参照のこと。Windows Server 2003 および Windows XP ではハンドルは PROCESS_QUERY_INFORMATION アクセス権を持っていなければならない。
JobHandle : [intptr] ジョブへのハンドル。NULL の場合、関数はプロセスが何らかのジョブ下で実行されているかをテストする。NULL でない場合、ハンドルは JOB_OBJECT_QUERY アクセス権を持っていなければならない。詳細は Job Object Security and Access Rights を参照のこと。
Result : [var] プロセスがそのジョブ内で実行されていれば TRUE、それ以外は FALSE を受け取る変数へのポインタ。
%inst
プロセスが指定したジョブ内で実行されているかを判定する。

[戻り値]
関数が成功した場合、戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
アプリケーションは、ジョブ オブジェクトの名前を知らない限り、自身が実行されているジョブ
オブジェクトのハンドルを取得できない。ただし、アプリケーションは QueryInformationJobObject 関数に NULL
を指定してジョブ オブジェクトの情報を取得できる。この関数を使うアプリケーションをコンパイルするには _WIN32_WINNT を
0x0501 以降に定義する。詳細は Using the Windows Headers を参照のこと。


%index
IsProcessorFeaturePresent
指定したプロセッサ機能が現在のコンピュータでサポートされているかを判定する。
%group
Win32 kernel32
%prm
ProcessorFeature
ProcessorFeature : [int] 
%inst
指定したプロセッサ機能が現在のコンピュータでサポートされているかを判定する。

[戻り値]
機能がサポートされていれば 0 以外の値を返す。サポートされていなければ 0 を返す。HAL
がその機能の検出をサポートしていない場合、ハードウェアがサポートしていても戻り値は 0 となる。

[備考]
``PF_SSSE3_INSTRUCTIONS_AVAILABLE`` から
``PF_AVX512F_INSTRUCTIONS_AVAILABLE`` までのサポートは Windows SDK (19041)
で追加され、Windows 10 Version 2004 (May 2020 Update)
以降でサポートされる。``PF_ERMS_AVAILABLE``、``PF_ARM_V82_DP_INSTRUCTIONS_AVAILABLE``、``PF_ARM_V83_JSCVT_INSTRUCTIONS_AVAILABLE``
のサポートは Windows SDK (20348) で追加され、Windows 11 および Windows Server 2022
でサポートされる。定義 ``PF_ARM_V83_LRCPC_INSTRUCTIONS_AVAILABLE`` は Windows SDK
(22621) で追加され、Windows 11 Version 22H2 でサポートされる。


%index
IsSystemResumeAutomatic
コンピュータの現在の状態を判定する。
%group
Win32 kernel32
%prm

%inst
コンピュータの現在の状態を判定する。

[戻り値]
システムが自動的に動作状態に復帰しユーザーがアクティブでない場合、関数は TRUE を返す。それ以外は FALSE を返す。

[備考]
PBT_APMRESUMEAUTOMATIC
イベントは、システムがイベント処理のために自動的に復帰したときにブロードキャストされる。通常ユーザーはその場にいない。PBT_APMRESUMEAUTOMATIC
イベントをブロードキャストした後にシステムがユーザーのアクティビティを検出すると、アプリケーションにユーザーとの完全な対話を再開してよいことを知らせるために
PBT_APMRESUMESUSPEND イベントがブロードキャストされる。


%index
IsThreadAFiber
現在のスレッドがファイバかを判定する。
%group
Win32 kernel32
%prm

%inst
現在のスレッドがファイバかを判定する。

[戻り値]
スレッドがファイバの場合は TRUE、それ以外は FALSE を返す。

[備考]
この関数を使うアプリケーションをコンパイルするには _WIN32_WINNT を 0x0600 以降に定義する。詳細は Using the
Windows Headers を参照のこと。


%index
IsValidCodePage
指定したコードページが有効かを判定する。
%group
Win32 kernel32
%prm
CodePage
CodePage : [int] チェックするコードページの識別子。
%inst
指定したコードページが有効かを判定する。

[戻り値]
コードページが有効であれば 0 以外の値を返し、無効であれば 0 を返す。

[備考]
コードページは OS にインストールされている場合にのみ有効と見なされる。Unicode が推奨される。Windows Vista
以降では、インストール可能なすべてのコードページが既定で読み込まれる。


%index
IsValidLanguageGroup
言語グループが OS にインストール済みまたはサポート済みかを判定する。詳細は NLS Terminology を参照のこと。
%group
Win32 kernel32
%prm
LanguageGroup, dwFlags
LanguageGroup : [int] 
dwFlags : [int] 
%inst
言語グループが OS にインストール済みまたはサポート済みかを判定する。詳細は NLS Terminology を参照のこと。

[戻り値]
言語グループ識別子が指定された有効性テストを通過すれば TRUE、そうでなければ FALSE を返す。

[備考]
LGRPID_INSTALLED フラグが指定され関数が TRUE を返す場合、言語グループ識別子は OS
でサポートされていてインストールされている。LGRPID_SUPPORTED フラグが指定され関数が TRUE
を返す場合、言語グループ識別子はリリースでサポートされているが、必ずしも OS にインストールされているとは限らない。


%index
IsValidLocale
指定したロケールが OS にインストール済みまたはサポート済みかを判定する。詳細は Locales and Languages を参照のこと。
%group
Win32 kernel32
%prm
Locale, dwFlags
Locale : [int] 検証するロケールのロケール識別子。MAKELCID マクロでロケール識別子を作成するか、次の定義済み値のいずれかを指定する。
dwFlags : [int] 
%inst
指定したロケールが OS にインストール済みまたはサポート済みかを判定する。詳細は Locales and Languages
を参照のこと。

[戻り値]
ロケール識別子が指定した有効性テストを通過すれば 0 以外の値を返す。成功しなかった場合は 0 を返す。

[備考]
LCID_INSTALLED フラグが指定され関数が 0 以外を返す場合、ロケール識別子は OS
でサポートされていてインストールされている。識別子がインストール済みであることは、示されたロケールに対する言語サポートがフル
レベルで使えることを意味する。フル サポートにはコードページ変換テーブル、キーボード レイアウト、フォント、ソートおよびロケール
データが含まれる。LCID_SUPPORTED が指定され関数が 0 を返す場合、ロケール識別子はリリースでサポートされているが、必ずしも
OS にインストールされているとは限らない。この関数はカスタム
ロケールのデータも扱える。データがコンピュータ間やアプリケーションの実行間で同じである保証はない。アプリケーションがデータを永続化または送信する必要がある場合は
Using Persistent Locale Data を参照のこと。


%index
IsValidLocaleName
指定したロケール名が OS にインストール済みまたはサポート済みのロケールに対して有効かを判定する。注: Windows Vista 以降のみで動作するアプリケーションは、補助ロケールの有効性判定のために IsValidLocale より先にこの関数を呼ぶべきである。
%group
Win32 kernel32
%prm
lpLocaleName
lpLocaleName : [wstr] 検証するロケール名へのポインタ。
%inst
指定したロケール名が OS にインストール済みまたはサポート済みのロケールに対して有効かを判定する。注: Windows Vista
以降のみで動作するアプリケーションは、補助ロケールの有効性判定のために IsValidLocale より先にこの関数を呼ぶべきである。

[戻り値]
ロケール名が有効であれば 0 以外の値を、無効であれば 0 を返す。

[備考]
Windows Vista 以降では、サポートされるロケールはすべての OS にインストールされているべきである。この関数はカスタム
ロケールの名前を扱える。データがコンピュータ間やアプリケーションの実行間で同じである保証はない。アプリケーションがデータを永続化または送信する必要がある場合は
Using Persistent Locale Data を参照のこと。Windows 8 以降: アプリケーションが
Windows.Globalization 名前空間から言語タグをこの関数に渡す場合、まず ResolveLocaleName
を呼んでタグを変換しなければならない。


%index
IsValidNLSVersion
NLS バージョンが指定した NLS 関数に対して有効かを判定する。
%group
Win32 kernel32
%prm
function, lpLocaleName, lpVersionInformation
function : [int] 問い合わせる NLS 機能。この値は COMPARE_STRING でなければならない。SYSNLS_FUNCTION 列挙体を参照のこと。
lpLocaleName : [wstr] ロケール名、または次の定義済み値のいずれかへのポインタ。
lpVersionInformation : [var] NLSVERSIONINFOEX 構造体へのポインタ。アプリケーションは dwNLSVersionInfoSize メンバを sizeof(NLSVERSIONINFOEX) に初期化しなければならない。
%inst
NLS バージョンが指定した NLS 関数に対して有効かを判定する。

[戻り値]
NLS バージョンが有効であれば 0 以外の値を、無効であれば 0 を返す。

[備考]
NLSVERSIONINFOEX 構造体は GetNLSVersionEx を呼んで初期化する。ソート
バージョンが変わったかやデータを再インデックスする必要があるかの判定に NLSVERSIONINFOEX のメンバをどう使うかについては
GetNLSVersionEx の Remarks を参照のこと。Windows 8 以降: アプリケーションが
Windows.Globalization 名前空間から言語タグをこの関数に渡す場合、まず ResolveLocaleName
を呼んでタグを変換しなければならない。


%index
IsWow64Process
指定したプロセスが WOW64 または Intel64/x64 プロセッサで実行されているかを判定する。
%group
Win32 kernel32
%prm
hProcess, Wow64Process
hProcess : [intptr] プロセスへのハンドル。ハンドルは PROCESS_QUERY_INFORMATION または PROCESS_QUERY_LIMITED_INFORMATION アクセス権を持っていなければならない。詳細は Process Security and Access Rights を参照のこと。Windows Server 2003 および Windows XP ではハンドルは PROCESS_QUERY_INFORMATION アクセス権を持っていなければならない。
Wow64Process : [var] プロセスが Intel64 または x64 プロセッサ上の WOW64 で実行されている場合に TRUE に設定される変数へのポインタ。32 ビット Windows 上で実行されている場合は FALSE に設定される。64 ビット Windows 10 on ARM 上で実行されている 32 ビット アプリケーションの場合も FALSE に設定される。64 ビット Windows 上で実行されている 64 ビット アプリケーションの場合も FALSE に設定される。
%inst
指定したプロセスが WOW64 または Intel64/x64 プロセッサで実行されているかを判定する。

[戻り値]
関数が成功した場合、戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
プロセスが WOW 下で実行されているかを判定するには、アプリケーションは IsWow64Process ではなく
IsWow64Process2 を使うべきである。IsWow64Process2
は、指定されたプロセスについてホストとゲストの両方のアーキテクチャを明示的に返すことで、複数の WOW
環境に内在するあいまいさを排除する。アプリケーションはこの情報によって、ARM64
上でのエミュレーション実行のような状況を確実に識別できる。この関数を使うアプリケーションをコンパイルするには _WIN32_WINNT を
0x0501 以降に定義する。詳細は Using the Windows Headers を参照のこと。


%index
K32EmptyWorkingSet
指定したプロセスのワーキング セットから可能な限り多くのページを取り除く。
%group
Win32 kernel32
%prm
hProcess
hProcess : [intptr] プロセスへのハンドル。ハンドルは PROCESS_QUERY_INFORMATION または PROCESS_QUERY_LIMITED_INFORMATION アクセス権と PROCESS_SET_QUOTA アクセス権を持っていなければならない。詳細は Process Security and Access Rights を参照のこと。
%inst
指定したプロセスのワーキング セットから可能な限り多くのページを取り除く。

[戻り値]
関数が成功した場合、戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
ワーキング セットは SetProcessWorkingSetSize または SetProcessWorkingSetSizeEx
関数を、dwMinimumWorkingSetSize と dwMaximumWorkingSetSize を (SIZE_T)(-1)
に設定して呼ぶことでも空にできる。Windows 7 および Windows Server 2008 R2 以降、Psapi.h は
PSAPI 関数のバージョン番号を定めている。PSAPI
バージョン番号は、関数を呼ぶときに使う名前とプログラムが読み込むライブラリに影響する。PSAPI_VERSION が 2
以上の場合、この関数は Psapi.h で K32EmptyWorkingSet として定義され、Kernel32.lib と
Kernel32.dll にエクスポートされる。PSAPI_VERSION が 1 の場合、Psapi.h で
K32EmptyWorkingSet として定義され、Psapi.lib と Psapi.dll に K32EmptyWorkingSet
を呼ぶラッパーとしてエクスポートされる。旧バージョンの Windows と Windows 7 以降の両方で動かすプログラムは常に
K32EmptyWorkingSet として呼ぶべきである。シンボルを正しく解決するためには、TARGETLIBS マクロに
Psapi.lib を追加し、-DPSAPI_VERSION=1 付きでコンパイルする。実行時動的リンクを使うには Psapi.dll
を読み込む。


%index
K32EnumDeviceDrivers
システム内の各デバイス ドライバの読み込みアドレスを取得する。
%group
Win32 kernel32
%prm
lpImageBase, cb, lpcbNeeded
lpImageBase : [var] デバイス ドライバの読み込みアドレスのリストを受け取る配列。
cb : [int] lpImageBase 配列のサイズ（バイト単位）。配列が読み込みアドレスを格納するのに不十分な場合、lpcbNeeded パラメータに必要なサイズが返る。
lpcbNeeded : [var] lpImageBase 配列に返されたバイト数。
%inst
システム内の各デバイス ドライバの読み込みアドレスを取得する。

[戻り値]
関数が成功した場合、戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
EnumDeviceDrivers の呼び出しで列挙されたデバイス ドライバの数を求めるには、lpcbNeeded の結果値を
sizeof(LPVOID) で割る。Windows 7 および Windows Server 2008 R2 以降、Psapi.h は
PSAPI 関数のバージョン番号を定めている。PSAPI
バージョン番号は、関数を呼ぶときに使う名前とプログラムが読み込むライブラリに影響する。PSAPI_VERSION が 2
以上の場合、この関数は Psapi.h で K32EnumDeviceDrivers として定義され、Kernel32.lib と
Kernel32.dll にエクスポートされる。PSAPI_VERSION が 1 の場合、Psapi.h で
EnumDeviceDrivers として定義され、Psapi.lib と Psapi.dll に
K32EnumDeviceDrivers を呼ぶラッパーとしてエクスポートされる。旧バージョンの Windows と Windows 7
以降の両方で動かすプログラムは常に EnumDeviceDrivers
として呼ぶべきである。シンボルを正しく解決するためには、TARGETLIBS マクロに Psapi.lib
を追加し、-DPSAPI_VERSION=1 付きでコンパイルする。実行時動的リンクを使うには Psapi.dll を読み込む。


%index
K32EnumPageFilesW
システムにインストールされた各ページファイルに対してコールバック ルーチンを呼ぶ。(ANSI)
%group
Win32 kernel32
%prm
pCallBackRoutine, pContext
pCallBackRoutine : [int] 各ページファイルごとに呼ばれるルーチンへのポインタ。詳細は EnumPageFilesProc を参照のこと。
pContext : [intptr] コールバック ルーチンに渡されるユーザー定義データ。
%inst
システムにインストールされた各ページファイルに対してコールバック ルーチンを呼ぶ。(ANSI)

[戻り値]
関数が成功した場合、戻り値は TRUE となる。関数が失敗した場合、戻り値は FALSE となる。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
Windows 7 および Windows Server 2008 R2 以降、Psapi.h は PSAPI
関数のバージョン番号を定めている。PSAPI
バージョン番号は、関数を呼ぶときに使う名前とプログラムが読み込むライブラリに影響する。PSAPI_VERSION が 2
以上の場合、この関数は Psapi.h で K32EnumPageFiles として定義され、Kernel32.lib と
Kernel32.dll にエクスポートされる。PSAPI_VERSION が 1 の場合、Psapi.h で EnumPageFiles
として定義され、Psapi.lib と Psapi.dll に K32EnumPageFiles
を呼ぶラッパーとしてエクスポートされる。旧バージョンの Windows と Windows 7 以降の両方で動かすプログラムは常に
EnumPageFiles として呼ぶべきである。シンボルを正しく解決するためには、TARGETLIBS マクロに Psapi.lib
を追加し、-DPSAPI_VERSION=1 付きでコンパイルする。実行時動的リンクを使うには Psapi.dll を読み込む。
> [!NOTE] > psapi.h ヘッダーは EnumPageFiles を、UNICODE プリプロセッサ定数の定義に基づいて
ANSI 版か Unicode
版を自動選択するエイリアスとして定義している。エンコーディング中立のエイリアスとそうでないコードを混在させると、コンパイルまたは実行時エラーになるミスマッチが発生することがある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照のこと。


%index
K32EnumProcessModules
指定したプロセス内の各モジュールのハンドルを取得する。
%group
Win32 kernel32
%prm
hProcess, lphModule, cb, lpcbNeeded
hProcess : [intptr] プロセスへのハンドル。
lphModule : [intptr] モジュール ハンドルのリストを受け取る配列。
cb : [int] lphModule 配列のサイズ（バイト単位）。
lpcbNeeded : [var] lphModule 配列にすべてのモジュール ハンドルを格納するのに必要なバイト数。
%inst
指定したプロセス内の各モジュールのハンドルを取得する。

[戻り値]
関数が成功した場合、戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
EnumProcessModules
関数は主にデバッガや、他プロセスからモジュール情報を抽出する類似アプリケーションでの使用を目的としている。ターゲット プロセスのモジュール
リストが壊れている、もしくはまだ初期化されていない、あるいは DLL の読み込み・アンロードの結果として関数呼び出し中にモジュール
リストが変わる場合、EnumProcessModules は失敗したり誤った情報を返すことがある。EnumProcessModules
を呼ぶ時点でプロセスにいくつモジュールが存在するか予測しにくいので、HMODULE
値の大きな配列を指定するのが望ましい。lphModule 配列がプロセスのすべてのモジュール
ハンドルを保持するのに小さすぎるかは、lpcbNeeded に返る値と cb で指定した値を比較して判断する。lpcbNeeded が
cb より大きければ配列のサイズを増やして EnumProcessModules を再度呼ぶ。EnumProcessModules
の呼び出しで列挙されたモジュールの数を求めるには、lpcbNeeded の結果値を sizeof(HMODULE)
で割る。EnumProcessModules は LOAD_LIBRARY_AS_DATAFILE
や類似のフラグで読み込まれたモジュールのハンドルは取得しない。詳細は LoadLibraryEx
を参照のこと。この関数が返すハンドルに対して CloseHandle
を呼んではならない。情報はスナップショットから得たものであり、解放すべきリソースはない。WOW64 上で実行される 32 ビット
アプリケーションからこの関数を呼ぶと、32 ビット プロセスのモジュールしか列挙できない。プロセスが 64 ビット
プロセスの場合、この関数は失敗し、直近のエラー コードは ERROR_PARTIAL_COPY (299)
になる。指定したプロセスと、それらが使うヒープ、モジュール、スレッドのスナップショットを撮るには
CreateToolhelp32Snapshot 関数を使う。Windows 7 および Windows Server 2008 R2
以降、Psapi.h は PSAPI 関数のバージョン番号を定めている。PSAPI
バージョン番号は、関数を呼ぶときに使う名前とプログラムが読み込むライブラリに影響する。PSAPI_VERSION が 2
以上の場合、この関数は Psapi.h で K32EnumProcessModules として定義され、Kernel32.lib と
Kernel32.dll にエクスポートされる。PSAPI_VERSION が 1 の場合、Psapi.h で
EnumProcessModules として定義され、Psapi.lib と Psapi.dll に
K32EnumProcessModules を呼ぶラッパーとしてエクスポートされる。旧バージョンの Windows と Windows 7
以降の両方で動かすプログラムは常に EnumProcessModules
として呼ぶべきである。シンボルを正しく解決するためには、TARGETLIBS マクロに Psapi.lib
を追加し、-DPSAPI_VERSION=1 付きでコンパイルする。実行時動的リンクを使うには Psapi.dll を読み込む。


%index
K32EnumProcessModulesEx
指定したプロセスで、指定したフィルタ条件を満たす各モジュールのハンドルを取得する。
%group
Win32 kernel32
%prm
hProcess, lphModule, cb, lpcbNeeded, dwFilterFlag
hProcess : [intptr] プロセスへのハンドル。
lphModule : [intptr] モジュール ハンドルのリストを受け取る配列。
cb : [int] lphModule 配列のサイズ（バイト単位）。
lpcbNeeded : [var] lphModule 配列にすべてのモジュール ハンドルを格納するのに必要なバイト数。
dwFilterFlag : [int] 
%inst
指定したプロセスで、指定したフィルタ条件を満たす各モジュールのハンドルを取得する。

[戻り値]
関数が成功した場合、戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
EnumProcessModulesEx
関数は主にデバッガや、他プロセスからモジュール情報を抽出する類似アプリケーションでの使用を目的としている。ターゲット プロセスのモジュール
リストが壊れている、もしくはまだ初期化されていない、あるいは DLL の読み込み・アンロードの結果として関数呼び出し中にモジュール
リストが変わる場合、EnumProcessModulesEx は失敗したり誤った情報を返すことがある。この関数は主に 64 ビット
アプリケーション向けである。WOW64 下で実行される 32 ビット アプリケーションから呼ぶと dwFilterFlag
オプションは無視され、関数は EnumProcessModules と同じ結果を返す。EnumProcessModulesEx
を呼ぶ時点でプロセスにいくつモジュールが存在するか予測しにくいので、HMODULE
値の大きな配列を指定するのが望ましい。lphModule 配列がプロセスのすべてのモジュール
ハンドルを保持するのに小さすぎるかは、lpcbNeeded に返る値と cb で指定した値を比較して判断する。lpcbNeeded が
cb より大きければ配列のサイズを増やして EnumProcessModulesEx を再度呼ぶ。EnumProcessModulesEx
の呼び出しで列挙されたモジュールの数を求めるには、lpcbNeeded の結果値を sizeof(HMODULE)
で割る。EnumProcessModulesEx は LOAD_LIBRARY_AS_DATAFILE
フラグで読み込まれたモジュールのハンドルは取得しない。詳細は LoadLibraryEx を参照のこと。この関数が返すハンドルに対して
CloseHandle
を呼んではならない。情報はスナップショットから得たものであり、解放すべきリソースはない。指定したプロセスと、それらが使うヒープ、モジュール、スレッドのスナップショットを撮るには
CreateToolhelp32Snapshot 関数を使う。Windows 7 および Windows Server 2008 R2
以降、Psapi.h は PSAPI 関数のバージョン番号を定めている。PSAPI
バージョン番号は、関数を呼ぶときに使う名前とプログラムが読み込むライブラリに影響する。PSAPI_VERSION が 2
以上の場合、この関数は Psapi.h で K32EnumProcessModulesEx として定義され、Kernel32.lib と
Kernel32.dll にエクスポートされる。PSAPI_VERSION が 1 の場合、Psapi.h で
EnumProcessModulesEx として定義され、Psapi.lib と Psapi.dll に
K32EnumProcessModulesEx を呼ぶラッパーとしてエクスポートされる。旧バージョンの Windows と Windows
7 以降の両方で動かすプログラムは常に EnumProcessModulesEx
として呼ぶべきである。シンボルを正しく解決するためには、TARGETLIBS マクロに Psapi.lib
を追加し、-DPSAPI_VERSION=1 付きでコンパイルする。実行時動的リンクを使うには Psapi.dll を読み込む。


%index
K32EnumProcesses
システム内の各プロセス オブジェクトのプロセス識別子を取得する。
%group
Win32 kernel32
%prm
lpidProcess, cb, lpcbNeeded
lpidProcess : [var] プロセス識別子のリストを受け取る配列へのポインタ。
cb : [int] pProcessIds 配列のサイズ（バイト単位）。
lpcbNeeded : [var] pProcessIds 配列に返されたバイト数。
%inst
システム内の各プロセス オブジェクトのプロセス識別子を取得する。

[戻り値]
関数が成功した場合、戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
EnumProcesses
を呼ぶ時点で何個プロセスが存在するかを予測しにくいため、大きな配列を使うのが望ましい。列挙されたプロセスの数を求めるには、lpcbNeeded
値を sizeof(DWORD)
で割る。バッファが小さすぎてすべてのプロセス識別子を格納できない場合でもその旨を示すものは無い。したがって、lpcbNeeded が cb
と等しい場合は、より大きな配列で再度呼ぶことを検討する。取得した識別子からプロセス ハンドルを取得するには OpenProcess
関数を呼ぶ。Windows 7 および Windows Server 2008 R2 以降、Psapi.h は PSAPI
関数のバージョン番号を定めている。PSAPI
バージョン番号は、関数を呼ぶときに使う名前とプログラムが読み込むライブラリに影響する。PSAPI_VERSION が 2
以上の場合、この関数は Psapi.h で K32EnumProcesses として定義され、Kernel32.lib と
Kernel32.dll にエクスポートされる。PSAPI_VERSION が 1 の場合、Psapi.h で EnumProcesses
として定義され、Psapi.lib と Psapi.dll に K32EnumProcesses
を呼ぶラッパーとしてエクスポートされる。旧バージョンの Windows と Windows 7 以降の両方で動かすプログラムは常に
EnumProcesses として呼ぶべきである。シンボルを正しく解決するためには、TARGETLIBS マクロに Psapi.lib
を追加し、-DPSAPI_VERSION=1 付きでコンパイルする。実行時動的リンクを使うには Psapi.dll を読み込む。


%index
K32GetDeviceDriverBaseNameW
指定したデバイス ドライバのベース名を取得する。(ANSI)
%group
Win32 kernel32
%prm
ImageBase, lpBaseName, nSize
ImageBase : [intptr] デバイス ドライバの読み込みアドレス。この値は EnumDeviceDrivers 関数で取得できる。
lpBaseName : [wstr] 
nSize : [int] lpBaseName バッファのサイズ（文字数単位）。バッファがベース名と終端 null 文字を収めるのに不足していれば、文字列は切り詰められる。
%inst
指定したデバイス ドライバのベース名を取得する。(ANSI)

[戻り値]
関数が成功した場合、戻り値はバッファにコピーされた文字列の長さ（終端 null 文字を除く）を指定する。関数が失敗した場合、戻り値は 0
となる。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
Windows 7 および Windows Server 2008 R2 以降、Psapi.h は PSAPI
関数のバージョン番号を定めている。PSAPI
バージョン番号は、関数を呼ぶときに使う名前とプログラムが読み込むライブラリに影響する。PSAPI_VERSION が 2
以上の場合、この関数は Psapi.h で K32GetDeviceDriverBaseName として定義され、Kernel32.lib
と Kernel32.dll にエクスポートされる。PSAPI_VERSION が 1 の場合、Psapi.h で
GetDeviceDriverBaseName として定義され、Psapi.lib と Psapi.dll に
K32GetDeviceDriverBaseName を呼ぶラッパーとしてエクスポートされる。旧バージョンの Windows と
Windows 7 以降の両方で動かすプログラムは常に GetDeviceDriverBaseName
として呼ぶべきである。シンボルを正しく解決するためには、TARGETLIBS マクロに Psapi.lib
を追加し、-DPSAPI_VERSION=1 付きでコンパイルする。実行時動的リンクを使うには Psapi.dll を読み込む。


%index
K32GetDeviceDriverFileNameW
指定したデバイス ドライバのパスを取得する。(Unicode)
%group
Win32 kernel32
%prm
ImageBase, lpFilename, nSize
ImageBase : [intptr] デバイス ドライバの読み込みアドレス。
lpFilename : [wstr] デバイス ドライバへのパスを受け取るバッファへのポインタ。
nSize : [int] lpFilename バッファのサイズ（文字数単位）。バッファがパスと終端 null 文字を収めるのに不足していれば、文字列は切り詰められる。
%inst
指定したデバイス ドライバのパスを取得する。(Unicode)

[戻り値]
関数が成功した場合、戻り値はバッファにコピーされた文字列の長さ（終端 null 文字を除く）を指定する。関数が失敗した場合、戻り値は 0
となる。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
Windows 7 および Windows Server 2008 R2 以降、Psapi.h は PSAPI
関数のバージョン番号を定めている。PSAPI
バージョン番号は、関数を呼ぶときに使う名前とプログラムが読み込むライブラリに影響する。PSAPI_VERSION が 2
以上の場合、この関数は Psapi.h で K32GetDeviceDriverFileName として定義され、Kernel32.lib
と Kernel32.dll にエクスポートされる。PSAPI_VERSION が 1 の場合、Psapi.h で
GetDeviceDriverFileName として定義され、Psapi.lib と Psapi.dll に
K32GetDeviceDriverFileName を呼ぶラッパーとしてエクスポートされる。旧バージョンの Windows と
Windows 7 以降の両方で動かすプログラムは常に GetDeviceDriverFileName
として呼ぶべきである。シンボルを正しく解決するためには、TARGETLIBS マクロに Psapi.lib
を追加し、-DPSAPI_VERSION=1 付きでコンパイルする。実行時動的リンクを使うには Psapi.dll を読み込む。
> [!NOTE] > psapi.h ヘッダーは GetDeviceDriverFileName を、UNICODE
プリプロセッサ定数の定義に基づいて ANSI 版か Unicode
版を自動選択するエイリアスとして定義している。エンコーディング中立のエイリアスとそうでないコードを混在させると、コンパイルまたは実行時エラーになるミスマッチが発生することがある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照のこと。


%index
K32GetMappedFileNameW
指定したアドレスが、指定したプロセスのアドレス空間内のメモリ マップト ファイル内にあるかをチェックする。ある場合、関数はそのメモリ マップト ファイルの名前を返す。(Unicode)
%group
Win32 kernel32
%prm
hProcess, lpv, lpFilename, nSize
hProcess : [intptr] プロセスへのハンドル。ハンドルは PROCESS_QUERY_INFORMATION アクセス権を持っていなければならない。詳細は Process Security and Access Rights を参照のこと。
lpv : [intptr] 検証するアドレス。
lpFilename : [wstr] lpv で指定したアドレスが属するメモリ マップト ファイルの名前を受け取るバッファへのポインタ。
nSize : [int] lpFilename バッファのサイズ（文字数単位）。
%inst
指定したアドレスが、指定したプロセスのアドレス空間内のメモリ マップト ファイル内にあるかをチェックする。ある場合、関数はそのメモリ
マップト ファイルの名前を返す。(Unicode)

[戻り値]
関数が成功した場合、戻り値はバッファにコピーされた文字列の長さ（文字数単位）を指定する。関数が失敗した場合、戻り値は 0
となる。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
Windows 7 および Windows Server 2008 R2 以降、Psapi.h は PSAPI
関数のバージョン番号を定めている。PSAPI
バージョン番号は、関数を呼ぶときに使う名前とプログラムが読み込むライブラリに影響する。PSAPI_VERSION が 2
以上の場合、この関数は Psapi.h で K32GetMappedFileName として定義され、Kernel32.lib と
Kernel32.dll にエクスポートされる。PSAPI_VERSION が 1 の場合、Psapi.h で
GetMappedFileName として定義され、Psapi.lib と Psapi.dll に
K32GetMappedFileName を呼ぶラッパーとしてエクスポートされる。旧バージョンの Windows と Windows 7
以降の両方で動かすプログラムは常に GetMappedFileName
として呼ぶべきである。シンボルを正しく解決するためには、TARGETLIBS マクロに Psapi.lib
を追加し、-DPSAPI_VERSION=1 付きでコンパイルする。実行時動的リンクを使うには Psapi.dll
を読み込む。Windows Server 2012 では、この関数は次のテクノロジでサポートされる。
（以下省略）


%index
K32GetModuleBaseNameW
指定したモジュールのベース名を取得する。(Unicode)
%group
Win32 kernel32
%prm
hProcess, hModule, lpBaseName, nSize
hProcess : [intptr] モジュールを含むプロセスへのハンドル。ハンドルは PROCESS_QUERY_INFORMATION と PROCESS_VM_READ アクセス権を持っていなければならない。詳細は Process Security and Access Rights を参照のこと。
hModule : [intptr] モジュールへのハンドル。NULL の場合、この関数は呼び出し側プロセスの作成に使われたファイルの名前を返す。
lpBaseName : [wstr] モジュールのベース名を受け取るバッファへのポインタ。ベース名が nSize パラメータで指定した最大文字数より長ければ切り詰められる。
nSize : [int] lpBaseName バッファのサイズ（文字数単位）。
%inst
指定したモジュールのベース名を取得する。(Unicode)

[戻り値]
関数が成功した場合、戻り値はバッファにコピーされた文字列の長さ（文字数単位）を指定する。関数が失敗した場合、戻り値は 0
となる。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
GetModuleBaseName
関数は主にデバッガや、他プロセスからモジュール情報を抽出する類似アプリケーションでの使用を目的としている。ターゲット プロセスのモジュール
リストが壊れている、もしくはまだ初期化されていない、あるいは DLL の読み込み・アンロードの結果として関数呼び出し中にモジュール
リストが変わる場合、GetModuleBaseName は失敗したり誤った情報を返すことがある。
現在のプロセス内のモジュールのベース名を取得するには、GetModuleFileName
関数でモジュールの完全な名前を取得し、strrchr(szmodulename, '\\')
のような関数呼び出しでモジュール名文字列内のベース名の先頭までスキャンする。これは現在のプロセスのハンドルを指定して
GetModuleBaseName を呼ぶよりも効率的かつ信頼性が高い。
リモート プロセスのメイン実行可能モジュールのベース名を取得するには、GetProcessImageFileName または
QueryFullProcessImageName 関数でモジュール名を取得し、前段落と同様に strrchr 関数を使う。これは
NULL のモジュール ハンドルを指定して GetModuleBaseName を呼ぶよりも効率的かつ信頼性が高い。
GetModuleBaseName 関数は LOAD_LIBRARY_AS_DATAFILE
フラグで読み込まれたモジュールのベース名は取得しない。詳細は LoadLibraryEx を参照のこと。Windows 7 および
Windows Server 2008 R2 以降、Psapi.h は PSAPI 関数のバージョン番号を定めている。PSAPI
バージョン番号は、関数を呼ぶときに使う名前とプログラムが読み込むライブラリに影響する。PSAPI_VERSION が 2
以上の場合、この関数は Psapi.h で K32GetModuleBaseName として定義され、Kernel32.lib と
Kernel32.dll にエクスポートされる。PSAPI_VERSION が 1 の場合、Psapi.h で
GetModuleBaseName として定義され、Psapi.lib と Psapi.dll に
K32GetModuleBaseName を呼ぶラッパーとしてエクスポートされる。旧バージョンの Windows と Windows 7
以降の両方で動かすプログラムは常に GetModuleBaseName
として呼ぶべきである。シンボルを正しく解決するためには、TARGETLIBS マクロに Psapi.lib
を追加し、-DPSAPI_VERSION=1 付きでコンパイルする。実行時動的リンクを使うには Psapi.dll を読み込む。


%index
K32GetModuleFileNameExW
指定したモジュールを含むファイルの完全修飾パスを取得する。(Unicode)
%group
Win32 kernel32
%prm
hProcess, hModule, lpFilename, nSize
hProcess : [intptr] モジュールを含むプロセスへのハンドル。ハンドルは PROCESS_QUERY_INFORMATION と PROCESS_VM_READ アクセス権を持っていなければならない。詳細は Process Security and Access Rights を参照のこと。Windows 10 以降、Windows Server 2016 以降: hModule パラメータが NULL の場合、ハンドルは PROCESS_QUERY_LIMITED_INFORMATION アクセス権だけで足りる。GetModuleFileNameEx 関数は LOAD_LIBRARY_AS_DATAFILE フラグで読み込まれたモジュールのパスは取得しない。詳細は LoadLibraryEx を参照のこと。
hModule : [intptr] モジュールへのハンドル。NULL の場合、GetModuleFileNameEx は hProcess で指定したプロセスの実行可能ファイルのパスを返す。
lpFilename : [wstr] モジュールの完全修飾パスを受け取るバッファへのポインタ。ファイル名のサイズが nSize パラメータの値より大きい場合、関数は成功するがファイル名は切り詰められ null 終端される。
nSize : [int] lpFilename バッファのサイズ（文字数単位）。
%inst
指定したモジュールを含むファイルの完全修飾パスを取得する。(Unicode)

[戻り値]
関数が成功した場合、戻り値はバッファにコピーされた文字列の長さを指定する。関数が失敗した場合、戻り値は 0
となる。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
GetModuleFileNameEx
関数は主にデバッガや、他プロセスからモジュール情報を抽出する類似アプリケーションでの使用を目的としている。ターゲット プロセスのモジュール
リストが壊れている、もしくはまだ初期化されていない、あるいは DLL の読み込み・アンロードの結果として関数呼び出し中にモジュール
リストが変わる場合、GetModuleFileNameEx
は失敗したり誤った情報を返すことがある。現在のプロセス内のモジュールの名前を取得するには GetModuleFileName
関数を使う。これは現在のプロセスのハンドルを指定して GetModuleFileNameEx を呼ぶよりも効率的かつ信頼性が高い。リモート
プロセスのメイン実行可能モジュールの名前を取得するには GetProcessImageFileName または
QueryFullProcessImageName 関数を使う。これは NULL のモジュール ハンドルを指定して
GetModuleFileNameEx を呼ぶよりも効率的かつ信頼性が高い。Windows 7 および Windows Server
2008 R2 以降、Psapi.h は PSAPI 関数のバージョン番号を定めている。PSAPI
バージョン番号は、関数を呼ぶときに使う名前とプログラムが読み込むライブラリに影響する。PSAPI_VERSION が 2
以上の場合、この関数は Psapi.h で K32GetModuleFileNameEx として定義され、Kernel32.lib と
Kernel32.dll にエクスポートされる。PSAPI_VERSION が 1 の場合、Psapi.h で
GetModuleFileNameEx として定義され、Psapi.lib と Psapi.dll に
K32GetModuleFileNameEx を呼ぶラッパーとしてエクスポートされる。旧バージョンの Windows と Windows
7 以降の両方で動かすプログラムは常に GetModuleFileNameEx
として呼ぶべきである。シンボルを正しく解決するためには、TARGETLIBS マクロに Psapi.lib
を追加し、-DPSAPI_VERSION=1 付きでコンパイルする。実行時動的リンクを使うには Psapi.dll を読み込む。


%index
K32GetModuleInformation
指定したモジュールに関する情報を MODULEINFO 構造体で取得する。
%group
Win32 kernel32
%prm
hProcess, hModule, lpmodinfo, cb
hProcess : [intptr] モジュールを含むプロセスへのハンドル。ハンドルは PROCESS_QUERY_INFORMATION と PROCESS_VM_READ アクセス権を持っていなければならない。詳細は Process Security and Access Rights を参照のこと。
hModule : [intptr] モジュールへのハンドル。
lpmodinfo : [var] モジュールに関する情報を受け取る MODULEINFO 構造体へのポインタ。
cb : [int] MODULEINFO 構造体のサイズ（バイト単位）。
%inst
指定したモジュールに関する情報を MODULEINFO 構造体で取得する。

[戻り値]
関数が成功した場合、戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
呼び出し側プロセスの情報を取得するには、GetCurrentProcess が返すハンドルを渡す。GetModuleInformation
関数は LOAD_LIBRARY_AS_DATAFILE フラグで読み込まれたモジュールの情報は取得しない。詳細は
LoadLibraryEx を参照のこと。Windows 7 および Windows Server 2008 R2 以降、Psapi.h
は PSAPI 関数のバージョン番号を定めている。PSAPI
バージョン番号は、関数を呼ぶときに使う名前とプログラムが読み込むライブラリに影響する。PSAPI_VERSION が 2
以上の場合、この関数は Psapi.h で K32GetModuleInformation として定義され、Kernel32.lib と
Kernel32.dll にエクスポートされる。PSAPI_VERSION が 1 の場合、Psapi.h で
K32GetModuleInformation として定義され、Psapi.lib と Psapi.dll に
K32GetModuleInformation を呼ぶラッパーとしてエクスポートされる。旧バージョンの Windows と Windows
7 以降の両方で動かすプログラムは常に K32GetModuleInformation
として呼ぶべきである。シンボルを正しく解決するためには、TARGETLIBS マクロに Psapi.lib
を追加し、-DPSAPI_VERSION=1 付きでコンパイルする。実行時動的リンクを使うには Psapi.dll を読み込む。


%index
K32GetPerformanceInfo
PERFORMANCE_INFORMATION 構造体に含まれるパフォーマンス値を取得する。
%group
Win32 kernel32
%prm
pPerformanceInformation, cb
pPerformanceInformation : [var] パフォーマンス情報を受け取る PERFORMANCE_INFORMATION 構造体へのポインタ。
cb : [int] PERFORMANCE_INFORMATION 構造体のサイズ（バイト単位）。
%inst
PERFORMANCE_INFORMATION 構造体に含まれるパフォーマンス値を取得する。

[戻り値]
関数が成功した場合、戻り値は TRUE となる。関数が失敗した場合、戻り値は FALSE となる。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
Windows 7 および Windows Server 2008 R2 以降、Psapi.h は PSAPI
関数のバージョン番号を定めている。PSAPI
バージョン番号は、関数を呼ぶときに使う名前とプログラムが読み込むライブラリに影響する。PSAPI_VERSION が 2
以上の場合、この関数は Psapi.h で K32GetPerformanceInfo として定義され、Kernel32.lib と
Kernel32.dll にエクスポートされる。PSAPI_VERSION が 1 の場合、Psapi.h で
GetPerformanceInfo として定義され、Psapi.lib と Psapi.dll に
K32GetPerformanceInfo を呼ぶラッパーとしてエクスポートされる。旧バージョンの Windows と Windows 7
以降の両方で動かすプログラムは常に GetPerformanceInfo
として呼ぶべきである。シンボルを正しく解決するためには、TARGETLIBS マクロに Psapi.lib
を追加し、-DPSAPI_VERSION=1 付きでコンパイルする。実行時動的リンクを使うには Psapi.dll を読み込む。


%index
K32GetProcessImageFileNameW
(no summary)
%group
Win32 kernel32
%prm
hProcess, lpImageFileName, nSize
hProcess : [intptr] 
lpImageFileName : [wstr] 
nSize : [int] 
%inst



%index
K32GetProcessMemoryInfo
指定したプロセスのメモリ使用量に関する情報を取得する。
%group
Win32 kernel32
%prm
Process, ppsmemCounters, cb
Process : [intptr] プロセスへのハンドル。ハンドルは **PROCESS_QUERY_INFORMATION** または **PROCESS_QUERY_LIMITED_INFORMATION** アクセス権を持っていなければならない。詳細は Process Security and Access Rights を参照のこと。**Windows Server 2003 および Windows XP では** ハンドルは **PROCESS_QUERY_INFORMATION** と **PROCESS_VM_READ** アクセス権を持っていなければならない。
ppsmemCounters : [var] プロセスのメモリ使用量に関する情報を受け取る PROCESS_MEMORY_COUNTERS または PROCESS_MEMORY_COUNTERS_EX 構造体へのポインタ。
cb : [int] ppsmemCounters 構造体のサイズ（バイト単位）。
%inst
指定したプロセスのメモリ使用量に関する情報を取得する。

[戻り値]
関数が成功した場合、戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
Windows 7 および Windows Server 2008 R2 以降、Psapi.h は PSAPI
関数のバージョン番号を定めている。PSAPI
バージョン番号は、関数を呼ぶときに使う名前とプログラムが読み込むライブラリに影響する。**PSAPI_VERSION** が 2
以上の場合、この関数は Psapi.h で **K32GetProcessMemoryInfo**
として定義され、Kernel32.lib と Kernel32.dll にエクスポートされる。**PSAPI_VERSION** が 1
の場合、Psapi.h で **GetProcessMemoryInfo** として定義され、Psapi.lib と Psapi.dll
に **K32GetProcessMemoryInfo** を呼ぶラッパーとしてエクスポートされる。旧バージョンの Windows と
Windows 7 以降の両方で動かすプログラムは常に **GetProcessMemoryInfo**
として呼ぶべきである。シンボルを正しく解決するためには、**TARGETLIBS** マクロに Psapi.lib
を追加し、**-DPSAPI_VERSION=1** 付きでコンパイルする。実行時動的リンクを使うには Psapi.dll を読み込む。


%index
K32GetWsChanges
この関数または InitializeProcessForWsWatch 関数が最後に呼ばれて以降、指定したプロセスのワーキング セットに追加されたページに関する情報を取得する。
%group
Win32 kernel32
%prm
hProcess, lpWatchInfo, cb
hProcess : [intptr] プロセスへのハンドル。ハンドルは PROCESS_QUERY_INFORMATION アクセス権を持っていなければならない。詳細は Process Security and Access Rights を参照のこと。
lpWatchInfo : [var] PSAPI_WS_WATCH_INFORMATION 構造体の配列を受け取る、ユーザーが確保したバッファへのポインタ。配列は FaultingPc メンバが NULL の構造体で終端される。
cb : [int] lpWatchInfo バッファのサイズ（バイト単位）。
%inst
この関数または InitializeProcessForWsWatch 関数が最後に呼ばれて以降、指定したプロセスのワーキング
セットに追加されたページに関する情報を取得する。

[戻り値]
関数が成功した場合、戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼ぶ。
lpWatchInfo バッファがすべてのワーキング セット変更レコードを収めるのに十分大きくない場合、GetLastError は
ERROR_INSUFFICIENT_BUFFER を返し、バッファは空で返される。より大きなメモリ
ブロックを再確保して再度呼び出すこと。

[備考]
OS はワーキング セット変更レコードの保持にプロセスごとに 1
つのバッファを使う。複数のアプリケーション（または同一アプリケーション内の複数スレッド）が同じプロセス
ハンドルでこの関数を呼ぶと、各呼び出しがバッファを空にするため、どのアプリケーションもワーキング
セット変更の完全な内訳を取得できない。OS
は問い合わせ処理中（バッファを空にしている間）は新しい変更レコードを記録しない。別の問い合わせ処理中に並行問い合わせを受けた場合、関数はエラー
コードを NO_MORE_ENTRIES に設定する。バッファが一杯になると、この関数または
InitializeProcessForWsWatch
関数が呼ばれるまで新しいレコードはバッファに追加されない。データの損失を防ぐためにこのメソッドは十分な頻度で呼ぶべきである。レコードが失われた場合、配列は
FaultingPc メンバが NULL で FaultingVa
メンバが失われたレコード数に設定された構造体で終端される。Windows Server 2003 および Windows XP
では、レコードが失われた場合、配列は FaultingPc が NULL で FaultingVa が 1
の構造体で終端される。Windows 7 および Windows Server 2008 R2 以降、Psapi.h は PSAPI
関数のバージョン番号を定めている。PSAPI
バージョン番号は、関数を呼ぶときに使う名前とプログラムが読み込むライブラリに影響する。PSAPI_VERSION が 2
以上の場合、この関数は Psapi.h で K32GetWsChanges として定義され、Kernel32.lib と
Kernel32.dll にエクスポートされる。PSAPI_VERSION が 1 の場合、Psapi.h で GetWsChanges
として定義され、Psapi.lib と Psapi.dll に K32GetWsChanges
を呼ぶラッパーとしてエクスポートされる。旧バージョンの Windows と Windows 7 以降の両方で動かすプログラムは常に
GetWsChanges として呼ぶべきである。シンボルを正しく解決するためには、TARGETLIBS マクロに Psapi.lib
を追加し、-DPSAPI_VERSION=1 付きでコンパイルする。実行時動的リンクを使うには Psapi.dll を読み込む。


%index
K32GetWsChangesEx
この関数または InitializeProcessForWsWatch 関数が最後に呼ばれて以降、指定したプロセスのワーキング セットに追加されたページに関する拡張情報を取得する。
%group
Win32 kernel32
%prm
hProcess, lpWatchInfoEx, cb
hProcess : [intptr] プロセスへのハンドル。ハンドルは PROCESS_QUERY_INFORMATION アクセス権を持っていなければならない。詳細は Process Security and Access Rights を参照のこと。
lpWatchInfoEx : [var] PSAPI_WS_WATCH_INFORMATION_EX 構造体の配列を受け取る、ユーザーが確保したバッファへのポインタ。配列は FaultingPc メンバが NULL の構造体で終端される。
cb : [var] lpWatchInfoEx バッファのサイズ（バイト単位）。
%inst
この関数または InitializeProcessForWsWatch 関数が最後に呼ばれて以降、指定したプロセスのワーキング
セットに追加されたページに関する拡張情報を取得する。

[戻り値]
関数が成功した場合、戻り値は 0 以外となる。
関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには GetLastError 関数を呼ぶ。lpWatchInfoEx
バッファがすべてのワーキング セット変更レコードを収めるのに十分大きくない場合、GetLastError は
ERROR_INSUFFICIENT_BUFFER を返し、バッファは空で返される。より大きなメモリ
ブロックを再確保して再度呼び出すこと。

[備考]
OS はワーキング セット変更レコードの保持にプロセスごとに 1
つのバッファを使う。複数のアプリケーション（または同一アプリケーション内の複数スレッド）が同じプロセス
ハンドルでこの関数を呼ぶと、各呼び出しがバッファを空にするため、どのアプリケーションもワーキング
セット変更の完全な内訳を取得できない。OS
は問い合わせ処理中（バッファを空にしている間）は新しい変更レコードを記録しない。別の問い合わせ処理中に並行問い合わせを受けた場合、この関数はエラー
コードを NO_MORE_ENTRIES に設定する。バッファが一杯になると、この関数または
InitializeProcessForWsWatch 関数が呼ばれるまで新しいレコードはバッファに追加されない。データの損失を防ぐために
GetWsChangesEx は十分な頻度で呼ぶべきである。レコードが失われた場合、配列は FaultingPc メンバが NULL で
FaultingVa メンバが失われたレコード数に設定された構造体で終端される。Windows 7 および Windows Server
2008 R2 以降、Psapi.h は PSAPI 関数のバージョン番号を定めている。PSAPI
バージョン番号は、関数を呼ぶときに使う名前とプログラムが読み込むライブラリに影響する。PSAPI_VERSION が 2
以上の場合、この関数は Psapi.h で K32GetWsChangesEx として定義され、Kernel32.lib と
Kernel32.dll にエクスポートされる。PSAPI_VERSION が 1 の場合、Psapi.h で
GetWsChangesEx として定義され、Psapi.lib と Psapi.dll に K32GetWsChangesEx
を呼ぶラッパーとしてエクスポートされる。旧バージョンの Windows と Windows 7 以降の両方で動かすプログラムは常に
GetWsChangesEx として呼ぶべきである。シンボルを正しく解決するためには、TARGETLIBS マクロに Psapi.lib
を追加し、-DPSAPI_VERSION=1 付きでコンパイルする。実行時動的リンクを使うには Psapi.dll を読み込む。


%index
K32InitializeProcessForWsWatch
指定したプロセスのワーキング セットの監視を開始する。
%group
Win32 kernel32
%prm
hProcess
hProcess : [intptr] プロセスへのハンドル。ハンドルは PROCESS_QUERY_INFORMATION アクセス権を持っていなければならない。詳細は Process Security and Access Rights を参照のこと。
%inst
指定したプロセスのワーキング セットの監視を開始する。

[戻り値]
関数が成功した場合、戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
Windows 7 および Windows Server 2008 R2 以降、Psapi.h は PSAPI
関数のバージョン番号を定めている。PSAPI
バージョン番号は、関数を呼ぶときに使う名前とプログラムが読み込むライブラリに影響する。PSAPI_VERSION が 2
以上の場合、この関数は Psapi.h で K32InitializeProcessForWsWatch
として定義され、Kernel32.lib と Kernel32.dll にエクスポートされる。PSAPI_VERSION が 1
の場合、Psapi.h で InitializeProcessForWsWatch として定義され、Psapi.lib と
Psapi.dll に K32InitializeProcessForWsWatch
を呼ぶラッパーとしてエクスポートされる。旧バージョンの Windows と Windows 7 以降の両方で動かすプログラムは常に
InitializeProcessForWsWatch として呼ぶべきである。シンボルを正しく解決するためには、TARGETLIBS
マクロに Psapi.lib を追加し、-DPSAPI_VERSION=1 付きでコンパイルする。実行時動的リンクを使うには
Psapi.dll を読み込む。


%index
K32QueryWorkingSet
指定したプロセスのワーキング セットに現在追加されているページに関する情報を取得する。
%group
Win32 kernel32
%prm
hProcess, pv, cb
hProcess : [intptr] プロセスへのハンドル。ハンドルは PROCESS_QUERY_INFORMATION と PROCESS_VM_READ アクセス権を持っていなければならない。詳細は Process Security and Access Rights を参照のこと。
pv : [intptr] 情報を受け取るバッファへのポインタ。詳細は PSAPI_WORKING_SET_INFORMATION を参照のこと。pv が指すバッファがターゲット プロセスのすべてのワーキング セット エントリを収めるのに十分でない場合、関数は ERROR_BAD_LENGTH で失敗する。この場合、PSAPI_WORKING_SET_INFORMATION 構造体の NumberOfEntries メンバは必要なエントリ数に設定されるが、関数はワーキング セット エントリの情報を返さない。
cb : [int] pv バッファのサイズ（バイト単位）。
%inst
指定したプロセスのワーキング セットに現在追加されているページに関する情報を取得する。

[戻り値]
関数が成功した場合、戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
Windows 7 および Windows Server 2008 R2 以降、Psapi.h は PSAPI
関数のバージョン番号を定めている。PSAPI
バージョン番号は、関数を呼ぶときに使う名前とプログラムが読み込むライブラリに影響する。PSAPI_VERSION が 2
以上の場合、この関数は Psapi.h で K32QueryWorkingSet として定義され、Kernel32.lib と
Kernel32.dll にエクスポートされる。PSAPI_VERSION が 1 の場合、Psapi.h で
QueryWorkingSet として定義され、Psapi.lib と Psapi.dll に K32QueryWorkingSet
を呼ぶラッパーとしてエクスポートされる。旧バージョンの Windows と Windows 7 以降の両方で動かすプログラムは常に
QueryWorkingSet として呼ぶべきである。シンボルを正しく解決するためには、TARGETLIBS マクロに Psapi.lib
を追加し、-DPSAPI_VERSION=1 付きでコンパイルする。実行時動的リンクを使うには Psapi.dll を読み込む。


%index
K32QueryWorkingSetEx
指定したプロセスのアドレス空間内の特定の仮想アドレスにあるページに関する拡張情報を取得する。
%group
Win32 kernel32
%prm
hProcess, pv, cb
hProcess : [intptr] プロセスへのハンドル。ハンドルは PROCESS_QUERY_INFORMATION アクセス権を持っていなければならない。詳細は Process Security and Access Rights を参照のこと。
pv : [intptr] PSAPI_WORKING_SET_EX_INFORMATION 構造体の配列へのポインタ。入力時、配列の各要素は関心のある仮想アドレスを指定する。出力時、配列の各要素は対応する仮想ページに関する情報を受け取る。
cb : [int] pv バッファのサイズ（バイト単位）。
%inst
指定したプロセスのアドレス空間内の特定の仮想アドレスにあるページに関する拡張情報を取得する。

[戻り値]
関数が成功した場合、戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
ターゲット プロセスのワーキング セットに限定される QueryWorkingSet 関数と異なり、QueryWorkingSetEx
関数は、プロセスのワーキング セットには入っていないがプロセスの一部であるアドレス（AWE
や巨大ページなど）の問い合わせにも使える。Windows 7 および Windows Server 2008 R2 以降、Psapi.h
は PSAPI 関数のバージョン番号を定めている。PSAPI
バージョン番号は、関数を呼ぶときに使う名前とプログラムが読み込むライブラリに影響する。PSAPI_VERSION が 2
以上の場合、この関数は Psapi.h で K32QueryWorkingSetEx として定義され、Kernel32.lib と
Kernel32.dll にエクスポートされる。PSAPI_VERSION が 1 の場合、Psapi.h で
QueryWorkingSetEx として定義され、Psapi.lib と Psapi.dll に
K32QueryWorkingSetEx を呼ぶラッパーとしてエクスポートされる。旧バージョンの Windows と Windows 7
以降の両方で動かすプログラムは常に QueryWorkingSetEx
として呼ぶべきである。シンボルを正しく解決するためには、TARGETLIBS マクロに Psapi.lib
を追加し、"?DPSAPI_VERSION=1" 付きでコンパイルする。実行時動的リンクを使うには Psapi.dll を読み込む。


%index
LCIDToLocaleName
ロケール識別子をロケール名に変換する。
%group
Win32 kernel32
%prm
Locale, lpName, cchName, dwFlags
Locale : [int] 変換するロケール識別子。MAKELCID マクロでロケール識別子を作成するか、次の定義済み値のいずれかを指定する。
lpName : [wstr] この関数がロケール名を取得するバッファへのポインタ、または次の定義済み値のいずれか。
cchName : [int] ロケール名バッファのサイズ（文字数単位）。ロケール名の最大長は終端 null 文字を含めて LOCALE_NAME_MAX_LENGTH である。これがこのパラメータに指定する推奨サイズである。代わりにアプリケーションはこのパラメータを 0 に設定でき、この場合関数はロケール名バッファに必要なサイズを返す。
dwFlags : [int] Windows 7 より前では予約されており常に 0 であるべき。Windows 7 以降では LOCALE_ALLOW_NEUTRAL_NAMES を指定して中立名の返却を許可できる。
%inst
ロケール識別子をロケール名に変換する。

[戻り値]
成功した場合、ロケール名の文字数（終端 null 文字を含む）を返す。関数が成功して cchName の値が 0
の場合、戻り値はロケール名バッファに必要なサイズ（null を含む文字数単位）となる。成功しなかった場合は 0
を返す。拡張エラー情報を取得するには、アプリケーションから GetLastError を呼ぶ。次のいずれかのエラーコードが返ることがある:
（以下省略）


%index
LCMapStringW
識別子で指定されたロケールに対し、入力文字列を指定した変換で別の文字列へマップするか、入力文字列のソート キーを生成する。(Unicode)
%group
Win32 kernel32
%prm
Locale, dwMapFlags, lpSrcStr, cchSrc, lpDestStr, cchDest
Locale : [int] ロケールを指定するロケール識別子。MAKELCID マクロでロケール識別子を作成するか、次の定義済み値のいずれかを指定する。
dwMapFlags : [int] 文字列マッピングで使う変換の種類、または生成するソート キーの種類を指定するフラグ。詳細は LCMapStringEx の dwMapFlags パラメータを参照のこと。
lpSrcStr : [wstr] 関数がマップまたはソート キー生成に使う変換元文字列へのポインタ。この文字列のサイズは 0 にできない。
cchSrc : [int] lpSrcStr が示す変換元文字列のサイズ（文字数単位）。変換元文字列のサイズには終端 null 文字を含めてもよいが、含めなくてもよい。終端 null 文字はソート不可能な文字として扱われ常に自分自身にマップされるため、含めても関数のマッピング動作に大きな影響はない。アプリケーションはこのパラメータに任意の負の値を指定して、変換元文字列が null 終端であることを示せる。この場合、LCMapString が文字列マッピング モードで使われているなら、関数は文字列長を自身で計算し、lpDestStr が示す変換後文字列を null 終端する。このパラメータを 0 にはできない。
lpDestStr : [wstr] この関数が変換後文字列またはソート キーを取得するバッファへのポインタ。アプリケーションがソート キー生成 (LCMAP_SORTKEY) に使う場合: - ソート キーはバッファに格納され、不透明なバイト配列として扱われる。格納値には任意の位置に 0 バイトが埋め込まれることがある。- 変換先文字列には奇数バイトが含まれることがある。LCMAP_BYTEREV フラグは偶数バイトのみを反転し、ソート キーの最後のバイト（奇数位置）は反転されない。呼び出し側が文字列の一部を明示的に要求した場合、cchDest で指定しない限り変換先文字列には終端 null 文字が含まれない。関数が失敗すると、変換先バッファには部分結果または何の結果も含まれないことがある。この場合、すべての結果を無効と見なすべきである。> [!NOTE] > LCMAP_UPPERCASE や LCMAP_LOWERCASE を設定するとき、変換先文字列は変換元文字列と同じバッファを使える。しかし、状況によってケース変換後の文字列の長さが変わる可能性があるため、これは強く非推奨である。
cchDest : [int] lpDestStr が示す変換先文字列のサイズ（文字数単位）。文字列マッピングに使う場合、このパラメータには文字数を指定する。cchSrc に終端 null 文字のための領域を含める場合、cchDest にも終端 null 文字のための領域を含めなければならない。ソート キー生成に使う場合はバイト数を指定する。このバイト数にはソート キーの 0x00 終端の領域を含めなければならない。cchDest を 0 にできる。この場合、関数は lpDestStr パラメータを使わず、変換後文字列またはソート キーに必要なバッファサイズを返す。
%inst
識別子で指定されたロケールに対し、入力文字列を指定した変換で別の文字列へマップするか、入力文字列のソート
キーを生成する。(Unicode)

[戻り値]
文字列マッピング用途で成功した場合、変換後文字列の文字数を返す（詳細は *cchSrc* および *cchDest*
を参照のこと）。ソート キー生成用途で成功した場合、ソート キーのバイト数を返す。成功しなかった場合は 0
を返す。拡張エラー情報を取得するには、アプリケーションから GetLastError を呼ぶ。次のいずれかのエラーコードが返ることがある:
（以下省略）

[備考]
LCMapStringEx の Remarks を参照のこと。LCMapString の ANSI
版は、指定したロケールに関連付けられた既定の Windows (ANSI) コードページを基に Unicode
との間で文字列をマップする。この関数の ANSI 版が Unicode 専用ロケールで使われた場合、OS はシステム既定の Windows
ANSI コードページを表す CP_ACP を使うので、関数は成功することがある。しかし、システム
コードページで未定義の文字は文字列内に疑問符 (?) として現れる。
> [!NOTE] > winnls.h ヘッダーは LCMapString を、UNICODE プリプロセッサ定数の定義に基づいて
ANSI 版か Unicode
版を自動選択するエイリアスとして定義している。エンコーディング中立のエイリアスとそうでないコードを混在させると、コンパイルまたは実行時エラーになるミスマッチが発生することがある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照のこと。


%index
LCMapStringEx
名前で指定されたロケールに対し、入力文字列を指定した変換で別の文字列へマップするか、入力文字列のソート キーを生成する。注: Windows Vista 以降のみで動作するよう設計されているアプリケーションは、LCMapString よりこの関数を優先して呼ぶべきである。
%group
Win32 kernel32
%prm
lpLocaleName, dwMapFlags, lpSrcStr, cchSrc, lpDestStr, cchDest, lpVersionInformation, lpReserved, sortHandle
lpLocaleName : [wstr] ロケール名、または次の定義済み値のいずれかへのポインタ。
dwMapFlags : [int] 文字列マッピングで使う変換の種類、または生成するソート キーの種類を指定するフラグ。このパラメータには次の値を指定できる。| フラグ | 意味 | | --- | --- | | **LCMAP_BYTEREV**| バイト反転を使う。例えば、アプリケーションが 0x3450 0x4822 を渡すと結果は 0x5034 0x2248 となる。 | | **LCMAP_FULLWIDTH** | 該当する場合に Unicode（全角）文字を使う。このフラグと LCMAP_HALFWIDTH は相互排他である。このフラグを指定すると、入力文字が既に全角であっても Normalization Form C が使われる場合がある。例えば、（既に全角の）"は゛" は "ば" に正規化される。[Unicode 正規化形式](http://www.unicode.org/reports/tr15/) を参照のこと。| |**LCMAP_HALFWIDTH** | 該当する場合に半角文字を使う。このフラグと LCMAP_FULLWIDTH は相互排他である。 | | **LCMAP_HIRAGANA** | すべてのカタカナ文字をひらがなにマップする。このフラグと LCMAP_KATAKANA は相互排他である。| | **LCMAP_KATAKANA** | すべてのひらがな文字をカタカナにマップする。このフラグと LCMAP_HIRAGANA は相互排他である。 | | **LCMAP_LINGUISTIC_CASING** | ケース処理にファイル システム ルール（既定）ではなく言語的ルールを使う。LCMAP_LOWERCASE または LCMAP_UPPERCASE とのみ組み合わせて有効である。| | **LCMAP_LOWERCASE** | 大文字・小文字を扱えるロケールやスクリプトの場合、すべての文字を小文字にマップする。| **LCMAP_HASH** | 文字列の生ソート重みのハッシュを返す。同等に見える文字列は通常同じハッシュを返す（例: LCMAP_IGNORECASE 付きでの "hello" と "HELLO"）。ただし東アジア言語などの複雑なケースでは、等しいと比較される同じ重みの類似文字列でも同じハッシュを返さないことがある。LCMAP_HASH は出力バッファのサイズが sizeof(int) であることを要求する。 | | **LCMAP_SIMPLIFIED_CHINESE** | 繁体字中国語を簡体字中国語にマップする。このフラグと LCMAP_TRADITIONAL_CHINESE は相互排他である。| | **LCMAP_SORTHANDLE**  **ソート ハンドルの使用はパフォーマンス向上がごくわずかであり推奨されない。** | ロケールに対して解決されたソート パラメータ（ロケール名のようなもの）を表すトークンを返し、以後の [CompareStringEx](../stringapiset/nf-stringapiset-comparestringex.md) や [LCMapStringEx](nf-winnls-lcmapstringex.md) 呼び出しで、ソート名に NULL を渡し、最後のパラメータ (sortHandle) として以前取得したソート ハンドルを渡せるようにする。LCMAP_SORTHANDLE は出力バッファのサイズが sizeof(lparam) であることを要求する。| | **LCMAP_SORTKEY** | 正規化済みソート キーを生成する。LCMAP_SORTKEY フラグを指定しない場合、関数は文字列マッピングを行う。ソート キー生成と文字列マッピングの詳細は Remarks を参照のこと。| | **LCMAP_TITLECASE** | Windows 7: すべての文字をタイトル ケース（各主要語の最初の文字を大文字）にマップする。 | | **LCMAP_TRADITIONAL_CHINESE** | 簡体字中国語を繁体字中国語にマップする。このフラグと LCMAP_SIMPLIFIED_CHINESE は相互排他である。| | **LCMAP_UPPERCASE** | 大文字・小文字を扱えるロケールやスクリプトの場合、すべての文字を大文字にマップする。| 次のフラグは単独、相互間、もしくは LCMAP_SORTKEY や LCMAP_BYTEREV フラグと組み合わせて使用できる。ただし、上記の他のフラグとは組み合わせできない。
lpSrcStr : [wstr] 関数がマップまたはソート キー生成に使う変換元文字列へのポインタ。この文字列のサイズは 0 にできない。
cchSrc : [int] lpSrcStr が示す変換元文字列のサイズ（文字数単位）。変換元文字列のサイズには終端 null 文字を含めてもよいが、含めなくてもよい。終端 null 文字はソート不可能な文字として扱われ常に自分自身にマップされるため、含めても関数のマッピング動作に大きな影響はない。アプリケーションはこのパラメータに任意の負の値を指定して、変換元文字列が null 終端であることを示せる。この場合、LCMapStringEx が文字列マッピング モードで使われているなら、関数は文字列長を自身で計算し、lpDestStr が示す変換後文字列を null 終端する。このパラメータを 0 にはできない。
lpDestStr : [wstr] この関数が変換後文字列またはソート キーを取得するバッファへのポインタ。アプリケーションがソート キー生成 (LCMAP_SORTKEY) に使う場合: - ソート キーはバッファに格納され、不透明なバイト配列として扱われる。格納値には任意の位置に 0 バイトが埋め込まれることがある。- 変換先文字列には奇数バイトが含まれることがある。LCMAP_BYTEREV フラグは偶数バイトのみを反転し、ソート キーの最後のバイト（奇数位置）は反転されない。呼び出し側が文字列の一部を明示的に要求した場合、cchDest で指定しない限り変換先文字列には終端 null 文字が含まれない。関数が失敗すると、変換先バッファには部分結果または何の結果も含まれないことがある。この場合、すべての結果を無効と見なすべきである。> [!NOTE] > LCMAP_UPPERCASE や LCMAP_LOWERCASE を設定するとき、変換先文字列は変換元文字列と同じバッファを使える。しかし、状況によってケース変換後の文字列の長さが変わる可能性があるため、これは強く非推奨である。
cchDest : [int] lpDestStr が示す変換先文字列のサイズ（文字数単位）。文字列マッピングに使う場合、このパラメータには文字数を指定する。cchSrc に終端 null 文字のための領域を含める場合、cchDest にも終端 null 文字のための領域を含めなければならない。ソート キー生成に使う場合はバイト数を指定する。このバイト数にはソート キーの 0x00 終端の領域を含めなければならない。cchDest を 0 にできる。この場合、関数は lpDestStr パラメータを使わず、変換後文字列またはソート キーに必要なバッファサイズを返す。
lpVersionInformation : [var] 関連する NLS 機能のバージョン情報を含む NLSVERSIONINFOEX 構造体へのポインタ。通常は GetNLSVersionEx から取得する。**Windows Vista、Windows 7:** 予約。NULL に設定しなければならない。
lpReserved : [intptr] 予約。NULL でなければならない。
sortHandle : [intptr] 予約。0 でなければならない。> [!NOTE] > [CompareStringEx](../stringapiset/nf-stringapiset-comparestringex.md) と [LCMapStringEx](nf-winnls-lcmapstringex.md) は（ロケール名が null の場合に）ソート ハンドルを指定できるが、多くのアプリケーションにとってこの使用は推奨されない。
%inst
名前で指定されたロケールに対し、入力文字列を指定した変換で別の文字列へマップするか、入力文字列のソート キーを生成する。注:
Windows Vista 以降のみで動作するよう設計されているアプリケーションは、LCMapString
よりこの関数を優先して呼ぶべきである。

[戻り値]
文字列マッピング用途で成功した場合、変換後文字列の文字数を返す（詳細は *cchSrc* および *cchDest*
を参照のこと）。ソート キー生成用途で成功した場合、ソート キーのバイト数を返す。成功しなかった場合は 0
を返す。拡張エラー情報を取得するには、アプリケーションから GetLastError を呼ぶ。次のいずれかのエラーコードが返ることがある:
（以下省略）

[備考]
アプリケーションは LCMapString または LCMapStringEx でソート キーを生成できる。そのためには
dwMapFlags パラメータに LCMAP_SORTKEY を指定する。詳細は Handling Sorting in Your
Applications を参照のこと。> [!NOTE] > ソート キーは不透明なバイト列である。呼び出し側は API
が返す長さのバイト配列として扱い、見かけ上存在しそうな内部構造に頼ってはならない。返されたソート キーのバイトには 0 が 0 個、1
個、または複数個含まれることがある。0
バイトが無いこと、あること、いずれも期待してはならない。もう一つの用途は文字列マッピングである。この場合、アプリケーションは
dwMapFlags パラメータに LCMAP_SORTKEY を指定せず、他のフラグの組み合わせを指定する。詳細は Handling
Sorting in Your Applications を参照のこと。Windows Vista 以降: この関数はカスタム
ロケールのデータを扱える。データがコンピュータ間やアプリケーションの実行間で同じである保証はない。アプリケーションがデータを永続化または送信する必要がある場合は
Using Persistent Locale Data を参照のこと。Windows 8 以降: アプリケーションが
Windows.Globalization 名前空間から言語タグをこの関数に渡す場合、まず ResolveLocaleName
を呼んでタグを変換しなければならない。


%index
LZClose
LZOpenFile 関数で開いたファイルを閉じる。
%group
Win32 kernel32
%prm
hFile
hFile : [int] 閉じるファイルへのハンドル。
%inst
LZOpenFile 関数で開いたファイルを閉じる。

[備考]
ファイルを識別するハンドルは LZOpenFile 関数で取得したものでなければならない。CreateFile や OpenFile
で取得したハンドルではエラーが発生する。ファイルが Lempel-Ziv アルゴリズムで圧縮されており LZOpenFile
で開かれていた場合、LZClose はそのファイルの展開に確保されたグローバル ヒープ領域を解放する。Windows 8 および
Windows Server 2012 では、この関数は次のテクノロジでサポートされる。
（以下省略）


%index
LZCopy
ソースファイルをコピー先ファイルにコピーする。
%group
Win32 kernel32
%prm
hfSource, hfDest
hfSource : [int] 変換元ファイルへのハンドル。
hfDest : [int] 変換先ファイルへのハンドル。
%inst
ソースファイルをコピー先ファイルにコピーする。

[戻り値]
関数が成功した場合、戻り値は変換先ファイルのサイズ（バイト単位）を指定する。関数が失敗した場合、戻り値は LZERROR_*
コードとなる。これらのコードは 0 より小さい値を持つ。LZCopy は SetLastError や SetLastErrorEx
を呼ばないので、失敗してもスレッドの直近エラー コードには影響しない。失敗時に LZCopy が返すエラー コードは次のとおりである。
（以下省略）

[備考]
変換元および変換先ファイルを識別するハンドルは LZInit または LZOpenFile
関数で取得したものでなければならない。関数が成功した場合、hfDest で指定したファイルは常に展開済みとなる。Windows 8 および
Windows Server 2012 では、この関数は次のテクノロジでサポートされる。
（以下省略）


%index
LZDone
(no summary)
%group
Win32 kernel32
%prm

%inst



%index
LZInit
ファイルを展開するために必要な内部データ構造のためのメモリを確保し、それらを作成・初期化する。
%group
Win32 kernel32
%prm
hfSource
hfSource : [int] ファイルのハンドル。
%inst
ファイルを展開するために必要な内部データ構造のためのメモリを確保し、それらを作成・初期化する。

[戻り値]
関数が成功した場合、戻り値は新しい LZ ファイルハンドルである。関数が失敗した場合、戻り値は LZERROR_*
コードであり、これらのコードは負の値を持つ。なお LZInit は SetLastError も SetLastErrorEx
も呼び出さないため、失敗してもスレッドの最終エラーコードには影響しない。以下は LZInit が失敗時に返すエラーコードの一覧である。
（以下省略）

[備考]
同時に開ける圧縮ファイルは最大で 16 個である。同様に、同時に開ける非圧縮ファイルも最大で 16
個である。アプリケーションは、ファイルの使用を終えたら LZInit が返したハンドルを必ず閉じるべきであり、さもないと意図せず 16
ファイルの上限に達することがある。この関数が返すハンドルは Lz32.dll
の関数とのみ互換性があり、他のファイル操作に用いてはならない。Windows 8 および Windows Server 2012
では、この関数は次のテクノロジによってサポートされる。
（以下省略）


%index
LZOpenFileW
指定したファイルを作成・オープン・再オープン・削除する。(Unicode)
%group
Win32 kernel32
%prm
lpFileName, lpReOpenBuf, wStyle
lpFileName : [wstr] ファイルの名前。
lpReOpenBuf : [var] ファイルが最初に開かれた際の情報を受け取る OFSTRUCT 構造体へのポインタ。この構造体は、開かれたファイルを参照するため、後続の LZOpenFile 関数呼び出しで使用できる。この構造体の szPathName メンバには、OEM (original equipment manufacturer) 文字セットの文字が格納される。
wStyle : [int] 
%inst
指定したファイルを作成・オープン・再オープン・削除する。(Unicode)

[戻り値]
関数が成功し、wStyle 引数で指定された値が OF_READ
でない場合、戻り値はファイルを識別するハンドルである。ファイルが圧縮されており wStyle に OF_READ
を指定して開いた場合、戻り値は特殊なファイルハンドルである。関数が失敗した場合、戻り値は LZERROR_*
コードであり、これらのコードは負の値を持つ。この関数には拡張エラー情報はなく、GetLastError を呼んではならない。注:
LZOpenFile は SetLastError も SetLastErrorEx
も呼び出さないため、失敗してもスレッドの最終エラーコードには影響しない。以下は LZOpenFile
が失敗時に返すエラーコードの一覧である。
（以下省略）

[備考]
wStyle 引数が OF_READ フラグ（または OF_READ と任意の OF_SHARE_*
フラグの組み合わせ）で、ファイルが圧縮されている場合、LZOpenFile は LZInit
関数を呼び出し、展開処理に必要な初期化を行う。この関数が返すハンドルは Lz32.dll
の関数とのみ互換性があり、他のファイル操作に用いてはならない。LZOpenFile が lpFileName
で指定されたファイルを開けなかった場合、Windows の一部のバージョンでは、最後の文字をアンダースコア ("_")
に置換したほぼ同じファイル名のファイルを開こうとする。すなわち "MyProgram.exe"
を開くのに失敗した場合、LZOpenFile は "MyProgram.ex_"
を開こうとする。インストールパッケージはしばしば、ファイルが圧縮されていることを示すために拡張子の最後の文字をアンダースコアに置き換える。例えば、圧縮された
"MyProgram.exe" は "MyProgram.ex_"
と命名されることがある。実際に開かれたファイル（存在すれば）の名前を知るには、lpReOpenBuf 引数の OFSTRUCT 構造体の
szPathName メンバを確認する。Windows 8 および Windows Server 2012
では、この関数は次のテクノロジによってサポートされる。
（以下省略）


%index
LZRead
ファイルから指定したバイト数（最大）を読み込み、それらをバッファへコピーする。
%group
Win32 kernel32
%prm
hFile, lpBuffer, cbRead
hFile : [int] ファイルのハンドル。
lpBuffer : [str] ファイルから読み込んだバイトを受け取るバッファへのポインタ。このバッファが cbRead より大きいことを確認すること。
cbRead : [int] 読み込むバイト数。
%inst
ファイルから指定したバイト数（最大）を読み込み、それらをバッファへコピーする。

[戻り値]
関数が成功した場合、戻り値は読み込んだバイト数を示す。関数が失敗した場合、戻り値は LZERROR_*
コードであり、これらのコードは負の値を持つ。なお LZRead は SetLastError も SetLastErrorEx
も呼び出さないため、失敗してもスレッドの最終エラーコードには影響しない。以下は LZRead が失敗時に返すエラーコードの一覧である。
（以下省略）

[備考]
ファイルを識別するハンドルは、LZInit または LZOpenFile
関数を呼び出して取得しなければならない。ファイルが圧縮されている場合、LZRead
はファイルを展開したイメージに対して動作し、指定されたバッファへデータバイトをコピーする。Windows 8 および Windows
Server 2012 では、この関数は次のテクノロジによってサポートされる。
（以下省略）


%index
LZSeek
ファイルポインタを開始位置から指定したバイト数だけ移動させる。
%group
Win32 kernel32
%prm
hFile, lOffset, iOrigin
hFile : [int] ファイルのハンドル。
lOffset : [int] ファイルポインタを移動させるバイト数。
iOrigin : [int] 
%inst
ファイルポインタを開始位置から指定したバイト数だけ移動させる。

[戻り値]
関数が成功した場合、戻り値はファイルの先頭から新しいポインタ位置までのオフセットを示す。関数が失敗した場合、戻り値は LZERROR_*
コードであり、これらのコードは負の値を持つ。なお LZSeek は SetLastError も SetLastErrorEx
も呼び出さないため、失敗してもスレッドの最終エラーコードには影響しない。以下は LZSeek が失敗時に返すエラーコードの一覧である。
（以下省略）

[備考]
hFile 引数で識別されるハンドルは、LZInit または LZOpenFile 関数を呼び出して取得しなければならない。Windows
8 および Windows Server 2012 では、この関数は次のテクノロジによってサポートされる。
（以下省略）


%index
LZStart
(no summary)
%group
Win32 kernel32
%prm

%inst



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
LoadModule
アプリケーションを読み込んで実行するか、既存アプリケーションの新しいインスタンスを作成する。
%group
Win32 kernel32
%prm
lpModuleName, lpParameterBlock
lpModuleName : [str] 実行するアプリケーションのファイル名。パスを指定する場合は、スラッシュ (/) ではなく必ずバックスラッシュ (\\) を使用すること。lpModuleName 引数がディレクトリパスを含まない場合、システムは次の順で実行可能ファイルを検索する。
lpParameterBlock : [intptr] 新しいアプリケーションの引数ブロックを定義する、アプリケーション定義の LOADPARMS32 構造体へのポインタ。
%inst
アプリケーションを読み込んで実行するか、既存アプリケーションの新しいインスタンスを作成する。

[戻り値]
関数が成功した場合、戻り値は 31 より大きい。関数が失敗した場合、戻り値はエラー値であり、次のいずれかの値となることがある。
（以下省略）

[備考]
LOADPARMS32 構造体は次の形式を持つ。
（以下省略）


%index
LoadPackagedLibrary
指定したパッケージ化モジュールとその依存関係を、呼び出し側プロセスのアドレス空間に読み込む。
%group
Win32 kernel32
%prm
lpwLibFileName, Reserved
lpwLibFileName : [wstr] 読み込むパッケージ化モジュールのファイル名。モジュールはライブラリモジュール (.dll ファイル) でも実行可能モジュール (.exe ファイル) でもよい。この引数でパスを指定せずにモジュール名のみを指定し、拡張子を省略した場合、関数はモジュール名に既定のライブラリ拡張子 .dll を付加する。.dll の付加を抑止するには、モジュール名の末尾にピリオド (.) を含める。この引数がパスを指定する場合、関数はそのパスでモジュールを検索する。パスは絶対パスや、".." を含む相対パスであってはならない。パスを指定する場合は、スラッシュ (/) ではなく必ずバックスラッシュ (\\) を使用すること。パスの詳細については「ファイル、パス、名前空間の命名」を参照。指定したモジュールが既にプロセス内に読み込まれている場合、関数は読み込み済みモジュールのハンドルを返す。そのモジュールは元々プロセスのパッケージ依存グラフから読み込まれている必要がある。指定したモジュールの読み込みによってシステムが他の関連モジュールを読み込む場合、関数はまず読み込み済みモジュールを検索し、次にプロセスのパッケージ依存グラフを検索する。詳細は「備考」を参照。
Reserved : [int] この引数は予約されている。0 でなければならない。
%inst
指定したパッケージ化モジュールとその依存関係を、呼び出し側プロセスのアドレス空間に読み込む。

[戻り値]
関数が成功した場合、戻り値は読み込まれたモジュールのハンドルである。関数が失敗した場合、戻り値は NULL
である。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
LoadPackagedLibrary 関数は LoadLibraryEx
の簡略版である。パッケージ化アプリはパッケージ化モジュールを読み込むために LoadPackagedLibrary
を使用できる。非パッケージアプリケーションは LoadPackagedLibrary
を使用できず、非パッケージアプリケーションがこの関数を呼び出すと APPMODEL_ERROR_NO_PACKAGE
で失敗する。LoadPackagedLibrary
は指定モジュールのハンドルを返し、その参照カウントを増加させる。モジュールが既に読み込まれている場合、関数は読み込み済みモジュールのハンドルを返す。呼び出し側プロセスは、LoadPackagedLibrary
が返したハンドルを GetProcAddress
関数の呼び出しでモジュールの識別に使用できる。読み込み済みモジュールを解放して参照カウントを減少させるには FreeLibrary
関数を使用する。関数が指定モジュールまたはその依存関係を検索する必要がある場合、プロセスのパッケージ依存グラフのみを検索する。これはアプリケーションのパッケージに加え、アプリケーションのパッケージマニフェストの
<Dependencies> セクションに <PackageDependency>
として指定された依存関係である。依存関係はマニフェストに現れた順に検索される。パッケージ依存グラフはアプリケーションのパッケージマニフェストの
<Dependencies> セクションに指定される。依存関係はマニフェストに現れた順に検索される。検索は次のように進む。
（以下省略）


%index
LoadResource
メモリ内の指定リソースの先頭バイトへのポインタを取得するために使用できるハンドルを取得する。
%group
Win32 kernel32
%prm
hModule, hResInfo
hModule : [intptr] 型: HMODULE リソースを含む実行可能ファイルのモジュールのハンドル。hModule が NULL の場合、システムは現在のプロセスの作成に使用されたモジュールからリソースを読み込む。
hResInfo : [intptr] 型: HRSRC 読み込むリソースのハンドル。このハンドルは FindResource または FindResourceEx 関数によって返される。
%inst
メモリ内の指定リソースの先頭バイトへのポインタを取得するために使用できるハンドルを取得する。

[戻り値]
型: HGLOBAL 関数が成功した場合、戻り値はリソースに関連付けられたデータのハンドルである。関数が失敗した場合、戻り値は NULL
である。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
LoadResource の戻り値の型が HGLOBAL
なのは下位互換性のためであり、関数がグローバルメモリブロックのハンドルを返すからではない。このハンドルを GlobalLock や
GlobalFree 関数に渡してはならない。リソースデータの先頭バイトへのポインタを得るには LockResource
関数を呼び、リソースのサイズを得るには SizeofResource
を呼ぶ。[GlobalSize](/windows/desktop/api/winbase/nf-winbase-globalsize)
はリソースの HGLOBAL に対して 0 を返す。結果として、HGLOBAL のサイズ判定に GlobalSize を用いる API
は正しく動作しない。例えば
[CreateStreamOnHGlobal](/windows/win32/api/combaseapi/nf-combaseapi-createstreamonhglobal)
の代わりに
[SHCreateMemStream](/windows/win32/api/shlwapi/nf-shlwapi-shcreatememstream)
を使う。リソースを直ちに使用するには、アプリケーションは次のリソース別関数を用いて一度の呼び出しでリソースの検索と読み込みを行うべきである。
（以下省略）


%index
LocalFree
指定したローカルメモリオブジェクトを解放し、そのハンドルを無効化する。
%group
Win32 kernel32
%prm
hMem
hMem : [int] ローカルメモリオブジェクトのハンドル。このハンドルは LocalAlloc または LocalReAlloc 関数によって返される。GlobalAlloc で確保したメモリの解放には使用できない。
%inst
指定したローカルメモリオブジェクトを解放し、そのハンドルを無効化する。

[戻り値]
関数が成功した場合、戻り値は NULL
である。関数が失敗した場合、戻り値はローカルメモリオブジェクトのハンドルに等しい。拡張エラー情報を取得するには GetLastError
を呼ぶ。

[備考]
プロセスが解放後にそのメモリを参照・変更しようとした場合、ヒープ破壊が発生したり、アクセス違反例外
(EXCEPTION_ACCESS_VIOLATION) が発生したりする可能性がある。hMem 引数が NULL
の場合、LocalFree は引数を無視して NULL を返す。LocalFree
関数はロックされたメモリオブジェクトも解放する。ロックされたメモリオブジェクトはロックカウントが 0 より大きい。LocalLock
関数はローカルメモリオブジェクトをロックし、ロックカウントを 1 増やす。LocalUnlock 関数はロックを解除し、ロックカウントを
1 減らす。ローカルメモリオブジェクトのロックカウントを得るには LocalFlags
関数を使う。アプリケーションがシステムのデバッグバージョンで動作している場合、LocalFree
はロック中のオブジェクトが解放されたことを知らせるメッセージを出力する。アプリケーションをデバッグ中の場合、LocalFree
はロック中のオブジェクトを解放する直前にブレークポイントに入る。これにより意図した動作を確認した上で実行を続行できる。


%index
LocalAlloc
ヒープから指定したバイト数を確保する。(LocalAlloc)
%group
Win32 kernel32
%prm
uFlags, uBytes
uFlags : [int] 
uBytes : [int] 確保するバイト数。この引数が 0 で、かつ uFlags 引数に LMEM_MOVEABLE が指定された場合、関数は破棄済みとマークされたメモリオブジェクトのハンドルを返す。
%inst
ヒープから指定したバイト数を確保する。(LocalAlloc)

[戻り値]
関数が成功した場合、戻り値は新しく確保されたメモリオブジェクトのハンドルである。関数が失敗した場合、戻り値は NULL
である。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
Windows のメモリ管理にはローカルヒープとグローバルヒープの区別はない。したがって LocalAlloc と GlobalAlloc
は本質的に同一である。可動メモリフラグ LHND、LMEM_MOVABLE、NONZEROLHND
は不要なオーバーヘッドを加え、安全に使用するにはロックが必要となる。これらはドキュメントで明示的に使うよう指示されていない限り避けるべきである。新しいアプリケーションは、ドキュメントでローカル関数を使うよう明示的に指示されていない限り、ヒープ関数を使うべきである。例えば、一部の
Windows 関数は LocalFree
で解放しなければならないメモリを確保する。要求を満たす十分な空き領域がヒープにない場合、LocalAlloc は NULL
を返す。NULL はエラーを示すため、仮想アドレスの 0 が確保されることはない。したがって NULL
ポインタの使用は容易に検出できる。LocalAlloc
が成功した場合、少なくとも要求された量を確保する。確保された量が要求量より大きい場合、プロセスはその全量を使用できる。実際に確保されたバイト数を調べるには
LocalSize 関数を使う。メモリを解放するには LocalFree 関数を使う。LocalAlloc で確保したメモリを
GlobalFree で解放するのは安全ではない。


%index
LocalCompact
(no summary)
%group
Win32 kernel32
%prm
uMinFree
uMinFree : [int] 
%inst



%index
LocalFileTimeToFileTime
ローカルファイル時刻を協定世界時 (UTC) に基づくファイル時刻へ変換する。
%group
Win32 kernel32
%prm
lpLocalFileTime, lpFileTime
lpLocalFileTime : [var] UTC ベースのファイル時刻へ変換するローカルファイル時刻を指定する FILETIME 構造体へのポインタ。
lpFileTime : [var] 変換された UTC ベースのファイル時刻を受け取る FILETIME 構造体へのポインタ。この引数は lpLocalFileTime 引数と同じであってはならない。
%inst
ローカルファイル時刻を協定世界時 (UTC) に基づくファイル時刻へ変換する。

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 である。拡張エラー情報を取得するには
GetLastError 関数を使う。

[備考]
LocalFileTimeToFileTime
はタイムゾーンおよび夏時間の現在の設定を使用する。したがって夏時間の期間中であれば、変換対象の時刻が標準時刻であっても、この関数は夏時間を考慮する。


%index
LocalFlags
指定したローカルメモリオブジェクトに関する情報を取得する。
%group
Win32 kernel32
%prm
hMem
hMem : [int] ローカルメモリオブジェクトのハンドル。このハンドルは LocalAlloc または LocalReAlloc 関数によって返される。
%inst
指定したローカルメモリオブジェクトに関する情報を取得する。

[戻り値]
関数が成功した場合、戻り値はメモリオブジェクトの確保属性とロックカウントを示す。関数が失敗した場合、戻り値は
LMEM_INVALID_HANDLE であり、ローカルハンドルが無効であることを示す。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
戻り値の下位ワードの下位バイトにはオブジェクトのロックカウントが格納される。戻り値からロックカウントを取り出すには、ビット単位 AND
(&) 演算子と LMEM_LOCKCOUNT マスクを使う。LMEM_FIXED で確保されたメモリオブジェクトのロックカウントは常に
0 である。戻り値の下位ワードの上位バイトはメモリオブジェクトの確保属性を示し、0 または LMEM_DISCARDABLE
になり得る。ローカル関数は他のメモリ管理関数よりもオーバーヘッドが大きく、機能も少ない。新しいアプリケーションは、ドキュメントでローカル関数を使うよう指示されていない限り、ヒープ関数を使うべきである。詳細は「グローバルおよびローカル関数」を参照。


%index
LocalHandle
指定したローカルメモリオブジェクトへのポインタに関連付けられたハンドルを取得する。
%group
Win32 kernel32
%prm
pMem
pMem : [intptr] ローカルメモリオブジェクトの先頭バイトへのポインタ。このポインタは LocalLock 関数によって返される。
%inst
指定したローカルメモリオブジェクトへのポインタに関連付けられたハンドルを取得する。

[戻り値]
関数が成功した場合、戻り値は指定したローカルメモリオブジェクトのハンドルである。関数が失敗した場合、戻り値は NULL
である。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
LocalAlloc 関数が LMEM_MOVEABLE
でローカルメモリオブジェクトを確保すると、オブジェクトのハンドルを返す。LocalLock
関数はこのハンドルをオブジェクトのメモリブロックへのポインタに変換し、LocalHandle はポインタをハンドルに戻す。


%index
LocalLock
ローカルメモリオブジェクトをロックし、オブジェクトのメモリブロックの先頭バイトへのポインタを返す。
%group
Win32 kernel32
%prm
hMem
hMem : [int] ローカルメモリオブジェクトのハンドル。このハンドルは LocalAlloc または LocalReAlloc 関数によって返される。
%inst
ローカルメモリオブジェクトをロックし、オブジェクトのメモリブロックの先頭バイトへのポインタを返す。

[戻り値]
関数が成功した場合、戻り値はメモリブロックの先頭バイトへのポインタである。関数が失敗した場合、戻り値は NULL
である。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
各メモリオブジェクトの内部データ構造には、初期値 0 のロックカウントが含まれる。可動メモリオブジェクトに対して LocalLock
はカウントを 1 増やし、LocalUnlock 関数はカウントを 1 減らす。プロセスがオブジェクトに対して行った LocalLock
の成功呼び出しには、対応する LocalUnlock 呼び出しが必要である。LocalReAlloc
関数で再確保されない限り、ロックされたメモリは移動も破棄もされない。ロックされたメモリオブジェクトのメモリブロックは、ロックカウントが 0
まで減らされるまでメモリにロックされ続け、その時点で移動や破棄が可能となる。LMEM_FIXED
で確保されたメモリオブジェクトのロックカウントは常に 0
である。これらのオブジェクトでは返されるポインタの値は指定したハンドルの値と等しい。指定したメモリブロックが破棄されているか、サイズが 0
バイトである場合、この関数は NULL を返す。破棄されたオブジェクトのロックカウントは常に 0 である。


%index
LocalReAlloc
指定したローカルメモリオブジェクトのサイズまたは属性を変更する。サイズは増加も減少もできる。
%group
Win32 kernel32
%prm
hMem, uBytes, uFlags
hMem : [int] 再確保するローカルメモリオブジェクトのハンドル。このハンドルは LocalAlloc または LocalReAlloc 関数によって返される。
uBytes : [int] メモリブロックの新しいサイズ（バイト単位）。uFlags に LMEM_MODIFY が指定されている場合、この引数は無視される。
uFlags : [int] 再確保のオプション。LMEM_MODIFY が指定されると、関数はメモリオブジェクトの属性のみを変更する（uBytes 引数は無視される）。それ以外の場合、関数はメモリオブジェクトを再確保する。LMEM_MODIFY は次の値と組み合わせることもできる。
%inst
指定したローカルメモリオブジェクトのサイズまたは属性を変更する。サイズは増加も減少もできる。

[戻り値]
関数が成功した場合、戻り値は再確保されたメモリオブジェクトのハンドルである。関数が失敗した場合、戻り値は NULL
である。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
LocalReAlloc が失敗した場合、元のメモリは解放されず、元のハンドルとポインタは依然として有効である。LocalReAlloc
が固定オブジェクトを再確保した場合、返されるハンドルの値はメモリブロックの先頭バイトのアドレスである。メモリへアクセスするには、プロセスは単に戻り値をポインタにキャストすればよい。


%index
LocalShrink
(no summary)
%group
Win32 kernel32
%prm
hMem, cbNewSize
hMem : [int] 
cbNewSize : [int] 
%inst



%index
LocalSize
指定したローカルメモリオブジェクトの現在のサイズ（バイト単位）を取得する。
%group
Win32 kernel32
%prm
hMem
hMem : [int] ローカルメモリオブジェクトのハンドル。このハンドルは LocalAlloc、LocalReAlloc、または LocalHandle 関数によって返される。
%inst
指定したローカルメモリオブジェクトの現在のサイズ（バイト単位）を取得する。

[戻り値]

関数が成功した場合、戻り値は指定したローカルメモリオブジェクトのサイズ（バイト単位）である。指定したハンドルが無効であるか、オブジェクトが破棄されている場合、戻り値は
0 である。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]

メモリブロックのサイズは、メモリ確保時に要求したサイズよりも大きい場合がある。指定したオブジェクトのメモリブロックが破棄されていないことを確認するには、LocalSize
を呼ぶ前に LocalFlags 関数を呼ぶ。


%index
LocalUnlock
LMEM_MOVEABLE で確保されたメモリオブジェクトに関連付けられたロックカウントを減算する。
%group
Win32 kernel32
%prm
hMem
hMem : [int] ローカルメモリオブジェクトのハンドル。このハンドルは LocalAlloc または LocalReAlloc 関数によって返される。
%inst
LMEM_MOVEABLE で確保されたメモリオブジェクトに関連付けられたロックカウントを減算する。

[戻り値]
ロックカウントを減らした後もメモリオブジェクトがまだロックされている場合、戻り値は 0
以外である。ロックカウントを減らした結果メモリオブジェクトがアンロックされた場合、関数は 0 を返し GetLastError は
NO_ERROR を返す。関数が失敗した場合、戻り値は 0 で GetLastError は NO_ERROR 以外の値を返す。

[備考]
各メモリオブジェクトの内部データ構造には、初期値 0 のロックカウントが含まれる。可動メモリオブジェクトに対して LocalLock
関数はカウントを 1 増やし、LocalUnlock はカウントを 1 減らす。プロセスがオブジェクトに対して LocalLock
を呼び出すたびに、最終的に LocalUnlock を呼び出さなければならない。LocalReAlloc
関数で再確保されない限り、ロックされたメモリは移動も破棄もされない。ロックされたメモリオブジェクトのメモリブロックは、ロックカウントが 0
まで減らされるまでロックされたままとなり、その時点で移動や破棄が可能となる。メモリオブジェクトが既にアンロックされている場合、LocalUnlock
は FALSE を返し、GetLastError は ERROR_NOT_LOCKED を報告する。LMEM_FIXED
で確保されたメモリオブジェクトのロックカウントは常に 0 で、ERROR_NOT_LOCKED
エラーの原因となる。プロセスは、戻り値をもとに後続の LocalUnlock 呼び出し回数を判断すべきではない。


%index
LocaleNameToLCID
ロケール名をロケール識別子に変換する。
%group
Win32 kernel32
%prm
lpName, dwFlags
lpName : [wstr] ロケール名を表す null 終端文字列へのポインタ、または次の定義済みの値のいずれか。
dwFlags : [int] Windows 7 より前: 予約されており、常に 0 でなければならない。Windows 7 以降: 中立の LCID の返却を許可するために LOCALE_ALLOW_NEUTRAL_NAMES を設定できる。
%inst
ロケール名をロケール識別子に変換する。

[戻り値]
成功した場合、ロケール名に対応するロケール識別子を返す。指定されたロケール名がユーザー既定のカスタムロケールに対応する場合、この関数は
LOCALE_CUSTOM_DEFAULT を返す。ロケール名がユーザー既定でないカスタムロケール、一時ロケール、または CLDR
(Unicode Common Locale Data Repository) ロケールに対応する場合、関数は
LOCALE_CUSTOM_UNSPECIFIED を返す。成功しなかった場合、関数は 0
を返す。拡張エラー情報を取得するには、アプリケーションは GetLastError を呼ぶことができ、いずれかの引数が無効であれば
ERROR_INVALID_PARAMETER を返すことがある。

[備考]
Microsoft
が作成したものを含むカスタムロケールについては、アプリケーションはロケール識別子よりもロケール名を優先すべきである。詳細は [LCID
の非推奨化](/globalization/locale/locale-names#the-deprecation-of-lcids)
を参照。Windows 8 以降: アプリケーションが Windows.Globalization
名前空間の言語タグをこの関数に渡す場合、まず ResolveLocaleName を呼んでタグを変換しなければならない。


%index
LockFile
指定したファイルを呼び出し側プロセスによる排他アクセス用にロックする。
%group
Win32 kernel32
%prm
hFile, dwFileOffsetLow, dwFileOffsetHigh, nNumberOfBytesToLockLow, nNumberOfBytesToLockHigh
hFile : [intptr] ファイルのハンドル。ファイルハンドルは GENERIC_READ または GENERIC_WRITE アクセス権で作成されている必要がある。詳細は「ファイルのセキュリティとアクセス権」を参照。
dwFileOffsetLow : [int] ロックを開始するファイル内の開始バイトオフセットの下位 32 ビット。
dwFileOffsetHigh : [int] ロックを開始するファイル内の開始バイトオフセットの上位 32 ビット。
nNumberOfBytesToLockLow : [int] ロックするバイト範囲の長さの下位 32 ビット。
nNumberOfBytesToLockHigh : [int] ロックするバイト範囲の長さの上位 32 ビット。
%inst
指定したファイルを呼び出し側プロセスによる排他アクセス用にロックする。

[戻り値]
関数が成功した場合、戻り値は 0 以外 (TRUE) である。関数が失敗した場合、戻り値は 0 (FALSE)
である。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
LockFile
の呼び出しが同期的に完了した場合、完了ポートがファイルハンドルに関連付けられていても、完了エントリはキューされないことがある。UnlockFile
関数は LockFile
でロックされたファイル領域のロックを解除する。ファイル領域をロックすると、ロックを行ったプロセスのスレッドは、このファイルハンドルを使って指定領域への排他アクセスを得る。ファイルハンドルがロックを行ったプロセスから作成された子プロセスに継承されても、子プロセスにはロック領域へのアクセスは付与されない。ロックを行ったプロセスが同じファイルを
2 度目に開いた場合、その 2
つ目のハンドルからは領域のロックを解除するまで指定領域にアクセスできない。ファイル領域のロックは、マップされたファイルビューからの読み書きを妨げない。現在のファイル末尾を超えるバイトをロックすることもできる。これはファイル末尾へのレコード追加を調整する際に有用である。排他ロックはファイルの既存のロック領域と重なってはならない。詳細は
LockFileEx を参照。LockFile はファイル領域のロックに失敗した場合、ブロックせずに即座に 0
を返す。ロックが取得されるまでブロックするファイルロック要求を発行するには、LOCKFILE_FAIL_IMMEDIATELY
フラグなしで LockFileEx
を使う。プロセスがファイルの一部をロックしたまま終了したり、未解除のロックを持つファイルを閉じた場合、ロックはオペレーティングシステムによって解除される。ただしロック解除にかかる時間は利用可能なシステムリソースに依存する。したがって、プロセスは終了時にロックしているすべてのファイルを明示的にアンロックすることが推奨される。これを行わなかった場合、オペレーティングシステムがまだロックを解除していない間はそれらのファイルへのアクセスが拒否されることがある。Windows
8 および Windows Server 2012 では、この関数は次のテクノロジによってサポートされる。
（以下省略）


%index
LockFileEx
指定したファイルを呼び出し側プロセスによる排他アクセス用にロックする。この関数は同期的にも非同期的にも動作し、排他ロックまたは共有ロックを要求できる。
%group
Win32 kernel32
%prm
hFile, dwFlags, dwReserved, nNumberOfBytesToLockLow, nNumberOfBytesToLockHigh, lpOverlapped
hFile : [intptr] ファイルのハンドル。ハンドルは GENERIC_READ または GENERIC_WRITE アクセス権で作成されている必要がある。詳細は「ファイルのセキュリティとアクセス権」を参照。
dwFlags : [int] 
dwReserved : [int] 予約引数。0 に設定しなければならない。
nNumberOfBytesToLockLow : [int] ロックするバイト範囲の長さの下位 32 ビット。
nNumberOfBytesToLockHigh : [int] ロックするバイト範囲の長さの上位 32 ビット。
lpOverlapped : [var] 関数がロック要求に使用する OVERLAPPED 構造体へのポインタ。必須であるこの構造体には、ロック範囲の先頭となるファイルオフセットが含まれる。hEvent メンバは有効なハンドルまたは 0 で初期化しなければならない。
%inst

指定したファイルを呼び出し側プロセスによる排他アクセス用にロックする。この関数は同期的にも非同期的にも動作し、排他ロックまたは共有ロックを要求できる。

[戻り値]
関数が成功した場合、戻り値は 0 以外 (TRUE) である。関数が失敗した場合、戻り値は 0 (FALSE)
である。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]

ファイル領域のロックは、このファイルハンドルを使って指定領域への共有アクセスまたは排他アクセスを取得するために用いられる。ファイルハンドルがロックを行ったプロセスから作成された子プロセスに継承されても、子プロセスにはロック領域へのアクセスは付与されない。ロックを行ったプロセスが同じファイルを
2 度目に開いた場合、その 2
つ目のハンドルからは領域のロックを解除するまで指定領域にアクセスできない。ファイルの一部を排他アクセスでロックすると、そのファイルの指定領域に対する他のすべてのプロセスの読み書きアクセスが拒否される。現在のファイル末尾位置を超える領域をロックしてもエラーにはならない。ファイルの一部を共有アクセスでロックすると、最初にその領域をロックしたプロセスを含め、すべてのプロセスのその領域への書き込みアクセスが拒否される。すべてのプロセスはロックされた領域を読むことができる。ファイル領域のロックは、マップされたファイルビューからの読み書きを妨げない。LockFileEx
関数は、ファイルハンドルが非同期 I/O 用に開かれている場合、LOCKFILE_FAIL_IMMEDIATELY
フラグが指定されていない限り非同期に動作する。既に共有ロックまたは排他ロックが掛かっている範囲に対して排他ロックが要求された場合、関数は
ERROR_IO_PENDING を返す。ロックが付与されると、システムは OVERLAPPED
構造体で指定されたイベントをシグナル状態にする。ロックがいつ付与されたかを知るには GetOverlappedResult
関数または待機関数のいずれかを使う。詳細は「同期 I/O と非同期 I/O」を参照。ファイルハンドルが非同期 I/O
用に開かれておらず、ロックが利用できない場合、LOCKFILE_FAIL_IMMEDIATELY
フラグが指定されていない限り、この呼び出しはロックが付与されるかエラーが発生するまで待機する。排他ロックはファイルの既存のロック領域と重なってはならない。共有ロックは、その領域に掛かるロックが共有ロックである限り、ロック領域と重ねることができる。共有ロックは、両方のロックが同じファイルハンドルで作成された場合に限り、排他ロックと重ねることができる。共有ロックが排他ロックと重なる場合、アクセスできるのはロック所有者による読み取りのみである。同じ範囲に排他ロックと共有ロックの両方がかかっている場合、領域のロックを解除するには
2 回のアンロック操作が必要で、1 回目で排他ロック、2 回目で共有ロックを解除する。

プロセスがファイルの一部をロックしたまま終了したり、未解除のロックを持つファイルを閉じた場合、ロックはオペレーティングシステムによって解除される。ただしロック解除にかかる時間は利用可能なシステムリソースに依存する。したがって、プロセスは終了時にロックしているすべてのファイルを明示的にアンロックすることが推奨される。これを行わなかった場合、オペレーティングシステムがまだロックを解除していない間はそれらのファイルへのアクセスが拒否されることがある。Windows
8 および Windows Server 2012 では、この関数は次のテクノロジによってサポートされる。
（以下省略）


%index
LockResource
メモリ内の指定リソースへのポインタを取得する。
%group
Win32 kernel32
%prm
hResData
hResData : [int] 型: **HGLOBAL** アクセスするリソースのハンドル。[LoadResource 関数](nf-libloaderapi-loadresource.md) がこのハンドルを返す。なお、この引数が **HGLOBAL** 変数として記述されているのは下位互換性のためである。引数としては **LoadResource** 関数の成功時の戻り値以外の値を渡してはならない。
%inst
メモリ内の指定リソースへのポインタを取得する。

[戻り値]
型: LPVOID 読み込まれたリソースが利用可能な場合、戻り値はリソースの先頭バイトへのポインタである。そうでなければ **NULL**
である。

[備考]
**LockResource**
が返すポインタは、リソースを含むモジュールがアンロードされるまで有効である。リソースを作成したプロセスが終了するとシステムが自動的にそれらを削除するため、リソースをアンロックする必要はない。[FindResourceA
関数](../winbase/nf-winbase-findresourcea.md) や [FindResourceExA
関数](../winbase/nf-winbase-findresourceexa.md)
が返すハンドルでリソースをロックしようとしてはならない。そうしたハンドルはランダムなデータを指す。> [!Note] >
**LockResource**
は実際にはメモリをロックしない。リソースデータを含むメモリへのポインタを得るために使われるだけである。関数名は Windows XP
より前のバージョンに由来し、そのバージョンでは
[LoadResource](nf-libloaderapi-loadresource.md)
で確保されたグローバルメモリブロックをロックするために使われていた。


%index
MapUserPhysicalPages
以前に確保された物理メモリページを、Address Windowing Extensions (AWE) 領域内の指定アドレスにマップする。(MapUserPhysicalPages)
%group
Win32 kernel32
%prm
VirtualAddress, NumberOfPages, PageArray
VirtualAddress : [intptr] 再マップするメモリ領域の先頭アドレスへのポインタ。lpAddress の値は、Address Windowing Extensions (AWE) 領域が確保されたときに VirtualAlloc 関数が返すアドレス範囲内になければならない。
NumberOfPages : [int] 変換を確立する物理メモリおよび仮想アドレス空間のサイズ（ページ単位）。仮想アドレス範囲は lpAddress から始まる連続領域である。物理フレームは UserPfnArray で指定する。合計ページ数は、AllocateUserPhysicalPages で指定された範囲の末尾を、開始アドレスから超えてはならない。
PageArray : [var] 物理ページフレーム番号の配列へのポインタ。これらのフレームは、この関数からの戻り時に引数 lpAddress によってマップされる。確保されるメモリのサイズは、少なくとも NumberOfPages にデータ型 ULONG_PTR のサイズを掛けた値でなければならない。
%inst
以前に確保された物理メモリページを、Address Windowing Extensions (AWE)
領域内の指定アドレスにマップする。(MapUserPhysicalPages)

[戻り値]
関数が成功した場合、戻り値は TRUE である。関数が失敗した場合、戻り値は FALSE
で、部分的にもマッピングは行われない。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
物理ページのマップは解除されるが解放されない。物理ページを解放するには FreeUserPhysicalPages
を呼ばなければならない。任意の枚数の物理メモリページを指定できるが、メモリは VirtualAlloc
が確保する仮想アドレス空間の外に及んではならない。既存のアドレスマップは新しい変換によって自動的に上書きされ、古い変換はマップ解除される。AllocateUserPhysicalPages
で指定された範囲外の物理メモリページをマップすることはできない。複数の領域を同時にマップできるが、それらは重なってはならない。物理ページは任意の物理アドレスに配置できるが、物理ページの連続性を前提としてはならない。現在のアドレス範囲のマップを解除するには、物理メモリページ配列引数に
NULL を指定する。現在マップされているページはすべて解除されるが、解放はされない。物理ページを解放するには
FreeUserPhysicalPages
を呼ばなければならない。マルチプロセッサ環境では、この関数はハードウェア変換バッファの整合性を維持する。この関数からの戻り時には、すべてのプロセッサのすべてのスレッドが正しいマッピングを見ることが保証される。この関数を使用するアプリケーションをコンパイルするには、_WIN32_WINNT
マクロを 0x0500 以上に定義する。詳細は「Windows ヘッダの使用」を参照。


%index
MapUserPhysicalPagesScatter
以前に確保された物理メモリページを、Address Windowing Extensions (AWE) 領域内の指定アドレスにマップする。(MapUserPhysicalPagesScatter)
%group
Win32 kernel32
%prm
VirtualAddresses, NumberOfPages, PageArray
VirtualAddresses : [var] 再マップするメモリ領域の先頭アドレス配列へのポインタ。VirtualAddresses 内の各エントリは、Address Windowing Extensions (AWE) 領域が確保されたときに VirtualAlloc 関数が返すアドレス範囲内になければならない。NumberOfPages の値が配列のサイズを示す。エントリは複数の Address Windowing Extensions (AWE) 領域に属してもよい。
NumberOfPages : [int] 変換を確立する物理メモリおよび仮想アドレス空間のサイズ（ページ単位）。VirtualAddresses の配列が仮想アドレス範囲を指定する。
PageArray : [var] VirtualAddresses 内の対応するページをどう扱うかを示す値の配列へのポインタ。0 は VirtualAddresses 内の対応するエントリのマップを解除することを示し、0 以外の値はそれをマップすることを示す。
%inst
以前に確保された物理メモリページを、Address Windowing Extensions (AWE)
領域内の指定アドレスにマップする。(MapUserPhysicalPagesScatter)

[戻り値]
関数が成功した場合、戻り値は TRUE である。関数が失敗した場合、戻り値は FALSE
で、関数は部分的にもマップもマップ解除も行わない。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
物理ページはマップ解除されることがあるが、解放はされない。物理ページを解放するには FreeUserPhysicalPages
を呼ばなければならない。任意の枚数の物理メモリページを指定できるが、メモリは VirtualAlloc
が確保する仮想アドレス空間の外に及んではならない。既存のアドレスマップは新しい変換によって自動的に上書きされ、古い変換はマップ解除される。AllocateUserPhysicalPages
で指定された範囲外の物理メモリページをマップすることはできない。複数の領域を同時にマップできるが、それらは重なってはならない。物理ページは任意の物理アドレスに配置できるが、物理ページの連続性を前提としてはならない。マルチプロセッサ環境では、この関数はハードウェア変換バッファの整合性を維持する。この関数からの戻り時には、すべてのプロセッサのすべてのスレッドが正しいマッピングを見ることが保証される。この関数を使用するアプリケーションをコンパイルするには、_WIN32_WINNT
マクロを 0x0500 以上に定義する。詳細は「Windows ヘッダの使用」を参照。


%index
MapViewOfFile
ファイルマッピングのビューを呼び出し側プロセスのアドレス空間にマップする。
%group
Win32 kernel32
%prm
hFileMappingObject, dwDesiredAccess, dwFileOffsetHigh, dwFileOffsetLow, dwNumberOfBytesToMap
hFileMappingObject : [intptr] ファイルマッピングオブジェクトのハンドル。CreateFileMapping 関数および OpenFileMapping 関数がこのハンドルを返す。
dwDesiredAccess : [int] ファイルマッピングオブジェクトへのアクセスの種類。これはページのページ保護を決定する。
dwFileOffsetHigh : [int] ビューの開始位置となるファイルオフセットの上位 DWORD。
dwFileOffsetLow : [int] ビューの開始位置となるファイルオフセットの下位 DWORD。上位と下位のオフセットの組み合わせは、ファイルマッピング内のオフセットを指定しなければならない。また、システムのメモリ確保粒度と一致しなければならない。すなわちオフセットは確保粒度の倍数でなければならない。システムのメモリ確保粒度を得るには、SYSTEM_INFO 構造体のメンバを埋める GetSystemInfo 関数を使う。
dwNumberOfBytesToMap : [int] ビューにマップするファイルマッピングのバイト数。すべてのバイトは CreateFileMapping で指定された最大サイズ以内でなければならない。この引数が 0 の場合、マッピングは指定オフセットからファイルマッピングの末尾まで広がる。
%inst
ファイルマッピングのビューを呼び出し側プロセスのアドレス空間にマップする。

[戻り値]
関数が成功した場合、戻り値はマップされたビューの先頭アドレスである。関数が失敗した場合、戻り値は NULL
である。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]

ファイルをマップすると、ファイルの指定された部分が呼び出し側プロセスのアドレス空間内に見えるようになる。アドレス空間より大きなファイルの場合、ファイルデータの一部分ずつしか同時にマップできない。最初のビューを使い終えたら、マップ解除して新しいビューをマップできる。ビューのサイズを得るには
VirtualQuery
関数を使う。ファイルの複数のビュー（またはファイルマッピングオブジェクトとそのマップされたファイル）は、指定時点で同じデータを含むなら整合している。これは、同じファイルに裏付けられた任意のファイルマッピングオブジェクトからビューが派生する場合に発生する。プロセスは
DuplicateHandle 関数を使ってファイルマッピングオブジェクトのハンドルを他のプロセスへ複製できるし、別のプロセスは
OpenFileMapping 関数を使って名前でファイルマッピングオブジェクトを開くこともできる。1
つの重要な例外を除き、同じファイルに裏付けられた任意のファイルマッピングオブジェクトから派生したファイルビューは、特定時点で整合もしくは同一である。プロセス内のビュー間でも、異なるプロセスがマップしたビュー間でも、整合性は保証される。例外はリモートファイルに関するものである。MapViewOfFile
はリモートファイルでも動作するが、それらの整合性は保たない。例えば、2
台のコンピュータがファイルを書き込み可能としてマップし、両方が同じページを変更した場合、各コンピュータは自身のそのページへの書き込みしか見えない。ディスク上でデータが更新されても、マージはされない。ファイルのマップされたビューは、ReadFile
や WriteFile
関数でアクセスしているファイルとの整合性は保証されない。メモリマップファイルにポインタを格納してはならない。任意のアドレスでマッピングを使えるように、ファイルマッピングの基底からのオフセットを格納すること。EXCEPTION_IN_PAGE_ERROR
例外に備えるため、ページファイル以外のメモリマップファイルビューへ書き込んだり読み込んだりするコードは構造化例外処理で保護すること。詳細は「ファイルビューからの読み書き」を参照。マップされたビューを介してファイルを変更する場合、最終更新タイムスタンプが自動的には更新されないことがある。必要であれば、呼び出し側は
SetFileTime
を使ってタイムスタンプを設定すべきである。ファイルマッピングオブジェクトがページングファイルに裏付けられている場合（CreateFileMapping
が hFile 引数 INVALID_HANDLE_VALUE
で呼ばれた場合）、ページングファイルはマッピング全体を保持できる十分な大きさでなければならない。そうでなければ MapViewOfFile
は失敗する。ページングファイルに裏付けられたファイルマッピングオブジェクト内のページの初期内容は 0
である。ページングファイルに裏付けられたファイルマッピングオブジェクトの作成時、呼び出し側は MapViewOfFile
がページの予約と確定を同時に行う (SEC_COMMIT) か、単に予約のみを行う (SEC_RESERVE)
かを指定できる。ファイルをマップすると、マップされた仮想アドレス範囲全体はプロセス内の他の確保には利用できなくなる。予約された範囲からページが確定された後は、VirtualFree
で解放したり未確定にしたりすることはできない。予約および確定されたページは、ビューがマップ解除されファイルマッピングオブジェクトが閉じられた時点で解放される。詳細は
UnmapViewOfFile および CloseHandle 関数を参照。実行権限付きのファイルを持つためには、アプリケーションは
PAGE_EXECUTE_READWRITE または PAGE_EXECUTE_READ で CreateFileMapping
を呼び、その後 FILE_MAP_EXECUTE | FILE_MAP_WRITE または FILE_MAP_EXECUTE |
FILE_MAP_READ で MapViewOfFile を呼ばなければならない。Windows Server 2012
では、この関数は次のテクノロジによってサポートされる。
（以下省略）


%index
MapViewOfFileEx
ファイルマッピングのビューを呼び出し側プロセスのアドレス空間にマップする。呼び出し側は、ビュー用の基底メモリアドレスの候補を任意に指定できる。
%group
Win32 kernel32
%prm
hFileMappingObject, dwDesiredAccess, dwFileOffsetHigh, dwFileOffsetLow, dwNumberOfBytesToMap, lpBaseAddress
hFileMappingObject : [intptr] ファイルマッピングオブジェクトのハンドル。CreateFileMapping 関数および OpenFileMapping 関数がこのハンドルを返す。
dwDesiredAccess : [int] ファイルマッピングオブジェクトへのアクセスの種類。これはページのページ保護を決定する。
dwFileOffsetHigh : [int] ビューの開始位置となるファイルオフセットの上位 DWORD。
dwFileOffsetLow : [int] ビューの開始位置となるファイルオフセットの下位 DWORD。上位と下位のオフセットの組み合わせは、ファイルマッピング内のオフセットを指定しなければならない。また、システムのメモリ確保粒度と一致しなければならない。すなわちオフセットは確保粒度の倍数でなければならない。システムのメモリ確保粒度を得るには、SYSTEM_INFO 構造体のメンバを埋める GetSystemInfo 関数を使う。
dwNumberOfBytesToMap : [int] ビューにマップするファイルマッピングのバイト数。すべてのバイトは CreateFileMapping で指定された最大サイズ以内でなければならない。この引数が 0 の場合、マッピングは指定オフセットからファイルマッピングの末尾まで広がる。
lpBaseAddress : [intptr] マッピングを開始する呼び出し側プロセスのアドレス空間内のメモリアドレスへのポインタ。これはシステムのメモリ確保粒度の倍数でなければならず、そうでなければ関数は失敗する。システムのメモリ確保粒度を調べるには GetSystemInfo 関数を使う。指定したアドレスに十分なアドレス空間がない場合、関数は失敗する。lpBaseAddress が NULL の場合、オペレーティングシステムがマッピングアドレスを選択する。この場合、関数は MapViewOfFile 関数と等価である。現時点で安全（オペレーティングシステムが使用していない）なアドレスを指定することは可能だが、そのアドレスが時間の経過にわたって安全であり続ける保証はない。したがって、アドレスはオペレーティングシステムに選ばせる方がよい。その場合、メモリマップファイルにポインタを格納するのではなく、任意のアドレスでマッピングを使えるようにファイルマッピングの基底からのオフセットを格納する。
%inst

ファイルマッピングのビューを呼び出し側プロセスのアドレス空間にマップする。呼び出し側は、ビュー用の基底メモリアドレスの候補を任意に指定できる。

[戻り値]
関数が成功した場合、戻り値はマップされたビューの先頭アドレスである。関数が失敗した場合、戻り値は NULL
である。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]

ファイルをマップすると、ファイルの指定された部分が呼び出し側プロセスのアドレス空間内に見えるようになる。アドレス空間より大きなファイルの場合、ファイルデータの一部分ずつしか同時にマップできない。最初のビューを使い終えたら、マップ解除して新しいビューをマップする。ビューのサイズを得るには
VirtualQueryEx 関数を使う。ページファイルに裏付けられたファイルマッピングオブジェクト内のページの初期内容は 0
である。通常、推奨アドレスは、複数のプロセスで同じアドレスにファイルをマップするよう指定するために使われる。これには、関与するすべてのプロセスでそのアドレス空間領域が利用可能である必要がある。マッピングに使用する領域では、他のメモリ確保（VirtualAlloc
や VirtualAllocEx 関数によるメモリ予約を含む）は行えない。lpBaseAddress
引数で基底オフセットを指定した場合、指定されたメモリ領域が呼び出し側プロセスで既に使用されていなければ関数は成功する。システムは、他の
32
ビットプロセスでも同じメモリ領域がメモリマップファイル用に利用可能であることを保証しない。ファイルの複数のビュー（またはファイルマッピングオブジェクトとそのマップされたファイル）は、指定時点で同じデータを含むなら整合している。これは、同じファイルマッピングオブジェクトからビューが派生する場合に発生する。プロセスは
DuplicateHandle 関数を使ってファイルマッピングオブジェクトのハンドルを他のプロセスへ複製できるし、別のプロセスは
OpenFileMapping 関数を使って名前でファイルマッピングオブジェクトを開くこともできる。1
つの重要な例外を除き、同じファイルに裏付けられた任意のファイルマッピングオブジェクトから派生したファイルビューは、特定時点で整合もしくは同一である。プロセス内のビュー間でも、異なるプロセスがマップしたビュー間でも、整合性は保証される。例外はリモートファイルに関するものである。MapViewOfFileEx
はリモートファイルでも動作するが、それらの整合性は保たない。例えば、2
台のコンピュータがファイルを書き込み可能としてマップし、両方が同じページを変更した場合、各コンピュータは自身のそのページへの書き込みしか見えない。ディスク上でデータが更新されても、マージはされない。ファイルのマップされたビューは、ReadFile
や WriteFile 関数でアクセスしているファイルとの整合性は保証されない。EXCEPTION_IN_PAGE_ERROR
例外に備えるため、ページファイル以外のメモリマップファイルビューへ書き込んだり読み込んだりするコードは構造化例外処理で保護すること。詳細は「ファイルビューからの読み書き」を参照。マップされたビューを介してファイルを変更する場合、最終更新タイムスタンプが自動的には更新されないことがある。必要であれば、呼び出し側は
SetFileTime を使ってタイムスタンプを設定すべきである。実行権限付きのファイルを持つためには、アプリケーションは
PAGE_EXECUTE_READWRITE または PAGE_EXECUTE_READ で CreateFileMapping
を呼び、その後 FILE_MAP_EXECUTE | FILE_MAP_WRITE または FILE_MAP_EXECUTE |
FILE_MAP_READ で MapViewOfFileEx を呼ばなければならない。Windows Server 2012
では、この関数は次のテクノロジによってサポートされる。
（以下省略）


%index
MapViewOfFileExNuma
ファイルマッピングのビューを呼び出し側プロセスのアドレス空間にマップし、物理メモリの NUMA ノードを指定する。
%group
Win32 kernel32
%prm
hFileMappingObject, dwDesiredAccess, dwFileOffsetHigh, dwFileOffsetLow, dwNumberOfBytesToMap, lpBaseAddress, nndPreferred
hFileMappingObject : [intptr] ファイルマッピングオブジェクトのハンドル。CreateFileMappingNuma および OpenFileMapping 関数がこのハンドルを返す。
dwDesiredAccess : [int] ファイルマッピングオブジェクトへのアクセスの種類。これはページのページ保護を決定する。
dwFileOffsetHigh : [int] ビューの開始位置となるファイルオフセットの上位 DWORD。
dwFileOffsetLow : [int] ビューの開始位置となるファイルオフセットの下位 DWORD。上位と下位のオフセットの組み合わせは、ファイルマッピング内のオフセットを指定しなければならない。また、システムのメモリ確保粒度と一致しなければならない。すなわちオフセットは確保粒度の倍数でなければならない。システムのメモリ確保粒度を得るには、SYSTEM_INFO 構造体のメンバを埋める GetSystemInfo 関数を使う。
dwNumberOfBytesToMap : [int] ビューにマップするファイルマッピングのバイト数。すべてのバイトは CreateFileMapping で指定された最大サイズ以内でなければならない。この引数が 0 の場合、マッピングは指定オフセットからファイルマッピングの末尾まで広がる。
lpBaseAddress : [intptr] マッピングを開始する呼び出し側プロセスのアドレス空間内のメモリアドレスへのポインタ。これはシステムのメモリ確保粒度の倍数でなければならず、そうでなければ関数は失敗する。システムのメモリ確保粒度を調べるには GetSystemInfo 関数を使う。指定したアドレスに十分なアドレス空間がない場合、関数は失敗する。lpBaseAddress 引数が NULL の場合、オペレーティングシステムがマッピングアドレスを選択する。現時点で安全（オペレーティングシステムが使用していない）なアドレスを指定することは可能だが、そのアドレスが時間の経過にわたって安全であり続ける保証はない。したがって、アドレスはオペレーティングシステムに選ばせる方がよい。その場合、メモリマップファイルにポインタを格納するのではなく、任意のアドレスでマッピングを使えるようにファイルマッピングの基底からのオフセットを格納する。
nndPreferred : [int] 物理メモリが配置されるべき NUMA ノード。
%inst
ファイルマッピングのビューを呼び出し側プロセスのアドレス空間にマップし、物理メモリの NUMA ノードを指定する。

[戻り値]
関数が成功した場合、戻り値はマップされたビューの先頭アドレスである。関数が失敗した場合、戻り値は NULL
である。拡張エラー情報を取得するには GetLastError 関数を呼ぶ。

[備考]

ファイルをマップすると、ファイルの指定された部分が呼び出し側プロセスのアドレス空間内に見えるようになる。アドレス空間より大きなファイルの場合、ファイルデータの一部分ずつしか同時にマップできない。最初のビューを使い終えたら、マップ解除して新しいビューをマップする。ビューのサイズを得るには
VirtualQueryEx 関数を使う。ページファイルに裏付けられたファイルマッピングオブジェクト内のページの初期内容は 0
である。推奨マッピングアドレスが指定されている場合、そのアドレス（直近の 64 KB
境界に切り下げられる）に十分なアドレス空間があれば、ファイルはその指定アドレスにマップされる。十分なアドレス空間がなければ関数は失敗する。通常、推奨アドレスは、複数のプロセスで同じアドレスにファイルをマップするよう指定するために使われる。これには、関与するすべてのプロセスでそのアドレス空間領域が利用可能である必要がある。マッピングに使用する領域では、VirtualAllocExNuma
関数によるメモリ予約を含め、他のメモリ確保は行えない。lpBaseAddress
引数で基底オフセットを指定した場合、指定されたメモリ領域が呼び出し側プロセスで既に使用されていなければ関数は成功する。システムは、他の
32
ビットプロセスでも同じメモリ領域がメモリマップファイル用に利用可能であることを保証しない。ファイルの複数のビュー（またはファイルマッピングオブジェクトとそのマップされたファイル）は、指定時点で同じデータを含むなら整合している。これは、同じファイルマッピングオブジェクトからビューが派生する場合に発生する。プロセスは
DuplicateHandle 関数を使ってファイルマッピングオブジェクトのハンドルを他のプロセスへ複製できるし、別のプロセスは
OpenFileMapping 関数を使って名前でファイルマッピングオブジェクトを開くこともできる。1
つの重要な例外を除き、同じファイルに裏付けられた任意のファイルマッピングオブジェクトから派生したファイルビューは、特定時点で整合もしくは同一である。プロセス内のビュー間でも、異なるプロセスがマップしたビュー間でも、整合性は保証される。例外はリモートファイルに関するものである。MapViewOfFileExNuma
はリモートファイルでも動作するが、それらの整合性は保たない。例えば、2
台のコンピュータがファイルを書き込み可能としてマップし、両方が同じページを変更した場合、各コンピュータは自身のそのページへの書き込みしか見えない。ディスク上でデータが更新されても、マージはされない。ファイルのマップされたビューは、ReadFile
や WriteFile 関数でアクセスしているファイルとの整合性は保証されない。EXCEPTION_IN_PAGE_ERROR
例外に備えるため、ページファイル以外のメモリマップファイルビューへ書き込んだり読み込んだりするコードは構造化例外処理で保護すること。詳細は「ファイルビューからの読み書き」を参照。マップされたビューを介してファイルを変更する場合、最終更新タイムスタンプが自動的には更新されないことがある。必要であれば、呼び出し側は
SetFileTime を使ってタイムスタンプを設定すべきである。実行権限付きのファイルを持つためには、アプリケーションは
PAGE_EXECUTE_READWRITE または PAGE_EXECUTE_READ で CreateFileMappingNuma
関数を呼び、その後 FILE_MAP_EXECUTE | FILE_MAP_WRITE または FILE_MAP_EXECUTE |
FILE_MAP_READ で MapViewOfFileExNuma 関数を呼ばなければならない。Windows Server 2012
では、この関数は次のテクノロジによってサポートされる。
（以下省略）


%index
Module32First
Module32First 関数 (tlhelp32.h) は、プロセスに関連付けられた最初のモジュールに関する情報を取得する。
%group
Win32 kernel32
%prm
hSnapshot, lpme
hSnapshot : [intptr] CreateToolhelp32Snapshot 関数の直前の呼び出しから返されたスナップショットのハンドル。
lpme : [var] MODULEENTRY32 構造体へのポインタ。
%inst
Module32First 関数 (tlhelp32.h) は、プロセスに関連付けられた最初のモジュールに関する情報を取得する。

[戻り値]
モジュールリストの最初のエントリがバッファへコピーされた場合は TRUE、それ以外は FALSE
を返す。モジュールが存在しない、またはスナップショットにモジュール情報が含まれていない場合、GetLastError 関数は
ERROR_NO_MORE_FILES エラー値を返す。

[備考]
呼び出し側アプリケーションは、MODULEENTRY32 の dwSize
メンバを構造体のサイズ（バイト単位）に設定しなければならない。指定プロセスに関連付けられた他のモジュールの情報を取得するには、Module32Next
関数を使う。


%index
Module32Next
Module32Next 関数 (tlhelp32.h) は、プロセスまたはスレッドに関連付けられた次のモジュールに関する情報を取得する。
%group
Win32 kernel32
%prm
hSnapshot, lpme
hSnapshot : [intptr] CreateToolhelp32Snapshot 関数の直前の呼び出しから返されたスナップショットのハンドル。
lpme : [var] MODULEENTRY32 構造体へのポインタ。
%inst
Module32Next 関数 (tlhelp32.h) は、プロセスまたはスレッドに関連付けられた次のモジュールに関する情報を取得する。

[戻り値]
モジュールリストの次のエントリがバッファへコピーされた場合は TRUE、それ以外は FALSE
を返す。これ以上モジュールが存在しない場合、GetLastError 関数は ERROR_NO_MORE_FILES エラー値を返す。

[備考]
プロセスに関連付けられた最初のモジュールの情報を取得するには、Module32First 関数を使う。


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
MoveFileExW
既存のファイルまたはディレクトリ（子を含む）を、さまざまな移動オプションとともに移動する。(Unicode)
%group
Win32 kernel32
%prm
lpExistingFileName, lpNewFileName, dwFlags
lpExistingFileName : [wstr] ローカルコンピュータ上のファイルまたはディレクトリの現在の名前。dwFlags に MOVEFILE_DELAY_UNTIL_REBOOT が指定されている場合、遅延操作はネットワーク利用可能前に実行されるため、リモート共有上のファイルであってはならない。この関数の ANSI 版では、名前は MAX_PATH 文字に制限される。この上限を 32,767 ワイド文字まで拡張するには、この関数の Unicode 版を呼び、パスの先頭に "\\?\" を付加する。詳細は「ファイルの命名」を参照。
lpNewFileName : [wstr] ローカルコンピュータ上のファイルまたはディレクトリの新しい名前。ファイルを移動する場合、移動先は別のファイルシステムやボリュームでもよい。移動先が別のドライブである場合、dwFlags に MOVEFILE_COPY_ALLOWED フラグを設定しなければならない。ディレクトリを移動する場合、移動先は同じドライブでなければならない。dwFlags に MOVEFILE_DELAY_UNTIL_REBOOT が指定され lpNewFileName が NULL の場合、MoveFileEx はシステム再起動時に削除する対象として lpExistingFileName を登録する。lpExistingFileName がディレクトリを参照する場合、再起動時にシステムはディレクトリが空の場合にのみ削除する。この関数の ANSI 版では、名前は MAX_PATH 文字に制限される。この上限を 32,767 ワイド文字まで拡張するには、この関数の Unicode 版を呼び、パスの先頭に "\\?\" を付加する。詳細は「ファイルの命名」を参照。
dwFlags : [int] 
%inst
既存のファイルまたはディレクトリ（子を含む）を、さまざまな移動オプションとともに移動する。(Unicode)

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 である。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
dwFlags 引数に MOVEFILE_DELAY_UNTIL_REBOOT が指定されている場合、MoveFileEx
はレジストリにアクセスできないと失敗する。関数は、再起動時にリネーム対象となるファイルの位置を、次のレジストリ値に保存する:
HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session
Manager\PendingFileRenameOperations
このレジストリ値は REG_MULTI_SZ 型である。各リネーム操作は、削除かどうかに応じて、次のいずれかの null
終端文字列を保存する。
（以下省略）


%index
MoveFileTransactedW
既存のファイルまたはディレクトリ（子を含む）を、トランザクション操作として移動する。(Unicode)
%group
Win32 kernel32
%prm
lpExistingFileName, lpNewFileName, lpProgressRoutine, lpData, dwFlags, hTransaction
lpExistingFileName : [wstr] ローカルコンピュータ上の既存ファイルまたはディレクトリの現在の名前。この関数の ANSI 版では、名前は MAX_PATH 文字に制限される。この上限を 32,767 ワイド文字まで拡張するには、この関数の Unicode 版を呼び、パスの先頭に "\\?\" を付加する。詳細は「ファイルの命名」を参照。
lpNewFileName : [wstr] ファイルまたはディレクトリの新しい名前。新しい名前は既に存在していてはならない。新しいファイルは別のファイルシステムやドライブにあってもよい。新しいディレクトリは同じドライブ上になければならない。この関数の ANSI 版では、名前は MAX_PATH 文字に制限される。この上限を 32,767 ワイド文字まで拡張するには、この関数の Unicode 版を呼び、パスの先頭に "\\?\" を付加する。詳細は「ファイルの命名」を参照。
lpProgressRoutine : [int] ファイルの一部が移動されるたびに呼び出される CopyProgressRoutine コールバック関数へのポインタ。操作の進捗を表示するユーザーインターフェイスを提供する場合に有用である。この引数は NULL でもよい。
lpData : [intptr] CopyProgressRoutine コールバック関数に渡す引数。この引数は NULL でもよい。
dwFlags : [int] 
hTransaction : [intptr] トランザクションのハンドル。このハンドルは CreateTransaction 関数が返す。
%inst
既存のファイルまたはディレクトリ（子を含む）を、トランザクション操作として移動する。(Unicode)

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 である。拡張エラー情報を取得するには
GetLastError を呼ぶ。ボリュームをまたいでファイルを移動中、ユーザーが操作をキャンセルして lpProgressRoutine
が PROGRESS_CANCEL を返した場合、MoveFileTransacted は 0 を返し、GetLastError は
ERROR_REQUEST_ABORTED
を返す。既存ファイルはそのまま残される。ボリュームをまたいでファイルを移動中、ユーザーが操作を停止して lpProgressRoutine
が PROGRESS_STOP を返した場合、MoveFileTransacted は 0 を返し、GetLastError は
ERROR_REQUEST_ABORTED を返す。既存ファイルはそのまま残される。

[備考]
dwFlags 引数に MOVEFILE_DELAY_UNTIL_REBOOT が指定されている場合、MoveFileTransacted
はレジストリにアクセスできないと失敗する。関数は、再起動時にリネーム対象となるファイルの位置を、トランザクションとして次のレジストリ値に保存する:
HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session
Manager\PendingFileRenameOperations
このレジストリ値は REG_MULTI_SZ 型である。各リネーム操作は、削除かどうかに応じて、次のいずれかの null
終端文字列を保存する: szDstFile\0\0 szSrcFile\0szDstFile\0 文字列 szDstFile\0\0
は、ファイル szDstFile を再起動時に削除することを示す。文字列 szSrcFile\0szDstFile\0
は、szSrcFile を再起動時に szDstFile にリネームすることを示す。注: 厳密には \0\0 は REG_MULTI_SZ
ノードでは許可されていないが、これはファイルが null
名にリネームされるものとみなされるため可能である。システムはこれらのレジストリエントリを用いて、発行された順と同じ順序で再起動時に操作を完了する。MOVEFILE_DELAY_UNTIL_REBOOT
フラグの使用方法の詳細は MoveFileWithProgress
を参照。ファイルがボリュームをまたいで移動される場合、MoveFileTransacted
はセキュリティ記述子をファイルとともに移動しない。ファイルには移動先ディレクトリの既定のセキュリティ記述子が割り当てられる。MOVEFILE_FAIL_IF_NOT_TRACKABLE
フラグを指定すると、この関数は常に失敗する。トラッキングは TxF ではサポートされていない。Windows 8 および Windows
Server 2012 では、この関数は次のテクノロジによってサポートされる。
（以下省略）


%index
MoveFileWithProgressW
ファイルまたはディレクトリ（子を含む）を移動する。進捗通知を受け取るコールバック関数を指定できる。(Unicode)
%group
Win32 kernel32
%prm
lpExistingFileName, lpNewFileName, lpProgressRoutine, lpData, dwFlags
lpExistingFileName : [wstr] ローカルコンピュータ上の既存ファイルまたはディレクトリの名前。dwFlags に MOVEFILE_DELAY_UNTIL_REBOOT が指定されている場合、遅延操作はネットワーク利用可能前に実行されるため、リモート共有上のファイルであってはならない。この関数の ANSI 版では、名前は MAX_PATH 文字に制限される。この上限を 32,767 ワイド文字まで拡張するには、この関数の Unicode 版を呼び、パスの先頭に "\\?\" を付加する。詳細は「ファイルの命名」を参照。ヒント: Windows 10 バージョン 1607 以降では、この関数の Unicode 版 (MoveFileWithProgressW) について、"\\?\" を付加せずに MAX_PATH 制限を解除するオプトイン機能がある。詳細は「ファイル、パス、名前空間の命名」の「最大パス長制限」の節を参照。
lpNewFileName : [wstr] ローカルコンピュータ上のファイルまたはディレクトリの新しい名前。ファイルを移動する場合、lpNewFileName は別のファイルシステムやボリューム上であってもよい。lpNewFileName が別のドライブ上にある場合、dwFlags に MOVEFILE_COPY_ALLOWED フラグを設定しなければならない。ディレクトリを移動する場合、lpExistingFileName と lpNewFileName は同じドライブ上になければならない。dwFlags に MOVEFILE_DELAY_UNTIL_REBOOT が指定され lpNewFileName が NULL の場合、MoveFileWithProgress はシステム再起動時に削除する対象として lpExistingFileName を登録する。関数が削除操作に関する情報をレジストリに保存できなければ失敗する。lpExistingFileName がディレクトリを参照する場合、再起動時にシステムはディレクトリが空の場合にのみ削除する。この関数の ANSI 版では、名前は MAX_PATH 文字に制限される。この上限を 32,767 ワイド文字まで拡張するには、この関数の Unicode 版を呼び、パスの先頭に "\\?\" を付加する。詳細は「ファイルの命名」を参照。ヒント: Windows 10 バージョン 1607 以降では、この関数の Unicode 版 (MoveFileWithProgressW) について、"\\?\" を付加せずに MAX_PATH 制限を解除するオプトイン機能がある。詳細は「ファイル、パス、名前空間の命名」の「最大パス長制限」の節を参照。
lpProgressRoutine : [int] ファイルの一部が移動されるたびに呼び出される CopyProgressRoutine コールバック関数へのポインタ。操作の進捗を表示するユーザーインターフェイスを提供する場合に有用である。この引数は NULL でもよい。
lpData : [intptr] CopyProgressRoutine コールバック関数に渡す引数。この引数は NULL でもよい。
dwFlags : [int] 
%inst
ファイルまたはディレクトリ（子を含む）を移動する。進捗通知を受け取るコールバック関数を指定できる。(Unicode)

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 である。拡張エラー情報を取得するには
GetLastError を呼ぶ。ボリュームをまたいでファイルを移動中、ユーザーが操作をキャンセルして lpProgressRoutine
が PROGRESS_CANCEL を返した場合、MoveFileWithProgress は 0 を返し、GetLastError は
ERROR_REQUEST_ABORTED
を返す。既存ファイルはそのまま残される。ボリュームをまたいでファイルを移動中、ユーザーが操作を停止して lpProgressRoutine
が PROGRESS_STOP を返した場合、MoveFileWithProgress は 0 を返し、GetLastError は
ERROR_REQUEST_ABORTED を返す。既存ファイルはそのまま残される。

[備考]
MoveFileWithProgress
関数はリンク追跡サービスと連携して動作するので、リンクの参照元が移動されても追跡できる。ファイルを削除またはリネームするには、そのファイルに対する
delete 権限、または親ディレクトリに対する delete child
権限が必要である。削除と子の削除を除くすべてのアクセスを持つディレクトリを用意し、新規ファイルの ACL
が継承されるよう設定すれば、作成したファイルを削除できない状態で作ることが可能である。ただし、その状態でもファイルを作成でき、作成時に要求したすべてのアクセスを返されたハンドルで取得する。ファイル作成時に
delete 権限を要求すれば、そのハンドルでファイルを削除またはリネームできるが、他のハンドルからはできない。Windows 8 および
Windows Server 2012 では、この関数は次のテクノロジによってサポートされる。
（以下省略）


%index
MulDiv
32 ビット値を 2 つ掛け合わせ、その 64 ビット結果を 3 番目の 32 ビット値で割る。
%group
Win32 kernel32
%prm
nNumber, nNumerator, nDenominator
nNumber : [int] 被乗数。
nNumerator : [int] 乗数。
nDenominator : [int] 乗算結果を除算する数。
%inst
32 ビット値を 2 つ掛け合わせ、その 64 ビット結果を 3 番目の 32 ビット値で割る。

[戻り値]
関数が成功した場合、戻り値は乗算および除算の結果を最も近い整数に丸めた値である。結果が正の半整数（末尾が
.5）の場合は切り上げ、負の半整数の場合は切り下げられる。オーバーフローが発生した場合、または nDenominator が 0
の場合、戻り値は -1 である。


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
NeedCurrentDirectoryForExePathW
指定した実行可能ファイルの検索パスにカレントディレクトリを含めるべきかを判定する。(Unicode)
%group
Win32 kernel32
%prm
ExeName
ExeName : [wstr] 実行可能ファイルの名前。
%inst
指定した実行可能ファイルの検索パスにカレントディレクトリを含めるべきかを判定する。(Unicode)

[戻り値]
カレントディレクトリを検索パスに含めるべき場合、戻り値は TRUE である。そうでない場合、戻り値は FALSE である。

[備考]

この関数は、呼び出し側が相対的な実行可能ファイル名を絶対名へ明示的に解決しなければならない場合にのみ呼ぶべきである。CreateProcess
が相対的な実行可能ファイル名で呼び出された場合、自動的に実行可能ファイルを検索し、検索パスを決定するためにこの関数を呼ぶ。ほとんどのシステム関数は独自のパス解決を行うため、指定した実行可能ファイルのカレントディレクトリに基づく検索パスを解決しようとする場合にのみこの関数を呼ぶべきである。この関数が返す値は
NoDefaultCurrentDirectoryInExePath
環境変数の値によって決まる。ただしこの環境変数のレジストリ上の場所は変わり得るため、環境変数を直接確認するのではなくこの関数を呼ぶべきである。ExeName
引数の値にバックスラッシュ (\\) が含まれている場合、この関数は常に TRUE
を返す。バックスラッシュを含まない場合は、NoDefaultCurrentDirectoryInExePath
環境変数の存在のみが確認され、その値は参照されない。CreateProcess
の既定の検索パス解決アルゴリズムに頼るのではなく、この関数を呼ぶべき例として "cmd.exe" がある。cmd.exe は
CreateProcess を呼ぶ前に独自のパス解決を行うため、この関数を呼んでコマンド検索パスを決定する。この関数が TRUE
を返した場合、cmd.exe は実行可能ファイルの検索に ".;%PATH%" というパスを使う。FALSE を返した場合、cmd.exe
は検索に "%PATH%" を使う。
> [!NOTE] > processenv.h ヘッダは NeedCurrentDirectoryForExePath
を、UNICODE プリプロセッサ定数の定義に基づいて ANSI 版または Unicode
版を自動選択するエイリアスとして定義している。エンコーディング中立なエイリアスと、エンコーディング中立でないコードを混在させると、コンパイル時または実行時エラーとなる不一致を生じ得る。詳細は
[関数プロトタイプの慣例](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
NormalizeString
Unicode 4.0 TR#15 に従ってテキスト文字列の文字を正規化する。詳細は「Unicode 正規化を使った文字列表現」を参照。
%group
Win32 kernel32
%prm
NormForm, lpSrcString, cwSrcLength, lpDstString, cwDstLength
NormForm : [int] 使用する正規化形式。NORM_FORM は標準の Unicode 正規化形式を指定する。
lpSrcString : [wstr] 非正規化の変換元文字列へのポインタ。
cwSrcLength : [int] 変換元文字列を格納するバッファの長さ（文字数）。文字列が null 終端されているとみなして長さを自動計算させたい場合、この引数を -1 に設定できる。
lpDstString : [wstr] 関数が変換先文字列を取得するバッファへのポインタ。あるいは cwDstLength が 0 の場合、この引数は NULL とする。注: 終端の null 文字を含めずに入力文字列長が明示的に指定されている場合、関数は文字列を null 終端しない。出力文字列を null 終端するには、入力文字列について -1 を指定するか、終端の null 文字を明示的に長さに含める。
cwDstLength : [int] 変換先文字列を格納するバッファの長さ（文字数）。あるいは、必要なバッファサイズを関数に返させたい場合は、この引数を 0 に設定することもできる。
%inst
Unicode 4.0 TR#15 に従ってテキスト文字列の文字を正規化する。詳細は「Unicode 正規化を使った文字列表現」を参照。

[戻り値]
変換先バッファ内の正規化された文字列の長さを返す。cwDstLength が 0
に設定されている場合、関数は実際の変換を行うのに必要なバッファ長の見積りを返す。入力バッファ内の文字列が null 終端されているか
cwSrcLength が -1 の場合、変換先バッファに書き込まれる文字列は null 終端され、返される文字列長には終端の null
文字が含まれる。成功しなかった場合、関数は 0 以下の値を返す。拡張エラー情報を取得するには、アプリケーションは GetLastError
を呼ぶことができ、次のいずれかのエラーコードを返すことがある。
（以下省略）

[備考]
一部の Unicode 文字は、結合文字や合成 Unicode 文字の集合からなる複数の等価なバイナリ表現を持つ。Unicode
標準は、文字の等価なバイナリ表現のいずれかを与えた場合に 1
つのバイナリ表現を返す、正規化と呼ばれる処理を定義している。正規化は、「Unicode
正規化を使った文字列表現」で述べられるように、異なる規則に従う正規化形式と呼ばれるいくつかのアルゴリズムで実行できる。Win32 および
.NET Framework は現在、Unicode Standard Annex #15: Unicode
正規化形式で定義されている正規化形式 C、D、KC、KD
をサポートする。正規化された文字列は通常、順序比較で評価される。次のコードはバッファ長推定の使用例を示す。
（以下省略）


%index
NotifyUILanguageChange
サポートされていない。NotifyUILanguageChange は変更または利用不可となる可能性がある。
%group
Win32 kernel32
%prm
dwFlags, pcwstrNewLanguage, pcwstrPreviousLanguage, dwReserved, pdwStatusRtrn
dwFlags : [int] 予約。
pcwstrNewLanguage : [wstr] 新しい言語。
pcwstrPreviousLanguage : [wstr] 以前の言語。
dwReserved : [int] 予約。
pdwStatusRtrn : [var] DWORD の戻りステータスへのポインタ。
%inst
サポートされていない。NotifyUILanguageChange は変更または利用不可となる可能性がある。

[戻り値]
BOOL データ型。

[備考]
NotifyUILanguageChange はサポートされておらず、将来変更されたり利用できなくなったりする可能性がある。


%index
OOBEComplete
OOBE (Windows へようこそ) が完了したかどうかを判定する。
%group
Win32 kernel32
%prm
isOOBEComplete
isOOBEComplete : [var] 成功時に OOBE の完了状態を受け取る変数へのポインタ。
%inst
OOBE (Windows へようこそ) が完了したかどうかを判定する。

[戻り値]
OOBE 完了状態の設定に成功した場合は TRUE。そうでなければ FALSE。FALSE の場合、GetLastError
で拡張エラー情報を取得できる。


%index
OpenEventW
既存の名前付きイベントオブジェクトを開く。(Unicode)
%group
Win32 kernel32
%prm
dwDesiredAccess, bInheritHandle, lpName
dwDesiredAccess : [int] イベントオブジェクトへのアクセス。指定オブジェクトのセキュリティ記述子が呼び出し側プロセスに要求されたアクセスを許可しない場合、関数は失敗する。アクセス権の一覧は「同期オブジェクトのセキュリティとアクセス権」を参照。
bInheritHandle : [int] この値が TRUE の場合、このプロセスから作成されたプロセスはハンドルを継承する。そうでない場合、プロセスはこのハンドルを継承しない。
lpName : [wstr] 開くイベントの名前。名前の比較は大文字小文字を区別する。この関数はプライベート名前空間内のオブジェクトを開ける。詳細は「オブジェクト名前空間」を参照。ターミナルサービス: 名前は "Global\" または "Local\" プレフィックスを持つことができ、グローバル名前空間またはセッション名前空間にあるオブジェクトを明示的に開ける。名前の残り部分にはバックスラッシュ (\\) 以外の任意の文字を含められる。詳細は「カーネルオブジェクト名前空間」を参照。注: ファーストユーザー切り替えはターミナルサービスセッションを使って実装される。最初にログオンしたユーザーはセッション 0 を使用し、次のユーザーはセッション 1 を使用する、というように続く。アプリケーションが複数ユーザーをサポートできるよう、カーネルオブジェクト名はターミナルサービス向けのガイドラインに従わなければならない。
%inst
既存の名前付きイベントオブジェクトを開く。(Unicode)

[戻り値]
関数が成功した場合、戻り値はイベントオブジェクトのハンドルである。関数が失敗した場合、戻り値は NULL
である。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
OpenEvent 関数は、複数のプロセスが同じイベントオブジェクトのハンドルを開けるようにする。関数は、あるプロセスが既に
CreateEvent 関数を使ってイベントを作成している場合にのみ成功する。呼び出し側プロセスは、dwDesiredAccess
引数で指定されたアクセスの制限のもと、イベントオブジェクトのハンドルを要求する任意の関数で、返されたハンドルを使用できる。ハンドルは
DuplicateHandle 関数を使って複製できる。ハンドルを閉じるには CloseHandle
関数を使う。プロセス終了時にはシステムが自動的にハンドルを閉じる。イベントオブジェクトは、最後のハンドルが閉じられた時点で破棄される。
> [!NOTE] > synchapi.h ヘッダは OpenEvent を、UNICODE プリプロセッサ定数の定義に基づいて
ANSI 版または Unicode
版を自動選択するエイリアスとして定義している。エンコーディング中立なエイリアスと、エンコーディング中立でないコードを混在させると、コンパイル時または実行時エラーとなる不一致を生じ得る。詳細は
[関数プロトタイプの慣例](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
OpenFile
ファイルを作成・オープン・再オープン・削除する。
%group
Win32 kernel32
%prm
lpFileName, lpReOpenBuff, uStyle
lpFileName : [str] ファイルの名前。文字列は 8 ビット Windows 文字セットの文字で構成されなければならない。OpenFile 関数は Unicode ファイル名や名前付きパイプのオープンをサポートしない。
lpReOpenBuff : [var] ファイルが最初に開かれた際の情報を受け取る OFSTRUCT 構造体へのポインタ。この構造体は、開かれたファイルを参照するため、後続の OpenFile 関数呼び出しで使用できる。OFSTRUCT 構造体には OFS_MAXPATHNAME 文字（128 文字）に制限されたパス文字列メンバが含まれる。そのため、パス長が 128 文字を超えるファイルを OpenFile 関数で開くことはできない。CreateFile 関数にはこのパス長制限はない。
uStyle : [int] 実行する処理。
%inst
ファイルを作成・オープン・再オープン・削除する。

[戻り値]
関数が成功した場合、戻り値はファイル I/O を行うためのファイルハンドルを示す。ファイルを閉じるには、このハンドルを使って
CloseHandle 関数を呼ぶ。関数が失敗した場合、戻り値は HFILE_ERROR である。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
lpFileName 引数がファイル名と拡張子のみを指定する場合、この関数は次のディレクトリを示した順序で検索して一致するファイルを探す。
（以下省略）


%index
OpenFileById
指定した識別子に一致するファイルを開く。
%group
Win32 kernel32
%prm
hVolumeHint, lpFileId, dwDesiredAccess, dwShareMode, lpSecurityAttributes, dwFlagsAndAttributes
hVolumeHint : [intptr] 開こうとするファイルが格納されているボリュームまたは共有上の任意のファイルへのハンドル。
lpFileId : [var] 開くファイルを識別する FILE_ID_DESCRIPTOR へのポインタ。
dwDesiredAccess : [int] オブジェクトへのアクセス。アクセスは読み取り、書き込み、またはその両方が可能である。詳細は「ファイルのセキュリティとアクセス権」を参照。開いているハンドルを持つオープン要求で指定された共有モードと競合するアクセスモードを要求することはできない。この引数が 0 の場合、アプリケーションはデバイスにアクセスせずにファイルやデバイスの属性を問い合わせできる。これは、フロッピーをドライブに入れなくてもフロッピーディスクドライブのサイズや対応フォーマットを調べるのに有用である。また、読み書き用に開かずにファイルやディレクトリの存在を確認するためにも使える。
dwShareMode : [int] オブジェクトの共有モード。読み取り、書き込み、両方、またはなしのいずれか。開いているハンドルを持つオープン要求で指定されたアクセスモードと競合する共有モードを要求することはできない。競合すると次の共有違反 (ERROR_SHARING_VIOLATION) となる。詳細は「ファイルの作成と開き方」を参照。この引数が 0 で OpenFileById が成功した場合、オブジェクトは共有できず、ハンドルが閉じられるまで再度開くことはできない。詳細はこのトピックの「備考」節を参照。共有オプションはオブジェクトのハンドルを閉じるまで有効である。別のプロセスがオブジェクトを開いている間にプロセスがオブジェクトを共有できるようにするには、次のいずれかの組み合わせを使う。
lpSecurityAttributes : [var] 予約。
dwFlagsAndAttributes : [int] ファイルフラグ。OpenFileById はファイルを開く際、ファイルフラグを既存のファイル属性と組み合わせ、渡されたファイル属性を無視する。この引数には次のフラグの任意の組み合わせを含められる。
%inst
指定した識別子に一致するファイルを開く。

[戻り値]
関数が成功した場合、戻り値は指定したファイルの開かれたハンドルである。関数が失敗した場合、戻り値は
INVALID_HANDLE_VALUE である。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
OpenFileById が返すオブジェクトハンドルを閉じるには CloseHandle 関数を使う。DeleteFile
の直前の呼び出しの結果、削除保留状態にあるファイルに対して OpenFileById
を呼ぶと関数は失敗する。オペレーティングシステムはファイルへのすべてのハンドルが閉じられるまでファイルの削除を遅延する。GetLastError
は ERROR_ACCESS_DENIED を返す。Windows 8 および Windows Server 2012
では、この関数は次のテクノロジによってサポートされる。
（以下省略）


%index
OpenFileMappingW
名前付きファイルマッピングオブジェクトを開く。(OpenFileMappingW)
%group
Win32 kernel32
%prm
dwDesiredAccess, bInheritHandle, lpName
dwDesiredAccess : [int] ファイルマッピングオブジェクトへのアクセス。このアクセスは対象のファイルマッピングオブジェクトの任意のセキュリティ記述子と照合される。値の一覧は「ファイルマッピングのセキュリティとアクセス権」を参照。
bInheritHandle : [int] この引数が TRUE の場合、CreateProcess 関数で作成されたプロセスはハンドルを継承できる。そうでない場合、ハンドルは継承できない。
lpName : [wstr] 開くファイルマッピングオブジェクトの名前。この名前を持つファイルマッピングオブジェクトへの開いているハンドルがあり、マッピングオブジェクトのセキュリティ記述子が dwDesiredAccess 引数と競合しない場合、オープン操作は成功する。名前は "Global\" または "Local\" プレフィックスを持つことができ、グローバル名前空間またはセッション名前空間にあるオブジェクトを明示的に開ける。名前の残り部分にはバックスラッシュ (\\) 以外の任意の文字を含められる。詳細は「カーネルオブジェクト名前空間」を参照。ファーストユーザー切り替えはターミナルサービスセッションを使って実装される。最初にログオンしたユーザーはセッション 0 を使用し、次のユーザーはセッション 1 を使用する、というように続く。アプリケーションが複数ユーザーをサポートできるよう、カーネルオブジェクト名はターミナルサービス向けのガイドラインに従わなければならない。
%inst
名前付きファイルマッピングオブジェクトを開く。(OpenFileMappingW)

[戻り値]
関数が成功した場合、戻り値は指定したファイルマッピングオブジェクトの開かれたハンドルである。関数が失敗した場合、戻り値は NULL
である。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
OpenFileMapping
が返すハンドルは、ファイルマッピングオブジェクトのハンドルを要求する任意の関数で使用できる。マップされたビューを介してファイルを変更する場合、最終更新タイムスタンプが自動的には更新されないことがある。必要であれば、呼び出し側は
SetFileTime を使ってタイムスタンプを設定すべきである。OpenFileMapping
が返したハンドルが不要になったら、呼び出し側は CloseHandle を呼んでハンドルを解放すべきである。Windows Server
2012 では、この関数は次のテクノロジによってサポートされる。
（以下省略）


%index
OpenJobObjectW
既存のジョブオブジェクトを開く。(OpenJobObjectW)
%group
Win32 kernel32
%prm
dwDesiredAccess, bInheritHandle, lpName
dwDesiredAccess : [int] ジョブオブジェクトへのアクセス。この引数にはジョブオブジェクトアクセス権の 1 つ以上を指定できる。このアクセス権はオブジェクトの任意のセキュリティ記述子と照合される。
bInheritHandle : [int] この値が TRUE の場合、このプロセスから作成されたプロセスはハンドルを継承する。そうでない場合、プロセスはこのハンドルを継承しない。
lpName : [wstr] 開くジョブの名前。名前の比較は大文字小文字を区別する。この関数はプライベート名前空間内のオブジェクトを開ける。詳細は「オブジェクト名前空間」を参照。ターミナルサービス: 名前は "Global\\" または "Local\\" プレフィックスを持つことができ、グローバル名前空間またはセッション名前空間にあるオブジェクトを明示的に開ける。名前の残り部分にはバックスラッシュ (\\) 以外の任意の文字を含められる。詳細は「カーネルオブジェクト名前空間」を参照。
%inst
既存のジョブオブジェクトを開く。(OpenJobObjectW)

[戻り値]
関数が成功した場合、戻り値はジョブのハンドルである。ハンドルはジョブへの要求されたアクセスを提供する。関数が失敗した場合、戻り値は
NULL である。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
プロセスをジョブに関連付けるには AssignProcessToJobObject
関数を使う。この関数を使用するアプリケーションをコンパイルするには、_WIN32_WINNT を 0x0500
以上に定義する。詳細は「Windows ヘッダの使用」を参照。


%index
OpenPrivateNamespaceW
OpenPrivateNamespaceW (Unicode) 関数 (namespaceapi.h) はプライベート名前空間を開く。
%group
Win32 kernel32
%prm
lpBoundaryDescriptor, lpAliasPrefix
lpBoundaryDescriptor : [intptr] 名前空間の分離方法を定義する記述子。CreateBoundaryDescriptor 関数が境界記述子を作成する。
lpAliasPrefix : [wstr] 名前空間のプレフィックス。この名前空間にオブジェクトを作成するには、オブジェクト名を prefix\objectname の形式で指定する。
%inst
OpenPrivateNamespaceW (Unicode) 関数 (namespaceapi.h) はプライベート名前空間を開く。

[戻り値]
関数は既存の名前空間のハンドルを返す。

[備考]
この関数を使用するアプリケーションをコンパイルするには、_WIN32_WINNT を 0x0600 以上に定義する。


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
OpenThread
既存のスレッドオブジェクトを開く。
%group
Win32 kernel32
%prm
dwDesiredAccess, bInheritHandle, dwThreadId
dwDesiredAccess : [int] スレッドオブジェクトへのアクセス。このアクセス権はスレッドのセキュリティ記述子と照合される。この引数にはスレッドアクセス権の 1 つ以上を指定できる。呼び出し側が SeDebugPrivilege 特権を有効にしている場合、セキュリティ記述子の内容にかかわらず要求されたアクセスが付与される。
bInheritHandle : [int] この値が TRUE の場合、このプロセスから作成されたプロセスはハンドルを継承する。そうでない場合、プロセスはこのハンドルを継承しない。
dwThreadId : [int] 開くスレッドの識別子。
%inst
既存のスレッドオブジェクトを開く。

[戻り値]
関数が成功した場合、戻り値は指定したスレッドの開かれたハンドルである。関数が失敗した場合、戻り値は NULL
である。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
OpenThread
が返すハンドルは、適切なアクセス権を要求してあれば、待機関数などスレッドのハンドルを要求する任意の関数で使用できる。ハンドルはスレッドオブジェクトへのアクセスを
dwDesiredAccess 引数で指定された範囲でのみ付与される。ハンドルを使い終えたら、CloseHandle
関数を使って必ず閉じること。


%index
OpenWaitableTimerW
既存の名前付き待機可能タイマーオブジェクトを開く。
%group
Win32 kernel32
%prm
dwDesiredAccess, bInheritHandle, lpTimerName
dwDesiredAccess : [int] タイマーオブジェクトへのアクセス。指定オブジェクトのセキュリティ記述子が呼び出し側プロセスに要求されたアクセスを許可しない場合、関数は失敗する。アクセス権の一覧は「同期オブジェクトのセキュリティとアクセス権」を参照。
bInheritHandle : [int] この値が TRUE の場合、このプロセスから作成されたプロセスはハンドルを継承する。そうでない場合、プロセスはこのハンドルを継承しない。
lpTimerName : [wstr] タイマーオブジェクトの名前。名前は MAX_PATH 文字に制限される。名前比較は大文字小文字を区別する。この関数はプライベート名前空間内のオブジェクトを開ける。詳細は「オブジェクト名前空間」を参照。ターミナルサービス: 名前は "Global\" または "Local\" プレフィックスを持つことができ、グローバル名前空間またはセッション名前空間にあるオブジェクトを明示的に開ける。名前の残り部分にはバックスラッシュ (\\) 以外の任意の文字を含められる。詳細は「カーネルオブジェクト名前空間」を参照。注: ファーストユーザー切り替えはターミナルサービスセッションを使って実装される。最初にログオンしたユーザーはセッション 0 を使用し、次のユーザーはセッション 1 を使用する、というように続く。アプリケーションが複数ユーザーをサポートできるよう、カーネルオブジェクト名はターミナルサービス向けのガイドラインに従わなければならない。
%inst
既存の名前付き待機可能タイマーオブジェクトを開く。

[戻り値]
関数が成功した場合、戻り値はタイマーオブジェクトのハンドルである。関数が失敗した場合、戻り値は NULL
である。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
OpenWaitableTimer
関数は、複数のプロセスが同じタイマーオブジェクトのハンドルを開けるようにする。関数は、あるプロセスが既に
[CreateWaitableTimer](./nf-synchapi-createwaitabletimerw.md)
関数を使ってタイマーを作成している場合にのみ成功する。呼び出し側プロセスは、dwDesiredAccess
引数で指定されたアクセスの制限のもと、タイマーオブジェクトのハンドルを要求する関数（待機関数など）で返されたハンドルを使用できる。返されたハンドルは
DuplicateHandle 関数を使って複製できる。ハンドルを閉じるには CloseHandle
関数を使う。プロセス終了時にはシステムが自動的にハンドルを閉じる。タイマーオブジェクトは、最後のハンドルが閉じられた時点で破棄される。この関数を使用するアプリケーションをコンパイルするには、_WIN32_WINNT
を 0x0400 以上に定義する。詳細は「Windows ヘッダの使用」を参照。


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
PeekConsoleInputW
指定したコンソール入力バッファからデータを、バッファから取り除かずに読み込む。
%group
Win32 kernel32
%prm
hConsoleInput, lpBuffer, nLength, lpNumberOfEventsRead
hConsoleInput : [intptr] コンソール入力バッファのハンドル。ハンドルは **GENERIC\_READ** アクセス権を持っていなければならない。詳細は [コンソールバッファのセキュリティとアクセス権](console-buffer-security-and-access-rights.md) を参照。
lpBuffer : [var] 入力バッファのデータを受け取る [**INPUT\_RECORD**](input-record-str.md) 構造体の配列へのポインタ。
nLength : [int] *lpBuffer* 引数が指す配列のサイズ（配列要素数）。
lpNumberOfEventsRead : [var] 読み込まれた入力レコード数を受け取る変数へのポインタ。
%inst
指定したコンソール入力バッファからデータを、バッファから取り除かずに読み込む。

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 である。拡張エラー情報を取得するには
[**GetLastError**](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror)
を呼ぶ。

[備考]

要求されたレコード数がバッファ内の利用可能なレコード数を超える場合、利用可能な数が読み込まれる。データが利用できない場合、関数は直ちに戻る。[!INCLUDE
[setting-codepage-mode-remarks](./includes/setting-codepage-mode-remarks.md)]


%index
PeekNamedPipe
名前付きまたは匿名パイプのデータを、パイプから取り除かずにバッファへコピーする。
%group
Win32 kernel32
%prm
hNamedPipe, lpBuffer, nBufferSize, lpBytesRead, lpTotalBytesAvail, lpBytesLeftThisMessage
hNamedPipe : [intptr] パイプのハンドル。この引数は、CreateNamedPipe または CreateFile 関数が返す名前付きパイプインスタンスのハンドル、または CreatePipe 関数が返す匿名パイプの読み取り側のハンドルである。ハンドルはパイプへの GENERIC_READ アクセスを持っていなければならない。
lpBuffer : [intptr] パイプから読み込んだデータを受け取るバッファへのポインタ。データを読み込まない場合、この引数は NULL でもよい。
nBufferSize : [int] lpBuffer 引数で指定されたバッファのサイズ（バイト単位）。lpBuffer が NULL の場合、この引数は無視される。
lpBytesRead : [var] パイプから読み込まれたバイト数を受け取る変数へのポインタ。データを読み込まない場合、この引数は NULL でもよい。
lpTotalBytesAvail : [var] パイプから読み込める合計バイト数を受け取る変数へのポインタ。データを読み込まない場合、この引数は NULL でもよい。
lpBytesLeftThisMessage : [var] このメッセージに残るバイト数を受け取る変数へのポインタ。バイト型名前付きパイプや匿名パイプではこの引数は 0 となる。データを読み込まない場合、この引数は NULL でもよい。
%inst
名前付きまたは匿名パイプのデータを、パイプから取り除かずにバッファへコピーする。

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 である。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
PeekNamedPipe 関数は ReadFile 関数に似ているが、次の例外がある。
（以下省略）


%index
PostQueuedCompletionStatus
I/O 完了パケットを I/O 完了ポートへポストする。
%group
Win32 kernel32
%prm
CompletionPort, dwNumberOfBytesTransferred, dwCompletionKey, lpOverlapped
CompletionPort : [intptr] I/O 完了パケットをポストする I/O 完了ポートのハンドル。
dwNumberOfBytesTransferred : [int] GetQueuedCompletionStatus 関数の lpNumberOfBytesTransferred 引数を介して返す値。
dwCompletionKey : [int] GetQueuedCompletionStatus 関数の lpCompletionKey 引数を介して返す値。
lpOverlapped : [var] GetQueuedCompletionStatus 関数の lpOverlapped 引数を介して返す値。
%inst
I/O 完了パケットを I/O 完了ポートへポストする。

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 である。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
I/O 完了パケットは、未解決の GetQueuedCompletionStatus
関数呼び出しを満たす。この関数は、PostQueuedCompletionStatus 呼び出しの 2 番目・3 番目・4
番目の引数として渡した 3 つの値とともに戻る。システムはこれらの値を使用も検証もしない。特に lpOverlapped 引数は
OVERLAPPED 構造体を指す必要はない。Windows 8 および Windows Server 2012
では、この関数は次のテクノロジによってサポートされる。
（以下省略）


%index
PowerClearRequest
電源要求オブジェクトに対する指定種別の電源要求の数を減らす。
%group
Win32 kernel32
%prm
PowerRequest, RequestType
PowerRequest : [intptr] 電源要求オブジェクトのハンドル。
RequestType : [int] 
%inst
電源要求オブジェクトに対する指定種別の電源要求の数を減らす。

[戻り値]
関数が成功した場合、0 以外の値を返す。関数が失敗した場合、0 を返す。拡張エラー情報を取得するには GetLastError を呼ぶ。


%index
PowerCreateRequest
新しい電源要求オブジェクトを作成する。
%group
Win32 kernel32
%prm
Context
Context : [var] 電源要求に関する情報を含む REASON_CONTEXT 構造体を指す。
%inst
新しい電源要求オブジェクトを作成する。

[戻り値]
関数が成功した場合、戻り値は電源要求オブジェクトのハンドルである。関数が失敗した場合、戻り値は INVALID_HANDLE_VALUE
である。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
電源要求オブジェクトが不要になったら、CloseHandle 関数を使ってハンドルを解放し、オブジェクトをクリーンアップする。


%index
PowerSetRequest
電源要求オブジェクトに対する指定種別の電源要求の数を増やす。
%group
Win32 kernel32
%prm
PowerRequest, RequestType
PowerRequest : [intptr] 電源要求オブジェクトのハンドル。
RequestType : [int] 
%inst
電源要求オブジェクトに対する指定種別の電源要求の数を増やす。

[戻り値]
関数が成功した場合、0 以外の値を返す。関数が失敗した場合、0 を返す。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
DC 電源で動作するモダンスタンバイシステムでは、システムスリープタイムアウト経過後 5 分で、system required および
execution required の電源要求は終了する。従来型スリープ (S3) システム上の
PowerRequestAwayModeRequired
を除き、電源要求はユーザー起動のシステムスリープ開始時（電源ボタン、蓋を閉じる、またはスタートメニューから **スリープ**
を選ぶ）に終了する。電力を節約し最良のユーザー体験を提供するため、電源要求を使うアプリケーションは次のベストプラクティスに従うべきである:
* 電源要求を作成する際、REASON_CONTEXT 構造体に要求理由を説明するローカライズされたテキスト文字列を指定する。*
要求を必要とするシナリオの直前に PowerSetRequest を呼ぶ。* シナリオが終了したらすぐに
PowerClearRequest を呼んで要求の参照カウントを減らす。*
プロセスが終了したりサービスが停止したりする前に、すべての要求オブジェクトと関連ハンドルをクリーンアップする。


%index
PrepareTape
テープへのアクセスまたは取り外しのための準備を行う。
%group
Win32 kernel32
%prm
hDevice, dwOperation, bImmediate
hDevice : [intptr] テープを準備するデバイスのハンドル。このハンドルは CreateFile 関数を使って作成される。
dwOperation : [int] 
bImmediate : [int] この引数が TRUE の場合、関数は直ちに戻る。FALSE の場合、操作が完了するまで関数は戻らない。
%inst
テープへのアクセスまたは取り外しのための準備を行う。

[戻り値]
関数が成功した場合、戻り値は NO_ERROR である。関数が失敗した場合、次のいずれかのエラーコードを返すことがある。
（以下省略）

[備考]
一部のテープデバイスは、特定のテープ操作をサポートしない。テープデバイスのドキュメントを参照し、GetTapeParameters
関数を使ってテープデバイスの機能を確認すること。


%index
Process32First
Process32First 関数 (tlhelp32.h) は、システムスナップショット内で最初に見つかったプロセスに関する情報を取得する。
%group
Win32 kernel32
%prm
hSnapshot, lppe
hSnapshot : [intptr] CreateToolhelp32Snapshot 関数の直前の呼び出しから返されたスナップショットのハンドル。
lppe : [var] PROCESSENTRY32 構造体へのポインタ。実行可能ファイルの名前、プロセス識別子、親プロセスのプロセス識別子などのプロセス情報を含む。
%inst
Process32First 関数 (tlhelp32.h)
は、システムスナップショット内で最初に見つかったプロセスに関する情報を取得する。

[戻り値]
プロセスリストの最初のエントリがバッファへコピーされた場合は TRUE、それ以外は FALSE
を返す。プロセスが存在しない、またはスナップショットにプロセス情報が含まれていない場合、GetLastError 関数は
ERROR_NO_MORE_FILES エラー値を返す。

[備考]
呼び出し側アプリケーションは、PROCESSENTRY32 の dwSize
メンバを構造体のサイズ（バイト単位）に設定しなければならない。
同じスナップショットに記録された他のプロセスの情報を取得するには Process32Next 関数を使う。


%index
Process32Next
Process32Next 関数 (tlhelp32.h) は、システムスナップショットに記録された次のプロセスに関する情報を取得する。
%group
Win32 kernel32
%prm
hSnapshot, lppe
hSnapshot : [intptr] CreateToolhelp32Snapshot 関数の直前の呼び出しから返されたスナップショットのハンドル。
lppe : [var] PROCESSENTRY32 構造体へのポインタ。
%inst
Process32Next 関数 (tlhelp32.h) は、システムスナップショットに記録された次のプロセスに関する情報を取得する。

[戻り値]
プロセスリストの次のエントリがバッファへコピーされた場合は TRUE、それ以外は FALSE
を返す。プロセスが存在しない、またはスナップショットにプロセス情報が含まれていない場合、GetLastError 関数は
ERROR_NO_MORE_FILES エラー値を返す。

[備考]
スナップショットに記録された最初のプロセスの情報を取得するには Process32First 関数を使う。


%index
ProcessIdToSessionId
指定したプロセスに関連付けられたリモートデスクトップサービスのセッションを取得する。
%group
Win32 kernel32
%prm
dwProcessId, pSessionId
dwProcessId : [int] プロセス識別子を指定する。現在のプロセスのプロセス識別子を取得するには GetCurrentProcessId 関数を使う。
pSessionId : [var] 指定したプロセスが動作しているリモートデスクトップサービスのセッション識別子を受け取る変数へのポインタ。現在コンソールに接続しているセッションの識別子を取得するには WTSGetActiveConsoleSessionId 関数を使う。
%inst
指定したプロセスに関連付けられたリモートデスクトップサービスのセッションを取得する。

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 である。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
呼び出し側は指定プロセスに対して PROCESS_QUERY_INFORMATION
アクセス権を持たなければならない。詳細は「プロセスのセキュリティとアクセス権」を参照。


%index
PulseEvent
指定したイベントオブジェクトをシグナル状態に設定し、適切な数の待機中スレッドを解放した後に非シグナル状態へリセットする。
%group
Win32 kernel32
%prm
hEvent
hEvent : [intptr] イベントオブジェクトのハンドル。CreateEvent または OpenEvent 関数がこのハンドルを返す。
%inst
指定したイベントオブジェクトをシグナル状態に設定し、適切な数の待機中スレッドを解放した後に非シグナル状態へリセットする。

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 である。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
同期オブジェクトを待機しているスレッドは、カーネルモード APC によって一時的に待機状態から取り除かれ、APC
完了後に待機状態へ戻されることがある。PulseEvent
の呼び出しが、スレッドが待機状態から取り除かれている間に発生すると、PulseEvent
は呼び出された瞬間に待機しているスレッドしか解放しないため、そのスレッドは解放されない。したがって PulseEvent
は信頼性がなく、新しいアプリケーションで使うべきではない。代わりに条件変数を使う。手動リセットイベントオブジェクトでは、即座に解放可能なすべての待機中スレッドが解放される。その後、関数はイベントオブジェクトの状態を非シグナル状態に戻して戻る。自動リセットイベントオブジェクトでは、複数のスレッドが待機していても単一の待機中スレッドを解放した後、状態を非シグナル状態にリセットして戻る。待機スレッドがない、または即座に解放できるスレッドがない場合、PulseEvent
は単にイベントオブジェクトの状態を非シグナル状態に設定して戻る。指定したすべてのオブジェクトがシグナル状態になるのを待つ複数オブジェクト待機関数を使うスレッドについては、PulseEvent
は待機関数を戻すことなくイベントオブジェクトの状態をシグナル状態に設定して非シグナル状態にリセットすることに注意。これは指定したオブジェクトのすべてが同時にシグナル状態でない場合に発生する。Windows
7 で
[SignalObjectAndWait](/windows/win32/api/synchapi/nf-synchapi-signalobjectandwait)
と PulseEvent を使う場合は、これらの API
を複数スレッド間で使用するとアプリケーションのデッドロックを引き起こす可能性があるため、細心の注意を払うこと。SignalObjectAndWait
でシグナルされたスレッドは、SignalObjectAndWait 呼び出しの待機オブジェクトをシグナルするために PulseEvent
を呼ぶ。状況によっては、SignalObjectAndWait
の呼び出し側が待機オブジェクトのシグナル状態を時間内に受信できず、デッドロックを引き起こすことがある。


%index
PurgeComm
指定した通信リソースの出力バッファまたは入力バッファからすべての文字を破棄する。また、リソース上の保留中の読み取りまたは書き込み操作を終了することもできる。
%group
Win32 kernel32
%prm
hFile, dwFlags
hFile : [intptr] 通信リソースのハンドル。CreateFile 関数がこのハンドルを返す。
dwFlags : [int] 
%inst

指定した通信リソースの出力バッファまたは入力バッファからすべての文字を破棄する。また、リソース上の保留中の読み取りまたは書き込み操作を終了することもできる。

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 である。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
スレッドが PurgeComm
を使って出力バッファをフラッシュした場合、削除された文字は送信されない。出力バッファを空にしながら内容が確実に送信されるようにするには、FlushFileBuffers
関数（同期操作）を呼ぶ。ただし FlushFileBuffers
はフロー制御の対象だが書き込みタイムアウトの対象ではなく、保留中のすべての書き込み操作が送信されるまで戻らない。


%index
QueryActCtxW
QueryActCtxW 関数は、アクティベーションコンテキストを照会する。
%group
Win32 kernel32
%prm
dwFlags, hActCtx, pvSubInstance, ulInfoClass, pvBuffer, cbBuffer, pcbWrittenOrRequired
dwFlags : [int] このパラメータには、次のフラグビットのいずれかを設定する。
hActCtx : [intptr] 照会対象のアクティベーションコンテキストへのハンドル。
pvSubInstance : [intptr] アクティベーションコンテキスト内のアセンブリ、またはアセンブリとファイルの組み合わせのインデックス。pvSubInstance の意味は ulInfoClass パラメータの値で指定されるオプションに依存する。このパラメータは NULL でもよい。
ulInfoClass : [int] このパラメータには、次の表に示す値のみを指定できる。
pvBuffer : [intptr] 返される情報を保持するバッファへのポインタ。このパラメータは省略可能。pvBuffer が NULL の場合、cbBuffer は 0 でなければならない。pvBuffer が指すバッファのサイズが小さすぎる場合、QueryActCtxW は ERROR_INSUFFICIENT_BUFFER を返し、バッファにはデータが書き込まれない。必要なバッファサイズを決定する方法については Remarks セクションを参照。
cbBuffer : [int] pvBuffer が指すバッファのサイズ(バイト単位)。このパラメータは省略可能。
pcbWrittenOrRequired : [var] 書き込まれた、または必要となるバイト数。pcbWrittenOrRequired は pvBuffer が NULL の場合にのみ NULL にできる。pcbWrittenOrRequired が非 NULL の場合、返されるバッファを格納するために必要なバイト数が設定される。
%inst
QueryActCtxW 関数は、アクティベーションコンテキストを照会する。

[戻り値]
関数が成功した場合は TRUE を返す。そうでない場合は FALSE を返す。この関数は GetLastError
で取得可能なエラーを設定する。例については Retrieving the Last-Error Code
を参照。エラーコードの完全な一覧は System Error Codes を参照。

[備考]
cbBuffer パラメータは pvBuffer が指すバッファのサイズをバイト単位で指定する。pvBuffer が NULL
の場合、cbBuffer は 0 でなければならない。pcbWrittenOrRequired は pvBuffer が NULL
の場合のみ NULL にできる。pcbWrittenOrRequired が戻り時に非 NULL
の場合、返される情報を格納するために必要なバイト数が設定される。返される情報データが与えられたバッファより大きい場合、QueryActCtxW
は ERROR_INSUFFICIENT_BUFFER を返し、pvBuffer
が指すバッファにはデータが書き込まれない。次の例では、まず小さなバッファで呼び出し、バッファが小さすぎる場合に再度呼び出す方法を示す。
（以下省略）


%index
QueryActCtxSettingsW
QueryActCtxSettingsW 関数は、アクティベーションコンテキスト、ならびに照会対象となる属性の名前空間および名前を指定する。
%group
Win32 kernel32
%prm
dwFlags, hActCtx, settingsNameSpace, settingName, pvBuffer, dwBuffer, pdwWrittenOrRequired
dwFlags : [int] この値は 0 でなければならない。
hActCtx : [intptr] 問い合わせ対象のアクティベーションコンテキストのハンドル。
settingsNameSpace : [wstr] 値 "http://schemas.microsoft.com/SMI/2005/WindowsSettings" を含む文字列へのポインタ、または NULL。これらの値は等価である。
settingName : [wstr] 照会する属性の名前。
pvBuffer : [wstr] 問い合わせ結果を受け取るバッファへのポインタ。
dwBuffer : [int] 問い合わせ結果を受け取るバッファのサイズ（文字単位）。
pdwWrittenOrRequired : [var] pvBuffer で指定されたバッファに書き込まれた文字数、または問い合わせ結果を保持するのに必要な文字数を示す値へのポインタ。
%inst
QueryActCtxSettingsW
関数は、アクティベーションコンテキスト、ならびに照会対象となる属性の名前空間および名前を指定する。

[戻り値]
関数が成功した場合は TRUE を返す。そうでない場合は FALSE を返す。この関数は GetLastError
で取得可能なエラーを設定する。例については Retrieving the Last-Error Code
を参照。エラーコードの完全な一覧は System Error Codes を参照。


%index
QueryDosDeviceW
MS-DOS デバイス名に関する情報を取得する。(QueryDosDeviceW)
%group
Win32 kernel32
%prm
lpDeviceName, lpTargetPath, ucchMax
lpDeviceName : [wstr] 照会対象を指定する MS-DOS デバイス名文字列。デバイス名の末尾にバックスラッシュを付けることはできない。たとえば "C:\\" ではなく "C:" を使用する。このパラメータは NULL でもよい。その場合、QueryDosDevice 関数は既存の全 MS-DOS デバイス名の一覧を lpTargetPath が指すバッファに格納する。
lpTargetPath : [wstr] 照会結果を受け取るバッファへのポインタ。関数はこのバッファに 1 つ以上の NULL 終端文字列を書き込む。最後の NULL 終端文字列の後にはさらに NULL が続く。lpDeviceName が非 NULL の場合、関数は lpDeviceName で指定される個別の MS-DOS デバイスに関する情報を取得する。バッファに最初に格納される NULL 終端文字列はそのデバイスの現在のマッピングである。それ以外の NULL 終端文字列は、そのデバイスに対する削除されていない以前のマッピングを表す。lpDeviceName が NULL の場合、関数は既存の全 MS-DOS デバイス名の一覧を取得する。バッファに格納される各 NULL 終端文字列は、既存の MS-DOS デバイス(例: \Device\HarddiskVolume1 や \Device\Floppy0)の名前である。
ucchMax : [int] lpTargetPath が指すバッファに格納できる TCHAR の最大数。
%inst
MS-DOS デバイス名に関する情報を取得する。(QueryDosDeviceW)

[戻り値]
関数が成功した場合、戻り値は lpTargetPath が指すバッファに格納された TCHAR 数である。関数が失敗した場合、戻り値は 0
である。拡張エラー情報を取得するには GetLastError を呼び出す。バッファが小さすぎる場合、関数は失敗し、最終エラーコードは
ERROR_INSUFFICIENT_BUFFER となる。

[備考]
DefineDosDevice 関数により、アプリケーションは MS-DOS
デバイス名前空間を実装するジャンクションの作成と変更ができる。Windows Server 2003 および Windows XP:
QueryDosDevice はまずローカル MS-DOS デバイス名前空間を検索する。デバイス名が見つからない場合、続いてグローバル
MS-DOS デバイス名前空間を検索する。既存の全 MS-DOS デバイス名を照会する場合、返されるデバイス名の一覧は
"LocalSystem" コンテキストで実行されているかに依存する。その場合、グローバル MS-DOS
デバイス名前空間に含まれるデバイス名のみが返される。そうでない場合、グローバルおよびローカル MS-DOS
デバイス名前空間のデバイス名の連結が返される。両方の名前空間に同じデバイス名が存在する場合、QueryDosDevice はローカル
MS-DOS デバイス名前空間のエントリを返す。グローバルおよびローカル MS-DOS デバイス名前空間と MS-DOS
デバイス名のアクセス性の変更に関する詳細は Defining an MS DOS Device Name を参照。Windows 8
および Windows Server 2012 において、この関数は次の技術でサポートされる。
（以下省略）


%index
QueryFullProcessImageNameW
指定したプロセスの実行可能イメージの完全な名前を取得する。(Unicode)
%group
Win32 kernel32
%prm
hProcess, dwFlags, lpExeName, lpdwSize
hProcess : [intptr] プロセスへのハンドル。このハンドルは PROCESS_QUERY_INFORMATION または PROCESS_QUERY_LIMITED_INFORMATION アクセス権で作成する必要がある。詳細は Process Security and Access Rights を参照。
dwFlags : [int] 
lpExeName : [wstr] 実行可能イメージへのパス。関数が成功した場合、この文字列は NULL 終端される。
lpdwSize : [var] 入力時は lpExeName バッファのサイズを文字数で指定する。成功時は、NULL 終端文字を含まずにバッファへ書き込まれた文字数を受け取る。
%inst
指定したプロセスの実行可能イメージの完全な名前を取得する。(Unicode)

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 である。拡張エラー情報を取得するには
GetLastError を呼び出す。

[備考]
この関数を使用するアプリケーションをコンパイルするには、_WIN32_WINNT を 0x0600 以上に定義する。
> [!NOTE] > winbase.h ヘッダは、UNICODE プリプロセッサ定数の定義に基づいて ANSI 版または
Unicode 版を自動選択するエイリアスとして QueryFullProcessImageName
を定義する。エンコーディング中立なエイリアスとエンコーディング中立でないコードを混在させるとコンパイル時または実行時エラーの原因となる。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
QueryIdleProcessorCycleTime
システム内の各プロセッサのアイドルスレッドのサイクルタイムを取得する。
%group
Win32 kernel32
%prm
BufferLength, ProcessorIdleCycleTime
BufferLength : [var] 入力時は ProcessorIdleCycleTime バッファのサイズをバイト単位で指定する。このバッファはグループ内のプロセッサ数の 8 倍であることが期待される。出力時はバッファへ書き込まれた要素数を設定する。バッファサイズが不十分な場合、関数は失敗し、このパラメータは必要なバッファ長を受け取る。
ProcessorIdleCycleTime : [var] 各アイドルスレッドが使用した CPU クロックサイクル数。このバッファはシステム内のプロセッサ数の 8 倍のサイズでなければならない。
%inst
システム内の各プロセッサのアイドルスレッドのサイクルタイムを取得する。

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 である。拡張エラー情報を取得するには
GetLastError を呼び出す。

[備考]
この関数を使用するアプリケーションをコンパイルするには、_WIN32_WINNT を 0x0600 以上に定義する。


%index
QueryIdleProcessorCycleTimeEx
指定したプロセッサグループ内の各論理プロセッサ上のアイドルスレッドの累積サイクルタイムを取得する。
%group
Win32 kernel32
%prm
Group, BufferLength, ProcessorIdleCycleTime
Group : [int] サイクルタイムを取得する対象のプロセッサグループ番号。
BufferLength : [var] 入力時は ProcessorIdleCycleTime バッファのサイズをバイト単位で指定する。このバッファはグループ内のプロセッサ数の 8 倍であることが期待される。出力時はバッファへ書き込まれた要素数を設定する。バッファサイズが不十分な場合、関数は失敗し、このパラメータは必要なバッファ長を受け取る。
ProcessorIdleCycleTime : [var] 各アイドルスレッドが使用した CPU クロックサイクル数。このパラメータが NULL の場合、関数は BufferLength パラメータを必要な長さで更新する。
%inst
指定したプロセッサグループ内の各論理プロセッサ上のアイドルスレッドの累積サイクルタイムを取得する。

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 である。拡張エラー情報を取得するには
GetLastError を使用する。

[備考]
この関数を使用するアプリケーションをコンパイルするには、_WIN32_WINNT を _WIN32_WINNT_WIN7
以上に設定する。詳細は Using the Windows Headers を参照。


%index
QueryInformationJobObject
ジョブオブジェクトから制限およびジョブ状態情報を取得する。
%group
Win32 kernel32
%prm
hJob, JobObjectInformationClass, lpJobObjectInformation, cbJobObjectInformationLength, lpReturnLength
hJob : [intptr] 情報を照会するジョブへのハンドル。CreateJobObject または OpenJobObject 関数がこのハンドルを返す。ハンドルは JOB_OBJECT_QUERY アクセス権を持つ必要がある。詳細は Job Object Security and Access Rights を参照。
JobObjectInformationClass : [int] 
lpJobObjectInformation : [intptr] 制限またはジョブ状態情報。このデータの形式は JobObjectInfoClass パラメータの値に依存する。
cbJobObjectInformationLength : [int] 照会するジョブ情報のサイズ(バイト単位)。この値は JobObjectInfoClass パラメータの値に依存する。
lpReturnLength : [var] lpJobObjectInfo パラメータが指す構造体へ書き込まれたデータの長さを受け取る変数へのポインタ。この情報が不要な場合は NULL を指定する。
%inst
ジョブオブジェクトから制限およびジョブ状態情報を取得する。

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 である。拡張エラー情報を取得するには
GetLastError を呼び出す。

[備考]
現在の制限を取得して変更するには QueryInformationJobObject を使用する。新しい制限を設定するには
SetInformationJobObject
関数を使用する。この関数を使用するアプリケーションをコンパイルするには、_WIN32_WINNT を 0x0500 以上に定義する。詳細は
Using the Windows Headers を参照。


%index
QueryIoRateControlInformationJobObject
ジョブオブジェクトの I/O レート制御に関する情報を取得する。
%group
Win32 kernel32
%prm
hJob, VolumeName, InfoBlocks, InfoBlockCount
hJob : [intptr] 情報を照会するジョブへのハンドル。このハンドルは CreateJobObject または OpenJobObject 関数から取得する。ハンドルは JOB_OBJECT_QUERY アクセス権を持つ必要がある。アクセス権の詳細は Job Object Security and Access Rights を参照。この値が NULL で、QueryIoRateControlInformationJobObject を呼び出すプロセスがジョブに関連付けられている場合、関数はそのプロセスに関連付けられたジョブを使用する。ジョブが別のジョブに入れ子になっている場合、関数はそのプロセスの直近のジョブを使用する。
VolumeName : [wstr] 照会するボリュームの名前。この値が NULL の場合、関数はシステム上の全ボリュームについてジョブの I/O レート制御に関する情報を取得する。
InfoBlocks : [var] ジョブの I/O レート制御に関する情報を含む JOBOBJECT_IO_RATE_CONTROL_INFORMATION 構造体の配列へのポインタ。呼び出し側コードはこの配列のメモリを、配列のアドレスを指定して FreeMemoryJobObject 関数を呼び出すことで解放する必要がある。
InfoBlockCount : [var] InfoBlocks パラメータが指す配列内に関数が割り当てた JOBOBJECT_IO_RATE_CONTROL_INFORMATION 構造体の数。
%inst
ジョブオブジェクトの I/O レート制御に関する情報を取得する。

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 である。拡張エラー情報を取得するには
GetLastError を呼び出す。

[備考]
重要 Windows 10 バージョン 1607 以降、この関数はサポートされない。


%index
QueryMemoryResourceNotification
指定したメモリリソースオブジェクトの状態を取得する。
%group
Win32 kernel32
%prm
ResourceNotificationHandle, ResourceState
ResourceNotificationHandle : [intptr] メモリリソース通知オブジェクトへのハンドル。CreateMemoryResourceNotification 関数がこのハンドルを返す。
ResourceState : [var] このパラメータが指すメモリは、メモリリソース通知オブジェクトの状態を受け取る。指定されたメモリ条件が存在する場合は TRUE、存在しない場合は FALSE が設定される。
%inst
指定したメモリリソースオブジェクトの状態を取得する。

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 である。より詳しいエラー情報を取得するには
GetLastError を呼び出す。

[備考]
待機関数と異なり、QueryMemoryResourceNotification
は呼び出し側スレッドをブロックしない。したがって、操作を進める前に物理メモリの状態を確認する効率的な手段となる。この関数を使用するアプリケーションをコンパイルするには、_WIN32_WINNT
マクロを 0x0501 以上に定義する。詳細は Using the Windows Headers を参照。


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
QueryProcessAffinityUpdateMode
指定したプロセスのアフィニティ更新モードを取得する。
%group
Win32 kernel32
%prm
hProcess, lpdwFlags
hProcess : [intptr] プロセスへのハンドル。ハンドルは PROCESS_QUERY_INFORMATION または PROCESS_QUERY_LIMITED_INFORMATION アクセス権を持つ必要がある。詳細は Process Security and Access Rights を参照。
lpdwFlags : [var] 
%inst
指定したプロセスのアフィニティ更新モードを取得する。

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 である。拡張エラー情報を取得するには
GetLastError を呼び出す。

[備考]
この関数を呼び出すアプリケーションをコンパイルするには、_WIN32_WINNT を 0x0600 以上に定義する。詳細は Using
the Windows Headers を参照。


%index
QueryProcessCycleTime
指定したプロセスの全スレッドのサイクルタイムの合計を取得する。
%group
Win32 kernel32
%prm
ProcessHandle, CycleTime
ProcessHandle : [intptr] プロセスへのハンドル。ハンドルは PROCESS_QUERY_INFORMATION または PROCESS_QUERY_LIMITED_INFORMATION アクセス権を持つ必要がある。詳細は Process Security and Access Rights を参照。
CycleTime : [var] プロセスのスレッドが使用した CPU クロックサイクル数。この値にはユーザモードとカーネルモードの両方のサイクルが含まれる。
%inst
指定したプロセスの全スレッドのサイクルタイムの合計を取得する。

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 である。拡張エラー情報を取得するには
GetLastError を呼び出す。

[備考]
システム内のプロセスを列挙するには EnumProcesses
関数を使用する。この関数を使用するアプリケーションをコンパイルするには、_WIN32_WINNT を 0x0600 以上に定義する。


%index
QueryThreadCycleTime
指定したスレッドのサイクルタイムを取得する。
%group
Win32 kernel32
%prm
ThreadHandle, CycleTime
ThreadHandle : [intptr] スレッドへのハンドル。ハンドルは PROCESS_QUERY_INFORMATION または PROCESS_QUERY_LIMITED_INFORMATION アクセス権を持つ必要がある。詳細は Process Security and Access Rights を参照。
CycleTime : [var] スレッドが使用した CPU クロックサイクル数。この値にはユーザモードとカーネルモードの両方のサイクルが含まれる。
%inst
指定したスレッドのサイクルタイムを取得する。

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 である。拡張エラー情報を取得するには
GetLastError を呼び出す。

[備考]
プロセスのスレッドを列挙するには Thread32First および Thread32Next
関数を使用する。スレッド識別子からスレッドハンドルを取得するには OpenThread
関数を使用する。QueryThreadCycleTime が返す CPU
クロックサイクルを経過時間に変換しようとしてはならない。この関数は CPU が提供するタイマサービスを使用するが、その実装は CPU
によって異なる可能性がある。たとえば、CPU 動作周波数を変更する際にタイマ周波数も変化する CPU もあれば、固定レートのままとする
CPU もある。各 CPU の動作は CPU
ベンダ提供のドキュメントに記載されている。この関数を使用するアプリケーションをコンパイルするには、_WIN32_WINNT を
0x0600 以上に定義する。


%index
QueryThreadProfiling
指定したスレッドでスレッドプロファイリングが有効かを判定する。
%group
Win32 kernel32
%prm
ThreadHandle, Enabled
ThreadHandle : [intptr] 対象スレッドへのハンドル。
Enabled : [var] 指定したスレッドでスレッドプロファイリングが有効な場合は TRUE、それ以外は FALSE となる。
%inst
指定したスレッドでスレッドプロファイリングが有効かを判定する。

[戻り値]
呼び出しが成功した場合は ERROR_SUCCESS を返す。それ以外はシステムエラーコード(Winerror.h を参照)を返す。


%index
QueryThreadpoolStackInformation
指定したスレッドプール内のスレッドのスタック予約サイズおよびコミットサイズを取得する。
%group
Win32 kernel32
%prm
ptpp, ptpsi
ptpp : [intptr] スレッドプールを指定する TP_POOL 構造体へのポインタ。CreateThreadpool 関数がこのポインタを返す。
ptpsi : [var] スタックの予約サイズとコミットサイズを受け取る TP_POOL_STACK_INFORMATION 構造体へのポインタ。
%inst
指定したスレッドプール内のスレッドのスタック予約サイズおよびコミットサイズを取得する。

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 である。拡張エラー情報を取得するには
GetLastError を呼び出す。

[備考]
この関数を使用するアプリケーションをコンパイルするには、_WIN32_WINNT を _WIN32_WINNT_WIN7
に設定する。詳細は Using the Windows Headers を参照。


%index
QueryUmsThreadInformation
指定したユーザモードスケジューリング(UMS)ワーカースレッドに関する情報を取得する。
%group
Win32 kernel32
%prm
UmsThread, UmsThreadInfoClass, UmsThreadInformation, UmsThreadInformationLength, ReturnLength
UmsThread : [intptr] UMS スレッドコンテキストへのポインタ。
UmsThreadInfoClass : [int] 取得する情報の種類を指定する UMS_THREAD_INFO_CLASS 値。
UmsThreadInformation : [intptr] 指定した情報を受け取るバッファへのポインタ。必要なバッファサイズは指定した情報クラスに依存する。情報クラスが UmsThreadContext または UmsThreadTeb の場合、バッファは sizeof(PVOID) でなければならない。UmsThreadIsSuspended または UmsThreadIsTerminated の場合は sizeof(BOOLEAN) でなければならない。
UmsThreadInformationLength : [int] UmsThreadInformation バッファのサイズ(バイト単位)。
ReturnLength : [var] ULONG 変数へのポインタ。出力時、このパラメータは UmsThreadInformation バッファに書き込まれたバイト数を受け取る。
%inst
指定したユーザモードスケジューリング(UMS)ワーカースレッドに関する情報を取得する。

[戻り値]
関数が成功した場合、0 以外の値を返す。関数が失敗した場合、戻り値は 0 である。拡張エラー情報を取得するには GetLastError
を呼び出す。可能なエラー値は以下を含む。
（以下省略）

[備考]
QueryUmsThreadInformation 関数は、指定された UMS
ワーカースレッドについて、そのアプリケーション定義コンテキスト、スレッド実行ブロック(TEB)、およびスレッドが中断または終了しているかなどの情報を取得する。UMS
ワーカースレッドの基盤構造はシステムが管理する。QueryUmsThreadInformation
によって公開されていない情報は予約されているとみなすこと。


%index
QueryUnbiasedInterruptTime
現在のバイアスなし割り込み時刻カウントを 100 ナノ秒単位で取得する。バイアスなし割り込み時刻カウントには、システムがスリープまたは休止状態で費やした時間は含まれない。
%group
Win32 kernel32
%prm
UnbiasedTime
UnbiasedTime : [var] TBD
%inst
現在のバイアスなし割り込み時刻カウントを 100
ナノ秒単位で取得する。バイアスなし割り込み時刻カウントには、システムがスリープまたは休止状態で費やした時間は含まれない。

[戻り値]
関数が成功した場合、戻り値は 0 以外である。NULL パラメータで呼び出されたために関数が失敗した場合、戻り値は 0 である。

[備考]
割り込み時刻カウントはシステム起動時に 0
から開始し、クロック割り込みごとにクロックティックの長さだけ増加する。クロックティックの正確な長さは基盤となるハードウェアに依存し、システムごとに異なる可能性がある。QueryUnbiasedInterruptTime
関数で取得される割り込み時刻カウントは、システムが稼動状態にある時間のみを反映する。したがって、スリープや休止状態で費やした時間によって
"バイアス"
されない。システムは一部の操作(スリープ中に期限が切れるはずだった相対タイマを起床時に即座に期限切れにする、など)のためにバイアスされた割り込み時刻を使用する。システム時刻と異なり、割り込み時刻カウントはユーザまたは
Windows
タイムサービスによる調整の対象とならない。アプリケーションはシステム時刻より細かい期間を計測するために割り込み時刻カウントを使用できる。割り込み時刻カウントより高い精度を必要とするアプリケーションは高分解能タイマを使用すべきである。高分解能タイマの周波数を取得するには
QueryPerformanceFrequency 関数を、カウンタ値を取得するには QueryPerformanceCounter
関数を使用する。timeBeginPeriod および timeEndPeriod 関数で設定されるタイマ分解能は
QueryUnbiasedInterruptTime
関数の分解能に影響する。ただし、タイマ分解能を上げると、プロセッサが省電力状態に入れなくなり全体的なシステム性能の低下と消費電力の増加を招くため推奨されない。代わりに高分解能タイマを使用すべきである。注:
QueryUnbiasedInterruptTime 関数はデバッグ("checked")ビルドの Windows
では異なる結果を生成する。割り込み時刻カウントとティックカウントが約 49
日分進められるためである。これにより、システムが長時間稼動するまで発生しないバグを特定しやすくなる。checked ビルドは MSDN
サブスクライバが MSDN サイトを通じて入手できる。この関数を使用するアプリケーションをコンパイルするには、_WIN32_WINNT を
0x0601 以上に定義する。詳細は Using the Windows Headers を参照。


%index
QueueUserAPC
ユーザモードの非同期プロシージャ呼び出し(APC)オブジェクトを、指定したスレッドの APC キューに追加する。(QueueUserAPC)
%group
Win32 kernel32
%prm
pfnAPC, hThread, dwData
pfnAPC : [int] 指定されたスレッドがアラート可能な待機操作を実行したときに呼び出される、アプリケーション側で用意した APC 関数へのポインタ。詳細は [PAPCFUNC callback function](../winnt/nc-winnt-papcfunc.md) を参照。
hThread : [intptr] スレッドへのハンドル。ハンドルは **THREAD_SET_CONTEXT** アクセス権を持つ必要がある。詳細は [Synchronization Object Security and Access Rights](/windows/desktop/Sync/synchronization-object-security-and-access-rights) を参照。
dwData : [int] *pfnAPC* パラメータが指す APC 関数に渡される単一の値。
%inst
ユーザモードの非同期プロシージャ呼び出し(APC)オブジェクトを、指定したスレッドの APC
キューに追加する。(QueueUserAPC)

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 である。拡張エラー情報を取得するには
[GetLastError](/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror)
を呼び出す。**Windows Server 2003 および Windows XP:** この関数には GetLastError
で取得可能なエラー値は定義されていない。

[備考]
特殊なユーザモード APC については [QueueUserAPC2
function](nf-processthreadsapi-queueuserapc2.md)
を参照。オペレーティングシステムが提供する APC サポートにより、アプリケーションは APC
オブジェクトをスレッドにキューイングできる。APC が使用する関数を確実に実行するため、APC
は呼び出し側プロセス内のスレッドにのみキューイングすべきである。>[!NOTE] > 呼び出し側プロセス外のスレッドに APC
をキューイングすることは、いくつかの理由で推奨されない。DLL のリベースにより、APC
が使用する関数のアドレスが呼び出し側プロセス外での実行時に正しくない可能性がある。同様に、64 ビットプロセスが 32 ビットプロセスへ
APC
をキューイングする(またはその逆)場合、アドレスは正しくなくアプリケーションはクラッシュする。アドレスが判明していても、他の要因が関数の正常実行を妨げる場合がある。各スレッドは独自の
APC キューを持つ。APC のキューイングは、スレッドに APC
関数を呼び出すよう要求することである。オペレーティングシステムはソフトウェア割り込みを発行し、スレッドに APC
関数の呼び出しを指示する。ユーザモード APC がキューイングされた場合、スレッドはアラート可能な状態にならない限り APC
関数を呼び出すよう指示されない。スレッドがアラート可能な状態になると、キュー内の保留中 APC
を先入れ先出し(FIFO)順に全て処理し、待機操作は **WAIT_IO_COMPLETION** を返す。スレッドは [SleepEx
function](../synchapi/nf-synchapi-sleepex.md)、[SignalObjectAndWait
function](../synchapi/nf-synchapi-signalobjectandwait.md)、[WaitForSingleObjectEx
function](../synchapi/nf-synchapi-waitforsingleobjectex.md)、[WaitForMultipleObjectsEx
function](../synchapi/nf-synchapi-waitformultipleobjectsex.md)、または
[MsgWaitForMultipleObjectsEx
function](../winuser/nf-winuser-msgwaitformultipleobjectsex.md)
を使用することでアラート可能な状態になる。スレッドが実行開始する前にアプリケーションが APC をキューイングした場合、スレッドはまず
APC 関数の呼び出しから開始する。スレッドが APC 関数を呼び出した後、APC キュー内の全 APC に対する APC
関数を呼び出す。APC 内部からオブジェクトをスリープまたは待機することが可能である。APC 内でアラート可能な待機を実行すると、APC
を再帰的にディスパッチすることになり、スタックオーバーフローを引き起こしうる。スレッドが [ExitThread
function](nf-processthreadsapi-exitthread.md) または [TerminateThread
function](nf-processthreadsapi-terminatethread.md) で終了されるとき、APC キュー内の
APC は失われ、APC 関数は呼び出されない。スレッドが終了処理中であるとき、QueueUserAPC を呼び出してスレッドの APC
キューに追加しようとすると **(31) ERROR_GEN_FAILURE** で失敗する。[ReadFileEx
function](../fileapi/nf-fileapi-readfileex.md)、[SetWaitableTimer
function](../synchapi/nf-synchapi-setwaitabletimer.md)、および
[WriteFileEx function](../fileapi/nf-fileapi-writefileex.md) は APC
を完了通知コールバック機構として使用して実装されている点に注意すること。この関数を使用するアプリケーションをコンパイルするには、**_WIN32_WINNT**
を 0x0400 以上に定義する。詳細は [Using the Windows
Headers](/windows/desktop/WinProg/using-the-windows-headers) を参照。


%index
QueueUserWorkItem
スレッドプール内のワーカースレッドにワークアイテムをキューイングする。
%group
Win32 kernel32
%prm
Function, Context, Flags
Function : [int] スレッドプール内のスレッドで実行される、LPTHREAD_START_ROUTINE 型のアプリケーション定義コールバック関数へのポインタ。この値はスレッドの開始アドレスを表す。このコールバック関数は TerminateThread 関数を呼び出してはならない。コールバック関数の戻り値は使用されない。詳細は ThreadProc を参照。
Context : [intptr] スレッド関数に渡される単一のパラメータ値。
Flags : [int] 
%inst
スレッドプール内のワーカースレッドにワークアイテムをキューイングする。

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 である。拡張エラー情報を取得するには
GetLastError を呼び出す。

[備考]
DLL 内の関数をワーカースレッドへキューイングする場合、DLL
がアンロードされる前に関数が実行完了することを確認すること。既定ではスレッドプールはプロセスあたり最大 512
スレッドである。キュー制限を引き上げるには WinNT.h で定義される WT_SET_MAX_THREADPOOL_THREAD
マクロを使用する。
（以下省略）


%index
RaiseException
呼び出し側スレッドで例外を発生させる。
%group
Win32 kernel32
%prm
dwExceptionCode, dwExceptionFlags, nNumberOfArguments, lpArguments
dwExceptionCode : [int] 発生させる例外のアプリケーション定義例外コード。例外ハンドラのフィルタ式および例外ハンドラブロックは、GetExceptionCode 関数を使用してこの値を取得できる。
dwExceptionFlags : [int] 例外フラグ。継続可能な例外を示すには 0、継続不可能な例外を示すには EXCEPTION_NONCONTINUABLE を指定する。継続不可能な例外後に実行を継続しようとすると EXCEPTION_NONCONTINUABLE_EXCEPTION 例外が発生する。
nNumberOfArguments : [int] lpArguments 配列内の引数の数。この値は EXCEPTION_MAXIMUM_PARAMETERS を超えてはならない。lpArguments が NULL の場合、このパラメータは無視される。
lpArguments : [var] 引数の配列。このパラメータは NULL でもよい。これらの引数には、例外ハンドラのフィルタ式に渡す必要があるアプリケーション定義のデータを含めることができる。
%inst
呼び出し側スレッドで例外を発生させる。

[戻り値]
この関数は値を返さない。

[備考]
RaiseException
関数により、プロセスは構造化例外処理を用いてプライベート、ソフトウェア生成、アプリケーション定義の例外を処理できる。例外を発生させると、例外ディスパッチャは次の例外ハンドラ検索を行う。
（以下省略）


%index
ReOpenFile
指定したファイルシステムオブジェクトを、異なるアクセス権、共有モード、フラグで再度開く。
%group
Win32 kernel32
%prm
hOriginalFile, dwDesiredAccess, dwShareMode, dwFlagsAndAttributes
hOriginalFile : [intptr] 再度開くオブジェクトへのハンドル。オブジェクトは CreateFile 関数で作成されたものでなければならない。
dwDesiredAccess : [int] オブジェクトに必要なアクセス。値の一覧については File Security and Access Rights を参照。まだハンドルが開いている以前の開く要求で指定された共有モードと競合するアクセスモードを要求することはできない。このパラメータが 0 の場合、アプリケーションはデバイスにアクセスせずにデバイス属性を照会できる。これは、フロッピーを挿入することなくフロッピーディスクドライブのサイズやサポートするフォーマットを判定したい場合などに役立つ。
dwShareMode : [int] オブジェクトの共有モード。まだハンドルが開いている以前の開く要求で指定されたアクセスモードと競合する共有モードを要求することはできない。このパラメータが 0 で CreateFile が成功した場合、オブジェクトは共有不可となり、ハンドルが閉じられるまで再度開くことはできない。プロセスがオブジェクトを開いている間に他のプロセスと共有できるようにするには、1 つ以上の組み合わせを使用する。
dwFlagsAndAttributes : [int] 
%inst
指定したファイルシステムオブジェクトを、異なるアクセス権、共有モード、フラグで再度開く。

[戻り値]
関数が成功した場合、戻り値は指定したファイルへの開いたハンドルである。関数が失敗した場合、戻り値は
INVALID_HANDLE_VALUE である。拡張エラー情報を取得するには GetLastError を呼び出す。

[備考]
dwFlags
パラメータにはファイル属性フラグ(FILE_ATTRIBUTE_*)を含めることはできない。これらはファイル作成時にのみ指定できる。Windows
8 および Windows Server 2012 において、この関数は次の技術でサポートされる。
（以下省略）


%index
ReadConsoleW
コンソール入力バッファから文字入力を読み取り、バッファから削除する。
%group
Win32 kernel32
%prm
hConsoleInput, lpBuffer, nNumberOfCharsToRead, lpNumberOfCharsRead, pInputControl
hConsoleInput : [intptr] コンソール入力バッファへのハンドル。ハンドルは **GENERIC\_READ** アクセス権を持つ必要がある。詳細は [Console Buffer Security and Access Rights](console-buffer-security-and-access-rights.md) を参照。
lpBuffer : [intptr] コンソール入力バッファから読み取られたデータを受け取るバッファへのポインタ。
nNumberOfCharsToRead : [int] 読み取る文字数。*lpBuffer* パラメータが指すバッファのサイズは少なくとも `nNumberOfCharsToRead * sizeof(TCHAR)` バイトであるべきである。
lpNumberOfCharsRead : [var] 実際に読み取られた文字数を受け取る変数へのポインタ。
pInputControl : [var] 読み取り操作の終了を知らせる制御文字を指定する [**CONSOLE\_READCONSOLE\_CONTROL**](console-readconsole-control.md) 構造体へのポインタ。このパラメータは **NULL** でもよい。既定ではこのパラメータは Unicode 入力を必要とする。ANSI モードの場合はこのパラメータを **NULL** に設定する。
%inst
コンソール入力バッファから文字入力を読み取り、バッファから削除する。

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 である。拡張エラー情報を取得するには
[**GetLastError**](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror)
を呼び出す。

[備考]
**ReadConsole**
はコンソールの入力バッファからキーボード入力を読み取る。[**ReadFile**](/windows/win32/api/fileapi/nf-fileapi-readfile)
関数と同様に動作するが、Unicode(ワイド文字)または ANSI
モードのいずれかで読み取れる点が異なる。両モードに互換性のある単一のソースセットを維持するアプリケーションでは **ReadFile**
ではなく **ReadConsole** を使用する。**ReadConsole**
はコンソール入力バッファハンドルでのみ使用できるが、**ReadFile**
は他のハンドル(ファイルやパイプなど)でも使用できる。**ReadConsole**
は、コンソールハンドル以外にリダイレクトされた標準ハンドルと一緒に使用すると失敗する。[**ReadFile**](/windows/win32/api/fileapi/nf-fileapi-readfile)
の動作に影響する全ての入力モードは **ReadConsole**
にも同じ影響を与える。コンソール入力バッファの入力モードを取得および設定するには、[**GetConsoleMode**](getconsolemode.md)
および [**SetConsoleMode**](setconsolemode.md)
関数を使用する。入力バッファにキーボードイベント以外の入力イベント(マウスイベントやウィンドウリサイズイベントなど)が含まれる場合、それらは破棄される。それらのイベントは
[**ReadConsoleInput**](readconsoleinput.md)
関数を使用することでのみ読み取ることができる。[!INCLUDE
[setting-codepage-mode-remarks](./includes/setting-codepage-mode-remarks.md)]
*pInputControl*
パラメータは、[**CONSOLE\_READCONSOLE\_CONTROL**](console-readconsole-control.md)
構造体で指定されるファイル完了制御文字に応答して、読み取りからの中間起床を有効にするために使用できる。この機能は、コマンド拡張が有効であること、標準出力ハンドルがコンソール出力ハンドルであること、および入力が
Unicode であることを必要とする。**Windows Server 2003 および Windows XP/2000:**
中間読み取り機能はサポートされない。**クックドモード** は、コンソール入力ハンドルに対し
[**SetConsoleMode**](setconsolemode.md) で **ENABLE_LINE_INPUT**
が設定されている状態である。クックドモードでは、コンソールホストがコマンドラインアプリケーションに代わって編集行を提供し、**ReadFile**
または **ReadConsole** への呼び出しは Enter キーが押されるまで戻らない。**中間読み取り**
は、クックド読み取りモードにおける **ReadConsole**
呼び出しに対するその動作の拡張である。[**CONSOLE\_READCONSOLE\_CONTROL**](console-readconsole-control.md)
構造体の [**dwCtrlWakeupMask**](console-readconsole-control.md)
にフラグを設定し、**ReadConsole** 呼び出し時にそれを *pinputControl*
に渡すと、読み取りは必ずしも改行を待たず、指定された文字で戻るようになる。


%index
ReadConsoleInputW
コンソール入力バッファからデータを読み取り、バッファから削除する。
%group
Win32 kernel32
%prm
hConsoleInput, lpBuffer, nLength, lpNumberOfEventsRead
hConsoleInput : [intptr] コンソール入力バッファへのハンドル。ハンドルは **GENERIC\_READ** アクセス権を持つ必要がある。詳細は [Console Buffer Security and Access Rights](console-buffer-security-and-access-rights.md) を参照。
lpBuffer : [var] 入力バッファデータを受け取る [**INPUT\_RECORD**](input-record-str.md) 構造体の配列へのポインタ。
nLength : [int] *lpBuffer* パラメータが指す配列のサイズ(配列要素数)。
lpNumberOfEventsRead : [var] 読み取られた入力レコード数を受け取る変数へのポインタ。
%inst
コンソール入力バッファからデータを読み取り、バッファから削除する。

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 である。拡張エラー情報を取得するには
[**GetLastError**](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror)
を呼び出す。

[備考]
*nLength*
パラメータで要求されたレコード数がバッファ内で利用可能なレコード数を超えている場合、利用可能な数が読み取られる。関数は少なくとも 1
つの入力レコードが読み取られるまで戻らない。プロセスは、未読のコンソール入力があるかを判定するために、[wait
functions](/windows/win32/sync/wait-functions)
のいずれかにコンソール入力バッファハンドルを指定できる。入力バッファが空でない場合、コンソール入力バッファハンドルの状態はシグナル状態となる。コンソールの入力バッファ内の未読入力レコード数を判定するには
[**GetNumberOfConsoleInputEvents**](getnumberofconsoleinputevents.md)
関数を使用する。未読レコード数に影響を与えずにコンソール入力バッファから入力レコードを読み取るには
[**PeekConsoleInput**](peekconsoleinput.md)
関数を使用する。コンソールの入力バッファ内の未読レコードを全て破棄するには
[**FlushConsoleInputBuffer**](flushconsoleinputbuffer.md)
関数を使用する。[!INCLUDE
[setting-codepage-mode-remarks](./includes/setting-codepage-mode-remarks.md)]


%index
ReadConsoleOutputW
コンソールスクリーンバッファ内の矩形状の文字セルブロックから文字と色属性データを読み取り、宛先バッファへ書き込む。
%group
Win32 kernel32
%prm
hConsoleOutput, lpBuffer, dwBufferSize, dwBufferCoord, lpReadRegion
hConsoleOutput : [intptr] コンソールスクリーンバッファへのハンドル。ハンドルは **GENERIC\_READ** アクセス権を持つ必要がある。詳細は [Console Buffer Security and Access Rights](console-buffer-security-and-access-rights.md) を参照。
lpBuffer : [var] コンソールスクリーンバッファから読み取られたデータを受け取る宛先バッファへのポインタ。このポインタは [**CHAR\_INFO**](char-info-str.md) 構造体の二次元配列の始点として扱われ、そのサイズは *dwBufferSize* パラメータで指定される。
dwBufferSize : [var] *lpBuffer* パラメータのサイズ(文字セル単位)。[**COORD**](coord-str.md) 構造体の **X** メンバは列数、**Y** メンバは行数を表す。
dwBufferCoord : [var] コンソールスクリーンバッファから読み取られたデータを受け取る *lpBuffer* パラメータ内の左上セルの座標。[**COORD**](coord-str.md) 構造体の **X** メンバは列、**Y** メンバは行を表す。
lpReadRegion : [var] [**SMALL\_RECT**](small-rect-str.md) 構造体へのポインタ。入力時、構造体のメンバは関数が読み取り対象とするコンソールスクリーンバッファ矩形の左上および右下座標を指定する。出力時、構造体のメンバは実際に使用された矩形を指定する。
%inst
コンソールスクリーンバッファ内の矩形状の文字セルブロックから文字と色属性データを読み取り、宛先バッファへ書き込む。

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 である。拡張エラー情報を取得するには
[**GetLastError**](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror)
を呼び出す。

[備考]
**ReadConsoleOutput**
はコンソールスクリーンバッファと宛先バッファを二次元配列(文字セルの列と行)として扱う。*lpReadRegion*
パラメータが指す矩形は、コンソールスクリーンバッファから読み取るブロックのサイズと位置を指定する。同サイズの宛先矩形が、*dwBufferCoord*
パラメータの座標を左上セルとして *lpBuffer*
配列内に配置される。コンソールスクリーンバッファのソース矩形内のセルから読み取ったデータは、宛先バッファの対応するセルへコピーされる。対応するセルが(*dwBufferSize*
パラメータで指定された)宛先バッファ矩形の境界外にある場合、データはコピーされない。コンソールスクリーンバッファの境界内に収まらない座標に対応する宛先バッファのセルは変更されない。言い換えれば、これらは読み取るためのスクリーンバッファデータが存在しないセルである。**ReadConsoleOutput**
は戻る前に、*lpReadRegion*
パラメータが指す構造体のメンバを、宛先バッファへコピーされたセルの実際のスクリーンバッファ矩形に設定する。この矩形は、**ReadConsoleOutput**
がソース矩形の範囲をコンソールスクリーンバッファの境界に合わせてクリップした結果、宛先バッファに対応するセルが存在したソース矩形のセルを反映する。*lpReadRegion*
で指定した矩形がコンソールスクリーンバッファの境界外に完全にあるか、対応する矩形が宛先バッファの境界外に完全に配置された場合、データはコピーされない。この場合、関数は
*lpReadRegion* が指す構造体のメンバの **Right** を **Left** より小さく、または **Bottom**
を **Top** より小さく設定して戻る。コンソールスクリーンバッファのサイズを判定するには
[**GetConsoleScreenBufferInfo**](getconsolescreenbufferinfo.md)
関数を使用する。**ReadConsoleOutput**
関数はコンソールスクリーンバッファのカーソル位置に影響を与えない。コンソールスクリーンバッファの内容はこの関数によって変更されない。[!INCLUDE
[setting-codepage-mode-remarks](./includes/setting-codepage-mode-remarks.md)]
[!INCLUDE [no-vt-equiv-banner](./includes/no-vt-equiv-banner.md)]


%index
ReadConsoleOutputAttribute
指定した位置から始まるコンソールスクリーンバッファの連続するセルから、指定した数の文字属性をコピーする。
%group
Win32 kernel32
%prm
hConsoleOutput, lpAttribute, nLength, dwReadCoord, lpNumberOfAttrsRead
hConsoleOutput : [intptr] コンソールスクリーンバッファへのハンドル。ハンドルは **GENERIC\_READ** アクセス権を持つ必要がある。詳細は [Console Buffer Security and Access Rights](console-buffer-security-and-access-rights.md) を参照。
lpAttribute : [var] コンソールスクリーンバッファで使用されている属性を受け取るバッファへのポインタ。詳細は [Character Attributes](console-screen-buffers.md#character-attributes) を参照。
nLength : [int] 読み取り元のスクリーンバッファ文字セル数。*lpAttribute* パラメータが指すバッファのサイズは `nLength * sizeof(WORD)` であるべきである。
dwReadCoord : [var] 読み取りを開始するコンソールスクリーンバッファ内の最初のセルの座標(文字単位)。[**COORD**](coord-str.md) 構造体の **X** メンバは列、**Y** メンバは行を表す。
lpNumberOfAttrsRead : [var] 実際に読み取られた属性の数を受け取る変数へのポインタ。
%inst
指定した位置から始まるコンソールスクリーンバッファの連続するセルから、指定した数の文字属性をコピーする。

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 である。拡張エラー情報を取得するには
[**GetLastError**](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror)
を呼び出す。

[備考]

読み取る属性数が指定したスクリーンバッファ行の末尾を越える場合、次の行から属性が読み取られる。読み取る属性数がコンソールスクリーンバッファの末尾を越える場合、コンソールスクリーンバッファの末尾までの属性が読み取られる。[!INCLUDE
[no-vt-equiv-banner](./includes/no-vt-equiv-banner.md)]


%index
ReadConsoleOutputCharacterW
指定した位置から始まるコンソールスクリーンバッファの連続するセルから、指定した数の文字をコピーする。
%group
Win32 kernel32
%prm
hConsoleOutput, lpCharacter, nLength, dwReadCoord, lpNumberOfCharsRead
hConsoleOutput : [intptr] コンソールスクリーンバッファへのハンドル。ハンドルは **GENERIC\_READ** アクセス権を持つ必要がある。詳細は [Console Buffer Security and Access Rights](console-buffer-security-and-access-rights.md) を参照。
lpCharacter : [wstr] コンソールスクリーンバッファから読み取られた文字を受け取るバッファへのポインタ。
nLength : [int] 読み取り元のスクリーンバッファ文字セル数。*lpCharacter* パラメータが指すバッファのサイズは `nLength * sizeof(TCHAR)` であるべきである。
dwReadCoord : [var] 読み取りを開始するコンソールスクリーンバッファ内の最初のセルの座標(文字単位)。[**COORD**](coord-str.md) 構造体の **X** メンバは列、**Y** メンバは行を表す。
lpNumberOfCharsRead : [var] 実際に読み取られた文字数を受け取る変数へのポインタ。
%inst
指定した位置から始まるコンソールスクリーンバッファの連続するセルから、指定した数の文字をコピーする。

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 である。拡張エラー情報を取得するには
[**GetLastError**](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror)
を呼び出す。

[備考]

読み取る文字数が指定したスクリーンバッファ行の末尾を越える場合、次の行から文字が読み取られる。読み取る文字数がコンソールスクリーンバッファの末尾を越える場合、コンソールスクリーンバッファの末尾までの文字が読み取られる。[!INCLUDE
[setting-codepage-mode-remarks](./includes/setting-codepage-mode-remarks.md)]
[!INCLUDE [no-vt-equiv-banner](./includes/no-vt-equiv-banner.md)]


%index
ReadDirectoryChangesW
指定したディレクトリ内の変更内容を記述する情報を取得する。
%group
Win32 kernel32
%prm
hDirectory, lpBuffer, nBufferLength, bWatchSubtree, dwNotifyFilter, lpBytesReturned, lpOverlapped, lpCompletionRoutine
hDirectory : [intptr] 監視対象ディレクトリへのハンドル。このディレクトリは FILE_LIST_DIRECTORY アクセス権、または FILE_LIST_DIRECTORY を含む GENERIC_READ などのアクセス権で開く必要がある。
lpBuffer : [intptr] 読み取り結果が返される、DWORD にアラインされた書式付きバッファへのポインタ。このバッファの構造は FILE_NOTIFY_INFORMATION 構造体で定義される。このバッファは、ディレクトリの開き方と lpOverlapped パラメータに与えられた値に応じて、同期または非同期に埋められる。詳細は Remarks セクションを参照。
nBufferLength : [int] lpBuffer パラメータが指すバッファのサイズ(バイト単位)。
bWatchSubtree : [int] このパラメータが TRUE の場合、関数は指定したディレクトリをルートとするディレクトリツリーを監視する。FALSE の場合、関数は hDirectory パラメータで指定されたディレクトリのみを監視する。
dwNotifyFilter : [int] 待機操作が完了したかを判定するために関数がチェックするフィルタ条件。
lpBytesReturned : [var] 同期呼び出しの場合、このパラメータは lpBuffer パラメータへ転送されたバイト数を受け取る。非同期呼び出しの場合、このパラメータは未定義である。転送されたバイト数の取得には非同期通知手法を使用しなければならない。
lpOverlapped : [var] 非同期操作中に使用するデータを提供する OVERLAPPED 構造体へのポインタ。それ以外の場合はこの値は NULL である。この構造体の Offset および OffsetHigh メンバは使用されない。
lpCompletionRoutine : [int] 操作が完了またはキャンセルされ、呼び出し側スレッドがアラート可能な待機状態にあるときに呼び出される完了ルーチンへのポインタ。この完了ルーチンの詳細は FileIOCompletionRoutine を参照。
%inst
指定したディレクトリ内の変更内容を記述する情報を取得する。

[戻り値]
関数が成功した場合、戻り値は 0
以外である。同期呼び出しではこれは操作が成功したことを意味する。非同期呼び出しでは操作が正常にキューイングされたことを示す。関数が失敗した場合、戻り値は
0 である。拡張エラー情報を取得するには GetLastError
を呼び出す。ネットワークリダイレクタまたは対象ファイルシステムがこの操作をサポートしない場合、関数は
ERROR_INVALID_FUNCTION で失敗する。

[備考]
ディレクトリへのハンドルを取得するには、CreateFile 関数を FILE_FLAG_BACKUP_SEMANTICS
フラグ付きで使用する。ReadDirectoryChangesW
の呼び出しは同期または非同期で完了できる。非同期完了を指定するには、上記のように CreateFile でディレクトリを開き、さらに
dwFlagsAndAttributes パラメータに FILE_FLAG_OVERLAPPED 属性を指定する。次に
ReadDirectoryChangesW を呼び出す際に OVERLAPPED
構造体を指定する。**ReadDirectoryChangesW**
を最初に呼び出すと、システムは変更情報を格納するバッファを割り当てる。このバッファはディレクトリハンドルが閉じられるまで関連付けられ、その生存期間中にサイズは変化しない。この関数への呼び出し間に発生するディレクトリ変更はバッファに追加され、次の呼び出しで返される。バッファがオーバーフローすると、**ReadDirectoryChangesW**
は依然として **true** を返すが、バッファの全内容は破棄され、*lpBytesReturned* パラメータは 0
となる。これは発生した全ての変更を保持するにはバッファが小さすぎたことを示す。同期完了成功時には lpBuffer
パラメータは書式付きバッファとなり、バッファへ書き込まれたバイト数は lpBytesReturned で取得できる。転送バイト数が 0
の場合、バッファはシステムが割り当てるには大きすぎたか、ディレクトリまたはサブツリー内で発生した全変更に関する詳細情報を提供するには小さすぎたかのいずれかである。この場合、ディレクトリまたはサブツリーを列挙することで変更を算出すべきである。非同期完了では、3
つの方法のいずれかで通知を受け取ることができる。
（以下省略）


%index
ReadDirectoryChangesExW
指定したディレクトリ内の変更内容を記述する情報を取得する。情報の種類によっては拡張情報を含めることもできる。
%group
Win32 kernel32
%prm
hDirectory, lpBuffer, nBufferLength, bWatchSubtree, dwNotifyFilter, lpBytesReturned, lpOverlapped, lpCompletionRoutine, ReadDirectoryNotifyInformationClass
hDirectory : [intptr] 監視対象ディレクトリへのハンドル。このディレクトリは FILE_LIST_DIRECTORY アクセス権、または FILE_LIST_DIRECTORY を含む GENERIC_READ などのアクセス権で開く必要がある。
lpBuffer : [intptr] ReadDirectoryChangesExW が読み取り結果を返すべき、DWORD にアラインされた書式付きバッファへのポインタ。このバッファの構造は、ReadDirectoryNotifyInformationClass パラメータの値が ReadDirectoryNotifyExtendedInformation の場合は FILE_NOTIFY_EXTENDED_INFORMATION 構造体で、ReadDirectoryNotifyInformation の場合は FILE_NOTIFY_INFORMATION 構造体で定義される。このバッファは、ディレクトリの開き方と lpOverlapped パラメータに与えられた値に応じて、同期または非同期に埋められる。詳細は Remarks セクションを参照。
nBufferLength : [int] lpBuffer パラメータが指すバッファのサイズ(バイト単位)。
bWatchSubtree : [int] このパラメータが TRUE の場合、関数は指定したディレクトリをルートとするディレクトリツリーを監視する。FALSE の場合、関数は hDirectory パラメータで指定されたディレクトリのみを監視する。
dwNotifyFilter : [int] 待機操作が完了したかを判定するために関数がチェックするフィルタ条件。
lpBytesReturned : [var] 同期呼び出しの場合、このパラメータは lpBuffer パラメータへ転送されたバイト数を受け取る。非同期呼び出しの場合、このパラメータは未定義である。転送されたバイト数の取得には非同期通知手法を使用しなければならない。
lpOverlapped : [var] 非同期操作中に使用するデータを提供する OVERLAPPED 構造体へのポインタ。それ以外の場合はこの値は NULL である。この構造体の Offset および OffsetHigh メンバは使用されない。
lpCompletionRoutine : [int] 操作が完了またはキャンセルされ、呼び出し側スレッドがアラート可能な待機状態にあるときに呼び出される完了ルーチンへのポインタ。この完了ルーチンの詳細は FileIOCompletionRoutine を参照。
ReadDirectoryNotifyInformationClass : [int] ReadDirectoryChangesExW が lpBuffer パラメータが指すバッファへ書き込む情報の種類。情報を FILE_NOTIFY_INFORMATION 構造体で構成する場合は ReadDirectoryNotifyInformation を、FILE_NOTIFY_EXTENDED_INFORMATION 構造体で構成する場合は ReadDirectoryNotifyExtendedInformation を指定する。
%inst
指定したディレクトリ内の変更内容を記述する情報を取得する。情報の種類によっては拡張情報を含めることもできる。

[戻り値]
関数が成功した場合、戻り値は 0
以外である。同期呼び出しではこれは操作が成功したことを意味する。非同期呼び出しでは操作が正常にキューイングされたことを示す。関数が失敗した場合、戻り値は
0 である。拡張エラー情報を取得するには GetLastError
を呼び出す。ネットワークリダイレクタまたは対象ファイルシステムがこの操作をサポートしない場合、関数は
ERROR_INVALID_FUNCTION で失敗する。

[備考]
ディレクトリへのハンドルを取得するには、CreateFile 関数を FILE_FLAG_BACKUP_SEMANTICS
フラグ付きで使用する。ReadDirectoryChangesExW
の呼び出しは同期または非同期で完了できる。非同期完了を指定するには、上記のように CreateFile でディレクトリを開き、さらに
dwFlagsAndAttributes パラメータに FILE_FLAG_OVERLAPPED 属性を指定する。次に
ReadDirectoryChangesExW を呼び出す際に OVERLAPPED
構造体を指定する。**ReadDirectoryChangesExW**
を最初に呼び出すと、システムは変更情報を格納するバッファを割り当てる。このバッファはディレクトリハンドルが閉じられるまで関連付けられ、その生存期間中にサイズは変化しない。この関数への呼び出し間に発生するディレクトリ変更はバッファに追加され、次の呼び出しで返される。バッファがオーバーフローすると、**ReadDirectoryChangesExW**
は依然として **true** を返すが、バッファの全内容は破棄され、*lpBytesReturned* パラメータは 0
となる。これは発生した全ての変更を保持するにはバッファが小さすぎたことを示す。同期完了成功時には lpBuffer
パラメータは書式付きバッファとなり、バッファへ書き込まれたバイト数は lpBytesReturned で取得できる。転送バイト数が 0
の場合、バッファはシステムが割り当てるには大きすぎたか、ディレクトリまたはサブツリー内で発生した全変更に関する詳細情報を提供するには小さすぎたかのいずれかである。この場合、ディレクトリまたはサブツリーを列挙することで変更を算出すべきである。非同期完了では、3
つの方法のいずれかで通知を受け取ることができる。
（以下省略）


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
ReadFileEx
指定したファイルまたは入出力(I/O)デバイスからデータを読み取る。完了状態は非同期に報告され、読み取りが完了またはキャンセルされ、呼び出し側スレッドがアラート可能な待機状態にあるときに指定した完了ルーチンを呼び出す。
%group
Win32 kernel32
%prm
hFile, lpBuffer, nNumberOfBytesToRead, lpOverlapped, lpCompletionRoutine
hFile : [intptr] ファイルまたは I/O デバイス(例: ファイル、ファイルストリーム、物理ディスク、ボリューム、コンソールバッファ、テープドライブ、ソケット、通信リソース、メールスロット、パイプ)へのハンドル。このパラメータには、CreateFile 関数で FILE_FLAG_OVERLAPPED フラグ付きで開いた任意のハンドル、または socket もしくは accept 関数が返すソケットハンドルを指定できる。このハンドルはまた GENERIC_READ アクセス権を持つ必要がある。アクセス権の詳細は File Security and Access Rights を参照。
lpBuffer : [var] ファイルまたはデバイスから読み取られたデータを受け取るバッファへのポインタ。このバッファは読み取り操作の間有効でなければならない。アプリケーションは読み取り操作が完了するまでこのバッファを使用してはならない。
nNumberOfBytesToRead : [int] 読み取るバイト数。
lpOverlapped : [var] 非同期(オーバーラップ)ファイル読み取り操作中に使用するデータを提供する OVERLAPPED データ構造体へのポインタ。バイトオフセットをサポートするファイルでは、ファイルから読み取りを開始するバイトオフセットを指定する必要がある。このオフセットは OVERLAPPED 構造体の Offset および OffsetHigh メンバを設定することで指定する。バイトオフセットをサポートしないファイルまたはデバイスでは、Offset および OffsetHigh は無視される。ReadFileEx 関数は OVERLAPPED 構造体の hEvent メンバを無視する。アプリケーションは ReadFileEx 呼び出しの文脈でそのメンバを独自の目的のために自由に使用できる。ReadFileEx は lpCompletionRoutine が指す完了ルーチンを呼び出すか、呼び出しをキューイングすることで読み取り操作の完了を通知するため、イベントハンドルを必要としない。ReadFileEx 関数は OVERLAPPED 構造体の Internal および InternalHigh メンバを使用する。アプリケーションはこれらのメンバを設定してはならない。OVERLAPPED データ構造体は読み取り操作の間有効でなければならない。読み取り操作の完了を待っている間にスコープ外となる変数にしてはならない。
lpCompletionRoutine : [int] 読み取り操作が完了し、呼び出し側スレッドがアラート可能な待機状態にあるときに呼び出される完了ルーチンへのポインタ。完了ルーチンの詳細は FileIOCompletionRoutine を参照。
%inst

指定したファイルまたは入出力(I/O)デバイスからデータを読み取る。完了状態は非同期に報告され、読み取りが完了またはキャンセルされ、呼び出し側スレッドがアラート可能な待機状態にあるときに指定した完了ルーチンを呼び出す。

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 である。拡張エラー情報を取得するには
GetLastError を呼び出す。関数が成功した場合、呼び出し側スレッドには非同期 I/O
操作(ファイルからのオーバーラップ読み取り操作)が保留状態となる。この I/O
操作が完了し、呼び出し側スレッドがアラート可能な待機状態でブロックされているとき、システムは lpCompletionRoutine
が指す関数を呼び出し、待機状態は WAIT_IO_COMPLETION
の戻りコードで完了する。関数が成功し、ファイル読み取り操作が完了しても、呼び出し側スレッドがアラート可能な待機状態でない場合、システムは完了ルーチンの呼び出しをキューイングし、呼び出し側スレッドがアラート可能な待機状態に入るまで保留する。アラート可能な待機とオーバーラップ入出力操作の詳細は
About Synchronization を参照。ReadFileEx
がファイル終端(EOF)を越えて読み取ろうとした場合、その操作に対する GetOverlappedResult の呼び出しは FALSE
を返し、GetLastError は ERROR_HANDLE_EOF を返す。

[備考]
ReadFileEx を使用する際は、関数が "成功" を返した場合でも、"成功" であるが知りたい結果を伴う状態がないかを判断するために
GetLastError を確認するべきである。たとえば ReadFileEx 呼び出し時のバッファオーバーフローは TRUE
を返すが、GetLastError はそのオーバーフローを ERROR_MORE_DATA
で報告する。関数呼び出しが成功し警告状態がない場合、GetLastError は ERROR_SUCCESS を返す。未処理の非同期
I/O 要求が多すぎる場合、ReadFileEx 関数は失敗する可能性がある。そのような失敗時、GetLastError は
ERROR_INVALID_USER_BUFFER または ERROR_NOT_ENOUGH_MEMORY
を返すことがある。全ての保留中の非同期 I/O 操作をキャンセルするには、次のいずれかを使用する。
（以下省略）


%index
ReadFileScatter
ファイルからデータを読み取り、複数のバッファの配列に格納する。
%group
Win32 kernel32
%prm
hFile, aSegmentArray, nNumberOfBytesToRead, lpReserved, lpOverlapped
hFile : [intptr] 読み取り対象のファイルへのハンドル。ファイルハンドルは **GENERIC_READ** 権限、および **FILE_FLAG_OVERLAPPED** と **FILE_FLAG_NO_BUFFERING** フラグで作成する必要がある。詳細は File Security and Access Rights を参照。
aSegmentArray : [var] データを受け取る [FILE_SEGMENT_ELEMENT structure](../winnt/ns-winnt-file_segment_element.md) バッファの配列へのポインタ。この共用体の説明は [Remarks](#remarks) を参照。各要素は 1 ページ分のデータを受け取れる。> [!NOTE] > システムページサイズを判定するには GetSystemInfo を使用する。配列は *nNumberOfBytesToRead* バイトのデータを格納するのに十分な要素数と、終端 **NULL** のための 1 要素を加えて含む必要がある。たとえば 40 KB を読み取る場合でページサイズが 4 KB の場合、配列はデータ用の 10 要素と **NULL** 用の 1 要素で合計 11 要素を持つ必要がある。各バッファは少なくともシステムメモリページのサイズ以上であり、システムメモリページサイズの境界にアラインされていなければならない。システムは各バッファにシステムメモリ 1 ページ分のデータを読み取る。関数はデータを順序通りに各バッファへ格納する。たとえば、まず最初のバッファ、次に 2 番目のバッファ、というように、各バッファが埋まり全データが格納されるかバッファがなくなるまで続く。
nNumberOfBytesToRead : [int] ファイルから読み取るバイト総数。*aSegmentArray* の各要素はこの総数の 1 ページ分を格納する。ファイルは **FILE_FLAG_NO_BUFFERING** で開く必要があるため、バイト数はファイルが存在するファイルシステムのセクタサイズの倍数でなければならない。
lpReserved : [var] このパラメータは将来の使用のために予約されており、**NULL** でなければならない。
lpOverlapped : [var] OVERLAPPED データ構造体へのポインタ。**ReadFileScatter** 関数は有効な OVERLAPPED 構造体を必要とする。*lpOverlapped* パラメータは **NULL** にできない。**ReadFileScatter** 関数は OVERLAPPED 構造体の **Offset** および **OffsetHigh** メンバで指定された位置からファイルのデータを読み取り始める。**ReadFileScatter** 関数は読み取り操作が完了する前に戻ることがある。その場合、**ReadFileScatter** 関数は 0 を返し、GetLastError 関数は **ERROR_IO_PENDING** を返す。この **ReadFileScatter** の非同期動作により、呼び出し側プロセスは読み取り操作が完了する間処理を続行できる。読み取り操作の完了に関する情報を取得するには GetOverlappedResult、HasOverlappedIoCompleted、または GetQueuedCompletionStatus 関数を呼び出せる。詳細は Synchronous and Asynchronous I/O を参照。
%inst
ファイルからデータを読み取り、複数のバッファの配列に格納する。

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 である。拡張エラー情報を取得するには
GetLastError 関数を呼び出す。**ReadFileScatter**
がファイル終端(EOF)を越えて読み取ろうとした場合、その操作に対する GetOverlappedResult の呼び出しは
**FALSE** を返し、GetLastError は **ERROR_HANDLE_EOF**
を返す。関数が読み取り操作の完了前に戻った場合、関数は 0 を返し、GetLastError は **ERROR_IO_PENDING**
を返す。

[備考]
この関数は Itanium ベースシステムの WOW64 上の 32
ビットアプリケーションではサポートされない。[FILE_SEGMENT_ELEMENT
structure](../winnt/ns-winnt-file_segment_element.md) は次のように定義されている。
（以下省略）


%index
ReadProcessMemory
指定したプロセス内のメモリ領域からデータを読み取る。読み取る全領域がアクセス可能でなければ、操作は失敗する。
%group
Win32 kernel32
%prm
hProcess, lpBaseAddress, lpBuffer, nSize, lpNumberOfBytesRead
hProcess : [intptr] メモリが読み取られるプロセスへのハンドル。ハンドルはそのプロセスに対する PROCESS_VM_READ アクセス権を持つ必要がある。
lpBaseAddress : [intptr] 指定したプロセス内で読み取りを開始するベースアドレスへのポインタ。データ転送が行われる前に、システムはベースアドレスと指定サイズのメモリ内の全データが読み取りアクセス可能であることを検証し、アクセスできない場合は関数は失敗する。
lpBuffer : [intptr] 指定したプロセスのアドレス空間からの内容を受け取るバッファへのポインタ。
nSize : [int] 指定したプロセスから読み取るバイト数。
lpNumberOfBytesRead : [var] 指定したバッファへ転送されたバイト数を受け取る変数へのポインタ。*lpNumberOfBytesRead* が **NULL** の場合、このパラメータは無視される。
%inst
指定したプロセス内のメモリ領域からデータを読み取る。読み取る全領域がアクセス可能でなければ、操作は失敗する。

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 である。拡張エラー情報を取得するには
[GetLastError](../errhandlingapi/nf-errhandlingapi-getlasterror.md)
を呼び出す。要求された読み取り操作がプロセスのアクセス不能な領域に跨る場合、関数は失敗する。

[備考]
**ReadProcessMemory**
は、指定したアドレス範囲のデータを指定したプロセスのアドレス空間から現在のプロセスの指定したバッファへコピーする。PROCESS_VM_READ
アクセスを持つハンドルを保持するプロセスであれば、この関数を呼び出すことができる。読み取る全領域はアクセス可能でなければならず、アクセス不能の場合は関数は失敗する。


%index
ReadThreadProfilingData
スレッドに関連付けられた、指定したプロファイリングデータを読み取る。
%group
Win32 kernel32
%prm
PerformanceDataHandle, Flags, PerformanceData
PerformanceDataHandle : [intptr] EnableThreadProfiling 関数が返したハンドル。
Flags : [int] 読み取るカウンタデータを指定する次のフラグの 1 つ以上。フラグは EnableThreadProfiling 関数呼び出し時に設定されている必要がある。
PerformanceData : [var] スレッドプロファイリングおよびハードウェアカウンタデータを含む PERFORMANCE_DATA 構造体。
%inst
スレッドに関連付けられた、指定したプロファイリングデータを読み取る。

[戻り値]
呼び出しが成功した場合は ERROR_SUCCESS を返す。それ以外はシステムエラーコード(Winerror.h を参照)を返す。


%index
RegisterApplicationRecoveryCallback
アプリケーションのアクティブなインスタンスを復旧用に登録する。
%group
Win32 kernel32
%prm
pRecoveyCallback, pvParameter, dwPingInterval, dwFlags
pRecoveyCallback : [int] 復旧コールバック関数へのポインタ。詳細は ApplicationRecoveryCallback を参照。
pvParameter : [intptr] コールバック関数に渡される変数へのポインタ。NULL でもよい。
dwPingInterval : [int] 復旧 ping 間隔(ミリ秒単位)。既定では 5 秒(RECOVERY_DEFAULT_PING_INTERVAL)である。最大間隔は 5 分である。0 を指定した場合、既定の間隔が使用される。まだアクティブに復旧中であることを ARR に示すには、指定した間隔内に ApplicationRecoveryInProgress 関数を呼び出す必要がある。そうしないと WER は復旧を終了する。通常、復旧は各反復が ping 間隔を超えない長さで行うループで実行する。各反復は復旧作業の一区切りを行い、続いて ApplicationRecoveryInProgress を呼び出す。ApplicationRecoveryInProgress はユーザが復旧をキャンセルしたいかを判定するためにも使用されるため、不必要な作業を大量に行わないように、より小さな間隔を検討すべきである。
dwFlags : [int] 将来の使用のために予約されている。0 を設定する。
%inst
アプリケーションのアクティブなインスタンスを復旧用に登録する。

[戻り値]
この関数は成功時に S_OK を返すか、次のエラーコードのいずれかを返す。
（以下省略）

[備考]
アプリケーションが未処理例外に遭遇したり無応答になった場合、Windows Error Reporting (WER)
は指定された復旧コールバックを呼び出す。このコールバックはデータおよび状態情報を保存するために使用すべきである。WER
にアプリケーションの再起動を要求するために RegisterApplicationRestart
関数も呼び出す場合、この情報を利用できる。インストーラがアプリケーションのコンポーネントを更新しようとする場合、WER
は復旧コールバックを呼び出さない。更新の場合にデータおよび状態情報を保存するには、WM_QUERYENDSESSION および
WM_ENDSESSION メッセージを処理すべきである。詳細は各メッセージを参照。これらのメッセージへの応答のタイムアウトは 5
秒である。利用可能な復旧時間の大半は WM_CLOSE メッセージ(30
秒)にある。更新可能なコンソールアプリケーションは復旧を開始するために CTRL_C_EVENT 通知を使用する(詳細は
HandlerRoutine コールバック関数を参照)。ハンドラが完了するためのタイムアウトは 30
秒である。復旧に必要な時間を短縮するため、アプリケーションは定期的にデータおよび状態情報を保存することを検討すべきである。


%index
RegisterApplicationRestart
アプリケーションのアクティブなインスタンスを再起動用に登録する。
%group
Win32 kernel32
%prm
pwzCommandline, dwFlags
pwzCommandline : [wstr] アプリケーションが再起動される際のコマンドライン引数を指定する Unicode 文字列へのポインタ。指定可能なコマンドラインの最大サイズは RESTART_MAX_CMD_LINE 文字である。コマンドラインには実行可能ファイル名を含めてはならない。関数が追加する。このパラメータが NULL または空文字列の場合、以前に登録されたコマンドラインは削除される。引数に空白が含まれる場合は引数を引用符で囲む。
dwFlags : [int] 
%inst
アプリケーションのアクティブなインスタンスを再起動用に登録する。

[戻り値]
この関数は成功時に S_OK を返すか、次のエラーコードのいずれかを返す。
（以下省略）

[備考]

再起動のための最初の登録は、アプリケーションが未処理例外に遭遇したり無応答になる前に行う必要がある。その後、コマンドラインを更新するために復旧コールバック内からこの関数を呼び出すことができる。更新される
Windows アプリケーションの場合、この関数を呼び出す最後の機会は WM_QUERYENDSESSION
メッセージの処理中である。更新されるコンソールアプリケーションの場合、登録はインストーラがアプリケーションをシャットダウンしようとする前に行う必要がある(登録は常に最新に保つ必要がある。CTRL_C_EVENT
通知の処理中にこの関数を呼び出すことはできない)。再起動を登録していてアプリケーションが未処理例外に遭遇したり応答しなくなった場合、ユーザにアプリケーションを再起動する機会が提供される。ユーザの同意なしにアプリケーションが自動的に再起動されることはない。ただし、アプリケーションが更新されて再起動を必要とする場合、アプリケーションは自動的に再起動される。循環的な再起動を防ぐため、システムはアプリケーションが最低
60
秒以上実行されていた場合にのみ再起動する。更新がコンピュータ再起動を必要とする場合にアプリケーションが再起動されるには、インストーラは
EWX_RESTARTAPPS フラグを設定して ExitWindowsEx 関数を、または SHUTDOWN_RESTARTAPPS
フラグを設定して InitiateShutdown 関数を呼び出す必要がある点に注意。


%index
RegisterBadMemoryNotification
1 つ以上の不良メモリページが検出されたときに呼び出される不良メモリ通知を登録する。
%group
Win32 kernel32
%prm
Callback
Callback : [int] 登録するアプリケーション定義の BadMemoryCallbackRoutine 関数へのポインタ。
%inst
1 つ以上の不良メモリページが検出されたときに呼び出される不良メモリ通知を登録する。

[戻り値]
コールバック通知を表す登録ハンドル。不要になった際に UnregisterBadMemoryNotification
関数に渡すことができる。

[備考]
この関数を呼び出すアプリケーションをコンパイルするには、_WIN32_WINNT を _WIN32_WINNT_WIN8
以上に定義する。詳細は Using the Windows Headers を参照。


%index
RegisterWaitForSingleObject
スレッドプール内の待機スレッドにオブジェクトを待機するよう指示する。
%group
Win32 kernel32
%prm
phNewWaitObject, hObject, Callback, Context, dwMilliseconds, dwFlags
phNewWaitObject : [intptr] 戻り時に待機ハンドルを受け取る変数へのポインタ。待機ハンドルは CloseHandle などのオブジェクトハンドルを必要とする関数では使用できない点に注意。
hObject : [intptr] オブジェクトへのハンドル。ハンドルを指定可能なオブジェクト型の一覧は以下の Remarks セクションを参照。
Callback : [int] hObject がシグナル状態になるか dwMilliseconds が経過した際に実行される WAITORTIMERCALLBACK 型のアプリケーション定義関数へのポインタ。詳細は WaitOrTimerCallback を参照。
Context : [intptr] コールバック関数に渡される単一の値。
dwMilliseconds : [int] タイムアウト間隔(ミリ秒単位)。オブジェクトの状態が非シグナルでも、間隔が経過すれば関数は戻る。dwMilliseconds が 0 の場合、関数はオブジェクトの状態をテストして即座に戻る。dwMilliseconds が INFINITE の場合、関数のタイムアウト間隔は決して経過しない。
dwFlags : [int] 
%inst
スレッドプール内の待機スレッドにオブジェクトを待機するよう指示する。

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 である。拡張エラー情報を取得するには
GetLastError を呼び出す。

[備考]

必要に応じて新しい待機スレッドが自動的に作成される。待機操作はスレッドプールの待機スレッドで実行される。コールバックルーチンは、オブジェクトがシグナル状態になるかタイムアウト間隔が経過したときにワーカースレッドで実行される。dwFlags
が WT_EXECUTEONLYONCE
でない場合、イベントがシグナル状態になるかタイムアウト間隔が経過するたびにタイマがリセットされる。待機が完了したら、待機操作をキャンセルするために
UnregisterWait または UnregisterWaitEx 関数を呼び出す必要がある(WT_EXECUTEONLYONCE
を使用する待機操作でもキャンセルする必要がある)。コールバック関数内からこれらの関数へのブロッキング呼び出しを行ってはならない。RegisterWaitForSingleObject
に渡したイベントオブジェクトをパルスしてはならない点に注意。待機スレッドがイベントのリセット前にシグナル状態を検知しない可能性があるためである。シグナル状態のまま残り続けるオブジェクト(手動リセットイベントや終了したプロセスなど)を登録する場合は、WT_EXECUTEONLYONCE
または WT_EXECUTEINWAITTHREAD
フラグを設定する必要がある。他のフラグでは、イベントがリセットされる前にコールバック関数が何度も呼び出される可能性がある。この関数は一部の同期オブジェクトの状態を変更する。変更は、その待機条件を満たしたシグナル状態を引き起こしたオブジェクトに対してのみ行われる。たとえばセマフォオブジェクトのカウントは
1 減少する。RegisterWaitForSingleObject 関数は次のオブジェクトを待機できる。
（以下省略）


%index
RegisterWaitUntilOOBECompleted
OOBE (Windows Welcome) の完了後に呼び出されるコールバックを登録する。
%group
Win32 kernel32
%prm
OOBECompletedCallback, CallbackContext, WaitHandle
OOBECompletedCallback : [int] OOBE の完了時に呼び出される、アプリケーション定義のコールバック関数へのポインタ。詳細は OOBE_COMPLETED_CALLBACK を参照。
CallbackContext : [intptr] コールバックコンテキストへのポインタ。この値は OOBECompletedCallback で指定される関数に渡される。この値は NULL でもよい。
WaitHandle : [var] 待機コールバック登録のハンドルを受け取る変数へのポインタ。
%inst
OOBE (Windows Welcome) の完了後に呼び出されるコールバックを登録する。

[戻り値]
ルーチンがコールバックを正常に登録した場合は TRUE、それ以外は FALSE を返す。FALSE の場合、GetLastError
で拡張エラー情報を取得できる。

[備考]
RegisterWaitUntilOOBECompleted が FALSE を返し、続く GetLastError 呼び出しが
ERROR_INVALID_STATE を返す場合、これは OOBE がすでに完了していて OOBE 完了を登録する必要がないことを示す。


%index
ReleaseActCtx
ReleaseActCtx 関数は、指定したアクティベーションコンテキストの参照カウントを減算する。
%group
Win32 kernel32
%prm
hActCtx
hActCtx : [intptr] 参照カウントを減算する対象のアクティベーションコンテキストに関する情報を含む ACTCTX 構造体へのハンドル。
%inst
ReleaseActCtx 関数は、指定したアクティベーションコンテキストの参照カウントを減算する。

[戻り値]

この関数は値を返さない。正常終了時にはアクティベーションコンテキストの参照カウントが減算される。参照カウントされたオブジェクトの受け手は、そのオブジェクトが不要になった際に参照カウントを減算しなければならない。

[備考]
アクティベーションコンテキストの参照カウントが 0
になると、アクティベーションコンテキスト構造体は解放される。アクティベーションコンテキストはカーネルオブジェクトとして実装されていないため、カーネルハンドラ関数はアクティベーションコンテキストに対して使用できない。hActCtx
パラメータの値が NULL ハンドルの場合、この関数は何もせずエラー状態も発生しない。


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
ReleaseSemaphore
指定したセマフォオブジェクトのカウントを指定した量だけ増加させる。
%group
Win32 kernel32
%prm
hSemaphore, lReleaseCount, lpPreviousCount
hSemaphore : [intptr] セマフォオブジェクトへのハンドル。CreateSemaphore または OpenSemaphore 関数がこのハンドルを返す。このハンドルは SEMAPHORE_MODIFY_STATE アクセス権を持つ必要がある。詳細は Synchronization Object Security and Access Rights を参照。
lReleaseCount : [int] セマフォオブジェクトの現在のカウントを増加させる量。値は 0 より大きくなければならない。指定された量によりセマフォのカウントがセマフォ作成時に指定された最大カウントを超える場合、カウントは変更されず関数は FALSE を返す。
lpPreviousCount : [var] セマフォの以前のカウントを受け取る変数へのポインタ。以前のカウントが不要な場合、このパラメータは NULL でもよい。
%inst
指定したセマフォオブジェクトのカウントを指定した量だけ増加させる。

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 である。拡張エラー情報を取得するには
GetLastError を呼び出す。

[備考]
セマフォオブジェクトの状態はカウントが 0 より大きいときシグナル状態、0 のとき非シグナル状態である。CreateSemaphore
関数を呼び出すプロセスはセマフォの初期カウントを指定する。セマフォのシグナル状態により待機中スレッドが解放されるたびに、セマフォのカウントは
1
減少する。通常、アプリケーションはセマフォをリソースを使用するスレッド数を制限するために使用する。スレッドはリソースを使用する前に、待機関数の
1 つにセマフォハンドルを指定する。待機関数が戻るとき、セマフォのカウントを 1 減少させる。スレッドはリソースの使用を終えたときに
ReleaseSemaphore を呼び出してセマフォのカウントを 1 増加させる。ReleaseSemaphore のもう 1
つの用途はアプリケーションの初期化中である。アプリケーションは初期カウント 0
のセマフォを作成できる。これはセマフォの状態を非シグナルに設定し、全スレッドから保護対象リソースへのアクセスをブロックする。アプリケーションが初期化を完了した時点で、ReleaseSemaphore
を使用してカウントを最大値まで増加させ、保護対象リソースへの通常アクセスを許可する。lReleaseCount
は負数にできないため、ReleaseSemaphore
でセマフォオブジェクトのカウントを減らすことはできない。アクセスを一時的に制限または削減するには、セマフォカウントが十分に減少するまでタイムアウト間隔
0 で WaitForSingleObject
関数を呼び出すループを作成する(このループの実行中に他のスレッドがカウントを減らすことも可能である点に注意)。アクセスを元に戻すには、ループ内で
WaitForSingleObject が呼び出された回数に等しい解放カウントで ReleaseSemaphore を呼び出す。


%index
RemoveDirectoryW
既存の空のディレクトリを削除する。(Unicode)
%group
Win32 kernel32
%prm
lpPathName
lpPathName : [wstr] 削除するディレクトリのパス。このパスは空のディレクトリを指定する必要があり、呼び出し側プロセスはそのディレクトリに対する削除アクセス権を持つ必要がある。この関数の ANSI 版では名前は MAX_PATH 文字に制限される。この制限を 32,767 ワイド文字まで拡張するには、Unicode 版を呼び出し、パスの先頭に "\\\\?\\" を付加する。詳細は Naming a File を参照。ヒント: Windows 10 バージョン 1607 以降、この関数の Unicode 版(RemoveDirectoryW)では、"\\?\" を付加せずに MAX_PATH 制限を解除するオプトインが可能である。詳細は Naming Files, Paths, and Namespaces の "Maximum Path Length Limitation" セクションを参照。
%inst
既存の空のディレクトリを削除する。(Unicode)

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 である。拡張エラー情報を取得するには
GetLastError を呼び出す。

[備考]
RemoveDirectory
関数はディレクトリをクローズ時削除のためにマークする。したがってディレクトリへの最後のハンドルが閉じられるまで、ディレクトリは削除されない。ディレクトリ内のファイルを再帰的に削除するには
SHFileOperation 関数を使用する。RemoveDirectory
は、対象のコンテンツが空でない場合でもディレクトリジャンクションを削除する。関数は対象オブジェクトの状態に関係なくディレクトリジャンクションを削除する。ジャンクションの詳細は
Hard Links and Junctions を参照。Windows 8 および Windows Server 2012
において、この関数は次の技術でサポートされる。
（以下省略）


%index
RemoveDirectoryTransactedW
既存の空のディレクトリをトランザクション操作として削除する。(Unicode)
%group
Win32 kernel32
%prm
lpPathName, hTransaction
lpPathName : [wstr] 削除するディレクトリのパス。パスは空のディレクトリを指定する必要があり、呼び出し側プロセスはそのディレクトリに対する削除アクセス権を持つ必要がある。この関数の ANSI 版では名前は MAX_PATH 文字に制限される。この制限を 32,767 ワイド文字まで拡張するには、Unicode 版を呼び出し、パスの先頭に "\\?\" を付加する。詳細は Naming a File を参照。ディレクトリはローカルコンピュータ上に存在しなければならない。そうでない場合、関数は失敗し最終エラーコードは ERROR_TRANSACTIONS_UNSUPPORTED_REMOTE に設定される。
hTransaction : [intptr] トランザクションへのハンドル。このハンドルは CreateTransaction 関数から返される。
%inst
既存の空のディレクトリをトランザクション操作として削除する。(Unicode)

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 である。拡張エラー情報を取得するには
GetLastError を呼び出す。

[備考]
RemoveDirectoryTransacted
関数はディレクトリをクローズ時削除のためにマークする。したがってディレクトリへの最後のハンドルが閉じられるまで、ディレクトリは削除されない。
RemoveDirectory
は、対象のコンテンツが空でない場合でもディレクトリジャンクションを削除する。関数は対象オブジェクトの状態に関係なくディレクトリジャンクションを削除する。Windows
8 および Windows Server 2012 において、この関数は次の技術でサポートされる。
（以下省略）


%index
RemoveSecureMemoryCacheCallback
AddSecureMemoryCacheCallback 関数で以前に登録されたコールバック関数の登録を解除する。
%group
Win32 kernel32
%prm
pfnCallBack
pfnCallBack : [int] 削除するアプリケーション定義の SecureMemoryCacheCallback 関数へのポインタ。
%inst
AddSecureMemoryCacheCallback 関数で以前に登録されたコールバック関数の登録を解除する。

[戻り値]
関数が成功した場合は TRUE、失敗した場合は FALSE を返す。

[備考]
この関数を使用するアプリケーションをコンパイルするには、_WIN32_WINNT を 0x0600 以上に定義する。詳細は Using
the Windows Headers を参照。


%index
ReplaceFileW
ファイルを別のファイルで置き換える。元ファイルのバックアップコピーを作成するオプションを持つ。(Unicode)
%group
Win32 kernel32
%prm
lpReplacedFileName, lpReplacementFileName, lpBackupFileName, dwReplaceFlags, lpExclude, lpReserved
lpReplacedFileName : [wstr] 置き換え対象のファイル名。この関数の ANSI 版では名前は MAX_PATH 文字に制限される。この制限を 32,767 ワイド文字まで拡張するには、Unicode 版を呼び出し、パスの先頭に "\\?\" を付加する。詳細は Naming a File を参照。ヒント: Windows 10 バージョン 1607 以降、この関数の Unicode 版(ReplaceFileW)では、"\\?\" を付加せずに MAX_PATH 制限を解除するオプトインが可能である。詳細は Naming Files, Paths, and Namespaces の "Maximum Path Length Limitation" セクションを参照。このファイルは GENERIC_READ、DELETE、および SYNCHRONIZE アクセス権で開かれる。共有モードは FILE_SHARE_READ | FILE_SHARE_WRITE | FILE_SHARE_DELETE である。呼び出し側は置き換え対象ファイルへの書き込みアクセス権を持つ必要がある。詳細は File Security and Access Rights を参照。
lpReplacementFileName : [wstr] lpReplacedFileName ファイルを置き換えるファイルの名前。この関数の ANSI 版では名前は MAX_PATH 文字に制限される。この制限を 32,767 ワイド文字まで拡張するには、Unicode 版を呼び出し、パスの先頭に "\\?\" を付加する。詳細は Naming a File を参照。ヒント: Windows 10 バージョン 1607 以降、この関数の Unicode 版(ReplaceFileW)では、"\\?\" を付加せずに MAX_PATH 制限を解除するオプトインが可能である。詳細は Naming Files, Paths, and Namespaces の "Maximum Path Length Limitation" セクションを参照。関数は全ての属性と ACL を保持するため、SYNCHRONIZE、GENERIC_READ、GENERIC_WRITE、DELETE、および WRITE_DAC アクセス権でこのファイルを開こうとする。これに失敗した場合、関数は SYNCHRONIZE、GENERIC_READ、DELETE、および WRITE_DAC アクセス権でファイルを開こうとする。共有モードは指定されない。
lpBackupFileName : [wstr] lpReplacedFileName ファイルのバックアップコピーとして扱われるファイルの名前。このパラメータが NULL の場合、バックアップファイルは作成されない。バックアップファイルの実装詳細は Remarks セクションを参照。この関数の ANSI 版では名前は MAX_PATH 文字に制限される。この制限を 32,767 ワイド文字まで拡張するには、Unicode 版を呼び出し、パスの先頭に "\\?\" を付加する。詳細は Naming a File を参照。ヒント: Windows 10 バージョン 1607 以降、この関数の Unicode 版(ReplaceFileW)では、"\\?\" を付加せずに MAX_PATH 制限を解除するオプトインが可能である。詳細は Naming Files, Paths, and Namespaces の "Maximum Path Length Limitation" セクションを参照。
dwReplaceFlags : [int] 
lpExclude : [intptr] 将来の使用のために予約されている。
lpReserved : [intptr] 将来の使用のために予約されている。
%inst
ファイルを別のファイルで置き換える。元ファイルのバックアップコピーを作成するオプションを持つ。(Unicode)

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 である。拡張エラー情報を取得するには
GetLastError を呼び出す。この関数の想定されるエラーコードは次のとおり。
（以下省略）

[備考]
ヒント: Windows 10 バージョン 1607 以降、この関数の Unicode 版(ReplaceFileW)では
MAX_PATH 制限を解除するオプトインが可能である。詳細は Naming Files, Paths, and Namespaces の
"Maximum Path Length Limitation" セクションを参照。ReplaceFile 関数は複数の手順を 1
つの関数にまとめている。アプリケーションは、新しいファイルへのデータ保存、一時名を使った元ファイルのリネーム、新しいファイルを元ファイルと同じ名前にリネーム、元ファイルの削除という個別の関数呼び出しの代わりに
ReplaceFile を呼び出すことができる。もう 1 つの利点として、ReplaceFile
は新しいファイルデータをコピーするだけでなく、元ファイルの次の属性を保持する。
（以下省略）


%index
ReplacePartitionUnit
(no summary)
%group
Win32 kernel32
%prm
TargetPartition, SparePartition, Flags
TargetPartition : [wstr] 
SparePartition : [wstr] 
Flags : [int] 
%inst



%index
RequestDeviceWakeup
(no summary)
%group
Win32 kernel32
%prm
hDevice
hDevice : [intptr] 
%inst



%index
RequestWakeupLatency
何も行わず STATUS_NOT_SUPPORTED を返す。この関数は以前のバージョンの Windows との互換性のためにのみ提供される。Windows Server 2008 および Windows Vista: 何も行わず常に成功を返す。
%group
Win32 kernel32
%prm
latency
latency : [int] コンピュータを起こすのにかかる時間のレイテンシ要件。このパラメータには次のいずれかの値を指定できる。
%inst
何も行わず STATUS_NOT_SUPPORTED を返す。この関数は以前のバージョンの Windows
との互換性のためにのみ提供される。Windows Server 2008 および Windows Vista: 何も行わず常に成功を返す。

[戻り値]
戻り値は 0 以外である。

[備考]

システムはスリープ状態を選択する際に起床レイテンシ要件を使用する。起床時間は特定のコンピュータのハードウェア設計に依存するため、レイテンシは保証されない。レイテンシ要求をキャンセルするには、LT_DONT_CARE
を指定して RequestWakeupLatency を呼び出す。


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
ResetWriteWatch
仮想メモリ領域の書き込み追跡状態をリセットする。以降の GetWriteWatch 関数呼び出しでは、リセット操作以降に書き込まれたページのみが報告される。
%group
Win32 kernel32
%prm
lpBaseAddress, dwRegionSize
lpBaseAddress : [intptr] 書き込み追跡状態をリセットするメモリ領域のベースアドレスへのポインタ。このアドレスは、VirtualAlloc 関数により MEM_WRITE_WATCH で割り当てられたメモリ領域内でなければならない。
dwRegionSize : [int] 書き込み追跡情報をリセットするメモリ領域のサイズ(バイト単位)。
%inst
仮想メモリ領域の書き込み追跡状態をリセットする。以降の GetWriteWatch
関数呼び出しでは、リセット操作以降に書き込まれたページのみが報告される。

[戻り値]
関数が成功した場合、戻り値は 0 である。関数が失敗した場合、戻り値は 0 以外の値である。

[備考]
ResetWriteWatch 関数はガベージコレクタなどのアプリケーションに有用である。アプリケーションは GetWriteWatch
関数を呼び出して書き込まれたページのリストを取得し、クリーンアップ操作の一部としてそれらのページに書き込む。その後、ガベージコレクタは
ResetWriteWatch を呼び出してクリーンアップによる書き込み追跡記録を削除する。GetWriteWatch を呼び出す際に
WRITE_WATCH_FLAG_RESET
を指定することでもメモリ領域の書き込み追跡状態をリセットできる。ResetWriteWatch を使用する場合、GetWriteWatch
と ResetWriteWatch
呼び出し間のインターバルにスレッドがその領域へ書き込まないよう保証する必要がある。そうしないと、検知されない書き込み済みページが生じる可能性がある。


%index
ResizePseudoConsole
擬似コンソールの内部バッファを指定されたサイズへリサイズする ResizePseudoConsole 関数に関する参考情報を参照。
%group
Win32 kernel32
%prm
hPC, size
hPC : [intptr] [CreatePseudoConsole](createpseudoconsole.md) で開いた、アクティブな擬似コンソールへのハンドル。
size : [var] この擬似コンソールの内部バッファに使用されるウィンドウ/バッファの文字数単位の寸法。
%inst
擬似コンソールの内部バッファを指定されたサイズへリサイズする ResizePseudoConsole 関数に関する参考情報を参照。

[戻り値]
型: **HRESULT** このメソッドが成功した場合は **S_OK** を返す。それ以外の場合は **HRESULT**
エラーコードを返す。

[備考]

この関数は、擬似コンソールセッションの内部バッファを、ターミナル側の表示に使用されているウィンドウ/バッファサイズに合わせてリサイズできる。これにより、[Console
Functions](console-functions.md)
を使用して通信する接続済みコマンドラインインターフェイス(CUI)アプリケーションの呼び出しで正しい寸法が返されるようになる。


%index
ResolveLocaleName
与えられた名前に対する一致するロケール名を検索する。
%group
Win32 kernel32
%prm
lpNameToResolve, lpLocaleName, cchLocaleName
lpNameToResolve : [wstr] 解決する名前へのポインタ。たとえば英語(プライベート使用)の "en-XA" など。
lpLocaleName : [wstr] 入力名に対応する一致ロケール名を関数が取得するバッファへのポインタ。たとえば名前 "en-XA" の一致は英語(米国)を示す "en-US" である。注: 関数が失敗した場合、出力バッファの状態は正確であることが保証されない。この場合、アプリケーションは関数が設定した戻り値とエラー状態を確認し、正しい対応方法を決定すべきである。
cchLocaleName : [int] lpLocaleName が指すバッファのサイズ(文字数単位)。ロケール名の最大長(終端 NULL 文字を含む)は LOCALE_NAME_MAX_LENGTH の値である。このパラメータに与える推奨サイズである。
%inst
与えられた名前に対する一致するロケール名を検索する。

[戻り値]
成功時には、終端 NULL 文字を含むロケール名を格納するバッファのサイズを返す。成功しない場合、関数は 0
を返す。拡張エラー情報を取得するためにアプリケーションは GetLastError
を呼び出すことができ、これは次のエラーコードのいずれかを返す。
（以下省略）

[備考]
取得されるロケール名は、入力言語が中立であっても、言語および国/地域を含む特定のロケールを示す。たとえば英語(米国)を示す "en"
を入力すると、関数は "en-US"
を取得する。この関数はカスタムロケールからデータを取得できる。データはコンピュータ間やアプリケーションの実行間で同じであることは保証されず、有効なロケールが返されても別のコンピュータ上で有効であることが保証されるわけでもない。アプリケーションがデータを永続化または転送する必要がある場合は
Using Persistent Locale Data を参照。Windows 8 以降: Windows.Globalization
名前空間から取得される言語タグは、国語サポート関数で使用する前に ResolveLocaleName で変換する必要がある。


%index
ResumeThread
スレッドのサスペンドカウントを 1 減らす。サスペンドカウントが 0 に減らされると、スレッドの実行が再開される。
%group
Win32 kernel32
%prm
hThread
hThread : [intptr] 再開するスレッドへのハンドル。
%inst
スレッドのサスペンドカウントを 1 減らす。サスペンドカウントが 0 に減らされると、スレッドの実行が再開される。

[戻り値]
関数が成功した場合、戻り値はスレッドの以前のサスペンドカウントである。関数が失敗した場合、戻り値は (DWORD) -1
である。拡張エラー情報を取得するには GetLastError を呼び出す。

[備考]
ResumeThread 関数は対象スレッドのサスペンドカウントを確認する。サスペンドカウントが 0
の場合、スレッドは現在中断されていない。そうでない場合、対象スレッドのサスペンドカウントは 1 減らされる。結果が 0
の場合、対象スレッドの実行が再開される。戻り値が 0 の場合、指定したスレッドは中断されていなかった。戻り値が 1
の場合、指定したスレッドは中断されていたが再開された。戻り値が 1
より大きい場合、指定したスレッドは依然として中断されている。デバッグイベントの報告中、報告プロセス内の全スレッドは凍結される点に注意。デバッガはプロセス内で実行可能なスレッドのセットを制限するために
SuspendThread および ResumeThread 関数を使用することが想定されている。デバッグイベントを報告する 1
つのスレッド以外のプロセス内の全スレッドを中断することで、単一スレッドの "シングルステップ"
が可能となる。その他のスレッドは中断されている場合、継続操作で解放されない。Windows Phone 8.1: この関数は
Windows Phone 8.1 以降の Windows Phone Store アプリでサポートされる。Windows 8.1 および
Windows Server 2012 R2: この関数は Windows 8.1、Windows Server 2012 R2 以降の
Windows Store アプリでサポートされる。


%index
RtlCaptureStackBackTrace
RtlCaptureStackBackTrace ルーチンは、スタックを遡って各フレームの情報を記録することでスタックバックトレースを取得する。
%group
Win32 kernel32
%prm
FramesToSkip, FramesToCapture, BackTrace, BackTraceHash
FramesToSkip : [int] バックトレースの先頭からスキップするフレーム数。
FramesToCapture : [int] 取得するフレーム数。
BackTrace : [var] 現在のスタックトレースから取得したポインタの配列。
BackTraceHash : [var] ハッシュテーブルの整理に使用できる省略可能な値。このパラメータが NULL の場合、ハッシュ値は計算されない。この値は BackTrace 配列で返されるポインタの値に基づいて計算される。2 つの同一スタックトレースは同一のハッシュ値を生成する。
%inst
RtlCaptureStackBackTrace
ルーチンは、スタックを遡って各フレームの情報を記録することでスタックバックトレースを取得する。

[戻り値]
取得したフレーム数。


%index
RtlCompareMemory
(no summary)
%group
Win32 kernel32
%prm
Source1, Source2, Length
Source1 : [intptr] 
Source2 : [intptr] 
Length : [int] 
%inst



%index
RtlPcToFileHeader
指定した PC 値を含むイメージのベースアドレスを取得する。
%group
Win32 kernel32
%prm
PcValue, BaseOfImage
PcValue : [intptr] PC 値。関数は呼び出し側プロセスのアドレス空間にマップされている全モジュールから、この値を含むモジュールを検索する。
BaseOfImage : [var] PC 値を含むイメージのベースアドレス。この値は、イメージ内の位置を特定するためにヘッダ内の相対アドレスに加算される必要がある。
%inst
指定した PC 値を含むイメージのベースアドレスを取得する。

[戻り値]
PC 値が見つかった場合、関数は PC 値を含むイメージのベースアドレスを返す。PC 値を含むイメージがない場合、関数は NULL
を返す。


%index
RtlRaiseException
例外を発生させる。
%group
Win32 kernel32
%prm
ExceptionRecord
ExceptionRecord : [var] 発生する例外とその例外のパラメータを記述する EXCEPTION_RECORD 構造体のアドレス。ソフトウェア例外の発生は、現在のスレッドのマシン状態をコンテキストレコードに取り込む。例外レコードの ExceptionAddress メンバは呼び出し側の戻りアドレスに設定される。
%inst
例外を発生させる。

[戻り値]
この関数は値を返さない。


%index
RtlUnwind
プロシージャ呼び出しフレームの巻き戻しを開始する。(RtlUnwind)
%group
Win32 kernel32
%prm
TargetFrame, TargetIp, ExceptionRecord, ReturnValue
TargetFrame : [intptr] 巻き戻し対象の呼び出しフレームへのポインタ。このパラメータが NULL の場合、関数は終了巻き戻しを実行する。
TargetIp : [intptr] 巻き戻しの継続アドレス。TargetFrame が NULL の場合、このパラメータは無視される。
ExceptionRecord : [var] EXCEPTION_RECORD 構造体へのポインタ。
ReturnValue : [intptr] 実行を継続する前に整数関数の戻りレジスタに配置される値。
%inst
プロシージャ呼び出しフレームの巻き戻しを開始する。(RtlUnwind)

[戻り値]
この関数は値を返さない。


%index
ScrollConsoleScreenBufferW
画面バッファ内のデータブロックを移動する ScrollConsoleScreenBuffer 関数のリファレンス情報を参照。
%group
Win32 kernel32
%prm
hConsoleOutput, lpScrollRectangle, lpClipRectangle, dwDestinationOrigin, lpFill
hConsoleOutput : [intptr] コンソールスクリーンバッファへのハンドル。ハンドルは **GENERIC\_READ** アクセス権を持つ必要がある。詳細は [Console Buffer Security and Access Rights](console-buffer-security-and-access-rights.md) を参照。
lpScrollRectangle : [var] 移動するコンソール画面バッファ矩形の左上および右下座標をメンバで指定する [**SMALL\_RECT**](small-rect-str.md) 構造体へのポインタ。
lpClipRectangle : [var] メンバによりスクロールの影響を受けるコンソールスクリーンバッファ矩形の左上および右下の座標を指定する [**SMALL\_RECT**](small-rect-str.md) 構造体へのポインタ。このポインタは **NULL** でもよい。
dwDestinationOrigin : [var] *lpScrollRectangle* の内容の新しい位置の左上隅を指定する [**COORD**](coord-str.md) 構造体(文字単位)。
lpFill : [var] *lpScrollRectangle* と *lpClipRectangle* の交差領域のうち、移動の結果として空になったセルを埋めるために使用する文字と色属性を指定する [**CHAR\_INFO**](char-info-str.md) 構造体へのポインタ。
%inst
画面バッファ内のデータブロックを移動する ScrollConsoleScreenBuffer 関数のリファレンス情報を参照。

[戻り値]

関数が成功した場合、戻り値は非ゼロである。関数が失敗した場合、戻り値はゼロである。拡張エラー情報を取得するには、[**GetLastError**](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror)
を呼び出す。

[備考]
**ScrollConsoleScreenBuffer** は、*lpScrollRectangle*
パラメータで指定される画面バッファの矩形領域の内容を、コンソール画面バッファの別領域にコピーする。コピー先の矩形は
*lpScrollRectangle* と同じ寸法を持ち、その左上隅は *dwDestinationOrigin*
パラメータで指定される座標に置かれる。*lpScrollRectangle* のうちコピー先矩形と重ならない部分は、*lpFill*
パラメータで指定された文字と色属性で埋められる。クリッピング矩形は、*lpScrollRectangle*
矩形およびコピー先矩形の双方に対する変更に適用される。たとえば、クリッピング矩形が *lpFill*
の内容で埋められるはずだった領域を含まない場合、その領域の元の内容は変更されないまま残る。スクロール元やコピー先の領域がコンソール画面バッファの寸法を超える場合はクリッピングされる。たとえば
*lpScrollRectangle* が (0,0) から (19,19) の領域で、*dwDestinationOrigin* が
(10,15) の場合、コピー先矩形は (10,15) から (29,34) の領域となる。しかし、コンソール画面バッファが幅 50
文字・高さ 30 文字の場合、コピー先矩形は (10,15) から (29,29)
にクリッピングされる。コンソール画面バッファへの変更は、*lpClipRectangle* が
[**SMALL\_RECT**](small-rect-str.md)
構造体を指定している場合、それに従ってもクリッピングされる。クリッピング矩形が (0,0) から (49,19)
と指定されている場合、コンソール画面バッファのその領域内で発生する変更のみが反映される。[!INCLUDE
[setting-codepage-mode-remarks](./includes/setting-codepage-mode-remarks.md)]
> [!TIP] > この API
は推奨されず、**[仮想ターミナル](console-virtual-terminal-sequences.md)**
に相当するものもない。画面の一部領域を固定する
**[スクロールマージン](console-virtual-terminal-sequences.md#scrolling-margins)**、領域外にアクティブ位置を設定する
**[カーソル位置指定](console-virtual-terminal-sequences.md#cursor-positioning)**、およびテキストを強制的に移動させるための改行で近似できる。残った領域は、カーソルを移動し、**[グラフィック属性を設定](console-virtual-terminal-sequences.md#text-formatting)**
し、通常のテキストを書き込むことで埋めることができる。


%index
SearchPathW
指定したパスから指定したファイルを検索する。(Unicode)
%group
Win32 kernel32
%prm
lpPath, lpFileName, lpExtension, nBufferLength, lpBuffer, lpFilePart
lpPath : [wstr] ファイルを検索するパス。このパラメータが NULL の場合、関数はレジストリ依存のシステム検索パスを使って一致するファイルを検索する。詳細は備考の項を参照。
lpFileName : [wstr] 検索するファイルの名前。
lpExtension : [wstr] ファイル検索時にファイル名に追加する拡張子。拡張子の先頭文字はピリオド (.) でなければならない。拡張子は、指定されたファイル名が拡張子で終わっていない場合にのみ付加される。拡張子が不要な場合やファイル名に既に拡張子が含まれている場合、このパラメータは NULL を指定できる。
nBufferLength : [int] 有効なパスとファイル名 (終端の null 文字を含む) を受け取るバッファのサイズ (TCHAR 単位)。
lpBuffer : [wstr] 検索結果のファイルのパスとファイル名を受け取るバッファへのポインタ。文字列は null 終端される。
lpFilePart : [var] 有効なパスとファイル名の最終要素のアドレス (lpBuffer 内の、パス中の最後のバックスラッシュ (\\) 直後の文字のアドレス) を受け取る変数へのポインタ。
%inst
指定したパスから指定したファイルを検索する。(Unicode)

[戻り値]
関数が成功した場合、戻り値はバッファにコピーされた文字列の長さ (終端の null 文字を含まない TCHAR 単位) となる。戻り値が
nBufferLength より大きい場合、戻り値はパスを保持するために必要なバッファサイズ (終端の null 文字を含む)
である。関数が失敗した場合、戻り値はゼロである。拡張エラー情報を取得するには GetLastError を呼び出す。

[備考]
lpPath パラメータが NULL の場合、SearchPath は次のレジストリ値の現在の値に基づいて一致するファイルを検索する:
HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session
Manager\SafeProcessSearchMode
この REG_DWORD レジストリ値が 1 の場合、SearchPath
はまずシステムパスで指定されたフォルダを検索し、その後現在の作業フォルダを検索する。値が 0
の場合、まず現在の作業フォルダを検索し、次にシステムパスで指定されたフォルダを検索する。このレジストリキーのシステム既定値は 0
である。SearchPath 関数が使用する検索モードは、SetSearchPathMode
関数を呼び出すことでプロセスごとに設定することもできる。SearchPath 関数は、出力を LoadLibrary
関数への呼び出しに使用する目的で .dll ファイルを探す手段としては推奨されない。SearchPath 関数の検索順序は
LoadLibrary 関数が使用する検索順序と異なるため、誤った .dll ファイルが見つかる可能性がある。.dll
ファイルを探してロードする必要がある場合は LoadLibrary 関数を使用すること。ヒント: Windows 10 バージョン
1607 以降、この関数の Unicode 版 (SearchPathW) では MAX_PATH
の制限を解除するオプトインが可能。詳細は「ファイル、パス、および名前空間の命名」の「最大パス長の制限」節を参照。Windows 8 および
Windows Server 2012 では、この関数は以下の技術によってサポートされている。
（以下省略）


%index
SetCachedSigningLevel
キャッシュされた署名レベルを設定する。
%group
Win32 kernel32
%prm
SourceFiles, SourceFileCount, Flags, TargetFile
SourceFiles : [intptr] ソースファイルハンドルの集合へのポインタ。
SourceFileCount : [int] ソースファイル数。
Flags : [int] ファイルに設定するフラグ。次の *Flags* がサポートされる: | フラグ | 値 | |--------|--------| | **SIGNING_LEVEL_FILE_CACHE_FLAG_NOT_VALIDATED** | `0x01` | | **SIGNING_LEVEL_FILE_CACHE_FLAG_VALIDATE_ONLY** | `0x04` | これらを同時に指定する (**SIGNING_LEVEL_FILE_CACHE_FLAG_NOT_VALIDATED \| SIGNING_LEVEL_FILE_CACHE_FLAG_VALIDATE_ONLY**) と、ファイルを検証すべきであることを示す。
TargetFile : [intptr] 対象ファイル。
%inst
キャッシュされた署名レベルを設定する。

[戻り値]
関数が成功した場合は **TRUE** を返す。失敗した場合は **FALSE** を返す。拡張エラー情報を取得するには
[GetLastError](/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror)
を呼び出す。**GetLastError** は WinError.h で定義されたエラーコードのいずれかを返すことがある。


%index
SetCalendarInfoW
カレンダーに関するロケール情報の項目を設定する。詳細は「日付とカレンダー」を参照。(Unicode)
%group
Win32 kernel32
%prm
Locale, Calendar, CalType, lpCalData
Locale : [int] ロケールを指定するロケール識別子。MAKELCID マクロで作成するか、次の定義済み値のいずれかを使用できる。
Calendar : [int] 情報を設定する対象カレンダーのカレンダー識別子。
CalType : [int] 設定するカレンダー情報の種類。この関数で有効なのは以下の CALTYPE 値のみである。CAL_USE_CP_ACP 定数は ANSI 版でのみ意味を持つ。
lpCalData : [wstr] null 終端のカレンダー情報文字列へのポインタ。情報は指定したカレンダー種別の形式でなければならない。
%inst
カレンダーに関するロケール情報の項目を設定する。詳細は「日付とカレンダー」を参照。(Unicode)

[戻り値]
成功した場合は非ゼロ、それ以外は 0 を返す。拡張エラー情報を取得するには GetLastError
を呼び出す。次のいずれかのエラーコードが返されることがある:
（以下省略）

[備考]
この関数はカレンダー設定のユーザーオーバーライド部分のみに影響し、システム既定は設定しない。カレンダー情報は Unicode 版では常に
null 終端の Unicode 文字列として、ANSI 版では null 終端の ANSI
文字列として渡される。整数は許可されておらず、数値はすべて Unicode または ANSI テキストで指定する必要がある。ANSI 版を
Unicode 専用ロケール識別子で呼び出した場合、OS
がシステムコードページを使用するため関数は成功することがある。ただしシステムコードページで未定義の文字は、文字列中でクエスチョンマーク
(?) として現れる。CAL_ITWODIGITYEARMAX
は、指定したロケールで対象カレンダーがサポートされていなくても、任意のカレンダーで使用できる。複雑化を避けるため、アプリケーションは
EnumCalendarInfo を呼び出して対象ロケールでそのカレンダーがサポートされていることを確認すべきである。
> [!NOTE] > winnls.h ヘッダは SetCalendarInfo を、UNICODE プリプロセッサ定数の定義に応じて
ANSI 版または Unicode
版を自動選択するエイリアスとして定義する。エンコーディング中立なエイリアスと中立でないコードを混在させると、コンパイルエラーや実行時エラーを引き起こすことがある。詳細は
[関数プロトタイプの規約](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
SetCommBreak
指定した通信デバイスの文字送信を中断し、ClearCommBreak 関数が呼び出されるまで送信線をブレーク状態にする。
%group
Win32 kernel32
%prm
hFile
hFile : [intptr] 通信デバイスへのハンドル。CreateFileW 関数がこのハンドルを返す。
%inst
指定した通信デバイスの文字送信を中断し、ClearCommBreak 関数が呼び出されるまで送信線をブレーク状態にする。

[戻り値]
関数が成功した場合、戻り値は非ゼロである。失敗した場合はゼロである。拡張エラー情報を取得するには GetLastError を呼び出す。


%index
SetCommConfig
通信デバイスの現在の構成を設定する。
%group
Win32 kernel32
%prm
hCommDev, lpCC, dwSize
hCommDev : [intptr] オープン済み通信デバイスへのハンドル。CreateFileW 関数がこのハンドルを返す。
lpCC : [var] COMMCONFIG 構造体へのポインタ。
dwSize : [int] lpCC が指す構造体のサイズ (バイト単位)。
%inst
通信デバイスの現在の構成を設定する。

[戻り値]
関数が成功した場合、戻り値は非ゼロである。失敗した場合はゼロである。拡張エラー情報を取得するには GetLastError を呼び出す。


%index
SetCommMask
通信デバイスで監視するイベントの集合を指定する。
%group
Win32 kernel32
%prm
hFile, dwEvtMask
hFile : [intptr] 通信デバイスへのハンドル。CreateFileW 関数がこのハンドルを返す。
dwEvtMask : [int] 
%inst
通信デバイスで監視するイベントの集合を指定する。

[戻り値]
関数が成功した場合、戻り値は非ゼロである。失敗した場合はゼロである。拡張エラー情報を取得するには GetLastError を呼び出す。

[備考]
SetCommMask 関数は、特定の通信リソースに対して監視可能なイベントの集合を指定する。通信リソースのハンドルは
WaitCommEvent
関数への呼び出しで指定でき、指定イベントのいずれかが発生するまで待機する。通信リソースの現在のイベントマスクを取得するには
GetCommMask 関数を使用する。


%index
SetCommState
デバイス制御ブロック (DCB 構造体) の指定に従って通信デバイスを構成する。すべてのハードウェアおよび制御設定を再初期化するが、出力キューや入力キューは空にしない。
%group
Win32 kernel32
%prm
hFile, lpDCB
hFile : [intptr] 通信デバイスへのハンドル。CreateFileW 関数がこのハンドルを返す。
lpDCB : [var] 指定した通信デバイスの構成情報を含む DCB 構造体へのポインタ。
%inst
デバイス制御ブロック (DCB 構造体)
の指定に従って通信デバイスを構成する。すべてのハードウェアおよび制御設定を再初期化するが、出力キューや入力キューは空にしない。

[戻り値]
関数が成功した場合、戻り値は非ゼロである。失敗した場合はゼロである。拡張エラー情報を取得するには GetLastError を呼び出す。

[備考]
SetCommState 関数は DCB 構造体を用いて希望する構成を指定する。GetCommState 関数は現在の構成を返す。DCB
構造体のうち一部のメンバのみを設定する場合、GetCommState 呼び出しで埋めた DCB
構造体を修正するとよい。こうすることで他のメンバに適切な値が入っていることが保証される。DCB 構造体の XonChar メンバが
XoffChar メンバと等しい場合、SetCommState 関数は失敗する。SetCommState を 8250
の構成に使用する場合、DCB 構造体の ByteSize と StopBits メンバの値に次の制限がある: データビット数は 5 から
8 ビットでなければならない。


%index
SetCommTimeouts
指定した通信デバイスでの全読み書き操作に対するタイムアウトパラメータを設定する。
%group
Win32 kernel32
%prm
hFile, lpCommTimeouts
hFile : [intptr] 通信デバイスへのハンドル。CreateFileW 関数がこのハンドルを返す。
lpCommTimeouts : [var] 新しいタイムアウト値を含む COMMTIMEOUTS 構造体へのポインタ。
%inst
指定した通信デバイスでの全読み書き操作に対するタイムアウトパラメータを設定する。

[戻り値]
関数が成功した場合、戻り値は非ゼロである。失敗した場合はゼロである。拡張エラー情報を取得するには GetLastError を呼び出す。


%index
SetComputerNameW
ローカルコンピュータの新しい NetBIOS 名を設定する。名前はレジストリに保存され、次回ユーザーがコンピュータを再起動した際に反映される。(Unicode)
%group
Win32 kernel32
%prm
lpComputerName
lpComputerName : [wstr] 次回コンピュータ起動時に有効になるコンピュータ名。名前は MAX_COMPUTERNAME_LENGTH 文字以下でなければならない。
%inst
ローカルコンピュータの新しい NetBIOS
名を設定する。名前はレジストリに保存され、次回ユーザーがコンピュータを再起動した際に反映される。(Unicode)

[戻り値]
関数が成功した場合、戻り値は非ゼロである。失敗した場合はゼロである。拡張エラー情報を取得するには GetLastError を呼び出す。

[備考]
この関数を使用するアプリケーションは管理者権限を持つ必要がある。
> [!NOTE] > sysinfoapi.h ヘッダは SetComputerName を、UNICODE
プリプロセッサ定数の定義に応じて ANSI 版または Unicode
版を自動選択するエイリアスとして定義する。エンコーディング中立なエイリアスと中立でないコードを混在させると、コンパイルエラーや実行時エラーを引き起こすことがある。詳細は
[関数プロトタイプの規約](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
SetComputerNameExW
ローカルコンピュータの新しい NetBIOS または DNS 名を設定する。(Unicode)
%group
Win32 kernel32
%prm
NameType, lpBuffer
NameType : [int] 
lpBuffer : [wstr] 新しい名前。名前に制御文字、先頭または末尾の空白、および次の文字を含めることはできない: " / \ [ ] : | < > + = ; , ?
%inst
ローカルコンピュータの新しい NetBIOS または DNS 名を設定する。(Unicode)

[戻り値]
関数が成功した場合、戻り値は非ゼロである。失敗した場合はゼロである。拡張エラー情報を取得するには GetLastError を呼び出す。

[備考]
SetComputerNameEx はローカルコンピュータのコンピュータ名 (完全 DNS 名の先頭ラベル) またはプライマリ DNS
サフィックスを設定できる。1 回の呼び出しで完全修飾 DNS
名を設定することはできない。ローカルコンピュータがクラスタノードの場合、SetComputerNameEx
はクラスタ仮想サーバーではなくローカルコンピュータの NetBIOS/DNS 名を設定する。SetComputerNameEx
を呼び出すプロセスは、ローカルコンピュータで管理者権限を持つ必要がある。この関数を使用するアプリケーションをコンパイルするには、_WIN32_WINNT
を 0x0500 以降として定義する。詳細は「Windows ヘッダの使用」を参照。
> [!NOTE] > sysinfoapi.h ヘッダは SetComputerNameEx を、UNICODE
プリプロセッサ定数の定義に応じて ANSI 版または Unicode
版を自動選択するエイリアスとして定義する。エンコーディング中立なエイリアスと中立でないコードを混在させると、コンパイルエラーや実行時エラーを引き起こすことがある。詳細は
[関数プロトタイプの規約](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
SetComputerNameEx2W
(no summary)
%group
Win32 kernel32
%prm
NameType, Flags, lpBuffer
NameType : [int] 
Flags : [int] 
lpBuffer : [wstr] 
%inst



%index
SetConsoleActiveScreenBuffer
指定した画面バッファを現在表示するコンソール画面バッファに設定する。
%group
Win32 kernel32
%prm
hConsoleOutput
hConsoleOutput : [intptr] コンソール画面バッファへのハンドル。
%inst
指定した画面バッファを現在表示するコンソール画面バッファに設定する。

[戻り値]
関数が成功した場合、戻り値は非ゼロである。失敗した場合はゼロである。拡張エラー情報を取得するには
[**GetLastError**](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror)
を呼び出す。

[備考]
コンソールは複数の画面バッファを持つことができる。**SetConsoleActiveScreenBuffer**
はそのうちどれを表示するかを決定する。非アクティブな画面バッファに書き込んだあと、**SetConsoleActiveScreenBuffer**
を使ってそのバッファの内容を表示できる。[!INCLUDE
[no-vt-equiv-alt-buf](./includes/no-vt-equiv-alt-buf.md)]


%index
SetConsoleCP
呼び出し側プロセスに関連付けられたコンソールが使用する入力コードページを設定する。
%group
Win32 kernel32
%prm
wCodePageID
wCodePageID : [int] 設定するコードページの識別子。詳細は備考を参照。
%inst
呼び出し側プロセスに関連付けられたコンソールが使用する入力コードページを設定する。

[戻り値]
関数が成功した場合、戻り値は非ゼロである。失敗した場合はゼロである。拡張エラー情報を取得するには
[**GetLastError**](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror)
を呼び出す。

[備考]
コードページは 256
個の文字コードを個別の文字にマッピングする。コードページごとに異なる特殊文字が含まれ、通常は言語または言語グループに合わせてカスタマイズされている。OS
にインストールされている、またはサポートされているコードページを調べるには、[**EnumSystemCodePages**](/windows/win32/api/winnls/nf-winnls-enumsystemcodepagesa)
関数を使用する。ローカルコンピュータで利用可能なコードページの識別子はレジストリの以下のキーにも保存されている:
`HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Nls\CodePage`。ただし
Windows
のバージョンによってレジストリは異なる可能性があるため、[**EnumSystemCodePages**](/windows/win32/api/winnls/nf-winnls-enumsystemcodepagesa)
を使ってコードページを列挙するほうがよい。特定のコードページが有効かどうかを判定するには
[**IsValidCodePage**](/windows/win32/api/winnls/nf-winnls-isvalidcodepage)
関数を使用する。コードページの名前を含む詳細情報を取得するには
[**GetCPInfoEx**](/windows/win32/api/winnls/nf-winnls-getcpinfoexa)
関数を使用する。利用可能なコードページ識別子の一覧は
[コードページ識別子](/windows/win32/intl/code-page-identifiers)
を参照。コンソールの現在の入力コードページを取得するには [**GetConsoleCP**](getconsolecp.md)
関数を使用する。コンソールの出力コードページを設定・取得するには
[**SetConsoleOutputCP**](setconsoleoutputcp.md) と
[**GetConsoleOutputCP**](getconsoleoutputcp.md) 関数を使用する。


%index
SetConsoleCtrlHandler
呼び出し側プロセスのハンドラ関数リストに、アプリケーション定義の HandlerRoutine 関数を追加または削除する。
%group
Win32 kernel32
%prm
HandlerRoutine, Add
HandlerRoutine : [int] 追加または削除するアプリケーション定義の [**HandlerRoutine**](handlerroutine.md) 関数へのポインタ。このパラメータは **NULL** でもよい。
Add : [int] このパラメータが **TRUE** の場合ハンドラが追加され、**FALSE** の場合は削除される。*HandlerRoutine* パラメータが **NULL** の場合、**TRUE** 値は呼び出し側プロセスに CTRL+C 入力を無視させ、**FALSE** 値は CTRL+C 入力の通常処理を復元する。CTRL+C を無視または処理するこの属性は子プロセスに継承される。
%inst
呼び出し側プロセスのハンドラ関数リストに、アプリケーション定義の HandlerRoutine 関数を追加または削除する。

[戻り値]
関数が成功した場合、戻り値は非ゼロである。失敗した場合はゼロである。拡張エラー情報を取得するには
[**GetLastError**](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror)
を呼び出す。

[備考]
この関数は、メッセージポンプを持つグラフィカルアプリケーションに対して
[**WM\_QUERYENDSESSION**](/windows/win32/shutdown/wm-queryendsession)
が提供するものに類似する通知を、コンソールアプリケーションおよびサービスに提供する。グラフィカルアプリケーションからこの関数を使うこともできるが、**WM\_QUERYENDSESSION**
からの通知より先に届く保証はない。各コンソールプロセスは、CTRL+C および CTRL+BREAK
シグナルを処理するアプリケーション定義 [**HandlerRoutine**](handlerroutine.md)
関数の独自リストを持つ。これらのハンドラはユーザーがコンソールを閉じた、ログオフした、システムをシャットダウンした際にシステムが生成するシグナルも処理する。初期状態では、各プロセスのハンドラリストには
[**ExitProcess**](/windows/win32/api/processthreadsapi/nf-processthreadsapi-exitprocess)
を呼び出す既定ハンドラのみが登録されている。コンソールプロセスは **SetConsoleCtrlHandler**
を呼び出すことで追加のハンドラを追加・削除でき、他プロセスのハンドラリストには影響しない。コンソールプロセスが制御シグナルを受信すると、そのハンドラ関数は最後に登録されたものから順に呼び出され、いずれかが
`TRUE` を返すまで続く。どのハンドラも `TRUE`
を返さない場合は既定ハンドラが呼ばれる。[**AttachConsole**](attachconsole.md)、[**AllocConsole**](allocconsole.md)、[**FreeConsole**](freeconsole.md)
を呼び出すと、クライアントプロセスの制御ハンドラテーブルが初期状態に戻る。アタッチされたコンソールセッションが変わった際にはハンドラを再登録する必要がある。コンソールプロセスでは
CTRL+C と CTRL+BREAK の組合せは通常シグナル (**CTRL\_C\_EVENT** と
**CTRL\_BREAK\_EVENT**) として扱われる。キーボードフォーカスを持つコンソールウィンドウで CTRL+C または
CTRL+BREAK を受信すると、シグナルはそのコンソールを共有する全プロセスに渡される。CTRL+BREAK
は常にシグナルとして扱われるが、CTRL+C の典型的な動作は次の 3 つの方法で変更でき、その場合ハンドラ関数は呼び出されない: -
[**SetConsoleMode**](setconsolemode.md) 関数でコンソール入力バッファの
**ENABLE\_PROCESSED\_INPUT** モードを無効にすれば、CTRL+C
はシグナルではなくキーボード入力として報告される。- **SetConsoleCtrlHandler** を **NULL** と
**TRUE** の引数で呼び出すと、呼び出し側プロセスは CTRL+C
シグナルを無視するようになる。この属性は子プロセスに継承されるが、既存プロセスに影響せずに任意のプロセスで有効化・無効化できる。-
CTRL+C シグナルが無効化されておらず、かつコンソールプロセスがデバッグ中の場合、システムは **DBG\_CONTROL\_C**
例外を発生させる。この例外はデバッガのためだけに発生するものであり、アプリケーションは例外ハンドラで処理してはならない。デバッガが例外を処理した場合、アプリケーションは
CTRL+C に気づかない (ただし、警告可能な待機は終了する)。デバッガが例外を未処理のまま渡した場合、CTRL+C
はコンソールプロセスに渡され前述のようにシグナルとして扱われる。コンソールプロセスは
[**GenerateConsoleCtrlEvent**](generateconsolectrlevent.md) を使って
CTRL+C/CTRL+BREAK
シグナルをコンソールプロセスグループに送信できる。ユーザーがコンソールを閉じた、ログオフした、システムをシャットダウンした際、システムは
**CTRL\_CLOSE\_EVENT**、**CTRL\_LOGOFF\_EVENT**、**CTRL\_SHUTDOWN\_EVENT**
シグナルを生成し、プロセスが終了前にクリーンアップする機会を与える。これら 3
つのシグナル処理中は、コンソール関数やコンソール関数を呼び出す C
ランタイム関数は信頼できる動作をしない可能性がある。内部のコンソールクリーンアップルーチンの一部または全部が、プロセスのシグナルハンドラ実行前に呼び出されているためである。**Windows
7/8/8.1/10:** コンソールアプリケーションが gdi32.dll または user32.dll
をロードしている場合、**SetConsoleCtrlHandler** で指定した
[**HandlerRoutine**](handlerroutine.md) は **CTRL\_LOGOFF\_EVENT** と
**CTRL\_SHUTDOWN\_EVENT** に対して呼び出されない。OS は gdi32.dll/user32.dll
をロードするプロセスをコンソールアプリケーションではなく Windows
アプリケーションと認識するためである。この動作は、gdi32.dll/user32.dll
の関数を直接呼び出さないが、内部でそれらを呼び出す Shell
関数のような関数を呼び出すコンソールアプリケーションでも発生する。こうした状況下でユーザーのサインアウトやデバイスのシャットダウン時にイベントを受け取るには、コンソールアプリケーション内に非表示ウィンドウを作成し、そのウィンドウが受け取る
[**WM\_QUERYENDSESSION**](/windows/win32/shutdown/wm-queryendsession)
と [**WM\_ENDSESSION**](/windows/win32/shutdown/wm-endsession)
を処理する。非表示ウィンドウは
[**CreateWindowEx**](/windows/win32/api/winuser/nf-winuser-createwindowexa)
を *dwExStyle* に 0 を指定して呼び出すことで作成できる。例は後述の基本ハンドラ例を参照。


%index
SetConsoleCursorInfo
指定したコンソール画面バッファのカーソルのサイズと可視性を設定する。
%group
Win32 kernel32
%prm
hConsoleOutput, lpConsoleCursorInfo
hConsoleOutput : [intptr] コンソール画面バッファへのハンドル。ハンドルには **GENERIC\_READ** アクセス権が必要である。詳細は [コンソールバッファのセキュリティとアクセス権](console-buffer-security-and-access-rights.md) を参照。
lpConsoleCursorInfo : [var] コンソール画面バッファのカーソルに関する新しい設定を提供する [**CONSOLE\_CURSOR\_INFO**](console-cursor-info-str.md) 構造体へのポインタ。
%inst
指定したコンソール画面バッファのカーソルのサイズと可視性を設定する。

[戻り値]
関数が成功した場合、戻り値は非ゼロである。失敗した場合はゼロである。拡張エラー情報を取得するには
[**GetLastError**](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror)
を呼び出す。

[備考]

画面バッファのカーソルが可視のとき、その見た目は文字セルを完全に埋めるものからセル下部の横線まで多様である。[**CONSOLE\_CURSOR\_INFO**](console-cursor-info-str.md)
構造体の **dwSize** メンバはカーソルが文字セルを占める割合 (パーセント) を指定する。このメンバが 1 未満または 100
より大きい場合、**SetConsoleCursorInfo** は失敗する。> [!TIP] > この API は
**[仮想ターミナル](console-virtual-terminal-sequences.md)** の
**[カーソル可視性](console-virtual-terminal-sequences.md#cursor-visibility)**
セクションの `^[[?25h` および `^[[?25l` シーケンスに相当する。


%index
SetConsoleCursorPosition
指定したコンソール画面バッファのカーソル位置を設定する SetConsoleCursorPosition 関数のリファレンス情報を参照。
%group
Win32 kernel32
%prm
hConsoleOutput, dwCursorPosition
hConsoleOutput : [intptr] コンソール画面バッファへのハンドル。ハンドルには **GENERIC\_READ** アクセス権が必要である。詳細は [コンソールバッファのセキュリティとアクセス権](console-buffer-security-and-access-rights.md) を参照。
dwCursorPosition : [var] 新しいカーソル位置を文字単位で指定する [**COORD**](coord-str.md) 構造体。座標は画面バッファ内の文字セルの列と行であり、コンソール画面バッファの境界内でなければならない。
%inst
指定したコンソール画面バッファのカーソル位置を設定する SetConsoleCursorPosition 関数のリファレンス情報を参照。

[戻り値]
関数が成功した場合、戻り値は非ゼロである。失敗した場合はゼロである。拡張エラー情報を取得するには
[**GetLastError**](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror)
を呼び出す。

[備考]

カーソル位置は、[**WriteFile**](/windows/win32/api/fileapi/nf-fileapi-writefile)
または [**WriteConsole**](writeconsole.md) による書き込み、あるいは
[**ReadFile**](/windows/win32/api/fileapi/nf-fileapi-readfile) または
[**ReadConsole**](readconsole.md)
によるエコー表示が行われる位置を決定する。カーソルの現在位置を取得するには
[**GetConsoleScreenBufferInfo**](getconsolescreenbufferinfo.md)
を使用する。新しいカーソル位置がコンソール画面バッファのウィンドウ境界の外側にある場合、ウィンドウ原点がカーソルを可視にするよう変更される。>
[!TIP] > この API は
**[仮想ターミナル](console-virtual-terminal-sequences.md)** の
**[単純カーソル位置指定](console-virtual-terminal-sequences.md#simple-cursor-positioning)**
および
**[カーソル位置指定](console-virtual-terminal-sequences.md#cursor-positioning)**
セクションに相当する。改行、復帰、バックスペース、タブの制御シーケンスもカーソル位置指定に役立てることができる。


%index
SetConsoleDisplayMode
指定したコンソール画面バッファの表示モードを設定する SetConsoleDisplayMode 関数のリファレンス情報を参照。
%group
Win32 kernel32
%prm
hConsoleOutput, dwFlags, lpNewScreenBufferDimensions
hConsoleOutput : [intptr] コンソール画面バッファへのハンドル。
dwFlags : [int] コンソールの表示モード。このパラメータには以下の 1 つ以上を指定できる。| 値 | 意味 | |-|-| | **CONSOLE_FULLSCREEN_MODE** 1 | テキストをフルスクリーンモードで表示する。| | **CONSOLE_WINDOWED_MODE** 2 | テキストをコンソールウィンドウで表示する。|
lpNewScreenBufferDimensions : [var] 画面バッファの新しい寸法 (文字単位) を受け取る [**COORD**](coord-str.md) 構造体へのポインタ。
%inst
指定したコンソール画面バッファの表示モードを設定する SetConsoleDisplayMode 関数のリファレンス情報を参照。

[戻り値]
関数が成功した場合、戻り値は非ゼロである。失敗した場合はゼロである。拡張エラー情報を取得するには
[**GetLastError**](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror)
を呼び出す。

[備考]
[!INCLUDE
[no-vt-equiv-user-priv](./includes/no-vt-equiv-user-priv.md)]


%index
SetConsoleHistoryInfo
呼び出し側プロセスの Windows コンソールの履歴設定を設定する。
%group
Win32 kernel32
%prm
lpConsoleHistoryInfo
lpConsoleHistoryInfo : [var] プロセスのコンソールの履歴設定を含む [**CONSOLE\_HISTORY\_INFO**](console-history-info.md) 構造体へのポインタ。
%inst
呼び出し側プロセスの Windows コンソールの履歴設定を設定する。

[戻り値]
関数が成功した場合、戻り値は非ゼロである。失敗した場合はゼロである。拡張エラー情報を取得するには
[**GetLastError**](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror)
を呼び出す。

[備考]
呼び出し側プロセスがコンソールプロセスでない場合、関数は失敗し最終エラーコードを **ERROR\_ACCESS\_DENIED**
に設定する。[!INCLUDE
[no-vt-equiv-shell-banner](./includes/no-vt-equiv-shell-banner.md)]


%index
SetConsoleMode
コンソール入力バッファの入力モード、またはコンソール画面バッファの出力モードを設定する。
%group
Win32 kernel32
%prm
hConsoleHandle, dwMode
hConsoleHandle : [intptr] コンソール入力バッファまたはコンソール画面バッファへのハンドル。ハンドルには **GENERIC\_READ** アクセス権が必要である。詳細は [コンソールバッファのセキュリティとアクセス権](console-buffer-security-and-access-rights.md) を参照。
dwMode : [int] 設定する入力または出力モード。[!INCLUDE [console-mode-flags](./includes/console-mode-flags.md)]
%inst
コンソール入力バッファの入力モード、またはコンソール画面バッファの出力モードを設定する。

[戻り値]
関数が成功した場合、戻り値は非ゼロである。失敗した場合はゼロである。拡張エラー情報を取得するには
[**GetLastError**](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror)
を呼び出す。

[備考]
[!INCLUDE [console-mode-remarks](./includes/console-mode-remarks.md)]
コンソール入力バッファや画面バッファの現在のモードを取得するには
[**GetConsoleMode**](getconsolemode.md) を使用する。


%index
SetConsoleNumberOfCommandsW
(no summary)
%group
Win32 kernel32
%prm
Number, ExeName
Number : [int] 
ExeName : [wstr] 
%inst



%index
SetConsoleOutputCP
呼び出し側プロセスに関連付けられたコンソールが使用する出力コードページを設定する。
%group
Win32 kernel32
%prm
wCodePageID
wCodePageID : [int] 設定するコードページの識別子。詳細は備考を参照。
%inst
呼び出し側プロセスに関連付けられたコンソールが使用する出力コードページを設定する。

[戻り値]
関数が成功した場合、戻り値は非ゼロである。失敗した場合はゼロである。拡張エラー情報を取得するには
[**GetLastError**](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror)
を呼び出す。

[備考]
コードページは 256
個の文字コードを個別の文字にマッピングする。コードページごとに異なる特殊文字が含まれ、通常は言語または言語グループに合わせてカスタマイズされている。現在のフォントが固定ピッチ
Unicode フォントの場合、**SetConsoleOutputCP**
は呼び出しごとに別のフォントをロードするのではなく、文字値からフォントのグリフセットへのマッピングを変更する。これはコンソールウィンドウでの拡張文字
(ASCII 値 127 超) の表示に影響する。ただし現在のフォントがラスタフォントの場合、**SetConsoleOutputCP**
は拡張文字の表示に影響しない。インストールまたはサポートされているコードページを調べるには
[EnumSystemCodePages](/windows/win32/api/winnls/nf-winnls-enumsystemcodepagesa)
を使用する。ローカルコンピュータで利用可能なコードページの識別子はレジストリの次のキーにも保存されている:
`HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Nls\CodePage`。ただし
Windows バージョンによってレジストリは異なるため
[EnumSystemCodePages](/windows/win32/api/winnls/nf-winnls-enumsystemcodepagesa)
で列挙するほうがよい。特定のコードページが有効かを判定するには
[IsValidCodePage](/windows/win32/api/winnls/nf-winnls-isvalidcodepage)
を使用する。コードページ名を含む詳細情報を取得するには
[**GetCPInfoEx**](/windows/win32/api/winnls/nf-winnls-getcpinfoexa)
を使用する。利用可能なコードページ識別子の一覧は
[コードページ識別子](/windows/win32/intl/code-page-identifiers)
を参照。コンソールの現在の出力コードページを取得するには
[**GetConsoleOutputCP**](getconsoleoutputcp.md)
を使用する。入力コードページの設定・取得には [**SetConsoleCP**](setconsolecp.md) と
[**GetConsoleCP**](getconsolecp.md) を使用する。


%index
SetConsoleScreenBufferInfoEx
指定したコンソール画面バッファの拡張情報を設定する。
%group
Win32 kernel32
%prm
hConsoleOutput, lpConsoleScreenBufferInfoEx
hConsoleOutput : [intptr] コンソール画面バッファへのハンドル。ハンドルには **GENERIC\_WRITE** アクセス権が必要である。詳細は [コンソールバッファのセキュリティとアクセス権](console-buffer-security-and-access-rights.md) を参照。
lpConsoleScreenBufferInfoEx : [var] コンソール画面バッファ情報を含む [**CONSOLE\_SCREEN\_BUFFER\_INFOEX**](console-screen-buffer-infoex.md) 構造体。
%inst
指定したコンソール画面バッファの拡張情報を設定する。

[戻り値]
関数が成功した場合、戻り値は非ゼロである。失敗した場合はゼロである。拡張エラー情報を取得するには
[**GetLastError**](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror)
を呼び出す。

[備考]
> [!TIP] > この API は
**[仮想ターミナル](console-virtual-terminal-sequences.md)**
に部分的な相当機能がある。**[カーソル位置指定バッファ](console-virtual-terminal-sequences.md#cursor-positioning)**
と **[テキスト属性](console-virtual-terminal-sequences.md#text-formatting)**
には固有のシーケンス相当品がある。カラーテーブルは構成できないが、通常の
**[コンソール関数](console-functions.md)** で利用できる範囲を超えた
**[拡張カラー](console-virtual-terminal-sequences.md#extended-colors)**
が利用できる。ポップアップ属性に相当するものはなく、ポップアップメニューは **仮想ターミナル**
世界ではコマンドラインクライアントアプリケーションの責任となる。最後にウィンドウサイズとフルスクリーン状態は **仮想ターミナル**
世界ではユーザーの権限とみなされ、相当シーケンスはない。


%index
SetConsoleScreenBufferSize
指定したコンソール画面バッファのサイズを変更する SetConsoleScreenBufferSize 関数のリファレンス情報を参照。
%group
Win32 kernel32
%prm
hConsoleOutput, dwSize
hConsoleOutput : [intptr] コンソール画面バッファへのハンドル。ハンドルには **GENERIC\_READ** アクセス権が必要である。詳細は [コンソールバッファのセキュリティとアクセス権](console-buffer-security-and-access-rights.md) を参照。
dwSize : [var] コンソール画面バッファの新しいサイズを文字行列単位で指定する [**COORD**](coord-str.md) 構造体。指定する幅と高さは、コンソール画面バッファのウィンドウの幅と高さ未満にできない。またシステムが許す最小サイズ未満にもできない。この最小値は現在のコンソール用フォントサイズ (ユーザーが選択) および [**GetSystemMetrics**](/windows/win32/api/winuser/nf-winuser-getsystemmetrics) が返す **SM\_CXMIN** と **SM\_CYMIN** に依存する。
%inst
指定したコンソール画面バッファのサイズを変更する SetConsoleScreenBufferSize 関数のリファレンス情報を参照。

[戻り値]
関数が成功した場合、戻り値は非ゼロである。失敗した場合はゼロである。拡張エラー情報を取得するには
[**GetLastError**](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror)
を呼び出す。

[備考]
[!INCLUDE
[no-vt-equiv-user-priv](./includes/no-vt-equiv-user-priv.md)]


%index
SetConsoleTextAttribute
WriteFile/WriteConsole で書き込まれる、または ReadFile/ReadConsole でエコーされる文字の属性をコンソール画面バッファに設定する。
%group
Win32 kernel32
%prm
hConsoleOutput, wAttributes
hConsoleOutput : [intptr] コンソール画面バッファへのハンドル。ハンドルには **GENERIC\_READ** アクセス権が必要である。詳細は [コンソールバッファのセキュリティとアクセス権](console-buffer-security-and-access-rights.md) を参照。
wAttributes : [int] [文字属性](console-screen-buffers.md#character-attributes)。
%inst
WriteFile/WriteConsole で書き込まれる、または ReadFile/ReadConsole
でエコーされる文字の属性をコンソール画面バッファに設定する。

[戻り値]
関数が成功した場合、戻り値は非ゼロである。失敗した場合はゼロである。拡張エラー情報を取得するには
[**GetLastError**](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror)
を呼び出す。

[備考]
画面バッファの現在のカラー属性を取得するには
[**GetConsoleScreenBufferInfo**](getconsolescreenbufferinfo.md)
を呼び出す。> [!TIP] > この API は
**[仮想ターミナル](console-virtual-terminal-sequences.md)** の
**[テキスト整形](console-virtual-terminal-sequences.md#text-formatting)**
シーケンスに相当する。新規・継続的な開発には _仮想ターミナルシーケンス_ が推奨される。


%index
SetConsoleTitleW
現在のコンソールウィンドウのタイトルを設定する SetConsoleTitle 関数のリファレンス情報を参照。
%group
Win32 kernel32
%prm
lpConsoleTitle
lpConsoleTitle : [wstr] コンソールウィンドウのタイトルバーに表示する文字列。全体サイズは 64K 未満でなければならない。
%inst
現在のコンソールウィンドウのタイトルを設定する SetConsoleTitle 関数のリファレンス情報を参照。

[戻り値]
関数が成功した場合、戻り値は非ゼロである。失敗した場合はゼロである。拡張エラー情報を取得するには
[**GetLastError**](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror)
を呼び出す。

[備考]
プロセスが終了するとシステムは元のコンソールタイトルを復元する。[!INCLUDE
[setting-codepage-mode-remarks](./includes/setting-codepage-mode-remarks.md)]
> [!TIP] > この API は
**[仮想ターミナル](console-virtual-terminal-sequences.md)** の
**[ウィンドウタイトル](console-virtual-terminal-sequences.md#window-title)**
シーケンスに相当する。新規・継続的な開発には _仮想ターミナルシーケンス_ が推奨される。


%index
SetConsoleWindowInfo
コンソール画面バッファのウィンドウの現在のサイズと位置を設定する。
%group
Win32 kernel32
%prm
hConsoleOutput, bAbsolute, lpConsoleWindow
hConsoleOutput : [intptr] コンソール画面バッファへのハンドル。ハンドルには **GENERIC\_READ** アクセス権が必要である。詳細は [コンソールバッファのセキュリティとアクセス権](console-buffer-security-and-access-rights.md) を参照。
bAbsolute : [int] このパラメータが **TRUE** の場合、座標はウィンドウの新しい左上隅と右下隅を指定する。**FALSE** の場合、座標は現在のウィンドウ隅座標に対する相対値である。
lpConsoleWindow : [var] ウィンドウの新しい左上隅と右下隅を指定する [**SMALL\_RECT**](small-rect-str.md) 構造体へのポインタ。
%inst
コンソール画面バッファのウィンドウの現在のサイズと位置を設定する。

[戻り値]
関数が成功した場合、戻り値は非ゼロである。失敗した場合はゼロである。拡張エラー情報を取得するには
[**GetLastError**](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror)
を呼び出す。

[備考]
指定したウィンドウ矩形がコンソール画面バッファの境界を超える場合、関数は失敗する。すなわち *lpConsoleWindow* 矩形
(*bAbsolute* が FALSE の場合は算出された) の **Top**/**Left**
メンバはゼロ未満にできず、**Bottom**/**Right** メンバは画面バッファ高さ - 1 および幅 - 1
を超えられない。**Right** (または算出した右座標) が **Left** (または左座標) 以下、**Bottom** が
**Top** 以下の場合も失敗する。複数の画面バッファを持つコンソールでは、1
つの画面バッファのウィンドウ位置を変更しても他のバッファのウィンドウ位置には影響しない。画面バッファのウィンドウの現在のサイズと位置を取得するには
[**GetConsoleScreenBufferInfo**](getconsolescreenbufferinfo.md)
を使用する。この関数は現在の画面バッファサイズ、フォントサイズ、画面サイズに基づいてウィンドウの最大サイズも返す。[**GetLargestConsoleWindowSize**](getlargestconsolewindowsize.md)
は現在のフォントと画面サイズに基づく最大ウィンドウサイズを返すが、コンソール画面バッファのサイズは考慮しない。**SetConsoleWindowInfo**
はサイズを変更せずに矩形位置をずらして画面バッファの内容をスクロールするのにも使える。[!INCLUDE
[no-vt-equiv-user-priv](./includes/no-vt-equiv-user-priv.md)]


%index
SetCurrentConsoleFontEx
現在のコンソールフォントに関する拡張情報を設定する SetCurrentConsoleFontEx 関数のリファレンス情報を参照。
%group
Win32 kernel32
%prm
hConsoleOutput, bMaximumWindow, lpConsoleCurrentFontEx
hConsoleOutput : [intptr] コンソール画面バッファへのハンドル。ハンドルには **GENERIC\_WRITE** アクセス権が必要である。詳細は [コンソールバッファのセキュリティとアクセス権](console-buffer-security-and-access-rights.md) を参照。
bMaximumWindow : [int] このパラメータが **TRUE** の場合、最大ウィンドウサイズ用のフォント情報を設定する。**FALSE** の場合、現在のウィンドウサイズ用のフォント情報を設定する。
lpConsoleCurrentFontEx : [var] フォント情報を含む [**CONSOLE\_FONT\_INFOEX**](console-font-infoex.md) 構造体へのポインタ。
%inst
現在のコンソールフォントに関する拡張情報を設定する SetCurrentConsoleFontEx 関数のリファレンス情報を参照。

[戻り値]
関数が成功した場合、戻り値は非ゼロである。失敗した場合はゼロである。拡張エラー情報を取得するには
[**GetLastError**](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror)
を呼び出す。

[備考]
この関数を使用するアプリケーションをコンパイルするには、**\_WIN32\_WINNT** を 0x0500 以降として定義する。詳細は
[Windows ヘッダの使用](/windows/win32/winprog/using-the-windows-headers)
を参照。[!INCLUDE
[no-vt-equiv-user-priv](./includes/no-vt-equiv-user-priv.md)]


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
SetDefaultCommConfigW
通信デバイスの既定構成を設定する。(Unicode)
%group
Win32 kernel32
%prm
lpszName, lpCC, dwSize
lpszName : [wstr] デバイスの名前。例えば COM1～COM9 はシリアルポート、LPT1～LPT9 はパラレルポートである。
lpCC : [var] COMMCONFIG 構造体へのポインタ。
dwSize : [int] lpCC が指す構造体のサイズ (バイト単位)。
%inst
通信デバイスの既定構成を設定する。(Unicode)

[戻り値]
関数が成功した場合、戻り値は非ゼロである。失敗した場合はゼロである。拡張エラー情報を取得するには GetLastError を呼び出す。

[備考]
> [!NOTE] > winbase.h ヘッダは SetDefaultCommConfig を、UNICODE
プリプロセッサ定数の定義に応じて ANSI 版または Unicode
版を自動選択するエイリアスとして定義する。エンコーディング中立なエイリアスと中立でないコードを混在させると、コンパイルエラーや実行時エラーを引き起こすことがある。詳細は
[関数プロトタイプの規約](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
SetDllDirectoryW
アプリケーションが DLL を検索する際に使用する検索パスにディレクトリを追加する。(Unicode)
%group
Win32 kernel32
%prm
lpPathName
lpPathName : [wstr] 検索パスに追加するディレクトリ。このパラメータが空文字列 ("") の場合、既定の DLL 検索順序から現在のディレクトリが除外される。NULL の場合、関数は既定の検索順序を復元する。
%inst
アプリケーションが DLL を検索する際に使用する検索パスにディレクトリを追加する。(Unicode)

[戻り値]
関数が成功した場合、戻り値は非ゼロである。失敗した場合はゼロである。拡張エラー情報を取得するには GetLastError を呼び出す。

[備考]
SetDllDirectory 関数は、以降のすべての LoadLibrary および LoadLibraryEx
呼び出しに影響する。指定ディレクトリが検索パスにある間、安全な DLL 検索モードも事実上無効になる。> [!NOTE] >
パッケージ化または保護プロセスを実行していない Win32
プロセスでは、この関数を呼び出すと、その呼び出し側プロセスから起動される子プロセスの DLL
検索順序にも影響する。SetDllDirectory 呼び出し後の標準 DLL 検索パスは次のとおりである:
（以下省略）


%index
SetDynamicTimeZoneInformation
現在のタイムゾーンと動的夏時間設定を設定する。これらの設定は協定世界時 (UTC) からローカル時刻への変換を制御する。
%group
Win32 kernel32
%prm
lpTimeZoneInformation
lpTimeZoneInformation : [var] DYNAMIC_TIME_ZONE_INFORMATION 構造体へのポインタ。
%inst
現在のタイムゾーンと動的夏時間設定を設定する。これらの設定は協定世界時 (UTC) からローカル時刻への変換を制御する。

[戻り値]
関数が成功した場合、戻り値は非ゼロである。失敗した場合はゼロである。拡張エラー情報を取得するには GetLastError を呼び出す。

[備考]
この関数が成功するには、アプリケーションが SE_TIME_ZONE_NAME
特権を持つ必要がある。この特権は既定で無効である。SetDynamicTimeZoneInformation を呼び出す前に
AdjustTokenPrivileges で特権を有効化し、呼び出し後に無効化する。詳細は「特権付き実行」を参照。


%index
SetEndOfFile
指定したファイルの物理ファイルサイズを、ファイルポインタの現在位置に設定する。
%group
Win32 kernel32
%prm
hFile
hFile : [intptr] 拡張または切り詰めるファイルへのハンドル。ファイルハンドルは GENERIC_WRITE アクセス権で作成されている必要がある。詳細は「ファイルのセキュリティとアクセス権」を参照。
%inst
指定したファイルの物理ファイルサイズを、ファイルポインタの現在位置に設定する。

[戻り値]
関数が成功した場合、戻り値は非ゼロである。失敗した場合、戻り値はゼロ (0) である。拡張エラー情報を取得するには
GetLastError を呼び出す。

[備考]
SetEndOfFile
関数はファイルの切り詰めまたは拡張に使用できる。拡張する場合、元のファイル末尾と新しい末尾の間の内容は未定義である。各ファイルストリームには次の項目がある:
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
SetErrorMode
指定された種類の重大なエラーをシステムが処理するかプロセスが処理するかを制御する。
%group
Win32 kernel32
%prm
uMode
uMode : [int] 
%inst
指定された種類の重大なエラーをシステムが処理するかプロセスが処理するかを制御する。

[戻り値]
戻り値はエラーモードビットフラグの以前の状態である。

[備考]

各プロセスには、アプリケーションが重大なエラーにどう応答するかをシステムに示すエラーモードが関連付けられている。子プロセスは親プロセスのエラーモードを継承する。プロセスのエラーモードを取得するには
GetErrorMode
関数を使用する。エラーモードはプロセス全体に設定されるため、マルチスレッドアプリケーションでは異なるエラーモードフラグを設定しないよう注意すること。さもなくばエラー処理が一貫しなくなる。すべてのプロセッサアーキテクチャでアライメント違反がアプリケーションに可視化されるわけではない。したがって
SEM_NOALIGNMENTFAULTEXCEPT
の指定はそうしたアーキテクチャではエラーではないが、システムは要求を黙って無視する可能性がある。つまり次のようなコード列は x86
コンピュータでも常に妥当とは限らない:
（以下省略）


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
SetFileApisToANSI
現在のプロセスのファイル I/O 関数群に ANSI 文字集合コードページを使わせる。
%group
Win32 kernel32
%prm

%inst
現在のプロセスのファイル I/O 関数群に ANSI 文字集合コードページを使わせる。

[備考]
SetFileApisToANSI がコードページを設定するファイル I/O 関数とは、KERNEL32.DLL
がエクスポートするファイル名を受け取る/返す関数群である。SetFileApisToANSI はプロセス単位でコードページを設定する
(スレッド単位でもコンピュータ単位でもない)。SetFileApisToANSI は、同じファイル I/O 関数群に OEM
文字集合コードページを使わせる SetFileApisToOEM 関数を補完する。8 ビットコンソール関数は既定で OEM
コードページ、それ以外の関数は既定で ANSI
コードページを使用する。このためコンソール関数が返す文字列は他の関数で正しく処理されない場合があり、逆もまた然りである。例えば
FindFirstFileA がある種の拡張 ANSI 文字を含む文字列を返し、8 ビットコンソール関数が OEM
コードページを使う設定の場合、WriteConsoleA は文字列を正しく表示しない。現在ファイル I/O
関数群がどのコードページを使っているかを判定するには AreFileApisANSI 関数を使う。8
ビットコンソール関数のコードページを設定するには SetConsoleCP と SetConsoleOutputCP
を使う。コードページ非互換問題を解決するには、コンソールアプリケーションで Unicode
を使用するのが最善である。そうでない場合、コンソールアプリケーションは SetFileApisToOEM を呼び出してファイル I/O
関数群に OEM 文字集合を使わせることができる。元に戻すには SetFileApisToANSI
を呼ぶ。コマンドラインを扱う際、コンソールアプリケーションはコマンドラインを Unicode 形式で取得し、関連する文字→OEM 関数で
OEM 形式に変換すべきである。またこの場合、コマンドライン main 関数の argv 配列は ANSI
文字集合の文字列を含むことにも注意。Windows 8 および Windows Server 2012
では、この関数は以下の技術によってサポートされている。
（以下省略）


%index
SetFileApisToOEM
プロセスのファイル I/O 関数群に OEM 文字集合コードページを使わせる。
%group
Win32 kernel32
%prm

%inst
プロセスのファイル I/O 関数群に OEM 文字集合コードページを使わせる。

[備考]
SetFileApisToOEM がコードページを設定するファイル I/O 関数とは、KERNEL32.DLL
がエクスポートするファイル名を受け取る/返す関数群である。SetFileApisToOEM はプロセス単位でコードページを設定する
(スレッド単位でもコンピュータ単位でもない)。SetFileApisToOEM は、同じファイル I/O 関数群に ANSI
文字集合コードページを使わせる SetFileApisToANSI 関数によって補完される。8 ビットコンソール関数は既定で OEM
コードページ、それ以外の関数は既定で ANSI
コードページを使用する。このためコンソール関数が返す文字列は他の関数で正しく処理されない場合があり、逆もまた然りである。例えば
FindFirstFileA がある種の拡張 ANSI 文字を含む文字列を返し、8 ビットコンソール関数が OEM
コードページを使う設定の場合、WriteConsoleA は文字列を正しく表示しない。現在ファイル I/O
関数群がどのコードページを使っているかを判定するには AreFileApisANSI 関数を使う。8
ビットコンソール関数のコードページを設定するには SetConsoleCP と SetConsoleOutputCP
を使う。コードページ非互換問題の解決には、コンソールアプリケーションで Unicode
を使用するのが最善である。そうでない場合、コンソールアプリケーションは SetFileApisToOEM を呼び出してファイル I/O
関数群に OEM 文字集合を使わせることができる。元に戻すには SetFileApisToANSI
を呼ぶ。コマンドラインを扱う際、コンソールアプリケーションはコマンドラインを Unicode 形式で取得し、関連する文字→OEM 関数で
OEM 形式に変換すべきである。この場合、コマンドライン main 関数の argv 配列は ANSI
文字集合の文字列を含むことにも注意。Windows 8 および Windows Server 2012
では、この関数は以下の技術によってサポートされている。
（以下省略）


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
SetFileAttributesTransactedW
ファイルまたはディレクトリの属性をトランザクション操作として設定する。(Unicode)
%group
Win32 kernel32
%prm
lpFileName, dwFileAttributes, hTransaction
lpFileName : [wstr] 属性を設定するファイルの名前。
dwFileAttributes : [int] ファイルに設定するファイル属性。属性値とその説明の一覧は「ファイル属性定数」を参照。このパラメータにはビット単位 OR で複数の値を指定できるが、他のすべての値は FILE_ATTRIBUTE_NORMAL を上書きする。この関数はすべての属性をサポートしているわけではない。詳細は備考を参照。以下はサポートされる属性値の一覧である。
hTransaction : [intptr] トランザクションへのハンドル。このハンドルは CreateTransaction 関数が返す。
%inst
ファイルまたはディレクトリの属性をトランザクション操作として設定する。(Unicode)

[戻り値]
関数が成功した場合、戻り値は非ゼロである。失敗した場合はゼロである。拡張エラー情報を取得するには GetLastError を呼び出す。

[備考]
次の表は SetFileAttributesTransacted
では設定できない属性の設定方法を示す。なお、これらはトランザクション操作ではない。
（以下省略）


%index
SetFileBandwidthReservation
指定ファイルストリームに対する帯域予約を要求する。予約は指定ファイルハンドル上の I/O リクエストに対する「ミリ秒周期あたりのバイト数」として指定される。
%group
Win32 kernel32
%prm
hFile, nPeriodMilliseconds, nBytesPerPeriod, bDiscardable, lpTransferSize, lpNumOutstandingRequests
hFile : [intptr] ファイルへのハンドル。
nPeriodMilliseconds : [int] 予約の周期 (ミリ秒)。周期は I/O がカーネルに発行されてから完了すべき時刻までの時間である。ファイルストリームに対してサポートされる最小値は、帯域予約が設定されていないハンドルで GetFileBandwidthReservation を呼び出した際の lpPeriodMilliseconds の戻り値で判定できる。
nBytesPerPeriod : [int] 予約する帯域幅 (1 周期あたりのバイト数)。ファイルストリームに対してサポートされる最大値は、帯域予約が設定されていないハンドルで GetFileBandwidthReservation を呼び出した際の lpBytesPerPeriod の戻り値で判定できる。
bDiscardable : [int] 期間満了前にドライバが I/O 操作を満たせなかった場合に、I/O をエラーで完了させるかどうかを示す。指定ファイルストリームのドライバのいずれかがこの機能をサポートしない場合、関数は成功を返しフラグを無視することがある。設定が尊重されたかを確認するには、同じ hFile ハンドルで GetFileBandwidthReservation を呼び出し *pDiscardable の戻り値を調べる。
lpTransferSize : [var] アプリケーションが発行する個々の I/O リクエストの最小サイズを受け取る変数へのポインタ。すべての I/O リクエストは TransferSize の倍数でなければならない。
lpNumOutstandingRequests : [var] OS に対して未処理のまま許容する TransferSize チャンク数を受け取る変数へのポインタ。これによりストレージスタックはデバイスをビジー状態に保ち、最大スループットを得られる。
%inst
指定ファイルストリームに対する帯域予約を要求する。予約は指定ファイルハンドル上の I/O
リクエストに対する「ミリ秒周期あたりのバイト数」として指定される。

[戻り値]
成功した場合は非ゼロ、そうでない場合はゼロを返す。既存の予約のためにボリュームに十分な帯域がない場合、予約は失敗することがあり、その場合
ERROR_NO_SYSTEM_RESOURCES が返る。拡張エラー情報を取得するには GetLastError を呼び出す。

[備考]
要求する帯域予約は周期あたり 1 パケット以上でなければならない。特定ボリュームの最小周期
(ミリ秒)、周期あたり最大バイト数、最小転送サイズ (バイト) は、SetFileBandwidthReservation
で未使用のハンドルで GetFileBandwidthReservation を呼び出したときに
lpPeriodMilliseconds、lpBytesPerPeriod、lpTransferSize から得られる。すなわち: 1 ?
(nBytesPerPeriod)×(*lpPeriodMilliseconds)/(*lpTransferSize)/(nPeriodMilliseconds)。Windows
8 および Windows Server 2012 では、この関数は以下の技術によってサポートされている。
（以下省略）


%index
SetFileCompletionNotificationModes
ファイルハンドルに対する通知モードを設定し、指定ファイルの完了通知の挙動を指定できるようにする。
%group
Win32 kernel32
%prm
FileHandle, Flags
FileHandle : [intptr] ファイルへのハンドル。
Flags : [int] 設定するモード。一度に複数のモードを設定できるが、ファイルハンドルに設定されたモードは後から解除できない。
%inst
ファイルハンドルに対する通知モードを設定し、指定ファイルの完了通知の挙動を指定できるようにする。

[戻り値]
成功した場合は非ゼロ、そうでない場合はゼロを返す。拡張エラー情報を取得するには GetLastError を呼び出す。

[備考]
この関数を使用するアプリケーションをコンパイルするには、_WIN32_WINNT マクロを 0x0600
以降に定義する。詳細は「Windows ヘッダの使用」を参照。Windows 8 および Windows Server 2012
では、この関数は以下の技術によってサポートされている。
（以下省略）


%index
SetFileInformationByHandle
指定したファイルのファイル情報を設定する。
%group
Win32 kernel32
%prm
hFile, FileInformationClass, lpFileInformation, dwBufferSize
hFile : [intptr] 情報を変更するファイルへのハンドル。このハンドルは要求する変更に適した権限で開かれている必要がある。詳細は備考およびサンプルコードを参照。パイプハンドルであってはならない。
FileInformationClass : [int] 変更する情報の種類を指定する FILE_INFO_BY_HANDLE_CLASS 列挙値。有効な値の表は備考を参照。
lpFileInformation : [intptr] 指定したファイル情報クラスに対して変更する情報を含むバッファへのポインタ。このパラメータが指す構造体は FileInformationClass で指定したクラスに対応する。有効な構造体型の表は備考を参照。
dwBufferSize : [int] lpFileInformation のサイズ (バイト単位)。
%inst
指定したファイルのファイル情報を設定する。

[戻り値]
成功した場合は非ゼロ、そうでない場合はゼロを返す。拡張エラー情報を取得するには GetLastError を呼び出す。

[備考]
一部のファイル情報クラスは OS
リリースによって挙動がわずかに異なる。これらのクラスは基礎となるドライバでサポートされており、返される情報は OS
リリース間で変更される可能性がある。この関数で使用する有効なファイル情報クラスと対応するデータ構造体型を次の表に示す。
（以下省略）


%index
SetFileIoOverlappedRange
指定したファイルハンドルに仮想アドレス範囲を関連付ける。
%group
Win32 kernel32
%prm
FileHandle, OverlappedRangeStart, Length
FileHandle : [intptr] ファイルへのハンドル。このファイルハンドルは FILE_READ_ATTRIBUTES アクセス権でオープンされている必要がある。
OverlappedRangeStart : [var] 範囲の開始アドレス。
Length : [int] 範囲の長さ (バイト単位)。
%inst
指定したファイルハンドルに仮想アドレス範囲を関連付ける。

[戻り値]
成功した場合は非ゼロ、そうでない場合はゼロを返す。拡張エラー情報を取得するには GetLastError を呼び出す。

[備考]
SetFileIoOverlappedRange は、多数の非同期アンバッファ I/O
を発行し、定義済みのオーバーラップ構造体範囲を使用するアプリケーションのパフォーマンス向上に利用できる。この範囲はメモリ内でロックされるため、カーネルは
I/O 要求結果でオーバーラップ構造体を更新する際に特定のロック取得を回避できる。SetFileIoOverlappedRange
は呼び出し側に SeLockMemoryPrivilege アクセス権を要求する。バッファ I/O および同期 I/O
には影響しない。Windows 8 および Windows Server 2012 では、この関数は以下の技術によってサポートされている。
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
SetFilePointerEx
指定したファイルのファイルポインタを移動する。(SetFilePointerEx)
%group
Win32 kernel32
%prm
hFile, liDistanceToMove, lpNewFilePointer, dwMoveMethod
hFile : [intptr] ファイルへのハンドル。ファイルハンドルは GENERIC_READ または GENERIC_WRITE アクセス権で作成されている必要がある。詳細は「ファイルのセキュリティとアクセス権」を参照。
liDistanceToMove : [int64] ファイルポインタを移動するバイト数。正の値はポインタをファイル先頭方向に進め、負の値は後退させる。
lpNewFilePointer : [var] 新しいファイルポインタを受け取る変数へのポインタ。NULL の場合、新しいポインタは返されない。
dwMoveMethod : [int] 
%inst
指定したファイルのファイルポインタを移動する。(SetFilePointerEx)

[戻り値]
関数が成功した場合、戻り値は非ゼロである。失敗した場合はゼロである。拡張エラー情報を取得するには GetLastError を呼び出す。

[備考]
この関数が返すファイルポインタはオーバーラップ読み書き操作には使用されない。オーバーラップ操作のオフセットを指定するには
OVERLAPPED 構造体の Offset と OffsetHigh
メンバを使用する。パイプや通信デバイスのような非シーク可能デバイスのハンドルに対して SetFilePointerEx
は使用できない。hFile のファイル種別を判定するには GetFileType
を使用する。マルチスレッドアプリケーションでファイルポインタを設定する際は注意を要する。共有リソースへのアクセスは同期が必要である。例えば、スレッド間でファイルハンドルを共有し、ファイルポインタを更新し、ファイルから読み込むアプリケーションは、この一連の操作をクリティカルセクションオブジェクトやミューテックスオブジェクトで保護する必要がある。詳細は「クリティカルセクションオブジェクト」「ミューテックスオブジェクト」を参照。hFile
ハンドルが FILE_FLAG_NO_BUFFERING
フラグ付きで開かれている場合、アプリケーションはファイルポインタをセクタ整列位置にのみ移動できる。セクタ整列位置とはボリュームのセクタサイズの整数倍となる位置である。ボリュームのセクタサイズは
GetDiskFreeSpace で取得できる。FILE_FLAG_NO_BUFFERING
で開かれたハンドルに対しセクタ整列でない位置となる distance-to-move 値で SetFilePointerEx
を呼ぶと、関数は失敗し GetLastError は ERROR_INVALID_PARAMETER
を返す。詳細は「ファイルバッファリング」を参照。ファイル末尾を超えた位置にファイルポインタを設定することはエラーではない。ファイルサイズは、SetEndOfFile、WriteFile、WriteFileEx
を呼ぶまで増加しない。書き込み操作はファイルサイズをファイルポインタ位置 +
書き込みバッファサイズまで拡大し、間のバイトは未初期化となる。ファイルの長さを知るために SetFilePointerEx
を使用することもできる。dwMoveMethod に FILE_END を指定しオフセット 0
にシークすれば、返るファイルオフセットがファイル長である。しかしこの手法は現在のファイルポインタを保存しないなど予期せぬ副作用を持ちうるため、代わりに
GetFileSizeEx を使用するほうがシンプルで安全である。また、現在のファイルポインタ位置を問い合わせるにも
SetFilePointerEx を使用でき、FILE_CURRENT の移動方法とゼロの距離を指定すればよい。Windows 8 および
Windows Server 2012 では、この関数は以下の技術によってサポートされている。
（以下省略）


%index
SetFileShortNameW
指定したファイルの短い名前を設定する。(Unicode)
%group
Win32 kernel32
%prm
hFile, lpShortName
hFile : [intptr] ファイルへのハンドル。ファイルは GENERIC_ALL アクセス権または GENERIC_WRITE|DELETE アクセス権のいずれかと、FILE_FLAG_BACKUP_SEMANTICS 属性付きで開かれている必要がある。
lpShortName : [wstr] ファイルの短い名前を指定する文字列へのポインタ。空 (長さゼロ) の文字列を指定すると、hFile が指すファイルに短いファイル名が存在する場合それを削除する。存在しない場合は何もせず成功を返す。
%inst
指定したファイルの短い名前を設定する。(Unicode)

[戻り値]
関数が成功した場合、戻り値は非ゼロである。失敗した場合はゼロである。拡張エラー情報を取得するには GetLastError
を呼び出す。この関数固有のエラーコードが返されることがある。
（以下省略）

[備考]
この関数の呼び出し側は SE_RESTORE_NAME 特権を持つ必要がある。詳細は「特権付き実行」を参照。Windows 8 および
Windows Server 2012 では、この関数は以下の技術によってサポートされている。
（以下省略）


%index
SetFileTime
指定したファイルまたはディレクトリの作成、最終アクセス、または最終更新の日時を設定する。
%group
Win32 kernel32
%prm
hFile, lpCreationTime, lpLastAccessTime, lpLastWriteTime
hFile : [intptr] ファイルまたはディレクトリへのハンドル。ハンドルは [CreateFile](/windows/win32/api/fileapi/nf-fileapi-createfilea) 関数を **FILE_WRITE_ATTRIBUTES** アクセス権で呼び出して作成している必要がある。詳細は [ファイルのセキュリティとアクセス権](/windows/win32/FileIO/file-security-and-access-rights) を参照。
lpCreationTime : [var] ファイルまたはディレクトリの新しい作成日時を含む [FILETIME](/windows/win32/api/minwinbase/ns-minwinbase-filetime) 構造体へのポインタ。アプリケーションがこの情報を変更する必要がない場合、このパラメータは `NULL` または **dwLowDateTime**/**dwHighDateTime** メンバを共に `0` にした **FILETIME** 構造体へのポインタに設定する。
lpLastAccessTime : [var] ファイルまたはディレクトリの新しい最終アクセス日時を含む [FILETIME](/windows/win32/api/minwinbase/ns-minwinbase-filetime) 構造体へのポインタ。最終アクセス時刻には、最後に書き込み・読み取り・(実行ファイルの場合は) 実行が行われた時刻が含まれる。アプリケーションがこの情報を変更する必要がない場合、このパラメータは `NULL` または **dwLowDateTime**/**dwHighDateTime** メンバを共に `0` にした **FILETIME** 構造体へのポインタに設定する。当該ハンドルを用いたファイル操作で最終アクセス時刻が変更されないようにするには、ファイルハンドルを開いた直後に **SetFileTime** を呼び出し、**dwLowDateTime**/**dwHighDateTime** メンバを共に `0xFFFFFFFF` にした [FILETIME](/windows/win32/api/minwinbase/ns-minwinbase-filetime) 構造体を渡す。
lpLastWriteTime : [var] ファイルまたはディレクトリの新しい最終更新日時を含む [FILETIME](/windows/win32/api/minwinbase/ns-minwinbase-filetime) 構造体へのポインタ。アプリケーションがこの情報を変更する必要がない場合、このパラメータは `NULL` または **dwLowDateTime**/**dwHighDateTime** メンバを共に `0` にした **FILETIME** 構造体へのポインタに設定する。当該ハンドルを用いたファイル操作で最終書き込み時刻が変更されないようにするには、ファイルハンドルを開いた直後に **SetFileTime** を呼び出し、**dwLowDateTime**/**dwHighDateTime** メンバを共に `0xFFFFFFFF` にした [FILETIME](/windows/win32/api/minwinbase/ns-minwinbase-filetime) 構造体を渡す。
%inst
指定したファイルまたはディレクトリの作成、最終アクセス、または最終更新の日時を設定する。

[戻り値]
関数が成功した場合、戻り値は非ゼロである。失敗した場合はゼロである。拡張エラー情報を取得するには
[GetLastError](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror)
を呼び出す。

[備考]
すべてのファイルシステムが作成時刻・最終アクセス時刻を記録できるわけではなく、記録方法も同じではない。例えば FAT
では作成時刻の分解能は 10 ミリ秒、書き込み時刻は 2 秒、アクセス時刻は 1 日 (実際にはアクセス日付) である。したがって
[GetFileTime](/windows/win32/api/fileapi/nf-fileapi-getfiletime) 関数は
**SetFileTime** で設定したのと同じファイル時刻情報を返さない場合がある。NTFS
はファイルの最終アクセス時刻の更新を最終アクセス時から最大 1 時間遅延させる。


%index
SetFileValidData
指定したファイルの有効データ長を設定する。この関数はごく限られた状況で有用である。詳細は備考を参照。
%group
Win32 kernel32
%prm
hFile, ValidDataLength
hFile : [intptr] ファイルへのハンドル。GENERIC_WRITE アクセス権で開かれ、SE_MANAGE_VOLUME_NAME 特権が有効になっている必要がある。詳細は「ファイルのセキュリティとアクセス権」を参照。注: ファイルはネットワークファイル、圧縮、スパース、トランザクションのいずれであってもならない。
ValidDataLength : [int64] 新しい有効データ長。現在の有効データ長より大きく、現在のファイルサイズより小さい正の値でなければならない。
%inst
指定したファイルの有効データ長を設定する。この関数はごく限られた状況で有用である。詳細は備考を参照。

[戻り値]
関数が成功した場合、戻り値は非ゼロである。失敗した場合は 0 である。拡張エラー情報を取得するには GetLastError を呼び出す。

[備考]
SetFileValidData 関数はファイルの論理的な終端を設定する。ファイルサイズを設定するには SetEndOfFile
関数を使う。物理ファイルサイズもファイル末尾と呼ばれる。各ファイルストリームには次のプロパティがある:
（以下省略）


%index
SetFirmwareEnvironmentVariableW
指定したファームウェア環境変数の値を設定する。(Unicode)
%group
Win32 kernel32
%prm
lpName, lpGuid, pValue, nSize
lpName : [wstr] ファームウェア環境変数の名前。ポインタは NULL であってはならない。
lpGuid : [wstr] ファームウェア環境変数の名前空間を表す GUID。GUID は "{xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx}" 形式の文字列でなければならない。システムが GUID ベースの名前空間をサポートしない場合は無視される。
pValue : [intptr] ファームウェア環境変数の新しい値へのポインタ。
nSize : [int] pBuffer バッファのサイズ (バイト単位)。このパラメータがゼロの場合、ファームウェア環境変数は削除される。
%inst
指定したファームウェア環境変数の値を設定する。(Unicode)

[戻り値]
関数が成功した場合、戻り値は非ゼロである。失敗した場合はゼロである。拡張エラー情報を取得するには GetLastError
を呼び出す。エラーコードには ERROR_INVALID_FUNCTION が含まれる可能性がある。

[備考]
Windows 10 バージョン 1803 以降、ユニバーサル Windows アプリは UEFI
ファームウェア変数の読み書きが可能である。詳細は「ユニバーサル Windows アプリからの UEFI
ファームウェア変数アクセス」を参照。Windows 10 バージョン 1803 以降、UEFI ファームウェア変数の読み取りは UMDF
ドライバからもサポートされる。UMDF
ドライバからの書き込みはサポートされない。ファームウェア環境変数を書き込むには、アプリを実行中のユーザーアカウントが
SE_SYSTEM_ENVIRONMENT_NAME 特権を持つ必要がある。ユニバーサル Windows
アプリは管理者アカウントから実行し、「ユニバーサル Windows アプリからの UEFI
ファームウェア変数アクセス」で概説される要件に従う必要がある。正確なファームウェア環境変数の集合は起動ファームウェアによって決まる。これらの環境変数の位置もファームウェアが指定する。例えば
UEFI ベースのシステムでは、NVRAM にシステム起動設定を指定するファームウェア環境変数が含まれる。UEFI 仕様・「UEFI と
Windows」を参照。ファームウェア変数はレガシー BIOS
ベースのシステムではサポートされない。SetFirmwareEnvironmentVariable 関数はレガシー BIOS
ベースのシステム、またはレガシー BIOS と UEFI の両方をサポートするシステムに Windows がレガシー BIOS
でインストールされている場合、常に失敗する。これらの条件を識別するには、lpName にダミーのファームウェア環境名 (例: 空文字列
"")、lpGuid にダミー GUID (例: "{00000000-0000-0000-0000-000000000000}")
を指定して関数を呼ぶ。レガシー BIOS ベースのシステム、またはレガシー BIOS で Windows
がインストールされている両対応システムでは ERROR_INVALID_FUNCTION で失敗する。UEFI ベースのシステムではダミー
GUID 名前空間が存在しないことを示すファームウェア固有のエラー (ERROR_NOACCESS など)
で失敗する。SetFirmwareEnvironmentVariable は
ExSetFirmwareEnvironmentVariable カーネルモードルーチンのユーザーモード相当である。
> [!NOTE] > winbase.h ヘッダは SetFirmwareEnvironmentVariable を、UNICODE
プリプロセッサ定数の定義に応じて ANSI 版または Unicode
版を自動選択するエイリアスとして定義する。エンコーディング中立なエイリアスと中立でないコードを混在させると、コンパイルエラーや実行時エラーを引き起こすことがある。詳細は
[関数プロトタイプの規約](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
SetFirmwareEnvironmentVariableExW
指定したファームウェア環境変数の値と、その変数がどのように保存・維持されるかを示す属性を設定する。
%group
Win32 kernel32
%prm
lpName, lpGuid, pValue, nSize, dwAttributes
lpName : [wstr] ファームウェア環境変数の名前。ポインタは NULL であってはならない。
lpGuid : [wstr] ファームウェア環境変数の名前空間を表す GUID。GUID は "{xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx}" 形式の文字列でなければならない。システムが GUID ベースの名前空間をサポートしない場合は無視される。ポインタは NULL であってはならない。
pValue : [intptr] ファームウェア環境変数の新しい値へのポインタ。
nSize : [int] pValue バッファのサイズ (バイト単位)。dwAttributes で VARIABLE_ATTRIBUTE_APPEND_WRITE、VARIABLE_ATTRIBUTE_AUTHENTICATED_WRITE_ACCESS、VARIABLE_ATTRIBUTE_TIME_BASED_AUTHENTICATED_WRITE_ACCESS のいずれかが設定されていない限り、この値をゼロに設定すると変数が削除される。
dwAttributes : [int] 変数に関連付ける UEFI 変数属性を設定するビットマスク。UEFI 仕様 2.3.1 セクション 7.2 も参照。
%inst
指定したファームウェア環境変数の値と、その変数がどのように保存・維持されるかを示す属性を設定する。

[戻り値]
関数が成功した場合、戻り値は非ゼロである。失敗した場合はゼロである。拡張エラー情報を取得するには GetLastError
を呼び出す。エラーコードには ERROR_INVALID_FUNCTION が含まれる可能性がある。

[備考]
Windows 10 バージョン 1803 以降、ユニバーサル Windows アプリは UEFI
ファームウェア変数の読み書きが可能である。詳細は「ユニバーサル Windows アプリからの UEFI
ファームウェア変数アクセス」を参照。Windows 10 バージョン 1803 以降、UEFI ファームウェア変数の読み取りは
User-Mode Driver Framework (UMDF) ドライバからもサポートされる。UMDF
ドライバからの書き込みはサポートされない。ファームウェア環境変数を書き込むには、アプリを実行中のユーザーアカウントが
SE_SYSTEM_ENVIRONMENT_NAME 特権を持つ必要がある。ユニバーサル Windows
アプリは管理者アカウントから実行し、「ユニバーサル Windows アプリからの UEFI
ファームウェア変数アクセス」で概説される要件に従う必要がある。変数の属性を変更する正しい方法は、その変数を削除してから異なる属性で再作成することである。正確なファームウェア環境変数の集合は起動ファームウェアによって決まる。これらの環境変数の位置もファームウェアが指定する。例えば
UEFI ベースのシステムでは、NVRAM にシステム起動設定を指定するファームウェア環境変数が含まれる。使用される特定変数については
UEFI 仕様を参照。UEFI と Windows に関する詳細は「UEFI と Windows」を参照。ファームウェア変数はレガシー
BIOS ベースのシステムではサポートされない。SetFirmwareEnvironmentVariableEx 関数はレガシー BIOS
ベースのシステム、またはレガシー BIOS と UEFI の両方をサポートするシステムに Windows がレガシー BIOS
でインストールされている場合、常に失敗する。これらの条件を識別するには、lpName にダミーのファームウェア環境名 (例: 空文字列
"")、lpGuid にダミー GUID (例: "{00000000-0000-0000-0000-000000000000}")
を指定して関数を呼ぶ。レガシー BIOS ベースのシステム、またはレガシー BIOS で Windows
がインストールされている両対応システムでは、関数は ERROR_INVALID_FUNCTION で失敗する。UEFI
ベースのシステムでは、ダミー GUID 名前空間が存在しないことを示すファームウェア固有のエラー (ERROR_NOACCESS など)
で失敗する。
> [!NOTE] > winbase.h ヘッダは SetFirmwareEnvironmentVariableEx を、UNICODE
プリプロセッサ定数の定義に応じて ANSI 版または Unicode
版を自動選択するエイリアスとして定義する。エンコーディング中立なエイリアスと中立でないコードを混在させると、コンパイルエラーや実行時エラーを引き起こすことがある。詳細は
[関数プロトタイプの規約](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
SetHandleCount
SetHandleCount 関数はプロセスが利用可能なファイルハンドル数を変更する。
%group
Win32 kernel32
%prm
uNumber
uNumber : [int] 要求する利用可能ファイルハンドル数。
%inst
SetHandleCount 関数はプロセスが利用可能なファイルハンドル数を変更する。

[戻り値]
利用可能なファイルハンドル数。


%index
SetHandleInformation
オブジェクトハンドルの特定のプロパティを設定する。
%group
Win32 kernel32
%prm
hObject, dwMask, dwFlags
hObject : [intptr] 情報を設定する対象オブジェクトへのハンドル。
dwMask : [int] 変更するビットフラグを指定するマスク。dwFlags の説明と同じ定数を使用する。
dwFlags : [int] 
%inst
オブジェクトハンドルの特定のプロパティを設定する。

[戻り値]
関数が成功した場合、戻り値は非ゼロである。失敗した場合はゼロである。拡張エラー情報を取得するには GetLastError を呼び出す。

[備考]
dwFlags 内の関連ビットフラグを設定または解除するには、dwMask 内の対応する変更マスクビットフラグを設定する必要がある。


%index
SetInformationJobObject
ジョブオブジェクトの制限を設定する。
%group
Win32 kernel32
%prm
hJob, JobObjectInformationClass, lpJobObjectInformation, cbJobObjectInformationLength
hJob : [intptr] 制限を設定するジョブへのハンドル。CreateJobObject または OpenJobObject 関数がこのハンドルを返す。ハンドルには JOB_OBJECT_SET_ATTRIBUTES アクセス権が必要である。詳細は「ジョブオブジェクトのセキュリティとアクセス権」を参照。
JobObjectInformationClass : [int] 
lpJobObjectInformation : [intptr] ジョブに設定する制限またはジョブ状態。このデータの形式は JobObjectInfoClass の値に依存する。
cbJobObjectInformationLength : [int] 設定するジョブ情報のサイズ (バイト単位)。
%inst
ジョブオブジェクトの制限を設定する。

[戻り値]
関数が成功した場合、戻り値は非ゼロである。失敗した場合はゼロである。拡張エラー情報を取得するには GetLastError を呼び出す。

[備考]
SetInformationJobObject 関数を使用すると一度の呼び出しで複数の制限を設定できる。1
つずつ設定したり一部だけを変更する場合は、QueryInformationJobObject
で現在の制限を取得してから修正し、SetInformationJobObject
を呼び出す。セキュリティ制限はジョブオブジェクト自体ではなく、ジョブに関連付けられた各プロセスに対して個別に設定する必要がある。詳細は「プロセスのセキュリティとアクセス権」を参照。Windows
Server 2003 および Windows XP: ジョブオブジェクトのセキュリティ制限を設定するには
SetInformationJobObject
を使用する。この関数を使用するアプリケーションをコンパイルするには、_WIN32_WINNT を 0x0500
以降に定義する。詳細は「Windows ヘッダの使用」を参照。


%index
SetIoRateControlInformationJobObject
ジョブオブジェクトに I/O 制限を設定する。
%group
Win32 kernel32
%prm
hJob, IoRateControlInfo
hJob : [intptr] I/O 制限を設定するジョブへのハンドル。CreateJobObject または OpenJobObject から取得する。ハンドルには JOB_OBJECT_SET_ATTRIBUTES アクセス権が必要である。アクセス権の詳細は「ジョブオブジェクトのセキュリティとアクセス権」を参照。
IoRateControlInfo : [var] ジョブに設定する I/O 制限を指定する JOBOBJECT_IO_RATE_CONTROL_INFORMATION 構造体へのポインタ。
%inst
ジョブオブジェクトに I/O 制限を設定する。

[戻り値]
関数が成功した場合、戻り値は非ゼロである。失敗した場合はゼロである。拡張エラー情報を取得するには GetLastError を呼び出す。

[備考]
重要: Windows 10 バージョン 1607 以降、この関数はサポートされない。


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
SetLocaleInfoW
現在のロケールのユーザーオーバーライド部分の情報項目を設定する。この関数はシステム既定を設定しない。(Unicode)
%group
Win32 kernel32
%prm
Locale, LCType, lpLCData
Locale : [int] ANSI 版では lpLCData 情報を解釈する際に用いるコードページを持つロケールのロケール識別子。Unicode 版では無視される。MAKELCID マクロでロケール識別子を作成するか、以下の定義済み値を使用できる。
LCType : [int] 設定するロケール情報の種類。有効な定数は「ロケール情報定数」の「GetLocaleInfo、GetLocaleInfoEx、SetLocaleInfo の LCType パラメータで使用される定数」セクションを参照。アプリケーションは呼び出しごとに 1 つの値のみ指定できるが、LOCALE_USE_CP_ACP を他の定数と OR 演算で組み合わせることはできる。
lpLCData : [wstr] 設定するロケール情報を含む null 終端文字列へのポインタ。情報は指定した定数固有の形式でなければならない。アプリケーションは Unicode 版では Unicode 文字列を、ANSI 版では ANSI 文字列を使用する。
%inst
現在のロケールのユーザーオーバーライド部分の情報項目を設定する。この関数はシステム既定を設定しない。(Unicode)

[戻り値]
成功した場合は非ゼロ、そうでない場合は 0 を返す。拡張エラー情報を取得するには GetLastError
を呼び出す。次のいずれかのエラーコードが返される可能性がある:
（以下省略）

[備考]

この関数はレジストリに書き込みを行い、特定のアプリケーションではなく特定のユーザーに関連付けられる値を設定する。これらのレジストリ値はそのユーザーが実行する他のアプリケーションの動作にも影響する。原則として、アプリケーションはユーザーが明示的に変更を要求した場合にのみこの関数を呼び出すべきであり、単一アプリケーションの利便性のためにレジストリ設定を変更してはならない。LCType
パラメータでは、ロケールコードページの代わりに OS の ANSI コードページを文字列変換に使うように
LOCALE_USE_CP_ACP を設定できる。ANSI 版を Unicode 専用ロケール識別子で呼び出した場合、OS
がシステムコードページを使うため関数は成功することがあるが、システムコードページで未定義の文字は文字列中でクエスチョンマーク (?)
として現れる。Windows Vista 以降、LOCALE_SDATE と LOCALE_STIME
定数は廃止されている。これらは使用せず、代わりに LOCALE_SSHORTDATE と LOCALE_STIMEFORMAT
を使用する。カスタムロケールでは日付や時刻の書式内で単一の一様なセパレータ文字を持たない場合がある。例えば "12/31, 2006" や
"03:56'23" のような書式も有効となりうる。
> [!NOTE] > winnls.h ヘッダは SetLocaleInfo を、UNICODE プリプロセッサ定数の定義に応じて
ANSI 版または Unicode
版を自動選択するエイリアスとして定義する。エンコーディング中立なエイリアスと中立でないコードを混在させると、コンパイルエラーや実行時エラーを引き起こすことがある。詳細は
[関数プロトタイプの規約](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
SetMailslotInfo
指定したメールスロットが読み取り操作で使用するタイムアウト値を設定する。
%group
Win32 kernel32
%prm
hMailslot, lReadTimeout
hMailslot : [intptr] メールスロットへのハンドル。このハンドルは CreateMailslot 関数で作成されている必要がある。
lReadTimeout : [int] メールスロットにメッセージが書き込まれるまで読み取り操作が待機できる時間 (ミリ秒)。タイムアウト値にはいくつかの特別な意味を持つ値がある。
%inst
指定したメールスロットが読み取り操作で使用するタイムアウト値を設定する。

[戻り値]
関数が成功した場合、戻り値は非ゼロである。失敗した場合はゼロである。拡張エラー情報を取得するには GetLastError を呼び出す。

[備考]
メールスロットが読み取り操作で使用する初期タイムアウト値は通常、メールスロット作成時に CreateMailslot によって設定される。


%index
SetMessageWaitingIndicator
(no summary)
%group
Win32 kernel32
%prm
hMsgIndicator, ulMsgCount
hMsgIndicator : [intptr] 
ulMsgCount : [int] 
%inst



%index
SetNamedPipeHandleState
指定した名前付きパイプの読み取りモードとブロッキングモードを設定する。指定ハンドルが名前付きパイプのクライアント端で、かつサーバープロセスがリモートコンピュータ上にある場合、この関数でローカルバッファリングも制御できる。
%group
Win32 kernel32
%prm
hNamedPipe, lpMode, lpMaxCollectionCount, lpCollectDataTimeout
hNamedPipe : [intptr] 名前付きパイプインスタンスへのハンドル。このパラメータには CreateNamedPipe が返すサーバー端のハンドル、または CreateFileW が返すクライアント端のハンドルを指定できる。書き込み専用や読み書きパイプでは名前付きパイプに GENERIC_WRITE アクセス権、読み取り専用パイプでは GENERIC_READ と FILE_WRITE_ATTRIBUTES アクセス権が必要である。
lpMode : [var] 新しいパイプモード。モードは読み取りモードフラグと待機モードフラグの組み合わせである。モードを設定しない場合は NULL を指定できる。次のいずれかのモードを指定する。
lpMaxCollectionCount : [var] サーバーへ送信する前にクライアントコンピュータで収集する最大バイト数。指定したパイプハンドルが名前付きパイプのサーバー端である場合、またはクライアントとサーバープロセスが同一マシン上にある場合は NULL でなければならない。ハンドル作成時にクライアントプロセスが CreateFileW で FILE_FLAG_WRITE_THROUGH を指定した場合、このパラメータは無視される。収集カウントを設定しない場合は NULL を指定できる。
lpCollectDataTimeout : [var] リモート名前付きパイプがネットワーク経由で情報を転送するまでの最大時間 (ミリ秒)。指定したパイプハンドルがサーバー端である場合、またはクライアントとサーバープロセスが同一コンピュータ上にある場合は NULL でなければならない。ハンドル作成時にクライアントプロセスが CreateFileW で FILE_FLAG_WRITE_THROUGH を指定した場合、このパラメータは無視される。収集カウントを設定しない場合は NULL を指定できる。
%inst

指定した名前付きパイプの読み取りモードとブロッキングモードを設定する。指定ハンドルが名前付きパイプのクライアント端で、かつサーバープロセスがリモートコンピュータ上にある場合、この関数でローカルバッファリングも制御できる。

[戻り値]
関数が成功した場合、戻り値は非ゼロである。失敗した場合はゼロである。拡張エラー情報を取得するには GetLastError を呼び出す。

[備考]
Windows 10 バージョン 1709: パイプは同一アプリに属する UWP プロセス間 (アプリコンテナ内)
でのみサポートされる。また名前付きパイプは `\\.\pipe\LOCAL\` という構文をパイプ名に用いる必要がある。


%index
SetPriorityClass
指定したプロセスの優先度クラスを設定する。この値とプロセス内各スレッドの優先度値が各スレッドの基本優先度レベルを決定する。
%group
Win32 kernel32
%prm
hProcess, dwPriorityClass
hProcess : [intptr] プロセスへのハンドル。
dwPriorityClass : [int] 
%inst
指定したプロセスの優先度クラスを設定する。この値とプロセス内各スレッドの優先度値が各スレッドの基本優先度レベルを決定する。

[戻り値]
関数が成功した場合、戻り値は非ゼロである。失敗した場合はゼロである。拡張エラー情報を取得するには GetLastError を呼び出す。

[備考]

各スレッドには、スレッドの優先度値とそのプロセスの優先度クラスから決まる基本優先度レベルがある。システムはすべての実行可能スレッドの基本優先度レベルを使って、次にどのスレッドに
CPU 時間を割り当てるかを決める。SetThreadPriority
関数はプロセスの優先度クラスに対する相対的なスレッドの基本優先度レベル設定を可能にする。詳細は「スケジューリング優先度」を参照。*_PRIORITY_CLASS
値はプロセスの CPU スケジューリング優先度に影響する。ファイル I/O、ネットワーク
I/O、データ処理などのバックグラウンド作業を行うプロセスでは、CPU スケジューリング優先度を下げるだけでは不十分であり、アイドル
CPU 優先度のプロセスでもディスクやメモリを使えばシステム応答性を簡単に妨げうる。バックグラウンド作業を行うプロセスは
PROCESS_MODE_BACKGROUND_BEGIN/PROCESS_MODE_BACKGROUND_END
を使ってリソーススケジューリング優先度を調整すべきで、ユーザーとやり取りするプロセスでは
PROCESS_MODE_BACKGROUND_BEGIN
を使うべきでない。プロセスがバックグラウンド処理モードにある間に作成される新しいスレッドもバックグラウンド処理モードとなる。バックグラウンド処理モードのスレッドは、他スレッドとクリティカルセクション、ヒープ、ハンドルなどのリソース共有を最小限にすべきで、さもなくば優先度反転が起こりうる。高優先度で実行中のスレッドがいる場合、バックグラウンド処理モードのスレッドはすぐにはスケジュールされないかもしれないが、飢餓状態にはならない。各スレッドは
SetThreadPriority を使って個別にバックグラウンド処理モードに入れる。プロセス内のスレッドが
SetThreadPriority でバックグラウンド処理モードに入った後に SetPriorityClass
でバックグラウンド処理モードに入れてはならない。プロセスがバックグラウンド処理モードを終えるとプロセス内の全スレッドがリセットされるが、プロセスはどのスレッドがすでにバックグラウンド処理モードであったかを知ることはできない。


%index
SetProcessAffinityMask
指定したプロセスのスレッドに対するプロセッサアフィニティマスクを設定する。
%group
Win32 kernel32
%prm
hProcess, dwProcessAffinityMask
hProcess : [intptr] アフィニティマスクを設定するプロセスへのハンドル。このハンドルには PROCESS_SET_INFORMATION アクセス権が必要である。詳細は「プロセスのセキュリティとアクセス権」を参照。
dwProcessAffinityMask : [int] プロセスのスレッド用のアフィニティマスク。64 個を超えるプロセッサを持つシステムでは、アフィニティマスクは単一プロセッサグループ内のプロセッサを指定しなければならない。
%inst
指定したプロセスのスレッドに対するプロセッサアフィニティマスクを設定する。

[戻り値]
関数が成功した場合、戻り値は非ゼロである。失敗した場合はゼロである。拡張エラー情報を取得するには GetLastError
を呼び出す。システムに構成されていないプロセッサを要求した場合、最終エラーコードは ERROR_INVALID_PARAMETER
となる。64 個を超えるプロセッサを持つシステムで、呼び出し側プロセスが複数のプロセッサグループにスレッドを持つ場合も最終エラーコードは
ERROR_INVALID_PARAMETER となる。

[備考]

プロセスアフィニティマスクは、プロセスのスレッドが実行を許可される論理プロセッサを各ビットで表すビットベクタである。プロセスアフィニティマスクの値は
GetProcessAffinityMask
関数で取得されるシステムアフィニティマスク値の部分集合でなければならない。プロセスはシステムに構成されたプロセッサ上でのみ実行可能なので、システムアフィニティマスクで
0 のビットを 1
に指定することはできない。プロセスアフィニティは子プロセスまたは新しくインスタンス化されたローカルプロセスに継承される。自分以外のプロセスから呼ばれる可能性のある
DLL 内で SetProcessAffinityMask を呼ぶべきではない。64
個を超えるプロセッサを持つシステムでは、SetProcessAffinityMask
は単一プロセッサグループ内のスレッドを持つプロセスに対してのみ使用できる。複数グループ内の個別スレッドのアフィニティマスクを設定するには
SetThreadAffinityMask を使用する。これは事実上プロセスのグループ割当を変更する。Windows 11 /
Windows Server 2022 以降、64
個を超えるプロセッサを持つシステムでは、プロセスとスレッドのアフィニティは既定で全プロセッサグループのすべてのプロセッサにまたがる。呼び出し側プロセスが複数のプロセッサグループにスレッドを持つ場合でも常に失敗するのではなく、プロセスが
1 つ以上のスレッドのアフィニティをプロセスの主グループ外に明示的に設定している場合に SetProcessAffinityMask
は失敗 (ゼロを返し最終エラーコード ERROR_INVALID_PARAMETER) する。


%index
SetProcessAffinityUpdateMode
指定したプロセスのアフィニティ更新モードを設定する。
%group
Win32 kernel32
%prm
hProcess, dwFlags
hProcess : [intptr] プロセスへのハンドル。このハンドルは GetCurrentProcess 関数で返されたものでなければならない。
dwFlags : [int] 
%inst
指定したプロセスのアフィニティ更新モードを設定する。

[戻り値]
関数が成功した場合、戻り値は非ゼロである。失敗した場合はゼロである。拡張エラー情報を取得するには GetLastError を呼び出す。

[備考]

システムはプロセッサが動的に追加された場合など、さまざまな条件下でプロセスアフィニティを調整することがある。既定では、プロセスアフィニティの動的更新は各プロセスで無効である。プロセスは、システムによるアフィニティの動的調整を扱えるかどうかをこの関数で示すべきである。プロセスがアフィニティ更新モードを有効にしたあと、この関数で無効にすることもできる。しかし一度無効にした後に再度有効にすることはできない。子プロセスは親プロセスのアフィニティ更新モードを継承しない。各子プロセスに対して明示的に設定する必要がある。この関数を使用するアプリケーションをコンパイルするには、_WIN32_WINNT
を 0x0600 以降に定義する。詳細は「Windows ヘッダの使用」を参照。


%index
SetProcessDEPPolicy
32 ビットプロセスに対するデータ実行防止 (DEP) および DEP-ATL サンク エミュレーション設定を変更する。
%group
Win32 kernel32
%prm
dwFlags
dwFlags : [int] 
%inst
32 ビットプロセスに対するデータ実行防止 (DEP) および DEP-ATL サンク エミュレーション設定を変更する。

[戻り値]
関数が成功した場合は TRUE を返す。失敗した場合は FALSE を返す。この関数に定義されたエラー値を取得するには
GetLastError を呼び出す。

[備考]
SetProcessDEPPolicy 関数は、プロセス生成時に DEP ポリシーが指定されていない限り、現在のプロセスのシステム DEP
ポリシーを上書きする。システム DEP ポリシー設定は OptIn または OptOut でなければならない。AlwaysOff または
AlwaysOn の場合、SetProcessDEPPolicy はエラーを返す。プロセスに DEP が有効化された後、以降の
SetProcessDEPPolicy
呼び出しは無視される。PROC_THREAD_ATTRIBUTE_MITIGATION_POLICY 属性でプロセス生成時に指定された
DEP ポリシーは、プロセスの存続中変更できない。この場合、SetProcessDEPPolicy は
ERROR_ACCESS_DENIED で失敗する。SetProcessDEPPolicy は 32
ビットプロセスでのみサポートされる。64 ビットプロセスで呼び出すと ERROR_NOT_SUPPORTED で失敗する。ATL 7.1
以前で書かれたアプリケーションは非実行としてマークされたページ上でコードを実行しようとすることがあり、これは NX
フォルトを引き起こしアプリケーションを終了させる。DEP-ATL サンク エミュレーションにより、そうでなければ NX
フォルトを起こすアプリケーションが DEP 有効で実行できる。ATL バージョンについては「ATL/MFC
バージョン番号」を参照。DEP-ATL サンク エミュレーションが有効な場合、システムは NX
フォルトを傍受し命令をエミュレート、例外を処理してアプリケーションが実行を続けられるようにする。PROCESS_DEP_DISABLE_ATL_THUNK_EMULATION
を設定して DEP-ATL サンク エミュレーションを無効にした場合、NX フォルトは傍受されず、これは DEP
互換性テストに有用である。次の表はシステム DEP ポリシー、DEP-ATL サンク
エミュレーション、SetProcessDEPPolicy の相互作用をまとめたものである。システム DEP ポリシー設定を取得するには
GetSystemDEPPolicy を使用する。
（以下省略）


%index
SetProcessInformation
指定したプロセスに対する情報を設定する。
%group
Win32 kernel32
%prm
hProcess, ProcessInformationClass, ProcessInformation, ProcessInformationSize
hProcess : [intptr] プロセスへのハンドル。このハンドルには PROCESS_SET_INFORMATION アクセス権が必要である。詳細は「プロセスのセキュリティとアクセス権」を参照。
ProcessInformationClass : [int] 設定する情報の種類を指定する [PROCESS_INFORMATION_CLASS](./ne-processthreadsapi-process_information_class.md) 列挙のメンバ。
ProcessInformation : [intptr] ProcessInformationClass パラメータで指定した情報の種類を含むオブジェクトへのポインタ。ProcessInformationClass が ProcessMemoryPriority の場合は MEMORY_PRIORITY_INFORMATION 構造体を指さなければならない。ProcessPowerThrottling の場合は PROCESS_POWER_THROTTLING_STATE 構造体を、ProcessLeapSecondInfo の場合は PROCESS_LEAP_SECOND_INFO 構造体を指さなければならない。
ProcessInformationSize : [int] ProcessInformation パラメータが指す構造体のサイズ (バイト単位)。ProcessInformationClass が ProcessMemoryPriority の場合は sizeof(MEMORY_PRIORITY_INFORMATION)、ProcessPowerThrottling の場合は sizeof(PROCESS_POWER_THROTTLING_STATE)、ProcessLeapSecondInfo の場合は sizeof(PROCESS_LEAP_SECOND_INFO) でなければならない。
%inst
指定したプロセスに対する情報を設定する。

[戻り値]
関数が成功した場合、戻り値は非ゼロである。失敗した場合はゼロである。拡張エラー情報を取得するには GetLastError を呼び出す。

[備考]

システム性能向上のため、アプリケーションはバックグラウンド操作や、近い将来再アクセスされる見込みのないファイル・データにアクセスするスレッドの既定のメモリ優先度を下げる目的で、SetProcessInformation
関数と ProcessMemoryPriority
を使用すべきである。例えばファイルインデックス作成アプリケーションは、インデックス作成タスクを行うプロセスに低い既定優先度を設定することができる。**メモリ優先度**
はページがプロセスのワーキングセット内にトリムされるまでの時間を決めるのに役立つ。プロセスのメモリ優先度はそのスレッドがワーキングセットに追加する物理ページの既定優先度を決定する。メモリマネージャがワーキングセットをトリムする際は高優先度ページより低優先度ページが先にトリムされる。これによりシステム全体の性能が改善される。**ProcessPowerThrottling**
はプロセスにスロットリングポリシーを有効化し、最適性能が不要な場面で性能と電力効率のバランスを取るのに使える。プロセスが
PROCESS_POWER_THROTTLING_EXECUTION_SPEED を有効化すると、そのプロセスは EcoQoS
に分類される。システムは CPU 周波数の低減やより電力効率の良いコアの使用などの戦略で電力効率を高めようとする。EcoQoS
は作業がフォアグラウンド
ユーザー体験に寄与しない場合に使用すべきで、バッテリ持続時間の延長、発熱およびファンノイズ低減をもたらす。性能クリティカルまたはフォアグラウンドユーザー体験には
EcoQoS を使用すべきでない (Windows 11 より前は EcoQoS レベルは存在せず、プロセスは LowQoS
とラベル付けされていた)。アプリケーションが PROCESS_POWER_THROTTLING_EXECUTION_SPEED
を明示的に有効化しない場合、システムは独自ヒューリスティックにより QoS レベルを自動推定する。詳細は「Quality of
Service」を参照。プロセスが PROCESS_POWER_THROTTLING_IGNORE_TIMER_RESOLUTION
を有効化すると、そのプロセスが行った現在のタイマー分解能要求は無視される。プロセスに属するタイマーはもはや高いタイマー分解能で満期を迎える保証がなくなり、電力効率が向上しうる。PROCESS_POWER_THROTTLING_IGNORE_TIMER_RESOLUTION
を明示的に無効化すると、システムはプロセスによる過去のタイマー分解能要求を記憶して尊重する。Windows 11
では既定で、ウィンドウ所有プロセスが完全に隠蔽・最小化・エンドユーザーから不可視となり、かつ音声を出さない場合、Windows
はタイマー分解能要求を自動的に無視することがあり、既定のシステム分解能より高い分解能を保証しない。


%index
SetProcessPreferredUILanguages
アプリケーションプロセスの優先 UI 言語を設定する。詳細は「ユーザーインターフェイス言語管理」を参照。
%group
Win32 kernel32
%prm
dwFlags, pwszLanguagesBuffer, pulNumLanguages
dwFlags : [int] プロセスの優先 UI 言語に使用する言語形式を識別するフラグ。フラグは排他的で、既定は MUI_LANGUAGE_NAME である。MUI_LANGUAGE_ID ではなく MUI_LANGUAGE_NAME の使用が推奨される。
pwszLanguagesBuffer : [int] 順序付けられ、null 区切りで優先度の高い順に並んだリストを含むダブル null 終端のマルチ文字列バッファへのポインタ。バッファに 5 言語以上ある場合、関数は最初の 5 つの有効言語のみを設定する。言語リストが不要な場合はこのパラメータに NULL を指定でき、その場合関数はプロセスの優先 UI 言語をクリアする。
pulNumLanguages : [var] 入力バッファからプロセス言語リストに設定された言語数 (最大 5) へのポインタ。
%inst
アプリケーションプロセスの優先 UI 言語を設定する。詳細は「ユーザーインターフェイス言語管理」を参照。

[戻り値]
成功した場合は TRUE、それ以外は FALSE を返す。拡張エラー情報を取得するには GetLastError
を呼び出す。次のエラーコードが返されることがある:
（以下省略）

[備考]
理想的には、アプリケーションは起動後できるだけ早く SetProcessPreferredUILanguages
を呼び出す。この関数が戻った後、アプリケーションは GetProcessPreferredUILanguages
を呼び出して結果の言語リストを検証・確認できる。MUI_LANGUAGE_ID 指定時は、入力パラメータの言語文字列は先頭の 0x
を含まない 4 文字の 16 進言語識別子を使わなければならない。例えば en-US は "0409"、en は "0009"
として渡す。注: MUI_LANGUAGE_ID より MUI_LANGUAGE_NAME の使用を推奨する。C# シグネチャ
（以下省略）


%index
SetProcessPriorityBoost
指定したプロセスのスレッドの優先度をシステムが一時的にブーストする機能を無効化または有効化する。
%group
Win32 kernel32
%prm
hProcess, bDisablePriorityBoost
hProcess : [intptr] プロセスへのハンドル。このハンドルには PROCESS_SET_INFORMATION アクセス権が必要である。詳細は「プロセスのセキュリティとアクセス権」を参照。
bDisablePriorityBoost : [int] このパラメータが TRUE の場合、動的ブーストは無効になる。FALSE の場合は有効になる。
%inst
指定したプロセスのスレッドの優先度をシステムが一時的にブーストする機能を無効化または有効化する。

[戻り値]
関数が成功した場合、戻り値は非ゼロである。失敗した場合はゼロである。拡張エラー情報を取得するには GetLastError を呼び出す。

[備考]

スレッドが動的優先度クラスで実行されている場合、システムは待機状態から戻ったときにスレッドの優先度を一時的にブーストする。SetProcessPriorityBoost
を DisablePriorityBoost に TRUE
を指定して呼び出すと、そのプロセスのスレッドの優先度はブーストされない。この設定は既存の全スレッドおよびそれ以降にプロセスが作成する全スレッドに影響する。通常の動作に戻すには
DisablePriorityBoost を FALSE にして SetProcessPriorityBoost を呼び出す。


%index
SetProcessShutdownParameters
現在の呼び出し側プロセスのシャットダウンパラメータを設定する。この関数はシステム内の他プロセスに対するプロセスのシャットダウン順序を設定する。
%group
Win32 kernel32
%prm
dwLevel, dwFlags
dwLevel : [int] システム内の他プロセスに対するプロセスのシャットダウン優先度。システムは dwLevel の値が高いプロセスから低いプロセスへと順に終了させる。最高および最低のシャットダウン優先度はシステムコンポーネント用に予約されている。このパラメータは次の範囲の値でなければならない。
dwFlags : [int] このパラメータには次の値を指定できる。
%inst

現在の呼び出し側プロセスのシャットダウンパラメータを設定する。この関数はシステム内の他プロセスに対するプロセスのシャットダウン順序を設定する。

[戻り値]
関数が成功した場合、戻り値は非ゼロである。失敗した場合はゼロである。拡張エラー情報を取得するには GetLastError を呼び出す。

[備考]
システムセキュリティコンテキストで実行されているアプリケーションは OS によってシャットダウンされない。それらは
SetConsoleCtrlHandler 経由で設定できるコールバック関数を通じてシャットダウンやログオフの通知を受ける。通知は
dwLevel パラメータで指定された順序で行われる。


%index
SetProcessWorkingSetSize
指定したプロセスの最小および最大ワーキングセットサイズを設定する。(SetProcessWorkingSetSize)
%group
Win32 kernel32
%prm
hProcess, dwMinimumWorkingSetSize, dwMaximumWorkingSetSize
hProcess : [intptr] ワーキングセットサイズを設定するプロセスへのハンドル。
dwMinimumWorkingSetSize : [int] プロセスの最小ワーキングセットサイズ (バイト単位)。仮想メモリマネージャはプロセスがアクティブな時にこのサイズ以上を常駐させようとする。このパラメータはゼロより大きく、最大ワーキングセットサイズ以下でなければならない。既定サイズは 50 ページ (例: 4K ページサイズで 204,800 バイト) である。値がゼロより大きいが 20 ページ未満の場合、最小値は 20 ページに設定される。dwMinimumWorkingSetSize と dwMaximumWorkingSetSize の両方に (SIZE_T)-1 を指定すると、関数は指定プロセスのワーキングセットから可能な限りのページを削除する。
dwMaximumWorkingSetSize : [int] プロセスの最大ワーキングセットサイズ (バイト単位)。仮想メモリマネージャはプロセスがアクティブで空きメモリが少ない時にこのサイズ以上をプロセスに常駐させないよう試みる。
%inst
指定したプロセスの最小および最大ワーキングセットサイズを設定する。(SetProcessWorkingSetSize)

[戻り値]
関数が成功した場合、戻り値は非ゼロである。失敗した場合はゼロである。拡張エラー情報を取得するには GetLastError を呼び出す。

[備考]

プロセスのワーキングセットは、プロセスの仮想アドレス空間内のメモリページのうち現在物理メモリに常駐しているものの集合である。これらのページはページフォルトを起こさずにアプリケーションが使用できる。ページフォルトの詳細は「ワーキングセット」を参照。最小・最大ワーキングセットサイズはプロセスの仮想メモリページング挙動に影響する。指定プロセスのワーキングセットは、最小・最大両方に
(SIZE_T)-1 を指定することで空にできる。これはワーキングセットから可能な限りのページを削除する。同じ目的に
EmptyWorkingSet 関数も使用できる。dwMinimumWorkingSetSize または
dwMaximumWorkingSetSize がプロセスの現在のワーキングセットサイズより大きい場合、指定プロセスは
SE_INC_WORKING_SET_NAME
特権を持つ必要がある。一般にすべてのユーザーがこの特権を持つ。セキュリティ特権の詳細は「特権」を参照。Windows Server
2003 および Windows XP: 指定プロセスは SE_INC_BASE_PRIORITY_NAME
特権を持つ必要がある。Administrators と Power Users グループのユーザーは通常この特権を持つ。OS
はワーキングセットサイズを先着順に割り当てる。例えばあるアプリケーションが 64 MB システムで 40 MB
を最小ワーキングセットサイズに設定するのに成功した場合、次のアプリケーションが 40 MB を要求すると OS
は拒否する。SetProcessWorkingSetSize
関数でアプリケーションの最小・最大ワーキングセットサイズを設定しても、要求されたメモリが予約される、あるいは常に常駐する保証はない。アプリケーションがアイドル状態になるか、低メモリ状況で需要があると、OS
はアプリケーションのワーキングセットを減らすことがある。アプリケーションは VirtualLock
で仮想アドレス空間の範囲をメモリ内にロックできるが、これによりシステム性能を劣化させうる。アプリケーションのワーキングセットサイズを増やすと、システムの他の部分から物理メモリを奪うことになる。これにより他のアプリケーションやシステム全体の性能を劣化させ、物理メモリを必要とする操作
(例: プロセス、スレッド、カーネルプールの作成) の失敗を招く可能性もある。したがって
**SetProcessWorkingSetSize**
は慎重に使用すべきで、アプリケーション設計時には常にシステム全体の性能を考慮すべきである。


%index
SetProcessWorkingSetSizeEx
指定したプロセスのワーキングセットの最小サイズと最大サイズを設定する。(SetProcessWorkingSetSizeEx)
%group
Win32 kernel32
%prm
hProcess, dwMinimumWorkingSetSize, dwMaximumWorkingSetSize, Flags
hProcess : [intptr] ワーキングセットサイズを設定するプロセスへのハンドル。ハンドルには PROCESS_SET_QUOTA アクセス権が必要である。詳細は「プロセスのセキュリティとアクセス権」を参照。
dwMinimumWorkingSetSize : [int] プロセスの最小ワーキングセットサイズ (バイト単位)。仮想メモリマネージャはプロセスがアクティブな時にこのサイズ以上を常駐させようとする。このパラメータはゼロより大きく、最大ワーキングセットサイズ以下でなければならない。既定サイズは 50 ページ (例: 4K ページサイズで 204,800 バイト) である。値がゼロより大きいが 20 ページ未満の場合、最小値は 20 ページに設定される。dwMinimumWorkingSetSize と dwMaximumWorkingSetSize の両方に (SIZE_T)-1 を指定すると、関数は指定プロセスのワーキングセットから可能な限りのページを削除する。
dwMaximumWorkingSetSize : [int] プロセスの最大ワーキングセットサイズ (バイト単位)。仮想メモリマネージャはプロセスがアクティブで空きメモリが少ない時にこのサイズ以上をプロセスに常駐させないよう試みる。このパラメータは 13 ページ以上 (例: 4K ページサイズで 53,248) で、システム全体の最大値 (利用可能ページ数 - 512 ページ) 未満でなければならない。既定サイズは 345 ページ (例: 4K ページサイズで 1,413,120 バイト) である。dwMinimumWorkingSetSize と dwMaximumWorkingSetSize の両方に (SIZE_T)-1 を指定すると、関数は指定プロセスのワーキングセットから可能な限りのページを削除する。詳細は備考を参照。
Flags : [int] 最小および最大ワーキングセットサイズの強制を制御するフラグ。
%inst
指定したプロセスのワーキングセットの最小サイズと最大サイズを設定する。(SetProcessWorkingSetSizeEx)

[戻り値]
関数が成功した場合、戻り値は 0 以外。関数が失敗した場合、戻り値は 0。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]

プロセスのワーキングセットは、プロセスの仮想アドレス空間内のメモリページのうち現在物理メモリに常駐しているものの集合である。これらのページはページフォルトを起こさずにアプリケーションが使用できる。ページフォルトの詳細は「ワーキングセット」を参照。最小・最大ワーキングセットサイズはプロセスの仮想メモリページング挙動に影響する。指定プロセスのワーキングセットは、最小・最大両方に
(SIZE_T)-1 を指定することで空にできる。これはワーキングセットから可能な限りのページを削除する。同じ目的に
EmptyWorkingSet 関数も使用できる。dwMinimumWorkingSetSize または
dwMaximumWorkingSetSize がプロセスの現在のワーキングセットサイズより大きい場合、指定プロセスは
SE_INC_WORKING_SET_NAME
特権を持つ必要がある。一般にすべてのユーザーがこの特権を持つ。セキュリティ特権の詳細は「特権」を参照。Windows Server
2003: 指定プロセスは SE_INC_BASE_PRIORITY_NAME 特権を持つ必要がある。Administrators と
Power Users グループのユーザーは通常この特権を持つ。OS
はワーキングセットサイズを先着順に割り当てる。例えばあるアプリケーションが 64 MB システムで 40 MB
を最小ワーキングセットサイズに設定するのに成功した場合、次のアプリケーションが 40 MB を要求すると OS は拒否する。既定では
SetProcessWorkingSetSize
関数でアプリケーションの最小・最大ワーキングセットサイズを設定しても、要求されたメモリが予約される、あるいは常に常駐する保証はない。アプリケーションがアイドル状態になるか、低メモリ状況で需要があると、OS
はアプリケーションのワーキングセットを最小制限未満に減らすことがある。メモリが豊富な場合、OS
はアプリケーションが最大制限を超えることを許すこともある。QUOTA_LIMITS_HARDWS_MIN_ENABLE および
QUOTA_LIMITS_HARDWS_MAX_ENABLE
フラグにより制限の強制を保証できる。アプリケーションのワーキングセットサイズを増やすと、システムの他の部分から物理メモリを奪うことになる。これにより他のアプリケーションやシステム全体の性能を劣化させ、物理メモリを必要とする操作
(例: プロセス、スレッド、カーネルプールの作成) の失敗を招く可能性もある。したがって SetProcessWorkingSetSize
関数は慎重に使用すべきで、アプリケーション設計時には常にシステム全体の性能を考慮すべきである。アプリケーションは VirtualLock
関数で仮想アドレス空間の範囲をメモリ内にロックできるが、これによりシステム性能を劣化させうる。


%index
SetSearchPathMode
SearchPath 関数がファイルを検索する際に使用する、プロセス単位のモードを設定する。
%group
Win32 kernel32
%prm
Flags
Flags : [int] 使用する検索モード。
%inst
SearchPath 関数がファイルを検索する際に使用する、プロセス単位のモードを設定する。

[戻り値]
操作が正常に完了した場合、SetSearchPathMode 関数は 0 以外の値を返す。操作が失敗した場合は 0
を返す。拡張エラー情報を取得するには GetLastError
関数を呼ぶ。パラメータ値が無効なために失敗した場合、GetLastError は ERROR_INVALID_PARAMETER
を返す。現在の状態とパラメータ値の組み合わせが無効なために失敗した場合、GetLastError は
ERROR_ACCESS_DENIED を返す。詳細は備考の節を参照。

[備考]
現在のプロセスに対して SetSearchPathMode 関数がまだ正常に呼び出されていない場合、SearchPath
関数が使用する検索モードはシステムレジストリから取得される。詳細は SearchPath を参照。現在のプロセスに対して
SetSearchPathMode
関数が正常に呼び出された後は、システムレジストリの設定は無視され、最後に正常に設定されたモードが優先される。Flags に
(BASE_SEARCH_PATH_ENABLE_SAFE_SEARCHMODE |
BASE_SEARCH_PATH_PERMANENT) を指定して SetSearchPathMode
関数を正常に呼び出した場合、呼び出し側プロセスに対してセーフモードが恒久的に設定される。それ以降、同じプロセス内から検索モードを変更しようとして
SetSearchPathMode を呼び出しても、GetLastError から ERROR_ACCESS_DENIED
が返り失敗する。注意 セーフ検索モードを恒久的に設定するとプロセスの寿命の間は無効化できないため、慎重に使用すること。特に DLL
開発では、その DLL
の利用者がこのプロセス全体の設定の影響を受けるため要注意である。セーフ検索モードを恒久的に無効化することはできない。本関数はシステムレジストリを変更しない。Windows
8 および Windows Server 2012 では、この関数は次の技術によってサポートされる。
（以下省略）


%index
SetStdHandle
指定した標準デバイス（標準入力・標準出力・標準エラー）のハンドルを設定する。
%group
Win32 kernel32
%prm
nStdHandle, hHandle
nStdHandle : [int] ハンドルを設定する標準デバイス。次のいずれかの値を指定できる。 | 値 | 意味 | |-|-| | **STD_INPUT_HANDLE** `((DWORD)-10)` | 標準入力デバイス。初期状態ではコンソール入力バッファ `CONIN$`。 | | **STD_OUTPUT_HANDLE** `((DWORD)-11)` | 標準出力デバイス。初期状態ではアクティブなコンソール画面バッファ `CONOUT$`。 | | **STD_ERROR_HANDLE** `((DWORD)-12)` | 標準エラーデバイス。初期状態ではアクティブなコンソール画面バッファ `CONOUT$`。 | > [!NOTE] > これらの定数の値は符号なしだが、ヘッダファイルでは符号付き数値からのキャストとして定義されており、C コンパイラがそれを 32 ビットの最大値直下にロールオーバさせる仕組みを利用している。ヘッダを解析しない言語からこれらのハンドルを扱う場合や定数を再定義する場合はこの制約に注意すること。例えば `((DWORD)-10)` は実際には符号なしの `4294967286` である。
hHandle : [intptr] 標準デバイス用のハンドル。
%inst
指定した標準デバイス（標準入力・標準出力・標準エラー）のハンドルを設定する。

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
[**GetLastError**](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror)
を呼ぶ。

[備考]
プロセスの標準ハンドルは **SetStdHandle** の呼び出しによってリダイレクトされている可能性があり、その場合
[**GetStdHandle**](getstdhandle.md)
はリダイレクト先のハンドルを返す。標準ハンドルがリダイレクトされていても、[**CreateFile**](/windows/win32/api/fileapi/nf-fileapi-createfilea)
関数に CONIN$ を指定すればコンソールの入力バッファのハンドルを取得できる。同様に CONOUT$
を指定すればコンソールのアクティブな画面バッファのハンドルを取得できる。


%index
SetStdHandleEx
SetStdHandleEx 関数 (processenv.h) は、入力・出力・エラーストリーム用のハンドルを設定する。
%group
Win32 kernel32
%prm
nStdHandle, hHandle, phPrevValue
nStdHandle : [int] ハンドルを設定するストリームを示す DWORD。
hHandle : [intptr] ハンドル。
phPrevValue : [intptr] 省略可能。直前のハンドルを受け取る。
%inst
SetStdHandleEx 関数 (processenv.h) は、入力・出力・エラーストリーム用のハンドルを設定する。

[戻り値]
成功すると S_OK を返す。


%index
SetSystemFileCacheSize
ファイルシステムキャッシュのワーキングセットのサイズを制限する。
%group
Win32 kernel32
%prm
MinimumFileCacheSize, MaximumFileCacheSize, Flags
MinimumFileCacheSize : [int] ファイルキャッシュの最小サイズ（バイト単位）。仮想メモリマネージャは、システムファイルキャッシュ内に少なくともこの容量のメモリを常駐させようとする。キャッシュをフラッシュするには (SIZE_T) -1 を指定する。
MaximumFileCacheSize : [int] ファイルキャッシュの最大サイズ（バイト単位）。仮想メモリマネージャは、本呼び出しまたは過去の SetSystemFileCacheSize 呼び出しで FILE_CACHE_MAX_HARD_ENABLE を指定した場合に限り、この上限を強制する。キャッシュをフラッシュするには (SIZE_T) -1 を指定する。
Flags : [int] ファイルキャッシュの上限を有効化または無効化するフラグ。0 を指定すると、サイズ制限の現在の設定（無効・有効のいずれか）が維持される。
%inst
ファイルシステムキャッシュのワーキングセットのサイズを制限する。

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
呼び出し側プロセスは SE_INCREASE_QUOTA_NAME
特権を有効化しておく必要がある。MaximumFileCacheSize
に極端に低い値を設定するとシステム性能に悪影響を及ぼすことがある。本関数を使うアプリケーションをコンパイルする際は
_WIN32_WINNT を 0x0502 以上に定義する。詳細は Using the Windows Headers
を参照。FILE_CACHE_* 定数は Windows Server 2008 用 SDK 以降の Windows
ヘッダで定義される。それ以前の SDK のヘッダを使う場合は、次の定義をコードに追加すること。
（以下省略）


%index
SetSystemPowerState
電源を落としてシステムをサスペンドする。ForceFlag パラメータに応じて、即座にサスペンドするか、すべてのアプリケーションとデバイスドライバから許可を得てからサスペンドする。
%group
Win32 kernel32
%prm
fSuspend, fForce
fSuspend : [int] TRUE の場合システムをサスペンドする。FALSE の場合システムを休止状態にする。
fForce : [int] このパラメータは何も影響しない。
%inst
電源を落としてシステムをサスペンドする。ForceFlag
パラメータに応じて、即座にサスペンドするか、すべてのアプリケーションとデバイスドライバから許可を得てからサスペンドする。

[戻り値]
電源がサスペンドされ、その後復帰した場合、戻り値は 0 以外となる。サスペンドされなかった場合、戻り値は 0
となる。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
呼び出し側プロセスは SE_SHUTDOWN_NAME 特権を持っている必要がある。SE_SHUTDOWN_NAME 特権を有効にするには
AdjustTokenPrivileges 関数を使う。詳細は Changing Privileges in a Token
を参照。いずれかのアプリケーションやドライバがサスペンド操作を拒否した場合、本関数は各アプリケーション・ドライバに
PBT_APMQUERYSUSPENDFAILED
イベントをブロードキャストする。電源がサスペンドされた場合、本関数はシステムの動作が再開し関連する WM_POWERBROADCAST
メッセージがすべてのアプリケーション・ドライバに配送された後に戻る。本関数は SetSuspendState
関数に類似する。本関数を使うアプリケーションをコンパイルするには _WIN32_WINNT マクロを 0x0400 以上に定義する。詳細は
Using the Windows Headers を参照。


%index
SetSystemTime
現在のシステム日時を設定する。システム時刻は協定世界時 (UTC) で表される。
%group
Win32 kernel32
%prm
lpSystemTime
lpSystemTime : [var] 新しいシステム日時を含む SYSTEMTIME 構造体へのポインタ。
%inst
現在のシステム日時を設定する。システム時刻は協定世界時 (UTC) で表される。

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
呼び出し側プロセスは SE_SYSTEMTIME_NAME
特権を持っている必要がある。この特権は既定では無効である。SetSystemTime 関数はシステム時刻を変更する前に
SE_SYSTEMTIME_NAME 特権を有効化し、戻る前に無効化する。詳細は Running with Special
Privileges を参照。


%index
SetSystemTimeAdjustment
システムの時刻に対する定期的な時刻調整を有効化または無効化する。有効化すると、これらの時刻調整を使って時刻を別の時刻情報源と同期できる。(SetSystemTimeAdjustment)
%group
Win32 kernel32
%prm
dwTimeAdjustment, bTimeAdjustmentDisabled
dwTimeAdjustment : [int] 実際に経過する lpTimeIncrement 期間ごとにシステム時刻に加算する 100 ナノ秒単位の値。lpTimeIncrement の値は GetSystemTimeAdjustment で取得する。備考を参照。注意 現在 Windows Vista と Windows 7 のマシンでは 16 未満の時刻調整は失われる。
bTimeAdjustmentDisabled : [int] システムが使用する時刻調整モード。定期的なシステム時刻調整は無効化または有効化できる。
%inst

システムの時刻に対する定期的な時刻調整を有効化または無効化する。有効化すると、これらの時刻調整を使って時刻を別の時刻情報源と同期できる。(SetSystemTimeAdjustment)

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼ぶ。本関数が失敗するケースの一つは、呼び出し側が SE_SYSTEMTIME_NAME
特権を持っていない場合である。

[備考]
GetSystemTimeAdjustment と SetSystemTimeAdjustment は、GetSystemTime や
GetLocalTime
が返す時刻を別の時刻ソースと定期的な時刻調整によって同期させるアルゴリズムを支援する。SetSystemTimeAdjustment は
2 種類の時刻同期モードをサポートする。
（以下省略）


%index
SetTapeParameters
テープのブロックサイズを指定するか、テープデバイスを構成する。
%group
Win32 kernel32
%prm
hDevice, dwOperation, lpTapeInformation
hDevice : [intptr] 設定情報を設定する対象デバイスのハンドル。CreateFile 関数で作成する。
dwOperation : [int] 
lpTapeInformation : [intptr] 設定する情報を含む構造体へのポインタ。dwOperation が SET_TAPE_MEDIA_INFORMATION の場合は TAPE_SET_MEDIA_PARAMETERS 構造体を指す。dwOperation が SET_TAPE_DRIVE_INFORMATION の場合は TAPE_SET_DRIVE_PARAMETERS 構造体を指す。
%inst
テープのブロックサイズを指定するか、テープデバイスを構成する。

[戻り値]
関数が成功した場合、戻り値は NO_ERROR である。失敗した場合、次のいずれかのエラーコードを返すことがある。
（以下省略）


%index
SetTapePosition
指定したデバイスのテープ位置を設定する。
%group
Win32 kernel32
%prm
hDevice, dwPositionMethod, dwPartition, dwOffsetLow, dwOffsetHigh, bImmediate
hDevice : [intptr] テープ位置を設定するデバイスのハンドル。CreateFile 関数で作成する。
dwPositionMethod : [int] 
dwPartition : [int] 位置決めするパーティション。0 を指定すると現在のパーティションが使われる。パーティションは 1 から n まで論理的に番号付けされ、1 がテープ先頭、n が末尾となる。
dwOffsetLow : [int] dwPositionMethod で指定した位置操作で使うブロックアドレスまたはカウントの下位ビット。
dwOffsetHigh : [int] dwPositionMethod で指定した位置操作で使うブロックアドレスまたはカウントの上位ビット。上位ビットが不要な場合は 0 を指定する。
bImmediate : [int] 移動操作開始と同時に戻るかどうかを示す。TRUE の場合は即座に戻り、FALSE の場合は移動操作完了まで戻らない。
%inst
指定したデバイスのテープ位置を設定する。

[戻り値]
関数が成功した場合、戻り値は NO_ERROR である。失敗した場合、次のいずれかのエラーコードを返すことがある。
（以下省略）

[備考]
dwOffsetLow と dwOffsetHigh
で指定したオフセットが移動するブロック数・ファイルマーク数・セットマーク数を表す場合、正のオフセットはテープを最後のブロック・ファイルマーク・セットマークの末尾まで前方に移動させる。負のオフセットは最後のブロック・ファイルマーク・セットマークの先頭まで後方に移動させる。0
を指定するとテープは移動しない。テープドライブやメディアの状態・能力・容量に関する情報を取得するには GetTapeParameters
を呼ぶ。


%index
SetThreadAffinityMask
指定したスレッドのプロセッサアフィニティマスクを設定する。
%group
Win32 kernel32
%prm
hThread, dwThreadAffinityMask
hThread : [intptr] アフィニティマスクを設定するスレッドのハンドル。THREAD_SET_INFORMATION または THREAD_SET_LIMITED_INFORMATION アクセス権、および THREAD_QUERY_INFORMATION または THREAD_QUERY_LIMITED_INFORMATION アクセス権が必要。詳細は Thread Security and Access Rights を参照。Windows Server 2003 と Windows XP では THREAD_SET_INFORMATION と THREAD_QUERY_INFORMATION の両方が必要。
dwThreadAffinityMask : [int] スレッドのアフィニティマスク。プロセッサ数が 64 を超えるシステムでは、アフィニティマスクはスレッドの現在のプロセッサグループ内のプロセッサを指定しなければならない。
%inst
指定したスレッドのプロセッサアフィニティマスクを設定する。

[戻り値]
関数が成功した場合、戻り値はスレッドの直前のアフィニティマスクである。関数が失敗した場合、戻り値は 0
となる。拡張エラー情報を取得するには GetLastError
を呼ぶ。スレッドアフィニティマスクがプロセスアフィニティマスクで選択されていないプロセッサを要求した場合、ラストエラーコードは
ERROR_INVALID_PARAMETER となる。

[備考]

スレッドアフィニティマスクは、スレッドの実行が許可されている論理プロセッサを各ビットで表すビットベクトルである。スレッドアフィニティマスクは、そのスレッドを含むプロセスのプロセスアフィニティマスクのサブセットでなければならない。スレッドはプロセスが実行可能なプロセッサ上でのみ実行できる。したがって、プロセスアフィニティマスクで
0 になっているプロセッサに対して、スレッドアフィニティマスクで 1
を指定することはできない。プロセスやスレッドにアフィニティマスクを設定すると、システムが特定のプロセッサ上でのスレッド実行を制限するため、スレッドが受け取る
CPU
時間が減ることがある。多くの場合は、システムに利用可能なプロセッサを選ばせる方がよい。新しいスレッドアフィニティマスクが現在実行中のプロセッサを含まない場合、スレッドは許可されているプロセッサのいずれかへ再スケジュールされる。Windows
11 と Windows Server 2022 以降、64
を超えるプロセッサを持つシステムでは、プロセスとスレッドのアフィニティは既定で全プロセッサグループにまたがる。dwThreadAffinityMask
はスレッドの現在のプライマリグループ内のプロセッサを指定する必要がある。


%index
SetThreadErrorMode
指定した種類の重大エラーをシステムが処理するか、呼び出し側スレッドが処理するかを制御する。
%group
Win32 kernel32
%prm
dwNewMode, lpOldMode
dwNewMode : [int] 
lpOldMode : [var] 関数が成功した場合、このパラメータにはスレッドの直前のエラーモードが設定される。NULL を指定してもよい。
%inst
指定した種類の重大エラーをシステムが処理するか、呼び出し側スレッドが処理するかを制御する。

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]

各プロセスは、アプリケーションが重大エラーにどう応答するかをシステムに知らせる関連エラーモードを持つ。スレッドはそれが実行されているプロセスのエラーモードを継承する。プロセスのエラーモードを取得するには
GetErrorMode を使う。呼び出し側スレッドのエラーモードを取得するには GetThreadErrorMode を使う。


%index
SetThreadExecutionState
アプリケーションが使用中であることをシステムに通知し、アプリケーション実行中にシステムがスリープしたりディスプレイをオフにするのを防ぐ。
%group
Win32 kernel32
%prm
esFlags
esFlags : [int] 
%inst
アプリケーションが使用中であることをシステムに通知し、アプリケーション実行中にシステムがスリープしたりディスプレイをオフにするのを防ぐ。

[戻り値]
関数が成功した場合、戻り値は直前のスレッド実行状態である。関数が失敗した場合、戻り値は NULL となる。

[備考]
システムはローカルのキーボード・マウス入力、サーバ動作、ウィンドウフォーカスの変化などの活動を自動検出する。ディスクや CPU
の動作、ビデオ表示などは自動検出されない。ES_CONTINUOUS なしで SetThreadExecutionState
を呼ぶとアイドルタイマがリセットされるだけで、ディスプレイやシステムを稼働状態に保つには定期的に
SetThreadExecutionState を呼ぶ必要がある。電源管理されたコンピュータで適切に動作するために、Fax
サーバ・留守番電話・バックアップエージェント・ネットワーク管理アプリケーションなどはイベント処理時に ES_SYSTEM_REQUIRED
と ES_CONTINUOUS
の両方を使う必要がある。動画プレイヤーやプレゼンテーションなどのマルチメディアアプリケーションは、ユーザー入力なしで長時間ビデオを表示する場合に
ES_DISPLAY_REQUIRED を使う必要がある。ワープロ・表計算・ブラウザ・ゲームなどのアプリケーションは
SetThreadExecutionState を呼ぶ必要はない。ES_AWAYMODE_REQUIRED
は、システムがスリープ中に見えながら録画やストリーミングなどのバックグラウンド処理を行う必要があるメディアアプリケーションでのみ、本当に必要な場合に限って使うべきである。重要なバックグラウンド処理を必要としないアプリケーションや携帯機器上で動作するアプリケーションは、システムが真のスリープに入って電力を節約するのを妨げないように
Away モードを有効化すべきではない。Away モードを有効化するには ES_AWAYMODE_REQUIRED と
ES_CONTINUOUS を併用し、無効化するには ES_CONTINUOUS のみで SetThreadExecutionState
を呼ぶ。Away モード中はコンピュータをスリープさせる操作が代わりに Away モード遷移となる。Away
モードはスリープアイドルタイマには影響しないため、タイマ満了時にスリープへ入るのを防ぐには ES_SYSTEM_REQUIRED
も併用しなければならない。SetThreadExecutionState
はユーザーがコンピュータをスリープさせるのを妨げるためには使えない。アプリケーションは、ユーザーがノート PC
のふたを閉じたり電源ボタンを押したときの期待動作を尊重するべきである。本関数はスクリーンセーバの実行を止めない。


%index
SetThreadGroupAffinity
指定したスレッドのプロセッサグループアフィニティを設定する。
%group
Win32 kernel32
%prm
hThread, GroupAffinity, PreviousGroupAffinity
hThread : [intptr] スレッドのハンドル。THREAD_SET_INFORMATION アクセス権が必要。詳細は Thread Security and Access Rights を参照。
GroupAffinity : [var] 指定したスレッドに使用するプロセッサグループアフィニティを指定する GROUP_AFFINITY 構造体。
PreviousGroupAffinity : [var] スレッドの直前のグループアフィニティを受け取る GROUP_AFFINITY 構造体へのポインタ。NULL を指定してもよい。
%inst
指定したスレッドのプロセッサグループアフィニティを設定する。

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を使う。

[備考]
Windows 11 と Windows Server 2022 以降、64
を超えるプロセッサを持つシステムでは、プロセスとスレッドのアフィニティは既定で全プロセッサグループにまたがる。SetThreadGroupAffinity
関数は、スレッドのアフィニティを GroupAffinity
が指定する単一プロセッサグループ内のプロセッサに制限する。このグループはスレッドのプライマリグループにもなる。本関数を使うアプリケーションをコンパイルするには
_WIN32_WINNT を 0x0601 以上に設定する。詳細は Using the Windows Headers を参照。


%index
SetThreadIdealProcessor
スレッドの優先プロセッサを設定する。システムは可能な限り優先プロセッサ上でスレッドをスケジュールする。
%group
Win32 kernel32
%prm
hThread, dwIdealProcessor
hThread : [intptr] 優先プロセッサを設定するスレッドのハンドル。THREAD_SET_INFORMATION アクセス権が必要。詳細は Thread Security and Access Rights を参照。
dwIdealProcessor : [int] スレッドの優先プロセッサ番号。0 から始まる。MAXIMUM_PROCESSORS を指定すると、本関数は現在の理想プロセッサを変更せずに返す。
%inst
スレッドの優先プロセッサを設定する。システムは可能な限り優先プロセッサ上でスレッドをスケジュールする。

[戻り値]
関数が成功した場合、戻り値は直前の優先プロセッサである。関数が失敗した場合、戻り値は (DWORD) -1
となる。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
コンピュータのプロセッサ数を調べるには GetSystemInfo を使う。スレッドが実行可能なプロセッサを調べるには
GetProcessAffinityMask も使える。GetProcessAffinityMask
はビットマスクを返すが、SetThreadIdealProcessor はプロセッサを整数で表現する点に注意。Windows 11 と
Windows Server 2022 以降、64
を超えるプロセッサを持つシステムでは、プロセスとスレッドのアフィニティは既定で全プロセッサグループにまたがる。SetThreadIdealProcessor
は、優先プロセッサとしてスレッドのプライマリグループ内の論理プロセッサを設定する。本関数を使うアプリケーションをコンパイルするには
_WIN32_WINNT を 0x0400 以上に定義する。Windows 8.1 と Windows Server 2012 R2:
本関数は Windows 8.1、Windows Server 2012 R2 以降の Windows ストアアプリでサポートされる。


%index
SetThreadIdealProcessorEx
指定したスレッドの理想プロセッサを設定し、必要に応じて直前の理想プロセッサを取得する。
%group
Win32 kernel32
%prm
hThread, lpIdealProcessor, lpPreviousIdealProcessor
hThread : [intptr] 理想プロセッサを設定するスレッドのハンドル。THREAD_SET_INFORMATION アクセス権で作成されている必要がある。詳細は Thread Security and Access Rights を参照。
lpIdealProcessor : [var] 希望する理想プロセッサのプロセッサ番号を指定する PROCESSOR_NUMBER 構造体へのポインタ。
lpPreviousIdealProcessor : [var] 直前の理想プロセッサを受け取る PROCESSOR_NUMBER 構造体へのポインタ。lpIdealProcessor と同じメモリ位置を指してもよい。直前の理想プロセッサが不要な場合は NULL を指定できる。
%inst
指定したスレッドの理想プロセッサを設定し、必要に応じて直前の理想プロセッサを取得する。

[戻り値]
関数が成功した場合、0 以外を返す。関数が失敗した場合、0 を返す。拡張エラー情報を取得するには GetLastError を使う。

[備考]

スレッドの理想プロセッサを指定すると、スケジューラに対して優先プロセッサのヒントとなる。可能な限りスケジューラはそのスレッドを理想プロセッサ上で実行する。Windows
11 と Windows Server 2022 以降、64
を超えるプロセッサを持つシステムでは、プロセスとスレッドのアフィニティは既定で全プロセッサグループにまたがる。SetThreadIdealProcessorEx
は優先プロセッサ設定時にスレッドのプライマリグループも優先プロセッサのグループに変更する。本関数を使うアプリケーションをコンパイルするには
_WIN32_WINNT を 0x0601 以上に設定する。Windows Phone 8.1: 本関数は Windows Phone
8.1 以降の Windows Phone ストアアプリでサポートされる。Windows 8.1 と Windows Server
2012 R2: 本関数は Windows 8.1、Windows Server 2012 R2 以降の Windows
ストアアプリでサポートされる。


%index
SetThreadInformation
指定したスレッドの情報を設定する。
%group
Win32 kernel32
%prm
hThread, ThreadInformationClass, ThreadInformation, ThreadInformationSize
hThread : [intptr] スレッドのハンドル。THREAD_SET_INFORMATION アクセス権が必要。詳細は Thread Security and Access Rights を参照。
ThreadInformationClass : [int] 設定する情報のクラス。サポートされるのは ThreadMemoryPriority と ThreadPowerThrottling のみ。
ThreadInformation : [intptr] ThreadInformationClass が指定する種別の情報を含む構造体へのポインタ。ThreadMemoryPriority の場合は MEMORY_PRIORITY_INFORMATION を、ThreadPowerThrottling の場合は THREAD_POWER_THROTTLING_STATE を指す。
ThreadInformationSize : [int] ThreadInformation が指す構造体のサイズ（バイト単位）。ThreadMemoryPriority の場合は sizeof(MEMORY_PRIORITY_INFORMATION)、ThreadPowerThrottling の場合は sizeof(THREAD_POWER_THROTTLING_STATE) でなければならない。
%inst
指定したスレッドの情報を設定する。

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]

システム性能を改善するため、バックグラウンド処理を行うスレッドや、すぐには再アクセスされないファイル・データへアクセスするスレッドに対しては、SetThreadInformation
の ThreadMemoryPriority
を使ってメモリ優先度を下げるとよい。たとえばマルウェア対策ソフトはファイルスキャンを行うスレッドの優先度を下げることがある。**メモリ優先度**
は、ページがプロセスのワーキングセットからトリミングされるまでの時間を決定する。スレッドのメモリ優先度は、そのスレッドがプロセスワーキングセットに追加する物理ページの最低優先度を決定する。メモリマネージャはワーキングセットをトリミングする際、優先度の低いページから先にトリミングする。これにより優先度の高いページがトリミングされてページフォールトを起こす可能性が下がり、システム全体の性能が改善する。**ThreadPowerThrottling**
はスレッドにスロットリングポリシーを有効化し、最高性能が不要な場合に性能と電力効率のバランスを取るために使える。THREAD_POWER_THROTTLING_EXECUTION_SPEED
を有効化したスレッドは EcoQoS と分類される。システムは CPU
周波数の低下や省電力コアの利用などにより電力効率を高めようとする。EcoQoS
は前面ユーザー体験に寄与しない作業に使うべきで、バッテリ寿命が延び、発熱とファン音が低減する。性能重視や前面ユーザー体験には使うべきではない。(Windows
11 以前は EcoQoS は存在せず LowQoS と呼ばれていた。) アプリケーションが
THREAD_POWER_THROTTLING_EXECUTION_SPEED
を明示的に有効化しない場合、システムは独自のヒューリスティクスで QoS レベルを推定する。詳細は Quality of Service
を参照。


%index
SetThreadLocale
呼び出し側スレッドの現在のロケールを設定する。
%group
Win32 kernel32
%prm
Locale
Locale : [int] ロケールを指定するロケール識別子。MAKELCID マクロでロケール識別子を作成するか、定義済みの値を使用する。
%inst
呼び出し側スレッドの現在のロケールを設定する。

[戻り値]
成功した場合は LCID を返すべきである。これは直前のスレッドロケールの LCID である。

[備考]
スレッドが作成されたとき、スレッドはユーザーロケールを使う。この値は GetUserDefaultLCID
が返す。ユーザーロケールはコントロールパネルの地域と言語のオプションで以後のプロセスとスレッド作成のために変更できる。スレッドロケールも
SetThreadLocale で変更できる。SetThreadLocale は LANGUAGE
文を伴うリソースの選択に影響する。CreateDialog、DialogBox、LoadMenu、LoadString、FindResource
などに影響し、CP_THREAD_ACP が暗黙する CP も設定するが、FindResourceEx には影響しない。詳細は Code
Page Identifiers を参照。Windows Vista 以降: ユーザーインターフェース言語を選択するのに
SetThreadLocale を使ってはならない。リソースローダは .rc で LANGUAGE
文により定義されたリソースを選択するか、アプリケーションが FindResourceEx を使用できる。さらに
SetThreadUILanguage も使える。Windows 2000、Windows XP: SetThreadLocale を
UI 言語選択に使ってはならない。.rc の LANGUAGE 文で定義されたリソースを選択するには FindResourceEx
を使う必要がある。


%index
SetThreadPreferredUILanguages
現在のスレッドに対し優先 UI 言語を設定する。詳細は User Interface Language Management を参照。
%group
Win32 kernel32
%prm
dwFlags, pwszLanguagesBuffer, pulNumLanguages
dwFlags : [int] 設定する言語の形式とフィルタリングを示すフラグ。次の形式フラグはスレッドの優先 UI 言語に使う言語形式を指定する。フラグは排他的で、既定は MUI_LANGUAGE_NAME である。MUI_LANGUAGE_ID よりも MUI_LANGUAGE_NAME の使用を推奨する。
pwszLanguagesBuffer : [int] dwFlags で指定した形式で順序付けられた、NULL で区切られたリストを含むダブル NULL 終端マルチ文字列バッファへのポインタ。スレッドの優先 UI 言語リストをクリアするには NULL 文字列または空のダブル NULL 終端文字列を指定する。クリアする際は dwFlags に形式フラグまたは 0 を指定する。フィルタリングフラグの一つを指定した場合は本パラメータを NULL に設定する必要がある。この場合、関数は成功するが、スレッドの優先言語はリセットされない。
pulNumLanguages : [var] 本関数がスレッドの優先 UI 言語リストに設定した言語数へのポインタ。アプリケーションがフィルタリングフラグの一つを指定した場合、本パラメータは NULL に設定する必要がある。
%inst
現在のスレッドに対し優先 UI 言語を設定する。詳細は User Interface Language Management を参照。

[戻り値]
関数が成功した場合は TRUE、それ以外は FALSE を返す。

[備考]

本関数の呼び出し後にアプリケーションがリソースをロードすると、スレッド固有の優先設定がユーザーが好む言語よりも優先される。本関数はスレッドに対し最大
5 つの優先言語を優先順に設定できる。言語バッファに 5 つを超える有効な言語が含まれる場合、最初の 5
つだけが設定され残りは無視される。MUI_LANGUAGE_ID フラグ付きで呼ぶ場合、リスト内の文字列は先頭の 0x を含まず 4
文字長の 16 進言語識別子でなければならない。たとえば en-US は "0409" 、en は "0009"
として渡す。MUI_LANGUAGE_ID 指定時、リスト内の各 16
進値は実際の言語識別子を表していなければならない。特に次のロケール識別子の値は、言語識別子に対応するためには使えない。
（以下省略）


%index
SetThreadPriority
指定したスレッドの優先度値を設定する。この値とスレッドのプロセスの優先度クラスを合わせて、スレッドの基底優先度が決定される。
%group
Win32 kernel32
%prm
hThread, nPriority
hThread : [intptr] 優先度値を設定するスレッドのハンドル。THREAD_SET_INFORMATION または THREAD_SET_LIMITED_INFORMATION アクセス権が必要。詳細は Thread Security and Access Rights を参照。Windows Server 2003 では THREAD_SET_INFORMATION アクセス権が必要。
nPriority : [int] 
%inst
指定したスレッドの優先度値を設定する。この値とスレッドのプロセスの優先度クラスを合わせて、スレッドの基底優先度が決定される。

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼ぶ。Windows Phone 8.1: Windows Phone
ストアアプリは本関数を呼び出せるが効果はない。関数は成功を示す 0 以外を返す。

[備考]

すべてのスレッドはスレッドの優先度値とプロセスの優先度クラスにより決定される基底優先度を持つ。システムは実行可能スレッドの基底優先度から次に
CPU
時間を割り当てるスレッドを決定する。スレッドは各優先度レベルでラウンドロビン方式でスケジュールされ、上位レベルに実行可能スレッドがない場合のみ下位レベルがスケジュールされる。SetThreadPriority
はスレッドの基底優先度をプロセスの優先度クラスに対する相対値で設定できる。たとえば IDLE_PRIORITY_CLASS
のプロセスに属するスレッドに THREAD_PRIORITY_HIGHEST を指定すると基底優先度は 6
になる。優先度クラスとスレッド優先度値の組み合わせごとの基底優先度は Scheduling Priorities
の表を参照。IDLE_PRIORITY_CLASS、BELOW_NORMAL_PRIORITY_CLASS、NORMAL_PRIORITY_CLASS、ABOVE_NORMAL_PRIORITY_CLASS、HIGH_PRIORITY_CLASS
のプロセスでは、スレッドにとって重要なイベントが発生したときシステムは動的に基底優先度を引き上げる。REALTIME_PRIORITY_CLASS
プロセスは動的引き上げを受けない。すべてのスレッドは初期状態で THREAD_PRIORITY_NORMAL
である。プロセスの優先度クラスは GetPriorityClass / SetPriorityClass
で取得・設定する。スレッドの優先度値は GetThreadPriority
で取得する。優先度クラスは時間制約のあるアプリケーションと通常のアプリケーションを区別するために使い、スレッド優先度値はプロセス内のタスクの相対優先度を区別するために使う。たとえばウィンドウ入力を処理するスレッドは
CPU 集約的計算を行うスレッドより高い優先度にできる。優先度を扱う際は、高優先度スレッドが利用可能 CPU
時間を独占しないよう注意する。基底優先度 11 を超えるスレッドは OS
の通常動作を妨げる。REALTIME_PRIORITY_CLASS
の使用はディスクキャッシュのフラッシュ停止やマウス無応答などを引き起こす可能性がある。THREAD_PRIORITY_* 値はスレッドの
CPU スケジューリング優先度に影響する。ファイル I/O・ネットワーク I/O・データ処理などのバックグラウンド作業を行うスレッドでは
CPU スケジューリング優先度の調整だけでは不十分で、アイドル CPU
優先度のスレッドでもディスクとメモリを使用するときシステムの応答性を妨げる可能性がある。バックグラウンドスレッドは
THREAD_MODE_BACKGROUND_BEGIN と THREAD_MODE_BACKGROUND_END
を使うべきで、ユーザーと対話するスレッドは使うべきではない。バックグラウンド処理モード中のスレッドは、クリティカルセクション・ヒープ・ハンドルなどの共有を最小化するべきで、さもなければ優先度逆転が発生する。高優先度スレッドが実行されているとバックグラウンド処理モードのスレッドはすぐにはスケジュールされないが、決して飢餓状態にはならない。Windows
Server 2008 と Windows Vista: システム起動中、SetThreadPriority
はシステムスタートアップフォルダから起動されたアプリや Run
レジストリキーに記載されたアプリに対しては成功を返すが優先度を変更しない。これらのアプリは起動時のシステム応答性を高めるため約 60
秒間低い優先度で動作する。Windows 8.1 と Windows Server 2012 R2: 本関数は Windows
ストアアプリでサポートされる。Windows Phone 8.1: Windows Phone
ストアアプリは本関数を呼び出せるが効果はない。


%index
SetThreadPriorityBoost
システムがスレッドの優先度を一時的に引き上げる機能を無効化または有効化する。
%group
Win32 kernel32
%prm
hThread, bDisablePriorityBoost
hThread : [intptr] 優先度を引き上げるスレッドのハンドル。THREAD_SET_INFORMATION または THREAD_SET_LIMITED_INFORMATION アクセス権が必要。詳細は Thread Security and Access Rights を参照。Windows Server 2003 と Windows XP では THREAD_SET_INFORMATION アクセス権が必要。
bDisablePriorityBoost : [int] TRUE の場合、動的引き上げを無効化する。FALSE の場合、有効化する。
%inst
システムがスレッドの優先度を一時的に引き上げる機能を無効化または有効化する。

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]

スレッドが動的優先度クラスのいずれかで動作している場合、待機状態から抜けたときシステムは一時的にスレッドの優先度を引き上げる。SetThreadPriorityBoost
を DisablePriorityBoost に TRUE で呼ぶとスレッドの優先度は引き上げられない。通常動作に戻すには FALSE
で呼び直す。


%index
SetThreadStackGuarantee
呼び出し側スレッドまたはファイバに関連するスタックの最小サイズを設定する。これはスタックオーバーフロー例外発生時に使用可能となる。
%group
Win32 kernel32
%prm
StackSizeInBytes
StackSizeInBytes : [var] スタックのサイズ（バイト単位）。戻り時にこの値は直前のスタックサイズに設定される。0 を指定した場合、関数は成功し、本パラメータには現在のスタックサイズが設定される。指定サイズが現在のサイズより小さい場合、関数は成功するがこの要求は無視される。したがって本関数でスタックサイズを縮小することはできない。予約済みスタックサイズを超える値は指定できない。
%inst
呼び出し側スレッドまたはファイバに関連するスタックの最小サイズを設定する。これはスタックオーバーフロー例外発生時に使用可能となる。

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
関数が成功した場合、アプリケーションは構造化例外処理を使って EXCEPTION_STACK_OVERFLOW
例外を扱える。スタックオーバーフロー処理後に実行を再開するには、特定の復旧手順が必要である。Microsoft C/C++
コンパイラを使う場合は _resetstkoflw
関数を呼ぶ。他のコンパイラの場合はそのドキュメントを参照。ファイバのスタック保証を設定するには、まず SwitchToFiber
でファイバを実行する必要がある。設定後はどのスレッドがそのファイバを実行してもこの保証が使われる。


%index
SetThreadUILanguage
現在のスレッドの UI 言語を設定する。
%group
Win32 kernel32
%prm
LangId
LangId : [int] スレッドの UI 言語の言語識別子。Windows Vista 以降では 0 または非ゼロの識別子を指定できる。詳細は備考を参照。Windows XP では 0 のみ指定可能。0 を指定するとコンソール表示に最も適した言語が選ばれる。詳細は備考を参照。
%inst
現在のスレッドの UI 言語を設定する。

[戻り値]
成功した場合は入力した言語識別子を返す。入力識別子が非ゼロならその値を返す。0 を指定した場合は常に成功し、Windows
コンソールに最適な言語の識別子を返す。備考を参照。入力が非ゼロで関数が失敗した場合、戻り値は入力と異なる。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
スレッドが作成されたとき、スレッドの UI 言語設定は空で、UI はユーザー選択言語で表示される。本関数により現在実行中スレッドの UI
言語を変更できる。Windows Vista 以降: 本関数を 0 で呼ぶことは MUI_CONSOLE_FILTER フラグ付きで
SetThreadPreferredUILanguages
を呼ぶことと同等である。アプリケーションが有効な非ゼロの言語識別子を指定すると、本関数はスレッドに特定の UI 言語を設定する。0
を指定した後は次の定数を言語識別子として使用できない。
（以下省略）


%index
SetThreadpoolStackInformation
指定したスレッドプール内の新規スレッドのスタック予約サイズとコミットサイズを設定する。既存スレッドのサイズは変更されない。
%group
Win32 kernel32
%prm
ptpp, ptpsi
ptpp : [intptr] スレッドプールを指定する TP_POOL 構造体へのポインタ。CreateThreadpool 関数が返す。
ptpsi : [var] プール内スレッドのスタック予約サイズとコミットサイズを指定する TP_POOL_STACK_INFORMATION 構造体へのポインタ。
%inst
指定したスレッドプール内の新規スレッドのスタック予約サイズとコミットサイズを設定する。既存スレッドのサイズは変更されない。

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
本関数を使うアプリケーションをコンパイルするには _WIN32_WINNT を _WIN32_WINNT_WIN7 に設定する。詳細は
Using the Windows Headers を参照。


%index
SetThreadpoolThreadMinimum
指定したスレッドプールがコールバック処理のために用意しなければならないスレッドの最小数を設定する。
%group
Win32 kernel32
%prm
ptpp, cthrdMic
ptpp : [intptr] スレッドプールを定義する TP_POOL 構造体へのポインタ。CreateThreadpool 関数が返す。
cthrdMic : [int] スレッドの最小数。
%inst
指定したスレッドプールがコールバック処理のために用意しなければならないスレッドの最小数を設定する。

[戻り値]
関数が成功した場合、戻り値は TRUE である。関数が失敗した場合、戻り値は FALSE となる。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
プールが割り当て可能なスレッドの最大数を指定するには SetThreadpoolThreadMaximum
を呼ぶ。本関数を使うアプリケーションをコンパイルするには _WIN32_WINNT を 0x0600 以上に定義する。


%index
SetTimeZoneInformation
現在のタイムゾーン設定を設定する。これらは協定世界時 (UTC) からローカル時刻への変換を制御する。
%group
Win32 kernel32
%prm
lpTimeZoneInformation
lpTimeZoneInformation : [var] 新しい設定を含む TIME_ZONE_INFORMATION 構造体へのポインタ。
%inst
現在のタイムゾーン設定を設定する。これらは協定世界時 (UTC) からローカル時刻への変換を制御する。

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
本関数が成功するためにはアプリケーションが SE_TIME_ZONE_NAME
特権を持っている必要がある。この特権は既定で無効である。AdjustTokenPrivileges を使って
SetTimeZoneInformation を呼び出す前に有効化し、呼び出し後に無効化する。詳細は Running with
Special Privileges を参照。Windows Server 2003 と Windows XP/2000
ではアプリケーションは SE_SYSTEMTIME_NAME 特権を持っている必要がある。> [!IMPORTANT] > Windows
Vista と Windows Server 2008 以降の現行 Windows では、システムタイムゾーン情報を設定するには
SetTimeZoneInformation の代わりに SetDynamicTimeZoneInformation
を呼ぶこと。SetDynamicTimeZoneInformation は Windows
レジストリの動的データが提供する標準時と夏時間の変更履歴をフルにサポートする。SetTimeZoneInformation
を使うとシステムの動的夏時間サポートが無効化され、Windows
のタイムゾーン設定で「現在のタイムゾーンが認識できません。有効なタイムゾーンを選択してください。」と表示される。タイムゾーンが変わったことを
Explorer に通知するには WM_SETTINGCHANGE メッセージを送る。UTC とローカル時刻の変換はすべて UTC =
ローカル時刻 + バイアス という式に基づく。バイアスは UTC とローカル時刻の差（分単位）である。


%index
SetTimerQueueTimer
(no summary)
%group
Win32 kernel32
%prm
TimerQueue, Callback, Parameter, DueTime, Period, PreferIo
TimerQueue : [intptr] 
Callback : [int] 
Parameter : [intptr] 
DueTime : [int] 
Period : [int] 
PreferIo : [int] 
%inst



%index
SetUmsThreadInformation
指定したユーザーモードスケジューリング (UMS) ワーカースレッドにアプリケーション固有のコンテキスト情報を設定する。
%group
Win32 kernel32
%prm
UmsThread, UmsThreadInfoClass, UmsThreadInformation, UmsThreadInformationLength
UmsThread : [intptr] UMS スレッドコンテキストへのポインタ。
UmsThreadInfoClass : [int] 設定する情報の種別を指定する UMS_THREAD_INFO_CLASS 値。UmsThreadUserContext でなければならない。
UmsThreadInformation : [intptr] 設定する情報を含むバッファへのポインタ。
UmsThreadInformationLength : [int] UmsThreadInformation バッファのサイズ（バイト単位）。
%inst
指定したユーザーモードスケジューリング (UMS) ワーカースレッドにアプリケーション固有のコンテキスト情報を設定する。

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼ぶ。エラー値の例は次のとおり。
（以下省略）

[備考]
SetUmsThreadInformation は指定した UMS
ワーカースレッドにアプリケーション定義のコンテキストを設定するために使える。コンテキスト情報はスケジューラ単位やワーカースレッド単位の状態など、アプリケーションが追跡したい任意の情報でよい。UMS
ワーカースレッドの基底構造はシステムが管理しており、直接変更してはならない。
QueryUmsThreadInformation を使えば指定スレッドの TEB
やサスペンド・終了状態など、公開されている情報を取得できる。QueryUmsThreadInformation
で公開されない情報は予約済みと考える。


%index
SetUserGeoID
ユーザーの地理的位置識別子を設定する。この識別子は地理的位置の表に記載された値のいずれかを使う。
%group
Win32 kernel32
%prm
GeoId
GeoId : [int] ユーザーの地理的位置の識別子。
%inst
ユーザーの地理的位置識別子を設定する。この識別子は地理的位置の表に記載された値のいずれかを使う。

[戻り値]
成功した場合は TRUE、失敗した場合は FALSE を返す。Windows XP、Windows Server 2003:
本関数は拡張エラー情報を提供しない。よって本関数の後で GetLastError
を呼ぶのは適切でなく、過去に呼ばれた別関数の値が返る可能性がある。本関数が失敗した場合、アプリケーションは GetLastError
を呼ぶことができ、次のいずれかのエラーコードが返ることがある。
（以下省略）

[備考]

本関数は特定のアプリケーションではなく特定のユーザー向けの地理的位置をレジストリに書き込む。これによりそのユーザーが実行する他のアプリケーションの動作にも影響する。原則として、ユーザーが明示的に変更を要求した場合のみ呼ぶべきで、純粋にアプリケーション固有の理由では呼ぶべきでない。SetUserGeoID
は Windows
設定アプリのようなユーザー設定変更を目的としたアプリケーションでの使用を想定している。それ以外のアプリケーションは呼ぶべきでない。


%index
SetUserGeoName
現在のユーザーの地理的位置を、指定した 2 文字 ISO 3166-1 コードまたは数値 UN M.49 コードに設定する。
%group
Win32 kernel32
%prm
geoName
geoName : [wstr] 現在のユーザーに設定する地理的位置の 2 文字の ISO 3166-1 コードまたは数値の UN M.49 コード。OS 上で利用可能なコードを取得するには EnumSystemGeoNames を呼ぶ。
%inst
現在のユーザーの地理的位置を、指定した 2 文字 ISO 3166-1 コードまたは数値 UN M.49 コードに設定する。

[戻り値]
成功した場合は TRUE、失敗した場合は FALSE を返す。失敗した場合 GetLastError
を呼ぶことで次のいずれかのエラーコードが返ることがある。
（以下省略）

[備考]

本関数は特定のアプリケーションではなく特定のユーザー向けの地理的位置をレジストリに書き込む。これによりそのユーザーが実行する他のアプリケーションの動作にも影響する。原則として、ユーザーが明示的に変更を要求した場合のみ呼ぶ。2
文字 ISO 3166-1 コードの情報は Country Codes - ISO 3166 を参照。数値 UN M.49 コードは
Standard country or area codes for statistical use (M49)
を参照。SetUserGeoName は Windows
設定アプリのようなユーザー設定変更を目的としたアプリケーションでの使用を想定している。それ以外のアプリケーションは呼ぶべきでない。


%index
SetVolumeLabelW
ファイルシステムボリュームのラベルを設定する。(Unicode)
%group
Win32 kernel32
%prm
lpRootPathName, lpVolumeName
lpRootPathName : [wstr] ボリュームのドライブ文字（例: X:\）またはボリュームに関連付けられたマウントフォルダのパス（例: Y:\MountX\）を含む文字列へのポインタ。文字列はバックスラッシュ ('\') で終わらなければならない。NULL を指定すると現在のディレクトリのルートが使われる。
lpVolumeName : [wstr] ボリュームの新しいラベルを含む文字列へのポインタ。NULL を指定すると、関数は指定ボリュームの既存ラベルを削除し、新ラベルは割り当てない。
%inst
ファイルシステムボリュームのラベルを設定する。(Unicode)

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
ボリュームラベルの最大長は 32 文字。FAT ファイルシステムでは最大 11
文字。ラベルはユーザーがボリュームを認識しやすくするために付ける名前で、ボリュームはラベル・ドライブ文字の両方を持つことも、どちらか・どちらも持たないこともできる。詳細は
Naming a Volume を参照。Windows 8 と Windows Server 2012
では本関数は次の技術によりサポートされる。
（以下省略）


%index
SetVolumeMountPointW
ボリュームをドライブ文字または別ボリューム上のディレクトリに関連付ける。(Unicode)
%group
Win32 kernel32
%prm
lpszVolumeMountPoint, lpszVolumeName
lpszVolumeMountPoint : [wstr] ボリュームに関連付けるユーザーモードのパス。ドライブ文字 ("X:\\") または別ボリューム上のディレクトリ ("Y:\MountX\") を指定できる。文字列はバックスラッシュ ('\') で終わらなければならない。
lpszVolumeName : [wstr] ボリュームのボリューム GUID パス。"\\\\?\\Volume{GUID}\\" 形式でなければならない。GUID はボリュームを識別する GUID。"\\\\?\\" はパス解析を無効化するもので、Naming a Volume で説明されているようにパスの一部として無視される。
%inst
ボリュームをドライブ文字または別ボリューム上のディレクトリに関連付ける。(Unicode)

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼ぶ。lpszVolumeMountPoint がマウントフォルダのパスを含む場合、ディレクトリが空でも
GetLastError は ERROR_DIR_NOT_EMPTY を返す。

[備考]

ボリュームを別ボリューム上のディレクトリに関連付ける場合、関連付けられたディレクトリはマウントフォルダと呼ばれる。ファイルやサブディレクトリを含むディレクトリにボリュームを関連付けるとエラーとなる。これはシステムや隠しディレクトリ、システムや隠しファイルを含む場合にも発生する。クラスタディスク上のボリュームにマウントフォルダを作成すると、特定の状況下で予期せず削除されることがある。これを防ぐマウントフォルダの作成・構成方法は
Cluster Disk and Drive Connection Problems を参照。Windows 8 と Windows
Server 2012 では本関数は次の技術によりサポートされる。
（以下省略）


%index
SetWaitableTimer
指定した待機可能タイマをアクティブ化する。到来時刻になるとタイマがシグナル状態となり、タイマを設定したスレッドが省略可能な完了ルーチンを呼ぶ。
%group
Win32 kernel32
%prm
hTimer, lpDueTime, lPeriod, pfnCompletionRoutine, lpArgToCompletionRoutine, fResume
hTimer : [intptr] タイマオブジェクトのハンドル。CreateWaitableTimer または OpenWaitableTimer が返す。
lpDueTime : [var] タイマがシグナル状態になるまでの時間（100 ナノ秒単位）。FILETIME 構造体の形式を使う。正の値は絶対時間を、負の値は相対時間を示す。絶対時間は UTC ベースで指定すること。実際のタイマ精度はハードウェア性能に依存する。UTC ベースの時刻については System Time を参照。
lPeriod : [int] タイマの周期（ミリ秒単位）。0 の場合タイマは一度だけシグナル状態になる。0 より大きい場合は周期タイマとなり、CancelWaitableTimer または再度の SetWaitableTimer まで周期ごとに自動再起動する。負の値を指定すると関数は失敗する。
pfnCompletionRoutine : [int] 省略可能な完了ルーチンへのポインタ。完了ルーチンはタイマがシグナル状態になったときに実行される PTIMERAPCROUTINE 型のアプリケーション定義関数。詳細は TimerAPCProc を参照。APC とスレッドプールスレッドについては備考を参照。
lpArgToCompletionRoutine : [intptr] 完了ルーチンに渡す構造体へのポインタ。
fResume : [int] TRUE の場合、タイマがシグナル状態に設定されたとき、サスペンド省電力モードにあったシステムを復帰させる。FALSE の場合は復帰させない。システムが復帰をサポートしない場合、呼び出しは成功するが GetLastError は ERROR_NOT_SUPPORTED を返す。
%inst

指定した待機可能タイマをアクティブ化する。到来時刻になるとタイマがシグナル状態となり、タイマを設定したスレッドが省略可能な完了ルーチンを呼ぶ。

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
タイマは初期状態では非アクティブである。アクティブ化するには SetWaitableTimer を呼ぶ。SetWaitableTimer
呼び出し時にタイマが既にアクティブだった場合、タイマは停止後に再アクティブ化される。この方法での停止はタイマ状態をシグナル状態にしないため、タイマ上で待機ブロックされているスレッドはブロックされたままとなる。ただし保留中の完了ルーチンはキャンセルされる。指定到来時刻になると、タイマは非アクティブになり、省略可能な
APC
がタイマを設定したスレッドのキューに入れられる。タイマ状態はシグナル状態となり、指定周期で再アクティブ化される。タイマを設定したスレッドが警告可能待機状態に入ると完了ルーチンが呼ばれる。タイマがスレッドの警告可能待機状態より先に設定されると
APC はキャンセルされる。詳細は QueueUserAPC
を参照。スレッドプールスレッドではシステムがそのスレッドの寿命を制御するため、APC
は他のシグナリング機構ほど確実に動作しない。pfnCompletionRoutine や別の APC
ベースのシグナリング機構を使う代わりに、CreateThreadpoolTimer
で作成したタイマなどの待機可能オブジェクトを使う。I/O には CreateThreadpoolIo で作成した I/O
完了オブジェクトや、SetThreadpoolWait に渡せる hEvent ベースの OVERLAPPED
構造体を使う。タイマを設定したスレッドが終了し、関連する完了ルーチンがある場合、タイマはキャンセルされる。ただしタイマ状態は変更されない。完了ルーチンがない場合、スレッド終了はタイマに影響しない。手動リセットタイマがシグナル状態になると、SetWaitableTimer
が再度呼ばれてリセットされるまでこの状態を維持する。よって周期手動リセットタイマは初回の到来時刻でシグナル状態になり、リセットされるまでシグナル状態を維持する。同期タイマがシグナル状態になると、スレッドが待機操作を完了するまでこの状態を維持する。システム時刻が調整されると、保留中の絶対タイマの到来時刻も調整される。本関数を使うアプリケーションをコンパイルするには
_WIN32_WINNT を 0x0400 以上に定義する。詳細は Using the Windows Headers
を参照。ウィンドウのイベントスケジュールには SetTimer を使う。タイマを扱う API
は様々なハードウェアクロックを使用する。これらのクロックの分解能は期待と大きく異なることがある。timeBeginPeriod /
timeEndPeriod の呼び出しで API の分解能を変更できる。


%index
SetupComm
指定した通信デバイスの通信パラメータを初期化する。
%group
Win32 kernel32
%prm
hFile, dwInQueue, dwOutQueue
hFile : [intptr] 通信デバイスのハンドル。CreateFile 関数が返す。
dwInQueue : [int] デバイスの内部入力バッファの推奨サイズ（バイト単位）。
dwOutQueue : [int] デバイスの内部出力バッファの推奨サイズ（バイト単位）。
%inst
指定した通信デバイスの通信パラメータを初期化する。

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
プロセスが CreateFile で通信デバイスのハンドルを開いた後、デバイスとの I/O を行う前に SetupComm
を呼んで通信パラメータを設定できる。設定しない場合、最初の通信関数呼び出し時に既定パラメータが使われる。dwInQueue と
dwOutQueue は指定デバイスのドライバが使う内部バッファの推奨サイズを指定する。たとえば YMODEM プロトコルパケットは
1024 バイトより少し大きいので 1200 バイトが推奨され、Ethernet ベースの通信では 1600
バイトが推奨される。デバイスドライバは推奨バッファサイズを受け取るが、合理的な性能とオーバーランによるデータ損失なし（極端な状況を除く）を提供する限り、任意の
I/O バッファリング方式を自由に使える。


%index
SignalObjectAndWait
一つのオブジェクトをシグナル状態にしてから別のオブジェクトを待機する操作を、単一の操作として実行する。
%group
Win32 kernel32
%prm
hObjectToSignal, hObjectToWaitOn, dwMilliseconds, bAlertable
hObjectToSignal : [intptr] シグナル状態にするオブジェクトのハンドル。セマフォ・ミューテックス・イベントを指定できる。
hObjectToWaitOn : [intptr] 待機するオブジェクトのハンドル。SYNCHRONIZE アクセス権が必要。詳細は Synchronization Object Security and Access Rights を参照。指定可能なオブジェクト種別の一覧は備考を参照。
dwMilliseconds : [int] タイムアウト間隔（ミリ秒単位）。指定間隔が経過すると、オブジェクトの状態が非シグナル状態でも完了ルーチンや APC オブジェクトがキューイングされていなくても関数は戻る。0 を指定すると関数はオブジェクトの状態をテストし、キューイングされた完了ルーチンや APC をチェックして即座に戻る。INFINITE を指定するとタイムアウトしない。
bAlertable : [int] TRUE の場合、システムが I/O 完了ルーチンや APC 関数をキューイングするとスレッドはそれを呼び出して関数が戻る。FALSE の場合、関数は戻らず、完了ルーチンや APC 関数も呼ばれない。
%inst
一つのオブジェクトをシグナル状態にしてから別のオブジェクトを待機する操作を、単一の操作として実行する。

[戻り値]
関数が成功した場合、戻り値は関数を戻らせた原因のイベントを示す。次のいずれかの値となる。
（以下省略）

[備考]
SignalObjectAndWait は SetEvent と WaitForSingleObject
の別呼び出しよりも効率的に、一つのオブジェクトをシグナル状態にしてから別のオブジェクトを待機する手段を提供する。SignalObjectAndWait
は次のオブジェクトを待機できる。
（以下省略）


%index
SizeofResource
指定したリソースのサイズ（バイト単位）を取得する。
%group
Win32 kernel32
%prm
hModule, hResInfo
hModule : [intptr] 型: HMODULE リソースを含む実行可能ファイルのモジュールへのハンドル。既定は現在のプロセスを作成したモジュール。
hResInfo : [intptr] 型: HRSRC リソースのハンドル。FindResource または FindResourceEx で作成しなければならない。
%inst
指定したリソースのサイズ（バイト単位）を取得する。

[戻り値]
型: DWORD 関数が成功した場合、戻り値はリソースのバイト数。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼ぶ。


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
SleepEx
指定した条件が満たされるまで現在のスレッドを中断する。
%group
Win32 kernel32
%prm
dwMilliseconds, bAlertable
dwMilliseconds : [int] 実行を中断する時間間隔（ミリ秒単位）。0 を指定するとスレッドは残りのタイムスライスを他の実行可能スレッドに譲る。他に実行可能スレッドがなければ即座に戻る。Windows XP では 0 を指定すると同等優先度の実行可能スレッドにのみ譲る動作だった。Windows Server 2003 以降で動作が変更された。INFINITE を指定するとタイムアウトしない。
bAlertable : [int] FALSE の場合、関数はタイムアウト期間が経過するまで戻らない。I/O 完了コールバックや APC が発生しても即座に戻らず、I/O 完了関数や APC 関数も実行されない。TRUE で、本関数を呼び出したスレッドが拡張 I/O 関数 (ReadFileEx または WriteFileEx) を呼び出したスレッドと同じ場合、関数はタイムアウト期間が経過するか I/O 完了コールバック関数が発生したときに戻る。I/O 完了コールバックが発生すると I/O 完了関数が呼ばれる。APC がキューイングされている場合 (QueueUserAPC)、関数はタイムアウト期間が経過するか APC 関数が呼ばれたときに戻る。
%inst
指定した条件が満たされるまで現在のスレッドを中断する。

[戻り値]
指定時間間隔が経過した場合は 0 を返す。bAlertable が TRUE で、SleepEx を呼んだスレッドが拡張 I/O
関数を呼んだスレッドと同じ場合に I/O 完了コールバックにより戻った場合は WAIT_IO_COMPLETION を返す。

[備考]
本関数はスレッドに残りのタイムスライスを譲らせ、dwMilliseconds
に基づく時間だけ実行不能にする。スリープ間隔経過後、スレッドは実行可能となる。実行可能スレッドがすぐに実行される保証はなく、システムティック頻度や他プロセスの負荷に応じて任意の時間後に実行される。システムクロックは一定速度でティックする。スリープ間隔の精度を高めるには
timeGetDevCaps で最小タイマ分解能を取得し、timeBeginPeriod で最小に設定する。timeBeginPeriod
の頻繁な呼び出しはシステムクロック・電力使用・スケジューラに大きく影響するので注意する。timeBeginPeriod
を呼ぶ場合はアプリ早期に 1 度だけ呼び、終了時に必ず timeEndPeriod を呼ぶ。0
ミリ秒を指定するとスレッドは残りのタイムスライスを譲るが実行可能状態を保つ。詳細は Scheduling Priorities
を参照。本関数は ReadFileEx や WriteFileEx と組み合わせて、I/O
操作完了までスレッドを中断するために使える。これらの関数は I/O
完了時に実行する完了ルーチンを指定する。完了ルーチンが実行されるためには、I/O
関数を呼んだスレッドが完了コールバック発生時に警告可能待機状態にある必要がある。SleepEx、MsgWaitForMultipleObjectsEx、WaitForSingleObjectEx、WaitForMultipleObjectsEx
を bAlertable に TRUE で呼ぶことでスレッドは警告可能待機状態に入る。SleepEx は次のシナリオで使う際に注意。
（以下省略）


%index
SuspendThread
指定したスレッドをサスペンドする。
%group
Win32 kernel32
%prm
hThread
hThread : [intptr] サスペンドするスレッドのハンドル。THREAD_SUSPEND_RESUME アクセス権が必要。詳細は Thread Security and Access Rights を参照。
%inst
指定したスレッドをサスペンドする。

[戻り値]
関数が成功した場合、戻り値はスレッドの直前のサスペンドカウントである。それ以外の場合は (DWORD) -1
となる。拡張エラー情報を取得するには GetLastError を使う。

[備考]

関数が成功すると、指定スレッドの実行はサスペンドされ、サスペンドカウントがインクリメントされる。スレッドのサスペンドはユーザーモード（アプリケーション）コードの実行を停止させる。本関数は主にデバッガでの使用を想定しており、スレッド同期には使うべきでない。ミューテックスやクリティカルセクションなどの同期オブジェクトを所有するスレッドに対して
SuspendThread
を呼ぶと、呼び出し側スレッドがそのスレッドが所有する同期オブジェクトを取得しようとした場合にデッドロックを引き起こす。これを避けるため、デバッガでないアプリケーション内のスレッドは別スレッドに自身をサスペンドするよう信号を送るべきで、対象スレッドはこの信号を監視して適切に応答する設計にする。各スレッドはサスペンドカウント
(最大値 MAXIMUM_SUSPEND_COUNT) を持つ。サスペンドカウントが 0
より大きいとスレッドはサスペンドされ、それ以外は実行可能。SuspendThread
はサスペンドカウントをインクリメントする。最大値を超えてインクリメントしようとするとカウントを増やさずエラーとなる。ResumeThread
はサスペンドされたスレッドのサスペンドカウントをデクリメントする。Windows Phone 8.1: 本関数は Windows
Phone 8.1 以降の Windows Phone ストアアプリでサポートされる。Windows 8.1 と Windows
Server 2012 R2: 本関数は Windows 8.1、Windows Server 2012 R2 以降の Windows
ストアアプリでサポートされる。


%index
SwitchToFiber
ファイバをスケジュールする。本関数はファイバ上で呼ばなければならない。
%group
Win32 kernel32
%prm
lpFiber
lpFiber : [intptr] スケジュールするファイバのアドレス。
%inst
ファイバをスケジュールする。本関数はファイバ上で呼ばなければならない。

[備考]
ファイバは CreateFiber
で作成する。スレッドに関連するファイバをスケジュールするには、ファイバ状態情報を保存する領域を用意するために
ConvertThreadToFiber を呼ぶ必要がある。スレッドは現在実行中のファイバとなる。SwitchToFiber
は現在のファイバの状態情報を保存し、指定ファイバの状態を復元する。別スレッドが作成したファイバのアドレスで SwitchToFiber
を呼ぶこともできる。そのためには、CreateFiber
が他のスレッドに返したアドレスを取得し、適切な同期を行う必要がある。次のような呼び出しは避けること。
（以下省略）


%index
SwitchToThread
呼び出し側スレッドが現在のプロセッサ上で実行可能な別スレッドに実行を譲る。OS が次に実行するスレッドを選択する。
%group
Win32 kernel32
%prm

%inst
呼び出し側スレッドが現在のプロセッサ上で実行可能な別スレッドに実行を譲る。OS が次に実行するスレッドを選択する。

[戻り値]
SwitchToThread の呼び出しで OS が別スレッドに実行を切り替えた場合、戻り値は 0
以外。実行可能な他スレッドがなく切り替えなかった場合は 0 となる。

[備考]
実行の譲渡は、呼び出し側スレッドのプロセッサ上で最大 1 スレッドスケジューリングタイムスライスの間有効である。OS
は他のプロセッサにスレッドを切り替えない。アイドルや低優先度スレッドが動作中でも切り替えない。譲渡したスレッドのタイムスライス経過後、OS
は譲渡したスレッドの実行を再スケジュールする。再スケジュールは譲渡したスレッドの優先度と他の実行可能スレッドの状態によって決まる。OS
は同時実行制御のみで実行が妨げられているスレッドへは切り替えない。たとえば I/O
完了ポートやスレッドプールは関連スレッドの最大数を制限する。最大数が既に動作中なら追加スレッドは動作できない。SwitchToThread
を使ってこれら追加スレッドの作業完了を待つとプロセスがデッドロックする可能性がある。本関数を使うアプリケーションをコンパイルするには
_WIN32_WINNT を 0x0400 以上に定義する。


%index
SystemTimeToFileTime
システム時刻をファイル時刻形式に変換する。システム時刻は協定世界時 (UTC) に基づく。
%group
Win32 kernel32
%prm
lpSystemTime, lpFileTime
lpSystemTime : [var] UTC からファイル時刻形式に変換するシステム時刻を含む SYSTEMTIME 構造体へのポインタ。
lpFileTime : [var] 変換後のシステム時刻を受け取る FILETIME 構造体へのポインタ。
%inst
システム時刻をファイル時刻形式に変換する。システム時刻は協定世界時 (UTC) に基づく。

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼ぶ。> [!NOTE] > FALSE が返ることは、渡された SYSTEMTIME
構造体が無効な日付を表していることを示す可能性がある。閏年に追加される日などにより、アプリケーションロジックが意図せず無効な日付を作ることがある。詳細はうるう年対応に関する記事を参照。


%index
SystemTimeToTzSpecificLocalTime
協定世界時 (UTC) を指定タイムゾーンに対応するローカル時刻に変換する。
%group
Win32 kernel32
%prm
lpTimeZoneInformation, lpUniversalTime, lpLocalTime
lpTimeZoneInformation : [var] 対象タイムゾーンを指定する TIME_ZONE_INFORMATION 構造体へのポインタ。
lpUniversalTime : [var] 変換する UTC 時刻を指定する SYSTEMTIME 構造体へのポインタ。指定タイムゾーンに対応するローカル時刻に変換される。
lpLocalTime : [var] ローカル時刻を受け取る SYSTEMTIME 構造体へのポインタ。
%inst
協定世界時 (UTC) を指定タイムゾーンに対応するローカル時刻に変換する。

[戻り値]
関数が成功した場合、戻り値は 0 以外で、lpLocalTime が指す SYSTEMTIME
構造体のメンバが適切なローカル時刻値に設定される。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
SystemTimeToTzSpecificLocalTime はローカル時刻に対する夏時間 (DST)
の有効性を考慮する。次の条件下では誤った計算となる可能性がある。
（以下省略）


%index
TerminateJobObject
ジョブに現在関連付けられているすべてのプロセスを終了する。
%group
Win32 kernel32
%prm
hJob, uExitCode
hJob : [intptr] プロセスを終了させるジョブのハンドル。CreateJobObject または OpenJobObject が返す。JOB_OBJECT_TERMINATE アクセス権が必要。詳細は Job Object Security and Access Rights を参照。ジョブオブジェクト内の各プロセスのハンドルには PROCESS_TERMINATE アクセス権が必要。詳細は Process Security and Access Rights を参照。
uExitCode : [int] ジョブオブジェクト内のすべてのプロセス・スレッドが使用する終了コード。各プロセスの終了値は GetExitCodeProcess で、各スレッドの終了値は GetExitCodeThread で取得する。
%inst
ジョブに現在関連付けられているすべてのプロセスを終了する。

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
ジョブに関連付けられたプロセスは終了を遅らせたり処理したりできない。ジョブに関連付けられた各プロセスに対し
TerminateProcess
を呼ぶのと同じである。ネストしたジョブを終了させると、すべての子ジョブオブジェクトも終了する。終了したジョブが使用したリソースは階層内の親ジョブチェーンに加算される。本関数を使うアプリケーションをコンパイルするには
_WIN32_WINNT を 0x0500 以上に定義する。


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
TerminateThread
スレッドを終了する。
%group
Win32 kernel32
%prm
hThread, dwExitCode
hThread : [intptr] 終了するスレッドのハンドル。THREAD_TERMINATE アクセス権が必要。詳細は Thread Security and Access Rights を参照。
dwExitCode : [int] スレッドの終了コード。スレッドの終了値は GetExitCodeThread で取得する。
%inst
スレッドを終了する。

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
TerminateThread
はスレッドを終了させる。これが起こると対象スレッドはユーザーモードコードを実行する機会がない。スレッドにアタッチされた DLL
にスレッド終了は通知されない。システムはスレッドの初期スタックを解放する。Windows Server 2003 と Windows XP
では対象スレッドの初期スタックは解放されずリソースリークとなる。TerminateThread
は危険な関数で、本当に最終手段としてのみ使うべきである。対象スレッドが何をしているかを正確に知り、終了時に対象スレッドが実行している可能性のあるすべてのコードを制御している場合のみ呼ぶべき。たとえば次のような問題を引き起こす。
（以下省略）


%index
Thread32First
システムスナップショット内で見つかった最初のスレッドの情報を取得する。
%group
Win32 kernel32
%prm
hSnapshot, lpte
hSnapshot : [intptr] CreateToolhelp32Snapshot の前回呼び出しから返されたスナップショットへのハンドル。
lpte : [var] THREADENTRY32 構造体へのポインタ。
%inst
システムスナップショット内で見つかった最初のスレッドの情報を取得する。

[戻り値]
スレッドリストの最初のエントリがバッファにコピーされた場合は TRUE、そうでなければ FALSE
を返す。スレッドが存在しないかスナップショットにスレッド情報が含まれない場合、GetLastError は
ERROR_NO_MORE_FILES を返す。

[備考]
呼び出し側アプリケーションは THREADENTRY32 の dwSize メンバに構造体のバイト数を設定する。Thread32First
は dwSize を構造体に書き込んだバイト数に変更する。これは初期 dwSize
の値より大きくなることはなく、小さくなることがある。値が小さい場合、それより大きいオフセットを持つメンバ値に依存しないこと。同一スナップショットに記録された他のスレッド情報を取得するには
Thread32Next を使う。


%index
Thread32Next
システムメモリスナップショット内で見つかった次のスレッドの情報を取得する。
%group
Win32 kernel32
%prm
hSnapshot, lpte
hSnapshot : [intptr] CreateToolhelp32Snapshot の前回呼び出しから返されたスナップショットへのハンドル。
lpte : [var] THREADENTRY32 構造体へのポインタ。
%inst
システムメモリスナップショット内で見つかった次のスレッドの情報を取得する。

[戻り値]
スレッドリストの次のエントリがバッファにコピーされた場合は TRUE、そうでなければ FALSE
を返す。スレッドが存在しないかスナップショットにスレッド情報が含まれない場合、GetLastError は
ERROR_NO_MORE_FILES を返す。

[備考]
スナップショットに記録された最初のスレッド情報を取得するには Thread32First を使う。


%index
TlsAlloc
スレッドローカルストレージ (TLS) インデックスを割り当てる。プロセスの任意のスレッドが、以後そのインデックスを使ってスレッド固有の値を格納・取得できる。各スレッドはそのインデックス用の独自スロットを受け取る。
%group
Win32 kernel32
%prm

%inst
スレッドローカルストレージ (TLS)
インデックスを割り当てる。プロセスの任意のスレッドが、以後そのインデックスを使ってスレッド固有の値を格納・取得できる。各スレッドはそのインデックス用の独自スロットを受け取る。

[戻り値]
関数が成功した場合、戻り値は TLS インデックス。インデックスのスロットは 0 に初期化される。関数が失敗した場合、戻り値は
TLS_OUT_OF_INDEXES。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
Windows Phone 8.1: 本関数は Windows Phone 8.1 以降の Windows Phone
ストアアプリでサポートされる。Windows Phone ストアアプリが本関数を呼ぶと、FlsAlloc
へのインライン呼び出しに置換される。詳細は FlsAlloc を参照。Windows 8.1、Windows Server 2012
R2、Windows 10 version 1507: 本関数は Windows ストアアプリでサポートされる。Windows
ストアアプリが呼ぶと FlsAlloc へのインライン呼び出しに置換される。Windows 10 version 1511 以降:
本関数は UWP アプリで完全にサポートされ、もはや FlsAlloc に置換されない。プロセスのスレッドはその後 TLS インデックスを
TlsFree、TlsSetValue、TlsGetValue で使用できる。TLS インデックスの値は不透明値として扱い、0
起点配列のインデックスとは仮定しないこと。TLS インデックスは通常プロセスや DLL
初期化中に割り当てる。割り当てられた直後、その格納スロットは NULL に初期化される。割り当て後、プロセスの各スレッドはその TLS
スロットへのアクセスにそのインデックスを使える。スレッドは TlsSetValue にインデックスを指定して TLS
スロットに値を格納し、後の TlsGetValue で取り出す。TLS インデックスはプロセス境界を越えて有効ではない。DLL
は、あるプロセスで割り当てられたインデックスが別プロセスで有効と仮定してはならない。


%index
TlsFree
スレッドローカルストレージ (TLS) インデックスを解放し、再利用可能にする。
%group
Win32 kernel32
%prm
dwTlsIndex
dwTlsIndex : [int] TlsAlloc 関数で割り当てられた TLS インデックス。
%inst
スレッドローカルストレージ (TLS) インデックスを解放し、再利用可能にする。

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
Windows Phone 8.1 / Windows 8.1 / Windows Server 2012 R2 / Windows 10
version 1507: 本関数は対応 Windows Phone / Windows ストアアプリでサポートされ、FlsFree
へのインライン呼び出しに置換される。詳細は FlsFree を参照。Windows 10 version 1511 以降: 本関数は
UWP アプリで完全にサポートされ、もはや置換されない。プロセスのスレッドがメモリを割り当ててそのポインタを TLS
スロットに格納している場合、TlsFree を呼ぶ前にメモリを解放するべきである。TlsFree は TLS
スロットに格納されたアドレスのメモリブロックを解放しない。DLL は本関数を DLL_PROCESS_DETACH
中にのみ呼ぶことを想定している。詳細は Thread Local Storage を参照。


%index
TlsGetValue
指定した TLS インデックスについて、呼び出し側スレッドのスレッドローカルストレージ (TLS) スロット内の値を取得する。プロセスの各スレッドは TLS インデックスごとに独自のスロットを持つ。
%group
Win32 kernel32
%prm
dwTlsIndex
dwTlsIndex : [int] TlsAlloc 関数で割り当てられた TLS インデックス。
%inst
指定した TLS インデックスについて、呼び出し側スレッドのスレッドローカルストレージ (TLS)
スロット内の値を取得する。プロセスの各スレッドは TLS インデックスごとに独自のスロットを持つ。

[戻り値]
関数が成功した場合、戻り値は呼び出し側スレッドの TLS スロットに格納された値。dwTlsIndex が TlsAlloc
で正常に割り当てられた有効なインデックスであれば常に成功する。関数が失敗した場合、戻り値は 0。拡張エラー情報を取得するには
GetLastError を呼ぶ。TLS スロットに格納されたデータは、初期値のままであるか TlsSetValue で 0
を格納された場合、0 となる。よって戻り値が 0 のときは関数が失敗したと判断する前に GetLastError が
ERROR_SUCCESS を返すか確認する必要がある。失敗を返す関数は通常失敗時のみ SetLastError
を呼ぶが、TlsGetValue は成功時にも SetLastError を呼んでスレッドのラストエラーをクリアする例外で、これにより 0
値の正常取得を判別できる。

[備考]
Windows Phone 8.1 / Windows 8.1 / Windows Server 2012 R2 / Windows 10
version 1507: 本関数は対応 Windows Phone / Windows
ストアアプリでサポートされ、FlsGetValue へのインライン呼び出しに置換される。Windows 10 version 1511
以降: 本関数は UWP アプリで完全にサポートされ、もはや置換されない。TLS インデックスは通常 TlsAlloc によりプロセスや
DLL 初期化中に割り当てられる。割り当て後、プロセスの各スレッドはその TLS
スロットへアクセスするためにそのインデックスを使える。スレッドは TlsSetValue
にインデックスを指定してスロットに値を格納し、後の TlsGetValue で取り出す。TlsGetValue
は速度を最優先に実装されている。本関数はパラメータ検証とエラーチェックを最小限しか行わず、特に dwTlsIndex が 0 から
TLS_MINIMUM_AVAILABLE-1 の範囲内であれば成功する。インデックスが有効であり、TlsGetValue
を呼ぶ前にスレッドが TlsSetValue を呼んでいることを確認するのはプログラマの責任である。


%index
TlsSetValue
指定した TLS インデックスについて、呼び出し側スレッドのスレッドローカルストレージ (TLS) スロットに値を格納する。プロセスの各スレッドは TLS インデックスごとに独自のスロットを持つ。
%group
Win32 kernel32
%prm
dwTlsIndex, lpTlsValue
dwTlsIndex : [int] TlsAlloc 関数で割り当てられた TLS インデックス。
lpTlsValue : [intptr] 呼び出し側スレッドのインデックス用 TLS スロットに格納する値。
%inst
指定した TLS インデックスについて、呼び出し側スレッドのスレッドローカルストレージ (TLS)
スロットに値を格納する。プロセスの各スレッドは TLS インデックスごとに独自のスロットを持つ。

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
Windows Phone 8.1 / Windows 8.1 / Windows Server 2012 R2 / Windows 10
version 1507: 本関数は対応 Windows Phone / Windows
ストアアプリでサポートされ、FlsSetValue へのインライン呼び出しに置換される。Windows 10 version 1511
以降: 本関数は UWP アプリで完全にサポートされ、もはや置換されない。TLS インデックスは通常 TlsAlloc によりプロセスや
DLL 初期化中に割り当てられる。割り当てられた直後、格納スロットは NULL に初期化される。割り当て後、プロセスの各スレッドはその
TLS スロットへアクセスするためにそのインデックスを使える。TlsSetValue
は速度を最優先に実装され、パラメータ検証は最小限である。dwTlsIndex が 0 から TLS_MINIMUM_AVAILABLE-1
の範囲内であれば成功する。インデックスが有効であることを確認するのはプログラマの責任である。


%index
Toolhelp32ReadProcessMemory
別のプロセスに割り当てられたメモリをアプリケーション提供のバッファにコピーする。
%group
Win32 kernel32
%prm
th32ProcessID, lpBaseAddress, lpBuffer, cbRead, lpNumberOfBytesRead
th32ProcessID : [int] メモリをコピーするプロセスの識別子。0 を指定すると現在のプロセスのメモリをコピーする。
lpBaseAddress : [intptr] 指定プロセス内の読み取り先ベースアドレス。データ転送前にシステムはベースアドレスから指定サイズまでのすべてのメモリが読み取りアクセス可能か確認し、可能なら処理を続行する。それ以外は失敗する。
lpBuffer : [intptr] 指定プロセスのアドレス空間の内容を受け取るバッファへのポインタ。
cbRead : [int] 指定プロセスから読み取るバイト数。
lpNumberOfBytesRead : [var] 指定バッファにコピーされたバイト数。NULL を指定すると無視される。
%inst
別のプロセスに割り当てられたメモリをアプリケーション提供のバッファにコピーする。

[戻り値]
成功した場合は TRUE を返す。

[備考]
本関数は対象プロセスへのハンドルを開き、読み取り完了後に閉じる。複数回読み取る予定なら ReadProcessMemory
を使う方がよい。


%index
TransactNamedPipe
指定した名前付きパイプにメッセージを書き込む処理と読み取る処理を、単一の操作として組み合わせる。
%group
Win32 kernel32
%prm
hNamedPipe, lpInBuffer, nInBufferSize, lpOutBuffer, nOutBufferSize, lpBytesRead, lpOverlapped
hNamedPipe : [intptr] CreateNamedPipe または CreateFile が返した名前付きパイプのハンドル。
lpInBuffer : [intptr] パイプに書き込むデータを含むバッファへのポインタ。
nInBufferSize : [int] 入力バッファのサイズ（バイト単位）。
lpOutBuffer : [intptr] パイプから読み取ったデータを受け取るバッファへのポインタ。
nOutBufferSize : [int] 出力バッファのサイズ（バイト単位）。
lpBytesRead : [var] パイプから読み取ったバイト数を受け取る変数へのポインタ。
lpOverlapped : [var] OVERLAPPED 構造体へのポインタ。hNamedPipe が FILE_FLAG_OVERLAPPED で開かれていれば本構造体は必須である。
%inst
指定した名前付きパイプにメッセージを書き込む処理と読み取る処理を、単一の操作として組み合わせる。

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼ぶ。読み取るメッセージが nOutBufferSize より長い場合、TransactNamedPipe は
FALSE を返し GetLastError は ERROR_MORE_DATA を返す。残りは ReadFile /
ReadFileEx / PeekNamedPipe で読み取れる。

[備考]

サーバがメッセージタイプパイプとして作成していないか、パイプハンドルがメッセージ読み取りモードでない場合、TransactNamedPipe
は失敗する。たとえばクライアントがサーバと同一マシンで動作し \\.\pipe\pipename 形式でパイプを開くと、NPFS
によりバイトモードで開かれる。\\server\pipe\pipename
形式を使うとリダイレクタはメッセージモードで開く。バイトモードのハンドルは SetNamedPipeHandleState
でメッセージ読み取りモードに変更できる。本関数は lpOutBuffer
指定バッファにデータが書き込まれるまで完了できない。lpOverlapped
により呼び出し側スレッドは操作のバックグラウンド実行中に他作業ができる。名前付きパイプトランザクションの最大保証サイズは 64 KB
である。場合によっては 64 KB 超のトランザクションも可能だが、保証されない。よって名前付きパイプトランザクションは 64 KB
以内に制限することを推奨する。Windows 10 version 1709: パイプはアプリコンテナ内、すなわち同じアプリの一部である
UWP プロセス間でのみサポートされる。また名前付きパイプは `\\.\pipe\LOCAL\` 構文を使う必要がある。


%index
TransmitCommChar
指定した通信デバイスの出力バッファ内の保留中データに先立って指定文字を送信する。
%group
Win32 kernel32
%prm
hFile, cChar
hFile : [intptr] 通信デバイスのハンドル。CreateFile 関数が返す。
cChar : [int] 送信する文字。
%inst
指定した通信デバイスの出力バッファ内の保留中データに先立って指定文字を送信する。

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
TransmitCommChar はホストシステムへ割り込み文字 (CTRL+C など)
を送るのに便利である。デバイスが送信中でない場合、TransmitCommChar
を繰り返し呼ぶことはできない。一度文字を出力バッファに置くと、本関数を再度呼ぶ前に送信される必要がある。前の文字がまだ送信されていない場合、TransmitCommChar
はエラーを返す。


%index
TrySubmitThreadpoolCallback
スレッドプールワーカースレッドが指定したコールバック関数を呼び出すことを要求する。
%group
Win32 kernel32
%prm
pfns, pv, pcbe
pfns : [int] コールバック関数。詳細は SimpleCallback を参照。
pv : [intptr] コールバック関数に渡す省略可能なアプリケーション定義データ。
pcbe : [var] コールバック関数を実行する環境を定義する TP_CALLBACK_ENVIRON 構造体へのポインタ。本関数を呼ぶ前に InitializeThreadpoolEnvironment で初期化する。NULL を指定すると既定のコールバック環境で実行される。詳細は InitializeThreadpoolEnvironment を参照。
%inst
スレッドプールワーカースレッドが指定したコールバック関数を呼び出すことを要求する。

[戻り値]
関数が成功した場合、TRUE を返す。関数が失敗した場合、FALSE を返す。拡張エラー情報を取得するには GetLastError
を呼ぶ。

[備考]
本関数を使うアプリケーションをコンパイルするには _WIN32_WINNT を 0x0600 以上に定義する。


%index
TzSpecificLocalTimeToSystemTime
ローカル時刻を協定世界時 (UTC) に変換する。
%group
Win32 kernel32
%prm
lpTimeZoneInformation, lpLocalTime, lpUniversalTime
lpTimeZoneInformation : [var] lpLocalTime のタイムゾーンを指定する TIME_ZONE_INFORMATION 構造体へのポインタ。NULL の場合、現在アクティブなタイムゾーンを使う。
lpLocalTime : [var] 変換するローカル時刻を指定する SYSTEMTIME 構造体へのポインタ。対応する UTC 時刻に変換される。
lpUniversalTime : [var] UTC 時刻を受け取る SYSTEMTIME 構造体へのポインタ。
%inst
ローカル時刻を協定世界時 (UTC) に変換する。

[戻り値]
関数が成功した場合、戻り値は 0 以外で、lpUniversalTime の SYSTEMTIME
構造体メンバが適切な値に設定される。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには GetLastError
を呼ぶ。

[備考]
TzSpecificLocalTimeToSystemTime は変換対象のローカル時刻に対する夏時間 (DST) の有効性を考慮する。


%index
UmsThreadYield
呼び出し側 UMS ワーカースレッドが動作している UMS スケジューラスレッドに制御を譲る。
%group
Win32 kernel32
%prm
SchedulerParam
SchedulerParam : [intptr] スケジューラスレッドの UmsSchedulerProc 関数に渡すパラメータ。
%inst
呼び出し側 UMS ワーカースレッドが動作している UMS スケジューラスレッドに制御を譲る。

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
UMS ワーカースレッドは UmsThreadYield を呼ぶことで、自身が動作している UMS
スケジューラスレッドへ協調的に制御を譲る。UMS ワーカースレッドが UmsThreadYield
を呼ばない場合、ワーカースレッドはブロックされるか終了されるまで動作する。制御がスケジューラスレッドへ切り替わると、システムは
UmsSchedulerThreadYield 理由と、ワーカースレッドが UmsThreadYield 呼び出しで指定した
ScheduleParam
とともに、関連するスケジューラエントリポイント関数を呼ぶ。アプリケーションのスケジューラはワーカースレッドの再スケジュールを担当する。


%index
UnlockFile
開いているファイル内の領域をアンロックする。
%group
Win32 kernel32
%prm
hFile, dwFileOffsetLow, dwFileOffsetHigh, nNumberOfBytesToUnlockLow, nNumberOfBytesToUnlockHigh
hFile : [intptr] LockFile でロックされた領域を含むファイルのハンドル。GENERIC_READ または GENERIC_WRITE アクセス権で作成されている必要がある。詳細は File Security and Access Rights を参照。
dwFileOffsetLow : [int] ロックされた領域が始まるファイル内オフセットの下位ワード。
dwFileOffsetHigh : [int] ロックされた領域が始まるファイル内オフセットの上位ワード。
nNumberOfBytesToUnlockLow : [int] アンロックするバイト範囲の長さの下位ワード。
nNumberOfBytesToUnlockHigh : [int] アンロックするバイト範囲の長さの上位ワード。
%inst
開いているファイル内の領域をアンロックする。

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]

本関数は常に同期的に動作するが、ファイルハンドルに完了ポートが関連付けられていても完了エントリをキューに入れないことがある。ファイルの領域をアンロックすると、以前取得したロックが解放される。アンロックする領域は既存のロック領域と完全に一致する必要がある。隣接する
2
領域を別々にロックして、両方をまたぐ単一領域でアンロックすることはできない。プロセスがファイルの一部をロックしたまま終了したり未解放ロックを持ったままファイルを閉じた場合、OS
がアンロックする。ただしアンロックに要する時間は利用可能なシステムリソースに依存するため、終了時にはプロセスが明示的にすべてのロックを解放することを推奨する。Windows
8 と Windows Server 2012 では本関数は次の技術によりサポートされる。
（以下省略）


%index
UnlockFileEx
指定したファイル内の領域をアンロックする。本関数は同期・非同期のどちらでも動作できる。
%group
Win32 kernel32
%prm
hFile, dwReserved, nNumberOfBytesToUnlockLow, nNumberOfBytesToUnlockHigh, lpOverlapped
hFile : [intptr] ファイルのハンドル。GENERIC_READ または GENERIC_WRITE アクセス権で作成されている必要がある。詳細は File Security and Access Rights を参照。
dwReserved : [int] 予約パラメータ。0 でなければならない。
nNumberOfBytesToUnlockLow : [int] アンロックするバイト範囲の長さの下位部分。
nNumberOfBytesToUnlockHigh : [int] アンロックするバイト範囲の長さの上位部分。
lpOverlapped : [var] アンロック要求に使う OVERLAPPED 構造体へのポインタ。アンロック範囲の先頭ファイルオフセットを含む。hEvent メンバには有効なハンドルか 0 を初期化する。詳細は Synchronous and Asynchronous I/O を参照。
%inst
指定したファイル内の領域をアンロックする。本関数は同期・非同期のどちらでも動作できる。

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 または NULL となる。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
ファイル領域をアンロックすると以前取得したロックが解放される。アンロック領域は既存ロック領域と完全に一致する必要がある。隣接する 2
領域を別々にロックして両方をまたぐ単一領域でアンロックすることはできない。ロックは CloseHandle
の処理完了前に解放される。Windows 8 と Windows Server 2012 では本関数は次の技術によりサポートされる。
（以下省略）


%index
UnmapViewOfFile
ファイルのマップビューを呼び出し側プロセスのアドレス空間からアンマップする。
%group
Win32 kernel32
%prm
lpBaseAddress
lpBaseAddress : [int] アンマップするマップビューのベースアドレスへのポインタ。MapViewOfFile または MapViewOfFileEx の前回呼び出しが返した値と同一でなければならない。
%inst
ファイルのマップビューを呼び出し側プロセスのアドレス空間からアンマップする。

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]

ファイルのマップビューをアンマップすると、ビューがプロセスのアドレス空間内で占めていた範囲が無効化され、その範囲が他の割り当てに利用可能になる。アンマップされた仮想ページごとにプロセスワーキングセットエントリが削除され、プロセスのワーキングセットサイズが減少する。対応する物理ページの共有カウントもデクリメントされる。アンマップされたビュー内の変更されたページは、共有カウントが
0
になるまで、つまりそのページを共有するすべてのプロセスのワーキングセットからアンマップまたはトリミングされるまでディスクに書き込まれない。それでも遅延書き込みされるため、変更はメモリにキャッシュされ後にディスクに書き込まれる場合がある。電源障害やシステムクラッシュによるデータ損失リスクを最小化するには、アプリケーションが
FlushViewOfFile
で明示的に変更ページをフラッシュするべきである。アプリケーションはファイルマッピングオブジェクト作成に使ったハンドルを閉じることができるが、システムは最後のビューがアンマップされるまで対応するファイルを開いた状態に保つ。最後のビューがアンマップされていないファイルは共有制限なしで開かれる。Windows
Server 2012 では本関数は次の技術によりサポートされる。
（以下省略）


%index
UnregisterApplicationRecoveryCallback
アプリケーションのアクティブなインスタンスを復旧リストから削除する。
%group
Win32 kernel32
%prm

%inst
アプリケーションのアクティブなインスタンスを復旧リストから削除する。

[戻り値]
成功した場合は S_OK、または次のいずれかのエラーコードを返す。
（以下省略）

[備考]
終了前に本関数を呼ぶ必要はない。データを復旧しないことを選んだ場合のみ登録を解除する必要がある。


%index
UnregisterApplicationRestart
アプリケーションのアクティブなインスタンスを再起動リストから削除する。
%group
Win32 kernel32
%prm

%inst
アプリケーションのアクティブなインスタンスを再起動リストから削除する。

[戻り値]
成功した場合は S_OK、または次のいずれかのエラーコードを返す。
（以下省略）

[備考]

終了前に本関数を呼ぶ必要はない。アプリケーションを再起動しないことを選んだ場合のみ登録を解除する必要がある。たとえば破損状態に陥り再起動しても失敗するであろう場合に登録を解除できる。アプリケーションが異常終了する前に本関数を呼ぶ必要がある。


%index
UnregisterBadMemoryNotification
指定した不良メモリ通知ハンドルを閉じる。
%group
Win32 kernel32
%prm
RegistrationHandle
RegistrationHandle : [intptr] RegisterBadMemoryNotification 関数から返された登録ハンドル。
%inst
指定した不良メモリ通知ハンドルを閉じる。

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
本関数を呼ぶアプリケーションをコンパイルするには _WIN32_WINNT を _WIN32_WINNT_WIN8 以上に定義する。詳細は
Using the Windows Headers を参照。


%index
UnregisterWait
RegisterWaitForSingleObject 関数で発行された登録済み待機操作をキャンセルする。(UnregisterWait)
%group
Win32 kernel32
%prm
WaitHandle
WaitHandle : [intptr] 待機ハンドル。RegisterWaitForSingleObject 関数が返す。
%inst
RegisterWaitForSingleObject 関数で発行された登録済み待機操作をキャンセルする。(UnregisterWait)

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
UnregisterWait 呼び出し時にタイマに関連付けられた完了していないコールバック関数があると、UnregisterWait
はそのコールバック関数の待機を登録解除し、ERROR_IO_PENDING
エラーコードで失敗する。このエラーコードは関数が失敗したことを示すものではなく、再度呼び出す必要はない。アンレジスタ操作が失敗した場合のみエラーコードが必要なら
UnregisterWaitEx を使う。本関数を使うアプリケーションをコンパイルするには _WIN32_WINNT を 0x0500
以上に定義する。


%index
UnregisterWaitEx
RegisterWaitForSingleObject 関数で発行された登録済み待機操作をキャンセルする。
%group
Win32 kernel32
%prm
WaitHandle, CompletionEvent
WaitHandle : [intptr] 待機ハンドル。RegisterWaitForSingleObject 関数が返す。
CompletionEvent : [intptr] 待機操作の登録解除完了時にシグナル状態にするイベントオブジェクトのハンドル。**NULL** を指定できる。**INVALID_HANDLE_VALUE** を指定すると、本関数はすべてのコールバック関数の完了を待ってから戻る。**NULL** を指定すると、本関数はタイマを削除対象としてマークし即座に戻る。ただし、後始末のためコールバック完了を待つのが推奨される。呼び出し側がこのイベントを提供して関数が成功または **ERROR_IO_PENDING** で失敗した場合、シグナル状態になるまでイベントを閉じてはならない。
%inst
RegisterWaitForSingleObject 関数で発行された登録済み待機操作をキャンセルする。

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
**GetLastError** を呼ぶ。

[備考]
同じ待機操作のコールバック関数内から **UnregisterWaitEx**
へのブロッキング呼び出しはできない。さもなければコールバックが自身の完了を待つことになる。一般にブロッキング呼び出しは現在のスレッドとコールバックの間に依存関係を作るため、別の待機操作にブロッキング登録解除を行う場合、コールバック関数同士に依存関係がなく、第
2 の待機操作が第 1 の操作にブロッキング登録解除を行わないことを確認する必要がある。永続スレッド上でブロッキング
**UnregisterWaitEx** を呼ぶ際は注意。WT_EXECUTEINPERSISTENTTHREAD
で作成された待機操作の登録解除はデッドロックを引き起こす可能性がある。非ブロッキング **UnregisterWaitEx**
呼び出し後、WaitHandle
に関連付けられた新しいコールバック関数はキューイングできない。ただしワーカースレッドに既にキューイングされた保留中コールバックがある可能性はある。一定の条件下では
CompletionEvent が NULL のとき関数は ERROR_IO_PENDING
で失敗する。これはコールバックが残っており実行中または実行待ちであることを示す。CompletionEvent
が呼び出し側のイベントハンドルの場合、関数は成功・ERROR_IO_PENDING
で失敗・他のエラーコードで失敗のいずれかとなる。成功または ERROR_IO_PENDING
の場合は常にシグナル状態を待ってからイベントを閉じる必要がある。本関数を使うアプリケーションをコンパイルするには _WIN32_WINNT
を 0x0500 以上に定義する。


%index
UnregisterWaitUntilOOBECompleted
RegisterWaitUntilOOBECompleted で登録したコールバックを登録解除する。
%group
Win32 kernel32
%prm
WaitHandle
WaitHandle : [intptr] 登録解除するハンドル。
%inst
RegisterWaitUntilOOBECompleted で登録したコールバックを登録解除する。

[戻り値]
コールバックが正常に登録解除された場合は TRUE、それ以外は FALSE を返す。FALSE の場合、GetLastError
で拡張エラー情報を取得できる。


%index
UpdateCalendarDayOfWeek
非推奨。指定日付に対応する曜日を取得し、指定 CALDATETIME 構造体の DayOfWeek メンバにその値を設定する。
%group
Win32 kernel32
%prm
lpCalDateTime
lpCalDateTime : [var] 曜日を設定する日付を含む CALDATETIME 構造体へのポインタ。
%inst
非推奨。指定日付に対応する曜日を取得し、指定 CALDATETIME 構造体の DayOfWeek メンバにその値を設定する。

[戻り値]
成功した場合は **TRUE**、それ以外は **FALSE** を返す。拡張エラー情報を取得するには GetLastError
を呼ぶ。次のエラーコードが返ることがある: ERROR_DATE_OUT_OF_RANGE
(指定日付が範囲外)、ERROR_INVALID_PARAMETER (パラメータ値が無効)。

[備考]
本関数には対応するヘッダファイルやライブラリファイルがない。アプリケーションは LoadLibrary に DLL 名
(Kernel32.dll) を指定してモジュールハンドルを取得し、そのハンドルと本関数名を GetProcAddress
に渡して関数アドレスを取得できる。


%index
UpdateResourceW
ポータブル実行ファイル (PE) のリソースを追加・削除・置換する。(Unicode)
%group
Win32 kernel32
%prm
hUpdate, lpType, lpName, wLanguage, lpData, cb
hUpdate : [intptr] 型: HANDLE BeginUpdateResource が返したモジュールハンドル。更新対象ファイルを参照する。
lpType : [wstr] 型: LPCTSTR 更新対象のリソース型。ポインタの代わりに MAKEINTRESOURCE(ID) を指定でき、ここで ID は定義済みリソース型を表す整数値。文字列の先頭がポンド記号 (#) の場合、残りの文字はリソース型整数識別子を指定する 10 進数を表す。たとえば "#258" は識別子 258 を表す。定義済みリソース型一覧は Resource Types を参照。
lpName : [wstr] 型: LPCTSTR 更新対象リソースの名前。ポインタの代わりに MAKEINTRESOURCE(ID) を指定でき、ここで ID はリソース ID。新規リソース作成時は本パラメータに '#' で始まる文字列を使ってはならない。
wLanguage : [int] 型: WORD 更新対象リソースの言語識別子。プライマリ言語識別子・サブ言語識別子の一覧は MAKELANGID マクロを参照。
lpData : [intptr] 型: LPVOID hUpdate が示すファイルに挿入するリソースデータ。リソースが定義済み型の一つの場合、データは有効で適切に整列されている必要がある。これは LoadIcon、LoadString などのリソース固有ロード関数が提供するデータではなく、ファイルに格納する生のバイナリデータである。文字列やテキストを含むデータはすべて Unicode 形式でなければならない。lpData は ANSI データを指してはならない。
cb : [int] 型: DWORD lpData のリソースデータのバイト数。
%inst
ポータブル実行ファイル (PE) のリソースを追加・削除・置換する。(Unicode)

[戻り値]
型: BOOL 成功した場合は TRUE、それ以外は FALSE を返す。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
本関数を呼ぶ前にリソースファイルをロードしないことを推奨する。ただし既にロードされていてもエラーとはならない。アプリケーションは
UpdateResource
を繰り返し呼んでリソースデータを変更できる。各呼び出しは内部の追加・削除・置換リストに加わるが、実際にはデータをファイルに書き込まない。蓄積された変更をファイルに書き込むには
EndUpdateResource
を呼ぶ必要がある。本関数はコードとリソースの両方を含むモジュール内のリソースを更新できる。Windows 7 より前: lpData が
NULL で cbData が非ゼロの場合、指定リソースは削除されず例外がスローされる。Windows Vista 以降:
上記の通り、RC Config データを含む LN ファイル・.mui ファイルにおけるリソース更新には制限がある。
（以下省略）


%index
VerLanguageNameW
指定したバイナリ Microsoft 言語識別子に関連付けられた言語の説明文字列を取得する。(Unicode)
%group
Win32 kernel32
%prm
wLang, szLang, cchLang
wLang : [int] 型: DWORD バイナリ言語識別子。完全な言語識別子一覧は Language Identifiers を参照。たとえば言語識別子 0x040A に関連付けられた説明文字列は "Spanish (Traditional Sort)" である。識別子が不明な場合、szLang は既定の文字列 ("Language Neutral") を指す。
szLang : [wstr] 型: LPTSTR wLang パラメータが指定する言語。
cchLang : [int] 型: DWORD szLang が指すバッファのサイズ（文字単位）。
%inst
指定したバイナリ Microsoft 言語識別子に関連付けられた言語の説明文字列を取得する。(Unicode)

[戻り値]
型: DWORD 戻り値はバッファに返される文字列のサイズ（文字単位）。終端 NULL
は含まない。説明文字列がバッファ以下の場合、説明文字列全体がバッファに入る。バッファより大きい場合は切り詰められる。エラー発生時は 0
を返す。不明な言語識別子はエラーとならない。

[備考]
本関数は 16/32/64 ビットのファイルイメージで動作する。通常、インストーラは VerQueryValue
が返す言語識別子を翻訳するために本関数を使う。テキスト文字列は言語競合発生時にユーザーへ進行方法を尋ねるダイアログで使うことができる。
> [!NOTE] > winver.h ヘッダは VerLanguageName を、UNICODE プリプロセッサ定数の有無により
ANSI/Unicode
版を自動選択するエイリアスとして定義する。エンコーディング中立なエイリアスをエンコーディング非中立なコードと混在させると、コンパイル時/実行時エラーを引き起こす不一致を生む可能性がある。詳細は
Conventions for Function Prototypes を参照。


%index
VerifyScripts
2 つの列挙されたスクリプトリストを比較する。
%group
Win32 kernel32
%prm
dwFlags, lpLocaleScripts, cchLocaleScripts, lpTestScripts, cchTestScripts
dwFlags : [int] スクリプト検証オプションを指定するフラグ。
lpLocaleScripts : [wstr] ロケールリストへのポインタ。GetLocaleInfoEx を LCType に LOCALE_SSCRIPTS で呼び出すと得られる、対象ロケール用のスクリプト列挙リスト。
cchLocaleScripts : [int] lpLocaleScripts が示す文字列のサイズ（文字単位）。NULL 終端文字列なら -1 を指定する。0 を指定すると関数は失敗する。
lpTestScripts : [wstr] テストリストへのポインタ。GetStringScripts で得られる、もう一つのスクリプト列挙リスト。
cchTestScripts : [int] lpTestScripts が示す文字列のサイズ（文字単位）。NULL 終端文字列なら -1 を指定する。0 を指定すると関数は失敗する。
%inst
2 つの列挙されたスクリプトリストを比較する。

[戻り値]
テストリストが空でなく、その全項目がロケールリストにも含まれる場合、TRUE
を返す。ロケールリストにテストリストより多くのスクリプトが含まれていても、テストリストの全項目がロケールリストに含まれていれば TRUE
を返す。dwFlags に VS_ALLOW_LATIN を指定した場合、関数は "Latn;"
が常にロケールリストに含まれているかのように動作する。それ以外は FALSE を返す。FALSE
はテストリストにロケールリストにない項目があることを示すか、エラーを示す可能性がある。区別するには GetLastError
を呼ぶ。次のいずれかのエラーコードが返ることがある。
（以下省略）

[備考]
本関数は "Latn;Cyrl;" のような 4 文字スクリプト名 + セミコロンの並びからなる文字列を比較する。Latin
スクリプトは多くの言語・ロケールで非ネイティブとして使われる事実を考慮した特例も持つ。本関数は国際化ドメイン名 (IDN)
に関連するセキュリティ問題を緩和する戦略の一部として有用である。テストリストに終端セミコロンがない (不正な文字列)
ケースや空リストの例も含めた様々なシナリオでの戻り値と GetLastError の例を以下に示す。
（以下省略）


%index
VerifyVersionInfoW
OS バージョン要件のセットを、現在実行中のシステムバージョンの対応値と比較する。(Unicode)
%group
Win32 kernel32
%prm
lpVersionInformation, dwTypeMask, dwlConditionMask
lpVersionInformation : [var] 比較する OS バージョン要件を含む OSVERSIONINFOEX 構造体へのポインタ。dwTypeMask は本構造体のうち比較情報を含むメンバを示す。
dwTypeMask : [int] 比較する OSVERSIONINFOEX のメンバを示すマスク。
dwlConditionMask : [int64] 比較対象 lpVersionInfo メンバごとに使う比較種別。比較する各 OSVERSIONINFOEX メンバについて VerSetConditionMask 関数または VER_SET_CONDITION マクロを呼んで構築する。
%inst
OS バージョン要件のセットを、現在実行中のシステムバージョンの対応値と比較する。(Unicode)

[戻り値]
現在実行中の OS が指定要件を満たす場合、戻り値は非ゼロ。満たさない場合は 0 となり GetLastError は
ERROR_OLD_WIN_VERSION を返す。関数自体が失敗した場合は 0 となり GetLastError は
ERROR_OLD_WIN_VERSION 以外のエラーコードを返す。

[備考]
VerifyVersionInfo は現在実行中の OS のバージョン情報を取得し、lpVersionInfo
の有効メンバと比較する。これにより必要な OS バージョン条件の存在を簡単に判定できる。GetVersionEx
を呼んで自前で比較するよりも VerifyVersionInfo の使用を推奨する。通常 VerifyVersionInfo
は指定テストがすべて成功した場合のみ非ゼロを返す。ただしメジャー・マイナー・サービスパックバージョンは OS
バージョンがこれらの組み合わせなので階層的にテストされる。メジャーバージョンに条件があれば、それがマイナー・SP
の条件より優先される。(メジャー > 5 かつマイナー <= 1 のテストはできず、関数はメジャーで >= 演算しているのでマイナー >
1 への要求に変える)。テスト順序はメジャー、マイナー、SP。値が等しい間はテストを続け、条件を満たさない値で停止する。たとえば 5.1
SP1 以上をテストし、現在が 6.0 ならメジャーが大きいので成功 (テスト停止)。同様に 5.1 SP1 以上をテストし、現在が
5.2 ならマイナーが大きいので成功 (テスト停止)。一方 5.1 SP1 以上をテストし、現在が 5.0 SP2
ならマイナーが小さいので失敗 (テスト停止)。バージョン範囲を検証するには VerifyVersionInfo を 2 回呼ぶ。たとえば
5.0 < システムバージョン <= 5.1 を検証するには、まず major=5 / minor>0 をテストし、次に major=5
/ minor<=1 をテストする。OS を識別することは、特定の OS 機能の存在を判定する最良の方法ではないことが多い。OS
は再配布可能な DLL に新機能を追加することがあるためである。GetVersionEx で OS
プラットフォームやバージョン番号を判定する代わりに、機能自体の存在をテストすること。詳細は Operating System
Version を参照。Media Center 版か Tablet PC 版かを検証するには GetSystemMetrics を呼ぶ。
（以下省略）


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
VirtualAllocEx
指定したプロセスの仮想アドレス空間内のメモリ領域を予約・コミット・状態変更する。割り当てたメモリは 0 に初期化される。(VirtualAllocEx)
%group
Win32 kernel32
%prm
hProcess, lpAddress, dwSize, flAllocationType, flProtect
hProcess : [intptr] プロセスのハンドル。本関数はそのプロセスの仮想アドレス空間内にメモリを割り当てる。ハンドルは PROCESS_VM_OPERATION アクセス権を持つ必要がある。詳細は Process Security and Access Rights を参照。
lpAddress : [intptr] 割り当てるページ領域の希望開始アドレスを指定するポインタ。メモリを予約する場合は割り当て粒度の倍数に切り下げられる。既に予約済みのメモリをコミットする場合は最寄りのページ境界に切り下げられる。ページサイズと割り当て粒度を調べるには GetSystemInfo を使う。lpAddress が NULL の場合、関数が割り当て位置を決定する。InitializeEnclave で初期化していないエンクレーブ内のアドレスを指定すると、VirtualAllocEx はそのアドレスにゼロのページを割り当てる。ページは事前に未コミットでなければならず、Intel SGX の EEXTEND 命令で計測されない。初期化済みエンクレーブ内のアドレスを指定すると、ERROR_INVALID_ADDRESS で失敗する。これは動的メモリ管理をサポートしないエンクレーブ (SGX1) で真である。SGX2 エンクレーブでは割り当てが許可され、割り当て後にエンクレーブが受理する必要がある。
dwSize : [int] 割り当てるメモリ領域のサイズ（バイト単位）。lpAddress が NULL の場合、関数は dwSize を次のページ境界に切り上げる。lpAddress が NULL でない場合、lpAddress から lpAddress+dwSize の範囲に 1 バイト以上を含むすべてのページが割り当てられる。たとえばページ境界をまたぐ 2 バイト範囲は両方のページを割り当てさせる。
flAllocationType : [int] 
flProtect : [int] 割り当てるページ領域のメモリ保護。コミットする場合、メモリ保護定数のいずれかを指定できる。
%inst
指定したプロセスの仮想アドレス空間内のメモリ領域を予約・コミット・状態変更する。割り当てたメモリは 0
に初期化される。(VirtualAllocEx)

[戻り値]
関数が成功した場合、戻り値は割り当てられたページ領域のベースアドレス。関数が失敗した場合、戻り値は NULL。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
各ページは関連するページ状態を持つ。VirtualAllocEx は次の操作を実行できる。
（以下省略）


%index
VirtualAllocExNuma
指定したプロセスの仮想アドレス空間内のメモリ領域を予約・コミット・状態変更し、物理メモリ用の NUMA ノードを指定する。
%group
Win32 kernel32
%prm
hProcess, lpAddress, dwSize, flAllocationType, flProtect, nndPreferred
hProcess : [intptr] プロセスのハンドル。本関数はそのプロセスの仮想アドレス空間内にメモリを割り当てる。ハンドルは PROCESS_VM_OPERATION アクセス権を持つ必要がある。詳細は Process Security and Access Rights を参照。
lpAddress : [intptr] 割り当てるページ領域の希望開始アドレスを指定するポインタ。予約時は割り当て粒度の倍数に、コミット時はページ境界に切り下げられる。NULL の場合、関数が割り当て位置を決定する。
dwSize : [int] 割り当てるメモリ領域のサイズ（バイト単位）。lpAddress が NULL の場合、関数は dwSize を次のページ境界に切り上げる。NULL でない場合は lpAddress から lpAddress+dwSize の範囲に 1 バイト以上を含むすべてのページを割り当てる。
flAllocationType : [int] 
flProtect : [int] 割り当てるページ領域のメモリ保護。コミットする場合、メモリ保護定数のいずれかを指定できる。ページ保護時に指定する保護属性は割り当て時に指定したものと矛盾してはならない。
nndPreferred : [int] 物理メモリを配置する NUMA ノード。新しい VA 領域 (コミット済み・予約済みのいずれか) の割り当て時のみ使われる。既存領域内のページコミットには無視される。
%inst
指定したプロセスの仮想アドレス空間内のメモリ領域を予約・コミット・状態変更し、物理メモリ用の NUMA ノードを指定する。

[戻り値]
関数が成功した場合、戻り値は割り当てられたページ領域のベースアドレス。関数が失敗した場合、戻り値は NULL。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
各ページは関連するページ状態を持つ。VirtualAllocExNuma は次の操作を実行できる。
（以下省略）


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
VirtualFreeEx
指定したプロセスの仮想アドレス空間内のメモリ領域を解放、コミット解除、または解放とコミット解除の両方を行う。
%group
Win32 kernel32
%prm
hProcess, lpAddress, dwSize, dwFreeType
hProcess : [intptr] プロセスのハンドル。本関数はそのプロセスの仮想アドレス空間内のメモリを解放する。ハンドルは PROCESS_VM_OPERATION アクセス権を持つ必要がある。詳細は Process Security and Access Rights を参照。
lpAddress : [intptr] 解放するメモリ領域の開始アドレスへのポインタ。dwFreeType が MEM_RELEASE の場合、lpAddress は領域予約時に VirtualAllocEx が返したベースアドレスでなければならない。
dwSize : [int] 解放するメモリ領域のサイズ（バイト単位）。
dwFreeType : [int] 
%inst
指定したプロセスの仮想アドレス空間内のメモリ領域を解放、コミット解除、または解放とコミット解除の両方を行う。

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
プロセス仮想アドレス空間内の各メモリページはページ状態を持つ。VirtualFreeEx
はコミット済み・未コミットの混在状態のページ範囲のコミットを解除できる。これにより各ページの現在のコミット状態を事前に判定せずに範囲全体のコミットを解除できる。ページのコミット解除はその物理ストレージ
(メモリまたはディスク上のページファイル) を解放する。コミット解除されたが解放されていないページの状態は予約状態に変わる。後に
VirtualAllocEx でコミットしたり、VirtualFreeEx
で解放できる。予約ページからの読み書き試行はアクセス違反例外となる。VirtualFreeEx
は予約・コミット混在の領域も解放できる。VirtualAllocEx
で予約された領域全体は同時に解放されなければならない。解放されたページの状態は free
に変わり、以後の割り当て操作で利用可能となる。メモリが解放またはコミット解除された後はそのメモリを参照してはならず、その情報は永久に失われる。フリーページからの読み書き試行はアクセス違反例外となる。情報を保持する必要があるならコミット解除や解放を行わないこと。VirtualFreeEx
は AWE
領域でも使用でき、領域のアドレス空間を解放する際に物理ページマッピングを無効化するが、物理ページ自体は削除されずアプリケーションは引き続き使用できる。物理ページを解放するには
FreeUserPhysicalPages
を明示的に呼ぶ必要がある。プロセス終了時にはすべてのリソースが自動的にクリーンアップされる。**Windows 10 version
1709 以降と Windows 11**: エンクレーブを削除するには DeleteEnclave を呼ぶ。VBS エンクレーブは
VirtualFree / VirtualFreeEx では削除できない。SGX エンクレーブは引き続き VirtualFree /
VirtualFreeEx で削除できる。**Windows 10 version 1507/1511/1607/1703**:
エンクレーブを削除するには VirtualFree / VirtualFreeEx を呼び、_lpAddress_
にエンクレーブのベースアドレス、_dwSize_ に 0、_dwFreeType_ に MEM_RELEASE を指定する。


%index
VirtualLock
プロセスの仮想アドレス空間内の指定領域を物理メモリにロックし、その領域への以後のアクセスがページフォールトを起こさないようにする。
%group
Win32 kernel32
%prm
lpAddress, dwSize
lpAddress : [intptr] ロックするページ領域のベースアドレスへのポインタ。
dwSize : [int] ロックする領域のサイズ（バイト単位）。影響を受けるページ範囲には lpAddress から lpAddress+dwSize の範囲に 1 バイト以上を含むすべてのページが含まれる。よってページ境界をまたぐ 2 バイト範囲は両方のページをロックさせる。
%inst
プロセスの仮想アドレス空間内の指定領域を物理メモリにロックし、その領域への以後のアクセスがページフォールトを起こさないようにする。

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
指定領域のすべてのページはコミット済みでなければならない。PAGE_NOACCESS
で保護されたメモリはロックできない。ページを物理メモリにロックすると、利用可能 RAM
が減り他の重要ページがページファイルへスワップされ、システム性能が低下することがある。各 Windows
バージョンはプロセスがロックできるページ最大数の制限を持つ。これは性能劣化を避けるため意図的に小さく設定されている。より多くのページをロックする必要があるアプリケーションは、まず
SetProcessWorkingSetSize
で最小・最大ワーキングセットサイズを増やす必要がある。プロセスがロックできるページの最大数は最小ワーキングセットのページ数から少しのオーバーヘッドを引いた数に等しい。プロセスがロックしたページはアンロックまたはプロセス終了まで物理メモリに残る。これらのページはロック中、ページファイルに書き込まれないことが保証される。ロック領域を解除するには
VirtualUnlock を使う。プロセス終了時にロックは自動解除される。本関数は GlobalLock / LocalLock
とは異なり、ロックカウントの増加やハンドル→ポインタ変換は行わない。仮想ページにロックカウントは存在しないので、領域のアンロックに
VirtualUnlock を複数回呼ぶ必要は決してない。


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
VirtualProtectEx
指定したプロセスの仮想アドレス空間内のコミット済みページ領域の保護を変更する。
%group
Win32 kernel32
%prm
hProcess, lpAddress, dwSize, flNewProtect, lpflOldProtect
hProcess : [intptr] メモリ保護を変更するプロセスのハンドル。**PROCESS_VM_OPERATION** アクセス権が必要。詳細は Process Security and Access Rights を参照。
lpAddress : [intptr] アクセス保護属性を変更するページ領域のベースアドレスへのポインタ。指定領域内の全ページは、VirtualAlloc / VirtualAllocEx を MEM_RESERVE で呼び出して予約された同一予約領域内になければならない。VirtualAlloc / VirtualAllocEx の別呼び出しで予約された隣接予約領域をまたぐことはできない。
dwSize : [int] アクセス保護属性を変更する領域のサイズ（バイト単位）。影響を受けるページ範囲には lpAddress から (lpAddress+dwSize) の範囲に 1 バイト以上を含むすべてのページが含まれる。よってページ境界をまたぐ 2 バイト範囲は両方のページの保護属性を変更させる。
flNewProtect : [int] メモリ保護オプション。メモリ保護定数のいずれかを指定できる。マップビューに対しては、ビューマップ時に指定したアクセス保護と互換性がある必要がある (MapViewOfFile / MapViewOfFileEx / MapViewOfFileExNuma を参照)。
lpflOldProtect : [var] 指定領域内の最初のページの直前アクセス保護を受け取る変数へのポインタ。NULL または有効な変数を指さない場合、関数は失敗する。
%inst
指定したプロセスの仮想アドレス空間内のコミット済みページ領域の保護を変更する。

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]

アクセス保護値はコミット済みページにのみ設定できる。指定領域内のいずれかのページがコミットされていない場合、関数は失敗し、領域内のいずれのページのアクセス保護も変更せずに戻る。**PAGE_GUARD**
保護修飾子はガードページを設定する。ガードページは一度限りのアクセス警報として動作する。詳細は Creating Guard Pages
を参照。GlobalAlloc / HeapAlloc / LocalAlloc で割り当てたメモリブロックの保護を
VirtualProtectEx で変更するのは避けるのがよい。1
ページ上に複数メモリブロックが存在し得るためである。ヒープマネージャはヒープ内全ページが少なくとも読み書きアクセスを許可していると仮定する。実行可能領域として保護する場合、呼び出し側はコード配置後に
FlushInstructionCache
を呼んでキャッシュ整合性を確保する責任を負う。さもなければ新しい実行可能領域からの実行は予測不能な結果を生む可能性がある。


%index
VirtualUnlock
プロセスの仮想アドレス空間内の指定ページ範囲をアンロックし、必要に応じてシステムがそれらのページをページファイルにスワップアウトできるようにする。
%group
Win32 kernel32
%prm
lpAddress, dwSize
lpAddress : [intptr] アンロックするページ領域のベースアドレスへのポインタ。
dwSize : [int] アンロックする領域のサイズ（バイト単位）。影響を受けるページ範囲には lpAddress から (lpAddress+dwSize) の範囲に 1 バイト以上を含むすべてのページが含まれる。よってページ境界をまたぐ 2 バイト範囲は両方のページをアンロックさせる。
%inst

プロセスの仮想アドレス空間内の指定ページ範囲をアンロックし、必要に応じてシステムがそれらのページをページファイルにスワップアウトできるようにする。

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
本関数が成功するためには、指定範囲が VirtualLock
の前回呼び出しに渡された範囲と一致する必要はないが、範囲内のすべてのページがロックされている必要がある。範囲内のいずれかがロックされていない場合、VirtualUnlock
はそれらのページをワーキングセットから削除し、ラストエラーを ERROR_NOT_LOCKED に設定して FALSE
を返す。ロックされていないメモリ範囲に対する VirtualUnlock
呼び出しはプロセスのワーキングセットからそれらのページを解放する。


%index
WTSGetActiveConsoleSessionId
コンソールセッションのセッション識別子を取得する。
%group
Win32 kernel32
%prm

%inst
コンソールセッションのセッション識別子を取得する。

[戻り値]
物理コンソールにアタッチされているセッションのセッション識別子。物理コンソールにアタッチされたセッションがない場合
(たとえば物理コンソールセッションがアタッチ・デタッチ中) は、0xFFFFFFFF を返す。

[備考]
本関数が返すセッション識別子は現在の物理コンソールセッションの識別子である。現在の物理コンソールセッションの状態を監視するには
WTSRegisterSessionNotification を使う。


%index
WaitCommEvent
指定した通信デバイスでイベントが発生するのを待機する。本関数が監視するイベントセットはデバイスハンドルに関連付けられたイベントマスクに含まれる。
%group
Win32 kernel32
%prm
hFile, lpEvtMask, lpOverlapped
hFile : [intptr] 通信デバイスのハンドル。CreateFile 関数が返す。
lpEvtMask : [var] 
lpOverlapped : [var] OVERLAPPED 構造体へのポインタ。hFile が FILE_FLAG_OVERLAPPED で開かれていれば必須である。
%inst

指定した通信デバイスでイベントが発生するのを待機する。本関数が監視するイベントセットはデバイスハンドルに関連付けられたイベントマスクに含まれる。

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
WaitCommEvent は指定通信リソースに対するイベントセットを監視する。通信リソースの現在のイベントマスクを設定・取得するには
SetCommMask / GetCommMask を使う。オーバーラップ操作が即座に完了できない場合、関数は FALSE を返し
GetLastError は ERROR_IO_PENDING を返してバックグラウンド実行を示す。この場合、システムは
WaitCommEvent が戻る前に OVERLAPPED の hEvent
メンバを非シグナル状態に設定し、指定イベントまたはエラー発生時にシグナル状態にする。呼び出し側プロセスは待機関数の一つでイベントオブジェクト状態を判定し、GetOverlappedResult
で WaitCommEvent 結果を判定できる。GetOverlappedResult は操作の成否を報告し、lpEvtMask
が指す変数に発生イベントを示す。プロセスがオーバーラップ WaitCommEvent 進行中に SetCommMask
でデバイスハンドルのイベントマスクを変更しようとすると、WaitCommEvent は即座に戻る。lpEvtMask が指す変数は 0
となる。


%index
WaitForDebugEvent
デバッグ対象プロセスでデバッグイベントが発生するのを待機する。(WaitForDebugEvent)
%group
Win32 kernel32
%prm
lpDebugEvent, dwMilliseconds
lpDebugEvent : [var] デバッグイベントの情報を受け取る DEBUG_EVENT 構造体へのポインタ。
dwMilliseconds : [int] デバッグイベントを待機するミリ秒数。0 を指定するとデバッグイベントをテストして即座に戻る。INFINITE を指定するとデバッグイベントが発生するまで戻らない。
%inst
デバッグ対象プロセスでデバッグイベントが発生するのを待機する。(WaitForDebugEvent)

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
デバッグ対象プロセスを作成したスレッドのみ WaitForDebugEvent
を呼び出せる。CREATE_PROCESS_DEBUG_EVENT が発生すると、デバッガアプリは DEBUG_EVENT
構造体内でデバッグ対象プロセスのイメージファイル、プロセス、初期スレッドのハンドルを受け取る。これらは
u.CreateProcessInfo.hFile (イメージ)、u.CreateProcessInfo.hProcess
(プロセス)、u.CreateProcessInfo.hThread (初期スレッド)
で返される。EXIT_PROCESS_DEBUG_EVENT を以前に報告していれば、デバッガが ContinueDebugEvent
を呼んだときシステムはプロセスとスレッドのハンドルを閉じる。デバッガはイメージファイルのハンドルを CloseHandle
で閉じる必要がある。同様に CREATE_THREAD_DEBUG_EVENT 発生時は u.CreateThread.hThread
でスレッドのハンドルを受け取る。EXIT_THREAD_DEBUG_EVENT を以前に報告していれば、デバッガが
ContinueDebugEvent を呼んだときシステムはスレッドハンドルを閉じる。LOAD_DLL_DEBUG_EVENT 発生時は
u.LoadDll.hFile でロード DLL のハンドルを受け取り、デバッガは CloseHandle で閉じる必要がある。警告
WaitForDebugEvent を呼び出すスレッドに非同期プロシージャ呼び出し (APC) をキューイングしないこと。


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
WaitForMultipleObjectsEx
指定したオブジェクトの一つまたはすべてがシグナル状態になるか、I/O 完了ルーチンや非同期プロシージャ呼び出し (APC) がスレッドにキューイングされるか、タイムアウト間隔が経過するまで待機する。
%group
Win32 kernel32
%prm
nCount, lpHandles, bWaitAll, dwMilliseconds, bAlertable
nCount : [int] lpHandles の配列で待機するオブジェクトハンドル数。最大は MAXIMUM_WAIT_OBJECTS。0 を指定できない。
lpHandles : [intptr] オブジェクトハンドルの配列。指定可能なオブジェクト種別は備考を参照。配列には異なる種別のハンドルを混在させてよい。同一ハンドルの複数コピーを含んではならない。
bWaitAll : [int] TRUE の場合、lpHandles 配列内のすべてのオブジェクトの状態がシグナル状態になったとき関数は戻る。FALSE の場合、いずれかのオブジェクトがシグナル状態になったとき戻る。後者の場合、戻り値は関数を戻らせた原因のオブジェクトを示す。
dwMilliseconds : [int] タイムアウト間隔（ミリ秒単位）。非ゼロを指定すると、関数は指定オブジェクトがシグナル状態になるか、I/O 完了ルーチン / APC がキューイングされるか、間隔が経過するまで待機する。0 を指定すると条件未満なら待機状態に入らず即座に戻る。INFINITE を指定するとシグナル状態か I/O 完了ルーチン / APC キューイングまで戻らない。Windows XP/Server 2003/Vista/7/Server 2008/Server 2008 R2 では低電力状態で過ごした時間も dwMilliseconds に含まれる (スリープ中もカウントダウン)。Windows 8/Server 2012/8.1/Server 2012 R2/10/Server 2016 では低電力状態で過ごした時間は含まれない (スリープ中はカウントダウンしない)。
bAlertable : [int] TRUE でスレッドが待機状態の場合、システムが I/O 完了ルーチンや APC をキューイングするとスレッドはそれを実行して関数が戻る。それ以外は戻らず実行もされない。完了ルーチンは ReadFileEx / WriteFileEx の完了時にキューイングされる。bAlertable が TRUE で、呼び出し側スレッドが読み書き操作を開始したスレッドである場合のみ、待機関数は戻り完了ルーチンが呼ばれる。APC は QueueUserAPC でキューイングされる。
%inst
指定したオブジェクトの一つまたはすべてがシグナル状態になるか、I/O 完了ルーチンや非同期プロシージャ呼び出し (APC)
がスレッドにキューイングされるか、タイムアウト間隔が経過するまで待機する。

[戻り値]
関数が成功した場合、戻り値は関数を戻らせた原因のイベントを示す。次のいずれかの値となる (WAIT_OBJECT_0 は
0、WAIT_ABANDONED_0 は 0x00000080L)。
（以下省略）

[備考]
WaitForMultipleObjectsEx
は待機条件が満たされたかを判定する。条件未充足なら、呼び出し側スレッドは条件充足またはタイムアウト経過まで待機状態に入る。bWaitAll
が TRUE
の場合、関数の待機操作はすべてのオブジェクト状態がシグナル状態になったときのみ完了する。すべてのオブジェクトがシグナル状態になるまで状態を変更しない。たとえばミューテックスがシグナル状態になっても、他のオブジェクトもシグナル状態になるまでスレッドはミューテックスの所有権を取得しない。その間に別のスレッドがミューテックスの所有権を取得して非シグナル状態にする可能性がある。bWaitAll
が FALSE の場合、本関数は配列内のハンドルをインデックス 0
から順にチェックし、いずれかのオブジェクトがシグナル状態になるまで続ける。複数オブジェクトが同時にシグナル状態になった場合、関数は配列内で最も小さいインデックスのハンドルを返す。本関数は同期オブジェクトの状態を変更する。状態変更は関数を戻らせた原因のオブジェクトに対してのみ行われる。たとえばセマフォオブジェクトのカウントは
1 減る。詳細は各同期オブジェクトのドキュメントを参照。MAXIMUM_WAIT_OBJECTS
を超えるハンドルを待機するには次の方法を使う。
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
WaitForSingleObjectEx
指定したオブジェクトがシグナル状態になるか、I/O 完了ルーチンや非同期プロシージャ呼び出し (APC) がスレッドにキューイングされるか、タイムアウト間隔が経過するまで待機する。
%group
Win32 kernel32
%prm
hHandle, dwMilliseconds, bAlertable
hHandle : [intptr] オブジェクトのハンドル。指定可能なオブジェクト種別は備考を参照。
dwMilliseconds : [int] タイムアウト間隔（ミリ秒単位）。非ゼロを指定すると、関数はオブジェクトがシグナル状態になるか、I/O 完了ルーチン / APC がキューイングされるか、間隔が経過するまで待機する。0 を指定すると条件未満なら待機状態に入らず即座に戻る。INFINITE を指定するとシグナル状態か I/O 完了ルーチン / APC キューイングまで戻らない。Windows XP～Server 2008 R2 では低電力状態時間も含まれる。Windows 8 以降では含まれない。
bAlertable : [int] TRUE でスレッドが待機状態の場合、システムが I/O 完了ルーチンや APC をキューイングするとスレッドはそれを実行して関数が戻る。それ以外は戻らず実行もされない。完了ルーチンは ReadFileEx / WriteFileEx の完了時にキューイングされる。bAlertable が TRUE で、呼び出し側スレッドが読み書き操作を開始したスレッドである場合のみ、待機関数は戻り完了ルーチンが呼ばれる。APC は QueueUserAPC でキューイングされる。
%inst
指定したオブジェクトがシグナル状態になるか、I/O 完了ルーチンや非同期プロシージャ呼び出し (APC)
がスレッドにキューイングされるか、タイムアウト間隔が経過するまで待機する。

[戻り値]
関数が成功した場合、戻り値は関数を戻らせた原因のイベントを示す。次のいずれかの値となる。
（以下省略）

[備考]
WaitForSingleObjectEx
は待機条件が満たされたかを判定する。条件未充足なら、呼び出し側スレッドは条件充足またはタイムアウト経過まで待機状態に入る。本関数は同期オブジェクトの状態を変更する。状態変更は関数を戻らせた原因のオブジェクトに対してのみ行われる。たとえばセマフォオブジェクトのカウントは
1 減る。WaitForSingleObjectEx は次のオブジェクトを待機できる。
（以下省略）


%index
WaitNamedPipeW
WaitNamedPipeW (Unicode) 関数 (winbase.h) は、タイムアウト経過または指定名前付きパイプのインスタンスが接続可能になるまで待機する。
%group
Win32 kernel32
%prm
lpNamedPipeName, nTimeOut
lpNamedPipeName : [wstr] 名前付きパイプの名前。サーバプロセスが実行されているコンピュータの名前を含む必要がある。パイプがローカルなら servername にピリオドを使える。形式: \\servername\pipe\pipename
nTimeOut : [int] 
%inst
WaitNamedPipeW (Unicode) 関数 (winbase.h)
は、タイムアウト経過または指定名前付きパイプのインスタンスが接続可能になるまで待機する。

[戻り値]
タイムアウト経過前にパイプのインスタンスが利用可能になれば戻り値は 0 以外。利用可能にならなければ 0。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
指定名前付きパイプのインスタンスが存在しない場合、WaitNamedPipe
はタイムアウト値に関係なく即座に戻る。タイムアウトが経過した場合、エラー ERROR_SEM_TIMEOUT
で失敗する。関数が成功すると、プロセスは CreateFile で名前付きパイプのハンドルを開くべきである。TRUE は少なくとも 1
つのパイプインスタンスが利用可能であることを示す。その後の CreateFile
呼び出しは、サーバが閉じたか別クライアントが開いたために失敗することがある。Windows 10 version 1709:
パイプはアプリコンテナ内、すなわち同じアプリの一部である UWP プロセス間でのみサポートされる。また名前付きパイプは
`\\.\pipe\LOCAL\` 構文を使う必要がある。


%index
WerGetFlags
指定したプロセスの障害レポート設定を取得する。
%group
Win32 kernel32
%prm
hProcess, pdwFlags
hProcess : [intptr] プロセスのハンドル。PROCESS_VM_READ または PROCESS_QUERY_INFORMATION アクセス権を持つ必要がある。
pdwFlags : [var] 
%inst
指定したプロセスの障害レポート設定を取得する。

[戻り値]
成功した場合は S_OK、失敗した場合はエラーコードを返す。


%index
WerRegisterAdditionalProcess
メインアプリケーションプロセスとともにエラーレポートに含めるプロセスを登録する。任意でそのプロセス内のスレッドを指定して追加データを取得できる。
%group
Win32 kernel32
%prm
processId, captureExtraInfoForThreadId
processId : [int] 登録するプロセスの ID。
captureExtraInfoForThreadId : [int] 登録するプロセス内で追加情報を要求するスレッドの ID。
%inst

メインアプリケーションプロセスとともにエラーレポートに含めるプロセスを登録する。任意でそのプロセス内のスレッドを指定して追加データを取得できる。

[戻り値]
成功した場合は S_OK、失敗した場合は次のいずれかのエラーコードを返す。
（以下省略）

[備考]
本 API は複数プロセスが相互作用するアプリケーション向け。アプリケーションのメインプロセスが別プロセスの ID
を登録する。登録側プロセスがクラッシュすると、WER は登録されたプロセスの追加トリアージダンプを診断結果に追加する。スレッド ID
も提供すると特定スレッドのデータをより多く取得できる。


%index
WerRegisterAppLocalDump
アプリケーションプロセスの応答停止時に Windows エラー報告 (WER) が収集する診断メモリダンプのコピーを保存する、呼び出し側アプリケーションのローカルアプリストアからの相対パスを登録する。
%group
Win32 kernel32
%prm
localAppDataRelativePath
localAppDataRelativePath : [wstr] WER がアプリケーションプロセスの応答停止時に収集する診断メモリダンプを保存する、呼び出し側アプリケーションのローカルアプリストアからの相対パス。文字数の最大長は **WER_MAX_LOCAL_DUMP_SUBPATH_LENGTH** で 64 (NULL 終端を含む)。
%inst
アプリケーションプロセスの応答停止時に Windows エラー報告 (WER)
が収集する診断メモリダンプのコピーを保存する、呼び出し側アプリケーションのローカルアプリストアからの相対パスを登録する。

[戻り値]
成功した場合は **S_OK**、失敗した場合は次のいずれかのエラーコードを返す。
（以下省略）

[備考]
パッケージアプリケーションは起動時に **WerRegisterAppLocalDump**
を呼んで、いずれかのプロセスが応答停止した場合に WER が収集する診断メモリダンプのコピーを要求する。WER
は相対パスで指定された場所のストレージや収集メモリダンプの数を管理しない。


%index
WerRegisterCustomMetadata
WER がエラーレポート作成時に収集するアプリ固有メタデータ (キー / 値文字列の形式) を登録する。
%group
Win32 kernel32
%prm
key, value
key : [wstr] 登録するメタデータ要素の "key" 文字列。
value : [wstr] 登録するメタデータ要素の値文字列。
%inst
WER がエラーレポート作成時に収集するアプリ固有メタデータ (キー / 値文字列の形式) を登録する。

[戻り値]
成功した場合は S_OK、失敗した場合は次のいずれかのエラーコードを返す。
（以下省略）

[備考]
本 API はアプリレベルのテレメトリをアプリのプロセスに対応するクラッシュレポートに関連付けることで、システムレベルのテレメトリ
(WER) と統合できるようにする。


%index
WerRegisterExcludedMemoryBlock
通常はエラーレポートに既定で含まれるメモリブロックを、エラーレポートから除外するようマークする。
%group
Win32 kernel32
%prm
address, size
address : [intptr] メモリブロックの開始アドレス。
size : [int] メモリブロックのサイズ（バイト単位）。
%inst
通常はエラーレポートに既定で含まれるメモリブロックを、エラーレポートから除外するようマークする。

[戻り値]
成功した場合は S_OK、失敗した場合は次のいずれかのエラーコードを返す。
（以下省略）

[備考]
本機構は、根本原因デバッグに役立たず不要にダンプファイルサイズを増やす大量データをメモリに保持するアプリケーション向け。たとえば一部の
Xbox One ゲームは大量のテクスチャデータをメモリに保持しており、既定でエラーダンプに含まれてしまう。


%index
WerRegisterFile
WER がエラーレポート作成時に収集するファイルを登録する。
%group
Win32 kernel32
%prm
pwzFile, regFileType, dwFlags
pwzFile : [wstr] ファイルのフルパス。最大長は MAX_PATH。
regFileType : [int] 
dwFlags : [int] 
%inst
WER がエラーレポート作成時に収集するファイルを登録する。

[戻り値]
成功した場合は S_OK、失敗した場合は次のいずれかのエラーコードを返す。
（以下省略）

[備考]
登録ファイルはサーバが追加データを要求した場合のみレポートに追加される。クラッシュや無応答に対しては OS が自動的にエラー報告を提供する
(アプリでエラー報告コードを書く必要はない)。本関数でファイルを登録すると、OS
はクラッシュや無応答時に作成されるエラーレポートにそのファイルを追加する (OS が既に収集するファイルに加えて)。
汎用イベント報告のためにはアプリは代わりに WerReportAddFile を使う必要がある。あるいは WerReportSubmit
を WER_SUBMIT_ADD_REGISTERED_DATA フラグ付きで呼ぶと、WerRegisterFile
で追加されたファイルが含まれる。
リストから削除するには WerUnregisterFile を呼ぶ。


%index
WerRegisterMemoryBlock
WER がエラーレポート作成時に収集するメモリブロックを登録する。
%group
Win32 kernel32
%prm
pvAddress, dwSize
pvAddress : [intptr] メモリブロックの開始アドレス。
dwSize : [int] メモリブロックのサイズ（バイト単位）。最大値は WER_MAX_MEM_BLOCK_SIZE バイト。
%inst
WER がエラーレポート作成時に収集するメモリブロックを登録する。

[戻り値]
成功した場合は S_OK、失敗した場合は次のいずれかのエラーコードを返す。
（以下省略）

[備考]

本関数で登録されたメモリはヒープダンプ以上の大きなダンプファイルにのみ追加され、ミニダンプ以下には追加されない。クラッシュや無応答に対しては
OS が自動的にエラー報告を提供する。本関数でメモリブロックを登録すると、OS
はクラッシュや無応答発生時にメモリブロック情報をダンプファイルに追加する。サーバが追加データを要求した場合のみ追加される。汎用イベント報告のためにはアプリは
WER 汎用イベント報告関数を直接呼ぶ必要がある。汎用レポートにメモリブロックを追加するには WerReportAddDump
を呼んでから、WerReportSubmit を WER_SUBMIT_ADD_REGISTERED_DATA フラグ付きで呼ぶ。
リストから削除するには WerUnregisterMemoryBlock を呼ぶ。


%index
WerRegisterRuntimeExceptionModule
クラッシュに対するカスタムエラー報告を提供する、カスタムランタイム例外ハンドラを登録する。
%group
Win32 kernel32
%prm
pwszOutOfProcessCallbackDll, pContext
pwszOutOfProcessCallbackDll : [wstr] 登録する例外ハンドラ DLL の名前。
pContext : [intptr] ハンドラのコールバック関数に渡される任意のコンテキスト情報へのポインタ。
%inst
クラッシュに対するカスタムエラー報告を提供する、カスタムランタイム例外ハンドラを登録する。

[戻り値]
成功した場合は S_OK、失敗した場合は次のいずれかのエラーコードを返す。
（以下省略）

[備考]
例外ハンドラは、クラッシュや未処理例外発生時に WER サービスがロードするアウトオブプロセス DLL である。DLL
は次の関数を実装してエクスポートする必要がある。
（以下省略）


%index
WerSetFlags
現在のプロセスの障害レポート設定を設定する。
%group
Win32 kernel32
%prm
dwFlags
dwFlags : [int] 
%inst
現在のプロセスの障害レポート設定を設定する。

[戻り値]
成功した場合は S_OK、失敗した場合はエラーコードを返す。


%index
WerUnregisterAdditionalProcess
エラーレポートに含める追加プロセスのリストからプロセスを削除する。
%group
Win32 kernel32
%prm
processId
processId : [int] 削除するプロセスの ID。WerRegisterAdditionalProcess で事前に登録されている必要がある。
%inst
エラーレポートに含める追加プロセスのリストからプロセスを削除する。

[戻り値]
成功した場合は S_OK、失敗した場合は次のいずれかのエラーコードを返す。
（以下省略）


%index
WerUnregisterAppLocalDump
アプリケーションプロセスの応答停止時に Windows エラー報告 (WER) が診断メモリダンプのコピーを保存することを指定するために WerRegisterAppLocalDump で行った登録をキャンセルする。
%group
Win32 kernel32
%prm

%inst
アプリケーションプロセスの応答停止時に Windows エラー報告 (WER) が診断メモリダンプのコピーを保存することを指定するために
WerRegisterAppLocalDump で行った登録をキャンセルする。

[戻り値]
成功した場合は S_OK、失敗した場合は HRESULT エラーコードを返す。


%index
WerUnregisterCustomMetadata
アプリケーションのエラー報告中に収集されるアプリ固有メタデータ項目を削除する。
%group
Win32 kernel32
%prm
key
key : [wstr] 削除するメタデータ要素の "key" 文字列。WerRegisterCustomMetadata で事前に登録されている必要がある。
%inst
アプリケーションのエラー報告中に収集されるアプリ固有メタデータ項目を削除する。

[戻り値]
成功した場合は S_OK、失敗した場合は次のいずれかのエラーコードを返す。
（以下省略）


%index
WerUnregisterExcludedMemoryBlock
以前に除外マークされたメモリブロックを削除する (再びエラーレポートに含まれるようになる)。
%group
Win32 kernel32
%prm
address
address : [intptr] メモリブロックの開始アドレス。WerRegisterExcludedMemoryBlock で登録されている必要がある。
%inst
以前に除外マークされたメモリブロックを削除する (再びエラーレポートに含まれるようになる)。

[戻り値]
成功した場合は S_OK、失敗した場合は次のいずれかのエラーコードを返す。
（以下省略）


%index
WerUnregisterFile
現在のプロセス用に生成されるレポートに追加するファイルのリストからファイルを削除する。
%group
Win32 kernel32
%prm
pwzFilePath
pwzFilePath : [wstr] ファイルのフルパス。WerRegisterFile で登録されている必要がある。
%inst
現在のプロセス用に生成されるレポートに追加するファイルのリストからファイルを削除する。

[戻り値]
成功した場合は S_OK、失敗した場合は次のいずれかのエラーコードを返す。
（以下省略）


%index
WerUnregisterMemoryBlock
アプリケーションのエラー報告中に収集されるデータのリストからメモリブロックを削除する。
%group
Win32 kernel32
%prm
pvAddress
pvAddress : [intptr] メモリブロックの開始アドレス。WerRegisterMemoryBlock で登録されている必要がある。
%inst
アプリケーションのエラー報告中に収集されるデータのリストからメモリブロックを削除する。

[戻り値]
成功した場合は S_OK、失敗した場合は次のいずれかのエラーコードを返す。
（以下省略）


%index
WerUnregisterRuntimeExceptionModule
WER 例外ハンドラの登録を削除する。
%group
Win32 kernel32
%prm
pwszOutOfProcessCallbackDll, pContext
pwszOutOfProcessCallbackDll : [wstr] 登録解除する例外ハンドラ DLL の名前。
pContext : [intptr] コールバックに渡された任意のコンテキスト情報へのポインタ。
%inst
WER 例外ハンドラの登録を削除する。

[戻り値]
成功した場合は S_OK、失敗した場合は次のいずれかのエラーコードを返す。
（以下省略）

[備考]
ランタイム例外ハンドラを登録するには WerRegisterRuntimeExceptionModule を呼ぶ。


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
WinExec
指定したアプリケーションを実行する。
%group
Win32 kernel32
%prm
lpCmdLine, uCmdShow
lpCmdLine : [str] 実行するアプリケーションのコマンドライン (ファイル名と省略可能なパラメータ)。lpCmdLine 内の実行ファイル名にディレクトリパスが含まれない場合、システムは次の順序で実行ファイルを検索する。
uCmdShow : [int] 表示オプション。指定可能な値は ShowWindow 関数の nCmdShow パラメータの説明を参照。
%inst
指定したアプリケーションを実行する。

[戻り値]
関数が成功した場合、戻り値は 31 より大きい。失敗した場合、次のいずれかのエラー値を返す。
（以下省略）

[備考]
WinExec は開始したプロセスが GetMessage
を呼ぶか、タイムアウトに達したときに戻る。タイムアウト遅延を回避するため、WinExec で起動したプロセスではできるだけ早く
GetMessage を呼ぶこと。セキュリティに関する備考: 実行ファイル名は lpCmdLine
内の最初の空白区切り文字列として扱われる。実行ファイルやパス名にスペースが含まれていると、関数のスペース解析方法のため別の実行ファイルが実行される危険がある。次の例は危険で、"Program.exe"
が存在すれば "MyApp.exe" の代わりに実行される。
（以下省略）


%index
WriteConsoleW
現在のカーソル位置からコンソール画面バッファに文字列を書き込む。
%group
Win32 kernel32
%prm
hConsoleOutput, lpBuffer, nNumberOfCharsToWrite, lpNumberOfCharsWritten, lpReserved
hConsoleOutput : [intptr] コンソール画面バッファのハンドル。GENERIC_WRITE アクセス権を持つ必要がある。
lpBuffer : [wstr] コンソール画面バッファに書き込む文字を含むバッファへのポインタ。WriteConsoleA では `char`、WriteConsoleW では `wchar_t` の配列であることが期待される。
nNumberOfCharsToWrite : [int] 書き込む文字数。指定文字数の合計サイズが利用可能ヒープを超えると、関数は ERROR_NOT_ENOUGH_MEMORY で失敗する。
lpNumberOfCharsWritten : [var] 実際に書き込まれた文字数を受け取る変数へのポインタ。
lpReserved : [intptr] 予約。NULL でなければならない。
%inst
現在のカーソル位置からコンソール画面バッファに文字列を書き込む。

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
**WriteConsole**
は現在のカーソル位置からコンソール画面バッファに文字を書き込む。文字を書き込むとカーソル位置は前進する。SetConsoleCursorPosition
で現在のカーソル位置を設定する。文字はコンソール画面バッファに関連付けられた前景・背景色属性で書き込まれる。SetConsoleTextAttribute
でこれらを変更する。現在の色属性とカーソル位置を判定するには GetConsoleScreenBufferInfo
を使う。WriteFile の動作に影響する全入力モードは WriteConsole
にも同じ影響を与える。コンソール画面バッファの出力モード取得・設定には GetConsoleMode / SetConsoleMode
を使う。**WriteConsole**
はファイルにリダイレクトされた標準ハンドルで使うと失敗する。多言語出力を扱うアプリケーションでは出力ハンドルがコンソールハンドルか判定し
(GetConsoleMode の成否で判定可能)、コンソールハンドルなら WriteConsole を呼び、そうでなければ
WriteFile を呼ぶ。Unicode プレーンテキストファイルにはバイト順マークを付与すること。アプリケーションは ANSI
モードで WriteConsole を使用して ANSI 文字を書き込むことができるが、有効化されない限りコンソールは "ANSI
エスケープ" や "仮想ターミナル" シーケンスをサポートしない。詳細は Console Virtual Terminal
Sequences を参照。仮想ターミナルエスケープシーケンスが有効化されていない場合、コンソール関数で同等機能を提供できる。詳細は
SetCursorPos、SetConsoleTextAttribute、GetConsoleCursorInfo を参照。


%index
WriteConsoleInputW
コンソール入力バッファに直接データを書き込む WriteConsoleInput 関数の参照情報。
%group
Win32 kernel32
%prm
hConsoleInput, lpBuffer, nLength, lpNumberOfEventsWritten
hConsoleInput : [intptr] コンソール入力バッファのハンドル。GENERIC_WRITE アクセス権を持つ必要がある。詳細は Console Buffer Security and Access Rights を参照。
lpBuffer : [var] 入力バッファに書き込むデータを含む INPUT_RECORD 構造体配列へのポインタ。
nLength : [int] 書き込む入力レコード数。
lpNumberOfEventsWritten : [var] 実際に書き込まれた入力レコード数を受け取る変数へのポインタ。
%inst
コンソール入力バッファに直接データを書き込む WriteConsoleInput 関数の参照情報。

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
**WriteConsoleInput**
は入力バッファ内の保留中イベントの後ろに入力レコードを置く。バッファ書き込み量に応じて入力バッファは動的に拡張される。> [!TIP] >
本 API は推奨されず、仮想ターミナル相当機能はない。この決定は意図的に Windows プラットフォームを他 OS
と整合させるものである。SSH
などのクロスプラットフォームユーティリティ・トランスポート経由でリモート利用するアプリケーションは期待通りに動作しない可能性がある。


%index
WriteConsoleOutputW
コンソール画面バッファ内の指定矩形ブロックの文字セルに文字と色属性データを書き込む。
%group
Win32 kernel32
%prm
hConsoleOutput, lpBuffer, dwBufferSize, dwBufferCoord, lpWriteRegion
hConsoleOutput : [intptr] コンソール画面バッファのハンドル。GENERIC_WRITE アクセス権を持つ必要がある。詳細は Console Buffer Security and Access Rights を参照。
lpBuffer : [var] コンソール画面バッファに書き込むデータ。dwBufferSize で指定されたサイズの CHAR_INFO 構造体の 2 次元配列の起点として扱われる。
dwBufferSize : [var] lpBuffer が指すバッファのサイズ (文字セル単位)。COORD 構造体の **X** メンバが列数、**Y** メンバが行数。
dwBufferCoord : [var] lpBuffer が指すバッファの左上セル座標。COORD 構造体の **X** メンバが列、**Y** メンバが行。
lpWriteRegion : [var] SMALL_RECT 構造体へのポインタ。入力時、構造体メンバは書き込み先となるコンソール画面バッファ矩形の左上座標と右下座標を指定する。出力時には実際に使われた矩形を示す。
%inst
コンソール画面バッファ内の指定矩形ブロックの文字セルに文字と色属性データを書き込む。

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
**WriteConsoleOutput** はソースバッファと宛先画面バッファを 2 次元配列 (列と行の文字セル)
として扱う。lpWriteRegion が指す矩形は、コンソール画面バッファ内に書き込むブロックのサイズと位置を指定する。同サイズの矩形が
dwBufferCoord 座標を左上セルとして lpBuffer 内に配置される。この矩形と (dwBufferSize で指定された)
ソースバッファ矩形の交差部分のセルから宛先矩形にデータが書き込まれる。ソース矩形外に対応する宛先矩形セルは書き込みで影響を受けない。WriteConsoleOutput
は戻る前に、lpWriteRegion
のメンバを書き込み操作で実際に影響を受けた画面バッファ矩形に設定する。この矩形はコンソール画面バッファ境界に切り取られ、ソースバッファに対応セルが存在した宛先矩形のセルを反映する。lpWriteRegion
で指定された矩形が完全にコンソール画面バッファ境界外、または対応矩形が完全にソースバッファ境界外にある場合、データは書き込まれない。この場合、関数は
**Right** が **Left** より小さいか **Bottom** が **Top**
より小さい状態で戻る。コンソール画面バッファのサイズは GetConsoleScreenBufferInfo
で調べる。**WriteConsoleOutput** はカーソル位置に影響を与えない。


%index
WriteConsoleOutputAttribute
指定した位置から始まるコンソール画面バッファの連続セルへ、指定数の文字属性をコピーする。
%group
Win32 kernel32
%prm
hConsoleOutput, lpAttribute, nLength, dwWriteCoord, lpNumberOfAttrsWritten
hConsoleOutput : [intptr] コンソール画面バッファのハンドル。GENERIC_WRITE アクセス権を持つ必要がある。詳細は Console Buffer Security and Access Rights を参照。
lpAttribute : [var] コンソール画面バッファへ書き込む際に使う属性。詳細は Character Attributes を参照。
nLength : [int] 属性をコピーする画面バッファセル数。
dwWriteCoord : [var] 属性を書き込むコンソール画面バッファ内の最初のセルの文字座標を指定する COORD 構造体。
lpNumberOfAttrsWritten : [var] 実際にコンソール画面バッファに書き込まれた属性数を受け取る変数へのポインタ。
%inst
指定した位置から始まるコンソール画面バッファの連続セルへ、指定数の文字属性をコピーする。

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]

書き込む属性数が指定行末を超える場合、属性は次の行に書き込まれる。属性数がコンソール画面バッファ末尾を超える場合、書き込みは画面バッファ末尾までで停止する。書き込み先の文字値は変更されない。>
[!TIP] > 本 API
はテキスト書式とカーソル位置決めのシーケンスに仮想ターミナル相当機能がある。挿入位置にカーソルを移動し、書式を適用してテキストを書き込む。テキストを伴わずに領域に色を適用する相当機能はない。


%index
WriteConsoleOutputCharacterW
指定した位置から始まるコンソール画面バッファの連続セルへ、指定数の文字をコピーする。
%group
Win32 kernel32
%prm
hConsoleOutput, lpCharacter, nLength, dwWriteCoord, lpNumberOfCharsWritten
hConsoleOutput : [intptr] コンソール画面バッファのハンドル。GENERIC_WRITE アクセス権を持つ必要がある。詳細は Console Buffer Security and Access Rights を参照。
lpCharacter : [wstr] コンソール画面バッファに書き込む文字。
nLength : [int] 書き込む文字数。
dwWriteCoord : [var] 文字を書き込むコンソール画面バッファ内の最初のセルの文字座標を指定する COORD 構造体。
lpNumberOfCharsWritten : [var] 実際に書き込まれた文字数を受け取る変数へのポインタ。
%inst
指定した位置から始まるコンソール画面バッファの連続セルへ、指定数の文字をコピーする。

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]

書き込む文字数が指定行末を超える場合、文字は次の行に書き込まれる。文字数がコンソール画面バッファ末尾を超える場合、書き込みは画面バッファ末尾までで停止する。書き込み先の属性値は変更されない。>
[!TIP] > 本 API はテキスト書式とカーソル位置決めのシーケンスに仮想ターミナル相当機能がある。


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


%index
WriteFileEx
指定したファイルや I/O デバイスにデータを書き込む。完了状態を非同期に報告し、書き込みが完了またはキャンセルされ呼び出し側スレッドが警告可能待機状態に入ったときに、指定の完了ルーチンを呼び出す。
%group
Win32 kernel32
%prm
hFile, lpBuffer, nNumberOfBytesToWrite, lpOverlapped, lpCompletionRoutine
hFile : [intptr] ファイルや I/O デバイス (ファイル、ファイルストリーム、物理ディスク、ボリューム、コンソールバッファ、テープドライブ、ソケット、通信リソース、メールスロット、パイプなど) のハンドル。本パラメータには CreateFile 関数で **FILE_FLAG_OVERLAPPED** フラグを付けて開いた任意のハンドル、または socket / accept 関数が返したソケットハンドルを指定できる。このハンドルに I/O 完了ポートを関連付けてはならない。詳細は備考を参照。本ハンドルは **GENERIC_WRITE** アクセス権も持たなければならない。
lpBuffer : [var] ファイルやデバイスに書き込むデータを含むバッファへのポインタ。本バッファは書き込み操作の間有効である必要がある。呼び出し側は書き込み完了までこのバッファを使ってはならない。
nNumberOfBytesToWrite : [int] ファイルやデバイスに書き込むバイト数。0 を指定すると null 書き込み操作となる。null 書き込みの動作は基になるファイルシステムに依存する。ネットワーク越しのパイプ書き込みは 1 回 65,535 バイトに制限される。
lpOverlapped : [var] オーバーラップ (非同期) 書き込み中に使うデータを供給する OVERLAPPED 構造体へのポインタ。バイトオフセットをサポートするファイルでは、書き込み開始バイトオフセットを指定する必要がある。これは OVERLAPPED 構造体の **Offset** と **OffsetHigh** メンバで指定する。バイトオフセットをサポートしないファイル/デバイスでは無視される。EOF に書き込むには両方を `0xFFFFFFFF` にする。これは CreateFile を **FILE_APPEND_DATA** で開くことと機能的に同等である。**WriteFileEx** は OVERLAPPED 構造体の **hEvent** メンバを無視し、アプリケーションは自由にこのメンバを WriteFileEx 呼び出し文脈で利用できる。WriteFileEx は完了を lpCompletionRoutine の呼び出し (またはキューイング) で通知するため、イベントハンドルを必要としない。**Internal** と **InternalHigh** メンバは WriteFileEx が使用するので変更してはならない。OVERLAPPED 構造体は書き込み操作の間有効でなければならず、書き込み完了前にスコープ外になり得る変数を使ってはならない。
lpCompletionRoutine : [int] 書き込み完了時かつ呼び出し側スレッドが警告可能待機状態のときに呼ばれる完了ルーチンへのポインタ。詳細は FileIOCompletionRoutine を参照。
%inst
指定したファイルや I/O
デバイスにデータを書き込む。完了状態を非同期に報告し、書き込みが完了またはキャンセルされ呼び出し側スレッドが警告可能待機状態に入ったときに、指定の完了ルーチンを呼び出す。

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼ぶ。**WriteFileEx** が成功した場合、呼び出し側スレッドにはオーバーラップ書き込み I/O
操作が保留中となる。この I/O 完了時かつスレッドが警告可能待機状態でブロックされている場合、OS は
_lpCompletionRoutine_ が指す関数を呼び、待機は WAIT_IO_COMPLETION
で完了する。関数が成功し書き込みが完了したが呼び出し側スレッドが警告可能待機状態でない場合、システムは
_lpCompletionRoutine_ への呼び出しをキューイングし、スレッドが警告可能待機状態に入るまで保持する。

[備考]
**WriteFileEx** を使う際は、関数が "成功" を返した場合でも GetLastError
を確認するべきである。たとえばバッファオーバーフローでは TRUE が返るが GetLastError は ERROR_MORE_DATA
を返す。成功で警告条件もない場合、GetLastError は ERROR_SUCCESS を返す。**WriteFileEx** は
_hFile_ が I/O 完了ポートに関連付けられている場合は失敗する。この種のハンドルでは WriteFile
を使うこと。**WriteFileEx** は未完了の非同期 I/O 要求が多すぎると失敗することがある。失敗時に
GetLastError は ERROR_INVALID_USER_BUFFER または ERROR_NOT_ENOUGH_MEMORY
を返す。すべての保留中非同期 I/O 操作をキャンセルするには CancelIo (呼び出し側スレッドが発行した操作のみ) または
CancelIoEx (指定ハンドルに対するすべての操作) を使う。同期 I/O のキャンセルには CancelSynchronousIo
を使う。キャンセルされた I/O 操作は ERROR_OPERATION_ABORTED で完了する。_hFile_
が示すファイルの一部が別プロセスによりロックされていて、書き込み範囲がロック領域と重なる場合、**WriteFileEx**
は失敗する。ファイル書き込み時、ファイルへの書き込みに使われたすべてのハンドルが閉じられるまでは最終書き込み時刻が完全には更新されない。よって正確な最終書き込み時刻を得るためには書き込み直後にファイルハンドルを閉じる。書き込み中の出力バッファにアクセスすると書き込みデータが破損することがある。アプリケーションは書き込み完了まで出力バッファに書いたり再割り当てしたり解放してはならない。リモートファイルではタイムスタンプが正しく更新されないことがあるため、一貫した結果のためには非バッファ
I/O を使う。システムは 0 バイトを null 書き込み操作と解釈し、WriteFile
はファイルを切り詰めも拡張もしない。切り詰めや拡張には SetEndOfFile を使う。アプリケーションは
WaitForSingleObjectEx、WaitForMultipleObjectsEx、MsgWaitForMultipleObjectsEx、SignalObjectAndWait、SleepEx
で警告可能待機状態に入る。マウントされたファイルシステムを持つボリュームに直接書き込む場合、まずボリュームに排他アクセスを取得しなければならない。さもなければデータ破損やシステム不安定の原因となる。これらの問題を防ぐため、Windows
Vista 以降では次の変更がある。-
マウントファイルシステムがないボリュームのハンドル書き込みは成功する。次の条件のいずれかが真なら成功する:
ブートセクタへの書き込み、ファイルシステム空間外のセクタへの書き込み、FSCTL_LOCK_VOLUME /
FSCTL_DISMOUNT_VOLUME で明示的にロック・ディスマウント済み、ボリュームに実際のファイルシステムがない (RAW
がマウント)。- ディスクハンドル書き込みは次の条件のいずれかが真なら成功する:
書き込みセクタがボリュームエクステント外、書き込みセクタがマウントボリューム内だが明示的にロック・ディスマウント済み、書き込みセクタが
RAW 以外のマウントファイルシステムを持たないボリューム内。CreateFile で
**FILE_FLAG_NO_BUFFERING** で開いたファイルとの作業には厳格な要件がある。詳細は File Buffering
を参照。Windows 8 と Windows Server 2012 では本関数は SMB 3.0 / TFO / SO / CsvFS
/ ReFS でサポートされる。


%index
WriteFileGather
バッファの配列からデータを取り出してファイルに書き込む。
%group
Win32 kernel32
%prm
hFile, aSegmentArray, nNumberOfBytesToWrite, lpReserved, lpOverlapped
hFile : [intptr] ファイルのハンドル。**GENERIC_WRITE** アクセス権、**FILE_FLAG_OVERLAPPED**、**FILE_FLAG_NO_BUFFERING** フラグを付けて作成する必要がある。詳細は File Security and Access Rights を参照。
aSegmentArray : [var] データを含む FILE_SEGMENT_ELEMENT 構造体バッファの配列へのポインタ。各要素は 1 ページ分のデータのアドレスを含む。> [!NOTE] > システムページサイズは GetSystemInfo で調べる。配列には _nNumberOfBytesToWrite_ バイトを格納するのに十分な要素数と終端 NULL 用の 1 要素が必要。たとえば 40 KB を書き込みページサイズが 4 KB なら、配列は 11 要素 (データ 10 + NULL 1) を持つ必要がある。各バッファはシステムメモリページサイズ以上で、システムメモリページサイズ境界に整列する必要がある。システムは各バッファから 1 ページずつ書き込む。本関数は順次収集する。本関数は非同期動作するため、本パラメータが非同期書き込みの間有効なメモリを参照し続けるよう注意する必要がある。たとえばローカルスタックを使い実行スコープが外れるのは典型的な誤用である。
nNumberOfBytesToWrite : [int] 書き込む合計バイト数。aSegmentArray の各要素は合計のうち 1 ページ分のチャンクを含む。ファイルは **FILE_FLAG_NO_BUFFERING** で開かなければならないため、バイト数はファイルが存在するファイルシステムのセクタサイズの倍数である必要がある。0 を指定すると関数は null 書き込み操作を行う。null 書き込みの動作は基になるファイルシステムに依存する。0 でなく、書き込みのオフセットと長さがファイル末尾を超える場合、**WriteFileGather** はファイルを拡張する。
lpReserved : [var] 将来用に予約。NULL でなければならない。
lpOverlapped : [var] OVERLAPPED 構造体へのポインタ。**WriteFileGather** は有効な OVERLAPPED 構造体を必要とし、_lpOverlapped_ を NULL にできない。**WriteFileGather** は OVERLAPPED 構造体の **Offset** と **OffsetHigh** で指定された位置からファイルへデータの書き込みを始める。**WriteFileGather** は書き込み完了前に戻ることがある。その場合、戻り値は 0 で GetLastError は **ERROR_IO_PENDING** を返す。これにより呼び出し側プロセスは書き込み完了中も処理を続けられる。完了情報の取得には GetOverlappedResult、HasOverlappedIoCompleted、GetQueuedCompletionStatus を使える。
%inst
バッファの配列からデータを取り出してファイルに書き込む。

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼ぶ。書き込み完了前に戻った場合、戻り値は 0 で GetLastError は
**ERROR_IO_PENDING** を返す。

[備考]
本関数は Itanium ベースシステム上の WOW64 では 32
ビットアプリケーションに対してサポートされない。FILE_SEGMENT_ELEMENT 構造体は次のように定義される。
（以下省略）


%index
WritePrivateProfileSectionW
初期化ファイル内の指定セクションのキーと値を置き換える。(Unicode)
%group
Win32 kernel32
%prm
lpAppName, lpString, lpFileName
lpAppName : [wstr] データを書き込むセクションの名前。通常は呼び出し側アプリケーションの名前。
lpString : [wstr] 指定セクションに書き込む新しいキー名と関連付けられた値。65,535 バイトに制限される。
lpFileName : [wstr] 初期化ファイルの名前。フルパスを含まない場合、Windows ディレクトリを検索する。ファイルが存在せず lpFileName にフルパスが含まれない場合、関数は Windows ディレクトリにファイルを作成する。ファイルが存在し Unicode 文字で作成されていれば、関数は Unicode 文字を書き込む。それ以外は ANSI 文字でファイルを作成する。
%inst
初期化ファイル内の指定セクションのキーと値を置き換える。(Unicode)

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
lpString が指すバッファのデータは 1 つ以上の NULL 終端文字列とそれに続く最終 NULL 文字からなる。各文字列は
key=string の形式である。WritePrivateProfileSection は大文字小文字を区別せず、lpAppName
が指す文字列は大文字小文字の任意の組み合わせでよい。lpAppName
と一致するセクション名がない場合、WritePrivateProfileSection
は指定初期化ファイル末尾にセクションを作成し、指定キー / 値で初期化する。WritePrivateProfileSection
は名前付きセクションの既存キー・値を削除し、lpString
バッファ内のキー名と値を挿入する。本関数は新旧キー名の対応を試みず、新しい名前の順序が古いものと異なる場合、既存キーや値に関連付けられたコメントが誤ったキーや値に関連付けられる可能性がある。本操作はアトミックで、書き込み中に同じ初期化ファイルを読み書きする操作は許可されない。システムは性能向上のため、最新のレジストリファイルマッピングのキャッシュを保持する。すべてのパラメータが
NULL
なら関数はキャッシュをフラッシュする。システムがキャッシュ版を編集中、ファイル自体を編集するプロセスはキャッシュがクリアされるまで元のファイルを使う。システムは大半の
.ini ファイル参照を、HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows
NT\CurrentVersion\IniFileMapping レジストリキー以下のマッピングでレジストリにマップする。
アプリケーションが Control.ini、System.ini、Winfile.ini
などのシステムコンポーネント初期化ファイルを変更する場合に該当する。この場合、本関数は初期化ファイルではなくレジストリに書き込むが、関数の動作には影響しない。プロファイル関数は次の手順で初期化情報を見つける。
（以下省略）


%index
WritePrivateProfileStringW
初期化ファイル内の指定セクションに文字列をコピーする。(Unicode)
%group
Win32 kernel32
%prm
lpAppName, lpKeyName, lpString, lpFileName
lpAppName : [wstr] 文字列をコピーするセクションの名前。セクションが存在しなければ作成される。セクション名は大文字小文字を区別しない。
lpKeyName : [wstr] 文字列に関連付けるキーの名前。指定セクションにキーが存在しなければ作成される。NULL を指定するとセクション内のすべてのエントリを含むセクション全体が削除される。
lpString : [wstr] ファイルに書き込む NULL 終端文字列。NULL を指定すると lpKeyName が指すキーが削除される。
lpFileName : [wstr] 初期化ファイルの名前。Unicode 文字で作成されたファイルなら Unicode 文字を書き込み、それ以外は ANSI 文字を書き込む。
%inst
初期化ファイル内の指定セクションに文字列をコピーする。(Unicode)

[戻り値]
関数が初期化ファイルへの文字列コピーに成功した場合、戻り値は 0
以外。失敗した場合、または最近アクセスした初期化ファイルのキャッシュ版をフラッシュした場合、戻り値は 0。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
初期化ファイル内のセクションは次の形式でなければならない。
（以下省略）


%index
WritePrivateProfileStructW
初期化ファイルの指定セクション内のキーにデータをコピーする。データのコピー時にチェックサムを計算してデータの末尾に追加する。(Unicode)
%group
Win32 kernel32
%prm
lpszSection, lpszKey, lpStruct, uSizeStruct, szFile
lpszSection : [wstr] 構造体データをコピーするセクションの名前。存在しなければ作成される。セクション名は大文字小文字を区別しない。
lpszKey : [wstr] 構造体に関連付けるキーの名前。指定セクションにキーが存在しなければ作成される。NULL を指定するとセクション内全キーを含むセクション全体が削除される。
lpStruct : [intptr] コピーするデータ。NULL を指定するとキーが削除される。
uSizeStruct : [int] lpStruct が指すバッファのサイズ（バイト単位）。
szFile : [wstr] 初期化ファイルの名前。NULL を指定すると Win.ini にコピーされる。Unicode 文字で作成されたファイルなら Unicode 文字を書き込み、それ以外は ANSI 文字を書き込む。
%inst

初期化ファイルの指定セクション内のキーにデータをコピーする。データのコピー時にチェックサムを計算してデータの末尾に追加する。(Unicode)

[戻り値]
関数が初期化ファイルへの構造体コピーに成功した場合、戻り値は 0
以外。失敗した場合、または最近アクセスした初期化ファイルのキャッシュ版をフラッシュした場合、戻り値は 0。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
初期化ファイル内のセクションは次の形式でなければならない。
（以下省略）


%index
WriteProcessMemory
指定したプロセス内のメモリ領域にデータを書き込む。書き込み先範囲全体がアクセス可能でなければ操作は失敗する。
%group
Win32 kernel32
%prm
hProcess, lpBaseAddress, lpBuffer, nSize, lpNumberOfBytesWritten
hProcess : [intptr] 変更するプロセスメモリのハンドル。プロセスへの PROCESS_VM_WRITE と PROCESS_VM_OPERATION アクセス権を持つ必要がある。
lpBaseAddress : [intptr] データを書き込む先となる、指定プロセス内のベースアドレスへのポインタ。データ転送前にシステムはベースアドレスから指定サイズまでのすべてのメモリが書き込みアクセス可能か確認し、可能でなければ失敗する。
lpBuffer : [intptr] 指定プロセスのアドレス空間に書き込むデータを含むバッファへのポインタ。
nSize : [int] 指定プロセスに書き込むバイト数。
lpNumberOfBytesWritten : [var] 指定プロセスに転送されたバイト数を受け取る変数へのポインタ。省略可能で、NULL を指定すると無視される。
%inst
指定したプロセス内のメモリ領域にデータを書き込む。書き込み先範囲全体がアクセス可能でなければ操作は失敗する。

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼ぶ。要求した書き込み操作がプロセスのアクセス不能な領域に達した場合、関数は失敗する。

[備考]
WriteProcessMemory
は現在のプロセスの指定バッファのデータを指定プロセスのアドレス範囲にコピーする。書き込み先プロセスへの PROCESS_VM_WRITE
と PROCESS_VM_OPERATION アクセス権を持つハンドルを持つプロセスならどれでも本関数を呼べる。通常 (常にではないが)
書き込み先のプロセスはデバッグ中である。書き込み先範囲全体がアクセス可能でなければならず、不可能な場合は失敗する。


%index
WriteProfileSectionW
Win.ini ファイル内の指定セクションの内容を、指定したキーと値で置き換える。(Unicode)
%group
Win32 kernel32
%prm
lpAppName, lpString
lpAppName : [wstr] セクションの名前。通常は呼び出し側アプリケーションの名前。
lpString : [wstr] 指定セクションに書き込む新しいキー名と関連付けられた値。65,535 バイトに制限される。Unicode 文字で作成されたファイルなら Unicode 文字を書き込み、それ以外は ANSI 文字でファイルを作成する。
%inst
Win.ini ファイル内の指定セクションの内容を、指定したキーと値で置き換える。(Unicode)

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
lpString バッファ内のキーと値は 1 つ以上の NULL 終端文字列とそれに続く最終 NULL 文字からなる。各文字列は
key=string の形式である。WriteProfileSection
は大文字小文字を区別せず、文字列は大文字小文字の任意の組み合わせでよい。WriteProfileSection
は名前付きセクションの既存キー・値を削除し、lpString
バッファ内のキー名と値を挿入する。本関数は新旧キー名の対応を試みない。本操作はアトミックで、書き込み中に初期化ファイルを読み書きする他の操作は許可されない。システムは性能向上のため最新のレジストリファイルマッピングのキャッシュを保持する。すべてのパラメータが
NULL なら関数はキャッシュをフラッシュする。システムは大半の .ini ファイル参照を
HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows
NT\CurrentVersion\IniFileMapping のマッピングでレジストリにマップする。
マップされた場合、WriteProfileSection
は初期化ファイルではなくレジストリに書き込むが、関数の動作には影響しない。プロファイル関数は次の手順で初期化情報を見つける。
（以下省略）


%index
WriteProfileStringW
Win.ini ファイル内の指定セクションに文字列をコピーする。(Unicode)
%group
Win32 kernel32
%prm
lpAppName, lpKeyName, lpString
lpAppName : [wstr] 文字列をコピーするセクション。存在しなければ作成される。セクション名は大文字小文字を区別しない。
lpKeyName : [wstr] 文字列に関連付けるキー。指定セクションにキーが存在しなければ作成される。NULL を指定するとセクション内のすべてのエントリを含むセクション全体が削除される。
lpString : [wstr] ファイルに書き込む NULL 終端文字列。NULL を指定すると lpKeyName が指すキーが削除される。
%inst
Win.ini ファイル内の指定セクションに文字列をコピーする。(Unicode)

[戻り値]
関数が Win.ini への文字列コピーに成功した場合、戻り値は 0 以外。失敗した場合、または Win.ini
のキャッシュ版をフラッシュした場合、戻り値は 0。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
Win.ini 内のセクションは key=string
の形式でなければならない。システムは性能向上のため最新のレジストリファイルマッピングのキャッシュを保持する。すべてのパラメータが NULL
なら関数はキャッシュをフラッシュする。システムは大半の .ini ファイル参照を
HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows
NT\CurrentVersion\IniFileMapping のマッピングでレジストリにマップする。
マップされた場合、WriteProfileString
は初期化ファイルではなくレジストリに書き込むが、関数の動作には影響しない。プロファイル関数は次の手順で初期化情報を見つける。
（以下省略）


%index
WriteTapemark
指定数のファイルマーク、セットマーク、ショートファイルマーク、またはロングファイルマークをテープデバイスに書き込む。
%group
Win32 kernel32
%prm
hDevice, dwTapemarkType, dwTapemarkCount, bImmediate
hDevice : [intptr] テープマークを書き込むデバイスのハンドル。CreateFile 関数で作成する。
dwTapemarkType : [int] 
dwTapemarkCount : [int] 書き込むテープマーク数。
bImmediate : [int] TRUE の場合、関数は即座に戻る。FALSE の場合、操作完了まで戻らない。
%inst
指定数のファイルマーク、セットマーク、ショートファイルマーク、またはロングファイルマークをテープデバイスに書き込む。

[戻り値]
関数が成功した場合、戻り値は NO_ERROR である。失敗した場合、次のいずれかのエラーコードを返すことがある。
（以下省略）

[備考]

ファイルマーク、セットマーク、ショートファイルマーク、ロングファイルマークはテープの線形構造を示す特殊な記録要素であり、ユーザーデータを含まない。ファイルマークは最も汎用的なマークである。セットマークはファイルマークでは得られない階層を提供する。ショートファイルマークは、書き込み操作がパーティション先頭か以前のロングファイルマークから行われない限り上書きできない短い消去ギャップを含む。ロングファイルマークは長い消去ギャップを含み、アプリケーションがファイルマークの先頭にテープを位置決めしてファイルマークと消去ギャップを上書きできる。


%index
ZombifyActCtx
ZombifyActCtx 関数は指定したアクティベーションコンテキストを非アクティブ化するが、解放はしない。
%group
Win32 kernel32
%prm
hActCtx
hActCtx : [intptr] 非アクティブ化するアクティベーションコンテキストのハンドル。
%inst
ZombifyActCtx 関数は指定したアクティベーションコンテキストを非アクティブ化するが、解放はしない。

[戻り値]
関数が成功した場合、TRUE を返す。hActCtx に NULL ハンドルを渡した場合、NULL_INVALID_PARAMETER
が返る。それ以外は FALSE を返す。本関数は GetLastError で取得できるエラーを設定する。例は Retrieving
the Last-Error Code を参照。完全なエラーコード一覧は System Error Codes を参照。

[備考]

本関数はアクティベーションコンテキストを使用するスレッドのデバッグ目的で使う。本関数で非アクティブ化されたアクティベーションコンテキストにその後アクセスすると、アクセスは失敗しデバッガにアサーション失敗が表示される。


%index
lstrcatW
ある文字列を別の文字列に追加する。警告 使用しないこと。(Unicode)
%group
Win32 kernel32
%prm
lpString1, lpString2
lpString1 : [wstr] 型: LPTSTR 1 番目の NULL 終端文字列。両方の文字列を格納するのに十分な大きさのバッファでなければならない。
lpString2 : [wstr] 型: LPTSTR lpString1 で指定された文字列に追加される NULL 終端文字列。
%inst
ある文字列を別の文字列に追加する。警告 使用しないこと。(Unicode)

[戻り値]
型: LPTSTR 関数が成功した場合、戻り値はバッファへのポインタ。関数が失敗した場合、戻り値は NULL で、lpString1 は
NULL 終端されていない可能性がある。

[備考]
> [!NOTE] > winbase.h ヘッダは lstrcat を、UNICODE プリプロセッサ定数の有無により
ANSI/Unicode 版を自動選択するエイリアスとして定義する。


%index
lstrcmpW
2 つの文字列を比較する。比較は大文字小文字を区別する。(Unicode)
%group
Win32 kernel32
%prm
lpString1, lpString2
lpString1 : [wstr] 型: LPCTSTR 比較する 1 番目の NULL 終端文字列。
lpString2 : [wstr] 型: LPCTSTR 比較する 2 番目の NULL 終端文字列。
%inst
2 つの文字列を比較する。比較は大文字小文字を区別する。(Unicode)

[戻り値]
型: int lpString1 が指す文字列が lpString2 より小さい場合、戻り値は負。大きい場合は正。等しい場合は 0。

[備考]
lstrcmp は 2 つの文字列を 1 文字目同士、2
文字目同士のように比較し、不一致を見つけるか文字列末尾に達するまで続ける。lpString1 と lpString2 は NULL
終端でなければならず、さもなければ比較が誤る可能性がある。本関数は CompareStringEx を現在のスレッドロケールで呼び出し、C
ランタイムの文字列比較規約を維持するために結果から 2 を引く。セットアップ時または Control Panel で選択された言語
(ユーザーロケール) によりどの文字列が大きいかが決まる。ユーザーロケールが選択されていなければ既定値で比較する。DBCS
版システムでは本関数は 2 つの DBCS 文字列を比較できる。lstrcmp はワードソート (string sort ではなく)
を使う。ワードソートはハイフンやアポストロフィを他の非英数記号と異なる扱いにし、"coop" と "co-op"
のような単語をソート済みリスト内で隣接させる。詳細は Handling Sorting in Your Applications
を参照。比較関数選択に関するセキュリティ考察は Security Considerations: International
Features を参照。


%index
lstrcmpiW
2 つの文字列を比較する。比較は大文字小文字を区別しない。(Unicode)
%group
Win32 kernel32
%prm
lpString1, lpString2
lpString1 : [wstr] 型: LPCTSTR 比較する 1 番目の NULL 終端文字列。
lpString2 : [wstr] 型: LPCTSTR 比較する 2 番目の NULL 終端文字列。
%inst
2 つの文字列を比較する。比較は大文字小文字を区別しない。(Unicode)

[戻り値]
型: int lpString1 が指す文字列が lpString2 より小さい場合、戻り値は負。大きい場合は正。等しい場合は 0。

[備考]
lstrcmpi は 2 つの文字列を 1 文字目同士、2
文字目同士のように比較し、不一致を見つけるか文字列末尾に達するまで続ける。lpString1 と lpString2 は NULL
終端でなければならず、さもなければ比較が誤る可能性がある。本関数は CompareStringEx
を現在のスレッドロケールで呼び出し、結果から 2 を引く。一部のロケールでは lstrcmpi では不十分なことがある。その場合は
CompareStringEx を使い適切な比較を行う。たとえば日本では
NORM_IGNORECASE、NORM_IGNOREKANATYPE、NORM_IGNOREWIDTH
を指定するとよい。NORM_IGNOREKANATYPE と NORM_IGNOREWIDTH
はアジア以外のロケールでは無視されるので、すべてのロケールで設定して文化的に正しい不感ソートを保証できる。ただしこれらは性能を低下させるので必要時のみ使う。DBCS
版システムでは本関数は 2 つの DBCS 文字列を比較できる。lstrcmpi はワードソートを使う。


%index
lstrcpyW
文字列をバッファにコピーする。(Unicode)
%group
Win32 kernel32
%prm
lpString1, lpString2
lpString1 : [wstr] 型: LPTSTR lpString2 が指す文字列の内容を受け取るバッファ。終端 NULL を含む文字列を格納するのに十分な大きさである必要がある。
lpString2 : [wstr] 型: LPTSTR コピーする NULL 終端文字列。
%inst
文字列をバッファにコピーする。(Unicode)

[戻り値]
型: LPTSTR 関数が成功した場合、戻り値はバッファへのポインタ。関数が失敗した場合、戻り値は NULL で、lpString1 は
NULL 終端されていない可能性がある。

[備考]
DBCS 版システムでは本関数で DBCS 文字列をコピーできる。lstrcpy
はソースバッファと宛先バッファが重なる場合の動作が未定義。セキュリティに関する備考:
本関数を誤って使うとアプリケーションのセキュリティが損なわれる可能性がある。本関数は SEH でアクセス違反などのエラーを捕捉する。SEH
エラーを捕捉した場合、文字列を NULL 終端せず呼び出し側に通知せずに NULL
を返す。呼び出し側は不十分な空間がエラー条件であると安全に仮定できない。lpString1 は lpString2 と終端 '\0'
を保持するのに十分な大きさが必要で、さもなければバッファオーバーランが発生し得る。バッファオーバーフローはアプリケーションのセキュリティ問題の原因となり、サービス拒否攻撃に繋がり得る。最悪の場合、攻撃者がプロセスに実行可能コードを注入できる可能性がある。代わりに
StringCchCopy の使用を検討する。


%index
lstrcpynW
ソース文字列からバッファに指定数の文字をコピーする。警告 使用しないこと。(Unicode)
%group
Win32 kernel32
%prm
lpString1, lpString2, iMaxLength
lpString1 : [wstr] 型: LPTSTR コピーされた文字を受け取る宛先バッファ。終端 NULL の領域も含めて iMaxLength で指定された TCHAR 値を格納するのに十分な大きさが必要。
lpString2 : [wstr] 型: LPCTSTR コピー元の文字列。
iMaxLength : [int] 型: int 終端 NULL を含めて、lpString2 が指す文字列から lpString1 が指すバッファにコピーする TCHAR 値の数。
%inst
ソース文字列からバッファに指定数の文字をコピーする。警告 使用しないこと。(Unicode)

[戻り値]
型: LPTSTR 関数が成功した場合、戻り値はバッファへのポインタ。ソース文字列が iMaxLength
より長くても成功する。関数が失敗した場合、戻り値は NULL で、lpString1 は NULL 終端されていない可能性がある。

[備考]
lpString1 が指すバッファは終端 NULL を含むのに十分な大きさが必要で、iMaxLength で指定された文字列長値には終端
NULL の領域が含まれる。lstrcpyn はソースバッファと宛先バッファが重なる場合の動作が未定義。セキュリティ警告:
本関数を誤って使うとアプリケーションのセキュリティが損なわれる可能性がある。本関数は SEH でアクセス違反などのエラーを捕捉する。SEH
エラーを捕捉した場合、NULL 終端せず呼び出し側に通知せずに NULL を返す。lpString1
が指すバッファがコピー文字列を格納するのに十分でない場合、バッファオーバーランが発生し得る。文字列全体をコピーする際、sizeof
はバイト数を返すことに注意。たとえば lpString1 が TCHAR szString[100] と宣言された szString1
を指す場合、sizeof(szString1) はバイト単位のサイズとなり、Unicode
版でバッファオーバーフローを引き起こす可能性がある。sizeof(szString1)/sizeof(szString1[0])
を使うと適切なサイズが得られる。代わりに StringCchCopy の使用を検討する。


%index
lstrlenW
指定した文字列の長さ（終端 NULL 文字を含まない）を返す。(Unicode)
%group
Win32 kernel32
%prm
lpString
lpString : [wstr] 型: LPCTSTR 長さを調べる NULL 終端文字列。
%inst
指定した文字列の長さ（終端 NULL 文字を含まない）を返す。(Unicode)

[戻り値]
型: int 戻り値は文字列の長さ（文字単位）。lpString が NULL の場合、関数は 0 を返す。

[備考]
> [!NOTE] > winbase.h ヘッダは lstrlen を、UNICODE プリプロセッサ定数の有無により
ANSI/Unicode 版を自動選択するエイリアスとして定義する。

