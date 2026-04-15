; ============================================================
;   wtsapi32.dll ヘルプ (CsWin32 / win32metadata から自動抽出)
;   docs_ja.json に日本語訳があればそちらを使用、無ければ英語原文。
;   翻訳を追加するときは docs_ja.json を編集して再生成。
; ============================================================

%type
拡張命令
%ver
1.0
%dll
wtsapi32.dll
%date
2026/04/16
%author
IronHSP / CsWin32 bridge
%url
https://github.com/inovia/IronHSP
%port
Win

%note
Win32 API の wtsapi32.dll 関数群。CsWin32 + win32metadata から自動生成。
hsp3net 専用 (intptr / NSTRUCT / wstr を使用)。

%group
Win32API

%index
WTSCloseServer
リモートデスクトップセッションホスト (RD セッションホスト) サーバーへの開かれたハンドルを閉じる。
%prm
hServer
hServer : [intptr] WTSOpenServer または WTSOpenServerEx を呼び出して開かれた RD セッションホストサーバーへのハンドル。このパラメータに WTS_CURRENT_SERVER_HANDLE を渡してはならない。
%inst
リモートデスクトップセッションホスト (RD セッションホスト) サーバーへの開かれたハンドルを閉じる。

[備考]
プログラムのクリーンアップルーチンの一部として WTSCloseServer を呼び出し、WTSOpenServer や
WTSOpenServerEx で開いた全サーバーハンドルを閉じる。ハンドルを閉じた後、そのハンドルは他の WTS API
で使用できない。


%index
WTSConnectSessionW
リモートデスクトップサービスセッションをローカルコンピュータの既存セッションに接続する。(Unicode)
%prm
LogonId, TargetLogonId, pPassword, bWait
LogonId : [int] 接続先のセッションのログオン ID。そのセッションのユーザは既存セッションへの接続権限を持つ必要がある。このセッションの出力は TargetLogonId で指定されたセッションにルーティングされる。LOGONID_CURRENT を指定すると現在のセッションを使う。
TargetLogonId : [int] LogonId の出力を受け取るセッションのログオン ID。LOGONID_CURRENT で現在のセッションを指定できる。
pPassword : [wstr] LogonId で指定したユーザーアカウントのパスワードへのポインタ。呼び出し元がログオン ID と同じドメイン名・ユーザ名でログオンしていれば空文字列でよい。NULL は不可。
bWait : [int] 操作が同期か非同期かを示す。TRUE で操作完了を待ち、FALSE で直ちに戻る。
%inst
リモートデスクトップサービスセッションをローカルコンピュータの既存セッションに接続する。(Unicode)

[戻り値]
関数が成功すると戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには GetLastError
を呼び出す。

[備考]
LogonId か TargetLogonId のいずれか一方を LOGONID_CURRENT にできるが、両方はできない。
> [!NOTE] > wtsapi32.h は WTSConnectSession を UNICODE マクロの定義に応じて
ANSI/Unicode を自動選択するエイリアスとして定義している。


%index
WTSCreateListenerW
新しいリモートデスクトップサービスリスナーを作成するか既存リスナーを構成する。(Unicode)
%prm
hServer, pReserved, Reserved, pListenerName, pBuffer, flag
hServer : [intptr] RD セッションホストサーバーへのハンドル。常に WTS_CURRENT_SERVER_HANDLE に設定する。
pReserved : [intptr] このパラメータは予約されている。常に NULL に設定する。
Reserved : [int] このパラメータは予約されている。常に 0 に設定する。
pListenerName : [wstr] 作成または構成するリスナー名を含む NULL 終端文字列へのポインタ。
pBuffer : [var] リスナーの構成情報を含む WTSLISTENERCONFIG 構造体へのポインタ。
flag : [int] 
%inst
新しいリモートデスクトップサービスリスナーを作成するか既存リスナーを構成する。(Unicode)

[戻り値]
関数が成功すると戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには GetLastError
を呼び出す。

[備考]
この関数は RDP を使うリスナーを作成または構成する。pBuffer が指す WTSLISTENERCONFIG 構造体の
version メンバは常に 1
に設定する。この関数はセキュリティ記述子の作成・設定を行わない。新規作成時は既定のセキュリティ記述子が割り当てられ、変更するには
WTSSetListenerSecurity を呼び出す。設定値の検証は行わないので、呼び出し前に有効であることを確認する必要がある。
> [!NOTE] > wtsapi32.h は WTSCreateListener を ANSI/Unicode
自動選択エイリアスとして定義している。


%index
WTSDisconnectSession
指定リモートデスクトップサービスセッションからログオン中のユーザを、セッションを閉じずに切断する。
%prm
hServer, SessionId, bWait
hServer : [intptr] RD セッションホストサーバーへのハンドル。WTSOpenServer/WTSOpenServerEx で開いたハンドル、またはアプリ実行中サーバーを示す WTS_CURRENT_SERVER_HANDLE を指定する。
SessionId : [int] リモートデスクトップサービスセッション識別子。現在のセッションを示すには WTS_CURRENT_SESSION を指定する。全セッションの識別子を取得するには WTSEnumerateSessions を使う。他ユーザのセッションを切断するには Disconnect 権限が必要である。RD 仮想化ホスト上の仮想マシンのセッションを切断するには Administrators グループのメンバである必要がある。
bWait : [int] 操作が同期か非同期かを示す。TRUE で完了を待ち、FALSE で直ちに戻る。
%inst
指定リモートデスクトップサービスセッションからログオン中のユーザを、セッションを閉じずに切断する。

[戻り値]
関数が成功すると戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには GetLastError
を呼び出す。


%index
WTSEnableChildSessions
子セッションを有効または無効にする。
%prm
bEnable
bEnable : [int] 子セッションを有効または無効にするかを示す。TRUE で有効化、FALSE で無効化。
%inst
子セッションを有効または無効にする。

[戻り値]
関数が成功すれば 0 以外、そうでなければ 0 を返す。

[備考]
子セッションの詳細については Child Sessions を参照。


%index
WTSEnumerateListenersW
RD セッションホストサーバー上の全リモートデスクトップサービスリスナーを列挙する。(Unicode)
%prm
hServer, pReserved, Reserved, pListeners, pCount
hServer : [intptr] RD セッションホストサーバーへのハンドル。常に WTS_CURRENT_SERVER_HANDLE に設定する。
pReserved : [intptr] このパラメータは予約されている。常に NULL に設定する。
Reserved : [int] このパラメータは予約されている。常に 0 に設定する。
pListeners : [var] リスナー名を受け取る WTSLISTENERNAME 配列へのポインタ。
pCount : [var] pListeners 配列内のリスナー名数を含む DWORD 変数へのポインタ。リスナー数が不明なら pListeners に NULL を渡すと必要な WTSLISTENERNAME 変数の数が返される。
%inst
RD セッションホストサーバー上の全リモートデスクトップサービスリスナーを列挙する。(Unicode)

[戻り値]
関数が成功すると戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには GetLastError
を呼び出す。

[備考]
この関数はサーバー上で現在動作中の全リスナーを返す (RDP をサポートしないものも含む)。リスナー数が不明な場合、pListeners
を NULL にして呼ぶと pCount に必要数が返る。その数で配列を確保し、pListeners を新しい配列、pCount
を最初の呼び出しで返された数にして再度呼ぶ。
> [!NOTE] > wtsapi32.h は WTSEnumerateListeners を ANSI/Unicode
自動選択エイリアスとして定義している。


%index
WTSEnumerateProcessesW
指定 RD セッションホストサーバー上のアクティブプロセスに関する情報を取得する。(Unicode)
%prm
hServer, Reserved, Version, ppProcessInfo, pCount
hServer : [intptr] RD セッションホストサーバーへのハンドル。WTSOpenServer で開いたハンドル、または WTS_CURRENT_SERVER_HANDLE を指定する。
Reserved : [int] 予約されている。0 でなければならない。
Version : [int] 列挙要求のバージョンを指定する。1 でなければならない。
ppProcessInfo : [var] WTS_PROCESS_INFO 配列へのポインタを受け取る変数へのポインタ。各構造体は指定 RD セッションホスト上のアクティブプロセスの情報を含む。返されたバッファは WTSFreeMemory で解放する。
pCount : [var] ppProcessInfo バッファに返される WTS_PROCESS_INFO 構造体数を受け取る変数へのポインタ。
%inst
指定 RD セッションホストサーバー上のアクティブプロセスに関する情報を取得する。(Unicode)

[戻り値]
関数が成功すると戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには GetLastError
を呼び出す。

[備考]
他ユーザのコンテキストで動作中のプロセスを列挙するには Administrators グループのメンバである必要がある。
> [!NOTE] > wtsapi32.h は WTSEnumerateProcesses を ANSI/Unicode
自動選択エイリアスとして定義している。


%index
WTSEnumerateProcessesExW
指定 RD セッションホストサーバーまたは RD 仮想化ホストサーバー上のアクティブプロセスに関する情報を取得する。(Unicode)
%prm
hServer, pLevel, SessionId, ppProcessInfo, pCount
hServer : [intptr] RD セッションホストサーバーへのハンドル。WTSOpenServer で開いたハンドル、または WTS_CURRENT_SERVER_HANDLE を指定する。
pLevel : [var] 入力時に返す情報種別を指定する DWORD。0 で WTS_PROCESS_INFO 配列、1 で WTS_PROCESS_INFO_EX 配列を返す。無効値を指定すると出力で 1 に設定されエラーを返す。それ以外の場合は変更されない。
SessionId : [int] プロセスを列挙するセッション。全セッションを対象にするには WTS_ANY_SESSION を指定する。
ppProcessInfo : [var] WTS_PROCESS_INFO または WTS_PROCESS_INFO_EX 配列へのポインタを受け取る変数へのポインタ。構造体の型は pLevel で決まる。各構造体はアクティブプロセスの情報を含む。使用後は WTSFreeMemoryEx で解放し、ポインタを NULL に設定する。
pCount : [var] ppProcessInfo バッファに返される構造体数を受け取る変数へのポインタ。
%inst
指定 RD セッションホストサーバーまたは RD 仮想化ホストサーバー上のアクティブプロセスに関する情報を取得する。(Unicode)

[戻り値]
関数が成功すると戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには GetLastError
を呼び出す。

[備考]
他ユーザのセッションで動作中のプロセスを列挙するには Administrators グループのメンバである必要がある。
> [!NOTE] > wtsapi32.h は WTSEnumerateProcessesEx を ANSI/Unicode
自動選択エイリアスとして定義している。


%index
WTSEnumerateServersW
指定ドメイン内の全 RD セッションホストサーバーのリストを返す。(Unicode)
%prm
pDomainName, Reserved, Version, ppServerInfo, pCount
pDomainName : [wstr] 問い合わせるドメイン名へのポインタ。NULL なら現在のドメインが指定される。
Reserved : [int] 予約されている。0 でなければならない。
Version : [int] 列挙要求のバージョン。1 でなければならない。
ppServerInfo : [var] 列挙結果を含む WTS_SERVER_INFO 配列を指す。使用後は WTSFreeMemory で解放する。
pCount : [var] ppServerInfo バッファに返される WTS_SERVER_INFO 構造体数を受け取る変数へのポインタ。
%inst
指定ドメイン内の全 RD セッションホストサーバーのリストを返す。(Unicode)

[戻り値]
関数が成功すると戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには GetLastError
を呼び出す。

[備考]
NetBT が無効な場合この関数は動作しない。
> [!NOTE] > wtsapi32.h は WTSEnumerateServers を ANSI/Unicode
自動選択エイリアスとして定義している。


%index
WTSEnumerateSessionsW
RD セッションホストサーバー上のセッション一覧を取得する。(Unicode)
%prm
hServer, Reserved, Version, ppSessionInfo, pCount
hServer : [intptr] RD セッションホストサーバーへのハンドル。注: WTSOpenServer/WTSOpenServerEx で特定サーバーのハンドルを取得するか、アプリ実行中サーバーには WTS_CURRENT_SERVER_HANDLE を使う。
Reserved : [int] このパラメータは予約されている。0 でなければならない。
Version : [int] 列挙要求のバージョン。1 でなければならない。
ppSessionInfo : [var] 取得されたセッションを表す WTS_SESSION_INFO 配列へのポインタ。使用後は WTSFreeMemory で解放する。このドキュメントは省略されている。
pCount : [var] ppSessionInfo に返される WTS_SESSION_INFO 構造体数へのポインタ。
%inst
RD セッションホストサーバー上のセッション一覧を取得する。(Unicode)

[戻り値]
関数が失敗すると 0 を返す。関数が成功すると 0 以外を返す。拡張エラー情報を取得するには GetLastError を呼び出す。

[備考]
> [!NOTE] > wtsapi32.h は WTSEnumerateSessions を ANSI/Unicode
自動選択エイリアスとして定義している。


%index
WTSEnumerateSessionsExW
指定 RD セッションホストまたは RD 仮想化ホストサーバー上のセッション一覧を取得する。(Unicode)
%prm
hServer, pLevel, Filter, ppSessionInfo, pCount
hServer : [intptr] 対象サーバーへのハンドル。WTSOpenServer/WTSOpenServerEx で返されたハンドルを指定する。アプリ実行中サーバーを対象にするには WTS_CURRENT_SERVER_HANDLE を指定する。
pLevel : [var] このパラメータは予約されている。常に 1 に設定する。出力時に値は変更されない。
Filter : [int] このパラメータは予約されている。常に 0 に設定する。
ppSessionInfo : [var] WTS_SESSION_INFO_1 配列へのポインタを受け取る PWTS_SESSION_INFO_1 変数へのポインタ。各構造体は指定 RD セッションホスト上のセッション情報を含む。WTSOpenServerEx で開いた RD 仮想化ホストのハンドルなら、仮想マシン上のセッション情報となる。使用後は WTSFreeMemoryEx で解放し、ポインタを NULL に設定する。
pCount : [var] ppSessionInfo バッファに返される WTS_SESSION_INFO_1 構造体数を受け取る DWORD 変数へのポインタ。
%inst
指定 RD セッションホストまたは RD 仮想化ホストサーバー上のセッション一覧を取得する。(Unicode)

[戻り値]
関数が成功すると戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには GetLastError
を呼び出す。

[備考]
RD 仮想化ホスト上の仮想マシンセッション情報を取得するには WTSOpenServerEx
でハンドルを取得する必要がある。返されたバッファを解放するには WTSFreeMemoryEx を呼び出し WTSClassType に
WTSTypeSessionInfoLevel1 を指定する。セッションを列挙するには Query Information
権限が必要である。仮想マシンセッションを列挙するには Administrators グループのメンバである必要がある。
> [!NOTE] > wtsapi32.h は WTSEnumerateSessionsEx を ANSI/Unicode
自動選択エイリアスとして定義している。


%index
WTSFreeMemory
リモートデスクトップサービス関数が割り当てたメモリを解放する。
%prm
pMemory
pMemory : [intptr] 解放するメモリへのポインタ。
%inst
リモートデスクトップサービス関数が割り当てたメモリを解放する。

[備考]
いくつかのリモートデスクトップサービス関数は情報を返すためにバッファを割り当てる。WTSFreeMemory
を使ってこれらのバッファを解放する。


%index
WTSFreeMemoryExW
リモートデスクトップサービス関数で割り当てられた WTS_PROCESS_INFO_EX または WTS_SESSION_INFO_1 構造体を含むメモリを解放する。(Unicode)
%prm
WTSTypeClass, pMemory, NumberOfEntries
WTSTypeClass : [int] pMemory に含まれる構造体の型を指定する WTS_TYPE_CLASS 列挙型の値。
pMemory : [intptr] 解放するバッファへのポインタ。
NumberOfEntries : [int] pMemory が参照するバッファ内の要素数。
%inst
リモートデスクトップサービス関数で割り当てられた WTS_PROCESS_INFO_EX または WTS_SESSION_INFO_1
構造体を含むメモリを解放する。(Unicode)

[戻り値]
関数が成功すると戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには GetLastError
を呼び出す。

[備考]
いくつかのリモートデスクトップサービス関数はバッファを割り当てる。WTS_PROCESS_INFO_EX や
WTS_SESSION_INFO_1 を含むバッファは WTSFreeMemoryEx で解放する必要がある。他のバッファは
WTSFreeMemory でも WTSFreeMemoryEx でも解放できる。
> [!NOTE] > wtsapi32.h は WTSFreeMemoryEx を ANSI/Unicode
自動選択エイリアスとして定義している。


%index
WTSGetChildSessionId
存在する場合は子セッション識別子を取得する。
%prm
pSessionId
pSessionId : [var] 子セッション識別子を受け取る ULONG 変数のアドレス。現在のセッションに子セッションがなければ (ULONG)-1 となる。
%inst
存在する場合は子セッション識別子を取得する。

[戻り値]
関数が成功すれば 0 以外、そうでなければ 0 を返す。

[備考]
子セッションの詳細については Child Sessions を参照。


%index
WTSGetListenerSecurityW
リモートデスクトップサービスリスナーのセキュリティ記述子を取得する。(Unicode)
%prm
hServer, pReserved, Reserved, pListenerName, SecurityInformation, pSecurityDescriptor, nLength, lpnLengthNeeded
hServer : [intptr] RD セッションホストサーバーへのハンドル。常に WTS_CURRENT_SERVER_HANDLE に設定する。
pReserved : [intptr] このパラメータは予約されている。常に NULL に設定する。
Reserved : [int] このパラメータは予約されている。常に 0 に設定する。
pListenerName : [wstr] リスナー名を含む NULL 終端文字列へのポインタ。
SecurityInformation : [int] 取得するセキュリティ情報を指定する SECURITY_INFORMATION 値。DACL_SECURITY_INFORMATION と SACL_SECURITY_INFORMATION フラグを常に有効にする。
pSecurityDescriptor : [int] pListenerName が参照するリスナーに関連付けられたセキュリティ情報を受け取る SECURITY_DESCRIPTOR 構造体へのポインタ。構造体は自己相対形式で返される。
nLength : [int] pSecurityDescriptor が指す SECURITY_DESCRIPTOR 構造体のサイズ (バイト単位)。
lpnLengthNeeded : [var] 完全なセキュリティ記述子を格納するのに必要なバイト数を受け取る変数へのポインタ。nLength 以下なら pSecurityDescriptor が指す SECURITY_DESCRIPTOR 構造体にコピーされる。
%inst
リモートデスクトップサービスリスナーのセキュリティ記述子を取得する。(Unicode)

[戻り値]
関数が成功すると戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには GetLastError
を呼び出す。

[備考]
必要なバッファサイズが不明な場合、nLength を 0 にして呼ぶと lpnLengthNeeded
に必要バイト数が返る。それに基づいてバッファを確保し、pSecurityDescriptor と nLength
を再設定してもう一度呼ぶ。
> [!NOTE] > wtsapi32.h は WTSGetListenerSecurity を ANSI/Unicode
自動選択エイリアスとして定義している。


%index
WTSIsChildSessionsEnabled
子セッションが有効かどうかを判定する。
%prm
pbEnabled
pbEnabled : [var] 子セッションが有効なら 0 以外、そうでなければ 0 を受け取る BOOL 変数のアドレス。
%inst
子セッションが有効かどうかを判定する。

[戻り値]
関数が成功すれば 0 以外、そうでなければ 0 を返す。

[備考]
子セッションの詳細については Child Sessions を参照。


%index
WTSLogoffSession
指定リモートデスクトップサービスセッションをログオフする。
%prm
hServer, SessionId, bWait
hServer : [intptr] RD セッションホストサーバーへのハンドル。WTSOpenServer/WTSOpenServerEx で開いたハンドル、または WTS_CURRENT_SERVER_HANDLE を指定する。
SessionId : [int] リモートデスクトップサービスセッション識別子。現在のセッションを示すには WTS_CURRENT_SESSION を指定する。他ユーザのセッションをログオフするには Reset 権限が必要である。RD 仮想化ホスト上の仮想マシンのセッションをログオフするには Administrators グループのメンバである必要がある。
bWait : [int] 操作が同期か非同期かを示す。TRUE ならログオフ完了時に戻り、FALSE なら直ちに戻る。ログオフ済みを確認するには WTSQuerySessionInformation に当該セッション ID を渡す (ログオフ済みなら 0 を返す)。
%inst
指定リモートデスクトップサービスセッションをログオフする。

[戻り値]
関数が成功すると戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには GetLastError
を呼び出す。


%index
WTSOpenServerW
指定 RD セッションホストサーバーへのハンドルを開く。(Unicode)
%prm
pServerName
pServerName : [wstr] RD セッションホストサーバーの NetBIOS 名を指定する NULL 終端文字列へのポインタ。
%inst
指定 RD セッションホストサーバーへのハンドルを開く。(Unicode)

[戻り値]
関数が成功すると戻り値は指定サーバーへのハンドルとなる。関数が失敗した場合、無効なハンドルを返す。

[備考]
WTSOpenServer で返されたハンドルは使用後 WTSCloseServer
で解放する。アプリ実行中サーバーに対してはハンドルを開く必要はなく、WTS_CURRENT_SERVER_HANDLE を使う。
> [!NOTE] > wtsapi32.h は WTSOpenServer を ANSI/Unicode
自動選択エイリアスとして定義している。


%index
WTSOpenServerExW
指定 RD セッションホストまたは RD 仮想化ホストサーバーへのハンドルを開く。(Unicode)
%prm
pServerName
pServerName : [wstr] サーバーの NetBIOS 名を含む NULL 終端文字列へのポインタ。
%inst
指定 RD セッションホストまたは RD 仮想化ホストサーバーへのハンドルを開く。(Unicode)

[戻り値]

関数が成功すると戻り値は指定サーバーへのハンドルとなる。関数が失敗した場合、無効なハンドルを返す。他の関数呼び出しで使用してハンドルの有効性をテストできる。

[備考]
pServerName が RD セッションホストサーバーの場合、この関数の動作は WTSOpenServer と同一である。アプリ実行中
RD 仮想化ホスト上の仮想マシンセッションを扱うには WTS_CURRENT_SERVER_NAME を指定する。使用後は
WTSCloseServer でハンドルを解放する。
> [!NOTE] > wtsapi32.h は WTSOpenServerEx を ANSI/Unicode
自動選択エイリアスとして定義している。


%index
WTSQueryListenerConfigW
リモートデスクトップサービスリスナーの構成情報を取得する。(Unicode)
%prm
hServer, pReserved, Reserved, pListenerName, pBuffer
hServer : [intptr] RD セッションホストサーバーへのハンドル。常に WTS_CURRENT_SERVER_HANDLE に設定する。
pReserved : [intptr] このパラメータは予約されている。常に NULL に設定する。
Reserved : [int] このパラメータは予約されている。常に 0 に設定する。
pListenerName : [wstr] 問い合わせるリスナー名を含む NULL 終端文字列へのポインタ。
pBuffer : [var] 取得したリスナー構成情報を受け取る WTSLISTENERCONFIG 構造体へのポインタ。
%inst
リモートデスクトップサービスリスナーの構成情報を取得する。(Unicode)

[戻り値]
関数が成功すると戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには GetLastError
を呼び出す。

[備考]
この関数はリスナーのセキュリティ記述子を取得しない。取得するには WTSGetListenerSecurity を呼び出す。
> [!NOTE] > wtsapi32.h は WTSQueryListenerConfig を ANSI/Unicode
自動選択エイリアスとして定義している。


%index
WTSQuerySessionInformationW
指定 RD セッションホストサーバー上の指定セッションのセッション情報を取得する。(Unicode)
%prm
hServer, SessionId, WTSInfoClass, ppBuffer, pBytesReturned
hServer : [intptr] RD セッションホストサーバーへのハンドル。WTSOpenServer で開いたハンドル、または WTS_CURRENT_SERVER_HANDLE を指定する。
SessionId : [int] リモートデスクトップサービスセッション識別子。呼び出し元アプリが動作中のセッション (現在のセッション) を示すには WTS_CURRENT_SESSION を指定する。ローカルサーバー上で情報取得する場合のみ WTS_CURRENT_SESSION を指定すること。リモートサーバーで指定すると返される情報は信頼できない。他ユーザのセッション情報を問い合わせるには Query Information 権限が必要である。
WTSInfoClass : [int] 取得するセッション情報の種類を示す WTS_INFO_CLASS 列挙の値。
ppBuffer : [var] 要求された情報へのポインタを受け取る変数へのポインタ。データの形式・内容は WTSInfoClass に依存する。使用後は WTSFreeMemory で解放する。
pBytesReturned : [var] ppBuffer に返されるデータのバイトサイズを受け取る変数へのポインタ。
%inst
指定 RD セッションホストサーバー上の指定セッションのセッション情報を取得する。(Unicode)

[戻り値]
関数が成功すると戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには GetLastError
を呼び出す。

[備考]
リモートデスクトップサービス実行中に現在のセッション ID を取得するには、SessionId を
WTS_CURRENT_SESSION、WTSInfoClass を WTSSessionId にして呼び出す。セッション ID は
ppBuffer で返される。リモートデスクトップサービスが動作していないと呼び出しは失敗する。その場合は
ProcessIdToSessionId で取得できる。アプリが物理コンソール上で動作中か判定するには
WTS_CURRENT_SESSION と WTSClientProtocolType を指定する。ppBuffer が "0"
なら物理コンソールにアタッチされている。
> [!NOTE] > wtsapi32.h は WTSQuerySessionInformation を ANSI/Unicode
自動選択エイリアスとして定義している。


%index
WTSQueryUserConfigW
指定ドメインコントローラまたは RD セッションホストサーバー上の指定ユーザの構成情報を取得する。(Unicode)
%prm
pServerName, pUserName, WTSConfigClass, ppBuffer, pBytesReturned
pServerName : [wstr] ドメインコントローラまたは RD セッションホストサーバーの名前を含む NULL 終端文字列へのポインタ。アプリ実行中サーバーを指定するには WTS_CURRENT_SERVER_NAME を指定する。
pUserName : [wstr] 問い合わせるユーザ名を含む NULL 終端文字列へのポインタ。RD セッションホストサーバーの既定ユーザ設定を取得するには NULL に設定する。Windows Server 2008 および Windows Vista では NULL はエラーとなる。
WTSConfigClass : [int] 取得する情報の種類を指定する。WTS_CONFIG_CLASS 列挙型の値のいずれか。ppBuffer に返されるデータの形式はこの列挙のドキュメントを参照。
ppBuffer : [var] 要求された情報へのポインタを受け取る変数へのポインタ。データの形式・内容は WTSConfigClass に依存する。使用後は WTSFreeMemory で解放する。
pBytesReturned : [var] ppBuffer に返されるデータのバイトサイズを受け取る変数へのポインタ。
%inst
指定ドメインコントローラまたは RD セッションホストサーバー上の指定ユーザの構成情報を取得する。(Unicode)

[戻り値]
関数が成功すると戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには GetLastError
を呼び出す。

[備考]
WTSQueryUserConfig と WTSSetUserConfig
はハンドルではなくサーバー名を渡す。ユーザアカウント情報はドメインコントローラに存在することが多いためである。設定するにはプライマリドメインコントローラを使う。NetGetDCName
でプライマリ DC 名を取得できる。問い合わせには NetGetAnyDCName や DsGetDcName を使える。
> [!NOTE] > wtsapi32.h は WTSQueryUserConfig を ANSI/Unicode
自動選択エイリアスとして定義している。


%index
WTSQueryUserToken
セッション ID で指定されたログオン中ユーザのプライマリアクセストークンを取得する。
%prm
SessionId, phToken
SessionId : [int] リモートデスクトップサービスセッション識別子。サービスのコンテキストで動作するプログラムはセッション ID 0 を持つ。他ユーザのセッション情報を問い合わせるには Query Information 権限が必要である。
phToken : [intptr] 関数が成功した場合、ログオン中ユーザのトークンハンドルへのポインタを受け取る。使用後は CloseHandle で閉じる必要がある。
%inst
セッション ID で指定されたログオン中ユーザのプライマリアクセストークンを取得する。

[戻り値]
関数が成功すると戻り値は 0 以外となり、phToken はユーザのプライマリトークンを指す。関数が失敗した場合、戻り値は 0
となる。拡張エラー情報を取得するには GetLastError を呼び出す。

[備考]
プライマリトークンについては Access Tokens を参照。アカウント権限については Remote Desktop Services
Permissions と Authorization Constants を参照。LocalSystem アカウントの権限については
LocalSystem account を参照。


%index
WTSRegisterSessionNotification
指定ウィンドウをセッション変更通知の受信用に登録する。(WTSRegisterSessionNotification)
%prm
hWnd, dwFlags
hWnd : [intptr] セッション変更通知を受信するウィンドウのハンドル。
dwFlags : [int] 受信するセッション通知を指定する。次のいずれかの値を指定できる。
%inst
指定ウィンドウをセッション変更通知の受信用に登録する。(WTSRegisterSessionNotification)

[戻り値]
関数が成功すると戻り値は TRUE となる。そうでなければ FALSE となる。拡張エラー情報を取得するには GetLastError
を呼び出す。

[備考]
リモートデスクトップサービスの依存サービスが起動する前にこの関数を呼び出すと RPC_S_INVALID_BINDING
が返る可能性がある。Global\\TermSrvReadyEvent
グローバルイベントがセットされると全依存サービスが起動済みとなる。セッション変更通知は WM_WTSSESSION_CHANGE
メッセージの形で送られ、登録したウィンドウのみに送信される。ウィンドウが通知を必要としなくなった場合、破棄前に
WTSUnRegisterSessionNotification
を呼ぶ必要がある。各呼び出しに対応する解除呼び出しが必要である。既に登録済みハンドルならば dwFlags
は無視される。サービスから通知を受信するには HandlerEx 関数を使う。


%index
WTSRegisterSessionNotificationEx
指定ウィンドウをセッション変更通知の受信用に登録する。(WTSRegisterSessionNotificationEx)
%prm
hServer, hWnd, dwFlags
hServer : [intptr] WTSOpenServer または WTS_CURRENT_SERVER から返されたサーバーのハンドル。
hWnd : [intptr] セッション変更通知を受信するウィンドウのハンドル。
dwFlags : [int] 受信するセッション通知を指定する。hServer がリモートサーバーなら NOTIFY_FOR_THIS_SESSION のみ指定可能。
%inst
指定ウィンドウをセッション変更通知の受信用に登録する。(WTSRegisterSessionNotificationEx)

[戻り値]
関数が成功すると戻り値は TRUE となる。そうでなければ FALSE となる。拡張エラー情報を取得するには GetLastError
を呼び出す。

[備考]
リモートデスクトップサービスの依存サービスが起動前に呼ぶと RPC_S_INVALID_BINDING
が返る可能性がある。"Global\\TermSrvReadyEvent"
がセットされると依存サービスは全て起動済みとなる。セッション変更通知は WM_WTSSESSION_CHANGE
として送信され、登録ウィンドウのみに送られる。使用終了時は WTSUnRegisterSessionNotificationEx
を呼び、各登録に対応する解除を行う。既登録ハンドルなら dwFlags は無視される。サービスからの通知受信には HandlerEx
を使う。


%index
WTSSendMessageW
指定リモートデスクトップサービスセッションのクライアントデスクトップにメッセージボックスを表示する。(Unicode)
%prm
hServer, SessionId, pTitle, TitleLength, pMessage, MessageLength, Style, Timeout, pResponse, bWait
hServer : [intptr] RD セッションホストサーバーへのハンドル。WTSOpenServer で開いたハンドル、または WTS_CURRENT_SERVER_HANDLE を指定する。
SessionId : [int] リモートデスクトップサービスセッション識別子。現在のセッションを示すには WTS_CURRENT_SESSION を指定する。他ユーザのセッションにメッセージを送るには Message 権限が必要である。
pTitle : [wstr] メッセージボックスのタイトルバー用 NULL 終端文字列へのポインタ。
TitleLength : [int] タイトルバー文字列の長さ (バイト単位)。
pMessage : [wstr] 表示するメッセージを含む NULL 終端文字列へのポインタ。
MessageLength : [int] メッセージ文字列の長さ (バイト単位)。
Style : [int] メッセージボックスの内容と動作。通常は MB_OK を指定する。完全な値一覧は MessageBox の uType を参照。
Timeout : [int] ユーザ応答を待つ時間 (秒)。時間内に応答がなければ pResponse に IDTIMEOUT が返る。Timeout が 0 なら無期限に待つ。
pResponse : [var] 
bWait : [int] TRUE ならユーザ応答またはタイムアウトまで戻らない (Timeout 0 なら応答まで戻らない)。FALSE なら直ちに戻り pResponse に IDASYNC が返る。応答を呼び出し元に返す必要のない簡単な情報メッセージ用。
%inst
指定リモートデスクトップサービスセッションのクライアントデスクトップにメッセージボックスを表示する。(Unicode)

[戻り値]
関数が成功すると戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには GetLastError
を呼び出す。

[備考]
> [!NOTE] > wtsapi32.h は WTSSendMessage を ANSI/Unicode
自動選択エイリアスとして定義している。


%index
WTSSetListenerSecurityW
リモートデスクトップサービスリスナーのセキュリティ記述子を構成する。(Unicode)
%prm
hServer, pReserved, Reserved, pListenerName, SecurityInformation, pSecurityDescriptor
hServer : [intptr] RD セッションホストサーバーへのハンドル。常に WTS_CURRENT_SERVER_HANDLE に設定する。
pReserved : [intptr] このパラメータは予約されている。常に NULL に設定する。
Reserved : [int] このパラメータは予約されている。常に 0 に設定する。
pListenerName : [wstr] リスナー名を含む NULL 終端文字列へのポインタ。
SecurityInformation : [int] 設定するセキュリティ情報を指定する SECURITY_INFORMATION 値。DACL_SECURITY_INFORMATION と SACL_SECURITY_INFORMATION フラグを常に有効にする。
pSecurityDescriptor : [int] リスナーに関連付けるセキュリティ情報を含む SECURITY_DESCRIPTOR 構造体へのポインタ。
%inst
リモートデスクトップサービスリスナーのセキュリティ記述子を構成する。(Unicode)

[戻り値]
関数が成功すると戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには GetLastError
を呼び出す。

[備考]
> [!NOTE] > wtsapi32.h は WTSSetListenerSecurity を ANSI/Unicode
自動選択エイリアスとして定義している。


%index
WTSSetRenderHint
リモートセッションでの表示に最適化可能なコンテンツを表示するアプリが、ウィンドウ内の実コンテンツ領域を識別するために使用する。
%prm
pRenderHintID, hwndOwner, renderHintType, cbHintDataLength, pHintData
pRenderHintID : [var] この呼び出しで影響するレンダリングヒントを識別する値のアドレス。新しいヒントを作成するなら 0 を指定する。関数は一意なヒント識別子を返し、後続のクリア呼び出し等で使う。
hwndOwner : [intptr] レンダリングヒントの寿命を紐付けるウィンドウのハンドル。ヒントターゲットが明示クリアされずに削除された場合に使われる。
renderHintType : [int] この呼び出しが表すヒント種別。
cbHintDataLength : [int] pHintData バッファのサイズ (BYTE 単位)。
pHintData : [var] ヒントの追加データ。形式は renderHintType に依存する。
%inst
リモートセッションでの表示に最適化可能なコンテンツを表示するアプリが、ウィンドウ内の実コンテンツ領域を識別するために使用する。

[戻り値]
関数が成功すると S_OK を返す。そうでなければ HRESULT エラーコードを返す。


%index
WTSSetUserConfigW
指定ドメインコントローラまたは RD セッションホストサーバー上の指定ユーザの構成情報を変更する。(Unicode)
%prm
pServerName, pUserName, WTSConfigClass, pBuffer, DataLength
pServerName : [wstr] ドメインコントローラまたは RD セッションホストサーバーの名前を含む NULL 終端文字列へのポインタ。WTS_CURRENT_SERVER_NAME でアプリ実行中サーバーを指定できる。
pUserName : [wstr] 設定対象ユーザ名を含む NULL 終端文字列へのポインタ。
WTSConfigClass : [int] 設定する情報の種類を指定する。WTS_CONFIG_CLASS 列挙型の値のいずれか。ppBuffer に指定するデータの形式はこの列挙のドキュメントを参照。
pBuffer : [wstr] 指定ユーザの構成を変更するデータへのポインタ。
DataLength : [int] pBuffer バッファのサイズ (TCHAR 単位)。
%inst
指定ドメインコントローラまたは RD セッションホストサーバー上の指定ユーザの構成情報を変更する。(Unicode)

[戻り値]
関数が成功すると戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには GetLastError
を呼び出す。

[備考]
WTSQueryUserConfig と WTSSetUserConfig
はハンドルではなくサーバー名を渡す。ユーザアカウント情報はドメインコントローラに存在することが多いためである。設定にはプライマリドメインコントローラを使う。NetGetDCName
でプライマリ DC 名を取得できる。WTSConfigClass の値が WTS_CONFIG_CLASS
列挙の整数値に対応する場合、設定値を DWORD として定義し、LPWSTR にキャストして WTSSetUserConfig
に渡す必要がある。このドキュメントは省略されている。


%index
WTSShutdownSystem
指定 RD セッションホストサーバーをシャットダウン (または再起動) する。
%prm
hServer, ShutdownFlag
hServer : [intptr] RD セッションホストサーバーへのハンドル。WTSOpenServer で開いたハンドル、または WTS_CURRENT_SERVER_HANDLE を指定する。
ShutdownFlag : [int] 
%inst
指定 RD セッションホストサーバーをシャットダウン (または再起動) する。

[戻り値]
関数が成功すると戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには GetLastError
を呼び出す。

[備考]

システムシャットダウンは全ユーザとアクティブプログラムを終了させる。シャットダウン中には次の手順が実行される。このドキュメントは省略されている。


%index
WTSStartRemoteControlSessionW
別のリモートデスクトップサービスセッションのリモート制御を開始する。この関数はリモートセッションから呼び出す必要がある。(Unicode)
%prm
pTargetServerName, TargetLogonId, HotkeyVk, HotkeyModifiers
pTargetServerName : [wstr] リモート制御対象のセッションが存在するサーバー名へのポインタ。
TargetLogonId : [int] リモート制御対象のセッションのログオン ID。
HotkeyVk : [int] リモート制御を停止するために押すキーを表す仮想キーコード。HotkeyModifiers と組み合わせて使う。
HotkeyModifiers : [int] リモート制御を停止するために押すキーを表す仮想修飾子。HotkeyVk と組み合わせて使う。例えば HotkeyVk に VK_MULTIPLY、HotkeyModifiers に REMOTECONTROL_KBDCTRL_HOTKEY を指定した場合、Ctrl + * で停止できる。
%inst
別のリモートデスクトップサービスセッションのリモート制御を開始する。この関数はリモートセッションから呼び出す必要がある。(Unicode)

[戻り値]
関数が成功すると戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには GetLastError
を呼び出す。

[備考]
> [!NOTE] > wtsapi32.h は WTSStartRemoteControlSession を ANSI/Unicode
自動選択エイリアスとして定義している。


%index
WTSStopRemoteControlSession
リモート制御セッションを停止する。
%prm
LogonId
LogonId : [int] リモート制御を停止するセッションのログオン ID。
%inst
リモート制御セッションを停止する。

[戻り値]
関数が成功すると戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには GetLastError
を呼び出す。


%index
WTSTerminateProcess
指定 RD セッションホストサーバー上の指定プロセスを終了させる。
%prm
hServer, ProcessId, ExitCode
hServer : [intptr] RD セッションホストサーバーへのハンドル。WTSOpenServer で開いたハンドル、または WTS_CURRENT_SERVER_HANDLE を指定する。
ProcessId : [int] 終了するプロセスのプロセス識別子を指定する。
ExitCode : [int] 終了プロセスの終了コードを指定する。
%inst
指定 RD セッションホストサーバー上の指定プロセスを終了させる。

[戻り値]
関数が成功すると戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには GetLastError
を呼び出す。


%index
WTSUnRegisterSessionNotification
指定ウィンドウのセッション変更通知受信登録を解除する。(WTSUnRegisterSessionNotification)
%prm
hWnd
hWnd : [intptr] セッション通知の受信登録を解除するウィンドウのハンドル。
%inst
指定ウィンドウのセッション変更通知受信登録を解除する。(WTSUnRegisterSessionNotification)

[戻り値]
関数が成功すると戻り値は TRUE となる。そうでなければ FALSE となる。拡張エラー情報を取得するには GetLastError
を呼び出す。

[備考]
この関数は WTSRegisterSessionNotification の各呼び出しに対して 1 回呼ぶ必要がある。


%index
WTSUnRegisterSessionNotificationEx
指定ウィンドウのセッション変更通知受信登録を解除する。(WTSUnRegisterSessionNotificationEx)
%prm
hServer, hWnd
hServer : [intptr] WTSOpenServer または WTS_CURRENT_SERVER から返されたサーバーのハンドル。
hWnd : [intptr] セッション通知の受信登録を解除するウィンドウのハンドル。
%inst
指定ウィンドウのセッション変更通知受信登録を解除する。(WTSUnRegisterSessionNotificationEx)

[戻り値]
関数が成功すると戻り値は TRUE となる。そうでなければ FALSE となる。拡張エラー情報を取得するには GetLastError
を呼び出す。

[備考]
この関数は WTSRegisterSessionNotificationEx の各呼び出しに対して 1 回呼ぶ必要がある。


%index
WTSVirtualChannelClose
開かれている仮想チャネルハンドルを閉じる。
%prm
hChannelHandle
hChannelHandle : [intptr] WTSVirtualChannelOpen で開かれた仮想チャネルへのハンドル。
%inst
開かれている仮想チャネルハンドルを閉じる。

[戻り値]
関数が成功すると戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには GetLastError
を呼び出す。


%index
WTSVirtualChannelOpen
指定仮想チャネルのサーバー側ハンドルを開く。
%prm
hServer, SessionId, pVirtualName
hServer : [intptr] このパラメータは WTS_CURRENT_SERVER_HANDLE でなければならない。
SessionId : [int] リモートデスクトップサービスセッション識別子。現在のセッションを示すには WTS_CURRENT_SESSION を指定する。他ユーザのセッションで仮想チャネルを開くには Virtual Channel からの許可が必要である。
pVirtualName : [str] 仮想チャネル名を含む NULL 終端文字列へのポインタ。UNICODE 定義時も ANSI 文字列である。名前は終端 NULL を除き 1 ～ CHANNEL_NAME_LEN 文字。
%inst
指定仮想チャネルのサーバー側ハンドルを開く。

[戻り値]
関数が成功すると戻り値は指定仮想チャネルへのハンドルとなる。関数が失敗した場合、戻り値は NULL となる。拡張エラー情報を取得するには
GetLastError を呼び出す。

[備考]
ハンドル使用後は WTSVirtualChannelClose で解放する。非同期 I/O 用の仮想チャネルファイルハンドル取得例は
WTSVirtualChannelQuery を参照。同じ仮想チャネルを複数回開こうとすると 10
秒の遅延と既存チャネルの破壊を招くことがある。


%index
WTSVirtualChannelOpenEx
WTSVirtualChannelOpen と同様の方法で仮想チャネルを作成する。
%prm
SessionId, pVirtualName, flags
SessionId : [int] リモートデスクトップサービスセッション識別子。現在のセッションを示すには WTS_CURRENT_SESSION を指定する。他ユーザのセッションで仮想チャネルを開くには Virtual Channels 権限が必要である。
pVirtualName : [str] SVC の場合は仮想チャネル名を含む NULL 終端文字列 (終端 NULL を除き CHANNEL_NAME_LEN 文字以内)。DVC の場合はリスナーのエンドポイント名 (MAX_PATH 文字以内)。
flags : [int] SVC として開くには 0 を指定する。DVC として開くには WTS_CHANNEL_OPTION_DYNAMIC を指定する。DVC の場合、転送データの優先度を WTS_CHANNEL_OPTION_DYNAMIC_PRI_XXX と組み合わせて指定できる。
%inst
WTSVirtualChannelOpen と同様の方法で仮想チャネルを作成する。

[戻り値]
エラー時は NULL を返し GetLastError が設定される。


%index
WTSVirtualChannelPurgeInput
指定仮想チャネルでクライアントからサーバーへ送信されたキューイング済み入力データを全て削除する。
%prm
hChannelHandle
hChannelHandle : [intptr] WTSVirtualChannelOpen で開かれた仮想チャネルへのハンドル。
%inst
指定仮想チャネルでクライアントからサーバーへ送信されたキューイング済み入力データを全て削除する。

[戻り値]
関数が成功すると戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには GetLastError
を呼び出す。


%index
WTSVirtualChannelPurgeOutput
指定仮想チャネルでサーバーからクライアントへ送信されたキューイング済み出力データを全て削除する。
%prm
hChannelHandle
hChannelHandle : [intptr] WTSVirtualChannelOpen で開かれた仮想チャネルへのハンドル。
%inst
指定仮想チャネルでサーバーからクライアントへ送信されたキューイング済み出力データを全て削除する。

[戻り値]
関数が成功すると戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには GetLastError
を呼び出す。


%index
WTSVirtualChannelQuery
指定仮想チャネルに関する情報を返す。
%prm
hChannelHandle, param1, ppBuffer, pBytesReturned
hChannelHandle : [intptr] WTSVirtualChannelOpen で開かれた仮想チャネルへのハンドル。
param1 : [int] 
ppBuffer : [var] 要求された情報を受け取るバッファへのポインタ。
pBytesReturned : [var] ppBuffer に返されたバイト数を受け取る変数へのポインタ。
%inst
指定仮想チャネルに関する情報を返す。

[戻り値]
関数が成功すると戻り値は 0 以外となる。ppBuffer に返された値で WTSFreeMemory
を呼んで一時メモリを解放する。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには GetLastError
を呼び出す。

[備考]
非同期 I/O に使える仮想チャネルファイルハンドルを取得する方法例: まず WTSVirtualChannelOpen
で仮想チャネルを開き、WTSVirtualChannelQuery に WTSVirtualFileHandle
を指定して呼ぶとファイルハンドルが返る。これを使って重複読み書きができる。WTSVirtualChannelQuery が確保したメモリは
WTSFreeMemory で解放し、仮想チャネルは WTSVirtualChannelClose
で閉じる。取得したファイルハンドルは明示的に閉じるべきではない (WTSVirtualChannelClose
が閉じるため)。このドキュメントは省略されている。


%index
WTSVirtualChannelRead
仮想チャネルのサーバー側からデータを読み取る。
%prm
hChannelHandle, TimeOut, Buffer, BufferSize, pBytesRead
hChannelHandle : [intptr] WTSVirtualChannelOpen で開かれた仮想チャネルへのハンドル。
TimeOut : [int] タイムアウト (ミリ秒)。0 なら読み取りデータがなければ直ちに戻る。INFINITE なら読み取りデータができるまで無期限に待つ。
Buffer : [str] 仮想チャネルのサーバー側から読み取ったデータチャンクを受け取るバッファへのポインタ。サーバーが 1 回の呼び出しで受け取れる最大量は CHANNEL_CHUNK_LENGTH バイトである。クライアントがより大きなブロックを書き込んだ場合、複数回の読み取りが必要となる。CHANNEL_OPTION_SHOW_PROTOCOL 指定時やダイナミック仮想チャネルの場合、各チャンク先頭に CHANNEL_PDU_HEADER 構造体が置かれる。
BufferSize : [int] Buffer のサイズ (バイト単位)。CHANNEL_PDU_HEADER が先行する場合は CHANNEL_PDU_LENGTH 以上、そうでなければ CHANNEL_CHUNK_LENGTH 以上にする。
pBytesRead : [var] 読み取ったバイト数を受け取る変数へのポインタ。
%inst
仮想チャネルのサーバー側からデータを読み取る。

[戻り値]
関数が成功すると戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには GetLastError
を呼び出す。

[備考]
注: WTSVirtualChannelRead はスレッドセーフではない。複数スレッドから仮想チャネルにアクセスする場合や非同期 I/O
を行う場合は、WTSVirtualChannelQuery と WTSVirtualFileHandle を使う。


%index
WTSVirtualChannelWrite
仮想チャネルのサーバー側にデータを書き込む。
%prm
hChannelHandle, Buffer, Length, pBytesWritten
hChannelHandle : [intptr] WTSVirtualChannelOpen で開かれた仮想チャネルへのハンドル。
Buffer : [str] 仮想チャネルに書き込むデータを含むバッファへのポインタ。
Length : [int] 書き込むデータのサイズ (バイト単位)。
pBytesWritten : [var] 書き込まれたバイト数を受け取る変数へのポインタ。
%inst
仮想チャネルのサーバー側にデータを書き込む。

[戻り値]
関数が成功すると戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには GetLastError
を呼び出す。

[備考]
注: WTSVirtualChannelWrite はスレッドセーフではない。複数スレッドから仮想チャネルにアクセスする場合や非同期
I/O を行う場合は、WTSVirtualChannelQuery と WTSVirtualFileHandle を使う。


%index
WTSWaitSystemEvent
リモートデスクトップサービスイベントを呼び出し元に戻る前に待機する。
%prm
hServer, EventMask, pEventFlags
hServer : [intptr] RD セッションホストサーバーへのハンドル。WTSOpenServer で開いたハンドル、または WTS_CURRENT_SERVER_HANDLE を指定する。
EventMask : [int] 待つイベント集合を指定するビットマスク。このマスクには保留中のものをフラッシュするための WTS_EVENT_FLUSH を指定できる。
pEventFlags : [var] 発生したイベントのビットマスクを受け取る変数へのポインタ。WTS_EVENT_FLUSH で待機が終了した場合は WTS_EVENT_NONE となり得る。
%inst
リモートデスクトップサービスイベントを呼び出し元に戻る前に待機する。

[戻り値]
関数が成功すると戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには GetLastError
を呼び出す。

