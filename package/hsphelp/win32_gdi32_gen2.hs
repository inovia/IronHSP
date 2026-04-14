; ============================================================
;   gdi32.dll ヘルプ (CsWin32 / win32metadata から自動抽出)
;   docs_ja.json に日本語訳があればそちらを使用、無ければ英語原文。
;   翻訳を追加するときは docs_ja.json を編集して再生成。
; ============================================================

%index
DeleteObject
論理ペン、ブラシ、フォント、ビットマップ、リージョン、パレットを削除し、関連するシステムリソースをすべて解放する。削除後、指定されたハンドルは無効となる。
%group
Win32 gdi32
%prm
ho
ho : [intptr] 論理ペン、ブラシ、フォント、ビットマップ、リージョン、パレットへのハンドル。
%inst

論理ペン、ブラシ、フォント、ビットマップ、リージョン、パレットを削除し、関連するシステムリソースをすべて解放する。削除後、指定されたハンドルは無効となる。

[戻り値]
関数が成功した場合、戻り値は 0 以外。指定ハンドルが無効、または現在 DC に選択中の場合は 0。

[備考]
DC
に選択中の描画オブジェクト(ペンやブラシ)は削除してはならない。パターンブラシを削除してもそれに関連付けられたビットマップは削除されない。ビットマップは別途削除する必要がある。


%index
AbortDoc
The AbortDoc function stops the current print job and erases everything drawn since the last call to the StartDoc function.
%group
Win32 gdi32
%prm
hdc
hdc : [intptr] Handle to the device context for the print job.
%inst
The AbortDoc function stops the current print job and erases
everything drawn since the last call to the StartDoc function.

[戻り値]
If the function succeeds, the return value is greater than zero. If
the function fails, the return value is SP_ERROR.

[備考]
Note This is a blocking or synchronous function and might not return
immediately. How quickly this function returns depends on run-time
factors such as network status, print server configuration, and
printer driver implementation?factors that are difficult to predict
when writing an application. Calling this function from a thread that
manages interaction with the user interface could make the
application appear to be unresponsive. Applications should call the
AbortDoc function to stop a print job if an error occurs, or to stop
a print job after the user cancels that job. To end a successful
print job, an application should call the EndDoc function. If Print
Manager was used to start the print job, calling AbortDoc erases the
entire spool job, so that the printer receives nothing. If Print
Manager was not used to start the print job, the data may already
have been sent to the printer. In this case, the printer driver
resets the printer (when possible) and ends the print job.


%index
AbortPath
The AbortPath function closes and discards any paths in the specified device context.
%group
Win32 gdi32
%prm
hdc
hdc : [intptr] Handle to the device context from which a path will be discarded.
%inst
The AbortPath function closes and discards any paths in the specified
device context.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero.

[備考]
If there is an open path bracket in the given device context, the
path bracket is closed and the path is discarded. If there is a
closed path in the device context, the path is discarded.


%index
AddFontMemResourceEx
The AddFontMemResourceEx function adds the font resource from a memory image to the system.
%group
Win32 gdi32
%prm
pFileView, cjSize, pvResrved, pNumFonts
pFileView : [intptr] A pointer to a font resource.
cjSize : [int] The number of bytes in the font resource that is pointed to by pbFont.
pvResrved : [intptr] Reserved. Must be 0.
pNumFonts : [var] A pointer to a variable that specifies the number of fonts installed.
%inst
The AddFontMemResourceEx function adds the font resource from a
memory image to the system.

[戻り値]
If the function succeeds, the return value specifies the handle to
the font added. This handle uniquely identifies the fonts that were
installed on the system. If the function fails, the return value is
zero. No extended error information is available.

[備考]
This function allows an application to get a font that is embedded in
a document or a webpage. A font that is added by AddFontMemResourceEx
is always private to the process that made the call and is not
enumerable. A memory image can contain more than one font. When this
function succeeds, pcFonts is a pointer to a DWORD whose value is the
number of fonts added to the system as a result of this call. For
example, this number could be 2 for the vertical and horizontal faces
of an Asian font. When the function succeeds, the caller of this
function can free the memory pointed to by pbFont because the system
has made its own copy of the memory. To remove the fonts that were
installed, call RemoveFontMemResourceEx. However, when the process
goes away, the system will unload the fonts even if the process did
not call RemoveFontMemResource.


%index
AddFontResourceW
The AddFontResource function adds the font resource from the specified file to the system font table. The font can subsequently be used for text output by any application. (Unicode)
%group
Win32 gdi32
%prm
param0
param0 : [wstr] 
%inst
The AddFontResource function adds the font resource from the
specified file to the system font table. The font can subsequently be
used for text output by any application. (Unicode)

[戻り値]
If the function succeeds, the return value specifies the number of
fonts added. If the function fails, the return value is zero. No
extended error information is available.

[備考]
Any application that adds or removes fonts from the system font table
should notify other windows of the change by sending a WM_FONTCHANGE
message to all top-level windows in the operating system. The
application should send this message by calling the SendMessage
function and setting the hwnd parameter to HWND_BROADCAST. When an
application no longer needs a font resource that it loaded by calling
the AddFontResource function, it must remove that resource by calling
the RemoveFontResource function. This function installs the font only
for the current session. When the system restarts, the font will not
be present. To have the font installed even after restarting the
system, the font must be listed in the registry. A font listed in the
registry and installed to a location other than the %windir%\fonts\
folder cannot be modified, deleted, or replaced as long as it is
loaded in any session. In order to change one of these fonts, it must
first be removed by calling RemoveFontResource, removed from the font
registry (HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows
NT\CurrentVersion\Fonts), and the system restarted. After restarting
the system, the font will no longer be loaded and can be changed.
> [!NOTE] > The wingdi.h header defines AddFontResource as an alias
which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
AddFontResourceExW
The AddFontResourceEx function adds the font resource from the specified file to the system. Fonts added with the AddFontResourceEx function can be marked as private and not enumerable. (Unicode)
%group
Win32 gdi32
%prm
name, fl, res
name : [wstr] A pointer to a null-terminated character string that contains a valid font file name. This parameter can specify any of the following files.
fl : [int] 
res : [intptr] Reserved. Must be zero.
%inst
The AddFontResourceEx function adds the font resource from the
specified file to the system. Fonts added with the AddFontResourceEx
function can be marked as private and not enumerable. (Unicode)

[戻り値]
If the function succeeds, the return value specifies the number of
fonts added. If the function fails, the return value is zero. No
extended error information is available.

[備考]
This function allows a process to use fonts without allowing other
processes access to the fonts. When an application no longer needs a
font resource it loaded by calling the AddFontResourceEx function, it
must remove the resource by calling the RemoveFontResourceEx
function. This function installs the font only for the current
session. When the system restarts, the font will not be present. To
have the font installed even after restarting the system, the font
must be listed in the registry. A font listed in the registry and
installed to a location other than the %windir%\fonts\ folder cannot
be modified, deleted, or replaced as long as it is loaded in any
session. In order to change one of these fonts, it must first be
removed by calling RemoveFontResource, removed from the font registry
(HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows
NT\CurrentVersion\Fonts), and the system restarted. After restarting
the system, the font will no longer be loaded and can be changed.
> [!NOTE] > The wingdi.h header defines AddFontResourceEx as an alias
which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
AngleArc
The AngleArc function draws a line segment and an arc.
%group
Win32 gdi32
%prm
hdc, x, y, r, StartAngle, SweepAngle
hdc : [intptr] Handle to a device context.
x : [int] Specifies the x-coordinate, in logical units, of the center of the circle.
y : [int] Specifies the y-coordinate, in logical units, of the center of the circle.
r : [int] Specifies the radius, in logical units, of the circle. This value must be positive.
StartAngle : [float] Specifies the start angle, in degrees, relative to the x-axis.
SweepAngle : [float] Specifies the sweep angle, in degrees, relative to the starting angle.
%inst
The AngleArc function draws a line segment and an arc.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero.

[備考]
The AngleArc function moves the current position to the ending point
of the arc. The arc drawn by this function may appear to be
elliptical, depending on the current transformation and mapping mode.
Before drawing the arc, AngleArc draws the line segment from the
current position to the beginning of the arc. The arc is drawn by
constructing an imaginary circle around the specified center point
with the specified radius. The starting point of the arc is
determined by measuring counterclockwise from the x-axis of the
circle by the number of degrees in the start angle. The ending point
is similarly located by measuring counterclockwise from the starting
point by the number of degrees in the sweep angle. If the sweep angle
is greater than 360 degrees, the arc is swept multiple times. This
function draws lines by using the current pen. The figure is not
filled.


%index
AnimatePalette
The AnimatePalette function replaces entries in the specified logical palette.
%group
Win32 gdi32
%prm
hPal, iStartIndex, cEntries, ppe
hPal : [intptr] A handle to the logical palette.
iStartIndex : [int] The first logical palette entry to be replaced.
cEntries : [int] The number of entries to be replaced.
ppe : [var] A pointer to the first member in an array of PALETTEENTRY structures used to replace the current entries.
%inst
The AnimatePalette function replaces entries in the specified logical
palette.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero.

[備考]
An application can determine whether a device supports palette
operations by calling the GetDeviceCaps function and specifying the
RASTERCAPS constant. The AnimatePalette function only changes entries
with the PC_RESERVED flag set in the corresponding palPalEntry member
of the LOGPALETTE structure. If the given palette is associated with
the active window, the colors in the palette are replaced
immediately.


%index
Arc
The Arc function draws an elliptical arc.
%group
Win32 gdi32
%prm
hdc, x1, y1, x2, y2, x3, y3, x4, y4
hdc : [intptr] A handle to the device context where drawing takes place.
x1 : [int] The x-coordinate, in logical units, of the upper-left corner of the bounding rectangle.
y1 : [int] The y-coordinate, in logical units, of the upper-left corner of the bounding rectangle.
x2 : [int] The x-coordinate, in logical units, of the lower-right corner of the bounding rectangle.
y2 : [int] The y-coordinate, in logical units, of the lower-right corner of the bounding rectangle.
x3 : [int] The x-coordinate, in logical units, of the ending point of the radial line defining the starting point of the arc.
y3 : [int] The y-coordinate, in logical units, of the ending point of the radial line defining the starting point of the arc.
x4 : [int] The x-coordinate, in logical units, of the ending point of the radial line defining the ending point of the arc.
y4 : [int] The y-coordinate, in logical units, of the ending point of the radial line defining the ending point of the arc.
%inst
The Arc function draws an elliptical arc.

[戻り値]
If the arc is drawn, the return value is nonzero. If the arc is not
drawn, the return value is zero.

[備考]
The points (nLeftRect, nTopRect) and (nRightRect, nBottomRect)
specify the bounding rectangle. An ellipse formed by the specified
bounding rectangle defines the curve of the arc. The arc extends in
the current drawing direction from the point where it intersects the
radial from the center of the bounding rectangle to the (nXStartArc,
nYStartArc) point. The arc ends where it intersects the radial from
the center of the bounding rectangle to the (nXEndArc, nYEndArc)
point. If the starting point and ending point are the same, a
complete ellipse is drawn. The arc is drawn using the current pen; it
is not filled. The current position is neither used nor updated by
Arc. Use the GetArcDirection and SetArcDirection functions to get and
set the current drawing direction for a device context. The default
drawing direction is counterclockwise.


%index
ArcTo
The ArcTo function draws an elliptical arc.
%group
Win32 gdi32
%prm
hdc, left, top, right, bottom, xr1, yr1, xr2, yr2
hdc : [intptr] A handle to the device context where drawing takes place.
left : [int] The x-coordinate, in logical units, of the upper-left corner of the bounding rectangle.
top : [int] The y-coordinate, in logical units, of the upper-left corner of the bounding rectangle.
right : [int] The x-coordinate, in logical units, of the lower-right corner of the bounding rectangle.
bottom : [int] The y-coordinate, in logical units, of the lower-right corner of the bounding rectangle.
xr1 : [int] The x-coordinate, in logical units, of the endpoint of the radial defining the starting point of the arc.
yr1 : [int] The y-coordinate, in logical units, of the endpoint of the radial defining the starting point of the arc.
xr2 : [int] The x-coordinate, in logical units, of the endpoint of the radial defining the ending point of the arc.
yr2 : [int] The y-coordinate, in logical units, of the endpoint of the radial defining the ending point of the arc.
%inst
The ArcTo function draws an elliptical arc.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero.

[備考]
ArcTo is similar to the Arc function, except that the current
position is updated. The points (nLeftRect, nTopRect) and
(nRightRect, nBottomRect) specify the bounding rectangle. An ellipse
formed by the specified bounding rectangle defines the curve of the
arc. The arc extends counterclockwise from the point where it
intersects the radial line from the center of the bounding rectangle
to the (nXRadial1, nYRadial1) point. The arc ends where it intersects
the radial line from the center of the bounding rectangle to the
(nXRadial2, nYRadial2) point. If the starting point and ending point
are the same, a complete ellipse is drawn. A line is drawn from the
current position to the starting point of the arc. If no error
occurs, the current position is set to the ending point of the arc.
The arc is drawn using the current pen; it is not filled.


%index
BRUSHOBJ_hGetColorTransform
The BRUSHOBJ_hGetColorTransform function retrieves the color transform for the specified brush.
%group
Win32 gdi32
%prm
pbo
pbo : [var] Pointer to the BRUSHOBJ structure whose color transform is being queried. The color transform was created in a prior call to DrvIcmCreateColorTransform.
%inst
The BRUSHOBJ_hGetColorTransform function retrieves the color
transform for the specified brush.

[戻り値]
BRUSHOBJ_hGetColorTransform returns a handle to the color transform
for the specified BRUSHOBJ structure upon success. Otherwise, it
returns NULL.

[備考]
BRUSHOBJ_hGetColorTransform returns NULL when ICM is disabled. The
color transform for a translation object is obtained by calling
XLATEOBJ_hGetColorTransform.


%index
BRUSHOBJ_pvAllocRbrush
The BRUSHOBJ_pvAllocRbrush function allocates memory for the driver's realization of a specified brush.
%group
Win32 gdi32
%prm
pbo, cj
pbo : [var] Pointer to the BRUSHOBJ structure for which the realization is to be allocated.
cj : [int] Specifies the size, in bytes, required for the realization.
%inst
The BRUSHOBJ_pvAllocRbrush function allocates memory for the driver's
realization of a specified brush.

[戻り値]
The return value is a pointer to the allocated memory if the function
is successful. Otherwise, it is null, and an error code is logged.

[備考]
BRUSHOBJ_pvAllocRbrush allocates memory for the brush realization.
GDI manages the memory and discards it when the brush is no longer
needed. This function should be called only by an implementation of a
brush realization following a call to DrvRealizeBrush.


%index
BRUSHOBJ_pvGetRbrush
The BRUSHOBJ_pvGetRbrush function retrieves a pointer to the driver's realization of a specified brush.
%group
Win32 gdi32
%prm
pbo
pbo : [var] Pointer to the BRUSHOBJ structure whose realization is requested.
%inst
The BRUSHOBJ_pvGetRbrush function retrieves a pointer to the driver's
realization of a specified brush.

[戻り値]
The return value is a pointer to the realized brush if the function
is successful. If the brush cannot be realized, the return value is
null and an error code is logged.

[備考]
BRUSHOBJ_pvGetRbrush is called when the brush is a pattern brush that
has not yet been realized; that is, it is called when the iSolidColor
member of the BRUSHOBJ structure is 0xFFFFFFFF and the pvRbrush
member is null. If the brush has not been realized when
BRUSHOBJ_pvGetRbrush is called, GDI calls the driver-supplied
DrvRealizeBrush function to obtain the driver's realization of the
brush. As an acceleration, GDI caches this realization in the
pvRbrush member of the BRUSHOBJ structure. Then, when an application
reuses this brush for another drawing operation, the driver doesn't
have to call BRUSHOBJ_pvGetRbrush again.


%index
BRUSHOBJ_ulGetBrushColor
The BRUSHOBJ_ulGetBrushColor function returns the RGB color of the specified solid brush.
%group
Win32 gdi32
%prm
pbo
pbo : [var] Pointer to the BRUSHOBJ structure whose color is being queried.
%inst
The BRUSHOBJ_ulGetBrushColor function returns the RGB color of the
specified solid brush.

[戻り値]
BRUSHOBJ_ulGetBrushColor returns the RGB color of a solid brush. If
the specified brush is not solid, this function returns -1.

[備考]
The color stored in the iSolidColor member of the BRUSHOBJ structure
is an index value that has been translated to the target surface's
palette. BRUSHOBJ_ulGetBrushColor allows the driver to query the
original RGB color value of iSolidColor.


%index
BeginPath
The BeginPath function opens a path bracket in the specified device context.
%group
Win32 gdi32
%prm
hdc
hdc : [intptr] A handle to the device context.
%inst
The BeginPath function opens a path bracket in the specified device
context.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero.

[備考]
After a path bracket is open, an application can begin calling GDI
drawing functions to define the points that lie in the path. An
application can close an open path bracket by calling the EndPath
function. When an application calls BeginPath for a device context,
any previous paths are discarded from that device context. The
following list shows which drawing functions can be used.
This doc was truncated.


%index
BitBlt
指定した元デバイスコンテキストから先デバイスコンテキストへ、矩形分のピクセル色データのビットブロック転送を行う。
%group
Win32 gdi32
%prm
hdc, x, y, cx, cy, hdcSrc, x1, y1, rop
hdc : [intptr] 先デバイスコンテキストへのハンドル。
x : [int] 先矩形の左上隅の x 座標(論理単位)。
y : [int] 先矩形の左上隅の y 座標(論理単位)。
cx : [int] 元と先の矩形の幅(論理単位)。
cy : [int] 元と先の矩形の高さ(論理単位)。
hdcSrc : [intptr] 元デバイスコンテキストへのハンドル。
x1 : [int] 元矩形の左上隅の x 座標(論理単位)。
y1 : [int] 元矩形の左上隅の y 座標(論理単位)。
rop : [int] ラスタ操作コード。元矩形の色データと先矩形の色データをどのように結合して最終的な色を得るかを定義する。
%inst
指定した元デバイスコンテキストから先デバイスコンテキストへ、矩形分のピクセル色データのビットブロック転送を行う。

[戻り値]
関数が成功した場合、戻り値は 0 以外。失敗した場合は 0。拡張エラー情報を得るには GetLastError を呼び出す。

[備考]
BitBlt は先 DC に対してのみクリッピングを行う。元 DC
に回転やせん断変換が有効な場合はエラー。色形式が異なる場合は元を先に合わせて変換する。すべてのデバイスが BitBlt
をサポートするわけではなく、GetDeviceCaps の RC_BITBLT で確認できる。元と先が異なるデバイスの DC
の場合はエラーとなる。その場合は GetDIBits で DIB に変換して SetDIBits または StretchDIBits
を使う。ICM: blit 時にカラーマネジメントは行われない。
（以下省略）


%index
CLIPOBJ_bEnum
The CLIPOBJ_bEnum function enumerates a batch of rectangles from a specified clip region; a prior call to CLIPOBJ_cEnumStart determines the order of enumeration.
%group
Win32 gdi32
%prm
pco, cj, pul
pco : [var] Pointer to a CLIPOBJ structure describing the clip region that is to be enumerated.
cj : [int] Specifies the size, in bytes, of the buffer pointed to by pv.
pul : [var] Pointer to the buffer that will receive data about the clip region in an ENUMRECTS structure.
%inst
The CLIPOBJ_bEnum function enumerates a batch of rectangles from a
specified clip region; a prior call to CLIPOBJ_cEnumStart determines
the order of enumeration.

[戻り値]
The return value is TRUE if the driver must call this function again
for more enumeration data, or FALSE if the enumeration is complete.
It is possible for CLIPOBJ_bEnum to return TRUE with the number of
clipping rectangles equal to zero. In such cases, the driver should
call CLIPOBJ_bEnum again without taking any action.

[備考]
A possible loop structure for calling this function follows:
This doc was truncated.


%index
CLIPOBJ_cEnumStart
The CLIPOBJ_cEnumStart function sets parameters for enumerating rectangles in a specified clip region.
%group
Win32 gdi32
%prm
pco, bAll, iType, iDirection, cLimit
pco : [var] Pointer to the CLIPOBJ structure that defines the clip region to be enumerated.
bAll : [int] Specifies whether the entire region should be enumerated. This parameter is TRUE if the whole region should be enumerated. It is FALSE if only the parts relevant to the present drawing operation should be enumerated. A driver that caches clip regions must enumerate the entire region.
iType : [int] Specifies the data structures that are to be written by CLIPOBJ_bEnum. This parameter currently must be CT_RECTANGLES, indicating that the region is to be enumerated as a list of rectangles.
iDirection : [int] Determines the order in which the rectangles are to be enumerated. This order can be essential if a DrvBitBlt operation is executing concurrently on the same surface. If the order is not relevant to the device driver, CD_ANY should be specified for complex regions, allowing GDI to optimize the enumeration. This value can be one of the following:
cLimit : [int] Specifies the maximum number of rectangles to be enumerated. If this parameter is zero, counting is omitted.
%inst
The CLIPOBJ_cEnumStart function sets parameters for enumerating
rectangles in a specified clip region.

[戻り値]
The return value is the count of enumerated rectangles. If the count
exceeds cLimit, the return value is 0xFFFFFFFF.

[備考]
A region can be enumerated whether this function is called. By
default, the driver only enumerates relevant rectangles, starting at
the upper left. The driver can restart enumeration by calling this
function again.


%index
CLIPOBJ_ppoGetPath
The CLIPOBJ_ppoGetPath function creates a PATHOBJ structure that contains the outline of the specified clip region.
%group
Win32 gdi32
%prm
pco
pco : [var] Pointer to a CLIPOBJ structure that defines the specified clip region.
%inst
The CLIPOBJ_ppoGetPath function creates a PATHOBJ structure that
contains the outline of the specified clip region.

[戻り値]
The return value is a pointer to a PATHOBJ structure if the function
is successful. Otherwise, it is NULL, and an error code is logged.

[備考]
The returned PATHOBJ structure should be deleted using EngDeletePath
when the driver no longer needs it. A driver for a device that can
download a clipping path might prefer this function for defining
complex regions.


%index
CancelDC
The CancelDC function cancels any pending operation on the specified device context (DC).
%group
Win32 gdi32
%prm
hdc
hdc : [intptr] A handle to the DC.
%inst
The CancelDC function cancels any pending operation on the specified
device context (DC).

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero.

[備考]
The CancelDC function is used by multithreaded applications to cancel
lengthy drawing operations. If thread A initiates a lengthy drawing
operation, thread B may cancel that operation by calling this
function. If an operation is canceled, the affected thread returns an
error and the result of its drawing operation is undefined. The
results are also undefined if no drawing operation was in progress
when the function was called.


%index
CheckColorsInGamut
The CheckColorsInGamut function determines whether a specified set of RGB triples lies in the output gamut of a specified device. The RGB triples are interpreted in the input logical color space.
%group
Win32 gdi32
%prm
hdc, lpRGBTriple, dlpBuffer, nCount
hdc : [intptr] Handle to the device context whose output gamut to be checked.
lpRGBTriple : [var] Pointer to an array of RGB triples to check.
dlpBuffer : [intptr] Pointer to the buffer in which the results are to be placed. This buffer must be at least as large as nCount bytes.
nCount : [int] The number of elements in the array of triples.
%inst
The CheckColorsInGamut function determines whether a specified set of
RGB triples lies in the output gamut of a specified device. The RGB
triples are interpreted in the input logical color space.

[戻り値]
If this function succeeds, the return value is a nonzero value. If
this function fails, the return value is zero.

[備考]
The function places the test results in the buffer pointed to by
lpBuffer. Each byte in the buffer corresponds to an RGB triple, and
has an unsigned value between CM_IN_GAMUT (= 0) and CM_OUT_OF_GAMUT
(= 255). The value 0 denotes that the color is in gamut, while a
nonzero value denotes that it is out of gamut. For any integer n such
that 0 < n < 255, a result value of n + 1 indicates that the
corresponding color is at least as far out of gamut as would be
indicated by a result value of n, as specified by the ICC Profile
Format Specification. For more information on the ICC Profile Format
Specification, see the sources listed in [Further
information](/windows/win32/wcs/further-information) . Note that for
this function to succeed, WCS must be enabled for the device context
handle that is passed in through the hDC parameter. WCS can be
enabled for a device context handle by calling the SetICMMode
function.


%index
ChoosePixelFormat
The ChoosePixelFormat function attempts to match an appropriate pixel format supported by a device context to a given pixel format specification.
%group
Win32 gdi32
%prm
hdc, ppfd
hdc : [intptr] Specifies the device context that the function examines to determine the best match for the pixel format descriptor pointed to by ppfd.
ppfd : [var] Pointer to a PIXELFORMATDESCRIPTOR structure that specifies the requested pixel format. In this context, the members of the PIXELFORMATDESCRIPTOR structure that ppfd points to are used as follows:
%inst
The ChoosePixelFormat function attempts to match an appropriate pixel
format supported by a device context to a given pixel format
specification.

[戻り値]
If the function succeeds, the return value is a pixel format index
(one-based) that is the closest match to the given pixel format
descriptor. If the function fails, the return value is zero. To get
extended error information, call GetLastError.

[備考]
You must ensure that the pixel format matched by the
ChoosePixelFormat function satisfies your requirements. For example,
if you request a pixel format with a 24-bit RGB color buffer but the
device context offers only 8-bit RGB color buffers, the function
returns a pixel format with an 8-bit RGB color buffer.


%index
Chord
The Chord function draws a chord (a region bounded by the intersection of an ellipse and a line segment, called a secant). The chord is outlined by using the current pen and filled by using the current brush.
%group
Win32 gdi32
%prm
hdc, x1, y1, x2, y2, x3, y3, x4, y4
hdc : [intptr] A handle to the device context in which the chord appears.
x1 : [int] The x-coordinate, in logical coordinates, of the upper-left corner of the bounding rectangle.
y1 : [int] The y-coordinate, in logical coordinates, of the upper-left corner of the bounding rectangle.
x2 : [int] The x-coordinate, in logical coordinates, of the lower-right corner of the bounding rectangle.
y2 : [int] The y-coordinate, in logical coordinates, of the lower-right corner of the bounding rectangle.
x3 : [int] The x-coordinate, in logical coordinates, of the endpoint of the radial defining the beginning of the chord.
y3 : [int] The y-coordinate, in logical coordinates, of the endpoint of the radial defining the beginning of the chord.
x4 : [int] The x-coordinate, in logical coordinates, of the endpoint of the radial defining the end of the chord.
y4 : [int] The y-coordinate, in logical coordinates, of the endpoint of the radial defining the end of the chord.
%inst
The Chord function draws a chord (a region bounded by the
intersection of an ellipse and a line segment, called a secant). The
chord is outlined by using the current pen and filled by using the
current brush.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero.

[備考]
The curve of the chord is defined by an ellipse that fits the
specified bounding rectangle. The curve begins at the point where the
ellipse intersects the first radial and extends counterclockwise to
the point where the ellipse intersects the second radial. The chord
is closed by drawing a line from the intersection of the first radial
and the curve to the intersection of the second radial and the curve.
If the starting point and ending point of the curve are the same, a
complete ellipse is drawn. The current position is neither used nor
updated by Chord.


%index
DeleteEnhMetaFile
The DeleteEnhMetaFile function deletes an enhanced-format metafile or an enhanced-format metafile handle.
%group
Win32 gdi32
%prm
hmf
hmf : [intptr] A handle to an enhanced metafile.
%inst
The DeleteEnhMetaFile function deletes an enhanced-format metafile or
an enhanced-format metafile handle.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero.

[備考]
If the hemf parameter identifies an enhanced metafile stored in
memory, the DeleteEnhMetaFile function deletes the metafile. If hemf
identifies a metafile stored on a disk, the function deletes the
metafile handle but does not destroy the actual metafile. An
application can retrieve the file by calling the GetEnhMetaFile
function.


%index
CloseEnhMetaFile
The CloseEnhMetaFile function closes an enhanced-metafile device context and returns a handle that identifies an enhanced-format metafile.
%group
Win32 gdi32
%prm
hdc
hdc : [intptr] Handle to an enhanced-metafile device context.
%inst
The CloseEnhMetaFile function closes an enhanced-metafile device
context and returns a handle that identifies an enhanced-format
metafile.

[戻り値]
If the function succeeds, the return value is a handle to an enhanced
metafile. If the function fails, the return value is NULL.

[備考]
An application can use the enhanced-metafile handle returned by the
CloseEnhMetaFile function to perform the following tasks:
This doc was truncated.


%index
CloseFigure
The CloseFigure function closes an open figure in a path.
%group
Win32 gdi32
%prm
hdc
hdc : [intptr] Handle to the device context in which the figure will be closed.
%inst
The CloseFigure function closes an open figure in a path.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero.

[備考]
The CloseFigure function closes the figure by drawing a line from the
current position to the first point of the figure (usually, the point
specified by the most recent call to the MoveToEx function) and then
connects the lines by using the line join style. If a figure is
closed by using the LineTo function instead of CloseFigure, end caps
are used to create the corner instead of a join. The CloseFigure
function should only be called if there is an open path bracket in
the specified device context. A figure in a path is open unless it is
explicitly closed by using this function. (A figure can be open even
if the current point and the starting point of the figure are the
same.) After a call to CloseFigure, adding a line or curve to the
path starts a new figure.


%index
DeleteMetaFile
The DeleteMetaFile function deletes a Windows-format metafile or Windows-format metafile handle.
%group
Win32 gdi32
%prm
hmf
hmf : [intptr] A handle to a Windows-format metafile.
%inst
The DeleteMetaFile function deletes a Windows-format metafile or
Windows-format metafile handle.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero.

[備考]
If the metafile identified by the hmf parameter is stored in memory
(rather than on a disk), its content is lost when it is deleted by
using the DeleteMetaFile function.


%index
CloseMetaFile
The CloseMetaFile function closes a metafile device context and returns a handle that identifies a Windows-format metafile.
%group
Win32 gdi32
%prm
hdc
hdc : [intptr] Handle to a metafile device context used to create a Windows-format metafile.
%inst
The CloseMetaFile function closes a metafile device context and
returns a handle that identifies a Windows-format metafile.

[戻り値]
If the function succeeds, the return value is a handle to a
Windows-format metafile. If the function fails, the return value is
NULL.

[備考]
To convert a Windows-format metafile into a new enhanced-format
metafile, use the SetWinMetaFileBits function. When an application no
longer needs the Windows-format metafile handle, it should delete the
handle by calling the DeleteMetaFile function.


%index
ColorCorrectPalette
The ColorCorrectPalette function corrects the entries of a palette using the WCS 1.0 parameters in the specified device context.
%group
Win32 gdi32
%prm
hdc, hPal, deFirst, num
hdc : [intptr] Specifies a device context whose WCS parameters to use.
hPal : [intptr] Specifies the handle to the palette to be color corrected.
deFirst : [int] Specifies the first entry in the palette to be color corrected.
num : [int] Specifies the number of entries to color correct.
%inst
The ColorCorrectPalette function corrects the entries of a palette
using the WCS 1.0 parameters in the specified device context.

[戻り値]
If this function succeeds, the return value is TRUE. If this function
fails, the return value is FALSE.


%index
ColorMatchToTarget
The ColorMatchToTarget function enables you to preview colors as they would appear on the target device.
%group
Win32 gdi32
%prm
hdc, hdcTarget, action
hdc : [intptr] Specifies the device context for previewing, generally the screen.
hdcTarget : [intptr] Specifies the target device context, generally a printer.
action : [int] 
%inst
The ColorMatchToTarget function enables you to preview colors as they
would appear on the target device.

[戻り値]
If this function succeeds, the return value is TRUE. If this function
fails, the return value is FALSE.

[備考]
ColorMatchToTarget can be used to proof the colors of a color output
device on another color output device. Setting the uiAction parameter
to CS_ENABLE causes all subsequent drawing commands to the DC to
render colors as they would appear on the target device. If uiAction
is set to CS_DISABLE, proofing is turned off. However, the current
color transform is not deleted from the DC. It is just inactive. When
ColorMatchToTarget is called, the color transform for the target
device is performed first, and then the transform to the preview
device is applied to the results of the first transform. This is used
primarily for checking gamut mapping conditions. Before using this
function, you must enable WCS for both device contexts. This function
cannot be cascaded. While color mapping to the target is enabled by
setting uiAction to CS_ENABLE, application changes to the color space
or gamut mapping method are ignored. Those changes then take effect
when color mapping to the target is disabled. Note A memory leak will
not occur if an application does not delete a transform using
CS_DELETE_TRANSFORM. The transform will be deleted when either the
device context (DC) is closed, or when the application color space is
deleted. However if the transform is not going to be used again, or
if the application will not be performing any more color matching on
the DC, it should explicitly delete the transform to free the memory
it occupies. The uiAction parameter should only be set to
CS_DELETE_TRANSFORM if color management is enabled before the
ColorMatchToTarget function is called.


%index
CombineRgn
The CombineRgn function combines two regions and stores the result in a third region. The two regions are combined according to the specified mode.
%group
Win32 gdi32
%prm
hrgnDst, hrgnSrc1, hrgnSrc2, iMode
hrgnDst : [intptr] A handle to a new region with dimensions defined by combining two other regions. (This region must exist before CombineRgn is called.)
hrgnSrc1 : [intptr] A handle to the first of two regions to be combined.
hrgnSrc2 : [intptr] A handle to the second of two regions to be combined.
iMode : [int] 
%inst
The CombineRgn function combines two regions and stores the result in
a third region. The two regions are combined according to the
specified mode.

[戻り値]
The return value specifies the type of the resulting region. It can
be one of the following values.
This doc was truncated.

[備考]
The three regions need not be distinct. For example, the hrgnSrc1
parameter can equal the hrgnDest parameter.


%index
CombineTransform
The CombineTransform function concatenates two world-space to page-space transformations.
%group
Win32 gdi32
%prm
lpxfOut, lpxf1, lpxf2
lpxfOut : [var] A pointer to an XFORM structure that receives the combined transformation.
lpxf1 : [var] A pointer to an XFORM structure that specifies the first transformation.
lpxf2 : [var] A pointer to an XFORM structure that specifies the second transformation.
%inst
The CombineTransform function concatenates two world-space to
page-space transformations.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero.

[備考]
Applying the combined transformation has the same effect as applying
the first transformation and then applying the second transformation.
The three transformations need not be distinct. For example, lpxform1
can point to the same XFORM structure as lpxformResult.


%index
CopyEnhMetaFileW
The CopyEnhMetaFile function copies the contents of an enhanced-format metafile to a specified file. (Unicode)
%group
Win32 gdi32
%prm
hEnh, lpFileName
hEnh : [intptr] A handle to the enhanced metafile to be copied.
lpFileName : [wstr] A pointer to the name of the destination file. If this parameter is NULL, the source metafile is copied to memory.
%inst
The CopyEnhMetaFile function copies the contents of an
enhanced-format metafile to a specified file. (Unicode)

[戻り値]
If the function succeeds, the return value is a handle to the copy of
the enhanced metafile. If the function fails, the return value is
NULL.

[備考]
Where text arguments must use Unicode characters, use the
CopyEnhMetaFile function as a wide-character function. Where text
arguments must use characters from the Windows character set, use
this function as an ANSI function. Applications can use metafiles
stored in memory for temporary operations. When the application no
longer needs the enhanced-metafile handle, it should delete the
handle by calling the DeleteEnhMetaFile function.
> [!NOTE] > The wingdi.h header defines CopyEnhMetaFile as an alias
which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
CopyMetaFileW
The CopyMetaFile function copies the content of a Windows-format metafile to the specified file. (Unicode)
%group
Win32 gdi32
%prm
param0, param1
param0 : [intptr] 
param1 : [wstr] 
%inst
The CopyMetaFile function copies the content of a Windows-format
metafile to the specified file. (Unicode)

[戻り値]
If the function succeeds, the return value is a handle to the copy of
the Windows-format metafile. If the function fails, the return value
is NULL.

[備考]
Where text arguments must use Unicode characters, use this function
as a wide-character function. Where text arguments must use
characters from the Windows character set, use this function as an
ANSI function. When the application no longer needs the
Windows-format metafile handle, it should delete the handle by
calling the DeleteMetaFile function.
> [!NOTE] > The wingdi.h header defines CopyMetaFile as an alias
which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
CreateBitmap
指定した幅、高さ、色形式(カラープレーン数およびピクセルあたりのビット数)を持つビットマップを作成する。
%group
Win32 gdi32
%prm
nWidth, nHeight, nPlanes, nBitCount, lpBits
nWidth : [int] ビットマップの幅(ピクセル単位)。
nHeight : [int] ビットマップの高さ(ピクセル単位)。
nPlanes : [int] デバイスが使用するカラープレーン数。
nBitCount : [int] 1 ピクセルの色を表現するのに必要なビット数。
lpBits : [intptr] ピクセル矩形の色を設定するための色データ配列へのポインタ。矩形内の各スキャンラインは word 境界で整列している必要がある(整列していない場合は 0 でパディング)。
%inst
指定した幅、高さ、色形式(カラープレーン数およびピクセルあたりのビット数)を持つビットマップを作成する。

[戻り値]
関数が成功した場合、戻り値はビットマップへのハンドル。失敗した場合は NULL。
（以下省略）

[備考]
CreateBitmap はデバイス依存ビットマップ(DDB)を作成する。作成後は SelectObject で DC
に選択できるが、ビットマップと DC の形式が一致する必要がある。色ビットマップには CreateCompatibleBitmap
のほうがパフォーマンス上推奨される。モノクロビットマップでは 0 が前景色、1 が背景色。nWidth または nHeight に 0
を指定すると 1x1 モノクロビットマップが返る。不要になったら DeleteObject で削除する。


%index
CreateBitmapIndirect
The CreateBitmapIndirect function creates a bitmap with the specified width, height, and color format (color planes and bits-per-pixel).
%group
Win32 gdi32
%prm
pbm
pbm : [var] A pointer to a BITMAP structure that contains information about the bitmap. If an application sets the bmWidth or bmHeight members to zero, CreateBitmapIndirect returns the handle to a 1-by-1 pixel, monochrome bitmap.
%inst
The CreateBitmapIndirect function creates a bitmap with the specified
width, height, and color format (color planes and bits-per-pixel).

[戻り値]
If the function succeeds, the return value is a handle to the bitmap.
If the function fails, the return value is NULL. This function can
return the following values.
This doc was truncated.

[備考]
The CreateBitmapIndirect function creates a device-dependent bitmap.
After a bitmap is created, it can be selected into a device context
by calling the SelectObject function. However, the bitmap can only be
selected into a device context if the bitmap and the DC have the same
format. While the CreateBitmapIndirect function can be used to create
color bitmaps, for performance reasons applications should use
CreateBitmapIndirect to create monochrome bitmaps and
CreateCompatibleBitmap to create color bitmaps. Whenever a color
bitmap from CreateBitmapIndirect is selected into a device context,
the system must ensure that the bitmap matches the format of the
device context it is being selected into. Because
CreateCompatibleBitmap takes a device context, it returns a bitmap
that has the same format as the specified device context. Thus,
subsequent calls to SelectObject are faster with a color bitmap from
CreateCompatibleBitmap than with a color bitmap returned from
CreateBitmapIndirect. If the bitmap is monochrome, zeros represent
the foreground color and ones represent the background color for the
destination device context. When you no longer need the bitmap, call
the DeleteObject function to delete it.


%index
CreateBrushIndirect
The CreateBrushIndirect function creates a logical brush that has the specified style, color, and pattern.
%group
Win32 gdi32
%prm
plbrush
plbrush : [var] A pointer to a LOGBRUSH structure that contains information about the brush.
%inst
The CreateBrushIndirect function creates a logical brush that has the
specified style, color, and pattern.

[戻り値]
If the function succeeds, the return value identifies a logical
brush. If the function fails, the return value is NULL.

[備考]
A brush is a bitmap that the system uses to paint the interiors of
filled shapes. After an application creates a brush by calling
CreateBrushIndirect, it can select it into any device context by
calling the SelectObject function. A brush created by using a
monochrome bitmap (one color plane, one bit per pixel) is drawn using
the current text and background colors. Pixels represented by a bit
set to 0 are drawn with the current text color; pixels represented by
a bit set to 1 are drawn with the current background color. When you
no longer need the brush, call the DeleteObject function to delete
it. ICM: No color is done at brush creation. However, color
management is performed when the brush is selected into an
ICM-enabled device context.


%index
DeleteColorSpace
The DeleteColorSpace function removes and destroys a specified color space.
%group
Win32 gdi32
%prm
hcs
hcs : [intptr] Specifies the handle to a color space to delete.
%inst
The DeleteColorSpace function removes and destroys a specified color
space.

[戻り値]
If this function succeeds, the return value is TRUE. If this function
fails, the return value is FALSE.


%index
CreateColorSpaceW
The CreateColorSpace function creates a logical color space. (Unicode)
%group
Win32 gdi32
%prm
lplcs
lplcs : [var] Pointer to the LOGCOLORSPACE data structure.
%inst
The CreateColorSpace function creates a logical color space.
(Unicode)

[戻り値]
If this function succeeds, the return value is a handle that
identifies a color space. If this function fails, the return value is
NULL.

[備考]
When the color space is no longer needed, use DeleteColorSpace to
delete it. Windows 95/98/Me: CreateColorSpaceW is supported by the
Microsoft Layer for Unicode. To use this, you must add certain files
to your application, as outlined in Microsoft Layer for Unicode on
Windows 95/98/Me Systems.
> [!NOTE] > The wingdi.h header defines CreateColorSpace as an alias
which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
CreateCompatibleBitmap
指定したデバイスコンテキストに関連付けられたデバイスと互換のあるビットマップを作成する。
%group
Win32 gdi32
%prm
hdc, cx, cy
hdc : [intptr] デバイスコンテキストへのハンドル。
cx : [int] ビットマップの幅(ピクセル単位)。
cy : [int] ビットマップの高さ(ピクセル単位)。
%inst
指定したデバイスコンテキストに関連付けられたデバイスと互換のあるビットマップを作成する。

[戻り値]
関数が成功した場合、戻り値は互換ビットマップ(DDB)へのハンドル。失敗した場合は NULL。

[備考]
作成されるビットマップの色形式は hdc
パラメータが識別するデバイスの色形式と一致する。このビットマップは元のデバイスと互換のある任意のメモリ DC に選択できる。メモリ DC
が作成された直後は 1x1 モノクロビットマップが選択されているため、その DC を CreateCompatibleBitmap
に渡すとモノクロビットマップが作成される。色ビットマップを作成するには、メモリ DC 作成に使用した元の HDC を渡す。


%index
CreateCompatibleDC
指定したデバイスと互換のあるメモリデバイスコンテキスト(DC)を作成する。
%group
Win32 gdi32
%prm
hdc
hdc : [intptr] 既存の DC へのハンドル。NULL の場合、アプリケーションの現在のスクリーンと互換のメモリ DC を作成する。
%inst
指定したデバイスと互換のあるメモリデバイスコンテキスト(DC)を作成する。

[戻り値]
関数が成功した場合、戻り値はメモリ DC へのハンドル。失敗した場合は NULL。

[備考]
メモリ DC はメモリ上にのみ存在する。作成時点の表示面は 1x1 のモノクロピクセル。描画前に、適切な幅と高さのビットマップを
CreateCompatibleBitmap
で作成して選択する必要がある。作成後の属性は既定値に設定される。CreateCompatibleDC
はラスタ操作をサポートするデバイスでのみ使用可能。不要になったら DeleteDC を呼ぶ(DeleteObject に HDC
を渡すことも可能)。hdc が NULL の場合、呼び出し元スレッドが HDC を所有し、そのスレッドが終了すると無効になる。


%index
CreateDCA
The CreateDC function creates a device context (DC) for a device using the specified name. (ANSI)
%group
Win32 gdi32
%prm
pwszDriver, pwszDevice, pszPort, pdm
pwszDriver : [str] A pointer to a null-terminated character string that specifies either DISPLAY or the name of a specific display device. For printing, we recommend that you pass NULL to lpszDriver because GDI ignores lpszDriver for printer devices.
pwszDevice : [str] A pointer to a null-terminated character string that specifies the name of the specific output device being used, as shown by the Print Manager (for example, Epson FX-80). It is not the printer model name. The lpszDevice parameter must be used. To obtain valid names for displays, call EnumDisplayDevices. If lpszDriver is DISPLAY or the device name of a specific display device, then lpszDevice must be NULL or that same device name. If lpszDevice is NULL, then a DC is created for the primary display device. If there are multiple monitors on the system, calling CreateDC(TEXT("DISPLAY"),NULL,NULL,NULL) will create a DC covering all the monitors.
pszPort : [str] This parameter is ignored and should be set to NULL. It is provided only for compatibility with 16-bit Windows.
pdm : [var] A pointer to a DEVMODE structure containing device-specific initialization data for the device driver. The DocumentProperties function retrieves this structure filled in for a specified device. The pdm parameter must be NULL if the device driver is to use the default initialization (if any) specified by the user. If lpszDriver is DISPLAY, pdm must be NULL; GDI then uses the display device's current DEVMODE.
%inst
The CreateDC function creates a device context (DC) for a device
using the specified name. (ANSI)

[戻り値]
If the function succeeds, the return value is the handle to a DC for
the specified device. If the function fails, the return value is
NULL.

[備考]
Note that the handle to the DC can only be used by a single thread at
any one time. For parameters lpszDriver and lpszDevice, call
EnumDisplayDevices to obtain valid names for displays. When you no
longer need the DC, call the DeleteDC function. If lpszDriver or
lpszDevice is DISPLAY, the thread that calls CreateDC owns the HDC
that is created. When this thread is destroyed, the HDC is no longer
valid. Thus, if you create the HDC and pass it to another thread,
then exit the first thread, the second thread will not be able to use
the HDC. When you call CreateDC to create the HDC for a display
device, you must pass to pdm either NULL or a pointer to DEVMODE that
matches the current DEVMODE of the display device that lpszDevice
specifies. We recommend to pass NULL and not to try to exactly match
the DEVMODE for the current display device. When you call CreateDC to
create the HDC for a printer device, the printer driver validates the
DEVMODE. If the printer driver determines that the DEVMODE is invalid
(that is, printer driver can’t convert or consume the DEVMODE), the
printer driver provides a default DEVMODE to create the HDC for the
printer device. ICM: To enable ICM, set the dmICMMethod member of the
DEVMODE structure (pointed to by the pInitData parameter) to the
appropriate value.


%index
CreateDCW
The CreateDC function creates a device context (DC) for a device using the specified name. (Unicode)
%group
Win32 gdi32
%prm
pwszDriver, pwszDevice, pszPort, pdm
pwszDriver : [wstr] A pointer to a null-terminated character string that specifies either DISPLAY or the name of a specific display device. For printing, we recommend that you pass NULL to lpszDriver because GDI ignores lpszDriver for printer devices.
pwszDevice : [wstr] A pointer to a null-terminated character string that specifies the name of the specific output device being used, as shown by the Print Manager (for example, Epson FX-80). It is not the printer model name. The lpszDevice parameter must be used. To obtain valid names for displays, call EnumDisplayDevices. If lpszDriver is DISPLAY or the device name of a specific display device, then lpszDevice must be NULL or that same device name. If lpszDevice is NULL, then a DC is created for the primary display device. If there are multiple monitors on the system, calling CreateDC(TEXT("DISPLAY"),NULL,NULL,NULL) will create a DC covering all the monitors.
pszPort : [wstr] This parameter is ignored and should be set to NULL. It is provided only for compatibility with 16-bit Windows.
pdm : [var] A pointer to a DEVMODE structure containing device-specific initialization data for the device driver. The DocumentProperties function retrieves this structure filled in for a specified device. The pdm parameter must be NULL if the device driver is to use the default initialization (if any) specified by the user. If lpszDriver is DISPLAY, pdm must be NULL; GDI then uses the display device's current DEVMODE.
%inst
The CreateDC function creates a device context (DC) for a device
using the specified name. (Unicode)

[戻り値]
If the function succeeds, the return value is the handle to a DC for
the specified device. If the function fails, the return value is
NULL.

[備考]
Note that the handle to the DC can only be used by a single thread at
any one time. For parameters lpszDriver and lpszDevice, call
EnumDisplayDevices to obtain valid names for displays. When you no
longer need the DC, call the DeleteDC function. If lpszDriver or
lpszDevice is DISPLAY, the thread that calls CreateDC owns the HDC
that is created. When this thread is destroyed, the HDC is no longer
valid. Thus, if you create the HDC and pass it to another thread,
then exit the first thread, the second thread will not be able to use
the HDC. When you call CreateDC to create the HDC for a display
device, you must pass to pdm either NULL or a pointer to DEVMODE that
matches the current DEVMODE of the display device that lpszDevice
specifies. We recommend to pass NULL and not to try to exactly match
the DEVMODE for the current display device. When you call CreateDC to
create the HDC for a printer device, the printer driver validates the
DEVMODE. If the printer driver determines that the DEVMODE is invalid
(that is, printer driver can’t convert or consume the DEVMODE), the
printer driver provides a default DEVMODE to create the HDC for the
printer device. ICM: To enable ICM, set the dmICMMethod member of the
DEVMODE structure (pointed to by the pInitData parameter) to the
appropriate value.


%index
CreateDIBPatternBrush
The CreateDIBPatternBrush function creates a logical brush that has the pattern specified by the specified device-independent bitmap (DIB).
%group
Win32 gdi32
%prm
h, iUsage
h : [int] A handle to a global memory object containing a packed DIB, which consists of a BITMAPINFO structure immediately followed by an array of bytes defining the pixels of the bitmap.
iUsage : [int] 
%inst
The CreateDIBPatternBrush function creates a logical brush that has
the pattern specified by the specified device-independent bitmap
(DIB).

[戻り値]
If the function succeeds, the return value identifies a logical
brush. If the function fails, the return value is NULL.

[備考]
When an application selects a two-color DIB pattern brush into a
monochrome device context, the system does not acknowledge the colors
specified in the DIB; instead, it displays the pattern brush using
the current background and foreground colors of the device context.
Pixels mapped to the first color of the DIB (offset 0 in the DIB
color table) are displayed using the foreground color; pixels mapped
to the second color (offset 1 in the color table) are displayed using
the background color. When you no longer need the brush, call the
DeleteObject function to delete it. ICM: No color is done at brush
creation. However, color management is performed when the brush is
selected into an ICM-enabled device context.


%index
CreateDIBPatternBrushPt
The CreateDIBPatternBrushPt function creates a logical brush that has the pattern specified by the device-independent bitmap (DIB).
%group
Win32 gdi32
%prm
lpPackedDIB, iUsage
lpPackedDIB : [intptr] A pointer to a packed DIB consisting of a BITMAPINFO structure immediately followed by an array of bytes defining the pixels of the bitmap.
iUsage : [int] 
%inst
The CreateDIBPatternBrushPt function creates a logical brush that has
the pattern specified by the device-independent bitmap (DIB).

[戻り値]
If the function succeeds, the return value identifies a logical
brush. If the function fails, the return value is NULL.

[備考]
A brush is a bitmap that the system uses to paint the interiors of
filled shapes. After an application creates a brush by calling
CreateDIBPatternBrushPt, it can select that brush into any device
context by calling the SelectObject function. When you no longer need
the brush, call the DeleteObject function to delete it. ICM: No color
is done at brush creation. However, color management is performed
when the brush is selected into an ICM-enabled device context.


%index
CreateDIBSection
アプリケーションが直接書き込める DIB を作成する。
%group
Win32 gdi32
%prm
hdc, pbmi, usage, ppvBits, hSection, offset
hdc : [intptr] デバイスコンテキストへのハンドル。iUsage が DIB_PAL_COLORS の場合、この DC の論理パレットを使用して DIB の色を初期化する。
pbmi : [var] DIB の寸法や色などの属性を指定する BITMAPINFO 構造体へのポインタ。
usage : [int] pbmi が指す BITMAPINFO 構造体の bmiColors 配列メンバに格納されるデータの種類(論理パレットインデックスまたは RGB 値)。
ppvBits : [var] DIB ビット値の位置を指すポインタを受け取る変数へのポインタ。
hSection : [intptr] DIB の作成に使用するファイルマッピングオブジェクトへのハンドル。NULL を指定できる。NULL 以外の場合、CreateFileMapping を PAGE_READWRITE または PAGE_WRITECOPY フラグで作成したハンドルでなければならない。
offset : [int] hSection が参照するファイルマッピングオブジェクトの先頭からの、ビットマップビット値記憶位置のオフセット。hSection が NULL の場合は無視される。DWORD の倍数でなければならない。
%inst
アプリケーションが直接書き込める DIB を作成する。

[戻り値]
関数が成功した場合、戻り値は新しく作成された DIB へのハンドルで、*ppvBits はビットマップビット値を指す。失敗した場合は
NULL で *ppvBits も NULL。
（以下省略）

[備考]
hSection が NULL の場合、システムが DIB 用メモリを割り当てる。DeleteObject で DIB
を削除するとメモリも解放される。hSection が NULL でない場合、DeleteObject 後に自分で hSection
を閉じる必要がある。CreateDIBSection は BITMAPINFOHEADER の
biXPelsPerMeter/biYPelsPerMeter を使用せず、解像度情報を BITMAPINFO に提供しない。GDI
サブシステムが作成されたビットマップへの描画を完了するまで、自分で書き込む前に GdiFlush で同期する必要がある。ICM:
カラーマネジメントは行われない。


%index
CreateDIBitmap
The CreateDIBitmap function creates a compatible bitmap (DDB) from a DIB and, optionally, sets the bitmap bits.
%group
Win32 gdi32
%prm
hdc, pbmih, flInit, pjBits, pbmi, iUsage
hdc : [intptr] A handle to a device context.
pbmih : [var] A pointer to a bitmap information header structure, BITMAPV5HEADER. If fdwInit is CBM_INIT, the function uses the bitmap information header structure to obtain the desired width and height of the bitmap as well as other information. Note that a positive value for the height indicates a bottom-up DIB while a negative value for the height indicates a top-down DIB. Calling CreateDIBitmap with fdwInit as CBM_INIT is equivalent to calling the CreateCompatibleBitmap function to create a DDB in the format of the device and then calling the SetDIBits function to translate the DIB bits to the DDB.
flInit : [int] Specifies how the system initializes the bitmap bits. The following value is defined.
pjBits : [intptr] A pointer to an array of bytes containing the initial bitmap data. The format of the data depends on the biBitCount member of the BITMAPINFO structure to which the lpbmi parameter points.
pbmi : [var] A pointer to a BITMAPINFO structure that describes the dimensions and color format of the array pointed to by the lpbInit parameter.
iUsage : [int] 
%inst
The CreateDIBitmap function creates a compatible bitmap (DDB) from a
DIB and, optionally, sets the bitmap bits.

[戻り値]
If the function succeeds, the return value is a handle to the
compatible bitmap. If the function fails, the return value is NULL.

[備考]
The DDB that is created will be whatever bit depth your reference DC
is. To create a bitmap that is of different bit depth, use
CreateDIBSection. For a device to reach optimal bitmap-drawing speed,
specify fdwInit as CBM_INIT. Then, use the same color depth DIB as
the video mode. When the video is running 4- or 8-bpp, use
DIB_PAL_COLORS. The CBM_CREATDIB flag for the fdwInit parameter is no
longer supported. When you no longer need the bitmap, call the
DeleteObject function to delete it. ICM: No color management is
performed. The contents of the resulting bitmap are not color matched
after the bitmap has been created.


%index
CreateDiscardableBitmap
The CreateDiscardableBitmap function creates a discardable bitmap that is compatible with the specified device.
%group
Win32 gdi32
%prm
hdc, cx, cy
hdc : [intptr] A handle to a device context.
cx : [int] The width, in pixels, of the bitmap.
cy : [int] The height, in pixels, of the bitmap.
%inst
The CreateDiscardableBitmap function creates a discardable bitmap
that is compatible with the specified device.

[戻り値]
If the function succeeds, the return value is a handle to the
compatible bitmap (DDB). If the function fails, the return value is
NULL.

[備考]
When you no longer need the bitmap, call the DeleteObject function to
delete it.


%index
CreateEllipticRgn
The CreateEllipticRgn function creates an elliptical region.
%group
Win32 gdi32
%prm
x1, y1, x2, y2
x1 : [int] Specifies the x-coordinate in logical units, of the upper-left corner of the bounding rectangle of the ellipse.
y1 : [int] Specifies the y-coordinate in logical units, of the upper-left corner of the bounding rectangle of the ellipse.
x2 : [int] Specifies the x-coordinate in logical units, of the lower-right corner of the bounding rectangle of the ellipse.
y2 : [int] Specifies the y-coordinate in logical units, of the lower-right corner of the bounding rectangle of the ellipse.
%inst
The CreateEllipticRgn function creates an elliptical region.

[戻り値]
If the function succeeds, the return value is the handle to the
region. If the function fails, the return value is NULL.

[備考]
When you no longer need the HRGN object, call the DeleteObject
function to delete it. A bounding rectangle defines the size, shape,
and orientation of the region: The long sides of the rectangle define
the length of the ellipse's major axis; the short sides define the
length of the ellipse's minor axis; and the center of the rectangle
defines the intersection of the major and minor axes.


%index
CreateEllipticRgnIndirect
The CreateEllipticRgnIndirect function creates an elliptical region.
%group
Win32 gdi32
%prm
lprect
lprect : [var] Pointer to a RECT structure that contains the coordinates of the upper-left and lower-right corners of the bounding rectangle of the ellipse in logical units.
%inst
The CreateEllipticRgnIndirect function creates an elliptical region.

[戻り値]
If the function succeeds, the return value is the handle to the
region. If the function fails, the return value is NULL.

[備考]
When you no longer need the HRGN object, call the DeleteObject
function to delete it. A bounding rectangle defines the size, shape,
and orientation of the region: The long sides of the rectangle define
the length of the ellipse's major axis; the short sides define the
length of the ellipse's minor axis; and the center of the rectangle
defines the intersection of the major and minor axes.


%index
CreateEnhMetaFileW
The CreateEnhMetaFile function creates a device context for an enhanced-format metafile. This device context can be used to store a device-independent picture. (Unicode)
%group
Win32 gdi32
%prm
hdc, lpFilename, lprc, lpDesc
hdc : [intptr] A handle to a reference device for the enhanced metafile. This parameter can be NULL; for more information, see Remarks.
lpFilename : [wstr] A pointer to the file name for the enhanced metafile to be created. If this parameter is NULL, the enhanced metafile is memory based and its contents are lost when it is deleted by using the DeleteEnhMetaFile function.
lprc : [var] A pointer to a RECT structure that specifies the dimensions (in .01-millimeter units) of the picture to be stored in the enhanced metafile.
lpDesc : [wstr] A pointer to a string that specifies the name of the application that created the picture, as well as the picture's title. This parameter can be NULL; for more information, see Remarks.
%inst
The CreateEnhMetaFile function creates a device context for an
enhanced-format metafile. This device context can be used to store a
device-independent picture. (Unicode)

[戻り値]
If the function succeeds, the return value is a handle to the device
context for the enhanced metafile. If the function fails, the return
value is NULL.

[備考]
Where text arguments must use Unicode characters, use the
CreateEnhMetaFile function as a wide-character function. Where text
arguments must use characters from the Windows character set, use
this function as an ANSI function. The system uses the reference
device identified by the hdcRef parameter to record the resolution
and units of the device on which a picture originally appeared. If
the hdcRef parameter is NULL, it uses the current display device for
reference. The left and top members of the RECT structure pointed to
by the lpRect parameter must be less than the right and bottom
members, respectively. Points along the edges of the rectangle are
included in the picture. If lpRect is NULL, the graphics device
interface (GDI) computes the dimensions of the smallest rectangle
that surrounds the picture drawn by the application. The lpRect
parameter should be provided where possible. The string pointed to by
the lpDescription parameter must contain a null character between the
application name and the picture name and must terminate with two
null characters, for example, "XYZ Graphics Editor\0Bald Eagle\0\0",
where \0 represents the null character. If lpDescription is NULL,
there is no corresponding entry in the enhanced-metafile header.
Applications use the device context created by this function to store
a graphics picture in an enhanced metafile. The handle identifying
this device context can be passed to any GDI function. After an
application stores a picture in an enhanced metafile, it can display
the picture on any output device by calling the PlayEnhMetaFile
function. When displaying the picture, the system uses the rectangle
pointed to by the lpRect parameter and the resolution data from the
reference device to position and scale the picture. The device
context returned by this function contains the same default
attributes associated with any new device context. Applications must
use the GetWinMetaFileBits function to convert an enhanced metafile
to the older Windows metafile format. The file name for the enhanced
metafile should use the .emf extension.


%index
CreateFontW
指定された特性を持つ論理フォントを作成する。論理フォントは任意のデバイスのフォントとして選択できる。(Unicode)
%group
Win32 gdi32
%prm
cHeight, cWidth, cEscapement, cOrientation, cWeight, bItalic, bUnderline, bStrikeOut, iCharSet, iOutPrecision, iClipPrecision, iQuality, iPitchAndFamily, pszFaceName
cHeight : [int] フォントの文字セルまたは文字の高さ(論理単位)。文字高さ(em 高さ)は文字セル高さから internal-leading 値を引いた値。
cWidth : [int] 要求フォントの文字の平均幅(論理単位)。0 の場合、フォントマッパーは最も近い値を選択する。
cEscapement : [int] escapement ベクトルとデバイスの x 軸との角度(10 分の 1 度単位)。escapement ベクトルはテキスト行の基準線と平行。グラフィックスモードが GM_ADVANCED の場合は文字の方向角と独立に指定可能。GM_COMPATIBLE の場合は escapement と orientation の両方を指定し、nEscapement と nOrientation を同じ値にする必要がある。
cOrientation : [int] 各文字の基準線とデバイスの x 軸との角度(10 分の 1 度単位)。
cWeight : [int] フォントの太さ(0~1000)。例えば 400 が normal、700 が bold。0 の場合は既定値が使用される。
bItalic : [int] TRUE の場合、イタリックフォントを指定する。
bUnderline : [int] TRUE の場合、下線付きフォントを指定する。
bStrikeOut : [int] TRUE の場合、取り消し線付きフォントを指定する。
iCharSet : [int] 文字セット。以下の値が定義済み:
iOutPrecision : [int] 
iClipPrecision : [int] 
iQuality : [int] 
iPitchAndFamily : [int] 
pszFaceName : [wstr] フォントの書体名を指定する NULL 終端文字列へのポインタ。文字列長は終端 NULL を含めて 32 文字以下。NULL または空文字列の場合、GDI は指定された他の属性と一致する最初のフォントを使用する。
%inst
指定された特性を持つ論理フォントを作成する。論理フォントは任意のデバイスのフォントとして選択できる。(Unicode)

[戻り値]
関数が成功した場合、戻り値は論理フォントへのハンドル。失敗した場合は NULL。

[備考]
不要になったら DeleteObject
で削除すること。ベンダーの著作権保護のため、選択されたフォント名を正確に報告すべきである。利用可能なフォントはシステムにより異なるため、要求したフォントが必ず選択されるとは限らない。フォントマッパーは
CreateFont/CreateFontIndirect/CreateFontIndirectEx
で英語および地域化された書体名の両方を認識する。
（以下省略）


%index
CreateFontIndirectW
指定された特性を持つ論理フォントを作成する。(Unicode)
%group
Win32 gdi32
%prm
lplf
lplf : [var] 論理フォントの特性を定義する LOGFONT 構造体へのポインタ。
%inst
指定された特性を持つ論理フォントを作成する。(Unicode)

[戻り値]
関数が成功した場合、戻り値は論理フォントへのハンドル。失敗した場合は NULL。

[備考]
LOGFONT 構造体に指定された特性を持つ論理フォントを作成する。SelectObject で選択すると、GDI
のフォントマッパーは論理フォントと既存の物理フォントの一致を試みる。完全一致が見つからない場合、可能な限り要求に近い特性を持つ代替フォントを提供する。地域によっては
EnumFontFamiliesEx で適切な書体名を取得してから CreateFont/CreateFontIndirect
を使うのがよい。不要になったら DeleteObject で削除する。


%index
CreateFontIndirectExW
The CreateFontIndirectEx function specifies a logical font that has the characteristics in the specified structure. The font can subsequently be selected as the current font for any device context. (Unicode)
%group
Win32 gdi32
%prm
param0
param0 : [var] 
%inst
The CreateFontIndirectEx function specifies a logical font that has
the characteristics in the specified structure. The font can
subsequently be selected as the current font for any device context.
(Unicode)

[戻り値]
If the function succeeds, the return value is the handle to the new
ENUMLOGFONTEXDV structure. If the function fails, the return value is
zero. No extended error information is available.

[備考]
The CreateFontIndirectEx function creates a logical font with the
characteristics specified in the ENUMLOGFONTEXDV structure. When this
font is selected by using the SelectObject function, GDI's font
mapper attempts to match the logical font with an existing physical
font. If it fails to find an exact match, it provides an alternative
whose characteristics match as many of the requested characteristics
as possible. When you no longer need the font, call the DeleteObject
function to delete it. The font mapper for CreateFont,
CreateFontIndirect, and CreateFontIndirectEx recognizes both the
English and the localized typeface name, regardless of locale.
> [!NOTE] > The wingdi.h header defines CreateFontIndirectEx as an
alias which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
CreateHalftonePalette
The CreateHalftonePalette function creates a halftone palette for the specified device context (DC).
%group
Win32 gdi32
%prm
hdc
hdc : [intptr] A handle to the device context.
%inst
The CreateHalftonePalette function creates a halftone palette for the
specified device context (DC).

[戻り値]
If the function succeeds, the return value is a handle to a logical
halftone palette. If the function fails, the return value is zero.

[備考]
An application should create a halftone palette when the stretching
mode of a device context is set to HALFTONE. The logical halftone
palette returned by CreateHalftonePalette should then be selected and
realized into the device context before the StretchBlt or
StretchDIBits function is called. When you no longer need the
palette, call the DeleteObject function to delete it.


%index
CreateHatchBrush
指定されたハッチパターンと色を持つ論理ブラシを作成する。
%group
Win32 gdi32
%prm
iHatch, color
iHatch : [int] 
color : [int] ハッチに使用するブラシの前景色。COLORREF 値は RGB マクロで作成する。
%inst
指定されたハッチパターンと色を持つ論理ブラシを作成する。

[戻り値]
関数が成功した場合、戻り値は論理ブラシを識別する。失敗した場合は NULL。

[備考]
ブラシは塗りつぶされた図形の内部を描画するためにシステムが使用するビットマップ。作成後は SelectObject で任意の DC
に選択できる。ハッチブラシで親/子ウィンドウ両方の背景を同じ色で塗る場合、子ウィンドウ背景を描く前に SetBrushOrgEx
でブラシ原点を設定する必要がある。不要になったら DeleteObject で削除する。ICM:
ブラシ作成時にはカラーマネジメントは行われず、ICM 有効な DC に選択されたときに行われる。


%index
CreateICA
The CreateIC function creates an information context for the specified device. (ANSI)
%group
Win32 gdi32
%prm
pszDriver, pszDevice, pszPort, pdm
pszDriver : [str] A pointer to a null-terminated character string that specifies the name of the device driver (for example, Epson).
pszDevice : [str] A pointer to a null-terminated character string that specifies the name of the specific output device being used, as shown by the Print Manager (for example, Epson FX-80). It is not the printer model name. The lpszDevice parameter must be used.
pszPort : [str] This parameter is ignored and should be set to NULL. It is provided only for compatibility with 16-bit Windows.
pdm : [var] A pointer to a DEVMODE structure containing device-specific initialization data for the device driver. The DocumentProperties function retrieves this structure filled in for a specified device. The lpdvmInit parameter must be NULL if the device driver is to use the default initialization (if any) specified by the user.
%inst
The CreateIC function creates an information context for the
specified device. (ANSI)

[戻り値]
If the function succeeds, the return value is the handle to an
information context. If the function fails, the return value is NULL.

[備考]
When you no longer need the information DC, call the DeleteDC
function.
> [!NOTE] > The wingdi.h header defines CreateIC as an alias which
automatically selects the ANSI or Unicode version of this function
based on the definition of the UNICODE preprocessor constant. Mixing
usage of the encoding-neutral alias with code that not
encoding-neutral can lead to mismatches that result in compilation or
runtime errors. For more information, see [Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
CreateICW
The CreateIC function creates an information context for the specified device. (Unicode)
%group
Win32 gdi32
%prm
pszDriver, pszDevice, pszPort, pdm
pszDriver : [wstr] A pointer to a null-terminated character string that specifies the name of the device driver (for example, Epson).
pszDevice : [wstr] A pointer to a null-terminated character string that specifies the name of the specific output device being used, as shown by the Print Manager (for example, Epson FX-80). It is not the printer model name. The lpszDevice parameter must be used.
pszPort : [wstr] This parameter is ignored and should be set to NULL. It is provided only for compatibility with 16-bit Windows.
pdm : [var] A pointer to a DEVMODE structure containing device-specific initialization data for the device driver. The DocumentProperties function retrieves this structure filled in for a specified device. The lpdvmInit parameter must be NULL if the device driver is to use the default initialization (if any) specified by the user.
%inst
The CreateIC function creates an information context for the
specified device. (Unicode)

[戻り値]
If the function succeeds, the return value is the handle to an
information context. If the function fails, the return value is NULL.

[備考]
When you no longer need the information DC, call the DeleteDC
function.
> [!NOTE] > The wingdi.h header defines CreateIC as an alias which
automatically selects the ANSI or Unicode version of this function
based on the definition of the UNICODE preprocessor constant. Mixing
usage of the encoding-neutral alias with code that not
encoding-neutral can lead to mismatches that result in compilation or
runtime errors. For more information, see [Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
CreateMetaFileW
The CreateMetaFile function creates a device context for a Windows-format metafile. (Unicode)
%group
Win32 gdi32
%prm
pszFile
pszFile : [wstr] A pointer to the file name for the Windows-format metafile to be created. If this parameter is NULL, the Windows-format metafile is memory based and its contents are lost when it is deleted by using the DeleteMetaFile function.
%inst
The CreateMetaFile function creates a device context for a
Windows-format metafile. (Unicode)

[戻り値]
If the function succeeds, the return value is a handle to the device
context for the Windows-format metafile. If the function fails, the
return value is NULL.

[備考]
Where text arguments must use Unicode characters, use the
CreateMetaFile function as a wide-character function. Where text
arguments must use characters from the Windows character set, use
this function as an ANSI function. CreateMetaFile is a Windows-format
metafile function. This function supports only 16-bit Windows-based
applications, which are listed in Windows-Format Metafiles. It does
not record or play back GDI functions such as PolyBezier, which were
not part of 16-bit Windows. The device context created by this
function can be used to record GDI output functions in a
Windows-format metafile. It cannot be used with GDI query functions
such as GetTextColor. When the device context is used with a GDI
output function, the return value of that function becomes TRUE if
the function is recorded and FALSE otherwise. When an object is
selected by using the SelectObject function, only a copy of the
object is recorded. The object still belongs to the application. To
create a scalable Windows-format metafile, record the graphics output
in the MM_ANISOTROPIC mapping mode. The file cannot contain functions
that modify the viewport origin and extents, nor can it contain
device-dependent functions such as the SelectClipRgn function. Once
created, the Windows metafile can be scaled and rendered to any
output device-format by defining the viewport origin and extents of
the picture before playing it.
> [!NOTE] > The wingdi.h header defines CreateMetaFile as an alias
which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
CreatePalette
The CreatePalette function creates a logical palette.
%group
Win32 gdi32
%prm
plpal
plpal : [var] A pointer to a LOGPALETTE structure that contains information about the colors in the logical palette.
%inst
The CreatePalette function creates a logical palette.

[戻り値]
If the function succeeds, the return value is a handle to a logical
palette. If the function fails, the return value is NULL.

[備考]
An application can determine whether a device supports palette
operations by calling the GetDeviceCaps function and specifying the
RASTERCAPS constant. Once an application creates a logical palette,
it can select that palette into a device context by calling the
SelectPalette function. A palette selected into a device context can
be realized by calling the RealizePalette function. When you no
longer need the palette, call the DeleteObject function to delete it.


%index
CreatePatternBrush
指定したビットマップパターンを持つ論理ブラシを作成する。ビットマップは CreateDIBSection で作成した DIB セクションビットマップでもデバイス依存ビットマップでもよい。
%group
Win32 gdi32
%prm
hbm
hbm : [intptr] 論理ブラシの作成に使用するビットマップへのハンドル。
%inst
指定したビットマップパターンを持つ論理ブラシを作成する。ビットマップは CreateDIBSection で作成した DIB
セクションビットマップでもデバイス依存ビットマップでもよい。

[戻り値]
関数が成功した場合、戻り値は論理ブラシを識別する。失敗した場合は NULL。

[備考]
パターンブラシは塗りつぶされた図形の内部を描画するためにシステムが使用するビットマップ。CreatePatternBrush
で作成後、SelectObject で任意の DC に選択できる。DeleteObject
でパターンブラシを削除してもビットマップには影響しないので、同じビットマップから何度でもブラシを作成できる。モノクロビットマップから作成した場合、0
は現在のテキスト色、1 は現在の背景色で描画される。


%index
CreatePen
指定されたスタイル、幅、色を持つ論理ペンを作成する。ペンは DC に選択して線や曲線の描画に使用できる。
%group
Win32 gdi32
%prm
iStyle, cWidth, color
iStyle : [int] 
cWidth : [int] ペンの幅(論理単位)。0 の場合、現在の変換に関わらず 1 ピクセル幅。PS_DASH、PS_DOT、PS_DASHDOT、PS_DASHDOTDOT スタイルで 1 より大きい幅を指定した場合、CreatePen は PS_SOLID スタイルの指定幅ペンを返す。
color : [int] ペンの色への参照。COLORREF 構造体は RGB マクロで生成する。
%inst
指定されたスタイル、幅、色を持つ論理ペンを作成する。ペンは DC に選択して線や曲線の描画に使用できる。

[戻り値]
関数が成功した場合、戻り値は論理ペンを識別するハンドル。失敗した場合は NULL。

[備考]
論理ペン作成後、SelectObject で DC に選択して線や曲線を描画できる。nWidth が 0 の場合、現在の変換に関わらず線は
1 ピクセル幅。nWidth が 1 より大きい場合、fnPenStyle は
PS_NULL、PS_SOLID、PS_INSIDEFRAME
のいずれかでなければならない。PS_DASH、PS_DOT、PS_DASHDOT、PS_DASHDOTDOT
を使う場合、破線間のギャップを透明にするには SetBkMode で TRANSPARENT を設定する。不要になったら
DeleteObject で削除する。


%index
CreatePenIndirect
The CreatePenIndirect function creates a logical cosmetic pen that has the style, width, and color specified in a structure.
%group
Win32 gdi32
%prm
plpen
plpen : [var] Pointer to a LOGPEN structure that specifies the pen's style, width, and color.
%inst
The CreatePenIndirect function creates a logical cosmetic pen that
has the style, width, and color specified in a structure.

[戻り値]
If the function succeeds, the return value is a handle that
identifies a logical cosmetic pen. If the function fails, the return
value is NULL.

[備考]
After an application creates a logical pen, it can select that pen
into a device context by calling the SelectObject function. After a
pen is selected into a device context, it can be used to draw lines
and curves. When you no longer need the pen, call the DeleteObject
function to delete it.


%index
CreatePolyPolygonRgn
The CreatePolyPolygonRgn function creates a region consisting of a series of polygons. The polygons can overlap.
%group
Win32 gdi32
%prm
pptl, pc, cPoly, iMode
pptl : [var] A pointer to an array of POINT structures that define the vertices of the polygons in logical units. The polygons are specified consecutively. Each polygon is presumed closed and each vertex is specified only once.
pc : [var] A pointer to an array of integers, each of which specifies the number of points in one of the polygons in the array pointed to by lppt.
cPoly : [int] The total number of integers in the array pointed to by lpPolyCounts.
iMode : [int] 
%inst
The CreatePolyPolygonRgn function creates a region consisting of a
series of polygons. The polygons can overlap.

[戻り値]
If the function succeeds, the return value is the handle to the
region. If the function fails, the return value is zero.

[備考]
When you no longer need the HRGN object, call the DeleteObject
function to delete it. Region coordinates are represented as 27-bit
signed integers.


%index
CreatePolygonRgn
The CreatePolygonRgn function creates a polygonal region.
%group
Win32 gdi32
%prm
pptl, cPoint, iMode
pptl : [var] A pointer to an array of POINT structures that define the vertices of the polygon in logical units. The polygon is presumed closed. Each vertex can be specified only once.
cPoint : [int] The number of points in the array.
iMode : [int] 
%inst
The CreatePolygonRgn function creates a polygonal region.

[戻り値]
If the function succeeds, the return value is the handle to the
region. If the function fails, the return value is NULL.

[備考]
When you no longer need the HRGN object, call the DeleteObject
function to delete it. Region coordinates are represented as 27-bit
signed integers. Regions created by the Create<shape>Rgn methods
(such as CreateRectRgn and CreatePolygonRgn) only include the
interior of the shape; the shape's outline is excluded from the
region. This means that any point on a line between two sequential
vertices is not included in the region. If you were to call
PtInRegion for such a point, it would return zero as the result.


%index
CreateRectRgn
The CreateRectRgn function creates a rectangular region.
%group
Win32 gdi32
%prm
x1, y1, x2, y2
x1 : [int] Specifies the x-coordinate of the upper-left corner of the region in logical units.
y1 : [int] Specifies the y-coordinate of the upper-left corner of the region in logical units.
x2 : [int] Specifies the x-coordinate of the lower-right corner of the region in logical units.
y2 : [int] Specifies the y-coordinate of the lower-right corner of the region in logical units.
%inst
The CreateRectRgn function creates a rectangular region.

[戻り値]
If the function succeeds, the return value is the handle to the
region. If the function fails, the return value is NULL.

[備考]
When you no longer need the HRGN object, call the DeleteObject
function to delete it. Region coordinates are represented as 27-bit
signed integers. Regions created by the Create<shape>Rgn methods
(such as CreateRectRgn and CreatePolygonRgn) only include the
interior of the shape; the shape's outline is excluded from the
region. This means that any point on a line between two sequential
vertices is not included in the region. If you were to call
PtInRegion for such a point, it would return zero as the result.


%index
CreateRectRgnIndirect
The CreateRectRgnIndirect function creates a rectangular region.
%group
Win32 gdi32
%prm
lprect
lprect : [var] Pointer to a RECT structure that contains the coordinates of the upper-left and lower-right corners of the rectangle that defines the region in logical units.
%inst
The CreateRectRgnIndirect function creates a rectangular region.

[戻り値]
If the function succeeds, the return value is the handle to the
region. If the function fails, the return value is NULL.

[備考]
When you no longer need the HRGN object, call the DeleteObject
function to delete it. Region coordinates are represented as 27-bit
signed integers. The region will be exclusive of the bottom and right
edges.


%index
CreateRoundRectRgn
The CreateRoundRectRgn function creates a rectangular region with rounded corners.
%group
Win32 gdi32
%prm
x1, y1, x2, y2, w, h
x1 : [int] Specifies the x-coordinate of the upper-left corner of the region in device units.
y1 : [int] Specifies the y-coordinate of the upper-left corner of the region in device units.
x2 : [int] Specifies the x-coordinate of the lower-right corner of the region in device units.
y2 : [int] Specifies the y-coordinate of the lower-right corner of the region in device units.
w : [int] Specifies the width of the ellipse used to create the rounded corners in device units.
h : [int] Specifies the height of the ellipse used to create the rounded corners in device units.
%inst
The CreateRoundRectRgn function creates a rectangular region with
rounded corners.

[戻り値]
If the function succeeds, the return value is the handle to the
region. If the function fails, the return value is NULL.

[備考]
When you no longer need the HRGN object call the DeleteObject
function to delete it. Region coordinates are represented as 27-bit
signed integers.


%index
CreateScalableFontResourceW
The CreateScalableFontResource function creates a font resource file for a scalable font. (Unicode)
%group
Win32 gdi32
%prm
fdwHidden, lpszFont, lpszFile, lpszPath
fdwHidden : [int] 
lpszFont : [wstr] A pointer to a null-terminated string specifying the name of the font resource file to create. If this parameter specifies an existing font resource file, the function fails.
lpszFile : [wstr] A pointer to a null-terminated string specifying the name of the scalable font file that this function uses to create the font resource file.
lpszPath : [wstr] A pointer to a null-terminated string specifying the path to the scalable font file.
%inst
The CreateScalableFontResource function creates a font resource file
for a scalable font. (Unicode)

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero. If lpszFontRes specifies an
existing font file, GetLastError returns ERROR_FILE_EXISTS

[備考]
The CreateScalableFontResource function is used by applications that
install TrueType fonts. An application uses the
CreateScalableFontResource function to create a font resource file
(typically with a .fot file name extension) and then uses the
AddFontResource function to install the font. The TrueType font file
(typically with a .ttf file name extension) must be in the System
subdirectory of the Windows directory to be used by the
AddFontResource function. The CreateScalableFontResource function
currently supports only TrueType-technology scalable fonts. When the
lpszFontFile parameter specifies only a file name and extension, the
lpszCurrentPath parameter must specify a path. When the lpszFontFile
parameter specifies a full path, the lpszCurrentPath parameter must
be NULL or a pointer to NULL. When only a file name and extension are
specified in the lpszFontFile parameter and a path is specified in
the lpszCurrentPath parameter, the string in lpszFontFile is copied
into the .fot file as the .ttf file that belongs to this resource.
When the AddFontResource function is called, the operating system
assumes that the .ttf file has been copied into the System directory
(or into the main Windows directory in the case of a network
installation). The .ttf file need not be in this directory when the
CreateScalableFontResource function is called, because the
lpszCurrentPath parameter contains the directory information. A
resource created in this manner does not contain absolute path
information and can be used in any installation. When a path is
specified in the lpszFontFile parameter and NULL is specified in the
lpszCurrentPath parameter, the string in lpszFontFile is copied into
the .fot file. In this case, when the AddFontResource function is
called, the .ttf file must be at the location specified in the
lpszFontFile parameter when the CreateScalableFontResource function
was called; the lpszCurrentPath parameter is not needed. A resource
created in this manner contains absolute references to paths and
drives and does not work if the .ttf file is moved to a different
location.
> [!NOTE] > The wingdi.h header defines CreateScalableFontResource as
an alias which automatically selects the ANSI or Unicode version of
this function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
CreateSolidBrush
指定された単色を持つ論理ブラシを作成する。
%group
Win32 gdi32
%prm
color
color : [int] ブラシの色。COLORREF 値は RGB マクロで作成する。
%inst
指定された単色を持つ論理ブラシを作成する。

[戻り値]
関数が成功した場合、戻り値は論理ブラシを識別する。失敗した場合は NULL。

[備考]
HBRUSH オブジェクトが不要になったら DeleteObject
で削除する。ソリッドブラシは塗りつぶされた図形の内部を描画するためにシステムが使用するビットマップ。システムカラーブラシを使うには、CreateSolidBrush(GetSysColor(nIndex))
ではなく GetSysColorBrush(nIndex) を使うことで、キャッシュされたブラシが返されるため効率が良い。


%index
DPtoLP
The DPtoLP function converts device coordinates into logical coordinates. The conversion depends on the mapping mode of the device context, the settings of the origins and extents for the window and viewport, and the world transformation.
%group
Win32 gdi32
%prm
hdc, lppt, c
hdc : [intptr] A handle to the device context.
lppt : [var] A pointer to an array of POINT structures. The x- and y-coordinates contained in each POINT structure will be transformed.
c : [int] The number of points in the array.
%inst
The DPtoLP function converts device coordinates into logical
coordinates. The conversion depends on the mapping mode of the device
context, the settings of the origins and extents for the window and
viewport, and the world transformation.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero.

[備考]
The DPtoLP function fails if the device coordinates exceed 27 bits,
or if the converted logical coordinates exceed 32 bits. In the case
of such an overflow, the results for all the points are undefined.


%index
DeleteDC
指定されたデバイスコンテキスト(DC)を削除する。
%group
Win32 gdi32
%prm
hdc
hdc : [intptr] デバイスコンテキストへのハンドル。
%inst
指定されたデバイスコンテキスト(DC)を削除する。

[戻り値]
関数が成功した場合、戻り値は 0 以外。失敗した場合は 0。

[備考]
GetDC で取得したハンドルの DC を DeleteDC で削除してはならない。代わりに ReleaseDC を呼び出して解放する。


%index
DescribePixelFormat
The DescribePixelFormat function obtains information about the pixel format identified by iPixelFormat of the device associated with hdc. The function sets the members of the PIXELFORMATDESCRIPTOR structure pointed to by ppfd with that pixel format data.
%group
Win32 gdi32
%prm
hdc, iPixelFormat, nBytes, ppfd
hdc : [intptr] Specifies the device context.
iPixelFormat : [int] Index that specifies the pixel format. The pixel formats that a device context supports are identified by positive one-based integer indexes.
nBytes : [int] The size, in bytes, of the structure pointed to by ppfd. The DescribePixelFormat function stores no more than nBytes bytes of data to that structure. Set this value to sizeof(PIXELFORMATDESCRIPTOR).
ppfd : [var] Pointer to a PIXELFORMATDESCRIPTOR structure whose members the function sets with pixel format data. The function stores the number of bytes copied to the structure in the structure's nSize member. If, upon entry, ppfd is NULL, the function writes no data to the structure. This is useful when you only want to obtain the maximum pixel format index of a device context.
%inst
The DescribePixelFormat function obtains information about the pixel
format identified by iPixelFormat of the device associated with hdc.
The function sets the members of the PIXELFORMATDESCRIPTOR structure
pointed to by ppfd with that pixel format data.

[戻り値]
If the function succeeds, the return value is the maximum pixel
format index of the device context. In addition, the function sets
the members of the PIXELFORMATDESCRIPTOR structure pointed to by ppfd
according to the specified pixel format. If the function fails, the
return value is zero. To get extended error information, call
GetLastError.


%index
DrawEscape
The DrawEscape function provides drawing capabilities of the specified video display that are not directly available through the graphics device interface (GDI).
%group
Win32 gdi32
%prm
hdc, iEscape, cjIn, lpIn
hdc : [intptr] A handle to the DC for the specified video display.
iEscape : [int] The escape function to be performed.
cjIn : [int] The number of bytes of data pointed to by the lpszInData parameter.
lpIn : [str] A pointer to the input structure required for the specified escape.
%inst
The DrawEscape function provides drawing capabilities of the
specified video display that are not directly available through the
graphics device interface (GDI).

[戻り値]
If the function is successful, the return value is greater than zero
except for the QUERYESCSUPPORT draw escape, which checks for
implementation only. If the escape is not implemented, the return
value is zero. If an error occurred, the return value is less than
zero.

[備考]
When an application calls the DrawEscape function, the data
identified by cbInput and lpszInData is passed directly to the
specified display driver.


%index
Ellipse
D2D1_ELLIPSE 構造体を作成する。
%group
Win32 gdi32
%prm
hdc, left, top, right, bottom
hdc : [intptr] 
left : [int] 
top : [int] 
right : [int] 
bottom : [int] 
%inst
D2D1_ELLIPSE 構造体を作成する。

[戻り値]
型: D2D1_ELLIPSE 新しい楕円。


%index
EndDoc
The EndDoc function ends a print job.
%group
Win32 gdi32
%prm
hdc
hdc : [intptr] Handle to the device context for the print job.
%inst
The EndDoc function ends a print job.

[戻り値]
If the function succeeds, the return value is greater than zero. If
the function fails, the return value is less than or equal to zero.

[備考]
Note This is a blocking or synchronous function and might not return
immediately. How quickly this function returns depends on run-time
factors such as network status, print server configuration, and
printer driver implementation?factors that are difficult to predict
when writing an application. Calling this function from a thread that
manages interaction with the user interface could make the
application appear to be unresponsive. Applications should call
EndDoc immediately after finishing a print job.


%index
EndPage
The EndPage function notifies the device that the application has finished writing to a page. This function is typically used to direct the device driver to advance to a new page.
%group
Win32 gdi32
%prm
hdc
hdc : [intptr] A handle to the device context for the print job.
%inst
The EndPage function notifies the device that the application has
finished writing to a page. This function is typically used to direct
the device driver to advance to a new page.

[戻り値]
If the function succeeds, the return value is greater than zero. If
the function fails, the return value is less than or equal to zero.

[備考]
Note This is a blocking or synchronous function and might not return
immediately. How quickly this function returns depends on run-time
factors such as network status, print server configuration, and
printer driver implementation?factors that are difficult to predict
when writing an application. Calling this function from a thread that
manages interaction with the user interface could make the
application appear to be unresponsive. Use the ResetDC function to
change the device mode, if necessary, after calling the EndPage
function. Note that a call to ResetDC resets all device context
attributes back to default values. Neither EndPage nor StartPage
resets the device context attributes. Device context attributes
remain constant across subsequent pages. You do not need to re-select
objects and set up the mapping mode again before printing the next
page; however, doing so will produce the same results and reduce code
differences between versions of Windows. When a page in a spooled
file exceeds approximately 350 MB, it may fail to print and not send
an error message. For example, this can occur when printing large EMF
files. The page size limit depends on many factors including the
amount of virtual memory available, the amount of memory allocated by
calling processes, and the amount of fragmentation in the process
heap.


%index
EndPath
The EndPath function closes a path bracket and selects the path defined by the bracket into the specified device context.
%group
Win32 gdi32
%prm
hdc
hdc : [intptr] A handle to the device context into which the new path is selected.
%inst
The EndPath function closes a path bracket and selects the path
defined by the bracket into the specified device context.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero.


%index
EngDeleteSemaphore
The EngDeleteSemaphore function deletes a semaphore object from the system's resource list.
%group
Win32 gdi32
%prm
hsem
hsem : [intptr] Handle to the semaphore to be deleted. The semaphore was created in EngCreateSemaphore.
%inst
The EngDeleteSemaphore function deletes a semaphore object from the
system's resource list.

[戻り値]
None


%index
EngAcquireSemaphore
The EngAcquireSemaphore function acquires the resource associated with the semaphore for exclusive access by the calling thread.
%group
Win32 gdi32
%prm
hsem
hsem : [intptr] Handle to the semaphore associated with the resource to be acquired.
%inst
The EngAcquireSemaphore function acquires the resource associated
with the semaphore for exclusive access by the calling thread.

[戻り値]
None

[備考]
EngAcquireSemaphore allows exclusive access to the driver resource
associated with the semaphore by locking out all other threads from
accessing the semaphore's resource. A call to this routine should be
followed with a call to EngReleaseSemaphore as quickly as possible.


%index
EngAlphaBlend
The EngAlphaBlend function provides bit-block transfer capabilities with alpha blending.
%group
Win32 gdi32
%prm
psoDest, psoSrc, pco, pxlo, prclDest, prclSrc, pBlendObj
psoDest : [var] Pointer to a SURFOBJ structure that identifies the surface on which to draw.
psoSrc : [var] Pointer to a SURFOBJ structure that identifies the source surface.
pco : [var] Pointer to a CLIPOBJ structure. The CLIPOBJ_Xxx service routines are provided to enumerate the clip region as a set of rectangles. This enumeration limits the area of the destination that is modified. Whenever possible, GDI simplifies the clipping involved. However, unlike EngBitBlt, EngAlphaBlend might be called with a single rectangle in order to prevent round-off errors in clipping the output.
pxlo : [var] Pointer to a XLATEOBJ structure that specifies how color indices should be translated between the source and destination surfaces. If the source surface is palette managed, its colors are represented by indices into a lookup table of RGB color values. In this case, GDI can query the XLATEOBJ structure for a translate vector to quickly translate any source index into a color index for the destination. The situation is more complicated when, for example, the source is RGB but the destination is palette-managed. In this case, the closest match to each source RGB value must be found in the destination palette. GDI calls the XLATEOBJ_iXlate service routine to perform this matching operation.
prclDest : [var] Pointer to a RECTL structure that defines the rectangular area to be modified. This rectangle is specified in the coordinate system of the destination surface and is defined by two points: upper left and lower right. The two points that define the rectangle are always well ordered. The rectangle is lower-right exclusive; that is, its lower and right edges are not a part of the blend. The specified rectangle can overhang the destination surface; GDI performs the proper clipping when it does. EngAlphaBlend must never be called with an empty destination rectangle.
prclSrc : [var] Pointer to a RECTL structure that defines the area to be copied. This rectangle is specified in the coordinate system of the source surface and is defined by two points: upper left and lower right. The two points that define the rectangle are always well ordered. The rectangle is lower-right exclusive; that is, its lower and right edges are not a part of the blend. The source rectangle must never exceed the bounds of the source surface, and thus never overhang the source surface. EngAlphaBlend must never be called with an empty source rectangle. The mapping is defined by prclSrc and prclDest. The points specified in prclDest and prclSrc lie on integer coordinates, which correspond to pixel centers. A rectangle defined by two such points is considered to be a geometric rectangle with two vertices whose coordinates are the given points, but with 0.5 subtracted from each coordinate. (POINTL structures are shorthand notation for specifying these fractional coordinate vertices.)
pBlendObj : [var] Pointer to a BLENDOBJ structure that describes the blending operation to perform between the source and destination surfaces. This structure is a wrapper for the BLENDFUNCTION structure, which includes necessary source and destination format information that is not available in the XLATEOBJ structure . BLENDFUNCTION is declared in the Microsoft Windows SDK documentation. Its members are defined as follows: BlendOp defines the blend operation to be performed. Currently this value must be AC_SRC_OVER, which means that the source bitmap is placed over the destination bitmap based on the alpha values of the source pixels. There are three possible cases that this blend operation should handle. These are described in the Remarks section of this reference page. BlendFlags is reserved and is currently set to zero. SourceConstantAlpha defines the constant blend factor to apply to the entire source surface. This value is in the range of [0,255], where 0 is completely transparent and 255 is completely opaque. AlphaFormat defines whether the surface is assumed to have an alpha channel. This member can optionally be set to the following value:
%inst
The EngAlphaBlend function provides bit-block transfer capabilities
with alpha blending.

[戻り値]
EngAlphaBlend returns TRUE upon success. If an error occurs, it
returns FALSE and reports an error code.

[備考]
A bit-block transfer with alpha blending is supported between the
following surfaces:
This doc was truncated.


%index
EngAssociateSurface
The EngAssociateSurface function marks a given surface as belonging to a specified device.
%group
Win32 gdi32
%prm
hsurf, hdev, flHooks
hsurf : [intptr] Handle to the surface or bitmap to be associated with hdev. This handle was returned by EngCreateBitmap or EngCreateDeviceBitmap.
hdev : [intptr] Handle to the device with which the surface is to be associated. This is the GDI-created handle that was passed to the driver's DrvCompletePDEV function.
flHooks : [int] 
%inst
The EngAssociateSurface function marks a given surface as belonging
to a specified device.

[戻り値]
The return value is TRUE if the function is successful. Otherwise,
the driver should send the information to the GDI function it is
implementing, and return GDI's return value.

[備考]
EngAssociateSurface can be used by printer drivers to implement
"rules" or device fonts, or by display drivers to make use of special
blt hardware. If the surface identified by hsurf is a standard format
bitmap, the driver can specify which output functions to the surface
it will handle by setting bits in flHooks. Setting bits in flHooks
causes particular output functions to be sent to the driver instead.
This is referred to as hooking. If the driver does not hook a call,
GDI will automatically manage the operation when a standard format
bitmap is being drawn on. When the surface is associated, it assumes
the default palette and style steps of the PDEV. A surface must be
associated before it is returned by DrvEnableSurface. By default,
when a driver supports device bitmaps by implementing
DrvCreateDeviceBitmap/DrvDeleteDeviceBitmap, GDI does not
automatically synchronize drawing calls to the device bitmap and to
the primary surface. For example, GDI can call the driver's DrvBitBlt
function to draw to a device bitmap, while another thread is drawing
to the primary surface by executing the driver's implementation of
DrvTextOut. The driver can even be called to draw to multiple device
bitmaps at the same time. After DrvEnableSurface returns a handle to
a primary surface, do not call EngAssociateSurface on that handle.
Doing so can cause a bug check in certain circumstances. For more
information, see Microsoft Knowledge Base article 330248.


%index
EngBitBlt
The EngBitBlt function provides general bit-block transfer capabilities either between device-managed surfaces, or between a device-managed surface and a GDI-managed standard format bitmap.
%group
Win32 gdi32
%prm
psoTrg, psoSrc, psoMask, pco, pxlo, prclTrg, pptlSrc, pptlMask, pbo, pptlBrush, rop4
psoTrg : [var] Pointer to the SURFOBJ structure that identifies the surface on which to draw.
psoSrc : [var] If the rop4 requires it, pointer to a SURFOBJ structure that defines the source for the bit-block transfer operation.
psoMask : [var] Pointer to a SURFOBJ structure that defines a surface to be used as a mask. The mask is defined as a bitmap with 1 bit per pixel. Typically, a mask limits the area that is to be modified in the destination surface. Masking is selected by a rop4 with the value 0xAACC. The destination surface is unaffected when the mask is zero. The mask is large enough to cover the destination rectangle. If the value of this parameter is NULL and a mask is required by the rop4, then the implicit mask in the brush is used. If a mask is required, then psoMask overrides the implicit mask in the brush.
pco : [var] Pointer to a CLIPOBJ structure. The CLIPOBJ_Xxx service routines are provided to enumerate the clip region as a set of rectangles. This enumeration limits the area of the destination that will be modified. Whenever possible, GDI simplifies the clipping involved; for example, this function is never called with a single clipping rectangle. GDI clips the destination rectangle before calling this function, making additional clipping unnecessary.
pxlo : [var] Pointer to a XLATEOBJ structure that tells how color indices should be translated between the source and target surfaces.
prclTrg : [var] Pointer to a RECTL structure in the coordinate system of the destination surface that defines the area to be modified. The rectangle is defined by two points; upper left and lower right. The lower and right edges of this rectangle are not part of the bit-block transfer, meaning the rectangle is lower right exclusive. EngBitBlt is never called with an empty destination rectangle. The two points that define the rectangle are always well ordered.
pptlSrc : [var] Pointer to a POINTL structure that defines the upper left corner of the source rectangle, if a source exists. If there is no source, the driver should ignore this parameter.
pptlMask : [var] Pointer to a POINTL structure that defines which pixel in the mask corresponds to the upper left corner of the destination rectangle. If no mask is specified in psoMask the driver should ignore this parameter.
pbo : [var] Pointer to the BRUSHOBJ structure to be used to define the pattern for the bit-block transfer. GDI's BRUSHOBJ_pvGetRbrush service routine retrieves the device's realization of the brush. The driver can ignore this parameter if the rop4 parameter does not require a pattern.
pptlBrush : [var] Pointer to a POINTL structure that defines the origin of the brush in the destination surface. The upper left pixel of the brush is aligned at this point and the brush repeats according to its dimensions. Ignore this parameter if the rop4 parameter does not require a pattern.
rop4 : [int] Represents a raster operation that defines how the mask, pattern, source, and destination pixels are combined to write an output pixel to the destination surface. This is a quaternary raster operation, which is a natural extension of the usual ternary Rop3 operation. A Rop4 has 16 relevant bits, which are similar to the 8 defining bits of a Rop3. (The other, redundant bits of the Rop3 are ignored.) The simplest way to implement a Rop4 is to consider its 2 bytes separately. The lower byte specifies a Rop3 that should be computed wherever the mask is 1. The high byte specifies a Rop3 that can be computed and applied wherever the mask is 0.
%inst
The EngBitBlt function provides general bit-block transfer
capabilities either between device-managed surfaces, or between a
device-managed surface and a GDI-managed standard format bitmap.

[戻り値]
The return value is TRUE if the function is successful. Otherwise, it
is FALSE, and an error code is logged.

[備考]
If a device's surface is organized as a standard-format bitmap, the
driver can request that GDI perform the bit-block transfer by calling
EngBitBlt. A driver might do this if it has special hardware to
handle simple transfers quickly, but doesn't want to handle calls
with complicated transfers. See the Microsoft Windows SDK
documentation for more information about raster operations.


%index
EngCheckAbort
The EngCheckAbort function enables a printer graphics DLL to determine if a print job should be terminated.
%group
Win32 gdi32
%prm
pso
pso : [var] Caller-supplied pointer to a SURFOBJ structure, previously received from GDI.
%inst
The EngCheckAbort function enables a printer graphics DLL to
determine if a print job should be terminated.

[戻り値]
If the print job should be terminated, the function returns TRUE. If
the print job should not be terminated, or if pso does not point to a
valid SURFOBJ structure, the function returns FALSE.

[備考]
A printer graphics DLL should call EngCheckAbort from within any
graphics DDI function that takes more than five seconds to execute.
If the print job should be terminated, the printer graphics DLL
should stop its current operation and return to GDI, specifying a
return value of FALSE for the graphics DDI function that called
EngCheckAbort.


%index
EngComputeGlyphSet
The EngComputeGlyphSet function computes the glyph set supported on a device.
%group
Win32 gdi32
%prm
nCodePage, nFirstChar, cChars
nCodePage : [int] Specifies the code page supported.
nFirstChar : [int] Specifies the character code of the first supported ANSI character.
cChars : [int] Specifies the number of ANSI characters supported.
%inst
The EngComputeGlyphSet function computes the glyph set supported on a
device.

[戻り値]
If the glyph set is computed successfully, the function returns a
pointer to an FD_GLYPHSET structure. If an error occurs, the function
returns NULL.

[備考]
A driver can use EngComputeGlyphSet to compute the glyph set for a
font that contains only glyphs in the code page described by
nCodePage. The driver must call EngFreeMem to free memory when it is
done using the FD_GLYPHSET structure returned by EngComputeGlyphSet.


%index
EngCopyBits
The EngCopyBits function translates between device-managed raster surfaces and GDI standard-format bitmaps.
%group
Win32 gdi32
%prm
psoDest, psoSrc, pco, pxlo, prclDest, pptlSrc
psoDest : [var] Pointer to a SURFOBJ structure that describes the destination surface for the copy operation.
psoSrc : [var] Pointer to a SURFOBJ structure that describes the source surface for the copy operation.
pco : [var] Pointer to a CLIPOBJ structure that restricts the area of the destination surface that will be affected. This parameter can be NULL.
pxlo : [var] Pointer to a XLATEOBJ structure that defines the translation of color indices between the source and target surfaces.
prclDest : [var] Pointer to a RECTL structure that defines the area in the coordinate system of the destination surface that will be modified. The rectangle is lower-right exclusive, meaning the lower and right edges of this rectangle are not part of the copy.
pptlSrc : [var] Pointer to a POINTL structure that defines the upper left corner of the source rectangle.
%inst
The EngCopyBits function translates between device-managed raster
surfaces and GDI standard-format bitmaps.

[戻り値]
The return value is TRUE if the function is successful. If it is
unsuccessful, it logs an error and returns FALSE.

[備考]
Standard-format bitmaps are single-plane, packed-pixel format. Each
scan line is aligned on a 4-byte boundary. These bitmaps have 1, 4,
8, 16, 24, or 32 bits per pixel. See the EngCreateBitmap function for
a list of standard format types. GDI calls this function from its
simulations. EngCopyBits should not be called with an empty
destination rectangle, and the two points of the destination
rectangle must be well-ordered; that is, the first point should
represent the upper-left vertex of the rectangle, and the second
should represent the lower-right vertex.


%index
EngCreateBitmap
The EngCreateBitmap function requests that GDI create and manage a bitmap.
%group
Win32 gdi32
%prm
sizl, lWidth, iFormat, fl, pvBits
sizl : [var] Specifies a SIZEL structure whose members contain the width and height, in pixels, of the bitmap to be created. A SIZEL structure is identical to a SIZE structure. If pvBits is not NULL, this value should represent all pixels visible on the device, allowing the device to keep off-screen memory.
lWidth : [int] Specifies the allocation width of the bitmap, which is the number of bytes that must be added to a pointer to move down one scan line.
iFormat : [int] 
fl : [int] 
pvBits : [intptr] Pointer to the first scan line of the bitmap that is to be created. If this parameter is NULL, GDI allocates the storage space for the pixels of the bitmap. If pvBits is not NULL, it is a pointer to the buffer for the bitmap.
%inst
The EngCreateBitmap function requests that GDI create and manage a
bitmap.

[戻り値]
If the function completes successfully, the return value is a handle
that identifies the created bitmap. Otherwise, the return value is 0.
EngCreateBitmap does not log an error code.

[備考]
Storage for the bitmap can optionally be provided by the driver. The
driver should associate the created bitmap as a surface by calling
EngAssociateSurface before returning from DrvEnableSurface. The
bitmap should be deleted by using EngDeleteSurface when it is no
longer needed. Frame buffer display drivers should use the pvBits
parameter, allowing GDI to do most drawing directly to the display.


%index
EngCreateClip
The EngCreateClip function creates a CLIPOBJ structure that the driver uses in callbacks.
%group
Win32 gdi32
%prm

%inst
The EngCreateClip function creates a CLIPOBJ structure that the
driver uses in callbacks.

[戻り値]
The return value is a pointer to the newly-created CLIPOBJ structure
if the function succeeds. Otherwise, it is NULL.

[備考]
The CLIPOBJ structure created by EngCreateClip allows GDI to directly
access banked frame buffers. The structure must be initialized by the
driver so that the iDComplexity member of the CLIPOBJ structure is
set to DC_TRIVIAL or DC_RECT. If the iDComplexity member is set to
DC_RECT, the driver can set the rclBounds member of CLIPOBJ to the
extent of the frame buffer bank. The driver must delete this CLIPOBJ
structure using EngDeleteClip.


%index
EngCreateDeviceBitmap
The EngCreateDeviceBitmap function requests GDI to create a handle for a device bitmap.
%group
Win32 gdi32
%prm
dhsurf, sizl, iFormatCompat
dhsurf : [intptr] Device handle to the device bitmap to be created.
sizl : [var] Specifies a SIZEL structure that contains the width and height of the bitmap to be created. The cx and cy members of this structure contain respectively, the bitmap's width and height, in pixels. A SIZEL structure is identical to a SIZE structure.
iFormatCompat : [int] Specifies the compatible engine format of the device surface being created. This is used by GDI if a temporary buffer is needed to simulate a complicated drawing call. The allowable values for iFormatCompat are BMF_1BPP, BMF_4BPP, BMF_8BPP, BMF_16BPP, BMF_24BPP, and BMF_32BPP.
%inst
The EngCreateDeviceBitmap function requests GDI to create a handle
for a device bitmap.

[戻り値]
The return value is a handle that identifies the bitmap if the
function is successful. Otherwise, it is zero, and an error code is
logged.

[備考]
The surface should be associated by using EngAssociateSurface. The
bitmap should be deleted by calling EngDeleteSurface when it is no
longer needed.


%index
EngCreateDeviceSurface
The EngCreateDeviceSurface function creates and returns a handle for a device surface that the driver will manage.
%group
Win32 gdi32
%prm
dhsurf, sizl, iFormatCompat
dhsurf : [intptr] Device handle to the surface to be managed by the device. This handle is passed to the driver when a SURFOBJ structure is passed for input or output.
sizl : [var] Specifies a SIZEL structure that contains the width and height of the surface to be created. The cx and cy members of this structure contain respectively, the surface's width and height, in pixels. A SIZEL structure is identical to a SIZE structure.
iFormatCompat : [int] Specifies the compatible engine format of the device surface being created. This is used by GDI if a temporary buffer is needed to simulate a complicated drawing call.
%inst
The EngCreateDeviceSurface function creates and returns a handle for
a device surface that the driver will manage.

[戻り値]
The return value is a handle that identifies the surface if the
function is successful. Otherwise, it is zero, and an error code is
logged.

[備考]
The storage space for the surface can optionally be provided by the
driver. The surface should be associated by using
EngAssociateSurface. The surface should be deleted when it is no
longer needed by using EngDeleteSurface.


%index
EngCreatePalette
The EngCreatePalette function sends a request to GDI to create an RGB palette.
%group
Win32 gdi32
%prm
iMode, cColors, pulColors, flRed, flGreen, flBlue
iMode : [int] 
cColors : [int] If the iMode parameter is PAL_INDEXED, cColors specifies the number of colors provided in the array pointed to by pulColors. Otherwise, this parameter should be zero.
pulColors : [var] Pointer to the beginning of an array of ULONG values if iMode is PAL_INDEXED. The low-order 3 bytes of each ULONG define the RGB colors in the palette.
flRed : [int] If the iMode parameter is PAL_BITFIELDS, the flRed, flGreen and flBlue parameters are masks that show which bits correspond to red, green, and blue. Each mask must consist of contiguous bits and should not overlap other masks. All combinations of bitfields are supported by GDI.
flGreen : [int] If the iMode parameter is PAL_BITFIELDS, the flRed, flGreen and flBlue parameters are masks that show which bits correspond to red, green, and blue. Each mask must consist of contiguous bits and should not overlap other masks. All combinations of bitfields are supported by GDI.
flBlue : [int] If the iMode parameter is PAL_BITFIELDS, the flRed, flGreen and flBlue parameters are masks that show which bits correspond to red, green, and blue. Each mask must consist of contiguous bits and should not overlap other masks. All combinations of bitfields are supported by GDI.
%inst
The EngCreatePalette function sends a request to GDI to create an RGB
palette.

[戻り値]
The return value is a handle to the new palette if the function is
successful. Otherwise, it is zero, and an error code is logged.

[備考]
The driver can associate the new palette with a device by returning a
pointer to the palette in the DEVINFO structure. A PAL_INDEXED
palette associated with the device must have its first index entry
set to black (red = 0, green = 0, blue = 0) and its last entry set to
white (255, 255, 255). All other entries should be set so that
entries whose indexes are one's complements of each other have colors
that contrast greatly. For example, if entry 0x9 of a 16 entry
palette is set to pure green (0,255,0), entry 0x6 (=~0x9) should be
set to a color that contrasts well with green, such as dark purple
(128,0,128). Setting entries in this way allows XOR raster operations
to behave reasonably. You should delete the palette when you no
longer need it by using EngDeletePalette.


%index
EngCreateSemaphore
The EngCreateSemaphore function creates a semaphore object.
%group
Win32 gdi32
%prm

%inst
The EngCreateSemaphore function creates a semaphore object.

[戻り値]
If the function succeeds, the return value is a handle to the
semaphore object. A null pointer is returned if the function fails.

[備考]
Graphics drivers can create and use a semaphore object for resource
synchronization. For example:
This doc was truncated.


%index
EngDeleteClip
The EngDeleteClip function deletes a CLIPOBJ structure allocated by EngCreateClip.
%group
Win32 gdi32
%prm
pco
pco : [var] Pointer to the CLIPOBJ structure to delete.
%inst
The EngDeleteClip function deletes a CLIPOBJ structure allocated by
EngCreateClip.

[戻り値]
None


%index
EngDeletePalette
The EngDeletePalette function sends a request to GDI to delete the specified palette.
%group
Win32 gdi32
%prm
hpal
hpal : [intptr] Handle to the palette to be deleted. This handle is supplied by EngCreatePalette.
%inst
The EngDeletePalette function sends a request to GDI to delete the
specified palette.

[戻り値]
The return value is TRUE if the function is successful; otherwise, it
returns FALSE.


%index
EngDeletePath
The EngDeletePath function deletes a path previously allocated by EngCreatePath.
%group
Win32 gdi32
%prm
ppo
ppo : [var] Pointer to the PATHOBJ structure to be deleted.
%inst
The EngDeletePath function deletes a path previously allocated by
EngCreatePath.

[戻り値]
None


%index
EngDeleteSurface
The EngDeleteSurface function deletes the specified surface.
%group
Win32 gdi32
%prm
hsurf
hsurf : [intptr] Handle to the surface to delete. This handle can be an HSURF or HBM.
%inst
The EngDeleteSurface function deletes the specified surface.

[戻り値]
EngDeleteSurface returns TRUE if it is successful in deleting the
surface. Otherwise, it returns FALSE and an error code is logged.


%index
EngEraseSurface
The EngEraseSurface function calls GDI to erase the surface; a given rectangle on the surface will be filled with the given color.
%group
Win32 gdi32
%prm
pso, prcl, iColor
pso : [var] Pointer to the surface to erase.
prcl : [var] Pointer to a RECTL structure that defines which pixels to erase on the surface. This rectangle is exclusive of the bottom and right edges.
iColor : [int] Specifies a color index. This is an index to the value that will be written into each pixel.
%inst
The EngEraseSurface function calls GDI to erase the surface; a given
rectangle on the surface will be filled with the given color.

[戻り値]
The return value is TRUE if the function is successful. Otherwise, it
is FALSE, and an error code is reported.


%index
EngFillPath
The EngFillPath function fills a path.
%group
Win32 gdi32
%prm
pso, ppo, pco, pbo, pptlBrushOrg, mix, flOptions
pso : [var] Pointer to a SURFOBJ structure that describes the surface on which to draw.
ppo : [var] Pointer to a PATHOBJ structure that defines the path to be filled. Use the PATHOBJ_Xxx service routines to enumerate the lines, Bezier curves, and other data that make up the path.
pco : [var] Pointer to a CLIPOBJ structure. Use the CLIPOBJ_Xxx service routines to enumerate the clip region as a set of rectangles.
pbo : [var] Pointer to a BRUSHOBJ structure that defines the pattern and colors with which to fill.
pptlBrushOrg : [var] Pointer to a POINTL structure defining the brush origin to use to align the brush pattern on the device.
mix : [int] Defines the foreground and background raster operations to use for the brush.
flOptions : [int] Specifies the mode to use when filling the path. This value should be FP_WINDINGMODE or FP_ALTERNATEMODE. All other flags should be ignored. For more information about these modes, see Path Fill Modes.
%inst
The EngFillPath function fills a path.

[戻り値]
The return value is TRUE if GDI is able to fill the path. Otherwise,
it is FALSE, and an error code is not logged. If an error is
encountered, the return value is FALSE, and an error code is logged.

[備考]
Whenever GDI fills a path on a device-managed surface, it can call
this entry point depending on a comparison of the fill requirements
and the following GCAPS bits: GCAPS_BEZIERS, GCAPS_ALTERNATEFILL, and
GCAPS_WINDINGFILL.


%index
EngFindResource
The EngFindResource function determines the location of a resource in a module.
%group
Win32 gdi32
%prm
h, iName, iType, pulSize
h : [intptr] Handle to the module that contains the resource. This handle is obtained from EngLoadModule.
iName : [int] Is an integer identifier representing the name of the resource being looked up.
iType : [int] Is an integer identifier representing the type of the resource being looked up.
pulSize : [var] Pointer to a ULONG in which the resource's size, in bytes, is returned.
%inst
The EngFindResource function determines the location of a resource in
a module.

[戻り値]
The return value is a pointer to the address of the specified
resource. The function returns NULL if an error occurs.

[備考]
The size of a successfully located resource is returned in pulSize.


%index
EngFreeModule
The EngFreeModule function unmaps a file from system memory.
%group
Win32 gdi32
%prm
h
h : [intptr] Handle to the memory-mapped file to be freed. This handle was obtained from EngLoadModule or EngLoadModuleForWrite.
%inst
The EngFreeModule function unmaps a file from system memory.

[戻り値]
None


%index
EngGetCurrentCodePage
The EngGetCurrentCodePage function returns the system's default OEM and ANSI code pages.
%group
Win32 gdi32
%prm
OemCodePage, AnsiCodePage
OemCodePage : [var] Pointer to a USHORT that receives the system's default OEM code page.
AnsiCodePage : [var] Pointer to a USHORT that receives the system's default ANSI code page.
%inst
The EngGetCurrentCodePage function returns the system's default OEM
and ANSI code pages.

[戻り値]
None

[備考]
EngGetCurrentCodePage returns the default code pages that are used by
the system to translate from ANSI to Unicode. These values are set at
boot time according to locale settings.


%index
EngGetDriverName
The EngGetDriverName function returns the name of the driver's DLL.
%group
Win32 gdi32
%prm
hdev
hdev : [intptr] Handle to the device. This is the GDI handle received by the driver as the hdev parameter for DrvCompletePDEV.
%inst
The EngGetDriverName function returns the name of the driver's DLL.

[戻り値]
EngGetDriverName returns a pointer to the null-terminated string
buffer in which the name of the driver's DLL is specified. The system
obtains and stores the driver's name from the DRIVER_INFO_2 structure
when the driver is first installed through the Win32 AddPrinterDriver
routine.


%index
EngGetPrinterDataFileName
The EngGetPrinterDataFileName function retrieves the string name of the printer's data file.
%group
Win32 gdi32
%prm
hdev
hdev : [intptr] Handle to the device. This is the GDI handle received by the driver as the hdev parameter for DrvCompletePDEV.
%inst
The EngGetPrinterDataFileName function retrieves the string name of
the printer's data file.

[戻り値]
EngGetPrinterDataFileName returns a pointer to the null-terminated
string buffer in which the name of the printer's data file is
specified. The system obtains and stores the printer's data file name
from the DRIVER_INFO_2 structure (described in the Microsoft Windows
SDK documentation) when the driver is first installed through the
Microsoft Win32 AddPrinterDriver routine.


%index
EngGradientFill
The EngGradientFill function shades the specified primitives.
%group
Win32 gdi32
%prm
psoDest, pco, pxlo, pVertex, nVertex, pMesh, nMesh, prclExtents, pptlDitherOrg, ulMode
psoDest : [var] Pointer to the SURFOBJ structure that identifies the surface on which to draw.
pco : [var] Pointer to a CLIPOBJ structure. The CLIPOBJ_Xxx service routines are provided to enumerate the clip region as a set of rectangles. This enumeration limits the area of the destination that is modified. Whenever possible, GDI simplifies the clipping involved.
pxlo : [var] Pointer to a XLATEOBJ structure. This structure indicates how color indices should be translated between 32 bpp RGB format and the destination. The driver is responsible for converting the input COLOR16 color values to RGB.
pVertex : [var] Pointer to an array of TRIVERTEX structures, with each entry containing position and color information. The TRIVERTEX structure is described in the Microsoft Windows SDK documentation.
nVertex : [int] Specifies the number of TRIVERTEX structures in the array to which pVertex points.
pMesh : [intptr] Pointer to an array of structures that define the connectivity of the TRIVERTEX elements to which pVertex points. When rectangles are being drawn, pMesh points to an array of GRADIENT_RECT structures, each of which specifies two TRIVERTEX elements that define a rectangle. The TRIVERTEX elements can represent any diagonally-opposed pair of rectangle vertices. Rectangle drawing is lower-right exclusive. Both TRIVERTEX and GRADIENT_RECT are defined in the Windows SDK documentation. When triangles are being drawn, pMesh points to an array of GRADIENT_TRIANGLE structures, each of which specifies the three TRIVERTEX elements that define a triangle. Triangle drawing is lower-right exclusive. The GRADIENT_TRIANGLE structure is defined in the Windows SDK documentation.
nMesh : [int] Specifies the number of elements in the array to which pMesh points.
prclExtents : [var] Pointer to a RECTL structure that defines the area in which the gradient drawing is to occur. The points are specified in the coordinate system of the destination surface. This parameter is useful in estimating the size of the drawing operations.
pptlDitherOrg : [var] Pointer to a POINTL structure that defines the origin on the surface for dithering. The upper-left pixel of the dither pattern is aligned with this point.
ulMode : [int] 
%inst
The EngGradientFill function shades the specified primitives.

[戻り値]
EngGradientFill returns TRUE upon success. Otherwise, it reports an
error and returns FALSE.

[備考]
The driver should call EngGradientFill if it has hooked
DrvGradientFill and it is called to do something that it does not
support. The formulas used to compute the color value at each pixel
depend on the value of ulMode as follows:
GDI ignores the alpha value of the vertices, leaving the alpha
channel unchanged for surfaces that support alpha.


%index
EngLineTo
The EngLineTo function draws a single, solid, integer-only cosmetic line.
%group
Win32 gdi32
%prm
pso, pco, pbo, x1, y1, x2, y2, prclBounds, mix
pso : [var] Pointer to a SURFOBJ structure that describes the surface on which to draw.
pco : [var] Pointer to a CLIPOBJ structure that defines the clip region in which the rendering must be done. No pixels can be affected outside this clip region.
pbo : [var] Pointer to a BRUSHOBJ structure that specifies the brush to use when drawing the line.
x1 : [int] Specify the integer x-coordinate of the line's beginning point.
y1 : [int] Specify the integer y-coordinate of the line's beginning point.
x2 : [int] Specify the integer x-coordinate of the line's end point.
y2 : [int] Specify the integer x- and y-coordinate of the line's end point.
prclBounds : [var] Pointer to a RECTL structure that describes the rectangle that bounds the unclipped line. Drivers that support hardware line drawing can use this rectangle to quickly determine whether the line fits in a coordinate space small enough to be rendered by the hardware.
mix : [int] Defines how the incoming pattern should be mixed with the data already on the device surface. The low-order byte defines the raster operation. For more information about raster operation codes, see the Microsoft Windows SDK documentation.
%inst
The EngLineTo function draws a single, solid, integer-only cosmetic
line.

[戻り値]
EngLineTo returns TRUE if it succeeds; otherwise, it returns FALSE.

[備考]
The driver that has hooked DrvLineTo can call EngLineTo when the
rendering surface is a device-independent bitmap (DIB).


%index
EngLoadModule
The EngLoadModule function loads the specified data module into system memory for reading.
%group
Win32 gdi32
%prm
pwsz
pwsz : [wstr] Pointer to a null-terminated string that contains the name of the data file to be loaded.
%inst
The EngLoadModule function loads the specified data module into
system memory for reading.

[戻り値]
If EngLoadModule succeeds, the return value is a handle to the module
that was loaded. Otherwise, the return value is NULL.

[備考]
EngLoadModule loads a data file into system memory with read-only
permission. To access the loaded module, the driver should call
EngMapModule with the handle returned by this function. The file
identified by pwsz must be located in the %SystemRoot%\System32
directory or within a directory found in the directory hierarchy
under %SystemRoot%\System32. To load a writable module, the driver
should call EngLoadModuleForWrite. Drivers that need to load an image
as executable code should call EngLoadImage instead of this function.


%index
EngLockSurface
The EngLockSurface function creates a user object for a given surface. This function gives drivers access to surfaces they create.
%group
Win32 gdi32
%prm
hsurf
hsurf : [intptr] Handle to the surface to be locked.
%inst
The EngLockSurface function creates a user object for a given
surface. This function gives drivers access to surfaces they create.

[戻り値]
EngLockSurface returns a pointer to a SURFOBJ structure if the
function is successful. Otherwise, this function returns NULL.

[備考]
This function gives drivers access to surfaces they create. The
driver is responsible for unlocking the surface when it no longer
needs it. Surfaces should be locked only for very short periods of
time. Use the EngUnlockSurface function to unlock the surface.


%index
EngMarkBandingSurface
The EngMarkBandingSurface function marks the specified surface as a banding surface.
%group
Win32 gdi32
%prm
hsurf
hsurf : [intptr] Caller-supplied handle to the surface to mark as a banding surface.
%inst
The EngMarkBandingSurface function marks the specified surface as a
banding surface.

[戻り値]
EngMarkBandingSurface returns TRUE upon success; otherwise it returns
FALSE.

[備考]
If a printer graphics DLL uses GDI-managed surfaces, it must call
EngMarkBandingSurface if it cannot create a surface (by calling
EngCreateBitmap) that is large enough to hold an entire physical
page's bitmap. Both EngCreateBitmap and EngMarkBandingSurface should
be called from within the printer graphics DLL's DrvEnableSurface
function. The handle supplied for hsurf must be a bitmap handle
returned by EngCreateBitmap. If a printer graphics DLL calls
EngMarkBandingSurface, it must define DrvStartBanding and DrvNextBand
functions.


%index
EngMultiByteToUnicodeN
The EngMultiByteToUnicodeN function converts the specified ANSI source string into a Unicode string using the current ANSI code page.
%group
Win32 gdi32
%prm
UnicodeString, MaxBytesInUnicodeString, BytesInUnicodeString, MultiByteString, BytesInMultiByteString
UnicodeString : [wstr] Pointer to the buffer that receives the resultant Unicode string.
MaxBytesInUnicodeString : [int] Supplies the maximum number of bytes to be written to UnicodeString. If this value is too small, causing UnicodeString to be a truncated equivalent of MultiByteString, no error condition results.
BytesInUnicodeString : [var] Pointer to a ULONG that receives the number of bytes written to UnicodeString.
MultiByteString : [str] Pointer to the ANSI source string that is to be converted to Unicode.
BytesInMultiByteString : [int] Specifies the number of bytes in MultiByteString.
%inst
The EngMultiByteToUnicodeN function converts the specified ANSI
source string into a Unicode string using the current ANSI code page.

[戻り値]
None


%index
EngMultiByteToWideChar
The EngMultiByteToWideChar function converts an ANSI source string into a wide character string using the specified code page.
%group
Win32 gdi32
%prm
CodePage, WideCharString, BytesInWideCharString, MultiByteString, BytesInMultiByteString
CodePage : [int] Specifies the code page to use to perform the translation.
WideCharString : [wstr] Pointer to the buffer into which the translated character string is copied.
BytesInWideCharString : [int] Specifies the size, in bytes, of WideCharString. If WideCharString is not large enough to contain the translation, EngMultiByteToWideChar truncates the string, and does not report an error.
MultiByteString : [str] Pointer to the buffer containing the multibyte string to be translated.
BytesInMultiByteString : [int] Specifies the number of bytes in MultiByteString.
%inst
The EngMultiByteToWideChar function converts an ANSI source string
into a wide character string using the specified code page.

[戻り値]
The EngMultiByteToWideChar function returns the number of bytes it
converted to wide character form, if successful. Otherwise, the
function returns -1.


%index
EngPaint
The EngPaint function causes GDI to paint a specified region.
%group
Win32 gdi32
%prm
pso, pco, pbo, pptlBrushOrg, mix
pso : [var] Pointer to a SURFOBJ structure that describes the surface on which to draw.
pco : [var] Pointer to a CLIPOBJ structure that defines the area to be painted. The CLIPOBJ_Xxx service routines are provided to enumerate the clip region as a set of rectangles.
pbo : [var] Pointer to a BRUSHOBJ structure that defines the pattern and colors with which to fill.
pptlBrushOrg : [var] Pointer to a POINTL structure that defines the brush origin used to align the brush pattern on the device.
mix : [int] Defines the foreground and background raster operations to use for the brush.
%inst
The EngPaint function causes GDI to paint a specified region.

[戻り値]
The return value is TRUE if the function is successful. Otherwise, it
is FALSE, and an error code is logged.

[備考]
Vector device drivers can implement this function with the help of
EngCreatePath and PATHOBJ_Xxx service routines. The mix mode defines
how the incoming pattern should be mixed with the data already on the
device surface. The MIX data type consists of two ROP2 values packed
into a single ULONG. The low-order byte defines the foreground raster
operation; the next byte defines the background raster operation. For
more information about raster operation codes, see the Microsoft
Windows SDK documentation.


%index
EngPlgBlt
The EngPlgBlt function causes GDI to perform a rotate bit-block transfer.
%group
Win32 gdi32
%prm
psoTrg, psoSrc, psoMsk, pco, pxlo, pca, pptlBrushOrg, pptfx, prcl, pptl, iMode
psoTrg : [var] Pointer to a SURFOBJ structure that describes the surface on which to draw.
psoSrc : [var] Pointer to a SURFOBJ structure that describes the source surface for the bit-block transfer operation.
psoMsk : [var] Pointer to an optional SURFOBJ structure that represents a mask for the source. It is defined by a logic map, which is a bitmap with one bit per pixel. This mask limits the area of the source that is copied. A mask has an implicit rop4 of 0xCCAA, which means the source should be copied wherever the mask is 1, but the destination should be left alone wherever the mask is zero. If this parameter is NULL, there is an implicit rop4 of 0xCCCC, which means the source should be copied everywhere in the source rectangle. The mask will always be large enough to contain the relevant source; tiling is unnecessary.
pco : [var] Pointer to a CLIPOBJ structure that limits the area of the destination to be modified. GDI functions enumerate the clip region as a set of rectangles. Whenever possible, GDI simplifies the clipping involved. Unlike the DrvBitBlt function, EngPlgBlt may be called with a single clipping rectangle. This prevents rounding errors in clipping the output.
pxlo : [var] Pointer to a XLATEOBJ structure that defines how color indices are translated between the source and target surfaces. This XLATEOBJ structure can be queried to find the RGB color for any source index. A high quality rotate bit-block transfer is needed to interpolate colors.
pca : [var] Pointer to a COLORADJUSTMENT structure that defines the color adjustment values to be applied to the source bitmap before stretching the bits. For more information, see the Microsoft Windows SDK documentation.
pptlBrushOrg : [var] Pointer to a POINTL structure that specifies the origin of the halftone brush. Drivers that use halftone brushes should align the upper left pixel of the brush's pattern with this point on the device surface.
pptfx : [var] Pointer to three POINTFIX structures that define a parallelogram in the destination surface. A fourth, implicit, vertex is given as: D = B + C － A. For a description of this data type, see GDI Data Types. EngPlgBlt is never called with A, B, and C collinear.
prcl : [var] Pointer to a RECTL structure that defines, in the coordinate system of the source surface, the area to be copied. The points of the source rectangle are well ordered. EngPlgBlt will never be given an empty source rectangle.
pptl : [var] Pointer to a POINTL structure that specifies which pixel in the given mask corresponds to the upper-left pixel in the source rectangle. Ignore this parameter if psoMsk is NULL.
iMode : [int] 
%inst
The EngPlgBlt function causes GDI to perform a rotate bit-block
transfer.

[戻り値]
The return value is TRUE if the function is successful. Otherwise, it
is FALSE and an error code is reported.

[備考]
EngPlgBlt performs only certain types of rotations. This function
performs bit-block transfers from a rectangle defined by prcl to any
parallelogram. The parallelogram is defined by pptfx, which points to
an array of three points. The source rectangle at prcl is considered
to be a geometric rectangle whose corners are displaced by
(-0.5,-0.5) from the given integer coordinates. This exactly matches
the source rectangle for EngStretchBlt. The source rectangle is
always well ordered. The upper-left corner of the source rectangle is
mapped to the first point, A. The upper-right corner of the source
rectangle is mapped to the second point, B. The lower-left corner of
the source rectangle is mapped to the third point, C. The lower-right
corner of the source rectangle is mapped to the implicit point in the
parallelogram defined by treating the three given points as vectors
and computing:
This doc was truncated.


%index
EngQueryEMFInfo
(no summary)
%group
Win32 gdi32
%prm
hdev, pEMFInfo
hdev : [intptr] 
pEMFInfo : [var] 
%inst



%index
EngQueryLocalTime
The EngQueryLocalTime function queries the local time.
%group
Win32 gdi32
%prm
param0
param0 : [var] 
%inst
The EngQueryLocalTime function queries the local time.

[戻り値]
None

[備考]
EngQueryLocalTime returns the time at the current locale in the
ENG_TIME_FIELDS structure.


%index
EngReleaseSemaphore
The EngReleaseSemaphore function releases the specified semaphore.
%group
Win32 gdi32
%prm
hsem
hsem : [intptr] Handle to the semaphore to be released.
%inst
The EngReleaseSemaphore function releases the specified semaphore.

[戻り値]
None

[備考]
EngReleaseSemaphore releases the semaphore's exclusive lock on a
driver's resource and reenables the delivery of special kernel
asynchronous procedure calls. The lock and asynchronous procedure
call suspension were acquired in a call to EngAcquireSemaphore.


%index
EngStretchBlt
The EngStretchBlt function causes GDI to do a stretching bit-block transfer.
%group
Win32 gdi32
%prm
psoDest, psoSrc, psoMask, pco, pxlo, pca, pptlHTOrg, prclDest, prclSrc, pptlMask, iMode
psoDest : [var] Pointer to a SURFOBJ structure that describes the surface on which to draw.
psoSrc : [var] Pointer to a SURFOBJ structure that describes the source surface for the bit-block transfer.
psoMask : [var] Pointer to a SURFOBJ structure that defines a mask for the source. The mask is defined by a logic map, which is a bitmap with one bit per pixel. The mask limits the area of the source that is copied. If this parameter is specified, it has an implicit rop4 of 0xCCAA, meaning the source should be copied wherever the mask is 1, but the destination should be left alone wherever the mask is 0. If this parameter is NULL, the rop4 is implicitly 0xCCCC, which means the source should be copied everywhere in the source rectangle.
pco : [var] Pointer to a CLIPOBJ structure that limits the area to be modified in the destination. GDI services are provided to enumerate the clip region as a set of rectangles. Whenever possible, GDI simplifies the clipping involved. However, unlike DrvBitBlt, EngStretchBlt can be called with a single clipping rectangle. This prevents rounding errors in clipping the output.
pxlo : [var] Pointer to a XLATEOBJ structure that specifies how color indices are to be translated between the source and target surfaces. This XLATEOBJ structure can also be queried to find the RGB color for any source index. A high quality stretching bit-block transfer will need to interpolate colors in some cases.
pca : [var] Pointer to a COLORADJUSTMENT structure that defines the color adjustment values to be applied to the source bitmap before stretching the bits. For more information, see the Microsoft Windows SDK documentation.
pptlHTOrg : [var] Pointer to a POINTL structure that defines the origin of the halftone brush. Drivers that use halftone brushes should align the upper left pixel of the brush's pattern with this point on the device surface.
prclDest : [var] Pointer to a RECTL structure that defines the area to be modified in the coordinate system of the destination surface. This rectangle is defined by two points that are not well ordered, meaning the coordinates of the second point are not necessarily larger than those of the first point. The rectangle described does not include the lower and right edges. This function is never called with an empty destination rectangle. If the destination rectangle is not well ordered, EngStretchBlt makes it well ordered.
prclSrc : [var] Pointer to a RECTL structure that defines the area to be copied, in the coordinate system of the source surface. The rectangle will map to the rectangle defined by prclDest. This function is never given an empty source rectangle, and the points of the source rectangle are always well-ordered. The mapping is defined by prclSrc and prclDest. The points specified in prclDest and prclSrc lie on integer coordinates, which correspond to pixel centers. A rectangle defined by two such points is considered to be a geometric rectangle with two vertices whose coordinates are the given points, but with 0.5 subtracted from each coordinate. (POINTL structures are shorthand notation for specifying these fractional coordinate vertices.) The edges of any rectangle never intersect a pixel, but go around a set of pixels. The pixels that are inside the rectangle are those expected for a lower-right exclusive rectangle. EngStretchBlt maps the geometric source rectangle exactly onto the geometric destination rectangle.
pptlMask : [var] Pointer to a POINTL structure that defines the pixel in the given mask that corresponds to the upper left pixel in the source rectangle. This parameter is ignored if no mask is specified.
iMode : [int] Specifies how source pixels are combined to get output pixels. The HALFTONE mode is slower than the other modes, but produces higher quality images.
%inst
The EngStretchBlt function causes GDI to do a stretching bit-block
transfer.

[戻り値]
The return value is TRUE if the function is successful. Otherwise, it
is FALSE and an error code is reported.

[備考]
This function allows the same halftoning algorithm to be applied to
GDI bitmaps and device surfaces. The driver should call EngStretchBlt
if it has hooked DrvStretchBlt and is called to do something the
driver does not support.


%index
EngStretchBltROP
The EngStretchBltROP function performs a stretching bit-block transfer using a ROP.
%group
Win32 gdi32
%prm
psoDest, psoSrc, psoMask, pco, pxlo, pca, pptlHTOrg, prclDest, prclSrc, pptlMask, iMode, pbo, rop4
psoDest : [var] Pointer to a SURFOBJ structure that describes the surface on which to draw.
psoSrc : [var] Pointer to a SURFOBJ structure that describes the source surface for the bit-block transfer.
psoMask : [var] Pointer to a SURFOBJ structure that defines a mask for the source surface. The mask is defined by a logic map, which is a bitmap with 1 bit per pixel. Typically, a mask limits the area that is to be modified in the destination surface. This mask should always be the same size as the source surface.
pco : [var] Pointer to a CLIPOBJ structure that limits the area to be modified in the destination. The CLIPOBJ_Xxx service routines are provided to enumerate the clip region as a set of rectangles. Whenever possible, GDI simplifies the clipping involved. However, unlike EngBitBlt, EngStretchBltROP can be called with a single clipping rectangle. This prevents rounding errors in clipping the output.
pxlo : [var] Pointer to a XLATEOBJ structure that specifies how color indices are to be translated between the source and target surfaces. This XLATEOBJ structure can also be queried to find the RGB color for any source index. A high quality stretching bit-block transfer will need to interpolate colors in some cases.
pca : [var] Pointer to a COLORADJUSTMENT structure that defines the color adjustment values to be applied to the source bitmap before stretching the bits. For more information see the Windows SDK documentation.
pptlHTOrg : [var] Pointer to a POINTL structure that defines the origin of the halftone brush on the destination surface. When using halftone brushes, GDI aligns the upper left pixel of the brush's pattern at this point and repeats the brush according to its dimensions. GDI ignores this parameter if the rop4 parameter does not require a pattern.
prclDest : [var] Pointer to a RECTL structure that defines the rectangular area to be modified. This rectangle is specified in the coordinate system of the destination surface and is defined by two points: upper left and lower right. The two points that define the rectangle are not always well ordered, meaning the coordinates of the second point are not necessarily larger than those of the first point. If the destination rectangle is not well ordered, GDI makes it so. The rectangle is lower-right exclusive; that is, its lower and right edges are not a part of the copy. EngStretchBltROP must never be called with an empty destination rectangle.
prclSrc : [var] Pointer to a RECTL structure that defines the area to be copied. This rectangle is specified in the coordinate system of the source surface and is defined by two points: upper left and lower right. The two points that define the rectangle are always well ordered. The rectangle is lower-right exclusive; that is, its lower and right edges are not a part of the copy. This rectangle maps to the rectangle to which prclDest points. EngStretchBltROP must never be called with an empty source rectangle.
pptlMask : [var] Pointer to a POINTL structure that defines the pixel in the mask to which prclMask points. This pixel corresponds to the upper-left pixel in the source rectangle to which prclSrc points. This parameter is ignored if no mask is specified; that is, GDI ignores pptlMask when prclMask is NULL.
iMode : [int] 
pbo : [var] Pointer to the BRUSHOBJ structure to be used to define the pattern for the bit-block transfer. GDI's BRUSHOBJ_pvGetRbrush service routine retrieves the device's realization of the brush. GDI ignores this parameter if the rop4 parameter does not require a pattern.
rop4 : [int] Represents a raster operation that defines how the mask, pattern, source, and destination pixels are combined to write an output pixel to the destination surface. This is a quaternary raster operation, which is a natural extension of the usual ternary Rop3 operation. A Rop4 has 16 relevant bits, which are similar to the 8 defining bits of a Rop3. (The other redundant bits of the Rop3 are ignored.) The simplest way to implement a Rop4 is to consider its 2 bytes separately. The lower byte specifies a Rop3 that should be computed wherever the mask to which psoMask points is 1. The high byte specifies a Rop3 that can be computed and applied wherever the mask is zero.
%inst
The EngStretchBltROP function performs a stretching bit-block
transfer using a ROP.

[戻り値]
EngStretchBltROP returns TRUE upon success. Otherwise, it reports an
error and returns FALSE.

[備考]
The driver should call EngStretchBltROP if it has hooked
DrvStretchBltROP but cannot support all operations. The mapping is
defined by prclSrc and prclDest. The points specified in prclDest and
prclSrc lie on integer coordinates that correspond to pixel centers.
A rectangle defined by two such points is considered to be a
geometric rectangle with two vertices whose coordinates are the given
points, but with 0.5 subtracted from each coordinate. (POINTL
structures are shorthand notation for specifying these fractional
coordinate vertices.)


%index
EngTextOut
The EngTextOut function causes GDI to render a set of glyphs at specified positions.
%group
Win32 gdi32
%prm
pso, pstro, pfo, pco, prclExtra, prclOpaque, pboFore, pboOpaque, pptlOrg, mix
pso : [var] Pointer to a SURFOBJ structure that describes the surface on which to write.
pstro : [var] Pointer to a STROBJ structure that defines the glyphs to be rendered and the positions where they are to be placed.
pfo : [var] Pointer to a FONTOBJ structure that is used to retrieve information about the font and its glyphs.
pco : [var] Pointer to a CLIPOBJ structure that defines the clip region through which rendering must be done. No pixels can be affected outside this clip region.
prclExtra : [var] Pointer to a RECTL structure. This parameter should always be NULL.
prclOpaque : [var] Pointer to a RECTL structure that identifies a single opaque rectangle that is lower-right exclusive. Pixels within this rectangle (those that are not foreground and not clipped) are to be rendered with the opaque brush. This rectangle always bounds the text to be drawn. If this parameter is NULL, no opaque pixels are to be rendered.
pboFore : [var] Pointer to a BRUSHOBJ structure that represents the brush object to be used for the foreground pixels. This brush will always be a solid color brush.
pboOpaque : [var] Pointer to a BRUSHOBJ structure that represents the brush object for the opaque pixels. Both the foreground and background mix modes for this brush are assumed to be R2_COPYPEN. Unless the driver sets the GCAPS_ARBRUSHOPAQUE capabilities bit in the flGraphicsCaps member of the DEVINFO structure, it will always be called with a solid color brush.
pptlOrg : [var] Pointer to a POINTL structure that defines the brush origin for both brushes. If this parameter is set to 0 when EngTextOut is called, some printer drivers may print color images incorrectly. For more information, see Remarks.
mix : [int] Specifies foreground and background raster operations (mix modes) for pboFore.
%inst
The EngTextOut function causes GDI to render a set of glyphs at
specified positions.

[戻り値]
The return value is TRUE if the function is successful. Otherwise, it
is FALSE, and an error code is logged.

[備考]
The driver should call EngTextOut when it has hooked DrvTextOut and
cannot render the glyphs. Note The driver cannot punt to EngTextOut
if it has hooked DrvTextOut for a device managed surface. The input
parameters to EngTextOut define two sets of pixels: foreground and
opaque. The driver must render the surface so the result is identical
to a process where the opaque pixels are rendered first with the
opaque brush, and then the foreground pixels are rendered with the
foreground brush. Each of these operations is limited by clipping.
When the pptlOrg parameter of this function is set to 0, some printer
drivers print color images incorrectly in Microsoft Windows Server
2003 (Japanese version). Setting pptlOrg to 0, a NULL pointer value,
is interpreted to mean that no brush origin is defined. To prevent
this problem, initialize pptlOrg with the address of a POINTL
structure whose members are set to (0,0), prior to the call to
EngTextOut. The foreground and opaque pixels are regarded as a screen
through which color is brushed onto the surface. The glyphs of the
font do not have color in themselves. The input parameters to
EngTextOut define the set of glyph pixels, the set of extra
rectangles, the opaque rectangle, and the clip region. The driver
must calculate and then render the set of foreground and opaque
pixels. The mix mode defines how the incoming pattern should be mixed
with the data already on the device surface. The MIX data type
consists of two ROP2 values packed into a single ULONG. The low-order
byte defines the foreground raster operation; the next byte defines
the background raster operation. For more information about raster
operation codes, see the Microsoft Windows SDK documentation.


%index
EngTransparentBlt
The EngTransparentBlt function provides bit-block transfer capabilities with transparency.
%group
Win32 gdi32
%prm
psoDst, psoSrc, pco, pxlo, prclDst, prclSrc, TransColor, bCalledFromBitBlt
psoDst : [var] Pointer to the SURFOBJ structure that identifies the target surface on which to draw.
psoSrc : [var] Pointer to the SURFOBJ structure that identifies the source surface of the bit-block transfer.
pco : [var] Pointer to a CLIPOBJ structure. The CLIPOBJ_Xxx service routines are provided to enumerate the clip region as a set of rectangles. This enumeration limits the area of the destination that is modified. Whenever possible, GDI simplifies the clipping involved.
pxlo : [var] Pointer to a XLATEOBJ structure that tells how the source color indices should be translated for writing to the target surface.
prclDst : [var] Pointer to a RECTL structure that defines the rectangular area to be modified. This rectangle is specified in the coordinate system of the destination surface and is defined by two points: upper left and lower right. The rectangle is lower-right exclusive; that is, its lower and right edges are not a part of the bit-block transfer. The two points that define the rectangle are always well ordered. The driver must never call EngTransparentBlt with an empty destination rectangle.
prclSrc : [var] Pointer to a RECTL structure that defines the rectangular area to be copied. This rectangle is specified in the coordinate system of the source surface and is defined by two points: upper left and lower right. The two points that define the rectangle are always well ordered. The source rectangle will never exceed the bounds of the source surface, and so will never overhang the source surface. This rectangle is mapped to the destination rectangle defined by prclDst. The driver must never call EngTransparentBlt with an empty source rectangle.
TransColor : [int] Specifies the physical transparent color, in the source surface's format. This is a color index value that has been translated to the source surface's palette. For more information, see the Remarks section.
bCalledFromBitBlt : [int] Reserved. This parameter must be set to zero.
%inst
The EngTransparentBlt function provides bit-block transfer
capabilities with transparency.

[戻り値]
EngTransparentBlt returns TRUE upon success. Otherwise, it returns
FALSE.

[備考]
The driver should call EngTransparentBlt if it has hooked
DrvTransparentBlt and it is called to do something that it does not
support. Bit-block transfer with transparency is supported between
two device-managed surfaces or between a device-managed surface and a
GDI-managed standard format bitmap. Currently, GDI supports only
BMF_4BPP and BMF_8BPP source surfaces. The pixels on the source
surface that match the transparent color specified by
iTransparentColor are not copied. For a detailed explanation of
transparent blts, see Copying Bitmaps.


%index
EngUnicodeToMultiByteN
The EngUnicodeToMultiByteN function converts the specified Unicode string into an ANSI string using the current ANSI code page.
%group
Win32 gdi32
%prm
MultiByteString, MaxBytesInMultiByteString, BytesInMultiByteString, UnicodeString, BytesInUnicodeString
MultiByteString : [str] Pointer to the buffer that receives the resultant ANSI string.
MaxBytesInMultiByteString : [int] Specifies the maximum number of bytes to be written to MultiByteString. If this value is too small, causing MultiByteString to be a truncated equivalent of UnicodeString, then no error condition results.
BytesInMultiByteString : [var] Pointer to a ULONG that receives the number of bytes written to MultiByteString.
UnicodeString : [wstr] Pointer to the Unicode source string that is to be converted to ANSI.
BytesInUnicodeString : [int] Specifies the number of bytes in UnicodeString.
%inst
The EngUnicodeToMultiByteN function converts the specified Unicode
string into an ANSI string using the current ANSI code page.

[戻り値]
None


%index
EngUnlockSurface
The EngUnlockSurface function causes GDI to unlock the surface.
%group
Win32 gdi32
%prm
pso
pso : [var] Pointer to a SURFOBJ structure that describes the surface to be unlocked.
%inst
The EngUnlockSurface function causes GDI to unlock the surface.

[戻り値]
None

[備考]
The specified surface must previously have been locked by a call to
EngLockSurface. The pointer to the SURFOBJ structure must not be used
after this call.


%index
EngWideCharToMultiByte
The EngWideCharToMultiByte function converts a wide character string into an ANSI source string using the specified code page.
%group
Win32 gdi32
%prm
CodePage, WideCharString, BytesInWideCharString, MultiByteString, BytesInMultiByteString
CodePage : [int] Specifies the code page to use to perform the translation.
WideCharString : [wstr] Pointer to a buffer containing the wide character string to be translated.
BytesInWideCharString : [int] Specifies the size, in bytes, of WideCharString.
MultiByteString : [str] Pointer to a buffer into which the translated character string is to be copied
BytesInMultiByteString : [int] Specifies the number of bytes in MultiByteString. If MultiByteString is not large enough to contain the translation, EngWideCharToMultiByte truncates the string, and does not report an error.
%inst
The EngWideCharToMultiByte function converts a wide character string
into an ANSI source string using the specified code page.

[戻り値]
EngWideCharToMultiByte returns the number of bytes converted into
multibyte form, if successful. Otherwise, it returns -1.


%index
EnumEnhMetaFile
The EnumEnhMetaFile function enumerates the records within an enhanced-format metafile by retrieving each record and passing it to the specified callback function.
%group
Win32 gdi32
%prm
hdc, hmf, proc, param3, lpRect
hdc : [intptr] A handle to a device context. This handle is passed to the callback function.
hmf : [intptr] A handle to an enhanced metafile.
proc : [int] A pointer to the application-supplied callback function. For more information, see the EnhMetaFileProc function.
param3 : [intptr] 
lpRect : [var] A pointer to a RECT structure that specifies the coordinates, in logical units, of the picture's upper-left and lower-right corners.
%inst
The EnumEnhMetaFile function enumerates the records within an
enhanced-format metafile by retrieving each record and passing it to
the specified callback function.

[戻り値]
If the callback function successfully enumerates all the records in
the enhanced metafile, the return value is nonzero. If the callback
function does not successfully enumerate all the records in the
enhanced metafile, the return value is zero.

[備考]
Points along the edge of the rectangle pointed to by the lpRect
parameter are included in the picture. If the hdc parameter is NULL,
the system ignores lpRect. If the callback function calls the
PlayEnhMetaFileRecord function, hdc must identify a valid device
context. The system uses the device context's transformation and
mapping mode to transform the picture displayed by the
PlayEnhMetaFileRecord function. You can use the EnumEnhMetaFile
function to embed one enhanced-metafile within another.


%index
EnumFontFamiliesW
The EnumFontFamilies function enumerates the fonts in a specified font family that are available on a specified device. (Unicode)
%group
Win32 gdi32
%prm
hdc, lpLogfont, lpProc, lParam
hdc : [intptr] A handle to the device context from which to enumerate the fonts.
lpLogfont : [wstr] A pointer to a null-terminated string that specifies the family name of the desired fonts. If lpszFamily is NULL, EnumFontFamilies selects and enumerates one font of each available type family.
lpProc : [int] A pointer to the application defined callback function. For information, see EnumFontFamProc.
lParam : [intptr] A pointer to application-supplied data. The data is passed to the callback function along with the font information.
%inst
The EnumFontFamilies function enumerates the fonts in a specified
font family that are available on a specified device. (Unicode)

[戻り値]
The return value is the last value returned by the callback function.
Its meaning is implementation specific.

[備考]
For each font having the typeface name specified by the lpszFamily
parameter, the EnumFontFamilies function retrieves information about
that font and passes it to the function pointed to by the
lpEnumFontFamProc parameter. The application defined callback
function can process the font information as desired. Enumeration
continues until there are no more fonts or the callback function
returns zero. When the graphics mode on the device context is set to
GM_ADVANCED using the SetGraphicsMode function and the
DEVICE_FONTTYPE flag is passed to the FontType parameter, this
function returns a list of type 1 and OpenType fonts on the system.
When the graphics mode is not set to GM_ADVANCED, this function
returns a list of type 1, OpenType, and TrueType fonts on the system.
The fonts for many East Asian languages have two typeface names: an
English name and a localized name. EnumFonts, EnumFontFamilies, and
EnumFontFamiliesEx return the English typeface name if the system
locale does not match the language of the font.


%index
EnumFontFamiliesExW
The EnumFontFamiliesEx function enumerates all uniquely-named fonts in the system that match the font characteristics specified by the LOGFONT structure. EnumFontFamiliesEx enumerates fonts based on typeface name, character set, or both. (Unicode)
%group
Win32 gdi32
%prm
hdc, lpLogfont, lpProc, lParam, dwFlags
hdc : [intptr] A handle to the device context from which to enumerate the fonts.
lpLogfont : [var] A pointer to a LOGFONT structure that contains information about the fonts to enumerate. The function examines the following members.
lpProc : [int] A pointer to the application defined callback function. For more information, see the EnumFontFamExProc function.
lParam : [intptr] An application defined value. The function passes this value to the callback function along with font information.
dwFlags : [int] This parameter is not used and must be zero.
%inst
The EnumFontFamiliesEx function enumerates all uniquely-named fonts
in the system that match the font characteristics specified by the
LOGFONT structure. EnumFontFamiliesEx enumerates fonts based on
typeface name, character set, or both. (Unicode)

[戻り値]
The return value is the last value returned by the callback function.
This value depends on which font families are available for the
specified device.

[備考]
The EnumFontFamiliesEx function does not use tagged typeface names to
identify character sets. Instead, it always passes the correct
typeface name and a separate character set value to the callback
function. The function enumerates fonts based on the values of the
lfCharSet and lfFaceName members in the LOGFONT structure. As with
EnumFontFamilies, EnumFontFamiliesEx enumerates all font styles. Not
all styles of a font cover the same character sets. For example,
Fontorama Bold might contain ANSI, Greek, and Cyrillic characters,
but Fontorama Italic might contain only ANSI characters. For this
reason, it's best not to assume that a specified font covers a
specific character set, even if it is the ANSI character set. The
following table shows the results of various combinations of values
for lfCharSet and lfFaceName.
This doc was truncated.


%index
EnumFontsW
The EnumFonts function enumerates the fonts available on a specified device. (Unicode)
%group
Win32 gdi32
%prm
hdc, lpLogfont, lpProc, lParam
hdc : [intptr] A handle to the device context from which to enumerate the fonts.
lpLogfont : [wstr] A pointer to a null-terminated string that specifies the typeface name of the desired fonts. If lpFaceName is NULL, EnumFonts randomly selects and enumerates one font of each available typeface.
lpProc : [int] A pointer to the application definedcallback function. For more information, see EnumFontsProc.
lParam : [intptr] A pointer to any application-defined data. The data is passed to the callback function along with the font information.
%inst
The EnumFonts function enumerates the fonts available on a specified
device. (Unicode)

[戻り値]
The return value is the last value returned by the callback function.
Its meaning is defined by the application.

[備考]
Use EnumFontFamiliesEx instead of EnumFonts. The EnumFontFamiliesEx
function differs from the EnumFonts function in that it retrieves the
style names associated with a TrueType font. With EnumFontFamiliesEx,
you can retrieve information about font styles that cannot be
enumerated using the EnumFonts function. The fonts for many East
Asian languages have two typeface names: an English name and a
localized name. EnumFonts, EnumFontFamilies, and EnumFontFamiliesEx
return the English typeface name if the system locale does not match
the language of the font.
> [!NOTE] > The wingdi.h header defines EnumFonts as an alias which
automatically selects the ANSI or Unicode version of this function
based on the definition of the UNICODE preprocessor constant. Mixing
usage of the encoding-neutral alias with code that not
encoding-neutral can lead to mismatches that result in compilation or
runtime errors. For more information, see [Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
EnumICMProfilesW
The EnumICMProfiles function enumerates the different output color profiles that the system supports for a given device context. (Unicode)
%group
Win32 gdi32
%prm
hdc, proc, param2
hdc : [intptr] Specifies the device context.
proc : [int] Specifies the procedure instance address of a callback function defined by the application. (See EnumICMProfilesProcCallback.)
param2 : [intptr] 
%inst
The EnumICMProfiles function enumerates the different output color
profiles that the system supports for a given device context.
(Unicode)

[戻り値]
This function returns zero if the application interrupted the
enumeration. The return value is -1 if there are no color profiles to
enumerate. Otherwise, the return value is the last value returned by
the callback function.

[備考]
The EnumICMProfiles function returns a list of profiles that are
associated with a device context (DC), and whose settings match those
of the DC. It is possible for a device context to contain device
profiles that are not associated with particular hardware devices, or
device profiles that do not match the settings of the DC. The sRGB
profile is an example. The SetICMProfile function is used to
associate these types of profiles with a DC. The GetICMProfile
function can be used to retrieve a profile that is not enumerated by
the EnumICMProfiles function. Windows 95/98/Me:EnumICMProfilesW is
supported by the Microsoft Layer for Unicode. To use this, you must
add certain files to your application, as outlined in Microsoft Layer
for Unicode on Windows 95/98/Me Systems.
> [!NOTE] > The wingdi.h header defines EnumICMProfiles as an alias
which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
EnumMetaFile
The EnumMetaFile function enumerates the records within a Windows-format metafile by retrieving each record and passing it to the specified callback function.
%group
Win32 gdi32
%prm
hdc, hmf, proc, param3
hdc : [intptr] Handle to a device context. This handle is passed to the callback function.
hmf : [intptr] Handle to a Windows-format metafile.
proc : [int] Pointer to an application-supplied callback function. For more information, see EnumMetaFileProc.
param3 : [intptr] 
%inst
The EnumMetaFile function enumerates the records within a
Windows-format metafile by retrieving each record and passing it to
the specified callback function.

[戻り値]
If the callback function successfully enumerates all the records in
the Windows-format metafile, the return value is nonzero. If the
callback function does not successfully enumerate all the records in
the Windows-format metafile, the return value is zero.

[備考]
To convert a Windows-format metafile into an enhanced-format
metafile, use the SetWinMetaFileBits function. You can use the
EnumMetaFile function to embed one Windows-format metafile within
another.


%index
EnumObjects
The EnumObjects function enumerates the pens or brushes available for the specified device context (DC).
%group
Win32 gdi32
%prm
hdc, nType, lpFunc, lParam
hdc : [intptr] A handle to the DC.
nType : [int] The object type. This parameter can be OBJ_BRUSH or OBJ_PEN.
lpFunc : [int] A pointer to the application-defined callback function. For more information about the callback function, see the EnumObjectsProc function.
lParam : [intptr] A pointer to the application-defined data. The data is passed to the callback function along with the object information.
%inst
The EnumObjects function enumerates the pens or brushes available for
the specified device context (DC).

[戻り値]
If the function succeeds, the return value is the last value returned
by the callback function. Its meaning is user-defined. If the objects
cannot be enumerated (for example, there are too many objects), the
function returns zero without calling the callback function.


%index
EqualRgn
The EqualRgn function checks the two specified regions to determine whether they are identical. The function considers two regions identical if they are equal in size and shape.
%group
Win32 gdi32
%prm
hrgn1, hrgn2
hrgn1 : [intptr] Handle to a region.
hrgn2 : [intptr] Handle to a region.
%inst
The EqualRgn function checks the two specified regions to determine
whether they are identical. The function considers two regions
identical if they are equal in size and shape.

[戻り値]
If the two regions are equal, the return value is nonzero. If the two
regions are not equal, the return value is zero. A return value of
ERROR means at least one of the region handles is invalid.


%index
Escape
Enables an application to access the system-defined device capabilities that are not available through GDI.
%group
Win32 gdi32
%prm
hdc, iEscape, cjIn, pvIn, pvOut
hdc : [intptr] A handle to the device context.
iEscape : [int] The escape function to be performed. This parameter must be one of the predefined escape values listed in Remarks. Use the ExtEscape function if your application defines a private escape value.
cjIn : [int] The number of bytes of data pointed to by the lpvInData parameter. This can be 0.
pvIn : [str] A pointer to the input structure required for the specified escape.
pvOut : [intptr] A pointer to the structure that receives output from this escape. This parameter should be NULL if no data is returned.
%inst
Enables an application to access the system-defined device
capabilities that are not available through GDI.

[戻り値]
If the function succeeds, the return value is greater than zero,
except with the QUERYESCSUPPORT printer escape, which checks for
implementation only. If the escape is not implemented, the return
value is zero. If the function fails, the return value is a system
error code.

[備考]
Note This is a blocking or synchronous function and might not return
immediately. How quickly this function returns depends on run-time
factors such as network status, print server configuration, and
printer driver implementation?factors that are difficult to predict
when writing an application. Calling this function from a thread that
manages interaction with the user interface could make the
application appear to be unresponsive. The effect of passing 0 for
cbInput will depend on the value of nEscape and on the driver that is
handling the escape. Of the original printer escapes, only the
following can be used.
This doc was truncated.


%index
ExcludeClipRect
The ExcludeClipRect function creates a new clipping region that consists of the existing clipping region minus the specified rectangle.
%group
Win32 gdi32
%prm
hdc, left, top, right, bottom
hdc : [intptr] A handle to the device context.
left : [int] The x-coordinate, in logical units, of the upper-left corner of the rectangle.
top : [int] The y-coordinate, in logical units, of the upper-left corner of the rectangle.
right : [int] The x-coordinate, in logical units, of the lower-right corner of the rectangle.
bottom : [int] The y-coordinate, in logical units, of the lower-right corner of the rectangle.
%inst
The ExcludeClipRect function creates a new clipping region that
consists of the existing clipping region minus the specified
rectangle.

[戻り値]
The return value specifies the new clipping region's complexity; it
can be one of the following values.
This doc was truncated.

[備考]
The lower and right edges of the specified rectangle are not excluded
from the clipping region.


%index
ExtCreatePen
The ExtCreatePen function creates a logical cosmetic or geometric pen that has the specified style, width, and brush attributes.
%group
Win32 gdi32
%prm
iPenStyle, cWidth, plbrush, cStyle, pstyle
iPenStyle : [int] A combination of type, style, end cap, and join attributes. The values from each category are combined by using the bitwise OR operator ( | ).
cWidth : [int] The width of the pen. If the dwPenStyle parameter is PS_GEOMETRIC, the width is given in logical units. If dwPenStyle is PS_COSMETIC, the width must be set to 1.
plbrush : [var] A pointer to a LOGBRUSH structure. If dwPenStyle is PS_COSMETIC, the lbColor member specifies the color of the pen and the lpStyle member must be set to BS_SOLID. If dwPenStyle is PS_GEOMETRIC, all members must be used to specify the brush attributes of the pen.
cStyle : [int] The length, in DWORD units, of the lpStyle array. This value must be zero if dwPenStyle is not PS_USERSTYLE. The style count is limited to 16.
pstyle : [var] A pointer to an array. The first value specifies the length of the first dash in a user-defined style, the second value specifies the length of the first space, and so on. This pointer must be NULL if dwPenStyle is not PS_USERSTYLE. If the lpStyle array is exceeded during line drawing, the pointer is reset to the beginning of the array. When this happens and dwStyleCount is an even number, the pattern of dashes and spaces repeats. However, if dwStyleCount is odd, the pattern reverses when the pointer is reset -- the first element of lpStyle now refers to spaces, the second refers to dashes, and so forth.
%inst
The ExtCreatePen function creates a logical cosmetic or geometric pen
that has the specified style, width, and brush attributes.

[戻り値]
If the function succeeds, the return value is a handle that
identifies a logical pen. If the function fails, the return value is
zero.

[備考]
A geometric pen can have any width and can have any of the attributes
of a brush, such as dithers and patterns. A cosmetic pen can only be
a single pixel wide and must be a solid color, but cosmetic pens are
generally faster than geometric pens. The width of a geometric pen is
always specified in world units. The width of a cosmetic pen is
always 1. End caps and joins are only specified for geometric pens.
After an application creates a logical pen, it can select that pen
into a device context by calling the SelectObject function. After a
pen is selected into a device context, it can be used to draw lines
and curves. If dwPenStyle is PS_COSMETIC and PS_USERSTYLE, the
entries in the lpStyle array specify lengths of dashes and spaces in
style units. A style unit is defined by the device where the pen is
used to draw a line. If dwPenStyle is PS_GEOMETRIC and PS_USERSTYLE,
the entries in the lpStyle array specify lengths of dashes and spaces
in logical units. If dwPenStyle is PS_ALTERNATE, the style unit is
ignored and every other pixel is set. If the lbStyle member of the
LOGBRUSH structure pointed to by lplb is BS_PATTERN, the bitmap
pointed to by the lbHatch member of that structure cannot be a DIB
section. A DIB section is a bitmap created by CreateDIBSection. If
that bitmap is a DIB section, the ExtCreatePen function fails. When
an application no longer requires a specified pen, it should call the
DeleteObject function to delete the pen. ICM: No color management is
done at pen creation. However, color management is performed when the
pen is selected into an ICM-enabled device context.


%index
ExtCreateRegion
The ExtCreateRegion function creates a region from the specified region and transformation data.
%group
Win32 gdi32
%prm
lpx, nCount, lpData
lpx : [var] A pointer to an XFORM structure that defines the transformation to be performed on the region. If this pointer is NULL, the identity transformation is used.
nCount : [int] The number of bytes pointed to by lpRgnData.
lpData : [var] A pointer to a RGNDATA structure that contains the region data in logical units.
%inst
The ExtCreateRegion function creates a region from the specified
region and transformation data.

[戻り値]
If the function succeeds, the return value is the value of the
region. If the function fails, the return value is NULL.

[備考]
Region coordinates are represented as 27-bit signed integers. An
application can retrieve data for a region by calling the
GetRegionData function.


%index
ExtEscape
The ExtEscape function enables an application to access device capabilities that are not available through GDI.
%group
Win32 gdi32
%prm
hdc, iEscape, cjInput, lpInData, cjOutput, lpOutData
hdc : [intptr] A handle to the device context.
iEscape : [int] The escape function to be performed. It can be one of the following or it can be an application-defined escape function.
cjInput : [int] The number of bytes of data pointed to by the lpszInData parameter.
lpInData : [str] A pointer to the input structure required for the specified escape. See also Remarks.
cjOutput : [int] The number of bytes of data pointed to by the lpszOutData parameter.
lpOutData : [str] A pointer to the structure that receives output from this escape. This parameter must not be NULL if ExtEscape is called as a query function. If no data is to be returned in this structure, set cbOutput to 0. See also Remarks.
%inst
The ExtEscape function enables an application to access device
capabilities that are not available through GDI.

[戻り値]
The return value specifies the outcome of the function. It is greater
than zero if the function is successful, except for the
QUERYESCSUPPORT printer escape, which checks for implementation only.
The return value is zero if the escape is not implemented. A return
value less than zero indicates an error.

[備考]
Note This is a blocking or synchronous function and might not return
immediately. How quickly this function returns depends on run-time
factors such as network status, print server configuration, and
printer driver implementation?factors that are difficult to predict
when writing an application. Calling this function from a thread that
manages interaction with the user interface could make the
application appear to be unresponsive. Use this function to pass a
driver-defined escape value to a device. Use the Escape function to
pass one of the system-defined escape values to a device, unless the
escape is one of the defined escapes in nEscape. ExtEscape might not
work properly with the system-defined escapes. In particular, escapes
in which lpszInData is a pointer to a structure that contains a
member that is a pointer will fail. Note, that the behavior described
in this article is the expected behavior, but it is up to the driver
to comply with this model. The variables referenced by lpszInData and
lpszOutData should not be the same or overlap. If the input and the
output buffer size variables overlap, they may not contain the
correct values after the call returns. For the best results,
lpszInData and lpszOutData should refer to different variables. The
CHECKJPEGFORMAT printer escape function determines whether a printer
supports printing a JPEG image. Before using the CHECKJPEGFORMAT
printer escape function, call the QUERYESCSUPPORT printer escape
function to determine whether the driver supports CHECKJPEGFORMAT.
For sample code that demonstrates the use of CHECKJPEGFORMAT, see
Testing a Printer for JPEG or PNG Support. The CHECKPNGFORMAT printer
escape function determines whether a printer supports printing a PNG
image. Before using the CHECKJPEGFORMAT printer escape function, call
the QUERYESCSUPPORT printer escape function to determine whether the
driver supports CHECKJPEGFORMAT. For sample code, see Testing a
Printer for JPEG or PNG Support. The DRAWPATTERNRECT printer escape
creates a white, gray scale, or solid black rectangle by using the
pattern and rule capabilities of Page Control Language (PCL) on
Hewlett-Packard LaserJet or LaserJet-compatible printers. A gray
scale is a gray pattern that contains a specific mixture of black and
white pixels. An application should use the QUERYESCSUPPORT escape to
determine whether the printer is capable of drawing patterns and
rules before using the DRAWPATTERNRECT escape.
This doc was truncated.


%index
ExtFloodFill
The ExtFloodFill function fills an area of the display surface with the current brush.
%group
Win32 gdi32
%prm
hdc, x, y, color, type
hdc : [intptr] A handle to a device context.
x : [int] The x-coordinate, in logical units, of the point where filling is to start.
y : [int] The y-coordinate, in logical units, of the point where filling is to start.
color : [int] The color of the boundary or of the area to be filled. The interpretation of color depends on the value of the fuFillType parameter. To create a COLORREF color value, use the RGB macro.
type : [int] 
%inst
The ExtFloodFill function fills an area of the display surface with
the current brush.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero.

[備考]
The following are some of the reasons this function might fail:
This doc was truncated.


%index
ExtSelectClipRgn
The ExtSelectClipRgn function combines the specified region with the current clipping region using the specified mode.
%group
Win32 gdi32
%prm
hdc, hrgn, mode
hdc : [intptr] A handle to the device context.
hrgn : [intptr] A handle to the region to be selected. This handle must not be NULL unless the RGN_COPY mode is specified.
mode : [int] 
%inst
The ExtSelectClipRgn function combines the specified region with the
current clipping region using the specified mode.

[戻り値]
The return value specifies the new clipping region's complexity; it
can be one of the following values.
This doc was truncated.

[備考]
If an error occurs when this function is called, the previous
clipping region for the specified device context is not affected. The
ExtSelectClipRgn function assumes that the coordinates for the
specified region are specified in device units. Only a copy of the
region identified by the hrgn parameter is used. The region itself
can be reused after this call or it can be deleted.


%index
ExtTextOutW
The ExtTextOut function draws text using the currently selected font, background color, and text color. You can optionally provide dimensions to be used for clipping, opaquing, or both. (Unicode)
%group
Win32 gdi32
%prm
hdc, x, y, options, lprect, lpString, c, lpDx
hdc : [intptr] A handle to the device context.
x : [int] The x-coordinate, in logical coordinates, of the reference point used to position the string.
y : [int] The y-coordinate, in logical coordinates, of the reference point used to position the string.
options : [int] 
lprect : [var] A pointer to an optional RECT structure that specifies the dimensions, in logical coordinates, of a rectangle that is used for clipping, opaquing, or both.
lpString : [wstr] A pointer to a string that specifies the text to be drawn. The string does not need to be zero-terminated, since cbCount specifies the length of the string.
c : [int] The length of the string pointed to by lpString. This value may not exceed 8192.
lpDx : [var] A pointer to an optional array of values that indicate the distance between origins of adjacent character cells. For example, lpDx[i] logical units separate the origins of character cell i and character cell i + 1.
%inst
The ExtTextOut function draws text using the currently selected font,
background color, and text color. You can optionally provide
dimensions to be used for clipping, opaquing, or both. (Unicode)

[戻り値]
If the string is drawn, the return value is nonzero. However, if the
ANSI version of ExtTextOut is called with ETO_GLYPH_INDEX, the
function returns TRUE even though the function does nothing. If the
function fails, the return value is zero.

[備考]
The current text-alignment settings for the specified device context
determine how the reference point is used to position the text. The
text-alignment settings are retrieved by calling the GetTextAlign
function. The text-alignment settings are altered by calling the
SetTextAlign function. You can use the following values for text
alignment. Only one flag can be chosen from those that affect
horizontal and vertical alignment. In addition, only one of the two
flags that alter the current position can be chosen.
This doc was truncated.


%index
FONTOBJ_cGetAllGlyphHandles
The FONTOBJ_cGetAllGlyphHandles function allows the device driver to find every glyph handle of a GDI font.
%group
Win32 gdi32
%prm
pfo, phg
pfo : [var] Pointer to the FONTOBJ structure that is to be downloaded.
phg : [var] Pointer to a buffer large enough to hold all the glyph handles in the font. This parameter can be NULL.
%inst
The FONTOBJ_cGetAllGlyphHandles function allows the device driver to
find every glyph handle of a GDI font.

[戻り値]
The return value is the number of glyph handles supported by the
font.

[備考]
A driver uses this function to download an entire font. The driver
must provide a buffer large enough to contain the output. GDI copies
all glyph handles belonging to the associated font to this buffer.
The number of glyphs in the font can be determined by calling
FONTOBJ_vGetInfo, or by calling FONTOBJ_cGetAllGlyphHandles with the
phg parameter set to NULL.


%index
FONTOBJ_cGetGlyphs
The FONTOBJ_cGetGlyphs function is a service to the font consumer that translates glyph handles into pointers to glyph data, which are valid until the next call to FONTOBJ_cGetGlyphs.
%group
Win32 gdi32
%prm
pfo, iMode, cGlyph, phg, ppvGlyph
pfo : [var] Pointer to a FONTOBJ structure containing the glyph handles to be translated.
iMode : [int] 
cGlyph : [int] Specifies the number of glyphs to be translated. The only acceptable value is 1 (the code assumes 1, regardless of the value specified).
phg : [var] Pointer to an array of cGlyph HGLYPH structures supplied by the driver.
ppvGlyph : [var] Pointer to a memory location that receives the address of a GLYPHDATA structure. The first member of this structure is a GLYPHDEF union, which contains a pointer to either a GLYPHBITS structure or a PATHOBJ structure, depending on the value of the iMode parameter. If the value of iMode is FO_GLYPHBITS, (*ppvGlyph)->gdf contains the address of a GLYPHBITS structure. If the value of iMode is FO_PATHOBJ, (*ppvGlyph)->gdf contains the address of a PATHOBJ structure.
%inst
The FONTOBJ_cGetGlyphs function is a service to the font consumer
that translates glyph handles into pointers to glyph data, which are
valid until the next call to FONTOBJ_cGetGlyphs.

[戻り値]
The return value is the count of pointers passed to the driver if the
function is successful. Otherwise, it is zero, and an error code is
logged.

[備考]
This function should be used if the driver is caching fonts.


%index
FONTOBJ_pQueryGlyphAttrs
The FONTOBJ_pQueryGlyphAttrs function returns information about a font's glyphs.
%group
Win32 gdi32
%prm
pfo, iMode
pfo : [var] Is a caller-supplied pointer to a FONTOBJ structure identifying the font for which attributes are being requested.
iMode : [int] Is a caller-supplied flag indicating the type of glyph attribute being requested. The following flag is defined:
%inst
The FONTOBJ_pQueryGlyphAttrs function returns information about a
font's glyphs.

[戻り値]
FONTOBJ_pQueryGlyphAttrs returns a pointer to an FD_GLYPHATTR
structure. If an error is encountered, such as an invalid input
argument, or if the font described by the FONTOBJ structure is not a
vertical font, the function returns NULL.

[備考]
Currently, the only attribute flag defined is FO_ATTR_MODE_ROTATE.
This flag is meant for use by printer drivers that support printers
with built-in font rasterizers. The driver can call the
FONTOBJ_pQueryGlyphAttrs function, specifying the FO_ATTR_MODE_ROTATE
flag, to determine which glyphs within a vertical font must be
rotated. Vertical fonts have a font name that starts with the "@"
character. To determine if the current font is a vertical font, the
driver can check for the FO_VERT_FACE flag in the flFontType member
of the font's FONTOBJ structure. Rotation information is returned in
the FD_GLYPHATTR structure that is used as the function's return
value. The FONTOBJ_pQueryGlyphAttrs function is supplied by GDI. When
a printer driver calls FONTOBJ_pQueryGlyphAttrs, GDI calls the
appropriate font driver's DrvQueryGlyphAttrs function to obtain the
requested information.


%index
FONTOBJ_pfdg
The FONTOBJ_pfdg function retrieves the pointer to the FD_GLYPHSET structure associated with the specified font.
%group
Win32 gdi32
%prm
pfo
pfo : [var] Pointer to the FONTOBJ structure for which the associated FD_GLYPHSET structure is to be returned.
%inst
The FONTOBJ_pfdg function retrieves the pointer to the FD_GLYPHSET
structure associated with the specified font.

[戻り値]
FONTOBJ_pfdg returns a pointer to the FD_GLYPHSET structure
associated with the specified font.

[備考]
Printer drivers can call FONTOBJ_pfdg to determine which Unicode code
points are supported in a GDI font. The printer driver can then
determine whether it can optimize performance by instead using a
similar printer-resident font to display a text string.


%index
FONTOBJ_pvTrueTypeFontFile
The FONTOBJ_pvTrueTypeFontFile function retrieves a user-mode pointer to a view of a TrueType, OpenType, or Type1 font file.
%group
Win32 gdi32
%prm
pfo, pcjFile
pfo : [var] Pointer to the FONTOBJ structure with which the TrueType, PostScript OpenType, or PostScript Type1 font is associated.
pcjFile : [var] Pointer to a location in which GDI returns the size, in bytes, of the view of the font file.
%inst
The FONTOBJ_pvTrueTypeFontFile function retrieves a user-mode pointer
to a view of a TrueType, OpenType, or Type1 font file.

[戻り値]
FONTOBJ_pvTrueTypeFontFile returns a pointer to a user-mode view of a
font file upon success. If the FONTOBJ structure identifies a Type1
font, the return value is a pointer to the memory-mapped image of the
pfb file. Otherwise, this function returns NULL.

[備考]
FONTOBJ_pvTrueTypeFontFile should be called only for TrueType,
OpenType, or Type1 fonts. The pointer returned by
FONTOBJ_pvTrueTypeFontFile is valid only within the scope of the
calling DrvTextOut function. That is, the driver should not assume
that the pointer returned by this function is valid upon exiting
DrvTextOut and returning control to GDI.


%index
FONTOBJ_pxoGetXform
The FONTOBJ_pxoGetXform function retrieves the notional-to-device transform for the specified font.
%group
Win32 gdi32
%prm
pfo
pfo : [var] Pointer to the FONTOBJ structure for which the transform is to be retrieved.
%inst
The FONTOBJ_pxoGetXform function retrieves the notional-to-device
transform for the specified font.

[戻り値]
The return value is a pointer to an XFORMOBJ structure that describes
the transform. The XFORMOBJ structure can be used by the XFORMOBJ_Xxx
service routines. The XFORMOBJ structure assumes that:
This doc was truncated.

[備考]
The driver needs the notional-to-device transform to realize a
driver-supplied font.


%index
FONTOBJ_vGetInfo
The FONTOBJ_vGetInfo function retrieves information about an associated font.
%group
Win32 gdi32
%prm
pfo, cjSize, pfi
pfo : [var] Pointer to the FONTOBJ structure to be queried.
cjSize : [int] Specifies the size in bytes of the buffer pointed to by pfi.
pfi : [var] Pointer to a buffer previously allocated by the driver. GDI writes a FONTINFO structure to this buffer.
%inst
The FONTOBJ_vGetInfo function retrieves information about an
associated font.


%index
FillPath
The FillPath function closes any open figures in the current path and fills the path's interior by using the current brush and polygon-filling mode.
%group
Win32 gdi32
%prm
hdc
hdc : [intptr] A handle to a device context that contains a valid path.
%inst
The FillPath function closes any open figures in the current path and
fills the path's interior by using the current brush and
polygon-filling mode.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero.

[備考]
After its interior is filled, the path is discarded from the DC
identified by the hdc parameter.


%index
FillRgn
The FillRgn function fills a region by using the specified brush.
%group
Win32 gdi32
%prm
hdc, hrgn, hbr
hdc : [intptr] Handle to the device context.
hrgn : [intptr] Handle to the region to be filled. The region's coordinates are presumed to be in logical units.
hbr : [intptr] Handle to the brush to be used to fill the region.
%inst
The FillRgn function fills a region by using the specified brush.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero.


%index
FixBrushOrgEx
(no summary)
%group
Win32 gdi32
%prm
hdc, x, y, ptl
hdc : [intptr] 
x : [int] 
y : [int] 
ptl : [var] 
%inst



%index
FlattenPath
The FlattenPath function transforms any curves in the path that is selected into the current device context (DC), turning each curve into a sequence of lines.
%group
Win32 gdi32
%prm
hdc
hdc : [intptr] A handle to a DC that contains a valid path.
%inst
The FlattenPath function transforms any curves in the path that is
selected into the current device context (DC), turning each curve
into a sequence of lines.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero.


%index
FloodFill
The FloodFill function fills an area of the display surface with the current brush. The area is assumed to be bounded as specified by the color parameter.
%group
Win32 gdi32
%prm
hdc, x, y, color
hdc : [intptr] A handle to a device context.
x : [int] The x-coordinate, in logical units, of the point where filling is to start.
y : [int] The y-coordinate, in logical units, of the point where filling is to start.
color : [int] The color of the boundary or the area to be filled. To create a COLORREF color value, use the RGB macro.
%inst
The FloodFill function fills an area of the display surface with the
current brush. The area is assumed to be bounded as specified by the
color parameter.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero.

[備考]
The following are reasons this function might fail:
This doc was truncated.


%index
FrameRgn
The FrameRgn function draws a border around the specified region by using the specified brush.
%group
Win32 gdi32
%prm
hdc, hrgn, hbr, w, h
hdc : [intptr] Handle to the device context.
hrgn : [intptr] Handle to the region to be enclosed in a border. The region's coordinates are presumed to be in logical units.
hbr : [intptr] Handle to the brush to be used to draw the border.
w : [int] Specifies the width, in logical units, of vertical brush strokes.
h : [int] Specifies the height, in logical units, of horizontal brush strokes.
%inst
The FrameRgn function draws a border around the specified region by
using the specified brush.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero.


%index
GdiAlphaBlend
The GdiAlphaBlend function displays bitmaps that have transparent or semitransparent pixels.
%group
Win32 gdi32
%prm
hdcDest, xoriginDest, yoriginDest, wDest, hDest, hdcSrc, xoriginSrc, yoriginSrc, wSrc, hSrc, ftn
hdcDest : [intptr] A handle to the destination device context.
xoriginDest : [int] The x-coordinate, in logical units, of the upper-left corner of the destination rectangle.
yoriginDest : [int] The y-coordinate, in logical units, of the upper-left corner of the destination rectangle.
wDest : [int] The width, in logical units, of the destination rectangle.
hDest : [int] The height, in logical units, of the destination rectangle.
hdcSrc : [intptr] A handle to the source device context.
xoriginSrc : [int] The x-coordinate, in logical units, of the upper-left corner of the source rectangle.
yoriginSrc : [int] The y-coordinate, in logical units, of the upper-left corner of the source rectangle.
wSrc : [int] The width, in logical units, of the source rectangle.
hSrc : [int] The height, in logical units, of the source rectangle.
ftn : [var] The alpha-blending function for source and destination bitmaps, a global alpha value to be applied to the entire source bitmap, and format information for the source bitmap. The source and destination blend functions are currently limited to AC_SRC_OVER. See the BLENDFUNCTION and EMRALPHABLEND structures.
%inst
The GdiAlphaBlend function displays bitmaps that have transparent or
semitransparent pixels.

[戻り値]
If the function succeeds, the return value is TRUE. If the function
fails, the return value is FALSE. This function can return the
following value.
This doc was truncated.

[備考]
Note This function is the same as AlphaBlend. If the source rectangle
and destination rectangle are not the same size, the source bitmap is
stretched to match the destination rectangle. If the
SetStretchBltMode function is used, the iStretchMode value is
automatically converted to COLORONCOLOR for this function (that is,
BLACKONWHITE, WHITEONBLACK, and HALFTONE are changed to
COLORONCOLOR). The destination coordinates are transformed by using
the transformation currently specified for the destination device
context. The source coordinates are transformed by using the
transformation currently specified for the source device context. An
error occurs (and the function returns FALSE) if the source device
context identifies an enhanced metafile device context. If
destination and source bitmaps do not have the same color format,
GdiAlphaBlend converts the source bitmap to match the destination
bitmap. GdiAlphaBlend does not support mirroring. If either the width
or height of the source or destination is negative, this call will
fail. When rendering to a printer, first call GetDeviceCaps with
SHADEBLENDCAPS to determine if the printer supports blending with
GdiAlphaBlend. Note that, for a display DC, all blending operations
are supported and these flags represent whether the operations are
accelerated. If the source and destination are the same surface, that
is, they are both the screen or the same memory bitmap and the source
and destination rectangles overlap, an error occurs and the function
returns FALSE. The source rectangle must lie completely within the
source surface, otherwise an error occurs and the function returns
FALSE. GdiAlphaBlend fails if the width or height of the source or
destination is negative. The SourceConstantAlpha member of
BLENDFUNCTION specifies an alpha transparency value to be used on the
entire source bitmap. The SourceConstantAlpha value is combined with
any per-pixel alpha values. If SourceConstantAlpha is 0, it is
assumed that the image is transparent. Set the SourceConstantAlpha
value to 255 (which indicates that the image is opaque) when you only
want to use per-pixel alpha values.


%index
GdiComment
The GdiComment function copies a comment from a buffer into a specified enhanced-format metafile.
%group
Win32 gdi32
%prm
hdc, nSize, lpData
hdc : [intptr] A handle to an enhanced-metafile device context.
nSize : [int] The length of the comment buffer, in bytes.
lpData : [var] A pointer to the buffer that contains the comment.
%inst
The GdiComment function copies a comment from a buffer into a
specified enhanced-format metafile.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero.

[備考]
A comment can include any kind of private information, for example,
the source of a picture and the date it was created. A comment should
begin with an application signature, followed by the data. Comments
should not contain application-specific or position-specific data.
Position-specific data specifies the location of a record, and it
should not be included because one metafile may be embedded within
another metafile. A public comment is a comment that begins with the
comment signature identifier GDICOMMENT_IDENTIFIER. The following
public comments are defined.
This doc was truncated.


%index
GdiDeleteSpoolFileHandle
(no summary)
%group
Win32 gdi32
%prm
SpoolFileHandle
SpoolFileHandle : [intptr] 
%inst



%index
GdiEndDocEMF
(no summary)
%group
Win32 gdi32
%prm
SpoolFileHandle
SpoolFileHandle : [intptr] 
%inst



%index
GdiEndPageEMF
(no summary)
%group
Win32 gdi32
%prm
SpoolFileHandle, dwOptimization
SpoolFileHandle : [intptr] 
dwOptimization : [int] 
%inst



%index
GdiFlush
The GdiFlush function flushes the calling thread's current batch.
%group
Win32 gdi32
%prm

%inst
The GdiFlush function flushes the calling thread's current batch.

[戻り値]
If all functions in the current batch succeed, the return value is
nonzero. If not all functions in the current batch succeed, the
return value is zero, indicating that at least one function returned
an error.

[備考]
Batching enhances drawing performance by minimizing the amount of
time needed to call GDI drawing functions that return Boolean values.
The system accumulates the parameters for calls to these functions in
the current batch and then calls the functions when the batch is
flushed by any of the following means:
This doc was truncated.


%index
GdiGetBatchLimit
The GdiGetBatchLimit function returns the maximum number of function calls that can be accumulated in the calling thread's current batch. The system flushes the current batch whenever this limit is exceeded.
%group
Win32 gdi32
%prm

%inst
The GdiGetBatchLimit function returns the maximum number of function
calls that can be accumulated in the calling thread's current batch.
The system flushes the current batch whenever this limit is exceeded.

[戻り値]
If the function succeeds, the return value is the batch limit. If the
function fails, the return value is zero.

[備考]
The batch limit is set by using the GdiSetBatchLimit function.
Setting the limit to 1 effectively disables batching. Only GDI
drawing functions that return Boolean values can be batched; calls to
any other GDI functions immediately flush the current batch.
Exceeding the batch limit or calling the GdiFlush function also
flushes the current batch. When the system batches a function call,
the function returns TRUE. The actual return value for the function
is reported only if GdiFlush is used to flush the batch. Note The
batch limit is maintained for each thread separately. In order to
completely disable batching, call GdiSetBatchLimit (1) during the
initialization of each thread.


%index
GdiGetDC
(no summary)
%group
Win32 gdi32
%prm
SpoolFileHandle
SpoolFileHandle : [intptr] 
%inst



%index
GdiGetDevmodeForPage
(no summary)
%group
Win32 gdi32
%prm
SpoolFileHandle, dwPageNumber, pCurrDM, pLastDM
SpoolFileHandle : [intptr] 
dwPageNumber : [int] 
pCurrDM : [var] 
pLastDM : [var] 
%inst



%index
GdiGetPageCount
(no summary)
%group
Win32 gdi32
%prm
SpoolFileHandle
SpoolFileHandle : [intptr] 
%inst



%index
GdiGetPageHandle
(no summary)
%group
Win32 gdi32
%prm
SpoolFileHandle, Page, pdwPageType
SpoolFileHandle : [intptr] 
Page : [int] 
pdwPageType : [var] 
%inst



%index
GdiGetSpoolFileHandle
(no summary)
%group
Win32 gdi32
%prm
pwszPrinterName, pDevmode, pwszDocName
pwszPrinterName : [wstr] 
pDevmode : [var] 
pwszDocName : [wstr] 
%inst



%index
GdiGradientFill
The GdiGradientFill function fills rectangle and triangle structures.
%group
Win32 gdi32
%prm
hdc, pVertex, nVertex, pMesh, nCount, ulMode
hdc : [intptr] A handle to the destination device context.
pVertex : [var] A pointer to an array of TRIVERTEX structures that each define a triangle vertex.
nVertex : [int] The number of vertices in pVertex.
pMesh : [intptr] An array of GRADIENT_TRIANGLE structures in triangle mode, or an array of GRADIENT_RECT structures in rectangle mode.
nCount : [int] The number of elements (triangles or rectangles) in pMesh.
ulMode : [int] 
%inst
The GdiGradientFill function fills rectangle and triangle structures.

[戻り値]
If the function succeeds, the return value is TRUE. If the function
fails, the return value is FALSE.

[備考]
Note This function is the same as GradientFill. To add smooth shading
to a triangle, call the GdiGradientFill function with the three
triangle endpoints. GDI will linearly interpolate and fill the
triangle. Here is the drawing output of a shaded triangle.
This doc was truncated.


%index
GdiPlayPageEMF
(no summary)
%group
Win32 gdi32
%prm
SpoolFileHandle, hemf, prectDocument, prectBorder, prectClip
SpoolFileHandle : [intptr] 
hemf : [intptr] 
prectDocument : [var] 
prectBorder : [var] 
prectClip : [var] 
%inst



%index
GdiResetDCEMF
(no summary)
%group
Win32 gdi32
%prm
SpoolFileHandle, pCurrDM
SpoolFileHandle : [intptr] 
pCurrDM : [var] 
%inst



%index
GdiSetBatchLimit
The GdiSetBatchLimit function sets the maximum number of function calls that can be accumulated in the calling thread's current batch. The system flushes the current batch whenever this limit is exceeded.
%group
Win32 gdi32
%prm
dw
dw : [int] Specifies the batch limit to be set. A value of 0 sets the default limit. A value of 1 disables batching.
%inst
The GdiSetBatchLimit function sets the maximum number of function
calls that can be accumulated in the calling thread's current batch.
The system flushes the current batch whenever this limit is exceeded.

[戻り値]
If the function succeeds, the return value is the previous batch
limit. If the function fails, the return value is zero.

[備考]
Only GDI drawing functions that return Boolean values can be
accumulated in the current batch; calls to any other GDI functions
immediately flush the current batch. Exceeding the batch limit or
calling the GdiFlush function also flushes the current batch. When
the system accumulates a function call, the function returns TRUE to
indicate it is in the batch. When the system flushes the current
batch and executes the function for the second time, the return value
is either TRUE or FALSE, depending on whether the function succeeds.
This second return value is reported only if GdiFlush is used to
flush the batch. Note The batch limit is maintained for each thread
separately. In order to completely disable batching, call
GdiSetBatchLimit (1) during the initialization of each thread.


%index
GdiStartDocEMF
(no summary)
%group
Win32 gdi32
%prm
SpoolFileHandle, pDocInfo
SpoolFileHandle : [intptr] 
pDocInfo : [var] 
%inst



%index
GdiStartPageEMF
(no summary)
%group
Win32 gdi32
%prm
SpoolFileHandle
SpoolFileHandle : [intptr] 
%inst



%index
GdiTransparentBlt
The GdiTransparentBlt function performs a bit-block transfer of the color data corresponding to a rectangle of pixels from the specified source device context into a destination device context.
%group
Win32 gdi32
%prm
hdcDest, xoriginDest, yoriginDest, wDest, hDest, hdcSrc, xoriginSrc, yoriginSrc, wSrc, hSrc, crTransparent
hdcDest : [intptr] A handle to the destination device context.
xoriginDest : [int] The x-coordinate, in logical units, of the upper-left corner of the destination rectangle.
yoriginDest : [int] The y-coordinate, in logical units, of the upper-left corner of the destination rectangle.
wDest : [int] The width, in logical units, of the destination rectangle.
hDest : [int] The height, in logical units, of the destination rectangle.
hdcSrc : [intptr] A handle to the source device context.
xoriginSrc : [int] The x-coordinate, in logical units, of the source rectangle.
yoriginSrc : [int] The y-coordinate, in logical units, of the source rectangle.
wSrc : [int] The width, in logical units, of the source rectangle.
hSrc : [int] The height, in logical units, of the source rectangle.
crTransparent : [int] The RGB color in the source bitmap to treat as transparent.
%inst
The GdiTransparentBlt function performs a bit-block transfer of the
color data corresponding to a rectangle of pixels from the specified
source device context into a destination device context.

[戻り値]
If the function succeeds, the return value is TRUE. If the function
fails, the return value is FALSE.

[備考]
The GdiTransparentBlt function works with compatible bitmaps (DDBs).
The GdiTransparentBlt function supports all formats of source
bitmaps. However, for 32 bpp bitmaps, it just copies the alpha value
over. Use AlphaBlend to specify 32 bits-per-pixel bitmaps with
transparency. If the source and destination rectangles are not the
same size, the source bitmap is stretched to match the destination
rectangle. When the SetStretchBltMode function is used, the
iStretchMode modes of BLACKONWHITE and WHITEONBLACK are converted to
COLORONCOLOR for the GdiTransparentBlt function. The destination
device context specifies the transformation type for the destination
coordinates. The source device context specifies the transformation
type for the source coordinates. GdiTransparentBlt does not mirror a
bitmap if either the width or height, of either the source or
destination, is negative. When used in a multiple monitor system,
both hdcSrc and hdcDest must refer to the same device or the function
will fail. To transfer data between DCs for different devices,
convert the memory bitmap to a DIB by calling GetDIBits. To display
the DIB to the second device, call SetDIBits or StretchDIBits.


%index
GetArcDirection
The GetArcDirection function retrieves the current arc direction for the specified device context. Arc and rectangle functions use the arc direction.
%group
Win32 gdi32
%prm
hdc
hdc : [intptr] Handle to the device context.
%inst
The GetArcDirection function retrieves the current arc direction for
the specified device context. Arc and rectangle functions use the arc
direction.

[戻り値]
The return value specifies the current arc direction; it can be any
one of the following values:
This doc was truncated.


%index
GetAspectRatioFilterEx
The GetAspectRatioFilterEx function retrieves the setting for the current aspect-ratio filter.
%group
Win32 gdi32
%prm
hdc, lpsize
hdc : [intptr] Handle to a device context.
lpsize : [var] Pointer to a SIZE structure that receives the current aspect-ratio filter.
%inst
The GetAspectRatioFilterEx function retrieves the setting for the
current aspect-ratio filter.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero.

[備考]
The aspect ratio is the ratio formed by the width and height of a
pixel on a specified device. The system provides a special filter,
the aspect-ratio filter, to select fonts that were designed for a
particular device. An application can specify that the system should
only retrieve fonts matching the specified aspect ratio by calling
the SetMapperFlags function.


%index
GetBitmapBits
The GetBitmapBits function copies the bitmap bits of a specified device-dependent bitmap into a buffer.
%group
Win32 gdi32
%prm
hbit, cb, lpvBits
hbit : [intptr] A handle to the device-dependent bitmap.
cb : [int] The number of bytes to copy from the bitmap into the buffer.
lpvBits : [intptr] A pointer to a buffer to receive the bitmap bits. The bits are stored as an array of byte values.
%inst
The GetBitmapBits function copies the bitmap bits of a specified
device-dependent bitmap into a buffer.

[戻り値]
If the function succeeds, the return value is the number of bytes
copied to the buffer. If the function fails, the return value is
zero.


%index
GetBitmapDimensionEx
The GetBitmapDimensionEx function retrieves the dimensions of a compatible bitmap. The retrieved dimensions must have been set by the SetBitmapDimensionEx function.
%group
Win32 gdi32
%prm
hbit, lpsize
hbit : [intptr] A handle to a compatible bitmap (DDB).
lpsize : [var] A pointer to a SIZE structure to receive the bitmap dimensions. For more information, see Remarks.
%inst
The GetBitmapDimensionEx function retrieves the dimensions of a
compatible bitmap. The retrieved dimensions must have been set by the
SetBitmapDimensionEx function.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero.

[備考]
The function returns a data structure that contains fields for the
height and width of the bitmap, in .01-mm units. If those dimensions
have not yet been set, the structure that is returned will have zeros
in those fields.


%index
GetBkColor
The GetBkColor function returns the current background color for the specified device context.
%group
Win32 gdi32
%prm
hdc
hdc : [intptr] Handle to the device context whose background color is to be returned.
%inst
The GetBkColor function returns the current background color for the
specified device context.

[戻り値]
If the function succeeds, the return value is a COLORREF value for
the current background color. If the function fails, the return value
is CLR_INVALID.


%index
GetBkMode
The GetBkMode function returns the current background mix mode for a specified device context. The background mix mode of a device context affects text, hatched brushes, and pen styles that are not solid lines.
%group
Win32 gdi32
%prm
hdc
hdc : [intptr] Handle to the device context whose background mode is to be returned.
%inst
The GetBkMode function returns the current background mix mode for a
specified device context. The background mix mode of a device context
affects text, hatched brushes, and pen styles that are not solid
lines.

[戻り値]
If the function succeeds, the return value specifies the current
background mix mode, either OPAQUE or TRANSPARENT. If the function
fails, the return value is zero.


%index
GetBoundsRect
The GetBoundsRect function obtains the current accumulated bounding rectangle for a specified device context.
%group
Win32 gdi32
%prm
hdc, lprect, flags
hdc : [intptr] A handle to the device context whose bounding rectangle the function will return.
lprect : [var] A pointer to the RECT structure that will receive the current bounding rectangle. The application's rectangle is returned in logical coordinates, and the bounding rectangle is returned in screen coordinates.
flags : [int] Specifies how the GetBoundsRect function will behave. This parameter can be the following value.
%inst
The GetBoundsRect function obtains the current accumulated bounding
rectangle for a specified device context.

[戻り値]
The return value specifies the state of the accumulated bounding
rectangle; it can be one of the following values.
This doc was truncated.

[備考]
The DCB_SET value is a combination of the bit values DCB_ACCUMULATE
and DCB_RESET. Applications that check the DCB_RESET bit to determine
whether the bounding rectangle is empty must also check the
DCB_ACCUMULATE bit. The bounding rectangle is empty only if the
DCB_RESET bit is 1 and the DCB_ACCUMULATE bit is 0.


%index
GetBrushOrgEx
The GetBrushOrgEx function retrieves the current brush origin for the specified device context. This function replaces the GetBrushOrg function.
%group
Win32 gdi32
%prm
hdc, lppt
hdc : [intptr] A handle to the device context.
lppt : [var] A pointer to a POINT structure that receives the brush origin, in device coordinates.
%inst
The GetBrushOrgEx function retrieves the current brush origin for the
specified device context. This function replaces the GetBrushOrg
function.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero.

[備考]
A brush is a bitmap that the system uses to paint the interiors of
filled shapes. The brush origin is a set of coordinates with values
between 0 and 7, specifying the location of one pixel in the bitmap.
The default brush origin coordinates are (0,0). For horizontal
coordinates, the value 0 corresponds to the leftmost column of
pixels; the value 7 corresponds to the rightmost column. For vertical
coordinates, the value 0 corresponds to the uppermost row of pixels;
the value 7 corresponds to the lowermost row. When the system
positions the brush at the start of any painting operation, it maps
the origin of the brush to the location in the window's client area
specified by the brush origin. For example, if the origin is set to
(2,3), the system maps the origin of the brush (0,0) to the location
(2,3) on the window's client area. If an application uses a brush to
fill the backgrounds of both a parent and a child window with
matching colors, it may be necessary to set the brush origin after
painting the parent window but before painting the child window. The
system automatically tracks the origin of all window-managed device
contexts and adjusts their brushes as necessary to maintain an
alignment of patterns on the surface.


%index
GetCharABCWidthsW
The GetCharABCWidths function retrieves the widths, in logical units, of consecutive characters in a specified range from the current TrueType font. This function succeeds only with TrueType fonts. (Unicode)
%group
Win32 gdi32
%prm
hdc, wFirst, wLast, lpABC
hdc : [intptr] A handle to the device context.
wFirst : [int] The first character in the group of consecutive characters from the current font.
wLast : [int] The last character in the group of consecutive characters from the current font.
lpABC : [var] A pointer to an array of ABC structures that receives the character widths, in logical units. This array must contain at least as many ABC structures as there are characters in the range specified by the uFirstChar and uLastChar parameters.
%inst
The GetCharABCWidths function retrieves the widths, in logical units,
of consecutive characters in a specified range from the current
TrueType font. This function succeeds only with TrueType fonts.
(Unicode)

[戻り値]
If the function succeeds, the return value is nonzero If the function
fails, the return value is zero.

[備考]
The TrueType rasterizer provides ABC character spacing after a
specific point size has been selected. A spacing is the distance
added to the current position before placing the glyph. B spacing is
the width of the black part of the glyph. C spacing is the distance
added to the current position to provide white space to the right of
the glyph. The total advanced width is specified by A+B+C. When the
GetCharABCWidths function retrieves negative A or C widths for a
character, that character includes underhangs or overhangs. To
convert the ABC widths to font design units, an application should
use the value stored in the otmEMSquare member of a OUTLINETEXTMETRIC
structure. This value can be retrieved by calling the
GetOutlineTextMetrics function. The ABC widths of the default
character are used for characters outside the range of the currently
selected font. To retrieve the widths of characters in non-TrueType
fonts, applications should use the GetCharWidth function.
> [!NOTE] > The wingdi.h header defines GetCharABCWidths as an alias
which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
GetCharABCWidthsFloatW
The GetCharABCWidthsFloat function retrieves the widths, in logical units, of consecutive characters in a specified range from the current font. (Unicode)
%group
Win32 gdi32
%prm
hdc, iFirst, iLast, lpABC
hdc : [intptr] Handle to the device context.
iFirst : [int] Specifies the code point of the first character in the group of consecutive characters where the ABC widths are seeked.
iLast : [int] Specifies the code point of the last character in the group of consecutive characters where the ABC widths are seeked. This range is inclusive. An error is returned if the specified last character precedes the specified first character.
lpABC : [var] Pointer to an array of ABCFLOAT structures that receives the character widths, in logical units.
%inst
The GetCharABCWidthsFloat function retrieves the widths, in logical
units, of consecutive characters in a specified range from the
current font. (Unicode)

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero.

[備考]
Unlike the GetCharABCWidths function that returns widths only for
TrueType fonts, the GetCharABCWidthsFloat function retrieves widths
for any font. The widths returned by this function are in the IEEE
floating-point format. If the current world-to-device transformation
is not identified, the returned widths may be noninteger values, even
if the corresponding values in the device space are integers. A
spacing is the distance added to the current position before placing
the glyph. B spacing is the width of the black part of the glyph. C
spacing is the distance added to the current position to provide
white space to the right of the glyph. The total advanced width is
specified by A+B+C. The ABC spaces are measured along the character
base line of the selected font. The ABC widths of the default
character are used for characters outside the range of the currently
selected font.
> [!NOTE] > The wingdi.h header defines GetCharABCWidthsFloat as an
alias which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
GetCharABCWidthsI
The GetCharABCWidthsI function retrieves the widths, in logical units, of consecutive glyph indices in a specified range from the current TrueType font. This function succeeds only with TrueType fonts.
%group
Win32 gdi32
%prm
hdc, giFirst, cgi, pgi, pabc
hdc : [intptr] A handle to the device context.
giFirst : [int] The first glyph index in the group of consecutive glyph indices from the current font. This parameter is only used if the pgi parameter is NULL.
cgi : [int] The number of glyph indices.
pgi : [var] A pointer to an array that contains glyph indices. If this parameter is NULL, the giFirst parameter is used instead. The cgi parameter specifies the number of glyph indices in this array.
pabc : [var] A pointer to an array of ABC structures that receives the character widths, in logical units. This array must contain at least as many ABC structures as there are glyph indices specified by the cgi parameter.
%inst
The GetCharABCWidthsI function retrieves the widths, in logical
units, of consecutive glyph indices in a specified range from the
current TrueType font. This function succeeds only with TrueType
fonts.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero.

[備考]
The TrueType rasterizer provides ABC character spacing after a
specific point size has been selected. A spacing is the distance
added to the current position before placing the glyph. B spacing is
the width of the black part of the glyph. C spacing is the distance
added to the current position to provide white space to the right of
the glyph. The total advanced width is specified by A+B+C. When the
GetCharABCWidthsI function retrieves negative A or C widths for a
character, that character includes underhangs or overhangs. To
convert the ABC widths to font design units, an application should
use the value stored in the otmEMSquare member of a OUTLINETEXTMETRIC
structure. This value can be retrieved by calling the
GetOutlineTextMetrics function. The ABC widths of the default
character are used for characters outside the range of the currently
selected font. To retrieve the widths of glyph indices in
non-TrueType fonts, applications should use the GetCharWidthI
function.


%index
GetCharWidthW
The GetCharWidth function retrieves the widths, in logical coordinates, of consecutive characters in a specified range from the current font. (Unicode)
%group
Win32 gdi32
%prm
hdc, iFirst, iLast, lpBuffer
hdc : [intptr] A handle to the device context.
iFirst : [int] The first character in the group of consecutive characters.
iLast : [int] The last character in the group of consecutive characters, which must not precede the specified first character.
lpBuffer : [var] A pointer to a buffer that receives the character widths, in logical coordinates.
%inst
The GetCharWidth function retrieves the widths, in logical
coordinates, of consecutive characters in a specified range from the
current font. (Unicode)

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero.

[備考]
GetCharWidth cannot be used on TrueType fonts. To retrieve character
widths for TrueType fonts, use GetCharABCWidths. The range is
inclusive; that is, the returned widths include the widths of the
characters specified by the iFirstChar and iLastChar parameters. If a
character does not exist in the current font, it is assigned the
width of the default character.
> [!NOTE] > The wingdi.h header defines GetCharWidth as an alias
which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
GetCharWidth32A
The GetCharWidth32 function retrieves the widths, in logical coordinates, of consecutive characters in a specified range from the current font. (ANSI)
%group
Win32 gdi32
%prm
hdc, iFirst, iLast, lpBuffer
hdc : [intptr] A handle to the device context.
iFirst : [int] The first character in the group of consecutive characters.
iLast : [int] The last character in the group of consecutive characters, which must not precede the specified first character.
lpBuffer : [var] A pointer to a buffer that receives the character widths, in logical coordinates.
%inst
The GetCharWidth32 function retrieves the widths, in logical
coordinates, of consecutive characters in a specified range from the
current font. (ANSI)

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero.

[備考]
GetCharWidth32 cannot be used on TrueType fonts. To retrieve
character widths for TrueType fonts, use GetCharABCWidths. The range
is inclusive; that is, the returned widths include the widths of the
characters specified by the iFirstChar and iLastChar parameters. If a
character does not exist in the current font, it is assigned the
width of the default character.


%index
GetCharWidth32W
The GetCharWidth32 function retrieves the widths, in logical coordinates, of consecutive characters in a specified range from the current font. (Unicode)
%group
Win32 gdi32
%prm
hdc, iFirst, iLast, lpBuffer
hdc : [intptr] A handle to the device context.
iFirst : [int] The first character in the group of consecutive characters.
iLast : [int] The last character in the group of consecutive characters, which must not precede the specified first character.
lpBuffer : [var] A pointer to a buffer that receives the character widths, in logical coordinates.
%inst
The GetCharWidth32 function retrieves the widths, in logical
coordinates, of consecutive characters in a specified range from the
current font. (Unicode)

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero.

[備考]
GetCharWidth32 cannot be used on TrueType fonts. To retrieve
character widths for TrueType fonts, use GetCharABCWidths. The range
is inclusive; that is, the returned widths include the widths of the
characters specified by the iFirstChar and iLastChar parameters. If a
character does not exist in the current font, it is assigned the
width of the default character.


%index
GetCharWidthFloatW
The GetCharWidthFloat function retrieves the fractional widths of consecutive characters in a specified range from the current font. (Unicode)
%group
Win32 gdi32
%prm
hdc, iFirst, iLast, lpBuffer
hdc : [intptr] A handle to the device context.
iFirst : [int] The code point of the first character in the group of consecutive characters.
iLast : [int] The code point of the last character in the group of consecutive characters.
lpBuffer : [var] A pointer to a buffer that receives the character widths, in logical units.
%inst
The GetCharWidthFloat function retrieves the fractional widths of
consecutive characters in a specified range from the current font.
(Unicode)

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero.

[備考]
The returned widths are in the 32-bit IEEE floating-point format.
(The widths are measured along the base line of the characters.) If
the iFirstChar parameter specifies the letter a and the iLastChar
parameter specifies the letter z, GetCharWidthFloat retrieves the
widths of all lowercase characters. If a character does not exist in
the current font, it is assigned the width of the default character.
> [!NOTE] > The wingdi.h header defines GetCharWidthFloat as an alias
which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
GetCharWidthI
The GetCharWidthI function retrieves the widths, in logical coordinates, of consecutive glyph indices in a specified range from the current font.
%group
Win32 gdi32
%prm
hdc, giFirst, cgi, pgi, piWidths
hdc : [intptr] A handle to the device context.
giFirst : [int] The first glyph index in the group of consecutive glyph indices.
cgi : [int] The number of glyph indices.
pgi : [var] A pointer to an array of glyph indices. If this parameter is not NULL, it is used instead of the giFirst parameter.
piWidths : [var] A pointer to a buffer that receives the widths, in logical coordinates.
%inst
The GetCharWidthI function retrieves the widths, in logical
coordinates, of consecutive glyph indices in a specified range from
the current font.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero.

[備考]
The GetCharWidthI function processes a consecutive glyph indices if
the pgi parameter is NULL with the giFirst parameter indicating the
first glyph index to process and the cgi parameter indicating how
many glyph indices to process. Otherwise the GetCharWidthI function
processes the array of glyph indices pointed to by the pgi parameter
with the cgi parameter indicating how many glyph indices to process.
If a character does not exist in the current font, it is assigned the
width of the default character.


%index
GetCharacterPlacementW
The GetCharacterPlacement function retrieves information about a character string, such as character widths, caret positioning, ordering within the string, and glyph rendering. (Unicode)
%group
Win32 gdi32
%prm
hdc, lpString, nCount, nMexExtent, lpResults, dwFlags
hdc : [intptr] A handle to the device context.
lpString : [wstr] A pointer to the character string to process. The string does not need to be zero-terminated, since nCount specifies the length of the string.
nCount : [int] The length of the string pointed to by lpString.
nMexExtent : [int] The maximum extent (in logical units) to which the string is processed. Characters that, if processed, would exceed this extent are ignored. Computations for any required ordering or glyph arrays apply only to the included characters. This parameter is used only if the GCP_MAXEXTENT value is specified in the dwFlags parameter. As the function processes the input string, each character and its extent is added to the output, extent, and other arrays only if the total extent has not yet exceeded the maximum. Once the limit is reached, processing will stop.
lpResults : [var] A pointer to a GCP_RESULTS structure that receives the results of the function.
dwFlags : [int] 
%inst
The GetCharacterPlacement function retrieves information about a
character string, such as character widths, caret positioning,
ordering within the string, and glyph rendering. (Unicode)

[戻り値]
If the function succeeds, the return value is the width and height of
the string in logical units. The width is the low-order word and the
height is the high-order word. If the function fails, the return
value is zero.

[備考]
GetCharacterPlacement ensures that an application can correctly
process text regardless of the international setting and type of
fonts available. Applications use this function before using the
ExtTextOut function and in place of the GetTextExtentPoint32 function
(and occasionally in place of the GetCharWidth32 and GetCharABCWidths
functions). Using GetCharacterPlacement to retrieve intercharacter
spacing and index arrays is not always necessary unless justification
or kerning is required. For non-Latin fonts, applications can improve
the speed at which the ExtTextOut function renders text by using
GetCharacterPlacement to retrieve the intercharacter spacing and
index arrays before calling ExtTextOut. This is especially useful
when rendering the same text repeatedly or when using intercharacter
spacing to position the caret. If the lpGlyphs output array is used
in the call to ExtTextOut, the ETO_GLYPH_INDEX flag must be set.
GetCharacterPlacement checks the lpOrder, lpDX, lpCaretPos,
lpOutString, and lpGlyphs members of the GCP_RESULTS structure and
fills the corresponding arrays if these members are not set to NULL.
If GetCharacterPlacement cannot fill an array, it sets the
corresponding member to NULL. To ensure retrieval of valid
information, the application is responsible for setting the member to
a valid address before calling the function and for checking the
value of the member after the call. If the GCP_JUSTIFY or
GCP_USEKERNING values are specified, the lpDX and/or lpCaretPos
members must have valid addresses. Note that the glyph indexes
returned in GCP_RESULTS.lpGlyphs are specific to the current font in
the device context and should only be used to draw text in the device
context while that font remains selected. When computing
justification, if the trailing characters in the string are spaces,
the function reduces the length of the string and removes the spaces
prior to computing the justification. If the array consists of only
spaces, the function returns an error.
ExtTextOut expects an lpDX entry for each byte of a DBCS string,
whereas GetCharacterPlacement assigns an lpDX entry for each glyph.
To correct this mismatch when using this combination of functions,
either use GetGlyphIndices or expand the lpDX array with zero-width
entries for the corresponding second byte of a DBCS byte pair. If the
logical width is less than the width of the leading character in the
input string, GCP_RESULTS.nMaxFit returns a bad value. For this case,
call GetCharacterPlacement for glyph indexes and the lpDX array. Then
use the lpDX array to do the extent calculation using the advance
width of each character, where nMaxFit is the number of characters
whose glyph indexes advance width is less than the width of the
leading character.
> [!NOTE] > The wingdi.h header defines GetCharacterPlacement as an
alias which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
GetClipBox
The GetClipBox function retrieves the dimensions of the tightest bounding rectangle that can be drawn around the current visible area on the device.
%group
Win32 gdi32
%prm
hdc, lprect
hdc : [intptr] A handle to the device context.
lprect : [var] A pointer to a RECT structure that is to receive the rectangle dimensions, in logical units.
%inst
The GetClipBox function retrieves the dimensions of the tightest
bounding rectangle that can be drawn around the current visible area
on the device.

[戻り値]
If the function succeeds, the return value specifies the clipping
box's complexity and can be one of the following values.
This doc was truncated.


%index
GetClipRgn
The GetClipRgn function retrieves a handle identifying the current application-defined clipping region for the specified device context.
%group
Win32 gdi32
%prm
hdc, hrgn
hdc : [intptr] A handle to the device context.
hrgn : [intptr] A handle to an existing region before the function is called. After the function returns, this parameter is a handle to a copy of the current clipping region.
%inst
The GetClipRgn function retrieves a handle identifying the current
application-defined clipping region for the specified device context.

[戻り値]
If the function succeeds and there is no clipping region for the
given device context, the return value is zero. If the function
succeeds and there is a clipping region for the given device context,
the return value is 1. If an error occurs, the return value is -1.

[備考]
An application-defined clipping region is a clipping region
identified by the SelectClipRgn function. It is not a clipping region
created when the application calls the BeginPaint function. If the
function succeeds, the hrgn parameter is a handle to a copy of the
current clipping region. Subsequent changes to this copy will not
affect the current clipping region.


%index
GetColorAdjustment
The GetColorAdjustment function retrieves the color adjustment values for the specified device context (DC).
%group
Win32 gdi32
%prm
hdc, lpca
hdc : [intptr] A handle to the device context.
lpca : [var] A pointer to a COLORADJUSTMENT structure that receives the color adjustment values.
%inst
The GetColorAdjustment function retrieves the color adjustment values
for the specified device context (DC).

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero.


%index
GetColorSpace
The GetColorSpace function retrieves the handle to the input color space from a specified device context.
%group
Win32 gdi32
%prm
hdc
hdc : [intptr] Specifies a device context that is to have its input color space handle retrieved.
%inst
The GetColorSpace function retrieves the handle to the input color
space from a specified device context.

[戻り値]
If the function succeeds, the return value is the current input color
space handle. If this function fails, the return value is NULL.

[備考]
GetColorSpace obtains the handle to the input color space regardless
of whether color management is enabled for the device context.


%index
GetCurrentObject
The GetCurrentObject function retrieves a handle to an object of the specified type that has been selected into the specified device context (DC).
%group
Win32 gdi32
%prm
hdc, type
hdc : [intptr] A handle to the DC.
type : [int] 
%inst
The GetCurrentObject function retrieves a handle to an object of the
specified type that has been selected into the specified device
context (DC).

[戻り値]
If the function succeeds, the return value is a handle to the
specified object. If the function fails, the return value is NULL.

[備考]
An application can use the GetCurrentObject and GetObject functions
to retrieve descriptions of the graphic objects currently selected
into the specified DC.


%index
GetCurrentPositionEx
The GetCurrentPositionEx function retrieves the current position in logical coordinates.
%group
Win32 gdi32
%prm
hdc, lppt
hdc : [intptr] A handle to the device context.
lppt : [var] A pointer to a POINT structure that receives the logical coordinates of the current position.
%inst
The GetCurrentPositionEx function retrieves the current position in
logical coordinates.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero.


%index
GetDCBrushColor
The GetDCBrushColor function retrieves the current brush color for the specified device context (DC).
%group
Win32 gdi32
%prm
hdc
hdc : [intptr] A handle to the DC whose brush color is to be returned.
%inst
The GetDCBrushColor function retrieves the current brush color for
the specified device context (DC).

[戻り値]
If the function succeeds, the return value is the COLORREF value for
the current DC brush color. If the function fails, the return value
is CLR_INVALID.

[備考]
For information on setting the brush color, see SetDCBrushColor. ICM:
Color management is performed if ICM is enabled.


%index
GetDCOrgEx
The GetDCOrgEx function retrieves the final translation origin for a specified device context (DC).
%group
Win32 gdi32
%prm
hdc, lppt
hdc : [intptr] A handle to the DC whose final translation origin is to be retrieved.
lppt : [var] A pointer to a POINT structure that receives the final translation origin, in device coordinates.
%inst
The GetDCOrgEx function retrieves the final translation origin for a
specified device context (DC).

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero.

[備考]
The final translation origin is relative to the physical origin of
the screen.


%index
GetDCPenColor
The GetDCPenColor function retrieves the current pen color for the specified device context (DC).
%group
Win32 gdi32
%prm
hdc
hdc : [intptr] A handle to the DC whose brush color is to be returned.
%inst
The GetDCPenColor function retrieves the current pen color for the
specified device context (DC).

[戻り値]
If the function succeeds, the return value is a COLORREF value for
the current DC pen color. If the function fails, the return value is
CLR_INVALID.

[備考]
For information on setting the pen color, see SetDCPenColor. ICM:
Color management is performed if ICM is enabled.


%index
GetDIBColorTable
The GetDIBColorTable function retrieves RGB (red, green, blue) color values from a range of entries in the color table of the DIB section bitmap that is currently selected into a specified device context.
%group
Win32 gdi32
%prm
hdc, iStart, cEntries, prgbq
hdc : [intptr] A handle to a device context. A DIB section bitmap must be selected into this device context.
iStart : [int] A zero-based color table index that specifies the first color table entry to retrieve.
cEntries : [int] The number of color table entries to retrieve.
prgbq : [var] A pointer to a buffer that receives an array of RGBQUAD data structures containing color information from the DIB color table. The buffer must be large enough to contain as many RGBQUAD data structures as the value of cEntries.
%inst
The GetDIBColorTable function retrieves RGB (red, green, blue) color
values from a range of entries in the color table of the DIB section
bitmap that is currently selected into a specified device context.

[戻り値]
If the function succeeds, the return value is the number of color
table entries that the function retrieves. If the function fails, the
return value is zero.

[備考]
The GetDIBColorTable function should be called to retrieve the color
table for DIB section bitmaps that use 1, 4, or 8 bpp. The biBitCount
member of a bitmap associated BITMAPINFOHEADER structure specifies
the number of bits-per-pixel. DIB section bitmaps with a biBitCount
value greater than eight do not have a color table, but they do have
associated color masks. Call the GetObject function to retrieve those
color masks.


%index
GetDIBits
指定された互換ビットマップのビットを取得し、指定された形式の DIB としてバッファにコピーする。
%group
Win32 gdi32
%prm
hdc, hbm, start, cLines, lpvBits, lpbmi, usage
hdc : [intptr] デバイスコンテキストへのハンドル。
hbm : [intptr] ビットマップへのハンドル。互換ビットマップ(DDB)でなければならない。
start : [int] 取得する最初のスキャンライン。
cLines : [int] 取得するスキャンライン数。
lpvBits : [intptr] ビットマップデータを受け取るバッファへのポインタ。NULL の場合、関数はビットマップの寸法と形式を lpbmi が指す BITMAPINFO 構造体に渡す。
lpbmi : [var] DIB データの希望する形式を指定する BITMAPINFO 構造体へのポインタ。
usage : [int] 
%inst
指定された互換ビットマップのビットを取得し、指定された形式の DIB としてバッファにコピーする。

[戻り値]
lpvBits が非 NULL で関数が成功した場合、戻り値はコピーされたスキャンライン数。lpvBits が NULL で
BITMAPINFO 構造体の埋め込みに成功した場合は 0 以外。失敗した場合は 0。
（以下省略）

[備考]
DIB の要求形式が内部形式と一致する場合、ビットマップの RGB 値がコピーされる。一致しない場合はカラーテーブルが合成される。
（以下省略）


%index
GetDeviceCaps
The GetDeviceCaps function retrieves device-specific information for the specified device.
%group
Win32 gdi32
%prm
hdc, index
hdc : [intptr] A handle to the DC.
index : [int] 
%inst
The GetDeviceCaps function retrieves device-specific information for
the specified device.

[戻り値]
The return value specifies the value of the desired item. When nIndex
is BITSPIXEL and the device has 15bpp or 16bpp, the return value is
16.

[備考]
When nIndex is SHADEBLENDCAPS:
This doc was truncated.


%index
GetDeviceGammaRamp
The GetDeviceGammaRamp function gets the gamma ramp on direct color display boards having drivers that support downloadable gamma ramps in hardware.
%group
Win32 gdi32
%prm
hdc, lpRamp
hdc : [intptr] Specifies the device context of the direct color display board in question.
lpRamp : [intptr] Points to a buffer where the function can place the current gamma ramp of the color display board. The gamma ramp is specified in three arrays of 256 WORD elements each, which contain the mapping between RGB values in the frame buffer and digital-analog-converter (DAC) values. The sequence of the arrays is red, green, blue.
%inst
The GetDeviceGammaRamp function gets the gamma ramp on direct color
display boards having drivers that support downloadable gamma ramps
in hardware.

[戻り値]
If this function succeeds, the return value is TRUE. If this function
fails, the return value is FALSE.

[備考]
Direct color display modes do not use color lookup tables and are
usually 16, 24, or 32 bit. Not all direct color video boards support
loadable gamma ramps. GetDeviceGammaRamp succeeds only for devices
with drivers that support downloadable gamma ramps in hardware.


%index
GetEnhMetaFileW
The GetEnhMetaFile function creates a handle that identifies the enhanced-format metafile stored in the specified file. (Unicode)
%group
Win32 gdi32
%prm
lpName
lpName : [wstr] A pointer to a null-terminated string that specifies the name of an enhanced metafile.
%inst
The GetEnhMetaFile function creates a handle that identifies the
enhanced-format metafile stored in the specified file. (Unicode)

[戻り値]
If the function succeeds, the return value is a handle to the
enhanced metafile. If the function fails, the return value is NULL.

[備考]
When the application no longer needs an enhanced-metafile handle, it
should delete the handle by calling the DeleteEnhMetaFile function. A
Windows-format metafile must be converted to the enhanced format
before it can be processed by the GetEnhMetaFile function. To convert
the file, use the SetWinMetaFileBits function. Where text arguments
must use Unicode characters, use this function as a wide-character
function. Where text arguments must use characters from the Windows
character set, use this function as an ANSI function.


%index
GetEnhMetaFileBits
The GetEnhMetaFileBits function retrieves the contents of the specified enhanced-format metafile and copies them into a buffer.
%group
Win32 gdi32
%prm
hEMF, nSize, lpData
hEMF : [intptr] A handle to the enhanced metafile.
nSize : [int] The size, in bytes, of the buffer to receive the data.
lpData : [var] A pointer to a buffer that receives the metafile data. The buffer must be sufficiently large to contain the data. If lpbBuffer is NULL, the function returns the size necessary to hold the data.
%inst
The GetEnhMetaFileBits function retrieves the contents of the
specified enhanced-format metafile and copies them into a buffer.

[戻り値]
If the function succeeds and the buffer pointer is NULL, the return
value is the size of the enhanced metafile, in bytes. If the function
succeeds and the buffer pointer is a valid pointer, the return value
is the number of bytes copied to the buffer. If the function fails,
the return value is zero.

[備考]
After the enhanced-metafile bits are retrieved, they can be used to
create a memory-based metafile by calling the SetEnhMetaFileBits
function. The GetEnhMetaFileBits function does not invalidate the
enhanced-metafile handle. The application must call the
DeleteEnhMetaFile function to delete the handle when it is no longer
needed. The metafile contents retrieved by this function are in the
enhanced format. To retrieve the metafile contents in the Windows
format, use the GetWinMetaFileBits function.


%index
GetEnhMetaFileDescriptionW
The GetEnhMetaFileDescription function retrieves an optional text description from an enhanced-format metafile and copies the string to the specified buffer. (Unicode)
%group
Win32 gdi32
%prm
hemf, cchBuffer, lpDescription
hemf : [intptr] A handle to the enhanced metafile.
cchBuffer : [int] The size, in characters, of the buffer to receive the data. Only this many characters will be copied.
lpDescription : [wstr] A pointer to a buffer that receives the optional text description.
%inst
The GetEnhMetaFileDescription function retrieves an optional text
description from an enhanced-format metafile and copies the string to
the specified buffer. (Unicode)

[戻り値]
If the optional text description exists and the buffer pointer is
NULL, the return value is the length of the text string, in
characters. If the optional text description exists and the buffer
pointer is a valid pointer, the return value is the number of
characters copied into the buffer. If the optional text description
does not exist, the return value is zero. If the function fails, the
return value is GDI_ERROR.

[備考]
The optional text description contains two strings, the first
identifying the application that created the enhanced metafile and
the second identifying the picture contained in the metafile. The
strings are separated by a null character and terminated with two
null characters, for example, "XYZ Graphics Editor\0Bald Eagle\0\0"
where \0 represents the null character. Where text arguments must use
Unicode characters, use this function as a wide-character function.
Where text arguments must use characters from the Windows character
set, use this function as an ANSI function.
> [!NOTE] > The wingdi.h header defines GetEnhMetaFileDescription as
an alias which automatically selects the ANSI or Unicode version of
this function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
GetEnhMetaFileHeader
The GetEnhMetaFileHeader function retrieves the record containing the header for the specified enhanced-format metafile.
%group
Win32 gdi32
%prm
hemf, nSize, lpEnhMetaHeader
hemf : [intptr] A handle to the enhanced metafile for which the header is to be retrieved.
nSize : [int] The size, in bytes, of the buffer to receive the data. Only this many bytes will be copied.
lpEnhMetaHeader : [var] A pointer to an ENHMETAHEADER structure that receives the header record. If this parameter is NULL, the function returns the size of the header record.
%inst
The GetEnhMetaFileHeader function retrieves the record containing the
header for the specified enhanced-format metafile.

[戻り値]
If the function succeeds and the structure pointer is NULL, the
return value is the size of the record that contains the header; if
the structure pointer is a valid pointer, the return value is the
number of bytes copied. Otherwise, it is zero.

[備考]
An enhanced-metafile header contains such information as the
metafile's size, in bytes; the dimensions of the picture stored in
the metafile; the number of records stored in the metafile; the
offset to the optional text description; the size of the optional
palette, and the resolution of the device on which the picture was
created. The record that contains the enhanced-metafile header is
always the first record in the metafile.


%index
GetEnhMetaFilePaletteEntries
The GetEnhMetaFilePaletteEntries function retrieves optional palette entries from the specified enhanced metafile.
%group
Win32 gdi32
%prm
hemf, nNumEntries, lpPaletteEntries
hemf : [intptr] A handle to the enhanced metafile.
nNumEntries : [int] The number of entries to be retrieved from the optional palette.
lpPaletteEntries : [var] A pointer to an array of PALETTEENTRY structures that receives the palette colors. The array must contain at least as many structures as there are entries specified by the cEntries parameter.
%inst
The GetEnhMetaFilePaletteEntries function retrieves optional palette
entries from the specified enhanced metafile.

[戻り値]
If the array pointer is NULL and the enhanced metafile contains an
optional palette, the return value is the number of entries in the
enhanced metafile's palette; if the array pointer is a valid pointer
and the enhanced metafile contains an optional palette, the return
value is the number of entries copied; if the metafile does not
contain an optional palette, the return value is zero. Otherwise, the
return value is GDI_ERROR.

[備考]
An application can store an optional palette in an enhanced metafile
by calling the CreatePalette and SetPaletteEntries functions before
creating the picture and storing it in the metafile. By doing this,
the application can achieve consistent colors when the picture is
displayed on a variety of devices. An application that displays a
picture stored in an enhanced metafile can call the
GetEnhMetaFilePaletteEntries function to determine whether the
optional palette exists. If it does, the application can call the
GetEnhMetaFilePaletteEntries function a second time to retrieve the
palette entries and then create a logical palette (by using the
CreatePalette function), select it into its device context (by using
the SelectPalette function), and then realize it (by using the
RealizePalette function). After the logical palette has been
realized, calling the PlayEnhMetaFile function displays the picture
using its original colors.


%index
GetEnhMetaFilePixelFormat
The GetEnhMetaFilePixelFormat function retrieves pixel format information for an enhanced metafile.
%group
Win32 gdi32
%prm
hemf, cbBuffer, ppfd
hemf : [intptr] Identifies the enhanced metafile.
cbBuffer : [int] Specifies the size, in bytes, of the buffer into which the pixel format information is copied.
ppfd : [var] Pointer to a PIXELFORMATDESCRIPTOR structure that contains the logical pixel format specification. The metafile uses this structure to record the logical pixel format specification.
%inst
The GetEnhMetaFilePixelFormat function retrieves pixel format
information for an enhanced metafile.

[戻り値]
If the function succeeds and finds a pixel format, the return value
is the size of the metafile's pixel format. If no pixel format is
present, the return value is zero. If an error occurs and the
function fails, the return value is GDI_ERROR. To get extended error
information, call GetLastError.

[備考]
When an enhanced metafile specifies a pixel format in its
ENHMETAHEADER structure and the pixel format fits in the buffer, the
pixel format information is copied into ppfd. When cbBuffer is too
small to contain the pixel format of the metafile, the pixel format
is not copied to the buffer. In either case, the function returns the
size of the metafile's pixel format. For information on metafile
recording and other operations, see Enhanced Metafile Operations.


%index
GetFontData
The GetFontData function retrieves font metric data for a TrueType font.
%group
Win32 gdi32
%prm
hdc, dwTable, dwOffset, pvBuffer, cjBuffer
hdc : [intptr] A handle to the device context.
dwTable : [int] The name of a font metric table from which the font data is to be retrieved. This parameter can identify one of the metric tables documented in the TrueType Font Files specification published by Microsoft Corporation. If this parameter is zero, the information is retrieved starting at the beginning of the file for TrueType font files or from the beginning of the data for the currently selected font for TrueType Collection files. To retrieve the data from the beginning of the file for TrueType Collection files specify 'ttcf' (0x66637474).
dwOffset : [int] The offset from the beginning of the font metric table to the location where the function should begin retrieving information. If this parameter is zero, the information is retrieved starting at the beginning of the table specified by the dwTable parameter. If this value is greater than or equal to the size of the table, an error occurs.
pvBuffer : [intptr] A pointer to a buffer that receives the font information. If this parameter is NULL, the function returns the size of the buffer required for the font data.
cjBuffer : [int] The length, in bytes, of the information to be retrieved. If this parameter is zero, GetFontData returns the size of the data specified in the dwTable parameter.
%inst
The GetFontData function retrieves font metric data for a TrueType
font.

[戻り値]
If the function succeeds, the return value is the number of bytes
returned. If the function fails, the return value is GDI_ERROR.

[備考]
This function is intended to be used to retrieve TrueType font
information directly from the font file by font-manipulation
applications. For information about embedding fonts see the Font
Embedding Reference. An application can sometimes use the GetFontData
function to save a TrueType font with a document. To do this, the
application determines whether the font can be embedded by checking
the otmfsType member of the OUTLINETEXTMETRIC structure. If bit 1 of
otmfsType is set, embedding is not permitted for the font. If bit 1
is clear, the font can be embedded. If bit 2 is set, the embedding is
read-only. If embedding is permitted, the application can retrieve
the entire font file, specifying zero for the dwTable, dwOffset, and
cbData parameters. If an application attempts to use this function to
retrieve information for a non-TrueType font, an error occurs.


%index
GetFontLanguageInfo
The GetFontLanguageInfo function returns information about the currently selected font for the specified display context. Applications typically use this information and the GetCharacterPlacement function to prepare a character string for display.
%group
Win32 gdi32
%prm
hdc
hdc : [intptr] Handle to a display device context.
%inst
The GetFontLanguageInfo function returns information about the
currently selected font for the specified display context.
Applications typically use this information and the
GetCharacterPlacement function to prepare a character string for
display.

[戻り値]
The return value identifies characteristics of the currently selected
font. The function returns 0 if the font is "normalized" and can be
treated as a simple Latin font; it returns GCP_ERROR if an error
occurs. Otherwise, the function returns a combination of the
following values.
This doc was truncated.


%index
GetFontUnicodeRanges
The GetFontUnicodeRanges function returns information about which Unicode characters are supported by a font. The information is returned as a GLYPHSET structure.
%group
Win32 gdi32
%prm
hdc, lpgs
hdc : [intptr] A handle to the device context.
lpgs : [var] A pointer to a GLYPHSET structure that receives the glyph set information. If this parameter is NULL, the function returns the size of the GLYPHSET structure required to store the information.
%inst
The GetFontUnicodeRanges function returns information about which
Unicode characters are supported by a font. The information is
returned as a GLYPHSET structure.

[戻り値]
If the function succeeds, it returns number of bytes written to the
GLYPHSET structure or, if the lpgs parameter is NULL, it returns the
size of the GLYPHSET structure required to store the information. If
the function fails, it returns zero. No extended error information is
available.


%index
GetGlyphIndicesW
The GetGlyphIndices function translates a string into an array of glyph indices. The function can be used to determine whether a glyph exists in a font. (Unicode)
%group
Win32 gdi32
%prm
hdc, lpstr, c, pgi, fl
hdc : [intptr] A handle to the device context.
lpstr : [wstr] A pointer to the string to be converted.
c : [int] The length of both the length of the string pointed to by lpstr and the size (in WORDs) of the buffer pointed to by pgi.
pgi : [var] This buffer must be of dimension c. On successful return, contains an array of glyph indices corresponding to the characters in the string.
fl : [int] Specifies how glyphs should be handled if they are not supported. This parameter can be the following value.
%inst
The GetGlyphIndices function translates a string into an array of
glyph indices. The function can be used to determine whether a glyph
exists in a font. (Unicode)

[戻り値]
If the function succeeds, it returns the number of bytes (for the
ANSI function) or WORDs (for the Unicode function) converted. If the
function fails, the return value is GDI_ERROR.

[備考]
This function attempts to identify a single-glyph representation for
each character in the string pointed to by lpstr. While this is
useful for certain low-level purposes (such as manipulating font
files), higher-level applications that wish to map a string to glyphs
will typically wish to use the Uniscribe functions.
> [!NOTE] > The wingdi.h header defines GetGlyphIndices as an alias
which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
GetGlyphOutlineW
The GetGlyphOutline function retrieves the outline or bitmap for a character in the TrueType font that is selected into the specified device context. (Unicode)
%group
Win32 gdi32
%prm
hdc, uChar, fuFormat, lpgm, cjBuffer, pvBuffer, lpmat2
hdc : [intptr] A handle to the device context.
uChar : [int] The character for which data is to be returned.
fuFormat : [int] 
lpgm : [var] A pointer to the GLYPHMETRICS structure describing the placement of the glyph in the character cell.
cjBuffer : [int] The size, in bytes, of the buffer (*lpvBuffer) where the function is to copy information about the outline character. If this value is zero, the function returns the required size of the buffer.
pvBuffer : [intptr] A pointer to the buffer that receives information about the outline character. If this value is NULL, the function returns the required size of the buffer.
lpmat2 : [var] A pointer to a MAT2 structure specifying a transformation matrix for the character.
%inst
The GetGlyphOutline function retrieves the outline or bitmap for a
character in the TrueType font that is selected into the specified
device context. (Unicode)

[戻り値]
If GGO_BITMAP, GGO_GRAY2_BITMAP, GGO_GRAY4_BITMAP, GGO_GRAY8_BITMAP,
or GGO_NATIVE is specified and the function succeeds, the return
value is greater than zero; otherwise, the return value is GDI_ERROR.
If one of these flags is specified and the buffer size or address is
zero, the return value specifies the required buffer size, in bytes.
If GGO_METRICS is specified and the function fails, the return value
is GDI_ERROR.

[備考]
The glyph outline returned by the GetGlyphOutline function is for a
grid-fitted glyph. (A grid-fitted glyph is a glyph that has been
modified so that its bitmapped image conforms as closely as possible
to the original design of the glyph.) If an application needs an
unmodified glyph outline, it can request the glyph outline for a
character in a font whose size is equal to the font's em unit. The
value for a font's em unit is stored in the otmEMSquare member of the
OUTLINETEXTMETRIC structure. The glyph bitmap returned by
GetGlyphOutline when GGO_BITMAP is specified is a DWORD-aligned,
row-oriented, monochrome bitmap. When GGO_GRAY2_BITMAP is specified,
the bitmap returned is a DWORD-aligned, row-oriented array of bytes
whose values range from 0 to 4. When GGO_GRAY4_BITMAP is specified,
the bitmap returned is a DWORD-aligned, row-oriented array of bytes
whose values range from 0 to 16. When GGO_GRAY8_BITMAP is specified,
the bitmap returned is a DWORD-aligned, row-oriented array of bytes
whose values range from 0 to 64. The native buffer returned by
GetGlyphOutline when GGO_NATIVE is specified is a glyph outline. A
glyph outline is returned as a series of one or more contours defined
by a TTPOLYGONHEADER structure followed by one or more curves. Each
curve in the contour is defined by a TTPOLYCURVE structure followed
by a number of POINTFX data points. POINTFX points are absolute
positions, not relative moves. The starting point of a contour is
given by the pfxStart member of the TTPOLYGONHEADER structure. The
starting point of each curve is the last point of the previous curve
or the starting point of the contour. The count of data points in a
curve is stored in the cpfx member of TTPOLYCURVE structure. The size
of each contour in the buffer, in bytes, is stored in the cb member
of TTPOLYGONHEADER structure. Additional curve definitions are packed
into the buffer following preceding curves and additional contours
are packed into the buffer following preceding contours. The buffer
contains as many contours as fit within the buffer returned by
GetGlyphOutline. The GLYPHMETRICS structure specifies the width of
the character cell and the location of a glyph within the character
cell. The origin of the character cell is located at the left side of
the cell at the baseline of the font. The location of the glyph
origin is relative to the character cell origin. The height of a
character cell, the baseline, and other metrics global to the font
are given by the OUTLINETEXTMETRIC structure. An application can
alter the characters retrieved in bitmap or native format by
specifying a 2-by-2 transformation matrix in the lpMatrix parameter.
For example the glyph can be modified by shear, rotation, scaling, or
any combination of the three using matrix multiplication. Additional
information on a glyph outlines is located in the TrueType and the
OpenType technical specifications.
> [!NOTE] > The wingdi.h header defines GetGlyphOutline as an alias
which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
GetGraphicsMode
The GetGraphicsMode function retrieves the current graphics mode for the specified device context.
%group
Win32 gdi32
%prm
hdc
hdc : [intptr] A handle to the device context.
%inst
The GetGraphicsMode function retrieves the current graphics mode for
the specified device context.

[戻り値]
If the function succeeds, the return value is the current graphics
mode. It can be one of the following values.
This doc was truncated.

[備考]
An application can set the graphics mode for a device context by
calling the SetGraphicsMode function.


%index
GetICMProfileW
The GetICMProfile function retrieves the file name of the current output color profile for a specified device context. (Unicode)
%group
Win32 gdi32
%prm
hdc, pBufSize, pszFilename
hdc : [intptr] Specifies a device context from which to retrieve the color profile.
pBufSize : [var] Pointer to a DWORD that contains the size of the buffer pointed to by lpszFilename. For the ANSI version of this function, the size is in bytes. For the Unicode version, the size is in WCHARs. If this function is successful, on return this parameter contains the size of the buffer actually used. However, if the buffer is not large enough, this function returns FALSE. In this case, the GetLastError() function returns ERROR_INSUFFICIENT_BUFFER and the DWORD pointed to by this parameter contains the size needed for the lpszFilename buffer.
pszFilename : [wstr] Points to the buffer that receives the path name of the profile.
%inst
The GetICMProfile function retrieves the file name of the current
output color profile for a specified device context. (Unicode)

[戻り値]
If this function succeeds, the return value is TRUE. It also returns
TRUE if the lpszFilename parameter is NULL and the size required for
the buffer is copied into lpcbName. If this function fails, the
return value is FALSE.

[備考]
GetICMProfile obtains the file name of the current output profile
regardless of whether or not color management is enabled for the
device context. Given a device context, GetICMProfile will output,
through the parameter lpszFilename, the path name of the file
containing the color profile currently being used by the device
context. It will also output, through the parameter lpcbName, the
length of the string containing the path name. It is possible that
the profile name returned by GetICMProfile will not be in the list of
profiles returned by EnumICMProfiles. The EnumICMProfiles function
returns all color space profiles that are associated with a device
context (DC) whose settings match that of the DC. If the
SetICMProfile function is used to set the current profile, a profile
may be associated with the DC that does not match its settings. For
instance, the SetICMProfile function can be used to associate the
device-independent sRGB profile with a DC. This profile will be used
as the current WCS profile for that DC, and calls to GetICMProfile
will return its file name. However, the profile will not appear in
the list of profiles that is returned from EnumICMProfiles. If this
function is called before any calls to the SetICMProfile function, it
can be used to get the default profile for a device context. Windows
95/98/Me: GetICMProfileW is supported by the Microsoft Layer for
Unicode. To use this, you must add certain files to your application,
as outlined in Microsoft Layer for Unicode on Windows 95/98/Me
Systems.
> [!NOTE] > The wingdi.h header defines GetICMProfile as an alias
which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
GetKerningPairsW
The GetKerningPairs function retrieves the character-kerning pairs for the currently selected font for the specified device context. (Unicode)
%group
Win32 gdi32
%prm
hdc, nPairs, lpKernPair
hdc : [intptr] A handle to the device context.
nPairs : [int] The number of pairs in the lpkrnpair array. If the font has more than nNumPairs kerning pairs, the function returns an error.
lpKernPair : [var] A pointer to an array of KERNINGPAIR structures that receives the kerning pairs. The array must contain at least as many structures as specified by the nNumPairs parameter. If this parameter is NULL, the function returns the total number of kerning pairs for the font.
%inst
The GetKerningPairs function retrieves the character-kerning pairs
for the currently selected font for the specified device context.
(Unicode)

[戻り値]
If the function succeeds, the return value is the number of kerning
pairs returned. If the function fails, the return value is zero.

[備考]
> [!NOTE] > The wingdi.h header defines GetKerningPairs as an alias
which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
GetLayout
The GetLayout function returns the layout of a device context (DC).
%group
Win32 gdi32
%prm
hdc
hdc : [intptr] A handle to the device context.
%inst
The GetLayout function returns the layout of a device context (DC).

[戻り値]
If the function succeeds, it returns the layout flags for the current
device context. If the function fails, it returns GDI_ERROR. For
extended error information, call GetLastError.

[備考]
The layout specifies the order in which text and graphics are
revealed in a window or device context. The default is left to right.
The GetLayout function tells you if the default has been changed
through a call to SetLayout. For more information, see "Window Layout
and Mirroring" in Window Features.


%index
GetLogColorSpaceW
The GetLogColorSpace function retrieves the color space definition identified by a specified handle. (Unicode)
%group
Win32 gdi32
%prm
hColorSpace, lpBuffer, nSize
hColorSpace : [intptr] Specifies the handle to a color space.
lpBuffer : [var] Points to a buffer to receive the LOGCOLORSPACE structure.
nSize : [int] Specifies the maximum size of the buffer.
%inst
The GetLogColorSpace function retrieves the color space definition
identified by a specified handle. (Unicode)

[戻り値]
If this function succeeds, the return value is TRUE. If this function
fails, the return value is FALSE.

[備考]
Windows 95/98/Me: GetLogColorSpaceW is supported by the Microsoft
Layer for Unicode. To use this, you must add certain files to your
application, as outlined in Microsoft Layer for Unicode on Windows
95/98/Me Systems.
> [!NOTE] > The wingdi.h header defines GetLogColorSpace as an alias
which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
GetMapMode
The GetMapMode function retrieves the current mapping mode.
%group
Win32 gdi32
%prm
hdc
hdc : [intptr] A handle to the device context.
%inst
The GetMapMode function retrieves the current mapping mode.

[戻り値]
If the function succeeds, the return value specifies the mapping
mode. If the function fails, the return value is zero.

[備考]
The following are the various mapping modes.
This doc was truncated.


%index
GetMetaFileW
The GetMetaFile function creates a handle that identifies the metafile stored in the specified file. (Unicode)
%group
Win32 gdi32
%prm
lpName
lpName : [wstr] A pointer to a null-terminated string that specifies the name of a metafile.
%inst
The GetMetaFile function creates a handle that identifies the
metafile stored in the specified file. (Unicode)

[戻り値]
If the function succeeds, the return value is a handle to the
metafile. If the function fails, the return value is NULL.

[備考]
This function is not implemented in the Win32 API. It is provided for
compatibility with 16-bit versions of Windows. In Win32 applications,
use the GetEnhMetaFile function.
> [!NOTE] > The wingdi.h header defines GetMetaFile as an alias which
automatically selects the ANSI or Unicode version of this function
based on the definition of the UNICODE preprocessor constant. Mixing
usage of the encoding-neutral alias with code that not
encoding-neutral can lead to mismatches that result in compilation or
runtime errors. For more information, see [Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
GetMetaFileBitsEx
The GetMetaFileBitsEx function retrieves the contents of a Windows-format metafile and copies them into the specified buffer.
%group
Win32 gdi32
%prm
hMF, cbBuffer, lpData
hMF : [intptr] A handle to a Windows-format metafile.
cbBuffer : [int] The size, in bytes, of the buffer to receive the data.
lpData : [intptr] A pointer to a buffer that receives the metafile data. The buffer must be sufficiently large to contain the data. If lpvData is NULL, the function returns the number of bytes required to hold the data.
%inst
The GetMetaFileBitsEx function retrieves the contents of a
Windows-format metafile and copies them into the specified buffer.

[戻り値]
If the function succeeds and the buffer pointer is NULL, the return
value is the number of bytes required for the buffer; if the function
succeeds and the buffer pointer is a valid pointer, the return value
is the number of bytes copied. If the function fails, the return
value is zero.

[備考]
After the Windows-metafile bits are retrieved, they can be used to
create a memory-based metafile by calling the SetMetaFileBitsEx
function. The GetMetaFileBitsEx function does not invalidate the
metafile handle. An application must delete this handle by calling
the DeleteMetaFile function. To convert a Windows-format metafile
into an enhanced-format metafile, use the SetWinMetaFileBits
function.


%index
GetMetaRgn
The GetMetaRgn function retrieves the current metaregion for the specified device context.
%group
Win32 gdi32
%prm
hdc, hrgn
hdc : [intptr] A handle to the device context.
hrgn : [intptr] A handle to an existing region before the function is called. After the function returns, this parameter is a handle to a copy of the current metaregion.
%inst
The GetMetaRgn function retrieves the current metaregion for the
specified device context.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero.

[備考]
If the function succeeds, hrgn is a handle to a copy of the current
metaregion. Subsequent changes to this copy will not affect the
current metaregion. The current clipping region of a device context
is defined by the intersection of its clipping region and its
metaregion.


%index
GetMiterLimit
The GetMiterLimit function retrieves the miter limit for the specified device context.
%group
Win32 gdi32
%prm
hdc, plimit
hdc : [intptr] Handle to the device context.
plimit : [var] Pointer to a floating-point value that receives the current miter limit.
%inst
The GetMiterLimit function retrieves the miter limit for the
specified device context.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero.

[備考]
The miter limit is used when drawing geometric lines that have miter
joins.


%index
GetNearestColor
The GetNearestColor function retrieves a color value identifying a color from the system palette that will be displayed when the specified color value is used.
%group
Win32 gdi32
%prm
hdc, color
hdc : [intptr] A handle to the device context.
color : [int] A color value that identifies a requested color. To create a COLORREF color value, use the RGB macro.
%inst
The GetNearestColor function retrieves a color value identifying a
color from the system palette that will be displayed when the
specified color value is used.

[戻り値]
If the function succeeds, the return value identifies a color from
the system palette that corresponds to the given color value. If the
function fails, the return value is CLR_INVALID.


%index
GetNearestPaletteIndex
The GetNearestPaletteIndex function retrieves the index for the entry in the specified logical palette most closely matching a specified color value.
%group
Win32 gdi32
%prm
h, color
h : [intptr] A handle to a logical palette.
color : [int] A color to be matched. To create a COLORREF color value, use the RGB macro.
%inst
The GetNearestPaletteIndex function retrieves the index for the entry
in the specified logical palette most closely matching a specified
color value.

[戻り値]
If the function succeeds, the return value is the index of an entry
in a logical palette. If the function fails, the return value is
CLR_INVALID.

[備考]
An application can determine whether a device supports palette
operations by calling the GetDeviceCaps function and specifying the
RASTERCAPS constant. If the given logical palette contains entries
with the PC_EXPLICIT flag set, the return value is undefined.


%index
GetObjectW
The GetObjectW (Unicode) function (wingdi.h) retrieves information for the specified graphics object.
%group
Win32 gdi32
%prm
h, c, pv
h : [intptr] 
c : [int] 
pv : [intptr] 
%inst
The GetObjectW (Unicode) function (wingdi.h) retrieves information
for the specified graphics object.

[戻り値]
If the function succeeds, and lpvObject is a valid pointer, the
return value is the number of bytes stored into the buffer. If the
function succeeds, and lpvObject is NULL, the return value is the
number of bytes required to hold the information the function would
store into the buffer. If the function fails, the return value is
zero.

[備考]
The buffer pointed to by the lpvObject parameter must be sufficiently
large to receive the information about the graphics object. Depending
on the graphics object, the function uses a BITMAP, DIBSECTION,
EXTLOGPEN, LOGBRUSH, LOGFONT, or LOGPEN structure, or a count of
table entries (for a logical palette). If hgdiobj is a handle to a
bitmap created by calling CreateDIBSection, and the specified buffer
is large enough, the GetObject function returns a DIBSECTION
structure. In addition, the bmBits member of the BITMAP structure
contained within the DIBSECTION will contain a pointer to the
bitmap's bit values. If hgdiobj is a handle to a bitmap created by
any other means, GetObject returns only the width, height, and color
format information of the bitmap. You can obtain the bitmap's bit
values by calling the GetDIBits or GetBitmapBits function. If hgdiobj
is a handle to a logical palette, GetObject retrieves a 2-byte
integer that specifies the number of entries in the palette. The
function does not retrieve the LOGPALETTE structure defining the
palette. To retrieve information about palette entries, an
application can call the GetPaletteEntries function. If hgdiobj is a
handle to a font, the LOGFONT that is returned is the LOGFONT used to
create the font. If Windows had to make some interpolation of the
font because the precise LOGFONT could not be represented, the
interpolation will not be reflected in the LOGFONT. For example, if
you ask for a vertical version of a font that doesn't support
vertical painting, the LOGFONT indicates the font is vertical, but
Windows will paint it horizontally.


%index
GetObjectType
The GetObjectType retrieves the type of the specified object.
%group
Win32 gdi32
%prm
h
h : [intptr] A handle to the graphics object.
%inst
The GetObjectType retrieves the type of the specified object.

[戻り値]
If the function succeeds, the return value identifies the object.
This value can be one of the following.
This doc was truncated.


%index
GetOutlineTextMetricsW
The GetOutlineTextMetrics function retrieves text metrics for TrueType fonts. (Unicode)
%group
Win32 gdi32
%prm
hdc, cjCopy, potm
hdc : [intptr] A handle to the device context.
cjCopy : [int] The size, in bytes, of the array that receives the text metrics.
potm : [var] A pointer to an OUTLINETEXTMETRIC structure. If this parameter is NULL, the function returns the size of the buffer required for the retrieved metric data.
%inst
The GetOutlineTextMetrics function retrieves text metrics for
TrueType fonts. (Unicode)

[戻り値]
If the function succeeds, the return value is nonzero or the size of
the required buffer. If the function fails, the return value is zero.

[備考]
The OUTLINETEXTMETRIC structure contains most of the text metric
information provided for TrueType fonts (including a TEXTMETRIC
structure). The sizes returned in OUTLINETEXTMETRIC are in logical
units; they depend on the current mapping mode.
> [!NOTE] > The wingdi.h header defines GetOutlineTextMetrics as an
alias which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
GetPaletteEntries
The GetPaletteEntries function retrieves a specified range of palette entries from the given logical palette.
%group
Win32 gdi32
%prm
hpal, iStart, cEntries, pPalEntries
hpal : [intptr] A handle to the logical palette.
iStart : [int] The first entry in the logical palette to be retrieved.
cEntries : [int] The number of entries in the logical palette to be retrieved.
pPalEntries : [var] A pointer to an array of PALETTEENTRY structures to receive the palette entries. The array must contain at least as many structures as specified by the nEntries parameter.
%inst
The GetPaletteEntries function retrieves a specified range of palette
entries from the given logical palette.

[戻り値]
If the function succeeds and the handle to the logical palette is a
valid pointer (not NULL), the return value is the number of entries
retrieved from the logical palette. If the function succeeds and
handle to the logical palette is NULL, the return value is the number
of entries in the given palette. If the function fails, the return
value is zero.

[備考]
An application can determine whether a device supports palette
operations by calling the GetDeviceCaps function and specifying the
RASTERCAPS constant. If the nEntries parameter specifies more entries
than exist in the palette, the remaining members of the PALETTEENTRY
structure are not altered.


%index
GetPath
The GetPath function retrieves the coordinates defining the endpoints of lines and the control points of curves found in the path that is selected into the specified device context.
%group
Win32 gdi32
%prm
hdc, apt, aj, cpt
hdc : [intptr] A handle to a device context that contains a closed path.
apt : [var] A pointer to an array of POINT structures that receives the line endpoints and curve control points, in logical coordinates.
aj : [var] 
cpt : [int] The total number of POINT structures that can be stored in the array pointed to by lpPoints. This value must be the same as the number of bytes that can be placed in the array pointed to by lpTypes.
%inst
The GetPath function retrieves the coordinates defining the endpoints
of lines and the control points of curves found in the path that is
selected into the specified device context.

[戻り値]
If the nSize parameter is nonzero, the return value is the number of
points enumerated. If nSize is 0, the return value is the total
number of points in the path (and GetPath writes nothing to the
buffers). If nSize is nonzero and is less than the number of points
in the path, the return value is 1.

[備考]
The device context identified by the hdc parameter must contain a
closed path. The points of the path are returned in logical
coordinates. Points are stored in the path in device coordinates, so
GetPath changes the points from device coordinates to logical
coordinates by using the inverse of the current transformation. The
FlattenPath function may be called before GetPath to convert all
curves in the path into line segments.


%index
GetPixel
指定された座標のピクセルの RGB カラー値を取得する。
%group
Win32 gdi32
%prm
hdc, x, y
hdc : [intptr] デバイスコンテキストへのハンドル。
x : [int] 検査するピクセルの x 座標(論理単位)。
y : [int] 検査するピクセルの y 座標(論理単位)。
%inst
指定された座標のピクセルの RGB カラー値を取得する。

[戻り値]
戻り値はピクセルの RGB を指定する COLORREF 値。ピクセルが現在のクリッピング領域外の場合は
CLR_INVALID(0xFFFFFFFF)。

[備考]
ピクセルは現在のクリッピング領域内にある必要がある。すべてのデバイスが GetPixel
をサポートするわけではなく、GetDeviceCaps で確認すべき。DC にビットマップが選択されていない場合、すべてのピクセルで
CLR_INVALID が返る。


%index
GetPixelFormat
The GetPixelFormat function obtains the index of the currently selected pixel format of the specified device context.
%group
Win32 gdi32
%prm
hdc
hdc : [intptr] Specifies the device context of the currently selected pixel format index returned by the function.
%inst
The GetPixelFormat function obtains the index of the currently
selected pixel format of the specified device context.

[戻り値]
If the function succeeds, the return value is the currently selected
pixel format index of the specified device context. This is a
positive, one-based index value. If the function fails, the return
value is zero. To get extended error information, call GetLastError.


%index
GetPolyFillMode
The GetPolyFillMode function retrieves the current polygon fill mode.
%group
Win32 gdi32
%prm
hdc
hdc : [intptr] Handle to the device context.
%inst
The GetPolyFillMode function retrieves the current polygon fill mode.

[戻り値]
If the function succeeds, the return value specifies the polygon fill
mode, which can be one of the following values.
This doc was truncated.


%index
GetROP2
The GetROP2 function retrieves the foreground mix mode of the specified device context. The mix mode specifies how the pen or interior color and the color already on the screen are combined to yield a new color.
%group
Win32 gdi32
%prm
hdc
hdc : [intptr] Handle to the device context.
%inst
The GetROP2 function retrieves the foreground mix mode of the
specified device context. The mix mode specifies how the pen or
interior color and the color already on the screen are combined to
yield a new color.

[戻り値]
If the function succeeds, the return value specifies the foreground
mix mode. If the function fails, the return value is zero.

[備考]
Following are the foreground mix modes.
This doc was truncated.


%index
GetRandomRgn
The GetRandomRgn function copies the system clipping region of a specified device context to a specific region.
%group
Win32 gdi32
%prm
hdc, hrgn, i
hdc : [intptr] A handle to the device context.
hrgn : [intptr] A handle to a region. Before the function is called, this identifies an existing region. After the function returns, this identifies a copy of the current system region. The old region identified by hrgn is overwritten.
i : [int] This parameter must be SYSRGN.
%inst
The GetRandomRgn function copies the system clipping region of a
specified device context to a specific region.

[戻り値]
If the function succeeds, the return value is 1. If the function
fails, the return value is -1. If the region to be retrieved is NULL,
the return value is 0. If the function fails or the region to be
retrieved is NULL, hrgn is not initialized.

[備考]
When using the SYSRGN flag, note that the system clipping region
might not be current because of window movements. Nonetheless, it is
safe to retrieve and use the system clipping region within the
BeginPaint-EndPaint block during WM_PAINT processing. In this case,
the system region is the intersection of the update region and the
current visible area of the window. Any window movement following the
return of GetRandomRgn and before EndPaint will result in a new
WM_PAINT message. Any other use of the SYSRGN flag may result in
painting errors in your application. The region returned is in screen
coordinates.


%index
GetRasterizerCaps
The GetRasterizerCaps function returns flags indicating whether TrueType fonts are installed in the system.
%group
Win32 gdi32
%prm
lpraststat, cjBytes
lpraststat : [var] A pointer to a RASTERIZER_STATUS structure that receives information about the rasterizer.
cjBytes : [int] The number of bytes to be copied into the structure pointed to by the lprs parameter.
%inst
The GetRasterizerCaps function returns flags indicating whether
TrueType fonts are installed in the system.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero.

[備考]
The GetRasterizerCaps function enables applications and printer
drivers to determine whether TrueType fonts are installed. If the
TT_AVAILABLE flag is set in the wFlags member of the
RASTERIZER_STATUS structure, at least one TrueType font is installed.
If the TT_ENABLED flag is set, TrueType is enabled for the system.
The actual number of bytes copied is either the member specified in
the cb parameter or the length of the RASTERIZER_STATUS structure,
whichever is less.


%index
GetRegionData
The GetRegionData function fills the specified buffer with data describing a region. This data includes the dimensions of the rectangles that make up the region.
%group
Win32 gdi32
%prm
hrgn, nCount, lpRgnData
hrgn : [intptr] A handle to the region.
nCount : [int] The size, in bytes, of the lpRgnData buffer.
lpRgnData : [var] A pointer to a RGNDATA structure that receives the information. The dimensions of the region are in logical units. If this parameter is NULL, the return value contains the number of bytes needed for the region data.
%inst
The GetRegionData function fills the specified buffer with data
describing a region. This data includes the dimensions of the
rectangles that make up the region.

[戻り値]
If the function succeeds and dwCount specifies an adequate number of
bytes, the return value is always dwCount. If dwCount is too small or
the function fails, the return value is 0. If lpRgnData is NULL, the
return value is the required number of bytes. If the function fails,
the return value is zero.

[備考]
The GetRegionData function is used in conjunction with the
ExtCreateRegion function.


%index
GetRgnBox
The GetRgnBox function retrieves the bounding rectangle of the specified region.
%group
Win32 gdi32
%prm
hrgn, lprc
hrgn : [intptr] A handle to the region.
lprc : [var] A pointer to a RECT structure that receives the bounding rectangle in logical units.
%inst
The GetRgnBox function retrieves the bounding rectangle of the
specified region.

[戻り値]
The return value specifies the region's complexity. It can be one of
the following values:
This doc was truncated.


%index
GetStockObject
ストックペン、ブラシ、フォント、パレットのいずれかへのハンドルを取得する。
%group
Win32 gdi32
%prm
i
i : [int] 
%inst
ストックペン、ブラシ、フォント、パレットのいずれかへのハンドルを取得する。

[戻り値]
関数が成功した場合、戻り値は要求した論理オブジェクトへのハンドル。失敗した場合は NULL。

[備考]
ダイアログやウィンドウで使用される現在のフォントを取得するのにこの関数を用いるのは推奨されない。代わりに
SystemParametersInfo を SPI_GETNONCLIENTMETRICS
で呼ぶこと。DKGRAY_BRUSH、GRAY_BRUSH、LTGRAY_BRUSH ストックオブジェクトは CS_HREDRAW と
CS_VREDRAW を持つウィンドウでのみ使用する。HOLLOW_BRUSH と NULL_BRUSH は同等。DeleteObject
でストックオブジェクトを削除する必要はない(害もない)。DC_BRUSH と DC_PEN は
SetDCBrushColor/SetDCPenColor と組み合わせて使える。


%index
GetStretchBltMode
The GetStretchBltMode function retrieves the current stretching mode. The stretching mode defines how color data is added to or removed from bitmaps that are stretched or compressed when the StretchBlt function is called.
%group
Win32 gdi32
%prm
hdc
hdc : [intptr] A handle to the device context.
%inst
The GetStretchBltMode function retrieves the current stretching mode.
The stretching mode defines how color data is added to or removed
from bitmaps that are stretched or compressed when the StretchBlt
function is called.

[戻り値]
If the function succeeds, the return value is the current stretching
mode. This can be one of the following values.
This doc was truncated.


%index
GetSystemPaletteEntries
The GetSystemPaletteEntries function retrieves a range of palette entries from the system palette that is associated with the specified device context (DC).
%group
Win32 gdi32
%prm
hdc, iStart, cEntries, pPalEntries
hdc : [intptr] A handle to the device context.
iStart : [int] The first entry to be retrieved from the system palette.
cEntries : [int] The number of entries to be retrieved from the system palette.
pPalEntries : [var] A pointer to an array of PALETTEENTRY structures to receive the palette entries. The array must contain at least as many structures as specified by the cEntries parameter. If this parameter is NULL, the function returns the total number of entries in the palette.
%inst
The GetSystemPaletteEntries function retrieves a range of palette
entries from the system palette that is associated with the specified
device context (DC).

[戻り値]
If the function succeeds, the return value is the number of entries
retrieved from the palette. If the function fails, the return value
is zero.

[備考]
An application can determine whether a device supports palette
operations by calling the GetDeviceCaps function and specifying the
RASTERCAPS constant.


%index
GetSystemPaletteUse
The GetSystemPaletteUse function retrieves the current state of the system (physical) palette for the specified device context (DC).
%group
Win32 gdi32
%prm
hdc
hdc : [intptr] A handle to the device context.
%inst
The GetSystemPaletteUse function retrieves the current state of the
system (physical) palette for the specified device context (DC).

[戻り値]
If the function succeeds, the return value is the current state of
the system palette. This parameter can be one of the following
values.
This doc was truncated.

[備考]
By default, the system palette contains 20 static colors that are not
changed when an application realizes its logical palette. An
application can gain access to most of these colors by calling the
SetSystemPaletteUse function. The device context identified by the
hdc parameter must represent a device that supports color palettes.
An application can determine whether a device supports color palettes
by calling the GetDeviceCaps function and specifying the RASTERCAPS
constant.


%index
GetTextAlign
The GetTextAlign function retrieves the text-alignment setting for the specified device context.
%group
Win32 gdi32
%prm
hdc
hdc : [intptr] A handle to the device context.
%inst
The GetTextAlign function retrieves the text-alignment setting for
the specified device context.

[戻り値]
If the function succeeds, the return value is the status of the
text-alignment flags. For more information about the return value,
see the Remarks section. The return value is a combination of the
following values.
This doc was truncated.

[備考]
The bounding rectangle is a rectangle bounding all of the character
cells in a string of text. Its dimensions can be obtained by calling
the GetTextExtentPoint32 function. The text-alignment flags determine
how the TextOut and ExtTextOut functions align a string of text in
relation to the string's reference point provided to TextOut or
ExtTextOut. The text-alignment flags are not necessarily single bit
flags and may be equal to zero. The flags must be examined in groups
of related flags, as shown in the following list.
This doc was truncated.


%index
GetTextCharacterExtra
The GetTextCharacterExtra function retrieves the current intercharacter spacing for the specified device context.
%group
Win32 gdi32
%prm
hdc
hdc : [intptr] Handle to the device context.
%inst
The GetTextCharacterExtra function retrieves the current
intercharacter spacing for the specified device context.

[戻り値]
If the function succeeds, the return value is the current
intercharacter spacing, in logical coordinates. If the function
fails, the return value is 0x8000000.

[備考]
The intercharacter spacing defines the extra space, in logical units
along the base line, that the TextOut or ExtTextOut functions add to
each character as a line is written. The spacing is used to expand
lines of text.


%index
GetTextCharset
Retrieves a character set identifier for the font that is currently selected into a specified device context.
%group
Win32 gdi32
%prm
hdc
hdc : [intptr] Handle to a device context. The function obtains a character set identifier for the font that is selected into this device context.
%inst
Retrieves a character set identifier for the font that is currently
selected into a specified device context.

[戻り値]
If successful, returns a value identifying the character set of the
font that is currently selected into the specified device context.
The following character set identifiers are defined: If the function
fails, it returns DEFAULT_CHARSET.


%index
GetTextCharsetInfo
Retrieves information about the character set of the font that is currently selected into a specified device context.
%group
Win32 gdi32
%prm
hdc, lpSig, dwFlags
hdc : [intptr] Handle to a device context. The function obtains information about the font that is selected into this device context.
lpSig : [var] Pointer to a FONTSIGNATURE data structure that receives font-signature information. If a TrueType font is currently selected into the device context, the FONTSIGNATURE structure receives information that identifies the code page and Unicode subranges for which the font provides glyphs. If a font other than TrueType is currently selected into the device context, the FONTSIGNATURE structure receives zeros. In this case, the application should use the TranslateCharsetInfo function to obtain generic font-signature information for the character set. The lpSig parameter specifies NULL if the application does not require the FONTSIGNATURE information. In this case, the application can also call the       GetTextCharset function, which is equivalent to calling       GetTextCharsetInfo with lpSig set to NULL.
dwFlags : [int] Reserved; must be set to 0.
%inst
Retrieves information about the character set of the font that is
currently selected into a specified device context.

[戻り値]
If successful, returns a value identifying the character set of the
font currently selected into the specified device context. The
following character set identifiers are defined: If the function
fails, the return value is DEFAULT_CHARSET.


%index
GetTextColor
The GetTextColor function retrieves the current text color for the specified device context.
%group
Win32 gdi32
%prm
hdc
hdc : [intptr] Handle to the device context.
%inst
The GetTextColor function retrieves the current text color for the
specified device context.

[戻り値]
If the function succeeds, the return value is the current text color
as a COLORREF value. If the function fails, the return value is
CLR_INVALID. No extended error information is available.

[備考]
The text color defines the foreground color of characters drawn by
using the TextOut or ExtTextOut function.


%index
GetTextExtentExPointW
The GetTextExtentExPoint function retrieves the number of characters in a specified string that will fit within a specified space and fills an array with the text extent for each of those characters. (Unicode)
%group
Win32 gdi32
%prm
hdc, lpszString, cchString, nMaxExtent, lpnFit, lpnDx, lpSize
hdc : [intptr] A handle to the device context.
lpszString : [wstr] A pointer to the null-terminated string for which extents are to be retrieved.
cchString : [int] The number of characters in the string pointed to by the lpszStr parameter. For an ANSI call it specifies the string length in bytes and for a Unicode it specifies the string length in WORDs. Note that for the ANSI function, characters in SBCS code pages take one byte each, while most characters in DBCS code pages take two bytes; for the Unicode function, most currently defined Unicode characters (those in the Basic Multilingual Plane (BMP)) are one WORD while Unicode surrogates are two WORDs.
nMaxExtent : [int] The maximum allowable width, in logical units, of the formatted string.
lpnFit : [var] A pointer to an integer that receives a count of the maximum number of characters that will fit in the space specified by the nMaxExtent parameter. When the lpnFit parameter is NULL, the nMaxExtent parameter is ignored.
lpnDx : [var] A pointer to an array of integers that receives partial string extents. Each element in the array gives the distance, in logical units, between the beginning of the string and one of the characters that fits in the space specified by the nMaxExtent parameter. This array must have at least as many elements as characters specified by the cchString parameter because the entire array is used internally. The function fills the array with valid extents for as many characters as are specified by the lpnFit parameter. Any values in the rest of the array should be ignored. If alpDx is NULL, the function does not compute partial string widths. For complex scripts, where a sequence of characters may be represented by any number of glyphs, the values in the alpDx array up to the number specified by the lpnFit parameter match one-to-one with code points. Again, you should ignore the rest of the values in the alpDx array.
lpSize : [var] A pointer to a SIZE structure that receives the dimensions of the string, in logical units. This parameter cannot be NULL.
%inst
The GetTextExtentExPoint function retrieves the number of characters
in a specified string that will fit within a specified space and
fills an array with the text extent for each of those characters.
(Unicode)

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero.

[備考]
If both the lpnFit and alpDx parameters are NULL, calling the
GetTextExtentExPoint function is equivalent to calling the
GetTextExtentPoint function. For the ANSI version of
GetTextExtentExPoint, the lpDx array has the same number of INT
values as there are bytes in lpString. The INT values that correspond
to the two bytes of a DBCS character are each the extent of the
entire composite character. Note, the alpDx values for
GetTextExtentExPoint are not the same as the lpDx values for
ExtTextOut. To use the alpDx values in lpDx, you must first process
them. When this function returns the text extent, it assumes that the
text is horizontal, that is, that the escapement is always 0. This is
true for both the horizontal and vertical measurements of the text.
Even if you use a font that specifies a nonzero escapement, this
function doesn't use the angle while it computes the text extent. The
app must convert it explicitly. However, when the graphics mode is
set to GM_ADVANCED and the character orientation is 90 degrees from
the print orientation, the values that this function return do not
follow this rule. When the character orientation and the print
orientation match for a given string, this function returns the
dimensions of the string in the SIZE structure as { cx : 116, cy : 18
}. When the character orientation and the print orientation are 90
degrees apart for the same string, this function returns the
dimensions of the string in the SIZE structure as { cx : 18, cy : 116
}. This function returns the extent of each successive character in a
string. When these are rounded to logical units, you get different
results than what is returned from the GetCharWidth, which returns
the width of each individual character rounded to logical units.
> [!NOTE] > The wingdi.h header defines GetTextExtentExPoint as an
alias which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
GetTextExtentExPointI
The GetTextExtentExPointI function retrieves the number of characters in a specified string that will fit within a specified space and fills an array with the text extent for each of those characters.
%group
Win32 gdi32
%prm
hdc, lpwszString, cwchString, nMaxExtent, lpnFit, lpnDx, lpSize
hdc : [intptr] A handle to the device context.
lpwszString : [var] A pointer to an array of glyph indices for which extents are to be retrieved.
cwchString : [int] The number of glyphs in the array pointed to by the pgiIn parameter.
nMaxExtent : [int] The maximum allowable width, in logical units, of the formatted string.
lpnFit : [var] A pointer to an integer that receives a count of the maximum number of characters that will fit in the space specified by the nMaxExtent parameter. When the lpnFit parameter is NULL, the nMaxExtent parameter is ignored.
lpnDx : [var] A pointer to an array of integers that receives partial glyph extents. Each element in the array gives the distance, in logical units, between the beginning of the glyph indices array and one of the glyphs that fits in the space specified by the nMaxExtent parameter. Although this array should have at least as many elements as glyph indices specified by the cgi parameter, the function fills the array with extents only for as many glyph indices as are specified by the lpnFit parameter. If lpnFit is NULL, the function does not compute partial string widths.
lpSize : [var] A pointer to a SIZE structure that receives the dimensions of the glyph indices array, in logical units. This value cannot be NULL.
%inst
The GetTextExtentExPointI function retrieves the number of characters
in a specified string that will fit within a specified space and
fills an array with the text extent for each of those characters.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero.

[備考]
If both the lpnFit and alpDx parameters are NULL, calling the
GetTextExtentExPointI function is equivalent to calling the
GetTextExtentPointI function. When this function returns the text
extent, it assumes that the text is horizontal, that is, that the
escapement is always 0. This is true for both the horizontal and
vertical measurements of the text. Even if you use a font that
specifies a nonzero escapement, this function doesn't use the angle
while it computes the text extent. The app must convert it
explicitly. However, when the graphics mode is set to GM_ADVANCED and
the character orientation is 90 degrees from the print orientation,
the values that this function return do not follow this rule. When
the character orientation and the print orientation match for a given
string, this function returns the dimensions of the string in the
SIZE structure as { cx : 116, cy : 18 }. When the character
orientation and the print orientation are 90 degrees apart for the
same string, this function returns the dimensions of the string in
the SIZE structure as { cx : 18, cy : 116 }.


%index
GetTextExtentPointW
The GetTextExtentPoint function computes the width and height of the specified string of text. (Unicode)
%group
Win32 gdi32
%prm
hdc, lpString, c, lpsz
hdc : [intptr] A handle to the device context.
lpString : [wstr] A pointer to the string that specifies the text. The string does not need to be zero-terminated, since cbString specifies the length of the string.
c : [int] The length of the string pointed to by lpString.
lpsz : [var] A pointer to a SIZE structure that receives the dimensions of the string, in logical units.
%inst
The GetTextExtentPoint function computes the width and height of the
specified string of text. (Unicode)

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero.

[備考]
The GetTextExtentPoint function uses the currently selected font to
compute the dimensions of the string. The width and height, in
logical units, are computed without considering any clipping. Also,
this function assumes that the text is horizontal, that is, that the
escapement is always 0. This is true for both the horizontal and
vertical measurements of the text. Even if using a font specifying a
nonzero escapement, this function will not use the angle while
computing the text extent. The application must convert it
explicitly. Because some devices kern characters, the sum of the
extents of the characters in a string may not be equal to the extent
of the string. The calculated string width takes into account the
intercharacter spacing set by the SetTextCharacterExtra function.
> [!NOTE] > The wingdi.h header defines GetTextExtentPoint as an
alias which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
GetTextExtentPoint32A
The GetTextExtentPoint32 function computes the width and height of the specified string of text. (ANSI)
%group
Win32 gdi32
%prm
hdc, lpString, c, psizl
hdc : [intptr] A handle to the device context.
lpString : [str] A pointer to a buffer that specifies the text string. The string does not need to be null-terminated, because the c parameter specifies the length of the string.
c : [int] The length of the string pointed to by lpString.
psizl : [var] A pointer to a SIZE structure that receives the dimensions of the string, in logical units.
%inst
The GetTextExtentPoint32 function computes the width and height of
the specified string of text. (ANSI)

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero.

[備考]
The GetTextExtentPoint32 function uses the currently selected font to
compute the dimensions of the string. The width and height, in
logical units, are computed without considering any clipping. Because
some devices kern characters, the sum of the extents of the
characters in a string may not be equal to the extent of the string.
The calculated string width takes into account the intercharacter
spacing set by the SetTextCharacterExtra function and the
justification set by SetTextJustification. This is true for both
displaying on a screen and for printing. However, if lpDx is set in
ExtTextOut, GetTextExtentPoint32 does not take into account either
intercharacter spacing or justification. In addition, for EMF, the
print result always takes both intercharacter spacing and
justification into account. When dealing with text displayed on a
screen, the calculated string width takes into account the
intercharacter spacing set by the SetTextCharacterExtra function and
the justification set by SetTextJustification. However, if lpDx is
set in ExtTextOut, GetTextExtentPoint32 does not take into account
either intercharacter spacing or justification. However, when
printing with EMF:
This doc was truncated.


%index
GetTextExtentPoint32W
指定した文字列の幅と高さを計算する。(Unicode)
%group
Win32 gdi32
%prm
hdc, lpString, c, psizl
hdc : [intptr] デバイスコンテキストへのハンドル。
lpString : [wstr] テキスト文字列を指定するバッファへのポインタ。c でサイズを指定するため NULL 終端である必要はない。
c : [int] lpString が指す文字列の長さ。
psizl : [var] 文字列の寸法(論理単位)を受け取る SIZE 構造体へのポインタ。
%inst
指定した文字列の幅と高さを計算する。(Unicode)

[戻り値]
関数が成功した場合、戻り値は 0 以外。失敗した場合は 0。

[備考]
GetTextExtentPoint32
は現在選択されているフォントを使用して文字列の寸法を計算する。幅と高さはクリッピングを考慮せずに計算される。一部のデバイスは文字詰めを行うため、文字ごとの幅の合計と文字列全体の幅は一致しない場合がある。計算される文字列幅は
SetTextCharacterExtra で設定された文字間スペーシングと SetTextJustification
で設定されたジャスティフィケーションを考慮する。
（以下省略）


%index
GetTextExtentPointI
The GetTextExtentPointI function computes the width and height of the specified array of glyph indices.
%group
Win32 gdi32
%prm
hdc, pgiIn, cgi, psize
hdc : [intptr] Handle to the device context.
pgiIn : [var] Pointer to array of glyph indices.
cgi : [int] Specifies the number of glyph indices.
psize : [var] Pointer to a SIZE structure that receives the dimensions of the string, in logical units.
%inst
The GetTextExtentPointI function computes the width and height of the
specified array of glyph indices.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero.

[備考]
The GetTextExtentPointI function uses the currently selected font to
compute the dimensions of the array of glyph indices. The width and
height, in logical units, are computed without considering any
clipping. When this function returns the text extent, it assumes that
the text is horizontal, that is, that the escapement is always 0.
This is true for both the horizontal and vertical measurements of the
text. Even if you use a font that specifies a nonzero escapement,
this function doesn't use the angle while it computes the text
extent. The app must convert it explicitly. However, when the
graphics mode is set to GM_ADVANCED and the character orientation is
90 degrees from the print orientation, the values that this function
return do not follow this rule. When the character orientation and
the print orientation match for a given string, this function returns
the dimensions of the string in the SIZE structure as { cx : 116, cy
: 18 }. When the character orientation and the print orientation are
90 degrees apart for the same string, this function returns the
dimensions of the string in the SIZE structure as { cx : 18, cy : 116
}. Because some devices kern characters, the sum of the extents of
the individual glyph indices may not be equal to the extent of the
entire array of glyph indices. The calculated string width takes into
account the intercharacter spacing set by the SetTextCharacterExtra
function.


%index
GetTextFaceW
The GetTextFace function retrieves the typeface name of the font that is selected into the specified device context. (Unicode)
%group
Win32 gdi32
%prm
hdc, c, lpName
hdc : [intptr] A handle to the device context.
c : [int] The length of the buffer pointed to by lpFaceName. For the ANSI function it is a BYTE count and for the Unicode function it is a WORD count. Note that for the ANSI function, characters in SBCS code pages take one byte each, while most characters in DBCS code pages take two bytes; for the Unicode function, most currently defined Unicode characters (those in the Basic Multilingual Plane (BMP)) are one WORD while Unicode surrogates are two WORDs.
lpName : [wstr] A pointer to the buffer that receives the typeface name. If this parameter is NULL, the function returns the number of characters in the name, including the terminating null character.
%inst
The GetTextFace function retrieves the typeface name of the font that
is selected into the specified device context. (Unicode)

[戻り値]
If the function succeeds, the return value is the number of
characters copied to the buffer. If the function fails, the return
value is zero.

[備考]
The typeface name is copied as a null-terminated character string. If
the name is longer than the number of characters specified by the
nCount parameter, the name is truncated.
> [!NOTE] > The wingdi.h header defines GetTextFace as an alias which
automatically selects the ANSI or Unicode version of this function
based on the definition of the UNICODE preprocessor constant. Mixing
usage of the encoding-neutral alias with code that not
encoding-neutral can lead to mismatches that result in compilation or
runtime errors. For more information, see [Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
GetTextMetricsW
現在選択されているフォントのメトリックを指定バッファに格納する。(Unicode)
%group
Win32 gdi32
%prm
hdc, lptm
hdc : [intptr] デバイスコンテキストへのハンドル。
lptm : [var] テキストメトリックを受け取る TEXTMETRIC 構造体へのポインタ。
%inst
現在選択されているフォントのメトリックを指定バッファに格納する。(Unicode)

[戻り値]
関数が成功した場合、戻り値は 0 以外。失敗した場合は 0。

[備考]
フォントが TrueType フォントかを判定するには、DC に選択した後 GetTextMetrics
を呼び、TEXTMETRIC.tmPitchAndFamily の TMPF_TRUETYPE を確認する。GetDC が返す DC
は初期化されておらず、既定で "System" (ビットマップフォント)が選択されているため、DC にフォントを選択する必要がある。


%index
GetViewportExtEx
The GetViewportExtEx function retrieves the x-extent and y-extent of the current viewport for the specified device context.
%group
Win32 gdi32
%prm
hdc, lpsize
hdc : [intptr] A handle to the device context.
lpsize : [var] A pointer to a SIZE structure that receives the x- and y-extents, in device units.
%inst
The GetViewportExtEx function retrieves the x-extent and y-extent of
the current viewport for the specified device context.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero.


%index
GetViewportOrgEx
The GetViewportOrgEx function retrieves the x-coordinates and y-coordinates of the viewport origin for the specified device context.
%group
Win32 gdi32
%prm
hdc, lppoint
hdc : [intptr] A handle to the device context.
lppoint : [var] A pointer to a POINT structure that receives the coordinates of the origin, in device units.
%inst
The GetViewportOrgEx function retrieves the x-coordinates and
y-coordinates of the viewport origin for the specified device
context.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero.


%index
GetWinMetaFileBits
The GetWinMetaFileBits function converts the enhanced-format records from a metafile into Windows-format records and stores the converted records in the specified buffer.
%group
Win32 gdi32
%prm
hemf, cbData16, pData16, iMapMode, hdcRef
hemf : [intptr] A handle to the enhanced metafile.
cbData16 : [int] The size, in bytes, of the buffer into which the converted records are to be copied.
pData16 : [var] A pointer to the buffer that receives the converted records. If lpbBuffer is NULL, GetWinMetaFileBits returns the number of bytes required to store the converted metafile records.
iMapMode : [int] The mapping mode to use in the converted metafile.
hdcRef : [intptr] A handle to the reference device context.
%inst
The GetWinMetaFileBits function converts the enhanced-format records
from a metafile into Windows-format records and stores the converted
records in the specified buffer.

[戻り値]
If the function succeeds and the buffer pointer is NULL, the return
value is the number of bytes required to store the converted records;
if the function succeeds and the buffer pointer is a valid pointer,
the return value is the size of the metafile data in bytes. If the
function fails, the return value is zero.

[備考]
This function converts an enhanced metafile into a Windows-format
metafile so that its picture can be displayed in an application that
recognizes the older format. The system uses the reference device
context to determine the resolution of the converted metafile. The
GetWinMetaFileBits function does not invalidate the enhanced metafile
handle. An application should call the DeleteEnhMetaFile function to
release the handle when it is no longer needed. To create a scalable
Windows-format metafile, specify MM_ANISOTROPIC as the fnMapMode
parameter. The upper-left corner of the metafile picture is always
mapped to the origin of the reference device.


%index
GetWindowExtEx
This function retrieves the x-extent and y-extent of the window for the specified device context.
%group
Win32 gdi32
%prm
hdc, lpsize
hdc : [intptr] A handle to the device context.
lpsize : [var] A pointer to a SIZE structure that receives the x- and y-extents in page-space units, that is, logical units.
%inst
This function retrieves the x-extent and y-extent of the window for
the specified device context.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero.


%index
GetWindowOrgEx
The GetWindowOrgEx function retrieves the x-coordinates and y-coordinates of the window origin for the specified device context.
%group
Win32 gdi32
%prm
hdc, lppoint
hdc : [intptr] A handle to the device context.
lppoint : [var] A pointer to a POINT structure that receives the coordinates, in logical units, of the window origin.
%inst
The GetWindowOrgEx function retrieves the x-coordinates and
y-coordinates of the window origin for the specified device context.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero.


%index
GetWorldTransform
The GetWorldTransform function retrieves the current world-space to page-space transformation.
%group
Win32 gdi32
%prm
hdc, lpxf
hdc : [intptr] A handle to the device context.
lpxf : [var] A pointer to an XFORM structure that receives the current world-space to page-space transformation.
%inst
The GetWorldTransform function retrieves the current world-space to
page-space transformation.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero.

[備考]
The precision of the transformation may be altered if an application
calls the ModifyWorldTransform function prior to calling
GetWorldTransform. (This is because the internal format for storing
transformation values uses a higher precision than a FLOAT value.)


%index
HT_Get8BPPFormatPalette
The HT_Get8BPPFormatPalette function returns a halftone palette for use on standard 8-bits per pixel device types.
%group
Win32 gdi32
%prm
pPaletteEntry, RedGamma, GreenGamma, BlueGamma
pPaletteEntry : [var] Pointer to an array of PALETTEENTRY structures (described in the Microsoft Windows SDK documentation). When this pointer is not NULL, GDI assumes that it points to valid memory space in which GDI can place the entire 8-bits per pixel halftone palette.
RedGamma : [int] Specifies the red, green, and blue gamma value. This USHORT value is interpreted as a real number whose four least-significant digits are to the right of the (implied) decimal point. For example, a gamma value of 10000 represents the real number 1.0000, and 12345 represents 1.2345. The minimum gamma value allowed is 0.0000, and the maximum allowable value is 6.5535.
GreenGamma : [int] Specifies the red, green, and blue gamma value. This USHORT value is interpreted as a real number whose four least-significant digits are to the right of the (implied) decimal point. For example, a gamma value of 10000 represents the real number 1.0000, and 12345 represents 1.2345. The minimum gamma value allowed is 0.0000, and the maximum allowable value is 6.5535.
BlueGamma : [int] Specifies the red, green, and blue gamma value. This USHORT value is interpreted as a real number whose four least-significant digits are to the right of the (implied) decimal point. For example, a gamma value of 10000 represents the real number 1.0000, and 12345 represents 1.2345. The minimum gamma value allowed is 0.0000, and the maximum allowable value is 6.5535.
%inst
The HT_Get8BPPFormatPalette function returns a halftone palette for
use on standard 8-bits per pixel device types.

[戻り値]
If pPaletteEntry is not NULL, the return value is the number of
PALETTEENTRY structures that GDI filled in starting at the memory
location pointed to by pPaletteEntry. If pPaletteEntry is NULL, the
return value is the total count of PALETTEENTRY structures required
to store the 8-bits per pixel halftone palette.

[備考]
HT_Get8BPPFormatPalette is a halftone-related GDI service that
drivers can use to acquire the system's standard 8-bits per pixel
halftone palette.


%index
HT_Get8BPPMaskPalette
The HT_Get8BPPMaskPalette function returns a mask palette for an 8-bits-per-pixel device type.
%group
Win32 gdi32
%prm
pPaletteEntry, Use8BPPMaskPal, CMYMask, RedGamma, GreenGamma, BlueGamma
pPaletteEntry : [var] Pointer to the array of PALETTEENTRY structures (described in the Windows SDK documentation) to be filled in. GDI assumes that it points to valid memory space in which GDI can place the entire 8-bit-per-pixel halftone palette. For a driver that runs on Windows XP and later operating system versions, GDI checks pPaletteEntry[0] to determine how to return the composed CMY palette. If pPaletteEntry[0] is set to 'RGB0', the palette will be in one of the CMY_INVERTED modes and will have its indexes inverted. That is, index 0 in the palette is black, and index 255 is white. If pPaletteEntry[0] is not set to 'RGB0', the palette is a normal CMY palette, with index 0 being white and index 255 being black. See Using GDI 8-Bit-Per-Pixel CMY Mask Modes for new requirements and details on how to use this parameter. Windows 2000 ignores any value the driver places in pPaletteEntry[0]. For this reason, if your driver is intended to run on Windows 2000 and on Windows XP or later versions, and your driver sets pPaletteEntry[0] to 'RGB0', the bitmaps your driver receives from Windows XP and later might have their colors inverted, relative to those received from Windows 2000. Therefore, such a driver must examine the palette before downloading a bitmap.
Use8BPPMaskPal : [int] Indicates which type of palette should be returned. When Use8BPPMaskPal is TRUE, HT_Get8BPPMaskPalette sets the pPaletteEntry parameter with the address of a CMY palette (an array of PALETTEENTRY structures) that is described by the bitmask specified in CMYMask. When Use8BPPMaskPal is FALSE, the function sets pPaletteEntry with the address of a standard RGB 8-bit-per-pixel halftone palette.
CMYMask : [int] 
RedGamma : [int] If Use8BPPMaskPal is TRUE, the value of this parameter is  not used. In that case, gamma values will be specified in the ciDevice member of the GDIINFO structure. If Use8BPPMaskPal is FALSE, the value of this parameter specifies the red gamma value, out of the red, green and blue gamma values that GDI is to use to gamma-correct the palette. The USHORT value is interpreted as a real number whose four least-significant digits are to the right of the decimal point. For example, a gamma value of 10000 represents the real number 1.0000, and 12345 represents 1.2345. The minimum gamma value allowed is 0.0000, and the maximum allowable value is 6.5535.
GreenGamma : [int] If Use8BPPMaskPal is TRUE, the value of this parameter is  not used. In that case, gamma values will be specified in the ciDevice member of the GDIINFO structure. If Use8BPPMaskPal is FALSE, the value of this parameter specifies the green gamma value, out of the red, green and blue gamma values that GDI is to use to gamma-correct the palette. The USHORT value is interpreted as a real number whose four least-significant digits are to the right of the decimal point. For example, a gamma value of 10000 represents the real number 1.0000, and 12345 represents 1.2345. The minimum gamma value allowed is 0.0000, and the maximum allowable value is 6.5535.
BlueGamma : [int] If Use8BPPMaskPal is TRUE, the value of this parameter is  not used. In that case, gamma values will be specified in the ciDevice member of the GDIINFO structure. If Use8BPPMaskPal is FALSE, the value of this parameter specifies the blue gamma value, out of the red, green and blue gamma values that GDI is to use to gamma-correct the palette. The USHORT value is interpreted as a real number whose four least-significant digits are to the right of the decimal point. For example, a gamma value of 10000 represents the real number 1.0000, and 12345 represents 1.2345. The minimum gamma value allowed is 0.0000, and the maximum allowable value is 6.5535.
%inst
The HT_Get8BPPMaskPalette function returns a mask palette for an
8-bits-per-pixel device type.

[戻り値]
If pPaletteEntry is not NULL, HT_Get8BPPMaskPalette returns the
number of PALETTEENTRY structures that GDI filled out in the array to
which pPaletteEntry points. If pPaletteEntry is NULL, the value
returned is the total count of PALETTEENTRY structures required to
store the halftone palette. If an illegal value of the CMYMask
parameter is used in the call to this function, HT_Get8BPPMaskPalette
returns a value of zero.

[備考]
The PALETTEENTRY structure is documented in the Windows SDK
documentation. Calling HT_Get8BPPMaskPalette with Use8BPPMaskPal set
FALSE is equivalent to calling HT_Get8BPPFormatPalette. See Using GDI
8-Bit-Per-Pixel CMY Mask Modes for more information about this
function and how its parameters are used.


%index
IntersectClipRect
The IntersectClipRect function creates a new clipping region from the intersection of the current clipping region and the specified rectangle.
%group
Win32 gdi32
%prm
hdc, left, top, right, bottom
hdc : [intptr] A handle to the device context.
left : [int] The x-coordinate, in logical units, of the upper-left corner of the rectangle.
top : [int] The y-coordinate, in logical units, of the upper-left corner of the rectangle.
right : [int] The x-coordinate, in logical units, of the lower-right corner of the rectangle.
bottom : [int] The y-coordinate, in logical units, of the lower-right corner of the rectangle.
%inst
The IntersectClipRect function creates a new clipping region from the
intersection of the current clipping region and the specified
rectangle.

[戻り値]
The return value specifies the new clipping region's type and can be
one of the following values.
This doc was truncated.

[備考]
The lower and right-most edges of the given rectangle are excluded
from the clipping region. If a clipping region does not already exist
then the system may apply a default clipping region to the specified
HDC. A clipping region is then created from the intersection of that
default clipping region and the rectangle specified in the function
parameters.


%index
InvertRgn
The InvertRgn function inverts the colors in the specified region.
%group
Win32 gdi32
%prm
hdc, hrgn
hdc : [intptr] Handle to the device context.
hrgn : [intptr] Handle to the region for which colors are inverted. The region's coordinates are presumed to be logical coordinates.
%inst
The InvertRgn function inverts the colors in the specified region.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero.

[備考]
On monochrome screens, the InvertRgn function makes white pixels
black and black pixels white. On color screens, this inversion is
dependent on the type of technology used to generate the colors for
the screen.


%index
LPtoDP
The LPtoDP function converts logical coordinates into device coordinates. The conversion depends on the mapping mode of the device context, the settings of the origins and extents for the window and viewport, and the world transformation.
%group
Win32 gdi32
%prm
hdc, lppt, c
hdc : [intptr] A handle to the device context.
lppt : [var] A pointer to an array of POINT structures. The x-coordinates and y-coordinates contained in each of the POINT structures will be transformed.
c : [int] The number of points in the array.
%inst
The LPtoDP function converts logical coordinates into device
coordinates. The conversion depends on the mapping mode of the device
context, the settings of the origins and extents for the window and
viewport, and the world transformation.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero.

[備考]
The LPtoDP function fails if the logical coordinates exceed 32 bits,
or if the converted device coordinates exceed 27 bits. In the case of
such an overflow, the results for all the points are undefined.
LPtoDP calculates complex floating-point arithmetic, and it has a
caching system for efficiency. Therefore, the conversion result of an
initial call to LPtoDP might not exactly match the conversion result
of a later call to LPtoDP. We recommend not to write code that relies
on the exact match of the conversion results from multiple calls to
LPtoDP even if the parameters that are passed to each call are
identical.


%index
LineDDA
The LineDDA function determines which pixels should be highlighted for a line defined by the specified starting and ending points.
%group
Win32 gdi32
%prm
xStart, yStart, xEnd, yEnd, lpProc, data
xStart : [int] Specifies the x-coordinate, in logical units, of the line's starting point.
yStart : [int] Specifies the y-coordinate, in logical units, of the line's starting point.
xEnd : [int] Specifies the x-coordinate, in logical units, of the line's ending point.
yEnd : [int] Specifies the y-coordinate, in logical units, of the line's ending point.
lpProc : [int] Pointer to an application-defined callback function. For more information, see the LineDDAProc callback function.
data : [intptr] Pointer to the application-defined data.
%inst
The LineDDA function determines which pixels should be highlighted
for a line defined by the specified starting and ending points.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero.

[備考]
The LineDDA function passes the coordinates for each point along the
line, except for the line's ending point, to the application-defined
callback function. In addition to passing the coordinates of a point,
this function passes any existing application-defined data. The
coordinates passed to the callback function match pixels on a video
display only if the default transformations and mapping modes are
used.


%index
LineTo
現在位置から指定された点の直前までの直線を描画する。
%group
Win32 gdi32
%prm
hdc, x, y
hdc : [intptr] デバイスコンテキストへのハンドル。
x : [int] 線の終点の x 座標(論理単位)。
y : [int] 線の終点の y 座標(論理単位)。
%inst
現在位置から指定された点の直前までの直線を描画する。

[戻り値]
関数が成功した場合、戻り値は 0 以外。失敗した場合は 0。

[備考]
線は現在のペンを使用して描画される(ペンがジオメトリックペンの場合は現在のブラシも使用)。LineTo
が成功すると、現在位置は指定された終点に設定される。


%index
MaskBlt
The MaskBlt function combines the color data for the source and destination bitmaps using the specified mask and raster operation.
%group
Win32 gdi32
%prm
hdcDest, xDest, yDest, width, height, hdcSrc, xSrc, ySrc, hbmMask, xMask, yMask, rop
hdcDest : [intptr] A handle to the destination device context.
xDest : [int] The x-coordinate, in logical units, of the upper-left corner of the destination rectangle.
yDest : [int] The y-coordinate, in logical units, of the upper-left corner of the destination rectangle.
width : [int] The width, in logical units, of the destination rectangle and source bitmap.
height : [int] The height, in logical units, of the destination rectangle and source bitmap.
hdcSrc : [intptr] A handle to the device context from which the bitmap is to be copied. It must be zero if the dwRop parameter specifies a raster operation that does not include a source.
xSrc : [int] The x-coordinate, in logical units, of the upper-left corner of the source bitmap.
ySrc : [int] The y-coordinate, in logical units, of the upper-left corner of the source bitmap.
hbmMask : [intptr] A handle to the monochrome mask bitmap combined with the color bitmap in the source device context.
xMask : [int] The horizontal pixel offset for the mask bitmap specified by the hbmMask parameter.
yMask : [int] The vertical pixel offset for the mask bitmap specified by the hbmMask parameter.
rop : [int] The foreground and background ternary raster operation codes (ROPs) that the function uses to control the combination of source and destination data. The background raster operation code is stored in the high-order byte of the high-order word of this value; the foreground raster operation code is stored in the low-order byte of the high-order word of this value; the low-order word of this value is ignored, and should be zero. The macro MAKEROP4 creates such combinations of foreground and background raster operation codes. For a discussion of foreground and background in the context of this function, see the following Remarks section. For a list of common raster operation codes (ROPs), see the BitBlt function. Note that the CAPTUREBLT ROP generally cannot be used for printing device contexts.
%inst
The MaskBlt function combines the color data for the source and
destination bitmaps using the specified mask and raster operation.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero.

[備考]
The MaskBlt function uses device-dependent bitmaps. A value of 1 in
the mask specified by hbmMask indicates that the foreground raster
operation code specified by dwRop should be applied at that location.
A value of 0 in the mask indicates that the background raster
operation code specified by dwRop should be applied at that location.
If the raster operations require a source, the mask rectangle must
cover the source rectangle. If it does not, the function will fail.
If the raster operations do not require a source, the mask rectangle
must cover the destination rectangle. If it does not, the function
will fail. If a rotation or shear transformation is in effect for the
source device context when this function is called, an error occurs.
However, other types of transformation are allowed. If the color
formats of the source, pattern, and destination bitmaps differ, this
function converts the pattern or source format, or both, to match the
destination format. If the mask bitmap is not a monochrome bitmap, an
error occurs. When an enhanced metafile is being recorded, an error
occurs (and the function returns FALSE) if the source device context
identifies an enhanced-metafile device context. Not all devices
support the MaskBlt function. An application should call the
GetDeviceCaps function with the nIndex parameter as RC_BITBLT to
determine whether a device supports this function. If no mask bitmap
is supplied, this function behaves exactly like BitBlt, using the
foreground raster operation code. ICM: No color management is
performed when blits occur. When used in a multiple monitor system,
both hdcSrc and hdcDest must refer to the same device or the function
will fail. To transfer data between DCs for different devices,
convert the memory bitmap (compatible bitmap, or DDB) to a DIB by
calling GetDIBits. To display the DIB to the second device, call
SetDIBits or StretchDIBits.


%index
ModifyWorldTransform
The ModifyWorldTransform function changes the world transformation for a device context using the specified mode.
%group
Win32 gdi32
%prm
hdc, lpxf, mode
hdc : [intptr] A handle to the device context.
lpxf : [var] A pointer to an XFORM structure used to modify the world transformation for the given device context.
mode : [int] 
%inst
The ModifyWorldTransform function changes the world transformation
for a device context using the specified mode.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero.

[備考]
The ModifyWorldTransform function will fail unless graphics mode for
the specified device context has been set to GM_ADVANCED by
previously calling the SetGraphicsMode function. Likewise, it will
not be possible to reset the graphics mode for the device context to
the default GM_COMPATIBLE mode, unless world transform has first been
reset to the default identity transform by calling SetWorldTransform
or ModifyWorldTransform.


%index
MoveToEx
現在位置を指定された点に更新し、オプションで前の位置を返す。
%group
Win32 gdi32
%prm
hdc, x, y, lppt
hdc : [intptr] デバイスコンテキストへのハンドル。
x : [int] 新しい位置の x 座標(論理単位)。
y : [int] 新しい位置の y 座標(論理単位)。
lppt : [var] 前の現在位置を受け取る POINT 構造体へのポインタ。NULL の場合、前の位置は返されない。
%inst
現在位置を指定された点に更新し、オプションで前の位置を返す。

[戻り値]
関数が成功した場合、戻り値は 0 以外。失敗した場合は 0。

[備考]
MoveToEx はすべての描画関数に影響する。


%index
OffsetClipRgn
The OffsetClipRgn function moves the clipping region of a device context by the specified offsets.
%group
Win32 gdi32
%prm
hdc, x, y
hdc : [intptr] A handle to the device context.
x : [int] The number of logical units to move left or right.
y : [int] The number of logical units to move up or down.
%inst
The OffsetClipRgn function moves the clipping region of a device
context by the specified offsets.

[戻り値]
The return value specifies the new region's complexity and can be one
of the following values.
This doc was truncated.


%index
OffsetRgn
The OffsetRgn function moves a region by the specified offsets.
%group
Win32 gdi32
%prm
hrgn, x, y
hrgn : [intptr] Handle to the region to be moved.
x : [int] Specifies the number of logical units to move left or right.
y : [int] Specifies the number of logical units to move up or down.
%inst
The OffsetRgn function moves a region by the specified offsets.

[戻り値]
The return value specifies the new region's complexity. It can be one
of the following values.
This doc was truncated.


%index
OffsetViewportOrgEx
The OffsetViewportOrgEx function modifies the viewport origin for a device context using the specified horizontal and vertical offsets.
%group
Win32 gdi32
%prm
hdc, x, y, lppt
hdc : [intptr] A handle to the device context.
x : [int] The horizontal offset, in device units.
y : [int] The vertical offset, in device units.
lppt : [var] A pointer to a POINT structure. The previous viewport origin, in device units, is placed in this structure. If lpPoint is NULL, the previous viewport origin is not returned.
%inst
The OffsetViewportOrgEx function modifies the viewport origin for a
device context using the specified horizontal and vertical offsets.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero.

[備考]
The new origin is the sum of the current origin and the horizontal
and vertical offsets.


%index
OffsetWindowOrgEx
The OffsetWindowOrgEx function modifies the window origin for a device context using the specified horizontal and vertical offsets.
%group
Win32 gdi32
%prm
hdc, x, y, lppt
hdc : [intptr] A handle to the device context.
x : [int] The horizontal offset, in logical units.
y : [int] The vertical offset, in logical units.
lppt : [var] A pointer to a POINT structure. The logical coordinates of the previous window origin are placed in this structure. If lpPoint is NULL, the previous origin is not returned.
%inst
The OffsetWindowOrgEx function modifies the window origin for a
device context using the specified horizontal and vertical offsets.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero.


%index
PATHOBJ_bEnum
The PATHOBJ_bEnum function retrieves the next PATHDATA record from a specified path and enumerates the curves in the path.
%group
Win32 gdi32
%prm
ppo, ppd
ppo : [var] Pointer to a PATHOBJ structure whose curves and/or lines are to be enumerated.
ppd : [var] Pointer to a PATHDATA structure that is to be filled.
%inst
The PATHOBJ_bEnum function retrieves the next PATHDATA record from a
specified path and enumerates the curves in the path.

[戻り値]
The return value is TRUE if the specified path contains more PATHDATA
records, indicating that this service should be called again.
Otherwise, if the output is the last PATHDATA record in the path, the
return value is FALSE.

[備考]
PATHOBJ_bEnum can be called only after a call to PATHOBJ_vEnumStart
has been made. A PATHDATA structure describes all or part of a
subpath (a connected part of a path). For example, a MoveTo call by
the application within a path begins a new subpath.


%index
PATHOBJ_bEnumClipLines
The PATHOBJ_bEnumClipLines function enumerates clipped line segments from a given path.
%group
Win32 gdi32
%prm
ppo, cb, pcl
ppo : [var] Pointer to the PATHOBJ structure containing the clipped line segments that are to be enumerated.
cb : [int] Specifies the size of the output buffer, in bytes. GDI does not write beyond this point in the buffer. The value of this parameter must be large enough to hold a CLIPLINE structure with at least one RUN structure. The driver should allocate space for several RUN structures.
pcl : [var] Pointer to the buffer that receives a CLIPLINE structure. The structure contains the original unclipped control points for a line segment. (The correct pixels for the line cannot be computed without the original points.) RUN structures, which describe sets of pixels along the line that are not clipped away, are written to this buffer. If a clip region is complex, a single line segment can be broken into many RUN structures. A segment is returned as many times as necessary to list all of its RUN structures. The CLIPLINE structure contains the starting and ending points of the original unclipped line and the line segments, or RUN structures, of that line that are to appear on the display.
%inst
The PATHOBJ_bEnumClipLines function enumerates clipped line segments
from a given path.

[戻り値]
The return value is TRUE if more line segments are to be enumerated,
indicating that this service should be called again. Otherwise, it is
FALSE, indicating that the returned segment is the last segment in
the path.

[備考]
The enumeration must be started with PATHOBJ_vEnumStartClipLines
before the driver makes this call.


%index
PATHOBJ_vEnumStart
The PATHOBJ_vEnumStart function notifies a given PATHOBJ structure that the driver will be calling PATHOBJ_bEnum to enumerate lines and/or curves in the path.
%group
Win32 gdi32
%prm
ppo
ppo : [var] Pointer to a PATHOBJ structure whose lines and/or curves are to be enumerated.
%inst
The PATHOBJ_vEnumStart function notifies a given PATHOBJ structure
that the driver will be calling PATHOBJ_bEnum to enumerate lines
and/or curves in the path.

[戻り値]
None

[備考]
PATHOBJ_vEnumStart can be called at any time to restart an
enumeration.


%index
PATHOBJ_vGetBounds
The PATHOBJ_vGetBounds function retrieves the bounding rectangle for the specified path.
%group
Win32 gdi32
%prm
ppo, prectfx
ppo : [var] Pointer to a PATHOBJ structure that describes the path for which a bounding rectangle is to be calculated.
prectfx : [var] Pointer to the address where the RECTFX structure is to be written. The returned rectangle is exclusive of the bottom and right edges. An empty rectangle is specified by setting all four RECTFX members to zero. For a description of this data type, see GDI Data Types.
%inst
The PATHOBJ_vGetBounds function retrieves the bounding rectangle for
the specified path.

[戻り値]
None


%index
PaintRgn
The PaintRgn function paints the specified region by using the brush currently selected into the device context.
%group
Win32 gdi32
%prm
hdc, hrgn
hdc : [intptr] Handle to the device context.
hrgn : [intptr] Handle to the region to be filled. The region's coordinates are presumed to be logical coordinates.
%inst
The PaintRgn function paints the specified region by using the brush
currently selected into the device context.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero.


%index
PatBlt
The PatBlt function paints the specified rectangle using the brush that is currently selected into the specified device context. The brush color and the surface color or colors are combined by using the specified raster operation.
%group
Win32 gdi32
%prm
hdc, x, y, w, h, rop
hdc : [intptr] A handle to the device context.
x : [int] The x-coordinate, in logical units, of the upper-left corner of the rectangle to be filled.
y : [int] The y-coordinate, in logical units, of the upper-left corner of the rectangle to be filled.
w : [int] The width, in logical units, of the rectangle.
h : [int] The height, in logical units, of the rectangle.
rop : [int] 
%inst
The PatBlt function paints the specified rectangle using the brush
that is currently selected into the specified device context. The
brush color and the surface color or colors are combined by using the
specified raster operation.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero.

[備考]
The values of the dwRop parameter for this function are a limited
subset of the full 256 ternary raster-operation codes; in particular,
an operation code that refers to a source rectangle cannot be used.
Not all devices support the PatBlt function. For more information,
see the description of the RC_BITBLT capability in the GetDeviceCaps
function.


%index
PathToRegion
The PathToRegion function creates a region from the path that is selected into the specified device context. The resulting region uses device coordinates.
%group
Win32 gdi32
%prm
hdc
hdc : [intptr] Handle to a device context that contains a closed path.
%inst
The PathToRegion function creates a region from the path that is
selected into the specified device context. The resulting region uses
device coordinates.

[戻り値]
If the function succeeds, the return value identifies a valid region.
If the function fails, the return value is zero.

[備考]
When you no longer need the HRGN object call the DeleteObject
function to delete it. The device context identified by the hdc
parameter must contain a closed path. After PathToRegion converts a
path into a region, the system discards the closed path from the
specified device context.


%index
Pie
The Pie function draws a pie-shaped wedge bounded by the intersection of an ellipse and two radials. The pie is outlined by using the current pen and filled by using the current brush.
%group
Win32 gdi32
%prm
hdc, left, top, right, bottom, xr1, yr1, xr2, yr2
hdc : [intptr] A handle to the device context.
left : [int] The x-coordinate, in logical coordinates, of the upper-left corner of the bounding rectangle.
top : [int] The y-coordinate, in logical coordinates, of the upper-left corner of the bounding rectangle.
right : [int] The x-coordinate, in logical coordinates, of the lower-right corner of the bounding rectangle.
bottom : [int] The y-coordinate, in logical coordinates, of the lower-right corner of the bounding rectangle.
xr1 : [int] The x-coordinate, in logical coordinates, of the endpoint of the first radial.
yr1 : [int] The y-coordinate, in logical coordinates, of the endpoint of the first radial.
xr2 : [int] The x-coordinate, in logical coordinates, of the endpoint of the second radial.
yr2 : [int] The y-coordinate, in logical coordinates, of the endpoint of the second radial.
%inst
The Pie function draws a pie-shaped wedge bounded by the intersection
of an ellipse and two radials. The pie is outlined by using the
current pen and filled by using the current brush.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero.

[備考]
The curve of the pie is defined by an ellipse that fits the specified
bounding rectangle. The curve begins at the point where the ellipse
intersects the first radial and extends counterclockwise to the point
where the ellipse intersects the second radial. The current position
is neither used nor updated by the Pie function.


%index
PlayEnhMetaFile
The PlayEnhMetaFile function displays the picture stored in the specified enhanced-format metafile.
%group
Win32 gdi32
%prm
hdc, hmf, lprect
hdc : [intptr] A handle to the device context for the output device on which the picture will appear.
hmf : [intptr] A handle to the enhanced metafile.
lprect : [var] A pointer to a RECT structure that contains the coordinates of the bounding rectangle used to display the picture. The coordinates are specified in logical units.
%inst
The PlayEnhMetaFile function displays the picture stored in the
specified enhanced-format metafile.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero.

[備考]
When an application calls the PlayEnhMetaFile function, the system
uses the picture frame in the enhanced-metafile header to map the
picture onto the rectangle pointed to by the lpRect parameter. (This
picture may be sheared or rotated by setting the world transform in
the output device before calling PlayEnhMetaFile.) Points along the
edges of the rectangle are included in the picture. An
enhanced-metafile picture can be clipped by defining the clipping
region in the output device before playing the enhanced metafile. If
an enhanced metafile contains an optional palette, an application can
achieve consistent colors by setting up a color palette on the output
device before calling PlayEnhMetaFile. To retrieve the optional
palette, use the GetEnhMetaFilePaletteEntries function. An enhanced
metafile can be embedded in a newly created enhanced metafile by
calling PlayEnhMetaFile and playing the source enhanced metafile into
the device context for the new enhanced metafile. The states of the
output device context are preserved by this function. Any object
created but not deleted in the enhanced metafile is deleted by this
function. To stop this function, an application can call the CancelDC
function from another thread to terminate the operation. In this
case, the function returns FALSE.


%index
PlayEnhMetaFileRecord
The PlayEnhMetaFileRecord function plays an enhanced-metafile record by executing the graphics device interface (GDI) functions identified by the record.
%group
Win32 gdi32
%prm
hdc, pht, pmr, cht
hdc : [intptr] A handle to the device context passed to the EnumEnhMetaFile function.
pht : [var] A pointer to a table of handles to GDI objects used when playing the metafile. The first entry in this table contains the enhanced-metafile handle.
pmr : [var] A pointer to the enhanced-metafile record to be played.
cht : [int] The number of handles in the handle table.
%inst
The PlayEnhMetaFileRecord function plays an enhanced-metafile record
by executing the graphics device interface (GDI) functions identified
by the record.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero.

[備考]
This is an enhanced-metafile function. An application typically uses
PlayEnhMetaFileRecord in conjunction with the EnumEnhMetaFile
function to process and play an enhanced-format metafile one record
at a time. The hdc, lpHandletable, and nHandles parameters must be
exactly those passed to the EnhMetaFileProc callback procedure by the
EnumEnhMetaFile function. If PlayEnhMetaFileRecord does not recognize
a record, it ignores the record and returns TRUE.


%index
PlayMetaFile
The PlayMetaFile function displays the picture stored in the given Windows-format metafile on the specified device.
%group
Win32 gdi32
%prm
hdc, hmf
hdc : [intptr] Handle to a device context.
hmf : [intptr] Handle to a Windows-format metafile.
%inst
The PlayMetaFile function displays the picture stored in the given
Windows-format metafile on the specified device.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero.

[備考]
To convert a Windows-format metafile into an enhanced format
metafile, use the SetWinMetaFileBits function. A Windows-format
metafile can be played multiple times. A Windows-format metafile can
be embedded in a second Windows-format metafile by calling the
PlayMetaFile function and playing the source metafile into the device
context for the target metafile. Any object created but not deleted
in the Windows-format metafile is deleted by this function. To stop
this function, an application can call the CancelDC function from
another thread to terminate the operation. In this case, the function
returns FALSE.


%index
PlayMetaFileRecord
The PlayMetaFileRecord function plays a Windows-format metafile record by executing the graphics device interface (GDI) function contained within that record.
%group
Win32 gdi32
%prm
hdc, lpHandleTable, lpMR, noObjs
hdc : [intptr] A handle to a device context.
lpHandleTable : [var] A pointer to a HANDLETABLE structure representing the table of handles to GDI objects used when playing the metafile.
lpMR : [var] A pointer to the Windows-format metafile record.
noObjs : [int] The number of handles in the handle table.
%inst
The PlayMetaFileRecord function plays a Windows-format metafile
record by executing the graphics device interface (GDI) function
contained within that record.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero.

[備考]
To convert a Windows-format metafile into an enhanced-format
metafile, use the SetWinMetaFileBits function. An application
typically uses PlayMetaFileRecord in conjunction with the
EnumMetaFile function to process and play a Windows-format metafile
one record at a time. The lpHandletable and nHandles parameters must
be identical to those passed to the EnumMetaFileProc callback
procedure by EnumMetaFile. If the PlayMetaFileRecord function does
not recognize a record, it ignores the record and returns TRUE.


%index
PlgBlt
The PlgBlt function performs a bit-block transfer of the bits of color data from the specified rectangle in the source device context to the specified parallelogram in the destination device context.
%group
Win32 gdi32
%prm
hdcDest, lpPoint, hdcSrc, xSrc, ySrc, width, height, hbmMask, xMask, yMask
hdcDest : [intptr] A handle to the destination device context.
lpPoint : [var] A pointer to an array of three points in logical space that identify three corners of the destination parallelogram. The upper-left corner of the source rectangle is mapped to the first point in this array, the upper-right corner to the second point in this array, and the lower-left corner to the third point. The lower-right corner of the source rectangle is mapped to the implicit fourth point in the parallelogram.
hdcSrc : [intptr] A handle to the source device context.
xSrc : [int] The x-coordinate, in logical units, of the upper-left corner of the source rectangle.
ySrc : [int] The y-coordinate, in logical units, of the upper-left corner of the source rectangle.
width : [int] The width, in logical units, of the source rectangle.
height : [int] The height, in logical units, of the source rectangle.
hbmMask : [intptr] A handle to an optional monochrome bitmap that is used to mask the colors of the source rectangle.
xMask : [int] The x-coordinate, in logical units, of the upper-left corner of the monochrome bitmap.
yMask : [int] The y-coordinate, in logical units, of the upper-left corner of the monochrome bitmap.
%inst
The PlgBlt function performs a bit-block transfer of the bits of
color data from the specified rectangle in the source device context
to the specified parallelogram in the destination device context.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero.

[備考]
The PlgBlt function works with device-dependent bitmaps. The fourth
vertex of the parallelogram (D) is defined by treating the first
three points (A, B, and C ) as vectors and computing D = B +CA. If
the bitmask exists, a value of one in the mask indicates that the
source pixel color should be copied to the destination. A value of
zero in the mask indicates that the destination pixel color is not to
be changed. If the mask rectangle is smaller than the source and
destination rectangles, the function replicates the mask pattern.
Scaling, translation, and reflection transformations are allowed in
the source device context; however, rotation and shear
transformations are not. If the mask bitmap is not a monochrome
bitmap, an error occurs. The stretching mode for the destination
device context is used to determine how to stretch or compress the
pixels, if that is necessary. When an enhanced metafile is being
recorded, an error occurs if the source device context identifies an
enhanced-metafile device context. The destination coordinates are
transformed according to the destination device context; the source
coordinates are transformed according to the source device context.
If the source transformation has a rotation or shear, an error is
returned. If the destination and source rectangles do not have the
same color format, PlgBlt converts the source rectangle to match the
destination rectangle. Not all devices support the PlgBlt function.
For more information, see the description of the RC_BITBLT raster
capability in the GetDeviceCaps function. If the source and
destination device contexts represent incompatible devices, PlgBlt
returns an error. When used in a multiple monitor system, both hdcSrc
and hdcDest must refer to the same device or the function will fail.
To transfer data between DCs for different devices, convert the
memory bitmap to a DIB by calling GetDIBits. To display the DIB to
the second device, call SetDIBits or StretchDIBits.


%index
PolyBezier
The PolyBezier function draws one or more B?zier curves.
%group
Win32 gdi32
%prm
hdc, apt, cpt
hdc : [intptr] A handle to a device context.
apt : [var] A pointer to an array of POINT structures that contain the endpoints and control points of the curve(s), in logical units.
cpt : [int] The number of points in the lppt array. This value must be one more than three times the number of curves to be drawn, because each B?zier curve requires two control points and an endpoint, and the initial curve requires an additional starting point.
%inst
The PolyBezier function draws one or more B?zier curves.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero.

[備考]
The PolyBezier function draws cubic B?zier curves by using the
endpoints and control points specified by the lppt parameter. The
first curve is drawn from the first point to the fourth point by
using the second and third points as control points. Each subsequent
curve in the sequence needs exactly three more points: the ending
point of the previous curve is used as the starting point, the next
two points in the sequence are control points, and the third is the
ending point. The current position is neither used nor updated by the
PolyBezier function. The figure is not filled. This function draws
lines by using the current pen.


%index
PolyBezierTo
The PolyBezierTo function draws one or more B?zier curves.
%group
Win32 gdi32
%prm
hdc, apt, cpt
hdc : [intptr] A handle to a device context.
apt : [var] A pointer to an array of POINT structures that contains the endpoints and control points, in logical units.
cpt : [int] The number of points in the lppt array. This value must be three times the number of curves to be drawn because each B?zier curve requires two control points and an ending point.
%inst
The PolyBezierTo function draws one or more B?zier curves.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero.

[備考]
This function draws cubic B?zier curves by using the control points
specified by the lppt parameter. The first curve is drawn from the
current position to the third point by using the first two points as
control points. For each subsequent curve, the function needs exactly
three more points, and uses the ending point of the previous curve as
the starting point for the next. PolyBezierTo moves the current
position to the ending point of the last B?zier curve. The figure is
not filled. This function draws lines by using the current pen.


%index
PolyDraw
The PolyDraw function draws a set of line segments and B?zier curves.
%group
Win32 gdi32
%prm
hdc, apt, aj, cpt
hdc : [intptr] A handle to a device context.
apt : [var] A pointer to an array of POINT structures that contains the endpoints for each line segment and the endpoints and control points for each B?zier curve, in logical units.
aj : [var] 
cpt : [int] The total number of points in the lppt array, the same as the number of bytes in the lpbTypes array.
%inst
The PolyDraw function draws a set of line segments and B?zier curves.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero.

[備考]
The PolyDraw function can be used in place of consecutive calls to
MoveToEx, LineTo, and PolyBezierTo functions to draw disjoint
figures. The lines and curves are drawn using the current pen and
figures are not filled. If there is an active path started by calling
BeginPath, PolyDraw adds to the path. The points contained in the
lppt array and in the lpbTypes array indicate whether each point is
part of a MoveTo, LineTo, or PolyBezierTo operation. It is also
possible to close figures. This function updates the current
position.


%index
PolyPolygon
The PolyPolygon function draws a series of closed polygons. Each polygon is outlined by using the current pen and filled by using the current brush and polygon fill mode. The polygons drawn by this function can overlap.
%group
Win32 gdi32
%prm
hdc, apt, asz, csz
hdc : [intptr] A handle to the device context.
apt : [var] A pointer to an array of POINT structures that define the vertices of the polygons, in logical coordinates. The polygons are specified consecutively. Each polygon is closed automatically by drawing a line from the last vertex to the first. Each vertex should be specified once.
asz : [var] A pointer to an array of integers, each of which specifies the number of points in the corresponding polygon. Each integer must be greater than or equal to 2.
csz : [int] The total number of polygons.
%inst
The PolyPolygon function draws a series of closed polygons. Each
polygon is outlined by using the current pen and filled by using the
current brush and polygon fill mode. The polygons drawn by this
function can overlap.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero.

[備考]
The current position is neither used nor updated by this function.
Any extra points are ignored. To draw the polygons with more points,
divide your data into groups, each of which have less than the
maximum number of points, and call the function for each group of
points. Note, it is best to have a polygon in only one of the groups.


%index
PolyPolyline
The PolyPolyline function draws multiple series of connected line segments.
%group
Win32 gdi32
%prm
hdc, apt, asz, csz
hdc : [intptr] A handle to the device context.
apt : [var] A pointer to an array of POINT structures that contains the vertices of the polylines, in logical units. The polylines are specified consecutively.
asz : [var] A pointer to an array of variables specifying the number of points in the lppt array for the corresponding polyline. Each entry must be greater than or equal to two.
csz : [int] The total number of entries in the lpdwPolyPoints array.
%inst
The PolyPolyline function draws multiple series of connected line
segments.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero.

[備考]
The line segments are drawn by using the current pen. The figures
formed by the segments are not filled. The current position is
neither used nor updated by this function.


%index
PolyTextOutW
The PolyTextOut function draws several strings using the font and text colors currently selected in the specified device context. (Unicode)
%group
Win32 gdi32
%prm
hdc, ppt, nstrings
hdc : [intptr] A handle to the device context.
ppt : [var] A pointer to an array of POLYTEXT structures describing the strings to be drawn. The array contains one structure for each string to be drawn.
nstrings : [int] The number of POLYTEXT structures in the pptxt array.
%inst
The PolyTextOut function draws several strings using the font and
text colors currently selected in the specified device context.
(Unicode)

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero.

[備考]
Each POLYTEXT structure contains the coordinates of a reference point
that Windows uses to align the corresponding string of text. An
application can specify how the reference point is used by calling
the SetTextAlign function. An application can determine the current
text-alignment setting for the specified device context by calling
the GetTextAlign function. To draw a single string of text, the
application should call the ExtTextOut function. **PolyTextOut** will
not handle international scripting support automatically. To get
international scripting support, use **ExtTextOut** instead.
**ExtTextOut** will use [Uniscribe](/windows/win32/intl/uniscribe)
when necessary resulting in font fallback. Additionally,
**ExtTextOut** will perform internal batching of calls before
transitioning to kernel mode, mitigating some of the performance
concerns when weighing usage of **PolyTextOut** versus
**ExtTextOut**. > [!TIP] > **ExtTextOut** is strongly recommended
over **PolyTextOut** for modern development due to its ability to
handle display of different languages. > [!NOTE] > The wingdi.h
header defines PolyTextOut as an alias which automatically selects
the ANSI or Unicode version of this function based on the definition
of the UNICODE preprocessor constant. Mixing usage of the
encoding-neutral alias with code that not encoding-neutral can lead
to mismatches that result in compilation or runtime errors. For more
information, see [Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
Polygon
2 つ以上の頂点を直線で結んだ多角形を描画する。多角形は現在のペンで輪郭が描かれ、現在のブラシと多角形塗りつぶしモードで塗りつぶされる。
%group
Win32 gdi32
%prm
hdc, apt, cpt
hdc : [intptr] デバイスコンテキストへのハンドル。
apt : [var] 論理座標で多角形の頂点を指定する POINT 構造体の配列へのポインタ。
cpt : [int] 配列内の頂点数。2 以上でなければならない。
%inst
2 つ以上の頂点を直線で結んだ多角形を描画する。多角形は現在のペンで輪郭が描かれ、現在のブラシと多角形塗りつぶしモードで塗りつぶされる。

[戻り値]
関数が成功した場合、戻り値は 0 以外。失敗した場合は 0。

[備考]
多角形は最後の頂点から最初の頂点への線を引くことで自動的に閉じられる。Polygon
関数は現在位置を使用も更新もしない。追加の点は無視される。最大点数を超える場合はグループに分割して呼び出し、各線分を接続する。


%index
Polyline
指定した配列の点を接続することで一連の線分を描画する。
%group
Win32 gdi32
%prm
hdc, apt, cpt
hdc : [intptr] デバイスコンテキストへのハンドル。
apt : [var] POINT 構造体の配列(論理単位)へのポインタ。
cpt : [int] 配列内の点数。2 以上でなければならない。
%inst
指定した配列の点を接続することで一連の線分を描画する。

[戻り値]
関数が成功した場合、戻り値は 0 以外。失敗した場合は 0。

[備考]
線は現在のペンを使用して最初の点から後続の点まで描画される。LineTo や PolylineTo と異なり、Polyline
は現在位置を使用も更新もしない。


%index
PolylineTo
The PolylineTo function draws one or more straight lines.
%group
Win32 gdi32
%prm
hdc, apt, cpt
hdc : [intptr] A handle to the device context.
apt : [var] A pointer to an array of POINT structures that contains the vertices of the line, in logical units.
cpt : [int] The number of points in the array.
%inst
The PolylineTo function draws one or more straight lines.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero.

[備考]
Unlike the Polyline function, the PolylineTo function uses and
updates the current position. A line is drawn from the current
position to the first point specified by the lppt parameter by using
the current pen. For each additional line, the function draws from
the ending point of the previous line to the next point specified by
lppt. PolylineTo moves the current position to the ending point of
the last line. If the line segments drawn by this function form a
closed figure, the figure is not filled.


%index
PtInRegion
The PtInRegion function determines whether the specified point is inside the specified region.
%group
Win32 gdi32
%prm
hrgn, x, y
hrgn : [intptr] Handle to the region to be examined.
x : [int] Specifies the x-coordinate of the point in logical units.
y : [int] Specifies the y-coordinate of the point in logical units.
%inst
The PtInRegion function determines whether the specified point is
inside the specified region.

[戻り値]
If the specified point is in the region, the return value is nonzero.
If the specified point is not in the region, the return value is
zero.


%index
PtVisible
The PtVisible function determines whether the specified point is within the clipping region of a device context.
%group
Win32 gdi32
%prm
hdc, x, y
hdc : [intptr] A handle to the device context.
x : [int] The x-coordinate, in logical units, of the point.
y : [int] The y-coordinate, in logical units, of the point.
%inst
The PtVisible function determines whether the specified point is
within the clipping region of a device context.

[戻り値]
If the specified point is within the clipping region of the device
context, the return value is TRUE(1). If the specified point is not
within the clipping region of the device context, the return value is
FALSE(0). If the HDC is not valid, the return value is (BOOL)-1.


%index
RealizePalette
The RealizePalette function maps palette entries from the current logical palette to the system palette.
%group
Win32 gdi32
%prm
hdc
hdc : [intptr] A handle to the device context into which a logical palette has been selected.
%inst
The RealizePalette function maps palette entries from the current
logical palette to the system palette.

[戻り値]
If the function succeeds, the return value is the number of entries
in the logical palette mapped to the system palette. If the function
fails, the return value is GDI_ERROR.

[備考]
An application can determine whether a device supports palette
operations by calling the GetDeviceCaps function and specifying the
RASTERCAPS constant. The RealizePalette function modifies the palette
for the device associated with the specified device context. If the
device context is a memory DC, the color table for the bitmap
selected into the DC is modified. If the device context is a display
DC, the physical palette for that device is modified. A logical
palette is a buffer between color-intensive applications and the
system, allowing these applications to use as many colors as needed
without interfering with colors displayed by other windows. When an
application's window has the focus and it calls the RealizePalette
function, the system attempts to realize as many of the requested
colors as possible. The same is also true for applications with
inactive windows.


%index
RectInRegion
The RectInRegion function determines whether any part of the specified rectangle is within the boundaries of a region.
%group
Win32 gdi32
%prm
hrgn, lprect
hrgn : [intptr] Handle to the region.
lprect : [var] Pointer to a RECT structure containing the coordinates of the rectangle in logical units. The lower and right edges of the rectangle are not included.
%inst
The RectInRegion function determines whether any part of the
specified rectangle is within the boundaries of a region.

[戻り値]
If any part of the specified rectangle lies within the boundaries of
the region, the return value is nonzero. If no part of the specified
rectangle lies within the boundaries of the region, the return value
is zero.


%index
RectVisible
The RectVisible function determines whether any part of the specified rectangle lies within the clipping region of a device context.
%group
Win32 gdi32
%prm
hdc, lprect
hdc : [intptr] A handle to the device context.
lprect : [var] A pointer to a RECT structure that contains the logical coordinates of the specified rectangle.
%inst
The RectVisible function determines whether any part of the specified
rectangle lies within the clipping region of a device context.

[戻り値]
If the current transform does not have a rotation and the rectangle
lies within the clipping region, the return value is TRUE (1). If the
current transform does not have a rotation and the rectangle does not
lie within the clipping region, the return value is FALSE (0). If the
current transform has a rotation and the rectangle lies within the
clipping region, the return value is 2. If the current transform has
a rotation and the rectangle does not lie within the clipping region,
the return value is 1. All other return values are considered error
codes. If the any parameter is not valid, the return value is
undefined.


%index
Rectangle
矩形を描画する。矩形は現在のペンで輪郭を描かれ、現在のブラシで塗りつぶされる。
%group
Win32 gdi32
%prm
hdc, left, top, right, bottom
hdc : [intptr] デバイスコンテキストへのハンドル。
left : [int] 矩形の左上隅の x 座標(論理単位)。
top : [int] 矩形の左上隅の y 座標(論理単位)。
right : [int] 矩形の右下隅の x 座標(論理単位)。
bottom : [int] 矩形の右下隅の y 座標(論理単位)。
%inst
矩形を描画する。矩形は現在のペンで輪郭を描かれ、現在のブラシで塗りつぶされる。

[戻り値]
関数が成功した場合、戻り値は 0 以外。失敗した場合は 0。

[備考]
現在位置は Rectangle によって使用も更新もされない。描画される矩形は下端と右端を含まない。PS_NULL
ペンを使うと、矩形の寸法は高さ 1 ピクセル分、幅 1 ピクセル分少なくなる。


%index
RemoveFontMemResourceEx
The RemoveFontMemResourceEx function removes the fonts added from a memory image file.
%group
Win32 gdi32
%prm
h
h : [intptr] A handle to the font-resource. This handle is returned by the AddFontMemResourceEx function.
%inst
The RemoveFontMemResourceEx function removes the fonts added from a
memory image file.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero. No extended error
information is available.

[備考]
This function removes a font that was added by the
AddFontMemResourceEx function. To remove the font, specify the same
path and flags as were used in AddFontMemResourceEx. This function
will only remove the font that is specified by fh.


%index
RemoveFontResourceW
The RemoveFontResource function removes the fonts in the specified file from the system font table. (Unicode)
%group
Win32 gdi32
%prm
lpFileName
lpFileName : [wstr] A pointer to a null-terminated string that names a font resource file.
%inst
The RemoveFontResource function removes the fonts in the specified
file from the system font table. (Unicode)

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero.

[備考]
We recommend that if an app adds or removes fonts from the system
font table that it notify other windows of the change by sending a
WM_FONTCHANGE message to all top-level windows in the system. The app
sends this message by calling the SendMessage function with the hwnd
parameter set to HWND_BROADCAST. If there are outstanding references
to a font, the associated resource remains loaded until no device
context is using it. Furthermore, if the font is listed in the font
registry (HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows
NT\CurrentVersion\Fonts) and is installed to any location other than
the %windir%\fonts\ folder, it may be loaded into other active
sessions (including session 0). When you try to replace an existing
font file that contains a font with outstanding references to it, you
might get an error that indicates that the original font can't be
deleted because it’s in use even after you call RemoveFontResource.
If your app requires that the font file be replaced, to reduce the
resource count of the original font to zero, call RemoveFontResource
in a loop as shown in this example code. If you continue to get
errors, this is an indication that the font file remains loaded in
other sessions. Make sure the font isn't listed in the font registry
and restart the system to ensure the font is unloaded from all
sessions. Note Apps where the original font file is in use will still
be able to access the original file and won't use the new font until
the font reloads. Call AddFontResource to reload the font. We
recommend that you call AddFontResource the same number of times as
the call to RemoveFontResource succeeded as shown in this example
code.
This doc was truncated.


%index
RemoveFontResourceExW
The RemoveFontResourceEx function removes the fonts in the specified file from the system font table. (Unicode)
%group
Win32 gdi32
%prm
name, fl, pdv
name : [wstr] A pointer to a null-terminated string that names a font resource file.
fl : [int] The characteristics of the font to be removed from the system. In order for the font to be removed, the flags used must be the same as when the font was added with the AddFontResourceEx function. See the AddFontResourceEx function for more information.
pdv : [intptr] Reserved. Must be zero.
%inst
The RemoveFontResourceEx function removes the fonts in the specified
file from the system font table. (Unicode)

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero. No extended error
information is available.

[備考]
This function will only remove the font if the flags specified are
the same as when then font was added with the AddFontResourceEx
function. When you try to replace an existing font file that contains
a font with outstanding references to it, you might get an error that
indicates that the original font can't be deleted because it’s in use
even after you call RemoveFontResourceEx. If your app requires that
the font file be replaced, to reduce the resource count of the
original font to zero, call RemoveFontResourceEx in a loop as shown
in this example code. If you continue to get errors, this is an
indication that the font file remains loaded in other sessions. Make
sure the font isn't listed in the font registry and restart the
system to ensure the font is unloaded from all sessions. Note Apps
where the original font file is in use will still be able to access
the original file and won't use the new font until the font reloads.
Call AddFontResourceEx to reload the font. We recommend that you call
AddFontResourceEx the same number of times as the call to
RemoveFontResourceEx succeeded as shown in this example code.
This doc was truncated.


%index
ResetDCA
The ResetDC function updates the specified printer or plotter device context (DC) using the specified information. (ANSI)
%group
Win32 gdi32
%prm
hdc, lpdm
hdc : [intptr] A handle to the DC to update.
lpdm : [var] A pointer to a DEVMODE structure containing information about the new DC.
%inst
The ResetDC function updates the specified printer or plotter device
context (DC) using the specified information. (ANSI)

[戻り値]
If the function succeeds, the return value is a handle to the
original DC. If the function fails, the return value is NULL.

[備考]
An application will typically use the ResetDC function when a window
receives a WM_DEVMODECHANGE message. ResetDC can also be used to
change the paper orientation or paper bins while printing a document.
The ResetDC function cannot be used to change the driver name, device
name, or the output port. When the user changes the port connection
or device name, the application must delete the original DC and
create a new DC with the new information. An application can pass an
information DC to the ResetDC function. In that situation, ResetDC
will always return a printer DC. ICM: The color profile of the DC
specified by the hdc parameter will be reset based on the information
contained in the lpInitData member of the DEVMODE structure.
> [!NOTE] > The wingdi.h header defines ResetDC as an alias which
automatically selects the ANSI or Unicode version of this function
based on the definition of the UNICODE preprocessor constant. Mixing
usage of the encoding-neutral alias with code that not
encoding-neutral can lead to mismatches that result in compilation or
runtime errors. For more information, see [Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
ResetDCW
The ResetDC function updates the specified printer or plotter device context (DC) using the specified information. (Unicode)
%group
Win32 gdi32
%prm
hdc, lpdm
hdc : [intptr] A handle to the DC to update.
lpdm : [var] A pointer to a DEVMODE structure containing information about the new DC.
%inst
The ResetDC function updates the specified printer or plotter device
context (DC) using the specified information. (Unicode)

[戻り値]
If the function succeeds, the return value is a handle to the
original DC. If the function fails, the return value is NULL.

[備考]
An application will typically use the ResetDC function when a window
receives a WM_DEVMODECHANGE message. ResetDC can also be used to
change the paper orientation or paper bins while printing a document.
The ResetDC function cannot be used to change the driver name, device
name, or the output port. When the user changes the port connection
or device name, the application must delete the original DC and
create a new DC with the new information. An application can pass an
information DC to the ResetDC function. In that situation, ResetDC
will always return a printer DC. ICM: The color profile of the DC
specified by the hdc parameter will be reset based on the information
contained in the lpInitData member of the DEVMODE structure.
> [!NOTE] > The wingdi.h header defines ResetDC as an alias which
automatically selects the ANSI or Unicode version of this function
based on the definition of the UNICODE preprocessor constant. Mixing
usage of the encoding-neutral alias with code that not
encoding-neutral can lead to mismatches that result in compilation or
runtime errors. For more information, see [Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
ResizePalette
The ResizePalette function increases or decreases the size of a logical palette based on the specified value.
%group
Win32 gdi32
%prm
hpal, n
hpal : [intptr] A handle to the palette to be changed.
n : [int] The number of entries in the palette after it has been resized. The number of entries is limited to 1024.
%inst
The ResizePalette function increases or decreases the size of a
logical palette based on the specified value.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero.

[備考]
An application can determine whether a device supports palette
operations by calling the GetDeviceCaps function and specifying the
RASTERCAPS constant. If an application calls ResizePalette to reduce
the size of the palette, the entries remaining in the resized palette
are unchanged. If the application calls ResizePalette to enlarge the
palette, the additional palette entries are set to black (the red,
green, and blue values are all 0) and their flags are set to zero.


%index
RestoreDC
The RestoreDC function restores a device context (DC) to the specified state. The DC is restored by popping state information off a stack created by earlier calls to the SaveDC function.
%group
Win32 gdi32
%prm
hdc, nSavedDC
hdc : [intptr] A handle to the DC.
nSavedDC : [int] The saved state to be restored. If this parameter is positive, nSavedDC represents a specific instance of the state to be restored. If this parameter is negative, nSavedDC represents an instance relative to the current state. For example, -1 restores the most recently saved state.
%inst
The RestoreDC function restores a device context (DC) to the
specified state. The DC is restored by popping state information off
a stack created by earlier calls to the SaveDC function.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero.

[備考]
Each DC maintains a stack of saved states. The SaveDC function pushes
the current state of the DC onto its stack of saved states. That
state can be restored only to the same DC from which it was created.
After a state is restored, the saved state is destroyed and cannot be
reused. Furthermore, any states saved after the restored state was
created are also destroyed and cannot be used. In other words, the
RestoreDC function pops the restored state (and any subsequent
states) from the state information stack.


%index
RoundRect
The RoundRect function draws a rectangle with rounded corners. The rectangle is outlined by using the current pen and filled by using the current brush.
%group
Win32 gdi32
%prm
hdc, left, top, right, bottom, width, height
hdc : [intptr] A handle to the device context.
left : [int] The x-coordinate, in logical coordinates, of the upper-left corner of the rectangle.
top : [int] The y-coordinate, in logical coordinates, of the upper-left corner of the rectangle.
right : [int] The x-coordinate, in logical coordinates, of the lower-right corner of the rectangle.
bottom : [int] The y-coordinate, in logical coordinates, of the lower-right corner of the rectangle.
width : [int] The width, in logical coordinates, of the ellipse used to draw the rounded corners.
height : [int] The height, in logical coordinates, of the ellipse used to draw the rounded corners.
%inst
The RoundRect function draws a rectangle with rounded corners. The
rectangle is outlined by using the current pen and filled by using
the current brush.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero.

[備考]
The current position is neither used nor updated by this function.


%index
STROBJ_bEnum
The STROBJ_bEnum function enumerates glyph identities and positions.
%group
Win32 gdi32
%prm
pstro, pc, ppgpos
pstro : [var] Pointer to the STROBJ structure containing the GLYPHPOS information.
pc : [var] Pointer to the count, returned by GDI, of GLYPHPOS structures.
ppgpos : [var] Pointer to the array in which GDI writes the GLYPHPOS structures.
%inst
The STROBJ_bEnum function enumerates glyph identities and positions.

[戻り値]
The return value is TRUE if more glyphs remain to be enumerated, or
FALSE if the enumeration is complete. The return value is DDI_ERROR
if the glyphs cannot be enumerated, and an error code is logged.

[備考]
A driver should download only the glyph handles if it caches fonts
itself. The information returned depends on the driver's return value
for DrvGetGlyphMode. Bitmaps or outlines can also be obtained from
FONTOBJ structures. Printer drivers should call
STROBJ_bEnumPositionsOnly instead of STROBJ_bEnum if printer hardware
provides internal rendering of TrueType fonts.


%index
STROBJ_bEnumPositionsOnly
The STROBJ_bEnumPositionsOnly function enumerates glyph identities and positions for a specified text string, but does not create cached glyph bitmaps.
%group
Win32 gdi32
%prm
pstro, pc, ppgpos
pstro : [var] A caller-supplied pointer to a STROBJ structure describing a text string. This is typically the STROBJ structure received by the driver's DrvTextOut function.
pc : [var] A caller-supplied address to receive the GDI-supplied number of GLYPHPOS structures pointed to by the pointer in ppgpos.
ppgpos : [var] A caller-supplied address that receives a GDI-supplied pointer to an array of GLYPHPOS structures. (See the following Remarks section.)
%inst
The STROBJ_bEnumPositionsOnly function enumerates glyph identities
and positions for a specified text string, but does not create cached
glyph bitmaps.

[戻り値]
The return value is TRUE if more glyphs remain to be enumerated, or
FALSE if the enumeration is complete. The return value is DDI_ERROR
if the glyphs cannot be enumerated, and an error code is logged.

[備考]
The STROBJ_bEnumPositionsOnly function is typically called from
within a driver's DrvTextOut function. It performs the same
operations as STROBJ_bEnum with one important exception － GDI does
not create cached bitmaps of the glyphs. The STROBJ_bEnum function
assumes the driver will eventually need these bitmaps. However, many
newer printers contain internal rasterizers and therefore do not need
GDI to render glyphs. For such printers, eliminating the automatic
rendering and caching of glyph bitmaps in server memory provides
considerable savings of both processing time and memory allocation.
For printers that support internal glyph rasterization, the following
rules should be followed:
This doc was truncated.


%index
STROBJ_bGetAdvanceWidths
The STROBJ_bGetAdvanceWidths function retrieves an array of vectors specifying the probable widths of glyphs making up a specified string.
%group
Win32 gdi32
%prm
pso, iFirst, c, pptqD
pso : [var] Is a caller-supplied pointer to a STROBJ structure describing a text string. This is typically the STROBJ structure received by the driver's DrvTextOut function.
iFirst : [int] Is a caller-supplied, zero-based index into the text string supplied by the STROBJ structure. This index represents the first character of the string for which a width is to be returned.
c : [int] Is a caller-supplied count of the number of contiguous characters, starting and the character specified by iFirst, for which width values are to be returned.
pptqD : [var] Is a caller-supplied pointer to a c-sized array of POINTQF structures to receive character widths in (28.36, 28.36) format. For a description of this data type, see GDI Data Types.
%inst
The STROBJ_bGetAdvanceWidths function retrieves an array of vectors
specifying the probable widths of glyphs making up a specified
string.

[戻り値]
If the operation succeeds, the function returns TRUE; otherwise it
returns FALSE.

[備考]
The STROBJ_bGetAdvanceWidths function is useful to printer drivers
that call STROBJ_bEnumPositionsOnly instead of STROBJ_bEnum. The
function fills in the pptqD array with the probable widths of a
string's glyphs, and can be used to calculate the printer position
after a string as been rendered by the printer, if the printer's
glyph rendering hardware does not return exact character widths. Note
that glyph positions returned by STROBJ_bEnumPositionsOnly do not
necessarily correspond exactly to the widths returned by
STROBJ_bGetAdvanceWidths.


%index
STROBJ_dwGetCodePage
The STROBJ_dwGetCodePage function returns the code page associated with the specified STROBJ structure.
%group
Win32 gdi32
%prm
pstro
pstro : [var] Pointer to a STROBJ structure with which the code page is associated.
%inst
The STROBJ_dwGetCodePage function returns the code page associated
with the specified STROBJ structure.

[戻り値]
STROBJ_dwGetCodePage returns a DWORD value that identifies the code
page associated with the font used in the text output call at the
Win32 API level.


%index
STROBJ_vEnumStart
The STROBJ_vEnumStart function defines the form, or type, for data that will be returned from GDI in subsequent calls to STROBJ_bEnum.
%group
Win32 gdi32
%prm
pstro
pstro : [var] Pointer to the STROBJ structure whose data form is to be defined.
%inst
The STROBJ_vEnumStart function defines the form, or type, for data
that will be returned from GDI in subsequent calls to STROBJ_bEnum.

[戻り値]
None

[備考]
This function also restarts the enumeration of the GLYPHPOS array.
This function should be called by the driver prior to calling
STROBJ_bEnum.


%index
SaveDC
The SaveDC function saves the current state of the specified device context (DC) by copying data describing selected objects and graphic modes (such as the bitmap, brush, palette, font, pen, region, drawing mode, and mapping mode) to a context stack.
%group
Win32 gdi32
%prm
hdc
hdc : [intptr] A handle to the DC whose state is to be saved.
%inst
The SaveDC function saves the current state of the specified device
context (DC) by copying data describing selected objects and graphic
modes (such as the bitmap, brush, palette, font, pen, region, drawing
mode, and mapping mode) to a context stack.

[戻り値]
If the function succeeds, the return value identifies the saved
state. If the function fails, the return value is zero.

[備考]
The SaveDC function can be used any number of times to save any
number of instances of the DC state. A saved state can be restored by
using the RestoreDC function.


%index
ScaleViewportExtEx
The ScaleViewportExtEx function modifies the viewport for a device context using the ratios formed by the specified multiplicands and divisors.
%group
Win32 gdi32
%prm
hdc, xn, dx, yn, yd, lpsz
hdc : [intptr] A handle to the device context.
xn : [int] The amount by which to multiply the current horizontal extent.
dx : [int] The amount by which to divide the current horizontal extent.
yn : [int] The amount by which to multiply the current vertical extent.
yd : [int] The amount by which to divide the current vertical extent.
lpsz : [var] A pointer to a SIZE structure that receives the previous viewport extents, in device units. If lpSize is NULL, this parameter is not used.
%inst
The ScaleViewportExtEx function modifies the viewport for a device
context using the ratios formed by the specified multiplicands and
divisors.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero.

[備考]
The viewport extents are modified as follows:
This doc was truncated.


%index
ScaleWindowExtEx
The ScaleWindowExtEx function modifies the window for a device context using the ratios formed by the specified multiplicands and divisors.
%group
Win32 gdi32
%prm
hdc, xn, xd, yn, yd, lpsz
hdc : [intptr] A handle to the device context.
xn : [int] The amount by which to multiply the current horizontal extent.
xd : [int] The amount by which to divide the current horizontal extent.
yn : [int] The amount by which to multiply the current vertical extent.
yd : [int] The amount by which to divide the current vertical extent.
lpsz : [var] A pointer to a SIZE structure that receives the previous window extents, in logical units. If lpSize is NULL, this parameter is not used.
%inst
The ScaleWindowExtEx function modifies the window for a device
context using the ratios formed by the specified multiplicands and
divisors.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero.

[備考]
The window extents are modified as follows:
This doc was truncated.


%index
SelectClipPath
The SelectClipPath function selects the current path as a clipping region for a device context, combining the new region with any existing clipping region using the specified mode.
%group
Win32 gdi32
%prm
hdc, mode
hdc : [intptr] A handle to the device context of the path.
mode : [int] 
%inst
The SelectClipPath function selects the current path as a clipping
region for a device context, combining the new region with any
existing clipping region using the specified mode.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero.

[備考]
The device context identified by the hdc parameter must contain a
closed path.


%index
SelectClipRgn
The SelectClipRgn function selects a region as the current clipping region for the specified device context.
%group
Win32 gdi32
%prm
hdc, hrgn
hdc : [intptr] A handle to the device context.
hrgn : [intptr] A handle to the region to be selected.
%inst
The SelectClipRgn function selects a region as the current clipping
region for the specified device context.

[戻り値]
The return value specifies the region's complexity and can be one of
the following values.
This doc was truncated.

[備考]
Only a copy of the selected region is used. The region itself can be
selected for any number of other device contexts or it can be
deleted. The SelectClipRgn function assumes that the coordinates for
a region are specified in device units. To remove a device-context's
clipping region, specify a NULL region handle.


%index
SelectObject
指定されたデバイスコンテキスト(DC)にオブジェクトを選択する。新しいオブジェクトは同じ型の以前のオブジェクトを置き換える。
%group
Win32 gdi32
%prm
hdc, h
hdc : [intptr] DC へのハンドル。
h : [intptr] 選択するオブジェクトへのハンドル。指定されるオブジェクトは以下の関数のいずれかで作成されていなければならない。
%inst
指定されたデバイスコンテキスト(DC)にオブジェクトを選択する。新しいオブジェクトは同じ型の以前のオブジェクトを置き換える。

[戻り値]

選択されたオブジェクトがリージョンでなく、関数が成功した場合、戻り値は置き換えられるオブジェクトへのハンドル。リージョンの場合は次のいずれかの値。
（以下省略）

[備考]

この関数は指定された型の以前に選択されていたオブジェクトを返す。新しいオブジェクトで描画を終えたら、元の既定オブジェクトに置き換えるべきである。1
つのビットマップを同時に複数の DC に選択することはできない。ICM: 選択対象がブラシまたはペンの場合、カラーマネジメントが行われる。


%index
SelectPalette
The SelectPalette function selects the specified logical palette into a device context.
%group
Win32 gdi32
%prm
hdc, hPal, bForceBkgd
hdc : [intptr] A handle to the device context.
hPal : [intptr] A handle to the logical palette to be selected.
bForceBkgd : [int] Specifies whether the logical palette is forced to be a background palette. If this value is TRUE, the RealizePalette function causes the logical palette to be mapped to the colors already in the physical palette in the best possible way. This is always done, even if the window for which the palette is realized belongs to a thread without active focus. If this value is FALSE, RealizePalette causes the logical palette to be copied into the device palette when the application is in the foreground. (If the hdc parameter is a memory device context, this parameter is ignored.)
%inst
The SelectPalette function selects the specified logical palette into
a device context.

[戻り値]
If the function succeeds, the return value is a handle to the device
context's previous logical palette. If the function fails, the return
value is NULL.

[備考]
An application can determine whether a device supports palette
operations by calling the GetDeviceCaps function and specifying the
RASTERCAPS constant. An application can select a logical palette into
more than one device context only if device contexts are compatible.
Otherwise SelectPalette fails. To create a device context that is
compatible with another device context, call CreateCompatibleDC with
the first device context as the parameter. If a logical palette is
selected into more than one device context, changes to the logical
palette will affect all device contexts for which it is selected. An
application might call the SelectPalette function with the
bForceBackground parameter set to TRUE if the child windows of a
top-level window each realize their own palettes. However, only the
child window that needs to realize its palette must set
bForceBackground to TRUE; other child windows must set this value to
FALSE.


%index
SetAbortProc
The SetAbortProc function sets the application-defined abort function that allows a print job to be canceled during spooling.
%group
Win32 gdi32
%prm
hdc, proc
hdc : [intptr] Handle to the device context for the print job.
proc : [int] Pointer to the application-defined abort function. For more information about the callback function, see the AbortProc callback function.
%inst
The SetAbortProc function sets the application-defined abort function
that allows a print job to be canceled during spooling.

[戻り値]
If the function succeeds, the return value is greater than zero. If
the function fails, the return value is SP_ERROR.

[備考]
Note This is a blocking or synchronous function and might not return
immediately. How quickly this function returns depends on run-time
factors such as network status, print server configuration, and
printer driver implementation?factors that are difficult to predict
when writing an application. Calling this function from a thread that
manages interaction with the user interface could make the
application appear to be unresponsive.


%index
SetArcDirection
The SetArcDirection sets the drawing direction to be used for arc and rectangle functions.
%group
Win32 gdi32
%prm
hdc, dir
hdc : [intptr] A handle to the device context.
dir : [int] 
%inst
The SetArcDirection sets the drawing direction to be used for arc and
rectangle functions.

[戻り値]
If the function succeeds, the return value specifies the old arc
direction. If the function fails, the return value is zero.

[備考]
The default direction is counterclockwise. The SetArcDirection
function specifies the direction in which the following functions
draw:
This doc was truncated.


%index
SetBitmapBits
The SetBitmapBits function sets the bits of color data for a bitmap to the specified values.
%group
Win32 gdi32
%prm
hbm, cb, pvBits
hbm : [intptr] A handle to the bitmap to be set. This must be a compatible bitmap (DDB).
cb : [int] The number of bytes pointed to by the lpBits parameter.
pvBits : [intptr] A pointer to an array of bytes that contain color data for the specified bitmap.
%inst
The SetBitmapBits function sets the bits of color data for a bitmap
to the specified values.

[戻り値]
If the function succeeds, the return value is the number of bytes
used in setting the bitmap bits. If the function fails, the return
value is zero.

[備考]
The array identified by lpBits must be WORD aligned.


%index
SetBitmapDimensionEx
The SetBitmapDimensionEx function assigns preferred dimensions to a bitmap. These dimensions can be used by applications; however, they are not used by the system.
%group
Win32 gdi32
%prm
hbm, w, h, lpsz
hbm : [intptr] A handle to the bitmap. The bitmap cannot be a DIB-section bitmap.
w : [int] The width, in 0.1-millimeter units, of the bitmap.
h : [int] The height, in 0.1-millimeter units, of the bitmap.
lpsz : [var] A pointer to a SIZE structure to receive the previous dimensions of the bitmap. This pointer can be NULL.
%inst
The SetBitmapDimensionEx function assigns preferred dimensions to a
bitmap. These dimensions can be used by applications; however, they
are not used by the system.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero.

[備考]
An application can retrieve the dimensions assigned to a bitmap with
the SetBitmapDimensionEx function by calling the GetBitmapDimensionEx
function. The bitmap identified by hBitmap cannot be a DIB section,
which is a bitmap created by the CreateDIBSection function. If the
bitmap is a DIB section, the SetBitmapDimensionEx function fails.


%index
SetBkColor
現在の背景色を指定された色値、またはデバイスが指定値を表現できない場合は最も近い物理色に設定する。
%group
Win32 gdi32
%prm
hdc, color
hdc : [intptr] デバイスコンテキストへのハンドル。
color : [int] 新しい背景色。COLORREF 値は RGB マクロで作成する。
%inst
現在の背景色を指定された色値、またはデバイスが指定値を表現できない場合は最も近い物理色に設定する。

[戻り値]
関数が成功した場合、戻り値は以前の背景色(COLORREF 値)。失敗した場合は CLR_INVALID。

[備考]
この関数は CreatePen で作成されたペンを使って描画された破線間のギャップを埋める(ExtCreatePen
で作成されたペンは対象外)。SetBkColor は TextOut と ExtTextOut の背景色も設定する。背景モードが
OPAQUE
なら、背景色は破線のギャップ、ハッチブラシのギャップ、文字セルを埋めるのに使われる。ビットマップのカラー/モノクロ変換時にも使われる。


%index
SetBkMode
指定されたデバイスコンテキストの背景混合モードを設定する。背景混合モードはテキスト、ハッチブラシ、実線でないペンスタイルで使用される。
%group
Win32 gdi32
%prm
hdc, mode
hdc : [intptr] デバイスコンテキストへのハンドル。
mode : [int] 
%inst
指定されたデバイスコンテキストの背景混合モードを設定する。背景混合モードはテキスト、ハッチブラシ、実線でないペンスタイルで使用される。

[戻り値]
関数が成功した場合、戻り値は以前の背景モード。失敗した場合は 0。

[備考]
SetBkMode は CreatePen で作成されたペンで描画される線のスタイルに影響する。ExtCreatePen
で作成されたペンには影響しない。


%index
SetBoundsRect
The SetBoundsRect function controls the accumulation of bounding rectangle information for the specified device context.
%group
Win32 gdi32
%prm
hdc, lprect, flags
hdc : [intptr] A handle to the device context for which to accumulate bounding rectangles.
lprect : [var] A pointer to a RECT structure used to set the bounding rectangle. Rectangle dimensions are in logical coordinates. This parameter can be NULL.
flags : [int] 
%inst
The SetBoundsRect function controls the accumulation of bounding
rectangle information for the specified device context.

[戻り値]
If the function succeeds, the return value specifies the previous
state of the bounding rectangle. This state can be a combination of
the following values.
This doc was truncated.

[備考]
The DCB_SET value is a combination of the bit values DCB_ACCUMULATE
and DCB_RESET. Applications that check the DCB_RESET bit to determine
whether the bounding rectangle is empty must also check the
DCB_ACCUMULATE bit. The bounding rectangle is empty only if the
DCB_RESET bit is 1 and the DCB_ACCUMULATE bit is 0.


%index
SetBrushOrgEx
The SetBrushOrgEx function sets the brush origin that GDI assigns to the next brush an application selects into the specified device context.
%group
Win32 gdi32
%prm
hdc, x, y, lppt
hdc : [intptr] A handle to the device context.
x : [int] The x-coordinate, in device units, of the new brush origin. If this value is greater than the brush width, its value is reduced using the modulus operator (nXOrg mod brush width).
y : [int] The y-coordinate, in device units, of the new brush origin. If this value is greater than the brush height, its value is reduced using the modulus operator (nYOrg mod brush height).
lppt : [var] A pointer to a POINT structure that receives the previous brush origin. This parameter can be NULL if the previous brush origin is not required.
%inst
The SetBrushOrgEx function sets the brush origin that GDI assigns to
the next brush an application selects into the specified device
context.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero.

[備考]
A brush is a bitmap that the system uses to paint the interiors of
filled shapes. The brush origin is a pair of coordinates specifying
the location of one pixel in the bitmap. The default brush origin
coordinates are (0,0). For horizontal coordinates, the value 0
corresponds to the leftmost column of pixels; the width corresponds
to the rightmost column. For vertical coordinates, the value 0
corresponds to the uppermost row of pixels; the height corresponds to
the lowermost row. The system automatically tracks the origin of all
window-managed device contexts and adjusts their brushes as necessary
to maintain an alignment of patterns on the surface. The brush origin
that is set with this call is relative to the upper-left corner of
the client area. An application should call SetBrushOrgEx after
setting the bitmap stretching mode to HALFTONE by using
SetStretchBltMode. This must be done to avoid brush misalignment. The
system automatically tracks the origin of all window-managed device
contexts and adjusts their brushes as necessary to maintain an
alignment of patterns on the surface.


%index
SetColorAdjustment
The SetColorAdjustment function sets the color adjustment values for a device context (DC) using the specified values.
%group
Win32 gdi32
%prm
hdc, lpca
hdc : [intptr] A handle to the device context.
lpca : [var] A pointer to a COLORADJUSTMENT structure containing the color adjustment values.
%inst
The SetColorAdjustment function sets the color adjustment values for
a device context (DC) using the specified values.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero.

[備考]
The color adjustment values are used to adjust the input color of the
source bitmap for calls to the StretchBlt and StretchDIBits functions
when HALFTONE mode is set.


%index
SetColorSpace
The SetColorSpace function defines the input color space for a given device context.
%group
Win32 gdi32
%prm
hdc, hcs
hdc : [intptr] Specifies the handle to a device context.
hcs : [intptr] Identifies handle to the color space to set.
%inst
The SetColorSpace function defines the input color space for a given
device context.

[戻り値]
If this function succeeds, the return value is a handle to the
hColorSpace being replaced. If this function fails, the return value
is NULL.


%index
SetDCBrushColor
SetDCBrushColor function sets the current device context (DC) brush color to the specified color value. If the device cannot represent the specified color value, the color is set to the nearest physical color.
%group
Win32 gdi32
%prm
hdc, color
hdc : [intptr] A handle to the DC.
color : [int] The new brush color.
%inst
SetDCBrushColor function sets the current device context (DC) brush
color to the specified color value. If the device cannot represent
the specified color value, the color is set to the nearest physical
color.

[戻り値]
If the function succeeds, the return value specifies the previous DC
brush color as a COLORREF value. If the function fails, the return
value is CLR_INVALID.

[備考]
When the stock DC_BRUSH is selected in a DC, all the subsequent
drawings will be done using the DC brush color until the stock brush
is deselected. The default DC_BRUSH color is WHITE. The function
returns the previous DC_BRUSH color, even if the stock brush DC_BRUSH
is not selected in the DC: however, this will not be used in drawing
operations until the stock DC_BRUSH is selected in the DC. The
GetStockObject function with an argument of DC_BRUSH or DC_PEN can be
used interchangeably with the SetDCPenColor and SetDCBrushColor
functions. ICM: Color management is performed if ICM is enabled.


%index
SetDCPenColor
SetDCPenColor function sets the current device context (DC) pen color to the specified color value. If the device cannot represent the specified color value, the color is set to the nearest physical color.
%group
Win32 gdi32
%prm
hdc, color
hdc : [intptr] A handle to the DC.
color : [int] The new pen color.
%inst
SetDCPenColor function sets the current device context (DC) pen color
to the specified color value. If the device cannot represent the
specified color value, the color is set to the nearest physical
color.

[戻り値]
If the function succeeds, the return value specifies the previous DC
pen color as a COLORREF value. If the function fails, the return
value is CLR_INVALID.

[備考]
The function returns the previous DC_PEN color, even if the stock pen
DC_PEN is not selected in the DC; however, this will not be used in
drawing operations until the stock DC_PEN is selected in the DC. The
GetStockObject function with an argument of DC_BRUSH or DC_PEN can be
used interchangeably with the SetDCPenColor and SetDCBrushColor
functions. ICM: Color management is performed if ICM is enabled.


%index
SetDIBColorTable
The SetDIBColorTable function sets RGB (red, green, blue) color values in a range of entries in the color table of the DIB that is currently selected into a specified device context.
%group
Win32 gdi32
%prm
hdc, iStart, cEntries, prgbq
hdc : [intptr] A device context. A DIB must be selected into this device context.
iStart : [int] A zero-based color table index that specifies the first color table entry to set.
cEntries : [int] The number of color table entries to set.
prgbq : [var] A pointer to an array of RGBQUAD structures containing new color information for the DIB's color table.
%inst
The SetDIBColorTable function sets RGB (red, green, blue) color
values in a range of entries in the color table of the DIB that is
currently selected into a specified device context.

[戻り値]
If the function succeeds, the return value is the number of color
table entries that the function sets. If the function fails, the
return value is zero.

[備考]
This function should be called to set the color table for DIBs that
use 1, 4, or 8 bpp. The BitCount member of a bitmap's associated
bitmap information header structure.
BITMAPINFOHEADER structure specifies the number of bits-per-pixel.
Device-independent bitmaps with a biBitCount value greater than 8 do
not have a color table. The bV5BitCount member of a bitmap's
associated BITMAPV5HEADER structure specifies the number of
bits-per-pixel. Device-independent bitmaps with a bV5BitCount value
greater than 8 do not have a color table. ICM: No color management is
performed.


%index
SetDIBits
指定された DIB の色データを使用して互換ビットマップ(DDB)のピクセルを設定する。
%group
Win32 gdi32
%prm
hdc, hbm, start, cLines, lpBits, lpbmi, ColorUse
hdc : [intptr] デバイスコンテキストへのハンドル。
hbm : [intptr] 指定された DIB の色データで変更される互換ビットマップ(DDB)へのハンドル。
start : [int] lpvBits 配列内のデバイス独立色データの開始スキャンライン。
cLines : [int] デバイス独立色データを含む配列内のスキャンライン数。
lpBits : [intptr] バイト配列として保存された DIB 色データへのポインタ。ビットマップ値の形式は lpbmi の BITMAPINFO 構造体の biBitCount メンバに依存する。
lpbmi : [var] DIB に関する情報を含む BITMAPINFO 構造体へのポインタ。
ColorUse : [int] 
%inst
指定された DIB の色データを使用して互換ビットマップ(DDB)のピクセルを設定する。

[戻り値]
関数が成功した場合、戻り値はコピーされたスキャンライン数。失敗した場合は 0。
（以下省略）

[備考]
最適な描画速度は、ビットマップビットがシステムパレットのインデックスの場合に得られる。GetSystemPaletteEntries
でシステムパレットの色とインデックスを取得できる。hdc は fuColorUse が DIB_PAL_COLORS
の場合のみ使用される。hbmp は呼び出し時に DC に選択されていてはならない。スキャンラインは RLE 圧縮を除き DWORD
境界で整列している必要がある。ボトムアップ DIB の原点は左下、トップダウン DIB の原点は左上。ICM: SetICMMode で
ICM_ON が設定されている場合にカラーマネジメントが行われる。


%index
SetDIBitsToDevice
The SetDIBitsToDevice function sets the pixels in the specified rectangle on the device that is associated with the destination device context using color data from a DIB, JPEG, or PNG image.
%group
Win32 gdi32
%prm
hdc, xDest, yDest, w, h, xSrc, ySrc, StartScan, cLines, lpvBits, lpbmi, ColorUse
hdc : [intptr] A handle to the device context.
xDest : [int] The x-coordinate, in logical units, of the upper-left corner of the destination rectangle.
yDest : [int] The y-coordinate, in logical units, of the upper-left corner of the destination rectangle.
w : [int] The width, in logical units, of the image.
h : [int] The height, in logical units, of the image.
xSrc : [int] The x-coordinate, in logical units, of the lower-left corner of the image.
ySrc : [int] The y-coordinate, in logical units, of the lower-left corner of the image.
StartScan : [int] The starting scan line in the image.
cLines : [int] The number of DIB scan lines contained in the array pointed to by the lpvBits parameter.
lpvBits : [intptr] A pointer to the color data stored as an array of bytes. For more information, see the following Remarks section.
lpbmi : [var] A pointer to a BITMAPINFO structure that contains information about the DIB.
ColorUse : [int] Indicates whether the bmiColors member of the BITMAPINFO structure contains explicit red, green, blue (RGB) values or indexes into a palette. For more information, see the following Remarks section.
%inst
The SetDIBitsToDevice function sets the pixels in the specified
rectangle on the device that is associated with the destination
device context using color data from a DIB, JPEG, or PNG image.

[戻り値]
If the function succeeds, the return value is the number of scan
lines set. If zero scan lines are set (such as when dwHeight is 0) or
the function fails, the function returns zero. If the driver cannot
support the JPEG or PNG file image passed to SetDIBitsToDevice, the
function will fail and return GDI_ERROR. If failure does occur, the
application must fall back on its own JPEG or PNG support to
decompress the image into a bitmap, and then pass the bitmap to
SetDIBitsToDevice.

[備考]
Optimal bitmap drawing speed is obtained when the bitmap bits are
indexes into the system palette. Applications can retrieve the system
palette colors and indexes by calling the GetSystemPaletteEntries
function. After the colors and indexes are retrieved, the application
can create the DIB. For more information about the system palette,
see Colors. The scan lines must be aligned on a DWORD except for
RLE-compressed bitmaps. The origin of a bottom-up DIB is the
lower-left corner of the bitmap; the origin of a top-down DIB is the
upper-left corner. To reduce the amount of memory required to set
bits from a large DIB on a device surface, an application can band
the output by repeatedly calling SetDIBitsToDevice, placing a
different portion of the bitmap into the lpvBits array each time. The
values of the uStartScan and cScanLines parameters identify the
portion of the bitmap contained in the lpvBits array. The
SetDIBitsToDevice function returns an error if it is called by a
process that is running in the background while a full-screen MS-DOS
session runs in the foreground.
This doc was truncated.


%index
SetDeviceGammaRamp
The SetDeviceGammaRamp function sets the gamma ramp on direct color display boards having drivers that support downloadable gamma ramps in hardware.
%group
Win32 gdi32
%prm
hdc, lpRamp
hdc : [intptr] Specifies the device context of the direct color display board in question.
lpRamp : [intptr] Pointer to a buffer containing the gamma ramp to be set. The gamma ramp is specified in three arrays of 256 WORD elements each, which contain the mapping between RGB values in the frame buffer and digital-analog-converter (DAC ) values. The sequence of the arrays is red, green, blue. The RGB values must be stored in the most significant bits of each WORD to increase DAC independence.
%inst
The SetDeviceGammaRamp function sets the gamma ramp on direct color
display boards having drivers that support downloadable gamma ramps
in hardware.

[戻り値]
If this function succeeds, the return value is TRUE. If this function
fails, the return value is FALSE.

[備考]
Direct color display modes do not use color lookup tables and are
usually 16, 24, or 32 bit. Not all direct color video boards support
loadable gamma ramps. SetDeviceGammaRamp succeeds only for devices
with drivers that support downloadable gamma ramps in hardware. >
[!NOTE] > This API can take a non-trivial amount of time to execute.
It may take as long as 200ms to return on some hardware.


%index
SetEnhMetaFileBits
The SetEnhMetaFileBits function creates a memory-based enhanced-format metafile from the specified data.
%group
Win32 gdi32
%prm
nSize, pb
nSize : [int] Specifies the size, in bytes, of the data provided.
pb : [var] Pointer to a buffer that contains enhanced-metafile data. (It is assumed that the data in the buffer was obtained by calling the GetEnhMetaFileBits function.)
%inst
The SetEnhMetaFileBits function creates a memory-based
enhanced-format metafile from the specified data.

[戻り値]
If the function succeeds, the return value is a handle to a
memory-based enhanced metafile. If the function fails, the return
value is NULL.

[備考]
When the application no longer needs the enhanced-metafile handle, it
should delete the handle by calling the DeleteEnhMetaFile function.
The SetEnhMetaFileBits function does not accept metafile data in the
Windows format. To import Windows-format metafiles, use the
SetWinMetaFileBits function.


%index
SetGraphicsMode
The SetGraphicsMode function sets the graphics mode for the specified device context.
%group
Win32 gdi32
%prm
hdc, iMode
hdc : [intptr] A handle to the device context.
iMode : [int] 
%inst
The SetGraphicsMode function sets the graphics mode for the specified
device context.

[戻り値]
If the function succeeds, the return value is the old graphics mode.
If the function fails, the return value is zero.

[備考]
There are three areas in which graphics output differs according to
the graphics mode:
This doc was truncated.


%index
SetICMMode
The SetICMMode function causes Image Color Management to be enabled, disabled, or queried on a given device context (DC).
%group
Win32 gdi32
%prm
hdc, mode
hdc : [intptr] Identifies handle to the device context.
mode : [int] Turns on and off image color management. This parameter can take one of the following constant values.
%inst
The SetICMMode function causes Image Color Management to be enabled,
disabled, or queried on a given device context (DC).

[戻り値]
If this function succeeds, the return value is a nonzero value. If
this function fails, the return value is zero. If ICM_QUERY is
specified and the function succeeds, the nonzero value returned is
ICM_ON or ICM_OFF to indicate the current mode.

[備考]
If the system cannot find an ICC color profile to match the state of
the device, SetICMMode fails and returns zero. Once WCS is enabled
for a device context (DC), colors passed into the DC using most Win32
API functions are color matched. The primary exceptions are BitBlt
and StretchBlt. The assumption is that when performing a bit block
transfer (blit) from one DC to another, the two DCs are already
compatible and need no color correction. If this is not the case,
color correction may be performed. Specifically, if a device
independent bitmap (DIB) is used as the source for a blit, and the
blit is performed into a DC that has WCS enabled, color matching will
be performed. If this is not what you want, turn WCS off for the
destination DC by calling SetICMMode before calling BitBlt or
StretchBlt. If the CreateCompatibleDC function is used to create a
bitmap in a DC, it is possible for the bitmap to be color matched
twice, once when it is created and once when a blit is performed. The
reason is that a bitmap in a DC created by the CreateCompatibleDC
function acquires the current brush, pens, and palette of the source
DC. However, WCS will be disabled by default for the new DC. If WCS
is later enabled for the new DC by using the SetICMMode function, a
color correction will be done. To prevent double color corrections
through the use of the CreateCompatibleDC function, use the
SetICMMode function to turn WCS off for the source DC before the
CreateCompatibleDC function is called. When a compatible DC is
created from a printer's DC (see CreateCompatibleDC ), the default is
for color matching to always be performed if it is enabled for the
printer's DC. The default color profile for the printer is used when
a blit is performed into the printer's DC using SetDIBitsToDevice or
StretchDIBits. If this is not what you want, turn WCS off for the
printer's DC by calling SetICMMode before calling SetDIBitsToDevice
or StretchDIBits. Also, when printing to a printer's DC with WCS
turned on, the SetICMMode function needs to be called after every
call to the StartPage function to turn back on WCS. The StartPage
function calls the RestoreDC and SaveDC functions, which result in
WCS being turned off for the printer's DC.


%index
SetICMProfileW
The SetICMProfile function sets a specified color profile as the output profile for a specified device context (DC). (Unicode)
%group
Win32 gdi32
%prm
hdc, lpFileName
hdc : [intptr] Specifies a device context in which to set the color profile.
lpFileName : [wstr] Specifies the path name of the color profile to be set.
%inst
The SetICMProfile function sets a specified color profile as the
output profile for a specified device context (DC). (Unicode)

[戻り値]
If this function succeeds, the return value is TRUE. If this function
fails, the return value is FALSE.

[備考]
SetICMProfile associates a color profile with a device context. It
becomes the output profile for that device context. The color profile
does not have to be associated with any particular device.
Device-independent profiles such as sRGB can also be used. If the
color profile is not associated with a hardware device, it will be
returned by GetICMProfile, but not by EnumICMProfiles. Note that
under Windows 95 or later, the PostScript device driver for printers
assumes a CMYK color model. Therefore, all PostScript printers must
use a CMYK color profile. Windows 2000 does not have this limitation.
SetICMProfile supports only RGB profiles in compatible DCs. Windows
95/98/Me: SetICMProfileW is supported by the Microsoft Layer for
Unicode. To use this, you must add certain files to your application,
as outlined in Microsoft Layer for Unicode on Windows 95/98/Me
Systems.
> [!NOTE] > The wingdi.h header defines SetICMProfile as an alias
which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
SetLayout
The SetLayout function changes the layout of a device context (DC).
%group
Win32 gdi32
%prm
hdc, l
hdc : [intptr] A handle to the DC.
l : [int] 
%inst
The SetLayout function changes the layout of a device context (DC).

[戻り値]
If the function succeeds, it returns the previous layout of the DC.
If the function fails, it returns GDI_ERROR.

[備考]
The layout specifies the order in which text and graphics are
revealed in a window or a device context. The default is left to
right. The SetLayout function changes this to be right to left, which
is the standard in Arabic and Hebrew cultures. Once the LAYOUT_RTL
flag is selected, flags normally specifying right or left are
reversed. To avoid confusion, consider defining alternate words for
standard flags, such as those in the following table.
This doc was truncated.


%index
SetMapMode
The SetMapMode function sets the mapping mode of the specified device context. The mapping mode defines the unit of measure used to transform page-space units into device-space units, and also defines the orientation of the device's x and y axes.
%group
Win32 gdi32
%prm
hdc, iMode
hdc : [intptr] A handle to the device context.
iMode : [int] 
%inst
The SetMapMode function sets the mapping mode of the specified device
context. The mapping mode defines the unit of measure used to
transform page-space units into device-space units, and also defines
the orientation of the device's x and y axes.

[戻り値]
If the function succeeds, the return value identifies the previous
mapping mode. If the function fails, the return value is zero.

[備考]
The MM_TEXT mode allows applications to work in device pixels, whose
size varies from device to device. The MM_HIENGLISH, MM_HIMETRIC,
MM_LOENGLISH, MM_LOMETRIC, and MM_TWIPS modes are useful for
applications drawing in physically meaningful units (such as inches
or millimeters). The MM_ISOTROPIC mode ensures a 1:1 aspect ratio.
The MM_ANISOTROPIC mode allows the x-coordinates and y-coordinates to
be adjusted independently.


%index
SetMapperFlags
The SetMapperFlags function alters the algorithm the font mapper uses when it maps logical fonts to physical fonts.
%group
Win32 gdi32
%prm
hdc, flags
hdc : [intptr] A handle to the device context that contains the font-mapper flag.
flags : [int] Specifies whether the font mapper should attempt to match a font's aspect ratio to the current device's aspect ratio. If bit zero is set, the mapper selects only matching fonts.
%inst
The SetMapperFlags function alters the algorithm the font mapper uses
when it maps logical fonts to physical fonts.

[戻り値]
If the function succeeds, the return value is the previous value of
the font-mapper flag. If the function fails, the return value is
GDI_ERROR.

[備考]
If the dwFlag parameter is set and no matching fonts exist, Windows
chooses a new aspect ratio and retrieves a font that matches this
ratio. The remaining bits of the dwFlag parameter must be zero.


%index
SetMetaFileBitsEx
The SetMetaFileBitsEx function creates a memory-based Windows-format metafile from the supplied data.
%group
Win32 gdi32
%prm
cbBuffer, lpData
cbBuffer : [int] Specifies the size, in bytes, of the Windows-format metafile.
lpData : [var] Pointer to a buffer that contains the Windows-format metafile. (It is assumed that the data was obtained by using the GetMetaFileBitsEx function.)
%inst
The SetMetaFileBitsEx function creates a memory-based Windows-format
metafile from the supplied data.

[戻り値]
If the function succeeds, the return value is a handle to a
memory-based Windows-format metafile. If the function fails, the
return value is NULL.

[備考]
To convert a Windows-format metafile into an enhanced-format
metafile, use the SetWinMetaFileBits function. When the application
no longer needs the metafile handle returned by SetMetaFileBitsEx, it
should delete it by calling the DeleteMetaFile function.


%index
SetMetaRgn
The SetMetaRgn function intersects the current clipping region for the specified device context with the current metaregion and saves the combined region as the new metaregion for the specified device context.
%group
Win32 gdi32
%prm
hdc
hdc : [intptr] A handle to the device context.
%inst
The SetMetaRgn function intersects the current clipping region for
the specified device context with the current metaregion and saves
the combined region as the new metaregion for the specified device
context.

[戻り値]
The return value specifies the new clipping region's complexity and
can be one of the following values.
This doc was truncated.

[備考]
The current clipping region of a device context is defined by the
intersection of its clipping region and its metaregion. The
SetMetaRgn function should only be called after an application's
original device context was saved by calling the SaveDC function.


%index
SetMiterLimit
The SetMiterLimit function sets the limit for the length of miter joins for the specified device context.
%group
Win32 gdi32
%prm
hdc, limit, old
hdc : [intptr] Handle to the device context.
limit : [float] Specifies the new miter limit for the device context.
old : [var] Pointer to a floating-point value that receives the previous miter limit. If this parameter is NULL, the previous miter limit is not returned.
%inst
The SetMiterLimit function sets the limit for the length of miter
joins for the specified device context.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero.

[備考]
The miter length is defined as the distance from the intersection of
the line walls on the inside of the join to the intersection of the
line walls on the outside of the join. The miter limit is the maximum
allowed ratio of the miter length to the line width. The default
miter limit is 10.0. Note Setting eNewLimit to a float value less
than 1.0f will cause the function to fail.


%index
SetPaletteEntries
The SetPaletteEntries function sets RGB (red, green, blue) color values and flags in a range of entries in a logical palette.
%group
Win32 gdi32
%prm
hpal, iStart, cEntries, pPalEntries
hpal : [intptr] A handle to the logical palette.
iStart : [int] The first logical-palette entry to be set.
cEntries : [int] The number of logical-palette entries to be set.
pPalEntries : [var] A pointer to the first member of an array of PALETTEENTRY structures containing the RGB values and flags.
%inst
The SetPaletteEntries function sets RGB (red, green, blue) color
values and flags in a range of entries in a logical palette.

[戻り値]
If the function succeeds, the return value is the number of entries
that were set in the logical palette. If the function fails, the
return value is zero.

[備考]
An application can determine whether a device supports palette
operations by calling the GetDeviceCaps function and specifying the
RASTERCAPS constant. Even if a logical palette has been selected and
realized, changes to the palette do not affect the physical palette
in the surface. RealizePalette must be called again to set the new
logical palette into the surface.


%index
SetPixel
指定された座標のピクセルを指定された色に設定する。
%group
Win32 gdi32
%prm
hdc, x, y, color
hdc : [intptr] デバイスコンテキストへのハンドル。
x : [int] 設定する点の x 座標(論理単位)。
y : [int] 設定する点の y 座標(論理単位)。
color : [int] 点を描くのに使用する色。COLORREF 値は RGB マクロで作成する。
%inst
指定された座標のピクセルを指定された色に設定する。

[戻り値]
関数が成功した場合、戻り値は関数がピクセルを設定した RGB
値。これは指定した色と異なる場合がある(正確な一致が見つからない場合)。失敗した場合は -1。
（以下省略）

[備考]
ピクセル座標が現在のクリッピング領域外の場合、関数は失敗する。すべてのデバイスが SetPixel をサポートするわけではない。詳細は
GetDeviceCaps を参照。


%index
SetPixelFormat
The SetPixelFormat function sets the pixel format of the specified device context to the format specified by the iPixelFormat index.
%group
Win32 gdi32
%prm
hdc, format, ppfd
hdc : [intptr] Specifies the device context whose pixel format the function attempts to set.
format : [int] Index that identifies the pixel format to set. The various pixel formats supported by a device context are identified by one-based indexes.
ppfd : [var] Pointer to a PIXELFORMATDESCRIPTOR structure that contains the logical pixel format specification. The system's metafile component uses this structure to record the logical pixel format specification. The structure has no other effect upon the behavior of the SetPixelFormat function.
%inst
The SetPixelFormat function sets the pixel format of the specified
device context to the format specified by the iPixelFormat index.

[戻り値]
If the function succeeds, the return value is TRUE. If the function
fails, the return value is FALSE. To get extended error information,
call GetLastError.

[備考]
If hdc references a window, calling the SetPixelFormat function also
changes the pixel format of the window. Setting the pixel format of a
window more than once can lead to significant complications for the
Window Manager and for multithread applications, so it is not
allowed. An application can only set the pixel format of a window one
time. Once a window's pixel format is set, it cannot be changed. You
should select a pixel format in the device context before calling the
wglCreateContext function. The wglCreateContext function creates a
rendering context for drawing on the device in the selected pixel
format of the device context. An OpenGL window has its own pixel
format. Because of this, only device contexts retrieved for the
client area of an OpenGL window are allowed to draw into the window.
As a result, an OpenGL window should be created with the
WS_CLIPCHILDREN and WS_CLIPSIBLINGS styles. Additionally, the window
class attribute should not include the CS_PARENTDC style.


%index
SetPixelV
The SetPixelV function sets the pixel at the specified coordinates to the closest approximation of the specified color. The point must be in the clipping region and the visible part of the device surface.
%group
Win32 gdi32
%prm
hdc, x, y, color
hdc : [intptr] A handle to the device context.
x : [int] The x-coordinate, in logical units, of the point to be set.
y : [int] The y-coordinate, in logical units, of the point to be set.
color : [int] The color to be used to paint the point. To create a COLORREF color value, use the RGB macro.
%inst
The SetPixelV function sets the pixel at the specified coordinates to
the closest approximation of the specified color. The point must be
in the clipping region and the visible part of the device surface.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero.

[備考]
Not all devices support the SetPixelV function. For more information,
see the description of the RC_BITBLT capability in the GetDeviceCaps
function. SetPixelV is faster than SetPixel because it does not need
to return the color value of the point actually painted.


%index
SetPolyFillMode
The SetPolyFillMode function sets the polygon fill mode for functions that fill polygons.
%group
Win32 gdi32
%prm
hdc, mode
hdc : [intptr] A handle to the device context.
mode : [int] 
%inst
The SetPolyFillMode function sets the polygon fill mode for functions
that fill polygons.

[戻り値]
The return value specifies the previous filling mode. If an error
occurs, the return value is zero.

[備考]
In general, the modes differ only in cases where a complex,
overlapping polygon must be filled (for example, a five-sided polygon
that forms a five-pointed star with a pentagon in the center). In
such cases, ALTERNATE mode fills every other enclosed region within
the polygon (that is, the points of the star), but WINDING mode fills
all regions (that is, the points and the pentagon). When the fill
mode is ALTERNATE, GDI fills the area between odd-numbered and
even-numbered polygon sides on each scan line. That is, GDI fills the
area between the first and second side, between the third and fourth
side, and so on. When the fill mode is WINDING, GDI fills any region
that has a nonzero winding value. This value is defined as the number
of times a pen used to draw the polygon would go around the region.
The direction of each edge of the polygon is important.


%index
SetROP2
現在の前景混合モードを設定する。
%group
Win32 gdi32
%prm
hdc, rop2
hdc : [intptr] デバイスコンテキストへのハンドル。
rop2 : [int] 
%inst
現在の前景混合モードを設定する。

[戻り値]
関数が成功した場合、戻り値は以前の混合モード。失敗した場合は 0。

[備考]
混合モードは、現在のペンで描画する際に GDI が元と先の色をどのように結合するかを定義する。混合モードは AND、OR、XOR、NOT
を使った 2 変数のすべての論理関数を表すバイナリラスタ操作コードである。ラスタデバイスでのみ使用可能(ベクタデバイスでは使用不可)。


%index
SetRectRgn
The SetRectRgn function converts a region into a rectangular region with the specified coordinates.
%group
Win32 gdi32
%prm
hrgn, left, top, right, bottom
hrgn : [intptr] Handle to the region.
left : [int] Specifies the x-coordinate of the upper-left corner of the rectangular region in logical units.
top : [int] Specifies the y-coordinate of the upper-left corner of the rectangular region in logical units.
right : [int] Specifies the x-coordinate of the lower-right corner of the rectangular region in logical units.
bottom : [int] Specifies the y-coordinate of the lower-right corner of the rectangular region in logical units.
%inst
The SetRectRgn function converts a region into a rectangular region
with the specified coordinates.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero.

[備考]
The region does not include the lower and right boundaries of the
rectangle.


%index
SetStretchBltMode
The SetStretchBltMode function sets the bitmap stretching mode in the specified device context.
%group
Win32 gdi32
%prm
hdc, mode
hdc : [intptr] A handle to the device context.
mode : [int] 
%inst
The SetStretchBltMode function sets the bitmap stretching mode in the
specified device context.

[戻り値]
If the function succeeds, the return value is the previous stretching
mode. If the function fails, the return value is zero. This function
can return the following value.
This doc was truncated.

[備考]
The stretching mode defines how the system combines rows or columns
of a bitmap with existing pixels on a display device when an
application calls the StretchBlt function. The BLACKONWHITE
(STRETCH_ANDSCANS) and WHITEONBLACK (STRETCH_ORSCANS) modes are
typically used to preserve foreground pixels in monochrome bitmaps.
The COLORONCOLOR (STRETCH_DELETESCANS) mode is typically used to
preserve color in color bitmaps. The HALFTONE mode is slower and
requires more processing of the source image than the other three
modes; but produces higher quality images. Also note that
SetBrushOrgEx must be called after setting the HALFTONE mode to avoid
brush misalignment. Additional stretching modes might also be
available depending on the capabilities of the device driver.


%index
SetSystemPaletteUse
The SetSystemPaletteUse function allows an application to specify whether the system palette contains 2 or 20 static colors.
%group
Win32 gdi32
%prm
hdc, use
hdc : [intptr] A handle to the device context. This device context must refer to a device that supports color palettes.
use : [int] 
%inst
The SetSystemPaletteUse function allows an application to specify
whether the system palette contains 2 or 20 static colors.

[戻り値]
If the function succeeds, the return value is the previous system
palette. It can be either SYSPAL_NOSTATIC, SYSPAL_NOSTATIC256, or
SYSPAL_STATIC. If the function fails, the return value is
SYSPAL_ERROR.

[備考]
An application can determine whether a device supports palette
operations by calling the GetDeviceCaps function and specifying the
RASTERCAPS constant. When an application window moves to the
foreground and the SYSPAL_NOSTATIC value is set, the application must
call the GetSysColor function to save the current system colors
setting. It must also call SetSysColors to set reasonable values
using only black and white. When the application returns to the
background or terminates, the previous system colors must be
restored. If the function returns SYSPAL_ERROR, the specified device
context is invalid or does not support color palettes. An application
must call this function only when its window is maximized and has the
input focus. If an application calls SetSystemPaletteUse with uUsage
set to SYSPAL_NOSTATIC, the system continues to set aside two entries
in the system palette for pure white and pure black, respectively.
After calling this function with uUsage set to SYSPAL_NOSTATIC, an
application must take the following steps:
This doc was truncated.


%index
SetTextAlign
The SetTextAlign function sets the text-alignment flags for the specified device context.
%group
Win32 gdi32
%prm
hdc, align
hdc : [intptr] A handle to the device context.
align : [int] The text alignment by using a mask of the values in the following list. Only one flag can be chosen from those that affect horizontal and vertical alignment. In addition, only one of the two flags that alter the current position can be chosen.
%inst
The SetTextAlign function sets the text-alignment flags for the
specified device context.

[戻り値]
If the function succeeds, the return value is the previous
text-alignment setting. If the function fails, the return value is
GDI_ERROR.

[備考]
The TextOut and ExtTextOut functions use the text-alignment flags to
position a string of text on a display or other device. The flags
specify the relationship between a reference point and a rectangle
that bounds the text. The reference point is either the current
position or a point passed to a text output function. The rectangle
that bounds the text is formed by the character cells in the text
string. The best way to get left-aligned text is to use either
This doc was truncated.


%index
SetTextCharacterExtra
The SetTextCharacterExtra function sets the intercharacter spacing. Intercharacter spacing is added to each character, including break characters, when the system writes a line of text.
%group
Win32 gdi32
%prm
hdc, extra
hdc : [intptr] A handle to the device context.
extra : [int] The amount of extra space, in logical units, to be added to each character. If the current mapping mode is not MM_TEXT, the nCharExtra parameter is transformed and rounded to the nearest pixel.
%inst
The SetTextCharacterExtra function sets the intercharacter spacing.
Intercharacter spacing is added to each character, including break
characters, when the system writes a line of text.

[戻り値]
If the function succeeds, the return value is the previous
intercharacter spacing. If the function fails, the return value is
0x80000000.

[備考]
This function is supported mainly for compatibility with existing
applications. New applications should generally avoid calling this
function, because it is incompatible with complex scripts (scripts
that require text shaping; Arabic script is an example of this). The
recommended approach is that instead of calling this function and
then TextOut, applications should call ExtTextOut and use its lpDx
parameter to supply widths.


%index
SetTextColor
指定されたデバイスコンテキストのテキスト色を指定された色に設定する。
%group
Win32 gdi32
%prm
hdc, color
hdc : [intptr] デバイスコンテキストへのハンドル。
color : [int] テキストの色。
%inst
指定されたデバイスコンテキストのテキスト色を指定された色に設定する。

[戻り値]
関数が成功した場合、戻り値は以前のテキスト色への色参照(COLORREF 値)。失敗した場合は CLR_INVALID。

[備考]
テキスト色は TextOut および ExtTextOut
で書き込まれる各文字の顔面を描画するために使用される。ビットマップのカラー/モノクロ変換時にも使用される。


%index
SetTextJustification
The SetTextJustification function specifies the amount of space the system should add to the break characters in a string of text. The space is added when an application calls the TextOut or ExtTextOut functions.
%group
Win32 gdi32
%prm
hdc, extra, count
hdc : [intptr] A handle to the device context.
extra : [int] The total extra space, in logical units, to be added to the line of text. If the current mapping mode is not MM_TEXT, the value identified by the nBreakExtra parameter is transformed and rounded to the nearest pixel.
count : [int] The number of break characters in the line.
%inst
The SetTextJustification function specifies the amount of space the
system should add to the break characters in a string of text. The
space is added when an application calls the TextOut or ExtTextOut
functions.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero.

[備考]
The break character is usually the space character (ASCII 32), but it
may be defined by a font as some other character. The GetTextMetrics
function can be used to retrieve a font's break character. The
TextOut function distributes the specified extra space evenly among
the break characters in the line. The GetTextExtentPoint32 function
is always used with the SetTextJustification function. Sometimes the
GetTextExtentPoint32 function takes justification into account when
computing the width of a specified line before justification, and
sometimes it does not. For more details on this, see
GetTextExtentPoint32. This width must be known before an appropriate
nBreakExtra value can be computed. SetTextJustification can be used
to justify a line that contains multiple strings in different fonts.
In this case, each string must be justified separately. Because
rounding errors can occur during justification, the system keeps a
running error term that defines the current error value. When
justifying a line that contains multiple runs, GetTextExtentPoint
automatically uses this error term when it computes the extent of the
next run, allowing TextOut to blend the error into the new run. After
each line has been justified, this error term must be cleared to
prevent it from being incorporated into the next line. The term can
be cleared by calling SetTextJustification with nBreakExtra set to
zero.


%index
SetViewportExtEx
Sets the horizontal and vertical extents of the viewport for a device context by using the specified values.
%group
Win32 gdi32
%prm
hdc, x, y, lpsz
hdc : [intptr] A handle to the device context.
x : [int] The horizontal extent, in device units, of the viewport.
y : [int] The vertical extent, in device units, of the viewport.
lpsz : [var] A pointer to a SIZE structure that receives the previous viewport extents, in device units. If lpSize is NULL, this parameter is not used.
%inst
Sets the horizontal and vertical extents of the viewport for a device
context by using the specified values.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero.

[備考]
The viewport refers to the device coordinate system of the device
space. The extent is the maximum value of an axis. This function sets
the maximum values for the horizontal and vertical axes of the
viewport in device coordinates (or pixels). When mapping between page
space and device space, SetWindowExtEx and SetViewportExtEx determine
the scaling factor between the window and the viewport. For more
information, see Transformation of Coordinate Spaces. When the
following mapping modes are set, calls to the SetWindowExtEx and
SetViewportExtEx functions are ignored.
This doc was truncated.


%index
SetViewportOrgEx
The SetViewportOrgEx function specifies which device point maps to the window origin (0,0).
%group
Win32 gdi32
%prm
hdc, x, y, lppt
hdc : [intptr] A handle to the device context.
x : [int] The x-coordinate, in device units, of the new viewport origin.
y : [int] The y-coordinate, in device units, of the new viewport origin.
lppt : [var] A pointer to a POINT structure that receives the previous viewport origin, in device coordinates. If lpPoint is NULL, this parameter is not used.
%inst
The SetViewportOrgEx function specifies which device point maps to
the window origin (0,0).

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero.

[備考]
This function (along with SetViewportExtEx and SetWindowExtEx) helps
define the mapping from the logical coordinate space (also known as a
window) to the device coordinate space (the viewport).
SetViewportOrgEx specifies which device point maps to the logical
point (0,0). It has the effect of shifting the axes so that the
logical point (0,0) no longer refers to the upper-left corner.
This doc was truncated.


%index
SetWinMetaFileBits
The SetWinMetaFileBits function converts a metafile from the older Windows format to the new enhanced format and stores the new metafile in memory.
%group
Win32 gdi32
%prm
nSize, lpMeta16Data, hdcRef, lpMFP
nSize : [int] The size, in bytes, of the buffer that contains the Windows-format metafile.
lpMeta16Data : [var] A pointer to a buffer that contains the Windows-format metafile data. (It is assumed that the data was obtained by using the GetMetaFileBitsEx or GetWinMetaFileBits function.)
hdcRef : [intptr] A handle to a reference device context.
lpMFP : [var] A pointer to a METAFILEPICT structure that contains the suggested size of the metafile picture and the mapping mode that was used when the picture was created.
%inst
The SetWinMetaFileBits function converts a metafile from the older
Windows format to the new enhanced format and stores the new metafile
in memory.

[戻り値]
If the function succeeds, the return value is a handle to a
memory-based enhanced metafile. If the function fails, the return
value is NULL.

[備考]
Windows uses the reference device context's resolution data and the
data in the METAFILEPICT structure to scale a picture. If the hdcRef
parameter is NULL, the system uses resolution data for the current
output device. If the lpmfp parameter is NULL, the system uses the
MM_ANISOTROPIC mapping mode to scale the picture so that it fits the
entire device surface. The hMF member of the METAFILEPICT structure
is not used. When the application no longer needs the enhanced
metafile handle, it should delete it by calling the DeleteEnhMetaFile
function. The handle returned by this function can be used with other
enhanced-metafile functions. If the reference device context is not
identical to the device in which the metafile was originally created,
some GDI functions that use device units may not draw the picture
correctly.


%index
SetWindowExtEx
The SetWindowExtEx function sets the horizontal and vertical extents of the window for a device context by using the specified values.
%group
Win32 gdi32
%prm
hdc, x, y, lpsz
hdc : [intptr] A handle to the device context.
x : [int] The window's horizontal extent in logical units.
y : [int] The window's vertical extent in logical units.
lpsz : [var] A pointer to a SIZE structure that receives the previous window extents, in logical units. If lpSize is NULL, this parameter is not used.
%inst
The SetWindowExtEx function sets the horizontal and vertical extents
of the window for a device context by using the specified values.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero.

[備考]
The window refers to the logical coordinate system of the page space.
The extent is the maximum value of an axis. This function sets the
maximum values for the horizontal and vertical axes of the window (in
logical coordinates). When mapping between page space and device
space, SetViewportExtEx and SetWindowExtEx determine the scaling
factor between the window and the viewport. For more information, see
Transformation of Coordinate Spaces. When the following mapping modes
are set, calls to the SetWindowExtEx and SetViewportExtEx functions
are ignored:
This doc was truncated.


%index
SetWindowOrgEx
The SetWindowOrgEx function specifies which window point maps to the viewport origin (0,0).
%group
Win32 gdi32
%prm
hdc, x, y, lppt
hdc : [intptr] A handle to the device context.
x : [int] The x-coordinate, in logical units, of the new window origin.
y : [int] The y-coordinate, in logical units, of the new window origin.
lppt : [var] A pointer to a POINT structure that receives the previous origin of the window, in logical units. If lpPoint is NULL, this parameter is not used.
%inst
The SetWindowOrgEx function specifies which window point maps to the
viewport origin (0,0).

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero.

[備考]
This helps define the mapping from the logical coordinate space (also
known as a window) to the device coordinate space (the viewport).
SetWindowOrgEx specifies which logical point maps to the device point
(0,0). It has the effect of shifting the axes so that the logical
point (0,0) no longer refers to the upper-left corner.
This doc was truncated.


%index
SetWorldTransform
The SetWorldTransform function sets a two-dimensional linear transformation between world space and page space for the specified device context. This transformation can be used to scale, rotate, shear, or translate graphics output.
%group
Win32 gdi32
%prm
hdc, lpxf
hdc : [intptr] A handle to the device context.
lpxf : [var] A pointer to an XFORM structure that contains the transformation data.
%inst
The SetWorldTransform function sets a two-dimensional linear
transformation between world space and page space for the specified
device context. This transformation can be used to scale, rotate,
shear, or translate graphics output.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero.

[備考]
Below is the transformation matrix (note that the digits in the
element notation are 1-based column number followed by 1-based row
number, rather than the reverse).
This doc was truncated.


%index
StartDocW
The StartDoc function starts a print job. (Unicode)
%group
Win32 gdi32
%prm
hdc, lpdi
hdc : [intptr] A handle to the device context for the print job.
lpdi : [var] A pointer to a DOCINFO structure containing the name of the document file and the name of the output file.
%inst
The StartDoc function starts a print job. (Unicode)

[戻り値]
If the function succeeds, the return value is greater than zero. This
value is the print job identifier for the document. If the function
fails, the return value is less than or equal to zero.

[備考]
Note This is a blocking or synchronous function and might not return
immediately. How quickly this function returns depends on run-time
factors such as network status, print server configuration, and
printer driver implementation?factors that are difficult to predict
when writing an application. Calling this function from a thread that
manages interaction with the user interface could make the
application appear to be unresponsive. Applications should call the
StartDoc function immediately before beginning a print job. Using
this function ensures that multipage documents are not interspersed
with other print jobs. Applications can use the value returned by
StartDoc to retrieve or set the priority of a print job. Call the
GetJob or SetJob function and supply this value as one of the
required arguments.


%index
StartPage
The StartPage function prepares the printer driver to accept data.
%group
Win32 gdi32
%prm
hdc
hdc : [intptr] A handle to the device context for the print job.
%inst
The StartPage function prepares the printer driver to accept data.

[戻り値]
If the function succeeds, the return value is greater than zero. If
the function fails, the return value is less than or equal to zero.

[備考]
Note This is a blocking or synchronous function and might not return
immediately. How quickly this function returns depends on run-time
factors such as network status, print server configuration, and
printer driver implementation?factors that are difficult to predict
when writing an application. Calling this function from a thread that
manages interaction with the user interface could make the
application appear to be unresponsive. The system disables the
ResetDC function between calls to the StartPage and EndPage
functions. This means that you cannot change the device mode except
at page boundaries. After calling EndPage, you can call ResetDC to
change the device mode, if necessary. Note that a call to ResetDC
resets all device context attributes back to default values. Neither
EndPage nor StartPage resets the device context attributes. Device
context attributes remain constant across subsequent pages. You do
not need to re-select objects and set up the mapping mode again
before printing the next page; however, doing so will produce the
same results and reduce code differences between versions of Windows.


%index
StretchBlt
元矩形から先矩形へビットマップをコピーし、必要に応じて先矩形の寸法に合うようにビットマップを伸縮する。
%group
Win32 gdi32
%prm
hdcDest, xDest, yDest, wDest, hDest, hdcSrc, xSrc, ySrc, wSrc, hSrc, rop
hdcDest : [intptr] 先デバイスコンテキストへのハンドル。
xDest : [int] 先矩形の左上隅の x 座標(論理単位)。
yDest : [int] 先矩形の左上隅の y 座標(論理単位)。
wDest : [int] 先矩形の幅(論理単位)。
hDest : [int] 先矩形の高さ(論理単位)。
hdcSrc : [intptr] 元デバイスコンテキストへのハンドル。
xSrc : [int] 元矩形の左上隅の x 座標(論理単位)。
ySrc : [int] 元矩形の左上隅の y 座標(論理単位)。
wSrc : [int] 元矩形の幅(論理単位)。
hSrc : [int] 元矩形の高さ(論理単位)。
rop : [int] 実行するラスタ操作。ラスタ操作コードは、ブラシ、元ビットマップ、先ビットマップを伴う出力操作でシステムが色をどう結合するかを定義する。一般的な ROP のリストは BitBlt を参照。なお、CAPTUREBLT ROP は一般にプリンタデバイスコンテキストでは使用できない。
%inst
元矩形から先矩形へビットマップをコピーし、必要に応じて先矩形の寸法に合うようにビットマップを伸縮する。

[戻り値]
関数が成功した場合、戻り値は 0 以外。失敗した場合は 0。

[備考]
StretchBlt
はメモリ上で元ビットマップを伸縮し、先矩形にコピーする。パターンまたは先ピクセルの色データは伸縮後に結合される。拡張メタファイル記録中に元
DC が拡張メタファイル DC の場合はエラー。ラスタ操作がブラシを必要とする場合、先 DC
に現在選択されているブラシが使用される。元の変換に回転やせん断がある場合はエラー。色形式が一致しない場合は変換される。幅や高さの符号が異なる場合はミラーイメージが作成される。ICM:
カラーマネジメントは行われない。複数モニタ環境では元と先が同じデバイスでなければならない。
（以下省略）


%index
StretchDIBits
The StretchDIBits function copies the color data for a rectangle of pixels in a DIB, JPEG, or PNG image to the specified destination rectangle.
%group
Win32 gdi32
%prm
hdc, xDest, yDest, DestWidth, DestHeight, xSrc, ySrc, SrcWidth, SrcHeight, lpBits, lpbmi, iUsage, rop
hdc : [intptr] A handle to the destination device context.
xDest : [int] The x-coordinate, in logical units, of the upper-left corner of the destination rectangle.
yDest : [int] The y-coordinate, in logical units, of the upper-left corner of the destination rectangle.
DestWidth : [int] The width, in logical units, of the destination rectangle.
DestHeight : [int] The height, in logical units, of the destination rectangle.
xSrc : [int] The x-coordinate, in pixels, of the source rectangle in the image.
ySrc : [int] The y-coordinate, in pixels, of the source rectangle in the image.
SrcWidth : [int] The width, in pixels, of the source rectangle in the image.
SrcHeight : [int] The height, in pixels, of the source rectangle in the image.
lpBits : [intptr] A pointer to the image bits, which are stored as an array of bytes. For more information, see the Remarks section.
lpbmi : [var] A pointer to a BITMAPINFO structure that contains information about the DIB.
iUsage : [int] 
rop : [int] A raster-operation code that specifies how the source pixels, the destination device context's current brush, and the destination pixels are to be combined to form the new image. For a list of some common raster operation codes, see BitBlt.
%inst
The StretchDIBits function copies the color data for a rectangle of
pixels in a DIB, JPEG, or PNG image to the specified destination
rectangle.

[戻り値]
If the function succeeds, the return value is the number of scan
lines copied. Note that this value can be negative for mirrored
content. If the function fails, or no scan lines are copied, the
return value is 0. If the driver cannot support the JPEG or PNG file
image passed to StretchDIBits, the function will fail and return
GDI_ERROR. If failure does occur, the application must fall back on
its own JPEG or PNG support to decompress the image into a bitmap,
and then pass the bitmap to StretchDIBits.

[備考]
The origin of a bottom-up DIB is the lower-left corner; the origin of
a top-down DIB is the upper-left corner. StretchDIBits creates a
mirror image of a bitmap if the signs of the nSrcWidth and nDestWidth
parameters, or if the nSrcHeight and nDestHeight parameters differ.
If nSrcWidth and nDestWidth have different signs, the function
creates a mirror image of the bitmap along the x-axis. If nSrcHeight
and nDestHeight have different signs, the function creates a mirror
image of the bitmap along the y-axis. StretchDIBits creates a
top-down image if the sign of the biHeight member of the
BITMAPINFOHEADER structure for the DIB is negative. For a code
example, see Sizing a JPEG or PNG Image. This function allows a JPEG
or PNG image to be passed as the source image. How each parameter is
used remains the same, except:
This doc was truncated.


%index
StrokeAndFillPath
The StrokeAndFillPath function closes any open figures in a path, strokes the outline of the path by using the current pen, and fills its interior by using the current brush.
%group
Win32 gdi32
%prm
hdc
hdc : [intptr] A handle to the device context.
%inst
The StrokeAndFillPath function closes any open figures in a path,
strokes the outline of the path by using the current pen, and fills
its interior by using the current brush.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero.

[備考]
The device context identified by the hdc parameter must contain a
closed path. The StrokeAndFillPath function has the same effect as
closing all the open figures in the path, and stroking and filling
the path separately, except that the filled region will not overlap
the stroked region even if the pen is wide.


%index
StrokePath
The StrokePath function renders the specified path by using the current pen.
%group
Win32 gdi32
%prm
hdc
hdc : [intptr] Handle to a device context that contains the completed path.
%inst
The StrokePath function renders the specified path by using the
current pen.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero.

[備考]
The path, if it is to be drawn by StrokePath, must have been
completed through a call to EndPath. Calling this function on a path
for which EndPath has not been called will cause this function to
fail and return zero. Unlike other path drawing functions such as
StrokeAndFillPath, StrokePath will not attempt to close the path by
drawing a straight line from the first point on the path to the last
point on the path.


%index
SwapBuffers
The SwapBuffers function exchanges the front and back buffers if the current pixel format for the window referenced by the specified device context includes a back buffer.
%group
Win32 gdi32
%prm
param0
param0 : [intptr] 
%inst
The SwapBuffers function exchanges the front and back buffers if the
current pixel format for the window referenced by the specified
device context includes a back buffer.

[戻り値]
If the function succeeds, the return value is TRUE. If the function
fails, the return value is FALSE. To get extended error information,
call GetLastError.

[備考]
If the current pixel format for the window referenced by the device
context does not include a back buffer, this call has no effect and
the content of the back buffer is undefined when the function
returns. With multithread applications, flush the drawing commands in
any other threads drawing to the same window before calling
SwapBuffers.


%index
TextOutW
現在選択されているフォント、背景色、テキスト色を使って指定位置に文字列を書き込む。(Unicode)
%group
Win32 gdi32
%prm
hdc, x, y, lpString, c
hdc : [intptr] デバイスコンテキストへのハンドル。
x : [int] システムが文字列を整列させる基準点の x 座標(論理座標)。
y : [int] システムが文字列を整列させる基準点の y 座標(論理座標)。
lpString : [wstr] 描画する文字列へのポインタ。cchString で長さを指定するため、NULL 終端である必要はない。
c : [int] lpString が指す文字列の長さ(文字単位)。
%inst
現在選択されているフォント、背景色、テキスト色を使って指定位置に文字列を書き込む。(Unicode)

[戻り値]
関数が成功した場合、戻り値は 0 以外。失敗した場合は 0。

[備考]
基準点の解釈は現在のテキスト整列モードに依存する。モードの取得には GetTextAlign、設定には SetTextAlign
を使う。水平および垂直整列に影響するフラグから 1 つだけ、および現在位置を変更する 2 つのフラグから 1 つだけ選択できる。
（以下省略）


%index
TranslateCharsetInfo
Translates character set information and sets all members of a destination structure to appropriate values.
%group
Win32 gdi32
%prm
lpSrc, lpCs, dwFlags
lpSrc : [var] Pointer to the fsCsb member of a FONTSIGNATURE structure if dwFlags is set to TCI_SRCFONTSIG. Otherwise, this parameter is set to a DWORD value indicating the source.
lpCs : [var] Pointer to a CHARSETINFO structure that receives the translated character set information.
dwFlags : [int] 
%inst
Translates character set information and sets all members of a
destination structure to appropriate values.

[戻り値]
Returns a nonzero value if successful, or 0 otherwise. To get
extended error information, the application can call GetLastError.


%index
UnrealizeObject
The UnrealizeObject function resets the origin of a brush or resets a logical palette.
%group
Win32 gdi32
%prm
h
h : [intptr] 
%inst
The UnrealizeObject function resets the origin of a brush or resets a
logical palette.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero.

[備考]
The UnrealizeObject function should not be used with stock objects.
For example, the default palette, obtained by calling GetStockObject
(DEFAULT_PALETTE), is a stock object. A palette identified by hgdiobj
can be the currently selected palette of a device context. If hgdiobj
is a brush, UnrealizeObject does nothing, and the function returns
TRUE. Use SetBrushOrgEx to set the origin of a brush.


%index
UpdateColors
The UpdateColors function updates the client area of the specified device context by remapping the current colors in the client area to the currently realized logical palette.
%group
Win32 gdi32
%prm
hdc
hdc : [intptr] A handle to the device context.
%inst
The UpdateColors function updates the client area of the specified
device context by remapping the current colors in the client area to
the currently realized logical palette.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero.

[備考]
An application can determine whether a device supports palette
operations by calling the GetDeviceCaps function and specifying the
RASTERCAPS constant. An inactive window with a realized logical
palette may call UpdateColors as an alternative to redrawing its
client area when the system palette changes. The UpdateColors
function typically updates a client area faster than redrawing the
area. However, because UpdateColors performs the color translation
based on the color of each pixel before the system palette changed,
each call to this function results in the loss of some color
accuracy. This function must be called soon after a WM_PALETTECHANGED
message is received.


%index
UpdateICMRegKeyW
The UpdateICMRegKey function manages color profiles and Color Management Modules in the system. (Unicode)
%group
Win32 gdi32
%prm
reserved, lpszCMID, lpszFileName, command
reserved : [int] Reserved, must be set to zero.
lpszCMID : [wstr] Points to a string that specifies the ICC profile identifier for the color management DLL to use with the profile.
lpszFileName : [wstr] Points to a fully qualified ICC color profile file name or to a DEVMODE structure.
command : [int] 
%inst
The UpdateICMRegKey function manages color profiles and Color
Management Modules in the system. (Unicode)

[戻り値]
If this function succeeds, the return value is TRUE. If this function
fails, the return value is FALSE.

[備考]
Not all parameters are used by all functions. The nCommand parameter
specifies the function to execute. This function is retained for
backward compatibility and may be removed in future versions of ICM.
Windows 95/98/Me: UpdateICMRegKeyW is supported by the Microsoft
Layer for Unicode. To use this, you must add certain files to your
application, as outlined in Microsoft Layer for Unicode on Windows
95/98/Me Systems.
> [!NOTE] > The wingdi.h header defines UpdateICMRegKey as an alias
which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
WidenPath
The WidenPath function redefines the current path as the area that would be painted if the path were stroked using the pen currently selected into the given device context.
%group
Win32 gdi32
%prm
hdc
hdc : [intptr] A handle to a device context that contains a closed path.
%inst
The WidenPath function redefines the current path as the area that
would be painted if the path were stroked using the pen currently
selected into the given device context.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero.

[備考]
The WidenPath function is successful only if the current pen is a
geometric pen created by the ExtCreatePen function, or if the pen is
created with the CreatePen function and has a width, in device units,
of more than one. The device context identified by the hdc parameter
must contain a closed path. Any B?zier curves in the path are
converted to sequences of straight lines approximating the widened
curves. As such, no B?zier curves remain in the path after WidenPath
is called.


%index
XFORMOBJ_bApplyXform
The XFORMOBJ_bApplyXform function applies the given transform or its inverse to the given array of points.
%group
Win32 gdi32
%prm
pxo, iMode, cPoints, pvIn, pvOut
pxo : [var] Pointer to a XFORMOBJ structure that defines the transform to be applied to the pvIn array.
iMode : [int] Identifies the transform and the input and output data types. This parameter can be one of the following:
cPoints : [int] Specifies the count of points in pvIn to be transformed.
pvIn : [intptr] Pointer to an array of input points. The format of the points is specified by the iMode parameter.
pvOut : [intptr] Pointer to the buffer that is to receive the transformed points. The iMode parameter specifies the format of the points.
%inst
The XFORMOBJ_bApplyXform function applies the given transform or its
inverse to the given array of points.

[戻り値]
The return value is TRUE if all points were transformed without
overflow. FALSE is returned if pxo, pvIn, or pvOut are null, or if
overflow occurs during the transformation.


%index
XLATEOBJ_cGetPalette
The XLATEOBJ_cGetPalette function retrieves RGB colors or the bitfields format from the specified palette.
%group
Win32 gdi32
%prm
pxlo, iPal, cPal, pPal
pxlo : [var] Pointer to the XLATEOBJ structure from which GDI retrieves the requested information.
iPal : [int] 
cPal : [int] Specifies the number of entries in the buffer pointed to by pPal. This can be smaller than the total size of the palette.
pPal : [var] Pointer to a buffer in which GDI writes the requested palette information. If iPal is XO_SRCPALETTE or XO_DESTPALETTE and the respective palette type is PAL_INDEXED, each entry is a 24-bit RGB value. If iPal is XO_SRCBITFIELDS or XO_DESTBITFIELDS and the respective palette type is PAL_BITFIELDS, PAL_RGB, or PAL_BGR, pPal points to three ULONG masks that represent the red, green, and blue color masks.
%inst
The XLATEOBJ_cGetPalette function retrieves RGB colors or the
bitfields format from the specified palette.

[戻り値]
XLATEOBJ_cGetPalette returns the number of entries written if pPal is
not null. A value of zero is returned if the XLATEOBJ is null or its
palette is invalid. XLATEOBJ_cGetPalette will also return zero if the
data pointed to by pxlo is not consistent with the value in iPal. For
example, if the data pointed to is a bitfield, but iPal is set to
either XO_SRCPALETTE or XO_DESTPALETTE, XLATEOBJ_cGetPalette will
return zero. Similarly, if the data pointed to by pxlo is a palette,
but iPal is set to either XO_SRCBITFIELDS or XO_DESTBITFIELDS,
XLATEOBJ_cGetPalette also returns zero.

[備考]
The driver must have information about the palette to perform some
methods of color blending.


%index
XLATEOBJ_hGetColorTransform
The XLATEOBJ_hGetColorTransform function returns the color transform for the specified translation object.
%group
Win32 gdi32
%prm
pxlo
pxlo : [var] Pointer to the XLATEOBJ structure whose color transform is being queried. The color transform was created in a prior call to DrvIcmCreateColorTransform.
%inst
The XLATEOBJ_hGetColorTransform function returns the color transform
for the specified translation object.

[戻り値]
XLATEOBJ_hGetColorTransform returns a handle to the color transform
for the specified XLATEOBJ upon success. Otherwise, it returns NULL.

[備考]
XLATEOBJ_hGetColorTransform returns NULL when it is called in host
ICM context or when ICM is disabled. The color transform for a brush
is obtained by calling BRUSHOBJ_hGetColorTransform.


%index
XLATEOBJ_iXlate
The XLATEOBJ_iXlate function translates a color index of the source palette to the closest index in the destination palette.
%group
Win32 gdi32
%prm
pxlo, iColor
pxlo : [var] Pointer to a XLATEOBJ structure that defines the source palette.
iColor : [int] Specifies the color index to be translated.
%inst
The XLATEOBJ_iXlate function translates a color index of the source
palette to the closest index in the destination palette.

[戻り値]
The return value is an index into the destination palette if the
function is successful. If the function fails, -1 is returned.


%index
XLATEOBJ_piVector
The XLATEOBJ_piVector function retrieves a translation vector that the driver can use to translate source indices to destination indices.
%group
Win32 gdi32
%prm
pxlo
pxlo : [var] Pointer to a XLATEOBJ structure that defines the indexed source object.
%inst
The XLATEOBJ_piVector function retrieves a translation vector that
the driver can use to translate source indices to destination
indices.

[戻り値]
The return value is a pointer to a vector of translation entries if
the function is successful. Otherwise, it is null, and an error code
is logged.

[備考]
This function can be used only if the source palette is an indexed
palette.

