; ============================================================
;   wintrust.dll ヘルプ (CsWin32 / win32metadata から自動抽出)
;   docs_ja.json に日本語訳があればそちらを使用、無ければ英語原文。
;   翻訳を追加するときは docs_ja.json を編集して再生成。
; ============================================================

%index
CryptSIPCreateIndirectData
Returns a SIP_INDIRECT_DATA structure that contains a hash of the supplied SIP_SUBJECTINFO structure, the digest algorithm, and an encoding attribute. The hash can be used as an indirect reference to the data.
%group
Win32 wintrust
%prm
pSubjectInfo, pcbIndirectData, pIndirectData
pSubjectInfo : [var] A pointer to a [SIP_SUBJECTINFO](/windows/desktop/api/mssip/ns-mssip-sip_subjectinfo) structure that contains the subject to which the indirect data reference will point.
pcbIndirectData : [var] A pointer to a [SIP_INDIRECT_DATA](/windows/desktop/api/mssip/ns-mssip-sip_indirect_data) structure.
pIndirectData : [var] A pointer to a [SIP_INDIRECT_DATA](/windows/desktop/api/mssip/ns-mssip-sip_indirect_data) structure to receive the catalog item.
%inst
Returns a SIP_INDIRECT_DATA structure that contains a hash of the
supplied SIP_SUBJECTINFO structure, the digest algorithm, and an
encoding attribute. The hash can be used as an indirect reference to
the data.

[戻り値]
The return value is TRUE if the function succeeds; otherwise, FALSE.
If this function returns FALSE, additional error information can be
obtained by calling the GetLastError function. GetLastError will
return one of the following error codes.
This doc was truncated.

[備考]
If pcbIndirectData points to a DWORD and pIndirectData points to
NULL, the size of the data will be returned in pcbIndirectData.


%index
CryptSIPGetCaps
Retrieves the capabilities of a subject interface package (SIP).
%group
Win32 wintrust
%prm
pSubjInfo, pCaps
pSubjInfo : [var] Pointer to a [SIP_SUBJECTINFO](/windows/desktop/api/mssip/ns-mssip-sip_subjectinfo) structure that specifies subject information data to the SIP APIs.
pCaps : [var] Pointer to a SIP_CAP_SET structure that defines the capabilities of an SIP.
%inst
Retrieves the capabilities of a subject interface package (SIP).

[備考]
Unlike other SIP functions,
[SIP_DISPATCH_INFO](/windows/desktop/api/mssip/ns-mssip-sip_dispatch_info)
structure. Instead, callers must map the object identifier (OID) to
the function entry point.


%index
CryptSIPGetSealedDigest
(no summary)
%group
Win32 wintrust
%prm
pSubjectInfo, pSig, dwSig, pbDigest, pcbDigest
pSubjectInfo : [var] 
pSig : [var] 
dwSig : [int] 
pbDigest : [var] 
pcbDigest : [var] 
%inst



%index
CryptSIPGetSignedDataMsg
Retrieves an Authenticode signature from the file.
%group
Win32 wintrust
%prm
pSubjectInfo, pdwEncodingType, dwIndex, pcbSignedDataMsg, pbSignedDataMsg
pSubjectInfo : [var] A pointer to a [SIP_SUBJECTINFO](/windows/desktop/api/mssip/ns-mssip-sip_subjectinfo) structure that contains information about the message subject.
pdwEncodingType : [var] The encoding type of the Authenticode signature.
dwIndex : [int] This parameter is reserved and should be set to zero.
pcbSignedDataMsg : [var] The length, in bytes, of the buffer pointed to by the pbSignedDataMsg parameter.
pbSignedDataMsg : [var] A pointer to a buffer to receive the returned Authenticode signature. To determine the size of the buffer needed, set the pbSignedDataMsg parameter to NULL and call the CryptSIPGetSignedDataMsg function. This function will place the required size of the buffer, in bytes, in the value pointed to by pcbSignedDataMsg. For more information, see Retrieving Data of Unknown Length.
%inst
Retrieves an Authenticode signature from the file.

[戻り値]
If the function succeeds, the function returns TRUE. If the function
fails, it returns FALSE. For extended error information, call
GetLastError. Some possible error codes follow.
This doc was truncated.

[備考]
Subjects include, but are not limited to, portable executable images
(.exe), cabinet (.cab) images, flat files, and catalog files. Each
subject type uses a different subset of its data for hash calculation
and requires a different procedure for storage and retrieval.
Therefore, each subject type has a unique SIP specification.


%index
CryptSIPPutSignedDataMsg
Stores an Authenticode signature in the target file.
%group
Win32 wintrust
%prm
pSubjectInfo, dwEncodingType, pdwIndex, cbSignedDataMsg, pbSignedDataMsg
pSubjectInfo : [var] Pointer to a [SIP_SUBJECTINFO](/windows/desktop/api/mssip/ns-mssip-sip_subjectinfo) structure that contains information about the message subject.
dwEncodingType : [int] 
pdwIndex : [var] Pointer to the message index.
cbSignedDataMsg : [int] Length, in bytes, of the buffer pointed to by the pbSignedDataMsg parameter.
pbSignedDataMsg : [var] Pointer to the buffer that contains the message.
%inst
Stores an Authenticode signature in the target file.

[戻り値]
If the function succeeds, the function returns TRUE. If the function
fails, it returns FALSE. For extended error information, call
GetLastError. Some possible error codes follow.
This doc was truncated.

[備考]
Each subject type uses a different subset of its data for hash
calculation and requires a different procedure for storage and
retrieval. Therefore, each subject type has a unique SIP
specification.


%index
CryptSIPRemoveSignedDataMsg
Removes a specified Authenticode signature.
%group
Win32 wintrust
%prm
pSubjectInfo, dwIndex
pSubjectInfo : [var] A pointer to a [SIP_SUBJECTINFO](/windows/desktop/api/mssip/ns-mssip-sip_subjectinfo) structure that contains information about the message subject.
dwIndex : [int] This parameter is reserved and should be set to zero.
%inst
Removes a specified Authenticode signature.

[戻り値]
If the function succeeds, the function returns TRUE. If the function
fails, it returns FALSE. For extended error information, call
GetLastError.


%index
CryptSIPVerifyIndirectData
Validates the indirect hashed data against the supplied subject.
%group
Win32 wintrust
%prm
pSubjectInfo, pIndirectData
pSubjectInfo : [var] A pointer to a [SIP_SUBJECTINFO](/windows/desktop/api/mssip/ns-mssip-sip_subjectinfo) structure that contains information about the message subject.
pIndirectData : [var] A pointer to a [SIP_INDIRECT_DATA](/windows/desktop/api/mssip/ns-mssip-sip_indirect_data) structure that contains information about the hashed subject information.
%inst
Validates the indirect hashed data against the supplied subject.

[戻り値]
The return value is TRUE if the function succeeds; otherwise, FALSE.
If this function returns FALSE, additional error information can be
obtained by calling the GetLastError function. GetLastError will
return one of the following error codes.
This doc was truncated.

[備考]
Subjects include, but are not limited to, portable executable images
(.exe), cabinet (.cab) images, flat files, and catalog files. Each
subject type uses a different subset of its data for hash calculation
and requires a different procedure for storage and retrieval.
Therefore each subject type has a unique subject interface package
specification.

