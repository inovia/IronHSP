; ============================================================
;   crypt32.dll ヘルプ (CsWin32 / win32metadata から自動抽出)
;   docs_ja.json に日本語訳があればそちらを使用、無ければ英語原文。
;   翻訳を追加するときは docs_ja.json を編集して再生成。
; ============================================================

%index
CertCloseStore
Closes a certificate store handle and reduces the reference count on the store.
%group
Win32 crypt32
%prm
hCertStore, dwFlags
hCertStore : [int] Handle of the certificate store to be closed.
dwFlags : [int] Typically, this parameter uses the default value zero. The default is to close the store with memory remaining allocated for contexts that have not been freed. In this case, no check is made to determine whether memory for contexts remains allocated.
%inst
Closes a certificate store handle and reduces the reference count on
the store.

[戻り値]
If the function succeeds, the return value is TRUE. If the function
fails, the return value is FALSE. For extended error information,
call GetLastError. If CERT_CLOSE_STORE_CHECK_FLAG is not set or if it
is set and all contexts associated with the store have been freed,
the return value is TRUE. If CERT_CLOSE_STORE_CHECK_FLAG is set and
memory for one or more contexts associated with the store remains
allocated, the return value is FALSE. The store is always closed even
when the function returns FALSE. For details, see Remarks.
GetLastError is set to CRYPT_E_PENDING_CLOSE if memory for contexts
associated with the store remains allocated. Any existing value
returned by GetLastError is preserved unless
CERT_CLOSE_STORE_CHECK_FLAG is set.

[備考]
While a certificate store is open, contexts from that store can be
retrieved or duplicated. When a context is retrieved or duplicated,
its reference count is incremented. When a context is freed by
passing it to a search or enumeration function as a previous context
or by using CertFreeCertificateContext, CertFreeCRLContext, or
CertFreeCTLContext, its reference count is decremented. When a
context's reference count reaches zero, memory allocated for that
context is automatically freed. When the memory allocated for a
context has been freed, any pointers to that context become not
valid. By default, memory used to store contexts with reference count
greater than zero is not freed when a certificate store is closed.
References to those contexts remain valid; however, this can cause
memory leaks. Also, any changes made to the properties of a context
after the store has been closed are not persisted. To force the
freeing of memory for all contexts associated with a store, set
CERT_CLOSE_STORE_FORCE_FLAG. With this flag set, memory for all
contexts associated with the store is freed and all pointers to
certificate, CRL, or CTL contexts associated with the store become
not valid. This flag should only be set when the store is opened in a
function and neither the store handle nor any of its contexts were
ever passed to any called functions. The status of reference counts
on contexts associated with a store can be checked when the store is
closed by using CERT_CLOSE_STORE_CHECK_FLAG. When this flag is set,
and all certificate, CRL, or CTL contexts have not been released, the
function returns FALSE and GetLastError returns
CRYPT_E_PENDING_CLOSE. Note that the store is still closed when FALSE
is returned and the memory for any active contexts is not freed. If
CERT_STORE_NO_CRYPT_RELEASE_FLAG was not set when the store was
opened, closing a store releases its CSP handle.


%index
CertEnumCertificatesInStore
Retrieves the first or next certificate in a certificate store. Used in a loop, this function can retrieve in sequence all certificates in a certificate store.
%group
Win32 crypt32
%prm
hCertStore, pPrevCertContext
hCertStore : [int] A handle of a certificate store.
pPrevCertContext : [var] A pointer to the CERT_CONTEXT of the previous certificate context found. This parameter must be NULL to begin the enumeration and get the first certificate in the store. Successive certificates are enumerated by setting pPrevCertContext to the pointer returned by a previous call to the function. This function frees the CERT_CONTEXT referenced by non-NULL values of this parameter. For logical stores, including collection stores, a duplicate of the pCertContext returned by this function cannot be used to begin a new subsequence of enumerations because the duplicated certificate loses the initial enumeration state. The enumeration skips any certificate previously deleted by CertDeleteCertificateFromStore.
%inst
Retrieves the first or next certificate in a certificate store. Used
in a loop, this function can retrieve in sequence all certificates in
a certificate store.

[戻り値]
If the function succeeds, the function returns a pointer to the next
CERT_CONTEXT in the store. If no more certificates exist in the
store, the function returns NULL. For extended error information,
call GetLastError. Some possible error codes follow.
This doc was truncated.

[備考]
The returned pointer is freed when passed as the pPrevCertContext
parameter on a subsequent call. Otherwise, the pointer must be freed
by calling CertFreeCertificateContext. A non-NULL pPrevCertContext
passed to CertEnumCertificatesInStore is always freed even for an
error. A duplicate of the currently enumerated certificate can be
made by calling CertDuplicateCertificateContext.


%index
CertFindCertificateInStore
Finds the first or next certificate context in a certificate store that matches a search criteria established by the dwFindType and its associated pvFindPara.
%group
Win32 crypt32
%prm
hCertStore, dwCertEncodingType, dwFindFlags, dwFindType, pvFindPara, pPrevCertContext
hCertStore : [int] A handle of the certificate store to be searched.
dwCertEncodingType : [int] Specifies the type of encoding used. Both the certificate and message encoding types must be specified by combining them with a bitwise-OR operation as shown in the following example: X509_ASN_ENCODING | PKCS_7_ASN_ENCODING Currently defined encoding types are:
dwFindFlags : [int] Used with some dwFindType values to modify the search criteria. For most dwFindType values, dwFindFlags is not used and should be set to zero. For detailed information, see  Remarks.
dwFindType : [int] 
pvFindPara : [intptr] Points to a data item or structure used with dwFindType.
pPrevCertContext : [var] A pointer to the last CERT_CONTEXT structure returned by this function. This parameter must be NULL on the first call of the function. To find successive certificates meeting the search criteria,  set pPrevCertContext to the pointer returned by the previous call to the function. This function frees the CERT_CONTEXT referenced by non-NULL values of this parameter.
%inst
Finds the first or next certificate context in a certificate store
that matches a search criteria established by the dwFindType and its
associated pvFindPara.

[戻り値]
If the function succeeds, the function returns a pointer to a
read-only CERT_CONTEXT structure. If the function fails and a
certificate that matches the search criteria is not found, the return
value is NULL. A non-NULL CERT_CONTEXT that
CertFindCertificateInStore returns must be freed by
CertFreeCertificateContext or by being passed as the pPrevCertContext
parameter on a subsequent call to CertFindCertificateInStore. For
extended error information, call GetLastError. Some possible error
codes follow.
This doc was truncated.

[備考]
The dwFindFlags parameter is used to modify the criteria of some
search types. The CERT_UNICODE_IS_RDN_ATTRS_FLAG dwFindFlags value is
used only with the CERT_FIND_SUBJECT_ATTR and CERT_FIND_ISSUER_ATTR
values for dwFindType. CERT_UNICODE_IS_RDN_ATTRS_FLAG must be set if
the CERT_RDN_ATTR structure pointed to by pvFindPara was initialized
with Unicode strings. Before any comparison is made, the string to be
matched is converted by using X509_UNICODE_NAME to provide for
Unicode comparisons. The following dwFindFlags values are used only
with the CERT_FIND_ENKEY_USAGE value for dwFindType:
CertDuplicateCertificateContext can be called to make a duplicate of
the returned context. The returned context can be added to a
different certificate store by using
CertAddCertificateContextToStore, or a link to that certificate
context can be added to a store that is not a collection store by
using CertAddCertificateLinkToStore. The returned pointer is freed
when passed as the pPrevCertContext parameter on a subsequent call to
the function. Otherwise, the pointer must be explicitly freed by
calling CertFreeCertificateContext. A pPrevCertContext that is not
NULL is always freed by CertFindCertificateInStore using a call to
CertFreeCertificateContext, even if there is an error in the
function.


%index
CertOpenSystemStoreW
Opens the most common system certificate store. To open certificate stores with more complex requirements, such as file-based or memory-based stores, use CertOpenStore. (Unicode)
%group
Win32 crypt32
%prm
hProv, szSubsystemProtocol
hProv : [int] This parameter is not used and should be set to 0. Windows Server?2003 and Windows?XP:??A handle of a cryptographic service provider (CSP). Set hProv to 0 to use the default CSP. If hProv is not 0, it must be a CSP handle created by using the CryptAcquireContext function.This parameter's data type is HCRYPTPROV.
szSubsystemProtocol : [wstr] A string that names a system store. If the system store name provided in this parameter is not the name of an existing system store, a new system store will be created and used. CertEnumSystemStore can be used to list the names of existing system stores. Some example system stores are listed in the following table.
%inst
Opens the most common system certificate store. To open certificate
stores with more complex requirements, such as file-based or
memory-based stores, use CertOpenStore. (Unicode)

[戻り値]
If the function succeeds, the function returns a handle to the
certificate store. If the function fails, it returns NULL. For
extended error information, call GetLastError. Note Errors from the
called function CertOpenStore are propagated to this function.

[備考]
Only current user certificates are accessible using this method, not
the local machine store. After the system store is opened, all the
standard certificate store functions can be used to manipulate the
certificates. After use, the store should be closed by using
CertCloseStore. For more information about the stores that are
automatically migrated, see Certificate Store Migration.


%index
CryptBinaryToStringW
Converts an array of bytes into a formatted string. (Unicode)
%group
Win32 crypt32
%prm
pbBinary, cbBinary, dwFlags, pszString, pcchString
pbBinary : [var] A pointer to the array of bytes to be converted into a string.
cbBinary : [int] The number of elements in the pbBinary array.
dwFlags : [int] 
pszString : [wstr] A pointer to a buffer that receives the converted string. To calculate the number of characters that must be allocated to hold the returned string, set this parameter to NULL. The function will place the required number of characters, including the terminating NULL character, in the value pointed to by pcchString.
pcchString : [var] A pointer to a DWORD variable that contains the size, in TCHARs, of the pszString buffer. If pszString is NULL, the function calculates the length of the return string (including the terminating null character) in TCHARs and returns it in this parameter. If pszString is not NULL and big enough, the function converts the binary data into a specified string format including the terminating null character, but pcchString receives the length in TCHARs, not including the terminating null character.
%inst
Converts an array of bytes into a formatted string. (Unicode)

[戻り値]
If the function succeeds, the function returns nonzero (TRUE). If the
function fails, it returns zero (FALSE).

[備考]
With the exception of when CRYPT_STRING_BINARY encoding is used, all
strings are appended with a new line sequence. By default, the new
line sequence is a CR/LF pair (0x0D/0x0A). If the dwFlags parameter
contains the CRYPT_STRING_NOCR flag, then the new line sequence is a
LF character (0x0A). If the dwFlags parameter contains the
CRYPT_STRING_NOCRLF flag, then no new line sequence is appended to
the string.
> [!NOTE] > The wincrypt.h header defines CryptBinaryToString as an
alias which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
CryptProtectData
Performs encryption on the data in a DATA_BLOB structure.
%group
Win32 crypt32
%prm
pDataIn, szDataDescr, pOptionalEntropy, pvReserved, pPromptStruct, dwFlags, pDataOut
pDataIn : [var] A pointer to a DATA_BLOB structure that contains the plaintext to be encrypted.
szDataDescr : [wstr] A string with a readable description of the data to be encrypted. This description string is included with the encrypted data. This parameter is optional and can be set to NULL.
pOptionalEntropy : [var] A pointer to a DATA_BLOB structure that contains a password or other additional entropy used to encrypt the data. The DATA_BLOB structure used in the encryption phase must also be used in the decryption phase. This parameter can be set to NULL for no additional entropy. For information about protecting passwords, see Handling Passwords.
pvReserved : [intptr] Reserved for future use and must be set to NULL.
pPromptStruct : [var] A pointer to a CRYPTPROTECT_PROMPTSTRUCT structure that provides information about where and when prompts are to be displayed and what the content of those prompts should be. This parameter can be set to NULL in both the encryption and decryption phases.
dwFlags : [int] This parameter can be one of the following flags.
pDataOut : [var] A pointer to a DATA_BLOB structure that receives the encrypted data. When you have finished using the DATA_BLOB structure, free its pbData member by calling the   LocalFree function.
%inst
Performs encryption on the data in a DATA_BLOB structure.

[戻り値]
If the function succeeds, the function returns TRUE.
If the function fails, it returns FALSE. For extended error
information, call GetLastError.

[備考]
Typically, only a user with logon credentials that match those of the
user who encrypted the data can decrypt the data. In addition,
decryption usually can only be done on the computer where the data
was encrypted. However, a user with a roaming profile can decrypt the
data from another computer on the network. If the
CRYPTPROTECT_LOCAL_MACHINE flag is set when the data is encrypted,
any user on the computer where the encryption was done can decrypt
the data. The function creates a session key to perform the
encryption. The session key is derived again when the data is to be
decrypted. The function also adds a Message Authentication Code (MAC)
(keyed integrity check) to the encrypted data to guard against data
tampering. To encrypt memory for temporary use in the same process or
across processes, call the CryptProtectMemory function.


%index
CryptStringToBinaryW
Converts a formatted string into an array of bytes. (Unicode)
%group
Win32 crypt32
%prm
pszString, cchString, dwFlags, pbBinary, pcbBinary, pdwSkip, pdwFlags
pszString : [wstr] A pointer to a string that contains the formatted string to be converted.
cchString : [int] The number of characters of the formatted string to be converted, not including the terminating NULL character. If this parameter is zero,  pszString is considered to be a null-terminated string.
dwFlags : [int] 
pbBinary : [var] A pointer to a buffer that receives the returned sequence of bytes. If this parameter is NULL, the function calculates the length of the buffer needed and returns the size, in bytes, of required memory in the DWORD pointed to by pcbBinary.
pcbBinary : [var] A pointer to a DWORD variable that, on entry, contains the size, in bytes, of the pbBinary buffer. After the function returns, this variable contains the number of bytes copied to the buffer. If this value is not large enough to contain all of the data, the function fails and GetLastError returns ERROR_MORE_DATA. If pbBinary is NULL, the DWORD pointed to by pcbBinary is ignored.
pdwSkip : [var] A pointer to a DWORD value that receives the number of characters skipped to reach the beginning of the `-----BEGIN ...-----` header. If no header is present, then the DWORD is set to zero. This parameter is optional and can be NULL if it is not needed.
pdwFlags : [var] A pointer to a DWORD value that receives the flags actually used in the conversion. These are the same flags used for the dwFlags parameter. In many cases, these will be the same flags that were passed in the dwFlags parameter. If dwFlags contains one of the following flags, this value will receive a flag that indicates the actual format of the string. This parameter is optional and can be NULL if it is not needed.
%inst
Converts a formatted string into an array of bytes. (Unicode)

[戻り値]
If the function succeeds, the return value is nonzero (TRUE). If the
function fails, the return value is zero (FALSE).

[備考]
The CRYPT_STRING_BASE64HEADER, CRYPT_STRING_BASE64REQUESTHEADER, and
CRYPT_STRING_BASE64X509CRLHEADER flags are all treated identically by
this function: They attempt to parse the first block of
base64-encoded data between lines of the form `-----BEGIN ...-----`
and `-----END ...-----`. The `...` portions are ignored, and they
need not match. If parsing is successful, the value passed in the
dwFlags parameter is returned in the DWORD pointed to by the pdwFlags
parameter. Note that a value of CRYPT_STRING_BASE64REQUESTHEADER or
CRYPT_STRING_BASE64X509CRLHEADER does not mean that a request header
or X.509 certificate revocation list (CRL) was found. > [!NOTE] > The
wincrypt.h header defines CryptStringToBinary as an alias which
automatically selects the ANSI or Unicode version of this function
based on the definition of the UNICODE preprocessor constant. Mixing
usage of the encoding-neutral alias with code that not
encoding-neutral can lead to mismatches that result in compilation or
runtime errors. For more information, see [Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
CryptUnprotectData
Decrypts and does an integrity check of the data in a DATA_BLOB structure.
%group
Win32 crypt32
%prm
pDataIn, ppszDataDescr, pOptionalEntropy, pvReserved, pPromptStruct, dwFlags, pDataOut
pDataIn : [var] A pointer to a DATA_BLOB structure that holds the encrypted data. The DATA_BLOB structure's cbData member holds the length of the pbData member's byte string that contains the text to be encrypted.
ppszDataDescr : [var] A pointer to a string-readable description of the encrypted data included with the encrypted data. This parameter can be set to NULL.  When you have finished using ppszDataDescr, free it by calling the  LocalFree function.
pOptionalEntropy : [var] A pointer to a DATA_BLOB structure that contains a password or other additional entropy used when the data was encrypted. This parameter can be set to NULL; however, if an optional entropy DATA_BLOB structure was used in the encryption phase, that same DATA_BLOB structure must be used for the decryption phase. For information about protecting passwords, see Handling Passwords.
pvReserved : [intptr] This parameter is reserved for future use and must be set to NULL.
pPromptStruct : [var] A pointer to a CRYPTPROTECT_PROMPTSTRUCT structure that provides information about where and when prompts are to be displayed and what the content of those prompts should be. This parameter can be set to NULL.
dwFlags : [int] A DWORD value that specifies options for this function. This parameter can be zero, in which case no option is set, or the following flag.
pDataOut : [var] A pointer to a DATA_BLOB structure where the function stores the decrypted data. When you have finished using the DATA_BLOB structure, free its pbData member by calling the  LocalFree function.
%inst
Decrypts and does an integrity check of the data in a DATA_BLOB
structure.

[戻り値]
If the function succeeds, the function returns TRUE. If the function
fails, it returns FALSE.

[備考]
The CryptProtectData function creates a session key when the data is
encrypted. That key is derived again and used to decrypt the data
BLOB. The Message Authentication Code (MAC) hash added to the
encrypted data can be used to determine whether the encrypted data
was altered in any way. Any tampering results in the return of the
ERROR_INVALID_DATA code. When you have finished using the DATA_BLOB
structure, free its pbData member by calling the LocalFree function.
Any ppszDataDescr that is not NULL must also be freed by using
LocalFree. When you have finished using sensitive information, clear
it from memory by calling the SecureZeroMemory function.

