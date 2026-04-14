; ============================================================
;   netapi32.dll ヘルプ (CsWin32 / win32metadata から自動抽出)
;   docs_ja.json に日本語訳があればそちらを使用、無ければ英語原文。
;   翻訳を追加するときは docs_ja.json を編集して再生成。
; ============================================================

%index
NetApiBufferFree
NetApiBufferAllocate が確保したメモリを解放する。他のネットワーク管理関数が情報返却に内部的に使用したメモリの解放にも使用する。
%group
Win32 netapi32
%prm
Buffer
Buffer : [intptr] 別のネットワーク管理関数が返したバッファ、または NetApiBufferAllocate で確保したメモリへのポインタ。
%inst
NetApiBufferAllocate
が確保したメモリを解放する。他のネットワーク管理関数が情報返却に内部的に使用したメモリの解放にも使用する。

[戻り値]
成功時は NERR_Success、失敗時はシステムエラーコードを返す。エラーコード一覧は System Error Codes を参照。

[備考]
ネットワーク管理関数が使用したメモリの解放に使用する。主に 2 つのケースで使用される:
（以下省略）


%index
NetShareEnum
サーバー上の各共有リソースに関する情報を取得する。
%group
Win32 netapi32
%prm
servername, level, bufptr, prefmaxlen, entriesread, totalentries, resume_handle
servername : [wstr] 実行対象のリモートサーバーの DNS または NetBIOS 名を指定する文字列へのポインタ。NULL ならローカルコンピュータが使用される。
level : [int] 
bufptr : [var] データを受け取るバッファへのポインタ。形式は level に依存する。
prefmaxlen : [int] 返却データの推奨最大サイズ(バイト単位)。MAX_PREFERRED_LENGTH を指定するとデータ全体を格納するメモリが確保される。他の値を指定するとバッファサイズ不足時 ERROR_MORE_DATA となる。
entriesread : [var] 実際に列挙された要素数を受け取る値へのポインタ。
totalentries : [var] 列挙可能だった全エントリ数を受け取る値へのポインタ。ヒントとして扱うこと。
resume_handle : [var] 既存の共有検索を継続するための再開ハンドル。初回呼び出しでは 0 に、以降は変更せずに渡す。NULL の場合、再開ハンドルは保存されない。
%inst
サーバー上の各共有リソースに関する情報を取得する。

[戻り値]
成功時は NERR_Success、失敗時はシステムエラーコードを返す。

[備考]
本関数は SMB 共有にのみ適用される。DFS や WebDAV などの他の共有には WNet
関数を使用する。インタラクティブユーザーは特別なグループメンバーシップ不要。非インタラクティブユーザーの場合、レベル 2、502、503
では Administrator、Power User、Print Operator、Server Operator 権限が必要。レベル
0/1 では不要。Windows Server 2022: 非インタラクティブユーザーは Administrator、Access
Control Assistance Operators、または Server Operator 権限が必要。共有が DFS
ツリーのルートボリュームかを確認するには NetShareGetInfo をレベル 1005 で呼び出す。Active Directory
プログラミングでは ADSI メソッドでも同等機能を実現できる場合がある。


%index
NetShareGetInfo
サーバー上の特定の共有リソースに関する情報を取得する。
%group
Win32 netapi32
%prm
servername, netname, level, bufptr
servername : [wstr] 実行対象のリモートサーバーの DNS または NetBIOS 名を指定する文字列へのポインタ。NULL ならローカルコンピュータが使用される。
netname : [wstr] 情報を取得したい共有名を指定する文字列へのポインタ。
level : [int] 
bufptr : [var] データを受け取るバッファへのポインタ。形式は level に依存する。
%inst
サーバー上の特定の共有リソースに関する情報を取得する。

[戻り値]
成功時は NERR_Success、失敗時は以下のエラーコードのいずれかを返す。
（以下省略）

[備考]
SMB 共有にのみ適用される。非インタラクティブユーザーの権限要件は NetShareEnum と同様。level に 503
を指定する場合、shi503_servername で指定するリモートサーバーは事前に NetServerTransportAddEx
でトランスポートプロトコルにバインドされ、SVTI2_SCOPED_NAME フラグが設定されている必要がある。


%index
NetUserGetInfo
NetUserGetInfo 関数はサーバー上の特定のユーザーアカウントに関する情報を取得する。
%group
Win32 netapi32
%prm
servername, username, level, bufptr
servername : [wstr] 実行対象のリモートサーバーの DNS/NetBIOS 名を指定する定数文字列へのポインタ。NULL ならローカル。
username : [wstr] 情報を取得したいユーザーアカウント名を指定する定数文字列へのポインタ。
level : [int] 
bufptr : [var] データを受け取るバッファへのポインタ。形式は level に依存する。バッファはシステムが確保するため NetApiBufferFree で解放する必要がある。
%inst
NetUserGetInfo 関数はサーバー上の特定のユーザーアカウントに関する情報を取得する。

[戻り値]
成功時は NERR_Success、失敗時は以下のエラーコードのいずれかを返す。
（以下省略）

[備考]
Active Directory 上のドメインコントローラで呼び出した場合、ACL に基づきアクセス許可が判定される。既定 ACL
では全認証済みユーザーと "Pre-Windows 2000 compatible access"
グループメンバが情報を閲覧できる。メンバーサーバー/ワークステーションでは全認証済みユーザーが閲覧可能。ユーザーアカウント名は 20
文字まで、グループ名は 256 文字まで。ピリオド終端や特定の記号 (", /, \, [, ], :, |, <, >, +, =,
;, ?, *) は使用不可。level が 24 の場合、servername はローカルコンピュータに解決される必要がある。


%index
NetWkstaGetInfo
NetWkstaGetInfo 関数はワークステーションの構成情報を返す。
%group
Win32 netapi32
%prm
servername, level, bufptr
servername : [wstr] 実行対象のリモートサーバーの DNS/NetBIOS 名を指定する文字列へのポインタ。NULL ならローカル。
level : [int] 
bufptr : [var] データを受け取るバッファへのポインタ。形式は level に依存する。バッファはシステムが確保するため NetApiBufferFree で解放する必要がある。
%inst
NetWkstaGetInfo 関数はワークステーションの構成情報を返す。

[戻り値]
成功時は NERR_Success、失敗時は以下のエラーコードのいずれかを返す。
（以下省略）

[備考]
Windows Server 2003/Windows XP: Active Directory
上のドメインコントローラで呼び出した場合、ACL に基づきアクセスが判定される。匿名アクセスを可能にするには "Pre-Windows
2000 compatible access" グループに Anonymous が含まれている必要がある。level 100
は常に匿名アクセス可能。level 101 は認証済みユーザーが閲覧可能。level 102 および 502 は
Administrators、Server、System、Print Operator
ローカルグループメンバが閲覧可能。本関数を使うアプリケーションは _WIN32_WINNT を 0x0400
以上に定義してコンパイルすること。

