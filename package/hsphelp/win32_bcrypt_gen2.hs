; ============================================================
;   bcrypt.dll ヘルプ (CsWin32 / win32metadata から自動抽出)
;   docs_ja.json に日本語訳があればそちらを使用、無ければ英語原文。
;   翻訳を追加するときは docs_ja.json を編集して再生成。
; ============================================================

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
BCryptAddContextFunction
Adds a cryptographic function to the list of functions that are supported by an existing CNG context.
%group
Win32 bcrypt
%prm
dwTable, pszContext, dwInterface, pszFunction, dwPosition
dwTable : [int] 
pszContext : [wstr] A pointer to a null-terminated Unicode string that contains the identifier of the context to add the function to.
dwInterface : [int] 
pszFunction : [wstr] A pointer to a null-terminated Unicode string that contains the identifier of the cryptographic function to add.
dwPosition : [int] Specifies the position in the list at which to insert this function. The function is inserted at this position ahead of any existing functions. The CRYPT_PRIORITY_TOP value is used to insert the function at the top of the list. The CRYPT_PRIORITY_BOTTOM value is used to insert the function at the end of the list.
%inst
Adds a cryptographic function to the list of functions that are
supported by an existing CNG context.

[戻り値]
Returns a status code that indicates the success or failure of the
function.
Possible return codes include, but are not limited to, the following.
This doc was truncated.

[備考]
If the function added is already in the list, it will be removed and
inserted at the new position. BCryptAddContextFunction can be called
only in user mode.


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
BCryptConfigureContext
Sets the configuration information for an existing CNG context.
%group
Win32 bcrypt
%prm
dwTable, pszContext, pConfig
dwTable : [int] 
pszContext : [wstr] A pointer to a null-terminated Unicode string that contains the identifier of the context to set the configuration information for.
pConfig : [var] The address of a CRYPT_CONTEXT_CONFIG structure that contains the new context configuration information.
%inst
Sets the configuration information for an existing CNG context.

[戻り値]
Returns a status code that indicates the success or failure of the
function.
Possible return codes include, but are not limited to, the following.
This doc was truncated.

[備考]
BCryptConfigureContext can be called only in user mode.


%index
BCryptConfigureContextFunction
Sets the configuration information for the cryptographic function of an existing CNG context.
%group
Win32 bcrypt
%prm
dwTable, pszContext, dwInterface, pszFunction, pConfig
dwTable : [int] 
pszContext : [wstr] A pointer to a null-terminated Unicode string that contains the identifier of the context to set the cryptographic function configuration information for.
dwInterface : [int] 
pszFunction : [wstr] A pointer to a null-terminated Unicode string that contains the identifier of the cryptographic function to set the configuration information for.
pConfig : [var] The address of a CRYPT_CONTEXT_FUNCTION_CONFIG structure that contains the new function configuration information.
%inst
Sets the configuration information for the cryptographic function of
an existing CNG context.

[戻り値]
Returns a status code that indicates the success or failure of the
function.
Possible return codes include, but are not limited to, the following.
This doc was truncated.

[備考]
BCryptConfigureContextFunction can be called only in user mode.


%index
BCryptCreateContext
Creates a new CNG configuration context.
%group
Win32 bcrypt
%prm
dwTable, pszContext, pConfig
dwTable : [int] 
pszContext : [wstr] A pointer to a null-terminated Unicode string that contains the identifier of the context to create.
pConfig : [var] A pointer to a CRYPT_CONTEXT_CONFIG structure that contains additional configuration data for the new context. This parameter can be NULL if it is not needed.
%inst
Creates a new CNG configuration context.

[戻り値]
Returns a status code that indicates the success or failure of the
function.
Possible return codes include, but are not limited to, the following.
This doc was truncated.

[備考]
BCryptCreateContext can be called only in user mode.


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
BCryptCreateMultiHash
The BCryptCreateMultiHash function creates a multi-hash state that allows for the parallel computation of multiple hash operations.
%group
Win32 bcrypt
%prm
hAlgorithm, phHash, nHashes, pbHashObject, cbHashObject, pbSecret, cbSecret, dwFlags
hAlgorithm : [int] *BCRYPT_ALG_HANDLE* `[in, out]` The algorithm handle used for all of the hash states in the multi-hash array. The algorithm handle must have been opened with the **BCYRPT_MULTI_FLAG** passed to the [BCryptOpenAlgorithmProvider](nf-bcrypt-bcryptopenalgorithmprovider.md) function. Alternatively, the caller can use the pseudo-handles.
phHash : [var] *BCRYPT_HASH_HANDLE** `[out]` A pointer to a **BCRYPT_HASH_HANDLE** value that receives a handle that represents the multi-hash state. This handle is used in subsequent operations such as [BCryptProcessMultiOperations](nf-bcrypt-bcryptprocessmultioperations.md). When you have finished using this handle, release it by passing it to the [BCryptDestroyHash](nf-bcrypt-bcryptdestroyhash.md) function.
nHashes : [int] *ULONG* `[in]` The number of elements in the array. The multi-hash state that this function creates is able to perform parallel computations on *nHashes* different hash states.
pbHashObject : [var] *PUCHAR* `[out]` A pointer to a buffer that receives the multi-hash state. The size can be calculated from the **cbPerObject** and **cbPerElement** members of the [BCRYPT_MULTI_OBJECT_LENGTH_STRUCT](ns-bcrypt-bcrypt_multi_object_length_struct.md) structure. The value is the following: `cbPerObject + (number of hash states) * cbPerElement`. If *pbHashObject* is `NULL` and *cbHashObject* has a value of zero (`0`), the object buffer is automatically allocated.
cbHashObject : [int] *ULONG* `[in]` The size of the *pbHashObject* buffer, or zero (`0`) if *pbHashObject* is `NULL`.
pbSecret : [var] *PUCHAR* `[in]` A pointer to a buffer that contains the key to use for the hash or MAC. The *cbSecret* parameter contains the size of this buffer. This key only applies to hash algorithms opened by the [BCryptOpenAlgorithmProvider](nf-bcrypt-bcryptopenalgorithmprovider.md) function by using the **BCRYPT_ALG_HANDLE_HMAC** flag. Otherwise, set this parameter to `NULL`. The same key is used for all elements of the array.
cbSecret : [int] *ULONG* `[in]` The size, in bytes, of the *pbSecret* buffer. If no key is used, set this parameter to zero (`0`).
dwFlags : [int] *ULONG* `[in]` Flags that modify the behavior of the function. This can be zero or the values below. Multi-hash objects are always reusable and always behave as if the **BCRYPT_HASH_REUSABLE_FLAG** was passed. This flag is supported here for consistency. | Value | Meaning | |--------|--------| | **BCRYPT_HASH_REUSABLE_FLAG** | Creates a reusable hashing object. The object can be used for a new hashing operation immediately after calling [BCryptFinishHash](nf-bcrypt-bcryptfinishhash.md). For more information, see [Creating a Hash with CNG](/windows/win32/SecCNG/creating-a-hash-with-cng). |
%inst
The BCryptCreateMultiHash function creates a multi-hash state that
allows for the parallel computation of multiple hash operations.

[戻り値]
Returns a status code that indicates the success or failure of the
function. If the method succeeds, it will return `STATUS_SUCCESS`.
For other **NTSTATUS** values, see [NTSTATUS
Values](/openspecs/windows_protocols/ms-erref/596a1078-e883-4972-9bbc-49e60bebca55).

[備考]
Internally, parallel hash computations are done using
single-instruction multiple-data (SIMD) instructions with up to 8
parallel computations at a time, depending on the hash algorithm and
the CPU features available. To maximize performance, we recommend
that the caller provide at least eight computations that can be
processed in parallel. For computations of unequal length, providing
more computations in parallel allows the implementation to schedule
the computations better across the CPU registers. This can provide a
throughput benefit. For optimal throughput, we recommend that the
caller provide between eight and 100 computations. Select a lower
value in that range only if all the hash computations are the same
length. Multi-hashing is not supported for HMAC-MD2, HMAC-MD4, and
GMAC.


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
BCryptDeleteContext
Deletes an existing CNG configuration context.
%group
Win32 bcrypt
%prm
dwTable, pszContext
dwTable : [int] 
pszContext : [wstr] A pointer to a null-terminated Unicode string that contains the identifier of the context to delete.
%inst
Deletes an existing CNG configuration context.

[戻り値]
Returns a status code that indicates the success or failure of the
function.
Possible return codes include, but are not limited to, the following.
This doc was truncated.

[備考]
BCryptDeleteContext can be called only in user mode.


%index
BCryptDestroySecret
Destroys a secret agreement handle that was created by using the BCryptSecretAgreement function.
%group
Win32 bcrypt
%prm
hSecret
hSecret : [int] The BCRYPT_SECRET_HANDLE to be destroyed.
%inst
Destroys a secret agreement handle that was created by using the
BCryptSecretAgreement function.

[戻り値]
Returns a status code that indicates the success or failure of the
function.
Possible return codes include, but are not limited to, the following.
This doc was truncated.

[備考]
Depending on what processor modes a provider supports,
BCryptDestroySecret can be called either from user mode or kernel
mode. Kernel mode callers can execute either at PASSIVE_LEVEL IRQL or
DISPATCH_LEVEL IRQL. If the current IRQL level is DISPATCH_LEVEL, the
handle provided in the hSecret parameter must be derived from an
algorithm handle returned by a provider that was opened by using the
BCRYPT_PROV_DISPATCH flag. To call this function in kernel mode, use
Cng.lib, which is part of the Driver Development Kit (DDK). Windows
Server 2008 and Windows Vista: To call this function in kernel mode,
use Ksecdd.lib.


%index
BCryptDeriveKey
Derives a key from a secret agreement value. (BCryptDeriveKey)
%group
Win32 bcrypt
%prm
hSharedSecret, pwszKDF, pParameterList, pbDerivedKey, cbDerivedKey, pcbResult, dwFlags
hSharedSecret : [int] The secret agreement handle to create the key from. This handle is obtained from the BCryptSecretAgreement function.
pwszKDF : [wstr] A pointer to a null-terminated Unicode string that identifies the key derivation function (KDF) to use to derive the key. This can be one of the following strings.
pParameterList : [var] The address of a BCryptBufferDesc structure that contains the KDF parameters. This parameter is optional and can be NULL if it is not needed.
pbDerivedKey : [var] The address of a buffer that receives the key. The cbDerivedKey parameter contains the size of this buffer. If this parameter is NULL, this function will place the required size, in bytes, in the ULONG pointed to by the pcbResult parameter.
cbDerivedKey : [int] The size, in bytes, of the pbDerivedKey buffer.
pcbResult : [var] A pointer to a ULONG that receives the number of bytes that were copied to the pbDerivedKey buffer. If the pbDerivedKey parameter is NULL, this function will place the required size, in bytes, in the ULONG pointed to by this parameter.
dwFlags : [int] A set of flags that modify the behavior of this function. This can be zero or the following value.
%inst
Derives a key from a secret agreement value. (BCryptDeriveKey)

[戻り値]
Returns a status code that indicates the success or failure of the
function.
Possible return codes include, but are not limited to, the following.
This doc was truncated.

[備考]
The BCryptBufferDesc structure in the pParameterList parameter can
contain more than one of the KDF_SECRET_PREPEND and KDF_SECRET_APPEND
parameters. If more than one of these parameters is specified, the
parameter values are concatenated in the order in which they are
contained in the array before the KDF is called. For example, assume
the following parameter values are specified.
This doc was truncated.


%index
BCryptDeriveKeyCapi
Derives a key from a hash value.
%group
Win32 bcrypt
%prm
hHash, hTargetAlg, pbDerivedKey, cbDerivedKey, dwFlags
hHash : [int] The handle of the hash object. The handle is obtained by calling the BCryptCreateHash function. When you have finished using the handle, you must free it by calling the BCryptDestroyHash function.
hTargetAlg : [int] The handle of the algorithm object.  This can be an ALG_ID value that is compatible with the CryptDeriveKey function. Note??Limitations in CAPI and key expansion prevent the use of any hash algorithm that generates an output that is larger than 512 bits.
pbDerivedKey : [var] A pointer to the buffer that receives the derived key.
cbDerivedKey : [int] The size, in characters, of the derived key pointed to by the pbDerivedKey parameter.
dwFlags : [int] This parameter is reserved and must be set to zero.
%inst
Derives a key from a hash value.

[戻り値]
Returns a status code that indicates the success or failure of the
function.
Possible return codes include, but are not limited to, the following.
This doc was truncated.

[備考]
This function does not support the PK salt functionality of the CAPI
CryptDeriveKey function.


%index
BCryptDeriveKeyPBKDF2
Derives a key from a hash value by using the PBKDF2 key derivation algorithm as defined by RFC 2898.
%group
Win32 bcrypt
%prm
hPrf, pbPassword, cbPassword, pbSalt, cbSalt, cIterations, pbDerivedKey, cbDerivedKey, dwFlags
hPrf : [int] The handle of an algorithm provider that provides the pseudo-random function. This should be an algorithm provider that performs a Message Authentication Code computation. When you use the default Microsoft algorithm provider, any hashing algorithm opened by using the  BCRYPT_ALG_HANDLE_HMAC_FLAG flag can be used. Note??Only algorithms that implement the BCRYPT_IS_KEYED_HASH  property can be used to populate this parameter.
pbPassword : [var] A pointer to a buffer that contains the password parameter for the PBKDF2 key derivation algorithm. Note??Any secret information used in the key derivation should be passed in this buffer.
cbPassword : [int] The length, in bytes, of the data in the buffer pointed to by the pbPassword parameter.
pbSalt : [var] A pointer to a buffer that contains the salt argument  for the PBKDF2 key derivation algorithm. Note??Any information that is not secret and that is used in the key derivation should be passed in this buffer.
cbSalt : [int] The length, in bytes, of the salt argument pointed to by the pbSalt parameter.
cIterations : [int64] The iteration count for the PBKDF2 key derivation algorithm.
pbDerivedKey : [var] A pointer to a buffer that receives the derived key.
cbDerivedKey : [int] The length, in bytes, of the derived key returned in the buffer pointed to by the pbDerivedKey parameter.
dwFlags : [int] This parameter is reserved and must be set to zero.
%inst
Derives a key from a hash value by using the PBKDF2 key derivation
algorithm as defined by RFC 2898.

[戻り値]
Returns a status code that indicates the success or failure of the
function.
Possible return codes include, but are not limited to, the following.
This doc was truncated.


%index
BCryptDuplicateHash
Duplicates an existing hash or Message Authentication Code (MAC) object.
%group
Win32 bcrypt
%prm
hHash, phNewHash, pbHashObject, cbHashObject, dwFlags
hHash : [int] The handle of the hash or MAC object to duplicate.
phNewHash : [var] A pointer to a BCRYPT_HASH_HANDLE value that receives the handle that represents the duplicate hash or MAC object.
pbHashObject : [var] A pointer to a buffer that receives the duplicate hash or MAC object. The cbHashObject parameter contains the size of this buffer. The required size of this buffer can be obtained by calling the BCryptGetProperty function to get the BCRYPT_OBJECT_LENGTH property. This will provide the size of the hash object for the specified algorithm. When the duplicate hash handle is released, free this memory.
cbHashObject : [int] The size, in bytes, of the pbHashObject buffer.
dwFlags : [int] A set of flags that modify the behavior of this function. No flags are currently defined, so this parameter should be zero.
%inst
Duplicates an existing hash or Message Authentication Code (MAC)
object.

[戻り値]
Returns a status code that indicates the success or failure of the
function.
Possible return codes include, but are not limited to, the following.
This doc was truncated.

[備考]
This function is useful when computing a hash or MAC over a block of
common data. After the common data has been processed, the hash or
MAC object can be duplicated, and then the unique data can be added
to the individual objects. Depending on what processor modes a
provider supports, BCryptDuplicateHash can be called either from user
mode or kernel mode. Kernel mode callers can execute either at
PASSIVE_LEVEL IRQL or DISPATCH_LEVEL IRQL. If the current IRQL level
is DISPATCH_LEVEL, the handle provided in the hHash parameter must be
derived from an algorithm handle returned by a provider that was
opened by using the BCRYPT_PROV_DISPATCH flag, and any pointers
passed to the BCryptDestroyKey function must refer to nonpaged (or
locked) memory. To call this function in kernel mode, use Cng.lib,
which is part of the Driver Development Kit (DDK). Windows Server
2008 and Windows Vista: To call this function in kernel mode, use
Ksecdd.lib.


%index
BCryptDuplicateKey
Creates a duplicate of a symmetric key.
%group
Win32 bcrypt
%prm
hKey, phNewKey, pbKeyObject, cbKeyObject, dwFlags
hKey : [int] The handle of the key to duplicate. This must be a handle to a symmetric key.
phNewKey : [var] A pointer to a BCRYPT_KEY_HANDLE variable that receives the handle of the duplicate key. This handle is used in subsequent functions that require a key, such as BCryptEncrypt. This handle must be released when it is no longer needed by passing it to the BCryptDestroyKey function.
pbKeyObject : [var] A pointer to a buffer that receives the duplicate key object. The cbKeyObject parameter contains the size of this buffer. The required size of this buffer can be obtained by calling the BCryptGetProperty function to get the BCRYPT_OBJECT_LENGTH property. This will provide the size of the key object for the specified algorithm. This memory can only be freed after the phNewKey key handle is destroyed.
cbKeyObject : [int] The size, in bytes, of the pbKeyObject buffer.
dwFlags : [int] A set of flags that modify the behavior of this function. No flags are currently defined, so this parameter should be zero.
%inst
Creates a duplicate of a symmetric key.

[戻り値]
Returns a status code that indicates the success or failure of the
function.
Possible return codes include, but are not limited to, the following.
This doc was truncated.

[備考]
Depending on what processor modes a provider supports,
BCryptDuplicateKey can be called either from user mode or kernel
mode. Kernel mode callers can execute either at PASSIVE_LEVEL IRQL or
DISPATCH_LEVEL IRQL. If the current IRQL level is DISPATCH_LEVEL, the
handle provided in the hKey parameter must be derived from an
algorithm handle returned by a provider that was opened with the
BCRYPT_PROV_DISPATCH flag, and any pointers passed to the
BCryptDuplicateKey function must refer to nonpaged (or locked)
memory. To call this function in kernel mode, use Cng.lib, which is
part of the Driver Development Kit (DDK). Windows Server 2008 and
Windows Vista: To call this function in kernel mode, use Ksecdd.lib.


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
BCryptEnumAlgorithms
Gets a list of the registered algorithm identifiers.
%group
Win32 bcrypt
%prm
dwAlgOperations, pAlgCount, ppAlgList, dwFlags
dwAlgOperations : [int] 
pAlgCount : [var] A pointer to a ULONG variable to receive the number of elements in the ppAlgList array.
ppAlgList : [var] The address of a BCRYPT_ALGORITHM_IDENTIFIER structure pointer to receive the array of registered algorithm identifiers. This pointer must be passed to the BCryptFreeBuffer function when it is no longer needed.
dwFlags : [int] A set of flags that modify the behavior of this function. No flags are defined for this function.
%inst
Gets a list of the registered algorithm identifiers.

[戻り値]
Returns a status code that indicates the success or failure of the
function.
Possible return codes include, but are not limited to, the following.
This doc was truncated.

[備考]
BCryptEnumAlgorithms can be called either from user mode or kernel
mode. Kernel mode callers must be executing at PASSIVE_LEVEL IRQL.


%index
BCryptEnumContextFunctionProviders
Obtains the providers for the cryptographic functions for a context in the specified configuration table.
%group
Win32 bcrypt
%prm
dwTable, pszContext, dwInterface, pszFunction, pcbBuffer, ppBuffer
dwTable : [int] 
pszContext : [wstr] A pointer to a null-terminated Unicode string that contains the identifier of the context to enumerate the function providers for.
dwInterface : [int] 
pszFunction : [wstr] A pointer to a null-terminated Unicode string that contains the identifier of the function to enumerate the providers for.
pcbBuffer : [var] The address of a ULONG variable that, on entry, contains the size, in bytes, of the buffer pointed to by ppBuffer. If this size is not large enough to hold the set of context identifiers, this function will fail with STATUS_BUFFER_TOO_SMALL. After this function returns, this value contains the number of bytes that were copied to the ppBuffer buffer.
ppBuffer : [var] The address of a pointer to a CRYPT_CONTEXT_FUNCTION_PROVIDERS structure that receives the set of context function providers retrieved by this function. The value pointed to by the pcbBuffer parameter contains the size of this buffer. If the value pointed to by this parameter is NULL, this function will allocate the required memory. This memory must be freed when it is no longer needed by passing this pointer to the BCryptFreeBuffer function. If this parameter is NULL, this function will place the required size, in bytes, in the variable pointed to by the pcbBuffer parameter and return STATUS_BUFFER_TOO_SMALL.
%inst
Obtains the providers for the cryptographic functions for a context
in the specified configuration table.

[戻り値]
Returns a status code that indicates the success or failure of the
function.
Possible return codes include, but are not limited to, the following.
This doc was truncated.

[備考]
BCryptEnumContextFunctionProviders can be called only in user mode.


%index
BCryptEnumContextFunctions
Obtains the cryptographic functions for a context in the specified configuration table.
%group
Win32 bcrypt
%prm
dwTable, pszContext, dwInterface, pcbBuffer, ppBuffer
dwTable : [int] 
pszContext : [wstr] A pointer to a null-terminated Unicode string that contains the identifier of the context to enumerate the functions for.
dwInterface : [int] 
pcbBuffer : [var] The address of a ULONG variable that, on entry, contains the size, in bytes, of the buffer pointed to by ppBuffer. If this size is not large enough to hold the set of context identifiers, this function will fail with STATUS_BUFFER_TOO_SMALL. After this function returns, this value contains the number of bytes that were copied to the ppBuffer buffer.
ppBuffer : [var] The address of a pointer to a CRYPT_CONTEXT_FUNCTIONS structure that receives the set of context functions retrieved by this function. The value pointed to by the pcbBuffer parameter contains the size of this buffer. If the value pointed to by this parameter is NULL, this function will allocate the required memory. This memory must be freed when it is no longer needed by passing this pointer to the BCryptFreeBuffer function. If this parameter is NULL, this function will place the required size, in bytes, in the variable pointed to by the pcbBuffer parameter and return STATUS_BUFFER_TOO_SMALL.
%inst
Obtains the cryptographic functions for a context in the specified
configuration table.

[戻り値]
Returns a status code that indicates the success or failure of the
function.
Possible return codes include, but are not limited to, the following.
This doc was truncated.

[備考]
BCryptEnumContextFunctions can be called only in user mode.


%index
BCryptEnumContexts
Obtains the identifiers of the contexts in the specified configuration table.
%group
Win32 bcrypt
%prm
dwTable, pcbBuffer, ppBuffer
dwTable : [int] 
pcbBuffer : [var] The address of a ULONG variable that, on entry, contains the size, in bytes, of the buffer pointed to by ppBuffer. If this size is not large enough to hold the set of context identifiers, this function will fail with STATUS_BUFFER_TOO_SMALL. After this function returns, this value contains the number of bytes that were copied to the ppBuffer buffer.
ppBuffer : [var] The address of a pointer to a CRYPT_CONTEXTS structure that receives the set of contexts retrieved by this function. The value pointed to by the pcbBuffer parameter contains the size of this buffer. If the value pointed to by this parameter is NULL, this function will allocate the required memory. This memory must be freed when it is no longer needed by passing this pointer to the BCryptFreeBuffer function. If this parameter is NULL, this function will place the required size, in bytes, in the variable pointed to by the pcbBuffer parameter and return STATUS_BUFFER_TOO_SMALL.
%inst
Obtains the identifiers of the contexts in the specified
configuration table.

[戻り値]
Returns a status code that indicates the success or failure of the
function.
Possible return codes include, but are not limited to, the following.
This doc was truncated.

[備考]
BCryptEnumContexts can be called only in user mode.


%index
BCryptEnumProviders
Obtains all of the CNG providers that support a specified algorithm.
%group
Win32 bcrypt
%prm
pszAlgId, pImplCount, ppImplList, dwFlags
pszAlgId : [wstr] A pointer to a null-terminated Unicode string that identifies the algorithm to obtain the providers for. This can be one of the predefined CNG Algorithm Identifiers or another algorithm identifier.
pImplCount : [var] A pointer to a ULONG variable to receive the number of elements in the ppImplList array.
ppImplList : [var] The address of an array of BCRYPT_PROVIDER_NAME structures to receive the collection of providers that support the specified algorithm. The pImplCount parameter receives the number of elements in this array. This memory must be freed when it is no longer needed by passing this pointer to the BCryptFreeBuffer function.
dwFlags : [int] A set of flags that modifies the behavior of this function. There are currently no flags defined, so this parameter must be zero.
%inst
Obtains all of the CNG providers that support a specified algorithm.

[戻り値]
Returns a status code that indicates the success or failure of the
function.
Possible return codes include, but are not limited to, the following.
This doc was truncated.

[備考]
BCryptEnumProviders can be called either from user mode or kernel
mode. Kernel mode callers must be executing at PASSIVE_LEVEL IRQL.


%index
BCryptEnumRegisteredProviders
Retrieves information about the registered providers.
%group
Win32 bcrypt
%prm
pcbBuffer, ppBuffer
pcbBuffer : [var] A pointer to a ULONG value that, on entry, contains the size, in bytes, of the buffer pointed to by the ppBuffer parameter. On exit, this value receives either the number of bytes copied to the buffer or the required size, in bytes, of the buffer. Note??This is the total size, in bytes, of the entire buffer, not just the size of the CRYPT_PROVIDERS structure. The buffer must be able to hold other data for the providers in addition to the CRYPT_PROVIDERS structure.
ppBuffer : [var] A pointer to a buffer pointer that receives a CRYPT_PROVIDERS structure and other data that describes the collection of registered providers. If this parameter is NULL, this function will return STATUS_BUFFER_TOO_SMALL and place in the value pointed to by the pcbBuffer parameter, the required size, in bytes, of all the data. If this parameter is the address of a NULL pointer, this function will allocate the required memory, fill the memory with the information about the providers, and place the pointer to this memory in this parameter. When you have finished using this memory,  free it by passing this pointer to the BCryptFreeBuffer function. If this parameter is the address of a non-NULL pointer, this function will copy the provider information into this buffer. The pcbBuffer parameter must contain the size, in bytes, of the entire buffer. If the buffer is not large enough to hold all of the provider information, this function will return STATUS_BUFFER_TOO_SMALL.
%inst
Retrieves information about the registered providers.

[戻り値]
Returns a status code that indicates the success or failure of the
function.
Possible return codes include, but are not limited to, the following.
This doc was truncated.

[備考]
The BCryptEnumRegisteredProviders function can be called in one of
two ways:
This doc was truncated.


%index
BCryptExportKey
Exports a key to a memory BLOB that can be persisted for later use.
%group
Win32 bcrypt
%prm
hKey, hExportKey, pszBlobType, pbOutput, cbOutput, pcbResult, dwFlags
hKey : [int] The handle of the key to export.
hExportKey : [int] The handle of the key with which to wrap the exported key. Use this parameter when exporting BLOBs of type BCRYPT_AES_WRAP_KEY_BLOB; otherwise, set it to NULL.Note??The hExportKey handle must be supplied by the same provider that supplied the hKey handle, and hExportKey must be a handle to a symmetric key that can be used in the Advanced Encryption Standard (AES) key wrap algorithm. When the hKey handle is from the Microsoft provider, hExportKey must be an AES key handle.
pszBlobType : [wstr] 
pbOutput : [var] The address of a buffer that receives the key BLOB. The cbOutput parameter contains the size of this buffer. If this parameter is NULL, this function will place the required size, in bytes, in the ULONG pointed to by the pcbResult parameter.
cbOutput : [int] Contains the size, in bytes, of the pbOutput buffer.
pcbResult : [var] A pointer to a ULONG that receives the number of bytes that were copied to the pbOutput buffer. If the pbOutput parameter is NULL, this function will place the required size, in bytes, in the ULONG pointed to by this parameter.
dwFlags : [int] A set of flags that modify the behavior of this function. No flags are defined for this function.
%inst
Exports a key to a memory BLOB that can be persisted for later use.

[戻り値]
Returns a status code that indicates the success or failure of the
function.
Possible return codes include, but are not limited to, the following.
This doc was truncated.

[備考]
Depending on what processor modes a provider supports,
BCryptExportKey can be called either from user mode or kernel mode.
Kernel mode callers can execute either at PASSIVE_LEVEL IRQL or
DISPATCH_LEVEL IRQL. If the current IRQL level is DISPATCH_LEVEL, the
handle provided in the hKey parameter must be derived from an
algorithm handle returned by a provider that was opened with the
BCRYPT_PROV_DISPATCH flag, and any pointers passed to the
BCryptExportKey function must refer to nonpaged (or locked) memory.
To call this function in kernel mode, use Cng.lib, which is part of
the Driver Development Kit (DDK). Windows Server 2008 and Windows
Vista: To call this function in kernel mode, use Ksecdd.lib.


%index
BCryptFinalizeKeyPair
Completes a public/private key pair.
%group
Win32 bcrypt
%prm
hKey, dwFlags
hKey : [int] The handle of the key to complete. This handle is obtained by calling the BCryptGenerateKeyPair function.
dwFlags : [int] A set of flags that modify the behavior of this function. No flags are currently defined, so this parameter should be zero.
%inst
Completes a public/private key pair.

[戻り値]
Returns a status code that indicates the success or failure of the
function.
Possible return codes include, but are not limited to, the following.
This doc was truncated.

[備考]
Depending on what processor modes a provider supports,
BCryptFinalizeKeyPair can be called either from user mode or kernel
mode. Kernel mode callers can execute either at PASSIVE_LEVEL IRQL or
DISPATCH_LEVEL IRQL. If the current IRQL level is DISPATCH_LEVEL, the
handle provided in the hKey parameter must be derived from an
algorithm handle returned by a provider that was opened with the
BCRYPT_PROV_DISPATCH flag. To call this function in kernel mode, use
Cng.lib, which is part of the Driver Development Kit (DDK). Windows
Server 2008 and Windows Vista: To call this function in kernel mode,
use Ksecdd.lib.


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
BCryptFreeBuffer
Used to free memory that was allocated by one of the CNG functions.
%group
Win32 bcrypt
%prm
pvBuffer
pvBuffer : [intptr] A pointer to the memory buffer to be freed.
%inst
Used to free memory that was allocated by one of the CNG functions.

[備考]
BCryptFreeBuffer must be called in the same processor mode as the
BCrypt API function that allocated the buffer. In addition, if the
buffer was allocated at PASSIVE_LEVEL IRQL, it must be freed at that
IRQL. If the buffer was allocated at DISPATCH_LEVEL IRQL, it can be
freed at either DISPATCH_LEVEL IRQL or PASSIVE_LEVEL IRQL. To call
this function in kernel mode, use Cng.lib, which is part of the
Driver Development Kit (DDK). Windows Server 2008 and Windows Vista:
To call this function in kernel mode, use Ksecdd.lib.


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
BCryptGenerateKeyPair
Creates an empty public/private key pair.
%group
Win32 bcrypt
%prm
hAlgorithm, phKey, dwLength, dwFlags
hAlgorithm : [int] Handle of an algorithm provider that supports signing, asymmetric encryption, or key agreement. This handle must have been created by using the BCryptOpenAlgorithmProvider function.
phKey : [var] A pointer to a BCRYPT_KEY_HANDLE that receives the handle of the key. This handle is used in subsequent functions that require a key, such as BCryptEncrypt. This handle must be released when it is no longer needed by passing it to the BCryptDestroyKey function.
dwLength : [int] The length, in bits, of the key. Algorithm providers have different key size restrictions for each standard asymmetric algorithm.
dwFlags : [int] A set of flags that modify the behavior of this function. No flags are currently defined, so this parameter should be zero.
%inst
Creates an empty public/private key pair.

[戻り値]
Returns a status code that indicates the success or failure of the
function.
Possible return codes include, but are not limited to, the following.
This doc was truncated.

[備考]
Depending on what processor modes a provider supports,
BCryptGenerateKeyPair can be called either from user mode or kernel
mode. Kernel mode callers can execute either at PASSIVE_LEVEL IRQL or
DISPATCH_LEVEL IRQL. If the current IRQL level is DISPATCH_LEVEL, the
handle provided in the hAlgorithm parameter must have been opened by
using the BCRYPT_PROV_DISPATCH flag, and any pointers passed to the
BCryptGenerateKeyPair function must refer to nonpaged (or locked)
memory. To call this function in kernel mode, use Cng.lib, which is
part of the Driver Development Kit (DDK). Windows Server 2008 and
Windows Vista: To call this function in kernel mode, use Ksecdd.lib.


%index
BCryptGenerateSymmetricKey
Creates a key object for use with a symmetrical key encryption algorithm from a supplied key.
%group
Win32 bcrypt
%prm
hAlgorithm, phKey, pbKeyObject, cbKeyObject, pbSecret, cbSecret, dwFlags
hAlgorithm : [int] The handle of an algorithm provider created with the BCryptOpenAlgorithmProvider function. The algorithm specified when the provider was created must support symmetric key encryption.
phKey : [var] A pointer to a BCRYPT_KEY_HANDLE that receives the handle of the key. This handle is used in subsequent functions that require a key, such as BCryptEncrypt. This handle must be released when it is no longer needed by passing it to the BCryptDestroyKey function.
pbKeyObject : [var] A pointer to a buffer that receives the key object. The cbKeyObject parameter contains the size of this buffer. The required size of this buffer can be obtained by calling the BCryptGetProperty function to get the BCRYPT_OBJECT_LENGTH property. This will provide the size of the key object for the specified algorithm. This memory can only be freed after the phKey key handle is destroyed. If the value of this parameter is NULL and the value of the cbKeyObject parameter is zero, the memory for the key object is allocated and freed by this function.Windows?7:??This memory management functionality is available beginning with Windows?7.
cbKeyObject : [int] The size, in bytes, of the pbKeyObject buffer. If the value of this parameter is zero and the value of the pbKeyObject parameter is NULL, the memory for the key object is allocated and freed by this function.Windows?7:??This memory management functionality is available beginning with Windows?7.
pbSecret : [var] Pointer to a buffer that contains the key from which to create the key object. The cbSecret parameter contains the size of this buffer. This is normally a hash of a password or some other reproducible data. If the data passed in exceeds the target key size, the data will be truncated and the excess will be ignored. Note??We strongly recommended that applications pass in the exact number of bytes required by the target key.
cbSecret : [int] The size, in bytes, of the pbSecret buffer.
dwFlags : [int] A set of flags that modify the behavior of this function. No flags are currently defined, so this parameter should be zero.
%inst
Creates a key object for use with a symmetrical key encryption
algorithm from a supplied key.

[戻り値]
Returns a status code that indicates the success or failure of the
function.
Possible return codes include, but are not limited to, the following.
This doc was truncated.

[備考]
Depending on what processor modes a provider supports,
BCryptGenerateSymmetricKey can be called either from user mode or
kernel mode. Kernel mode callers can execute either at PASSIVE_LEVEL
IRQL or DISPATCH_LEVEL IRQL. If the current IRQL level is
DISPATCH_LEVEL, the handle provided in the hAlgorithm parameter must
have been opened by using the BCRYPT_PROV_DISPATCH flag, and any
pointers passed to the BCryptGenerateSymmetricKey function must refer
to nonpaged (or locked) memory. To call this function in kernel mode,
use Cng.lib, which is part of the Driver Development Kit (DDK).
Windows Server 2008 and Windows Vista: To call this function in
kernel mode, use Ksecdd.lib.


%index
BCryptGetFipsAlgorithmMode
Determines whether Federal Information Processing Standard (FIPS) compliance is enabled.
%group
Win32 bcrypt
%prm
pfEnabled
pfEnabled : [var] The address of a BOOLEAN variable that receives zero if FIPS compliance is not enabled, or a nonzero value if FIPS compliance is enabled.
%inst
Determines whether Federal Information Processing Standard (FIPS)
compliance is enabled.

[戻り値]
Returns a status code that indicates the success or failure of the
function.
Possible return codes include, but are not limited to, the following.
This doc was truncated.

[備考]
BCryptGetFipsAlgorithmMode can be called either from user mode or
kernel mode. Kernel mode callers must be executing at PASSIVE_LEVEL
IRQL.


%index
BCryptGetProperty
Retrieves the value of a named property for a CNG object.
%group
Win32 bcrypt
%prm
hObject, pszProperty, pbOutput, cbOutput, pcbResult, dwFlags
hObject : [int] A handle that represents the CNG object to obtain the property value for.
pszProperty : [wstr] A pointer to a null-terminated Unicode string that contains the name of the property to retrieve. This can be one of the predefined Cryptography Primitive Property Identifiers or a custom property identifier.
pbOutput : [var] The address of a buffer that receives the property value. The cbOutput parameter contains the size of this buffer.
cbOutput : [int] The size, in bytes, of the pbOutput buffer.
pcbResult : [var] A pointer to a ULONG variable that receives the number of bytes that were copied to the pbOutput buffer. If the pbOutput parameter is NULL, this function will place the required size, in bytes, in the location pointed to by this parameter.
dwFlags : [int] A set of flags that modify the behavior of this function. No flags are defined for this function.
%inst
Retrieves the value of a named property for a CNG object.

[戻り値]
Returns a status code that indicates the success or failure of the
function.
Possible return codes include, but are not limited to, the following.
This doc was truncated.

[備考]
To obtain the required size for a property, pass NULL for the
pbOutput parameter. This function will place the required size, in
bytes, in the value pointed to by the pcbResult parameter. Depending
on what processor modes a provider supports, BCryptGetProperty can be
called either from user mode or kernel mode. Kernel mode callers can
execute either at PASSIVE_LEVEL IRQL or DISPATCH_LEVEL IRQL. If the
current IRQL level is DISPATCH_LEVEL, any pointers passed to the
BCryptGetProperty function must refer to nonpaged (or locked) memory.
If the object specified in the hObject parameter is a handle, it must
have been opened by using the BCRYPT_PROV_DISPATCH flag. To call this
function in kernel mode, use Cng.lib, which is part of the Driver
Development Kit (DDK). Windows Server 2008 and Windows Vista: To call
this function in kernel mode, use Ksecdd.lib.


%index
BCryptHash
Performs a single hash computation. This is a convenience function that wraps calls to BCryptCreateHash, BCryptHashData, BCryptFinishHash, and BCryptDestroyHash.
%group
Win32 bcrypt
%prm
hAlgorithm, pbSecret, cbSecret, pbInput, cbInput, pbOutput, cbOutput
hAlgorithm : [int] The handle of an algorithm provider created by using the BCryptOpenAlgorithmProvider function. The algorithm that was specified when the provider was created must support the hash interface.
pbSecret : [var] A pointer to a buffer that contains the key to use for the hash or MAC. The cbSecret parameter contains the size of this buffer. This key only applies to hash algorithms opened by the BCryptOpenAlgorithmProvider function by using the BCRYPT_ALG_HANDLE_HMAC flag.  Otherwise, set this parameter to NULL
cbSecret : [int] The size, in bytes, of the pbSecret buffer. If no key is used, set this parameter to zero.
pbInput : [var] A pointer to a buffer that contains the data to process. The cbInput parameter contains the number of bytes in this buffer. This function does not modify the contents of this buffer.
cbInput : [int] The number of bytes in the pbInput buffer.
pbOutput : [var] A pointer to a buffer that receives the hash or MAC value. The cbOutput parameter contains the size of this buffer.
cbOutput : [int] The size, in bytes, of the pbOutput buffer. This size must exactly match the size of the hash or MAC value. The size can be obtained by calling the BCryptGetProperty function to get the BCRYPT_HASH_LENGTH property. This will provide the size of the hash or MAC value for the specified algorithm.
%inst
Performs a single hash computation. This is a convenience function
that wraps calls to BCryptCreateHash, BCryptHashData,
BCryptFinishHash, and BCryptDestroyHash.

[戻り値]
A status code indicating success or failure.


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
BCryptImportKey
Imports a symmetric key from a key BLOB.
%group
Win32 bcrypt
%prm
hAlgorithm, hImportKey, pszBlobType, phKey, pbKeyObject, cbKeyObject, pbInput, cbInput, dwFlags
hAlgorithm : [int] The handle of the algorithm provider to import the key. This handle is obtained by calling the BCryptOpenAlgorithmProvider function.
hImportKey : [int] The handle of the key encryption key needed to unwrap the key BLOB in the pbInput parameter.Note??The handle must be supplied by the same provider that supplied the key that is being imported.
pszBlobType : [wstr] 
phKey : [var] A pointer to a BCRYPT_KEY_HANDLE that receives the handle of the imported key. This handle is used in subsequent functions that require a key, such as BCryptEncrypt. This handle must be released when it is no longer needed by passing it to the BCryptDestroyKey function.
pbKeyObject : [var] A pointer to a buffer that receives the imported key object. The cbKeyObject parameter contains the size of this buffer. The required size of this buffer can be obtained by calling the BCryptGetProperty function to get the BCRYPT_OBJECT_LENGTH property. This will provide the size of the key object for the specified algorithm. This memory can only be freed after the phKey key handle is destroyed.
cbKeyObject : [int] The size, in bytes, of the pbKeyObject buffer.
pbInput : [var] The address of a buffer that contains the key BLOB to import. The cbInput parameter contains the size of this buffer. The pszBlobType parameter specifies the type of key BLOB this buffer contains.
cbInput : [int] The size, in bytes, of the pbInput buffer.
dwFlags : [int] A set of flags that modify the behavior of this function. No flags are currently defined, so this parameter should be zero.
%inst
Imports a symmetric key from a key BLOB.

[戻り値]
Returns a status code that indicates the success or failure of the
function.
Possible return codes include, but are not limited to, the following.
This doc was truncated.

[備考]
Depending on what processor modes a provider supports,
BCryptImportKey can be called either from user mode or kernel mode.
Kernel mode callers can execute either at PASSIVE_LEVEL IRQL or
DISPATCH_LEVEL IRQL. If the current IRQL level is DISPATCH_LEVEL, the
handle provided in the hAlgorithm parameter must have been opened by
using the BCRYPT_PROV_DISPATCH flag, and any pointers passed to the
BCryptImportKey function must refer to nonpaged (or locked) memory.
To call this function in kernel mode, use Cng.lib, which is part of
the Driver Development Kit (DDK). Windows Server 2008 and Windows
Vista: To call this function in kernel mode, use Ksecdd.lib.


%index
BCryptImportKeyPair
Imports a public/private key pair from a key BLOB.
%group
Win32 bcrypt
%prm
hAlgorithm, hImportKey, pszBlobType, phKey, pbInput, cbInput, dwFlags
hAlgorithm : [int] The handle of the algorithm provider to import the key. This handle is obtained by calling the BCryptOpenAlgorithmProvider function.
hImportKey : [int] This parameter is not currently used and should be NULL.
pszBlobType : [wstr] 
phKey : [var] A pointer to a BCRYPT_KEY_HANDLE that receives the handle of the imported key. This handle is used in subsequent functions that require a key, such as BCryptSignHash. This handle must be released when it is no longer needed by passing it to the BCryptDestroyKey function.
pbInput : [var] The address of a buffer that contains the key BLOB to import. The cbInput parameter contains the size of this buffer. The pszBlobType parameter specifies the type of key BLOB this buffer contains.
cbInput : [int] The size, in bytes, of the pbInput buffer.
dwFlags : [int] A set of flags that modify the behavior of this function. This can be zero or the following value.
%inst
Imports a public/private key pair from a key BLOB.

[戻り値]
Returns a status code that indicates the success or failure of the
function.
Possible return codes include, but are not limited to, the following.
This doc was truncated.

[備考]
Depending on what processor modes a provider supports,
BCryptImportKeyPair can be called either from user mode or kernel
mode. Kernel mode callers can execute either at PASSIVE_LEVEL IRQL or
DISPATCH_LEVEL IRQL. If the current IRQL level is DISPATCH_LEVEL, the
handle provided in the hAlgorithm parameter must have been opened by
using the BCRYPT_PROV_DISPATCH flag, and any pointers passed to the
BCryptImportKeyPair function must refer to nonpaged (or locked)
memory. To call this function in kernel mode, use Cng.lib, which is
part of the Driver Development Kit (DDK). Windows Server 2008 and
Windows Vista: To call this function in kernel mode, use Ksecdd.lib.


%index
BCryptKeyDerivation
Derives a key without requiring a secret agreement.
%group
Win32 bcrypt
%prm
hKey, pParameterList, pbDerivedKey, cbDerivedKey, pcbResult, dwFlags
hKey : [int] Handle of the input key.
pParameterList : [var] Pointer to a  BCryptBufferDesc structure that contains the KDF parameters. This parameter is optional and can be NULL if it is not needed. The parameters can be specific to a key derivation function (KDF) or generic. The following table shows the required and optional parameters for specific KDFs implemented by the Microsoft Primitive provider.
pbDerivedKey : [var] Address of a buffer that receives the key. The cbDerivedKey parameter contains the size of this buffer.
cbDerivedKey : [int] Size, in bytes, of the buffer pointed to by the pbDerivedKey parameter.
pcbResult : [var] Pointer to a variable that receives the number of bytes that were copied to the buffer pointed to by the pbDerivedKey parameter.
dwFlags : [int] Flags that modify the behavior of this function. The following value can be used with the Microsoft Primitive provider.
%inst
Derives a key without requiring a secret agreement.

[戻り値]
Returns a status code that indicates the success or failure of the
function.

[備考]
You can use the following algorithm identifiers in the
BCryptOpenAlgorithmProvider function before calling
BCryptKeyDerivation:
This doc was truncated.


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


%index
BCryptProcessMultiOperations
The BCryptProcessMultiOperations function processes a sequence of operations on a multi-object state.
%group
Win32 bcrypt
%prm
hObject, operationType, pOperations, cbOperations, dwFlags
hObject : [int] *BCRYPT_HANDLE* `[in, out]` A handle to a multi-object state, such as one created by the [BCryptCreateMultiHash](nf-bcrypt-bcryptcreatemultihash.md) function.
operationType : [int] *BCRYPT_MULTI_OPERATION_TYPE* `[in]` One of the **BCRYPT_OPERATION_TYPE_**\* values. Currently the only defined value is **BCRYPT_OPERATION_TYPE_HASH**. This value identifies the *hObject* parameter as a multi-hash object and the *pOperations* pointer as pointing to an array of [BCRYPT_MULTI_HASH_OPERATION](ns-bcrypt-bcrypt_multi_hash_operation.md) elements.
pOperations : [intptr] *PVOID* `[in]` A pointer to an array of operation command structures. For hashing, it is a pointer to an array of [BCRYPT_MULTI_HASH_OPERATION](ns-bcrypt-bcrypt_multi_hash_operation.md) structures.
cbOperations : [int] *ULONG* `[in]` The size, in bytes, of the *pOperations* array.
dwFlags : [int] *ULONG* `[in]` Specify a value of zero (`0`).
%inst
The BCryptProcessMultiOperations function processes a sequence of
operations on a multi-object state.

[戻り値]
Returns a status code that indicates the success or failure of the
function. If the method succeeds, it will return `STATUS_SUCCESS`.
For other **NTSTATUS** values, see [NTSTATUS
Values](/openspecs/windows_protocols/ms-erref/596a1078-e883-4972-9bbc-49e60bebca55).

[備考]
Each element of the *pOperations* array contains instructions for a
particular computation to be performed on a single element of the
multi-object state. The functional behavior of
**BCryptProcessMultiOperations** is equivalent to performing, for
each element in the multi-object state, the computations specified in
the operations array for that element, one at a time, in order. The
relative order of two operations that operate on different elements
of the array is not guaranteed. If an output buffer overlaps an input
or output buffer the result is not deterministic.


%index
BCryptQueryContextConfiguration
Retrieves the current configuration for the specified CNG context.
%group
Win32 bcrypt
%prm
dwTable, pszContext, pcbBuffer, ppBuffer
dwTable : [int] 
pszContext : [wstr] A pointer to a null-terminated Unicode string that contains the identifier of the context to obtain the configuration information for.
pcbBuffer : [var] The address of a ULONG variable that, on entry, contains the size, in bytes, of the buffer pointed to by ppBuffer. If this size is not large enough to hold the context information, this function will fail with STATUS_BUFFER_TOO_SMALL. After this function returns, this variable contains the number of bytes that were copied to the ppBuffer buffer.
ppBuffer : [var] The address of a pointer to a CRYPT_CONTEXT_CONFIG structure that receives the context configuration information retrieved by this function. The value pointed to by the pcbBuffer parameter contains the size of this buffer. If the value pointed to by this parameter is NULL, this function will allocate the required memory. This memory must be freed when it is no longer needed by passing this pointer to the BCryptFreeBuffer function. If this parameter is NULL, this function will place the required size, in bytes, in the variable pointed to by the pcbBuffer parameter and return STATUS_BUFFER_TOO_SMALL. For more information on the usage of this parameter, see Remarks.
%inst
Retrieves the current configuration for the specified CNG context.

[戻り値]
Returns a status code that indicates the success or failure of the
function.
Possible return codes include, but are not limited to, the following.
This doc was truncated.

[備考]
Each context has only one set of configuration information, so
although the ppBuffer parameter appears to be a used as an array,
this function treats this as an array with only one element. The
following example helps clarify how this parameter is used.
This doc was truncated.


%index
BCryptQueryContextFunctionConfiguration
Obtains the cryptographic function configuration information for an existing CNG context.
%group
Win32 bcrypt
%prm
dwTable, pszContext, dwInterface, pszFunction, pcbBuffer, ppBuffer
dwTable : [int] 
pszContext : [wstr] A pointer to a null-terminated Unicode string that contains the identifier of the context to obtain the function configuration information for.
dwInterface : [int] 
pszFunction : [wstr] A pointer to a null-terminated Unicode string that contains the identifier of the cryptographic function to obtain the configuration information for.
pcbBuffer : [var] The address of a ULONG variable that, on entry, contains the size, in bytes, of the buffer pointed to by ppBuffer. If this size is not large enough to hold the context information, this function will fail with STATUS_BUFFER_TOO_SMALL. After this function returns, this variable contains the number of bytes that were copied to the ppBuffer buffer.
ppBuffer : [var] The address of a pointer to a CRYPT_CONTEXT_FUNCTION_CONFIG structure that receives the function configuration information retrieved by this function. The value pointed to by the pcbBuffer parameter contains the size of this buffer. If the value pointed to by this parameter is NULL, this function will allocate the required memory. This memory must be freed when it is no longer needed by passing this pointer to the BCryptFreeBuffer function. If this parameter is NULL, this function will place the required size, in bytes, in the variable pointed to by the pcbBuffer parameter and return STATUS_BUFFER_TOO_SMALL. For more information about the usage of this parameter, see Remarks.
%inst
Obtains the cryptographic function configuration information for an
existing CNG context.

[戻り値]
Returns a status code that indicates the success or failure of the
function.
Possible return codes include, but are not limited to, the following.
This doc was truncated.

[備考]
Each cryptographic function has only one set of configuration
information, so although the ppBuffer parameter appears to be a used
as an array, this function treats this as an array with only one
element. The following example helps clarify how this parameter is
used.
This doc was truncated.


%index
BCryptQueryContextFunctionProperty
Obtains the value of a named property for a cryptographic function in an existing CNG context.
%group
Win32 bcrypt
%prm
dwTable, pszContext, dwInterface, pszFunction, pszProperty, pcbValue, ppbValue
dwTable : [int] 
pszContext : [wstr] A pointer to a null-terminated Unicode string that contains the identifier of the context to obtain the function property from.
dwInterface : [int] 
pszFunction : [wstr] A pointer to a null-terminated Unicode string that contains the identifier of the cryptographic function to obtain the property for.
pszProperty : [wstr] A pointer to a null-terminated Unicode string that contains the identifier of the property to obtain.
pcbValue : [var] The address of a ULONG variable that, on entry, contains the size, in bytes, of the buffer pointed to by ppbValue. If this size is not large enough to hold the property value, this function will fail with STATUS_BUFFER_TOO_SMALL. After this function returns, this variable contains the number of bytes that were copied to the ppbValue buffer.
ppbValue : [var] The address of a pointer to a buffer that receives the property data. The size and format of this buffer depends on the format of the property being retrieved. The value pointed to by the pcbValue parameter contains the size of this buffer. If the value pointed to by this parameter is NULL, this function will allocate the required memory. This memory must be freed when it is no longer needed by passing this pointer to the BCryptFreeBuffer function. If this parameter is NULL, this function will place the required size, in bytes, in the variable pointed to by the pcbValue parameter and return STATUS_BUFFER_TOO_SMALL.
%inst
Obtains the value of a named property for a cryptographic function in
an existing CNG context.

[戻り値]
Returns a status code that indicates the success or failure of the
function.
Possible return codes include, but are not limited to, the following.
This doc was truncated.

[備考]
BCryptQueryContextFunctionProperty can be called only in user mode.


%index
BCryptQueryProviderRegistration
Retrieves information about a CNG provider.
%group
Win32 bcrypt
%prm
pszProvider, dwMode, dwInterface, pcbBuffer, ppBuffer
pszProvider : [wstr] A pointer to a null-terminated Unicode string that contains the name of the provider to obtain information about.
dwMode : [int] 
dwInterface : [int] 
pcbBuffer : [var] A pointer to a ULONG value that, on entry, contains the size, in bytes, of the buffer pointed to by the ppBuffer parameter. On exit, this value receives either the number of bytes copied to the buffer or the required size, in bytes, of the buffer.
ppBuffer : [var] A pointer to a buffer pointer that receives a CRYPT_PROVIDER_REG structure and other data that describes the provider. If this parameter is NULL, this function will return STATUS_BUFFER_TOO_SMALL and place in the value pointed to by the pcbBuffer parameter, the required size, in bytes, of all data. If this parameter is the address of a NULL pointer, this function will allocate the required memory, fill it in with the provider information, and place a pointer to this memory in this parameter. When you have finished using this memory, free it by passing this pointer to the BCryptFreeBuffer function. If this parameter is the address of a non-NULL pointer, this function will copy the provider information into this buffer. The pcbBuffer parameter must contain the size, in bytes, of the entire buffer. If the buffer is not large enough to hold all of the provider information, this function will return STATUS_BUFFER_TOO_SMALL.
%inst
Retrieves information about a CNG provider.

[戻り値]
Returns a status code that indicates the success or failure of the
function.
Possible return codes include, but are not limited to, the following.
This doc was truncated.

[備考]
BCryptQueryProviderRegistration can be called only in user mode.


%index
BCryptRegisterConfigChangeNotify
Creates a user mode CNG configuration change event handler.
%group
Win32 bcrypt
%prm
phEvent
phEvent : [intptr] 
%inst
Creates a user mode CNG configuration change event handler.

[戻り値]
Returns a status code that indicates the success or failure of the
function.
Possible return codes include, but are not limited to, the following.
This doc was truncated.

[備考]
The handle returned in the variable pointed to by the phEvent
parameter will be signaled when a change to the CNG configuration
occurs. BCryptRegisterConfigChangeNotify(HANDLE*) can be called only
in user mode. Code executing in kernel mode must call
BCryptRegisterConfigChangeNotify(PRKEVENT).


%index
BCryptRemoveContextFunction
Removes a cryptographic function from the list of functions that are supported by an existing CNG context.
%group
Win32 bcrypt
%prm
dwTable, pszContext, dwInterface, pszFunction
dwTable : [int] 
pszContext : [wstr] A pointer to a null-terminated Unicode string that contains the identifier of the context to remove the function from.
dwInterface : [int] 
pszFunction : [wstr] A pointer to a null-terminated Unicode string that contains the identifier of the cryptographic function to remove.
%inst
Removes a cryptographic function from the list of functions that are
supported by an existing CNG context.

[戻り値]
Returns a status code that indicates the success or failure of the
function.
Possible return codes include, but are not limited to, the following.
This doc was truncated.

[備考]
BCryptRemoveContextFunction can be called only in user mode.


%index
BCryptResolveProviders
Obtains a collection of all of the providers that meet the specified criteria.
%group
Win32 bcrypt
%prm
pszContext, dwInterface, pszFunction, pszProvider, dwMode, dwFlags, pcbBuffer, ppBuffer
pszContext : [wstr] A pointer to a null-terminated Unicode string that contains the identifier of the context for which to obtain the providers.  If this is set to NULL or to an empty string, the default context is assumed.
dwInterface : [int] The identifier of an interface that the provider must support. This must be one of the CNG Interface Identifiers. If the pszFunction parameter is not NULL or an empty string, you can set dwInterface to zero to force the function to infer the interface.
pszFunction : [wstr] A pointer to a null-terminated Unicode string that contains the algorithm or function identifier that the provider must support. This can be one of the standard CNG Algorithm Identifiers or the identifier for another registered algorithm.  If dwInterface is set to a nonzero value, then pszFunction can be NULL to include all algorithms and functions.
pszProvider : [wstr] A pointer to a null-terminated Unicode string that contains the name of the provider to retrieve. If this parameter is NULL, then all providers will be included. This parameter allows you to specify a specific provider to retrieve in the event that more than one provider meets the other criteria.
dwMode : [int] 
dwFlags : [int] A set of flags that modify the behavior of this function.
pcbBuffer : [var] A pointer to a DWORD value that, on entry, contains the size, in bytes, of the buffer pointed to by the ppBuffer parameter. On exit, this value receives either the number of bytes copied to the buffer or the required size, in bytes, of the buffer.
ppBuffer : [var] The address of a CRYPT_PROVIDER_REFS pointer that receives the collection of providers that meet the specified criteria. If this parameter is NULL, this function will return STATUS_SUCCESS and place in the value pointed to by the pcbBuffer parameter, the required size, in bytes, of all the data. If this parameter is the address of a NULL pointer, this function will allocate the required memory, fill the memory with the information about the providers, and place the pointer to this memory in this parameter. When you have finished using this memory,  free it by passing this pointer to the BCryptFreeBuffer function. If this parameter is the address of a non-NULL pointer, this function will copy the provider information into this buffer. The pcbBuffer parameter must contain the size, in bytes, of the entire buffer. If the buffer is not large enough to hold all of the provider information, this function will return STATUS_BUFFER_TOO_SMALL.
%inst
Obtains a collection of all of the providers that meet the specified
criteria.

[戻り値]
Returns a status code that indicates the success or failure of the
function.
Possible return codes include, but are not limited to, the following.
This doc was truncated.

[備考]
BCryptResolveProviders can be called either from user mode or kernel
mode. Kernel mode callers must be executing at PASSIVE_LEVEL IRQL.


%index
BCryptSecretAgreement
Creates a secret agreement value from a private and a public key. (BCryptSecretAgreement)
%group
Win32 bcrypt
%prm
hPrivKey, hPubKey, phAgreedSecret, dwFlags
hPrivKey : [int] The handle of the private key to use to create the secret agreement value. This key and the hPubKey key must come from the same CNG cryptographic algorithm provider.
hPubKey : [int] The handle of the public key to use to create the secret agreement value. This key and the hPrivKey key must come from the same CNG cryptographic algorithm provider.
phAgreedSecret : [var] A pointer to a BCRYPT_SECRET_HANDLE that receives a handle that represents the secret agreement value. This handle must be released by passing it to the BCryptDestroySecret function when it is no longer needed.
dwFlags : [int] A set of flags that modify the behavior of this function. No flags are defined for this function.
%inst
Creates a secret agreement value from a private and a public key.
(BCryptSecretAgreement)

[戻り値]
Returns a status code that indicates the success or failure of the
function.
Possible return codes include, but are not limited to, the following.
This doc was truncated.

[備考]
Depending on what processor modes a provider supports,
BCryptSecretAgreement can be called either from user mode or kernel
mode. Kernel mode callers can execute either at PASSIVE_LEVEL IRQL or
DISPATCH_LEVEL IRQL. If the current IRQL level is DISPATCH_LEVEL, the
handles provided in the hPrivKey and hPubKey parameters must be
derived from an algorithm handle returned by a provider that was
opened by using the BCRYPT_PROV_DISPATCH flag, and any pointers
passed to the BCryptSecretAgreement function must refer to nonpaged
(or locked) memory. To call this function in kernel mode, use
Cng.lib, which is part of the Driver Development Kit (DDK). Windows
Server 2008 and Windows Vista: To call this function in kernel mode,
use Ksecdd.lib.


%index
BCryptSetContextFunctionProperty
Sets the value of a named property for a cryptographic function in an existing CNG context.
%group
Win32 bcrypt
%prm
dwTable, pszContext, dwInterface, pszFunction, pszProperty, cbValue, pbValue
dwTable : [int] 
pszContext : [wstr] A pointer to a null-terminated Unicode string that contains the identifier of the context to set the function property in.
dwInterface : [int] 
pszFunction : [wstr] A pointer to a null-terminated Unicode string that contains the identifier of the cryptographic function to set the property for.
pszProperty : [wstr] A pointer to a null-terminated Unicode string that contains the identifier of the property to set.
cbValue : [int] Contains the size, in bytes, of the pbValue buffer. This is the exact number of bytes that will be stored. If the property value is a string, you should add the size of one character to also store the terminating null character, if needed.
pbValue : [var] The address of a buffer that contains the new property value.
%inst
Sets the value of a named property for a cryptographic function in an
existing CNG context.

[戻り値]
Returns a status code that indicates the success or failure of the
function.
Possible return codes include, but are not limited to, the following.
This doc was truncated.

[備考]
BCryptSetContextFunctionProperty can be called only in user mode.


%index
BCryptSetProperty
Sets the value of a named property for a CNG object.
%group
Win32 bcrypt
%prm
hObject, pszProperty, pbInput, cbInput, dwFlags
hObject : [int] A handle that represents the CNG object to set the property value for.
pszProperty : [wstr] A pointer to a null-terminated Unicode string that contains the name of the property to set. This can be one of the predefined Cryptography Primitive Property Identifiers or a custom property identifier.
pbInput : [var] The address of a buffer that contains the new property value. The cbInput parameter contains the size of this buffer.
cbInput : [int] The size, in bytes, of the pbInput buffer.
dwFlags : [int] A set of flags that modify the behavior of this function. No flags are defined for this function.
%inst
Sets the value of a named property for a CNG object.

[戻り値]
Returns a status code that indicates the success or failure of the
function.
Possible return codes include, but are not limited to, the following.
This doc was truncated.

[備考]
Depending on what processor modes a provider supports,
BCryptSetProperty can be called either from user mode or kernel mode.
Kernel mode callers can execute either at PASSIVE_LEVEL IRQL or
DISPATCH_LEVEL IRQL. If the current IRQL level is DISPATCH_LEVEL, any
pointers passed to BCryptSetProperty must refer to nonpaged (or
locked) memory. If the object specified in the hObject parameter is a
handle, it must have been opened by using the BCRYPT_PROV_DISPATCH
flag. To call this function in kernel mode, use Cng.lib, which is
part of the Driver Development Kit (DDK). Windows Server 2008 and
Windows Vista: To call this function in kernel mode, use Ksecdd.lib.


%index
BCryptSignHash
Creates a signature of a hash value. (BCryptSignHash)
%group
Win32 bcrypt
%prm
hKey, pPaddingInfo, pbInput, cbInput, pbOutput, cbOutput, pcbResult, dwFlags
hKey : [int] The handle of the key to use to sign the hash.
pPaddingInfo : [intptr] A pointer to a structure that contains padding information. The actual type of structure this parameter points to depends on the value of the dwFlags parameter. This parameter is only used with asymmetric keys and must be NULL otherwise.
pbInput : [var] A pointer to a buffer that contains the hash value to sign. The cbInput parameter contains the size of this buffer.
cbInput : [int] The number of bytes in the pbInput buffer to sign.
pbOutput : [var] The address of a buffer to receive the signature produced by this function. The cbOutput parameter contains the size of this buffer. If this parameter is NULL, this function will calculate the size required for the signature and return the size in the location pointed to by the pcbResult parameter.
cbOutput : [int] The size, in bytes, of the pbOutput buffer. This parameter is ignored if the pbOutput parameter is NULL.
pcbResult : [var] A pointer to a ULONG variable that receives the number of bytes copied to the pbOutput buffer. If pbOutput is NULL, this receives the size, in bytes, required for the signature.
dwFlags : [int] A set of flags that modify the behavior of this function. The allowed set of flags depends on the type of key specified by the hKey parameter.
%inst
Creates a signature of a hash value. (BCryptSignHash)

[戻り値]
Returns a status code that indicates the success or failure of the
function.
Possible return codes include, but are not limited to, the following.
This doc was truncated.

[備考]
This function will encrypt the hash value with the specified key to
create the signature. To later verify that the signature is valid,
call the BCryptVerifySignature function with an identical key and an
identical hash of the original data. Depending on what processor
modes a provider supports, BCryptSignHash can be called either from
user mode or kernel mode. Kernel mode callers can execute either at
PASSIVE_LEVEL IRQL or DISPATCH_LEVEL IRQL. If the current IRQL level
is DISPATCH_LEVEL, the handle provided in the hKey parameter must be
derived from an algorithm handle returned by a provider that was
opened with the BCRYPT_PROV_DISPATCH flag, and any pointers passed to
the BCryptSignHash function must refer to nonpaged (or locked)
memory. To call this function in kernel mode, use Cng.lib, which is
part of the Driver Development Kit (DDK). Windows Server 2008 and
Windows Vista: To call this function in kernel mode, use Ksecdd.lib.


%index
BCryptUnregisterConfigChangeNotify
Removes a user mode CNG configuration change event handler that was created by using the BCryptRegisterConfigChangeNotify(HANDLE*) function.
%group
Win32 bcrypt
%prm
hEvent
hEvent : [intptr] 
%inst
Removes a user mode CNG configuration change event handler that was
created by using the BCryptRegisterConfigChangeNotify(HANDLE*)
function.

[戻り値]
Returns a status code that indicates the success or failure of the
function.
Possible return codes include, but are not limited to, the following.
This doc was truncated.

[備考]
BCryptUnregisterConfigChangeNotify(HANDLE) can be called only in user
mode. Code executing in kernel mode must call
BCryptUnregisterConfigChangeNotify(PRKEVENT).


%index
BCryptVerifySignature
Verifies that the specified signature matches the specified hash. (BCryptVerifySignature)
%group
Win32 bcrypt
%prm
hKey, pPaddingInfo, pbHash, cbHash, pbSignature, cbSignature, dwFlags
hKey : [int] The handle of the key to use to decrypt the signature. This must be an identical key or the public key portion of the key pair used to sign the data with the BCryptSignHash function.
pPaddingInfo : [intptr] A pointer to a structure that contains padding information. The actual type of structure this parameter points to depends on the value of the dwFlags parameter. This parameter is only used with asymmetric keys and must be NULL otherwise.
pbHash : [var] The address of a buffer that contains the hash of the data. The cbHash parameter contains the size of this buffer.
cbHash : [int] The size, in bytes, of the pbHash buffer.
pbSignature : [var] The address of a buffer that contains the signed hash of the data. The BCryptSignHash function is used to create the signature. The cbSignature parameter contains the size of this buffer.
cbSignature : [int] The size, in bytes, of the pbSignature buffer. The BCryptSignHash function is used to create the signature.
dwFlags : [int] A set of flags that modify the behavior of this function. The allowed set of flags depends on the type of key specified by the hKey parameter. If the key is a symmetric key, this parameter is not used and should be zero.
%inst
Verifies that the specified signature matches the specified hash.
(BCryptVerifySignature)

[戻り値]
Returns a status code that indicates the success or failure of the
function.
Possible return codes include, but are not limited to, the following.
This doc was truncated.

[備考]
This function calculates the signature with provided key and then
compares calculated signature value to the specified signature value.
To use this function, you must hash the data by using the same
hashing algorithm that was used to create the hash value that was
signed. If applicable, you must also specify the same padding scheme
that was specified when the signature was created. Depending on what
processor modes a provider supports, BCryptVerifySignature can be
called either from user mode or kernel mode. Kernel mode callers can
execute either at PASSIVE_LEVEL IRQL or DISPATCH_LEVEL IRQL. If the
current IRQL level is DISPATCH_LEVEL, the handle provided in the hKey
parameter must be derived from an algorithm handle returned by a
provider that was opened by using the BCRYPT_PROV_DISPATCH flag, and
any pointers passed to the BCryptVerifySignature function must refer
to nonpaged (or locked) memory. To call this function in kernel mode,
use Cng.lib, which is part of the Driver Development Kit (DDK).
Windows Server 2008 and Windows Vista: To call this function in
kernel mode, use Ksecdd.lib.

