; ============================================================
;   Auto-generated from CsWin32 / win32metadata
;   dll:    crypt32.dll
;   tool:   tools/cswin32_bridge/gen_from_cswin32.py
;   Do not edit by hand ? regenerate via the python script.
;   Needs hsp3net (intptr / NSTRUCT / wstr).
; ============================================================

#ifndef __crypt32_gen2_as__
#define global __crypt32_gen2_as__

; Shared NSTRUCT + #define constants for all win32 *_gen2.as
#include "win32_types_gen2.as"

;--- functions ---
#uselib "crypt32.dll"
; winmdroot.Foundation.BOOL CertAddCRLContextToStore(winmdroot.Security.Cryptography.HCERTSTORE hCertStore, winmdroot.Security.Cryptography.CRL_CONTEXT* pCrlContext, uint dwAddDisposition, [Optional] winmdroot.Security.Cryptography.CRL_CONTEXT** ppStoreContext)
#cfunc global CertAddCRLContextToStore "CertAddCRLContextToStore" int, var, int, var

; winmdroot.Foundation.BOOL CertAddCRLLinkToStore(winmdroot.Security.Cryptography.HCERTSTORE hCertStore, winmdroot.Security.Cryptography.CRL_CONTEXT* pCrlContext, uint dwAddDisposition, [Optional] winmdroot.Security.Cryptography.CRL_CONTEXT** ppStoreContext)
#cfunc global CertAddCRLLinkToStore "CertAddCRLLinkToStore" int, var, int, var

; winmdroot.Foundation.BOOL CertAddCTLContextToStore(winmdroot.Security.Cryptography.HCERTSTORE hCertStore, winmdroot.Security.Cryptography.CTL_CONTEXT* pCtlContext, uint dwAddDisposition, [Optional] winmdroot.Security.Cryptography.CTL_CONTEXT** ppStoreContext)
#cfunc global CertAddCTLContextToStore "CertAddCTLContextToStore" int, var, int, var

; winmdroot.Foundation.BOOL CertAddCTLLinkToStore(winmdroot.Security.Cryptography.HCERTSTORE hCertStore, winmdroot.Security.Cryptography.CTL_CONTEXT* pCtlContext, uint dwAddDisposition, [Optional] winmdroot.Security.Cryptography.CTL_CONTEXT** ppStoreContext)
#cfunc global CertAddCTLLinkToStore "CertAddCTLLinkToStore" int, var, int, var

; winmdroot.Foundation.BOOL CertAddCertificateContextToStore(winmdroot.Security.Cryptography.HCERTSTORE hCertStore, winmdroot.Security.Cryptography.CERT_CONTEXT* pCertContext, uint dwAddDisposition, [Optional] winmdroot.Security.Cryptography.CERT_CONTEXT** ppStoreContext)
#cfunc global CertAddCertificateContextToStore "CertAddCertificateContextToStore" int, var, int, var

; winmdroot.Foundation.BOOL CertAddCertificateLinkToStore(winmdroot.Security.Cryptography.HCERTSTORE hCertStore, winmdroot.Security.Cryptography.CERT_CONTEXT* pCertContext, uint dwAddDisposition, [Optional] winmdroot.Security.Cryptography.CERT_CONTEXT** ppStoreContext)
#cfunc global CertAddCertificateLinkToStore "CertAddCertificateLinkToStore" int, var, int, var

; winmdroot.Foundation.BOOL CertAddEncodedCRLToStore(winmdroot.Security.Cryptography.HCERTSTORE hCertStore, winmdroot.Security.Cryptography.CERT_QUERY_ENCODING_TYPE dwCertEncodingType, byte* pbCrlEncoded, uint cbCrlEncoded, uint dwAddDisposition, [Optional] winmdroot.Security.Cryptography.CRL_CONTEXT** ppCrlContext)
#cfunc global CertAddEncodedCRLToStore "CertAddEncodedCRLToStore" int, int, var, int, int, var

; winmdroot.Foundation.BOOL CertAddEncodedCTLToStore(winmdroot.Security.Cryptography.HCERTSTORE hCertStore, winmdroot.Security.Cryptography.CERT_QUERY_ENCODING_TYPE dwMsgAndCertEncodingType, byte* pbCtlEncoded, uint cbCtlEncoded, uint dwAddDisposition, [Optional] winmdroot.Security.Cryptography.CTL_CONTEXT** ppCtlContext)
#cfunc global CertAddEncodedCTLToStore "CertAddEncodedCTLToStore" int, int, var, int, int, var

; winmdroot.Foundation.BOOL CertAddEncodedCertificateToStore(winmdroot.Security.Cryptography.HCERTSTORE hCertStore, winmdroot.Security.Cryptography.CERT_QUERY_ENCODING_TYPE dwCertEncodingType, byte* pbCertEncoded, uint cbCertEncoded, uint dwAddDisposition, [Optional] winmdroot.Security.Cryptography.CERT_CONTEXT** ppCertContext)
#cfunc global CertAddEncodedCertificateToStore "CertAddEncodedCertificateToStore" int, int, var, int, int, var

; winmdroot.Foundation.BOOL CertAddEncodedCertificateToSystemStore(winmdroot.Foundation.PCWSTR szCertStoreName, byte* pbCertEncoded, uint cbCertEncoded)
#cfunc global CertAddEncodedCertificateToSystemStoreW "CertAddEncodedCertificateToSystemStoreW" wstr, var, int

; winmdroot.Foundation.BOOL CertAddEnhancedKeyUsageIdentifier(winmdroot.Security.Cryptography.CERT_CONTEXT* pCertContext, winmdroot.Foundation.PCSTR pszUsageIdentifier)
#cfunc global CertAddEnhancedKeyUsageIdentifier "CertAddEnhancedKeyUsageIdentifier" var, str

; void CertAddRefServerOcspResponse([Optional] void* hServerOcspResponse)
#func global CertAddRefServerOcspResponse "CertAddRefServerOcspResponse" intptr

; void CertAddRefServerOcspResponseContext([Optional] winmdroot.Security.Cryptography.CERT_SERVER_OCSP_RESPONSE_CONTEXT* pServerOcspResponseContext)
#func global CertAddRefServerOcspResponseContext "CertAddRefServerOcspResponseContext" var

; winmdroot.Foundation.BOOL CertAddSerializedElementToStore(winmdroot.Security.Cryptography.HCERTSTORE hCertStore, byte* pbElement, uint cbElement, uint dwAddDisposition, uint dwFlags, uint dwContextTypeFlags, [Optional] uint* pdwContextType, [Optional] void** ppvContext)
#cfunc global CertAddSerializedElementToStore "CertAddSerializedElementToStore" int, var, int, int, int, int, var, var

; winmdroot.Foundation.BOOL CertAddStoreToCollection(winmdroot.Security.Cryptography.HCERTSTORE hCollectionStore, winmdroot.Security.Cryptography.HCERTSTORE hSiblingStore, uint dwUpdateFlags, uint dwPriority)
#cfunc global CertAddStoreToCollection "CertAddStoreToCollection" int, int, int, int

; winmdroot.Foundation.PCSTR CertAlgIdToOID(uint dwAlgId)
#cfunc global CertAlgIdToOID "CertAlgIdToOID" int

; void CertCloseServerOcspResponse([Optional] void* hServerOcspResponse, uint dwFlags)
#func global CertCloseServerOcspResponse "CertCloseServerOcspResponse" intptr, int

; winmdroot.Foundation.BOOL CertCloseStore(winmdroot.Security.Cryptography.HCERTSTORE hCertStore, uint dwFlags)
#cfunc global CertCloseStore "CertCloseStore" int, int

; winmdroot.Foundation.BOOL CertCompareCertificate(winmdroot.Security.Cryptography.CERT_QUERY_ENCODING_TYPE dwCertEncodingType, winmdroot.Security.Cryptography.CERT_INFO* pCertId1, winmdroot.Security.Cryptography.CERT_INFO* pCertId2)
#cfunc global CertCompareCertificate "CertCompareCertificate" int, var, var

; winmdroot.Foundation.BOOL CertCompareCertificateName(winmdroot.Security.Cryptography.CERT_QUERY_ENCODING_TYPE dwCertEncodingType, winmdroot.Security.Cryptography.CRYPT_INTEGER_BLOB* pCertName1, winmdroot.Security.Cryptography.CRYPT_INTEGER_BLOB* pCertName2)
#cfunc global CertCompareCertificateName "CertCompareCertificateName" int, var, var

; winmdroot.Foundation.BOOL CertCompareIntegerBlob(winmdroot.Security.Cryptography.CRYPT_INTEGER_BLOB* pInt1, winmdroot.Security.Cryptography.CRYPT_INTEGER_BLOB* pInt2)
#cfunc global CertCompareIntegerBlob "CertCompareIntegerBlob" var, var

; winmdroot.Foundation.BOOL CertComparePublicKeyInfo(winmdroot.Security.Cryptography.CERT_QUERY_ENCODING_TYPE dwCertEncodingType, winmdroot.Security.Cryptography.CERT_PUBLIC_KEY_INFO* pPublicKey1, winmdroot.Security.Cryptography.CERT_PUBLIC_KEY_INFO* pPublicKey2)
#cfunc global CertComparePublicKeyInfo "CertComparePublicKeyInfo" int, var, var

; winmdroot.Foundation.BOOL CertControlStore(winmdroot.Security.Cryptography.HCERTSTORE hCertStore, winmdroot.Security.Cryptography.CERT_CONTROL_STORE_FLAGS dwFlags, uint dwCtrlType, [Optional] void* pvCtrlPara)
#cfunc global CertControlStore "CertControlStore" int, int, int, intptr

; winmdroot.Security.Cryptography.CRL_CONTEXT* CertCreateCRLContext(winmdroot.Security.Cryptography.CERT_QUERY_ENCODING_TYPE dwCertEncodingType, byte* pbCrlEncoded, uint cbCrlEncoded)
#cfunc global CertCreateCRLContext "CertCreateCRLContext" int, var, int

; winmdroot.Security.Cryptography.CTL_CONTEXT* CertCreateCTLContext(uint dwMsgAndCertEncodingType, byte* pbCtlEncoded, uint cbCtlEncoded)
#cfunc global CertCreateCTLContext "CertCreateCTLContext" int, var, int

; winmdroot.Foundation.BOOL CertCreateCTLEntryFromCertificateContextProperties(winmdroot.Security.Cryptography.CERT_CONTEXT* pCertContext, uint cOptAttr, [Optional] winmdroot.Security.Cryptography.CRYPT_ATTRIBUTE* rgOptAttr, uint dwFlags, [Optional] void* pvReserved, [Optional] winmdroot.Security.Cryptography.CTL_ENTRY* pCtlEntry, uint* pcbCtlEntry)
#cfunc global CertCreateCTLEntryFromCertificateContextProperties "CertCreateCTLEntryFromCertificateContextProperties" var, int, var, int, intptr, var, var

; void CertFreeCertificateChainEngine(winmdroot.Security.Cryptography.HCERTCHAINENGINE hChainEngine)
#func global CertFreeCertificateChainEngine "CertFreeCertificateChainEngine" intptr

; winmdroot.Foundation.BOOL CertCreateCertificateChainEngine(winmdroot.Security.Cryptography.CERT_CHAIN_ENGINE_CONFIG* pConfig, winmdroot.Security.Cryptography.HCERTCHAINENGINE* phChainEngine)
#cfunc global CertCreateCertificateChainEngine "CertCreateCertificateChainEngine" var, intptr

; winmdroot.Security.Cryptography.CERT_CONTEXT* CertCreateCertificateContext(winmdroot.Security.Cryptography.CERT_QUERY_ENCODING_TYPE dwCertEncodingType, byte* pbCertEncoded, uint cbCertEncoded)
#cfunc global CertCreateCertificateContext "CertCreateCertificateContext" int, var, int

; void* CertCreateContext(uint dwContextType, uint dwEncodingType, byte* pbEncoded, uint cbEncoded, uint dwFlags, [Optional] winmdroot.Security.Cryptography.CERT_CREATE_CONTEXT_PARA* pCreatePara)
#cfunc global CertCreateContext "CertCreateContext" int, int, var, int, int, var

; winmdroot.Security.Cryptography.CERT_CONTEXT* CertCreateSelfSignCertificate(winmdroot.Security.Cryptography.HCRYPTPROV_OR_NCRYPT_KEY_HANDLE hCryptProvOrNCryptKey, winmdroot.Security.Cryptography.CRYPT_INTEGER_BLOB* pSubjectIssuerBlob, winmdroot.Security.Cryptography.CERT_CREATE_SELFSIGN_FLAGS dwFlags, [Optional] winmdroot.Security.Cryptography.CRYPT_KEY_PROV_INFO* pKeyProvInfo, [Optional] winmdroot.Security.Cryptography.CRYPT_ALGORITHM_IDENTIFIER* pSignatureAlgorithm, [Optional] winmdroot.Foundation.SYSTEMTIME* pStartTime, [Optional] winmdroot.Foundation.SYSTEMTIME* pEndTime, [Optional] winmdroot.Security.Cryptography.CERT_EXTENSIONS* pExtensions)
#cfunc global CertCreateSelfSignCertificate "CertCreateSelfSignCertificate" int, var, int, var, var, var, var, var

; winmdroot.Foundation.BOOL CertDeleteCRLFromStore(winmdroot.Security.Cryptography.CRL_CONTEXT* pCrlContext)
#cfunc global CertDeleteCRLFromStore "CertDeleteCRLFromStore" var

; winmdroot.Foundation.BOOL CertDeleteCTLFromStore(winmdroot.Security.Cryptography.CTL_CONTEXT* pCtlContext)
#cfunc global CertDeleteCTLFromStore "CertDeleteCTLFromStore" var

; winmdroot.Foundation.BOOL CertDeleteCertificateFromStore(winmdroot.Security.Cryptography.CERT_CONTEXT* pCertContext)
#cfunc global CertDeleteCertificateFromStore "CertDeleteCertificateFromStore" var

; winmdroot.Security.Cryptography.CRL_CONTEXT* CertDuplicateCRLContext([Optional] winmdroot.Security.Cryptography.CRL_CONTEXT* pCrlContext)
#cfunc global CertDuplicateCRLContext "CertDuplicateCRLContext" var

; winmdroot.Security.Cryptography.CTL_CONTEXT* CertDuplicateCTLContext([Optional] winmdroot.Security.Cryptography.CTL_CONTEXT* pCtlContext)
#cfunc global CertDuplicateCTLContext "CertDuplicateCTLContext" var

; winmdroot.Security.Cryptography.CERT_CHAIN_CONTEXT* CertDuplicateCertificateChain(winmdroot.Security.Cryptography.CERT_CHAIN_CONTEXT* pChainContext)
#cfunc global CertDuplicateCertificateChain "CertDuplicateCertificateChain" var

; winmdroot.Security.Cryptography.CERT_CONTEXT* CertDuplicateCertificateContext([Optional] winmdroot.Security.Cryptography.CERT_CONTEXT* pCertContext)
#cfunc global CertDuplicateCertificateContext "CertDuplicateCertificateContext" var

; winmdroot.Security.Cryptography.HCERTSTORE CertDuplicateStore(winmdroot.Security.Cryptography.HCERTSTORE hCertStore)
#cfunc global CertDuplicateStore "CertDuplicateStore" int

; uint CertEnumCRLContextProperties(winmdroot.Security.Cryptography.CRL_CONTEXT* pCrlContext, uint dwPropId)
#cfunc global CertEnumCRLContextProperties "CertEnumCRLContextProperties" var, int

; winmdroot.Security.Cryptography.CRL_CONTEXT* CertEnumCRLsInStore(winmdroot.Security.Cryptography.HCERTSTORE hCertStore, [Optional] winmdroot.Security.Cryptography.CRL_CONTEXT* pPrevCrlContext)
#cfunc global CertEnumCRLsInStore "CertEnumCRLsInStore" int, var

; uint CertEnumCTLContextProperties(winmdroot.Security.Cryptography.CTL_CONTEXT* pCtlContext, uint dwPropId)
#cfunc global CertEnumCTLContextProperties "CertEnumCTLContextProperties" var, int

; winmdroot.Security.Cryptography.CTL_CONTEXT* CertEnumCTLsInStore(winmdroot.Security.Cryptography.HCERTSTORE hCertStore, [Optional] winmdroot.Security.Cryptography.CTL_CONTEXT* pPrevCtlContext)
#cfunc global CertEnumCTLsInStore "CertEnumCTLsInStore" int, var

; uint CertEnumCertificateContextProperties(winmdroot.Security.Cryptography.CERT_CONTEXT* pCertContext, uint dwPropId)
#cfunc global CertEnumCertificateContextProperties "CertEnumCertificateContextProperties" var, int

; winmdroot.Security.Cryptography.CERT_CONTEXT* CertEnumCertificatesInStore(winmdroot.Security.Cryptography.HCERTSTORE hCertStore, [Optional] winmdroot.Security.Cryptography.CERT_CONTEXT* pPrevCertContext)
#cfunc global CertEnumCertificatesInStore "CertEnumCertificatesInStore" int, var

; winmdroot.Foundation.BOOL CertEnumPhysicalStore(void* pvSystemStore, uint dwFlags, [Optional] void* pvArg, delegate *unmanaged[Stdcall]<void*,uint,winmdroot.Foundation.PCWSTR,global::Windows.Win32.Security.Cryptography.CERT_PHYSICAL_STORE_INFO*,void*,void*,global::Windows.Win32.Foundation.BOOL> pfnEnum)
#cfunc global CertEnumPhysicalStore "CertEnumPhysicalStore" intptr, int, intptr, int

; winmdroot.Foundation.BOOL CertEnumSubjectInSortedCTL(winmdroot.Security.Cryptography.CTL_CONTEXT* pCtlContext, void** ppvNextSubject, [Optional] winmdroot.Security.Cryptography.CRYPT_INTEGER_BLOB* pSubjectIdentifier, [Optional] winmdroot.Security.Cryptography.CRYPT_INTEGER_BLOB* pEncodedAttributes)
#cfunc global CertEnumSubjectInSortedCTL "CertEnumSubjectInSortedCTL" var, var, var, var

; winmdroot.Foundation.BOOL CertEnumSystemStore(uint dwFlags, [Optional] void* pvSystemStoreLocationPara, [Optional] void* pvArg, delegate *unmanaged[Stdcall]<void*,global::Windows.Win32.Security.Cryptography.CERT_SYSTEM_STORE_FLAGS,global::Windows.Win32.Security.Cryptography.CERT_SYSTEM_STORE_INFO*,void*,void*,global::Windows.Win32.Foundation.BOOL> pfnEnum)
#cfunc global CertEnumSystemStore "CertEnumSystemStore" int, intptr, intptr, int

; winmdroot.Foundation.BOOL CertEnumSystemStoreLocation(uint dwFlags, [Optional] void* pvArg, delegate *unmanaged[Stdcall]<winmdroot.Foundation.PCWSTR,uint,void*,void*,global::Windows.Win32.Foundation.BOOL> pfnEnum)
#cfunc global CertEnumSystemStoreLocation "CertEnumSystemStoreLocation" int, intptr, int

; winmdroot.Security.Cryptography.CRYPT_ATTRIBUTE* CertFindAttribute(winmdroot.Foundation.PCSTR pszObjId, uint cAttr, winmdroot.Security.Cryptography.CRYPT_ATTRIBUTE* rgAttr)
#cfunc global CertFindAttribute "CertFindAttribute" str, int, var

; winmdroot.Security.Cryptography.CRL_CONTEXT* CertFindCRLInStore(winmdroot.Security.Cryptography.HCERTSTORE hCertStore, winmdroot.Security.Cryptography.CERT_QUERY_ENCODING_TYPE dwCertEncodingType, uint dwFindFlags, uint dwFindType, [Optional] void* pvFindPara, [Optional] winmdroot.Security.Cryptography.CRL_CONTEXT* pPrevCrlContext)
#cfunc global CertFindCRLInStore "CertFindCRLInStore" int, int, int, int, intptr, var

; winmdroot.Security.Cryptography.CTL_CONTEXT* CertFindCTLInStore(winmdroot.Security.Cryptography.HCERTSTORE hCertStore, uint dwMsgAndCertEncodingType, uint dwFindFlags, winmdroot.Security.Cryptography.CERT_FIND_TYPE dwFindType, [Optional] void* pvFindPara, [Optional] winmdroot.Security.Cryptography.CTL_CONTEXT* pPrevCtlContext)
#cfunc global CertFindCTLInStore "CertFindCTLInStore" int, int, int, int, intptr, var

; winmdroot.Foundation.BOOL CertFindCertificateInCRL(winmdroot.Security.Cryptography.CERT_CONTEXT* pCert, winmdroot.Security.Cryptography.CRL_CONTEXT* pCrlContext, uint dwFlags, [Optional] void* pvReserved, winmdroot.Security.Cryptography.CRL_ENTRY** ppCrlEntry)
#cfunc global CertFindCertificateInCRL "CertFindCertificateInCRL" var, var, int, intptr, var

; winmdroot.Security.Cryptography.CERT_CONTEXT* CertFindCertificateInStore(winmdroot.Security.Cryptography.HCERTSTORE hCertStore, winmdroot.Security.Cryptography.CERT_QUERY_ENCODING_TYPE dwCertEncodingType, uint dwFindFlags, winmdroot.Security.Cryptography.CERT_FIND_FLAGS dwFindType, [Optional] void* pvFindPara, [Optional] winmdroot.Security.Cryptography.CERT_CONTEXT* pPrevCertContext)
#cfunc global CertFindCertificateInStore "CertFindCertificateInStore" int, int, int, int, intptr, var

; winmdroot.Security.Cryptography.CERT_CHAIN_CONTEXT* CertFindChainInStore(winmdroot.Security.Cryptography.HCERTSTORE hCertStore, winmdroot.Security.Cryptography.CERT_QUERY_ENCODING_TYPE dwCertEncodingType, winmdroot.Security.Cryptography.CERT_FIND_CHAIN_IN_STORE_FLAGS dwFindFlags, uint dwFindType, [Optional] void* pvFindPara, [Optional] winmdroot.Security.Cryptography.CERT_CHAIN_CONTEXT* pPrevChainContext)
#cfunc global CertFindChainInStore "CertFindChainInStore" int, int, int, int, intptr, var

; winmdroot.Security.Cryptography.CERT_EXTENSION* CertFindExtension(winmdroot.Foundation.PCSTR pszObjId, uint cExtensions, winmdroot.Security.Cryptography.CERT_EXTENSION* rgExtensions)
#cfunc global CertFindExtension "CertFindExtension" str, int, var

; winmdroot.Security.Cryptography.CERT_RDN_ATTR* CertFindRDNAttr(winmdroot.Foundation.PCSTR pszObjId, winmdroot.Security.Cryptography.CERT_NAME_INFO* pName)
#cfunc global CertFindRDNAttr "CertFindRDNAttr" str, var

; winmdroot.Security.Cryptography.CTL_ENTRY* CertFindSubjectInCTL(uint dwEncodingType, uint dwSubjectType, void* pvSubject, winmdroot.Security.Cryptography.CTL_CONTEXT* pCtlContext, uint dwFlags)
#cfunc global CertFindSubjectInCTL "CertFindSubjectInCTL" int, int, intptr, var, int

; winmdroot.Foundation.BOOL CertFindSubjectInSortedCTL(winmdroot.Security.Cryptography.CRYPT_INTEGER_BLOB* pSubjectIdentifier, winmdroot.Security.Cryptography.CTL_CONTEXT* pCtlContext, uint dwFlags, [Optional] void* pvReserved, [Optional] winmdroot.Security.Cryptography.CRYPT_INTEGER_BLOB* pEncodedAttributes)
#cfunc global CertFindSubjectInSortedCTL "CertFindSubjectInSortedCTL" var, var, int, intptr, var

; winmdroot.Foundation.BOOL CertFreeCRLContext([Optional] winmdroot.Security.Cryptography.CRL_CONTEXT* pCrlContext)
#cfunc global CertFreeCRLContext "CertFreeCRLContext" var

; winmdroot.Foundation.BOOL CertFreeCTLContext([Optional] winmdroot.Security.Cryptography.CTL_CONTEXT* pCtlContext)
#cfunc global CertFreeCTLContext "CertFreeCTLContext" var

; void CertFreeCertificateChain(winmdroot.Security.Cryptography.CERT_CHAIN_CONTEXT* pChainContext)
#func global CertFreeCertificateChain "CertFreeCertificateChain" var

; void CertFreeCertificateChainList(winmdroot.Security.Cryptography.CERT_CHAIN_CONTEXT** prgpSelection)
#func global CertFreeCertificateChainList "CertFreeCertificateChainList" var

; winmdroot.Foundation.BOOL CertFreeCertificateContext([Optional] winmdroot.Security.Cryptography.CERT_CONTEXT* pCertContext)
#cfunc global CertFreeCertificateContext "CertFreeCertificateContext" var

; void CertFreeServerOcspResponseContext([Optional] winmdroot.Security.Cryptography.CERT_SERVER_OCSP_RESPONSE_CONTEXT* pServerOcspResponseContext)
#func global CertFreeServerOcspResponseContext "CertFreeServerOcspResponseContext" var

; winmdroot.Foundation.BOOL CertGetCRLContextProperty(winmdroot.Security.Cryptography.CRL_CONTEXT* pCrlContext, uint dwPropId, [Optional] void* pvData, uint* pcbData)
#cfunc global CertGetCRLContextProperty "CertGetCRLContextProperty" var, int, intptr, var

; winmdroot.Security.Cryptography.CRL_CONTEXT* CertGetCRLFromStore(winmdroot.Security.Cryptography.HCERTSTORE hCertStore, [Optional] winmdroot.Security.Cryptography.CERT_CONTEXT* pIssuerContext, [Optional] winmdroot.Security.Cryptography.CRL_CONTEXT* pPrevCrlContext, uint* pdwFlags)
#cfunc global CertGetCRLFromStore "CertGetCRLFromStore" int, var, var, var

; winmdroot.Foundation.BOOL CertGetCTLContextProperty(winmdroot.Security.Cryptography.CTL_CONTEXT* pCtlContext, uint dwPropId, [Optional] void* pvData, uint* pcbData)
#cfunc global CertGetCTLContextProperty "CertGetCTLContextProperty" var, int, intptr, var

; winmdroot.Foundation.BOOL CertGetCertificateChain(winmdroot.Security.Cryptography.HCERTCHAINENGINE hChainEngine, winmdroot.Security.Cryptography.CERT_CONTEXT* pCertContext, [Optional] global::System.Runtime.InteropServices.ComTypes.FILETIME* pTime, winmdroot.Security.Cryptography.HCERTSTORE hAdditionalStore, winmdroot.Security.Cryptography.CERT_CHAIN_PARA* pChainPara, uint dwFlags, [Optional] void* pvReserved, winmdroot.Security.Cryptography.CERT_CHAIN_CONTEXT** ppChainContext)
#cfunc global CertGetCertificateChain "CertGetCertificateChain" intptr, var, var, int, var, int, intptr, var

; winmdroot.Foundation.BOOL CertGetCertificateContextProperty(winmdroot.Security.Cryptography.CERT_CONTEXT* pCertContext, uint dwPropId, [Optional] void* pvData, uint* pcbData)
#cfunc global CertGetCertificateContextProperty "CertGetCertificateContextProperty" var, int, intptr, var

; winmdroot.Foundation.BOOL CertGetEnhancedKeyUsage(winmdroot.Security.Cryptography.CERT_CONTEXT* pCertContext, uint dwFlags, [Optional] winmdroot.Security.Cryptography.CTL_USAGE* pUsage, uint* pcbUsage)
#cfunc global CertGetEnhancedKeyUsage "CertGetEnhancedKeyUsage" var, int, var, var

; winmdroot.Foundation.BOOL CertGetIntendedKeyUsage(winmdroot.Security.Cryptography.CERT_QUERY_ENCODING_TYPE dwCertEncodingType, winmdroot.Security.Cryptography.CERT_INFO* pCertInfo, byte* pbKeyUsage, uint cbKeyUsage)
#cfunc global CertGetIntendedKeyUsage "CertGetIntendedKeyUsage" int, var, var, int

; winmdroot.Security.Cryptography.CERT_CONTEXT* CertGetIssuerCertificateFromStore(winmdroot.Security.Cryptography.HCERTSTORE hCertStore, winmdroot.Security.Cryptography.CERT_CONTEXT* pSubjectContext, [Optional] winmdroot.Security.Cryptography.CERT_CONTEXT* pPrevIssuerContext, uint* pdwFlags)
#cfunc global CertGetIssuerCertificateFromStore "CertGetIssuerCertificateFromStore" int, var, var, var

; uint CertGetNameStringW(winmdroot.Security.Cryptography.CERT_CONTEXT* pCertContext, uint dwType, uint dwFlags, [Optional] void* pvTypePara, winmdroot.Foundation.PWSTR pszNameString, uint cchNameString)
#cfunc global CertGetNameStringW "CertGetNameStringW" var, int, int, intptr, wstr, int

; uint CertGetPublicKeyLength(winmdroot.Security.Cryptography.CERT_QUERY_ENCODING_TYPE dwCertEncodingType, winmdroot.Security.Cryptography.CERT_PUBLIC_KEY_INFO* pPublicKey)
#cfunc global CertGetPublicKeyLength "CertGetPublicKeyLength" int, var

; winmdroot.Security.Cryptography.CERT_SERVER_OCSP_RESPONSE_CONTEXT* CertGetServerOcspResponseContext(void* hServerOcspResponse, uint dwFlags, [Optional] void* pvReserved)
#cfunc global CertGetServerOcspResponseContext "CertGetServerOcspResponseContext" intptr, int, intptr

; winmdroot.Foundation.BOOL CertGetStoreProperty(winmdroot.Security.Cryptography.HCERTSTORE hCertStore, uint dwPropId, [Optional] void* pvData, uint* pcbData)
#cfunc global CertGetStoreProperty "CertGetStoreProperty" int, int, intptr, var

; winmdroot.Security.Cryptography.CERT_CONTEXT* CertGetSubjectCertificateFromStore(winmdroot.Security.Cryptography.HCERTSTORE hCertStore, winmdroot.Security.Cryptography.CERT_QUERY_ENCODING_TYPE dwCertEncodingType, winmdroot.Security.Cryptography.CERT_INFO* pCertId)
#cfunc global CertGetSubjectCertificateFromStore "CertGetSubjectCertificateFromStore" int, int, var

; winmdroot.Foundation.BOOL CertGetValidUsages(uint cCerts, winmdroot.Security.Cryptography.CERT_CONTEXT** rghCerts, int* cNumOIDs, [Optional] winmdroot.Foundation.PSTR* rghOIDs, uint* pcbOIDs)
#cfunc global CertGetValidUsages "CertGetValidUsages" int, var, var, var, var

; winmdroot.Foundation.BOOL CertIsRDNAttrsInCertificateName(winmdroot.Security.Cryptography.CERT_QUERY_ENCODING_TYPE dwCertEncodingType, uint dwFlags, winmdroot.Security.Cryptography.CRYPT_INTEGER_BLOB* pCertName, winmdroot.Security.Cryptography.CERT_RDN* pRDN)
#cfunc global CertIsRDNAttrsInCertificateName "CertIsRDNAttrsInCertificateName" int, int, var, var

; winmdroot.Foundation.BOOL CertIsStrongHashToSign(winmdroot.Security.Cryptography.CERT_STRONG_SIGN_PARA* pStrongSignPara, winmdroot.Foundation.PCWSTR pwszCNGHashAlgid, [Optional] winmdroot.Security.Cryptography.CERT_CONTEXT* pSigningCert)
#cfunc global CertIsStrongHashToSign "CertIsStrongHashToSign" var, wstr, var

; winmdroot.Foundation.BOOL CertIsValidCRLForCertificate(winmdroot.Security.Cryptography.CERT_CONTEXT* pCert, winmdroot.Security.Cryptography.CRL_CONTEXT* pCrl, uint dwFlags, [Optional] void* pvReserved)
#cfunc global CertIsValidCRLForCertificate "CertIsValidCRLForCertificate" var, var, int, intptr

; winmdroot.Foundation.BOOL CertIsWeakHash(uint dwHashUseType, winmdroot.Foundation.PCWSTR pwszCNGHashAlgid, uint dwChainFlags, [Optional] winmdroot.Security.Cryptography.CERT_CHAIN_CONTEXT* pSignerChainContext, [Optional] global::System.Runtime.InteropServices.ComTypes.FILETIME* pTimeStamp, winmdroot.Foundation.PCWSTR pwszFileName)
#cfunc global CertIsWeakHash "CertIsWeakHash" int, wstr, int, var, var, wstr

; uint CertNameToStrW(winmdroot.Security.Cryptography.CERT_QUERY_ENCODING_TYPE dwCertEncodingType, winmdroot.Security.Cryptography.CRYPT_INTEGER_BLOB* pName, winmdroot.Security.Cryptography.CERT_STRING_TYPE dwStrType, winmdroot.Foundation.PWSTR psz, uint csz)
#cfunc global CertNameToStrW "CertNameToStrW" int, var, int, wstr, int

; uint CertOIDToAlgId(winmdroot.Foundation.PCSTR pszObjId)
#cfunc global CertOIDToAlgId "CertOIDToAlgId" str

; void* CertOpenServerOcspResponse(winmdroot.Security.Cryptography.CERT_CHAIN_CONTEXT* pChainContext, uint dwFlags, [Optional] winmdroot.Security.Cryptography.CERT_SERVER_OCSP_RESPONSE_OPEN_PARA* pOpenPara)
#cfunc global CertOpenServerOcspResponse "CertOpenServerOcspResponse" var, int, var

; winmdroot.Security.Cryptography.HCERTSTORE CertOpenStore(winmdroot.Foundation.PCSTR lpszStoreProvider, winmdroot.Security.Cryptography.CERT_QUERY_ENCODING_TYPE dwEncodingType, winmdroot.Security.Cryptography.HCRYPTPROV_LEGACY hCryptProv, winmdroot.Security.Cryptography.CERT_OPEN_STORE_FLAGS dwFlags, [Optional] void* pvPara)
#cfunc global CertOpenStore "CertOpenStore" str, int, int, int, intptr

; winmdroot.Security.Cryptography.HCERTSTORE CertOpenSystemStore(winmdroot.Security.Cryptography.HCRYPTPROV_LEGACY hProv, winmdroot.Foundation.PCWSTR szSubsystemProtocol)
#cfunc global CertOpenSystemStoreW "CertOpenSystemStoreW" int, wstr

; uint CertRDNValueToStrW(uint dwValueType, winmdroot.Security.Cryptography.CRYPT_INTEGER_BLOB* pValue, winmdroot.Foundation.PWSTR psz, uint csz)
#cfunc global CertRDNValueToStrW "CertRDNValueToStrW" int, var, wstr, int

; winmdroot.Foundation.BOOL CertRegisterPhysicalStore(void* pvSystemStore, uint dwFlags, winmdroot.Foundation.PCWSTR pwszStoreName, winmdroot.Security.Cryptography.CERT_PHYSICAL_STORE_INFO* pStoreInfo, [Optional] void* pvReserved)
#cfunc global CertRegisterPhysicalStore "CertRegisterPhysicalStore" intptr, int, wstr, var, intptr

; winmdroot.Foundation.BOOL CertRegisterSystemStore(void* pvSystemStore, uint dwFlags, [Optional] winmdroot.Security.Cryptography.CERT_SYSTEM_STORE_INFO* pStoreInfo, [Optional] void* pvReserved)
#cfunc global CertRegisterSystemStore "CertRegisterSystemStore" intptr, int, var, intptr

; winmdroot.Foundation.BOOL CertRemoveEnhancedKeyUsageIdentifier(winmdroot.Security.Cryptography.CERT_CONTEXT* pCertContext, winmdroot.Foundation.PCSTR pszUsageIdentifier)
#cfunc global CertRemoveEnhancedKeyUsageIdentifier "CertRemoveEnhancedKeyUsageIdentifier" var, str

; void CertRemoveStoreFromCollection(winmdroot.Security.Cryptography.HCERTSTORE hCollectionStore, winmdroot.Security.Cryptography.HCERTSTORE hSiblingStore)
#func global CertRemoveStoreFromCollection "CertRemoveStoreFromCollection" int, int

; winmdroot.Foundation.BOOL CertResyncCertificateChainEngine(winmdroot.Security.Cryptography.HCERTCHAINENGINE hChainEngine)
#cfunc global CertResyncCertificateChainEngine "CertResyncCertificateChainEngine" intptr

; winmdroot.Foundation.BOOL CertRetrieveLogoOrBiometricInfo(winmdroot.Security.Cryptography.CERT_CONTEXT* pCertContext, winmdroot.Foundation.PCSTR lpszLogoOrBiometricType, uint dwRetrievalFlags, uint dwTimeout, uint dwFlags, [Optional] void* pvReserved, byte** ppbData, uint* pcbData, [Optional] winmdroot.Foundation.PWSTR* ppwszMimeType)
#cfunc global CertRetrieveLogoOrBiometricInfo "CertRetrieveLogoOrBiometricInfo" var, str, int, int, int, intptr, var, var, var

; winmdroot.Foundation.BOOL CertSaveStore(winmdroot.Security.Cryptography.HCERTSTORE hCertStore, winmdroot.Security.Cryptography.CERT_QUERY_ENCODING_TYPE dwEncodingType, winmdroot.Security.Cryptography.CERT_STORE_SAVE_AS dwSaveAs, winmdroot.Security.Cryptography.CERT_STORE_SAVE_TO dwSaveTo, void* pvSaveToPara, uint dwFlags)
#cfunc global CertSaveStore "CertSaveStore" int, int, int, int, intptr, int

; winmdroot.Foundation.BOOL CertSelectCertificateChains([Optional] global::System.Guid* pSelectionContext, uint dwFlags, [Optional] winmdroot.Security.Cryptography.CERT_SELECT_CHAIN_PARA* pChainParameters, uint cCriteria, [Optional] winmdroot.Security.Cryptography.CERT_SELECT_CRITERIA* rgpCriteria, winmdroot.Security.Cryptography.HCERTSTORE hStore, uint* pcSelection, winmdroot.Security.Cryptography.CERT_CHAIN_CONTEXT*** pprgpSelection)
#cfunc global CertSelectCertificateChains "CertSelectCertificateChains" var, int, var, int, var, int, var, var

; winmdroot.Foundation.BOOL CertSerializeCRLStoreElement(winmdroot.Security.Cryptography.CRL_CONTEXT* pCrlContext, uint dwFlags, [Optional] byte* pbElement, uint* pcbElement)
#cfunc global CertSerializeCRLStoreElement "CertSerializeCRLStoreElement" var, int, var, var

; winmdroot.Foundation.BOOL CertSerializeCTLStoreElement(winmdroot.Security.Cryptography.CTL_CONTEXT* pCtlContext, uint dwFlags, [Optional] byte* pbElement, uint* pcbElement)
#cfunc global CertSerializeCTLStoreElement "CertSerializeCTLStoreElement" var, int, var, var

; winmdroot.Foundation.BOOL CertSerializeCertificateStoreElement(winmdroot.Security.Cryptography.CERT_CONTEXT* pCertContext, uint dwFlags, [Optional] byte* pbElement, uint* pcbElement)
#cfunc global CertSerializeCertificateStoreElement "CertSerializeCertificateStoreElement" var, int, var, var

; winmdroot.Foundation.BOOL CertSetCRLContextProperty(winmdroot.Security.Cryptography.CRL_CONTEXT* pCrlContext, uint dwPropId, uint dwFlags, [Optional] void* pvData)
#cfunc global CertSetCRLContextProperty "CertSetCRLContextProperty" var, int, int, intptr

; winmdroot.Foundation.BOOL CertSetCTLContextProperty(winmdroot.Security.Cryptography.CTL_CONTEXT* pCtlContext, uint dwPropId, uint dwFlags, [Optional] void* pvData)
#cfunc global CertSetCTLContextProperty "CertSetCTLContextProperty" var, int, int, intptr

; winmdroot.Foundation.BOOL CertSetCertificateContextPropertiesFromCTLEntry(winmdroot.Security.Cryptography.CERT_CONTEXT* pCertContext, winmdroot.Security.Cryptography.CTL_ENTRY* pCtlEntry, uint dwFlags)
#cfunc global CertSetCertificateContextPropertiesFromCTLEntry "CertSetCertificateContextPropertiesFromCTLEntry" var, var, int

; winmdroot.Foundation.BOOL CertSetCertificateContextProperty(winmdroot.Security.Cryptography.CERT_CONTEXT* pCertContext, uint dwPropId, uint dwFlags, [Optional] void* pvData)
#cfunc global CertSetCertificateContextProperty "CertSetCertificateContextProperty" var, int, int, intptr

; winmdroot.Foundation.BOOL CertSetEnhancedKeyUsage(winmdroot.Security.Cryptography.CERT_CONTEXT* pCertContext, [Optional] winmdroot.Security.Cryptography.CTL_USAGE* pUsage)
#cfunc global CertSetEnhancedKeyUsage "CertSetEnhancedKeyUsage" var, var

; winmdroot.Foundation.BOOL CertSetStoreProperty(winmdroot.Security.Cryptography.HCERTSTORE hCertStore, uint dwPropId, uint dwFlags, [Optional] void* pvData)
#cfunc global CertSetStoreProperty "CertSetStoreProperty" int, int, int, intptr

; winmdroot.Foundation.BOOL CertStrToName(winmdroot.Security.Cryptography.CERT_QUERY_ENCODING_TYPE dwCertEncodingType, winmdroot.Foundation.PCWSTR pszX500, winmdroot.Security.Cryptography.CERT_STRING_TYPE dwStrType, [Optional] void* pvReserved, [Optional] byte* pbEncoded, uint* pcbEncoded, [Optional] winmdroot.Foundation.PCWSTR* ppszError)
#cfunc global CertStrToNameW "CertStrToNameW" int, wstr, int, intptr, var, var, var

; winmdroot.Foundation.BOOL CertUnregisterPhysicalStore(void* pvSystemStore, uint dwFlags, winmdroot.Foundation.PCWSTR pwszStoreName)
#cfunc global CertUnregisterPhysicalStore "CertUnregisterPhysicalStore" intptr, int, wstr

; winmdroot.Foundation.BOOL CertUnregisterSystemStore(void* pvSystemStore, uint dwFlags)
#cfunc global CertUnregisterSystemStore "CertUnregisterSystemStore" intptr, int

; winmdroot.Foundation.BOOL CertVerifyCRLRevocation(winmdroot.Security.Cryptography.CERT_QUERY_ENCODING_TYPE dwCertEncodingType, winmdroot.Security.Cryptography.CERT_INFO* pCertId, uint cCrlInfo, winmdroot.Security.Cryptography.CRL_INFO** rgpCrlInfo)
#cfunc global CertVerifyCRLRevocation "CertVerifyCRLRevocation" int, var, int, var

; int CertVerifyCRLTimeValidity([Optional] global::System.Runtime.InteropServices.ComTypes.FILETIME* pTimeToVerify, winmdroot.Security.Cryptography.CRL_INFO* pCrlInfo)
#cfunc global CertVerifyCRLTimeValidity "CertVerifyCRLTimeValidity" var, var

; winmdroot.Foundation.BOOL CertVerifyCTLUsage(uint dwEncodingType, uint dwSubjectType, void* pvSubject, winmdroot.Security.Cryptography.CTL_USAGE* pSubjectUsage, uint dwFlags, [Optional] winmdroot.Security.Cryptography.CTL_VERIFY_USAGE_PARA* pVerifyUsagePara, winmdroot.Security.Cryptography.CTL_VERIFY_USAGE_STATUS* pVerifyUsageStatus)
#cfunc global CertVerifyCTLUsage "CertVerifyCTLUsage" int, int, intptr, var, int, var, var

; winmdroot.Foundation.BOOL CertVerifyCertificateChainPolicy(winmdroot.Foundation.PCSTR pszPolicyOID, winmdroot.Security.Cryptography.CERT_CHAIN_CONTEXT* pChainContext, winmdroot.Security.Cryptography.CERT_CHAIN_POLICY_PARA* pPolicyPara, winmdroot.Security.Cryptography.CERT_CHAIN_POLICY_STATUS* pPolicyStatus)
#cfunc global CertVerifyCertificateChainPolicy "CertVerifyCertificateChainPolicy" str, var, var, var

; winmdroot.Foundation.BOOL CertVerifyRevocation(uint dwEncodingType, uint dwRevType, uint cContext, void** rgpvContext, uint dwFlags, [Optional] winmdroot.Security.Cryptography.CERT_REVOCATION_PARA* pRevPara, winmdroot.Security.Cryptography.CERT_REVOCATION_STATUS* pRevStatus)
#cfunc global CertVerifyRevocation "CertVerifyRevocation" int, int, int, var, int, var, var

; winmdroot.Foundation.BOOL CertVerifySubjectCertificateContext(winmdroot.Security.Cryptography.CERT_CONTEXT* pSubject, [Optional] winmdroot.Security.Cryptography.CERT_CONTEXT* pIssuer, uint* pdwFlags)
#cfunc global CertVerifySubjectCertificateContext "CertVerifySubjectCertificateContext" var, var, var

; int CertVerifyTimeValidity([Optional] global::System.Runtime.InteropServices.ComTypes.FILETIME* pTimeToVerify, winmdroot.Security.Cryptography.CERT_INFO* pCertInfo)
#cfunc global CertVerifyTimeValidity "CertVerifyTimeValidity" var, var

; winmdroot.Foundation.BOOL CertVerifyValidityNesting(winmdroot.Security.Cryptography.CERT_INFO* pSubjectInfo, winmdroot.Security.Cryptography.CERT_INFO* pIssuerInfo)
#cfunc global CertVerifyValidityNesting "CertVerifyValidityNesting" var, var

; winmdroot.Foundation.BOOL CryptAcquireCertificatePrivateKey(winmdroot.Security.Cryptography.CERT_CONTEXT* pCert, winmdroot.Security.Cryptography.CRYPT_ACQUIRE_FLAGS dwFlags, [Optional] void* pvParameters, winmdroot.Security.Cryptography.HCRYPTPROV_OR_NCRYPT_KEY_HANDLE* phCryptProvOrNCryptKey, [Optional] winmdroot.Security.Cryptography.CERT_KEY_SPEC* pdwKeySpec, [Optional] winmdroot.Foundation.BOOL* pfCallerFreeProvOrNCryptKey)
#cfunc global CryptAcquireCertificatePrivateKey "CryptAcquireCertificatePrivateKey" var, int, intptr, var, var, var

; winmdroot.Foundation.BOOL CryptBinaryToStringW(byte* pbBinary, uint cbBinary, winmdroot.Security.Cryptography.CRYPT_STRING dwFlags, winmdroot.Foundation.PWSTR pszString, uint* pcchString)
#cfunc global CryptBinaryToStringW "CryptBinaryToStringW" var, int, int, wstr, var

; winmdroot.Foundation.BOOL CryptCloseAsyncHandle(winmdroot.Security.Cryptography.HCRYPTASYNC hAsync)
#cfunc global CryptCloseAsyncHandle "CryptCloseAsyncHandle" intptr

; winmdroot.Foundation.BOOL CryptCreateAsyncHandle(uint dwFlags, winmdroot.Security.Cryptography.HCRYPTASYNC* phAsync)
#cfunc global CryptCreateAsyncHandle "CryptCreateAsyncHandle" int, intptr

; winmdroot.Foundation.BOOL CryptCreateKeyIdentifierFromCSP(winmdroot.Security.Cryptography.CERT_QUERY_ENCODING_TYPE dwCertEncodingType, winmdroot.Foundation.PCSTR pszPubKeyOID, winmdroot.Security.Cryptography.PUBLICKEYSTRUC* pPubKeyStruc, uint cbPubKeyStruc, uint dwFlags, [Optional] void* pvReserved, [Optional] byte* pbHash, uint* pcbHash)
#cfunc global CryptCreateKeyIdentifierFromCSP "CryptCreateKeyIdentifierFromCSP" int, str, var, int, int, intptr, var, var

; winmdroot.Foundation.BOOL CryptDecodeMessage(uint dwMsgTypeFlags, [Optional] winmdroot.Security.Cryptography.CRYPT_DECRYPT_MESSAGE_PARA* pDecryptPara, [Optional] winmdroot.Security.Cryptography.CRYPT_VERIFY_MESSAGE_PARA* pVerifyPara, uint dwSignerIndex, byte* pbEncodedBlob, uint cbEncodedBlob, uint dwPrevInnerContentType, [Optional] uint* pdwMsgType, [Optional] uint* pdwInnerContentType, [Optional] byte* pbDecoded, [Optional] uint* pcbDecoded, [Optional] winmdroot.Security.Cryptography.CERT_CONTEXT** ppXchgCert, [Optional] winmdroot.Security.Cryptography.CERT_CONTEXT** ppSignerCert)
#cfunc global CryptDecodeMessage "CryptDecodeMessage" int, var, var, int, var, int, int, var, var, var, var, var, var

; winmdroot.Foundation.BOOL CryptDecodeObject(winmdroot.Security.Cryptography.CERT_QUERY_ENCODING_TYPE dwCertEncodingType, winmdroot.Foundation.PCSTR lpszStructType, byte* pbEncoded, uint cbEncoded, uint dwFlags, [Optional] void* pvStructInfo, uint* pcbStructInfo)
#cfunc global CryptDecodeObject "CryptDecodeObject" int, str, var, int, int, intptr, var

; winmdroot.Foundation.BOOL CryptDecodeObjectEx(winmdroot.Security.Cryptography.CERT_QUERY_ENCODING_TYPE dwCertEncodingType, winmdroot.Foundation.PCSTR lpszStructType, byte* pbEncoded, uint cbEncoded, uint dwFlags, [Optional] winmdroot.Security.Cryptography.CRYPT_DECODE_PARA* pDecodePara, [Optional] void* pvStructInfo, uint* pcbStructInfo)
#cfunc global CryptDecodeObjectEx "CryptDecodeObjectEx" int, str, var, int, int, var, intptr, var

; winmdroot.Foundation.BOOL CryptDecryptAndVerifyMessageSignature(winmdroot.Security.Cryptography.CRYPT_DECRYPT_MESSAGE_PARA* pDecryptPara, winmdroot.Security.Cryptography.CRYPT_VERIFY_MESSAGE_PARA* pVerifyPara, uint dwSignerIndex, byte* pbEncryptedBlob, uint cbEncryptedBlob, [Optional] byte* pbDecrypted, [Optional] uint* pcbDecrypted, [Optional] winmdroot.Security.Cryptography.CERT_CONTEXT** ppXchgCert, [Optional] winmdroot.Security.Cryptography.CERT_CONTEXT** ppSignerCert)
#cfunc global CryptDecryptAndVerifyMessageSignature "CryptDecryptAndVerifyMessageSignature" var, var, int, var, int, var, var, var, var

; winmdroot.Foundation.BOOL CryptDecryptMessage(winmdroot.Security.Cryptography.CRYPT_DECRYPT_MESSAGE_PARA* pDecryptPara, byte* pbEncryptedBlob, uint cbEncryptedBlob, [Optional] byte* pbDecrypted, [Optional] uint* pcbDecrypted, [Optional] winmdroot.Security.Cryptography.CERT_CONTEXT** ppXchgCert)
#cfunc global CryptDecryptMessage "CryptDecryptMessage" var, var, int, var, var, var

; winmdroot.Foundation.BOOL CryptEncodeObject(winmdroot.Security.Cryptography.CERT_QUERY_ENCODING_TYPE dwCertEncodingType, winmdroot.Foundation.PCSTR lpszStructType, void* pvStructInfo, [Optional] byte* pbEncoded, uint* pcbEncoded)
#cfunc global CryptEncodeObject "CryptEncodeObject" int, str, intptr, var, var

; winmdroot.Foundation.BOOL CryptEncodeObjectEx(winmdroot.Security.Cryptography.CERT_QUERY_ENCODING_TYPE dwCertEncodingType, winmdroot.Foundation.PCSTR lpszStructType, void* pvStructInfo, winmdroot.Security.Cryptography.CRYPT_ENCODE_OBJECT_FLAGS dwFlags, [Optional] winmdroot.Security.Cryptography.CRYPT_ENCODE_PARA* pEncodePara, [Optional] void* pvEncoded, uint* pcbEncoded)
#cfunc global CryptEncodeObjectEx "CryptEncodeObjectEx" int, str, intptr, int, var, intptr, var

; winmdroot.Foundation.BOOL CryptEncryptMessage(winmdroot.Security.Cryptography.CRYPT_ENCRYPT_MESSAGE_PARA* pEncryptPara, uint cRecipientCert, winmdroot.Security.Cryptography.CERT_CONTEXT** rgpRecipientCert, [Optional] byte* pbToBeEncrypted, uint cbToBeEncrypted, [Optional] byte* pbEncryptedBlob, uint* pcbEncryptedBlob)
#cfunc global CryptEncryptMessage "CryptEncryptMessage" var, int, var, var, int, var, var

; winmdroot.Foundation.BOOL CryptEnumKeyIdentifierProperties([Optional] winmdroot.Security.Cryptography.CRYPT_INTEGER_BLOB* pKeyIdentifier, uint dwPropId, uint dwFlags, winmdroot.Foundation.PCWSTR pwszComputerName, [Optional] void* pvReserved, [Optional] void* pvArg, delegate *unmanaged[Stdcall]<global::Windows.Win32.Security.Cryptography.CRYPT_INTEGER_BLOB*,uint,void*,void*,uint,uint*,void**,uint*,global::Windows.Win32.Foundation.BOOL> pfnEnum)
#cfunc global CryptEnumKeyIdentifierProperties "CryptEnumKeyIdentifierProperties" var, int, int, wstr, intptr, intptr, int

; winmdroot.Foundation.BOOL CryptEnumOIDFunction(uint dwEncodingType, winmdroot.Foundation.PCSTR pszFuncName, winmdroot.Foundation.PCSTR pszOID, uint dwFlags, [Optional] void* pvArg, delegate *unmanaged[Stdcall]<uint,winmdroot.Foundation.PCSTR,winmdroot.Foundation.PCSTR,uint,uint*,winmdroot.Foundation.PCWSTR*,byte**,uint*,void*,global::Windows.Win32.Foundation.BOOL> pfnEnumOIDFunc)
#cfunc global CryptEnumOIDFunction "CryptEnumOIDFunction" int, str, str, int, intptr, int

; winmdroot.Foundation.BOOL CryptEnumOIDInfo(uint dwGroupId, uint dwFlags, [Optional] void* pvArg, delegate *unmanaged[Stdcall]<global::Windows.Win32.Security.Cryptography.CRYPT_OID_INFO*,void*,global::Windows.Win32.Foundation.BOOL> pfnEnumOIDInfo)
#cfunc global CryptEnumOIDInfo "CryptEnumOIDInfo" int, int, intptr, int

; winmdroot.Foundation.BOOL CryptExportPKCS8(nuint hCryptProv, uint dwKeySpec, winmdroot.Foundation.PSTR pszPrivateKeyObjId, uint dwFlags, [Optional] void* pvAuxInfo, [Optional] byte* pbPrivateKeyBlob, uint* pcbPrivateKeyBlob)
#cfunc global CryptExportPKCS8 "CryptExportPKCS8" int, int, str, int, intptr, var, var

; winmdroot.Foundation.BOOL CryptExportPublicKeyInfo(winmdroot.Security.Cryptography.HCRYPTPROV_OR_NCRYPT_KEY_HANDLE hCryptProvOrNCryptKey, uint dwKeySpec, winmdroot.Security.Cryptography.CERT_QUERY_ENCODING_TYPE dwCertEncodingType, [Optional] winmdroot.Security.Cryptography.CERT_PUBLIC_KEY_INFO* pInfo, uint* pcbInfo)
#cfunc global CryptExportPublicKeyInfo "CryptExportPublicKeyInfo" int, int, int, var, var

; winmdroot.Foundation.BOOL CryptExportPublicKeyInfoEx(winmdroot.Security.Cryptography.HCRYPTPROV_OR_NCRYPT_KEY_HANDLE hCryptProvOrNCryptKey, uint dwKeySpec, winmdroot.Security.Cryptography.CERT_QUERY_ENCODING_TYPE dwCertEncodingType, winmdroot.Foundation.PSTR pszPublicKeyObjId, uint dwFlags, [Optional] void* pvAuxInfo, [Optional] winmdroot.Security.Cryptography.CERT_PUBLIC_KEY_INFO* pInfo, uint* pcbInfo)
#cfunc global CryptExportPublicKeyInfoEx "CryptExportPublicKeyInfoEx" int, int, int, str, int, intptr, var, var

; winmdroot.Foundation.BOOL CryptExportPublicKeyInfoFromBCryptKeyHandle(winmdroot.Security.Cryptography.BCRYPT_KEY_HANDLE hBCryptKey, winmdroot.Security.Cryptography.CERT_QUERY_ENCODING_TYPE dwCertEncodingType, winmdroot.Foundation.PSTR pszPublicKeyObjId, uint dwFlags, [Optional] void* pvAuxInfo, [Optional] winmdroot.Security.Cryptography.CERT_PUBLIC_KEY_INFO* pInfo, uint* pcbInfo)
#cfunc global CryptExportPublicKeyInfoFromBCryptKeyHandle "CryptExportPublicKeyInfoFromBCryptKeyHandle" int, int, str, int, intptr, var, var

; winmdroot.Foundation.BOOL CryptFindCertificateKeyProvInfo(winmdroot.Security.Cryptography.CERT_CONTEXT* pCert, winmdroot.Security.Cryptography.CRYPT_FIND_FLAGS dwFlags, [Optional] void* pvReserved)
#cfunc global CryptFindCertificateKeyProvInfo "CryptFindCertificateKeyProvInfo" var, int, intptr

; winmdroot.Foundation.PCWSTR CryptFindLocalizedName(winmdroot.Foundation.PCWSTR pwszCryptName)
#cfunc global CryptFindLocalizedName "CryptFindLocalizedName" wstr

; winmdroot.Security.Cryptography.CRYPT_OID_INFO* CryptFindOIDInfo(uint dwKeyType, void* pvKey, uint dwGroupId)
#cfunc global CryptFindOIDInfo "CryptFindOIDInfo" int, intptr, int

; winmdroot.Foundation.BOOL CryptFormatObject(winmdroot.Security.Cryptography.CERT_QUERY_ENCODING_TYPE dwCertEncodingType, uint dwFormatType, uint dwFormatStrType, [Optional] void* pFormatStruct, winmdroot.Foundation.PCSTR lpszStructType, byte* pbEncoded, uint cbEncoded, [Optional] void* pbFormat, uint* pcbFormat)
#cfunc global CryptFormatObject "CryptFormatObject" int, int, int, intptr, str, var, int, intptr, var

; winmdroot.Foundation.BOOL CryptFreeOIDFunctionAddress(void* hFuncAddr, uint dwFlags)
#cfunc global CryptFreeOIDFunctionAddress "CryptFreeOIDFunctionAddress" intptr, int

; winmdroot.Foundation.BOOL CryptGetAsyncParam(winmdroot.Security.Cryptography.HCRYPTASYNC hAsync, winmdroot.Foundation.PSTR pszParamOid, [Optional] void** ppvParam, [Optional] delegate *unmanaged[Stdcall]<global::Windows.Win32.Foundation.PSTR,void*,void>* ppfnFree)
#cfunc global CryptGetAsyncParam "CryptGetAsyncParam" intptr, str, var, var

; winmdroot.Foundation.BOOL CryptGetDefaultOIDDllList(void* hFuncSet, uint dwEncodingType, winmdroot.Foundation.PZZWSTR pwszDllList, uint* pcchDllList)
#cfunc global CryptGetDefaultOIDDllList "CryptGetDefaultOIDDllList" intptr, int, int, var

; winmdroot.Foundation.BOOL CryptGetDefaultOIDFunctionAddress(void* hFuncSet, uint dwEncodingType, winmdroot.Foundation.PCWSTR pwszDll, uint dwFlags, void** ppvFuncAddr, void** phFuncAddr)
#cfunc global CryptGetDefaultOIDFunctionAddress "CryptGetDefaultOIDFunctionAddress" intptr, int, wstr, int, var, var

; winmdroot.Foundation.BOOL CryptGetKeyIdentifierProperty(winmdroot.Security.Cryptography.CRYPT_INTEGER_BLOB* pKeyIdentifier, uint dwPropId, uint dwFlags, winmdroot.Foundation.PCWSTR pwszComputerName, [Optional] void* pvReserved, [Optional] void* pvData, uint* pcbData)
#cfunc global CryptGetKeyIdentifierProperty "CryptGetKeyIdentifierProperty" var, int, int, wstr, intptr, intptr, var

; winmdroot.Security.Cryptography.HCERTSTORE CryptGetMessageCertificates(uint dwMsgAndCertEncodingType, winmdroot.Security.Cryptography.HCRYPTPROV_LEGACY hCryptProv, uint dwFlags, byte* pbSignedBlob, uint cbSignedBlob)
#cfunc global CryptGetMessageCertificates "CryptGetMessageCertificates" int, int, int, var, int

; int CryptGetMessageSignerCount(uint dwMsgEncodingType, byte* pbSignedBlob, uint cbSignedBlob)
#cfunc global CryptGetMessageSignerCount "CryptGetMessageSignerCount" int, var, int

; winmdroot.Foundation.BOOL CryptGetOIDFunctionAddress(void* hFuncSet, uint dwEncodingType, winmdroot.Foundation.PCSTR pszOID, uint dwFlags, void** ppvFuncAddr, void** phFuncAddr)
#cfunc global CryptGetOIDFunctionAddress "CryptGetOIDFunctionAddress" intptr, int, str, int, var, var

; winmdroot.Foundation.BOOL CryptGetOIDFunctionValue(uint dwEncodingType, winmdroot.Foundation.PCSTR pszFuncName, winmdroot.Foundation.PCSTR pszOID, winmdroot.Foundation.PCWSTR pwszValueName, [Optional] uint* pdwValueType, [Optional] byte* pbValueData, [Optional] uint* pcbValueData)
#cfunc global CryptGetOIDFunctionValue "CryptGetOIDFunctionValue" int, str, str, wstr, var, var, var

; winmdroot.Foundation.BOOL CryptHashCertificate(winmdroot.Security.Cryptography.HCRYPTPROV_LEGACY hCryptProv, winmdroot.Security.Cryptography.ALG_ID Algid, uint dwFlags, byte* pbEncoded, uint cbEncoded, [Optional] byte* pbComputedHash, uint* pcbComputedHash)
#cfunc global CryptHashCertificate "CryptHashCertificate" int, int, int, var, int, var, var

; winmdroot.Foundation.BOOL CryptHashCertificate2(winmdroot.Foundation.PCWSTR pwszCNGHashAlgid, uint dwFlags, [Optional] void* pvReserved, [Optional] byte* pbEncoded, uint cbEncoded, [Optional] byte* pbComputedHash, uint* pcbComputedHash)
#cfunc global CryptHashCertificate2 "CryptHashCertificate2" wstr, int, intptr, var, int, var, var

; winmdroot.Foundation.BOOL CryptHashMessage(winmdroot.Security.Cryptography.CRYPT_HASH_MESSAGE_PARA* pHashPara, winmdroot.Foundation.BOOL fDetachedHash, uint cToBeHashed, byte** rgpbToBeHashed, uint* rgcbToBeHashed, [Optional] byte* pbHashedBlob, [Optional] uint* pcbHashedBlob, [Optional] byte* pbComputedHash, [Optional] uint* pcbComputedHash)
#cfunc global CryptHashMessage "CryptHashMessage" var, int, int, var, var, var, var, var, var

; winmdroot.Foundation.BOOL CryptHashPublicKeyInfo(winmdroot.Security.Cryptography.HCRYPTPROV_LEGACY hCryptProv, winmdroot.Security.Cryptography.ALG_ID Algid, uint dwFlags, winmdroot.Security.Cryptography.CERT_QUERY_ENCODING_TYPE dwCertEncodingType, winmdroot.Security.Cryptography.CERT_PUBLIC_KEY_INFO* pInfo, [Optional] byte* pbComputedHash, uint* pcbComputedHash)
#cfunc global CryptHashPublicKeyInfo "CryptHashPublicKeyInfo" int, int, int, int, var, var, var

; winmdroot.Foundation.BOOL CryptHashToBeSigned(winmdroot.Security.Cryptography.HCRYPTPROV_LEGACY hCryptProv, winmdroot.Security.Cryptography.CERT_QUERY_ENCODING_TYPE dwCertEncodingType, byte* pbEncoded, uint cbEncoded, [Optional] byte* pbComputedHash, uint* pcbComputedHash)
#cfunc global CryptHashToBeSigned "CryptHashToBeSigned" int, int, var, int, var, var

; winmdroot.Foundation.BOOL CryptImportPKCS8(winmdroot.Security.Cryptography.CRYPT_PKCS8_IMPORT_PARAMS sPrivateKeyAndParams, winmdroot.Security.Cryptography.CRYPT_KEY_FLAGS dwFlags, [Optional] nuint* phCryptProv, [Optional] void* pvAuxInfo)
#cfunc global CryptImportPKCS8 "CryptImportPKCS8" var, int, var, intptr

; winmdroot.Foundation.BOOL CryptImportPublicKeyInfo(nuint hCryptProv, winmdroot.Security.Cryptography.CERT_QUERY_ENCODING_TYPE dwCertEncodingType, winmdroot.Security.Cryptography.CERT_PUBLIC_KEY_INFO* pInfo, nuint* phKey)
#cfunc global CryptImportPublicKeyInfo "CryptImportPublicKeyInfo" int, int, var, var

; winmdroot.Foundation.BOOL CryptImportPublicKeyInfoEx(nuint hCryptProv, winmdroot.Security.Cryptography.CERT_QUERY_ENCODING_TYPE dwCertEncodingType, winmdroot.Security.Cryptography.CERT_PUBLIC_KEY_INFO* pInfo, winmdroot.Security.Cryptography.ALG_ID aiKeyAlg, uint dwFlags, [Optional] void* pvAuxInfo, nuint* phKey)
#cfunc global CryptImportPublicKeyInfoEx "CryptImportPublicKeyInfoEx" int, int, var, int, int, intptr, var

; winmdroot.Foundation.BOOL CryptImportPublicKeyInfoEx2(winmdroot.Security.Cryptography.CERT_QUERY_ENCODING_TYPE dwCertEncodingType, winmdroot.Security.Cryptography.CERT_PUBLIC_KEY_INFO* pInfo, winmdroot.Security.Cryptography.CRYPT_IMPORT_PUBLIC_KEY_FLAGS dwFlags, [Optional] void* pvAuxInfo, winmdroot.Security.Cryptography.BCRYPT_KEY_HANDLE* phKey)
#cfunc global CryptImportPublicKeyInfoEx2 "CryptImportPublicKeyInfoEx2" int, var, int, intptr, var

; void* CryptInitOIDFunctionSet(winmdroot.Foundation.PCSTR pszFuncName, uint dwFlags)
#cfunc global CryptInitOIDFunctionSet "CryptInitOIDFunctionSet" str, int

; winmdroot.Foundation.BOOL CryptInstallDefaultContext(nuint hCryptProv, winmdroot.Security.Cryptography.CRYPT_DEFAULT_CONTEXT_TYPE dwDefaultType, [Optional] void* pvDefaultPara, winmdroot.Security.Cryptography.CRYPT_DEFAULT_CONTEXT_FLAGS dwFlags, [Optional] void* pvReserved, void** phDefaultContext)
#cfunc global CryptInstallDefaultContext "CryptInstallDefaultContext" int, int, intptr, int, intptr, var

; winmdroot.Foundation.BOOL CryptInstallOIDFunctionAddress(winmdroot.Foundation.HMODULE hModule, uint dwEncodingType, winmdroot.Foundation.PCSTR pszFuncName, uint cFuncEntry, winmdroot.Security.Cryptography.CRYPT_OID_FUNC_ENTRY* rgFuncEntry, uint dwFlags)
#cfunc global CryptInstallOIDFunctionAddress "CryptInstallOIDFunctionAddress" intptr, int, str, int, var, int

; void* CryptMemAlloc(uint cbSize)
#cfunc global CryptMemAlloc "CryptMemAlloc" int

; void CryptMemFree([Optional] void* pv)
#func global CryptMemFree "CryptMemFree" intptr

; void* CryptMemRealloc([Optional] void* pv, uint cbSize)
#cfunc global CryptMemRealloc "CryptMemRealloc" intptr, int

; uint CryptMsgCalculateEncodedLength(uint dwMsgEncodingType, uint dwFlags, uint dwMsgType, void* pvMsgEncodeInfo, winmdroot.Foundation.PSTR pszInnerContentObjID, uint cbData)
#cfunc global CryptMsgCalculateEncodedLength "CryptMsgCalculateEncodedLength" int, int, int, intptr, str, int

; winmdroot.Foundation.BOOL CryptMsgClose([Optional] void* hCryptMsg)
#cfunc global CryptMsgClose "CryptMsgClose" intptr

; winmdroot.Foundation.BOOL CryptMsgControl(void* hCryptMsg, uint dwFlags, uint dwCtrlType, [Optional] void* pvCtrlPara)
#cfunc global CryptMsgControl "CryptMsgControl" intptr, int, int, intptr

; winmdroot.Foundation.BOOL CryptMsgCountersign(void* hCryptMsg, uint dwIndex, uint cCountersigners, winmdroot.Security.Cryptography.CMSG_SIGNER_ENCODE_INFO* rgCountersigners)
#cfunc global CryptMsgCountersign "CryptMsgCountersign" intptr, int, int, var

; winmdroot.Foundation.BOOL CryptMsgCountersignEncoded(uint dwEncodingType, byte* pbSignerInfo, uint cbSignerInfo, uint cCountersigners, winmdroot.Security.Cryptography.CMSG_SIGNER_ENCODE_INFO* rgCountersigners, [Optional] byte* pbCountersignature, uint* pcbCountersignature)
#cfunc global CryptMsgCountersignEncoded "CryptMsgCountersignEncoded" int, var, int, int, var, var, var

; void* CryptMsgDuplicate([Optional] void* hCryptMsg)
#cfunc global CryptMsgDuplicate "CryptMsgDuplicate" intptr

; winmdroot.Foundation.BOOL CryptMsgEncodeAndSignCTL(uint dwMsgEncodingType, winmdroot.Security.Cryptography.CTL_INFO* pCtlInfo, winmdroot.Security.Cryptography.CMSG_SIGNED_ENCODE_INFO* pSignInfo, uint dwFlags, [Optional] byte* pbEncoded, uint* pcbEncoded)
#cfunc global CryptMsgEncodeAndSignCTL "CryptMsgEncodeAndSignCTL" int, var, var, int, var, var

; winmdroot.Foundation.BOOL CryptMsgGetAndVerifySigner(void* hCryptMsg, uint cSignerStore, [Optional] winmdroot.Security.Cryptography.HCERTSTORE* rghSignerStore, uint dwFlags, [Optional] winmdroot.Security.Cryptography.CERT_CONTEXT** ppSigner, [Optional] uint* pdwSignerIndex)
#cfunc global CryptMsgGetAndVerifySigner "CryptMsgGetAndVerifySigner" intptr, int, var, int, var, var

; winmdroot.Foundation.BOOL CryptMsgGetParam(void* hCryptMsg, uint dwParamType, uint dwIndex, [Optional] void* pvData, uint* pcbData)
#cfunc global CryptMsgGetParam "CryptMsgGetParam" intptr, int, int, intptr, var

; void* CryptMsgOpenToDecode(uint dwMsgEncodingType, uint dwFlags, uint dwMsgType, winmdroot.Security.Cryptography.HCRYPTPROV_LEGACY hCryptProv, [Optional] winmdroot.Security.Cryptography.CERT_INFO* pRecipientInfo, [Optional] winmdroot.Security.Cryptography.CMSG_STREAM_INFO* pStreamInfo)
#cfunc global CryptMsgOpenToDecode "CryptMsgOpenToDecode" int, int, int, int, var, var

; void* CryptMsgOpenToEncode(uint dwMsgEncodingType, uint dwFlags, winmdroot.Security.Cryptography.CRYPT_MSG_TYPE dwMsgType, void* pvMsgEncodeInfo, winmdroot.Foundation.PSTR pszInnerContentObjID, [Optional] winmdroot.Security.Cryptography.CMSG_STREAM_INFO* pStreamInfo)
#cfunc global CryptMsgOpenToEncode "CryptMsgOpenToEncode" int, int, int, intptr, str, var

; winmdroot.Foundation.BOOL CryptMsgSignCTL(uint dwMsgEncodingType, byte* pbCtlContent, uint cbCtlContent, winmdroot.Security.Cryptography.CMSG_SIGNED_ENCODE_INFO* pSignInfo, uint dwFlags, [Optional] byte* pbEncoded, uint* pcbEncoded)
#cfunc global CryptMsgSignCTL "CryptMsgSignCTL" int, var, int, var, int, var, var

; winmdroot.Foundation.BOOL CryptMsgUpdate(void* hCryptMsg, [Optional] byte* pbData, uint cbData, winmdroot.Foundation.BOOL fFinal)
#cfunc global CryptMsgUpdate "CryptMsgUpdate" intptr, var, int, int

; winmdroot.Foundation.BOOL CryptMsgVerifyCountersignatureEncoded(winmdroot.Security.Cryptography.HCRYPTPROV_LEGACY hCryptProv, uint dwEncodingType, byte* pbSignerInfo, uint cbSignerInfo, byte* pbSignerInfoCountersignature, uint cbSignerInfoCountersignature, winmdroot.Security.Cryptography.CERT_INFO* pciCountersigner)
#cfunc global CryptMsgVerifyCountersignatureEncoded "CryptMsgVerifyCountersignatureEncoded" int, int, var, int, var, int, var

; winmdroot.Foundation.BOOL CryptMsgVerifyCountersignatureEncodedEx(winmdroot.Security.Cryptography.HCRYPTPROV_LEGACY hCryptProv, uint dwEncodingType, byte* pbSignerInfo, uint cbSignerInfo, byte* pbSignerInfoCountersignature, uint cbSignerInfoCountersignature, uint dwSignerType, void* pvSigner, uint dwFlags, [Optional] void* pvExtra)
#cfunc global CryptMsgVerifyCountersignatureEncodedEx "CryptMsgVerifyCountersignatureEncodedEx" int, int, var, int, var, int, int, intptr, int, intptr

; winmdroot.Foundation.BOOL CryptProtectData(winmdroot.Security.Cryptography.CRYPT_INTEGER_BLOB* pDataIn, winmdroot.Foundation.PCWSTR szDataDescr, [Optional] winmdroot.Security.Cryptography.CRYPT_INTEGER_BLOB* pOptionalEntropy, [Optional] void* pvReserved, [Optional] winmdroot.Security.Cryptography.CRYPTPROTECT_PROMPTSTRUCT* pPromptStruct, uint dwFlags, winmdroot.Security.Cryptography.CRYPT_INTEGER_BLOB* pDataOut)
#cfunc global CryptProtectData "CryptProtectData" var, wstr, var, intptr, var, int, var

; winmdroot.Foundation.BOOL CryptQueryObject(winmdroot.Security.Cryptography.CERT_QUERY_OBJECT_TYPE dwObjectType, void* pvObject, winmdroot.Security.Cryptography.CERT_QUERY_CONTENT_TYPE_FLAGS dwExpectedContentTypeFlags, winmdroot.Security.Cryptography.CERT_QUERY_FORMAT_TYPE_FLAGS dwExpectedFormatTypeFlags, uint dwFlags, [Optional] winmdroot.Security.Cryptography.CERT_QUERY_ENCODING_TYPE* pdwMsgAndCertEncodingType, [Optional] winmdroot.Security.Cryptography.CERT_QUERY_CONTENT_TYPE* pdwContentType, [Optional] winmdroot.Security.Cryptography.CERT_QUERY_FORMAT_TYPE* pdwFormatType, [Optional] winmdroot.Security.Cryptography.HCERTSTORE* phCertStore, [Optional] void** phMsg, [Optional] void** ppvContext)
#cfunc global CryptQueryObject "CryptQueryObject" int, intptr, int, int, int, var, var, var, var, var, var

; winmdroot.Foundation.BOOL CryptRegisterDefaultOIDFunction(uint dwEncodingType, winmdroot.Foundation.PCSTR pszFuncName, uint dwIndex, winmdroot.Foundation.PCWSTR pwszDll)
#cfunc global CryptRegisterDefaultOIDFunction "CryptRegisterDefaultOIDFunction" int, str, int, wstr

; winmdroot.Foundation.BOOL CryptRegisterOIDFunction(uint dwEncodingType, winmdroot.Foundation.PCSTR pszFuncName, winmdroot.Foundation.PCSTR pszOID, winmdroot.Foundation.PCWSTR pwszDll, winmdroot.Foundation.PCSTR pszOverrideFuncName)
#cfunc global CryptRegisterOIDFunction "CryptRegisterOIDFunction" int, str, str, wstr, str

; winmdroot.Foundation.BOOL CryptRegisterOIDInfo(winmdroot.Security.Cryptography.CRYPT_OID_INFO* pInfo, uint dwFlags)
#cfunc global CryptRegisterOIDInfo "CryptRegisterOIDInfo" var, int

; winmdroot.Foundation.BOOL CryptRetrieveTimeStamp(winmdroot.Foundation.PCWSTR wszUrl, uint dwRetrievalFlags, uint dwTimeout, winmdroot.Foundation.PCSTR pszHashId, [Optional] winmdroot.Security.Cryptography.CRYPT_TIMESTAMP_PARA* pPara, byte* pbData, uint cbData, winmdroot.Security.Cryptography.CRYPT_TIMESTAMP_CONTEXT** ppTsContext, winmdroot.Security.Cryptography.CERT_CONTEXT** ppTsSigner, [Optional] winmdroot.Security.Cryptography.HCERTSTORE* phStore)
#cfunc global CryptRetrieveTimeStamp "CryptRetrieveTimeStamp" wstr, int, int, str, var, var, int, var, var, var

; winmdroot.Foundation.BOOL CryptSIPAddProvider(winmdroot.Security.Cryptography.Sip.SIP_ADD_NEWPROVIDER* psNewProv)
#cfunc global CryptSIPAddProvider "CryptSIPAddProvider" var

; winmdroot.Foundation.BOOL CryptSIPLoad(global::System.Guid* pgSubject, uint dwFlags, winmdroot.Security.Cryptography.Sip.SIP_DISPATCH_INFO* pSipDispatch)
#cfunc global CryptSIPLoad "CryptSIPLoad" var, int, var

; winmdroot.Foundation.BOOL CryptSIPRemoveProvider(global::System.Guid* pgProv)
#cfunc global CryptSIPRemoveProvider "CryptSIPRemoveProvider" var

; winmdroot.Foundation.BOOL CryptSIPRetrieveSubjectGuid(winmdroot.Foundation.PCWSTR FileName, winmdroot.Foundation.HANDLE hFileIn, global::System.Guid* pgSubject)
#cfunc global CryptSIPRetrieveSubjectGuid "CryptSIPRetrieveSubjectGuid" wstr, intptr, var

; winmdroot.Foundation.BOOL CryptSIPRetrieveSubjectGuidForCatalogFile(winmdroot.Foundation.PCWSTR FileName, winmdroot.Foundation.HANDLE hFileIn, global::System.Guid* pgSubject)
#cfunc global CryptSIPRetrieveSubjectGuidForCatalogFile "CryptSIPRetrieveSubjectGuidForCatalogFile" wstr, intptr, var

; winmdroot.Foundation.BOOL CryptSetAsyncParam(winmdroot.Security.Cryptography.HCRYPTASYNC hAsync, winmdroot.Foundation.PSTR pszParamOid, [Optional] void* pvParam, delegate *unmanaged[Stdcall]<global::Windows.Win32.Foundation.PSTR,void*,void> pfnFree)
#cfunc global CryptSetAsyncParam "CryptSetAsyncParam" intptr, str, intptr, int

; winmdroot.Foundation.BOOL CryptSetKeyIdentifierProperty(winmdroot.Security.Cryptography.CRYPT_INTEGER_BLOB* pKeyIdentifier, uint dwPropId, uint dwFlags, winmdroot.Foundation.PCWSTR pwszComputerName, [Optional] void* pvReserved, [Optional] void* pvData)
#cfunc global CryptSetKeyIdentifierProperty "CryptSetKeyIdentifierProperty" var, int, int, wstr, intptr, intptr

; winmdroot.Foundation.BOOL CryptSetOIDFunctionValue(uint dwEncodingType, winmdroot.Foundation.PCSTR pszFuncName, winmdroot.Foundation.PCSTR pszOID, winmdroot.Foundation.PCWSTR pwszValueName, winmdroot.System.Registry.REG_VALUE_TYPE dwValueType, [Optional] byte* pbValueData, uint cbValueData)
#cfunc global CryptSetOIDFunctionValue "CryptSetOIDFunctionValue" int, str, str, wstr, int, var, int

; winmdroot.Foundation.BOOL CryptSignAndEncodeCertificate(winmdroot.Security.Cryptography.HCRYPTPROV_OR_NCRYPT_KEY_HANDLE hCryptProvOrNCryptKey, winmdroot.Security.Cryptography.CERT_KEY_SPEC dwKeySpec, winmdroot.Security.Cryptography.CERT_QUERY_ENCODING_TYPE dwCertEncodingType, winmdroot.Foundation.PCSTR lpszStructType, void* pvStructInfo, winmdroot.Security.Cryptography.CRYPT_ALGORITHM_IDENTIFIER* pSignatureAlgorithm, [Optional] void* pvHashAuxInfo, [Optional] byte* pbEncoded, uint* pcbEncoded)
#cfunc global CryptSignAndEncodeCertificate "CryptSignAndEncodeCertificate" int, int, int, str, intptr, var, intptr, var, var

; winmdroot.Foundation.BOOL CryptSignAndEncryptMessage(winmdroot.Security.Cryptography.CRYPT_SIGN_MESSAGE_PARA* pSignPara, winmdroot.Security.Cryptography.CRYPT_ENCRYPT_MESSAGE_PARA* pEncryptPara, uint cRecipientCert, winmdroot.Security.Cryptography.CERT_CONTEXT** rgpRecipientCert, byte* pbToBeSignedAndEncrypted, uint cbToBeSignedAndEncrypted, [Optional] byte* pbSignedAndEncryptedBlob, uint* pcbSignedAndEncryptedBlob)
#cfunc global CryptSignAndEncryptMessage "CryptSignAndEncryptMessage" var, var, int, var, var, int, var, var

; winmdroot.Foundation.BOOL CryptSignCertificate(winmdroot.Security.Cryptography.HCRYPTPROV_OR_NCRYPT_KEY_HANDLE hCryptProvOrNCryptKey, uint dwKeySpec, winmdroot.Security.Cryptography.CERT_QUERY_ENCODING_TYPE dwCertEncodingType, byte* pbEncodedToBeSigned, uint cbEncodedToBeSigned, winmdroot.Security.Cryptography.CRYPT_ALGORITHM_IDENTIFIER* pSignatureAlgorithm, [Optional] void* pvHashAuxInfo, [Optional] byte* pbSignature, uint* pcbSignature)
#cfunc global CryptSignCertificate "CryptSignCertificate" int, int, int, var, int, var, intptr, var, var

; winmdroot.Foundation.BOOL CryptSignMessage(winmdroot.Security.Cryptography.CRYPT_SIGN_MESSAGE_PARA* pSignPara, winmdroot.Foundation.BOOL fDetachedSignature, uint cToBeSigned, [Optional] byte** rgpbToBeSigned, uint* rgcbToBeSigned, [Optional] byte* pbSignedBlob, uint* pcbSignedBlob)
#cfunc global CryptSignMessage "CryptSignMessage" var, int, int, var, var, var, var

; winmdroot.Foundation.BOOL CryptSignMessageWithKey(winmdroot.Security.Cryptography.CRYPT_KEY_SIGN_MESSAGE_PARA* pSignPara, byte* pbToBeSigned, uint cbToBeSigned, [Optional] byte* pbSignedBlob, uint* pcbSignedBlob)
#cfunc global CryptSignMessageWithKey "CryptSignMessageWithKey" var, var, int, var, var

; winmdroot.Foundation.BOOL CryptStringToBinary(winmdroot.Foundation.PCWSTR pszString, uint cchString, winmdroot.Security.Cryptography.CRYPT_STRING dwFlags, [Optional] byte* pbBinary, uint* pcbBinary, [Optional] uint* pdwSkip, [Optional] uint* pdwFlags)
#cfunc global CryptStringToBinaryW "CryptStringToBinaryW" wstr, int, int, var, var, var, var

; winmdroot.Foundation.BOOL CryptUninstallDefaultContext([Optional] void* hDefaultContext, uint dwFlags, [Optional] void* pvReserved)
#cfunc global CryptUninstallDefaultContext "CryptUninstallDefaultContext" intptr, int, intptr

; winmdroot.Foundation.BOOL CryptUnprotectData(winmdroot.Security.Cryptography.CRYPT_INTEGER_BLOB* pDataIn, [Optional] winmdroot.Foundation.PWSTR* ppszDataDescr, [Optional] winmdroot.Security.Cryptography.CRYPT_INTEGER_BLOB* pOptionalEntropy, [Optional] void* pvReserved, [Optional] winmdroot.Security.Cryptography.CRYPTPROTECT_PROMPTSTRUCT* pPromptStruct, uint dwFlags, winmdroot.Security.Cryptography.CRYPT_INTEGER_BLOB* pDataOut)
#cfunc global CryptUnprotectData "CryptUnprotectData" var, var, var, intptr, var, int, var

; winmdroot.Foundation.BOOL CryptUnregisterDefaultOIDFunction(uint dwEncodingType, winmdroot.Foundation.PCSTR pszFuncName, winmdroot.Foundation.PCWSTR pwszDll)
#cfunc global CryptUnregisterDefaultOIDFunction "CryptUnregisterDefaultOIDFunction" int, str, wstr

; winmdroot.Foundation.BOOL CryptUnregisterOIDFunction(uint dwEncodingType, winmdroot.Foundation.PCSTR pszFuncName, winmdroot.Foundation.PCSTR pszOID)
#cfunc global CryptUnregisterOIDFunction "CryptUnregisterOIDFunction" int, str, str

; winmdroot.Foundation.BOOL CryptUnregisterOIDInfo(winmdroot.Security.Cryptography.CRYPT_OID_INFO* pInfo)
#cfunc global CryptUnregisterOIDInfo "CryptUnregisterOIDInfo" var

; winmdroot.Foundation.BOOL CryptVerifyCertificateSignature(winmdroot.Security.Cryptography.HCRYPTPROV_LEGACY hCryptProv, winmdroot.Security.Cryptography.CERT_QUERY_ENCODING_TYPE dwCertEncodingType, byte* pbEncoded, uint cbEncoded, winmdroot.Security.Cryptography.CERT_PUBLIC_KEY_INFO* pPublicKey)
#cfunc global CryptVerifyCertificateSignature "CryptVerifyCertificateSignature" int, int, var, int, var

; winmdroot.Foundation.BOOL CryptVerifyCertificateSignatureEx(winmdroot.Security.Cryptography.HCRYPTPROV_LEGACY hCryptProv, winmdroot.Security.Cryptography.CERT_QUERY_ENCODING_TYPE dwCertEncodingType, uint dwSubjectType, void* pvSubject, uint dwIssuerType, [Optional] void* pvIssuer, winmdroot.Security.Cryptography.CRYPT_VERIFY_CERT_FLAGS dwFlags, [Optional] void* pvExtra)
#cfunc global CryptVerifyCertificateSignatureEx "CryptVerifyCertificateSignatureEx" int, int, int, intptr, int, intptr, int, intptr

; winmdroot.Foundation.BOOL CryptVerifyDetachedMessageHash(winmdroot.Security.Cryptography.CRYPT_HASH_MESSAGE_PARA* pHashPara, byte* pbDetachedHashBlob, uint cbDetachedHashBlob, uint cToBeHashed, byte** rgpbToBeHashed, uint* rgcbToBeHashed, [Optional] byte* pbComputedHash, [Optional] uint* pcbComputedHash)
#cfunc global CryptVerifyDetachedMessageHash "CryptVerifyDetachedMessageHash" var, var, int, int, var, var, var, var

; winmdroot.Foundation.BOOL CryptVerifyDetachedMessageSignature(winmdroot.Security.Cryptography.CRYPT_VERIFY_MESSAGE_PARA* pVerifyPara, uint dwSignerIndex, byte* pbDetachedSignBlob, uint cbDetachedSignBlob, uint cToBeSigned, byte** rgpbToBeSigned, uint* rgcbToBeSigned, [Optional] winmdroot.Security.Cryptography.CERT_CONTEXT** ppSignerCert)
#cfunc global CryptVerifyDetachedMessageSignature "CryptVerifyDetachedMessageSignature" var, int, var, int, int, var, var, var

; winmdroot.Foundation.BOOL CryptVerifyMessageHash(winmdroot.Security.Cryptography.CRYPT_HASH_MESSAGE_PARA* pHashPara, byte* pbHashedBlob, uint cbHashedBlob, [Optional] byte* pbToBeHashed, [Optional] uint* pcbToBeHashed, [Optional] byte* pbComputedHash, [Optional] uint* pcbComputedHash)
#cfunc global CryptVerifyMessageHash "CryptVerifyMessageHash" var, var, int, var, var, var, var

; winmdroot.Foundation.BOOL CryptVerifyMessageSignature(winmdroot.Security.Cryptography.CRYPT_VERIFY_MESSAGE_PARA* pVerifyPara, uint dwSignerIndex, byte* pbSignedBlob, uint cbSignedBlob, [Optional] byte* pbDecoded, [Optional] uint* pcbDecoded, [Optional] winmdroot.Security.Cryptography.CERT_CONTEXT** ppSignerCert)
#cfunc global CryptVerifyMessageSignature "CryptVerifyMessageSignature" var, int, var, int, var, var, var

; winmdroot.Foundation.BOOL CryptVerifyMessageSignatureWithKey(winmdroot.Security.Cryptography.CRYPT_KEY_VERIFY_MESSAGE_PARA* pVerifyPara, [Optional] winmdroot.Security.Cryptography.CERT_PUBLIC_KEY_INFO* pPublicKeyInfo, byte* pbSignedBlob, uint cbSignedBlob, [Optional] byte* pbDecoded, [Optional] uint* pcbDecoded)
#cfunc global CryptVerifyMessageSignatureWithKey "CryptVerifyMessageSignatureWithKey" var, var, var, int, var, var

; winmdroot.Foundation.BOOL CryptVerifyTimeStampSignature(byte* pbTSContentInfo, uint cbTSContentInfo, [Optional] byte* pbData, uint cbData, winmdroot.Security.Cryptography.HCERTSTORE hAdditionalStore, winmdroot.Security.Cryptography.CRYPT_TIMESTAMP_CONTEXT** ppTsContext, winmdroot.Security.Cryptography.CERT_CONTEXT** ppTsSigner, [Optional] winmdroot.Security.Cryptography.HCERTSTORE* phStore)
#cfunc global CryptVerifyTimeStampSignature "CryptVerifyTimeStampSignature" var, int, var, int, int, var, var, var

; winmdroot.Foundation.BOOL PFXExportCertStore(winmdroot.Security.Cryptography.HCERTSTORE hStore, winmdroot.Security.Cryptography.CRYPT_INTEGER_BLOB* pPFX, winmdroot.Foundation.PCWSTR szPassword, uint dwFlags)
#cfunc global PFXExportCertStore "PFXExportCertStore" int, var, wstr, int

; winmdroot.Foundation.BOOL PFXExportCertStoreEx(winmdroot.Security.Cryptography.HCERTSTORE hStore, winmdroot.Security.Cryptography.CRYPT_INTEGER_BLOB* pPFX, winmdroot.Foundation.PCWSTR szPassword, void* pvPara, uint dwFlags)
#cfunc global PFXExportCertStoreEx "PFXExportCertStoreEx" int, var, wstr, intptr, int

; winmdroot.Security.Cryptography.HCERTSTORE PFXImportCertStore(winmdroot.Security.Cryptography.CRYPT_INTEGER_BLOB* pPFX, winmdroot.Foundation.PCWSTR szPassword, winmdroot.Security.Cryptography.CRYPT_KEY_FLAGS dwFlags)
#cfunc global PFXImportCertStore "PFXImportCertStore" var, wstr, int

; winmdroot.Foundation.BOOL PFXIsPFXBlob(winmdroot.Security.Cryptography.CRYPT_INTEGER_BLOB* pPFX)
#cfunc global PFXIsPFXBlob "PFXIsPFXBlob" var

; winmdroot.Foundation.BOOL PFXVerifyPassword(winmdroot.Security.Cryptography.CRYPT_INTEGER_BLOB* pPFX, winmdroot.Foundation.PCWSTR szPassword, uint dwFlags)
#cfunc global PFXVerifyPassword "PFXVerifyPassword" var, wstr, int

#endif
