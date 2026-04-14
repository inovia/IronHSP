; ============================================================
;   Auto-generated from CsWin32 / win32metadata
;   dll:    ole32.dll
;   tool:   tools/cswin32_bridge/gen_from_cswin32.py
;   Do not edit by hand ? regenerate via the python script.
;   Needs hsp3net (intptr / NSTRUCT / wstr).
; ============================================================

#ifndef __ole32_gen2_as__
#define global __ole32_gen2_as__

; Shared NSTRUCT + #define constants for all win32 *_gen2.as
#include "win32_types_gen2.as"

;--- functions ---
#uselib "ole32.dll"
; winmdroot.Foundation.HRESULT BindMoniker(winmdroot.System.Com.IMoniker* pmk, uint grfOpt, global::System.Guid* iidResult, void** ppvResult)
#cfunc global BindMoniker "BindMoniker" var, int, var, var

; winmdroot.Foundation.HRESULT CoAllowSetForegroundWindow(winmdroot.System.Com.IUnknown* pUnk, [Optional] void* lpvReserved)
#cfunc global CoAllowSetForegroundWindow "CoAllowSetForegroundWindow" var, intptr

; uint CoBuildVersion()
#cfunc global CoBuildVersion "CoBuildVersion"

; winmdroot.Foundation.BOOL CoDosDateTimeToFileTime(ushort nDosDate, ushort nDosTime, global::System.Runtime.InteropServices.ComTypes.FILETIME* lpFileTime)
#cfunc global CoDosDateTimeToFileTime "CoDosDateTimeToFileTime" int, int, var

; winmdroot.Foundation.BOOL CoFileTimeToDosDateTime(global::System.Runtime.InteropServices.ComTypes.FILETIME* lpFileTime, ushort* lpDosDate, ushort* lpDosTime)
#cfunc global CoFileTimeToDosDateTime "CoFileTimeToDosDateTime" var, var, var

; void CoFreeAllLibraries()
#func global CoFreeAllLibraries "CoFreeAllLibraries"

; void CoFreeLibrary(winmdroot.Foundation.HINSTANCE hInst)
#func global CoFreeLibrary "CoFreeLibrary" intptr

; winmdroot.Foundation.HRESULT CoGetInterceptor(global::System.Guid* iidIntercepted, winmdroot.System.Com.IUnknown* punkOuter, global::System.Guid* iid, void** ppv)
#cfunc global CoGetInterceptor "CoGetInterceptor" var, var, var, var

; winmdroot.Foundation.HRESULT CoGetInterceptorFromTypeInfo(global::System.Guid* iidIntercepted, winmdroot.System.Com.IUnknown* punkOuter, winmdroot.System.Com.ITypeInfo* typeInfo, global::System.Guid* iid, void** ppv)
#cfunc global CoGetInterceptorFromTypeInfo "CoGetInterceptorFromTypeInfo" var, var, var, var, var

; winmdroot.Foundation.HRESULT CoGetObject(winmdroot.Foundation.PCWSTR pszName, [Optional] winmdroot.System.Com.BIND_OPTS* pBindOptions, global::System.Guid* riid, void** ppv)
#cfunc global CoGetObject "CoGetObject" wstr, var, var, var

; winmdroot.Foundation.HRESULT CoInitialize([Optional] void* pvReserved)
#cfunc global CoInitialize "CoInitialize" intptr

; winmdroot.Foundation.HRESULT CoInstall(winmdroot.System.Com.IBindCtx* pbc, uint dwFlags, winmdroot.System.Com.uCLSSPEC* pClassSpec, winmdroot.System.Com.QUERYCONTEXT* pQuery, winmdroot.Foundation.PWSTR pszCodeBase)
#cfunc global CoInstall "CoInstall" var, int, var, var, wstr

; winmdroot.Foundation.BOOL CoIsOle1Class(global::System.Guid* rclsid)
#cfunc global CoIsOle1Class "CoIsOle1Class" var

; winmdroot.Foundation.HINSTANCE CoLoadLibrary(winmdroot.Foundation.PWSTR lpszLibName, winmdroot.Foundation.BOOL bAutoFree)
#cfunc global CoLoadLibrary "CoLoadLibrary" wstr, int

; winmdroot.Foundation.HRESULT CoRegisterMessageFilter([Optional] winmdroot.Media.Audio.IMessageFilter* lpMessageFilter, [Optional] winmdroot.Media.Audio.IMessageFilter** lplpMessageFilter)
#cfunc global CoRegisterMessageFilter "CoRegisterMessageFilter" var, var

; winmdroot.Foundation.HRESULT CoTreatAsClass(global::System.Guid* clsidOld, global::System.Guid* clsidNew)
#cfunc global CoTreatAsClass "CoTreatAsClass" var, var

; winmdroot.Foundation.HRESULT CreateAntiMoniker(winmdroot.System.Com.IMoniker** ppmk)
#cfunc global CreateAntiMoniker "CreateAntiMoniker" var

; winmdroot.Foundation.HRESULT CreateBindCtx(uint reserved, winmdroot.System.Com.IBindCtx** ppbc)
#cfunc global CreateBindCtx "CreateBindCtx" int, var

; winmdroot.Foundation.HRESULT CreateClassMoniker(global::System.Guid* rclsid, winmdroot.System.Com.IMoniker** ppmk)
#cfunc global CreateClassMoniker "CreateClassMoniker" var, var

; winmdroot.Foundation.HRESULT CreateDataAdviseHolder(winmdroot.System.Com.IDataAdviseHolder** ppDAHolder)
#cfunc global CreateDataAdviseHolder "CreateDataAdviseHolder" var

; winmdroot.Foundation.HRESULT CreateDataCache([Optional] winmdroot.System.Com.IUnknown* pUnkOuter, global::System.Guid* rclsid, global::System.Guid* iid, void** ppv)
#cfunc global CreateDataCache "CreateDataCache" var, var, var, var

; winmdroot.Foundation.HRESULT CreateFileMoniker(winmdroot.Foundation.PCWSTR lpszPathName, winmdroot.System.Com.IMoniker** ppmk)
#cfunc global CreateFileMoniker "CreateFileMoniker" wstr, var

; winmdroot.Foundation.HRESULT CreateGenericComposite([Optional] winmdroot.System.Com.IMoniker* pmkFirst, [Optional] winmdroot.System.Com.IMoniker* pmkRest, winmdroot.System.Com.IMoniker** ppmkComposite)
#cfunc global CreateGenericComposite "CreateGenericComposite" var, var, var

; winmdroot.Foundation.HRESULT CreateILockBytesOnHGlobal(winmdroot.Foundation.HGLOBAL hGlobal, winmdroot.Foundation.BOOL fDeleteOnRelease, winmdroot.System.Com.StructuredStorage.ILockBytes** pplkbyt)
#cfunc global CreateILockBytesOnHGlobal "CreateILockBytesOnHGlobal" int, int, var

; winmdroot.Foundation.HRESULT CreateItemMoniker(winmdroot.Foundation.PCWSTR lpszDelim, winmdroot.Foundation.PCWSTR lpszItem, winmdroot.System.Com.IMoniker** ppmk)
#cfunc global CreateItemMoniker "CreateItemMoniker" wstr, wstr, var

; winmdroot.Foundation.HRESULT CreateObjrefMoniker([Optional] winmdroot.System.Com.IUnknown* punk, winmdroot.System.Com.IMoniker** ppmk)
#cfunc global CreateObjrefMoniker "CreateObjrefMoniker" var, var

; winmdroot.Foundation.HRESULT CreateOleAdviseHolder(winmdroot.System.Ole.IOleAdviseHolder** ppOAHolder)
#cfunc global CreateOleAdviseHolder "CreateOleAdviseHolder" var

; winmdroot.Foundation.HRESULT CreatePointerMoniker([Optional] winmdroot.System.Com.IUnknown* punk, winmdroot.System.Com.IMoniker** ppmk)
#cfunc global CreatePointerMoniker "CreatePointerMoniker" var, var

; winmdroot.Foundation.HRESULT CreateStdProgressIndicator(winmdroot.Foundation.HWND hwndParent, winmdroot.Foundation.PCWSTR pszTitle, winmdroot.System.Com.IBindStatusCallback* pIbscCaller, winmdroot.System.Com.IBindStatusCallback** ppIbsc)
#cfunc global CreateStdProgressIndicator "CreateStdProgressIndicator" intptr, wstr, var, var

; winmdroot.Foundation.HRESULT DoDragDrop(winmdroot.System.Com.IDataObject* pDataObj, winmdroot.System.Ole.IDropSource* pDropSource, winmdroot.System.Ole.DROPEFFECT dwOKEffects, winmdroot.System.Ole.DROPEFFECT* pdwEffect)
#cfunc global DoDragDrop "DoDragDrop" var, var, int, var

; winmdroot.Foundation.HRESULT FmtIdToPropStgName(global::System.Guid* pfmtid, winmdroot.Foundation.PWSTR oszName)
#cfunc global FmtIdToPropStgName "FmtIdToPropStgName" var, wstr

; winmdroot.Foundation.HRESULT FreePropVariantArray(uint cVariants, winmdroot.System.Com.StructuredStorage.PROPVARIANT* rgvars)
#cfunc global FreePropVariantArray "FreePropVariantArray" int, var

; winmdroot.Foundation.HRESULT GetClassFile(winmdroot.Foundation.PCWSTR szFilename, global::System.Guid* pclsid)
#cfunc global GetClassFile "GetClassFile" wstr, var

; winmdroot.Foundation.HRESULT GetConvertStg(winmdroot.System.Com.StructuredStorage.IStorage* pStg)
#cfunc global GetConvertStg "GetConvertStg" var

; winmdroot.Foundation.HRESULT GetHGlobalFromILockBytes(winmdroot.System.Com.StructuredStorage.ILockBytes* plkbyt, winmdroot.Foundation.HGLOBAL* phglobal)
#cfunc global GetHGlobalFromILockBytes "GetHGlobalFromILockBytes" var, var

; winmdroot.Foundation.HRESULT GetRunningObjectTable(uint reserved, winmdroot.System.Com.IRunningObjectTable** pprot)
#cfunc global GetRunningObjectTable "GetRunningObjectTable" int, var

; winmdroot.Foundation.BOOL IsAccelerator(winmdroot.UI.WindowsAndMessaging.HACCEL hAccel, int cAccelEntries, winmdroot.UI.WindowsAndMessaging.MSG* lpMsg, ushort* lpwCmd)
#cfunc global IsAccelerator "IsAccelerator" intptr, int, var, var

; winmdroot.Foundation.HRESULT MkParseDisplayName(winmdroot.System.Com.IBindCtx* pbc, winmdroot.Foundation.PCWSTR szUserName, uint* pchEaten, winmdroot.System.Com.IMoniker** ppmk)
#cfunc global MkParseDisplayName "MkParseDisplayName" var, wstr, var, var

; winmdroot.Foundation.HRESULT MonikerCommonPrefixWith(winmdroot.System.Com.IMoniker* pmkThis, winmdroot.System.Com.IMoniker* pmkOther, winmdroot.System.Com.IMoniker** ppmkCommon)
#cfunc global MonikerCommonPrefixWith "MonikerCommonPrefixWith" var, var, var

; winmdroot.Foundation.HRESULT MonikerRelativePathTo(winmdroot.System.Com.IMoniker* pmkSrc, winmdroot.System.Com.IMoniker* pmkDest, winmdroot.System.Com.IMoniker** ppmkRelPath, winmdroot.Foundation.BOOL dwReserved)
#cfunc global MonikerRelativePathTo "MonikerRelativePathTo" var, var, var, int

; uint OleBuildVersion()
#cfunc global OleBuildVersion "OleBuildVersion"

; winmdroot.Foundation.HRESULT OleConvertIStorageToOLESTREAM(winmdroot.System.Com.StructuredStorage.IStorage* pstg, winmdroot.System.Com.StructuredStorage.OLESTREAM* lpolestream)
#cfunc global OleConvertIStorageToOLESTREAM "OleConvertIStorageToOLESTREAM" var, var

; winmdroot.Foundation.HRESULT OleConvertIStorageToOLESTREAMEx(winmdroot.System.Com.StructuredStorage.IStorage* pstg, ushort cfFormat, int lWidth, int lHeight, uint dwSize, winmdroot.System.Com.STGMEDIUM* pmedium, winmdroot.System.Com.StructuredStorage.OLESTREAM* polestm)
#cfunc global OleConvertIStorageToOLESTREAMEx "OleConvertIStorageToOLESTREAMEx" var, int, int, int, int, var, var

; winmdroot.Foundation.HRESULT OleConvertOLESTREAMToIStorage(winmdroot.System.Com.StructuredStorage.OLESTREAM* lpolestream, winmdroot.System.Com.StructuredStorage.IStorage* pstg, winmdroot.System.Com.DVTARGETDEVICE* ptd)
#cfunc global OleConvertOLESTREAMToIStorage "OleConvertOLESTREAMToIStorage" var, var, var

; winmdroot.Foundation.HRESULT OleConvertOLESTREAMToIStorage2(winmdroot.System.Com.StructuredStorage.OLESTREAM* lpolestream, winmdroot.System.Com.StructuredStorage.IStorage* pstg, [Optional] winmdroot.System.Com.DVTARGETDEVICE* ptd, uint opt, [Optional] void* pvCallbackContext, delegate *unmanaged[Stdcall]<global::System.Guid*,global::Windows.Win32.Foundation.PWSTR,global::Windows.Win32.Foundation.PWSTR,global::Windows.Win32.Foundation.PWSTR,global::Windows.Win32.Foundation.PWSTR,uint,void*,global::Windows.Win32.Foundation.HRESULT> pQueryConvertOLELinkCallback)
#cfunc global OleConvertOLESTREAMToIStorage2 "OleConvertOLESTREAMToIStorage2" var, var, var, int, intptr, int

; winmdroot.Foundation.HRESULT OleConvertOLESTREAMToIStorageEx(winmdroot.System.Com.StructuredStorage.OLESTREAM* polestm, winmdroot.System.Com.StructuredStorage.IStorage* pstg, ushort* pcfFormat, int* plwWidth, int* plHeight, uint* pdwSize, winmdroot.System.Com.STGMEDIUM* pmedium)
#cfunc global OleConvertOLESTREAMToIStorageEx "OleConvertOLESTREAMToIStorageEx" var, var, var, var, var, var, var

; winmdroot.Foundation.HRESULT OleConvertOLESTREAMToIStorageEx2(winmdroot.System.Com.StructuredStorage.OLESTREAM* polestm, winmdroot.System.Com.StructuredStorage.IStorage* pstg, ushort* pcfFormat, int* plwWidth, int* plHeight, uint* pdwSize, winmdroot.System.Com.STGMEDIUM* pmedium, uint opt, [Optional] void* pvCallbackContext, delegate *unmanaged[Stdcall]<global::System.Guid*,global::Windows.Win32.Foundation.PWSTR,global::Windows.Win32.Foundation.PWSTR,global::Windows.Win32.Foundation.PWSTR,global::Windows.Win32.Foundation.PWSTR,uint,void*,global::Windows.Win32.Foundation.HRESULT> pQueryConvertOLELinkCallback)
#cfunc global OleConvertOLESTREAMToIStorageEx2 "OleConvertOLESTREAMToIStorageEx2" var, var, var, var, var, var, var, int, intptr, int

; winmdroot.Foundation.HRESULT OleCreate(global::System.Guid* rclsid, global::System.Guid* riid, uint renderopt, winmdroot.System.Com.FORMATETC* pFormatEtc, winmdroot.System.Ole.IOleClientSite* pClientSite, winmdroot.System.Com.StructuredStorage.IStorage* pStg, void** ppvObj)
#cfunc global OleCreate "OleCreate" var, var, int, var, var, var, var

; winmdroot.Foundation.HRESULT OleCreateDefaultHandler(global::System.Guid* clsid, winmdroot.System.Com.IUnknown* pUnkOuter, global::System.Guid* riid, void** lplpObj)
#cfunc global OleCreateDefaultHandler "OleCreateDefaultHandler" var, var, var, var

; winmdroot.Foundation.HRESULT OleCreateEmbeddingHelper(global::System.Guid* clsid, winmdroot.System.Com.IUnknown* pUnkOuter, winmdroot.System.Ole.EMBDHLP_FLAGS flags, winmdroot.System.Com.IClassFactory* pCF, global::System.Guid* riid, void** lplpObj)
#cfunc global OleCreateEmbeddingHelper "OleCreateEmbeddingHelper" var, var, int, var, var, var

; winmdroot.Foundation.HRESULT OleCreateEx(global::System.Guid* rclsid, global::System.Guid* riid, winmdroot.System.Ole.OLECREATE dwFlags, uint renderopt, uint cFormats, uint* rgAdvf, winmdroot.System.Com.FORMATETC* rgFormatEtc, winmdroot.System.Com.IAdviseSink* lpAdviseSink, uint* rgdwConnection, winmdroot.System.Ole.IOleClientSite* pClientSite, winmdroot.System.Com.StructuredStorage.IStorage* pStg, void** ppvObj)
#cfunc global OleCreateEx "OleCreateEx" var, var, int, int, int, var, var, var, var, var, var, var

; winmdroot.Foundation.HRESULT OleCreateFromData(winmdroot.System.Com.IDataObject* pSrcDataObj, global::System.Guid* riid, uint renderopt, winmdroot.System.Com.FORMATETC* pFormatEtc, winmdroot.System.Ole.IOleClientSite* pClientSite, winmdroot.System.Com.StructuredStorage.IStorage* pStg, void** ppvObj)
#cfunc global OleCreateFromData "OleCreateFromData" var, var, int, var, var, var, var

; winmdroot.Foundation.HRESULT OleCreateFromDataEx(winmdroot.System.Com.IDataObject* pSrcDataObj, global::System.Guid* riid, winmdroot.System.Ole.OLECREATE dwFlags, uint renderopt, uint cFormats, uint* rgAdvf, winmdroot.System.Com.FORMATETC* rgFormatEtc, winmdroot.System.Com.IAdviseSink* lpAdviseSink, uint* rgdwConnection, winmdroot.System.Ole.IOleClientSite* pClientSite, winmdroot.System.Com.StructuredStorage.IStorage* pStg, void** ppvObj)
#cfunc global OleCreateFromDataEx "OleCreateFromDataEx" var, var, int, int, int, var, var, var, var, var, var, var

; winmdroot.Foundation.HRESULT OleCreateFromFile(global::System.Guid* rclsid, winmdroot.Foundation.PCWSTR lpszFileName, global::System.Guid* riid, uint renderopt, winmdroot.System.Com.FORMATETC* lpFormatEtc, winmdroot.System.Ole.IOleClientSite* pClientSite, winmdroot.System.Com.StructuredStorage.IStorage* pStg, void** ppvObj)
#cfunc global OleCreateFromFile "OleCreateFromFile" var, wstr, var, int, var, var, var, var

; winmdroot.Foundation.HRESULT OleCreateFromFileEx(global::System.Guid* rclsid, winmdroot.Foundation.PCWSTR lpszFileName, global::System.Guid* riid, winmdroot.System.Ole.OLECREATE dwFlags, uint renderopt, uint cFormats, uint* rgAdvf, winmdroot.System.Com.FORMATETC* rgFormatEtc, winmdroot.System.Com.IAdviseSink* lpAdviseSink, uint* rgdwConnection, winmdroot.System.Ole.IOleClientSite* pClientSite, winmdroot.System.Com.StructuredStorage.IStorage* pStg, void** ppvObj)
#cfunc global OleCreateFromFileEx "OleCreateFromFileEx" var, wstr, var, int, int, int, var, var, var, var, var, var, var

; winmdroot.Foundation.HRESULT OleCreateLink(winmdroot.System.Com.IMoniker* pmkLinkSrc, global::System.Guid* riid, uint renderopt, winmdroot.System.Com.FORMATETC* lpFormatEtc, winmdroot.System.Ole.IOleClientSite* pClientSite, winmdroot.System.Com.StructuredStorage.IStorage* pStg, void** ppvObj)
#cfunc global OleCreateLink "OleCreateLink" var, var, int, var, var, var, var

; winmdroot.Foundation.HRESULT OleCreateLinkEx(winmdroot.System.Com.IMoniker* pmkLinkSrc, global::System.Guid* riid, winmdroot.System.Ole.OLECREATE dwFlags, uint renderopt, uint cFormats, uint* rgAdvf, winmdroot.System.Com.FORMATETC* rgFormatEtc, winmdroot.System.Com.IAdviseSink* lpAdviseSink, uint* rgdwConnection, winmdroot.System.Ole.IOleClientSite* pClientSite, winmdroot.System.Com.StructuredStorage.IStorage* pStg, void** ppvObj)
#cfunc global OleCreateLinkEx "OleCreateLinkEx" var, var, int, int, int, var, var, var, var, var, var, var

; winmdroot.Foundation.HRESULT OleCreateLinkFromData(winmdroot.System.Com.IDataObject* pSrcDataObj, global::System.Guid* riid, uint renderopt, winmdroot.System.Com.FORMATETC* pFormatEtc, winmdroot.System.Ole.IOleClientSite* pClientSite, winmdroot.System.Com.StructuredStorage.IStorage* pStg, void** ppvObj)
#cfunc global OleCreateLinkFromData "OleCreateLinkFromData" var, var, int, var, var, var, var

; winmdroot.Foundation.HRESULT OleCreateLinkFromDataEx(winmdroot.System.Com.IDataObject* pSrcDataObj, global::System.Guid* riid, winmdroot.System.Ole.OLECREATE dwFlags, uint renderopt, uint cFormats, uint* rgAdvf, winmdroot.System.Com.FORMATETC* rgFormatEtc, winmdroot.System.Com.IAdviseSink* lpAdviseSink, uint* rgdwConnection, winmdroot.System.Ole.IOleClientSite* pClientSite, winmdroot.System.Com.StructuredStorage.IStorage* pStg, void** ppvObj)
#cfunc global OleCreateLinkFromDataEx "OleCreateLinkFromDataEx" var, var, int, int, int, var, var, var, var, var, var, var

; winmdroot.Foundation.HRESULT OleCreateLinkToFile(winmdroot.Foundation.PCWSTR lpszFileName, global::System.Guid* riid, uint renderopt, winmdroot.System.Com.FORMATETC* lpFormatEtc, winmdroot.System.Ole.IOleClientSite* pClientSite, winmdroot.System.Com.StructuredStorage.IStorage* pStg, void** ppvObj)
#cfunc global OleCreateLinkToFile "OleCreateLinkToFile" wstr, var, int, var, var, var, var

; winmdroot.Foundation.HRESULT OleCreateLinkToFileEx(winmdroot.Foundation.PCWSTR lpszFileName, global::System.Guid* riid, winmdroot.System.Ole.OLECREATE dwFlags, uint renderopt, uint cFormats, uint* rgAdvf, winmdroot.System.Com.FORMATETC* rgFormatEtc, winmdroot.System.Com.IAdviseSink* lpAdviseSink, uint* rgdwConnection, winmdroot.System.Ole.IOleClientSite* pClientSite, winmdroot.System.Com.StructuredStorage.IStorage* pStg, void** ppvObj)
#cfunc global OleCreateLinkToFileEx "OleCreateLinkToFileEx" wstr, var, int, int, int, var, var, var, var, var, var, var

; nint OleCreateMenuDescriptor(winmdroot.UI.WindowsAndMessaging.HMENU hmenuCombined, winmdroot.System.Ole.OLEMENUGROUPWIDTHS* lpMenuWidths)
#cfunc global OleCreateMenuDescriptor "OleCreateMenuDescriptor" intptr, var

; winmdroot.Foundation.HRESULT OleCreateStaticFromData(winmdroot.System.Com.IDataObject* pSrcDataObj, global::System.Guid* iid, uint renderopt, winmdroot.System.Com.FORMATETC* pFormatEtc, winmdroot.System.Ole.IOleClientSite* pClientSite, winmdroot.System.Com.StructuredStorage.IStorage* pStg, void** ppvObj)
#cfunc global OleCreateStaticFromData "OleCreateStaticFromData" var, var, int, var, var, var, var

; winmdroot.Foundation.HRESULT OleDestroyMenuDescriptor(nint holemenu)
#cfunc global OleDestroyMenuDescriptor "OleDestroyMenuDescriptor" int

; winmdroot.Foundation.HRESULT OleDoAutoConvert(winmdroot.System.Com.StructuredStorage.IStorage* pStg, global::System.Guid* pClsidNew)
#cfunc global OleDoAutoConvert "OleDoAutoConvert" var, var

; winmdroot.Foundation.HRESULT OleDraw(winmdroot.System.Com.IUnknown* pUnknown, uint dwAspect, winmdroot.Graphics.Gdi.HDC hdcDraw, winmdroot.Foundation.RECT* lprcBounds)
#cfunc global OleDraw "OleDraw" var, int, intptr, var

; winmdroot.Foundation.HANDLE OleDuplicateData(winmdroot.Foundation.HANDLE hSrc, winmdroot.System.Ole.CLIPBOARD_FORMAT cfFormat, winmdroot.System.Memory.GLOBAL_ALLOC_FLAGS uiFlags)
#cfunc global OleDuplicateData "OleDuplicateData" intptr, int, int

; winmdroot.Foundation.HRESULT OleFlushClipboard()
#cfunc global OleFlushClipboard "OleFlushClipboard"

; winmdroot.Foundation.HRESULT OleGetAutoConvert(global::System.Guid* clsidOld, global::System.Guid* pClsidNew)
#cfunc global OleGetAutoConvert "OleGetAutoConvert" var, var

; winmdroot.Foundation.HRESULT OleGetClipboard(winmdroot.System.Com.IDataObject** ppDataObj)
#cfunc global OleGetClipboard "OleGetClipboard" var

; winmdroot.Foundation.HRESULT OleGetClipboardWithEnterpriseInfo(winmdroot.System.Com.IDataObject** dataObject, winmdroot.Foundation.PWSTR* dataEnterpriseId, winmdroot.Foundation.PWSTR* sourceDescription, winmdroot.Foundation.PWSTR* targetDescription, winmdroot.Foundation.PWSTR* dataDescription)
#cfunc global OleGetClipboardWithEnterpriseInfo "OleGetClipboardWithEnterpriseInfo" var, var, var, var, var

; winmdroot.Foundation.HGLOBAL OleGetIconOfClass(global::System.Guid* rclsid, winmdroot.Foundation.PWSTR lpszLabel, winmdroot.Foundation.BOOL fUseTypeAsLabel)
#cfunc global OleGetIconOfClass "OleGetIconOfClass" var, wstr, int

; winmdroot.Foundation.HGLOBAL OleGetIconOfFile(winmdroot.Foundation.PWSTR lpszPath, winmdroot.Foundation.BOOL fUseFileAsLabel)
#cfunc global OleGetIconOfFile "OleGetIconOfFile" wstr, int

; winmdroot.Foundation.HRESULT OleInitialize(void* pvReserved)
#cfunc global OleInitialize "OleInitialize" intptr

; winmdroot.Foundation.HRESULT OleIsCurrentClipboard(winmdroot.System.Com.IDataObject* pDataObj)
#cfunc global OleIsCurrentClipboard "OleIsCurrentClipboard" var

; winmdroot.Foundation.BOOL OleIsRunning(winmdroot.System.Ole.IOleObject* pObject)
#cfunc global OleIsRunning "OleIsRunning" var

; winmdroot.Foundation.HRESULT OleLoad(winmdroot.System.Com.StructuredStorage.IStorage* pStg, global::System.Guid* riid, winmdroot.System.Ole.IOleClientSite* pClientSite, void** ppvObj)
#cfunc global OleLoad "OleLoad" var, var, var, var

; winmdroot.Foundation.HRESULT OleLoadFromStream(winmdroot.System.Com.IStream* pStm, global::System.Guid* iidInterface, void** ppvObj)
#cfunc global OleLoadFromStream "OleLoadFromStream" var, var, var

; winmdroot.Foundation.HRESULT OleLockRunning(winmdroot.System.Com.IUnknown* pUnknown, winmdroot.Foundation.BOOL fLock, winmdroot.Foundation.BOOL fLastUnlockCloses)
#cfunc global OleLockRunning "OleLockRunning" var, int, int

; winmdroot.Foundation.HGLOBAL OleMetafilePictFromIconAndLabel(winmdroot.UI.WindowsAndMessaging.HICON hIcon, winmdroot.Foundation.PWSTR lpszLabel, winmdroot.Foundation.PWSTR lpszSourceFile, uint iIconIndex)
#cfunc global OleMetafilePictFromIconAndLabel "OleMetafilePictFromIconAndLabel" intptr, wstr, wstr, int

; winmdroot.Foundation.HRESULT OleNoteObjectVisible(winmdroot.System.Com.IUnknown* pUnknown, winmdroot.Foundation.BOOL fVisible)
#cfunc global OleNoteObjectVisible "OleNoteObjectVisible" var, int

; winmdroot.Foundation.HRESULT OleQueryCreateFromData(winmdroot.System.Com.IDataObject* pSrcDataObject)
#cfunc global OleQueryCreateFromData "OleQueryCreateFromData" var

; winmdroot.Foundation.HRESULT OleQueryLinkFromData(winmdroot.System.Com.IDataObject* pSrcDataObject)
#cfunc global OleQueryLinkFromData "OleQueryLinkFromData" var

; winmdroot.Foundation.HRESULT OleRegEnumFormatEtc(global::System.Guid* clsid, uint dwDirection, winmdroot.System.Com.IEnumFORMATETC** ppenum)
#cfunc global OleRegEnumFormatEtc "OleRegEnumFormatEtc" var, int, var

; winmdroot.Foundation.HRESULT OleRegEnumVerbs(global::System.Guid* clsid, winmdroot.System.Ole.IEnumOLEVERB** ppenum)
#cfunc global OleRegEnumVerbs "OleRegEnumVerbs" var, var

; winmdroot.Foundation.HRESULT OleRegGetMiscStatus(global::System.Guid* clsid, uint dwAspect, uint* pdwStatus)
#cfunc global OleRegGetMiscStatus "OleRegGetMiscStatus" var, int, var

; winmdroot.Foundation.HRESULT OleRegGetUserType(global::System.Guid* clsid, uint dwFormOfType, winmdroot.Foundation.PWSTR* pszUserType)
#cfunc global OleRegGetUserType "OleRegGetUserType" var, int, var

; winmdroot.Foundation.HRESULT OleRun(winmdroot.System.Com.IUnknown* pUnknown)
#cfunc global OleRun "OleRun" var

; winmdroot.Foundation.HRESULT OleSave(winmdroot.System.Com.StructuredStorage.IPersistStorage* pPS, winmdroot.System.Com.StructuredStorage.IStorage* pStg, winmdroot.Foundation.BOOL fSameAsLoad)
#cfunc global OleSave "OleSave" var, var, int

; winmdroot.Foundation.HRESULT OleSaveToStream(winmdroot.System.Com.IPersistStream* pPStm, winmdroot.System.Com.IStream* pStm)
#cfunc global OleSaveToStream "OleSaveToStream" var, var

; winmdroot.Foundation.HRESULT OleSetAutoConvert(global::System.Guid* clsidOld, global::System.Guid* clsidNew)
#cfunc global OleSetAutoConvert "OleSetAutoConvert" var, var

; winmdroot.Foundation.HRESULT OleSetClipboard(winmdroot.System.Com.IDataObject* pDataObj)
#cfunc global OleSetClipboard "OleSetClipboard" var

; winmdroot.Foundation.HRESULT OleSetContainedObject(winmdroot.System.Com.IUnknown* pUnknown, winmdroot.Foundation.BOOL fContained)
#cfunc global OleSetContainedObject "OleSetContainedObject" var, int

; winmdroot.Foundation.HRESULT OleSetMenuDescriptor(nint holemenu, winmdroot.Foundation.HWND hwndFrame, winmdroot.Foundation.HWND hwndActiveObject, winmdroot.System.Ole.IOleInPlaceFrame* lpFrame, winmdroot.System.Ole.IOleInPlaceActiveObject* lpActiveObj)
#cfunc global OleSetMenuDescriptor "OleSetMenuDescriptor" int, intptr, intptr, var, var

; winmdroot.Foundation.HRESULT OleTranslateAccelerator(winmdroot.System.Ole.IOleInPlaceFrame* lpFrame, winmdroot.System.Ole.OLEINPLACEFRAMEINFO* lpFrameInfo, winmdroot.UI.WindowsAndMessaging.MSG* lpmsg)
#cfunc global OleTranslateAccelerator "OleTranslateAccelerator" var, var, var

; void OleUninitialize()
#func global OleUninitialize "OleUninitialize"

; winmdroot.Foundation.HRESULT PropStgNameToFmtId(winmdroot.Foundation.PCWSTR oszName, global::System.Guid* pfmtid)
#cfunc global PropStgNameToFmtId "PropStgNameToFmtId" wstr, var

; winmdroot.Foundation.HRESULT PropVariantClear(winmdroot.System.Com.StructuredStorage.PROPVARIANT* pvar)
#cfunc global PropVariantClear "PropVariantClear" var

; winmdroot.Foundation.HRESULT PropVariantCopy(winmdroot.System.Com.StructuredStorage.PROPVARIANT* pvarDest, winmdroot.System.Com.StructuredStorage.PROPVARIANT* pvarSrc)
#cfunc global PropVariantCopy "PropVariantCopy" var, var

; winmdroot.Foundation.HRESULT ReadClassStg(winmdroot.System.Com.StructuredStorage.IStorage* pStg, global::System.Guid* pclsid)
#cfunc global ReadClassStg "ReadClassStg" var, var

; winmdroot.Foundation.HRESULT ReadClassStm(winmdroot.System.Com.IStream* pStm, global::System.Guid* pclsid)
#cfunc global ReadClassStm "ReadClassStm" var, var

; winmdroot.Foundation.HRESULT ReadFmtUserTypeStg(winmdroot.System.Com.StructuredStorage.IStorage* pstg, ushort* pcf, [Optional] winmdroot.Foundation.PWSTR* lplpszUserType)
#cfunc global ReadFmtUserTypeStg "ReadFmtUserTypeStg" var, var, var

; winmdroot.Foundation.HRESULT RegisterDragDrop(winmdroot.Foundation.HWND hwnd, winmdroot.System.Ole.IDropTarget* pDropTarget)
#cfunc global RegisterDragDrop "RegisterDragDrop" intptr, var

; void ReleaseStgMedium(winmdroot.System.Com.STGMEDIUM* param0)
#func global ReleaseStgMedium "ReleaseStgMedium" var

; winmdroot.Foundation.HRESULT RevokeDragDrop(winmdroot.Foundation.HWND hwnd)
#cfunc global RevokeDragDrop "RevokeDragDrop" intptr

; void SNB_UserFree(uint* param0, ushort*** param1)
#func global SNB_UserFree "SNB_UserFree" var, var

; void SNB_UserFree64(uint* param0, ushort*** param1)
#func global SNB_UserFree64 "SNB_UserFree64" var, var

; byte* SNB_UserMarshal(uint* param0, byte* param1, ushort*** param2)
#cfunc global SNB_UserMarshal "SNB_UserMarshal" var, var, var

; byte* SNB_UserMarshal64(uint* param0, byte* param1, ushort*** param2)
#cfunc global SNB_UserMarshal64 "SNB_UserMarshal64" var, var, var

; uint SNB_UserSize(uint* param0, uint param1, ushort*** param2)
#cfunc global SNB_UserSize "SNB_UserSize" var, int, var

; uint SNB_UserSize64(uint* param0, uint param1, ushort*** param2)
#cfunc global SNB_UserSize64 "SNB_UserSize64" var, int, var

; byte* SNB_UserUnmarshal(uint* param0, byte* param1, ushort*** param2)
#cfunc global SNB_UserUnmarshal "SNB_UserUnmarshal" var, var, var

; byte* SNB_UserUnmarshal64(uint* param0, byte* param1, ushort*** param2)
#cfunc global SNB_UserUnmarshal64 "SNB_UserUnmarshal64" var, var, var

; void STGMEDIUM_UserFree(uint* param0, winmdroot.System.Com.STGMEDIUM* param1)
#func global STGMEDIUM_UserFree "STGMEDIUM_UserFree" var, var

; void STGMEDIUM_UserFree64(uint* param0, winmdroot.System.Com.STGMEDIUM* param1)
#func global STGMEDIUM_UserFree64 "STGMEDIUM_UserFree64" var, var

; byte* STGMEDIUM_UserMarshal(uint* param0, byte* param1, winmdroot.System.Com.STGMEDIUM* param2)
#cfunc global STGMEDIUM_UserMarshal "STGMEDIUM_UserMarshal" var, var, var

; byte* STGMEDIUM_UserMarshal64(uint* param0, byte* param1, winmdroot.System.Com.STGMEDIUM* param2)
#cfunc global STGMEDIUM_UserMarshal64 "STGMEDIUM_UserMarshal64" var, var, var

; uint STGMEDIUM_UserSize(uint* param0, uint param1, winmdroot.System.Com.STGMEDIUM* param2)
#cfunc global STGMEDIUM_UserSize "STGMEDIUM_UserSize" var, int, var

; uint STGMEDIUM_UserSize64(uint* param0, uint param1, winmdroot.System.Com.STGMEDIUM* param2)
#cfunc global STGMEDIUM_UserSize64 "STGMEDIUM_UserSize64" var, int, var

; byte* STGMEDIUM_UserUnmarshal(uint* param0, byte* param1, winmdroot.System.Com.STGMEDIUM* param2)
#cfunc global STGMEDIUM_UserUnmarshal "STGMEDIUM_UserUnmarshal" var, var, var

; byte* STGMEDIUM_UserUnmarshal64(uint* param0, byte* param1, winmdroot.System.Com.STGMEDIUM* param2)
#cfunc global STGMEDIUM_UserUnmarshal64 "STGMEDIUM_UserUnmarshal64" var, var, var

; winmdroot.Foundation.HRESULT SetConvertStg(winmdroot.System.Com.StructuredStorage.IStorage* pStg, winmdroot.Foundation.BOOL fConvert)
#cfunc global SetConvertStg "SetConvertStg" var, int

; winmdroot.Foundation.BOOLEAN StgConvertPropertyToVariant(winmdroot.System.Com.StructuredStorage.SERIALIZEDPROPERTYVALUE* pprop, ushort CodePage, winmdroot.System.Com.StructuredStorage.PROPVARIANT* pvar, winmdroot.System.Com.StructuredStorage.IMemoryAllocator* pma)
#cfunc global StgConvertPropertyToVariant "StgConvertPropertyToVariant" var, int, var, var

; winmdroot.System.Com.StructuredStorage.SERIALIZEDPROPERTYVALUE* StgConvertVariantToProperty(winmdroot.System.Com.StructuredStorage.PROPVARIANT* pvar, ushort CodePage, [Optional] winmdroot.System.Com.StructuredStorage.SERIALIZEDPROPERTYVALUE* pprop, uint* pcb, uint pid, winmdroot.Foundation.BOOLEAN fReserved, [Optional] uint* pcIndirect)
#cfunc global StgConvertVariantToProperty "StgConvertVariantToProperty" var, int, var, var, int, int, var

; winmdroot.Foundation.HRESULT StgCreateDocfile(winmdroot.Foundation.PCWSTR pwcsName, winmdroot.System.Com.STGM grfMode, uint reserved, winmdroot.System.Com.StructuredStorage.IStorage** ppstgOpen)
#cfunc global StgCreateDocfile "StgCreateDocfile" wstr, int, int, var

; winmdroot.Foundation.HRESULT StgCreateDocfileOnILockBytes(winmdroot.System.Com.StructuredStorage.ILockBytes* plkbyt, winmdroot.System.Com.STGM grfMode, uint reserved, winmdroot.System.Com.StructuredStorage.IStorage** ppstgOpen)
#cfunc global StgCreateDocfileOnILockBytes "StgCreateDocfileOnILockBytes" var, int, int, var

; winmdroot.Foundation.HRESULT StgCreatePropSetStg(winmdroot.System.Com.StructuredStorage.IStorage* pStorage, uint dwReserved, winmdroot.System.Com.StructuredStorage.IPropertySetStorage** ppPropSetStg)
#cfunc global StgCreatePropSetStg "StgCreatePropSetStg" var, int, var

; winmdroot.Foundation.HRESULT StgCreatePropStg(winmdroot.System.Com.IUnknown* pUnk, global::System.Guid* fmtid, global::System.Guid* pclsid, uint grfFlags, uint dwReserved, winmdroot.System.Com.StructuredStorage.IPropertyStorage** ppPropStg)
#cfunc global StgCreatePropStg "StgCreatePropStg" var, var, var, int, int, var

; winmdroot.Foundation.HRESULT StgCreateStorageEx(winmdroot.Foundation.PCWSTR pwcsName, winmdroot.System.Com.STGM grfMode, winmdroot.System.Com.StructuredStorage.STGFMT stgfmt, uint grfAttrs, [Optional] winmdroot.System.Com.StructuredStorage.STGOPTIONS* pStgOptions, winmdroot.Security.PSECURITY_DESCRIPTOR pSecurityDescriptor, global::System.Guid* riid, void** ppObjectOpen)
#cfunc global StgCreateStorageEx "StgCreateStorageEx" wstr, int, int, int, var, int, var, var

; winmdroot.Foundation.HRESULT StgGetIFillLockBytesOnFile(winmdroot.Foundation.PCWSTR pwcsName, winmdroot.System.Com.StructuredStorage.IFillLockBytes** ppflb)
#cfunc global StgGetIFillLockBytesOnFile "StgGetIFillLockBytesOnFile" wstr, var

; winmdroot.Foundation.HRESULT StgGetIFillLockBytesOnILockBytes(winmdroot.System.Com.StructuredStorage.ILockBytes* pilb, winmdroot.System.Com.StructuredStorage.IFillLockBytes** ppflb)
#cfunc global StgGetIFillLockBytesOnILockBytes "StgGetIFillLockBytesOnILockBytes" var, var

; winmdroot.Foundation.HRESULT StgIsStorageFile(winmdroot.Foundation.PCWSTR pwcsName)
#cfunc global StgIsStorageFile "StgIsStorageFile" wstr

; winmdroot.Foundation.HRESULT StgIsStorageILockBytes(winmdroot.System.Com.StructuredStorage.ILockBytes* plkbyt)
#cfunc global StgIsStorageILockBytes "StgIsStorageILockBytes" var

; winmdroot.Foundation.HRESULT StgOpenAsyncDocfileOnIFillLockBytes(winmdroot.System.Com.StructuredStorage.IFillLockBytes* pflb, uint grfMode, uint asyncFlags, winmdroot.System.Com.StructuredStorage.IStorage** ppstgOpen)
#cfunc global StgOpenAsyncDocfileOnIFillLockBytes "StgOpenAsyncDocfileOnIFillLockBytes" var, int, int, var

; winmdroot.Foundation.HRESULT StgOpenPropStg(winmdroot.System.Com.IUnknown* pUnk, global::System.Guid* fmtid, uint grfFlags, uint dwReserved, winmdroot.System.Com.StructuredStorage.IPropertyStorage** ppPropStg)
#cfunc global StgOpenPropStg "StgOpenPropStg" var, var, int, int, var

; winmdroot.Foundation.HRESULT StgOpenStorage(winmdroot.Foundation.PCWSTR pwcsName, [Optional] winmdroot.System.Com.StructuredStorage.IStorage* pstgPriority, winmdroot.System.Com.STGM grfMode, [Optional] ushort** snbExclude, uint reserved, winmdroot.System.Com.StructuredStorage.IStorage** ppstgOpen)
#cfunc global StgOpenStorage "StgOpenStorage" wstr, var, int, var, int, var

; winmdroot.Foundation.HRESULT StgOpenStorageEx(winmdroot.Foundation.PCWSTR pwcsName, winmdroot.System.Com.STGM grfMode, winmdroot.System.Com.StructuredStorage.STGFMT stgfmt, uint grfAttrs, [Optional] winmdroot.System.Com.StructuredStorage.STGOPTIONS* pStgOptions, winmdroot.Security.PSECURITY_DESCRIPTOR pSecurityDescriptor, global::System.Guid* riid, void** ppObjectOpen)
#cfunc global StgOpenStorageEx "StgOpenStorageEx" wstr, int, int, int, var, int, var, var

; winmdroot.Foundation.HRESULT StgOpenStorageOnILockBytes(winmdroot.System.Com.StructuredStorage.ILockBytes* plkbyt, [Optional] winmdroot.System.Com.StructuredStorage.IStorage* pstgPriority, winmdroot.System.Com.STGM grfMode, [Optional] ushort** snbExclude, uint reserved, winmdroot.System.Com.StructuredStorage.IStorage** ppstgOpen)
#cfunc global StgOpenStorageOnILockBytes "StgOpenStorageOnILockBytes" var, var, int, var, int, var

; uint StgPropertyLengthAsVariant(winmdroot.System.Com.StructuredStorage.SERIALIZEDPROPERTYVALUE* pProp, uint cbProp, ushort CodePage, byte bReserved)
#cfunc global StgPropertyLengthAsVariant "StgPropertyLengthAsVariant" var, int, int, int

; winmdroot.Foundation.HRESULT StgSetTimes(winmdroot.Foundation.PCWSTR lpszName, [Optional] global::System.Runtime.InteropServices.ComTypes.FILETIME* pctime, [Optional] global::System.Runtime.InteropServices.ComTypes.FILETIME* patime, [Optional] global::System.Runtime.InteropServices.ComTypes.FILETIME* pmtime)
#cfunc global StgSetTimes "StgSetTimes" wstr, var, var, var

; winmdroot.Foundation.HRESULT WriteClassStg(winmdroot.System.Com.StructuredStorage.IStorage* pStg, global::System.Guid* rclsid)
#cfunc global WriteClassStg "WriteClassStg" var, var

; winmdroot.Foundation.HRESULT WriteClassStm(winmdroot.System.Com.IStream* pStm, global::System.Guid* rclsid)
#cfunc global WriteClassStm "WriteClassStm" var, var

; winmdroot.Foundation.HRESULT WriteFmtUserTypeStg(winmdroot.System.Com.StructuredStorage.IStorage* pstg, ushort cf, winmdroot.Foundation.PWSTR lpszUserType)
#cfunc global WriteFmtUserTypeStg "WriteFmtUserTypeStg" var, int, wstr

#endif
