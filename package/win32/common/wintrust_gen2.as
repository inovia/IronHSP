; ============================================================
;   Auto-generated from CsWin32 / win32metadata
;   dll:    wintrust.dll
;   tool:   tools/cswin32_bridge/gen_from_cswin32.py
;   Do not edit by hand ? regenerate via the python script.
;   Needs hsp3net (intptr / NSTRUCT / wstr).
; ============================================================

#ifndef __wintrust_gen2_as__
#define __wintrust_gen2_as__

; Shared NSTRUCT + #define constants for all win32 *_gen2.as
#include "win32_types_gen2.as"

;--- functions ---
#uselib "wintrust.dll"
; winmdroot.Foundation.BOOL CryptSIPCreateIndirectData(winmdroot.Security.Cryptography.Sip.SIP_SUBJECTINFO* pSubjectInfo, uint* pcbIndirectData, winmdroot.Security.Cryptography.Sip.SIP_INDIRECT_DATA* pIndirectData)
#cfunc CryptSIPCreateIndirectData "CryptSIPCreateIndirectData" var, var, var

; winmdroot.Foundation.BOOL CryptSIPGetCaps(winmdroot.Security.Cryptography.Sip.SIP_SUBJECTINFO* pSubjInfo, winmdroot.Security.Cryptography.Sip.SIP_CAP_SET_V3* pCaps)
#cfunc CryptSIPGetCaps "CryptSIPGetCaps" var, var

; winmdroot.Foundation.BOOL CryptSIPGetSealedDigest(winmdroot.Security.Cryptography.Sip.SIP_SUBJECTINFO* pSubjectInfo, [Optional] byte* pSig, uint dwSig, [Optional] byte* pbDigest, uint* pcbDigest)
#cfunc CryptSIPGetSealedDigest "CryptSIPGetSealedDigest" var, var, int, var, var

; winmdroot.Foundation.BOOL CryptSIPGetSignedDataMsg(winmdroot.Security.Cryptography.Sip.SIP_SUBJECTINFO* pSubjectInfo, winmdroot.Security.Cryptography.CERT_QUERY_ENCODING_TYPE* pdwEncodingType, uint dwIndex, uint* pcbSignedDataMsg, byte* pbSignedDataMsg)
#cfunc CryptSIPGetSignedDataMsg "CryptSIPGetSignedDataMsg" var, var, int, var, var

; winmdroot.Foundation.BOOL CryptSIPPutSignedDataMsg(winmdroot.Security.Cryptography.Sip.SIP_SUBJECTINFO* pSubjectInfo, winmdroot.Security.Cryptography.CERT_QUERY_ENCODING_TYPE dwEncodingType, uint* pdwIndex, uint cbSignedDataMsg, byte* pbSignedDataMsg)
#cfunc CryptSIPPutSignedDataMsg "CryptSIPPutSignedDataMsg" var, int, var, int, var

; winmdroot.Foundation.BOOL CryptSIPRemoveSignedDataMsg(winmdroot.Security.Cryptography.Sip.SIP_SUBJECTINFO* pSubjectInfo, uint dwIndex)
#cfunc CryptSIPRemoveSignedDataMsg "CryptSIPRemoveSignedDataMsg" var, int

; winmdroot.Foundation.BOOL CryptSIPVerifyIndirectData(winmdroot.Security.Cryptography.Sip.SIP_SUBJECTINFO* pSubjectInfo, winmdroot.Security.Cryptography.Sip.SIP_INDIRECT_DATA* pIndirectData)
#cfunc CryptSIPVerifyIndirectData "CryptSIPVerifyIndirectData" var, var

#endif
