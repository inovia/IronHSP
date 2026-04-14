; ============================================================
;   Auto-generated from CsWin32 / win32metadata
;   dll:    shell32.dll
;   tool:   tools/cswin32_bridge/gen_from_cswin32.py
;   Do not edit by hand ? regenerate via the python script.
;   Needs hsp3net (intptr / NSTRUCT / wstr).
; ============================================================

#ifndef __shell32_gen2_as__
#define global __shell32_gen2_as__

; Shared NSTRUCT + #define constants for all win32 *_gen2.as
#include "win32_types_gen2.as"

;--- functions ---
#uselib "shell32.dll"
; winmdroot.Foundation.HRESULT AssocGetDetailsOfPropKey(winmdroot.UI.Shell.IShellFolder* psf, winmdroot.UI.Shell.Common.ITEMIDLIST* pidl, winmdroot.UI.Shell.PropertiesSystem.PROPERTYKEY* pkey, winmdroot.System.Variant.VARIANT* pv, [Optional] winmdroot.Foundation.BOOL* pfFoundPropKey)
#cfunc global AssocGetDetailsOfPropKey "AssocGetDetailsOfPropKey" var, var, var, var, var

; winmdroot.Foundation.HRESULT CDefFolderMenu_Create2([Optional] winmdroot.UI.Shell.Common.ITEMIDLIST* pidlFolder, winmdroot.Foundation.HWND hwnd, uint cidl, [Optional] winmdroot.UI.Shell.Common.ITEMIDLIST** apidl, [Optional] winmdroot.UI.Shell.IShellFolder* psf, delegate *unmanaged[Stdcall]<global::Windows.Win32.UI.Shell.IShellFolder*,global::Windows.Win32.Foundation.HWND,global::Windows.Win32.System.Com.IDataObject*,uint,global::Windows.Win32.Foundation.WPARAM,global::Windows.Win32.Foundation.LPARAM,global::Windows.Win32.Foundation.HRESULT> pfn, uint nKeys, [Optional] winmdroot.System.Registry.HKEY* ahkeys, winmdroot.UI.Shell.IContextMenu** ppcm)
#cfunc global CDefFolderMenu_Create2 "CDefFolderMenu_Create2" var, intptr, int, var, var, int, int, intptr, var

; winmdroot.Foundation.HRESULT CIDLData_CreateFromIDArray(winmdroot.UI.Shell.Common.ITEMIDLIST* pidlFolder, uint cidl, [Optional] winmdroot.UI.Shell.Common.ITEMIDLIST** apidl, winmdroot.System.Com.IDataObject** ppdtobj)
#cfunc global CIDLData_CreateFromIDArray "CIDLData_CreateFromIDArray" var, int, var, var

; winmdroot.Foundation.PWSTR* CommandLineToArgv(winmdroot.Foundation.PCWSTR lpCmdLine, int* pNumArgs)
#cfunc global CommandLineToArgvW "CommandLineToArgvW" wstr, var

; winmdroot.Foundation.BOOL DAD_AutoScroll(winmdroot.Foundation.HWND hwnd, winmdroot.UI.Shell.AUTO_SCROLL_DATA* pad, global::System.Drawing.Point* pptNow)
#cfunc global DAD_AutoScroll "DAD_AutoScroll" intptr, var, var

; winmdroot.Foundation.BOOL DAD_DragEnterEx(winmdroot.Foundation.HWND hwndTarget, global::System.Drawing.Point ptStart)
#cfunc global DAD_DragEnterEx "DAD_DragEnterEx" intptr, int

; winmdroot.Foundation.BOOL DAD_DragEnterEx2(winmdroot.Foundation.HWND hwndTarget, global::System.Drawing.Point ptStart, [Optional] winmdroot.System.Com.IDataObject* pdtObject)
#cfunc global DAD_DragEnterEx2 "DAD_DragEnterEx2" intptr, int, var

; winmdroot.Foundation.BOOL DAD_DragLeave()
#cfunc global DAD_DragLeave "DAD_DragLeave"

; winmdroot.Foundation.BOOL DAD_DragMove(global::System.Drawing.Point pt)
#cfunc global DAD_DragMove "DAD_DragMove" int

; winmdroot.Foundation.BOOL DAD_SetDragImage(winmdroot.UI.Controls.HIMAGELIST him, global::System.Drawing.Point* pptOffset)
#cfunc global DAD_SetDragImage "DAD_SetDragImage" intptr, var

; winmdroot.Foundation.BOOL DAD_ShowDragImage(winmdroot.Foundation.BOOL fShow)
#cfunc global DAD_ShowDragImage "DAD_ShowDragImage" int

; uint DoEnvironmentSubstW(winmdroot.Foundation.PWSTR pszSrc, uint cchSrc)
#cfunc global DoEnvironmentSubstW "DoEnvironmentSubstW" wstr, int

; void DragAcceptFiles(winmdroot.Foundation.HWND hWnd, winmdroot.Foundation.BOOL fAccept)
#func global DragAcceptFiles "DragAcceptFiles" intptr, int

; void DragFinish(winmdroot.UI.Shell.HDROP hDrop)
#func global DragFinish "DragFinish" intptr

; uint DragQueryFileW(winmdroot.UI.Shell.HDROP hDrop, uint iFile, winmdroot.Foundation.PWSTR lpszFile, uint cch)
#cfunc global DragQueryFileW "DragQueryFileW" intptr, int, wstr, int

; winmdroot.Foundation.BOOL DragQueryPoint(winmdroot.UI.Shell.HDROP hDrop, global::System.Drawing.Point* ppt)
#cfunc global DragQueryPoint "DragQueryPoint" intptr, var

; int DriveType(int iDrive)
#cfunc global DriveType "DriveType" int

; winmdroot.UI.WindowsAndMessaging.HICON DuplicateIcon(winmdroot.Foundation.HINSTANCE hInst, winmdroot.UI.WindowsAndMessaging.HICON hIcon)
#cfunc global DuplicateIcon "DuplicateIcon" intptr, intptr

; winmdroot.UI.WindowsAndMessaging.HICON ExtractAssociatedIconW(winmdroot.Foundation.HINSTANCE hInst, winmdroot.Foundation.PWSTR pszIconPath, ushort* piIcon)
#cfunc global ExtractAssociatedIconW "ExtractAssociatedIconW" intptr, wstr, var

; winmdroot.UI.WindowsAndMessaging.HICON ExtractAssociatedIconExW(winmdroot.Foundation.HINSTANCE hInst, winmdroot.Foundation.PWSTR pszIconPath, ushort* piIconIndex, ushort* piIconId)
#cfunc global ExtractAssociatedIconExW "ExtractAssociatedIconExW" intptr, wstr, var, var

; winmdroot.UI.WindowsAndMessaging.HICON ExtractIconW(winmdroot.Foundation.HINSTANCE hInst, winmdroot.Foundation.PCWSTR pszExeFileName, uint nIconIndex)
#cfunc global ExtractIconW "ExtractIconW" intptr, wstr, int

; uint ExtractIconEx(winmdroot.Foundation.PCWSTR lpszFile, int nIconIndex, [Optional] winmdroot.UI.WindowsAndMessaging.HICON* phiconLarge, [Optional] winmdroot.UI.WindowsAndMessaging.HICON* phiconSmall, uint nIcons)
#cfunc global ExtractIconExW "ExtractIconExW" wstr, int, intptr, intptr, int

; winmdroot.Foundation.HINSTANCE FindExecutableW(winmdroot.Foundation.PCWSTR lpFile, winmdroot.Foundation.PCWSTR lpDirectory, winmdroot.Foundation.PWSTR lpResult)
#cfunc global FindExecutableW "FindExecutableW" wstr, wstr, wstr

; winmdroot.Foundation.HRESULT GetCurrentProcessExplicitAppUserModelID(winmdroot.Foundation.PWSTR* AppID)
#cfunc global GetCurrentProcessExplicitAppUserModelID "GetCurrentProcessExplicitAppUserModelID" var

; winmdroot.Foundation.BOOL GetFileNameFromBrowse(winmdroot.Foundation.HWND hwnd, winmdroot.Foundation.PWSTR pszFilePath, uint cchFilePath, winmdroot.Foundation.PCWSTR pszWorkingDir, winmdroot.Foundation.PCWSTR pszDefExt, winmdroot.Foundation.PCWSTR pszFilters, winmdroot.Foundation.PCWSTR pszTitle)
#cfunc global GetFileNameFromBrowse "GetFileNameFromBrowse" intptr, wstr, int, wstr, wstr, wstr, wstr

; winmdroot.UI.Shell.Common.ITEMIDLIST* ILAppendID([Optional] winmdroot.UI.Shell.Common.ITEMIDLIST* pidl, winmdroot.UI.Shell.Common.SHITEMID* pmkid, winmdroot.Foundation.BOOL fAppend)
#cfunc global ILAppendID "ILAppendID" var, var, int

; winmdroot.UI.Shell.Common.ITEMIDLIST* ILClone(winmdroot.UI.Shell.Common.ITEMIDLIST* pidl)
#cfunc global ILClone "ILClone" var

; winmdroot.UI.Shell.Common.ITEMIDLIST* ILCloneFirst(winmdroot.UI.Shell.Common.ITEMIDLIST* pidl)
#cfunc global ILCloneFirst "ILCloneFirst" var

; winmdroot.UI.Shell.Common.ITEMIDLIST* ILCombine([Optional] winmdroot.UI.Shell.Common.ITEMIDLIST* pidl1, [Optional] winmdroot.UI.Shell.Common.ITEMIDLIST* pidl2)
#cfunc global ILCombine "ILCombine" var, var

; winmdroot.UI.Shell.Common.ITEMIDLIST* ILCreateFromPathW(winmdroot.Foundation.PCWSTR pszPath)
#cfunc global ILCreateFromPathW "ILCreateFromPathW" wstr

; winmdroot.UI.Shell.Common.ITEMIDLIST* ILFindChild(winmdroot.UI.Shell.Common.ITEMIDLIST* pidlParent, winmdroot.UI.Shell.Common.ITEMIDLIST* pidlChild)
#cfunc global ILFindChild "ILFindChild" var, var

; winmdroot.UI.Shell.Common.ITEMIDLIST* ILFindLastID(winmdroot.UI.Shell.Common.ITEMIDLIST* pidl)
#cfunc global ILFindLastID "ILFindLastID" var

; void ILFree([Optional] winmdroot.UI.Shell.Common.ITEMIDLIST* pidl)
#func global ILFree "ILFree" var

; winmdroot.UI.Shell.Common.ITEMIDLIST* ILGetNext([Optional] winmdroot.UI.Shell.Common.ITEMIDLIST* pidl)
#cfunc global ILGetNext "ILGetNext" var

; uint ILGetSize([Optional] winmdroot.UI.Shell.Common.ITEMIDLIST* pidl)
#cfunc global ILGetSize "ILGetSize" var

; winmdroot.Foundation.BOOL ILIsEqual(winmdroot.UI.Shell.Common.ITEMIDLIST* pidl1, winmdroot.UI.Shell.Common.ITEMIDLIST* pidl2)
#cfunc global ILIsEqual "ILIsEqual" var, var

; winmdroot.Foundation.BOOL ILIsParent(winmdroot.UI.Shell.Common.ITEMIDLIST* pidl1, winmdroot.UI.Shell.Common.ITEMIDLIST* pidl2, winmdroot.Foundation.BOOL fImmediate)
#cfunc global ILIsParent "ILIsParent" var, var, int

; winmdroot.Foundation.HRESULT ILLoadFromStreamEx(winmdroot.System.Com.IStream* pstm, winmdroot.UI.Shell.Common.ITEMIDLIST** pidl)
#cfunc global ILLoadFromStreamEx "ILLoadFromStreamEx" var, var

; winmdroot.Foundation.BOOL ILRemoveLastID([Optional] winmdroot.UI.Shell.Common.ITEMIDLIST* pidl)
#cfunc global ILRemoveLastID "ILRemoveLastID" var

; winmdroot.Foundation.HRESULT ILSaveToStream(winmdroot.System.Com.IStream* pstm, winmdroot.UI.Shell.Common.ITEMIDLIST* pidl)
#cfunc global ILSaveToStream "ILSaveToStream" var, var

; winmdroot.Foundation.BOOL InitNetworkAddressControl()
#cfunc global InitNetworkAddressControl "InitNetworkAddressControl"

; winmdroot.Foundation.BOOL IsLFNDriveW(winmdroot.Foundation.PCWSTR pszPath)
#cfunc global IsLFNDriveW "IsLFNDriveW" wstr

; int IsNetDrive(int iDrive)
#cfunc global IsNetDrive "IsNetDrive" int

; winmdroot.Foundation.BOOL IsUserAnAdmin()
#cfunc global IsUserAnAdmin "IsUserAnAdmin"

; winmdroot.System.Com.IStream* OpenRegStream(winmdroot.System.Registry.HKEY hkey, winmdroot.Foundation.PCWSTR pszSubkey, winmdroot.Foundation.PCWSTR pszValue, uint grfMode)
#cfunc global OpenRegStream "OpenRegStream" intptr, wstr, wstr, int

; int PathCleanupSpec(winmdroot.Foundation.PCWSTR pszDir, winmdroot.Foundation.PWSTR pszSpec)
#cfunc global PathCleanupSpec "PathCleanupSpec" wstr, wstr

; void PathGetShortPath(winmdroot.Foundation.PWSTR pszLongPath)
#func global PathGetShortPath "PathGetShortPath" wstr

; winmdroot.Foundation.BOOL PathIsExe(winmdroot.Foundation.PCWSTR pszPath)
#cfunc global PathIsExe "PathIsExe" wstr

; winmdroot.Foundation.BOOL PathIsSlowW(winmdroot.Foundation.PCWSTR pszFile, uint dwAttr)
#cfunc global PathIsSlowW "PathIsSlowW" wstr, int

; winmdroot.Foundation.BOOL PathMakeUniqueName(winmdroot.Foundation.PWSTR pszUniqueName, uint cchMax, winmdroot.Foundation.PCWSTR pszTemplate, winmdroot.Foundation.PCWSTR pszLongPlate, winmdroot.Foundation.PCWSTR pszDir)
#cfunc global PathMakeUniqueName "PathMakeUniqueName" wstr, int, wstr, wstr, wstr

; void PathQualify(winmdroot.Foundation.PWSTR psz)
#func global PathQualify "PathQualify" wstr

; int PathResolve(winmdroot.Foundation.PWSTR pszPath, [Optional] ushort** dirs, uint fFlags)
#cfunc global PathResolve "PathResolve" wstr, var, int

; winmdroot.Foundation.BOOL PathYetAnotherMakeUniqueName(winmdroot.Foundation.PWSTR pszUniqueName, winmdroot.Foundation.PCWSTR pszPath, winmdroot.Foundation.PCWSTR pszShort, winmdroot.Foundation.PCWSTR pszFileSpec)
#cfunc global PathYetAnotherMakeUniqueName "PathYetAnotherMakeUniqueName" wstr, wstr, wstr, wstr

; int PickIconDlg(winmdroot.Foundation.HWND hwnd, winmdroot.Foundation.PWSTR pszIconPath, uint cchIconPath, [Optional] int* piIconIndex)
#cfunc global PickIconDlg "PickIconDlg" intptr, wstr, int, var

; winmdroot.Foundation.HANDLE PifMgr_CloseProperties(winmdroot.Foundation.HANDLE hProps, uint flOpt)
#cfunc global PifMgr_CloseProperties "PifMgr_CloseProperties" intptr, int

; int PifMgr_GetProperties(winmdroot.Foundation.HANDLE hProps, winmdroot.Foundation.PCSTR pszGroup, [Optional] void* lpProps, int cbProps, uint flOpt)
#cfunc global PifMgr_GetProperties "PifMgr_GetProperties" intptr, str, intptr, int, int

; winmdroot.Foundation.HANDLE PifMgr_OpenProperties(winmdroot.Foundation.PCWSTR pszApp, winmdroot.Foundation.PCWSTR pszPIF, uint hInf, uint flOpt)
#cfunc global PifMgr_OpenProperties "PifMgr_OpenProperties" wstr, wstr, int, int

; int PifMgr_SetProperties(winmdroot.Foundation.HANDLE hProps, winmdroot.Foundation.PCSTR pszGroup, void* lpProps, int cbProps, uint flOpt)
#cfunc global PifMgr_SetProperties "PifMgr_SetProperties" intptr, str, intptr, int, int

; winmdroot.Foundation.BOOL ReadCabinetState(winmdroot.UI.Shell.CABINETSTATE* pcs, int cLength)
#cfunc global ReadCabinetState "ReadCabinetState" var, int

; int RealDriveType(int iDrive, winmdroot.Foundation.BOOL fOKToHitNet)
#cfunc global RealDriveType "RealDriveType" int, int

; int RestartDialog(winmdroot.Foundation.HWND hwnd, winmdroot.Foundation.PCWSTR pszPrompt, uint dwReturn)
#cfunc global RestartDialog "RestartDialog" intptr, wstr, int

; int RestartDialogEx(winmdroot.Foundation.HWND hwnd, winmdroot.Foundation.PCWSTR pszPrompt, uint dwReturn, uint dwReasonCode)
#cfunc global RestartDialogEx "RestartDialogEx" intptr, wstr, int, int

; winmdroot.Foundation.HRESULT SHAddDefaultPropertiesByExt(winmdroot.Foundation.PCWSTR pszExt, winmdroot.UI.Shell.PropertiesSystem.IPropertyStore* pPropStore)
#cfunc global SHAddDefaultPropertiesByExt "SHAddDefaultPropertiesByExt" wstr, var

; void SHDestroyPropSheetExtArray(winmdroot.UI.Shell.HPSXA hpsxa)
#func global SHDestroyPropSheetExtArray "SHDestroyPropSheetExtArray" intptr

; uint SHAddFromPropSheetExtArray(winmdroot.UI.Shell.HPSXA hpsxa, delegate *unmanaged[Stdcall]<global::Windows.Win32.UI.Controls.HPROPSHEETPAGE,global::Windows.Win32.Foundation.LPARAM,global::Windows.Win32.Foundation.BOOL> lpfnAddPage, winmdroot.Foundation.LPARAM lParam)
#cfunc global SHAddFromPropSheetExtArray "SHAddFromPropSheetExtArray" intptr, int, intptr

; void SHAddToRecentDocs(uint uFlags, [Optional] void* pv)
#func global SHAddToRecentDocs "SHAddToRecentDocs" int, intptr

; void* SHAlloc(nuint cb)
#cfunc global SHAlloc "SHAlloc" int

; winmdroot.Foundation.HRESULT SHAssocEnumHandlers(winmdroot.Foundation.PCWSTR pszExtra, winmdroot.UI.Shell.ASSOC_FILTER afFilter, winmdroot.UI.Shell.IEnumAssocHandlers** ppEnumHandler)
#cfunc global SHAssocEnumHandlers "SHAssocEnumHandlers" wstr, int, var

; winmdroot.Foundation.HRESULT SHAssocEnumHandlersForProtocolByApplication(winmdroot.Foundation.PCWSTR protocol, global::System.Guid* riid, void** enumHandlers)
#cfunc global SHAssocEnumHandlersForProtocolByApplication "SHAssocEnumHandlersForProtocolByApplication" wstr, var, var

; winmdroot.Foundation.HRESULT SHBindToFolderIDListParent([Optional] winmdroot.UI.Shell.IShellFolder* psfRoot, winmdroot.UI.Shell.Common.ITEMIDLIST* pidl, global::System.Guid* riid, void** ppv, [Optional] winmdroot.UI.Shell.Common.ITEMIDLIST** ppidlLast)
#cfunc global SHBindToFolderIDListParent "SHBindToFolderIDListParent" var, var, var, var, var

; winmdroot.Foundation.HRESULT SHBindToFolderIDListParentEx([Optional] winmdroot.UI.Shell.IShellFolder* psfRoot, winmdroot.UI.Shell.Common.ITEMIDLIST* pidl, [Optional] winmdroot.System.Com.IBindCtx* ppbc, global::System.Guid* riid, void** ppv, [Optional] winmdroot.UI.Shell.Common.ITEMIDLIST** ppidlLast)
#cfunc global SHBindToFolderIDListParentEx "SHBindToFolderIDListParentEx" var, var, var, var, var, var

; winmdroot.Foundation.HRESULT SHBindToObject([Optional] winmdroot.UI.Shell.IShellFolder* psf, winmdroot.UI.Shell.Common.ITEMIDLIST* pidl, [Optional] winmdroot.System.Com.IBindCtx* pbc, global::System.Guid* riid, void** ppv)
#cfunc global SHBindToObject "SHBindToObject" var, var, var, var, var

; winmdroot.Foundation.HRESULT SHBindToParent(winmdroot.UI.Shell.Common.ITEMIDLIST* pidl, global::System.Guid* riid, void** ppv, [Optional] winmdroot.UI.Shell.Common.ITEMIDLIST** ppidlLast)
#cfunc global SHBindToParent "SHBindToParent" var, var, var, var

; winmdroot.UI.Shell.Common.ITEMIDLIST* SHBrowseForFolderW(winmdroot.UI.Shell.BROWSEINFOW* lpbi)
#cfunc global SHBrowseForFolderW "SHBrowseForFolderW" var

; winmdroot.Foundation.HRESULT SHCLSIDFromString(winmdroot.Foundation.PCWSTR psz, global::System.Guid* pclsid)
#cfunc global SHCLSIDFromString "SHCLSIDFromString" wstr, var

; winmdroot.Foundation.HANDLE SHChangeNotification_Lock(winmdroot.Foundation.HANDLE hChange, uint dwProcId, [Optional] winmdroot.UI.Shell.Common.ITEMIDLIST*** pppidl, [Optional] int* plEvent)
#cfunc global SHChangeNotification_Lock "SHChangeNotification_Lock" intptr, int, var, var

; winmdroot.Foundation.BOOL SHChangeNotification_Unlock(winmdroot.Foundation.HANDLE hLock)
#cfunc global SHChangeNotification_Unlock "SHChangeNotification_Unlock" intptr

; void SHChangeNotify(int wEventId, winmdroot.UI.Shell.SHCNF_FLAGS uFlags, [Optional] void* dwItem1, [Optional] void* dwItem2)
#func global SHChangeNotify "SHChangeNotify" int, int, intptr, intptr

; winmdroot.Foundation.BOOL SHChangeNotifyDeregister(uint ulID)
#cfunc global SHChangeNotifyDeregister "SHChangeNotifyDeregister" int

; uint SHChangeNotifyRegister(winmdroot.Foundation.HWND hwnd, winmdroot.UI.Shell.SHCNRF_SOURCE fSources, int fEvents, uint wMsg, int cEntries, winmdroot.UI.Shell.SHChangeNotifyEntry* pshcne)
#cfunc global SHChangeNotifyRegister "SHChangeNotifyRegister" intptr, int, int, int, int, var

; void SHChangeNotifyRegisterThread(winmdroot.UI.Shell.SCNRT_STATUS status)
#func global SHChangeNotifyRegisterThread "SHChangeNotifyRegisterThread" int

; winmdroot.UI.Shell.Common.ITEMIDLIST* SHCloneSpecialIDList(winmdroot.Foundation.HWND hwnd, int csidl, winmdroot.Foundation.BOOL fCreate)
#cfunc global SHCloneSpecialIDList "SHCloneSpecialIDList" intptr, int, int

; winmdroot.Foundation.HRESULT SHCoCreateInstance(winmdroot.Foundation.PCWSTR pszCLSID, [Optional] global::System.Guid* pclsid, [Optional] winmdroot.System.Com.IUnknown* pUnkOuter, global::System.Guid* riid, void** ppv)
#cfunc global SHCoCreateInstance "SHCoCreateInstance" wstr, var, var, var, var

; winmdroot.Foundation.HRESULT SHCreateAssociationRegistration(global::System.Guid* riid, void** ppv)
#cfunc global SHCreateAssociationRegistration "SHCreateAssociationRegistration" var, var

; winmdroot.Foundation.HRESULT SHCreateDataObject([Optional] winmdroot.UI.Shell.Common.ITEMIDLIST* pidlFolder, uint cidl, [Optional] winmdroot.UI.Shell.Common.ITEMIDLIST** apidl, [Optional] winmdroot.System.Com.IDataObject* pdtInner, global::System.Guid* riid, void** ppv)
#cfunc global SHCreateDataObject "SHCreateDataObject" var, int, var, var, var, var

; winmdroot.Foundation.HRESULT SHCreateDefaultContextMenu(winmdroot.UI.Shell.DEFCONTEXTMENU* pdcm, global::System.Guid* riid, void** ppv)
#cfunc global SHCreateDefaultContextMenu "SHCreateDefaultContextMenu" var, var, var

; winmdroot.Foundation.HRESULT SHCreateDefaultExtractIcon(global::System.Guid* riid, void** ppv)
#cfunc global SHCreateDefaultExtractIcon "SHCreateDefaultExtractIcon" var, var

; winmdroot.Foundation.HRESULT SHCreateDefaultPropertiesOp(winmdroot.UI.Shell.IShellItem* psi, winmdroot.UI.Shell.IFileOperation** ppFileOp)
#cfunc global SHCreateDefaultPropertiesOp "SHCreateDefaultPropertiesOp" var, var

; int SHCreateDirectory(winmdroot.Foundation.HWND hwnd, winmdroot.Foundation.PCWSTR pszPath)
#cfunc global SHCreateDirectory "SHCreateDirectory" intptr, wstr

; int SHCreateDirectoryExW(winmdroot.Foundation.HWND hwnd, winmdroot.Foundation.PCWSTR pszPath, [Optional] winmdroot.Security.SECURITY_ATTRIBUTES* psa)
#cfunc global SHCreateDirectoryExW "SHCreateDirectoryExW" intptr, wstr, var

; winmdroot.Foundation.HRESULT SHCreateFileExtractIconW(winmdroot.Foundation.PCWSTR pszFile, uint dwFileAttributes, global::System.Guid* riid, void** ppv)
#cfunc global SHCreateFileExtractIconW "SHCreateFileExtractIconW" wstr, int, var, var

; winmdroot.Foundation.HRESULT SHCreateItemFromIDList(winmdroot.UI.Shell.Common.ITEMIDLIST* pidl, global::System.Guid* riid, void** ppv)
#cfunc global SHCreateItemFromIDList "SHCreateItemFromIDList" var, var, var

; winmdroot.Foundation.HRESULT SHCreateItemFromParsingName(winmdroot.Foundation.PCWSTR pszPath, [Optional] winmdroot.System.Com.IBindCtx* pbc, global::System.Guid* riid, void** ppv)
#cfunc global SHCreateItemFromParsingName "SHCreateItemFromParsingName" wstr, var, var, var

; winmdroot.Foundation.HRESULT SHCreateItemFromRelativeName(winmdroot.UI.Shell.IShellItem* psiParent, winmdroot.Foundation.PCWSTR pszName, [Optional] winmdroot.System.Com.IBindCtx* pbc, global::System.Guid* riid, void** ppv)
#cfunc global SHCreateItemFromRelativeName "SHCreateItemFromRelativeName" var, wstr, var, var, var

; winmdroot.Foundation.HRESULT SHCreateItemInKnownFolder(global::System.Guid* kfid, uint dwKFFlags, winmdroot.Foundation.PCWSTR pszItem, global::System.Guid* riid, void** ppv)
#cfunc global SHCreateItemInKnownFolder "SHCreateItemInKnownFolder" var, int, wstr, var, var

; winmdroot.Foundation.HRESULT SHCreateItemWithParent([Optional] winmdroot.UI.Shell.Common.ITEMIDLIST* pidlParent, [Optional] winmdroot.UI.Shell.IShellFolder* psfParent, winmdroot.UI.Shell.Common.ITEMIDLIST* pidl, global::System.Guid* riid, void** ppvItem)
#cfunc global SHCreateItemWithParent "SHCreateItemWithParent" var, var, var, var, var

; winmdroot.UI.Shell.HPSXA SHCreatePropSheetExtArray(winmdroot.System.Registry.HKEY hKey, winmdroot.Foundation.PCWSTR pszSubKey, uint max_iface)
#cfunc global SHCreatePropSheetExtArray "SHCreatePropSheetExtArray" intptr, wstr, int

; winmdroot.Foundation.HRESULT SHCreateQueryCancelAutoPlayMoniker(winmdroot.System.Com.IMoniker** ppmoniker)
#cfunc global SHCreateQueryCancelAutoPlayMoniker "SHCreateQueryCancelAutoPlayMoniker" var

; winmdroot.Foundation.HRESULT SHCreateShellItem([Optional] winmdroot.UI.Shell.Common.ITEMIDLIST* pidlParent, [Optional] winmdroot.UI.Shell.IShellFolder* psfParent, winmdroot.UI.Shell.Common.ITEMIDLIST* pidl, winmdroot.UI.Shell.IShellItem** ppsi)
#cfunc global SHCreateShellItem "SHCreateShellItem" var, var, var, var

; winmdroot.Foundation.HRESULT SHCreateShellItemArray([Optional] winmdroot.UI.Shell.Common.ITEMIDLIST* pidlParent, [Optional] winmdroot.UI.Shell.IShellFolder* psf, uint cidl, [Optional] winmdroot.UI.Shell.Common.ITEMIDLIST** ppidl, winmdroot.UI.Shell.IShellItemArray** ppsiItemArray)
#cfunc global SHCreateShellItemArray "SHCreateShellItemArray" var, var, int, var, var

; winmdroot.Foundation.HRESULT SHCreateShellItemArrayFromDataObject(winmdroot.System.Com.IDataObject* pdo, global::System.Guid* riid, void** ppv)
#cfunc global SHCreateShellItemArrayFromDataObject "SHCreateShellItemArrayFromDataObject" var, var, var

; winmdroot.Foundation.HRESULT SHCreateShellItemArrayFromIDLists(uint cidl, winmdroot.UI.Shell.Common.ITEMIDLIST** rgpidl, winmdroot.UI.Shell.IShellItemArray** ppsiItemArray)
#cfunc global SHCreateShellItemArrayFromIDLists "SHCreateShellItemArrayFromIDLists" int, var, var

; winmdroot.Foundation.HRESULT SHCreateShellItemArrayFromShellItem(winmdroot.UI.Shell.IShellItem* psi, global::System.Guid* riid, void** ppv)
#cfunc global SHCreateShellItemArrayFromShellItem "SHCreateShellItemArrayFromShellItem" var, var, var

; winmdroot.Foundation.HRESULT SHCreateStdEnumFmtEtc(uint cfmt, winmdroot.System.Com.FORMATETC* afmt, winmdroot.System.Com.IEnumFORMATETC** ppenumFormatEtc)
#cfunc global SHCreateStdEnumFmtEtc "SHCreateStdEnumFmtEtc" int, var, var

; winmdroot.Foundation.HRESULT SHDefExtractIconW(winmdroot.Foundation.PCWSTR pszIconFile, int iIndex, uint uFlags, [Optional] winmdroot.UI.WindowsAndMessaging.HICON* phiconLarge, [Optional] winmdroot.UI.WindowsAndMessaging.HICON* phiconSmall, uint nIconSize)
#cfunc global SHDefExtractIconW "SHDefExtractIconW" wstr, int, int, intptr, intptr, int

; winmdroot.Foundation.HRESULT SHDoDragDrop(winmdroot.Foundation.HWND hwnd, winmdroot.System.Com.IDataObject* pdata, [Optional] winmdroot.System.Ole.IDropSource* pdsrc, winmdroot.System.Ole.DROPEFFECT dwEffect, winmdroot.System.Ole.DROPEFFECT* pdwEffect)
#cfunc global SHDoDragDrop "SHDoDragDrop" intptr, var, var, int, var

; winmdroot.Foundation.HRESULT SHEmptyRecycleBinW(winmdroot.Foundation.HWND hwnd, winmdroot.Foundation.PCWSTR pszRootPath, uint dwFlags)
#cfunc global SHEmptyRecycleBinW "SHEmptyRecycleBinW" intptr, wstr, int

; winmdroot.Foundation.HRESULT SHEnumerateUnreadMailAccountsW(winmdroot.System.Registry.HKEY hKeyUser, uint dwIndex, winmdroot.Foundation.PWSTR pszMailAddress, int cchMailAddress)
#cfunc global SHEnumerateUnreadMailAccountsW "SHEnumerateUnreadMailAccountsW" intptr, int, wstr, int

; winmdroot.Foundation.HRESULT SHEvaluateSystemCommandTemplate(winmdroot.Foundation.PCWSTR pszCmdTemplate, winmdroot.Foundation.PWSTR* ppszApplication, [Optional] winmdroot.Foundation.PWSTR* ppszCommandLine, [Optional] winmdroot.Foundation.PWSTR* ppszParameters)
#cfunc global SHEvaluateSystemCommandTemplate "SHEvaluateSystemCommandTemplate" wstr, var, var, var

; winmdroot.Foundation.BOOL SHFindFiles([Optional] winmdroot.UI.Shell.Common.ITEMIDLIST* pidlFolder, [Optional] winmdroot.UI.Shell.Common.ITEMIDLIST* pidlSaveFile)
#cfunc global SHFindFiles "SHFindFiles" var, var

; winmdroot.UI.Shell.IContextMenu* SHFind_InitMenuPopup(winmdroot.UI.WindowsAndMessaging.HMENU hmenu, winmdroot.Foundation.HWND hwndOwner, uint idCmdFirst, uint idCmdLast)
#cfunc global SHFind_InitMenuPopup "SHFind_InitMenuPopup" intptr, intptr, int, int

; void SHFlushSFCache()
#func global SHFlushSFCache "SHFlushSFCache"

; uint SHFormatDrive(winmdroot.Foundation.HWND hwnd, uint drive, winmdroot.UI.Shell.SHFMT_ID fmtID, uint options)
#cfunc global SHFormatDrive "SHFormatDrive" intptr, int, int, int

; void SHFree([Optional] void* pv)
#func global SHFree "SHFree" intptr

; void SHFreeNameMappings(winmdroot.Foundation.HANDLE hNameMappings)
#func global SHFreeNameMappings "SHFreeNameMappings" intptr

; winmdroot.Foundation.HRESULT SHGetAttributesFromDataObject([Optional] winmdroot.System.Com.IDataObject* pdo, uint dwAttributeMask, [Optional] uint* pdwAttributes, [Optional] uint* pcItems)
#cfunc global SHGetAttributesFromDataObject "SHGetAttributesFromDataObject" var, int, var, var

; winmdroot.Foundation.HRESULT SHGetDataFromIDListW(winmdroot.UI.Shell.IShellFolder* psf, winmdroot.UI.Shell.Common.ITEMIDLIST* pidl, winmdroot.UI.Shell.SHGDFIL_FORMAT nFormat, void* pv, int cb)
#cfunc global SHGetDataFromIDListW "SHGetDataFromIDListW" var, var, int, intptr, int

; winmdroot.Foundation.HRESULT SHGetDesktopFolder(winmdroot.UI.Shell.IShellFolder** ppshf)
#cfunc global SHGetDesktopFolder "SHGetDesktopFolder" var

; winmdroot.Foundation.BOOL SHGetDiskFreeSpaceExW(winmdroot.Foundation.PCWSTR pszDirectoryName, [Optional] ulong* pulFreeBytesAvailableToCaller, [Optional] ulong* pulTotalNumberOfBytes, [Optional] ulong* pulTotalNumberOfFreeBytes)
#cfunc global SHGetDiskFreeSpaceExW "SHGetDiskFreeSpaceExW" wstr, var, var, var

; winmdroot.Foundation.HRESULT SHGetDriveMedia(winmdroot.Foundation.PCWSTR pszDrive, uint* pdwMediaContent)
#cfunc global SHGetDriveMedia "SHGetDriveMedia" wstr, var

; winmdroot.Foundation.HRESULT SHGetFolderLocation(winmdroot.Foundation.HWND hwnd, int csidl, winmdroot.Foundation.HANDLE hToken, uint dwFlags, winmdroot.UI.Shell.Common.ITEMIDLIST** ppidl)
#cfunc global SHGetFolderLocation "SHGetFolderLocation" intptr, int, intptr, int, var

; winmdroot.Foundation.HRESULT SHGetFolderPathW(winmdroot.Foundation.HWND hwnd, int csidl, winmdroot.Foundation.HANDLE hToken, uint dwFlags, winmdroot.Foundation.PWSTR pszPath)
#cfunc global SHGetFolderPathW "SHGetFolderPathW" intptr, int, intptr, int, wstr

; winmdroot.Foundation.HRESULT SHGetFolderPathAndSubDirW(winmdroot.Foundation.HWND hwnd, int csidl, winmdroot.Foundation.HANDLE hToken, uint dwFlags, winmdroot.Foundation.PCWSTR pszSubDir, winmdroot.Foundation.PWSTR pszPath)
#cfunc global SHGetFolderPathAndSubDirW "SHGetFolderPathAndSubDirW" intptr, int, intptr, int, wstr, wstr

; winmdroot.Foundation.HRESULT SHGetIDListFromObject(winmdroot.System.Com.IUnknown* punk, winmdroot.UI.Shell.Common.ITEMIDLIST** ppidl)
#cfunc global SHGetIDListFromObject "SHGetIDListFromObject" var, var

; int SHGetIconOverlayIndexW(winmdroot.Foundation.PCWSTR pszIconPath, int iIconIndex)
#cfunc global SHGetIconOverlayIndexW "SHGetIconOverlayIndexW" wstr, int

; winmdroot.Foundation.HRESULT SHGetImageList(int iImageList, global::System.Guid* riid, void** ppvObj)
#cfunc global SHGetImageList "SHGetImageList" int, var, var

; winmdroot.Foundation.HRESULT SHGetInstanceExplorer(winmdroot.System.Com.IUnknown** ppunk)
#cfunc global SHGetInstanceExplorer "SHGetInstanceExplorer" var

; winmdroot.Foundation.HRESULT SHGetItemFromDataObject(winmdroot.System.Com.IDataObject* pdtobj, winmdroot.UI.Shell.DATAOBJ_GET_ITEM_FLAGS dwFlags, global::System.Guid* riid, void** ppv)
#cfunc global SHGetItemFromDataObject "SHGetItemFromDataObject" var, int, var, var

; winmdroot.Foundation.HRESULT SHGetItemFromObject(winmdroot.System.Com.IUnknown* punk, global::System.Guid* riid, void** ppv)
#cfunc global SHGetItemFromObject "SHGetItemFromObject" var, var, var

; winmdroot.Foundation.HRESULT SHGetKnownFolderIDList(global::System.Guid* rfid, uint dwFlags, winmdroot.Foundation.HANDLE hToken, winmdroot.UI.Shell.Common.ITEMIDLIST** ppidl)
#cfunc global SHGetKnownFolderIDList "SHGetKnownFolderIDList" var, int, intptr, var

; winmdroot.Foundation.HRESULT SHGetKnownFolderItem(global::System.Guid* rfid, winmdroot.UI.Shell.KNOWN_FOLDER_FLAG flags, winmdroot.Foundation.HANDLE hToken, global::System.Guid* riid, void** ppv)
#cfunc global SHGetKnownFolderItem "SHGetKnownFolderItem" var, int, intptr, var, var

; winmdroot.Foundation.HRESULT SHGetKnownFolderPath(global::System.Guid* rfid, uint dwFlags, winmdroot.Foundation.HANDLE hToken, winmdroot.Foundation.PWSTR* ppszPath)
#cfunc global SHGetKnownFolderPath "SHGetKnownFolderPath" var, int, intptr, var

; winmdroot.Foundation.HRESULT SHGetLocalizedName(winmdroot.Foundation.PCWSTR pszPath, winmdroot.Foundation.PWSTR pszResModule, uint cch, int* pidsRes)
#cfunc global SHGetLocalizedName "SHGetLocalizedName" wstr, wstr, int, var

; winmdroot.Foundation.HRESULT SHGetMalloc(winmdroot.System.Com.IMalloc** ppMalloc)
#cfunc global SHGetMalloc "SHGetMalloc" var

; winmdroot.Foundation.HRESULT SHGetNameFromIDList(winmdroot.UI.Shell.Common.ITEMIDLIST* pidl, winmdroot.UI.Shell.SIGDN sigdnName, winmdroot.Foundation.PWSTR* ppszName)
#cfunc global SHGetNameFromIDList "SHGetNameFromIDList" var, int, var

; winmdroot.Foundation.BOOL SHGetNewLinkInfoW(winmdroot.Foundation.PCWSTR pszLinkTo, winmdroot.Foundation.PCWSTR pszDir, winmdroot.Foundation.PWSTR pszName, winmdroot.Foundation.BOOL* pfMustCopy, uint uFlags)
#cfunc global SHGetNewLinkInfoW "SHGetNewLinkInfoW" wstr, wstr, wstr, var, int

; winmdroot.Foundation.BOOL SHGetPathFromIDListW(winmdroot.UI.Shell.Common.ITEMIDLIST* pidl, winmdroot.Foundation.PWSTR pszPath)
#cfunc global SHGetPathFromIDListW "SHGetPathFromIDListW" var, wstr

; winmdroot.Foundation.BOOL SHGetPathFromIDListEx(winmdroot.UI.Shell.Common.ITEMIDLIST* pidl, winmdroot.Foundation.PWSTR pszPath, uint cchPath, winmdroot.UI.Shell.GPFIDL_FLAGS uOpts)
#cfunc global SHGetPathFromIDListEx "SHGetPathFromIDListEx" var, wstr, int, int

; winmdroot.Foundation.HRESULT SHGetPropertyStoreForWindow(winmdroot.Foundation.HWND hwnd, global::System.Guid* riid, void** ppv)
#cfunc global SHGetPropertyStoreForWindow "SHGetPropertyStoreForWindow" intptr, var, var

; winmdroot.Foundation.HRESULT SHGetPropertyStoreFromIDList(winmdroot.UI.Shell.Common.ITEMIDLIST* pidl, winmdroot.UI.Shell.PropertiesSystem.GETPROPERTYSTOREFLAGS flags, global::System.Guid* riid, void** ppv)
#cfunc global SHGetPropertyStoreFromIDList "SHGetPropertyStoreFromIDList" var, int, var, var

; winmdroot.Foundation.HRESULT SHGetPropertyStoreFromParsingName(winmdroot.Foundation.PCWSTR pszPath, [Optional] winmdroot.System.Com.IBindCtx* pbc, winmdroot.UI.Shell.PropertiesSystem.GETPROPERTYSTOREFLAGS flags, global::System.Guid* riid, void** ppv)
#cfunc global SHGetPropertyStoreFromParsingName "SHGetPropertyStoreFromParsingName" wstr, var, int, var, var

; winmdroot.Foundation.HRESULT SHGetRealIDL(winmdroot.UI.Shell.IShellFolder* psf, winmdroot.UI.Shell.Common.ITEMIDLIST* pidlSimple, winmdroot.UI.Shell.Common.ITEMIDLIST** ppidlReal)
#cfunc global SHGetRealIDL "SHGetRealIDL" var, var, var

; winmdroot.Foundation.HRESULT SHGetSetFolderCustomSettings(winmdroot.UI.Shell.SHFOLDERCUSTOMSETTINGS* pfcs, winmdroot.Foundation.PCWSTR pszPath, uint dwReadWrite)
#cfunc global SHGetSetFolderCustomSettings "SHGetSetFolderCustomSettings" var, wstr, int

; void SHGetSetSettings([Optional] winmdroot.UI.Shell.SHELLSTATEA* lpss, winmdroot.UI.Shell.SSF_MASK dwMask, winmdroot.Foundation.BOOL bSet)
#func global SHGetSetSettings "SHGetSetSettings" var, int, int

; void SHGetSettings(winmdroot.UI.Shell.SHELLFLAGSTATE* psfs, uint dwMask)
#func global SHGetSettings "SHGetSettings" var, int

; winmdroot.Foundation.HRESULT SHGetSpecialFolderLocation(winmdroot.Foundation.HWND hwnd, int csidl, winmdroot.UI.Shell.Common.ITEMIDLIST** ppidl)
#cfunc global SHGetSpecialFolderLocation "SHGetSpecialFolderLocation" intptr, int, var

; winmdroot.Foundation.BOOL SHGetSpecialFolderPathW(winmdroot.Foundation.HWND hwnd, winmdroot.Foundation.PWSTR pszPath, int csidl, winmdroot.Foundation.BOOL fCreate)
#cfunc global SHGetSpecialFolderPathW "SHGetSpecialFolderPathW" intptr, wstr, int, int

; winmdroot.Foundation.HRESULT SHGetTemporaryPropertyForItem(winmdroot.UI.Shell.IShellItem* psi, winmdroot.UI.Shell.PropertiesSystem.PROPERTYKEY* propkey, winmdroot.System.Com.StructuredStorage.PROPVARIANT* ppropvar)
#cfunc global SHGetTemporaryPropertyForItem "SHGetTemporaryPropertyForItem" var, var, var

; winmdroot.Foundation.HRESULT SHGetUnreadMailCountW(winmdroot.System.Registry.HKEY hKeyUser, winmdroot.Foundation.PCWSTR pszMailAddress, [Optional] uint* pdwCount, [Optional] global::System.Runtime.InteropServices.ComTypes.FILETIME* pFileTime, winmdroot.Foundation.PWSTR pszShellExecuteCommand, int cchShellExecuteCommand)
#cfunc global SHGetUnreadMailCountW "SHGetUnreadMailCountW" intptr, wstr, var, var, wstr, int

; int SHHandleUpdateImage(winmdroot.UI.Shell.Common.ITEMIDLIST* pidlExtra)
#cfunc global SHHandleUpdateImage "SHHandleUpdateImage" var

; winmdroot.Foundation.HRESULT SHILCreateFromPath(winmdroot.Foundation.PCWSTR pszPath, winmdroot.UI.Shell.Common.ITEMIDLIST** ppidl, [Optional] uint* rgfInOut)
#cfunc global SHILCreateFromPath "SHILCreateFromPath" wstr, var, var

; winmdroot.Foundation.BOOL SHInvokePrinterCommandW(winmdroot.Foundation.HWND hwnd, uint uAction, winmdroot.Foundation.PCWSTR lpBuf1, winmdroot.Foundation.PCWSTR lpBuf2, winmdroot.Foundation.BOOL fModal)
#cfunc global SHInvokePrinterCommandW "SHInvokePrinterCommandW" intptr, int, wstr, wstr, int

; winmdroot.Foundation.HRESULT SHIsFileAvailableOffline(winmdroot.Foundation.PCWSTR pwszPath, [Optional] uint* pdwStatus)
#cfunc global SHIsFileAvailableOffline "SHIsFileAvailableOffline" wstr, var

; winmdroot.Foundation.HRESULT SHLimitInputEdit(winmdroot.Foundation.HWND hwndEdit, winmdroot.UI.Shell.IShellFolder* psf)
#cfunc global SHLimitInputEdit "SHLimitInputEdit" intptr, var

; winmdroot.Foundation.HRESULT SHLoadInProc(global::System.Guid* rclsid)
#cfunc global SHLoadInProc "SHLoadInProc" var

; winmdroot.Foundation.HRESULT SHLoadNonloadedIconOverlayIdentifiers()
#cfunc global SHLoadNonloadedIconOverlayIdentifiers "SHLoadNonloadedIconOverlayIdentifiers"

; int SHMapPIDLToSystemImageListIndex(winmdroot.UI.Shell.IShellFolder* pshf, winmdroot.UI.Shell.Common.ITEMIDLIST* pidl, [Optional] int* piIndexSel)
#cfunc global SHMapPIDLToSystemImageListIndex "SHMapPIDLToSystemImageListIndex" var, var, var

; winmdroot.Foundation.HRESULT SHMultiFileProperties(winmdroot.System.Com.IDataObject* pdtobj, uint dwFlags)
#cfunc global SHMultiFileProperties "SHMultiFileProperties" var, int

; winmdroot.Foundation.BOOL SHObjectProperties(winmdroot.Foundation.HWND hwnd, uint shopObjectType, winmdroot.Foundation.PCWSTR pszObjectName, winmdroot.Foundation.PCWSTR pszPropertyPage)
#cfunc global SHObjectProperties "SHObjectProperties" intptr, int, wstr, wstr

; winmdroot.Foundation.HRESULT SHOpenFolderAndSelectItems(winmdroot.UI.Shell.Common.ITEMIDLIST* pidlFolder, uint cidl, [Optional] winmdroot.UI.Shell.Common.ITEMIDLIST** apidl, uint dwFlags)
#cfunc global SHOpenFolderAndSelectItems "SHOpenFolderAndSelectItems" var, int, var, int

; winmdroot.Foundation.HRESULT SHOpenWithDialog(winmdroot.Foundation.HWND hwndParent, winmdroot.UI.Shell.OPENASINFO* poainfo)
#cfunc global SHOpenWithDialog "SHOpenWithDialog" intptr, var

; winmdroot.Foundation.HRESULT SHParseDisplayName(winmdroot.Foundation.PCWSTR pszName, [Optional] winmdroot.System.Com.IBindCtx* pbc, winmdroot.UI.Shell.Common.ITEMIDLIST** ppidl, uint sfgaoIn, [Optional] uint* psfgaoOut)
#cfunc global SHParseDisplayName "SHParseDisplayName" wstr, var, var, int, var

; winmdroot.Foundation.HRESULT SHPathPrepareForWriteW(winmdroot.Foundation.HWND hwnd, [Optional] winmdroot.System.Com.IUnknown* punkEnableModless, winmdroot.Foundation.PCWSTR pszPath, uint dwFlags)
#cfunc global SHPathPrepareForWriteW "SHPathPrepareForWriteW" intptr, var, wstr, int

; winmdroot.Foundation.HRESULT SHPropStgCreate(winmdroot.System.Com.StructuredStorage.IPropertySetStorage* psstg, global::System.Guid* fmtid, [Optional] global::System.Guid* pclsid, uint grfFlags, uint grfMode, uint dwDisposition, winmdroot.System.Com.StructuredStorage.IPropertyStorage** ppstg, [Optional] uint* puCodePage)
#cfunc global SHPropStgCreate "SHPropStgCreate" var, var, var, int, int, int, var, var

; winmdroot.Foundation.HRESULT SHPropStgReadMultiple(winmdroot.System.Com.StructuredStorage.IPropertyStorage* pps, uint uCodePage, uint cpspec, winmdroot.System.Com.StructuredStorage.PROPSPEC* rgpspec, winmdroot.System.Com.StructuredStorage.PROPVARIANT* rgvar)
#cfunc global SHPropStgReadMultiple "SHPropStgReadMultiple" var, int, int, var, var

; winmdroot.Foundation.HRESULT SHPropStgWriteMultiple(winmdroot.System.Com.StructuredStorage.IPropertyStorage* pps, [Optional] uint* puCodePage, uint cpspec, winmdroot.System.Com.StructuredStorage.PROPSPEC* rgpspec, winmdroot.System.Com.StructuredStorage.PROPVARIANT* rgvar, uint propidNameFirst)
#cfunc global SHPropStgWriteMultiple "SHPropStgWriteMultiple" var, var, int, var, var, int

; winmdroot.Foundation.HRESULT SHQueryUserNotificationState(winmdroot.UI.Shell.QUERY_USER_NOTIFICATION_STATE* pquns)
#cfunc global SHQueryUserNotificationState "SHQueryUserNotificationState" var

; winmdroot.Foundation.HRESULT SHRemoveLocalizedName(winmdroot.Foundation.PCWSTR pszPath)
#cfunc global SHRemoveLocalizedName "SHRemoveLocalizedName" wstr

; uint SHReplaceFromPropSheetExtArray(winmdroot.UI.Shell.HPSXA hpsxa, uint uPageID, delegate *unmanaged[Stdcall]<global::Windows.Win32.UI.Controls.HPROPSHEETPAGE,global::Windows.Win32.Foundation.LPARAM,global::Windows.Win32.Foundation.BOOL> lpfnReplaceWith, winmdroot.Foundation.LPARAM lParam)
#cfunc global SHReplaceFromPropSheetExtArray "SHReplaceFromPropSheetExtArray" intptr, int, int, intptr

; winmdroot.Foundation.HRESULT SHResolveLibrary(winmdroot.UI.Shell.IShellItem* psiLibrary)
#cfunc global SHResolveLibrary "SHResolveLibrary" var

; uint SHRestricted(winmdroot.UI.Shell.RESTRICTIONS rest)
#cfunc global SHRestricted "SHRestricted" int

; winmdroot.Foundation.HRESULT SHSetDefaultProperties(winmdroot.Foundation.HWND hwnd, winmdroot.UI.Shell.IShellItem* psi, uint dwFileOpFlags, [Optional] winmdroot.UI.Shell.IFileOperationProgressSink* pfops)
#cfunc global SHSetDefaultProperties "SHSetDefaultProperties" intptr, var, int, var

; winmdroot.Foundation.HRESULT SHSetFolderPathW(int csidl, winmdroot.Foundation.HANDLE hToken, uint dwFlags, winmdroot.Foundation.PCWSTR pszPath)
#cfunc global SHSetFolderPathW "SHSetFolderPathW" int, intptr, int, wstr

; void SHSetInstanceExplorer([Optional] winmdroot.System.Com.IUnknown* punk)
#func global SHSetInstanceExplorer "SHSetInstanceExplorer" var

; winmdroot.Foundation.HRESULT SHSetKnownFolderPath(global::System.Guid* rfid, uint dwFlags, winmdroot.Foundation.HANDLE hToken, winmdroot.Foundation.PCWSTR pszPath)
#cfunc global SHSetKnownFolderPath "SHSetKnownFolderPath" var, int, intptr, wstr

; winmdroot.Foundation.HRESULT SHSetLocalizedName(winmdroot.Foundation.PCWSTR pszPath, winmdroot.Foundation.PCWSTR pszResModule, int idsRes)
#cfunc global SHSetLocalizedName "SHSetLocalizedName" wstr, wstr, int

; winmdroot.Foundation.HRESULT SHSetTemporaryPropertyForItem(winmdroot.UI.Shell.IShellItem* psi, winmdroot.UI.Shell.PropertiesSystem.PROPERTYKEY* propkey, winmdroot.System.Com.StructuredStorage.PROPVARIANT* propvar)
#cfunc global SHSetTemporaryPropertyForItem "SHSetTemporaryPropertyForItem" var, var, var

; winmdroot.Foundation.HRESULT SHSetUnreadMailCountW(winmdroot.Foundation.PCWSTR pszMailAddress, uint dwCount, winmdroot.Foundation.PCWSTR pszShellExecuteCommand)
#cfunc global SHSetUnreadMailCountW "SHSetUnreadMailCountW" wstr, int, wstr

; winmdroot.Foundation.LRESULT SHShellFolderView_Message(winmdroot.Foundation.HWND hwndMain, uint uMsg, winmdroot.Foundation.LPARAM lParam)
#cfunc global SHShellFolderView_Message "SHShellFolderView_Message" intptr, int, intptr

; winmdroot.Foundation.HRESULT SHShowManageLibraryUI(winmdroot.UI.Shell.IShellItem* psiLibrary, winmdroot.Foundation.HWND hwndOwner, winmdroot.Foundation.PCWSTR pszTitle, winmdroot.Foundation.PCWSTR pszInstruction, winmdroot.UI.Shell.LIBRARYMANAGEDIALOGOPTIONS lmdOptions)
#cfunc global SHShowManageLibraryUI "SHShowManageLibraryUI" var, intptr, wstr, wstr, int

; winmdroot.UI.Shell.Common.ITEMIDLIST* SHSimpleIDListFromPath(winmdroot.Foundation.PCWSTR pszPath)
#cfunc global SHSimpleIDListFromPath "SHSimpleIDListFromPath" wstr

; winmdroot.Foundation.HRESULT SHStartNetConnectionDialogW(winmdroot.Foundation.HWND hwnd, winmdroot.Foundation.PCWSTR pszRemoteName, uint dwType)
#cfunc global SHStartNetConnectionDialogW "SHStartNetConnectionDialogW" intptr, wstr, int

; winmdroot.Foundation.BOOL SHTestTokenMembership(winmdroot.Foundation.HANDLE hToken, uint ulRID)
#cfunc global SHTestTokenMembership "SHTestTokenMembership" intptr, int

; void SHUpdateImageW(winmdroot.Foundation.PCWSTR pszHashItem, int iIndex, uint uFlags, int iImageIndex)
#func global SHUpdateImageW "SHUpdateImageW" wstr, int, int, int

; winmdroot.Foundation.BOOL SHValidateUNC(winmdroot.Foundation.HWND hwndOwner, winmdroot.Foundation.PWSTR pszFile, uint fConnect)
#cfunc global SHValidateUNC "SHValidateUNC" intptr, wstr, int

; winmdroot.Foundation.HRESULT SetCurrentProcessExplicitAppUserModelID(winmdroot.Foundation.PCWSTR AppID)
#cfunc global SetCurrentProcessExplicitAppUserModelID "SetCurrentProcessExplicitAppUserModelID" wstr

; int ShellAboutW(winmdroot.Foundation.HWND hWnd, winmdroot.Foundation.PCWSTR szApp, winmdroot.Foundation.PCWSTR szOtherStuff, winmdroot.UI.WindowsAndMessaging.HICON hIcon)
#cfunc global ShellAboutW "ShellAboutW" intptr, wstr, wstr, intptr

; winmdroot.Foundation.HINSTANCE ShellExecuteW(winmdroot.Foundation.HWND hwnd, winmdroot.Foundation.PCWSTR lpOperation, winmdroot.Foundation.PCWSTR lpFile, winmdroot.Foundation.PCWSTR lpParameters, winmdroot.Foundation.PCWSTR lpDirectory, winmdroot.UI.WindowsAndMessaging.SHOW_WINDOW_CMD nShowCmd)
#cfunc global ShellExecuteW "ShellExecuteW" intptr, wstr, wstr, wstr, wstr, int

; int Shell_GetCachedImageIndex(winmdroot.Foundation.PCWSTR pwszIconPath, int iIconIndex, uint uIconFlags)
#cfunc global Shell_GetCachedImageIndex "Shell_GetCachedImageIndex" wstr, int, int

; winmdroot.Foundation.BOOL Shell_GetImageLists([Optional] winmdroot.UI.Controls.HIMAGELIST* phiml, [Optional] winmdroot.UI.Controls.HIMAGELIST* phimlSmall)
#cfunc global Shell_GetImageLists "Shell_GetImageLists" intptr, intptr

; uint Shell_MergeMenus(winmdroot.UI.WindowsAndMessaging.HMENU hmDst, winmdroot.UI.WindowsAndMessaging.HMENU hmSrc, uint uInsert, uint uIDAdjust, uint uIDAdjustMax, winmdroot.UI.Shell.MM_FLAGS uFlags)
#cfunc global Shell_MergeMenus "Shell_MergeMenus" intptr, intptr, int, int, int, int

; winmdroot.Foundation.BOOL SignalFileOpen(winmdroot.UI.Shell.Common.ITEMIDLIST* pidl)
#cfunc global SignalFileOpen "SignalFileOpen" var

; winmdroot.Foundation.HRESULT StgMakeUniqueName(winmdroot.System.Com.StructuredStorage.IStorage* pstgParent, winmdroot.Foundation.PCWSTR pszFileSpec, uint grfMode, global::System.Guid* riid, void** ppv)
#cfunc global StgMakeUniqueName "StgMakeUniqueName" var, wstr, int, var, var

; winmdroot.Foundation.BOOL Win32DeleteFile(winmdroot.Foundation.PCWSTR pszPath)
#cfunc global Win32DeleteFile "Win32DeleteFile" wstr

; winmdroot.Foundation.BOOL WriteCabinetState(winmdroot.UI.Shell.CABINETSTATE* pcs)
#cfunc global WriteCabinetState "WriteCabinetState" var

#endif
