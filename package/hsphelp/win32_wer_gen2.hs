; ============================================================
;   wer.dll ヘルプ (CsWin32 / win32metadata から自動抽出)
;   docs_ja.json に日本語訳があればそちらを使用、無ければ英語原文。
;   翻訳を追加するときは docs_ja.json を編集して再生成。
; ============================================================

%index
WerAddExcludedApplication
Adds the specified application to the list of applications that are to be excluded from error reporting.
%group
Win32 wer
%prm
pwzExeName, bAllUsers
pwzExeName : [wstr] A pointer to a Unicode string that specifies the name of the executable file for the application, including the file name extension. The maximum length of this path is MAX_PATH characters.
bAllUsers : [int] If this parameter is TRUE, the application name is added to the list of excluded applications for all users. Otherwise, it is only added to the list of excluded applications for the current user.
%inst
Adds the specified application to the list of applications that are
to be excluded from error reporting.

[戻り値]
This function returns S_OK on success or an error code on failure,
including the following error code.
This doc was truncated.

[備考]
If bAllUsers is TRUE, the list of excluded applications is stored
under the HKEY_LOCAL_MACHINE registry hive. The calling process must
have permissions to write to the HKLM registry hive. If bAllUsers is
FALSE, the list of excluded applications is stored under the
HKEY_CURRENT_USER registry hive. To remove the application from the
list of excluded applications, call the WerRemoveExcludedApplication
function.


%index
WerFreeString
Frees up the memory used to store a report key string. This should be called after each successive call to WerStoreGetFirstReportKey or WerStoreGetNextReportKey, once the particular report key string has been used and is no longer needed.
%group
Win32 wer
%prm
pwszStr
pwszStr : [wstr] The string to be freed (value set to NULL).
%inst
Frees up the memory used to store a report key string. This should be
called after each successive call to WerStoreGetFirstReportKey or
WerStoreGetNextReportKey, once the particular report key string has
been used and is no longer needed.


%index
WerRemoveExcludedApplication
Removes the specified application from the list of applications that are to be excluded from error reporting.
%group
Win32 wer
%prm
pwzExeName, bAllUsers
pwzExeName : [wstr] A pointer to a Unicode string that specifies the name of the executable file for the application, including the file name extension. The maximum length of this path is MAX_PATH characters. This file must have been excluded using the WerAddExcludedApplication function or WerRemoveExcludedApplication fails.
bAllUsers : [int] If this parameter is TRUE, the application name is removed from the list of excluded applications for all users. Otherwise, it is only removed from the list of excluded applications for the current user.
%inst
Removes the specified application from the list of applications that
are to be excluded from error reporting.

[戻り値]
This function returns S_OK on success or an error code on failure,
including the following error code.
This doc was truncated.

[備考]
This function removes applications that were added to the excluded
applications list using the WerAddExcludedApplication function. If
bAllUsers is TRUE, the list of excluded applications is stored under
the HKEY_LOCAL_MACHINE registry hive. The calling process must have
permissions to write to HKLM registry hive. If bAllUsers is FALSE,
the list of excluded applications is stored under the
HKEY_CURRENT_USER registry hive.


%index
WerReportCloseHandle
Closes the specified report.
%group
Win32 wer
%prm
hReportHandle
hReportHandle : [intptr] A handle to the report. This handle is returned by the WerReportCreate function.
%inst
Closes the specified report.

[戻り値]
This function returns S_OK on success or an error code on failure.


%index
WerReportAddFile
Adds a file to the specified report.
%group
Win32 wer
%prm
hReportHandle, pwzPath, repFileType, dwFileFlags
hReportHandle : [intptr] A handle to the report. This handle is returned by the WerReportCreate function.
pwzPath : [wstr] A pointer to a Unicode string that contains the full path to the file to be added. This path can use environment variables. The maximum length of this path is MAX_PATH characters.
repFileType : [int] 
dwFileFlags : [int] 
%inst
Adds a file to the specified report.

[戻り値]
This function returns S_OK on success or an error code on failure,
including the following error code.
This doc was truncated.

[備考]
Although this function can also be used to add memory dumps (using
specific flags) to the error report, the preferred function to use
for adding memory dumps is WerReportAddDump. You should use this
function only if you want to collect the dump yourself and then add
it to the report.


%index
WerReportCreate
Creates a problem report that describes an application event.
%group
Win32 wer
%prm
pwzEventType, repType, pReportInformation, phReportHandle
pwzEventType : [wstr] A pointer to a Unicode string that specifies the name of the event.
repType : [int] 
pReportInformation : [var] A pointer to a WER_REPORT_INFORMATION structure that specifies information for the report.
phReportHandle : [intptr] A handle to the report. If the function fails, this handle is NULL.
%inst
Creates a problem report that describes an application event.

[戻り値]
This function returns S_OK on success or an error code on failure.

[備考]
Use the following functions to specify additional information to be
submitted: WerReportAddDump WerReportAddFile WerReportSetParameter To
submit the information, call the WerReportSubmit function. When you
have finished with the report handle, call the WerReportCloseHandle
function. Applications can also indicate that they would like the
opportunity to recover data or restart on failure. For more
information, see Application Recovery and Restart. To view the
reports submitted by your application, go to Windows Quality Online
Services.


%index
WerReportSetParameter
Sets the parameters that uniquely identify an event for the specified report.
%group
Win32 wer
%prm
hReportHandle, dwparamID, pwzName, pwzValue
hReportHandle : [intptr] A handle to the report. This handle is returned by the WerReportCreate function.
dwparamID : [int] 
pwzName : [wstr] A pointer to a Unicode string that contains the name of the parameter. If this parameter is NULL, the default name is Px, where x matches the integer portion of the value specified in dwparamID.
pwzValue : [wstr] The parameter value.
%inst
Sets the parameters that uniquely identify an event for the specified
report.

[戻り値]
This function returns S_OK on success or an error code on failure,
including the following error code.
This doc was truncated.

[備考]
Each report supports parameters P0 through P9. This function sets one
parameter at a time. If parameter Px is set, then all parameters from
P0 and Px must be set.


%index
WerReportSetUIOption
Sets the user interface options for the specified report.
%group
Win32 wer
%prm
hReportHandle, repUITypeID, pwzValue
hReportHandle : [intptr] A handle to the report. This handle is returned by the WerReportCreate function.
repUITypeID : [int] 
pwzValue : [wstr] A pointer to a Unicode string that specifies the custom text. For more information, see the description of repUITypeID.
%inst
Sets the user interface options for the specified report.

[戻り値]
This function returns S_OK on success or an error code on failure.


%index
WerReportSubmit
Submits the specified report.
%group
Win32 wer
%prm
hReportHandle, consent, dwFlags, pSubmitResult
hReportHandle : [intptr] A handle to the report. This handle is returned by the WerReportCreate function.
consent : [int] 
dwFlags : [int] 
pSubmitResult : [var] 
%inst
Submits the specified report.

[戻り値]
This function returns S_OK on success or an error code on failure.

[備考]
After the application calls this function, WER collects the specified
data. If the consent parameter is WerConsentApproved, it submits the
report to Microsoft. If consent is WerConsentNotAsked, WER displays
the consent dialog box. To determine the submission status, check the
pSubmitResult parameter. In the event of a critical application
event, applications that have registered for restart will be
restarted. The computer identifier is sent with the report when
This doc was truncated.


%index
WerStoreClose
Closes the collection of stored reports.
%group
Win32 wer
%prm
hReportStore
hReportStore : [intptr] The error report store to close (previously retrieved with WerStoreOpen).
%inst
Closes the collection of stored reports.


%index
WerStoreGetFirstReportKey
Gets a reference to the first report in the report store.
%group
Win32 wer
%prm
hReportStore, ppszReportKey
hReportStore : [intptr] The error report store (previously retrieved with WerStoreOpen).
ppszReportKey : [var] A pointer to the report key string. On a successful call, this will point to the retrieved report key.
%inst
Gets a reference to the first report in the report store.

[戻り値]
This function returns S_OK on success or an error code on failure,
including the following error code.
This doc was truncated.


%index
WerStoreGetNextReportKey
Gets a reference to the next report in the error report store.
%group
Win32 wer
%prm
hReportStore, ppszReportKey
hReportStore : [intptr] The error report store (previously retrieved with WerStoreOpen).
ppszReportKey : [var] A pointer to the report key string. On a successful call, this will point to the retrieved report key.
%inst
Gets a reference to the next report in the error report store.

[戻り値]
This function returns S_OK on success or an error code on failure,
including the following error code.
This doc was truncated.


%index
WerStoreGetReportCount
(no summary)
%group
Win32 wer
%prm
hReportStore, pdwReportCount
hReportStore : [intptr] 
pdwReportCount : [var] 
%inst



%index
WerStoreGetSizeOnDisk
(no summary)
%group
Win32 wer
%prm
hReportStore, pqwSizeInBytes
hReportStore : [intptr] 
pqwSizeInBytes : [var] 
%inst



%index
WerStoreOpen
Opens the collection of stored error reports.
%group
Win32 wer
%prm
repStoreType, phReportStore
repStoreType : [int] The type of report store to open. See Remarks for details.
phReportStore : [intptr] A pointer to a report store. On a successful call, this will point to the retrieved report store.
%inst
Opens the collection of stored error reports.

[戻り値]
This function returns S_OK on success or an error code on failure,
including the following error code.
This doc was truncated.

[備考]
A storeType value of E_STORE_MACHINE_QUEUE opens the queue of all
error reports on the machine that have not yet been sent to
Microsoft. A value of E_STORE_MACHINE_ARCHIVE opens the store of
error reports that have already been sent. The Windows Error Report
(WER) Store is the queue of error reports that have been marked to be
sent to Microsoft but have not yet been uploaded. The upload of an
error report can be postponed under a number of circumstances. The
WerStore functions allow developers to access the stored reports and
query the status of each one.


%index
WerStorePurge
(no summary)
%group
Win32 wer
%prm

%inst



%index
WerStoreQueryReportMetadataV1
(no summary)
%group
Win32 wer
%prm
hReportStore, pszReportKey, pReportMetadata
hReportStore : [intptr] 
pszReportKey : [wstr] 
pReportMetadata : [var] 
%inst



%index
WerStoreQueryReportMetadataV2
Retrieves metadata about a report in the store.
%group
Win32 wer
%prm
hReportStore, pszReportKey, pReportMetadata
hReportStore : [intptr] The error report store (previously retrieved with WerStoreOpen).
pszReportKey : [wstr] The string identifying which report is being queried (previously retrieved with WerStoreGetFirstReportKey or WerStoreGetNextReportKey).
pReportMetadata : [var] A pointer to the report store metadata in the form of a WER_REPORT_METADATA_V2 structure. The field SizeOfFileNames should be set to 0 during the first call. The function updates this field with the required size to hold the file names associated with the report. The field FileNames should then be allocated with SizeOfFileNames bytes and the function should be called again to get all of the file names.
%inst
Retrieves metadata about a report in the store.

[戻り値]
This function returns S_OK on success or an error code on failure,
including the following error code.
This doc was truncated.


%index
WerStoreQueryReportMetadataV3
(no summary)
%group
Win32 wer
%prm
hReportStore, pszReportKey, pReportMetadata
hReportStore : [intptr] 
pszReportKey : [wstr] 
pReportMetadata : [var] 
%inst



%index
WerStoreUploadReport
(no summary)
%group
Win32 wer
%prm
hReportStore, pszReportKey, dwFlags, pSubmitResult
hReportStore : [intptr] 
pszReportKey : [wstr] 
dwFlags : [int] 
pSubmitResult : [var] 
%inst


