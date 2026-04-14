; ============================================================
;   urlmon.dll ヘルプ (CsWin32 / win32metadata から自動抽出)
;   docs_ja.json に日本語訳があればそちらを使用、無ければ英語原文。
;   翻訳を追加するときは docs_ja.json を編集して再生成。
; ============================================================

%index
CoGetClassObjectFromURL
(no summary)
%group
Win32 urlmon
%prm
rCLASSID, szCODE, dwFileVersionMS, dwFileVersionLS, szTYPE, pBindCtx, dwClsContext, pvReserved, riid, ppv
rCLASSID : [var] 
szCODE : [wstr] 
dwFileVersionMS : [int] 
dwFileVersionLS : [int] 
szTYPE : [wstr] 
pBindCtx : [var] 
dwClsContext : [int] 
pvReserved : [intptr] 
riid : [var] 
ppv : [var] 
%inst



%index
CoInternetCombineIUri
(no summary)
%group
Win32 urlmon
%prm
pBaseUri, pRelativeUri, dwCombineFlags, ppCombinedUri, dwReserved
pBaseUri : [var] 
pRelativeUri : [var] 
dwCombineFlags : [int] 
ppCombinedUri : [var] 
dwReserved : [int] 
%inst



%index
CoInternetCombineUrl
(no summary)
%group
Win32 urlmon
%prm
pwzBaseUrl, pwzRelativeUrl, dwCombineFlags, pszResult, cchResult, pcchResult, dwReserved
pwzBaseUrl : [wstr] 
pwzRelativeUrl : [wstr] 
dwCombineFlags : [int] 
pszResult : [wstr] 
cchResult : [int] 
pcchResult : [var] 
dwReserved : [int] 
%inst



%index
CoInternetCombineUrlEx
(no summary)
%group
Win32 urlmon
%prm
pBaseUri, pwzRelativeUrl, dwCombineFlags, ppCombinedUri, dwReserved
pBaseUri : [var] 
pwzRelativeUrl : [wstr] 
dwCombineFlags : [int] 
ppCombinedUri : [var] 
dwReserved : [int] 
%inst



%index
CoInternetCompareUrl
(no summary)
%group
Win32 urlmon
%prm
pwzUrl1, pwzUrl2, dwFlags
pwzUrl1 : [wstr] 
pwzUrl2 : [wstr] 
dwFlags : [int] 
%inst



%index
CoInternetCreateSecurityManager
(no summary)
%group
Win32 urlmon
%prm
pSP, ppSM, dwReserved
pSP : [var] 
ppSM : [var] 
dwReserved : [int] 
%inst



%index
CoInternetCreateZoneManager
(no summary)
%group
Win32 urlmon
%prm
pSP, ppZM, dwReserved
pSP : [var] 
ppZM : [var] 
dwReserved : [int] 
%inst



%index
CoInternetGetProtocolFlags
(no summary)
%group
Win32 urlmon
%prm
pwzUrl, pdwFlags, dwReserved
pwzUrl : [wstr] 
pdwFlags : [var] 
dwReserved : [int] 
%inst



%index
CoInternetGetSecurityUrl
(no summary)
%group
Win32 urlmon
%prm
pwszUrl, ppwszSecUrl, psuAction, dwReserved
pwszUrl : [wstr] 
ppwszSecUrl : [var] 
psuAction : [int] 
dwReserved : [int] 
%inst



%index
CoInternetGetSecurityUrlEx
(no summary)
%group
Win32 urlmon
%prm
pUri, ppSecUri, psuAction, dwReserved
pUri : [var] 
ppSecUri : [var] 
psuAction : [int] 
dwReserved : [int] 
%inst



%index
CoInternetGetSession
(no summary)
%group
Win32 urlmon
%prm
dwSessionMode, ppIInternetSession, dwReserved
dwSessionMode : [int] 
ppIInternetSession : [var] 
dwReserved : [int] 
%inst



%index
CoInternetIsFeatureEnabled
(no summary)
%group
Win32 urlmon
%prm
FeatureEntry, dwFlags
FeatureEntry : [int] 
dwFlags : [int] 
%inst



%index
CoInternetIsFeatureEnabledForIUri
(no summary)
%group
Win32 urlmon
%prm
FeatureEntry, dwFlags, pIUri, pSecMgr
FeatureEntry : [int] 
dwFlags : [int] 
pIUri : [var] 
pSecMgr : [var] 
%inst



%index
CoInternetIsFeatureEnabledForUrl
(no summary)
%group
Win32 urlmon
%prm
FeatureEntry, dwFlags, szURL, pSecMgr
FeatureEntry : [int] 
dwFlags : [int] 
szURL : [wstr] 
pSecMgr : [var] 
%inst



%index
CoInternetIsFeatureZoneElevationEnabled
(no summary)
%group
Win32 urlmon
%prm
szFromURL, szToURL, pSecMgr, dwFlags
szFromURL : [wstr] 
szToURL : [wstr] 
pSecMgr : [var] 
dwFlags : [int] 
%inst



%index
CoInternetParseIUri
(no summary)
%group
Win32 urlmon
%prm
pIUri, ParseAction, dwFlags, pwzResult, cchResult, pcchResult, dwReserved
pIUri : [var] 
ParseAction : [int] 
dwFlags : [int] 
pwzResult : [wstr] 
cchResult : [int] 
pcchResult : [var] 
dwReserved : [int] 
%inst



%index
CoInternetParseUrl
(no summary)
%group
Win32 urlmon
%prm
pwzUrl, ParseAction, dwFlags, pszResult, cchResult, pcchResult, dwReserved
pwzUrl : [wstr] 
ParseAction : [int] 
dwFlags : [int] 
pszResult : [wstr] 
cchResult : [int] 
pcchResult : [var] 
dwReserved : [int] 
%inst



%index
CoInternetQueryInfo
(no summary)
%group
Win32 urlmon
%prm
pwzUrl, QueryOptions, dwQueryFlags, pvBuffer, cbBuffer, pcbBuffer, dwReserved
pwzUrl : [wstr] 
QueryOptions : [int] 
dwQueryFlags : [int] 
pvBuffer : [intptr] 
cbBuffer : [int] 
pcbBuffer : [var] 
dwReserved : [int] 
%inst



%index
CoInternetSetFeatureEnabled
(no summary)
%group
Win32 urlmon
%prm
FeatureEntry, dwFlags, fEnable
FeatureEntry : [int] 
dwFlags : [int] 
fEnable : [int] 
%inst



%index
CompareSecurityIds
(no summary)
%group
Win32 urlmon
%prm
pbSecurityId1, dwLen1, pbSecurityId2, dwLen2, dwReserved
pbSecurityId1 : [var] 
dwLen1 : [int] 
pbSecurityId2 : [var] 
dwLen2 : [int] 
dwReserved : [int] 
%inst



%index
CompatFlagsFromClsid
(no summary)
%group
Win32 urlmon
%prm
pclsid, pdwCompatFlags, pdwMiscStatusFlags
pclsid : [var] 
pdwCompatFlags : [var] 
pdwMiscStatusFlags : [var] 
%inst



%index
CopyBindInfo
(no summary)
%group
Win32 urlmon
%prm
pcbiSrc, pbiDest
pcbiSrc : [var] 
pbiDest : [var] 
%inst



%index
CopyStgMedium
(no summary)
%group
Win32 urlmon
%prm
pcstgmedSrc, pstgmedDest
pcstgmedSrc : [var] 
pstgmedDest : [var] 
%inst



%index
CreateAsyncBindCtx
Creates an asynchronous bind context for use with asynchronous monikers.
%group
Win32 urlmon
%prm
reserved, pBSCb, pEFetc, ppBC
reserved : [int] This parameter is reserved and must be 0.
pBSCb : [var] A pointer to the IBindStatusCallback interface used for receiving data availability and progress notification.
pEFetc : [var] A pointer to the IEnumFORMATETC interface that can be used to enumerate formats for format negotiation during binding. This parameter can be NULL, in which case the caller is not interested in format negotiation during binding, and the default format of the object will be bound to.
ppBC : [var] Address of an IBindCtx* pointer variable that receives the interface pointer to the new bind context.
%inst
Creates an asynchronous bind context for use with asynchronous
monikers.

[戻り値]
This function can return the following values.
This doc was truncated.

[備考]
This function automatically registers the IBindStatusCallback and
IEnumFORMATETC interfaces with the bind context. The client can
specify flags from BSCO_OPTION to indicate which callback
notifications the client is capable of receiving. If the client does
not wish to receive certain notification, it can choose to implement
those callback methods as empty function stubs (returning E_NOTIMPL),
and they should not be called. The RegisterBindStatusCallback
function can also be used to register callback interfaces in the bind
context.


%index
CreateAsyncBindCtxEx
(no summary)
%group
Win32 urlmon
%prm
pbc, dwOptions, pBSCb, pEnum, ppBC, reserved
pbc : [var] 
dwOptions : [int] 
pBSCb : [var] 
pEnum : [var] 
ppBC : [var] 
reserved : [int] 
%inst



%index
CreateFormatEnumerator
Creates an object that implements IEnumFORMATETC over a static array of FORMATETC structures.
%group
Win32 urlmon
%prm
cfmtetc, rgfmtetc, ppenumfmtetc
cfmtetc : [int] Number of FORMATETC structures in the static array specified by the rgfmtetc parameter. The cfmtetc parameter cannot be zero.
rgfmtetc : [var] Pointer to a static array of FORMATETC structures.
ppenumfmtetc : [var] Address of IEnumFORMATETC pointer variable that receives the interface pointer to the enumerator object.
%inst
Creates an object that implements IEnumFORMATETC over a static array
of FORMATETC structures.

[戻り値]
This function returns S_OK on success. Other possible return values
include the following.
This doc was truncated.

[備考]
The CreateFormatEnumerator function creates an enumerator object that
implements IEnumFORMATETC over a static array of FORMATETC
structures. The cfmtetc parameter specifies the number of these
structures. With the pointer, you can call the standard enumeration
methods to enumerate the structures.


%index
CreateIUriBuilder
(no summary)
%group
Win32 urlmon
%prm
pIUri, dwFlags, dwReserved, ppIUriBuilder
pIUri : [var] 
dwFlags : [int] 
dwReserved : [int] 
ppIUriBuilder : [var] 
%inst



%index
CreateURLMoniker
(no summary)
%group
Win32 urlmon
%prm
pMkCtx, szURL, ppmk
pMkCtx : [var] 
szURL : [wstr] 
ppmk : [var] 
%inst



%index
CreateURLMonikerEx
(no summary)
%group
Win32 urlmon
%prm
pMkCtx, szURL, ppmk, dwFlags
pMkCtx : [var] 
szURL : [wstr] 
ppmk : [var] 
dwFlags : [int] 
%inst



%index
CreateURLMonikerEx2
(no summary)
%group
Win32 urlmon
%prm
pMkCtx, pUri, ppmk, dwFlags
pMkCtx : [var] 
pUri : [var] 
ppmk : [var] 
dwFlags : [int] 
%inst



%index
CreateUri
(no summary)
%group
Win32 urlmon
%prm
pwzURI, dwFlags, dwReserved, ppURI
pwzURI : [wstr] 
dwFlags : [int] 
dwReserved : [int] 
ppURI : [var] 
%inst



%index
CreateUriFromMultiByteString
(no summary)
%group
Win32 urlmon
%prm
pszANSIInputUri, dwEncodingFlags, dwCodePage, dwCreateFlags, dwReserved, ppUri
pszANSIInputUri : [str] 
dwEncodingFlags : [int] 
dwCodePage : [int] 
dwCreateFlags : [int] 
dwReserved : [int] 
ppUri : [var] 
%inst



%index
CreateUriWithFragment
(no summary)
%group
Win32 urlmon
%prm
pwzURI, pwzFragment, dwFlags, dwReserved, ppURI
pwzURI : [wstr] 
pwzFragment : [wstr] 
dwFlags : [int] 
dwReserved : [int] 
ppURI : [var] 
%inst



%index
FaultInIEFeature
(no summary)
%group
Win32 urlmon
%prm
hWnd, pClassSpec, pQuery, dwFlags
hWnd : [intptr] 
pClassSpec : [var] 
pQuery : [var] 
dwFlags : [int] 
%inst



%index
FindMediaType
(no summary)
%group
Win32 urlmon
%prm
rgszTypes, rgcfTypes
rgszTypes : [str] 
rgcfTypes : [var] 
%inst



%index
FindMediaTypeClass
(no summary)
%group
Win32 urlmon
%prm
pBC, szType, pclsID, reserved
pBC : [var] 
szType : [str] 
pclsID : [var] 
reserved : [int] 
%inst



%index
FindMimeFromData
(no summary)
%group
Win32 urlmon
%prm
pBC, pwzUrl, pBuffer, cbSize, pwzMimeProposed, dwMimeFlags, ppwzMimeOut, dwReserved
pBC : [var] 
pwzUrl : [wstr] 
pBuffer : [intptr] 
cbSize : [int] 
pwzMimeProposed : [wstr] 
dwMimeFlags : [int] 
ppwzMimeOut : [var] 
dwReserved : [int] 
%inst



%index
GetClassFileOrMime
(no summary)
%group
Win32 urlmon
%prm
pBC, szFilename, pBuffer, cbSize, szMime, dwReserved, pclsid
pBC : [var] 
szFilename : [wstr] 
pBuffer : [intptr] 
cbSize : [int] 
szMime : [wstr] 
dwReserved : [int] 
pclsid : [var] 
%inst



%index
GetClassURL
(no summary)
%group
Win32 urlmon
%prm
szURL, pClsID
szURL : [wstr] 
pClsID : [var] 
%inst



%index
GetComponentIDFromCLSSPEC
(no summary)
%group
Win32 urlmon
%prm
pClassspec, ppszComponentID
pClassspec : [var] 
ppszComponentID : [var] 
%inst



%index
GetSoftwareUpdateInfo
(no summary)
%group
Win32 urlmon
%prm
szDistUnit, psdi
szDistUnit : [wstr] 
psdi : [var] 
%inst



%index
HlinkGoBack
(no summary)
%group
Win32 urlmon
%prm
pUnk
pUnk : [var] 
%inst



%index
HlinkGoForward
(no summary)
%group
Win32 urlmon
%prm
pUnk
pUnk : [var] 
%inst



%index
HlinkNavigateMoniker
(no summary)
%group
Win32 urlmon
%prm
pUnk, pmkTarget
pUnk : [var] 
pmkTarget : [var] 
%inst



%index
HlinkNavigateString
(no summary)
%group
Win32 urlmon
%prm
pUnk, szTarget
pUnk : [var] 
szTarget : [wstr] 
%inst



%index
HlinkSimpleNavigateToMoniker
(no summary)
%group
Win32 urlmon
%prm
pmkTarget, szLocation, szTargetFrameName, pUnk, pbc, param5, grfHLNF, dwReserved
pmkTarget : [var] 
szLocation : [wstr] 
szTargetFrameName : [wstr] 
pUnk : [var] 
pbc : [var] 
param5 : [var] 
grfHLNF : [int] 
dwReserved : [int] 
%inst



%index
HlinkSimpleNavigateToString
(no summary)
%group
Win32 urlmon
%prm
szTarget, szLocation, szTargetFrameName, pUnk, pbc, param5, grfHLNF, dwReserved
szTarget : [wstr] 
szLocation : [wstr] 
szTargetFrameName : [wstr] 
pUnk : [var] 
pbc : [var] 
param5 : [var] 
grfHLNF : [int] 
dwReserved : [int] 
%inst



%index
IEGetUserPrivateNamespaceName
(no summary)
%group
Win32 urlmon
%prm

%inst



%index
IEInstallScope
(no summary)
%group
Win32 urlmon
%prm
pdwScope
pdwScope : [var] 
%inst



%index
IsAsyncMoniker
(no summary)
%group
Win32 urlmon
%prm
pmk
pmk : [var] 
%inst



%index
IsLoggingEnabledW
(no summary)
%group
Win32 urlmon
%prm
pwszUrl
pwszUrl : [wstr] 
%inst



%index
IsValidURL
(no summary)
%group
Win32 urlmon
%prm
pBC, szURL, dwReserved
pBC : [var] 
szURL : [wstr] 
dwReserved : [int] 
%inst



%index
MkParseDisplayNameEx
(no summary)
%group
Win32 urlmon
%prm
pbc, szDisplayName, pchEaten, ppmk
pbc : [var] 
szDisplayName : [wstr] 
pchEaten : [var] 
ppmk : [var] 
%inst



%index
ObtainUserAgentString
(no summary)
%group
Win32 urlmon
%prm
dwOption, pszUAOut, cbSize
dwOption : [int] 
pszUAOut : [str] 
cbSize : [var] 
%inst



%index
RegisterBindStatusCallback
(no summary)
%group
Win32 urlmon
%prm
pBC, pBSCb, ppBSCBPrev, dwReserved
pBC : [var] 
pBSCb : [var] 
ppBSCBPrev : [var] 
dwReserved : [int] 
%inst



%index
RegisterFormatEnumerator
(no summary)
%group
Win32 urlmon
%prm
pBC, pEFetc, reserved
pBC : [var] 
pEFetc : [var] 
reserved : [int] 
%inst



%index
RegisterMediaTypeClass
(no summary)
%group
Win32 urlmon
%prm
pBC, ctypes, rgszTypes, rgclsID, reserved
pBC : [var] 
ctypes : [int] 
rgszTypes : [var] 
rgclsID : [var] 
reserved : [int] 
%inst



%index
RegisterMediaTypes
(no summary)
%group
Win32 urlmon
%prm
ctypes, rgszTypes, rgcfTypes
ctypes : [int] 
rgszTypes : [var] 
rgcfTypes : [var] 
%inst



%index
ReleaseBindInfo
(no summary)
%group
Win32 urlmon
%prm
pbindinfo
pbindinfo : [var] 
%inst



%index
RevokeBindStatusCallback
(no summary)
%group
Win32 urlmon
%prm
pBC, pBSCb
pBC : [var] 
pBSCb : [var] 
%inst



%index
RevokeFormatEnumerator
(no summary)
%group
Win32 urlmon
%prm
pBC, pEFetc
pBC : [var] 
pEFetc : [var] 
%inst



%index
SetAccessForIEAppContainer
(no summary)
%group
Win32 urlmon
%prm
hObject, ieObjectType, dwAccessMask
hObject : [intptr] 
ieObjectType : [int] 
dwAccessMask : [int] 
%inst



%index
SetSoftwareUpdateAdvertisementState
(no summary)
%group
Win32 urlmon
%prm
szDistUnit, dwAdState, dwAdvertisedVersionMS, dwAdvertisedVersionLS
szDistUnit : [wstr] 
dwAdState : [int] 
dwAdvertisedVersionMS : [int] 
dwAdvertisedVersionLS : [int] 
%inst



%index
URLDownloadToCacheFileW
(no summary)
%group
Win32 urlmon
%prm
param0, param1, param2, cchFileName, param4, param5
param0 : [var] 
param1 : [wstr] 
param2 : [wstr] 
cchFileName : [int] 
param4 : [int] 
param5 : [var] 
%inst



%index
URLDownloadToFileW
(no summary)
%group
Win32 urlmon
%prm
param0, param1, param2, param3, param4
param0 : [var] 
param1 : [wstr] 
param2 : [wstr] 
param3 : [int] 
param4 : [var] 
%inst



%index
URLOpenBlockingStreamW
(no summary)
%group
Win32 urlmon
%prm
param0, param1, param2, param3, param4
param0 : [var] 
param1 : [wstr] 
param2 : [var] 
param3 : [int] 
param4 : [var] 
%inst



%index
URLOpenPullStreamW
(no summary)
%group
Win32 urlmon
%prm
param0, param1, param2, param3
param0 : [var] 
param1 : [wstr] 
param2 : [int] 
param3 : [var] 
%inst



%index
URLOpenStreamW
(no summary)
%group
Win32 urlmon
%prm
param0, param1, param2, param3
param0 : [var] 
param1 : [wstr] 
param2 : [int] 
param3 : [var] 
%inst



%index
UrlMkGetSessionOption
(no summary)
%group
Win32 urlmon
%prm
dwOption, pBuffer, dwBufferLength, pdwBufferLengthOut, dwReserved
dwOption : [int] 
pBuffer : [intptr] 
dwBufferLength : [int] 
pdwBufferLengthOut : [var] 
dwReserved : [int] 
%inst



%index
UrlMkSetSessionOption
(no summary)
%group
Win32 urlmon
%prm
dwOption, pBuffer, dwBufferLength, dwReserved
dwOption : [int] 
pBuffer : [intptr] 
dwBufferLength : [int] 
dwReserved : [int] 
%inst



%index
WriteHitLogging
(no summary)
%group
Win32 urlmon
%prm
lpLogginginfo
lpLogginginfo : [var] 
%inst


