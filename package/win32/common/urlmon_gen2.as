; ============================================================
;   Auto-generated from CsWin32 / win32metadata
;   dll:    urlmon.dll
;   tool:   tools/cswin32_bridge/gen_from_cswin32.py
;   Do not edit by hand ? regenerate via the python script.
;   Needs hsp3net (intptr / NSTRUCT / wstr).
; ============================================================

#ifndef __urlmon_gen2_as__
#define global __urlmon_gen2_as__

; Shared NSTRUCT + #define constants for all win32 *_gen2.as
#include "win32_types_gen2.as"

;--- functions ---
#uselib "urlmon.dll"
; winmdroot.Foundation.HRESULT CoGetClassObjectFromURL(global::System.Guid* rCLASSID, winmdroot.Foundation.PCWSTR szCODE, uint dwFileVersionMS, uint dwFileVersionLS, winmdroot.Foundation.PCWSTR szTYPE, winmdroot.System.Com.IBindCtx* pBindCtx, winmdroot.System.Com.CLSCTX dwClsContext, [Optional] void* pvReserved, global::System.Guid* riid, void** ppv)
#cfunc global CoGetClassObjectFromURL "CoGetClassObjectFromURL" var, wstr, int, int, wstr, var, int, intptr, var, var

; winmdroot.Foundation.HRESULT CoInternetCombineIUri(winmdroot.System.Com.IUri* pBaseUri, winmdroot.System.Com.IUri* pRelativeUri, uint dwCombineFlags, winmdroot.System.Com.IUri** ppCombinedUri, nuint dwReserved)
#cfunc global CoInternetCombineIUri "CoInternetCombineIUri" var, var, int, var, int

; winmdroot.Foundation.HRESULT CoInternetCombineUrl(winmdroot.Foundation.PCWSTR pwzBaseUrl, winmdroot.Foundation.PCWSTR pwzRelativeUrl, uint dwCombineFlags, winmdroot.Foundation.PWSTR pszResult, uint cchResult, [Optional] uint* pcchResult, uint dwReserved)
#cfunc global CoInternetCombineUrl "CoInternetCombineUrl" wstr, wstr, int, wstr, int, var, int

; winmdroot.Foundation.HRESULT CoInternetCombineUrlEx([Optional] winmdroot.System.Com.IUri* pBaseUri, winmdroot.Foundation.PCWSTR pwzRelativeUrl, uint dwCombineFlags, winmdroot.System.Com.IUri** ppCombinedUri, nuint dwReserved)
#cfunc global CoInternetCombineUrlEx "CoInternetCombineUrlEx" var, wstr, int, var, int

; winmdroot.Foundation.HRESULT CoInternetCompareUrl(winmdroot.Foundation.PCWSTR pwzUrl1, winmdroot.Foundation.PCWSTR pwzUrl2, uint dwFlags)
#cfunc global CoInternetCompareUrl "CoInternetCompareUrl" wstr, wstr, int

; winmdroot.Foundation.HRESULT CoInternetCreateSecurityManager([Optional] winmdroot.System.Com.IServiceProvider* pSP, winmdroot.System.Com.Urlmon.IInternetSecurityManager** ppSM, uint dwReserved)
#cfunc global CoInternetCreateSecurityManager "CoInternetCreateSecurityManager" var, var, int

; winmdroot.Foundation.HRESULT CoInternetCreateZoneManager([Optional] winmdroot.System.Com.IServiceProvider* pSP, winmdroot.System.Com.Urlmon.IInternetZoneManager** ppZM, uint dwReserved)
#cfunc global CoInternetCreateZoneManager "CoInternetCreateZoneManager" var, var, int

; winmdroot.Foundation.HRESULT CoInternetGetProtocolFlags(winmdroot.Foundation.PCWSTR pwzUrl, uint* pdwFlags, uint dwReserved)
#cfunc global CoInternetGetProtocolFlags "CoInternetGetProtocolFlags" wstr, var, int

; winmdroot.Foundation.HRESULT CoInternetGetSecurityUrl(winmdroot.Foundation.PCWSTR pwszUrl, winmdroot.Foundation.PWSTR* ppwszSecUrl, winmdroot.System.Com.Urlmon.PSUACTION psuAction, uint dwReserved)
#cfunc global CoInternetGetSecurityUrl "CoInternetGetSecurityUrl" wstr, var, int, int

; winmdroot.Foundation.HRESULT CoInternetGetSecurityUrlEx(winmdroot.System.Com.IUri* pUri, winmdroot.System.Com.IUri** ppSecUri, winmdroot.System.Com.Urlmon.PSUACTION psuAction, nuint dwReserved)
#cfunc global CoInternetGetSecurityUrlEx "CoInternetGetSecurityUrlEx" var, var, int, int

; winmdroot.Foundation.HRESULT CoInternetGetSession(uint dwSessionMode, winmdroot.System.Com.Urlmon.IInternetSession** ppIInternetSession, uint dwReserved)
#cfunc global CoInternetGetSession "CoInternetGetSession" int, var, int

; winmdroot.Foundation.HRESULT CoInternetIsFeatureEnabled(winmdroot.System.Com.Urlmon.INTERNETFEATURELIST FeatureEntry, uint dwFlags)
#cfunc global CoInternetIsFeatureEnabled "CoInternetIsFeatureEnabled" int, int

; winmdroot.Foundation.HRESULT CoInternetIsFeatureEnabledForIUri(winmdroot.System.Com.Urlmon.INTERNETFEATURELIST FeatureEntry, uint dwFlags, [Optional] winmdroot.System.Com.IUri* pIUri, [Optional] winmdroot.System.Com.Urlmon.IInternetSecurityManagerEx2* pSecMgr)
#cfunc global CoInternetIsFeatureEnabledForIUri "CoInternetIsFeatureEnabledForIUri" int, int, var, var

; winmdroot.Foundation.HRESULT CoInternetIsFeatureEnabledForUrl(winmdroot.System.Com.Urlmon.INTERNETFEATURELIST FeatureEntry, uint dwFlags, winmdroot.Foundation.PCWSTR szURL, [Optional] winmdroot.System.Com.Urlmon.IInternetSecurityManager* pSecMgr)
#cfunc global CoInternetIsFeatureEnabledForUrl "CoInternetIsFeatureEnabledForUrl" int, int, wstr, var

; winmdroot.Foundation.HRESULT CoInternetIsFeatureZoneElevationEnabled(winmdroot.Foundation.PCWSTR szFromURL, winmdroot.Foundation.PCWSTR szToURL, [Optional] winmdroot.System.Com.Urlmon.IInternetSecurityManager* pSecMgr, uint dwFlags)
#cfunc global CoInternetIsFeatureZoneElevationEnabled "CoInternetIsFeatureZoneElevationEnabled" wstr, wstr, var, int

; winmdroot.Foundation.HRESULT CoInternetParseIUri(winmdroot.System.Com.IUri* pIUri, winmdroot.System.Com.Urlmon.PARSEACTION ParseAction, uint dwFlags, winmdroot.Foundation.PWSTR pwzResult, uint cchResult, uint* pcchResult, nuint dwReserved)
#cfunc global CoInternetParseIUri "CoInternetParseIUri" var, int, int, wstr, int, var, int

; winmdroot.Foundation.HRESULT CoInternetParseUrl(winmdroot.Foundation.PCWSTR pwzUrl, winmdroot.System.Com.Urlmon.PARSEACTION ParseAction, uint dwFlags, winmdroot.Foundation.PWSTR pszResult, uint cchResult, uint* pcchResult, uint dwReserved)
#cfunc global CoInternetParseUrl "CoInternetParseUrl" wstr, int, int, wstr, int, var, int

; winmdroot.Foundation.HRESULT CoInternetQueryInfo(winmdroot.Foundation.PCWSTR pwzUrl, winmdroot.System.Com.Urlmon.QUERYOPTION QueryOptions, uint dwQueryFlags, void* pvBuffer, uint cbBuffer, [Optional] uint* pcbBuffer, uint dwReserved)
#cfunc global CoInternetQueryInfo "CoInternetQueryInfo" wstr, int, int, intptr, int, var, int

; winmdroot.Foundation.HRESULT CoInternetSetFeatureEnabled(winmdroot.System.Com.Urlmon.INTERNETFEATURELIST FeatureEntry, uint dwFlags, winmdroot.Foundation.BOOL fEnable)
#cfunc global CoInternetSetFeatureEnabled "CoInternetSetFeatureEnabled" int, int, int

; winmdroot.Foundation.HRESULT CompareSecurityIds(byte* pbSecurityId1, uint dwLen1, byte* pbSecurityId2, uint dwLen2, uint dwReserved)
#cfunc global CompareSecurityIds "CompareSecurityIds" var, int, var, int, int

; winmdroot.Foundation.HRESULT CompatFlagsFromClsid(global::System.Guid* pclsid, uint* pdwCompatFlags, uint* pdwMiscStatusFlags)
#cfunc global CompatFlagsFromClsid "CompatFlagsFromClsid" var, var, var

; winmdroot.Foundation.HRESULT CopyBindInfo(winmdroot.System.Com.BINDINFO* pcbiSrc, winmdroot.System.Com.BINDINFO* pbiDest)
#cfunc global CopyBindInfo "CopyBindInfo" var, var

; winmdroot.Foundation.HRESULT CopyStgMedium(winmdroot.System.Com.STGMEDIUM* pcstgmedSrc, winmdroot.System.Com.STGMEDIUM* pstgmedDest)
#cfunc global CopyStgMedium "CopyStgMedium" var, var

; winmdroot.Foundation.HRESULT CreateAsyncBindCtx(uint reserved, winmdroot.System.Com.IBindStatusCallback* pBSCb, [Optional] winmdroot.System.Com.IEnumFORMATETC* pEFetc, winmdroot.System.Com.IBindCtx** ppBC)
#cfunc global CreateAsyncBindCtx "CreateAsyncBindCtx" int, var, var, var

; winmdroot.Foundation.HRESULT CreateAsyncBindCtxEx(winmdroot.System.Com.IBindCtx* pbc, uint dwOptions, winmdroot.System.Com.IBindStatusCallback* pBSCb, [Optional] winmdroot.System.Com.IEnumFORMATETC* pEnum, winmdroot.System.Com.IBindCtx** ppBC, uint reserved)
#cfunc global CreateAsyncBindCtxEx "CreateAsyncBindCtxEx" var, int, var, var, var, int

; winmdroot.Foundation.HRESULT CreateFormatEnumerator(uint cfmtetc, winmdroot.System.Com.FORMATETC* rgfmtetc, winmdroot.System.Com.IEnumFORMATETC** ppenumfmtetc)
#cfunc global CreateFormatEnumerator "CreateFormatEnumerator" int, var, var

; winmdroot.Foundation.HRESULT CreateIUriBuilder([Optional] winmdroot.System.Com.IUri* pIUri, uint dwFlags, nuint dwReserved, winmdroot.System.Com.IUriBuilder** ppIUriBuilder)
#cfunc global CreateIUriBuilder "CreateIUriBuilder" var, int, int, var

; winmdroot.Foundation.HRESULT CreateURLMoniker([Optional] winmdroot.System.Com.IMoniker* pMkCtx, winmdroot.Foundation.PCWSTR szURL, winmdroot.System.Com.IMoniker** ppmk)
#cfunc global CreateURLMoniker "CreateURLMoniker" var, wstr, var

; winmdroot.Foundation.HRESULT CreateURLMonikerEx([Optional] winmdroot.System.Com.IMoniker* pMkCtx, winmdroot.Foundation.PCWSTR szURL, winmdroot.System.Com.IMoniker** ppmk, uint dwFlags)
#cfunc global CreateURLMonikerEx "CreateURLMonikerEx" var, wstr, var, int

; winmdroot.Foundation.HRESULT CreateURLMonikerEx2([Optional] winmdroot.System.Com.IMoniker* pMkCtx, winmdroot.System.Com.IUri* pUri, winmdroot.System.Com.IMoniker** ppmk, uint dwFlags)
#cfunc global CreateURLMonikerEx2 "CreateURLMonikerEx2" var, var, var, int

; winmdroot.Foundation.HRESULT CreateUri(winmdroot.Foundation.PCWSTR pwzURI, winmdroot.System.Com.URI_CREATE_FLAGS dwFlags, nuint dwReserved, winmdroot.System.Com.IUri** ppURI)
#cfunc global CreateUri "CreateUri" wstr, int, int, var

; winmdroot.Foundation.HRESULT CreateUriFromMultiByteString(winmdroot.Foundation.PCSTR pszANSIInputUri, uint dwEncodingFlags, uint dwCodePage, uint dwCreateFlags, nuint dwReserved, winmdroot.System.Com.IUri** ppUri)
#cfunc global CreateUriFromMultiByteString "CreateUriFromMultiByteString" str, int, int, int, int, var

; winmdroot.Foundation.HRESULT CreateUriWithFragment(winmdroot.Foundation.PCWSTR pwzURI, winmdroot.Foundation.PCWSTR pwzFragment, uint dwFlags, nuint dwReserved, winmdroot.System.Com.IUri** ppURI)
#cfunc global CreateUriWithFragment "CreateUriWithFragment" wstr, wstr, int, int, var

; winmdroot.Foundation.HRESULT FaultInIEFeature(winmdroot.Foundation.HWND hWnd, winmdroot.System.Com.uCLSSPEC* pClassSpec, [Optional] winmdroot.System.Com.QUERYCONTEXT* pQuery, uint dwFlags)
#cfunc global FaultInIEFeature "FaultInIEFeature" intptr, var, var, int

; winmdroot.Foundation.HRESULT FindMediaType(winmdroot.Foundation.PCSTR rgszTypes, ushort* rgcfTypes)
#cfunc global FindMediaType "FindMediaType" str, var

; winmdroot.Foundation.HRESULT FindMediaTypeClass(winmdroot.System.Com.IBindCtx* pBC, winmdroot.Foundation.PCSTR szType, global::System.Guid* pclsID, uint reserved)
#cfunc global FindMediaTypeClass "FindMediaTypeClass" var, str, var, int

; winmdroot.Foundation.HRESULT FindMimeFromData([Optional] winmdroot.System.Com.IBindCtx* pBC, winmdroot.Foundation.PCWSTR pwzUrl, [Optional] void* pBuffer, uint cbSize, winmdroot.Foundation.PCWSTR pwzMimeProposed, uint dwMimeFlags, winmdroot.Foundation.PWSTR* ppwzMimeOut, uint dwReserved)
#cfunc global FindMimeFromData "FindMimeFromData" var, wstr, intptr, int, wstr, int, var, int

; winmdroot.Foundation.HRESULT GetClassFileOrMime([Optional] winmdroot.System.Com.IBindCtx* pBC, winmdroot.Foundation.PCWSTR szFilename, [Optional] void* pBuffer, uint cbSize, winmdroot.Foundation.PCWSTR szMime, uint dwReserved, global::System.Guid* pclsid)
#cfunc global GetClassFileOrMime "GetClassFileOrMime" var, wstr, intptr, int, wstr, int, var

; winmdroot.Foundation.HRESULT GetClassURL(winmdroot.Foundation.PCWSTR szURL, global::System.Guid* pClsID)
#cfunc global GetClassURL "GetClassURL" wstr, var

; winmdroot.Foundation.HRESULT GetComponentIDFromCLSSPEC(winmdroot.System.Com.uCLSSPEC* pClassspec, winmdroot.Foundation.PSTR* ppszComponentID)
#cfunc global GetComponentIDFromCLSSPEC "GetComponentIDFromCLSSPEC" var, var

; winmdroot.Foundation.HRESULT GetSoftwareUpdateInfo(winmdroot.Foundation.PCWSTR szDistUnit, winmdroot.System.Com.Urlmon.SOFTDISTINFO* psdi)
#cfunc global GetSoftwareUpdateInfo "GetSoftwareUpdateInfo" wstr, var

; winmdroot.Foundation.HRESULT HlinkGoBack(winmdroot.System.Com.IUnknown* pUnk)
#cfunc global HlinkGoBack "HlinkGoBack" var

; winmdroot.Foundation.HRESULT HlinkGoForward(winmdroot.System.Com.IUnknown* pUnk)
#cfunc global HlinkGoForward "HlinkGoForward" var

; winmdroot.Foundation.HRESULT HlinkNavigateMoniker([Optional] winmdroot.System.Com.IUnknown* pUnk, [Optional] winmdroot.System.Com.IMoniker* pmkTarget)
#cfunc global HlinkNavigateMoniker "HlinkNavigateMoniker" var, var

; winmdroot.Foundation.HRESULT HlinkNavigateString([Optional] winmdroot.System.Com.IUnknown* pUnk, winmdroot.Foundation.PCWSTR szTarget)
#cfunc global HlinkNavigateString "HlinkNavigateString" var, wstr

; winmdroot.Foundation.HRESULT HlinkSimpleNavigateToMoniker([Optional] winmdroot.System.Com.IMoniker* pmkTarget, winmdroot.Foundation.PCWSTR szLocation, winmdroot.Foundation.PCWSTR szTargetFrameName, [Optional] winmdroot.System.Com.IUnknown* pUnk, [Optional] winmdroot.System.Com.IBindCtx* pbc, [Optional] winmdroot.System.Com.IBindStatusCallback* param5, uint grfHLNF, uint dwReserved)
#cfunc global HlinkSimpleNavigateToMoniker "HlinkSimpleNavigateToMoniker" var, wstr, wstr, var, var, var, int, int

; winmdroot.Foundation.HRESULT HlinkSimpleNavigateToString(winmdroot.Foundation.PCWSTR szTarget, winmdroot.Foundation.PCWSTR szLocation, winmdroot.Foundation.PCWSTR szTargetFrameName, winmdroot.System.Com.IUnknown* pUnk, [Optional] winmdroot.System.Com.IBindCtx* pbc, [Optional] winmdroot.System.Com.IBindStatusCallback* param5, uint grfHLNF, uint dwReserved)
#cfunc global HlinkSimpleNavigateToString "HlinkSimpleNavigateToString" wstr, wstr, wstr, var, var, var, int, int

; winmdroot.Foundation.PWSTR IEGetUserPrivateNamespaceName()
#cfunc global IEGetUserPrivateNamespaceName "IEGetUserPrivateNamespaceName"

; winmdroot.Foundation.HRESULT IEInstallScope(uint* pdwScope)
#cfunc global IEInstallScope "IEInstallScope" var

; winmdroot.Foundation.HRESULT IsAsyncMoniker(winmdroot.System.Com.IMoniker* pmk)
#cfunc global IsAsyncMoniker "IsAsyncMoniker" var

; winmdroot.Foundation.BOOL IsLoggingEnabledW(winmdroot.Foundation.PCWSTR pwszUrl)
#cfunc global IsLoggingEnabledW "IsLoggingEnabledW" wstr

; winmdroot.Foundation.HRESULT IsValidURL([Optional] winmdroot.System.Com.IBindCtx* pBC, winmdroot.Foundation.PCWSTR szURL, uint dwReserved)
#cfunc global IsValidURL "IsValidURL" var, wstr, int

; winmdroot.Foundation.HRESULT MkParseDisplayNameEx(winmdroot.System.Com.IBindCtx* pbc, winmdroot.Foundation.PCWSTR szDisplayName, uint* pchEaten, winmdroot.System.Com.IMoniker** ppmk)
#cfunc global MkParseDisplayNameEx "MkParseDisplayNameEx" var, wstr, var, var

; winmdroot.Foundation.HRESULT ObtainUserAgentString(uint dwOption, winmdroot.Foundation.PSTR pszUAOut, uint* cbSize)
#cfunc global ObtainUserAgentString "ObtainUserAgentString" int, str, var

; winmdroot.Foundation.HRESULT RegisterBindStatusCallback(winmdroot.System.Com.IBindCtx* pBC, winmdroot.System.Com.IBindStatusCallback* pBSCb, winmdroot.System.Com.IBindStatusCallback** ppBSCBPrev, uint dwReserved)
#cfunc global RegisterBindStatusCallback "RegisterBindStatusCallback" var, var, var, int

; winmdroot.Foundation.HRESULT RegisterFormatEnumerator(winmdroot.System.Com.IBindCtx* pBC, winmdroot.System.Com.IEnumFORMATETC* pEFetc, uint reserved)
#cfunc global RegisterFormatEnumerator "RegisterFormatEnumerator" var, var, int

; winmdroot.Foundation.HRESULT RegisterMediaTypeClass(winmdroot.System.Com.IBindCtx* pBC, uint ctypes, winmdroot.Foundation.PCSTR* rgszTypes, global::System.Guid* rgclsID, uint reserved)
#cfunc global RegisterMediaTypeClass "RegisterMediaTypeClass" var, int, var, var, int

; winmdroot.Foundation.HRESULT RegisterMediaTypes(uint ctypes, winmdroot.Foundation.PCSTR* rgszTypes, ushort* rgcfTypes)
#cfunc global RegisterMediaTypes "RegisterMediaTypes" int, var, var

; void ReleaseBindInfo(winmdroot.System.Com.BINDINFO* pbindinfo)
#func global ReleaseBindInfo "ReleaseBindInfo" var

; winmdroot.Foundation.HRESULT RevokeBindStatusCallback(winmdroot.System.Com.IBindCtx* pBC, winmdroot.System.Com.IBindStatusCallback* pBSCb)
#cfunc global RevokeBindStatusCallback "RevokeBindStatusCallback" var, var

; winmdroot.Foundation.HRESULT RevokeFormatEnumerator(winmdroot.System.Com.IBindCtx* pBC, winmdroot.System.Com.IEnumFORMATETC* pEFetc)
#cfunc global RevokeFormatEnumerator "RevokeFormatEnumerator" var, var

; winmdroot.Foundation.HRESULT SetAccessForIEAppContainer(winmdroot.Foundation.HANDLE hObject, winmdroot.System.Com.Urlmon.IEObjectType ieObjectType, uint dwAccessMask)
#cfunc global SetAccessForIEAppContainer "SetAccessForIEAppContainer" intptr, int, int

; winmdroot.Foundation.HRESULT SetSoftwareUpdateAdvertisementState(winmdroot.Foundation.PCWSTR szDistUnit, uint dwAdState, uint dwAdvertisedVersionMS, uint dwAdvertisedVersionLS)
#cfunc global SetSoftwareUpdateAdvertisementState "SetSoftwareUpdateAdvertisementState" wstr, int, int, int

; winmdroot.Foundation.HRESULT URLDownloadToCacheFileW([Optional] winmdroot.System.Com.IUnknown* param0, winmdroot.Foundation.PCWSTR param1, winmdroot.Foundation.PWSTR param2, uint cchFileName, uint param4, [Optional] winmdroot.System.Com.IBindStatusCallback* param5)
#cfunc global URLDownloadToCacheFileW "URLDownloadToCacheFileW" var, wstr, wstr, int, int, var

; winmdroot.Foundation.HRESULT URLDownloadToFileW([Optional] winmdroot.System.Com.IUnknown* param0, winmdroot.Foundation.PCWSTR param1, winmdroot.Foundation.PCWSTR param2, uint param3, [Optional] winmdroot.System.Com.IBindStatusCallback* param4)
#cfunc global URLDownloadToFileW "URLDownloadToFileW" var, wstr, wstr, int, var

; winmdroot.Foundation.HRESULT URLOpenBlockingStreamW([Optional] winmdroot.System.Com.IUnknown* param0, winmdroot.Foundation.PCWSTR param1, winmdroot.System.Com.IStream** param2, uint param3, [Optional] winmdroot.System.Com.IBindStatusCallback* param4)
#cfunc global URLOpenBlockingStreamW "URLOpenBlockingStreamW" var, wstr, var, int, var

; winmdroot.Foundation.HRESULT URLOpenPullStreamW([Optional] winmdroot.System.Com.IUnknown* param0, winmdroot.Foundation.PCWSTR param1, uint param2, [Optional] winmdroot.System.Com.IBindStatusCallback* param3)
#cfunc global URLOpenPullStreamW "URLOpenPullStreamW" var, wstr, int, var

; winmdroot.Foundation.HRESULT URLOpenStreamW([Optional] winmdroot.System.Com.IUnknown* param0, winmdroot.Foundation.PCWSTR param1, uint param2, [Optional] winmdroot.System.Com.IBindStatusCallback* param3)
#cfunc global URLOpenStreamW "URLOpenStreamW" var, wstr, int, var

; winmdroot.Foundation.HRESULT UrlMkGetSessionOption(uint dwOption, [Optional] void* pBuffer, uint dwBufferLength, uint* pdwBufferLengthOut, uint dwReserved)
#cfunc global UrlMkGetSessionOption "UrlMkGetSessionOption" int, intptr, int, var, int

; winmdroot.Foundation.HRESULT UrlMkSetSessionOption(uint dwOption, [Optional] void* pBuffer, uint dwBufferLength, uint dwReserved)
#cfunc global UrlMkSetSessionOption "UrlMkSetSessionOption" int, intptr, int, int

; winmdroot.Foundation.BOOL WriteHitLogging(winmdroot.System.Com.Urlmon.HIT_LOGGING_INFO* lpLogginginfo)
#cfunc global WriteHitLogging "WriteHitLogging" var

#endif
