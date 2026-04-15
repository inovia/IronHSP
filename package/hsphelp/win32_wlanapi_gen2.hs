; ============================================================
;   wlanapi.dll ヘルプ (CsWin32 / win32metadata から自動抽出)
;   docs_ja.json に日本語訳があればそちらを使用、無ければ英語原文。
;   翻訳を追加するときは docs_ja.json を編集して再生成。
; ============================================================

%type
拡張命令
%ver
1.0
%dll
wlanapi.dll
%date
2026/04/16
%author
IronHSP / CsWin32 bridge
%url
https://github.com/inovia/IronHSP
%port
Win

%note
Win32 API の wlanapi.dll 関数群。CsWin32 + win32metadata から自動生成。
hsp3net 専用 (intptr / NSTRUCT / wstr を使用)。

%group
Win32API

%index
WFDCancelOpenSession
まだ完了していない保留中の WFDStartOpenSession をアプリケーションがキャンセルしたいことを示す。
%prm
hSessionHandle
hSessionHandle : [intptr] キャンセルする Wi-Fi Direct セッションのセッション ハンドル。これは以前の WFDStartOpenSession 呼び出しで返されたセッション ハンドルである。
%inst
まだ完了していない保留中の WFDStartOpenSession をアプリケーションがキャンセルしたいことを示す。

[戻り値]
関数が成功すると、戻り値は ERROR_SUCCESS となる。関数が失敗した場合、戻り値は次のいずれかのコードとなりうる。
このドキュメントは省略されている。

[備考]
WFDCancelOpenSession は Wi-Fi Direct (Windows 8 および Windows Server
2012 の新機能) の一部である。Wi-Fi Direct は Wi-Fi Alliance の Wi-Fi Peer-to-Peer
技術仕様 v1.1 に基づいており、ワイヤレス AP やアドホック (IBSS) 機構を使わずに Wi-Fi
デバイス間の接続を可能にする。
WFDCancelOpenSession を呼び出すと、このセッションのキャンセルを Wi-Fi Direct サービスに通知する。ただし
WFDStartOpenSession の想定動作は変更されない。WFDStartOpenSession
に指定したコールバック関数は依然として呼び出され、WFDStartOpenSession
が即時に完了するとは限らない。hSessionHandle には WFDStartOpenSession
呼び出しから返されたハンドルを渡すのは呼び出し元の責任である。


%index
WFDCloseHandle
Wi-Fi Direct サービスへのハンドルを閉じる。
%prm
hClientHandle
hClientHandle : [intptr] Wi-Fi Direct サービスへのクライアント ハンドル。WFDOpenHandle の以前の呼び出しで取得する。
%inst
Wi-Fi Direct サービスへのハンドルを閉じる。

[戻り値]
関数が成功すると、戻り値は ERROR_SUCCESS となる。関数が失敗した場合、戻り値は次のいずれかのコードとなりうる。
このドキュメントは省略されている。

[備考]
WFDCloseHandle は Wi-Fi Direct (Windows 8 および Windows Server 2012)
の一部である。Wi-Fi Direct を使用するにはまず WFDOpenHandle を呼び出して Wi-Fi Direct
サービスへのハンドルを取得する必要がある。得られた WFD ハンドルは以降の Wi-Fi Direct
サービス呼び出しで使用する。使い終わったら WFDCloseHandle を呼び出してサービスへ通知し、リソースを解放できるようにする。


%index
WFDCloseSession
WFDStartOpenSession の成功呼び出し後にセッションを閉じる。
%prm
hSessionHandle
hSessionHandle : [intptr] Wi-Fi Direct セッションへのセッション ハンドル。以前の WFDStartOpenSession 呼び出しから返されたもの。
%inst
WFDStartOpenSession の成功呼び出し後にセッションを閉じる。

[戻り値]
関数が成功すると、戻り値は ERROR_SUCCESS となる。関数が失敗した場合、戻り値は次のいずれかのコードとなりうる。
このドキュメントは省略されている。

[備考]
WFDCloseSession は Wi-Fi Direct (Windows 8 / Windows Server 2012)
の一部である。この関数はセッション切断のための作業項目を将来キューに入れるため、切断は即時とは限らない。WFDStartOpenSession
呼び出しが保留中に WFDCloseSession を呼んでもセッションは閉じられない。hSessionHandle には成功した非同期の
WFDStartOpenSession
呼び出しから返されたハンドルを渡すのは呼び出し元の責任である。既に無効となったハンドルを渡した場合の結果は未定義である。


%index
WFDOpenHandle
Wi-Fi Direct サービスへのハンドルを開き、使用する Wi-Fi Direct API バージョンをネゴシエートする。
%prm
dwClientVersion, pdwNegotiatedVersion, phClientHandle
dwClientVersion : [int] クライアントがサポートする Wi-Fi Direct API の最高バージョン。Windows 8 および Windows Server 2012 では、このパラメータは Wlanapi.h で定義される WFD_API_VERSION を設定する。
pdwNegotiatedVersion : [var] ネゴシエートされたバージョンを受け取る DWORD へのポインタ。WFDOpenHandle が成功すると、このセッションで使用される Wi-Fi Direct サービスとネゴシエートされたバージョンが返る。通常はクライアントとサービスの両方がサポートする最高バージョン。
phClientHandle : [intptr] このセッション用の Wi-Fi Direct サービスへのハンドルを受け取る HANDLE へのポインタ。関数が成功するとこのセッション用ハンドルが返る。
%inst
Wi-Fi Direct サービスへのハンドルを開き、使用する Wi-Fi Direct API バージョンをネゴシエートする。

[戻り値]
関数が成功すると、戻り値は ERROR_SUCCESS となる。関数が失敗した場合、戻り値は次のいずれかのコードとなりうる。
このドキュメントは省略されている。

[備考]
WFDOpenHandle は Wi-Fi Direct (Windows 8 / Windows Server 2012)
の一部である。Wi-Fi Direct
を使用するにはまずこの関数でサービスへのハンドルを取得する必要がある。返されたハンドルは以降の呼び出しで使用する。使い終わったら
WFDCloseHandle を呼んでサービスに通知し、リソースを解放できるようにする。


%index
WFDOpenLegacySession
Wi-Fi Direct レガシー デバイスの保存済みプロファイルを取得して適用する。
%prm
hClientHandle, pLegacyMacAddress, phSessionHandle, pGuidSessionInterface
hClientHandle : [intptr] このセッション用の Wi-Fi Direct サービスへのハンドル。WFDOpenHandle で取得する。
pLegacyMacAddress : [var] レガシー クライアント デバイスの Wi-Fi Direct デバイス アドレスへのポインタ。
phSessionHandle : [intptr] このセッション用の Wi-Fi Direct サービスへのハンドルを受け取る HANDLE へのポインタ。
pGuidSessionInterface : [var] このセッションのネットワーク インターフェイスの GUID へのポインタ。関数が成功すると Wi-Fi Direct セッションを実行するネットワーク インターフェイスの GUID が返る。
%inst
Wi-Fi Direct レガシー デバイスの保存済みプロファイルを取得して適用する。

[戻り値]
関数が成功すると、戻り値は ERROR_SUCCESS となる。関数が失敗した場合、戻り値は次のいずれかのコードとなりうる。
このドキュメントは省略されている。

[備考]
WFDOpenLegacySession は Wi-Fi Direct (Windows 8 / Windows Server 2012)
の一部である。Wi-Fi Direct を使用するにはまず WFDOpenLegacySession または WFDOpenHandle
を呼んでサービスへのハンドルを取得する。WFDOpenLegacySession は指定レガシー デバイス
アドレスについて保存済みのレガシー プロファイルを取得し適用する。デバイス アドレスはインボックス ペアリング (Legacy WPS
Pairing) の結果作成されたデバイス ノードから取得する必要がある。使い終わったら WFDCloseSession
でセッションを閉じ、さらに WFDCloseHandle でサービスに通知する。


%index
WFDStartOpenSession
Windows ペアリング エクスペリエンスで以前にペアリング済みの特定の Wi-Fi Direct デバイスへのオンデマンド接続を開始する。
%prm
hClientHandle, pDeviceAddress, pvContext, pfnCallback, phSessionHandle
hClientHandle : [intptr] Wi-Fi Direct サービスへのクライアント ハンドル。WFDOpenHandle の以前の呼び出しで取得する。
pDeviceAddress : [var] ターゲット デバイスの Wi-Fi Direct デバイス アドレス (MAC アドレス) へのポインタ。
pvContext : [intptr] pfnCallback で指定したコールバック関数に渡されるオプションのコンテキスト ポインタ。
pfnCallback : [int] WFDStartOpenSession 要求が完了したときに呼び出されるコールバック関数へのポインタ。
phSessionHandle : [intptr] この特定の Wi-Fi Direct セッションへのハンドル。
%inst
Windows ペアリング エクスペリエンスで以前にペアリング済みの特定の Wi-Fi Direct
デバイスへのオンデマンド接続を開始する。

[戻り値]
関数が成功すると、戻り値は ERROR_SUCCESS となる。関数が失敗した場合、戻り値は次のいずれかのコードとなりうる。
このドキュメントは省略されている。

[備考]
WFDStartOpenSession は Wi-Fi Direct (Windows 8 / Windows Server 2012)
の一部である。この関数は、特定の Wi-Fi Direct デバイスへのオンデマンド接続を開始する非同期操作を開始する。ターゲットは事前に
Windows ペアリング エクスペリエンスでペアリング済みでなければならない。非同期操作が完了すると pfnCallback
のコールバックが呼び出される。非同期完了前に WFDCloseHandle を呼んだ場合、WFDCloseHandle は
WFDStartOpenSession の完了まで待機する。


%index
WFDUpdateDeviceVisibility
インストール済みの Wi-Fi Direct デバイス ノードの Wi-Fi Direct デバイス アドレスについてデバイスの可視性を更新する。
%prm
pDeviceAddress
pDeviceAddress : [var] クライアント デバイスの Wi-Fi Direct デバイス アドレスへのポインタ。インボックス ペアリング エクスペリエンスの結果作成されたデバイス ノードから取得する。
%inst
インストール済みの Wi-Fi Direct デバイス ノードの Wi-Fi Direct デバイス
アドレスについてデバイスの可視性を更新する。

[戻り値]
関数が成功すると、戻り値は ERROR_SUCCESS となる。関数が失敗した場合、戻り値は次のいずれかのコードとなりうる。
このドキュメントは省略されている。

[備考]
WFDUpdateDeviceVisibility は Wi-Fi Direct (Windows 8 / Windows Server
2012) の一部である。この関数はターゲットを絞った Wi-Fi Direct 探索を実行し、指定デバイスのデバイス ノードの
DEVPKEY_WiFiDirect_IsVisibile プロパティ キーを更新する。


%index
WlanAllocateMemory
メモリを確保する。
%prm
dwMemorySize
dwMemorySize : [int] 要求するメモリ量 (バイト単位)。
%inst
メモリを確保する。

[戻り値]
呼び出しが成功するとアロケートされたメモリへのポインタを返す。何らかの理由でメモリを確保できないか dwMemorySize が 0
の場合、返されるポインタは NULL となる。拡張エラー情報を取得するには GetLastError を呼び出す。


%index
WlanCloseHandle
サーバーへの接続を閉じる。
%prm
hClientHandle, pReserved
hClientHandle : [intptr] 閉じる接続を識別するクライアントのセッション ハンドル。WlanOpenHandle の以前の呼び出しで取得する。
pReserved : [intptr] 将来の使用のために予約されている。NULL を設定する。
%inst
サーバーへの接続を閉じる。

[戻り値]
関数が成功すると、戻り値は ERROR_SUCCESS となる。関数が失敗した場合、戻り値は次のいずれかのコードとなりうる。
このドキュメントは省略されている。

[備考]
接続を閉じた後に閉じたハンドルを使用すると予期しないエラーが発生しうる。閉じる際、保留中の通知はすべて破棄される。コールバック関数内から
WlanCloseHandle
を呼び出してはならない。通知コールバック処理中に呼び出された場合、関数はコールバックの完了を待ってから値を返す。コールバック内から呼び出すと呼び出しは完了しない。コールバック関数とハンドルを閉じるスレッドが同じロックを取得しようとするとデッドロックが発生しうる。またアプリケーション
DLL の DllMain からも呼び出してはならない。


%index
WlanConnect
特定のネットワークへの接続を試みる。
%prm
hClientHandle, pInterfaceGuid, pConnectionParameters, pReserved
hClientHandle : [intptr] WlanOpenHandle の以前の呼び出しで返されたクライアントのセッション ハンドル。
pInterfaceGuid : [var] 接続に使用するインターフェイスの GUID。
pConnectionParameters : [var] 接続種別、モード、ネットワーク プロファイル、ネットワークを識別する SSID、その他のパラメータを指定する WLAN_CONNECTION_PARAMETERS 構造体へのポインタ。Windows XP SP3 および Windows XP SP2 用 Wireless LAN API: WLAN_CONNECTION_PARAMETERS のメンバーには一部制約があり、Windows Server 2008 および Windows Vista で有効な構造体が XP では無効となる場合がある。制約一覧は WLAN_CONNECTION_PARAMETERS を参照。
pReserved : [intptr] 将来の使用のために予約されている。NULL を設定する必要がある。
%inst
特定のネットワークへの接続を試みる。

[戻り値]
関数が成功すると、戻り値は ERROR_SUCCESS となる。関数が失敗した場合、戻り値は次のいずれかのコードとなりうる。
このドキュメントは省略されている。

[備考]
WlanConnect は即時に戻る。接続が確立または失敗したときに通知を受け取るには WlanRegisterNotification
で通知を登録する必要がある。pConnectionParameters が指す WLAN_CONNECTION_PARAMETERS の
strProfile
メンバーで使用するプロファイルを指定する。すべてのユーザー用プロファイルの場合、呼び出し元はプロファイルに対する実行アクセス権が必要で、そうでなければ
ERROR_ACCESS_DENIED で失敗する。アクセス権は WlanSetProfile または
WlanSaveTemporaryProfile でプロファイル作成時に確立される。コマンドラインからは netsh wlan
connect を使う。Windows XP SP3 および Windows XP SP2 用 API: WlanConnect
は優先ネットワーク リストにあるネットワークにのみ接続できる。新規追加には WlanSetProfile を呼ぶ。


%index
WlanDeleteProfile
ローカル コンピュータのワイヤレス インターフェイス用のワイヤレス プロファイルを削除する。
%prm
hClientHandle, pInterfaceGuid, strProfileName, pReserved
hClientHandle : [intptr] WlanOpenHandle の以前の呼び出しで取得したクライアントのセッション ハンドル。
pInterfaceGuid : [var] プロファイルを削除するインターフェイスの GUID。
strProfileName : [wstr] 削除するプロファイルの名前。プロファイル名は大文字と小文字を区別する。この文字列は NULL 終端でなければならない。Windows XP SP3 および Windows XP SP2 用 Wireless LAN API: 名前はネットワークの SSID から自動生成された名前と一致しなければならない。インフラストラクチャ ネットワーク プロファイルでは SSID、アドホックではその SSID に -adhoc を付加したもの。
pReserved : [intptr] 将来の使用のために予約されている。NULL を設定する必要がある。
%inst
ローカル コンピュータのワイヤレス インターフェイス用のワイヤレス プロファイルを削除する。

[戻り値]
関数が成功すると、戻り値は ERROR_SUCCESS となる。関数が失敗した場合、戻り値は次のいずれかのコードとなりうる。
このドキュメントは省略されている。

[備考]
WlanDeleteProfile はローカル コンピュータのワイヤレス インターフェイスのプロファイルを削除する。すべての WLAN
関数はプロファイル操作の際にインターフェイス GUID を必要とする。ワイヤレス インターフェイスが取り外されると WLANSVC
から状態がクリアされ、プロファイル操作は不可能となる。指定インターフェイスがシステムから取り外されている場合 (例えば USB
アダプタが取り外された場合)、この関数は ERROR_INVALID_PARAMETER で失敗しうる。コマンドラインからは netsh
wlan delete profile を使う。


%index
WlanDeviceServiceCommand
OEM または IHV コンポーネントが特定のワイヤレス LAN インターフェイス上のデバイス サービスと通信できるようにする。
%prm
hClientHandle, pInterfaceGuid, pDeviceServiceGuid, dwOpCode, dwInBufferSize, pInBuffer, dwOutBufferSize, pOutBuffer, pdwBytesReturned
hClientHandle : [intptr] 型: HANDLE WlanOpenHandle の以前の呼び出しで取得したクライアントのセッション ハンドル。
pInterfaceGuid : [var] 型: CONST GUID* 問い合わせるワイヤレス LAN インターフェイスの GUID へのポインタ。各ワイヤレス LAN インターフェイスの GUID は WlanEnumInterfaces で取得できる。
pDeviceServiceGuid : [var] 型: GUID* このコマンド対象のデバイス サービスを識別する GUID。
dwOpCode : [int] 型: DWORD デバイス サービスで実行する操作を識別するオペレーショナル コード。
dwInBufferSize : [int] 型: DWORD 入力バッファのサイズ (バイト単位)。
pInBuffer : [intptr] 型: PVOID コマンド入力用の汎用バッファ。
dwOutBufferSize : [int] 型: DWORD 出力バッファのサイズ (バイト単位)。
pOutBuffer : [intptr] 型: PVOID コマンド出力用の汎用バッファ。
pdwBytesReturned : [var] 型: PDWORD 返されたバイト数。
%inst
OEM または IHV コンポーネントが特定のワイヤレス LAN インターフェイス上のデバイス サービスと通信できるようにする。

[戻り値]
型: HRESULT 関数が成功すると戻り値は ERROR_SUCCESS となる。ERROR_ACCESS_DENIED
で失敗した場合、呼び出し元がこの操作に必要な権限を持っていない。呼び出し元は管理者権限を持つか UMDF ドライバである必要がある。


%index
WlanDisconnect
インターフェイスを現在のネットワークから切断する。
%prm
hClientHandle, pInterfaceGuid, pReserved
hClientHandle : [intptr] WlanOpenHandle の以前の呼び出しで取得したクライアントのセッション ハンドル。
pInterfaceGuid : [var] 切断するインターフェイスの GUID。
pReserved : [intptr] 将来の使用のために予約されている。NULL を設定する必要がある。
%inst
インターフェイスを現在のネットワークから切断する。

[戻り値]
関数が成功すると、戻り値は ERROR_SUCCESS となる。関数が失敗した場合、戻り値は次のいずれかのコードとなりうる。
このドキュメントは省略されている。

[備考]
WlanConnect で接続を確立した際に指定されたプロファイルがすべてのユーザー用プロファイルの場合、WlanDisconnect
の呼び出し元はそのプロファイルに対する実行アクセス権が必要で、そうでなければ ERROR_ACCESS_DENIED
で失敗する。コマンドラインからは netsh wlan disconnect を使う。Windows XP SP3 および Windows
XP SP2 用 API: WlanDisconnect にはプロファイルをオンデマンド
プロファイルに変更するという副作用がある。オンデマンド プロファイルのネットワークには Wireless Zero
Configuration サービスが自動接続しない。プロファイルをオンデマンドに変更したい場合以外は、WlanConnect
の前に呼ぶべきではない。WlanConnect で接続を確立すると既存接続は自動的に切断される。


%index
WlanEnumInterfaces
ローカル コンピュータで現在有効なすべてのワイヤレス LAN インターフェイスを列挙する。
%prm
hClientHandle, pReserved, ppInterfaceList
hClientHandle : [intptr] WlanOpenHandle の以前の呼び出しで取得したクライアントのセッション ハンドル。
pReserved : [intptr] 将来の使用のために予約されている。NULL を設定する必要がある。
ppInterfaceList : [var] 返されるワイヤレス LAN インターフェイスのリスト (WLAN_INTERFACE_INFO_LIST 構造体) を受け取るポインタへのポインタ。成功時バッファは WlanEnumInterfaces が確保する。
%inst
ローカル コンピュータで現在有効なすべてのワイヤレス LAN インターフェイスを列挙する。

[戻り値]
関数が成功すると、戻り値は ERROR_SUCCESS となる。関数が失敗した場合、戻り値は次のいずれかのコードとなりうる。
このドキュメントは省略されている。

[備考]
WlanEnumInterfaces は成功時に ppInterfaceList が指すバッファ用のメモリを確保する。不要になったら
WlanFreeMemory で解放する。


%index
WlanExtractPsdIEDataList
ビーコンに含まれる生 IE データから近接サービス検出 (PSD) IE データ リストを抽出する。
%prm
hClientHandle, dwIeDataSize, pRawIeData, strFormat, pReserved, ppPsdIEDataList
hClientHandle : [intptr] WlanOpenHandle の以前の呼び出しで取得したクライアントのセッション ハンドル。
dwIeDataSize : [int] pRawIeData パラメータのサイズ (バイト単位)。
pRawIeData : [var] リスト内のすべての IE の生 IE データ。
strFormat : [wstr] PSD IE の形式を記述する。マッチする形式の IE のみが返される。
pReserved : [intptr] 将来の使用のために予約されている。NULL を設定する必要がある。
ppPsdIEDataList : [var] 整形されたデータ リストを含む PWLAN_RAW_DATA_LIST 構造体へのポインタ。
%inst
ビーコンに含まれる生 IE データから近接サービス検出 (PSD) IE データ リストを抽出する。

[戻り値]
関数が成功すると、戻り値は ERROR_SUCCESS となる。関数が失敗した場合、戻り値は次のいずれかのコードとなりうる。
このドキュメントは省略されている。

[備考]
PSD IE および IE の形式の詳細は WlanSetPsdIEDataList を参照。


%index
WlanFreeMemory
メモリを解放する。
%prm
pMemory
pMemory : [intptr] 解放するメモリへのポインタ。
%inst
メモリを解放する。

[備考]
pMemory が既に解放済みのメモリを指していると、アクセス違反またはヒープ破壊が発生する可能性がある。Windows XP SP2 用
Wireless LAN API には、WlanFreeMemory と WlanGetAvailableNetworkList
を多数回呼ぶアプリケーションの性能を向上させる修正プログラムが存在する。


%index
WlanGetAvailableNetworkList
ワイヤレス LAN インターフェイス上の利用可能ネットワークのリストを取得する。
%prm
hClientHandle, pInterfaceGuid, dwFlags, pReserved, ppAvailableNetworkList
hClientHandle : [intptr] WlanOpenHandle の以前の呼び出しで取得したクライアントのセッション ハンドル。
pInterfaceGuid : [var] 問い合わせるワイヤレス LAN インターフェイスの GUID へのポインタ。各インターフェイスの GUID は WlanEnumInterfaces で取得できる。
dwFlags : [int] リストに返されるネットワーク種別を制御するフラグの集合。以下の値の組み合わせを指定できる。
pReserved : [intptr] 将来の使用のために予約されている。NULL を設定する必要がある。
ppAvailableNetworkList : [var] 返される利用可能ネットワーク リスト (WLAN_AVAILABLE_NETWORK_LIST 構造体) を受け取るポインタへのポインタ。成功時バッファは関数が確保する。
%inst
ワイヤレス LAN インターフェイス上の利用可能ネットワークのリストを取得する。

[戻り値]
関数が成功すると、戻り値は ERROR_SUCCESS となる。関数が失敗した場合、戻り値は次のいずれかのコードとなりうる。
このドキュメントは省略されている。

[備考]
関数が成功すると ppAvailableNetworkList が指すバッファ用のメモリを確保する。不要になったら
WlanFreeMemory で解放する。Windows XP SP2 用 Wireless LAN API には本関数と
WlanFreeMemory を多数回呼ぶ場合の性能向上の修正プログラムがある。


%index
WlanGetAvailableNetworkList2
(no summary)
%prm
hClientHandle, pInterfaceGuid, dwFlags, pReserved, ppAvailableNetworkList
hClientHandle : [intptr] 
pInterfaceGuid : [var] 
dwFlags : [int] 
pReserved : [intptr] 
ppAvailableNetworkList : [var] 
%inst



%index
WlanGetFilterList
グループ ポリシーまたはユーザー権限リストを取得する。
%prm
hClientHandle, wlanFilterListType, pReserved, ppNetworkList
hClientHandle : [intptr] WlanOpenHandle の以前の呼び出しで取得したクライアントのセッション ハンドル。
wlanFilterListType : [int] フィルタ リストの種類を指定する WLAN_FILTER_LIST_TYPE 値。ユーザー定義およびグループ ポリシーのすべてのフィルタ リストを問い合わせできる。
pReserved : [intptr] 将来の使用のために予約されている。NULL を設定する必要がある。
ppNetworkList : [var] 許可または拒否されたネットワークのリストを含む DOT11_NETWORK_LIST 構造体へのポインタ。
%inst
グループ ポリシーまたはユーザー権限リストを取得する。

[戻り値]
関数が成功すると、戻り値は ERROR_SUCCESS となる。関数が失敗した場合、戻り値は次のいずれかのコードとなりうる。
このドキュメントは省略されている。

[備考]
ユーザー権限リストは WlanSetFilterList で設定できる。


%index
WlanGetInterfaceCapability
インターフェイスの機能を取得する。
%prm
hClientHandle, pInterfaceGuid, pReserved, ppCapability
hClientHandle : [intptr] WlanOpenHandle の以前の呼び出しで取得したクライアントのセッション ハンドル。
pInterfaceGuid : [var] このインターフェイスの GUID。
pReserved : [intptr] 将来の使用のために予約されている。NULL を設定する必要がある。
ppCapability : [var] 指定インターフェイスの機能情報を含む WLAN_INTERFACE_CAPABILITY 構造体。
%inst
インターフェイスの機能を取得する。

[戻り値]
関数が成功すると、戻り値は ERROR_SUCCESS となる。関数が失敗した場合、戻り値は次のいずれかのコードとなりうる。
このドキュメントは省略されている。

[備考]
ppCapability に割り当てられたメモリは呼び出し元が WlanFreeMemory で解放する責任がある。


%index
WlanGetNetworkBssList
指定のワイヤレス LAN インターフェイス上のワイヤレス ネットワークの BSS エントリ リストを取得する。
%prm
hClientHandle, pInterfaceGuid, pDot11Ssid, dot11BssType, bSecurityEnabled, pReserved, ppWlanBssList
hClientHandle : [intptr] WlanOpenHandle の以前の呼び出しで取得したクライアントのセッション ハンドル。
pInterfaceGuid : [var] 問い合わせるワイヤレス LAN インターフェイスの GUID へのポインタ。
pDot11Ssid : [var] BSS リストを要求するネットワークの SSID を指定する DOT11_SSID 構造体へのポインタ (省略可)。NULL の場合は全 BSS エントリが返される。非 NULL の場合 uSSIDLength は DOT11_SSID_MAX_LENGTH 以下である必要があり、dot11BssType および bSecurityEnabled の指定も必要。
dot11BssType : [int] ネットワークの BSS 種別。pDot11Ssid が NULL の場合は無視される。
bSecurityEnabled : [int] ネットワークでセキュリティが有効かを示す値。BSS リストを要求するネットワークの SSID が指定されている (pDot11Ssid が NULL でない) 場合にのみ有効。
pReserved : [intptr] 将来の使用のために予約されている。NULL を設定する必要がある。
ppWlanBssList : [var] 返される BSS エントリのリスト (WLAN_BSS_LIST 構造体) を受け取るポインタへのポインタ。成功時は関数が確保する。
%inst
指定のワイヤレス LAN インターフェイス上のワイヤレス ネットワークの BSS エントリ リストを取得する。

[戻り値]
関数が成功すると、戻り値は ERROR_SUCCESS となる。関数が失敗した場合、戻り値は次のいずれかのコードとなりうる。
このドキュメントは省略されている。

[備考]
WlanGetNetworkBssList は指定インターフェイスでアクセス可能なワイヤレス ネットワークの BSS
リストを取得する。BSS 内容は AP またはピアから送信された生データであり、信頼しないこと。IE データ blob のサイズ判定には
WLAN_BSS_ENTRY の ulIeOffset と ulIeSize を使う。pDot11Ssid が指定されているなら
dot11BssType は dot11_BSS_type_infrastructure か
dot11_BSS_type_independent のいずれかを設定しなければならない。dot11_BSS_type_any は
ERROR_SUCCESS を返すが BSS は返らない。全ネットワークのリストを得るには pDot11Ssid を NULL
にする。成功後に ppWlanBssList のバッファは WlanFreeMemory で解放する。


%index
WlanGetProfile
指定されたワイヤレス プロファイルに関するすべての情報を取得する。
%prm
hClientHandle, pInterfaceGuid, strProfileName, pReserved, pstrProfileXml, pdwFlags, pdwGrantedAccess
hClientHandle : [intptr] WlanOpenHandle の以前の呼び出しで取得したクライアントのセッション ハンドル。
pInterfaceGuid : [var] ワイヤレス インターフェイスの GUID。GUID の一覧は WlanEnumInterfaces で取得できる。
strProfileName : [wstr] プロファイルの名前。大文字と小文字を区別。NULL 終端が必要。最大長は 255 文字 (終端含め 256)。Windows XP SP3 および XP SP2 用 API: 名前はネットワークの SSID から自動派生する。インフラストラクチャでは SSID、アドホックでは SSID + -adhoc。
pReserved : [intptr] 将来の使用のために予約されている。NULL を設定する必要がある。
pstrProfileXml : [var] 問い合わせ対象プロファイルの XML 表現を含む文字列。最大長は定義されていない。
pdwFlags : [var] 入力時は要求に関する追加情報を提供する変数へのポインタ。NULL の場合プロファイル フラグは返されない。出力時はプロファイル フラグを受け取る。Windows XP SP3 および Windows XP SP2 用 API: ユーザー別プロファイルは未対応のため NULL を設定。
pdwGrantedAccess : [var] すべてのユーザー用プロファイルのアクセス マスク。
%inst
指定されたワイヤレス プロファイルに関するすべての情報を取得する。

[戻り値]
関数が成功すると、戻り値は ERROR_SUCCESS となる。関数が失敗した場合、戻り値は次のいずれかのコードとなりうる。
このドキュメントは省略されている。

[備考]
成功すると pstrProfileXml が指すバッファにプロファイルの XML 表現が返される。XML の詳細は
WLAN_profile Schema を参照。呼び出し元は不要になったら WlanFreeMemory
で解放する。すべてのユーザー用プロファイルの場合、呼び出し元はプロファイルに対する読み取りアクセス権が必要で、さもなくば
ERROR_ACCESS_DENIED で失敗する。Windows 7: 呼び出し時に pdwFlags に
WLAN_PROFILE_GET_PLAINTEXT_KEY フラグを指定すると keyMaterial
要素を平文で要求できる。平文鍵を取得するには wlan_secure_get_plaintext_key 権限が必要であり、DACL に
WLAN_READ_ACCESS を許可する ACE が必要である。既定では Administrators
のみ平文鍵の取得が許可される。権限がない場合は暗号化された鍵が返される (エラーはなし)。プロセスが LocalSystem
で動作している場合は CryptUnprotectData で復号できる。
Windows Server 2008 / Vista: keyMaterial は常に暗号化される。Windows XP SP3 および
XP SP2 用 API: 鍵は暗号化されない。


%index
WlanGetProfileCustomUserData
ワイヤレス プロファイルに関連付けられたカスタム ユーザー データを取得する。
%prm
hClientHandle, pInterfaceGuid, strProfileName, pReserved, pdwDataSize, ppData
hClientHandle : [intptr] WlanOpenHandle の以前の呼び出しで取得したクライアントのセッション ハンドル。
pInterfaceGuid : [var] ワイヤレス LAN インターフェイスの GUID へのポインタ。
strProfileName : [wstr] カスタム ユーザー データが関連付けられたプロファイル名。大文字と小文字を区別。NULL 終端。
pReserved : [intptr] 将来の使用のために予約されている。NULL を設定する必要がある。
pdwDataSize : [var] ppData が指すユーザー データ バッファのサイズ (バイト単位)。
ppData : [var] ユーザー データへのポインタ。
%inst
ワイヤレス プロファイルに関連付けられたカスタム ユーザー データを取得する。

[戻り値]
関数が成功すると、戻り値は ERROR_SUCCESS となる。関数が失敗した場合、戻り値は次のいずれかのコードとなりうる。
このドキュメントは省略されている。

[備考]
Windows の Native Wifi AutoConfig サービスで使用されるすべての WLAN
プロファイルに対し、Windows はカスタム ユーザー データの概念を保持する。初期状態では存在しないが
WlanSetProfileCustomUserData で設定できる。WlanSetProfile でプロファイルを更新するとユーザー
データは空にリセットされる。設定済みデータは本関数で取得できる。ppData のメモリは呼び出し元が WlanFreeMemory
で解放する。


%index
WlanGetProfileList
プロファイルのリストを取得する。
%prm
hClientHandle, pInterfaceGuid, pReserved, ppProfileList
hClientHandle : [intptr] WlanOpenHandle の以前の呼び出しで取得したクライアントのセッション ハンドル。
pInterfaceGuid : [var] ワイヤレス インターフェイスの GUID。GUID の一覧は WlanEnumInterfaces で取得できる。
pReserved : [intptr] 将来の使用のために予約されている。NULL を設定する必要がある。
ppProfileList : [var] プロファイル情報のリストを含む PWLAN_PROFILE_INFO_LIST 構造体。
%inst
プロファイルのリストを取得する。

[戻り値]
関数が成功すると、戻り値は ERROR_SUCCESS となる。関数が失敗した場合、戻り値は次のいずれかのコードとなりうる。
このドキュメントは省略されている。

[備考]
WlanGetProfileList はワイヤレス
インターフェイス上のプロファイルの基本情報のみを返す。リストは優先順で取得される。順序変更には
WlanSetProfilePosition を使う。より詳細な情報は WlanGetProfile
で取得できる。ppProfileList のメモリは不要になったら WlanFreeMemory で解放する。Windows XP SP3
および XP SP2 用 API: ゲスト プロファイル、WPS 認証プロファイル、WPA-None
認証プロファイルは未対応のため返されない。


%index
WlanGetSecuritySettings
構成可能オブジェクトに関連付けられたセキュリティ設定を取得する。
%prm
hClientHandle, SecurableObject, pValueType, pstrCurrentSDDL, pdwGrantedAccess
hClientHandle : [intptr] WlanOpenHandle の以前の呼び出しで取得したクライアントのセッション ハンドル。
SecurableObject : [int] セキュリティ設定を適用するオブジェクトを指定する WLAN_SECURABLE_OBJECT 値。
pValueType : [var] セキュリティ設定のソースを指定する WLAN_OPCODE_VALUE_TYPE 値へのポインタ。
pstrCurrentSDDL : [var] 入力時は NULL でなければならない。出力時は成功時にオブジェクトのセキュリティ設定を示すセキュリティ記述子文字列へのポインタを受け取る。文字列の詳細は WlanSetSecuritySettings を参照。
pdwGrantedAccess : [var] オブジェクトのアクセス マスク。
%inst
構成可能オブジェクトに関連付けられたセキュリティ設定を取得する。

[戻り値]
関数が成功すると、戻り値は ERROR_SUCCESS となる。関数が失敗した場合、戻り値は次のいずれかのコードとなりうる。
このドキュメントは省略されている。

[備考]
成功時は pstrCurrentSDDL のセキュリティ記述子文字列のメモリを呼び出し元が WlanFreeMemory
で解放する責任がある。


%index
WlanGetSupportedDeviceServices
指定のワイヤレス LAN インターフェイスでサポートされているデバイス サービスのリストを取得する。
%prm
hClientHandle, pInterfaceGuid, ppDevSvcGuidList
hClientHandle : [intptr] 型: HANDLE WlanOpenHandle の以前の呼び出しで取得したクライアントのセッション ハンドル。
pInterfaceGuid : [var] 型: CONST GUID* 問い合わせるワイヤレス LAN インターフェイスの GUID へのポインタ。
ppDevSvcGuidList : [var] 型: PWLAN_DEVICE_SERVICE_GUID_LIST* 返されるデバイス サービス GUID のリスト (WLAN_DEVICE_SERVICE_GUID_LIST 構造体) を受け取るポインタへのポインタ。成功時は本関数がバッファを確保する。
%inst
指定のワイヤレス LAN インターフェイスでサポートされているデバイス サービスのリストを取得する。

[戻り値]
型: HRESULT 関数が成功すると ERROR_SUCCESS を返す。ERROR_ACCESS_DENIED
で失敗した場合、呼び出し元は管理者権限を持つか UMDF ドライバである必要がある。

[備考]
成功時は関数が ppDevSvcGuidList のバッファを確保する。不要になったら WlanFreeMemory で解放する。


%index
WlanHostedNetworkForceStart
アプリケーションの呼び出しハンドルと関連付けずにワイヤレス ホステッド ネットワークを wlan_hosted_network_active 状態に遷移させる。
%prm
hClientHandle, pFailReason, pvReserved
hClientHandle : [intptr] WlanOpenHandle の以前の呼び出しで返されたクライアントのセッション ハンドル。
pFailReason : [var] 失敗理由を受け取る変数へのオプションのポインタ。値は WLAN_HOSTED_NETWORK_REASON 列挙型から取得される。
pvReserved : [intptr] 将来の使用のために予約されている。NULL でなければならない。
%inst
アプリケーションの呼び出しハンドルと関連付けずにワイヤレス ホステッド ネットワークを
wlan_hosted_network_active 状態に遷移させる。

[戻り値]
関数が成功すると、戻り値は ERROR_SUCCESS となる。関数が失敗した場合、戻り値は次のいずれかのコードとなりうる。
このドキュメントは省略されている。

[備考]
WlanHostedNetworkForceStart は Windows 7 および Windows Server 2008 R2
のワイヤレス ホステッド ネットワークをサポートするためのネイティブ ワイヤレス API
の拡張である。この関数はアプリケーションの呼び出しハンドルと関連付けずにホステッド ネットワークを
wlan_hosted_network_active 状態に遷移させる。成功した呼び出しは最終的に
WlanHostedNetworkForceStop
によって対応されるべきである。呼び出しハンドルを閉じてもこの関数の変更は自動的に元に戻されない。WlanHostedNetworkStartUsing
より高い特権を必要とする。状態が wlan_hosted_network_unavailable または特権不足の場合は失敗しうる。
このドキュメントは省略されている。


%index
WlanHostedNetworkForceStop
アプリケーションの呼び出しハンドルと関連付けずにワイヤレス ホステッド ネットワークを wlan_hosted_network_idle に遷移させる。
%prm
hClientHandle, pFailReason, pvReserved
hClientHandle : [intptr] WlanOpenHandle の以前の呼び出しで返されたクライアントのセッション ハンドル。
pFailReason : [var] 失敗理由を受け取る変数へのオプションのポインタ。値は WLAN_HOSTED_NETWORK_REASON 列挙型から取得される。
pvReserved : [intptr] 将来の使用のために予約されている。NULL でなければならない。
%inst
アプリケーションの呼び出しハンドルと関連付けずにワイヤレス ホステッド ネットワークを wlan_hosted_network_idle
に遷移させる。

[戻り値]
関数が成功すると、戻り値は ERROR_SUCCESS となる。関数が失敗した場合、戻り値は次のいずれかのコードとなりうる。
このドキュメントは省略されている。

[備考]
Windows 7 および Windows Server 2008 R2 のワイヤレス ホステッド
ネットワーク用拡張。この関数は呼び出しハンドルと関連付けずにホステッド ネットワークを強制的に停止し
wlan_hosted_network_idle に遷移させる。通常は以前の WlanHostedNetworkForceStart
呼び出しに対応して呼ばれる。状態が wlan_hosted_network_active でない場合は失敗しうる。Windows 7
以降では Hosted Network 対応のワイヤレス アダプタが存在すると OS が仮想デバイス (Microsoft Virtual
WiFi Miniport adapter) をインストールし、SoftAP 接続専用に使用される。この仮想デバイスは
WlanEnumInterfaces の返すリストには現れない。物理アダプタが無効化されると仮想デバイスも取り外される。


%index
WlanHostedNetworkInitSettings
未設定の場合にワイヤレス ホステッド ネットワークのネットワーク接続設定 (SSID や最大ピア数など) を構成しストレージに永続化する。
%prm
hClientHandle, pFailReason, pvReserved
hClientHandle : [intptr] WlanOpenHandle の以前の呼び出しで返されたクライアントのセッション ハンドル。
pFailReason : [var] 失敗理由を受け取る変数へのオプションのポインタ。値は WLAN_HOSTED_NETWORK_REASON 列挙型から取得される。
pvReserved : [intptr] 将来の使用のために予約されている。NULL でなければならない。
%inst
未設定の場合にワイヤレス ホステッド ネットワークのネットワーク接続設定 (SSID や最大ピア数など) を構成しストレージに永続化する。

[戻り値]
関数が成功すると、戻り値は ERROR_SUCCESS となる。関数が失敗した場合、戻り値は次のいずれかのコードとなりうる。
このドキュメントは省略されている。

[備考]
Windows 7 および Windows Server 2008 R2 のワイヤレス ホステッド
ネットワーク用拡張。この関数はホステッド ネットワークの接続設定 (SSID や最大ピア数など)
が未設定の場合に構成してストレージに永続化する。設定済みなら ERROR_SUCCESS を返して何も変更しない。アプリケーションは他の
Hosted Network 機能を使う前に本関数を呼ぶことが推奨される。ホスト名からランダムで読みやすい SSID
を計算し、ランダムなプライマリ鍵を生成する。最大ピア数のデフォルトは 100。別値を使うには
WlanHostedNetworkSetProperty を呼ぶ。


%index
WlanHostedNetworkQueryProperty
ワイヤレス ホステッド ネットワークの現在の静的プロパティを問い合わせる。
%prm
hClientHandle, OpCode, pdwDataSize, ppvData, pWlanOpcodeValueType, pvReserved
hClientHandle : [intptr] WlanOpenHandle の以前の呼び出しで返されたクライアントのセッション ハンドル。
OpCode : [int] 問い合わせるプロパティの識別子。WLAN_HOSTED_NETWORK_OPCODE 列挙型の値。
pdwDataSize : [var] 成功時に ppvData のバッファのサイズ (バイト単位) を指定する変数へのポインタ。
ppvData : [var] 入力時は NULL でなければならない。出力時には要求された静的プロパティを含むバッファへのポインタを受け取る。バッファのデータ型は OpCode の値に依存する。
pWlanOpcodeValueType : [var] 成功時にホステッド ネットワーク プロパティの値型を受け取る変数へのポインタ。WLAN_OPCODE_VALUE_TYPE 列挙型。
pvReserved : [intptr] 将来の使用のために予約されている。NULL でなければならない。
%inst
ワイヤレス ホステッド ネットワークの現在の静的プロパティを問い合わせる。

[戻り値]
関数が成功すると、戻り値は ERROR_SUCCESS となる。関数が失敗した場合、戻り値は次のいずれかのコードとなりうる。
このドキュメントは省略されている。

[備考]
Windows 7 / Server 2008 R2 の拡張。現在のワイヤレス ホステッド
ネットワークの静的プロパティを問い合わせる。状態やプロパティは変更しない。成功時 ppvData
のバッファに要求プロパティが入り、サイズは pwdDataSize で返される。ppvData のメモリは不要になったら
WlanFreeMemory で解放する。ppvData のデータ型は OpCode の値により次のように決まる:
このドキュメントは省略されている。


%index
WlanHostedNetworkQuerySecondaryKey
ワイヤレス ホステッド ネットワークで使用するように構成されたセカンダリ セキュリティ キーを問い合わせる。
%prm
hClientHandle, pdwKeyLength, ppucKeyData, pbIsPassPhrase, pbPersistent, pFailReason, pvReserved
hClientHandle : [intptr] WlanOpenHandle の以前の呼び出しで返されたクライアントのセッション ハンドル。
pdwKeyLength : [var] 成功時に ppucKeyData の有効バイト数を指定する変数へのポインタ。パスフレーズの場合は終端 '\0' を含む。
ppucKeyData : [var] 成功時にセカンダリ セキュリティ キー データのバッファへのポインタを受け取る変数へのポインタ。
pbIsPassPhrase : [var] ppucKeyData が指す鍵データ配列がパスフレーズ形式かを示す Boolean 値へのポインタ。TRUE ならパスフレーズ形式。
pbPersistent : [var] ppucKeyData が指す鍵データ配列が後で再利用するために保存されるか、一度限り使用かを示す Boolean 値へのポインタ。
pFailReason : [var] 失敗理由を受け取る変数へのオプションのポインタ。値は WLAN_HOSTED_NETWORK_REASON 列挙型から取得される。
pvReserved : [intptr] 将来の使用のために予約されている。NULL でなければならない。
%inst
ワイヤレス ホステッド ネットワークで使用するように構成されたセカンダリ セキュリティ キーを問い合わせる。

[戻り値]
関数が成功すると、戻り値は ERROR_SUCCESS となる。関数が失敗した場合、戻り値は次のいずれかのコードとなりうる。
このドキュメントは省略されている。

[備考]
Windows 7 / Server 2008 R2 の拡張。ワイヤレス ホステッド ネットワークで使用されるセカンダリ セキュリティ
キーを問い合わせる。鍵データ、長さ、パスフレーズか、永続/一時かの情報を返す。状態やプロパティは変更しない。pbIsPassPhrase
が TRUE ならパスフレーズ、FALSE ならバイナリ鍵。
このドキュメントは省略されている。


%index
WlanHostedNetworkQueryStatus
ワイヤレス ホステッド ネットワークの現在の状態を問い合わせる。
%prm
hClientHandle, ppWlanHostedNetworkStatus, pvReserved
hClientHandle : [intptr] WlanOpenHandle の以前の呼び出しで返されたクライアントのセッション ハンドル。
ppWlanHostedNetworkStatus : [var] 入力時は NULL。出力時は成功するとワイヤレス ホステッド ネットワークの現在の状態 (WLAN_HOSTED_NETWORK_STATUS 構造体) へのポインタを受け取る。
pvReserved : [intptr] 将来の使用のために予約されている。NULL でなければならない。
%inst
ワイヤレス ホステッド ネットワークの現在の状態を問い合わせる。

[戻り値]
関数が成功すると、戻り値は ERROR_SUCCESS となる。関数が失敗した場合、戻り値は次のいずれかのコードとなりうる。
このドキュメントは省略されている。

[備考]
Windows 7 / Server 2008 R2 の拡張。ワイヤレス ホステッド
ネットワークの現在の状態を問い合わせるのみで変更はしない。返された WLAN_HOSTED_NETWORK_STATUS のメモリは
WlanFreeMemory で解放する。誰でも呼び出せるが、ドメインのグループ ポリシーにより有効化が制限される場合がある。


%index
WlanHostedNetworkRefreshSecuritySettings
ワイヤレス ホステッド ネットワークのセキュリティ設定の構成可能および自動生成部分を更新する。
%prm
hClientHandle, pFailReason, pvReserved
hClientHandle : [intptr] WlanOpenHandle の以前の呼び出しで返されたクライアントのセッション ハンドル。
pFailReason : [var] 失敗理由を受け取る変数へのオプションのポインタ。値は WLAN_HOSTED_NETWORK_REASON 列挙型から取得される。
pvReserved : [intptr] 将来の使用のために予約されている。NULL でなければならない。
%inst
ワイヤレス ホステッド ネットワークのセキュリティ設定の構成可能および自動生成部分を更新する。

[戻り値]
関数が成功すると、戻り値は ERROR_SUCCESS となる。関数が失敗した場合、戻り値は次のいずれかのコードとなりうる。
このドキュメントは省略されている。

[備考]
Windows 7 / Server 2008 R2 の拡張。構成可能および自動生成されるセキュリティ設定 (プライマリ鍵)
の更新を強制する。新設定の永続化にはホステッド ネットワークが稼働中なら wlan_hosted_network_idle
への遷移が必要となる。注: 呼び出し後は接続済みピアの再構成が必要となる。セカンダリ鍵は変更または再設定されない。


%index
WlanHostedNetworkSetProperty
ワイヤレス ホステッド ネットワークの静的プロパティを設定する。
%prm
hClientHandle, OpCode, dwDataSize, pvData, pFailReason, pvReserved
hClientHandle : [intptr] WlanOpenHandle の以前の呼び出しで返されたクライアントのセッション ハンドル。
OpCode : [int] 設定するプロパティの識別子。WLAN_HOSTED_NETWORK_OPCODE のうち次の値のみ: wlan_hosted_network_opcode_connection_settings (接続設定)、wlan_hosted_network_opcode_enable (有効化フラグ)。
dwDataSize : [int] pvData が指すバッファのサイズ (バイト単位)。
pvData : [intptr] 設定する静的プロパティを含むバッファへのポインタ。データ型は OpCode に依存する。
pFailReason : [var] 失敗理由を受け取る変数へのオプションのポインタ。値は WLAN_HOSTED_NETWORK_REASON 列挙型から取得される。
pvReserved : [intptr] 将来の使用のために予約されている。NULL でなければならない。
%inst
ワイヤレス ホステッド ネットワークの静的プロパティを設定する。

[戻り値]
関数が成功すると、戻り値は ERROR_SUCCESS となる。関数が失敗した場合、戻り値は次のいずれかのコードとなりうる。
このドキュメントは省略されている。

[備考]
Windows 7 / Server 2008 R2 の拡張。ワイヤレス ホステッド
ネットワークの静的プロパティを設定する。呼び出しハンドルを閉じてもプロパティ変更は自動的には元に戻らない。pvData のデータ型は
OpCode に依存する:
このドキュメントは省略されている。


%index
WlanHostedNetworkSetSecondaryKey
ワイヤレス ホステッド ネットワークで使用するセカンダリ セキュリティ キーを構成する。
%prm
hClientHandle, dwKeyLength, pucKeyData, bIsPassPhrase, bPersistent, pFailReason, pvReserved
hClientHandle : [intptr] WlanOpenHandle の以前の呼び出しで返されたクライアントのセッション ハンドル。
dwKeyLength : [int] pucKeyData の有効バイト数。パスフレーズの場合は終端 '\0' を含む。
pucKeyData : [var] 鍵データを含むバッファへのポインタ。有効バイト数は dwKeyLength 以上。
bIsPassPhrase : [int] pucKeyData がパスフレーズ形式かを示す Boolean。
bPersistent : [int] pucKeyData を保存して後で再利用するか、一度 (現在または次のセッション) のみ使用するかを示す Boolean。
pFailReason : [var] 失敗理由を受け取る変数へのオプションのポインタ。値は WLAN_HOSTED_NETWORK_REASON 列挙型から取得される。
pvReserved : [intptr] 将来の使用のために予約されている。NULL でなければならない。
%inst
ワイヤレス ホステッド ネットワークで使用するセカンダリ セキュリティ キーを構成する。

[戻り値]
関数が成功すると、戻り値は ERROR_SUCCESS となる。関数が失敗した場合、戻り値は次のいずれかのコードとなりうる。
このドキュメントは省略されている。

[備考]
Windows 7 / Server 2008 R2 の拡張。ワイヤレス ホステッド ネットワークが使用するセカンダリ セキュリティ
キーを構成する。開始後、ピアはプライマリだけでなくセカンダリ鍵でも関連付けが可能となる。セカンダリ鍵は常にユーザー指定である一方、プライマリ鍵は
OS がより高いセキュリティ強度で生成する。
このドキュメントは省略されている。


%index
WlanHostedNetworkStartUsing
ワイヤレス ホステッド ネットワークを開始する。
%prm
hClientHandle, pFailReason, pvReserved
hClientHandle : [intptr] WlanOpenHandle の以前の呼び出しで返されたクライアントのセッション ハンドル。
pFailReason : [var] 失敗理由を受け取る変数へのオプションのポインタ。値は WLAN_HOSTED_NETWORK_REASON 列挙型から取得される。
pvReserved : [intptr] 将来の使用のために予約されている。NULL でなければならない。
%inst
ワイヤレス ホステッド ネットワークを開始する。

[戻り値]
関数が成功すると、戻り値は ERROR_SUCCESS となる。関数が失敗した場合、戻り値は次のいずれかのコードとなりうる。
このドキュメントは省略されている。

[備考]
Windows 7 / Server 2008 R2 の拡張。ワイヤレス ホステッド ネットワークを開始する。成功した呼び出しは
WlanHostedNetworkStopUsing で対応する必要がある。状態が
wlan_hosted_network_unavailable
なら失敗しうる。呼び出しハンドルが閉じられるかプロセスが終了すると自動的に元に戻る。


%index
WlanHostedNetworkStopUsing
ワイヤレス ホステッド ネットワークを停止する。
%prm
hClientHandle, pFailReason, pvReserved
hClientHandle : [intptr] WlanOpenHandle の以前の呼び出しで返されたクライアントのセッション ハンドル。
pFailReason : [var] 失敗理由を受け取る変数へのオプションのポインタ。値は WLAN_HOSTED_NETWORK_REASON 列挙型から取得される。
pvReserved : [intptr] 将来の使用のために予約されている。NULL でなければならない。
%inst
ワイヤレス ホステッド ネットワークを停止する。

[戻り値]
関数が成功すると、戻り値は ERROR_SUCCESS となる。関数が失敗した場合、戻り値は次のいずれかのコードとなりうる。
このドキュメントは省略されている。

[備考]
Windows 7 / Server 2008 R2 の拡張。先行する WlanHostedNetworkStartUsing
の成功呼び出しに対応してホステッド ネットワークを停止する。すべてのアプリケーションが
WlanHostedNetworkStopUsing を呼ぶか、WlanHostedNetworkForceStop
が呼ばれるまでホステッド ネットワークはアクティブのまま。停止後は状態が wlan_hosted_network_idle
に変わる。ミニポート ドライバの利用不可などの外部イベントでも失敗しうる。


%index
WlanIhvControl
独立ハードウェア ベンダー (IHV) が WLAN ドライバまたはサービスを制御するための仕組みを提供する。
%prm
hClientHandle, pInterfaceGuid, Type, dwInBufferSize, pInBuffer, dwOutBufferSize, pOutBuffer, pdwBytesReturned
hClientHandle : [intptr] WlanOpenHandle の以前の呼び出しで取得したクライアントのセッション ハンドル。
pInterfaceGuid : [var] インターフェイスの GUID。
Type : [int] IHV 制御関数がバイパスするソフトウェアの種類を指定する WLAN_IHV_CONTROL_TYPE。
dwInBufferSize : [int] 入力バッファのサイズ (バイト単位)。
pInBuffer : [intptr] ドライバまたはサービス インターフェイス入力用の汎用バッファ。
dwOutBufferSize : [int] 出力バッファのサイズ (バイト単位)。
pOutBuffer : [intptr] ドライバまたはサービス インターフェイス出力用の汎用バッファ。
pdwBytesReturned : [var] 返されたバイト数。
%inst
独立ハードウェア ベンダー (IHV) が WLAN ドライバまたはサービスを制御するための仕組みを提供する。

[戻り値]
関数が成功すると、戻り値は ERROR_SUCCESS となる。関数が失敗した場合、戻り値は次のいずれかのコードとなりうる。
このドキュメントは省略されている。


%index
WlanOpenHandle
サーバーへの接続を開く。
%prm
dwClientVersion, pReserved, pdwNegotiatedVersion, phClientHandle
dwClientVersion : [int] クライアントがサポートする WLAN API の最高バージョン。
pReserved : [intptr] 将来の使用のために予約されている。NULL を設定する必要がある。
pdwNegotiatedVersion : [var] このセッションで使用される WLAN API のバージョン。通常はクライアントとサーバーの両方がサポートする最高バージョン。
phClientHandle : [intptr] このセッションでクライアントが使用するハンドル。以降の関数呼び出しで使用される。
%inst
サーバーへの接続を開く。

[戻り値]
関数が成功すると、戻り値は ERROR_SUCCESS となる。関数が失敗した場合、戻り値は次のいずれかのコードとなりうる。
このドキュメントは省略されている。

[備考]
dwClientVersion と pdwNegotiatedVersion
のバージョン番号はメジャーおよびマイナーを組み合わせた複合番号である。下位ワードがメジャー、上位ワードがマイナー。WLAN_API_VERSION_MAJOR(_v)
/ WLAN_API_VERSION_MINOR(_v) マクロで分解でき、WLAN_API_MAKE_VERSION(_major,
_minor) で構築できる。Windows XP SP3 および XP SP2 用 API: Wireless Zero
Configuration サービスが開始していないか応答しない場合、WlanOpenHandle はエラーを返す。


%index
WlanQueryAutoConfigParameter
自動構成サービスのパラメータを問い合わせる。
%prm
hClientHandle, OpCode, pReserved, pdwDataSize, ppData, pWlanOpcodeValueType
hClientHandle : [intptr] WlanOpenHandle の以前の呼び出しで取得したクライアントのセッション ハンドル。
OpCode : [int] 問い合わせる構成パラメータを指定する値。
pReserved : [intptr] 将来の使用のために予約されている。NULL を設定する必要がある。
pdwDataSize : [var] ppData のサイズ (バイト単位) を指定する。
ppData : [var] OpCode で指定されたパラメータの問い合わせ値を含むメモリへのポインタ。注: OpCode が wlan_autoconf_opcode_show_denied_networks の場合、ppData が指す整数値は 0 なら FALSE、非 0 なら TRUE と解釈する。
pWlanOpcodeValueType : [var] WLAN_OPCODE_VALUE_TYPE 値。
%inst
自動構成サービスのパラメータを問い合わせる。

[戻り値]
関数が成功すると、戻り値は ERROR_SUCCESS となる。関数が失敗した場合、戻り値は次のいずれかのコードとなりうる。
このドキュメントは省略されている。

[備考]
WlanQueryAutoConfigParameter は Windows Vista 以降でサポートされる自動構成モジュール
(ACM) のパラメータを問い合わせる。


%index
WlanQueryInterface
WlanQueryInterface 関数は指定されたインターフェイスの各種パラメータを問い合わせる。
%prm
hClientHandle, pInterfaceGuid, OpCode, pReserved, pdwDataSize, ppData, pWlanOpcodeValueType
hClientHandle : [intptr] WlanOpenHandle の以前の呼び出しで取得したクライアントのセッション ハンドル。
pInterfaceGuid : [var] 問い合わせるインターフェイスの GUID。
OpCode : [int] 問い合わせるパラメータを指定する WLAN_INTF_OPCODE 値。ppData のデータ型は次の表に示す。
pReserved : [intptr] 将来の使用のために予約されている。NULL を設定する必要がある。
pdwDataSize : [var] ppData のサイズ (バイト単位)。
ppData : [var] OpCode で指定されたパラメータの問い合わせ値を含むメモリ位置へのポインタ。注: OpCode が wlan_intf_opcode_autoconf_enabled 等の場合、整数値は 0 なら FALSE、非 0 なら TRUE と解釈する。
pWlanOpcodeValueType : [var] 非 NULL の場合、返される opcode の種類を指定する WLAN_OPCODE_VALUE_TYPE 値へのポインタ。NULL でもよい。
%inst
WlanQueryInterface 関数は指定されたインターフェイスの各種パラメータを問い合わせる。

[戻り値]
関数が成功すると、戻り値は ERROR_SUCCESS となる。関数が失敗した場合、戻り値は次のいずれかのコードとなりうる。

[備考]
ppData のメモリは呼び出し元が WlanFreeMemory で解放する。OpCode が
wlan_intf_opcode_current_operation_mode の場合、WlanQueryInterface はワイヤレス
インターフェイスの現在の動作モードを問い合わせる。動作モードは
DOT11_OPERATION_MODE_EXTENSIBLE_STATION と
DOT11_OPERATION_MODE_NETWORK_MONITOR の 2 種類がサポートされる (Windot11.h 定義)。


%index
WlanReasonCodeToString
指定の理由コードを説明する文字列を取得する。
%prm
dwReasonCode, dwBufferSize, pStringBuffer, pReserved
dwReasonCode : [int] 文字列説明を要求する WLAN_REASON_CODE 値。
dwBufferSize : [int] 文字列格納バッファのサイズ (WCHAR 単位)。理由コード文字列がバッファより長い場合、切り詰められて NULL 終端される。dwBufferSize が pStringBuffer の実際のメモリ量より大きいと呼び出しプログラムでアクセス違反が発生する。
pStringBuffer : [wstr] 文字列を受け取るバッファへのポインタ。呼び出し元は事前にメモリを確保する必要がある。
pReserved : [intptr] 将来の使用のために予約されている。NULL を設定する必要がある。
%inst
指定の理由コードを説明する文字列を取得する。

[戻り値]
関数が成功すると、戻り値は定数文字列へのポインタとなる。関数が失敗した場合、戻り値は次のいずれかのコードとなりうる。
このドキュメントは省略されている。


%index
WlanRegisterDeviceServiceNotification
管理者権限を持つユーザー モード クライアントまたは UMDF ドライバが、関心のあるデバイス サービスに対応する非請求通知を登録できるようにする。
%prm
hClientHandle, pDevSvcGuidList
hClientHandle : [intptr] 型: HANDLE WlanOpenHandle の以前の呼び出しで取得したクライアントのセッション ハンドル。
pDevSvcGuidList : [var] 型: CONST PWLAN_DEVICE_SERVICE_GUID_LIST 通知を受け取りたいデバイス サービス GUID を表す WLAN_DEVICE_SERVICE_GUID_LIST 構造体へのオプションのポインタ。dwIndex は dwNumberOfItems 未満でなければならず、そうでないとアクセス違反が発生する。呼び出しのたびに以前のリストが新しいリストで置き換えられる。登録解除には pDevSvcGuidList を nullptr にするか、dwNumberOfItems を 0 に設定した構造体へのポインタを渡す。
%inst
管理者権限を持つユーザー モード クライアントまたは UMDF ドライバが、関心のあるデバイス
サービスに対応する非請求通知を登録できるようにする。

[戻り値]
型: HRESULT 関数が成功すると ERROR_SUCCESS を返す。ERROR_ACCESS_DENIED
で失敗した場合、呼び出し元は管理者権限を持つか UMDF ドライバである必要がある。

[備考]
WlanRegisterDeviceServiceNotification は WLAN デバイス サービス用のネイティブ Wi-Fi
API
の拡張である。通知登録および解除に使用する。呼び出しハンドルが閉じられるかプロセス終了で登録は自動的に解除される。通知を受け取るには本関数を有効な
pDevSvcGuidList で呼ぶと共に、WlanRegisterNotification を
WLAN_NOTIFICATION_SOURCE_DEVICE_SERVICE で呼ぶ必要がある。OS が IHV ドライバからのデバイス
サービス通知を受信すると、WLAN_NOTIFICATION_CALLBACK を介して各通知がクライアントに渡される
(通知ごとに別バッファ)。NotificationSource は
WLAN_NOTIFICATION_SOURCE_DEVICE_SERVICE に設定される。データ blob、デバイス サービス
GUID、opcode は WLAN_DEVICE_SERVICE_NOTIFICATION_DATA 構造体の pData
で参照できる。注: OS は登録 GUID が IHV ドライバでサポートされているかを検証しない。必要なら
WlanGetSupportedDeviceServices で確認すること。


%index
WlanRegisterNotification
すべてのワイヤレス インターフェイスでの通知の登録および解除に使用される。
%prm
hClientHandle, dwNotifSource, bIgnoreDuplicate, funcCallback, pCallbackContext, pReserved, pdwPrevNotifSource
hClientHandle : [intptr] WlanOpenHandle の以前の呼び出しで取得したクライアントのセッション ハンドル。
dwNotifSource : [int] 登録する通知ソース。これらのフラグは組み合わせ可能。WLAN_NOTIFICATION_SOURCE_NONE を設定すると、WlanRegisterNotification はすべてのワイヤレス インターフェイスの通知を解除する。指定可能な値は Wlanapi.h および L2cmn.h で定義される。
bIgnoreDuplicate : [int] 重複通知を無視するかを指定する。TRUE の場合、直前と同一の通知はクライアントに送られない。Windows XP SP3 および XP SP2 用 API: このパラメータは無視される。
funcCallback : [int] 通知コールバック関数の型を定義する WLAN_NOTIFICATION_CALLBACK 型。dwNotifSource が WLAN_NOTIFICATION_SOURCE_NONE に設定される場合は NULL でもよい。
pCallbackContext : [intptr] 通知と共にコールバック関数に渡されるクライアント コンテキストへのポインタ。
pReserved : [intptr] 将来の使用のために予約されている。NULL を設定する必要がある。
pdwPrevNotifSource : [var] 以前に登録されていた通知ソースへのポインタ。
%inst
すべてのワイヤレス インターフェイスでの通知の登録および解除に使用される。

[戻り値]
関数が成功すると、戻り値は ERROR_SUCCESS となる。関数が失敗した場合、戻り値は次のいずれかのコードとなりうる。
このドキュメントは省略されている。

[備考]
WlanRegisterNotification はアプリケーションが全ワイヤレス
インターフェイスの通知を登録/解除するために使用する。登録時には funcCallback でコールバック関数を提供する必要がある
(プロトタイプは WLAN_NOTIFICATION_CALLBACK)。このコールバックは dwNotifSource
で登録した通知を受け取る。コールバックの第一引数は WLAN_NOTIFICATION_DATA へのポインタ、第二引数は
pCallbackContext で渡したクライアント コンテキスト。dwNotifSource が
WLAN_NOTIFICATION_SOURCE_NONE 以外でコールバックが NULL だとエラーとなる。登録後は解除またはハンドル
クローズまでコールバックが呼ばれる。コールバック内から本関数を呼ぶとデッドロック等になりうる。DllMain からも呼ばないこと。


%index
WlanRegisterVirtualStationNotification
仮想ステーション上の通知の登録および解除に使用される。
%prm
hClientHandle, bRegister, pReserved
hClientHandle : [intptr] WlanOpenHandle の以前の呼び出しで取得したクライアントのセッション ハンドル。
bRegister : [int] 仮想ステーション上で通知を受け取るかを指定する値。
pReserved : [intptr] 将来の使用のために予約されている。NULL でなければならない。
%inst
仮想ステーション上の通知の登録および解除に使用される。

[戻り値]
関数が成功すると、戻り値は ERROR_SUCCESS となる。関数が失敗した場合、戻り値は次のいずれかのコードとなりうる。
このドキュメントは省略されている。

[備考]
Windows 7 / Server 2008 R2 のワイヤレス ホステッド
ネットワーク用拡張。仮想ステーション上の通知登録/解除に使用する。既定では仮想ステーションの通知はクライアントに届かない。受け取るには本関数を
bRegister=TRUE で呼び、かつ WlanRegisterNotification も呼ぶ必要がある。登録はハンドル
クローズ、プロセス終了、または bRegister=FALSE での呼び出しまで有効。


%index
WlanRenameProfile
指定されたプロファイルの名前を変更する。
%prm
hClientHandle, pInterfaceGuid, strOldProfileName, strNewProfileName, pReserved
hClientHandle : [intptr] WlanOpenHandle の以前の呼び出しで取得したクライアントのセッション ハンドル。
pInterfaceGuid : [var] インターフェイスの GUID。
strOldProfileName : [wstr] 変更対象のプロファイル名。
strNewProfileName : [wstr] プロファイルの新しい名前。
pReserved : [intptr] 将来の使用のために予約されている。NULL でなければならない。
%inst
指定されたプロファイルの名前を変更する。

[戻り値]
関数が成功すると、戻り値は ERROR_SUCCESS となる。関数が失敗した場合、戻り値は次のいずれかのコードとなりうる。
このドキュメントは省略されている。


%index
WlanSaveTemporaryProfile
一時プロファイルをプロファイル ストアに保存する。
%prm
hClientHandle, pInterfaceGuid, strProfileName, strAllUserProfileSecurity, dwFlags, bOverWrite, pReserved
hClientHandle : [intptr] WlanOpenHandle の以前の呼び出しで取得したクライアントのセッション ハンドル。
pInterfaceGuid : [var] インターフェイスの GUID。
strProfileName : [wstr] 保存するプロファイル名。大文字と小文字を区別。NULL 終端。
strAllUserProfileSecurity : [wstr] すべてのユーザー用プロファイルのセキュリティ記述子文字列を設定する。既定では全ユーザーが書き込みアクセス可能。dwFlags が WLAN_PROFILE_USER なら無視。NULL を指定すると既定のアクセス権が使用される。
dwFlags : [int] プロファイルに設定するフラグ。組み合わせ可能。
bOverWrite : [int] 既存プロファイルを上書きするかを指定する。FALSE でプロファイルが既存ならエラーが返る。
pReserved : [intptr] 将来の使用のために予約されている。NULL を設定する必要がある。
%inst
一時プロファイルをプロファイル ストアに保存する。

[戻り値]
関数が成功すると、戻り値は ERROR_SUCCESS となる。関数が失敗した場合、戻り値は次のいずれかのコードとなりうる。
このドキュメントは省略されている。

[備考]
一時プロファイルとは WlanConnect に渡されたものか探索エンジンが生成したもの。本 API で一時プロファイルとユーザー
データをプロファイル ストアへ保存できる。新プロファイルはグループ ポリシー
プロファイルの後のリスト先頭に追加される。既存を上書きする場合は順序は維持される。すべてのユーザー用プロファイルには読み取り、書き込み、実行の
3 種のアクセス権がある。
このドキュメントは省略されている。


%index
WlanScan
指定インターフェイスで利用可能なネットワークのスキャンを要求する。
%prm
hClientHandle, pInterfaceGuid, pDot11Ssid, pIeData, pReserved
hClientHandle : [intptr] WlanOpenHandle の以前の呼び出しで取得したクライアントのセッション ハンドル。
pInterfaceGuid : [var] 問い合わせるインターフェイスの GUID。
pDot11Ssid : [var] スキャン対象ネットワークの SSID を指定する DOT11_SSID 構造体へのポインタ (省略可)。NULL なら利用可能な全ネットワークが返る。Windows XP SP3 および XP SP2 用 API: NULL でなければならない。
pIeData : [var] プローブ要求に含める情報要素へのポインタ。クライアントプロビジョニング可用情報や 802.1X 認証要件を含みうる WLAN_RAW_DATA 構造体を指す。Windows XP SP3 および XP SP2 用 API: NULL でなければならない。
pReserved : [intptr] 将来の使用のために予約されている。NULL でなければならない。
%inst
指定インターフェイスで利用可能なネットワークのスキャンを要求する。

[戻り値]
関数が成功すると、戻り値は ERROR_SUCCESS となる。関数が失敗した場合、戻り値は次のいずれかのコードとなりうる。
このドキュメントは省略されている。

[備考]
WlanScan はネイティブ 802.11 ワイヤレス LAN ドライバに利用可能ネットワークのスキャンを要求する。pIeData が
NULL でない場合、ドライバはプローブ要求に IE を含めて送信する (例: WPS-capable AP 検出のための WPS
IE)。pIeData バッファは Element ID から始まる完全な IE を含む必要がある。pIeData は近接サービス検出
(PSD) IE データ エントリを含むオプションの WLAN_RAW_DATA へのポインタも指しうる。
このドキュメントは省略されている。


%index
WlanSetAutoConfigParameter
自動構成サービスのパラメータを設定する。
%prm
hClientHandle, OpCode, dwDataSize, pData, pReserved
hClientHandle : [intptr] WlanOpenHandle の以前の呼び出しで取得したクライアントのセッション ハンドル。
OpCode : [int] 設定するパラメータを指定する WLAN_AUTOCONF_OPCODE 値。設定操作をサポートする opcode のみ使用可。
dwDataSize : [int] pData のサイズ (バイト単位)。OpCode に応じて sizeof(BOOL) または sizeof(DWORD) を設定する。
pData : [intptr] OpCode で指定されたパラメータに設定する値。OpCode に応じて BOOL または DWORD 値を指す。NULL であってはならない。
pReserved : [intptr] 将来の使用のために予約されている。NULL でなければならない。
%inst
自動構成サービスのパラメータを設定する。

[戻り値]
関数が成功すると、戻り値は ERROR_SUCCESS となる。関数が失敗した場合、戻り値は次のいずれかのコードとなりうる。
このドキュメントは省略されている。

[備考]
WlanSetAutoConfigParameter は Windows Vista 以降の自動構成モジュール (ACM)
のパラメータを設定する。OpCode により pData はブール値に変換される (0 なら FALSE、非 0 なら TRUE)。


%index
WlanSetFilterList
許可/拒否リストを設定する。
%prm
hClientHandle, wlanFilterListType, pNetworkList, pReserved
hClientHandle : [intptr] WlanOpenHandle の以前の呼び出しで取得したクライアントのセッション ハンドル。
wlanFilterListType : [int] フィルタ リストの種類を指定する WLAN_FILTER_LIST_TYPE 値。wlan_filter_list_type_user_permit または wlan_filter_list_type_user_deny のいずれか。グループ ポリシー定義のリストは本関数で設定できない。
pNetworkList : [var] 許可または拒否対象ネットワークのリストを含む DOT11_NETWORK_LIST 構造体へのポインタ。dwIndex は dwNumberOfItems 未満でなければならず、そうでないとアクセス違反が発生する。
pReserved : [intptr] 将来の使用のために予約されている。NULL を設定する必要がある。
%inst
許可/拒否リストを設定する。

[戻り値]
関数が成功すると、戻り値は ERROR_SUCCESS となる。関数が失敗した場合、戻り値は次のいずれかのコードとなりうる。
このドキュメントは省略されている。

[備考]
グループ ポリシーの許可/拒否リストはユーザーの許可/拒否リストより優先される。したがってユーザー許可リストにあるネットワークでもグループ
ポリシー拒否リストにあれば拒否される。リストに無いネットワークは許可される。拒否されたネットワークは自動構成で接続できず可視ネットワーク
リストにも現れない。新しいユーザー リストは以前のものを上書きする。リストをクリアするには pNetworkList を NULL
にするか dwNumberOfItems=0 の構造体を渡す。全 SSID を含めるには uSSIDLength=0 の
DOT11_NETWORK を指定する。全 BSS 種別を含めるには dot11BssType=dot11_BSS_type_any
を指定する。コマンドラインからは netsh wlan add/delete filter を使う。


%index
WlanSetInterface
ユーザー構成可能なパラメータを設定する。
%prm
hClientHandle, pInterfaceGuid, OpCode, dwDataSize, pData, pReserved
hClientHandle : [intptr] WlanOpenHandle の以前の呼び出しで取得したクライアントのセッション ハンドル。
pInterfaceGuid : [var] 構成するインターフェイスの GUID。
OpCode : [int] 設定するパラメータを指定する WLAN_INTF_OPCODE 値。pData のデータ型は次の表に示す。
dwDataSize : [int] pData のサイズ (バイト単位)。実際の pData より大きいとアクセス違反が発生する。
pData : [intptr] OpCode で指定される値。OpCode に適した型でなければならない。wlan_intf_opcode_autoconf_enabled 等の場合、整数値 0 は FALSE、非 0 は TRUE に変換される。
pReserved : [intptr] 将来の使用のために予約されている。NULL を設定する必要がある。
%inst
ユーザー構成可能なパラメータを設定する。

[戻り値]
関数が成功すると、戻り値は ERROR_SUCCESS となる。関数が失敗した場合、戻り値は次のいずれかのコードとなりうる。

[備考]
OpCode が wlan_intf_opcode_current_operation_mode の場合、WlanSetInterface
は動作モードを設定する。サポートされるのは DOT11_OPERATION_MODE_EXTENSIBLE_STATION と
DOT11_OPERATION_MODE_NETWORK_MONITOR の 2
つ。自動構成サービスの有効/無効切替はコマンドラインからは netsh wlan setautoconfig で行える。OpCode が
wlan_intf_opcode_radio_state の場合、本関数は特定 PHY のソフトウェア無線状態を設定する (pData は
WLAN_PHY_RADIO_STATE を指す)。ハードウェア無線状態は変更できない。PHY
の無線状態はソフトウェアまたはハードウェアのいずれかが off なら off となる。


%index
WlanSetProfile
特定プロファイルの内容を設定する。
%prm
hClientHandle, pInterfaceGuid, dwFlags, strProfileXml, strAllUserProfileSecurity, bOverwrite, pReserved, pdwReasonCode
hClientHandle : [intptr] WlanOpenHandle の以前の呼び出しで取得したクライアントのセッション ハンドル。
pInterfaceGuid : [var] インターフェイスの GUID。
dwFlags : [int] プロファイルに設定するフラグ。Windows XP SP3 および XP SP2 用 API: 0 でなければならず、ユーザー別プロファイルは未対応。
strProfileXml : [wstr] プロファイルの XML 表現。ルート要素は WLANProfile。サンプルは Wireless Profile Samples を参照。最大長は定義されていない。Windows XP SP3 および XP SP2 用 API: 互換条件を満たす必要がある。
strAllUserProfileSecurity : [wstr] すべてのユーザー用プロファイルのセキュリティ記述子文字列を設定する。dwFlags が WLAN_PROFILE_USER なら無視。新規作成時に NULL なら wlan_secure_add_new_all_user_profiles のセキュリティ記述子が使われる。既存プロファイルに NULL ならアクセス権は変更されない。Windows XP SP3 および XP SP2 用 API: NULL でなければならない。
bOverwrite : [int] 既存プロファイルを上書きするか。FALSE で既存なら上書きされずエラーが返る。
pReserved : [intptr] 将来の使用のために予約されている。NULL を設定する必要がある。
pdwReasonCode : [var] プロファイルが無効な理由を示す WLAN_REASON_CODE 値。
%inst
特定プロファイルの内容を設定する。

[戻り値]
関数が成功すると、戻り値は ERROR_SUCCESS となる。関数が失敗した場合、戻り値は次のいずれかのコードとなりうる。
このドキュメントは省略されている。

[備考]
WlanSetProfile は新規 WLAN プロファイル追加または既存置換に使用する。新プロファイルはグループ
ポリシーの後のリスト先頭に追加される。既存上書きの場合は順序は保持される。平文鍵 (protected=FALSE)
を含むプロファイルも設定可能で、ストア保存時に自動暗号化される。WlanGetProfile
取得時は暗号化済み鍵が返る。すべてのユーザー用プロファイルには読み取り、書き込み、実行の 3
種のアクセス権がある。セキュリティ記述子オブジェクトの作成および文字列化の手順を以下に示す。
このドキュメントは省略されている。


%index
WlanSetProfileCustomUserData
プロファイルに関連付けられるカスタム ユーザー データを設定する。
%prm
hClientHandle, pInterfaceGuid, strProfileName, dwDataSize, pData, pReserved
hClientHandle : [intptr] WlanOpenHandle の以前の呼び出しで取得したクライアントのセッション ハンドル。
pInterfaceGuid : [var] インターフェイスの GUID。
strProfileName : [wstr] カスタム ユーザー データが関連付けられるプロファイル名。大文字と小文字を区別。NULL 終端。
dwDataSize : [int] pData のサイズ (バイト単位)。
pData : [var] 設定するユーザー データへのポインタ。
pReserved : [intptr] 将来の使用のために予約されている。NULL でなければならない。
%inst
プロファイルに関連付けられるカスタム ユーザー データを設定する。

[戻り値]
関数が成功すると、戻り値は ERROR_SUCCESS となる。関数が失敗した場合、戻り値は次のいずれかのコードとなりうる。
このドキュメントは省略されている。

[備考]
Native Wifi AutoConfig サービスが使用する各 WLAN プロファイルに対し、Windows はカスタム ユーザー
データの概念を保持する。初期は非存在だが本関数で設定可能。WlanSetProfile
でプロファイルが変更されるとリセットされる。設定済みデータは WlanGetProfileCustomUserData
で取得できる。指定インターフェイスがシステムから取り外されている場合は ERROR_INVALID_PARAMETER で失敗しうる。


%index
WlanSetProfileEapUserData
生 EAP データで指定された Extensible Authentication Protocol (EAP) ユーザー資格情報を設定する。
%prm
hClientHandle, pInterfaceGuid, strProfileName, eapType, dwFlags, dwEapUserDataSize, pbEapUserData, pReserved
hClientHandle : [intptr] WlanOpenHandle の以前の呼び出しで取得したクライアントのセッション ハンドル。
pInterfaceGuid : [var] インターフェイスの GUID。
strProfileName : [wstr] EAP ユーザー データが関連付けられるプロファイル名。大文字と小文字を区別。NULL 終端。
eapType : [var] 呼び出し元が資格情報を提供する EAP メソッドの情報を含む EAP_METHOD_TYPE 構造体。
dwFlags : [int] 関数の動作を変更するフラグ。Windows Vista / Server 2008 では予約で 0 を設定。
dwEapUserDataSize : [int] pbEapUserData が指すデータのサイズ (バイト単位)。
pbEapUserData : [var] ユーザー資格情報を設定する生 EAP データへのポインタ。Vista / Server 2008 では NULL 不可。Windows 7 / Server 2008 R2 以降では、dwFlags に WLAN_SET_EAPHOST_DATA_ALL_USERS を含み dwEapUserDataSize=0 ならこのパラメータを NULL にして保存済み資格情報を削除できる。
pReserved : [intptr] 将来の使用のために予約されている。NULL でなければならない。
%inst
生 EAP データで指定された Extensible Authentication Protocol (EAP)
ユーザー資格情報を設定する。

[戻り値]
関数が成功すると、戻り値は ERROR_SUCCESS となる。関数が失敗した場合、戻り値は次のいずれかのコードとなりうる。
このドキュメントは省略されている。

[備考]
WlanSetProfileEapUserData はプロファイルで使用する EAP ユーザー資格情報を設定する。Vista /
Server 2008 では呼び出し元のみ使用可。eapType は EAP_METHOD_TYPE
構造体で、種別、識別子、作者情報を含む。Windows 7 / Server 2008 R2 以降では dwFlags に
WLAN_SET_EAPHOST_DATA_ALL_USERS を指定することで全ユーザー用に設定できる。削除するには
pbEapUserData=NULL、dwFlags=WLAN_SET_EAPHOST_DATA_ALL_USERS、dwEapUserDataSize=0
とする。指定インターフェイスが取り外されている場合は ERROR_INVALID_PARAMETER で失敗しうる。


%index
WlanSetProfileEapXmlUserData
XML 文字列で指定された Extensible Authentication Protocol (EAP) ユーザー資格情報を設定する。
%prm
hClientHandle, pInterfaceGuid, strProfileName, dwFlags, strEapXmlUserData, pReserved
hClientHandle : [intptr] WlanOpenHandle の以前の呼び出しで取得したクライアントのセッション ハンドル。
pInterfaceGuid : [var] インターフェイスの GUID。
strProfileName : [wstr] EAP ユーザー データが関連付けられるプロファイル名。大文字と小文字を区別。NULL 終端。Windows XP SP3 および XP SP2 用 API: 名前は SSID から自動派生した名前と一致すること。
dwFlags : [int] 関数の動作を変更するフラグ。Windows XP SP3 / XP SP2 用 API、Vista、Server 2008 では予約で 0 を設定。
strEapXmlUserData : [wstr] ユーザー資格情報を設定する XML データへのポインタ。XML は EAPHost User Credentials スキーマに従う必要がある。
pReserved : [intptr] 将来の使用のために予約されている。NULL でなければならない。
%inst
XML 文字列で指定された Extensible Authentication Protocol (EAP) ユーザー資格情報を設定する。

[戻り値]
関数が成功すると、戻り値は ERROR_SUCCESS となる。関数が失敗した場合、戻り値は次のいずれかのコードとなりうる。
このドキュメントは省略されている。

[備考]
WlanSetProfileEapXmlUserData はプロファイルで使用する EAP ユーザー資格情報を設定する。認証に
802.1X を使うプロファイルでのみ呼び出し可能。Vista / Server 2008 では呼び出し元のみ使用可。Windows 10
/ Server 2016 以降では dwFlags に WLAN_SET_EAPHOST_DATA_ALL_USERS
を含めれば全ユーザー用に設定できる。EAP-TTLS 使用時に 64bit OS 上で 32bit
アプリケーションから呼び出すと接続失敗を引き起こすことがある。ターゲット OS と同じ CPU
アーキテクチャでビルドすべき。Windows XP SP3 / XP SP2 用 API: PEAP 資格情報にのみ使用可。


%index
WlanSetProfileList
プロファイルの優先順位を設定する。
%prm
hClientHandle, pInterfaceGuid, dwItems, strProfileNames, pReserved
hClientHandle : [intptr] WlanOpenHandle の以前の呼び出しで取得したクライアントのセッション ハンドル。
pInterfaceGuid : [var] インターフェイスの GUID。
dwItems : [int] strProfileNames 内のプロファイル数。
strProfileNames : [var] 希望順のプロファイル名配列。大文字と小文字を区別。NULL 終端。
pReserved : [intptr] 将来の使用のために予約されている。NULL を設定する必要がある。
%inst
プロファイルの優先順位を設定する。

[戻り値]
関数が成功すると、戻り値は ERROR_SUCCESS となる。関数が失敗した場合、戻り値は次のいずれかのコードとなりうる。
このドキュメントは省略されている。

[備考]
WlanSetProfileList は指定インターフェイス上の WLAN プロファイルの優先順位を設定する。リストは
WlanGetProfileList が返す現プロファイルと 1 対 1 に対応していなければならない。グループ ポリシー
プロファイルの位置は変更できない。指定インターフェイスが取り外されている場合は ERROR_INVALID_PARAMETER
で失敗しうる。


%index
WlanSetProfilePosition
優先リスト内の指定された単一プロファイルの位置を設定する。
%prm
hClientHandle, pInterfaceGuid, strProfileName, dwPosition, pReserved
hClientHandle : [intptr] WlanOpenHandle の以前の呼び出しで取得したクライアントのセッション ハンドル。
pInterfaceGuid : [var] インターフェイスの GUID。
strProfileName : [wstr] プロファイル名。大文字と小文字を区別。NULL 終端。Windows XP SP3 / XP SP2 用 API: SSID から自動派生した名前と一致すること。
dwPosition : [int] プロファイルを移動する優先リスト内の位置。0 は WlanGetProfileList が返すリストの先頭。
pReserved : [intptr] 将来の使用のために予約されている。NULL を設定する必要がある。
%inst
優先リスト内の指定された単一プロファイルの位置を設定する。

[戻り値]
関数が成功すると、戻り値は ERROR_SUCCESS となる。関数が失敗した場合、戻り値は次のいずれかのコードとなりうる。
このドキュメントは省略されている。

[備考]
グループ ポリシー プロファイルの位置は変更できない。既定では Administrators
のメンバーのみがすべてのユーザー用プロファイルの位置を変更できる。実際に必要な権限は WlanGetSecuritySettings
で確認する。コマンドラインからは netsh wlan set profileorder を使う。Windows XP SP3 / XP
SP2 用 API: アドホック プロファイルはインフラストラクチャ
プロファイルの後に配置される。アドホックをインフラストラクチャの前に置こうとしても Wireless Zero Configuration
が並べ替えを行う。ゲスト、WPS、WPA-None 認証のプロファイルは未対応で位置固定。指定インターフェイスが取り外されている場合は
ERROR_INVALID_PARAMETER で失敗しうる。


%index
WlanSetPsdIEDataList
近接サービス検出 (PSD) 情報要素 (IE) データ リストを設定する。
%prm
hClientHandle, strFormat, pPsdIEDataList, pReserved
hClientHandle : [intptr] WlanOpenHandle の以前の呼び出しで取得したクライアントのセッション ハンドル。
strFormat : [wstr] pPsdIEDataList に渡される PSD IE データ リスト内の PSD IE の形式。検出に使用するプロトコルの名前空間を指定する NULL 終端の URI 文字列。
pPsdIEDataList : [var] 設定する PSD IE データ リストを含む WLAN_RAW_DATA_LIST 構造体へのポインタ。
pReserved : [intptr] 将来の使用のために予約されている。NULL を設定する必要がある。
%inst
近接サービス検出 (PSD) 情報要素 (IE) データ リストを設定する。

[戻り値]
関数が成功すると、戻り値は ERROR_SUCCESS となる。関数が失敗した場合、戻り値は次のいずれかのコードとなりうる。
このドキュメントは省略されている。

[備考]
近接サービス検出プロトコルは、クライアントが物理的近接 (無線範囲) 内のサービスを検出できるようにする Microsoft
独自のプロトコルである。目的はサービス広告のような検出情報をビーコン フレームの一部として伝達すること。AP およびアドホック STA
は定期的にビーコンをブロードキャストし、これに独自の情報要素を複数または単一で含めうる。PSD IE
は受動的検出のために上位層プロトコルが提供する圧縮情報を伝達する。Windows Vista / Server 2008 の
Wireless LAN Service ではアドホック クライアント、アドホック サービス、インフラストラクチャ
クライアント向けの受動的検出をサポート。Windows 7 / Server 2008 R2 では加えてワイヤレス ホステッド
ネットワーク (ソフトウェア ベースの AP) でもサポートされ、開始前に WlanSetPsdIeDataList
で設定可能。設定後はビーコンおよびプローブ応答に含められる。
このドキュメントは省略されている。


%index
WlanSetSecuritySettings
構成可能オブジェクトのセキュリティ設定を設定する。
%prm
hClientHandle, SecurableObject, strModifiedSDDL
hClientHandle : [intptr] WlanOpenHandle の以前の呼び出しで取得したクライアントのセッション ハンドル。
SecurableObject : [int] セキュリティ設定が適用されるオブジェクトを指定する WLAN_SECURABLE_OBJECT 値。
strModifiedSDDL : [wstr] オブジェクトの新しいセキュリティ設定を指定するセキュリティ記述子文字列。NULL 終端でなければならない。詳細は解説を参照。
%inst
構成可能オブジェクトのセキュリティ設定を設定する。

[戻り値]
関数が成功すると、戻り値は ERROR_SUCCESS となる。関数が失敗した場合、戻り値は次のいずれかのコードとなりうる。
このドキュメントは省略されている。

[備考]
WlanSetSecuritySettings
の呼び出し成功はオブジェクトに関連付けられた既定アクセス権を上書きする。既定アクセス権の詳細は Native Wifi API
Permissions を参照。セキュリティ記述子オブジェクトの作成および文字列化の手順を以下に示す。
このドキュメントは省略されている。

