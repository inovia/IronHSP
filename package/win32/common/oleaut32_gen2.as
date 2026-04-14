; ============================================================
;   Auto-generated from CsWin32 / win32metadata
;   dll:    oleaut32.dll
;   tool:   tools/cswin32_bridge/gen_from_cswin32.py
;   Do not edit by hand ? regenerate via the python script.
;   Needs hsp3net (intptr / NSTRUCT / wstr).
; ============================================================

#ifndef __oleaut32_gen2_as__
#define __oleaut32_gen2_as__

; Shared NSTRUCT + #define constants for all win32 *_gen2.as
#include "win32_types_gen2.as"

;--- functions ---
#uselib "oleaut32.dll"
; void SysFreeString(winmdroot.Foundation.BSTR bstrString)
#func SysFreeString "SysFreeString" int

; void BSTR_UserFree(uint* param0, winmdroot.Foundation.BSTR* param1)
#func BSTR_UserFree "BSTR_UserFree" var, var

; void BSTR_UserFree64(uint* param0, winmdroot.Foundation.BSTR* param1)
#func BSTR_UserFree64 "BSTR_UserFree64" var, var

; byte* BSTR_UserMarshal(uint* param0, byte* param1, winmdroot.Foundation.BSTR* param2)
#cfunc BSTR_UserMarshal "BSTR_UserMarshal" var, var, var

; byte* BSTR_UserMarshal64(uint* param0, byte* param1, winmdroot.Foundation.BSTR* param2)
#cfunc BSTR_UserMarshal64 "BSTR_UserMarshal64" var, var, var

; uint BSTR_UserSize(uint* param0, uint param1, winmdroot.Foundation.BSTR* param2)
#cfunc BSTR_UserSize "BSTR_UserSize" var, int, var

; uint BSTR_UserSize64(uint* param0, uint param1, winmdroot.Foundation.BSTR* param2)
#cfunc BSTR_UserSize64 "BSTR_UserSize64" var, int, var

; byte* BSTR_UserUnmarshal(uint* param0, byte* param1, winmdroot.Foundation.BSTR* param2)
#cfunc BSTR_UserUnmarshal "BSTR_UserUnmarshal" var, var, var

; byte* BSTR_UserUnmarshal64(uint* param0, byte* param1, winmdroot.Foundation.BSTR* param2)
#cfunc BSTR_UserUnmarshal64 "BSTR_UserUnmarshal64" var, var, var

; winmdroot.Foundation.HRESULT BstrFromVector(winmdroot.System.Com.SAFEARRAY* psa, winmdroot.Foundation.BSTR* pbstr)
#cfunc BstrFromVector "BstrFromVector" var, var

; void ClearCustData(winmdroot.System.Com.CUSTDATA* pCustData)
#func ClearCustData "ClearCustData" var

; winmdroot.Foundation.HRESULT CreateDispTypeInfo(winmdroot.System.Ole.INTERFACEDATA* pidata, uint lcid, winmdroot.System.Com.ITypeInfo** pptinfo)
#cfunc CreateDispTypeInfo "CreateDispTypeInfo" var, int, var

; winmdroot.Foundation.HRESULT CreateErrorInfo(winmdroot.System.Ole.ICreateErrorInfo** pperrinfo)
#cfunc CreateErrorInfo "CreateErrorInfo" var

; winmdroot.Foundation.HRESULT CreateStdDispatch(winmdroot.System.Com.IUnknown* punkOuter, void* pvThis, winmdroot.System.Com.ITypeInfo* ptinfo, winmdroot.System.Com.IUnknown** ppunkStdDisp)
#cfunc CreateStdDispatch "CreateStdDispatch" var, intptr, var, var

; winmdroot.Foundation.HRESULT CreateTypeLib(winmdroot.System.Com.SYSKIND syskind, winmdroot.Foundation.PCWSTR szFile, winmdroot.System.Ole.ICreateTypeLib** ppctlib)
#cfunc CreateTypeLib "CreateTypeLib" int, wstr, var

; winmdroot.Foundation.HRESULT CreateTypeLib2(winmdroot.System.Com.SYSKIND syskind, winmdroot.Foundation.PCWSTR szFile, winmdroot.System.Ole.ICreateTypeLib2** ppctlib)
#cfunc CreateTypeLib2 "CreateTypeLib2" int, wstr, var

; winmdroot.Foundation.HRESULT DispCallFunc([Optional] void* pvInstance, nuint oVft, winmdroot.System.Com.CALLCONV cc, winmdroot.System.Variant.VARENUM vtReturn, uint cActuals, ushort* prgvt, winmdroot.System.Variant.VARIANT** prgpvarg, winmdroot.System.Variant.VARIANT* pvargResult)
#cfunc DispCallFunc "DispCallFunc" intptr, int, int, int, int, var, var, var

; winmdroot.Foundation.HRESULT DispGetIDsOfNames(winmdroot.System.Com.ITypeInfo* ptinfo, winmdroot.Foundation.PWSTR* rgszNames, uint cNames, int* rgdispid)
#cfunc DispGetIDsOfNames "DispGetIDsOfNames" var, var, int, var

; winmdroot.Foundation.HRESULT DispGetParam(winmdroot.System.Com.DISPPARAMS* pdispparams, uint position, winmdroot.System.Variant.VARENUM vtTarg, winmdroot.System.Variant.VARIANT* pvarResult, [Optional] uint* puArgErr)
#cfunc DispGetParam "DispGetParam" var, int, int, var, var

; winmdroot.Foundation.HRESULT DispInvoke(void* _this, winmdroot.System.Com.ITypeInfo* ptinfo, int dispidMember, ushort wFlags, winmdroot.System.Com.DISPPARAMS* pparams, winmdroot.System.Variant.VARIANT* pvarResult, winmdroot.System.Com.EXCEPINFO* pexcepinfo, uint* puArgErr)
#cfunc DispInvoke "DispInvoke" intptr, var, int, int, var, var, var, var

; int DosDateTimeToVariantTime(ushort wDosDate, ushort wDosTime, double* pvtime)
#cfunc DosDateTimeToVariantTime "DosDateTimeToVariantTime" int, int, var

; winmdroot.Foundation.HRESULT GetActiveObject(global::System.Guid* rclsid, void* pvReserved, winmdroot.System.Com.IUnknown** ppunk)
#cfunc GetActiveObject "GetActiveObject" var, intptr, var

; winmdroot.Foundation.HRESULT GetAltMonthNames(uint lcid, winmdroot.Foundation.PWSTR** prgp)
#cfunc GetAltMonthNames "GetAltMonthNames" int, var

; winmdroot.Foundation.HRESULT GetErrorInfo(uint dwReserved, winmdroot.System.Com.IErrorInfo** pperrinfo)
#cfunc GetErrorInfo "GetErrorInfo" int, var

; winmdroot.Foundation.HRESULT GetRecordInfoFromGuids(global::System.Guid* rGuidTypeLib, uint uVerMajor, uint uVerMinor, uint lcid, global::System.Guid* rGuidTypeInfo, winmdroot.System.Ole.IRecordInfo** ppRecInfo)
#cfunc GetRecordInfoFromGuids "GetRecordInfoFromGuids" var, int, int, int, var, var

; winmdroot.Foundation.HRESULT GetRecordInfoFromTypeInfo(winmdroot.System.Com.ITypeInfo* pTypeInfo, winmdroot.System.Ole.IRecordInfo** ppRecInfo)
#cfunc GetRecordInfoFromTypeInfo "GetRecordInfoFromTypeInfo" var, var

; uint LHashValOfNameSys(winmdroot.System.Com.SYSKIND syskind, uint lcid, winmdroot.Foundation.PCWSTR szName)
#cfunc LHashValOfNameSys "LHashValOfNameSys" int, int, wstr

; void LPSAFEARRAY_UserFree(uint* param0, winmdroot.System.Com.SAFEARRAY** param1)
#func LPSAFEARRAY_UserFree "LPSAFEARRAY_UserFree" var, var

; void LPSAFEARRAY_UserFree64(uint* param0, winmdroot.System.Com.SAFEARRAY** param1)
#func LPSAFEARRAY_UserFree64 "LPSAFEARRAY_UserFree64" var, var

; byte* LPSAFEARRAY_UserMarshal(uint* param0, byte* param1, winmdroot.System.Com.SAFEARRAY** param2)
#cfunc LPSAFEARRAY_UserMarshal "LPSAFEARRAY_UserMarshal" var, var, var

; byte* LPSAFEARRAY_UserMarshal64(uint* param0, byte* param1, winmdroot.System.Com.SAFEARRAY** param2)
#cfunc LPSAFEARRAY_UserMarshal64 "LPSAFEARRAY_UserMarshal64" var, var, var

; uint LPSAFEARRAY_UserSize(uint* param0, uint param1, winmdroot.System.Com.SAFEARRAY** param2)
#cfunc LPSAFEARRAY_UserSize "LPSAFEARRAY_UserSize" var, int, var

; uint LPSAFEARRAY_UserSize64(uint* param0, uint param1, winmdroot.System.Com.SAFEARRAY** param2)
#cfunc LPSAFEARRAY_UserSize64 "LPSAFEARRAY_UserSize64" var, int, var

; byte* LPSAFEARRAY_UserUnmarshal(uint* param0, byte* param1, winmdroot.System.Com.SAFEARRAY** param2)
#cfunc LPSAFEARRAY_UserUnmarshal "LPSAFEARRAY_UserUnmarshal" var, var, var

; byte* LPSAFEARRAY_UserUnmarshal64(uint* param0, byte* param1, winmdroot.System.Com.SAFEARRAY** param2)
#cfunc LPSAFEARRAY_UserUnmarshal64 "LPSAFEARRAY_UserUnmarshal64" var, var, var

; winmdroot.Foundation.HRESULT LoadRegTypeLib(global::System.Guid* rguid, ushort wVerMajor, ushort wVerMinor, uint lcid, winmdroot.System.Com.ITypeLib** pptlib)
#cfunc LoadRegTypeLib "LoadRegTypeLib" var, int, int, int, var

; winmdroot.Foundation.HRESULT LoadTypeLib(winmdroot.Foundation.PCWSTR szFile, winmdroot.System.Com.ITypeLib** pptlib)
#cfunc LoadTypeLib "LoadTypeLib" wstr, var

; winmdroot.Foundation.HRESULT LoadTypeLibEx(winmdroot.Foundation.PCWSTR szFile, winmdroot.System.Ole.REGKIND regkind, winmdroot.System.Com.ITypeLib** pptlib)
#cfunc LoadTypeLibEx "LoadTypeLibEx" wstr, int, var

; uint OaBuildVersion()
#cfunc OaBuildVersion "OaBuildVersion"

; void OaEnablePerUserTLibRegistration()
#func OaEnablePerUserTLibRegistration "OaEnablePerUserTLibRegistration"

; winmdroot.Foundation.HRESULT OleCreateFontIndirect(winmdroot.System.Ole.FONTDESC* lpFontDesc, global::System.Guid* riid, void** lplpvObj)
#cfunc OleCreateFontIndirect "OleCreateFontIndirect" var, var, var

; winmdroot.Foundation.HRESULT OleCreatePictureIndirect(winmdroot.System.Ole.PICTDESC* lpPictDesc, global::System.Guid* riid, winmdroot.Foundation.BOOL fOwn, void** lplpvObj)
#cfunc OleCreatePictureIndirect "OleCreatePictureIndirect" var, var, int, var

; winmdroot.Foundation.HRESULT OleCreatePropertyFrame(winmdroot.Foundation.HWND hwndOwner, uint x, uint y, winmdroot.Foundation.PCWSTR lpszCaption, uint cObjects, winmdroot.System.Com.IUnknown** ppUnk, uint cPages, global::System.Guid* pPageClsID, uint lcid, uint dwReserved, void* pvReserved)
#cfunc OleCreatePropertyFrame "OleCreatePropertyFrame" intptr, int, int, wstr, int, var, int, var, int, int, intptr

; winmdroot.Foundation.HRESULT OleCreatePropertyFrameIndirect(winmdroot.System.Ole.OCPFIPARAMS* lpParams)
#cfunc OleCreatePropertyFrameIndirect "OleCreatePropertyFrameIndirect" var

; winmdroot.UI.WindowsAndMessaging.HCURSOR OleIconToCursor(winmdroot.Foundation.HINSTANCE hinstExe, winmdroot.UI.WindowsAndMessaging.HICON hIcon)
#cfunc OleIconToCursor "OleIconToCursor" intptr, intptr

; winmdroot.Foundation.HRESULT OleLoadPicture(winmdroot.System.Com.IStream* lpstream, int lSize, winmdroot.Foundation.BOOL fRunmode, global::System.Guid* riid, void** lplpvObj)
#cfunc OleLoadPicture "OleLoadPicture" var, int, int, var, var

; winmdroot.Foundation.HRESULT OleLoadPictureEx(winmdroot.System.Com.IStream* lpstream, int lSize, winmdroot.Foundation.BOOL fRunmode, global::System.Guid* riid, uint xSizeDesired, uint ySizeDesired, winmdroot.System.Ole.LOAD_PICTURE_FLAGS dwFlags, void** lplpvObj)
#cfunc OleLoadPictureEx "OleLoadPictureEx" var, int, int, var, int, int, int, var

; winmdroot.Foundation.HRESULT OleLoadPictureFile(winmdroot.System.Variant.VARIANT varFileName, winmdroot.System.Com.IDispatch** lplpdispPicture)
#cfunc OleLoadPictureFile "OleLoadPictureFile" var, var

; winmdroot.Foundation.HRESULT OleLoadPictureFileEx(winmdroot.System.Variant.VARIANT varFileName, uint xSizeDesired, uint ySizeDesired, winmdroot.System.Ole.LOAD_PICTURE_FLAGS dwFlags, winmdroot.System.Com.IDispatch** lplpdispPicture)
#cfunc OleLoadPictureFileEx "OleLoadPictureFileEx" var, int, int, int, var

; winmdroot.Foundation.HRESULT OleLoadPicturePath(winmdroot.Foundation.PWSTR szURLorPath, winmdroot.System.Com.IUnknown* punkCaller, uint dwReserved, uint clrReserved, global::System.Guid* riid, void** ppvRet)
#cfunc OleLoadPicturePath "OleLoadPicturePath" wstr, var, int, int, var, var

; winmdroot.Foundation.HRESULT OleSavePictureFile(winmdroot.System.Com.IDispatch* lpdispPicture, winmdroot.Foundation.BSTR bstrFileName)
#cfunc OleSavePictureFile "OleSavePictureFile" var, int

; winmdroot.Foundation.HRESULT OleTranslateColor(uint clr, winmdroot.Graphics.Gdi.HPALETTE hpal, winmdroot.Foundation.COLORREF* lpcolorref)
#cfunc OleTranslateColor "OleTranslateColor" int, intptr, var

; winmdroot.Foundation.HRESULT QueryPathOfRegTypeLib(global::System.Guid* guid, ushort wMaj, ushort wMin, uint lcid, winmdroot.Foundation.BSTR* lpbstrPathName)
#cfunc QueryPathOfRegTypeLib "QueryPathOfRegTypeLib" var, int, int, int, var

; winmdroot.Foundation.HRESULT RegisterActiveObject(winmdroot.System.Com.IUnknown* punk, global::System.Guid* rclsid, winmdroot.System.Ole.ACTIVEOBJECT_FLAGS dwFlags, uint* pdwRegister)
#cfunc RegisterActiveObject "RegisterActiveObject" var, var, int, var

; winmdroot.Foundation.HRESULT RegisterTypeLib(winmdroot.System.Com.ITypeLib* ptlib, winmdroot.Foundation.PCWSTR szFullPath, winmdroot.Foundation.PCWSTR szHelpDir)
#cfunc RegisterTypeLib "RegisterTypeLib" var, wstr, wstr

; winmdroot.Foundation.HRESULT RegisterTypeLibForUser(winmdroot.System.Com.ITypeLib* ptlib, winmdroot.Foundation.PWSTR szFullPath, winmdroot.Foundation.PWSTR szHelpDir)
#cfunc RegisterTypeLibForUser "RegisterTypeLibForUser" var, wstr, wstr

; winmdroot.Foundation.HRESULT RevokeActiveObject(uint dwRegister, void* pvReserved)
#cfunc RevokeActiveObject "RevokeActiveObject" int, intptr

; winmdroot.Foundation.HRESULT SafeArrayAccessData(winmdroot.System.Com.SAFEARRAY* psa, void** ppvData)
#cfunc SafeArrayAccessData "SafeArrayAccessData" var, var

; winmdroot.Foundation.HRESULT SafeArrayAddRef(winmdroot.System.Com.SAFEARRAY* psa, void** ppDataToRelease)
#cfunc SafeArrayAddRef "SafeArrayAddRef" var, var

; winmdroot.Foundation.HRESULT SafeArrayAllocData(winmdroot.System.Com.SAFEARRAY* psa)
#cfunc SafeArrayAllocData "SafeArrayAllocData" var

; winmdroot.Foundation.HRESULT SafeArrayAllocDescriptor(uint cDims, winmdroot.System.Com.SAFEARRAY** ppsaOut)
#cfunc SafeArrayAllocDescriptor "SafeArrayAllocDescriptor" int, var

; winmdroot.Foundation.HRESULT SafeArrayAllocDescriptorEx(winmdroot.System.Variant.VARENUM vt, uint cDims, winmdroot.System.Com.SAFEARRAY** ppsaOut)
#cfunc SafeArrayAllocDescriptorEx "SafeArrayAllocDescriptorEx" int, int, var

; winmdroot.Foundation.HRESULT SafeArrayCopy(winmdroot.System.Com.SAFEARRAY* psa, winmdroot.System.Com.SAFEARRAY** ppsaOut)
#cfunc SafeArrayCopy "SafeArrayCopy" var, var

; winmdroot.Foundation.HRESULT SafeArrayCopyData(winmdroot.System.Com.SAFEARRAY* psaSource, winmdroot.System.Com.SAFEARRAY* psaTarget)
#cfunc SafeArrayCopyData "SafeArrayCopyData" var, var

; winmdroot.System.Com.SAFEARRAY* SafeArrayCreate(winmdroot.System.Variant.VARENUM vt, uint cDims, winmdroot.System.Com.SAFEARRAYBOUND* rgsabound)
#cfunc SafeArrayCreate "SafeArrayCreate" int, int, var

; winmdroot.System.Com.SAFEARRAY* SafeArrayCreateEx(winmdroot.System.Variant.VARENUM vt, uint cDims, winmdroot.System.Com.SAFEARRAYBOUND* rgsabound, void* pvExtra)
#cfunc SafeArrayCreateEx "SafeArrayCreateEx" int, int, var, intptr

; winmdroot.System.Com.SAFEARRAY* SafeArrayCreateVector(winmdroot.System.Variant.VARENUM vt, int lLbound, uint cElements)
#cfunc SafeArrayCreateVector "SafeArrayCreateVector" int, int, int

; winmdroot.System.Com.SAFEARRAY* SafeArrayCreateVectorEx(winmdroot.System.Variant.VARENUM vt, int lLbound, uint cElements, void* pvExtra)
#cfunc SafeArrayCreateVectorEx "SafeArrayCreateVectorEx" int, int, int, intptr

; winmdroot.Foundation.HRESULT SafeArrayDestroy(winmdroot.System.Com.SAFEARRAY* psa)
#cfunc SafeArrayDestroy "SafeArrayDestroy" var

; winmdroot.Foundation.HRESULT SafeArrayDestroyData(winmdroot.System.Com.SAFEARRAY* psa)
#cfunc SafeArrayDestroyData "SafeArrayDestroyData" var

; winmdroot.Foundation.HRESULT SafeArrayDestroyDescriptor(winmdroot.System.Com.SAFEARRAY* psa)
#cfunc SafeArrayDestroyDescriptor "SafeArrayDestroyDescriptor" var

; uint SafeArrayGetDim(winmdroot.System.Com.SAFEARRAY* psa)
#cfunc SafeArrayGetDim "SafeArrayGetDim" var

; winmdroot.Foundation.HRESULT SafeArrayGetElement(winmdroot.System.Com.SAFEARRAY* psa, int* rgIndices, void* pv)
#cfunc SafeArrayGetElement "SafeArrayGetElement" var, var, intptr

; uint SafeArrayGetElemsize(winmdroot.System.Com.SAFEARRAY* psa)
#cfunc SafeArrayGetElemsize "SafeArrayGetElemsize" var

; winmdroot.Foundation.HRESULT SafeArrayGetIID(winmdroot.System.Com.SAFEARRAY* psa, global::System.Guid* pguid)
#cfunc SafeArrayGetIID "SafeArrayGetIID" var, var

; winmdroot.Foundation.HRESULT SafeArrayGetLBound(winmdroot.System.Com.SAFEARRAY* psa, uint nDim, int* plLbound)
#cfunc SafeArrayGetLBound "SafeArrayGetLBound" var, int, var

; winmdroot.Foundation.HRESULT SafeArrayGetRecordInfo(winmdroot.System.Com.SAFEARRAY* psa, winmdroot.System.Ole.IRecordInfo** prinfo)
#cfunc SafeArrayGetRecordInfo "SafeArrayGetRecordInfo" var, var

; winmdroot.Foundation.HRESULT SafeArrayGetUBound(winmdroot.System.Com.SAFEARRAY* psa, uint nDim, int* plUbound)
#cfunc SafeArrayGetUBound "SafeArrayGetUBound" var, int, var

; winmdroot.Foundation.HRESULT SafeArrayGetVartype(winmdroot.System.Com.SAFEARRAY* psa, winmdroot.System.Variant.VARENUM* pvt)
#cfunc SafeArrayGetVartype "SafeArrayGetVartype" var, var

; winmdroot.Foundation.HRESULT SafeArrayLock(winmdroot.System.Com.SAFEARRAY* psa)
#cfunc SafeArrayLock "SafeArrayLock" var

; winmdroot.Foundation.HRESULT SafeArrayPtrOfIndex(winmdroot.System.Com.SAFEARRAY* psa, int* rgIndices, void** ppvData)
#cfunc SafeArrayPtrOfIndex "SafeArrayPtrOfIndex" var, var, var

; winmdroot.Foundation.HRESULT SafeArrayPutElement(winmdroot.System.Com.SAFEARRAY* psa, int* rgIndices, void* pv)
#cfunc SafeArrayPutElement "SafeArrayPutElement" var, var, intptr

; winmdroot.Foundation.HRESULT SafeArrayRedim(winmdroot.System.Com.SAFEARRAY* psa, winmdroot.System.Com.SAFEARRAYBOUND* psaboundNew)
#cfunc SafeArrayRedim "SafeArrayRedim" var, var

; void SafeArrayReleaseData(void* pData)
#func SafeArrayReleaseData "SafeArrayReleaseData" intptr

; void SafeArrayReleaseDescriptor(winmdroot.System.Com.SAFEARRAY* psa)
#func SafeArrayReleaseDescriptor "SafeArrayReleaseDescriptor" var

; winmdroot.Foundation.HRESULT SafeArraySetIID(winmdroot.System.Com.SAFEARRAY* psa, global::System.Guid* guid)
#cfunc SafeArraySetIID "SafeArraySetIID" var, var

; winmdroot.Foundation.HRESULT SafeArraySetRecordInfo(winmdroot.System.Com.SAFEARRAY* psa, winmdroot.System.Ole.IRecordInfo* prinfo)
#cfunc SafeArraySetRecordInfo "SafeArraySetRecordInfo" var, var

; winmdroot.Foundation.HRESULT SafeArrayUnaccessData(winmdroot.System.Com.SAFEARRAY* psa)
#cfunc SafeArrayUnaccessData "SafeArrayUnaccessData" var

; winmdroot.Foundation.HRESULT SafeArrayUnlock(winmdroot.System.Com.SAFEARRAY* psa)
#cfunc SafeArrayUnlock "SafeArrayUnlock" var

; winmdroot.Foundation.HRESULT SetErrorInfo(uint dwReserved, [Optional] winmdroot.System.Com.IErrorInfo* perrinfo)
#cfunc SetErrorInfo "SetErrorInfo" int, var

; winmdroot.Foundation.HRESULT SysAddRefString(winmdroot.Foundation.BSTR bstrString)
#cfunc SysAddRefString "SysAddRefString" int

; winmdroot.Foundation.BSTR SysAllocString(winmdroot.Foundation.PCWSTR psz)
#cfunc SysAllocString "SysAllocString" wstr

; winmdroot.Foundation.BSTR SysAllocStringByteLen(winmdroot.Foundation.PCSTR psz, uint len)
#cfunc SysAllocStringByteLen "SysAllocStringByteLen" str, int

; winmdroot.Foundation.BSTR SysAllocStringLen(winmdroot.Foundation.PCWSTR strIn, uint ui)
#cfunc SysAllocStringLen "SysAllocStringLen" wstr, int

; int SysReAllocString(winmdroot.Foundation.BSTR* pbstr, winmdroot.Foundation.PCWSTR psz)
#cfunc SysReAllocString "SysReAllocString" var, wstr

; int SysReAllocStringLen(winmdroot.Foundation.BSTR* pbstr, winmdroot.Foundation.PCWSTR psz, uint len)
#cfunc SysReAllocStringLen "SysReAllocStringLen" var, wstr, int

; void SysReleaseString(winmdroot.Foundation.BSTR bstrString)
#func SysReleaseString "SysReleaseString" int

; uint SysStringByteLen(winmdroot.Foundation.BSTR bstr)
#cfunc SysStringByteLen "SysStringByteLen" int

; uint SysStringLen(winmdroot.Foundation.BSTR pbstr)
#cfunc SysStringLen "SysStringLen" int

; int SystemTimeToVariantTime(winmdroot.Foundation.SYSTEMTIME* lpSystemTime, double* pvtime)
#cfunc SystemTimeToVariantTime "SystemTimeToVariantTime" var, var

; winmdroot.Foundation.HRESULT UnRegisterTypeLib(global::System.Guid* libID, ushort wVerMajor, ushort wVerMinor, uint lcid, winmdroot.System.Com.SYSKIND syskind)
#cfunc UnRegisterTypeLib "UnRegisterTypeLib" var, int, int, int, int

; winmdroot.Foundation.HRESULT UnRegisterTypeLibForUser(global::System.Guid* libID, ushort wMajorVerNum, ushort wMinorVerNum, uint lcid, winmdroot.System.Com.SYSKIND syskind)
#cfunc UnRegisterTypeLibForUser "UnRegisterTypeLibForUser" var, int, int, int, int

; void VARIANT_UserFree(uint* param0, winmdroot.System.Variant.VARIANT* param1)
#func VARIANT_UserFree "VARIANT_UserFree" var, var

; void VARIANT_UserFree64(uint* param0, winmdroot.System.Variant.VARIANT* param1)
#func VARIANT_UserFree64 "VARIANT_UserFree64" var, var

; byte* VARIANT_UserMarshal(uint* param0, byte* param1, winmdroot.System.Variant.VARIANT* param2)
#cfunc VARIANT_UserMarshal "VARIANT_UserMarshal" var, var, var

; byte* VARIANT_UserMarshal64(uint* param0, byte* param1, winmdroot.System.Variant.VARIANT* param2)
#cfunc VARIANT_UserMarshal64 "VARIANT_UserMarshal64" var, var, var

; uint VARIANT_UserSize(uint* param0, uint param1, winmdroot.System.Variant.VARIANT* param2)
#cfunc VARIANT_UserSize "VARIANT_UserSize" var, int, var

; uint VARIANT_UserSize64(uint* param0, uint param1, winmdroot.System.Variant.VARIANT* param2)
#cfunc VARIANT_UserSize64 "VARIANT_UserSize64" var, int, var

; byte* VARIANT_UserUnmarshal(uint* param0, byte* param1, winmdroot.System.Variant.VARIANT* param2)
#cfunc VARIANT_UserUnmarshal "VARIANT_UserUnmarshal" var, var, var

; byte* VARIANT_UserUnmarshal64(uint* param0, byte* param1, winmdroot.System.Variant.VARIANT* param2)
#cfunc VARIANT_UserUnmarshal64 "VARIANT_UserUnmarshal64" var, var, var

; winmdroot.Foundation.HRESULT VarAbs(winmdroot.System.Variant.VARIANT* pvarIn, winmdroot.System.Variant.VARIANT* pvarResult)
#cfunc VarAbs "VarAbs" var, var

; winmdroot.Foundation.HRESULT VarAdd(winmdroot.System.Variant.VARIANT* pvarLeft, winmdroot.System.Variant.VARIANT* pvarRight, winmdroot.System.Variant.VARIANT* pvarResult)
#cfunc VarAdd "VarAdd" var, var, var

; winmdroot.Foundation.HRESULT VarAnd(winmdroot.System.Variant.VARIANT* pvarLeft, winmdroot.System.Variant.VARIANT* pvarRight, winmdroot.System.Variant.VARIANT* pvarResult)
#cfunc VarAnd "VarAnd" var, var, var

; winmdroot.Foundation.HRESULT VarBoolFromCy(winmdroot.System.Com.CY cyIn, winmdroot.Foundation.VARIANT_BOOL* pboolOut)
#cfunc VarBoolFromCy "VarBoolFromCy" var, var

; winmdroot.Foundation.HRESULT VarBoolFromDate(double dateIn, winmdroot.Foundation.VARIANT_BOOL* pboolOut)
#cfunc VarBoolFromDate "VarBoolFromDate" double, var

; winmdroot.Foundation.HRESULT VarBoolFromDec(winmdroot.Foundation.DECIMAL* pdecIn, winmdroot.Foundation.VARIANT_BOOL* pboolOut)
#cfunc VarBoolFromDec "VarBoolFromDec" var, var

; winmdroot.Foundation.HRESULT VarBoolFromDisp(winmdroot.System.Com.IDispatch* pdispIn, uint lcid, winmdroot.Foundation.VARIANT_BOOL* pboolOut)
#cfunc VarBoolFromDisp "VarBoolFromDisp" var, int, var

; winmdroot.Foundation.HRESULT VarBoolFromI1(winmdroot.Foundation.CHAR cIn, winmdroot.Foundation.VARIANT_BOOL* pboolOut)
#cfunc VarBoolFromI1 "VarBoolFromI1" int, var

; winmdroot.Foundation.HRESULT VarBoolFromI2(short sIn, winmdroot.Foundation.VARIANT_BOOL* pboolOut)
#cfunc VarBoolFromI2 "VarBoolFromI2" int, var

; winmdroot.Foundation.HRESULT VarBoolFromI4(int lIn, winmdroot.Foundation.VARIANT_BOOL* pboolOut)
#cfunc VarBoolFromI4 "VarBoolFromI4" int, var

; winmdroot.Foundation.HRESULT VarBoolFromI8(long i64In, winmdroot.Foundation.VARIANT_BOOL* pboolOut)
#cfunc VarBoolFromI8 "VarBoolFromI8" int64, var

; winmdroot.Foundation.HRESULT VarBoolFromR4(float fltIn, winmdroot.Foundation.VARIANT_BOOL* pboolOut)
#cfunc VarBoolFromR4 "VarBoolFromR4" float, var

; winmdroot.Foundation.HRESULT VarBoolFromR8(double dblIn, winmdroot.Foundation.VARIANT_BOOL* pboolOut)
#cfunc VarBoolFromR8 "VarBoolFromR8" double, var

; winmdroot.Foundation.HRESULT VarBoolFromStr(winmdroot.Foundation.PCWSTR strIn, uint lcid, uint dwFlags, winmdroot.Foundation.VARIANT_BOOL* pboolOut)
#cfunc VarBoolFromStr "VarBoolFromStr" wstr, int, int, var

; winmdroot.Foundation.HRESULT VarBoolFromUI1(byte bIn, winmdroot.Foundation.VARIANT_BOOL* pboolOut)
#cfunc VarBoolFromUI1 "VarBoolFromUI1" int, var

; winmdroot.Foundation.HRESULT VarBoolFromUI2(ushort uiIn, winmdroot.Foundation.VARIANT_BOOL* pboolOut)
#cfunc VarBoolFromUI2 "VarBoolFromUI2" int, var

; winmdroot.Foundation.HRESULT VarBoolFromUI4(uint ulIn, winmdroot.Foundation.VARIANT_BOOL* pboolOut)
#cfunc VarBoolFromUI4 "VarBoolFromUI4" int, var

; winmdroot.Foundation.HRESULT VarBoolFromUI8(ulong i64In, winmdroot.Foundation.VARIANT_BOOL* pboolOut)
#cfunc VarBoolFromUI8 "VarBoolFromUI8" int64, var

; winmdroot.Foundation.HRESULT VarBstrCat(winmdroot.Foundation.BSTR bstrLeft, winmdroot.Foundation.BSTR bstrRight, winmdroot.Foundation.BSTR* pbstrResult)
#cfunc VarBstrCat "VarBstrCat" int, int, var

; winmdroot.Foundation.HRESULT VarBstrCmp(winmdroot.Foundation.BSTR bstrLeft, winmdroot.Foundation.BSTR bstrRight, uint lcid, uint dwFlags)
#cfunc VarBstrCmp "VarBstrCmp" int, int, int, int

; winmdroot.Foundation.HRESULT VarBstrFromBool(winmdroot.Foundation.VARIANT_BOOL boolIn, uint lcid, uint dwFlags, winmdroot.Foundation.BSTR* pbstrOut)
#cfunc VarBstrFromBool "VarBstrFromBool" int, int, int, var

; winmdroot.Foundation.HRESULT VarBstrFromCy(winmdroot.System.Com.CY cyIn, uint lcid, uint dwFlags, winmdroot.Foundation.BSTR* pbstrOut)
#cfunc VarBstrFromCy "VarBstrFromCy" var, int, int, var

; winmdroot.Foundation.HRESULT VarBstrFromDate(double dateIn, uint lcid, uint dwFlags, winmdroot.Foundation.BSTR* pbstrOut)
#cfunc VarBstrFromDate "VarBstrFromDate" double, int, int, var

; winmdroot.Foundation.HRESULT VarBstrFromDec(winmdroot.Foundation.DECIMAL* pdecIn, uint lcid, uint dwFlags, winmdroot.Foundation.BSTR* pbstrOut)
#cfunc VarBstrFromDec "VarBstrFromDec" var, int, int, var

; winmdroot.Foundation.HRESULT VarBstrFromDisp(winmdroot.System.Com.IDispatch* pdispIn, uint lcid, uint dwFlags, winmdroot.Foundation.BSTR* pbstrOut)
#cfunc VarBstrFromDisp "VarBstrFromDisp" var, int, int, var

; winmdroot.Foundation.HRESULT VarBstrFromI1(winmdroot.Foundation.CHAR cIn, uint lcid, uint dwFlags, winmdroot.Foundation.BSTR* pbstrOut)
#cfunc VarBstrFromI1 "VarBstrFromI1" int, int, int, var

; winmdroot.Foundation.HRESULT VarBstrFromI2(short iVal, uint lcid, uint dwFlags, winmdroot.Foundation.BSTR* pbstrOut)
#cfunc VarBstrFromI2 "VarBstrFromI2" int, int, int, var

; winmdroot.Foundation.HRESULT VarBstrFromI4(int lIn, uint lcid, uint dwFlags, winmdroot.Foundation.BSTR* pbstrOut)
#cfunc VarBstrFromI4 "VarBstrFromI4" int, int, int, var

; winmdroot.Foundation.HRESULT VarBstrFromI8(long i64In, uint lcid, uint dwFlags, winmdroot.Foundation.BSTR* pbstrOut)
#cfunc VarBstrFromI8 "VarBstrFromI8" int64, int, int, var

; winmdroot.Foundation.HRESULT VarBstrFromR4(float fltIn, uint lcid, uint dwFlags, winmdroot.Foundation.BSTR* pbstrOut)
#cfunc VarBstrFromR4 "VarBstrFromR4" float, int, int, var

; winmdroot.Foundation.HRESULT VarBstrFromR8(double dblIn, uint lcid, uint dwFlags, winmdroot.Foundation.BSTR* pbstrOut)
#cfunc VarBstrFromR8 "VarBstrFromR8" double, int, int, var

; winmdroot.Foundation.HRESULT VarBstrFromUI1(byte bVal, uint lcid, uint dwFlags, winmdroot.Foundation.BSTR* pbstrOut)
#cfunc VarBstrFromUI1 "VarBstrFromUI1" int, int, int, var

; winmdroot.Foundation.HRESULT VarBstrFromUI2(ushort uiIn, uint lcid, uint dwFlags, winmdroot.Foundation.BSTR* pbstrOut)
#cfunc VarBstrFromUI2 "VarBstrFromUI2" int, int, int, var

; winmdroot.Foundation.HRESULT VarBstrFromUI4(uint ulIn, uint lcid, uint dwFlags, winmdroot.Foundation.BSTR* pbstrOut)
#cfunc VarBstrFromUI4 "VarBstrFromUI4" int, int, int, var

; winmdroot.Foundation.HRESULT VarBstrFromUI8(ulong ui64In, uint lcid, uint dwFlags, winmdroot.Foundation.BSTR* pbstrOut)
#cfunc VarBstrFromUI8 "VarBstrFromUI8" int64, int, int, var

; winmdroot.Foundation.HRESULT VarCat(winmdroot.System.Variant.VARIANT* pvarLeft, winmdroot.System.Variant.VARIANT* pvarRight, winmdroot.System.Variant.VARIANT* pvarResult)
#cfunc VarCat "VarCat" var, var, var

; winmdroot.System.Ole.VARCMP VarCmp(winmdroot.System.Variant.VARIANT* pvarLeft, winmdroot.System.Variant.VARIANT* pvarRight, uint lcid, uint dwFlags)
#cfunc VarCmp "VarCmp" var, var, int, int

; winmdroot.Foundation.HRESULT VarCyAbs(winmdroot.System.Com.CY cyIn, winmdroot.System.Com.CY* pcyResult)
#cfunc VarCyAbs "VarCyAbs" var, var

; winmdroot.Foundation.HRESULT VarCyAdd(winmdroot.System.Com.CY cyLeft, winmdroot.System.Com.CY cyRight, winmdroot.System.Com.CY* pcyResult)
#cfunc VarCyAdd "VarCyAdd" var, var, var

; winmdroot.System.Ole.VARCMP VarCyCmp(winmdroot.System.Com.CY cyLeft, winmdroot.System.Com.CY cyRight)
#cfunc VarCyCmp "VarCyCmp" var, var

; winmdroot.System.Ole.VARCMP VarCyCmpR8(winmdroot.System.Com.CY cyLeft, double dblRight)
#cfunc VarCyCmpR8 "VarCyCmpR8" var, double

; winmdroot.Foundation.HRESULT VarCyFix(winmdroot.System.Com.CY cyIn, winmdroot.System.Com.CY* pcyResult)
#cfunc VarCyFix "VarCyFix" var, var

; winmdroot.Foundation.HRESULT VarCyFromBool(winmdroot.Foundation.VARIANT_BOOL boolIn, winmdroot.System.Com.CY* pcyOut)
#cfunc VarCyFromBool "VarCyFromBool" int, var

; winmdroot.Foundation.HRESULT VarCyFromDate(double dateIn, winmdroot.System.Com.CY* pcyOut)
#cfunc VarCyFromDate "VarCyFromDate" double, var

; winmdroot.Foundation.HRESULT VarCyFromDec(winmdroot.Foundation.DECIMAL* pdecIn, winmdroot.System.Com.CY* pcyOut)
#cfunc VarCyFromDec "VarCyFromDec" var, var

; winmdroot.Foundation.HRESULT VarCyFromDisp(winmdroot.System.Com.IDispatch* pdispIn, uint lcid, winmdroot.System.Com.CY* pcyOut)
#cfunc VarCyFromDisp "VarCyFromDisp" var, int, var

; winmdroot.Foundation.HRESULT VarCyFromI1(winmdroot.Foundation.CHAR cIn, winmdroot.System.Com.CY* pcyOut)
#cfunc VarCyFromI1 "VarCyFromI1" int, var

; winmdroot.Foundation.HRESULT VarCyFromI2(short sIn, winmdroot.System.Com.CY* pcyOut)
#cfunc VarCyFromI2 "VarCyFromI2" int, var

; winmdroot.Foundation.HRESULT VarCyFromI4(int lIn, winmdroot.System.Com.CY* pcyOut)
#cfunc VarCyFromI4 "VarCyFromI4" int, var

; winmdroot.Foundation.HRESULT VarCyFromI8(long i64In, winmdroot.System.Com.CY* pcyOut)
#cfunc VarCyFromI8 "VarCyFromI8" int64, var

; winmdroot.Foundation.HRESULT VarCyFromR4(float fltIn, winmdroot.System.Com.CY* pcyOut)
#cfunc VarCyFromR4 "VarCyFromR4" float, var

; winmdroot.Foundation.HRESULT VarCyFromR8(double dblIn, winmdroot.System.Com.CY* pcyOut)
#cfunc VarCyFromR8 "VarCyFromR8" double, var

; winmdroot.Foundation.HRESULT VarCyFromStr(winmdroot.Foundation.PCWSTR strIn, uint lcid, uint dwFlags, winmdroot.System.Com.CY* pcyOut)
#cfunc VarCyFromStr "VarCyFromStr" wstr, int, int, var

; winmdroot.Foundation.HRESULT VarCyFromUI1(byte bIn, winmdroot.System.Com.CY* pcyOut)
#cfunc VarCyFromUI1 "VarCyFromUI1" int, var

; winmdroot.Foundation.HRESULT VarCyFromUI2(ushort uiIn, winmdroot.System.Com.CY* pcyOut)
#cfunc VarCyFromUI2 "VarCyFromUI2" int, var

; winmdroot.Foundation.HRESULT VarCyFromUI4(uint ulIn, winmdroot.System.Com.CY* pcyOut)
#cfunc VarCyFromUI4 "VarCyFromUI4" int, var

; winmdroot.Foundation.HRESULT VarCyFromUI8(ulong ui64In, winmdroot.System.Com.CY* pcyOut)
#cfunc VarCyFromUI8 "VarCyFromUI8" int64, var

; winmdroot.Foundation.HRESULT VarCyInt(winmdroot.System.Com.CY cyIn, winmdroot.System.Com.CY* pcyResult)
#cfunc VarCyInt "VarCyInt" var, var

; winmdroot.Foundation.HRESULT VarCyMul(winmdroot.System.Com.CY cyLeft, winmdroot.System.Com.CY cyRight, winmdroot.System.Com.CY* pcyResult)
#cfunc VarCyMul "VarCyMul" var, var, var

; winmdroot.Foundation.HRESULT VarCyMulI4(winmdroot.System.Com.CY cyLeft, int lRight, winmdroot.System.Com.CY* pcyResult)
#cfunc VarCyMulI4 "VarCyMulI4" var, int, var

; winmdroot.Foundation.HRESULT VarCyMulI8(winmdroot.System.Com.CY cyLeft, long lRight, winmdroot.System.Com.CY* pcyResult)
#cfunc VarCyMulI8 "VarCyMulI8" var, int64, var

; winmdroot.Foundation.HRESULT VarCyNeg(winmdroot.System.Com.CY cyIn, winmdroot.System.Com.CY* pcyResult)
#cfunc VarCyNeg "VarCyNeg" var, var

; winmdroot.Foundation.HRESULT VarCyRound(winmdroot.System.Com.CY cyIn, int cDecimals, winmdroot.System.Com.CY* pcyResult)
#cfunc VarCyRound "VarCyRound" var, int, var

; winmdroot.Foundation.HRESULT VarCySub(winmdroot.System.Com.CY cyLeft, winmdroot.System.Com.CY cyRight, winmdroot.System.Com.CY* pcyResult)
#cfunc VarCySub "VarCySub" var, var, var

; winmdroot.Foundation.HRESULT VarDateFromBool(winmdroot.Foundation.VARIANT_BOOL boolIn, double* pdateOut)
#cfunc VarDateFromBool "VarDateFromBool" int, var

; winmdroot.Foundation.HRESULT VarDateFromCy(winmdroot.System.Com.CY cyIn, double* pdateOut)
#cfunc VarDateFromCy "VarDateFromCy" var, var

; winmdroot.Foundation.HRESULT VarDateFromDec(winmdroot.Foundation.DECIMAL* pdecIn, double* pdateOut)
#cfunc VarDateFromDec "VarDateFromDec" var, var

; winmdroot.Foundation.HRESULT VarDateFromDisp(winmdroot.System.Com.IDispatch* pdispIn, uint lcid, double* pdateOut)
#cfunc VarDateFromDisp "VarDateFromDisp" var, int, var

; winmdroot.Foundation.HRESULT VarDateFromI1(winmdroot.Foundation.CHAR cIn, double* pdateOut)
#cfunc VarDateFromI1 "VarDateFromI1" int, var

; winmdroot.Foundation.HRESULT VarDateFromI2(short sIn, double* pdateOut)
#cfunc VarDateFromI2 "VarDateFromI2" int, var

; winmdroot.Foundation.HRESULT VarDateFromI4(int lIn, double* pdateOut)
#cfunc VarDateFromI4 "VarDateFromI4" int, var

; winmdroot.Foundation.HRESULT VarDateFromI8(long i64In, double* pdateOut)
#cfunc VarDateFromI8 "VarDateFromI8" int64, var

; winmdroot.Foundation.HRESULT VarDateFromR4(float fltIn, double* pdateOut)
#cfunc VarDateFromR4 "VarDateFromR4" float, var

; winmdroot.Foundation.HRESULT VarDateFromR8(double dblIn, double* pdateOut)
#cfunc VarDateFromR8 "VarDateFromR8" double, var

; winmdroot.Foundation.HRESULT VarDateFromStr(winmdroot.Foundation.PCWSTR strIn, uint lcid, uint dwFlags, double* pdateOut)
#cfunc VarDateFromStr "VarDateFromStr" wstr, int, int, var

; winmdroot.Foundation.HRESULT VarDateFromUI1(byte bIn, double* pdateOut)
#cfunc VarDateFromUI1 "VarDateFromUI1" int, var

; winmdroot.Foundation.HRESULT VarDateFromUI2(ushort uiIn, double* pdateOut)
#cfunc VarDateFromUI2 "VarDateFromUI2" int, var

; winmdroot.Foundation.HRESULT VarDateFromUI4(uint ulIn, double* pdateOut)
#cfunc VarDateFromUI4 "VarDateFromUI4" int, var

; winmdroot.Foundation.HRESULT VarDateFromUI8(ulong ui64In, double* pdateOut)
#cfunc VarDateFromUI8 "VarDateFromUI8" int64, var

; winmdroot.Foundation.HRESULT VarDateFromUdate(winmdroot.System.Ole.UDATE* pudateIn, uint dwFlags, double* pdateOut)
#cfunc VarDateFromUdate "VarDateFromUdate" var, int, var

; winmdroot.Foundation.HRESULT VarDateFromUdateEx(winmdroot.System.Ole.UDATE* pudateIn, uint lcid, uint dwFlags, double* pdateOut)
#cfunc VarDateFromUdateEx "VarDateFromUdateEx" var, int, int, var

; winmdroot.Foundation.HRESULT VarDecAbs(winmdroot.Foundation.DECIMAL* pdecIn, winmdroot.Foundation.DECIMAL* pdecResult)
#cfunc VarDecAbs "VarDecAbs" var, var

; winmdroot.Foundation.HRESULT VarDecAdd(winmdroot.Foundation.DECIMAL* pdecLeft, winmdroot.Foundation.DECIMAL* pdecRight, winmdroot.Foundation.DECIMAL* pdecResult)
#cfunc VarDecAdd "VarDecAdd" var, var, var

; winmdroot.System.Ole.VARCMP VarDecCmp(winmdroot.Foundation.DECIMAL* pdecLeft, winmdroot.Foundation.DECIMAL* pdecRight)
#cfunc VarDecCmp "VarDecCmp" var, var

; winmdroot.System.Ole.VARCMP VarDecCmpR8(winmdroot.Foundation.DECIMAL* pdecLeft, double dblRight)
#cfunc VarDecCmpR8 "VarDecCmpR8" var, double

; winmdroot.Foundation.HRESULT VarDecDiv(winmdroot.Foundation.DECIMAL* pdecLeft, winmdroot.Foundation.DECIMAL* pdecRight, winmdroot.Foundation.DECIMAL* pdecResult)
#cfunc VarDecDiv "VarDecDiv" var, var, var

; winmdroot.Foundation.HRESULT VarDecFix(winmdroot.Foundation.DECIMAL* pdecIn, winmdroot.Foundation.DECIMAL* pdecResult)
#cfunc VarDecFix "VarDecFix" var, var

; winmdroot.Foundation.HRESULT VarDecFromBool(winmdroot.Foundation.VARIANT_BOOL boolIn, winmdroot.Foundation.DECIMAL* pdecOut)
#cfunc VarDecFromBool "VarDecFromBool" int, var

; winmdroot.Foundation.HRESULT VarDecFromCy(winmdroot.System.Com.CY cyIn, winmdroot.Foundation.DECIMAL* pdecOut)
#cfunc VarDecFromCy "VarDecFromCy" var, var

; winmdroot.Foundation.HRESULT VarDecFromDate(double dateIn, winmdroot.Foundation.DECIMAL* pdecOut)
#cfunc VarDecFromDate "VarDecFromDate" double, var

; winmdroot.Foundation.HRESULT VarDecFromDisp(winmdroot.System.Com.IDispatch* pdispIn, uint lcid, winmdroot.Foundation.DECIMAL* pdecOut)
#cfunc VarDecFromDisp "VarDecFromDisp" var, int, var

; winmdroot.Foundation.HRESULT VarDecFromI1(winmdroot.Foundation.CHAR cIn, winmdroot.Foundation.DECIMAL* pdecOut)
#cfunc VarDecFromI1 "VarDecFromI1" int, var

; winmdroot.Foundation.HRESULT VarDecFromI2(short uiIn, winmdroot.Foundation.DECIMAL* pdecOut)
#cfunc VarDecFromI2 "VarDecFromI2" int, var

; winmdroot.Foundation.HRESULT VarDecFromI4(int lIn, winmdroot.Foundation.DECIMAL* pdecOut)
#cfunc VarDecFromI4 "VarDecFromI4" int, var

; winmdroot.Foundation.HRESULT VarDecFromI8(long i64In, winmdroot.Foundation.DECIMAL* pdecOut)
#cfunc VarDecFromI8 "VarDecFromI8" int64, var

; winmdroot.Foundation.HRESULT VarDecFromR4(float fltIn, winmdroot.Foundation.DECIMAL* pdecOut)
#cfunc VarDecFromR4 "VarDecFromR4" float, var

; winmdroot.Foundation.HRESULT VarDecFromR8(double dblIn, winmdroot.Foundation.DECIMAL* pdecOut)
#cfunc VarDecFromR8 "VarDecFromR8" double, var

; winmdroot.Foundation.HRESULT VarDecFromStr(winmdroot.Foundation.PCWSTR strIn, uint lcid, uint dwFlags, winmdroot.Foundation.DECIMAL* pdecOut)
#cfunc VarDecFromStr "VarDecFromStr" wstr, int, int, var

; winmdroot.Foundation.HRESULT VarDecFromUI1(byte bIn, winmdroot.Foundation.DECIMAL* pdecOut)
#cfunc VarDecFromUI1 "VarDecFromUI1" int, var

; winmdroot.Foundation.HRESULT VarDecFromUI2(ushort uiIn, winmdroot.Foundation.DECIMAL* pdecOut)
#cfunc VarDecFromUI2 "VarDecFromUI2" int, var

; winmdroot.Foundation.HRESULT VarDecFromUI4(uint ulIn, winmdroot.Foundation.DECIMAL* pdecOut)
#cfunc VarDecFromUI4 "VarDecFromUI4" int, var

; winmdroot.Foundation.HRESULT VarDecFromUI8(ulong ui64In, winmdroot.Foundation.DECIMAL* pdecOut)
#cfunc VarDecFromUI8 "VarDecFromUI8" int64, var

; winmdroot.Foundation.HRESULT VarDecInt(winmdroot.Foundation.DECIMAL* pdecIn, winmdroot.Foundation.DECIMAL* pdecResult)
#cfunc VarDecInt "VarDecInt" var, var

; winmdroot.Foundation.HRESULT VarDecMul(winmdroot.Foundation.DECIMAL* pdecLeft, winmdroot.Foundation.DECIMAL* pdecRight, winmdroot.Foundation.DECIMAL* pdecResult)
#cfunc VarDecMul "VarDecMul" var, var, var

; winmdroot.Foundation.HRESULT VarDecNeg(winmdroot.Foundation.DECIMAL* pdecIn, winmdroot.Foundation.DECIMAL* pdecResult)
#cfunc VarDecNeg "VarDecNeg" var, var

; winmdroot.Foundation.HRESULT VarDecRound(winmdroot.Foundation.DECIMAL* pdecIn, int cDecimals, winmdroot.Foundation.DECIMAL* pdecResult)
#cfunc VarDecRound "VarDecRound" var, int, var

; winmdroot.Foundation.HRESULT VarDecSub(winmdroot.Foundation.DECIMAL* pdecLeft, winmdroot.Foundation.DECIMAL* pdecRight, winmdroot.Foundation.DECIMAL* pdecResult)
#cfunc VarDecSub "VarDecSub" var, var, var

; winmdroot.Foundation.HRESULT VarDiv(winmdroot.System.Variant.VARIANT* pvarLeft, winmdroot.System.Variant.VARIANT* pvarRight, winmdroot.System.Variant.VARIANT* pvarResult)
#cfunc VarDiv "VarDiv" var, var, var

; winmdroot.Foundation.HRESULT VarEqv(winmdroot.System.Variant.VARIANT* pvarLeft, winmdroot.System.Variant.VARIANT* pvarRight, winmdroot.System.Variant.VARIANT* pvarResult)
#cfunc VarEqv "VarEqv" var, var, var

; winmdroot.Foundation.HRESULT VarFix(winmdroot.System.Variant.VARIANT* pvarIn, winmdroot.System.Variant.VARIANT* pvarResult)
#cfunc VarFix "VarFix" var, var

; winmdroot.Foundation.HRESULT VarFormat(winmdroot.System.Variant.VARIANT* pvarIn, winmdroot.Foundation.PWSTR pstrFormat, winmdroot.System.Ole.VARFORMAT_FIRST_DAY iFirstDay, winmdroot.System.Ole.VARFORMAT_FIRST_WEEK iFirstWeek, uint dwFlags, winmdroot.Foundation.BSTR* pbstrOut)
#cfunc VarFormat "VarFormat" var, wstr, int, int, int, var

; winmdroot.Foundation.HRESULT VarFormatCurrency(winmdroot.System.Variant.VARIANT* pvarIn, int iNumDig, int iIncLead, int iUseParens, int iGroup, uint dwFlags, winmdroot.Foundation.BSTR* pbstrOut)
#cfunc VarFormatCurrency "VarFormatCurrency" var, int, int, int, int, int, var

; winmdroot.Foundation.HRESULT VarFormatDateTime(winmdroot.System.Variant.VARIANT* pvarIn, winmdroot.System.Ole.VARFORMAT_NAMED_FORMAT iNamedFormat, uint dwFlags, winmdroot.Foundation.BSTR* pbstrOut)
#cfunc VarFormatDateTime "VarFormatDateTime" var, int, int, var

; winmdroot.Foundation.HRESULT VarFormatFromTokens(winmdroot.System.Variant.VARIANT* pvarIn, winmdroot.Foundation.PWSTR pstrFormat, byte* pbTokCur, uint dwFlags, winmdroot.Foundation.BSTR* pbstrOut, uint lcid)
#cfunc VarFormatFromTokens "VarFormatFromTokens" var, wstr, var, int, var, int

; winmdroot.Foundation.HRESULT VarFormatNumber(winmdroot.System.Variant.VARIANT* pvarIn, int iNumDig, winmdroot.System.Ole.VARFORMAT_LEADING_DIGIT iIncLead, winmdroot.System.Ole.VARFORMAT_PARENTHESES iUseParens, winmdroot.System.Ole.VARFORMAT_GROUP iGroup, uint dwFlags, winmdroot.Foundation.BSTR* pbstrOut)
#cfunc VarFormatNumber "VarFormatNumber" var, int, int, int, int, int, var

; winmdroot.Foundation.HRESULT VarFormatPercent(winmdroot.System.Variant.VARIANT* pvarIn, int iNumDig, winmdroot.System.Ole.VARFORMAT_LEADING_DIGIT iIncLead, winmdroot.System.Ole.VARFORMAT_PARENTHESES iUseParens, winmdroot.System.Ole.VARFORMAT_GROUP iGroup, uint dwFlags, winmdroot.Foundation.BSTR* pbstrOut)
#cfunc VarFormatPercent "VarFormatPercent" var, int, int, int, int, int, var

; winmdroot.Foundation.HRESULT VarI1FromBool(winmdroot.Foundation.VARIANT_BOOL boolIn, winmdroot.Foundation.PSTR pcOut)
#cfunc VarI1FromBool "VarI1FromBool" int, str

; winmdroot.Foundation.HRESULT VarI1FromCy(winmdroot.System.Com.CY cyIn, winmdroot.Foundation.PSTR pcOut)
#cfunc VarI1FromCy "VarI1FromCy" var, str

; winmdroot.Foundation.HRESULT VarI1FromDate(double dateIn, winmdroot.Foundation.PSTR pcOut)
#cfunc VarI1FromDate "VarI1FromDate" double, str

; winmdroot.Foundation.HRESULT VarI1FromDec(winmdroot.Foundation.DECIMAL* pdecIn, winmdroot.Foundation.PSTR pcOut)
#cfunc VarI1FromDec "VarI1FromDec" var, str

; winmdroot.Foundation.HRESULT VarI1FromDisp(winmdroot.System.Com.IDispatch* pdispIn, uint lcid, winmdroot.Foundation.PSTR pcOut)
#cfunc VarI1FromDisp "VarI1FromDisp" var, int, str

; winmdroot.Foundation.HRESULT VarI1FromI2(short uiIn, winmdroot.Foundation.PSTR pcOut)
#cfunc VarI1FromI2 "VarI1FromI2" int, str

; winmdroot.Foundation.HRESULT VarI1FromI4(int lIn, winmdroot.Foundation.PSTR pcOut)
#cfunc VarI1FromI4 "VarI1FromI4" int, str

; winmdroot.Foundation.HRESULT VarI1FromI8(long i64In, winmdroot.Foundation.PSTR pcOut)
#cfunc VarI1FromI8 "VarI1FromI8" int64, str

; winmdroot.Foundation.HRESULT VarI1FromR4(float fltIn, winmdroot.Foundation.PSTR pcOut)
#cfunc VarI1FromR4 "VarI1FromR4" float, str

; winmdroot.Foundation.HRESULT VarI1FromR8(double dblIn, winmdroot.Foundation.PSTR pcOut)
#cfunc VarI1FromR8 "VarI1FromR8" double, str

; winmdroot.Foundation.HRESULT VarI1FromStr(winmdroot.Foundation.PCWSTR strIn, uint lcid, uint dwFlags, winmdroot.Foundation.PSTR pcOut)
#cfunc VarI1FromStr "VarI1FromStr" wstr, int, int, str

; winmdroot.Foundation.HRESULT VarI1FromUI1(byte bIn, winmdroot.Foundation.PSTR pcOut)
#cfunc VarI1FromUI1 "VarI1FromUI1" int, str

; winmdroot.Foundation.HRESULT VarI1FromUI2(ushort uiIn, winmdroot.Foundation.PSTR pcOut)
#cfunc VarI1FromUI2 "VarI1FromUI2" int, str

; winmdroot.Foundation.HRESULT VarI1FromUI4(uint ulIn, winmdroot.Foundation.PSTR pcOut)
#cfunc VarI1FromUI4 "VarI1FromUI4" int, str

; winmdroot.Foundation.HRESULT VarI1FromUI8(ulong i64In, winmdroot.Foundation.PSTR pcOut)
#cfunc VarI1FromUI8 "VarI1FromUI8" int64, str

; winmdroot.Foundation.HRESULT VarI2FromBool(winmdroot.Foundation.VARIANT_BOOL boolIn, short* psOut)
#cfunc VarI2FromBool "VarI2FromBool" int, var

; winmdroot.Foundation.HRESULT VarI2FromCy(winmdroot.System.Com.CY cyIn, short* psOut)
#cfunc VarI2FromCy "VarI2FromCy" var, var

; winmdroot.Foundation.HRESULT VarI2FromDate(double dateIn, short* psOut)
#cfunc VarI2FromDate "VarI2FromDate" double, var

; winmdroot.Foundation.HRESULT VarI2FromDec(winmdroot.Foundation.DECIMAL* pdecIn, short* psOut)
#cfunc VarI2FromDec "VarI2FromDec" var, var

; winmdroot.Foundation.HRESULT VarI2FromDisp(winmdroot.System.Com.IDispatch* pdispIn, uint lcid, short* psOut)
#cfunc VarI2FromDisp "VarI2FromDisp" var, int, var

; winmdroot.Foundation.HRESULT VarI2FromI1(winmdroot.Foundation.CHAR cIn, short* psOut)
#cfunc VarI2FromI1 "VarI2FromI1" int, var

; winmdroot.Foundation.HRESULT VarI2FromI4(int lIn, short* psOut)
#cfunc VarI2FromI4 "VarI2FromI4" int, var

; winmdroot.Foundation.HRESULT VarI2FromI8(long i64In, short* psOut)
#cfunc VarI2FromI8 "VarI2FromI8" int64, var

; winmdroot.Foundation.HRESULT VarI2FromR4(float fltIn, short* psOut)
#cfunc VarI2FromR4 "VarI2FromR4" float, var

; winmdroot.Foundation.HRESULT VarI2FromR8(double dblIn, short* psOut)
#cfunc VarI2FromR8 "VarI2FromR8" double, var

; winmdroot.Foundation.HRESULT VarI2FromStr(winmdroot.Foundation.PCWSTR strIn, uint lcid, uint dwFlags, short* psOut)
#cfunc VarI2FromStr "VarI2FromStr" wstr, int, int, var

; winmdroot.Foundation.HRESULT VarI2FromUI1(byte bIn, short* psOut)
#cfunc VarI2FromUI1 "VarI2FromUI1" int, var

; winmdroot.Foundation.HRESULT VarI2FromUI2(ushort uiIn, short* psOut)
#cfunc VarI2FromUI2 "VarI2FromUI2" int, var

; winmdroot.Foundation.HRESULT VarI2FromUI4(uint ulIn, short* psOut)
#cfunc VarI2FromUI4 "VarI2FromUI4" int, var

; winmdroot.Foundation.HRESULT VarI2FromUI8(ulong ui64In, short* psOut)
#cfunc VarI2FromUI8 "VarI2FromUI8" int64, var

; winmdroot.Foundation.HRESULT VarI4FromBool(winmdroot.Foundation.VARIANT_BOOL boolIn, int* plOut)
#cfunc VarI4FromBool "VarI4FromBool" int, var

; winmdroot.Foundation.HRESULT VarI4FromCy(winmdroot.System.Com.CY cyIn, int* plOut)
#cfunc VarI4FromCy "VarI4FromCy" var, var

; winmdroot.Foundation.HRESULT VarI4FromDate(double dateIn, int* plOut)
#cfunc VarI4FromDate "VarI4FromDate" double, var

; winmdroot.Foundation.HRESULT VarI4FromDec(winmdroot.Foundation.DECIMAL* pdecIn, int* plOut)
#cfunc VarI4FromDec "VarI4FromDec" var, var

; winmdroot.Foundation.HRESULT VarI4FromDisp(winmdroot.System.Com.IDispatch* pdispIn, uint lcid, int* plOut)
#cfunc VarI4FromDisp "VarI4FromDisp" var, int, var

; winmdroot.Foundation.HRESULT VarI4FromI1(winmdroot.Foundation.CHAR cIn, int* plOut)
#cfunc VarI4FromI1 "VarI4FromI1" int, var

; winmdroot.Foundation.HRESULT VarI4FromI2(short sIn, int* plOut)
#cfunc VarI4FromI2 "VarI4FromI2" int, var

; winmdroot.Foundation.HRESULT VarI4FromI8(long i64In, int* plOut)
#cfunc VarI4FromI8 "VarI4FromI8" int64, var

; winmdroot.Foundation.HRESULT VarI4FromR4(float fltIn, int* plOut)
#cfunc VarI4FromR4 "VarI4FromR4" float, var

; winmdroot.Foundation.HRESULT VarI4FromR8(double dblIn, int* plOut)
#cfunc VarI4FromR8 "VarI4FromR8" double, var

; winmdroot.Foundation.HRESULT VarI4FromStr(winmdroot.Foundation.PCWSTR strIn, uint lcid, uint dwFlags, int* plOut)
#cfunc VarI4FromStr "VarI4FromStr" wstr, int, int, var

; winmdroot.Foundation.HRESULT VarI4FromUI1(byte bIn, int* plOut)
#cfunc VarI4FromUI1 "VarI4FromUI1" int, var

; winmdroot.Foundation.HRESULT VarI4FromUI2(ushort uiIn, int* plOut)
#cfunc VarI4FromUI2 "VarI4FromUI2" int, var

; winmdroot.Foundation.HRESULT VarI4FromUI4(uint ulIn, int* plOut)
#cfunc VarI4FromUI4 "VarI4FromUI4" int, var

; winmdroot.Foundation.HRESULT VarI4FromUI8(ulong ui64In, int* plOut)
#cfunc VarI4FromUI8 "VarI4FromUI8" int64, var

; winmdroot.Foundation.HRESULT VarI8FromBool(winmdroot.Foundation.VARIANT_BOOL boolIn, long* pi64Out)
#cfunc VarI8FromBool "VarI8FromBool" int, var

; winmdroot.Foundation.HRESULT VarI8FromCy(winmdroot.System.Com.CY cyIn, long* pi64Out)
#cfunc VarI8FromCy "VarI8FromCy" var, var

; winmdroot.Foundation.HRESULT VarI8FromDate(double dateIn, long* pi64Out)
#cfunc VarI8FromDate "VarI8FromDate" double, var

; winmdroot.Foundation.HRESULT VarI8FromDec(winmdroot.Foundation.DECIMAL* pdecIn, long* pi64Out)
#cfunc VarI8FromDec "VarI8FromDec" var, var

; winmdroot.Foundation.HRESULT VarI8FromDisp(winmdroot.System.Com.IDispatch* pdispIn, uint lcid, long* pi64Out)
#cfunc VarI8FromDisp "VarI8FromDisp" var, int, var

; winmdroot.Foundation.HRESULT VarI8FromI1(winmdroot.Foundation.CHAR cIn, long* pi64Out)
#cfunc VarI8FromI1 "VarI8FromI1" int, var

; winmdroot.Foundation.HRESULT VarI8FromI2(short sIn, long* pi64Out)
#cfunc VarI8FromI2 "VarI8FromI2" int, var

; winmdroot.Foundation.HRESULT VarI8FromR4(float fltIn, long* pi64Out)
#cfunc VarI8FromR4 "VarI8FromR4" float, var

; winmdroot.Foundation.HRESULT VarI8FromR8(double dblIn, long* pi64Out)
#cfunc VarI8FromR8 "VarI8FromR8" double, var

; winmdroot.Foundation.HRESULT VarI8FromStr(winmdroot.Foundation.PCWSTR strIn, uint lcid, uint dwFlags, long* pi64Out)
#cfunc VarI8FromStr "VarI8FromStr" wstr, int, int, var

; winmdroot.Foundation.HRESULT VarI8FromUI1(byte bIn, long* pi64Out)
#cfunc VarI8FromUI1 "VarI8FromUI1" int, var

; winmdroot.Foundation.HRESULT VarI8FromUI2(ushort uiIn, long* pi64Out)
#cfunc VarI8FromUI2 "VarI8FromUI2" int, var

; winmdroot.Foundation.HRESULT VarI8FromUI4(uint ulIn, long* pi64Out)
#cfunc VarI8FromUI4 "VarI8FromUI4" int, var

; winmdroot.Foundation.HRESULT VarI8FromUI8(ulong ui64In, long* pi64Out)
#cfunc VarI8FromUI8 "VarI8FromUI8" int64, var

; winmdroot.Foundation.HRESULT VarIdiv(winmdroot.System.Variant.VARIANT* pvarLeft, winmdroot.System.Variant.VARIANT* pvarRight, winmdroot.System.Variant.VARIANT* pvarResult)
#cfunc VarIdiv "VarIdiv" var, var, var

; winmdroot.Foundation.HRESULT VarImp(winmdroot.System.Variant.VARIANT* pvarLeft, winmdroot.System.Variant.VARIANT* pvarRight, winmdroot.System.Variant.VARIANT* pvarResult)
#cfunc VarImp "VarImp" var, var, var

; winmdroot.Foundation.HRESULT VarInt(winmdroot.System.Variant.VARIANT* pvarIn, winmdroot.System.Variant.VARIANT* pvarResult)
#cfunc VarInt "VarInt" var, var

; winmdroot.Foundation.HRESULT VarMod(winmdroot.System.Variant.VARIANT* pvarLeft, winmdroot.System.Variant.VARIANT* pvarRight, winmdroot.System.Variant.VARIANT* pvarResult)
#cfunc VarMod "VarMod" var, var, var

; winmdroot.Foundation.HRESULT VarMonthName(int iMonth, int fAbbrev, uint dwFlags, winmdroot.Foundation.BSTR* pbstrOut)
#cfunc VarMonthName "VarMonthName" int, int, int, var

; winmdroot.Foundation.HRESULT VarMul(winmdroot.System.Variant.VARIANT* pvarLeft, winmdroot.System.Variant.VARIANT* pvarRight, winmdroot.System.Variant.VARIANT* pvarResult)
#cfunc VarMul "VarMul" var, var, var

; winmdroot.Foundation.HRESULT VarNeg(winmdroot.System.Variant.VARIANT* pvarIn, winmdroot.System.Variant.VARIANT* pvarResult)
#cfunc VarNeg "VarNeg" var, var

; winmdroot.Foundation.HRESULT VarNot(winmdroot.System.Variant.VARIANT* pvarIn, winmdroot.System.Variant.VARIANT* pvarResult)
#cfunc VarNot "VarNot" var, var

; winmdroot.Foundation.HRESULT VarNumFromParseNum(winmdroot.System.Ole.NUMPARSE* pnumprs, byte* rgbDig, uint dwVtBits, winmdroot.System.Variant.VARIANT* pvar)
#cfunc VarNumFromParseNum "VarNumFromParseNum" var, var, int, var

; winmdroot.Foundation.HRESULT VarOr(winmdroot.System.Variant.VARIANT* pvarLeft, winmdroot.System.Variant.VARIANT* pvarRight, winmdroot.System.Variant.VARIANT* pvarResult)
#cfunc VarOr "VarOr" var, var, var

; winmdroot.Foundation.HRESULT VarParseNumFromStr(winmdroot.Foundation.PCWSTR strIn, uint lcid, uint dwFlags, winmdroot.System.Ole.NUMPARSE* pnumprs, byte* rgbDig)
#cfunc VarParseNumFromStr "VarParseNumFromStr" wstr, int, int, var, var

; winmdroot.Foundation.HRESULT VarPow(winmdroot.System.Variant.VARIANT* pvarLeft, winmdroot.System.Variant.VARIANT* pvarRight, winmdroot.System.Variant.VARIANT* pvarResult)
#cfunc VarPow "VarPow" var, var, var

; winmdroot.System.Ole.VARCMP VarR4CmpR8(float fltLeft, double dblRight)
#cfunc VarR4CmpR8 "VarR4CmpR8" float, double

; winmdroot.Foundation.HRESULT VarR4FromBool(winmdroot.Foundation.VARIANT_BOOL boolIn, float* pfltOut)
#cfunc VarR4FromBool "VarR4FromBool" int, var

; winmdroot.Foundation.HRESULT VarR4FromCy(winmdroot.System.Com.CY cyIn, float* pfltOut)
#cfunc VarR4FromCy "VarR4FromCy" var, var

; winmdroot.Foundation.HRESULT VarR4FromDate(double dateIn, float* pfltOut)
#cfunc VarR4FromDate "VarR4FromDate" double, var

; winmdroot.Foundation.HRESULT VarR4FromDec(winmdroot.Foundation.DECIMAL* pdecIn, float* pfltOut)
#cfunc VarR4FromDec "VarR4FromDec" var, var

; winmdroot.Foundation.HRESULT VarR4FromDisp(winmdroot.System.Com.IDispatch* pdispIn, uint lcid, float* pfltOut)
#cfunc VarR4FromDisp "VarR4FromDisp" var, int, var

; winmdroot.Foundation.HRESULT VarR4FromI1(winmdroot.Foundation.CHAR cIn, float* pfltOut)
#cfunc VarR4FromI1 "VarR4FromI1" int, var

; winmdroot.Foundation.HRESULT VarR4FromI2(short sIn, float* pfltOut)
#cfunc VarR4FromI2 "VarR4FromI2" int, var

; winmdroot.Foundation.HRESULT VarR4FromI4(int lIn, float* pfltOut)
#cfunc VarR4FromI4 "VarR4FromI4" int, var

; winmdroot.Foundation.HRESULT VarR4FromI8(long i64In, float* pfltOut)
#cfunc VarR4FromI8 "VarR4FromI8" int64, var

; winmdroot.Foundation.HRESULT VarR4FromR8(double dblIn, float* pfltOut)
#cfunc VarR4FromR8 "VarR4FromR8" double, var

; winmdroot.Foundation.HRESULT VarR4FromStr(winmdroot.Foundation.PCWSTR strIn, uint lcid, uint dwFlags, float* pfltOut)
#cfunc VarR4FromStr "VarR4FromStr" wstr, int, int, var

; winmdroot.Foundation.HRESULT VarR4FromUI1(byte bIn, float* pfltOut)
#cfunc VarR4FromUI1 "VarR4FromUI1" int, var

; winmdroot.Foundation.HRESULT VarR4FromUI2(ushort uiIn, float* pfltOut)
#cfunc VarR4FromUI2 "VarR4FromUI2" int, var

; winmdroot.Foundation.HRESULT VarR4FromUI4(uint ulIn, float* pfltOut)
#cfunc VarR4FromUI4 "VarR4FromUI4" int, var

; winmdroot.Foundation.HRESULT VarR4FromUI8(ulong ui64In, float* pfltOut)
#cfunc VarR4FromUI8 "VarR4FromUI8" int64, var

; winmdroot.Foundation.HRESULT VarR8FromBool(winmdroot.Foundation.VARIANT_BOOL boolIn, double* pdblOut)
#cfunc VarR8FromBool "VarR8FromBool" int, var

; winmdroot.Foundation.HRESULT VarR8FromCy(winmdroot.System.Com.CY cyIn, double* pdblOut)
#cfunc VarR8FromCy "VarR8FromCy" var, var

; winmdroot.Foundation.HRESULT VarR8FromDate(double dateIn, double* pdblOut)
#cfunc VarR8FromDate "VarR8FromDate" double, var

; winmdroot.Foundation.HRESULT VarR8FromDec(winmdroot.Foundation.DECIMAL* pdecIn, double* pdblOut)
#cfunc VarR8FromDec "VarR8FromDec" var, var

; winmdroot.Foundation.HRESULT VarR8FromDisp(winmdroot.System.Com.IDispatch* pdispIn, uint lcid, double* pdblOut)
#cfunc VarR8FromDisp "VarR8FromDisp" var, int, var

; winmdroot.Foundation.HRESULT VarR8FromI1(winmdroot.Foundation.CHAR cIn, double* pdblOut)
#cfunc VarR8FromI1 "VarR8FromI1" int, var

; winmdroot.Foundation.HRESULT VarR8FromI2(short sIn, double* pdblOut)
#cfunc VarR8FromI2 "VarR8FromI2" int, var

; winmdroot.Foundation.HRESULT VarR8FromI4(int lIn, double* pdblOut)
#cfunc VarR8FromI4 "VarR8FromI4" int, var

; winmdroot.Foundation.HRESULT VarR8FromI8(long i64In, double* pdblOut)
#cfunc VarR8FromI8 "VarR8FromI8" int64, var

; winmdroot.Foundation.HRESULT VarR8FromR4(float fltIn, double* pdblOut)
#cfunc VarR8FromR4 "VarR8FromR4" float, var

; winmdroot.Foundation.HRESULT VarR8FromStr(winmdroot.Foundation.PCWSTR strIn, uint lcid, uint dwFlags, double* pdblOut)
#cfunc VarR8FromStr "VarR8FromStr" wstr, int, int, var

; winmdroot.Foundation.HRESULT VarR8FromUI1(byte bIn, double* pdblOut)
#cfunc VarR8FromUI1 "VarR8FromUI1" int, var

; winmdroot.Foundation.HRESULT VarR8FromUI2(ushort uiIn, double* pdblOut)
#cfunc VarR8FromUI2 "VarR8FromUI2" int, var

; winmdroot.Foundation.HRESULT VarR8FromUI4(uint ulIn, double* pdblOut)
#cfunc VarR8FromUI4 "VarR8FromUI4" int, var

; winmdroot.Foundation.HRESULT VarR8FromUI8(ulong ui64In, double* pdblOut)
#cfunc VarR8FromUI8 "VarR8FromUI8" int64, var

; winmdroot.Foundation.HRESULT VarR8Pow(double dblLeft, double dblRight, double* pdblResult)
#cfunc VarR8Pow "VarR8Pow" double, double, var

; winmdroot.Foundation.HRESULT VarR8Round(double dblIn, int cDecimals, double* pdblResult)
#cfunc VarR8Round "VarR8Round" double, int, var

; winmdroot.Foundation.HRESULT VarRound(winmdroot.System.Variant.VARIANT* pvarIn, int cDecimals, winmdroot.System.Variant.VARIANT* pvarResult)
#cfunc VarRound "VarRound" var, int, var

; winmdroot.Foundation.HRESULT VarSub(winmdroot.System.Variant.VARIANT* pvarLeft, winmdroot.System.Variant.VARIANT* pvarRight, winmdroot.System.Variant.VARIANT* pvarResult)
#cfunc VarSub "VarSub" var, var, var

; winmdroot.Foundation.HRESULT VarTokenizeFormatString(winmdroot.Foundation.PWSTR pstrFormat, byte* rgbTok, int cbTok, winmdroot.System.Ole.VARFORMAT_FIRST_DAY iFirstDay, winmdroot.System.Ole.VARFORMAT_FIRST_WEEK iFirstWeek, uint lcid, [Optional] int* pcbActual)
#cfunc VarTokenizeFormatString "VarTokenizeFormatString" wstr, var, int, int, int, int, var

; winmdroot.Foundation.HRESULT VarUI1FromBool(winmdroot.Foundation.VARIANT_BOOL boolIn, byte* pbOut)
#cfunc VarUI1FromBool "VarUI1FromBool" int, var

; winmdroot.Foundation.HRESULT VarUI1FromCy(winmdroot.System.Com.CY cyIn, byte* pbOut)
#cfunc VarUI1FromCy "VarUI1FromCy" var, var

; winmdroot.Foundation.HRESULT VarUI1FromDate(double dateIn, byte* pbOut)
#cfunc VarUI1FromDate "VarUI1FromDate" double, var

; winmdroot.Foundation.HRESULT VarUI1FromDec(winmdroot.Foundation.DECIMAL* pdecIn, byte* pbOut)
#cfunc VarUI1FromDec "VarUI1FromDec" var, var

; winmdroot.Foundation.HRESULT VarUI1FromDisp(winmdroot.System.Com.IDispatch* pdispIn, uint lcid, byte* pbOut)
#cfunc VarUI1FromDisp "VarUI1FromDisp" var, int, var

; winmdroot.Foundation.HRESULT VarUI1FromI1(winmdroot.Foundation.CHAR cIn, byte* pbOut)
#cfunc VarUI1FromI1 "VarUI1FromI1" int, var

; winmdroot.Foundation.HRESULT VarUI1FromI2(short sIn, byte* pbOut)
#cfunc VarUI1FromI2 "VarUI1FromI2" int, var

; winmdroot.Foundation.HRESULT VarUI1FromI4(int lIn, byte* pbOut)
#cfunc VarUI1FromI4 "VarUI1FromI4" int, var

; winmdroot.Foundation.HRESULT VarUI1FromI8(long i64In, byte* pbOut)
#cfunc VarUI1FromI8 "VarUI1FromI8" int64, var

; winmdroot.Foundation.HRESULT VarUI1FromR4(float fltIn, byte* pbOut)
#cfunc VarUI1FromR4 "VarUI1FromR4" float, var

; winmdroot.Foundation.HRESULT VarUI1FromR8(double dblIn, byte* pbOut)
#cfunc VarUI1FromR8 "VarUI1FromR8" double, var

; winmdroot.Foundation.HRESULT VarUI1FromStr(winmdroot.Foundation.PCWSTR strIn, uint lcid, uint dwFlags, byte* pbOut)
#cfunc VarUI1FromStr "VarUI1FromStr" wstr, int, int, var

; winmdroot.Foundation.HRESULT VarUI1FromUI2(ushort uiIn, byte* pbOut)
#cfunc VarUI1FromUI2 "VarUI1FromUI2" int, var

; winmdroot.Foundation.HRESULT VarUI1FromUI4(uint ulIn, byte* pbOut)
#cfunc VarUI1FromUI4 "VarUI1FromUI4" int, var

; winmdroot.Foundation.HRESULT VarUI1FromUI8(ulong ui64In, byte* pbOut)
#cfunc VarUI1FromUI8 "VarUI1FromUI8" int64, var

; winmdroot.Foundation.HRESULT VarUI2FromBool(winmdroot.Foundation.VARIANT_BOOL boolIn, ushort* puiOut)
#cfunc VarUI2FromBool "VarUI2FromBool" int, var

; winmdroot.Foundation.HRESULT VarUI2FromCy(winmdroot.System.Com.CY cyIn, ushort* puiOut)
#cfunc VarUI2FromCy "VarUI2FromCy" var, var

; winmdroot.Foundation.HRESULT VarUI2FromDate(double dateIn, ushort* puiOut)
#cfunc VarUI2FromDate "VarUI2FromDate" double, var

; winmdroot.Foundation.HRESULT VarUI2FromDec(winmdroot.Foundation.DECIMAL* pdecIn, ushort* puiOut)
#cfunc VarUI2FromDec "VarUI2FromDec" var, var

; winmdroot.Foundation.HRESULT VarUI2FromDisp(winmdroot.System.Com.IDispatch* pdispIn, uint lcid, ushort* puiOut)
#cfunc VarUI2FromDisp "VarUI2FromDisp" var, int, var

; winmdroot.Foundation.HRESULT VarUI2FromI1(winmdroot.Foundation.CHAR cIn, ushort* puiOut)
#cfunc VarUI2FromI1 "VarUI2FromI1" int, var

; winmdroot.Foundation.HRESULT VarUI2FromI2(short uiIn, ushort* puiOut)
#cfunc VarUI2FromI2 "VarUI2FromI2" int, var

; winmdroot.Foundation.HRESULT VarUI2FromI4(int lIn, ushort* puiOut)
#cfunc VarUI2FromI4 "VarUI2FromI4" int, var

; winmdroot.Foundation.HRESULT VarUI2FromI8(long i64In, ushort* puiOut)
#cfunc VarUI2FromI8 "VarUI2FromI8" int64, var

; winmdroot.Foundation.HRESULT VarUI2FromR4(float fltIn, ushort* puiOut)
#cfunc VarUI2FromR4 "VarUI2FromR4" float, var

; winmdroot.Foundation.HRESULT VarUI2FromR8(double dblIn, ushort* puiOut)
#cfunc VarUI2FromR8 "VarUI2FromR8" double, var

; winmdroot.Foundation.HRESULT VarUI2FromStr(winmdroot.Foundation.PCWSTR strIn, uint lcid, uint dwFlags, ushort* puiOut)
#cfunc VarUI2FromStr "VarUI2FromStr" wstr, int, int, var

; winmdroot.Foundation.HRESULT VarUI2FromUI1(byte bIn, ushort* puiOut)
#cfunc VarUI2FromUI1 "VarUI2FromUI1" int, var

; winmdroot.Foundation.HRESULT VarUI2FromUI4(uint ulIn, ushort* puiOut)
#cfunc VarUI2FromUI4 "VarUI2FromUI4" int, var

; winmdroot.Foundation.HRESULT VarUI2FromUI8(ulong i64In, ushort* puiOut)
#cfunc VarUI2FromUI8 "VarUI2FromUI8" int64, var

; winmdroot.Foundation.HRESULT VarUI4FromBool(winmdroot.Foundation.VARIANT_BOOL boolIn, uint* pulOut)
#cfunc VarUI4FromBool "VarUI4FromBool" int, var

; winmdroot.Foundation.HRESULT VarUI4FromCy(winmdroot.System.Com.CY cyIn, uint* pulOut)
#cfunc VarUI4FromCy "VarUI4FromCy" var, var

; winmdroot.Foundation.HRESULT VarUI4FromDate(double dateIn, uint* pulOut)
#cfunc VarUI4FromDate "VarUI4FromDate" double, var

; winmdroot.Foundation.HRESULT VarUI4FromDec(winmdroot.Foundation.DECIMAL* pdecIn, uint* pulOut)
#cfunc VarUI4FromDec "VarUI4FromDec" var, var

; winmdroot.Foundation.HRESULT VarUI4FromDisp(winmdroot.System.Com.IDispatch* pdispIn, uint lcid, uint* pulOut)
#cfunc VarUI4FromDisp "VarUI4FromDisp" var, int, var

; winmdroot.Foundation.HRESULT VarUI4FromI1(winmdroot.Foundation.CHAR cIn, uint* pulOut)
#cfunc VarUI4FromI1 "VarUI4FromI1" int, var

; winmdroot.Foundation.HRESULT VarUI4FromI2(short uiIn, uint* pulOut)
#cfunc VarUI4FromI2 "VarUI4FromI2" int, var

; winmdroot.Foundation.HRESULT VarUI4FromI4(int lIn, uint* pulOut)
#cfunc VarUI4FromI4 "VarUI4FromI4" int, var

; winmdroot.Foundation.HRESULT VarUI4FromI8(long i64In, uint* plOut)
#cfunc VarUI4FromI8 "VarUI4FromI8" int64, var

; winmdroot.Foundation.HRESULT VarUI4FromR4(float fltIn, uint* pulOut)
#cfunc VarUI4FromR4 "VarUI4FromR4" float, var

; winmdroot.Foundation.HRESULT VarUI4FromR8(double dblIn, uint* pulOut)
#cfunc VarUI4FromR8 "VarUI4FromR8" double, var

; winmdroot.Foundation.HRESULT VarUI4FromStr(winmdroot.Foundation.PCWSTR strIn, uint lcid, uint dwFlags, uint* pulOut)
#cfunc VarUI4FromStr "VarUI4FromStr" wstr, int, int, var

; winmdroot.Foundation.HRESULT VarUI4FromUI1(byte bIn, uint* pulOut)
#cfunc VarUI4FromUI1 "VarUI4FromUI1" int, var

; winmdroot.Foundation.HRESULT VarUI4FromUI2(ushort uiIn, uint* pulOut)
#cfunc VarUI4FromUI2 "VarUI4FromUI2" int, var

; winmdroot.Foundation.HRESULT VarUI4FromUI8(ulong ui64In, uint* plOut)
#cfunc VarUI4FromUI8 "VarUI4FromUI8" int64, var

; winmdroot.Foundation.HRESULT VarUI8FromBool(winmdroot.Foundation.VARIANT_BOOL boolIn, ulong* pi64Out)
#cfunc VarUI8FromBool "VarUI8FromBool" int, var

; winmdroot.Foundation.HRESULT VarUI8FromCy(winmdroot.System.Com.CY cyIn, ulong* pi64Out)
#cfunc VarUI8FromCy "VarUI8FromCy" var, var

; winmdroot.Foundation.HRESULT VarUI8FromDate(double dateIn, ulong* pi64Out)
#cfunc VarUI8FromDate "VarUI8FromDate" double, var

; winmdroot.Foundation.HRESULT VarUI8FromDec(winmdroot.Foundation.DECIMAL* pdecIn, ulong* pi64Out)
#cfunc VarUI8FromDec "VarUI8FromDec" var, var

; winmdroot.Foundation.HRESULT VarUI8FromDisp(winmdroot.System.Com.IDispatch* pdispIn, uint lcid, ulong* pi64Out)
#cfunc VarUI8FromDisp "VarUI8FromDisp" var, int, var

; winmdroot.Foundation.HRESULT VarUI8FromI1(winmdroot.Foundation.CHAR cIn, ulong* pi64Out)
#cfunc VarUI8FromI1 "VarUI8FromI1" int, var

; winmdroot.Foundation.HRESULT VarUI8FromI2(short sIn, ulong* pi64Out)
#cfunc VarUI8FromI2 "VarUI8FromI2" int, var

; winmdroot.Foundation.HRESULT VarUI8FromI8(long ui64In, ulong* pi64Out)
#cfunc VarUI8FromI8 "VarUI8FromI8" int64, var

; winmdroot.Foundation.HRESULT VarUI8FromR4(float fltIn, ulong* pi64Out)
#cfunc VarUI8FromR4 "VarUI8FromR4" float, var

; winmdroot.Foundation.HRESULT VarUI8FromR8(double dblIn, ulong* pi64Out)
#cfunc VarUI8FromR8 "VarUI8FromR8" double, var

; winmdroot.Foundation.HRESULT VarUI8FromStr(winmdroot.Foundation.PCWSTR strIn, uint lcid, uint dwFlags, ulong* pi64Out)
#cfunc VarUI8FromStr "VarUI8FromStr" wstr, int, int, var

; winmdroot.Foundation.HRESULT VarUI8FromUI1(byte bIn, ulong* pi64Out)
#cfunc VarUI8FromUI1 "VarUI8FromUI1" int, var

; winmdroot.Foundation.HRESULT VarUI8FromUI2(ushort uiIn, ulong* pi64Out)
#cfunc VarUI8FromUI2 "VarUI8FromUI2" int, var

; winmdroot.Foundation.HRESULT VarUI8FromUI4(uint ulIn, ulong* pi64Out)
#cfunc VarUI8FromUI4 "VarUI8FromUI4" int, var

; winmdroot.Foundation.HRESULT VarUdateFromDate(double dateIn, uint dwFlags, winmdroot.System.Ole.UDATE* pudateOut)
#cfunc VarUdateFromDate "VarUdateFromDate" double, int, var

; winmdroot.Foundation.HRESULT VarWeekdayName(int iWeekday, int fAbbrev, int iFirstDay, uint dwFlags, winmdroot.Foundation.BSTR* pbstrOut)
#cfunc VarWeekdayName "VarWeekdayName" int, int, int, int, var

; winmdroot.Foundation.HRESULT VarXor(winmdroot.System.Variant.VARIANT* pvarLeft, winmdroot.System.Variant.VARIANT* pvarRight, winmdroot.System.Variant.VARIANT* pvarResult)
#cfunc VarXor "VarXor" var, var, var

; winmdroot.Foundation.HRESULT VariantChangeType(winmdroot.System.Variant.VARIANT* pvargDest, winmdroot.System.Variant.VARIANT* pvarSrc, winmdroot.System.Variant.VAR_CHANGE_FLAGS wFlags, winmdroot.System.Variant.VARENUM vt)
#cfunc VariantChangeType "VariantChangeType" var, var, int, int

; winmdroot.Foundation.HRESULT VariantChangeTypeEx(winmdroot.System.Variant.VARIANT* pvargDest, winmdroot.System.Variant.VARIANT* pvarSrc, uint lcid, winmdroot.System.Variant.VAR_CHANGE_FLAGS wFlags, winmdroot.System.Variant.VARENUM vt)
#cfunc VariantChangeTypeEx "VariantChangeTypeEx" var, var, int, int, int

; winmdroot.Foundation.HRESULT VariantClear(winmdroot.System.Variant.VARIANT* pvarg)
#cfunc VariantClear "VariantClear" var

; winmdroot.Foundation.HRESULT VariantCopy(winmdroot.System.Variant.VARIANT* pvargDest, winmdroot.System.Variant.VARIANT* pvargSrc)
#cfunc VariantCopy "VariantCopy" var, var

; winmdroot.Foundation.HRESULT VariantCopyInd(winmdroot.System.Variant.VARIANT* pvarDest, winmdroot.System.Variant.VARIANT* pvargSrc)
#cfunc VariantCopyInd "VariantCopyInd" var, var

; void VariantInit(winmdroot.System.Variant.VARIANT* pvarg)
#func VariantInit "VariantInit" var

; int VariantTimeToDosDateTime(double vtime, ushort* pwDosDate, ushort* pwDosTime)
#cfunc VariantTimeToDosDateTime "VariantTimeToDosDateTime" double, var, var

; int VariantTimeToSystemTime(double vtime, winmdroot.Foundation.SYSTEMTIME* lpSystemTime)
#cfunc VariantTimeToSystemTime "VariantTimeToSystemTime" double, var

; winmdroot.Foundation.HRESULT VectorFromBstr(winmdroot.Foundation.BSTR bstr, winmdroot.System.Com.SAFEARRAY** ppsa)
#cfunc VectorFromBstr "VectorFromBstr" int, var

#endif
