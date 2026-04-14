; ============================================================
;   bcrypt.dll ヘルプ (CsWin32 / win32metadata から自動抽出)
;   docs_ja.json に日本語訳があればそちらを使用、無ければ英語原文。
;   翻訳を追加するときは docs_ja.json を編集して再生成。
; ============================================================

%index
BCryptDestroyHash
ハッシュまたはメッセージ認証コード (MAC) オブジェクトを破棄する。
%group
Win32 bcrypt
%prm
hHash
hHash : [int] 破棄するハッシュまたは MAC オブジェクトのハンドル。BCryptCreateHash 関数で取得したハンドルを指定する。
%inst
ハッシュまたはメッセージ認証コード (MAC) オブジェクトを破棄する。

[戻り値]
関数の成否を示すステータスコードを返す。
主な戻り値は以下の通り。
（以下省略）

[備考]
プロバイダがサポートするプロセッサモードに応じて、BCryptDestroyHash
はユーザーモードまたはカーネルモードのどちらからでも呼び出せる。カーネルモード呼び出し元は PASSIVE_LEVEL IRQL または
DISPATCH_LEVEL IRQL のいずれかで実行できる。現在の IRQL が DISPATCH_LEVEL の場合、hHash
に渡すハンドルは BCRYPT_PROV_DISPATCH
フラグ付きで開かれたプロバイダから返されたアルゴリズムハンドル由来でなければならない。カーネルモードで呼び出す場合は DDK に含まれる
Cng.lib を使用する。Windows Server 2008 および Windows Vista: カーネルモードで呼び出す場合は
Ksecdd.lib を使用する。


%index
BCryptCloseAlgorithmProvider
アルゴリズムプロバイダを閉じる。
%group
Win32 bcrypt
%prm
hAlgorithm, dwFlags
hAlgorithm : [int] 閉じるアルゴリズムプロバイダを表すハンドル。BCryptOpenAlgorithmProvider で取得する。
dwFlags : [int] 関数の動作を変更するフラグ群。現在定義されているフラグはない。
%inst
アルゴリズムプロバイダを閉じる。

[戻り値]
関数の成否を示すステータスコードを返す。
主な戻り値は以下の通り。
（以下省略）

[備考]
BCryptCloseAlgorithmProvider はユーザーモードまたはカーネルモードから呼び出せる。カーネルモード呼び出し元は
PASSIVE_LEVEL IRQL で実行する必要がある。カーネルモードで呼び出す場合は DDK の Cng.lib を使用する。詳細は
WDK および Developer Tools を参照。Windows Server 2008 および Windows Vista:
カーネルモードで呼び出す場合は Ksecdd.lib を使用する。


%index
BCryptCreateHash
ハッシュまたはメッセージ認証コード (MAC) オブジェクトを作成する。
%group
Win32 bcrypt
%prm
hAlgorithm, phHash, pbHashObject, cbHashObject, pbSecret, cbSecret, dwFlags
hAlgorithm : [int] BCryptOpenAlgorithmProvider で作成したアルゴリズムプロバイダのハンドル。プロバイダ作成時に指定したアルゴリズムはハッシュインタフェースをサポートする必要がある。
phHash : [var] ハッシュまたは MAC オブジェクトを表すハンドルを受け取る BCRYPT_HASH_HANDLE 変数へのポインタ。BCryptHashData などの後続のハッシュ/MAC 関数で使用する。使用が終わったら BCryptDestroyHash に渡して解放する。
pbHashObject : [var] ハッシュまたは MAC オブジェクトを受け取るバッファへのポインタ。サイズは cbHashObject で指定する。必要なサイズは BCryptGetProperty を BCRYPT_OBJECT_LENGTH プロパティで呼び出して取得できる。このメモリは phHash が指すハンドルを破棄した後でのみ解放できる。この値が NULL かつ cbHashObject が 0 の場合、関数内部でメモリが確保・解放される。Windows 7: このメモリ管理機能は Windows 7 以降で利用可能。
cbHashObject : [int] pbHashObject バッファのサイズ(バイト単位)。0 で pbHashObject が NULL の場合、関数内部でキーオブジェクト用メモリを確保・解放する。Windows 7 以降で利用可能。
pbSecret : [var] ハッシュまたは MAC に使用する鍵を格納したバッファへのポインタ。サイズは cbSecret で指定する。この鍵は BCRYPT_ALG_HANDLE_HMAC フラグで開かれたハッシュアルゴリズムにのみ適用される。それ以外では NULL を指定する。
cbSecret : [int] pbSecret バッファのサイズ(バイト単位)。鍵を使用しない場合は 0 を指定する。
dwFlags : [int] 関数の動作を変更するフラグ。0 または下記の値を指定できる。
%inst
ハッシュまたはメッセージ認証コード (MAC) オブジェクトを作成する。

[戻り値]
関数の成否を示すステータスコードを返す。
主な戻り値は以下の通り。
（以下省略）

[備考]
プロバイダがサポートするプロセッサモードに応じて、BCryptCreateHash
はユーザーモードまたはカーネルモードから呼び出せる。現在の IRQL が DISPATCH_LEVEL の場合、hAlgorithm
に渡すハンドルは BCRYPT_PROV_DISPATCH
フラグ付きで開かれている必要があり、引数に渡すすべてのポインタはページアウトされない(またはロックされた)メモリを参照する必要がある。カーネルモードでは
Cng.lib を使用する。Windows Server 2008 および Windows Vista: カーネルモードでは
Ksecdd.lib を使用する。


%index
BCryptDestroyKey
鍵を破棄する。
%group
Win32 bcrypt
%prm
hKey
hKey : [int] 破棄する鍵のハンドル。
%inst
鍵を破棄する。

[戻り値]
関数の成否を示すステータスコードを返す。
主な戻り値は以下の通り。
（以下省略）

[備考]
プロバイダがサポートするプロセッサモードに応じて、BCryptDestroyKey
はユーザーモードまたはカーネルモードから呼び出せる。DISPATCH_LEVEL で呼ぶ場合、hKey は
BCRYPT_PROV_DISPATCH フラグで開かれたプロバイダから得たアルゴリズムハンドル由来である必要がある。カーネルモードでは
Cng.lib(Windows Server 2008/Vista では Ksecdd.lib)を使用する。


%index
BCryptDecrypt
データブロックを復号する。
%group
Win32 bcrypt
%prm
hKey, pbInput, cbInput, pPaddingInfo, pbIV, cbIV, pbOutput, cbOutput, pcbResult, dwFlags
hKey : [int] データ復号に使用する鍵のハンドル。BCryptGenerateSymmetricKey、BCryptGenerateKeyPair、BCryptImportKey などで取得する。
pbInput : [var] 復号する暗号文を格納したバッファのアドレス。サイズは cbInput で指定する。詳細は Remarks 参照。
cbInput : [int] pbInput バッファ中で復号するバイト数。
pPaddingInfo : [intptr] パディング情報構造体へのポインタ。非対称鍵または認証付き暗号モード使用時のみ指定。認証付き暗号モードでは BCRYPT_AUTHENTICATED_CIPHER_MODE_INFO を指す必要がある。非対称鍵の場合、構造体の種類は dwFlags によって決まる。それ以外では NULL を指定する。
pbIV : [var] 復号時に使用する初期化ベクタ (IV) を格納したバッファのアドレス。cbIV でサイズを指定。関数はこのバッファの内容を変更するため、後で再利用する場合は事前にコピーしておくこと。省略可能で、IV を使わない場合は NULL 可。必要な IV サイズは BCryptGetProperty を BCRYPT_BLOCK_LENGTH プロパティで呼び出して取得できる。
cbIV : [int] pbIV バッファのサイズ(バイト単位)。
pbOutput : [var] 復号後の平文を受け取るバッファのアドレス。サイズは cbOutput で指定する。NULL を渡すと必要サイズを計算し pcbResult に格納して STATUS_SUCCESS を返す。pbOutput と pbInput の両方が NULL の場合、認証付き暗号アルゴリズム使用時を除きエラーとなる。
cbOutput : [int] pbOutput バッファのサイズ(バイト単位)。pbOutput が NULL の場合は無視される。
pcbResult : [var] pbOutput バッファにコピーされたバイト数を受け取る ULONG 変数へのポインタ。pbOutput が NULL の場合、必要な平文サイズを受け取る。
dwFlags : [int] 関数の動作を変更するフラグ群。許容されるフラグは hKey の種類によって異なる。
%inst
データブロックを復号する。

[戻り値]
関数の成否を示すステータスコードを返す。
主な戻り値は以下の通り。
（以下省略）

[備考]
pbInput と pbOutput
は同一バッファでもよく、その場合はインプレース復号となる。異なる場合は両バッファが重なってはならない。ユーザー/カーネルモードで呼び出せるが、DISPATCH_LEVEL
で呼ぶ場合は hKey が BCRYPT_PROV_DISPATCH
で開かれたプロバイダ由来である必要があり、ポインタはページアウトされないメモリを参照する必要がある。カーネルモードでは
Cng.lib(Windows Server 2008/Vista では Ksecdd.lib)を使用する。


%index
BCryptEncrypt
データブロックを暗号化する。(BCryptEncrypt)
%group
Win32 bcrypt
%prm
hKey, pbInput, cbInput, pPaddingInfo, pbIV, cbIV, pbOutput, cbOutput, pcbResult, dwFlags
hKey : [int] データ暗号化に使用する鍵のハンドル。BCryptGenerateSymmetricKey、BCryptGenerateKeyPair、BCryptImportKey などで取得する。
pbInput : [var] 暗号化する平文を格納したバッファのアドレス。サイズは cbInput で指定する。詳細は Remarks 参照。
cbInput : [int] pbInput バッファ中で暗号化するバイト数。
pPaddingInfo : [intptr] パディング情報構造体へのポインタ。非対称鍵または認証付き暗号モード使用時のみ指定。認証付き暗号モードでは BCRYPT_AUTHENTICATED_CIPHER_MODE_INFO を指す必要がある。それ以外では NULL を指定する。
pbIV : [var] 暗号化時の初期化ベクタ (IV) を格納したバッファのアドレス。関数はこのバッファの内容を変更するため再利用時は事前コピーが必要。IV を使わない場合は NULL 可。必要サイズは BCRYPT_BLOCK_LENGTH プロパティで取得する。
cbIV : [int] pbIV バッファのサイズ(バイト単位)。
pbOutput : [var] 暗号文を受け取るバッファのアドレス。NULL を渡すと必要サイズを計算し pcbResult に格納して STATUS_SUCCESS を返す。pPaddingInfo は変更されない。pbOutput と pbInput が両方 NULL の場合は認証付き暗号モード以外ではエラーとなる。
cbOutput : [int] pbOutput バッファのサイズ(バイト単位)。pbOutput が NULL の場合は無視される。
pcbResult : [var] pbOutput バッファにコピーされたバイト数を受け取る ULONG 変数へのポインタ。pbOutput が NULL の場合、必要な暗号文サイズを受け取る。
dwFlags : [int] 関数の動作を変更するフラグ群。許容されるフラグは hKey の種類によって異なる。
%inst
データブロックを暗号化する。(BCryptEncrypt)

[戻り値]
関数の成否を示すステータスコードを返す。
主な戻り値は以下の通り。
（以下省略）

[備考]
pbInput と pbOutput
は同一でもよくインプレース暗号化となる。暗号化後データが元より大きくなる場合があるためバッファサイズに注意。別バッファの場合は重なってはならない。DISPATCH_LEVEL
で呼ぶ場合の制約は他の BCrypt 関数と同様。カーネルモードでは Cng.lib(Windows Server 2008/Vista
では Ksecdd.lib)を使用する。


%index
BCryptFinishHash
BCryptHashData の呼び出しで蓄積されたデータに対するハッシュまたは MAC 値を取得する。
%group
Win32 bcrypt
%prm
hHash, pbOutput, cbOutput, dwFlags
hHash : [int] ハッシュ/MAC 計算に使用するオブジェクトのハンドル。BCryptCreateHash で取得する。本関数呼び出し後は BCryptDestroyHash 以外では再利用できない。
pbOutput : [var] ハッシュまたは MAC 値を受け取るバッファへのポインタ。サイズは cbOutput で指定する。
cbOutput : [int] pbOutput バッファのサイズ(バイト単位)。ハッシュ/MAC 値のサイズと厳密に一致させる必要がある。BCRYPT_HASH_LENGTH プロパティで取得できる。
dwFlags : [int] 関数の動作を変更するフラグ群。現在定義されていないので 0 を指定する。
%inst
BCryptHashData の呼び出しで蓄積されたデータに対するハッシュまたは MAC 値を取得する。

[戻り値]
関数の成否を示すステータスコードを返す。
主な戻り値は以下の通り。
（以下省略）

[備考]
プロバイダがサポートするプロセッサモードに応じてユーザー/カーネルモードから呼び出せる。DISPATCH_LEVEL
呼び出し時の条件は他の BCrypt 関数と同様。カーネルモードでは Cng.lib(Windows Server 2008/Vista
では Ksecdd.lib)を使用する。


%index
BCryptGenRandom
乱数を生成する。
%group
Win32 bcrypt
%prm
hAlgorithm, pbBuffer, cbBuffer, dwFlags
hAlgorithm : [int] BCryptOpenAlgorithmProvider で作成したアルゴリズムプロバイダのハンドル。乱数生成インタフェースをサポートするアルゴリズムを指定している必要がある。
pbBuffer : [var] 乱数を受け取るバッファのアドレス。サイズは cbBuffer で指定する。
cbBuffer : [int] pbBuffer バッファのサイズ(バイト単位)。
dwFlags : [int] 関数の動作を変更するフラグ群。0 または下記の値を指定できる。
%inst
乱数を生成する。

[戻り値]
関数の成否を示すステータスコードを返す。
主な戻り値は以下の通り。
（以下省略）

[備考]
既定の乱数プロバイダは NIST SP800-90 準拠(具体的には CTR_DRBG)の乱数生成アルゴリズムを実装する。Windows
Vista: SP1 より前では FIPS 186-2 準拠。DISPATCH_LEVEL 呼び出し時は hAlgorithm が
BCRYPT_PROV_DISPATCH
で開かれている必要があり、ポインタはページアウトされないメモリを参照する必要がある。Windows Vista の Microsoft
プロバイダは DISPATCH_LEVEL 呼び出しに対応しない。カーネルモードでは Cng.lib(Windows Server
2008/Vista では Ksecdd.lib)を使用する。


%index
BCryptHashData
データバッファに対して一方向ハッシュまたはメッセージ認証コード (MAC) を計算する。
%group
Win32 bcrypt
%prm
hHash, pbInput, cbInput, dwFlags
hHash : [int] 処理対象のハッシュまたは MAC オブジェクトのハンドル。BCryptCreateHash で取得する。
pbInput : [var] 処理するデータを格納したバッファへのポインタ。cbInput でサイズを指定する。関数はこのバッファの内容を変更しない。
cbInput : [int] pbInput バッファのバイト数。
dwFlags : [int] 関数の動作を変更するフラグ群。現在定義されていないので 0 を指定する。
%inst
データバッファに対して一方向ハッシュまたはメッセージ認証コード (MAC) を計算する。

[戻り値]
関数の成否を示すステータスコードを返す。
主な戻り値は以下の通り。
（以下省略）

[備考]
複数のバッファを 1 つのハッシュ/MAC にまとめるには、異なるバッファを渡して本関数を複数回呼び出す。最終的なハッシュ/MAC 値は
BCryptFinishHash で取得する。BCryptFinishHash
呼び出し後、該当ハンドルは再利用できない。DISPATCH_LEVEL 呼び出し時の制約は他の BCrypt
関数と同様。カーネルモードでは Cng.lib(Windows Server 2008/Vista では
Ksecdd.lib)を使用する。


%index
BCryptOpenAlgorithmProvider
CNG プロバイダをロードし初期化する。
%group
Win32 bcrypt
%prm
phAlgorithm, pszAlgId, pszImplementation, dwFlags
phAlgorithm : [var] CNG プロバイダハンドルを受け取る BCRYPT_ALG_HANDLE 変数へのポインタ。使用後は BCryptCloseAlgorithmProvider に渡して解放する。
pszAlgId : [wstr] 要求する暗号アルゴリズムを表す NULL 終端 Unicode 文字列へのポインタ。標準の CNG アルゴリズム識別子または登録された別のアルゴリズム識別子を指定する。
pszImplementation : [wstr] ロードする特定プロバイダを表す NULL 終端 Unicode 文字列へのポインタ。登録された暗号プリミティブプロバイダのエイリアス。省略可能で NULL の場合は指定アルゴリズムの既定プロバイダがロードされる。
dwFlags : [int] 
%inst
CNG プロバイダをロードし初期化する。

[戻り値]
関数の成否を示すステータスコードを返す。
主な戻り値は以下の通り。
（以下省略）

[備考]
アルゴリズムプロバイダの検索・ロード・初期化には多くの処理を要するため、BCryptOpenAlgorithmProvider
は比較的重い関数である。複数回使用するアルゴリズムプロバイダハンドルはキャッシュして再利用することが推奨される。ユーザーモードまたは
PASSIVE_LEVEL でのカーネルモードから呼び出せる。カーネルモードでは Cng.lib(Windows Server
2008/Vista では Ksecdd.lib)を使用する。
Windows 10 以降、CNG
は暗号設定変更を即時反映しない場合がある。新しい既定プロバイダの追加やアルゴリズムプロバイダの優先順序変更などは再起動が必要になることがあるため、新規設定プロバイダでの呼び出し前には再起動すること。

