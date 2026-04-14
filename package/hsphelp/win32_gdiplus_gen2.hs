; ============================================================
;   gdiplus.dll ヘルプ (CsWin32 / win32metadata から自動抽出)
;   docs_ja.json に日本語訳があればそちらを使用、無ければ英語原文。
;   翻訳を追加するときは docs_ja.json を編集して再生成。
; ============================================================

%index
GdipAddPathArc
(no summary)
%group
Win32 gdiplus
%prm
path, x, y, width, height, startAngle, sweepAngle
path : [intptr] 
x : [float] 
y : [float] 
width : [float] 
height : [float] 
startAngle : [float] 
sweepAngle : [float] 
%inst



%index
GdipAddPathArcI
(no summary)
%group
Win32 gdiplus
%prm
path, x, y, width, height, startAngle, sweepAngle
path : [intptr] 
x : [int] 
y : [int] 
width : [int] 
height : [int] 
startAngle : [float] 
sweepAngle : [float] 
%inst



%index
GdipAddPathBezier
(no summary)
%group
Win32 gdiplus
%prm
path, x1, y1, x2, y2, x3, y3, x4, y4
path : [intptr] 
x1 : [float] 
y1 : [float] 
x2 : [float] 
y2 : [float] 
x3 : [float] 
y3 : [float] 
x4 : [float] 
y4 : [float] 
%inst



%index
GdipAddPathBezierI
(no summary)
%group
Win32 gdiplus
%prm
path, x1, y1, x2, y2, x3, y3, x4, y4
path : [intptr] 
x1 : [int] 
y1 : [int] 
x2 : [int] 
y2 : [int] 
x3 : [int] 
y3 : [int] 
x4 : [int] 
y4 : [int] 
%inst



%index
GdipAddPathBeziers
(no summary)
%group
Win32 gdiplus
%prm
path, points, count
path : [intptr] 
points : [var] 
count : [int] 
%inst



%index
GdipAddPathBeziersI
(no summary)
%group
Win32 gdiplus
%prm
path, points, count
path : [intptr] 
points : [var] 
count : [int] 
%inst



%index
GdipAddPathClosedCurve
(no summary)
%group
Win32 gdiplus
%prm
path, points, count
path : [intptr] 
points : [var] 
count : [int] 
%inst



%index
GdipAddPathClosedCurve2
(no summary)
%group
Win32 gdiplus
%prm
path, points, count, tension
path : [intptr] 
points : [var] 
count : [int] 
tension : [float] 
%inst



%index
GdipAddPathClosedCurve2I
(no summary)
%group
Win32 gdiplus
%prm
path, points, count, tension
path : [intptr] 
points : [var] 
count : [int] 
tension : [float] 
%inst



%index
GdipAddPathClosedCurveI
(no summary)
%group
Win32 gdiplus
%prm
path, points, count
path : [intptr] 
points : [var] 
count : [int] 
%inst



%index
GdipAddPathCurve
(no summary)
%group
Win32 gdiplus
%prm
path, points, count
path : [intptr] 
points : [var] 
count : [int] 
%inst



%index
GdipAddPathCurve2
(no summary)
%group
Win32 gdiplus
%prm
path, points, count, tension
path : [intptr] 
points : [var] 
count : [int] 
tension : [float] 
%inst



%index
GdipAddPathCurve2I
(no summary)
%group
Win32 gdiplus
%prm
path, points, count, tension
path : [intptr] 
points : [var] 
count : [int] 
tension : [float] 
%inst



%index
GdipAddPathCurve3
(no summary)
%group
Win32 gdiplus
%prm
path, points, count, offset, numberOfSegments, tension
path : [intptr] 
points : [var] 
count : [int] 
offset : [int] 
numberOfSegments : [int] 
tension : [float] 
%inst



%index
GdipAddPathCurve3I
(no summary)
%group
Win32 gdiplus
%prm
path, points, count, offset, numberOfSegments, tension
path : [intptr] 
points : [var] 
count : [int] 
offset : [int] 
numberOfSegments : [int] 
tension : [float] 
%inst



%index
GdipAddPathCurveI
(no summary)
%group
Win32 gdiplus
%prm
path, points, count
path : [intptr] 
points : [var] 
count : [int] 
%inst



%index
GdipAddPathEllipse
(no summary)
%group
Win32 gdiplus
%prm
path, x, y, width, height
path : [intptr] 
x : [float] 
y : [float] 
width : [float] 
height : [float] 
%inst



%index
GdipAddPathEllipseI
(no summary)
%group
Win32 gdiplus
%prm
path, x, y, width, height
path : [intptr] 
x : [int] 
y : [int] 
width : [int] 
height : [int] 
%inst



%index
GdipAddPathLine
(no summary)
%group
Win32 gdiplus
%prm
path, x1, y1, x2, y2
path : [intptr] 
x1 : [float] 
y1 : [float] 
x2 : [float] 
y2 : [float] 
%inst



%index
GdipAddPathLine2
(no summary)
%group
Win32 gdiplus
%prm
path, points, count
path : [intptr] 
points : [var] 
count : [int] 
%inst



%index
GdipAddPathLine2I
(no summary)
%group
Win32 gdiplus
%prm
path, points, count
path : [intptr] 
points : [var] 
count : [int] 
%inst



%index
GdipAddPathLineI
(no summary)
%group
Win32 gdiplus
%prm
path, x1, y1, x2, y2
path : [intptr] 
x1 : [int] 
y1 : [int] 
x2 : [int] 
y2 : [int] 
%inst



%index
GdipAddPathPath
(no summary)
%group
Win32 gdiplus
%prm
path, addingPath, connect
path : [intptr] 
addingPath : [intptr] 
connect : [int] 
%inst



%index
GdipAddPathPie
(no summary)
%group
Win32 gdiplus
%prm
path, x, y, width, height, startAngle, sweepAngle
path : [intptr] 
x : [float] 
y : [float] 
width : [float] 
height : [float] 
startAngle : [float] 
sweepAngle : [float] 
%inst



%index
GdipAddPathPieI
(no summary)
%group
Win32 gdiplus
%prm
path, x, y, width, height, startAngle, sweepAngle
path : [intptr] 
x : [int] 
y : [int] 
width : [int] 
height : [int] 
startAngle : [float] 
sweepAngle : [float] 
%inst



%index
GdipAddPathPolygon
(no summary)
%group
Win32 gdiplus
%prm
path, points, count
path : [intptr] 
points : [var] 
count : [int] 
%inst



%index
GdipAddPathPolygonI
(no summary)
%group
Win32 gdiplus
%prm
path, points, count
path : [intptr] 
points : [var] 
count : [int] 
%inst



%index
GdipAddPathRectangle
(no summary)
%group
Win32 gdiplus
%prm
path, x, y, width, height
path : [intptr] 
x : [float] 
y : [float] 
width : [float] 
height : [float] 
%inst



%index
GdipAddPathRectangleI
(no summary)
%group
Win32 gdiplus
%prm
path, x, y, width, height
path : [intptr] 
x : [int] 
y : [int] 
width : [int] 
height : [int] 
%inst



%index
GdipAddPathRectangles
(no summary)
%group
Win32 gdiplus
%prm
path, rects, count
path : [intptr] 
rects : [var] 
count : [int] 
%inst



%index
GdipAddPathRectanglesI
(no summary)
%group
Win32 gdiplus
%prm
path, rects, count
path : [intptr] 
rects : [var] 
count : [int] 
%inst



%index
GdipAddPathString
(no summary)
%group
Win32 gdiplus
%prm
path, string, length, family, style, emSize, layoutRect, format
path : [intptr] 
string : [int] 
length : [int] 
family : [intptr] 
style : [int] 
emSize : [float] 
layoutRect : [var] 
format : [intptr] 
%inst



%index
GdipAddPathStringI
(no summary)
%group
Win32 gdiplus
%prm
path, string, length, family, style, emSize, layoutRect, format
path : [intptr] 
string : [int] 
length : [int] 
family : [intptr] 
style : [int] 
emSize : [float] 
layoutRect : [var] 
format : [intptr] 
%inst



%index
GdipAlloc
(no summary)
%group
Win32 gdiplus
%prm
size
size : [int] 
%inst



%index
GdipBeginContainer
(no summary)
%group
Win32 gdiplus
%prm
graphics, dstrect, srcrect, unit, state
graphics : [intptr] 
dstrect : [var] 
srcrect : [var] 
unit : [int] 
state : [var] 
%inst



%index
GdipBeginContainer2
(no summary)
%group
Win32 gdiplus
%prm
graphics, state
graphics : [intptr] 
state : [var] 
%inst



%index
GdipBeginContainerI
(no summary)
%group
Win32 gdiplus
%prm
graphics, dstrect, srcrect, unit, state
graphics : [intptr] 
dstrect : [var] 
srcrect : [var] 
unit : [int] 
state : [var] 
%inst



%index
GdipBitmapApplyEffect
(no summary)
%group
Win32 gdiplus
%prm
bitmap, effect, roi, useAuxData, auxData, auxDataSize
bitmap : [intptr] 
effect : [intptr] 
roi : [var] 
useAuxData : [int] 
auxData : [var] 
auxDataSize : [var] 
%inst



%index
GdipBitmapConvertFormat
(no summary)
%group
Win32 gdiplus
%prm
pInputBitmap, format, dithertype, palettetype, palette, alphaThresholdPercent
pInputBitmap : [intptr] 
format : [int] 
dithertype : [int] 
palettetype : [int] 
palette : [var] 
alphaThresholdPercent : [float] 
%inst



%index
GdipBitmapCreateApplyEffect
(no summary)
%group
Win32 gdiplus
%prm
inputBitmaps, numInputs, effect, roi, outputRect, outputBitmap, useAuxData, auxData, auxDataSize
inputBitmaps : [var] 
numInputs : [int] 
effect : [intptr] 
roi : [var] 
outputRect : [var] 
outputBitmap : [var] 
useAuxData : [int] 
auxData : [var] 
auxDataSize : [var] 
%inst



%index
GdipBitmapGetHistogram
(no summary)
%group
Win32 gdiplus
%prm
bitmap, format, NumberOfEntries, channel0, channel1, channel2, channel3
bitmap : [intptr] 
format : [int] 
NumberOfEntries : [int] 
channel0 : [var] 
channel1 : [var] 
channel2 : [var] 
channel3 : [var] 
%inst



%index
GdipBitmapGetHistogramSize
(no summary)
%group
Win32 gdiplus
%prm
format, NumberOfEntries
format : [int] 
NumberOfEntries : [var] 
%inst



%index
GdipBitmapGetPixel
(no summary)
%group
Win32 gdiplus
%prm
bitmap, x, y, color
bitmap : [intptr] 
x : [int] 
y : [int] 
color : [var] 
%inst



%index
GdipBitmapLockBits
(no summary)
%group
Win32 gdiplus
%prm
bitmap, rect, flags, format, lockedBitmapData
bitmap : [intptr] 
rect : [var] 
flags : [int] 
format : [int] 
lockedBitmapData : [var] 
%inst



%index
GdipBitmapSetPixel
(no summary)
%group
Win32 gdiplus
%prm
bitmap, x, y, color
bitmap : [intptr] 
x : [int] 
y : [int] 
color : [int] 
%inst



%index
GdipBitmapSetResolution
(no summary)
%group
Win32 gdiplus
%prm
bitmap, xdpi, ydpi
bitmap : [intptr] 
xdpi : [float] 
ydpi : [float] 
%inst



%index
GdipBitmapUnlockBits
(no summary)
%group
Win32 gdiplus
%prm
bitmap, lockedBitmapData
bitmap : [intptr] 
lockedBitmapData : [var] 
%inst



%index
GdipClearPathMarkers
(no summary)
%group
Win32 gdiplus
%prm
path
path : [intptr] 
%inst



%index
GdipCloneBitmapArea
(no summary)
%group
Win32 gdiplus
%prm
x, y, width, height, format, srcBitmap, dstBitmap
x : [float] 
y : [float] 
width : [float] 
height : [float] 
format : [int] 
srcBitmap : [intptr] 
dstBitmap : [var] 
%inst



%index
GdipCloneBitmapAreaI
(no summary)
%group
Win32 gdiplus
%prm
x, y, width, height, format, srcBitmap, dstBitmap
x : [int] 
y : [int] 
width : [int] 
height : [int] 
format : [int] 
srcBitmap : [intptr] 
dstBitmap : [var] 
%inst



%index
GdipCloneBrush
(no summary)
%group
Win32 gdiplus
%prm
brush, cloneBrush
brush : [intptr] 
cloneBrush : [var] 
%inst



%index
GdipCloneCustomLineCap
(no summary)
%group
Win32 gdiplus
%prm
customCap, clonedCap
customCap : [intptr] 
clonedCap : [var] 
%inst



%index
GdipCloneFont
(no summary)
%group
Win32 gdiplus
%prm
font, cloneFont
font : [intptr] 
cloneFont : [var] 
%inst



%index
GdipCloneFontFamily
(no summary)
%group
Win32 gdiplus
%prm
fontFamily, clonedFontFamily
fontFamily : [intptr] 
clonedFontFamily : [var] 
%inst



%index
GdipCloneImage
(no summary)
%group
Win32 gdiplus
%prm
image, cloneImage
image : [intptr] 
cloneImage : [var] 
%inst



%index
GdipCloneImageAttributes
(no summary)
%group
Win32 gdiplus
%prm
imageattr, cloneImageattr
imageattr : [intptr] 
cloneImageattr : [var] 
%inst



%index
GdipCloneMatrix
(no summary)
%group
Win32 gdiplus
%prm
matrix, cloneMatrix
matrix : [intptr] 
cloneMatrix : [var] 
%inst



%index
GdipClonePath
(no summary)
%group
Win32 gdiplus
%prm
path, clonePath
path : [intptr] 
clonePath : [var] 
%inst



%index
GdipClonePen
(no summary)
%group
Win32 gdiplus
%prm
pen, clonepen
pen : [intptr] 
clonepen : [var] 
%inst



%index
GdipCloneRegion
(no summary)
%group
Win32 gdiplus
%prm
region, cloneRegion
region : [intptr] 
cloneRegion : [var] 
%inst



%index
GdipCloneStringFormat
(no summary)
%group
Win32 gdiplus
%prm
format, newFormat
format : [intptr] 
newFormat : [var] 
%inst



%index
GdipClosePathFigure
(no summary)
%group
Win32 gdiplus
%prm
path
path : [intptr] 
%inst



%index
GdipClosePathFigures
(no summary)
%group
Win32 gdiplus
%prm
path
path : [intptr] 
%inst



%index
GdipCombineRegionPath
(no summary)
%group
Win32 gdiplus
%prm
region, path, combineMode
region : [intptr] 
path : [intptr] 
combineMode : [int] 
%inst



%index
GdipCombineRegionRect
(no summary)
%group
Win32 gdiplus
%prm
region, rect, combineMode
region : [intptr] 
rect : [var] 
combineMode : [int] 
%inst



%index
GdipCombineRegionRectI
(no summary)
%group
Win32 gdiplus
%prm
region, rect, combineMode
region : [intptr] 
rect : [var] 
combineMode : [int] 
%inst



%index
GdipCombineRegionRegion
(no summary)
%group
Win32 gdiplus
%prm
region, region2, combineMode
region : [intptr] 
region2 : [intptr] 
combineMode : [int] 
%inst



%index
GdipComment
(no summary)
%group
Win32 gdiplus
%prm
graphics, sizeData, data
graphics : [intptr] 
sizeData : [int] 
data : [var] 
%inst



%index
GdipConvertToEmfPlus
(no summary)
%group
Win32 gdiplus
%prm
refGraphics, metafile, conversionFailureFlag, emfType, description, out_metafile
refGraphics : [intptr] 
metafile : [intptr] 
conversionFailureFlag : [var] 
emfType : [int] 
description : [wstr] 
out_metafile : [var] 
%inst



%index
GdipConvertToEmfPlusToFile
(no summary)
%group
Win32 gdiplus
%prm
refGraphics, metafile, conversionFailureFlag, filename, emfType, description, out_metafile
refGraphics : [intptr] 
metafile : [intptr] 
conversionFailureFlag : [var] 
filename : [wstr] 
emfType : [int] 
description : [wstr] 
out_metafile : [var] 
%inst



%index
GdipConvertToEmfPlusToStream
(no summary)
%group
Win32 gdiplus
%prm
refGraphics, metafile, conversionFailureFlag, stream, emfType, description, out_metafile
refGraphics : [intptr] 
metafile : [intptr] 
conversionFailureFlag : [var] 
stream : [var] 
emfType : [int] 
description : [wstr] 
out_metafile : [var] 
%inst



%index
GdipCreateAdjustableArrowCap
(no summary)
%group
Win32 gdiplus
%prm
height, width, isFilled, cap
height : [float] 
width : [float] 
isFilled : [int] 
cap : [var] 
%inst



%index
GdipCreateBitmapFromDirectDrawSurface
(no summary)
%group
Win32 gdiplus
%prm
surface, bitmap
surface : [var] 
bitmap : [var] 
%inst



%index
GdipCreateBitmapFromFile
(no summary)
%group
Win32 gdiplus
%prm
filename, bitmap
filename : [wstr] 
bitmap : [var] 
%inst



%index
GdipCreateBitmapFromFileICM
(no summary)
%group
Win32 gdiplus
%prm
filename, bitmap
filename : [wstr] 
bitmap : [var] 
%inst



%index
GdipCreateBitmapFromGdiDib
(no summary)
%group
Win32 gdiplus
%prm
gdiBitmapInfo, gdiBitmapData, bitmap
gdiBitmapInfo : [var] 
gdiBitmapData : [intptr] 
bitmap : [var] 
%inst



%index
GdipCreateBitmapFromGraphics
(no summary)
%group
Win32 gdiplus
%prm
width, height, target, bitmap
width : [int] 
height : [int] 
target : [intptr] 
bitmap : [var] 
%inst



%index
GdipCreateBitmapFromHBITMAP
(no summary)
%group
Win32 gdiplus
%prm
hbm, hpal, bitmap
hbm : [intptr] 
hpal : [intptr] 
bitmap : [var] 
%inst



%index
GdipCreateBitmapFromHICON
(no summary)
%group
Win32 gdiplus
%prm
hicon, bitmap
hicon : [intptr] 
bitmap : [var] 
%inst



%index
GdipCreateBitmapFromResource
(no summary)
%group
Win32 gdiplus
%prm
hInstance, lpBitmapName, bitmap
hInstance : [intptr] 
lpBitmapName : [wstr] 
bitmap : [var] 
%inst



%index
GdipCreateBitmapFromScan0
(no summary)
%group
Win32 gdiplus
%prm
width, height, stride, format, scan0, bitmap
width : [int] 
height : [int] 
stride : [int] 
format : [int] 
scan0 : [var] 
bitmap : [var] 
%inst



%index
GdipCreateBitmapFromStream
(no summary)
%group
Win32 gdiplus
%prm
stream, bitmap
stream : [var] 
bitmap : [var] 
%inst



%index
GdipCreateBitmapFromStreamICM
(no summary)
%group
Win32 gdiplus
%prm
stream, bitmap
stream : [var] 
bitmap : [var] 
%inst



%index
GdipCreateCachedBitmap
(no summary)
%group
Win32 gdiplus
%prm
bitmap, graphics, cachedBitmap
bitmap : [intptr] 
graphics : [intptr] 
cachedBitmap : [var] 
%inst



%index
GdipCreateCustomLineCap
(no summary)
%group
Win32 gdiplus
%prm
fillPath, strokePath, baseCap, baseInset, customCap
fillPath : [intptr] 
strokePath : [intptr] 
baseCap : [int] 
baseInset : [float] 
customCap : [var] 
%inst



%index
GdipCreateEffect
(no summary)
%group
Win32 gdiplus
%prm
guid, effect
guid : [int] 
effect : [var] 
%inst



%index
GdipCreateFont
(no summary)
%group
Win32 gdiplus
%prm
fontFamily, emSize, style, unit, font
fontFamily : [intptr] 
emSize : [float] 
style : [int] 
unit : [int] 
font : [var] 
%inst



%index
GdipCreateFontFamilyFromName
(no summary)
%group
Win32 gdiplus
%prm
name, fontCollection, fontFamily
name : [wstr] 
fontCollection : [intptr] 
fontFamily : [var] 
%inst



%index
GdipCreateFontFromDC
(no summary)
%group
Win32 gdiplus
%prm
hdc, font
hdc : [intptr] 
font : [var] 
%inst



%index
GdipCreateFontFromLogfontW
(no summary)
%group
Win32 gdiplus
%prm
hdc, logfont, font
hdc : [intptr] 
logfont : [var] 
font : [var] 
%inst



%index
GdipCreateFromHDC
(no summary)
%group
Win32 gdiplus
%prm
hdc, graphics
hdc : [intptr] 
graphics : [var] 
%inst



%index
GdipCreateFromHDC2
(no summary)
%group
Win32 gdiplus
%prm
hdc, hDevice, graphics
hdc : [intptr] 
hDevice : [intptr] 
graphics : [var] 
%inst



%index
GdipCreateFromHWND
(no summary)
%group
Win32 gdiplus
%prm
hwnd, graphics
hwnd : [intptr] 
graphics : [var] 
%inst



%index
GdipCreateFromHWNDICM
(no summary)
%group
Win32 gdiplus
%prm
hwnd, graphics
hwnd : [intptr] 
graphics : [var] 
%inst



%index
GdipCreateHBITMAPFromBitmap
(no summary)
%group
Win32 gdiplus
%prm
bitmap, hbmReturn, background
bitmap : [intptr] 
hbmReturn : [intptr] 
background : [int] 
%inst



%index
GdipCreateHICONFromBitmap
(no summary)
%group
Win32 gdiplus
%prm
bitmap, hbmReturn
bitmap : [intptr] 
hbmReturn : [intptr] 
%inst



%index
GdipCreateHalftonePalette
(no summary)
%group
Win32 gdiplus
%prm

%inst



%index
GdipCreateHatchBrush
(no summary)
%group
Win32 gdiplus
%prm
hatchstyle, forecol, backcol, brush
hatchstyle : [int] 
forecol : [int] 
backcol : [int] 
brush : [var] 
%inst



%index
GdipCreateImageAttributes
(no summary)
%group
Win32 gdiplus
%prm
imageattr
imageattr : [var] 
%inst



%index
GdipCreateLineBrush
(no summary)
%group
Win32 gdiplus
%prm
point1, point2, color1, color2, wrapMode, lineGradient
point1 : [var] 
point2 : [var] 
color1 : [int] 
color2 : [int] 
wrapMode : [int] 
lineGradient : [var] 
%inst



%index
GdipCreateLineBrushFromRect
(no summary)
%group
Win32 gdiplus
%prm
rect, color1, color2, mode, wrapMode, lineGradient
rect : [var] 
color1 : [int] 
color2 : [int] 
mode : [int] 
wrapMode : [int] 
lineGradient : [var] 
%inst



%index
GdipCreateLineBrushFromRectI
(no summary)
%group
Win32 gdiplus
%prm
rect, color1, color2, mode, wrapMode, lineGradient
rect : [var] 
color1 : [int] 
color2 : [int] 
mode : [int] 
wrapMode : [int] 
lineGradient : [var] 
%inst



%index
GdipCreateLineBrushFromRectWithAngle
(no summary)
%group
Win32 gdiplus
%prm
rect, color1, color2, angle, isAngleScalable, wrapMode, lineGradient
rect : [var] 
color1 : [int] 
color2 : [int] 
angle : [float] 
isAngleScalable : [int] 
wrapMode : [int] 
lineGradient : [var] 
%inst



%index
GdipCreateLineBrushFromRectWithAngleI
(no summary)
%group
Win32 gdiplus
%prm
rect, color1, color2, angle, isAngleScalable, wrapMode, lineGradient
rect : [var] 
color1 : [int] 
color2 : [int] 
angle : [float] 
isAngleScalable : [int] 
wrapMode : [int] 
lineGradient : [var] 
%inst



%index
GdipCreateLineBrushI
(no summary)
%group
Win32 gdiplus
%prm
point1, point2, color1, color2, wrapMode, lineGradient
point1 : [var] 
point2 : [var] 
color1 : [int] 
color2 : [int] 
wrapMode : [int] 
lineGradient : [var] 
%inst



%index
GdipCreateMatrix
(no summary)
%group
Win32 gdiplus
%prm
matrix
matrix : [var] 
%inst



%index
GdipCreateMatrix2
(no summary)
%group
Win32 gdiplus
%prm
m11, m12, m21, m22, dx, dy, matrix
m11 : [float] 
m12 : [float] 
m21 : [float] 
m22 : [float] 
dx : [float] 
dy : [float] 
matrix : [var] 
%inst



%index
GdipCreateMatrix3
(no summary)
%group
Win32 gdiplus
%prm
rect, dstplg, matrix
rect : [var] 
dstplg : [var] 
matrix : [var] 
%inst



%index
GdipCreateMatrix3I
(no summary)
%group
Win32 gdiplus
%prm
rect, dstplg, matrix
rect : [var] 
dstplg : [var] 
matrix : [var] 
%inst



%index
GdipCreateMetafileFromEmf
(no summary)
%group
Win32 gdiplus
%prm
hEmf, deleteEmf, metafile
hEmf : [intptr] 
deleteEmf : [int] 
metafile : [var] 
%inst



%index
GdipCreateMetafileFromFile
(no summary)
%group
Win32 gdiplus
%prm
file, metafile
file : [wstr] 
metafile : [var] 
%inst



%index
GdipCreateMetafileFromStream
(no summary)
%group
Win32 gdiplus
%prm
stream, metafile
stream : [var] 
metafile : [var] 
%inst



%index
GdipCreateMetafileFromWmf
(no summary)
%group
Win32 gdiplus
%prm
hWmf, deleteWmf, wmfPlaceableFileHeader, metafile
hWmf : [intptr] 
deleteWmf : [int] 
wmfPlaceableFileHeader : [var] 
metafile : [var] 
%inst



%index
GdipCreateMetafileFromWmfFile
(no summary)
%group
Win32 gdiplus
%prm
file, wmfPlaceableFileHeader, metafile
file : [wstr] 
wmfPlaceableFileHeader : [var] 
metafile : [var] 
%inst



%index
GdipCreatePath
(no summary)
%group
Win32 gdiplus
%prm
brushMode, path
brushMode : [int] 
path : [var] 
%inst



%index
GdipCreatePath2
(no summary)
%group
Win32 gdiplus
%prm
param0, param1, param2, param3, path
param0 : [var] 
param1 : [var] 
param2 : [int] 
param3 : [int] 
path : [var] 
%inst



%index
GdipCreatePath2I
(no summary)
%group
Win32 gdiplus
%prm
param0, param1, param2, param3, path
param0 : [var] 
param1 : [var] 
param2 : [int] 
param3 : [int] 
path : [var] 
%inst



%index
GdipCreatePathGradient
(no summary)
%group
Win32 gdiplus
%prm
points, count, wrapMode, polyGradient
points : [var] 
count : [int] 
wrapMode : [int] 
polyGradient : [var] 
%inst



%index
GdipCreatePathGradientFromPath
(no summary)
%group
Win32 gdiplus
%prm
path, polyGradient
path : [intptr] 
polyGradient : [var] 
%inst



%index
GdipCreatePathGradientI
(no summary)
%group
Win32 gdiplus
%prm
points, count, wrapMode, polyGradient
points : [var] 
count : [int] 
wrapMode : [int] 
polyGradient : [var] 
%inst



%index
GdipCreatePathIter
(no summary)
%group
Win32 gdiplus
%prm
iterator, path
iterator : [var] 
path : [intptr] 
%inst



%index
GdipCreatePen1
(no summary)
%group
Win32 gdiplus
%prm
color, width, unit, pen
color : [int] 
width : [float] 
unit : [int] 
pen : [var] 
%inst



%index
GdipCreatePen2
(no summary)
%group
Win32 gdiplus
%prm
brush, width, unit, pen
brush : [intptr] 
width : [float] 
unit : [int] 
pen : [var] 
%inst



%index
GdipCreateRegion
(no summary)
%group
Win32 gdiplus
%prm
region
region : [var] 
%inst



%index
GdipCreateRegionHrgn
(no summary)
%group
Win32 gdiplus
%prm
hRgn, region
hRgn : [intptr] 
region : [var] 
%inst



%index
GdipCreateRegionPath
(no summary)
%group
Win32 gdiplus
%prm
path, region
path : [intptr] 
region : [var] 
%inst



%index
GdipCreateRegionRect
(no summary)
%group
Win32 gdiplus
%prm
rect, region
rect : [var] 
region : [var] 
%inst



%index
GdipCreateRegionRectI
(no summary)
%group
Win32 gdiplus
%prm
rect, region
rect : [var] 
region : [var] 
%inst



%index
GdipCreateRegionRgnData
(no summary)
%group
Win32 gdiplus
%prm
regionData, size, region
regionData : [var] 
size : [int] 
region : [var] 
%inst



%index
GdipCreateSolidFill
(no summary)
%group
Win32 gdiplus
%prm
color, brush
color : [int] 
brush : [var] 
%inst



%index
GdipCreateStreamOnFile
(no summary)
%group
Win32 gdiplus
%prm
filename, access, stream
filename : [wstr] 
access : [int] 
stream : [var] 
%inst



%index
GdipCreateStringFormat
(no summary)
%group
Win32 gdiplus
%prm
formatAttributes, language, format
formatAttributes : [int] 
language : [int] 
format : [var] 
%inst



%index
GdipCreateTexture
(no summary)
%group
Win32 gdiplus
%prm
image, wrapmode, texture
image : [intptr] 
wrapmode : [int] 
texture : [var] 
%inst



%index
GdipCreateTexture2
(no summary)
%group
Win32 gdiplus
%prm
image, wrapmode, x, y, width, height, texture
image : [intptr] 
wrapmode : [int] 
x : [float] 
y : [float] 
width : [float] 
height : [float] 
texture : [var] 
%inst



%index
GdipCreateTexture2I
(no summary)
%group
Win32 gdiplus
%prm
image, wrapmode, x, y, width, height, texture
image : [intptr] 
wrapmode : [int] 
x : [int] 
y : [int] 
width : [int] 
height : [int] 
texture : [var] 
%inst



%index
GdipCreateTextureIA
(no summary)
%group
Win32 gdiplus
%prm
image, imageAttributes, x, y, width, height, texture
image : [intptr] 
imageAttributes : [intptr] 
x : [float] 
y : [float] 
width : [float] 
height : [float] 
texture : [var] 
%inst



%index
GdipCreateTextureIAI
(no summary)
%group
Win32 gdiplus
%prm
image, imageAttributes, x, y, width, height, texture
image : [intptr] 
imageAttributes : [intptr] 
x : [int] 
y : [int] 
width : [int] 
height : [int] 
texture : [var] 
%inst



%index
GdipDeleteBrush
(no summary)
%group
Win32 gdiplus
%prm
brush
brush : [intptr] 
%inst



%index
GdipDeleteCachedBitmap
(no summary)
%group
Win32 gdiplus
%prm
cachedBitmap
cachedBitmap : [intptr] 
%inst



%index
GdipDeleteCustomLineCap
(no summary)
%group
Win32 gdiplus
%prm
customCap
customCap : [intptr] 
%inst



%index
GdipDeleteEffect
(no summary)
%group
Win32 gdiplus
%prm
effect
effect : [intptr] 
%inst



%index
GdipDeleteFont
(no summary)
%group
Win32 gdiplus
%prm
font
font : [intptr] 
%inst



%index
GdipDeleteFontFamily
(no summary)
%group
Win32 gdiplus
%prm
fontFamily
fontFamily : [intptr] 
%inst



%index
GdipDeleteGraphics
(no summary)
%group
Win32 gdiplus
%prm
graphics
graphics : [intptr] 
%inst



%index
GdipDeleteMatrix
(no summary)
%group
Win32 gdiplus
%prm
matrix
matrix : [intptr] 
%inst



%index
GdipDeletePath
(no summary)
%group
Win32 gdiplus
%prm
path
path : [intptr] 
%inst



%index
GdipDeletePathIter
(no summary)
%group
Win32 gdiplus
%prm
iterator
iterator : [intptr] 
%inst



%index
GdipDeletePen
(no summary)
%group
Win32 gdiplus
%prm
pen
pen : [intptr] 
%inst



%index
GdipDeletePrivateFontCollection
(no summary)
%group
Win32 gdiplus
%prm
fontCollection
fontCollection : [var] 
%inst



%index
GdipDeleteRegion
(no summary)
%group
Win32 gdiplus
%prm
region
region : [intptr] 
%inst



%index
GdipDeleteStringFormat
(no summary)
%group
Win32 gdiplus
%prm
format
format : [intptr] 
%inst



%index
GdipDisposeImage
(no summary)
%group
Win32 gdiplus
%prm
image
image : [intptr] 
%inst



%index
GdipDisposeImageAttributes
(no summary)
%group
Win32 gdiplus
%prm
imageattr
imageattr : [intptr] 
%inst



%index
GdipDrawArc
(no summary)
%group
Win32 gdiplus
%prm
graphics, pen, x, y, width, height, startAngle, sweepAngle
graphics : [intptr] 
pen : [intptr] 
x : [float] 
y : [float] 
width : [float] 
height : [float] 
startAngle : [float] 
sweepAngle : [float] 
%inst



%index
GdipDrawArcI
(no summary)
%group
Win32 gdiplus
%prm
graphics, pen, x, y, width, height, startAngle, sweepAngle
graphics : [intptr] 
pen : [intptr] 
x : [int] 
y : [int] 
width : [int] 
height : [int] 
startAngle : [float] 
sweepAngle : [float] 
%inst



%index
GdipDrawBezier
(no summary)
%group
Win32 gdiplus
%prm
graphics, pen, x1, y1, x2, y2, x3, y3, x4, y4
graphics : [intptr] 
pen : [intptr] 
x1 : [float] 
y1 : [float] 
x2 : [float] 
y2 : [float] 
x3 : [float] 
y3 : [float] 
x4 : [float] 
y4 : [float] 
%inst



%index
GdipDrawBezierI
(no summary)
%group
Win32 gdiplus
%prm
graphics, pen, x1, y1, x2, y2, x3, y3, x4, y4
graphics : [intptr] 
pen : [intptr] 
x1 : [int] 
y1 : [int] 
x2 : [int] 
y2 : [int] 
x3 : [int] 
y3 : [int] 
x4 : [int] 
y4 : [int] 
%inst



%index
GdipDrawBeziers
(no summary)
%group
Win32 gdiplus
%prm
graphics, pen, points, count
graphics : [intptr] 
pen : [intptr] 
points : [var] 
count : [int] 
%inst



%index
GdipDrawBeziersI
(no summary)
%group
Win32 gdiplus
%prm
graphics, pen, points, count
graphics : [intptr] 
pen : [intptr] 
points : [var] 
count : [int] 
%inst



%index
GdipDrawCachedBitmap
(no summary)
%group
Win32 gdiplus
%prm
graphics, cachedBitmap, x, y
graphics : [intptr] 
cachedBitmap : [intptr] 
x : [int] 
y : [int] 
%inst



%index
GdipDrawClosedCurve
(no summary)
%group
Win32 gdiplus
%prm
graphics, pen, points, count
graphics : [intptr] 
pen : [intptr] 
points : [var] 
count : [int] 
%inst



%index
GdipDrawClosedCurve2
(no summary)
%group
Win32 gdiplus
%prm
graphics, pen, points, count, tension
graphics : [intptr] 
pen : [intptr] 
points : [var] 
count : [int] 
tension : [float] 
%inst



%index
GdipDrawClosedCurve2I
(no summary)
%group
Win32 gdiplus
%prm
graphics, pen, points, count, tension
graphics : [intptr] 
pen : [intptr] 
points : [var] 
count : [int] 
tension : [float] 
%inst



%index
GdipDrawClosedCurveI
(no summary)
%group
Win32 gdiplus
%prm
graphics, pen, points, count
graphics : [intptr] 
pen : [intptr] 
points : [var] 
count : [int] 
%inst



%index
GdipDrawCurve
(no summary)
%group
Win32 gdiplus
%prm
graphics, pen, points, count
graphics : [intptr] 
pen : [intptr] 
points : [var] 
count : [int] 
%inst



%index
GdipDrawCurve2
(no summary)
%group
Win32 gdiplus
%prm
graphics, pen, points, count, tension
graphics : [intptr] 
pen : [intptr] 
points : [var] 
count : [int] 
tension : [float] 
%inst



%index
GdipDrawCurve2I
(no summary)
%group
Win32 gdiplus
%prm
graphics, pen, points, count, tension
graphics : [intptr] 
pen : [intptr] 
points : [var] 
count : [int] 
tension : [float] 
%inst



%index
GdipDrawCurve3
(no summary)
%group
Win32 gdiplus
%prm
graphics, pen, points, count, offset, numberOfSegments, tension
graphics : [intptr] 
pen : [intptr] 
points : [var] 
count : [int] 
offset : [int] 
numberOfSegments : [int] 
tension : [float] 
%inst



%index
GdipDrawCurve3I
(no summary)
%group
Win32 gdiplus
%prm
graphics, pen, points, count, offset, numberOfSegments, tension
graphics : [intptr] 
pen : [intptr] 
points : [var] 
count : [int] 
offset : [int] 
numberOfSegments : [int] 
tension : [float] 
%inst



%index
GdipDrawCurveI
(no summary)
%group
Win32 gdiplus
%prm
graphics, pen, points, count
graphics : [intptr] 
pen : [intptr] 
points : [var] 
count : [int] 
%inst



%index
GdipDrawDriverString
(no summary)
%group
Win32 gdiplus
%prm
graphics, text, length, font, brush, positions, flags, matrix
graphics : [intptr] 
text : [var] 
length : [int] 
font : [intptr] 
brush : [intptr] 
positions : [var] 
flags : [int] 
matrix : [intptr] 
%inst



%index
GdipDrawEllipse
(no summary)
%group
Win32 gdiplus
%prm
graphics, pen, x, y, width, height
graphics : [intptr] 
pen : [intptr] 
x : [float] 
y : [float] 
width : [float] 
height : [float] 
%inst



%index
GdipDrawEllipseI
(no summary)
%group
Win32 gdiplus
%prm
graphics, pen, x, y, width, height
graphics : [intptr] 
pen : [intptr] 
x : [int] 
y : [int] 
width : [int] 
height : [int] 
%inst



%index
GdipDrawImage
(no summary)
%group
Win32 gdiplus
%prm
graphics, image, x, y
graphics : [intptr] 
image : [intptr] 
x : [float] 
y : [float] 
%inst



%index
GdipDrawImageFX
(no summary)
%group
Win32 gdiplus
%prm
graphics, image, source, xForm, effect, imageAttributes, srcUnit
graphics : [intptr] 
image : [intptr] 
source : [var] 
xForm : [intptr] 
effect : [intptr] 
imageAttributes : [intptr] 
srcUnit : [int] 
%inst



%index
GdipDrawImageI
(no summary)
%group
Win32 gdiplus
%prm
graphics, image, x, y
graphics : [intptr] 
image : [intptr] 
x : [int] 
y : [int] 
%inst



%index
GdipDrawImagePointRect
(no summary)
%group
Win32 gdiplus
%prm
graphics, image, x, y, srcx, srcy, srcwidth, srcheight, srcUnit
graphics : [intptr] 
image : [intptr] 
x : [float] 
y : [float] 
srcx : [float] 
srcy : [float] 
srcwidth : [float] 
srcheight : [float] 
srcUnit : [int] 
%inst



%index
GdipDrawImagePointRectI
(no summary)
%group
Win32 gdiplus
%prm
graphics, image, x, y, srcx, srcy, srcwidth, srcheight, srcUnit
graphics : [intptr] 
image : [intptr] 
x : [int] 
y : [int] 
srcx : [int] 
srcy : [int] 
srcwidth : [int] 
srcheight : [int] 
srcUnit : [int] 
%inst



%index
GdipDrawImagePoints
(no summary)
%group
Win32 gdiplus
%prm
graphics, image, dstpoints, count
graphics : [intptr] 
image : [intptr] 
dstpoints : [var] 
count : [int] 
%inst



%index
GdipDrawImagePointsI
(no summary)
%group
Win32 gdiplus
%prm
graphics, image, dstpoints, count
graphics : [intptr] 
image : [intptr] 
dstpoints : [var] 
count : [int] 
%inst



%index
GdipDrawImagePointsRect
(no summary)
%group
Win32 gdiplus
%prm
graphics, image, points, count, srcx, srcy, srcwidth, srcheight, srcUnit, imageAttributes, callback, callbackData
graphics : [intptr] 
image : [intptr] 
points : [var] 
count : [int] 
srcx : [float] 
srcy : [float] 
srcwidth : [float] 
srcheight : [float] 
srcUnit : [int] 
imageAttributes : [intptr] 
callback : [int] 
callbackData : [intptr] 
%inst



%index
GdipDrawImagePointsRectI
(no summary)
%group
Win32 gdiplus
%prm
graphics, image, points, count, srcx, srcy, srcwidth, srcheight, srcUnit, imageAttributes, callback, callbackData
graphics : [intptr] 
image : [intptr] 
points : [var] 
count : [int] 
srcx : [int] 
srcy : [int] 
srcwidth : [int] 
srcheight : [int] 
srcUnit : [int] 
imageAttributes : [intptr] 
callback : [int] 
callbackData : [intptr] 
%inst



%index
GdipDrawImageRect
(no summary)
%group
Win32 gdiplus
%prm
graphics, image, x, y, width, height
graphics : [intptr] 
image : [intptr] 
x : [float] 
y : [float] 
width : [float] 
height : [float] 
%inst



%index
GdipDrawImageRectI
(no summary)
%group
Win32 gdiplus
%prm
graphics, image, x, y, width, height
graphics : [intptr] 
image : [intptr] 
x : [int] 
y : [int] 
width : [int] 
height : [int] 
%inst



%index
GdipDrawImageRectRect
(no summary)
%group
Win32 gdiplus
%prm
graphics, image, dstx, dsty, dstwidth, dstheight, srcx, srcy, srcwidth, srcheight, srcUnit, imageAttributes, callback, callbackData
graphics : [intptr] 
image : [intptr] 
dstx : [float] 
dsty : [float] 
dstwidth : [float] 
dstheight : [float] 
srcx : [float] 
srcy : [float] 
srcwidth : [float] 
srcheight : [float] 
srcUnit : [int] 
imageAttributes : [intptr] 
callback : [int] 
callbackData : [intptr] 
%inst



%index
GdipDrawImageRectRectI
(no summary)
%group
Win32 gdiplus
%prm
graphics, image, dstx, dsty, dstwidth, dstheight, srcx, srcy, srcwidth, srcheight, srcUnit, imageAttributes, callback, callbackData
graphics : [intptr] 
image : [intptr] 
dstx : [int] 
dsty : [int] 
dstwidth : [int] 
dstheight : [int] 
srcx : [int] 
srcy : [int] 
srcwidth : [int] 
srcheight : [int] 
srcUnit : [int] 
imageAttributes : [intptr] 
callback : [int] 
callbackData : [intptr] 
%inst



%index
GdipDrawLine
(no summary)
%group
Win32 gdiplus
%prm
graphics, pen, x1, y1, x2, y2
graphics : [intptr] 
pen : [intptr] 
x1 : [float] 
y1 : [float] 
x2 : [float] 
y2 : [float] 
%inst



%index
GdipDrawLineI
(no summary)
%group
Win32 gdiplus
%prm
graphics, pen, x1, y1, x2, y2
graphics : [intptr] 
pen : [intptr] 
x1 : [int] 
y1 : [int] 
x2 : [int] 
y2 : [int] 
%inst



%index
GdipDrawLines
(no summary)
%group
Win32 gdiplus
%prm
graphics, pen, points, count
graphics : [intptr] 
pen : [intptr] 
points : [var] 
count : [int] 
%inst



%index
GdipDrawLinesI
(no summary)
%group
Win32 gdiplus
%prm
graphics, pen, points, count
graphics : [intptr] 
pen : [intptr] 
points : [var] 
count : [int] 
%inst



%index
GdipDrawPath
(no summary)
%group
Win32 gdiplus
%prm
graphics, pen, path
graphics : [intptr] 
pen : [intptr] 
path : [intptr] 
%inst



%index
GdipDrawPie
(no summary)
%group
Win32 gdiplus
%prm
graphics, pen, x, y, width, height, startAngle, sweepAngle
graphics : [intptr] 
pen : [intptr] 
x : [float] 
y : [float] 
width : [float] 
height : [float] 
startAngle : [float] 
sweepAngle : [float] 
%inst



%index
GdipDrawPieI
(no summary)
%group
Win32 gdiplus
%prm
graphics, pen, x, y, width, height, startAngle, sweepAngle
graphics : [intptr] 
pen : [intptr] 
x : [int] 
y : [int] 
width : [int] 
height : [int] 
startAngle : [float] 
sweepAngle : [float] 
%inst



%index
GdipDrawPolygon
(no summary)
%group
Win32 gdiplus
%prm
graphics, pen, points, count
graphics : [intptr] 
pen : [intptr] 
points : [var] 
count : [int] 
%inst



%index
GdipDrawPolygonI
(no summary)
%group
Win32 gdiplus
%prm
graphics, pen, points, count
graphics : [intptr] 
pen : [intptr] 
points : [var] 
count : [int] 
%inst



%index
GdipDrawRectangle
(no summary)
%group
Win32 gdiplus
%prm
graphics, pen, x, y, width, height
graphics : [intptr] 
pen : [intptr] 
x : [float] 
y : [float] 
width : [float] 
height : [float] 
%inst



%index
GdipDrawRectangleI
(no summary)
%group
Win32 gdiplus
%prm
graphics, pen, x, y, width, height
graphics : [intptr] 
pen : [intptr] 
x : [int] 
y : [int] 
width : [int] 
height : [int] 
%inst



%index
GdipDrawRectangles
(no summary)
%group
Win32 gdiplus
%prm
graphics, pen, rects, count
graphics : [intptr] 
pen : [intptr] 
rects : [var] 
count : [int] 
%inst



%index
GdipDrawRectanglesI
(no summary)
%group
Win32 gdiplus
%prm
graphics, pen, rects, count
graphics : [intptr] 
pen : [intptr] 
rects : [var] 
count : [int] 
%inst



%index
GdipDrawString
(no summary)
%group
Win32 gdiplus
%prm
graphics, string, length, font, layoutRect, stringFormat, brush
graphics : [intptr] 
string : [int] 
length : [int] 
font : [intptr] 
layoutRect : [var] 
stringFormat : [intptr] 
brush : [intptr] 
%inst



%index
GdipEmfToWmfBits
(no summary)
%group
Win32 gdiplus
%prm
hemf, cbData16, pData16, iMapMode, eFlags
hemf : [intptr] 
cbData16 : [int] 
pData16 : [var] 
iMapMode : [int] 
eFlags : [int] 
%inst



%index
GdipEndContainer
(no summary)
%group
Win32 gdiplus
%prm
graphics, state
graphics : [intptr] 
state : [int] 
%inst



%index
GdipEnumerateMetafileDestPoint
(no summary)
%group
Win32 gdiplus
%prm
graphics, metafile, destPoint, callback, callbackData, imageAttributes
graphics : [intptr] 
metafile : [intptr] 
destPoint : [var] 
callback : [int] 
callbackData : [intptr] 
imageAttributes : [intptr] 
%inst



%index
GdipEnumerateMetafileDestPointI
(no summary)
%group
Win32 gdiplus
%prm
graphics, metafile, destPoint, callback, callbackData, imageAttributes
graphics : [intptr] 
metafile : [intptr] 
destPoint : [var] 
callback : [int] 
callbackData : [intptr] 
imageAttributes : [intptr] 
%inst



%index
GdipEnumerateMetafileDestPoints
(no summary)
%group
Win32 gdiplus
%prm
graphics, metafile, destPoints, count, callback, callbackData, imageAttributes
graphics : [intptr] 
metafile : [intptr] 
destPoints : [var] 
count : [int] 
callback : [int] 
callbackData : [intptr] 
imageAttributes : [intptr] 
%inst



%index
GdipEnumerateMetafileDestPointsI
(no summary)
%group
Win32 gdiplus
%prm
graphics, metafile, destPoints, count, callback, callbackData, imageAttributes
graphics : [intptr] 
metafile : [intptr] 
destPoints : [var] 
count : [int] 
callback : [int] 
callbackData : [intptr] 
imageAttributes : [intptr] 
%inst



%index
GdipEnumerateMetafileDestRect
(no summary)
%group
Win32 gdiplus
%prm
graphics, metafile, destRect, callback, callbackData, imageAttributes
graphics : [intptr] 
metafile : [intptr] 
destRect : [var] 
callback : [int] 
callbackData : [intptr] 
imageAttributes : [intptr] 
%inst



%index
GdipEnumerateMetafileDestRectI
(no summary)
%group
Win32 gdiplus
%prm
graphics, metafile, destRect, callback, callbackData, imageAttributes
graphics : [intptr] 
metafile : [intptr] 
destRect : [var] 
callback : [int] 
callbackData : [intptr] 
imageAttributes : [intptr] 
%inst



%index
GdipEnumerateMetafileSrcRectDestPoint
(no summary)
%group
Win32 gdiplus
%prm
graphics, metafile, destPoint, srcRect, srcUnit, callback, callbackData, imageAttributes
graphics : [intptr] 
metafile : [intptr] 
destPoint : [var] 
srcRect : [var] 
srcUnit : [int] 
callback : [int] 
callbackData : [intptr] 
imageAttributes : [intptr] 
%inst



%index
GdipEnumerateMetafileSrcRectDestPointI
(no summary)
%group
Win32 gdiplus
%prm
graphics, metafile, destPoint, srcRect, srcUnit, callback, callbackData, imageAttributes
graphics : [intptr] 
metafile : [intptr] 
destPoint : [var] 
srcRect : [var] 
srcUnit : [int] 
callback : [int] 
callbackData : [intptr] 
imageAttributes : [intptr] 
%inst



%index
GdipEnumerateMetafileSrcRectDestPoints
(no summary)
%group
Win32 gdiplus
%prm
graphics, metafile, destPoints, count, srcRect, srcUnit, callback, callbackData, imageAttributes
graphics : [intptr] 
metafile : [intptr] 
destPoints : [var] 
count : [int] 
srcRect : [var] 
srcUnit : [int] 
callback : [int] 
callbackData : [intptr] 
imageAttributes : [intptr] 
%inst



%index
GdipEnumerateMetafileSrcRectDestPointsI
(no summary)
%group
Win32 gdiplus
%prm
graphics, metafile, destPoints, count, srcRect, srcUnit, callback, callbackData, imageAttributes
graphics : [intptr] 
metafile : [intptr] 
destPoints : [var] 
count : [int] 
srcRect : [var] 
srcUnit : [int] 
callback : [int] 
callbackData : [intptr] 
imageAttributes : [intptr] 
%inst



%index
GdipEnumerateMetafileSrcRectDestRect
(no summary)
%group
Win32 gdiplus
%prm
graphics, metafile, destRect, srcRect, srcUnit, callback, callbackData, imageAttributes
graphics : [intptr] 
metafile : [intptr] 
destRect : [var] 
srcRect : [var] 
srcUnit : [int] 
callback : [int] 
callbackData : [intptr] 
imageAttributes : [intptr] 
%inst



%index
GdipEnumerateMetafileSrcRectDestRectI
(no summary)
%group
Win32 gdiplus
%prm
graphics, metafile, destRect, srcRect, srcUnit, callback, callbackData, imageAttributes
graphics : [intptr] 
metafile : [intptr] 
destRect : [var] 
srcRect : [var] 
srcUnit : [int] 
callback : [int] 
callbackData : [intptr] 
imageAttributes : [intptr] 
%inst



%index
GdipFillClosedCurve
(no summary)
%group
Win32 gdiplus
%prm
graphics, brush, points, count
graphics : [intptr] 
brush : [intptr] 
points : [var] 
count : [int] 
%inst



%index
GdipFillClosedCurve2
(no summary)
%group
Win32 gdiplus
%prm
graphics, brush, points, count, tension, fillMode
graphics : [intptr] 
brush : [intptr] 
points : [var] 
count : [int] 
tension : [float] 
fillMode : [int] 
%inst



%index
GdipFillClosedCurve2I
(no summary)
%group
Win32 gdiplus
%prm
graphics, brush, points, count, tension, fillMode
graphics : [intptr] 
brush : [intptr] 
points : [var] 
count : [int] 
tension : [float] 
fillMode : [int] 
%inst



%index
GdipFillClosedCurveI
(no summary)
%group
Win32 gdiplus
%prm
graphics, brush, points, count
graphics : [intptr] 
brush : [intptr] 
points : [var] 
count : [int] 
%inst



%index
GdipFillEllipse
(no summary)
%group
Win32 gdiplus
%prm
graphics, brush, x, y, width, height
graphics : [intptr] 
brush : [intptr] 
x : [float] 
y : [float] 
width : [float] 
height : [float] 
%inst



%index
GdipFillEllipseI
(no summary)
%group
Win32 gdiplus
%prm
graphics, brush, x, y, width, height
graphics : [intptr] 
brush : [intptr] 
x : [int] 
y : [int] 
width : [int] 
height : [int] 
%inst



%index
GdipFillPath
(no summary)
%group
Win32 gdiplus
%prm
graphics, brush, path
graphics : [intptr] 
brush : [intptr] 
path : [intptr] 
%inst



%index
GdipFillPie
(no summary)
%group
Win32 gdiplus
%prm
graphics, brush, x, y, width, height, startAngle, sweepAngle
graphics : [intptr] 
brush : [intptr] 
x : [float] 
y : [float] 
width : [float] 
height : [float] 
startAngle : [float] 
sweepAngle : [float] 
%inst



%index
GdipFillPieI
(no summary)
%group
Win32 gdiplus
%prm
graphics, brush, x, y, width, height, startAngle, sweepAngle
graphics : [intptr] 
brush : [intptr] 
x : [int] 
y : [int] 
width : [int] 
height : [int] 
startAngle : [float] 
sweepAngle : [float] 
%inst



%index
GdipFillPolygon
(no summary)
%group
Win32 gdiplus
%prm
graphics, brush, points, count, fillMode
graphics : [intptr] 
brush : [intptr] 
points : [var] 
count : [int] 
fillMode : [int] 
%inst



%index
GdipFillPolygon2
(no summary)
%group
Win32 gdiplus
%prm
graphics, brush, points, count
graphics : [intptr] 
brush : [intptr] 
points : [var] 
count : [int] 
%inst



%index
GdipFillPolygon2I
(no summary)
%group
Win32 gdiplus
%prm
graphics, brush, points, count
graphics : [intptr] 
brush : [intptr] 
points : [var] 
count : [int] 
%inst



%index
GdipFillPolygonI
(no summary)
%group
Win32 gdiplus
%prm
graphics, brush, points, count, fillMode
graphics : [intptr] 
brush : [intptr] 
points : [var] 
count : [int] 
fillMode : [int] 
%inst



%index
GdipFillRectangle
(no summary)
%group
Win32 gdiplus
%prm
graphics, brush, x, y, width, height
graphics : [intptr] 
brush : [intptr] 
x : [float] 
y : [float] 
width : [float] 
height : [float] 
%inst



%index
GdipFillRectangleI
(no summary)
%group
Win32 gdiplus
%prm
graphics, brush, x, y, width, height
graphics : [intptr] 
brush : [intptr] 
x : [int] 
y : [int] 
width : [int] 
height : [int] 
%inst



%index
GdipFillRectangles
(no summary)
%group
Win32 gdiplus
%prm
graphics, brush, rects, count
graphics : [intptr] 
brush : [intptr] 
rects : [var] 
count : [int] 
%inst



%index
GdipFillRectanglesI
(no summary)
%group
Win32 gdiplus
%prm
graphics, brush, rects, count
graphics : [intptr] 
brush : [intptr] 
rects : [var] 
count : [int] 
%inst



%index
GdipFillRegion
(no summary)
%group
Win32 gdiplus
%prm
graphics, brush, region
graphics : [intptr] 
brush : [intptr] 
region : [intptr] 
%inst



%index
GdipFindFirstImageItem
(no summary)
%group
Win32 gdiplus
%prm
image, item
image : [intptr] 
item : [var] 
%inst



%index
GdipFindNextImageItem
(no summary)
%group
Win32 gdiplus
%prm
image, item
image : [intptr] 
item : [var] 
%inst



%index
GdipFlattenPath
(no summary)
%group
Win32 gdiplus
%prm
path, matrix, flatness
path : [intptr] 
matrix : [intptr] 
flatness : [float] 
%inst



%index
GdipFlush
(no summary)
%group
Win32 gdiplus
%prm
graphics, intention
graphics : [intptr] 
intention : [int] 
%inst



%index
GdipFree
(no summary)
%group
Win32 gdiplus
%prm
ptr
ptr : [intptr] 
%inst



%index
GdipGetAdjustableArrowCapFillState
(no summary)
%group
Win32 gdiplus
%prm
cap, fillState
cap : [intptr] 
fillState : [var] 
%inst



%index
GdipGetAdjustableArrowCapHeight
(no summary)
%group
Win32 gdiplus
%prm
cap, height
cap : [intptr] 
height : [var] 
%inst



%index
GdipGetAdjustableArrowCapMiddleInset
(no summary)
%group
Win32 gdiplus
%prm
cap, middleInset
cap : [intptr] 
middleInset : [var] 
%inst



%index
GdipGetAdjustableArrowCapWidth
(no summary)
%group
Win32 gdiplus
%prm
cap, width
cap : [intptr] 
width : [var] 
%inst



%index
GdipGetAllPropertyItems
(no summary)
%group
Win32 gdiplus
%prm
image, totalBufferSize, numProperties, allItems
image : [intptr] 
totalBufferSize : [int] 
numProperties : [int] 
allItems : [var] 
%inst



%index
GdipGetBrushType
(no summary)
%group
Win32 gdiplus
%prm
brush, type
brush : [intptr] 
type : [var] 
%inst



%index
GdipGetCellAscent
(no summary)
%group
Win32 gdiplus
%prm
family, style, CellAscent
family : [intptr] 
style : [int] 
CellAscent : [var] 
%inst



%index
GdipGetCellDescent
(no summary)
%group
Win32 gdiplus
%prm
family, style, CellDescent
family : [intptr] 
style : [int] 
CellDescent : [var] 
%inst



%index
GdipGetClip
(no summary)
%group
Win32 gdiplus
%prm
graphics, region
graphics : [intptr] 
region : [intptr] 
%inst



%index
GdipGetClipBounds
(no summary)
%group
Win32 gdiplus
%prm
graphics, rect
graphics : [intptr] 
rect : [var] 
%inst



%index
GdipGetClipBoundsI
(no summary)
%group
Win32 gdiplus
%prm
graphics, rect
graphics : [intptr] 
rect : [var] 
%inst



%index
GdipGetCompositingMode
(no summary)
%group
Win32 gdiplus
%prm
graphics, compositingMode
graphics : [intptr] 
compositingMode : [var] 
%inst



%index
GdipGetCompositingQuality
(no summary)
%group
Win32 gdiplus
%prm
graphics, compositingQuality
graphics : [intptr] 
compositingQuality : [var] 
%inst



%index
GdipGetCustomLineCapBaseCap
(no summary)
%group
Win32 gdiplus
%prm
customCap, baseCap
customCap : [intptr] 
baseCap : [var] 
%inst



%index
GdipGetCustomLineCapBaseInset
(no summary)
%group
Win32 gdiplus
%prm
customCap, inset
customCap : [intptr] 
inset : [var] 
%inst



%index
GdipGetCustomLineCapStrokeCaps
(no summary)
%group
Win32 gdiplus
%prm
customCap, startCap, endCap
customCap : [intptr] 
startCap : [var] 
endCap : [var] 
%inst



%index
GdipGetCustomLineCapStrokeJoin
(no summary)
%group
Win32 gdiplus
%prm
customCap, lineJoin
customCap : [intptr] 
lineJoin : [var] 
%inst



%index
GdipGetCustomLineCapType
(no summary)
%group
Win32 gdiplus
%prm
customCap, capType
customCap : [intptr] 
capType : [var] 
%inst



%index
GdipGetCustomLineCapWidthScale
(no summary)
%group
Win32 gdiplus
%prm
customCap, widthScale
customCap : [intptr] 
widthScale : [var] 
%inst



%index
GdipGetDC
(no summary)
%group
Win32 gdiplus
%prm
graphics, hdc
graphics : [intptr] 
hdc : [intptr] 
%inst



%index
GdipGetDpiX
(no summary)
%group
Win32 gdiplus
%prm
graphics, dpi
graphics : [intptr] 
dpi : [var] 
%inst



%index
GdipGetDpiY
(no summary)
%group
Win32 gdiplus
%prm
graphics, dpi
graphics : [intptr] 
dpi : [var] 
%inst



%index
GdipGetEffectParameterSize
(no summary)
%group
Win32 gdiplus
%prm
effect, size
effect : [intptr] 
size : [var] 
%inst



%index
GdipGetEffectParameters
(no summary)
%group
Win32 gdiplus
%prm
effect, size, params
effect : [intptr] 
size : [var] 
params : [int] 
%inst



%index
GdipGetEmHeight
(no summary)
%group
Win32 gdiplus
%prm
family, style, EmHeight
family : [intptr] 
style : [int] 
EmHeight : [var] 
%inst



%index
GdipGetEncoderParameterList
(no summary)
%group
Win32 gdiplus
%prm
image, clsidEncoder, size, buffer
image : [intptr] 
clsidEncoder : [var] 
size : [int] 
buffer : [var] 
%inst



%index
GdipGetEncoderParameterListSize
(no summary)
%group
Win32 gdiplus
%prm
image, clsidEncoder, size
image : [intptr] 
clsidEncoder : [var] 
size : [var] 
%inst



%index
GdipGetFamily
(no summary)
%group
Win32 gdiplus
%prm
font, family
font : [intptr] 
family : [var] 
%inst



%index
GdipGetFamilyName
(no summary)
%group
Win32 gdiplus
%prm
family, name, language
family : [intptr] 
name : [wstr] 
language : [int] 
%inst



%index
GdipGetFontCollectionFamilyCount
(no summary)
%group
Win32 gdiplus
%prm
fontCollection, numFound
fontCollection : [intptr] 
numFound : [var] 
%inst



%index
GdipGetFontCollectionFamilyList
(no summary)
%group
Win32 gdiplus
%prm
fontCollection, numSought, gpfamilies, numFound
fontCollection : [intptr] 
numSought : [int] 
gpfamilies : [var] 
numFound : [var] 
%inst



%index
GdipGetFontHeight
(no summary)
%group
Win32 gdiplus
%prm
font, graphics, height
font : [intptr] 
graphics : [intptr] 
height : [var] 
%inst



%index
GdipGetFontHeightGivenDPI
(no summary)
%group
Win32 gdiplus
%prm
font, dpi, height
font : [intptr] 
dpi : [float] 
height : [var] 
%inst



%index
GdipGetFontSize
(no summary)
%group
Win32 gdiplus
%prm
font, size
font : [intptr] 
size : [var] 
%inst



%index
GdipGetFontStyle
(no summary)
%group
Win32 gdiplus
%prm
font, style
font : [intptr] 
style : [var] 
%inst



%index
GdipGetFontUnit
(no summary)
%group
Win32 gdiplus
%prm
font, unit
font : [intptr] 
unit : [var] 
%inst



%index
GdipGetGenericFontFamilyMonospace
(no summary)
%group
Win32 gdiplus
%prm
nativeFamily
nativeFamily : [var] 
%inst



%index
GdipGetGenericFontFamilySansSerif
(no summary)
%group
Win32 gdiplus
%prm
nativeFamily
nativeFamily : [var] 
%inst



%index
GdipGetGenericFontFamilySerif
(no summary)
%group
Win32 gdiplus
%prm
nativeFamily
nativeFamily : [var] 
%inst



%index
GdipGetHatchBackgroundColor
(no summary)
%group
Win32 gdiplus
%prm
brush, backcol
brush : [intptr] 
backcol : [var] 
%inst



%index
GdipGetHatchForegroundColor
(no summary)
%group
Win32 gdiplus
%prm
brush, forecol
brush : [intptr] 
forecol : [var] 
%inst



%index
GdipGetHatchStyle
(no summary)
%group
Win32 gdiplus
%prm
brush, hatchstyle
brush : [intptr] 
hatchstyle : [var] 
%inst



%index
GdipGetHemfFromMetafile
(no summary)
%group
Win32 gdiplus
%prm
metafile, hEmf
metafile : [intptr] 
hEmf : [intptr] 
%inst



%index
GdipGetImageAttributesAdjustedPalette
(no summary)
%group
Win32 gdiplus
%prm
imageAttr, colorPalette, colorAdjustType
imageAttr : [intptr] 
colorPalette : [var] 
colorAdjustType : [int] 
%inst



%index
GdipGetImageBounds
(no summary)
%group
Win32 gdiplus
%prm
image, srcRect, srcUnit
image : [intptr] 
srcRect : [var] 
srcUnit : [var] 
%inst



%index
GdipGetImageDecoders
(no summary)
%group
Win32 gdiplus
%prm
numDecoders, size, decoders
numDecoders : [int] 
size : [int] 
decoders : [var] 
%inst



%index
GdipGetImageDecodersSize
(no summary)
%group
Win32 gdiplus
%prm
numDecoders, size
numDecoders : [var] 
size : [var] 
%inst



%index
GdipGetImageDimension
(no summary)
%group
Win32 gdiplus
%prm
image, width, height
image : [intptr] 
width : [var] 
height : [var] 
%inst



%index
GdipGetImageEncoders
(no summary)
%group
Win32 gdiplus
%prm
numEncoders, size, encoders
numEncoders : [int] 
size : [int] 
encoders : [var] 
%inst



%index
GdipGetImageEncodersSize
(no summary)
%group
Win32 gdiplus
%prm
numEncoders, size
numEncoders : [var] 
size : [var] 
%inst



%index
GdipGetImageFlags
(no summary)
%group
Win32 gdiplus
%prm
image, flags
image : [intptr] 
flags : [var] 
%inst



%index
GdipGetImageGraphicsContext
(no summary)
%group
Win32 gdiplus
%prm
image, graphics
image : [intptr] 
graphics : [var] 
%inst



%index
GdipGetImageHeight
(no summary)
%group
Win32 gdiplus
%prm
image, height
image : [intptr] 
height : [var] 
%inst



%index
GdipGetImageHorizontalResolution
(no summary)
%group
Win32 gdiplus
%prm
image, resolution
image : [intptr] 
resolution : [var] 
%inst



%index
GdipGetImageItemData
(no summary)
%group
Win32 gdiplus
%prm
image, item
image : [intptr] 
item : [var] 
%inst



%index
GdipGetImagePalette
(no summary)
%group
Win32 gdiplus
%prm
image, palette, size
image : [intptr] 
palette : [var] 
size : [int] 
%inst



%index
GdipGetImagePaletteSize
(no summary)
%group
Win32 gdiplus
%prm
image, size
image : [intptr] 
size : [var] 
%inst



%index
GdipGetImagePixelFormat
(no summary)
%group
Win32 gdiplus
%prm
image, format
image : [intptr] 
format : [var] 
%inst



%index
GdipGetImageRawFormat
(no summary)
%group
Win32 gdiplus
%prm
image, format
image : [intptr] 
format : [var] 
%inst



%index
GdipGetImageThumbnail
(no summary)
%group
Win32 gdiplus
%prm
image, thumbWidth, thumbHeight, thumbImage, callback, callbackData
image : [intptr] 
thumbWidth : [int] 
thumbHeight : [int] 
thumbImage : [var] 
callback : [int] 
callbackData : [intptr] 
%inst



%index
GdipGetImageType
(no summary)
%group
Win32 gdiplus
%prm
image, type
image : [intptr] 
type : [var] 
%inst



%index
GdipGetImageVerticalResolution
(no summary)
%group
Win32 gdiplus
%prm
image, resolution
image : [intptr] 
resolution : [var] 
%inst



%index
GdipGetImageWidth
(no summary)
%group
Win32 gdiplus
%prm
image, width
image : [intptr] 
width : [var] 
%inst



%index
GdipGetInterpolationMode
(no summary)
%group
Win32 gdiplus
%prm
graphics, interpolationMode
graphics : [intptr] 
interpolationMode : [var] 
%inst



%index
GdipGetLineBlend
(no summary)
%group
Win32 gdiplus
%prm
brush, blend, positions, count
brush : [intptr] 
blend : [var] 
positions : [var] 
count : [int] 
%inst



%index
GdipGetLineBlendCount
(no summary)
%group
Win32 gdiplus
%prm
brush, count
brush : [intptr] 
count : [var] 
%inst



%index
GdipGetLineColors
(no summary)
%group
Win32 gdiplus
%prm
brush, colors
brush : [intptr] 
colors : [var] 
%inst



%index
GdipGetLineGammaCorrection
(no summary)
%group
Win32 gdiplus
%prm
brush, useGammaCorrection
brush : [intptr] 
useGammaCorrection : [var] 
%inst



%index
GdipGetLinePresetBlend
(no summary)
%group
Win32 gdiplus
%prm
brush, blend, positions, count
brush : [intptr] 
blend : [var] 
positions : [var] 
count : [int] 
%inst



%index
GdipGetLinePresetBlendCount
(no summary)
%group
Win32 gdiplus
%prm
brush, count
brush : [intptr] 
count : [var] 
%inst



%index
GdipGetLineRect
(no summary)
%group
Win32 gdiplus
%prm
brush, rect
brush : [intptr] 
rect : [var] 
%inst



%index
GdipGetLineRectI
(no summary)
%group
Win32 gdiplus
%prm
brush, rect
brush : [intptr] 
rect : [var] 
%inst



%index
GdipGetLineSpacing
(no summary)
%group
Win32 gdiplus
%prm
family, style, LineSpacing
family : [intptr] 
style : [int] 
LineSpacing : [var] 
%inst



%index
GdipGetLineTransform
(no summary)
%group
Win32 gdiplus
%prm
brush, matrix
brush : [intptr] 
matrix : [intptr] 
%inst



%index
GdipGetLineWrapMode
(no summary)
%group
Win32 gdiplus
%prm
brush, wrapmode
brush : [intptr] 
wrapmode : [var] 
%inst



%index
GdipGetLogFontW
(no summary)
%group
Win32 gdiplus
%prm
font, graphics, logfontW
font : [intptr] 
graphics : [intptr] 
logfontW : [var] 
%inst



%index
GdipGetMatrixElements
(no summary)
%group
Win32 gdiplus
%prm
matrix, matrixOut
matrix : [intptr] 
matrixOut : [var] 
%inst



%index
GdipGetMetafileDownLevelRasterizationLimit
(no summary)
%group
Win32 gdiplus
%prm
metafile, metafileRasterizationLimitDpi
metafile : [intptr] 
metafileRasterizationLimitDpi : [var] 
%inst



%index
GdipGetMetafileHeaderFromEmf
(no summary)
%group
Win32 gdiplus
%prm
hEmf, header
hEmf : [intptr] 
header : [var] 
%inst



%index
GdipGetMetafileHeaderFromFile
(no summary)
%group
Win32 gdiplus
%prm
filename, header
filename : [wstr] 
header : [var] 
%inst



%index
GdipGetMetafileHeaderFromMetafile
(no summary)
%group
Win32 gdiplus
%prm
metafile, header
metafile : [intptr] 
header : [var] 
%inst



%index
GdipGetMetafileHeaderFromStream
(no summary)
%group
Win32 gdiplus
%prm
stream, header
stream : [var] 
header : [var] 
%inst



%index
GdipGetMetafileHeaderFromWmf
(no summary)
%group
Win32 gdiplus
%prm
hWmf, wmfPlaceableFileHeader, header
hWmf : [intptr] 
wmfPlaceableFileHeader : [var] 
header : [var] 
%inst



%index
GdipGetNearestColor
(no summary)
%group
Win32 gdiplus
%prm
graphics, argb
graphics : [intptr] 
argb : [var] 
%inst



%index
GdipGetPageScale
(no summary)
%group
Win32 gdiplus
%prm
graphics, scale
graphics : [intptr] 
scale : [var] 
%inst



%index
GdipGetPageUnit
(no summary)
%group
Win32 gdiplus
%prm
graphics, unit
graphics : [intptr] 
unit : [var] 
%inst



%index
GdipGetPathData
(no summary)
%group
Win32 gdiplus
%prm
path, pathData
path : [intptr] 
pathData : [intptr] 
%inst



%index
GdipGetPathFillMode
(no summary)
%group
Win32 gdiplus
%prm
path, fillmode
path : [intptr] 
fillmode : [var] 
%inst



%index
GdipGetPathGradientBlend
(no summary)
%group
Win32 gdiplus
%prm
brush, blend, positions, count
brush : [intptr] 
blend : [var] 
positions : [var] 
count : [int] 
%inst



%index
GdipGetPathGradientBlendCount
(no summary)
%group
Win32 gdiplus
%prm
brush, count
brush : [intptr] 
count : [var] 
%inst



%index
GdipGetPathGradientCenterColor
(no summary)
%group
Win32 gdiplus
%prm
brush, colors
brush : [intptr] 
colors : [var] 
%inst



%index
GdipGetPathGradientCenterPoint
(no summary)
%group
Win32 gdiplus
%prm
brush, points
brush : [intptr] 
points : [var] 
%inst



%index
GdipGetPathGradientCenterPointI
(no summary)
%group
Win32 gdiplus
%prm
brush, points
brush : [intptr] 
points : [var] 
%inst



%index
GdipGetPathGradientFocusScales
(no summary)
%group
Win32 gdiplus
%prm
brush, xScale, yScale
brush : [intptr] 
xScale : [var] 
yScale : [var] 
%inst



%index
GdipGetPathGradientGammaCorrection
(no summary)
%group
Win32 gdiplus
%prm
brush, useGammaCorrection
brush : [intptr] 
useGammaCorrection : [var] 
%inst



%index
GdipGetPathGradientPath
(no summary)
%group
Win32 gdiplus
%prm
brush, path
brush : [intptr] 
path : [intptr] 
%inst



%index
GdipGetPathGradientPointCount
(no summary)
%group
Win32 gdiplus
%prm
brush, count
brush : [intptr] 
count : [var] 
%inst



%index
GdipGetPathGradientPresetBlend
(no summary)
%group
Win32 gdiplus
%prm
brush, blend, positions, count
brush : [intptr] 
blend : [var] 
positions : [var] 
count : [int] 
%inst



%index
GdipGetPathGradientPresetBlendCount
(no summary)
%group
Win32 gdiplus
%prm
brush, count
brush : [intptr] 
count : [var] 
%inst



%index
GdipGetPathGradientRect
(no summary)
%group
Win32 gdiplus
%prm
brush, rect
brush : [intptr] 
rect : [var] 
%inst



%index
GdipGetPathGradientRectI
(no summary)
%group
Win32 gdiplus
%prm
brush, rect
brush : [intptr] 
rect : [var] 
%inst



%index
GdipGetPathGradientSurroundColorCount
(no summary)
%group
Win32 gdiplus
%prm
brush, count
brush : [intptr] 
count : [var] 
%inst



%index
GdipGetPathGradientSurroundColorsWithCount
(no summary)
%group
Win32 gdiplus
%prm
brush, color, count
brush : [intptr] 
color : [var] 
count : [var] 
%inst



%index
GdipGetPathGradientTransform
(no summary)
%group
Win32 gdiplus
%prm
brush, matrix
brush : [intptr] 
matrix : [intptr] 
%inst



%index
GdipGetPathGradientWrapMode
(no summary)
%group
Win32 gdiplus
%prm
brush, wrapmode
brush : [intptr] 
wrapmode : [var] 
%inst



%index
GdipGetPathLastPoint
(no summary)
%group
Win32 gdiplus
%prm
path, lastPoint
path : [intptr] 
lastPoint : [var] 
%inst



%index
GdipGetPathPoints
(no summary)
%group
Win32 gdiplus
%prm
param0, points, count
param0 : [intptr] 
points : [var] 
count : [int] 
%inst



%index
GdipGetPathPointsI
(no summary)
%group
Win32 gdiplus
%prm
param0, points, count
param0 : [intptr] 
points : [var] 
count : [int] 
%inst



%index
GdipGetPathTypes
(no summary)
%group
Win32 gdiplus
%prm
path, types, count
path : [intptr] 
types : [var] 
count : [int] 
%inst



%index
GdipGetPathWorldBounds
(no summary)
%group
Win32 gdiplus
%prm
path, bounds, matrix, pen
path : [intptr] 
bounds : [var] 
matrix : [intptr] 
pen : [intptr] 
%inst



%index
GdipGetPathWorldBoundsI
(no summary)
%group
Win32 gdiplus
%prm
path, bounds, matrix, pen
path : [intptr] 
bounds : [var] 
matrix : [intptr] 
pen : [intptr] 
%inst



%index
GdipGetPenBrushFill
(no summary)
%group
Win32 gdiplus
%prm
pen, brush
pen : [intptr] 
brush : [var] 
%inst



%index
GdipGetPenColor
(no summary)
%group
Win32 gdiplus
%prm
pen, argb
pen : [intptr] 
argb : [var] 
%inst



%index
GdipGetPenCompoundArray
(no summary)
%group
Win32 gdiplus
%prm
pen, dash, count
pen : [intptr] 
dash : [var] 
count : [int] 
%inst



%index
GdipGetPenCompoundCount
(no summary)
%group
Win32 gdiplus
%prm
pen, count
pen : [intptr] 
count : [var] 
%inst



%index
GdipGetPenCustomEndCap
(no summary)
%group
Win32 gdiplus
%prm
pen, customCap
pen : [intptr] 
customCap : [var] 
%inst



%index
GdipGetPenCustomStartCap
(no summary)
%group
Win32 gdiplus
%prm
pen, customCap
pen : [intptr] 
customCap : [var] 
%inst



%index
GdipGetPenDashArray
(no summary)
%group
Win32 gdiplus
%prm
pen, dash, count
pen : [intptr] 
dash : [var] 
count : [int] 
%inst



%index
GdipGetPenDashCap197819
(no summary)
%group
Win32 gdiplus
%prm
pen, dashCap
pen : [intptr] 
dashCap : [var] 
%inst



%index
GdipGetPenDashCount
(no summary)
%group
Win32 gdiplus
%prm
pen, count
pen : [intptr] 
count : [var] 
%inst



%index
GdipGetPenDashOffset
(no summary)
%group
Win32 gdiplus
%prm
pen, offset
pen : [intptr] 
offset : [var] 
%inst



%index
GdipGetPenDashStyle
(no summary)
%group
Win32 gdiplus
%prm
pen, dashstyle
pen : [intptr] 
dashstyle : [var] 
%inst



%index
GdipGetPenEndCap
(no summary)
%group
Win32 gdiplus
%prm
pen, endCap
pen : [intptr] 
endCap : [var] 
%inst



%index
GdipGetPenFillType
(no summary)
%group
Win32 gdiplus
%prm
pen, type
pen : [intptr] 
type : [var] 
%inst



%index
GdipGetPenLineJoin
(no summary)
%group
Win32 gdiplus
%prm
pen, lineJoin
pen : [intptr] 
lineJoin : [var] 
%inst



%index
GdipGetPenMiterLimit
(no summary)
%group
Win32 gdiplus
%prm
pen, miterLimit
pen : [intptr] 
miterLimit : [var] 
%inst



%index
GdipGetPenMode
(no summary)
%group
Win32 gdiplus
%prm
pen, penMode
pen : [intptr] 
penMode : [var] 
%inst



%index
GdipGetPenStartCap
(no summary)
%group
Win32 gdiplus
%prm
pen, startCap
pen : [intptr] 
startCap : [var] 
%inst



%index
GdipGetPenTransform
(no summary)
%group
Win32 gdiplus
%prm
pen, matrix
pen : [intptr] 
matrix : [intptr] 
%inst



%index
GdipGetPenUnit
(no summary)
%group
Win32 gdiplus
%prm
pen, unit
pen : [intptr] 
unit : [var] 
%inst



%index
GdipGetPenWidth
(no summary)
%group
Win32 gdiplus
%prm
pen, width
pen : [intptr] 
width : [var] 
%inst



%index
GdipGetPixelOffsetMode
(no summary)
%group
Win32 gdiplus
%prm
graphics, pixelOffsetMode
graphics : [intptr] 
pixelOffsetMode : [var] 
%inst



%index
GdipGetPointCount
(no summary)
%group
Win32 gdiplus
%prm
path, count
path : [intptr] 
count : [var] 
%inst



%index
GdipGetPropertyCount
(no summary)
%group
Win32 gdiplus
%prm
image, numOfProperty
image : [intptr] 
numOfProperty : [var] 
%inst



%index
GdipGetPropertyIdList
(no summary)
%group
Win32 gdiplus
%prm
image, numOfProperty, list
image : [intptr] 
numOfProperty : [int] 
list : [var] 
%inst



%index
GdipGetPropertyItem
(no summary)
%group
Win32 gdiplus
%prm
image, propId, propSize, buffer
image : [intptr] 
propId : [int] 
propSize : [int] 
buffer : [var] 
%inst



%index
GdipGetPropertyItemSize
(no summary)
%group
Win32 gdiplus
%prm
image, propId, size
image : [intptr] 
propId : [int] 
size : [var] 
%inst



%index
GdipGetPropertySize
(no summary)
%group
Win32 gdiplus
%prm
image, totalBufferSize, numProperties
image : [intptr] 
totalBufferSize : [var] 
numProperties : [var] 
%inst



%index
GdipGetRegionBounds
(no summary)
%group
Win32 gdiplus
%prm
region, graphics, rect
region : [intptr] 
graphics : [intptr] 
rect : [var] 
%inst



%index
GdipGetRegionBoundsI
(no summary)
%group
Win32 gdiplus
%prm
region, graphics, rect
region : [intptr] 
graphics : [intptr] 
rect : [var] 
%inst



%index
GdipGetRegionData
(no summary)
%group
Win32 gdiplus
%prm
region, buffer, bufferSize, sizeFilled
region : [intptr] 
buffer : [var] 
bufferSize : [int] 
sizeFilled : [var] 
%inst



%index
GdipGetRegionDataSize
(no summary)
%group
Win32 gdiplus
%prm
region, bufferSize
region : [intptr] 
bufferSize : [var] 
%inst



%index
GdipGetRegionHRgn
(no summary)
%group
Win32 gdiplus
%prm
region, graphics, hRgn
region : [intptr] 
graphics : [intptr] 
hRgn : [intptr] 
%inst



%index
GdipGetRegionScans
(no summary)
%group
Win32 gdiplus
%prm
region, rects, count, matrix
region : [intptr] 
rects : [var] 
count : [var] 
matrix : [intptr] 
%inst



%index
GdipGetRegionScansCount
(no summary)
%group
Win32 gdiplus
%prm
region, count, matrix
region : [intptr] 
count : [var] 
matrix : [intptr] 
%inst



%index
GdipGetRegionScansI
(no summary)
%group
Win32 gdiplus
%prm
region, rects, count, matrix
region : [intptr] 
rects : [var] 
count : [var] 
matrix : [intptr] 
%inst



%index
GdipGetRenderingOrigin
(no summary)
%group
Win32 gdiplus
%prm
graphics, x, y
graphics : [intptr] 
x : [var] 
y : [var] 
%inst



%index
GdipGetSmoothingMode
(no summary)
%group
Win32 gdiplus
%prm
graphics, smoothingMode
graphics : [intptr] 
smoothingMode : [var] 
%inst



%index
GdipGetSolidFillColor
(no summary)
%group
Win32 gdiplus
%prm
brush, color
brush : [intptr] 
color : [var] 
%inst



%index
GdipGetStringFormatAlign
(no summary)
%group
Win32 gdiplus
%prm
format, align
format : [intptr] 
align : [var] 
%inst



%index
GdipGetStringFormatDigitSubstitution
(no summary)
%group
Win32 gdiplus
%prm
format, language, substitute
format : [intptr] 
language : [var] 
substitute : [var] 
%inst



%index
GdipGetStringFormatFlags
(no summary)
%group
Win32 gdiplus
%prm
format, flags
format : [intptr] 
flags : [var] 
%inst



%index
GdipGetStringFormatHotkeyPrefix
(no summary)
%group
Win32 gdiplus
%prm
format, hotkeyPrefix
format : [intptr] 
hotkeyPrefix : [var] 
%inst



%index
GdipGetStringFormatLineAlign
(no summary)
%group
Win32 gdiplus
%prm
format, align
format : [intptr] 
align : [var] 
%inst



%index
GdipGetStringFormatMeasurableCharacterRangeCount
(no summary)
%group
Win32 gdiplus
%prm
format, count
format : [intptr] 
count : [var] 
%inst



%index
GdipGetStringFormatTabStopCount
(no summary)
%group
Win32 gdiplus
%prm
format, count
format : [intptr] 
count : [var] 
%inst



%index
GdipGetStringFormatTabStops
(no summary)
%group
Win32 gdiplus
%prm
format, count, firstTabOffset, tabStops
format : [intptr] 
count : [int] 
firstTabOffset : [var] 
tabStops : [var] 
%inst



%index
GdipGetStringFormatTrimming
(no summary)
%group
Win32 gdiplus
%prm
format, trimming
format : [intptr] 
trimming : [var] 
%inst



%index
GdipGetTextContrast
(no summary)
%group
Win32 gdiplus
%prm
graphics, contrast
graphics : [intptr] 
contrast : [var] 
%inst



%index
GdipGetTextRenderingHint
(no summary)
%group
Win32 gdiplus
%prm
graphics, mode
graphics : [intptr] 
mode : [var] 
%inst



%index
GdipGetTextureImage
(no summary)
%group
Win32 gdiplus
%prm
brush, image
brush : [intptr] 
image : [var] 
%inst



%index
GdipGetTextureTransform
(no summary)
%group
Win32 gdiplus
%prm
brush, matrix
brush : [intptr] 
matrix : [intptr] 
%inst



%index
GdipGetTextureWrapMode
(no summary)
%group
Win32 gdiplus
%prm
brush, wrapmode
brush : [intptr] 
wrapmode : [var] 
%inst



%index
GdipGetVisibleClipBounds
(no summary)
%group
Win32 gdiplus
%prm
graphics, rect
graphics : [intptr] 
rect : [var] 
%inst



%index
GdipGetVisibleClipBoundsI
(no summary)
%group
Win32 gdiplus
%prm
graphics, rect
graphics : [intptr] 
rect : [var] 
%inst



%index
GdipGetWorldTransform
(no summary)
%group
Win32 gdiplus
%prm
graphics, matrix
graphics : [intptr] 
matrix : [intptr] 
%inst



%index
GdipGraphicsClear
(no summary)
%group
Win32 gdiplus
%prm
graphics, color
graphics : [intptr] 
color : [int] 
%inst



%index
GdipGraphicsSetAbort
(no summary)
%group
Win32 gdiplus
%prm
pGraphics, pIAbort
pGraphics : [intptr] 
pIAbort : [var] 
%inst



%index
GdipImageForceValidation
(no summary)
%group
Win32 gdiplus
%prm
image
image : [intptr] 
%inst



%index
GdipImageGetFrameCount
(no summary)
%group
Win32 gdiplus
%prm
image, dimensionID, count
image : [intptr] 
dimensionID : [var] 
count : [var] 
%inst



%index
GdipImageGetFrameDimensionsCount
(no summary)
%group
Win32 gdiplus
%prm
image, count
image : [intptr] 
count : [var] 
%inst



%index
GdipImageGetFrameDimensionsList
(no summary)
%group
Win32 gdiplus
%prm
image, dimensionIDs, count
image : [intptr] 
dimensionIDs : [var] 
count : [int] 
%inst



%index
GdipImageRotateFlip
(no summary)
%group
Win32 gdiplus
%prm
image, rfType
image : [intptr] 
rfType : [int] 
%inst



%index
GdipImageSelectActiveFrame
(no summary)
%group
Win32 gdiplus
%prm
image, dimensionID, frameIndex
image : [intptr] 
dimensionID : [var] 
frameIndex : [int] 
%inst



%index
GdipImageSetAbort
(no summary)
%group
Win32 gdiplus
%prm
pImage, pIAbort
pImage : [intptr] 
pIAbort : [var] 
%inst



%index
GdipInitializePalette
(no summary)
%group
Win32 gdiplus
%prm
palette, palettetype, optimalColors, useTransparentColor, bitmap
palette : [var] 
palettetype : [int] 
optimalColors : [int] 
useTransparentColor : [int] 
bitmap : [intptr] 
%inst



%index
GdipInvertMatrix
(no summary)
%group
Win32 gdiplus
%prm
matrix
matrix : [intptr] 
%inst



%index
GdipIsClipEmpty
(no summary)
%group
Win32 gdiplus
%prm
graphics, result
graphics : [intptr] 
result : [var] 
%inst



%index
GdipIsEmptyRegion
(no summary)
%group
Win32 gdiplus
%prm
region, graphics, result
region : [intptr] 
graphics : [intptr] 
result : [var] 
%inst



%index
GdipIsEqualRegion
(no summary)
%group
Win32 gdiplus
%prm
region, region2, graphics, result
region : [intptr] 
region2 : [intptr] 
graphics : [intptr] 
result : [var] 
%inst



%index
GdipIsInfiniteRegion
(no summary)
%group
Win32 gdiplus
%prm
region, graphics, result
region : [intptr] 
graphics : [intptr] 
result : [var] 
%inst



%index
GdipIsMatrixEqual
(no summary)
%group
Win32 gdiplus
%prm
matrix, matrix2, result
matrix : [intptr] 
matrix2 : [intptr] 
result : [var] 
%inst



%index
GdipIsMatrixIdentity
(no summary)
%group
Win32 gdiplus
%prm
matrix, result
matrix : [intptr] 
result : [var] 
%inst



%index
GdipIsMatrixInvertible
(no summary)
%group
Win32 gdiplus
%prm
matrix, result
matrix : [intptr] 
result : [var] 
%inst



%index
GdipIsOutlineVisiblePathPoint
(no summary)
%group
Win32 gdiplus
%prm
path, x, y, pen, graphics, result
path : [intptr] 
x : [float] 
y : [float] 
pen : [intptr] 
graphics : [intptr] 
result : [var] 
%inst



%index
GdipIsOutlineVisiblePathPointI
(no summary)
%group
Win32 gdiplus
%prm
path, x, y, pen, graphics, result
path : [intptr] 
x : [int] 
y : [int] 
pen : [intptr] 
graphics : [intptr] 
result : [var] 
%inst



%index
GdipIsStyleAvailable
(no summary)
%group
Win32 gdiplus
%prm
family, style, IsStyleAvailable
family : [intptr] 
style : [int] 
IsStyleAvailable : [var] 
%inst



%index
GdipIsVisibleClipEmpty
(no summary)
%group
Win32 gdiplus
%prm
graphics, result
graphics : [intptr] 
result : [var] 
%inst



%index
GdipIsVisiblePathPoint
(no summary)
%group
Win32 gdiplus
%prm
path, x, y, graphics, result
path : [intptr] 
x : [float] 
y : [float] 
graphics : [intptr] 
result : [var] 
%inst



%index
GdipIsVisiblePathPointI
(no summary)
%group
Win32 gdiplus
%prm
path, x, y, graphics, result
path : [intptr] 
x : [int] 
y : [int] 
graphics : [intptr] 
result : [var] 
%inst



%index
GdipIsVisiblePoint
(no summary)
%group
Win32 gdiplus
%prm
graphics, x, y, result
graphics : [intptr] 
x : [float] 
y : [float] 
result : [var] 
%inst



%index
GdipIsVisiblePointI
(no summary)
%group
Win32 gdiplus
%prm
graphics, x, y, result
graphics : [intptr] 
x : [int] 
y : [int] 
result : [var] 
%inst



%index
GdipIsVisibleRect
(no summary)
%group
Win32 gdiplus
%prm
graphics, x, y, width, height, result
graphics : [intptr] 
x : [float] 
y : [float] 
width : [float] 
height : [float] 
result : [var] 
%inst



%index
GdipIsVisibleRectI
(no summary)
%group
Win32 gdiplus
%prm
graphics, x, y, width, height, result
graphics : [intptr] 
x : [int] 
y : [int] 
width : [int] 
height : [int] 
result : [var] 
%inst



%index
GdipIsVisibleRegionPoint
(no summary)
%group
Win32 gdiplus
%prm
region, x, y, graphics, result
region : [intptr] 
x : [float] 
y : [float] 
graphics : [intptr] 
result : [var] 
%inst



%index
GdipIsVisibleRegionPointI
(no summary)
%group
Win32 gdiplus
%prm
region, x, y, graphics, result
region : [intptr] 
x : [int] 
y : [int] 
graphics : [intptr] 
result : [var] 
%inst



%index
GdipIsVisibleRegionRect
(no summary)
%group
Win32 gdiplus
%prm
region, x, y, width, height, graphics, result
region : [intptr] 
x : [float] 
y : [float] 
width : [float] 
height : [float] 
graphics : [intptr] 
result : [var] 
%inst



%index
GdipIsVisibleRegionRectI
(no summary)
%group
Win32 gdiplus
%prm
region, x, y, width, height, graphics, result
region : [intptr] 
x : [int] 
y : [int] 
width : [int] 
height : [int] 
graphics : [intptr] 
result : [var] 
%inst



%index
GdipLoadImageFromFile
(no summary)
%group
Win32 gdiplus
%prm
filename, image
filename : [wstr] 
image : [var] 
%inst



%index
GdipLoadImageFromFileICM
(no summary)
%group
Win32 gdiplus
%prm
filename, image
filename : [wstr] 
image : [var] 
%inst



%index
GdipLoadImageFromStream
(no summary)
%group
Win32 gdiplus
%prm
stream, image
stream : [var] 
image : [var] 
%inst



%index
GdipLoadImageFromStreamICM
(no summary)
%group
Win32 gdiplus
%prm
stream, image
stream : [var] 
image : [var] 
%inst



%index
GdipMeasureCharacterRanges
(no summary)
%group
Win32 gdiplus
%prm
graphics, string, length, font, layoutRect, stringFormat, regionCount, regions
graphics : [intptr] 
string : [int] 
length : [int] 
font : [intptr] 
layoutRect : [var] 
stringFormat : [intptr] 
regionCount : [int] 
regions : [var] 
%inst



%index
GdipMeasureDriverString
(no summary)
%group
Win32 gdiplus
%prm
graphics, text, length, font, positions, flags, matrix, boundingBox
graphics : [intptr] 
text : [var] 
length : [int] 
font : [intptr] 
positions : [var] 
flags : [int] 
matrix : [intptr] 
boundingBox : [var] 
%inst



%index
GdipMeasureString
(no summary)
%group
Win32 gdiplus
%prm
graphics, string, length, font, layoutRect, stringFormat, boundingBox, codepointsFitted, linesFilled
graphics : [intptr] 
string : [int] 
length : [int] 
font : [intptr] 
layoutRect : [var] 
stringFormat : [intptr] 
boundingBox : [var] 
codepointsFitted : [var] 
linesFilled : [var] 
%inst



%index
GdipMultiplyLineTransform
(no summary)
%group
Win32 gdiplus
%prm
brush, matrix, order
brush : [intptr] 
matrix : [intptr] 
order : [int] 
%inst



%index
GdipMultiplyMatrix
(no summary)
%group
Win32 gdiplus
%prm
matrix, matrix2, order
matrix : [intptr] 
matrix2 : [intptr] 
order : [int] 
%inst



%index
GdipMultiplyPathGradientTransform
(no summary)
%group
Win32 gdiplus
%prm
brush, matrix, order
brush : [intptr] 
matrix : [intptr] 
order : [int] 
%inst



%index
GdipMultiplyPenTransform
(no summary)
%group
Win32 gdiplus
%prm
pen, matrix, order
pen : [intptr] 
matrix : [intptr] 
order : [int] 
%inst



%index
GdipMultiplyTextureTransform
(no summary)
%group
Win32 gdiplus
%prm
brush, matrix, order
brush : [intptr] 
matrix : [intptr] 
order : [int] 
%inst



%index
GdipMultiplyWorldTransform
(no summary)
%group
Win32 gdiplus
%prm
graphics, matrix, order
graphics : [intptr] 
matrix : [intptr] 
order : [int] 
%inst



%index
GdipNewInstalledFontCollection
(no summary)
%group
Win32 gdiplus
%prm
fontCollection
fontCollection : [var] 
%inst



%index
GdipNewPrivateFontCollection
(no summary)
%group
Win32 gdiplus
%prm
fontCollection
fontCollection : [var] 
%inst



%index
GdipPathIterCopyData
(no summary)
%group
Win32 gdiplus
%prm
iterator, resultCount, points, types, startIndex, endIndex
iterator : [intptr] 
resultCount : [var] 
points : [var] 
types : [var] 
startIndex : [int] 
endIndex : [int] 
%inst



%index
GdipPathIterEnumerate
(no summary)
%group
Win32 gdiplus
%prm
iterator, resultCount, points, types, count
iterator : [intptr] 
resultCount : [var] 
points : [var] 
types : [var] 
count : [int] 
%inst



%index
GdipPathIterGetCount
(no summary)
%group
Win32 gdiplus
%prm
iterator, count
iterator : [intptr] 
count : [var] 
%inst



%index
GdipPathIterGetSubpathCount
(no summary)
%group
Win32 gdiplus
%prm
iterator, count
iterator : [intptr] 
count : [var] 
%inst



%index
GdipPathIterHasCurve
(no summary)
%group
Win32 gdiplus
%prm
iterator, hasCurve
iterator : [intptr] 
hasCurve : [var] 
%inst



%index
GdipPathIterIsValid
(no summary)
%group
Win32 gdiplus
%prm
iterator, valid
iterator : [intptr] 
valid : [var] 
%inst



%index
GdipPathIterNextMarker
(no summary)
%group
Win32 gdiplus
%prm
iterator, resultCount, startIndex, endIndex
iterator : [intptr] 
resultCount : [var] 
startIndex : [var] 
endIndex : [var] 
%inst



%index
GdipPathIterNextMarkerPath
(no summary)
%group
Win32 gdiplus
%prm
iterator, resultCount, path
iterator : [intptr] 
resultCount : [var] 
path : [intptr] 
%inst



%index
GdipPathIterNextPathType
(no summary)
%group
Win32 gdiplus
%prm
iterator, resultCount, pathType, startIndex, endIndex
iterator : [intptr] 
resultCount : [var] 
pathType : [var] 
startIndex : [var] 
endIndex : [var] 
%inst



%index
GdipPathIterNextSubpath
(no summary)
%group
Win32 gdiplus
%prm
iterator, resultCount, startIndex, endIndex, isClosed
iterator : [intptr] 
resultCount : [var] 
startIndex : [var] 
endIndex : [var] 
isClosed : [var] 
%inst



%index
GdipPathIterNextSubpathPath
(no summary)
%group
Win32 gdiplus
%prm
iterator, resultCount, path, isClosed
iterator : [intptr] 
resultCount : [var] 
path : [intptr] 
isClosed : [var] 
%inst



%index
GdipPathIterRewind
(no summary)
%group
Win32 gdiplus
%prm
iterator
iterator : [intptr] 
%inst



%index
GdipPlayMetafileRecord
(no summary)
%group
Win32 gdiplus
%prm
metafile, recordType, flags, dataSize, data
metafile : [intptr] 
recordType : [int] 
flags : [int] 
dataSize : [int] 
data : [var] 
%inst



%index
GdipPrivateAddFontFile
(no summary)
%group
Win32 gdiplus
%prm
fontCollection, filename
fontCollection : [intptr] 
filename : [wstr] 
%inst



%index
GdipPrivateAddMemoryFont
(no summary)
%group
Win32 gdiplus
%prm
fontCollection, memory, length
fontCollection : [intptr] 
memory : [intptr] 
length : [int] 
%inst



%index
GdipRecordMetafile
(no summary)
%group
Win32 gdiplus
%prm
referenceHdc, type, frameRect, frameUnit, description, metafile
referenceHdc : [intptr] 
type : [int] 
frameRect : [var] 
frameUnit : [int] 
description : [wstr] 
metafile : [var] 
%inst



%index
GdipRecordMetafileFileName
(no summary)
%group
Win32 gdiplus
%prm
fileName, referenceHdc, type, frameRect, frameUnit, description, metafile
fileName : [wstr] 
referenceHdc : [intptr] 
type : [int] 
frameRect : [var] 
frameUnit : [int] 
description : [wstr] 
metafile : [var] 
%inst



%index
GdipRecordMetafileFileNameI
(no summary)
%group
Win32 gdiplus
%prm
fileName, referenceHdc, type, frameRect, frameUnit, description, metafile
fileName : [wstr] 
referenceHdc : [intptr] 
type : [int] 
frameRect : [var] 
frameUnit : [int] 
description : [wstr] 
metafile : [var] 
%inst



%index
GdipRecordMetafileI
(no summary)
%group
Win32 gdiplus
%prm
referenceHdc, type, frameRect, frameUnit, description, metafile
referenceHdc : [intptr] 
type : [int] 
frameRect : [var] 
frameUnit : [int] 
description : [wstr] 
metafile : [var] 
%inst



%index
GdipRecordMetafileStream
(no summary)
%group
Win32 gdiplus
%prm
stream, referenceHdc, type, frameRect, frameUnit, description, metafile
stream : [var] 
referenceHdc : [intptr] 
type : [int] 
frameRect : [var] 
frameUnit : [int] 
description : [wstr] 
metafile : [var] 
%inst



%index
GdipRecordMetafileStreamI
(no summary)
%group
Win32 gdiplus
%prm
stream, referenceHdc, type, frameRect, frameUnit, description, metafile
stream : [var] 
referenceHdc : [intptr] 
type : [int] 
frameRect : [var] 
frameUnit : [int] 
description : [wstr] 
metafile : [var] 
%inst



%index
GdipReleaseDC
(no summary)
%group
Win32 gdiplus
%prm
graphics, hdc
graphics : [intptr] 
hdc : [intptr] 
%inst



%index
GdipRemovePropertyItem
(no summary)
%group
Win32 gdiplus
%prm
image, propId
image : [intptr] 
propId : [int] 
%inst



%index
GdipResetClip
(no summary)
%group
Win32 gdiplus
%prm
graphics
graphics : [intptr] 
%inst



%index
GdipResetImageAttributes
(no summary)
%group
Win32 gdiplus
%prm
imageattr, type
imageattr : [intptr] 
type : [int] 
%inst



%index
GdipResetLineTransform
(no summary)
%group
Win32 gdiplus
%prm
brush
brush : [intptr] 
%inst



%index
GdipResetPageTransform
(no summary)
%group
Win32 gdiplus
%prm
graphics
graphics : [intptr] 
%inst



%index
GdipResetPath
(no summary)
%group
Win32 gdiplus
%prm
path
path : [intptr] 
%inst



%index
GdipResetPathGradientTransform
(no summary)
%group
Win32 gdiplus
%prm
brush
brush : [intptr] 
%inst



%index
GdipResetPenTransform
(no summary)
%group
Win32 gdiplus
%prm
pen
pen : [intptr] 
%inst



%index
GdipResetTextureTransform
(no summary)
%group
Win32 gdiplus
%prm
brush
brush : [intptr] 
%inst



%index
GdipResetWorldTransform
(no summary)
%group
Win32 gdiplus
%prm
graphics
graphics : [intptr] 
%inst



%index
GdipRestoreGraphics
(no summary)
%group
Win32 gdiplus
%prm
graphics, state
graphics : [intptr] 
state : [int] 
%inst



%index
GdipReversePath
(no summary)
%group
Win32 gdiplus
%prm
path
path : [intptr] 
%inst



%index
GdipRotateLineTransform
(no summary)
%group
Win32 gdiplus
%prm
brush, angle, order
brush : [intptr] 
angle : [float] 
order : [int] 
%inst



%index
GdipRotateMatrix
(no summary)
%group
Win32 gdiplus
%prm
matrix, angle, order
matrix : [intptr] 
angle : [float] 
order : [int] 
%inst



%index
GdipRotatePathGradientTransform
(no summary)
%group
Win32 gdiplus
%prm
brush, angle, order
brush : [intptr] 
angle : [float] 
order : [int] 
%inst



%index
GdipRotatePenTransform
(no summary)
%group
Win32 gdiplus
%prm
pen, angle, order
pen : [intptr] 
angle : [float] 
order : [int] 
%inst



%index
GdipRotateTextureTransform
(no summary)
%group
Win32 gdiplus
%prm
brush, angle, order
brush : [intptr] 
angle : [float] 
order : [int] 
%inst



%index
GdipRotateWorldTransform
(no summary)
%group
Win32 gdiplus
%prm
graphics, angle, order
graphics : [intptr] 
angle : [float] 
order : [int] 
%inst



%index
GdipSaveAdd
(no summary)
%group
Win32 gdiplus
%prm
image, encoderParams
image : [intptr] 
encoderParams : [var] 
%inst



%index
GdipSaveAddImage
(no summary)
%group
Win32 gdiplus
%prm
image, newImage, encoderParams
image : [intptr] 
newImage : [intptr] 
encoderParams : [var] 
%inst



%index
GdipSaveGraphics
(no summary)
%group
Win32 gdiplus
%prm
graphics, state
graphics : [intptr] 
state : [var] 
%inst



%index
GdipSaveImageToFile
(no summary)
%group
Win32 gdiplus
%prm
image, filename, clsidEncoder, encoderParams
image : [intptr] 
filename : [wstr] 
clsidEncoder : [var] 
encoderParams : [var] 
%inst



%index
GdipSaveImageToStream
(no summary)
%group
Win32 gdiplus
%prm
image, stream, clsidEncoder, encoderParams
image : [intptr] 
stream : [var] 
clsidEncoder : [var] 
encoderParams : [var] 
%inst



%index
GdipScaleLineTransform
(no summary)
%group
Win32 gdiplus
%prm
brush, sx, sy, order
brush : [intptr] 
sx : [float] 
sy : [float] 
order : [int] 
%inst



%index
GdipScaleMatrix
(no summary)
%group
Win32 gdiplus
%prm
matrix, scaleX, scaleY, order
matrix : [intptr] 
scaleX : [float] 
scaleY : [float] 
order : [int] 
%inst



%index
GdipScalePathGradientTransform
(no summary)
%group
Win32 gdiplus
%prm
brush, sx, sy, order
brush : [intptr] 
sx : [float] 
sy : [float] 
order : [int] 
%inst



%index
GdipScalePenTransform
(no summary)
%group
Win32 gdiplus
%prm
pen, sx, sy, order
pen : [intptr] 
sx : [float] 
sy : [float] 
order : [int] 
%inst



%index
GdipScaleTextureTransform
(no summary)
%group
Win32 gdiplus
%prm
brush, sx, sy, order
brush : [intptr] 
sx : [float] 
sy : [float] 
order : [int] 
%inst



%index
GdipScaleWorldTransform
(no summary)
%group
Win32 gdiplus
%prm
graphics, sx, sy, order
graphics : [intptr] 
sx : [float] 
sy : [float] 
order : [int] 
%inst



%index
GdipSetAdjustableArrowCapFillState
(no summary)
%group
Win32 gdiplus
%prm
cap, fillState
cap : [intptr] 
fillState : [int] 
%inst



%index
GdipSetAdjustableArrowCapHeight
(no summary)
%group
Win32 gdiplus
%prm
cap, height
cap : [intptr] 
height : [float] 
%inst



%index
GdipSetAdjustableArrowCapMiddleInset
(no summary)
%group
Win32 gdiplus
%prm
cap, middleInset
cap : [intptr] 
middleInset : [float] 
%inst



%index
GdipSetAdjustableArrowCapWidth
(no summary)
%group
Win32 gdiplus
%prm
cap, width
cap : [intptr] 
width : [float] 
%inst



%index
GdipSetClipGraphics
(no summary)
%group
Win32 gdiplus
%prm
graphics, srcgraphics, combineMode
graphics : [intptr] 
srcgraphics : [intptr] 
combineMode : [int] 
%inst



%index
GdipSetClipHrgn
(no summary)
%group
Win32 gdiplus
%prm
graphics, hRgn, combineMode
graphics : [intptr] 
hRgn : [intptr] 
combineMode : [int] 
%inst



%index
GdipSetClipPath
(no summary)
%group
Win32 gdiplus
%prm
graphics, path, combineMode
graphics : [intptr] 
path : [intptr] 
combineMode : [int] 
%inst



%index
GdipSetClipRect
(no summary)
%group
Win32 gdiplus
%prm
graphics, x, y, width, height, combineMode
graphics : [intptr] 
x : [float] 
y : [float] 
width : [float] 
height : [float] 
combineMode : [int] 
%inst



%index
GdipSetClipRectI
(no summary)
%group
Win32 gdiplus
%prm
graphics, x, y, width, height, combineMode
graphics : [intptr] 
x : [int] 
y : [int] 
width : [int] 
height : [int] 
combineMode : [int] 
%inst



%index
GdipSetClipRegion
(no summary)
%group
Win32 gdiplus
%prm
graphics, region, combineMode
graphics : [intptr] 
region : [intptr] 
combineMode : [int] 
%inst



%index
GdipSetCompositingMode
(no summary)
%group
Win32 gdiplus
%prm
graphics, compositingMode
graphics : [intptr] 
compositingMode : [int] 
%inst



%index
GdipSetCompositingQuality
(no summary)
%group
Win32 gdiplus
%prm
graphics, compositingQuality
graphics : [intptr] 
compositingQuality : [int] 
%inst



%index
GdipSetCustomLineCapBaseCap
(no summary)
%group
Win32 gdiplus
%prm
customCap, baseCap
customCap : [intptr] 
baseCap : [int] 
%inst



%index
GdipSetCustomLineCapBaseInset
(no summary)
%group
Win32 gdiplus
%prm
customCap, inset
customCap : [intptr] 
inset : [float] 
%inst



%index
GdipSetCustomLineCapStrokeCaps
(no summary)
%group
Win32 gdiplus
%prm
customCap, startCap, endCap
customCap : [intptr] 
startCap : [int] 
endCap : [int] 
%inst



%index
GdipSetCustomLineCapStrokeJoin
(no summary)
%group
Win32 gdiplus
%prm
customCap, lineJoin
customCap : [intptr] 
lineJoin : [int] 
%inst



%index
GdipSetCustomLineCapWidthScale
(no summary)
%group
Win32 gdiplus
%prm
customCap, widthScale
customCap : [intptr] 
widthScale : [float] 
%inst



%index
GdipSetEffectParameters
(no summary)
%group
Win32 gdiplus
%prm
effect, params, size
effect : [intptr] 
params : [int] 
size : [int] 
%inst



%index
GdipSetEmpty
(no summary)
%group
Win32 gdiplus
%prm
region
region : [intptr] 
%inst



%index
GdipSetImageAttributesCachedBackground
(no summary)
%group
Win32 gdiplus
%prm
imageattr, enableFlag
imageattr : [intptr] 
enableFlag : [int] 
%inst



%index
GdipSetImageAttributesColorKeys
(no summary)
%group
Win32 gdiplus
%prm
imageattr, type, enableFlag, colorLow, colorHigh
imageattr : [intptr] 
type : [int] 
enableFlag : [int] 
colorLow : [int] 
colorHigh : [int] 
%inst



%index
GdipSetImageAttributesColorMatrix
(no summary)
%group
Win32 gdiplus
%prm
imageattr, type, enableFlag, colorMatrix, grayMatrix, flags
imageattr : [intptr] 
type : [int] 
enableFlag : [int] 
colorMatrix : [var] 
grayMatrix : [var] 
flags : [int] 
%inst



%index
GdipSetImageAttributesGamma
(no summary)
%group
Win32 gdiplus
%prm
imageattr, type, enableFlag, gamma
imageattr : [intptr] 
type : [int] 
enableFlag : [int] 
gamma : [float] 
%inst



%index
GdipSetImageAttributesNoOp
(no summary)
%group
Win32 gdiplus
%prm
imageattr, type, enableFlag
imageattr : [intptr] 
type : [int] 
enableFlag : [int] 
%inst



%index
GdipSetImageAttributesOutputChannel
(no summary)
%group
Win32 gdiplus
%prm
imageattr, type, enableFlag, channelFlags
imageattr : [intptr] 
type : [int] 
enableFlag : [int] 
channelFlags : [int] 
%inst



%index
GdipSetImageAttributesOutputChannelColorProfile
(no summary)
%group
Win32 gdiplus
%prm
imageattr, type, enableFlag, colorProfileFilename
imageattr : [intptr] 
type : [int] 
enableFlag : [int] 
colorProfileFilename : [wstr] 
%inst



%index
GdipSetImageAttributesRemapTable
(no summary)
%group
Win32 gdiplus
%prm
imageattr, type, enableFlag, mapSize, map
imageattr : [intptr] 
type : [int] 
enableFlag : [int] 
mapSize : [int] 
map : [var] 
%inst



%index
GdipSetImageAttributesThreshold
(no summary)
%group
Win32 gdiplus
%prm
imageattr, type, enableFlag, threshold
imageattr : [intptr] 
type : [int] 
enableFlag : [int] 
threshold : [float] 
%inst



%index
GdipSetImageAttributesToIdentity
(no summary)
%group
Win32 gdiplus
%prm
imageattr, type
imageattr : [intptr] 
type : [int] 
%inst



%index
GdipSetImageAttributesWrapMode
(no summary)
%group
Win32 gdiplus
%prm
imageAttr, wrap, argb, clamp
imageAttr : [intptr] 
wrap : [int] 
argb : [int] 
clamp : [int] 
%inst



%index
GdipSetImagePalette
(no summary)
%group
Win32 gdiplus
%prm
image, palette
image : [intptr] 
palette : [var] 
%inst



%index
GdipSetInfinite
(no summary)
%group
Win32 gdiplus
%prm
region
region : [intptr] 
%inst



%index
GdipSetInterpolationMode
(no summary)
%group
Win32 gdiplus
%prm
graphics, interpolationMode
graphics : [intptr] 
interpolationMode : [int] 
%inst



%index
GdipSetLineBlend
(no summary)
%group
Win32 gdiplus
%prm
brush, blend, positions, count
brush : [intptr] 
blend : [var] 
positions : [var] 
count : [int] 
%inst



%index
GdipSetLineColors
(no summary)
%group
Win32 gdiplus
%prm
brush, color1, color2
brush : [intptr] 
color1 : [int] 
color2 : [int] 
%inst



%index
GdipSetLineGammaCorrection
(no summary)
%group
Win32 gdiplus
%prm
brush, useGammaCorrection
brush : [intptr] 
useGammaCorrection : [int] 
%inst



%index
GdipSetLineLinearBlend
(no summary)
%group
Win32 gdiplus
%prm
brush, focus, scale
brush : [intptr] 
focus : [float] 
scale : [float] 
%inst



%index
GdipSetLinePresetBlend
(no summary)
%group
Win32 gdiplus
%prm
brush, blend, positions, count
brush : [intptr] 
blend : [var] 
positions : [var] 
count : [int] 
%inst



%index
GdipSetLineSigmaBlend
(no summary)
%group
Win32 gdiplus
%prm
brush, focus, scale
brush : [intptr] 
focus : [float] 
scale : [float] 
%inst



%index
GdipSetLineTransform
(no summary)
%group
Win32 gdiplus
%prm
brush, matrix
brush : [intptr] 
matrix : [intptr] 
%inst



%index
GdipSetLineWrapMode
(no summary)
%group
Win32 gdiplus
%prm
brush, wrapmode
brush : [intptr] 
wrapmode : [int] 
%inst



%index
GdipSetMatrixElements
(no summary)
%group
Win32 gdiplus
%prm
matrix, m11, m12, m21, m22, dx, dy
matrix : [intptr] 
m11 : [float] 
m12 : [float] 
m21 : [float] 
m22 : [float] 
dx : [float] 
dy : [float] 
%inst



%index
GdipSetMetafileDownLevelRasterizationLimit
(no summary)
%group
Win32 gdiplus
%prm
metafile, metafileRasterizationLimitDpi
metafile : [intptr] 
metafileRasterizationLimitDpi : [int] 
%inst



%index
GdipSetPageScale
(no summary)
%group
Win32 gdiplus
%prm
graphics, scale
graphics : [intptr] 
scale : [float] 
%inst



%index
GdipSetPageUnit
(no summary)
%group
Win32 gdiplus
%prm
graphics, unit
graphics : [intptr] 
unit : [int] 
%inst



%index
GdipSetPathFillMode
(no summary)
%group
Win32 gdiplus
%prm
path, fillmode
path : [intptr] 
fillmode : [int] 
%inst



%index
GdipSetPathGradientBlend
(no summary)
%group
Win32 gdiplus
%prm
brush, blend, positions, count
brush : [intptr] 
blend : [var] 
positions : [var] 
count : [int] 
%inst



%index
GdipSetPathGradientCenterColor
(no summary)
%group
Win32 gdiplus
%prm
brush, colors
brush : [intptr] 
colors : [int] 
%inst



%index
GdipSetPathGradientCenterPoint
(no summary)
%group
Win32 gdiplus
%prm
brush, points
brush : [intptr] 
points : [var] 
%inst



%index
GdipSetPathGradientCenterPointI
(no summary)
%group
Win32 gdiplus
%prm
brush, points
brush : [intptr] 
points : [var] 
%inst



%index
GdipSetPathGradientFocusScales
(no summary)
%group
Win32 gdiplus
%prm
brush, xScale, yScale
brush : [intptr] 
xScale : [float] 
yScale : [float] 
%inst



%index
GdipSetPathGradientGammaCorrection
(no summary)
%group
Win32 gdiplus
%prm
brush, useGammaCorrection
brush : [intptr] 
useGammaCorrection : [int] 
%inst



%index
GdipSetPathGradientLinearBlend
(no summary)
%group
Win32 gdiplus
%prm
brush, focus, scale
brush : [intptr] 
focus : [float] 
scale : [float] 
%inst



%index
GdipSetPathGradientPath
(no summary)
%group
Win32 gdiplus
%prm
brush, path
brush : [intptr] 
path : [intptr] 
%inst



%index
GdipSetPathGradientPresetBlend
(no summary)
%group
Win32 gdiplus
%prm
brush, blend, positions, count
brush : [intptr] 
blend : [var] 
positions : [var] 
count : [int] 
%inst



%index
GdipSetPathGradientSigmaBlend
(no summary)
%group
Win32 gdiplus
%prm
brush, focus, scale
brush : [intptr] 
focus : [float] 
scale : [float] 
%inst



%index
GdipSetPathGradientSurroundColorsWithCount
(no summary)
%group
Win32 gdiplus
%prm
brush, color, count
brush : [intptr] 
color : [var] 
count : [var] 
%inst



%index
GdipSetPathGradientTransform
(no summary)
%group
Win32 gdiplus
%prm
brush, matrix
brush : [intptr] 
matrix : [intptr] 
%inst



%index
GdipSetPathGradientWrapMode
(no summary)
%group
Win32 gdiplus
%prm
brush, wrapmode
brush : [intptr] 
wrapmode : [int] 
%inst



%index
GdipSetPathMarker
(no summary)
%group
Win32 gdiplus
%prm
path
path : [intptr] 
%inst



%index
GdipSetPenBrushFill
(no summary)
%group
Win32 gdiplus
%prm
pen, brush
pen : [intptr] 
brush : [intptr] 
%inst



%index
GdipSetPenColor
(no summary)
%group
Win32 gdiplus
%prm
pen, argb
pen : [intptr] 
argb : [int] 
%inst



%index
GdipSetPenCompoundArray
(no summary)
%group
Win32 gdiplus
%prm
pen, dash, count
pen : [intptr] 
dash : [var] 
count : [int] 
%inst



%index
GdipSetPenCustomEndCap
(no summary)
%group
Win32 gdiplus
%prm
pen, customCap
pen : [intptr] 
customCap : [intptr] 
%inst



%index
GdipSetPenCustomStartCap
(no summary)
%group
Win32 gdiplus
%prm
pen, customCap
pen : [intptr] 
customCap : [intptr] 
%inst



%index
GdipSetPenDashArray
(no summary)
%group
Win32 gdiplus
%prm
pen, dash, count
pen : [intptr] 
dash : [var] 
count : [int] 
%inst



%index
GdipSetPenDashCap197819
(no summary)
%group
Win32 gdiplus
%prm
pen, dashCap
pen : [intptr] 
dashCap : [int] 
%inst



%index
GdipSetPenDashOffset
(no summary)
%group
Win32 gdiplus
%prm
pen, offset
pen : [intptr] 
offset : [float] 
%inst



%index
GdipSetPenDashStyle
(no summary)
%group
Win32 gdiplus
%prm
pen, dashstyle
pen : [intptr] 
dashstyle : [int] 
%inst



%index
GdipSetPenEndCap
(no summary)
%group
Win32 gdiplus
%prm
pen, endCap
pen : [intptr] 
endCap : [int] 
%inst



%index
GdipSetPenLineCap197819
(no summary)
%group
Win32 gdiplus
%prm
pen, startCap, endCap, dashCap
pen : [intptr] 
startCap : [int] 
endCap : [int] 
dashCap : [int] 
%inst



%index
GdipSetPenLineJoin
(no summary)
%group
Win32 gdiplus
%prm
pen, lineJoin
pen : [intptr] 
lineJoin : [int] 
%inst



%index
GdipSetPenMiterLimit
(no summary)
%group
Win32 gdiplus
%prm
pen, miterLimit
pen : [intptr] 
miterLimit : [float] 
%inst



%index
GdipSetPenMode
(no summary)
%group
Win32 gdiplus
%prm
pen, penMode
pen : [intptr] 
penMode : [int] 
%inst



%index
GdipSetPenStartCap
(no summary)
%group
Win32 gdiplus
%prm
pen, startCap
pen : [intptr] 
startCap : [int] 
%inst



%index
GdipSetPenTransform
(no summary)
%group
Win32 gdiplus
%prm
pen, matrix
pen : [intptr] 
matrix : [intptr] 
%inst



%index
GdipSetPenUnit
(no summary)
%group
Win32 gdiplus
%prm
pen, unit
pen : [intptr] 
unit : [int] 
%inst



%index
GdipSetPenWidth
(no summary)
%group
Win32 gdiplus
%prm
pen, width
pen : [intptr] 
width : [float] 
%inst



%index
GdipSetPixelOffsetMode
(no summary)
%group
Win32 gdiplus
%prm
graphics, pixelOffsetMode
graphics : [intptr] 
pixelOffsetMode : [int] 
%inst



%index
GdipSetPropertyItem
(no summary)
%group
Win32 gdiplus
%prm
image, item
image : [intptr] 
item : [var] 
%inst



%index
GdipSetRenderingOrigin
(no summary)
%group
Win32 gdiplus
%prm
graphics, x, y
graphics : [intptr] 
x : [int] 
y : [int] 
%inst



%index
GdipSetSmoothingMode
(no summary)
%group
Win32 gdiplus
%prm
graphics, smoothingMode
graphics : [intptr] 
smoothingMode : [int] 
%inst



%index
GdipSetSolidFillColor
(no summary)
%group
Win32 gdiplus
%prm
brush, color
brush : [intptr] 
color : [int] 
%inst



%index
GdipSetStringFormatAlign
(no summary)
%group
Win32 gdiplus
%prm
format, align
format : [intptr] 
align : [int] 
%inst



%index
GdipSetStringFormatDigitSubstitution
(no summary)
%group
Win32 gdiplus
%prm
format, language, substitute
format : [intptr] 
language : [int] 
substitute : [int] 
%inst



%index
GdipSetStringFormatFlags
(no summary)
%group
Win32 gdiplus
%prm
format, flags
format : [intptr] 
flags : [int] 
%inst



%index
GdipSetStringFormatHotkeyPrefix
(no summary)
%group
Win32 gdiplus
%prm
format, hotkeyPrefix
format : [intptr] 
hotkeyPrefix : [int] 
%inst



%index
GdipSetStringFormatLineAlign
(no summary)
%group
Win32 gdiplus
%prm
format, align
format : [intptr] 
align : [int] 
%inst



%index
GdipSetStringFormatMeasurableCharacterRanges
(no summary)
%group
Win32 gdiplus
%prm
format, rangeCount, ranges
format : [intptr] 
rangeCount : [int] 
ranges : [var] 
%inst



%index
GdipSetStringFormatTabStops
(no summary)
%group
Win32 gdiplus
%prm
format, firstTabOffset, count, tabStops
format : [intptr] 
firstTabOffset : [float] 
count : [int] 
tabStops : [var] 
%inst



%index
GdipSetStringFormatTrimming
(no summary)
%group
Win32 gdiplus
%prm
format, trimming
format : [intptr] 
trimming : [int] 
%inst



%index
GdipSetTextContrast
(no summary)
%group
Win32 gdiplus
%prm
graphics, contrast
graphics : [intptr] 
contrast : [int] 
%inst



%index
GdipSetTextRenderingHint
(no summary)
%group
Win32 gdiplus
%prm
graphics, mode
graphics : [intptr] 
mode : [int] 
%inst



%index
GdipSetTextureTransform
(no summary)
%group
Win32 gdiplus
%prm
brush, matrix
brush : [intptr] 
matrix : [intptr] 
%inst



%index
GdipSetTextureWrapMode
(no summary)
%group
Win32 gdiplus
%prm
brush, wrapmode
brush : [intptr] 
wrapmode : [int] 
%inst



%index
GdipSetWorldTransform
(no summary)
%group
Win32 gdiplus
%prm
graphics, matrix
graphics : [intptr] 
matrix : [intptr] 
%inst



%index
GdipShearMatrix
(no summary)
%group
Win32 gdiplus
%prm
matrix, shearX, shearY, order
matrix : [intptr] 
shearX : [float] 
shearY : [float] 
order : [int] 
%inst



%index
GdipStartPathFigure
(no summary)
%group
Win32 gdiplus
%prm
path
path : [intptr] 
%inst



%index
GdipStringFormatGetGenericDefault
(no summary)
%group
Win32 gdiplus
%prm
format
format : [var] 
%inst



%index
GdipStringFormatGetGenericTypographic
(no summary)
%group
Win32 gdiplus
%prm
format
format : [var] 
%inst



%index
GdipTestControl
(no summary)
%group
Win32 gdiplus
%prm
control, param1
control : [int] 
param1 : [intptr] 
%inst



%index
GdipTransformMatrixPoints
(no summary)
%group
Win32 gdiplus
%prm
matrix, pts, count
matrix : [intptr] 
pts : [var] 
count : [int] 
%inst



%index
GdipTransformMatrixPointsI
(no summary)
%group
Win32 gdiplus
%prm
matrix, pts, count
matrix : [intptr] 
pts : [var] 
count : [int] 
%inst



%index
GdipTransformPath
(no summary)
%group
Win32 gdiplus
%prm
path, matrix
path : [intptr] 
matrix : [intptr] 
%inst



%index
GdipTransformPoints
(no summary)
%group
Win32 gdiplus
%prm
graphics, destSpace, srcSpace, points, count
graphics : [intptr] 
destSpace : [int] 
srcSpace : [int] 
points : [var] 
count : [int] 
%inst



%index
GdipTransformPointsI
(no summary)
%group
Win32 gdiplus
%prm
graphics, destSpace, srcSpace, points, count
graphics : [intptr] 
destSpace : [int] 
srcSpace : [int] 
points : [var] 
count : [int] 
%inst



%index
GdipTransformRegion
(no summary)
%group
Win32 gdiplus
%prm
region, matrix
region : [intptr] 
matrix : [intptr] 
%inst



%index
GdipTranslateClip
(no summary)
%group
Win32 gdiplus
%prm
graphics, dx, dy
graphics : [intptr] 
dx : [float] 
dy : [float] 
%inst



%index
GdipTranslateClipI
(no summary)
%group
Win32 gdiplus
%prm
graphics, dx, dy
graphics : [intptr] 
dx : [int] 
dy : [int] 
%inst



%index
GdipTranslateLineTransform
(no summary)
%group
Win32 gdiplus
%prm
brush, dx, dy, order
brush : [intptr] 
dx : [float] 
dy : [float] 
order : [int] 
%inst



%index
GdipTranslateMatrix
(no summary)
%group
Win32 gdiplus
%prm
matrix, offsetX, offsetY, order
matrix : [intptr] 
offsetX : [float] 
offsetY : [float] 
order : [int] 
%inst



%index
GdipTranslatePathGradientTransform
(no summary)
%group
Win32 gdiplus
%prm
brush, dx, dy, order
brush : [intptr] 
dx : [float] 
dy : [float] 
order : [int] 
%inst



%index
GdipTranslatePenTransform
(no summary)
%group
Win32 gdiplus
%prm
pen, dx, dy, order
pen : [intptr] 
dx : [float] 
dy : [float] 
order : [int] 
%inst



%index
GdipTranslateRegion
(no summary)
%group
Win32 gdiplus
%prm
region, dx, dy
region : [intptr] 
dx : [float] 
dy : [float] 
%inst



%index
GdipTranslateRegionI
(no summary)
%group
Win32 gdiplus
%prm
region, dx, dy
region : [intptr] 
dx : [int] 
dy : [int] 
%inst



%index
GdipTranslateTextureTransform
(no summary)
%group
Win32 gdiplus
%prm
brush, dx, dy, order
brush : [intptr] 
dx : [float] 
dy : [float] 
order : [int] 
%inst



%index
GdipTranslateWorldTransform
(no summary)
%group
Win32 gdiplus
%prm
graphics, dx, dy, order
graphics : [intptr] 
dx : [float] 
dy : [float] 
order : [int] 
%inst



%index
GdipVectorTransformMatrixPoints
(no summary)
%group
Win32 gdiplus
%prm
matrix, pts, count
matrix : [intptr] 
pts : [var] 
count : [int] 
%inst



%index
GdipVectorTransformMatrixPointsI
(no summary)
%group
Win32 gdiplus
%prm
matrix, pts, count
matrix : [intptr] 
pts : [var] 
count : [int] 
%inst



%index
GdipWarpPath
(no summary)
%group
Win32 gdiplus
%prm
path, matrix, points, count, srcx, srcy, srcwidth, srcheight, warpMode, flatness
path : [intptr] 
matrix : [intptr] 
points : [var] 
count : [int] 
srcx : [float] 
srcy : [float] 
srcwidth : [float] 
srcheight : [float] 
warpMode : [int] 
flatness : [float] 
%inst



%index
GdipWidenPath
(no summary)
%group
Win32 gdiplus
%prm
nativePath, pen, matrix, flatness
nativePath : [intptr] 
pen : [intptr] 
matrix : [intptr] 
flatness : [float] 
%inst



%index
GdipWindingModeOutline
(no summary)
%group
Win32 gdiplus
%prm
path, matrix, flatness
path : [intptr] 
matrix : [intptr] 
flatness : [float] 
%inst



%index
GdiplusNotificationHook
(no summary)
%group
Win32 gdiplus
%prm
token
token : [var] 
%inst



%index
GdiplusNotificationUnhook
(no summary)
%group
Win32 gdiplus
%prm
token
token : [int] 
%inst



%index
GdiplusShutdown
(no summary)
%group
Win32 gdiplus
%prm
token
token : [int] 
%inst



%index
GdiplusStartup
(no summary)
%group
Win32 gdiplus
%prm
token, input, output
token : [var] 
input : [var] 
output : [var] 
%inst


