; ============================================================
;   crypt32.dll ヘルプ (CsWin32 / win32metadata から自動抽出)
;   docs_ja.json に日本語訳があればそちらを使用、無ければ英語原文。
;   翻訳を追加するときは docs_ja.json を編集して再生成。
; ============================================================

%index
CertAddCRLContextToStore
Adds a certificate revocation list (CRL) context to the specified certificate store.
%group
Win32 crypt32
%prm
hCertStore, pCrlContext, dwAddDisposition, ppStoreContext
hCertStore : [int] Handle of a certificate store.
pCrlContext : [var] A pointer to the CRL_CONTEXT structure to be added.
dwAddDisposition : [int] Specifies the action to take if a matching CRL or a link to a matching CRL already exists in the store. Currently defined disposition values and their uses are as follows.
ppStoreContext : [var] A pointer to a pointer to the decoded CRL context. This is an optional parameter and can be NULL, indicating that the calling application does not require a copy of the added or existing CRL. If a copy is made, that context must be freed by using CertFreeCRLContext.
%inst
Adds a certificate revocation list (CRL) context to the specified
certificate store.

[戻り値]
If the function succeeds, the return value is TRUE. If the function
fails, the return value is FALSE. Errors from the called functions
CertAddEncodedCRLToStore and CertSetCRLContextProperty can be
propagated to this function. For extended error information, call
GetLastError. Some possible error codes follow.
This doc was truncated.

[備考]
The CRL context is not duplicated using CertDuplicateCRLContext.
Instead, a new copy is created and added to the store. In addition to
copying the encoded CRL, the function copies the context's
properties. To remove the CRL context from the certificate store, use
the CertDeleteCRLFromStore function.


%index
CertAddCRLLinkToStore
Adds a link in a store to a certificate revocation list (CRL) context in a different store.
%group
Win32 crypt32
%prm
hCertStore, pCrlContext, dwAddDisposition, ppStoreContext
hCertStore : [int] Handle of a certificate store where the link is to be added.
pCrlContext : [var] A pointer to the CRL_CONTEXT structure to be linked.
dwAddDisposition : [int] Specifies the action to take if a matching CRL or a link to a matching CRL exists in the store. Currently defined disposition values and their uses are as follows.
ppStoreContext : [var] A pointer to a pointer of a copy of the link created. The ppStoreContext parameter can be NULL to indicate that a copy of the link is not needed. If a copy of the link is created, that copy must be freed using CertFreeCRLContext.
%inst
Adds a link in a store to a certificate revocation list (CRL) context
in a different store.

[戻り値]
If the function succeeds, the return value is TRUE. If the function
fails, the return value is FALSE. For extended error information,
call GetLastError. Some possible error codes follow.
This doc was truncated.

[備考]
Because the link provides access to an original CRL context, setting
an extended property in the linked CRL context changes that extended
property in the CRL's original location and in any other links to
that CRL. Links cannot be added to a store that is opened as a
collection. Stores opened as collections include all stores opened
with CertOpenSystemStore or CertOpenStore using
CERT_STORE_PROV_SYSTEM or CERT_STORE_PROV_COLLECTION. For more
information, see CertAddStoreToCollection. If links are used and
CertCloseStore is called with CERT_CLOSE_STORE_FORCE_FLAG, the store
using links must be closed before the store containing the original
contexts can be closed. If CERT_CLOSE_STORE_FORCE_FLAG is not used,
the two stores can be closed in either order. To remove the CRL
context link from the certificate store, use the
CertDeleteCRLFromStore function.


%index
CertAddCTLContextToStore
Adds a certificate trust list (CTL) context to a certificate store.
%group
Win32 crypt32
%prm
hCertStore, pCtlContext, dwAddDisposition, ppStoreContext
hCertStore : [int] Handle of a certificate store.
pCtlContext : [var] A pointer to the CTL_CONTEXT structure to be added to the store.
dwAddDisposition : [int] Specifies the action to take if a matching CTL or a link to a matching CTL already exists in the store. Currently defined disposition values and their uses are as follows.
ppStoreContext : [var] Pointer to a pointer to the decoded CTL context. This optional parameter can be NULL indicating that the calling application does not require a copy of the added or existing CTL. If a copy is made, that context must be freed using CertFreeCTLContext.
%inst
Adds a certificate trust list (CTL) context to a certificate store.

[戻り値]
If the function succeeds, the return value is TRUE. If the function
fails, the return value is FALSE. Errors from the called functions
CertAddEncodedCRLToStore and CertSetCRLContextProperty can be
propagated to this function. For extended error information, call
GetLastError. Some possible error codes follow.
This doc was truncated.

[備考]
The CTL context is not duplicated using CertDuplicateCTLContext.
Instead, a new copy is created and added to the store. In addition to
the encoded CTL, the context's properties are copied. To remove the
CTL context from the certificate store, use the
CertDeleteCTLFromStore function.


%index
CertAddCTLLinkToStore
The CertAddCTLLinkToStore function adds a link in a store to a certificate trust list (CTL) context in a different store. Instead of creating and adding a duplicate of a CTL context, this function adds a link to the original CTL context.
%group
Win32 crypt32
%prm
hCertStore, pCtlContext, dwAddDisposition, ppStoreContext
hCertStore : [int] Handle of the certificate store where the link is to be added.
pCtlContext : [var] A pointer to the CTL_CONTEXT structure to be linked.
dwAddDisposition : [int] Specifies the action to take if a matching CTL or a link to a matching CTL already exists in the store. Currently defined disposition values and their uses are as follows.
ppStoreContext : [var] A pointer to a pointer to a copy of the link created. ppStoreContext can be NULL to indicate that a copy of the link is not needed. If a copy of the link is created, that copy must be freed using CertFreeCTLContext.
%inst
The CertAddCTLLinkToStore function adds a link in a store to a
certificate trust list (CTL) context in a different store. Instead of
creating and adding a duplicate of a CTL context, this function adds
a link to the original CTL context.

[戻り値]
If the function succeeds, the return value is TRUE. If the function
fails, the return value is FALSE. For extended error information,
call GetLastError. Some possible error codes follow.
This doc was truncated.

[備考]
Because the link provides access to the original CTL context, setting
an extended property in the linked CTL context changes that extended
property in the original CTL's location and in any other links to
that CTL. Links cannot be added to a store that is opened as a
collection. Stores opened as collections include all stores opened
with CertOpenSystemStore or CertOpenStore using
CERT_STORE_PROV_SYSTEM or CERT_STORE_PROV_COLLECTION. Also see
CertAddStoreToCollection. When links are used and CertCloseStore is
called with CERT_CLOSE_STORE_FORCE_FLAG, the store using links must
be closed before the store containing the original contexts is
closed. If CERT_CLOSE_STORE_FORCE_FLAG is not used, the two stores
can be closed in either order. To remove the CTL context link from
the certificate store, use the CertDeleteCTLFromStore function.


%index
CertAddCertificateContextToStore
Adds a certificate context to the certificate store.
%group
Win32 crypt32
%prm
hCertStore, pCertContext, dwAddDisposition, ppStoreContext
hCertStore : [int] Handle of a certificate store.
pCertContext : [var] A pointer to the CERT_CONTEXT structure to be added to the store.
dwAddDisposition : [int] Specifies the action to take if a matching certificate or a link to a matching certificate already exists in the store. Currently defined disposition values and their uses are as follows.
ppStoreContext : [var] A pointer to a pointer to the copy to be made of the certificate that was added to the store.
%inst
Adds a certificate context to the certificate store.

[戻り値]
If the function succeeds, the return value is TRUE. If the function
fails, the return value is FALSE. For extended error information,
call GetLastError. Some possible error codes follow.
This doc was truncated.

[備考]
The certificate context is not duplicated using
CertDuplicateCertificateContext. Instead, the function creates a new
copy of the context and adds it to the store. In addition to the
encoded certificate, CertDuplicateCertificateContext also copies the
context's properties, with the exception of the
CERT_KEY_PROV_HANDLE_PROP_ID and CERT_KEY_CONTEXT_PROP_ID properties.
To remove the certificate context from the certificate store, use the
CertDeleteCertificateFromStore function. Note The order of the
certificate context may not be preserved within the store. To access
a specific certificate you must iterate across the certificates in
the store.


%index
CertAddCertificateLinkToStore
Adds a link in a certificate store to a certificate context in a different store.
%group
Win32 crypt32
%prm
hCertStore, pCertContext, dwAddDisposition, ppStoreContext
hCertStore : [int] A handle to the certificate store where the link is to be added.
pCertContext : [var] A pointer to the CERT_CONTEXT structure to be linked.
dwAddDisposition : [int] Specifies the action if a matching certificate or a link to a matching certificate already exists in the store. Currently defined disposition values and their uses are as follows.
ppStoreContext : [var] A pointer to a pointer to a copy of the link created. The ppStoreContext parameter can be NULL to indicate that a copy of the link is not needed. If a copy of the link is created, that copy must be freed using the CertFreeCertificateContext function.
%inst
Adds a link in a certificate store to a certificate context in a
different store.

[戻り値]
If the function succeeds, the return value is TRUE. If the function
fails, the return value is FALSE. For extended error information,
call GetLastError. Some possible error codes follow.
This doc was truncated.

[備考]
Because the link provides access to the original certificate context,
setting an extended property in the linked certificate context
changes that extended property in the certificate's original location
and in any other links to that certificate. Links cannot be added to
a store opened as a collection. Stores opened as collections include
all stores opened with CertOpenSystemStore or CertOpenStore using
CERT_STORE_PROV_SYSTEM or CERT_STORE_PROV_COLLECTION. For more
information, see CertAddStoreToCollection. If links are used and
CertCloseStore is called with CERT_CLOSE_STORE_FORCE_FLAG, the store
that uses links must be closed before the store that contains the
original contexts is closed. If CERT_CLOSE_STORE_FORCE_FLAG is not
used, the two stores can be closed in either order. To remove the
certificate context link from the certificate store, use the
CertDeleteCertificateFromStore function.


%index
CertAddEncodedCRLToStore
Creates a certificate revocation list (CRL) context from an encoded CRL and adds it to the certificate store.
%group
Win32 crypt32
%prm
hCertStore, dwCertEncodingType, pbCrlEncoded, cbCrlEncoded, dwAddDisposition, ppCrlContext
hCertStore : [int] Handle of a certificate store.
dwCertEncodingType : [int] Specifies the type of encoding used. It is always acceptable to specify both the certificate and message encoding types by combining them with a bitwise-OR operation as shown in the following example: X509_ASN_ENCODING | PKCS_7_ASN_ENCODING Currently defined encoding types are:
pbCrlEncoded : [var] A pointer to a buffer containing the encoded CRL to be added to the certificate store.
cbCrlEncoded : [int] The size, in bytes, of the pbCrlEncoded buffer.
dwAddDisposition : [int] Specifies the action to take if a matching CRL or a link to a matching CRL already exists in the store. Currently defined disposition values and their uses are as follows.
ppCrlContext : [var] A pointer to a pointer to the decoded CRL_CONTEXT structure. This is an optional parameter that can be NULL, indicating that the calling application does not require a copy of the new or existing CRL. If a copy is made, that context must be freed using CertFreeCRLContext.
%inst
Creates a certificate revocation list (CRL) context from an encoded
CRL and adds it to the certificate store.

[戻り値]
If the function succeeds, the return value is TRUE. If the function
fails, the return value is FALSE. For extended error information,
call GetLastError. Some possible error codes follow.
This doc was truncated.


%index
CertAddEncodedCTLToStore
Creates a certificate trust list (CTL) context from an encoded CTL and adds it to the certificate store.
%group
Win32 crypt32
%prm
hCertStore, dwMsgAndCertEncodingType, pbCtlEncoded, cbCtlEncoded, dwAddDisposition, ppCtlContext
hCertStore : [int] Handle of a certificate store.
dwMsgAndCertEncodingType : [int] Specifies the type of encoding used. Both the certificate and message encoding types must be specified by combining them with a bitwise-OR operation as shown in the following example: X509_ASN_ENCODING | PKCS_7_ASN_ENCODING
pbCtlEncoded : [var] A pointer to a buffer containing the encoded CTL to be added to the certificate store.
cbCtlEncoded : [int] The size, in bytes, of the pbCtlEncoded buffer.
dwAddDisposition : [int] Specifies the action to take if a matching CTL or a link to a matching CTL already exists in the store. Currently defined disposition values and their uses are as follows
ppCtlContext : [var] A pointer to a pointer to the decoded CTL_CONTEXT structure. Can be NULL indicating that the calling application does not require a copy of the added or existing CTL. If a copy is made, it must be freed by using CertFreeCTLContext.
%inst
Creates a certificate trust list (CTL) context from an encoded CTL
and adds it to the certificate store.

[戻り値]
If the function succeeds, the return value is TRUE. If the function
fails, the return value is FALSE. For extended error information,
call GetLastError. Some possible error codes follow.
This doc was truncated.


%index
CertAddEncodedCertificateToStore
Creates a certificate context from an encoded certificate and adds it to the certificate store.
%group
Win32 crypt32
%prm
hCertStore, dwCertEncodingType, pbCertEncoded, cbCertEncoded, dwAddDisposition, ppCertContext
hCertStore : [int] A handle to the certificate store.
dwCertEncodingType : [int] Specifies the type of encoding used. It is always acceptable to specify both the certificate and message encoding types by combining them with a bitwise-OR operation as shown in the following example: X509_ASN_ENCODING | PKCS_7_ASN_ENCODING Currently defined encoding types are:
pbCertEncoded : [var] A pointer to a buffer containing the encoded certificate that is to be added to the certificate store.
cbCertEncoded : [int] The size, in bytes, of the pbCertEncoded buffer.
dwAddDisposition : [int] Specifies the action to take if a matching certificate or link to a matching certificate exists in the store. Currently defined disposition values and their uses are as follows.
ppCertContext : [var] A pointer to a pointer to the decoded certificate context. This is an optional parameter that can be NULL, indicating that the calling application does not require a copy of the new or existing certificate. When a copy is made, its context must be freed by using CertFreeCertificateContext.
%inst
Creates a certificate context from an encoded certificate and adds it
to the certificate store.

[戻り値]
If the function succeeds, the return value is TRUE. If the function
fails, the return value is FALSE. For extended error information,
call GetLastError. Some possible error codes follow.
This doc was truncated.


%index
CertAddEncodedCertificateToSystemStoreW
Opens the specified system store and adds the encoded certificate to it. (Unicode)
%group
Win32 crypt32
%prm
szCertStoreName, pbCertEncoded, cbCertEncoded
szCertStoreName : [wstr] A null-terminated string that contains the name of the system store for the encoded certificate.
pbCertEncoded : [var] A pointer to a buffer that contains the encoded certificate to add.
cbCertEncoded : [int] The size, in bytes, of the pbCertEncoded buffer.
%inst
Opens the specified system store and adds the encoded certificate to
it. (Unicode)

[戻り値]
If the function succeeds, the return value is TRUE. If the function
fails, the return value is FALSE.
CertAddEncodedCertificateToSystemStore depends on the functions
listed in the following remarks for error handling. Refer to those
function topics for their respective error handling behaviors. For
extended error information, call GetLastError.

[備考]
Internally, CertAddEncodedCertificateToSystemStore calls
CertOpenSystemStore and CertAddEncodedCertificateToStore with the
following parameters.
This doc was truncated.


%index
CertAddEnhancedKeyUsageIdentifier
The CertAddEnhancedKeyUsageIdentifier function adds a usage identifier object identifier (OID) to the enhanced key usage (EKU) extended property of the certificate.
%group
Win32 crypt32
%prm
pCertContext, pszUsageIdentifier
pCertContext : [var] A pointer to the CERT_CONTEXT of the certificate for which the usage identifier is to be added.
pszUsageIdentifier : [str] Specifies the usage identifier OID to add.
%inst
The CertAddEnhancedKeyUsageIdentifier function adds a usage
identifier object identifier (OID) to the enhanced key usage (EKU)
extended property of the certificate.

[戻り値]
If the function succeeds, the function returns nonzero (TRUE). If the
function fails, it returns zero (FALSE). For extended error
information, call GetLastError.


%index
CertAddRefServerOcspResponse
Increments the reference count for an HCERT_SERVER_OCSP_RESPONSE handle.
%group
Win32 crypt32
%prm
hServerOcspResponse
hServerOcspResponse : [intptr] A handle to an HCERT_SERVER_OCSP_RESPONSE returned by CertOpenServerOcspResponse.
%inst
Increments the reference count for an HCERT_SERVER_OCSP_RESPONSE
handle.

[備考]
Each CertOpenServerOcspResponse and CertAddRefServerOcspResponse
requires a corresponding CertCloseServerOcspResponse.


%index
CertAddRefServerOcspResponseContext
Increments the reference count for a CERT_SERVER_OCSP_RESPONSE_CONTEXT structure.
%group
Win32 crypt32
%prm
pServerOcspResponseContext
pServerOcspResponseContext : [var] A pointer to a CERT_SERVER_OCSP_RESPONSE_CONTEXT returned by CertGetServerOcspResponseContext.
%inst
Increments the reference count for a
CERT_SERVER_OCSP_RESPONSE_CONTEXT structure.

[備考]
Each call to CertGetServerOcspResponseContext and
CertAddRefServerOcspResponseContext requires a corresponding call to
CertFreeServerOcspResponseContext.


%index
CertAddSerializedElementToStore
Adds a serialized certificate, certificate revocation list (CRL), or certificate trust list (CTL) element to the store.
%group
Win32 crypt32
%prm
hCertStore, pbElement, cbElement, dwAddDisposition, dwFlags, dwContextTypeFlags, pdwContextType, ppvContext
hCertStore : [int] The handle of a certificate store where the created certificate will be stored. If hCertStore is NULL, the function creates a copy of a certificate, CRL, or CTL context with its extended properties, but the certificate, CRL, or CTL is not persisted in any store.
pbElement : [var] A pointer to a buffer that contains the certificate, CRL, or CTL information to be serialized and added to the certificate store.
cbElement : [int] The size, in bytes, of the pbElement buffer.
dwAddDisposition : [int] Specifies the action to take if the certificate, CRL, or CTL already exists in the store. Currently defined disposition values are shown in the following table.
dwFlags : [int] Reserved for future use and must be zero.
dwContextTypeFlags : [int] Specifics the contexts that can be added. For example, to add either a certificate, CRL, or CTL, set dwContextTypeFlags to CERT_STORE_CERTIFICATE_CONTEXT_FLAG or CERT_STORE_CRL_CONTEXT_FLAG.
pdwContextType : [var] A pointer to the context type of the added serialized element. This is an optional parameter and can be NULL, which indicates that the calling application does not require the context type. Currently defined context types are shown in the following table.
ppvContext : [var] A pointer to a pointer to the decoded certificate, CRL, or CTL context. This is an optional parameter and can be NULL, which indicates that the calling application does not require the context of the added or existing certificate, CRL, or CTL. If ppvContext is not NULL, it must be the address of a pointer to a CERT_CONTEXT, CRL_CONTEXT, or CTL_CONTEXT. When the application is finished with the context, the context must be freed by using CertFreeCertificateContext for a certificate, CertFreeCRLContext for a CRL, or CertFreeCTLContext for a CTL.
%inst
Adds a serialized certificate, certificate revocation list (CRL), or
certificate trust list (CTL) element to the store.

[戻り値]
If the function succeeds, the function returns nonzero. If the
function fails, it returns zero. For extended error information, call
GetLastError. Some possible error codes follow.
This doc was truncated.


%index
CertAddStoreToCollection
The CertAddStoreToCollection function adds a sibling certificate store to a collection certificate store.
%group
Win32 crypt32
%prm
hCollectionStore, hSiblingStore, dwUpdateFlags, dwPriority
hCollectionStore : [int] Handle of a certificate store.
hSiblingStore : [int] Handle of a sibling store to be added to the collection store. For more information, see  Remarks.
dwUpdateFlags : [int] Indicates whether certificates, CRLs, and CTLs can be added to the new sibling store member of the collection store. To enable addition, set dwUpdateFlag to CERT_PHYSICAL_STORE_ADD_ENABLE_FLAG.   To disable additions, set dwUpdateFlag to zero.
dwPriority : [int] Sets a priority level of the new store in the collection, with zero being the lowest priority. If zero is passed for this parameter, the specified store is appended as the last store in the collection. The priority levels of the stores in a collection determine the order in which the stores are enumerated, and the search order of the stores when attempting to retrieve a certificate, CRL, or CTL. Priority levels also determine to which store of a collection a new certificate, CRL, or CTL is added. For more information, see  Remarks.
%inst
The CertAddStoreToCollection function adds a sibling certificate
store to a collection certificate store.

[戻り値]
If the function succeeds, the function returns nonzero and a new
store is added to the collection of stores. If the function fails, it
returns zero and the store was not added.

[備考]
A collection store has the same HCERTSTORE handle as a single store;
thus, almost all functions that apply to any certificate store also
apply to any collection store. Enumeration and search processes span
all of the stores in a collection store; however, functions such as
CertAddCertificateLinkToStore that add links to stores cannot be used
with collection stores. When a certificate, CRL, or CTL is added to a
collection store, the list of sibling stores in the collection is
searched in priority order to find the first store that allows
adding. Adding is enabled if CERT_PHYSICAL_STORE_ADD_ENABLE_FLAG was
set in the CertAddStoreToCollection call. With any function that adds
elements to a store, if a store that allows adding does not return
success, the addition function continues on to the next store without
providing notification. When a collection store and its sibling
stores are closed with CertCloseStore using
CERT_CLOSE_STORE_FORCE_FLAG, the collection store must be closed
before its sibling stores. If CERT_CLOSE_STORE_FORCE_FLAG is not
used, the stores can be closed in any order.


%index
CertAlgIdToOID
Converts a CryptoAPI algorithm identifier (ALG_ID) to an Abstract Syntax Notation One (ASN.1) object identifier (OID) string.
%group
Win32 crypt32
%prm
dwAlgId
dwAlgId : [int] Value to be converted to an OID.
%inst
Converts a CryptoAPI algorithm identifier (ALG_ID) to an Abstract
Syntax Notation One (ASN.1) object identifier (OID) string.

[戻り値]
If the function succeeds, the function returns the null-terminated
OID string. If no OID string corresponds to the algorithm identifier,
the function returns NULL.


%index
CertCloseServerOcspResponse
Closes an online certificate status protocol (OCSP) server response handle.
%group
Win32 crypt32
%prm
hServerOcspResponse, dwFlags
hServerOcspResponse : [intptr] The handle to close for an OCSP server response.
dwFlags : [int] This parameter is not used and must be zero.
%inst
Closes an online certificate status protocol (OCSP) server response
handle.

[備考]
The CertCloseServerOcspResponse function closes a handle returned by
either the CertOpenServerOcspResponse or CertAddRefServerOcspResponse
function.


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
CertCompareCertificate
Determines whether two certificates are identical by comparing the issuer name and serial number of the certificates.
%group
Win32 crypt32
%prm
dwCertEncodingType, pCertId1, pCertId2
dwCertEncodingType : [int] Specifies the encoding type used. It is always acceptable to specify both the certificate and message encoding types by combining them with a bitwise-OR operation as shown in the following example: X509_ASN_ENCODING | PKCS_7_ASN_ENCODING Currently defined encoding types are:
pCertId1 : [var] A pointer to the CERT_INFO for the first certificate in the comparison.
pCertId2 : [var] A pointer to the CERT_INFO for the second certificate in the comparison.
%inst
Determines whether two certificates are identical by comparing the
issuer name and serial number of the certificates.

[戻り値]
If the certificates are identical and the function succeeds, the
function returns nonzero (TRUE). If the function fails, it returns
zero (FALSE).


%index
CertCompareCertificateName
The CertCompareCertificateName function compares two certificate CERT_NAME_BLOB structures to determine whether they are identical. The CERT_NAME_BLOB structures are used for the subject and the issuer of certificates.
%group
Win32 crypt32
%prm
dwCertEncodingType, pCertName1, pCertName2
dwCertEncodingType : [int] Specifies the encoding type used. It is always acceptable to specify both the certificate and message encoding types by combining them with a bitwise-OR operation as shown in the following example: X509_ASN_ENCODING | PKCS_7_ASN_ENCODING Currently defined encoding types are:
pCertName1 : [var] A pointer to a CERT_NAME_BLOB for the first name in the comparison. For more information, see CRYPT_INTEGER_BLOB.
pCertName2 : [var] A pointer to a CERT_NAME_BLOB for the second name in the comparison.
%inst
The CertCompareCertificateName function compares two certificate
CERT_NAME_BLOB structures to determine whether they are identical.
The CERT_NAME_BLOB structures are used for the subject and the issuer
of certificates.

[戻り値]
If the names are identical and the function succeeds, the function
returns nonzero (TRUE). If the function fails, it returns zero
(FALSE).


%index
CertCompareIntegerBlob
The CertCompareIntegerBlob function compares two integer BLOBs to determine whether they represent equal numeric values.
%group
Win32 crypt32
%prm
pInt1, pInt2
pInt1 : [var] A pointer to a CRYPT_INTEGER_BLOB structure that contains the first integer in the comparison.
pInt2 : [var] A pointer to a CRYPT_INTEGER_BLOB structure that contains the second integer in the comparison.
%inst
The CertCompareIntegerBlob function compares two integer BLOBs to
determine whether they represent equal numeric values.

[戻り値]
If the representations of the integer BLOBs are identical and the
function succeeds, the function returns nonzero (TRUE). If the
function fails, it returns zero (FALSE). For extended error
information, call GetLastError.

[備考]
Before doing the comparison, most significant bytes with a value of
0x00 are removed from a positive number. Positive here means that the
most significant bit in the next nonzero byte is not set. Most
significant bytes with a value of 0xFF are removed from a negative
number. Negative here means that the most significant bit in the next
non-0xFF byte is set. This produces the unique representation of that
integer, as shown in the following table.
This doc was truncated.


%index
CertComparePublicKeyInfo
The CertComparePublicKeyInfo function compares two encoded public keys to determine whether they are identical.
%group
Win32 crypt32
%prm
dwCertEncodingType, pPublicKey1, pPublicKey2
dwCertEncodingType : [int] Specifies the encoding type used. It is always acceptable to specify both the certificate and message encoding types by combining them with a bitwise-OR operation as shown in the following example: X509_ASN_ENCODING | PKCS_7_ASN_ENCODING Currently defined encoding types are:
pPublicKey1 : [var] A pointer to the CERT_PUBLIC_KEY_INFO for the first public key in the comparison.
pPublicKey2 : [var] A pointer to the CERT_PUBLIC_KEY_INFO for the second public key in the comparison.
%inst
The CertComparePublicKeyInfo function compares two encoded public
keys to determine whether they are identical.

[戻り値]
If the public keys are identical and the function succeeds, the
function returns nonzero (TRUE). If the function fails, it returns
zero (FALSE).


%index
CertControlStore
Allows an application to be notified when there is a difference between the contents of a cached store in use and the contents of that store as it is persisted to storage.
%group
Win32 crypt32
%prm
hCertStore, dwFlags, dwCtrlType, pvCtrlPara
hCertStore : [int] Handle of the certificate store.
dwFlags : [int] 
dwCtrlType : [int] Control action to be taken by CertControlStore. The interpretations of pvCtrlPara and dwFlags depend on the value of dwCtrlType. Currently, the following  actions are defined.
pvCtrlPara : [intptr] If dwCtrlType is CERT_STORE_NOTIFY_CHANGE, pvCtrlPara is set to the address of a handle where the system signals the notification change event when a change from the persisted state of the store is detected. The handle must be initialized with a call to the function CreateEvent. The pvCtrlPara parameter can be set to NULL for registry-based stores. If pvCtrlPara is NULL, an internal notification change event is created and registered to be signaled. Using the internal notification change event allows resynchronization operations only if the store was changed.
%inst
Allows an application to be notified when there is a difference
between the contents of a cached store in use and the contents of
that store as it is persisted to storage.

[戻り値]
If the function succeeds, the function returns nonzero. If the
function fails, it returns zero. For extended error information, call
GetLastError. If dwCtrlType is CERT_STORE_NOTIFY_CHANGE, the function
returns nonzero if a handle for the event signal was successfully set
up. The function returns zero if the event handle was not set up. If
dwCtrlType is CERT_STORE_CTRL_RESYNC, the function returns nonzero if
the resynchronization succeeded. The function returns zero if the
resynchronization failed. If dwCtrlType is CERT_STORE_CTRL_COMMIT,
the function returns nonzero to indicate the successful completion of
the commit to persisted storage. The function returns zero if the
commit failed. Some providers might not support specific control
types. In these cases, CertControlStore returns zero and GetLastError
is set to the ERROR_NOT_SUPPORTED code.

[備考]
Resynchronization of a store can be done at any time. It need not
follow a signaled notification change event.
CERT_STORE_CTRL_NOTIFY_CHANGE is supported on registry-based store
providers by using the RegNotifyChangeKeyValue function.
CertControlStore using CERT_STORE_CTRL_NOTIFY_CHANGE is called once
for each event handle to be passed with CERT_STORE_CTRL_RESYNC. These
calls using CERT_STORE_CTRL_NOTIFY_CHANGE must be made after each
event is created and not after an event has been signaled.


%index
CertCreateCRLContext
The CertCreateCRLContext function creates a certificate revocation list (CRL) context from an encoded CRL. The created context is not persisted to a certificate store. It makes a copy of the encoded CRL within the created context.
%group
Win32 crypt32
%prm
dwCertEncodingType, pbCrlEncoded, cbCrlEncoded
dwCertEncodingType : [int] Specifies the type of encoding used. It is always acceptable to specify both the certificate and message encoding types by combining them with a bitwise-OR operation as shown in the following example: X509_ASN_ENCODING | PKCS_7_ASN_ENCODING Currently defined encoding types are:
pbCrlEncoded : [var] A pointer to a buffer containing the encoded CRL from which the context is to be created.
cbCrlEncoded : [int] The size, in bytes, of the pbCrlEncoded buffer.
%inst
The CertCreateCRLContext function creates a certificate revocation
list (CRL) context from an encoded CRL. The created context is not
persisted to a certificate store. It makes a copy of the encoded CRL
within the created context.

[戻り値]
If the function succeeds, the return value is a pointer to a
read-only CRL_CONTEXT. If the function fails and is unable to decode
and create the CRL_CONTEXT, the return value is NULL. For extended
error information, call GetLastError. The following table shows a
possible error code.
This doc was truncated.

[備考]
The CRL_CONTEXT must be freed by calling CertFreeCRLContext.
CertDuplicateCRLContext can be called to make a duplicate.
CertSetCRLContextProperty and CertGetCRLContextProperty can be called
to store and read properties for the CRL.


%index
CertCreateCTLContext
The CertCreateCTLContext function creates a certificate trust list (CTL) context from an encoded CTL. The created context is not persisted to a certificate store. The function makes a copy of the encoded CTL within the created context.
%group
Win32 crypt32
%prm
dwMsgAndCertEncodingType, pbCtlEncoded, cbCtlEncoded
dwMsgAndCertEncodingType : [int] Specifies the type of encoding used. Both the certificate and message encoding types must be specified by combining them with a bitwise-OR operation as shown in the following example: X509_ASN_ENCODING | PKCS_7_ASN_ENCODING Currently defined encoding types are:
pbCtlEncoded : [var] A pointer to a buffer containing the encoded CTL from which the context is to be created.
cbCtlEncoded : [int] The size, in bytes, of the pbCtlEncoded buffer.
%inst
The CertCreateCTLContext function creates a certificate trust list
(CTL) context from an encoded CTL. The created context is not
persisted to a certificate store. The function makes a copy of the
encoded CTL within the created context.

[戻り値]
If the function succeeds, the return value is a pointer to a
read-only CTL_CONTEXT. If the function fails and is unable to decode
and create the CTL_CONTEXT, the return value is NULL. For extended
error information, call GetLastError. The following table shows a
possible error code.
This doc was truncated.

[備考]
The CTL_CONTEXT must be freed by calling CertFreeCTLContext.
CertDuplicateCTLContext can be called to make a duplicate.
CertSetCTLContextProperty and CertGetCTLContextProperty can be called
to store and read properties for the CTL.


%index
CertCreateCTLEntryFromCertificateContextProperties
The CertCreateCTLEntryFromCertificateContextProperties function creates a certificate trust list (CTL) entry whose attributes are the properties of the certificate context. The SubjectIdentifier in the CTL entry is the SHA1 hash of the certificate.
%group
Win32 crypt32
%prm
pCertContext, cOptAttr, rgOptAttr, dwFlags, pvReserved, pCtlEntry, pcbCtlEntry
pCertContext : [var] A pointer to the CERT_CONTEXT used to create the CTL.
cOptAttr : [int] A DWORD that specifies the number of additional attributes to be added.
rgOptAttr : [var] A pointer to any array of CRYPT_ATTRIBUTE attributes to be added to the CTL.
dwFlags : [int] A DWORD. Can be set to CTL_ENTRY_FROM_PROP_CHAIN_FLAG to force the inclusion of the chain building hash properties as attributes.
pvReserved : [intptr] A pointer to a VOID. Reserved for future use.
pCtlEntry : [var] Address of a pointer to a CTL_ENTRY structure. Call this function twice to retrieve a CTL entry. Set this parameter to NULL on the first call. When the function returns, use the number of bytes retrieved from the pcbCtlEntry parameter to allocate memory. Call the function again, setting this parameter to the address of the allocated memory.
pcbCtlEntry : [var] Pointer to a DWORD that contains the number of bytes that must be allocated for the CTL_ENTRY structure.  Call this function twice to retrieve the number of bytes. For the first call, set this parameter to the address of a DWORD value that contains zero and set the pCtlEntry parameter to NULL. If the first call succeeds, the DWORD value will contain the number of bytes that you must allocate for the CTL_ENTRY structure. Allocate the required memory and call the function again, supplying the address of the memory in the pCtlEntry parameter.
%inst
The CertCreateCTLEntryFromCertificateContextProperties function
creates a certificate trust list (CTL) entry whose attributes are the
properties of the certificate context. The SubjectIdentifier in the
CTL entry is the SHA1 hash of the certificate.

[戻り値]
If the function succeeds, the function returns nonzero (TRUE). If the
function fails, it returns zero (FALSE). For extended error
information, call GetLastError.


%index
CertFreeCertificateChainEngine
The CertFreeCertificateChainEngine function frees a certificate trust engine.
%group
Win32 crypt32
%prm
hChainEngine
hChainEngine : [intptr] Handle of the chain engine to be freed.
%inst
The CertFreeCertificateChainEngine function frees a certificate trust
engine.


%index
CertCreateCertificateChainEngine
The CertCreateCertificateChainEngine function creates a new, nondefault chain engine for an application.
%group
Win32 crypt32
%prm
pConfig, phChainEngine
pConfig : [var] A pointer to a CERT_CHAIN_ENGINE_CONFIG data structure that specifies the parameters for the chain engine.
phChainEngine : [intptr] A pointer to the handle of the chain engine created. When you have finished using the chain engine, release the chain engine by calling the CertFreeCertificateChainEngine function.
%inst
The CertCreateCertificateChainEngine function creates a new,
nondefault chain engine for an application.

[戻り値]
If the function succeeds, the function returns nonzero (TRUE). If the
function fails, it returns zero (FALSE). For extended error
information, call GetLastError. The phChainEngine parameter returns
the chain engine handle.


%index
CertCreateCertificateContext
Creates a certificate context from an encoded certificate. The created context is not persisted to a certificate store. The function makes a copy of the encoded certificate within the created context.
%group
Win32 crypt32
%prm
dwCertEncodingType, pbCertEncoded, cbCertEncoded
dwCertEncodingType : [int] Specifies the type of encoding used. It is always acceptable to specify both the certificate and message encoding types by combining them with a bitwise-OR operation as shown in the following example: X509_ASN_ENCODING | PKCS_7_ASN_ENCODING Currently defined encoding types are:
pbCertEncoded : [var] A pointer to a buffer that contains the encoded certificate from which the context is to be created.
cbCertEncoded : [int] The size, in bytes, of the pbCertEncoded buffer.
%inst
Creates a certificate context from an encoded certificate. The
created context is not persisted to a certificate store. The function
makes a copy of the encoded certificate within the created context.

[戻り値]
If the function succeeds, the function returns a pointer to a
read-only CERT_CONTEXT. When you have finished using the certificate
context, free it by calling the CertFreeCertificateContext function.
If the function is unable to decode and create the certificate
context, it returns NULL. For extended error information, call
GetLastError. Some possible error codes follow.
This doc was truncated.

[備考]
The CERT_CONTEXT must be freed by calling CertFreeCertificateContext.
CertDuplicateCertificateContext can be called to make a duplicate.
CertSetCertificateContextProperty and
CertGetCertificateContextProperty can be called to store and read
properties for the certificate.


%index
CertCreateContext
Creates the specified context from the encoded bytes. The context created does not include any extended properties.
%group
Win32 crypt32
%prm
dwContextType, dwEncodingType, pbEncoded, cbEncoded, dwFlags, pCreatePara
dwContextType : [int] Specifies the contexts that can be created. For example, to create a certificate context, set dwContextType to CERT_STORE_CERTIFICATE_CONTEXT.
dwEncodingType : [int] Specifies the encoding type used. Currently, only X509_ASN_ENCODING and PKCS_7_ASN_ENCODING are being used; however, additional encoding types may be added in the future. For either current encoding type, use:
pbEncoded : [var] A pointer to a buffer that contains the existing encoded context content to be copied.
cbEncoded : [int] The size, in bytes, of the pbEncoded buffer.
dwFlags : [int] The following flag values are defined and can be combined by using a bitwise-OR operation.
pCreatePara : [var] A pointer to a CERT_CREATE_CONTEXT_PARA structure.
%inst
Creates the specified context from the encoded bytes. The context
created does not include any extended properties.

[戻り値]
If the function succeeds, the return value is a pointer to the newly
created context. The pvFree member of pCreatePara must be called to
free the created context.
If the function fails, the return value is NULL. For extended error
information, call GetLastError. If GetLastError returns
ERROR_CANCELLED, this means that the
PFN_CERT_CREATE_CONTEXT_SORT_FUNC callback function returned FALSE to
stop the sort.


%index
CertCreateSelfSignCertificate
Builds a self-signed certificate and returns a pointer to a CERT_CONTEXT structure that represents the certificate.
%group
Win32 crypt32
%prm
hCryptProvOrNCryptKey, pSubjectIssuerBlob, dwFlags, pKeyProvInfo, pSignatureAlgorithm, pStartTime, pEndTime, pExtensions
hCryptProvOrNCryptKey : [int] A handle of a cryptographic provider used to sign the certificate created. If NULL, information from the pKeyProvInfo parameter is used to acquire the needed handle. If pKeyProvInfo is also NULL, the default provider type, PROV_RSA_FULL provider type, the default key specification, AT_SIGNATURE, and a newly created key container with a unique container name are used. This handle must be an HCRYPTPROV handle that has been created by using the CryptAcquireContext function or an NCRYPT_KEY_HANDLE handle that has been created by using the NCryptOpenKey function. New applications should always pass in the NCRYPT_KEY_HANDLE handle of a CNG cryptographic service provider (CSP).
pSubjectIssuerBlob : [var] A pointer to a BLOB that contains the distinguished name (DN) for the certificate subject. This parameter cannot be NULL. Minimally, a pointer to an empty DN must be provided. This BLOB is normally created by using the CertStrToName function. It can also be created by using the CryptEncodeObject function and specifying either the X509_NAME or X509_UNICODE_NAME StructType.
dwFlags : [int] 
pKeyProvInfo : [var] A pointer to a CRYPT_KEY_PROV_INFO structure. Before a certificate is created, the CSP is queried for the key provider, key provider type, and the key container name. If the CSP queried does not support these queries, the function fails. If the default provider does not support these queries, a pKeyProvInfo value must be specified. The RSA BASE does support these queries. If the pKeyProvInfo parameter is not NULL, the corresponding values are set in the CERT_KEY_PROV_INFO_PROP_ID value of the generated certificate. You must ensure that all parameters of the supplied structure are correctly specified.
pSignatureAlgorithm : [var] A pointer to a CRYPT_ALGORITHM_IDENTIFIER structure. If NULL, the default algorithm, SHA1RSA, is used.
pStartTime : [var] A pointer to a SYSTEMTIME structure. If NULL, the system current time is used by default.
pEndTime : [var] A pointer to a SYSTEMTIME structure. If NULL, the pStartTime value plus one year will be used by default.
pExtensions : [var] A pointer to a CERT_EXTENSIONS array of CERT_EXTENSION structures. By default, the array is empty. An alternate subject name, if desired, can be specified as one of these extensions.
%inst
Builds a self-signed certificate and returns a pointer to a
CERT_CONTEXT structure that represents the certificate.

[戻り値]
If the function succeeds, a PCCERT_CONTEXT variable that points to
the created certificate is returned. If the function fails, it
returns NULL. For extended error information, call GetLastError.

[備考]
As the pEndTime must be a valid date, and is automatically generated
if it is not supplied by the user, unexpected failures may easily be
caused when this API is called on a leap day without accompanying app
logic to compensate. For more information, please see [leap year
readiness](https://techcommunity.microsoft.com/t5/azure-developer-community-blog/it-s-2020-is-your-code-ready-for-leap-day/ba-p/1157279).


%index
CertDeleteCRLFromStore
The CertDeleteCRLFromStore function deletes the specified certificate revocation list (CRL) context from the certificate store.
%group
Win32 crypt32
%prm
pCrlContext
pCrlContext : [var] A pointer to the CRL_CONTEXT structure to be deleted.
%inst
The CertDeleteCRLFromStore function deletes the specified certificate
revocation list (CRL) context from the certificate store.

[戻り値]
If the function succeeds, the return value is TRUE. If the function
fails, the return value is FALSE. For extended error information,
call GetLastError. One possible error code is the following.
This doc was truncated.

[備考]
All subsequent get or find operations for the CRL in this store fail.
However, memory allocated for the CRL is not freed until all
duplicated contexts have also been freed. The pCrlContext parameter
is always freed by this function by using CertFreeCRLContext, even
for an error.


%index
CertDeleteCTLFromStore
The CertDeleteCTLFromStore function deletes the specified certificate trust list (CTL) context from a certificate store.
%group
Win32 crypt32
%prm
pCtlContext
pCtlContext : [var] A pointer to the CTL_CONTEXT structure to be deleted.
%inst
The CertDeleteCTLFromStore function deletes the specified certificate
trust list (CTL) context from a certificate store.

[戻り値]
If the function succeeds, the return value is TRUE. If the function
fails, the return value is FALSE. For extended error information,
call GetLastError. One possible error code is the following.
This doc was truncated.

[備考]
All subsequent get or find operations for the CTL in this store fail.
However, memory allocated for the CTL is not freed until all
duplicated contexts have also been freed. The pCtlContext parameter
is always freed by this function by using CertFreeCTLContext, even
for an error.


%index
CertDeleteCertificateFromStore
The CertDeleteCertificateFromStore function deletes the specified certificate context from the certificate store.
%group
Win32 crypt32
%prm
pCertContext
pCertContext : [var] A pointer to the CERT_CONTEXT structure to be deleted.
%inst
The CertDeleteCertificateFromStore function deletes the specified
certificate context from the certificate store.

[戻り値]
If the function succeeds, the return value is TRUE.
If the function fails, the return value is FALSE. For extended error
information, call GetLastError. One possible error code is the
following.
This doc was truncated.

[備考]
After a certificate is deleted from a store, all subsequent attempts
to get or find that certificate in that store will fail. However,
memory allocated for the certificate is not freed until all
duplicated contexts have also been freed. The
CertDeleteCertificateFromStore function always frees pCertContext by
calling the CertFreeCertificateContext function, even if an error is
encountered. Freeing the context reduces the context's reference
count by one. If the reference count reaches zero, memory allocated
for the certificate is freed.


%index
CertDuplicateCRLContext
The CertDuplicateCRLContext function duplicates a certificate revocation list (CRL) context by incrementing its reference count.
%group
Win32 crypt32
%prm
pCrlContext
pCrlContext : [var] A pointer to the CRL_CONTEXT structure for which the reference count is being incremented.
%inst
The CertDuplicateCRLContext function duplicates a certificate
revocation list (CRL) context by incrementing its reference count.

[戻り値]
Currently, a copy is not made of the context, and the returned
context is the same as the context that was input. If the pointer
passed into this function is NULL, NULL is returned.


%index
CertDuplicateCTLContext
The CertDuplicateCTLContext function duplicates a certificate trust list (CTL) context by incrementing its reference count.
%group
Win32 crypt32
%prm
pCtlContext
pCtlContext : [var] A pointer to the CTL_CONTEXT structure for which the reference count is being incremented.
%inst
The CertDuplicateCTLContext function duplicates a certificate trust
list (CTL) context by incrementing its reference count.

[戻り値]
Currently, a copy is not made of the context, and the returned
pointer to CTL_CONTEXT is the same as pointer input. If the pointer
passed into this function is NULL, NULL is returned.


%index
CertDuplicateCertificateChain
The CertDuplicateCertificateChain function duplicates a pointer to a certificate chain by incrementing the chain's reference count.
%group
Win32 crypt32
%prm
pChainContext
pChainContext : [var] A pointer to a CERT_CHAIN_CONTEXT chain context to be duplicated.
%inst
The CertDuplicateCertificateChain function duplicates a pointer to a
certificate chain by incrementing the chain's reference count.

[戻り値]
If the function succeeds, a pointer is returned to the chain context.
This pointer has the same value as the pChainContext passed into the
function. When you have finished using the chain context, release the
chain context by calling the CertFreeCertificateChain function. If
the function fails, NULL is returned.


%index
CertDuplicateCertificateContext
Duplicates a certificate context by incrementing its reference count.
%group
Win32 crypt32
%prm
pCertContext
pCertContext : [var] A pointer to the CERT_CONTEXT structure for which the reference count is incremented.
%inst
Duplicates a certificate context by incrementing its reference count.

[戻り値]
Currently, a copy is not made of the context, and the returned
pointer to a context has the same value as the pointer to a context
that was input. If the pointer passed into this function is NULL,
NULL is returned. When you have finished using the duplicate context,
decrease its reference count by calling the
CertFreeCertificateContext function.


%index
CertDuplicateStore
Duplicates a store handle by incrementing the store's reference count.
%group
Win32 crypt32
%prm
hCertStore
hCertStore : [int] A handle of the certificate store for which the reference count is being incremented.
%inst
Duplicates a store handle by incrementing the store's reference
count.

[戻り値]
Currently, a copy is not made of the handle, and the returned handle
is the same as the handle that was input. If NULL is passed in, the
called function will raise an access violation exception.


%index
CertEnumCRLContextProperties
The CertEnumCRLContextProperties function retrieves the first or next extended property associated with a certificate revocation list (CRL) context.
%group
Win32 crypt32
%prm
pCrlContext, dwPropId
pCrlContext : [var] A pointer to a CRL_CONTEXT structure.
dwPropId : [int] Property number of the last property enumerated. To get the first property, dwPropId is zero. To retrieve subsequent properties, dwPropId is set to the property number returned by the last call to the function. To enumerate all the properties, function calls continue until the function returns zero.
%inst
The CertEnumCRLContextProperties function retrieves the first or next
extended property associated with a certificate revocation list (CRL)
context.

[戻り値]
The return value is a DWORD value that identifies a CRL context's
property. The DWORD value returned by one call of the function can be
supplied as the dwPropId in a subsequent call to the function. If
there are no more properties to be enumerated or if the function
fails, zero is returned.


%index
CertEnumCRLsInStore
The CertEnumCRLsInStore function retrieves the first or next certificate revocation list (CRL) context in a certificate store. Used in a loop, this function can retrieve in sequence all CRL contexts in a certificate store.
%group
Win32 crypt32
%prm
hCertStore, pPrevCrlContext
hCertStore : [int] Handle of a certificate store.
pPrevCrlContext : [var] A pointer to the previous CRL_CONTEXT structure found. The pPrevCrlContext parameter must be NULL to get the first CRL in the store. Successive CRLs are enumerated by setting pPrevCrlContext to the pointer returned by a previous call to the function.  This function frees the CRL_CONTEXT referenced by non-NULL values of this parameter. The enumeration skips any CRLs previously deleted by CertDeleteCRLFromStore.
%inst
The CertEnumCRLsInStore function retrieves the first or next
certificate revocation list (CRL) context in a certificate store.
Used in a loop, this function can retrieve in sequence all CRL
contexts in a certificate store.

[戻り値]
If the function succeeds, the return value is a pointer to the next
CRL_CONTEXT in the store. NULL is returned if the function fails. For
extended error information, call GetLastError. Some possible error
codes follow.
This doc was truncated.

[備考]
The returned pointer is freed when it is passed as the
pPrevCrlContext on a subsequent call to the function. Otherwise, the
pointer must explicitly be freed by calling CertFreeCRLContext. A
pPrevCrlContext that is not NULL is always freed when passed to this
function through a call to CertFreeCRLContext, even if the function
itself returns an error. A duplicate of the CRL context returned by
this function can be made by calling CertDuplicateCRLContext.


%index
CertEnumCTLContextProperties
The CertEnumCTLContextProperties function retrieves the first or next extended property associated with a certificate trust list (CTL) context. Used in a loop, this function can retrieve in sequence all extended properties associated with a CTL context.
%group
Win32 crypt32
%prm
pCtlContext, dwPropId
pCtlContext : [var] A pointer to a CTL_CONTEXT structure.
dwPropId : [int] Property number of the last property enumerated. To get the first property, dwPropId is zero. To retrieve subsequent properties, dwPropId is set to the property number returned by the last call to the function. To enumerate all the properties, function calls continue until the function returns zero.
%inst
The CertEnumCTLContextProperties function retrieves the first or next
extended property associated with a certificate trust list (CTL)
context. Used in a loop, this function can retrieve in sequence all
extended properties associated with a CTL context.

[戻り値]
The return value is a DWORD value that identifies a CTL context's
property. The DWORD value returned by one call of the function can be
supplied as the dwPropId in a subsequent call to the function. If
there are no more properties to be enumerated or if the function
fails, zero is returned.


%index
CertEnumCTLsInStore
The CertEnumCTLsInStore function retrieves the first or next certificate trust list (CTL) context in a certificate store. Used in a loop, this function can retrieve in sequence all CTL contexts in a certificate store.
%group
Win32 crypt32
%prm
hCertStore, pPrevCtlContext
hCertStore : [int] Handle of a certificate store.
pPrevCtlContext : [var] A pointer to the previous CTL_CONTEXT structure found. It must be NULL to get the first CTL in the store. Successive CTLs are enumerated by setting pPrevCtlContext to the pointer returned by a previous call. This function frees the CTL_CONTEXT referenced by non-NULL values of this parameter. The enumeration skips any CTLs previously deleted by CertDeleteCTLFromStore.
%inst
The CertEnumCTLsInStore function retrieves the first or next
certificate trust list (CTL) context in a certificate store. Used in
a loop, this function can retrieve in sequence all CTL contexts in a
certificate store.

[戻り値]
If the function succeeds, the return value is a pointer to a
read-only CTL_CONTEXT. If the function fails and a CTL is not found,
the return value is NULL. For extended error information, call
GetLastError. Some possible error codes follow.
This doc was truncated.

[備考]
The returned pointer is freed when passed as the pPrevCtlContext on a
subsequent call. Otherwise, the pointer must be explicitly freed by
calling CertFreeCTLContext. A pPrevCtlContext that is not NULL is
always freed by this function (through a call to CertFreeCTLContext),
even for an error. A duplicate can be made by calling
CertDuplicateCTLContext.


%index
CertEnumCertificateContextProperties
The CertEnumCertificateContextProperties function retrieves the first or next extended property associated with a certificate context.
%group
Win32 crypt32
%prm
pCertContext, dwPropId
pCertContext : [var] A pointer to the CERT_CONTEXT structure of the certificate containing the properties to be enumerated.
dwPropId : [int] Property number of the last property enumerated. To get the first property, dwPropId is zero. To retrieve subsequent properties, dwPropId is set to the property number returned by the last call to the function. To enumerate all the properties, function calls continue until the function returns zero.
%inst
The CertEnumCertificateContextProperties function retrieves the first
or next extended property associated with a certificate context.

[戻り値]
The return value is a DWORD value that identifies a certificate
context's property. The DWORD value returned by one call of the
function can be supplied as the dwPropId in a subsequent call to the
function. If there are no more properties to be enumerated or if the
function fails, zero is returned.

[備考]
CERT_KEY_PROV_HANDLE_PROP_ID and CERT_KEY_SPEC_PROP_ID properties are
stored as members of the CERT_KEY_CONTEXT_PROP_ID property. They are
not enumerated individually.


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
CertEnumPhysicalStore
The CertEnumPhysicalStore function retrieves the physical stores on a computer. The function calls the provided callback function for each physical store found.
%group
Win32 crypt32
%prm
pvSystemStore, dwFlags, pvArg, pfnEnum
pvSystemStore : [intptr] If CERT_SYSTEM_STORE_RELOCATE_FLAG is set in dwFlags, pvSystemStore points to a CERT_SYSTEM_STORE_RELOCATE_PARA structure that indicates both the name and the location of the system store to be enumerated. Otherwise, pvSystemStore is a pointer to a Unicode string that names the system store whose physical stores are to be enumerated. For information about prefixing a ServiceName or ComputerName to the system store name, see CertRegisterSystemStore.
dwFlags : [int] Specifies the location of the system store. The following flag values are defined:
pvArg : [intptr] A pointer to a void that allows the application to declare, define, and initialize a structure to hold any information to be passed to the callback enumeration function.
pfnEnum : [int] A pointer to the callback function used to show the details for each physical store. This callback function determines the content and format for the presentation of information on each physical store. The application must provide the CertEnumPhysicalStoreCallback callback function.
%inst
The CertEnumPhysicalStore function retrieves the physical stores on a
computer. The function calls the provided callback function for each
physical store found.

[戻り値]
If the function succeeds and another physical store was found, the
return value is TRUE. If the system store location only supports
system stores and does not support physical stores, the function
returns FALSE and GetLastError returns the ERROR_NOT_SUPPORTED code.
If the function fails and another physical store was not found, the
return value is FALSE. For extended error information, call
GetLastError.

[備考]
To use CertEnumPhysicalStore, an application must declare and define
the ENUM_ARG structure and an enumeration callback function.


%index
CertEnumSubjectInSortedCTL
Retrieves the first or next TrustedSubject in a sorted certificate trust list (CTL).
%group
Win32 crypt32
%prm
pCtlContext, ppvNextSubject, pSubjectIdentifier, pEncodedAttributes
pCtlContext : [var] A pointer to the CTL_CONTEXT structure to be searched.
ppvNextSubject : [var] A pointer to the address of the last TrustedSubject found. To start the enumeration, ppvNextSubject must point to a pointer  set to NULL. Upon return, the pointer addressed by ppvNextSubject is updated to point to the next TrustedSubject in the encoded sequence.
pSubjectIdentifier : [var] A pointer to a CRYPT_DER_BLOB structure, uniquely identifying a TrustedSubject. The information in this structure can be a hash or any unique byte sequence.
pEncodedAttributes : [var] A pointer to a CRYPT_DER_BLOB structure containing a byte count and a pointer to the TrustedSubject's encoded attributes.
%inst
Retrieves the first or next TrustedSubject in a sorted certificate
trust list (CTL).

[戻り値]
If the function succeeds, the return value is TRUE, with
ppvNextSubject updated to point to the next TrustedSubject in the
encoded sequence. If the function fails, the return value is FALSE.
The return value is FALSE if there are no more subjects or there is
an argument that is not valid.

[備考]
The pbData members of CRYPT_DER_BLOB structures point directly to the
encoded bytes. The CRYPT_DER_BLOB structures, themselves, must be
allocated and freed by the application, but the memory addressed by
the pbData members of these structures is not allocated by the
application and must not be freed by the application. If the CTL is
not sorted with the CERT_CREATE_CONTEXT_SORTED_FLAG flag set, an
error results.


%index
CertEnumSystemStore
The CertEnumSystemStore function retrieves the system stores available. The function calls the provided callback function for each system store found.
%group
Win32 crypt32
%prm
dwFlags, pvSystemStoreLocationPara, pvArg, pfnEnum
dwFlags : [int] Specifies the location of the system store. This parameter can be one of the following flags:
pvSystemStoreLocationPara : [intptr] If CERT_SYSTEM_STORE_RELOCATE_FLAG is set in the dwFlags parameter, pvSystemStoreLocationPara points to a CERT_SYSTEM_STORE_RELOCATE_PARA structure that indicates both the name and the location of the system store. Otherwise, pvSystemStoreLocationPara is a pointer to a Unicode string that names the system store.
pvArg : [intptr] A pointer to a void  that allows the application to declare, define, and initialize a structure to hold any information to be passed to the callback enumeration function.
pfnEnum : [int] A pointer to the callback function used to show the details for each system store. This callback function determines the content and format for the presentation of information on each system store. The application must provide the CertEnumSystemStoreCallback callback function.
%inst
The CertEnumSystemStore function retrieves the system stores
available. The function calls the provided callback function for each
system store found.

[戻り値]
If the function succeeds, the function returns TRUE. If the function
fails, it returns FALSE.

[備考]
To use CertEnumSystemStore, the application must declare and define
the ENUM_ARG structure and the CertEnumSystemStoreCallback callback
function.


%index
CertEnumSystemStoreLocation
The CertEnumSystemStoreLocation function retrieves all of the system store locations. The function calls the provided callback function for each system store location found.
%group
Win32 crypt32
%prm
dwFlags, pvArg, pfnEnum
dwFlags : [int] Reserved for future use; must be zero.
pvArg : [intptr] A pointer to a void  that allows the application to declare, define, and initialize a structure to hold any information to be passed to the callback enumeration function.
pfnEnum : [int] A pointer to the callback function used to show the details for each store location. This callback function determines the content and format for the presentation of information on each store location. For the signature and parameters of the callback function, see CertEnumSystemStoreLocationCallback.
%inst
The CertEnumSystemStoreLocation function retrieves all of the system
store locations. The function calls the provided callback function
for each system store location found.

[戻り値]
If the function succeeds, the function returns TRUE.
If the function fails, it returns FALSE.

[備考]
To use CertEnumSystemStoreLocation, an application must declare and
define the ENUM_ARG structure and an enumeration callback function.


%index
CertFindAttribute
The CertFindAttribute function finds the first attribute in the CRYPT_ATTRIBUTE array, as identified by its object identifier (OID).
%group
Win32 crypt32
%prm
pszObjId, cAttr, rgAttr
pszObjId : [str] A pointer to the object identifier (OID) to use in the search.
cAttr : [int] Number of attributes in the rgAttr array.
rgAttr : [var] Array of CRYPT_ATTRIBUTE structures.
%inst
The CertFindAttribute function finds the first attribute in the
CRYPT_ATTRIBUTE array, as identified by its object identifier (OID).

[戻り値]
Returns a pointer to the attribute, if one is found. Otherwise, NULL
is returned.


%index
CertFindCRLInStore
Finds the first or next certificate revocation list (CRL) context in a certificate store that matches a search criterion established by the dwFindType parameter and the associated pvFindPara parameter.
%group
Win32 crypt32
%prm
hCertStore, dwCertEncodingType, dwFindFlags, dwFindType, pvFindPara, pPrevCrlContext
hCertStore : [int] A handle of the certificate store to be searched.
dwCertEncodingType : [int] This parameter is not currently used. It must be set to zero.
dwFindFlags : [int] If dwFindType is CRL_FIND_ISSUED_BY, by default, only issuer name matching is done. The following flags can be used to do additional filtering.
dwFindType : [int] Specifies the type of search being made. The value of dwFindType determines the data type, contents, and use of the pvFindPara parameter. Currently defined search types and their pvFindPara requirements are as follows.
pvFindPara : [intptr] This parameter is determined by the value of dwFindType. For details, see the table earlier in this topic.
pPrevCrlContext : [var] A pointer to the last CRL_CONTEXT returned by this function. Must be NULL to get the first CRL in the store meeting the search criteria. Successive CRLs meeting the search criteria can be found by setting pPrevCrlContext to the PCCRL_CONTEXT pointer returned by a previous call to the function. The search process skips any CRLs that do not match the search criteria or that have been previously deleted from the store by CertDeleteCRLFromStore. This function frees the CRL_CONTEXT referenced by values of this parameter that are not NULL.
%inst
Finds the first or next certificate revocation list (CRL) context in
a certificate store that matches a search criterion established by
the dwFindType parameter and the associated pvFindPara parameter.

[戻り値]
If the function succeeds, the function returns a pointer to a
read-only CRL context. When you have finished using the returned CRL
context, free it by calling the CertFreeCRLContext function or
implicitly free it by passing it as the pPrevCrlContext parameter on
a subsequent call to the CertFindCRLInStore function.
If the function fails and a CRL that matches the search criteria is
not found, the return value is NULL. For extended error information,
call GetLastError. Some possible error codes follow.
This doc was truncated.

[備考]
The returned pointer is freed when passed as the pPrevCrlContext
parameter on a subsequent call to the function. Otherwise, the
pointer must be explicitly freed by calling CertFreeCRLContext. A
pPrevCrlContext that is not NULL is always freed by
CertFindCRLInStore using a call to CertFreeCRLContext, even if there
is an error in the function.
CertDuplicateCRLContext can be called to make a duplicate of the
returned context. The returned CRL context can be added to a
different certificate store by using CertAddCRLContextToStore, or a
link to that CRL context can be added to a noncollection store by
using CertAddCRLLinkToStore.


%index
CertFindCTLInStore
Finds the first or next certificate trust list (CTL) context that matches search criteria established by the dwFindType and its associated pvFindPara.
%group
Win32 crypt32
%prm
hCertStore, dwMsgAndCertEncodingType, dwFindFlags, dwFindType, pvFindPara, pPrevCtlContext
hCertStore : [int] Handle of the certificate store to be searched.
dwMsgAndCertEncodingType : [int] Specifies the type of encoding used on the CTL. It is always acceptable to specify both the certificate and message encoding types by combining them with a bitwise-OR operation as shown in the following example: X509_ASN_ENCODING | PKCS_7_ASN_ENCODING Currently defined encoding types are:
dwFindFlags : [int] Can be set when dwFindType is set to CTL_FIND_USAGE. For details, see the comments under CTL_FIND_USAGE, following.
dwFindType : [int] 
pvFindPara : [intptr] A pointer to the search value associated with the dwFindType parameter.
pPrevCtlContext : [var] A pointer to the last CTL_CONTEXT returned by this function. It must be NULL to get the first CTL in the store. Successive CTLs are retrieved by setting pPrevCtlContext to the pointer to the CTL_CONTEXT returned by a previous function call. Any certificates that do not meet the search criteria or that have been previously deleted by CertDeleteCTLFromStore are skipped. This function frees the CTL_CONTEXT referenced by non-NULL values of this parameter.
%inst
Finds the first or next certificate trust list (CTL) context that
matches search criteria established by the dwFindType and its
associated pvFindPara.

[戻り値]
If the function succeeds, the return value is a pointer to a
read-only CTLcontext. For extended error information, call
GetLastError. Some possible error codes follow.
This doc was truncated.

[備考]
A returned pointer is freed when passed as the pPrevCtlContext on a
subsequent call to the function. Otherwise, the pointer must be freed
by calling CertFreeCTLContext. A non-NULLpPrevCtlContext passed to
the function is always freed with a call to CertFreeCTLContext, even
if the function generates an error.
CertDuplicateCTLContext can be called to make a duplicate of the
returned context. The returned CTL context can be added to a
different certificate store using CertAddCTLContextToStore, or a link
to that CTL context can be added to a noncollection store using
CertAddCTLLinkToStore. If a CTL matching the search criteria is not
found, NULL is returned.


%index
CertFindCertificateInCRL
The CertFindCertificateInCRL function searches the certificate revocation list (CRL) for the specified certificate.
%group
Win32 crypt32
%prm
pCert, pCrlContext, dwFlags, pvReserved, ppCrlEntry
pCert : [var] A pointer to a CERT_CONTEXT of the certificate to be searched for in the CRL.
pCrlContext : [var] A pointer to the CRL_CONTEXT to be searched.
dwFlags : [int] Reserved for future use. Must be set to zero.
pvReserved : [intptr] Reserved for future use. Must be set to zero.
ppCrlEntry : [var] If the certificate is found in the CRL, this pointer is updated with a pointer to the entry. Otherwise, it is set to NULL. The returned entry is not allocated and must not be freed.
%inst
The CertFindCertificateInCRL function searches the certificate
revocation list (CRL) for the specified certificate.

[戻り値]
TRUE if the list was searched; otherwise FALSE.


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
CertFindChainInStore
Finds the first or next certificate in a store that meets the specified criteria.
%group
Win32 crypt32
%prm
hCertStore, dwCertEncodingType, dwFindFlags, dwFindType, pvFindPara, pPrevChainContext
hCertStore : [int] The handle of the store to be searched for a certificate upon which a chain is built. This handle is passed as an additional store to the CertGetCertificateChain function as the chain is built.
dwCertEncodingType : [int] The certificate encoding type   that was used to encode the store. The message encoding type identifier, contained in the high WORD of this value, is ignored by this function.
dwFindFlags : [int] Contains additional options for the search. The possible values for this parameter depend on the value of the dwFindType parameter.
dwFindType : [int] Determines what criteria to use to find a certificate in the store.
pvFindPara : [intptr] A pointer that contains additional search criteria. The type and format of the data this parameter points to depends on the value of the dwFindType parameter.
pPrevChainContext : [var] A pointer to a CERT_CHAIN_CONTEXT structure returned from a previous call to this function. The search is begun from this certificate. For the first call to this function, this parameter must be NULL. In subsequent calls, it is the pointer returned by the previous call to the function.  If this parameter is not NULL, this function will free this structure.
%inst
Finds the first or next certificate in a store that meets the
specified criteria.

[戻り値]
If the first or next chain context is not built, NULL is returned.
Otherwise, a pointer to a read-only CERT_CHAIN_CONTEXT structure is
returned. The CERT_CHAIN_CONTEXT structure is freed when passed as
the pPrevChainContext parameter on a subsequent call to this
function. Otherwise, the CERT_CHAIN_CONTEXT structure must be freed
explicitly by calling the CertFreeCertificateChain function.

[備考]
The pPrevChainContext parameter must be NULL on the first call to
build the chain context. To build the next chain context, the
pPrevChainContext is set to the CERT_CHAIN_CONTEXT structure returned
by a previous call. If pPrevChainContext is not NULL, the structure
is always freed by this function by using the
CertFreeCertificateChain function, even if an error occurs.


%index
CertFindExtension
The CertFindExtension function finds the first extension in the CERT_EXTENSION array, as identified by its object identifier (OID).
%group
Win32 crypt32
%prm
pszObjId, cExtensions, rgExtensions
pszObjId : [str] A pointer to the object identifier (OID) to use in the search.
cExtensions : [int] Number of extensions in the rgExtensions array.
rgExtensions : [var] Array of CERT_EXTENSION structures.
%inst
The CertFindExtension function finds the first extension in the
CERT_EXTENSION array, as identified by its object identifier (OID).

[戻り値]
Returns a pointer to the extension, if one is found. Otherwise, NULL
is returned.


%index
CertFindRDNAttr
The CertFindRDNAttr function finds the first RDN attribute identified by its object identifier (OID) in a list of the Relative Distinguished Names (RDN).
%group
Win32 crypt32
%prm
pszObjId, pName
pszObjId : [str] A pointer to the object identifier (OID) to use In the search.
pName : [var] A pointer to a CERT_NAME_INFO structure containing the list of the Relative Distinguished Names to be searched.
%inst
The CertFindRDNAttr function finds the first RDN attribute identified
by its object identifier (OID) in a list of the Relative
Distinguished Names (RDN).

[戻り値]
Returns a pointer to the attribute, if one is found. Otherwise, NULL
is returned.


%index
CertFindSubjectInCTL
The CertFindSubjectInCTL function attempts to find the specified subject in a certificate trust list (CTL).
%group
Win32 crypt32
%prm
dwEncodingType, dwSubjectType, pvSubject, pCtlContext, dwFlags
dwEncodingType : [int] Specifies the encoding type used. Currently, only X509_ASN_ENCODING and PKCS_7_ASN_ENCODING are being used; however, additional encoding types may be added in the future. For either current encoding type, use:
dwSubjectType : [int] Specifies the type of subject to be searched for in the CTL. May be NULL for a default search.
pvSubject : [intptr] Pointer used in conjunction with the dwSubjectType parameter.
pCtlContext : [var] A pointer to the CTL_CONTEXT structure being searched.
dwFlags : [int] Reserved for future use and must be zero.
%inst
The CertFindSubjectInCTL function attempts to find the specified
subject in a certificate trust list (CTL).

[戻り値]
If the function succeeds, the return value is the entry, if it is
found. If the function fails, the return value is NULL. For extended
error information, call GetLastError. Some possible error codes
follow.
This doc was truncated.

[備考]
The certificate's hash or the SubjectIdentifier member of the
CTL_ANY_SUBJECT_INFO structure is used as the key in searching the
subject entries. A binary memory comparison is done between the key
and the entry's SubjectIdentifier.


%index
CertFindSubjectInSortedCTL
The CertFindSubjectInSortedCTL function attempts to find the specified subject in a sorted certificate trust list (CTL).
%group
Win32 crypt32
%prm
pSubjectIdentifier, pCtlContext, dwFlags, pvReserved, pEncodedAttributes
pSubjectIdentifier : [var] A pointer to a CRYPT_DATA_BLOB structure uniquely identifying the subject. The information in this structure can be a hash or any unique byte sequence.
pCtlContext : [var] A pointer to the CTL_CONTEXT structure to be searched.
dwFlags : [int] Reserved for future use and must be NULL.
pvReserved : [intptr] Reserved for future use and must be NULL.
pEncodedAttributes : [var] A pointer to a CRYPT_DER_BLOB structure containing a byte count and a pointer to the subject's encoded attributes.
%inst
The CertFindSubjectInSortedCTL function attempts to find the
specified subject in a sorted certificate trust list (CTL).

[戻り値]
If the function succeeds and the subject identifier exists in the
CTL, the return value is TRUE. If the function fails and does not
locate a matching subject identifier, the return value is FALSE.


%index
CertFreeCRLContext
Frees a certificate revocation list (CRL) context by decrementing its reference count.
%group
Win32 crypt32
%prm
pCrlContext
pCrlContext : [var] A pointer to the CRL_CONTEXT to be freed.
%inst
Frees a certificate revocation list (CRL) context by decrementing its
reference count.

[戻り値]
The function always returns TRUE.


%index
CertFreeCTLContext
Frees a certificate trust list (CTL) context by decrementing its reference count.
%group
Win32 crypt32
%prm
pCtlContext
pCtlContext : [var] A pointer to the CTL_CONTEXT to be freed.
%inst
Frees a certificate trust list (CTL) context by decrementing its
reference count.

[戻り値]
The function always returns TRUE.


%index
CertFreeCertificateChain
The CertFreeCertificateChain function frees a certificate chain by reducing its reference count. If the reference count becomes zero, memory allocated for the chain is released.
%group
Win32 crypt32
%prm
pChainContext
pChainContext : [var] A pointer to a CERT_CHAIN_CONTEXT certificate chain context to be freed. If the reference count on the context reaches zero, the storage allocated for the context is freed.
%inst
The CertFreeCertificateChain function frees a certificate chain by
reducing its reference count. If the reference count becomes zero,
memory allocated for the chain is released.


%index
CertFreeCertificateChainList
Frees the array of pointers to chain contexts.
%group
Win32 crypt32
%prm
prgpSelection
prgpSelection : [var] A pointer to a PCCERT_CHAIN_CONTEXT structure returned by the CertSelectCertificateChains function.
%inst
Frees the array of pointers to chain contexts.

[備考]
Before calling the CertFreeCertificateChainList function, you must
call the CertFreeCertificateChain function on each chain context
within the array pointed to by the prgpSelection parameter.


%index
CertFreeCertificateContext
Frees a certificate context by decrementing its reference count. When the reference count goes to zero, CertFreeCertificateContext frees the memory used by a certificate context.
%group
Win32 crypt32
%prm
pCertContext
pCertContext : [var] A pointer to the CERT_CONTEXT to be freed.
%inst
Frees a certificate context by decrementing its reference count. When
the reference count goes to zero, CertFreeCertificateContext frees
the memory used by a certificate context.

[戻り値]
The function always returns nonzero.


%index
CertFreeServerOcspResponseContext
Decrements the reference count for a CERT_SERVER_OCSP_RESPONSE_CONTEXT structure.
%group
Win32 crypt32
%prm
pServerOcspResponseContext
pServerOcspResponseContext : [var] A pointer to a CERT_SERVER_OCSP_RESPONSE_CONTEXT structure that contains a value returned by the CertGetServerOcspResponseContext function.
%inst
Decrements the reference count for a
CERT_SERVER_OCSP_RESPONSE_CONTEXT structure.


%index
CertGetCRLContextProperty
Gets an extended property for the specified certificate revocation list (CRL) context.
%group
Win32 crypt32
%prm
pCrlContext, dwPropId, pvData, pcbData
pCrlContext : [var] A pointer to the CRL_CONTEXT structure.
dwPropId : [int] Identifies the property to be retrieved. Currently defined identifiers and the data type to be returned in pvData are listed in the following table.
pvData : [intptr] A pointer to a buffer to receive the data as determined by dwPropId. Structures pointed to by members of a structure returned are also returned following the base structure. Therefore, the size contained in pcbData often exceed the size of the base structure.
pcbData : [var] A pointer to a DWORD value specifying the size, in bytes, of the buffer pointed to by the pvData parameter. When the function returns, the DWORD value contains the number of bytes to be stored in the buffer.
%inst
Gets an extended property for the specified certificate revocation
list (CRL) context.

[戻り値]
If the function succeeds, the return value is TRUE. If the function
fails, the return value is FALSE. Note that errors from the called
function CryptHashCertificate can be propagated to this function. For
extended error information, call GetLastError. Some possible error
codes follow.
This doc was truncated.


%index
CertGetCRLFromStore
Gets the first or next certificate revocation list (CRL) context from the certificate store for the specified issuer.
%group
Win32 crypt32
%prm
hCertStore, pIssuerContext, pPrevCrlContext, pdwFlags
hCertStore : [int] Handle of a certificate store.
pIssuerContext : [var] A pointer to an issuer CERT_CONTEXT. The pIssuerContext pointer can come from this store or another store, or could have been created by the calling CertCreateCertificateContext. If NULL is passed for this parameter, all the CRLs in the store are found.
pPrevCrlContext : [var] A pointer to a CRL_CONTEXT. An issuer can have multiple CRLs. For example, it can generate delta CRLs by using an X.509 version 3 extension. This parameter must be NULL on the first call to get the CRL. To get the next CRL for the issuer, the parameter is set to the CRL_CONTEXT returned by a previous call. A non-NULLpPrevCrlContext is always freed by this function by calling CertFreeCRLContext, even for an error.
pdwFlags : [var] The following flag values are defined to enable verification checks on the returned CRL. These flags can be combined using a bitwise-OR operation.
%inst
Gets the first or next certificate revocation list (CRL) context from
the certificate store for the specified issuer.

[戻り値]
If the function succeeds, the return value is a pointer to a
read-only CRL_CONTEXT. If the function fails and the first or next
CRL is not found, the return value is NULL. The returned CRL_CONTEXT
must be freed by calling CertFreeCRLContext. However, when the
returned CRL_CONTEXT is supplied for pPrevCrlContext on a subsequent
call, the function frees it. For extended error information, call
GetLastError. Some possible error codes follow.
This doc was truncated.

[備考]
CertDuplicateCRLContext can be called to make a duplicate CRL. The
hexadecimal values of the flags can be combined using a bitwise-OR
operation to enable both verifications. For example, to enable both
verifications, the DWORD value pointed to by pdwFlags is set to value
CERT_STORE_SIGNATURE_FLAG | CERT_STORE_TIME_VALIDITY_FLAG. If the
CERT_STORE_SIGNATURE_FLAG verification succeeded, but
CERT_STORE_TIME_VALIDITY_FLAG verification failed, the DWORD value
pointed to by pdwFlags is set to CERT_STORE_TIME_VALIDITY_FLAG when
the function returns.


%index
CertGetCTLContextProperty
Retrieves an extended property of a certificate trust list (CTL) context.
%group
Win32 crypt32
%prm
pCtlContext, dwPropId, pvData, pcbData
pCtlContext : [var] A pointer to the CTL_CONTEXT structure.
dwPropId : [int] Identifies the property to be retrieved. Currently defined identifiers and the data type to be returned in pvData are listed in the following table.
pvData : [intptr] A pointer to a buffer to receive the data as determined by dwPropId. Structures pointed to by members of a structure returned are also returned following the base structure. Therefore, the size contained in pcbData often exceed the size of the base structure.
pcbData : [var] A pointer to a DWORD value specifying the size, in bytes, of the buffer pointed to by the pvData parameter. When the function returns, the DWORD value contains the number of bytes to be stored in the buffer.
%inst
Retrieves an extended property of a certificate trust list (CTL)
context.

[戻り値]
If the function succeeds, the return value is TRUE. If the function
fails, the return value is FALSE. Errors from the called function,
CryptHashCertificate, can be propagated to this function. For
extended error information, call GetLastError. Some possible error
codes follow.
This doc was truncated.


%index
CertGetCertificateChain
Builds a certificate chain context starting from an end certificate and going back, if possible, to a trusted root certificate.
%group
Win32 crypt32
%prm
hChainEngine, pCertContext, pTime, hAdditionalStore, pChainPara, dwFlags, pvReserved, ppChainContext
hChainEngine : [intptr] A handle of the chain engine (namespace and cache) to be used. If hChainEngine is NULL, the default chain engine, HCCE_CURRENT_USER, is used. This parameter can be set to HCCE_LOCAL_MACHINE.
pCertContext : [var] A pointer to the CERT_CONTEXT of the end certificate, the certificate for which a chain is being built. This certificate context will be the zero-index element in the first simple chain.
pTime : [var] A pointer to a FILETIME variable that indicates the time for which the chain is to be validated. Note that the time does not affect trust list, revocation, or root store checking. The current system time is used if NULL is passed to this parameter. Trust in a particular certificate being a trusted root is based on the current state of the root store and not the state of the root store at a time passed in by this parameter. For revocation, a certificate revocation list (CRL), itself, must be valid at the current time. The value of this parameter is used to determine whether a certificate listed in a CRL has been revoked.
hAdditionalStore : [int] A handle to any additional store to search for supporting certificates and certificate trust lists (CTLs). This parameter can be NULL if no additional store is to be searched.
pChainPara : [var] A pointer to a CERT_CHAIN_PARA structure that includes chain-building parameters.
dwFlags : [int] Flag values that indicate special processing. This parameter can be a combination of one or more of the  following flags.
pvReserved : [intptr] This parameter is reserved and must be NULL.
ppChainContext : [var] The address of a pointer to the chain context created. When you have finished using the chain context, release the chain by calling the CertFreeCertificateChain function.
%inst
Builds a certificate chain context starting from an end certificate
and going back, if possible, to a trusted root certificate.

[戻り値]
If the function succeeds, the function returns nonzero (TRUE). If the
function fails, it returns zero (FALSE). For extended error
information, call GetLastError.

[備考]
When an application requests a certificate chain, the structure
returned is in the form of a CERT_CHAIN_CONTEXT. This context
contains an array of CERT_SIMPLE_CHAIN structures where each simple
chain goes from an end certificate to a self-signed certificate. The
chain context connects simple chains through trust lists. Each simple
chain contains the chain of certificates, summary trust information
about the chain, and trust information about each certificate element
in the chain.
This doc was truncated.


%index
CertGetCertificateContextProperty
Retrieves the information contained in an extended property of a certificate context.
%group
Win32 crypt32
%prm
pCertContext, dwPropId, pvData, pcbData
pCertContext : [var] A pointer to the CERT_CONTEXT structure of the certificate that contains the property to be retrieved.
dwPropId : [int] The property to be retrieved. Currently defined identifiers and the data type to be returned in pvData are listed in the following table.
pvData : [intptr] A pointer to a buffer to receive the data as determined by dwPropId. Structures pointed to by members of a structure returned are also returned following the base structure. Therefore, the size contained in pcbData often exceeds the size of the base structure. This parameter can be NULL to set the size of the information for memory allocation purposes. For more information, see Retrieving Data of Unknown Length.
pcbData : [var] A pointer to a DWORD value that specifies the size, in bytes, of the buffer pointed to by the pvData parameter. When the function returns, the DWORD value contains the number of bytes to be stored in the buffer. To obtain the required size of a buffer at run time, pass NULL for the pvData parameter, and set the value pointed to by this parameter to zero. If the pvData parameter is not NULL and the size specified in pcbData   is less than the number of bytes required to  contain the data, the function fails, GetLastError returns ERROR_MORE_DATA, and the required size is placed in the variable pointed to by the pcbData parameter. Note??When processing the data returned in the buffer, applications must use the actual size of the data returned. The actual size can be slightly smaller than the size of the buffer specified on input. (On input, buffer sizes are usually specified large enough to ensure that the largest possible output data fits in the buffer.) On output, the variable pointed to by this parameter is updated to reflect the actual size of the data copied to the buffer.
%inst
Retrieves the information contained in an extended property of a
certificate context.

[戻り値]
If the function succeeds, the function returns TRUE. If the function
fails, it returns FALSE. For extended error information, call
GetLastError. Some possible error codes follow.
This doc was truncated.

[備考]
Properties are not stored inside a certificate. Typically, they are
associated with a certificate after the certificate response is
received and then saved with the certificate in the store. For
security reasons, we recommend that you validate property values
before saving them and that you save only informational properties
such as the CERT_FRIENDLY_NAME_PROP_ID value in user stores. All
other property types should be saved in local computer stores. Your
code can use a macro to evaluate the class of hash for a certificate
context. For more information, see CertSetCertificateContextProperty.


%index
CertGetEnhancedKeyUsage
Returns information from the enhanced key usage (EKU) extension or the EKU extended property of a certificate.
%group
Win32 crypt32
%prm
pCertContext, dwFlags, pUsage, pcbUsage
pCertContext : [var] A pointer to a CERT_CONTEXT certificate context.
dwFlags : [int] Indicates whether the function will report on extensions of a certificate, its extended properties, or both. If set to zero, the function returns the valid uses of a certificate based on both the EKU extension and the EKU extended property value of the certificate.
pUsage : [var] A pointer to a CERT_ENHKEY_USAGE structure (CERT_ENHKEY_USAGE is an alternate typedef name for the CTL_USAGE structure) that receives the valid uses of the certificate.
pcbUsage : [var] A pointer to a DWORD that specifies the size, in bytes, of the structure pointed to by pUsage. When the function returns, the DWORD contains the size, in bytes, of the structure.
%inst
Returns information from the enhanced key usage (EKU) extension or
the EKU extended property of a certificate.

[戻り値]
If the function succeeds, the function returns nonzero (TRUE). If the
function fails, it returns zero (FALSE).

[備考]
If a certificate has an EKU extension, that extension lists object
identifiers (OIDs) for valid uses of that certificate. In a Microsoft
environment, a certificate might also have EKU extended properties
that specify valid uses for the certificate.
This doc was truncated.


%index
CertGetIntendedKeyUsage
Acquires the intended key usage bytes from a certificate.
%group
Win32 crypt32
%prm
dwCertEncodingType, pCertInfo, pbKeyUsage, cbKeyUsage
dwCertEncodingType : [int] Specifies the encoding type used. It is always acceptable to specify both the certificate and message encoding types by combining them with a bitwise-OR operation as shown in the following example: X509_ASN_ENCODING | PKCS_7_ASN_ENCODING Currently defined encoding types are:
pCertInfo : [var] A pointer to CERT_INFO structure of the specified certificate.
pbKeyUsage : [var] A pointer to a buffer to receive the intended key usage. The following list shows currently defined values. These can be combined by using bitwise-OR operations.
cbKeyUsage : [int] The size, in bytes, of the buffer pointed to by pbKeyUsage. Currently, the intended key usage occupies 1 or 2 bytes of data.
%inst
Acquires the intended key usage bytes from a certificate.

[戻り値]
If the certificate does not have any intended key usage bytes, FALSE
is returned and pbKeyUsage is zeroed. Otherwise, TRUE is returned and
up to cbKeyUsage number of bytes are copied into pbKeyUsage. Any
remaining bytes not copied are zeroed.
GetLastError returns zero if none of the required extensions is
found. If the function fails, GetLastError may return an Abstract
Syntax Notation One (ASN.1) encoding/decoding error. For information
about these errors, see ASN.1 Encoding/Decoding Return Values.


%index
CertGetIssuerCertificateFromStore
Retrieves the certificate context from the certificate store for the first or next issuer of the specified subject certificate. The new Certificate Chain Verification Functions are recommended instead of the use of this function.
%group
Win32 crypt32
%prm
hCertStore, pSubjectContext, pPrevIssuerContext, pdwFlags
hCertStore : [int] Handle of a certificate store.
pSubjectContext : [var] A pointer to a CERT_CONTEXT structure that contains the subject information. This parameter can be obtained from any certificate store or can be created by the calling application using the CertCreateCertificateContext function.
pPrevIssuerContext : [var] A pointer to a CERT_CONTEXT structure that contains the issuer information. An issuer can have multiple certificates, especially when a validity period is about to change. This parameter must be NULL on the call to get the first issuer certificate. To get the next certificate for the issuer, set pPrevIssuerContext to the CERT_CONTEXT structure returned by the previous call. This function frees the CERT_CONTEXT referenced by non-NULL values of this parameter.
pdwFlags : [var] The following flags enable verification checks on the returned certificate. They can be combined using a bitwise-OR operation to enable multiple verifications.
%inst
Retrieves the certificate context from the certificate store for the
first or next issuer of the specified subject certificate. The new
Certificate Chain Verification Functions are recommended instead of
the use of this function.

[戻り値]
If the function succeeds, the return value is a pointer to a
read-only issuer CERT_CONTEXT. If the function fails and the first or
next issuer certificate is not found, the return value is NULL. Only
the last returned CERT_CONTEXT structure must be freed by calling
CertFreeCertificateContext. When the returned CERT_CONTEXT from one
call to the function is supplied as the pPrevIssuerContext parameter
on a subsequent call, the context is freed as part of the action of
the function. For extended error information, call GetLastError. Some
possible error codes follow.
This doc was truncated.

[備考]
The returned pointer is freed when passed as the pPrevIssuerContext
parameter on a subsequent call to the function. Otherwise, the
pointer must be explicitly freed by calling
CertFreeCertificateContext. A pPrevIssuerContext that is not NULL is
always freed by CertGetIssuerCertificateFromStore using a call to
CertFreeCertificateContext, even if there is an error in the
function.
CertDuplicateCertificateContext can be called to make a duplicate of
the issuer certificate. The hexadecimal values for dwFlags can be
combined using a bitwise-OR operation to enable multiple
verifications. For example, to enable both signature and time
validity, the value 0x00000003 is passed in dwFlags on input. In this
case, if CERT_STORE_SIGNATURE_FLAG verification succeeds but
CERT_STORE_TIME_VALIDITY_FLAG verification fails, dwFlags returns as
0x00000002 on output.


%index
CertGetNameStringW
Obtains the subject or issuer name from a certificate CERT_CONTEXT structure and converts it to a null-terminated character string. (Unicode)
%group
Win32 crypt32
%prm
pCertContext, dwType, dwFlags, pvTypePara, pszNameString, cchNameString
pCertContext : [var] A pointer to a CERT_CONTEXT certificate context that includes a subject and issuer name to be converted.
dwType : [int] DWORD indicating how the name is to be found and how the output is to be formatted.
dwFlags : [int] Indicates the type of processing needed.
pvTypePara : [intptr] A pointer to either a DWORD containing the dwStrType or an object identifier (OID) specifying the name attribute. The type pointed to is determined by the value of dwType.
pszNameString : [wstr] A pointer to an allocated buffer to receive the returned string. If pszNameString is not NULL and cchNameString is not zero, pszNameString is a null-terminated string. If CERT_NAME_SEARCH_ALL_NAMES_FLAG is specified in the dwFlags parameter and CERT_NAME_DNS_TYPE is set in the dwType parameter, the returned string will contain all of the DNS names that apply. Each string in the output string is null-terminated and the last string will be double null-terminated. If no DNS names are found, a single null-terminated empty string is returned.
cchNameString : [int] Size, in characters, allocated for the returned string. The size must include the terminating NULL character.
%inst
Obtains the subject or issuer name from a certificate CERT_CONTEXT
structure and converts it to a null-terminated character string.
(Unicode)

[戻り値]
Returns the number of characters converted, including the terminating
zero character. If pszNameString is NULL or cchNameString is zero,
returns the required size of the destination string (including the
terminating NULL character). If the specified name type is not found,
returns a null-terminated empty string with a returned character
count of 1.

[備考]
> [!NOTE] > The wincrypt.h header defines CertGetNameString as an
alias which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
CertGetPublicKeyLength
The CertGetPublicKeyLength function acquires the bit length of public/private keys from a public key BLOB.
%group
Win32 crypt32
%prm
dwCertEncodingType, pPublicKey
dwCertEncodingType : [int] Specifies the encoding type used. It is always acceptable to specify both the certificate and message encoding types by combining them with a bitwise-OR operation as shown in the following example: X509_ASN_ENCODING | PKCS_7_ASN_ENCODING Currently defined encoding types are:
pPublicKey : [var] A pointer to the public key BLOB containing the keys for which the length is being retrieved.
%inst
The CertGetPublicKeyLength function acquires the bit length of
public/private keys from a public key BLOB.

[戻り値]
Returns the length of the public/private keys in bits. If unable to
determine the key's length, returns zero. Call GetLastError to see
the reason for any failures.


%index
CertGetServerOcspResponseContext
Retrieves a non-blocking, time valid online certificate status protocol (OCSP) response context for the specified handle.
%group
Win32 crypt32
%prm
hServerOcspResponse, dwFlags, pvReserved
hServerOcspResponse : [intptr] The OCSP server response handle for which to retrieve a response context. This handle is returned by the CertOpenServerOcspResponse function.
dwFlags : [int] This parameter is reserved for future use and must be zero.
pvReserved : [intptr] This parameter is reserved for future use and must be NULL.
%inst
Retrieves a non-blocking, time valid online certificate status
protocol (OCSP) response context for the specified handle.

[戻り値]
If the function succeeds, it returns a pointer to a
CERT_SERVER_OCSP_RESPONSE_CONTEXT structure. For a response to be
time valid, the current time on the system hosting this function call
must be less than the next update time for the certificate revocation
list (CRL) context. When a time valid OCSP response is not available,
this function returns NULL with the last error set to
CRYPT_E_REVOCATION_OFFLINE. If the certificate is unknown by the OCSP
responder, this function returns NULL with the last error set to
CRYPT_E_REVOCATION_OFFLINE.

[備考]
If you use the CertGetServerOcspResponseContext function to create
multiple references to an OCSP response context, you must call
CertAddRefServerOcspResponseContext to increment the reference count
for the CERT_SERVER_OCSP_RESPONSE_CONTEXT structure. When you have
finished using the structure, you must free it by calling the
CertFreeServerOcspResponseContext function.


%index
CertGetStoreProperty
Retrieves a store property.
%group
Win32 crypt32
%prm
hCertStore, dwPropId, pvData, pcbData
hCertStore : [int] A handle of an open certificate store.
dwPropId : [int] Indicates one of a range of store properties. There is one predefined store property, CERT_STORE_LOCALIZED_NAME_PROP_ID, the localized name of the store. User defined properties must be outside the current range of values for predefined context properties. Currently, user defined dwPropId values begin at 4,096.
pvData : [intptr] A pointer to a buffer that receives the data as determined by dwPropId. For CERT_STORE_LOCALIZED_NAME_PROP_ID, this is the localized name of the store, and pvData points to a null-terminated Unicode wide-character string. For other dwPropIds, pvData points to an array of bytes. This parameter can be NULL to set the size of this information for memory allocation purposes. For more information, see Retrieving Data of Unknown Length.
pcbData : [var] A pointer to a DWORD value that specifies the size, in bytes, of the pvData buffer. When the function returns, the DWORD value contains the number of bytes stored in the buffer.
%inst
Retrieves a store property.

[戻り値]
If the function succeeds, the function returns nonzero. If the
function fails, it returns zero. If the store property is found, the
function returns nonzero, pvData points to the property, and pcbData
points to the length of the string. If the store property is not
found, the function returns zero and GetLastError returns
CRYPT_E_NOT_FOUND.

[備考]
Store property identifiers are properties applicable to an entire
store. They are not properties on an individual certificate,
certificate revocation list (CRL), or certificate trust list (CTL)
context. Currently, no store properties are persisted. To find the
localized name of a store, you can also use the
CryptFindLocalizedName function.


%index
CertGetSubjectCertificateFromStore
Returns from a certificate store a subject certificate context uniquely identified by its issuer and serial number.
%group
Win32 crypt32
%prm
hCertStore, dwCertEncodingType, pCertId
hCertStore : [int] A handle of a certificate store.
dwCertEncodingType : [int] The type of encoding used. It is always acceptable to specify both the certificate and message encoding types by combining them with a bitwise-OR operation as shown in the following example: X509_ASN_ENCODING | PKCS_7_ASN_ENCODING Currently defined encoding types are:
pCertId : [var] A pointer to a CERT_INFO structure. Only the Issuer and SerialNumber members are used.
%inst
Returns from a certificate store a subject certificate context
uniquely identified by its issuer and serial number.

[戻り値]
If the function succeeds, the function returns a pointer to a
read-only CERT_CONTEXT. The CERT_CONTEXT must be freed by calling
CertFreeCertificateContext. The returned certificate might not be
valid. Usually, it is verified when getting its issuer certificate
(CertGetIssuerCertificateFromStore). For extended error information,
call GetLastError. One possible error code is the following.
This doc was truncated.

[備考]
CertDuplicateCertificateContext can be called to make a duplicate
certificate.


%index
CertGetValidUsages
Returns an array of usages that consist of the intersection of the valid usages for all certificates in an array of certificates.
%group
Win32 crypt32
%prm
cCerts, rghCerts, cNumOIDs, rghOIDs, pcbOIDs
cCerts : [int] The number of certificates in the array to be checked.
rghCerts : [var] An array of certificates to be checked for valid usage.
cNumOIDs : [var] The number of valid usages found as the intersection of the valid usages of all certificates in the array. If all of the certificates are valid for all usages, cNumOIDs is set to negative one (?1).
rghOIDs : [var] An array of the object identifiers (OIDs) of the valid usages that are shared by all of the certificates in the rghCerts array. This parameter can be NULL to set the size of this structure for memory allocation purposes. For more information, see Retrieving Data of Unknown Length.
pcbOIDs : [var] A pointer to a DWORD value that specifies the size, in bytes, of the rghOIDs array and the strings pointed to. When the function returns, the DWORD value contains the number of bytes needed for the array.
%inst
Returns an array of usages that consist of the intersection of the
valid usages for all certificates in an array of certificates.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero. For extended error
information, call GetLastError.


%index
CertIsRDNAttrsInCertificateName
The CertIsRDNAttrsInCertificateName function compares the attributes in the certificate name with the specified CERT_RDN to determine whether all attributes are included there.
%group
Win32 crypt32
%prm
dwCertEncodingType, dwFlags, pCertName, pRDN
dwCertEncodingType : [int] Specifies the encoding type used. It is always acceptable to specify both the certificate and message encoding types by combining them with a bitwise-OR operation as shown in the following example: X509_ASN_ENCODING | PKCS_7_ASN_ENCODING Currently defined encoding types are:
dwFlags : [int] CERT_UNICODE_IS_RDN_ATTRS_FLAG must be set if the pRDN was initialized with Unicode strings as in CryptEncodeObject with lpszStructType set to X509_UNICODE_NAME. CERT_CASE_INSENSITIVE_IS_RDN_ATTRS_FLAG is set to do a case insensitive match. Otherwise, an exact, case sensitive match is done.
pCertName : [var] A pointer to a CRYPT_INTEGER_BLOB that contains the encoded subject or issuer name.
pRDN : [var] Array of CERT_RDN structures that contain the attributes to be found in the name. The CERT_RDN_ATTR member of the CERT_RDN structure behaves according to the following rules.
%inst
The CertIsRDNAttrsInCertificateName function compares the attributes
in the certificate name with the specified CERT_RDN to determine
whether all attributes are included there.

[戻り値]
If the function succeeds and all of the RDN values in the specified
CERT_RDN are in the certificate name, the return value is nonzero
(TRUE). If the function fails, or if there are RDN values in the
specified CERT_RDN that are not in the certificate name, the return
value is zero (FALSE). For extended error information, call
GetLastError. The following table lists some possible error codes.
This doc was truncated.

[備考]
Currently, only an exact, case-sensitive match is supported.


%index
CertIsStrongHashToSign
Determines whether the specified hash algorithm and the public key in the signing certificate can be used to perform strong signing.
%group
Win32 crypt32
%prm
pStrongSignPara, pwszCNGHashAlgid, pSigningCert
pStrongSignPara : [var] Pointer to a CERT_STRONG_SIGN_PARA structure that contains information about supported signing and hashing algorithms.
pwszCNGHashAlgid : [wstr] Pointer to a Unicode string that contains the name of the hashing algorithm. The following algorithms are supported:
pSigningCert : [var] Pointer to a CERT_CONTEXT structure that  contains the signing certificate. The public key algorithm in the signing certificate is checked for strength. The public key (asymmetric) algorithm is used for signing. The following signature algorithms are supported:
%inst
Determines whether the specified hash algorithm and the public key in
the signing certificate can be used to perform strong signing.

[戻り値]
If the function succeeds, the function returns TRUE. If the function
fails, it returns FALSE. For extended error information, call
GetLastError. This function has the following error codes.
This doc was truncated.


%index
CertIsValidCRLForCertificate
The CertIsValidCRLForCertificate function checks a CRL to find out if it is a CRL that would include a specific certificate if that certificate were revoked.
%group
Win32 crypt32
%prm
pCert, pCrl, dwFlags, pvReserved
pCert : [var] A pointer to a certificate context.
pCrl : [var] A pointer to a CRL. The function checks this CRL to determine whether it could contain the certificate context pointed to by pCert. The function does not look for the certificate in the CRL.
dwFlags : [int] Currently not used and must be set to zero.
pvReserved : [intptr] Currently not used and must be set to NULL.
%inst
The CertIsValidCRLForCertificate function checks a CRL to find out if
it is a CRL that would include a specific certificate if that
certificate were revoked.

[戻り値]
The function returns TRUE if the CRL is a valid CRL to be searched
for the specific certificate. It returns FALSE if the CRL is not a
valid CRL for searching for the certificate.

[備考]
For the CRL to be valid for the certificate, the
CertIsValidCRLForCertificate function does not require the CRL to be
issued by the same certification authority (CA) as the issuer of the
certificate.


%index
CertIsWeakHash
(no summary)
%group
Win32 crypt32
%prm
dwHashUseType, pwszCNGHashAlgid, dwChainFlags, pSignerChainContext, pTimeStamp, pwszFileName
dwHashUseType : [int] 
pwszCNGHashAlgid : [wstr] 
dwChainFlags : [int] 
pSignerChainContext : [var] 
pTimeStamp : [var] 
pwszFileName : [wstr] 
%inst



%index
CertNameToStrW
Converts an encoded name in a CERT_NAME_BLOB structure to a null-terminated character string. (Unicode)
%group
Win32 crypt32
%prm
dwCertEncodingType, pName, dwStrType, psz, csz
dwCertEncodingType : [int] The certificate encoding type   that was used to encode the name. The message encoding type identifier, contained in the high WORD of this value, is ignored by this function.
pName : [var] A pointer to the CERT_NAME_BLOB structure to be converted.
dwStrType : [int] This parameter specifies the format of the output string. This parameter also specifies other options for the contents of the string.
psz : [wstr] A pointer to a character buffer that receives the returned string. The size of this buffer is specified in the csz parameter.
csz : [int] The size, in characters, of the psz buffer. The size must include the terminating null character.
%inst
Converts an encoded name in a CERT_NAME_BLOB structure to a
null-terminated character string. (Unicode)

[戻り値]
Returns the number of characters converted, including the terminating
null character. If psz is NULL or csz is zero, returns the required
size of the destination string.

[備考]
If psz is not NULL and csz is not zero, the returned psz is always a
null-terminated string. We recommend against using multicomponent
RDNs (e.g., CN=James+O=Microsoft) to avoid possible ordering problems
when decoding occurs. Instead, consider using single valued RDNs
(e.g., CN=James, O=Microsoft). The string representation follows the
distinguished name specifications in RFC 1779 except for the
deviations described in the following list.
This doc was truncated.


%index
CertOIDToAlgId
Use the CryptFindOIDInfo function instead of this function because ALG_ID identifiers are no longer supported in CNG.
%group
Win32 crypt32
%prm
pszObjId
pszObjId : [str] Pointer to the ASN.1 OID to be converted to an algorithm identifier.
%inst
Use the CryptFindOIDInfo function instead of this function because
ALG_ID identifiers are no longer supported in CNG.

[戻り値]
Returns the ALG_ID that corresponds to the object identifier (OID) or
zero if no ALG_ID corresponds to the OID.


%index
CertOpenServerOcspResponse
Opens a handle to an online certificate status protocol (OCSP) response associated with a server certificate chain.
%group
Win32 crypt32
%prm
pChainContext, dwFlags, pOpenPara
pChainContext : [var] The address of a CERT_CHAIN_CONTEXT structure that contains the certificate chain.
dwFlags : [int] This parameter is not used and must be zero.
pOpenPara : [var] This parameter is not used and must be NULL.
%inst
Opens a handle to an online certificate status protocol (OCSP)
response associated with a server certificate chain.

[戻り値]
Returns a handle to the OCSP response associated with a server
certificate chain if successful; otherwise, NULL. This handle must be
passed to the CertCloseServerOcspResponse function when it is no
longer needed. For extended error information, call GetLastError.
Possible error codes returned by the GetLastError function include,
but are not limited to, the following.
This doc was truncated.

[備考]
The CertOpenServerOcspResponse function tries to retrieve an initial
OCSP response before it returns. It blocks its process thread during
the retrieval. The CertOpenServerOcspResponse function creates a
background thread that prefetches time-valid OCSP responses. The
CertOpenServerOcspResponse function increments the reference count
for the chain context represented by the pChainContext parameter.
When you have finished using the chain context, close the returned
handle by calling the CertCloseServerOcspResponse function. The
CertOpenServerOcspResponse function initializes configuration
settings used by the following functions:
This doc was truncated.


%index
CertOpenStore
Opens a certificate store by using a specified store provider type.
%group
Win32 crypt32
%prm
lpszStoreProvider, dwEncodingType, hCryptProv, dwFlags, pvPara
lpszStoreProvider : [str] A pointer to a null-terminated ANSI string that contains the store provider type. The following values  represent the predefined store types. The store provider type determines the contents of the pvPara parameter and the use and meaning of the high word of the dwFlags parameter. Additional store providers can be installed or registered by using the CryptInstallOIDFunctionAddress or CryptRegisterOIDFunction function. For more information about adding store providers, see Extending CertOpenStore Functionality.
dwEncodingType : [int] Specifies the certificate encoding type and message encoding type. Encoding is used only when the dwSaveAs parameter of  the CertSaveStore function contains CERT_STORE_SAVE_AS_PKCS7. Otherwise, the dwMsgAndCertEncodingType parameter is not used. This parameter is only applicable  when the CERT_STORE_PROV_MSG, CERT_STORE_PROV_PKCS7, or CERT_STORE_PROV_FILENAME provider type is specified in the lpszStoreProvider parameter. For all other provider types, this parameter is unused and should be set to zero.
hCryptProv : [int] This parameter is not used and should be set to NULL. Windows Server?2003 and Windows?XP:??A handle to a cryptographic provider. Passing NULL for this parameter causes an appropriate, default provider to be used. Using the default provider is recommended. The default or specified cryptographic provider is used for all store functions that verify the signature of a subject certificate or CRL.This parameter's data type is HCRYPTPROV.
dwFlags : [int] These values consist of high-word and low-word values combined by using a bitwise-OR operation.
pvPara : [intptr] A 32-bit value that can contain additional information for this function. The contents of this parameter depends on the value of the lpszStoreProvider and other parameters.
%inst
Opens a certificate store by using a specified store provider type.

[戻り値]
If the function succeeds, the function returns a handle to the
certificate store. When you have finished using the store, release
the handle by calling the CertCloseStore function. If the function
fails, it returns NULL. For extended error information, call
GetLastError.
Note CreateFile, ReadFile, or registry errors might be propagated and
their error codes returned. CertOpenStore has a single error code of
its own, the ERROR_FILE_NOT_FOUND code, which indicates that the
function was unable to find the provider specified by the
lpszStoreProvider parameter.

[備考]
A system store is a collection that consists of one or more physical
sibling stores. For each system store, there are predefined physical
sibling stores. After opening a system store such as "My" at
CERT_SYSTEM_STORE_CURRENT_USER, CertOpenStore is called to open all
of the physical stores in the system store collection. Each of these
physical stores is added to the system store collection by using the
CertAddStoreToCollection function. All certificates, CRLs, and CTLs
in those physical stores are available through the logical system
store collection. Note The order of the certificate context may not
be preserved within the store. To access a specific certificate you
must iterate across the certificates in the store. The following
system store locations can be opened remotely:
This doc was truncated.


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
CertRDNValueToStrW
The CertRDNValueToStr function converts a name in a CERT_RDN_VALUE_BLOB to a null-terminated character string. (Unicode)
%group
Win32 crypt32
%prm
dwValueType, pValue, psz, csz
dwValueType : [int] Indicates the kind of RDN value to be converted.
pValue : [var] A pointer to an CERT_RDN_VALUE_BLOB of a type appropriate for the dwValueType.
psz : [wstr] A pointer to a buffer to receive the returned string.
csz : [int] Size, in characters, allocated for the returned string. The size must include the terminating NULL character.
%inst
The CertRDNValueToStr function converts a name in a
CERT_RDN_VALUE_BLOB to a null-terminated character string. (Unicode)

[戻り値]
Returns the number of characters converted, including the terminating
NULL character. If psz is NULL or csz is zero, returns the required
size of the destination string.

[備考]
If psz is not NULL and csz is not zero, the returned psz is always a
possibly empty null-terminated string.
> [!NOTE] > The wincrypt.h header defines CertRDNValueToStr as an
alias which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
CertRegisterPhysicalStore
Adds a physical store to a registry system store collection.
%group
Win32 crypt32
%prm
pvSystemStore, dwFlags, pwszStoreName, pStoreInfo, pvReserved
pvSystemStore : [intptr] The system store collection to which the physical store is added. This parameter points either to a null-terminated Unicode string or to a CERT_SYSTEM_STORE_RELOCATE_PARA structure. For information about using the structure and on adding a ServiceName or ComputerName before the system store name string, see CertRegisterSystemStore.
dwFlags : [int] The high word of the dwFlags parameter specifies the location of the system store. For information about defined high-word flags and appending ServiceName, UserNames, and ComputerNames to the end of the system store name, see CertRegisterSystemStore.
pwszStoreName : [wstr] A pointer to a Unicode string that names the physical store to be added to the system store collection. To remove a physical store from the system store collection, call the CertUnregisterPhysicalStore function.
pStoreInfo : [var] A pointer to a CERT_PHYSICAL_STORE_INFO structure that provides basic information about the physical store.
pvReserved : [intptr] Reserved for future use and must be set to NULL.
%inst
Adds a physical store to a registry system store collection.

[戻り値]
If the function succeeds, the function returns nonzero. If the
function fails, it returns zero.


%index
CertRegisterSystemStore
Registers a system store.
%group
Win32 crypt32
%prm
pvSystemStore, dwFlags, pStoreInfo, pvReserved
pvSystemStore : [intptr] Identifies the system store to be registered. If CERT_SYSTEM_STORE_RELOCATE_FLAG is set in the dwFlags parameter, pvSystemStore points to a CERT_SYSTEM_STORE_RELOCATE_PARA structure. Otherwise, it points to a null-terminated Unicode string that names the system store.
dwFlags : [int] The high word of the dwFlags parameter is used to specify the location of the system store.
pStoreInfo : [var] Reserved for future use and must be set to NULL.
pvReserved : [intptr] Reserved for future use and must be set to NULL.
%inst
Registers a system store.

[戻り値]
If the function succeeds, the function returns nonzero. If the
function fails, it returns zero.

[備考]
To unregister a system store that has been registered by this
function, call CertUnregisterSystemStore.


%index
CertRemoveEnhancedKeyUsageIdentifier
The CertRemoveEnhancedKeyUsageIdentifier function removes a usage identifier object identifier (OID) from the enhanced key usage (EKU) extended property of the certificate.
%group
Win32 crypt32
%prm
pCertContext, pszUsageIdentifier
pCertContext : [var] A pointer to a CERT_CONTEXT of the certificate for which the usage identifier OID is to be removed.
pszUsageIdentifier : [str] A pointer to the usage identifier OID to remove.
%inst
The CertRemoveEnhancedKeyUsageIdentifier function removes a usage
identifier object identifier (OID) from the enhanced key usage (EKU)
extended property of the certificate.

[戻り値]
If the function succeeds, the function returns nonzero (TRUE). If the
function fails, it returns zero (FALSE). For extended error
information, call GetLastError.


%index
CertRemoveStoreFromCollection
Removes a sibling certificate store from a collection store.
%group
Win32 crypt32
%prm
hCollectionStore, hSiblingStore
hCollectionStore : [int] A handle of the collection certificate store.
hSiblingStore : [int] Handle of the sibling certificate store to be removed from the collection store.
%inst
Removes a sibling certificate store from a collection store.


%index
CertResyncCertificateChainEngine
Resyncs the certificate chain engine, which resynchronizes the stores the store's engine and updates the engine caches.
%group
Win32 crypt32
%prm
hChainEngine
hChainEngine : [intptr] The chain engine to resynchronize.
%inst
Resyncs the certificate chain engine, which resynchronizes the stores
the store's engine and updates the engine caches.

[戻り値]
If the function succeeds, the function returns nonzero. If the
function fails, it returns zero. For extended error information, call
GetLastError.


%index
CertRetrieveLogoOrBiometricInfo
Performs a URL retrieval of logo or biometric information specified in either the szOID_LOGOTYPE_EXT or szOID_BIOMETRIC_EXT certificate extension.
%group
Win32 crypt32
%prm
pCertContext, lpszLogoOrBiometricType, dwRetrievalFlags, dwTimeout, dwFlags, pvReserved, ppbData, pcbData, ppwszMimeType
pCertContext : [var] The address of a CERT_CONTEXT structure that contains the certificate.
lpszLogoOrBiometricType : [str] The address of a null-terminated ANSI string that contains an object identifier (OID) string that identifies the type of information to retrieve.
dwRetrievalFlags : [int] A set of flags that specify how the information should be retrieved. This parameter is passed as the dwRetrievalFlags in the CryptRetrieveObjectByUrl function.
dwTimeout : [int] The maximum amount of time, in milliseconds, to wait for the retrieval.
dwFlags : [int] This parameter is not used and must be zero.
pvReserved : [intptr] This parameter is not used and must be NULL.
ppbData : [var] The address of a BYTE pointer that receives the logotype or biometric data. This memory must be freed when it is no longer needed by passing this pointer to the CryptMemFree function.
pcbData : [var] The address of a DWORD variable that receives the number of bytes in the ppbData buffer.
ppwszMimeType : [var] The address of a pointer to a null-terminated Unicode string that receives the Multipurpose Internet Mail Extensions (MIME) type of the data. This parameter can be NULL if this information is not needed. This memory must be freed when it is no longer needed by passing this pointer to the CryptMemFree function. This address always receives NULL for biometric types. You must always ensure that this parameter contains a valid memory address before attempting to access the memory.
%inst
Performs a URL retrieval of logo or biometric information specified
in either the szOID_LOGOTYPE_EXT or szOID_BIOMETRIC_EXT certificate
extension.

[戻り値]
Returns nonzero if successful or zero otherwise. For extended error
information, call GetLastError. Possible error codes returned by the
GetLastError function include, but are not limited to, the following.
This doc was truncated.


%index
CertSaveStore
Saves the certificate store to a file or to a memory BLOB.
%group
Win32 crypt32
%prm
hCertStore, dwEncodingType, dwSaveAs, dwSaveTo, pvSaveToPara, dwFlags
hCertStore : [int] The handle of the certificate store to be saved.
dwEncodingType : [int] Specifies the certificate encoding type and message encoding type. Encoding is used only when dwSaveAs contains CERT_STORE_SAVE_AS_PKCS7. Otherwise, the dwMsgAndCertEncodingType parameter is not used.
dwSaveAs : [int] Specifies how to save the certificate store.
dwSaveTo : [int] Specifies where and how to save the certificate store. The contents of this parameter determines the format of the pvSaveToPara parameter.
pvSaveToPara : [intptr] A pointer that represents where the store should be saved to. The contents of this parameter depends on the value of the dwSaveTo parameter.
dwFlags : [int] This parameter is reserved for future use and must be set to zero.
%inst
Saves the certificate store to a file or to a memory BLOB.

[戻り値]
If the function succeeds, the function returns nonzero. If the
function fails, it returns zero. For extended error information, call
GetLastError. Note that CreateFile or WriteFile errors can be
propagated to this function. One possible error code is
CRYPT_E_FILE_ERROR which indicates that an error occurred while
writing to the file.


%index
CertSelectCertificateChains
Retrieves certificate chains based on specified selection criteria.
%group
Win32 crypt32
%prm
pSelectionContext, dwFlags, pChainParameters, cCriteria, rgpCriteria, hStore, pcSelection, pprgpSelection
pSelectionContext : [var] A pointer to the GUID of the certificate selection scenario to use for this call.
dwFlags : [int] Flags for controlling the certificate selection process. This parameter can be a combination of zero or more of the following flags:
pChainParameters : [var] A pointer to a CERT_SELECT_CHAIN_PARA structure to specify parameters for chain building. If NULL, default parameters will be used. The pChainPara member of the CERT_SELECT_CHAIN_PARA structure points to a CERT_CHAIN_PARA structure that can be used to enable strong signing.
cCriteria : [int] The number of elements in the array pointed to by the rgpCriteria array.
rgpCriteria : [var] A pointer to an array of CERT_SELECT_CRITERIA structures that define the selection criteria. If this parameter is set to NULL, the value of the cCriteria parameter must be zero.
hStore : [int] The handle to a store from which to select the certificates.
pcSelection : [var] A pointer to a DWORD value to receive the number of elements in the array pointed to by the pprgpSelection parameter.
pprgpSelection : [var] A pointer to a pointer to a location to receive an array of CERT_CHAIN_CONTEXT structure. The CertSelectCertificateChains function only returns certificate chains that match all the selection criteria. The entries in the array are ordered by quality, i.e. the chain with the highest quality is the first entry. Storage for the array is allocated by the CertSelectCertificateChains function. To free the allocated memory you must first release each individual chain context in the array by calling the CertFreeCertificateChain function. Then you must  free the memory by calling the CertFreeCertificateChainList function.
%inst
Retrieves certificate chains based on specified selection criteria.

[戻り値]
If the function succeeds, the function returns TRUE. If the function
fails, it returns zero (FALSE). For extended error information, call
the GetLastError function.
Note If the selection does not yield any results, the
CertSelectCertificateChains function returns TRUE, but the value
pointed to by pcSelection parameter is set to zero.

[備考]
Selection criteria can be specified through either the dwFlags
parameter, through the rgpCriteria parameter, or through both
parameters. If no selection criteria are specified, the function
succeeds and returns certificate chains for all certificates in the
store specified by the hStore parameter.
Certificate chains that are selected are ordered based on the
following preference logic:
This doc was truncated.


%index
CertSerializeCRLStoreElement
The CertSerializeCRLStoreElement function serializes an encoded certificate revocation list (CRL) context and the encoded representation of its properties.
%group
Win32 crypt32
%prm
pCrlContext, dwFlags, pbElement, pcbElement
pCrlContext : [var] A pointer to the CRL_CONTEXT structure being serialized.
dwFlags : [int] Reserved for future use and must be zero.
pbElement : [var] A pointer to a buffer to receive the serialized output, including the encoded CRL, and possibly its properties.
pcbElement : [var] A pointer to a DWORD value specifying the size, in bytes, of the buffer pointed to by the pbElement parameter. When the function returns, the DWORD value contains the number of bytes stored in the buffer.
%inst
The CertSerializeCRLStoreElement function serializes an encoded
certificate revocation list (CRL) context and the encoded
representation of its properties.

[戻り値]
If the function succeeds, the return value is TRUE. If the function
fails, the return value is FALSE. For extended error information,
call GetLastError.


%index
CertSerializeCTLStoreElement
The CertSerializeCTLStoreElement function serializes an encoded certificate trust list (CTL) context and the encoded representation of its properties. The result can be persisted to storage so that the CTL and properties can be retrieved later.
%group
Win32 crypt32
%prm
pCtlContext, dwFlags, pbElement, pcbElement
pCtlContext : [var] A pointer to the CTL_CONTEXT structure being serialized.
dwFlags : [int] Reserved for future use and must be zero.
pbElement : [var] A pointer to a buffer that receives the serialized output, including the encoded CTL and, possibly, its properties.
pcbElement : [var] A pointer to a DWORD value that specifies the size, in bytes, of the buffer that is pointed to by the pbElement parameter. When the function returns the DWORD value contains the number of bytes stored in the buffer.
%inst
The CertSerializeCTLStoreElement function serializes an encoded
certificate trust list (CTL) context and the encoded representation
of its properties. The result can be persisted to storage so that the
CTL and properties can be retrieved later.

[戻り値]
If the function succeeds, the return value is TRUE. If the function
fails, the return value is FALSE. For extended error information,
call GetLastError.


%index
CertSerializeCertificateStoreElement
The CertSerializeCertificateStoreElement function serializes a certificate context's encoded certificate and its encoded properties. The result can be persisted to storage so that the certificate and properties can be retrieved at a later time.
%group
Win32 crypt32
%prm
pCertContext, dwFlags, pbElement, pcbElement
pCertContext : [var] A pointer to the CERT_CONTEXT to be serialized.
dwFlags : [int] Reserved for future use and must be zero.
pbElement : [var] A pointer to a buffer that receives the serialized output, including the encoded certificate and possibly its properties.
pcbElement : [var] A pointer to a DWORD value specifying the size, in bytes, of the buffer pointed to by the pbElement parameter. When the function returns, DWORD value contains the number of bytes stored in the buffer.
%inst
The CertSerializeCertificateStoreElement function serializes a
certificate context's encoded certificate and its encoded properties.
The result can be persisted to storage so that the certificate and
properties can be retrieved at a later time.

[戻り値]
If the function succeeds, the return value is TRUE. If the function
fails, the return value is FALSE. For extended error information,
call GetLastError.


%index
CertSetCRLContextProperty
Sets an extended property for the specified certificate revocation list (CRL) context.
%group
Win32 crypt32
%prm
pCrlContext, dwPropId, dwFlags, pvData
pCrlContext : [var] A pointer to the CRL_CONTEXT structure.
dwPropId : [int] Identifies the property to be set. The value of dwPropId determines the type and content of the pvData parameter. Currently defined identifiers and the data type to be returned in pvData are listed in the following table.
dwFlags : [int] CERT_STORE_NO_CRYPT_RELEASE_FLAG can be set for the CERT_KEY_PROV_HANDLE_PROP_ID or CERT_KEY_CONTEXT_PROP_ID dwPropId properties.
pvData : [intptr] A pointer to a data type that is determined by the value passed in dwPropId.
%inst
Sets an extended property for the specified certificate revocation
list (CRL) context.

[戻り値]
If the function succeeds, the return value is TRUE. If the function
fails, the return value is FALSE. For extended error information,
call GetLastError. One possible error code is the following.
This doc was truncated.

[備考]
If a property already exists, its old value is replaced.


%index
CertSetCTLContextProperty
Sets an extended property for the specified certificate trust list (CTL) context.
%group
Win32 crypt32
%prm
pCtlContext, dwPropId, dwFlags, pvData
pCtlContext : [var] A pointer to the CTL_CONTEXT structure.
dwPropId : [int] Identifies the property to be set. The value of dwPropId determines the type and content of the pvData parameter. Currently defined identifiers and their related pvData types are as follows.
dwFlags : [int] CERT_STORE_NO_CRYPT_RELEASE_FLAG can be set for the CERT_KEY_PROV_HANDLE_PROP_ID or CERT_KEY_CONTEXT_PROP_ID dwPropId properties.
pvData : [intptr] A pointer to a data type that is determined by the value passed in dwPropId.
%inst
Sets an extended property for the specified certificate trust list
(CTL) context.

[戻り値]
If the function succeeds, the return value is TRUE. If the function
fails, the return value is FALSE. For extended error information,
call GetLastError. One possible error code is the following.
This doc was truncated.

[備考]
If a property already exists, its old value is replaced.


%index
CertSetCertificateContextPropertiesFromCTLEntry
Sets the properties on the certificate context by using the attributes in the specified certificate trust list (CTL) entry.
%group
Win32 crypt32
%prm
pCertContext, pCtlEntry, dwFlags
pCertContext : [var] A pointer to the CERT_CONTEXT whose attributes are to be set.
pCtlEntry : [var] A pointer to the CTL_ENTRY structure used to set the attributes on the certificate.
dwFlags : [int] A DWORD. This parameter can be set to CERT_SET_PROPERTY_IGNORE_PERSIST_ERROR_FLAG to ignore any persisted error flags.
%inst
Sets the properties on the certificate context by using the
attributes in the specified certificate trust list (CTL) entry.

[戻り値]
If the function succeeds, the function returns nonzero. If the
function fails, it returns zero. For extended error information, call
GetLastError.


%index
CertSetCertificateContextProperty
Sets an extended property for a specified certificate context.
%group
Win32 crypt32
%prm
pCertContext, dwPropId, dwFlags, pvData
pCertContext : [var] A pointer to a CERT_CONTEXT structure.
dwPropId : [int] The property to be set. The value of dwPropId determines the type and content of the pvData parameter. Currently defined identifiers and their related pvData types are as follows. Note??CRYPT_HASH_BLOB and CRYPT_DATA_BLOB are described in the CRYPT_INTEGER_BLOB topic.
dwFlags : [int] CERT_STORE_NO_CRYPT_RELEASE_FLAG can be set for the CERT_KEY_PROV_HANDLE_PROP_ID or CERT_KEY_CONTEXT_PROP_ID dwPropId properties. If the CERT_SET_PROPERTY_IGNORE_PERSIST_ERROR_FLAG value is set, any provider-write errors are ignored and the cached context's properties are always set. If CERT_SET_PROPERTY_INHIBIT_PERSIST_FLAG is set, any context property set is not persisted.
pvData : [intptr] A pointer to a data type determined by the value of dwPropId. Note??For any dwPropId, setting pvData to NULL deletes the property.
%inst
Sets an extended property for a specified certificate context.

[戻り値]
If the function succeeds, the function returns TRUE. If the function
fails, the function returns FALSE. For extended error information,
call GetLastError. One possible error code is the following.
This doc was truncated.

[備考]
If a property already exists, its old value is replaced. Your code
can use a macro to evaluate the class of hash for a certificate
context. The Wincrypt.h header defines the following macros for this
purpose. These macros are used internally by the
CertSetCertificateContextProperty function. IS_CERT_HASH_PROP_ID(X)
IS_PUBKEY_HASH_PROP_ID(X) IS_CHAIN_HASH_PROP_ID(X) Each macro takes
the dwPropId (X) value as input and evaluates to a Boolean value. The
following table shows the dwPropId values that evaluate to TRUE for
each macro.
This doc was truncated.


%index
CertSetEnhancedKeyUsage
The CertSetEnhancedKeyUsage function sets the enhanced key usage (EKU) property for the certificate.
%group
Win32 crypt32
%prm
pCertContext, pUsage
pCertContext : [var] A pointer to the CERT_CONTEXT of the specified certificate.
pUsage : [var] Pointer to a CERT_ENHKEY_USAGE structure (equivalent to a CTL_USAGE structure) that contains an array of EKU object identifiers (OIDs) to be set as extended properties of the certificate.
%inst
The CertSetEnhancedKeyUsage function sets the enhanced key usage
(EKU) property for the certificate.

[戻り値]
If the function succeeds, the function returns nonzero (TRUE). If the
function fails, it returns zero (FALSE). For extended error
information, call GetLastError.


%index
CertSetStoreProperty
The CertSetStoreProperty function sets a store property.
%group
Win32 crypt32
%prm
hCertStore, dwPropId, dwFlags, pvData
hCertStore : [int] Handle for the certificate store.
dwPropId : [int] Indicates one of a range of store properties. Values for user-defined properties must be outside the current range of predefined context property values. Currently, user-defined dwPropId values begin at 4,096. There is one predefined store property, CERT_STORE_LOCALIZED_NAME_PROP_ID, the localized name of the store.
dwFlags : [int] Reserved for future use and must be zero.
pvData : [intptr] The type definition for pvData depends on the dwPropId value. If dwPropId is CERT_STORE_LOCALIZED_NAME_PROP_ID, pvData points to a CRYPT_DATA_BLOB structure. The pbData member of that structure is a pointer to a null-terminated Unicode character string. The cbData member of that structure is a DWORD value holding the length of the string.
%inst
The CertSetStoreProperty function sets a store property.

[戻り値]
If the function succeeds, the return value is TRUE. If the function
fails, the return value is FALSE.

[備考]
Store property identifiers are properties applicable to an entire
store. They are not properties for an individual certificate, CRL, or
CTL context. Currently, no store properties are persisted.


%index
CertStrToNameW
Converts a null-terminated X.500 string to an encoded certificate name. (Unicode)
%group
Win32 crypt32
%prm
dwCertEncodingType, pszX500, dwStrType, pvReserved, pbEncoded, pcbEncoded, ppszError
dwCertEncodingType : [int] The certificate encoding type   that was used to encode the string. The message encoding type identifier, contained in the high WORD of this value, is ignored by this function.
pszX500 : [wstr] A pointer to the null-terminated X.500 string to be converted. The format of this string is specified by the dwStrType parameter. This string is expected to be formatted the same as the output from the CertNameToStr function.
dwStrType : [int] This parameter specifies the type of the string. This parameter also specifies other options for the contents of the string. If no flags are combined with the string type specifier, the string can contain a comma (,) or a semicolon (;) as separators in the relative distinguished name (RDN) and a plus sign (+) as the separator in multiple RDN values. Quotation marks ("") are supported. A quotation can be included in a quoted value by using two sets of quotation marks, for example, CN="User ""one""". A value that starts with a number sign (#) is treated as ASCII hexadecimal and converted to a CERT_RDN_OCTET_STRING. Embedded white space is ignored. For example, 1.2.3 = # AB CD 01 is the same as 1.2.3=#ABCD01. White space that surrounds the keys, object identifiers, and values is ignored.
pvReserved : [intptr] Reserved for future use and must be NULL.
pbEncoded : [var] A pointer to a buffer that receives the encoded structure.
pcbEncoded : [var] A pointer to a DWORD that, before calling the function, contains the size, in bytes, of the buffer pointed to by the pbEncoded parameter. When the function returns, the DWORD contains the number of bytes stored in the buffer. If pbEncoded is NULL, the DWORD receives the size, in bytes, required for the buffer.
ppszError : [var] A pointer to a string pointer that receives additional error information about an input string that is not valid.
%inst
Converts a null-terminated X.500 string to an encoded certificate
name. (Unicode)

[戻り値]
Returns nonzero if successful or zero otherwise.
For extended error information, call GetLastError.

[備考]
The following table contains the supported X.500 keys, their
corresponding object identifier string, string identifier (from
Wincrypt.h), and value types.
This doc was truncated.


%index
CertUnregisterPhysicalStore
The CertUnregisterPhysicalStore function removes a physical store from a specified system store collection. CertUnregisterPhysicalStore can also be used to delete the physical store.
%group
Win32 crypt32
%prm
pvSystemStore, dwFlags, pwszStoreName
pvSystemStore : [intptr] A pointer to an identifier of the system store collection from which the physical store is to be removed. It is either to a null-terminated Unicode string or to a CERT_SYSTEM_STORE_RELOCATE_PARA structure. For information about using the structure and on appending a ServiceName or ComputerName to the end of the system store name string, see CertRegisterSystemStore.
dwFlags : [int] The high word of the dwFlags parameter specifies the location of the system store. For information about defined high-word flags and on appending ServiceName, UserNames, and ComputerNames to the end of the system store name, see CertRegisterSystemStore.
pwszStoreName : [wstr] Null-terminated Unicode string that contains the name of the physical store.
%inst
The CertUnregisterPhysicalStore function removes a physical store
from a specified system store collection. CertUnregisterPhysicalStore
can also be used to delete the physical store.

[戻り値]
If the function succeeds, the return value is TRUE. If the function
fails, the return value is FALSE.


%index
CertUnregisterSystemStore
The CertUnregisterSystemStore function unregisters a specified system store.
%group
Win32 crypt32
%prm
pvSystemStore, dwFlags
pvSystemStore : [intptr] Identifies the system store to be unregistered. It points either to a null-terminated Unicode string or to a CERT_SYSTEM_STORE_RELOCATE_PARA structure. For information about using the structure and on appending a ServiceName or ComputerName to the end of the system store name string, see CertRegisterSystemStore.
dwFlags : [int] The high word of the dwFlags parameter specifies the location of the system store. For information about defined high-word flags and on appending ServiceName, UserNames, and ComputerNames to the end of the system store name, see CertRegisterSystemStore.
%inst
The CertUnregisterSystemStore function unregisters a specified system
store.

[戻り値]
If the function succeeds, the return value is TRUE. If the function
fails, the return value is FALSE.


%index
CertVerifyCRLRevocation
Check a certificate revocation list (CRL) to determine whether a subject's certificate has or has not been revoked.
%group
Win32 crypt32
%prm
dwCertEncodingType, pCertId, cCrlInfo, rgpCrlInfo
dwCertEncodingType : [int] Specifies the encoding type used. It is always acceptable to specify both the certificate and message encoding types by combining them with a bitwise-OR operation as shown in the following example: X509_ASN_ENCODING | PKCS_7_ASN_ENCODING Currently defined encoding types are:
pCertId : [var] A pointer to the CERT_INFO structure of the certificate to be checked against the CRL.
cCrlInfo : [int] Number of CRL_INFO pointers in the rgpCrlInfo array.
rgpCrlInfo : [var] Array of pointers to CRL_INFO structures.
%inst
Check a certificate revocation list (CRL) to determine whether a
subject's certificate has or has not been revoked.

[戻り値]
Returns TRUE if the certificate is not on the CRL and therefore is
valid.
It returns FALSE if the certificate is on the list and therefore has
been revoked and is not valid.


%index
CertVerifyCRLTimeValidity
The CertVerifyCRLTimeValidity function verifies the time validity of a CRL.
%group
Win32 crypt32
%prm
pTimeToVerify, pCrlInfo
pTimeToVerify : [var] A pointer to FILETIME structure containing the time to be used in the verification. If set to NULL, the current time is used.
pCrlInfo : [var] A pointer to a CRL_INFO structure containing the CRL for which the time is to be verified.
%inst
The CertVerifyCRLTimeValidity function verifies the time validity of
a CRL.

[戻り値]
Returns a minus one (?1) if the comparison time is before the
ThisUpdate member of the CRL_INFO pointed to by pCrlInfo. Returns a
plus one (+1) if the comparison time is after the NextUpdate time.
Returns zero for valid time for the CRL.


%index
CertVerifyCTLUsage
Verifies that a subject is trusted for a specified usage by finding a signed and time-valid certificate trust list (CTL) with the usage identifiers that contain the subject.
%group
Win32 crypt32
%prm
dwEncodingType, dwSubjectType, pvSubject, pSubjectUsage, dwFlags, pVerifyUsagePara, pVerifyUsageStatus
dwEncodingType : [int] Specifies the encoding type used. Currently, only X509_ASN_ENCODING and PKCS_7_ASN_ENCODING are being used; however, additional encoding types can be added in the future. For either current encoding type, use
dwSubjectType : [int] If the dwSubjectType parameter is set to CTL_CERT_SUBJECT_TYPE, pvSubject points to a CERT_CONTEXT structure. The structure's SubjectAlgorithm member is examined to determine the representation of the subject's identity. Initially, only SHA1 and MD5 hashes are supported as values for SubjectAlgorithm. The appropriate hash property is obtained from the CERT_CONTEXT structure. If the dwSubjectType parameter is set to CTL_ANY_SUBJECT_TYPE, pvSubject points to the CTL_ANY_SUBJECT_INFO structure. The SubjectAlgorithm member of this structure must match the algorithm type of the CTL, and the SubjectIdentifier member must match one of the CTL entries. If dwSubjectType is set to either preceding value, dwEncodingType is not used.
pvSubject : [intptr] Value used in conjunction with the dwSubjectType parameter.
pSubjectUsage : [var] A pointer to a CTL_USAGE structure used to specify the intended usage of the subject.
dwFlags : [int] If the CERT_VERIFY_INHIBIT_CTL_UPDATE_FLAG is not set, a CTL whose time is no longer valid in one of the stores specified by rghCtlStore in CTL_VERIFY_USAGE_PARA can be replaced. When replaced, the CERT_VERIFY_UPDATED_CTL_FLAG is set in the  dwFlags member of pVerifyUsageStatus. If this flag is set, an update will not be made, even if a time-valid, updated CTL is received for a CTL that is in the store and whose time is no longer valid. If the CERT_VERIFY_TRUSTED_SIGNERS_FLAG is set, only the signer stores specified by rghSignerStore in CTL_VERIFY_USAGE_PARA are searched to find the signer. Otherwise, the signer stores provide additional sources to find the signer's certificate. For more information, see Remarks. If CERT_VERIFY_NO_TIME_CHECK_FLAG is set, the CTLs are not checked for time validity. Otherwise, they are. If CERT_VERIFY_ALLOW_MORE_USAGE_FLAG is set, the CTL can contain usage identifiers in addition to those specified by pSubjectUsage. Otherwise, the found CTL will contain no additional usage identifiers.
pVerifyUsagePara : [var] A pointer to a CTL_VERIFY_USAGE_PARA structure that specifies the stores to be searched to find the CTL and the stores that contain acceptable CTL signers. Setting the ListIdentifier member further limits the search.
pVerifyUsageStatus : [var] A pointer to a CTL_VERIFY_USAGE_STATUS structure. The cbSize member of the structure must to be set to the size, in bytes, of the structure, and all other fields must be set to zero before CertVerifyCTLUsage is called. For more information, see CTL_VERIFY_USAGE_STATUS.
%inst
Verifies that a subject is trusted for a specified usage by finding a
signed and time-valid certificate trust list (CTL) with the usage
identifiers that contain the subject.

[戻り値]
If the subject is trusted for the specified usage, TRUE is returned.
Otherwise, FALSE is returned. GetLastError can return one of the
following error codes.
This doc was truncated.

[備考]
CertVerifyCTLUsage is a dispatcher to functions that can be installed
by using an object identifier (OID). First, it tries to find an OID
function that matches the first usage object identifier in the
CLT_USAGE structure pointed to by pSubjectUsage. If this fails, it
uses the default CertDllVerifyCTLUsage functions. The
CertDllVerifyCTLUsage function in Cryptnet.dll can be installed by
using an OID; it has the following properties:
This doc was truncated.


%index
CertVerifyCertificateChainPolicy
Checks a certificate chain to verify its validity, including its compliance with any specified validity policy criteria.
%group
Win32 crypt32
%prm
pszPolicyOID, pChainContext, pPolicyPara, pPolicyStatus
pszPolicyOID : [str] Current predefined verify chain policy structures are listed in the following table.
pChainContext : [var] A pointer to a CERT_CHAIN_CONTEXT structure that contains a chain to be verified.
pPolicyPara : [var] A pointer to a CERT_CHAIN_POLICY_PARA structure that provides the policy verification criteria for the chain. The dwFlags member of that structure can be set to change the default policy checking behavior.
pPolicyStatus : [var] A pointer to a CERT_CHAIN_POLICY_STATUS structure where status information on the chain is returned. OID-specific extra status can be returned in the pvExtraPolicyStatus member of this structure.
%inst
Checks a certificate chain to verify its validity, including its
compliance with any specified validity policy criteria.

[戻り値]
The return value indicates whether the function was able to check for
the policy, it does not indicate whether the policy check failed or
passed. If the chain can be verified for the specified policy, TRUE
is returned and the dwError member of the pPolicyStatus is updated. A
dwError of 0 (ERROR_SUCCESS or S_OK) indicates the chain satisfies
the specified policy. If the chain cannot be validated, the return
value is TRUE and you need to verify the pPolicyStatus parameter for
the actual error. A value of FALSE indicates that the function wasn't
able to check for the policy.

[備考]
A dwError member of the CERT_CHAIN_POLICY_STATUS structure pointed to
by pPolicyStatus can apply to a single chain element, to a simple
chain, or to an entire chain context. If dwError applies to the
entire chain context, both the lChainIndex and the lElementIndex
members of the CERT_CHAIN_POLICY_STATUS structure are set to ?1. If
dwError applies to a complete simple chain, lElementIndex is set to
?1 and lChainIndex is set to the index of the first chain that has an
error. If dwError applies to a single certificate element,
lChainIndex and lElementIndex index the first certificate that has
the error. To get the certificate element use this syntax:
pChainContext->rgpChain[lChainIndex]->rgpElement[lElementIndex]; Use
the CertGetCertificateChain function to enable and perform
certificate revocation checking. The CertVerifyCertificateChainPolicy
function does not check if certificates in the certificate chain are
revoked.


%index
CertVerifyRevocation
Checks the revocation status of the certificates contained in the rgpvContext array. If a certificate in the list is found to be revoked, no further checking is done.
%group
Win32 crypt32
%prm
dwEncodingType, dwRevType, cContext, rgpvContext, dwFlags, pRevPara, pRevStatus
dwEncodingType : [int] Specifies the encoding type used. Currently, only X509_ASN_ENCODING and PKCS_7_ASN_ENCODING are being used; however, additional encoding types may be added in the future. For either current encoding type, use X509_ASN_ENCODING | PKCS_7_ASN_ENCODING.
dwRevType : [int] Indicates the type of the context structure passed in rgpvContext. Currently only CERT_CONTEXT_REVOCATION_TYPE, the revocation of certificates, is defined.
cContext : [int] Count of elements in the rgpvContext array.
rgpvContext : [var] When the dwRevType is CERT_CONTEXT_REVOCATION_TYPE, rgpvContext is an array of pointers to CERT_CONTEXT structures. These contexts must contain sufficient information to allow the installable or registered revocation DLLs to find the revocation server. This information would normally be conveyed in an extension such as the CRLDistributionsPoints extension defined by the Internet Engineering Task Force (IETF) in PKIX Part 1.
dwFlags : [int] Indicates any special processing needs. This parameter can be one of the following flags.
pRevPara : [var] Optionally set to assist in finding the issuer. For details, see the CERT_REVOCATION_PARA structure.
pRevStatus : [var] Only the cbSize member of the CERT_REVOCATION_STATUS pointed to by pRevStatus needs to be set before CertVerifyRevocation is called. If the function returns FALSE, this structure's members will contain error status information. For more information, see CERT_REVOCATION_STATUS. For a description of how pRevStatus is updated when a revocation verification problem is encountered, see Remarks.
%inst
Checks the revocation status of the certificates contained in the
rgpvContext array. If a certificate in the list is found to be
revoked, no further checking is done.

[戻り値]
If the function successfully checks all of the contexts and none were
revoked, the function returns TRUE. If the function fails, it returns
FALSE and updates the CERT_REVOCATION_STATUS structure pointed to by
pRevStatus as described in CERT_REVOCATION_STATUS. When the
revocation handler for any of the contexts returns FALSE due to an
error, the dwError member in the structure pointed to by pRevStatus
will be set by the handler to specify which error was encountered.
GetLastError returns an error code equal to the error specified in
the dwError member of the CERT_REVOCATION_STATUS structure.
GetLastError can be one of the following values.
This doc was truncated.

[備考]
The following example shows how pRevStatus is updated when a
revocation verification problem is encountered: Consider the case
where cContext is four: If CertVerifyRevocation can verify that
rgpvContext[0] and rgpvContext[1] are not revoked, but cannot check
rgpvContext[2], the pRevStatus member dwIndex is set to two,
indicating that the context at index two has the problem, the dwError
member of pRevStatus is set to CRYPT_E_NO_REVOCATION_CHECK, and FALSE
is returned. If rgpvContext[2] is found to be revoked, the dwIndex
member of pRevStatus is set to two, and the dwError member of
pRevStatus is set to CRYPT_E_REVOKED, dwReason is updated, and FALSE
is returned. In either case, both rgpvContext[0] and rgpvContext[1]
are verified not to be revoked, rgpvContext[2] is the last array
index checked, and rgpvContext[3] has not been checked at all.


%index
CertVerifySubjectCertificateContext
The CertVerifySubjectCertificateContext function performs the enabled verification checks on a certificate by checking the validity of the certificate's issuer. The new Certificate Chain Verification Functions are recommended instead of this function.
%group
Win32 crypt32
%prm
pSubject, pIssuer, pdwFlags
pSubject : [var] A pointer to a CERT_CONTEXT structure containing the subject's certificate.
pIssuer : [var] A pointer to a CERT_CONTEXT containing the issuer's certificate. When checking just CERT_STORE_TIME_VALIDITY_FLAG, pIssuer can be NULL.
pdwFlags : [var] A pointer to a DWORD value contain verification check flags. The following flags can be set to enable verification checks on the subject certificate. They can be combined using a bitwise-OR operation to enable multiple verifications.
%inst
The CertVerifySubjectCertificateContext function performs the enabled
verification checks on a certificate by checking the validity of the
certificate's issuer. The new Certificate Chain Verification
Functions are recommended instead of this function.

[戻り値]
If the function succeeds, the return value is TRUE. If the function
fails, the return value is FALSE. For a verification check failure,
TRUE is still returned. FALSE is returned only when a bad parameter
is passed in. For extended error information, call GetLastError. One
possible error code is the following.
This doc was truncated.

[備考]
The hexadecimal value of the flags can be combined using bitwise-OR
operations to enable multiple verifications. For example, to enable
both signature and time validity, the value
This doc was truncated.


%index
CertVerifyTimeValidity
The CertVerifyTimeValidity function verifies the time validity of a certificate.
%group
Win32 crypt32
%prm
pTimeToVerify, pCertInfo
pTimeToVerify : [var] A pointer to a FILETIME structure containing the comparison time. If NULL, the current time is used.
pCertInfo : [var] A pointer to the CERT_INFO structure of the certificate for which the time is being verified.
%inst
The CertVerifyTimeValidity function verifies the time validity of a
certificate.

[戻り値]
Returns a minus one if the comparison time is before the NotBefore
member of the CERT_INFO structure. Returns a plus one if the
comparison time is after the NotAfter member. Returns zero for valid
time for the certificate.


%index
CertVerifyValidityNesting
The CertVerifyValidityNesting function verifies that a subject certificate's time validity nests correctly within its issuer's time validity.
%group
Win32 crypt32
%prm
pSubjectInfo, pIssuerInfo
pSubjectInfo : [var] A pointer to the CERT_INFO structure of the subject certificate.
pIssuerInfo : [var] A pointer to the CERT_INFO structure of the issuer certificate.
%inst
The CertVerifyValidityNesting function verifies that a subject
certificate's time validity nests correctly within its issuer's time
validity.

[戻り値]
Returns TRUE if the NotBefore time of the subject's certificate is
after the NotBefore time of the issuer's certificate and the NotAfter
time of the subject's certificate is not after the NotAfter time of
the issuer's certificate. Otherwise, returns FALSE.


%index
CryptAcquireCertificatePrivateKey
Obtains the private key for a certificate.
%group
Win32 crypt32
%prm
pCert, dwFlags, pvParameters, phCryptProvOrNCryptKey, pdwKeySpec, pfCallerFreeProvOrNCryptKey
pCert : [var] The address of a CERT_CONTEXT structure that contains the certificate context for which a private key will be obtained.
dwFlags : [int] 
pvParameters : [intptr] If the CRYPT_ACQUIRE_WINDOW_HANDLE_FLAG  is set, then this is the address of an HWND. If the CRYPT_ACQUIRE_WINDOW_HANDLE_FLAG is not set, then this parameter must be NULL.
phCryptProvOrNCryptKey : [var] The address of an HCRYPTPROV_OR_NCRYPT_KEY_HANDLE variable that receives the handle of either the CryptoAPI provider or the CNG key. If the pdwKeySpec variable receives the CERT_NCRYPT_KEY_SPEC flag, this is a CNG key handle of type NCRYPT_KEY_HANDLE; otherwise, this is a CryptoAPI provider handle of type HCRYPTPROV. For more information about when and how to release this handle, see the description of the pfCallerFreeProvOrNCryptKey parameter.
pdwKeySpec : [var] 
pfCallerFreeProvOrNCryptKey : [var] The address of a BOOL variable that receives a value that indicates whether the caller must free the handle returned in the phCryptProvOrNCryptKey variable. This receives FALSE if any of the following is true:
%inst
Obtains the private key for a certificate.

[戻り値]
If the function succeeds, the return value is nonzero (TRUE). If the
function fails, the return value is zero (FALSE). For extended error
information, call GetLastError. One possible error code is the
following.
This doc was truncated.

[備考]
When CRYPT_ACQUIRE_WINDOW_HANDLE_FLAG is set, the caller must ensure
the HWND is valid. If the HWND is no longer valid, for CSP the caller
should call CryptSetProvParam using flag PP_CLIENT_HWND with NULL for
the HWND and NULL for the HCRYPTPROV. For KSP, the caller should set
the NCRYPT_WINDOW_HANDLE_PROPERTY of the ncrypt key to be NULL. When
CRYPT_ACQUIRE_WINDOW_HANDLE_FLAG flag is set for KSP, the
NCRYPT_WINDOW_HANDLE_PROPERTY is set on the storage provider and the
key. If both calls fail, then the function fails. If only one fails,
the function succeeds. Note that setting HWND to NULL effectively
removes HWND from the HCRYPTPROV or ncrypt key.


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
CryptCloseAsyncHandle
The CryptCloseAsyncHandle function (wincrypt.h) closes an async handle.
%group
Win32 crypt32
%prm
hAsync
hAsync : [intptr] The async handle to close.
%inst
The CryptCloseAsyncHandle function (wincrypt.h) closes an async
handle.

[戻り値]
Returns S_OK on success.


%index
CryptCreateAsyncHandle
The CryptCreateAsyncHandle function (wincrypt.h) creates an async handle.
%group
Win32 crypt32
%prm
dwFlags, phAsync
dwFlags : [int] Handle creation flags.
phAsync : [intptr] Receives a pointer to the created async handle.
%inst
The CryptCreateAsyncHandle function (wincrypt.h) creates an async
handle.


%index
CryptCreateKeyIdentifierFromCSP
Important??This API is deprecated. (CryptCreateKeyIdentifierFromCSP)
%group
Win32 crypt32
%prm
dwCertEncodingType, pszPubKeyOID, pPubKeyStruc, cbPubKeyStruc, dwFlags, pvReserved, pbHash, pcbHash
dwCertEncodingType : [int] Specifies the encoding type used. It is always acceptable to specify both the certificate and message encoding types by combining them with a bitwise-OR operation as shown in the following example: X509_ASN_ENCODING | PKCS_7_ASN_ENCODING Currently defined encoding types are:
pszPubKeyOID : [str] A pointer to the public key object identifier (OID). A value that is not NULL overrides the default OID obtained from the aiKeyAlg member of the structure pointed to by pPubKeyStruc. To use the default OID, set pszPubKeyOID to NULL.
pPubKeyStruc : [var] A pointer to a PUBLICKEYSTRUC structure. In the default case, the aiKeyAlg member of the structure pointed to by pPubKeyStruc is used to find the public key OID. When the value of pszPubKeyOID is not NULL, it overrides the default.
cbPubKeyStruc : [int] The size, in bytes, of the PUBLICKEYSTRUC.
dwFlags : [int] Reserved for future use and must be zero.
pvReserved : [intptr] Reserved for future use and must be NULL.
pbHash : [var] A pointer to a buffer to receive the hash of the public key and the key identifier. To get the size of this information for memory allocation purposes, set this parameter to NULL. For more information, see Retrieving Data of Unknown Length.
pcbHash : [var] A pointer to a DWORD that specifies the size, in bytes, of the buffer pointed to by the pbHash parameter. When the function returns, the DWORD contains the number of bytes stored in the buffer. Using SHA1 hashing, the length of the required buffer is twenty.
%inst
Important This API is deprecated. (CryptCreateKeyIdentifierFromCSP)

[戻り値]
If the function succeeds, the function returns nonzero (TRUE). If the
function fails, it returns zero (FALSE). For extended error
information, call GetLastError.


%index
CryptDecodeMessage
Decodes, decrypts, and verifies a cryptographic message.
%group
Win32 crypt32
%prm
dwMsgTypeFlags, pDecryptPara, pVerifyPara, dwSignerIndex, pbEncodedBlob, cbEncodedBlob, dwPrevInnerContentType, pdwMsgType, pdwInnerContentType, pbDecoded, pcbDecoded, ppXchgCert, ppSignerCert
dwMsgTypeFlags : [int] Indicates the message type. Message types can be combined with the bitwise-OR operator. This parameter can be one of the following message types:
pDecryptPara : [var] A pointer to a CRYPT_DECRYPT_MESSAGE_PARA structure that contains  decryption parameters.
pVerifyPara : [var] A pointer to a CRYPT_VERIFY_MESSAGE_PARA structure that contains   verification parameters.
dwSignerIndex : [int] Indicates which signer, among the possible many signers of a message, is to be verified. This index can be changed in multiple calls to the function to verify additional signers.
pbEncodedBlob : [var] A pointer to the encoded BLOB that is to be decoded.
cbEncodedBlob : [int] The size, in bytes, of the encoded BLOB.
dwPrevInnerContentType : [int] Only applicable when processing nested cryptographic messages. When processing an outer cryptographic message, it must be set to zero. When decoding a nested cryptographic message, it is set to the value returned at pdwInnerContentType by a previous calling of CryptDecodeMessage for the outer message. It can be any of the CMSG types listed in pdwMsgType. For backward compatibility, set dwPrevInnerContentType to zero.
pdwMsgType : [var] A pointer to a DWORD that specifies the message type returned. This parameter can be one of the following message types:
pdwInnerContentType : [var] A pointer to a DWORD that specifies the type of an inner message. The message type codes used for pdwMsgType are used here, also.
pbDecoded : [var] A pointer to a buffer to receive the decoded message.
pcbDecoded : [var] A pointer to a variable that specifies the size, in bytes, of the buffer pointed to by the pbDecoded parameter. When the function returns, this variable contains the size of the decoded message.
ppXchgCert : [var] A pointer to a pointer to a CERT_CONTEXT structure with a certificate that corresponds to the private exchange key needed to decode the message. This parameter is only set for message types CMSG_ENVELOPED and CMSG_SIGNED_AND_ENVELOPED.
ppSignerCert : [var] A pointer to a pointer to a CERT_CONTEXT structure of the certificate context of the signer. This parameter is only set for message types CMSG_SIGNED and CMSG_SIGNED_AND_ENVELOPED.
%inst
Decodes, decrypts, and verifies a cryptographic message.

[戻り値]
If the function succeeds, the function returns nonzero (TRUE). If the
function fails, it returns zero (FALSE). For extended error
information, call GetLastError. The CryptDecryptMessage,
CryptVerifyMessageSignature, or CryptVerifyMessageHash functions can
be propagated to this function. The following error code is most
commonly returned by the GetLastError function.
This doc was truncated.

[備考]
The dwMsgTypeFlags parameter specifies the set of allowable messages.
For example, to decode either SIGNED or ENVELOPED messages, set
dwMsgTypeFlags to CMSG_SIGNED_FLAG | CMSG_ENVELOPED_FLAG. Either or
both of the pDecryptPara or pVerifyPara parameters must be specified.
For a successfully decoded or verified message, the certificate
context pointers pointed to by ppXchgCert and ppSignerCert are
updated. They must be freed by calling CertFreeCertificateContext. If
the function fails, they are set to NULL. The ppXchgCert or
ppSignerCert parameters can be set to NULL before the function is
called, which indicates that the caller is not interested in getting
the exchange certificate or the signer certificate context.


%index
CryptDecodeObject
The CryptDecodeObject function decodes a structure of the type indicated by the lpszStructType parameter. The use of CryptDecodeObjectEx is recommended as an API that performs the same function with significant performance improvements.
%group
Win32 crypt32
%prm
dwCertEncodingType, lpszStructType, pbEncoded, cbEncoded, dwFlags, pvStructInfo, pcbStructInfo
dwCertEncodingType : [int] Type of encoding used. It is always acceptable to specify both the certificate and message encoding types by combining them with a bitwise-OR operation as shown in the following example: X509_ASN_ENCODING | PKCS_7_ASN_ENCODING Currently defined encoding types are:
lpszStructType : [str] A pointer to an OID defining the structure type. If the high-order word of the lpszStructType parameter is zero, the low-order word specifies the integer identifier for the type of the specified structure. Otherwise, this parameter is a long pointer to a null-terminated string. For more information about object identifier strings, their predefined constants and corresponding structures, see Constants for CryptEncodeObject and CryptDecodeObject.
pbEncoded : [var] A pointer to the encoded structure to be decoded.
cbEncoded : [int] Number of bytes pointed to by pbEncoded.
dwFlags : [int] The following flags are defined. They can be combined with a bitwise-OR operation.
pvStructInfo : [intptr] A pointer to a buffer to receive the decoded structure. When the buffer that is specified is not large enough to receive the decoded structure, the function sets the ERROR_MORE_DATA code and stores the required buffer size, in bytes, in the variable pointed to by pcbStructInfo. This parameter can be NULL to retrieve the size of this information for memory allocation purposes. For more information, see Retrieving Data of Unknown Length.
pcbStructInfo : [var] A pointer to a DWORD value specifying the size, in bytes, of the buffer pointed to by the pvStructInfo parameter. When the function returns, this DWORD value contains the size of the decoded data copied to pvStructInfo. The size contained in the variable pointed to by pcbStructInfo can indicate a size larger than the decoded structure, as the decoded structure can include pointers to other structures. This size is the sum of the size needed by the decoded structure and other structures pointed to.
%inst
The CryptDecodeObject function decodes a structure of the type
indicated by the lpszStructType parameter. The use of
CryptDecodeObjectEx is recommended as an API that performs the same
function with significant performance improvements.

[戻り値]
If the function succeeds, the return value is nonzero (TRUE). If the
function fails, the return value is zero (FALSE). For extended error
information, call GetLastError. Some possible error codes are listed
in the following table.
This doc was truncated.

[備考]
When encoding a cryptographic object using the preferred
CryptEncodeObjectEx function, the terminating NULL character is
included. When decoding, using the preferred CryptDecodeObjectEx
function, the terminating NULL character is not retained.


%index
CryptDecodeObjectEx
Decodes a structure of the type indicated by the lpszStructType parameter.
%group
Win32 crypt32
%prm
dwCertEncodingType, lpszStructType, pbEncoded, cbEncoded, dwFlags, pDecodePara, pvStructInfo, pcbStructInfo
dwCertEncodingType : [int] The type of encoding used. It is always acceptable to specify both the certificate and message encoding types by combining them with a bitwise-OR operation as shown in the following example: X509_ASN_ENCODING | PKCS_7_ASN_ENCODING Currently defined encoding types are:
lpszStructType : [str] A pointer to an object identifier (OID) that defines the structure type. If the high-order word of the lpszStructType parameter is zero, the low-order word specifies the integer identifier for the type of the specified structure. Otherwise, this parameter is a long pointer to a null-terminated string. For more information about object identifier strings, their predefined constants, and corresponding structures, see Constants for CryptEncodeObject and CryptDecodeObject.
pbEncoded : [var] A pointer to the data to be decoded. The structure must be of the type specified by lpszStructType.
cbEncoded : [int] The number of bytes pointed to by pbEncoded. This is the number of bytes to be decoded.
dwFlags : [int] This parameter can be one or more of the following flags. The flags can be combined by using a bitwise-OR operation.
pDecodePara : [var] A pointer to a CRYPT_DECODE_PARA structure that contains decoding paragraph information. If pDecodePara is set to NULL, then LocalAlloc and LocalFree are used to allocate and free memory. If pDecodePara points to a CRYPT_DECODE_PARA structure, that structure passes in callback functions to allocate and free memory. These callback functions override the default memory allocation of LocalAlloc and LocalFree.
pvStructInfo : [intptr] If the dwFlags CRYPT_ENCODE_ALLOC_FLAG is set, pvStructInfo is not a pointer to a buffer but is the address of a pointer to the buffer. Because memory is allocated inside the function and the pointer is stored at *pvStructInfo, pvStructInfo must never be NULL. If CRYPT_ENCODE_ALLOC_FLAG is not set, pvStructInfo is a pointer to a buffer that receives the decoded structure. When the buffer that is specified is not large enough to receive the decoded structure, the function sets the ERROR_MORE_DATA code and stores the required buffer size, in bytes, in the variable pointed to by pcbStructInfo. This parameter can be NULL to retrieve the size of this information for memory allocation purposes. For more information, see Retrieving Data of Unknown Length.
pcbStructInfo : [var] A pointer to a DWORD variable that contains the size, in bytes, of the buffer pointed to by the pvStructInfo parameter. When the function returns, the DWORD value contains the number of bytes stored in the buffer. The size contained in the variable pointed to by pcbStructInfo can indicate a size larger than the decoded structure because the decoded structure can include pointers to auxiliary data. This size is the sum of the size needed by the decoded structure and the auxiliary data. When CRYPT_DECODE_ALLOC_FLAG is set, the initial value of *pcbStructInfo is not used by the function, and on return, *pcbStructInfo contains the number of bytes allocated for pvStructInfo. Note??When processing the data returned in the buffer, applications must use the actual size of the data returned. The actual size can be slightly smaller than the size of the buffer specified on input. (On input, buffer sizes are usually specified large enough to ensure that the largest possible output data fits in the buffer.) On output, the variable pointed to by this parameter is updated to reflect the actual size of the data copied to the buffer.
%inst
Decodes a structure of the type indicated by the lpszStructType
parameter.

[戻り値]
If the function succeeds, the function returns nonzero (TRUE). If the
function fails, it returns zero (FALSE). For extended error
information, call GetLastError. The following table shows some
possible error codes.
This doc was truncated.

[備考]
When encoding a cryptographic object using the preferred
CryptEncodeObjectEx function, the terminating NULL character is
included. When decoding, using the preferred CryptDecodeObjectEx
function, the terminating NULL character is not retained. Each
constant in the list below has an associated structure type that is
pointed to by the pvStructInfo parameter. The structure pointed to,
directly or indirectly, has a reference to a CERT_ALT_NAME_ENTRY
structure.
This doc was truncated.


%index
CryptDecryptAndVerifyMessageSignature
The CryptDecryptAndVerifyMessageSignature function decrypts a message and verifies its signature.
%group
Win32 crypt32
%prm
pDecryptPara, pVerifyPara, dwSignerIndex, pbEncryptedBlob, cbEncryptedBlob, pbDecrypted, pcbDecrypted, ppXchgCert, ppSignerCert
pDecryptPara : [var] A pointer to a CRYPT_DECRYPT_MESSAGE_PARA structure that contains decryption parameters.
pVerifyPara : [var] A pointer to a CRYPT_VERIFY_MESSAGE_PARA structure that contains  verification parameters.
dwSignerIndex : [int] Identifies a particular signer of the message. A message can be signed by more than one signer and this function can be called multiple times changing this parameter to check for several signers. It is set to zero for the first signer. If the function returns FALSE, and GetLastError returns CRYPT_E_NO_SIGNER, the previous call received the last signer of the message.
pbEncryptedBlob : [var] A pointer to the signed, encoded, and encrypted message to be decrypted and verified.
cbEncryptedBlob : [int] The size, in bytes, of the encrypted message.
pbDecrypted : [var] A pointer to a buffer to receive the decrypted message.
pcbDecrypted : [var] A pointer to a DWORD that specifies the size, in bytes, of the buffer pointed to by the pbDecrypted parameter. When the function returns, it contains the size of the decrypted message copied to pbDecrypted.
ppXchgCert : [var] A pointer to a CERT_CONTEXT structure of the certificate that corresponds to the private exchange key needed to decrypt the message.
ppSignerCert : [var] A pointer to a CERT_CONTEXT structure of the certificate of the signer.
%inst
The CryptDecryptAndVerifyMessageSignature function decrypts a message
and verifies its signature.

[戻り値]
If the function succeeds, the function returns nonzero (TRUE). If the
function fails, it returns zero (FALSE). For extended error
information, call GetLastError. Note Errors from the called functions
CryptDecryptMessage and CryptVerifyMessageSignature might be
propagated to this function. The GetLastError function returns the
following error code most often.
This doc was truncated.

[備考]
For a successfully decrypted and verified message, the certificate
context pointers pointed to by ppXchgCert and ppSignerCert are
updated. They must be freed by calling CertFreeCertificateContext. If
the function fails, they are set to NULL. To indicate that the caller
is not interested in the exchange certificate or the signer
certificate context, set the ppXchgCert and ppSignerCert parameters
to NULL.


%index
CryptDecryptMessage
The CryptDecryptMessage function decodes and decrypts a message.
%group
Win32 crypt32
%prm
pDecryptPara, pbEncryptedBlob, cbEncryptedBlob, pbDecrypted, pcbDecrypted, ppXchgCert
pDecryptPara : [var] A pointer to a CRYPT_DECRYPT_MESSAGE_PARA structure that contains decryption parameters.
pbEncryptedBlob : [var] A pointer to a buffer that contains the encoded and encrypted message to be decrypted.
cbEncryptedBlob : [int] The size, in bytes, of the encoded and encrypted message.
pbDecrypted : [var] A pointer to a buffer that receives the decrypted message.
pcbDecrypted : [var] A pointer to a DWORD that specifies the size, in bytes, of the buffer pointed to by the pbDecrypted parameter. When the function returns, this variable contains the size, in bytes, of the decrypted message copied to pbDecrypted.
ppXchgCert : [var] A pointer to a CERT_CONTEXT structure of a certificate that corresponds to the private exchange key needed to decrypt the message. To indicate that the function should not return the certificate context used to decrypt, set this parameter to NULL.
%inst
The CryptDecryptMessage function decodes and decrypts a message.

[戻り値]
If the function succeeds, the function returns nonzero (TRUE). If the
function fails, it returns zero (FALSE). For extended error
information, call GetLastError. Note Errors from calls to
CryptImportKey and CryptDecrypt might be propagated to this function.
The GetLastError function returns the following error codes most
often.
This doc was truncated.

[備考]
When NULL is passed for pbDecrypted, and pcbDecrypted is not NULL,
NULL is returned for the address passed in ppXchgCert; otherwise, a
pointer to a CERT_CONTEXT is returned. For a successfully decrypted
message, this pointer to a CERT_CONTEXT points to the certificate
context used to decrypt the message. It must be freed by calling
CertFreeCertificateContext. If the function fails, the value at
ppXchgCert is set to NULL.


%index
CryptEncodeObject
The CryptEncodeObject function encodes a structure of the type indicated by the value of the lpszStructType parameter. The use of CryptEncodeObjectEx is recommended as an API that performs the same function with significant performance improvements.
%group
Win32 crypt32
%prm
dwCertEncodingType, lpszStructType, pvStructInfo, pbEncoded, pcbEncoded
dwCertEncodingType : [int] Type of encoding used. It is always acceptable to specify both the certificate and message encoding types by combining them with a bitwise-OR operation as shown in the following example: X509_ASN_ENCODING | PKCS_7_ASN_ENCODING Currently defined encoding types are:
lpszStructType : [str] A pointer to an OID defining the structure type. If the high-order word of the lpszStructType parameter is zero, the low-order word specifies the integer identifier for the type of the specified structure. Otherwise, this parameter is a long pointer to a null-terminated string. For more information about object identifier strings, their predefined constants and corresponding structures, see Constants for CryptEncodeObject and CryptDecodeObject.
pvStructInfo : [intptr] A pointer to the structure to be encoded. The structure must be of a type specified by lpszStructType.
pbEncoded : [var] A pointer to a buffer to receive the encoded structure. When the buffer that is specified is not large enough to receive the decoded structure, the function sets the ERROR_MORE_DATA code and stores the required buffer size, in bytes, in the variable pointed to by pcbEncoded. This parameter can be NULL to retrieve the size of this information for memory allocation purposes. For more information, see Retrieving Data of Unknown Length.
pcbEncoded : [var] A pointer to a DWORD variable that contains the size, in bytes, of the buffer pointed to by the pbEncoded parameter. When the function returns, the DWORD value contains the number of allocated encoded bytes stored in the buffer. Note??When processing the data returned in the buffer, applications must use the actual size of the data returned. The actual size can be slightly smaller than the size of the buffer specified on input. (On input, buffer sizes are usually specified large enough to ensure that the largest possible output data fits in the buffer.) On output, the variable pointed to by this parameter is updated to reflect the actual size of the data copied to the buffer.
%inst
The CryptEncodeObject function encodes a structure of the type
indicated by the value of the lpszStructType parameter. The use of
CryptEncodeObjectEx is recommended as an API that performs the same
function with significant performance improvements.

[戻り値]
If the function succeeds, the return value is nonzero (TRUE). If the
function fails, the return value is zero (FALSE). For extended error
information, call GetLastError. Some possible error codes are listed
in the following table.
This doc was truncated.

[備考]
When encoding a cryptographic object using the preferred
CryptEncodeObjectEx function, the terminating NULL character is
included. When decoding, using the preferred CryptDecodeObjectEx
function, the terminating NULL character is not retained.


%index
CryptEncodeObjectEx
Encodes a structure of the type indicated by the value of the lpszStructType parameter.
%group
Win32 crypt32
%prm
dwCertEncodingType, lpszStructType, pvStructInfo, dwFlags, pEncodePara, pvEncoded, pcbEncoded
dwCertEncodingType : [int] 
lpszStructType : [str] A pointer to an object identifier (OID) that defines the structure type. If the high-order word of the lpszStructType parameter is zero, the low-order word specifies an integer identifier for the type of the specified structure. Otherwise, this parameter is a pointer to a null-terminated string that contains the string representation of the OID. For more information about object identifier strings, their predefined constants and corresponding structures, see Constants for CryptEncodeObject and CryptDecodeObject.
pvStructInfo : [intptr] A pointer to the structure to be encoded. The structure must be of the type specified by lpszStructType.
dwFlags : [int] 
pEncodePara : [var] A pointer to a CRYPT_ENCODE_PARA structure that contains encoding information. This parameter can be NULL. If either pEncodePara or the pfnAlloc member of pEncodePara is NULL, then LocalAlloc is used for the allocation and LocalFree must be called to free the memory. If both pEncodePara and the pfnAlloc member of pEncodePara are not NULL, then the function pointed to by the pfnAlloc member of the CRYPT_ENCODE_PARA structure pointed to by pEncodePara is called for the allocation. The function pointed to by the pfnFree member of pEncodePara must be called to free the memory.
pvEncoded : [intptr] A pointer to a buffer to receive the encoded structure. The size of this buffer is specified in the pcbEncoded parameter. When the buffer that is specified is not large enough to receive the decoded structure, the function sets the ERROR_MORE_DATA code and stores the required buffer size, in bytes, in the variable pointed to by pcbEncoded. This parameter can be NULL to retrieve the size of the buffer for memory allocation purposes. For more information, see Retrieving Data of Unknown Length. If dwFlags contains the CRYPT_ENCODE_ALLOC_FLAG flag, pvEncoded is not a pointer to a buffer but is the address of a pointer to the buffer. Because memory is allocated inside the function and the pointer is stored in pvEncoded, pvEncoded cannot be NULL.
pcbEncoded : [var] A pointer to a DWORD variable that contains the size, in bytes, of the buffer pointed to by the pvEncoded parameter. When the function returns, the variable pointed to by the pcbEncoded parameter contains the number of allocated, encoded bytes stored in the buffer. When dwFlags contains the CRYPT_ENCODE_ALLOC_FLAG flag, pcbEncoded is the address of a pointer to the DWORD value that is updated. Note??When processing the data returned in the buffer, applications must use the actual size of the data returned. The actual size can be slightly smaller than the size of the buffer specified on input. (On input, buffer sizes are usually specified large enough to ensure that the largest possible output data fits in the buffer.) On output, the variable pointed to by this parameter is updated to reflect the actual size of the data copied to the buffer.
%inst
Encodes a structure of the type indicated by the value of the
lpszStructType parameter.

[戻り値]
Returns nonzero if successful or zero otherwise. For extended error
information, call GetLastError. The following table shows some
possible error codes that can be returned from GetLastError when
CryptEncodeObjectEx fails.
This doc was truncated.

[備考]
When encoding a cryptographic object using the preferred
CryptEncodeObjectEx function, the terminating NULL character is
included. When decoding, using the preferred CryptDecodeObjectEx
function, the terminating NULL character is not retained.
CryptEncodeObjectEx first looks for an installable extended encoding
function. If no extended encoding function is found, the old,
nonextended, installable function is located. When direct IA5String
encoding of the object is not possible, you can specify Punycode
encoding by setting the dwFlag parameter to the
CRYPT_ENCODE_ENABLE_PUNYCODE_FLAG value. Setting the
CRYPT_ENCODE_ENABLE_PUNYCODE_FLAG flag has different effects based on
the structure type being encoded as specified by the value of the
lpszStructType parameter. Each constant in the list below has an
associated structure type that is pointed to by the pvStructInfo
parameter. The structure pointed to, directly or indirectly, has a
reference to a CERT_ALT_NAME_ENTRY structure.
This doc was truncated.


%index
CryptEncryptMessage
The CryptEncryptMessage function encrypts and encodes a message.
%group
Win32 crypt32
%prm
pEncryptPara, cRecipientCert, rgpRecipientCert, pbToBeEncrypted, cbToBeEncrypted, pbEncryptedBlob, pcbEncryptedBlob
pEncryptPara : [var] A pointer to a CRYPT_ENCRYPT_MESSAGE_PARA structure that contains the encryption parameters. The CryptEncryptMessage function does not support the SHA2 OIDs, szOID_DH_SINGLE_PASS_STDDH_SHA256_KDF and  szOID_DH_SINGLE_PASS_STDDH_SHA384_KDF.
cRecipientCert : [int] Number of elements in the rgpRecipientCert array.
rgpRecipientCert : [var] Array of pointers to CERT_CONTEXT structures that contain the certificates of intended recipients of the message.
pbToBeEncrypted : [var] A pointer to a buffer that contains the message that is to be encrypted.
cbToBeEncrypted : [int] The size, in bytes, of the message that is to be encrypted.
pbEncryptedBlob : [var] A pointer to BLOB that contains a buffer that receives the encrypted and encoded message.
pcbEncryptedBlob : [var] A pointer to a DWORD that specifies the size, in bytes, of the buffer pointed to by the pbEncryptedBlob parameter. When the function returns, this variable contains the size, in bytes, of the encrypted and encoded message copied to pbEncryptedBlob.
%inst
The CryptEncryptMessage function encrypts and encodes a message.

[戻り値]
If the function succeeds, the function returns nonzero (TRUE). If the
function fails, it returns zero (FALSE). For extended error
information, call GetLastError. Note Errors from calls to
CryptGenKey, CryptEncrypt, CryptImportKey, and CryptExportKey can be
propagated to this function. The GetLastError function returns the
following error codes most often.
This doc was truncated.


%index
CryptEnumKeyIdentifierProperties
The CryptEnumKeyIdentifierProperties function enumerates key identifiers and their properties.
%group
Win32 crypt32
%prm
pKeyIdentifier, dwPropId, dwFlags, pwszComputerName, pvReserved, pvArg, pfnEnum
pKeyIdentifier : [var] A pointer to a CRYPT_HASH_BLOB structure that contains the key identifier.
dwPropId : [int] Indicates the property identifier to be listed.
dwFlags : [int] By default, the list of key identifiers for the CurrentUser is searched. If CRYPT_KEYID_MACHINE_FLAG is set, the list of key identifiers of the LocalMachine (if pwszComputerName is NULL) or of a remote computer (if pwszComputerName is not NULL) is searched. For more information, see pwszComputerName.
pwszComputerName : [wstr] A pointer to the name of a remote computer to be searched. If CRYPT_KEYID_MACHINE_FLAG is set in dwFlags, the remote computer is searched for a list of key identifiers. If the local computer is to be searched and not a remote computer, pwszComputerName is set to NULL.
pvReserved : [intptr] Reserved for future use and must be NULL.
pvArg : [intptr] A pointer to data to be passed to the callback function. The type is a void that allows the application to declare, define, and initialize a structure or argument to hold any information.
pfnEnum : [int] A pointer to an application-defined callback function that is executed for each key identifier entry that matches the input parameters. For details about the callback functions parameters, see CRYPT_ENUM_KEYID_PROP.
%inst
The CryptEnumKeyIdentifierProperties function enumerates key
identifiers and their properties.

[戻り値]
The CryptEnumKeyIdentifierProperties function repeatedly calls the
CRYPT_ENUM_KEYID_PROP callback function until the last key identifier
is enumerated or the callback function returns FALSE. If the main
function succeeds, the function returns nonzero (TRUE). If the
function fails, it returns zero (FALSE). For extended error
information, call GetLastError. To continue enumeration, the function
returns TRUE. To stop enumeration, the function returns FALSE and
sets the last error code.

[備考]
A key identifier can have the same properties as a certificate
context.


%index
CryptEnumOIDFunction
The CryptEnumOIDFunction function enumerates the registered object identifier (OID) functions.
%group
Win32 crypt32
%prm
dwEncodingType, pszFuncName, pszOID, dwFlags, pvArg, pfnEnumOIDFunc
dwEncodingType : [int] Specifies the encoding type to match. Setting this parameter to CRYPT_MATCH_ANY_ENCODING_TYPE matches any encoding type. Note that if CRYPT_MATCH_ANY_ENCODING_TYPE is not specified, either a certificate or message encoding type is required. If the low-order word that contains the certificate encoding type is nonzero, it is used; otherwise, the high-order word that contains the message encoding type is used. If both are specified, the certificate encoding type in the low-order word is used.
pszFuncName : [str] Name of a function for which a case insensitive match search is performed. Setting this parameter to NULL results in a match being found for any function name.
pszOID : [str] If the high-order word of pszOID is nonzero, pszOID specifies the object identifier for which a case insensitive match search is performed. If the high-order word of pszOID is zero, pszOID is used to match a numeric object identifier. Setting this parameter to NULL matches any object identifier. Setting this parameter to CRYPT_DEFAULT_OID restricts the enumeration to only the default functions.
dwFlags : [int] Reserved for future use and must be zero.
pvArg : [intptr] A pointer to arguments to be passed through to the CRYPT_ENUM_OID_FUNCTION callback function.
pfnEnumOIDFunc : [int] A pointer to the callback function that is executed for each OID function that matches the input parameters. For details, see CRYPT_ENUM_OID_FUNCTION.
%inst
The CryptEnumOIDFunction function enumerates the registered object
identifier (OID) functions.

[戻り値]
If the function succeeds, the function returns nonzero (TRUE). If the
function fails, it returns zero (FALSE). For extended error
information, call GetLastError.


%index
CryptEnumOIDInfo
Enumerates predefined and registered object identifier (OID) CRYPT_OID_INFO structures. This function enumerates either all of the predefined and registered structures or only structures identified by a selected OID group.
%group
Win32 crypt32
%prm
dwGroupId, dwFlags, pvArg, pfnEnumOIDInfo
dwGroupId : [int] Indicates which OID groups to be matched. Setting dwGroupId to zero matches all groups. If dwGroupId is greater than zero, only the OID entries in the specified group are enumerated.
dwFlags : [int] This parameter is reserved for future use. It must be zero.
pvArg : [intptr] A pointer to arguments to be passed through to the callback function.
pfnEnumOIDInfo : [int] A pointer to the callback function that is executed for each OID information entry enumerated. For information about the callback parameters, see CRYPT_ENUM_OID_INFO.
%inst
Enumerates predefined and registered object identifier (OID)
CRYPT_OID_INFO structures. This function enumerates either all of the
predefined and registered structures or only structures identified by
a selected OID group.

[戻り値]
If the callback function completes the enumeration, this function
returns TRUE. If the callback function has stopped the enumeration,
this function returns FALSE.


%index
CryptExportPKCS8
Exports the private key in PKCS (CryptExportPKCS8)
%group
Win32 crypt32
%prm
hCryptProv, dwKeySpec, pszPrivateKeyObjId, dwFlags, pvAuxInfo, pbPrivateKeyBlob, pcbPrivateKeyBlob
hCryptProv : [int] An HCRYPTPROV  variable that contains  the cryptographic service provider (CSP). This is a handle to the CSP obtained by calling CryptAcquireContext.
dwKeySpec : [int] A DWORD  variable that contains  the key specification. The following dwKeySpec values are defined for the default provider.
pszPrivateKeyObjId : [str] An  LPSTR  variable that contains  the private key  object identifier (OID).
dwFlags : [int] This parameter should be zero if pbPrivateKeyBlob is NULL and 0x8000 otherwise.
pvAuxInfo : [intptr] This parameter must be set to NULL.
pbPrivateKeyBlob : [var] A pointer to an array of BYTE structures to receive the private key  to be exported.
pcbPrivateKeyBlob : [var] A pointer to a DWORD that may contain, on input, the size, in  bytes,  of the memory allocation needed to contain the pbPrivateKeyBlob. If pbPrivateKeyBlob is NULL, this parameter will return the size of the memory allocation needed for a second call to the function. For more information, see Retrieving Data of Unknown Length.
%inst
Exports the private key in PKCS (CryptExportPKCS8)

[戻り値]
If the function succeeds, the function returns nonzero. If the
function fails, it returns zero. For extended error information, call
GetLastError. The following error codes are specific to this
function.
This doc was truncated.

[備考]
This function is only supported for asymmetric keys.


%index
CryptExportPublicKeyInfo
The CryptExportPublicKeyInfo function exports the public key information associated with the corresponding private key of the provider. For an updated version of this function, see CryptExportPublicKeyInfoEx.
%group
Win32 crypt32
%prm
hCryptProvOrNCryptKey, dwKeySpec, dwCertEncodingType, pInfo, pcbInfo
hCryptProvOrNCryptKey : [int] Handle of the cryptographic service provider (CSP) to use when exporting the public key information. This handle must be an HCRYPTPROV handle that has been created by using the CryptAcquireContext function or an NCRYPT_KEY_HANDLE handle that has been created by using the NCryptOpenKey function. New applications should always pass in the NCRYPT_KEY_HANDLE handle of a CNG CSP.
dwKeySpec : [int] Identifies the private key to use from the container of the provider. It can be AT_KEYEXCHANGE or AT_SIGNATURE. This parameter is ignored if an NCRYPT_KEY_HANDLE is used in the hCryptProvOrNCryptKey parameter.
dwCertEncodingType : [int] Specifies the encoding type used. It is always acceptable to specify both the certificate and message encoding types by combining them with a bitwise-OR operation as shown in the following example: X509_ASN_ENCODING | PKCS_7_ASN_ENCODING Currently defined encoding types are:
pInfo : [var] A pointer to a CERT_PUBLIC_KEY_INFO  structure to receive the public key information to be exported. To set the size of this information for memory allocation purposes, this parameter can be NULL. For more information, see Retrieving Data of Unknown Length.
pcbInfo : [var] A pointer to a DWORD that contains the size, in bytes, of the buffer pointed to by the pInfo parameter. When the function returns, the DWORD contains the number of bytes needed for the return buffer. Note??When processing the data returned in the buffer, applications need to use the actual size of the data returned. The actual size can be slightly smaller than the size of the buffer specified on input. (On input, buffer sizes are usually specified large enough to ensure that the largest possible output data will fit in the buffer.) On output, the variable pointed to by this parameter is updated to reflect the actual size of the data copied to the buffer.
%inst
The CryptExportPublicKeyInfo function exports the public key
information associated with the corresponding private key of the
provider. For an updated version of this function, see
CryptExportPublicKeyInfoEx.

[戻り値]
If the function succeeds, the function returns nonzero (TRUE). If the
function fails, it returns zero (FALSE). For extended error
information, call GetLastError. Note Errors from the called functions
CryptGetUserKey and CryptExportKey might be propagated to this
function. This function has the following error codes.
This doc was truncated.


%index
CryptExportPublicKeyInfoEx
Exports the public key information associated with the provider's corresponding private key.
%group
Win32 crypt32
%prm
hCryptProvOrNCryptKey, dwKeySpec, dwCertEncodingType, pszPublicKeyObjId, dwFlags, pvAuxInfo, pInfo, pcbInfo
hCryptProvOrNCryptKey : [int] A handle of the CSP to use when exporting the public key information. This handle must be an HCRYPTPROV handle that has been created by using the CryptAcquireContext function or an NCRYPT_KEY_HANDLE handle that has been created by using the NCryptOpenKey function. New applications should always pass in the NCRYPT_KEY_HANDLE handle of a CNG CSP.
dwKeySpec : [int] Identifies the private key to use from the provider's container. It can be AT_KEYEXCHANGE or AT_SIGNATURE. This parameter is ignored if an NCRYPT_KEY_HANDLE is used in the hCryptProvOrNCryptKey parameter.
dwCertEncodingType : [int] Specifies the encoding type used. It is always acceptable to specify both the certificate and message encoding types by combining them with a bitwise-OR operation as shown in the following example: X509_ASN_ENCODING | PKCS_7_ASN_ENCODING Currently defined encoding types are:
pszPublicKeyObjId : [str] Specifies the public key algorithm. Note??pszPublicKeyObjId and dwCertEncodingType are used together to determine the installable CRYPT_OID_EXPORT_PUBLIC_KEY_INFO_FUNC to call. If an installable function was not found for the pszPublicKeyObjId parameter, an attempt is made to export the key as an RSA Public Key (szOID_RSA_RSA).
dwFlags : [int] A DWORD flag value that indicates how the public key information  is exported. The flag value is passed directly to the CryptFindOIDInfo function when mapping the public key object identifier to the corresponding CNG public key algorithm Unicode string. The following flag values can be set.
pvAuxInfo : [intptr] This parameter is reserved for future use and  must be set to NULL.
pInfo : [var] A pointer to a CERT_PUBLIC_KEY_INFO  structure to receive the public key information to be exported. This parameter can be NULL to set the size of this information for memory allocation purposes. For more information, see Retrieving Data of Unknown Length.
pcbInfo : [var] A pointer to a DWORD that contains the size, in bytes, of the buffer pointed to by the pInfo parameter. When the function returns, the DWORD contains the number of bytes stored in the buffer. Note??When processing the data returned in the buffer, applications need to use the actual size of the data returned. The actual size can be slightly smaller than the size of the buffer specified on input. (On input, buffer sizes are usually specified large enough to ensure that the largest possible output data will fit in the buffer.) On output, the variable pointed to by this parameter is updated to reflect the actual size of the data copied to the buffer.
%inst
Exports the public key information associated with the provider's
corresponding private key.

[戻り値]
If the function succeeds, the return value is nonzero (TRUE). If the
function fails, the return value is zero (FALSE). For extended error
information, call GetLastError. Note Errors from the called functions
CryptGetUserKey and CryptExportKey can be propagated to this
function. This function has the following error codes.
This doc was truncated.


%index
CryptExportPublicKeyInfoFromBCryptKeyHandle
Exports the public key information associated with a provider's corresponding private key.
%group
Win32 crypt32
%prm
hBCryptKey, dwCertEncodingType, pszPublicKeyObjId, dwFlags, pvAuxInfo, pInfo, pcbInfo
hBCryptKey : [int] The handle of the key from which to export the public key information.
dwCertEncodingType : [int] Specifies the encoding type to be matched.
pszPublicKeyObjId : [str] A pointer to the object identifier (OID) that identifies the installable function to  use to export the key. If the high-order word of the OID is nonzero, pszPublicKeyObjId is a pointer to either an OID string such as "2.5.29.1" or an ASCII string such as "file." If the high-order word of the OID is zero, the low-order word specifies the integer identifier to be used as the object identifier.
dwFlags : [int] A DWORD value that indicates how the public key information  is exported.
pvAuxInfo : [intptr] This parameter is reserved for future use and  must be set to NULL.
pInfo : [var] A pointer to a CERT_PUBLIC_KEY_INFO  structure to receive the public key information to be exported. This parameter can be NULL to set the size of this information for memory allocation purposes. For more information, see Retrieving Data of Unknown Length.
pcbInfo : [var] A pointer to a DWORD that contains the size, in bytes, of the buffer pointed to by the pInfo parameter. When the function returns, the DWORD contains the number of bytes stored in the buffer.
%inst
Exports the public key information associated with a provider's
corresponding private key.

[戻り値]
The function returns TRUE if it succeeds; otherwise, it returns
FALSE.

[備考]
If the CryptExportPublicKeyInfoFromBCryptKeyHandle function is unable
to find an installable OID function for the OID specified by the
pszPublicKeyObjId parameter, it attempts to export the key as a RSA
Public Key (szOID_RSA_RSA). If the key is exported as a RSA Public
Key, the values of the dwFlags and pvAuxInfo parameters are not used.


%index
CryptFindCertificateKeyProvInfo
Enumerates the cryptographic providers and their containers to find the private key that corresponds to the certificate's public key.
%group
Win32 crypt32
%prm
pCert, dwFlags, pvReserved
pCert : [var] A pointer to the CERT_CONTEXT structure of the certificate to use when exporting public key information.
dwFlags : [int] 
pvReserved : [intptr] Reserved for future use and must be NULL.
%inst
Enumerates the cryptographic providers and their containers to find
the private key that corresponds to the certificate's public key.

[戻り値]
TRUE if the function finds a private key that corresponds to the
certificate's public key within a searched container; FALSE if the
function fails to find a container or a private key within a
container.
GetLastError returns the following error:
This doc was truncated.

[備考]
This function enumerates the cryptographic providers and their
containers to find the private key that corresponds to the
certificate's public key. For a match, the function updates the
certificate's CERT_KEY_PROV_INFO_PROP_ID property. If the
CERT_KEY_PROV_INFO_PROP_ID is already set, it is checked to determine
whether it matches the provider's public key. For a match, the
function skips the previously mentioned enumeration.


%index
CryptFindLocalizedName
Finds the localized name for the specified name, such as the localize name of the "Root" system store.
%group
Win32 crypt32
%prm
pwszCryptName
pwszCryptName : [wstr] A pointer to a specified name. An internal table is searched to compare a predefined localized name to the specified name. The search matches the localized name by using a case insensitive string comparison.
%inst
Finds the localized name for the specified name, such as the localize
name of the "Root" system store.

[戻り値]
If the specified name is found, a pointer to the localized name is
returned. The returned pointer must not be freed.
If the specified name is not found, NULL is returned.

[備考]
CryptSetOIDFunctionValue can be called as follows to register
additional localized strings. dwEncodingType =
CRYPT_LOCALIZED_NAME_ENCODING_TYPE pszFuncName =
CRYPT_OID_FIND_LOCALIZED_NAME_FUNC pszOID = CRYPT_LOCALIZED_NAME_OID
pwszValueName = Name to be localized, for example,
L"ApplicationStore" dwValueType = REG_SZ pbValueData = pointer to the
Unicode localized string cbValueData = (wcslen(Unicode localized
string) + 1) * sizeof(WCHAR)
CryptSetOIDFunctionValue can be called as follows to unregister the
localized strings. pbValueData = NULL cbValueData = 0. The registered
names are searched before the preinstalled names.
This doc was truncated.


%index
CryptFindOIDInfo
Retrieves the first predefined or registered CRYPT_OID_INFO structure that matches a specified key type and key. The search can be limited to object identifiers (OIDs) within a specified OID group.
%group
Win32 crypt32
%prm
dwKeyType, pvKey, dwGroupId
dwKeyType : [int] Specifies the key type to use when finding OID information.
pvKey : [intptr] The address of a buffer that contains additional search information. This parameter depends on the value of the dwKeyType parameter. For more information, see the table under dwKeyType.
dwGroupId : [int] The group identifier to use when finding OID information. Setting this parameter to zero searches all groups according to the dwKeyType parameter. Otherwise, only the indicated dwGroupId is searched. For information about code that lists the OID information by group identifier, see CryptEnumOIDInfo.
%inst
Retrieves the first predefined or registered CRYPT_OID_INFO structure
that matches a specified key type and key. The search can be limited
to object identifiers (OIDs) within a specified OID group.

[戻り値]
Returns a pointer to a constant structure of type CRYPT_OID_INFO. The
returned pointer must not be freed. When the specified key and group
is not found, NULL is returned.

[備考]
The CryptFindOIDInfo function performs a lookup in the active
directory to retrieve the friendly names of OIDs under the following
conditions:
This doc was truncated.


%index
CryptFormatObject
The CryptFormatObject function formats the encoded data and returns a Unicode string in the allocated buffer according to the certificate encoding type.
%group
Win32 crypt32
%prm
dwCertEncodingType, dwFormatType, dwFormatStrType, pFormatStruct, lpszStructType, pbEncoded, cbEncoded, pbFormat, pcbFormat
dwCertEncodingType : [int] Type of encoding used on the certificate. The currently defined certificate encoding type used is X509_ASN_ENCODING.
dwFormatType : [int] Format type values. Not used. Set to zero.
dwFormatStrType : [int] Structure format type values. This parameter can be zero, or you can specify one or more of the following flags by using the bitwise-OR operator to combine them.
pFormatStruct : [intptr] A pointer to the format of the structure. Not used. Set to NULL.
lpszStructType : [str] A pointer to an OID that defines the encoded data. If the high-order word of the lpszStructType parameter is zero, the low-order word specifies the integer identifier for the type of the given structure. Otherwise, this parameter is a long pointer to a null-terminated string.
pbEncoded : [var] A pointer to the encoded data to be formatted. If lpszStructType is one of the OIDs listed above, the pbEncoded is the encoded extension.
cbEncoded : [int] The size, in bytes, of the pbEncoded structure.
pbFormat : [intptr] A pointer to a buffer that receives the formatted string. When the buffer that is specified is not large enough to receive the decoded structure, the function sets ERROR_MORE_DATA and stores the required buffer size, in bytes, into the variable pointed to by pcbFormat. This parameter can be NULL to set the size of this information for memory allocation purposes. For more information, see Retrieving Data of Unknown Length.
pcbFormat : [var] A pointer to a variable that specifies the size, in bytes, of the buffer pointed to by the pbFormat parameter. When the function returns, the variable pointed to by the pcbFormat parameter contains the number of bytes stored in the buffer. This parameter can be NULL, only if pbFormat is NULL.
%inst
The CryptFormatObject function formats the encoded data and returns a
Unicode string in the allocated buffer according to the certificate
encoding type.

[戻り値]
If the function succeeds, the return value is TRUE. If it does not
succeed, the return value is FALSE. To retrieve extended error
information, use the GetLastError function.

[備考]
The default behavior of this function is to return a single-line
display of the encoded data, that is, each subfield is concatenated
with a comma (,) on one line. If you prefer to display the data in
multiple lines, set the CRYPT_FORMAT_STR_MULTI_LINE flag. Each
subfield will then be displayed on a separate line. If there is no
formatting routine installed or registered for the lpszStructType
parameter, the hexadecimal dump of the encoded CRYPT_INTEGER_BLOB
will be returned. A user can set the CRYPT_FORMAT_STR_NO_HEX flag to
disable the hexadecimal dump.


%index
CryptFreeOIDFunctionAddress
The CryptFreeOIDFunctionAddress function releases a handle returned by CryptGetOIDFunctionAddress or CryptGetDefaultOIDFunctionAddress by decrementing the reference count on the function handle.
%group
Win32 crypt32
%prm
hFuncAddr, dwFlags
hFuncAddr : [intptr] Handle of the function previously obtained from a call to CryptGetOIDFunctionAddress or CryptGetDefaultOIDFunctionAddress.
dwFlags : [int] Reserved for future use and must be zero.
%inst
The CryptFreeOIDFunctionAddress function releases a handle returned
by CryptGetOIDFunctionAddress or CryptGetDefaultOIDFunctionAddress by
decrementing the reference count on the function handle.

[戻り値]
If the function succeeds, the function returns nonzero (TRUE). If the
function fails, it returns zero (FALSE).

[備考]
If the reference count becomes zero and a DLL is loaded for the
function being freed, the DLL might be unloaded. If the DLL exports
the DLLCanUnloadNow function, that function is called and its return
is checked. An S_FALSE return from this function cancels the
unloading of the DLL at this time. If the function returns S_TRUE or
if the DLL does not export the DLLCanUnloadNow function, an unloading
process is started. In this case, actual unloading is deferred for 15
seconds. If another CryptFreeOIDFunctionAddress or
CryptGetDefaultOIDFunctionAddress that requires the DLL occurs before
the 15 seconds elapse, the deferred unload process is canceled.


%index
CryptGetAsyncParam
The CryptGetAsyncParam function (wincrypt.h) sets an async parameter value.
%group
Win32 crypt32
%prm
hAsync, pszParamOid, ppvParam, ppfnFree
hAsync : [intptr] An async handle.
pszParamOid : [str] The parameter ID.
ppvParam : [var] Receives the parameter value.
ppfnFree : [var] A callback function called when the parameter is freed.
%inst
The CryptGetAsyncParam function (wincrypt.h) sets an async parameter
value.

[戻り値]
S_OK on success.


%index
CryptGetDefaultOIDDllList
The CryptGetDefaultOIDDllList function acquires the list of the names of DLL files that contain registered default object identifier (OID) functions for a specified function set and encoding type.
%group
Win32 crypt32
%prm
hFuncSet, dwEncodingType, pwszDllList, pcchDllList
hFuncSet : [intptr] Function set handle previously obtained by a call to CryptInitOIDFunctionSet.
dwEncodingType : [int] Specifies the encoding type to be matched. Currently, only X509_ASN_ENCODING and PKCS_7_ASN_ENCODING are being used; however, additional encoding types may be added in the future. To match both current encoding types, use: X509_ASN_ENCODING | PKCS_7_ASN_ENCODING Note??Either a certificate or message encoding type is required. X509_ASN_ENCODING is the default. If that type is indicated, it is used; otherwise, if the PKCS7_ASN_ENCODING type is indicated, it is used.
pwszDllList : [int] A pointer to a buffer to receive the list of zero or more null-terminated file names. The returned list is terminated with a terminating NULL character. For example, a list of two names could be:
pcchDllList : [var] A pointer to a DWORD that specifies the size, in wide characters, of the returned list pointed to by the pwszDllList parameter. When the function returns, the variable pointed to by the pcchDllList parameter contains the number of wide characters stored in the buffer.
%inst
The CryptGetDefaultOIDDllList function acquires the list of the names
of DLL files that contain registered default object identifier (OID)
functions for a specified function set and encoding type.

[戻り値]
If the function succeeds, the function returns nonzero (TRUE). If the
function fails, it returns zero (FALSE). For extended error
information, call GetLastError. This function has the following error
codes.
This doc was truncated.


%index
CryptGetDefaultOIDFunctionAddress
The CryptGetDefaultOIDFunctionAddress function loads the DLL that contains a default function address.
%group
Win32 crypt32
%prm
hFuncSet, dwEncodingType, pwszDll, dwFlags, ppvFuncAddr, phFuncAddr
hFuncSet : [intptr] Function set handle previously obtained from a call to CryptInitOIDFunctionSet.
dwEncodingType : [int] Encoding type to be matched. Currently, only X509_ASN_ENCODING and PKCS_7_ASN_ENCODING are being used; however, additional encoding types may be added in the future. To match both current encoding types, use: X509_ASN_ENCODING | PKCS_7_ASN_ENCODING
pwszDll : [wstr] Name of the DLL to load. Normally, the DLL name is obtained from the list returned by CryptGetDefaultOIDDllList. If pwszDll is NULL, a search is performed on the list of installed default functions.
dwFlags : [int] Reserved for future use and must be zero.
ppvFuncAddr : [var] A pointer to the address of the return function. If the function fails, a NULL is returned in ppvFuncAddr.
phFuncAddr : [var] Used only if pwszDll is NULL. On the first call to the function, *phFuncAddr must be NULL to acquire the first installed function.
%inst
The CryptGetDefaultOIDFunctionAddress function loads the DLL that
contains a default function address.

[戻り値]
If the function succeeds, the function returns nonzero (TRUE). If the
function fails, it returns zero (FALSE).


%index
CryptGetKeyIdentifierProperty
The CryptGetKeyIdentifierProperty acquires a specific property from a specified key identifier.
%group
Win32 crypt32
%prm
pKeyIdentifier, dwPropId, dwFlags, pwszComputerName, pvReserved, pvData, pcbData
pKeyIdentifier : [var] A pointer to the CRYPT_HASH_BLOB that contains the key identifier.
dwPropId : [int] Identifies the property to retrieve. The value of dwPropId determines the type and content of the pvData parameter. Any certificate property ID can be used.
dwFlags : [int] The following flags can be used. They can be combined with a bitwise-OR operation.
pwszComputerName : [wstr] A pointer to the name of a remote computer to be searched. If CRYPT_KEYID_MACHINE_FLAG flag is set, searches the remote computer for a list of key identifiers. If the local computer is to be searched and not a remote computer, set pwszComputerName to NULL.
pvReserved : [intptr] Reserved for future use and must be NULL.
pvData : [intptr] A pointer to a buffer to receive the data as determined by dwPropId. Elements pointed to by fields in the pvData structure follow the structure. Therefore, the size contained in pcbData can exceed the size of the structure.
pcbData : [var] A pointer to a DWORD that contains the size, in bytes, of the buffer pointed to by the pvData parameter. When the function returns, the DWORD contains the number of bytes stored in the buffer. The size contained in the variable pointed to by pcbData can indicate a size larger than the CRYPT_KEY_PROV_INFO structure because the structure can contain pointers to auxiliary data. This size is the sum of the size needed by the structure and all auxiliary data.
%inst
The CryptGetKeyIdentifierProperty acquires a specific property from a
specified key identifier.

[戻り値]
If the function succeeds, the function returns nonzero (TRUE). If the
function fails, it returns zero (FALSE). For extended error
information, call GetLastError.


%index
CryptGetMessageCertificates
The CryptGetMessageCertificates function returns the handle of an open certificate store containing the message's certificates and CRLs. This function calls CertOpenStore using provider type CERT_STORE_PROV_PKCS7 as its lpszStoreProvider parameter.
%group
Win32 crypt32
%prm
dwMsgAndCertEncodingType, hCryptProv, dwFlags, pbSignedBlob, cbSignedBlob
dwMsgAndCertEncodingType : [int] Specifies the encoding type used. It is always acceptable to specify both the certificate and message encoding types by combining them with a bitwise-OR operation as shown in the following example: X509_ASN_ENCODING | PKCS_7_ASN_ENCODING Currently defined encoding types are:
hCryptProv : [int] This parameter is not used and should be set to NULL. Windows Server?2003 and Windows?XP:??Handle of the CSP passed to CertOpenStore. For more information, see CertOpenStore.Unless there is a strong reason for passing a specific cryptographic provider in hCryptProv, pass zero to cause the default RSA or DSS provider to be acquired. This parameter's data type is HCRYPTPROV.
dwFlags : [int] Flags passed to CertOpenStore. For more information, see CertOpenStore.
pbSignedBlob : [var] A pointer to a buffered CRYPT_INTEGER_BLOB structure that contains the signed message.
cbSignedBlob : [int] The size, in bytes, of the signed message.
%inst
The CryptGetMessageCertificates function returns the handle of an
open certificate store containing the message's certificates and
CRLs. This function calls CertOpenStore using provider type
CERT_STORE_PROV_PKCS7 as its lpszStoreProvider parameter.

[戻り値]
Returns the certificate store containing the message's certificates
and CRLs. For an error, NULL is returned. The following lists the
error code most commonly returned by the GetLastError function.
This doc was truncated.

[備考]
Use GetLastError to determine the reason for any errors.


%index
CryptGetMessageSignerCount
The CryptGetMessageSignerCount function returns the number of signers of a signed message.
%group
Win32 crypt32
%prm
dwMsgEncodingType, pbSignedBlob, cbSignedBlob
dwMsgEncodingType : [int] Specifies the encoding type used. It is always acceptable to specify both the certificate and message encoding types by combining them with a bitwise-OR operation as shown in the following example: X509_ASN_ENCODING | PKCS_7_ASN_ENCODING Currently defined encoding types are:
pbSignedBlob : [var] A pointer to a buffer containing the signed message.
cbSignedBlob : [int] The size, in bytes, of the signed message.
%inst
The CryptGetMessageSignerCount function returns the number of signers
of a signed message.

[戻り値]
Returns the number of signers of a signed message, zero when there
are no signers, and minus one (?1) for an error. For extended error
information, call GetLastError. The following error code is most
commonly returned.
This doc was truncated.


%index
CryptGetOIDFunctionAddress
Searches the list of registered and installed functions for an encoding type and object identifier (OID) match.
%group
Win32 crypt32
%prm
hFuncSet, dwEncodingType, pszOID, dwFlags, ppvFuncAddr, phFuncAddr
hFuncSet : [intptr] The function set handle previously obtained from a call to the CryptInitOIDFunctionSet function.
dwEncodingType : [int] Specifies the encoding type to be matched. Currently, only X509_ASN_ENCODING and PKCS_7_ASN_ENCODING are used; however, additional encoding types can be added in the future. To match both current encoding types, use: X509_ASN_ENCODING | PKCS_7_ASN_ENCODING For functions that do not use an encoding type, set this parameter to zero.
pszOID : [str] If the high-order word of the OID is nonzero, pszOID is a pointer to either an OID string such as "2.5.29.1" or an ASCII string such as "file". If the high-order word of the OID is zero, the low-order word specifies the numeric identifier to be used as the object identifier. This resulting OID maps to the function that was either installed or registered with the same OID.
dwFlags : [int] This parameter can be the following value.
ppvFuncAddr : [var] A pointer to a pointer to a function address. If a match is found, ppvFuncAddr points to the function address.
phFuncAddr : [var] If a match is found, phFuncAddr points to the function handle. The reference count for the handle is incremented. When you have finished using the handle, release the handle by calling the CryptFreeOIDFunctionAddress function.
%inst
Searches the list of registered and installed functions for an
encoding type and object identifier (OID) match.

[戻り値]
If the function succeeds and a match is found, the function returns
nonzero (TRUE). If the function fails or no match is found, it
returns zero (FALSE). For extended error information, call
GetLastError.

[備考]
You can call CryptGetOIDFunctionAddress with the pszOID argument set
to CMSG_DEFAULT_INSTALLABLE_FUNC_OID to get the default installable
function for the following callback functions. For retrieval of the
default functions, set dwEncodingType to a bitwise OR combination of
the following encoding types. CRYPT_ASN_ENCODING X509_ASN_ENCODING


%index
CryptGetOIDFunctionValue
The CryptGetOIDFunctionValue function queries a value associated with an OID.
%group
Win32 crypt32
%prm
dwEncodingType, pszFuncName, pszOID, pwszValueName, pdwValueType, pbValueData, pcbValueData
dwEncodingType : [int] Specifies the encoding type to be matched. Currently, only X509_ASN_ENCODING and PKCS_7_ASN_ENCODING are being used; however, additional encoding types may be added in the future. To match both current encoding types, use    X509_ASN_ENCODING | PKCS_7_ASN_ENCODING.
pszFuncName : [str] A pointer to the null-terminated string that contains the name of the OID function set.
pszOID : [str] If the high-order word of the OID is nonzero, pszOID is a pointer to either a  null-terminated OID string such as "2.5.29.1" or a null-terminated ASCII string such as "file." If the high-order word of the OID is zero, the low-order word specifies the numeric identifier to be used as the object identifier.
pwszValueName : [wstr] A pointer to a null-terminated Unicode string that contains the name of the value to be queried.
pdwValueType : [var] A pointer to a variable to receive the value's type. The type returned through this parameter will be one of the following.
pbValueData : [var] A pointer to a buffer to receive the value associated with the pwszValueName parameter. The buffer must be big enough to contain the terminating NULL character. This parameter can be NULL if returned data is not required. This parameter can also be NULL to find the size of the buffer for memory allocation purposes. For more information, see Retrieving Data of Unknown Length.
pcbValueData : [var] A pointer to a DWORD that specifies the size, in bytes, of the buffer pointed to by the pbValueData. In most cases the value returned in *pcbValueData includes the size of the terminating NULL character in the string.  For information about situations where the NULL character is not included, see the Remarks section of RegQueryValueEx. Note??When processing the data returned in the buffer, applications must use the actual size of the data returned. The actual size can be slightly smaller than the size of the buffer specified on input. (On input, buffer sizes are usually specified large enough to ensure that the largest possible output data will fit in the buffer.) On output, the variable pointed to by this parameter is updated to reflect the actual size of the data copied to the buffer.
%inst
The CryptGetOIDFunctionValue function queries a value associated with
an OID.

[戻り値]
If the function succeeds, the function returns nonzero (TRUE). If the
function fails, it returns zero (FALSE). For extended error
information, call GetLastError. This function has the following error
code.
This doc was truncated.


%index
CryptHashCertificate
The CryptHashCertificate function hashes the entire encoded content of a certificate including its signature.
%group
Win32 crypt32
%prm
hCryptProv, Algid, dwFlags, pbEncoded, cbEncoded, pbComputedHash, pcbComputedHash
hCryptProv : [int] This parameter is not used and should be set to NULL. Windows Server?2003 and Windows?XP:??A handle of the cryptographic service provider (CSP) to use to compute the hash.
Algid : [int] An ALG_ID structure that specifies the hash algorithm to use. If Algid is zero, the default hash algorithm, SHA1, is used.
dwFlags : [int] Value to be passed to the hash API. For details, see CryptCreateHash.
pbEncoded : [var] Address of the encoded content to be hashed.
cbEncoded : [int] The size, in bytes, of the encoded content.
pbComputedHash : [var] A pointer to a buffer to receive the computed hash.
pcbComputedHash : [var] A pointer to a DWORD that contains the size, in bytes, of the buffer pointed to by the pbComputedHash parameter. When the function returns, the DWORD contains the number of bytes stored in the buffer.
%inst
The CryptHashCertificate function hashes the entire encoded content
of a certificate including its signature.

[戻り値]
If the function succeeds, the function returns nonzero (TRUE). If the
function fails, it returns zero (FALSE). For extended error
information, call GetLastError. Note Errors from the called functions
CryptCreateHash, CryptGetHashParam and CryptHashData might be
propagated to this function.


%index
CryptHashCertificate2
Hashes a block of data by using a CNG hash provider.
%group
Win32 crypt32
%prm
pwszCNGHashAlgid, dwFlags, pvReserved, pbEncoded, cbEncoded, pbComputedHash, pcbComputedHash
pwszCNGHashAlgid : [wstr] The address of a null-terminated Unicode string that contains the CNG hash algorithm identifier of the hash algorithm to use to hash the certificate. This can be one of the CNG Algorithm Identifiers that represents a hash algorithm or any other registered hash algorithm identifier.
dwFlags : [int] A set of flags that modify the behavior of this function. No flags are defined for this function.
pvReserved : [intptr] Reserved for future use and must be NULL.
pbEncoded : [var] The address of an array of bytes to be hashed. The cbEncoded parameter contains the size of this array.
cbEncoded : [int] The number of elements in the pbEncoded array.
pbComputedHash : [var] The address of a buffer that receives the computed hash. The variable pointed to by the pcbComputedHash parameter contains the size of this buffer.
pcbComputedHash : [var] The address of a DWORD variable that, on entry, contains the size, in bytes, of the  pbComputedHash buffer. After this function returns, this variable contains the number of bytes copied to the pbComputedHash buffer.
%inst
Hashes a block of data by using a CNG hash provider.

[戻り値]
If the function succeeds, the function returns nonzero (TRUE). If the
function fails, it returns zero (FALSE). For extended error
information, call GetLastError. Some of the possible error codes are
identified in the following topics. BCryptOpenAlgorithmProvider
BCryptCreateHash BCryptGetProperty BCryptHashData BCryptFinishHash


%index
CryptHashMessage
Creates a hash of the message.
%group
Win32 crypt32
%prm
pHashPara, fDetachedHash, cToBeHashed, rgpbToBeHashed, rgcbToBeHashed, pbHashedBlob, pcbHashedBlob, pbComputedHash, pcbComputedHash
pHashPara : [var] A pointer to a CRYPT_HASH_MESSAGE_PARA structure that contains the hash parameters.
fDetachedHash : [int] If this parameter is set to TRUE, only pbComputedHash is encoded in pbHashedBlob. Otherwise, both rgpbToBeHashed and pbComputedHash are encoded.
cToBeHashed : [int] The number of array elements in rgpbToBeHashed and rgcbToBeHashed. This parameter can only be one unless fDetachedHash is set to TRUE.
rgpbToBeHashed : [var] An array of pointers to buffers that contain the contents to be hashed.
rgcbToBeHashed : [var] An array of sizes, in bytes, of the buffers pointed to by rgpbToBeHashed.
pbHashedBlob : [var] A pointer to a buffer to receive the hashed message encoded for transmission.
pcbHashedBlob : [var] A pointer to a DWORD that specifies the size, in bytes, of the buffer pointed to by the pbHashedBlob parameter. When the function returns, this variable contains the size, in bytes, of the decrypted message copied to pbHashedBlob. This parameter must be the address of a DWORD and not NULL or the length of the buffer will not be returned.
pbComputedHash : [var] A pointer to a buffer to receive the newly created hash value. This parameter can be NULL if the newly created hash is not needed for additional processing, or to set the size of the hash for memory allocation purposes. For more information, see Retrieving Data of Unknown Length.
pcbComputedHash : [var] A pointer to a DWORD that specifies the size, in bytes, of the buffer pointed to by the pbComputedHash parameter. When the function returns, this DWORD contains the size, in bytes, of the newly created hash that was copied to pbComputedHash.
%inst
Creates a hash of the message.

[戻り値]
If the function succeeds, the function returns nonzero (TRUE). If the
function fails, it returns zero (FALSE). For extended error
information, call GetLastError. Note Errors from the called functions
CryptCreateHash, CryptHashData, and CryptGetHashParam might be
propagated to this function. The GetLastError function returns the
following error codes most often.
This doc was truncated.


%index
CryptHashPublicKeyInfo
Encodes the public key information in a CERT_PUBLIC_KEY_INFO structure and computes the hash of the encoded bytes.
%group
Win32 crypt32
%prm
hCryptProv, Algid, dwFlags, dwCertEncodingType, pInfo, pbComputedHash, pcbComputedHash
hCryptProv : [int] This parameter is not used and should be set to NULL. Windows Server?2003 and Windows?XP:??A handle of the cryptographic service provider (CSP) to use to compute the hash.This parameter's data type is HCRYPTPROV. Unless there is a strong reason for passing in a specific cryptographic provider in hCryptProv, zero is passed in. Passing in zero causes the default RSA or Digital Signature Standard (DSS) provider to be acquired before doing hash, signature verification, or recipient encryption operations.
Algid : [int] An ALG_ID structure that specifies the CryptoAPI hash algorithm to use. If Algid is zero, the default hash algorithm, MD5, is used.
dwFlags : [int] Values to be passed on to CryptCreateHash.
dwCertEncodingType : [int] Specifies the encoding type used. It is always acceptable to specify both the certificate and message encoding types by combining them with a bitwise-OR operation as shown in the following example: X509_ASN_ENCODING | PKCS_7_ASN_ENCODING Currently defined encoding types are:
pInfo : [var] A pointer to a CERT_PUBLIC_KEY_INFO structure that contains the public key information to be encoded and hashed.
pbComputedHash : [var] A pointer to a buffer to receive the computed hash. To set the size of this information for memory allocation purposes, this parameter can be NULL. For more information, see Retrieving Data of Unknown Length.
pcbComputedHash : [var] A pointer to a DWORD that contains the size, in bytes, of the buffer pointed to by the pbComputedHash parameter. When the function returns, the DWORD contains the number of bytes stored in the buffer. Note??When processing the data returned in the buffer, applications need to use the actual size of the data returned. The actual size can be slightly smaller than the size of the buffer specified on input. On input, buffer sizes are usually specified large enough to ensure that the largest possible output data will fit in the buffer. On output, the variable pointed to by this parameter is updated to reflect the actual size of the data copied to the buffer.
%inst
Encodes the public key information in a CERT_PUBLIC_KEY_INFO
structure and computes the hash of the encoded bytes.

[戻り値]
If the function succeeds, the function returns nonzero (TRUE). If the
function fails, it returns zero (FALSE). For extended error
information, call GetLastError. Note Errors from the called functions
CryptCreateHash, CryptGetHashParam, and CryptHashData can be
propagated to this function. This function has the following error
codes.
This doc was truncated.


%index
CryptHashToBeSigned
Important??This API is deprecated. (CryptHashToBeSigned)
%group
Win32 crypt32
%prm
hCryptProv, dwCertEncodingType, pbEncoded, cbEncoded, pbComputedHash, pcbComputedHash
hCryptProv : [int] This parameter is not used and should be set to NULL. Windows Server?2003 and Windows?XP:??A handle of the cryptographic service provider (CSP) to use to compute the hash.This parameter's data type is HCRYPTPROV. Unless there is a strong reason for passing in a specific cryptographic provider in hCryptProv, zero is passed in. Passing in zero causes the default RSA or Digital Signature Standard (DSS) provider to be acquired before doing hash, signature verification, or recipient encryption operations.
dwCertEncodingType : [int] Specifies the encoding type used. It is always acceptable to specify both the certificate and message encoding types by combining them with a bitwise-OR operation as shown in the following example: X509_ASN_ENCODING | PKCS_7_ASN_ENCODING Currently defined encoding types are:
pbEncoded : [var] Address of a buffer that contains the content to be hashed. This is the encoded form of a CERT_SIGNED_CONTENT_INFO.
cbEncoded : [int] The size, in bytes, of the buffer.
pbComputedHash : [var] A pointer to a buffer to receive the computed hash. This parameter can be NULL to set the size of this information for memory allocation purposes. For more information, see Retrieving Data of Unknown Length.
pcbComputedHash : [var] A pointer to a DWORD that contains the size, in bytes, of the buffer pointed to by the pbComputedHash parameter. When the function returns, the DWORD contains the number of bytes stored in the buffer. Note??When processing the data returned in the buffer, applications need to use the actual size of the data returned. The actual size can be slightly smaller than the size of the buffer specified on input. On input, buffer sizes are usually specified large enough to ensure that the largest possible output data will fit in the buffer. On output, the variable pointed to by this parameter is updated to reflect the actual size of the data copied to the buffer.
%inst
Important This API is deprecated. (CryptHashToBeSigned)

[戻り値]
If the function succeeds, the function returns nonzero (TRUE). If the
function fails, it returns zero (FALSE). For extended error
information, call GetLastError. Note Errors from the called functions
CryptCreateHash, CryptGetHashParam, and CryptHashData might be
propagated to this function. This function has the following error
codes.
This doc was truncated.


%index
CryptImportPKCS8
Imports the private key in PKCS
%group
Win32 crypt32
%prm
sPrivateKeyAndParams, dwFlags, phCryptProv, pvAuxInfo
sPrivateKeyAndParams : [var] A CRYPT_PKCS8_IMPORT_PARAMS structure that contains the private key BLOB and corresponding parameters.
dwFlags : [int] 
phCryptProv : [var] A pointer to the HCRYPTPROV  to receive the handle of the provider into which the key is imported by calling the CryptImportPKCS8 function. When you have finished using the handle, free the handle by calling CryptReleaseContext. This parameter can be NULL, in which case the handle of the provider is not returned.
pvAuxInfo : [intptr] This parameter must be NULL.
%inst
Imports the private key in PKCS

[戻り値]
If the function succeeds, the function returns nonzero (TRUE). If the
function fails, it returns zero (FALSE). For extended error
information, call GetLastError. The following error code is specific
to this function.
This doc was truncated.

[備考]
CryptImportPKCS8 calls the PCRYPT_RESOLVE_HCRYPTPROV_FUNC function by
using the CRYPT_PKCS8_IMPORT_PARAMS structure contained in the
sPrivateKeyAndParams parameter to retrieve a handle of the provider
to which to import the key. If PCRYPT_RESOLVE_HCRYPTPROV_FUNC is
NULL, then the default provider is used. This function is only
supported for asymmetric keys.


%index
CryptImportPublicKeyInfo
Converts and imports the public key information into the provider and returns a handle of the public key.
%group
Win32 crypt32
%prm
hCryptProv, dwCertEncodingType, pInfo, phKey
hCryptProv : [int] The handle of the cryptographic service provider (CSP) to use when importing the public key. This handle must have already been created using CryptAcquireContext.
dwCertEncodingType : [int] Specifies the encoding type used. It is always acceptable to specify both the certificate and message encoding types by combining them with a bitwise-OR operation as shown in the following example: X509_ASN_ENCODING | PKCS_7_ASN_ENCODING Currently defined encoding types are:
pInfo : [var] The address of a CERT_PUBLIC_KEY_INFO structure that contains the public key to import into the provider.
phKey : [var] The address of an HCRYPTKEY variable that receives the handle of the imported public key. When you have finished using the public key, release the handle by calling the CryptDestroyKey function.
%inst
Converts and imports the public key information into the provider and
returns a handle of the public key.

[戻り値]
If the function succeeds, the return value is nonzero (TRUE). If the
function fails, the return value is zero (FALSE). For extended error
information, call GetLastError. Note Errors from the called functions
CryptGetUserKey and CryptExportKey might be propagated to this
function. This function has the following error code.
This doc was truncated.

[備考]
This function is normally used to retrieve the public key from a
certificate. This is done by passing the CERT_PUBLIC_KEY_INFO
structure from a filled-in certificate structure as shown in the
following pseudocode.
This doc was truncated.


%index
CryptImportPublicKeyInfoEx
Important??This API is deprecated. (CryptImportPublicKeyInfoEx)
%group
Win32 crypt32
%prm
hCryptProv, dwCertEncodingType, pInfo, aiKeyAlg, dwFlags, pvAuxInfo, phKey
hCryptProv : [int] The handle of the CSP to receive the imported public key. This handle must have already been created using CryptAcquireContext.
dwCertEncodingType : [int] Specifies the encoding type used. It is always acceptable to specify both the certificate and message encoding types by combining them with a bitwise-OR operation as shown in the following example: X509_ASN_ENCODING | PKCS_7_ASN_ENCODING Currently defined encoding types are:
pInfo : [var] the address of a CERT_PUBLIC_KEY_INFO structure that contains the public key to import into the provider. Note??The pzObjId member of the Algorithm member pointed to by the pInfo  and dwCertEncodingType parameters determine an installable CRYPT_OID_IMPORT_PUBLIC_KEY_INFO_FUNC callback function. If an installable function is not found, an attempt is made to import the key as an RSA Public Key (szOID_RSA_RSA).
aiKeyAlg : [int] An ALG_ID structure that contains a CSP-specific algorithm to override the CALG_RSA_KEYX default algorithm.
dwFlags : [int] Reserved for future use and must be zero.
pvAuxInfo : [intptr] Reserved for future use and must be NULL.
phKey : [var] The address of an HCRYPTKEY variable that receives the handle of the imported public key. When you have finished using the public key, release the handle by calling the CryptDestroyKey function.
%inst
Important This API is deprecated. (CryptImportPublicKeyInfoEx)

[戻り値]
If the function succeeds, the function returns nonzero (TRUE). If the
function fails, it returns zero (FALSE). For extended error
information, call GetLastError. Note Errors from the called functions
CryptGetUserKey and CryptExportKey might be propagated to this
function. This function has the following error code.
This doc was truncated.

[備考]
This function is normally used to retrieve the public key from a
certificate. This is done by passing the CERT_PUBLIC_KEY_INFO
structure from a filled-in certificate structure as shown in the
following pseudocode.
This doc was truncated.


%index
CryptImportPublicKeyInfoEx2
Imports a public key into the CNG asymmetric provider that corresponds to the public key object identifier (OID) and returns a CNG handle to the key.
%group
Win32 crypt32
%prm
dwCertEncodingType, pInfo, dwFlags, pvAuxInfo, phKey
dwCertEncodingType : [int] The certificate encoding type that was used to encrypt the subject. The message encoding type identifier, contained in the high WORD of this value, is ignored by this function.
pInfo : [var] The address of a CERT_PUBLIC_KEY_INFO structure that contains the public key information to import into the provider.
dwFlags : [int] 
pvAuxInfo : [intptr] This parameter is reserved for future use and must be set to NULL.
phKey : [var] The address of a BCRYPT_KEY_HANDLE variable that receives the handle of the imported key. When this handle is no longer needed, you must release it by calling the BCryptDestroyKey function.
%inst
Imports a public key into the CNG asymmetric provider that
corresponds to the public key object identifier (OID) and returns a
CNG handle to the key.

[戻り値]
If the function succeeds, the function returns nonzero (TRUE). If the
function fails, it returns zero (FALSE). For extended error
information, call GetLastError. Possible error codes include, but are
not limited to, the following.
This doc was truncated.


%index
CryptInitOIDFunctionSet
The CryptInitOIDFunctionSet initializes and returns the handle of the OID function set identified by a supplied function set name.
%group
Win32 crypt32
%prm
pszFuncName, dwFlags
pszFuncName : [str] Name of the OID function set.
dwFlags : [int] Reserved for future use and must be zero.
%inst
The CryptInitOIDFunctionSet initializes and returns the handle of the
OID function set identified by a supplied function set name.

[戻り値]
Returns the handle of the OID function set identified by pszFuncName,
or NULL if the function fails.


%index
CryptInstallDefaultContext
Installs a specific provider to be the default context provider for the specified algorithm.
%group
Win32 crypt32
%prm
hCryptProv, dwDefaultType, pvDefaultPara, dwFlags, pvReserved, phDefaultContext
hCryptProv : [int] The handle of the cryptographic service provider to be used as the default context. This handle is obtained by using the CryptAcquireContext function.
dwDefaultType : [int] 
pvDefaultPara : [intptr] Specifies the object or objects to install the default context provider for. The format of this parameter depends on the contents of the dwDefaultType parameter.
dwFlags : [int] 
pvReserved : [intptr] This parameter is reserved for future use.
phDefaultContext : [var] The address of an HCRYPTDEFAULTCONTEXT variable that receives the default context handle. This handle is passed to the CryptUninstallDefaultContext function to uninstall the default context provider.
%inst
Installs a specific provider to be the default context provider for
the specified algorithm.

[戻り値]
If the function succeeds, the return value is nonzero (TRUE). If the
function fails, the return value is zero (FALSE). For extended error
information, call GetLastError.

[備考]
The installed default context providers are stack ordered, thus when
searching for a default context provider, the system starts with the
most recently installed provider. The per-thread list of providers is
searched before the per-process list of providers. After a match is
found, the system does not continue to search for other matches. The
installed provider handle must remain available for use until
CryptUninstallDefaultContext is called, or the thread or process
exits.


%index
CryptInstallOIDFunctionAddress
The CryptInstallOIDFunctionAddress function installs a set of callable object identifier (OID) function addresses.
%group
Win32 crypt32
%prm
hModule, dwEncodingType, pszFuncName, cFuncEntry, rgFuncEntry, dwFlags
hModule : [intptr] This parameter is updated with the hModule parameter passed to DllMain to prevent the DLL that contains the function addresses from being unloaded by CryptGetOIDFunctionAddress or CryptFreeOIDFunctionAddress. This would be the case when the DLL has also registered OID functions through CryptRegisterOIDFunction.
dwEncodingType : [int] Specifies the encoding type to be matched. Currently, only X509_ASN_ENCODING and PKCS_7_ASN_ENCODING are being used; however, additional encoding types may be added in the future. To match both current encoding types, use: X509_ASN_ENCODING | PKCS_7_ASN_ENCODING
pszFuncName : [str] Name of the function set being installed.
cFuncEntry : [int] Number of array elements in rgFuncEntry[].
rgFuncEntry : [var] Array of CRYPT_OID_FUNC_ENTRY structures, each containing an OID and the starting address of its correlated routine.
dwFlags : [int] By default, a new function set is installed at the end of the list of function sets. Setting the CRYPT_INSTALL_OID_FUNC_BEFORE_FLAG flag installs the function set at the beginning of the list.
%inst
The CryptInstallOIDFunctionAddress function installs a set of
callable object identifier (OID) function addresses.

[戻り値]
If the function succeeds, the function returns nonzero (TRUE). If the
function fails, it returns zero (FALSE).


%index
CryptMemAlloc
The CryptMemAlloc function allocates memory for a buffer. It is used by all Crypt32.lib functions that return allocated buffers.
%group
Win32 crypt32
%prm
cbSize
cbSize : [int] Number of bytes to be allocated.
%inst
The CryptMemAlloc function allocates memory for a buffer. It is used
by all Crypt32.lib functions that return allocated buffers.

[戻り値]
Returns a pointer to the buffer allocated. If the function fails,
NULL is returned. When you have finished using the buffer, free the
memory by calling the CryptMemFree function.


%index
CryptMemFree
The CryptMemFree function frees memory allocated by CryptMemAlloc or CryptMemRealloc.
%group
Win32 crypt32
%prm
pv
pv : [intptr] A pointer to the buffer to be freed.
%inst
The CryptMemFree function frees memory allocated by CryptMemAlloc or
CryptMemRealloc.


%index
CryptMemRealloc
The CryptMemRealloc function frees the memory currently allocated for a buffer and allocates memory for a new buffer.
%group
Win32 crypt32
%prm
pv, cbSize
pv : [intptr] A pointer to a currently allocated buffer.
cbSize : [int] Number of bytes to be allocated.
%inst
The CryptMemRealloc function frees the memory currently allocated for
a buffer and allocates memory for a new buffer.

[戻り値]
Returns a pointer to the buffer allocated. If the function fails,
NULL is returned. When you have finished using the buffer, free the
memory by calling the CryptMemFree function.


%index
CryptMsgCalculateEncodedLength
Calculates the maximum number of bytes needed for an encoded cryptographic message given the message type, encoding parameters, and total length of the data to be encoded.
%group
Win32 crypt32
%prm
dwMsgEncodingType, dwFlags, dwMsgType, pvMsgEncodeInfo, pszInnerContentObjID, cbData
dwMsgEncodingType : [int] Specifies the encoding type used. It is always acceptable to specify both the certificate and message encoding types by combining them with a bitwise-OR operation as shown in the following example: X509_ASN_ENCODING | PKCS_7_ASN_ENCODING Currently defined encoding types are:
dwFlags : [int] Currently defined flags are shown in the following table.
dwMsgType : [int] Currently defined message types are shown in the following table.
pvMsgEncodeInfo : [intptr] A pointer to the data to be encoded. The type of data pointed to depends on the value of dwMsgType. For details, see the dwMsgType table.
pszInnerContentObjID : [str] When calling CryptMsgCalculateEncodedLength with data provided to CryptMsgUpdate already encoded, the appropriate object identifier is passed in pszInnerContentObjID. If pszInnerContentObjID is NULL, the inner content type is assumed not to have been previously encoded, and is encoded as an octet string and given the type CMSG_DATA.
cbData : [int] The size, in bytes, of the content.
%inst
Calculates the maximum number of bytes needed for an encoded
cryptographic message given the message type, encoding parameters,
and total length of the data to be encoded.

[戻り値]
Returns the required length for an encoded cryptographic message.
This length might not be the exact length but it will not be less
than the required length. Zero is returned if the function fails. To
retrieve extended error information, use the GetLastError function.
The following table lists the error codes most commonly returned.
This doc was truncated.


%index
CryptMsgClose
The CryptMsgClose function closes a cryptographic message handle. At each call to this function, the reference count on the message is reduced by one. When the reference count reaches zero, the message is fully released.
%group
Win32 crypt32
%prm
hCryptMsg
hCryptMsg : [intptr] Handle of the cryptographic message to be closed.
%inst
The CryptMsgClose function closes a cryptographic message handle. At
each call to this function, the reference count on the message is
reduced by one. When the reference count reaches zero, the message is
fully released.

[戻り値]
If the function succeeds, the function returns nonzero (TRUE). If the
function fails, it returns zero (FALSE). For extended error
information, call GetLastError.


%index
CryptMsgControl
Performs a control operation after a message has been decoded by a final call to the CryptMsgUpdate function.
%group
Win32 crypt32
%prm
hCryptMsg, dwFlags, dwCtrlType, pvCtrlPara
hCryptMsg : [intptr] A handle of a cryptographic message for which a control is to be applied.
dwFlags : [int] The following value is defined when the dwCtrlType parameter is one of the following:
dwCtrlType : [int] The type of operation to be performed. Currently defined message control types and the type of structure that should be passed to the pvCtrlPara parameter are shown in the following table.
pvCtrlPara : [intptr] A pointer to a structure determined by the value of dwCtrlType.
%inst
Performs a control operation after a message has been decoded by a
final call to the CryptMsgUpdate function.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero and the GetLastError
function returns an Abstract Syntax Notation One (ASN.1)
encoding/decoding error. For information about these errors, see
ASN.1 Encoding/Decoding Return Values. When a streamed, enveloped
message is being decoded, errors encountered in the
application-defined callback function specified by the pStreamInfo
parameter of the CryptMsgOpenToDecode function might be propagated to
the CryptMsgControl function. If this happens, the SetLastError
function is not called by the CryptMsgControl function after the
callback function returns. This preserves any errors encountered
under the control of the application. It is the responsibility of the
callback function (or one of the APIs that it calls) to call the
SetLastError function if an error occurs while the application is
processing the streamed data.
This doc was truncated.


%index
CryptMsgCountersign
Countersigns an existing signature in a message.
%group
Win32 crypt32
%prm
hCryptMsg, dwIndex, cCountersigners, rgCountersigners
hCryptMsg : [intptr] Cryptographic message handle to be used.
dwIndex : [int] Zero-based index of the signer in the signed or signed-and-enveloped message to be countersigned.
cCountersigners : [int] Number of countersigners in the rgCountersigners array.
rgCountersigners : [var] Array of countersigners' CMSG_SIGNER_ENCODE_INFO structures.
%inst
Countersigns an existing signature in a message.

[戻り値]
If the function succeeds, the function returns nonzero (TRUE). If the
function fails, it returns zero (FALSE). For extended error
information, call GetLastError. An error can be propagated from
CryptMsgCountersignEncoded. The following error codes are returned
most often.
This doc was truncated.


%index
CryptMsgCountersignEncoded
Countersigns an existing PKCS
%group
Win32 crypt32
%prm
dwEncodingType, pbSignerInfo, cbSignerInfo, cCountersigners, rgCountersigners, pbCountersignature, pcbCountersignature
dwEncodingType : [int] Specifies the encoding type used. Currently, only X509_ASN_ENCODING and PKCS_7_ASN_ENCODING are being used; however, additional encoding types may be added in the future. For either current encoding type, use:
pbSignerInfo : [var] A pointer to the encoded SignerInfo that is to be countersigned.
cbSignerInfo : [int] Count, in bytes, of the encoded SignerInfo data.
cCountersigners : [int] Number of countersigners in the rgCountersigners array.
rgCountersigners : [var] Array of countersigners' CMSG_SIGNER_ENCODE_INFO structures.
pbCountersignature : [var] A pointer to a buffer to receive an encoded PKCS #9 countersignature attribute. On input, this parameter can be NULL to set the size of this information for memory allocation purposes. For more information, see Retrieving Data of Unknown Length.
pcbCountersignature : [var] A pointer to a variable that specifies the size, in bytes, of the buffer pointed to by the pbCountersignature parameter. When the function returns, the variable pointed to by the pcbCountersignature parameter contains the number of bytes stored in the buffer.
%inst
Countersigns an existing PKCS

[戻り値]
If the function succeeds, the return value is nonzero (TRUE). If the
function fails, the return value is zero (FALSE). For extended error
information, call GetLastError. The following table lists the error
codes most commonly returned by the GetLastError function.
This doc was truncated.


%index
CryptMsgDuplicate
The CryptMsgDuplicate function duplicates a cryptographic message handle by incrementing its reference count.
%group
Win32 crypt32
%prm
hCryptMsg
hCryptMsg : [intptr] Handle of the cryptographic message to be duplicated. Duplication is done by incrementing the reference count of the message. A copy of the message is not made.
%inst
The CryptMsgDuplicate function duplicates a cryptographic message
handle by incrementing its reference count.

[戻り値]
The returned handle is the same as the handle input. A copy of the
message is not created. When you have finished using the duplicated
message handle, decrease the reference count by calling the
CryptMsgClose function.

[備考]
CryptMsgDuplicate is used to increase the reference count on an
HCRYPTMSG handle so that multiple calls to CryptMsgClose are required
to actually release the handle.


%index
CryptMsgEncodeAndSignCTL
The CryptMsgEncodeAndSignCTL function encodes a CTL and creates a signed message containing the encoded CTL.This function first encodes the CTL pointed to by pCtlInfo and then calls CryptMsgSignCTL to sign the encoded message.
%group
Win32 crypt32
%prm
dwMsgEncodingType, pCtlInfo, pSignInfo, dwFlags, pbEncoded, pcbEncoded
dwMsgEncodingType : [int] Specifies the encoding type used. It is always acceptable to specify both the certificate and message encoding types by combining them with a bitwise-OR operation as shown in the following example: X509_ASN_ENCODING | PKCS_7_ASN_ENCODING Currently defined encoding types are:
pCtlInfo : [var] A pointer to the CTL_INFO structure containing the CTL to be encoded and signed.
pSignInfo : [var] A pointer to a CMSG_SIGNED_ENCODE_INFO structure that contains an array of a CMSG_SIGNER_ENCODE_INFO structures. The message can be encoded without signers if the cbSize member of the structure is set to the size of the structure and all of the other members are set to zero.
dwFlags : [int] CMSG_ENCODE_SORTED_CTL_FLAG is set if the CTL entries are to be sorted before encoding. This flag is set if the CertFindSubjectInSortedCTL or CertEnumSubjectInSortedCTL functions will be called. CMSG_ENCODE_HASHED_SUBJECT_IDENTIFIER_FLAG is set if CMSG_ENCODE_SORTED_CTL_FLAG is set, and the identifier for the TrustedSubjects is a hash, such as MD5 or SHA1. If CMS_PKCS7 is defined, dwFlags can be set to CMSG_CMS_ENCAPSULATED_CTL_FLAG to encode a CMS compatible V3 SignedData message.
pbEncoded : [var] A pointer to a buffer that receives the encoded, signed message created. This parameter can be NULL to set the size of this information for memory allocation purposes. For more information, see Retrieving Data of Unknown Length.
pcbEncoded : [var] A pointer to a DWORD that specifies the size, in bytes, of the pbEncoded buffer. When the function returns, the DWORD contains the number of bytes stored or to be stored in the buffer.
%inst
The CryptMsgEncodeAndSignCTL function encodes a CTL and creates a
signed message containing the encoded CTL.This function first encodes
the CTL pointed to by pCtlInfo and then calls CryptMsgSignCTL to sign
the encoded message.

[戻り値]
If the function succeeds, the return value is nonzero (TRUE). If the
function fails, the return value is zero (FALSE). To get extended
error information, call GetLastError. Errors can be propagated from
calls to CryptMsgOpenToEncode and CryptMsgUpdate.


%index
CryptMsgGetAndVerifySigner
The CryptMsgGetAndVerifySigner function verifies a cryptographic message's signature.
%group
Win32 crypt32
%prm
hCryptMsg, cSignerStore, rghSignerStore, dwFlags, ppSigner, pdwSignerIndex
hCryptMsg : [intptr] Handle of a cryptographic message.
cSignerStore : [int] Number of stores in the rghSignerStore array.
rghSignerStore : [var] Array of certificate store handles that can be searched for a signer's certificate.
dwFlags : [int] Indicates particular use of the function.
ppSigner : [var] If the signature is verified, ppSigner is updated to point to the signer's certificate context. When you have finished using the certificate, free the context by calling the CertFreeCertificateContext function. This parameter can be NULL if the application has no need for the signer's certificate.
pdwSignerIndex : [var] If the signature is verified, pdwSigner is updated to point to the index of the signer in the array of signers. This parameter can be NULL if the application has no need for the index of the signer.
%inst
The CryptMsgGetAndVerifySigner function verifies a cryptographic
message's signature.

[戻り値]
If the function succeeds, the return value is nonzero (TRUE). If the
function fails, the return value is zero (FALSE). For extended error
information, call GetLastError.


%index
CryptMsgGetParam
Acquires a message parameter after a cryptographic message has been encoded or decoded.
%group
Win32 crypt32
%prm
hCryptMsg, dwParamType, dwIndex, pvData, pcbData
hCryptMsg : [intptr] Handle of a cryptographic message.
dwParamType : [int] Indicates the parameter types of data to be retrieved. The type of data to be retrieved determines the type of structure to use for pvData.
dwIndex : [int] Index for the parameter being retrieved, where applicable. When a parameter is not being retrieved, this parameter is ignored and is set to zero.
pvData : [intptr] A pointer to a buffer that receives the data retrieved. The form of this data will vary depending on the value of the dwParamType parameter.
pcbData : [var] A pointer to a variable that specifies the size, in bytes, of the buffer pointed to by the pvData parameter. When the function returns, the variable pointed to by the pcbData parameter contains the number of bytes stored in the buffer.
%inst
Acquires a message parameter after a cryptographic message has been
encoded or decoded.

[戻り値]
If the function succeeds, the return value is nonzero (TRUE). If the
function fails, the return value is zero (FALSE). For extended error
information, call GetLastError. The following table lists the error
codes most commonly returned by the GetLastError function.
This doc was truncated.

[備考]
The following version numbers are returned by calls to
CryptMsgGetParam with dwParamType set to CMSG_VERSION_PARAM are
defined:
This doc was truncated.


%index
CryptMsgOpenToDecode
Opens a cryptographic message for decoding and returns a handle of the opened message.
%group
Win32 crypt32
%prm
dwMsgEncodingType, dwFlags, dwMsgType, hCryptProv, pRecipientInfo, pStreamInfo
dwMsgEncodingType : [int] Specifies the encoding type used. It is always acceptable to specify both the certificate and message encoding types by combining them with a bitwise-OR operation as shown in the following example: X509_ASN_ENCODING | PKCS_7_ASN_ENCODING
dwFlags : [int] This parameter can be one of the following flags.
dwMsgType : [int] Specifies the type of message to decode. In most cases, the message type is determined from the message header and zero is passed for this parameter. In some cases, notably with Internet Explorer 3.0, messages do not have headers and the type of message to be decoded must be supplied in this function call. If the header is missing and zero is passed for this parameter, the function fails.
hCryptProv : [int] This parameter is not used and should be set to NULL. Windows Server?2003 and Windows?XP:??Specifies a handle for the cryptographic provider to use for hashing the message. For signed messages, hCryptProv is used for signature verification.This parameter's data type is HCRYPTPROV. Unless there is a strong reason for passing in a specific cryptographic provider in hCryptProv, set this parameter to NULL. Passing in NULL causes the default RSA or DSS provider to be acquired before performing hash, signature verification, or recipient encryption operations.
pRecipientInfo : [var] This parameter is reserved for future use and must be NULL.
pStreamInfo : [var] When streaming is not being used, this parameter must be set to NULL.
%inst
Opens a cryptographic message for decoding and returns a handle of
the opened message.

[戻り値]
If the function succeeds, the function returns the handle of the
opened message. If the function fails, it returns NULL. For extended
error information, call GetLastError. The following table lists the
error codes most commonly returned by the GetLastError function.
This doc was truncated.


%index
CryptMsgOpenToEncode
Opens a cryptographic message for encoding and returns a handle of the opened message.
%group
Win32 crypt32
%prm
dwMsgEncodingType, dwFlags, dwMsgType, pvMsgEncodeInfo, pszInnerContentObjID, pStreamInfo
dwMsgEncodingType : [int] Specifies the encoding type used. It is always acceptable to specify both the certificate and message encoding types by combining them with a bitwise-OR operation as shown in the following example: X509_ASN_ENCODING | PKCS_7_ASN_ENCODING Currently defined encoding types are:
dwFlags : [int] Currently defined dwFlags are shown in the following table.
dwMsgType : [int] 
pvMsgEncodeInfo : [intptr] The address of a structure that contains the encoding information. The type of data depends on the value of the dwMsgType parameter. For details, see dwMsgType.
pszInnerContentObjID : [str] If CryptMsgCalculateEncodedLength is called and the data for CryptMsgUpdate has already been message encoded, the appropriate object identifier (OID) is passed in pszInnerContentObjID. If pszInnerContentObjID is NULL, then the inner content type is assumed not to have been previously encoded and is therefore encoded as an octet string and given the type CMSG_DATA. Note??When streaming is being used, pszInnerContentObjID must be either NULL or szOID_RSA_data. ? The following algorithm OIDs are commonly used. A user can define new inner content usage by ensuring that the sender and receiver of the message agree upon the semantics associated with the OID.
pStreamInfo : [var] When streaming is being used, this parameter is the address of a CMSG_STREAM_INFO structure. The callback function specified by the pfnStreamOutput member of the CMSG_STREAM_INFO structure is called when CryptMsgUpdate is executed. The callback is passed the encoded bytes that result from the encoding. For more information about how to use the callback, see CMSG_STREAM_INFO. Note??When streaming is being used, the application must not release any data handles that are passed in the pvMsgEncodeInfo parameter, such as the provider handle in the hCryptProv member of the CMSG_SIGNER_ENCODE_INFO structure, until after the message handle returned by this function is closed by using the CryptMsgClose function. ? When streaming is not being used, this parameter is set to NULL. Streaming is not used with the CMSG_HASHED message type. When dealing with hashed data, this parameter must be set to NULL. Consider the case of a signed message being enclosed in an enveloped message. The encoded output from the streamed encoding of the signed message feeds into another streaming encoding of the enveloped message. The callback for the streaming encoding calls CryptMsgUpdate to encode the enveloped message. The callback for the enveloped message receives the encoded bytes of the nested signed message.
%inst
Opens a cryptographic message for encoding and returns a handle of
the opened message.

[戻り値]
If the function succeeds, it returns a handle to the opened message.
This handle must be closed when it is no longer needed by passing it
to the CryptMsgClose function. If this function fails, NULL is
returned. To retrieve extended error information, use the
GetLastError function. The following table lists the error codes most
commonly returned by the GetLastError function.
This doc was truncated.

[備考]
For functions that perform encryption, the encrypted symmetric keys
are reversed from little-endian format to big-endian format after
CryptExportKey is called internally. For functions that perform
decryption, the encrypted symmetric keys are reversed from big-endian
format to little-endian format before CryptImportKey is called.
CRYPT_NO_SALT is specified when symmetric keys are generated and
imported with CryptGenKey and CryptImportKey. Messages encrypted with
the RC2 encryption algorithm use KP_EFFECTIVE_KEYLEN with
CryptGetKeyParam to determine the effective key length of the RC2 key
importing or exporting keys.
For messages encrypted with the RC2 encryption algorithm, encode and
decode operations have been updated to handle ASN RC2 parameters for
the ContentEncryptionAlgorithm member of the
CMSG_ENVELOPED_ENCODE_INFO structure.
For messages encrypted with the RC4, DES, and 3DES encryption
algorithms, encode and decode operations now handle the ASN IV octet
string parameter for the ContentEncryptionAlgorithm member of the
CMSG_ENVELOPED_ENCODE_INFO structure.


%index
CryptMsgSignCTL
The CryptMsgSignCTL function creates a signed message containing an encoded CTL.
%group
Win32 crypt32
%prm
dwMsgEncodingType, pbCtlContent, cbCtlContent, pSignInfo, dwFlags, pbEncoded, pcbEncoded
dwMsgEncodingType : [int] Specifies the encoding type used. It is always acceptable to specify both the certificate and message encoding types by combining them with a bitwise-OR operation as shown in the following example: X509_ASN_ENCODING | PKCS_7_ASN_ENCODING Currently defined encoding types are:
pbCtlContent : [var] The encoded CTL_INFO that can be a member of a CTL_CONTEXT structure or can be created using the CryptEncodeObject function.
cbCtlContent : [int] The size, in bytes, of the content pointed to by pbCtlContent.
pSignInfo : [var] A pointer to a CMSG_SIGNED_ENCODE_INFO structure containing an array of a CMSG_SIGNER_ENCODE_INFO structures. The message can be encoded without signers if the cbSize member of the structure is set to the size of the structure and all of the other members are set to zero.
dwFlags : [int] If CMS_PKCS7 is defined, can be set to CMSG_CMS_ENCAPSULATED_CTL_FLAG to encode a CMS compatible V3 SignedData message.
pbEncoded : [var] A pointer to a buffer to receives the encoded message. This parameter can be NULL to get the size of this information for memory allocation purposes. For more information, see Retrieving Data of Unknown Length.
pcbEncoded : [var] A pointer to a DWORD specifying the size, in bytes, of the pbEncoded buffer. When the function returns, the DWORD contains the number of bytes stored or to be stored in the buffer.
%inst
The CryptMsgSignCTL function creates a signed message containing an
encoded CTL.

[戻り値]
If the function succeeds, the return value is nonzero (TRUE). If the
function fails, the return value is zero (FALSE). For extended error
information, call GetLastError. This function can return errors
propagated from calls to CryptMsgOpenToEncode and CryptMsgUpdate.


%index
CryptMsgUpdate
Adds contents to a cryptographic message.
%group
Win32 crypt32
%prm
hCryptMsg, pbData, cbData, fFinal
hCryptMsg : [intptr] Cryptographic message handle of the message to be updated.
pbData : [var] A pointer to the buffer holding the data to be encoded or decoded.
cbData : [int] Number of bytes of data in the pbData buffer.
fFinal : [int] Indicates that the last block of data for encoding or decoding is being processed. Correct usage of this flag is dependent upon whether the message being processed has detached data. The inclusion of detached data in a message is indicated by setting dwFlags to CMSG_DETACHED_FLAG in the call to the function that opened the message.
%inst
Adds contents to a cryptographic message.

[戻り値]
If the function succeeds, the return value is nonzero (TRUE). If the
function fails, the return value is zero (FALSE). For extended error
information, call GetLastError. Errors encountered in the application
defined callback function specified by pStreamInfo in
CryptMsgOpenToDecode and CryptMsgOpenToEncode might be propagated to
CryptMsgUpdate if streaming is used. If this happens, SetLastError is
not called by CryptMsgUpdate after the callback function returns,
which preserves any errors encountered under the control of the
application. It is the responsibility of the callback function (or
one of the APIs that it calls) to call SetLastError if an error
occurs while the application is processing the streamed data. The
following table lists the error codes most commonly returned by the
GetLastError function.
This doc was truncated.


%index
CryptMsgVerifyCountersignatureEncoded
Verifies a countersignature in terms of the SignerInfo structure (as defined by PKCS
%group
Win32 crypt32
%prm
hCryptProv, dwEncodingType, pbSignerInfo, cbSignerInfo, pbSignerInfoCountersignature, cbSignerInfoCountersignature, pciCountersigner
hCryptProv : [int] This parameter is not used and should be set to NULL. Windows Server?2003 and Windows?XP:??NULL or the handle of the cryptographic provider to use to hash the encryptedDigest field of pbSignerInfo.This parameter's data type is HCRYPTPROV. Unless there is a strong reason for passing in a specific cryptographic provider in hCryptProv, pass NULL to cause the default RSA or DSS provider to be used.
dwEncodingType : [int] Specifies the encoding type used. Currently, only X509_ASN_ENCODING and PKCS_7_ASN_ENCODING are being used; however, additional encoding types may be added in the future. For either current encoding type, use:
pbSignerInfo : [var] A pointer to the encoded BLOB that contains the signer of the contents of a message to be countersigned.
cbSignerInfo : [int] Count, in bytes, of the encoded BLOB for the signer of the contents.
pbSignerInfoCountersignature : [var] A pointer to the encoded BLOB containing the countersigner information.
cbSignerInfoCountersignature : [int] Count, in bytes, of the encoded BLOB for the countersigner of the message.
pciCountersigner : [var] A pointer to a CERT_INFO that includes with the issuer and serial number of the countersigner. For more information, see Remarks.
%inst
Verifies a countersignature in terms of the SignerInfo structure (as
defined by PKCS

[戻り値]
If the function succeeds, the return value is nonzero (TRUE). If the
function fails, the return value is zero (FALSE). For extended error
information, call GetLastError. The following table lists the error
codes most commonly returned by the GetLastError function.
This doc was truncated.

[備考]
Countersigner verification is done using the PKCS #7 SIGNERINFO
structure. The signature must contain the encrypted hash of the
encryptedDigest field of pbSignerInfo. The issuer and serial number
of the countersigner must match the countersigner information from
pbSignerInfoCountersignature. The only fields referenced from
pciCountersigner are SerialNumber, Issuer, and SubjectPublicKeyInfo.
The SubjectPublicKeyInfo is used to access the public key that is
then used to encrypt the hash from the pciCountersigner so compare it
with the hash from the pbSignerInfo.


%index
CryptMsgVerifyCountersignatureEncodedEx
Verifies that the pbSignerInfoCounterSignature parameter contains the encrypted hash of the encryptedDigest field of the pbSignerInfo parameter structure.
%group
Win32 crypt32
%prm
hCryptProv, dwEncodingType, pbSignerInfo, cbSignerInfo, pbSignerInfoCountersignature, cbSignerInfoCountersignature, dwSignerType, pvSigner, dwFlags, pvExtra
hCryptProv : [int] This parameter is not used and should be set to NULL. Windows Server?2003 and Windows?XP:??NULL or the handle of the cryptographic provider to use to hash the encryptedDigest field of pbSignerInfo.This parameter's data type is HCRYPTPROV. Unless there is a strong reason for passing in a specific cryptographic provider in hCryptProv, pass NULL to cause the default RSA or DSS provider to be used.
dwEncodingType : [int] The encoding type used. Currently, only X509_ASN_ENCODING and PKCS_7_ASN_ENCODING are being used; however, additional encoding types may be added in the future. For either current encoding type, use:
pbSignerInfo : [var] A pointer to the encoded BLOB that contains the signer of the contents of a message to be countersigned.
cbSignerInfo : [int] The count, in bytes, of the encoded BLOB for the signer of the contents.
pbSignerInfoCountersignature : [var] A pointer to the encoded BLOB containing the countersigner information.
cbSignerInfoCountersignature : [int] The count, in bytes, of the encoded BLOB for the countersigner of the message.
dwSignerType : [int] The structure that contains the signer information. The following table shows the predefined values and the structures indicated.
pvSigner : [intptr] A pointer to a CERT_PUBLIC_KEY_INFO structure, a certificate context, or a chain context depending on the value of dwSignerType.
dwFlags : [int] Flags that modify the function behavior. This can be zero or the following value.
pvExtra : [intptr] If you set the dwFlags parameter to CMSG_VERIFY_COUNTER_SIGN_ENABLE_STRONG_FLAG, set this parameter (pvExtra) to point to a CERT_STRONG_SIGN_PARA structure that contains the parameters used to check the signature strength.
%inst
Verifies that the pbSignerInfoCounterSignature parameter contains the
encrypted hash of the encryptedDigest field of the pbSignerInfo
parameter structure.

[戻り値]
If the function succeeds, the return value is nonzero (TRUE). If the
function fails, the return value is zero (FALSE). For extended error
information, call GetLastError. The following error codes are most
commonly returned by the GetLastError function.
This doc was truncated.

[備考]
Countersigner verification is done using the PKCS #7 SIGNERINFO
structure. The signature must contain the encrypted hash of the
encryptedDigest field of pbSignerInfo. The issuer and serial number
of the countersigner must match the countersigner information from
pbSignerInfoCountersignature. The only fields referenced from
pciCountersigner are SerialNumber, Issuer, and SubjectPublicKeyInfo.
The SubjectPublicKeyInfo is used to access the public key that is
then used to encrypt the hash from the pciCountersigner so compare it
with the hash from the pbSignerInfo.


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
CryptQueryObject
Retrieves information about the contents of a cryptography API object, such as a certificate, a certificate revocation list, or a certificate trust list.
%group
Win32 crypt32
%prm
dwObjectType, pvObject, dwExpectedContentTypeFlags, dwExpectedFormatTypeFlags, dwFlags, pdwMsgAndCertEncodingType, pdwContentType, pdwFormatType, phCertStore, phMsg, ppvContext
dwObjectType : [int] 
pvObject : [intptr] A pointer to the object to be queried. The type of data pointer depends on the contents of the dwObjectType parameter.
dwExpectedContentTypeFlags : [int] 
dwExpectedFormatTypeFlags : [int] 
dwFlags : [int] This parameter is reserved for future use and must be set to zero.
pdwMsgAndCertEncodingType : [var] A pointer to a DWORD value that receives the type of encoding used in the message. If this information is not needed, set this parameter to NULL.
pdwContentType : [var] 
pdwFormatType : [var] 
phCertStore : [var] A pointer to an HCERTSTORE value that receives a handle to a certificate store that includes all of the certificates, CRLs, and CTLs in the object.
phMsg : [var] A pointer to an HCRYPTMSG value that receives the handle of an opened message.
ppvContext : [var] A pointer to a pointer that receives additional information about the object.
%inst
Retrieves information about the contents of a cryptography API
object, such as a certificate, a certificate revocation list, or a
certificate trust list.

[戻り値]
If the function succeeds, the function returns nonzero. If the
function fails, it returns zero. For extended error information, call
GetLastError.


%index
CryptRegisterDefaultOIDFunction
The CryptRegisterDefaultOIDFunction registers a DLL containing the default function to be called for the specified encoding type and function name. Unlike CryptRegisterOIDFunction, the function name to be exported by the DLL cannot be overridden.
%group
Win32 crypt32
%prm
dwEncodingType, pszFuncName, dwIndex, pwszDll
dwEncodingType : [int] Specifies the encoding type to be matched. Currently, only X509_ASN_ENCODING and PKCS_7_ASN_ENCODING are being used; however, additional encoding types may be added in the future. To match both current encoding types, use:
pszFuncName : [str] Name of the function being registered.
dwIndex : [int] Index location for the insertion of the DLL in the list of DLLs. If dwIndex is zero, the DLL is inserted at the beginning of the list. If it is CRYPT_REGISTER_LAST_INDEX, the DLL is appended at the end of the list.
pwszDll : [wstr] Optional environment-variable string to be expanded using ExpandEnvironmentStrings function before loading the DLL.
%inst
The CryptRegisterDefaultOIDFunction registers a DLL containing the
default function to be called for the specified encoding type and
function name. Unlike CryptRegisterOIDFunction, the function name to
be exported by the DLL cannot be overridden.

[戻り値]
If the function succeeds, the return value is nonzero (TRUE). If the
function fails, the return value is zero (FALSE).


%index
CryptRegisterOIDFunction
Registers a DLL that contains the function to be called for the specified encoding type, function name, and object identifier (OID).
%group
Win32 crypt32
%prm
dwEncodingType, pszFuncName, pszOID, pwszDll, pszOverrideFuncName
dwEncodingType : [int] Specifies the encoding type to be matched. Currently, only X509_ASN_ENCODING and PKCS_7_ASN_ENCODING are being used; however, additional encoding types may be added in the future. To match both current encoding types, use:
pszFuncName : [str] Name of the function being registered.
pszOID : [str] OID of the function to be registered. If the high-order word of the OID is nonzero, pszOID is a pointer to either an OID string such as "2.5.29.1" or an ASCII string such as "file." If the high-order word of the OID is zero, the low-order word specifies the numeric identifier to be used as the object identifier.
pwszDll : [wstr] Name of the DLL file to be registered. It can contain environment-variable strings to be expanded by using the ExpandEnvironmentStrings function before loading the DLL.
pszOverrideFuncName : [str] String that specifies a name for the function exported in the DLL. If pszOverrideFuncName is NULL, the function name specified by pszFuncName is used.
%inst
Registers a DLL that contains the function to be called for the
specified encoding type, function name, and object identifier (OID).

[戻り値]
If the function succeeds, the return value is nonzero (TRUE). If the
function fails, the return value is zero (FALSE).

[備考]
When you have finished using an OID function, unregister it by
calling the CryptUnregisterOIDFunction function.


%index
CryptRegisterOIDInfo
The CryptRegisterOIDInfo function registers the OID information specified in the CRYPT_OID_INFO structure, persisting it to the registry.
%group
Win32 crypt32
%prm
pInfo, dwFlags
pInfo : [var] A pointer to a CRYPT_OID_INFO structure with the OID information to register. Specify the group that the OID information is to be registered for by setting the dwGroupId member of the structure. Note??When registering OID information for Suite B algorithms implemented with Cryptography API: Next Generation (CNG), you must set the Algid member of the CRYPT_OID_INFO structure to CALG_OID_INFO_CNG_ONLY (0xFFFFFFFF).
dwFlags : [int] By default, the registered OID information is installed after Crypt32.dll's OID entries. If CRYPT_INSTALL_OID_INFO_BEFORE_FLAG is set, new OID information is install before Crypt32.dll's entries.
%inst
The CryptRegisterOIDInfo function registers the OID information
specified in the CRYPT_OID_INFO structure, persisting it to the
registry.

[戻り値]
If the function succeeds, the return value is nonzero (TRUE). If the
function fails, the return value is zero (FALSE).

[備考]
When you have finished using the OID information, unregister it by
calling the CryptUnregisterOIDInfo function.


%index
CryptRetrieveTimeStamp
Encodes a time stamp request and retrieves the time stamp token from a location specified by a URL to a Time Stamping Authority (TSA).
%group
Win32 crypt32
%prm
wszUrl, dwRetrievalFlags, dwTimeout, pszHashId, pPara, pbData, cbData, ppTsContext, ppTsSigner, phStore
wszUrl : [wstr] A pointer to a null-terminated wide character string that contains the URL of the TSA to which to send the request.
dwRetrievalFlags : [int] A set of flags that specify how the time stamp is retrieved.
dwTimeout : [int] A DWORD value that specifies the maximum number of milliseconds to wait for retrieval. If this parameter is set to zero, this function does not time out.
pszHashId : [str] A pointer to a null-terminated character string that contains the hash algorithm object identifier (OID).
pPara : [var] A pointer to a CRYPT_TIMESTAMP_PARA structure that contains additional parameters for the request.
pbData : [var] A pointer to an array of bytes to be time stamped.
cbData : [int] The size, in bytes, of the array pointed to by the pbData parameter.
ppTsContext : [var] A pointer to a PCRYPT_TIMESTAMP_CONTEXT structure. When you have finished using the context, you must free it by calling the CryptMemFree function.
ppTsSigner : [var] A pointer to a PCERT_CONTEXT that receives the certificate of the signer. When you have finished using this structure, you must free it by passing this pointer to the CertFreeCertificateContext function.
phStore : [var] The handle of a certificate store initialized with certificates from the time stamp response. This store can be used for validating the signer certificate of the time stamp response. This parameter can be NULL if the TSA supporting certificates are not needed. When you have finished using this handle,  release it by passing it to  the CertCloseStore function.
%inst
Encodes a time stamp request and retrieves the time stamp token from
a location specified by a URL to a Time Stamping Authority (TSA).

[戻り値]
If the function is unable to retrieve, decode, and validate the time
stamp context, it returns FALSE. For extended error information, call
the GetLastError function.


%index
CryptSIPAddProvider
The CryptSIPAddProvider function registers functions that are exported by a given DLL file that implements a Subject Interface Package (SIP).
%group
Win32 crypt32
%prm
psNewProv
psNewProv : [var] A pointer to a [SIP_ADD_NEWPROVIDER](/windows/desktop/api/mssip/ns-mssip-sip_add_newprovider) structure that specifies the DLL file and function names to register.
%inst
The CryptSIPAddProvider function registers functions that are
exported by a given DLL file that implements a Subject Interface
Package (SIP).

[戻り値]
The return value is TRUE if the function succeeds; FALSE if the
function fails. If the function fails, call the GetLastError function
to determine the reason for failure.

[備考]
Typically, you call this function as part of an in-process COM server
registration. The CryptSIPAddProvider function persists the
appropriate Registry entries for the SIP provider functions. When you
have finished using the added SIP provider, remove it by calling the
CryptSIPRemoveProvider function.


%index
CryptSIPLoad
Loads the dynamic-link library (DLL) that implements a subject interface package (SIP) and assigns appropriate library export functions to a SIP_DISPATCH_INFO structure.
%group
Win32 crypt32
%prm
pgSubject, dwFlags, pSipDispatch
pgSubject : [var] A pointer to a GUID returned by calling the CryptSIPRetrieveSubjectGuid function.
dwFlags : [int] This parameter is reserved and must be set to zero.
pSipDispatch : [var] A pointer to a [SIP_DISPATCH_INFO](/windows/desktop/api/mssip/ns-mssip-sip_dispatch_info) structure that contains pointers to SIP provider functions that are specific to the subject type. The caller must initialize this structure to binary zeros, and set the cbSize member to sizeof(SIP_DISPATCH_INFO) before calling the CryptSIPLoad function.
%inst
Loads the dynamic-link library (DLL) that implements a subject
interface package (SIP) and assigns appropriate library export
functions to a SIP_DISPATCH_INFO structure.

[戻り値]
If the function succeeds, the function returns TRUE. If the function
fails, it returns FALSE. For extended error information, call
GetLastError.


%index
CryptSIPRemoveProvider
Removes registry details of a Subject Interface Package (SIP) DLL file added by a previous call to the CryptSIPAddProvider function.
%group
Win32 crypt32
%prm
pgProv
pgProv : [var] A pointer to the GUID that identifies the SIP DLL  to remove.
%inst
Removes registry details of a Subject Interface Package (SIP) DLL
file added by a previous call to the CryptSIPAddProvider function.

[戻り値]
The return value is TRUE if the function succeeds; FALSE if the
function fails. If the function fails, call the GetLastError function
to determine the reason for failure.

[備考]
Typically you call this function to unregister an in-process COM
server. The CryptSIPRemoveProvider function removes the appropriate
Registry entries for the SIP provider functions.


%index
CryptSIPRetrieveSubjectGuid
Retrieves a GUID based on the header information in a specified file.
%group
Win32 crypt32
%prm
FileName, hFileIn, pgSubject
FileName : [wstr] The name of the file.
hFileIn : [intptr] A handle to the file to check.
pgSubject : [var] A GUID that identifies the subject.
%inst
Retrieves a GUID based on the header information in a specified file.

[戻り値]
If the function succeeds, the function returns TRUE. If the function
fails, it returns FALSE. For extended error information, call
GetLastError.


%index
CryptSIPRetrieveSubjectGuidForCatalogFile
Retrieves the subject GUID associated with the specified file.
%group
Win32 crypt32
%prm
FileName, hFileIn, pgSubject
FileName : [wstr] The name of the file. If the hFileIn parameter is set, the value in this parameter is ignored.
hFileIn : [intptr] A handle to the file to check. This parameter must contain a valid handle if the FileName parameter is NULL.
pgSubject : [var] A globally unique ID that identifies the subject.
%inst
Retrieves the subject GUID associated with the specified file.

[戻り値]
The return value is TRUE if the function succeeds; otherwise, FALSE.
If this function returns FALSE, additional error information can be
obtained by calling the GetLastError function. GetLastError will
return one of the following error codes.
This doc was truncated.

[備考]
This function only supports subject interface packages (SIPs) that
are used for portable executable images (.exe), cabinet (.cab)
images, and flat files.


%index
CryptSetAsyncParam
The CryptSetAsyncParam function (wincrypt.h) sets an async parameter.
%group
Win32 crypt32
%prm
hAsync, pszParamOid, pvParam, pfnFree
hAsync : [intptr] An async handle.
pszParamOid : [str] The parameter ID.
pvParam : [intptr] The parameter value.
pfnFree : [int] A callback function called when the parameter is freed.
%inst
The CryptSetAsyncParam function (wincrypt.h) sets an async parameter.

[戻り値]
S_OK on success.


%index
CryptSetKeyIdentifierProperty
The CryptSetKeyIdentifierProperty function sets the property of a specified key identifier. This function can set the property on the computer identified in pwszComputerName.
%group
Win32 crypt32
%prm
pKeyIdentifier, dwPropId, dwFlags, pwszComputerName, pvReserved, pvData
pKeyIdentifier : [var] A pointer to a CRYPT_HASH_BLOB containing the key identifier.
dwPropId : [int] Identifies the property to be set. The value of dwPropId determines the type and content of the pvData parameter. Any certificate property ID can be used. CERT_KEY_PROV_INFO_PROP_ID is the property of most interest.
dwFlags : [int] The following flags can be set. They can be combined with a bitwise-OR operation.
pwszComputerName : [wstr] A pointer to a null-terminated string that contains the name of a remote computer that has the key identifier where the properties are set. If CRYPT_KEYID_MACHINE_FLAG flag is set, searches the remote computer for a list of key identifiers. If the local computer is to be set and not a remote computer, set pwszComputerName to NULL.
pvReserved : [intptr] Reserved for future use and must be NULL.
pvData : [intptr] If dwPropId is CERT_KEY_PROV_INFO_PROP_ID, pvData points to a CRYPT_KEY_PROV_INFO structure containing the property of the key identifier.
%inst
The CryptSetKeyIdentifierProperty function sets the property of a
specified key identifier. This function can set the property on the
computer identified in pwszComputerName.

[戻り値]
If the function succeeds, the return value is nonzero (TRUE). If the
function fails, the return value is zero (FALSE). For extended error
information, call GetLastError. Note If CRYPT_KEYID_SET_NEW_FLAG is
set and the property already exists, FALSE is returned with the last
error code set to CRYPT_E_EXISTS.


%index
CryptSetOIDFunctionValue
The CryptSetOIDFunctionValue function sets a value for the specified encoding type, function name, OID, and value name.
%group
Win32 crypt32
%prm
dwEncodingType, pszFuncName, pszOID, pwszValueName, dwValueType, pbValueData, cbValueData
dwEncodingType : [int] Specifies the encoding type to be matched. Currently, only X509_ASN_ENCODING and PKCS_7_ASN_ENCODING are being used; however, additional encoding types may be added in the future. To match both current encoding types, use:
pszFuncName : [str] Name of the function for which the encoding type, OID, and value name is being updated.
pszOID : [str] If the high-order word of the object identifier (OID) is nonzero, pszOID is a pointer to either an OID string such as "2.5.29.1" or an ASCII string such as "file". If the high-order word of the OID is zero, the low-order word specifies the integer identifier to be used as the object identifier.
pwszValueName : [wstr] A pointer to a Unicode string containing the name of the value to set. If a value with this name is not already present, the function creates it.
dwValueType : [int] 
pbValueData : [var] Points to a buffer containing the data to be stored for the specified value name.
cbValueData : [int] Specifies the size, in bytes, of the information pointed to by the pbValueData parameter. If the data is of type REG_SZ, REG_EXPAND_SZ, or REG_MULTI_SZ, the size must include the terminating NULL wide character.
%inst
The CryptSetOIDFunctionValue function sets a value for the specified
encoding type, function name, OID, and value name.

[戻り値]
If the function succeeds, the return value is nonzero (TRUE). If the
function fails, the return value is zero (FALSE).


%index
CryptSignAndEncodeCertificate
Encodes and signs a certificate, certificate revocation list (CRL), certificate trust list (CTL), or certificate request.
%group
Win32 crypt32
%prm
hCryptProvOrNCryptKey, dwKeySpec, dwCertEncodingType, lpszStructType, pvStructInfo, pSignatureAlgorithm, pvHashAuxInfo, pbEncoded, pcbEncoded
hCryptProvOrNCryptKey : [int] 
dwKeySpec : [int] 
dwCertEncodingType : [int] Specifies the encoding type used. This can be the following value.
lpszStructType : [str] A pointer to a null-terminated ANSI string that contains the type of data to be encoded and signed. The following predefined lpszStructType constants are used with encode operations.
pvStructInfo : [intptr] The address of a structure that contains the data to be signed and encoded. The format of this structure is determined by the lpszStructType parameter.
pSignatureAlgorithm : [var] A pointer to a CRYPT_ALGORITHM_IDENTIFIER structure that contains the object identifier (OID) of the signature algorithm and any additional parameters needed. This function uses the following algorithm OIDs:
pvHashAuxInfo : [intptr] Reserved. Must be NULL.
pbEncoded : [var] A pointer to a buffer to receive the signed and encoded output. This parameter can be NULL to set the size of this information for memory allocation purposes. For more information, see Retrieving Data of Unknown Length.
pcbEncoded : [var] A pointer to a DWORD that contains the size, in bytes, of the buffer pointed to by the pbEncoded parameter. When the function returns, the DWORD contains the number of bytes stored or to be stored in the buffer.
%inst
Encodes and signs a certificate, certificate revocation list (CRL),
certificate trust list (CTL), or certificate request.

[戻り値]
If the function succeeds, the return value is nonzero (TRUE). If the
function fails, the return value is zero (FALSE). For extended error
information, call GetLastError. Note Errors from the called functions
CryptCreateHash, CryptSignHash and CryptHashData might be propagated
to this function. Possible error codes include, but are not limited
to, the following.
This doc was truncated.


%index
CryptSignAndEncryptMessage
The CryptSignAndEncryptMessage function creates a hash of the specified content, signs the hash, encrypts the content, hashes the encrypted contents and the signed hash, and then encodes both the encrypted content and the signed hash.
%group
Win32 crypt32
%prm
pSignPara, pEncryptPara, cRecipientCert, rgpRecipientCert, pbToBeSignedAndEncrypted, cbToBeSignedAndEncrypted, pbSignedAndEncryptedBlob, pcbSignedAndEncryptedBlob
pSignPara : [var] A pointer to a CRYPT_SIGN_MESSAGE_PARA structure that contains the signature parameters.
pEncryptPara : [var] A pointer to a CRYPT_ENCRYPT_MESSAGE_PARA structure containing encryption parameters.
cRecipientCert : [int] Number of array elements in rgpRecipientCert.
rgpRecipientCert : [var] Array of pointers to CERT_CONTEXT structures. Each structure is the certificate of an intended recipients of the message.
pbToBeSignedAndEncrypted : [var] A pointer to a buffer containing the content to be signed and encrypted.
cbToBeSignedAndEncrypted : [int] The size, in bytes, of the pbToBeSignedAndEncrypted buffer.
pbSignedAndEncryptedBlob : [var] A pointer to a buffer to receive the encrypted and encoded message.
pcbSignedAndEncryptedBlob : [var] A pointer to DWORD specifying the size, in bytes, of the buffer pointed to by pbSignedAndEncryptedBlob. When the function returns, this variable contains the size, in bytes, of the signed and encrypted message copied to *pbSignedAndEncryptedBlob.
%inst
The CryptSignAndEncryptMessage function creates a hash of the
specified content, signs the hash, encrypts the content, hashes the
encrypted contents and the signed hash, and then encodes both the
encrypted content and the signed hash.

[戻り値]
If the function succeeds, the return value is nonzero (TRUE). If the
function fails, the return value is zero (FALSE). For extended error
information, call GetLastError. The following lists the error code
most commonly returned by the GetLastError function.
This doc was truncated.


%index
CryptSignCertificate
The CryptSignCertificate function signs the "to be signed" information in the encoded signed content.
%group
Win32 crypt32
%prm
hCryptProvOrNCryptKey, dwKeySpec, dwCertEncodingType, pbEncodedToBeSigned, cbEncodedToBeSigned, pSignatureAlgorithm, pvHashAuxInfo, pbSignature, pcbSignature
hCryptProvOrNCryptKey : [int] 
dwKeySpec : [int] Identifies the private key to use from the provider's container. It can be AT_KEYEXCHANGE or AT_SIGNATURE. This parameter is ignored if an NCRYPT_KEY_HANDLE is used in the hCryptProvOrNCryptKey parameter.
dwCertEncodingType : [int] Specifies the encoding type used. It is always acceptable to specify both the certificate and message encoding types by combining them with a bitwise-OR operation as shown in the following example: X509_ASN_ENCODING | PKCS_7_ASN_ENCODING Currently defined encoding types are:
pbEncodedToBeSigned : [var] A pointer to the encoded content to be signed.
cbEncodedToBeSigned : [int] The size, in bytes, of the encoded content, pbEncodedToBeSigned.
pSignatureAlgorithm : [var] A pointer to a CRYPT_ALGORITHM_IDENTIFIER structure with a pszObjId member set to one of the following:
pvHashAuxInfo : [intptr] Not currently used. Must be NULL.
pbSignature : [var] A pointer to a buffer to receive the signed hash of the content. This parameter can be NULL to set the size of this information for memory allocation purposes. For more information, see Retrieving Data of Unknown Length.
pcbSignature : [var] A pointer to a DWORD that contains the size, in bytes, of the buffer pointed to by the pbSignature parameter. When the function returns, the DWORD contains the number of bytes stored or to be stored in the buffer. Note??When processing the data returned in the buffer, applications must use the actual size of the data returned. The actual size can be slightly smaller than the size of the buffer specified on input. (On input, buffer sizes are usually specified large enough to ensure that the largest possible output data will fit in the buffer.) On output, the variable pointed to by this parameter is updated to reflect the actual size of the data copied to the buffer.
%inst
The CryptSignCertificate function signs the "to be signed"
information in the encoded signed content.

[戻り値]
If the function succeeds, the return value is nonzero (TRUE). If the
function fails, the return value is zero (FALSE). For extended error
information, call GetLastError. Note Errors from the called functions
CryptCreateHash, CryptSignHash and CryptHashData might be propagated
to this function. This function has the following error codes.
This doc was truncated.


%index
CryptSignMessage
The CryptSignMessage function creates a hash of the specified content, signs the hash, and then encodes both the original message content and the signed hash.
%group
Win32 crypt32
%prm
pSignPara, fDetachedSignature, cToBeSigned, rgpbToBeSigned, rgcbToBeSigned, pbSignedBlob, pcbSignedBlob
pSignPara : [var] A pointer to CRYPT_SIGN_MESSAGE_PARA structure containing the signature parameters.
fDetachedSignature : [int] TRUE if this is to be a detached signature. Otherwise, FALSE. If this parameter is set to TRUE, only the signed hash is encoded in pbSignedBlob. Otherwise, both rgpbToBeSigned and the signed hash are encoded.
cToBeSigned : [int] Count of the number of array elements in rgpbToBeSigned and rgcbToBeSigned. This parameter must be set to one unless fDetachedSignature is set to TRUE.
rgpbToBeSigned : [var] Array of pointers to buffers that contain the contents to be signed.
rgcbToBeSigned : [var] Array of sizes, in bytes, of the content buffers pointed to in rgpbToBeSigned.
pbSignedBlob : [var] A pointer to a buffer to receive the encoded signed hash, if fDetachedSignature is TRUE, or to both the encoded content and signed hash if fDetachedSignature is FALSE.
pcbSignedBlob : [var] A pointer to a DWORD specifying the size, in bytes, of the pbSignedBlob buffer. When the function returns, this variable contains the size, in bytes, of the signed and encoded message.
%inst
The CryptSignMessage function creates a hash of the specified
content, signs the hash, and then encodes both the original message
content and the signed hash.

[戻り値]
If the function succeeds, the return value is nonzero (TRUE). If the
function fails, the return value is zero (FALSE). For extended error
information, call GetLastError. The following lists the error codes
most commonly returned by the GetLastError function.
This doc was truncated.


%index
CryptSignMessageWithKey
Signs a message by using a CSP's private key specified in the parameters.
%group
Win32 crypt32
%prm
pSignPara, pbToBeSigned, cbToBeSigned, pbSignedBlob, pcbSignedBlob
pSignPara : [var] A pointer to a CRYPT_KEY_SIGN_MESSAGE_PARA structure that contains the signature parameters.
pbToBeSigned : [var] A pointer to a buffer array that contains the message to be signed.
cbToBeSigned : [int] The number of array elements in the pbToBeSigned buffer array.
pbSignedBlob : [var] A pointer to a buffer to receive the encoded signed message.
pcbSignedBlob : [var] A pointer to a DWORD value that indicates the size, in bytes, of the pbSignedBlob buffer. When the function returns, this variable contains the size, in bytes, of the signed and encoded message.
%inst
Signs a message by using a CSP's private key specified in the
parameters.

[戻り値]
If the function succeeds, the return value is nonzero (TRUE). If the
function fails, the return value is zero (FALSE). For extended error
information, call GetLastError. The following lists the error codes
most commonly returned by the GetLastError function.
This doc was truncated.


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
CryptUninstallDefaultContext
Important??This API is deprecated. (CryptUninstallDefaultContext)
%group
Win32 crypt32
%prm
hDefaultContext, dwFlags, pvReserved
hDefaultContext : [intptr] Handle of the context to be released.
dwFlags : [int] Reserved for future use.
pvReserved : [intptr] Reserved for future use.
%inst
Important This API is deprecated. (CryptUninstallDefaultContext)

[戻り値]
If the function succeeds, the return value is nonzero (TRUE) .If the
function fails, the return value is zero (FALSE). For extended error
information, call GetLastError.


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


%index
CryptUnregisterDefaultOIDFunction
The CryptUnregisterDefaultOIDFunction removes the registration of a DLL containing the default function to be called for the specified encoding type and function name.
%group
Win32 crypt32
%prm
dwEncodingType, pszFuncName, pwszDll
dwEncodingType : [int] Specifies the encoding type to be matched. Currently, only X509_ASN_ENCODING and PKCS_7_ASN_ENCODING are being used; however, additional encoding types may be added in the future. To match both current encoding types, use:
pszFuncName : [str] Name of the function being unregistered.
pwszDll : [wstr] Name of the DLL where the function is located.
%inst
The CryptUnregisterDefaultOIDFunction removes the registration of a
DLL containing the default function to be called for the specified
encoding type and function name.

[戻り値]
If the function succeeds, the return value is nonzero (TRUE). If the
function fails, the return value is zero (FALSE).


%index
CryptUnregisterOIDFunction
Removes the registration of a DLL that contains the function to be called for the specified encoding type, function name, and OID.
%group
Win32 crypt32
%prm
dwEncodingType, pszFuncName, pszOID
dwEncodingType : [int] Specifies the encoding type to be matched. Currently, only X509_ASN_ENCODING and PKCS_7_ASN_ENCODING are used; however, additional encoding types may be added in the future. To match both current encoding types, use:
pszFuncName : [str] Name of the function being unregistered.
pszOID : [str] A pointer to the object identifier (OID) that corresponds to the name of the function being unregistered. If the high order word of the OID is nonzero, pszOID is a pointer to either an OID string such as "2.5.29.1" or an ASCII string such as "file." If the high order word of the OID is zero, the low order word specifies the integer identifier to be used as the object identifier.
%inst
Removes the registration of a DLL that contains the function to be
called for the specified encoding type, function name, and OID.

[戻り値]
If the function succeeds, the return value is nonzero (TRUE). If the
function fails, the return value is zero (FALSE).


%index
CryptUnregisterOIDInfo
The CryptUnregisterOIDInfo function removes the registration of a specified CRYPT_OID_INFO OID information structure. The structure to be unregistered is identified by the structure's pszOID and dwGroupId members.
%group
Win32 crypt32
%prm
pInfo
pInfo : [var] Specifies the object identifier (OID) information for which the registration is to be removed. The group that the registration is removed for is specified by the dwGroupId member in the pInfo.
%inst
The CryptUnregisterOIDInfo function removes the registration of a
specified CRYPT_OID_INFO OID information structure. The structure to
be unregistered is identified by the structure's pszOID and dwGroupId
members.

[戻り値]
If the function succeeds, the return value is nonzero (TRUE). If the
function fails, the return value is zero (FALSE).


%index
CryptVerifyCertificateSignature
Verifies the signature of a certificate, certificate revocation list (CRL), or certificate request by using the public key in a CERT_PUBLIC_KEY_INFO structure.
%group
Win32 crypt32
%prm
hCryptProv, dwCertEncodingType, pbEncoded, cbEncoded, pPublicKey
hCryptProv : [int] This parameter is not used and should be set to NULL. Windows Server?2003 and Windows?XP:??A handle to the cryptographic service provider (CSP) used to verify the signature.This parameter's data type is HCRYPTPROV. NULL is passed unless there is a strong reason for passing in a specific cryptographic provider. Passing in NULL causes the default RSA or DSS provider to be acquired.
dwCertEncodingType : [int] The certificate encoding type that was used to encrypt the subject. The message encoding type identifier, contained in the high WORD of this value, is ignored by this function.
pbEncoded : [var] A pointer to an encoded BLOB of CERT_SIGNED_CONTENT_INFO content on which the signature is to be verified.
cbEncoded : [int] The size, in bytes, of the encoded content in pbEncoded.
pPublicKey : [var] A pointer to a CERT_PUBLIC_KEY_INFO structure that contains the public key to use when verifying the signature.
%inst
Verifies the signature of a certificate, certificate revocation list
(CRL), or certificate request by using the public key in a
CERT_PUBLIC_KEY_INFO structure.

[戻り値]
Returns nonzero if successful or zero otherwise.
For extended error information, call GetLastError. Note Errors from
the called functions CryptCreateHash, CryptImportKey,
CryptVerifySignature, and CryptHashData may be propagated to this
function. On failure, this function will cause the following error
codes to be returned from GetLastError.
This doc was truncated.

[備考]
This function currently calls the CryptVerifyCertificateSignatureEx
function to perform the verification.


%index
CryptVerifyCertificateSignatureEx
Verifies the signature of a subject certificate, certificate revocation list, certificate request, or keygen request by using the issuer's public key.
%group
Win32 crypt32
%prm
hCryptProv, dwCertEncodingType, dwSubjectType, pvSubject, dwIssuerType, pvIssuer, dwFlags, pvExtra
hCryptProv : [int] This parameter is not used and should be set to NULL. Windows Server?2003 and Windows?XP:??A handle to the cryptographic service provider used to verify the signature.This parameter's data type is HCRYPTPROV. NULL is passed unless there is a strong reason for passing in a specific cryptographic provider. Passing in NULL causes the default RSA or DSS provider to be acquired.
dwCertEncodingType : [int] The certificate encoding type   that was used to encrypt the subject. The message encoding type identifier, contained in the high WORD of this value, is ignored by this function.
dwSubjectType : [int] The subject type. This parameter can be one of the following subject types.
pvSubject : [intptr] A pointer to a structure of the type indicated by dwSubjectType that contains the signature to be verified.
dwIssuerType : [int] The issuer type. This parameter can be one of the following issuer types.
pvIssuer : [intptr] A pointer to a structure of the type indicated by the value of dwIssuerType. The structure contains access to the public key needed to verify the signature.
dwFlags : [int] 
pvExtra : [intptr] Pointer to a CRYPT_VERIFY_CERT_SIGN_STRONG_PROPERTIES_INFO structure if the dwFlags parameter is set to CRYPT_VERIFY_CERT_SIGN_RETURN_STRONG_PROPERTIES_FLAG. You must call CryptMemFree to free the structure.
%inst
Verifies the signature of a subject certificate, certificate
revocation list, certificate request, or keygen request by using the
issuer's public key.

[戻り値]
Returns nonzero if successful or zero otherwise.
For extended error information, call GetLastError. Note Errors from
the called functions CryptCreateHash, CryptImportKey,
CryptVerifySignature, and CryptHashData may be propagated to this
function. On failure, this function will cause the following error
codes to be returned from GetLastError.
This doc was truncated.

[備考]
The subject buffer can contain an encoded BLOB or a context for a
certificate or CRL. In the case of a certificate context, if the
certificate's public key parameters are missing and if these
parameters can be inherited from the certificate's issuer for example
from the DSS public key parameter, the context's
CERT_PUBKEY_ALG_PARA_PROP_ID property is updated with the issuer's
public key algorithm parameters for a valid signature.


%index
CryptVerifyDetachedMessageHash
The CryptVerifyDetachedMessageHash function verifies a detached hash.
%group
Win32 crypt32
%prm
pHashPara, pbDetachedHashBlob, cbDetachedHashBlob, cToBeHashed, rgpbToBeHashed, rgcbToBeHashed, pbComputedHash, pcbComputedHash
pHashPara : [var] A pointer to a CRYPT_HASH_MESSAGE_PARA structure containing the hash parameters.
pbDetachedHashBlob : [var] A pointer to the encoded, detached hash.
cbDetachedHashBlob : [int] The size, in bytes, of the detached hash.
cToBeHashed : [int] Number of elements in the rgpbToBeHashed and rgcbToBeHashed arrays.
rgpbToBeHashed : [var] Array of pointers to content buffers to be hashed.
rgcbToBeHashed : [var] Array of sizes, in bytes, for the content buffers pointed to by the elements of the rgcbToBeHashed array.
pbComputedHash : [var] A pointer to a buffer to receive the computed hash.
pcbComputedHash : [var] A pointer to a DWORD specifying the size, in bytes, of the pbComputedHash buffer. When the function returns, this DWORD contains the size, in bytes, of the created hash. The hash will not be returned if this parameter is NULL.
%inst
The CryptVerifyDetachedMessageHash function verifies a detached hash.

[戻り値]
If the function succeeds, the return value is nonzero (TRUE). If the
function fails, the return value is zero (FALSE). For extended error
information, call GetLastError. The following lists the error codes
most commonly returned by the GetLastError function.
This doc was truncated.


%index
CryptVerifyDetachedMessageSignature
The CryptVerifyDetachedMessageSignature function verifies a signed message containing a detached signature or signatures.
%group
Win32 crypt32
%prm
pVerifyPara, dwSignerIndex, pbDetachedSignBlob, cbDetachedSignBlob, cToBeSigned, rgpbToBeSigned, rgcbToBeSigned, ppSignerCert
pVerifyPara : [var] A pointer to a CRYPT_VERIFY_MESSAGE_PARA structure containing the verification parameters.
dwSignerIndex : [int] Index of the signature to be verified. A message might have several signers and this function can be called repeatedly, changing dwSignerIndex to verify other signatures. If the function returns FALSE, and GetLastError returns CRYPT_E_NO_SIGNER, the previous call received the last signer of the message.
pbDetachedSignBlob : [var] A pointer to a BLOB containing the encoded message signatures.
cbDetachedSignBlob : [int] The size, in bytes, of the detached signature.
cToBeSigned : [int] Number of array elements in rgpbToBeSigned and rgcbToBeSigned.
rgpbToBeSigned : [var] Array of pointers to buffers containing the contents to be hashed.
rgcbToBeSigned : [var] Array of sizes, in bytes, for the content buffers pointed to in rgpbToBeSigned.
ppSignerCert : [var] A pointer to a pointer to a CERT_CONTEXT structure of a signer certificate. When you have finished using the certificate context, free it by calling the CertFreeCertificateContext function. A pointer to a CERT_CONTEXT structure will not be returned if this parameter is NULL.
%inst
The CryptVerifyDetachedMessageSignature function verifies a signed
message containing a detached signature or signatures.

[戻り値]
If the function succeeds, the return value is nonzero (TRUE). If the
function fails, the return value is zero (FALSE). For extended error
information, call GetLastError. The following lists the error codes
most commonly returned by the GetLastError function.
This doc was truncated.


%index
CryptVerifyMessageHash
The CryptVerifyMessageHash function verifies the hash of specified content.
%group
Win32 crypt32
%prm
pHashPara, pbHashedBlob, cbHashedBlob, pbToBeHashed, pcbToBeHashed, pbComputedHash, pcbComputedHash
pHashPara : [var] A pointer to a CRYPT_HASH_MESSAGE_PARA structure containing hash parameters.
pbHashedBlob : [var] A pointer to a buffer containing original content and its hash.
cbHashedBlob : [int] The size, in bytes, of the original hash buffer.
pbToBeHashed : [var] A pointer to a buffer to receive the original content that was hashed.
pcbToBeHashed : [var] A pointer to a DWORD specifying the size, in bytes, of the pbToBeHashed buffer. When the function returns, this variable contains the size, in bytes, of the original content copied to pbToBeHashed. The original content will not be returned if this parameter is NULL.
pbComputedHash : [var] A pointer to a buffer to receive the computed hash. This parameter can be NULL if the created hash is not needed for additional processing, or to set the size of the original content for memory allocation purposes. For more information, see Retrieving Data of Unknown Length.
pcbComputedHash : [var] A pointer to a DWORD specifying the size, in bytes, of the pbComputedHash buffer. When the function returns, this variable contains the size, in bytes, of the created hash. The hash is not returned if this parameter is NULL.
%inst
The CryptVerifyMessageHash function verifies the hash of specified
content.

[戻り値]
If the function succeeds, the return value is nonzero (TRUE). If the
function fails, the return value is zero (FALSE). For extended error
information, call GetLastError. The following lists the error codes
most commonly returned by the GetLastError function.
This doc was truncated.


%index
CryptVerifyMessageSignature
Verifies a signed message's signature.
%group
Win32 crypt32
%prm
pVerifyPara, dwSignerIndex, pbSignedBlob, cbSignedBlob, pbDecoded, pcbDecoded, ppSignerCert
pVerifyPara : [var] A pointer to a CRYPT_VERIFY_MESSAGE_PARA structure that contains verification parameters.
dwSignerIndex : [int] The index of the desired signature. There can be more than one signature. CryptVerifyMessageSignature can be called repeatedly, incrementing dwSignerIndex each time. Set this parameter to zero for the first signer, or if there is only one signer. If the function returns FALSE, and GetLastError returns CRYPT_E_NO_SIGNER, the previous call processed the last signer of the message.
pbSignedBlob : [var] A pointer to a buffer that contains the signed message.
cbSignedBlob : [int] The size, in bytes, of the signed message buffer.
pbDecoded : [var] A pointer to a buffer to receive the decoded message.
pcbDecoded : [var] A pointer to a DWORD value that specifies the size, in bytes, of the pbDecoded buffer. When the function returns, this DWORD contains the size, in bytes, of the decoded message. The decoded message will not be returned if this parameter is NULL.
ppSignerCert : [var] The address of a CERT_CONTEXT structure pointer that receives the certificate of the signer. When you have finished using this structure, free it by passing this pointer to the CertFreeCertificateContext function. This parameter can be NULL if the signer's certificate is not needed.
%inst
Verifies a signed message's signature.

[戻り値]
If the function succeeds, the function returns nonzero. This does not
necessarily mean that the signature was verified. In the case of a
detached message, the variable pointed to by pcbDecoded will contain
zero. In this case, this function will return nonzero, but the
signature is not verified. To verify the signature of a detached
message, use the CryptVerifyDetachedMessageSignature function. If the
function fails, it returns zero. For extended error information, call
GetLastError. The following table shows the error codes most commonly
returned by the GetLastError function.
This doc was truncated.

[備考]
For a verified signer and message, ppSignerCert is updated with the
CERT_CONTEXT of the signer. It must be freed by calling
CertFreeCertificateContext. Otherwise, ppSignerCert is set to NULL.
For a message that contains only certificates and CRLs, pcbDecoded is
set to NULL.


%index
CryptVerifyMessageSignatureWithKey
Verifies a signed message's signature by using specified public key information.
%group
Win32 crypt32
%prm
pVerifyPara, pPublicKeyInfo, pbSignedBlob, cbSignedBlob, pbDecoded, pcbDecoded
pVerifyPara : [var] A pointer to a CRYPT_KEY_VERIFY_MESSAGE_PARA structure that contains verification parameters.
pPublicKeyInfo : [var] A pointer to a CERT_PUBLIC_KEY_INFO structure that contains the public key that is used to verify the signed message. If NULL, the signature is not verified.
pbSignedBlob : [var] A pointer to a buffer that contains the signed message.
cbSignedBlob : [int] The size, in bytes, of the signed message buffer.
pbDecoded : [var] A pointer to a buffer to receive the decoded message.
pcbDecoded : [var] A pointer to a DWORD value that specifies the size, in bytes, of the pbDecoded buffer. When the function returns, this DWORD contains the size, in bytes, of the decoded message. The decoded message will not be returned if this parameter is NULL.
%inst
Verifies a signed message's signature by using specified public key
information.

[戻り値]
If the function succeeds, the function returns nonzero. If the
function fails, it returns zero. For extended error information, call
GetLastError. The following table shows the error codes most commonly
returned by the GetLastError function.
This doc was truncated.


%index
CryptVerifyTimeStampSignature
Validates the time stamp signature on a specified array of bytes.
%group
Win32 crypt32
%prm
pbTSContentInfo, cbTSContentInfo, pbData, cbData, hAdditionalStore, ppTsContext, ppTsSigner, phStore
pbTSContentInfo : [var] A pointer to a buffer that contains time stamp content.
cbTSContentInfo : [int] The size, in bytes, of the buffer pointed to by the pbTSContentInfo parameter.
pbData : [var] A pointer to an array of bytes on which to validate the time stamp signature.
cbData : [int] The size, in bytes, of the array pointed to by the pbData parameter.
hAdditionalStore : [int] The handle of an additional store to search for supporting Time Stamping Authority (TSA) signing certificates and certificate trust lists (CTLs). This parameter can be NULL if no additional store is to be searched.
ppTsContext : [var] A pointer to a PCRYPT_TIMESTAMP_CONTEXT structure. When you have finished using the context, you must free it by calling the CryptMemFree function.
ppTsSigner : [var] A pointer to a PCERT_CONTEXT that receives the certificate of the signer. When you have finished using this structure, you must free it by passing this pointer to the CertFreeCertificateContext function. Set this parameter to NULL if the TSA signer's certificate is not needed.
phStore : [var] A pointer to a handle that receives the certificate store opened  on CMS to search for supporting certificates. This parameter can be NULL if the TSA supporting certificates are not needed. When you have finished using this handle,  you  must release it by passing it to  the CertCloseStore function.
%inst
Validates the time stamp signature on a specified array of bytes.

[戻り値]
If the function succeeds, the function returns TRUE. For extended
error information, call the GetLastError function.

[備考]
The caller should validate the pszTSAPolicyId member of the
CRYPT_TIMESTAMP_INFO structure when it is returned by the
CryptRetrieveTimeStamp function. If a TSA policy was specified in the
request and the ftTime member contains a valid value, the caller
should build a certificate context chain with which to populate the
ppTsSigner parameter and validate the trust.


%index
PFXExportCertStore
Exports the certificates and, if available, the associated private keys from the referenced certificate store.
%group
Win32 crypt32
%prm
hStore, pPFX, szPassword, dwFlags
hStore : [int] Handle of the certificate store containing the certificates to be exported.
pPFX : [var] A pointer to a CRYPT_DATA_BLOB structure to contain the PFX packet with the exported certificates and keys. If pPFX->pbData is NULL, the function calculates the number of bytes needed for the encoded BLOB and returns this in pPFX->cbData. When the function is called with pPFX->pbData pointing to an allocated buffer of the needed size, the function copies the encoded bytes into the buffer and updates pPFX->cbData with the encode byte length.
szPassword : [wstr] String password used to encrypt and verify the PFX packet. When you have finished using the password, clear the password from memory by calling the SecureZeroMemory function. For more information about protecting passwords, see Handling Passwords.
dwFlags : [int] Flag values can be set to any combination of the following.
%inst
Exports the certificates and, if available, the associated private
keys from the referenced certificate store.

[戻り値]
Returns TRUE (nonzero) if the function succeeds, and FALSE (zero) if
the function fails. For extended error information, call
GetLastError.


%index
PFXExportCertStoreEx
Exports the certificates and, if available, their associated private keys from the referenced certificate store.
%group
Win32 crypt32
%prm
hStore, pPFX, szPassword, pvPara, dwFlags
hStore : [int] Handle of the certificate store containing the certificates to be exported.
pPFX : [var] A pointer to a CRYPT_DATA_BLOB structure to contain the PFX packet with the exported certificates and keys. If pPFX->pbData is NULL, the function calculates the number of bytes needed for the encoded BLOB and returns this in pPFX->cbData. When the function is called with pPFX->pbData pointing to an allocated buffer of the needed size, the function copies the encoded bytes into the buffer and updates pPFX->cbData with the encode byte length.
szPassword : [wstr] String password used to encrypt and verify the PFX packet. When you have finished using the password, clear the password from memory by calling the SecureZeroMemory function. For more information about protecting passwords, see Handling Passwords.
pvPara : [intptr] This parameter must be NULL if the dwFlags parameter does not contain PKCS12_PROTECT_TO_DOMAIN_SIDS or PKCS12_EXPORT_PBES2_PARAMS. Prior to Windows?8 and Windows Server?2012, therefore, this parameter must be NULL. Beginning with Windows?8 and Windows Server?2012, if the dwFlags parameter contains PKCS12_PROTECT_TO_DOMAIN_SIDS, you can set the pvPara parameter to point to an NCRYPT_DESCRIPTOR_HANDLE value to identify which Active Directory principal the PFX password will be protected to inside of the PFX BLOB. Currently, the password can be protected to an Active Directory user, computer, or group. For more information about protection descriptors, see NCryptCreateProtectionDescriptor. Beginning with Windows 10 1709 (Fall Creators update) and Windows Server 2019, if the dwFlags parameter contains PKCS12_EXPORT_PBES2_PARAMS, you should set the pvPara to an PKCS12_EXPORT_PBES2_PARAMS value to select the password-based encryption algorithm to use.
dwFlags : [int] Flag values can be set to any combination of the following.
%inst
Exports the certificates and, if available, their associated private
keys from the referenced certificate store.

[戻り値]
Returns TRUE (nonzero) if the function succeeds, and FALSE (zero) if
the function fails. For extended error information, call
GetLastError.

[備考]
Beginning with Windows 8 and Windows Server 2012, you can protect the
PFX password to an Active Directory user, computer, or group. If you
choose to do so but do not create a password, a temporary password
will be randomly selected. The password is encrypted by using the
Active Directory principal and then embedded in the PFX BLOB. For
more information, see the pvPara parameter and the
PKCS12_PROTECT_TO_DOMAIN_SIDS flag. Beginning with Windows 10 1709
(Fall Creators update) and Windows Server 2019, you can control the
number of iterations of the hash function over the password done by
the PFXExportCertStoreEx function using the following registry key.
The value in this key is of type REG_DWORD.
HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\PFX\PasswordIterationCount


%index
PFXImportCertStore
Imports a PFX BLOB and returns the handle of a store that contains certificates and any associated private keys.
%group
Win32 crypt32
%prm
pPFX, szPassword, dwFlags
pPFX : [var] A pointer to a [CRYPT_DATA_BLOB](/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)) structure that contains a PFX packet with the exported and encrypted certificates and keys.
szPassword : [wstr] A string password used to decrypt and verify the PFX packet. Whether set to a string of length greater than zero or set to an empty string or to **NULL**,  this value must be exactly the same as the value that was used to encrypt the packet. Beginning with Windows?8 and Windows Server?2012, if the PFX packet was created in the [PFXExportCertStoreEx](nf-wincrypt-pfxexportcertstoreex.md) function by using the **PKCS12_PROTECT_TO_DOMAIN_SIDS** flag, the **PFXImportCertStore** function attempts to decrypt the password by using the Active Directory (AD) principal that was used to encrypt it. The AD principal is specified in the *pvPara* parameter. If the *szPassword* parameter in the **PFXExportCertStoreEx** function was an empty string or **NULL** and the *dwFlags* parameter was set to **PKCS12_PROTECT_TO_DOMAIN_SIDS**, that function randomly generated a password and encrypted it to the AD principal specified in the *pvPara* parameter. In that case you should set the password to the value, empty string or **NULL**, that was used when the PFX packet was created. The **PFXImportCertStore** function will use the AD principal to decrypt the random password, and the randomly generated password will be used to decrypt the PFX certificate. When you have finished using the password, clear it from memory by calling the [SecureZeroMemory](/previous-versions/windows/desktop/legacy/aa366877(v=vs.85)) function. For more information about protecting passwords, see [Handling Passwords](/windows/win32/SecBP/handling-passwords).
dwFlags : [int] 
%inst
Imports a PFX BLOB and returns the handle of a store that contains
certificates and any associated private keys.

[戻り値]
If the function succeeds, the function returns a handle to a
certificate store that contains the imported certificates, including
available private keys. If the function fails, that is, if the
password parameter does not contain an exact match with the password
used to encrypt the exported packet or if there were any other
problems decoding the PFX BLOB, the function returns **NULL**, and an
error code can be found by calling the
[GetLastError](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror)
function.

[備考]
The **PFXImportCertStore** function opens a temporary store. If the
function succeeds, you should close the handle to the store by
calling the [CertCloseStore](nf-wincrypt-certclosestore.md) function.
When you import a certificate from the PFX packet, the CSP/KSP
container name is determined by using the AttributeId with OID
1.3.6.1.4.1.311.17.1 of the PKCS8ShroudedKeyBag SafeBag [bagId:
1.2.840.113549.1.12.10.1.2] (see [PKCS
#12](https://www.rfc-editor.org/rfc/rfc7292) for details about the
ASN.1 structure of this). * **AttributeId:** 1.3.6.1.4.1.311.17.1 *
**Value:** The KSP name or CSP name If the AttributeId is not present
and the PREFER_CNG flag is passed, MS_KEY_STORAGE_PROVIDER is picked.
If the AttributeId is not present and the PREFER_CNG flag is not
passed, the provider name is determined based on the public key
algorithm (that is, the public key algorithm is determined by the
AlgorithmIdentifier in PKCS #8): * **RSA:** MS_ENHANCED_PROV_W *
**DSA:** MS_DEF_DSS_DH_PROV_W Similarly, the key specification is
determined by using the AttributeId with OID 2.5.29.15
(szOID_KEY_USAGE) as follows: **If a CAPI key is used:** * If
KEY_ENCIPHERMENT or DATA_ENCIPHERMENT is set, then the key
specification is set to AT_KEYEXCHANGE. * If DIGITAL_SIGNATURE or
CERT_SIGN or CRL_SIGN is set, then the key specification is set to
AT_SIGNATURE. **If a CNG key is used:** * If KEY_ENCIPHERMENT or
DATA_ENCIPHERMENT or ENCIPHER_ONLY or DECIPHER_ONLY is set, then
ncrypt key usage is set to ALLOW_DECRYPT. * If DIGITAL_SIGNATURE or
CERT_SIGN or CRL_SIGN is set, ncrypt key usage is set to ALLOW_SIGN.
* If KEY_AGREEMENT is set, then ncrypt key usage is set to
ALLOW_KEY_AGREEMENT. If the AttributeId is not present, then the CAPI
key value is set to AT_KEYEXCHANGE for RSA or DH and the algorithm is
determined by the AlgorithmIdentifier in PKCS #8; otherwise, the
algorithm is set to AT_SIGNATURE. For the CNG key value, all ncrypt
key usage is set. >[!NOTE] >If an invalid provider name is present in
the PFX packet, or the base or enhanced cryptography provider is not
present in this registry key:
**HKEY_LOCAL_MACHINE\\SOFTWARE\\Microsoft\\Cryptography\\Defaults\\Provider**,
then a provider lookup is performed by the provider type using this
registry subkey:
**HKEY_LOCAL_MACHINE\\SOFTWARE\\Microsoft\\Cryptography\\Defaults\\Provider
Types**. Microsoft only supports two encryption/hash algorithms for
importing a PFX: * TripleDES-SHA1 * AES256-SHA256 For either of the
above algorithms, encryption of the certificates is optional.
Microsoft can export a PFX from a certificate store via the `All
Tasks` \> `Yes, export the private key` selection. There you can
select the encryption/hash algorithm to match one of these two
choices. You can use PowerShell to export a PFX via the following:
This doc was truncated.


%index
PFXIsPFXBlob
The PFXIsPFXBlob function attempts to decode the outer layer of a BLOB as a PFX packet.
%group
Win32 crypt32
%prm
pPFX
pPFX : [var] A pointer to a CRYPT_DATA_BLOB structure that the function will attempt to decode as a PFX packet.
%inst
The PFXIsPFXBlob function attempts to decode the outer layer of a
BLOB as a PFX packet.

[戻り値]
The function returns TRUE if the BLOB can be decoded as a PFX packet.
If the outer layer of the BLOB cannot be decoded as a PFX packet, the
function returns FALSE.


%index
PFXVerifyPassword
The PFXVerifyPassword function attempts to decode the outer layer of a BLOB as a Personal Information Exchange (PFX) packet and to decrypt it with the given password. No data from the BLOB is imported.
%group
Win32 crypt32
%prm
pPFX, szPassword, dwFlags
pPFX : [var] A pointer to a CRYPT_DATA_BLOB structure that the function will attempt to decode as a PFX packet.
szPassword : [wstr] String password to be checked. For this function to succeed, this password must be exactly the same as the password used to encrypt the packet. If you set this value to an empty string or NULL, this function typically attempts to decrypt the password embedded in the PFX BLOB by using the empty string or NULL. However, beginning with Windows?8 and Windows Server?2012, if a NULL or empty password was specified when the PFX BLOB was created and the application also specified  that the password should be protected to an Active Directory (AD) principal, the Cryptography API (CAPI) randomly generates a password, encrypts it to the AD principal and embeds it in the PFX BLOB. The PFXVerifyPassword function will then try to use the specified AD principal (current user, computer, or AD group member) to decrypt the password. For more information about protecting PFX to an AD principal, see the pvPara parameter and the PKCS12_PROTECT_TO_DOMAIN_SIDS flag of the PFXExportCertStoreEx function. When you have finished using the password, clear the password from memory by calling the SecureZeroMemory function. For more information about protecting passwords, see Handling Passwords.
dwFlags : [int] Reserved for future use.
%inst
The PFXVerifyPassword function attempts to decode the outer layer of
a BLOB as a Personal Information Exchange (PFX) packet and to decrypt
it with the given password. No data from the BLOB is imported.

[戻り値]
The function return TRUE if the password appears correct; otherwise,
it returns FALSE.

