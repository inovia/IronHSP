; ============================================================
;   dwmapi.dll ヘルプ (CsWin32 / win32metadata から自動抽出)
;   docs_ja.json に日本語訳があればそちらを使用、無ければ英語原文。
;   翻訳を追加するときは docs_ja.json を編集して再生成。
; ============================================================

%index
DwmAttachMilContent
This function is not implemented. (DwmAttachMilContent)
%group
Win32 dwmapi
%prm
hwnd
hwnd : [intptr] 
%inst
This function is not implemented. (DwmAttachMilContent)

[戻り値]
If this function succeeds, it returns S_OK. Otherwise, it returns an
HRESULT error code.


%index
DwmDefWindowProc
Default window procedure for Desktop Window Manager (DWM) hit testing within the non-client area.
%group
Win32 dwmapi
%prm
hWnd, msg, wParam, lParam, plResult
hWnd : [intptr] A handle to the window procedure that received the message.
msg : [int] The message.
wParam : [intptr] Specifies additional message information. The content of this parameter depends on the value of the msg parameter.
lParam : [intptr] Specifies additional message information. The content of this parameter depends on the value of the msg parameter.
plResult : [intptr] A pointer to an LRESULT value that, when this method returns successfully,receives the result of the hit test.
%inst
Default window procedure for Desktop Window Manager (DWM) hit testing
within the non-client area.

[戻り値]
TRUE if DwmDefWindowProc handled the message; otherwise, FALSE.

[備考]
When creating custom frames that include the standard caption
buttons, WM_NCHITTEST and other non-client hit test messages should
first be passed to the DwmDefWindowProc function. This enables the
DWM to provide hit testing for the captions buttons. If
DwmDefWindowProc does not handle the non-client hit test messages,
further processing of these messages might be necessary.


%index
DwmDetachMilContent
This function is not implemented. (DwmDetachMilContent)
%group
Win32 dwmapi
%prm
hwnd
hwnd : [intptr] 
%inst
This function is not implemented. (DwmDetachMilContent)

[戻り値]
If this function succeeds, it returns S_OK. Otherwise, it returns an
HRESULT error code.


%index
DwmEnableBlurBehindWindow
指定されたウィンドウでブラー効果を有効にする。
%group
Win32 dwmapi
%prm
hWnd, pBlurBehind
hWnd : [intptr] ブラー効果を適用するウィンドウへのハンドル。
pBlurBehind : [var] `[in]` ブラー効果のデータを提供する DWM_BLURBEHIND 構造体へのポインタ。
%inst
指定されたウィンドウでブラー効果を有効にする。

[戻り値]
成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコード。

[備考]
Windows 8 以降ではレンダリング方式の変更により、この関数を呼び出してもブラー効果は適用されない。DWM_BLURBEHIND
構造体の fEnable を TRUE に設定することでブラーを有効化する。この関数は BeginPaint
の直前に呼ぶこと。ウィンドウ内のアルファ値は尊重される。一部の GDI
操作はアルファ値を保持しないため子ウィンドウの扱いには注意が必要。DWM_BLURBEHIND
内のリージョンは呼び出し元の所有となり、呼び出し後すぐに解放可能。この関数はトップレベルウィンドウでのみ呼び出せる。DWM
コンポジションが切り替わるたびに再呼び出しが必要(WM_DWMCOMPOSITIONCHANGED で処理)。


%index
DwmEnableComposition
Enables or disables Desktop Window Manager (DWM) composition.
%group
Win32 dwmapi
%prm
uCompositionAction
uCompositionAction : [int] DWM_EC_ENABLECOMPOSITION to enable DWM composition; DWM_EC_DISABLECOMPOSITION to disable composition.
%inst
Enables or disables Desktop Window Manager (DWM) composition.

[戻り値]
If this function succeeds, it returns S_OK. Otherwise, it returns an
HRESULT error code.

[備考]
Disabling DWM composition disables it for the entire desktop. DWM
composition will be automatically enabled when all processes that
have disabled composition have called DwmEnableComposition to enable
it or have been terminated. The WM_DWMCOMPOSITIONCHANGED notification
is sent whenever DWM composition is enabled or disabled.


%index
DwmEnableMMCSS
Notifies the Desktop Window Manager (DWM) to opt in to or out of Multimedia Class Schedule Service (MMCSS) scheduling while the calling process is alive.
%group
Win32 dwmapi
%prm
fEnableMMCSS
fEnableMMCSS : [int] TRUE to instruct DWM to participate in MMCSS scheduling; FALSE to opt out or end participation in MMCSS scheduling.
%inst
Notifies the Desktop Window Manager (DWM) to opt in to or out of
Multimedia Class Schedule Service (MMCSS) scheduling while the
calling process is alive.

[戻り値]
If this function succeeds, it returns S_OK. Otherwise, it returns an
HRESULT error code.

[備考]
DWM will be scheduled by the MMCSS as long as any process that called
DwmEnableMMCSS to enable MMCSS is active and has not previously
called DwmEnableMMCSS to disable MMCSS.


%index
DwmExtendFrameIntoClientArea
ウィンドウフレームをクライアント領域に拡張する。
%group
Win32 dwmapi
%prm
hWnd, pMarInset
hWnd : [intptr] フレームをクライアント領域へ拡張するウィンドウへのハンドル。
pMarInset : [var] フレームをクライアント領域に拡張する際に使用するマージンを記述する MARGINS 構造体へのポインタ。
%inst
ウィンドウフレームをクライアント領域に拡張する。

[戻り値]
成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコード。

[備考]
DWM コンポジションが切り替わるたびにこの関数を呼ぶ必要がある(WM_DWMCOMPOSITIONCHANGED
で処理)。負のマージン値を使用すると「シート・オブ・グラス」効果を作成できる。


%index
DwmFlush
Issues a flush call that blocks the caller until the next present, when all of the Microsoft DirectX surface updates that are currently outstanding have been made. This compensates for very complex scenes or calling processes with very low priority.
%group
Win32 dwmapi
%prm

%inst
Issues a flush call that blocks the caller until the next present,
when all of the Microsoft DirectX surface updates that are currently
outstanding have been made. This compensates for very complex scenes
or calling processes with very low priority.

[戻り値]
If this function succeeds, it returns S_OK. Otherwise, it returns an
HRESULT error code.

[備考]
DwmFlush waits for any queued DirectX changes that were queued by the
calling application to be drawn to the screen before returning. It
does not flush the entire session rendering batch.


%index
DwmGetColorizationColor
Retrieves the current color used for Desktop Window Manager (DWM) glass composition.
%group
Win32 dwmapi
%prm
pcrColorization, pfOpaqueBlend
pcrColorization : [var] A pointer to a value that, when this function returns successfully, receives the current color used for glass composition. The color format of the value is 0xAARRGGBB.
pfOpaqueBlend : [var] A pointer to a value that, when this function returns successfully, indicates whether the color is an opaque blend. TRUE if the color is an opaque blend; otherwise, FALSE.
%inst
Retrieves the current color used for Desktop Window Manager (DWM)
glass composition.

[戻り値]
If this function succeeds, it returns S_OK. Otherwise, it returns an
HRESULT error code.

[備考]
The value pointed to by pcrColorization is in an 0xAARRGGBB format.
Many Microsoft Win32 APIs, such as COLORREF, use a 0x00BBGGRR format.
Be careful to assure that the intended colors are used.


%index
DwmGetCompositionTimingInfo
Retrieves the current composition timing information for a specified window.
%group
Win32 dwmapi
%prm
hwnd, pTimingInfo
hwnd : [intptr] The handle to the window for which the composition timing information should be retrieved.
pTimingInfo : [var] A pointer to a DWM_TIMING_INFO structure that, when this function returns successfully, receives the current composition timing information for the window. The cbSize member of this structure must be set before this function is called.
%inst
Retrieves the current composition timing information for a specified
window.

[戻り値]
If this function succeeds, it returns S_OK. Otherwise, it returns an
HRESULT error code.


%index
DwmGetGraphicsStreamClient
This function is not implemented. (DwmGetGraphicsStreamClient)
%group
Win32 dwmapi
%prm
uIndex, pClientUuid
uIndex : [int] 
pClientUuid : [var] 
%inst
This function is not implemented. (DwmGetGraphicsStreamClient)

[戻り値]
If this function succeeds, it returns S_OK. Otherwise, it returns an
HRESULT error code.


%index
DwmGetGraphicsStreamTransformHint
This function is not implemented. (DwmGetGraphicsStreamTransformHint)
%group
Win32 dwmapi
%prm
uIndex, pTransform
uIndex : [int] 
pTransform : [var] 
%inst
This function is not implemented. (DwmGetGraphicsStreamTransformHint)

[戻り値]
If this function succeeds, it returns S_OK. Otherwise, it returns an
HRESULT error code.


%index
DwmGetTransportAttributes
Retrieves transport attributes.
%group
Win32 dwmapi
%prm
pfIsRemoting, pfIsConnected, pDwGeneration
pfIsRemoting : [var] A pointer to a BOOL value that indicates whether the transport supports remoting. TRUE if the transport supports remoting; otherwise, FALSE.
pfIsConnected : [var] A pointer to a BOOL value that indicates whether the transport is connected. TRUE if the transport is connected; otherwise, FALSE.
pDwGeneration : [var] A pointer to a DWORD that receives a generation value for the transport.
%inst
Retrieves transport attributes.

[戻り値]
If this function succeeds, it returns S_OK. Otherwise, it returns an
HRESULT error code.


%index
DwmGetUnmetTabRequirements
This function was part of an experimental feature that was never implemented in Windows. It has no effect and should not be used.
%group
Win32 dwmapi
%prm
appWindow, value
appWindow : [intptr] This parameter is not used.
value : [var] 
%inst
This function was part of an experimental feature that was never
implemented in Windows. It has no effect and should not be used.


%index
DwmGetWindowAttribute
ウィンドウに適用されている DWM 属性の現在値を取得する。
%group
Win32 dwmapi
%prm
hwnd, dwAttribute, pvAttribute, cbAttribute
hwnd : [intptr] 属性値を取得するウィンドウへのハンドル。
dwAttribute : [int] 取得する値を記述するフラグ(DWMWINDOWATTRIBUTE 列挙体の値)。どの属性を取得するかを指定し、pvAttribute は属性値を受け取るオブジェクトを指す。
pvAttribute : [intptr] 属性の現在値を受け取る変数へのポインタ。取得される値の型は dwAttribute の値に依存する。DWMWINDOWATTRIBUTE 列挙体の各フラグの行に、どの型へのポインタを渡すべきかが示されている。
cbAttribute : [int] pvAttribute で受け取る属性値のサイズ(バイト単位)。取得される値の型とそのバイトサイズは dwAttribute の値に依存する。
%inst
ウィンドウに適用されている DWM 属性の現在値を取得する。

[戻り値]
型: HRESULT 関数が成功した場合、S_OK を返す。それ以外の場合は HRESULT エラーコード。


%index
DwmInvalidateIconicBitmaps
Called by an application to indicate that all previously provided iconic bitmaps from a window, both thumbnails and peek representations, should be refreshed.
%group
Win32 dwmapi
%prm
hwnd
hwnd : [intptr] A handle to the window or tab whose bitmaps are being invalidated through this call. This window must belong to the calling process.
%inst
Called by an application to indicate that all previously provided
iconic bitmaps from a window, both thumbnails and peek
representations, should be refreshed.

[戻り値]
If this function succeeds, it returns S_OK. Otherwise, it returns an
HRESULT error code.

[備考]
Calling this function causes the Desktop Window Manager (DWM) to
invalidate its current bitmaps for the window and request new bitmaps
from the window when they are next needed. DwmInvalidateIconicBitmaps
should not be called frequently. Doing so can lead to poor
performance as new bitmaps are created and retrieved.


%index
DwmIsCompositionEnabled
Obtains a value that indicates whether Desktop Window Manager (DWM) composition is enabled. Applications on machines running Windows?7 or earlier can listen for composition state changes by handling the WM_DWMCOMPOSITIONCHANGED notification.
%group
Win32 dwmapi
%prm
pfEnabled
pfEnabled : [var] A pointer to a value that, when this function returns successfully, receives TRUE if DWM composition is enabled; otherwise, FALSE.
%inst
Obtains a value that indicates whether Desktop Window Manager (DWM)
composition is enabled. Applications on machines running Windows 7 or
earlier can listen for composition state changes by handling the
WM_DWMCOMPOSITIONCHANGED notification.

[戻り値]
If this function succeeds, it returns S_OK. Otherwise, it returns an
HRESULT error code.


%index
DwmModifyPreviousDxFrameDuration
Changes the number of monitor refreshes through which the previous frame will be displayed. DwmModifyPreviousDxFrameDuration is no longer supported. Starting with Windows?8.1, calls to DwmModifyPreviousDxFrameDuration always return E_NOTIMPL.
%group
Win32 dwmapi
%prm
hwnd, cRefreshes, fRelative
hwnd : [intptr] The handle to the window for which the new duration is applied to the previous frame.
cRefreshes : [int] The number of refreshes to apply to the previous frame.
fRelative : [int] TRUE if the value given in cRefreshes is relative to the current value (added to or subtracted from it); FALSE if the value replaces the current value.
%inst
Changes the number of monitor refreshes through which the previous
frame will be displayed. DwmModifyPreviousDxFrameDuration is no
longer supported. Starting with Windows 8.1, calls to
DwmModifyPreviousDxFrameDuration always return E_NOTIMPL.

[戻り値]
This function always returns S_OK, even when DWM is not running.


%index
DwmQueryThumbnailSourceSize
Retrieves the source size of the Desktop Window Manager (DWM) thumbnail.
%group
Win32 dwmapi
%prm
hThumbnail, pSize
hThumbnail : [int] A handle to the thumbnail to retrieve the source window size from.
pSize : [var] A pointer to a SIZE structure that, when this function returns successfully, receives the size of the source thumbnail.
%inst
Retrieves the source size of the Desktop Window Manager (DWM)
thumbnail.

[戻り値]
If this function succeeds, it returns S_OK. Otherwise, it returns an
HRESULT error code.


%index
DwmRegisterThumbnail
Creates a Desktop Window Manager (DWM) thumbnail relationship between the destination and source windows.
%group
Win32 dwmapi
%prm
hwndDestination, hwndSource, phThumbnailId
hwndDestination : [intptr] The handle to the window that will use the DWM thumbnail. Setting the destination window handle to anything other than a top-level window type will result in a return value of E_INVALIDARG.
hwndSource : [intptr] The handle to the window to use as the thumbnail source. Setting the source window handle to anything other than a top-level window type will result in a return value of E_INVALIDARG.
phThumbnailId : [var] A pointer to a handle that, when this function returns successfully, represents the registration of the DWM thumbnail.
%inst
Creates a Desktop Window Manager (DWM) thumbnail relationship between
the destination and source windows.

[戻り値]
If this function succeeds, it returns S_OK. Otherwise, it returns an
HRESULT error code.

[備考]
Registering a DWM thumbnail relationship will not modify desktop
composition; for information about thumbnail positioning, see the
documentation for the DwmUpdateThumbnailProperties function. The
window designated by hwndDestination must either be the desktop
window itself or be owned by the process that is calling
DwmRegisterThumbnail. This is required to prevent applications from
affecting the content of other applications. The thumbnail
registration handle obtained by this function is not globally unique
but is unique to the process. Call the DwmUnregisterThumbnail
function to unregister the thumbnail. This must be done within the
process that the relationship was registered in.


%index
DwmRenderGesture
Notifies Desktop Window Manager (DWM) that a touch contact has been recognized as a gesture, and that DWM should draw feedback for that gesture.
%group
Win32 dwmapi
%prm
gt, cContacts, pdwPointerID, pPoints
gt : [int] 
cContacts : [int] The number of contact points.
pdwPointerID : [var] The pointer ID.
pPoints : [var] The points.
%inst
Notifies Desktop Window Manager (DWM) that a touch contact has been
recognized as a gesture, and that DWM should draw feedback for that
gesture.


%index
DwmSetDxFrameDuration
Sets the number of monitor refreshes through which to display the presented frame. DwmSetDxFrameDuration is no longer supported. Starting with Windows?8.1, calls to DwmSetDxFrameDuration always return E_NOTIMPL.
%group
Win32 dwmapi
%prm
hwnd, cRefreshes
hwnd : [intptr] The handle to the window that displays the presented frame.
cRefreshes : [int] The number of refreshes through which to display the presented frame.
%inst
Sets the number of monitor refreshes through which to display the
presented frame. DwmSetDxFrameDuration is no longer supported.
Starting with Windows 8.1, calls to DwmSetDxFrameDuration always
return E_NOTIMPL.

[戻り値]
This function always returns S_OK, even when the frame duration is
not changed or DWM is not running.

[備考]
The DWM will attempt to display the presented frame for at least the
number of monitor refreshes specified. It might be impossible to
display the frame for the precise number of refreshes due to the
current composition rate. If the frame is presented late to the DWM
or the DWM is late in composing, a frame could be displayed for fewer
than the number of refreshes requested or even skipped completely.


%index
DwmSetIconicLivePreviewBitmap
Sets a static, iconic bitmap to display a live preview (also known as a Peek preview) of a window or tab. The taskbar can use this bitmap to show a full-sized preview of a window or tab.
%group
Win32 dwmapi
%prm
hwnd, hbmp, pptClient, dwSITFlags
hwnd : [intptr] A handle to the window. This window must belong to the calling process.
hbmp : [intptr] A handle to the bitmap to represent the window that hwnd specifies.
pptClient : [var] The offset of a tab window's client region (the content area inside the client window frame) from the host window's frame. This offset enables the tab window's contents to be drawn correctly in a live preview  when it is drawn without its frame.
dwSITFlags : [int] The display options for the live preview. This parameter can be 0 or the following value.
%inst
Sets a static, iconic bitmap to display a live preview (also known as
a Peek preview) of a window or tab. The taskbar can use this bitmap
to show a full-sized preview of a window or tab.

[戻り値]
Returns S_OK if the function succeeds, or an error value otherwise.
Note that because this bitmap is not cached, if the window is not
being previewed when an application calls this function, the function
returns a success code but the bitmap is discarded and not used.

[備考]
A live preview (also known as a Peek preview) of a window appears
when a user moves the mouse pointer over the window's thumbnail in
the taskbar or gives the thumbnail focus in the ALT+TAB window. This
view is a full-sized view of the window and can be a snapshot or an
iconic representation. A window typically calls the
DwmSetIconicLivePreviewBitmap function in response to a
WM_DWMSENDICONICLIVEPREVIEWBITMAP message. The returned bitmap must
not be larger than the client area of the window or frame and must
have 32-bit color depth. The Desktop Window Manager (DWM) uses a copy
of the bitmap, but the caller retains ownership of the original
bitmap and is responsible for freeing the resources that it uses when
it is no longer needed. The DWM does not keep its copy of the bitmap
when the DWM stops displaying the live preview representation.


%index
DwmSetIconicThumbnail
Sets a static, iconic bitmap on a window or tab to use as a thumbnail representation. The taskbar can use this bitmap as a thumbnail switch target for the window or tab.
%group
Win32 dwmapi
%prm
hwnd, hbmp, dwSITFlags
hwnd : [intptr] A handle to the window or tab. This window must belong to the calling process.
hbmp : [intptr] A handle to the bitmap to represent the window that hwnd specifies.
dwSITFlags : [int] 
%inst
Sets a static, iconic bitmap on a window or tab to use as a thumbnail
representation. The taskbar can use this bitmap as a thumbnail switch
target for the window or tab.

[戻り値]
If this function succeeds, it returns S_OK. Otherwise, it returns an
HRESULT error code.

[備考]
An application typically calls the DwmSetIconicThumbnail function
after it receives a WM_DWMSENDICONICTHUMBNAIL message for its window.
The thumbnail should not exceed the maximum x-coordinate and
y-coordinate that are specified in that message. The thumbnail must
also have a 32-bit color depth. The application calls
DwmInvalidateIconicBitmaps to indicate to the Desktop Window Manager
(DWM) that the iconic thumbnail and live preview bitmaps are
out-of-date and should be refreshed. The DWM then requests new
versions from the window when they are needed. However, if the DWM
bitmap cache is full, DWM will not request updated versions. The DWM
uses a copy of the bitmap, but the application can release this copy
at any time because of memory constraints. If the copy is released,
the window is not notified, but it might receive a subsequent
WM_DWMSENDICONICTHUMBNAIL request when its thumbnail is needed again.
The caller retains ownership of the original bitmap and is
responsible for freeing the resources that it uses when it is no
longer needed.


%index
DwmSetPresentParameters
Sets the present parameters for frame composition. DwmSetPresentParameters is no longer supported. Starting with Windows?8.1, calls to DwmSetPresentParameters always return E_NOTIMPL.
%group
Win32 dwmapi
%prm
hwnd, pPresentParams
hwnd : [intptr] The handle to the window where the present parameters are applied.
pPresentParams : [var] A pointer to a DWM_PRESENT_PARAMETERS structure that contains DWM video frame parameters for frame composition.
%inst
Sets the present parameters for frame composition.
DwmSetPresentParameters is no longer supported. Starting with Windows
8.1, calls to DwmSetPresentParameters always return E_NOTIMPL.

[戻り値]
This function always returns S_OK.


%index
DwmSetWindowAttribute
ウィンドウの DWM 非クライアント領域レンダリング属性の値を設定する。
%group
Win32 dwmapi
%prm
hwnd, dwAttribute, pvAttribute, cbAttribute
hwnd : [intptr] 属性値を設定するウィンドウへのハンドル。
dwAttribute : [int] 設定する値を記述するフラグ(DWMWINDOWATTRIBUTE 列挙体の値)。どの属性を設定するかを指定し、pvAttribute は属性値を含むオブジェクトを指す。
pvAttribute : [intptr] 設定する属性値を含むオブジェクトへのポインタ。値の型は dwAttribute の値に依存する。
cbAttribute : [int] pvAttribute で設定する属性値のサイズ(バイト単位)。型とバイトサイズは dwAttribute の値に依存する。
%inst
ウィンドウの DWM 非クライアント領域レンダリング属性の値を設定する。

[戻り値]
型: HRESULT 関数が成功した場合、S_OK を返す。それ以外の場合は HRESULT エラーコード。Desktop
Composition が無効化されている場合(Windows 7 以前)、DWM_E_COMPOSITIONDISABLED を返す。

[備考]
dwAttribute に DWMWA_NCRENDERING_ENABLED
を指定してこの関数を呼び出すのは無効。非クライアント領域レンダリングの有効/無効を切り替えるには
DWMWA_NCRENDERING_POLICY 属性に対して設定する。


%index
DwmShowContact
Called by an app or framework to specify the visual feedback type to draw in response to a particular touch or pen contact.
%group
Win32 dwmapi
%prm
dwPointerID, eShowContact
dwPointerID : [int] The pointer ID of the contact. Each touch or pen contact is given a unique ID when it is detected.
eShowContact : [int] 
%inst
Called by an app or framework to specify the visual feedback type to
draw in response to a particular touch or pen contact.

[戻り値]
If dwPointerID does not match that of a contact currently present on
the screen, this function returns E_INVALIDARG; otherwise, it returns
S_OK.

[備考]
It is safe to call this function on the UI thread.


%index
DwmTetherContact
Enables the graphical feedback of touch and drag interactions to the user.
%group
Win32 dwmapi
%prm
dwPointerID, fEnable, ptTether
dwPointerID : [int] The pointer ID.
fEnable : [int] Indicates whether the contact is enabled.
ptTether : [int] The tether.
%inst
Enables the graphical feedback of touch and drag interactions to the
user.


%index
DwmTransitionOwnedWindow
Coordinates the animations of tool windows with the Desktop Window Manager (DWM).
%group
Win32 dwmapi
%prm
hwnd, target
hwnd : [intptr] Handle to the window.
target : [int] 
%inst
Coordinates the animations of tool windows with the Desktop Window
Manager (DWM).


%index
DwmUnregisterThumbnail
Removes a Desktop Window Manager (DWM) thumbnail relationship created by the DwmRegisterThumbnail function.
%group
Win32 dwmapi
%prm
hThumbnailId
hThumbnailId : [int] The handle to the thumbnail relationship to be removed. Null or non-existent handles will result in a return value of E_INVALIDARG.
%inst
Removes a Desktop Window Manager (DWM) thumbnail relationship created
by the DwmRegisterThumbnail function.

[戻り値]
If this function succeeds, it returns S_OK. Otherwise, it returns an
HRESULT error code.

[備考]
Unregistering DWM thumbnail relationships must be done within the
process that registered the relationships.


%index
DwmUpdateThumbnailProperties
Updates the properties for a Desktop Window Manager (DWM) thumbnail.
%group
Win32 dwmapi
%prm
hThumbnailId, ptnProperties
hThumbnailId : [int] The handle to the DWM thumbnail to be updated. Null or invalid thumbnails, as well as thumbnails owned by other processes will result in a return value of E_INVALIDARG.
ptnProperties : [var] A pointer to a DWM_THUMBNAIL_PROPERTIES structure that contains the new thumbnail properties.
%inst
Updates the properties for a Desktop Window Manager (DWM) thumbnail.

[戻り値]
If this function succeeds, it returns S_OK. Otherwise, it returns an
HRESULT error code.

[備考]
Thumbnail relationships created by the DwmRegisterThumbnail function
will not be rendered to the destination window until this function is
called. Subsequent calls will update the thumbnail according to the
provided properties.

