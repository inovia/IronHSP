; ============================================================
;   glu32.dll ヘルプ (CsWin32 / win32metadata から自動抽出)
;   docs_ja.json に日本語訳があればそちらを使用、無ければ英語原文。
;   翻訳を追加するときは docs_ja.json を編集して再生成。
; ============================================================

%index
gluBeginCurve
The gluBeginCurve and gluEndCurve functions delimit a Non-Uniform Rational B-Spline (NURBS) curve definition. | gluBeginCurve function (Glu.h)
%group
Win32 glu32
%prm
nobj
nobj : [intptr] The NURBS object (created with [**gluNewNurbsRenderer**](glunewnurbsrenderer.md)).
%inst
The gluBeginCurve and gluEndCurve functions delimit a Non-Uniform
Rational B-Spline (NURBS) curve definition. | gluBeginCurve function
(Glu.h)

[戻り値]
This function does not return a value.

[備考]
Use **gluBeginCurve** to mark the beginning of a NURBS curve
definition. After calling **gluBeginCurve**, make one or more calls
to [**gluNurbsCurve**](glunurbscurve.md) to define the attributes of
the curve. Exactly one of the calls to **gluNurbsCurve** must have a
curve type of GL\_MAP1\_VERTEX\_3 or GL\_MAP1\_VERTEX\_4. To mark the
end of the NURBS curve definition, call
[**gluEndCurve**](gluendcurve.md). OpenGL evaluators are used to
render the NURBS curve as a series of line segments. Evaluator state
is preserved during rendering with
[**glPushAttrib**](glpushattrib.md) (GL\_EVAL\_BIT) and
[**glPopAttrib**](glpopattrib.md). For information on exactly what
state these calls preserve, see **glPushAttrib**.


%index
gluBeginPolygon
The gluBeginPolygon and gluEndPolygon functions delimit a polygon description. | gluBeginPolygon function (Glu.h)
%group
Win32 glu32
%prm
tess
tess : [intptr] The tessellation object (created with [**gluNewTess**](glunewtess.md)).
%inst
The gluBeginPolygon and gluEndPolygon functions delimit a polygon
description. | gluBeginPolygon function (Glu.h)

[戻り値]
This function does not return a value.

[備考]
Use **gluBeginPolygon** and **gluEndPolygon** to delimit the
definition of a nonconvex polygon. 1. Call **gluBeginPolygon**. 2.
Define the contours of the polygon by calling
[**gluTessVertex**](glutessvertex.md) for each vertex and
[**gluNextContour**](glunextcontour.md) to start each new contour. 3.
Call **gluEndPolygon** to signal the end of the definition. Once
**gluEndPolygon** is called, the polygon is tessellated, and the
resulting triangles are described through callbacks. For descriptions
of the callback functions, see [*gluTessCallback*](glutess.md).


%index
gluBeginSurface
The gluBeginSurface and gluEndSurface functions delimit a Non-Uniform Rational B-Spline (NURBS) surface definition. | gluBeginSurface function (Glu.h)
%group
Win32 glu32
%prm
nobj
nobj : [intptr] The NURBS object (created with [**gluNewNurbsRenderer**](glunewnurbsrenderer.md)).
%inst
The gluBeginSurface and gluEndSurface functions delimit a Non-Uniform
Rational B-Spline (NURBS) surface definition. | gluBeginSurface
function (Glu.h)

[戻り値]
This function does not return a value.

[備考]
The **gluBeginSurface** and **gluEndSurface** functions mark the
beginning and end of NURBS surface definitions, which are defined
with calls to **gluNurbsSurface**. 1. Call **gluBeginSurface** to
mark the beginning of a NURBS surface definition. 2. Make one or more
calls to **gluNurbsSurface** to define the attributes of the surface.
Exactly one of these calls to **gluNurbsSurface** must have a surface
type of GL\_MAP2\_VERTEX\_3 or GL\_MAP2\_VERTEX\_4. 3. To mark the
end of the NURBS surface definition, call **gluEndSurface**. The
[**gluBeginTrim**](glubegintrim.md),
[**gluPwlCurve**](glupwlcurve.md),
[**gluNurbsCurve**](glunurbscurve.md), and
[**gluEndTrim**](gluendtrim.md) functions support trimming of NURBS
surfaces. Use OpenGL evaluators to render the NURBS surface as a set
of polygons. Preserve the evaluator state during rendering with
[**glPushAttrib**](glpushattrib.md)(GL\_EVAL\_BIT) and
[**glPopAttrib**](glpopattrib.md).


%index
gluBeginTrim
The gluBeginTrim and gluEndTrim functions delimit a Non-Uniform Rational B-Spline (NURBS) trimming loop definition. | gluBeginTrim function (Glu.h)
%group
Win32 glu32
%prm
nobj
nobj : [intptr] The NURBS object (created with [**gluNewNurbsRenderer**](glunewnurbsrenderer.md)).
%inst
The gluBeginTrim and gluEndTrim functions delimit a Non-Uniform
Rational B-Spline (NURBS) trimming loop definition. | gluBeginTrim
function (Glu.h)

[戻り値]
This function does not return a value.

[備考]
Use **gluBeginTrim** to mark the beginning of a trimming loop, and
**gluEndTrim** to mark the end of a trimming loop. A trimming loop is
a set of oriented curve segments (forming a closed curve) that define
boundaries of a NURBS surface. You include these trimming loops in
the definition of a NURBS surface, between calls to
[**gluBeginSurface**](glubeginsurface.md) and
[**gluEndSurface**](gluendsurface.md). The definition for a NURBS
surface can contain many trimming loops. For example, if you write a
definition for a NURBS surface that resembles a rectangle with a hole
punched out, the definition would contain two trimming loops. One
loop would define the outer edge of the rectangle; the other would
define the punched-out hole. The definitions of each of these
trimming loops would be bracketed by a **gluBeginTrim** /
**gluEndTrim** pair. The definition of a single closed trimming loop
can consist of multiple curve segments, each described as a series of
line segments that form a linear curve (see
[**gluPwlCurve**](glupwlcurve.md)), as a single NURBS curve (see
[**gluNurbsCurve**](glunurbscurve.md)), or as a combination of both
in any order. The only library calls that can appear in a
trimming-loop definition (between the calls to **gluBeginTrim** and
**gluEndTrim**) are **gluPwlCurve** and **gluNurbsCurve**. The
displayed area of the NURBS surface is the region in the domain to
the left of the trimming curve as the curve parameter increases.
Thus, the retained region of the NURBS surface is inside a
counterclockwise trimming loop and outside a clockwise trimming loop.
For the rectangle mentioned earlier, the trimming loop for the outer
edge of the rectangle runs counterclockwise, while the trimming loop
for the punched-out hole runs clockwise. If you use more than one
curve to define a single trimming loop, the curve segments must form
a closed loop (that is, the endpoint of each curve must be the
starting point of the next curve, and the endpoint of the final curve
must be the starting point of the first curve). If the endpoints of
the curve are sufficiently close together but not exactly coincident,
they will be forced to match. If the endpoints are not sufficiently
close, an error results (see [*gluNurbsCallback*](glunurbs.md)). If a
trimming-loop definition contains multiple curves, the direction of
the curves must be consistent (that is, the inside must be to the
left of all of the curves). You can use nested trimming loops as long
as the curve orientations alternate correctly. Trimming curves cannot
be self-intersecting, nor can they intersect one another (or an error
results). If no trimming information is given for a NURBS surface,
the entire surface is drawn.


%index
gluBuild1DMipmaps
The gluBuild1DMipmaps function creates 1-D mipmaps.
%group
Win32 glu32
%prm
target, components, width, format, type, data
target : [int] The target texture. Must be GL\_TEXTURE\_1D.
components : [int] The number of color components in the texture. Must be 1, 2, 3, or 4.
width : [int] The width of the texture image.
format : [int] The format of the pixel data. The following values are valid: GL\_COLOR\_INDEX, GL\_RED, GL\_GREEN, GL\_BLUE, GL\_ALPHA, GL\_RGB, GL\_RGBA, GL\_BGR\_EXT, GL\_BGRA\_EXT, GL\_LUMINANCE, or GL\_LUMINANCE\_ALPHA.
type : [int] The data type for *data*. The following values are valid: GL\_UNSIGNED\_BYTE, GL\_BYTE, GL\_BITMAP, GL\_UNSIGNED\_SHORT, GL\_SHORT, GL\_UNSIGNED\_INT, GL\_INT, or GL\_FLOAT.
data : [intptr] A pointer to the image data in memory.
%inst
The gluBuild1DMipmaps function creates 1-D mipmaps.

[戻り値]
This function does not return a value.

[備考]
The **gluBuild1DMipmaps** function obtains the input image and
generates all mipmap images (using
[**gluScaleImage**](gluscaleimage.md)) so that the input image can be
used as a mipmapped texture image. The
[**glTexImage1D**](glteximage1d.md) function is then called to load
each of the images. If the width of the input image is not a power of
two, then the image is scaled to the nearest power of two before the
mipmaps are generated. A return value of zero indicates success.
Otherwise, a GLU error code is returned (see
[**gluErrorString**](gluerrorstring.md)). For a description of the
acceptable values for the *format* parameter, see **glTexImage1D**.
For a description of the acceptable values for the *type* parameter,
see [**glDrawPixels**](gldrawpixels.md).


%index
gluBuild2DMipmaps
The gluBuild2DMipmaps function creates 2-D mipmaps.
%group
Win32 glu32
%prm
target, components, width, height, format, type, data
target : [int] The target texture. Must be GL\_TEXTURE\_2D.
components : [int] The number of color components in the texture. Must be 1, 2, 3, or 4.
width : [int] The width of the texture image.
height : [int] The height of the texture image.
format : [int] The format of the pixel data. Must be one of the following: GL\_COLOR\_INDEX, GL\_RED, GL\_GREEN, GL\_BLUE, GL\_ALPHA, GL\_RGB, GL\_RGBA, GL\_BGR\_EXT, GL\_BGRA\_EXT, GL\_LUMINANCE, or GL\_LUMINANCE\_ALPHA.
type : [int] The data type for *data*. Must be one of the following: GL\_UNSIGNED\_BYTE, GL\_BYTE, GL\_BITMAP, GL\_UNSIGNED\_SHORT, GL\_SHORT, GL\_UNSIGNED\_INT, GL\_INT, or GL\_FLOAT.
data : [intptr] A pointer to the image data in memory.
%inst
The gluBuild2DMipmaps function creates 2-D mipmaps.

[戻り値]
This function does not return a value.

[備考]
The **gluBuild2DMipmaps** function obtains the input image and
generates all mipmap images (using
[**gluScaleImage**](gluscaleimage.md)) so the input image can be used
as a mipmapped texture image. To load each of the images, call
[**glTexImage2D**](glteximage2d.md). If the dimensions of the input
image are not powers of two, then the image is scaled so that both
the width and height are powers of two before the mipmaps are
generated. A return value of zero indicates success. Otherwise, a GLU
error code is returned (see [**gluErrorString**](gluerrorstring.md)).
For a description of the acceptable values for the *format*
parameter, see **glTexImage2D**. For a description of the acceptable
values for *type*, see [**glDrawPixels**](gldrawpixels.md).


%index
gluCylinder
The gluCylinder function draws a cylinder.
%group
Win32 glu32
%prm
qobj, baseRadius, topRadius, height, slices, stacks
qobj : [intptr] The quadric object (created with [**gluNewQuadric**](glunewquadric.md)).
baseRadius : [double] The radius of the cylinder at *z* = 0.
topRadius : [double] The radius of the cylinder at *z* = *height*.
height : [double] The height of the cylinder.
slices : [int] The number of subdivisions around the z-axis.
stacks : [int] The number of subdivisions along the z-axis.
%inst
The gluCylinder function draws a cylinder.

[戻り値]
This function does not return a value.

[備考]
The **gluCylinder** function draws a cylinder oriented along the
z-axis. The base of the cylinder is placed at *z* = 0, and the top at
*z* = *height*. Like a sphere, a cylinder is subdivided around the
z-axis into slices, and along the z-axis into stacks. Note that if
*topRadius* is set to zero, then this routine will generate a cone.
If the orientation is set to GLU\_OUTSIDE (with
[**gluQuadricOrientation**](gluquadricorientation.md)), then any
generated normals point away from the z-axis. Otherwise, they point
toward the z-axis. If texturing is turned on (with
[**gluQuadricTexture**](gluquadrictexture.md)): texture coordinates
are generated so that *t* ranges linearly from 0.0 at *z* = 0 to 1.0
at *z* = *height*; and *s* ranges from 0.0 at the positive y-axis, to
0.25 at the positive x-axis, to 0.5 at the negative y-axis, to 0.75
at the negative x-axis, and back to 1.0 at the positive y-axis.


%index
gluDeleteNurbsRenderer
The gluDeleteNurbsRenderer function destroys a Non-Uniform Rational B-Spline (NURBS) object.
%group
Win32 glu32
%prm
nobj
nobj : [intptr] The NURBS object to be destroyed (created with **gluNewNurbsRenderer**).
%inst
The gluDeleteNurbsRenderer function destroys a Non-Uniform Rational
B-Spline (NURBS) object.

[戻り値]
This function does not return a value.

[備考]
The **gluDeleteNurbsRenderer** function destroys the NURBS object and
frees any memory that it used. After you have called
**gluDeleteNurbsRenderer**, you cannot use *nobj* again.


%index
gluDeleteQuadric
The gluDeleteQuadric function destroys a quadric object.
%group
Win32 glu32
%prm
state
state : [intptr] The quadric object to be destroyed (created with [**gluNewQuadric**](glunewquadric.md)).
%inst
The gluDeleteQuadric function destroys a quadric object.

[戻り値]
This function does not return a value.

[備考]
The **gluDeleteQuadric** function destroys the quadric object and
frees any memory that it used. After you have called
**gluDeleteQuadric**, you cannot use *state* again.


%index
gluDeleteTess
The gluDeleteTess function destroys a tessellation object.
%group
Win32 glu32
%prm
tess
tess : [intptr] The tessellation object to destroy (created with [**gluNewTess**](glunewtess.md)).
%inst
The gluDeleteTess function destroys a tessellation object.

[戻り値]
This function does not return a value.

[備考]
The **gluDeleteTess** function destroys the indicated tessellation
object and frees any memory that it used.


%index
gluDisk
The gluDisk function draws a disk.
%group
Win32 glu32
%prm
qobj, innerRadius, outerRadius, slices, loops
qobj : [intptr] The quadric object (created with [**gluNewQuadric**](glunewquadric.md)).
innerRadius : [double] The inner radius of the disk (may be zero).
outerRadius : [double] The outer radius of the disk.
slices : [int] The number of subdivisions around the z-axis.
loops : [int] The number of concentric rings about the origin into which the disk is subdivided.
%inst
The gluDisk function draws a disk.

[戻り値]
This function does not return a value.

[備考]
The **gluDisk** function renders a disk on the *z* = 0 plane. The
disk has a radius of *outerRadius*, and contains a concentric
circular hole with a radius of *innerRadius*. If *innerRadius* is 0,
then no hole is generated. The disk is subdivided around the z-axis
into slices (like pizza slices) and also about the z-axis into rings
(as specified by *slices* and *loops*, respectively). With respect to
orientation, the positive *z*-side of the disk is considered to be
*outside* (see
[**gluQuadricOrientation**](gluquadricorientation.md)). This means
that if the orientation is set to GLU\_OUTSIDE, then any normals
generated point along the positive z-axis. If texturing is turned on
(with [**gluQuadricTexture**](gluquadrictexture.md)), texture
coordinates are generated linearly such that where *r* =
*outerRadius*, the value at (*r*, 0, 0) is (1, 0.5); at (0, *r*, 0)
it is (0.5, 1); at (-*r*, 0, 0) it is (0, 0.5); and at (0, -*r*, 0)
it is (0.5, 0).


%index
gluEndCurve
The gluBeginCurve and gluEndCurve functions delimit a Non-Uniform Rational B-Spline (NURBS) curve definition. | gluEndCurve function (Glu.h)
%group
Win32 glu32
%prm
nobj
nobj : [intptr] The NURBS object (created with [**gluNewNurbsRenderer**](glunewnurbsrenderer.md)).
%inst
The gluBeginCurve and gluEndCurve functions delimit a Non-Uniform
Rational B-Spline (NURBS) curve definition. | gluEndCurve function
(Glu.h)

[戻り値]
This function does not return a value.

[備考]
Use [**gluBeginCurve**](glubegincurve.md) to mark the beginning of a
NURBS curve definition. After calling **gluBeginCurve**, make one or
more calls to [**gluNurbsCurve**](glunurbscurve.md) to define the
attributes of the curve. Exactly one of the calls to
**gluNurbsCurve** must have a curve type of GL\_MAP1\_VERTEX\_3 or
GL\_MAP1\_VERTEX\_4. To mark the end of the NURBS curve definition,
call **gluEndCurve**. OpenGL evaluators are used to render the NURBS
curve as a series of line segments. Evaluator state is preserved
during rendering with [**glPushAttrib**](glpushattrib.md)
(GL\_EVAL\_BIT ) and [**glPopAttrib**](glpopattrib.md). For
information on exactly what state these calls preserve, see
**glPushAttrib**.


%index
gluEndPolygon
The gluBeginPolygon and gluEndPolygon functions delimit a polygon description. | gluEndPolygon function (Glu.h)
%group
Win32 glu32
%prm
tess
tess : [intptr] The tessellation object (created with [**gluNewTess**](glunewtess.md)).
%inst
The gluBeginPolygon and gluEndPolygon functions delimit a polygon
description. | gluEndPolygon function (Glu.h)

[戻り値]
This function does not return a value.

[備考]
Use [**gluBeginPolygon**](glubeginpolygon.md) and **gluEndPolygon**
to delimit the definition of a nonconvex polygon. 1. Call
**gluBeginPolygon**. 2. Define the contours of the polygon by calling
[**gluTessVertex**](glutessvertex.md) for each vertex and
[**gluNextContour**](glunextcontour.md) to start each new contour. 3.
Call **gluEndPolygon** to signal the end of the definition. Once
**gluEndPolygon** is called, the polygon is tessellated, and the
resulting triangles are described through callbacks. For descriptions
of the callback functions, see [*gluTessCallback*](glutess.md).


%index
gluEndSurface
The gluBeginSurface and gluEndSurface functions delimit a Non-Uniform Rational B-Spline (NURBS) surface definition. | gluEndSurface function (Glu.h)
%group
Win32 glu32
%prm
nobj
nobj : [intptr] The NURBS object (created with [**gluNewNurbsRenderer**](glunewnurbsrenderer.md)).
%inst
The gluBeginSurface and gluEndSurface functions delimit a Non-Uniform
Rational B-Spline (NURBS) surface definition. | gluEndSurface
function (Glu.h)

[戻り値]
This function does not return a value.

[備考]
The [**gluBeginSurface**](glubeginsurface.md) and **gluEndSurface**
functions mark the beginning and end of NURBS surface definitions,
which are defined with calls to **gluNurbsSurface**. 1. Call
**gluBeginSurface** to mark the beginning of a NURBS surface
definition. 2. Make one or more calls to **gluNurbsSurface** to
define the attributes of the surface. Exactly one of these calls to
**gluNurbsSurface** must have a surface type of GL\_MAP2\_VERTEX\_3
or GL\_MAP2\_VERTEX\_4. 3. To mark the end of the NURBS surface
definition, call **gluEndSurface**. The
[**gluBeginTrim**](glubegintrim.md),
[**gluPwlCurve**](glupwlcurve.md),
[**gluNurbsCurve**](glunurbscurve.md), and **gluEndTrim** functions
support trimming of NURBS surfaces. Use OpenGL evaluators to render
the NURBS surface as a set of polygons. Preserve the evaluator state
during rendering with [**glPushAttrib**](glpushattrib.md)
(GL\_EVAL\_BIT) and [**glPopAttrib**](glpopattrib.md).


%index
gluEndTrim
The gluBeginTrim and gluEndTrim functions delimit a Non-Uniform Rational B-Spline (NURBS) trimming loop definition. | gluEndTrim function (Glu.h)
%group
Win32 glu32
%prm
nobj
nobj : [intptr] The NURBS object (created with [**gluNewNurbsRenderer**](glunewnurbsrenderer.md)).
%inst
The gluBeginTrim and gluEndTrim functions delimit a Non-Uniform
Rational B-Spline (NURBS) trimming loop definition. | gluEndTrim
function (Glu.h)

[戻り値]
This function does not return a value.

[備考]
Use [**gluBeginTrim**](glubegintrim.md) to mark the beginning of a
trimming loop, and **gluEndTrim** to mark the end of a trimming loop.
A trimming loop is a set of oriented curve segments (forming a closed
curve) that define boundaries of a NURBS surface. You include these
trimming loops in the definition of a NURBS surface, between calls to
[**gluBeginSurface**](glubeginsurface.md) and
[**gluEndSurface**](gluendsurface.md). The definition for a NURBS
surface can contain many trimming loops. For example, if you write a
definition for a NURBS surface that resembles a rectangle with a hole
punched out, the definition would contain two trimming loops. One
loop would define the outer edge of the rectangle; the other would
define the punched-out hole. The definitions of each of these
trimming loops would be bracketed by a
[**gluBeginTrim**](glubegintrim.md) / **gluEndTrim** pair. The
definition of a single closed trimming loop can consist of multiple
curve segments, each described as a series of line segments that form
a linear curve (see [**gluPwlCurve**](glupwlcurve.md)), as a single
NURBS curve (see [**gluNurbsCurve**](glunurbscurve.md)), or as a
combination of both in any order. The only library calls that can
appear in a trimming-loop definition (between the calls to
[**gluBeginTrim**](glubegintrim.md) and **gluEndTrim**) are
**gluPwlCurve** and **gluNurbsCurve**. The displayed area of the
NURBS surface is the region in the domain to the left of the trimming
curve as the curve parameter increases. Thus, the retained region of
the NURBS surface is inside a counterclockwise trimming loop and
outside a clockwise trimming loop. For the rectangle mentioned
earlier, the trimming loop for the outer edge of the rectangle runs
counterclockwise, while the trimming loop for the punched-out hole
runs clockwise. If you use more than one curve to define a single
trimming loop, the curve segments must form a closed loop (that is,
the endpoint of each curve must be the starting point of the next
curve, and the endpoint of the final curve must be the starting point
of the first curve). If the endpoints of the curve are sufficiently
close together but not exactly coincident, they will be forced to
match. If the endpoints are not sufficiently close, an error results
(see [*gluNurbsCallback*](glunurbs.md)). If a trimming-loop
definition contains multiple curves, the direction of the curves must
be consistent (that is, the inside must be to the left of all of the
curves). You can use nested trimming loops as long as the curve
orientations alternate correctly. Trimming curves cannot be
self-intersecting, nor can they intersect one another (or an error
results). If no trimming information is given for a NURBS surface,
the entire surface is drawn.


%index
gluErrorString
The gluErrorString function produces an error string from an OpenGL or GLU error code. The error string is ANSI only.
%group
Win32 glu32
%prm
errCode
errCode : [int] An OpenGL or GLU error code.
%inst
The gluErrorString function produces an error string from an OpenGL
or GLU error code. The error string is ANSI only.

[備考]
The **gluErrorString** function produces an error string from an
OpenGL or GLU error code. The string is in an ISO Latin 1 format. For
example, **gluErrorString**(GL\_OUT\_OF\_MEMORY) returns the string
"out of memory". The standard GLU error codes are GLU\_INVALID\_ENUM,
GLU\_INVALID\_VALUE, and GLU\_OUT\_OF\_MEMORY. Certain other GLU
functions can return specialized error codes through callbacks. For
the list of OpenGL error codes, see [**glGetError**](glgeterror.md).
The **gluErrorString** function produces error strings in ANSI only.
Whenever possible, use **gluErrorStringWIN**, which allows ANSI or
Unicode error strings. This makes it easier to localize your program
for use with another language.


%index
gluErrorUnicodeStringEXT
(no summary)
%group
Win32 glu32
%prm
errCode
errCode : [int] 
%inst



%index
gluGetNurbsProperty
The gluGetNurbsProperty function gets a Non-Uniform Rational B-Spline (NURBS) property.
%group
Win32 glu32
%prm
nobj, property, value
nobj : [intptr] The NURBS object (created with [**gluNewNurbsRenderer**](glunewnurbsrenderer.md)).
property : [int] The property whose value is to be retrieved. The following values are valid: GLU\_SAMPLING\_TOLERANCE, GLU\_DISPLAY\_MODE, GLU\_CULLING, GLU\_AUTO\_LOAD\_MATRIX, GLU\_PARAMETRIC\_TOLERANCE, GLU\_SAMPLING\_METHOD, GLU\_U\_STEP, and GLU\_V\_STEP.
value : [var] A pointer to the location into which the value of the named property is written.
%inst
The gluGetNurbsProperty function gets a Non-Uniform Rational B-Spline
(NURBS) property.

[戻り値]
This function does not return a value.

[備考]
Use **gluGetNurbsProperty** to retrieve properties stored in a NURBS
object. These properties affect the way NURBS curves and surfaces are
rendered. For information about NURBS properties, see
[**gluNurbsProperty**](glunurbsproperty.md).


%index
gluGetString
The gluGetString function gets a string that describes the GLU version number or supported GLU extension calls.
%group
Win32 glu32
%prm
name
name : [int] Either the version number of GLU (GLU\_VERSION) or available vendor-specific extension calls (GLU\_EXTENSIONS).
%inst
The gluGetString function gets a string that describes the GLU
version number or supported GLU extension calls.

[備考]
The **gluGetString** function returns a pointer to a static,
null-terminated string. When *name* is GLU\_VERSION, the returned
string is a value that represents the version number of GLU. The
format of the version number is as follows:
This doc was truncated.


%index
gluGetTessProperty
The gluGetTessProperty function gets a tessellation object property.
%group
Win32 glu32
%prm
tess, which, value
tess : [intptr] The tessellation object (created with [**gluNewTess**](glunewtess.md)).
which : [int] The property whose value is to be retrieved. The following values are valid: GLU\_TESS\_WINDING\_RULE, GLU\_TESS\_BOUNDARY\_ONLY, and GLU\_TESS\_TOLERANCE.
value : [var] A pointer to the location where the value of the named property is written.
%inst
The gluGetTessProperty function gets a tessellation object property.

[戻り値]
This function does not return a value.

[備考]
Use **gluGetTessProperty** to retrieve properties stored in a
tessellation object. These properties affect the way tessellation
objects are interpreted and rendered. For information about what the
properties are and what they do, see
[**gluTessProperty**](glutessproperty.md).


%index
gluLoadSamplingMatrices
The gluLoadSamplingMatrices function loads Non-Uniform Rational B-Spline (NURBS) sampling and culling matrices.
%group
Win32 glu32
%prm
nobj, modelMatrix, projMatrix, viewport
nobj : [intptr] The NURBS object (created with [**gluNewNurbsRenderer**](glunewnurbsrenderer.md)).
modelMatrix : [var] A modelview matrix (as from a [**glGetFloatv**](glgetfloatv.md) call).
projMatrix : [var] A projection matrix (as from a **glGetFloatv** call).
viewport : [var] A viewport (as from a [**glGetIntegerv**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md) call).
%inst
The gluLoadSamplingMatrices function loads Non-Uniform Rational
B-Spline (NURBS) sampling and culling matrices.

[戻り値]
This function does not return a value.

[備考]
The **gluLoadSamplingMatrices** function uses *modelMatrix*,
*projMatrix*, and *viewport* to recompute the sampling and culling
matrices stored in *nobj*. The sampling matrix determines how finely
a NURBS curve or surface must be tessellated to satisfy the sampling
tolerance (as determined by the GLU\_SAMPLING\_TOLERANCE property).
The culling matrix is used in deciding if a NURBS curve or surface
should be culled before rendering (when the GLU\_CULLING property is
turned on). The **gluLoadSamplingMatrices** function is necessary
only if the GLU\_AUTO\_LOAD\_MATRIX property is turned off (see
[**gluNurbsProperty**](glunurbsproperty.md)). Although it can be
convenient to leave the GLU\_AUTO\_LOAD\_MATRIX property turned on,
doing so necessitates a round trip to the OpenGL server to get the
current values of the modelview matrix, projection matrix, and
viewport.)


%index
gluLookAt
The gluLookAt function defines a viewing transformation.
%group
Win32 glu32
%prm
eyex, eyey, eyez, centerx, centery, centerz, upx, upy, upz
eyex : [double] The position of the eye point.
eyey : [double] The position of the eye point.
eyez : [double] The position of the eye point.
centerx : [double] The position of the reference point.
centery : [double] The position of the reference point.
centerz : [double] The position of the reference point.
upx : [double] The direction of the up vector.
upy : [double] The direction of the up vector.
upz : [double] The direction of the up vector.
%inst
The gluLookAt function defines a viewing transformation.

[戻り値]
This function does not return a value.

[備考]
The **gluLookAt** function creates a viewing matrix derived from an
eye point, a reference point indicating the center of the scene, and
an up vector. The matrix maps the reference point to the negative
z-axis and the eye point to the origin, so that when you use a
typical projection matrix, the center of the scene maps to the center
of the viewport. Similarly, the direction described by the up vector
projected onto the viewing plane is mapped to the positive y-axis so
that it points upward in the viewport. The up vector must not be
parallel to the line of sight from the eye to the reference point.
The matrix generated by **gluLookAt** postmultiplies the current
matrix.


%index
gluNewNurbsRenderer
The gluNewNurbsRenderer function creates a Non-Uniform Rational B-Spline (NURBS) object.
%group
Win32 glu32
%prm

%inst
The gluNewNurbsRenderer function creates a Non-Uniform Rational
B-Spline (NURBS) object.

[備考]
This function has no parameters.
The **gluNewNurbsRenderer** function creates and returns a pointer to
a new NURBS object. Refer to this object when calling NURBS rendering
and control functions. A return value of zero means there is not
enough memory to allocate to the object.


%index
gluNewQuadric
The gluNewQuadric function creates a quadric object.
%group
Win32 glu32
%prm

%inst
The gluNewQuadric function creates a quadric object.

[備考]
This function has no parameters.
The **gluNewQuadric** function creates and returns a pointer to a new
quadric object. Refer to this object when calling quadric rendering
and control functions. A return value of zero means there is not
enough memory to allocate to the object.


%index
gluNewTess
The gluNewTess function creates a tessellation object.
%group
Win32 glu32
%prm

%inst
The gluNewTess function creates a tessellation object.

[備考]
This function has no parameters.
The **gluNewTess** function creates and returns a pointer to a new
tessellation object. Refer to this object when calling tessellation
functions. A return value of zero means there is not enough memory to
allocate to the object.


%index
gluNextContour
The gluNextContour function marks the beginning of another contour.
%group
Win32 glu32
%prm
tess, type
tess : [intptr] The tessellation object (created with [**gluNewTess**](glunewtess.md)).
type : [int] The type of the contour being defined. The following values are valid.
%inst
The gluNextContour function marks the beginning of another contour.

[戻り値]
This function does not return a value.

[備考]
Use the **gluNextContour** function to describe polygons with
multiple contours. After you describe the first contour through a
series of [**gluTessVertex**](glutessvertex.md) calls, a
**gluNextContour** call indicates that the previous contour is
complete and that the next contour is about to begin. Perform another
series of **gluTessVertex** calls to describe the new contour. Repeat
this process until all contours have been described. The *type*
parameter defines what type of contour follows. To define the type of
the first contour, you can call **gluNextContour** before describing
the first contour. If you do not call **gluNextContour** before the
first contour, the first contour is marked GLU\_EXTERIOR.


%index
gluNurbsCallback
The gluNurbsCallback function defines a callback for a Non-Uniform Rational B-Spline (NURBS) object.
%group
Win32 glu32
%prm
nobj, which, fn
nobj : [intptr] The NURBS object (created with [**gluNewNurbsRenderer**](glunewnurbsrenderer.md)).
which : [int] The callback being defined. The only valid value is GLU\_ERROR. The meaning of GLU\_ERROR means that the error function is called when an error is encountered. Its single argument is of type **GLenum**, and it indicates the specific error that occurred. There are 37 errors unique to NURBS, named GLU\_NURBS\_ERROR1 through GLU\_NURBS\_ERROR37. Character strings describing these errors can be retrieved with [**gluErrorString**](gluerrorstring.md).
fn : [int] A pointer to the callback function.
%inst
The gluNurbsCallback function defines a callback for a Non-Uniform
Rational B-Spline (NURBS) object.

[戻り値]
This function does not return a value.

[備考]
Use **gluNurbsCallback** to define a callback to be used by a NURBS
object. If the specified callback is already defined, it is replaced.
If *fn* is **NULL**, then any existing callback is erased.


%index
gluNurbsCurve
The gluNurbsCurve function defines the shape of a Non-Uniform Rational B-Spline (NURBS) curve.
%group
Win32 glu32
%prm
nobj, nknots, knot, stride, ctlarray, order, type
nobj : [intptr] The NURBS object (created with [**gluNewNurbsRenderer**](glunewnurbsrenderer.md)).
nknots : [int] The number of knots in *knot*. The *nknots* parameter equals the number of control points plus the order.
knot : [var] An array of *nknots* nondecreasing knot values.
stride : [int] The offset (as a number of single-precision floating-point values) between successive curve control points.
ctlarray : [var] A pointer to an array of control points. The coordinates must agree with *type*.
order : [int] The order of the NURBS curve. The *order* parameter equals degree + 1; hence a cubic curve has an order of 4.
type : [int] The type of the curve. If this curve is defined within a [**gluBeginCurve**](glubegincurve.md)/[**gluEndCurve**](gluendcurve.md) pair, then the type can be any of the valid one-dimensional evaluator types (such as GL\_MAP1\_VERTEX\_3 or GL\_MAP1\_COLOR\_4). Between a [**gluBeginTrim**](glubegintrim.md)/[**gluEndTrim**](gluendtrim.md) pair, the only valid types are GLU\_MAP1\_TRIM\_2 and GLU\_MAP1\_TRIM\_3.
%inst
The gluNurbsCurve function defines the shape of a Non-Uniform
Rational B-Spline (NURBS) curve.

[戻り値]
This function does not return a value.

[備考]
When **gluNurbsCurve** appears between a
**gluBeginCurve**/**gluEndCurve** pair, it describes a curve to be
rendered. You associate positional, texture, and color coordinates by
presenting each as a separate **gluNurbsCurve** between a
**gluBeginCurve**/**gluEndCurve** pair. Do not make more than one
call to **gluNurbsCurve** for color, position, and texture data
within a single **gluBeginCurve**/**gluEndCurve** pair. Make exactly
one call to describe the position of the curve (a *type* of
GL\_MAP1\_VERTEX\_3 or GL\_MAP1\_VERTEX\_4). When **gluNurbsCurve**
appears between a
[**gluBeginTrim**](glubegintrim.md)/[**gluEndTrim**](gluendtrim.md)
pair, it describes a trimming curve on a NURBS surface. If *type* is
GLU\_MAP1\_TRIM\_2, it describes a curve in two-dimensional (*u* and
*v*) parameter space. If it is GLU\_MAP1\_TRIM\_3, it describes a
curve in two-dimensional homogeneous (*u*, *v*, and *w*) parameter
space. For more discussion about trimming curves, see
**gluBeginTrim**.


%index
gluNurbsProperty
The gluNurbsProperty function sets a Non-Uniform Rational B-Spline (NURBS) property.
%group
Win32 glu32
%prm
nobj, property, value
nobj : [intptr] The NURBS object (created with [**gluNewNurbsRenderer**](glunewnurbsrenderer.md)).
property : [int] The property to be set. The following values are valid:
value : [float] The value to which to set the indicated property. The *value* parameter can be a numeric value or one of the following three values: GLU\_PATH\_LENGTH, GLU\_PARAMETRIC\_ERROR, or GLU\_DOMAIN\_DISTANCE.
%inst
The gluNurbsProperty function sets a Non-Uniform Rational B-Spline
(NURBS) property.

[戻り値]
This function does not return a value.

[備考]
Use **gluNurbsProperty** to control properties stored in a NURBS
object. These properties affect the way a NURBS curve is rendered.


%index
gluNurbsSurface
The gluNurbsSurface function defines the shape of a Non-Uniform Rational B-Spline (NURBS) surface.
%group
Win32 glu32
%prm
nobj, sknot_count, sknot, tknot_count, tknot, s_stride, t_stride, ctlarray, sorder, torder, type
nobj : [intptr] The NURBS object (created with [**gluNewNurbsRenderer**](glunewnurbsrenderer.md)).
sknot_count : [int] 
sknot : [var] An array of *sknot\_count* nondecreasing knot values in the parametric *u* direction.
tknot_count : [int] 
tknot : [var] An array of *tknot\_count* nondecreasing knot values in the parametric *v* direction.
s_stride : [int] 
t_stride : [int] 
ctlarray : [var] An array containing control points for the NURBS surface. The offsets between successive control points in the parametric *u* and *v* directions are given by *s\_stride* and *t\_stride*.
sorder : [int] The order of the NURBS surface in the parametric *u* direction. The order is one more than the degree, hence a surface that is cubic in *u* has a *u* order of 4.
torder : [int] The order of the NURBS surface in the parametric *v* direction. The order is one more than the degree, hence a surface that is cubic in *v* has a *v* order of 4.
type : [int] The type of the surface. The *type* parameter can be any of the valid two-dimensional evaluator types (such as GL\_MAP2\_VERTEX\_3 or GL\_MAP2\_COLOR\_4).
%inst
The gluNurbsSurface function defines the shape of a Non-Uniform
Rational B-Spline (NURBS) surface.

[戻り値]
This function does not return a value.

[備考]
Use **gluNurbsSurface** within a NURBS surface definition to describe
the shape of a NURBS surface (before any trimming). To mark the
beginning of a NURBS surface definition, use the
[**gluBeginSurface**](glubeginsurface.md) function. To mark the end
of a NURBS surface definition, use the
[**gluEndSurface**](gluendsurface.md) function. Call
**gluNurbsSurface** within a NURBS surface definition only. You
associate positional, texture, and color coordinates with a surface
by presenting each as a separate **gluNurbsSurface** between a
**gluBeginSurface**/**gluEndSurface** pair. Within a single
**gluBeginSurface**/**gluEndSurface** pair, you can make only one
call to **gluNurbsSurface** for color, position, and texture data.
Make exactly one call to describe the position of the surface (a
*type* of GL\_MAP2\_VERTEX\_3 or GL\_MAP2\_VERTEX\_4). You can trim a
NURBS surface by using the [**gluNurbsCurve**](glunurbscurve.md) and
[**gluPwlCurve**](glupwlcurve.md) functions between calls to
[**gluBeginTrim**](glubegintrim.md) and
[**gluEndTrim**](gluendtrim.md). A **gluNurbsSurface** with
*sknot\_count* knots in the *u* direction and *tknot\_count* knots in
the *v* direction with orders *sorder* and *torder* must have
(*sknot\_count* -*sorder*) multipied by (*tknot\_count* -*torder*)
control points.


%index
gluOrtho2D
The gluOrtho2D function defines a 2-D orthographic projection matrix.
%group
Win32 glu32
%prm
left, right, bottom, top
left : [double] The coordinate for the left vertical clipping plane.
right : [double] The coordinate for the right vertical clipping plane.
bottom : [double] The coordinate for the bottom horizontal clipping plane.
top : [double] The coordinate for the top horizontal clipping plane.
%inst
The gluOrtho2D function defines a 2-D orthographic projection matrix.

[戻り値]
This function does not return a value.

[備考]
The **gluOrtho2D** function sets up a two-dimensional orthographic
viewing region. This is equivalent to calling
[**glOrtho**](glortho.md) with zNear = -1 and zFar = 1.


%index
gluPartialDisk
The gluPartialDisk function draws an arc of a disk.
%group
Win32 glu32
%prm
qobj, innerRadius, outerRadius, slices, loops, startAngle, sweepAngle
qobj : [intptr] A quadric object (created with [**gluNewQuadric**](glunewquadric.md)).
innerRadius : [double] The inner radius of the partial disk (can be zero).
outerRadius : [double] The outer radius of the partial disk.
slices : [int] The number of subdivisions around the z-axis.
loops : [int] The number of concentric rings about the origin into which the partial disk is subdivided.
startAngle : [double] The starting angle, in degrees, of the disk portion.
sweepAngle : [double] The sweep angle, in degrees, of the disk portion.
%inst
The gluPartialDisk function draws an arc of a disk.

[戻り値]
This function does not return a value.

[備考]
The **gluPartialDisk** function renders a partial disk on the *z* = 0
plane. A partial disk is similar to a full disk, except that only the
subset of the disk from *startAngle* through *startAngle* +
*sweepAngle* is included (where 0 degrees is along the positive
y-axis, 90 degrees is along the positive x-axis, 180 degrees is along
the negative y-axis, and 270 degrees is along the negative x-axis).
The partial disk has a radius of *outerRadius* and contains a
concentric circular hole with a radius of *innerRadius*. If
*innerRadius* is zero, then no hole is generated. The partial disk is
subdivided around the z-axis into slices (like pizza slices), and
also about the z-axis into rings (as specified by *slices* and
*loops*, respectively). With respect to orientation, the positive
z-side of the partial disk is considered to be outside (see
[**gluQuadricOrientation**](gluquadricorientation.md)). This means
that if the orientation is set to GLU\_OUTSIDE, then any normals
generated point along the positive z-axis. If you have turned on
texturing (with [**gluQuadricTexture**](gluquadrictexture.md)),
**gluPartialDisk** generates texture coordinates linearly such that
where *r* = *outerRadius*, the value at (*r*, 0, 0) is (1, 0.5); at
(0, *r*, 0) it is (0.5, 1); at (*r*, 0, 0) it is (0, 0.5); and at (0,
*r*, 0) it is (0.5, 0).


%index
gluPerspective
The gluPerspective function sets up a perspective projection matrix.
%group
Win32 glu32
%prm
fovy, aspect, zNear, zFar
fovy : [double] The field of view angle, in degrees, in the y-direction.
aspect : [double] The aspect ratio that determines the field of view in the x-direction. The aspect ratio is the ratio of *x* (width) to *y* (height).
zNear : [double] The distance from the viewer to the near clipping plane (always positive).
zFar : [double] The distance from the viewer to the far clipping plane (always positive).
%inst
The gluPerspective function sets up a perspective projection matrix.

[戻り値]
This function does not return a value.

[備考]
The **gluPerspective** function specifies a viewing frustum into the
world coordinate system. In general, the aspect ratio in
**gluPerspective** should match the aspect ratio of the associated
viewport. For example, *aspect* = 2.0 means the viewer's angle of
view is twice as wide in *x* as it is in *y*. If the viewport is
twice as wide as it is tall, it displays the image without
distortion. The matrix generated by **gluPerspective** is multiplied
by the current matrix, just as if [**glMultMatrix**](glmultmatrix.md)
were called with the generated matrix. To load the perspective matrix
onto the current matrix stack instead, precede the call to
**gluPerspective** with a call to
[**glLoadIdentity**](glloadidentity.md).


%index
gluPickMatrix
The gluPickMatrix function defines a picking region.
%group
Win32 glu32
%prm
x, y, width, height, viewport
x : [double] The x window coordinate of a picking region.
y : [double] The y window coordinate of a picking region.
width : [double] The width of the picking region in window coordinates.
height : [double] The height of the picking region in window coordinates.
viewport : [var] The current viewport (as from a [**glGetIntegerv**](glgetintegerv.md) call).
%inst
The gluPickMatrix function defines a picking region.

[戻り値]
This function does not return a value.

[備考]
The **gluPickMatrix** function creates a projection matrix you can
use to restrict drawing to a small region of the viewport. 1. Use
**gluPickMatrix** to restrict drawing to a small region around the
cursor. 2. Enter selection mode (with
[**glRenderMode**](glrendermode.md)), and then rerender the scene.
All primitives that would have been drawn near the cursor are
identified and stored in the selection buffer. The matrix created by
**gluPickMatrix** is multiplied by the current matrix just as if
[**glMultMatrix**](glmultmatrix.md) were called with the generated
matrix. 1. Call [**glLoadIdentity**](glloadidentity.md) to load an
identity matrix onto the perspective matrix stack. 2. Call
**gluPickMatrix**. 3. Call a function (such as
[**gluPerspective**](gluperspective.md)) to multiply the perspective
matrix by the pick matrix. When using **gluPickMatrix** to pick
Non-Uniform Rational B-Spline
([NURBS](using-nurbs-curves-and-surfaces.md)), be careful to turn off
the NURBS property, GLU\_AUTO\_LOAD\_MATRIX. If
GLU\_AUTO\_LOAD\_MATRIX is not turned off, any NURBS surface rendered
is subdivided differently with the pick matrix from how it was
subdivided without the pick matrix.


%index
gluProject
The gluProject function maps object coordinates to window coordinates.
%group
Win32 glu32
%prm
objx, objy, objz, modelMatrix, projMatrix, viewport, winx, winy, winz
objx : [double] The x object coordinate.
objy : [double] The y object coordinate.
objz : [double] The z object coordinate.
modelMatrix : [var] The current modelview matrix (as from a [**glGetDoublev**](glgetdoublev.md) call).
projMatrix : [var] The current projection matrix (as from a **glGetDoublev** call).
viewport : [var] The current viewport (as from a [**glGetIntegerv**](glgetintegerv.md) call).
winx : [var] The computed x window coordinate.
winy : [var] The computed y window coordinate.
winz : [var] The computed z window coordinate.
%inst
The gluProject function maps object coordinates to window
coordinates.

[戻り値]
If the function succeeds, the return value is GL\_TRUE. If the
function fails, the return value is GL\_FALSE.

[備考]
The **gluProject** function transforms the specified object
coordinates into window coordinates using *modelMatrix*,
*projMatrix*, and *viewport*. The result is stored in *winx*, *winy*,
and *winz*.


%index
gluPwlCurve
The gluPwlCurve function describes a piecewise linear Non-Uniform Rational B-Spline (NURBS) trimming curve.
%group
Win32 glu32
%prm
nobj, count, array, stride, type
nobj : [intptr] The NURBS object (created with [**gluNewNurbsRenderer**](glunewnurbsrenderer.md)).
count : [int] The number of points on the curve.
array : [var] An array containing the curve points.
stride : [int] The offset (a number of single-precision floating-point values) between points on the curve.
type : [int] The type of curve. Must be either GLU\_MAP1\_TRIM\_2 or GLU\_MAP1\_TRIM\_3.
%inst
The gluPwlCurve function describes a piecewise linear Non-Uniform
Rational B-Spline (NURBS) trimming curve.

[戻り値]
This function does not return a value.

[備考]
The **gluPwlCurve** function describes a piecewise linear trimming
curve for a NURBS surface. A piecewise linear curve consists of a
list of coordinates of points in the parameter space for the NURBS
surface to be trimmed. These points are connected with line segments
to form a curve. If the curve is an approximation to a real curve,
the points should be close enough that the resulting path appears
curved at the resolution used in the application. If *type* is
GLU\_MAP1\_TRIM\_2, it describes a curve in two-dimensional (*u* and
*v*) parameter space. If it is GLU\_MAP1\_TRIM\_3, then it describes
a curve in two-dimensional homogeneous (*u*, *v*, and *w*) parameter
space. For more information about trimming curves, see
[**gluBeginTrim**](glubegintrim.md).


%index
gluQuadricCallback
The gluQuadricCallback function defines a callback for a quadric object.
%group
Win32 glu32
%prm
qobj, which, fn
qobj : [intptr] The quadric object (created with [**gluNewQuadric**](glunewquadric.md)).
which : [int] The callback being defined. The only valid value is GLU\_ERROR.
fn : [int] The function to be called.
%inst
The gluQuadricCallback function defines a callback for a quadric
object.

[戻り値]
This function does not return a value.

[備考]
Use **gluQuadricCallback** to define a new callback to be used by a
quadric object. If the specified callback is already defined, it is
replaced. If *fn* is **NULL**, any existing callback is erased.


%index
gluQuadricDrawStyle
The gluQuadricDrawStyle function specifies the draw style desired for quadrics.
%group
Win32 glu32
%prm
quadObject, drawStyle
quadObject : [intptr] The quadric object (created with [**gluNewQuadric**](glunewquadric.md)).
drawStyle : [int] The desired draw style. The following values are valid.
%inst
The gluQuadricDrawStyle function specifies the draw style desired for
quadrics.

[戻り値]
This function does not return a value.

[備考]
The **gluQuadricDrawStyle** function specifies the draw style for
quadrics rendered with **quadObject**.


%index
gluQuadricNormals
The gluQuadricNormals function specifies what kind of normals are to be used for quadrics.
%group
Win32 glu32
%prm
quadObject, normals
quadObject : [intptr] The quadric object (created with [**gluNewQuadric**](glunewquadric.md)).
normals : [int] The desired type of normals. The following values are valid.
%inst
The gluQuadricNormals function specifies what kind of normals are to
be used for quadrics.

[戻り値]
This function does not return a value.

[備考]
The **gluQuadricNormals** function specifies what kind of normals are
to be used for quadrics rendered with **quadObject**.


%index
gluQuadricOrientation
The gluQuadricOrientation function specifies inside or outside orientation for quadrics.
%group
Win32 glu32
%prm
quadObject, orientation
quadObject : [intptr] The quadric object (created with [**gluNewQuadric**](glunewquadric.md)).
orientation : [int] The desired orientation. The following values are valid.
%inst
The gluQuadricOrientation function specifies inside or outside
orientation for quadrics.

[戻り値]
This function does not return a value.

[備考]
The **gluQuadricOrientation** function specifies what kind of
orientation is desired for quadrics rendered with **quadObject**. The
interpretation of outward and inward depends on the quadric being
drawn.


%index
gluQuadricTexture
The gluQuadricTexture function specifies whether quadrics are to be textured.
%group
Win32 glu32
%prm
quadObject, textureCoords
quadObject : [intptr] The quadric object (created with [**gluNewQuadric**](glunewquadric.md)).
textureCoords : [int] A flag indicating whether texture coordinates are to be generated. The following values are valid.
%inst
The gluQuadricTexture function specifies whether quadrics are to be
textured.

[戻り値]
This function does not return a value.

[備考]
The **gluQuadricTexture** function specifies whether texture
coordinates are to be generated for quadrics rendered with
**quadObject**. The manner in which texture coordinates are generated
depends upon the specific quadric rendered.


%index
gluScaleImage
The gluScaleImage function scales an image to an arbitrary size.
%group
Win32 glu32
%prm
format, widthin, heightin, typein, datain, widthout, heightout, typeout, dataout
format : [int] The format of the pixel data. The following symbolic values are valid: GL\_COLOR\_INDEX, GL\_STENCIL\_INDEX, GL\_DEPTH\_COMPONENT, GL\_RED, GL\_GREEN, GL\_BLUE, GL\_ALPHA, GL\_RGB, GL\_RGBA, GL\_BGR\_EXT, GL\_BGRA\_EXT, GL\_LUMINANCE, and GL\_LUMINANCE\_ALPHA.
widthin : [int] The width of the source image that is scaled.
heightin : [int] The height of the source image that is scaled.
typein : [int] The data type for *datain*. Must be one of the following: GL\_UNSIGNED\_BYTE, GL\_BYTE, GL\_BITMAP, GL\_UNSIGNED\_SHORT, GL\_SHORT, GL\_UNSIGNED\_INT, GL\_INT, or GL\_FLOAT.
datain : [intptr] A pointer to the source image.
widthout : [int] The width of the destination image.
heightout : [int] The height of the destination image.
typeout : [int] The data type for *dataout*. Must be one of the following: GL\_UNSIGNED\_BYTE, GL\_BYTE, GL\_BITMAP, GL\_UNSIGNED\_SHORT, GL\_SHORT, GL\_UNSIGNED\_INT, GL\_INT, or GL\_FLOAT.
dataout : [intptr] A pointer to the destination image.
%inst
The gluScaleImage function scales an image to an arbitrary size.

[戻り値]
If the function succeeds, the return value is zero. If the function
fails, the return value is a GLU error code (see
[**gluErrorString**](gluerrorstring.md)).

[備考]
The **gluScaleImage** function scales a pixel image using the
appropriate pixel store modes to unpack data from the source image
and pack data into the destination image. When shrinking an image,
**gluScaleImage** uses a box filter to sample the source image and
create pixels for the destination image. When magnifying an image,
the pixels from the source image are linearly interpolated to create
the destination image. For a description of the acceptable values for
the *format*, *typein*, and *typeout* parameters, see
[**glReadPixels**](glreadpixels.md).


%index
gluSphere
The gluSphere function draws a sphere.
%group
Win32 glu32
%prm
qobj, radius, slices, stacks
qobj : [intptr] The quadric object (created with [**gluNewQuadric**](glunewquadric.md)).
radius : [double] The radius of the sphere.
slices : [int] The number of subdivisions around the z-axis (similar to lines of longitude).
stacks : [int] The number of subdivisions along the z-axis (similar to lines of latitude).
%inst
The gluSphere function draws a sphere.

[戻り値]
This function does not return a value.

[備考]
The **gluSphere** function draws a sphere of the given radius
centered around the origin. The sphere is subdivided around the
z-axis into slices and along the z-axis into stacks (similar to lines
of longitude and latitude). If the orientation is set to GLU\_OUTSIDE
(with **gluQuadricOrientation**), any normals generated point away
from the center of the sphere. Otherwise, they point toward the
center of the sphere. If texturing is turned on (with
**gluQuadricTexture**): texture coordinates are generated so that *t*
ranges from 0.0 at *z* = -*radius* to 1.0 at *z* = *radius* (*t*
increases linearly along longitudinal lines); and *s* ranges from 0.0
at the positive y-axis, to 0.25 at the positive x-axis, to 0.5 at the
negative y-axis, to 0.75 at the negative x-axis, and back to 1.0 at
the positive y-axis.


%index
gluTessBeginContour
The gluTessBeginContour and gluTessEndContour functions delimit a contour description. | gluTessBeginContour function (Glu.h)
%group
Win32 glu32
%prm
tess
tess : [intptr] The tessellation object (created with [**gluNewTess**](glunewtess.md)).
%inst
The gluTessBeginContour and gluTessEndContour functions delimit a
contour description. | gluTessBeginContour function (Glu.h)

[戻り値]
This function does not return a value.

[備考]
The **gluTessBeginContour** and
[**gluTessEndPolygon**](glutessendpolygon.md) functions delimit the
definition of a polygon contour. Within each
**gluTessBeginContour**/**gluTessEndPolygon** pair, there can be zero
or more calls to [**gluTessVertex**](glutessvertex.md). The vertexes
specify a closed contour (the last vertex of each contour is
automatically linked to the first). You can call
**gluTessBeginContour** only between
[**gluTessBeginPolygon**](glutessbeginpolygon.md) and
**gluTessEndPolygon**.


%index
gluTessBeginPolygon
The gluTessBeginPolygon and gluTessEndPolygon functions delimit a polygon description. | gluTessBeginPolygon function (Glu.h)
%group
Win32 glu32
%prm
tess, polygon_data
tess : [intptr] The tessellation object (created with [**gluNewTess**](glunewtess.md)).
polygon_data : [intptr] 
%inst
The gluTessBeginPolygon and gluTessEndPolygon functions delimit a
polygon description. | gluTessBeginPolygon function (Glu.h)

[戻り値]
This function does not return a value.

[備考]
The **gluTessBeginPolygon** and
[**gluTessEndPolygon**](glutessendpolygon.md) functions delimit the
definition of a nonconvex polygon. Within each
**gluTessBeginPolygon** / **gluTessEndPolygon** pair, include one or
more calls to [**gluTessBeginContour**](glutessbegincontour.md).
Within each contour, there are zero or more calls to
[**gluTessVertex**](glutessvertex.md). The vertexes specify a closed
contour (the last vertex of each contour is automatically linked to
the first). The *polygon\_data* parameter is a pointer to a
programmer-defined data structure. If the appropriate callbacks are
specified (see [*gluTessCallback*](glutess.md)), this pointer is
returned to the callback function or functions, making it a
convenient way to store per-polygon information. When you call
[**gluTessEndPolygon**](glutessendpolygon.md), the polygon is
tessellated, and the resulting triangles are described through
callbacks. For descriptions of the callback functions, see
[*gluTessCallback*](glutess.md).


%index
gluTessCallback
The gluTessCallback function defines a callback for a tessellation object.
%group
Win32 glu32
%prm
tess, which, fn
tess : [intptr] The tessellation object (created with [**gluNewTess**](glunewtess.md)).
which : [int] The callback being defined. The following values are valid: GLU\_TESS\_BEGIN, GLU\_TESS\_BEGIN\_DATA, GLU\_TESS\_EDGE\_FLAG, GLU\_TESS\_EDGE\_FLAG\_DATA, GLU\_TESS\_VERTEX, GLU\_TESS\_VERTEX\_DATA, GLU\_TESS\_END, GLU\_TESS\_END\_DATA, GLU\_TESS\_COMBINE, GLU\_TESS\_COMBINE\_DATA, GLU\_TESS\_ERROR, and GLU\_TESS\_ERROR\_DATA. For more information on these callbacks, see the following Remarks section.
fn : [int] The function to be called.
%inst
The gluTessCallback function defines a callback for a tessellation
object.

[戻り値]
This function does not return a value.

[備考]
Use **gluTessCallback** to specify a callback to be used by a
tessellation object. If the specified callback is already defined,
then it is replaced. If *fn* is **NULL**, then the existing callback
becomes undefined. The tessellation object uses these callbacks to
describe how a polygon that you specify is broken into triangles.
There are two versions of each callback, one with polygon data that
you can define and one without. If both versions of a particular
callback are specified, the callback with the polygon data you
specify will be used. The *polygon\_data* parameter of
[**gluTessBeginPolygon**](glutessbeginpolygon.md) is a copy of the
pointer that was specified when **gluTessBeginPolygon** was called.
The following are valid callbacks:
| Callback | Description | |----------|-------------| |
GLU_TESS_BEGIN | The GLU_TESS_BEGIN callback is invoked like glBegin
to indicate the start of a (triangle) primitive. The function takes a
single argument of type GLenum. If you set the GLU_TESS_BOUNDARY_ONLY
property to GL_FALSE, the argument is set to either GL_TRIANGLE_FAN,
GL_TRIANGLE_STRIP, or GL_TRIANGLES. If you set the
GLU_TESS_BOUNDARY_ONLY property to GL_TRUE, the argument is set to
GL_LINE_LOOP. The function prototype for this callback is as follows:
voidbegin (GLenumtype); | | GLU_TESS_BEGIN_DATA | GLU_TESS_BEGIN_DATA
is the same as the GLU_TESS_BEGIN callback except that it takes an
additional pointer argument. This pointer is identical to the opaque
pointer provided when you call gluTessBeginPolygon. The function
prototype for this callback is: voidbeginData (GLenumtype, void *
polygon_data); | | GLU_TESS_EDGE_FLAG | The GLU_TESS_EDGE_FLAG
callback is similar to glEdgeFlag. The function takes a single
Boolean flag that indicates which edges lie on the polygon boundary.
If the flag is GL_TRUE, then each vertex that follows begins an edge
that lies on the polygon boundary; that is, an edge which separates
an interior region from an exterior one. If the flag is GL_FALSE,
then each vertex that follows begins an edge that lies in the polygon
interior. The GLU_TESS_EDGE_FLAG callback (if defined) is invoked
before the first vertex callback is made. Because triangle fans and
triangle strips do not support edge flags, the begin callback is not
called with GL_TRIANGLE_FAN or GL_TRIANGLE_STRIP if an edge flag
callback is provided. Instead, the fans and strips are converted to
independent triangles. The function prototype for this callback
is:voidedgeFlag (GLbooleanflag); | | GLU_TESS_EDGE_FLAG_DATA | The
GLU_TESS_EDGE_FLAG_DATA callback is the same as the
GLU_TESS_EDGE_FLAG callback except that it takes an additional
pointer argument. This pointer is identical to the opaque pointer
provided when you call gluTessBeginPolygon. The function prototype
for this callback is: voidedgeFlagData (GLbooleanflag, void *
polygon_data); | | GLU_TESS_VERTEX | The GLU_TESS_VERTEX callback is
invoked between the begin and end callbacks. It is similar to
glVertex , and it defines the vertexes of the triangles created by
the tessellation process. The function takes a pointer as its only
argument. This pointer is identical to the opaque pointer that you
provided when you defined the vertex (see gluTessVertex). The
function prototype for this callback is: voidvertex (void *
vertex_data); | | GLU_TESS_VERTEX_DATA | The GLU_TESS_VERTEX_DATA is
the same as the GLU_TESS_VERTEX callback except that it takes an
additional pointer argument. This pointer is identical to the opaque
pointer provided when you call gluTessBeginPolygon. The function
prototype for this callback is: voidvertexData (void * vertex_data,
void * polygon_data); | | GLU_TESS_END | The GLU_TESS_END callback
serves the same purpose as glEnd. It indicates the end of a
primitive, and it takes no arguments. The function prototype for this
callback is: voidend (void); | | GLU_TESS_END_DATA | The
GLU_TESS_END_DATA callback is the same as the GLU_TESS_END callback
except that it takes an additional pointer argument. This pointer is
identical to the opaque pointer provided when you call
gluTessBeginPolygon. The function prototype for this callback is:
voidendData (void * polygon_data); | | GLU_TESS_COMBINE | Call the
GLU_TESS_COMBINE callback to create a new vertex when the
tessellation detects an intersection, or to merge features. The
function takes four arguments: An array of three elements, each of
type Gldouble. An array of four pointers. An array of four elements,
each of type GLfloat. A pointer to a pointer. The function prototype
for this callback is: voidcombine(GLdoublecoords[3], void *
vertex_data[4], GLfloatweight[4], void **outData); The vertex is
defined as a linear combination of up to four existing vertexes,
stored in vertex_data. The coefficients of the linear combination are
given by weight; these weights always sum to 1.0. All vertex pointers
are valid even when some of the weights are zero. The coords
parameter gives the location of the new vertex. Allocate another
vertex, interpolate parameters using vertex_data and weight, and
return the new vertex pointer in outData. This handle is supplied
during rendering callbacks. Free the memory sometime after calling
gluTessEndPolygon. For example, if the polygon lies in an arbitrary
plane in three-dimensional space, and you associate a color with each
vertex, the GLU_TESS_COMBINE callback might look like the
following:void myCombine( GLdouble coords[3], VERTEX *d[4], GLfloat
w[4], VERTEX **dataOut ) { VERTEX *newVertex = new_vertex();
newVertex->x = coords[0]; newVertex->y = coords[1]; newVertex->z =
coords[2]; newVertex->r = w[0]*d[0]->r + w[1]*d[1]->r + w[2]*d[2]->r
+ w[3]*d[3]->r; newVertex->g = w[0]*d[0]->g + w[1]*d[1]->g +
w[2]*d[2]->g + w[3]*d[3]->g; newVertex->b = w[0]*d[0]->b +
w[1]*d[1]->b + w[2]*d[2]->b + w[3]*d[3]->b; newVertex->a =
w[0]*d[0]->a + w[1]*d[1]->a + w[2]*d[2]->a + w[3]*d[3]->a; *dataOut =
newVertex; }When the tessellation detects an intersection, the
GLU_TESS_COMBINE or GLU_TESS_COMBINE_DATA callback (see below) must
be defined, and must write a non-NULL pointer into dataOut. Otherwise
the GLU_TESS_NEED_COMBINE_CALLBACK error occurs, and no output is
generated. (This is the only error that can occur during tessellation
and rendering.) | | GLU_TESS_COMBINE_DATA | The GLU_TESS_COMBINE_DATA
callback is the same as the GLU_TESS_COMBINE callback except that it
takes an additional pointer argument. This pointer is identical to
the opaque pointer provided when you call gluTessBeginPolygon. The
function prototype for this callback is: voidcombineData
(GLdoublecoords[3], void *vertex_data[4], GLfloatweight[4], void
**outData, void * polygon_data); | | GLU_TESS_ERROR | The
GLU_TESS_ERROR callback is called when an error is encountered. The
one argument is of type GLenum; it indicates the specific error that
occurred and is set to one of the following:
GLU_TESS_MISSING_BEGIN_POLYGON GLU_TESS_MISSING_END_POLYGON
GLU_TESS_MISSING_BEGIN_CONTOUR GLU_TESS_MISSING_END_CONTOUR
GLU_TESS_COORD_TOO_LARGE GLU_TESS_NEED_COMBINE_CALLBACK Call
gluErrorString to retrieve character strings describing these errors.
The function prototype for this callback is as follows:voiderror
(GLenumerrno); The GLU library recovers from the first four errors by
inserting the missing call or calls. GLU_TESS_COORD_TOO_LARGE
indicates that some vertex coordinate exceeded the predefined
constant GLU_TESS_MAX_COORD in absolute value, and that the value has
been clamped. (Coordinate values must be small enough that two can be
multiplied together without overflow.) GLU_TESS_NEED_COMBINE_CALLBACK
indicates that the tessellation detected an intersection between two
edges in the input data, and the GLU_TESS_COMBINE or
GLU_TESS_COMBINE_DATA callback was not provided. No output will be
generated. | | GLU_TESS_ERROR_DATA | The GLU_TESS_ERROR_DATA callback
is the same as the GLU_TESS_ERROR callback, except that it takes an
additional pointer argument. This pointer is identical to the opaque
pointer provided when you call gluTessBeginPolygon. The function
prototype for this callback is: voiderrorData (GLenumerrno, void *
polygon_data); |


%index
gluTessEndContour
The gluTessBeginContour and gluTessEndContour functions delimit a contour description. | gluTessEndContour function (Glu.h)
%group
Win32 glu32
%prm
tess
tess : [intptr] The tessellation object (created with [**gluNewTess**](glunewtess.md)).
%inst
The gluTessBeginContour and gluTessEndContour functions delimit a
contour description. | gluTessEndContour function (Glu.h)

[戻り値]
This function does not return a value.

[備考]
The [**gluTessBeginContour**](glutessbegincontour.md) and
**gluTessEndContour** functions delimit the definition of a polygon
contour. Within each **gluTessBeginContour**/**gluTessEndContour**
pair, there can be zero or more calls to
[**gluTessVertex**](glutessvertex.md). The vertexes specify a closed
contour (the last vertex of each contour is automatically linked to
the first). You can call **gluTessBeginContour** only between
[**gluTessBeginPolygon**](glutessbeginpolygon.md) and
[**gluTessEndPolygon**](glutessendpolygon.md).


%index
gluTessEndPolygon
The gluTessBeginPolygon and gluTessEndPolygon functions delimit a polygon description. | gluTessEndPolygon function (Glu.h)
%group
Win32 glu32
%prm
tess
tess : [intptr] The tessellation object (created with [**gluNewTess**](glunewtess.md)).
%inst
The gluTessBeginPolygon and gluTessEndPolygon functions delimit a
polygon description. | gluTessEndPolygon function (Glu.h)

[戻り値]
This function does not return a value.

[備考]
The [**gluTessBeginPolygon**](glutessbeginpolygon.md) and
**gluTessEndPolygon** functions delimit the definition of a nonconvex
polygon. Within each **gluTessBeginPolygon** / **gluTessEndPolygon**
pair, include one or more calls to
[**gluTessBeginContour**](glutessbegincontour.md). Within each
contour, there are zero or more calls to
[**gluTessVertex**](glutessvertex.md). The vertexes specify a closed
contour (the last vertex of each contour is automatically linked to
the first). The *polygon\_data* parameter is a pointer to a
programmer-defined data structure. If the appropriate callbacks are
specified (see [*gluTessCallback*](glutess.md)), this pointer is
returned to the callback function or functions, making it a
convenient way to store per-polygon information. When you call
**gluTessEndPolygon**, the polygon is tessellated, and the resulting
triangles are described through callbacks. For descriptions of the
callback functions, see [*gluTessCallback*](glutess.md).


%index
gluTessNormal
The gluTessNormal function specifies a normal for a polygon.
%group
Win32 glu32
%prm
tess, x, y, z
tess : [intptr] The tessellation object (created with [**gluNewTess**](glunewtess.md)).
x : [double] The x-coordinate component of a normal.
y : [double] The y-coordinate component of a normal.
z : [double] The z-coordinate component of a normal.
%inst
The gluTessNormal function specifies a normal for a polygon.

[戻り値]
This function does not return a value.

[備考]
The **gluTessNormal** function describes a normal for a polygon that
you define. All input data is projected onto a plane perpendicular to
one of the three coordinate axes before tessellation, and all output
triangles are oriented counterclockwise with respect to the normal.
(To obtain clockwise orientation, reverse the sign of the supplied
normal). For example, if you know that all polygons lie in the x-y
plane, call **gluTessNormal**(tess, 0.0, 0.0, 1.0) before rendering
any polygons. If the supplied normal is (0.0, 0.0, 0.0) (the default
value), the normal is determined as follows: 1. The direction of the
normal, up to its sign, is found by fitting a plane to the vertexes,
without regard to how the vertexes are connected. It is expected that
the input data lies approximately in the plane; otherwise projection
perpendicular to one of the three coordinate axes can change the
geometry substantially. 2. The sign of the normal is chosen so that
the sum of the signed areas of all input contours is nonnegative
(where a counterclockwise contour has positive area). The supplied
normal persists until another call to **gluTessNormal** changes it.


%index
gluTessProperty
The gluTessProperty function sets the property of a tessellation object.
%group
Win32 glu32
%prm
tess, which, value
tess : [intptr] The tessellation object (created with [**gluNewTess**](glunewtess.md)).
which : [int] The property value to set. The following values are valid: GLU\_TESS\_WINDING\_RULE, GLU\_TESS\_BOUNDARY\_ONLY, and GLU\_TESS\_TOLERANCE.
value : [double] The value of the indicated property.
%inst
The gluTessProperty function sets the property of a tessellation
object.

[戻り値]
This function does not return a value.

[備考]
The **gluTessProperty** function controls properties stored in a
tessellation object. These properties affect the way the polygons are
interpreted and rendered.


%index
gluTessVertex
The gluTessVertex function specifies a vertex on a polygon.
%group
Win32 glu32
%prm
tess, coords, data
tess : [intptr] The tessellation object (created with [**gluNewTess**](glunewtess.md)).
coords : [var] The location of the vertex.
data : [intptr] An pointer passed back to the program with the vertex callback (as specified by [*gluTessCallback*](glutess.md)).
%inst
The gluTessVertex function specifies a vertex on a polygon.

[戻り値]
This function does not return a value.

[備考]
The **gluTessVertex** function describes a vertex on a polygon that
the user is defining. Successive **gluTessVertex** calls describe a
closed contour. For example, to describe a quadrilateral, call
**gluTessVertex** four times. You can only call **gluTessVertex**
between [**gluTessBeginContour**](glutessbegincontour.md) and
[**gluTessEndContour**](glutessendcontour.md). The *data* parameter
normally points to a structure containing the vertex location, as
well as other per-vertex attributes such as color and normal. This
pointer is passed back to the program through the GLU\_VERTEX
callback after tessellation (see [*gluTessCallback*](glutess.md)).


%index
gluUnProject
The gluUnProject function maps window coordinates to object coordinates.
%group
Win32 glu32
%prm
winx, winy, winz, modelMatrix, projMatrix, viewport, objx, objy, objz
winx : [double] The x window coordinate to be mapped.
winy : [double] The y window coordinate to be mapped.
winz : [double] The z window coordinate to be mapped.
modelMatrix : [var] The modelview matrix (as from a [**glGetDoublev**](glgetdoublev.md) call).
projMatrix : [var] The projection matrix (as from a **glGetDoublev** call).
viewport : [var] The viewport (as from a [**glGetIntegerv**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md) call).
objx : [var] The computed x object coordinate.
objy : [var] The computed y object coordinate.
objz : [var] The computed z object coordinate.
%inst
The gluUnProject function maps window coordinates to object
coordinates.

[戻り値]
If the function succeeds, the return value is GL\_TRUE. If the
function fails, the return value is GL\_FALSE.

[備考]
The **gluUnProject** function maps the specified window coordinates
into object coordinates using *modelMatrix*, *projMatrix*, and
*viewport*. The result is stored in *objx*, *objy*, and *objz*.

