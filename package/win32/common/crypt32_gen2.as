; ============================================================
;   Auto-generated from CsWin32 / win32metadata
;   dll:    crypt32.dll
;   tool:   tools/cswin32_bridge/gen_from_cswin32.py
;   Do not edit by hand ? regenerate via the python script.
;   Needs hsp3net (intptr / NSTRUCT / wstr).
; ============================================================

#ifndef __crypt32_gen2_as__
#define __crypt32_gen2_as__

; Shared NSTRUCT + #define constants for all win32 *_gen2.as
#include "win32_types_gen2.as"

;--- functions ---
#uselib "crypt32.dll"
; winmdroot.Foundation.BOOL CertCloseStore(winmdroot.Security.Cryptography.HCERTSTORE hCertStore, uint dwFlags)
#cfunc CertCloseStore "CertCloseStore" int, int

; winmdroot.Security.Cryptography.CERT_CONTEXT* CertEnumCertificatesInStore(winmdroot.Security.Cryptography.HCERTSTORE hCertStore, [Optional] winmdroot.Security.Cryptography.CERT_CONTEXT* pPrevCertContext)
#cfunc CertEnumCertificatesInStore "CertEnumCertificatesInStore" int, var

; winmdroot.Security.Cryptography.CERT_CONTEXT* CertFindCertificateInStore(winmdroot.Security.Cryptography.HCERTSTORE hCertStore, winmdroot.Security.Cryptography.CERT_QUERY_ENCODING_TYPE dwCertEncodingType, uint dwFindFlags, winmdroot.Security.Cryptography.CERT_FIND_FLAGS dwFindType, [Optional] void* pvFindPara, [Optional] winmdroot.Security.Cryptography.CERT_CONTEXT* pPrevCertContext)
#cfunc CertFindCertificateInStore "CertFindCertificateInStore" int, int, int, int, intptr, var

; winmdroot.Security.Cryptography.HCERTSTORE CertOpenSystemStore(winmdroot.Security.Cryptography.HCRYPTPROV_LEGACY hProv, winmdroot.Foundation.PCWSTR szSubsystemProtocol)
#cfunc CertOpenSystemStoreW "CertOpenSystemStoreW" int, wstr

; winmdroot.Foundation.BOOL CryptBinaryToStringW(byte* pbBinary, uint cbBinary, winmdroot.Security.Cryptography.CRYPT_STRING dwFlags, winmdroot.Foundation.PWSTR pszString, uint* pcchString)
#cfunc CryptBinaryToStringW "CryptBinaryToStringW" var, int, int, wstr, var

; winmdroot.Foundation.BOOL CryptProtectData(winmdroot.Security.Cryptography.CRYPT_INTEGER_BLOB* pDataIn, winmdroot.Foundation.PCWSTR szDataDescr, [Optional] winmdroot.Security.Cryptography.CRYPT_INTEGER_BLOB* pOptionalEntropy, [Optional] void* pvReserved, [Optional] winmdroot.Security.Cryptography.CRYPTPROTECT_PROMPTSTRUCT* pPromptStruct, uint dwFlags, winmdroot.Security.Cryptography.CRYPT_INTEGER_BLOB* pDataOut)
#cfunc CryptProtectData "CryptProtectData" var, wstr, var, intptr, var, int, var

; winmdroot.Foundation.BOOL CryptStringToBinary(winmdroot.Foundation.PCWSTR pszString, uint cchString, winmdroot.Security.Cryptography.CRYPT_STRING dwFlags, [Optional] byte* pbBinary, uint* pcbBinary, [Optional] uint* pdwSkip, [Optional] uint* pdwFlags)
#cfunc CryptStringToBinaryW "CryptStringToBinaryW" wstr, int, int, var, var, var, var

; winmdroot.Foundation.BOOL CryptUnprotectData(winmdroot.Security.Cryptography.CRYPT_INTEGER_BLOB* pDataIn, [Optional] winmdroot.Foundation.PWSTR* ppszDataDescr, [Optional] winmdroot.Security.Cryptography.CRYPT_INTEGER_BLOB* pOptionalEntropy, [Optional] void* pvReserved, [Optional] winmdroot.Security.Cryptography.CRYPTPROTECT_PROMPTSTRUCT* pPromptStruct, uint dwFlags, winmdroot.Security.Cryptography.CRYPT_INTEGER_BLOB* pDataOut)
#cfunc CryptUnprotectData "CryptUnprotectData" var, var, var, intptr, var, int, var

#endif
