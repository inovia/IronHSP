; ============================================================
;   uxtheme.dll ヘルプ (CsWin32 / win32metadata から自動抽出)
;   docs_ja.json に日本語訳があればそちらを使用、無ければ英語原文。
;   翻訳を追加するときは docs_ja.json を編集して再生成。
; ============================================================

%index
CloseThemeData
Closes the theme data handle.
%group
Win32 uxtheme
%prm
hTheme
hTheme : [intptr] Type: HTHEME Handle to a window's specified theme data. Use OpenThemeData to create an HTHEME.
%inst
Closes the theme data handle.

[戻り値]
Type: HRESULT If this function succeeds, it returns S_OK. Otherwise,
it returns an HRESULT error code.

[備考]
The CloseThemeData function should be called when a window that has a
visual style applied is destroyed. This function should also be
called whenever a window receives a WM_THEMECHANGED message. This
call should be followed by an attempt to create a new theme data
handle if a call to the IsThemeActive function returns TRUE.


%index
DrawThemeBackground
Draws the border and fill defined by the visual style for the specified control part.
%group
Win32 uxtheme
%prm
hTheme, hdc, iPartId, iStateId, pRect, pClipRect
hTheme : [intptr] Type: HTHEME Handle to a window's specified theme data. Use OpenThemeData to create an HTHEME.
hdc : [intptr] Type: HDC HDC used for drawing the theme-defined background image.
iPartId : [int] Type: int Value of type int that specifies the part to draw. See Parts and States.
iStateId : [int] Type: int Value of type int that specifies the state of the part to draw. See Parts and States.
pRect : [var] Type: const RECT* Pointer to a RECT structure that contains the rectangle, in logical coordinates, in which the background image is drawn.
pClipRect : [var] Type: const RECT* Pointer to a RECT structure that contains a clipping rectangle. This parameter may be set to NULL.
%inst
Draws the border and fill defined by the visual style for the
specified control part.

[戻り値]
Type: HRESULT If this function succeeds, it returns S_OK. Otherwise,
it returns an HRESULT error code.

[備考]
Drawing operations are scaled to fit and not exceed the rectangle
specified in pRect. Your application should not draw outside the
rectangle specified by pClipRect.


%index
DrawThemeText
Draws text using the color and font defined by the visual style.
%group
Win32 uxtheme
%prm
hTheme, hdc, iPartId, iStateId, pszText, cchText, dwTextFlags, dwTextFlags2, pRect
hTheme : [intptr] Type: HTHEME Handle to a window's theme data. Use OpenThemeData to create an HTHEME.
hdc : [intptr] Type: HDC HDC to use for drawing.
iPartId : [int] Type: int The control part that has the desired text appearance. See Parts and States. If this value is 0, the text is drawn in the default font, or a font selected into the device context.
iStateId : [int] Type: int The control state that has the desired text appearance. See Parts and States.
pszText : [wstr] Type: LPCWSTR Pointer to a string that contains the text to draw.
cchText : [int] Type: int Value of type int that contains the number of characters to draw. If the parameter is set to -1, all the characters in the string are drawn.
dwTextFlags : [int] Type: DWORD DWORD that contains one or more values that specify the string's formatting. See Format Values for possible parameter values. Note??DrawThemeText does not support DT_CALCRECT.  However, DrawThemeTextEx does support DT_CALCRECT.
dwTextFlags2 : [int] Type: DWORD Not used. Set to zero.
pRect : [var] Type: LPCRECT Pointer to a RECT structure that contains the rectangle, in logical coordinates, in which the text is to be drawn.  It is recommended to use pExtentRect from GetThemeTextExtent to retrieve the correct coordinates.
%inst
Draws text using the color and font defined by the visual style.

[戻り値]
Type: HRESULT If this function succeeds, it returns S_OK. Otherwise,
it returns an HRESULT error code.

[備考]
The function always uses the themed font for the specified part and
state if one is defined. Otherwise it uses the font currently
selected into the device context. To find out if a themed font is
defined, you can call GetThemeFont or GetThemePropertyOrigin with
TMT_FONT as the property identifier.


%index
GetThemeColor
Retrieves the value of a color property.
%group
Win32 uxtheme
%prm
hTheme, iPartId, iStateId, iPropId, pColor
hTheme : [intptr] Type: HTHEME Handle to a window's specified theme data. Use OpenThemeData to create an HTHEME.
iPartId : [int] Type: int Value of type int that specifies the part that contains the color property. See Parts and States.
iStateId : [int] Type: int Value of type int that specifies the state of the part. See Parts and States.
iPropId : [int] Type: int Value of type int that specifies the property to retrieve. For a list of possible values, see Property Identifiers.
pColor : [var] Type: COLORREF* Pointer to a COLORREF structure that receives the color value.
%inst
Retrieves the value of a color property.

[戻り値]
Type: HRESULT If this function succeeds, it returns S_OK. Otherwise,
it returns an HRESULT error code.


%index
GetThemePartSize
Calculates the original size of the part defined by a visual style.
%group
Win32 uxtheme
%prm
hTheme, hdc, iPartId, iStateId, prc, eSize, psz
hTheme : [intptr] Type: HTHEME Handle to a window's specified theme data. Use OpenThemeData to create an HTHEME.
hdc : [intptr] Type: HDC HDC to select fonts into.
iPartId : [int] Type: int Value of type int that specifies the part to calculate the size of. See Parts and States.
iStateId : [int] Type: int Value of type int that specifies the state of the part. See Parts and States.
prc : [var] Type: LPCRECT Pointer to a RECT structure that contains the rectangle used for the part drawing destination. This parameter may be set to NULL.
eSize : [int] 
psz : [var] Type: SIZE* Pointer to a SIZE structure that receives the dimensions of the specified part.
%inst
Calculates the original size of the part defined by a visual style.

[戻り値]
Type: HRESULT If this function succeeds, it returns S_OK. Otherwise,
it returns an HRESULT error code.


%index
IsAppThemed
Reports whether the current application's user interface displays using visual styles.
%group
Win32 uxtheme
%prm

%inst
Reports whether the current application's user interface displays
using visual styles.

[戻り値]
Type: BOOL Returns one of the following values.
This doc was truncated.

[備考]
Prior to Windows 8, a visual style can be turned off in Control
Panel, so that an application can support visual styles but not have
a visual style applied at a given time. In Windows 8, it is not
possible to turn off visual styles.
Do not call this function during DllMain or global objects
constructors. This may cause invalid return values.


%index
IsThemeActive
Tests if a visual style for the current application is active.
%group
Win32 uxtheme
%prm

%inst
Tests if a visual style for the current application is active.

[戻り値]
Type: BOOL Returns one of the following values.
This doc was truncated.

[備考]
Do not call this function during DllMain or global objects
constructors. This may cause invalid return values.


%index
OpenThemeData
Opens the theme data for a window and its associated class.
%group
Win32 uxtheme
%prm
hwnd, pszClassList
hwnd : [intptr] Type: HWND Handle of the window for which theme data is required.
pszClassList : [wstr] Type: LPCWSTR Pointer to a string that contains a semicolon-separated list of classes.
%inst
Opens the theme data for a window and its associated class.

[戻り値]
Type: HTHEME OpenThemeData tries to match each class, one at a time,
to a class data section in the active theme. If a match is found, an
associated HTHEME handle is returned. If no match is found NULL is
returned.

[備考]
The pszClassList parameter contains a list, not just a single name,
to provide the class an opportunity to get the best match between the
class and the current visual style. For example, a button might pass
L"OkButton;Button" if its ID is ID_OK. If the current visual style
has an entry for OkButton, that is used; otherwise no visual style is
applied. Class names for the Aero theme are defined in AeroStyle.xml.


%index
SetWindowTheme
Causes a window to use a different set of visual style information than its class normally uses.
%group
Win32 uxtheme
%prm
hwnd, pszSubAppName, pszSubIdList
hwnd : [intptr] Type: HWND Handle to the window whose visual style information is to be changed.
pszSubAppName : [wstr] Type: LPCWSTR Pointer to a string that contains the application name to use in place of the calling application's name. If this parameter is NULL, the calling application's name is used.
pszSubIdList : [wstr] Type: LPCWSTR Pointer to a string that contains a semicolon-separated list of CLSID names to use in place of the actual list passed by the window's class. If this parameter is NULL, the ID list from the calling class is used.
%inst
Causes a window to use a different set of visual style information
than its class normally uses.

[戻り値]
Type: HRESULT If this function succeeds, it returns S_OK. Otherwise,
it returns an HRESULT error code.

[備考]
The theme manager retains the pszSubAppName and the pszSubIdList
associations through the lifetime of the window, even if visual
styles subsequently change. The window is sent a WM_THEMECHANGED
message at the end of a SetWindowTheme call, so that the new visual
style can be found and applied.
When pszSubAppName and pszSubIdList are NULL, the theme manager
removes the previously applied associations. You can prevent visual
styles from being applied to a specified window by specifying an
empty string, (L" "), which does not match any section entries.

