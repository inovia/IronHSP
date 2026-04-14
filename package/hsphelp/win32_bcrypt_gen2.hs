; ============================================================
;   bcrypt.dll ヘルプ (CsWin32 / win32metadata から自動抽出)
;   docs_ja.json に日本語訳があればそちらを使用、無ければ英語原文。
;   翻訳を追加するときは docs_ja.json を編集して再生成。
; ============================================================

%index
BCryptDestroyHash
Destroys a hash or Message Authentication Code (MAC) object.
%group
Win32 bcrypt
%prm
hHash
hHash : [int] The handle of the hash or MAC object to destroy. This handle is obtained by using the BCryptCreateHash function.
%inst
Destroys a hash or Message Authentication Code (MAC) object.

[戻り値]
Returns a status code that indicates the success or failure of the
function.
Possible return codes include, but are not limited to, the following.
This doc was truncated.

[備考]
Depending on what processor modes a provider supports,
BCryptDestroyHash can be called either from user mode or kernel mode.
Kernel mode callers can execute either at PASSIVE_LEVEL IRQL or
DISPATCH_LEVEL IRQL. If the current IRQL level is DISPATCH_LEVEL, the
handle provided in the hHash parameter must be derived from an
algorithm handle returned by a provider that was opened by using the
BCRYPT_PROV_DISPATCH flag. To call this function in kernel mode, use
Cng.lib, which is part of the Driver Development Kit (DDK). Windows
Server 2008 and Windows Vista: To call this function in kernel mode,
use Ksecdd.lib.


%index
BCryptCloseAlgorithmProvider
Closes an algorithm provider.
%group
Win32 bcrypt
%prm
hAlgorithm, dwFlags
hAlgorithm : [int] A handle that represents the algorithm provider to close. This handle is obtained by calling the BCryptOpenAlgorithmProvider function.
dwFlags : [int] A set of flags that modify the behavior of this function. No flags are defined for this function.
%inst
Closes an algorithm provider.

[戻り値]
Returns a status code that indicates the success or failure of the
function.
Possible return codes include, but are not limited to, the following.
This doc was truncated.

[備考]
BCryptCloseAlgorithmProvider can be called either from user mode or
kernel mode. Kernel mode callers must be executing at PASSIVE_LEVEL
IRQL. To call this function in kernel mode, use Cng.lib, which is
part of the Driver Development Kit (DDK). For more information, see
WDK and Developer Tools.Windows Server 2008 and Windows Vista: To
call this function in kernel mode, use Ksecdd.lib.


%index
BCryptCreateHash
Called to create a hash or Message Authentication Code (MAC) object.
%group
Win32 bcrypt
%prm
hAlgorithm, phHash, pbHashObject, cbHashObject, pbSecret, cbSecret, dwFlags
hAlgorithm : [int] The handle of an algorithm provider created by using the BCryptOpenAlgorithmProvider function. The algorithm that was specified when the provider was created must support the hash interface.
phHash : [var] A pointer to a BCRYPT_HASH_HANDLE value that receives a handle that represents the hash or MAC object. This handle is used in subsequent hashing or MAC functions, such as the BCryptHashData function. When you have finished using this handle, release it by passing it to the BCryptDestroyHash function.
pbHashObject : [var] A pointer to a buffer that receives the hash or MAC object. The cbHashObject parameter contains the size of this buffer. The required size of this buffer can be obtained by calling the BCryptGetProperty function to get the BCRYPT_OBJECT_LENGTH property. This will provide the size of the hash or MAC object for the specified algorithm. This memory can only be freed after the handle pointed to by the phHash parameter is destroyed. If the value of this parameter is NULL and the value of the cbHashObject parameter is zero, the memory for the hash object is allocated and freed by this function. Windows?7: This memory management functionality is available beginning with Windows?7.
cbHashObject : [int] The size, in bytes, of the pbHashObject buffer. If the value of this parameter is zero and the value of the pbHashObject parameter is NULL, the memory for the key object is allocated and freed by this function. Windows?7: This memory management functionality is available beginning with Windows?7.
pbSecret : [var] A pointer to a buffer that contains the key to use for the hash or MAC. The cbSecret parameter contains the size of this buffer. This key only applies to hash algorithms opened by the BCryptOpenAlgorithmProvider function by using the BCRYPT_ALG_HANDLE_HMAC flag.  Otherwise, set this parameter to NULL.
cbSecret : [int] The size, in bytes, of the pbSecret buffer. If no key is used, set this parameter to zero.
dwFlags : [int] Flags that modify the behavior of the function. This can be zero or the following value.
%inst
Called to create a hash or Message Authentication Code (MAC) object.

[戻り値]
Returns a status code that indicates the success or failure of the
function.
Possible return codes include, but are not limited to, the following.
This doc was truncated.

[備考]
Depending on what processor modes a provider supports,
BCryptCreateHash can be called either from user mode or kernel mode.
Kernel mode callers can execute either at PASSIVE_LEVEL IRQL or
DISPATCH_LEVEL IRQL. If the current IRQL level is DISPATCH_LEVEL, the
handle provided in the hAlgorithm parameter must have been opened by
using the BCRYPT_PROV_DISPATCH flag, and any pointers passed to the
BCryptCreateHash function must refer to nonpaged (or locked) memory.
To call this function in kernel mode, use Cng.lib, which is part of
the Driver Development Kit (DDK). For more information, see WDK and
Developer Tools.Windows Server 2008 and Windows Vista: To call this
function in kernel mode, use Ksecdd.lib.


%index
BCryptDestroyKey
Destroys a key.
%group
Win32 bcrypt
%prm
hKey
hKey : [int] The handle of the key to destroy.
%inst
Destroys a key.

[戻り値]
Returns a status code that indicates the success or failure of the
function.
Possible return codes include, but are not limited to, the following.
This doc was truncated.

[備考]
Depending on what processor modes a provider supports,
BCryptDestroyKey can be called either from user mode or kernel mode.
Kernel mode callers can execute either at PASSIVE_LEVEL IRQL or
DISPATCH_LEVEL IRQL. If the current IRQL level is DISPATCH_LEVEL, the
handle provided in the hKey parameter must be derived from an
algorithm handle returned by a provider that was opened with the
BCRYPT_PROV_DISPATCH flag. To call this function in kernel mode, use
Cng.lib, which is part of the Driver Development Kit (DDK). Windows
Server 2008 and Windows Vista: To call this function in kernel mode,
use Ksecdd.lib.


%index
BCryptDecrypt
Decrypts a block of data.
%group
Win32 bcrypt
%prm
hKey, pbInput, cbInput, pPaddingInfo, pbIV, cbIV, pbOutput, cbOutput, pcbResult, dwFlags
hKey : [int] The handle of the key to use to decrypt the data. This handle is obtained from one of the key creation functions, such as BCryptGenerateSymmetricKey, BCryptGenerateKeyPair, or BCryptImportKey.
pbInput : [var] The address of a buffer that contains the ciphertext to be decrypted. The cbInput parameter contains the size of the ciphertext to decrypt. For more information, see Remarks.
cbInput : [int] The number of bytes in the pbInput buffer to decrypt.
pPaddingInfo : [intptr] A pointer to a structure that contains padding information. This parameter is only used with asymmetric keys and authenticated encryption modes. If an  authenticated encryption mode is used, this parameter must point to a BCRYPT_AUTHENTICATED_CIPHER_MODE_INFO structure. If asymmetric keys are used, the type of structure this parameter points to is determined by the value of the dwFlags parameter. Otherwise, the parameter  must be set to NULL.
pbIV : [var] The address of a buffer that contains the initialization vector (IV) to use during decryption. The cbIV parameter contains the size of this buffer. This function will modify the contents of this buffer. If you need to reuse the IV later, make sure you make a copy of this buffer before calling this function. This parameter is optional and can be NULL if no IV is used. The required size of the IV can be obtained by calling the BCryptGetProperty function to get the BCRYPT_BLOCK_LENGTH property. This will provide the size of a block for the algorithm, which is also the size of the IV.
cbIV : [int] The size, in bytes, of the pbIV buffer.
pbOutput : [var] The address of a buffer to receive the plaintext produced by this function. The cbOutput parameter contains the size of this buffer. For more information, see Remarks. If this parameter is NULL, the BCryptDecrypt  function calculates the size required for the plaintext of the encrypted data passed in the pbInput parameter. In this case, the location pointed to by the pcbResult parameter contains this size, and the function returns STATUS_SUCCESS. If the values of both the pbOutput and pbInput parameters are NULL, an error is returned unless  an authenticated encryption algorithm is in use. In the latter case, the call is treated as an authenticated encryption call with zero length data, and the authentication tag, passed in the pPaddingInfo parameter, is verified.
cbOutput : [int] The size, in bytes, of the pbOutput buffer. This parameter is ignored if the pbOutput parameter is NULL.
pcbResult : [var] A pointer to a ULONG variable to receive the number of bytes copied to the pbOutput buffer. If pbOutput is NULL, this receives the size, in bytes, required for the plaintext.
dwFlags : [int] A set of flags that modify the behavior of this function. The allowed set of flags depends on the type of key specified by the hKey parameter.
%inst
Decrypts a block of data.

[戻り値]
Returns a status code that indicates the success or failure of the
function.
Possible return codes include, but are not limited to, the following.
This doc was truncated.

[備考]
The pbInput and pbOutput parameters can be equal. In this case, this
function will perform the decryption in place. If pbInput and
pbOutput are not equal, the two buffers may not overlap. Depending on
what processor modes a provider supports, BCryptDecrypt can be called
either from user mode or kernel mode. Kernel mode callers can execute
either at PASSIVE_LEVEL IRQL or DISPATCH_LEVEL IRQL. If the current
IRQL level is DISPATCH_LEVEL, the handle provided in the hKey
parameter must be derived from an algorithm handle returned by a
provider that was opened with the BCRYPT_PROV_DISPATCH flag, and any
pointers passed to the BCryptDecrypt function must refer to nonpaged
(or locked) memory. To call this function in kernel mode, use
Cng.lib, which is part of the Driver Development Kit (DDK). Windows
Server 2008 and Windows Vista: To call this function in kernel mode,
use Ksecdd.lib.


%index
BCryptEncrypt
Encrypts a block of data. (BCryptEncrypt)
%group
Win32 bcrypt
%prm
hKey, pbInput, cbInput, pPaddingInfo, pbIV, cbIV, pbOutput, cbOutput, pcbResult, dwFlags
hKey : [int] The handle of the key to use to encrypt the data. This handle is obtained from one of the key creation functions, such as BCryptGenerateSymmetricKey, BCryptGenerateKeyPair, or BCryptImportKey.
pbInput : [var] The address of a buffer that contains the plaintext to be encrypted. The cbInput parameter contains the size of the plaintext to encrypt. For more information, see Remarks.
cbInput : [int] The number of bytes in the pbInput buffer to encrypt.
pPaddingInfo : [intptr] A pointer to a structure that contains padding information. This parameter is only used with asymmetric keys and authenticated encryption modes. If an  authenticated encryption mode is used, this parameter must point to a BCRYPT_AUTHENTICATED_CIPHER_MODE_INFO structure. If asymmetric keys are used, the type of structure this parameter points to is determined by the value of the dwFlags parameter. Otherwise, the parameter  must be set to NULL.
pbIV : [var] The address of a buffer that contains the initialization vector (IV) to use during encryption. The cbIV parameter contains the size of this buffer. This function will modify the contents of this buffer. If you need to reuse the IV later, make sure you make a copy of this buffer before calling this function. This parameter is optional and can be NULL if no IV is used. The required size of the IV can be obtained by calling the BCryptGetProperty function to get the BCRYPT_BLOCK_LENGTH property. This will provide the size of a block for the algorithm, which is also the size of the IV.
cbIV : [int] The size, in bytes, of the pbIV buffer.
pbOutput : [var] The address of the buffer that receives the ciphertext produced by this function. The cbOutput parameter contains the size of this buffer. For more information, see Remarks. If this parameter is NULL, the BCryptEncrypt function calculates the size needed for the ciphertext of the data passed in the pbInput parameter. In this case, the location pointed to by the pcbResult parameter contains this size, and the  function returns STATUS_SUCCESS. The pPaddingInfo parameter is not modified. If the values of both the pbOutput and pbInput parameters are NULL, an error is returned unless  an authenticated encryption algorithm is in use. In the latter case, the call is treated as an authenticated encryption call with zero length data, and the authentication tag is returned in the pPaddingInfo parameter.
cbOutput : [int] The size, in bytes, of the pbOutput buffer. This parameter is ignored if the pbOutput parameter is NULL.
pcbResult : [var] A pointer to a ULONG variable that receives the number of bytes copied to the pbOutput buffer. If pbOutput is NULL, this receives the size, in bytes, required for the ciphertext.
dwFlags : [int] A set of flags that modify the behavior of this function. The allowed set of flags depends on the type of key specified by the hKey parameter.
%inst
Encrypts a block of data. (BCryptEncrypt)

[戻り値]
Returns a status code that indicates the success or failure of the
function.
Possible return codes include, but are not limited to, the following.
This doc was truncated.

[備考]
The pbInput and pbOutput parameters can be equal. In this case, this
function will perform the encryption in place. It is possible that
the encrypted data size will be larger than the unencrypted data
size, so the buffer must be large enough to hold the encrypted data.
If pbInput and pbOutput are not equal then the two buffers may not
overlap. Depending on what processor modes a provider supports,
BCryptEncrypt can be called either from user mode or kernel mode.
Kernel mode callers can execute either at PASSIVE_LEVEL IRQL or
DISPATCH_LEVEL IRQL. If the current IRQL level is DISPATCH_LEVEL, the
handle provided in the hKey parameter must be derived from an
algorithm handle returned by a provider that was opened with the
BCRYPT_PROV_DISPATCH flag, and any pointers passed to the
BCryptEncrypt function must refer to nonpaged (or locked) memory. To
call this function in kernel mode, use Cng.lib, which is part of the
Driver Development Kit (DDK). Windows Server 2008 and Windows Vista:
To call this function in kernel mode, use Ksecdd.lib.


%index
BCryptFinishHash
Retrieves the hash or Message Authentication Code (MAC) value for the data accumulated from prior calls to BCryptHashData.
%group
Win32 bcrypt
%prm
hHash, pbOutput, cbOutput, dwFlags
hHash : [int] The handle of the hash or MAC object to use to compute the hash or MAC. This handle is obtained by calling the BCryptCreateHash function. After this function has been called, the hash handle passed to this function cannot be used again except in a call to BCryptDestroyHash.
pbOutput : [var] A pointer to a buffer that receives the hash or MAC value. The cbOutput parameter contains the size of this buffer.
cbOutput : [int] The size, in bytes, of the pbOutput buffer. This size must exactly match the size of the hash or MAC value. The size can be obtained by calling the BCryptGetProperty function to get the BCRYPT_HASH_LENGTH property. This will provide the size of the hash or MAC value for the specified algorithm.
dwFlags : [int] A set of flags that modify the behavior of this function. No flags are currently defined, so this parameter should be zero.
%inst
Retrieves the hash or Message Authentication Code (MAC) value for the
data accumulated from prior calls to BCryptHashData.

[戻り値]
Returns a status code that indicates the success or failure of the
function.
Possible return codes include, but are not limited to, the following.
This doc was truncated.

[備考]
Depending on what processor modes a provider supports,
BCryptFinishHash can be called either from user mode or kernel mode.
Kernel mode callers can execute either at PASSIVE_LEVEL IRQL or
DISPATCH_LEVEL IRQL. If the current IRQL level is DISPATCH_LEVEL, the
handle provided in the hHash parameter must be derived from an
algorithm handle returned by a provider that was opened by using the
BCRYPT_PROV_DISPATCH flag, and any pointers passed to the
BCryptFinishHash function must refer to nonpaged (or locked) memory.
To call this function in kernel mode, use Cng.lib, which is part of
the Driver Development Kit (DDK). Windows Server 2008 and Windows
Vista: To call this function in kernel mode, use Ksecdd.lib.


%index
BCryptGenRandom
Generates a random number.
%group
Win32 bcrypt
%prm
hAlgorithm, pbBuffer, cbBuffer, dwFlags
hAlgorithm : [int] The handle of an algorithm provider created by using the BCryptOpenAlgorithmProvider function. The algorithm that was specified when the provider was created must support the random number generator interface.
pbBuffer : [var] The address of a buffer that receives the random number. The size of this buffer is specified by the cbBuffer parameter.
cbBuffer : [int] The size, in bytes, of the pbBuffer buffer.
dwFlags : [int] A set of flags that modify the behavior of this function. This parameter can be zero or the following value.
%inst
Generates a random number.

[戻り値]
Returns a status code that indicates the success or failure of the
function.
Possible return codes include, but are not limited to, the following.
This doc was truncated.

[備考]
The default random number provider implements an algorithm for
generating random numbers that complies with the NIST SP800-90
standard, specifically the CTR_DRBG portion of that standard. Windows
Vista: Prior to Windows Vista with Service Pack 1 (SP1) the default
random number provider implements an algorithm for generating random
numbers that complies with the FIPS 186-2 standard. Depending on what
processor modes a provider supports, BCryptGenRandom can be called
either from user mode or kernel mode. Kernel mode callers can execute
either at PASSIVE_LEVEL IRQL or DISPATCH_LEVEL IRQL. If the current
IRQL level is DISPATCH_LEVEL, the handle provided in the hAlgorithm
parameter must have been opened by using the BCRYPT_PROV_DISPATCH
flag, and any pointers passed to the BCryptGenRandom function must
refer to nonpaged (or locked) memory.Windows Vista: The Microsoft
provider does not support calling at DISPATCH_LEVEL.
To call this function in kernel mode, use Cng.lib, which is part of
the Driver Development Kit (DDK). Windows Server 2008 and Windows
Vista: To call this function in kernel mode, use Ksecdd.lib.


%index
BCryptHashData
Performs a one way hash or Message Authentication Code (MAC) on a data buffer.
%group
Win32 bcrypt
%prm
hHash, pbInput, cbInput, dwFlags
hHash : [int] The handle of the hash or MAC object to use to perform the operation. This handle is obtained by calling the BCryptCreateHash function.
pbInput : [var] A pointer to a buffer that contains the data to process. The cbInput parameter contains the number of bytes in this buffer. This function does not modify the contents of this buffer.
cbInput : [int] The number of bytes in the pbInput buffer.
dwFlags : [int] A set of flags that modify the behavior of this function. No flags are currently defined, so this parameter should be zero.
%inst
Performs a one way hash or Message Authentication Code (MAC) on a
data buffer.

[戻り値]
Returns a status code that indicates the success or failure of the
function.
Possible return codes include, but are not limited to, the following.
This doc was truncated.

[備考]
To combine more than one buffer into the hash or MAC, you can call
this function multiple times, passing a different buffer each time.
To obtain the hash or MAC value, call the BCryptFinishHash function.
After the BCryptFinishHash function has been called for a specified
handle, that handle cannot be reused. Depending on what processor
modes a provider supports, BCryptHashData can be called either from
user mode or kernel mode. Kernel mode callers can execute either at
PASSIVE_LEVEL IRQL or DISPATCH_LEVEL IRQL. If the current IRQL level
is DISPATCH_LEVEL, the handle provided in the hHash parameter must be
derived from an algorithm handle returned by a provider that was
opened by using the BCRYPT_PROV_DISPATCH flag, and any pointers
passed to the BCryptHashData function must refer to nonpaged (or
locked) memory. To call this function in kernel mode, use Cng.lib,
which is part of the Driver Development Kit (DDK). Windows Server
2008 and Windows Vista: To call this function in kernel mode, use
Ksecdd.lib.


%index
BCryptOpenAlgorithmProvider
Loads and initializes a CNG provider.
%group
Win32 bcrypt
%prm
phAlgorithm, pszAlgId, pszImplementation, dwFlags
phAlgorithm : [var] A pointer to a BCRYPT_ALG_HANDLE variable that receives the CNG provider handle. When you have finished using this handle, release it by passing it to the BCryptCloseAlgorithmProvider function.
pszAlgId : [wstr] A pointer to a null-terminated Unicode string that identifies the requested cryptographic algorithm. This can be one of the standard CNG Algorithm Identifiers or the identifier for another registered algorithm.
pszImplementation : [wstr] A pointer to a null-terminated Unicode string that identifies the specific provider to load. This is the registered alias of the cryptographic primitive provider. This parameter is optional and can be NULL if it is not needed. If this parameter is NULL, the default provider for the specified algorithm will be loaded.
dwFlags : [int] 
%inst
Loads and initializes a CNG provider.

[戻り値]
Returns a status code that indicates the success or failure of the
function.
Possible return codes include, but are not limited to, the following.
This doc was truncated.

[備考]
Because of the number and type of operations that are required to
find, load, and initialize an algorithm provider, the
BCryptOpenAlgorithmProvider function is a relatively time intensive
function. Because of this, we recommend that you cache any algorithm
provider handles that you will use more than once, rather than
opening and closing the algorithm providers over and over.
BCryptOpenAlgorithmProvider can be called either from user mode or
kernel mode. Kernel mode callers must be executing at PASSIVE_LEVEL
IRQL. To call this function in kernel mode, use Cng.lib, which is
part of the Driver Development Kit (DDK). Windows Server 2008 and
Windows Vista: To call this function in kernel mode, use Ksecdd.lib.
Starting in Windows 10, CNG no longer follows every update to the
cryptography configuration. Certain changes, like adding a new
default provider or changing the preference order of algorithm
providers, may require a reboot. Because of this, you should reboot
before calling BCryptOpenAlgorithmProvider with any newly configured
provider.

