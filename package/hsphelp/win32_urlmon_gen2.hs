; ============================================================
;   urlmon.dll ヘルプ (CsWin32 / win32metadata から自動抽出)
;   docs_ja.json に日本語訳があればそちらを使用、無ければ英語原文。
;   翻訳を追加するときは docs_ja.json を編集して再生成。
; ============================================================

%type
拡張命令
%ver
1.0
%dll
urlmon.dll
%date
2026/04/16
%author
IronHSP / CsWin32 bridge
%url
https://github.com/inovia/IronHSP
%port
Win

%note
Win32 API の urlmon.dll 関数群。CsWin32 + win32metadata から自動生成。
hsp3net 専用 (intptr / NSTRUCT / wstr を使用)。

%group
Win32API

%index
CoGetClassObjectFromURL
(no summary)
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
%prm
pwzUrl1, pwzUrl2, dwFlags
pwzUrl1 : [wstr] 
pwzUrl2 : [wstr] 
dwFlags : [int] 
%inst



%index
CoInternetCreateSecurityManager
(no summary)
%prm
pSP, ppSM, dwReserved
pSP : [var] 
ppSM : [var] 
dwReserved : [int] 
%inst



%index
CoInternetCreateZoneManager
(no summary)
%prm
pSP, ppZM, dwReserved
pSP : [var] 
ppZM : [var] 
dwReserved : [int] 
%inst



%index
CoInternetGetProtocolFlags
(no summary)
%prm
pwzUrl, pdwFlags, dwReserved
pwzUrl : [wstr] 
pdwFlags : [var] 
dwReserved : [int] 
%inst



%index
CoInternetGetSecurityUrl
(no summary)
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
%prm
dwSessionMode, ppIInternetSession, dwReserved
dwSessionMode : [int] 
ppIInternetSession : [var] 
dwReserved : [int] 
%inst



%index
CoInternetIsFeatureEnabled
(no summary)
%prm
FeatureEntry, dwFlags
FeatureEntry : [int] 
dwFlags : [int] 
%inst



%index
CoInternetIsFeatureEnabledForIUri
(no summary)
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
%prm
FeatureEntry, dwFlags, fEnable
FeatureEntry : [int] 
dwFlags : [int] 
fEnable : [int] 
%inst



%index
CompareSecurityIds
(no summary)
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
%prm
pclsid, pdwCompatFlags, pdwMiscStatusFlags
pclsid : [var] 
pdwCompatFlags : [var] 
pdwMiscStatusFlags : [var] 
%inst



%index
CopyBindInfo
(no summary)
%prm
pcbiSrc, pbiDest
pcbiSrc : [var] 
pbiDest : [var] 
%inst



%index
CopyStgMedium
(no summary)
%prm
pcstgmedSrc, pstgmedDest
pcstgmedSrc : [var] 
pstgmedDest : [var] 
%inst



%index
CreateAsyncBindCtx
非同期モニカで使用する非同期バインドコンテキストを作成する。
%prm
reserved, pBSCb, pEFetc, ppBC
reserved : [int] このパラメータは予約されており、0 を指定しなければならない。
pBSCb : [var] データ可用性および進捗通知を受け取るために使用する IBindStatusCallback インターフェースへのポインタ。
pEFetc : [var] バインド処理中の形式ネゴシエーションに使用できる IEnumFORMATETC インターフェースへのポインタ。このパラメータは NULL でもよく、その場合はバインド中の形式ネゴシエーションに呼び出し元が関心がないことを意味し、オブジェクトの既定の形式がバインドされる。
ppBC : [var] 新しいバインドコンテキストへのインターフェースポインタを受け取る IBindCtx* ポインタ変数のアドレス。
%inst
非同期モニカで使用する非同期バインドコンテキストを作成する。

[戻り値]
この関数は次の値を返すことがある。
このドキュメントは省略されている。

[備考]
この関数は、IBindStatusCallback および IEnumFORMATETC
インターフェースをバインドコンテキストに自動的に登録する。クライアントは BSCO_OPTION
のフラグを指定して、受け取ることができるコールバック通知の種類を示せる。特定の通知を受け取りたくない場合、クライアントは該当コールバックメソッドを空のスタブ
(E_NOTIMPL を返す)
として実装することを選べるが、それらは呼び出されるべきではない。RegisterBindStatusCallback
関数もバインドコンテキストにコールバックインターフェースを登録するために使用できる。


%index
CreateAsyncBindCtxEx
(no summary)
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
FORMATETC 構造体の静的配列に対して IEnumFORMATETC を実装するオブジェクトを作成する。
%prm
cfmtetc, rgfmtetc, ppenumfmtetc
cfmtetc : [int] rgfmtetc パラメータで指定される静的配列内の FORMATETC 構造体の数。cfmtetc パラメータは 0 にできない。
rgfmtetc : [var] FORMATETC 構造体の静的配列へのポインタ。
ppenumfmtetc : [var] 列挙オブジェクトへのインターフェースポインタを受け取る IEnumFORMATETC ポインタ変数のアドレス。
%inst
FORMATETC 構造体の静的配列に対して IEnumFORMATETC を実装するオブジェクトを作成する。

[戻り値]
この関数は成功時に S_OK を返す。その他の戻り値としては次のようなものがある。
このドキュメントは省略されている。

[備考]
CreateFormatEnumerator 関数は、FORMATETC 構造体の静的配列に対して IEnumFORMATETC
を実装する列挙オブジェクトを作成する。cfmtetc
パラメータで構造体の個数を指定する。返されたポインタを通じて、標準の列挙メソッドを呼び出して構造体を列挙できる。


%index
CreateIUriBuilder
(no summary)
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
%prm
pMkCtx, szURL, ppmk
pMkCtx : [var] 
szURL : [wstr] 
ppmk : [var] 
%inst



%index
CreateURLMonikerEx
(no summary)
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
%prm
rgszTypes, rgcfTypes
rgszTypes : [str] 
rgcfTypes : [var] 
%inst



%index
FindMediaTypeClass
(no summary)
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
%prm
szURL, pClsID
szURL : [wstr] 
pClsID : [var] 
%inst



%index
GetComponentIDFromCLSSPEC
(no summary)
%prm
pClassspec, ppszComponentID
pClassspec : [var] 
ppszComponentID : [var] 
%inst



%index
GetSoftwareUpdateInfo
(no summary)
%prm
szDistUnit, psdi
szDistUnit : [wstr] 
psdi : [var] 
%inst



%index
HlinkGoBack
(no summary)
%prm
pUnk
pUnk : [var] 
%inst



%index
HlinkGoForward
(no summary)
%prm
pUnk
pUnk : [var] 
%inst



%index
HlinkNavigateMoniker
(no summary)
%prm
pUnk, pmkTarget
pUnk : [var] 
pmkTarget : [var] 
%inst



%index
HlinkNavigateString
(no summary)
%prm
pUnk, szTarget
pUnk : [var] 
szTarget : [wstr] 
%inst



%index
HlinkSimpleNavigateToMoniker
(no summary)
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
%prm

%inst



%index
IEInstallScope
(no summary)
%prm
pdwScope
pdwScope : [var] 
%inst



%index
IsAsyncMoniker
(no summary)
%prm
pmk
pmk : [var] 
%inst



%index
IsLoggingEnabledW
(no summary)
%prm
pwszUrl
pwszUrl : [wstr] 
%inst



%index
IsValidURL
(no summary)
%prm
pBC, szURL, dwReserved
pBC : [var] 
szURL : [wstr] 
dwReserved : [int] 
%inst



%index
MkParseDisplayNameEx
(no summary)
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
%prm
dwOption, pszUAOut, cbSize
dwOption : [int] 
pszUAOut : [str] 
cbSize : [var] 
%inst



%index
RegisterBindStatusCallback
(no summary)
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
%prm
pBC, pEFetc, reserved
pBC : [var] 
pEFetc : [var] 
reserved : [int] 
%inst



%index
RegisterMediaTypeClass
(no summary)
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
%prm
ctypes, rgszTypes, rgcfTypes
ctypes : [int] 
rgszTypes : [var] 
rgcfTypes : [var] 
%inst



%index
ReleaseBindInfo
(no summary)
%prm
pbindinfo
pbindinfo : [var] 
%inst



%index
RevokeBindStatusCallback
(no summary)
%prm
pBC, pBSCb
pBC : [var] 
pBSCb : [var] 
%inst



%index
RevokeFormatEnumerator
(no summary)
%prm
pBC, pEFetc
pBC : [var] 
pEFetc : [var] 
%inst



%index
SetAccessForIEAppContainer
(no summary)
%prm
hObject, ieObjectType, dwAccessMask
hObject : [intptr] 
ieObjectType : [int] 
dwAccessMask : [int] 
%inst



%index
SetSoftwareUpdateAdvertisementState
(no summary)
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
%prm
lpLogginginfo
lpLogginginfo : [var] 
%inst


