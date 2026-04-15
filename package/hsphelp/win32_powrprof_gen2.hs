; ============================================================
;   powrprof.dll ヘルプ (CsWin32 / win32metadata から自動抽出)
;   docs_ja.json に日本語訳があればそちらを使用、無ければ英語原文。
;   翻訳を追加するときは docs_ja.json を編集して再生成。
; ============================================================

%index
CallNtPowerInformation
電源情報を設定または取得する。
%group
Win32 powrprof
%prm
InformationLevel, InputBuffer, InputBufferLength, OutputBuffer, OutputBufferLength
InformationLevel : [int] 要求する情報レベル。この値は設定または取得する電源情報を示す。このパラメータは POWER_INFORMATION_LEVEL 列挙型の値のいずれかでなければならない。
InputBuffer : [intptr] オプションの入力バッファへのポインタ。このバッファのデータ型は InformationLevel パラメータで要求された情報レベルに依存する。
InputBufferLength : [int] 入力バッファのサイズ (バイト単位)。
OutputBuffer : [intptr] オプションの出力バッファへのポインタ。このバッファのデータ型は InformationLevel パラメータで要求された情報レベルに依存する。バッファが情報を格納するには小さすぎる場合、関数は STATUS_BUFFER_TOO_SMALL を返す。
OutputBufferLength : [int] 出力バッファのサイズ (バイト単位)。要求する情報レベルによっては可変サイズのバッファとなることがある。
%inst
電源情報を設定または取得する。

[戻り値]
関数が成功すると、戻り値は STATUS_SUCCESS となる。関数が失敗した場合、戻り値は次のいずれかのステータスコードとなりうる。
このドキュメントは省略されている。

[備考]
CallNtPowerInformation
により現在のシステム電源ポリシーに加えた変更は即時に反映されるが永続的ではない。つまり変更は電源スキームの一部としては保存されない。CallNtPowerInformation
で行ったシステム電源ポリシーの変更は、ユーザーが電源オプション コントロール パネルで行うポリシー
スキーム変更や、WritePwrScheme、SetActivePwrScheme
等のその後の呼び出しにより上書きされうる。PowrProf.h の使用方法の詳細は Power Schemes を参照。


%index
CanUserWritePwrScheme
現在のユーザーが電源スキームを書き込む十分な権限を持つか判定する。
%group
Win32 powrprof
%prm

%inst
現在のユーザーが電源スキームを書き込む十分な権限を持つか判定する。

[戻り値]
現在のユーザーが電源スキームを書き込む十分な権限を持つ場合、関数は TRUE を返す。関数が失敗した場合、戻り値は 0
となる。拡張エラー情報を取得するには GetLastError を呼び出す。考えられるエラー値を以下に示す。
このドキュメントは省略されている。

[備考]
この関数は、アプリケーションがユーザーを偽装している場合に有用である。PowrProf.h の使用方法の詳細は Power Schemes
を参照。


%index
DeletePwrScheme
指定された電源スキームを削除する。
%group
Win32 powrprof
%prm
uiID
uiID : [int] 削除する電源スキームのインデックス。
%inst
指定された電源スキームを削除する。

[戻り値]
関数が成功すると、戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼び出す。

[備考]
アプリケーションは DeletePwrScheme
を呼び出すことで電源スキームを完全に削除できる。現在アクティブな電源スキームの削除は失敗し、LastError は
ERROR_ACCESS_DENIED に設定される。PowrProf.h の使用方法の詳細は Power Schemes を参照。


%index
DevicePowerClose
デバイスリスト内のすべてのノードを解放し、デバイスリストを破棄する。
%group
Win32 powrprof
%prm

%inst
デバイスリスト内のすべてのノードを解放し、デバイスリストを破棄する。

[戻り値]
関数が成功すると、戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。


%index
DevicePowerEnumDevices
指定された条件を満たすシステム上のデバイスを列挙する。
%group
Win32 powrprof
%prm
QueryIndex, QueryInterpretationFlags, QueryFlags, pReturnBuffer, pBufferSize
QueryIndex : [int] 要求するデバイスのインデックス。初回の呼び出しではこの値は 0 とする。
QueryInterpretationFlags : [int] 検索結果に適用する条件。
QueryFlags : [int] クエリ条件。
pReturnBuffer : [var] 要求された情報を受け取るバッファへのポインタ。
pBufferSize : [var] 戻りバッファのサイズ (バイト単位)。
%inst
指定された条件を満たすシステム上のデバイスを列挙する。

[戻り値]
関数が成功すると、戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。

[備考]
QueryFlags パラメータの値は組み合わせて、複数の条件を満たすデバイスを問い合わせることができる。例えば
PDCAP_D3_SUPPORTED | PDCAP_D1_SUPPORTED を QueryFlags として渡すと、D3 または D1
のいずれかをサポートするデバイスを検索する。QueryFlags と QueryInterpretationFlags に
DEVICEPOWER_AND_OPERATION を組み合わせると、要求されたすべての条件を満たすデバイスを検索できる。


%index
DevicePowerOpen
すべてのデバイスを問い合わせてデバイスリストを初期化する。
%group
Win32 powrprof
%prm
DebugMask
DebugMask : [int] 予約済み。0 でなければならない。
%inst
すべてのデバイスを問い合わせてデバイスリストを初期化する。

[戻り値]
関数が成功すると、戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。


%index
DevicePowerSetDeviceState
指定されたデバイス上の指定データを変更する。
%group
Win32 powrprof
%prm
DeviceDescription, SetFlags, SetData
DeviceDescription : [wstr] 変更するデバイスの名前またはハードウェア識別子文字列。
SetFlags : [int] 変更するデバイスのプロパティ。
SetData : [intptr] 予約済み。NULL でなければならない。
%inst
指定されたデバイス上の指定データを変更する。

[戻り値]
関数が成功すると、戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼び出す。


%index
EnumPwrSchemes
すべての電源スキームを列挙する。
%group
Win32 powrprof
%prm
lpfn, lParam
lpfn : [int] 列挙される各電源スキームに対して呼び出されるコールバック関数へのポインタ。詳細は解説を参照。
lParam : [intptr] コールバック関数に渡すユーザー定義値。
%inst
すべての電源スキームを列挙する。

[戻り値]
関数が成功すると、戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼び出す。

[備考]
列挙される各電源スキームに対して、コールバック関数は次のパラメータで呼び出される。
このドキュメントは省略されている。


%index
GetActivePwrScheme
アクティブな電源スキームのインデックスを取得する。
%group
Win32 powrprof
%prm
puiID
puiID : [var] アクティブな電源スキームのインデックスを受け取る変数へのポインタ。
%inst
アクティブな電源スキームのインデックスを取得する。

[戻り値]
関数が成功すると、戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼び出す。

[備考]
アクティブな電源スキームは、ユーザーが電源オプション コントロール パネルで新しい電源スキームを設定するか、アプリケーションが
SetActivePwrScheme 関数を呼び出すまで有効のままである。PowrProf.h の使用方法の詳細は Power
Schemes を参照。


%index
GetCurrentPowerPolicies
現在のシステム電源ポリシー設定を取得する。
%group
Win32 powrprof
%prm
pGlobalPowerPolicy, pPowerPolicy
pGlobalPowerPolicy : [var] 現在のグローバル電源ポリシー設定を受け取る GLOBAL_POWER_POLICY 構造体へのポインタ。
pPowerPolicy : [var] アクティブな電源スキームに固有の電源ポリシー設定を受け取る POWER_POLICY 構造体へのポインタ。
%inst
現在のシステム電源ポリシー設定を取得する。

[戻り値]
関数が成功すると、戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼び出す。

[備考]
現在の電源ポリシー設定を更新するには WriteGlobalPwrPolicy または WritePwrScheme
関数を呼び出す。PowrProf.h の使用方法の詳細は Power Schemes を参照。


%index
GetPwrCapabilities
システムの電源機能に関する情報を取得する。
%group
Win32 powrprof
%prm
lpspc
lpspc : [var] 情報を受け取る SYSTEM_POWER_CAPABILITIES 構造体へのポインタ。
%inst
システムの電源機能に関する情報を取得する。

[戻り値]
関数が成功すると、戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼び出す。

[備考]

この関数は、現在のシステム電源管理のハードウェアリソースおよび機能に関する詳細情報を取得する。電源ボタン、リッドスイッチ、バッテリーなどのハードウェア機能の有無、現在サポートされている最低スリープ状態や休止ファイルの存在など、動的に変化しうる構成情報も含まれる。この情報は
CallNtPowerInformation 関数に SystemPowerCapabilities
レベルを指定して取得することもできる。PowrProf.h の使用方法の詳細は Power Schemes を参照。


%index
GetPwrDiskSpindownRange
ディスクスピンダウンの範囲を取得する。
%group
Win32 powrprof
%prm
puiMax, puiMin
puiMax : [var] ディスクスピンダウンの最大時間 (秒単位)。
puiMin : [var] ディスクスピンダウンの最小時間 (秒単位)。
%inst
ディスクスピンダウンの範囲を取得する。

[戻り値]
関数が成功すると、戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼び出す。

[備考]
Windows Vista 以降では、システムのハードディスクドライブの電源管理設定は GUID_DISK_SUBGROUP
電源設定サブグループを通じて制御される。個別設定を列挙するには PowerEnumerate 関数を使用する。PowrProf.h
の使用方法の詳細は Power Schemes を参照。


%index
IsAdminOverrideActive
(no summary)
%group
Win32 powrprof
%prm
papp
papp : [var] 
%inst



%index
IsPwrHibernateAllowed
コンピュータが休止状態をサポートするか判定する。
%group
Win32 powrprof
%prm

%inst
コンピュータが休止状態をサポートするか判定する。

[戻り値]
コンピュータが休止状態 (電源状態 S4) をサポートし Hiberfil.sys ファイルがシステムに存在する場合、関数は TRUE
を返す。そうでない場合、関数は FALSE を返す。

[備考]
この情報は CallNtPowerInformation 関数からも取得できる。値は SYSTEM_POWER_CAPABILITIES
構造体の SystemS4 メンバーで返される。PowrProf.h の使用方法の詳細は Power Schemes を参照。


%index
IsPwrShutdownAllowed
コンピュータがソフトオフ電源状態をサポートするか判定する。
%group
Win32 powrprof
%prm

%inst
コンピュータがソフトオフ電源状態をサポートするか判定する。

[戻り値]
コンピュータがソフトオフ (電源状態 S5) をサポートする場合、関数は TRUE を返す。そうでない場合、FALSE を返す。

[備考]
この情報は CallNtPowerInformation 関数からも取得できる。値は SYSTEM_POWER_CAPABILITIES
構造体の SystemS5 メンバーで返される。Windows Vista
以降ではコンピュータはソフトオフ電源状態をサポートする必要があるため、この関数は Windows Server 2003 以前の OS
のみ意味を持つ。PowrProf.h の使用方法の詳細は Power Schemes を参照。


%index
IsPwrSuspendAllowed
コンピュータがスリープ状態をサポートするか判定する。
%group
Win32 powrprof
%prm

%inst
コンピュータがスリープ状態をサポートするか判定する。

[戻り値]
コンピュータがスリープ状態 (S1、S2、S3) をサポートする場合、関数は TRUE を返す。そうでない場合、FALSE を返す。

[備考]
この情報は CallNtPowerInformation 関数からも取得できる。SYSTEM_POWER_CAPABILITIES
構造体の SystemS1、SystemS2、SystemS3 メンバーを確認する。PowrProf.h の使用方法の詳細は Power
Schemes を参照。


%index
PowerCanRestoreIndividualDefaultPowerScheme
現在のユーザーが指定された電源スキームのデータにアクセスでき、必要なら復元可能かを判定する。
%group
Win32 powrprof
%prm
SchemeGuid
SchemeGuid : [var] 電源スキームの識別子。
%inst
現在のユーザーが指定された電源スキームのデータにアクセスでき、必要なら復元可能かを判定する。

[戻り値]
呼び出しが成功した場合は ERROR_SUCCESS (0) を返す。失敗した場合は 0 以外の値を返す。


%index
PowerCreatePossibleSetting
指定された電源設定の候補値を作成する。
%group
Win32 powrprof
%prm
RootSystemPowerKey, SubGroupOfPowerSettingsGuid, PowerSettingGuid, PossibleSettingIndex
RootSystemPowerKey : [intptr] このパラメータは将来の使用のために予約されている。NULL を設定する必要がある。
SubGroupOfPowerSettingsGuid : [var] 
PowerSettingGuid : [var] 作成対象の電源設定の識別子。
PossibleSettingIndex : [int] 作成する候補設定の 0 始まりのインデックス。
%inst
指定された電源設定の候補値を作成する。

[戻り値]
呼び出しが成功した場合は ERROR_SUCCESS (0) を返す。失敗した場合は 0 以外の値を返す。


%index
PowerCreateSetting
指定された電源設定の設定値を作成する。
%group
Win32 powrprof
%prm
RootSystemPowerKey, SubGroupOfPowerSettingsGuid, PowerSettingGuid
RootSystemPowerKey : [intptr] このパラメータは将来の使用のために予約されている。NULL を設定する必要がある。
SubGroupOfPowerSettingsGuid : [var] 
PowerSettingGuid : [var] 作成対象の電源設定の識別子。
%inst
指定された電源設定の設定値を作成する。

[戻り値]
呼び出しが成功した場合は ERROR_SUCCESS (0) を返す。失敗した場合は 0 以外の値を返す。


%index
PowerDeleteScheme
指定された電源スキームをデータベースから削除する。
%group
Win32 powrprof
%prm
RootPowerKey, SchemeGuid
RootPowerKey : [intptr] このパラメータは将来の使用のために予約されている。NULL を設定する必要がある。
SchemeGuid : [var] 電源スキームの識別子。
%inst
指定された電源スキームをデータベースから削除する。

[戻り値]
呼び出しが成功した場合は ERROR_SUCCESS (0) を返す。失敗した場合は 0 以外の値を返す。


%index
PowerDeterminePlatformRole
Windows 7、Windows Server 2008 R2、Windows Vista または Windows Server 2008 のコンピュータ役割を判定する。
%group
Win32 powrprof
%prm

%inst
Windows 7、Windows Server 2008 R2、Windows Vista または Windows Server
2008 のコンピュータ役割を判定する。

[戻り値]
戻り値は POWER_PLATFORM_ROLE 列挙型の値のいずれかとなる。

[備考]
この関数は ACPI Fixed ACPI Description Table (FADT) を読み取り、OEM
が推奨するコンピュータの役割を判定する。情報が取得できない場合、関数はバッテリーを検索する。少なくとも 1
つのバッテリーが利用可能な場合は PlatformRoleMobile を返す。バッテリーが無ければ
PlatformRoleDesktop を返す。
注意 この API には新しいバージョンがある。Windows 7 および Windows Server 2008 R2
以降に定義されたプラットフォーム役割を問い合わせるには PowerDeterminePlatformRoleEx を使用する。


%index
PowerDeterminePlatformRoleEx
指定されたプラットフォームのコンピュータ役割を判定する。
%group
Win32 powrprof
%prm
Version
Version : [int] 
%inst
指定されたプラットフォームのコンピュータ役割を判定する。

[戻り値]
戻り値は指定したバージョンの POWER_PLATFORM_ROLE 列挙型の値のいずれかとなる。

[備考]
この関数は ACPI Fixed ACPI Description Table (FADT) を読み取り、OEM
が推奨するコンピュータの役割を判定する。情報が取得できない場合、関数はバッテリーを検索する。少なくとも 1
つのバッテリーが利用可能な場合は PlatformRoleMobile を返す。バッテリーが無ければ
PlatformRoleDesktop を返す。呼び出し元が指定したプラットフォームで OEM
推奨のコンピュータ役割がサポートされていない場合、最も近いサポート値を返す。例えばタブレットデバイスで Version に
POWER_PLATFORM_ROLE_V1 を指定して PowerDeterminePlatformRoleEx を呼び出すと
PlatformRoleMobile が返る。


%index
PowerDuplicateScheme
既存の電源スキームを複製する。
%group
Win32 powrprof
%prm
RootPowerKey, SourceSchemeGuid, DestinationSchemeGuid
RootPowerKey : [intptr] このパラメータは将来の使用のために予約されている。NULL を設定する必要がある。
SourceSchemeGuid : [var] 複製対象の電源スキームの識別子。
DestinationSchemeGuid : [var] GUID へのポインタのアドレス。ポインタが NULL を含む場合、関数は新しい GUID 用のメモリを確保し、そのアドレスをポインタに設定する。呼び出し元は LocalFree で解放できる。
%inst
既存の電源スキームを複製する。

[戻り値]
呼び出しが成功した場合は ERROR_SUCCESS (0) を返す。失敗した場合は 0 以外の値を返す。
このドキュメントは省略されている。


%index
PowerEnumerate
電源スキーム内の指定要素を列挙する。
%group
Win32 powrprof
%prm
RootPowerKey, SchemeGuid, SubGroupOfPowerSettingsGuid, AccessFlags, Index, Buffer, BufferSize
RootPowerKey : [intptr] このパラメータは将来の使用のために予約されている。NULL を設定する必要がある。
SchemeGuid : [var] 電源スキームの識別子。このパラメータが NULL の場合、電源ポリシーの列挙が返される。
SubGroupOfPowerSettingsGuid : [var] 電源設定のサブグループ。このパラメータが NULL の場合、PolicyGuid キー配下の設定列挙が返される。
AccessFlags : [int] 何を列挙するかを指定するフラグのセット。
Index : [int] 列挙するスキーム、サブグループ、または設定の 0 始まりのインデックス。
Buffer : [var] 要素を受け取る変数へのポインタ。このパラメータが NULL の場合、関数は必要なバッファサイズを取得する。
BufferSize : [var] 入力時に Buffer が指すバッファのサイズを含む変数へのポインタ。Buffer が NULL または BufferSize が不足する場合、関数は ERROR_MORE_DATA を返し、変数には必要なバッファサイズが格納される。
%inst
電源スキーム内の指定要素を列挙する。

[戻り値]
呼び出しが成功した場合は ERROR_SUCCESS (0) を返す。失敗した場合は 0 以外の値を返す。BufferSize
が小さすぎるか Buffer が NULL の場合、ERROR_MORE_DATA を返し、BufferSize が指す DWORD
には必要なバッファサイズが設定される。


%index
PowerGetActiveScheme
アクティブな電源スキームを取得し、そのスキームを識別する GUID を返す。
%group
Win32 powrprof
%prm
UserRootPowerKey, ActivePolicyGuid
UserRootPowerKey : [intptr] このパラメータは将来の使用のために予約されている。NULL を設定する必要がある。
ActivePolicyGuid : [var] GUID 構造体へのポインタを受け取るポインタ。このメモリは LocalFree 関数で解放する。
%inst
アクティブな電源スキームを取得し、そのスキームを識別する GUID を返す。

[戻り値]
呼び出しが成功した場合は ERROR_SUCCESS (0) を返す。失敗した場合は 0 以外の値を返す。


%index
PowerImportPowerScheme
ファイルから電源スキームをインポートする。
%group
Win32 powrprof
%prm
RootPowerKey, ImportFileNamePath, DestinationSchemeGuid
RootPowerKey : [intptr] このパラメータは将来の使用のために予約されている。NULL を設定する必要がある。
ImportFileNamePath : [wstr] PowerCfg.Exe /Export で作成された電源スキーム バックアップ ファイルのパス。
DestinationSchemeGuid : [var] GUID へのポインタへのポインタ。ポインタが NULL を含む場合、関数は新しい GUID 用のメモリを確保しそのアドレスをポインタに設定する。呼び出し元は LocalFree で解放できる。
%inst
ファイルから電源スキームをインポートする。

[戻り値]
呼び出しが成功した場合は ERROR_SUCCESS (0) を返す。失敗した場合は 0 以外の値を返す。


%index
PowerIsSettingRangeDefined
指定された電源設定が値の範囲を表すかを問い合わせる。
%group
Win32 powrprof
%prm
SubKeyGuid, SettingGuid
SubKeyGuid : [var] 検索するサブキーの識別子。
SettingGuid : [var] 問い合わせる電源設定の識別子。
%inst
指定された電源設定が値の範囲を表すかを問い合わせる。

[戻り値]
SubKeyGuid で指定したレジストリキーが単一の電源設定を表す場合は TRUE。範囲を表す場合は FALSE を返す。


%index
PowerOpenSystemPowerKey
(no summary)
%group
Win32 powrprof
%prm
phSystemPowerKey, Access, OpenExisting
phSystemPowerKey : [intptr] 
Access : [int] 
OpenExisting : [int] 
%inst



%index
PowerOpenUserPowerKey
(no summary)
%group
Win32 powrprof
%prm
phUserPowerKey, Access, OpenExisting
phUserPowerKey : [intptr] 
Access : [int] 
OpenExisting : [int] 
%inst



%index
PowerReadACDefaultIndex
指定された電源設定の既定 AC インデックスを取得する。
%group
Win32 powrprof
%prm
RootPowerKey, SchemePersonalityGuid, SubGroupOfPowerSettingsGuid, PowerSettingGuid, AcDefaultIndex
RootPowerKey : [intptr] このパラメータは将来の使用のために予約されている。NULL を設定する必要がある。
SchemePersonalityGuid : [var] この電源設定のスキーム パーソナリティの識別子。電源スキームのパーソナリティに応じて既定値が異なる場合がある。
SubGroupOfPowerSettingsGuid : [var] 
PowerSettingGuid : [var] 対象の電源設定の識別子。
AcDefaultIndex : [var] 既定の AC インデックスを受け取る変数へのポインタ。
%inst
指定された電源設定の既定 AC インデックスを取得する。

[戻り値]
呼び出しが成功した場合は ERROR_SUCCESS (0) を返す。失敗した場合は 0 以外の値を返す。


%index
PowerReadACValue
指定された電源設定の AC 電源値を取得する。
%group
Win32 powrprof
%prm
RootPowerKey, SchemeGuid, SubGroupOfPowerSettingsGuid, PowerSettingGuid, Type, Buffer, BufferSize
RootPowerKey : [intptr] このパラメータは将来の使用のために予約されている。NULL を設定する必要がある。
SchemeGuid : [var] 電源スキームの識別子。
SubGroupOfPowerSettingsGuid : [var] 
PowerSettingGuid : [var] 電源設定の識別子。
Type : [var] 値のデータ型を受け取る変数へのポインタ。可能な値は Registry Value Types を参照。NULL を指定するとデータ型は返されない。
Buffer : [var] データ値を受け取るバッファへのポインタ。NULL の場合は BufferSize に必要なバッファサイズが返る。
BufferSize : [var] Buffer が指すバッファのサイズを含む変数へのポインタ。Buffer が NULL の場合、関数は ERROR_SUCCESS を返し変数に必要なサイズを設定する。サイズが不足している場合は ERROR_MORE_DATA を返し必要サイズを設定する。
%inst
指定された電源設定の AC 電源値を取得する。

[戻り値]
呼び出しが成功した場合は ERROR_SUCCESS (0) を返す。失敗した場合は 0 以外の値を返す。BufferSize
が小さすぎる場合は ERROR_MORE_DATA が返り、BufferSize には必要サイズが設定される。


%index
PowerReadACValueIndex
指定された電源設定の AC インデックスを取得する。
%group
Win32 powrprof
%prm
RootPowerKey, SchemeGuid, SubGroupOfPowerSettingsGuid, PowerSettingGuid, AcValueIndex
RootPowerKey : [intptr] このパラメータは将来の使用のために予約されている。NULL を設定する必要がある。
SchemeGuid : [var] 電源スキームの識別子。
SubGroupOfPowerSettingsGuid : [var] 
PowerSettingGuid : [var] 電源設定の識別子。
AcValueIndex : [var] AC 値のインデックスを受け取る変数へのポインタ。
%inst
指定された電源設定の AC インデックスを取得する。

[戻り値]
呼び出しが成功した場合は ERROR_SUCCESS (0) を返す。失敗した場合は 0 以外の値を返す。


%index
PowerReadDCDefaultIndex
指定された電源設定の既定 DC インデックスを取得する。
%group
Win32 powrprof
%prm
RootPowerKey, SchemePersonalityGuid, SubGroupOfPowerSettingsGuid, PowerSettingGuid, DcDefaultIndex
RootPowerKey : [intptr] このパラメータは将来の使用のために予約されている。NULL を設定する必要がある。
SchemePersonalityGuid : [var] この電源設定のスキーム パーソナリティの識別子。電源スキームのパーソナリティに応じて既定値が異なる場合がある。
SubGroupOfPowerSettingsGuid : [var] 
PowerSettingGuid : [var] 電源設定の識別子。
DcDefaultIndex : [var] 既定の DC インデックスを受け取る変数へのポインタ。
%inst
指定された電源設定の既定 DC インデックスを取得する。

[戻り値]
呼び出しが成功した場合は ERROR_SUCCESS (0) を返す。失敗した場合は 0 以外の値を返す。


%index
PowerReadDCValue
指定された電源設定の DC 電源値を取得する。
%group
Win32 powrprof
%prm
RootPowerKey, SchemeGuid, SubGroupOfPowerSettingsGuid, PowerSettingGuid, Type, Buffer, BufferSize
RootPowerKey : [intptr] このパラメータは将来の使用のために予約されている。NULL を設定する必要がある。
SchemeGuid : [var] 電源スキームの識別子。
SubGroupOfPowerSettingsGuid : [var] 
PowerSettingGuid : [var] 電源設定の識別子。
Type : [var] 値のデータ型を受け取る変数へのポインタ。可能な値は Registry Value Types を参照。NULL を指定するとデータ型は返されない。
Buffer : [var] データ値を受け取る変数へのポインタ。NULL の場合は BufferSize に必要なサイズが返る。
BufferSize : [var] Buffer が指すバッファのサイズを含む変数へのポインタ。Buffer が NULL の場合、ERROR_SUCCESS を返し必要サイズが設定される。不足の場合は ERROR_MORE_DATA を返し必要サイズが設定される。
%inst
指定された電源設定の DC 電源値を取得する。

[戻り値]
呼び出しが成功した場合は ERROR_SUCCESS (0) を返す。失敗した場合は 0 以外の値を返す。BufferSize
が小さすぎる場合は ERROR_MORE_DATA が返り、BufferSize には必要サイズが設定される。


%index
PowerReadDCValueIndex
指定された電源設定の DC 値インデックスを取得する。
%group
Win32 powrprof
%prm
RootPowerKey, SchemeGuid, SubGroupOfPowerSettingsGuid, PowerSettingGuid, DcValueIndex
RootPowerKey : [intptr] このパラメータは将来の使用のために予約されている。NULL を設定する必要がある。
SchemeGuid : [var] 電源スキームの識別子。
SubGroupOfPowerSettingsGuid : [var] 電源設定のサブグループの識別子。既定の電源スキームを参照するには NO_SUBGROUP_GUID を使用する。Windows 付属のサブグループ値を以下に示す。
PowerSettingGuid : [var] 電源設定の識別子。
DcValueIndex : [var] DC 値のインデックスを受け取る変数へのポインタ。
%inst
指定された電源設定の DC 値インデックスを取得する。

[戻り値]
呼び出しが成功した場合は ERROR_SUCCESS (0) を返す。失敗した場合は 0 以外の値を返す。


%index
PowerReadDescription
指定された電源設定、サブグループ、またはスキームの説明を取得する。
%group
Win32 powrprof
%prm
RootPowerKey, SchemeGuid, SubGroupOfPowerSettingsGuid, PowerSettingGuid, Buffer, BufferSize
RootPowerKey : [intptr] このパラメータは将来の使用のために予約されている。NULL を設定する必要がある。
SchemeGuid : [var] 電源スキームの識別子。
SubGroupOfPowerSettingsGuid : [var] 
PowerSettingGuid : [var] 使用する電源設定の識別子。
Buffer : [var] 説明を受け取るバッファへのポインタ。NULL の場合は BufferSize に必要なサイズが返る。返される文字列はすべてワイド (Unicode) 文字列である。
BufferSize : [var] Buffer が指すバッファのサイズを含む変数へのポインタ。Buffer が NULL の場合は ERROR_SUCCESS を返し必要サイズを設定する。不足の場合は ERROR_MORE_DATA を返し必要サイズを設定する。
%inst
指定された電源設定、サブグループ、またはスキームの説明を取得する。

[戻り値]
呼び出しが成功した場合は ERROR_SUCCESS (0) を返す。失敗した場合は 0 以外の値を返す。BufferSize
が小さすぎる場合、関数は ERROR_SUCCESS を返し BufferSize に必要サイズを設定する。


%index
PowerReadFriendlyName
指定された電源設定、サブグループ、またはスキームのフレンドリ名を取得する。
%group
Win32 powrprof
%prm
RootPowerKey, SchemeGuid, SubGroupOfPowerSettingsGuid, PowerSettingGuid, Buffer, BufferSize
RootPowerKey : [intptr] このパラメータは将来の使用のために予約されている。NULL を設定する必要がある。
SchemeGuid : [var] 電源スキームの識別子。
SubGroupOfPowerSettingsGuid : [var] 電源設定のサブグループ。既定の電源スキームを参照するには NO_SUBGROUP_GUID を使用する。
PowerSettingGuid : [var] 使用する電源設定の識別子。
Buffer : [var] フレンドリ名を受け取るバッファへのポインタ。NULL の場合は BufferSize に必要なサイズが返る。返される文字列はすべてワイド (Unicode) 文字列である。
BufferSize : [var] Buffer が指すバッファのサイズを含む変数へのポインタ。Buffer が NULL の場合は ERROR_SUCCESS を返し必要サイズを設定する。不足の場合は ERROR_MORE_DATA を返し必要サイズを設定する。
%inst
指定された電源設定、サブグループ、またはスキームのフレンドリ名を取得する。

[戻り値]
呼び出しが成功した場合は ERROR_SUCCESS (0) を返す。失敗した場合は 0 以外の値を返す。BufferSize
が小さすぎる場合は ERROR_MORE_DATA が返り、BufferSize には必要サイズが設定される。


%index
PowerReadIconResourceSpecifier
指定された電源設定、サブグループ、またはスキームのアイコン リソースを取得する。
%group
Win32 powrprof
%prm
RootPowerKey, SchemeGuid, SubGroupOfPowerSettingsGuid, PowerSettingGuid, Buffer, BufferSize
RootPowerKey : [intptr] このパラメータは将来の使用のために予約されている。NULL を設定する必要がある。
SchemeGuid : [var] 電源スキームの識別子。
SubGroupOfPowerSettingsGuid : [var] 
PowerSettingGuid : [var] 電源設定の識別子。
Buffer : [var] アイコン リソースを受け取るバッファへのポインタ。NULL の場合は BufferSize に必要なサイズが返る。
BufferSize : [var] Buffer が指すバッファのサイズを含む変数へのポインタ。Buffer が NULL の場合は ERROR_SUCCESS を返し必要サイズを設定する。不足の場合は ERROR_MORE_DATA を返し必要サイズを設定する。
%inst
指定された電源設定、サブグループ、またはスキームのアイコン リソースを取得する。

[戻り値]
呼び出しが成功した場合は ERROR_SUCCESS (0) を返す。失敗した場合は 0 以外の値を返す。BufferSize
が小さすぎる場合は ERROR_MORE_DATA が返り、BufferSize には必要サイズが設定される。


%index
PowerReadPossibleDescription
電源設定値の候補選択肢の 1 つについて説明を取得する。
%group
Win32 powrprof
%prm
RootPowerKey, SubGroupOfPowerSettingsGuid, PowerSettingGuid, PossibleSettingIndex, Buffer, BufferSize
RootPowerKey : [intptr] このパラメータは将来の使用のために予約されている。NULL を設定する必要がある。
SubGroupOfPowerSettingsGuid : [var] 
PowerSettingGuid : [var] 使用する電源設定の識別子。
PossibleSettingIndex : [int] 候補設定の 0 始まりのインデックス。
Buffer : [var] 説明を受け取るバッファへのポインタ。NULL の場合は BufferSize に必要なサイズが返る。返される文字列はすべてワイド (Unicode) 文字列である。
BufferSize : [var] Buffer が指すバッファのサイズを含む変数へのポインタ。Buffer が NULL の場合は ERROR_SUCCESS を返し必要サイズを設定する。不足の場合は ERROR_MORE_DATA を返し必要サイズを設定する。
%inst
電源設定値の候補選択肢の 1 つについて説明を取得する。

[戻り値]
呼び出しが成功した場合は ERROR_SUCCESS (0) を返す。失敗した場合は 0 以外の値を返す。BufferSize
が小さすぎる場合は ERROR_MORE_DATA が返り、BufferSize には必要サイズが設定される。


%index
PowerReadPossibleFriendlyName
電源設定値の候補選択肢の 1 つについてフレンドリ名を取得する。
%group
Win32 powrprof
%prm
RootPowerKey, SubGroupOfPowerSettingsGuid, PowerSettingGuid, PossibleSettingIndex, Buffer, BufferSize
RootPowerKey : [intptr] このパラメータは将来の使用のために予約されている。NULL を設定する必要がある。
SubGroupOfPowerSettingsGuid : [var] 
PowerSettingGuid : [var] 電源設定の識別子。
PossibleSettingIndex : [int] 候補設定の 0 始まりのインデックス。
Buffer : [var] フレンドリ名を受け取るバッファへのポインタ。NULL の場合は BufferSize に必要なサイズが返る。返される文字列はすべてワイド (Unicode) 文字列である。
BufferSize : [var] Buffer が指すバッファのサイズを含む変数へのポインタ。Buffer が NULL の場合は ERROR_SUCCESS を返し必要サイズを設定する。不足の場合は ERROR_MORE_DATA を返し必要サイズを設定する。
%inst
電源設定値の候補選択肢の 1 つについてフレンドリ名を取得する。

[戻り値]
呼び出しが成功した場合は ERROR_SUCCESS (0) を返す。失敗した場合は 0 以外の値を返す。BufferSize
が小さすぎる場合は ERROR_MORE_DATA が返り、BufferSize には必要サイズが設定される。


%index
PowerReadPossibleValue
電源設定の候補値の値を取得する。
%group
Win32 powrprof
%prm
RootPowerKey, SubGroupOfPowerSettingsGuid, PowerSettingGuid, Type, PossibleSettingIndex, Buffer, BufferSize
RootPowerKey : [intptr] このパラメータは将来の使用のために予約されている。NULL を設定する必要がある。
SubGroupOfPowerSettingsGuid : [var] 
PowerSettingGuid : [var] 電源設定の識別子。
Type : [var] 値のデータ型を受け取る変数へのポインタ。可能な値は Registry Value Types を参照。NULL を指定するとデータ型は返されない。
PossibleSettingIndex : [int] 候補設定の 0 始まりのインデックス。
Buffer : [var] 値を受け取るバッファへのポインタ。NULL の場合は BufferSize に必要なサイズが返る。
BufferSize : [var] Buffer が指すバッファのサイズを含む変数へのポインタ。Buffer が NULL の場合は ERROR_SUCCESS を返し必要サイズを設定する。不足の場合は ERROR_MORE_DATA を返し必要サイズを設定する。
%inst
電源設定の候補値の値を取得する。

[戻り値]
呼び出しが成功した場合は ERROR_SUCCESS (0) を返す。失敗した場合は 0 以外の値を返す。BufferSize
が小さすぎる場合は ERROR_MORE_DATA が返り、BufferSize には必要サイズが設定される。


%index
PowerReadSettingAttributes
指定された電源設定の現在の属性を返す。
%group
Win32 powrprof
%prm
SubGroupGuid, PowerSettingGuid
SubGroupGuid : [var] 
PowerSettingGuid : [var] 使用する電源設定の識別子。
%inst
指定された電源設定の現在の属性を返す。

[戻り値]
指定された電源設定の現在の電源設定属性を返す。属性は電源設定自体の属性とそのサブグループの属性の組み合わせである。
このドキュメントは省略されている。


%index
PowerReadValueIncrement
電源設定の最小値と最大値の間の有効値の増分を取得する。
%group
Win32 powrprof
%prm
RootPowerKey, SubGroupOfPowerSettingsGuid, PowerSettingGuid, ValueIncrement
RootPowerKey : [intptr] このパラメータは将来の使用のために予約されている。NULL を設定する必要がある。
SubGroupOfPowerSettingsGuid : [var] 
PowerSettingGuid : [var] 使用する電源設定の識別子。
ValueIncrement : [var] 指定された電源設定の増分を受け取る変数へのポインタ。
%inst
電源設定の最小値と最大値の間の有効値の増分を取得する。

[戻り値]
呼び出しが成功した場合は ERROR_SUCCESS (0) を返す。失敗した場合は 0 以外の値を返す。


%index
PowerReadValueMax
指定された電源設定の最大値を取得する。
%group
Win32 powrprof
%prm
RootPowerKey, SubGroupOfPowerSettingsGuid, PowerSettingGuid, ValueMaximum
RootPowerKey : [intptr] このパラメータは将来の使用のために予約されている。NULL を設定する必要がある。
SubGroupOfPowerSettingsGuid : [var] 
PowerSettingGuid : [var] 使用する電源設定の識別子。
ValueMaximum : [var] 指定された電源設定の最大値を受け取る変数へのポインタ。
%inst
指定された電源設定の最大値を取得する。

[戻り値]
呼び出しが成功した場合は ERROR_SUCCESS (0) を返す。失敗した場合は 0 以外の値を返す。


%index
PowerReadValueMin
指定された電源設定の最小値を取得する。
%group
Win32 powrprof
%prm
RootPowerKey, SubGroupOfPowerSettingsGuid, PowerSettingGuid, ValueMinimum
RootPowerKey : [intptr] このパラメータは将来の使用のために予約されている。NULL を設定する必要がある。
SubGroupOfPowerSettingsGuid : [var] 
PowerSettingGuid : [var] 使用する電源設定の識別子。
ValueMinimum : [var] 指定された電源設定の最小値を受け取る変数へのポインタ。
%inst
指定された電源設定の最小値を取得する。

[戻り値]
呼び出しが成功した場合は ERROR_SUCCESS (0) を返す。失敗した場合は 0 以外の値を返す。


%index
PowerReadValueUnitsSpecifier
値の範囲をサポートする電源設定の単位を記述するために使用する文字列を読み取る。
%group
Win32 powrprof
%prm
RootPowerKey, SubGroupOfPowerSettingsGuid, PowerSettingGuid, Buffer, BufferSize
RootPowerKey : [intptr] このパラメータは将来の使用のために予約されている。NULL を設定する必要がある。
SubGroupOfPowerSettingsGuid : [var] 
PowerSettingGuid : [var] 使用する電源設定の識別子。
Buffer : [var] 文字列を受け取るバッファへのポインタ。NULL の場合は BufferSize に必要なサイズが返る。返される文字列はすべてワイド (Unicode) 文字列である。
BufferSize : [var] Buffer が指すバッファのサイズを含む変数へのポインタ。Buffer が NULL の場合は ERROR_SUCCESS を返し必要サイズを設定する。不足の場合は ERROR_MORE_DATA を返し必要サイズを設定する。
%inst
値の範囲をサポートする電源設定の単位を記述するために使用する文字列を読み取る。

[戻り値]
呼び出しが成功した場合は ERROR_SUCCESS (0) を返す。失敗した場合は 0 以外の値を返す。BufferSize
が小さすぎる場合は ERROR_MORE_DATA が返り、BufferSize には必要サイズが設定される。


%index
PowerRegisterForEffectivePowerModeNotifications
有効電源モード変更の通知を受け取るコールバックを登録する。
%group
Win32 powrprof
%prm
Version, Callback, Context, RegistrationHandle
Version : [int] 呼び出し元が理解できる最大の有効電源モード バージョンを指定する。有効電源モードがそれより新しい場合、互換性のあるバージョンに縮退してコールバックに渡される。指定可能な値: - EFFECTIVE_POWER_MODE_V1 は Windows 10 バージョン 1809 以降で利用可能で、パフォーマンス電源スライダーとバッテリ セーバー状態を追跡する。- EFFECTIVE_POWER_MODE_V2 は Windows 10 バージョン 1903 以降で利用可能で、パフォーマンス電源スライダー、バッテリ セーバー、ゲーム モード、Windows Mixed Reality 電源状態を追跡する。
Callback : [int] 有効電源モードが変更されたときに呼び出すコールバックへのポインタ。登録時にも現在のモードを供給するため 1 回呼び出される。この API で複数のコールバックを登録した場合、それらは並行して呼ばれることがある。
Context : [intptr] 呼び出し元が指定する不透明なコンテキスト。
RegistrationHandle : [var] 登録のハンドル。通知の登録解除にはこのハンドルを使用する。
%inst
有効電源モード変更の通知を受け取るコールバックを登録する。

[戻り値]
呼び出しが成功した場合は S_OK (0) を返す。失敗した場合は 0 以外の値を返す。

[備考]

登録直後、コールバックは電源設定の現在値で呼び出される。電源モード変更中に登録すると複数回呼び出される可能性があるが、最後のコールバックが最新の更新である。


%index
PowerRegisterSuspendResumeNotification
システムがサスペンドまたはレジュームしたときに通知を受け取るよう登録する。
%group
Win32 powrprof
%prm
Flags, Recipient, RegistrationHandle
Flags : [int] このパラメータは DEVICE_NOTIFY_CALLBACK でなければならない。
Recipient : [intptr] このパラメータは DEVICE_NOTIFY_SUBSCRIBE_PARAMETERS 構造体へのポインタとなる。コールバック関数は DeviceNotifyCallbackRoutine である。コールバック実行時、Type パラメータには発生したイベントの種類が設定される。可能な値は PBT_APMSUSPEND、PBT_APMRESUMESUSPEND、PBT_APMRESUMEAUTOMATIC など。詳細は Power Management Events を参照。Setting パラメータはサスペンド/レジューム通知では使用されない。
RegistrationHandle : [var] 登録のハンドル。通知の登録解除にはこのハンドルを使用する。
%inst
システムがサスペンドまたはレジュームしたときに通知を受け取るよう登録する。

[戻り値]
呼び出しが成功した場合は ERROR_SUCCESS (0) を返す。失敗した場合は 0 以外の値を返す。


%index
PowerRemovePowerSetting
指定された電源設定を削除する。
%group
Win32 powrprof
%prm
PowerSettingSubKeyGuid, PowerSettingGuid
PowerSettingSubKeyGuid : [var] 
PowerSettingGuid : [var] 削除する電源設定の識別子。
%inst
指定された電源設定を削除する。

[戻り値]
呼び出しが成功した場合は ERROR_SUCCESS (0) を返す。失敗した場合は 0 以外の値を返す。


%index
PowerReplaceDefaultPowerSchemes
既定の電源スキームを現在のユーザーの電源スキームで置き換える。
%group
Win32 powrprof
%prm

%inst
既定の電源スキームを現在のユーザーの電源スキームで置き換える。

[戻り値]
呼び出しが成功した場合は ERROR_SUCCESS (0) を返す。失敗した場合は 0 以外の値を返す。

[備考]
呼び出し元はローカルの Administrators グループのメンバーでなければならない。


%index
PowerReportThermalEvent
OS に熱イベントを通知する。
%group
Win32 powrprof
%prm
Event
Event : [var] 熱イベント構造体 THERMAL_EVENT。
%inst
OS に熱イベントを通知する。

[戻り値]
呼び出しが成功した場合は ERROR_SUCCESS (0) を返す。失敗した場合は 0 以外の値を返す。

[備考]
サーマル マネージャは PowerReportThermalEvent ルーチンを呼び出して熱イベントを OS に通知し、システム
イベント ログに記録する。呼び出し前にサーマル マネージャは THERMAL_EVENT 構造体のメンバーを設定して熱イベントを記述する。


%index
PowerRestoreDefaultPowerSchemes
システムの電源スキームを既定の電源スキームで置き換える。現在の電源スキームおよび設定はすべて削除され既定値に置き換えられる。
%group
Win32 powrprof
%prm

%inst
システムの電源スキームを既定の電源スキームで置き換える。現在の電源スキームおよび設定はすべて削除され既定値に置き換えられる。

[戻り値]
呼び出しが成功した場合は ERROR_SUCCESS (0) を返す。失敗した場合は 0 以外の値を返す。

[備考]
呼び出し元はローカルの Administrators グループのメンバーでなければならない。


%index
PowerRestoreIndividualDefaultPowerScheme
現在のユーザー用の特定の電源スキームを既定ユーザー (HKEY_USERS\.Default に格納) のものに置き換える。
%group
Win32 powrprof
%prm
SchemeGuid
SchemeGuid : [var] 電源スキームの識別子。
%inst
現在のユーザー用の特定の電源スキームを既定ユーザー (HKEY_USERS\.Default に格納) のものに置き換える。

[戻り値]
呼び出しが成功した場合は ERROR_SUCCESS (0) を返す。失敗した場合は 0 以外の値を返す。


%index
PowerSetActiveScheme
現在のユーザーのアクティブ電源スキームを設定する。
%group
Win32 powrprof
%prm
UserRootPowerKey, SchemeGuid
UserRootPowerKey : [intptr] このパラメータは将来の使用のために予約されている。NULL を設定する必要がある。
SchemeGuid : [var] 電源スキームの識別子。
%inst
現在のユーザーのアクティブ電源スキームを設定する。

[戻り値]
呼び出しが成功した場合は ERROR_SUCCESS (0) を返す。失敗した場合は 0 以外の値を返す。


%index
PowerSettingAccessCheck
指定された電源設定に対するグループ ポリシー オーバーライドを問い合わせる。
%group
Win32 powrprof
%prm
AccessFlags, PowerGuid
AccessFlags : [int] グループ ポリシー オーバーライドを確認するアクセス種別。
PowerGuid : [var] 電源設定の識別子。
%inst
指定された電源設定に対するグループ ポリシー オーバーライドを問い合わせる。

[戻り値]
呼び出しが成功した場合は ERROR_SUCCESS (0) を返す。失敗した場合は 0 以外の値を返す。
このドキュメントは省略されている。


%index
PowerSettingAccessCheckEx
指定された電源設定に対するグループ ポリシー オーバーライドを問い合わせ、要求するアクセスを指定する。
%group
Win32 powrprof
%prm
AccessFlags, PowerGuid, AccessType
AccessFlags : [int] グループ ポリシー オーバーライドを確認するアクセス種別。
PowerGuid : [var] 電源設定の識別子。
AccessType : [int] 設定に対するセキュリティ アクセスの種別。詳細は Registry Key Security and Access Rights を参照。
%inst
指定された電源設定に対するグループ ポリシー オーバーライドを問い合わせ、要求するアクセスを指定する。

[戻り値]
呼び出しが成功した場合は ERROR_SUCCESS (0) を返す。失敗した場合は 0 以外の値を返す。
このドキュメントは省略されている。


%index
PowerSettingRegisterNotification
電源設定が変更されたときに通知を受け取るよう登録する。
%group
Win32 powrprof
%prm
SettingGuid, Flags, Recipient, RegistrationHandle
SettingGuid : [var] 電源設定を表す GUID。
Flags : [int] 
Recipient : [intptr] 通知の受信者へのハンドル。
RegistrationHandle : [var] 登録のハンドル。通知の登録解除にはこのハンドルを使用する。
%inst
電源設定が変更されたときに通知を受け取るよう登録する。

[戻り値]
呼び出しが成功した場合は ERROR_SUCCESS (0) を返す。失敗した場合は 0 以外の値を返す。

[備考]

登録直後、コールバックは電源設定の現在値で呼び出される。電源設定変更中に登録すると複数回呼び出される可能性があるが、最後のコールバックが最新の更新である。


%index
PowerSettingUnregisterNotification
電源設定変更通知の登録を解除する。
%group
Win32 powrprof
%prm
RegistrationHandle
RegistrationHandle : [intptr] PowerSettingRegisterNotification 関数を呼び出して取得した登録ハンドル。
%inst
電源設定変更通知の登録を解除する。

[戻り値]
呼び出しが成功した場合は ERROR_SUCCESS (0) を返す。失敗した場合は 0 以外の値を返す。


%index
PowerUnregisterFromEffectivePowerModeNotifications
有効電源モード変更通知の登録を解除する。この関数はクリーンアップ コードから呼び出すことを想定しており、登録解除する前にすべてのコールバックの完了を待つ。
%group
Win32 powrprof
%prm
RegistrationHandle
RegistrationHandle : [intptr] 単一の電源モード登録に対応するハンドル。PowerRegisterForEffectivePowerModeNotifications 呼び出し後に呼び出し元が保存しておき、ここに渡す。
%inst
有効電源モード変更通知の登録を解除する。この関数はクリーンアップ
コードから呼び出すことを想定しており、登録解除する前にすべてのコールバックの完了を待つ。

[戻り値]
呼び出しが成功した場合は S_OK (0) を返す。失敗した場合は 0 以外の値を返す。

[備考]

登録直後、コールバックは電源設定の現在値で呼び出される。電源設定変更中に登録すると複数回呼び出される可能性があるが、最後のコールバックが最新の更新である。


%index
PowerUnregisterSuspendResumeNotification
システムのサスペンド/レジューム通知登録を解除する。
%group
Win32 powrprof
%prm
RegistrationHandle
RegistrationHandle : [intptr] PowerRegisterSuspendResumeNotification 関数を呼び出して取得した登録ハンドル。
%inst
システムのサスペンド/レジューム通知登録を解除する。

[戻り値]
呼び出しが成功した場合は ERROR_SUCCESS (0) を返す。失敗した場合は 0 以外の値を返す。


%index
PowerWriteACDefaultIndex
指定された電源設定の既定 AC インデックスを設定する。
%group
Win32 powrprof
%prm
RootSystemPowerKey, SchemePersonalityGuid, SubGroupOfPowerSettingsGuid, PowerSettingGuid, DefaultAcIndex
RootSystemPowerKey : [intptr] このパラメータは将来の使用のために予約されている。NULL を設定する必要がある。
SchemePersonalityGuid : [var] この電源設定のスキーム パーソナリティの識別子。電源スキームのパーソナリティに応じて既定値が異なる場合がある。
SubGroupOfPowerSettingsGuid : [var] 
PowerSettingGuid : [var] 電源設定の識別子。
DefaultAcIndex : [int] 既定の AC インデックス。
%inst
指定された電源設定の既定 AC インデックスを設定する。

[戻り値]
呼び出しが成功した場合は ERROR_SUCCESS (0) を返す。失敗した場合は 0 以外の値を返す。

[備考]
アクティブな電源スキームの設定変更は PowerSetActiveScheme 関数を呼ぶまで反映されない。


%index
PowerWriteACValueIndex
指定された電源設定の AC 値インデックスを設定する。
%group
Win32 powrprof
%prm
RootPowerKey, SchemeGuid, SubGroupOfPowerSettingsGuid, PowerSettingGuid, AcValueIndex
RootPowerKey : [intptr] このパラメータは将来の使用のために予約されている。NULL を設定する必要がある。
SchemeGuid : [var] 電源スキームの識別子。
SubGroupOfPowerSettingsGuid : [var] 
PowerSettingGuid : [var] 電源設定の識別子。
AcValueIndex : [int] AC 値のインデックス。
%inst
指定された電源設定の AC 値インデックスを設定する。

[戻り値]
呼び出しが成功した場合は ERROR_SUCCESS (0) を返す。失敗した場合は 0 以外の値を返す。

[備考]
アクティブな電源スキームの設定変更は PowerSetActiveScheme 関数を呼ぶまで反映されない。


%index
PowerWriteDCDefaultIndex
指定された電源設定の既定 DC インデックスを設定する。
%group
Win32 powrprof
%prm
RootSystemPowerKey, SchemePersonalityGuid, SubGroupOfPowerSettingsGuid, PowerSettingGuid, DefaultDcIndex
RootSystemPowerKey : [intptr] このパラメータは将来の使用のために予約されている。NULL を設定する必要がある。
SchemePersonalityGuid : [var] この電源設定のスキーム パーソナリティの識別子。電源スキームのパーソナリティに応じて既定値が異なる場合がある。
SubGroupOfPowerSettingsGuid : [var] 
PowerSettingGuid : [var] 電源設定の識別子。
DefaultDcIndex : [int] 既定の DC インデックス。
%inst
指定された電源設定の既定 DC インデックスを設定する。

[戻り値]
呼び出しが成功した場合は ERROR_SUCCESS (0) を返す。失敗した場合は 0 以外の値を返す。

[備考]
アクティブな電源スキームの設定変更は PowerSetActiveScheme 関数を呼ぶまで反映されない。


%index
PowerWriteDCValueIndex
指定された電源設定の DC インデックスを設定する。
%group
Win32 powrprof
%prm
RootPowerKey, SchemeGuid, SubGroupOfPowerSettingsGuid, PowerSettingGuid, DcValueIndex
RootPowerKey : [intptr] このパラメータは将来の使用のために予約されている。NULL を設定する必要がある。
SchemeGuid : [var] 電源スキームの識別子。
SubGroupOfPowerSettingsGuid : [var] 
PowerSettingGuid : [var] 電源設定の識別子。
DcValueIndex : [int] DC 値のインデックス。
%inst
指定された電源設定の DC インデックスを設定する。

[戻り値]
呼び出しが成功した場合は ERROR_SUCCESS (0) を返す。失敗した場合は 0 以外の値を返す。

[備考]
アクティブな電源スキームの設定変更は PowerSetActiveScheme 関数を呼ぶまで反映されない。


%index
PowerWriteDescription
指定された電源設定、サブグループ、またはスキームの説明を設定する。
%group
Win32 powrprof
%prm
RootPowerKey, SchemeGuid, SubGroupOfPowerSettingsGuid, PowerSettingGuid, Buffer, BufferSize
RootPowerKey : [intptr] このパラメータは将来の使用のために予約されている。NULL を設定する必要がある。
SchemeGuid : [var] 電源スキームの識別子。
SubGroupOfPowerSettingsGuid : [var] 
PowerSettingGuid : [var] 電源設定の識別子。
Buffer : [var] 説明 (ワイド (Unicode) 文字)。
BufferSize : [int] Buffer が指すバッファのサイズ。
%inst
指定された電源設定、サブグループ、またはスキームの説明を設定する。

[戻り値]
呼び出しが成功した場合は ERROR_SUCCESS (0) を返す。失敗した場合は 0 以外の値を返す。

[備考]
SchemeGuid が NULL でなく SubGroupOfPowerSettingsGuid および
PowerSettingGuid が共に NULL の場合、電源スキームの説明が設定される。SchemeGuid と
SubGroupOfPowerSettingsGuid が NULL でなく PowerSettingGuid が NULL
の場合、サブグループの説明が設定される。3 つすべてが NULL
でない場合、電源設定の説明が設定される。アクティブな電源スキームの設定変更は PowerSetActiveScheme
関数を呼ぶまで反映されない。


%index
PowerWriteFriendlyName
指定された電源設定、サブグループ、またはスキームのフレンドリ名を設定する。
%group
Win32 powrprof
%prm
RootPowerKey, SchemeGuid, SubGroupOfPowerSettingsGuid, PowerSettingGuid, Buffer, BufferSize
RootPowerKey : [intptr] このパラメータは将来の使用のために予約されている。NULL を設定する必要がある。
SchemeGuid : [var] 電源スキームの識別子。
SubGroupOfPowerSettingsGuid : [var] 
PowerSettingGuid : [var] 電源設定の識別子。
Buffer : [var] フレンドリ名 (ワイド (Unicode) 文字)。
BufferSize : [int] 終端 NULL を含む、Buffer で指定したフレンドリ名のサイズ。
%inst
指定された電源設定、サブグループ、またはスキームのフレンドリ名を設定する。

[戻り値]
呼び出しが成功した場合は ERROR_SUCCESS (0) を返す。失敗した場合は 0 以外の値を返す。

[備考]
アクティブな電源スキームの設定変更は PowerSetActiveScheme 関数を呼ぶまで反映されない。


%index
PowerWriteIconResourceSpecifier
指定された電源設定、サブグループ、またはスキームのアイコン リソースを設定する。
%group
Win32 powrprof
%prm
RootPowerKey, SchemeGuid, SubGroupOfPowerSettingsGuid, PowerSettingGuid, Buffer, BufferSize
RootPowerKey : [intptr] このパラメータは将来の使用のために予約されている。NULL を設定する必要がある。
SchemeGuid : [var] 電源スキームの識別子。
SubGroupOfPowerSettingsGuid : [var] 
PowerSettingGuid : [var] 電源設定の識別子。
Buffer : [var] アイコン リソース。
BufferSize : [int] Buffer が指すバッファのサイズ。
%inst
指定された電源設定、サブグループ、またはスキームのアイコン リソースを設定する。

[戻り値]
呼び出しが成功した場合は ERROR_SUCCESS (0) を返す。失敗した場合は 0 以外の値を返す。

[備考]
SchemeGuid が NULL でなく SubGroupOfPowerSettingsGuid および
PowerSettingGuid が共に NULL の場合、電源スキームのフレンドリ名が設定される。SchemeGuid と
SubGroupOfPowerSettingsGuid が NULL でなく PowerSettingGuid が NULL
の場合、サブグループのフレンドリ名が設定される。3 つすべてが NULL
でない場合、電源設定のフレンドリ名が設定される。アクティブな電源スキームの設定変更は PowerSetActiveScheme
関数を呼ぶまで反映されない。


%index
PowerWritePossibleDescription
電源設定値の候補選択肢の 1 つについて説明を設定する。
%group
Win32 powrprof
%prm
RootPowerKey, SubGroupOfPowerSettingsGuid, PowerSettingGuid, PossibleSettingIndex, Buffer, BufferSize
RootPowerKey : [intptr] このパラメータは将来の使用のために予約されている。NULL を設定する必要がある。
SubGroupOfPowerSettingsGuid : [var] 
PowerSettingGuid : [var] 使用する電源設定の識別子。
PossibleSettingIndex : [int] 候補設定の 0 始まりのインデックス。
Buffer : [var] 説明 (ワイド (Unicode) 文字)。
BufferSize : [int] Buffer が指すバッファのサイズ。
%inst
電源設定値の候補選択肢の 1 つについて説明を設定する。

[戻り値]
呼び出しが成功した場合は ERROR_SUCCESS (0) を返す。失敗した場合は 0 以外の値を返す。

[備考]
アクティブな電源スキームの設定変更は PowerSetActiveScheme 関数を呼ぶまで反映されない。


%index
PowerWritePossibleFriendlyName
電源設定の候補設定の 1 つについてフレンドリ名を設定する。
%group
Win32 powrprof
%prm
RootPowerKey, SubGroupOfPowerSettingsGuid, PowerSettingGuid, PossibleSettingIndex, Buffer, BufferSize
RootPowerKey : [intptr] このパラメータは将来の使用のために予約されている。NULL を設定する必要がある。
SubGroupOfPowerSettingsGuid : [var] 
PowerSettingGuid : [var] 電源設定の識別子。
PossibleSettingIndex : [int] 候補設定の 0 始まりのインデックス。
Buffer : [var] フレンドリ名 (ワイド (Unicode) 文字)。
BufferSize : [int] Buffer が指すバッファのサイズ。
%inst
電源設定の候補設定の 1 つについてフレンドリ名を設定する。

[戻り値]
呼び出しが成功した場合は ERROR_SUCCESS (0) を返す。失敗した場合は 0 以外の値を返す。

[備考]
アクティブな電源スキームの設定変更は PowerSetActiveScheme 関数を呼ぶまで反映されない。


%index
PowerWritePossibleValue
電源設定の候補値の値を設定する。
%group
Win32 powrprof
%prm
RootPowerKey, SubGroupOfPowerSettingsGuid, PowerSettingGuid, Type, PossibleSettingIndex, Buffer, BufferSize
RootPowerKey : [intptr] このパラメータは将来の使用のために予約されている。NULL を設定する必要がある。
SubGroupOfPowerSettingsGuid : [var] 
PowerSettingGuid : [var] 電源設定の識別子。
Type : [int] 値のデータ型。可能な値は Registry Value Types を参照。
PossibleSettingIndex : [int] 候補設定の 0 始まりのインデックス。
Buffer : [var] 候補設定の値。
BufferSize : [int] Buffer が指すバッファのサイズ。
%inst
電源設定の候補値の値を設定する。

[戻り値]
呼び出しが成功した場合は ERROR_SUCCESS (0) を返す。失敗した場合は 0 以外の値を返す。

[備考]
アクティブな電源スキームの設定変更は PowerSetActiveScheme 関数を呼ぶまで反映されない。


%index
PowerWriteSettingAttributes
電源キーの電源属性を設定する。
%group
Win32 powrprof
%prm
SubGroupGuid, PowerSettingGuid, Attributes
SubGroupGuid : [var] 
PowerSettingGuid : [var] 電源設定の識別子。
Attributes : [int] 指定された電源設定に関連付ける属性。
%inst
電源キーの電源属性を設定する。

[戻り値]
呼び出しが成功した場合は ERROR_SUCCESS (0) を返す。失敗した場合は 0 以外の値を返す。

[備考]
アクティブな電源スキームの設定変更は PowerSetActiveScheme 関数を呼ぶまで反映されない。


%index
PowerWriteValueIncrement
電源設定の最小値と最大値の間の有効値の増分を設定する。
%group
Win32 powrprof
%prm
RootPowerKey, SubGroupOfPowerSettingsGuid, PowerSettingGuid, ValueIncrement
RootPowerKey : [intptr] このパラメータは将来の使用のために予約されている。NULL を設定する必要がある。
SubGroupOfPowerSettingsGuid : [var] 
PowerSettingGuid : [var] 電源設定の識別子。
ValueIncrement : [int] 設定する増分。
%inst
電源設定の最小値と最大値の間の有効値の増分を設定する。

[戻り値]
呼び出しが成功した場合は ERROR_SUCCESS (0) を返す。失敗した場合は 0 以外の値を返す。

[備考]
アクティブな電源スキームの設定変更は PowerSetActiveScheme 関数を呼ぶまで反映されない。


%index
PowerWriteValueMax
指定された電源設定の最大値を設定する。
%group
Win32 powrprof
%prm
RootPowerKey, SubGroupOfPowerSettingsGuid, PowerSettingGuid, ValueMaximum
RootPowerKey : [intptr] このパラメータは将来の使用のために予約されている。NULL を設定する必要がある。
SubGroupOfPowerSettingsGuid : [var] 
PowerSettingGuid : [var] 電源設定の識別子。
ValueMaximum : [int] 設定する最大値。
%inst
指定された電源設定の最大値を設定する。

[戻り値]
呼び出しが成功した場合は ERROR_SUCCESS (0) を返す。失敗した場合は 0 以外の値を返す。

[備考]
アクティブな電源スキームの設定変更は PowerSetActiveScheme 関数を呼ぶまで反映されない。


%index
PowerWriteValueMin
指定された電源設定の最小値を設定する。
%group
Win32 powrprof
%prm
RootPowerKey, SubGroupOfPowerSettingsGuid, PowerSettingGuid, ValueMinimum
RootPowerKey : [intptr] このパラメータは将来の使用のために予約されている。NULL を設定する必要がある。
SubGroupOfPowerSettingsGuid : [var] 
PowerSettingGuid : [var] 電源設定の識別子。
ValueMinimum : [int] 設定する最小値。
%inst
指定された電源設定の最小値を設定する。

[戻り値]
呼び出しが成功した場合は ERROR_SUCCESS (0) を返す。失敗した場合は 0 以外の値を返す。

[備考]
アクティブな電源スキームの設定変更は PowerSetActiveScheme 関数を呼ぶまで反映されない。


%index
PowerWriteValueUnitsSpecifier
値の範囲をサポートする電源設定の単位を記述するために使用する文字列を書き込む。
%group
Win32 powrprof
%prm
RootPowerKey, SubGroupOfPowerSettingsGuid, PowerSettingGuid, Buffer, BufferSize
RootPowerKey : [intptr] このパラメータは将来の使用のために予約されている。NULL を設定する必要がある。
SubGroupOfPowerSettingsGuid : [var] 
PowerSettingGuid : [var] 電源設定の識別子。
Buffer : [var] 単位指定子 (ワイド (Unicode) 文字)。
BufferSize : [int] Buffer が指すバッファのサイズ。
%inst
値の範囲をサポートする電源設定の単位を記述するために使用する文字列を書き込む。

[戻り値]
呼び出しが成功した場合は ERROR_SUCCESS (0) を返す。失敗した場合は 0 以外の値を返す。

[備考]
アクティブな電源スキームの設定変更は PowerSetActiveScheme 関数を呼ぶまで反映されない。


%index
ReadGlobalPwrPolicy
現在のグローバル電源ポリシー設定を取得する。
%group
Win32 powrprof
%prm
pGlobalPowerPolicy
pGlobalPowerPolicy : [var] 情報を受け取る GLOBAL_POWER_POLICY 構造体へのポインタ。
%inst
現在のグローバル電源ポリシー設定を取得する。

[戻り値]
関数が成功すると、戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼び出す。

[備考]
GLOBAL_POWER_POLICY
構造体は、すべての電源スキームに共通するポリシー設定を含む。この構造体にはユーザーおよびコンピュータのポリシー設定の両方が含まれる。Windows
Vista 以降では、指定スキームの電源設定を列挙するには PowerEnumerate
関数を、個別設定を取得するには電源読み取り関数を使用する。PowrProf.h の使用方法の詳細は Power Schemes を参照。


%index
ReadProcessorPwrScheme
指定された電源スキームのプロセッサ電源ポリシー設定を取得する。
%group
Win32 powrprof
%prm
uiID, pMachineProcessorPowerPolicy
uiID : [int] 読み取る電源スキームのインデックス。
pMachineProcessorPowerPolicy : [var] プロセッサ電源ポリシー設定を受け取る MACHINE_PROCESSOR_POWER_POLICY 構造体へのポインタ。
%inst
指定された電源スキームのプロセッサ電源ポリシー設定を取得する。

[戻り値]
関数が成功すると、戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼び出す。

[備考]
MACHINE_PROCESSOR_POWER_POLICY 構造体は、AC
電源実行時およびバッテリ電源実行時のプロセッサ電源ポリシー設定を含む。Windows Vista 以降ではシステム
プロセッサの電源管理設定は GUID_PROCESSOR_SETTINGS_SUBGROUP
電源設定サブグループを通じて制御される。個別設定の列挙には PowerEnumerate 関数を使用する。PowrProf.h
の使用方法の詳細は Power Schemes を参照。


%index
ReadPwrScheme
指定された電源スキームに固有の電源ポリシー設定を取得する。
%group
Win32 powrprof
%prm
uiID, pPowerPolicy
uiID : [int] 読み取る電源スキームのインデックス。
pPowerPolicy : [var] 電源ポリシー設定を受け取る POWER_POLICY 構造体へのポインタ。
%inst
指定された電源スキームに固有の電源ポリシー設定を取得する。

[戻り値]
関数が成功すると、戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼び出す。

[備考]
指定された電源スキームが存在しない場合、関数は FALSE を返す。現在システムで使用中の電源ポリシー設定を取得するには
GetActivePwrScheme を呼び出す。現在の電源ポリシー設定の追加情報を取得するには
CallNtPowerInformation を呼び出す。Windows Vista 以降では、指定スキームの電源設定を列挙するには
PowerEnumerate を、個別設定の取得には電源読み取り関数を使用する。PowrProf.h の使用方法の詳細は Power
Schemes を参照。


%index
SetActivePwrScheme
アクティブな電源スキームを設定する。
%group
Win32 powrprof
%prm
uiID, pGlobalPowerPolicy, pPowerPolicy
uiID : [int] アクティブにする電源スキームのインデックス。
pGlobalPowerPolicy : [var] オプションの GLOBAL_POWER_POLICY 構造体へのポインタ。電源スキームがアクティブになるときにマージされるグローバル電源ポリシー設定を提供する。
pPowerPolicy : [var] オプションの POWER_POLICY 構造体へのポインタ。電源スキームがアクティブになるときにマージされる電源ポリシー設定を提供する。
%inst
アクティブな電源スキームを設定する。

[戻り値]
関数が成功すると、戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼び出す。

[備考]
システム構成を長期的に変更する用途に使用する。アプリケーション実行中に一時的にシステムを稼働させ続けたい場合は
SetThreadExecutionState を使う。uiID の電源スキームが存在しない場合、関数は 0
を返す。lpGlobalPowerPolicy が NULL の場合、関数は WriteGlobalPwrPolicy
で設定済みの現在のグローバル電源ポリシー設定を使用する。そうでなければ指定した構造体の設定で置き換える。lpPowerPolicy が
NULL の場合、電源スキームの現在の電源ポリシー設定を使用する。そうでなければ指定した構造体の設定で置き換える。PowrProf.h
の使用方法の詳細は Power Schemes を参照。


%index
SetSuspendState
電源を落としてシステムをサスペンドする。Hibernate パラメータに応じて、システムはサスペンド (スリープ) または休止 (S4) 状態に入る。
%group
Win32 powrprof
%prm
bHibernate, bForce, bWakeupEventsDisabled
bHibernate : [int] TRUE の場合、システムは休止状態になる。FALSE の場合、システムはサスペンドされる。
bForce : [int] このパラメータは効果を持たない。
bWakeupEventsDisabled : [int] TRUE の場合、システムはすべてのウェイク イベントを無効化する。FALSE の場合、システム ウェイク イベントは有効のまま維持される。
%inst
電源を落としてシステムをサスペンドする。Hibernate パラメータに応じて、システムはサスペンド (スリープ) または休止 (S4)
状態に入る。

[戻り値]
関数が成功すると、戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼び出す。

[備考]
呼び出しプロセスは SE_SHUTDOWN_NAME 特権を持つ必要がある。この特権を有効にするには
AdjustTokenPrivileges 関数を使う。詳細は Changing Privileges in a Token
を参照。アプリケーションは SetSuspendState を用いてシステムを稼働状態からスタンバイ (スリープ) またはオプションで休止
(S4) 状態へ遷移させられる。この関数は SetSystemPowerState に類似する。PowrProf.h の使用方法の詳細は
Power Schemes を参照。システムをウェイクできるイベントについては System Wake-up Events を参照。


%index
ValidatePowerPolicies
(no summary)
%group
Win32 powrprof
%prm
pGlobalPowerPolicy, pPowerPolicy
pGlobalPowerPolicy : [var] 
pPowerPolicy : [var] 
%inst



%index
WriteGlobalPwrPolicy
グローバル電源ポリシー設定を書き込む。
%group
Win32 powrprof
%prm
pGlobalPowerPolicy
pGlobalPowerPolicy : [var] 書き込む電源ポリシー設定を含む GLOBAL_POWER_POLICY 構造体へのポインタ。
%inst
グローバル電源ポリシー設定を書き込む。

[戻り値]
関数が成功すると、戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼び出す。

[備考]

この関数は既存のグローバル電源ポリシー設定を置き換える。各ユーザーは個別のグローバル電源スキームを持ち、そのユーザーのすべての電源スキームに適用される電源ポリシー設定を含む。Windows
Vista 以降では、指定スキームの電源設定を列挙するには PowerEnumerate
を、個別設定の書き込みには電源書き込み関数を使用する。PowrProf.h の使用方法の詳細は Power Schemes を参照。


%index
WriteProcessorPwrScheme
指定された電源スキームのプロセッサ電源ポリシー設定を書き込む。
%group
Win32 powrprof
%prm
uiID, pMachineProcessorPowerPolicy
uiID : [int] 書き込む電源スキームのインデックス。
pMachineProcessorPowerPolicy : [var] 書き込む電源ポリシー設定を含む MACHINE_PROCESSOR_POWER_POLICY 構造体へのポインタ。
%inst
指定された電源スキームのプロセッサ電源ポリシー設定を書き込む。

[戻り値]
関数が成功すると、戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼び出す。

[備考]
この変更は現在のシステム電源ポリシーには影響しない。現在の電源ポリシーに反映するには、この電源スキームのインデックスを指定して
SetActivePwrScheme を呼び出す。Windows Vista 以降ではシステム プロセッサの電源管理設定は
GUID_PROCESSOR_SETTINGS_SUBGROUP 電源設定サブグループを通じて制御される。個別設定の列挙には
PowerEnumerate 関数を使用する。PowrProf.h の使用方法の詳細は Power Schemes を参照。


%index
WritePwrScheme
指定された電源スキームに固有のポリシー設定を書き込む。
%group
Win32 powrprof
%prm
puiID, lpszSchemeName, lpszDescription, lpScheme
puiID : [var] 書き込む電源スキームのインデックス。同じインデックスの電源スキームが既に存在する場合は置き換えられる。存在しない場合は新規作成される。
lpszSchemeName : [wstr] 電源スキームの名前。
lpszDescription : [wstr] 電源スキームの説明。
lpScheme : [var] 書き込む電源ポリシー設定を含む POWER_POLICY 構造体へのポインタ。
%inst
指定された電源スキームに固有のポリシー設定を書き込む。

[戻り値]
関数が成功すると、戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼び出す。

[備考]
この変更は現在のシステム電源ポリシーには影響しない。現在の電源ポリシーに反映するには、この電源スキームのインデックスを指定して
SetActivePwrScheme を呼び出す。WritePwrScheme で書き込まれた電源ポリシー スキームはシステム レジストリ
ハイブに恒久的に保存され、電源オプション コントロール パネルや電源スキーム API
からの以降の呼び出しで利用可能となる。電源スキームをシステムから恒久的に削除するには DeletePwrScheme
を呼び出す。PowrProf.h の使用方法の詳細は Power Schemes を参照。

