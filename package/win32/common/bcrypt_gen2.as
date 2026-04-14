; ============================================================
;   Auto-generated from CsWin32 / win32metadata
;   dll:    bcrypt.dll
;   tool:   tools/cswin32_bridge/gen_from_cswin32.py
;   Do not edit by hand ? regenerate via the python script.
;   Needs hsp3net (intptr / NSTRUCT / wstr).
; ============================================================

#ifndef __bcrypt_gen2_as__
#define __bcrypt_gen2_as__

; Shared NSTRUCT + #define constants for all win32 *_gen2.as
#include "win32_types_gen2.as"

;--- functions ---
#uselib "bcrypt.dll"
; winmdroot.Foundation.NTSTATUS BCryptDestroyKey(winmdroot.Security.Cryptography.BCRYPT_KEY_HANDLE hKey)
#cfunc BCryptDestroyKey "BCryptDestroyKey" int

; winmdroot.Foundation.NTSTATUS BCryptDestroyHash(winmdroot.Security.Cryptography.BCRYPT_HASH_HANDLE hHash)
#cfunc BCryptDestroyHash "BCryptDestroyHash" int

; winmdroot.Foundation.NTSTATUS BCryptAddContextFunction(winmdroot.Security.Cryptography.BCRYPT_TABLE dwTable, winmdroot.Foundation.PCWSTR pszContext, winmdroot.Security.Cryptography.BCRYPT_INTERFACE dwInterface, winmdroot.Foundation.PCWSTR pszFunction, uint dwPosition)
#cfunc BCryptAddContextFunction "BCryptAddContextFunction" int, wstr, int, wstr, int

; winmdroot.Foundation.NTSTATUS BCryptCloseAlgorithmProvider(winmdroot.Security.Cryptography.BCRYPT_ALG_HANDLE hAlgorithm, uint dwFlags)
#cfunc BCryptCloseAlgorithmProvider "BCryptCloseAlgorithmProvider" int, int

; winmdroot.Foundation.NTSTATUS BCryptConfigureContext(winmdroot.Security.Cryptography.BCRYPT_TABLE dwTable, winmdroot.Foundation.PCWSTR pszContext, winmdroot.Security.Cryptography.CRYPT_CONTEXT_CONFIG* pConfig)
#cfunc BCryptConfigureContext "BCryptConfigureContext" int, wstr, var

; winmdroot.Foundation.NTSTATUS BCryptConfigureContextFunction(winmdroot.Security.Cryptography.BCRYPT_TABLE dwTable, winmdroot.Foundation.PCWSTR pszContext, winmdroot.Security.Cryptography.BCRYPT_INTERFACE dwInterface, winmdroot.Foundation.PCWSTR pszFunction, winmdroot.Security.Cryptography.CRYPT_CONTEXT_FUNCTION_CONFIG* pConfig)
#cfunc BCryptConfigureContextFunction "BCryptConfigureContextFunction" int, wstr, int, wstr, var

; winmdroot.Foundation.NTSTATUS BCryptCreateContext(winmdroot.Security.Cryptography.BCRYPT_TABLE dwTable, winmdroot.Foundation.PCWSTR pszContext, [Optional] winmdroot.Security.Cryptography.CRYPT_CONTEXT_CONFIG* pConfig)
#cfunc BCryptCreateContext "BCryptCreateContext" int, wstr, var

; winmdroot.Foundation.NTSTATUS BCryptCreateHash(winmdroot.Security.Cryptography.BCRYPT_ALG_HANDLE hAlgorithm, winmdroot.Security.Cryptography.BCRYPT_HASH_HANDLE* phHash, [Optional] byte* pbHashObject, uint cbHashObject, [Optional] byte* pbSecret, uint cbSecret, uint dwFlags)
#cfunc BCryptCreateHash "BCryptCreateHash" int, var, var, int, var, int, int

; winmdroot.Foundation.NTSTATUS BCryptCreateMultiHash(winmdroot.Security.Cryptography.BCRYPT_ALG_HANDLE hAlgorithm, winmdroot.Security.Cryptography.BCRYPT_HASH_HANDLE* phHash, uint nHashes, [Optional] byte* pbHashObject, uint cbHashObject, [Optional] byte* pbSecret, uint cbSecret, uint dwFlags)
#cfunc BCryptCreateMultiHash "BCryptCreateMultiHash" int, var, int, var, int, var, int, int

; winmdroot.Foundation.NTSTATUS BCryptDecrypt(winmdroot.Security.Cryptography.BCRYPT_KEY_HANDLE hKey, [Optional] byte* pbInput, uint cbInput, [Optional] void* pPaddingInfo, [Optional] byte* pbIV, uint cbIV, [Optional] byte* pbOutput, uint cbOutput, uint* pcbResult, winmdroot.Security.Cryptography.BCRYPT_FLAGS dwFlags)
#cfunc BCryptDecrypt "BCryptDecrypt" int, var, int, intptr, var, int, var, int, var, int

; winmdroot.Foundation.NTSTATUS BCryptDeleteContext(winmdroot.Security.Cryptography.BCRYPT_TABLE dwTable, winmdroot.Foundation.PCWSTR pszContext)
#cfunc BCryptDeleteContext "BCryptDeleteContext" int, wstr

; winmdroot.Foundation.NTSTATUS BCryptDestroySecret(winmdroot.Security.Cryptography.BCRYPT_SECRET_HANDLE hSecret)
#cfunc BCryptDestroySecret "BCryptDestroySecret" int

; winmdroot.Foundation.NTSTATUS BCryptDeriveKey(winmdroot.Security.Cryptography.BCRYPT_SECRET_HANDLE hSharedSecret, winmdroot.Foundation.PCWSTR pwszKDF, [Optional] winmdroot.Security.Cryptography.BCryptBufferDesc* pParameterList, [Optional] byte* pbDerivedKey, uint cbDerivedKey, uint* pcbResult, uint dwFlags)
#cfunc BCryptDeriveKey "BCryptDeriveKey" int, wstr, var, var, int, var, int

; winmdroot.Foundation.NTSTATUS BCryptDeriveKeyCapi(winmdroot.Security.Cryptography.BCRYPT_HASH_HANDLE hHash, winmdroot.Security.Cryptography.BCRYPT_ALG_HANDLE hTargetAlg, byte* pbDerivedKey, uint cbDerivedKey, uint dwFlags)
#cfunc BCryptDeriveKeyCapi "BCryptDeriveKeyCapi" int, int, var, int, int

; winmdroot.Foundation.NTSTATUS BCryptDeriveKeyPBKDF2(winmdroot.Security.Cryptography.BCRYPT_ALG_HANDLE hPrf, [Optional] byte* pbPassword, uint cbPassword, [Optional] byte* pbSalt, uint cbSalt, ulong cIterations, byte* pbDerivedKey, uint cbDerivedKey, uint dwFlags)
#cfunc BCryptDeriveKeyPBKDF2 "BCryptDeriveKeyPBKDF2" int, var, int, var, int, int64, var, int, int

; winmdroot.Foundation.NTSTATUS BCryptDuplicateHash(winmdroot.Security.Cryptography.BCRYPT_HASH_HANDLE hHash, winmdroot.Security.Cryptography.BCRYPT_HASH_HANDLE* phNewHash, [Optional] byte* pbHashObject, uint cbHashObject, uint dwFlags)
#cfunc BCryptDuplicateHash "BCryptDuplicateHash" int, var, var, int, int

; winmdroot.Foundation.NTSTATUS BCryptDuplicateKey(winmdroot.Security.Cryptography.BCRYPT_KEY_HANDLE hKey, winmdroot.Security.Cryptography.BCRYPT_KEY_HANDLE* phNewKey, [Optional] byte* pbKeyObject, uint cbKeyObject, uint dwFlags)
#cfunc BCryptDuplicateKey "BCryptDuplicateKey" int, var, var, int, int

; winmdroot.Foundation.NTSTATUS BCryptEncrypt(winmdroot.Security.Cryptography.BCRYPT_KEY_HANDLE hKey, [Optional] byte* pbInput, uint cbInput, [Optional] void* pPaddingInfo, [Optional] byte* pbIV, uint cbIV, [Optional] byte* pbOutput, uint cbOutput, uint* pcbResult, winmdroot.Security.Cryptography.BCRYPT_FLAGS dwFlags)
#cfunc BCryptEncrypt "BCryptEncrypt" int, var, int, intptr, var, int, var, int, var, int

; winmdroot.Foundation.NTSTATUS BCryptEnumAlgorithms(winmdroot.Security.Cryptography.BCRYPT_OPERATION dwAlgOperations, uint* pAlgCount, winmdroot.Security.Cryptography.BCRYPT_ALGORITHM_IDENTIFIER** ppAlgList, uint dwFlags)
#cfunc BCryptEnumAlgorithms "BCryptEnumAlgorithms" int, var, var, int

; winmdroot.Foundation.NTSTATUS BCryptEnumContextFunctionProviders(winmdroot.Security.Cryptography.BCRYPT_TABLE dwTable, winmdroot.Foundation.PCWSTR pszContext, winmdroot.Security.Cryptography.BCRYPT_INTERFACE dwInterface, winmdroot.Foundation.PCWSTR pszFunction, uint* pcbBuffer, [Optional] winmdroot.Security.Cryptography.CRYPT_CONTEXT_FUNCTION_PROVIDERS** ppBuffer)
#cfunc BCryptEnumContextFunctionProviders "BCryptEnumContextFunctionProviders" int, wstr, int, wstr, var, var

; winmdroot.Foundation.NTSTATUS BCryptEnumContextFunctions(winmdroot.Security.Cryptography.BCRYPT_TABLE dwTable, winmdroot.Foundation.PCWSTR pszContext, winmdroot.Security.Cryptography.BCRYPT_INTERFACE dwInterface, uint* pcbBuffer, [Optional] winmdroot.Security.Cryptography.CRYPT_CONTEXT_FUNCTIONS** ppBuffer)
#cfunc BCryptEnumContextFunctions "BCryptEnumContextFunctions" int, wstr, int, var, var

; winmdroot.Foundation.NTSTATUS BCryptEnumContexts(winmdroot.Security.Cryptography.BCRYPT_TABLE dwTable, uint* pcbBuffer, [Optional] winmdroot.Security.Cryptography.CRYPT_CONTEXTS** ppBuffer)
#cfunc BCryptEnumContexts "BCryptEnumContexts" int, var, var

; winmdroot.Foundation.NTSTATUS BCryptEnumProviders(winmdroot.Foundation.PCWSTR pszAlgId, uint* pImplCount, winmdroot.Security.Cryptography.BCRYPT_PROVIDER_NAME** ppImplList, uint dwFlags)
#cfunc BCryptEnumProviders "BCryptEnumProviders" wstr, var, var, int

; winmdroot.Foundation.NTSTATUS BCryptEnumRegisteredProviders(uint* pcbBuffer, [Optional] winmdroot.Security.Cryptography.CRYPT_PROVIDERS** ppBuffer)
#cfunc BCryptEnumRegisteredProviders "BCryptEnumRegisteredProviders" var, var

; winmdroot.Foundation.NTSTATUS BCryptExportKey(winmdroot.Security.Cryptography.BCRYPT_KEY_HANDLE hKey, winmdroot.Security.Cryptography.BCRYPT_KEY_HANDLE hExportKey, winmdroot.Foundation.PCWSTR pszBlobType, [Optional] byte* pbOutput, uint cbOutput, uint* pcbResult, uint dwFlags)
#cfunc BCryptExportKey "BCryptExportKey" int, int, wstr, var, int, var, int

; winmdroot.Foundation.NTSTATUS BCryptFinalizeKeyPair(winmdroot.Security.Cryptography.BCRYPT_KEY_HANDLE hKey, uint dwFlags)
#cfunc BCryptFinalizeKeyPair "BCryptFinalizeKeyPair" int, int

; winmdroot.Foundation.NTSTATUS BCryptFinishHash(winmdroot.Security.Cryptography.BCRYPT_HASH_HANDLE hHash, byte* pbOutput, uint cbOutput, uint dwFlags)
#cfunc BCryptFinishHash "BCryptFinishHash" int, var, int, int

; void BCryptFreeBuffer(void* pvBuffer)
#func BCryptFreeBuffer "BCryptFreeBuffer" intptr

; winmdroot.Foundation.NTSTATUS BCryptGenRandom(winmdroot.Security.Cryptography.BCRYPT_ALG_HANDLE hAlgorithm, byte* pbBuffer, uint cbBuffer, winmdroot.Security.Cryptography.BCRYPTGENRANDOM_FLAGS dwFlags)
#cfunc BCryptGenRandom "BCryptGenRandom" int, var, int, int

; winmdroot.Foundation.NTSTATUS BCryptGenerateKeyPair(winmdroot.Security.Cryptography.BCRYPT_ALG_HANDLE hAlgorithm, winmdroot.Security.Cryptography.BCRYPT_KEY_HANDLE* phKey, uint dwLength, uint dwFlags)
#cfunc BCryptGenerateKeyPair "BCryptGenerateKeyPair" int, var, int, int

; winmdroot.Foundation.NTSTATUS BCryptGenerateSymmetricKey(winmdroot.Security.Cryptography.BCRYPT_ALG_HANDLE hAlgorithm, winmdroot.Security.Cryptography.BCRYPT_KEY_HANDLE* phKey, [Optional] byte* pbKeyObject, uint cbKeyObject, byte* pbSecret, uint cbSecret, uint dwFlags)
#cfunc BCryptGenerateSymmetricKey "BCryptGenerateSymmetricKey" int, var, var, int, var, int, int

; winmdroot.Foundation.NTSTATUS BCryptGetFipsAlgorithmMode(byte* pfEnabled)
#cfunc BCryptGetFipsAlgorithmMode "BCryptGetFipsAlgorithmMode" var

; winmdroot.Foundation.NTSTATUS BCryptGetProperty(winmdroot.Security.Cryptography.BCRYPT_HANDLE hObject, winmdroot.Foundation.PCWSTR pszProperty, [Optional] byte* pbOutput, uint cbOutput, uint* pcbResult, uint dwFlags)
#cfunc BCryptGetProperty "BCryptGetProperty" int, wstr, var, int, var, int

; winmdroot.Foundation.NTSTATUS BCryptHash(winmdroot.Security.Cryptography.BCRYPT_ALG_HANDLE hAlgorithm, [Optional] byte* pbSecret, uint cbSecret, byte* pbInput, uint cbInput, byte* pbOutput, uint cbOutput)
#cfunc BCryptHash "BCryptHash" int, var, int, var, int, var, int

; winmdroot.Foundation.NTSTATUS BCryptHashData(winmdroot.Security.Cryptography.BCRYPT_HASH_HANDLE hHash, byte* pbInput, uint cbInput, uint dwFlags)
#cfunc BCryptHashData "BCryptHashData" int, var, int, int

; winmdroot.Foundation.NTSTATUS BCryptImportKey(winmdroot.Security.Cryptography.BCRYPT_ALG_HANDLE hAlgorithm, winmdroot.Security.Cryptography.BCRYPT_KEY_HANDLE hImportKey, winmdroot.Foundation.PCWSTR pszBlobType, winmdroot.Security.Cryptography.BCRYPT_KEY_HANDLE* phKey, [Optional] byte* pbKeyObject, uint cbKeyObject, byte* pbInput, uint cbInput, uint dwFlags)
#cfunc BCryptImportKey "BCryptImportKey" int, int, wstr, var, var, int, var, int, int

; winmdroot.Foundation.NTSTATUS BCryptImportKeyPair(winmdroot.Security.Cryptography.BCRYPT_ALG_HANDLE hAlgorithm, winmdroot.Security.Cryptography.BCRYPT_KEY_HANDLE hImportKey, winmdroot.Foundation.PCWSTR pszBlobType, winmdroot.Security.Cryptography.BCRYPT_KEY_HANDLE* phKey, byte* pbInput, uint cbInput, uint dwFlags)
#cfunc BCryptImportKeyPair "BCryptImportKeyPair" int, int, wstr, var, var, int, int

; winmdroot.Foundation.NTSTATUS BCryptKeyDerivation(winmdroot.Security.Cryptography.BCRYPT_KEY_HANDLE hKey, [Optional] winmdroot.Security.Cryptography.BCryptBufferDesc* pParameterList, byte* pbDerivedKey, uint cbDerivedKey, uint* pcbResult, uint dwFlags)
#cfunc BCryptKeyDerivation "BCryptKeyDerivation" int, var, var, int, var, int

; winmdroot.Foundation.NTSTATUS BCryptOpenAlgorithmProvider(winmdroot.Security.Cryptography.BCRYPT_ALG_HANDLE* phAlgorithm, winmdroot.Foundation.PCWSTR pszAlgId, winmdroot.Foundation.PCWSTR pszImplementation, winmdroot.Security.Cryptography.BCRYPT_OPEN_ALGORITHM_PROVIDER_FLAGS dwFlags)
#cfunc BCryptOpenAlgorithmProvider "BCryptOpenAlgorithmProvider" var, wstr, wstr, int

; winmdroot.Foundation.NTSTATUS BCryptProcessMultiOperations(winmdroot.Security.Cryptography.BCRYPT_HANDLE hObject, winmdroot.Security.Cryptography.BCRYPT_MULTI_OPERATION_TYPE operationType, void* pOperations, uint cbOperations, uint dwFlags)
#cfunc BCryptProcessMultiOperations "BCryptProcessMultiOperations" int, int, intptr, int, int

; winmdroot.Foundation.NTSTATUS BCryptQueryContextConfiguration(winmdroot.Security.Cryptography.BCRYPT_TABLE dwTable, winmdroot.Foundation.PCWSTR pszContext, uint* pcbBuffer, [Optional] winmdroot.Security.Cryptography.CRYPT_CONTEXT_CONFIG** ppBuffer)
#cfunc BCryptQueryContextConfiguration "BCryptQueryContextConfiguration" int, wstr, var, var

; winmdroot.Foundation.NTSTATUS BCryptQueryContextFunctionConfiguration(winmdroot.Security.Cryptography.BCRYPT_TABLE dwTable, winmdroot.Foundation.PCWSTR pszContext, winmdroot.Security.Cryptography.BCRYPT_INTERFACE dwInterface, winmdroot.Foundation.PCWSTR pszFunction, uint* pcbBuffer, [Optional] winmdroot.Security.Cryptography.CRYPT_CONTEXT_FUNCTION_CONFIG** ppBuffer)
#cfunc BCryptQueryContextFunctionConfiguration "BCryptQueryContextFunctionConfiguration" int, wstr, int, wstr, var, var

; winmdroot.Foundation.NTSTATUS BCryptQueryContextFunctionProperty(winmdroot.Security.Cryptography.BCRYPT_TABLE dwTable, winmdroot.Foundation.PCWSTR pszContext, winmdroot.Security.Cryptography.BCRYPT_INTERFACE dwInterface, winmdroot.Foundation.PCWSTR pszFunction, winmdroot.Foundation.PCWSTR pszProperty, uint* pcbValue, [Optional] byte** ppbValue)
#cfunc BCryptQueryContextFunctionProperty "BCryptQueryContextFunctionProperty" int, wstr, int, wstr, wstr, var, var

; winmdroot.Foundation.NTSTATUS BCryptQueryProviderRegistration(winmdroot.Foundation.PCWSTR pszProvider, winmdroot.Security.Cryptography.BCRYPT_QUERY_PROVIDER_MODE dwMode, winmdroot.Security.Cryptography.BCRYPT_INTERFACE dwInterface, uint* pcbBuffer, [Optional] winmdroot.Security.Cryptography.CRYPT_PROVIDER_REG** ppBuffer)
#cfunc BCryptQueryProviderRegistration "BCryptQueryProviderRegistration" wstr, int, int, var, var

; winmdroot.Foundation.NTSTATUS BCryptRegisterConfigChangeNotify(winmdroot.Foundation.HANDLE* phEvent)
#cfunc BCryptRegisterConfigChangeNotify "BCryptRegisterConfigChangeNotify" intptr

; winmdroot.Foundation.NTSTATUS BCryptRemoveContextFunction(winmdroot.Security.Cryptography.BCRYPT_TABLE dwTable, winmdroot.Foundation.PCWSTR pszContext, winmdroot.Security.Cryptography.BCRYPT_INTERFACE dwInterface, winmdroot.Foundation.PCWSTR pszFunction)
#cfunc BCryptRemoveContextFunction "BCryptRemoveContextFunction" int, wstr, int, wstr

; winmdroot.Foundation.NTSTATUS BCryptResolveProviders(winmdroot.Foundation.PCWSTR pszContext, uint dwInterface, winmdroot.Foundation.PCWSTR pszFunction, winmdroot.Foundation.PCWSTR pszProvider, winmdroot.Security.Cryptography.BCRYPT_QUERY_PROVIDER_MODE dwMode, winmdroot.Security.Cryptography.BCRYPT_RESOLVE_PROVIDERS_FLAGS dwFlags, uint* pcbBuffer, [Optional] winmdroot.Security.Cryptography.CRYPT_PROVIDER_REFS** ppBuffer)
#cfunc BCryptResolveProviders "BCryptResolveProviders" wstr, int, wstr, wstr, int, int, var, var

; winmdroot.Foundation.NTSTATUS BCryptSecretAgreement(winmdroot.Security.Cryptography.BCRYPT_KEY_HANDLE hPrivKey, winmdroot.Security.Cryptography.BCRYPT_KEY_HANDLE hPubKey, winmdroot.Security.Cryptography.BCRYPT_SECRET_HANDLE* phAgreedSecret, uint dwFlags)
#cfunc BCryptSecretAgreement "BCryptSecretAgreement" int, int, var, int

; winmdroot.Foundation.NTSTATUS BCryptSetContextFunctionProperty(winmdroot.Security.Cryptography.BCRYPT_TABLE dwTable, winmdroot.Foundation.PCWSTR pszContext, winmdroot.Security.Cryptography.BCRYPT_INTERFACE dwInterface, winmdroot.Foundation.PCWSTR pszFunction, winmdroot.Foundation.PCWSTR pszProperty, uint cbValue, [Optional] byte* pbValue)
#cfunc BCryptSetContextFunctionProperty "BCryptSetContextFunctionProperty" int, wstr, int, wstr, wstr, int, var

; winmdroot.Foundation.NTSTATUS BCryptSetProperty(winmdroot.Security.Cryptography.BCRYPT_HANDLE hObject, winmdroot.Foundation.PCWSTR pszProperty, byte* pbInput, uint cbInput, uint dwFlags)
#cfunc BCryptSetProperty "BCryptSetProperty" int, wstr, var, int, int

; winmdroot.Foundation.NTSTATUS BCryptSignHash(winmdroot.Security.Cryptography.BCRYPT_KEY_HANDLE hKey, [Optional] void* pPaddingInfo, byte* pbInput, uint cbInput, [Optional] byte* pbOutput, uint cbOutput, uint* pcbResult, winmdroot.Security.Cryptography.BCRYPT_FLAGS dwFlags)
#cfunc BCryptSignHash "BCryptSignHash" int, intptr, var, int, var, int, var, int

; winmdroot.Foundation.NTSTATUS BCryptUnregisterConfigChangeNotify(winmdroot.Foundation.HANDLE hEvent)
#cfunc BCryptUnregisterConfigChangeNotify "BCryptUnregisterConfigChangeNotify" intptr

; winmdroot.Foundation.NTSTATUS BCryptVerifySignature(winmdroot.Security.Cryptography.BCRYPT_KEY_HANDLE hKey, [Optional] void* pPaddingInfo, byte* pbHash, uint cbHash, byte* pbSignature, uint cbSignature, winmdroot.Security.Cryptography.BCRYPT_FLAGS dwFlags)
#cfunc BCryptVerifySignature "BCryptVerifySignature" int, intptr, var, int, var, int, int

#endif
