; ============================================================
;   wmvcore.dll ヘルプ (CsWin32 / win32metadata から自動抽出)
;   docs_ja.json に日本語訳があればそちらを使用、無ければ英語原文。
;   翻訳を追加するときは docs_ja.json を編集して再生成。
; ============================================================

%index
WMCreateBackupRestorer
The WMCreateBackupRestorer function creates a backup restorer object.
%group
Win32 wmvcore
%prm
pCallback, ppBackup
pCallback : [var] Pointer to an IWMStatusCallback interface containing the OnStatus callback method to be used by the new backup restorer object.
ppBackup : [var] Pointer to a pointer to the IWMLicenseBackup interface of the newly created backup restorer object.
%inst
The WMCreateBackupRestorer function creates a backup restorer object.

[戻り値]
The method returns an HRESULT. Possible values include, but are not
limited to, those in the following table.
This doc was truncated.

[備考]
Use IWMLicenseBackup::QueryInterface to obtain a pointer to the
IWMBackupRestoreProps interface.


%index
WMCreateEditor
The WMCreateEditor function creates a metadata editor object.
%group
Win32 wmvcore
%prm
ppEditor
ppEditor : [var] Pointer to a pointer to the IWMMetadataEditor interface of the newly created metadata editor object.
%inst
The WMCreateEditor function creates a metadata editor object.

[戻り値]
The method returns an HRESULT. Possible values include, but are not
limited to, those in the following table.
This doc was truncated.


%index
WMCreateIndexer
The WMCreateIndexer function creates an indexer object.
%group
Win32 wmvcore
%prm
ppIndexer
ppIndexer : [var] Pointer to a pointer to the IWMIndexer interface of the newly created indexer object.
%inst
The WMCreateIndexer function creates an indexer object.

[戻り値]
The method returns an HRESULT. Possible values include, but are not
limited to, those in the following table.
This doc was truncated.


%index
WMCreateProfileManager
The WMCreateProfileManager function creates a profile manager object.
%group
Win32 wmvcore
%prm
ppProfileManager
ppProfileManager : [var] Pointer to a pointer to the IWMProfileManager interface of the newly created profile manager object.
%inst
The WMCreateProfileManager function creates a profile manager object.

[戻り値]
The method returns an HRESULT. Possible values include, but are not
limited to, those in the following table.
This doc was truncated.

[備考]
When a profile manager object is created, it parses all of the system
profiles. Creating and releasing a profile manager every time you
need to use it will adversely affect performance. You should create a
profile manager once in your application and release it only when you
no longer need to use it.


%index
WMCreateReader
The WMCreateReader function creates a reader object.
%group
Win32 wmvcore
%prm
pUnkCert, dwRights, ppReader
pUnkCert : [var] This value must be set to NULL.
dwRights : [int] DWORD indicating the desired operation. Set to one of the values from the WMT_RIGHTS enumeration type, indicating the operation that is performed on this file. If multiple operations are being performed, dwRights must consist of multiple values from WMT_RIGHTS combined by using the bitwise OR operator.
ppReader : [var] Pointer to a pointer to the IWMReader interface of the newly created reader object.
%inst
The WMCreateReader function creates a reader object.

[戻り値]
The method returns an HRESULT. Possible values include, but are not
limited to, those in the following table.
This doc was truncated.

[備考]
After this object has been created, you can modify the rights that
will be requested for the next file opened by calling
IWMDRMReader::SetDRMProperty with the DRM_Rights property. Note that
when using this property, the rights are specified as strings, not as
DWORD values. The dwRights parameter may be set to 0 when reading
non-DRM content. If dwRights is set to 0 and you open a protected
file, you can access license related metadata, but you cannot read
data from any streams in the file.


%index
WMCreateSyncReader
The WMCreateSyncReader function creates a synchronous reader object.
%group
Win32 wmvcore
%prm
pUnkCert, dwRights, ppSyncReader
pUnkCert : [var] Pointer to an IUnknown interface. This value must be set to NULL.
dwRights : [int] DWORD specifying the desired operation. When playing back non-DRM content, or for an application that does not have DRM rights, this value can be set to zero. Otherwise, this value must be one of the values from the WMT_RIGHTS enumeration type, indicating the operation that is performed on this file. If multiple operations are being performed, dwRights must consist of multiple values from WMT_RIGHTS combined by using the bitwise OR operator.
ppSyncReader : [var] Pointer to a pointer to the IWMSyncReader interface of the newly created synchronous reader object.
%inst
The WMCreateSyncReader function creates a synchronous reader object.

[戻り値]
The method returns an HRESULT. Possible values include, but are not
limited to, those in the following table.
This doc was truncated.


%index
WMCreateWriter
The WMCreateWriter function creates a writer object.
%group
Win32 wmvcore
%prm
pUnkCert, ppWriter
pUnkCert : [var] Pointer to an IUnknown interface. This value is not used and should be set to NULL.
ppWriter : [var] Pointer to a pointer to the IWMWriter interface of the newly created writer object.
%inst
The WMCreateWriter function creates a writer object.

[戻り値]
The method returns an HRESULT. Possible values include, but are not
limited to, those in the following table.
This doc was truncated.


%index
WMCreateWriterFileSink
The WMCreateWriterFileSink function creates a writer file sink object.
%group
Win32 wmvcore
%prm
ppSink
ppSink : [var] Pointer to a pointer to the IWMWriterFileSink interface of the newly created writer file sink object.
%inst
The WMCreateWriterFileSink function creates a writer file sink
object.

[戻り値]
The method returns an HRESULT. Possible values include, but are not
limited to, those in the following table.
This doc was truncated.


%index
WMCreateWriterNetworkSink
The WMCreateWriterNetworkSink function creates a writer network sink object.
%group
Win32 wmvcore
%prm
ppSink
ppSink : [var] Pointer to a pointer to the IWMWriterNetworkSink interface of the newly created writer network sink object.
%inst
The WMCreateWriterNetworkSink function creates a writer network sink
object.

[戻り値]
The method returns an HRESULT. Possible values include, but are not
limited to, those in the following table.
This doc was truncated.


%index
WMCreateWriterPushSink
The WMCreateWriterPushSink function creates a writer push sink object. Push sinks are used to deliver streaming content to other media servers for distribution.
%group
Win32 wmvcore
%prm
ppSink
ppSink : [var] Pointer to a pointer to the IWMWriterPushSink interface of the newly created writer push sink object.
%inst
The WMCreateWriterPushSink function creates a writer push sink
object. Push sinks are used to deliver streaming content to other
media servers for distribution.

[戻り値]
The method returns an HRESULT. Possible values include, but are not
limited to, those in the following table.
This doc was truncated.


%index
WMIsContentProtected
The WMIsContentProtected function checks a file for DRM-protected content. This function is a shortcut so that your application can quickly identify protected files.
%group
Win32 wmvcore
%prm
pwszFileName, pfIsProtected
pwszFileName : [wstr] Pointer to a wide-character null-terminated string containing the name of the file to check for DRM-protected content.
pfIsProtected : [var] Pointer to a Boolean value that is set to True on function return if the file contains DRM-protected content.
%inst
The WMIsContentProtected function checks a file for DRM-protected
content. This function is a shortcut so that your application can
quickly identify protected files.

[戻り値]
The function returns an HRESULT. Possible values include, but are not
limited to, those in the following table.
This doc was truncated.

