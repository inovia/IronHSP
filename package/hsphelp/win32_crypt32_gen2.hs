; ============================================================
;   crypt32.dll ヘルプ (CsWin32 / win32metadata から自動抽出)
;   docs_ja.json に日本語訳があればそちらを使用、無ければ英語原文。
;   翻訳を追加するときは docs_ja.json を編集して再生成。
; ============================================================

%index
CertCloseStore
証明書ストアのハンドルを閉じ、ストアの参照カウントを減らす。
%group
Win32 crypt32
%prm
hCertStore, dwFlags
hCertStore : [int] 閉じる証明書ストアのハンドル。
dwFlags : [int] 通常は既定値の 0 を指定する。既定動作では、未解放コンテキストがあってもメモリを残したままストアを閉じる。この場合、メモリの確認は行わない。
%inst
証明書ストアのハンドルを閉じ、ストアの参照カウントを減らす。

[戻り値]
成功時は TRUE、失敗時は FALSE を返す。拡張エラー情報は GetLastError
で取得する。CERT_CLOSE_STORE_CHECK_FLAG
が未設定、またはそれが設定されていてストアに関連付けられたすべてのコンテキストが解放済みであれば TRUE
を返す。CERT_CLOSE_STORE_CHECK_FLAG が設定されておりまだメモリが割り当てられたままのコンテキストがある場合は
FALSE を返す。FALSE を返してもストアは常に閉じられる。
コンテキストのメモリが残っている場合、GetLastError は CRYPT_E_PENDING_CLOSE
を返す。CERT_CLOSE_STORE_CHECK_FLAG が未設定なら既存の GetLastError 値は保持される。

[備考]

証明書ストアが開かれている間、ストアからコンテキストを取得または複製できる。取得/複製時に参照カウントが加算され、検索列挙関数への前回コンテキストとしての受け渡し、もしくは
CertFreeCertificateContext/CertFreeCRLContext/CertFreeCTLContext
で解放すると減算される。参照カウントが 0 になると対応するメモリは自動解放される。既定では、ストアクローズ時に参照カウントが 0
より大きいコンテキストのメモリは解放されない。このためメモリリークの原因となりうる。また、ストアクローズ後のコンテキストプロパティ変更は保存されない。強制解放するには
CERT_CLOSE_STORE_FORCE_FLAG
を設定する。これを設定するとストアに関連付けられたすべてのコンテキストメモリが解放され、それらへのポインタは無効になる。このフラグは、ストアやコンテキストが他の関数に渡されていない場合にのみ使用する。CERT_CLOSE_STORE_CHECK_FLAG
を使うとストアクローズ時に参照カウントの状態を確認でき、未解放のコンテキストがあれば FALSE を返し GetLastError が
CRYPT_E_PENDING_CLOSE となる。FALSE でもストアは閉じられるがメモリは解放されない。ストアオープン時に
CERT_STORE_NO_CRYPT_RELEASE_FLAG を指定していなければ、クローズ時に CSP ハンドルも解放される。


%index
CertEnumCertificatesInStore
証明書ストア内の最初または次の証明書を取得する。ループで呼び出すことで全証明書を順に列挙できる。
%group
Win32 crypt32
%prm
hCertStore, pPrevCertContext
hCertStore : [int] 証明書ストアのハンドル。
pPrevCertContext : [var] 前回見つかった証明書コンテキストの CERT_CONTEXT へのポインタ。列挙開始時は NULL を渡す。後続の呼び出しでは前回の戻り値を渡す。NULL でない値は本関数により解放される。論理ストア(コレクションストア含む)では、返された pCertContext の複製を使って新たな列挙サブシーケンスを開始することはできない。列挙は CertDeleteCertificateFromStore で以前削除された証明書をスキップする。
%inst
証明書ストア内の最初または次の証明書を取得する。ループで呼び出すことで全証明書を順に列挙できる。

[戻り値]
成功時はストア内の次の CERT_CONTEXT へのポインタを返す。これ以上証明書がない場合は NULL を返す。拡張エラー情報は
GetLastError で取得する。主なエラーコードは以下の通り。
（以下省略）

[備考]
返されたポインタは、後続呼び出しで pPrevCertContext として渡されたとき解放される。そうでない場合は
CertFreeCertificateContext で明示的に解放する必要がある。NULL でない pPrevCertContext
を渡した場合はエラー時も必ず解放される。現在列挙中の証明書の複製は CertDuplicateCertificateContext
で作成できる。


%index
CertFindCertificateInStore
dwFindType と関連する pvFindPara で指定した検索条件に一致する、ストア内の最初または次の証明書コンテキストを検索する。
%group
Win32 crypt32
%prm
hCertStore, dwCertEncodingType, dwFindFlags, dwFindType, pvFindPara, pPrevCertContext
hCertStore : [int] 検索対象の証明書ストアのハンドル。
dwCertEncodingType : [int] 使用するエンコーディングの種類。証明書エンコーディング種別とメッセージエンコーディング種別の両方をビット単位 OR で組み合わせて指定する必要がある。例: X509_ASN_ENCODING | PKCS_7_ASN_ENCODING 現在定義されているエンコーディング種別は以下の通り。
dwFindFlags : [int] 一部の dwFindType 値と組み合わせて検索条件を変更する。大抵の dwFindType では使用されず 0 を指定する。詳細は Remarks 参照。
dwFindType : [int] 
pvFindPara : [intptr] dwFindType と共に使用するデータ項目または構造体を指すポインタ。
pPrevCertContext : [var] 前回この関数が返した CERT_CONTEXT 構造体へのポインタ。初回呼び出し時は NULL を指定する。条件に一致する後続証明書を得るには前回の戻り値を渡す。NULL でない値は本関数により解放される。
%inst
dwFindType と関連する pvFindPara
で指定した検索条件に一致する、ストア内の最初または次の証明書コンテキストを検索する。

[戻り値]
成功時は読み取り専用の CERT_CONTEXT 構造体へのポインタを返す。検索条件に一致する証明書が見つからなかった場合は NULL
を返す。NULL でない戻り値は CertFreeCertificateContext で解放するか、次回呼び出しの
pPrevCertContext として渡して解放する必要がある。拡張エラー情報は GetLastError
で取得する。主なエラーコードは以下の通り。
（以下省略）

[備考]
dwFindFlags
パラメータは一部の検索種別の条件を変更するために使用する。CERT_UNICODE_IS_RDN_ATTRS_FLAG は
dwFindType が CERT_FIND_SUBJECT_ATTR または CERT_FIND_ISSUER_ATTR
の場合のみ使用され、pvFindPara が指す CERT_RDN_ATTR 構造体が Unicode
文字列で初期化されている場合に設定する必要がある。比較前に X509_UNICODE_NAME を使って変換される。以下の
dwFindFlags 値は dwFindType が CERT_FIND_ENKEY_USAGE の場合のみ使用される:
返されたコンテキストの複製は CertDuplicateCertificateContext で作成できる。返されたコンテキストは
CertAddCertificateContextToStore で別の証明書ストアに追加できる。返されたポインタは、次回呼び出しの
pPrevCertContext として渡すと解放される。そうでなければ CertFreeCertificateContext
で明示的に解放する。NULL でない pPrevCertContext はエラー時も必ず
CertFreeCertificateContext により解放される。


%index
CertOpenSystemStoreW
最も一般的なシステム証明書ストアを開く。ファイルベースやメモリベースのストアなどより複雑なストアには CertOpenStore を使用する。(Unicode)
%group
Win32 crypt32
%prm
hProv, szSubsystemProtocol
hProv : [int] 使用されない。0 を指定すること。Windows Server 2003 および Windows XP: CSP のハンドル。0 で既定 CSP を使用。0 でない場合は CryptAcquireContext で作成した CSP ハンドルでなければならない。データ型は HCRYPTPROV。
szSubsystemProtocol : [wstr] システムストア名を表す文字列。既存のシステムストア名でない場合は新規作成される。既存システムストア名の一覧は CertEnumSystemStore で取得できる。代表例は以下の表参照。
%inst
最も一般的なシステム証明書ストアを開く。ファイルベースやメモリベースのストアなどより複雑なストアには CertOpenStore
を使用する。(Unicode)

[戻り値]
成功時は証明書ストアのハンドルを返す。失敗時は NULL を返す。拡張エラー情報は GetLastError
で取得する。CertOpenStore のエラーがそのまま伝播される。

[備考]

この方法でアクセスできるのはカレントユーザーの証明書のみで、ローカルマシンストアにはアクセスできない。オープン後は標準の証明書ストア関数で操作できる。使用後は
CertCloseStore で閉じる。自動移行されるストアについては Certificate Store Migration を参照。


%index
CryptBinaryToStringW
バイト配列を書式化された文字列に変換する。(Unicode)
%group
Win32 crypt32
%prm
pbBinary, cbBinary, dwFlags, pszString, pcchString
pbBinary : [var] 文字列化するバイト配列へのポインタ。
cbBinary : [int] pbBinary 配列の要素数。
dwFlags : [int] 
pszString : [wstr] 変換後の文字列を受け取るバッファへのポインタ。必要文字数を計算するには NULL を指定する。関数は終端 NULL 文字を含む必要文字数を pcchString に格納する。
pcchString : [var] pszString バッファのサイズ(TCHAR 単位)を格納した DWORD へのポインタ。pszString が NULL の場合、関数は終端 NULL を含む必要文字数を TCHAR 単位で計算して返す。pszString が NULL でなく十分に大きい場合、終端 NULL を含む文字列を格納し、pcchString には終端 NULL を除いた文字数が返される。
%inst
バイト配列を書式化された文字列に変換する。(Unicode)

[戻り値]
成功時は 0 以外 (TRUE) を返す。失敗時は 0 (FALSE) を返す。

[備考]
CRYPT_STRING_BINARY エンコーディングを除き、すべての文字列には改行シーケンスが付加される。既定では CR/LF
(0x0D/0x0A) が使用される。dwFlags に CRYPT_STRING_NOCR が指定されている場合は LF (0x0A)
のみ、CRYPT_STRING_NOCRLF が指定されている場合は改行は付加されない。
> [!NOTE] > wincrypt.h は UNICODE マクロに応じて CryptBinaryToString を
ANSI/Unicode
版へのエイリアスとして定義する。エンコーディング中立なエイリアスと非中立コードを混在させるとコンパイル/ランタイムエラーの原因となる。


%index
CryptProtectData
DATA_BLOB 構造体中のデータを暗号化する。
%group
Win32 crypt32
%prm
pDataIn, szDataDescr, pOptionalEntropy, pvReserved, pPromptStruct, dwFlags, pDataOut
pDataIn : [var] 暗号化する平文を保持する DATA_BLOB 構造体へのポインタ。
szDataDescr : [wstr] 暗号化データの可読な説明文字列。暗号化データと共に保存される。省略可能で NULL 可。
pOptionalEntropy : [var] 暗号化に使用するパスワードなど追加のエントロピーを保持する DATA_BLOB 構造体へのポインタ。暗号化フェーズで使用した構造体と同じものを復号フェーズでも使わなければならない。追加エントロピーが不要なら NULL を指定する。
pvReserved : [intptr] 予約。NULL を指定する必要がある。
pPromptStruct : [var] プロンプト表示の場所・タイミング・内容を指定する CRYPTPROTECT_PROMPTSTRUCT 構造体へのポインタ。暗号化と復号の両フェーズで NULL 可。
dwFlags : [int] 以下のいずれかのフラグを指定できる。
pDataOut : [var] 暗号化データを受け取る DATA_BLOB 構造体へのポインタ。使用後は LocalFree で pbData メンバを解放すること。
%inst
DATA_BLOB 構造体中のデータを暗号化する。

[戻り値]
成功時は TRUE、失敗時は FALSE を返す。拡張エラー情報は GetLastError で取得する。

[備考]

通常、データを暗号化したユーザーと同一のログオン資格情報を持つユーザーのみが復号できる。また暗号化を実行したコンピュータ上でのみ復号できる。ただしローミングプロファイルを持つユーザーは別のコンピュータから復号できる。CRYPTPROTECT_LOCAL_MACHINE
フラグで暗号化すれば、同一コンピュータ上のすべてのユーザーが復号できる。関数は暗号化用のセッション鍵を生成し、復号時にも再導出する。また改ざん検出用
MAC も付加する。一時的に同一プロセス内または複数プロセス間でメモリを保護するには CryptProtectMemory を使用する。


%index
CryptStringToBinaryW
書式化された文字列をバイト配列に変換する。(Unicode)
%group
Win32 crypt32
%prm
pszString, cchString, dwFlags, pbBinary, pcbBinary, pdwSkip, pdwFlags
pszString : [wstr] 変換対象の書式化文字列を指すポインタ。
cchString : [int] 変換する文字列長(終端 NULL は含まない)。0 を指定すると pszString は NULL 終端とみなされる。
dwFlags : [int] 
pbBinary : [var] バイト列を受け取るバッファへのポインタ。NULL を指定すると必要バッファサイズが pcbBinary に返される。
pcbBinary : [var] 入力時は pbBinary バッファのサイズ(バイト単位)。関数復帰後はコピーされたバイト数が格納される。値が小さい場合は失敗し GetLastError は ERROR_MORE_DATA を返す。pbBinary が NULL の場合、pcbBinary の値は無視される。
pdwSkip : [var] `-----BEGIN ...-----` ヘッダ開始までスキップした文字数を受け取る DWORD へのポインタ。ヘッダがなければ 0 が返る。省略可能で NULL 可。
pdwFlags : [var] 実際に変換で使用されたフラグを受け取る DWORD へのポインタ。多くの場合 dwFlags と同じ値だが、dwFlags に下記フラグが含まれる場合は実際の文字列書式を示すフラグが返る。省略可能で NULL 可。
%inst
書式化された文字列をバイト配列に変換する。(Unicode)

[戻り値]
成功時は 0 以外 (TRUE) を返す。失敗時は 0 (FALSE) を返す。

[備考]

CRYPT_STRING_BASE64HEADER、CRYPT_STRING_BASE64REQUESTHEADER、CRYPT_STRING_BASE64X509CRLHEADER
は本関数では同一扱いされ、`-----BEGIN ...-----` と `-----END ...-----` の間にある最初の
base64 エンコードデータブロックの解析を試みる。`...` 部分は無視され一致する必要はない。解析成功時、dwFlags
で渡した値がそのまま pdwFlags の DWORD に返される。CRYPT_STRING_BASE64REQUESTHEADER や
CRYPT_STRING_BASE64X509CRLHEADER が返ったからといって実際にリクエストヘッダや X.509 CRL
が見つかったとは限らないことに注意。> [!NOTE] > wincrypt.h は UNICODE マクロに応じて
CryptStringToBinary を ANSI/Unicode 版のエイリアスとして定義する。


%index
CryptUnprotectData
DATA_BLOB 構造体中のデータを復号し、整合性チェックを行う。
%group
Win32 crypt32
%prm
pDataIn, ppszDataDescr, pOptionalEntropy, pvReserved, pPromptStruct, dwFlags, pDataOut
pDataIn : [var] 暗号化データを保持する DATA_BLOB 構造体へのポインタ。cbData メンバには暗号化対象テキストを含む pbData バイト列の長さが入る。
ppszDataDescr : [var] 暗号化データに含まれていた可読な説明文字列へのポインタ。NULL も可。使用後は LocalFree で解放する。
pOptionalEntropy : [var] 暗号化時に使用された追加エントロピーを保持する DATA_BLOB 構造体へのポインタ。NULL 可だが、暗号化フェーズで追加エントロピーが使われた場合は同じ構造体を渡す必要がある。
pvReserved : [intptr] 予約。NULL を指定する必要がある。
pPromptStruct : [var] プロンプト表示の場所・タイミング・内容を指定する CRYPTPROTECT_PROMPTSTRUCT 構造体へのポインタ。NULL 可。
dwFlags : [int] 本関数のオプションを指定する DWORD。0 を指定するとオプション無し。または下記のフラグを指定できる。
pDataOut : [var] 復号データを格納する DATA_BLOB 構造体へのポインタ。使用後は LocalFree で pbData メンバを解放する。
%inst
DATA_BLOB 構造体中のデータを復号し、整合性チェックを行う。

[戻り値]
成功時は TRUE、失敗時は FALSE を返す。

[備考]
CryptProtectData が暗号化時に生成したセッション鍵を再導出してデータ BLOB を復号する。暗号化データに付加された
MAC ハッシュにより改ざん検出を行い、改ざんが検出された場合は ERROR_INVALID_DATA を返す。DATA_BLOB
構造体使用後は LocalFree で pbData メンバを解放する。NULL でない ppszDataDescr も
LocalFree で解放する必要がある。機密情報使用後は SecureZeroMemory でメモリをクリアすること。

