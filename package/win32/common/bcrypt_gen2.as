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
; winmdroot.Foundation.NTSTATUS BCryptDestroyHash(winmdroot.Security.Cryptography.BCRYPT_HASH_HANDLE hHash)
#cfunc BCryptDestroyHash "BCryptDestroyHash" int

; winmdroot.Foundation.NTSTATUS BCryptCloseAlgorithmProvider(winmdroot.Security.Cryptography.BCRYPT_ALG_HANDLE hAlgorithm, uint dwFlags)
#cfunc BCryptCloseAlgorithmProvider "BCryptCloseAlgorithmProvider" int, int

; winmdroot.Foundation.NTSTATUS BCryptCreateHash(winmdroot.Security.Cryptography.BCRYPT_ALG_HANDLE hAlgorithm, winmdroot.Security.Cryptography.BCRYPT_HASH_HANDLE* phHash, [Optional] byte* pbHashObject, uint cbHashObject, [Optional] byte* pbSecret, uint cbSecret, uint dwFlags)
#cfunc BCryptCreateHash "BCryptCreateHash" int, var, var, int, var, int, int

; winmdroot.Foundation.NTSTATUS BCryptDestroyKey(winmdroot.Security.Cryptography.BCRYPT_KEY_HANDLE hKey)
#cfunc BCryptDestroyKey "BCryptDestroyKey" int

; winmdroot.Foundation.NTSTATUS BCryptDecrypt(winmdroot.Security.Cryptography.BCRYPT_KEY_HANDLE hKey, [Optional] byte* pbInput, uint cbInput, [Optional] void* pPaddingInfo, [Optional] byte* pbIV, uint cbIV, [Optional] byte* pbOutput, uint cbOutput, uint* pcbResult, winmdroot.Security.Cryptography.BCRYPT_FLAGS dwFlags)
#cfunc BCryptDecrypt "BCryptDecrypt" int, var, int, intptr, var, int, var, int, var, int

; winmdroot.Foundation.NTSTATUS BCryptEncrypt(winmdroot.Security.Cryptography.BCRYPT_KEY_HANDLE hKey, [Optional] byte* pbInput, uint cbInput, [Optional] void* pPaddingInfo, [Optional] byte* pbIV, uint cbIV, [Optional] byte* pbOutput, uint cbOutput, uint* pcbResult, winmdroot.Security.Cryptography.BCRYPT_FLAGS dwFlags)
#cfunc BCryptEncrypt "BCryptEncrypt" int, var, int, intptr, var, int, var, int, var, int

; winmdroot.Foundation.NTSTATUS BCryptFinishHash(winmdroot.Security.Cryptography.BCRYPT_HASH_HANDLE hHash, byte* pbOutput, uint cbOutput, uint dwFlags)
#cfunc BCryptFinishHash "BCryptFinishHash" int, var, int, int

; winmdroot.Foundation.NTSTATUS BCryptGenRandom(winmdroot.Security.Cryptography.BCRYPT_ALG_HANDLE hAlgorithm, byte* pbBuffer, uint cbBuffer, winmdroot.Security.Cryptography.BCRYPTGENRANDOM_FLAGS dwFlags)
#cfunc BCryptGenRandom "BCryptGenRandom" int, var, int, int

; winmdroot.Foundation.NTSTATUS BCryptHashData(winmdroot.Security.Cryptography.BCRYPT_HASH_HANDLE hHash, byte* pbInput, uint cbInput, uint dwFlags)
#cfunc BCryptHashData "BCryptHashData" int, var, int, int

; winmdroot.Foundation.NTSTATUS BCryptOpenAlgorithmProvider(winmdroot.Security.Cryptography.BCRYPT_ALG_HANDLE* phAlgorithm, winmdroot.Foundation.PCWSTR pszAlgId, winmdroot.Foundation.PCWSTR pszImplementation, winmdroot.Security.Cryptography.BCRYPT_OPEN_ALGORITHM_PROVIDER_FLAGS dwFlags)
#cfunc BCryptOpenAlgorithmProvider "BCryptOpenAlgorithmProvider" var, wstr, wstr, int

#endif
