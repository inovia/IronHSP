; ============================================================
;   bcrypt.dll ヘルプ (CsWin32 / win32metadata から自動抽出)
;   docs_ja.json に日本語訳があればそちらを使用、無ければ英語原文。
;   翻訳を追加するときは docs_ja.json を編集して再生成。
; ============================================================

%type
拡張命令
%ver
1.0
%dll
bcrypt.dll
%date
2026/04/16
%author
IronHSP / CsWin32 bridge
%url
https://github.com/inovia/IronHSP
%port
Win

%note
Win32 API の bcrypt.dll 関数群。CsWin32 + win32metadata から自動生成。
hsp3net 専用 (intptr / NSTRUCT / wstr を使用)。

%group
Win32API

%index
BCryptDestroyKey
鍵を破棄する。
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
BCryptDestroyHash
ハッシュまたはメッセージ認証コード (MAC) オブジェクトを破棄する。
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
BCryptAddContextFunction
既存の CNG コンテキストがサポートする関数の一覧に、暗号関数を追加する。
%prm
dwTable, pszContext, dwInterface, pszFunction, dwPosition
dwTable : [int] 
pszContext : [wstr] 関数を追加する対象コンテキストの識別子を含む、null 終端 Unicode 文字列へのポインタ。
dwInterface : [int] 
pszFunction : [wstr] 追加する暗号関数の識別子を含む、null 終端 Unicode 文字列へのポインタ。
dwPosition : [int] この関数をリストに挿入する位置を指定する。関数は既存のすべての関数の前のこの位置に挿入される。CRYPT_PRIORITY_TOP を指定するとリストの先頭に、CRYPT_PRIORITY_BOTTOM を指定するとリストの末尾に挿入される。
%inst
既存の CNG コンテキストがサポートする関数の一覧に、暗号関数を追加する。

[戻り値]
関数の成否を示すステータスコードを返す。
返される可能性のあるコードには次のものが含まれるが、これらに限られない。
（以下省略）

[備考]

追加しようとした関数がすでにリスト内に存在する場合、いったん削除されたうえで新しい位置に挿入される。BCryptAddContextFunction
はユーザーモードでのみ呼び出すことができる。


%index
BCryptCloseAlgorithmProvider
アルゴリズムプロバイダを閉じる。
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
BCryptConfigureContext
既存の CNG コンテキストの構成情報を設定する。
%prm
dwTable, pszContext, pConfig
dwTable : [int] 
pszContext : [wstr] 構成情報を設定する対象コンテキストの識別子を含む、null 終端 Unicode 文字列へのポインタ。
pConfig : [var] 新しいコンテキスト構成情報を格納した CRYPT_CONTEXT_CONFIG 構造体のアドレス。
%inst
既存の CNG コンテキストの構成情報を設定する。

[戻り値]
関数の成否を示すステータスコードを返す。
返される可能性のあるコードには次のものが含まれるが、これらに限られない。
（以下省略）

[備考]
BCryptConfigureContext はユーザーモードでのみ呼び出すことができる。


%index
BCryptConfigureContextFunction
既存の CNG コンテキストの暗号関数に対する構成情報を設定する。
%prm
dwTable, pszContext, dwInterface, pszFunction, pConfig
dwTable : [int] 
pszContext : [wstr] 暗号関数の構成情報を設定する対象コンテキストの識別子を含む、null 終端 Unicode 文字列へのポインタ。
dwInterface : [int] 
pszFunction : [wstr] 構成情報を設定する対象暗号関数の識別子を含む、null 終端 Unicode 文字列へのポインタ。
pConfig : [var] 新しい関数構成情報を格納した CRYPT_CONTEXT_FUNCTION_CONFIG 構造体のアドレス。
%inst
既存の CNG コンテキストの暗号関数に対する構成情報を設定する。

[戻り値]
関数の成否を示すステータスコードを返す。
返される可能性のあるコードには次のものが含まれるが、これらに限られない。
（以下省略）

[備考]
BCryptConfigureContextFunction はユーザーモードでのみ呼び出すことができる。


%index
BCryptCreateContext
新しい CNG 構成コンテキストを作成する。
%prm
dwTable, pszContext, pConfig
dwTable : [int] 
pszContext : [wstr] 作成するコンテキストの識別子を含む、null 終端 Unicode 文字列へのポインタ。
pConfig : [var] 新しいコンテキスト用の追加構成データを格納した CRYPT_CONTEXT_CONFIG 構造体へのポインタ。不要であればこのパラメータは NULL にできる。
%inst
新しい CNG 構成コンテキストを作成する。

[戻り値]
関数の成否を示すステータスコードを返す。
返される可能性のあるコードには次のものが含まれるが、これらに限られない。
（以下省略）

[備考]
BCryptCreateContext はユーザーモードでのみ呼び出すことができる。


%index
BCryptCreateHash
ハッシュまたはメッセージ認証コード (MAC) オブジェクトを作成する。
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
BCryptCreateMultiHash
BCryptCreateMultiHash 関数は、複数のハッシュ操作を並列に計算できるマルチハッシュ状態を作成する。
%prm
hAlgorithm, phHash, nHashes, pbHashObject, cbHashObject, pbSecret, cbSecret, dwFlags
hAlgorithm : [int] *BCRYPT_ALG_HANDLE* `[in, out]` マルチハッシュ配列内のすべてのハッシュ状態に使用されるアルゴリズムハンドル。このアルゴリズムハンドルは、[BCryptOpenAlgorithmProvider](nf-bcrypt-bcryptopenalgorithmprovider.md) 関数に **BCYRPT_MULTI_FLAG** を渡してオープンされたものでなければならない。あるいは、呼び出し元が疑似ハンドルを使用することもできる。
phHash : [var] *BCRYPT_HASH_HANDLE** `[out]` マルチハッシュ状態を表すハンドルを受け取る **BCRYPT_HASH_HANDLE** 値へのポインタ。このハンドルは [BCryptProcessMultiOperations](nf-bcrypt-bcryptprocessmultioperations.md) などの後続の操作で使用される。ハンドルの使用が終わったら、[BCryptDestroyHash](nf-bcrypt-bcryptdestroyhash.md) 関数に渡して解放する。
nHashes : [int] *ULONG* `[in]` 配列内の要素数。この関数によって作成されるマルチハッシュ状態は、*nHashes* 個の異なるハッシュ状態に対する並列計算を行える。
pbHashObject : [var] *PUCHAR* `[out]` マルチハッシュ状態を受け取るバッファへのポインタ。サイズは [BCRYPT_MULTI_OBJECT_LENGTH_STRUCT](ns-bcrypt-bcrypt_multi_object_length_struct.md) 構造体の **cbPerObject** メンバと **cbPerElement** メンバから計算できる。値は次のとおり: `cbPerObject + (ハッシュ状態の数) * cbPerElement`。*pbHashObject* が `NULL` で *cbHashObject* が 0 の場合、オブジェクトバッファは自動的に確保される。
cbHashObject : [int] *ULONG* `[in]` *pbHashObject* バッファのサイズ。*pbHashObject* が `NULL` の場合は 0。
pbSecret : [var] *PUCHAR* `[in]` ハッシュまたは MAC に使用するキーを格納したバッファへのポインタ。*cbSecret* パラメータがこのバッファのサイズを示す。このキーは、[BCryptOpenAlgorithmProvider](nf-bcrypt-bcryptopenalgorithmprovider.md) 関数を **BCRYPT_ALG_HANDLE_HMAC** フラグを指定してオープンしたハッシュアルゴリズムにのみ適用される。それ以外の場合はこのパラメータを `NULL` に設定する。同じキーが配列のすべての要素に対して使用される。
cbSecret : [int] *ULONG* `[in]` *pbSecret* バッファのバイト単位のサイズ。キーを使用しない場合はこのパラメータを 0 に設定する。
dwFlags : [int] *ULONG* `[in]` 関数の動作を変更するフラグ。0 または以下の値を指定できる。マルチハッシュオブジェクトは常に再利用可能であり、常に **BCRYPT_HASH_REUSABLE_FLAG** が渡されたかのように振る舞う。このフラグは一貫性のためにここでもサポートされている。 | 値 | 意味 | |--------|--------| | **BCRYPT_HASH_REUSABLE_FLAG** | 再利用可能なハッシュオブジェクトを作成する。[BCryptFinishHash](nf-bcrypt-bcryptfinishhash.md) を呼び出した直後に新しいハッシュ操作で使用できる。詳細は [Creating a Hash with CNG](/windows/win32/SecCNG/creating-a-hash-with-cng) を参照。 |
%inst
BCryptCreateMultiHash 関数は、複数のハッシュ操作を並列に計算できるマルチハッシュ状態を作成する。

[戻り値]
関数の成否を示すステータスコードを返す。メソッドが成功した場合は `STATUS_SUCCESS` を返す。その他の
**NTSTATUS** 値については [NTSTATUS
Values](/openspecs/windows_protocols/ms-erref/596a1078-e883-4972-9bbc-49e60bebca55)
を参照。

[備考]
内部的には、ハッシュアルゴリズムと使用可能な CPU 機能に応じて、SIMD 命令を用いて最大 8
個までの並列ハッシュ計算が同時に行われる。性能を最大化するため、呼び出し元は並列処理可能な計算を最低でも 8
個用意することが推奨される。長さの異なる計算では、より多くの計算を並列に渡したほうが、CPU
レジスタへの計算スケジューリングがうまく行え、スループットの向上が見込める。最適なスループットを得るためには、8 ～ 100
個の計算を渡すことが推奨される。すべてのハッシュ計算が同じ長さである場合のみ、その範囲の下限を選ぶとよい。マルチハッシュは
HMAC-MD2、HMAC-MD4、GMAC ではサポートされない。


%index
BCryptDecrypt
データブロックを復号する。
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
BCryptDeleteContext
既存の CNG 構成コンテキストを削除する。
%prm
dwTable, pszContext
dwTable : [int] 
pszContext : [wstr] 削除するコンテキストの識別子を含む、null 終端 Unicode 文字列へのポインタ。
%inst
既存の CNG 構成コンテキストを削除する。

[戻り値]
関数の成否を示すステータスコードを返す。
返される可能性のあるコードには次のものが含まれるが、これらに限られない。
（以下省略）

[備考]
BCryptDeleteContext はユーザーモードでのみ呼び出すことができる。


%index
BCryptDestroySecret
BCryptSecretAgreement 関数によって作成された秘密合意ハンドルを破棄する。
%prm
hSecret
hSecret : [int] 破棄する BCRYPT_SECRET_HANDLE。
%inst
BCryptSecretAgreement 関数によって作成された秘密合意ハンドルを破棄する。

[戻り値]
関数の成否を示すステータスコードを返す。
返される可能性のあるコードには次のものが含まれるが、これらに限られない。
（以下省略）

[備考]
プロバイダがサポートするプロセッサモードに応じて、BCryptDestroySecret
はユーザーモードまたはカーネルモードのいずれからでも呼び出せる。カーネルモードの呼び出し元は PASSIVE_LEVEL IRQL または
DISPATCH_LEVEL IRQL のいずれかで実行できる。現在の IRQL レベルが DISPATCH_LEVEL
である場合、hSecret パラメータに渡すハンドルは BCRYPT_PROV_DISPATCH
フラグを指定してオープンされたプロバイダから返されたアルゴリズムハンドルから取得されたものでなければならない。この関数をカーネルモードで呼び出すには、Driver
Development Kit (DDK) に含まれる Cng.lib を使用する。Windows Server 2008 および
Windows Vista: この関数をカーネルモードで呼び出すには Ksecdd.lib を使用する。


%index
BCryptDeriveKey
秘密合意値からキーを導出する。 (BCryptDeriveKey)
%prm
hSharedSecret, pwszKDF, pParameterList, pbDerivedKey, cbDerivedKey, pcbResult, dwFlags
hSharedSecret : [int] キーを作成するための秘密合意ハンドル。このハンドルは BCryptSecretAgreement 関数から取得する。
pwszKDF : [wstr] キーを導出するために使用するキー導出関数 (KDF) を識別する、null 終端 Unicode 文字列へのポインタ。次の文字列のいずれかを指定できる。
pParameterList : [var] KDF パラメータを格納した BCryptBufferDesc 構造体のアドレス。このパラメータは省略可能で、不要な場合は NULL を指定できる。
pbDerivedKey : [var] キーを受け取るバッファのアドレス。cbDerivedKey パラメータがこのバッファのサイズを示す。このパラメータが NULL の場合、関数は必要なサイズをバイト単位で pcbResult が指す ULONG に格納する。
cbDerivedKey : [int] pbDerivedKey バッファのバイト単位のサイズ。
pcbResult : [var] pbDerivedKey バッファにコピーされたバイト数を受け取る ULONG へのポインタ。pbDerivedKey が NULL の場合、関数は必要なサイズをバイト単位で、このパラメータが指す ULONG に格納する。
dwFlags : [int] 関数の動作を変更するフラグの集合。0 または次の値を指定できる。
%inst
秘密合意値からキーを導出する。 (BCryptDeriveKey)

[戻り値]
関数の成否を示すステータスコードを返す。
返される可能性のあるコードには次のものが含まれるが、これらに限られない。
（以下省略）

[備考]
pParameterList パラメータの BCryptBufferDesc 構造体には、KDF_SECRET_PREPEND および
KDF_SECRET_APPEND パラメータを複数含めることができる。これらのパラメータが複数指定された場合、KDF
が呼び出される前に、配列内に格納された順序で値が連結される。たとえば、次のパラメータ値が指定されたと想定する。
（以下省略）


%index
BCryptDeriveKeyCapi
ハッシュ値からキーを導出する。
%prm
hHash, hTargetAlg, pbDerivedKey, cbDerivedKey, dwFlags
hHash : [int] ハッシュオブジェクトのハンドル。BCryptCreateHash 関数を呼び出して取得する。ハンドルの使用が終わったら、BCryptDestroyHash 関数を呼び出して解放しなければならない。
hTargetAlg : [int] アルゴリズムオブジェクトのハンドル。CryptDeriveKey 関数と互換性のある ALG_ID 値であってもよい。注: CAPI とキー拡張の制限により、512 ビットを超える出力を生成するハッシュアルゴリズムは使用できない。
pbDerivedKey : [var] 導出されたキーを受け取るバッファへのポインタ。
cbDerivedKey : [int] pbDerivedKey パラメータが指す導出キーの文字数によるサイズ。
dwFlags : [int] このパラメータは予約されており、0 を設定する必要がある。
%inst
ハッシュ値からキーを導出する。

[戻り値]
関数の成否を示すステータスコードを返す。
返される可能性のあるコードには次のものが含まれるが、これらに限られない。
（以下省略）

[備考]
この関数は、CAPI の CryptDeriveKey 関数の PK ソルト機能をサポートしない。


%index
BCryptDeriveKeyPBKDF2
RFC 2898 で定義されている PBKDF2 キー導出アルゴリズムを用いて、ハッシュ値からキーを導出する。
%prm
hPrf, pbPassword, cbPassword, pbSalt, cbSalt, cIterations, pbDerivedKey, cbDerivedKey, dwFlags
hPrf : [int] 疑似ランダム関数を提供するアルゴリズムプロバイダのハンドル。これはメッセージ認証コード計算を行うアルゴリズムプロバイダであるべきである。Microsoft 既定のアルゴリズムプロバイダを使用する場合、BCRYPT_ALG_HANDLE_HMAC_FLAG フラグを指定してオープンされた任意のハッシュアルゴリズムを使用できる。注: BCRYPT_IS_KEYED_HASH プロパティを実装しているアルゴリズムのみがこのパラメータに使用できる。
pbPassword : [var] PBKDF2 キー導出アルゴリズムのパスワードパラメータを格納するバッファへのポインタ。注: キー導出に使用される秘密情報はすべてこのバッファに渡す必要がある。
cbPassword : [int] pbPassword パラメータが指すバッファ内のデータのバイト単位の長さ。
pbSalt : [var] PBKDF2 キー導出アルゴリズムのソルト引数を格納するバッファへのポインタ。注: キー導出に使用される秘密ではない情報はすべてこのバッファに渡す必要がある。
cbSalt : [int] pbSalt パラメータが指すソルト引数のバイト単位の長さ。
cIterations : [int64] PBKDF2 キー導出アルゴリズムの反復回数。
pbDerivedKey : [var] 導出されたキーを受け取るバッファへのポインタ。
cbDerivedKey : [int] pbDerivedKey パラメータが指すバッファに返される、導出キーのバイト単位の長さ。
dwFlags : [int] このパラメータは予約されており、0 を設定する必要がある。
%inst
RFC 2898 で定義されている PBKDF2 キー導出アルゴリズムを用いて、ハッシュ値からキーを導出する。

[戻り値]
関数の成否を示すステータスコードを返す。
返される可能性のあるコードには次のものが含まれるが、これらに限られない。
（以下省略）


%index
BCryptDuplicateHash
既存のハッシュまたはメッセージ認証コード (MAC) オブジェクトを複製する。
%prm
hHash, phNewHash, pbHashObject, cbHashObject, dwFlags
hHash : [int] 複製するハッシュまたは MAC オブジェクトのハンドル。
phNewHash : [var] 複製されたハッシュまたは MAC オブジェクトを表すハンドルを受け取る BCRYPT_HASH_HANDLE 値へのポインタ。
pbHashObject : [var] 複製されたハッシュまたは MAC オブジェクトを受け取るバッファへのポインタ。cbHashObject パラメータがこのバッファのサイズを示す。必要なバッファサイズは、BCryptGetProperty 関数を呼び出して BCRYPT_OBJECT_LENGTH プロパティを取得することで得られる。これは指定したアルゴリズムにおけるハッシュオブジェクトのサイズを返す。複製ハッシュハンドルが解放された後、このメモリを解放する。
cbHashObject : [int] pbHashObject バッファのバイト単位のサイズ。
dwFlags : [int] 関数の動作を変更するフラグの集合。現在定義されているフラグはないため、このパラメータには 0 を指定する。
%inst
既存のハッシュまたはメッセージ認証コード (MAC) オブジェクトを複製する。

[戻り値]
関数の成否を示すステータスコードを返す。
返される可能性のあるコードには次のものが含まれるが、これらに限られない。
（以下省略）

[備考]
この関数は、共通データブロックに対するハッシュまたは MAC を計算する際に役立つ。共通データを処理した後、ハッシュまたは MAC
オブジェクトを複製し、その後個々のオブジェクトに固有のデータを追加できる。プロバイダがサポートするプロセッサモードに応じて、BCryptDuplicateHash
はユーザーモードまたはカーネルモードのいずれからでも呼び出せる。カーネルモードの呼び出し元は PASSIVE_LEVEL IRQL または
DISPATCH_LEVEL IRQL のいずれかで実行できる。現在の IRQL レベルが DISPATCH_LEVEL
である場合、hHash パラメータに渡すハンドルは BCRYPT_PROV_DISPATCH
フラグを指定してオープンされたプロバイダから返されたアルゴリズムハンドルから取得されたものでなければならず、BCryptDestroyKey
関数に渡すポインタはページング不可（あるいはロックされた）メモリを参照しなければならない。この関数をカーネルモードで呼び出すには、Driver
Development Kit (DDK) に含まれる Cng.lib を使用する。Windows Server 2008 および
Windows Vista: この関数をカーネルモードで呼び出すには Ksecdd.lib を使用する。


%index
BCryptDuplicateKey
対称キーの複製を作成する。
%prm
hKey, phNewKey, pbKeyObject, cbKeyObject, dwFlags
hKey : [int] 複製するキーのハンドル。これは対称キーへのハンドルでなければならない。
phNewKey : [var] 複製キーのハンドルを受け取る BCRYPT_KEY_HANDLE 変数へのポインタ。このハンドルは BCryptEncrypt のようにキーを必要とする後続の関数で使用される。このハンドルが不要になったら、BCryptDestroyKey 関数に渡して解放しなければならない。
pbKeyObject : [var] 複製されたキーオブジェクトを受け取るバッファへのポインタ。cbKeyObject パラメータがこのバッファのサイズを示す。必要なバッファサイズは、BCryptGetProperty 関数を呼び出して BCRYPT_OBJECT_LENGTH プロパティを取得することで得られる。これは指定したアルゴリズムにおけるキーオブジェクトのサイズを返す。このメモリは phNewKey キーハンドルが破棄された後にのみ解放できる。
cbKeyObject : [int] pbKeyObject バッファのバイト単位のサイズ。
dwFlags : [int] 関数の動作を変更するフラグの集合。現在定義されているフラグはないため、このパラメータには 0 を指定する。
%inst
対称キーの複製を作成する。

[戻り値]
関数の成否を示すステータスコードを返す。
返される可能性のあるコードには次のものが含まれるが、これらに限られない。
（以下省略）

[備考]
プロバイダがサポートするプロセッサモードに応じて、BCryptDuplicateKey
はユーザーモードまたはカーネルモードのいずれからでも呼び出せる。カーネルモードの呼び出し元は PASSIVE_LEVEL IRQL または
DISPATCH_LEVEL IRQL のいずれかで実行できる。現在の IRQL レベルが DISPATCH_LEVEL
である場合、hKey パラメータに渡すハンドルは BCRYPT_PROV_DISPATCH
フラグを指定してオープンされたプロバイダから返されたアルゴリズムハンドルから取得されたものでなければならず、BCryptDuplicateKey
関数に渡すポインタはページング不可（あるいはロックされた）メモリを参照しなければならない。この関数をカーネルモードで呼び出すには、Driver
Development Kit (DDK) に含まれる Cng.lib を使用する。Windows Server 2008 および
Windows Vista: この関数をカーネルモードで呼び出すには Ksecdd.lib を使用する。


%index
BCryptEncrypt
データブロックを暗号化する。(BCryptEncrypt)
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
BCryptEnumAlgorithms
登録済みのアルゴリズム識別子の一覧を取得する。
%prm
dwAlgOperations, pAlgCount, ppAlgList, dwFlags
dwAlgOperations : [int] 
pAlgCount : [var] ppAlgList 配列の要素数を受け取る ULONG 変数へのポインタ。
ppAlgList : [var] 登録済みアルゴリズム識別子の配列を受け取る BCRYPT_ALGORITHM_IDENTIFIER 構造体ポインタのアドレス。このポインタは不要になったら BCryptFreeBuffer 関数に渡さなければならない。
dwFlags : [int] 関数の動作を変更するフラグの集合。この関数で定義されているフラグはない。
%inst
登録済みのアルゴリズム識別子の一覧を取得する。

[戻り値]
関数の成否を示すステータスコードを返す。
返される可能性のあるコードには次のものが含まれるが、これらに限られない。
（以下省略）

[備考]
BCryptEnumAlgorithms はユーザーモードまたはカーネルモードのいずれからでも呼び出せる。カーネルモードの呼び出し元は
PASSIVE_LEVEL IRQL で実行されていなければならない。


%index
BCryptEnumContextFunctionProviders
指定された構成テーブル内のコンテキストに対する暗号関数のプロバイダを取得する。
%prm
dwTable, pszContext, dwInterface, pszFunction, pcbBuffer, ppBuffer
dwTable : [int] 
pszContext : [wstr] 関数プロバイダを列挙する対象コンテキストの識別子を含む、null 終端 Unicode 文字列へのポインタ。
dwInterface : [int] 
pszFunction : [wstr] プロバイダを列挙する対象関数の識別子を含む、null 終端 Unicode 文字列へのポインタ。
pcbBuffer : [var] ULONG 変数のアドレスで、入力時には ppBuffer が指すバッファのバイト単位のサイズを格納する。このサイズがコンテキスト識別子の集合を保持するのに十分でない場合、関数は STATUS_BUFFER_TOO_SMALL で失敗する。関数が戻った後、この値には ppBuffer バッファにコピーされたバイト数が格納される。
ppBuffer : [var] この関数によって取得されたコンテキスト関数プロバイダの集合を受け取る、CRYPT_CONTEXT_FUNCTION_PROVIDERS 構造体へのポインタのアドレス。pcbBuffer パラメータが指す値がこのバッファのサイズを示す。このパラメータが指す値が NULL の場合、関数は必要なメモリを確保する。このメモリは不要になったら、このポインタを BCryptFreeBuffer 関数に渡して解放しなければならない。このパラメータが NULL の場合、関数は必要なサイズをバイト単位で pcbBuffer パラメータが指す変数に格納し、STATUS_BUFFER_TOO_SMALL を返す。
%inst
指定された構成テーブル内のコンテキストに対する暗号関数のプロバイダを取得する。

[戻り値]
関数の成否を示すステータスコードを返す。
返される可能性のあるコードには次のものが含まれるが、これらに限られない。
（以下省略）

[備考]
BCryptEnumContextFunctionProviders はユーザーモードでのみ呼び出すことができる。


%index
BCryptEnumContextFunctions
指定された構成テーブル内のコンテキストに対する暗号関数を取得する。
%prm
dwTable, pszContext, dwInterface, pcbBuffer, ppBuffer
dwTable : [int] 
pszContext : [wstr] 関数を列挙する対象コンテキストの識別子を含む、null 終端 Unicode 文字列へのポインタ。
dwInterface : [int] 
pcbBuffer : [var] ULONG 変数のアドレスで、入力時には ppBuffer が指すバッファのバイト単位のサイズを格納する。このサイズがコンテキスト識別子の集合を保持するのに十分でない場合、関数は STATUS_BUFFER_TOO_SMALL で失敗する。関数が戻った後、この値には ppBuffer バッファにコピーされたバイト数が格納される。
ppBuffer : [var] この関数によって取得されたコンテキスト関数の集合を受け取る、CRYPT_CONTEXT_FUNCTIONS 構造体へのポインタのアドレス。pcbBuffer パラメータが指す値がこのバッファのサイズを示す。このパラメータが指す値が NULL の場合、関数は必要なメモリを確保する。このメモリは不要になったら、このポインタを BCryptFreeBuffer 関数に渡して解放しなければならない。このパラメータが NULL の場合、関数は必要なサイズをバイト単位で pcbBuffer パラメータが指す変数に格納し、STATUS_BUFFER_TOO_SMALL を返す。
%inst
指定された構成テーブル内のコンテキストに対する暗号関数を取得する。

[戻り値]
関数の成否を示すステータスコードを返す。
返される可能性のあるコードには次のものが含まれるが、これらに限られない。
（以下省略）

[備考]
BCryptEnumContextFunctions はユーザーモードでのみ呼び出すことができる。


%index
BCryptEnumContexts
指定された構成テーブル内のコンテキストの識別子を取得する。
%prm
dwTable, pcbBuffer, ppBuffer
dwTable : [int] 
pcbBuffer : [var] ULONG 変数のアドレスで、入力時には ppBuffer が指すバッファのバイト単位のサイズを格納する。このサイズがコンテキスト識別子の集合を保持するのに十分でない場合、関数は STATUS_BUFFER_TOO_SMALL で失敗する。関数が戻った後、この値には ppBuffer バッファにコピーされたバイト数が格納される。
ppBuffer : [var] この関数によって取得されたコンテキストの集合を受け取る、CRYPT_CONTEXTS 構造体へのポインタのアドレス。pcbBuffer パラメータが指す値がこのバッファのサイズを示す。このパラメータが指す値が NULL の場合、関数は必要なメモリを確保する。このメモリは不要になったら、このポインタを BCryptFreeBuffer 関数に渡して解放しなければならない。このパラメータが NULL の場合、関数は必要なサイズをバイト単位で pcbBuffer パラメータが指す変数に格納し、STATUS_BUFFER_TOO_SMALL を返す。
%inst
指定された構成テーブル内のコンテキストの識別子を取得する。

[戻り値]
関数の成否を示すステータスコードを返す。
返される可能性のあるコードには次のものが含まれるが、これらに限られない。
（以下省略）

[備考]
BCryptEnumContexts はユーザーモードでのみ呼び出すことができる。


%index
BCryptEnumProviders
指定したアルゴリズムをサポートするすべての CNG プロバイダを取得する。
%prm
pszAlgId, pImplCount, ppImplList, dwFlags
pszAlgId : [wstr] プロバイダを取得する対象のアルゴリズムを識別する、null 終端 Unicode 文字列へのポインタ。事前定義された CNG アルゴリズム識別子のいずれか、または別のアルゴリズム識別子を指定できる。
pImplCount : [var] ppImplList 配列の要素数を受け取る ULONG 変数へのポインタ。
ppImplList : [var] 指定したアルゴリズムをサポートするプロバイダの集合を受け取る BCRYPT_PROVIDER_NAME 構造体配列のアドレス。pImplCount パラメータがこの配列の要素数を受け取る。このメモリは不要になったら、このポインタを BCryptFreeBuffer 関数に渡して解放しなければならない。
dwFlags : [int] 関数の動作を変更するフラグの集合。現在定義されているフラグはないため、このパラメータは 0 でなければならない。
%inst
指定したアルゴリズムをサポートするすべての CNG プロバイダを取得する。

[戻り値]
関数の成否を示すステータスコードを返す。
返される可能性のあるコードには次のものが含まれるが、これらに限られない。
（以下省略）

[備考]
BCryptEnumProviders はユーザーモードまたはカーネルモードのいずれからでも呼び出せる。カーネルモードの呼び出し元は
PASSIVE_LEVEL IRQL で実行されていなければならない。


%index
BCryptEnumRegisteredProviders
登録済みプロバイダに関する情報を取得する。
%prm
pcbBuffer, ppBuffer
pcbBuffer : [var] ULONG 値へのポインタで、入力時には ppBuffer パラメータが指すバッファのバイト単位のサイズを格納する。出力時には、バッファにコピーされたバイト数、またはバッファに必要なサイズ（バイト単位）を受け取る。注: これはバッファ全体のバイト単位の合計サイズであり、CRYPT_PROVIDERS 構造体だけのサイズではない。バッファは CRYPT_PROVIDERS 構造体に加え、プロバイダに関するその他のデータも保持できなければならない。
ppBuffer : [var] 登録済みプロバイダの集合を記述する CRYPT_PROVIDERS 構造体およびその他データを受け取るバッファポインタへのポインタ。このパラメータが NULL の場合、関数は STATUS_BUFFER_TOO_SMALL を返し、pcbBuffer パラメータが指す値に必要なサイズ（バイト単位）を格納する。このパラメータが NULL ポインタのアドレスである場合、関数は必要なメモリを確保し、プロバイダ情報で埋め、そのメモリへのポインタをこのパラメータに格納する。このメモリの使用が終わったら、このポインタを BCryptFreeBuffer 関数に渡して解放する。このパラメータが非 NULL ポインタのアドレスである場合、関数はプロバイダ情報をそのバッファにコピーする。pcbBuffer パラメータにはバッファ全体のバイト単位のサイズを格納しておく必要がある。バッファがすべてのプロバイダ情報を保持するのに十分でない場合、関数は STATUS_BUFFER_TOO_SMALL を返す。
%inst
登録済みプロバイダに関する情報を取得する。

[戻り値]
関数の成否を示すステータスコードを返す。
返される可能性のあるコードには次のものが含まれるが、これらに限られない。
（以下省略）

[備考]
BCryptEnumRegisteredProviders 関数は次の 2 つの方法のいずれかで呼び出すことができる。
（以下省略）


%index
BCryptExportKey
後で使用するために永続化できるメモリ BLOB へキーをエクスポートする。
%prm
hKey, hExportKey, pszBlobType, pbOutput, cbOutput, pcbResult, dwFlags
hKey : [int] エクスポートするキーのハンドル。
hExportKey : [int] エクスポートするキーをラップするためのキーのハンドル。BCRYPT_AES_WRAP_KEY_BLOB 型の BLOB をエクスポートする場合に使用し、それ以外は NULL に設定する。注: hExportKey ハンドルは hKey ハンドルを供給したのと同じプロバイダから供給され、AES キーラップアルゴリズムで使用可能な対称キーへのハンドルでなければならない。hKey ハンドルが Microsoft プロバイダのものである場合、hExportKey は AES キーハンドルでなければならない。
pszBlobType : [wstr] 
pbOutput : [var] キー BLOB を受け取るバッファのアドレス。cbOutput パラメータがこのバッファのサイズを示す。このパラメータが NULL の場合、関数は必要なサイズをバイト単位で pcbResult が指す ULONG に格納する。
cbOutput : [int] pbOutput バッファのバイト単位のサイズを格納する。
pcbResult : [var] pbOutput バッファにコピーされたバイト数を受け取る ULONG へのポインタ。pbOutput パラメータが NULL の場合、関数は必要なサイズをバイト単位で、このパラメータが指す ULONG に格納する。
dwFlags : [int] 関数の動作を変更するフラグの集合。この関数で定義されているフラグはない。
%inst
後で使用するために永続化できるメモリ BLOB へキーをエクスポートする。

[戻り値]
関数の成否を示すステータスコードを返す。
返される可能性のあるコードには次のものが含まれるが、これらに限られない。
（以下省略）

[備考]
プロバイダがサポートするプロセッサモードに応じて、BCryptExportKey
はユーザーモードまたはカーネルモードのいずれからでも呼び出せる。カーネルモードの呼び出し元は PASSIVE_LEVEL IRQL または
DISPATCH_LEVEL IRQL のいずれかで実行できる。現在の IRQL レベルが DISPATCH_LEVEL
である場合、hKey パラメータに渡すハンドルは BCRYPT_PROV_DISPATCH
フラグを指定してオープンされたプロバイダから返されたアルゴリズムハンドルから取得されたものでなければならず、BCryptExportKey
関数に渡すポインタはページング不可（あるいはロックされた）メモリを参照しなければならない。この関数をカーネルモードで呼び出すには、Driver
Development Kit (DDK) に含まれる Cng.lib を使用する。Windows Server 2008 および
Windows Vista: この関数をカーネルモードで呼び出すには Ksecdd.lib を使用する。


%index
BCryptFinalizeKeyPair
公開鍵/秘密鍵ペアを完成させる。
%prm
hKey, dwFlags
hKey : [int] 完了させるキーのハンドル。BCryptGenerateKeyPair 関数を呼び出して取得する。
dwFlags : [int] 関数の動作を変更するフラグの集合。現在定義されているフラグはないため、このパラメータには 0 を指定する。
%inst
公開鍵/秘密鍵ペアを完成させる。

[戻り値]
関数の成否を示すステータスコードを返す。
返される可能性のあるコードには次のものが含まれるが、これらに限られない。
（以下省略）

[備考]
プロバイダがサポートするプロセッサモードに応じて、BCryptFinalizeKeyPair
はユーザーモードまたはカーネルモードのいずれからでも呼び出せる。カーネルモードの呼び出し元は PASSIVE_LEVEL IRQL または
DISPATCH_LEVEL IRQL のいずれかで実行できる。現在の IRQL レベルが DISPATCH_LEVEL
である場合、hKey パラメータに渡すハンドルは BCRYPT_PROV_DISPATCH
フラグを指定してオープンされたプロバイダから返されたアルゴリズムハンドルから取得されたものでなければならない。この関数をカーネルモードで呼び出すには、Driver
Development Kit (DDK) に含まれる Cng.lib を使用する。Windows Server 2008 および
Windows Vista: この関数をカーネルモードで呼び出すには Ksecdd.lib を使用する。


%index
BCryptFinishHash
BCryptHashData の呼び出しで蓄積されたデータに対するハッシュまたは MAC 値を取得する。
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
BCryptFreeBuffer
CNG 関数のいずれかによって確保されたメモリを解放するために使用される。
%prm
pvBuffer
pvBuffer : [intptr] 解放するメモリバッファへのポインタ。
%inst
CNG 関数のいずれかによって確保されたメモリを解放するために使用される。

[備考]
BCryptFreeBuffer は、バッファを確保した BCrypt API
関数と同じプロセッサモードで呼び出さなければならない。さらに、バッファが PASSIVE_LEVEL IRQL で確保された場合は、その
IRQL で解放しなければならない。バッファが DISPATCH_LEVEL IRQL で確保された場合、DISPATCH_LEVEL
IRQL または PASSIVE_LEVEL IRQL のいずれかで解放できる。この関数をカーネルモードで呼び出すには、Driver
Development Kit (DDK) に含まれる Cng.lib を使用する。Windows Server 2008 および
Windows Vista: この関数をカーネルモードで呼び出すには Ksecdd.lib を使用する。


%index
BCryptGenRandom
乱数を生成する。
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
BCryptGenerateKeyPair
空の公開鍵/秘密鍵ペアを作成する。
%prm
hAlgorithm, phKey, dwLength, dwFlags
hAlgorithm : [int] 署名、非対称暗号、またはキー合意をサポートするアルゴリズムプロバイダのハンドル。このハンドルは BCryptOpenAlgorithmProvider 関数を使用して作成されたものでなければならない。
phKey : [var] キーのハンドルを受け取る BCRYPT_KEY_HANDLE へのポインタ。このハンドルは BCryptEncrypt のようにキーを必要とする後続の関数で使用される。このハンドルが不要になったら、BCryptDestroyKey 関数に渡して解放しなければならない。
dwLength : [int] キーのビット単位の長さ。アルゴリズムプロバイダは、標準的な非対称アルゴリズムごとに異なるキーサイズ制限を持つ。
dwFlags : [int] 関数の動作を変更するフラグの集合。現在定義されているフラグはないため、このパラメータには 0 を指定する。
%inst
空の公開鍵/秘密鍵ペアを作成する。

[戻り値]
関数の成否を示すステータスコードを返す。
返される可能性のあるコードには次のものが含まれるが、これらに限られない。
（以下省略）

[備考]
プロバイダがサポートするプロセッサモードに応じて、BCryptGenerateKeyPair
はユーザーモードまたはカーネルモードのいずれからでも呼び出せる。カーネルモードの呼び出し元は PASSIVE_LEVEL IRQL または
DISPATCH_LEVEL IRQL のいずれかで実行できる。現在の IRQL レベルが DISPATCH_LEVEL
である場合、hAlgorithm パラメータに渡すハンドルは BCRYPT_PROV_DISPATCH
フラグを指定してオープンされたものでなければならず、BCryptGenerateKeyPair
関数に渡すポインタはページング不可（あるいはロックされた）メモリを参照しなければならない。この関数をカーネルモードで呼び出すには、Driver
Development Kit (DDK) に含まれる Cng.lib を使用する。Windows Server 2008 および
Windows Vista: この関数をカーネルモードで呼び出すには Ksecdd.lib を使用する。


%index
BCryptGenerateSymmetricKey
指定されたキーから対称キー暗号化アルゴリズムで使用するキーオブジェクトを作成する。
%prm
hAlgorithm, phKey, pbKeyObject, cbKeyObject, pbSecret, cbSecret, dwFlags
hAlgorithm : [int] BCryptOpenAlgorithmProvider 関数で作成されたアルゴリズムプロバイダのハンドル。プロバイダ作成時に指定されたアルゴリズムは対称キー暗号化をサポートしていなければならない。
phKey : [var] キーのハンドルを受け取る BCRYPT_KEY_HANDLE へのポインタ。このハンドルは BCryptEncrypt のようにキーを必要とする後続の関数で使用される。このハンドルが不要になったら、BCryptDestroyKey 関数に渡して解放しなければならない。
pbKeyObject : [var] キーオブジェクトを受け取るバッファへのポインタ。cbKeyObject パラメータがこのバッファのサイズを示す。必要なバッファサイズは、BCryptGetProperty 関数を呼び出して BCRYPT_OBJECT_LENGTH プロパティを取得することで得られる。これは指定したアルゴリズムにおけるキーオブジェクトのサイズを返す。このメモリは phKey キーハンドルが破棄された後にのみ解放できる。このパラメータの値が NULL で cbKeyObject パラメータの値が 0 の場合、キーオブジェクトのメモリはこの関数によって確保および解放される。Windows 7: このメモリ管理機能は Windows 7 以降で使用可能。
cbKeyObject : [int] pbKeyObject バッファのバイト単位のサイズ。このパラメータの値が 0 で pbKeyObject パラメータの値が NULL の場合、キーオブジェクトのメモリはこの関数によって確保および解放される。Windows 7: このメモリ管理機能は Windows 7 以降で使用可能。
pbSecret : [var] キーオブジェクトを作成する元となるキーを格納するバッファへのポインタ。cbSecret パラメータがこのバッファのサイズを示す。これは通常、パスワードのハッシュ、あるいは他の再現可能なデータである。渡されたデータが対象キーサイズを超える場合、データは切り詰められ、超過部分は無視される。注: アプリケーションは対象キーで必要な正確なバイト数を渡すことを強く推奨する。
cbSecret : [int] pbSecret バッファのバイト単位のサイズ。
dwFlags : [int] 関数の動作を変更するフラグの集合。現在定義されているフラグはないため、このパラメータには 0 を指定する。
%inst
指定されたキーから対称キー暗号化アルゴリズムで使用するキーオブジェクトを作成する。

[戻り値]
関数の成否を示すステータスコードを返す。
返される可能性のあるコードには次のものが含まれるが、これらに限られない。
（以下省略）

[備考]
プロバイダがサポートするプロセッサモードに応じて、BCryptGenerateSymmetricKey
はユーザーモードまたはカーネルモードのいずれからでも呼び出せる。カーネルモードの呼び出し元は PASSIVE_LEVEL IRQL または
DISPATCH_LEVEL IRQL のいずれかで実行できる。現在の IRQL レベルが DISPATCH_LEVEL
である場合、hAlgorithm パラメータに渡すハンドルは BCRYPT_PROV_DISPATCH
フラグを指定してオープンされたものでなければならず、BCryptGenerateSymmetricKey
関数に渡すポインタはページング不可（あるいはロックされた）メモリを参照しなければならない。この関数をカーネルモードで呼び出すには、Driver
Development Kit (DDK) に含まれる Cng.lib を使用する。Windows Server 2008 および
Windows Vista: この関数をカーネルモードで呼び出すには Ksecdd.lib を使用する。


%index
BCryptGetFipsAlgorithmMode
Federal Information Processing Standard (FIPS) 準拠が有効になっているかを判定する。
%prm
pfEnabled
pfEnabled : [var] FIPS 準拠が無効である場合は 0、有効である場合は非 0 値を受け取る BOOLEAN 変数のアドレス。
%inst
Federal Information Processing Standard (FIPS) 準拠が有効になっているかを判定する。

[戻り値]
関数の成否を示すステータスコードを返す。
返される可能性のあるコードには次のものが含まれるが、これらに限られない。
（以下省略）

[備考]
BCryptGetFipsAlgorithmMode
はユーザーモードまたはカーネルモードのいずれからでも呼び出せる。カーネルモードの呼び出し元は PASSIVE_LEVEL IRQL
で実行されていなければならない。


%index
BCryptGetProperty
CNG オブジェクトの名前付きプロパティの値を取得する。
%prm
hObject, pszProperty, pbOutput, cbOutput, pcbResult, dwFlags
hObject : [int] プロパティ値を取得する対象 CNG オブジェクトを表すハンドル。
pszProperty : [wstr] 取得するプロパティの名前を含む、null 終端 Unicode 文字列へのポインタ。事前定義された Cryptography Primitive Property 識別子のいずれか、またはカスタムプロパティ識別子を指定できる。
pbOutput : [var] プロパティ値を受け取るバッファのアドレス。cbOutput パラメータがこのバッファのサイズを示す。
cbOutput : [int] pbOutput バッファのバイト単位のサイズ。
pcbResult : [var] pbOutput バッファにコピーされたバイト数を受け取る ULONG 変数へのポインタ。pbOutput パラメータが NULL の場合、関数は必要なサイズをバイト単位で、このパラメータが指す位置に格納する。
dwFlags : [int] 関数の動作を変更するフラグの集合。この関数で定義されているフラグはない。
%inst
CNG オブジェクトの名前付きプロパティの値を取得する。

[戻り値]
関数の成否を示すステータスコードを返す。
返される可能性のあるコードには次のものが含まれるが、これらに限られない。
（以下省略）

[備考]
プロパティに必要なサイズを取得するには、pbOutput パラメータに NULL を渡す。関数は必要なサイズをバイト単位で
pcbResult パラメータが指す値に格納する。プロバイダがサポートするプロセッサモードに応じて、BCryptGetProperty
はユーザーモードまたはカーネルモードのいずれからでも呼び出せる。カーネルモードの呼び出し元は PASSIVE_LEVEL IRQL または
DISPATCH_LEVEL IRQL のいずれかで実行できる。現在の IRQL レベルが DISPATCH_LEVEL
である場合、BCryptGetProperty
関数に渡すポインタはページング不可（あるいはロックされた）メモリを参照しなければならない。hObject
パラメータに指定したオブジェクトがハンドルである場合、それは BCRYPT_PROV_DISPATCH
フラグを指定してオープンされたものでなければならない。この関数をカーネルモードで呼び出すには、Driver Development Kit
(DDK) に含まれる Cng.lib を使用する。Windows Server 2008 および Windows Vista:
この関数をカーネルモードで呼び出すには Ksecdd.lib を使用する。


%index
BCryptHash
単一のハッシュ計算を行う。これは BCryptCreateHash、BCryptHashData、BCryptFinishHash、BCryptDestroyHash の呼び出しをラップする便利関数である。
%prm
hAlgorithm, pbSecret, cbSecret, pbInput, cbInput, pbOutput, cbOutput
hAlgorithm : [int] BCryptOpenAlgorithmProvider 関数を使用して作成されたアルゴリズムプロバイダのハンドル。プロバイダ作成時に指定されたアルゴリズムはハッシュインターフェイスをサポートしていなければならない。
pbSecret : [var] ハッシュまたは MAC に使用するキーを格納するバッファへのポインタ。cbSecret パラメータがこのバッファのサイズを示す。このキーは、BCryptOpenAlgorithmProvider 関数を BCRYPT_ALG_HANDLE_HMAC フラグを指定してオープンしたハッシュアルゴリズムにのみ適用される。それ以外の場合はこのパラメータを NULL に設定する。
cbSecret : [int] pbSecret バッファのバイト単位のサイズ。キーを使用しない場合はこのパラメータを 0 に設定する。
pbInput : [var] 処理対象のデータを格納するバッファへのポインタ。cbInput パラメータがこのバッファ内のバイト数を示す。この関数はこのバッファの内容を変更しない。
cbInput : [int] pbInput バッファ内のバイト数。
pbOutput : [var] ハッシュまたは MAC 値を受け取るバッファへのポインタ。cbOutput パラメータがこのバッファのサイズを示す。
cbOutput : [int] pbOutput バッファのバイト単位のサイズ。このサイズはハッシュまたは MAC 値のサイズと正確に一致しなければならない。サイズは BCryptGetProperty 関数を呼び出して BCRYPT_HASH_LENGTH プロパティを取得することで得られる。これは指定したアルゴリズムにおけるハッシュまたは MAC 値のサイズを返す。
%inst
単一のハッシュ計算を行う。これは
BCryptCreateHash、BCryptHashData、BCryptFinishHash、BCryptDestroyHash
の呼び出しをラップする便利関数である。

[戻り値]
成否を示すステータスコード。


%index
BCryptHashData
データバッファに対して一方向ハッシュまたはメッセージ認証コード (MAC) を計算する。
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
BCryptImportKey
キー BLOB から対称キーをインポートする。
%prm
hAlgorithm, hImportKey, pszBlobType, phKey, pbKeyObject, cbKeyObject, pbInput, cbInput, dwFlags
hAlgorithm : [int] キーをインポートするアルゴリズムプロバイダのハンドル。BCryptOpenAlgorithmProvider 関数を呼び出して取得する。
hImportKey : [int] pbInput パラメータのキー BLOB をアンラップするのに必要なキー暗号化キーのハンドル。注: ハンドルはインポートされるキーを供給したプロバイダと同じプロバイダから供給されなければならない。
pszBlobType : [wstr] 
phKey : [var] インポートされたキーのハンドルを受け取る BCRYPT_KEY_HANDLE へのポインタ。このハンドルは BCryptEncrypt のようにキーを必要とする後続の関数で使用される。このハンドルが不要になったら、BCryptDestroyKey 関数に渡して解放しなければならない。
pbKeyObject : [var] インポートされたキーオブジェクトを受け取るバッファへのポインタ。cbKeyObject パラメータがこのバッファのサイズを示す。必要なバッファサイズは、BCryptGetProperty 関数を呼び出して BCRYPT_OBJECT_LENGTH プロパティを取得することで得られる。これは指定したアルゴリズムにおけるキーオブジェクトのサイズを返す。このメモリは phKey キーハンドルが破棄された後にのみ解放できる。
cbKeyObject : [int] pbKeyObject バッファのバイト単位のサイズ。
pbInput : [var] インポートするキー BLOB を格納したバッファのアドレス。cbInput パラメータがこのバッファのサイズを示す。pszBlobType パラメータがこのバッファに含まれるキー BLOB の種類を指定する。
cbInput : [int] pbInput バッファのバイト単位のサイズ。
dwFlags : [int] 関数の動作を変更するフラグの集合。現在定義されているフラグはないため、このパラメータには 0 を指定する。
%inst
キー BLOB から対称キーをインポートする。

[戻り値]
関数の成否を示すステータスコードを返す。
返される可能性のあるコードには次のものが含まれるが、これらに限られない。
（以下省略）

[備考]
プロバイダがサポートするプロセッサモードに応じて、BCryptImportKey
はユーザーモードまたはカーネルモードのいずれからでも呼び出せる。カーネルモードの呼び出し元は PASSIVE_LEVEL IRQL または
DISPATCH_LEVEL IRQL のいずれかで実行できる。現在の IRQL レベルが DISPATCH_LEVEL
である場合、hAlgorithm パラメータに渡すハンドルは BCRYPT_PROV_DISPATCH
フラグを指定してオープンされたものでなければならず、BCryptImportKey
関数に渡すポインタはページング不可（あるいはロックされた）メモリを参照しなければならない。この関数をカーネルモードで呼び出すには、Driver
Development Kit (DDK) に含まれる Cng.lib を使用する。Windows Server 2008 および
Windows Vista: この関数をカーネルモードで呼び出すには Ksecdd.lib を使用する。


%index
BCryptImportKeyPair
キー BLOB から公開鍵/秘密鍵ペアをインポートする。
%prm
hAlgorithm, hImportKey, pszBlobType, phKey, pbInput, cbInput, dwFlags
hAlgorithm : [int] キーをインポートするアルゴリズムプロバイダのハンドル。BCryptOpenAlgorithmProvider 関数を呼び出して取得する。
hImportKey : [int] このパラメータは現在使用されておらず、NULL でなければならない。
pszBlobType : [wstr] 
phKey : [var] インポートされたキーのハンドルを受け取る BCRYPT_KEY_HANDLE へのポインタ。このハンドルは BCryptSignHash のようにキーを必要とする後続の関数で使用される。このハンドルが不要になったら、BCryptDestroyKey 関数に渡して解放しなければならない。
pbInput : [var] インポートするキー BLOB を格納したバッファのアドレス。cbInput パラメータがこのバッファのサイズを示す。pszBlobType パラメータがこのバッファに含まれるキー BLOB の種類を指定する。
cbInput : [int] pbInput バッファのバイト単位のサイズ。
dwFlags : [int] 関数の動作を変更するフラグの集合。0 または次の値を指定できる。
%inst
キー BLOB から公開鍵/秘密鍵ペアをインポートする。

[戻り値]
関数の成否を示すステータスコードを返す。
返される可能性のあるコードには次のものが含まれるが、これらに限られない。
（以下省略）

[備考]
プロバイダがサポートするプロセッサモードに応じて、BCryptImportKeyPair
はユーザーモードまたはカーネルモードのいずれからでも呼び出せる。カーネルモードの呼び出し元は PASSIVE_LEVEL IRQL または
DISPATCH_LEVEL IRQL のいずれかで実行できる。現在の IRQL レベルが DISPATCH_LEVEL
である場合、hAlgorithm パラメータに渡すハンドルは BCRYPT_PROV_DISPATCH
フラグを指定してオープンされたものでなければならず、BCryptImportKeyPair
関数に渡すポインタはページング不可（あるいはロックされた）メモリを参照しなければならない。この関数をカーネルモードで呼び出すには、Driver
Development Kit (DDK) に含まれる Cng.lib を使用する。Windows Server 2008 および
Windows Vista: この関数をカーネルモードで呼び出すには Ksecdd.lib を使用する。


%index
BCryptKeyDerivation
秘密合意を必要とせずにキーを導出する。
%prm
hKey, pParameterList, pbDerivedKey, cbDerivedKey, pcbResult, dwFlags
hKey : [int] 入力キーのハンドル。
pParameterList : [var] KDF パラメータを格納した BCryptBufferDesc 構造体へのポインタ。このパラメータは省略可能で、不要な場合は NULL を指定できる。パラメータはキー導出関数 (KDF) 固有のものでも汎用のものでもよい。次の表は、Microsoft Primitive プロバイダによって実装される特定の KDF に対する必須およびオプションのパラメータを示している。
pbDerivedKey : [var] キーを受け取るバッファのアドレス。cbDerivedKey パラメータがこのバッファのサイズを示す。
cbDerivedKey : [int] pbDerivedKey パラメータが指すバッファのバイト単位のサイズ。
pcbResult : [var] pbDerivedKey パラメータが指すバッファにコピーされたバイト数を受け取る変数へのポインタ。
dwFlags : [int] 関数の動作を変更するフラグ。Microsoft Primitive プロバイダで次の値を使用できる。
%inst
秘密合意を必要とせずにキーを導出する。

[戻り値]
関数の成否を示すステータスコードを返す。

[備考]
BCryptKeyDerivation を呼び出す前に、BCryptOpenAlgorithmProvider
関数で次のアルゴリズム識別子を使用できる。
（以下省略）


%index
BCryptOpenAlgorithmProvider
CNG プロバイダをロードし初期化する。
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


%index
BCryptProcessMultiOperations
BCryptProcessMultiOperations 関数は、マルチオブジェクト状態に対して一連の操作を実行する。
%prm
hObject, operationType, pOperations, cbOperations, dwFlags
hObject : [int] *BCRYPT_HANDLE* `[in, out]` [BCryptCreateMultiHash](nf-bcrypt-bcryptcreatemultihash.md) 関数で作成されたものなど、マルチオブジェクト状態のハンドル。
operationType : [int] *BCRYPT_MULTI_OPERATION_TYPE* `[in]` **BCRYPT_OPERATION_TYPE_**\* 値のいずれか。現在定義されているのは **BCRYPT_OPERATION_TYPE_HASH** のみである。この値は、*hObject* パラメータがマルチハッシュオブジェクトであり、*pOperations* ポインタが [BCRYPT_MULTI_HASH_OPERATION](ns-bcrypt-bcrypt_multi_hash_operation.md) 要素の配列を指していることを示す。
pOperations : [intptr] *PVOID* `[in]` 操作コマンド構造体の配列へのポインタ。ハッシュ処理の場合は [BCRYPT_MULTI_HASH_OPERATION](ns-bcrypt-bcrypt_multi_hash_operation.md) 構造体の配列へのポインタとなる。
cbOperations : [int] *ULONG* `[in]` *pOperations* 配列のバイト単位のサイズ。
dwFlags : [int] *ULONG* `[in]` 0 を指定する。
%inst
BCryptProcessMultiOperations 関数は、マルチオブジェクト状態に対して一連の操作を実行する。

[戻り値]
関数の成否を示すステータスコードを返す。メソッドが成功した場合は `STATUS_SUCCESS` を返す。その他の
**NTSTATUS** 値については [NTSTATUS
Values](/openspecs/windows_protocols/ms-erref/596a1078-e883-4972-9bbc-49e60bebca55)
を参照。

[備考]
*pOperations*
配列の各要素は、マルチオブジェクト状態の単一要素に対して実行する特定の計算の指示を含む。**BCryptProcessMultiOperations**
の機能的振る舞いは、マルチオブジェクト状態の各要素に対して、その要素用に操作配列で指定された計算を順に 1
つずつ実行するのと等価である。配列の異なる要素に作用する 2
つの操作の相対順序は保証されない。出力バッファが入力または出力バッファと重なる場合、結果は決定的ではない。


%index
BCryptQueryContextConfiguration
指定された CNG コンテキストの現在の構成を取得する。
%prm
dwTable, pszContext, pcbBuffer, ppBuffer
dwTable : [int] 
pszContext : [wstr] 構成情報を取得する対象コンテキストの識別子を含む、null 終端 Unicode 文字列へのポインタ。
pcbBuffer : [var] ULONG 変数のアドレスで、入力時には ppBuffer が指すバッファのバイト単位のサイズを格納する。このサイズがコンテキスト情報を保持するのに十分でない場合、関数は STATUS_BUFFER_TOO_SMALL で失敗する。関数が戻った後、この変数には ppBuffer バッファにコピーされたバイト数が格納される。
ppBuffer : [var] この関数によって取得されたコンテキスト構成情報を受け取る、CRYPT_CONTEXT_CONFIG 構造体へのポインタのアドレス。pcbBuffer パラメータが指す値がこのバッファのサイズを示す。このパラメータが指す値が NULL の場合、関数は必要なメモリを確保する。このメモリは不要になったら、このポインタを BCryptFreeBuffer 関数に渡して解放しなければならない。このパラメータが NULL の場合、関数は必要なサイズをバイト単位で pcbBuffer パラメータが指す変数に格納し、STATUS_BUFFER_TOO_SMALL を返す。このパラメータの使い方の詳細は「備考」を参照。
%inst
指定された CNG コンテキストの現在の構成を取得する。

[戻り値]
関数の成否を示すステータスコードを返す。
返される可能性のあるコードには次のものが含まれるが、これらに限られない。
（以下省略）

[備考]
各コンテキストは構成情報の集合を 1 つしか持たないため、ppBuffer パラメータは配列のように見えるが、この関数は要素数 1
の配列として扱う。次の例はこのパラメータの使い方を明確にする助けになる。
（以下省略）


%index
BCryptQueryContextFunctionConfiguration
既存の CNG コンテキストの暗号関数構成情報を取得する。
%prm
dwTable, pszContext, dwInterface, pszFunction, pcbBuffer, ppBuffer
dwTable : [int] 
pszContext : [wstr] 関数構成情報を取得する対象コンテキストの識別子を含む、null 終端 Unicode 文字列へのポインタ。
dwInterface : [int] 
pszFunction : [wstr] 構成情報を取得する対象暗号関数の識別子を含む、null 終端 Unicode 文字列へのポインタ。
pcbBuffer : [var] ULONG 変数のアドレスで、入力時には ppBuffer が指すバッファのバイト単位のサイズを格納する。このサイズがコンテキスト情報を保持するのに十分でない場合、関数は STATUS_BUFFER_TOO_SMALL で失敗する。関数が戻った後、この変数には ppBuffer バッファにコピーされたバイト数が格納される。
ppBuffer : [var] この関数によって取得された関数構成情報を受け取る、CRYPT_CONTEXT_FUNCTION_CONFIG 構造体へのポインタのアドレス。pcbBuffer パラメータが指す値がこのバッファのサイズを示す。このパラメータが指す値が NULL の場合、関数は必要なメモリを確保する。このメモリは不要になったら、このポインタを BCryptFreeBuffer 関数に渡して解放しなければならない。このパラメータが NULL の場合、関数は必要なサイズをバイト単位で pcbBuffer パラメータが指す変数に格納し、STATUS_BUFFER_TOO_SMALL を返す。このパラメータの使い方の詳細は「備考」を参照。
%inst
既存の CNG コンテキストの暗号関数構成情報を取得する。

[戻り値]
関数の成否を示すステータスコードを返す。
返される可能性のあるコードには次のものが含まれるが、これらに限られない。
（以下省略）

[備考]
各暗号関数は構成情報の集合を 1 つしか持たないため、ppBuffer パラメータは配列のように見えるが、この関数は要素数 1
の配列として扱う。次の例はこのパラメータの使い方を明確にする助けになる。
（以下省略）


%index
BCryptQueryContextFunctionProperty
既存の CNG コンテキスト内の暗号関数に対する名前付きプロパティの値を取得する。
%prm
dwTable, pszContext, dwInterface, pszFunction, pszProperty, pcbValue, ppbValue
dwTable : [int] 
pszContext : [wstr] 関数プロパティを取得する対象コンテキストの識別子を含む、null 終端 Unicode 文字列へのポインタ。
dwInterface : [int] 
pszFunction : [wstr] プロパティを取得する対象暗号関数の識別子を含む、null 終端 Unicode 文字列へのポインタ。
pszProperty : [wstr] 取得するプロパティの識別子を含む、null 終端 Unicode 文字列へのポインタ。
pcbValue : [var] ULONG 変数のアドレスで、入力時には ppbValue が指すバッファのバイト単位のサイズを格納する。このサイズがプロパティ値を保持するのに十分でない場合、関数は STATUS_BUFFER_TOO_SMALL で失敗する。関数が戻った後、この変数には ppbValue バッファにコピーされたバイト数が格納される。
ppbValue : [var] プロパティデータを受け取るバッファへのポインタのアドレス。バッファのサイズと形式は取得するプロパティの形式に依存する。pcbValue パラメータが指す値がこのバッファのサイズを示す。このパラメータが指す値が NULL の場合、関数は必要なメモリを確保する。このメモリは不要になったら、このポインタを BCryptFreeBuffer 関数に渡して解放しなければならない。このパラメータが NULL の場合、関数は必要なサイズをバイト単位で pcbValue パラメータが指す変数に格納し、STATUS_BUFFER_TOO_SMALL を返す。
%inst
既存の CNG コンテキスト内の暗号関数に対する名前付きプロパティの値を取得する。

[戻り値]
関数の成否を示すステータスコードを返す。
返される可能性のあるコードには次のものが含まれるが、これらに限られない。
（以下省略）

[備考]
BCryptQueryContextFunctionProperty はユーザーモードでのみ呼び出すことができる。


%index
BCryptQueryProviderRegistration
CNG プロバイダに関する情報を取得する。
%prm
pszProvider, dwMode, dwInterface, pcbBuffer, ppBuffer
pszProvider : [wstr] 情報を取得する対象プロバイダの名前を含む、null 終端 Unicode 文字列へのポインタ。
dwMode : [int] 
dwInterface : [int] 
pcbBuffer : [var] ULONG 値へのポインタで、入力時には ppBuffer パラメータが指すバッファのバイト単位のサイズを格納する。出力時には、バッファにコピーされたバイト数、またはバッファに必要なサイズ（バイト単位）を受け取る。
ppBuffer : [var] プロバイダを記述する CRYPT_PROVIDER_REG 構造体およびその他データを受け取るバッファポインタへのポインタ。このパラメータが NULL の場合、関数は STATUS_BUFFER_TOO_SMALL を返し、pcbBuffer パラメータが指す値に必要なサイズ（バイト単位）を格納する。このパラメータが NULL ポインタのアドレスである場合、関数は必要なメモリを確保し、プロバイダ情報で埋め、そのメモリへのポインタをこのパラメータに格納する。このメモリの使用が終わったら、このポインタを BCryptFreeBuffer 関数に渡して解放する。このパラメータが非 NULL ポインタのアドレスである場合、関数はプロバイダ情報をそのバッファにコピーする。pcbBuffer パラメータにはバッファ全体のバイト単位のサイズを格納しておく必要がある。バッファがすべてのプロバイダ情報を保持するのに十分でない場合、関数は STATUS_BUFFER_TOO_SMALL を返す。
%inst
CNG プロバイダに関する情報を取得する。

[戻り値]
関数の成否を示すステータスコードを返す。
返される可能性のあるコードには次のものが含まれるが、これらに限られない。
（以下省略）

[備考]
BCryptQueryProviderRegistration はユーザーモードでのみ呼び出すことができる。


%index
BCryptRegisterConfigChangeNotify
ユーザーモードの CNG 構成変更イベントハンドラを作成する。
%prm
phEvent
phEvent : [intptr] 
%inst
ユーザーモードの CNG 構成変更イベントハンドラを作成する。

[戻り値]
関数の成否を示すステータスコードを返す。
返される可能性のあるコードには次のものが含まれるが、これらに限られない。
（以下省略）

[備考]
phEvent パラメータが指す変数に返されるハンドルは、CNG
構成に変更が発生したときにシグナル状態になる。BCryptRegisterConfigChangeNotify(HANDLE*)
はユーザーモードでのみ呼び出せる。カーネルモードで実行されるコードは
BCryptRegisterConfigChangeNotify(PRKEVENT) を呼び出さなければならない。


%index
BCryptRemoveContextFunction
既存の CNG コンテキストがサポートする関数の一覧から、暗号関数を削除する。
%prm
dwTable, pszContext, dwInterface, pszFunction
dwTable : [int] 
pszContext : [wstr] 関数を削除する対象コンテキストの識別子を含む、null 終端 Unicode 文字列へのポインタ。
dwInterface : [int] 
pszFunction : [wstr] 削除する暗号関数の識別子を含む、null 終端 Unicode 文字列へのポインタ。
%inst
既存の CNG コンテキストがサポートする関数の一覧から、暗号関数を削除する。

[戻り値]
関数の成否を示すステータスコードを返す。
返される可能性のあるコードには次のものが含まれるが、これらに限られない。
（以下省略）

[備考]
BCryptRemoveContextFunction はユーザーモードでのみ呼び出すことができる。


%index
BCryptResolveProviders
指定された条件をすべて満たすプロバイダの集合を取得する。
%prm
pszContext, dwInterface, pszFunction, pszProvider, dwMode, dwFlags, pcbBuffer, ppBuffer
pszContext : [wstr] プロバイダを取得する対象コンテキストの識別子を含む、null 終端 Unicode 文字列へのポインタ。NULL または空文字列に設定された場合、既定のコンテキストが使用される。
dwInterface : [int] プロバイダがサポートしなければならないインターフェイスの識別子。CNG インターフェイス識別子のいずれかでなければならない。pszFunction パラメータが NULL でなく空文字列でもない場合、dwInterface に 0 を設定すれば、関数にインターフェイスを推測させることができる。
pszFunction : [wstr] プロバイダがサポートしなければならないアルゴリズムまたは関数の識別子を含む、null 終端 Unicode 文字列へのポインタ。標準の CNG アルゴリズム識別子、または別の登録済みアルゴリズムの識別子を指定できる。dwInterface に 0 以外の値が設定されている場合、すべてのアルゴリズムおよび関数を含めるために pszFunction に NULL を指定できる。
pszProvider : [wstr] 取得するプロバイダの名前を含む、null 終端 Unicode 文字列へのポインタ。このパラメータが NULL の場合、すべてのプロバイダが対象となる。このパラメータを使用すると、他の条件を満たすプロバイダが複数ある場合に、特定のプロバイダだけを取得対象として指定できる。
dwMode : [int] 
dwFlags : [int] 関数の動作を変更するフラグの集合。
pcbBuffer : [var] DWORD 値へのポインタで、入力時には ppBuffer パラメータが指すバッファのバイト単位のサイズを格納する。出力時には、バッファにコピーされたバイト数、またはバッファに必要なサイズ（バイト単位）を受け取る。
ppBuffer : [var] 指定された条件を満たすプロバイダの集合を受け取る CRYPT_PROVIDER_REFS ポインタのアドレス。このパラメータが NULL の場合、関数は STATUS_SUCCESS を返し、pcbBuffer パラメータが指す値にすべてのデータの必要なサイズ（バイト単位）を格納する。このパラメータが NULL ポインタのアドレスである場合、関数は必要なメモリを確保し、プロバイダ情報で埋め、そのメモリへのポインタをこのパラメータに格納する。このメモリの使用が終わったら、このポインタを BCryptFreeBuffer 関数に渡して解放する。このパラメータが非 NULL ポインタのアドレスである場合、関数はプロバイダ情報をそのバッファにコピーする。pcbBuffer パラメータにはバッファ全体のバイト単位のサイズを格納しておく必要がある。バッファがすべてのプロバイダ情報を保持するのに十分でない場合、関数は STATUS_BUFFER_TOO_SMALL を返す。
%inst
指定された条件をすべて満たすプロバイダの集合を取得する。

[戻り値]
関数の成否を示すステータスコードを返す。
返される可能性のあるコードには次のものが含まれるが、これらに限られない。
（以下省略）

[備考]
BCryptResolveProviders はユーザーモードまたはカーネルモードのいずれからでも呼び出せる。カーネルモードの呼び出し元は
PASSIVE_LEVEL IRQL で実行されていなければならない。


%index
BCryptSecretAgreement
秘密鍵と公開鍵から秘密合意値を作成する。 (BCryptSecretAgreement)
%prm
hPrivKey, hPubKey, phAgreedSecret, dwFlags
hPrivKey : [int] 秘密合意値を作成するために使用する秘密鍵のハンドル。このキーと hPubKey キーは同じ CNG 暗号アルゴリズムプロバイダから取得されたものでなければならない。
hPubKey : [int] 秘密合意値を作成するために使用する公開鍵のハンドル。このキーと hPrivKey キーは同じ CNG 暗号アルゴリズムプロバイダから取得されたものでなければならない。
phAgreedSecret : [var] 秘密合意値を表すハンドルを受け取る BCRYPT_SECRET_HANDLE へのポインタ。このハンドルが不要になったら、BCryptDestroySecret 関数に渡して解放しなければならない。
dwFlags : [int] 関数の動作を変更するフラグの集合。この関数で定義されているフラグはない。
%inst
秘密鍵と公開鍵から秘密合意値を作成する。 (BCryptSecretAgreement)

[戻り値]
関数の成否を示すステータスコードを返す。
返される可能性のあるコードには次のものが含まれるが、これらに限られない。
（以下省略）

[備考]
プロバイダがサポートするプロセッサモードに応じて、BCryptSecretAgreement
はユーザーモードまたはカーネルモードのいずれからでも呼び出せる。カーネルモードの呼び出し元は PASSIVE_LEVEL IRQL または
DISPATCH_LEVEL IRQL のいずれかで実行できる。現在の IRQL レベルが DISPATCH_LEVEL
である場合、hPrivKey および hPubKey パラメータに渡すハンドルは BCRYPT_PROV_DISPATCH
フラグを指定してオープンされたプロバイダから返されたアルゴリズムハンドルから取得されたものでなければならず、BCryptSecretAgreement
関数に渡すポインタはページング不可（あるいはロックされた）メモリを参照しなければならない。この関数をカーネルモードで呼び出すには、Driver
Development Kit (DDK) に含まれる Cng.lib を使用する。Windows Server 2008 および
Windows Vista: この関数をカーネルモードで呼び出すには Ksecdd.lib を使用する。


%index
BCryptSetContextFunctionProperty
既存の CNG コンテキスト内の暗号関数に対する名前付きプロパティの値を設定する。
%prm
dwTable, pszContext, dwInterface, pszFunction, pszProperty, cbValue, pbValue
dwTable : [int] 
pszContext : [wstr] 関数プロパティを設定する対象コンテキストの識別子を含む、null 終端 Unicode 文字列へのポインタ。
dwInterface : [int] 
pszFunction : [wstr] プロパティを設定する対象暗号関数の識別子を含む、null 終端 Unicode 文字列へのポインタ。
pszProperty : [wstr] 設定するプロパティの識別子を含む、null 終端 Unicode 文字列へのポインタ。
cbValue : [int] pbValue バッファのバイト単位のサイズを格納する。これは格納される正確なバイト数である。プロパティ値が文字列の場合、必要であれば終端 null 文字を格納するために 1 文字分のサイズを加えるべきである。
pbValue : [var] 新しいプロパティ値を格納したバッファのアドレス。
%inst
既存の CNG コンテキスト内の暗号関数に対する名前付きプロパティの値を設定する。

[戻り値]
関数の成否を示すステータスコードを返す。
返される可能性のあるコードには次のものが含まれるが、これらに限られない。
（以下省略）

[備考]
BCryptSetContextFunctionProperty はユーザーモードでのみ呼び出すことができる。


%index
BCryptSetProperty
CNG オブジェクトの名前付きプロパティの値を設定する。
%prm
hObject, pszProperty, pbInput, cbInput, dwFlags
hObject : [int] プロパティ値を設定する対象 CNG オブジェクトを表すハンドル。
pszProperty : [wstr] 設定するプロパティの名前を含む、null 終端 Unicode 文字列へのポインタ。事前定義された Cryptography Primitive Property 識別子のいずれか、またはカスタムプロパティ識別子を指定できる。
pbInput : [var] 新しいプロパティ値を格納したバッファのアドレス。cbInput パラメータがこのバッファのサイズを示す。
cbInput : [int] pbInput バッファのバイト単位のサイズ。
dwFlags : [int] 関数の動作を変更するフラグの集合。この関数で定義されているフラグはない。
%inst
CNG オブジェクトの名前付きプロパティの値を設定する。

[戻り値]
関数の成否を示すステータスコードを返す。
返される可能性のあるコードには次のものが含まれるが、これらに限られない。
（以下省略）

[備考]
プロバイダがサポートするプロセッサモードに応じて、BCryptSetProperty
はユーザーモードまたはカーネルモードのいずれからでも呼び出せる。カーネルモードの呼び出し元は PASSIVE_LEVEL IRQL または
DISPATCH_LEVEL IRQL のいずれかで実行できる。現在の IRQL レベルが DISPATCH_LEVEL
である場合、BCryptSetProperty
に渡すポインタはページング不可（あるいはロックされた）メモリを参照しなければならない。hObject
パラメータに指定したオブジェクトがハンドルである場合、それは BCRYPT_PROV_DISPATCH
フラグを指定してオープンされたものでなければならない。この関数をカーネルモードで呼び出すには、Driver Development Kit
(DDK) に含まれる Cng.lib を使用する。Windows Server 2008 および Windows Vista:
この関数をカーネルモードで呼び出すには Ksecdd.lib を使用する。


%index
BCryptSignHash
ハッシュ値の署名を作成する。 (BCryptSignHash)
%prm
hKey, pPaddingInfo, pbInput, cbInput, pbOutput, cbOutput, pcbResult, dwFlags
hKey : [int] ハッシュへの署名に使用するキーのハンドル。
pPaddingInfo : [intptr] パディング情報を格納する構造体へのポインタ。このパラメータが指す構造体の実際の型は dwFlags パラメータの値に依存する。このパラメータは非対称キーでのみ使用され、それ以外の場合は NULL でなければならない。
pbInput : [var] 署名するハッシュ値を格納したバッファへのポインタ。cbInput パラメータがこのバッファのサイズを示す。
cbInput : [int] 署名する pbInput バッファ内のバイト数。
pbOutput : [var] この関数によって生成された署名を受け取るバッファのアドレス。cbOutput パラメータがこのバッファのサイズを示す。このパラメータが NULL の場合、関数は署名に必要なサイズを計算し、そのサイズを pcbResult パラメータが指す位置に返す。
cbOutput : [int] pbOutput バッファのバイト単位のサイズ。pbOutput パラメータが NULL の場合、このパラメータは無視される。
pcbResult : [var] pbOutput バッファにコピーされたバイト数を受け取る ULONG 変数へのポインタ。pbOutput が NULL の場合、ここに署名に必要なサイズ（バイト単位）を受け取る。
dwFlags : [int] 関数の動作を変更するフラグの集合。指定可能なフラグは hKey パラメータで指定するキーの種類に依存する。
%inst
ハッシュ値の署名を作成する。 (BCryptSignHash)

[戻り値]
関数の成否を示すステータスコードを返す。
返される可能性のあるコードには次のものが含まれるが、これらに限られない。
（以下省略）

[備考]

この関数は、指定されたキーでハッシュ値を暗号化して署名を作成する。後で署名が有効であることを検証するには、同一のキーと元データの同一のハッシュを用いて
BCryptVerifySignature 関数を呼び出す。プロバイダがサポートするプロセッサモードに応じて、BCryptSignHash
はユーザーモードまたはカーネルモードのいずれからでも呼び出せる。カーネルモードの呼び出し元は PASSIVE_LEVEL IRQL または
DISPATCH_LEVEL IRQL のいずれかで実行できる。現在の IRQL レベルが DISPATCH_LEVEL
である場合、hKey パラメータに渡すハンドルは BCRYPT_PROV_DISPATCH
フラグを指定してオープンされたプロバイダから返されたアルゴリズムハンドルから取得されたものでなければならず、BCryptSignHash
関数に渡すポインタはページング不可（あるいはロックされた）メモリを参照しなければならない。この関数をカーネルモードで呼び出すには、Driver
Development Kit (DDK) に含まれる Cng.lib を使用する。Windows Server 2008 および
Windows Vista: この関数をカーネルモードで呼び出すには Ksecdd.lib を使用する。


%index
BCryptUnregisterConfigChangeNotify
BCryptRegisterConfigChangeNotify(HANDLE*) 関数で作成されたユーザーモード CNG 構成変更イベントハンドラを削除する。
%prm
hEvent
hEvent : [intptr] 
%inst
BCryptRegisterConfigChangeNotify(HANDLE*) 関数で作成されたユーザーモード CNG
構成変更イベントハンドラを削除する。

[戻り値]
関数の成否を示すステータスコードを返す。
返される可能性のあるコードには次のものが含まれるが、これらに限られない。
（以下省略）

[備考]
BCryptUnregisterConfigChangeNotify(HANDLE)
はユーザーモードでのみ呼び出せる。カーネルモードで実行されるコードは
BCryptUnregisterConfigChangeNotify(PRKEVENT) を呼び出さなければならない。


%index
BCryptVerifySignature
指定された署名が指定されたハッシュと一致することを検証する。 (BCryptVerifySignature)
%prm
hKey, pPaddingInfo, pbHash, cbHash, pbSignature, cbSignature, dwFlags
hKey : [int] 署名を復号するために使用するキーのハンドル。これは BCryptSignHash 関数でデータに署名するために使用したキー、または、その鍵ペアの公開鍵部分でなければならない。
pPaddingInfo : [intptr] パディング情報を格納する構造体へのポインタ。このパラメータが指す構造体の実際の型は dwFlags パラメータの値に依存する。このパラメータは非対称キーでのみ使用され、それ以外の場合は NULL でなければならない。
pbHash : [var] データのハッシュを格納するバッファのアドレス。cbHash パラメータがこのバッファのサイズを示す。
cbHash : [int] pbHash バッファのバイト単位のサイズ。
pbSignature : [var] データの署名済みハッシュを格納するバッファのアドレス。署名は BCryptSignHash 関数を使用して作成する。cbSignature パラメータがこのバッファのサイズを示す。
cbSignature : [int] pbSignature バッファのバイト単位のサイズ。署名は BCryptSignHash 関数を使用して作成する。
dwFlags : [int] 関数の動作を変更するフラグの集合。指定可能なフラグは hKey パラメータで指定するキーの種類に依存する。キーが対称キーの場合、このパラメータは使用されないので 0 を指定する。
%inst
指定された署名が指定されたハッシュと一致することを検証する。 (BCryptVerifySignature)

[戻り値]
関数の成否を示すステータスコードを返す。
返される可能性のあるコードには次のものが含まれるが、これらに限られない。
（以下省略）

[備考]

この関数は指定されたキーで署名を計算し、計算した署名値を指定された署名値と比較する。この関数を使用するには、署名されたハッシュ値の作成に使用したのと同じハッシュアルゴリズムでデータをハッシュしなければならない。該当する場合、署名作成時に指定したのと同じパディング方式も指定しなければならない。プロバイダがサポートするプロセッサモードに応じて、BCryptVerifySignature
はユーザーモードまたはカーネルモードのいずれからでも呼び出せる。カーネルモードの呼び出し元は PASSIVE_LEVEL IRQL または
DISPATCH_LEVEL IRQL のいずれかで実行できる。現在の IRQL レベルが DISPATCH_LEVEL
である場合、hKey パラメータに渡すハンドルは BCRYPT_PROV_DISPATCH
フラグを指定してオープンされたプロバイダから返されたアルゴリズムハンドルから取得されたものでなければならず、BCryptVerifySignature
関数に渡すポインタはページング不可（あるいはロックされた）メモリを参照しなければならない。この関数をカーネルモードで呼び出すには、Driver
Development Kit (DDK) に含まれる Cng.lib を使用する。Windows Server 2008 および
Windows Vista: この関数をカーネルモードで呼び出すには Ksecdd.lib を使用する。

