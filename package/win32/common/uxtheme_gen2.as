; ============================================================
;   Auto-generated from CsWin32 / win32metadata
;   dll:    uxtheme.dll
;   tool:   tools/cswin32_bridge/gen_from_cswin32.py
;   Do not edit by hand ? regenerate via the python script.
;   Needs hsp3net (intptr / NSTRUCT / wstr).
; ============================================================

#ifndef __uxtheme_gen2_as__
#define global __uxtheme_gen2_as__

; Shared NSTRUCT + #define constants for all win32 *_gen2.as
#include "win32_types_gen2.as"

;--- functions ---
#uselib "uxtheme.dll"
; nint BeginBufferedAnimation(winmdroot.Foundation.HWND hwnd, winmdroot.Graphics.Gdi.HDC hdcTarget, winmdroot.Foundation.RECT* prcTarget, winmdroot.UI.Controls.BP_BUFFERFORMAT dwFormat, [Optional] winmdroot.UI.Controls.BP_PAINTPARAMS* pPaintParams, winmdroot.UI.Controls.BP_ANIMATIONPARAMS* pAnimationParams, winmdroot.Graphics.Gdi.HDC* phdcFrom, winmdroot.Graphics.Gdi.HDC* phdcTo)
#cfunc global BeginBufferedAnimation "BeginBufferedAnimation" intptr, intptr, var, int, var, var, intptr, intptr

; nint BeginBufferedPaint(winmdroot.Graphics.Gdi.HDC hdcTarget, winmdroot.Foundation.RECT* prcTarget, winmdroot.UI.Controls.BP_BUFFERFORMAT dwFormat, [Optional] winmdroot.UI.Controls.BP_PAINTPARAMS* pPaintParams, winmdroot.Graphics.Gdi.HDC* phdc)
#cfunc global BeginBufferedPaint "BeginBufferedPaint" intptr, var, int, var, intptr

; winmdroot.Foundation.BOOL BeginPanningFeedback(winmdroot.Foundation.HWND hwnd)
#cfunc global BeginPanningFeedback "BeginPanningFeedback" intptr

; winmdroot.Foundation.HRESULT BufferedPaintClear(nint hBufferedPaint, [Optional] winmdroot.Foundation.RECT* prc)
#cfunc global BufferedPaintClear "BufferedPaintClear" int, var

; winmdroot.Foundation.HRESULT BufferedPaintInit()
#cfunc global BufferedPaintInit "BufferedPaintInit"

; winmdroot.Foundation.BOOL BufferedPaintRenderAnimation(winmdroot.Foundation.HWND hwnd, winmdroot.Graphics.Gdi.HDC hdcTarget)
#cfunc global BufferedPaintRenderAnimation "BufferedPaintRenderAnimation" intptr, intptr

; winmdroot.Foundation.HRESULT BufferedPaintSetAlpha(nint hBufferedPaint, [Optional] winmdroot.Foundation.RECT* prc, byte alpha)
#cfunc global BufferedPaintSetAlpha "BufferedPaintSetAlpha" int, var, int

; winmdroot.Foundation.HRESULT BufferedPaintStopAllAnimations(winmdroot.Foundation.HWND hwnd)
#cfunc global BufferedPaintStopAllAnimations "BufferedPaintStopAllAnimations" intptr

; winmdroot.Foundation.HRESULT BufferedPaintUnInit()
#cfunc global BufferedPaintUnInit "BufferedPaintUnInit"

; winmdroot.Foundation.HRESULT CloseThemeData(winmdroot.UI.Controls.HTHEME hTheme)
#cfunc global CloseThemeData "CloseThemeData" intptr

; winmdroot.Foundation.HRESULT DrawThemeBackground(winmdroot.UI.Controls.HTHEME hTheme, winmdroot.Graphics.Gdi.HDC hdc, int iPartId, int iStateId, winmdroot.Foundation.RECT* pRect, [Optional] winmdroot.Foundation.RECT* pClipRect)
#cfunc global DrawThemeBackground "DrawThemeBackground" intptr, intptr, int, int, var, var

; winmdroot.Foundation.HRESULT DrawThemeBackgroundEx(winmdroot.UI.Controls.HTHEME hTheme, winmdroot.Graphics.Gdi.HDC hdc, int iPartId, int iStateId, winmdroot.Foundation.RECT* pRect, [Optional] winmdroot.UI.Controls.DTBGOPTS* pOptions)
#cfunc global DrawThemeBackgroundEx "DrawThemeBackgroundEx" intptr, intptr, int, int, var, var

; winmdroot.Foundation.HRESULT DrawThemeEdge(winmdroot.UI.Controls.HTHEME hTheme, winmdroot.Graphics.Gdi.HDC hdc, int iPartId, int iStateId, winmdroot.Foundation.RECT* pDestRect, winmdroot.Graphics.Gdi.DRAWEDGE_FLAGS uEdge, winmdroot.Graphics.Gdi.DRAW_EDGE_FLAGS uFlags, [Optional] winmdroot.Foundation.RECT* pContentRect)
#cfunc global DrawThemeEdge "DrawThemeEdge" intptr, intptr, int, int, var, int, int, var

; winmdroot.Foundation.HRESULT DrawThemeIcon(winmdroot.UI.Controls.HTHEME hTheme, winmdroot.Graphics.Gdi.HDC hdc, int iPartId, int iStateId, winmdroot.Foundation.RECT* pRect, winmdroot.UI.Controls.HIMAGELIST himl, int iImageIndex)
#cfunc global DrawThemeIcon "DrawThemeIcon" intptr, intptr, int, int, var, intptr, int

; winmdroot.Foundation.HRESULT DrawThemeParentBackground(winmdroot.Foundation.HWND hwnd, winmdroot.Graphics.Gdi.HDC hdc, [Optional] winmdroot.Foundation.RECT* prc)
#cfunc global DrawThemeParentBackground "DrawThemeParentBackground" intptr, intptr, var

; winmdroot.Foundation.HRESULT DrawThemeParentBackgroundEx(winmdroot.Foundation.HWND hwnd, winmdroot.Graphics.Gdi.HDC hdc, winmdroot.UI.Controls.DRAW_THEME_PARENT_BACKGROUND_FLAGS dwFlags, [Optional] winmdroot.Foundation.RECT* prc)
#cfunc global DrawThemeParentBackgroundEx "DrawThemeParentBackgroundEx" intptr, intptr, int, var

; winmdroot.Foundation.HRESULT DrawThemeText(winmdroot.UI.Controls.HTHEME hTheme, winmdroot.Graphics.Gdi.HDC hdc, int iPartId, int iStateId, winmdroot.Foundation.PCWSTR pszText, int cchText, winmdroot.Graphics.Gdi.DRAW_TEXT_FORMAT dwTextFlags, uint dwTextFlags2, winmdroot.Foundation.RECT* pRect)
#cfunc global DrawThemeText "DrawThemeText" intptr, intptr, int, int, wstr, int, int, int, var

; winmdroot.Foundation.HRESULT DrawThemeTextEx(winmdroot.UI.Controls.HTHEME hTheme, winmdroot.Graphics.Gdi.HDC hdc, int iPartId, int iStateId, winmdroot.Foundation.PCWSTR pszText, int cchText, winmdroot.Graphics.Gdi.DRAW_TEXT_FORMAT dwTextFlags, winmdroot.Foundation.RECT* pRect, [Optional] winmdroot.UI.Controls.DTTOPTS* pOptions)
#cfunc global DrawThemeTextEx "DrawThemeTextEx" intptr, intptr, int, int, wstr, int, int, var, var

; winmdroot.Foundation.HRESULT EnableThemeDialogTexture(winmdroot.Foundation.HWND hwnd, uint dwFlags)
#cfunc global EnableThemeDialogTexture "EnableThemeDialogTexture" intptr, int

; winmdroot.Foundation.HRESULT EnableTheming(winmdroot.Foundation.BOOL fEnable)
#cfunc global EnableTheming "EnableTheming" int

; winmdroot.Foundation.HRESULT EndBufferedAnimation(nint hbpAnimation, winmdroot.Foundation.BOOL fUpdateTarget)
#cfunc global EndBufferedAnimation "EndBufferedAnimation" int, int

; winmdroot.Foundation.HRESULT EndBufferedPaint(nint hBufferedPaint, winmdroot.Foundation.BOOL fUpdateTarget)
#cfunc global EndBufferedPaint "EndBufferedPaint" int, int

; winmdroot.Foundation.BOOL EndPanningFeedback(winmdroot.Foundation.HWND hwnd, winmdroot.Foundation.BOOL fAnimateBack)
#cfunc global EndPanningFeedback "EndPanningFeedback" intptr, int

; winmdroot.Foundation.HRESULT GetBufferedPaintBits(nint hBufferedPaint, winmdroot.Graphics.Gdi.RGBQUAD** ppbBuffer, int* pcxRow)
#cfunc global GetBufferedPaintBits "GetBufferedPaintBits" int, var, var

; winmdroot.Graphics.Gdi.HDC GetBufferedPaintDC(nint hBufferedPaint)
#cfunc global GetBufferedPaintDC "GetBufferedPaintDC" int

; winmdroot.Graphics.Gdi.HDC GetBufferedPaintTargetDC(nint hBufferedPaint)
#cfunc global GetBufferedPaintTargetDC "GetBufferedPaintTargetDC" int

; winmdroot.Foundation.HRESULT GetBufferedPaintTargetRect(nint hBufferedPaint, winmdroot.Foundation.RECT* prc)
#cfunc global GetBufferedPaintTargetRect "GetBufferedPaintTargetRect" int, var

; winmdroot.Foundation.HRESULT GetCurrentThemeName(winmdroot.Foundation.PWSTR pszThemeFileName, int cchMaxNameChars, winmdroot.Foundation.PWSTR pszColorBuff, int cchMaxColorChars, winmdroot.Foundation.PWSTR pszSizeBuff, int cchMaxSizeChars)
#cfunc global GetCurrentThemeName "GetCurrentThemeName" wstr, int, wstr, int, wstr, int

; winmdroot.Foundation.HRESULT GetThemeAnimationProperty(winmdroot.UI.Controls.HTHEME hTheme, int iStoryboardId, int iTargetId, winmdroot.UI.Controls.TA_PROPERTY eProperty, [Optional] void* pvProperty, uint cbSize, uint* pcbSizeOut)
#cfunc global GetThemeAnimationProperty "GetThemeAnimationProperty" intptr, int, int, int, intptr, int, var

; winmdroot.Foundation.HRESULT GetThemeAnimationTransform(winmdroot.UI.Controls.HTHEME hTheme, int iStoryboardId, int iTargetId, uint dwTransformIndex, [Optional] winmdroot.UI.Controls.TA_TRANSFORM* pTransform, uint cbSize, uint* pcbSizeOut)
#cfunc global GetThemeAnimationTransform "GetThemeAnimationTransform" intptr, int, int, int, var, int, var

; winmdroot.UI.Controls.SET_THEME_APP_PROPERTIES_FLAGS GetThemeAppProperties()
#cfunc global GetThemeAppProperties "GetThemeAppProperties"

; winmdroot.Foundation.HRESULT GetThemeBackgroundContentRect(winmdroot.UI.Controls.HTHEME hTheme, winmdroot.Graphics.Gdi.HDC hdc, int iPartId, int iStateId, winmdroot.Foundation.RECT* pBoundingRect, winmdroot.Foundation.RECT* pContentRect)
#cfunc global GetThemeBackgroundContentRect "GetThemeBackgroundContentRect" intptr, intptr, int, int, var, var

; winmdroot.Foundation.HRESULT GetThemeBackgroundExtent(winmdroot.UI.Controls.HTHEME hTheme, winmdroot.Graphics.Gdi.HDC hdc, int iPartId, int iStateId, winmdroot.Foundation.RECT* pContentRect, winmdroot.Foundation.RECT* pExtentRect)
#cfunc global GetThemeBackgroundExtent "GetThemeBackgroundExtent" intptr, intptr, int, int, var, var

; winmdroot.Foundation.HRESULT GetThemeBackgroundRegion(winmdroot.UI.Controls.HTHEME hTheme, winmdroot.Graphics.Gdi.HDC hdc, int iPartId, int iStateId, winmdroot.Foundation.RECT* pRect, winmdroot.Graphics.Gdi.HRGN* pRegion)
#cfunc global GetThemeBackgroundRegion "GetThemeBackgroundRegion" intptr, intptr, int, int, var, intptr

; winmdroot.Foundation.HRESULT GetThemeBitmap(winmdroot.UI.Controls.HTHEME hTheme, int iPartId, int iStateId, int iPropId, winmdroot.UI.Controls.GET_THEME_BITMAP_FLAGS dwFlags, winmdroot.Graphics.Gdi.HBITMAP* phBitmap)
#cfunc global GetThemeBitmap "GetThemeBitmap" intptr, int, int, int, int, intptr

; winmdroot.Foundation.HRESULT GetThemeBool(winmdroot.UI.Controls.HTHEME hTheme, int iPartId, int iStateId, int iPropId, winmdroot.Foundation.BOOL* pfVal)
#cfunc global GetThemeBool "GetThemeBool" intptr, int, int, int, var

; winmdroot.Foundation.HRESULT GetThemeColor(winmdroot.UI.Controls.HTHEME hTheme, int iPartId, int iStateId, int iPropId, winmdroot.Foundation.COLORREF* pColor)
#cfunc global GetThemeColor "GetThemeColor" intptr, int, int, int, var

; winmdroot.Foundation.HRESULT GetThemeDocumentationProperty(winmdroot.Foundation.PCWSTR pszThemeName, winmdroot.Foundation.PCWSTR pszPropertyName, winmdroot.Foundation.PWSTR pszValueBuff, int cchMaxValChars)
#cfunc global GetThemeDocumentationProperty "GetThemeDocumentationProperty" wstr, wstr, wstr, int

; winmdroot.Foundation.HRESULT GetThemeEnumValue(winmdroot.UI.Controls.HTHEME hTheme, int iPartId, int iStateId, int iPropId, int* piVal)
#cfunc global GetThemeEnumValue "GetThemeEnumValue" intptr, int, int, int, var

; winmdroot.Foundation.HRESULT GetThemeFilename(winmdroot.UI.Controls.HTHEME hTheme, int iPartId, int iStateId, int iPropId, winmdroot.Foundation.PWSTR pszThemeFileName, int cchMaxBuffChars)
#cfunc global GetThemeFilename "GetThemeFilename" intptr, int, int, int, wstr, int

; winmdroot.Foundation.HRESULT GetThemeFont(winmdroot.UI.Controls.HTHEME hTheme, winmdroot.Graphics.Gdi.HDC hdc, int iPartId, int iStateId, int iPropId, winmdroot.Graphics.Gdi.LOGFONTW* pFont)
#cfunc global GetThemeFont "GetThemeFont" intptr, intptr, int, int, int, var

; winmdroot.Foundation.HRESULT GetThemeInt(winmdroot.UI.Controls.HTHEME hTheme, int iPartId, int iStateId, int iPropId, int* piVal)
#cfunc global GetThemeInt "GetThemeInt" intptr, int, int, int, var

; winmdroot.Foundation.HRESULT GetThemeIntList(winmdroot.UI.Controls.HTHEME hTheme, int iPartId, int iStateId, int iPropId, winmdroot.UI.Controls.INTLIST* pIntList)
#cfunc global GetThemeIntList "GetThemeIntList" intptr, int, int, int, var

; winmdroot.Foundation.HRESULT GetThemeMargins(winmdroot.UI.Controls.HTHEME hTheme, winmdroot.Graphics.Gdi.HDC hdc, int iPartId, int iStateId, int iPropId, [Optional] winmdroot.Foundation.RECT* prc, winmdroot.UI.Controls.MARGINS* pMargins)
#cfunc global GetThemeMargins "GetThemeMargins" intptr, intptr, int, int, int, var, var

; winmdroot.Foundation.HRESULT GetThemeMetric(winmdroot.UI.Controls.HTHEME hTheme, winmdroot.Graphics.Gdi.HDC hdc, int iPartId, int iStateId, int iPropId, int* piVal)
#cfunc global GetThemeMetric "GetThemeMetric" intptr, intptr, int, int, int, var

; winmdroot.Foundation.HRESULT GetThemePartSize(winmdroot.UI.Controls.HTHEME hTheme, winmdroot.Graphics.Gdi.HDC hdc, int iPartId, int iStateId, [Optional] winmdroot.Foundation.RECT* prc, winmdroot.UI.Controls.THEMESIZE eSize, winmdroot.Foundation.SIZE* psz)
#cfunc global GetThemePartSize "GetThemePartSize" intptr, intptr, int, int, var, int, var

; winmdroot.Foundation.HRESULT GetThemePosition(winmdroot.UI.Controls.HTHEME hTheme, int iPartId, int iStateId, int iPropId, global::System.Drawing.Point* pPoint)
#cfunc global GetThemePosition "GetThemePosition" intptr, int, int, int, var

; winmdroot.Foundation.HRESULT GetThemePropertyOrigin(winmdroot.UI.Controls.HTHEME hTheme, int iPartId, int iStateId, int iPropId, winmdroot.UI.Controls.PROPERTYORIGIN* pOrigin)
#cfunc global GetThemePropertyOrigin "GetThemePropertyOrigin" intptr, int, int, int, var

; winmdroot.Foundation.HRESULT GetThemeRect(winmdroot.UI.Controls.HTHEME hTheme, int iPartId, int iStateId, int iPropId, winmdroot.Foundation.RECT* pRect)
#cfunc global GetThemeRect "GetThemeRect" intptr, int, int, int, var

; winmdroot.Foundation.HRESULT GetThemeStream(winmdroot.UI.Controls.HTHEME hTheme, int iPartId, int iStateId, int iPropId, void** ppvStream, [Optional] uint* pcbStream, winmdroot.Foundation.HINSTANCE hInst)
#cfunc global GetThemeStream "GetThemeStream" intptr, int, int, int, var, var, intptr

; winmdroot.Foundation.HRESULT GetThemeString(winmdroot.UI.Controls.HTHEME hTheme, int iPartId, int iStateId, int iPropId, winmdroot.Foundation.PWSTR pszBuff, int cchMaxBuffChars)
#cfunc global GetThemeString "GetThemeString" intptr, int, int, int, wstr, int

; winmdroot.Foundation.BOOL GetThemeSysBool(winmdroot.UI.Controls.HTHEME hTheme, int iBoolId)
#cfunc global GetThemeSysBool "GetThemeSysBool" intptr, int

; winmdroot.Foundation.COLORREF GetThemeSysColor(winmdroot.UI.Controls.HTHEME hTheme, int iColorId)
#cfunc global GetThemeSysColor "GetThemeSysColor" intptr, int

; winmdroot.Graphics.Gdi.HBRUSH GetThemeSysColorBrush(winmdroot.UI.Controls.HTHEME hTheme, int iColorId)
#cfunc global GetThemeSysColorBrush "GetThemeSysColorBrush" intptr, int

; winmdroot.Foundation.HRESULT GetThemeSysFont(winmdroot.UI.Controls.HTHEME hTheme, int iFontId, winmdroot.Graphics.Gdi.LOGFONTW* plf)
#cfunc global GetThemeSysFont "GetThemeSysFont" intptr, int, var

; winmdroot.Foundation.HRESULT GetThemeSysInt(winmdroot.UI.Controls.HTHEME hTheme, int iIntId, int* piValue)
#cfunc global GetThemeSysInt "GetThemeSysInt" intptr, int, var

; int GetThemeSysSize(winmdroot.UI.Controls.HTHEME hTheme, int iSizeId)
#cfunc global GetThemeSysSize "GetThemeSysSize" intptr, int

; winmdroot.Foundation.HRESULT GetThemeSysString(winmdroot.UI.Controls.HTHEME hTheme, int iStringId, winmdroot.Foundation.PWSTR pszStringBuff, int cchMaxStringChars)
#cfunc global GetThemeSysString "GetThemeSysString" intptr, int, wstr, int

; winmdroot.Foundation.HRESULT GetThemeTextExtent(winmdroot.UI.Controls.HTHEME hTheme, winmdroot.Graphics.Gdi.HDC hdc, int iPartId, int iStateId, winmdroot.Foundation.PCWSTR pszText, int cchCharCount, winmdroot.Graphics.Gdi.DRAW_TEXT_FORMAT dwTextFlags, [Optional] winmdroot.Foundation.RECT* pBoundingRect, winmdroot.Foundation.RECT* pExtentRect)
#cfunc global GetThemeTextExtent "GetThemeTextExtent" intptr, intptr, int, int, wstr, int, int, var, var

; winmdroot.Foundation.HRESULT GetThemeTextMetrics(winmdroot.UI.Controls.HTHEME hTheme, winmdroot.Graphics.Gdi.HDC hdc, int iPartId, int iStateId, winmdroot.Graphics.Gdi.TEXTMETRICW* ptm)
#cfunc global GetThemeTextMetrics "GetThemeTextMetrics" intptr, intptr, int, int, var

; winmdroot.Foundation.HRESULT GetThemeTimingFunction(winmdroot.UI.Controls.HTHEME hTheme, int iTimingFunctionId, [Optional] winmdroot.UI.Controls.TA_TIMINGFUNCTION* pTimingFunction, uint cbSize, uint* pcbSizeOut)
#cfunc global GetThemeTimingFunction "GetThemeTimingFunction" intptr, int, var, int, var

; winmdroot.Foundation.HRESULT GetThemeTransitionDuration(winmdroot.UI.Controls.HTHEME hTheme, int iPartId, int iStateIdFrom, int iStateIdTo, int iPropId, uint* pdwDuration)
#cfunc global GetThemeTransitionDuration "GetThemeTransitionDuration" intptr, int, int, int, int, var

; winmdroot.UI.Controls.HTHEME GetWindowTheme(winmdroot.Foundation.HWND hwnd)
#cfunc global GetWindowTheme "GetWindowTheme" intptr

; winmdroot.Foundation.HRESULT HitTestThemeBackground(winmdroot.UI.Controls.HTHEME hTheme, winmdroot.Graphics.Gdi.HDC hdc, int iPartId, int iStateId, winmdroot.UI.Controls.HIT_TEST_BACKGROUND_OPTIONS dwOptions, winmdroot.Foundation.RECT* pRect, winmdroot.Graphics.Gdi.HRGN hrgn, global::System.Drawing.Point ptTest, ushort* pwHitTestCode)
#cfunc global HitTestThemeBackground "HitTestThemeBackground" intptr, intptr, int, int, int, var, intptr, int, var

; winmdroot.Foundation.BOOL IsAppThemed()
#cfunc global IsAppThemed "IsAppThemed"

; winmdroot.Foundation.BOOL IsCompositionActive()
#cfunc global IsCompositionActive "IsCompositionActive"

; winmdroot.Foundation.BOOL IsThemeActive()
#cfunc global IsThemeActive "IsThemeActive"

; winmdroot.Foundation.BOOL IsThemeBackgroundPartiallyTransparent(winmdroot.UI.Controls.HTHEME hTheme, int iPartId, int iStateId)
#cfunc global IsThemeBackgroundPartiallyTransparent "IsThemeBackgroundPartiallyTransparent" intptr, int, int

; winmdroot.Foundation.BOOL IsThemeDialogTextureEnabled(winmdroot.Foundation.HWND hwnd)
#cfunc global IsThemeDialogTextureEnabled "IsThemeDialogTextureEnabled" intptr

; winmdroot.Foundation.BOOL IsThemePartDefined(winmdroot.UI.Controls.HTHEME hTheme, int iPartId, int iStateId)
#cfunc global IsThemePartDefined "IsThemePartDefined" intptr, int, int

; winmdroot.UI.Controls.HTHEME OpenThemeData(winmdroot.Foundation.HWND hwnd, winmdroot.Foundation.PCWSTR pszClassList)
#cfunc global OpenThemeData "OpenThemeData" intptr, wstr

; winmdroot.UI.Controls.HTHEME OpenThemeDataEx(winmdroot.Foundation.HWND hwnd, winmdroot.Foundation.PCWSTR pszClassList, winmdroot.UI.Controls.OPEN_THEME_DATA_FLAGS dwFlags)
#cfunc global OpenThemeDataEx "OpenThemeDataEx" intptr, wstr, int

; winmdroot.UI.Controls.HTHEME OpenThemeDataForDpi(winmdroot.Foundation.HWND hwnd, winmdroot.Foundation.PCWSTR pszClassList, uint dpi)
#cfunc global OpenThemeDataForDpi "OpenThemeDataForDpi" intptr, wstr, int

; void SetThemeAppProperties(winmdroot.UI.Controls.SET_THEME_APP_PROPERTIES_FLAGS dwFlags)
#func global SetThemeAppProperties "SetThemeAppProperties" int

; winmdroot.Foundation.HRESULT SetWindowTheme(winmdroot.Foundation.HWND hwnd, winmdroot.Foundation.PCWSTR pszSubAppName, winmdroot.Foundation.PCWSTR pszSubIdList)
#cfunc global SetWindowTheme "SetWindowTheme" intptr, wstr, wstr

; winmdroot.Foundation.HRESULT SetWindowThemeAttribute(winmdroot.Foundation.HWND hwnd, winmdroot.UI.Controls.WINDOWTHEMEATTRIBUTETYPE eAttribute, void* pvAttribute, uint cbAttribute)
#cfunc global SetWindowThemeAttribute "SetWindowThemeAttribute" intptr, int, intptr, int

; winmdroot.Foundation.BOOL UpdatePanningFeedback(winmdroot.Foundation.HWND hwnd, int lTotalOverpanOffsetX, int lTotalOverpanOffsetY, winmdroot.Foundation.BOOL fInInertia)
#cfunc global UpdatePanningFeedback "UpdatePanningFeedback" intptr, int, int, int

#endif
