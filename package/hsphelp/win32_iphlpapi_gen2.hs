; ============================================================
;   iphlpapi.dll ヘルプ (CsWin32 / win32metadata から自動抽出)
;   docs_ja.json に日本語訳があればそちらを使用、無ければ英語原文。
;   翻訳を追加するときは docs_ja.json を編集して再生成。
; ============================================================

%type
拡張命令
%ver
1.0
%dll
iphlpapi.dll
%date
2026/04/16
%author
IronHSP / CsWin32 bridge
%url
https://github.com/inovia/IronHSP
%port
Win

%note
Win32 API の iphlpapi.dll 関数群。CsWin32 + win32metadata から自動生成。
hsp3net 専用 (intptr / NSTRUCT / wstr を使用)。

%group
Win32API

%index
AddIPAddress
AddIPAddress 関数は、指定した IPv4 アドレスを指定のアダプタに追加する。
%prm
Address, IpMask, IfIndex, NTEContext, NTEInstance
Address : [int] アダプタに追加する IPv4 アドレス。IPAddr 構造体の形式で指定する。
IpMask : [int] Address パラメータで指定した IPv4 アドレスのサブネットマスク。IPMask パラメータは IPAddr 構造体と同じ形式を用いる。
IfIndex : [int] IPv4 アドレスを追加するアダプタのインデックス。
NTEContext : [var] ULONG 変数へのポインタ。成功時、このパラメータは追加された IPv4 アドレスに対する Net Table Entry (NTE) コンテキストを指す。呼び出し元は後で DeleteIPAddress 関数を呼ぶ際にこのコンテキストを利用できる。
NTEInstance : [var] ULONG 変数へのポインタ。成功時、このパラメータは追加された IPv4 アドレスに対する NTE インスタンスを指す。
%inst
AddIPAddress 関数は、指定した IPv4 アドレスを指定のアダプタに追加する。

[戻り値]
関数が成功すると戻り値は NO_ERROR となる。失敗した場合の戻り値は以下のいずれかのエラーコードとなる。
このドキュメントは省略されている。

[備考]
AddIPAddress 関数は、ローカルコンピュータ上に新しい IPv4 アドレスエントリを追加するのに使う。AddIPAddress
が追加する IPv4 アドレスは永続的ではなく、アダプタオブジェクトが存在する間だけ有効である。コンピュータを再起動するか NIC
を手動でリセットすると IPv4 アドレスは破棄される。特定の PnP イベントでも破棄されうる。永続的な IPv4
アドレスを作成するには WMI の Win32_NetworkAdapterConfiguration クラスの EnableStatic
メソッドや netsh コマンドを利用する。詳細は Windows Sockets ドキュメントの Netsh.exe
に関する記述を参照。Windows Server 2003 / XP / 2000 では、Address に指定した IPv4
アドレスがネットワーク上に既に存在する場合、AddIPAddress は NO_ERROR を返すが追加された IPv4 アドレスは
0.0.0.0 となる。Windows Vista
以降では、既存アドレスと重複する場合、IP_ADAPTER_UNICAST_ADDRESS 構造体の IP_DAD_STATE メンバが
IpDadStateDuplicate に設定された状態で重複アドレスが追加される。AddIPAddress で追加した IPv4
アドレスは、AddIPAddress が返した NTEContext を渡して DeleteIPAddress
を呼ぶことで後から削除できる。IPAddr / IPMask データ型については Windows Data Types
を参照。ドット区切り十進表記と IPAddr 形式を相互変換するには inet_addr / inet_ntoa を使う。Windows
Vista 以降では CreateUnicastIpAddressEntry 関数を使ってユニキャスト IPv4/IPv6
アドレスを追加できる。


%index
CancelIPChangeNotify
NotifyAddrChange または NotifyRouteChange の呼び出しで以前に登録した IPv4 アドレスおよび経路変更通知をキャンセルする。
%prm
notifyOverlapped
notifyOverlapped : [var] 直前の NotifyAddrChange または NotifyRouteChange 呼び出しで使用した OVERLAPPED 構造体へのポインタ。
%inst
NotifyAddrChange または NotifyRouteChange の呼び出しで以前に登録した IPv4
アドレスおよび経路変更通知をキャンセルする。

[備考]
CancelIPChangeNotify 関数は、ローカルコンピュータの IPv4
アドレスまたは経路の変更通知として以前に登録した要求を解除する。通知登録は NotifyAddrChange または
NotifyRouteChange で行う。これらの呼び出しで使った OVERLAPPED 構造体を notifyOverlapped
に渡すことで通知登録を解除する。通知要求が見つからない場合や不正な notifyOverlapped
を渡した場合、CancelIPChangeNotify は FALSE を返すことがある。


%index
UnregisterInterfaceTimestampConfigChange
RegisterInterfaceTimestampConfigChange の呼び出しで登録したコールバック関数の登録解除により、タイムスタンプ機能変更に関する通知をキャンセルする。
%prm
NotificationHandle
NotificationHandle : [intptr] 型: _In_ HIFTIMESTAMPCHANGE RegisterInterfaceTimestampConfigChange が返したハンドル。キャンセルする登録を識別する。
%inst
RegisterInterfaceTimestampConfigChange
の呼び出しで登録したコールバック関数の登録解除により、タイムスタンプ機能変更に関する通知をキャンセルする。

[戻り値]
型: DWORD 成功または失敗を示す DWORD 戻り値。


%index
CancelIfTimestampConfigChange
この関数はシステムで予約されている。ユーザーコードから呼び出してはならない。(CancelIfTimestampConfigChange)
%prm
NotificationHandle
NotificationHandle : [intptr] 予約済み。
%inst
この関数はシステムで予約されている。ユーザーコードから呼び出してはならない。(CancelIfTimestampConfigChange)

[戻り値]
この関数は値を返さない。


%index
CancelMibChangeNotify2
IP インターフェイス変更、IP アドレス変更、IP 経路変更、Teredo ポート変更、および安定ユニキャスト IP アドレステーブルの準備完了通知の登録を解除する。
%prm
NotificationHandle
NotificationHandle : [intptr] 通知登録または取得関数から返されたハンドルで、どの通知をキャンセルするかを示す。
%inst
IP インターフェイス変更、IP アドレス変更、IP 経路変更、Teredo ポート変更、および安定ユニキャスト IP
アドレステーブルの準備完了通知の登録を解除する。

[戻り値]
関数が成功すると戻り値は NO_ERROR となる。失敗した場合の戻り値は以下のいずれかのエラーコードとなる。
このドキュメントは省略されている。

[備考]
CancelMibChangeNotify2 関数は Windows Vista
以降で定義される。CancelMibChangeNotify2 は、NotifyIpInterfaceChange /
NotifyUnicastIpAddressChange / NotifyRouteChange2 /
NotifyTeredoPortChange で以前に登録した IP インターフェイス・IP アドレス・IP 経路・Teredo
ポートの変更通知を解除する。NotifyStableUnicastIpAddressTable による安定ユニキャスト IP
アドレステーブル通知要求のキャンセルにも使う。これらの関数が返した NotificationHandle
を渡すことで通知解除もしくは保留中の取得要求を取り消す。同じ NotificationHandle
に対する通知コールバックが実行中のスレッドから CancelMibChangeNotify2
を呼び出してはならない。デッドロックを引き起こす。したがって通知コールバック内で直接呼んではならず、コールバックを受けるスレッドが依存するリソースを保持するスレッドからも呼んではならない。


%index
CaptureInterfaceHardwareCrossTimestamp
ネットワークアダプタのクロスタイムスタンプ情報を取得する。
%prm
InterfaceLuid, CrossTimestamp
InterfaceLuid : [var] 型: _In_ CONST NET_LUID* クロスタイムスタンプを取得するネットワークアダプタの LUID。
CrossTimestamp : [var] 型: _Inout_ PINTERFACE_HARDWARE_CROSSTIMESTAMP ネットワークアダプタから INTERFACE_HARDWARE_CROSSTIMESTAMP 形式でタイムスタンプを返す。
%inst
ネットワークアダプタのクロスタイムスタンプ情報を取得する。

[戻り値]
型: DWORD 成功または失敗を示す DWORD 戻り値。


%index
ConvertCompartmentGuidToId
(no summary)
%prm
CompartmentGuid, CompartmentId
CompartmentGuid : [var] 
CompartmentId : [var] 
%inst



%index
ConvertCompartmentIdToGuid
(no summary)
%prm
CompartmentId, CompartmentGuid
CompartmentId : [int] 
CompartmentGuid : [var] 
%inst



%index
ConvertInterfaceAliasToLuid
ネットワークインターフェイスのエイリアス名を、そのインターフェイスのローカル一意識別子 (LUID) に変換する。
%prm
InterfaceAlias, InterfaceLuid
InterfaceAlias : [wstr] ネットワークインターフェイスのエイリアス名を格納した NULL 終端 Unicode 文字列へのポインタ。
InterfaceLuid : [var] このインターフェイスの NET_LUID へのポインタ。
%inst
ネットワークインターフェイスのエイリアス名を、そのインターフェイスのローカル一意識別子 (LUID) に変換する。

[戻り値]
成功時、ConvertInterfaceAliasToLuid は NO_ERROR を返す。0
以外の戻り値は失敗を示し、InterfaceLuid パラメータには NULL が返される。
このドキュメントは省略されている。

[備考]
ConvertInterfaceAliasToLuid 関数は Windows Vista 以降で利用できる。プロトコル非依存で IPv4
/ IPv6 両方のネットワークインターフェイスに対応する。


%index
ConvertInterfaceGuidToLuid
ネットワークインターフェイスのグローバル一意識別子 (GUID) を、そのインターフェイスのローカル一意識別子 (LUID) に変換する。
%prm
InterfaceGuid, InterfaceLuid
InterfaceGuid : [var] ネットワークインターフェイスの GUID へのポインタ。
InterfaceLuid : [var] このインターフェイスの NET_LUID へのポインタ。
%inst
ネットワークインターフェイスのグローバル一意識別子 (GUID) を、そのインターフェイスのローカル一意識別子 (LUID) に変換する。

[戻り値]
成功時、ConvertInterfaceGuidToLuid は NO_ERROR を返す。0
以外の戻り値は失敗を示し、InterfaceLuid パラメータには NULL が返される。
このドキュメントは省略されている。

[備考]
ConvertInterfaceGuidToLuid 関数は Windows Vista 以降で利用できる。プロトコル非依存で IPv4
/ IPv6 両方のネットワークインターフェイスに対応する。


%index
ConvertInterfaceIndexToLuid
ネットワークインターフェイスのローカルインデックスを、そのインターフェイスのローカル一意識別子 (LUID) に変換する。
%prm
InterfaceIndex, InterfaceLuid
InterfaceIndex : [int] ネットワークインターフェイスのローカルインデックス値。
InterfaceLuid : [var] このインターフェイスの NET_LUID へのポインタ。
%inst
ネットワークインターフェイスのローカルインデックスを、そのインターフェイスのローカル一意識別子 (LUID) に変換する。

[戻り値]
成功時、ConvertInterfaceIndexToLuid は NO_ERROR を返す。0
以外の戻り値は失敗を示し、InterfaceLuid パラメータには NULL が返される。
このドキュメントは省略されている。

[備考]
ConvertInterfaceIndexToLuid 関数は Windows Vista 以降で利用できる。プロトコル非依存で IPv4
/ IPv6 両方のネットワークインターフェイスに対応する。


%index
ConvertInterfaceLuidToAlias
ネットワークインターフェイスのローカル一意識別子 (LUID) をインターフェイスのエイリアス名に変換する。
%prm
InterfaceLuid, InterfaceAlias, Length
InterfaceLuid : [var] ネットワークインターフェイスの NET_LUID へのポインタ。
InterfaceAlias : [wstr] 成功時、ネットワークインターフェイスのエイリアス名を格納した NULL 終端 Unicode 文字列を受け取るバッファへのポインタ。
Length : [int] InterfaceAlias が指すバッファの文字数。エイリアス名と終端 NULL 文字を格納するのに十分な大きさが必要。最大値は NDIS_IF_MAX_STRING_SIZE + 1。
%inst
ネットワークインターフェイスのローカル一意識別子 (LUID) をインターフェイスのエイリアス名に変換する。

[戻り値]
成功時、ConvertInterfaceLuidToAlias は NO_ERROR を返す。0 以外の戻り値は失敗を示す。
このドキュメントは省略されている。

[備考]
ConvertInterfaceLuidToAlias 関数は Windows Vista 以降で利用できる。プロトコル非依存で IPv4
/ IPv6 両方に対応する。ネットワークインターフェイスのエイリアス名の最大長 NDIS_IF_MAX_STRING_SIZE (終端
NULL を除く) は Ntddndis.h で宣言され、Ifdef.h の IF_MAX_STRING_SIZE
として定義される。Ntddndis.h と Ifdef.h は Netioapi.h に自動的にインクルードされ、Netioapi.h は
Iphlpapi.h に自動的にインクルードされる。これらのヘッダを直接使用してはならない。


%index
ConvertInterfaceLuidToGuid
ネットワークインターフェイスのローカル一意識別子 (LUID) をグローバル一意識別子 (GUID) に変換する。
%prm
InterfaceLuid, InterfaceGuid
InterfaceLuid : [var] ネットワークインターフェイスの NET_LUID へのポインタ。
InterfaceGuid : [var] このインターフェイスの GUID へのポインタ。
%inst
ネットワークインターフェイスのローカル一意識別子 (LUID) をグローバル一意識別子 (GUID) に変換する。

[戻り値]
成功時、ConvertInterfaceLuidToGuid は NO_ERROR を返す。0
以外の戻り値は失敗を示し、InterfaceGuid パラメータには NULL が返される。
このドキュメントは省略されている。

[備考]
ConvertInterfaceLuidToGuid 関数は Windows Vista 以降で利用できる。プロトコル非依存で IPv4
/ IPv6 両方に対応する。


%index
ConvertInterfaceLuidToIndex
ネットワークインターフェイスのローカル一意識別子 (LUID) をインターフェイスのローカルインデックスに変換する。
%prm
InterfaceLuid, InterfaceIndex
InterfaceLuid : [var] ネットワークインターフェイスの NET_LUID へのポインタ。
InterfaceIndex : [var] インターフェイスのローカルインデックス値。
%inst
ネットワークインターフェイスのローカル一意識別子 (LUID) をインターフェイスのローカルインデックスに変換する。

[戻り値]
成功時、ConvertInterfaceLuidToIndex は NO_ERROR を返す。0
以外の戻り値は失敗を示し、InterfaceIndex パラメータには NET_IFINDEX_UNSPECIFIED が返される。
このドキュメントは省略されている。

[備考]
ConvertInterfaceLuidToIndex 関数は Windows Vista 以降で利用できる。プロトコル非依存で IPv4
/ IPv6 両方に対応する。


%index
ConvertInterfaceLuidToNameW
ネットワークインターフェイスのローカル一意識別子 (LUID) を Unicode インターフェイス名に変換する。
%prm
InterfaceLuid, InterfaceName, Length
InterfaceLuid : [var] ネットワークインターフェイスの NET_LUID へのポインタ。
InterfaceName : [wstr] 成功時、インターフェイス名を格納した NULL 終端 Unicode 文字列を受け取るバッファへのポインタ。
Length : [int] InterfaceName が指す配列の文字数。インターフェイス名と終端 NULL 文字を格納できる大きさが必要。最大値は NDIS_IF_MAX_STRING_SIZE + 1。
%inst
ネットワークインターフェイスのローカル一意識別子 (LUID) を Unicode インターフェイス名に変換する。

[戻り値]
成功時、本関数は NETIO_ERROR_SUCCESS を返す。0 以外の戻り値は失敗を示す。
このドキュメントは省略されている。

[備考]
ConvertInterfaceLuidToNameW 関数は Windows Vista 以降で利用できる。プロトコル非依存で IPv4
/ IPv6 両方に対応する。ConvertInterfaceLuidToNameW はネットワークインターフェイスの LUID を
Unicode インターフェイス名に変換する。ConvertInterfaceLuidToNameA は ANSI インターフェイス名を
LUID に変換する。インターフェイス名の最大長 NDIS_IF_MAX_STRING_SIZE は Ntddndis.h
で宣言され、Ifdef.h の IF_MAX_STRING_SIZE として定義される。Ntddndis.h / Ifdef.h /
Netioapi.h は Iphlpapi.h から自動的にインクルードされ、直接使用してはならない。


%index
ConvertInterfaceNameToLuidW
Unicode のネットワークインターフェイス名を、そのインターフェイスのローカル一意識別子 (LUID) に変換する。
%prm
InterfaceName, InterfaceLuid
InterfaceName : [wstr] ネットワークインターフェイス名を格納した NULL 終端 Unicode 文字列へのポインタ。
InterfaceLuid : [var] このインターフェイスの NET_LUID へのポインタ。
%inst
Unicode のネットワークインターフェイス名を、そのインターフェイスのローカル一意識別子 (LUID) に変換する。

[戻り値]
成功時、本関数は NETIO_ERROR_SUCCESS を返す。0 以外の戻り値は失敗を示す。
このドキュメントは省略されている。

[備考]
ConvertInterfaceNameToLuidW 関数は Windows Vista 以降で利用できる。プロトコル非依存で IPv4
/ IPv6 両方に対応する。ConvertInterfaceNameToLuidW は Unicode インターフェイス名を LUID
に変換する。ConvertInterfaceNameToLuidA は ANSI 版。インターフェイス名の最大長
NDIS_IF_MAX_STRING_SIZE は Ntddndis.h で宣言され、Ifdef.h の
IF_MAX_STRING_SIZE として定義される。Ntddndis.h / Ifdef.h / Netioapi.h は
Iphlpapi.h から自動的にインクルードされ、直接使用してはならない。


%index
ConvertIpv4MaskToLength
IPv4 サブネットマスクを IPv4 プレフィックス長に変換する。
%prm
Mask, MaskLength
Mask : [int] IPv4 サブネットマスク。
MaskLength : [var] 成功時、IPv4 プレフィックス長 (ビット単位) を受け取る UINT8 変数へのポインタ。
%inst
IPv4 サブネットマスクを IPv4 プレフィックス長に変換する。

[戻り値]
成功時、ConvertIpv4MaskToLength は NO_ERROR を返す。0 以外の戻り値は失敗を示す。
このドキュメントは省略されている。

[備考]
ConvertIpv4MaskToLength 関数は Windows Vista 以降で利用できる。


%index
ConvertLengthToIpv4Mask
IPv4 プレフィックス長を IPv4 サブネットマスクに変換する。
%prm
MaskLength, Mask
MaskLength : [int] IPv4 プレフィックス長 (ビット単位)。
Mask : [var] 成功時、IPv4 サブネットマスクを受け取る LONG 変数へのポインタ。
%inst
IPv4 プレフィックス長を IPv4 サブネットマスクに変換する。

[戻り値]
成功時、ConvertLengthToIpv4Mask は NO_ERROR を返す。0 以外の戻り値は失敗を示し、Mask
パラメータには Ws2def.h で定義される INADDR_NONE が設定される。
このドキュメントは省略されている。

[備考]
ConvertLengthToIpv4Mask 関数は Windows Vista 以降で利用できる。


%index
CreateAnycastIpAddressEntry
ローカルコンピュータに新しいエニーキャスト IP アドレスエントリを追加する。
%prm
Row
Row : [var] エニーキャスト IP アドレスエントリを表す MIB_ANYCASTIPADDRESS_ROW 構造体へのポインタ。
%inst
ローカルコンピュータに新しいエニーキャスト IP アドレスエントリを追加する。

[戻り値]
関数が成功すると戻り値は NO_ERROR となる。失敗した場合の戻り値は以下のいずれかのエラーコードとなる。
このドキュメントは省略されている。

[備考]
CreateAnycastIpAddressEntry 関数は Windows Vista
以降で定義される。ローカルコンピュータに新しいエニーキャスト IP アドレスエントリを追加するのに使う。Row が指す
MIB_ANYCASTIPADDRESS_ROW の Address メンバは有効なユニキャスト IPv4 / IPv6
アドレスとファミリで初期化しておく必要がある。加えて InterfaceLuid または InterfaceIndex
のいずれかを初期化する必要がある。InterfaceLuid が指定されていればそちらが優先され、ゼロであれば
InterfaceIndex が使われる。Row の ScopeId
メンバは無視され、アドレスを追加するインターフェイスから自動的に決定される。Address に指定したエニーキャスト IP
アドレスが既存のインターフェイス上のアドレスと重複する場合、本関数は失敗する。本関数は Administrators
グループのメンバーとしてログオンしたユーザーからのみ呼び出せる。Administrators グループのメンバーでないユーザーが呼び出すと
ERROR_ACCESS_DENIED を返して失敗する。Windows Vista 以降のユーザーアカウント制御 (UAC)
によっても失敗しうる。この関数を含むアプリケーションをビルトイン Administrator 以外の Administrators
グループのメンバーが実行した場合、マニフェストファイルで requestedExecutionLevel を
requireAdministrator に設定していない限りこの呼び出しは失敗する。マニフェストがない場合は、昇格シェル
(管理者として実行) から起動する必要がある。


%index
CreateIpForwardEntry
CreateIpForwardEntry 関数は、ローカルコンピュータの IPv4 ルーティングテーブルに経路を作成する。
%prm
pRoute
pRoute : [var] 新しい経路の情報を指定する MIB_IPFORWARDROW 構造体へのポインタ。呼び出し元はすべてのメンバに値を設定する必要がある。dwForwardProto メンバには MIB_IPPROTO_NETMGMT を指定しなければならない。
%inst
CreateIpForwardEntry 関数は、ローカルコンピュータの IPv4 ルーティングテーブルに経路を作成する。

[戻り値]
関数が成功すると NO_ERROR (0) を返す。失敗した場合の戻り値は以下のいずれかのエラーコードとなる。
このドキュメントは省略されている。

[備考]
pRoute が指す MIB_IPFORWARDROW の dwForwardProto には MIB_IPPROTO_NETMGMT
を設定する必要がある。そうでなければ CreateIpForwardEntry は失敗する。ルーティングプロトコル識別子は、DHCP /
SNMP あるいは CreateIpForwardEntry / DeleteIpForwardEntry /
SetIpForwardEntry 呼び出しなど、ネットワーク管理経由で設定された経路情報を識別するために使われる。Windows
Vista / Server 2008 では dwForwardMetric1
は経路メトリックとインターフェイスメトリックの合算であり、関連する MIB_IPINTERFACE_ROW の Metric
以上にする必要がある。経路メトリックを 0 にしたい場合は dwForwardMetric1
をインターフェイスメトリックと同じ値に設定する。Windows Vista / Server 2008 では
CreateIpForwardEntry は単一サブインターフェイスのインターフェイスでしか動作しない (インターフェイス LUID
とサブインターフェイス LUID
が同一のもの)。dwForwardPolicy、dwForwardType、dwForwardAge、dwForwardNextHopAS、dwForwardMetric2～5
は現在使用されない。新しい経路の dwForwardAge は既定で INFINITE となる。既存経路の変更には
SetIpForwardEntry、IPv4 ルーティングテーブル取得には GetIpForwardTable を使う。Windows
Vista 以降では 本関数は Administrators
グループのメンバーとしてログオンしたユーザーからのみ呼び出せる。Administrators グループのメンバーでないユーザーが呼び出すと
ERROR_ACCESS_DENIED を返して失敗する。Windows Vista 以降のユーザーアカウント制御 (UAC)
によっても失敗しうる。この関数を含むアプリケーションをビルトイン Administrator 以外の Administrators
グループのメンバーが実行した場合、マニフェストファイルで requestedExecutionLevel を
requireAdministrator に設定していない限りこの呼び出しは失敗する。マニフェストがない場合は、昇格シェル
(管理者として実行) から起動する必要がある。
注: Windows NT 4.0 および Windows 2000 以降ではこの関数は特権操作を行う。成功させるには、呼び出し元が
Administrators グループまたは NetworkConfigurationOperators
グループのメンバーである必要がある。


%index
CreateIpForwardEntry2
ローカルコンピュータに新しい IP 経路エントリを作成する。
%prm
Row
Row : [var] IP 経路エントリを表す MIB_IPFORWARD_ROW2 構造体へのポインタ。
%inst
ローカルコンピュータに新しい IP 経路エントリを作成する。

[戻り値]
関数が成功すると戻り値は NO_ERROR となる。失敗した場合の戻り値は以下のいずれかのエラーコードとなる。
このドキュメントは省略されている。

[備考]
CreateIpForwardEntry2 関数は Windows Vista 以降で定義される。ローカルコンピュータに新しい IP
経路エントリを追加するのに使う。MIB_IPFORWARD_ROW2 構造体のメンバは InitializeIpForwardEntry
で既定値に初期化し、必要なメンバを変更してから CreateIpForwardEntry2 を呼ぶとよい。Row の
DestinationPrefix は有効な IPv4 / IPv6 アドレスプレフィックスで、NextHop
は有効なアドレスとファミリで初期化する必要がある。また InterfaceLuid または InterfaceIndex
のいずれかを初期化する必要がある。InterfaceLuid が優先され、ゼロなら InterfaceIndex が使われる。Metric
メンバの経路メトリックオフセットは完全なメトリックの一部に過ぎず、関連インターフェイスの MIB_IPINTERFACE_ROW の
Metric と合算される。インターフェイスメトリックは GetIpInterfaceEntry で取得できる。Age と Origin
メンバは無視され、ネットワークスタックが設定する。既存経路と DestinationPrefix / NextHop
が重複する場合は失敗する。本関数は Administrators
グループのメンバーとしてログオンしたユーザーからのみ呼び出せる。Administrators グループのメンバーでないユーザーが呼び出すと
ERROR_ACCESS_DENIED を返して失敗する。Windows Vista 以降のユーザーアカウント制御 (UAC)
によっても失敗しうる。この関数を含むアプリケーションをビルトイン Administrator 以外の Administrators
グループのメンバーが実行した場合、マニフェストファイルで requestedExecutionLevel を
requireAdministrator に設定していない限りこの呼び出しは失敗する。マニフェストがない場合は、昇格シェル
(管理者として実行) から起動する必要がある。


%index
CreateIpNetEntry
CreateIpNetEntry 関数は、ローカルコンピュータの ARP テーブルに ARP エントリを作成する。
%prm
pArpEntry
pArpEntry : [var] 新しいエントリの情報を指定する MIB_IPNETROW 構造体へのポインタ。呼び出し元はすべてのメンバに値を設定する必要がある。
%inst
CreateIpNetEntry 関数は、ローカルコンピュータの ARP テーブルに ARP エントリを作成する。

[戻り値]
関数が成功すると NO_ERROR (0) を返す。失敗した場合の戻り値は以下のいずれかのエラーコードとなる。
このドキュメントは省略されている。

[備考]
既存 ARP エントリの変更には SetIpNetEntry、ARP テーブル取得には GetIpNetTable、削除には
DeleteIpNetEntry を使う。Windows Vista 以降では 本関数は Administrators
グループのメンバーとしてログオンしたユーザーからのみ呼び出せる。Administrators グループのメンバーでないユーザーが呼び出すと
ERROR_ACCESS_DENIED を返して失敗する。Windows Vista 以降のユーザーアカウント制御 (UAC)
によっても失敗しうる。この関数を含むアプリケーションをビルトイン Administrator 以外の Administrators
グループのメンバーが実行した場合、マニフェストファイルで requestedExecutionLevel を
requireAdministrator に設定していない限りこの呼び出しは失敗する。マニフェストがない場合は、昇格シェル
(管理者として実行) から起動する必要がある。
注: Windows NT 4.0 および Windows 2000 以降ではこの関数は特権操作を行う。成功させるには、呼び出し元が
Administrators グループまたは NetworkConfigurationOperators
グループのメンバーである必要がある。


%index
CreateIpNetEntry2
ローカルコンピュータに新しい近隣 IP アドレスエントリを作成する。
%prm
Row
Row : [var] 近隣 IP アドレスエントリを表す MIB_IPNET_ROW2 構造体へのポインタ。
%inst
ローカルコンピュータに新しい近隣 IP アドレスエントリを作成する。

[戻り値]
関数が成功すると戻り値は NO_ERROR となる。失敗した場合の戻り値は以下のいずれかのエラーコードとなる。
このドキュメントは省略されている。

[備考]
CreateIpNetEntry2 関数は Windows Vista 以降で定義される。ローカルコンピュータに新しい近隣 IP
アドレスエントリを追加するのに使う。Address メンバは有効なユニキャスト / エニーキャスト / マルチキャスト IPv4 /
IPv6 アドレスとファミリで初期化し、PhysicalAddress / PhysicalAddressLength
も有効な物理アドレスで初期化する必要がある。さらに InterfaceLuid または InterfaceIndex
のいずれかを初期化する必要がある (InterfaceLuid 優先)。Address が既存エントリと重複する場合は失敗する。本関数は
Administrators グループのメンバーとしてログオンしたユーザーからのみ呼び出せる。Administrators
グループのメンバーでないユーザーが呼び出すと ERROR_ACCESS_DENIED を返して失敗する。Windows Vista
以降のユーザーアカウント制御 (UAC) によっても失敗しうる。この関数を含むアプリケーションをビルトイン Administrator
以外の Administrators グループのメンバーが実行した場合、マニフェストファイルで
requestedExecutionLevel を requireAdministrator
に設定していない限りこの呼び出しは失敗する。マニフェストがない場合は、昇格シェル (管理者として実行) から起動する必要がある。


%index
CreatePersistentTcpPortReservation
ローカルコンピュータで連続する TCP ポートブロックに対する永続的な TCP ポート予約を作成する。
%prm
StartPort, NumberOfPorts, Token
StartPort : [int] ネットワークバイトオーダーでの開始 TCP ポート番号。
NumberOfPorts : [int] 予約する TCP ポート番号の個数。
Token : [var] 成功時に返されるポート予約トークンへのポインタ。
%inst
ローカルコンピュータで連続する TCP ポートブロックに対する永続的な TCP ポート予約を作成する。

[戻り値]
関数が成功すると戻り値は NO_ERROR となる。失敗した場合の戻り値は以下のいずれかのエラーコードとなる。
このドキュメントは省略されている。

[備考]
CreatePersistentTcpPortReservation 関数は Windows Vista 以降で定義され、TCP
ポートブロックを永続的に予約する。アプリケーションやサービスがポートを予約する理由には 2 種類ある。動作に特定のポートを必要とする場合
(インストール時にマニフェストで指定するケース) と、実行時に任意の空きポート (ブロック) を必要とする場合である。前者は永続予約 /
ランタイム予約のどちらも可能だが、ワイルドカード予約はランタイムのみ対応する。本関数は永続 TCP
ポートブロック予約を提供し、Windows の TCP
モジュール用永続ストアに記録される。必要なポート数と特定範囲の要否を指定し、要求が満たせれば ULONG64
型の不透明トークンが返される。解放は DeletePersistentTcpPortReservation
で行う。再起動するとトークン値は変わりうる。永続予約にはコンポーネント間のセキュリティ制御はなく、永続予約を取得可能なコンポーネントは他コンポーネントの永続予約も消費できる。ランタイム予約はプロセスレベルのセキュリティが強制される。取得後は
TCP ソケットに対し WSAIoctl で SIO_ASSOCIATE_PORT_RESERVATION IOCTL
を呼んでトークンを渡し、その後 bind を行えばよい。SIO_ACQUIRE_PORT_RESERVATION IOCTL
でランタイム予約も可能。本関数は Administrators
グループのメンバーとしてログオンしたユーザーからのみ呼び出せる。Administrators グループのメンバーでないユーザーが呼び出すと
ERROR_ACCESS_DENIED を返して失敗する。Windows Vista 以降のユーザーアカウント制御 (UAC)
によっても失敗しうる。この関数を含むアプリケーションをビルトイン Administrator 以外の Administrators
グループのメンバーが実行した場合、マニフェストファイルで requestedExecutionLevel を
requireAdministrator に設定していない限りこの呼び出しは失敗する。マニフェストがない場合は、昇格シェル
(管理者として実行) から起動する必要がある。


%index
CreatePersistentUdpPortReservation
ローカルコンピュータで連続する UDP ポートブロックに対する永続的な UDP ポート予約を作成する。
%prm
StartPort, NumberOfPorts, Token
StartPort : [int] ネットワークバイトオーダーでの開始 UDP ポート番号。
NumberOfPorts : [int] 予約する UDP ポート番号の個数。
Token : [var] 成功時に返されるポート予約トークンへのポインタ。
%inst
ローカルコンピュータで連続する UDP ポートブロックに対する永続的な UDP ポート予約を作成する。

[戻り値]
関数が成功すると戻り値は NO_ERROR となる。失敗した場合の戻り値は以下のいずれかのエラーコードとなる。
このドキュメントは省略されている。

[備考]
CreatePersistentUdpPortReservation 関数は Windows Vista 以降で定義され、UDP
ポートブロックを永続的に予約する。使い方は TCP 版 (CreatePersistentTcpPortReservation)
とほぼ同じで、Windows の UDP モジュール用永続ストアに記録される。必要なポート数と範囲を指定し、成功すれば ULONG64
の不透明トークンが返される。解放は DeletePersistentUdpPortReservation
を呼ぶ。再起動するとトークンは変わりうる。永続予約にはコンポーネント間のセキュリティ制御はない。本関数は Administrators
グループのメンバーとしてログオンしたユーザーからのみ呼び出せる。Administrators グループのメンバーでないユーザーが呼び出すと
ERROR_ACCESS_DENIED を返して失敗する。Windows Vista 以降のユーザーアカウント制御 (UAC)
によっても失敗しうる。この関数を含むアプリケーションをビルトイン Administrator 以外の Administrators
グループのメンバーが実行した場合、マニフェストファイルで requestedExecutionLevel を
requireAdministrator に設定していない限りこの呼び出しは失敗する。マニフェストがない場合は、昇格シェル
(管理者として実行) から起動する必要がある。


%index
CreateProxyArpEntry
CreateProxyArpEntry 関数は、ローカルコンピュータ上に指定 IPv4 アドレス用のプロキシ ARP (PARP) エントリを作成する。
%prm
dwAddress, dwMask, dwIfIndex
dwAddress : [int] このコンピュータがプロキシとして動作する対象の IPv4 アドレス。
dwMask : [int] dwAddress で指定した IPv4 アドレスのサブネットマスク。
dwIfIndex : [int] dwAddress で指定した IPv4 アドレスに対してプロキシ ARP を行うインターフェイスのインデックス。このインターフェイス上で dwAddress への ARP 要求を受けた場合、このインターフェイスの物理アドレスで応答する。ARP 非対応インターフェイス (PPP 等) では呼び出しは失敗する。
%inst
CreateProxyArpEntry 関数は、ローカルコンピュータ上に指定 IPv4 アドレス用のプロキシ ARP (PARP)
エントリを作成する。

[戻り値]
関数が成功すると NO_ERROR (0) を返す。失敗した場合の戻り値は以下のいずれかのエラーコードとなる。
このドキュメントは省略されている。

[備考]
ARP テーブル取得には GetIpNetTable、既存 PARP エントリの削除には DeleteProxyArpEntry
を使う。Windows Vista 以降では 本関数は Administrators
グループのメンバーとしてログオンしたユーザーからのみ呼び出せる。Administrators グループのメンバーでないユーザーが呼び出すと
ERROR_ACCESS_DENIED を返して失敗する。Windows Vista 以降のユーザーアカウント制御 (UAC)
によっても失敗しうる。この関数を含むアプリケーションをビルトイン Administrator 以外の Administrators
グループのメンバーが実行した場合、マニフェストファイルで requestedExecutionLevel を
requireAdministrator に設定していない限りこの呼び出しは失敗する。マニフェストがない場合は、昇格シェル
(管理者として実行) から起動する必要がある。
注: この関数は特権操作を行う。成功させるには呼び出し元が Administrators グループまたは
NetworkConfigurationOperators グループのメンバーである必要がある。


%index
CreateSortedAddressPairs
与えられた IP 宛先候補リストに対し、ホストのローカル IP アドレスとペアを作り、通信に最適な順序でソートして返す。
%prm
SourceAddressList, SourceAddressCount, DestinationAddressList, DestinationAddressCount, AddressSortOptions, SortedAddressPairList, SortedAddressPairCount
SourceAddressList : [var] NULL でなければならない。将来使用のために予約されている。
SourceAddressCount : [int] 0 でなければならない。将来使用のために予約されている。
DestinationAddressList : [var] IPv6 候補宛先アドレスの一覧を格納する SOCKADDR_IN6 構造体配列へのポインタ。IPv4 アドレスは IPv4-mapped IPv6 形式で表現する必要がある。
DestinationAddressCount : [int] DestinationAddressList が指す宛先アドレスの個数。
AddressSortOptions : [int] 将来使用のために予約されている。
SortedAddressPairList : [var] 成功時に通信に最適な順序でソートされた IPv6 アドレスペアの SOCKADDR_IN6_PAIR 構造体配列を受け取るポインタ。
SortedAddressPairCount : [var] 成功時に SortedAddressPairList 配列の要素数を受け取る変数へのポインタ。
%inst
与えられた IP 宛先候補リストに対し、ホストのローカル IP アドレスとペアを作り、通信に最適な順序でソートして返す。

[戻り値]
関数が成功すると戻り値は NO_ERROR となる。失敗した場合の戻り値は以下のいずれかのエラーコードとなる。
このドキュメントは省略されている。

[備考]
CreateSortedAddressPairs 関数は Windows Vista 以降で定義される。送信元と宛先の IPv6
アドレスリストを受け取り、通信に最適な順序でソートしたアドレスペアのリストを返す。SourceAddressList と
SourceAddressCount は現在予約されており、それぞれ NULL と 0
でなければならない。本関数はホストの全ローカルアドレスを送信元として用いる。DestinationAddressList は
SOCKADDR_IN6 の配列で、IPv4 は IPv4-mapped IPv6
形式で表現する。DestinationAddressCount は 500 まで。成功時、SortedAddressPairList
はソート済みの SOCKADDR_IN6_PAIR 配列を指す。不要になったら FreeMibTable で解放する。


%index
CreateUnicastIpAddressEntry
ローカルコンピュータに新しいユニキャスト IP アドレスエントリを追加する。
%prm
Row
Row : [var] ユニキャスト IP アドレスエントリを表す MIB_UNICASTIPADDRESS_ROW 構造体へのポインタ。
%inst
ローカルコンピュータに新しいユニキャスト IP アドレスエントリを追加する。

[戻り値]
関数が成功すると戻り値は NO_ERROR となる。失敗した場合の戻り値は以下のいずれかのエラーコードとなる。
このドキュメントは省略されている。

[備考]
CreateUnicastIpAddressEntry 関数は Windows Vista
以降で定義される。ローカルコンピュータに新しいユニキャスト IP
アドレスエントリを追加する。追加されたアドレスは永続的ではなく、アダプタが存在する間だけ有効である。再起動や NIC リセット、PnP
イベントで破棄される。永続 IPv4 アドレスには WMI の Win32_NetworkAdapterConfiguration の
EnableStatic や netsh を使う。InitializeUnicastIpAddressEntry
でメンバを既定値に初期化してから必要なメンバを変更し本関数を呼ぶとよい。Address メンバは有効なユニキャスト IPv4 / IPv6
アドレス (si_family を AF_INET / AF_INET6 にセット) で初期化し、InterfaceLuid または
InterfaceIndex のいずれかも初期化する必要がある。OnLinkPrefixLength が 255
の場合はアドレス長に等しいプレフィックス長 (IPv4 なら 32、IPv6 なら 128) が設定される。間違った場合は
SetUnicastIpAddressEntry で修正できる。DadState、ScopeId、CreationTimeStamp
は無視される。Windows 10 以降では DadState に IpDadStatePreferred を設定すると楽観的 DAD
が実行される。既存アドレスと重複する場合は失敗する。ループバック IP アドレスはループバックインターフェイスにのみ追加可能。追加直後は
DAD (重複アドレス検出) が完了するまでアドレスは使用できず、IPv6 で約 1 秒、IPv4 で約 3
秒かかる。使用可能になったかは GetUnicastIpAddressEntry のポーリング、または NotifyAddrChange
/ NotifyIpInterfaceChange / NotifyUnicastIpAddressChange
による通知で確認できる。DadState が IpDadStatePreferred
になれば使用可能、IpDadStateTentative なら未完了、それ以外は DAD 失敗でアドレスは使用できない。本関数は
Administrators グループのメンバーとしてログオンしたユーザーからのみ呼び出せる。Administrators
グループのメンバーでないユーザーが呼び出すと ERROR_ACCESS_DENIED を返して失敗する。Windows Vista
以降のユーザーアカウント制御 (UAC) によっても失敗しうる。この関数を含むアプリケーションをビルトイン Administrator
以外の Administrators グループのメンバーが実行した場合、マニフェストファイルで
requestedExecutionLevel を requireAdministrator
に設定していない限りこの呼び出しは失敗する。マニフェストがない場合は、昇格シェル (管理者として実行) から起動する必要がある。


%index
DeleteAnycastIpAddressEntry
ローカルコンピュータの既存エニーキャスト IP アドレスエントリを削除する。
%prm
Row
Row : [var] ローカルコンピュータから削除する既存のエニーキャスト IP アドレスエントリ (MIB_ANYCASTIPADDRESS_ROW) へのポインタ。
%inst
ローカルコンピュータの既存エニーキャスト IP アドレスエントリを削除する。

[戻り値]
関数が成功すると戻り値は NO_ERROR となる。失敗した場合の戻り値は以下のいずれかのエラーコードとなる。
このドキュメントは省略されている。

[備考]
DeleteAnycastIpAddressEntry 関数は Windows Vista 以降で定義される。既存の
MIB_ANYCASTIPADDRESS_ROW エントリを削除するのに使う。入力時に Address メンバは有効なユニキャスト
IPv4 / IPv6 アドレスとファミリに設定し、InterfaceLuid または InterfaceIndex
のいずれかも初期化する必要がある (InterfaceLuid 優先)。GetAnycastIpAddressTable /
GetAnycastIpAddressEntry でエニーキャスト IP アドレスを列挙・取得できる。本関数は
Administrators グループのメンバーとしてログオンしたユーザーからのみ呼び出せる。Administrators
グループのメンバーでないユーザーが呼び出すと ERROR_ACCESS_DENIED を返して失敗する。Windows Vista
以降のユーザーアカウント制御 (UAC) によっても失敗しうる。この関数を含むアプリケーションをビルトイン Administrator
以外の Administrators グループのメンバーが実行した場合、マニフェストファイルで
requestedExecutionLevel を requireAdministrator
に設定していない限りこの呼び出しは失敗する。マニフェストがない場合は、昇格シェル (管理者として実行) から起動する必要がある。


%index
DeleteIPAddress
DeleteIPAddress 関数は、AddIPAddress で追加した IP アドレスを削除する。
%prm
NTEContext
NTEContext : [int] IP アドレスの NTE コンテキスト。直前の AddIPAddress 呼び出しで返された値。
%inst
DeleteIPAddress 関数は、AddIPAddress で追加した IP アドレスを削除する。

[戻り値]
関数が成功すると NO_ERROR (0) を返す。失敗した場合の戻り値は以下のいずれかのエラーコードとなる。
このドキュメントは省略されている。

[備考]
Windows Vista 以降では 本関数は Administrators
グループのメンバーとしてログオンしたユーザーからのみ呼び出せる。Administrators グループのメンバーでないユーザーが呼び出すと
ERROR_ACCESS_DENIED を返して失敗する。Windows Vista 以降のユーザーアカウント制御 (UAC)
によっても失敗しうる。この関数を含むアプリケーションをビルトイン Administrator 以外の Administrators
グループのメンバーが実行した場合、マニフェストファイルで requestedExecutionLevel を
requireAdministrator に設定していない限りこの呼び出しは失敗する。マニフェストがない場合は、昇格シェル
(管理者として実行) から起動する必要がある。
注: Windows NT 4.0 および Windows 2000 以降ではこの関数は特権操作を行う。成功させるには、呼び出し元が
Administrators グループまたは NetworkConfigurationOperators
グループのメンバーである必要がある。


%index
DeleteIpForwardEntry
ローカルコンピュータの IPv4 ルーティングテーブルから既存経路を削除する。
%prm
pRoute
pRoute : [var] 削除対象の経路を識別する MIB_IPFORWARDROW 構造体へのポインタ。dwForwardIfIndex、dwForwardDest、dwForwardMask、dwForwardNextHop、dwForwardProto のメンバを設定する必要がある。
%inst
ローカルコンピュータの IPv4 ルーティングテーブルから既存経路を削除する。

[戻り値]
関数が成功すると NO_ERROR (0) を返す。失敗した場合の戻り値は以下のいずれかのエラーコードとなる。
このドキュメントは省略されている。

[備考]
dwForwardProto は MIB_IPPROTO_NETMGMT に設定する必要がある。そうでないと失敗する。Windows
Vista / Server 2008 では単一サブインターフェイスのインターフェイスでしか動作しない。dwForwardPolicy
などいくつかのメンバは現在使用されない。既存経路の変更には SetIpForwardEntry、IPv4 ルーティングテーブル取得には
GetIpForwardTable を使う。Windows Vista 以降では 本関数は Administrators
グループのメンバーとしてログオンしたユーザーからのみ呼び出せる。Administrators グループのメンバーでないユーザーが呼び出すと
ERROR_ACCESS_DENIED を返して失敗する。Windows Vista 以降のユーザーアカウント制御 (UAC)
によっても失敗しうる。この関数を含むアプリケーションをビルトイン Administrator 以外の Administrators
グループのメンバーが実行した場合、マニフェストファイルで requestedExecutionLevel を
requireAdministrator に設定していない限りこの呼び出しは失敗する。マニフェストがない場合は、昇格シェル
(管理者として実行) から起動する必要がある。
注: Windows NT 4.0 および Windows 2000 以降ではこの関数は特権操作を行う。成功させるには、呼び出し元が
Administrators グループまたは NetworkConfigurationOperators
グループのメンバーである必要がある。


%index
DeleteIpForwardEntry2
ローカルコンピュータから IP 経路エントリを削除する。
%prm
Row
Row : [var] IP 経路エントリを表す MIB_IPFORWARD_ROW2 へのポインタ。成功時、このエントリは削除される。
%inst
ローカルコンピュータから IP 経路エントリを削除する。

[戻り値]
関数が成功すると戻り値は NO_ERROR となる。失敗した場合の戻り値は以下のいずれかのエラーコードとなる。
このドキュメントは省略されている。

[備考]
DeleteIpForwardEntry2 関数は Windows Vista 以降で定義される。MIB_IPFORWARD_ROW2
エントリを削除する。DestinationPrefix は有効な IPv4 / IPv6
アドレスプレフィックスとファミリで、NextHop は有効なアドレスとファミリで初期化する必要がある。InterfaceLuid または
InterfaceIndex のいずれかも初期化すること (InterfaceLuid
優先)。既存経路と一致しない場合は失敗する。GetIpForwardTable2 で経路エントリを列挙できる。本関数は
Administrators グループのメンバーとしてログオンしたユーザーからのみ呼び出せる。Administrators
グループのメンバーでないユーザーが呼び出すと ERROR_ACCESS_DENIED を返して失敗する。Windows Vista
以降のユーザーアカウント制御 (UAC) によっても失敗しうる。この関数を含むアプリケーションをビルトイン Administrator
以外の Administrators グループのメンバーが実行した場合、マニフェストファイルで
requestedExecutionLevel を requireAdministrator
に設定していない限りこの呼び出しは失敗する。マニフェストがない場合は、昇格シェル (管理者として実行) から起動する必要がある。


%index
DeleteIpNetEntry
DeleteIpNetEntry 関数は、ローカルコンピュータの ARP テーブルから ARP エントリを削除する。
%prm
pArpEntry
pArpEntry : [var] 削除対象のエントリを指定する MIB_IPNETROW 構造体へのポインタ。少なくとも dwIndex と dwAddr に値を設定する必要がある。
%inst
DeleteIpNetEntry 関数は、ローカルコンピュータの ARP テーブルから ARP エントリを削除する。

[戻り値]
関数が成功すると NO_ERROR (0) を返す。失敗した場合の戻り値は以下のいずれかのエラーコードとなる。
このドキュメントは省略されている。

[備考]
ARP テーブル取得には GetIpNetTable を使う。Windows Vista 以降では 本関数は Administrators
グループのメンバーとしてログオンしたユーザーからのみ呼び出せる。Administrators グループのメンバーでないユーザーが呼び出すと
ERROR_ACCESS_DENIED を返して失敗する。Windows Vista 以降のユーザーアカウント制御 (UAC)
によっても失敗しうる。この関数を含むアプリケーションをビルトイン Administrator 以外の Administrators
グループのメンバーが実行した場合、マニフェストファイルで requestedExecutionLevel を
requireAdministrator に設定していない限りこの呼び出しは失敗する。マニフェストがない場合は、昇格シェル
(管理者として実行) から起動する必要がある。
注: Windows NT 4.0 および Windows 2000 以降ではこの関数は特権操作を行う。成功させるには、呼び出し元が
Administrators グループまたは NetworkConfigurationOperators
グループのメンバーである必要がある。


%index
DeleteIpNetEntry2
ローカルコンピュータから近隣 IP アドレスエントリを削除する。
%prm
Row
Row : [var] 近隣 IP アドレスエントリを表す MIB_IPNET_ROW2 へのポインタ。成功時、このエントリは削除される。
%inst
ローカルコンピュータから近隣 IP アドレスエントリを削除する。

[戻り値]
関数が成功すると戻り値は NO_ERROR となる。失敗した場合の戻り値は以下のいずれかのエラーコードとなる。
このドキュメントは省略されている。

[備考]
DeleteIpNetEntry2 関数は Windows Vista 以降で定義される。MIB_IPNET_ROW2
エントリを削除する。Address メンバは有効な近隣 IPv4 / IPv6 アドレスとファミリで初期化し、InterfaceLuid
または InterfaceIndex のいずれかも初期化する (InterfaceLuid 優先)。GetIpNetTable2 で近隣
IP アドレスを列挙できる。本関数は Administrators
グループのメンバーとしてログオンしたユーザーからのみ呼び出せる。Administrators グループのメンバーでないユーザーが呼び出すと
ERROR_ACCESS_DENIED を返して失敗する。Windows Vista 以降のユーザーアカウント制御 (UAC)
によっても失敗しうる。この関数を含むアプリケーションをビルトイン Administrator 以外の Administrators
グループのメンバーが実行した場合、マニフェストファイルで requestedExecutionLevel を
requireAdministrator に設定していない限りこの呼び出しは失敗する。マニフェストがない場合は、昇格シェル
(管理者として実行) から起動する必要がある。


%index
DeletePersistentTcpPortReservation
ローカルコンピュータの連続する TCP ポートブロックの永続予約を削除する。(DeletePersistentTcpPortReservation)
%prm
StartPort, NumberOfPorts
StartPort : [int] ネットワークバイトオーダーでの開始 TCP ポート番号。
NumberOfPorts : [int] 削除する TCP ポート番号の個数。
%inst
ローカルコンピュータの連続する TCP
ポートブロックの永続予約を削除する。(DeletePersistentTcpPortReservation)

[戻り値]
関数が成功すると戻り値は NO_ERROR となる。失敗した場合の戻り値は以下のいずれかのエラーコードとなる。
このドキュメントは省略されている。

[備考]
DeletePersistentTcpPortReservation 関数は Windows Vista 以降で定義される。TCP
ポートブロックの永続予約を削除する。本関数は Administrators
グループのメンバーとしてログオンしたユーザーからのみ呼び出せる。Administrators グループのメンバーでないユーザーが呼び出すと
ERROR_ACCESS_DENIED を返して失敗する。Windows Vista 以降のユーザーアカウント制御 (UAC)
によっても失敗しうる。この関数を含むアプリケーションをビルトイン Administrator 以外の Administrators
グループのメンバーが実行した場合、マニフェストファイルで requestedExecutionLevel を
requireAdministrator に設定していない限りこの呼び出しは失敗する。マニフェストがない場合は、昇格シェル
(管理者として実行) から起動する必要がある。


%index
DeletePersistentUdpPortReservation
ローカルコンピュータの連続する UDP ポートブロックの永続予約を削除する。(DeletePersistentUdpPortReservation)
%prm
StartPort, NumberOfPorts
StartPort : [int] ネットワークバイトオーダーでの開始 UDP ポート番号。
NumberOfPorts : [int] 削除する UDP ポート番号の個数。
%inst
ローカルコンピュータの連続する UDP
ポートブロックの永続予約を削除する。(DeletePersistentUdpPortReservation)

[戻り値]
関数が成功すると戻り値は NO_ERROR となる。失敗した場合の戻り値は以下のいずれかのエラーコードとなる。
このドキュメントは省略されている。

[備考]
DeletePersistentUdpPortReservation 関数は Windows Vista 以降で定義される。UDP
ポートブロックの永続予約を削除する。本関数は Administrators
グループのメンバーとしてログオンしたユーザーからのみ呼び出せる。Administrators グループのメンバーでないユーザーが呼び出すと
ERROR_ACCESS_DENIED を返して失敗する。Windows Vista 以降のユーザーアカウント制御 (UAC)
によっても失敗しうる。この関数を含むアプリケーションをビルトイン Administrator 以外の Administrators
グループのメンバーが実行した場合、マニフェストファイルで requestedExecutionLevel を
requireAdministrator に設定していない限りこの呼び出しは失敗する。マニフェストがない場合は、昇格シェル
(管理者として実行) から起動する必要がある。


%index
DeleteProxyArpEntry
DeleteProxyArpEntry 関数は、dwAddress と dwIfIndex で指定されるローカルコンピュータ上の PARP エントリを削除する。
%prm
dwAddress, dwMask, dwIfIndex
dwAddress : [int] このコンピュータがプロキシとして動作している対象の IPv4 アドレス。
dwMask : [int] dwAddress で指定した IPv4 アドレスのサブネットマスク。
dwIfIndex : [int] dwAddress で指定したアドレスに対するプロキシ ARP をサポートしているインターフェイスのインデックス。
%inst
DeleteProxyArpEntry 関数は、dwAddress と dwIfIndex で指定されるローカルコンピュータ上の PARP
エントリを削除する。

[戻り値]
関数が成功すると NO_ERROR (0) を返す。失敗した場合の戻り値は以下のいずれかのエラーコードとなる。
このドキュメントは省略されている。

[備考]
ARP テーブル取得には GetIpNetTable を使う。Windows Vista 以降では 本関数は Administrators
グループのメンバーとしてログオンしたユーザーからのみ呼び出せる。Administrators グループのメンバーでないユーザーが呼び出すと
ERROR_ACCESS_DENIED を返して失敗する。Windows Vista 以降のユーザーアカウント制御 (UAC)
によっても失敗しうる。この関数を含むアプリケーションをビルトイン Administrator 以外の Administrators
グループのメンバーが実行した場合、マニフェストファイルで requestedExecutionLevel を
requireAdministrator に設定していない限りこの呼び出しは失敗する。マニフェストがない場合は、昇格シェル
(管理者として実行) から起動する必要がある。
注: この関数は特権操作を行う。Administrators グループまたは NetworkConfigurationOperators
グループのメンバーでなければ成功しない。


%index
DeleteUnicastIpAddressEntry
ローカルコンピュータの既存ユニキャスト IP アドレスエントリを削除する。
%prm
Row
Row : [var] ローカルコンピュータから削除する既存のユニキャスト IP アドレスエントリ (MIB_UNICASTIPADDRESS_ROW) へのポインタ。
%inst
ローカルコンピュータの既存ユニキャスト IP アドレスエントリを削除する。

[戻り値]
関数が成功すると戻り値は NO_ERROR となる。失敗した場合の戻り値は以下のいずれかのエラーコードとなる。
このドキュメントは省略されている。

[備考]
DeleteUnicastIpAddressEntry 関数は Windows Vista 以降で定義される。既存の
MIB_UNICASTIPADDRESS_ROW エントリを削除する。Address は有効なユニキャスト IPv4 / IPv6
アドレスとファミリに設定し、InterfaceLuid または InterfaceIndex のいずれかも初期化する
(InterfaceLuid 優先)。GetUnicastIpAddressTable /
GetUnicastIpAddressEntry で列挙・取得できる。本関数は Administrators
グループのメンバーとしてログオンしたユーザーからのみ呼び出せる。Administrators グループのメンバーでないユーザーが呼び出すと
ERROR_ACCESS_DENIED を返して失敗する。Windows Vista 以降のユーザーアカウント制御 (UAC)
によっても失敗しうる。この関数を含むアプリケーションをビルトイン Administrator 以外の Administrators
グループのメンバーが実行した場合、マニフェストファイルで requestedExecutionLevel を
requireAdministrator に設定していない限りこの呼び出しは失敗する。マニフェストがない場合は、昇格シェル
(管理者として実行) から起動する必要がある。


%index
DisableMediaSense
DisableMediaSense 関数は、ローカルコンピュータ上の TCP/IP スタックのメディア検出機能を無効化する。
%prm
pHandle, pOverLapped
pHandle : [intptr] ハンドルを格納する変数へのポインタ。pOverlapped が非 NULL の場合、IP ドライバの呼び出しとメディア検出無効化に必要なハンドルを内部的に格納するのに使われる。この変数の値をアプリケーションから利用してはならない。ハンドルは内部用であり、閉じてはならない。
pOverLapped : [var] OVERLAPPED 構造体へのポインタ。hEvent 以外のメンバはすべて 0 に設定する必要がある。hEvent には有効なイベントオブジェクトのハンドル (CreateEvent で作成) を設定する。
%inst
DisableMediaSense 関数は、ローカルコンピュータ上の TCP/IP スタックのメディア検出機能を無効化する。

[戻り値]
関数が成功すると戻り値は NO_ERROR となる。失敗した場合の戻り値は以下のいずれかのエラーコードとなる。
このドキュメントは省略されている。

[備考]
pHandle か pOverlapped のいずれかが NULL なら DisableMediaSense は同期実行される。両方とも非
NULL なら OVERLAPPED を用いて非同期実行される。本関数は後で RestoreMediaSense
が呼ばれるまで完了しない。それまで IRP はキューに残る。呼び出しプロセスが終了すると IRP
はキャンセルされてメディア検出が復元される。同期呼び出しは別スレッドで行う必要がある。非同期呼び出しでは常に
ERROR_IO_PENDING を返し、IRP は RestoreMediaSense
呼び出し時に完了する。イベントオブジェクトのハンドルは不要になったら CloseHandle
で閉じる。プロセス終了時にシステムが自動的に閉じる。Windows Server 2003 / XP の TCP/IP
スタックは、下位ネットワークインターフェイスからのメディアセンス切断イベントに対応して、そのインターフェイスの全 IP
アドレスを削除する。スイッチ/ハブの電源オフやケーブル抜けで切断イベントが発生し、関連する IP 設定情報が失われる。さらに IP
helper
から切断インターフェイスを隠す方針により、アプリケーションからは単なる切断かシステムから削除されたかの区別が難しかった。クラスタなどのサーバには深刻な影響があり、DisableMediaSense
でメディアセンスを一時的に無効化できる。後で RestoreMediaSense
を呼んで復元する。System\CurrentControlSet\Services\Tcpip\Parameters\DisableDHCPMediaSense
レジストリキーも関連する。Windows Vista 以降の TCP/IP
スタックでは切断時にインターフェイスを隠さないよう変更されたため、DisableMediaSense /
RestoreMediaSense は何もせず常に NO_ERROR を返す。


%index
EnableRouter
EnableRouter 関数は、ローカルコンピュータで IPv4 転送を有効化する。同時に IPv4 転送有効化要求数を追跡する参照カウントをインクリメントする。
%prm
pHandle, pOverlapped
pHandle : [intptr] ハンドルへのポインタ。現在は未使用。
pOverlapped : [var] OVERLAPPED 構造体へのポインタ。hEvent 以外のメンバはすべて 0 に設定する必要がある。hEvent には CreateEvent で作成した有効なイベントオブジェクトのハンドルを設定する。
%inst
EnableRouter 関数は、ローカルコンピュータで IPv4 転送を有効化する。同時に IPv4
転送有効化要求数を追跡する参照カウントをインクリメントする。

[戻り値]
成功時、EnableRouter は ERROR_IO_PENDING を返す。失敗した場合は FormatMessage
で戻り値のエラーメッセージ文字列を取得せよ。
このドキュメントは省略されている。

[備考]
EnableRouter 関数は IPv4 の転送に特化している。EnableRouter を呼んだプロセスが
UnenableRouter を呼ばずに終了した場合、システムは UnenableRouter が呼ばれたかのように IPv4
転送有効化要求の参照カウントをデクリメントする。


%index
FlushIpNetTable
FlushIpNetTable 関数は、ローカルコンピュータの ARP テーブルから指定インターフェイスに関する ARP エントリをすべて削除する。
%prm
dwIfIndex
dwIfIndex : [int] すべての ARP エントリを削除する対象インターフェイスのインデックス。
%inst
FlushIpNetTable 関数は、ローカルコンピュータの ARP テーブルから指定インターフェイスに関する ARP
エントリをすべて削除する。

[戻り値]
関数が成功すると NO_ERROR (0) を返す。失敗した場合の戻り値は以下のいずれかのエラーコードとなる。
このドキュメントは省略されている。

[備考]
ARP テーブル取得には GetIpNetTable を使う。Windows Vista 以降では 本関数は Administrators
グループのメンバーとしてログオンしたユーザーからのみ呼び出せる。Administrators グループのメンバーでないユーザーが呼び出すと
ERROR_ACCESS_DENIED を返して失敗する。Windows Vista 以降のユーザーアカウント制御 (UAC)
によっても失敗しうる。この関数を含むアプリケーションをビルトイン Administrator 以外の Administrators
グループのメンバーが実行した場合、マニフェストファイルで requestedExecutionLevel を
requireAdministrator に設定していない限りこの呼び出しは失敗する。マニフェストがない場合は、昇格シェル
(管理者として実行) から起動する必要がある。
注: この関数は特権操作を行う。Administrators グループまたは NetworkConfigurationOperators
グループのメンバーでなければ成功しない。


%index
FlushIpNetTable2
FlushIpNetTable2 関数は、ローカルコンピュータの IP 近隣テーブルをフラッシュする。
%prm
Family, InterfaceIndex
Family : [int] フラッシュするアドレスファミリ。指定可能な値は Winsock2.h ヘッダファイルに列挙されている。AF_ アドレスファミリ定数と PF_ プロトコルファミリ定数は同じ値 (例: AF_INET と PF_INET) なのでどちらを使ってもよい。Windows Vista 以降向けの Windows SDK ではヘッダファイルの構成が変更され、この値は Ws2def.h ヘッダで定義される。Ws2def.h は Winsock2.h から自動的にインクルードされるため直接使用してはならない。現在サポートされる値は AF_INET、AF_INET6、AF_UNSPEC である。
InterfaceIndex : [int] インターフェイスインデックス。指定すると特定のインターフェイス上の近隣 IP アドレスエントリをフラッシュし、そうでなければ全インターフェイスをフラッシュする。無視するには 0 を指定する。
%inst
FlushIpNetTable2 関数は、ローカルコンピュータの IP 近隣テーブルをフラッシュする。

[戻り値]
関数が成功すると戻り値は NO_ERROR となる。失敗した場合の戻り値は以下のいずれかのエラーコードとなる。
このドキュメントは省略されている。

[備考]
FlushIpNetTable2 関数は Windows Vista 以降で定義される。ローカルシステム上の近隣 IP
アドレスをフラッシュ (削除) する。Family で削除対象ファミリを限定できる。IPv4 / IPv6 両方を削除するなら
AF_UNSPEC を指定する。InterfaceIndex でインターフェイスを限定でき、全インターフェイス対象なら 0
を指定する。Family は AF_INET / AF_INET6 / AF_UNSPEC のいずれか。本関数は
Administrators グループのメンバーとしてログオンしたユーザーからのみ呼び出せる。Administrators
グループのメンバーでないユーザーが呼び出すと ERROR_ACCESS_DENIED を返して失敗する。Windows Vista
以降のユーザーアカウント制御 (UAC) によっても失敗しうる。この関数を含むアプリケーションをビルトイン Administrator
以外の Administrators グループのメンバーが実行した場合、マニフェストファイルで
requestedExecutionLevel を requireAdministrator
に設定していない限りこの呼び出しは失敗する。マニフェストがない場合は、昇格シェル (管理者として実行) から起動する必要がある。


%index
FlushIpPathTable
FlushIpPathTable 関数は、ローカルコンピュータの IP パステーブルをフラッシュする。
%prm
Family
Family : [int] フラッシュするアドレスファミリ。指定可能な値は Winsock2.h ヘッダファイルに列挙されている。AF_ アドレスファミリ定数と PF_ プロトコルファミリ定数は同じ値 (例: AF_INET と PF_INET) なのでどちらを使ってもよい。Windows Vista 以降向けの Windows SDK ではヘッダファイルの構成が変更され、この値は Ws2def.h ヘッダで定義される。Ws2def.h は Winsock2.h から自動的にインクルードされるため直接使用してはならない。現在サポートされる値は AF_INET、AF_INET6、AF_UNSPEC である。
%inst
FlushIpPathTable 関数は、ローカルコンピュータの IP パステーブルをフラッシュする。

[戻り値]
関数が成功すると戻り値は NO_ERROR となる。失敗した場合の戻り値は以下のいずれかのエラーコードとなる。
このドキュメントは省略されている。

[備考]
FlushIpPathTable 関数は Windows Vista 以降で定義される。ローカルシステム上の IP
パスエントリをフラッシュ (削除) する。Family で IP パスエントリ削除対象ファミリを限定できる。IPv4 / IPv6
両方を削除するなら AF_UNSPEC を指定する。Family は AF_INET / AF_INET6 / AF_UNSPEC
のいずれか。本関数は Administrators
グループのメンバーとしてログオンしたユーザーからのみ呼び出せる。Administrators グループのメンバーでないユーザーが呼び出すと
ERROR_ACCESS_DENIED を返して失敗する。Windows Vista 以降のユーザーアカウント制御 (UAC)
によっても失敗しうる。この関数を含むアプリケーションをビルトイン Administrator 以外の Administrators
グループのメンバーが実行した場合、マニフェストファイルで requestedExecutionLevel を
requireAdministrator に設定していない限りこの呼び出しは失敗する。マニフェストがない場合は、昇格シェル
(管理者として実行) から起動する必要がある。


%index
FreeDnsSettings
(no summary)
%prm
Settings
Settings : [var] 
%inst



%index
FreeInterfaceDnsSettings
GetInterfaceDnsSettings が返した設定オブジェクトを解放する。
%prm
Settings
Settings : [var] 
%inst
GetInterfaceDnsSettings が返した設定オブジェクトを解放する。


%index
FreeMibTable
ネットワークインターフェイス / アドレス / 経路テーブルを返す関数 (例: GetIfTable2、GetAnycastIpAddressTable) が確保したバッファを解放する。
%prm
Memory
Memory : [intptr] 解放するバッファへのポインタ。
%inst
ネットワークインターフェイス / アドレス / 経路テーブルを返す関数 (例:
GetIfTable2、GetAnycastIpAddressTable) が確保したバッファを解放する。

[戻り値]
この関数は値を返さない。

[備考]
FreeMibTable 関数は Windows Vista 以降で定義される。各種関数がインターフェイス / アドレス /
経路テーブルの取得に使用した内部バッファを解放するのに用いる。これらのテーブルが不要になったら FreeMibTable
を呼んでメモリを解放すること。


%index
GetAdapterIndex
GetAdapterIndex 関数は、指定したアダプタ名からアダプタのインデックスを取得する。
%prm
AdapterName, IfIndex
AdapterName : [wstr] アダプタ名を指定する Unicode 文字列へのポインタ。
IfIndex : [var] アダプタのインデックスを受け取る ULONG 変数へのポインタ。
%inst
GetAdapterIndex 関数は、指定したアダプタ名からアダプタのインデックスを取得する。

[戻り値]
関数が成功すると戻り値は NO_ERROR となる。失敗した場合は FormatMessage
を使って戻り値のエラーメッセージ文字列を取得せよ。

[備考]
アダプタが完全に無効化されるまで、GetAdapterIndex 関数はそのアダプタを存在するものとして報告する。たとえば
NotifyAddrChange は最近無効化されたアダプタの IP アドレス削除を通知しても、無効化処理が完了するまでは
GetAdapterIndex が引き続きアダプタインデックスを報告する。システムに 1
つ以上のアダプタがある状態で問い合わせ対象のアダプタが存在しなければ、ERROR_DEV_NOT_EXIST を返す。アダプタが 1
つもなければ ERROR_NO_DATA
を返す。アダプタインデックスは無効化・再有効化時などに変わる可能性があり、永続値として扱ってはならない。


%index
GetAdapterOrderMap
GetAdapterOrderMap 関数は、ローカルコンピュータのインターフェイスの優先度を示すアダプタ順序マップを取得する。
%prm

%inst
GetAdapterOrderMap 関数は、ローカルコンピュータのインターフェイスの優先度を示すアダプタ順序マップを取得する。

[戻り値]
アダプタ優先度情報を格納した IP_ADAPTER_ORDER_MAP 構造体を返す。詳細は IP_ADAPTER_ORDER_MAP
構造体を参照。

[備考]
インターフェイスインデックスは [詳細設定] プロパティシートの [アダプターとバインド]
ダイアログで指定された順序で現れる。この順序はマルチホームシステムでのインターフェイス使用順序を制御するタイブレーカとして使われ、経路選択や
DNS 名前解決などに影響する。本関数を直接呼び出すのではなく、GetAdaptersInfo で返される IP_ADAPTER_INFO
構造体を使うこと。注: 呼び出し元は GetAdapterOrderMap が返す配列を LocalFree で解放する責任がある。


%index
GetAdaptersAddresses
ローカルコンピュータのアダプタに関連付けられたアドレスを取得する。
%prm
Family, Flags, Reserved, AdapterAddresses, SizePointer
Family : [int] 
Flags : [int] 取得するアドレスの種類。指定可能な値は Iptypes.h で定義される。Iptypes.h は Iphlpapi.h から自動的にインクルードされるため直接使用してはならない。
Reserved : [intptr] 現在未使用で、将来のシステム使用のために予約されている。呼び出し元は NULL を渡すこと。
AdapterAddresses : [var] 成功時に IP_ADAPTER_ADDRESSES 構造体の連結リストを受け取るバッファへのポインタ。
SizePointer : [var] AdapterAddresses が指すバッファのサイズを指定する変数へのポインタ。
%inst
ローカルコンピュータのアダプタに関連付けられたアドレスを取得する。

[戻り値]
関数が成功すると ERROR_SUCCESS (NO_ERROR と同値)
を返す。失敗した場合の戻り値は以下のいずれかのエラーコードとなる。
このドキュメントは省略されている。

[備考]
GetAdaptersAddresses 関数は IPv4 / IPv6 両方のアドレス情報を取得できる。アドレスは
IP_ADAPTER_ADDRESSES 構造体の連結リストとして AdapterAddresses
に返される。呼び出し元はバッファを確保し、不要になったら解放する責任がある (HeapAlloc / HeapFree
等。確保と解放は同じ関数ファミリを使うこと)。GetAdaptersAddresses
は同期呼び出しのみ。低レベルインターフェイステーブルを走査するため、かなりのリソースと時間を要する。必要なバッファサイズを得るには、まず小さいバッファで呼び出して
ERROR_BUFFER_OVERFLOW を得る方法もあるが、この方法は複数回呼び出しが必要になり推奨されない。推奨は 15KB
のバッファを事前確保する方法で、大半のケースで一発で成功する。Windows 10
より前ではアダプタの順序はネットワーク接続フォルダの詳細設定から制御できたが、Windows 10 以降では IPv4 / IPv6
の経路メトリックで決まる。GAA_FLAG_INCLUDE_ALL_INTERFACES を指定すると Family
に束縛されていないアドレスも含め全 NDIS アダプタを取得する。IP_ADAPTER_ADDRESSES 構造体のサイズは
Windows XP SP1、Windows Vista、Vista SP1 / Server 2008 で変更されている。Length
メンバでバージョンを判別できる。GetIpAddrTable はローカルコンピュータのインターフェイスから IPv4
アドレスへのマッピングテーブルを MIB_IPADDRTABLE で取得する。Windows Server 2003 以前の
Platform SDK では戻り値型が ULONG ではなく DWORD と定義されていた。IP_ADAPTER_ADDRESSES
では SOCKET_ADDRESS 構造体が使われる。Windows Vista 以降では Ws2def.h (Winsock2.h
から自動インクルード) で定義され、Windows Server 2003 / XP の Platform SDK では
Winsock2.h で宣言される。IP_ADAPTER_ADDRESSES を使うには Iphlpapi.h の前に
Winsock2.h をインクルードする必要がある。


%index
GetAdaptersInfo
GetAdaptersInfo 関数は、ローカルコンピュータのアダプタ情報を取得する。
%prm
AdapterInfo, SizePointer
AdapterInfo : [var] IP_ADAPTER_INFO 構造体の連結リストを受け取るバッファへのポインタ。
SizePointer : [var] pAdapterInfo が指すバッファのサイズ (ULONG) へのポインタ。アダプタ情報を格納するには不十分な場合、必要サイズが書き込まれ ERROR_BUFFER_OVERFLOW が返される。
%inst
GetAdaptersInfo 関数は、ローカルコンピュータのアダプタ情報を取得する。

[戻り値]
関数が成功すると ERROR_SUCCESS (NO_ERROR と同値)
を返す。失敗した場合の戻り値は以下のいずれかのエラーコードとなる。
このドキュメントは省略されている。

[備考]
GetAdaptersInfo 関数は IPv4 アドレスの情報のみを取得できる。Windows 10
より前ではアダプタ順序はネットワーク接続フォルダの詳細設定から制御できたが、Windows 10
以降では順序は未規定。GetAdaptersInfo と GetInterfaceInfo は IPv4
ループバックインターフェイスの情報を返さない。ループバックの情報は GetIpAddrTable で取得する。Windows XP
以降では、GetAdaptersInfo の返すアダプタリストに単方向アダプタも含まれる。送受信両方可能なアダプタ一覧を得るには
GetUniDirectionalAdapterInfo を呼んで除外すればよい。


%index
GetAnycastIpAddressEntry
ローカルコンピュータの既存エニーキャスト IP アドレスエントリの情報を取得する。
%prm
Row
Row : [var] エニーキャスト IP アドレスエントリを表す MIB_ANYCASTIPADDRESS_ROW へのポインタ。成功時、既存エニーキャスト IP アドレスのプロパティで更新される。
%inst
ローカルコンピュータの既存エニーキャスト IP アドレスエントリの情報を取得する。

[戻り値]
関数が成功すると戻り値は NO_ERROR となる。失敗した場合の戻り値は以下のいずれかのエラーコードとなる。
このドキュメントは省略されている。

[備考]
GetAnycastIpAddressEntry 関数は Windows Vista 以降で定義される。既存の
MIB_ANYCASTIPADDRESS_ROW エントリを取得する。Address メンバは有効なエニーキャスト IPv4 / IPv6
アドレスとファミリで初期化し、InterfaceLuid または InterfaceIndex のいずれかも初期化する
(InterfaceLuid 優先)。成功時、その他のプロパティが埋められる。GetAnycastIpAddressTable
で列挙可能。


%index
GetAnycastIpAddressTable
ローカルコンピュータのエニーキャスト IP アドレステーブルを取得する。
%prm
Family, Table
Family : [int] 取得するアドレスファミリ。指定可能な値は Winsock2.h ヘッダファイルに列挙されている。AF_ アドレスファミリ定数と PF_ プロトコルファミリ定数は同じ値 (例: AF_INET と PF_INET) なのでどちらを使ってもよい。Windows Vista 以降向けの Windows SDK ではヘッダファイルの構成が変更され、この値は Ws2def.h ヘッダで定義される。Ws2def.h は Winsock2.h から自動的にインクルードされるため直接使用してはならない。現在サポートされる値は AF_INET、AF_INET6、AF_UNSPEC である。
Table : [var] ローカルコンピュータ上のエニーキャスト IP アドレスエントリのテーブルを含む MIB_ANYCASTIPADDRESS_TABLE へのポインタ。
%inst
ローカルコンピュータのエニーキャスト IP アドレステーブルを取得する。

[戻り値]
関数が成功すると戻り値は NO_ERROR となる。失敗した場合の戻り値は以下のいずれかのエラーコードとなる。
このドキュメントは省略されている。

[備考]
GetAnycastIpAddressTable 関数は Windows Vista 以降で定義される。ローカルシステム上のエニーキャスト
IP アドレスを列挙し MIB_ANYCASTIPADDRESS_TABLE で返す。Table にはエントリ数と
MIB_ANYCASTIPADDRESS_ROW 配列が格納される。不要になったら FreeMibTable で解放すること。Family
は AF_INET / AF_INET6 / AF_UNSPEC のいずれか。NumEntries
と配列要素間にはアライメント用のパディングが含まれる可能性があるため、アクセス時はパディングを想定すること。


%index
GetBestInterface
GetBestInterface 関数は、指定した IPv4 アドレスに対する最適経路を持つインターフェイスのインデックスを取得する。
%prm
dwDestAddr, pdwBestIfIndex
dwDestAddr : [int] 最適経路を持つインターフェイスを取得する対象の宛先 IPv4 アドレス (IPAddr 形式)。
pdwBestIfIndex : [var] dwDestAddr で指定した IPv4 アドレスに対して最適経路を持つインターフェイスのインデックスを受け取る DWORD 変数へのポインタ。
%inst
GetBestInterface 関数は、指定した IPv4 アドレスに対する最適経路を持つインターフェイスのインデックスを取得する。

[戻り値]
関数が成功すると戻り値は NO_ERROR となる。失敗した場合の戻り値は以下のいずれかのエラーコードとなる。
このドキュメントは省略されている。

[備考]
GetBestInterface 関数は IPv4 アドレスのみに対応する。IPv6 アドレスには GetBestInterfaceEx
を使う。IPAddr データ型については Windows Data Types を参照。ドット区切り十進表記と IPAddr
形式の変換には inet_addr / inet_ntoa を使う。Windows Vista 以降では、pdwBestIfIndex は
IP Helper 内部で NET_IFINDEX 型ポインタとして扱われる。


%index
GetBestInterfaceEx
GetBestInterfaceEx 関数は、指定した IPv4 / IPv6 アドレスに対する最適経路を持つインターフェイスのインデックスを取得する。
%prm
pDestAddr, pdwBestIfIndex
pDestAddr : [var] 最適経路を持つインターフェイスを取得する対象の宛先 IPv6 / IPv4 アドレス (sockaddr 構造体形式)。
pdwBestIfIndex : [var] pDestAddr で指定した IPv6 / IPv4 アドレスに対して最適経路を持つインターフェイスのインデックスへのポインタ。
%inst
GetBestInterfaceEx 関数は、指定した IPv4 / IPv6
アドレスに対する最適経路を持つインターフェイスのインデックスを取得する。

[戻り値]
関数が成功すると戻り値は NO_ERROR となる。失敗した場合の戻り値は以下のいずれかのエラーコードとなる。
このドキュメントは省略されている。

[備考]
GetBestInterfaceEx 関数は GetBestInterface と異なり IPv4 / IPv6
両方に使用できる。pDestAddr が指す sockaddr 構造体の Family メンバは AF_INET または AF_INET6
のいずれかに設定する必要がある。Windows Vista 以降では pdwBestIfIndex は IP Helper 内部で
NET_IFINDEX 型ポインタとして扱われる。


%index
GetBestRoute
GetBestRoute 関数は、指定した宛先 IP アドレスへの最適経路を取得する。
%prm
dwDestAddr, dwSourceAddr, pBestRoute
dwDestAddr : [int] 最適経路を取得する対象の宛先 IP アドレス。
dwSourceAddr : [int] 送信元 IP アドレス。これはローカルコンピュータのインターフェイスに対応する。同じ宛先への最適経路が複数ある場合、このインターフェイスを使う経路が選択される。
pBestRoute : [var] dwDestAddr で指定した IP アドレスへの最適経路を格納する MIB_IPFORWARDROW 構造体へのポインタ。
%inst
GetBestRoute 関数は、指定した宛先 IP アドレスへの最適経路を取得する。

[戻り値]
関数が成功すると戻り値は NO_ERROR となる。失敗した場合は FormatMessage
を使って戻り値のエラーに対するメッセージ文字列を取得せよ。


%index
GetBestRoute2
ローカルコンピュータ上で、指定した宛先 IP アドレスへの最適経路の IP 経路エントリを取得する。
%prm
InterfaceLuid, InterfaceIndex, SourceAddress, DestinationAddress, AddressSortOptions, BestRoute, BestSourceAddress
InterfaceLuid : [var] IP 経路エントリに関連付けるネットワークインターフェイスのローカル一意識別子 (LUID)。
InterfaceIndex : [int] IP 経路エントリに関連付けるネットワークインターフェイスのローカルインデックス値。無効化・再有効化時などに変わることがあるため永続値として扱ってはならない。
SourceAddress : [var] 送信元 IP アドレス。省略して NULL を渡してもよい。
DestinationAddress : [var] 宛先 IP アドレス。
AddressSortOptions : [int] IP アドレスのソート方法に影響するオプション一式。現在未使用。
BestRoute : [var] 送信元 IP アドレスから宛先 IP アドレスへの最適経路の MIB_IPFORWARD_ROW2 へのポインタ。
BestSourceAddress : [var] 最適な送信元 IP アドレスへのポインタ。
%inst
ローカルコンピュータ上で、指定した宛先 IP アドレスへの最適経路の IP 経路エントリを取得する。

[戻り値]
関数が成功すると戻り値は NO_ERROR となる。失敗した場合の戻り値は以下のいずれかのエラーコードとなる。
このドキュメントは省略されている。

[備考]
GetBestRoute2 関数は Windows Vista 以降で定義される。送信元 IP から宛先 IP への最適経路の
MIB_IPFORWARD_ROW2 を取得する。DestinationAddress は有効な IPv4 / IPv6
アドレスとファミリで初期化する。SourceAddress は希望するアドレスで初期化してもよい。InterfaceLuid または
InterfaceIndex のいずれかも初期化する必要がある (InterfaceLuid 優先)。成功時、最適経路の
MIB_IPFORWARD_ROW2 が返される。


%index
GetCurrentThreadCompartmentId
将来使用のために予約されている。使用してはならない。(GetCurrentThreadCompartmentId)
%prm

%inst
将来使用のために予約されている。使用してはならない。(GetCurrentThreadCompartmentId)


%index
GetCurrentThreadCompartmentScope
(no summary)
%prm
CompartmentScope, CompartmentId
CompartmentScope : [var] 
CompartmentId : [var] 
%inst



%index
GetDefaultCompartmentId
GetDefaultCompartmentId 関数は、ローカルコンピュータの既定ネットワークルーティングコンパートメント識別子を取得する。
%prm

%inst
GetDefaultCompartmentId
関数は、ローカルコンピュータの既定ネットワークルーティングコンパートメント識別子を取得する。

[戻り値]
関数が成功すると戻り値は既定のコンパートメント ID となる。失敗した場合の戻り値は以下のいずれかのエラーコードとなる。
このドキュメントは省略されている。


%index
GetDnsSettings
(no summary)
%prm
Settings
Settings : [var] 
%inst



%index
GetExtendedTcpTable
アプリケーションから利用可能な TCP エンドポイントの一覧を含むテーブルを取得する。
%prm
pTcpTable, pdwSize, bOrder, ulAf, TableClass, Reserved
pTcpTable : [intptr] アプリケーションで利用可能なフィルタ済み TCP エンドポイントを格納するテーブル構造体へのポインタ。具体的なテーブル型の決定は備考を参照。
pdwSize : [var] pTcpTable に返される構造体の推定サイズ (バイト単位)。小さすぎる場合は ERROR_INSUFFICIENT_BUFFER が返り、正しいサイズがこのフィールドに書き込まれる。
bOrder : [int] TCP 接続テーブルをソートするかどうか。TRUE にすると最小のローカル IP アドレスから昇順にソートされる。FALSE の場合は取得順のまま並ぶ。
ulAf : [int] TCP エンドポイントで使われる IP のバージョン。
TableClass : [int] 取得する TCP テーブル構造体の種類。TCP_TABLE_CLASS 列挙の値のいずれか。Windows Vista 以降の Windows SDK では TCP_TABLE_CLASS は Iprtrmib.h で定義される (Iphlpapi.h ではない)。TCP_TABLE_CLASS と ulAf の組み合わせで取得する拡張 TCP 情報が決まる。
Reserved : [int] 予約済み。0 を指定する必要がある。
%inst
アプリケーションから利用可能な TCP エンドポイントの一覧を含むテーブルを取得する。

[戻り値]
呼び出しが成功すると NO_ERROR を返す。失敗した場合の戻り値は以下のいずれかのエラーコードとなる。
このドキュメントは省略されている。

[備考]
本関数が返すテーブル型は ulAf と TableClass の組み合わせで決まる。ulAf が AF_INET
の場合、TableClass ごとの取得テーブル型は次表のとおり。
このドキュメントは省略されている。


%index
GetExtendedUdpTable
アプリケーションから利用可能な UDP エンドポイントの一覧を含むテーブルを取得する。
%prm
pUdpTable, pdwSize, bOrder, ulAf, TableClass, Reserved
pUdpTable : [intptr] アプリケーションで利用可能なフィルタ済み UDP エンドポイントを格納するテーブル構造体へのポインタ。具体的なテーブル型の決定は備考を参照。
pdwSize : [var] pUdpTable に返される構造体の推定サイズ (バイト単位)。小さすぎる場合は ERROR_INSUFFICIENT_BUFFER が返り、正しいサイズがこのフィールドに書き込まれる。
bOrder : [int] UDP エンドポイントテーブルをソートするかどうか。TRUE にすると最小のローカル IP アドレスから昇順にソートされる。FALSE の場合は取得順のまま並ぶ。
ulAf : [int] UDP エンドポイントで使われる IP のバージョン。
TableClass : [int] 取得する UDP テーブル構造体の種類。UDP_TABLE_CLASS 列挙の値のいずれか。Windows Vista 以降の Windows SDK では UDP_TABLE_CLASS は Iprtrmib.h で定義される (Iphlpapi.h ではない)。UDP_TABLE_CLASS と ulAf の組み合わせで取得する拡張 UDP 情報が決まる。
Reserved : [int] 予約済み。0 を指定する必要がある。
%inst
アプリケーションから利用可能な UDP エンドポイントの一覧を含むテーブルを取得する。

[戻り値]
呼び出しが成功すると NO_ERROR を返す。失敗した場合の戻り値は以下のいずれかのエラーコードとなる。
このドキュメントは省略されている。

[備考]
本関数が返すテーブル型は ulAf と TableClass の組み合わせで決まる。ulAf が AF_INET
の場合、TableClass ごとの取得テーブル型は次表のとおり。
このドキュメントは省略されている。


%index
GetFriendlyIfIndex
インターフェイスインデックスを受け取り、下位 24 ビットのみを使う後方互換インターフェイスインデックスを返す。
%prm
IfIndex
IfIndex : [int] 後方互換用 ("フレンドリ") インターフェイスインデックスを導出する元のインターフェイスインデックス。
%inst
インターフェイスインデックスを受け取り、下位 24 ビットのみを使う後方互換インターフェイスインデックスを返す。

[戻り値]
下位 24 ビットのみを使う後方互換インターフェイスインデックス。


%index
GetIcmpStatistics
GetIcmpStatistics 関数は、ローカルコンピュータの IPv4 用 ICMP (Internet Control Message Protocol) 統計情報を取得する。
%prm
Statistics
Statistics : [var] ローカルコンピュータの ICMP 統計情報を受け取る MIB_ICMP 構造体へのポインタ。
%inst
GetIcmpStatistics 関数は、ローカルコンピュータの IPv4 用 ICMP (Internet Control
Message Protocol) 統計情報を取得する。

[戻り値]
関数が成功すると戻り値は NO_ERROR となる。失敗した場合の戻り値は以下のいずれかのエラーコードとなる。
このドキュメントは省略されている。

[備考]
GetIcmpStatistics 関数は、ローカルコンピュータの IPv4 用 ICMP 統計情報を返す。Windows XP 以降では
GetIpStatisticsEx で IPv4 / IPv6 両方の ICMP 統計を取得できる。


%index
GetIcmpStatisticsEx
GetIcmpStatisticsEx 関数は、ローカルコンピュータの ICMP 統計情報を取得する。IPv6 ICMP 統計の取得にも対応する。
%prm
Statistics, Family
Statistics : [var] ローカルコンピュータの ICMP 統計情報を格納する MIB_ICMP_EX 構造体へのポインタ。
Family : [int] ICMP 統計を取得するプロトコルファミリ。以下のいずれかでなければならない。
%inst
GetIcmpStatisticsEx 関数は、ローカルコンピュータの ICMP 統計情報を取得する。IPv6 ICMP
統計の取得にも対応する。

[戻り値]
関数が成功すると戻り値は NO_ERROR となる。失敗した場合の戻り値は以下のいずれかのエラーコードとなる。
このドキュメントは省略されている。

[備考]
GetIpStatisticsEx で IPv4 / IPv6 両方の ICMP 統計を取得できる。GetIcmpStatistics は
IPv4 のみ。


%index
GetIfEntry
GetIfEntry 関数は、ローカルコンピュータ上の指定インターフェイスの情報を取得する。
%prm
pIfRow
pIfRow : [var] 成功時にローカルコンピュータのインターフェイス情報を受け取る MIB_IFROW へのポインタ。入力時には dwIndex メンバに、事前の GetIfTable / GetIfTable2 / GetIfTable2Ex 呼び出しで取得したインターフェイスのインデックスを設定する。
%inst
GetIfEntry 関数は、ローカルコンピュータ上の指定インターフェイスの情報を取得する。

[戻り値]
関数が成功すると戻り値は NO_ERROR となる。失敗した場合の戻り値は以下のいずれかのエラーコードとなる。
このドキュメントは省略されている。

[備考]
GetIfEntry 関数はローカルコンピュータのインターフェイス情報を取得する。pIfRow の dwIndex メンバは事前の
GetIfTable 系関数で取得した有効なネットワークインターフェイスインデックスで初期化する必要がある。dwIndex
が既存インデックスと一致しない場合、本関数は失敗する。


%index
GetIfEntry2
ローカルコンピュータ上の指定インターフェイスの情報を取得する。
%prm
Row
Row : [var] 成功時にローカルコンピュータのインターフェイス情報を受け取る MIB_IF_ROW2 へのポインタ。入力時に InterfaceLuid または InterfaceIndex を取得対象のインターフェイスに設定しておく必要がある。
%inst
ローカルコンピュータ上の指定インターフェイスの情報を取得する。

[戻り値]
関数が成功すると戻り値は NO_ERROR となる。失敗した場合の戻り値は以下のいずれかのエラーコードとなる。
このドキュメントは省略されている。

[備考]
GetIfEntry2 関数は Windows Vista 以降で定義される。入力時に InterfaceLuid または
InterfaceIndex のいずれかを初期化する必要がある (InterfaceLuid 優先、ゼロなら
InterfaceIndex)。出力時には MIB_IF_ROW2 の残りのフィールドが埋められる。Netioapi.h は
Iphlpapi.h に自動インクルードされるため直接使用してはならない。


%index
GetIfEntry2Ex
ローカルコンピュータ上の指定インターフェイスについて、指定したレベルの情報を取得する。
%prm
Level, Row
Level : [int] 取得するインターフェイス情報のレベル。MIB_IF_ENTRY_LEVEL 列挙の値 (Netioapi.h で定義) のいずれか。
Row : [var] 成功時にローカルコンピュータのインターフェイス情報を受け取る MIB_IF_ROW2 へのポインタ。入力時に InterfaceLuid または InterfaceIndex を設定する必要がある。
%inst
ローカルコンピュータ上の指定インターフェイスについて、指定したレベルの情報を取得する。

[戻り値]
関数が成功すると戻り値は NO_ERROR となる。失敗した場合の戻り値は以下のいずれかのエラーコードとなる。
このドキュメントは省略されている。

[備考]
GetIfEntry2Ex 関数は、指定インターフェイスの情報を取得し MIB_IF_ROW2 へのポインタで返す。GetIfEntry2
の拡張版で、取得する情報レベルを選択できる。入力時に InterfaceLuid または InterfaceIndex
のいずれかを初期化する (InterfaceLuid 優先)。出力時には残りのフィールドが埋められる。Netioapi.h は
Iphlpapi.h に自動インクルードされるため直接使用してはならない。


%index
GetIfStackTable
インターフェイススタック上のネットワークインターフェイスの関係を示すインターフェイススタック行エントリテーブルを取得する。
%prm
Table
Table : [var] インターフェイススタック行エントリのテーブルを受け取る MIB_IFSTACK_TABLE バッファへのポインタ。
%inst
インターフェイススタック上のネットワークインターフェイスの関係を示すインターフェイススタック行エントリテーブルを取得する。

[戻り値]
関数が成功すると戻り値は NO_ERROR となる。失敗した場合の戻り値は以下のいずれかのエラーコードとなる。
このドキュメントは省略されている。

[備考]
GetIfStackTable 関数は Windows Vista
以降で定義される。ローカルシステム上のインターフェイススタックの物理・論理ネットワークインターフェイスを列挙し
MIB_IFSTACK_TABLE で返す。MIB_IFSTACK_ROW の HigherLayerInterfaceIndex は
LowerLayerInterfaceIndex のインターフェイスの直上にあるインターフェイスを示す。不要になったら
FreeMibTable で解放すること。NumEntries と配列要素間にはアライメント用のパディングが含まれる可能性がある。


%index
GetIfTable
GetIfTable 関数は、MIB-II インターフェイステーブルを取得する。
%prm
pIfTable, pdwSize, bOrder
pIfTable : [var] インターフェイステーブルを MIB_IFTABLE として受け取るバッファへのポインタ。
pdwSize : [var] 入力時は pIfTable が指すバッファのサイズ (バイト単位)。出力時はバッファが小さすぎる場合に必要サイズが設定される。
bOrder : [int] 戻されるインターフェイステーブルをインターフェイスインデックスで昇順にソートするかを示すブール値。TRUE ならソートされる。
%inst
GetIfTable 関数は、MIB-II インターフェイステーブルを取得する。

[戻り値]
関数が成功すると戻り値は NO_ERROR となる。失敗した場合の戻り値は以下のいずれかのエラーコードとなる。
このドキュメントは省略されている。

[備考]
GetIfTable 関数はローカルシステム上の物理インターフェイス (ソフトウェアループバックを含む) を列挙し MIB_IFTABLE
で返す。Windows Vista 以降の GetIfTable2 / GetIfTable2Ex は論理インターフェイス (L2TP /
PPTP / PPPoE などの WAN ミニポート) も列挙できる拡張版である。MIB_IFTABLE には dwNumEntries
と MIB_IFROW の配列が含まれる。アクセス時はアライメント用パディングを想定すること。


%index
GetIfTable2
MIB-II インターフェイステーブルを取得する。(GetIfTable2)
%prm
Table
Table : [var] インターフェイステーブルを受け取る MIB_IF_TABLE2 バッファへのポインタ。
%inst
MIB-II インターフェイステーブルを取得する。(GetIfTable2)

[戻り値]
関数が成功すると戻り値は NO_ERROR となる。失敗した場合の戻り値は以下のいずれかのエラーコードとなる。
このドキュメントは省略されている。

[備考]
GetIfTable2 関数は、ローカルシステム上の論理・物理インターフェイスを列挙し MIB_IF_TABLE2
で返す。GetIfTable の拡張版で、GetIfTable2Ex に Level=MibIfTableNormal
を指定するのと同じ結果になる。Table にはインターフェイス数と MIB_IF_ROW2 配列が格納される。不要になったら
FreeMibTable で解放すること。アライメント用のパディングが含まれる可能性がある。


%index
GetIfTable2Ex
MIB-II インターフェイステーブルを取得する。(GetIfTable2Ex)
%prm
Level, Table
Level : [int] 取得するインターフェイス情報のレベル。MIB_IF_TABLE_LEVEL 列挙の値 (Netioapi.h で定義) のいずれか。
Table : [var] インターフェイステーブルを受け取る MIB_IF_TABLE2 バッファへのポインタ。
%inst
MIB-II インターフェイステーブルを取得する。(GetIfTable2Ex)

[戻り値]
関数が成功すると戻り値は NO_ERROR となる。失敗した場合の戻り値は以下のいずれかのエラーコードとなる。
このドキュメントは省略されている。

[備考]
GetIfTable2Ex 関数は、ローカルシステム上の論理・物理インターフェイスを列挙し MIB_IF_TABLE2
で返す。GetIfTable の拡張版で、取得するインターフェイス情報レベルを選択できる。GetIfTable2 と違い Level
を指定できる点が異なる。Level=MibIfTableNormal 時は GetIfTable2 と同じ結果になる。NDIS
中間ドライバ・NDIS フィルタドライバ (LWF) のインターフェイスを含むすべてのインターフェイスが返される。Level は
MIB_IF_ROW2 の統計および状態メンバの返し方に影響する。例えば NIC が MediaConnectStateConnected
を報告し LWF が MediaConnectStateDisconnected に変更した場合、MibIfTableNormal
ではフィルタスタック最上位の状態 (Disconnected) を返し、MibIfTableRaw ではインターフェイスレベルの状態
(Connected) を返す。不要になったら FreeMibTable
で解放すること。アライメント用のパディングが含まれる可能性がある。


%index
GetInterfaceCurrentTimestampCapabilities
この関数はシステムで予約されている。ユーザーコードから呼び出してはならない。(GetInterfaceCurrentTimestampCapabilities)
%prm
InterfaceLuid, TimestampCapabilites
InterfaceLuid : [var] 予約済み。
TimestampCapabilites : [var] 予約済み。
%inst

この関数はシステムで予約されている。ユーザーコードから呼び出してはならない。(GetInterfaceCurrentTimestampCapabilities)

[戻り値]
予約済み。


%index
GetInterfaceDnsSettings
Interface パラメータで指定したインターフェイスの DNS 設定を取得する。
%prm
Interface, Settings
Interface : [int] 型: _In_ GUID 設定を参照する COM インターフェイスの GUID。
Settings : [var] 型: _Inout_ const DNS_INTERFACE_SETTINGS* GetInterfaceDnsSettings はこの構造体のすべての設定を埋める。呼び出し側は Version メンバのみを設定する (Flags は空にする)。Version が DNS_INTERFACE_SETTINGS_VERSION1 の場合は DNS_INTERFACE_SETTINGS を、DNS_INTERFACE_SETTINGS_VERSION3 の場合は DNS_INTERFACE_SETTINGS3 を指すポインタである必要がある。
%inst
Interface パラメータで指定したインターフェイスの DNS 設定を取得する。

[戻り値]
成功時は NO_ERROR を返す。0 以外の戻り値は失敗を示す。


%index
GetInterfaceHardwareTimestampCapabilities
この関数はシステムで予約されている。ユーザーコードから呼び出してはならない。(GetInterfaceHardwareTimestampCapabilities)
%prm
InterfaceLuid, TimestampCapabilites
InterfaceLuid : [var] 予約済み。
TimestampCapabilites : [var] 予約済み。
%inst

この関数はシステムで予約されている。ユーザーコードから呼び出してはならない。(GetInterfaceHardwareTimestampCapabilities)

[戻り値]
予約済み。


%index
GetInterfaceInfo
GetInterfaceInfo 関数は、ローカルシステムで IPv4 が有効なネットワークインターフェイスアダプタ一覧を取得する。
%prm
pIfTable, dwOutBufLen
pIfTable : [var] アダプタ一覧を受け取る IP_INTERFACE_INFO 構造体を指定するバッファへのポインタ。呼び出し元がバッファを確保する必要がある。
dwOutBufLen : [var] pIfTable が指す IP_INTERFACE_INFO 構造体用バッファのサイズを指定する DWORD 変数へのポインタ。IPv4 インターフェイス情報を格納するのに不十分な場合は必要サイズが書き込まれ ERROR_INSUFFICIENT_BUFFER が返される。
%inst
GetInterfaceInfo 関数は、ローカルシステムで IPv4 が有効なネットワークインターフェイスアダプタ一覧を取得する。

[戻り値]
関数が成功すると戻り値は NO_ERROR となる。失敗した場合の戻り値は以下のいずれかのエラーコードとなる。
このドキュメントは省略されている。

[備考]
GetInterfaceInfo 関数は IPv4 が有効なネットワークアダプタに特化している。pIfTable が指す
IP_INTERFACE_INFO 構造体を介して、IPv4 有効ネットワークアダプタの数と IP_ADAPTER_INDEX_MAP
配列を返す。NumAdapters が 0 でも少なくとも 1 つの IP_ADAPTER_INDEX_MAP が返される
(内容は未定義)。バッファが小さすぎると ERROR_INSUFFICIENT_BUFFER が返り、必要サイズが dwOutBufLen
に書き込まれる。正しい使い方は 2 回呼び出す方法で、1 回目は pIfTable に NULL / dwOutBufLen に 0
を渡し、2 回目で取得サイズのバッファを渡す。GetAdaptersInfo / GetInterfaceInfo
はループバックインターフェイスの情報を返さない (GetIpAddrTable で取得する)。Windows Vista 以降では
IP_ADAPTER_INDEX_MAP の Name メンバがネットワークインターフェイス GUID の Unicode 文字列
('{' で始まる) になる場合がある。


%index
GetInvertedIfStackTable
インターフェイススタック上のネットワークインターフェイスの関係を示す反転インターフェイススタック行エントリテーブルを取得する。
%prm
Table
Table : [var] 反転インターフェイススタック行エントリのテーブルを受け取る MIB_INVERTEDIFSTACK_TABLE バッファへのポインタ。
%inst
インターフェイススタック上のネットワークインターフェイスの関係を示す反転インターフェイススタック行エントリテーブルを取得する。

[戻り値]
関数が成功すると戻り値は NO_ERROR となる。失敗した場合の戻り値は以下のいずれかのエラーコードとなる。
このドキュメントは省略されている。

[備考]
GetInvertedIfStackTable 関数は Windows Vista
以降で定義される。インターフェイススタックの物理・論理ネットワークインターフェイスを反転形式で
MIB_INVERTEDIFSTACK_TABLE として返す。MIB_INVERTEDIFSTACK_ROW の
HigherLayerInterfaceIndex は LowerLayerInterfaceIndex
のインターフェイスの直上にあるインターフェイスを示す。不要になったら FreeMibTable で解放すること。NumEntries
と配列要素間にはアライメント用のパディングが含まれる可能性がある。


%index
GetIpAddrTable
GetIpAddrTable 関数は、インターフェイスから IPv4 アドレスへのマッピングテーブルを取得する。
%prm
pIpAddrTable, pdwSize, bOrder
pIpAddrTable : [var] インターフェイスから IPv4 アドレスへのマッピングテーブルを MIB_IPADDRTABLE として受け取るバッファへのポインタ。
pdwSize : [var] 入力時は pIpAddrTable が指すバッファのサイズ (バイト単位)。出力時はバッファが小さすぎる場合に必要サイズが設定される。
bOrder : [int] TRUE の場合、戻されるマッピングテーブルは IPv4 アドレスで昇順ソートされる。ネットワークバイトオーダーでのソートである (例: 10.0.0.255 は 10.0.1.0 の直前に来る)。
%inst
GetIpAddrTable 関数は、インターフェイスから IPv4 アドレスへのマッピングテーブルを取得する。

[戻り値]
関数が成功すると戻り値は NO_ERROR となる。失敗した場合の戻り値は以下のいずれかのエラーコードとなる。
このドキュメントは省略されている。

[備考]
GetIpAddrTable 関数はローカルコンピュータのインターフェイスから IPv4 アドレスへのマッピングテーブルを
MIB_IPADDRTABLE で返す。NIC の手動リセットや特定の PnP イベントでアドレスが変わることがある。Windows
Server 2003 / XP では DisableMediaSense
でメディア検出を無効化している場合、切断されたインターフェイスの IPv4 アドレスが返ることがあるが使用不可である。Windows
Vista / Server 2008 以降ではメディア検出の影響を受けず、有効な IPv4 アドレスのみが返る。Windows XP
以降で IPv6 / IPv4 両方とインターフェイス情報を取得するには GetAdaptersAddresses
を使う。アクセス時はアライメント用のパディングを想定すること。Windows Vista 以降では MIB_IPADDRROW は
Ipmib.h で定義される (Iprtrmib.h から自動インクルード、直接使用禁止)。


%index
GetIpErrorString
GetIpErrorString 関数は、IP Helper のエラー文字列を取得する。
%prm
ErrorCode, Buffer, Size
ErrorCode : [int] 取得するエラーコード。指定可能な値は Ipexport.h で定義される。
Buffer : [wstr] 関数が NO_ERROR で戻った場合にエラーコード文字列を格納するバッファへのポインタ。
Size : [var] Buffer が指すバッファの長さ (文字数、終端 NULL を除く。すなわちバッファ文字数 - 1) を示す DWORD へのポインタ。
%inst
GetIpErrorString 関数は、IP Helper のエラー文字列を取得する。

[戻り値]
成功時は NO_ERROR を返す。失敗した場合は FormatMessage を使って戻り値のエラーメッセージ文字列を取得せよ。

[備考]
GetIpErrorString 関数は IP エラーコードに対する IP Helper
のエラー文字列を取得するのに使う。ErrorCode に渡す IP_STATUS エラーコードは ICMP_ECHO_REPLY /
ICMP_ECHO_REPLY32 / ICMPV6_ECHO_REPLY 構造体の Status
メンバとして返されるもので、Icmp6ParseReplies、Icmp6SendEcho2、IcmpParseReplies、IcmpSendEcho、IcmpSendEcho2、IcmpSendEcho2Ex
などで使われる。Windows Vista 以降の Windows SDK では Buffer のデータ型が PWCHAR から
PWSTR に変更された。


%index
GetIpForwardEntry2
ローカルコンピュータ上の IP 経路エントリの情報を取得する。
%prm
Row
Row : [var] IP 経路エントリを表す MIB_IPFORWARD_ROW2 へのポインタ。成功時、IP 経路エントリのプロパティで更新される。
%inst
ローカルコンピュータ上の IP 経路エントリの情報を取得する。

[戻り値]
関数が成功すると戻り値は NO_ERROR となる。失敗した場合の戻り値は以下のいずれかのエラーコードとなる。
このドキュメントは省略されている。

[備考]
GetIpForwardEntry2 関数は Windows Vista 以降で定義される。MIB_IPFORWARD_ROW2
エントリを取得する。DestinationPrefix は有効な IPv4 / IPv6 アドレスプレフィックスとファミリ、NextHop
は有効なアドレスとファミリで初期化し、InterfaceLuid または InterfaceIndex のいずれかも初期化する
(InterfaceLuid 優先)。成功時、その他のプロパティが埋められる。Metric
は完全メトリックの一部であり、関連インターフェイスの MIB_IPINTERFACE_ROW の Metric
と合算される。インターフェイスメトリックは GetIpInterfaceEntry で取得できる。GetIpForwardTable2
で経路エントリを列挙できる。


%index
GetIpForwardTable
GetIpForwardTable 関数は、IPv4 ルーティングテーブルを取得する。
%prm
pIpForwardTable, pdwSize, bOrder
pIpForwardTable : [var] IPv4 ルーティングテーブルを MIB_IPFORWARDTABLE として受け取るバッファへのポインタ。
pdwSize : [var] 入力時は pIpForwardTable が指すバッファのサイズ (バイト単位)。出力時はバッファが小さすぎる場合に必要サイズが設定される。
bOrder : [int] 戻されるテーブルをソートするかを示すブール値。TRUE ならテーブルは次の順序でソートされる:
%inst
GetIpForwardTable 関数は、IPv4 ルーティングテーブルを取得する。

[戻り値]
関数が成功すると NO_ERROR (0) を返す。失敗した場合の戻り値は以下のいずれかのエラーコードとなる。
このドキュメントは省略されている。

[備考]
MIB_IPFORWARDROW の dwForwardProto は、経路を生成したプロトコルやルーティング機構を示す。詳細は
Protocol Identifiers を参照。dwForwardDest / dwForwardMask /
dwForwardNextHop はネットワークバイトオーダーの IPv4 アドレスを表す。dwForwardDest が 0.0.0.0
の場合は既定経路となる。複数のネットワークアダプタがインストールされている場合、MIB_IPFORWARDTABLE には
dwForwardDest = 0.0.0.0 のエントリが複数含まれうる。dwForwardAge が INFINITE
の場合、タイムアウトで削除されない。それ以外の値はテーブルへの追加・変更からの秒数を示す。Windows Server 2003 /
Windows 2000 Server で RRAS が動作している場合、返される MIB_IPFORWARDROW の
dwForwardType と dwForwardAge は 0 になる。Windows Vista / Server 2008 では
dwForwardMetric1 は経路メトリックとインターフェイスメトリックの合算であり、関連する
MIB_IPINTERFACE_ROW の Metric
以上でなければならない。dwForwardPolicy、dwForwardNextHopAS、dwForwardMetric2～5 は現在
IPv4 ルーティングで使用されない。


%index
GetIpForwardTable2
GetIpForwardTable2 関数は、ローカルコンピュータの IP 経路エントリを取得する。
%prm
Family, Table
Family : [int] 取得するアドレスファミリ。指定可能な値は Winsock2.h ヘッダファイルに列挙されている。AF_ アドレスファミリ定数と PF_ プロトコルファミリ定数は同じ値 (例: AF_INET と PF_INET) なのでどちらを使ってもよい。Windows Vista 以降向けの Windows SDK ではヘッダファイルの構成が変更され、この値は Ws2def.h ヘッダで定義される。Ws2def.h は Winsock2.h から自動的にインクルードされるため直接使用してはならない。現在サポートされる値は AF_INET、AF_INET6、AF_UNSPEC である。
Table : [var] ローカルコンピュータ上の IP 経路エントリテーブルを格納する MIB_IPFORWARD_TABLE2 へのポインタ。
%inst
GetIpForwardTable2 関数は、ローカルコンピュータの IP 経路エントリを取得する。

[戻り値]
関数が成功すると戻り値は NO_ERROR となる。失敗した場合の戻り値は以下のいずれかのエラーコードとなる。
このドキュメントは省略されている。

[備考]
GetIpForwardTable2 関数は Windows Vista 以降で定義される。ローカルシステム上の IP
経路エントリを列挙し MIB_IPFORWARD_TABLE2 で返す。Table にはエントリ数と MIB_IPFORWARD_ROW2
配列が格納される。不要になったら FreeMibTable で解放すること。Family は AF_INET / AF_INET6 /
AF_UNSPEC のいずれか。アクセス時はアライメント用のパディングを想定すること。


%index
GetIpInterfaceEntry
ローカルコンピュータ上の指定インターフェイスの IP 情報を取得する。
%prm
Row
Row : [var] 成功時にローカルコンピュータのインターフェイス情報を受け取る MIB_IPINTERFACE_ROW へのポインタ。入力時に InterfaceLuid または InterfaceIndex を設定する必要がある。
%inst
ローカルコンピュータ上の指定インターフェイスの IP 情報を取得する。

[戻り値]
関数が成功すると戻り値は NO_ERROR となる。失敗した場合の戻り値は以下のいずれかのエラーコードとなる。
このドキュメントは省略されている。

[備考]
GetIpInterfaceEntry 関数は Windows Vista 以降で定義される。Family は AF_INET または
AF_INET6 で初期化する必要がある。さらに InterfaceLuid または InterfaceIndex のいずれかを初期化する
(InterfaceLuid 優先)。出力時に残りのメンバが埋められる。MIB_IPINTERFACE_ROW の既定値初期化には
InitializeIpInterfaceEntry を使う。変更後 SetIpInterfaceEntry
を呼ぶ。セキュリティ要件の異なる複数ネットワークへの同時アクセスはセキュリティホールとなるため、Windows Server 2003 /
XP では弱いホストモデルを採用し RAS が他インターフェイスの既定経路メトリックを上げることでこれを防いでいた (結果として VPN
越しにルーティングされる)。Windows Vista 以降では既定で強いホストモデルが採用される。送信元 IP が
GetBestRoute2 / GetBestRoute
の経路検索で指定されると、検索はその送信元インターフェイスに限定される。DisableDefaultRoutes メンバを TRUE
に設定すれば既定経路を無効化でき、VPN クライアントが必要に応じてスプリットトンネリングを禁止するのに使える。


%index
GetIpInterfaceTable
ローカルコンピュータ上の IP インターフェイスエントリを取得する。
%prm
Family, Table
Family : [int] 取得する IP インターフェイスのアドレスファミリ。指定可能な値は Winsock2.h に列挙されている。AF_ と PF_ は同じ値。Windows Vista 以降ではこの値は Ws2def.h で定義される (Winsock2.h から自動インクルード)。現在サポートされる値は AF_INET、AF_INET6、AF_UNSPEC である。
Table : [var] IP インターフェイスエントリのテーブルを受け取る MIB_IPINTERFACE_TABLE バッファへのポインタ。
%inst
ローカルコンピュータ上の IP インターフェイスエントリを取得する。

[戻り値]
関数が成功すると戻り値は NO_ERROR となる。失敗した場合の戻り値は以下のいずれかのエラーコードとなる。
このドキュメントは省略されている。

[備考]
GetIpInterfaceTable 関数は Windows Vista 以降で定義される。ローカルシステム上の IP
インターフェイスを列挙し MIB_IPINTERFACE_TABLE で返す。Table にはエントリ数と
MIB_IPINTERFACE_ROW 配列が格納される。不要になったら FreeMibTable で解放すること。Family は
AF_INET または AF_INET6 で初期化する必要がある。アクセス時はアライメント用のパディングを想定すること。


%index
GetIpNetEntry2
ローカルコンピュータ上の近隣 IP アドレスエントリの情報を取得する。
%prm
Row
Row : [var] 近隣 IP アドレスエントリを表す MIB_IPNET_ROW2 へのポインタ。成功時、近隣 IP アドレスのプロパティで更新される。
%inst
ローカルコンピュータ上の近隣 IP アドレスエントリの情報を取得する。

[戻り値]
関数が成功すると戻り値は NO_ERROR となる。失敗した場合の戻り値は以下のいずれかのエラーコードとなる。
このドキュメントは省略されている。

[備考]
GetIpNetEntry2 関数は Windows Vista 以降で定義される。MIB_IPNET_ROW2
エントリを取得する。Address メンバは有効な近隣 IPv4 / IPv6 アドレスとファミリで初期化し、InterfaceLuid
または InterfaceIndex のいずれかも初期化する (InterfaceLuid
優先)。成功時、その他のプロパティが埋められる。GetIpNetTable2 で近隣 IP アドレスを列挙できる。


%index
GetIpNetTable
GetIpNetTable 関数は、IPv4 から物理アドレスへのマッピングテーブルを取得する。
%prm
IpNetTable, SizePointer, Order
IpNetTable : [var] IPv4 から物理アドレスへのマッピングテーブルを MIB_IPNETTABLE として受け取るバッファへのポインタ。
SizePointer : [var] 入力時は pIpNetTable が指すバッファのサイズ (バイト単位)。出力時はバッファが小さすぎる場合に必要サイズが設定される。
Order : [int] マッピングテーブルを IP アドレスで昇順ソートするかを示すブール値。TRUE ならソートされる。
%inst
GetIpNetTable 関数は、IPv4 から物理アドレスへのマッピングテーブルを取得する。

[戻り値]
関数が成功すると戻り値は NO_ERROR または ERROR_NO_DATA
となる。失敗したりデータが無い場合の戻り値は以下のいずれかのエラーコードとなる。
このドキュメントは省略されている。

[備考]
GetIpNetTable 関数はローカルシステムの IPv4 用 ARP エントリを IPv4
から物理アドレスへのマッピングテーブルから列挙し MIB_IPNETTABLE で返す。ARP エントリ数と MIB_IPNETROW
配列が格納される。アクセス時はアライメント用のパディングを想定すること。Windows Vista 以降では GetIpNetTable2
で IPv6 / IPv4 両方の近隣 IP アドレスを取得できる。


%index
GetIpNetTable2
GetIpNetTable2 関数は、ローカルコンピュータの IP 近隣テーブルを取得する。
%prm
Family, Table
Family : [int] 取得するアドレスファミリ。指定可能な値は Winsock2.h ヘッダファイルに列挙されている。AF_ アドレスファミリ定数と PF_ プロトコルファミリ定数は同じ値 (例: AF_INET と PF_INET) なのでどちらを使ってもよい。Windows Vista 以降向けの Windows SDK ではヘッダファイルの構成が変更され、この値は Ws2def.h ヘッダで定義される。Ws2def.h は Winsock2.h から自動的にインクルードされるため直接使用してはならない。現在サポートされる値は AF_INET、AF_INET6、AF_UNSPEC である。
Table : [var] ローカルコンピュータ上の近隣 IP アドレスエントリテーブルを格納する MIB_IPNET_TABLE2 へのポインタ。
%inst
GetIpNetTable2 関数は、ローカルコンピュータの IP 近隣テーブルを取得する。

[戻り値]
関数が成功すると戻り値は NO_ERROR または ERROR_NOT_FOUND
となる。失敗したりデータが無い場合の戻り値は以下のいずれかのエラーコードとなる。
このドキュメントは省略されている。

[備考]
GetIpNetTable2 関数は Windows Vista 以降で定義される。ローカルシステム上の近隣 IP アドレスを列挙し
MIB_IPNET_TABLE2 で返す。Table にはエントリ数と MIB_IPNET_ROW2 配列が格納される。不要になったら
FreeMibTable で解放すること。Family は AF_INET / AF_INET6 / AF_UNSPEC
のいずれか。アクセス時はアライメント用のパディングを想定すること。


%index
GetIpNetworkConnectionBandwidthEstimates
指定インターフェイスのネットワーク接続について帯域幅の履歴推定値を取得する。
%prm
InterfaceIndex, AddressFamily, BandwidthEstimates
InterfaceIndex : [int] ネットワークインターフェイスのローカルインデックス値。無効化・再有効化時などに変わることがあるため永続値として扱ってはならない。
AddressFamily : [int] アドレスファミリ。指定可能な値は Ws2def.h に列挙されている。AF_ と PF_ は同じ値。Ws2def.h は Winsock2.h から自動インクルードされるため直接使用してはならない。現在サポートされる値は IPv4 / IPv6 のインターネットアドレスファミリである AF_INET または AF_INET6。
BandwidthEstimates : [var] インターフェイスが現在接続している接続点について維持されている帯域幅の履歴推定値を受け取るバッファへのポインタ。
%inst
指定インターフェイスのネットワーク接続について帯域幅の履歴推定値を取得する。

[戻り値]
関数が成功すると戻り値は NO_ERROR となる。失敗した場合の戻り値は以下のいずれかのエラーコードとなる。
このドキュメントは省略されている。

[備考]
GetIpNetworkConnectionBandwidthEstimates 関数は Windows 8
以降で定義される。AddressFamily は AF_INET または AF_INET6、InterfaceIndex
は有効な値で初期化する必要がある (0
不可)。成功時、MIB_IP_NETWORK_CONNECTION_BANDWIDTH_ESTIMATES
構造体が埋められる。本関数は最初のホップでの利用可能帯域幅の履歴推定値を返し、アプリのパフォーマンスチューニングに利用する。実際の帯域幅は時間とともに変化しうるため、履歴値を下回る場合に対応できる実装にすること。TCP/IP
スタックが未集計の場合、推定値として 0 が返ることもあり、その場合は適切な既定値を使う。Netioapi.h は Iphlpapi.h
から自動インクルードされるため直接使用してはならない。


%index
GetIpPathEntry
ローカルコンピュータ上の IP パスエントリの情報を取得する。
%prm
Row
Row : [var] IP パスエントリを表す MIB_IPPATH_ROW へのポインタ。成功時、IP パスエントリのプロパティで更新される。
%inst
ローカルコンピュータ上の IP パスエントリの情報を取得する。

[戻り値]
関数が成功すると戻り値は NO_ERROR となる。失敗した場合の戻り値は以下のいずれかのエラーコードとなる。
このドキュメントは省略されている。

[備考]
GetIpPathEntry 関数は Windows Vista 以降で定義される。MIB_IPPATH_ROW
エントリを取得する。Destination は有効な IPv4 / IPv6 アドレスとファミリで初期化する。Source
のアドレスファミリは Destination と一致するか AF_UNSPEC を指定する。InterfaceLuid または
InterfaceIndex のいずれかも初期化する (InterfaceLuid
優先)。成功時、その他のプロパティが埋められる。GetIpPathTable で IP パスを列挙できる。


%index
GetIpPathTable
GetIpPathTable 関数は、ローカルコンピュータの IP パステーブルを取得する。
%prm
Family, Table
Family : [int] 取得するアドレスファミリ。指定可能な値は Winsock2.h ヘッダファイルに列挙されている。AF_ アドレスファミリ定数と PF_ プロトコルファミリ定数は同じ値 (例: AF_INET と PF_INET) なのでどちらを使ってもよい。Windows Vista 以降向けの Windows SDK ではヘッダファイルの構成が変更され、この値は Ws2def.h ヘッダで定義される。Ws2def.h は Winsock2.h から自動的にインクルードされるため直接使用してはならない。現在サポートされる値は AF_INET、AF_INET6、AF_UNSPEC である。
Table : [var] ローカルコンピュータ上の IP パスエントリテーブルを格納する MIB_IPPATH_TABLE へのポインタ。
%inst
GetIpPathTable 関数は、ローカルコンピュータの IP パステーブルを取得する。

[戻り値]
関数が成功すると戻り値は NO_ERROR となる。失敗した場合の戻り値は以下のいずれかのエラーコードとなる。
このドキュメントは省略されている。

[備考]
GetIpPathTable 関数は Windows Vista 以降で定義される。ローカルシステム上の IP パスエントリを列挙し
MIB_IPPATH_TABLE で返す。Table にはエントリ数と MIB_IPPATH_ROW 配列が格納される。不要になったら
FreeMibTable で解放すること。Family は AF_INET / AF_INET6 / AF_UNSPEC
のいずれか。アクセス時はアライメント用のパディングを想定すること。


%index
GetIpStatistics
GetIpStatistics 関数は、現在のコンピュータの IP 統計情報を取得する。
%prm
Statistics
Statistics : [var] ローカルコンピュータの IP 統計情報を受け取る MIB_IPSTATS 構造体へのポインタ。
%inst
GetIpStatistics 関数は、現在のコンピュータの IP 統計情報を取得する。

[戻り値]
関数が成功すると戻り値は NO_ERROR となる。失敗した場合の戻り値は以下のいずれかのエラーコードとなる。
このドキュメントは省略されている。

[備考]
GetIpStatistics 関数は現在のコンピュータの IPv4 統計情報を返す。Windows XP 以降では
GetIpStatisticsEx で IPv4 / IPv6 両方の IP 統計を取得できる。


%index
GetIpStatisticsEx
GetIpStatisticsEx 関数は、現在のコンピュータの IP (Internet Protocol) 統計情報を取得する。
%prm
Statistics, Family
Statistics : [var] ローカルコンピュータの IP 統計情報を受け取る MIB_IPSTATS 構造体へのポインタ。
Family : [int] 
%inst
GetIpStatisticsEx 関数は、現在のコンピュータの IP (Internet Protocol) 統計情報を取得する。

[戻り値]
関数が成功すると戻り値は NO_ERROR となる。失敗した場合の戻り値は以下のいずれかのエラーコードとなる。
このドキュメントは省略されている。

[備考]
GetIpStatisticsEx は IPv4 / IPv6 両方の IP 統計情報を取得できる。GetIpStatistics は
IPv4 のみ。


%index
GetJobCompartmentId
(no summary)
%prm
JobHandle
JobHandle : [intptr] 
%inst



%index
GetMulticastIpAddressEntry
ローカルコンピュータ上の既存マルチキャスト IP アドレスエントリの情報を取得する。
%prm
Row
Row : [var] マルチキャスト IP アドレスエントリを表す MIB_MULTICASTIPADDRESS_ROW へのポインタ。成功時、既存のマルチキャスト IP アドレスのプロパティで更新される。
%inst
ローカルコンピュータ上の既存マルチキャスト IP アドレスエントリの情報を取得する。

[戻り値]
関数が成功すると戻り値は NO_ERROR となる。失敗した場合の戻り値は以下のいずれかのエラーコードとなる。
このドキュメントは省略されている。

[備考]
GetMulticastIpAddressEntry 関数は Windows Vista 以降で定義される。既存の
MIB_MULTICASTIPADDRESS_ROW エントリを取得する。Address メンバは有効なマルチキャスト IPv4 /
IPv6 アドレスとファミリで初期化し、InterfaceLuid または InterfaceIndex のいずれかも初期化する
(InterfaceLuid 優先)。成功時、その他のプロパティが埋められる。GetMulticastIpAddressTable
で列挙可能。


%index
GetMulticastIpAddressTable
ローカルコンピュータのマルチキャスト IP アドレステーブルを取得する。
%prm
Family, Table
Family : [int] 取得するアドレスファミリ。指定可能な値は Winsock2.h ヘッダファイルに列挙されている。AF_ アドレスファミリ定数と PF_ プロトコルファミリ定数は同じ値 (例: AF_INET と PF_INET) なのでどちらを使ってもよい。Windows Vista 以降向けの Windows SDK ではヘッダファイルの構成が変更され、この値は Ws2def.h ヘッダで定義される。Ws2def.h は Winsock2.h から自動的にインクルードされるため直接使用してはならない。現在サポートされる値は AF_INET、AF_INET6、AF_UNSPEC である。
Table : [var] ローカルコンピュータ上のエニーキャスト IP アドレスエントリのテーブルを格納する MIB_MULTICASTIPADDRESS_TABLE へのポインタ。
%inst
ローカルコンピュータのマルチキャスト IP アドレステーブルを取得する。

[戻り値]
関数が成功すると戻り値は NO_ERROR となる。失敗した場合の戻り値は以下のいずれかのエラーコードとなる。
このドキュメントは省略されている。

[備考]
GetMulticastIpAddressTable 関数は Windows Vista
以降で定義される。ローカルシステム上のマルチキャスト IP アドレスを列挙し MIB_MULTICASTIPADDRESS_TABLE
で返す。Table にはエントリ数と MIB_MULTICASTIPADDRESS_ROW 配列が格納される。不要になったら
FreeMibTable で解放すること。Family は AF_INET / AF_INET6 / AF_UNSPEC
のいずれか。アクセス時はアライメント用のパディングを想定すること。


%index
GetNetworkConnectivityHint
アプリケーションやサービスが体験する可能性の高いネットワーク接続の集計レベルとコストを取得する。
%prm
ConnectivityHint
ConnectivityHint : [var] NL_NETWORK_CONNECTIVITY_HINT 型の値へのポインタ。集計された接続レベルとコストヒントが設定される。
%inst
アプリケーションやサービスが体験する可能性の高いネットワーク接続の集計レベルとコストを取得する。

[戻り値]
ユーザーモードでは成功時 NO_ERROR、失敗時は Win32 エラーコードを返す。カーネルモードでは成功時
STATUS_SUCCESS、失敗時は NTSTATUS エラーコードを返す。


%index
GetNetworkConnectivityHintForInterface
指定インターフェイスのネットワーク接続レベルとコストを取得する。
%prm
InterfaceIndex, ConnectivityHint
InterfaceIndex : [int] 接続情報を取得する対象インターフェイスのインデックスを示す NET_IFINDEX 型の値。
ConnectivityHint : [var] NL_NETWORK_CONNECTIVITY_HINT 型の値へのポインタ。指定インターフェイスの接続レベルとコストヒントが設定される。
%inst
指定インターフェイスのネットワーク接続レベルとコストを取得する。

[戻り値]
ユーザーモードでは成功時 NO_ERROR、失敗時は Win32 エラーコードを返す。カーネルモードでは成功時
STATUS_SUCCESS、失敗時は NTSTATUS エラーコードを返す。


%index
GetNetworkInformation
将来使用のために予約されている。使用してはならない。(GetNetworkInformation)
%prm
NetworkGuid, CompartmentId, SiteId, NetworkName, Length
NetworkGuid : [var] 予約済み。
CompartmentId : [var] 予約済み。
SiteId : [var] 予約済み。
NetworkName : [wstr] 予約済み。
Length : [int] 予約済み。
%inst
将来使用のために予約されている。使用してはならない。(GetNetworkInformation)


%index
GetNetworkParams
GetNetworkParams 関数は、ローカルコンピュータのネットワークパラメータを取得する。
%prm
pFixedInfo, pOutBufLen
pFixedInfo : [var] 成功時、ローカルコンピュータのネットワークパラメータを受け取る FIXED_INFO 構造体を格納するバッファへのポインタ。呼び出し元は事前にバッファを確保する必要がある。
pOutBufLen : [var] FIXED_INFO 構造体のサイズを指定する ULONG 変数へのポインタ。情報を格納するのに不十分な場合は必要サイズが書き込まれ ERROR_BUFFER_OVERFLOW が返される。
%inst
GetNetworkParams 関数は、ローカルコンピュータのネットワークパラメータを取得する。

[戻り値]
関数が成功すると ERROR_SUCCESS を返す。失敗した場合の戻り値は以下のいずれかのエラーコードとなる。
このドキュメントは省略されている。

[備考]
GetNetworkParams 関数は、ローカルコンピュータのネットワークパラメータを取得するのに使う。パラメータは
FIXED_INFO 構造体で返される。FIXED_INFO
用のメモリはアプリケーションが確保し、不要になったら解放する必要がある。Windows SDK には
FIXED_INFO_WIN2KSP1 構造体も定義されている。ターゲットが Windows 2000 SP1 以降の場合
(NTDDI_VERSION / _WIN32_WINNT / WINVER 条件) は FIXED_INFO_WIN2KSP1 が
FIXED_INFO 型として定義される。GetNetworkParams と FIXED_INFO 構造体は Windows 98
以降でサポートされる。ただし Windows 2000 SP1 より前をターゲットにビルドするには古い Platform SDK
を使う必要がある。


%index
GetNumberOfInterfaces
GetNumberOfInterfaces 関数は、ローカルコンピュータ上のインターフェイス数を取得する。
%prm
pdwNumIf
pdwNumIf : [var] ローカルコンピュータ上のインターフェイス数を受け取る DWORD 変数へのポインタ。
%inst
GetNumberOfInterfaces 関数は、ローカルコンピュータ上のインターフェイス数を取得する。

[戻り値]
関数が成功すると、戻り値は NO_ERROR である。関数が失敗した場合は、FormatMessage
を使って返されたエラーのメッセージ文字列を取得する。

[備考]
GetNumberOfInterfaces
関数は、ループバックインターフェイスを含む、ローカルコンピュータ上のインターフェイス数を返す。この数は GetAdaptersInfo
および GetInterfaceInfo が返すアダプタ数より 1
多い。これらの関数はループバックインターフェイスの情報を返さないためである。


%index
GetOwnerModuleFromPidAndInfo
(no summary)
%prm
ulPid, pInfo, Class, pBuffer, pdwSize
ulPid : [int] 
pInfo : [var] 
Class : [int] 
pBuffer : [intptr] 
pdwSize : [var] 
%inst



%index
GetOwnerModuleFromTcp6Entry
MIB テーブル行内の特定の IPv6 TCP エンドポイントに対してコンテキストバインドを発行したモジュールに関するデータを取得する。
%prm
pTcpEntry, Class, pBuffer, pdwSize
pTcpEntry : [var] 所有モジュールの取得に用いる IPv6 TCP エンドポイントエントリを含む MIB_TCP6ROW_OWNER_MODULE 構造体へのポインタ。
Class : [int] 所有モジュールに関して取得するデータの種別を示す TCPIP_OWNER_MODULE_INFO_CLASS 列挙値。TCPIP_OWNER_MODULE_INFO_CLASS 列挙体は Iprtrmib.h ヘッダファイルで定義される。このパラメータには TCPIP_OWNER_MODULE_INFO_BASIC を設定しなければならない。
pBuffer : [intptr] 所有モジュールのデータを格納した TCPIP_OWNER_MODULE_BASIC_INFO 構造体を含むバッファへのポインタ。このバッファに返されるデータの種別は Class パラメータの値で示される。Class に各値が設定されたとき、Buffer のデータには以下の構造体が用いられる。
pdwSize : [var] Buffer に返される構造体の推定サイズ (バイト単位)。この値が小さすぎる場合、関数は ERROR_INSUFFICIENT_BUFFER を返し、このフィールドには正しい構造体サイズが格納される。
%inst
MIB テーブル行内の特定の IPv6 TCP エンドポイントに対してコンテキストバインドを発行したモジュールに関するデータを取得する。

[戻り値]
関数呼び出しが成功すると、値 NO_ERROR が返される。関数が失敗した場合、戻り値は以下のエラーコードのいずれかである。
このドキュメントは省略されている。

[備考]
Buffer パラメータには、特定のデータへのポインタ (例えば所有モジュール名とパスを含むゼロ終端文字列へのポインタ)
を持つ構造体だけでなく、実際のデータそのもの (すなわち名前とパス文字列)
が格納される。したがってバッファサイズを計算する際は、構造体自体と、そのメンバが指すデータの双方に十分な領域を確保すること。TCP
テーブルエントリを所有モジュールに解決することはベストプラクティスであるが、TCPIP_OWNER_MODULE_BASIC_INFO
に返される所有モジュール名はプロセス名 ("svchost.exe" など)、サービス名 ("RPC" など)、コンポーネント名
("timer.dll" など) のいずれかになる場合がある。Windows Vista
以降では、TCPIP_OWNER_MODULE_BASIC_INFO の pModuleName / pModulePath メンバが一部
TCP 接続で空文字列を指すことがある。Windows システムフォルダ (既定では C:\Windows\System32)
に配置されたアプリケーションが開始した TCP 接続は保護されており、Administrators
グループのメンバでないユーザが呼び出した場合は関数自体は成功するものの、保護されたアプリケーションが開始した接続の pModuleName
/ pModulePath は空文字列を指すメモリとなる。また、UAC の影響により、組み込み Administrator 以外の
Administrators グループメンバが実行する場合、マニフェストで requestedExecutionLevel が
requireAdministrator に設定されていないと、これらのメンバは空文字列を返す。マニフェストがない場合は、RunAs
administrator で実行された拡張シェルから起動する必要がある。


%index
GetOwnerModuleFromTcpEntry
MIB テーブル行内の特定の IPv4 TCP エンドポイントに対してコンテキストバインドを発行したモジュールに関するデータを取得する。
%prm
pTcpEntry, Class, pBuffer, pdwSize
pTcpEntry : [var] 所有モジュールの取得に用いる IPv4 TCP エンドポイントエントリを含む MIB_TCPROW_OWNER_MODULE 構造体へのポインタ。
Class : [int] 所有モジュールに関して取得するデータの種別を示す TCPIP_OWNER_MODULE_INFO_CLASS 列挙値。TCPIP_OWNER_MODULE_INFO_CLASS 列挙体は Iprtrmib.h ヘッダファイルで定義される。このパラメータには TCPIP_OWNER_MODULE_INFO_BASIC を設定しなければならない。
pBuffer : [intptr] 所有モジュールのデータを格納した TCPIP_OWNER_MODULE_BASIC_INFO 構造体を含むバッファへのポインタ。このバッファに返されるデータの種別は Class パラメータの値で示される。Class に各値が設定されたとき、Buffer のデータには以下の構造体が用いられる。
pdwSize : [var] Buffer に返される構造体の推定サイズ (バイト単位)。この値が小さすぎる場合、関数は ERROR_INSUFFICIENT_BUFFER を返し、このフィールドにはバッファに必要な正しいサイズが格納される。必要なサイズは対応する構造体のサイズに、構造体が指すデータ (例: 名前・パス文字列) の長さを加えたものである。
%inst
MIB テーブル行内の特定の IPv4 TCP エンドポイントに対してコンテキストバインドを発行したモジュールに関するデータを取得する。

[戻り値]
関数呼び出しが成功すると、値 NO_ERROR が返される。関数が失敗した場合、戻り値は以下のエラーコードのいずれかである。
このドキュメントは省略されている。

[備考]
Buffer パラメータには構造体本体だけでなく、その構造体メンバが指す実データ (名前・パス文字列)
も含まれる。そのためバッファサイズを計算する際は、構造体本体とポイントされるデータの両方に十分な領域を確保する必要がある。TCP
テーブルエントリの所有モジュール解決はベストプラクティスだが、TCPIP_OWNER_MODULE_BASIC_INFO
が返す所有モジュール名はプロセス名 ("svchost.exe")、サービス名 ("RPC")、コンポーネント名
("timer.dll") のいずれかになる場合がある。Windows Vista 以降では、保護されたアプリケーション
(C:\Windows\System32 配下など) が開始した TCP 接続の pModuleName / pModulePath
は、Administrators 以外のユーザから呼び出すと空文字列になる。また UAC のため、組み込み Administrator
以外の Administrators グループメンバからの呼び出しでは、requestedExecutionLevel が
requireAdministrator に設定されたマニフェストまたは RunAs administrator 実行が必要である。


%index
GetOwnerModuleFromUdp6Entry
MIB テーブル行内の特定の IPv6 UDP エンドポイントに対してコンテキストバインドを発行したモジュールに関するデータを取得する。
%prm
pUdpEntry, Class, pBuffer, pdwSize
pUdpEntry : [var] 所有モジュールの取得に用いる IPv6 UDP エンドポイントエントリを含む MIB_UDP6ROW_OWNER_MODULE 構造体へのポインタ。
Class : [int] 所有モジュールに関して取得するデータの種別を示す TCPIP_OWNER_MODULE_INFO_CLASS 列挙値。
pBuffer : [intptr] 所有モジュールのデータを格納した TCPIP_OWNER_MODULE_BASIC_INFO 構造体を含むバッファ。Buffer に返されるデータの種別は Class パラメータで示される。Class に各値が設定されたとき、Buffer のデータには以下の構造体が用いられる。
pdwSize : [var] Buffer に返される構造体の推定サイズ (バイト単位)。この値が小さすぎる場合、関数は ERROR_INSUFFICIENT_BUFFER を返し、このフィールドには正しい構造体サイズが格納される。
%inst
MIB テーブル行内の特定の IPv6 UDP エンドポイントに対してコンテキストバインドを発行したモジュールに関するデータを取得する。

[戻り値]
呼び出しが成功すると、値 NO_ERROR が返される。それ以外の場合は以下のエラーが返される。
このドキュメントは省略されている。

[備考]
Buffer
パラメータには構造体本体と、そのメンバが指す名前・パス文字列などの実データの両方が含まれる。そのためバッファサイズ計算時は、構造体と参照データの両方を収められるよう十分な領域を確保すること。UDP
テーブルエントリの所有モジュール解決はベストプラクティスだが、TCPIP_OWNER_MODULE_BASIC_INFO
が返す所有モジュール名は "svchost.exe" などのプロセス名、"RPC" などのサービス名、"timer.dll"
などのコンポーネント名になることがある。Windows Vista 以降では UAC により、組み込み Administrator 以外の
Administrators グループメンバが実行すると、マニフェストの requestedExecutionLevel =
requireAdministrator または RunAs administrator
実行でない限り、これらのメンバへのアクセスは空文字列となる。


%index
GetOwnerModuleFromUdpEntry
MIB テーブル行内の特定の IPv4 UDP エンドポイントに対してコンテキストバインドを発行したモジュールに関するデータを取得する。
%prm
pUdpEntry, Class, pBuffer, pdwSize
pUdpEntry : [var] 所有モジュールの取得に用いる IPv4 UDP エンドポイントエントリを含む MIB_UDPROW_OWNER_MODULE 構造体へのポインタ。
Class : [int] 所有モジュールに関して取得するデータの種別を示す TCPIP_OWNER_MODULE_INFO_CLASS 列挙値。
pBuffer : [intptr] 所有モジュールのデータを格納した TCPIP_OWNER_MODULE_BASIC_INFO 構造体を含むバッファ。Buffer に返されるデータの種別は Class パラメータで示される。Class に各値が設定されたとき、Buffer のデータには以下の構造体が用いられる。
pdwSize : [var] Buffer に返される構造体の推定サイズ (バイト単位)。この値が小さすぎる場合、関数は ERROR_INSUFFICIENT_BUFFER を返し、このフィールドには正しい構造体サイズが格納される。
%inst
MIB テーブル行内の特定の IPv4 UDP エンドポイントに対してコンテキストバインドを発行したモジュールに関するデータを取得する。

[戻り値]
呼び出しが成功すると、値 NO_ERROR が返される。それ以外の場合は以下のエラーが返される。
このドキュメントは省略されている。

[備考]
Buffer
パラメータには構造体本体と、そのメンバが指す名前・パス文字列などの実データの両方が含まれる。そのためバッファサイズ計算時は、構造体と参照データの両方を収められるよう十分な領域を確保すること。UDP
テーブルエントリの所有モジュール解決はベストプラクティスだが、TCPIP_OWNER_MODULE_BASIC_INFO
が返す所有モジュール名は "svchost.exe" などのプロセス名、"RPC" などのサービス名、"timer.dll"
などのコンポーネント名になることがある。Windows Vista 以降では UAC により、組み込み Administrator 以外の
Administrators グループメンバが実行する場合、マニフェストの requestedExecutionLevel =
requireAdministrator または RunAs administrator
実行でない限り、これらのメンバへのアクセスは空文字列となる。


%index
GetPerAdapterInfo
GetPerAdapterInfo 関数は、指定インターフェイスに対応するアダプタの情報を取得する。
%prm
IfIndex, pPerAdapterInfo, pOutBufLen
IfIndex : [int] インターフェイスのインデックス。GetPerAdapterInfo 関数はこのインターフェイスに対応するアダプタの情報を取得する。
pPerAdapterInfo : [var] アダプタに関する情報を受け取る IP_PER_ADAPTER_INFO 構造体へのポインタ。
pOutBufLen : [var] IP_PER_ADAPTER_INFO 構造体のサイズを指定する ULONG 変数へのポインタ。サイズが情報を保持するのに不足している場合、GetPerAdapterInfo は必要なサイズをこの変数に格納し、ERROR_BUFFER_OVERFLOW エラーコードを返す。
%inst
GetPerAdapterInfo 関数は、指定インターフェイスに対応するアダプタの情報を取得する。

[戻り値]
関数が成功すると、戻り値は ERROR_SUCCESS である。関数が失敗した場合、戻り値は以下のエラーコードのいずれかである。
このドキュメントは省略されている。

[備考]
アダプタのインデックスはアダプタが無効化されて再度有効化されたときなどに変更されることがあり、永続的と見なしてはならない。


%index
GetPerTcp6ConnectionEStats
IPv6 TCP 接続の拡張統計情報を取得する。
%prm
Row, EstatsType, Rw, RwVersion, RwSize, Ros, RosVersion, RosSize, Rod, RodVersion, RodSize
Row : [var] IPv6 TCP 接続の MIB_TCP6ROW 構造体へのポインタ。
EstatsType : [int] 要求する TCP 拡張統計情報の種別。このパラメータは、呼び出しが成功したとき Rw、Rod、Ros の各パラメータに返される情報のデータと形式を決定する。Tcpestats.h ヘッダで定義される TCP_ESTATS_TYPE 列挙型の値のいずれかを指定できる。
Rw : [var] 読み取り/書き込み情報を受け取るバッファへのポインタ。必要がない場合は NULL を指定できる。
RwVersion : [int] 要求する読み取り/書き込み情報のバージョン。現在サポートされる値は 0 のみ。
RwSize : [int] Rw パラメータが指すバッファのサイズ (バイト単位)。
Ros : [var] 読み取り専用静的情報を受け取るバッファへのポインタ。必要がない場合は NULL を指定できる。
RosVersion : [int] 要求する読み取り専用静的情報のバージョン。現在サポートされる値は 0 のみ。
RosSize : [int] Ros パラメータが指すバッファのサイズ (バイト単位)。
Rod : [var] 読み取り専用動的情報を受け取るバッファへのポインタ。TCP 接続の読み取り専用動的情報を取得する必要がない場合は NULL を指定できる。
RodVersion : [int] 要求する読み取り専用動的情報のバージョン。現在サポートされる値は 0 のみ。
RodSize : [int] Rod パラメータが指すバッファのサイズ (バイト単位)。
%inst
IPv6 TCP 接続の拡張統計情報を取得する。

[戻り値]
関数が成功すると、戻り値は NO_ERROR である。失敗した場合は以下のエラーコードのいずれかが返される。
このドキュメントは省略されている。

[備考]
GetPerTcp6ConnectionEStats 関数は Windows Vista 以降で定義される。TCP
によりネットワークおよびアプリケーション両面のパフォーマンス問題を診断するための関数で、ネットワークベースアプリケーションの性能劣化時に、送信側・受信側・ネットワークのどこがボトルネックかを
TCP が判定し、ネットワークの場合は具体的な情報を提供できる。
Row パラメータに渡された IPv6 TCP 接続に対する拡張統計情報を取得する。取得する統計種別は EstatsType
で指定する。TcpConnectionEstatsSynOpts を除くすべての TCP_ESTATS_TYPE 値については、あらかじめ
SetPerTcp6ConnectionEStats で拡張統計を有効化しておく必要がある。IPv6 TCP 接続テーブルは
GetTcp6Table で取得でき、MIB_TCP6ROW の配列を含む MIB_TCP6TABLE 構造体が返される。Row
には既存の IPv6 TCP 接続エントリを渡す必要がある。現在サポートされる TCP 接続統計のバージョンは 0
のみで、RwVersion/RosVersion/RodVersion はすべて 0 に設定する。IPv4 接続の拡張 TCP
統計については GetPerTcpConnectionEStats / SetPerTcpConnectionEStats
を参照。SetPerTcp6ConnectionEStats は Administrators グループメンバのみが呼び出せ、それ以外では
ERROR_ACCESS_DENIED が返る。UAC の影響も受け、組み込み Administrator 以外のメンバからは
requestedExecutionLevel = requireAdministrator
のマニフェストが必要となる。呼び出し元は、返された Rw 構造体の EnableCollection フィールドを確認し、TRUE
でなければ Ros / Rod のデータを無視するべきである。EnableCollection が FALSE の場合、Ros / Rod
の内容は未定義である。例えば SetPerTcp6ConnectionEStats の呼び出しが失敗していた場合、以後の
GetPerTcp6ConnectionEStats は拡張統計ではなく無意味なランダムデータを返すことがある。


%index
GetPerTcpConnectionEStats
IPv4 TCP 接続の拡張統計情報を取得する。
%prm
Row, EstatsType, Rw, RwVersion, RwSize, Ros, RosVersion, RosSize, Rod, RodVersion, RodSize
Row : [var] IPv4 TCP 接続の MIB_TCPROW 構造体へのポインタ。
EstatsType : [int] 要求する TCP 拡張統計情報の種別。このパラメータは、呼び出しが成功したとき Rw、Rod、Ros の各パラメータに返される情報のデータと形式を決定する。Tcpestats.h ヘッダで定義される TCP_ESTATS_TYPE 列挙型の値のいずれかを指定できる。
Rw : [var] 読み取り/書き込み情報を受け取るバッファへのポインタ。必要がない場合は NULL を指定できる。
RwVersion : [int] 要求する読み取り/書き込み情報のバージョン。現在サポートされる値は 0 のみ。
RwSize : [int] Rw パラメータが指すバッファのサイズ (バイト単位)。
Ros : [var] 読み取り専用静的情報を受け取るバッファへのポインタ。必要がない場合は NULL を指定できる。
RosVersion : [int] 要求する読み取り専用静的情報のバージョン。現在サポートされる値は 0 のみ。
RosSize : [int] Ros パラメータが指すバッファのサイズ (バイト単位)。
Rod : [var] 読み取り専用動的情報を受け取るバッファへのポインタ。TCP 接続の読み取り専用動的情報を取得する必要がない場合は NULL を指定できる。
RodVersion : [int] 要求する読み取り専用動的情報のバージョン。現在サポートされる値は 0 のみ。
RodSize : [int] Rod パラメータが指すバッファのサイズ (バイト単位)。
%inst
IPv4 TCP 接続の拡張統計情報を取得する。

[戻り値]
関数が成功すると、戻り値は NO_ERROR である。失敗した場合は以下のエラーコードのいずれかが返される。
このドキュメントは省略されている。

[備考]
GetPerTcpConnectionEStats 関数は Windows Vista 以降で定義される。TCP
によりネットワークおよびアプリケーション両面のパフォーマンス問題を診断するための関数である。
Row に渡された IPv4 TCP 接続の拡張統計情報を取得する。取得する統計種別は EstatsType
で指定する。TcpConnectionEstatsSynOpts を除くすべての TCP_ESTATS_TYPE 値については、あらかじめ
SetPerTcpConnectionEStats で拡張統計を有効化しておく必要がある。IPv4 TCP 接続テーブルは
GetTcpTable で取得でき、MIB_TCPROW の配列を含む MIB_TCPTABLE 構造体が返される。Row には既存の
IPv4 TCP 接続エントリを渡す必要がある。現在サポートされる TCP 接続統計のバージョンは 0 のみで、RwVersion /
RosVersion / RodVersion は 0 に設定する。IPv6 の場合は
GetPerTcp6ConnectionEStats / SetPerTcp6ConnectionEStats
を参照。SetPerTcpConnectionEStats は Administrators グループメンバのみ呼び出せ、それ以外では
ERROR_ACCESS_DENIED が返る。UAC のため、組み込み Administrator 以外のメンバからは
requestedExecutionLevel = requireAdministrator
のマニフェストが必要となる。呼び出し元は返された Rw 構造体の EnableCollection が TRUE でなければ Ros /
Rod のデータを無視するべきで、FALSE の場合 Ros / Rod の内容は未定義である。


%index
GetRTTAndHopCount
GetRTTAndHopCount 関数は、指定した宛先までの RTT (ラウンドトリップ時間) とホップ数を判定する。
%prm
DestIpAddress, HopCount, MaxHops, RTT
DestIpAddress : [int] RTT とホップ数を判定する宛先の IP アドレス。IPAddr 構造体の形式で指定する。
HopCount : [var] ULONG 変数へのポインタ。DestIpAddress で指定された宛先までのホップ数を受け取る。
MaxHops : [int] 宛先を探索する際の最大ホップ数。宛先までのホップ数がこれを超えると、関数は探索を中断し FALSE を返す。
RTT : [var] DestIpAddress で指定された宛先までのラウンドトリップ時間 (ミリ秒単位)。
%inst
GetRTTAndHopCount 関数は、指定した宛先までの RTT (ラウンドトリップ時間) とホップ数を判定する。

[戻り値]
関数が成功すると、戻り値は TRUE である。失敗した場合は FALSE を返す。GetLastError
を呼び出してエラーコードを取得できる。

[備考]
IPAddr データ型については Windows データ型を参照。IP アドレスをドット区切り 10 進表記と IPAddr
形式の間で変換するには inet_addr / inet_ntoa を使用する。


%index
GetSessionCompartmentId
将来の使用のため予約されている。この関数は使用しないこと。(GetSessionCompartmentId)
%prm
SessionId
SessionId : [int] 予約済み。
%inst
将来の使用のため予約されている。この関数は使用しないこと。(GetSessionCompartmentId)


%index
GetTcp6Table
IPv6 の TCP 接続テーブルを取得する。(GetTcp6Table)
%prm
TcpTable, SizePointer, Order
TcpTable : [var] IPv6 の TCP 接続テーブルを MIB_TCP6TABLE 構造体として受け取るバッファへのポインタ。
SizePointer : [var] 入力時には、TcpTable が指すバッファのサイズをバイト単位で指定する。出力時、バッファが不足している場合、関数はこのパラメータに必要なバッファサイズをバイト単位で設定する。
Order : [int] TCP 接続テーブルをソートするかどうかを指定する Boolean 値。TRUE の場合、最も小さいローカル IP アドレスから昇順でソートされる。FALSE の場合、取得順に並ぶ。TCP エンドポイントの順序付けでは以下の値が (列挙順に) 比較される:
%inst
IPv6 の TCP 接続テーブルを取得する。(GetTcp6Table)

[戻り値]
関数が成功すると、戻り値は NO_ERROR である。失敗した場合は以下のエラーコードのいずれかが返される。
このドキュメントは省略されている。

[備考]
GetTcp6Table 関数は Windows Vista 以降で定義される。


%index
GetTcp6Table2
IPv6 の TCP 接続テーブルを取得する。(GetTcp6Table2)
%prm
TcpTable, SizePointer, Order
TcpTable : [var] IPv6 の TCP 接続テーブルを MIB_TCP6TABLE2 構造体として受け取るバッファへのポインタ。
SizePointer : [var] 入力時には、TcpTable が指すバッファのサイズを指定する。
Order : [int] TCP 接続テーブルをソートするかどうかを指定する値。TRUE の場合、最も小さいローカル IP アドレスから昇順でソートされる。FALSE の場合、取得順に並ぶ。TCP エンドポイントの順序付けでは以下の値が (列挙順に) 比較される:
%inst
IPv6 の TCP 接続テーブルを取得する。(GetTcp6Table2)

[戻り値]
関数が成功すると、戻り値は NO_ERROR である。失敗した場合は以下のエラーコードのいずれかが返される。
このドキュメントは省略されている。

[備考]
GetTcp6Table2 関数は Windows Vista 以降で定義される。GetTcp6Table の拡張版で、TCP 接続の
TCP オフロード状態に関する情報も取得する。


%index
GetTcpStatistics
GetTcpStatistics 関数は、ローカルコンピュータの TCP 統計を取得する。
%prm
Statistics
Statistics : [var] ローカルコンピュータの TCP 統計を受け取る MIB_TCPSTATS 構造体へのポインタ。
%inst
GetTcpStatistics 関数は、ローカルコンピュータの TCP 統計を取得する。

[戻り値]
関数が成功すると、戻り値は NO_ERROR である。失敗した場合は以下のエラーコードのいずれかが返される。
このドキュメントは省略されている。

[備考]
GetTcpStatistics 関数は、現在のコンピュータの IPv4 向け TCP 統計を返す。Windows XP
以降では、GetTcpStatisticsEx を使って IPv4 / IPv6 どちらの TCP 統計も取得できる。


%index
GetTcpStatisticsEx
GetTcpStatisticsEx 関数は、現在のコンピュータの TCP (Transmission Control Protocol) 統計を取得する。
%prm
Statistics, Family
Statistics : [var] ローカルコンピュータの TCP 統計を受け取る MIB_TCPSTATS 構造体へのポインタ。
Family : [int] 
%inst
GetTcpStatisticsEx 関数は、現在のコンピュータの TCP (Transmission Control Protocol)
統計を取得する。

[戻り値]
関数が成功すると、戻り値は NO_ERROR である。失敗した場合は以下のエラーコードのいずれかが返される。
このドキュメントは省略されている。


%index
GetTcpStatisticsEx2
GetTcpStatisticsEx2 関数は、現在のコンピュータの TCP (Transmission Control Protocol) 統計を取得する。
%prm
Statistics, Family
Statistics : [var] ローカルコンピュータの TCP 統計を受け取る MIB_TCPSTATS2 構造体へのポインタ。
Family : [int] 
%inst
GetTcpStatisticsEx2 関数は、現在のコンピュータの TCP (Transmission Control
Protocol) 統計を取得する。

[戻り値]
関数が成功すると、戻り値は NO_ERROR である。失敗した場合は以下のエラーコードのいずれかが返される。
このドキュメントは省略されている。


%index
GetTcpTable
IPv4 の TCP 接続テーブルを取得する。(GetTcpTable)
%prm
TcpTable, SizePointer, Order
TcpTable : [var] TCP 接続テーブルを MIB_TCPTABLE 構造体として受け取るバッファへのポインタ。
SizePointer : [var] 入力時には、pTcpTable が指すバッファのサイズをバイト単位で指定する。出力時、バッファが不足している場合、関数はこのパラメータに必要なバッファサイズをバイト単位で設定する。Windows Vista 以降向けの Windows SDK では、このパラメータのデータ型は PDWORD と等価な PULONG に変更されている。
Order : [int] TCP 接続テーブルをソートするかどうかを指定する Boolean 値。TRUE の場合、次の順でソートされる:
%inst
IPv4 の TCP 接続テーブルを取得する。(GetTcpTable)

[戻り値]
関数が成功すると、戻り値は NO_ERROR である。失敗した場合は以下のエラーコードのいずれかが返される。
このドキュメントは省略されている。

[備考]
Windows Vista 以降向けの Windows SDK では、GetTcpTable 関数の戻り値のデータ型は DWORD
と等価な ULONG に変更されている。


%index
GetTcpTable2
IPv4 の TCP 接続テーブルを取得する。(GetTcpTable2)
%prm
TcpTable, SizePointer, Order
TcpTable : [var] TCP 接続テーブルを MIB_TCPTABLE2 構造体として受け取るバッファへのポインタ。
SizePointer : [var] 入力時には、TcpTable が指すバッファのサイズを指定する。
Order : [int] TCP 接続テーブルをソートするかどうかを指定する値。TRUE の場合、次の順でソートされる:
%inst
IPv4 の TCP 接続テーブルを取得する。(GetTcpTable2)

[戻り値]
関数が成功すると、戻り値は NO_ERROR である。失敗した場合は以下のエラーコードのいずれかが返される。
このドキュメントは省略されている。

[備考]
GetTcpTable2 関数は Windows Vista 以降で定義される。GetTcpTable の拡張版であり、TCP 接続の
TCP オフロード状態に関する情報も取得する。


%index
GetTeredoPort
ローカルコンピュータ上で Teredo クライアントが使用している動的 UDP ポート番号を取得する。
%prm
Port
Port : [var] UDP ポート番号へのポインタ。正常終了時、このパラメータには Teredo クライアントが使用するポート番号が格納される。
%inst
ローカルコンピュータ上で Teredo クライアントが使用している動的 UDP ポート番号を取得する。

[戻り値]
関数が成功すると、戻り値は NO_ERROR である。失敗した場合は以下のエラーコードのいずれかが返される。
このドキュメントは省略されている。

[備考]
GetTeredoPort 関数は Windows Vista 以降で定義される。Teredo クライアントが Teredo
サービスポートに用いている現在の UDP ポート番号を取得する。Teredo ポートは動的であり、ローカルコンピュータで Teredo
クライアントが再起動されるたびに変更される可能性がある。NotifyTeredoPortChange 関数を呼び出すことで、Teredo
サービスポートが変更されたときに通知を受けるよう登録できる。なお Teredo クライアントは、RFC 4380
で定義されているマルチキャスト IPv4 アドレス 224.0.0.253 上で送信されるマルチキャストトラフィックの待ち受け用に、静的
UDP ポート 3544 も使用する。GetTeredoPort は主にファイアウォールアプリケーションが Teredo
トラフィックの送受信を許可する例外を設定するために使用される。


%index
GetUdp6Table
IPv6 の UDP (User Datagram Protocol) リスナーテーブルを取得する。
%prm
Udp6Table, SizePointer, Order
Udp6Table : [var] IPv6 UDP リスナーテーブルを MIB_UDP6TABLE 構造体として受け取るバッファへのポインタ。
SizePointer : [var] 入力時には、Udp6Table が指すバッファのサイズをバイト単位で指定する。
Order : [int] 返される UDP リスナーテーブルをソートするかどうかを指定する Boolean 値。TRUE の場合、次の順でソートされる:
%inst
IPv6 の UDP (User Datagram Protocol) リスナーテーブルを取得する。

[戻り値]
関数が成功すると、戻り値は NO_ERROR である。失敗した場合は以下のエラーコードのいずれかが返される。
このドキュメントは省略されている。

[備考]
GetUdp6Table 関数は Windows Vista 以降で定義される。


%index
GetUdpStatistics
GetUdpStatistics 関数は、ローカルコンピュータの UDP (User Datagram Protocol) 統計を取得する。
%prm
Stats
Stats : [var] ローカルコンピュータの UDP 統計を受け取る MIB_UDPSTATS 構造体へのポインタ。
%inst
GetUdpStatistics 関数は、ローカルコンピュータの UDP (User Datagram Protocol)
統計を取得する。

[戻り値]
関数が成功すると、戻り値は NO_ERROR である。失敗した場合は FormatMessage
を使って返されたエラーのメッセージ文字列を取得する。

[備考]
Windows Server 2003 / Windows XP: IPv6 プロトコル向けの UDP 統計を取得するには
GetUdpStatisticsEx を使用すること。


%index
GetUdpStatisticsEx
GetUdpStatisticsEx 関数は、現在のコンピュータの UDP 統計を取得する。
%prm
Statistics, Family
Statistics : [var] ローカルコンピュータの UDP 統計を受け取る MIB_UDPSTATS 構造体へのポインタ。
Family : [int] 
%inst
GetUdpStatisticsEx 関数は、現在のコンピュータの UDP 統計を取得する。

[戻り値]
関数が成功すると、戻り値は NO_ERROR である。失敗した場合は以下のエラーコードのいずれかが返される。
このドキュメントは省略されている。


%index
GetUdpStatisticsEx2
GetUdpStatisticsEx2 関数は、現在のコンピュータの UDP 統計を取得する。
%prm
Statistics, Family
Statistics : [var] ローカルコンピュータの UDP 統計を受け取る MIB_UDPSTATS2 構造体へのポインタ。
Family : [int] 
%inst
GetUdpStatisticsEx2 関数は、現在のコンピュータの UDP 統計を取得する。

[戻り値]
関数が成功すると、戻り値は NO_ERROR である。失敗した場合は以下のエラーコードのいずれかが返される。
このドキュメントは省略されている。


%index
GetUdpTable
IPv4 の UDP (User Datagram Protocol) リスナーテーブルを取得する。
%prm
UdpTable, SizePointer, Order
UdpTable : [var] IPv4 UDP リスナーテーブルを MIB_UDPTABLE 構造体として受け取るバッファへのポインタ。
SizePointer : [var] 入力時には、UdpTable が指すバッファのサイズをバイト単位で指定する。
Order : [int] 返される UDP リスナーテーブルをソートするかどうかを指定する Boolean 値。TRUE の場合、次の順でソートされる:
%inst
IPv4 の UDP (User Datagram Protocol) リスナーテーブルを取得する。

[戻り値]
関数が成功すると、戻り値は NO_ERROR である。失敗した場合は以下のエラーコードのいずれかが返される。
このドキュメントは省略されている。

[備考]
Windows Vista 以降向けの Windows SDK では、GetUdpTable 関数の戻り値のデータ型は DWORD
と等価な ULONG に変更されている。


%index
GetUniDirectionalAdapterInfo
GetUniDirectionalAdapterInfo 関数は、ローカルコンピュータにインストールされている単方向アダプタに関する情報を取得する。単方向アダプタとは、データグラムを受信できるが送信はできないアダプタである。
%prm
pIPIfInfo, dwOutBufLen
pIPIfInfo : [var] ローカルコンピュータにインストールされている単方向アダプタに関する情報を受け取る IP_UNIDIRECTIONAL_ADAPTER_ADDRESS 構造体へのポインタ。
dwOutBufLen : [var] pIPIfInfo が指す構造体のサイズを受け取る ULONG 変数へのポインタ。
%inst
GetUniDirectionalAdapterInfo
関数は、ローカルコンピュータにインストールされている単方向アダプタに関する情報を取得する。単方向アダプタとは、データグラムを受信できるが送信はできないアダプタである。

[戻り値]
関数が成功すると、戻り値は NO_ERROR である。失敗した場合は FormatMessage
を使って返されたエラーのメッセージ文字列を取得する。


%index
GetUnicastIpAddressEntry
ローカルコンピュータ上の既存のユニキャスト IP アドレスエントリの情報を取得する。
%prm
Row
Row : [var] ユニキャスト IP アドレスエントリの MIB_UNICASTIPADDRESS_ROW 構造体エントリへのポインタ。正常終了時、この構造体は既存のユニキャスト IP アドレスのプロパティで更新される。
%inst
ローカルコンピュータ上の既存のユニキャスト IP アドレスエントリの情報を取得する。

[戻り値]
関数が成功すると、戻り値は NO_ERROR である。失敗した場合は以下のエラーコードのいずれかが返される。
このドキュメントは省略されている。

[備考]
GetUnicastIpAddressEntry 関数は Windows Vista 以降で定義される。通常は、変更対象の既存の
MIB_UNICASTIPADDRESS_ROW を取得するために使用される。アプリケーションは変更したい
MIB_UNICASTIPADDRESS_ROW のメンバを書き換え、続いて SetUnicastIpAddressEntry
関数を呼び出す。入力時、Row が指す MIB_UNICASTIPADDRESS_ROW 構造体の Address
メンバは有効なユニキャスト IPv4 または IPv6 アドレスで初期化しなければならない。Address 内の
SOCKADDR_INET 構造体の si_family メンバは AF_INET または AF_INET6 に初期化し、対応する
Ipv4 または Ipv6 メンバを有効なユニキャスト IP アドレスに設定する。さらに Row の InterfaceLuid または
InterfaceIndex のいずれかを初期化する必要がある。フィールドは列挙順に使用される。すなわち InterfaceLuid
が指定されていればそれで、0 ならば InterfaceIndex
でインターフェイスを決定する。呼び出しが成功すると、GetUnicastIpAddressEntry はユニキャスト IP
アドレスの他のプロパティを取得し Row の MIB_UNICASTIPADDRESS_ROW
を埋める。ローカルコンピュータ上のユニキャスト IP アドレスエントリの列挙には GetUnicastIpAddressTable
を使用できる。


%index
GetUnicastIpAddressTable
ローカルコンピュータ上のユニキャスト IP アドレステーブルを取得する。
%prm
Family, Table
Family : [int] 取得するアドレスファミリ。アドレスファミリの値は Winsock2.h ヘッダで定義される。AF_ と PF_ の定数は等価 (例: AF_INET と PF_INET) であり、どちらを使っても構わない。Windows Vista 以降向けの Windows SDK ではヘッダ構成が変更され、これらの値は Ws2def.h で定義される。Ws2def.h は Winsock2.h から自動的にインクルードされるので、直接インクルードしてはならない。現在サポートされる値は AF_INET、AF_INET6、AF_UNSPEC である。
Table : [var] ローカルコンピュータ上のユニキャスト IP アドレスエントリのテーブルを格納する MIB_UNICASTIPADDRESS_TABLE 構造体へのポインタ。
%inst
ローカルコンピュータ上のユニキャスト IP アドレステーブルを取得する。

[戻り値]
関数が成功すると、戻り値は NO_ERROR である。失敗した場合は以下のエラーコードのいずれかが返される。
このドキュメントは省略されている。

[備考]
GetUnicastIpAddressTable 関数は Windows Vista 以降で定義される。ローカルシステム上のユニキャスト
IP アドレスを列挙し、MIB_UNICASTIPADDRESS_TABLE 構造体で返す。この構造体はエントリ数と、各ユニキャスト IP
アドレスエントリに対応する MIB_UNICASTIPADDRESS_ROW の配列を含む。返された構造体が不要になった場合は
FreeMibTable でメモリを解放する。Family は AF_INET、AF_INET6、AF_UNSPEC
のいずれかで初期化しなければならない。なお返される MIB_UNICASTIPADDRESS_TABLE では、NumEntries
メンバと Table の最初の MIB_UNICASTIPADDRESS_ROW
エントリとの間、さらにエントリ間にもアライメントのためのパディングが存在しうるので、配列要素アクセス時はパディングを考慮すること。


%index
Icmp6CreateFile
Icmp6CreateFile 関数は、IPv6 ICMP エコー要求を発行できるハンドルをオープンする。
%prm

%inst
Icmp6CreateFile 関数は、IPv6 ICMP エコー要求を発行できるハンドルをオープンする。

[戻り値]
Icmp6CreateFile 関数は成功時にオープンされたハンドルを返す。失敗時は INVALID_HANDLE_VALUE
を返す。拡張エラー情報は GetLastError 関数で取得する。

[備考]
Icmp6CreateFile 関数は、IPv6 ICMP エコー要求を発行できるハンドルをオープンする。IPv6 ICMP
エコー要求の送信には Icmp6SendEcho2 を、IPv6 ICMP 応答の解析には Icmp6ParseReplies
を使用する。Icmp6CreateFile で開かれた ICMP ハンドルのクローズには IcmpCloseHandle
を使用する。IPv4 の場合は IcmpCreateFile / IcmpSendEcho / IcmpSendEcho2 /
IcmpSendEcho2Ex / IcmpParseReplies を使用する。Iphlpapi.h の include 指令は
Icmpapi.h より前に置かなければならない。


%index
Icmp6ParseReplies
Icmp6ParseReplies 関数は、与えられた応答バッファを解析し、IPv6 ICMPv6 エコー応答を返す。
%prm
ReplyBuffer, ReplySize
ReplyBuffer : [intptr] Icmp6SendEcho2 関数に渡したバッファへのポインタ。このパラメータは応答を保持する ICMPV6_ECHO_REPLY 構造体を指す。
ReplySize : [int] ReplyBuffer が指すバッファのサイズ (バイト単位)。
%inst
Icmp6ParseReplies 関数は、与えられた応答バッファを解析し、IPv6 ICMPv6 エコー応答を返す。

[戻り値]
Icmp6ParseReplies 関数は成功時に 1 を返す。このとき ReplyBuffer の ICMPV6_ECHO_REPLY
の Status メンバは、対象ノードが応答した場合は IP_SUCCESS、あるいは IP_TTL_EXPIRED_TRANSIT
のいずれかとなる。戻り値が 0 の場合は GetLastError から拡張エラー情報が取得できる。
このドキュメントは省略されている。

[備考]
Icmp6ParseReplies 関数は、IPv6 の ICMPv6
エコー要求の結果として得られた応答を解析するために使用される。以前に Icmp6SendEcho2
に渡した応答バッファを解析する。Icmp6ParseReplies は Icmp6SendEcho2 とのみ併用する。IPv4 用の
IcmpSendEcho / IcmpSendEcho2 の応答バッファには使用できない。IPv4 の場合は IcmpCreateFile
/ IcmpSendEcho / IcmpSendEcho2 / IcmpSendEcho2Ex / IcmpParseReplies
を使用する。Iphlpapi.h の include 指令は Icmpapi.h より前に置かなければならない。


%index
Icmp6SendEcho2
Icmp6SendEcho2 関数は IPv6 ICMPv6 エコー要求を送信し、Event または ApcRoutine が NULL 以外なら即座に、そうでなければ指定したタイムアウト後に返る。ReplyBuffer には IPv6 ICMPv6 エコー応答が格納される。
%prm
IcmpHandle, Event, ApcRoutine, ApcContext, SourceAddress, DestinationAddress, RequestData, RequestSize, RequestOptions, ReplyBuffer, ReplySize, Timeout
IcmpHandle : [intptr] Icmp6CreateFile が返したオープンハンドル。
Event : [intptr] ICMPv6 応答が到着したときにシグナル状態にするイベント。指定する場合は有効なイベントオブジェクトへのハンドルが必要。イベントオブジェクトは CreateEvent / CreateEventEx で作成する。イベントの使い方の詳細は Event Objects を参照。
ApcRoutine : [int] 呼び出しスレッドがアラート可能な状態で ICMPv6 応答が到着したときに呼ばれるルーチン。Windows Vista 以降では、このパラメータの型を FARPROC ではなく PIO_APC_ROUTINE にするために PIO_APC_ROUTINE_DEFINED を定義する必要がある。Windows Server 2003 / Windows XP では PIO_APC_ROUTINE_DEFINED を定義してはならず、型は FARPROC のままにする。
ApcContext : [intptr] ICMPv6 応答が到着したかエラーが発生したとき、ApcRoutine で指定したコールバックルーチンに渡される任意パラメータ。
SourceAddress : [var] エコー要求を発行する IPv6 送信元アドレス。sockaddr 構造体の形式で指定する。
DestinationAddress : [var] エコー要求の IPv6 宛先アドレス。sockaddr 構造体の形式で指定する。
RequestData : [intptr] 要求で送信するデータを含むバッファへのポインタ。
RequestSize : [int] RequestData が指す要求データバッファのサイズ (バイト単位)。
RequestOptions : [var] 要求に対する IPv6 ヘッダオプションへのポインタ。IP_OPTION_INFORMATION 構造体の形式で指定する。64 ビットプラットフォームでは IP_OPTION_INFORMATION32 の形式となる。ヘッダオプションを指定しない場合は NULL でもよい。Windows Server 2003 / Windows XP ではこのパラメータは必須であり NULL にはできず、Ttl と Flags メンバのみが使用される。
ReplyBuffer : [intptr] 応答を保持するバッファへのポインタ。戻り時、バッファには ICMPV6_ECHO_REPLY 構造体に続けて ICMPv6 エコー応答のメッセージ本体が格納される。バッファは ICMPV6_ECHO_REPLY 構造体 1 つ分と RequestSize バイトのデータ、さらに 8 バイトの ICMP エラーメッセージおよび IO_STATUS_BLOCK 構造体分の領域を収められる大きさでなければならない。
ReplySize : [int] ReplyBuffer が指す応答バッファのサイズ (バイト単位)。少なくとも ICMPV6_ECHO_REPLY 構造体 1 つ分と RequestSize バイト、加えて 8 バイトの ICMP エラーメッセージ分と IO_STATUS_BLOCK 分を収められる必要がある。
Timeout : [int] 応答を待機する時間 (ミリ秒単位)。Icmp6SendEcho2 が同期的に呼び出された場合にのみ使用される。ApcRoutine または Event が NULL 以外の場合は使用されない。
%inst
Icmp6SendEcho2 関数は IPv6 ICMPv6 エコー要求を送信し、Event または ApcRoutine が NULL
以外なら即座に、そうでなければ指定したタイムアウト後に返る。ReplyBuffer には IPv6 ICMPv6 エコー応答が格納される。

[戻り値]
同期呼び出し時、Icmp6SendEcho2 は ReplyBuffer に格納された応答の数を返す。0 の場合は
GetLastError で拡張エラー情報を取得する。非同期呼び出し時、Icmp6SendEcho2 は操作進行中を示す
ERROR_IO_PENDING を返す。結果は Event のシグナル、または ApcRoutine
の呼び出しで取得できる。関数が失敗した場合、GetLastError は以下のいずれかを返す。
このドキュメントは省略されている。

[備考]
Icmp6SendEcho2 関数は ApcRoutine と Event が NULL
の場合は同期的に呼び出される。同期呼び出し時の戻り値は、Timeout の時間待機した後に ReplyBuffer
に格納された応答の数である。0 の場合は GetLastError で拡張エラー情報を取得できる。ApcRoutine または Event
が指定されている場合は非同期呼び出しとなる。非同期時は ReplyBuffer / ReplySize が必要で、ICMP 応答データは
ReplyBuffer にコピーされ、Event 指定時はイベントがシグナル状態になり、ApcRoutine
指定時はコールバック関数が呼び出される。アプリケーションは Icmp6ParseReplies で ReplyBuffer
を解析する必要がある。両方を指定した場合は Event のみが使用され ApcRoutine は無視される。Windows Vista
以降で ApcRoutine による非同期呼び出しを行うアプリケーションは、型を PIO_APC_ROUTINE にするため
Icmpapi.h をインクルードする前に PIO_APC_ROUTINE_DEFINED を定義しなければならない。
コールバック関数は VOID 型で次の構文に従って定義する:
このドキュメントは省略されている。


%index
IcmpCloseHandle
IcmpCloseHandle 関数は、IcmpCreateFile または Icmp6CreateFile でオープンされたハンドルをクローズする。
%prm
IcmpHandle
IcmpHandle : [intptr] クローズするハンドル。このハンドルは IcmpCreateFile または Icmp6CreateFile の呼び出しで返されたものでなければならない。
%inst
IcmpCloseHandle 関数は、IcmpCreateFile または Icmp6CreateFile
でオープンされたハンドルをクローズする。

[戻り値]
ハンドルが正常にクローズされた場合は TRUE、そうでない場合は FALSE を返す。拡張エラー情報は GetLastError
関数で取得する。

[備考]
IcmpCloseHandle 関数は、Windows 2000 では Icmp.dll から、Windows XP 以降では
Iphlpapi.dll からエクスポートされる。この関数を使用する際に Windows
バージョンチェックを行うことは推奨されない。Windows 2000 / XP / Server 2003
以降で移植性が必要なアプリケーションは Icmp.lib / Iphlpapi.lib に静的リンクせず、LoadLibrary と
GetProcAddress で Iphlpapi.dll に IcmpCloseHandle があるかを確認し、なければ
Icmp.dll を確認するべきである。Iphlpapi.h の include 指令は Icmpapi.h より前に置くこと。


%index
IcmpCreateFile
IcmpCreateFile 関数は、IPv4 ICMP エコー要求を発行できるハンドルをオープンする。
%prm

%inst
IcmpCreateFile 関数は、IPv4 ICMP エコー要求を発行できるハンドルをオープンする。

[戻り値]
IcmpCreateFile 関数は成功時にオープンされたハンドルを返す。失敗時は INVALID_HANDLE_VALUE
を返す。拡張エラー情報は GetLastError 関数で取得する。

[備考]
IcmpCreateFile 関数は、Windows 2000 では Icmp.dll から、Windows XP 以降では
Iphlpapi.dll からエクスポートされる。Windows
バージョンチェックを用いた使用は推奨されない。移植性が必要なアプリケーションは Icmp.lib / Iphlpapi.lib
に静的リンクせず、LoadLibrary と GetProcAddress で Iphlpapi.dll に IcmpCreateFile
があるかを確認し、なければ Icmp.dll を確認する。IPv6 の場合は Icmp6CreateFile /
Icmp6SendEcho2 / Icmp6ParseReplies を使用する。Iphlpapi.h の include 指令は
Icmpapi.h より前に置くこと。


%index
IcmpParseReplies
与えられた応答バッファを解析し、見つかった ICMP エコー要求応答の数を返す。
%prm
ReplyBuffer, ReplySize
ReplyBuffer : [intptr] IcmpSendEcho2 に渡したバッファ。このバッファは ICMP_ECHO_REPLY 構造体 (PICMP_ECHO_REPLY 型) の配列を保持するよう書き換えられる。64 ビットプラットフォームでは ICMP_ECHO_REPLY32 (PICMP_ECHO_REPLY32 型) の配列として書き換えられる。
ReplySize : [int] ReplyBuffer が指すバッファのサイズ (バイト単位)。
%inst
与えられた応答バッファを解析し、見つかった ICMP エコー要求応答の数を返す。

[戻り値]
IcmpParseReplies 関数は成功時に見つかった ICMP 応答の数を返す。エラー時は 0 を返す。追加のエラー情報は
GetLastError で取得する。

[備考]
IcmpParseReplies 関数は、以前に IcmpSendEcho
に渡した応答バッファには使用してはならない。IcmpSendEcho は戻る前に自らバッファを解析する。IcmpSendEcho2
とのみ併用すること。IcmpParseReplies は Windows 2000 では Icmp.dll から、Windows XP
以降では Iphlpapi.dll からエクスポートされる。移植性が必要なアプリケーションは Icmp.lib /
Iphlpapi.lib に静的リンクせず、LoadLibrary と GetProcAddress で Iphlpapi.dll に
IcmpParseReplies があるかを確認し、なければ Icmp.dll を確認する。Iphlpapi.h の include
指令は Icmpapi.h より前に置くこと。


%index
IcmpSendEcho
IcmpSendEcho 関数は IPv4 ICMP エコー要求を送信し、エコー応答を返す。タイムアウトか応答バッファが埋まった時点で関数は戻る。
%prm
IcmpHandle, DestinationAddress, RequestData, RequestSize, RequestOptions, ReplyBuffer, ReplySize, Timeout
IcmpHandle : [intptr] IcmpCreateFile 関数が返したオープンハンドル。
DestinationAddress : [int] エコー要求の IPv4 宛先アドレス。IPAddr 構造体の形式で指定する。
RequestData : [intptr] 要求で送信するデータを含むバッファへのポインタ。
RequestSize : [int] RequestData が指す要求データバッファのサイズ (バイト単位)。
RequestOptions : [var] 要求の IP ヘッダオプションへのポインタ。IP_OPTION_INFORMATION 構造体の形式で指定する。64 ビットプラットフォームでは IP_OPTION_INFORMATION32 形式となる。オプションを指定しない場合は NULL でもよい。
ReplyBuffer : [intptr] エコー要求に対する応答を保持するバッファ。戻り時、バッファには ICMP_ECHO_REPLY 構造体の配列に続けて応答のオプションとデータが格納される。バッファは少なくとも ICMP_ECHO_REPLY 構造体 1 つと RequestSize バイトのデータを収められる大きさでなければならない。
ReplySize : [int] 応答バッファの割り当てサイズ (バイト単位)。少なくとも ICMP_ECHO_REPLY 構造体 1 つと RequestSize バイトのデータ、加えて 8 バイトの ICMP エラーメッセージ分を収められる必要がある。
Timeout : [int] 応答を待機する時間 (ミリ秒単位)。
%inst
IcmpSendEcho 関数は IPv4 ICMP
エコー要求を送信し、エコー応答を返す。タイムアウトか応答バッファが埋まった時点で関数は戻る。

[戻り値]
IcmpSendEcho 関数は ReplyBuffer に格納された ICMP_ECHO_REPLY
構造体の数を返す。各応答のステータスは構造体内に含まれる。0 の場合は GetLastError
で追加のエラー情報を取得できる。関数が失敗した場合、GetLastError の戻り値は次のいずれかとなる。
このドキュメントは省略されている。

[備考]
IcmpSendEcho 関数は指定アドレスへ ICMP エコー要求を送信し、ReplyBuffer
に格納された応答の数を返す。これは同期関数で、Timeout で指定した時間応答を待った後に返る。戻り値が 0 のときは
GetLastError で拡張エラー情報を取得する。IcmpSendEcho2 / IcmpSendEcho2Ex
は非同期動作をサポートする拡張版で、IcmpSendEcho2Ex は送信元 IP アドレスも指定できる
(複数ネットワークインターフェイスを持つコンピュータで有用)。IPv6 の場合は Icmp6CreateFile /
Icmp6SendEcho2 / Icmp6ParseReplies を使用する。IcmpSendEcho は Windows 2000
では Icmp.dll、Windows XP 以降では Iphlpapi.dll
からエクスポートされる。移植性が必要な場合は静的リンクせず、LoadLibrary と GetProcAddress で
Iphlpapi.dll の存在を確認し、なければ Icmp.dll を確認する。Iphlpapi.h の include 指令は
Icmpapi.h より前に置くこと。


%index
IcmpSendEcho2
IcmpSendEcho2 関数は IPv4 ICMP エコー要求を送信し、Event または ApcRoutine が NULL 以外なら即座に、そうでなければ指定したタイムアウト後に返る。ReplyBuffer には ICMP エコー応答が格納される。
%prm
IcmpHandle, Event, ApcRoutine, ApcContext, DestinationAddress, RequestData, RequestSize, RequestOptions, ReplyBuffer, ReplySize, Timeout
IcmpHandle : [intptr] IcmpCreateFile 関数が返したオープンハンドル。
Event : [intptr] ICMP 応答が到着したときに (最大 1 回) シグナル状態にするイベント。指定する場合は有効なイベントオブジェクトへのハンドルが必要。CreateEvent または CreateEventEx でイベントを作成する。イベントの使用方法については Event objects を参照。
ApcRoutine : [int] 呼び出しスレッドがアラート可能な状態で ICMPv4 応答が到着したときに呼ばれるルーチン。このパラメータの型を FARPROC ではなく PIO_APC_ROUTINE にするため PIO_APC_ROUTINE_DEFINED を定義しなければならない。
ApcContext : [intptr] ICMP 応答が到着したかエラーが発生したとき、ApcRoutine で指定したコールバックルーチンに (最大 1 回) 渡される任意パラメータ。
DestinationAddress : [int] エコー要求の IPv4 宛先。IPAddr 構造体の形式で指定する。
RequestData : [intptr] 要求で送信するデータを含むバッファへのポインタ。
RequestSize : [int] RequestData が指す要求データバッファのサイズ (バイト単位)。
RequestOptions : [var] 要求の IP ヘッダオプションへのポインタ。IP_OPTION_INFORMATION 構造体の形式で指定する。IP ヘッダオプションを指定しない場合は NULL でもよい。
ReplyBuffer : [intptr] 要求に対する応答を保持するバッファへのポインタ。戻り時、バッファには ICMP_ECHO_REPLY 構造体の配列に続けてオプションとデータが格納される。バッファは少なくとも ICMP_ECHO_REPLY 構造体 1 つと RequestSize バイトのデータ、さらに 8 バイトの ICMP エラーメッセージ分を収められる大きさでなければならない。
ReplySize : [int] 応答バッファの割り当てサイズ (バイト単位)。少なくとも ICMP_ECHO_REPLY 構造体 1 つと RequestSize バイトのデータ、さらに 8 バイトの ICMP エラーメッセージ分を収められる必要がある。
Timeout : [int] 応答を待機する時間 (ミリ秒単位)。
%inst
IcmpSendEcho2 関数は IPv4 ICMP エコー要求を送信し、Event または ApcRoutine が NULL
以外なら即座に、そうでなければ指定したタイムアウト後に返る。ReplyBuffer には ICMP エコー応答が格納される。

[戻り値]
同期呼び出し時、IcmpSendEcho2 は ReplyBuffer に格納された応答の数を返す。0 の場合は GetLastError
で拡張エラー情報を取得する。非同期呼び出し時は 0 を返し、続く GetLastError の呼び出しが操作進行中を示す
ERROR_IO_PENDING を返す。結果は Event のシグナル、または ApcRoutine
の呼び出しで取得できる。関数が失敗した場合、GetLastError は次のいずれかを返す:
- ERROR_INVALID_PARAMETER: 無効なパラメータ (IcmpHandle が無効、または ReplySize が
ICMP_ECHO_REPLY 構造体より小さい)
- ERROR_IO_PENDING: 操作進行中 (非同期呼び出しの成功時)
- ERROR_NOT_ENOUGH_MEMORY: メモリ不足
- ERROR_NOT_SUPPORTED: IPv4 スタックがローカルコンピュータに存在しないときの要求未サポート
- IP_BUF_TOO_SMALL: ReplySize が小さすぎる
- その他: FormatMessage でメッセージ文字列を取得する

[備考]
IcmpSendEcho2 関数は ApcRoutine と Event が NULL
の場合は同期的に呼び出される。同期呼び出し時の戻り値は、Timeout で指定した時間待機した後に ReplyBuffer
に格納された応答の数である。0 の場合は GetLastError で拡張エラー情報を取得する。ApcRoutine または Event
が指定されている場合は非同期呼び出しとなる。非同期時は ReplyBuffer / ReplySize が必要で、応答データが
ReplyBuffer にコピーされ、Event または ApcRoutine に通知される。アプリケーションは
IcmpParseReplies で ReplyBuffer を解析する必要がある。両方指定した場合は Event がシグナル状態になり
ApcRoutine は無視される。ApcRoutine による非同期呼び出しを行うアプリケーションは、型を
PIO_APC_ROUTINE にするため Icmpapi.h をインクルードする前に PIO_APC_ROUTINE_DEFINED
を定義しなければならない。コールバック関数は VOID 型で次の構文に従って定義する:
このドキュメントは省略されている。


%index
IcmpSendEcho2Ex
IPv4 ICMP エコー要求を送信し、Event または ApcRoutine が NULL 以外なら即座に、そうでなければ指定したタイムアウト後に返る。ReplyBuffer には ICMP 応答が格納される。
%prm
IcmpHandle, Event, ApcRoutine, ApcContext, SourceAddress, DestinationAddress, RequestData, RequestSize, RequestOptions, ReplyBuffer, ReplySize, Timeout
IcmpHandle : [intptr] IcmpCreateFile 関数が返したオープンハンドル。
Event : [intptr] ICMP 応答が到着したときにシグナル状態にするイベント。指定する場合は有効なイベントオブジェクトへのハンドルが必要。CreateEvent または CreateEventEx でイベントを作成する。詳細は Event Objects を参照。
ApcRoutine : [int] 呼び出しスレッドがアラート可能な状態で ICMP 応答が到着したときに呼ばれるルーチン。このパラメータの型を FARPROC ではなく PIO_APC_ROUTINE にするため PIO_APC_ROUTINE_DEFINED を定義しなければならない。
ApcContext : [intptr] ICMP 応答が到着したかエラーが発生したとき、ApcRoutine で指定したコールバックルーチンに渡される任意パラメータ。
SourceAddress : [int] エコー要求を発行する IPv4 送信元アドレス。IPAddr 構造体の形式で指定する。
DestinationAddress : [int] エコー要求の IPv4 宛先アドレス。IPAddr 構造体の形式で指定する。
RequestData : [intptr] 要求で送信するデータを含むバッファへのポインタ。
RequestSize : [int] RequestData が指す要求データバッファのサイズ (バイト単位)。
RequestOptions : [var] 要求の IP ヘッダオプションへのポインタ。IP_OPTION_INFORMATION 構造体の形式で指定する。64 ビットプラットフォームでは IP_OPTION_INFORMATION32 形式となる。オプションを指定しない場合は NULL でもよい。
ReplyBuffer : [intptr] 要求に対する応答を保持するバッファへのポインタ。戻り時、バッファには ICMP_ECHO_REPLY 構造体の配列に続けてオプションとデータが格納される。バッファは少なくとも ICMP_ECHO_REPLY 構造体 1 つ分と RequestSize バイトのデータ、さらに 8 バイトの ICMP エラーメッセージおよび IO_STATUS_BLOCK 構造体分の領域を収められる大きさでなければならない。
ReplySize : [int] 応答バッファの割り当てサイズ (バイト単位)。少なくとも ICMP_ECHO_REPLY 構造体 1 つと RequestSize バイトのデータ、加えて 8 バイトの ICMP エラーメッセージ分と IO_STATUS_BLOCK 分を収められる必要がある。
Timeout : [int] 応答を待機する時間 (ミリ秒単位)。
%inst
IPv4 ICMP エコー要求を送信し、Event または ApcRoutine が NULL
以外なら即座に、そうでなければ指定したタイムアウト後に返る。ReplyBuffer には ICMP 応答が格納される。

[戻り値]
同期呼び出し時、IcmpSendEcho2Ex は ReplyBuffer に格納された応答の数を返す。0 の場合は
GetLastError で拡張エラー情報を取得する。非同期呼び出し時、IcmpSendEcho2Ex は操作進行中を示す
ERROR_IO_PENDING を返す。結果は Event のシグナル、または ApcRoutine
の呼び出しで取得できる。失敗した場合、GetLastError は以下のいずれかを返す。
このドキュメントは省略されている。

[備考]
IcmpSendEcho2Ex 関数は Windows Server 2008 以降で利用可能であり、IcmpSendEcho2
の拡張版でユーザが ICMP 要求を発行する IPv4
送信元アドレスを指定できる。複数のネットワークインターフェイスを持つコンピュータで有用である。ApcRoutine と Event が
NULL のときは同期的に呼び出され、戻り値は Timeout で指定した時間待機した後に ReplyBuffer
に格納された応答数となる。0 のときは GetLastError で拡張エラー情報を取得する。ApcRoutine または Event
指定時は非同期呼び出しとなり、ReplyBuffer / ReplySize が必須。応答は ReplyBuffer
にコピーされ、Event シグナルまたは ApcRoutine コールバックで通知される。アプリケーションは
IcmpParseReplies で解析する必要がある。両方指定時は Event のみが使用され ApcRoutine
は無視される。ApcRoutine 非同期呼び出しを行うアプリケーションは、型を PIO_APC_ROUTINE にするため
Icmpapi.h のインクルード前に PIO_APC_ROUTINE_DEFINED を定義しなければならない。
コールバック関数は VOID 型で次の構文に従って定義する:
このドキュメントは省略されている。


%index
InitializeIpForwardEntry
MIB_IPFORWARD_ROW2 構造体を、ローカルコンピュータ上の IP 経路エントリの既定値で初期化する。
%prm
Row
Row : [var] 入力時、IP 経路エントリの MIB_IPFORWARD_ROW2 構造体エントリへのポインタ。戻り時、このポインタが指す構造体は IP 経路エントリの既定値で初期化される。
%inst
MIB_IPFORWARD_ROW2 構造体を、ローカルコンピュータ上の IP 経路エントリの既定値で初期化する。

[戻り値]
この関数は値を返さない。

[備考]
InitializeIpForwardEntry 関数は Windows Vista
以降で定義される。CreateIpForwardEntry2 関数で後に使用する IP
経路エントリとして、MIB_IPFORWARD_ROW2 のメンバを既定値で初期化するために使用する。入力時には初期化対象の新しい
MIB_IPFORWARD_ROW2 を渡さなければならない。出力時、ValidLifetime と PreferredLifetime
は無限に、Loopback / AutoconfigureAddress / Publish / Immortal は TRUE
に初期化される。さらに SitePrefixLength、Metric、Protocol は不正な値に、その他は 0
に初期化される。呼び出し後にアプリケーションは変更したいメンバを書き換え、CreateIpForwardEntry2 を呼び出して新規
IP 経路エントリを追加できる。


%index
InitializeIpInterfaceEntry
MIB_IPINTERFACE_ROW エントリのメンバを既定値で初期化する。
%prm
Row
Row : [var] 初期化する MIB_IPINTERFACE_ROW 構造体へのポインタ。正常終了時、このフィールドはローカルコンピュータ上のインターフェイスの既定情報で初期化される。
%inst
MIB_IPINTERFACE_ROW エントリのメンバを既定値で初期化する。

[戻り値]
この関数は値を返さない。

[備考]
InitializeIpInterfaceEntry 関数は Windows Vista 以降で定義される。出力時、Row が指す構造体の
Family メンバは AF_UNSPEC に、InterfaceLuid は未指定値に、その他は 0
に初期化される。アプリケーションは変更したいフィールドを書き換え、SetIpInterfaceEntry
を呼び出すことで変更を反映できる。


%index
InitializeUnicastIpAddressEntry
MIB_UNICASTIPADDRESS_ROW 構造体を、ローカルコンピュータ上のユニキャスト IP アドレスエントリの既定値で初期化する。
%prm
Row
Row : [var] 入力時、ユニキャスト IP アドレスエントリの MIB_UNICASTIPADDRESS_ROW 構造体エントリへのポインタ。戻り時、このポインタが指す構造体はユニキャスト IP アドレスの既定値で初期化される。
%inst
MIB_UNICASTIPADDRESS_ROW 構造体を、ローカルコンピュータ上のユニキャスト IP
アドレスエントリの既定値で初期化する。

[戻り値]
この関数は値を返さない。

[備考]
InitializeUnicastIpAddressEntry 関数は Windows Vista
以降で定義される。CreateUnicastIpAddressEntry で後に使用するユニキャスト IP
アドレスとして、MIB_UNICASTIPADDRESS_ROW のメンバを既定値で初期化するために使用する。入力時には初期化対象の新しい
MIB_UNICASTIPADDRESS_ROW を渡す。出力時、PrefixOrigin は
IpPrefixOriginUnchanged に、SuffixOrigin は IpSuffixOriginUnchanged
に、OnLinkPrefixLength は不正値に、PreferredLifetime と ValidLifetime
は無限に、SkipAsSource は FALSE に、その他は 0
に初期化される。呼び出し後にアプリケーションは変更したいメンバを書き換え、CreateUnicastIpAddressEntry
を呼び出して新規ユニキャスト IP アドレスを追加できる。


%index
IpReleaseAddress
IpReleaseAddress 関数は、DHCP で以前に取得した IPv4 アドレスを解放する。
%prm
AdapterInfo
AdapterInfo : [var] 解放する IPv4 アドレスに関連するアダプタを指定する IP_ADAPTER_INDEX_MAP 構造体へのポインタ。
%inst
IpReleaseAddress 関数は、DHCP で以前に取得した IPv4 アドレスを解放する。

[戻り値]
関数が成功すると、戻り値は NO_ERROR である。失敗した場合は FormatMessage
を使って返されたエラーのメッセージ文字列を取得する。
このドキュメントは省略されている。

[備考]
IpReleaseAddress 関数は IPv4 専用で、DHCP で以前に取得した IPv4
アドレスのみを解放する。AdapterInfo が指す IP_ADAPTER_INDEX_MAP の Name メンバのみが解放する
DHCP アドレスの判定に使われる。IP_ADAPTER_INDEX_MAP の配列は GetInterfaceInfo によって
IP_INTERFACE_INFO 構造体として返される。GetInterfaceInfo の返す IP_INTERFACE_INFO
は、NumAdapters が 0 (IPv4 有効なアダプタがない) の場合でも最低 1 つの IP_ADAPTER_INDEX_MAP
を含む。このとき単一の IP_ADAPTER_INDEX_MAP のメンバ値は未定義である。AdapterInfo が指す
IP_ADAPTER_INDEX_MAP の Name メンバが NULL の場合、IpReleaseAddress は
ERROR_INVALID_PARAMETER を返す。IPv6 アドレスの解放/更新を行う関数は提供されていない。これは
Ipconfig コマンドの実行でのみ可能:
ipconfig /release6 ipconfig /renew6


%index
IpRenewAddress
IpRenewAddress 関数は、DHCP で以前に取得した IPv4 アドレスのリースを更新する。
%prm
AdapterInfo
AdapterInfo : [var] 更新する IP アドレスに関連するアダプタを指定する IP_ADAPTER_INDEX_MAP 構造体へのポインタ。
%inst
IpRenewAddress 関数は、DHCP で以前に取得した IPv4 アドレスのリースを更新する。

[戻り値]
関数が成功すると、戻り値は NO_ERROR である。失敗した場合は FormatMessage
を使って返されたエラーのメッセージ文字列を取得する。
このドキュメントは省略されている。

[備考]
IpRenewAddress 関数は IPv4 専用で、DHCP で以前に取得した IPv4
アドレスのみを更新する。AdapterInfo が指す IP_ADAPTER_INDEX_MAP の Name メンバのみが更新する
DHCP アドレスの判定に使われる。IP_ADAPTER_INDEX_MAP の配列は GetInterfaceInfo によって
IP_INTERFACE_INFO 構造体として返される。GetInterfaceInfo の返す IP_INTERFACE_INFO
は、NumAdapters が 0 (IPv4 有効なアダプタがない) の場合でも最低 1 つの IP_ADAPTER_INDEX_MAP
を含む。このとき単一の IP_ADAPTER_INDEX_MAP のメンバ値は未定義である。Name メンバが NULL
の場合、IpRenewAddress は ERROR_INVALID_PARAMETER を返す。IPv6
アドレスの解放/更新を行う関数は提供されていない。これは Ipconfig コマンドの実行でのみ可能:
ipconfig /release6 ipconfig /renew6


%index
LookupPersistentTcpPortReservation
ローカルコンピュータ上の連続する TCP ポートブロックに対する永続的な TCP ポート予約のトークンを検索する。
%prm
StartPort, NumberOfPorts, Token
StartPort : [int] ネットワークバイト順での開始 TCP ポート番号。
NumberOfPorts : [int] 予約されていた TCP ポート番号の数。
Token : [var] 関数が成功した場合に返されるポート予約トークンへのポインタ。
%inst
ローカルコンピュータ上の連続する TCP ポートブロックに対する永続的な TCP ポート予約のトークンを検索する。

[戻り値]
関数が成功すると、戻り値は NO_ERROR である。失敗した場合は以下のエラーコードのいずれかが返される。
このドキュメントは省略されている。

[備考]
LookupPersistentTcpPortReservation 関数は Windows Vista 以降で定義される。TCP
ポートのブロックに対する永続的な予約のトークンを検索する。TCP ポートブロックに対する永続的な予約は
CreatePersistentTcpPortReservation 関数の呼び出しによって作成される。この関数に渡される
StartPort / NumberOfPorts は、CreatePersistentTcpPortReservation
で予約作成時に使用した値と一致しなければならない。関数が成功すると、Token パラメータには TCP
ポートブロックの永続的な予約トークンが返される。ある永続的予約のトークンは、システム再起動のたびに変更されることがある点に注意する。
アプリケーションは TCP ソケットをオープンし、bind を呼び出す前に WSAIoctl で
SIO_ASSOCIATE_PORT_RESERVATION IOCTL と予約トークンを渡すことで、TCP
ポート予約からのポート割り当てを要求できる。


%index
LookupPersistentUdpPortReservation
ローカルコンピュータ上の連続する UDP ポートブロックに対する永続的な UDP ポート予約のトークンを検索する。
%prm
StartPort, NumberOfPorts, Token
StartPort : [int] ネットワークバイト順での開始 UDP ポート番号。
NumberOfPorts : [int] 予約されていた UDP ポート番号の数。
Token : [var] 関数が成功した場合に返されるポート予約トークンへのポインタ。
%inst
ローカルコンピュータ上の連続する UDP ポートブロックに対する永続的な UDP ポート予約のトークンを検索する。

[戻り値]
関数が成功すると、戻り値は NO_ERROR である。失敗した場合は以下のエラーコードのいずれかが返される。
このドキュメントは省略されている。

[備考]
LookupPersistentUdpPortReservation 関数は Windows Vista 以降で定義される。UDP
ポートのブロックに対する永続的な予約のトークンを検索する。UDP ポートブロックに対する永続的な予約は
CreatePersistentUdpPortReservation 関数の呼び出しによって作成される。StartPort /
NumberOfPorts は予約作成時の値と一致しなければならない。関数が成功すると、Token には UDP
ポートブロックの永続的な予約トークンが返される。予約トークンはシステム再起動のたびに変更されることがある点に注意する。
アプリケーションは UDP ソケットをオープンし、bind 呼び出し前に WSAIoctl で
SIO_ASSOCIATE_PORT_RESERVATION IOCTL と予約トークンを渡すことで、UDP
ポート予約からのポート割り当てを要求できる。


%index
NhpAllocateAndGetInterfaceInfoFromStack
NhpAllocateAndGetInterfaceInfoFromStack 関数は、ローカルコンピュータのアダプタ情報を取得する。
%prm
ppTable, pdwCount, bOrder, hHeap, dwFlags
ppTable : [var] ローカルシステム上の各アダプタに関する情報を含む IP_INTERFACE_NAME_INFO 構造体の配列。システム上のアダプタごとに要素が 1 つ含まれる。
pdwCount : [var] ppTable 配列の要素数。
bOrder : [int] TRUE の場合、ppTable 配列の要素はインデックス値の昇順でソートされる。
hHeap : [intptr] ppTable を割り当てるヒープを指定するハンドル。GetProcessHeap が返すプロセスヒープ、または HeapCreate で作成したプライベートヒープを指定できる。
dwFlags : [int] ppTable のメモリ割り当てで HeapAlloc 関数に渡されるフラグセット。詳細は HeapAlloc を参照。
%inst
NhpAllocateAndGetInterfaceInfoFromStack 関数は、ローカルコンピュータのアダプタ情報を取得する。

[戻り値]
正常完了時に ERROR_SUCCESS を返す。

[備考]
Microsoft Windows SDK では、NhpAllocateAndGetInterfaceInfoFromStack 関数は
Windows 2000 SP1 以降で定義される。ターゲットプラットフォームが Windows 2000 SP1 以降
(NTDDI_VERSION >= NTDDI_WIN2KSP1、_WIN32_WINNT >= 0x0500、WINVER >=
0x0500) の場合に定義される。


%index
NotifyAddrChange
NotifyAddrChange 関数は、IPv4 アドレスとインターフェイスの対応テーブルに変更が発生したとき、呼び出し元に通知を送らせる。
%prm
Handle, overlapped
Handle : [intptr] 後続の GetOverlappedResult 呼び出しで使用するファイルハンドルを受け取る HANDLE 変数へのポインタ。警告: このハンドルをクローズしてはならず、また完了ポートに関連付けてもならない。
overlapped : [var] IP アドレスとインターフェイスの対応テーブルの変更を呼び出し元に通知する OVERLAPPED 構造体へのポインタ。
%inst
NotifyAddrChange 関数は、IPv4
アドレスとインターフェイスの対応テーブルに変更が発生したとき、呼び出し元に通知を送らせる。

[戻り値]
関数が成功した場合、Handle と overlapped の両方に NULL を指定していれば戻り値は NO_ERROR
である。NULL 以外を指定した場合の成功の戻り値は ERROR_IO_PENDING となる。失敗した場合は FormatMessage
を使って返されたエラーのメッセージ文字列を取得する。
このドキュメントは省略されている。

[備考]
この説明は
このドキュメントは省略されている。


%index
NotifyIfTimestampConfigChange
この関数はシステム用に予約されており、ユーザのコードから呼び出してはならない。(NotifyIfTimestampConfigChange)
%prm
CallerContext, Callback, NotificationHandle
CallerContext : [intptr] 予約済み。
Callback : [int] 予約済み。
NotificationHandle : [intptr] 予約済み。
%inst

この関数はシステム用に予約されており、ユーザのコードから呼び出してはならない。(NotifyIfTimestampConfigChange)

[戻り値]
予約済み。


%index
NotifyIpInterfaceChange
ローカルコンピュータ上のすべての IP インターフェイス、IPv4 インターフェイス、IPv6 インターフェイスの変更通知を登録する。
%prm
Family, Callback, CallerContext, InitialNotification, NotificationHandle
Family : [int] 変更通知を登録するアドレスファミリ。アドレスファミリの値は Winsock2.h で定義される。AF_ と PF_ の定数は等価 (例: AF_INET と PF_INET) である。Windows Vista 以降向け SDK では Ws2def.h で定義される。Ws2def.h は Winsock2.h から自動インクルードされるので直接使用してはならない。現在サポートされる値は AF_INET、AF_INET6、AF_UNSPEC である。
Callback : [int] 変更発生時に呼び出す関数へのポインタ。インターフェイス通知受信時に起動される。
CallerContext : [intptr] インターフェイス通知受信時に Callback に渡されるユーザコンテキスト。
InitialNotification : [int] 変更通知の登録完了直後にコールバックを起動するかどうかを示す値。この初回通知は IP インターフェイスの変更を示すものではなく、コールバックの登録確認のためのものである。
NotificationHandle : [intptr] 変更通知の解除に後で使用できるハンドルを返すためのポインタ。成功時はハンドルが返され、エラー時は NULL が返される。
%inst
ローカルコンピュータ上のすべての IP インターフェイス、IPv4 インターフェイス、IPv6 インターフェイスの変更通知を登録する。

[戻り値]
関数が成功すると、戻り値は NO_ERROR である。失敗した場合は以下のエラーコードのいずれかが返される。
このドキュメントは省略されている。

[備考]
NotifyIpInterfaceChange 関数は Windows Vista 以降で定義される。Family は
AF_INET、AF_INET6、AF_UNSPEC のいずれかでなければならない。Callback
の呼び出しはシリアライズされる。コールバック関数は VOID 型で定義する。コールバックに渡されるパラメータは次のとおり:
このドキュメントは省略されている。


%index
NotifyNetworkConnectivityHintChange
総合ネットワーク接続レベルおよびコストヒントが変更されたときに呼ばれる、アプリケーション定義のコールバック関数を登録する。
%prm
Callback, CallerContext, InitialNotification, NotificationHandle
Callback : [int] アプリケーション定義のコールバック関数を指す PNETWORK_CONNECTIVITY_HINT_CHANGE_CALLBACK 型の関数ポインタ。ネットワーク接続レベルまたはコスト変更時に呼び出される。
CallerContext : [intptr] 呼び出し元固有のコンテキスト。コールバック関数に渡される。
InitialNotification : [int] 初期化通知を発行する場合は true、それ以外は false。
NotificationHandle : [intptr] HANDLE へのポインタ。関数は通知登録へのハンドルを設定する。
%inst
総合ネットワーク接続レベルおよびコストヒントが変更されたときに呼ばれる、アプリケーション定義のコールバック関数を登録する。

[戻り値]
関数が成功すると、戻り値は NO_ERROR である。それ以外の場合はエラーコードが返される。

[備考]
変更通知を解除するには、NotifyNetworkConnectivityHintChange が返した
NotificationHandle を渡して CancelMibChangeNotify2 関数を呼び出す。


%index
NotifyRouteChange
NotifyRouteChange 関数は、IPv4 ルーティングテーブルに変更が発生したとき、呼び出し元に通知を送らせる。
%prm
Handle, overlapped
Handle : [intptr] 非同期通知で使用するハンドルを受け取る HANDLE 変数へのポインタ。
overlapped : [var] ルーティングテーブルの変更を呼び出し元に通知する OVERLAPPED 構造体へのポインタ。
%inst
NotifyRouteChange 関数は、IPv4 ルーティングテーブルに変更が発生したとき、呼び出し元に通知を送らせる。

[戻り値]
関数が成功した場合、Handle と overlapped の両方に NULL を指定していれば戻り値は NO_ERROR
である。NULL 以外を指定した場合の成功の戻り値は ERROR_IO_PENDING となる。失敗した場合は FormatMessage
を使って返されたエラーのメッセージ文字列を取得する。
このドキュメントは省略されている。

[備考]
この説明は
このドキュメントは省略されている。


%index
NotifyRouteChange2
ローカルコンピュータ上の IP 経路エントリの変更通知を登録する。
%prm
AddressFamily, Callback, CallerContext, InitialNotification, NotificationHandle
AddressFamily : [int] 変更通知を登録するアドレスファミリ。アドレスファミリの値は Winsock2.h で定義される。AF_ と PF_ の定数は等価 (例: AF_INET と PF_INET) である。Windows Vista 以降向け SDK では Ws2def.h で定義される。Ws2def.h は Winsock2.h から自動インクルードされるので直接使用してはならない。現在サポートされる値は AF_INET、AF_INET6、AF_UNSPEC である。
Callback : [int] 変更発生時に呼び出す関数へのポインタ。IP 経路通知受信時に起動される。
CallerContext : [intptr] IP 経路通知受信時に Callback に渡されるユーザコンテキスト。
InitialNotification : [int] 変更通知の登録完了直後にコールバックを起動するかどうかを示す値。この初回通知は IP 経路エントリの変更を示すものではなく、コールバックの登録確認のためのものである。
NotificationHandle : [intptr] 変更通知の解除に後で使用できるハンドルを返すためのポインタ。成功時はハンドルが返され、エラー時は NULL が返される。
%inst
ローカルコンピュータ上の IP 経路エントリの変更通知を登録する。

[戻り値]
関数が成功すると、戻り値は NO_ERROR である。失敗した場合は以下のエラーコードのいずれかが返される。
このドキュメントは省略されている。

[備考]
NotifyRouteChange2 関数は Windows Vista 以降で定義される。Family は
AF_INET、AF_INET6、AF_UNSPEC のいずれかでなければならない。Callback
の呼び出しはシリアライズされる。コールバック関数は VOID 型で定義する。コールバックに渡されるパラメータは次のとおり:
このドキュメントは省略されている。


%index
NotifyStableUnicastIpAddressTable
ローカルコンピュータ上の安定したユニキャスト IP アドレステーブルを取得する。
%prm
Family, Table, CallerCallback, CallerContext, NotificationHandle
Family : [int] 取得するアドレスファミリ。アドレスファミリの値は Winsock2.h で定義される。AF_ と PF_ の定数は等価 (例: AF_INET と PF_INET) である。Windows Vista 以降向け SDK では Ws2def.h で定義される。Ws2def.h は Winsock2.h から自動インクルードされるので直接使用してはならない。現在サポートされる値は AF_INET、AF_INET6、AF_UNSPEC である。
Table : [var] MIB_UNICASTIPADDRESS_TABLE 構造体へのポインタ。NotifyStableUnicastIpAddressTable が成功するとこのパラメータにローカルコンピュータの安定したユニキャスト IP アドレステーブルが返される。ERROR_IO_PENDING が返された場合は、テーブルは CallerCallback に渡される。
CallerCallback : [int] 安定したユニキャスト IP アドレステーブルを伴って呼び出される関数へのポインタ。NotifyStableUnicastIpAddressTable が ERROR_IO_PENDING (I/O 要求保留中) を返した場合に起動される。
CallerContext : [intptr] 安定したユニキャスト IP アドレステーブルが利用可能になったときに CallerCallback に渡されるユーザコンテキスト。
NotificationHandle : [intptr] 安定したユニキャスト IP アドレステーブル取得要求をキャンセルするのに使えるハンドルを返すためのポインタ。戻り値が ERROR_IO_PENDING (I/O 要求保留中) の場合にのみ返される。
%inst
ローカルコンピュータ上の安定したユニキャスト IP アドレステーブルを取得する。

[戻り値]
即座に成功した場合、戻り値は NO_ERROR となり Table にテーブルが返される。I/O 要求が保留の場合は
ERROR_IO_PENDING が返され、I/O 完了時に CallerCallback
が安定したテーブルを伴って呼び出される。失敗時は以下のエラーコードのいずれかが返される。
このドキュメントは省略されている。

[備考]
NotifyStableUnicastIpAddressTable 関数は Windows Vista
以降で定義される。即座に成功した場合は NO_ERROR を返し、Table に安定したユニキャスト IP
テーブルが返される。この場合、呼び出し元は FreeMibTable で Table
のメモリを解放する必要がある。dial-on-demand アドレスを除くすべてのユニキャスト IP アドレスは、preferred 状態
(MIB_UNICASTIPADDRESS_ROW の DadState が IpDadStatePreferred)
のときのみ安定と見なされる。各 dial-on-demand アドレスは独自の安定性メトリックを定義する。現在この関数が対象とする
dial-on-demand アドレスは Teredo クライアントのユニキャスト IP アドレスのみ。Family は
AF_INET、AF_INET6、AF_UNSPEC のいずれかに設定する必要がある。成功時は Table
にテーブルが返り、ERROR_IO_PENDING の場合は CallerCallback で後に返される。主に Teredo
クライアントを使うアプリケーションで使用される。Teredo アドレスが安定 (qualified) 状態でない場合、関数は
ERROR_IO_PENDING を返し、後で CallerCallback を介してテーブルが返される。Teredo
アドレスが不在、あるいは既に安定状態で他のすべても安定なら、コールバックは呼び出されない。コールバック関数は VOID
型で定義し、渡されるパラメータは次のとおり:
このドキュメントは省略されている。


%index
NotifyTeredoPortChange
ローカルコンピュータ上で Teredo クライアントが Teredo サービスポートに用いる UDP ポート番号の変更通知を登録する。
%prm
Callback, CallerContext, InitialNotification, NotificationHandle
Callback : [int] Teredo クライアントのポート変更時に呼び出す関数へのポインタ。Teredo ポート変更通知受信時に起動される。
CallerContext : [intptr] Teredo ポート変更通知受信時に Callback に渡されるユーザコンテキスト。
InitialNotification : [int] 変更通知の登録完了直後にコールバックを起動するかどうかを示す値。この初回通知は Teredo クライアントポートの変更を示すものではなく、コールバックの登録確認のためのものである。
NotificationHandle : [intptr] 変更通知の解除に後で使用できるハンドルを返すためのポインタ。成功時はハンドルが返され、エラー時は NULL が返される。
%inst
ローカルコンピュータ上で Teredo クライアントが Teredo サービスポートに用いる UDP ポート番号の変更通知を登録する。

[戻り値]
関数が成功すると、戻り値は NO_ERROR である。失敗した場合は以下のエラーコードのいずれかが返される。
このドキュメントは省略されている。

[備考]
NotifyTeredoPortChange 関数は Windows Vista 以降で定義される。GetTeredoPort で
Teredo クライアントが使用する初期 UDP ポート番号を取得できる。Teredo
ポートは動的でクライアントの再起動ごとに変化しうる。アプリケーションは NotifyTeredoPortChange で Teredo
サービスポート変更通知の登録ができる。Callback の呼び出しはシリアライズされる。コールバック関数は VOID
型で定義する。渡されるパラメータは次のとおり:
このドキュメントは省略されている。


%index
NotifyUnicastIpAddressChange
ローカルコンピュータ上のすべてのユニキャスト IP インターフェイス、ユニキャスト IPv4 アドレス、ユニキャスト IPv6 アドレスの変更通知を登録する。
%prm
Family, Callback, CallerContext, InitialNotification, NotificationHandle
Family : [int] 変更通知を登録するアドレスファミリ。アドレスファミリの値は Winsock2.h で定義される。AF_ と PF_ の定数は等価 (例: AF_INET と PF_INET) である。Windows Vista 以降向け SDK では Ws2def.h で定義される。Ws2def.h は Winsock2.h から自動インクルードされるので直接使用してはならない。現在サポートされる値は AF_INET、AF_INET6、AF_UNSPEC である。
Callback : [int] 変更発生時に呼び出す関数へのポインタ。ユニキャスト IP アドレス通知受信時に起動される。
CallerContext : [intptr] インターフェイス通知受信時に Callback に渡されるユーザコンテキスト。
InitialNotification : [int] 変更通知の登録完了直後にコールバックを起動するかどうかを示す値。この初回通知はユニキャスト IP アドレスの変更を示すものではなく、コールバックの登録確認のためのものである。
NotificationHandle : [intptr] 変更通知の解除に後で使用できるハンドルを返すためのポインタ。成功時はハンドルが返され、エラー時は NULL が返される。
%inst
ローカルコンピュータ上のすべてのユニキャスト IP インターフェイス、ユニキャスト IPv4 アドレス、ユニキャスト IPv6
アドレスの変更通知を登録する。

[戻り値]
関数が成功すると、戻り値は NO_ERROR である。失敗した場合は以下のエラーコードのいずれかが返される。
このドキュメントは省略されている。

[備考]
NotifyUnicastIpAddressChange 関数は Windows Vista 以降で定義される。Family は
AF_INET、AF_INET6、AF_UNSPEC のいずれかでなければならない。Callback
の呼び出しはシリアライズされる。コールバック関数は VOID 型で定義する。コールバックに渡されるパラメータは次のとおり:
このドキュメントは省略されている。


%index
ParseNetworkString
入力ネットワーク文字列を解析し、指定した IP ネットワーク文字列型の正当な表現であるかを確認する。一致すれば任意で解析結果を返せる。
%prm
NetworkString, Types, AddressInfo, PortNumber, PrefixLength
NetworkString : [wstr] 解析する NULL 終端のネットワーク文字列へのポインタ。
Types : [int] 解析する IP ネットワーク文字列の種別。このパラメータは Iphlpapi.h ヘッダで定義されるネットワーク文字列種別の一つである。
AddressInfo : [var] 成功時、NULL 以外のポインタが渡されていれば、解析された IP アドレス情報を含む NET_ADDRESS_INFO 構造体へのポインタを返す。
PortNumber : [var] 成功時、NULL 以外のポインタが渡されていれば、解析されたネットワークポート (ホストバイト順) へのポインタを返す。NetworkString にポートが含まれていない場合は 0 を指すポインタが返される。
PrefixLength : [var] 成功時、NULL 以外のポインタが渡されていれば、解析されたプレフィックス長へのポインタを返す。NetworkString にプレフィックスが含まれていない場合は -1 を指すポインタが返される。
%inst
入力ネットワーク文字列を解析し、指定した IP ネットワーク文字列型の正当な表現であるかを確認する。一致すれば任意で解析結果を返せる。

[戻り値]
関数が成功すると、戻り値は ERROR_SUCCESS である。失敗した場合は以下のエラーコードのいずれかが返される。
このドキュメントは省略されている。

[備考]
ParseNetworkString 関数は NetworkString に渡された入力ネットワーク文字列を解析し、Types
で指定した文字列種別の正当な表現であるかを確認する。一致すれば成功し、AddressInfo / PortNumber /
PrefixLength が NULL 以外ならそこに結果を返す。IPv4 / IPv6 アドレス、サービス、ネットワーク表現、および
DNS 名を用いた名前付きインターネットアドレス/サービスを解析できる。
AddressInfo が指す NET_ADDRESS_INFO 構造体について、SOCKADDR_IN および SOCKADDR は
Ws2def.h (Winsock2.h から自動インクルード) で定義される。SOCKADDR_IN6 は Ws2ipdef.h
(Ws2tcpip.h から自動インクルード) で定義される。ParseNetworkString と NET_ADDRESS_INFO
を使用するには、Winsock2.h と Ws2tcpip.h を Iphlpapi.h より前にインクルードする必要がある。


%index
PfAddFiltersToInterface
(no summary)
%prm
ih, cInFilters, pfiltIn, cOutFilters, pfiltOut, pfHandle
ih : [intptr] 
cInFilters : [int] 
pfiltIn : [var] 
cOutFilters : [int] 
pfiltOut : [var] 
pfHandle : [var] 
%inst



%index
PfAddGlobalFilterToInterface
(no summary)
%prm
pInterface, gfFilter
pInterface : [intptr] 
gfFilter : [int] 
%inst



%index
PfBindInterfaceToIPAddress
(no summary)
%prm
pInterface, pfatType, IPAddress
pInterface : [intptr] 
pfatType : [int] 
IPAddress : [var] 
%inst



%index
PfBindInterfaceToIndex
(no summary)
%prm
pInterface, dwIndex, pfatLinkType, LinkIPAddress
pInterface : [intptr] 
dwIndex : [int] 
pfatLinkType : [int] 
LinkIPAddress : [var] 
%inst



%index
PfCreateInterface
(no summary)
%prm
dwName, inAction, outAction, bUseLog, bMustBeUnique, ppInterface
dwName : [int] 
inAction : [int] 
outAction : [int] 
bUseLog : [int] 
bMustBeUnique : [int] 
ppInterface : [var] 
%inst



%index
PfDeleteInterface
(no summary)
%prm
pInterface
pInterface : [intptr] 
%inst



%index
PfDeleteLog
(no summary)
%prm

%inst



%index
PfGetInterfaceStatistics
(no summary)
%prm
pInterface, ppfStats, pdwBufferSize, fResetCounters
pInterface : [intptr] 
ppfStats : [var] 
pdwBufferSize : [var] 
fResetCounters : [int] 
%inst



%index
PfMakeLog
(no summary)
%prm
hEvent
hEvent : [intptr] 
%inst



%index
PfRebindFilters
(no summary)
%prm
pInterface, pLateBindInfo
pInterface : [intptr] 
pLateBindInfo : [var] 
%inst



%index
PfRemoveFilterHandles
(no summary)
%prm
pInterface, cFilters, pvHandles
pInterface : [intptr] 
cFilters : [int] 
pvHandles : [var] 
%inst



%index
PfRemoveFiltersFromInterface
(no summary)
%prm
ih, cInFilters, pfiltIn, cOutFilters, pfiltOut
ih : [intptr] 
cInFilters : [int] 
pfiltIn : [var] 
cOutFilters : [int] 
pfiltOut : [var] 
%inst



%index
PfRemoveGlobalFilterFromInterface
(no summary)
%prm
pInterface, gfFilter
pInterface : [intptr] 
gfFilter : [int] 
%inst



%index
PfSetLogBuffer
(no summary)
%prm
pbBuffer, dwSize, dwThreshold, dwEntries, pdwLoggedEntries, pdwLostEntries, pdwSizeUsed
pbBuffer : [var] 
dwSize : [int] 
dwThreshold : [int] 
dwEntries : [int] 
pdwLoggedEntries : [var] 
pdwLostEntries : [var] 
pdwSizeUsed : [var] 
%inst



%index
PfTestPacket
(no summary)
%prm
pInInterface, pOutInterface, cBytes, pbPacket, ppAction
pInInterface : [intptr] 
pOutInterface : [intptr] 
cBytes : [int] 
pbPacket : [var] 
ppAction : [var] 
%inst



%index
PfUnBindInterface
(no summary)
%prm
pInterface
pInterface : [intptr] 
%inst



%index
ResolveIpNetEntry2
ローカルコンピュータ上の近隣 IP アドレスエントリの物理アドレスを解決する。(ResolveIpNetEntry2)
%prm
Row, SourceAddress
Row : [var] 近隣 IP アドレスエントリの MIB_IPNET_ROW2 構造体エントリへのポインタ。正常終了時、この構造体は近隣 IP アドレスのプロパティで更新される。
SourceAddress : [var] 近隣 IP アドレスエントリの要求を送信するインターフェイスを選択するための、オプションの送信元 IP アドレスへのポインタ。
%inst
ローカルコンピュータ上の近隣 IP アドレスエントリの物理アドレスを解決する。(ResolveIpNetEntry2)

[戻り値]
関数が成功すると、戻り値は NO_ERROR である。失敗した場合は以下のエラーコードのいずれかが返される。
このドキュメントは省略されている。

[備考]
ResolveIpNetEntry2 関数は Windows Vista 以降で定義される。ローカルコンピュータ上の近隣 IP
アドレスエントリの物理アドレスを解決するために使用される。インターフェイス上で該当 IP
アドレスに合致する既存の近隣エントリをフラッシュしてから、IPv4 なら ARP 要求、IPv6 なら近隣要請要求を送信して物理
(MAC) アドレスを解決する。SourceAddress が指定されている場合、その送信元 IP
を持つインターフェイスから要求を送る。指定がない (NULL) 場合は自動的に最適なインターフェイスが選ばれる。
Row が指す MIB_IPNET_ROW2 の Address メンバは有効な IPv4 / IPv6
アドレスとファミリで初期化しなければならない。また InterfaceLuid または InterfaceIndex
のいずれかを初期化する必要があり、列挙順で使用される (InterfaceLuid が 0 なら
InterfaceIndex)。Address
が既存の近隣エントリと重複する場合、まず既存エントリをフラッシュしてから解決する。呼び出し成功時、ResolveIpNetEntry2
は他のプロパティを取得して Row に埋める。PhysicalAddress と PhysicalAddressLength
は有効な物理アドレスで初期化される。


%index
ResolveNeighbor
ローカルコンピュータ上の近隣 IP アドレスエントリの物理アドレスを解決する。(ResolveNeighbor)
%prm
NetworkAddress, PhysicalAddress, PhysicalAddressLength
NetworkAddress : [var] 近隣 IP アドレスエントリとアドレスファミリを含む SOCKADDR 構造体へのポインタ。
PhysicalAddress : [intptr] 関数が成功した場合、NetworkAddress で指定された IP アドレスに対応する物理アドレスを受け取るバイト配列バッファへのポインタ。配列の長さは PhysicalAddressLength で渡される。
PhysicalAddressLength : [var] 入力時、このパラメータは PhysicalAddress で渡すバッファの最大長 (バイト単位) を指定する。関数が成功すると、このパラメータは PhysicalAddress に返された物理アドレスの長さを受け取る。ERROR_BUFFER_OVERFLOW が返された場合は物理アドレスに必要なバイト数が格納される。
%inst
ローカルコンピュータ上の近隣 IP アドレスエントリの物理アドレスを解決する。(ResolveNeighbor)

[戻り値]
ResolveNeighbor 関数は常に失敗し、以下のエラーコードを返す。
このドキュメントは省略されている。


%index
RestoreMediaSense
RestoreMediaSense 関数は、以前に DisableMediaSense を呼び出したローカルコンピュータ上の TCP/IP スタックのメディアセンス機能を復元する。
%prm
pOverlapped, lpdwEnableCount
pOverlapped : [var] OVERLAPPED 構造体へのポインタ。hEvent メンバ以外はすべて 0 に設定し、hEvent には有効なイベントオブジェクトへのハンドルを設定する。CreateEvent でイベントオブジェクトを作成する。
lpdwEnableCount : [var] RestoreMediaSense が成功した場合、残っている参照数を受け取るオプションの DWORD 変数へのポインタ。この変数は EnableRouter / UnenableRouter でも使用される。
%inst
RestoreMediaSense 関数は、以前に DisableMediaSense を呼び出したローカルコンピュータ上の TCP/IP
スタックのメディアセンス機能を復元する。

[戻り値]
関数が成功すると、戻り値は NO_ERROR である。失敗した場合は以下のエラーコードのいずれかが返される。
このドキュメントは省略されている。

[備考]
pOverlapped が NULL なら RestoreMediaSense は同期実行され、そうでなければ OVERLAPPED
を用いて非同期実行される。DisableMediaSense は後に RestoreMediaSense
が呼ばれるまで完了しない。その間、I/O 要求パケット (IRP) はキューに残る。また、DisableMediaSense
を呼び出したプロセスが終了すると IRP はキャンセルされ、キャンセルルーチンによりメディアセンス機能が再度復元される。
同期呼び出しでは NULL を渡し、IRP 完了時に関数が返る。非同期呼び出しでは OVERLAPPED を割り当て、hEvent 以外を
0、hEvent に CreateEvent のハンドルを設定する。非同期時は ERROR_IO_PENDING を返すことがある。IRP
はメディアセンス機能復元時に完了する。イベントオブジェクトが不要になれば CloseHandle でハンドルをクローズする
(プロセス終了時は自動クローズ)。DisableMediaSense が先に呼ばれていない場合、RestoreMediaSense は
ERROR_INVALID_PARAMETER を返す。Windows Server 2003 / Windows XP
では、TCP/IP スタックが物理ネットワークインターフェイスのメディアセンス切断イベントに応じてインターフェイスの全 IP
アドレスを削除するポリシーを実装している。スイッチやハブの電源断、ケーブル切断などで切断イベントが発生すると IP 設定情報が失われ、IP
ヘルパ経由の取得にも表示されなくなる。この挙動はサーバやクラスタに影響し得るため、DisableMediaSense
で一時的にメディアセンス機能を無効化し、後で RestoreMediaSense を呼び出して復元できる。関連するレジストリ設定:
System\CurrentControlSet\Services\Tcpip\Parameters\DisableDHCPMediaSense
マシン起動時にこのレジストリキーが存在すれば内部フラグがセットされる。同じ内部フラグは DisableMediaSense /
RestoreMediaSense でも設定/解除される。レジストリ設定による変更は再起動が必要。
Windows Vista 以降の TCP/IP スタックは切断時にインターフェイスを隠さなくなったため、これらの関数は何もせず常に
NO_ERROR を返す。


%index
SendARP
SendARP 関数は、指定した宛先 IPv4 アドレスに対応する物理アドレスを取得するために、ARP (Address Resolution Protocol) 要求を送信する。
%prm
DestIP, SrcIP, pMacAddr, PhyAddrLen
DestIP : [int] 宛先 IPv4 アドレス。IPAddr 構造体の形式で指定する。ARP 要求はこの IPv4 アドレスに対応する物理アドレスの取得を試みる。
SrcIP : [int] 送信元 IPv4 アドレス。IPAddr 構造体の形式で指定する。任意で、ARP エントリ要求を送信するインターフェイスを選択するために用いる。呼び出し元はこのパラメータに INADDR_ANY に対応するゼロを指定できる。
pMacAddr : [intptr] ULONG 変数配列へのポインタ。Ethernet / トークンリングの物理アドレスを保持するため、少なくとも 2 つの ULONG 要素を持つ必要がある。配列の最初の 6 バイトに、DestIP に対応する物理アドレスが格納される。
PhyAddrLen : [var] 入力時、アプリケーションが物理 (MAC) アドレスを受け取るために確保したバッファの最大サイズ (バイト単位) を指定する ULONG 値へのポインタ。Ethernet / トークンリングの物理アドレスを格納するには少なくとも 6 バイトが必要。物理アドレスを受け取るバッファは pMacAddr が指す。正常終了時、このパラメータは pMacAddr に書き込まれたバイト数を指す値となる。
%inst
SendARP 関数は、指定した宛先 IPv4 アドレスに対応する物理アドレスを取得するために、ARP (Address
Resolution Protocol) 要求を送信する。

[戻り値]
関数が成功すると、戻り値は NO_ERROR である。失敗した場合は以下のエラーコードのいずれかが返される。
このドキュメントは省略されている。

[備考]
SendARP 関数は、指定した宛先 IPv4 アドレスに対応する物理ハードウェアアドレス (MAC アドレス)
を要求する。要求された情報がローカル ARP テーブルに存在しない場合、SendARP は ARP
要求を送信して物理アドレスを取得する。成功時、対応する物理アドレスは pMacAddr の配列に返される。物理アドレスは宛先 IPv4
がローカルサブネット上にある場合にのみ取得可能で、ルータを経由する場合は失敗する。Windows Vista 以降では成功時にローカル
ARP テーブルが更新されるが、Windows Server 2003 以前では影響はない。
Windows Vista 以降では、pMacAddr や PhyAddrLen に NULL
を渡すとアクセス違反で終了する。ERROR_BAD_NET_NAME、ERROR_BUFFER_OVERFLOW、ERROR_NOT_FOUND
が返る場合、PhyAddrLen は 0 に設定される。PhyAddrLen が 6 未満なら ERROR_BUFFER_OVERFLOW
を返す。SrcIp にローカルコンピュータ以外の IPv4 を指定すると ERROR_NOT_FOUND となる。Windows
Server 2003 以前では、NULL を渡すと ERROR_INVALID_PARAMETER
が返り、ERROR_GEN_FAILURE または ERROR_INVALID_USER_BUFFER が返る場合は PhyAddrLen
が 0 になる。PhyAddrLen が 6 未満でもエラーにはならず、指定バイト数分のみ格納される。SrcIp
にローカル以外を指定しても無視される。
ARP テーブル操作には
GetIpNetTable、CreateIpNetEntry、DeleteIpNetEntry、SetIpNetEntry、FlushIpNetTable
を使う。Windows Vista 以降では ResolveIpNetEntry2 が SendARP の代替となり、IPv4 アドレスの
MIB_IPNET_ROW2 を渡せば ARP 要求が送信される。また
GetIpNetTable2、CreateIpNetEntry2、DeleteIpNetEntry2、FlushIpNetTable2、SetIpNetEntry2
も利用できる。IPAddr データ型については Windows Data Types を、IP アドレスとドット区切り 10
進表記の変換には inet_addr / inet_ntoa を参照。


%index
SetCurrentThreadCompartmentId
将来の使用のため予約されている。この関数は使用しないこと。(SetCurrentThreadCompartmentId)
%prm
CompartmentId
CompartmentId : [int] 予約済み。
%inst
将来の使用のため予約されている。この関数は使用しないこと。(SetCurrentThreadCompartmentId)


%index
SetCurrentThreadCompartmentScope
(no summary)
%prm
CompartmentScope
CompartmentScope : [int] 
%inst



%index
SetDnsSettings
(no summary)
%prm
Settings
Settings : [var] 
%inst



%index
SetIfEntry
SetIfEntry 関数は、インターフェイスの管理状態を設定する。
%prm
pIfRow
pIfRow : [var] 次の構造体へのポインタ
%inst
SetIfEntry 関数は、インターフェイスの管理状態を設定する。

[戻り値]
関数が成功すると、戻り値は NO_ERROR である。失敗した場合は以下のエラーコードのいずれかが返される。
このドキュメントは省略されている。

[備考]
SetIfEntry 関数は、ローカルコンピュータ上のインターフェイスの管理状態 (administrative status)
を設定する。pIfRow が指す MIB_IFROW の dwIndex メンバはインターフェイスインデックスで初期化しなければならない。
dwIndex が既存のインターフェイスに一致しなければ関数は失敗する。Windows Vista 以降では SetIfEntry は
Administrators グループメンバのみが呼び出せ、それ以外では ERROR_ACCESS_DENIED が返る。UAC
のため、組み込み Administrator 以外のメンバが実行する場合、マニフェストで requestedExecutionLevel
が requireAdministrator でないと失敗する。マニフェストがない場合は RunAs administrator
実行が必要である。
Note: Windows NT 4.0 および Windows 2000
以降では、この関数は特権操作を実行する。成功するには、呼び出し元が Administrators グループまたは
NetworkConfigurationOperators グループのメンバとしてログオンしている必要がある。


%index
SetInterfaceDnsSettings
Settings パラメータで指定したインターフェイス毎の DNS 設定を設定する。
%prm
Interface, Settings
Interface : [int] 型: _In_ GUID 設定が参照する COM インターフェイスの GUID。
Settings : [var] 型: _In_ const DNS_INTERFACE_SETTINGS* DNS インターフェイス設定を含む DNS_INTERFACE_SETTINGS 型構造体へのポインタ。DNS_INTERFACE_SETTINGS を指す場合は Version メンバを DNS_INTERFACE_SETTINGS_VERSION1 に、DNS_INTERFACE_SETTINGS3 を指す場合は DNS_INTERFACE_SETTINGS_VERSION3 に設定する必要がある。Flags フィールドで設定したい全オプションを指定し、対応するフィールドのみ値を格納する。対応オプションが無いその他のフィールドは 0 クリアしなければならない。
%inst
Settings パラメータで指定したインターフェイス毎の DNS 設定を設定する。

[戻り値]
成功時は NO_ERROR を返す。非 0 の戻り値は失敗を示す。


%index
SetIpForwardEntry
SetIpForwardEntry 関数は、ローカルコンピュータの IPv4 ルーティングテーブル内の既存経路を変更する。
%prm
pRoute
pRoute : [var] 既存経路の新しい情報を指定する MIB_IPFORWARDROW 構造体へのポインタ。呼び出し元はこの構造体の dwForwardProto に MIB_IPPROTO_NETMGMT を指定しなければならず、さらに dwForwardIfIndex、dwForwardDest、dwForwardMask、dwForwardNextHop、dwForwardPolicy にも値を指定する必要がある。
%inst
SetIpForwardEntry 関数は、ローカルコンピュータの IPv4 ルーティングテーブル内の既存経路を変更する。

[戻り値]
関数が成功すると、戻り値は NO_ERROR である。失敗した場合は以下のエラーコードのいずれかが返される。
このドキュメントは省略されている。

[備考]
route が指す MIB_IPFORWARDROW の dwForwardProto は MIB_IPPROTO_NETMGMT
に設定しなければならず、そうでないと SetIpForwardEntry
は失敗する。ルーティングプロトコル識別子は、指定ルーティングプロトコルの経路情報を識別するために使われる。例えば
MIB_IPPROTO_NETMGMT は DHCP や SNMP によるネットワーク管理、あるいは
CreateIpForwardEntry / DeleteIpForwardEntry / SetIpForwardEntry
の呼び出しで設定された経路情報を識別する。Windows Vista / Windows Server 2008
では、dwForwardMetric1 は関連インターフェイスの MIB_IPINTERFACE_ROW の Metric
と合算した値であり、Metric 以上でなければならない。経路メトリックを 0 に設定したい場合は、dwForwardMetric1
を関連インターフェイスの Metric と等しくする。インターフェイスメトリックは GetIpInterfaceEntry
で取得できる。Windows Vista / Server 2008 では、SetIpForwardEntry はサブインターフェイスが
1 つだけのインターフェイス (interface LUID と subinterface LUID が同一)
のみを対象とする。dwForwardIfIndex がインターフェイスを指定する。dwForwardAge は現在
SetIpForwardEntry では使われず、RRAS 実行時に MIB_IPPROTO_NETMGMT
型の経路に対してのみ使用される。INFINITE のときはタイムアウトによる削除は行われない。それ以外の値は TCP/IP
スタックが経路を削除するまでの秒数を指定する。SetIpForwardEntry で変更された経路は既定で dwForwardAge =
INFINITE
となる。dwForwardPolicy、dwForwardType、dwForwardAge、dwForwardNextHopAS、dwForwardMetric1～5
は SetIpForwardEntry では現在使われない。新規経路は CreateIpForwardEntry、取得は
GetIpForwardTable を使用する。Windows Vista 以降では SetIpForwardEntry は
Administrators グループメンバのみが呼べ、それ以外は ERROR_ACCESS_DENIED。UAC のため、組み込み
Administrator 以外は requestedExecutionLevel=requireAdministrator または
RunAs administrator が必要。
Note: Windows NT 4.0 および Windows 2000 以降では特権操作を実行する。成功には
Administrators グループまたは NetworkConfigurationOperators
グループのメンバとしてログオンしている必要がある。


%index
SetIpForwardEntry2
ローカルコンピュータ上の IP 経路エントリのプロパティを設定する。
%prm
Route
Route : [var] IP 経路エントリの MIB_IPFORWARD_ROW2 構造体エントリへのポインタ。DestinationPrefix は有効な IP 宛先プレフィックスに、NextHop は有効な IP アドレスファミリとアドレスに設定し、InterfaceLuid または InterfaceIndex を指定する必要がある。
%inst
ローカルコンピュータ上の IP 経路エントリのプロパティを設定する。

[戻り値]
関数が成功すると、戻り値は NO_ERROR である。失敗した場合は以下のエラーコードのいずれかが返される。
このドキュメントは省略されている。

[備考]
SetIpForwardEntry2 関数は Windows Vista 以降で定義される。ローカルコンピュータ上の既存 IP
経路エントリのプロパティを設定する。Route が指す構造体の DestinationPrefix は有効な IP
アドレスプレフィックスとファミリで、NextHop は有効な IP アドレスとファミリで初期化する必要がある。さらに
InterfaceLuid または InterfaceIndex のいずれかを初期化し、前者が 0 なら後者が使われる。Metric
メンバの経路メトリックオフセットは完全な経路メトリックの一部に過ぎず、関連インターフェイスの MIB_IPINTERFACE_ROW の
Metric と合計したものが完全なメトリックとなる。インターフェイスメトリックは GetIpInterfaceEntry
で取得できる。Age と Origin メンバは SetIpForwardEntry2
呼び出し時には無視され、ネットワークスタックが設定する (変更不可)。DestinationPrefix と NextHop
が既存エントリと一致しなければ失敗する。Administrators グループメンバのみが呼び出せ、それ以外は
ERROR_ACCESS_DENIED。UAC のため、組み込み Administrator 以外は
requestedExecutionLevel=requireAdministrator または RunAs administrator
実行が必要。


%index
SetIpInterfaceEntry
ローカルコンピュータ上の IP インターフェイスのプロパティを設定する。
%prm
Row
Row : [var] インターフェイスの MIB_IPINTERFACE_ROW 構造体エントリへのポインタ。入力時、Family は AF_INET6 または AF_INET に設定し、InterfaceLuid または InterfaceIndex を指定する必要がある。正常終了時、InterfaceIndex を指定していた場合には InterfaceLuid が埋められる。
%inst
ローカルコンピュータ上の IP インターフェイスのプロパティを設定する。

[戻り値]
関数が成功すると、戻り値は NO_ERROR である。失敗した場合は以下のエラーコードのいずれかが返される。
このドキュメントは省略されている。

[備考]
SetIpInterfaceEntry 関数は Windows Vista 以降で定義され、既存の IP
インターフェイスエントリを変更する。入力時、Family は AF_INET または AF_INET6、InterfaceLuid または
InterfaceIndex の少なくとも一方を初期化しなければならない。前者が 0
なら後者が使われる。出力時、InterfaceIndex 指定なら InterfaceLuid
が埋められる。MaxReassemblySize、MinRouterAdvertisementInterval、MaxRouterAdvertisementInterval、Connected、SupportsWakeUpPatterns、SupportsNeighborDiscovery、SupportsRouterDiscovery、ReachableTime、TransmitOffload、ReceiveOffload
は SetIpInterfaceEntry 呼び出し時には無視される (ネットワークスタックが設定)。通常は
GetIpInterfaceTable / GetIpInterfaceEntry で取得し、構造体を変更して
SetIpInterfaceEntry に渡す。IPv4 では SitePrefixLength は変更してはならず、0
にしなければならない。あるいは InitializeIpInterfaceEntry で既定値に初期化し、Family と
InterfaceIndex/InterfaceLuid を設定する方法もある。
セキュリティ要件の異なる複数ネットワークへの特権なし同時アクセスはセキュリティホールを生じる。典型例として VPN
とインターネットへの同時アクセスが挙げられる。Windows Server 2003 / XP は weak host model
を用い、RAS が既定経路のメトリックを増やすことでトラフィックを VPN インターフェイス経由にルーティングする。Windows
Vista 以降は strong host model が既定で、GetBestRoute2 / GetBestRoute に送信元 IP
を指定すると経路ルックアップは送信元インターフェイスに限定され、RAS
のメトリック変更の効果はない。DisableDefaultRoutes メンバを TRUE
に設定することで既定経路の使用を無効化でき、VPN
クライアントがスプリットトンネリングを制限するのに使用できる。SetIpInterfaceEntry は Administrators
グループメンバのみが呼び出せ、それ以外は ERROR_ACCESS_DENIED。UAC のため、組み込み Administrator
以外は requestedExecutionLevel=requireAdministrator または RunAs
administrator 実行が必要。


%index
SetIpNetEntry
SetIpNetEntry 関数は、ローカルコンピュータの ARP テーブル内の既存 ARP エントリを変更する。
%prm
pArpEntry
pArpEntry : [var] MIB_IPNETROW 構造体へのポインタ。この構造体の情報は変更対象のエントリと新しい情報を指定する。呼び出し元は構造体のすべてのメンバに値を指定しなければならない。
%inst
SetIpNetEntry 関数は、ローカルコンピュータの ARP テーブル内の既存 ARP エントリを変更する。

[戻り値]
関数が成功すると、戻り値は NO_ERROR である。失敗した場合は以下のエラーコードのいずれかが返される。
このドキュメントは省略されている。

[備考]
Windows Vista 以降では SetIpNetEntry は Administrators
グループメンバのみが呼び出せ、それ以外では ERROR_ACCESS_DENIED が返る。UAC のため、組み込み
Administrator 以外のメンバが実行する場合、マニフェストで
requestedExecutionLevel=requireAdministrator または RunAs administrator
実行が必要。
Note: Windows NT 4.0 および Windows 2000 以降では、この関数は特権操作を実行する。成功には
Administrators グループまたは NetworkConfigurationOperators
グループのメンバとしてログオンしている必要がある。


%index
SetIpNetEntry2
ローカルコンピュータ上の既存の近隣 IP アドレスエントリの物理アドレスを設定する。
%prm
Row
Row : [var] 近隣 IP アドレスエントリの MIB_IPNET_ROW2 構造体エントリへのポインタ。
%inst
ローカルコンピュータ上の既存の近隣 IP アドレスエントリの物理アドレスを設定する。

[戻り値]
関数が成功すると、戻り値は NO_ERROR である。失敗した場合は以下のエラーコードのいずれかが返される。
このドキュメントは省略されている。

[備考]
SetIpNetEntry2 関数は Windows Vista 以降で定義され、ローカルコンピュータ上の既存の近隣 IP
アドレスエントリの物理アドレスを設定する。Row が指す構造体の Address
メンバは有効なユニキャスト/エニーキャスト/マルチキャスト IPv4 または IPv6
アドレスとファミリで初期化し、PhysicalAddress および PhysicalAddressLength
は有効な物理アドレスで初期化する。さらに InterfaceLuid または InterfaceIndex のいずれかを初期化し、前者が
0 なら後者が使われる。Address が指定インターフェイス上の既存近隣 IP アドレスでなければ失敗する。Administrators
グループメンバのみが呼び出せ、それ以外は ERROR_ACCESS_DENIED。UAC のため、組み込み Administrator
以外は requestedExecutionLevel=requireAdministrator または RunAs
administrator 実行が必要。


%index
SetIpStatistics
SetIpStatistics 関数は、ローカルコンピュータ上の IP フォワーディングの有効/無効を切り替え、既定の TTL 値を設定する。
%prm
pIpStats
pIpStats : [var] MIB_IPSTATS 構造体へのポインタ。呼び出し元は構造体の dwForwarding と dwDefaultTTL に新しい値を設定する。一方を現在値のまま保持したい場合は MIB_USE_CURRENT_TTL または MIB_USE_CURRENT_FORWARDING を使用する。
%inst
SetIpStatistics 関数は、ローカルコンピュータ上の IP フォワーディングの有効/無効を切り替え、既定の TTL
値を設定する。

[戻り値]
関数が成功すると、戻り値は NO_ERROR である。失敗した場合は以下のエラーコードのいずれかが返される。
このドキュメントは省略されている。

[備考]
既定 TTL のみを設定する場合は SetIpTTL も使用可能。Windows Vista 以降では SetIpStatistics は
Administrators グループメンバのみが呼び出せ、それ以外は ERROR_ACCESS_DENIED。UAC のため、組み込み
Administrator 以外は requestedExecutionLevel=requireAdministrator または
RunAs administrator 実行が必要。
Note: Windows NT 4.0 および Windows 2000 以降では特権操作を実行する。成功には
Administrators グループまたは NetworkConfigurationOperators
グループのメンバとしてログオンしている必要がある。


%index
SetIpStatisticsEx
ローカルコンピュータ上の IP フォワーディングの有効/無効を切り替え、既定の TTL 値を設定する。
%prm
Statistics, Family
Statistics : [var] MIB_IPSTATS 構造体へのポインタ。呼び出し元は dwForwarding と dwDefaultTTL に新しい値を設定する。一方を現在値のまま保持したい場合は MIB_USE_CURRENT_TTL または MIB_USE_CURRENT_FORWARDING を使用する。
Family : [int] フォワーディングと TTL を設定するアドレスファミリ。値は Winsock2.h で定義される。AF_ と PF_ 定数は等価 (例: AF_INET と PF_INET)。Windows Vista 以降向け SDK では Ws2def.h で定義される。Ws2def.h は Winsock2.h から自動インクルードされるので直接使用してはならない。現在サポートされる値は AF_INET と AF_INET6。
%inst
ローカルコンピュータ上の IP フォワーディングの有効/無効を切り替え、既定の TTL 値を設定する。

[戻り値]
関数が成功すると、戻り値は NO_ERROR である。失敗した場合は以下のエラーコードのいずれかが返される。
このドキュメントは省略されている。

[備考]
既定 TTL のみを設定する場合は SetIpTTL も使用可能。SetIpStatisticsEx は Administrators
グループメンバのみが呼び出せ、それ以外は ERROR_ACCESS_DENIED。UAC のため、組み込み Administrator
以外は requestedExecutionLevel=requireAdministrator または RunAs
administrator 実行が必要。


%index
SetIpTTL
SetIpTTL 関数は、ローカルコンピュータの既定の TTL (time-to-live) 値を設定する。
%prm
nTTL
nTTL : [int] ローカルコンピュータの新しい TTL 値。
%inst
SetIpTTL 関数は、ローカルコンピュータの既定の TTL (time-to-live) 値を設定する。

[戻り値]
関数が成功すると、戻り値は NO_ERROR である。失敗した場合は以下のエラーコードのいずれかが返される。
このドキュメントは省略されている。

[備考]
既定 TTL は SetIpStatistics でも設定可能。Windows Vista 以降では SetIpTTL は
Administrators グループメンバのみが呼び出せ、それ以外は ERROR_ACCESS_DENIED。UAC のため、組み込み
Administrator 以外は requestedExecutionLevel=requireAdministrator または
RunAs administrator 実行が必要。
Note: Windows NT 4.0 および Windows 2000 以降では特権操作を実行する。成功には
Administrators グループまたは NetworkConfigurationOperators
グループのメンバとしてログオンしている必要がある。


%index
SetJobCompartmentId
(no summary)
%prm
JobHandle, CompartmentId
JobHandle : [intptr] 
CompartmentId : [int] 
%inst



%index
SetNetworkInformation
将来の使用のため予約されている。この関数は使用しないこと。(SetNetworkInformation)
%prm
NetworkGuid, CompartmentId, NetworkName
NetworkGuid : [var] 予約済み。
CompartmentId : [int] 予約済み。
NetworkName : [wstr] 予約済み。
%inst
将来の使用のため予約されている。この関数は使用しないこと。(SetNetworkInformation)


%index
SetPerTcp6ConnectionEStats
IPv6 TCP 接続の読み取り/書き込み情報の値を設定する。IPv6 TCP 接続の拡張統計の有効/無効切り替えに使用される。
%prm
Row, EstatsType, Rw, RwVersion, RwSize, Offset
Row : [var] IPv6 TCP 接続の MIB_TCP6ROW 構造体へのポインタ。
EstatsType : [int] 設定する TCP 拡張統計情報の種別。このパラメータは Rw に想定されるデータ形式を決定する。Tcpestats.h で定義される TCP_ESTATS_TYPE 列挙型の値のいずれかを指定できる。
Rw : [var] 設定する読み取り/書き込み情報を含むバッファへのポインタ。各メンバの更新方法を指定する TCP_BOOLEAN_OPTIONAL 列挙値を構造体メンバごとに格納する。
RwVersion : [int] 設定する読み取り/書き込み情報のバージョン。Windows Vista / Windows Server 2008 / Windows 7 では 0 に設定する。
RwSize : [int] Rw が指すバッファのサイズ (バイト単位)。
Offset : [int] Rw の構造体メンバへの設定対象オフセット (バイト単位)。現時点では未使用であり、0 に設定しなければならない。
%inst
IPv6 TCP 接続の読み取り/書き込み情報の値を設定する。IPv6 TCP 接続の拡張統計の有効/無効切り替えに使用される。

[戻り値]
関数が成功すると、戻り値は NO_ERROR である。失敗した場合は以下のエラーコードのいずれかが返される。
このドキュメントは省略されている。

[備考]
SetPerTcp6ConnectionEStats 関数は Windows Vista 以降で定義される。Row に渡された IPv6
TCP 接続の拡張統計の有効/無効を切り替えるために使用される。TCP 接続の拡張統計は既定では無効である。IPv6 TCP
接続の拡張統計の読み取り/書き込み情報メンバの値を設定するのに使われる。構造体の型と形式は EstatsType で指定され、Rw
にはその構造体へのポインタを渡す。設定対象メンバは Offset
で指定する。構造体のすべてのメンバを指定しなければならない。現在サポートされる TCP 接続統計のバージョンは 0
のみで、RwVersion は 0 に設定する。EstatsType に応じて渡すべき構造体型は、以下の対応表のとおりである。
このドキュメントは省略されている。


%index
SetPerTcpConnectionEStats
IPv4 TCP 接続の読み取り/書き込み情報の値を設定する。IPv4 TCP 接続の拡張統計の有効/無効切り替えに使用される。
%prm
Row, EstatsType, Rw, RwVersion, RwSize, Offset
Row : [var] IPv4 TCP 接続の MIB_TCPROW 構造体へのポインタ。
EstatsType : [int] 設定する TCP 拡張統計情報の種別。このパラメータは Rw に想定されるデータ形式を決定する。Tcpestats.h で定義される TCP_ESTATS_TYPE 列挙型の値のいずれかを指定できる。
Rw : [var] 設定する読み取り/書き込み情報を含むバッファへのポインタ。各メンバの更新方法を指定する TCP_BOOLEAN_OPTIONAL 列挙値を構造体メンバごとに格納する。
RwVersion : [int] 設定する読み取り/書き込み情報のバージョン。Windows Vista / Windows Server 2008 / Windows 7 では 0 に設定する。
RwSize : [int] Rw が指すバッファのサイズ (バイト単位)。
Offset : [int] Rw の構造体メンバへの設定対象オフセット (バイト単位)。現時点では未使用であり、0 に設定しなければならない。
%inst
IPv4 TCP 接続の読み取り/書き込み情報の値を設定する。IPv4 TCP 接続の拡張統計の有効/無効切り替えに使用される。

[戻り値]
関数が成功すると、戻り値は NO_ERROR である。失敗した場合は以下のエラーコードのいずれかが返される。
このドキュメントは省略されている。

[備考]
SetPerTcpConnectionEStats 関数は Windows Vista 以降で定義される。Row に渡された IPv4
TCP 接続の拡張統計の有効/無効を切り替えるために使用される。TCP 接続の拡張統計は既定では無効である。IPv4 TCP
接続の拡張統計の読み取り/書き込み情報メンバの値を設定するのに使われる。構造体の型と形式は EstatsType で指定され、Rw
にはその構造体へのポインタを渡す。構造体のすべてのメンバを指定しなければならない。現在サポートされる TCP 接続統計のバージョンは 0
のみで、RwVersion は 0 に設定する。EstatsType に応じて渡すべき構造体型は、以下の対応表のとおりである。
このドキュメントは省略されている。


%index
SetSessionCompartmentId
将来の使用のため予約されている。この関数は使用しないこと。(SetSessionCompartmentId)
%prm
SessionId, CompartmentId
SessionId : [int] 予約済み。
CompartmentId : [int] 予約済み。
%inst
将来の使用のため予約されている。この関数は使用しないこと。(SetSessionCompartmentId)


%index
SetTcpEntry
SetTcpEntry 関数は、TCP 接続の状態を設定する。
%prm
pTcpRow
pTcpRow : [var] MIB_TCPROW 構造体へのポインタ。この構造体は変更対象の TCP 接続を特定する情報と、新しい状態を指定する。呼び出し元はすべてのメンバに値を指定しなければならない。
%inst
SetTcpEntry 関数は、TCP 接続の状態を設定する。

[戻り値]
関数が成功した場合、NO_ERROR (ゼロ) を返す。失敗した場合は以下のエラーコードのいずれかが返される。
このドキュメントは省略されている。

[備考]
現在、TCP 接続を設定できる唯一の状態は MIB_TCP_STATE_DELETE_TCB である。Windows Vista 以降では
SetTcpEntry は Administrators グループメンバのみが呼び出せ、それ以外は
ERROR_ACCESS_DENIED。UAC のため、組み込み Administrator 以外は
requestedExecutionLevel=requireAdministrator または RunAs administrator
実行が必要。


%index
SetUnicastIpAddressEntry
ローカルコンピュータ上の既存のユニキャスト IP アドレスエントリのプロパティを設定する。
%prm
Row
Row : [var] 既存のユニキャスト IP アドレスエントリの MIB_UNICASTIPADDRESS_ROW 構造体エントリへのポインタ。
%inst
ローカルコンピュータ上の既存のユニキャスト IP アドレスエントリのプロパティを設定する。

[戻り値]
関数が成功すると、戻り値は NO_ERROR である。失敗した場合は以下のエラーコードのいずれかが返される。
このドキュメントは省略されている。

[備考]
SetUnicastIpAddressEntry 関数は Windows Vista 以降で定義される。通常は
GetUnicastIpAddressEntry で既存の MIB_UNICASTIPADDRESS_ROW
を取得し、変更したいメンバを書き換えて SetUnicastIpAddressEntry
を呼ぶ。InitializeUnicastIpAddressEntry で既定値に初期化する方法も使えるが、その際は呼び出し前に
InterfaceLuid または InterfaceIndex を保存し、呼び出し後に復元するのが普通である。Row の Address
メンバは有効なユニキャスト IPv4 または IPv6 アドレスとファミリで初期化し、InterfaceLuid または
InterfaceIndex のいずれかを初期化する (前者が 0 なら後者が使われる)。OnLinkPrefixLength を 255
に設定すると、IP アドレス長と同じ値 (IPv4 なら 32、IPv6 なら 128) に設定される。IPv4 のサブネットマスクや
IPv6
のリンクプレフィックスが不正になる場合は事前に正しい値に設定する必要がある。DadState、ScopeId、CreationTimeStamp
は呼び出し時に無視される (ネットワークスタックが設定)。ScopeId
はアドレスが追加されたインターフェイスにより自動的に決定される。Administrators グループメンバのみが呼び出せ、それ以外は
ERROR_ACCESS_DENIED。UAC のため、組み込み Administrator 以外は
requestedExecutionLevel=requireAdministrator または RunAs administrator
実行が必要。


%index
UnenableRouter
UnenableRouter 関数は、IPv4 フォワーディング有効化要求数を追跡する参照カウントを減らす。参照カウントが 0 に達すると、ローカルコンピュータの IPv4 フォワーディングをオフにする。
%prm
pOverlapped, lpdwEnableCount
pOverlapped : [var] OVERLAPPED 構造体へのポインタ。EnableRouter 呼び出しで使用したものと同一でなければならない。
lpdwEnableCount : [var] 残っている参照数を受け取るオプションの DWORD 変数へのポインタ。
%inst
UnenableRouter 関数は、IPv4 フォワーディング有効化要求数を追跡する参照カウントを減らす。参照カウントが 0
に達すると、ローカルコンピュータの IPv4 フォワーディングをオフにする。

[戻り値]
関数が成功すると、戻り値は NO_ERROR である。失敗した場合は FormatMessage
を使って返されたエラーのメッセージ文字列を取得する。

[備考]
UnenableRouter 関数は IPv4 フォワーディング専用である。各プロセスによる UnenableRouter
呼び出しは、同一プロセスによる以前の EnableRouter 呼び出しに対応している必要がある。余分な UnenableRouter
呼び出しに対してはシステムがエラーを返す。あるプロセスが別プロセスの IPv4
フォワーディング有効化要求に対する参照カウントを減らすことはできない。また、あるプロセスが有効化したフォワーディングを別プロセスが無効化することもできない。IPv4
フォワーディング有効化要求の参照カウントを正確に求めることはできないため、lpdwEnableCount には常に ULONG_MAX/2
に等しい大きな値が返される。
EnableRouter を呼び出したプロセスが UnenableRouter を呼ばずに終了した場合、システムは
UnenableRouter が呼ばれたかのように参照カウントを減らす。UnenableRouter 呼び出し後、OVERLAPPED
内のイベントオブジェクトのハンドルは CloseHandle でクローズする。

