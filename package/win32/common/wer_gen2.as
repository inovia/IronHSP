; ============================================================
;   Auto-generated from CsWin32 / win32metadata
;   dll:    wer.dll
;   tool:   tools/cswin32_bridge/gen_from_cswin32.py
;   Do not edit by hand ? regenerate via the python script.
;   Needs hsp3net (intptr / NSTRUCT / wstr).
; ============================================================

#ifndef __wer_gen2_as__
#define global __wer_gen2_as__

; Shared NSTRUCT + #define constants for all win32 *_gen2.as
#include "win32_types_gen2.as"

;--- functions ---
#uselib "wer.dll"
; winmdroot.Foundation.HRESULT WerAddExcludedApplication(winmdroot.Foundation.PCWSTR pwzExeName, winmdroot.Foundation.BOOL bAllUsers)
#cfunc global WerAddExcludedApplication "WerAddExcludedApplication" wstr, int

; void WerFreeString(winmdroot.Foundation.PCWSTR pwszStr)
#func global WerFreeString "WerFreeString" wstr

; winmdroot.Foundation.HRESULT WerRemoveExcludedApplication(winmdroot.Foundation.PCWSTR pwzExeName, winmdroot.Foundation.BOOL bAllUsers)
#cfunc global WerRemoveExcludedApplication "WerRemoveExcludedApplication" wstr, int

; winmdroot.Foundation.HRESULT WerReportCloseHandle(winmdroot.System.ErrorReporting.HREPORT hReportHandle)
#cfunc global WerReportCloseHandle "WerReportCloseHandle" intptr

; winmdroot.Foundation.HRESULT WerReportAddFile(winmdroot.System.ErrorReporting.HREPORT hReportHandle, winmdroot.Foundation.PCWSTR pwzPath, winmdroot.System.ErrorReporting.WER_FILE_TYPE repFileType, winmdroot.System.ErrorReporting.WER_FILE dwFileFlags)
#cfunc global WerReportAddFile "WerReportAddFile" intptr, wstr, int, int

; winmdroot.Foundation.HRESULT WerReportCreate(winmdroot.Foundation.PCWSTR pwzEventType, winmdroot.System.ErrorReporting.WER_REPORT_TYPE repType, [Optional] winmdroot.System.ErrorReporting.WER_REPORT_INFORMATION* pReportInformation, winmdroot.System.ErrorReporting.HREPORT* phReportHandle)
#cfunc global WerReportCreate "WerReportCreate" wstr, int, var, intptr

; winmdroot.Foundation.HRESULT WerReportSetParameter(winmdroot.System.ErrorReporting.HREPORT hReportHandle, uint dwparamID, winmdroot.Foundation.PCWSTR pwzName, winmdroot.Foundation.PCWSTR pwzValue)
#cfunc global WerReportSetParameter "WerReportSetParameter" intptr, int, wstr, wstr

; winmdroot.Foundation.HRESULT WerReportSetUIOption(winmdroot.System.ErrorReporting.HREPORT hReportHandle, winmdroot.System.ErrorReporting.WER_REPORT_UI repUITypeID, winmdroot.Foundation.PCWSTR pwzValue)
#cfunc global WerReportSetUIOption "WerReportSetUIOption" intptr, int, wstr

; winmdroot.Foundation.HRESULT WerReportSubmit(winmdroot.System.ErrorReporting.HREPORT hReportHandle, winmdroot.System.ErrorReporting.WER_CONSENT consent, winmdroot.System.ErrorReporting.WER_SUBMIT_FLAGS dwFlags, [Optional] winmdroot.System.ErrorReporting.WER_SUBMIT_RESULT* pSubmitResult)
#cfunc global WerReportSubmit "WerReportSubmit" intptr, int, int, var

; void WerStoreClose(winmdroot.System.ErrorReporting.HREPORTSTORE hReportStore)
#func global WerStoreClose "WerStoreClose" intptr

; winmdroot.Foundation.HRESULT WerStoreGetFirstReportKey(winmdroot.System.ErrorReporting.HREPORTSTORE hReportStore, [Optional] winmdroot.Foundation.PCWSTR* ppszReportKey)
#cfunc global WerStoreGetFirstReportKey "WerStoreGetFirstReportKey" intptr, var

; winmdroot.Foundation.HRESULT WerStoreGetNextReportKey(winmdroot.System.ErrorReporting.HREPORTSTORE hReportStore, [Optional] winmdroot.Foundation.PCWSTR* ppszReportKey)
#cfunc global WerStoreGetNextReportKey "WerStoreGetNextReportKey" intptr, var

; winmdroot.Foundation.HRESULT WerStoreGetReportCount(winmdroot.System.ErrorReporting.HREPORTSTORE hReportStore, uint* pdwReportCount)
#cfunc global WerStoreGetReportCount "WerStoreGetReportCount" intptr, var

; winmdroot.Foundation.HRESULT WerStoreGetSizeOnDisk(winmdroot.System.ErrorReporting.HREPORTSTORE hReportStore, ulong* pqwSizeInBytes)
#cfunc global WerStoreGetSizeOnDisk "WerStoreGetSizeOnDisk" intptr, var

; winmdroot.Foundation.HRESULT WerStoreOpen(winmdroot.System.ErrorReporting.REPORT_STORE_TYPES repStoreType, winmdroot.System.ErrorReporting.HREPORTSTORE* phReportStore)
#cfunc global WerStoreOpen "WerStoreOpen" int, intptr

; winmdroot.Foundation.HRESULT WerStorePurge()
#cfunc global WerStorePurge "WerStorePurge"

; winmdroot.Foundation.HRESULT WerStoreQueryReportMetadataV1(winmdroot.System.ErrorReporting.HREPORTSTORE hReportStore, winmdroot.Foundation.PCWSTR pszReportKey, winmdroot.System.ErrorReporting.WER_REPORT_METADATA_V1* pReportMetadata)
#cfunc global WerStoreQueryReportMetadataV1 "WerStoreQueryReportMetadataV1" intptr, wstr, var

; winmdroot.Foundation.HRESULT WerStoreQueryReportMetadataV2(winmdroot.System.ErrorReporting.HREPORTSTORE hReportStore, winmdroot.Foundation.PCWSTR pszReportKey, winmdroot.System.ErrorReporting.WER_REPORT_METADATA_V2* pReportMetadata)
#cfunc global WerStoreQueryReportMetadataV2 "WerStoreQueryReportMetadataV2" intptr, wstr, var

; winmdroot.Foundation.HRESULT WerStoreQueryReportMetadataV3(winmdroot.System.ErrorReporting.HREPORTSTORE hReportStore, winmdroot.Foundation.PCWSTR pszReportKey, winmdroot.System.ErrorReporting.WER_REPORT_METADATA_V3* pReportMetadata)
#cfunc global WerStoreQueryReportMetadataV3 "WerStoreQueryReportMetadataV3" intptr, wstr, var

; winmdroot.Foundation.HRESULT WerStoreUploadReport(winmdroot.System.ErrorReporting.HREPORTSTORE hReportStore, winmdroot.Foundation.PCWSTR pszReportKey, uint dwFlags, [Optional] winmdroot.System.ErrorReporting.WER_SUBMIT_RESULT* pSubmitResult)
#cfunc global WerStoreUploadReport "WerStoreUploadReport" intptr, wstr, int, var

#endif
