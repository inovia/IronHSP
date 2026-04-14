; ============================================================
;   userenv.dll ヘルプ (CsWin32 / win32metadata から自動抽出)
;   docs_ja.json に日本語訳があればそちらを使用、無ければ英語原文。
;   翻訳を追加するときは docs_ja.json を編集して再生成。
; ============================================================

%index
CreateEnvironmentBlock
指定ユーザーの環境変数を取得する。このブロックは CreateProcessAsUser に渡せる。
%group
Win32 userenv
%prm
lpEnvironment, hToken, bInherit
lpEnvironment : [var] 型: LPVOID* 関数復帰時、新しい環境ブロックへのポインタを受け取る。環境ブロックは NULL 終端 Unicode 文字列の配列で、2 つの NULL (\0\0) で終わる。
hToken : [intptr] 型: HANDLE ユーザーのトークン。LogonUser などで取得する。プライマリトークンの場合は TOKEN_QUERY および TOKEN_DUPLICATE アクセスが必要。インパーソネーショントークンなら TOKEN_QUERY のみでよい。
bInherit : [int] 型: BOOL 現プロセスの環境を継承するか。TRUE で継承、FALSE で非継承。
%inst
指定ユーザーの環境変数を取得する。このブロックは CreateProcessAsUser に渡せる。

[戻り値]
型: BOOL 成功時は TRUE、失敗時は FALSE。拡張エラー情報は GetLastError で取得する。

[備考]
使用後は DestroyEnvironmentBlock でバッファを解放する。CreateProcessAsUser に渡す場合は
CREATE_UNICODE_ENVIRONMENT フラグを必ず指定する。CreateProcessAsUser
から復帰後、新プロセスは環境ブロックのコピーを持つため DestroyEnvironmentBlock
を安全に呼べる。%USERPROFILE% などユーザー固有変数はユーザープロファイルがロードされているときのみ設定されるため、必要なら
LoadUserProfile を呼ぶ。


%index
DestroyEnvironmentBlock
CreateEnvironmentBlock で作成された環境変数を解放する。
%group
Win32 userenv
%prm
lpEnvironment
lpEnvironment : [intptr] 型: LPVOID CreateEnvironmentBlock で作成された環境ブロックへのポインタ。NULL 終端 Unicode 文字列の配列で、2 つの NULL (\0\0) で終わる。
%inst
CreateEnvironmentBlock で作成された環境変数を解放する。

[戻り値]
型: BOOL 成功時は TRUE、失敗時は FALSE。拡張エラー情報は GetLastError で取得する。


%index
ExpandEnvironmentStringsForUserW
指定ユーザー用に確立された環境ブロックを使用してソース文字列を展開する。(Unicode)
%group
Win32 userenv
%prm
hToken, lpSrc, lpDest, dwSize
hToken : [intptr] 型: HANDLE ユーザーのトークン。LogonUser、CreateRestrictedToken、DuplicateToken、OpenProcessToken、OpenThreadToken などで取得する。TOKEN_IMPERSONATE、TOKEN_QUERY、Windows 7 以降は TOKEN_DUPLICATE も必要。NULL の場合、環境ブロックはシステム変数のみを含む。
lpSrc : [wstr] 型: LPCTSTR 展開対象の NULL 終端ソース文字列へのポインタ。
lpDest : [wstr] 型: LPTSTR 展開後の文字列を受け取るバッファへのポインタ。
dwSize : [int] 型: DWORD lpDest バッファのサイズ(TCHAR 単位)。
%inst
指定ユーザー用に確立された環境ブロックを使用してソース文字列を展開する。(Unicode)

[戻り値]
型: BOOL 成功時は TRUE、失敗時は FALSE。拡張エラー情報は GetLastError で取得する。

[備考]
ソース文字列の例は以下の通り。
（以下省略）


%index
GetUserProfileDirectoryW
指定ユーザーのプロファイルルートディレクトリへのパスを取得する。(Unicode)
%group
Win32 userenv
%prm
hToken, lpProfileDir, lpcchSize
hToken : [intptr] 型: HANDLE ユーザーのトークン。LogonUser などで取得。TOKEN_QUERY アクセスが必要。
lpProfileDir : [wstr] 型: LPTSTR 成功時、ユーザープロファイルディレクトリへのパスを受け取るバッファへのポインタ。
lpcchSize : [var] 型: LPDWORD lpProfileDir バッファのサイズ(TCHAR 単位)。バッファが小さすぎる場合または lpProfileDir が NULL の場合、失敗し必要サイズ(終端 NULL 含む)を受け取る。
%inst
指定ユーザーのプロファイルルートディレクトリへのパスを取得する。(Unicode)

[戻り値]
型: BOOL 成功時は TRUE、失敗時は FALSE。拡張エラー情報は GetLastError で取得する。

[備考]
Windows XP では、GetUserProfileDirectory が返すパスの例は以下の通り。
（以下省略）

