; ============================================================
;   gdiplus.dll ヘルプ (CsWin32 / win32metadata から自動抽出)
;   docs_ja.json に日本語訳があればそちらを使用、無ければ英語原文。
;   翻訳を追加するときは docs_ja.json を編集して再生成。
; ============================================================

%type
拡張命令
%ver
1.0
%dll
gdiplus.dll
%date
2026/04/16
%author
IronHSP / CsWin32 bridge
%url
https://github.com/inovia/IronHSP
%port
Win

%note
Win32 API の gdiplus.dll 関数群。CsWin32 + win32metadata から自動生成。
hsp3net 専用 (intptr / NSTRUCT / wstr を使用)。

%group
Win32API

%index
GdipAddPathArc
(no summary)
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
%prm
path, points, count
path : [intptr] 
points : [var] 
count : [int] 
%inst



%index
GdipAddPathBeziersI
(no summary)
%prm
path, points, count
path : [intptr] 
points : [var] 
count : [int] 
%inst



%index
GdipAddPathClosedCurve
(no summary)
%prm
path, points, count
path : [intptr] 
points : [var] 
count : [int] 
%inst



%index
GdipAddPathClosedCurve2
(no summary)
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
%prm
path, points, count
path : [intptr] 
points : [var] 
count : [int] 
%inst



%index
GdipAddPathCurve
(no summary)
%prm
path, points, count
path : [intptr] 
points : [var] 
count : [int] 
%inst



%index
GdipAddPathCurve2
(no summary)
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
%prm
path, points, count
path : [intptr] 
points : [var] 
count : [int] 
%inst



%index
GdipAddPathEllipse
(no summary)
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
%prm
path, points, count
path : [intptr] 
points : [var] 
count : [int] 
%inst



%index
GdipAddPathLine2I
(no summary)
%prm
path, points, count
path : [intptr] 
points : [var] 
count : [int] 
%inst



%index
GdipAddPathLineI
(no summary)
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
%prm
path, addingPath, connect
path : [intptr] 
addingPath : [intptr] 
connect : [int] 
%inst



%index
GdipAddPathPie
(no summary)
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
%prm
path, points, count
path : [intptr] 
points : [var] 
count : [int] 
%inst



%index
GdipAddPathPolygonI
(no summary)
%prm
path, points, count
path : [intptr] 
points : [var] 
count : [int] 
%inst



%index
GdipAddPathRectangle
(no summary)
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
%prm
path, rects, count
path : [intptr] 
rects : [var] 
count : [int] 
%inst



%index
GdipAddPathRectanglesI
(no summary)
%prm
path, rects, count
path : [intptr] 
rects : [var] 
count : [int] 
%inst



%index
GdipAddPathString
(no summary)
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
%prm
size
size : [int] 
%inst



%index
GdipBeginContainer
(no summary)
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
%prm
graphics, state
graphics : [intptr] 
state : [var] 
%inst



%index
GdipBeginContainerI
(no summary)
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
%prm
format, NumberOfEntries
format : [int] 
NumberOfEntries : [var] 
%inst



%index
GdipBitmapGetPixel
(no summary)
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
%prm
bitmap, xdpi, ydpi
bitmap : [intptr] 
xdpi : [float] 
ydpi : [float] 
%inst



%index
GdipBitmapUnlockBits
(no summary)
%prm
bitmap, lockedBitmapData
bitmap : [intptr] 
lockedBitmapData : [var] 
%inst



%index
GdipClearPathMarkers
(no summary)
%prm
path
path : [intptr] 
%inst



%index
GdipCloneBitmapArea
(no summary)
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
%prm
brush, cloneBrush
brush : [intptr] 
cloneBrush : [var] 
%inst



%index
GdipCloneCustomLineCap
(no summary)
%prm
customCap, clonedCap
customCap : [intptr] 
clonedCap : [var] 
%inst



%index
GdipCloneFont
(no summary)
%prm
font, cloneFont
font : [intptr] 
cloneFont : [var] 
%inst



%index
GdipCloneFontFamily
(no summary)
%prm
fontFamily, clonedFontFamily
fontFamily : [intptr] 
clonedFontFamily : [var] 
%inst



%index
GdipCloneImage
(no summary)
%prm
image, cloneImage
image : [intptr] 
cloneImage : [var] 
%inst



%index
GdipCloneImageAttributes
(no summary)
%prm
imageattr, cloneImageattr
imageattr : [intptr] 
cloneImageattr : [var] 
%inst



%index
GdipCloneMatrix
(no summary)
%prm
matrix, cloneMatrix
matrix : [intptr] 
cloneMatrix : [var] 
%inst



%index
GdipClonePath
(no summary)
%prm
path, clonePath
path : [intptr] 
clonePath : [var] 
%inst



%index
GdipClonePen
(no summary)
%prm
pen, clonepen
pen : [intptr] 
clonepen : [var] 
%inst



%index
GdipCloneRegion
(no summary)
%prm
region, cloneRegion
region : [intptr] 
cloneRegion : [var] 
%inst



%index
GdipCloneStringFormat
(no summary)
%prm
format, newFormat
format : [intptr] 
newFormat : [var] 
%inst



%index
GdipClosePathFigure
(no summary)
%prm
path
path : [intptr] 
%inst



%index
GdipClosePathFigures
(no summary)
%prm
path
path : [intptr] 
%inst



%index
GdipCombineRegionPath
(no summary)
%prm
region, path, combineMode
region : [intptr] 
path : [intptr] 
combineMode : [int] 
%inst



%index
GdipCombineRegionRect
(no summary)
%prm
region, rect, combineMode
region : [intptr] 
rect : [var] 
combineMode : [int] 
%inst



%index
GdipCombineRegionRectI
(no summary)
%prm
region, rect, combineMode
region : [intptr] 
rect : [var] 
combineMode : [int] 
%inst



%index
GdipCombineRegionRegion
(no summary)
%prm
region, region2, combineMode
region : [intptr] 
region2 : [intptr] 
combineMode : [int] 
%inst



%index
GdipComment
(no summary)
%prm
graphics, sizeData, data
graphics : [intptr] 
sizeData : [int] 
data : [var] 
%inst



%index
GdipConvertToEmfPlus
(no summary)
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
%prm
surface, bitmap
surface : [var] 
bitmap : [var] 
%inst



%index
GdipCreateBitmapFromFile
(no summary)
%prm
filename, bitmap
filename : [wstr] 
bitmap : [var] 
%inst



%index
GdipCreateBitmapFromFileICM
(no summary)
%prm
filename, bitmap
filename : [wstr] 
bitmap : [var] 
%inst



%index
GdipCreateBitmapFromGdiDib
(no summary)
%prm
gdiBitmapInfo, gdiBitmapData, bitmap
gdiBitmapInfo : [var] 
gdiBitmapData : [intptr] 
bitmap : [var] 
%inst



%index
GdipCreateBitmapFromGraphics
(no summary)
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
%prm
hbm, hpal, bitmap
hbm : [intptr] 
hpal : [intptr] 
bitmap : [var] 
%inst



%index
GdipCreateBitmapFromHICON
(no summary)
%prm
hicon, bitmap
hicon : [intptr] 
bitmap : [var] 
%inst



%index
GdipCreateBitmapFromResource
(no summary)
%prm
hInstance, lpBitmapName, bitmap
hInstance : [intptr] 
lpBitmapName : [wstr] 
bitmap : [var] 
%inst



%index
GdipCreateBitmapFromScan0
(no summary)
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
%prm
stream, bitmap
stream : [var] 
bitmap : [var] 
%inst



%index
GdipCreateBitmapFromStreamICM
(no summary)
%prm
stream, bitmap
stream : [var] 
bitmap : [var] 
%inst



%index
GdipCreateCachedBitmap
(no summary)
%prm
bitmap, graphics, cachedBitmap
bitmap : [intptr] 
graphics : [intptr] 
cachedBitmap : [var] 
%inst



%index
GdipCreateCustomLineCap
(no summary)
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
%prm
guid, effect
guid : [int] 
effect : [var] 
%inst



%index
GdipCreateFont
(no summary)
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
%prm
name, fontCollection, fontFamily
name : [wstr] 
fontCollection : [intptr] 
fontFamily : [var] 
%inst



%index
GdipCreateFontFromDC
(no summary)
%prm
hdc, font
hdc : [intptr] 
font : [var] 
%inst



%index
GdipCreateFontFromLogfontW
(no summary)
%prm
hdc, logfont, font
hdc : [intptr] 
logfont : [var] 
font : [var] 
%inst



%index
GdipCreateFromHDC
(no summary)
%prm
hdc, graphics
hdc : [intptr] 
graphics : [var] 
%inst



%index
GdipCreateFromHDC2
(no summary)
%prm
hdc, hDevice, graphics
hdc : [intptr] 
hDevice : [intptr] 
graphics : [var] 
%inst



%index
GdipCreateFromHWND
(no summary)
%prm
hwnd, graphics
hwnd : [intptr] 
graphics : [var] 
%inst



%index
GdipCreateFromHWNDICM
(no summary)
%prm
hwnd, graphics
hwnd : [intptr] 
graphics : [var] 
%inst



%index
GdipCreateHBITMAPFromBitmap
(no summary)
%prm
bitmap, hbmReturn, background
bitmap : [intptr] 
hbmReturn : [intptr] 
background : [int] 
%inst



%index
GdipCreateHICONFromBitmap
(no summary)
%prm
bitmap, hbmReturn
bitmap : [intptr] 
hbmReturn : [intptr] 
%inst



%index
GdipCreateHalftonePalette
(no summary)
%prm

%inst



%index
GdipCreateHatchBrush
(no summary)
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
%prm
imageattr
imageattr : [var] 
%inst



%index
GdipCreateLineBrush
(no summary)
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
%prm
matrix
matrix : [var] 
%inst



%index
GdipCreateMatrix2
(no summary)
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
%prm
rect, dstplg, matrix
rect : [var] 
dstplg : [var] 
matrix : [var] 
%inst



%index
GdipCreateMatrix3I
(no summary)
%prm
rect, dstplg, matrix
rect : [var] 
dstplg : [var] 
matrix : [var] 
%inst



%index
GdipCreateMetafileFromEmf
(no summary)
%prm
hEmf, deleteEmf, metafile
hEmf : [intptr] 
deleteEmf : [int] 
metafile : [var] 
%inst



%index
GdipCreateMetafileFromFile
(no summary)
%prm
file, metafile
file : [wstr] 
metafile : [var] 
%inst



%index
GdipCreateMetafileFromStream
(no summary)
%prm
stream, metafile
stream : [var] 
metafile : [var] 
%inst



%index
GdipCreateMetafileFromWmf
(no summary)
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
%prm
file, wmfPlaceableFileHeader, metafile
file : [wstr] 
wmfPlaceableFileHeader : [var] 
metafile : [var] 
%inst



%index
GdipCreatePath
(no summary)
%prm
brushMode, path
brushMode : [int] 
path : [var] 
%inst



%index
GdipCreatePath2
(no summary)
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
%prm
path, polyGradient
path : [intptr] 
polyGradient : [var] 
%inst



%index
GdipCreatePathGradientI
(no summary)
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
%prm
iterator, path
iterator : [var] 
path : [intptr] 
%inst



%index
GdipCreatePen1
(no summary)
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
%prm
region
region : [var] 
%inst



%index
GdipCreateRegionHrgn
(no summary)
%prm
hRgn, region
hRgn : [intptr] 
region : [var] 
%inst



%index
GdipCreateRegionPath
(no summary)
%prm
path, region
path : [intptr] 
region : [var] 
%inst



%index
GdipCreateRegionRect
(no summary)
%prm
rect, region
rect : [var] 
region : [var] 
%inst



%index
GdipCreateRegionRectI
(no summary)
%prm
rect, region
rect : [var] 
region : [var] 
%inst



%index
GdipCreateRegionRgnData
(no summary)
%prm
regionData, size, region
regionData : [var] 
size : [int] 
region : [var] 
%inst



%index
GdipCreateSolidFill
(no summary)
%prm
color, brush
color : [int] 
brush : [var] 
%inst



%index
GdipCreateStreamOnFile
(no summary)
%prm
filename, access, stream
filename : [wstr] 
access : [int] 
stream : [var] 
%inst



%index
GdipCreateStringFormat
(no summary)
%prm
formatAttributes, language, format
formatAttributes : [int] 
language : [int] 
format : [var] 
%inst



%index
GdipCreateTexture
(no summary)
%prm
image, wrapmode, texture
image : [intptr] 
wrapmode : [int] 
texture : [var] 
%inst



%index
GdipCreateTexture2
(no summary)
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
%prm
brush
brush : [intptr] 
%inst



%index
GdipDeleteCachedBitmap
(no summary)
%prm
cachedBitmap
cachedBitmap : [intptr] 
%inst



%index
GdipDeleteCustomLineCap
(no summary)
%prm
customCap
customCap : [intptr] 
%inst



%index
GdipDeleteEffect
(no summary)
%prm
effect
effect : [intptr] 
%inst



%index
GdipDeleteFont
(no summary)
%prm
font
font : [intptr] 
%inst



%index
GdipDeleteFontFamily
(no summary)
%prm
fontFamily
fontFamily : [intptr] 
%inst



%index
GdipDeleteGraphics
(no summary)
%prm
graphics
graphics : [intptr] 
%inst



%index
GdipDeleteMatrix
(no summary)
%prm
matrix
matrix : [intptr] 
%inst



%index
GdipDeletePath
(no summary)
%prm
path
path : [intptr] 
%inst



%index
GdipDeletePathIter
(no summary)
%prm
iterator
iterator : [intptr] 
%inst



%index
GdipDeletePen
(no summary)
%prm
pen
pen : [intptr] 
%inst



%index
GdipDeletePrivateFontCollection
(no summary)
%prm
fontCollection
fontCollection : [var] 
%inst



%index
GdipDeleteRegion
(no summary)
%prm
region
region : [intptr] 
%inst



%index
GdipDeleteStringFormat
(no summary)
%prm
format
format : [intptr] 
%inst



%index
GdipDisposeImage
(no summary)
%prm
image
image : [intptr] 
%inst



%index
GdipDisposeImageAttributes
(no summary)
%prm
imageattr
imageattr : [intptr] 
%inst



%index
GdipDrawArc
(no summary)
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
%prm
graphics, pen, path
graphics : [intptr] 
pen : [intptr] 
path : [intptr] 
%inst



%index
GdipDrawPie
(no summary)
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
%prm
graphics, state
graphics : [intptr] 
state : [int] 
%inst



%index
GdipEnumerateMetafileDestPoint
(no summary)
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
%prm
graphics, brush, path
graphics : [intptr] 
brush : [intptr] 
path : [intptr] 
%inst



%index
GdipFillPie
(no summary)
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
%prm
graphics, brush, region
graphics : [intptr] 
brush : [intptr] 
region : [intptr] 
%inst



%index
GdipFindFirstImageItem
(no summary)
%prm
image, item
image : [intptr] 
item : [var] 
%inst



%index
GdipFindNextImageItem
(no summary)
%prm
image, item
image : [intptr] 
item : [var] 
%inst



%index
GdipFlattenPath
(no summary)
%prm
path, matrix, flatness
path : [intptr] 
matrix : [intptr] 
flatness : [float] 
%inst



%index
GdipFlush
(no summary)
%prm
graphics, intention
graphics : [intptr] 
intention : [int] 
%inst



%index
GdipFree
(no summary)
%prm
ptr
ptr : [intptr] 
%inst



%index
GdipGetAdjustableArrowCapFillState
(no summary)
%prm
cap, fillState
cap : [intptr] 
fillState : [var] 
%inst



%index
GdipGetAdjustableArrowCapHeight
(no summary)
%prm
cap, height
cap : [intptr] 
height : [var] 
%inst



%index
GdipGetAdjustableArrowCapMiddleInset
(no summary)
%prm
cap, middleInset
cap : [intptr] 
middleInset : [var] 
%inst



%index
GdipGetAdjustableArrowCapWidth
(no summary)
%prm
cap, width
cap : [intptr] 
width : [var] 
%inst



%index
GdipGetAllPropertyItems
(no summary)
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
%prm
brush, type
brush : [intptr] 
type : [var] 
%inst



%index
GdipGetCellAscent
(no summary)
%prm
family, style, CellAscent
family : [intptr] 
style : [int] 
CellAscent : [var] 
%inst



%index
GdipGetCellDescent
(no summary)
%prm
family, style, CellDescent
family : [intptr] 
style : [int] 
CellDescent : [var] 
%inst



%index
GdipGetClip
(no summary)
%prm
graphics, region
graphics : [intptr] 
region : [intptr] 
%inst



%index
GdipGetClipBounds
(no summary)
%prm
graphics, rect
graphics : [intptr] 
rect : [var] 
%inst



%index
GdipGetClipBoundsI
(no summary)
%prm
graphics, rect
graphics : [intptr] 
rect : [var] 
%inst



%index
GdipGetCompositingMode
(no summary)
%prm
graphics, compositingMode
graphics : [intptr] 
compositingMode : [var] 
%inst



%index
GdipGetCompositingQuality
(no summary)
%prm
graphics, compositingQuality
graphics : [intptr] 
compositingQuality : [var] 
%inst



%index
GdipGetCustomLineCapBaseCap
(no summary)
%prm
customCap, baseCap
customCap : [intptr] 
baseCap : [var] 
%inst



%index
GdipGetCustomLineCapBaseInset
(no summary)
%prm
customCap, inset
customCap : [intptr] 
inset : [var] 
%inst



%index
GdipGetCustomLineCapStrokeCaps
(no summary)
%prm
customCap, startCap, endCap
customCap : [intptr] 
startCap : [var] 
endCap : [var] 
%inst



%index
GdipGetCustomLineCapStrokeJoin
(no summary)
%prm
customCap, lineJoin
customCap : [intptr] 
lineJoin : [var] 
%inst



%index
GdipGetCustomLineCapType
(no summary)
%prm
customCap, capType
customCap : [intptr] 
capType : [var] 
%inst



%index
GdipGetCustomLineCapWidthScale
(no summary)
%prm
customCap, widthScale
customCap : [intptr] 
widthScale : [var] 
%inst



%index
GdipGetDC
(no summary)
%prm
graphics, hdc
graphics : [intptr] 
hdc : [intptr] 
%inst



%index
GdipGetDpiX
(no summary)
%prm
graphics, dpi
graphics : [intptr] 
dpi : [var] 
%inst



%index
GdipGetDpiY
(no summary)
%prm
graphics, dpi
graphics : [intptr] 
dpi : [var] 
%inst



%index
GdipGetEffectParameterSize
(no summary)
%prm
effect, size
effect : [intptr] 
size : [var] 
%inst



%index
GdipGetEffectParameters
(no summary)
%prm
effect, size, params
effect : [intptr] 
size : [var] 
params : [int] 
%inst



%index
GdipGetEmHeight
(no summary)
%prm
family, style, EmHeight
family : [intptr] 
style : [int] 
EmHeight : [var] 
%inst



%index
GdipGetEncoderParameterList
(no summary)
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
%prm
image, clsidEncoder, size
image : [intptr] 
clsidEncoder : [var] 
size : [var] 
%inst



%index
GdipGetFamily
(no summary)
%prm
font, family
font : [intptr] 
family : [var] 
%inst



%index
GdipGetFamilyName
(no summary)
%prm
family, name, language
family : [intptr] 
name : [wstr] 
language : [int] 
%inst



%index
GdipGetFontCollectionFamilyCount
(no summary)
%prm
fontCollection, numFound
fontCollection : [intptr] 
numFound : [var] 
%inst



%index
GdipGetFontCollectionFamilyList
(no summary)
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
%prm
font, graphics, height
font : [intptr] 
graphics : [intptr] 
height : [var] 
%inst



%index
GdipGetFontHeightGivenDPI
(no summary)
%prm
font, dpi, height
font : [intptr] 
dpi : [float] 
height : [var] 
%inst



%index
GdipGetFontSize
(no summary)
%prm
font, size
font : [intptr] 
size : [var] 
%inst



%index
GdipGetFontStyle
(no summary)
%prm
font, style
font : [intptr] 
style : [var] 
%inst



%index
GdipGetFontUnit
(no summary)
%prm
font, unit
font : [intptr] 
unit : [var] 
%inst



%index
GdipGetGenericFontFamilyMonospace
(no summary)
%prm
nativeFamily
nativeFamily : [var] 
%inst



%index
GdipGetGenericFontFamilySansSerif
(no summary)
%prm
nativeFamily
nativeFamily : [var] 
%inst



%index
GdipGetGenericFontFamilySerif
(no summary)
%prm
nativeFamily
nativeFamily : [var] 
%inst



%index
GdipGetHatchBackgroundColor
(no summary)
%prm
brush, backcol
brush : [intptr] 
backcol : [var] 
%inst



%index
GdipGetHatchForegroundColor
(no summary)
%prm
brush, forecol
brush : [intptr] 
forecol : [var] 
%inst



%index
GdipGetHatchStyle
(no summary)
%prm
brush, hatchstyle
brush : [intptr] 
hatchstyle : [var] 
%inst



%index
GdipGetHemfFromMetafile
(no summary)
%prm
metafile, hEmf
metafile : [intptr] 
hEmf : [intptr] 
%inst



%index
GdipGetImageAttributesAdjustedPalette
(no summary)
%prm
imageAttr, colorPalette, colorAdjustType
imageAttr : [intptr] 
colorPalette : [var] 
colorAdjustType : [int] 
%inst



%index
GdipGetImageBounds
(no summary)
%prm
image, srcRect, srcUnit
image : [intptr] 
srcRect : [var] 
srcUnit : [var] 
%inst



%index
GdipGetImageDecoders
(no summary)
%prm
numDecoders, size, decoders
numDecoders : [int] 
size : [int] 
decoders : [var] 
%inst



%index
GdipGetImageDecodersSize
(no summary)
%prm
numDecoders, size
numDecoders : [var] 
size : [var] 
%inst



%index
GdipGetImageDimension
(no summary)
%prm
image, width, height
image : [intptr] 
width : [var] 
height : [var] 
%inst



%index
GdipGetImageEncoders
(no summary)
%prm
numEncoders, size, encoders
numEncoders : [int] 
size : [int] 
encoders : [var] 
%inst



%index
GdipGetImageEncodersSize
(no summary)
%prm
numEncoders, size
numEncoders : [var] 
size : [var] 
%inst



%index
GdipGetImageFlags
(no summary)
%prm
image, flags
image : [intptr] 
flags : [var] 
%inst



%index
GdipGetImageGraphicsContext
(no summary)
%prm
image, graphics
image : [intptr] 
graphics : [var] 
%inst



%index
GdipGetImageHeight
(no summary)
%prm
image, height
image : [intptr] 
height : [var] 
%inst



%index
GdipGetImageHorizontalResolution
(no summary)
%prm
image, resolution
image : [intptr] 
resolution : [var] 
%inst



%index
GdipGetImageItemData
(no summary)
%prm
image, item
image : [intptr] 
item : [var] 
%inst



%index
GdipGetImagePalette
(no summary)
%prm
image, palette, size
image : [intptr] 
palette : [var] 
size : [int] 
%inst



%index
GdipGetImagePaletteSize
(no summary)
%prm
image, size
image : [intptr] 
size : [var] 
%inst



%index
GdipGetImagePixelFormat
(no summary)
%prm
image, format
image : [intptr] 
format : [var] 
%inst



%index
GdipGetImageRawFormat
(no summary)
%prm
image, format
image : [intptr] 
format : [var] 
%inst



%index
GdipGetImageThumbnail
(no summary)
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
%prm
image, type
image : [intptr] 
type : [var] 
%inst



%index
GdipGetImageVerticalResolution
(no summary)
%prm
image, resolution
image : [intptr] 
resolution : [var] 
%inst



%index
GdipGetImageWidth
(no summary)
%prm
image, width
image : [intptr] 
width : [var] 
%inst



%index
GdipGetInterpolationMode
(no summary)
%prm
graphics, interpolationMode
graphics : [intptr] 
interpolationMode : [var] 
%inst



%index
GdipGetLineBlend
(no summary)
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
%prm
brush, count
brush : [intptr] 
count : [var] 
%inst



%index
GdipGetLineColors
(no summary)
%prm
brush, colors
brush : [intptr] 
colors : [var] 
%inst



%index
GdipGetLineGammaCorrection
(no summary)
%prm
brush, useGammaCorrection
brush : [intptr] 
useGammaCorrection : [var] 
%inst



%index
GdipGetLinePresetBlend
(no summary)
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
%prm
brush, count
brush : [intptr] 
count : [var] 
%inst



%index
GdipGetLineRect
(no summary)
%prm
brush, rect
brush : [intptr] 
rect : [var] 
%inst



%index
GdipGetLineRectI
(no summary)
%prm
brush, rect
brush : [intptr] 
rect : [var] 
%inst



%index
GdipGetLineSpacing
(no summary)
%prm
family, style, LineSpacing
family : [intptr] 
style : [int] 
LineSpacing : [var] 
%inst



%index
GdipGetLineTransform
(no summary)
%prm
brush, matrix
brush : [intptr] 
matrix : [intptr] 
%inst



%index
GdipGetLineWrapMode
(no summary)
%prm
brush, wrapmode
brush : [intptr] 
wrapmode : [var] 
%inst



%index
GdipGetLogFontW
(no summary)
%prm
font, graphics, logfontW
font : [intptr] 
graphics : [intptr] 
logfontW : [var] 
%inst



%index
GdipGetMatrixElements
(no summary)
%prm
matrix, matrixOut
matrix : [intptr] 
matrixOut : [var] 
%inst



%index
GdipGetMetafileDownLevelRasterizationLimit
(no summary)
%prm
metafile, metafileRasterizationLimitDpi
metafile : [intptr] 
metafileRasterizationLimitDpi : [var] 
%inst



%index
GdipGetMetafileHeaderFromEmf
(no summary)
%prm
hEmf, header
hEmf : [intptr] 
header : [var] 
%inst



%index
GdipGetMetafileHeaderFromFile
(no summary)
%prm
filename, header
filename : [wstr] 
header : [var] 
%inst



%index
GdipGetMetafileHeaderFromMetafile
(no summary)
%prm
metafile, header
metafile : [intptr] 
header : [var] 
%inst



%index
GdipGetMetafileHeaderFromStream
(no summary)
%prm
stream, header
stream : [var] 
header : [var] 
%inst



%index
GdipGetMetafileHeaderFromWmf
(no summary)
%prm
hWmf, wmfPlaceableFileHeader, header
hWmf : [intptr] 
wmfPlaceableFileHeader : [var] 
header : [var] 
%inst



%index
GdipGetNearestColor
(no summary)
%prm
graphics, argb
graphics : [intptr] 
argb : [var] 
%inst



%index
GdipGetPageScale
(no summary)
%prm
graphics, scale
graphics : [intptr] 
scale : [var] 
%inst



%index
GdipGetPageUnit
(no summary)
%prm
graphics, unit
graphics : [intptr] 
unit : [var] 
%inst



%index
GdipGetPathData
(no summary)
%prm
path, pathData
path : [intptr] 
pathData : [intptr] 
%inst



%index
GdipGetPathFillMode
(no summary)
%prm
path, fillmode
path : [intptr] 
fillmode : [var] 
%inst



%index
GdipGetPathGradientBlend
(no summary)
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
%prm
brush, count
brush : [intptr] 
count : [var] 
%inst



%index
GdipGetPathGradientCenterColor
(no summary)
%prm
brush, colors
brush : [intptr] 
colors : [var] 
%inst



%index
GdipGetPathGradientCenterPoint
(no summary)
%prm
brush, points
brush : [intptr] 
points : [var] 
%inst



%index
GdipGetPathGradientCenterPointI
(no summary)
%prm
brush, points
brush : [intptr] 
points : [var] 
%inst



%index
GdipGetPathGradientFocusScales
(no summary)
%prm
brush, xScale, yScale
brush : [intptr] 
xScale : [var] 
yScale : [var] 
%inst



%index
GdipGetPathGradientGammaCorrection
(no summary)
%prm
brush, useGammaCorrection
brush : [intptr] 
useGammaCorrection : [var] 
%inst



%index
GdipGetPathGradientPath
(no summary)
%prm
brush, path
brush : [intptr] 
path : [intptr] 
%inst



%index
GdipGetPathGradientPointCount
(no summary)
%prm
brush, count
brush : [intptr] 
count : [var] 
%inst



%index
GdipGetPathGradientPresetBlend
(no summary)
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
%prm
brush, count
brush : [intptr] 
count : [var] 
%inst



%index
GdipGetPathGradientRect
(no summary)
%prm
brush, rect
brush : [intptr] 
rect : [var] 
%inst



%index
GdipGetPathGradientRectI
(no summary)
%prm
brush, rect
brush : [intptr] 
rect : [var] 
%inst



%index
GdipGetPathGradientSurroundColorCount
(no summary)
%prm
brush, count
brush : [intptr] 
count : [var] 
%inst



%index
GdipGetPathGradientSurroundColorsWithCount
(no summary)
%prm
brush, color, count
brush : [intptr] 
color : [var] 
count : [var] 
%inst



%index
GdipGetPathGradientTransform
(no summary)
%prm
brush, matrix
brush : [intptr] 
matrix : [intptr] 
%inst



%index
GdipGetPathGradientWrapMode
(no summary)
%prm
brush, wrapmode
brush : [intptr] 
wrapmode : [var] 
%inst



%index
GdipGetPathLastPoint
(no summary)
%prm
path, lastPoint
path : [intptr] 
lastPoint : [var] 
%inst



%index
GdipGetPathPoints
(no summary)
%prm
param0, points, count
param0 : [intptr] 
points : [var] 
count : [int] 
%inst



%index
GdipGetPathPointsI
(no summary)
%prm
param0, points, count
param0 : [intptr] 
points : [var] 
count : [int] 
%inst



%index
GdipGetPathTypes
(no summary)
%prm
path, types, count
path : [intptr] 
types : [var] 
count : [int] 
%inst



%index
GdipGetPathWorldBounds
(no summary)
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
%prm
pen, brush
pen : [intptr] 
brush : [var] 
%inst



%index
GdipGetPenColor
(no summary)
%prm
pen, argb
pen : [intptr] 
argb : [var] 
%inst



%index
GdipGetPenCompoundArray
(no summary)
%prm
pen, dash, count
pen : [intptr] 
dash : [var] 
count : [int] 
%inst



%index
GdipGetPenCompoundCount
(no summary)
%prm
pen, count
pen : [intptr] 
count : [var] 
%inst



%index
GdipGetPenCustomEndCap
(no summary)
%prm
pen, customCap
pen : [intptr] 
customCap : [var] 
%inst



%index
GdipGetPenCustomStartCap
(no summary)
%prm
pen, customCap
pen : [intptr] 
customCap : [var] 
%inst



%index
GdipGetPenDashArray
(no summary)
%prm
pen, dash, count
pen : [intptr] 
dash : [var] 
count : [int] 
%inst



%index
GdipGetPenDashCap197819
(no summary)
%prm
pen, dashCap
pen : [intptr] 
dashCap : [var] 
%inst



%index
GdipGetPenDashCount
(no summary)
%prm
pen, count
pen : [intptr] 
count : [var] 
%inst



%index
GdipGetPenDashOffset
(no summary)
%prm
pen, offset
pen : [intptr] 
offset : [var] 
%inst



%index
GdipGetPenDashStyle
(no summary)
%prm
pen, dashstyle
pen : [intptr] 
dashstyle : [var] 
%inst



%index
GdipGetPenEndCap
(no summary)
%prm
pen, endCap
pen : [intptr] 
endCap : [var] 
%inst



%index
GdipGetPenFillType
(no summary)
%prm
pen, type
pen : [intptr] 
type : [var] 
%inst



%index
GdipGetPenLineJoin
(no summary)
%prm
pen, lineJoin
pen : [intptr] 
lineJoin : [var] 
%inst



%index
GdipGetPenMiterLimit
(no summary)
%prm
pen, miterLimit
pen : [intptr] 
miterLimit : [var] 
%inst



%index
GdipGetPenMode
(no summary)
%prm
pen, penMode
pen : [intptr] 
penMode : [var] 
%inst



%index
GdipGetPenStartCap
(no summary)
%prm
pen, startCap
pen : [intptr] 
startCap : [var] 
%inst



%index
GdipGetPenTransform
(no summary)
%prm
pen, matrix
pen : [intptr] 
matrix : [intptr] 
%inst



%index
GdipGetPenUnit
(no summary)
%prm
pen, unit
pen : [intptr] 
unit : [var] 
%inst



%index
GdipGetPenWidth
(no summary)
%prm
pen, width
pen : [intptr] 
width : [var] 
%inst



%index
GdipGetPixelOffsetMode
(no summary)
%prm
graphics, pixelOffsetMode
graphics : [intptr] 
pixelOffsetMode : [var] 
%inst



%index
GdipGetPointCount
(no summary)
%prm
path, count
path : [intptr] 
count : [var] 
%inst



%index
GdipGetPropertyCount
(no summary)
%prm
image, numOfProperty
image : [intptr] 
numOfProperty : [var] 
%inst



%index
GdipGetPropertyIdList
(no summary)
%prm
image, numOfProperty, list
image : [intptr] 
numOfProperty : [int] 
list : [var] 
%inst



%index
GdipGetPropertyItem
(no summary)
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
%prm
image, propId, size
image : [intptr] 
propId : [int] 
size : [var] 
%inst



%index
GdipGetPropertySize
(no summary)
%prm
image, totalBufferSize, numProperties
image : [intptr] 
totalBufferSize : [var] 
numProperties : [var] 
%inst



%index
GdipGetRegionBounds
(no summary)
%prm
region, graphics, rect
region : [intptr] 
graphics : [intptr] 
rect : [var] 
%inst



%index
GdipGetRegionBoundsI
(no summary)
%prm
region, graphics, rect
region : [intptr] 
graphics : [intptr] 
rect : [var] 
%inst



%index
GdipGetRegionData
(no summary)
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
%prm
region, bufferSize
region : [intptr] 
bufferSize : [var] 
%inst



%index
GdipGetRegionHRgn
(no summary)
%prm
region, graphics, hRgn
region : [intptr] 
graphics : [intptr] 
hRgn : [intptr] 
%inst



%index
GdipGetRegionScans
(no summary)
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
%prm
region, count, matrix
region : [intptr] 
count : [var] 
matrix : [intptr] 
%inst



%index
GdipGetRegionScansI
(no summary)
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
%prm
graphics, x, y
graphics : [intptr] 
x : [var] 
y : [var] 
%inst



%index
GdipGetSmoothingMode
(no summary)
%prm
graphics, smoothingMode
graphics : [intptr] 
smoothingMode : [var] 
%inst



%index
GdipGetSolidFillColor
(no summary)
%prm
brush, color
brush : [intptr] 
color : [var] 
%inst



%index
GdipGetStringFormatAlign
(no summary)
%prm
format, align
format : [intptr] 
align : [var] 
%inst



%index
GdipGetStringFormatDigitSubstitution
(no summary)
%prm
format, language, substitute
format : [intptr] 
language : [var] 
substitute : [var] 
%inst



%index
GdipGetStringFormatFlags
(no summary)
%prm
format, flags
format : [intptr] 
flags : [var] 
%inst



%index
GdipGetStringFormatHotkeyPrefix
(no summary)
%prm
format, hotkeyPrefix
format : [intptr] 
hotkeyPrefix : [var] 
%inst



%index
GdipGetStringFormatLineAlign
(no summary)
%prm
format, align
format : [intptr] 
align : [var] 
%inst



%index
GdipGetStringFormatMeasurableCharacterRangeCount
(no summary)
%prm
format, count
format : [intptr] 
count : [var] 
%inst



%index
GdipGetStringFormatTabStopCount
(no summary)
%prm
format, count
format : [intptr] 
count : [var] 
%inst



%index
GdipGetStringFormatTabStops
(no summary)
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
%prm
format, trimming
format : [intptr] 
trimming : [var] 
%inst



%index
GdipGetTextContrast
(no summary)
%prm
graphics, contrast
graphics : [intptr] 
contrast : [var] 
%inst



%index
GdipGetTextRenderingHint
(no summary)
%prm
graphics, mode
graphics : [intptr] 
mode : [var] 
%inst



%index
GdipGetTextureImage
(no summary)
%prm
brush, image
brush : [intptr] 
image : [var] 
%inst



%index
GdipGetTextureTransform
(no summary)
%prm
brush, matrix
brush : [intptr] 
matrix : [intptr] 
%inst



%index
GdipGetTextureWrapMode
(no summary)
%prm
brush, wrapmode
brush : [intptr] 
wrapmode : [var] 
%inst



%index
GdipGetVisibleClipBounds
(no summary)
%prm
graphics, rect
graphics : [intptr] 
rect : [var] 
%inst



%index
GdipGetVisibleClipBoundsI
(no summary)
%prm
graphics, rect
graphics : [intptr] 
rect : [var] 
%inst



%index
GdipGetWorldTransform
(no summary)
%prm
graphics, matrix
graphics : [intptr] 
matrix : [intptr] 
%inst



%index
GdipGraphicsClear
(no summary)
%prm
graphics, color
graphics : [intptr] 
color : [int] 
%inst



%index
GdipGraphicsSetAbort
(no summary)
%prm
pGraphics, pIAbort
pGraphics : [intptr] 
pIAbort : [var] 
%inst



%index
GdipImageForceValidation
(no summary)
%prm
image
image : [intptr] 
%inst



%index
GdipImageGetFrameCount
(no summary)
%prm
image, dimensionID, count
image : [intptr] 
dimensionID : [var] 
count : [var] 
%inst



%index
GdipImageGetFrameDimensionsCount
(no summary)
%prm
image, count
image : [intptr] 
count : [var] 
%inst



%index
GdipImageGetFrameDimensionsList
(no summary)
%prm
image, dimensionIDs, count
image : [intptr] 
dimensionIDs : [var] 
count : [int] 
%inst



%index
GdipImageRotateFlip
(no summary)
%prm
image, rfType
image : [intptr] 
rfType : [int] 
%inst



%index
GdipImageSelectActiveFrame
(no summary)
%prm
image, dimensionID, frameIndex
image : [intptr] 
dimensionID : [var] 
frameIndex : [int] 
%inst



%index
GdipImageSetAbort
(no summary)
%prm
pImage, pIAbort
pImage : [intptr] 
pIAbort : [var] 
%inst



%index
GdipInitializePalette
(no summary)
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
%prm
matrix
matrix : [intptr] 
%inst



%index
GdipIsClipEmpty
(no summary)
%prm
graphics, result
graphics : [intptr] 
result : [var] 
%inst



%index
GdipIsEmptyRegion
(no summary)
%prm
region, graphics, result
region : [intptr] 
graphics : [intptr] 
result : [var] 
%inst



%index
GdipIsEqualRegion
(no summary)
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
%prm
region, graphics, result
region : [intptr] 
graphics : [intptr] 
result : [var] 
%inst



%index
GdipIsMatrixEqual
(no summary)
%prm
matrix, matrix2, result
matrix : [intptr] 
matrix2 : [intptr] 
result : [var] 
%inst



%index
GdipIsMatrixIdentity
(no summary)
%prm
matrix, result
matrix : [intptr] 
result : [var] 
%inst



%index
GdipIsMatrixInvertible
(no summary)
%prm
matrix, result
matrix : [intptr] 
result : [var] 
%inst



%index
GdipIsOutlineVisiblePathPoint
(no summary)
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
%prm
family, style, IsStyleAvailable
family : [intptr] 
style : [int] 
IsStyleAvailable : [var] 
%inst



%index
GdipIsVisibleClipEmpty
(no summary)
%prm
graphics, result
graphics : [intptr] 
result : [var] 
%inst



%index
GdipIsVisiblePathPoint
(no summary)
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
%prm
filename, image
filename : [wstr] 
image : [var] 
%inst



%index
GdipLoadImageFromFileICM
(no summary)
%prm
filename, image
filename : [wstr] 
image : [var] 
%inst



%index
GdipLoadImageFromStream
(no summary)
%prm
stream, image
stream : [var] 
image : [var] 
%inst



%index
GdipLoadImageFromStreamICM
(no summary)
%prm
stream, image
stream : [var] 
image : [var] 
%inst



%index
GdipMeasureCharacterRanges
(no summary)
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
%prm
brush, matrix, order
brush : [intptr] 
matrix : [intptr] 
order : [int] 
%inst



%index
GdipMultiplyMatrix
(no summary)
%prm
matrix, matrix2, order
matrix : [intptr] 
matrix2 : [intptr] 
order : [int] 
%inst



%index
GdipMultiplyPathGradientTransform
(no summary)
%prm
brush, matrix, order
brush : [intptr] 
matrix : [intptr] 
order : [int] 
%inst



%index
GdipMultiplyPenTransform
(no summary)
%prm
pen, matrix, order
pen : [intptr] 
matrix : [intptr] 
order : [int] 
%inst



%index
GdipMultiplyTextureTransform
(no summary)
%prm
brush, matrix, order
brush : [intptr] 
matrix : [intptr] 
order : [int] 
%inst



%index
GdipMultiplyWorldTransform
(no summary)
%prm
graphics, matrix, order
graphics : [intptr] 
matrix : [intptr] 
order : [int] 
%inst



%index
GdipNewInstalledFontCollection
(no summary)
%prm
fontCollection
fontCollection : [var] 
%inst



%index
GdipNewPrivateFontCollection
(no summary)
%prm
fontCollection
fontCollection : [var] 
%inst



%index
GdipPathIterCopyData
(no summary)
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
%prm
iterator, count
iterator : [intptr] 
count : [var] 
%inst



%index
GdipPathIterGetSubpathCount
(no summary)
%prm
iterator, count
iterator : [intptr] 
count : [var] 
%inst



%index
GdipPathIterHasCurve
(no summary)
%prm
iterator, hasCurve
iterator : [intptr] 
hasCurve : [var] 
%inst



%index
GdipPathIterIsValid
(no summary)
%prm
iterator, valid
iterator : [intptr] 
valid : [var] 
%inst



%index
GdipPathIterNextMarker
(no summary)
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
%prm
iterator, resultCount, path
iterator : [intptr] 
resultCount : [var] 
path : [intptr] 
%inst



%index
GdipPathIterNextPathType
(no summary)
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
%prm
iterator
iterator : [intptr] 
%inst



%index
GdipPlayMetafileRecord
(no summary)
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
%prm
fontCollection, filename
fontCollection : [intptr] 
filename : [wstr] 
%inst



%index
GdipPrivateAddMemoryFont
(no summary)
%prm
fontCollection, memory, length
fontCollection : [intptr] 
memory : [intptr] 
length : [int] 
%inst



%index
GdipRecordMetafile
(no summary)
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
%prm
graphics, hdc
graphics : [intptr] 
hdc : [intptr] 
%inst



%index
GdipRemovePropertyItem
(no summary)
%prm
image, propId
image : [intptr] 
propId : [int] 
%inst



%index
GdipResetClip
(no summary)
%prm
graphics
graphics : [intptr] 
%inst



%index
GdipResetImageAttributes
(no summary)
%prm
imageattr, type
imageattr : [intptr] 
type : [int] 
%inst



%index
GdipResetLineTransform
(no summary)
%prm
brush
brush : [intptr] 
%inst



%index
GdipResetPageTransform
(no summary)
%prm
graphics
graphics : [intptr] 
%inst



%index
GdipResetPath
(no summary)
%prm
path
path : [intptr] 
%inst



%index
GdipResetPathGradientTransform
(no summary)
%prm
brush
brush : [intptr] 
%inst



%index
GdipResetPenTransform
(no summary)
%prm
pen
pen : [intptr] 
%inst



%index
GdipResetTextureTransform
(no summary)
%prm
brush
brush : [intptr] 
%inst



%index
GdipResetWorldTransform
(no summary)
%prm
graphics
graphics : [intptr] 
%inst



%index
GdipRestoreGraphics
(no summary)
%prm
graphics, state
graphics : [intptr] 
state : [int] 
%inst



%index
GdipReversePath
(no summary)
%prm
path
path : [intptr] 
%inst



%index
GdipRotateLineTransform
(no summary)
%prm
brush, angle, order
brush : [intptr] 
angle : [float] 
order : [int] 
%inst



%index
GdipRotateMatrix
(no summary)
%prm
matrix, angle, order
matrix : [intptr] 
angle : [float] 
order : [int] 
%inst



%index
GdipRotatePathGradientTransform
(no summary)
%prm
brush, angle, order
brush : [intptr] 
angle : [float] 
order : [int] 
%inst



%index
GdipRotatePenTransform
(no summary)
%prm
pen, angle, order
pen : [intptr] 
angle : [float] 
order : [int] 
%inst



%index
GdipRotateTextureTransform
(no summary)
%prm
brush, angle, order
brush : [intptr] 
angle : [float] 
order : [int] 
%inst



%index
GdipRotateWorldTransform
(no summary)
%prm
graphics, angle, order
graphics : [intptr] 
angle : [float] 
order : [int] 
%inst



%index
GdipSaveAdd
(no summary)
%prm
image, encoderParams
image : [intptr] 
encoderParams : [var] 
%inst



%index
GdipSaveAddImage
(no summary)
%prm
image, newImage, encoderParams
image : [intptr] 
newImage : [intptr] 
encoderParams : [var] 
%inst



%index
GdipSaveGraphics
(no summary)
%prm
graphics, state
graphics : [intptr] 
state : [var] 
%inst



%index
GdipSaveImageToFile
(no summary)
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
%prm
cap, fillState
cap : [intptr] 
fillState : [int] 
%inst



%index
GdipSetAdjustableArrowCapHeight
(no summary)
%prm
cap, height
cap : [intptr] 
height : [float] 
%inst



%index
GdipSetAdjustableArrowCapMiddleInset
(no summary)
%prm
cap, middleInset
cap : [intptr] 
middleInset : [float] 
%inst



%index
GdipSetAdjustableArrowCapWidth
(no summary)
%prm
cap, width
cap : [intptr] 
width : [float] 
%inst



%index
GdipSetClipGraphics
(no summary)
%prm
graphics, srcgraphics, combineMode
graphics : [intptr] 
srcgraphics : [intptr] 
combineMode : [int] 
%inst



%index
GdipSetClipHrgn
(no summary)
%prm
graphics, hRgn, combineMode
graphics : [intptr] 
hRgn : [intptr] 
combineMode : [int] 
%inst



%index
GdipSetClipPath
(no summary)
%prm
graphics, path, combineMode
graphics : [intptr] 
path : [intptr] 
combineMode : [int] 
%inst



%index
GdipSetClipRect
(no summary)
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
%prm
graphics, region, combineMode
graphics : [intptr] 
region : [intptr] 
combineMode : [int] 
%inst



%index
GdipSetCompositingMode
(no summary)
%prm
graphics, compositingMode
graphics : [intptr] 
compositingMode : [int] 
%inst



%index
GdipSetCompositingQuality
(no summary)
%prm
graphics, compositingQuality
graphics : [intptr] 
compositingQuality : [int] 
%inst



%index
GdipSetCustomLineCapBaseCap
(no summary)
%prm
customCap, baseCap
customCap : [intptr] 
baseCap : [int] 
%inst



%index
GdipSetCustomLineCapBaseInset
(no summary)
%prm
customCap, inset
customCap : [intptr] 
inset : [float] 
%inst



%index
GdipSetCustomLineCapStrokeCaps
(no summary)
%prm
customCap, startCap, endCap
customCap : [intptr] 
startCap : [int] 
endCap : [int] 
%inst



%index
GdipSetCustomLineCapStrokeJoin
(no summary)
%prm
customCap, lineJoin
customCap : [intptr] 
lineJoin : [int] 
%inst



%index
GdipSetCustomLineCapWidthScale
(no summary)
%prm
customCap, widthScale
customCap : [intptr] 
widthScale : [float] 
%inst



%index
GdipSetEffectParameters
(no summary)
%prm
effect, params, size
effect : [intptr] 
params : [int] 
size : [int] 
%inst



%index
GdipSetEmpty
(no summary)
%prm
region
region : [intptr] 
%inst



%index
GdipSetImageAttributesCachedBackground
(no summary)
%prm
imageattr, enableFlag
imageattr : [intptr] 
enableFlag : [int] 
%inst



%index
GdipSetImageAttributesColorKeys
(no summary)
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
%prm
imageattr, type, enableFlag
imageattr : [intptr] 
type : [int] 
enableFlag : [int] 
%inst



%index
GdipSetImageAttributesOutputChannel
(no summary)
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
%prm
imageattr, type
imageattr : [intptr] 
type : [int] 
%inst



%index
GdipSetImageAttributesWrapMode
(no summary)
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
%prm
image, palette
image : [intptr] 
palette : [var] 
%inst



%index
GdipSetInfinite
(no summary)
%prm
region
region : [intptr] 
%inst



%index
GdipSetInterpolationMode
(no summary)
%prm
graphics, interpolationMode
graphics : [intptr] 
interpolationMode : [int] 
%inst



%index
GdipSetLineBlend
(no summary)
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
%prm
brush, color1, color2
brush : [intptr] 
color1 : [int] 
color2 : [int] 
%inst



%index
GdipSetLineGammaCorrection
(no summary)
%prm
brush, useGammaCorrection
brush : [intptr] 
useGammaCorrection : [int] 
%inst



%index
GdipSetLineLinearBlend
(no summary)
%prm
brush, focus, scale
brush : [intptr] 
focus : [float] 
scale : [float] 
%inst



%index
GdipSetLinePresetBlend
(no summary)
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
%prm
brush, focus, scale
brush : [intptr] 
focus : [float] 
scale : [float] 
%inst



%index
GdipSetLineTransform
(no summary)
%prm
brush, matrix
brush : [intptr] 
matrix : [intptr] 
%inst



%index
GdipSetLineWrapMode
(no summary)
%prm
brush, wrapmode
brush : [intptr] 
wrapmode : [int] 
%inst



%index
GdipSetMatrixElements
(no summary)
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
%prm
metafile, metafileRasterizationLimitDpi
metafile : [intptr] 
metafileRasterizationLimitDpi : [int] 
%inst



%index
GdipSetPageScale
(no summary)
%prm
graphics, scale
graphics : [intptr] 
scale : [float] 
%inst



%index
GdipSetPageUnit
(no summary)
%prm
graphics, unit
graphics : [intptr] 
unit : [int] 
%inst



%index
GdipSetPathFillMode
(no summary)
%prm
path, fillmode
path : [intptr] 
fillmode : [int] 
%inst



%index
GdipSetPathGradientBlend
(no summary)
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
%prm
brush, colors
brush : [intptr] 
colors : [int] 
%inst



%index
GdipSetPathGradientCenterPoint
(no summary)
%prm
brush, points
brush : [intptr] 
points : [var] 
%inst



%index
GdipSetPathGradientCenterPointI
(no summary)
%prm
brush, points
brush : [intptr] 
points : [var] 
%inst



%index
GdipSetPathGradientFocusScales
(no summary)
%prm
brush, xScale, yScale
brush : [intptr] 
xScale : [float] 
yScale : [float] 
%inst



%index
GdipSetPathGradientGammaCorrection
(no summary)
%prm
brush, useGammaCorrection
brush : [intptr] 
useGammaCorrection : [int] 
%inst



%index
GdipSetPathGradientLinearBlend
(no summary)
%prm
brush, focus, scale
brush : [intptr] 
focus : [float] 
scale : [float] 
%inst



%index
GdipSetPathGradientPath
(no summary)
%prm
brush, path
brush : [intptr] 
path : [intptr] 
%inst



%index
GdipSetPathGradientPresetBlend
(no summary)
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
%prm
brush, focus, scale
brush : [intptr] 
focus : [float] 
scale : [float] 
%inst



%index
GdipSetPathGradientSurroundColorsWithCount
(no summary)
%prm
brush, color, count
brush : [intptr] 
color : [var] 
count : [var] 
%inst



%index
GdipSetPathGradientTransform
(no summary)
%prm
brush, matrix
brush : [intptr] 
matrix : [intptr] 
%inst



%index
GdipSetPathGradientWrapMode
(no summary)
%prm
brush, wrapmode
brush : [intptr] 
wrapmode : [int] 
%inst



%index
GdipSetPathMarker
(no summary)
%prm
path
path : [intptr] 
%inst



%index
GdipSetPenBrushFill
(no summary)
%prm
pen, brush
pen : [intptr] 
brush : [intptr] 
%inst



%index
GdipSetPenColor
(no summary)
%prm
pen, argb
pen : [intptr] 
argb : [int] 
%inst



%index
GdipSetPenCompoundArray
(no summary)
%prm
pen, dash, count
pen : [intptr] 
dash : [var] 
count : [int] 
%inst



%index
GdipSetPenCustomEndCap
(no summary)
%prm
pen, customCap
pen : [intptr] 
customCap : [intptr] 
%inst



%index
GdipSetPenCustomStartCap
(no summary)
%prm
pen, customCap
pen : [intptr] 
customCap : [intptr] 
%inst



%index
GdipSetPenDashArray
(no summary)
%prm
pen, dash, count
pen : [intptr] 
dash : [var] 
count : [int] 
%inst



%index
GdipSetPenDashCap197819
(no summary)
%prm
pen, dashCap
pen : [intptr] 
dashCap : [int] 
%inst



%index
GdipSetPenDashOffset
(no summary)
%prm
pen, offset
pen : [intptr] 
offset : [float] 
%inst



%index
GdipSetPenDashStyle
(no summary)
%prm
pen, dashstyle
pen : [intptr] 
dashstyle : [int] 
%inst



%index
GdipSetPenEndCap
(no summary)
%prm
pen, endCap
pen : [intptr] 
endCap : [int] 
%inst



%index
GdipSetPenLineCap197819
(no summary)
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
%prm
pen, lineJoin
pen : [intptr] 
lineJoin : [int] 
%inst



%index
GdipSetPenMiterLimit
(no summary)
%prm
pen, miterLimit
pen : [intptr] 
miterLimit : [float] 
%inst



%index
GdipSetPenMode
(no summary)
%prm
pen, penMode
pen : [intptr] 
penMode : [int] 
%inst



%index
GdipSetPenStartCap
(no summary)
%prm
pen, startCap
pen : [intptr] 
startCap : [int] 
%inst



%index
GdipSetPenTransform
(no summary)
%prm
pen, matrix
pen : [intptr] 
matrix : [intptr] 
%inst



%index
GdipSetPenUnit
(no summary)
%prm
pen, unit
pen : [intptr] 
unit : [int] 
%inst



%index
GdipSetPenWidth
(no summary)
%prm
pen, width
pen : [intptr] 
width : [float] 
%inst



%index
GdipSetPixelOffsetMode
(no summary)
%prm
graphics, pixelOffsetMode
graphics : [intptr] 
pixelOffsetMode : [int] 
%inst



%index
GdipSetPropertyItem
(no summary)
%prm
image, item
image : [intptr] 
item : [var] 
%inst



%index
GdipSetRenderingOrigin
(no summary)
%prm
graphics, x, y
graphics : [intptr] 
x : [int] 
y : [int] 
%inst



%index
GdipSetSmoothingMode
(no summary)
%prm
graphics, smoothingMode
graphics : [intptr] 
smoothingMode : [int] 
%inst



%index
GdipSetSolidFillColor
(no summary)
%prm
brush, color
brush : [intptr] 
color : [int] 
%inst



%index
GdipSetStringFormatAlign
(no summary)
%prm
format, align
format : [intptr] 
align : [int] 
%inst



%index
GdipSetStringFormatDigitSubstitution
(no summary)
%prm
format, language, substitute
format : [intptr] 
language : [int] 
substitute : [int] 
%inst



%index
GdipSetStringFormatFlags
(no summary)
%prm
format, flags
format : [intptr] 
flags : [int] 
%inst



%index
GdipSetStringFormatHotkeyPrefix
(no summary)
%prm
format, hotkeyPrefix
format : [intptr] 
hotkeyPrefix : [int] 
%inst



%index
GdipSetStringFormatLineAlign
(no summary)
%prm
format, align
format : [intptr] 
align : [int] 
%inst



%index
GdipSetStringFormatMeasurableCharacterRanges
(no summary)
%prm
format, rangeCount, ranges
format : [intptr] 
rangeCount : [int] 
ranges : [var] 
%inst



%index
GdipSetStringFormatTabStops
(no summary)
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
%prm
format, trimming
format : [intptr] 
trimming : [int] 
%inst



%index
GdipSetTextContrast
(no summary)
%prm
graphics, contrast
graphics : [intptr] 
contrast : [int] 
%inst



%index
GdipSetTextRenderingHint
(no summary)
%prm
graphics, mode
graphics : [intptr] 
mode : [int] 
%inst



%index
GdipSetTextureTransform
(no summary)
%prm
brush, matrix
brush : [intptr] 
matrix : [intptr] 
%inst



%index
GdipSetTextureWrapMode
(no summary)
%prm
brush, wrapmode
brush : [intptr] 
wrapmode : [int] 
%inst



%index
GdipSetWorldTransform
(no summary)
%prm
graphics, matrix
graphics : [intptr] 
matrix : [intptr] 
%inst



%index
GdipShearMatrix
(no summary)
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
%prm
path
path : [intptr] 
%inst



%index
GdipStringFormatGetGenericDefault
(no summary)
%prm
format
format : [var] 
%inst



%index
GdipStringFormatGetGenericTypographic
(no summary)
%prm
format
format : [var] 
%inst



%index
GdipTestControl
(no summary)
%prm
control, param1
control : [int] 
param1 : [intptr] 
%inst



%index
GdipTransformMatrixPoints
(no summary)
%prm
matrix, pts, count
matrix : [intptr] 
pts : [var] 
count : [int] 
%inst



%index
GdipTransformMatrixPointsI
(no summary)
%prm
matrix, pts, count
matrix : [intptr] 
pts : [var] 
count : [int] 
%inst



%index
GdipTransformPath
(no summary)
%prm
path, matrix
path : [intptr] 
matrix : [intptr] 
%inst



%index
GdipTransformPoints
(no summary)
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
%prm
region, matrix
region : [intptr] 
matrix : [intptr] 
%inst



%index
GdipTranslateClip
(no summary)
%prm
graphics, dx, dy
graphics : [intptr] 
dx : [float] 
dy : [float] 
%inst



%index
GdipTranslateClipI
(no summary)
%prm
graphics, dx, dy
graphics : [intptr] 
dx : [int] 
dy : [int] 
%inst



%index
GdipTranslateLineTransform
(no summary)
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
%prm
region, dx, dy
region : [intptr] 
dx : [float] 
dy : [float] 
%inst



%index
GdipTranslateRegionI
(no summary)
%prm
region, dx, dy
region : [intptr] 
dx : [int] 
dy : [int] 
%inst



%index
GdipTranslateTextureTransform
(no summary)
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
%prm
matrix, pts, count
matrix : [intptr] 
pts : [var] 
count : [int] 
%inst



%index
GdipVectorTransformMatrixPointsI
(no summary)
%prm
matrix, pts, count
matrix : [intptr] 
pts : [var] 
count : [int] 
%inst



%index
GdipWarpPath
(no summary)
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
%prm
path, matrix, flatness
path : [intptr] 
matrix : [intptr] 
flatness : [float] 
%inst



%index
GdiplusNotificationHook
(no summary)
%prm
token
token : [var] 
%inst



%index
GdiplusNotificationUnhook
(no summary)
%prm
token
token : [int] 
%inst



%index
GdiplusShutdown
(no summary)
%prm
token
token : [int] 
%inst



%index
GdiplusStartup
(no summary)
%prm
token, input, output
token : [var] 
input : [var] 
output : [var] 
%inst


