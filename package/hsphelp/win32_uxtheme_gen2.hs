; ============================================================
;   uxtheme.dll ヘルプ (CsWin32 / win32metadata から自動抽出)
;   docs_ja.json に日本語訳があればそちらを使用、無ければ英語原文。
;   翻訳を追加するときは docs_ja.json を編集して再生成。
; ============================================================

%index
BeginBufferedAnimation
Begins a buffered animation operation. The animation consists of a cross-fade between the contents of two buffers over a specified period of time.
%group
Win32 uxtheme
%prm
hwnd, hdcTarget, prcTarget, dwFormat, pPaintParams, pAnimationParams, phdcFrom, phdcTo
hwnd : [intptr] Type: HWND A handle to the window in which the animations play.
hdcTarget : [intptr] Type: HDC A handle of the target DC on which the buffer is animated.
prcTarget : [var] Type: const RECT* A pointer to a structure that specifies the area of the target DC in which to draw.
dwFormat : [int] Type: BP_BUFFERFORMAT The format of the buffer.
pPaintParams : [var] Type: BP_PAINTPARAMS* A pointer to a structure that defines the paint operation parameters. This value can be NULL.
pAnimationParams : [var] Type: BP_ANIMATIONPARAMS* A pointer to a structure that defines the animation operation parameters.
phdcFrom : [intptr] Type: HDC* When this function returns, this value points to the handle of the DC where the application should paint the initial state of the animation, if not NULL.
phdcTo : [intptr] Type: HDC* When this function returns, this value points to the handle of the DC where the application should paint the final state of the animation, if not NULL.
%inst
Begins a buffered animation operation. The animation consists of a
cross-fade between the contents of two buffers over a specified
period of time.

[戻り値]
Type: HANIMATIONBUFFER A handle to the buffered paint animation.

[備考]
BeginBufferedAnimation will take care of drawing the intermediate
frames between those two states by generating multiple WM_PAINT
messages.
BeginBufferedAnimation starts a timer that generates WM_PAINT
messages on which BufferedPaintRenderAnimation should be called.
During these messages, BufferedPaintRenderAnimation will return TRUE
when it paints an intermediate frame, to signify that the application
has no further painting to do. If the animation duration is zero,
then only phdcTo is returned and phdcFrom is set to NULL. In this
case, the application should paint the final state using phdcTo to
get the behavior similar to BeginBufferedPaint.


%index
BeginBufferedPaint
Begins a buffered paint operation.
%group
Win32 uxtheme
%prm
hdcTarget, prcTarget, dwFormat, pPaintParams, phdc
hdcTarget : [intptr] Type: HDC The handle of the target DC on which the buffer will be painted.
prcTarget : [var] Type: const RECT* A pointer to a RECT structure that specifies the area of the target DC in which to paint.
dwFormat : [int] Type: BP_BUFFERFORMAT A member of the BP_BUFFERFORMAT enumeration that specifies the format of the buffer.
pPaintParams : [var] Type: BP_PAINTPARAMS* A pointer to a BP_PAINTPARAMS structure that defines the paint operation parameters. This value can be NULL.
phdc : [intptr] Type: HDC* When this function returns, points to the handle of the new device context.
%inst
Begins a buffered paint operation.

[戻り値]
Type: HPAINTBUFFER A handle to the buffered paint context. If this
function fails, the return value is NULL, and phdc is NULL. To get
extended error information, call GetLastError. The returned handle is
freed when EndBufferedPaint is called. An application should call
BufferedPaintInit on the calling thread before calling
BeginBufferedPaint, and BufferedPaintUnInit before the thread is
terminated. Failure to call BufferedPaintInit may result in degraded
performance due to internal data being initialized and destroyed for
each buffered paint operation.


%index
BeginPanningFeedback
Notifies the system to send feedback about a target window affected by panning gestures.
%group
Win32 uxtheme
%prm
hwnd
hwnd : [intptr] Type: HWND The handle to the target window that will receive feedback.
%inst
Notifies the system to send feedback about a target window affected
by panning gestures.

[戻り値]
Type: BOOL TRUE, if successful.

[備考]
This function must be called before either the UpdatePanningFeedback
or EndPanningFeedback functions can be called.


%index
BufferedPaintClear
Clears a specified rectangle in the buffer to ARGB = {0,0,0,0}.
%group
Win32 uxtheme
%prm
hBufferedPaint, prc
hBufferedPaint : [int] Type: HPAINTBUFFER The handle of the buffered paint context, obtained through BeginBufferedPaint.
prc : [var] Type: const RECT* A pointer to a RECT structure that specifies the rectangle to clear. Set this parameter to NULL to specify the entire buffer.
%inst
Clears a specified rectangle in the buffer to ARGB = {0,0,0,0}.

[戻り値]
Type: HRESULT If this function succeeds, it returns S_OK. Otherwise,
it returns an HRESULT error code.

[備考]
This function accesses the buffer bits directly and is therefore
faster than calling a GDI function to erase the buffer.


%index
BufferedPaintInit
Initialize buffered painting for the current thread.
%group
Win32 uxtheme
%prm

%inst
Initialize buffered painting for the current thread.

[戻り値]
Type: HRESULT If this function succeeds, it returns S_OK. Otherwise,
it returns an HRESULT error code.

[備考]
BufferedPaintInit is called before BeginBufferedPaint or
BeginBufferedAnimation for each thread that uses these functions.
Each call to BufferedPaintInit should be matched with a call to
BufferedPaintUnInit when calls to buffered paint APIs are no longer
needed. An application may call this API multiple times, as long as
each call to BufferedPaintInit is balanced with a call to
BufferedPaintUnInit.
This function only needs to be called once in the lifetime of a
thread. Typically, this function is called before creating the main
application window, or during WM_CREATE. Call BufferedPaintUnInit
after destroying the window, or during WM_NCDESTROY.


%index
BufferedPaintRenderAnimation
Paints the next frame of a buffered paint animation.
%group
Win32 uxtheme
%prm
hwnd, hdcTarget
hwnd : [intptr] Type: HWND Handle to the window in which the animations play.
hdcTarget : [intptr] Type: HDC Handle of the target DC on which the buffer is animated.
%inst
Paints the next frame of a buffered paint animation.

[戻り値]
Type: BOOL Returns TRUE if the frame has been painted, or FALSE
otherwise.

[備考]
If this function returns TRUE, the application should do no further
painting. If this function returns FALSE, the application should
paint normally. An application calls this function within its
WM_PAINT handler. After BufferedPaintRenderAnimation paints an
animation frame, an application will typically continue without
performing its usual painting operations. If appropriate, an
application may choose to render additional user interface (UI) over
the top of the animation. The following code example, to be included
as part of a larger body of code, shows how to use the animation
painting functions.
This doc was truncated.


%index
BufferedPaintSetAlpha
Sets the alpha to a specified value in a given rectangle. The alpha controls the amount of transparency applied when blending with the buffer onto the destination target device context (DC).
%group
Win32 uxtheme
%prm
hBufferedPaint, prc, alpha
hBufferedPaint : [int] Type: HPAINTBUFFER The handle of the buffered paint context, obtained through BeginBufferedPaint.
prc : [var] Type: const RECT* A pointer to a RECT structure that specifies the rectangle in which to set the alpha. Set this parameter to NULL to specify the entire buffer.
alpha : [int] Type: BYTE The alpha value to set. The alpha value can range from zero (fully transparent) to 255 (fully opaque).
%inst
Sets the alpha to a specified value in a given rectangle. The alpha
controls the amount of transparency applied when blending with the
buffer onto the destination target device context (DC).

[戻り値]
Type: HRESULT If this function succeeds, it returns S_OK. Otherwise,
it returns an HRESULT error code.

[備考]
This function sets the alpha value for each pixel in the target
rectangle. Passing an alpha value of 255 makes pixels fully opaque.
The BufferedPaintMakeOpaque macro, which is defined in uxtheme.h,
sets alpha values to 255. It is typically used to call GDI to draw
into a memory buffer and then to make it opaque in order to draw it
on glass.


%index
BufferedPaintStopAllAnimations
Stops all buffered animations for the given window.
%group
Win32 uxtheme
%prm
hwnd
hwnd : [intptr] Type: HWND The handle of the window in which to stop all animations.
%inst
Stops all buffered animations for the given window.

[戻り値]
Type: HRESULT If this function succeeds, it returns S_OK. Otherwise,
it returns an HRESULT error code.


%index
BufferedPaintUnInit
Closes down buffered painting for the current thread. Called once for each call to BufferedPaintInit after calls to BeginBufferedPaint are no longer needed.
%group
Win32 uxtheme
%prm

%inst
Closes down buffered painting for the current thread. Called once for
each call to BufferedPaintInit after calls to BeginBufferedPaint are
no longer needed.

[戻り値]
Type: HRESULT If this function succeeds, it returns S_OK. Otherwise,
it returns an HRESULT error code.


%index
CloseThemeData
テーマデータハンドルを閉じる。
%group
Win32 uxtheme
%prm
hTheme
hTheme : [intptr] 型: HTHEME ウィンドウのテーマデータへのハンドル。OpenThemeData で HTHEME を作成する。
%inst
テーマデータハンドルを閉じる。

[戻り値]
型: HRESULT 成功時は S_OK、失敗時は HRESULT エラーコードを返す。

[備考]
ビジュアルスタイルを適用されたウィンドウが破棄されるときに本関数を呼ぶこと。WM_THEMECHANGED
を受信した際にも呼ぶこと。呼び出し後、IsThemeActive が TRUE を返す場合は新しいテーマデータハンドルを作成しなおすこと。


%index
DrawThemeBackground
指定コントロールパートのビジュアルスタイルで定義された枠線と塗りつぶしを描画する。
%group
Win32 uxtheme
%prm
hTheme, hdc, iPartId, iStateId, pRect, pClipRect
hTheme : [intptr] 型: HTHEME ウィンドウのテーマデータへのハンドル。OpenThemeData で HTHEME を作成する。
hdc : [intptr] 型: HDC テーマ背景画像を描画する HDC。
iPartId : [int] 型: int 描画するパートを指定する int 値。Parts and States を参照。
iStateId : [int] 型: int 描画するパートの状態を指定する int 値。Parts and States を参照。
pRect : [var] 型: const RECT* 背景画像を描画する矩形(論理座標)を含む RECT 構造体へのポインタ。
pClipRect : [var] 型: const RECT* クリッピング矩形を含む RECT へのポインタ。NULL 可。
%inst
指定コントロールパートのビジュアルスタイルで定義された枠線と塗りつぶしを描画する。

[戻り値]
型: HRESULT 成功時は S_OK、失敗時は HRESULT エラーコードを返す。

[備考]
描画は pRect で指定された矩形に収まるようスケールされ、それを超えないようにする。アプリケーションは pClipRect
で指定した矩形の外に描画してはならない。


%index
DrawThemeBackgroundEx
Draws the background image defined by the visual style for the specified control part.
%group
Win32 uxtheme
%prm
hTheme, hdc, iPartId, iStateId, pRect, pOptions
hTheme : [intptr] Type: HTHEME Handle to a window's specified theme data. Use OpenThemeData to create an HTHEME.
hdc : [intptr] Type: HDC HDC used for drawing the theme-defined background image.
iPartId : [int] Type: int Value of type int that specifies the part to draw. See Parts and States.
iStateId : [int] Type: int Value of type int that specifies the state of the part to draw. See Parts and States.
pRect : [var] Type: const RECT* Pointer to a RECT structure that contains the rectangle, in logical coordinates, in which the background image is drawn.
pOptions : [var] Type: const DTBGOPTS* Pointer to a DTBGOPTS structure that contains clipping information. This parameter may be set to NULL.
%inst
Draws the background image defined by the visual style for the
specified control part.

[戻り値]
Type: HRESULT If this function succeeds, it returns S_OK. Otherwise,
it returns an HRESULT error code.

[備考]
Drawing operations are scaled to fit and to not exceed the rectangle
specified in pRect.


%index
DrawThemeEdge
Draws one or more edges defined by the visual style of a rectangle.
%group
Win32 uxtheme
%prm
hTheme, hdc, iPartId, iStateId, pDestRect, uEdge, uFlags, pContentRect
hTheme : [intptr] Type: HTHEME Handle to a window's specified theme data. Use OpenThemeData to create an HTHEME.
hdc : [intptr] Type: HDC HDC.
iPartId : [int] Type: int Value of type int that specifies the part that contains the rectangle. See Parts and States.
iStateId : [int] Type: int Value of type int that specifies the state of the part. See Parts and States.
pDestRect : [var] Type: LPCRECT Pointer to a RECT structure that contains, in logical coordinates, the rectangle.
uEdge : [int] Type: UINT UINT that specifies the type of inner and outer edges to draw. This parameter must be a combination of one inner-border flag and one outer-border flag, or one of the combination flags. The border flags are:
uFlags : [int] Type: UINT
pContentRect : [var] Type: LPRECT Pointer to a RECT structure that contains, in logical coordinates, the rectangle that receives the interior rectangle, if uFlags is set to BF_ADJUST. This parameter may be set to NULL.
%inst
Draws one or more edges defined by the visual style of a rectangle.

[戻り値]
Type: HRESULT If this function succeeds, it returns S_OK. Otherwise,
it returns an HRESULT error code.


%index
DrawThemeIcon
Draws an image from an image list with the icon effect defined by the visual style.
%group
Win32 uxtheme
%prm
hTheme, hdc, iPartId, iStateId, pRect, himl, iImageIndex
hTheme : [intptr] Type: HTHEME Handle to a window's specified theme data. Use OpenThemeData to create an HTHEME.
hdc : [intptr] Type: HDC HDC.
iPartId : [int] Type: int Value of type int that specifies the part in which the image is drawn. See Parts and States.
iStateId : [int] Type: int Value of type int that specifies the state of the part. See Parts and States.
pRect : [var] Type: LPCRECT Pointer to a RECT structure that contains, in logical coordinates, the rectangle in which the image is drawn.
himl : [intptr] Type: HIMAGELIST Handle to an image list that contains the image to draw.
iImageIndex : [int] Type: int Value of type int that specifies the index of the image to draw.
%inst
Draws an image from an image list with the icon effect defined by the
visual style.

[戻り値]
Type: HRESULT If this function succeeds, it returns S_OK. Otherwise,
it returns an HRESULT error code.


%index
DrawThemeParentBackground
Draws the part of a parent control that is covered by a partially-transparent or alpha-blended child control.
%group
Win32 uxtheme
%prm
hwnd, hdc, prc
hwnd : [intptr] Type: HWND The child control.
hdc : [intptr] Type: HDC The child control's DC.
prc : [var] Type: const RECT* The area to be drawn. The rectangle is in the child window's coordinates. If this parameter is NULL, the area to be drawn includes the entire area occupied by the child control.
%inst
Draws the part of a parent control that is covered by a
partially-transparent or alpha-blended child control.

[戻り値]
Type: HRESULT If this function succeeds, it returns S_OK. Otherwise,
it returns an HRESULT error code.


%index
DrawThemeParentBackgroundEx
Used by partially-transparent or alpha-blended child controls to draw the part of their parent in front of which they appear. Sends a WM_ERASEBKGND message followed by a WM_PRINTCLIENT.
%group
Win32 uxtheme
%prm
hwnd, hdc, dwFlags, prc
hwnd : [intptr] Type: HWND Handle of the child control.
hdc : [intptr] Type: HDC HDC of the child control.
dwFlags : [int] Type: DWORD
prc : [var] Type: const RECT* Optional. The area to be drawn, in child coordinates. If this parameter is NULL, the area to be drawn includes the entire area occupied by the child control.
%inst
Used by partially-transparent or alpha-blended child controls to draw
the part of their parent in front of which they appear. Sends a
WM_ERASEBKGND message followed by a WM_PRINTCLIENT.

[戻り値]
Type: HRESULT S_OK if successful; otherwise, S_FALSE.


%index
DrawThemeText
ビジュアルスタイルで定義された色とフォントを使ってテキストを描画する。
%group
Win32 uxtheme
%prm
hTheme, hdc, iPartId, iStateId, pszText, cchText, dwTextFlags, dwTextFlags2, pRect
hTheme : [intptr] 型: HTHEME ウィンドウのテーマデータへのハンドル。OpenThemeData で HTHEME を作成する。
hdc : [intptr] 型: HDC 描画に使う HDC。
iPartId : [int] 型: int 目的のテキスト外観を持つコントロールパート。0 を指定すると既定フォント(または HDC に選択されたフォント)で描画される。
iStateId : [int] 型: int 目的のテキスト外観を持つコントロール状態。
pszText : [wstr] 型: LPCWSTR 描画するテキスト文字列へのポインタ。
cchText : [int] 型: int 描画する文字数。-1 を指定すると文字列の全文字を描画する。
dwTextFlags : [int] 型: DWORD 文字列書式を指定する値(1 つ以上)。DrawThemeText は DT_CALCRECT をサポートしないが、DrawThemeTextEx はサポートする。
dwTextFlags2 : [int] 型: DWORD 使用しない。0 を指定する。
pRect : [var] 型: LPCRECT テキスト描画矩形(論理座標)を含む RECT 構造体へのポインタ。GetThemeTextExtent で得られる pExtentRect の使用が推奨される。
%inst
ビジュアルスタイルで定義された色とフォントを使ってテキストを描画する。

[戻り値]
型: HRESULT 成功時は S_OK、失敗時は HRESULT エラーコードを返す。

[備考]
指定パート・状態に対してテーマフォントが定義されていれば常にそれを使用する。定義されていない場合は現在 HDC
に選択されているフォントを使う。テーマフォントの有無は GetThemeFont や GetThemePropertyOrigin を
TMT_FONT で呼んで確認できる。


%index
DrawThemeTextEx
Draws text using the color and font defined by the visual style. Extends DrawThemeText by allowing additional text format options.
%group
Win32 uxtheme
%prm
hTheme, hdc, iPartId, iStateId, pszText, cchText, dwTextFlags, pRect, pOptions
hTheme : [intptr] Type: HTHEME Handle to a window's specified theme data. Use OpenThemeData to create an HTHEME.
hdc : [intptr] Type: HDC HDC to use for drawing.
iPartId : [int] Type: int The control part that has the desired text appearance. See Parts and States. If this value is 0, the text is drawn in the default font, or a font selected into the device context.
iStateId : [int] Type: int The control state that has the desired text appearance. See Parts and States.
pszText : [wstr] Type: LPCWSTR Pointer to a string that contains the text to draw.
cchText : [int] Type: int Value of type int that contains the number of characters to draw. If the parameter is set to -1, all the characters in the string are drawn.
dwTextFlags : [int] Type: DWORD DWORD that contains one or more values that specify the string's formatting. See Format Values for possible parameter values.
pRect : [var] Type: LPRECT Pointer to a RECT structure that contains the rectangle, in logical coordinates, in which the text is to be drawn.
pOptions : [var] Type: const DTTOPTS* A DTTOPTS structure that defines additional formatting options that will be applied to the text being drawn.
%inst
Draws text using the color and font defined by the visual style.
Extends DrawThemeText by allowing additional text format options.

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
EnableThemeDialogTexture
Enables or disables the visual style of the background of a dialog window.
%group
Win32 uxtheme
%prm
hwnd, dwFlags
hwnd : [intptr] Type: HWND Window handle of the target dialog box.
dwFlags : [int] Type: DWORD One of the following option flag values:
%inst
Enables or disables the visual style of the background of a dialog
window.

[戻り値]
Type: HRESULT If this function succeeds, it returns S_OK. Otherwise,
it returns an HRESULT error code.

[備考]
EnableThemeDialogTexture can be used to tailor dialog box
compatibility with child windows and controls that may or may not
coordinate rendering their client area backgrounds with that of their
parent dialog box.


%index
EnableTheming
Windows?Vista through Windows?7:\_Enables or disables visual styles for the current user in the current and later sessions.Windows?8 and later:\_This function does nothing. Visual styles are always enabled in Windows?8 and later.
%group
Win32 uxtheme
%prm
fEnable
fEnable : [int] Type: BOOL
%inst
Windows Vista through Windows 7:\_Enables or disables visual styles
for the current user in the current and later sessions.Windows 8 and
later:\_This function does nothing. Visual styles are always enabled
in Windows 8 and later.

[戻り値]
Type: HRESULT If this function succeeds, it returns S_OK. Otherwise,
it returns an HRESULT error code.


%index
EndBufferedAnimation
Renders the first frame of a buffered animation operation and starts the animation timer.
%group
Win32 uxtheme
%prm
hbpAnimation, fUpdateTarget
hbpAnimation : [int] Type: HANIMATIONBUFFER The handle to the buffered animation context that was returned by BeginBufferedAnimation.
fUpdateTarget : [int] Type: BOOL If TRUE, updates the target DC with the animation.  If FALSE, the animation is not started, the target DC is not updated, and the hbpAnimation parameter is freed.
%inst
Renders the first frame of a buffered animation operation and starts
the animation timer.

[戻り値]
Type: HRESULT If this function succeeds, it returns S_OK. Otherwise,
it returns an HRESULT error code.


%index
EndBufferedPaint
Completes a buffered paint operation and frees the associated buffered paint handle.
%group
Win32 uxtheme
%prm
hBufferedPaint, fUpdateTarget
hBufferedPaint : [int] Type: HPAINTBUFFER The handle of the buffered paint context, obtained through BeginBufferedPaint.
fUpdateTarget : [int] Type: BOOL TRUE to copy the buffer to the target DC.
%inst
Completes a buffered paint operation and frees the associated
buffered paint handle.

[戻り値]
Type: HRESULT If this function succeeds, it returns S_OK. Otherwise,
it returns an HRESULT error code.


%index
EndPanningFeedback
Terminates any existing animation that was in process or set up by BeginPanningFeedback and UpdatePanningFeedback.
%group
Win32 uxtheme
%prm
hwnd, fAnimateBack
hwnd : [intptr] Type: HWND The handle to the target window that will receive feedback.
fAnimateBack : [int] Type: BOOL Flag that indicates whether the displaced window should return to the original position using animation. If FALSE, the method restore the moved window using a direct jump.
%inst
Terminates any existing animation that was in process or set up by
BeginPanningFeedback and UpdatePanningFeedback.

[戻り値]
Type: BOOL TRUE if successful.

[備考]
This function can only be called after a BeginPanningFeedback call.


%index
GetBufferedPaintBits
Retrieves a pointer to the buffer bitmap if the buffer is a device-independent bitmap (DIB).
%group
Win32 uxtheme
%prm
hBufferedPaint, ppbBuffer, pcxRow
hBufferedPaint : [int] Type: HPAINTBUFFER The handle of the buffered paint context, obtained through BeginBufferedPaint.
ppbBuffer : [var] Type: RGBQUAD** When this function returns, contains a pointer to the address of the buffer bitmap pixels.
pcxRow : [var] Type: int* When this function returns, contains a pointer to the width, in pixels, of the buffer bitmap. This value is not necessarily equal to the buffer width. It may be larger.
%inst
Retrieves a pointer to the buffer bitmap if the buffer is a
device-independent bitmap (DIB).

[戻り値]
Type: HRESULT Returns S_OK if successful, or an error value
otherwise. If an error occurs, ppbBuffer is set to NULL and pcxRow is
set to zero.

[備考]
The number of bits per pixel depends on the pixel format passed to
BeginBufferedPaint.


%index
GetBufferedPaintDC
Gets the paint device context (DC). This is the same value retrieved by BeginBufferedPaint.
%group
Win32 uxtheme
%prm
hBufferedPaint
hBufferedPaint : [int] Type: HPAINTBUFFER Handle of the buffered paint context, obtained through BeginBufferedPaint.
%inst
Gets the paint device context (DC). This is the same value retrieved
by BeginBufferedPaint.

[戻り値]
Type: HDC Handle of the requested DC. This is the same DC that is
returned by BeginBufferedPaint. Returns NULL upon failure.


%index
GetBufferedPaintTargetDC
Retrieves the target device context (DC).
%group
Win32 uxtheme
%prm
hBufferedPaint
hBufferedPaint : [int] Type: HPAINTBUFFER A handle to the buffered paint context obtained through BeginBufferedPaint.
%inst
Retrieves the target device context (DC).

[戻り値]
Type: HDC A handle to the requested DC, or NULL otherwise.

[備考]
If successful, this function returns the target DC that was passed by
the application to BeginBufferedPaint.


%index
GetBufferedPaintTargetRect
Retrieves the target rectangle specified by BeginBufferedPaint.
%group
Win32 uxtheme
%prm
hBufferedPaint, prc
hBufferedPaint : [int] Type: HPAINTBUFFER Handle to the buffered paint context obtained through BeginBufferedPaint.
prc : [var] Type: RECT* When this function returns, contains the requested rectangle.
%inst
Retrieves the target rectangle specified by BeginBufferedPaint.

[戻り値]
Type: HRESULT If this function succeeds, it returns S_OK. Otherwise,
it returns an HRESULT error code.

[備考]
If this function fails, the RECT structure at prc is set to empty.


%index
GetCurrentThemeName
Retrieves the name of the current visual style, and optionally retrieves the color scheme name and size name.
%group
Win32 uxtheme
%prm
pszThemeFileName, cchMaxNameChars, pszColorBuff, cchMaxColorChars, pszSizeBuff, cchMaxSizeChars
pszThemeFileName : [wstr] Type: LPWSTR Pointer to a string that receives the theme path and file name.
cchMaxNameChars : [int] Type: int Value of type int that contains the maximum number of characters allowed in the theme file name.
pszColorBuff : [wstr] Type: LPWSTR Pointer to a string that receives the color scheme name. This parameter may be set to NULL.
cchMaxColorChars : [int] Type: int Value of type int that contains the maximum number of characters allowed in the color scheme name.
pszSizeBuff : [wstr] Type: LPWSTR Pointer to a string that receives the size name. This parameter may be set to NULL.
cchMaxSizeChars : [int] Type: int Value of type int that contains the maximum number of characters allowed in the size name.
%inst
Retrieves the name of the current visual style, and optionally
retrieves the color scheme name and size name.

[戻り値]
Type: HRESULT Returns S_OK if successful, otherwise an error code.


%index
GetThemeAnimationProperty
Gets a theme animation property based on the storyboard id and the target id.
%group
Win32 uxtheme
%prm
hTheme, iStoryboardId, iTargetId, eProperty, pvProperty, cbSize, pcbSizeOut
hTheme : [intptr] An opened theme handle.
iStoryboardId : [int] A predefined storyboard identifier.
iTargetId : [int] A predefined target identifier.
eProperty : [int] The property that is associated with the animation storyboard and target.
pvProperty : [intptr] The buffer to receive the returned property value.
cbSize : [int] The byte size of a buffer that is pointed by pvProperty.
pcbSizeOut : [var] The                                    byte  size of the returned property.
%inst
Gets a theme animation property based on the storyboard id and the
target id.

[戻り値]
If this function succeeds, it returns S_OK. Otherwise, it returns an
HRESULT error code.


%index
GetThemeAnimationTransform
Gets an animation transform operation based on storyboard id, target id and transform index.
%group
Win32 uxtheme
%prm
hTheme, iStoryboardId, iTargetId, dwTransformIndex, pTransform, cbSize, pcbSizeOut
hTheme : [intptr] An opened theme handle.
iStoryboardId : [int] A predefined storyboard identifier.
iTargetId : [int] A predefined target identifier.
dwTransformIndex : [int] The zero-based index of a transform operation.
pTransform : [var] A pointer to a buffer to receive a transform structure.
cbSize : [int] The byte size of the buffer pointed by pTransform.
pcbSizeOut : [var] The                                    byte  size of a transform operation structure.
%inst
Gets an animation transform operation based on storyboard id, target
id and transform index.

[戻り値]
If this function succeeds, it returns S_OK. Otherwise, it returns an
HRESULT error code.


%index
GetThemeAppProperties
Retrieves the property flags that control how visual styles are applied in the current application.
%group
Win32 uxtheme
%prm

%inst
Retrieves the property flags that control how visual styles are
applied in the current application.

[戻り値]
Type: DWORD The following return values are bit flags combined with a
logical OR operator.
This doc was truncated.

[備考]
Individual flags can be extracted from the result by combining the
result with the logical AND of the desired flag. Do not call this
function during DllMain or global objects constructors. This may
cause invalid return values.


%index
GetThemeBackgroundContentRect
Retrieves the size of the content area for the background defined by the visual style.
%group
Win32 uxtheme
%prm
hTheme, hdc, iPartId, iStateId, pBoundingRect, pContentRect
hTheme : [intptr] Type: HTHEME Handle to a window's specified theme data. Use OpenThemeData to create an HTHEME.
hdc : [intptr] Type: HDC HDC to use when drawing. This parameter may be set to NULL.
iPartId : [int] Type: int Value of type int that specifies the part that contains the content area. See Parts and States.
iStateId : [int] Type: int Value of type int that specifies the state of the part that contains the content area. See Parts and States.
pBoundingRect : [var] Type: LPCRECT Pointer to a RECT structure that contains the total background rectangle, in logical coordinates. This is the area inside the borders or margins.
pContentRect : [var] Type: LPRECT Pointer to a RECT structure that receives the content area background rectangle, in logical coordinates.  This rectangle is calculated to fit the content area.
%inst
Retrieves the size of the content area for the background defined by
the visual style.

[戻り値]
Type: HRESULT If this function succeeds, it returns S_OK. Otherwise,
it returns an HRESULT error code.

[備考]
A visual style can define a content area within each background
image. This is the area where content such as text and icons can be
placed without overwriting background borders.


%index
GetThemeBackgroundExtent
Calculates the size and location of the background, defined by the visual style, given the content area.
%group
Win32 uxtheme
%prm
hTheme, hdc, iPartId, iStateId, pContentRect, pExtentRect
hTheme : [intptr] Type: HTHEME Handle to a window's specified theme data. Use OpenThemeData to create an HTHEME.
hdc : [intptr] Type: HDC HDC to use when drawing. This parameter may be set to NULL.
iPartId : [int] Type: int Value of type int that specifies the part that contains the content. See Parts and States.
iStateId : [int] Type: int Value of type int that specifies the state of the part that contains the content. See Parts and States.
pContentRect : [var] Type: LPCRECT Pointer to a RECT structure that contains the content background rectangle, in logical coordinates. This rectangle is returned from GetThemeBackgroundContentRect.
pExtentRect : [var] Type: LPRECT Pointer to a RECT structure that receives the background rectangle, in logical coordinates. This rectangle is based on the pContentRect.
%inst
Calculates the size and location of the background, defined by the
visual style, given the content area.

[戻り値]
Type: HRESULT If this function succeeds, it returns S_OK. Otherwise,
it returns an HRESULT error code.

[備考]
A theme can define a content area within each background image. This
is the area where content such as text and icons can be placed
without overwriting background borders.


%index
GetThemeBackgroundRegion
Computes the region for a regular or partially transparent background that is bounded by a specified rectangle.
%group
Win32 uxtheme
%prm
hTheme, hdc, iPartId, iStateId, pRect, pRegion
hTheme : [intptr] Type: HTHEME Handle to a window's specified theme data. Use OpenThemeData to create an HTHEME.
hdc : [intptr] Type: HDC HDC to draw into. The DC uses dots per inch (DPI) scaling. This parameter may be set to NULL.
iPartId : [int] Type: int Value of type int that specifies the part that contains the region. See Parts and States.
iStateId : [int] Type: int Value of type int that specifies the state of the part. See Parts and States.
pRect : [var] Type: LPCRECT Pointer to a RECT structure that contains, in logical coordinates, the specified rectangle used to compute the region.
pRegion : [intptr] Type: HRGN* Pointer to the handle to the computed region.
%inst
Computes the region for a regular or partially transparent background
that is bounded by a specified rectangle.

[戻り値]
Type: HRESULT If this function succeeds, it returns S_OK. Otherwise,
it returns an HRESULT error code.

[備考]
The region handle that is returned by this function should be
released when it is no longer needed, using DeleteObject.


%index
GetThemeBitmap
Retrieves the bitmap associated with a particular theme, part, state, and property.
%group
Win32 uxtheme
%prm
hTheme, iPartId, iStateId, iPropId, dwFlags, phBitmap
hTheme : [intptr] Type: HTHEME A handle to theme data.
iPartId : [int] Type: int The part that contains the bitmap. See Parts and States.
iStateId : [int] Type: int The state of the part.
iPropId : [int] Type: int The property to retrieve. Pass zero to automatically select the first available bitmap for this part and state,
dwFlags : [int] Type: ULONG
phBitmap : [intptr] Type: HBITMAP* A pointer that receives a handle to the requested bitmap.
%inst
Retrieves the bitmap associated with a particular theme, part, state,
and property.

[戻り値]
Type: HRESULT If this function succeeds, it returns S_OK. Otherwise,
it returns an HRESULT error code.

[備考]
If dwFlags is set to GBF_COPY, release the bitmap stored in phBitmap
when no longer needed by calling DeleteObject.


%index
GetThemeBool
Retrieves the value of a BOOL property from the SysMetrics section of theme data.
%group
Win32 uxtheme
%prm
hTheme, iPartId, iStateId, iPropId, pfVal
hTheme : [intptr] Type: HTHEME Handle to a window's specified theme data. Use OpenThemeData to create an HTHEME.
iPartId : [int] Type: int Value of type int that specifies the part containing the BOOL property. See Parts and States.
iStateId : [int] Type: int Value of type int that specifies the state of the part. See Parts and States.
iPropId : [int] Type: int
pfVal : [var] Type: BOOL* Pointer to a BOOL that receives the retrieved property value.
%inst
Retrieves the value of a BOOL property from the SysMetrics section of
theme data.

[戻り値]
Type: HRESULT If this function succeeds, it returns S_OK. Otherwise,
it returns an HRESULT error code.


%index
GetThemeColor
カラープロパティの値を取得する。
%group
Win32 uxtheme
%prm
hTheme, iPartId, iStateId, iPropId, pColor
hTheme : [intptr] 型: HTHEME ウィンドウのテーマデータへのハンドル。OpenThemeData で HTHEME を作成する。
iPartId : [int] 型: int カラープロパティを含むパートを指定する int 値。
iStateId : [int] 型: int パートの状態を指定する int 値。
iPropId : [int] 型: int 取得するプロパティを指定する int 値。Property Identifiers 参照。
pColor : [var] 型: COLORREF* 色値を受け取る COLORREF 構造体へのポインタ。
%inst
カラープロパティの値を取得する。

[戻り値]
型: HRESULT 成功時は S_OK、失敗時は HRESULT エラーコードを返す。


%index
GetThemeDocumentationProperty
Retrieves the value for a theme property from the documentation section of the specified theme file.
%group
Win32 uxtheme
%prm
pszThemeName, pszPropertyName, pszValueBuff, cchMaxValChars
pszThemeName : [wstr] Type: LPCWSTR Pointer to a string that contains the name of the theme file that will be opened to query for the property.
pszPropertyName : [wstr] Type: LPCWSTR
pszValueBuff : [wstr] Type: LPWSTR Pointer to a string buffer that receives the property string value.
cchMaxValChars : [int] Type: int Value of type int that specifies the maximum number of characters that pszValueBuff can contain.
%inst
Retrieves the value for a theme property from the documentation
section of the specified theme file.

[戻り値]
Type: HRESULT If this function succeeds, it returns S_OK. Otherwise,
it returns an HRESULT error code.

[備考]
If the theme property has been localized in the theme files string
table, this function returns the localized version.


%index
GetThemeEnumValue
Retrieves the value of an enumerated type property.
%group
Win32 uxtheme
%prm
hTheme, iPartId, iStateId, iPropId, piVal
hTheme : [intptr] Type: HTHEME Handle to a window's specified theme data. Use OpenThemeData to create an HTHEME.
iPartId : [int] Type: int Value of type int that specifies the part that contains the enumerated type property. See Parts and States.
iStateId : [int] Type: int Value of type int that specifies the state of the part. See Parts and States.
iPropId : [int] Type: int Value of type int that specifies the property to retrieve. For a list of possible values, see Property Identifiers.
piVal : [var] Type: int* Pointer to an int that receives the enumerated type value.
%inst
Retrieves the value of an enumerated type property.

[戻り値]
Type: HRESULT If this function succeeds, it returns S_OK. Otherwise,
it returns an HRESULT error code.


%index
GetThemeFilename
Retrieves the value of a filename property.
%group
Win32 uxtheme
%prm
hTheme, iPartId, iStateId, iPropId, pszThemeFileName, cchMaxBuffChars
hTheme : [intptr] Type: HTHEME Handle to a window's specified theme data. Use OpenThemeData to create an HTHEME.
iPartId : [int] Type: int Value of type int that specifies the part that contains the filename property. See Parts and States.
iStateId : [int] Type: int Value of type int that specifies the state of the part. See Parts and States.
iPropId : [int] Type: int Value of type int that specifies the property to retrieve. For a list of possible values, see Property Identifiers.
pszThemeFileName : [wstr] Type: LPWSTR Pointer to a buffer that receives the retrieved file name.
cchMaxBuffChars : [int] Type: int Value of type int that receives the maximum number of characters in the file name
%inst
Retrieves the value of a filename property.

[戻り値]
Type: HRESULT If this function succeeds, it returns S_OK. Otherwise,
it returns an HRESULT error code.


%index
GetThemeFont
Retrieves the value of a font property.
%group
Win32 uxtheme
%prm
hTheme, hdc, iPartId, iStateId, iPropId, pFont
hTheme : [intptr] Type: HTHEME Handle to a window's specified theme data. Use OpenThemeData to create an HTHEME.
hdc : [intptr] Type: HDC HDC. This parameter may be set to NULL.
iPartId : [int] Type: int Value of type int that specifies the part that contains the font property. See Parts and States.
iStateId : [int] Type: int Value of type int that specifies the state of the part. See Parts and States.
iPropId : [int] Type: int Value of type int that specifies the property to retrieve. For a list of possible values, see Property Identifiers.
pFont : [var] Type: LOGFONTW* Pointer to a LOGFONT structure that receives the font property value.
%inst
Retrieves the value of a font property.

[戻り値]
Type: HRESULT If this function succeeds, it returns S_OK. Otherwise,
it returns an HRESULT error code.

[備考]
The font is scaled in dots per inch (DPI) for the current logical
screen. If the property is not supported for the specified part and
state, E_PROP_ID_UNSUPPORTED may be returned.


%index
GetThemeInt
Retrieves the value of an int property.
%group
Win32 uxtheme
%prm
hTheme, iPartId, iStateId, iPropId, piVal
hTheme : [intptr] Type: HTHEME Handle to a window's specified theme data. Use OpenThemeData to create an HTHEME.
iPartId : [int] Type: int Value of type int that specifies the part that contains the int property. See Parts and States.
iStateId : [int] Type: int Value of type int that specifies the state of the part. See Parts and States.
iPropId : [int] Type: int Value of type int that specifies the property to retrieve. For a list of possible values, see Property Identifiers.
piVal : [var] Type: int* Pointer to an int that receives the retrieved value.
%inst
Retrieves the value of an int property.

[戻り値]
Type: HRESULT If this function succeeds, it returns S_OK. Otherwise,
it returns an HRESULT error code.


%index
GetThemeIntList
Retrieves a list of int data from a visual style.
%group
Win32 uxtheme
%prm
hTheme, iPartId, iStateId, iPropId, pIntList
hTheme : [intptr] Type: HTHEME Handle to a window's specified theme data. Use OpenThemeData to create an HTHEME.
iPartId : [int] Type: int Value of type int that specifies the part that contains the list of data to return. See Parts and States.
iStateId : [int] Type: int Value of type int that specifies the state of the part. See Parts and States.
iPropId : [int] Type: int Value of type int that specifies the property to retrieve. See Property Identifiers.
pIntList : [var] Type: INTLIST* Pointer to an INTLIST structure that receives the int data.
%inst
Retrieves a list of int data from a visual style.

[戻り値]
Type: HRESULT Returns S_OK if successful, otherwise an error code.


%index
GetThemeMargins
Retrieves the value of a MARGINS property.
%group
Win32 uxtheme
%prm
hTheme, hdc, iPartId, iStateId, iPropId, prc, pMargins
hTheme : [intptr] Type: HTHEME Handle to a window's specified theme data. Use OpenThemeData to create an HTHEME.
hdc : [intptr] Type: HDC HDC to select fonts into. This parameter may be set to NULL.
iPartId : [int] Type: int Value of type int that specifies the part that contains the MARGINS property. See Parts and States.
iStateId : [int] Type: int Value of type int that specifies the state of the part. See Parts and States.
iPropId : [int] Type: int Value of type int that specifies the property to retrieve. For a list of possible values, see Property Identifiers.
prc : [var] Type: LPRECT Pointer to a RECT structure that contains the rectangle that specifies the area to be drawn into. This parameter may be set to NULL.
pMargins : [var] Type: MARGINS* Pointer to a MARGINS structure that receives the retrieved value.
%inst
Retrieves the value of a MARGINS property.

[戻り値]
Type: HRESULT If this function succeeds, it returns S_OK. Otherwise,
it returns an HRESULT error code.


%index
GetThemeMetric
Retrieves the value of a metric property.
%group
Win32 uxtheme
%prm
hTheme, hdc, iPartId, iStateId, iPropId, piVal
hTheme : [intptr] Type: HTHEME Handle to a window's specified theme data. Use OpenThemeData to create an HTHEME.
hdc : [intptr] Type: HDC HDC. This parameter may be set to NULL.
iPartId : [int] Type: int Value of type int that specifies the part that contains the metric property. See Parts and States.
iStateId : [int] Type: int Value of type int that specifies the state of the part. See Parts and States.
iPropId : [int] Type: int
piVal : [var] Type: int* Pointer to an int that receives the metric property value.
%inst
Retrieves the value of a metric property.

[戻り値]
Type: HRESULT If this function succeeds, it returns S_OK. Otherwise,
it returns an HRESULT error code.


%index
GetThemePartSize
ビジュアルスタイルで定義されたパートの元サイズを計算する。
%group
Win32 uxtheme
%prm
hTheme, hdc, iPartId, iStateId, prc, eSize, psz
hTheme : [intptr] 型: HTHEME ウィンドウのテーマデータへのハンドル。OpenThemeData で HTHEME を作成する。
hdc : [intptr] 型: HDC フォントを選択する HDC。
iPartId : [int] 型: int サイズ計算対象のパートを指定する int 値。
iStateId : [int] 型: int パートの状態を指定する int 値。
prc : [var] 型: LPCRECT パート描画先矩形を含む RECT 構造体へのポインタ。NULL 可。
eSize : [int] 
psz : [var] 型: SIZE* 指定パートの寸法を受け取る SIZE 構造体へのポインタ。
%inst
ビジュアルスタイルで定義されたパートの元サイズを計算する。

[戻り値]
型: HRESULT 成功時は S_OK、失敗時は HRESULT エラーコードを返す。


%index
GetThemePosition
Retrieves the value of a position property.
%group
Win32 uxtheme
%prm
hTheme, iPartId, iStateId, iPropId, pPoint
hTheme : [intptr] Type: HTHEME Handle to a window's specified theme data. Use OpenThemeData to create an HTHEME.
iPartId : [int] Type: int Value of type int that specifies the part that contains the position property. See Parts and States.
iStateId : [int] Type: int Value of type int that specifies the state of the part. See Parts and States.
iPropId : [int] Type: int Value of type int that specifies the property to retrieve. For a list of possible values, see Property Identifiers.
pPoint : [var] Type: POINT* Pointer to a POINT structure that receives the position value.
%inst
Retrieves the value of a position property.

[戻り値]
Type: HRESULT If this function succeeds, it returns S_OK. Otherwise,
it returns an HRESULT error code.

[備考]
The part in which the position is located determines the possible
state values. For example, if the position is in a check box, the
state could be checked or unchecked, but in a caption the possible
states are active, inactive, or disabled.


%index
GetThemePropertyOrigin
Retrieves the location of the theme property definition for a property.
%group
Win32 uxtheme
%prm
hTheme, iPartId, iStateId, iPropId, pOrigin
hTheme : [intptr] Type: HTHEME Handle to a window's specified theme data. Use OpenThemeData to create an HTHEME.
iPartId : [int] Type: int Value of type int that specifies the part that contains the theme. See Parts and States.
iStateId : [int] Type: int Value of type int that specifies the state of the part. See Parts and States.
iPropId : [int] Type: int Value of type int that specifies the property to retrieve. You may use any of the property values from Vssym32.h. These values are described in the reference pages for the functions that use them. For instance, the GetThemeInt function uses the TMT_BORDERSIZE value. See the Visual Styles Reference for a list of functions.
pOrigin : [var] 
%inst
Retrieves the location of the theme property definition for a
property.

[戻り値]
Type: HRESULT If this function succeeds, it returns S_OK. Otherwise,
it returns an HRESULT error code.


%index
GetThemeRect
Retrieves the value of a RECT property.
%group
Win32 uxtheme
%prm
hTheme, iPartId, iStateId, iPropId, pRect
hTheme : [intptr] Type: HTHEME Handle to a window's specified theme data. Use OpenThemeData to create an HTHEME.
iPartId : [int] Type: int Value of type int that specifies the part containing the RECT property. See Parts and States.
iStateId : [int] Type: int Value of type int that specifies the state of the part. See Parts and States.
iPropId : [int] Type: int Value of type int that specifies the property to retrieve. For a list of possible values, see Property Identifiers.
pRect : [var] Type: LPRECT Pointer to a RECT structure that receives a  rectangle.
%inst
Retrieves the value of a RECT property.

[戻り値]
Type: HRESULT If this function succeeds, it returns S_OK. Otherwise,
it returns an HRESULT error code.


%index
GetThemeStream
Retrieves a data stream corresponding to a specified theme, starting from a specified part, state, and property.
%group
Win32 uxtheme
%prm
hTheme, iPartId, iStateId, iPropId, ppvStream, pcbStream, hInst
hTheme : [intptr] Type: HTHEME Handle to the theme from which the stream will be retrieved.
iPartId : [int] Type: int Specifies the part to retrieve a stream from. See Parts and States.
iStateId : [int] Type: int Specifies the state of the part.
iPropId : [int] Type: int Specifies the property to retrieve.
ppvStream : [var] Type: VOID** Address of a pointer that receives the stream.
pcbStream : [var] Type: DWORD* Pointer that receives the length, in bytes, of the stream received by ppvStream.
hInst : [intptr] Type: HINSTANCE If iPropId is TMT_STREAM, this value is NULL. If iPropId is TMT_DISKSTREAM, this value is the HINSTANCE of a loaded styles file.
%inst
Retrieves a data stream corresponding to a specified theme, starting
from a specified part, state, and property.

[戻り値]
Type: HRESULT If this function succeeds, it returns S_OK. Otherwise,
it returns an HRESULT error code.

[備考]
Windows 8: In high contrast mode, the data stream retrieved by this
function is not valid after the hTheme theme handle is closed.
The data stream retrieved by this function is not a copy; do not
delete or close the data stream after using it.


%index
GetThemeString
Retrieves the value of a string property.
%group
Win32 uxtheme
%prm
hTheme, iPartId, iStateId, iPropId, pszBuff, cchMaxBuffChars
hTheme : [intptr] Type: HTHEME Handle to a window's specified theme data. Use OpenThemeData to create an HTHEME.
iPartId : [int] Type: int Value of type int that specifies the part containing the string property. See Parts and States.
iStateId : [int] Type: int Value of type int that specifies the state of the part. See Parts and States.
iPropId : [int] Type: int Value of type int that specifies the property to retrieve. For a list of possible values, see Property Identifiers.
pszBuff : [wstr] Type: LPWSTR Pointer to a buffer that receives the string value.
cchMaxBuffChars : [int] Type: int Value of type int that specifies the maximum number of characters pszBuff can contain.
%inst
Retrieves the value of a string property.

[戻り値]
Type: HRESULT If this function succeeds, it returns S_OK. Otherwise,
it returns an HRESULT error code.


%index
GetThemeSysBool
Retrieves the Boolean value of a system metric.
%group
Win32 uxtheme
%prm
hTheme, iBoolId
hTheme : [intptr] Type: HTHEME Handle to theme data.
iBoolId : [int] Type: int Value of type int that specifies the system Boolean metric desired. May be the following value.
%inst
Retrieves the Boolean value of a system metric.

[戻り値]
Type: BOOL Value of desired system metric.

[備考]
If the theme data handle is not a NULL handle, this function returns
the desired BOOL from the SysMetrics section of the visual style. If
the theme data handle is NULL, this function returns the value of the
specified system Boolean.


%index
GetThemeSysColor
Retrieves the value of a system color.
%group
Win32 uxtheme
%prm
hTheme, iColorId
hTheme : [intptr] Type: HTHEME Handle to theme data.
iColorId : [int] Type: int Value of type int that specifies the color number. May be one of the values listed in GetSysColor for the nIndex parameter.
%inst
Retrieves the value of a system color.

[戻り値]
Type: COLORREF The value of the specified system color.

[備考]
If the theme data handle is not a NULL handle, this function returns
the color from the SysMetrics section of the current visual style. If
the theme data handle is NULL, this function returns the color
matching the global system color.


%index
GetThemeSysColorBrush
Retrieves a system color brush.
%group
Win32 uxtheme
%prm
hTheme, iColorId
hTheme : [intptr] Type: HTHEME Handle to theme data.
iColorId : [int] Type: int
%inst
Retrieves a system color brush.

[戻り値]
Type: HBRUSH Handle to brush data.

[備考]
If the theme data handle is not a NULL handle, GetThemeSysColorBrush
returns the brush that matches the specified color from the
SysMetrics section of the visual style. If the theme data handle is
NULL, the function returns the brush matching the global system
color.
The brush handle that is returned by this function should be released
when it is no longer needed using DeleteObject.


%index
GetThemeSysFont
Retrieves the LOGFONT of a system font.
%group
Win32 uxtheme
%prm
hTheme, iFontId, plf
hTheme : [intptr] Type: HTHEME Handle to theme data.
iFontId : [int] Type: int
plf : [var] Type: LOGFONTW* Pointer to a LOGFONT structure that receives the font information from this function.
%inst
Retrieves the LOGFONT of a system font.

[戻り値]
Type: HRESULT If this function succeeds, it returns S_OK. Otherwise,
it returns an HRESULT error code.

[備考]
This function requires vssym32.h and uxtheme.h. If the theme data
handle is not a NULL handle, this function returns the desired
LOGFONT from the SysMetrics section of the visual style. If the theme
data handle is NULL, the function returns the value of the global
system metric of the same type. The font is scaled in dots per inch
for the current logical screen.


%index
GetThemeSysInt
Retrieves the value of a system int.
%group
Win32 uxtheme
%prm
hTheme, iIntId, piValue
hTheme : [intptr] Type: HTHEME Handle to theme data.
iIntId : [int] Type: int Value of type int that specifies the desired system int. May be the following value.
piValue : [var] Type: int* Pointer to an int that receives the system integer value.
%inst
Retrieves the value of a system int.

[戻り値]
Type: HRESULT If this function succeeds, it returns S_OK. Otherwise,
it returns an HRESULT error code.


%index
GetThemeSysSize
Retrieves the value of a system size metric from theme data.
%group
Win32 uxtheme
%prm
hTheme, iSizeId
hTheme : [intptr] Type: HTHEME Handle to theme data.
iSizeId : [int] Type: int Value of type int that specifies the system size metric desired. The following values are valid:
%inst
Retrieves the value of a system size metric from theme data.

[戻り値]
Type: int Returns the size in pixels.

[備考]
If hTheme is not NULL, this function returns the size stored in the
current visual style (SysMetrics section of the visual style) scaled
to the current screen dpi. If hTheme is NULL, this function returns
the global system metric in pixels that is scaled to the current dpi
only if the application is marked as dpi-aware; otherwise, the pixels
returned are unscaled.


%index
GetThemeSysString
Retrieves the value of a system string.
%group
Win32 uxtheme
%prm
hTheme, iStringId, pszStringBuff, cchMaxStringChars
hTheme : [intptr] Type: HTHEME Handle to theme data.
iStringId : [int] Type: int
pszStringBuff : [wstr] Type: LPWSTR Pointer to the buffer that receives the string value from this function.
cchMaxStringChars : [int] Type: int Value of type int that specifies the maximum number of characters the string buffer can hold.
%inst
Retrieves the value of a system string.

[戻り値]
Type: HRESULT If this function succeeds, it returns S_OK. Otherwise,
it returns an HRESULT error code.

[備考]
If the theme data handle is not a NULL handle, this function returns
the desired string from the SysMetrics section of the visual style.
If the theme data handle is NULL, this function returns the value of
the global system metric of the same type.


%index
GetThemeTextExtent
Calculates the size and location of the specified text when rendered in the visual style font.
%group
Win32 uxtheme
%prm
hTheme, hdc, iPartId, iStateId, pszText, cchCharCount, dwTextFlags, pBoundingRect, pExtentRect
hTheme : [intptr] Type: HTHEME Handle to a window's specified theme data. Use OpenThemeData to create an HTHEME.
hdc : [intptr] Type: HDC HDC to select the font into.
iPartId : [int] Type: int Value of type int that specifies the part in which the text will be drawn. See Parts and States.
iStateId : [int] Type: int Value of type int that specifies the state of the part. See Parts and States.
pszText : [wstr] Type: LPCWSTR Pointer to a string that contains the text to draw.
cchCharCount : [int] Type: int Value of type int that contains the number of characters to draw. If the parameter is set to -1, all the characters in the string are drawn.
dwTextFlags : [int] Type: DWORD DWORD that contains one or more values that specify the string's formatting. See Format Values for possible parameter values.
pBoundingRect : [var] Type: LPCRECT Pointer to a RECT structure that contains the rectangle used to control layout of the text. This parameter may be set to NULL.
pExtentRect : [var] Type: LPRECT Pointer to a RECT structure that contains, in logical coordinates, the rectangle required to fit the rendered text.
%inst
Calculates the size and location of the specified text when rendered
in the visual style font.

[戻り値]
Type: HRESULT If this function succeeds, it returns S_OK. Otherwise,
it returns an HRESULT error code.


%index
GetThemeTextMetrics
Retrieves information about the font specified by a visual style for a particular part.
%group
Win32 uxtheme
%prm
hTheme, hdc, iPartId, iStateId, ptm
hTheme : [intptr] Type: HTHEME Handle to a window's specified theme data. Use OpenThemeData to create an HTHEME.
hdc : [intptr] Type: HDC HDC to use for screen context. This parameter may be set to NULL.
iPartId : [int] Type: int Value of type int that specifies the part to retrieve font information about. See Parts and States.
iStateId : [int] Type: int Value of type int that specifies the state of the part. See Parts and States.
ptm : [var] Type: TEXTMETRIC* Receives the font information.
%inst
Retrieves information about the font specified by a visual style for
a particular part.

[戻り値]
Type: HRESULT If this function succeeds, it returns S_OK. Otherwise,
it returns an HRESULT error code.


%index
GetThemeTimingFunction
Gets a predefined timing function based on a timing function identifier.
%group
Win32 uxtheme
%prm
hTheme, iTimingFunctionId, pTimingFunction, cbSize, pcbSizeOut
hTheme : [intptr] An opened theme handle.
iTimingFunctionId : [int] A timing function identifier.
pTimingFunction : [var] A buffer to receive a predefined timing function pointer.
cbSize : [int] The byte size of the buffer pointed by pTimingFunction.
pcbSizeOut : [var] The byte size of the timing function structure.
%inst
Gets a predefined timing function based on a timing function
identifier.

[戻り値]
If this function succeeds, it returns S_OK. Otherwise, it returns an
HRESULT error code.


%index
GetThemeTransitionDuration
Gets the duration for the specified transition.
%group
Win32 uxtheme
%prm
hTheme, iPartId, iStateIdFrom, iStateIdTo, iPropId, pdwDuration
hTheme : [intptr] Type: HTHEME Handle of the theme data.
iPartId : [int] Type: int ID of the part.
iStateIdFrom : [int] Type: int State ID of the part before the transition.
iStateIdTo : [int] Type: int State ID of the part after the transition.
iPropId : [int] Type: int Property ID.
pdwDuration : [var] Type: DWORD* Address of a variable that receives the transition duration, in milliseconds.
%inst
Gets the duration for the specified transition.

[戻り値]
Type: HRESULT If this function succeeds, it returns S_OK. Otherwise,
it returns an HRESULT error code.


%index
GetWindowTheme
Retrieves a theme handle to a window that has visual styles applied.
%group
Win32 uxtheme
%prm
hwnd
hwnd : [intptr] Type: HWND Handle of the window.
%inst
Retrieves a theme handle to a window that has visual styles applied.

[戻り値]
Type: HTHEME The most recent theme handle from OpenThemeData.

[備考]
If a window has a visual style applied, the GetWindowTheme function
returns the most recent theme handle from OpenThemeData. If no visual
style is applied, GetWindowTheme returns NULL.


%index
HitTestThemeBackground
Retrieves a hit test code for a point in the background specified by a visual style.
%group
Win32 uxtheme
%prm
hTheme, hdc, iPartId, iStateId, dwOptions, pRect, hrgn, ptTest, pwHitTestCode
hTheme : [intptr] Type: HTHEME Handle to a window's specified theme data. Use OpenThemeData to create an HTHEME.
hdc : [intptr] Type: HDC HDC to use when drawing. This parameter may be set to NULL.
iPartId : [int] Type: int Value of type int that specifies the part. See Parts and States.
iStateId : [int] Type: int Value of type int that specifies the state of the part. See Parts and States.
dwOptions : [int] Type: DWORD DWORD that specifies the hit test options. See Hit Test Options for a list of options.
pRect : [var] Type: LPCRECT Pointer to a RECT structure that contains, in logical coordinates, the rectangle that bounds the background.
hrgn : [intptr] Type: HRGN Handle to a region that can be used to specify the bounds of a hit test area. This parameter may be set to NULL.
ptTest : [int] Type: POINT
pwHitTestCode : [var] Type: WORD* WORD that receives the hit test code that indicates whether the point in ptTest is in the background area bounded by pRect or hrgn. See Hit Test Return Values for a list of values returned.
%inst
Retrieves a hit test code for a point in the background specified by
a visual style.

[戻り値]
Type: HRESULT If this function succeeds, it returns S_OK. Otherwise,
it returns an HRESULT error code.

[備考]
The values in ptTest and pRect should be in the same coordinate
system, such as client or screen. If the hrgn parameter is used, it
must be specified in the same coordinates as pRect and ptTest.


%index
IsAppThemed
現在のアプリケーションの UI がビジュアルスタイルで表示されているかを返す。
%group
Win32 uxtheme
%prm

%inst
現在のアプリケーションの UI がビジュアルスタイルで表示されているかを返す。

[戻り値]
型: BOOL 以下のいずれかの値を返す。
（以下省略）

[備考]
Windows 8
より前ではコントロールパネルからビジュアルスタイルをオフにできたため、アプリがビジュアルスタイル対応でもその時点では適用されていないことがあった。Windows
8 ではオフにできない。
DllMain やグローバルオブジェクトのコンストラクタ内で呼んではならない。戻り値が不正になる可能性がある。


%index
IsCompositionActive
Determines whether Desktop Window Manager (DWM) composition effects are available to the theme.
%group
Win32 uxtheme
%prm

%inst
Determines whether Desktop Window Manager (DWM) composition effects
are available to the theme.

[戻り値]
Type: BOOL TRUE if composition effects are available; otherwise,
FALSE.

[備考]
Composition effects are provided through the DWM. This function first
determines whether DWM is active, then checks whether it has
composition effects enabled.


%index
IsThemeActive
現在のアプリに対してビジュアルスタイルが有効かを調べる。
%group
Win32 uxtheme
%prm

%inst
現在のアプリに対してビジュアルスタイルが有効かを調べる。

[戻り値]
型: BOOL 以下のいずれかの値を返す。
（以下省略）

[備考]
DllMain やグローバルオブジェクトのコンストラクタ内で呼んではならない。戻り値が不正になる可能性がある。


%index
IsThemeBackgroundPartiallyTransparent
Retrieves whether the background specified by the visual style has transparent pieces or alpha-blended pieces.
%group
Win32 uxtheme
%prm
hTheme, iPartId, iStateId
hTheme : [intptr] Type: HTHEME Handle to a window's specified theme data. Use OpenThemeData to create an HTHEME.
iPartId : [int] Type: int Value of type int that specifies the part. See Parts and States.
iStateId : [int] Type: int Value of type int that specifies the state of the part. See Parts and States.
%inst
Retrieves whether the background specified by the visual style has
transparent pieces or alpha-blended pieces.

[戻り値]
Type: BOOL Returns one of the following values.
This doc was truncated.


%index
IsThemeDialogTextureEnabled
Reports whether a specified dialog window supports background texturing.
%group
Win32 uxtheme
%prm
hwnd
hwnd : [intptr] Type: HWND HWND value that specifies a dialog window.
%inst
Reports whether a specified dialog window supports background
texturing.

[戻り値]
Type: BOOL Returns one of the following values.
This doc was truncated.


%index
IsThemePartDefined
Retrieves whether a visual style has defined parameters for the specified part and state.
%group
Win32 uxtheme
%prm
hTheme, iPartId, iStateId
hTheme : [intptr] Type: HTHEME Handle to a window's specified theme data. Use OpenThemeData to create an HTHEME.
iPartId : [int] Type: int Value of type int that specifies the part. See Parts and States.
iStateId : [int] Type: int Currently unused. The value should be 0.
%inst
Retrieves whether a visual style has defined parameters for the
specified part and state.

[戻り値]
Type: BOOL Returns one of the following values.
This doc was truncated.


%index
OpenThemeData
ウィンドウと関連クラスに対するテーマデータを開く。
%group
Win32 uxtheme
%prm
hwnd, pszClassList
hwnd : [intptr] 型: HWND テーマデータを必要とするウィンドウのハンドル。
pszClassList : [wstr] 型: LPCWSTR セミコロン区切りのクラスリストを含む文字列へのポインタ。
%inst
ウィンドウと関連クラスに対するテーマデータを開く。

[戻り値]
型: HTHEME OpenThemeData は各クラスを順にアクティブテーマのクラスデータセクションと照合する。一致が見つかれば
HTHEME を返し、なければ NULL を返す。

[備考]
pszClassList は単一名ではなくリストで、クラスと現在のビジュアルスタイルの最適マッチを得る機会を与える。例: ID_OK
のボタンなら L"OkButton;Button" を渡すと、OkButton エントリがあればそれが使われる。Aero
テーマのクラス名は AeroStyle.xml で定義されている。


%index
OpenThemeDataEx
Opens the theme data associated with a window for specified theme classes.
%group
Win32 uxtheme
%prm
hwnd, pszClassList, dwFlags
hwnd : [intptr] Type: HWND A handle to a window or control that the theme is to be retrieved from.
pszClassList : [wstr] Type: LPCWSTR A semicolon-separated list of class names to match.
dwFlags : [int] Type: DWORD
%inst
Opens the theme data associated with a window for specified theme
classes.

[戻り値]
Type: HTHEME If a match is found, a valid handle to a theme is
returned. Otherwise, a NULL value will be returned.

[備考]
The string specified by pszClassIdList will be tokenized using
semicolons as a delimiter. The names are matched against class names
one token at a time. If no match is found for a particular token, the
next token will be matched. If a match is found, the return value of
the function will be the theme handle associated with the matched
class. Class names for the Aero theme are defined in AeroStyle.xml.


%index
OpenThemeDataForDpi
A variant of OpenThemeData that opens a theme handle associated with a specific DPI.
%group
Win32 uxtheme
%prm
hwnd, pszClassList, dpi
hwnd : [intptr] The handle of the window for which theme data is required.
pszClassList : [wstr] A pointer to a string that contains a semicolon-separated list of classes.
dpi : [int] The specified DPI value with which to associate the theme handle. The function will return an error if this value is outside of those that correspond to the set of connected monitors.
%inst
A variant of OpenThemeData that opens a theme handle associated with
a specific DPI.

[戻り値]
See OpenThemeData.

[備考]
OpenThemeData will create theme handles associated with the DPI of a
window when used with Per Monitor v2 windows. OpenThemeDataForDpi
allows you to open a theme handle for a specific DPI when you do not
have a window at that DPI. The behavior of the returned theme handle
will be undermined if the requested DPI value does not correspond to
a currently connected display. The theming system only loads theme
assets for the set of DPI values corresponding to the currently
connected displays. The theme handle will become invalid anytime the
system reloads the theme data. Applications are required to monitor
WM_THEMECHANGED and close and reopen all theme handles in response.
This behavior is the same regardless of whether the handles were
opened via OpenThemeData or OpenThemeDataForDpi.


%index
SetThemeAppProperties
Sets the flags that determine how visual styles are implemented in the calling application.
%group
Win32 uxtheme
%prm
dwFlags
dwFlags : [int] Type: DWORD DWORD that specifies one or more of the following bit flags, which can be combined with a logical OR.
%inst
Sets the flags that determine how visual styles are implemented in
the calling application.

[備考]
After you set the flags, send a WM_THEMECHANGED message to your
application's main window for the changes to take effect.


%index
SetWindowTheme
ウィンドウがクラスで通常使用されるのとは異なるビジュアルスタイル情報を使うようにする。
%group
Win32 uxtheme
%prm
hwnd, pszSubAppName, pszSubIdList
hwnd : [intptr] 型: HWND ビジュアルスタイルを変更するウィンドウのハンドル。
pszSubAppName : [wstr] 型: LPCWSTR 呼び出し元アプリ名の代わりに使うアプリ名文字列へのポインタ。NULL の場合は呼び出し元アプリ名を使う。
pszSubIdList : [wstr] 型: LPCWSTR ウィンドウクラスが渡す実リストの代わりに使う、セミコロン区切りの CLSID 名リスト。NULL の場合はクラスからの ID リストを使う。
%inst
ウィンドウがクラスで通常使用されるのとは異なるビジュアルスタイル情報を使うようにする。

[戻り値]
型: HRESULT 成功時は S_OK、失敗時は HRESULT エラーコードを返す。

[備考]
テーママネージャはウィンドウの生存期間中、pszSubAppName と pszSubIdList
の関連付けを保持する(ビジュアルスタイルが変わっても)。SetWindowTheme 呼び出し完了時、ウィンドウに
WM_THEMECHANGED が送信されて新しいビジュアルスタイルが適用される。
pszSubAppName と pszSubIdList の両方が NULL の場合、テーママネージャは以前の関連付けを削除する。空文字列
(L" ") を指定するとどのセクションにも一致しないためビジュアルスタイルの適用を回避できる。


%index
SetWindowThemeAttribute
Sets attributes to control how visual styles are applied to a specified window.
%group
Win32 uxtheme
%prm
hwnd, eAttribute, pvAttribute, cbAttribute
hwnd : [intptr] Type: HWND Handle to a window to apply changes to.
eAttribute : [int] 
pvAttribute : [intptr] Type: PVOID A pointer that specifies attributes to set. Type is determined by the value of the eAttribute value.
cbAttribute : [int] Type: DWORD Specifies the size, in bytes, of the data pointed to by pvAttribute.
%inst
Sets attributes to control how visual styles are applied to a
specified window.

[戻り値]
Type: HRESULT If this function succeeds, it returns S_OK. Otherwise,
it returns an HRESULT error code.


%index
UpdatePanningFeedback
Updates clients about state of a window resulting from a panning gesture. This function can only be called after a BeginPanningFeedback call.
%group
Win32 uxtheme
%prm
hwnd, lTotalOverpanOffsetX, lTotalOverpanOffsetY, fInInertia
hwnd : [intptr] Type: HWND The handle to the target window that will receive feedback. For the method to succeed, this must be the same HWND as provided in BeginPanningFeedback.
lTotalOverpanOffsetX : [int] Type: LONG The total displacement that the window has moved in the horizontal direction since the end of scrollable region was reached. A maximum displacement of 30 pixels is allowed.
lTotalOverpanOffsetY : [int] Type: LONG The total displacement that the window has moved in the vertical direction since the end of scrollable region was reached. A maximum displacement of 30 pixels is allowed.
fInInertia : [int] Type: BOOL Flag indicating whether the application is handling a WM_GESTURE message with the GF_INERTIA FLAG set.
%inst
Updates clients about state of a window resulting from a panning
gesture. This function can only be called after a
BeginPanningFeedback call.

[戻り値]
Type: BOOL TRUE if successful.

[備考]
Incremental calls to this function should always pass the sum of the
increments and not just the latest increment itself.

