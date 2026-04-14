; ============================================================
;   d2d1.dll ヘルプ (CsWin32 / win32metadata から自動抽出)
;   docs_ja.json に日本語訳があればそちらを使用、無ければ英語原文。
;   翻訳を追加するときは docs_ja.json を編集して再生成。
; ============================================================

%index
D2D1ComputeMaximumScaleFactor
Computes the maximum factor by which a given transform can stretch any vector.
%group
Win32 d2d1
%prm
matrix
matrix : [var] The input transform matrix.
%inst
Computes the maximum factor by which a given transform can stretch
any vector.

[戻り値]
The scale factor.

[備考]
Formally, if M is the input matrix, this method will return the
maximum value of |V * M| / |V| for all vectors V, where |.| denotes
length.
Note Since this describes how M affects vectors (rather than points),
the translation components (_31 and _32) of M are ignored.


%index
D2D1ConvertColorSpace
Converts the given color from one colorspace to another.
%group
Win32 d2d1
%prm
sourceColorSpace, destinationColorSpace, color
sourceColorSpace : [int] Type: D2D1_COLOR_SPACE The source color space.
destinationColorSpace : [int] Type: D2D1_COLOR_SPACE The destination color space.
color : [var] Type: const D2D1_COLOR_F* The source color.
%inst
Converts the given color from one colorspace to another.

[戻り値]
Type: D2D1_COLOR_F The converted color.


%index
D2D1CreateDevice
Creates a new Direct2D device associated with the provided DXGI device.
%group
Win32 d2d1
%prm
dxgiDevice, creationProperties, d2dDevice
dxgiDevice : [var] The DXGI device the Direct2D device is associated with.
creationProperties : [var] The properties to apply to the Direct2D device.
d2dDevice : [var] When this function returns, contains the address of a pointer to a Direct2D device.
%inst
Creates a new Direct2D device associated with the provided DXGI
device.

[戻り値]
The function returns an HRESULT. Possible values include, but are not
limited to, those in the following table.
This doc was truncated.

[備考]
This function will also create a new ID2D1Factory1 that can be
retrieved through ID2D1Resource::GetFactory. If the creation
properties are not specified, then d2dDevice will inherit its
threading mode from dxgiDevice and debug tracing will not be enabled.


%index
D2D1CreateDeviceContext
Creates a new Direct2D device context associated with a DXGI surface.
%group
Win32 d2d1
%prm
dxgiSurface, creationProperties, d2dDeviceContext
dxgiSurface : [var] The DXGI surface the Direct2D device context is associated with.
creationProperties : [var] The properties to apply to the Direct2D device context.
d2dDeviceContext : [var] When this function returns, contains the address of a pointer to a Direct2D device context.
%inst
Creates a new Direct2D device context associated with a DXGI surface.

[戻り値]
The function returns an HRESULT. Possible values include, but are not
limited to, those in the following table.
This doc was truncated.

[備考]
This function will also create a new ID2D1Factory1 that can be
retrieved through ID2D1Resource::GetFactory. This function will also
create a new ID2D1Device that can be retrieved through
ID2D1DeviceContext::GetDevice. The DXGI device will be specified
implicitly through dxgiSurface. If creationProperties are not
specified, the Direct2D device will inherit its threading mode from
the DXGI device implied by dxgiSurface and debug tracing will not be
enabled.


%index
D2D1CreateFactory
D2D1CreateFactory(D2D1_FACTORY_TYPE,REFIID,D2D1_FACTORY_OPTIONS*,void**) creates a factory object that can be used to create Direct2D resources.
%group
Win32 d2d1
%prm
factoryType, riid, pFactoryOptions, ppIFactory
factoryType : [int] Type: D2D1_FACTORY_TYPE The threading model of the factory and the resources it creates.
riid : [var] Type: REFIID A reference to the IID of ID2D1Factory that is obtained by using `__uuidof(ID2D1Factory)`.
pFactoryOptions : [var] Type: const D2D1_FACTORY_OPTIONS* The level of detail provided to the debugging layer.
ppIFactory : [var] Type: void** When this method returns, contains the address to a pointer to the new factory.
%inst

D2D1CreateFactory(D2D1_FACTORY_TYPE,REFIID,D2D1_FACTORY_OPTIONS*,void**)
creates a factory object that can be used to create Direct2D
resources.

[戻り値]
Type: **[HRESULT](/windows/win32/com/structure-of-com-error-codes)**
If the function succeeds, it returns **S_OK**. Otherwise, it returns
an [**HRESULT**](/windows/win32/com/structure-of-com-error-codes)
[error code](/windows/win32/com/com-error-codes-10).

[備考]
The ID2D1Factory interface provides the starting point for Direct2D.
In general, an object created from a single instance of a factory
object can be used with other resources created from that instance,
but not with resources created by other factory instances.


%index
D2D1GetGradientMeshInteriorPointsFromCoonsPatch
Returns the interior points for a gradient mesh patch based on the points defining a Coons patch.
%group
Win32 d2d1
%prm
pPoint0, pPoint1, pPoint2, pPoint3, pPoint4, pPoint5, pPoint6, pPoint7, pPoint8, pPoint9, pPoint10, pPoint11, pTensorPoint11, pTensorPoint12, pTensorPoint21, pTensorPoint22
pPoint0 : [var] Type: D2D1_POINT_2F* The coordinate-space location of the control point at position 0.
pPoint1 : [var] Type: D2D1_POINT_2F* The coordinate-space location of the control point at position 1.
pPoint2 : [var] Type: D2D1_POINT_2F* The coordinate-space location of the control point at position 2.
pPoint3 : [var] Type: D2D1_POINT_2F* The coordinate-space location of the control point at position 3.
pPoint4 : [var] Type: D2D1_POINT_2F* The coordinate-space location of the control point at position 4.
pPoint5 : [var] Type: D2D1_POINT_2F* The coordinate-space location of the control point at position 5.
pPoint6 : [var] Type: D2D1_POINT_2F* The coordinate-space location of the control point at position 6.
pPoint7 : [var] Type: D2D1_POINT_2F* The coordinate-space location of the control point at position 7.
pPoint8 : [var] Type: D2D1_POINT_2F* The coordinate-space location of the control point at position 8.
pPoint9 : [var] Type: D2D1_POINT_2F* The coordinate-space location of the control point at position 9.
pPoint10 : [var] Type: D2D1_POINT_2F* The coordinate-space location of the control point at position 10.
pPoint11 : [var] Type: D2D1_POINT_2F* The coordinate-space location of the control point at position 11.
pTensorPoint11 : [var] Type: D2D1_POINT_2F* Returns the interior point for the gradient mesh corresponding to point11 in the D2D1_GRADIENT_MESH_PATCH structure.
pTensorPoint12 : [var] Type: D2D1_POINT_2F* Returns the interior point for the gradient mesh corresponding to point12 in the D2D1_GRADIENT_MESH_PATCH structure.
pTensorPoint21 : [var] Type: D2D1_POINT_2F* Returns the interior point for the gradient mesh corresponding to point21 in the D2D1_GRADIENT_MESH_PATCH structure.
pTensorPoint22 : [var] Type: D2D1_POINT_2F* Returns the interior point for the gradient mesh corresponding to point22 in the D2D1_GRADIENT_MESH_PATCH structure.
%inst
Returns the interior points for a gradient mesh patch based on the
points defining a Coons patch.

[備考]
This function is called by the GradientMeshPatchFromCoonsPatch
function and is not intended to be used directly.


%index
D2D1InvertMatrix
Tries to invert the specified matrix.
%group
Win32 d2d1
%prm
matrix
matrix : [var] Type: D2D1_MATRIX_3X2_F* The matrix to invert.
%inst
Tries to invert the specified matrix.

[戻り値]
Type: BOOL true if the matrix was inverted; otherwise, false.


%index
D2D1IsMatrixInvertible
Indicates whether the specified matrix is invertible.
%group
Win32 d2d1
%prm
matrix
matrix : [var] Type: const D2D1_MATRIX_3X2_F* The matrix to test.
%inst
Indicates whether the specified matrix is invertible.

[戻り値]
Type: BOOL true if the matrix was inverted; otherwise, false.


%index
D2D1MakeRotateMatrix
Creates a rotation transformation that rotates by the specified angle about the specified point.
%group
Win32 d2d1
%prm
angle, center, matrix
angle : [float] Type: FLOAT The clockwise rotation angle, in degrees.
center : [var] Type: D2D1_POINT_2F The point about which to rotate.
matrix : [var] Type: D2D1_MATRIX_3X2_F* When this method returns, contains the new rotation transformation. You must allocate storage for this parameter.
%inst
Creates a rotation transformation that rotates by the specified angle
about the specified point.

[備考]
Rotation occurs in the plane of the 2-D surface.


%index
D2D1MakeSkewMatrix
Creates a skew transformation that has the specified x-axis angle, y-axis angle, and center point.
%group
Win32 d2d1
%prm
angleX, angleY, center, matrix
angleX : [float] Type: FLOAT The x-axis skew angle, which is measured in degrees counterclockwise from the y-axis.
angleY : [float] Type: FLOAT The y-axis skew angle, which is measured in degrees counterclockwise from the x-axis.
center : [var] Type: D2D1_POINT_2F The center point of the skew operation.
matrix : [var] Type: D2D1_MATRIX_3X2_F* When this method returns, contains the rotation transformation. You must allocate storage for this parameter.
%inst
Creates a skew transformation that has the specified x-axis angle,
y-axis angle, and center point.


%index
D2D1SinCos
Returns the sine and cosine of an angle.
%group
Win32 d2d1
%prm
angle, s, c
angle : [float] Type: FLOAT The angle to calculate.
s : [var] Type: FLOAT* The sine of the angle.
c : [var] Type: FLOAT* The cosine of the angle.
%inst
Returns the sine and cosine of an angle.


%index
D2D1Tan
Returns the tangent of an angle.
%group
Win32 d2d1
%prm
angle
angle : [float] Type: FLOAT The angle to calculate the tangent for.
%inst
Returns the tangent of an angle.

[戻り値]
Type: FLOAT The tangent of the angle.


%index
D2D1Vec3Length
Returns the length of a 3 dimensional vector.
%group
Win32 d2d1
%prm
x, y, z
x : [float] Type: FLOAT The  x value of the vector.
y : [float] Type: FLOAT The  y value of the vector.
z : [float] Type: FLOAT The  z value of the vector.
%inst
Returns the length of a 3 dimensional vector.

[戻り値]
Type: FLOAT The length of the vector.

