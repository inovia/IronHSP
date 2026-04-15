; ============================================================
;   netapi32.dll ヘルプ (CsWin32 / win32metadata から自動抽出)
;   docs_ja.json に日本語訳があればそちらを使用、無ければ英語原文。
;   翻訳を追加するときは docs_ja.json を編集して再生成。
; ============================================================

%type
拡張命令
%ver
1.0
%dll
netapi32.dll
%date
2026/04/16
%author
IronHSP / CsWin32 bridge
%url
https://github.com/inovia/IronHSP
%port
Win

%note
Win32 API の netapi32.dll 関数群。CsWin32 + win32metadata から自動生成。
hsp3net 専用 (intptr / NSTRUCT / wstr を使用)。

%group
Win32API

%index
NetAccessAdd
サポートされていない。(NetAccessAdd)
%prm
servername, level, buf, parm_err
servername : [wstr] 関数を実行するリモートサーバーの DNS または NetBIOS 名を指定する文字列へのポインタ。このパラメータが NULL の場合、ローカルコンピューターが使われる。
level : [int] データの情報レベルを指定する。このパラメータには次の値を指定できる。
buf : [var] アクセス情報構造体を格納したバッファへのポインタ。
parm_err : [var] pbBuffer パラメータが指すバッファのサイズ (バイト単位) を指定する。
%inst
サポートされていない。(NetAccessAdd)

[戻り値]
関数が成功した場合、戻り値は NERR_Success となる。失敗した場合、戻り値はシステムエラーコードとなる。エラーコードの一覧は
System Error Codes を参照。

[備考]
この関数は User レベルのセキュリティが有効になっている必要がある。


%index
NetAccessDel
サポートされていない。(NetAccessDel)
%prm
servername, resource
servername : [wstr] 関数を実行するリモートサーバーの DNS または NetBIOS 名を指定する文字列へのポインタ。このパラメータが NULL の場合、ローカルコンピューターが使われる。
resource : [wstr] アクセス制御リストを削除するネットワークリソースの名前を格納する文字列へのポインタ。
%inst
サポートされていない。(NetAccessDel)

[戻り値]
関数が成功した場合、戻り値は NERR_Success となる。失敗した場合、戻り値はシステムエラーコードとなる。エラーコードの一覧は
System Error Codes を参照。

[備考]
この関数をローカルセキュリティが有効なコンピューターで正常に実行するには Admin 権限が必要である。


%index
NetAccessEnum
サポートされていない。(NetAccessEnum)
%prm
servername, BasePath, Recursive, level, bufptr, prefmaxlen, entriesread, totalentries, resume_handle
servername : [wstr] 関数を実行するリモートサーバーの DNS または NetBIOS 名を指定する文字列へのポインタ。このパラメータが NULL の場合、ローカルコンピューターが使われる。
BasePath : [wstr] リソースのベースパス名を格納する文字列へのポインタ。NULL ポインタまたは NULL 文字列はベースパスを使用しないことを意味する。パスは UNC (universal naming convention) パス名として指定できる。
Recursive : [int] 再帰的検索の有効/無効を指定するフラグ。このパラメータが 0 の場合、NetAccessEnum 関数は pszBasePath パラメータで指定したリソースと、そのベースパスの直下のリソースのエントリを返す。0 以外の場合、関数はリソース名の先頭に pszBasePath を持つすべてのアクセス制御リスト (ACL) のエントリを返す。
level : [int] 
bufptr : [var] アクセス情報構造体を受け取るバッファへのポインタ。このデータの形式は sLevel パラメータの値に依存する。
prefmaxlen : [int] pbBuffer パラメータが指すバッファのサイズ (バイト単位) を指定する。
entriesread : [var] 実際に列挙された要素数を受け取る unsigned short 整数へのポインタ。このカウントは NetAccessEnum 関数が NERR_Success または ERROR_MORE_DATA を返した場合にのみ有効である。
totalentries : [var] 列挙可能だったエントリの総数を受け取る unsigned short 整数へのポインタ。このカウントは NetAccessEnum 関数が NERR_Success または ERROR_MORE_DATA を返した場合にのみ有効である。
resume_handle : [var] 未定。
%inst
サポートされていない。(NetAccessEnum)

[戻り値]
関数が成功した場合、戻り値は NERR_Success となる。失敗した場合、戻り値はシステムエラーコードとなる。エラーコードの一覧は
System Error Codes を参照。

[備考]
この関数をローカルセキュリティが有効なコンピューターで正常に実行するには Admin 権限が必要である。


%index
NetAccessGetInfo
サポートされていない。(NetAccessGetInfo)
%prm
servername, resource, level, bufptr
servername : [wstr] 関数を実行するリモートサーバーの DNS または NetBIOS 名を指定する文字列へのポインタ。このパラメータが NULL の場合、ローカルコンピューターが使われる。
resource : [wstr] 
level : [int] アクセス情報構造体を受け取るバッファへのポインタ。このデータの形式は sLevel パラメータの値に依存する。
bufptr : [var] pbBuffer パラメータが指すバッファのサイズ (バイト単位) を指定する。
%inst
サポートされていない。(NetAccessGetInfo)

[戻り値]
関数が成功した場合、戻り値は NERR_Success となる。失敗した場合、戻り値はシステムエラーコードとなる。エラーコードの一覧は
System Error Codes を参照。

[備考]
この関数をローカルセキュリティが有効なコンピューターで正常に実行するには Admin 権限が必要である。


%index
NetAccessGetUserPerms
サポートされていない。(NetAccessGetUserPerms)
%prm
servername, UGname, resource, Perms
servername : [wstr] 関数を実行するリモートサーバーの DNS または NetBIOS 名を指定する文字列へのポインタ。このパラメータが NULL の場合、ローカルコンピューターが使われる。
UGname : [wstr] 問い合わせるユーザーまたはグループの名前を指定する文字列へのポインタ。
resource : [wstr] 問い合わせるネットワークリソースの名前を格納する文字列へのポインタ。
Perms : [var] 指定したリソースに対するユーザーのアクセス許可を受け取る unsigned short 整数へのポインタ。
%inst
サポートされていない。(NetAccessGetUserPerms)

[戻り値]
関数が成功した場合、戻り値は NERR_Success となる。失敗した場合、戻り値はシステムエラーコードとなる。エラーコードの一覧は
System Error Codes を参照。

[備考]
この関数をローカルセキュリティが有効なコンピューターで正常に実行するには Admin
権限が必要である。ユーザー自身のアクセス許可を要求する場合は特別な権限は必要ない。


%index
NetAccessSetInfo
サポートされていない。(NetAccessSetInfo)
%prm
servername, resource, level, buf, parm_err
servername : [wstr] 関数を実行するリモートサーバーの DNS または NetBIOS 名を指定する文字列へのポインタ。このパラメータが NULL の場合、ローカルコンピューターが使われる。
resource : [wstr] 変更するネットワークリソースの名前を格納する文字列へのポインタ。
level : [int] データの情報レベルを指定する。このパラメータには次の値を指定できる。
buf : [var] アクセス情報構造体を格納したバッファへのポインタ。このデータの形式は sLevel パラメータの値に依存する。
parm_err : [var] 未定。
%inst
サポートされていない。(NetAccessSetInfo)

[戻り値]
関数が成功した場合、戻り値は NERR_Success となる。失敗した場合、戻り値はシステムエラーコードとなる。エラーコードの一覧は
System Error Codes を参照。

[備考]
この関数をローカルセキュリティが有効なコンピューターで正常に実行するには Admin 権限が必要である。


%index
NetAlertRaise
NetAlertRaise 関数は、特定のイベントが発生した際に登録済みのすべてのクライアントに通知する。
%prm
AlertType, Buffer, BufferSize
AlertType : [wstr] 発生させるアラートクラス (アラートの種類) を指定する定数文字列へのポインタ。このパラメータには、次の定義済みの値のいずれか、またはネットワークアプリケーション用にユーザー定義したアラートクラスを指定できる。アラートのイベント名には任意のテキスト文字列を指定できる。
Buffer : [intptr] 中断メッセージをリッスンしているクライアントに送信するデータへのポインタ。データは固定長の STD_ALERT 構造体で始まり、その後に ADMIN_OTHER_INFO、ERRLOG_OTHER_INFO、PRINT_OTHER_INFO、USER_OTHER_INFO のいずれか 1 つの構造体で追加のメッセージデータが続く。最後に、必要な可変長情報を含める。詳細は後述の解説セクションのコード例を参照。
BufferSize : [int] メッセージバッファのサイズ (バイト単位)。
%inst
NetAlertRaise 関数は、特定のイベントが発生した際に登録済みのすべてのクライアントに通知する。

[戻り値]
関数が成功した場合、戻り値は NERR_Success
となる。失敗した場合、戻り値はシステムエラーコードで、次のいずれかのエラーコードになる可能性がある。すべてのエラーコードの一覧は
System Error Codes を参照。
（以下省略）

[備考]
NetAlertRaise 関数を正常に実行するために特別なグループメンバーシップは必要ない。NetAlertRaise
関数を呼び出すときは、クライアントコンピューターで alerter サービスが実行されている必要があり、そうでない場合は関数は
ERROR_FILE_NOT_FOUND で失敗する。


%index
NetAlertRaiseEx
NetAlertRaiseEx 関数は、特定のイベントが発生した際に登録済みのすべてのクライアントに通知する。この拡張関数は STD_ALERT 構造体の指定を必要としないため、アラートメッセージの送信を簡単にできる。
%prm
AlertType, VariableInfo, VariableInfoSize, ServiceName
AlertType : [wstr] 発生させるアラートクラス (アラートの種類) を指定する定数文字列へのポインタ。このパラメータには、次の定義済みの値のいずれか、またはネットワークアプリケーション用にユーザー定義したアラートクラスを指定できる。(アラートのイベント名には任意のテキスト文字列を指定できる。)
VariableInfo : [intptr] 中断メッセージをリッスンしているクライアントに送信するデータへのポインタ。データは ADMIN_OTHER_INFO、ERRLOG_OTHER_INFO、PRINT_OTHER_INFO、USER_OTHER_INFO のいずれか 1 つの構造体で構成し、その後に必要な可変長情報が続く。詳細は後述の解説セクションのコード例を参照。
VariableInfoSize : [int] VariableInfo パラメータが指すバッファ内の可変情報のバイト数。
ServiceName : [wstr] 中断メッセージを発生させるサービスの名前を指定する定数文字列へのポインタ。
%inst
NetAlertRaiseEx 関数は、特定のイベントが発生した際に登録済みのすべてのクライアントに通知する。この拡張関数は
STD_ALERT 構造体の指定を必要としないため、アラートメッセージの送信を簡単にできる。

[戻り値]
関数が成功した場合、戻り値は NERR_Success
となる。失敗した場合、戻り値はシステムエラーコードで、次のいずれかのエラーコードになる可能性がある。すべてのエラーコードの一覧は
System Error Codes を参照。
（以下省略）

[備考]
NetAlertRaiseEx 関数を正常に実行するために特別なグループメンバーシップは必要ない。NetAlertRaiseEx
関数を呼び出すときは、クライアントコンピューターで alerter サービスが実行されている必要があり、そうでない場合は関数は
ERROR_FILE_NOT_FOUND で失敗する。


%index
NetAuditClear
NetAuditClear 関数は廃止されている。16 ビット版 Windows との互換性のために含まれている。他のアプリケーションはイベントログを使用するべきである。
%prm
server, backupfile, service
server : [wstr] 
backupfile : [wstr] 
service : [wstr] 
%inst
NetAuditClear 関数は廃止されている。16 ビット版 Windows
との互換性のために含まれている。他のアプリケーションはイベントログを使用するべきである。


%index
NetAuditRead
NetAuditRead 関数は廃止されている。16 ビット版 Windows との互換性のために含まれている。他のアプリケーションはイベントログを使用するべきである。
%prm
server, service, auditloghandle, offset, reserved1, reserved2, offsetflag, bufptr, prefmaxlen, bytesread, totalavailable
server : [wstr] 
service : [wstr] 
auditloghandle : [var] 
offset : [int] 
reserved1 : [var] 
reserved2 : [int] 
offsetflag : [int] 
bufptr : [var] 
prefmaxlen : [int] 
bytesread : [var] 
totalavailable : [var] 
%inst
NetAuditRead 関数は廃止されている。16 ビット版 Windows
との互換性のために含まれている。他のアプリケーションはイベントログを使用するべきである。


%index
NetAuditWrite
NetAuditWrite 関数は廃止されている。16 ビット版 Windows との互換性のために含まれている。他のアプリケーションはイベントログを使用するべきである。
%prm
type, buf, numbytes, service, reserved
type : [int] 
buf : [var] 
numbytes : [int] 
service : [wstr] 
reserved : [var] 
%inst
NetAuditWrite 関数は廃止されている。16 ビット版 Windows
との互換性のために含まれている。他のアプリケーションはイベントログを使用するべきである。


%index
NetConfigGet
NetConfigGet 関数は廃止されている。16 ビット版 Windows との互換性のために含まれている。他のアプリケーションはレジストリを使用するべきである。
%prm
server, component, parameter, bufptr
server : [wstr] 未定。
component : [wstr] 未定。
parameter : [wstr] 未定。
bufptr : [var] 未定。
%inst
NetConfigGet 関数は廃止されている。16 ビット版 Windows
との互換性のために含まれている。他のアプリケーションはレジストリを使用するべきである。


%index
NetConfigGetAll
NetConfigGetAll 関数は廃止されている。16 ビット版 Windows との互換性のために含まれている。他のアプリケーションはレジストリを使用するべきである。
%prm
server, component, bufptr
server : [wstr] 未定。
component : [wstr] 未定。
bufptr : [var] 未定。
%inst
NetConfigGetAll 関数は廃止されている。16 ビット版 Windows
との互換性のために含まれている。他のアプリケーションはレジストリを使用するべきである。


%index
NetConfigSet
NetConfigSet 関数は廃止されている。16 ビット版 Windows との互換性のために含まれている。他のアプリケーションはレジストリを使用するべきである。
%prm
server, reserved1, component, level, reserved2, buf, reserved3
server : [wstr] 未定。
reserved1 : [wstr] 未定。
component : [wstr] 未定。
level : [int] 未定。
reserved2 : [int] 未定。
buf : [var] 未定。
reserved3 : [int] 未定。
%inst
NetConfigSet 関数は廃止されている。16 ビット版 Windows
との互換性のために含まれている。他のアプリケーションはレジストリを使用するべきである。


%index
NetErrorLogClear
NetErrorLogClear 関数は廃止されている。16 ビット版 Windows との互換性のために含まれている。他のアプリケーションはイベントログを使用するべきである。
%prm
UncServerName, BackupFile, Reserved
UncServerName : [wstr] 未定。
BackupFile : [wstr] 未定。
Reserved : [var] 未定。
%inst
NetErrorLogClear 関数は廃止されている。16 ビット版 Windows
との互換性のために含まれている。他のアプリケーションはイベントログを使用するべきである。


%index
NetErrorLogRead
NetErrorLogRead 関数は廃止されている。16 ビット版 Windows との互換性のために含まれている。他のアプリケーションはイベントログを使用するべきである。
%prm
UncServerName, Reserved1, ErrorLogHandle, Offset, Reserved2, Reserved3, OffsetFlag, BufPtr, PrefMaxSize, BytesRead, TotalAvailable
UncServerName : [wstr] 未定。
Reserved1 : [wstr] 未定。
ErrorLogHandle : [var] 未定。
Offset : [int] 未定。
Reserved2 : [var] 未定。
Reserved3 : [int] 未定。
OffsetFlag : [int] 未定。
BufPtr : [var] 未定。
PrefMaxSize : [int] 未定。
BytesRead : [var] 未定。
TotalAvailable : [var] 未定。
%inst
NetErrorLogRead 関数は廃止されている。16 ビット版 Windows
との互換性のために含まれている。他のアプリケーションはイベントログを使用するべきである。


%index
NetErrorLogWrite
NetErrorLogWrite 関数は廃止されている。16 ビット版 Windows との互換性のために含まれている。他のアプリケーションはイベントログを使用するべきである。
%prm
Reserved1, Code, Component, Buffer, NumBytes, MsgBuf, StrCount, Reserved2
Reserved1 : [var] 未定。
Code : [int] 未定。
Component : [wstr] 未定。
Buffer : [var] 未定。
NumBytes : [int] 未定。
MsgBuf : [var] 未定。
StrCount : [int] 未定。
Reserved2 : [var] 未定。
%inst
NetErrorLogWrite 関数は廃止されている。16 ビット版 Windows
との互換性のために含まれている。他のアプリケーションはイベントログを使用するべきである。


%index
NetMessageBufferSend
NetMessageBufferSend 関数は、情報のバッファを登録済みのメッセージエイリアスに送信する。
%prm
servername, msgname, fromname, buf, buflen
servername : [wstr] 関数を実行するリモートサーバーの DNS または NetBIOS 名を指定する定数文字列へのポインタ。このパラメータが NULL の場合、ローカルコンピューターが使われる。
msgname : [wstr] メッセージバッファの送信先となるメッセージエイリアスを指定する定数文字列へのポインタ。
fromname : [wstr] メッセージの送信元を指定する定数文字列へのポインタ。このパラメータが NULL の場合、メッセージはローカルコンピューター名から送信される。
buf : [var] メッセージテキストを格納するバッファへのポインタ。詳細は Network Management Function Buffers を参照。
buflen : [int] buf パラメータが指すメッセージテキストの長さ (バイト単位) を格納する値を指定する。
%inst
NetMessageBufferSend 関数は、情報のバッファを登録済みのメッセージエイリアスに送信する。

[戻り値]
関数が成功した場合、戻り値は NERR_Success となる。失敗した場合、戻り値は次のいずれかのエラーコードになる可能性がある。
（以下省略）

[備考]
Active Directory
が動作しているドメインコントローラーでこの関数を呼び出す場合、アクセスはセキュリティ保護可能オブジェクトのアクセス制御リスト (ACL)
に基づいて許可または拒否される。既定の ACL では Domain Admins と Account Operators
のみがこの関数を呼び出せる。メンバーサーバーまたはワークステーションでは、Administrators と Server
Operators のみがこの関数を呼び出せる。詳細は Security Requirements for the Network
Management Functions を参照。ACL と ACE の詳細については Access Control Model を参照。


%index
NetMessageNameAdd
NetMessageNameAdd 関数は、メッセージ名テーブルにメッセージエイリアスを登録する。この関数は messenger サービスが開始されている必要がある。
%prm
servername, msgname
servername : [wstr] 関数を実行するリモートサーバーの DNS または NetBIOS 名を指定する定数文字列へのポインタ。このパラメータが NULL の場合、ローカルコンピューターが使われる。
msgname : [wstr] 追加するメッセージエイリアスを指定する定数文字列へのポインタ。文字列は 15 文字を超えることはできない。
%inst
NetMessageNameAdd 関数は、メッセージ名テーブルにメッセージエイリアスを登録する。この関数は messenger
サービスが開始されている必要がある。

[戻り値]
関数が成功した場合、戻り値は NERR_Success となる。失敗した場合、戻り値は次のいずれかのエラーコードになる可能性がある。
（以下省略）

[備考]
リモートサーバー上で NetMessageNameAdd 関数を正常に実行できるのは、Administrators
ローカルグループのメンバーだけである。メッセージ転送はもはやサポートされていないため、LAN Manager 2.x の
NetMessageNameAdd 関数にあった forward action
フラグは、もはやパラメータではない。NetMessageNameAdd 関数が、ネットワーク上に msgname
の転送バージョンが存在することを検出した場合、関数は NERR_Already_Exists エラーで失敗する。


%index
NetMessageNameDel
NetMessageNameDel 関数は、メッセージ名テーブルからメッセージエイリアスを削除する。この関数は messenger サービスが開始されている必要がある。
%prm
servername, msgname
servername : [wstr] 関数を実行するリモートサーバーの DNS または NetBIOS 名を指定する定数文字列へのポインタ。このパラメータが NULL の場合、ローカルコンピューターが使われる。
msgname : [wstr] 削除するメッセージエイリアスを指定する定数文字列へのポインタ。文字列は 15 文字を超えることはできない。
%inst
NetMessageNameDel 関数は、メッセージ名テーブルからメッセージエイリアスを削除する。この関数は messenger
サービスが開始されている必要がある。

[戻り値]
関数が成功した場合、戻り値は NERR_Success となる。失敗した場合、戻り値は次のいずれかのエラーコードになる可能性がある。
（以下省略）

[備考]
リモートサーバー上で NetMessageNameDel 関数を正常に実行できるのは、Administrators
ローカルグループのメンバーだけである。


%index
NetMessageNameEnum
NetMessageNameEnum 関数は、指定したコンピューターでメッセージを受信するメッセージエイリアスの一覧を取得する。この関数は messenger サービスが開始されている必要がある。
%prm
servername, level, bufptr, prefmaxlen, entriesread, totalentries, resume_handle
servername : [wstr] 関数を実行するリモートサーバーの DNS または NetBIOS 名を指定する定数文字列へのポインタ。このパラメータが NULL の場合、ローカルコンピューターが使われる。
level : [int] 
bufptr : [var] データを受け取るバッファへのポインタ。このデータの形式は level パラメータの値に依存する。このバッファはシステムによって割り当てられ、NetApiBufferFree 関数で解放しなければならない。関数が ERROR_MORE_DATA で失敗した場合でもバッファを解放する必要がある点に注意。
prefmaxlen : [int] 返されるデータの望ましい最大長をバイト単位で指定する。MAX_PREFERRED_LENGTH を指定すると、関数は必要な量のメモリを割り当てる。別の値を指定すると、関数が返すバイト数を制限できる。バッファサイズがすべてのエントリを保持するのに不十分な場合、関数は ERROR_MORE_DATA を返す。詳細は Network Management Function Buffers および Network Management Function Buffer Lengths を参照。
entriesread : [var] 実際に列挙された要素数を受け取る値へのポインタ。
totalentries : [var] 現在の再開位置から列挙可能だったエントリの総数を受け取る値へのポインタ。アプリケーションはこの値を目安としてのみ扱うべきである点に注意。
resume_handle : [var] 既存のメッセージエイリアス検索を継続するために使われる再開ハンドルを格納する値へのポインタ。最初の呼び出しではハンドルを 0 にし、以降の呼び出しでは変更せずに渡す。resume_handle が NULL の場合、再開ハンドルは格納されない。
%inst
NetMessageNameEnum 関数は、指定したコンピューターでメッセージを受信するメッセージエイリアスの一覧を取得する。この関数は
messenger サービスが開始されている必要がある。

[戻り値]
関数が成功した場合、戻り値は NERR_Success となる。失敗した場合、戻り値は次のいずれかのエラーコードになる可能性がある。
（以下省略）

[備考]
リモートサーバー上で NetMessageNameEnum 関数を正常に実行できるのは、Administrators
ローカルグループのメンバーだけである。メッセージ名テーブル内の特定のメッセージエイリアスの情報を取得するには、NetMessageNameGetInfo
関数を呼び出せる。


%index
NetMessageNameGetInfo
NetMessageNameGetInfo 関数は、メッセージ名テーブル内の特定のメッセージエイリアスに関する情報を取得する。この関数は messenger サービスが開始されている必要がある。
%prm
servername, msgname, level, bufptr
servername : [wstr] 関数を実行するリモートサーバーの DNS または NetBIOS 名を指定する定数文字列へのポインタ。このパラメータが NULL の場合、ローカルコンピューターが使われる。
msgname : [wstr] 情報を返すメッセージエイリアスを指定する定数文字列へのポインタ。
level : [int] 
bufptr : [var] データを受け取るバッファへのポインタ。このデータの形式は level パラメータの値に依存する。このバッファはシステムによって割り当てられ、NetApiBufferFree 関数で解放しなければならない。詳細は Network Management Function Buffers および Network Management Function Buffer Lengths を参照。
%inst
NetMessageNameGetInfo 関数は、メッセージ名テーブル内の特定のメッセージエイリアスに関する情報を取得する。この関数は
messenger サービスが開始されている必要がある。

[戻り値]
関数が成功した場合、戻り値は NERR_Success となる。失敗した場合、戻り値は次のいずれかのエラーコードになる可能性がある。
（以下省略）

[備考]
リモートサーバー上で NetMessageNameGetInfo 関数を正常に実行できるのは、Administrators
ローカルグループのメンバーだけである。メッセージ名テーブル内のすべてのメッセージエイリアスを一覧表示するには、NetMessageNameEnum
関数を呼び出せる。


%index
NetReplExportDirAdd
(no summary)
%prm
servername, level, buf, parm_err
servername : [wstr] 
level : [int] 
buf : [var] 
parm_err : [var] 
%inst



%index
NetReplExportDirDel
(no summary)
%prm
servername, dirname
servername : [wstr] 
dirname : [wstr] 
%inst



%index
NetReplExportDirEnum
(no summary)
%prm
servername, level, bufptr, prefmaxlen, entriesread, totalentries, resumehandle
servername : [wstr] 
level : [int] 
bufptr : [var] 
prefmaxlen : [int] 
entriesread : [var] 
totalentries : [var] 
resumehandle : [var] 
%inst



%index
NetReplExportDirGetInfo
(no summary)
%prm
servername, dirname, level, bufptr
servername : [wstr] 
dirname : [wstr] 
level : [int] 
bufptr : [var] 
%inst



%index
NetReplExportDirLock
(no summary)
%prm
servername, dirname
servername : [wstr] 
dirname : [wstr] 
%inst



%index
NetReplExportDirSetInfo
(no summary)
%prm
servername, dirname, level, buf, parm_err
servername : [wstr] 
dirname : [wstr] 
level : [int] 
buf : [var] 
parm_err : [var] 
%inst



%index
NetReplExportDirUnlock
(no summary)
%prm
servername, dirname, unlockforce
servername : [wstr] 
dirname : [wstr] 
unlockforce : [int] 
%inst



%index
NetReplGetInfo
(no summary)
%prm
servername, level, bufptr
servername : [wstr] 
level : [int] 
bufptr : [var] 
%inst



%index
NetReplImportDirAdd
(no summary)
%prm
servername, level, buf, parm_err
servername : [wstr] 
level : [int] 
buf : [var] 
parm_err : [var] 
%inst



%index
NetReplImportDirDel
(no summary)
%prm
servername, dirname
servername : [wstr] 
dirname : [wstr] 
%inst



%index
NetReplImportDirEnum
(no summary)
%prm
servername, level, bufptr, prefmaxlen, entriesread, totalentries, resumehandle
servername : [wstr] 
level : [int] 
bufptr : [var] 
prefmaxlen : [int] 
entriesread : [var] 
totalentries : [var] 
resumehandle : [var] 
%inst



%index
NetReplImportDirGetInfo
(no summary)
%prm
servername, dirname, level, bufptr
servername : [wstr] 
dirname : [wstr] 
level : [int] 
bufptr : [var] 
%inst



%index
NetReplImportDirLock
(no summary)
%prm
servername, dirname
servername : [wstr] 
dirname : [wstr] 
%inst



%index
NetReplImportDirUnlock
(no summary)
%prm
servername, dirname, unlockforce
servername : [wstr] 
dirname : [wstr] 
unlockforce : [int] 
%inst



%index
NetReplSetInfo
(no summary)
%prm
servername, level, buf, parm_err
servername : [wstr] 
level : [int] 
buf : [var] 
parm_err : [var] 
%inst



%index
NetServerEnum
NetServerEnum 関数は、ドメイン内で可視の指定した種類のすべてのサーバーを一覧表示する。
%prm
servername, level, bufptr, prefmaxlen, entriesread, totalentries, servertype, domain, resume_handle
servername : [wstr] 予約済み。NULL でなければならない。
level : [int] 
bufptr : [var] データを受け取るバッファへのポインタ。このデータの形式は level パラメータの値に依存する。このバッファはシステムによって割り当てられ、NetApiBufferFree 関数で解放しなければならない。関数が ERROR_MORE_DATA で失敗した場合でもバッファを解放する必要がある点に注意。
prefmaxlen : [int] 返されるデータの望ましい最大長 (バイト単位)。MAX_PREFERRED_LENGTH を指定すると、関数は必要な量のメモリを割り当てる。別の値を指定すると、関数が返すバイト数を制限できる。バッファサイズがすべてのエントリを保持するのに不十分な場合、関数は ERROR_MORE_DATA を返す。詳細は Network Management Function Buffers および Network Management Function Buffer Lengths を参照。
entriesread : [var] 実際に列挙された要素数を受け取る値へのポインタ。
totalentries : [var] ネットワーク上で可視のサーバーおよびワークステーションの総数を受け取る値へのポインタ。アプリケーションはこの値を目安としてのみ扱うべきである点に注意。
servertype : [int] 
domain : [wstr] サーバー一覧を返すドメインの名前を指定する定数文字列へのポインタ。ドメイン名は NetBIOS ドメイン名 (例: microsoft) でなければならない。NetServerEnum 関数は DNS 形式の名前 (例: microsoft.com) をサポートしない。このパラメータが NULL の場合、プライマリドメインが暗黙的に使われる。
resume_handle : [var] 予約済み。0 に設定する必要がある。
%inst
NetServerEnum 関数は、ドメイン内で可視の指定した種類のすべてのサーバーを一覧表示する。

[戻り値]
関数が成功した場合、戻り値は NERR_Success となる。失敗した場合、戻り値は次のいずれかのエラーコードになる可能性がある。
（以下省略）

[備考]
NetServerEnum
関数は、ドメイン内で可視の指定した種類のすべてのサーバーを列挙するために使う。たとえばアプリケーションは、NetServerEnum
を呼び出してドメインコントローラーのみ、あるいは SQL Server
のインスタンスを実行するサーバーのみを一覧表示できる。アプリケーションは servertype
パラメータでさまざまなサーバー種別のビットマスクを組み合わせて複数の種類を列挙できる。たとえば SV_TYPE_WORKSTATION |
SVTYPE_SERVER (0x00000003) は SV_TYPE_WORKSTATION (0x00000001) と
SV_TYPE_SERVER (0x00000002)
のビットマスクを組み合わせる。特定のサーバーの詳細情報が必要な場合は、WNetEnumResource
関数を呼び出す。NetServerEnum
関数を正常に実行するために特別なグループメンバーシップは必要ない。SV_TYPE_LOCAL_LIST_ONLY
を指定した場合、NetServerEnum 関数はブラウザが内部で保持するサーバー一覧を返す。これはマスターブラウザ
(または過去にマスターブラウザだったコンピューター)
上でのみ意味を持つ。マスターブラウザはネットワーク上でどのコンピューターがサーバーまたはワークステーションになれるかを決定する権限を現在持つコンピューターである。servertype
パラメータで指定した種類に一致するサーバーが見つからない場合、NetServerEnum 関数は bufptr パラメータを NULL
として返し、entriesread と totalentries パラメータが指す DWORD 値は 0
になる。NetServerEnum
関数はブラウザサービスがインストールされ実行されていることに依存する。ブラウザサーバーが見つからない場合、NetServerEnum は
ERROR_NO_BROWSER_SERVERS_FOUND で失敗する。Active Directory
向けのプログラミングを行っている場合、特定の Active Directory Service Interface (ADSI)
メソッドを呼び出すことで、ネットワーク管理サーバー関数を呼ぶのと同じ機能を実現できる場合がある。詳細は IADsComputer を参照。


%index
NetServiceControl
NetServiceControl 関数は廃止されている。16 ビット版 Windows との互換性のために含まれている。他のアプリケーションはサービス関数を使用するべきである。
%prm
servername, service, opcode, arg, bufptr
servername : [wstr] 
service : [wstr] 
opcode : [int] 
arg : [int] 
bufptr : [var] 
%inst
NetServiceControl 関数は廃止されている。16 ビット版 Windows
との互換性のために含まれている。他のアプリケーションはサービス関数を使用するべきである。


%index
NetServiceEnum
NetServiceEnum 関数は廃止されている。16 ビット版 Windows との互換性のために含まれている。他のアプリケーションはサービス関数を使用するべきである。
%prm
servername, level, bufptr, prefmaxlen, entriesread, totalentries, resume_handle
servername : [wstr] 
level : [int] 
bufptr : [var] 
prefmaxlen : [int] 
entriesread : [var] 
totalentries : [var] 
resume_handle : [var] 
%inst
NetServiceEnum 関数は廃止されている。16 ビット版 Windows
との互換性のために含まれている。他のアプリケーションはサービス関数を使用するべきである。


%index
NetServiceGetInfo
NetServiceGetInfo 関数は廃止されている。16 ビット版 Windows との互換性のために含まれている。他のアプリケーションはサービス関数を使用するべきである。
%prm
servername, service, level, bufptr
servername : [wstr] 
service : [wstr] 
level : [int] 
bufptr : [var] 
%inst
NetServiceGetInfo 関数は廃止されている。16 ビット版 Windows
との互換性のために含まれている。他のアプリケーションはサービス関数を使用するべきである。


%index
NetServiceInstall
NetServiceInstall 関数は廃止されている。16 ビット版 Windows との互換性のために含まれている。他のアプリケーションはサービス関数を使用するべきである。
%prm
servername, service, argc, argv, bufptr
servername : [wstr] 
service : [wstr] 
argc : [int] 
argv : [var] 
bufptr : [var] 
%inst
NetServiceInstall 関数は廃止されている。16 ビット版 Windows
との互換性のために含まれている。他のアプリケーションはサービス関数を使用するべきである。


%index
NetStatisticsGet
サービスの動作統計情報を取得する。現在はワークステーションおよびサーバーサービスのみがサポートされている。
%prm
ServerName, Service, Level, Options, Buffer
ServerName : [var] 関数を実行するサーバーの DNS または NetBIOS 名を指定する文字列へのポインタ。このパラメータが NULL の場合、ローカルコンピューターが使われる。
Service : [var] 統計情報を取得するサービスの名前を指定する文字列へのポインタ。現在、SERVICE_SERVER と SERVICE_WORKSTATION の値のみが許可される。
Level : [int] データの情報レベルを指定する。このパラメータには次の値を指定できる。
Options : [int] このパラメータは 0 でなければならない。
Buffer : [var] データを受け取るバッファへのポインタ。このデータの形式は level パラメータの値に依存する。このバッファはシステムによって割り当てられ、NetApiBufferFree 関数で解放しなければならない。詳細は Network Management Function Buffers および Network Management Function Buffer Lengths を参照。
%inst
サービスの動作統計情報を取得する。現在はワークステーションおよびサーバーサービスのみがサポートされている。

[戻り値]
関数が成功した場合、戻り値は NERR_Success となる。失敗した場合、戻り値はシステムエラーコードとなる。エラーコードの一覧は
System Error Codes を参照。

[備考]
ワークステーションの統計情報を取得するために特別なグループメンバーシップは必要ない。リモートサーバー上で NetStatisticsGet
関数を正常に実行できるのは、Administrators または Server Operators ローカルグループのメンバーだけである。


%index
NetWkstaGetInfo
NetWkstaGetInfo 関数はワークステーションの構成情報を返す。
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


%index
NetWkstaSetInfo
NetWkstaSetInfo 関数は、システムを再初期化した後も有効な情報でワークステーションを構成する。
%prm
servername, level, buffer, parm_err
servername : [wstr] 関数を実行するリモートサーバーの DNS または NetBIOS 名を指定する文字列へのポインタ。このパラメータが NULL の場合、ローカルコンピューターが使われる。
level : [int] 
buffer : [var] データを指定するバッファへのポインタ。このデータの形式は level パラメータの値に依存する。詳細は Network Management Function Buffers を参照。
parm_err : [var] ERROR_INVALID_PARAMETER エラーを引き起こしたワークステーション情報構造体の最初のメンバーのインデックスを受け取る値へのポインタ。このパラメータが NULL の場合、エラー時にインデックスは返されない。詳細は解説セクションを参照。
%inst
NetWkstaSetInfo 関数は、システムを再初期化した後も有効な情報でワークステーションを構成する。

[戻り値]
関数が成功した場合、戻り値は NERR_Success となる。失敗した場合、戻り値は次のいずれかのエラーコードになる可能性がある。
（以下省略）

[備考]
リモートサーバー上で NetWkstaSetInfo 関数を正常に実行できるのは Administrators
グループのメンバーだけである。NetWkstaSetInfo 関数はローカルまたはリモートシステムの workstation
サービスを呼び出す。NetWkstaSetInfo 関数で実際に変更できるのは WKSTA_INFO_502
構造体のメンバーのうち限られた数だけである。workstation
サービスが無視するメンバーを設定してもエラーは返されない。workstation
サービスは主にレジストリの設定を使って構成される。ローカルシステムの構成情報を設定するには、NetWkstaSetInfo 関数の代わりに
NetWkstaUserSetInfo 関数を使える。NetWkstaUserSetInfo 関数は Local Security
Authority (LSA) を呼び出す。NetWkstaSetInfo 関数が ERROR_INVALID_PARAMETER
を返した場合、parm_err
パラメータを使って無効なワークステーション情報構造体の最初のメンバーを示すことができる。(ワークステーション情報構造体は
WKSTA_INFO_ で始まり、その形式は level パラメータで指定される。) 次の表は parm_err
パラメータで返される値と対応するエラーのある構造体メンバーを示す。(接頭辞 wki*_ はメンバーが wki100_ や wki402_
など複数の接頭辞で始まることを示す。)
（以下省略）

