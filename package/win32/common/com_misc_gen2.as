;============================================================
;  COM interfaces (misc) ? auto-generated from CsWin32
;  allowMarshaling=true sandbox
;  tool: tools/cswin32_bridge_com/gen_com_from_cswin32.py
;  hsp3net êÍóp (#usecom / #comfunc + intptr / comobj)
;============================================================

#ifndef __com_misc_gen2_as__
#define __com_misc_gen2_as__

;--- IAdviseSink
#define IID_IAdviseSink "{0000010F-0000-0000-C000-000000000046}"
#usecom IAdviseSink IID_IAdviseSink "{}"
#comfunc IAdviseSink_OnDataChange 3 var, int
#comfunc IAdviseSink_OnViewChange 4 int, int
#comfunc IAdviseSink_OnRename 5 comobj
#comfunc IAdviseSink_OnSave 6
#comfunc IAdviseSink_OnClose 7

;--- IBindCtx
#define IID_IBindCtx "{0000000E-0000-0000-C000-000000000046}"
#usecom IBindCtx IID_IBindCtx "{}"
#comfunc IBindCtx_RegisterObjectBound 3 int
#comfunc IBindCtx_RevokeObjectBound 4 int
#comfunc IBindCtx_ReleaseBoundObjects 5
#comfunc IBindCtx_SetBindOptions 6 var
#comfunc IBindCtx_GetBindOptions 7 var
#comfunc IBindCtx_GetRunningObjectTable 8 comobj
#comfunc IBindCtx_RegisterObjectParam 9 wstr, int
#comfunc IBindCtx_GetObjectParam 10 wstr, int
#comfunc IBindCtx_EnumObjectParam 11 comobj
#comfunc IBindCtx_RevokeObjectParam 12 wstr

;--- IBinding
#define IID_IBinding "{79EAC9C0-BAF9-11CE-8C82-00AA004BA90B}"
#usecom IBinding IID_IBinding "{}"
#comfunc IBinding_Abort 3
#comfunc IBinding_Suspend 4
#comfunc IBinding_Resume 5
#comfunc IBinding_SetPriority 6 int
#comfunc IBinding_GetPriority 7 int
#comfunc IBinding_GetBindResult 8 var, int, var, int

;--- IBindStatusCallback
#define IID_IBindStatusCallback "{79EAC9C1-BAF9-11CE-8C82-00AA004BA90B}"
#usecom IBindStatusCallback IID_IBindStatusCallback "{}"
#comfunc IBindStatusCallback_OnStartBinding 3 int, comobj
#comfunc IBindStatusCallback_GetPriority 4 int
#comfunc IBindStatusCallback_OnLowResource 5 int
#comfunc IBindStatusCallback_OnProgress 6 int, int, int, wstr
#comfunc IBindStatusCallback_OnStopBinding 7 intptr, wstr
#comfunc IBindStatusCallback_GetBindInfo 8 int, int
#comfunc IBindStatusCallback_OnDataAvailable 9 int, int, var, int
#comfunc IBindStatusCallback_OnObjectAvailable 10 var, int

;--- IDataObject
#define IID_IDataObject "{0000010E-0000-0000-C000-000000000046}"
#usecom IDataObject IID_IDataObject "{}"
#comfunc IDataObject_GetData 3 var, int
#comfunc IDataObject_GetDataHere 4 var, int
#comfunc IDataObject_QueryGetData 5 var
#comfunc IDataObject_GetCanonicalFormatEtc 6 var, var
#comfunc IDataObject_SetData 7 var, int, int
#comfunc IDataObject_EnumFormatEtc 8 int, comobj
#comfunc IDataObject_DAdvise 9 var, int, comobj, int
#comfunc IDataObject_DUnadvise 10 int
#comfunc IDataObject_EnumDAdvise 11 comobj

;--- IDropSource
#define IID_IDropSource "{00000121-0000-0000-C000-000000000046}"
#usecom IDropSource IID_IDropSource "{}"
#comfunc IDropSource_QueryContinueDrag 3 int, int
#comfunc IDropSource_GiveFeedback 4 int

;--- IDropTarget
#define IID_IDropTarget "{00000122-0000-0000-C000-000000000046}"
#usecom IDropTarget IID_IDropTarget "{}"
#comfunc IDropTarget_DragEnter 3 comobj, int, int, var
#comfunc IDropTarget_DragOver 4 int, int, var
#comfunc IDropTarget_DragLeave 5
#comfunc IDropTarget_Drop 6 comobj, int, int, var

;--- IEnumFORMATETC
#define IID_IEnumFORMATETC "{00000103-0000-0000-C000-000000000046}"
#usecom IEnumFORMATETC IID_IEnumFORMATETC "{}"
#comfunc IEnumFORMATETC_Next 3 int, var, var
#comfunc IEnumFORMATETC_Skip 4 int
#comfunc IEnumFORMATETC_Reset 5
#comfunc IEnumFORMATETC_Clone 6 comobj

;--- IEnumMoniker
#define IID_IEnumMoniker "{00000102-0000-0000-C000-000000000046}"
#usecom IEnumMoniker IID_IEnumMoniker "{}"
#comfunc IEnumMoniker_Next 3 int, comobj, var
#comfunc IEnumMoniker_Skip 4 int
#comfunc IEnumMoniker_Reset 5
#comfunc IEnumMoniker_Clone 6 comobj

;--- IEnumShellItems
#define IID_IEnumShellItems "{70629033-E363-4A28-A567-0DB78006E6D7}"
#usecom IEnumShellItems IID_IEnumShellItems "{}"
#comfunc IEnumShellItems_Next 3 int, comobj, var
#comfunc IEnumShellItems_Skip 4 int
#comfunc IEnumShellItems_Reset 5
#comfunc IEnumShellItems_Clone 6 comobj

;--- IEnumSTATDATA
#define IID_IEnumSTATDATA "{00000105-0000-0000-C000-000000000046}"
#usecom IEnumSTATDATA IID_IEnumSTATDATA "{}"
#comfunc IEnumSTATDATA_Next 3 int, int, var
#comfunc IEnumSTATDATA_Skip 4 int
#comfunc IEnumSTATDATA_Reset 5
#comfunc IEnumSTATDATA_Clone 6 comobj

;--- IEnumString
#define IID_IEnumString "{00000101-0000-0000-C000-000000000046}"
#usecom IEnumString IID_IEnumString "{}"
#comfunc IEnumString_Next 3 int, var, var
#comfunc IEnumString_Skip 4 int
#comfunc IEnumString_Reset 5
#comfunc IEnumString_Clone 6 comobj

;--- IFileDialog
#define IID_IFileDialog "{42F85136-DB7E-439C-85F1-E4075D135FC8}"
#usecom IFileDialog IID_IFileDialog "{}"
#comfunc IFileDialog_Show 3 intptr
#comfunc IFileDialog_SetFileTypes 4 int, var
#comfunc IFileDialog_SetFileTypeIndex 5 int
#comfunc IFileDialog_GetFileTypeIndex 6 int
#comfunc IFileDialog_Advise 7 comobj, int
#comfunc IFileDialog_Unadvise 8 int
#comfunc IFileDialog_SetOptions 9 int
#comfunc IFileDialog_GetOptions 10 var
#comfunc IFileDialog_SetDefaultFolder 11 comobj
#comfunc IFileDialog_SetFolder 12 comobj
#comfunc IFileDialog_GetFolder 13 comobj
#comfunc IFileDialog_GetCurrentSelection 14 comobj
#comfunc IFileDialog_SetFileName 15 wstr
#comfunc IFileDialog_GetFileName 16 var
#comfunc IFileDialog_SetTitle 17 wstr
#comfunc IFileDialog_SetOkButtonLabel 18 wstr
#comfunc IFileDialog_SetFileNameLabel 19 wstr
#comfunc IFileDialog_GetResult 20 comobj
#comfunc IFileDialog_AddPlace 21 comobj, int
#comfunc IFileDialog_SetDefaultExtension 22 wstr
#comfunc IFileDialog_Close 23 intptr
#comfunc IFileDialog_SetClientGuid 24 var
#comfunc IFileDialog_ClearClientData 25
#comfunc IFileDialog_SetFilter 26 comobj

;--- IFileDialogEvents
#define IID_IFileDialogEvents "{973510DB-7D7F-452B-8975-74A85828D354}"
#usecom IFileDialogEvents IID_IFileDialogEvents "{}"
#comfunc IFileDialogEvents_OnFileOk 3 comobj
#comfunc IFileDialogEvents_OnFolderChanging 4 comobj, comobj
#comfunc IFileDialogEvents_OnFolderChange 5 comobj
#comfunc IFileDialogEvents_OnSelectionChange 6 comobj
#comfunc IFileDialogEvents_OnShareViolation 7 comobj, comobj, var
#comfunc IFileDialogEvents_OnTypeChange 8 comobj
#comfunc IFileDialogEvents_OnOverwrite 9 comobj, comobj, var

;--- IFileOpenDialog
#define IID_IFileOpenDialog "{D57C7288-D4AD-4768-BE02-9D969532D960}"
#usecom IFileOpenDialog IID_IFileOpenDialog "{}"
#comfunc IFileOpenDialog_Show 3 intptr
#comfunc IFileOpenDialog_SetFileTypes 4 int, var
#comfunc IFileOpenDialog_SetFileTypeIndex 5 int
#comfunc IFileOpenDialog_GetFileTypeIndex 6 int
#comfunc IFileOpenDialog_Advise 7 comobj, int
#comfunc IFileOpenDialog_Unadvise 8 int
#comfunc IFileOpenDialog_SetOptions 9 int
#comfunc IFileOpenDialog_GetOptions 10 var
#comfunc IFileOpenDialog_SetDefaultFolder 11 comobj
#comfunc IFileOpenDialog_SetFolder 12 comobj
#comfunc IFileOpenDialog_GetFolder 13 comobj
#comfunc IFileOpenDialog_GetCurrentSelection 14 comobj
#comfunc IFileOpenDialog_SetFileName 15 wstr
#comfunc IFileOpenDialog_GetFileName 16 var
#comfunc IFileOpenDialog_SetTitle 17 wstr
#comfunc IFileOpenDialog_SetOkButtonLabel 18 wstr
#comfunc IFileOpenDialog_SetFileNameLabel 19 wstr
#comfunc IFileOpenDialog_GetResult 20 comobj
#comfunc IFileOpenDialog_AddPlace 21 comobj, int
#comfunc IFileOpenDialog_SetDefaultExtension 22 wstr
#comfunc IFileOpenDialog_Close 23 intptr
#comfunc IFileOpenDialog_SetClientGuid 24 var
#comfunc IFileOpenDialog_ClearClientData 25
#comfunc IFileOpenDialog_SetFilter 26 comobj
#comfunc IFileOpenDialog_GetResults 27 comobj
#comfunc IFileOpenDialog_GetSelectedItems 28 comobj

;--- IFileOperationProgressSink
#define IID_IFileOperationProgressSink "{04B0F1A7-9490-44BC-96E1-4296A31252E2}"
#usecom IFileOperationProgressSink IID_IFileOperationProgressSink "{}"
#comfunc IFileOperationProgressSink_StartOperations 3
#comfunc IFileOperationProgressSink_FinishOperations 4 intptr
#comfunc IFileOperationProgressSink_PreRenameItem 5 int, comobj, wstr
#comfunc IFileOperationProgressSink_PostRenameItem 6 int, comobj, wstr, intptr, comobj
#comfunc IFileOperationProgressSink_PreMoveItem 7 int, comobj, comobj, wstr
#comfunc IFileOperationProgressSink_PostMoveItem 8 int, comobj, comobj, wstr, intptr, comobj
#comfunc IFileOperationProgressSink_PreCopyItem 9 int, comobj, comobj, wstr
#comfunc IFileOperationProgressSink_PostCopyItem 10 int, comobj, comobj, wstr, intptr, comobj
#comfunc IFileOperationProgressSink_PreDeleteItem 11 int, comobj
#comfunc IFileOperationProgressSink_PostDeleteItem 12 int, comobj, intptr, comobj
#comfunc IFileOperationProgressSink_PreNewItem 13 int, comobj, wstr
#comfunc IFileOperationProgressSink_PostNewItem 14 int, comobj, wstr, wstr, int, intptr, comobj
#comfunc IFileOperationProgressSink_UpdateProgress 15 int, int
#comfunc IFileOperationProgressSink_ResetTimer 16
#comfunc IFileOperationProgressSink_PauseTimer 17
#comfunc IFileOperationProgressSink_ResumeTimer 18

;--- IFileSaveDialog
#define IID_IFileSaveDialog "{84BCCD23-5FDE-4CDB-AEA4-AF64B83D78AB}"
#usecom IFileSaveDialog IID_IFileSaveDialog "{}"
#comfunc IFileSaveDialog_Show 3 intptr
#comfunc IFileSaveDialog_SetFileTypes 4 int, var
#comfunc IFileSaveDialog_SetFileTypeIndex 5 int
#comfunc IFileSaveDialog_GetFileTypeIndex 6 int
#comfunc IFileSaveDialog_Advise 7 comobj, int
#comfunc IFileSaveDialog_Unadvise 8 int
#comfunc IFileSaveDialog_SetOptions 9 int
#comfunc IFileSaveDialog_GetOptions 10 var
#comfunc IFileSaveDialog_SetDefaultFolder 11 comobj
#comfunc IFileSaveDialog_SetFolder 12 comobj
#comfunc IFileSaveDialog_GetFolder 13 comobj
#comfunc IFileSaveDialog_GetCurrentSelection 14 comobj
#comfunc IFileSaveDialog_SetFileName 15 wstr
#comfunc IFileSaveDialog_GetFileName 16 var
#comfunc IFileSaveDialog_SetTitle 17 wstr
#comfunc IFileSaveDialog_SetOkButtonLabel 18 wstr
#comfunc IFileSaveDialog_SetFileNameLabel 19 wstr
#comfunc IFileSaveDialog_GetResult 20 comobj
#comfunc IFileSaveDialog_AddPlace 21 comobj, int
#comfunc IFileSaveDialog_SetDefaultExtension 22 wstr
#comfunc IFileSaveDialog_Close 23 intptr
#comfunc IFileSaveDialog_SetClientGuid 24 var
#comfunc IFileSaveDialog_ClearClientData 25
#comfunc IFileSaveDialog_SetFilter 26 comobj
#comfunc IFileSaveDialog_SetSaveAsItem 27 comobj
#comfunc IFileSaveDialog_SetProperties 28 comobj
#comfunc IFileSaveDialog_SetCollectedProperties 29 comobj, int
#comfunc IFileSaveDialog_GetProperties 30 comobj
#comfunc IFileSaveDialog_ApplyProperties 31 comobj, comobj, intptr, comobj

;--- IModalWindow
#define IID_IModalWindow "{B4DB1657-70D7-485E-8E3E-6FCB5A5C1802}"
#usecom IModalWindow IID_IModalWindow "{}"
#comfunc IModalWindow_Show 3 intptr

;--- IMoniker
#define IID_IMoniker "{0000000F-0000-0000-C000-000000000046}"
#usecom IMoniker IID_IMoniker "{}"
#comfunc IMoniker_GetClassID 3 var
#comfunc IMoniker_IsDirty 4
#comfunc IMoniker_Load 5 comobj
#comfunc IMoniker_Save 6 comobj, int
#comfunc IMoniker_GetSizeMax 7 int64
#comfunc IMoniker_BindToObject 8 comobj, comobj, var, int
#comfunc IMoniker_BindToStorage 9 comobj, comobj, var, int
#comfunc IMoniker_Reduce 10 comobj, int, comobj, comobj
#comfunc IMoniker_ComposeWith 11 comobj, int, comobj
#comfunc IMoniker_Enum 12 int, comobj
#comfunc IMoniker_IsEqual 13 comobj
#comfunc IMoniker_Hash 14 int
#comfunc IMoniker_IsRunning 15 comobj, comobj, comobj
#comfunc IMoniker_GetTimeOfLastChange 16 comobj, comobj, var
#comfunc IMoniker_Inverse 17 comobj
#comfunc IMoniker_CommonPrefixWith 18 comobj, comobj
#comfunc IMoniker_RelativePathTo 19 comobj, comobj
#comfunc IMoniker_GetDisplayName 20 comobj, comobj, var
#comfunc IMoniker_ParseDisplayName 21 comobj, comobj, wstr, int, comobj
#comfunc IMoniker_IsSystemMoniker 22 int

;--- IPersist
#define IID_IPersist "{0000010C-0000-0000-C000-000000000046}"
#usecom IPersist IID_IPersist "{}"
#comfunc IPersist_GetClassID 3 var

;--- IPersistFile
#define IID_IPersistFile "{0000010B-0000-0000-C000-000000000046}"
#usecom IPersistFile IID_IPersistFile "{}"
#comfunc IPersistFile_GetClassID 3 var
#comfunc IPersistFile_IsDirty 4
#comfunc IPersistFile_Load 5 wstr, int
#comfunc IPersistFile_Save 6 wstr, int
#comfunc IPersistFile_SaveCompleted 7 wstr
#comfunc IPersistFile_GetCurFile 8 var

;--- IPersistStream
#define IID_IPersistStream "{00000109-0000-0000-C000-000000000046}"
#usecom IPersistStream IID_IPersistStream "{}"
#comfunc IPersistStream_GetClassID 3 var
#comfunc IPersistStream_IsDirty 4
#comfunc IPersistStream_Load 5 comobj
#comfunc IPersistStream_Save 6 comobj, int
#comfunc IPersistStream_GetSizeMax 7 int64

;--- IPropertyDescriptionList
#define IID_IPropertyDescriptionList "{1F9FC1D0-C39B-4B26-817F-011967D3440E}"
#usecom IPropertyDescriptionList IID_IPropertyDescriptionList "{}"
#comfunc IPropertyDescriptionList_GetCount 3 int
#comfunc IPropertyDescriptionList_GetAt 4 int, var, int

;--- IPropertyStore
#define IID_IPropertyStore "{886D8EEB-8CF2-4446-8D02-CDBA1DBDCF99}"
#usecom IPropertyStore IID_IPropertyStore "{}"
#comfunc IPropertyStore_GetCount 3 int
#comfunc IPropertyStore_GetAt 4 int, var
#comfunc IPropertyStore_GetValue 5 var, int
#comfunc IPropertyStore_SetValue 6 var, int
#comfunc IPropertyStore_Commit 7

;--- IRunningObjectTable
#define IID_IRunningObjectTable "{00000010-0000-0000-C000-000000000046}"
#usecom IRunningObjectTable IID_IRunningObjectTable "{}"
#comfunc IRunningObjectTable_Register 3 int, int, comobj, int
#comfunc IRunningObjectTable_Revoke 4 int
#comfunc IRunningObjectTable_IsRunning 5 comobj
#comfunc IRunningObjectTable_GetObject 6 comobj, int
#comfunc IRunningObjectTable_NoteChangeTime 7 int, var
#comfunc IRunningObjectTable_GetTimeOfLastChange 8 comobj, var
#comfunc IRunningObjectTable_EnumRunning 9 comobj

;--- ISequentialStream
#define IID_ISequentialStream "{0C733A30-2A1C-11CE-ADE5-00AA0044773D}"
#usecom ISequentialStream IID_ISequentialStream "{}"
#comfunc ISequentialStream_Read 3 intptr, int, var
#comfunc ISequentialStream_Write 4 intptr, int, var

;--- IShellItem
#define IID_IShellItem "{43826D1E-E718-42EE-BC55-A1E261C37BFE}"
#usecom IShellItem IID_IShellItem "{}"
#comfunc IShellItem_BindToHandler 3 comobj, var, var, int
#comfunc IShellItem_GetParent 4 comobj
#comfunc IShellItem_GetDisplayName 5 int, var
#comfunc IShellItem_GetAttributes 6 int, var
#comfunc IShellItem_Compare 7 comobj, int, int

;--- IShellItemArray
#define IID_IShellItemArray "{B63EA76D-1F85-456F-A19C-48159EFA858B}"
#usecom IShellItemArray IID_IShellItemArray "{}"
#comfunc IShellItemArray_BindToHandler 3 comobj, var, var, int
#comfunc IShellItemArray_GetPropertyStore 4 int, var, int
#comfunc IShellItemArray_GetPropertyDescriptionList 5 var, var, int
#comfunc IShellItemArray_GetAttributes 6 int, int, var
#comfunc IShellItemArray_GetCount 7 int
#comfunc IShellItemArray_GetItemAt 8 int, comobj
#comfunc IShellItemArray_EnumItems 9 comobj

;--- IShellItemFilter
#define IID_IShellItemFilter "{2659B475-EEB8-48B7-8F07-B378810F48CF}"
#usecom IShellItemFilter IID_IShellItemFilter "{}"
#comfunc IShellItemFilter_IncludeItem 3 comobj
#comfunc IShellItemFilter_GetEnumFlagsForItem 4 comobj, int

;--- IShellLinkW
#define IID_IShellLinkW "{000214F9-0000-0000-C000-000000000046}"
#usecom IShellLinkW IID_IShellLinkW "{}"
#comfunc IShellLinkW_GetPath 3 wstr, int, var, int
#comfunc IShellLinkW_GetIDList 4 comobj
#comfunc IShellLinkW_SetIDList 5 comobj
#comfunc IShellLinkW_GetDescription 6 wstr, int
#comfunc IShellLinkW_SetDescription 7 wstr
#comfunc IShellLinkW_GetWorkingDirectory 8 wstr, int
#comfunc IShellLinkW_SetWorkingDirectory 9 wstr
#comfunc IShellLinkW_GetArguments 10 wstr, int
#comfunc IShellLinkW_SetArguments 11 wstr
#comfunc IShellLinkW_GetHotkey 12 int
#comfunc IShellLinkW_SetHotkey 13 int
#comfunc IShellLinkW_GetShowCmd 14 var
#comfunc IShellLinkW_SetShowCmd 15 int
#comfunc IShellLinkW_GetIconLocation 16 wstr, int, int
#comfunc IShellLinkW_SetIconLocation 17 wstr, int
#comfunc IShellLinkW_SetRelativePath 18 wstr, int
#comfunc IShellLinkW_Resolve 19 intptr, int
#comfunc IShellLinkW_SetPath 20 wstr

;--- IStream
#define IID_IStream "{0000000C-0000-0000-C000-000000000046}"
#usecom IStream IID_IStream "{}"
#comfunc IStream_Read 3 intptr, int, var
#comfunc IStream_Write 4 intptr, int, var
#comfunc IStream_Seek 5 int64, int, var
#comfunc IStream_SetSize 6 int64
#comfunc IStream_CopyTo 7 comobj, int64, var, var
#comfunc IStream_Commit 8 int
#comfunc IStream_Revert 9
#comfunc IStream_LockRegion 10 int64, int64, int
#comfunc IStream_UnlockRegion 11 int64, int64, int
#comfunc IStream_Stat 12 var, int
#comfunc IStream_Clone 13 comobj

#endif
