; ============================================================
;   opengl32.dll ヘルプ (CsWin32 / win32metadata から自動抽出)
;   docs_ja.json に日本語訳があればそちらを使用、無ければ英語原文。
;   翻訳を追加するときは docs_ja.json を編集して再生成。
; ============================================================

%index
glAccum
The glAccum function operates on the accumulation buffer.
%group
Win32 opengl32
%prm
op, value
op : [int] The accumulation buffer operation. The accepted symbolic constants are as follows.
value : [float] A floating-point value used in the accumulation buffer operation. The *op* parameter determines how *value* is used.
%inst
The glAccum function operates on the accumulation buffer.

[戻り値]
This function does not return a value.

[備考]
The accumulation buffer is an extended-range color buffer. Images are
not rendered into it. Rather, images rendered into one of the color
buffers are added to the contents of the accumulation buffer after
rendering. You can create effects such as antialiasing (of points,
lines, and polygons), motion blur, and depth of field by accumulating
images generated with different transformation matrices. Each pixel
in the accumulation buffer consists of red, green, blue, and alpha
values. The number of bits per component in the accumulation buffer
depends on the implementation. You can examine this number by calling
[**glGetIntegerv**](glgetintegerv.md) four times, with the arguments
GL\_ACCUM\_RED\_BITS, GL\_ACCUM\_GREEN\_BITS, GL\_ACCUM\_BLUE\_BITS,
and GL\_ACCUM\_ALPHA\_BITS, respectively. Regardless of the number of
bits per component, however, the range of values stored by each
component is \[ 1,?1\]. The accumulation buffer pixels are mapped
one-to-one with framebuffer pixels. The **glAccum** function operates
on the accumulation buffer. The first argument, *op*, is a symbolic
constant that selects an accumulation buffer operation. The second
argument, *value*, is a floating-point value to be used in that
operation. Five operations are specified: GL\_ACCUM, GL\_LOAD,
GL\_ADD, GL\_MULT, and GL\_RETURN. All accumulation buffer operations
are limited to the area of the current scissor box and are applied
identically to the red, green, blue, and alpha components of each
pixel. The contents of an accumulation buffer pixel component are
undefined if the **glAccum** operation results in a value outside the
range \[ 1,1\]. To clear the accumulation buffer, use the
[**glClearAccum**](glclearaccum.md) function to specify R, G, B, and
A values to set it to, and issue a [**glClear**](glclear.md) function
with the accumulation buffer enabled. Only those pixels within the
current scissor box are updated by any **glAccum** operation. The
following functions retrieve information related to the **glAccum**
function:
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_ACCUM\_RED\_BITS **glGet** with argument
GL\_ACCUM\_GREEN\_BITS **glGet** with argument GL\_ACCUM\_BLUE\_BITS
**glGet** with argument GL\_ACCUM\_ALPHA\_BITS


%index
glAlphaFunc
The glAlphaFunc function enables your application to set the alpha test function.
%group
Win32 opengl32
%prm
func, ref
func : [int] The alpha comparison function. The following are the accepted symbolic constants and their meanings.
ref : [int] 
%inst
The glAlphaFunc function enables your application to set the alpha
test function.

[戻り値]
This function does not return a value.

[備考]
The alpha test discards fragments depending on the outcome of a
comparison between the incoming fragments' alpha values and a
constant reference value. The **glAlphaFunc** function specifies the
reference and comparison function. The comparison is performed only
if alpha testing is enabled. (For more information on
GL\_ALPHA\_TEST, see [**glEnable**](glenable.md).) The *func* and
*ref* parameters specify the conditions under which the pixel is
drawn. The incoming alpha value is compared to *ref* using the
function specified by *func*. If the comparison passes, the incoming
fragment is drawn, conditional on subsequent stencil and depth-buffer
tests. If the comparison fails, no change is made to the framebuffer
at that pixel location. The **glAlphaFunc** function operates on all
pixel writes, including those resulting from the scan conversion of
points, lines, polygons, and bitmaps, and from pixel draw and copy
operations. The **glAlphaFunc** function does not affect screen clear
operations. Alpha testing is done only in RGBA mode. The following
functions retrieve information related to the **glAlphaFunc**
function:
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_ALPHA\_TEST\_FUNC **glGet** with argument
GL\_ALPHA\_TEST\_REF [**glIsEnabled**](glisenabled.md) with argument
GL\_ALPHA\_TEST


%index
glAreTexturesResident
The glAreTexturesResident function determines whether specified texture objects are resident in texture memory.
%group
Win32 opengl32
%prm
n, textures, residences
n : [int] The number of textures to be queried.
textures : [var] The address of an array containing the names of the textures to be queried.
residences : [var] The address of an array in which the texture residence status is returned. The residence status of a texture named by an element of *textures* is returned in the corresponding element of *residences*.
%inst
The glAreTexturesResident function determines whether specified
texture objects are resident in texture memory.

[備考]
On machines with a limited amount of texture memory, OpenGL
establishes a working set of textures that are resident in texture
memory. These textures can be bound to a texture target much more
efficiently than textures that are not resident. The
**glAreTexturesResident** function queries the texture residence
status of the *n* textures named by the elements of *textures*. If
all the named textures are resident, **glAreTexturesResident**
returns GL\_TRUE, and the contents of *residences* are undisturbed.
If any of the named textures are not resident,
**glAreTexturesResident** returns GL\_FALSE, and detailed status is
returned in the *n* elements of *residences*. If an element of
*residences* is GL\_TRUE, then the texture named by the corresponding
element of *textures* is resident in texture memory. To query the
residence status of a single bound texture, call
[**glGetTexParameter**](glgettexparameter.md) with the *target*
parameter set to the target texture to which the target is bound and
set the *pname* parameter to GL\_TEXTURE\_RESIDENT. You must use this
method to query the resident status of a default texture. You cannot
include **glAreTexturesResident** in display lists. The
**glAreTexturesResident** function returns the residency status of
the textures at the time of invocation. It does not guarantee that
the textures will remain resident at any other time. If textures
reside in virtual memory (there is no texture memory), they are
considered always resident. > [!Note] > The **glAreTexturesResident**
function is only available in OpenGL version 1.1 or later.


%index
glArrayElement
The glArrayElement function specifies the array elements used to render a vertex.
%group
Win32 opengl32
%prm
i
i : [int] 
%inst
The glArrayElement function specifies the array elements used to
render a vertex.

[戻り値]
This function does not return a value.

[備考]
Use the **glArrayElement** function within [**glBegin**](glbegin.md)
and [**glEnd**](glend.md) pairs to specify vertex and attribute data
for point, line, and polygon primitives. The **glArrayElement**
function specifies the data for a single vertex using vertex and
attribute data located at the *index* of the enabled vertex arrays.
You can use **glArrayElement** to construct primitives by indexing
vertex data, rather than by streaming through arrays of data in
first-to-last order. Because **glArrayElement** specifies a single
vertex only, you can explicitly specify attributes for individual
primitives. For example, you can set a single normal for each
individual triangle. When you include calls to **glArrayElement** in
display lists, the necessary array data, determined by the array
pointers and enable values, is entered in the display list also.
Array pointer and enable values are determined when display lists are
created, not when display lists are executed. You can read and cache
static array data at any time with **glArrayElement**. When you
modify the elements of a static array without specifying the array
again, the results of any subsequent calls to **glArrayElement** are
undefined. When you call **glArrayElement** without first calling
**glEnableClientState**(GL\_VERTEX\_ARRAY), no drawing occurs, but
the attributes corresponding to enabled arrays are modified. Although
no error is generated when you specify an array within **glBegin**
and **glEnd** pairs, the results are undefined. > [!Note] > The
**glArrayElement** function is only available in OpenGL version 1.1
or later.


%index
glBegin
The glBegin and glend functions delimit the vertices of a primitive or a group of like primitives. | glBegin function (Gl.h)
%group
Win32 opengl32
%prm
mode
mode : [int] The primitive or primitives that will be created from vertices presented between **glBegin** and the subsequent [**glend**](glend.md). The following are accepted symbolic constants and their meanings:
%inst
The glBegin and glend functions delimit the vertices of a primitive
or a group of like primitives. | glBegin function (Gl.h)

[戻り値]
This function does not return a value.

[備考]
The **glBegin** and [**glend**](glend.md) functions delimit the
vertices that define a primitive or a group of like primitives. The
**glBegin** function accepts a single argument that specifies which
of ten primitives the vertices compose. Taking *n* as an integer
count starting at one, and *N* as the total number of vertices
specified, the interpretations are as follows: - You can use only a
subset of OpenGL functions between **glBegin** and
[**glend**](glend.md). The functions you can use are:
[**glVertex**](glvertex-functions.md)
[**glColor**](glcolor-functions.md)
[**glIndex**](glindex-functions.md)
[**glNormal**](glnormal-functions.md)
[**glTexCoord**](gltexcoord-functions.md)
[**glEvalCoord**](glevalcoord-functions.md)
[**glEvalPoint**](glevalpoint.md)
[**glMaterial**](glmaterial-functions.md)
[**glEdgeFlag**](gledgeflag-functions.md) You can also use
[**glCallList**](glcalllist.md) or [**glCallLists**](glcalllists.md)
to execute display lists that include only the preceding functions.
If any other OpenGL function is called between **glBegin** and
[**glend**](glend.md), the error flag is set and the function is
ignored. - Regardless of the value chosen for *mode* in **glBegin**,
there is no limit to the number of vertices you can define between
**glBegin** and [**glend**](glend.md). Lines, triangles,
quadrilaterals, and polygons that are incompletely specified are not
drawn. Incomplete specification results when either too few vertices
are provided to specify even a single primitive or when an incorrect
multiple of vertices is specified. The incomplete primitive is
ignored; the complete primitives are drawn. - The minimum
specification of vertices for each primitive is: | Minimum number of
vertices | Type of primitive |
|----------------------------|-------------------| | 1 | point | | 2
| line | | 3 | triangle | | 4 | quadrilateral | | 3 | polygon |
- Modes that require a certain multiple of vertices are GL\_LINES
(2), GL\_TRIANGLES (3), GL\_QUADS (4), and GL\_QUAD\_STRIP (2).


%index
glBindTexture
The glBindTexture function enables the creation of a named texture that is bound to a texture target.
%group
Win32 opengl32
%prm
target, texture
target : [int] The target to which the texture is bound. Must have the value GL\_TEXTURE\_1D or GL\_TEXTURE\_2D.
texture : [int] The name of a texture; the texture name cannot currently be in use.
%inst
The glBindTexture function enables the creation of a named texture
that is bound to a texture target.

[戻り値]
This function does not return a value.

[備考]
The **glBindTexture** function enables you to create a named texture.
Calling **glBindTexture** with *target* set to GL\_TEXTURE\_1D or
GL\_TEXTURE\_2D, and *texture* set to the name of the new texture you
have created binds the texture name to the appropriate texture
target. When a texture is bound to a target, the previous binding for
that target is no longer in effect. Texture names are unsigned
integers with the value zero reserved to represent the default
texture for each texture target. Texture names and the corresponding
texture contents are local to the shared display-list space of the
current OpenGL rendering context; two rendering contexts share
texture names only if they also share display lists. You can generate
a set of new texture names using
[**glGenTextures**](glgentextures.md). When a texture is first bound,
it assumes the dimensionality of its texture target; a texture bound
to GL\_TEXTURE\_1D becomes one-dimensional and a texture bound to
GL\_TEXTURE\_2D becomes two-dimensional. Operations you perform on a
texture target also affect a texture bound to the target. When you
query a texture target, the return value is the state of the texture
bound to it. Texture targets become aliases for textures currently
bound to them. When you bind a texture with **glBindTexture**, the
binding remains active until a different texture is bound to the same
target or you delete the bound texture with the
[**glDeleteTextures**](gldeletetextures.md) function. Once you create
a named texture you can bind it to a texture target that has the same
dimensionality as often as needed. It is usually much faster to use
**glBindTexture** to bind an existing named texture to one of the
texture targets than it is to reload the texture image using
[**glTexImage1D**](glteximage1d.md) or
[**glTexImage2D**](glteximage2d.md). For additional control of
texturing performance, use
[**glPrioritizeTextures**](glprioritizetextures.md). You can include
calls to **glBindTexture** in display lists. > [!Note] > The
**glBindTexture** function is only available in OpenGL version 1.1 or
later.
The following functions retrieve information related to
**glBindTexture**: -
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_TEXTURE\_1D\_BINDING **glGet** with argument
GL\_TEXTURE\_2D\_BINDING


%index
glBitmap
The glBitmap function draws a bitmap.
%group
Win32 opengl32
%prm
width, height, xorig, yorig, xmove, ymove, bitmap
width : [int] The pixel width of the bitmap image.
height : [int] The pixel height of the bitmap image.
xorig : [float] The *x* location of the origin in the bitmap image. The origin is measured from the lower-left corner of the bitmap, with right and up directions being the positive axes.
yorig : [float] The *y* location of the origin in the bitmap image. The origin is measured from the lower-left corner of the bitmap, with right and up directions being the positive axes.
xmove : [float] The *x* offset to be added to the current raster position after the bitmap is drawn.
ymove : [float] The *y* offset to be added to the current raster position after the bitmap is drawn.
bitmap : [var] The address of the bitmap image.
%inst
The glBitmap function draws a bitmap.

[戻り値]
This function does not return a value.

[備考]
A bitmap is a binary image. When drawn, the bitmap is positioned
relative to the current raster position, and framebuffer pixels
corresponding to 1s in the bitmap are written using the current
raster color or index. Frame-buffer pixels corresponding to zeros in
the bitmap are not modified. The bitmap image is interpreted like
image data for the [**glDrawPixels**](gldrawpixels.md) function, with
*width* and *height* corresponding to the width and height arguments
of that function, and with *type* set to GL\_BITMAP and *format* set
to GL\_COLOR\_INDEX. Modes you specify using
[**glPixelStore**](glpixelstore-functions.md) affect the
interpretation of bitmap image data; modes you specify using
[**glPixelTransfer**](glpixeltransfer.md) do not. If the current
raster position is invalid, **glBitmap** is ignored. Otherwise, the
lower-left corner of the bitmap image is positioned at the following
window coordinates: *x*w = *x*r *x*? *y*w = *y*r *y*? In these
coordinates, (*x*r , *y*r ) is the raster position, and (*x*? , *y*?
) is the bitmap origin. Fragments are then generated for each pixel
corresponding to a 1 in the bitmap image. These fragments are
generated using the current raster *z*-coordinate, color or color
index, and current raster texture coordinates. They are then treated
just as if they had been generated by a point, line, or polygon,
including texture mapping, fogging, and all per-fragment operations
such as alpha and depth testing. After the bitmap has been drawn, the
*x* and *y* coordinates of the current raster position are offset by
*xmove* and *ymove*. No change is made to the *z*-coordinate of the
current raster position, or to the current raster color, index, or
texture coordinates. The following functions retrieve information
related to the **glBitmap** function:
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_RASTER\_POSITION
**glGet** with argument GL\_CURRENT\_RASTER\_COLOR
**glGet** with argument GL\_CURRENT\_RASTER\_INDEX
**glGet** with argument GL\_CURRENT\_RASTER\_TEXTURE\_COORDS
**glGet** with argument GL\_CURRENT\_RASTER\_POSITION\_VALID


%index
glBlendFunc
The glBlendFunc function specifies pixel arithmetic.
%group
Win32 opengl32
%prm
sfactor, dfactor
sfactor : [int] Specifies how the red, green, blue, and alpha source-blending factors are computed. Nine symbolic constants are accepted: GL\_ZERO, GL\_ONE, GL\_DST\_COLOR, GL\_ONE\_MINUS\_DST\_COLOR, GL\_SRC\_ALPHA, GL\_ONE\_MINUS\_SRC\_ALPHA, GL\_DST\_ALPHA, GL\_ONE\_MINUS\_DST\_ALPHA, and GL\_SRC\_ALPHA\_SATURATE.
dfactor : [int] Specifies how the red, green, blue, and alpha destination-blending factors are computed. Eight symbolic constants are accepted: GL\_ZERO, GL\_ONE, GL\_SRC\_COLOR, GL\_ONE\_MINUS\_SRC\_COLOR, GL\_SRC\_ALPHA, GL\_ONE\_MINUS\_SRC\_ALPHA, GL\_DST\_ALPHA, and GL\_ONE\_MINUS\_DST\_ALPHA.
%inst
The glBlendFunc function specifies pixel arithmetic.

[戻り値]
This function does not return a value.

[備考]
In RGB mode, pixels can be drawn using a function that blends the
incoming (source) RGBA values with the RGBA values that are already
in the framebuffer (the destination values). By default, blending is
disabled. Use [**glEnable**](glenable.md) and
[**glDisable**](gldisable.md) with the GL\_BLEND argument to enable
and disable blending. When enabled, **glBlendFunc** defines the
operation of blending. The *sfactor* parameter specifies which of
nine methods is used to scale the source color components. The
*dfactor* parameter specifies which of eight methods is used to scale
the destination color components. The eleven possible methods are
described in the following table. Each method defines four scale
factors one each for red, green, blue, and alpha. In the table and in
subsequent equations, source and destination color components are
referred to as (*R*? , *G*? , *B*? , *A*? ) and (*R*d , *G*d , *B*d ,
*A*d ). They are understood to have integer values between zero and
(*k*R , *k*G , *k*R , *k*A ), where *k*R = 2m*R* - 1 *k*G = 2m*G* - 1
*k*B = 2m*B* - 1 *k*A = 2m*A* - 1 and (*m*R , *m*G , *m*B , *m*A ) is
the number of red, green, blue, and alpha bitplanes. Source and
destination scale factors are referred to as (*s*R , *s*G , *s*B ,
*s*A ) and (*d*R , *d*G , *d*B , *d*A ). The scale factors described
in the table, denoted (*f*R , *f*G , *f*B , *f*A ), represent either
source or destination factors. All scale factors have range \[0,1\].
| Parameter | (*f*R , *f*G , *f*B , *f*A ) |
|----------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------|
| GL\_ZERO | (0,0,0,0) | | GL\_ONE | (1,1,1,1) | | GL\_SRC\_COLOR |
(*R*? / *k*R , *G*? / *k*G , *B*? / *k*B , *A*? / *k*A ) | |
GL\_ONE\_MINUS\_SRC\_COLOR | (1,1,1,1) - (*R*? / *k*R , *G*? / *k*G ,
*B*? / *k*B , *A*? / *k*A ) | | GL\_DST\_COLOR | (*R*d / *k*R , *G*d
/ *k*G , *B*d / *k*B , *A*d / *k*A ) | | GL\_ONE\_MINUS\_DST\_COLOR |
(1,1,1,1) - (*R*d / *k*R , *G*d / *k*G , *B*d / *k*B , *A*d / *k*A )
| | GL\_SRC\_ALPHA | (*A*? / *k*A , *A*? / *k*A , *A*? / *k*A , *A*?
/ *k*A ) | | GL\_ONE\_MINUS\_SRC\_ALPHA | (1,1,1,1) - (*A*? / *k*A ,
*A*? / *k*A , *A*? / *k*A , *A*? / *k*A ) | | GL\_DST\_ALPHA | (*A*d
/ *k*A , *A*d / *k*A , *A*d / *k*A , *A*d / *k*A ) | |
GL\_ONE\_MINUS\_DST\_ALPHA | (1,1,1,1) - (*A*d / *k*A , *A*d / *k*A ,
*A*d / *k*A , *A*d / *k*A ) | | GL\_SRC\_ALPHA\_SATURATE | (*i,i,i,*
1) |
In the table, *i* = min (*A*? , *k*A - *A*d ) / *k*A To determine the
blended RGBA values of a pixel when drawing in RGBA mode, the system
uses the following equations: *R* (*d*) = min( *k*R , *R*? *s*R +
*R*d *d*R ) *G* (*d*) = min( *k*G , *G*? *s*G + *G*d *d*G ) *B* (*d*)
= min( *k*B *, B*? *s*B + *B*d *d*B ) *A* (*d*) = min( *k*A , *A*?
*s*A + *A*d *d*A ) Despite the apparent precision of the above
equations, blending arithmetic is not exactly specified, because
blending operates with imprecise integer color values. However, a
blend factor that should be equal to one is guaranteed not to modify
its multiplicand, and a blend factor equal to zero reduces its
multiplicand to zero. Thus, for example, when *sfactor* is
GL\_SRC\_ALPHA, *dfactor* is GL\_ONE\_MINUS\_SRC\_ALPHA, and *A*? is
equal to *k*A, the equations reduce to simple replacement: *R*d =
*R*? *G*d = *G*? Bd = *B*? *A*d = *A*?


%index
glCallList
The glCallList function executes a display list.
%group
Win32 opengl32
%prm
list
list : [int] The integer name of the display list to be executed.
%inst
The glCallList function executes a display list.

[戻り値]
This function does not return a value.

[備考]
Invoking the **glCallList** function begins execution of the named
display list. The functions saved in the display list are executed in
order, just as if you called them without using a display list. If
*list* has not been defined as a display list, **glCallList** is
ignored. The **glCallList** function can appear inside a display
list. To avoid the possibility of infinite recursion resulting from
display lists calling one another, a limit is placed on the nesting
level of display lists during display-list execution. This limit is
at least 64, however, it depends on the implementation. The OpenGL
state is not saved and restored across a call to **glCallList**.
Thus, changes made to the OpenGL state during the execution of a
display list remain after execution of the display list is completed.
To preserve the OpenGL state across **glCallList** calls, use
[**glPushAttrib**](glpushattrib.md),
[**glPopAttrib**](glpopattrib.md),
[**glPushMatrix**](glpushmatrix.md), and
[**glPopMatrix**](glpopmatrix.md). You can execute display lists
between a call to [**glBegin**](glbegin.md) and the corresponding
call to [**glEnd**](glend.md), as long as the display list includes
only functions that are allowed in this interval. The following
functions retrieve information related to **glCallList**:
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_MAX\_LIST\_NESTING [**glIsList**](glislist.md)


%index
glCallLists
The glCallLists function executes a list of display lists.
%group
Win32 opengl32
%prm
n, type, lists
n : [int] The number of display lists to be executed.
type : [int] The type of values in *lists*. The following symbolic constants are accepted.
lists : [intptr] The address of an array of name offsets in the display list. The pointer type is void because the offsets can be bytes, shorts, ints, or floats, depending on the value of *type*.
%inst
The glCallLists function executes a list of display lists.

[戻り値]
This function does not return a value.

[備考]
The **glCallLists** function causes each display list in the list of
names passed as *lists* to be executed. As a result, the functions
saved in each display list are executed in order, just as if they
were called without using a display list. Names of display lists that
have not been defined are ignored. The **glCallLists** function
provides an efficient means for executing display lists. The *n*
parameter specifies the number of lists with various name formats
(specified by the *type* parameter) **glCallLists** executes. The
list of display list names is not null-terminated. Rather, *n*
specifies how many names are to be taken from *lists*. The
[**glListBase**](gllistbase.md) function makes an additional level of
indirection available. The **glListBase** function specifies an
unsigned offset that is added to each display list name specified in
*lists* before that display list is executed. The **glCallLists**
function can appear inside a display list. To avoid the possibility
of infinite recursion resulting from display lists calling one
another, a limit is placed on the nesting level of display lists
during display list execution. This limit must be at least 64, and it
depends on the implementation. The OpenGL state is not saved and
restored across a call to **glCallLists**. Thus, changes made to the
OpenGL state during the execution of the display lists remain after
execution is completed. Use [**glPushAttrib**](glpushattrib.md),
[**glPopAttrib**](glpopattrib.md),
[**glPushMatrix**](glpushmatrix.md), and
[**glPopMatrix**](glpopmatrix.md) to preserve the OpenGL state across
**glCallLists** calls. You can execute display lists between a call
to [**glBegin**](glbegin.md) and the corresponding call to
[**glEnd**](glend.md), as long as the display list includes only
functions that are allowed in this interval. The following functions
retrieve information related to the **glCallLists** function:
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_LIST\_BASE **glGet** with argument
GL\_MAX\_LIST\_NESTING [**glIsList**](glislist.md)


%index
glClear
The glClear function clears buffers to preset values.
%group
Win32 opengl32
%prm
mask
mask : [int] Bitwise OR operators of masks that indicate the buffers to be cleared. The four masks are as follows.
%inst
The glClear function clears buffers to preset values.

[戻り値]
This function does not return a value.

[備考]
The **glClear** function sets the bitplane area of the window to
values previously selected by [**glClearColor**](glclearcolor.md),
[**glClearIndex**](glclearindex.md),
[**glClearDepth**](glcleardepth.md),
[**glClearStencil**](glclearstencil.md), and
[**glClearAccum**](glclearaccum.md). You can clear multiple color
buffers simultaneously by selecting more than one buffer at a time
using [**glDrawBuffer**](gldrawbuffer.md). The pixel-ownership test,
the scissor test, dithering, and the buffer writemasks affect the
operation of **glClear**. The scissor box bounds the cleared region.
The **glClear** function ignores the alpha function, blend function,
logical operation, stenciling, texture mapping, and *z*-buffering.
The **glClear** function takes a single argument (*mask*) that is the
bitwise OR of several values indicating which buffer is to be
cleared. The value to which each buffer is cleared depends on the
setting of the clear value for that buffer. If a buffer is not
present, a **glClear** call directed at that buffer has no effect.
The following functions retrieve information related to **glClear**:
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_ACCUM\_CLEAR\_VALUE **glGet** with argument
GL\_DEPTH\_CLEAR\_VALUE **glGet** with argument
GL\_INDEX\_CLEAR\_VALUE **glGet** with argument
GL\_COLOR\_CLEAR\_VALUE **glGet** with argument
GL\_STENCIL\_CLEAR\_VALUE


%index
glClearAccum
The glClearAccum function specifies the clear values for the accumulation buffer.
%group
Win32 opengl32
%prm
red, green, blue, alpha
red : [float] The red value used when the accumulation buffer is cleared. The default value is zero.
green : [float] The green value used when the accumulation buffer is cleared. The default value is zero.
blue : [float] The blue value used when the accumulation buffer is cleared. The default value is zero.
alpha : [float] The alpha value used when the accumulation buffer is cleared. The default value is zero.
%inst
The glClearAccum function specifies the clear values for the
accumulation buffer.

[戻り値]
This function does not return a value.

[備考]
The **glClearAccum** function specifies the red, green, blue, and
alpha values used by [**glClear**](glclear.md) to clear the
accumulation buffer. Values specified by **glClearAccum** are clamped
to the range \[1,1\]. The following function retrieves information
related to **glClearAccum**:
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_ACCUM\_CLEAR\_VALUE


%index
glClearColor
The glClearColor function specifies clear values for the color buffers.
%group
Win32 opengl32
%prm
red, green, blue, alpha
red : [float] The red value that [**glClear**](glclear.md) uses to clear the color buffers. The default value is zero.
green : [float] The green value that [**glClear**](glclear.md) uses to clear the color buffers. The default value is zero.
blue : [float] The blue value that [**glClear**](glclear.md) uses to clear the color buffers. The default value is zero.
alpha : [float] The alpha value that [**glClear**](glclear.md) uses to clear the color buffers. The default value is zero.
%inst
The glClearColor function specifies clear values for the color
buffers.

[戻り値]
This function does not return a value.

[備考]
The **glClearColor** function specifies the red, green, blue, and
alpha values used by [**glClear**](glclear.md) to clear the color
buffers. Values specified by **glClearColor** are clamped to the
range \[0,1\]. The following functions retrieve information related
to the **glClearColor** function:
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_ACCUM\_CLEAR\_VALUE **glGet** with argument
GL\_COLOR\_CLEAR\_VALUE


%index
glClearDepth
The glClearDepth function specifies the clear value for the depth buffer.
%group
Win32 opengl32
%prm
depth
depth : [double] The depth value used when the depth buffer is cleared.
%inst
The glClearDepth function specifies the clear value for the depth
buffer.

[戻り値]
This function does not return a value.

[備考]
The **glClearDepth** function specifies the depth value used by
[**glClear**](glclear.md) to clear the depth buffer. Values specified
by **glClearDepth** are clamped to the range \[0,1\]. The following
function retrieves information related to the **glClearDepth**
function:
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_DEPTH\_CLEAR\_VALUE


%index
glClearIndex
The glClearIndex function specifies the clear value for the color-index buffers.
%group
Win32 opengl32
%prm
c
c : [float] The index used when the color-index buffers are cleared. The default value is zero.
%inst
The glClearIndex function specifies the clear value for the
color-index buffers.

[戻り値]
This function does not return a value.

[備考]
The **glClearIndex** function specifies the index used by
[**glClear**](glclear.md) to clear the color-index buffers. The *c*
parameter is not clamped. Rather, *c* is converted to a fixed-point
value with unspecified precision to the right of the binary point.
The integer part of this value is then masked with 2m - 1, where *m*
is the number of bits in a color index stored in the framebuffer. The
following functions retrieve information related to **glClearIndex**:
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_INDEX\_CLEAR\_VALUE **glGet** with argument
GL\_INDEX\_BITS


%index
glClearStencil
The glClearStencil function specifies the clear value for the stencil buffer.
%group
Win32 opengl32
%prm
s
s : [int] The index used when the stencil buffer is cleared. The default value is zero.
%inst
The glClearStencil function specifies the clear value for the stencil
buffer.

[戻り値]
This function does not return a value.

[備考]
The **glClearStencil** function specifies the index used by
[**glClear**](glclear.md) to clear the stencil buffer. The *s*
parameter is masked with 2m - 1, where *m* is the number of bits in
the stencil buffer. The following functions retrieve information
related to the **glClearStencil** function:
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_STENCIL\_CLEAR\_VALUE **glGet** with argument
GL\_STENCIL\_BITS


%index
glClipPlane
The glClipPlane function specifies a plane against which all geometry is clipped.
%group
Win32 opengl32
%prm
plane, equation
plane : [int] The clipping plane that is being positioned. Symbolic names of the form GL\_CLIP\_PLANE*i*, where *i* is an integer between 0 and GL\_MAX\_CLIP\_PLANES - 1, are accepted.
equation : [var] The address of an array of four double-precision floating-point values. These values are interpreted as a plane equation.
%inst
The glClipPlane function specifies a plane against which all geometry
is clipped.

[戻り値]
This function does not return a value.

[備考]
Geometry is always clipped against the boundaries of a six-plane
frustum in *x*, *y*, and *z*. The **glClipPlane** function allows the
specification of additional planes, not necessarily perpendicular to
the *x-*axis, *y-*axis, or *z*-axis, against which all geometry is
clipped. Up to GL\_MAX\_CLIP\_PLANES planes can be specified, where
GL\_MAX\_CLIP\_PLANES is at least six in all implementations. Because
the resulting clipping region is the intersection of the defined
half-spaces, it is always convex. The **glClipPlane** function
specifies a half-space using a four-component plane equation. When
you call **glClipPlane**,*equation* is transformed by the inverse of
the modelview matrix and stored in the resulting eye coordinates.
Subsequent changes to the modelview matrix have no effect on the
stored plane-equation components. If the dot product of the eye
coordinates of a vertex with the stored plane equation components is
positive or zero, the vertex is in with respect to that clipping
plane. Otherwise, it is out. Use the [**glEnable**](glenable.md) and
[**glDisable**](gldisable.md) functions to enable and disable
clipping planes. Call clipping planes with the argument
GL\_CLIP\_PLANE*i*, where *i* is the plane number. By default, all
clipping planes are defined as (0,0,0,0) in eye coordinates and are
disabled. It is always the case that GL\_CLIP\_PLANE*i* =
GL\_CLIP\_PLANE0 + *i*. The following functions retrieve information
related to **glClipPlane**: [**glGetClipPlane**](glgetclipplane.md)
[**glIsEnabled**](glisenabled.md) with argument GL\_CLIP\_PLANE *i*


%index
glColor3b
Sets the current color. | glColor3b function (Gl.h)
%group
Win32 opengl32
%prm
red, green, blue
red : [int] The new red value for the current color.
green : [int] The new green value for the current color.
blue : [int] The new blue value for the current color.
%inst
Sets the current color. | glColor3b function (Gl.h)

[戻り値]
This function does not return a value.

[備考]
The GL stores both a current single-valued color index and a current
four-valued RGBA color. **glcolor** sets a new four-valued RGBA
color. **glcolor** has two major variants: **glcolor3** and
**glcolor4**. **glcolor3** variants specify new red, green, and blue
values explicitly and set the current alpha value to 1.0 (full
intensity) implicitly. **glcolor4** variants specify all four color
components explicitly. **glcolor3b**, **glcolor4b**, **glcolor3s**,
**glcolor4s**, **glcolor3i**, and **glcolor4i** take three or four
signed byte, short, or long integers as arguments. When v is appended
to the name, the color commands can take a pointer to an array of
such values. Current color values are stored in floating-point
format, with unspecified mantissa and exponent sizes. Unsigned
integer color components, when specified, are linearly mapped to
floating-point values such that the largest representable value maps
to 1.0 (full intensity), and 0 maps to 0.0 (zero intensity). Signed
integer color components, when specified, are linearly mapped to
floating-point values such that the most positive representable value
maps to 1.0, and the most negative representable value maps to -1.0.
(Note that this mapping does not convert 0 precisely to 0.0.)
Floating-point values are mapped directly. Neither floating-point nor
signed integer values are clamped to the range \[0,1\] before the
current color is updated. However, color components are clamped to
this range before they are interpolated or written into a color
buffer.


%index
glColor3bv
Sets the current color from an already existing array of color values. | glColor3bv function (Gl.h)
%group
Win32 opengl32
%prm
v
v : [var] A pointer to an array that contains red, green, and blue values.
%inst
Sets the current color from an already existing array of color
values. | glColor3bv function (Gl.h)

[戻り値]
This function does not return a value.

[備考]
The GL stores both a current single-valued color index and a current
four-valued RGBA color. **glcolor** sets a new four-valued RGBA
color. **glcolor** has two major variants: **glcolor3** and
**glcolor4**. **glcolor3** variants specify new red, green, and blue
values explicitly and set the current alpha value to 1.0 (full
intensity) implicitly. **glcolor4** variants specify all four color
components explicitly. **glcolor3b**, **glcolor4b**, **glcolor3s**,
**glcolor4s**, **glcolor3i**, and **glcolor4i** take three or four
signed byte, short, or long integers as arguments. When v is appended
to the name, the color commands can take a pointer to an array of
such values. Current color values are stored in floating-point
format, with unspecified mantissa and exponent sizes. Unsigned
integer color components, when specified, are linearly mapped to
floating-point values such that the largest representable value maps
to 1.0 (full intensity), and 0 maps to 0.0 (zero intensity). Signed
integer color components, when specified, are linearly mapped to
floating-point values such that the most positive representable value
maps to 1.0, and the most negative representable value maps to -1.0.
(Note that this mapping does not convert 0 precisely to 0.0.)
Floating-point values are mapped directly. Neither floating-point nor
signed integer values are clamped to the range \[0,1\] before the
current color is updated. However, color components are clamped to
this range before they are interpolated or written into a color
buffer.


%index
glColor3d
Sets the current color. | glColor3d function (Gl.h)
%group
Win32 opengl32
%prm
red, green, blue
red : [double] The new red value for the current color.
green : [double] The new green value for the current color.
blue : [double] The new blue value for the current color.
%inst
Sets the current color. | glColor3d function (Gl.h)

[戻り値]
This function does not return a value.

[備考]
The GL stores both a current single-valued color index and a current
four-valued RGBA color. **glcolor** sets a new four-valued RGBA
color. **glcolor** has two major variants: **glcolor3** and
**glcolor4**. **glcolor3** variants specify new red, green, and blue
values explicitly and set the current alpha value to 1.0 (full
intensity) implicitly. **glcolor4** variants specify all four color
components explicitly. **glcolor3b**, **glcolor4b**, **glcolor3s**,
**glcolor4s**, **glcolor3i**, and **glcolor4i** take three or four
signed byte, short, or long integers as arguments. When v is appended
to the name, the color commands can take a pointer to an array of
such values. Current color values are stored in floating-point
format, with unspecified mantissa and exponent sizes. Unsigned
integer color components, when specified, are linearly mapped to
floating-point values such that the largest representable value maps
to 1.0 (full intensity), and 0 maps to 0.0 (zero intensity). Signed
integer color components, when specified, are linearly mapped to
floating-point values such that the most positive representable value
maps to 1.0, and the most negative representable value maps to -1.0.
(Note that this mapping does not convert 0 precisely to 0.0.)
Floating-point values are mapped directly. Neither floating-point nor
signed integer values are clamped to the range \[0,1\] before the
current color is updated. However, color components are clamped to
this range before they are interpolated or written into a color
buffer.


%index
glColor3dv
Sets the current color from an already existing array of color values. | glColor3dv function (Gl.h)
%group
Win32 opengl32
%prm
v
v : [var] A pointer to an array that contains red, green, and blue values.
%inst
Sets the current color from an already existing array of color
values. | glColor3dv function (Gl.h)

[戻り値]
This function does not return a value.

[備考]
The GL stores both a current single-valued color index and a current
four-valued RGBA color. **glcolor** sets a new four-valued RGBA
color. **glcolor** has two major variants: **glcolor3** and
**glcolor4**. **glcolor3** variants specify new red, green, and blue
values explicitly and set the current alpha value to 1.0 (full
intensity) implicitly. **glcolor4** variants specify all four color
components explicitly. **glcolor3b**, **glcolor4b**, **glcolor3s**,
**glcolor4s**, **glcolor3i**, and **glcolor4i** take three or four
signed byte, short, or long integers as arguments. When v is appended
to the name, the color commands can take a pointer to an array of
such values. Current color values are stored in floating-point
format, with unspecified mantissa and exponent sizes. Unsigned
integer color components, when specified, are linearly mapped to
floating-point values such that the largest representable value maps
to 1.0 (full intensity), and 0 maps to 0.0 (zero intensity). Signed
integer color components, when specified, are linearly mapped to
floating-point values such that the most positive representable value
maps to 1.0, and the most negative representable value maps to -1.0.
(Note that this mapping does not convert 0 precisely to 0.0.)
Floating-point values are mapped directly. Neither floating-point nor
signed integer values are clamped to the range \[0,1\] before the
current color is updated. However, color components are clamped to
this range before they are interpolated or written into a color
buffer.


%index
glColor3f
Sets the current color. | glColor3f function (Gl.h)
%group
Win32 opengl32
%prm
red, green, blue
red : [float] The new red value for the current color.
green : [float] The new green value for the current color.
blue : [float] The new blue value for the current color.
%inst
Sets the current color. | glColor3f function (Gl.h)

[戻り値]
This function does not return a value.

[備考]
The GL stores both a current single-valued color index and a current
four-valued RGBA color. **glcolor** sets a new four-valued RGBA
color. **glcolor** has two major variants: **glcolor3** and
**glcolor4**. **glcolor3** variants specify new red, green, and blue
values explicitly and set the current alpha value to 1.0 (full
intensity) implicitly. **glcolor4** variants specify all four color
components explicitly. **glcolor3b**, **glcolor4b**, **glcolor3s**,
**glcolor4s**, **glcolor3i**, and **glcolor4i** take three or four
signed byte, short, or long integers as arguments. When v is appended
to the name, the color commands can take a pointer to an array of
such values. Current color values are stored in floating-point
format, with unspecified mantissa and exponent sizes. Unsigned
integer color components, when specified, are linearly mapped to
floating-point values such that the largest representable value maps
to 1.0 (full intensity), and 0 maps to 0.0 (zero intensity). Signed
integer color components, when specified, are linearly mapped to
floating-point values such that the most positive representable value
maps to 1.0, and the most negative representable value maps to -1.0.
(Note that this mapping does not convert 0 precisely to 0.0.)
Floating-point values are mapped directly. Neither floating-point nor
signed integer values are clamped to the range \[0,1\] before the
current color is updated. However, color components are clamped to
this range before they are interpolated or written into a color
buffer.


%index
glColor3fv
Sets the current color from an already existing array of color values. | glColor3fv function (Gl.h)
%group
Win32 opengl32
%prm
v
v : [var] A pointer to an array that contains red, green, and blue values.
%inst
Sets the current color from an already existing array of color
values. | glColor3fv function (Gl.h)

[戻り値]
This function does not return a value.

[備考]
The GL stores both a current single-valued color index and a current
four-valued RGBA color. **glcolor** sets a new four-valued RGBA
color. **glcolor** has two major variants: **glcolor3** and
**glcolor4**. **glcolor3** variants specify new red, green, and blue
values explicitly and set the current alpha value to 1.0 (full
intensity) implicitly. **glcolor4** variants specify all four color
components explicitly. **glcolor3b**, **glcolor4b**, **glcolor3s**,
**glcolor4s**, **glcolor3i**, and **glcolor4i** take three or four
signed byte, short, or long integers as arguments. When v is appended
to the name, the color commands can take a pointer to an array of
such values. Current color values are stored in floating-point
format, with unspecified mantissa and exponent sizes. Unsigned
integer color components, when specified, are linearly mapped to
floating-point values such that the largest representable value maps
to 1.0 (full intensity), and 0 maps to 0.0 (zero intensity). Signed
integer color components, when specified, are linearly mapped to
floating-point values such that the most positive representable value
maps to 1.0, and the most negative representable value maps to -1.0.
(Note that this mapping does not convert 0 precisely to 0.0.)
Floating-point values are mapped directly. Neither floating-point nor
signed integer values are clamped to the range \[0,1\] before the
current color is updated. However, color components are clamped to
this range before they are interpolated or written into a color
buffer.


%index
glColor3i
Sets the current color. | glColor3i function (Gl.h)
%group
Win32 opengl32
%prm
red, green, blue
red : [int] The new red value for the current color.
green : [int] The new green value for the current color.
blue : [int] The new blue value for the current color.
%inst
Sets the current color. | glColor3i function (Gl.h)

[戻り値]
This function does not return a value.

[備考]
The GL stores both a current single-valued color index and a current
four-valued RGBA color. **glcolor** sets a new four-valued RGBA
color. **glcolor** has two major variants: **glcolor3** and
**glcolor4**. **glcolor3** variants specify new red, green, and blue
values explicitly and set the current alpha value to 1.0 (full
intensity) implicitly. **glcolor4** variants specify all four color
components explicitly. **glcolor3b**, **glcolor4b**, **glcolor3s**,
**glcolor4s**, **glcolor3i**, and **glcolor4i** take three or four
signed byte, short, or long integers as arguments. When v is appended
to the name, the color commands can take a pointer to an array of
such values. Current color values are stored in floating-point
format, with unspecified mantissa and exponent sizes. Unsigned
integer color components, when specified, are linearly mapped to
floating-point values such that the largest representable value maps
to 1.0 (full intensity), and 0 maps to 0.0 (zero intensity). Signed
integer color components, when specified, are linearly mapped to
floating-point values such that the most positive representable value
maps to 1.0, and the most negative representable value maps to -1.0.
(Note that this mapping does not convert 0 precisely to 0.0.)
Floating-point values are mapped directly. Neither floating-point nor
signed integer values are clamped to the range \[0,1\] before the
current color is updated. However, color components are clamped to
this range before they are interpolated or written into a color
buffer.


%index
glColor3iv
Sets the current color from an already existing array of color values. | glColor3iv function (Gl.h)
%group
Win32 opengl32
%prm
v
v : [var] A pointer to an array that contains red, green, and blue values.
%inst
Sets the current color from an already existing array of color
values. | glColor3iv function (Gl.h)

[戻り値]
This function does not return a value.

[備考]
The GL stores both a current single-valued color index and a current
four-valued RGBA color. **glcolor** sets a new four-valued RGBA
color. **glcolor** has two major variants: **glcolor3** and
**glcolor4**. **glcolor3** variants specify new red, green, and blue
values explicitly and set the current alpha value to 1.0 (full
intensity) implicitly. **glcolor4** variants specify all four color
components explicitly. **glcolor3b**, **glcolor4b**, **glcolor3s**,
**glcolor4s**, **glcolor3i**, and **glcolor4i** take three or four
signed byte, short, or long integers as arguments. When v is appended
to the name, the color commands can take a pointer to an array of
such values. Current color values are stored in floating-point
format, with unspecified mantissa and exponent sizes. Unsigned
integer color components, when specified, are linearly mapped to
floating-point values such that the largest representable value maps
to 1.0 (full intensity), and 0 maps to 0.0 (zero intensity). Signed
integer color components, when specified, are linearly mapped to
floating-point values such that the most positive representable value
maps to 1.0, and the most negative representable value maps to -1.0.
(Note that this mapping does not convert 0 precisely to 0.0.)
Floating-point values are mapped directly. Neither floating-point nor
signed integer values are clamped to the range \[0,1\] before the
current color is updated. However, color components are clamped to
this range before they are interpolated or written into a color
buffer.


%index
glColor3s
Sets the current color. | glColor3s function (Gl.h)
%group
Win32 opengl32
%prm
red, green, blue
red : [int] The new red value for the current color.
green : [int] The new green value for the current color.
blue : [int] The new blue value for the current color.
%inst
Sets the current color. | glColor3s function (Gl.h)

[戻り値]
This function does not return a value.

[備考]
The GL stores both a current single-valued color index and a current
four-valued RGBA color. **glcolor** sets a new four-valued RGBA
color. **glcolor** has two major variants: **glcolor3** and
**glcolor4**. **glcolor3** variants specify new red, green, and blue
values explicitly and set the current alpha value to 1.0 (full
intensity) implicitly. **glcolor4** variants specify all four color
components explicitly. **glcolor3b**, **glcolor4b**, **glcolor3s**,
**glcolor4s**, **glcolor3i**, and **glcolor4i** take three or four
signed byte, short, or long integers as arguments. When v is appended
to the name, the color commands can take a pointer to an array of
such values. Current color values are stored in floating-point
format, with unspecified mantissa and exponent sizes. Unsigned
integer color components, when specified, are linearly mapped to
floating-point values such that the largest representable value maps
to 1.0 (full intensity), and 0 maps to 0.0 (zero intensity). Signed
integer color components, when specified, are linearly mapped to
floating-point values such that the most positive representable value
maps to 1.0, and the most negative representable value maps to -1.0.
(Note that this mapping does not convert 0 precisely to 0.0.)
Floating-point values are mapped directly. Neither floating-point nor
signed integer values are clamped to the range \[0,1\] before the
current color is updated. However, color components are clamped to
this range before they are interpolated or written into a color
buffer.


%index
glColor3sv
Sets the current color from an already existing array of color values. | glColor3sv function (Gl.h)
%group
Win32 opengl32
%prm
v
v : [var] A pointer to an array that contains red, green, and blue values.
%inst
Sets the current color from an already existing array of color
values. | glColor3sv function (Gl.h)

[戻り値]
This function does not return a value.

[備考]
The GL stores both a current single-valued color index and a current
four-valued RGBA color. **glcolor** sets a new four-valued RGBA
color. **glcolor** has two major variants: **glcolor3** and
**glcolor4**. **glcolor3** variants specify new red, green, and blue
values explicitly and set the current alpha value to 1.0 (full
intensity) implicitly. **glcolor4** variants specify all four color
components explicitly. **glcolor3b**, **glcolor4b**, **glcolor3s**,
**glcolor4s**, **glcolor3i**, and **glcolor4i** take three or four
signed byte, short, or long integers as arguments. When v is appended
to the name, the color commands can take a pointer to an array of
such values. Current color values are stored in floating-point
format, with unspecified mantissa and exponent sizes. Unsigned
integer color components, when specified, are linearly mapped to
floating-point values such that the largest representable value maps
to 1.0 (full intensity), and 0 maps to 0.0 (zero intensity). Signed
integer color components, when specified, are linearly mapped to
floating-point values such that the most positive representable value
maps to 1.0, and the most negative representable value maps to -1.0.
(Note that this mapping does not convert 0 precisely to 0.0.)
Floating-point values are mapped directly. Neither floating-point nor
signed integer values are clamped to the range \[0,1\] before the
current color is updated. However, color components are clamped to
this range before they are interpolated or written into a color
buffer.


%index
glColor3ub
Sets the current color. | glColor3ub function (Gl.h)
%group
Win32 opengl32
%prm
red, green, blue
red : [int] The new red value for the current color.
green : [int] The new green value for the current color.
blue : [int] The new blue value for the current color.
%inst
Sets the current color. | glColor3ub function (Gl.h)

[戻り値]
This function does not return a value.

[備考]
The GL stores both a current single-valued color index and a current
four-valued RGBA color. **glcolor** sets a new four-valued RGBA
color. **glcolor** has two major variants: **glcolor3** and
**glcolor4**. **glcolor3** variants specify new red, green, and blue
values explicitly and set the current alpha value to 1.0 (full
intensity) implicitly. **glcolor4** variants specify all four color
components explicitly. **glcolor3b**, **glcolor4b**, **glcolor3s**,
**glcolor4s**, **glcolor3i**, and **glcolor4i** take three or four
signed byte, short, or long integers as arguments. When v is appended
to the name, the color commands can take a pointer to an array of
such values. Current color values are stored in floating-point
format, with unspecified mantissa and exponent sizes. Unsigned
integer color components, when specified, are linearly mapped to
floating-point values such that the largest representable value maps
to 1.0 (full intensity), and 0 maps to 0.0 (zero intensity). Signed
integer color components, when specified, are linearly mapped to
floating-point values such that the most positive representable value
maps to 1.0, and the most negative representable value maps to -1.0.
(Note that this mapping does not convert 0 precisely to 0.0.)
Floating-point values are mapped directly. Neither floating-point nor
signed integer values are clamped to the range \[0,1\] before the
current color is updated. However, color components are clamped to
this range before they are interpolated or written into a color
buffer.


%index
glColor3ubv
Sets the current color from an already existing array of color values. | glColor3ubv function (Gl.h)
%group
Win32 opengl32
%prm
v
v : [var] A pointer to an array that contains red, green, and blue values.
%inst
Sets the current color from an already existing array of color
values. | glColor3ubv function (Gl.h)

[戻り値]
This function does not return a value.

[備考]
The GL stores both a current single-valued color index and a current
four-valued RGBA color. **glcolor** sets a new four-valued RGBA
color. **glcolor** has two major variants: **glcolor3** and
**glcolor4**. **glcolor3** variants specify new red, green, and blue
values explicitly and set the current alpha value to 1.0 (full
intensity) implicitly. **glcolor4** variants specify all four color
components explicitly. **glcolor3b**, **glcolor4b**, **glcolor3s**,
**glcolor4s**, **glcolor3i**, and **glcolor4i** take three or four
signed byte, short, or long integers as arguments. When v is appended
to the name, the color commands can take a pointer to an array of
such values. Current color values are stored in floating-point
format, with unspecified mantissa and exponent sizes. Unsigned
integer color components, when specified, are linearly mapped to
floating-point values such that the largest representable value maps
to 1.0 (full intensity), and 0 maps to 0.0 (zero intensity). Signed
integer color components, when specified, are linearly mapped to
floating-point values such that the most positive representable value
maps to 1.0, and the most negative representable value maps to -1.0.
(Note that this mapping does not convert 0 precisely to 0.0.)
Floating-point values are mapped directly. Neither floating-point nor
signed integer values are clamped to the range \[0,1\] before the
current color is updated. However, color components are clamped to
this range before they are interpolated or written into a color
buffer.


%index
glColor3ui
Sets the current color. | glColor3ui function (Gl.h)
%group
Win32 opengl32
%prm
red, green, blue
red : [int] The new red value for the current color.
green : [int] The new green value for the current color.
blue : [int] The new blue value for the current color.
%inst
Sets the current color. | glColor3ui function (Gl.h)

[戻り値]
This function does not return a value.

[備考]
The GL stores both a current single-valued color index and a current
four-valued RGBA color. **glcolor** sets a new four-valued RGBA
color. **glcolor** has two major variants: **glcolor3** and
**glcolor4**. **glcolor3** variants specify new red, green, and blue
values explicitly and set the current alpha value to 1.0 (full
intensity) implicitly. **glcolor4** variants specify all four color
components explicitly. **glcolor3b**, **glcolor4b**, **glcolor3s**,
**glcolor4s**, **glcolor3i**, and **glcolor4i** take three or four
signed byte, short, or long integers as arguments. When v is appended
to the name, the color commands can take a pointer to an array of
such values. Current color values are stored in floating-point
format, with unspecified mantissa and exponent sizes. Unsigned
integer color components, when specified, are linearly mapped to
floating-point values such that the largest representable value maps
to 1.0 (full intensity), and 0 maps to 0.0 (zero intensity). Signed
integer color components, when specified, are linearly mapped to
floating-point values such that the most positive representable value
maps to 1.0, and the most negative representable value maps to -1.0.
(Note that this mapping does not convert 0 precisely to 0.0.)
Floating-point values are mapped directly. Neither floating-point nor
signed integer values are clamped to the range \[0,1\] before the
current color is updated. However, color components are clamped to
this range before they are interpolated or written into a color
buffer.


%index
glColor3uiv
Sets the current color from an already existing array of color values. | glColor3uiv function (Gl.h)
%group
Win32 opengl32
%prm
v
v : [var] A pointer to an array that contains red, green, and blue values.
%inst
Sets the current color from an already existing array of color
values. | glColor3uiv function (Gl.h)

[戻り値]
This function does not return a value.

[備考]
The GL stores both a current single-valued color index and a current
four-valued RGBA color. **glcolor** sets a new four-valued RGBA
color. **glcolor** has two major variants: **glcolor3** and
**glcolor4**. **glcolor3** variants specify new red, green, and blue
values explicitly and set the current alpha value to 1.0 (full
intensity) implicitly. **glcolor4** variants specify all four color
components explicitly. **glcolor3b**, **glcolor4b**, **glcolor3s**,
**glcolor4s**, **glcolor3i**, and **glcolor4i** take three or four
signed byte, short, or long integers as arguments. When v is appended
to the name, the color commands can take a pointer to an array of
such values. Current color values are stored in floating-point
format, with unspecified mantissa and exponent sizes. Unsigned
integer color components, when specified, are linearly mapped to
floating-point values such that the largest representable value maps
to 1.0 (full intensity), and 0 maps to 0.0 (zero intensity). Signed
integer color components, when specified, are linearly mapped to
floating-point values such that the most positive representable value
maps to 1.0, and the most negative representable value maps to -1.0.
(Note that this mapping does not convert 0 precisely to 0.0.)
Floating-point values are mapped directly. Neither floating-point nor
signed integer values are clamped to the range \[0,1\] before the
current color is updated. However, color components are clamped to
this range before they are interpolated or written into a color
buffer.


%index
glColor3us
Sets the current color. | glColor3us function (Gl.h)
%group
Win32 opengl32
%prm
red, green, blue
red : [int] The new red value for the current color.
green : [int] The new green value for the current color.
blue : [int] The new blue value for the current color.
%inst
Sets the current color. | glColor3us function (Gl.h)

[戻り値]
This function does not return a value.

[備考]
The GL stores both a current single-valued color index and a current
four-valued RGBA color. **glcolor** sets a new four-valued RGBA
color. **glcolor** has two major variants: **glcolor3** and
**glcolor4**. **glcolor3** variants specify new red, green, and blue
values explicitly and set the current alpha value to 1.0 (full
intensity) implicitly. **glcolor4** variants specify all four color
components explicitly. **glcolor3b**, **glcolor4b**, **glcolor3s**,
**glcolor4s**, **glcolor3i**, and **glcolor4i** take three or four
signed byte, short, or long integers as arguments. When v is appended
to the name, the color commands can take a pointer to an array of
such values. Current color values are stored in floating-point
format, with unspecified mantissa and exponent sizes. Unsigned
integer color components, when specified, are linearly mapped to
floating-point values such that the largest representable value maps
to 1.0 (full intensity), and 0 maps to 0.0 (zero intensity). Signed
integer color components, when specified, are linearly mapped to
floating-point values such that the most positive representable value
maps to 1.0, and the most negative representable value maps to -1.0.
(Note that this mapping does not convert 0 precisely to 0.0.)
Floating-point values are mapped directly. Neither floating-point nor
signed integer values are clamped to the range \[0,1\] before the
current color is updated. However, color components are clamped to
this range before they are interpolated or written into a color
buffer.


%index
glColor3usv
Sets the current color from an already existing array of color values. | glColor3usv function (Gl.h)
%group
Win32 opengl32
%prm
v
v : [var] A pointer to an array that contains red, green, and blue values.
%inst
Sets the current color from an already existing array of color
values. | glColor3usv function (Gl.h)

[戻り値]
This function does not return a value.

[備考]
The GL stores both a current single-valued color index and a current
four-valued RGBA color. **glcolor** sets a new four-valued RGBA
color. **glcolor** has two major variants: **glcolor3** and
**glcolor4**. **glcolor3** variants specify new red, green, and blue
values explicitly and set the current alpha value to 1.0 (full
intensity) implicitly. **glcolor4** variants specify all four color
components explicitly. **glcolor3b**, **glcolor4b**, **glcolor3s**,
**glcolor4s**, **glcolor3i**, and **glcolor4i** take three or four
signed byte, short, or long integers as arguments. When v is appended
to the name, the color commands can take a pointer to an array of
such values. Current color values are stored in floating-point
format, with unspecified mantissa and exponent sizes. Unsigned
integer color components, when specified, are linearly mapped to
floating-point values such that the largest representable value maps
to 1.0 (full intensity), and 0 maps to 0.0 (zero intensity). Signed
integer color components, when specified, are linearly mapped to
floating-point values such that the most positive representable value
maps to 1.0, and the most negative representable value maps to -1.0.
(Note that this mapping does not convert 0 precisely to 0.0.)
Floating-point values are mapped directly. Neither floating-point nor
signed integer values are clamped to the range \[0,1\] before the
current color is updated. However, color components are clamped to
this range before they are interpolated or written into a color
buffer.


%index
glColor4b
Sets the current color. | glColor4b function (Gl.h)
%group
Win32 opengl32
%prm
red, green, blue, alpha
red : [int] The new red value for the current color.
green : [int] The new green value for the current color.
blue : [int] The new blue value for the current color.
alpha : [int] The new alpha value for the current color.
%inst
Sets the current color. | glColor4b function (Gl.h)

[戻り値]
This function does not return a value.

[備考]
The GL stores both a current single-valued color index and a current
four-valued RGBA color. **glcolor** sets a new four-valued RGBA
color. **glcolor** has two major variants: **glcolor3** and
**glcolor4**. **glcolor3** variants specify new red, green, and blue
values explicitly and set the current alpha value to 1.0 (full
intensity) implicitly. **glcolor4** variants specify all four color
components explicitly. **glcolor3b**, **glcolor4b**, **glcolor3s**,
**glcolor4s**, **glcolor3i**, and **glcolor4i** take three or four
signed byte, short, or long integers as arguments. When v is appended
to the name, the color commands can take a pointer to an array of
such values. Current color values are stored in floating-point
format, with unspecified mantissa and exponent sizes. Unsigned
integer color components, when specified, are linearly mapped to
floating-point values such that the largest representable value maps
to 1.0 (full intensity), and 0 maps to 0.0 (zero intensity). Signed
integer color components, when specified, are linearly mapped to
floating-point values such that the most positive representable value
maps to 1.0, and the most negative representable value maps to -1.0.
(Note that this mapping does not convert 0 precisely to 0.0.)
Floating-point values are mapped directly. Neither floating-point nor
signed integer values are clamped to the range \[0,1\] before the
current color is updated. However, color components are clamped to
this range before they are interpolated or written into a color
buffer.


%index
glColor4bv
Sets the current color from an already existing array of color values. | glColor4bv function (Gl.h)
%group
Win32 opengl32
%prm
v
v : [var] A pointer to an array that contains red, green, blue, and alpha values.
%inst
Sets the current color from an already existing array of color
values. | glColor4bv function (Gl.h)

[戻り値]
This function does not return a value.

[備考]
The GL stores both a current single-valued color index and a current
four-valued RGBA color. **glcolor** sets a new four-valued RGBA
color. **glcolor** has two major variants: **glcolor3** and
**glcolor4**. **glcolor3** variants specify new red, green, and blue
values explicitly and set the current alpha value to 1.0 (full
intensity) implicitly. **glcolor4** variants specify all four color
components explicitly. **glcolor3b**, **glcolor4b**, **glcolor3s**,
**glcolor4s**, **glcolor3i**, and **glcolor4i** take three or four
signed byte, short, or long integers as arguments. When v is appended
to the name, the color commands can take a pointer to an array of
such values. Current color values are stored in floating-point
format, with unspecified mantissa and exponent sizes. Unsigned
integer color components, when specified, are linearly mapped to
floating-point values such that the largest representable value maps
to 1.0 (full intensity), and 0 maps to 0.0 (zero intensity). Signed
integer color components, when specified, are linearly mapped to
floating-point values such that the most positive representable value
maps to 1.0, and the most negative representable value maps to -1.0.
(Note that this mapping does not convert 0 precisely to 0.0.)
Floating-point values are mapped directly. Neither floating-point nor
signed integer values are clamped to the range \[0,1\] before the
current color is updated. However, color components are clamped to
this range before they are interpolated or written into a color
buffer.


%index
glColor4d
Sets the current color. | glColor4d function (Gl.h)
%group
Win32 opengl32
%prm
red, green, blue, alpha
red : [double] The new red value for the current color.
green : [double] The new green value for the current color.
blue : [double] The new blue value for the current color.
alpha : [double] The new alpha value for the current color.
%inst
Sets the current color. | glColor4d function (Gl.h)

[戻り値]
This function does not return a value.

[備考]
The GL stores both a current single-valued color index and a current
four-valued RGBA color. **glcolor** sets a new four-valued RGBA
color. **glcolor** has two major variants: **glcolor3** and
**glcolor4**. **glcolor3** variants specify new red, green, and blue
values explicitly and set the current alpha value to 1.0 (full
intensity) implicitly. **glcolor4** variants specify all four color
components explicitly. **glcolor3b**, **glcolor4b**, **glcolor3s**,
**glcolor4s**, **glcolor3i**, and **glcolor4i** take three or four
signed byte, short, or long integers as arguments. When v is appended
to the name, the color commands can take a pointer to an array of
such values. Current color values are stored in floating-point
format, with unspecified mantissa and exponent sizes. Unsigned
integer color components, when specified, are linearly mapped to
floating-point values such that the largest representable value maps
to 1.0 (full intensity), and 0 maps to 0.0 (zero intensity). Signed
integer color components, when specified, are linearly mapped to
floating-point values such that the most positive representable value
maps to 1.0, and the most negative representable value maps to -1.0.
(Note that this mapping does not convert 0 precisely to 0.0.)
Floating-point values are mapped directly. Neither floating-point nor
signed integer values are clamped to the range \[0,1\] before the
current color is updated. However, color components are clamped to
this range before they are interpolated or written into a color
buffer.


%index
glColor4dv
Sets the current color from an already existing array of color values. | glColor4dv function (Gl.h)
%group
Win32 opengl32
%prm
v
v : [var] A pointer to an array that contains red, green, blue, and alpha values.
%inst
Sets the current color from an already existing array of color
values. | glColor4dv function (Gl.h)

[戻り値]
This function does not return a value.

[備考]
The GL stores both a current single-valued color index and a current
four-valued RGBA color. **glcolor** sets a new four-valued RGBA
color. **glcolor** has two major variants: **glcolor3** and
**glcolor4**. **glcolor3** variants specify new red, green, and blue
values explicitly and set the current alpha value to 1.0 (full
intensity) implicitly. **glcolor4** variants specify all four color
components explicitly. **glcolor3b**, **glcolor4b**, **glcolor3s**,
**glcolor4s**, **glcolor3i**, and **glcolor4i** take three or four
signed byte, short, or long integers as arguments. When v is appended
to the name, the color commands can take a pointer to an array of
such values. Current color values are stored in floating-point
format, with unspecified mantissa and exponent sizes. Unsigned
integer color components, when specified, are linearly mapped to
floating-point values such that the largest representable value maps
to 1.0 (full intensity), and 0 maps to 0.0 (zero intensity). Signed
integer color components, when specified, are linearly mapped to
floating-point values such that the most positive representable value
maps to 1.0, and the most negative representable value maps to -1.0.
(Note that this mapping does not convert 0 precisely to 0.0.)
Floating-point values are mapped directly. Neither floating-point nor
signed integer values are clamped to the range \[0,1\] before the
current color is updated. However, color components are clamped to
this range before they are interpolated or written into a color
buffer.


%index
glColor4f
Sets the current color. | glColor4f function (Gl.h)
%group
Win32 opengl32
%prm
red, green, blue, alpha
red : [float] The new red value for the current color.
green : [float] The new green value for the current color.
blue : [float] The new blue value for the current color.
alpha : [float] The new alpha value for the current color.
%inst
Sets the current color. | glColor4f function (Gl.h)

[戻り値]
This function does not return a value.

[備考]
The GL stores both a current single-valued color index and a current
four-valued RGBA color. **glcolor** sets a new four-valued RGBA
color. **glcolor** has two major variants: **glcolor3** and
**glcolor4**. **glcolor3** variants specify new red, green, and blue
values explicitly and set the current alpha value to 1.0 (full
intensity) implicitly. **glcolor4** variants specify all four color
components explicitly. **glcolor3b**, **glcolor4b**, **glcolor3s**,
**glcolor4s**, **glcolor3i**, and **glcolor4i** take three or four
signed byte, short, or long integers as arguments. When v is appended
to the name, the color commands can take a pointer to an array of
such values. Current color values are stored in floating-point
format, with unspecified mantissa and exponent sizes. Unsigned
integer color components, when specified, are linearly mapped to
floating-point values such that the largest representable value maps
to 1.0 (full intensity), and 0 maps to 0.0 (zero intensity). Signed
integer color components, when specified, are linearly mapped to
floating-point values such that the most positive representable value
maps to 1.0, and the most negative representable value maps to -1.0.
(Note that this mapping does not convert 0 precisely to 0.0.)
Floating-point values are mapped directly. Neither floating-point nor
signed integer values are clamped to the range \[0,1\] before the
current color is updated. However, color components are clamped to
this range before they are interpolated or written into a color
buffer.


%index
glColor4fv
Sets the current color from an already existing array of color values. | glColor4fv function (Gl.h)
%group
Win32 opengl32
%prm
v
v : [var] A pointer to an array that contains red, green, blue, and alpha values.
%inst
Sets the current color from an already existing array of color
values. | glColor4fv function (Gl.h)

[戻り値]
This function does not return a value.

[備考]
The GL stores both a current single-valued color index and a current
four-valued RGBA color. **glcolor** sets a new four-valued RGBA
color. **glcolor** has two major variants: **glcolor3** and
**glcolor4**. **glcolor3** variants specify new red, green, and blue
values explicitly and set the current alpha value to 1.0 (full
intensity) implicitly. **glcolor4** variants specify all four color
components explicitly. **glcolor3b**, **glcolor4b**, **glcolor3s**,
**glcolor4s**, **glcolor3i**, and **glcolor4i** take three or four
signed byte, short, or long integers as arguments. When v is appended
to the name, the color commands can take a pointer to an array of
such values. Current color values are stored in floating-point
format, with unspecified mantissa and exponent sizes. Unsigned
integer color components, when specified, are linearly mapped to
floating-point values such that the largest representable value maps
to 1.0 (full intensity), and 0 maps to 0.0 (zero intensity). Signed
integer color components, when specified, are linearly mapped to
floating-point values such that the most positive representable value
maps to 1.0, and the most negative representable value maps to -1.0.
(Note that this mapping does not convert 0 precisely to 0.0.)
Floating-point values are mapped directly. Neither floating-point nor
signed integer values are clamped to the range \[0,1\] before the
current color is updated. However, color components are clamped to
this range before they are interpolated or written into a color
buffer.


%index
glColor4i
Sets the current color. | glColor4i function (Gl.h)
%group
Win32 opengl32
%prm
red, green, blue, alpha
red : [int] The new red value for the current color.
green : [int] The new green value for the current color.
blue : [int] The new blue value for the current color.
alpha : [int] The new alpha value for the current color.
%inst
Sets the current color. | glColor4i function (Gl.h)

[戻り値]
This function does not return a value.

[備考]
The GL stores both a current single-valued color index and a current
four-valued RGBA color. **glcolor** sets a new four-valued RGBA
color. **glcolor** has two major variants: **glcolor3** and
**glcolor4**. **glcolor3** variants specify new red, green, and blue
values explicitly and set the current alpha value to 1.0 (full
intensity) implicitly. **glcolor4** variants specify all four color
components explicitly. **glcolor3b**, **glcolor4b**, **glcolor3s**,
**glcolor4s**, **glcolor3i**, and **glcolor4i** take three or four
signed byte, short, or long integers as arguments. When v is appended
to the name, the color commands can take a pointer to an array of
such values. Current color values are stored in floating-point
format, with unspecified mantissa and exponent sizes. Unsigned
integer color components, when specified, are linearly mapped to
floating-point values such that the largest representable value maps
to 1.0 (full intensity), and 0 maps to 0.0 (zero intensity). Signed
integer color components, when specified, are linearly mapped to
floating-point values such that the most positive representable value
maps to 1.0, and the most negative representable value maps to -1.0.
(Note that this mapping does not convert 0 precisely to 0.0.)
Floating-point values are mapped directly. Neither floating-point nor
signed integer values are clamped to the range \[0,1\] before the
current color is updated. However, color components are clamped to
this range before they are interpolated or written into a color
buffer.


%index
glColor4iv
Sets the current color from an already existing array of color values. | glColor4iv function (Gl.h)
%group
Win32 opengl32
%prm
v
v : [var] A pointer to an array that contains red, green, blue, and alpha values.
%inst
Sets the current color from an already existing array of color
values. | glColor4iv function (Gl.h)

[戻り値]
This function does not return a value.

[備考]
The GL stores both a current single-valued color index and a current
four-valued RGBA color. **glcolor** sets a new four-valued RGBA
color. **glcolor** has two major variants: **glcolor3** and
**glcolor4**. **glcolor3** variants specify new red, green, and blue
values explicitly and set the current alpha value to 1.0 (full
intensity) implicitly. **glcolor4** variants specify all four color
components explicitly. **glcolor3b**, **glcolor4b**, **glcolor3s**,
**glcolor4s**, **glcolor3i**, and **glcolor4i** take three or four
signed byte, short, or long integers as arguments. When v is appended
to the name, the color commands can take a pointer to an array of
such values. Current color values are stored in floating-point
format, with unspecified mantissa and exponent sizes. Unsigned
integer color components, when specified, are linearly mapped to
floating-point values such that the largest representable value maps
to 1.0 (full intensity), and 0 maps to 0.0 (zero intensity). Signed
integer color components, when specified, are linearly mapped to
floating-point values such that the most positive representable value
maps to 1.0, and the most negative representable value maps to -1.0.
(Note that this mapping does not convert 0 precisely to 0.0.)
Floating-point values are mapped directly. Neither floating-point nor
signed integer values are clamped to the range \[0,1\] before the
current color is updated. However, color components are clamped to
this range before they are interpolated or written into a color
buffer.


%index
glColor4s
Sets the current color. | glColor4s function (Gl.h)
%group
Win32 opengl32
%prm
red, green, blue, alpha
red : [int] The new red value for the current color.
green : [int] The new green value for the current color.
blue : [int] The new blue value for the current color.
alpha : [int] The new alpha value for the current color.
%inst
Sets the current color. | glColor4s function (Gl.h)

[戻り値]
This function does not return a value.

[備考]
The GL stores both a current single-valued color index and a current
four-valued RGBA color. **glcolor** sets a new four-valued RGBA
color. **glcolor** has two major variants: **glcolor3** and
**glcolor4**. **glcolor3** variants specify new red, green, and blue
values explicitly and set the current alpha value to 1.0 (full
intensity) implicitly. **glcolor4** variants specify all four color
components explicitly. **glcolor3b**, **glcolor4b**, **glcolor3s**,
**glcolor4s**, **glcolor3i**, and **glcolor4i** take three or four
signed byte, short, or long integers as arguments. When v is appended
to the name, the color commands can take a pointer to an array of
such values. Current color values are stored in floating-point
format, with unspecified mantissa and exponent sizes. Unsigned
integer color components, when specified, are linearly mapped to
floating-point values such that the largest representable value maps
to 1.0 (full intensity), and 0 maps to 0.0 (zero intensity). Signed
integer color components, when specified, are linearly mapped to
floating-point values such that the most positive representable value
maps to 1.0, and the most negative representable value maps to -1.0.
(Note that this mapping does not convert 0 precisely to 0.0.)
Floating-point values are mapped directly. Neither floating-point nor
signed integer values are clamped to the range \[0,1\] before the
current color is updated. However, color components are clamped to
this range before they are interpolated or written into a color
buffer.


%index
glColor4sv
Sets the current color from an already existing array of color values. | glColor4sv function (Gl.h)
%group
Win32 opengl32
%prm
v
v : [var] A pointer to an array that contains red, green, blue, and alpha values.
%inst
Sets the current color from an already existing array of color
values. | glColor4sv function (Gl.h)

[戻り値]
This function does not return a value.

[備考]
The GL stores both a current single-valued color index and a current
four-valued RGBA color. **glcolor** sets a new four-valued RGBA
color. **glcolor** has two major variants: **glcolor3** and
**glcolor4**. **glcolor3** variants specify new red, green, and blue
values explicitly and set the current alpha value to 1.0 (full
intensity) implicitly. **glcolor4** variants specify all four color
components explicitly. **glcolor3b**, **glcolor4b**, **glcolor3s**,
**glcolor4s**, **glcolor3i**, and **glcolor4i** take three or four
signed byte, short, or long integers as arguments. When v is appended
to the name, the color commands can take a pointer to an array of
such values. Current color values are stored in floating-point
format, with unspecified mantissa and exponent sizes. Unsigned
integer color components, when specified, are linearly mapped to
floating-point values such that the largest representable value maps
to 1.0 (full intensity), and 0 maps to 0.0 (zero intensity). Signed
integer color components, when specified, are linearly mapped to
floating-point values such that the most positive representable value
maps to 1.0, and the most negative representable value maps to -1.0.
(Note that this mapping does not convert 0 precisely to 0.0.)
Floating-point values are mapped directly. Neither floating-point nor
signed integer values are clamped to the range \[0,1\] before the
current color is updated. However, color components are clamped to
this range before they are interpolated or written into a color
buffer.


%index
glColor4ub
Sets the current color. | glColor4ub function (Gl.h)
%group
Win32 opengl32
%prm
red, green, blue, alpha
red : [int] The new red value for the current color.
green : [int] The new green value for the current color.
blue : [int] The new blue value for the current color.
alpha : [int] The new alpha value for the current color.
%inst
Sets the current color. | glColor4ub function (Gl.h)

[戻り値]
This function does not return a value.

[備考]
The GL stores both a current single-valued color index and a current
four-valued RGBA color. **glcolor** sets a new four-valued RGBA
color. **glcolor** has two major variants: **glcolor3** and
**glcolor4**. **glcolor3** variants specify new red, green, and blue
values explicitly and set the current alpha value to 1.0 (full
intensity) implicitly. **glcolor4** variants specify all four color
components explicitly. **glcolor3b**, **glcolor4b**, **glcolor3s**,
**glcolor4s**, **glcolor3i**, and **glcolor4i** take three or four
signed byte, short, or long integers as arguments. When v is appended
to the name, the color commands can take a pointer to an array of
such values. Current color values are stored in floating-point
format, with unspecified mantissa and exponent sizes. Unsigned
integer color components, when specified, are linearly mapped to
floating-point values such that the largest representable value maps
to 1.0 (full intensity), and 0 maps to 0.0 (zero intensity). Signed
integer color components, when specified, are linearly mapped to
floating-point values such that the most positive representable value
maps to 1.0, and the most negative representable value maps to -1.0.
(Note that this mapping does not convert 0 precisely to 0.0.)
Floating-point values are mapped directly. Neither floating-point nor
signed integer values are clamped to the range \[0,1\] before the
current color is updated. However, color components are clamped to
this range before they are interpolated or written into a color
buffer.


%index
glColor4ubv
Sets the current color from an already existing array of color values. | glColor4ubv function (Gl.h)
%group
Win32 opengl32
%prm
v
v : [var] A pointer to an array that contains red, green, blue, and alpha values.
%inst
Sets the current color from an already existing array of color
values. | glColor4ubv function (Gl.h)

[戻り値]
This function does not return a value.

[備考]
The GL stores both a current single-valued color index and a current
four-valued RGBA color. **glcolor** sets a new four-valued RGBA
color. **glcolor** has two major variants: **glcolor3** and
**glcolor4**. **glcolor3** variants specify new red, green, and blue
values explicitly and set the current alpha value to 1.0 (full
intensity) implicitly. **glcolor4** variants specify all four color
components explicitly. **glcolor3b**, **glcolor4b**, **glcolor3s**,
**glcolor4s**, **glcolor3i**, and **glcolor4i** take three or four
signed byte, short, or long integers as arguments. When v is appended
to the name, the color commands can take a pointer to an array of
such values. Current color values are stored in floating-point
format, with unspecified mantissa and exponent sizes. Unsigned
integer color components, when specified, are linearly mapped to
floating-point values such that the largest representable value maps
to 1.0 (full intensity), and 0 maps to 0.0 (zero intensity). Signed
integer color components, when specified, are linearly mapped to
floating-point values such that the most positive representable value
maps to 1.0, and the most negative representable value maps to -1.0.
(Note that this mapping does not convert 0 precisely to 0.0.)
Floating-point values are mapped directly. Neither floating-point nor
signed integer values are clamped to the range \[0,1\] before the
current color is updated. However, color components are clamped to
this range before they are interpolated or written into a color
buffer.


%index
glColor4ui
Sets the current color. | glColor4ui function (Gl.h)
%group
Win32 opengl32
%prm
red, green, blue, alpha
red : [int] The new red value for the current color.
green : [int] The new green value for the current color.
blue : [int] The new blue value for the current color.
alpha : [int] The new alpha value for the current color.
%inst
Sets the current color. | glColor4ui function (Gl.h)

[戻り値]
This function does not return a value.

[備考]
The GL stores both a current single-valued color index and a current
four-valued RGBA color. **glcolor** sets a new four-valued RGBA
color. **glcolor** has two major variants: **glcolor3** and
**glcolor4**. **glcolor3** variants specify new red, green, and blue
values explicitly and set the current alpha value to 1.0 (full
intensity) implicitly. **glcolor4** variants specify all four color
components explicitly. **glcolor3b**, **glcolor4b**, **glcolor3s**,
**glcolor4s**, **glcolor3i**, and **glcolor4i** take three or four
signed byte, short, or long integers as arguments. When v is appended
to the name, the color commands can take a pointer to an array of
such values. Current color values are stored in floating-point
format, with unspecified mantissa and exponent sizes. Unsigned
integer color components, when specified, are linearly mapped to
floating-point values such that the largest representable value maps
to 1.0 (full intensity), and 0 maps to 0.0 (zero intensity). Signed
integer color components, when specified, are linearly mapped to
floating-point values such that the most positive representable value
maps to 1.0, and the most negative representable value maps to -1.0.
(Note that this mapping does not convert 0 precisely to 0.0.)
Floating-point values are mapped directly. Neither floating-point nor
signed integer values are clamped to the range \[0,1\] before the
current color is updated. However, color components are clamped to
this range before they are interpolated or written into a color
buffer.


%index
glColor4uiv
Sets the current color from an already existing array of color values. | glColor4uiv function (Gl.h)
%group
Win32 opengl32
%prm
v
v : [var] A pointer to an array that contains red, green, blue, and alpha values.
%inst
Sets the current color from an already existing array of color
values. | glColor4uiv function (Gl.h)

[戻り値]
This function does not return a value.

[備考]
The GL stores both a current single-valued color index and a current
four-valued RGBA color. **glcolor** sets a new four-valued RGBA
color. **glcolor** has two major variants: **glcolor3** and
**glcolor4**. **glcolor3** variants specify new red, green, and blue
values explicitly and set the current alpha value to 1.0 (full
intensity) implicitly. **glcolor4** variants specify all four color
components explicitly. **glcolor3b**, **glcolor4b**, **glcolor3s**,
**glcolor4s**, **glcolor3i**, and **glcolor4i** take three or four
signed byte, short, or long integers as arguments. When v is appended
to the name, the color commands can take a pointer to an array of
such values. Current color values are stored in floating-point
format, with unspecified mantissa and exponent sizes. Unsigned
integer color components, when specified, are linearly mapped to
floating-point values such that the largest representable value maps
to 1.0 (full intensity), and 0 maps to 0.0 (zero intensity). Signed
integer color components, when specified, are linearly mapped to
floating-point values such that the most positive representable value
maps to 1.0, and the most negative representable value maps to -1.0.
(Note that this mapping does not convert 0 precisely to 0.0.)
Floating-point values are mapped directly. Neither floating-point nor
signed integer values are clamped to the range \[0,1\] before the
current color is updated. However, color components are clamped to
this range before they are interpolated or written into a color
buffer.


%index
glColor4us
Sets the current color. | glColor4us function (Gl.h)
%group
Win32 opengl32
%prm
red, green, blue, alpha
red : [int] The new red value for the current color.
green : [int] The new green value for the current color.
blue : [int] The new blue value for the current color.
alpha : [int] The new alpha value for the current color.
%inst
Sets the current color. | glColor4us function (Gl.h)

[戻り値]
This function does not return a value.

[備考]
The GL stores both a current single-valued color index and a current
four-valued RGBA color. **glcolor** sets a new four-valued RGBA
color. **glcolor** has two major variants: **glcolor3** and
**glcolor4**. **glcolor3** variants specify new red, green, and blue
values explicitly and set the current alpha value to 1.0 (full
intensity) implicitly. **glcolor4** variants specify all four color
components explicitly. **glcolor3b**, **glcolor4b**, **glcolor3s**,
**glcolor4s**, **glcolor3i**, and **glcolor4i** take three or four
signed byte, short, or long integers as arguments. When v is appended
to the name, the color commands can take a pointer to an array of
such values. Current color values are stored in floating-point
format, with unspecified mantissa and exponent sizes. Unsigned
integer color components, when specified, are linearly mapped to
floating-point values such that the largest representable value maps
to 1.0 (full intensity), and 0 maps to 0.0 (zero intensity). Signed
integer color components, when specified, are linearly mapped to
floating-point values such that the most positive representable value
maps to 1.0, and the most negative representable value maps to -1.0.
(Note that this mapping does not convert 0 precisely to 0.0.)
Floating-point values are mapped directly. Neither floating-point nor
signed integer values are clamped to the range \[0,1\] before the
current color is updated. However, color components are clamped to
this range before they are interpolated or written into a color
buffer.


%index
glColor4usv
Sets the current color from an already existing array of color values. | glColor4usv function (Gl.h)
%group
Win32 opengl32
%prm
v
v : [var] A pointer to an array that contains red, green, blue, and alpha values.
%inst
Sets the current color from an already existing array of color
values. | glColor4usv function (Gl.h)

[戻り値]
This function does not return a value.

[備考]
The GL stores both a current single-valued color index and a current
four-valued RGBA color. **glcolor** sets a new four-valued RGBA
color. **glcolor** has two major variants: **glcolor3** and
**glcolor4**. **glcolor3** variants specify new red, green, and blue
values explicitly and set the current alpha value to 1.0 (full
intensity) implicitly. **glcolor4** variants specify all four color
components explicitly. **glcolor3b**, **glcolor4b**, **glcolor3s**,
**glcolor4s**, **glcolor3i**, and **glcolor4i** take three or four
signed byte, short, or long integers as arguments. When v is appended
to the name, the color commands can take a pointer to an array of
such values. Current color values are stored in floating-point
format, with unspecified mantissa and exponent sizes. Unsigned
integer color components, when specified, are linearly mapped to
floating-point values such that the largest representable value maps
to 1.0 (full intensity), and 0 maps to 0.0 (zero intensity). Signed
integer color components, when specified, are linearly mapped to
floating-point values such that the most positive representable value
maps to 1.0, and the most negative representable value maps to -1.0.
(Note that this mapping does not convert 0 precisely to 0.0.)
Floating-point values are mapped directly. Neither floating-point nor
signed integer values are clamped to the range \[0,1\] before the
current color is updated. However, color components are clamped to
this range before they are interpolated or written into a color
buffer.


%index
glColorMask
The glColorMask function enables and disables writing of frame-buffer color components.
%group
Win32 opengl32
%prm
red, green, blue, alpha
red : [int] Specify whether red can or cannot be written into the framebuffer. The default values is GL\_TRUE, indicating that the color component can be written.
green : [int] Specify whether green can or cannot be written into the framebuffer. The default value is GL\_TRUE, indicating that the color component can be written.
blue : [int] Specify whether blue can or cannot be written into the framebuffer. The default value is GL\_TRUE, indicating that the color component can be written.
alpha : [int] Specify whether alpha can or cannot be written into the framebuffer. The default value is GL\_TRUE, indicating that the color component can be written.
%inst
The glColorMask function enables and disables writing of frame-buffer
color components.

[戻り値]
This function does not return a value.

[備考]
The **glColorMask** function specifies whether the individual color
components in the framebuffer can or cannot be written. If *red* is
GL\_FALSE, for example, no change is made to the red component of any
pixel in any of the color buffers, regardless of the drawing
operation attempted. Changes to individual bits of components cannot
be controlled. Rather, changes are either enabled or disabled for
entire color components. The following functions retrieve information
related to **glColorMask**:
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_COLOR\_WRITEMASK **glGet** with argument
GL\_RGBA\_MODE


%index
glColorMaterial
The glColorMaterial function causes a material color to track the current color.
%group
Win32 opengl32
%prm
face, mode
face : [int] Specifies whether front, back, or both front and back material parameters should track the current color. Accepted values are GL\_FRONT, GL\_BACK, and GL\_FRONT\_AND\_BACK. The default value is GL\_FRONT\_AND\_BACK.
mode : [int] Specifies which of several material parameters track the current color. Accepted values are GL\_EMISSION, GL\_AMBIENT, GL\_DIFFUSE, GL\_SPECULAR, and GL\_AMBIENT\_AND\_DIFFUSE. The default value is GL\_AMBIENT\_AND\_DIFFUSE.
%inst
The glColorMaterial function causes a material color to track the
current color.

[戻り値]
This function does not return a value.

[備考]
The **glColorMaterial** function specifies which material parameters
track the current color. When you enable GL\_COLOR\_MATERIAL, for
each of the material or materials specified by *face*, the material
parameter or parameters specified by *mode* track the current color
at all times. Enable and disable GL\_COLOR\_MATERIAL with the
functions [**glEnable**](glenable.md) and
[**glDisable**](gldisable.md), which you call with
GL\_COLOR\_MATERIAL as their argument. By default,
GL\_COLOR\_MATERIAL is disabled. With **glColorMaterial**, you can
change a subset of material parameters for each vertex using only the
[**glColor**](glcolor-functions.md) function, without calling
[**glMaterial**](glmaterial-functions.md). If you are going to
specify only such a subset of parameters for each vertex, it is
better to do so with **glColorMaterial** than with **glMaterial**.
The following functions retrieve information related to
**glColorMaterial**:
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_COLOR\_MATERIAL\_PARAMETER **glGet** with argument
GL\_COLOR\_MATERIAL\_FACE [**glIsEnabled**](glisenabled.md) with
argument GL\_COLOR\_MATERIAL


%index
glColorPointer
The glColorPointer function defines an array of colors.
%group
Win32 opengl32
%prm
size, type, stride, pointer
size : [int] The number of components per color. The value must be either 3 or 4.
type : [int] The data type of each color component in a color array. Acceptable data types are specified with the following constants: GL\_BYTE, GL\_UNSIGNED\_BYTE, GL\_SHORT, GL\_UNSIGNED\_SHORT, GL\_INT, GL\_UNSIGNED\_INT, GL\_FLOAT, or GL\_DOUBLE.
stride : [int] The byte offset between consecutive colors. When *stride* is zero, the colors are tightly packed in the array.
pointer : [intptr] A pointer to the first component of the first color element in a color array.
%inst
The glColorPointer function defines an array of colors.

[戻り値]
This function does not return a value.

[備考]
The **glColorPointer** function specifies the location and data
format of an array of color components to use when rendering. The
*stride* parameter determines the byte offset from one color to the
next, enabling the packing of vertex attributes in a single array or
storage in separate arrays. In some implementations, storing vertex
attributes in a single array can be more efficient than the use of
separate arrays. Enabled the color array by specifying the
GL\_COLOR\_ARRAY constant with
[**glEnableClientState**](glenableclientstate.md). Calling
[**glArrayElement**](glarrayelement.md),
[**glDrawElements**](gldrawelements.md), or
[**glDrawArrays**](gldrawarrays.md) uses the color array that is thus
enabled. By default, the color array is disabled. The
**glColorPointer** calls cannot by entered in display lists. When you
specify a color array using **glColorPointer**, the values of all the
function's color array parameters are saved in a client-side state,
and you can cache static array elements. Because the color array
parameters are in a client-side state,
[**glPushAttrib**](glpushattrib.md) and
[**glPopAttrib**](glpopattrib.md) do not save or restore the
parameters' values. Although specifying the color array within
[**glBegin**](glbegin.md) and [**glend**](glend.md) pairs does not
generate an error, the results are undefined. The following functions
retrieve information related to the **glColorPointer** function:
[**glIsEnabled**](glisenabled.md) with argument GL\_COLOR\_ARRAY
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_COLOR\_ARRAY\_SIZE **glGet** with argument
GL\_COLOR\_ARRAY\_TYPE **glGet** with argument
GL\_COLOR\_ARRAY\_STRIDE **glGet** with argument
GL\_COLOR\_ARRAY\_COUNT [**glGetPointerv**](glgetpointerv.md) with
argument GL\_COLOR\_ARRAY\_POINTER


%index
glCopyPixels
The glCopyPixels function copies pixels in the framebuffer.
%group
Win32 opengl32
%prm
x, y, width, height, type
x : [int] The window x-plane coordinate of the lower-left corner of the rectangular region of pixels to be copied.
y : [int] The window y-plane coordinate of the lower-left corner of the rectangular region of pixels to be copied.
width : [int] The width dimension of the rectangular region of pixels to be copied. Must be nonnegative.
height : [int] The height dimension of the rectangular region of pixels to be copied. Must be nonnegative.
type : [int] Specifies whether **glCopyPixels** is to copy color values, depth values, or stencil values. The acceptable symbolic constants are.
%inst
The glCopyPixels function copies pixels in the framebuffer.

[戻り値]
This function does not return a value.

[備考]
The **glCopyPixels** function copies a screen-aligned rectangle of
pixels from the specified framebuffer location to a region relative
to the current raster position. Its operation is well defined only if
the entire pixel source region is within the exposed portion of the
window. Results of copies from outside the window, or from regions of
the window that are not exposed, are hardware dependent and
undefined. The *x* and *y* parameters specify the window coordinates
of the lower-left corner of the rectangular region to be copied. The
*width* and *height* parameters specify the dimensions of the
rectangular region to be copied. Both *width* and *height* must be
nonnegative. Several parameters control the processing of the pixel
data while it is being copied. These parameters are set with three
functions: [**glPixelTransfer**](glpixeltransfer.md),
[**glPixelMap**](glpixelmap.md), and
[**glPixelZoom**](glpixelzoom.md). This topic describes the effects
on **glCopyPixels** of most, but not all, of the parameters specified
by these three functions. The **glCopyPixels** function copies values
from each pixel with the lower-left corner at (*x* + *i*, *y* + *j*)
for 0 = *i* r , *y*r ) is the current raster position, and a given
pixel is in the *i* location in the *j* row of the source pixel
rectangle, then fragments are generated for pixels whose centers are
in the rectangle with corners at (*x*r + *zoom*? i, yr + *zoom*y *j*)
and (*x*r + *zoom*? (*i* + 1), *y*r + *zoom*y (*j* + 1)) where
*zoom*? is the value of GL\_ZOOM\_X and *zoom*y is the value of
GL\_ZOOM\_Y. Modes specified by
[**glPixelStore**](glpixelstore-functions.md) have no effect on the
operation of **glCopyPixels**. The following functions retrieve
information related to **glCopyPixels**:
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_RASTER\_POSITION **glGet** with argument
GL\_CURRENT\_RASTER\_POSITION\_VALID To copy the color pixel in the
lower-left corner of the window to the current raster position, use
**glCopyPixels**( 0, 0, 1, 1, GL\_COLOR );


%index
glCopyTexImage1D
The glCopyTexImage1D function copies pixels from the framebuffer into a one-dimensional texture image.
%group
Win32 opengl32
%prm
target, level, internalFormat, x, y, width, border
target : [int] The target for which the image data will be changed. Must have the value GL\_TEXTURE\_1D.
level : [int] The level-of-detail number. Level 0 is the base image. Level *n* is the *n*th mipmap reduction image.
internalFormat : [int] The internal format and resolution of the texture data. This parameter must be one of the following symbolic values.
x : [int] The window x-plane coordinate of the lower-left corner of the row of pixels to be copied.
y : [int] The window y-plane coordinate of the lower-left corner of the row of pixels to be copied.
width : [int] The width of the texture image. Must be zero or 2n + 2(*border*) for some integer *n*. The height of the texture image is 1.
border : [int] The width of the border. Must be either zero or 1.
%inst
The glCopyTexImage1D function copies pixels from the framebuffer into
a one-dimensional texture image.

[戻り値]
This function does not return a value.

[備考]
The **glCopyTexImage1D** function defines a one-dimensional texture
image using pixels from the current framebuffer, rather than from
main memory as is the case for [**glTexImage1D**](glteximage1d.md).
Using the mipmap level specified with *level*, texture arrays are
defined as a pixel row aligned with the lower-left corner of the
window at the coordinates specified by *x* and *y*, with a length
equal to *width* + 2 \* *border*. The internal format of the texture
array is specified with the *internalFormat* parameter. The
**glCopyTexImage1D** function processes the pixels in a row in the
same way as [**glCopyPixels**](glcopypixels.md), except that before
the final conversion of the pixels, all pixel component values are
clamped to the range \[0,1\] and converted to the texture's internal
format for storage in the texture array. Pixel ordering is determined
with lower *x* coordinates corresponding to lower texture
coordinates. If any of the pixels within a specified row of the
current framebuffer are outside the window associated with the
current rendering context, then their values are undefined. You
cannot include calls to **glCopyTexImage1D** in display lists. >
[!Note] > The **glCopyTexImage1D** function is only available in
OpenGL version 1.1 or later.
Texturing has no effect in color-index mode. The
[**glPixelStore**](glpixelstore-functions.md) and
[**glPixelTransfer**](glpixeltransfer.md) functions affect texture
images in exactly the way they affect
[**glDrawPixels**](gldrawpixels.md). The following function retrieves
information related to **glCopyTexImage1D**:
[**glIsEnabled**](glisenabled.md) with argument GL\_TEXTURE\_1D


%index
glCopyTexImage2D
The glCopyTexImage2D function copies pixels from the framebuffer into a two-dimensional texture image.
%group
Win32 opengl32
%prm
target, level, internalFormat, x, y, width, height, border
target : [int] The target to which the image data will be changed. Must have the value GL\_TEXTURE\_2D.
level : [int] The level-of-detail number. Level 0 is the base image. Level *n* is the *n*th mipmap reduction image.
internalFormat : [int] The internal format and resolution of the texture data. The values 1, 2, 3, and 4 are not accepted for *internalFormat*. The parameter can assume one of the following symbolic values.
x : [int] The window x-plane coordinate of the lower-left corner of the rectangular region of pixels to be copied.
y : [int] The window y-plane coordinate of the lower-left corner of the rectangular region of pixels to be copied.
width : [int] The width of the texture image. Must be 2n + 2 \* *border* for some integer *n*.
height : [int] The height of the texture image. Must be 2n + 2 \* *border* for some integer *n*.
border : [int] The width of the border. Must be either zero or 1.
%inst
The glCopyTexImage2D function copies pixels from the framebuffer into
a two-dimensional texture image.

[戻り値]
This function does not return a value.

[備考]
The **glCopyTexImage2D** function defines a two-dimensional texture
image using pixels from the current framebuffer, rather than from
main memory as is the case for [**glTexImage2D**](glteximage2d.md).
Using the mipmap level specified with *level*, texture arrays are
defined as a rectangle of pixels with the lower-left corner located
at the coordinates *x* and *y*, width equal to *width* + (2 \*
*border*), and a height equal to *height* + (2 \* *border*). The
internal format of the texture array is specified with the
*internalFormat* parameter. The **glCopyTexImage2D** function
processes the pixels in a row in the same way as
[**glCopyPixels**](glcopypixels.md) except that before the final
conversion of the pixels, all pixel component values are clamped to
the range \[0,1\] and converted to the texture's internal format for
storage in the texture array. Pixel ordering is determined with lower
*x* and *y* coordinates corresponding to lower *s* and *t* texture
coordinates. If any of the pixels within a specified row of the
current framebuffer are outside the window associated with the
current rendering context, then their values are undefined. You
cannot include calls to **glCopyTexImage2D** in display lists. >
[!Note] > The **glCopyTexImage2D** function is only available in
OpenGL version 1.1 or later.
Texturing has no effect in color-index mode. The
[**glPixelStore**](glpixelstore-functions.md) and
[**glPixelTransfer**](glpixeltransfer.md) functions affect texture
images in exactly the way they affect
[**glDrawPixels**](gldrawpixels.md). The following function retrieves
information related to **glCopyTexImage2D**:
[**glIsEnabled**](glisenabled.md) with argument GL\_TEXTURE\_2D


%index
glCopyTexSubImage1D
The glCopyTexSubImage1D function copies a sub-image of a one-dimensional texture image from the framebuffer.
%group
Win32 opengl32
%prm
target, level, xoffset, x, y, width
target : [int] The target to which the image data will be changed. Must have the value GL\_TEXTURE\_1D.
level : [int] The level-of-detail number. Level 0 is the base image. Level *n* is the *n*th mipmap reduction image.
xoffset : [int] The texel offset within the texture array.
x : [int] The window x-plane coordinate of the lower-left corner of the row of pixels to be copied.
y : [int] The window y-plane coordinate of the lower-left corner of the row of pixels to be copied.
width : [int] The width of the sub-image of the texture image. Specifying a texture sub-image with zero width has no effect.
%inst
The glCopyTexSubImage1D function copies a sub-image of a
one-dimensional texture image from the framebuffer.

[戻り値]
This function does not return a value.

[備考]
The **glCopyTexSubImage1D** function replaces a portion of a
one-dimensional texture image using pixels from the current
framebuffer, rather than from main memory as is the case for
[**glTexSubImage1D**](gltexsubimage1d.md). A row of pixels beginning
with the window coordinates specified by *x* and *y* and with the
length *width* replaces the portion of the texture array with the
indexes *xoffset* through *xoffset* + (*width* - 1). The destination
in the texture array cannot include any texels outside the originally
specified texture array. The **glCopyTexSubImage1D** function
processes the pixels in a row in the same way as
[**glCopyPixels**](glcopypixels.md) except that before the final
conversion of the pixels, all pixel component values are clamped to
the range \[0,1\] and converted to the texture's internal format for
storage in the texture array. Pixel ordering is determined with lower
*x* coordinates corresponding to lower texture coordinates. If any of
the pixels within a specified row of the current framebuffer are
outside the window associated with the current rendering context,
then their values are undefined. No change is made to the
*internalFormat*, *width*, or *border* parameter of the specified
texture array or to texel values outside the specified texture
sub-image. You cannot include calls to **glCopyTexSubImage1D** in
display lists. > [!Note] > The **glCopyTexSubImage1D** function is
only available in OpenGL version 1.1 or later.
Texturing has no effect in color-index mode. The
[**glPixelStore**](glpixelstore-functions.md) and
[**glPixelTransfer**](glpixeltransfer.md) functions affect texture
images in exactly the way they affect the way pixels are drawn using
[**glDrawPixels**](gldrawpixels.md). The following functions retrieve
information related to **glCopyTexSubImage1D**:
[**glGetTexImage**](glgetteximage.md)
[**glIsEnabled**](glisenabled.md) with argument GL\_TEXTURE\_1D


%index
glCopyTexSubImage2D
The glCopyTexSubImage2D function copies a sub-image of a two-dimensional texture image from the framebuffer.
%group
Win32 opengl32
%prm
target, level, xoffset, yoffset, x, y, width, height
target : [int] The target to which the image data will be changed. Must have the value GL\_TEXTURE\_2D.
level : [int] The level-of-detail number. Level 0 is the base image. Level *n* is the *n*th mipmap reduction image.
xoffset : [int] The texel offset in the *x* direction within the texture array.
yoffset : [int] The texel offset in the *y* direction within the texture array.
x : [int] The window x-plane coordinates of the lower-left corner of the row of pixels to be copied.
y : [int] The window y-plane coordinates of the lower-left corner of the row of pixels to be copied.
width : [int] The width of the sub-image of the texture image. Specifying a texture sub-image with zero width has no effect.
height : [int] The height of the sub-image of the texture image. Specifying a texture sub-image with zero width has no effect.
%inst
The glCopyTexSubImage2D function copies a sub-image of a
two-dimensional texture image from the framebuffer.

[戻り値]
This function does not return a value.

[備考]
The **glCopyTexSubImage2D** function replaces a rectangular portion
of a two-dimensional texture image with pixels from the current
framebuffer, rather than from main memory as is the case for
[**glTexSubImage2D**](gltexsubimage2d.md). A rectangle of pixels
beginning with the *x* and *y* window coordinates and with the
dimensions *width* and *height* replaces the portion of the texture
array with the indexes *xoffset* through *xoffset* + (*width* - 1),
with the indexes *yoffset* through *yoffset* + (*width* - 1) at the
mipmap level specified by *level*. The destination rectangle in the
texture array cannot include any texels outside the originally
specified texture array. The **glCopyTexSubImage2D** function
processes the pixels in a row in the same way as
[**glCopyPixels**](glcopypixels.md), except that before the final
conversion of the pixels, all pixel component values are clamped to
the range \[0,1\] and converted to the texture's internal format for
storage in the texture array. Pixel ordering is determined with lower
*x* coordinates corresponding to lower texture coordinates. If any of
the pixels within a specified row of the current framebuffer are
outside the window associated with the current rendering context,
then their values are undefined. If any of the pixels within the
specified rectangle of the current framebuffer are outside the read
window associated with the current rendering context, then the values
obtained for those pixels are undefined. No change is made to the
*internalFormat*, *width*, *height*, or *border* parameter of the
specified texture array or to texel values outside the specified
texture sub-image. You cannot include calls to
**glCopyTexSubImage2D** in display lists. > [!Note] > The
**glCopyTexSubImage2D** function is only available in OpenGL version
1.1 or later.
Texturing has no effect in color-index mode. The
[**glPixelStore**](glpixelstore-functions.md) and
[**glPixelTransfer**](glpixeltransfer.md) functions affect texture
images in exactly the way they affect the way pixels are drawn using
[**glDrawPixels**](gldrawpixels.md). The following functions retrieve
information related to **glCopyTexSubImage2D**:
[**glGetTexImage**](glgetteximage.md)
[**glIsEnabled**](glisenabled.md) with argument GL\_TEXTURE\_2D


%index
glCullFace
The glCullFace function specifies whether front-facing or back-facing facets can be culled.
%group
Win32 opengl32
%prm
mode
mode : [int] Specifies whether front-facing or back-facing facets are candidates for culling. The symbolic constants GL\_FRONT, GL\_BACK, and GL\_FRONT\_AND\_BACK are accepted. The default value is GL\_BACK.
%inst
The glCullFace function specifies whether front-facing or back-facing
facets can be culled.

[戻り値]
This function does not return a value.

[備考]
The **glCullFace** function specifies whether front-facing or
back-facing facets are culled (as specified by *mode*) when facet
culling is enabled. You enable and disable facet culling using
[**glEnable**](glenable.md) and [**glDisable**](gldisable.md) with
the argument GL\_CULL\_FACE. Facets include triangles,
quadrilaterals, polygons, and rectangles. The
[**glFrontFace**](glfrontface.md) function specifies which of the
clockwise and counterclockwise facets are front-facing and
back-facing. If *mode* is GL\_FRONT\_AND\_BACK, no facets are drawn,
but other primitives, such as points and lines, are drawn. The
following functions retrieve information related to **glCullFace**:
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CULL\_FACE\_MODE [**glIsEnabled**](glisenabled.md)
with argument GL\_CULL\_FACE


%index
glDeleteLists
The glDeleteLists function deletes a contiguous group of display lists.
%group
Win32 opengl32
%prm
list, range
list : [int] The integer name of the first display list to delete.
range : [int] The number of display lists to delete.
%inst
The glDeleteLists function deletes a contiguous group of display
lists.

[戻り値]
This function does not return a value.

[備考]
The **glDeleteLists** function causes a contiguous group of display
lists to be deleted. The *list* parameter is the name of the first
display list to be deleted, and *range* is the number of display
lists to delete. All display lists *d* with *list* = *d* = *list* +
*range* - 1 are deleted. All storage locations allocated to the
specified display lists are freed, and the names are available for
reuse at a later time. Names within the range that do not have an
associated display list are ignored. If *range* is zero, nothing
happens.


%index
glDeleteTextures
The glDeleteTextures function deletes named textures.
%group
Win32 opengl32
%prm
n, textures
n : [int] The number of textures to be deleted.
textures : [var] An array of textures to be deleted.
%inst
The glDeleteTextures function deletes named textures.

[戻り値]
This function does not return a value.

[備考]
The **glDeleteTextures** function deletes *n* textures named by the
elements of the array *textures*. After a texture is deleted, it has
no contents or dimensionality, and its name is free for reuse (for
example, by **glGenTextures**). The **glDeleteTextures** function
ignores zeros and names that do not correspond to existing textures.
If a texture that is currently bound is deleted, the binding reverts
to zero (the default texture). You cannot include calls to
**glDeleteTextures** in display lists. > [!Note] > The
**glDeleteTextures** function is only available in OpenGL version 1.1
or later.
The following function retrieves information related to
**glDeleteTextures**: - [**glIsTexture**](glistexture.md)


%index
glDepthFunc
The glDepthFunc function specifies the value used for depth-buffer comparisons.
%group
Win32 opengl32
%prm
func
func : [int] Specifies the depth-comparison function. The following symbolic constants are accepted.
%inst
The glDepthFunc function specifies the value used for depth-buffer
comparisons.

[戻り値]
This function does not return a value.

[備考]
The **glDepthFunc** function specifies the function used to compare
each incoming pixel *z* value with the *z* value present in the depth
buffer. The comparison is performed only if depth testing is enabled.
(See [**glEnable**](glenable.md) with the argument GL\_DEPTH\_TEST.)
Initially, depth testing is disabled. The following functions
retrieve information related to **glDepthFunc**:
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_DEPTH\_FUNC [**glIsEnabled**](glisenabled.md) with
argument GL\_DEPTH\_TEST


%index
glDepthMask
The glDepthMask function enables or disables writing into the depth buffer.
%group
Win32 opengl32
%prm
flag
flag : [int] Specifies whether the depth buffer is enabled for writing. If *flag* is zero, depth-buffer writing is disabled. Otherwise, it is enabled. Initially, depth-buffer writing is enabled.
%inst
The glDepthMask function enables or disables writing into the depth
buffer.

[戻り値]
This function does not return a value.

[備考]
The following function retrieves information related to
**glDepthMask**: **glGet** with argument GL\_DEPTH\_WRITEMASK


%index
glDepthRange
The glDepthRange function specifies the mapping of z values from normalized device coordinates to window coordinates.
%group
Win32 opengl32
%prm
zNear, zFar
zNear : [double] The mapping of the near clipping plane to window coordinates. The default value is zero.
zFar : [double] The mapping of the far clipping plane to window coordinates. The default value is 1.
%inst
The glDepthRange function specifies the mapping of z values from
normalized device coordinates to window coordinates.

[戻り値]
This function does not return a value.

[備考]
After clipping and division by *w*, *z* -coordinates range from 0.0
to 1.0, corresponding to the near and far clipping planes. The
**glDepthRange** function specifies a linear mapping of the
normalized *z*-coordinates in this range to window *z*-coordinates.
Regardless of the actual depth buffer implementation, window
coordinate depth values are treated as though they range from 0.0
through 1.0 (like color components). Thus, the values accepted by
**glDepthRange** are both clamped to this range before they are
accepted. The default mapping of (0,1) maps the near plane to 0 and
the far plane to 1. With this mapping, the depth buffer range is
fully utilized. It is not necessary that *zNear* be less than *zFar*.
Reverse mappings such as (1,0) are acceptable. The following function
retrieves information related to **glDepthRange**:
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_DEPTH\_RANGE


%index
glDisable
The glEnable and glDisable functions enable or disable OpenGL capabilities. | glDisable function (Gl.h)
%group
Win32 opengl32
%prm
cap
cap : [int] A symbolic constant indicating an OpenGL capability. For discussion of the values *cap* can take, see the following Remarks section.
%inst
The glEnable and glDisable functions enable or disable OpenGL
capabilities. | glDisable function (Gl.h)

[戻り値]
This function does not return a value.

[備考]
The [**glEnable**](glenable.md) and **glDisable** functions enable
and disable various OpenGL graphics capabilities. Use
[**glIsEnabled**](glisenabled.md) or
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
to determine the current setting of any capability. Both
[**glEnable**](glenable.md) and **glDisable** take a single argument,
*cap*, which can assume one of the following values:
| Value | Meaning |
|-----------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| GL\_ALPHA\_TEST | If enabled, do alpha testing. See
[**glAlphaFunc**](glalphafunc.md). | | GL\_AUTO\_NORMAL | If enabled,
compute surface normal vectors analytically when either
GL\_MAP2\_VERTEX\_3 or GL\_MAP2\_VERTEX\_4 has generated vertices.
See [**glMap2**](glmap2.md). | | GL\_BLEND | If enabled, blend the
incoming RGBA color values with the values in the color buffers. See
[**glBlendFunc**](glblendfunc.md). | | GL\_CLIP\_PLANE*i* | If
enabled, clip geometry against user-defined clipping plane *i*. See
[**glClipPlane**](glclipplane.md). | | GL\_COLOR\_LOGIC\_OP | If
enabled, apply the current logical operation to the incoming RGBA
color and color buffer values. See [**glLogicOp**](gllogicop.md). | |
GL\_COLOR\_MATERIAL | If enabled, have one or more material
parameters track the current color. See
[**glColorMaterial**](glcolormaterial.md). | | GL\_CULL\_FACE | If
enabled, cull polygons based on their winding in window coordinates.
See [**glCullFace**](glcullface.md). | | GL\_DEPTH\_TEST | If
enabled, do depth comparisons and update the depth buffer. See
[**glDepthFunc**](gldepthfunc.md) and
[**glDepthRange**](gldepthrange.md). | | GL\_DITHER | If enabled,
dither color components or indexes before they are written to the
color buffer. | | GL\_FOG | If enabled, blend a fog color into the
post-texturing color. See [**glFog**](glfog.md). | |
GL\_INDEX\_LOGIC\_OP | If enabled, apply the current logical
operation to the incoming index and color buffer indices. See
[**glLogicOp**](gllogicop.md). | | GL\_LIGHT*i* | If enabled, include
light *i* in the evaluation of the lighting equation. See
[**glLightModel**](gllightmodel-functions.md) and
[**glLight**](gllight-functions.md). | | GL\_LIGHTING | If enabled,
use the current lighting parameters to compute the vertex color or
index. If disabled, associate the current color or index with each
vertex. See [**glMaterial**](glmaterial-functions.md),
**glLightModel**, and **glLight**. | | GL\_LINE\_SMOOTH | If enabled,
draw lines with correct filtering. If disabled, draw aliased lines.
See [**glLineWidth**](gllinewidth.md). | | GL\_LINE\_STIPPLE | If
enabled, use the current line stipple pattern when drawing lines. See
[**glLineStipple**](gllinestipple.md). | | GL\_LOGIC\_OP | If
enabled, apply the currently selected logical operation to the
incoming and color-buffer indexes. See [**glLogicOp**](gllogicop.md).
| | GL\_MAP1\_COLOR\_4 | If enabled, calls to
[**glEvalCoord1**](glevalcoord-functions.md),
[**glEvalMesh1**](glevalmesh-functions.md), and
[**glEvalPoint1**](glevalpoint.md) generate RGBA values. See also
[**glMap1**](glmap1.md). | | GL\_MAP1\_INDEX | If enabled, calls to
**glEvalCoord1**, **glEvalMesh1**, and **glEvalPoint1** generate
color indexes. See also **glMap1**. | | GL\_MAP1\_NORMAL | If
enabled, calls to [**glEvalCoord1**](glevalcoord-functions.md),
[**glEvalMesh1**](glevalmesh-functions.md), and
[**glEvalPoint1**](glevalpoint.md) generate normals. See also
[**glMap1**](glmap1.md). | | GL\_MAP1\_TEXTURE\_COORD\_1 | If
enabled, calls to **glEvalCoord1**, **glEvalMesh1**, and
**glEvalPoint1** generate *s* texture coordinates. See also
**glMap1**. | | GL\_MAP1\_TEXTURE\_COORD\_2 | If enabled, calls to
[**glEvalCoord1**](glevalcoord-functions.md),
[**glEvalMesh1**](glevalmesh-functions.md), and
[**glEvalPoint1**](glevalpoint.md) generate *s* and *t* texture
coordinates. See also [**glMap1**](glmap1.md). | |
GL\_MAP1\_TEXTURE\_COORD\_3 | If enabled, calls to **glEvalCoord1**,
**glEvalMesh1**, and **glEvalPoint1** generate *s*, *t*, and *r*
texture coordinates. See also **glMap1**. | |
GL\_MAP1\_TEXTURE\_COORD\_4 | If enabled, calls to
[glEvalCoord1](glevalcoord-functions.md),
[glEvalMesh1](glevalmesh-functions.md), and
[**glEvalPoint1**](glevalpoint.md) generate *s*, *t*, *r*, and *q*
texture coordinates. See also [**glMap1**](glmap1.md). | |
GL\_MAP1\_VERTEX\_3 | If enabled, calls to **glEvalCoord1**,
**glEvalMesh1**, and **glEvalPoint1** generate *x*, *y*, and *z*
vertex coordinates. See also **glMap1**. | | GL\_MAP1\_VERTEX\_4 | If
enabled, calls to [**glEvalCoord1**](glevalcoord-functions.md),
[**glEvalMesh1**](glevalmesh-functions.md), and
[**glEvalPoint1**](glevalpoint.md) generate homogeneous *x*, *y*,
*z*, and *w* vertex coordinates. See also [**glMap1**](glmap1.md). |
| GL\_MAP2\_COLOR\_4 | If enabled, calls to
[**glEvalCoord2**](glevalcoord-functions.md),
[**glEvalMesh2**](glevalmesh-functions.md), and
[**glEvalPoint2**](glevalpoint.md) generate RGBA values. See also
[**glMap2**](glmap2.md). | | GL\_MAP2\_INDEX | If enabled, calls to
**glEvalCoord2**, **glEvalMesh2**, and **glEvalPoint2** generate
color indexes. See also **glMap2**. | | GL\_MAP2\_NORMAL | If
enabled, calls to [**glEvalCoord2**](glevalcoord-functions.md),
[**glEvalMesh2**](glevalmesh-functions.md), and
[**glEvalPoint2**](glevalpoint.md) generate normals. See also
[**glMap2**](glmap2.md). | | GL\_MAP2\_TEXTURE\_COORD\_1 | If
enabled, calls to **glEvalCoord2**, **glEvalMesh2**, and
**glEvalPoint2** generate *s* texture coordinates. See also
**glMap2**. | | GL\_MAP2\_TEXTURE\_COORD\_2 | If enabled, calls to
[**glEvalCoord2**](glevalcoord-functions.md),
[**glEvalMesh2**](glevalmesh-functions.md), and
[**glEvalPoint2**](glevalpoint.md) generate *s* and *t* texture
coordinates. See also [**glMap2**](glmap2.md). | |
GL\_MAP2\_TEXTURE\_COORD\_3 | If enabled, calls to **glEvalCoord2**,
**glEvalMesh2**, and **glEvalPoint2** generate *s*, *t*, and *r*
texture coordinates. See also **glMap2**. | |
GL\_MAP2\_TEXTURE\_COORD\_4 | If enabled, calls to
[**glEvalCoord2**](glevalcoord-functions.md),
[**glEvalMesh2**](glevalmesh-functions.md), and
[**glEvalPoint2**](glevalpoint.md) generate *s*, *t*, *r*, and *q*
texture coordinates. See also [**glMap2**](glmap2.md). | |
GL\_MAP2\_VERTEX\_3 | If enabled, calls to **glEvalCoord2**,
**glEvalMesh2**, and **glEvalPoint2** generate *x*, *y*, and *z*
vertex coordinates. See also **glMap2**. | | GL\_MAP2\_VERTEX\_4 | If
enabled, calls to [**glEvalCoord2**](glevalcoord-functions.md),
[**glEvalMesh2**](glevalmesh-functions.md), and
[**glEvalPoint2**](glevalpoint.md) generate homogeneous *x*, *y*,
*z*, and *w* vertex coordinates. See also [**glMap2**](glmap2.md). |
| GL\_NORMALIZE | If enabled, normal vectors specified with
**glNormal** are scaled to unit length after transformation. See
[**glNormal**](glnormal-functions.md). | | GL\_POINT\_SMOOTH | If
enabled, draw points with proper filtering. If disabled, draw aliased
points. See [**glPointSize**](glpointsize.md). | |
GL\_POLYGON\_OFFSET\_FILL | If enabled, and if the polygon is
rendered in GL\_FILL mode, an offset is added to depth values of a
polygon's fragments before the depth comparison is performed. See
[**glPolygonOffset**](glpolygonoffset.md)**.** | |
GL\_POLYGON\_OFFSET\_LINE | If enabled, and if the polygon is
rendered in GL\_LINE mode, an offset is added to depth values of a
polygon's fragments before the depth comparison is performed. See
**glPolygonOffset**. | | GL\_POLYGON\_OFFSET\_POINT | If enabled, an
offset is added to depth values of a polygon's fragments before the
depth comparison is performed, if the polygon is rendered in
GL\_POINT mode. See [**glPolygonOffset**](glpolygonoffset.md). | |
GL\_POLYGON\_SMOOTH | If enabled, draw polygons with proper
filtering. If disabled, draw aliased polygons. See
[**glPolygonMode**](glpolygonmode.md). | | GL\_POLYGON\_STIPPLE | If
enabled, use the current polygon stipple pattern when rendering
polygons. See [**glPolygonStipple**](glpolygonstipple.md). | |
GL\_SCISSOR\_TEST | If enabled, discard fragments that are outside
the scissor rectangle. See [**glScissor**](glscissor.md). | |
GL\_STENCIL\_TEST | If enabled, do stencil testing and update the
stencil buffer. See [**glStencilFunc**](glstencilfunc.md) and
[**glStencilOp**](glstencilop.md). | | GL\_TEXTURE\_1D | If enabled,
one-dimensional texturing is performed (unless two-dimensional
texturing is also enabled). See [**glTexImage1D**](glteximage1d.md).
| | GL\_TEXTURE\_2D | If enabled, two-dimensional texturing is
performed. See [**glTexImage2D**](glteximage2d.md). | |
GL\_TEXTURE\_GEN\_Q | If enabled, the *q* texture coordinate is
computed using the texture-generation function defined with
[**glTexGen**](gltexgen-functions.md). Otherwise, the current *q*
texture coordinate is used. | | GL\_TEXTURE\_GEN\_R | If enabled, the
*r* texture coordinate is computed using the texture generation
function defined with [**glTexGen**](gltexgen-functions.md). If
disabled, the current *r* texture coordinate is used. | |
GL\_TEXTURE\_GEN\_S | If enabled, the *s* texture coordinate is
computed using the texture generation function defined with
**glTexGen**. If disabled, the current *s* texture coordinate is
used. | | GL\_TEXTURE\_GEN\_T | If enabled, the *t* texture
coordinate is computed using the texture generation function defined
with [**glTexGen**](gltexgen-functions.md). If disabled, the current
*t* texture coordinate is used. |


%index
glDisableClientState
The glEnableClientState and glDisableClientState functions enable and disable arrays respectively. | glDisableClientState function (Gl.h)
%group
Win32 opengl32
%prm
array
array : [int] A symbolic constant for the array you want to enable or disable. This parameter can assume one of the following values.
%inst
The glEnableClientState and glDisableClientState functions enable and
disable arrays respectively. | glDisableClientState function (Gl.h)

[戻り値]
This function does not return a value.

[備考]
The [**glEnableClientState**](glenableclientstate.md) and
**glDisableClientState** functions enable and disable various
individual arrays. Use [**glIsEnabled**](glisenabled.md) or
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
to determine the current setting of any capability. Calling
[**glEnableClientState**](glenableclientstate.md) and
**glDisableClientState** between calls to [**glBegin**](glbegin.md)
and the corresponding call to [**glEnd**](glend.md) can cause an
error. If no error is generated, the behavior is undefined. > [!Note]
> The [**glEnableClientState**](glenableclientstate.md) and
**glDisableClientState** functions are only available in OpenGL
version 1.1 or later.


%index
glDrawArrays
The glDrawArrays function specifies multiple primitives to render.
%group
Win32 opengl32
%prm
mode, first, count
mode : [int] The kind of primitives to render. The following constants specify acceptable types of primitives: GL\_POINTS, GL\_LINE\_STRIP, GL\_LINE\_LOOP, GL\_LINES, GL\_TRIANGLE\_STRIP, GL\_TRIANGLE\_FAN, GL\_TRIANGLES, GL\_QUAD\_STRIP, GL\_QUADS, and GL\_POLYGON.
first : [int] The starting index in the enabled arrays.
count : [int] The number of indexes to render.
%inst
The glDrawArrays function specifies multiple primitives to render.

[戻り値]
This function does not return a value.

[備考]
With **glDrawArrays**, you can specify multiple geometric primitives
to render. Instead of calling separate OpenGL functions to pass each
individual vertex, normal, or color, you can specify separate arrays
of vertices, normals, and colors to define a sequence of primitives
(all the same kind) with a single call to **glDrawArrays**. When you
call **glDrawArrays**, *count* sequential elements from each enabled
array are used to construct a sequence of geometric primitives,
beginning with the *first* element. The *mode* parameter specifies
what kind of primitive to construct and how to use the array elements
to construct the primitives. After **glDrawArrays** returns, the
values of vertex attributes that are modified by **glDrawArrays** are
undefined. For example, if GL\_COLOR\_ARRAY is enabled, the value of
the current color is undefined after **glDrawArrays** returns.
Attributes not modified by **glDrawArrays** remain defined. When
GL\_VERTEX\_ARRAY is not enabled, no geometric primitives are
generated but the attributes corresponding to enabled arrays are
modified. You can include **glDrawArrays** in display lists. When you
include **glDrawArrays** in a display list, the necessary array data,
determined by the array pointers and the enables, are generated and
entered in the display list. The values of array pointers and enables
are determined during the creation of display lists. You can read
static array data at any time. If any static array elements are
modified and the array is not specified again, the results of any
subsequent calls to **glDrawArrays** are undefined. Although no error
is generated when you specify an array more than once within
[**glBegin**](glbegin.md) and [**glend**](glend.md) pairs, the
results are undefined.


%index
glDrawBuffer
The glDrawBuffer function specifies which color buffers are to be drawn into.
%group
Win32 opengl32
%prm
mode
mode : [int] Specifies up to four color buffers to be drawn into with the following acceptable symbolic constants.
%inst
The glDrawBuffer function specifies which color buffers are to be
drawn into.

[戻り値]
This function does not return a value.

[備考]
When colors are written to the framebuffer, they are written into the
color buffers specified by **glDrawBuffer**. If more than one color
buffer is selected for drawing, then blending or logical operations
are computed and applied independently for each color buffer and can
produce different results in each buffer. Monoscopic contexts include
only left buffers, and stereoscopic contexts include both left and
right buffers. Likewise, single-buffered contexts include only front
buffers, and double-buffered contexts include both front and back
buffers. The context is selected at OpenGL initialization. It is
always the case that GL\_AUX *i* = GL\_AUX0 + *i*. The following
functions retrieve information related to the **glDrawBuffer**
function:
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_DRAW\_BUFFER **glGet** with argument
GL\_AUX\_BUFFERS


%index
glDrawElements
The glDrawElements function renders primitives from array data.
%group
Win32 opengl32
%prm
mode, count, type, indices
mode : [int] The kind of primitives to render. It can assume one of the following symbolic values: GL\_POINTS, GL\_LINE\_STRIP, GL\_LINE\_LOOP, GL\_LINES, GL\_TRIANGLE\_STRIP, GL\_TRIANGLE\_FAN, GL\_TRIANGLES, GL\_QUAD\_STRIP, GL\_QUADS, and GL\_POLYGON.
count : [int] The number of elements to be rendered.
type : [int] The type of the values in indices. Must be one of GL\_UNSIGNED\_BYTE, GL\_UNSIGNED\_SHORT, or GL\_UNSIGNED\_INT.
indices : [intptr] A pointer to the location where the indices are stored.
%inst
The glDrawElements function renders primitives from array data.

[戻り値]
This function does not return a value.

[備考]
The **glDrawElements** function enables you to specify multiple
geometric primitives with very few function calls. Instead of calling
an OpenGL function to pass each individual vertex, normal, or color,
you can specify separate arrays of vertices, normals, and colors
beforehand and use them to define a sequence of primitives (all of
the same type) with a single call to **glDrawElements**. When you
call the **glDrawElements** function, it uses *count* sequential
elements from *indices* to construct a sequence of geometric
primitives. The *mode* parameter specifies what kind of primitives
are constructed, and how the array elements are used to construct
these primitives. If GL\_VERTEX\_ARRAY is not enabled, no geometric
primitives are generated. Vertex attributes that are modified by
**glDrawElements** have an unspecified value after **glDrawElements**
returns. For example, if GL\_COLOR\_ARRAY is enabled, the value of
the current color is undefined after **glDrawElements** executes.
Attributes that aren't modified remain unchanged. You can include the
**glDrawElements** function in display lists. When **glDrawElements**
is included in a display list, the necessary array data (determined
by the array pointers and enables) is also entered into the display
list. Because the array pointers and enables are client-side state
variables, their values affect display lists when the lists are
created, not when the lists are executed. > [!Note] > The
**glDrawElements** function is only available in OpenGL version 1.1
or later.


%index
glDrawPixels
The glDrawPixels function writes a block of pixels to the framebuffer.
%group
Win32 opengl32
%prm
width, height, format, type, pixels
width : [int] The width dimension of the pixel rectangle that will be written into the framebuffer.
height : [int] The height dimension of the pixel rectangle that will be written into the framebuffer.
format : [int] The format of the pixel data. Acceptable symbolic constants are as follows.
type : [int] The data type for *pixels*. The following are the accepted symbolic constants and their meanings.
pixels : [intptr] A pointer to the pixel data.
%inst
The glDrawPixels function writes a block of pixels to the
framebuffer.

[戻り値]
This function does not return a value.

[備考]
The **glDrawPixels** function reads pixel data from memory and writes
it into the framebuffer relative to the current raster position. Use
[**glRasterPos**](glrasterpos-functions.md) to set the current raster
position, and use
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_RASTER\_POSITION to query the raster
position. Several parameters define the encoding of pixel data in
memory and control the processing of the pixel data before it is
placed in the framebuffer. These parameters are set with four
functions: [**glPixelStore**](glpixelstore-functions.md),
[**glPixelTransfer**](glpixeltransfer.md),
[**glPixelMap**](glpixelmap.md), and
[**glPixelZoom**](glpixelzoom.md). This topic describes the effects
on **glDrawPixels** of many, but not all, of the parameters specified
by these four functions. Data is read from *pixels* as a sequence of
signed or unsigned bytes, signed or unsigned shorts, signed or
unsigned integers, or single-precision floating-point values,
depending on *type*. Each of these bytes, shorts, integers, or
floating-point values is interpreted as one color or depth component,
or one index, depending on *format*. Indexes are always treated
individually. Color components are treated as groups of one, two,
three, or four values, again based on *format*. Both individual
indexes and groups of components are referred to as pixels. If *type*
is GL\_BITMAP, the data must be unsigned bytes, and *format* must be
either GL\_COLOR\_INDEX or GL\_STENCIL\_INDEX. Each unsigned byte is
treated as eight 1-bit pixels, with bit ordering determined by
GL\_UNPACK\_LSB\_FIRST (see
[**glPixelStore**](glpixelstore-functions.md)). The *width* by
*height* pixels are read from memory, starting at location *pixels*.
By default, these pixels are taken from adjacent memory locations,
except that after all *width* pixels are read, the read pointer is
advanced to the next 4-byte boundary. The **glPixelStore** function
specifies the 4-byte row alignment with argument
GL\_UNPACK\_ALIGNMENT, and you can set it to 1, 2, 4, or 8 bytes.
Other pixel store parameters specify different read pointer
advancements, both before the first pixel is read, and after all
*width* pixels are read. The **glPixelStore** function operates on
each of the *width-by-height* pixels that it reads from memory in the
same way, based on the values of several parameters specified by
[**glPixelTransfer**](glpixeltransfer.md) and
[**glPixelMap**](glpixelmap.md). The details of these operations, as
well as the target buffer into which the pixels are drawn, are
specific to the format of the pixels, as specified by *format*. The
rasterization described thus far assumes pixel zoom factors of 1.0.
If you use [**glPixelZoom**](glpixelzoom.md) to change the *x* and
*y* pixel zoom factors, pixels are converted to fragments as follows.
If (*xr,yr*) is the current raster position, and a given pixel is in
the *n*th column and *m*th row of the pixel rectangle, then fragments
are generated for pixels whose centers are in the rectangle with
corners at (*x*r + *zoom*? *n*, *y*r + *zoom*y *m*) (*x*r + *zoom*?
(*n* + 1), *y*r + *zoom*y (*m* + 1)) where *zoom*? is the value of
GL\_ZOOM\_X and *zoom*y is the value of GL\_ZOOM\_Y. The following
functions retrieve information related to **glDrawPixels**:
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_RASTER\_POSITION **glGet** with argument
GL\_CURRENT\_RASTER\_POSITION\_VALID


%index
glEdgeFlag
Flags edges as either boundary or nonboundary. | glEdgeFlag function (Gl.h)
%group
Win32 opengl32
%prm
flag
flag : [int] Specifies the current edge flag value, either **TRUE** or **FALSE**.
%inst
Flags edges as either boundary or nonboundary. | glEdgeFlag function
(Gl.h)

[戻り値]
This function does not return a value.

[備考]
Each vertex of a polygon, separate triangle, or separate
quadrilateral specified between a
[**glBegin**](/windows/desktop/OpenGL/glbegin)/[**glEnd**](/windows/desktop/OpenGL/glend)
pair is marked as the start of either a boundary or nonboundary edge.
If the current edge flag is **TRUE** when the vertex is specified,
the vertex is marked as the start of a boundary edge. If the current
edge flag is **FALSE**, the vertex is marked as the start of a
nonboundary edge. The **glEdgeFlag** function sets the edge flag to
**TRUE** if flag is nonzero, **FALSE** otherwise. The vertices of
connected triangles and connected quadrilaterals are always marked as
boundary, regardless of the value of the edge flag. Boundary and
nonboundary edge flags on vertices are significant only if
GL\_POLYGON\_MODE is set to GL\_POINT or GL\_LINE. See
[**glPolygonMode**](/windows/desktop/OpenGL/glpolygonmode).
Initially, the edge flag bit is **TRUE**. The current edge flag can
be updated at any time. In particular, **glEdgeFlag** can be called
between a call to [**glBegin**](/windows/desktop/OpenGL/glbegin) and
the corresponding call to [**glEnd**](/windows/desktop/OpenGL/glend).
The following functions retrieve information related to
**glEdgeFlag**:
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_EDGE\_FLAG


%index
glEdgeFlagPointer
The glEdgeFlagPointer function defines an array of edge flags.
%group
Win32 opengl32
%prm
stride, pointer
stride : [int] The byte offset between consecutive edge flags. When *stride* is zero, the edge flags are tightly packed in the array.
pointer : [intptr] A pointer to the first edge flag in the array.
%inst
The glEdgeFlagPointer function defines an array of edge flags.

[戻り値]
This function does not return a value.

[備考]
The **glEdgeFlagPointer** function specifies the location and data of
an array of Boolean edge flags to use when rendering. The *stride*
parameter determines the byte offset from one edge flag to the next,
which enables the packing of vertices and attributes in a single
array or storage in separate arrays. In some implementations, storing
the vertices and attributes in a single array can be more efficient
than using separate arrays. An edge-flag array is enabled when you
specify the GL\_EDGE\_FLAG\_ARRAY constant with
[**glEnableClientState**](glenableclientstate.md). When enabled,
[**glDrawArrays**](gldrawarrays.md) or
[**glArrayElement**](glarrayelement.md) uses the edge-flag array. By
default the edge-flag array is disabled. Use **glDrawArrays** to
construct a sequence of primitives (all of the same type) from
prespecified vertex and vertex attribute arrays. Use
**glArrayElement** to specify primitives by indexing vertices and
vertex attributes, and [**glDrawElements**](gldrawelements.md) to
construct a sequence of primitives by indexing vertices and vertex
attributes. You cannot include **glEdgeFlagPointer** in display
lists. When you specify an edge-flag array using
**glEdgeFlagPointer**, the values of all the function's edge-flag
array parameters are saved in a client-side state and static array
elements can be cached. Because the edge-flag array parameters are in
a client-side state, [**glPushAttrib**](glpushattrib.md) and
[**glPopAttrib**](glpopattrib.md) do not save or restore their
values. Although calling **glEdgeFlagPointer** within a
[**glBegin**](glbegin.md)/[**glend**](glend.md) pair does not
generate an error, the results are undefined. The following functions
retrieve information related to the **glEdgeFlagPointer** function:
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_EDGE\_FLAG\_ARRAY\_STRIDE **glGet** with argument
GL\_EDGE\_FLAG\_ARRAY\_COUNT [**glGetPointerv**](glgetpointerv.md)
with argument GL\_EDGE\_FLAG\_ARRAY\_POINTER
[**glIsEnabled**](glisenabled.md) with argument GL\_EDGE\_FLAG\_ARRAY


%index
glEdgeFlagv
Flags edges as either boundary or nonboundary. | glEdgeFlagv function (Gl.h)
%group
Win32 opengl32
%prm
flag
flag : [var] Specifies a pointer to an array that contains a single Boolean element, which replaces the current edge flag value.
%inst
Flags edges as either boundary or nonboundary. | glEdgeFlagv function
(Gl.h)

[戻り値]
This function does not return a value.

[備考]
Each vertex of a polygon, separate triangle, or separate
quadrilateral specified between a
[**glBegin**](/windows/desktop/OpenGL/glbegin)/[**glEnd**](/windows/desktop/OpenGL/glend)
pair is marked as the start of either a boundary or nonboundary edge.
If the current edge flag is **TRUE** when the vertex is specified,
the vertex is marked as the start of a boundary edge. If the current
edge flag is **FALSE**, the vertex is marked as the start of a
nonboundary edge. The **glEdgeFlagv** function sets the edge flag to
**TRUE** if flag is nonzero, **FALSE** otherwise. The vertices of
connected triangles and connected quadrilaterals are always marked as
boundary, regardless of the value of the edge flag. Boundary and
nonboundary edge flags on vertices are significant only if
GL\_POLYGON\_MODE is set to GL\_POINT or GL\_LINE. See
[**glPolygonMode**](/windows/desktop/OpenGL/glpolygonmode).
Initially, the edge flag bit is **TRUE**. The current edge flag can
be updated at any time. In particular, **glEdgeFlagv** can be called
between a call to [**glBegin**](/windows/desktop/OpenGL/glbegin) and
the corresponding call to [**glEnd**](/windows/desktop/OpenGL/glend).
The following functions retrieve information related to
**glEdgeFlagv**:
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_EDGE\_FLAG


%index
glEnable
The glEnable and glDisable functions enable or disable OpenGL capabilities. | glEnable function (Gl.h)
%group
Win32 opengl32
%prm
cap
cap : [int] A symbolic constant indicating an OpenGL capability. For discussion of the values *cap* can take, see the following Remarks section.
%inst
The glEnable and glDisable functions enable or disable OpenGL
capabilities. | glEnable function (Gl.h)

[戻り値]
This function does not return a value.

[備考]
The **glEnable** and **glDisable** functions enable and disable
various OpenGL graphics capabilities. Use
[**glIsEnabled**](glisenabled.md) or
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
to determine the current setting of any capability. Both **glEnable**
and **glDisable** take a single argument, *cap*, which can assume one
of the following values:
| Value | Meaning |
|-----------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| GL\_ALPHA\_TEST | If enabled, do alpha testing. See
[**glAlphaFunc**](glalphafunc.md). | | GL\_AUTO\_NORMAL | If enabled,
compute surface normal vectors analytically when either
GL\_MAP2\_VERTEX\_3 or GL\_MAP2\_VERTEX\_4 has generated vertices.
See [**glMap2**](glmap2.md). | | GL\_BLEND | If enabled, blend the
incoming RGBA color values with the values in the color buffers. See
[**glBlendFunc**](glblendfunc.md). | | GL\_CLIP\_PLANE*i* | If
enabled, clip geometry against user-defined clipping plane *i*. See
[**glClipPlane**](glclipplane.md). | | GL\_COLOR\_LOGIC\_OP | If
enabled, apply the current logical operation to the incoming RGBA
color and color buffer values. See [**glLogicOp**](gllogicop.md). | |
GL\_COLOR\_MATERIAL | If enabled, have one or more material
parameters track the current color. See
[**glColorMaterial**](glcolormaterial.md). | | GL\_CULL\_FACE | If
enabled, cull polygons based on their winding in window coordinates.
See [**glCullFace**](glcullface.md). | | GL\_DEPTH\_TEST | If
enabled, do depth comparisons and update the depth buffer. See
[**glDepthFunc**](gldepthfunc.md) and
[**glDepthRange**](gldepthrange.md). | | GL\_DITHER | If enabled,
dither color components or indexes before they are written to the
color buffer. | | GL\_FOG | If enabled, blend a fog color into the
post-texturing color. See [**glFog**](glfog.md). | |
GL\_INDEX\_LOGIC\_OP | If enabled, apply the current logical
operation to the incoming index and color buffer indices. See
[**glLogicOp**](gllogicop.md). | | GL\_LIGHT*i* | If enabled, include
light *i* in the evaluation of the lighting equation. See
[**glLightModel**](gllightmodel-functions.md) and
[**glLight**](gllight-functions.md). | | GL\_LIGHTING | If enabled,
use the current lighting parameters to compute the vertex color or
index. If disabled, associate the current color or index with each
vertex. See [**glMaterial**](glmaterial-functions.md),
**glLightModel**, and **glLight**. | | GL\_LINE\_SMOOTH | If enabled,
draw lines with correct filtering. If disabled, draw aliased lines.
See [**glLineWidth**](gllinewidth.md). | | GL\_LINE\_STIPPLE | If
enabled, use the current line stipple pattern when drawing lines. See
[**glLineStipple**](gllinestipple.md). | | GL\_LOGIC\_OP | If
enabled, apply the currently selected logical operation to the
incoming and color-buffer indexes. See [**glLogicOp**](gllogicop.md).
| | GL\_MAP1\_COLOR\_4 | If enabled, calls to
[**glEvalCoord1**](glevalcoord-functions.md),
[**glEvalMesh1**](glevalmesh-functions.md), and
[**glEvalPoint1**](glevalpoint.md) generate RGBA values. See also
[**glMap1**](glmap1.md). | | GL\_MAP1\_INDEX | If enabled, calls to
**glEvalCoord1**, **glEvalMesh1**, and **glEvalPoint1** generate
color indexes. See also **glMap1**. | | GL\_MAP1\_NORMAL | If
enabled, calls to [**glEvalCoord1**](glevalcoord-functions.md),
[**glEvalMesh1**](glevalmesh-functions.md), and
[**glEvalPoint1**](glevalpoint.md) generate normals. See also
[**glMap1**](glmap1.md). | | GL\_MAP1\_TEXTURE\_COORD\_1 | If
enabled, calls to **glEvalCoord1**, **glEvalMesh1**, and
**glEvalPoint1** generate *s* texture coordinates. See also
**glMap1**. | | GL\_MAP1\_TEXTURE\_COORD\_2 | If enabled, calls to
[**glEvalCoord1**](glevalcoord-functions.md),
[**glEvalMesh1**](glevalmesh-functions.md), and
[**glEvalPoint1**](glevalpoint.md) generate *s* and *t* texture
coordinates. See also [**glMap1**](glmap1.md). | |
GL\_MAP1\_TEXTURE\_COORD\_3 | If enabled, calls to **glEvalCoord1**,
**glEvalMesh1**, and **glEvalPoint1** generate *s*, *t*, and *r*
texture coordinates. See also **glMap1**. | |
GL\_MAP1\_TEXTURE\_COORD\_4 | If enabled, calls to
[glEvalCoord1](glevalcoord-functions.md),
[glEvalMesh1](glevalmesh-functions.md), and
[**glEvalPoint1**](glevalpoint.md) generate *s*, *t*, *r*, and *q*
texture coordinates. See also [**glMap1**](glmap1.md). | |
GL\_MAP1\_VERTEX\_3 | If enabled, calls to **glEvalCoord1**,
**glEvalMesh1**, and **glEvalPoint1** generate *x*, *y*, and *z*
vertex coordinates. See also **glMap1**. | | GL\_MAP1\_VERTEX\_4 | If
enabled, calls to [**glEvalCoord1**](glevalcoord-functions.md),
[**glEvalMesh1**](glevalmesh-functions.md), and
[**glEvalPoint1**](glevalpoint.md) generate homogeneous *x*, *y*,
*z*, and *w* vertex coordinates. See also [**glMap1**](glmap1.md). |
| GL\_MAP2\_COLOR\_4 | If enabled, calls to
[**glEvalCoord2**](glevalcoord-functions.md),
[**glEvalMesh2**](glevalmesh-functions.md), and
[**glEvalPoint2**](glevalpoint.md) generate RGBA values. See also
[**glMap2**](glmap2.md). | | GL\_MAP2\_INDEX | If enabled, calls to
**glEvalCoord2**, **glEvalMesh2**, and **glEvalPoint2** generate
color indexes. See also **glMap2**. | | GL\_MAP2\_NORMAL | If
enabled, calls to [**glEvalCoord2**](glevalcoord-functions.md),
[**glEvalMesh2**](glevalmesh-functions.md), and
[**glEvalPoint2**](glevalpoint.md) generate normals. See also
[**glMap2**](glmap2.md). | | GL\_MAP2\_TEXTURE\_COORD\_1 | If
enabled, calls to **glEvalCoord2**, **glEvalMesh2**, and
**glEvalPoint2** generate *s* texture coordinates. See also
**glMap2**. | | GL\_MAP2\_TEXTURE\_COORD\_2 | If enabled, calls to
[**glEvalCoord2**](glevalcoord-functions.md),
[**glEvalMesh2**](glevalmesh-functions.md), and
[**glEvalPoint2**](glevalpoint.md) generate *s* and *t* texture
coordinates. See also [**glMap2**](glmap2.md). | |
GL\_MAP2\_TEXTURE\_COORD\_3 | If enabled, calls to **glEvalCoord2**,
**glEvalMesh2**, and **glEvalPoint2** generate *s*, *t*, and *r*
texture coordinates. See also **glMap2**. | |
GL\_MAP2\_TEXTURE\_COORD\_4 | If enabled, calls to
[**glEvalCoord2**](glevalcoord-functions.md),
[**glEvalMesh2**](glevalmesh-functions.md), and
[**glEvalPoint2**](glevalpoint.md) generate *s*, *t*, *r*, and *q*
texture coordinates. See also [**glMap2**](glmap2.md). | |
GL\_MAP2\_VERTEX\_3 | If enabled, calls to **glEvalCoord2**,
**glEvalMesh2**, and **glEvalPoint2** generate *x*, *y*, and *z*
vertex coordinates. See also **glMap2**. | | GL\_MAP2\_VERTEX\_4 | If
enabled, calls to [**glEvalCoord2**](glevalcoord-functions.md),
[**glEvalMesh2**](glevalmesh-functions.md), and
[**glEvalPoint2**](glevalpoint.md) generate homogeneous *x*, *y*,
*z*, and *w* vertex coordinates. See also [**glMap2**](glmap2.md). |
| GL\_NORMALIZE | If enabled, normal vectors specified with
**glNormal** are scaled to unit length after transformation. See
[**glNormal**](glnormal-functions.md). | | GL\_POINT\_SMOOTH | If
enabled, draw points with proper filtering. If disabled, draw aliased
points. See [**glPointSize**](glpointsize.md). | |
GL\_POLYGON\_OFFSET\_FILL | If enabled, and if the polygon is
rendered in GL\_FILL mode, an offset is added to depth values of a
polygon's fragments before the depth comparison is performed. See
[**glPolygonOffset**](glpolygonoffset.md)**.** | |
GL\_POLYGON\_OFFSET\_LINE | If enabled, and if the polygon is
rendered in GL\_LINE mode, an offset is added to depth values of a
polygon's fragments before the depth comparison is performed. See
**glPolygonOffset**. | | GL\_POLYGON\_OFFSET\_POINT | If enabled, an
offset is added to depth values of a polygon's fragments before the
depth comparison is performed, if the polygon is rendered in
GL\_POINT mode. See [**glPolygonOffset**](glpolygonoffset.md). | |
GL\_POLYGON\_SMOOTH | If enabled, draw polygons with proper
filtering. If disabled, draw aliased polygons. See
[**glPolygonMode**](glpolygonmode.md). | | GL\_POLYGON\_STIPPLE | If
enabled, use the current polygon stipple pattern when rendering
polygons. See [**glPolygonStipple**](glpolygonstipple.md). | |
GL\_SCISSOR\_TEST | If enabled, discard fragments that are outside
the scissor rectangle. See [**glScissor**](glscissor.md). | |
GL\_STENCIL\_TEST | If enabled, do stencil testing and update the
stencil buffer. See [**glStencilFunc**](glstencilfunc.md) and
[**glStencilOp**](glstencilop.md). | | GL\_TEXTURE\_1D | If enabled,
one-dimensional texturing is performed (unless two-dimensional
texturing is also enabled). See [**glTexImage1D**](glteximage1d.md).
| | GL\_TEXTURE\_2D | If enabled, two-dimensional texturing is
performed. See [**glTexImage2D**](glteximage2d.md). | |
GL\_TEXTURE\_GEN\_Q | If enabled, the *q* texture coordinate is
computed using the texture-generation function defined with
[**glTexGen**](gltexgen-functions.md). Otherwise, the current *q*
texture coordinate is used. | | GL\_TEXTURE\_GEN\_R | If enabled, the
*r* texture coordinate is computed using the texture generation
function defined with [**glTexGen**](gltexgen-functions.md). If
disabled, the current *r* texture coordinate is used. | |
GL\_TEXTURE\_GEN\_S | If enabled, the *s* texture coordinate is
computed using the texture generation function defined with
**glTexGen**. If disabled, the current *s* texture coordinate is
used. | | GL\_TEXTURE\_GEN\_T | If enabled, the *t* texture
coordinate is computed using the texture generation function defined
with [**glTexGen**](gltexgen-functions.md). If disabled, the current
*t* texture coordinate is used. |


%index
glEnableClientState
The glEnableClientState and glDisableClientState functions enable and disable arrays respectively. | glEnableClientState function (Gl.h)
%group
Win32 opengl32
%prm
array
array : [int] A symbolic constant for the array you want to enable or disable. This parameter can assume one of the following values.
%inst
The glEnableClientState and glDisableClientState functions enable and
disable arrays respectively. | glEnableClientState function (Gl.h)

[戻り値]
This function does not return a value.

[備考]
The **glEnableClientState** and **glDisableClientState** functions
enable and disable various individual arrays. Use
[**glIsEnabled**](glisenabled.md) or
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
to determine the current setting of any capability. Calling
**glEnableClientState** and **glDisableClientState** between calls to
[**glBegin**](glbegin.md) and the corresponding call to
[**glEnd**](glend.md) can cause an error. If no error is generated,
the behavior is undefined. > [!Note] > The **glEnableClientState**
and **glDisableClientState** functions are only available in OpenGL
version 1.1 or later.


%index
glEnd
The glBegin and glEnd functions delimit the vertices of a primitive or a group of like primitives. | glEnd function (Gl.h)
%group
Win32 opengl32
%prm

%inst
The glBegin and glEnd functions delimit the vertices of a primitive
or a group of like primitives. | glEnd function (Gl.h)

[戻り値]
This function has no parameters.
This function does not return a value.

[備考]
The [**glBegin**](glbegin.md) and **glEnd** functions delimit the
vertices that define a primitive or a group of like primitives. The
**glBegin** function accepts a single argument that specifies which
of ten primitives the vertices compose. Taking *n* as an integer
count starting at one, and *N* as the total number of vertices
specified, the interpretations are as follows: - You can use only a
subset of OpenGL functions between **glBegin** and **glEnd**. The
functions you can use are: - [**glVertex**](glvertex-functions.md) -
[**glColor**](glcolor-functions.md) -
[**glIndex**](glindex-functions.md) -
[**glNormal**](glnormal-functions.md) -
[**glTexCoord**](gltexcoord-functions.md) -
[**glEvalCoord**](glevalcoord-functions.md) -
[**glEvalPoint**](glevalpoint.md) -
[**glMaterial**](glmaterial-functions.md) -
[**glEdgeFlag**](gledgeflag-functions.md) You can also use
[**glCallList**](glcalllist.md) or [**glCallLists**](glcalllists.md)
to execute display lists that include only the preceding functions.
If any other OpenGL function is called between **glBegin** and
**glEnd**, the error flag is set and the function is ignored. -
Regardless of the value chosen for *mode* in **glBegin**, there is no
limit to the number of vertices you can define between **glBegin**
and **glEnd**. Lines, triangles, quadrilaterals, and polygons that
are incompletely specified are not drawn. Incomplete specification
results when either too few vertices are provided to specify even a
single primitive or when an incorrect multiple of vertices is
specified. The incomplete primitive is ignored; the complete
primitives are drawn. - The minimum specification of vertices for
each primitive is: | Minimum number of vertices | Type of primitive |
|----------------------------|-------------------| | 1 | point | | 2
| line | | 3 | triangle | | 4 | quadrilateral | | 3 | polygon |
- Modes that require a certain multiple of vertices are GL\_LINES
(2), GL\_TRIANGLES (3), GL\_QUADS (4), and GL\_QUAD\_STRIP (2).


%index
glEndList
The glNewList and glEndList functions create or replace a display list. | glEndList function (Gl.h)
%group
Win32 opengl32
%prm

%inst
The glNewList and glEndList functions create or replace a display
list. | glEndList function (Gl.h)

[戻り値]
This function has no parameters.
This function does not return a value.

[備考]
Display lists are groups of OpenGL commands that have been stored for
subsequent execution. The display lists are created with
[**glNewList**](glnewlist.md). All subsequent commands are placed in
the display list, in the order issued, until **glEndList** is called.
The [**glNewList**](glnewlist.md) function has two parameters. The
first parameter, *list*, is a positive integer that becomes the
unique name for the display list. Names can be created and reserved
with [**glGenLists**](glgenlists.md) and tested for uniqueness with
[**glIsList**](glislist.md). The second parameter, *mode*, is a
symbolic constant that can assume one of the two preceding values.
Certain commands are not compiled into the display list, but are
executed immediately, regardless of the display list mode. These
commands are [**glColorPointer**](glcolorpointer.md),
[**glDeleteLists**](gldeletelists.md),
[**glDisableClientState**](gldisableclientstate.md),
[**glEdgeFlagPointer**](gledgeflagpointer.md),
[**glEnableClientState**](glenableclientstate.md),
[**glFeedbackBuffer**](glfeedbackbuffer.md),
[**glFinish**](glfinish.md), [**glFlush**](glflush.md),
[**glGenLists**](glgenlists.md),
[**glIndexPointer**](glindexpointer.md),
[**glInterleavedArrays**](glinterleavedarrays.md),
[**glIsEnabled**](glisenabled.md), [**glIsList**](glislist.md),
[**glNormalPointer**](glnormalpointer.md),
[**glPopClientAttrib**](glpopclientattrib.md),
[**glPixelStore**](glpixelstore-functions.md),
[**glPushClientAttrib**](glpushclientattrib.md),
[**glReadPixels**](glreadpixels.md),
[**glRenderMode**](glrendermode.md),
[**glSelectBuffer**](glselectbuffer.md),
[**glTexCoordPointer**](gltexcoordpointer.md),
[**glVertexPointer**](glvertexpointer.md), and all of the
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
routines. Similarly, [**glTexImage2D**](glteximage2d.md) and
[**glTexImage1D**](glteximage1d.md) are executed immediately and not
compiled into the display list when their first argument is
GL\_PROXY\_TEXTURE\_2D or GL\_PROXY\_TEXTURE\_1D, respectively. When
the **glEndList** function is encountered, the display list
definition is completed by associating the list with the unique name
*list* (specified in the [**glNewList**](glnewlist.md) command). If a
display list with name *list* already exists, it is replaced only
when **glEndList** is called. The [**glCallList**](glcalllist.md) and
[**glCallLists**](glcalllists.md) functions can be entered into
display lists. The commands in the display list or lists executed by
**glCallList** or **glCallLists** are not included in the display
list being created, even if the list creation mode is
GL\_COMPILE\_AND\_EXECUTE. The following function retrieves
information related to [**glNewList**](glnewlist.md):
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_MATRIX\_MODE


%index
glEvalCoord1d
The glEvalCoord1d function evaluates enabled one-dimensional maps.
%group
Win32 opengl32
%prm
u
u : [double] A value that is the domain coordinate *u* to the basis function defined in a previous [**glMap1**](glmap1.md) function.
%inst
The glEvalCoord1d function evaluates enabled one-dimensional maps.

[戻り値]
This function does not return a value.

[備考]
The **glEvalCoord1d** function evaluates enabled one-dimensional maps
at argument *u*. Define maps with [**glMap1**](glmap1.md). Enable or
disable them with [**glEnable**](glenable.md) and
[**glDisable**](gldisable.md). When one of the **glEvalCoord**
functions is issued, all currently enabled maps of the indicated
dimension are evaluated. Then, for each enabled map, it is as if the
corresponding OpenGL function were issued with the computed value.
That is, if GL\_MAP1\_INDEX or GL\_MAP2\_INDEX is enabled, a
[**glIndex**](glindex-functions.md) function is simulated. If
GL\_MAP1\_COLOR\_4 or GL\_MAP2\_COLOR\_4 is enabled, a **glcolor**
function is simulated. If GL\_MAP1\_NORMAL or GL\_MAP2\_NORMAL is
enabled, a normal vector is produced, and if any of
GL\_MAP1\_TEXTURE\_COORD\_1, GL\_MAP1\_TEXTURE\_COORD\_2,
GL\_MAP1\_TEXTURE\_COORD\_3, GL\_MAP1\_TEXTURE\_COORD\_4,
GL\_MAP2\_TEXTURE\_COORD\_1, GL\_MAP2\_TEXTURE\_COORD\_2,
GL\_MAP2\_TEXTURE\_COORD\_3, and GL\_MAP2\_TEXTURE\_COORD\_4 is
enabled, then an appropriate
[**glTexCoord**](gltexcoord-functions.md) function is simulated.
OpenGL uses evaluated values instead of current values for those
evaluations that are enabled, and current values otherwise, for
color, color index, normal, and texture coordinates. However, the
evaluated values do not update the current values. Thus, if
[**glVertex**](glvertex-functions.md) functions are interspersed with
**glEvalCoord** functions, the color, normal, and texture coordinates
associated with the **glVertex** functions are not affected by the
values generated by the **glEvalCoord** functions, but only by the
most recent [**glColor**](glcolor-functions.md),
[**glIndex**](glindex-functions.md),
[**glNormal**](glnormal-functions.md), and
[**glTexCoord**](gltexcoord-functions.md) functions. The following
functions retrieve information related to the **glEvalCoord1d**
function: [**glIsEnabled**](glisenabled.md) with argument
GL\_MAP1\_VERTEX\_3 [**glIsEnabled**](glisenabled.md) with argument
GL\_MAP1\_VERTEX\_4 [**glIsEnabled**](glisenabled.md) with argument
GL\_MAP1\_INDEX [**glIsEnabled**](glisenabled.md) with argument
GL\_MAP1\_COLOR\_4 [**glIsEnabled**](glisenabled.md) with argument
GL\_MAP1\_NORMAL [**glIsEnabled**](glisenabled.md) with argument
GL\_MAP1\_TEXTURE\_COORD\_1 [**glIsEnabled**](glisenabled.md) with
argument GL\_MAP1\_TEXTURE\_COORD\_2
[**glIsEnabled**](glisenabled.md) with argument
GL\_MAP1\_TEXTURE\_COORD\_3 [**glIsEnabled**](glisenabled.md) with
argument GL\_MAP1\_TEXTURE\_COORD\_4
[**glIsEnabled**](glisenabled.md) with argument GL\_MAP2\_VERTEX\_3
[**glIsEnabled**](glisenabled.md) with argument GL\_MAP2\_VERTEX\_4
[**glIsEnabled**](glisenabled.md) with argument GL\_MAP2\_INDEX
[**glIsEnabled**](glisenabled.md) with argument GL\_MAP2\_COLOR\_4
[**glIsEnabled**](glisenabled.md) with argument GL\_MAP2\_NORMAL
[**glIsEnabled**](glisenabled.md) with argument
GL\_MAP2\_TEXTURE\_COORD\_1 [**glIsEnabled**](glisenabled.md) with
argument GL\_MAP2\_TEXTURE\_COORD\_2
[**glIsEnabled**](glisenabled.md) with argument
GL\_MAP2\_TEXTURE\_COORD\_3 [**glIsEnabled**](glisenabled.md) with
argument GL\_MAP2\_TEXTURE\_COORD\_4
[**glIsEnabled**](glisenabled.md) with argument GL\_AUTO\_NORMAL


%index
glEvalCoord1dv
The glEvalCoord1dv function evaluates enabled one-dimensional maps.
%group
Win32 opengl32
%prm
u
u : [var] A pointer to an array containing the domain coordinate *u*.
%inst
The glEvalCoord1dv function evaluates enabled one-dimensional maps.

[戻り値]
This function does not return a value.

[備考]
The **glEvalCoord1dv** function evaluates enabled one-dimensional
maps at argument *u*. Define maps with [**glMap1**](glmap1.md).
Enable or disable them with [**glEnable**](glenable.md) and
[**glDisable**](gldisable.md). When one of the **glEvalCoord**
functions is issued, all currently enabled maps of the indicated
dimension are evaluated. Then, for each enabled map, it is as if the
corresponding OpenGL function were issued with the computed value.
That is, if GL\_MAP1\_INDEX or GL\_MAP2\_INDEX is enabled, a
[**glIndex**](glindex-functions.md) function is simulated. If
GL\_MAP1\_COLOR\_4 or GL\_MAP2\_COLOR\_4 is enabled, a **glcolor**
function is simulated. If GL\_MAP1\_NORMAL or GL\_MAP2\_NORMAL is
enabled, a normal vector is produced, and if any of
GL\_MAP1\_TEXTURE\_COORD\_1, GL\_MAP1\_TEXTURE\_COORD\_2,
GL\_MAP1\_TEXTURE\_COORD\_3, GL\_MAP1\_TEXTURE\_COORD\_4,
GL\_MAP2\_TEXTURE\_COORD\_1, GL\_MAP2\_TEXTURE\_COORD\_2,
GL\_MAP2\_TEXTURE\_COORD\_3, and GL\_MAP2\_TEXTURE\_COORD\_4 is
enabled, then an appropriate
[**glTexCoord**](gltexcoord-functions.md) function is simulated.
OpenGL uses evaluated values instead of current values for those
evaluations that are enabled, and current values otherwise, for
color, color index, normal, and texture coordinates. However, the
evaluated values do not update the current values. Thus, if
[**glVertex**](glvertex-functions.md) functions are interspersed with
**glEvalCoord** functions, the color, normal, and texture coordinates
associated with the **glVertex** functions are not affected by the
values generated by the **glEvalCoord** functions, but only by the
most recent [**glColor**](glcolor-functions.md),
[**glIndex**](glindex-functions.md),
[**glNormal**](glnormal-functions.md), and
[**glTexCoord**](gltexcoord-functions.md) functions. The following
functions retrieve information related to the **glEvalCoord1dv**
function: [**glIsEnabled**](glisenabled.md) with argument
GL\_MAP1\_VERTEX\_3 [**glIsEnabled**](glisenabled.md) with argument
GL\_MAP1\_VERTEX\_4 [**glIsEnabled**](glisenabled.md) with argument
GL\_MAP1\_INDEX [**glIsEnabled**](glisenabled.md) with argument
GL\_MAP1\_COLOR\_4 [**glIsEnabled**](glisenabled.md) with argument
GL\_MAP1\_NORMAL [**glIsEnabled**](glisenabled.md) with argument
GL\_MAP1\_TEXTURE\_COORD\_1 [**glIsEnabled**](glisenabled.md) with
argument GL\_MAP1\_TEXTURE\_COORD\_2
[**glIsEnabled**](glisenabled.md) with argument
GL\_MAP1\_TEXTURE\_COORD\_3 [**glIsEnabled**](glisenabled.md) with
argument GL\_MAP1\_TEXTURE\_COORD\_4
[**glIsEnabled**](glisenabled.md) with argument GL\_MAP2\_VERTEX\_3
[**glIsEnabled**](glisenabled.md) with argument GL\_MAP2\_VERTEX\_4
[**glIsEnabled**](glisenabled.md) with argument GL\_MAP2\_INDEX
[**glIsEnabled**](glisenabled.md) with argument GL\_MAP2\_COLOR\_4
[**glIsEnabled**](glisenabled.md) with argument GL\_MAP2\_NORMAL
[**glIsEnabled**](glisenabled.md) with argument
GL\_MAP2\_TEXTURE\_COORD\_1 [**glIsEnabled**](glisenabled.md) with
argument GL\_MAP2\_TEXTURE\_COORD\_2
[**glIsEnabled**](glisenabled.md) with argument
GL\_MAP2\_TEXTURE\_COORD\_3 [**glIsEnabled**](glisenabled.md) with
argument GL\_MAP2\_TEXTURE\_COORD\_4
[**glIsEnabled**](glisenabled.md) with argument GL\_AUTO\_NORMAL


%index
glEvalCoord1f
The glEvalCoord1f function evaluates enabled one-dimensional maps.
%group
Win32 opengl32
%prm
u
u : [float] A value that is the domain coordinate *u* to the basis function defined in a previous [**glMap1**](glmap1.md) function.
%inst
The glEvalCoord1f function evaluates enabled one-dimensional maps.

[戻り値]
This function does not return a value.

[備考]
The **glEvalCoord1f** function evaluates enabled one-dimensional maps
at argument *u*. Define maps with [**glMap1**](glmap1.md). Enable or
disable them with [**glEnable**](glenable.md) and
[**glDisable**](gldisable.md). When one of the **glEvalCoord**
functions is issued, all currently enabled maps of the indicated
dimension are evaluated. Then, for each enabled map, it is as if the
corresponding OpenGL function were issued with the computed value.
That is, if GL\_MAP1\_INDEX or GL\_MAP2\_INDEX is enabled, a
[**glIndex**](glindex-functions.md) function is simulated. If
GL\_MAP1\_COLOR\_4 or GL\_MAP2\_COLOR\_4 is enabled, a **glcolor**
function is simulated. If GL\_MAP1\_NORMAL or GL\_MAP2\_NORMAL is
enabled, a normal vector is produced, and if any of
GL\_MAP1\_TEXTURE\_COORD\_1, GL\_MAP1\_TEXTURE\_COORD\_2,
GL\_MAP1\_TEXTURE\_COORD\_3, GL\_MAP1\_TEXTURE\_COORD\_4,
GL\_MAP2\_TEXTURE\_COORD\_1, GL\_MAP2\_TEXTURE\_COORD\_2,
GL\_MAP2\_TEXTURE\_COORD\_3, and GL\_MAP2\_TEXTURE\_COORD\_4 is
enabled, then an appropriate
[**glTexCoord**](gltexcoord-functions.md) function is simulated.
OpenGL uses evaluated values instead of current values for those
evaluations that are enabled, and current values otherwise, for
color, color index, normal, and texture coordinates. However, the
evaluated values do not update the current values. Thus, if
[**glVertex**](glvertex-functions.md) functions are interspersed with
**glEvalCoord** functions, the color, normal, and texture coordinates
associated with the **glVertex** functions are not affected by the
values generated by the **glEvalCoord** functions, but only by the
most recent [**glColor**](glcolor-functions.md),
[**glIndex**](glindex-functions.md),
[**glNormal**](glnormal-functions.md), and
[**glTexCoord**](gltexcoord-functions.md) functions. The following
functions retrieve information related to the **glEvalCoord1f**
function: [**glIsEnabled**](glisenabled.md) with argument
GL\_MAP1\_VERTEX\_3 [**glIsEnabled**](glisenabled.md) with argument
GL\_MAP1\_VERTEX\_4 [**glIsEnabled**](glisenabled.md) with argument
GL\_MAP1\_INDEX [**glIsEnabled**](glisenabled.md) with argument
GL\_MAP1\_COLOR\_4 [**glIsEnabled**](glisenabled.md) with argument
GL\_MAP1\_NORMAL [**glIsEnabled**](glisenabled.md) with argument
GL\_MAP1\_TEXTURE\_COORD\_1 [**glIsEnabled**](glisenabled.md) with
argument GL\_MAP1\_TEXTURE\_COORD\_2
[**glIsEnabled**](glisenabled.md) with argument
GL\_MAP1\_TEXTURE\_COORD\_3 [**glIsEnabled**](glisenabled.md) with
argument GL\_MAP1\_TEXTURE\_COORD\_4
[**glIsEnabled**](glisenabled.md) with argument GL\_MAP2\_VERTEX\_3
[**glIsEnabled**](glisenabled.md) with argument GL\_MAP2\_VERTEX\_4
[**glIsEnabled**](glisenabled.md) with argument GL\_MAP2\_INDEX
[**glIsEnabled**](glisenabled.md) with argument GL\_MAP2\_COLOR\_4
[**glIsEnabled**](glisenabled.md) with argument GL\_MAP2\_NORMAL
[**glIsEnabled**](glisenabled.md) with argument
GL\_MAP2\_TEXTURE\_COORD\_1 [**glIsEnabled**](glisenabled.md) with
argument GL\_MAP2\_TEXTURE\_COORD\_2
[**glIsEnabled**](glisenabled.md) with argument
GL\_MAP2\_TEXTURE\_COORD\_3 [**glIsEnabled**](glisenabled.md) with
argument GL\_MAP2\_TEXTURE\_COORD\_4
[**glIsEnabled**](glisenabled.md) with argument GL\_AUTO\_NORMAL


%index
glEvalCoord1fv
The glEvalCoord1fv function evaluates enabled one-dimensional maps.
%group
Win32 opengl32
%prm
u
u : [var] A pointer to an array containing the domain coordinate *u*.
%inst
The glEvalCoord1fv function evaluates enabled one-dimensional maps.

[戻り値]
This function does not return a value.

[備考]
The [**glEvalCoord1fv**](glevalcoord1dv.md) function evaluates
enabled one-dimensional maps at argument *u*. Define maps with
[**glMap1**](glmap1.md). Enable or disable them with
[**glEnable**](glenable.md) and [**glDisable**](gldisable.md). When
one of the **glEvalCoord** functions is issued, all currently enabled
maps of the indicated dimension are evaluated. Then, for each enabled
map, it is as if the corresponding OpenGL function were issued with
the computed value. That is, if GL\_MAP1\_INDEX or GL\_MAP2\_INDEX is
enabled, a [**glIndex**](glindex-functions.md) function is simulated.
If GL\_MAP1\_COLOR\_4 or GL\_MAP2\_COLOR\_4 is enabled, a **glcolor**
function is simulated. If GL\_MAP1\_NORMAL or GL\_MAP2\_NORMAL is
enabled, a normal vector is produced, and if any of
GL\_MAP1\_TEXTURE\_COORD\_1, GL\_MAP1\_TEXTURE\_COORD\_2,
GL\_MAP1\_TEXTURE\_COORD\_3, GL\_MAP1\_TEXTURE\_COORD\_4,
GL\_MAP2\_TEXTURE\_COORD\_1, GL\_MAP2\_TEXTURE\_COORD\_2,
GL\_MAP2\_TEXTURE\_COORD\_3, and GL\_MAP2\_TEXTURE\_COORD\_4 is
enabled, then an appropriate
[**glTexCoord**](gltexcoord-functions.md) function is simulated.
OpenGL uses evaluated values instead of current values for those
evaluations that are enabled, and current values otherwise, for
color, color index, normal, and texture coordinates. However, the
evaluated values do not update the current values. Thus, if
[**glVertex**](glvertex-functions.md) functions are interspersed with
**glEvalCoord** functions, the color, normal, and texture coordinates
associated with the **glVertex** functions are not affected by the
values generated by the **glEvalCoord** functions, but only by the
most recent [**glColor**](glcolor-functions.md),
[**glIndex**](glindex-functions.md),
[**glNormal**](glnormal-functions.md), and
[**glTexCoord**](gltexcoord-functions.md) functions. The following
functions retrieve information related to the **glEvalCoord1fv**
function: [**glIsEnabled**](glisenabled.md) with argument
GL\_MAP1\_VERTEX\_3 [**glIsEnabled**](glisenabled.md) with argument
GL\_MAP1\_VERTEX\_4 [**glIsEnabled**](glisenabled.md) with argument
GL\_MAP1\_INDEX [**glIsEnabled**](glisenabled.md) with argument
GL\_MAP1\_COLOR\_4 [**glIsEnabled**](glisenabled.md) with argument
GL\_MAP1\_NORMAL [**glIsEnabled**](glisenabled.md) with argument
GL\_MAP1\_TEXTURE\_COORD\_1 [**glIsEnabled**](glisenabled.md) with
argument GL\_MAP1\_TEXTURE\_COORD\_2
[**glIsEnabled**](glisenabled.md) with argument
GL\_MAP1\_TEXTURE\_COORD\_3 [**glIsEnabled**](glisenabled.md) with
argument GL\_MAP1\_TEXTURE\_COORD\_4
[**glIsEnabled**](glisenabled.md) with argument GL\_MAP2\_VERTEX\_3
[**glIsEnabled**](glisenabled.md) with argument GL\_MAP2\_VERTEX\_4
[**glIsEnabled**](glisenabled.md) with argument GL\_MAP2\_INDEX
[**glIsEnabled**](glisenabled.md) with argument GL\_MAP2\_COLOR\_4
[**glIsEnabled**](glisenabled.md) with argument GL\_MAP2\_NORMAL
[**glIsEnabled**](glisenabled.md) with argument
GL\_MAP2\_TEXTURE\_COORD\_1 [**glIsEnabled**](glisenabled.md) with
argument GL\_MAP2\_TEXTURE\_COORD\_2
[**glIsEnabled**](glisenabled.md) with argument
GL\_MAP2\_TEXTURE\_COORD\_3 [**glIsEnabled**](glisenabled.md) with
argument GL\_MAP2\_TEXTURE\_COORD\_4
[**glIsEnabled**](glisenabled.md) with argument GL\_AUTO\_NORMAL


%index
glEvalCoord2d
The glEvalCoord2d function evaluates enabled two-dimensional maps.
%group
Win32 opengl32
%prm
u, v
u : [double] A value that is the domain coordinate *u* to the basis function defined in a previous [**glMap2**](glmap2.md) function.
v : [double] A value that is the domain coordinate *v* to the basis function defined in a previous [**glMap2**](glmap2.md) function.
%inst
The glEvalCoord2d function evaluates enabled two-dimensional maps.

[戻り値]
This function does not return a value.

[備考]
The **glEvalCoord2d** function evaluates enabled two-dimensional maps
using two domain values, *u* and *v*. Define maps with
[**glMap1**](glmap1.md) and [**glMap2**](glmap2.md). Enable or
disable them with [**glEnable**](glenable.md) and
[**glDisable**](gldisable.md). When one of the **glEvalCoord**
functions is issued, all currently enabled maps of the indicated
dimension are evaluated. Then, for each enabled map, it is as if the
corresponding OpenGL function were issued with the computed value.
That is, if GL\_MAP1\_INDEX or GL\_MAP2\_INDEX is enabled, a
[**glIndex**](glindex-functions.md) function is simulated. If
GL\_MAP1\_COLOR\_4 or GL\_MAP2\_COLOR\_4 is enabled, a **glcolor**
function is simulated. If GL\_MAP1\_NORMAL or GL\_MAP2\_NORMAL is
enabled, a normal vector is produced, and if any of
GL\_MAP1\_TEXTURE\_COORD\_1, GL\_MAP1\_TEXTURE\_COORD\_2,
GL\_MAP1\_TEXTURE\_COORD\_3, GL\_MAP1\_TEXTURE\_COORD\_4,
GL\_MAP2\_TEXTURE\_COORD\_1, GL\_MAP2\_TEXTURE\_COORD\_2,
GL\_MAP2\_TEXTURE\_COORD\_3, and GL\_MAP2\_TEXTURE\_COORD\_4 is
enabled, then an appropriate
[**glTexCoord**](gltexcoord-functions.md) function is simulated.
OpenGL uses evaluated values instead of current values for those
evaluations that are enabled, and current values otherwise, for
color, color index, normal, and texture coordinates. However, the
evaluated values do not update the current values. Thus, if
[**glVertex**](glvertex-functions.md) functions are interspersed with
**glEvalCoord** functions, the color, normal, and texture coordinates
associated with the **glVertex** functions are not affected by the
values generated by the **glEvalCoord** functions, but only by the
most recent [**glColor**](glcolor-functions.md),
[**glIndex**](glindex-functions.md),
[**glNormal**](glnormal-functions.md), and
[**glTexCoord**](gltexcoord-functions.md) functions. If automatic
normal generation is enabled, **glEvalCoord2d** calls
[**glEnable**](glenable.md) with argument GL\_AUTO\_NORMAL to
generate surface normals analytically, regardless of the contents or
enabling of the GL\_MAP2\_NORMAL map. Let ![Equation showing a
cross-product value for a map m.](images/evlcrd01.png) The generated
normal **n** is ![Equation showing the generated normal n for the
map.](images/evlcrd02.png) The following functions retrieve
information related to the **glEvalCoord2d** function:
[**glIsEnabled**](glisenabled.md) with argument GL\_MAP1\_VERTEX\_3
[**glIsEnabled**](glisenabled.md) with argument GL\_MAP1\_VERTEX\_4
[**glIsEnabled**](glisenabled.md) with argument GL\_MAP1\_INDEX
[**glIsEnabled**](glisenabled.md) with argument GL\_MAP1\_COLOR\_4
[**glIsEnabled**](glisenabled.md) with argument GL\_MAP1\_NORMAL
[**glIsEnabled**](glisenabled.md) with argument
GL\_MAP1\_TEXTURE\_COORD\_1 [**glIsEnabled**](glisenabled.md) with
argument GL\_MAP1\_TEXTURE\_COORD\_2
[**glIsEnabled**](glisenabled.md) with argument
GL\_MAP1\_TEXTURE\_COORD\_3 [**glIsEnabled**](glisenabled.md) with
argument GL\_MAP1\_TEXTURE\_COORD\_4
[**glIsEnabled**](glisenabled.md) with argument GL\_MAP2\_VERTEX\_3
[**glIsEnabled**](glisenabled.md) with argument GL\_MAP2\_VERTEX\_4
[**glIsEnabled**](glisenabled.md) with argument GL\_MAP2\_INDEX
[**glIsEnabled**](glisenabled.md) with argument GL\_MAP2\_COLOR\_4
[**glIsEnabled**](glisenabled.md) with argument GL\_MAP2\_NORMAL
[**glIsEnabled**](glisenabled.md) with argument
GL\_MAP2\_TEXTURE\_COORD\_1 [**glIsEnabled**](glisenabled.md) with
argument GL\_MAP2\_TEXTURE\_COORD\_2
[**glIsEnabled**](glisenabled.md) with argument
GL\_MAP2\_TEXTURE\_COORD\_3 [**glIsEnabled**](glisenabled.md) with
argument GL\_MAP2\_TEXTURE\_COORD\_4
[**glIsEnabled**](glisenabled.md) with argument GL\_AUTO\_NORMAL


%index
glEvalCoord2dv
The glEvalCoord2dv function evaluates enabled two-dimensional maps.
%group
Win32 opengl32
%prm
u
u : [var] A pointer to an array containing the domain coordinate *u*.
%inst
The glEvalCoord2dv function evaluates enabled two-dimensional maps.

[戻り値]
This function does not return a value.

[備考]
The **glEvalCoord2dv** function evaluates enabled two-dimensional
maps using two domain values, *u* and *v*. Define maps with
[**glMap1**](glmap1.md). Enable or disable them with
[**glEnable**](glenable.md) and [**glDisable**](gldisable.md). When
one of the **glEvalCoord** functions is issued, all currently enabled
maps of the indicated dimension are evaluated. Then, for each enabled
map, it is as if the corresponding OpenGL function were issued with
the computed value. That is, if GL\_MAP1\_INDEX or GL\_MAP2\_INDEX is
enabled, a [**glIndex**](glindex-functions.md) function is simulated.
If GL\_MAP1\_COLOR\_4 or GL\_MAP2\_COLOR\_4 is enabled, a **glcolor**
function is simulated. If GL\_MAP1\_NORMAL or GL\_MAP2\_NORMAL is
enabled, a normal vector is produced, and if any of
GL\_MAP1\_TEXTURE\_COORD\_1, GL\_MAP1\_TEXTURE\_COORD\_2,
GL\_MAP1\_TEXTURE\_COORD\_3, GL\_MAP1\_TEXTURE\_COORD\_4,
GL\_MAP2\_TEXTURE\_COORD\_1, GL\_MAP2\_TEXTURE\_COORD\_2,
GL\_MAP2\_TEXTURE\_COORD\_3, and GL\_MAP2\_TEXTURE\_COORD\_4 is
enabled, then an appropriate
[**glTexCoord**](gltexcoord-functions.md) function is simulated.
OpenGL uses evaluated values instead of current values for those
evaluations that are enabled, and current values otherwise, for
color, color index, normal, and texture coordinates. However, the
evaluated values do not update the current values. Thus, if
[**glVertex**](glvertex-functions.md) functions are interspersed with
**glEvalCoord** functions, the color, normal, and texture coordinates
associated with the **glVertex** functions are not affected by the
values generated by the **glEvalCoord** functions, but only by the
most recent [**glColor**](glcolor-functions.md),
[**glIndex**](glindex-functions.md),
[**glNormal**](glnormal-functions.md), and
[**glTexCoord**](gltexcoord-functions.md) functions. If automatic
normal generation is enabled, **glEvalCoord2dv** calls
[**glEnable**](glenable.md) with argument GL\_AUTO\_NORMAL to
generate surface normals analytically, regardless of the contents or
enabling of the GL\_MAP2\_NORMAL map. Let ![Equation showing a
cross-product value for a map m.](images/evlcrd01.png) The generated
normal **n** is ![Equation showing the generated normal n for the
map.](images/evlcrd02.png) The following functions retrieve
information related to the **glEvalCoord2dv** function:
[**glIsEnabled**](glisenabled.md) with argument GL\_MAP1\_VERTEX\_3
[**glIsEnabled**](glisenabled.md) with argument GL\_MAP1\_VERTEX\_4
[**glIsEnabled**](glisenabled.md) with argument GL\_MAP1\_INDEX
[**glIsEnabled**](glisenabled.md) with argument GL\_MAP1\_COLOR\_4
[**glIsEnabled**](glisenabled.md) with argument GL\_MAP1\_NORMAL
[**glIsEnabled**](glisenabled.md) with argument
GL\_MAP1\_TEXTURE\_COORD\_1 [**glIsEnabled**](glisenabled.md) with
argument GL\_MAP1\_TEXTURE\_COORD\_2
[**glIsEnabled**](glisenabled.md) with argument
GL\_MAP1\_TEXTURE\_COORD\_3 [**glIsEnabled**](glisenabled.md) with
argument GL\_MAP1\_TEXTURE\_COORD\_4
[**glIsEnabled**](glisenabled.md) with argument GL\_MAP2\_VERTEX\_3
[**glIsEnabled**](glisenabled.md) with argument GL\_MAP2\_VERTEX\_4
[**glIsEnabled**](glisenabled.md) with argument GL\_MAP2\_INDEX
[**glIsEnabled**](glisenabled.md) with argument GL\_MAP2\_COLOR\_4
[**glIsEnabled**](glisenabled.md) with argument GL\_MAP2\_NORMAL
[**glIsEnabled**](glisenabled.md) with argument
GL\_MAP2\_TEXTURE\_COORD\_1 [**glIsEnabled**](glisenabled.md) with
argument GL\_MAP2\_TEXTURE\_COORD\_2
[**glIsEnabled**](glisenabled.md) with argument
GL\_MAP2\_TEXTURE\_COORD\_3 [**glIsEnabled**](glisenabled.md) with
argument GL\_MAP2\_TEXTURE\_COORD\_4
[**glIsEnabled**](glisenabled.md) with argument GL\_AUTO\_NORMAL


%index
glEvalCoord2f
The glEvalCoord2f function evaluates enabled two-dimensional maps.
%group
Win32 opengl32
%prm
u, v
u : [float] A value that is the domain coordinate *u* to the basis function defined in a previous [**glMap2**](glmap2.md) function.
v : [float] A value that is the domain coordinate *v* to the basis function defined in a previous [**glMap2**](glmap2.md) function.
%inst
The glEvalCoord2f function evaluates enabled two-dimensional maps.

[戻り値]
This function does not return a value.

[備考]
The [**glEvalCoord2f**](glevalcoord2d.md) function evaluates enabled
two-dimensional maps using two domain values, *u* and *v*. Define
maps with [**glMap2**](glmap2.md). Enable or disable them with
[**glEnable**](glenable.md) and [**glDisable**](gldisable.md). When
one of the **glEvalCoord** functions is issued, all currently enabled
maps of the indicated dimension are evaluated. Then, for each enabled
map, it is as if the corresponding OpenGL function were issued with
the computed value. That is, if GL\_MAP1\_INDEX or GL\_MAP2\_INDEX is
enabled, a [**glIndex**](glindex-functions.md) function is simulated.
If GL\_MAP1\_COLOR\_4 or GL\_MAP2\_COLOR\_4 is enabled, a **glcolor**
function is simulated. If GL\_MAP1\_NORMAL or GL\_MAP2\_NORMAL is
enabled, a normal vector is produced, and if any of
GL\_MAP1\_TEXTURE\_COORD\_1, GL\_MAP1\_TEXTURE\_COORD\_2,
GL\_MAP1\_TEXTURE\_COORD\_3, GL\_MAP1\_TEXTURE\_COORD\_4,
GL\_MAP2\_TEXTURE\_COORD\_1, GL\_MAP2\_TEXTURE\_COORD\_2,
GL\_MAP2\_TEXTURE\_COORD\_3, and GL\_MAP2\_TEXTURE\_COORD\_4 is
enabled, then an appropriate
[**glTexCoord**](gltexcoord-functions.md) function is simulated.
OpenGL uses evaluated values instead of current values for those
evaluations that are enabled, and current values otherwise, for
color, color index, normal, and texture coordinates. However, the
evaluated values do not update the current values. Thus, if
[**glVertex**](glvertex-functions.md) functions are interspersed with
**glEvalCoord** functions, the color, normal, and texture coordinates
associated with the **glVertex** functions are not affected by the
values generated by the **glEvalCoord** functions, but only by the
most recent [**glColor**](glcolor-functions.md),
[**glIndex**](glindex-functions.md),
[**glNormal**](glnormal-functions.md), and
[**glTexCoord**](gltexcoord-functions.md) functions. If automatic
normal generation is enabled, [**glEvalCoord2f**](glevalcoord2d.md)
calls [**glEnable**](glenable.md) with argument GL\_AUTO\_NORMAL to
generate surface normals analytically, regardless of the contents or
enabling of the GL\_MAP2\_NORMAL map. Let ![Equation showing a
cross-product value for a map m.](images/evlcrd01.png) The generated
normal **n** is ![Equation showing the generated normal n for the
map.](images/evlcrd02.png) The following functions retrieve
information related to the [**glEvalCoord2f**](glevalcoord2d.md)
function: [**glIsEnabled**](glisenabled.md) with argument
GL\_MAP1\_VERTEX\_3 [**glIsEnabled**](glisenabled.md) with argument
GL\_MAP1\_VERTEX\_4 [**glIsEnabled**](glisenabled.md) with argument
GL\_MAP1\_INDEX [**glIsEnabled**](glisenabled.md) with argument
GL\_MAP1\_COLOR\_4 [**glIsEnabled**](glisenabled.md) with argument
GL\_MAP1\_NORMAL [**glIsEnabled**](glisenabled.md) with argument
GL\_MAP1\_TEXTURE\_COORD\_1 [**glIsEnabled**](glisenabled.md) with
argument GL\_MAP1\_TEXTURE\_COORD\_2
[**glIsEnabled**](glisenabled.md) with argument
GL\_MAP1\_TEXTURE\_COORD\_3 [**glIsEnabled**](glisenabled.md) with
argument GL\_MAP1\_TEXTURE\_COORD\_4
[**glIsEnabled**](glisenabled.md) with argument GL\_MAP2\_VERTEX\_3
[**glIsEnabled**](glisenabled.md) with argument GL\_MAP2\_VERTEX\_4
[**glIsEnabled**](glisenabled.md) with argument GL\_MAP2\_INDEX
[**glIsEnabled**](glisenabled.md) with argument GL\_MAP2\_COLOR\_4
[**glIsEnabled**](glisenabled.md) with argument GL\_MAP2\_NORMAL
[**glIsEnabled**](glisenabled.md) with argument
GL\_MAP2\_TEXTURE\_COORD\_1 [**glIsEnabled**](glisenabled.md) with
argument GL\_MAP2\_TEXTURE\_COORD\_2
[**glIsEnabled**](glisenabled.md) with argument
GL\_MAP2\_TEXTURE\_COORD\_3 [**glIsEnabled**](glisenabled.md) with
argument GL\_MAP2\_TEXTURE\_COORD\_4
[**glIsEnabled**](glisenabled.md) with argument GL\_AUTO\_NORMAL


%index
glEvalCoord2fv
The glEvalCoord2fv function evaluates enabled two-dimensional maps.
%group
Win32 opengl32
%prm
u
u : [var] A pointer to an array containing the domain coordinate *u*.
%inst
The glEvalCoord2fv function evaluates enabled two-dimensional maps.

[戻り値]
This function does not return a value.

[備考]
The **glEvalCoord2fv** function evaluates enabled two-dimensional
maps using two domain values, *u* and *v*. Define maps with
[**glMap1**](glmap1.md). Enable or disable them with
[**glEnable**](glenable.md) and [**glDisable**](gldisable.md). When
one of the **glEvalCoord** functions is issued, all currently enabled
maps of the indicated dimension are evaluated. Then, for each enabled
map, it is as if the corresponding OpenGL function were issued with
the computed value. That is, if GL\_MAP1\_INDEX or GL\_MAP2\_INDEX is
enabled, a [**glIndex**](glindex-functions.md) function is simulated.
If GL\_MAP1\_COLOR\_4 or GL\_MAP2\_COLOR\_4 is enabled, a **glcolor**
function is simulated. If GL\_MAP1\_NORMAL or GL\_MAP2\_NORMAL is
enabled, a normal vector is produced, and if any of
GL\_MAP1\_TEXTURE\_COORD\_1, GL\_MAP1\_TEXTURE\_COORD\_2,
GL\_MAP1\_TEXTURE\_COORD\_3, GL\_MAP1\_TEXTURE\_COORD\_4,
GL\_MAP2\_TEXTURE\_COORD\_1, GL\_MAP2\_TEXTURE\_COORD\_2,
GL\_MAP2\_TEXTURE\_COORD\_3, and GL\_MAP2\_TEXTURE\_COORD\_4 is
enabled, then an appropriate
[**glTexCoord**](gltexcoord-functions.md) function is simulated.
OpenGL uses evaluated values instead of current values for those
evaluations that are enabled, and current values otherwise, for
color, color index, normal, and texture coordinates. However, the
evaluated values do not update the current values. Thus, if
[**glVertex**](glvertex-functions.md) functions are interspersed with
**glEvalCoord** functions, the color, normal, and texture coordinates
associated with the **glVertex** functions are not affected by the
values generated by the **glEvalCoord** functions, but only by the
most recent [**glColor**](glcolor-functions.md),
[**glIndex**](glindex-functions.md),
[**glNormal**](glnormal-functions.md), and
[**glTexCoord**](gltexcoord-functions.md) functions. If automatic
normal generation is enabled, **glEvalCoord2fv** calls
[**glEnable**](glenable.md) with argument GL\_AUTO\_NORMAL to
generate surface normals analytically, regardless of the contents or
enabling of the GL\_MAP2\_NORMAL map. Let ![Equation showing a
cross-product value for a map m.](images/evlcrd01.png) The generated
normal **n** is ![Equation showing the generated normal n for the
map.](images/evlcrd02.png) The following functions retrieve
information related to the **glEvalCoord2fv** function:
[**glIsEnabled**](glisenabled.md) with argument GL\_MAP1\_VERTEX\_3
[**glIsEnabled**](glisenabled.md) with argument GL\_MAP1\_VERTEX\_4
[**glIsEnabled**](glisenabled.md) with argument GL\_MAP1\_INDEX
[**glIsEnabled**](glisenabled.md) with argument GL\_MAP1\_COLOR\_4
[**glIsEnabled**](glisenabled.md) with argument GL\_MAP1\_NORMAL
[**glIsEnabled**](glisenabled.md) with argument
GL\_MAP1\_TEXTURE\_COORD\_1 [**glIsEnabled**](glisenabled.md) with
argument GL\_MAP1\_TEXTURE\_COORD\_2
[**glIsEnabled**](glisenabled.md) with argument
GL\_MAP1\_TEXTURE\_COORD\_3 [**glIsEnabled**](glisenabled.md) with
argument GL\_MAP1\_TEXTURE\_COORD\_4
[**glIsEnabled**](glisenabled.md) with argument GL\_MAP2\_VERTEX\_3
[**glIsEnabled**](glisenabled.md) with argument GL\_MAP2\_VERTEX\_4
[**glIsEnabled**](glisenabled.md) with argument GL\_MAP2\_INDEX
[**glIsEnabled**](glisenabled.md) with argument GL\_MAP2\_COLOR\_4
[**glIsEnabled**](glisenabled.md) with argument GL\_MAP2\_NORMAL
[**glIsEnabled**](glisenabled.md) with argument
GL\_MAP2\_TEXTURE\_COORD\_1 [**glIsEnabled**](glisenabled.md) with
argument GL\_MAP2\_TEXTURE\_COORD\_2
[**glIsEnabled**](glisenabled.md) with argument
GL\_MAP2\_TEXTURE\_COORD\_3 [**glIsEnabled**](glisenabled.md) with
argument GL\_MAP2\_TEXTURE\_COORD\_4
[**glIsEnabled**](glisenabled.md) with argument GL\_AUTO\_NORMAL


%index
glEvalMesh1
Computes a one-dimensional grid of points or lines.
%group
Win32 opengl32
%prm
mode, i1, i2
mode : [int] A value that specifies whether to compute a one-dimensional mesh of points or lines. The following symbolic constants are accepted: GL\_POINT and GL\_LINE.
i1 : [int] The first integer value for grid domain variable i.
i2 : [int] The last integer value for grid domain variable i.
%inst
Computes a one-dimensional grid of points or lines.

[戻り値]
This function does not return a value.


%index
glEvalMesh2
Computes a two-dimensional grid of points or lines.
%group
Win32 opengl32
%prm
mode, i1, i2, j1, j2
mode : [int] A value that specifies whether to compute a two-dimensional mesh of points, lines, or polygons. The following symbolic constants are accepted: GL\_POINT, GL\_LINE, and GL\_FILL.
i1 : [int] The first integer value for grid domain variable i.
i2 : [int] The last integer value for grid domain variable i.
j1 : [int] The first integer value for grid domain variable j.
j2 : [int] The last integer value for grid domain variable j.
%inst
Computes a two-dimensional grid of points or lines.

[戻り値]
This function does not return a value.


%index
glEvalPoint1
The glEvalPoint1 and glEvalPoint2 functions generate and evaluate a single point in a mesh. | glEvalPoint1 function (Gl.h)
%group
Win32 opengl32
%prm
i
i : [int] The integer value for grid domain variable *i*.
%inst
The glEvalPoint1 and glEvalPoint2 functions generate and evaluate a
single point in a mesh. | glEvalPoint1 function (Gl.h)

[戻り値]
This function does not return a value.

[備考]
The [**glMapGrid**](glmapgrid-functions.md) and
[**glEvalMesh**](glevalmesh-functions.md) functions are used in
tandem to efficiently generate and evaluate a series of evenly spaced
map domain values. You can use **glEvalPoint** to evaluate a single
grid point in the same gridspace that is traversed by **glEvalMesh**.
Calling [**glEvalPoint1**](glevalpoint.md) is equivalent to calling
**glEvalCoord1** (*i* ?*u* +*u*1 ); where ?*u* = (*u*2 *u*1 )/*n* and
*n*, *u*1 , and *u*2 are the arguments to the most recent
**glMapGrid1** function. The one absolute numeric requirement is that
if *i* = *n*, then the value computed from (*i* ?*u* + u1 ) is
exactly *u*2 . In the two-dimensional case, **glEvalPoint2**, let
?*u* = (*u*2 *u*1 )/*n* ?*v* = (*v*2 *v*1 )/*m* where *n*, *u*1 ,
*u*2 , *m*, *v*1 , and *v*2 are the arguments to the most recent
**glMapGrid2** function. Then the **glEvalPoint2** function is
equivalent to calling **glEvalCoord2** (*i* ?*u* + *u*1 , *j* ?*v* +
*v*1 ); The only absolute numeric requirements are that if *i*=*n*,
then the value computed from (*i* ?*u* + *u*1 ) is exactly u2 , and
if *j* = *m*, then the value computed from (*j* ?*v* + *v*1 ) is
exactly *v*2 . The following functions retrieve information relating
to [**glEvalPoint1**](glevalpoint.md) and **glEvalPoint2**:
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_MAP1\_GRID\_DOMAIN **glGet** with argument
GL\_MAP2\_GRID\_DOMAIN **glGet** with argument
GL\_MAP1\_GRID\_SEGMENTS **glGet** with argument
GL\_MAP2\_GRID\_SEGMENTS


%index
glEvalPoint2
The glEvalPoint1 and glEvalPoint2 functions generate and evaluate a single point in a mesh. | glEvalPoint2 function (Gl.h)
%group
Win32 opengl32
%prm
i, j
i : [int] The integer value for grid domain variable *i*.
j : [int] The integer value for grid domain variable *j* .
%inst
The glEvalPoint1 and glEvalPoint2 functions generate and evaluate a
single point in a mesh. | glEvalPoint2 function (Gl.h)

[戻り値]
This function does not return a value.

[備考]
The [**glMapGrid**](glmapgrid-functions.md) and
[**glEvalMesh**](glevalmesh-functions.md) functions are used in
tandem to efficiently generate and evaluate a series of evenly spaced
map domain values. You can use **glEvalPoint** to evaluate a single
grid point in the same gridspace that is traversed by **glEvalMesh**.
Calling [**glEvalPoint1**](glevalpoint.md) is equivalent to calling
**glEvalCoord1** (*i* ?*u* +*u*1 ); where ?*u* = (*u*2 *u*1 )/*n* and
*n*, *u*1 , and *u*2 are the arguments to the most recent
**glMapGrid1** function. The one absolute numeric requirement is that
if *i* = *n*, then the value computed from (*i* ?*u* + u1 ) is
exactly *u*2 . In the two-dimensional case, **glEvalPoint2**, let
?*u* = (*u*2 *u*1 )/*n* ?*v* = (*v*2 *v*1 )/*m* where *n*, *u*1 ,
*u*2 , *m*, *v*1 , and *v*2 are the arguments to the most recent
**glMapGrid2** function. Then the **glEvalPoint2** function is
equivalent to calling **glEvalCoord2** (*i* ?*u* + *u*1 , *j* ?*v* +
*v*1 ); The only absolute numeric requirements are that if *i*=*n*,
then the value computed from (*i* ?*u* + *u*1 ) is exactly u2 , and
if *j* = *m*, then the value computed from (*j* ?*v* + *v*1 ) is
exactly *v*2 . The following functions retrieve information relating
to [**glEvalPoint1**](glevalpoint.md) and **glEvalPoint2**:
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_MAP1\_GRID\_DOMAIN **glGet** with argument
GL\_MAP2\_GRID\_DOMAIN **glGet** with argument
GL\_MAP1\_GRID\_SEGMENTS **glGet** with argument
GL\_MAP2\_GRID\_SEGMENTS


%index
glFeedbackBuffer
The glFeedbackBuffer function controls feedback mode.
%group
Win32 opengl32
%prm
size, type, buffer
size : [int] The maximum number of values that can be written into *buffer*.
type : [int] A symbolic constant that describes the information that will be returned for each vertex. The following symbolic constants are accepted: GL\_2D, GL\_3D, GL\_3D\_COLOR, GL\_3D\_COLOR\_TEXTURE, and GL\_4D\_COLOR\_TEXTURE.
buffer : [var] Returns the feedback data.
%inst
The glFeedbackBuffer function controls feedback mode.

[戻り値]
This function does not return a value.


%index
glFinish
The glFinish function blocks until all OpenGL execution is complete.
%group
Win32 opengl32
%prm

%inst
The glFinish function blocks until all OpenGL execution is complete.

[戻り値]
This function has no parameters.
This function does not return a value.

[備考]
The **glFinish** function does not return until the effects of all
previously called OpenGL functions are complete. Such effects include
all changes to the OpenGL state, all changes to the connection state,
and all changes to the framebuffer contents. The **glFinish**
function requires a round trip to the server.


%index
glFlush
The glFlush function forces execution of OpenGL functions in finite time.
%group
Win32 opengl32
%prm

%inst
The glFlush function forces execution of OpenGL functions in finite
time.

[戻り値]
This function has no parameters.
This function does not return a value.

[備考]
Different OpenGL implementations buffer commands in several different
locations, including network buffers and the graphics accelerator
itself. The **glFlush** function empties all these buffers, causing
all issued commands to be executed as quickly as they are accepted by
the actual rendering engine. Though this execution may not be
completed in any particular time period, it does complete in a finite
amount of time. Because any OpenGL program might be executed over a
network, or on an accelerator that buffers commands, be sure to call
**glFlush** in any programs requiring that all of their previously
issued commands have been completed. For example, call **glFlush**
before waiting for user input that depends on the generated image.
The **glFlush** function can return at any time. It does not wait
until the execution of all previously issued OpenGL functions is
complete.


%index
glFogf
The glFogf and function specifies fog parameters.
%group
Win32 opengl32
%prm
pname, param1
pname : [int] Specifies a single-valued fog parameter. Accepts one of the following values.
param1 : [float] 
%inst
The glFogf and function specifies fog parameters.

[戻り値]
This function does not return a value.

[備考]
You enable and disable fog with [**glEnable**](glenable.md) and
[**glDisable**](gldisable.md), using the argument GL\_FOG. While
enabled, fog affects rasterized geometry, bitmaps, and pixel blocks,
but not buffer-clear operations. The **glFogf** function assigns the
value or values in *params* to the fog parameter specified by
*pname*. Fog blends a fog color with each rasterized pixel fragment's
posttexturing color using a blending factor *f*. Factor *f* is
computed in one of three ways, depending on the fog mode. Let *z* be
the distance in eye coordinates from the origin to the fragment being
fogged. The equation for GL\_LINEAR fog is: ![Equation showing the
value of GL_LINEAR fog.](images/fog01.png) The equation for GL\_EXP
fog is: ![Equation showing the value of the blending factor in GL_EXP
fog mode.](images/fog02.png) The equation for GL\_EXP2 fog is:
![Equation showing the value of the blending factor in GL_EXP2 fog
mode.](images/fog03.png) Regardless of the fog mode, *f* is clamped
to the range \[0,1\] after it is computed. Then, if OpenGL is in RGBA
color mode, the fragment's color *C*r is replaced by ![Equation
showing the fogged fragment's color as a function of blending factor
and fog color.](images/fog04.png) In color-index mode, the fragment's
color index *i*r is replaced by ![Equation showing the fogged
fragment's color index as a function of blending factor and indexed
color.](images/fog05.png) The following functions retrieve
information related to the **glFog** functions:
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_FOG\_COLOR **glGet** with argument GL\_FOG\_INDEX
**glGet** with argument GL\_FOG\_DENSITY **glGet** with argument
GL\_FOG\_START **glGet** with argument GL\_FOG\_END **glGet** with
argument GL\_FOG\_MODE [**glIsEnabled**](glisenabled.md) with
argument GL\_FOG


%index
glFogfv
The glFogfv function specifies fog parameters. | glFogfv function (Gl.h)
%group
Win32 opengl32
%prm
pname, params
pname : [int] Specifies a fog parameter. Accepts one of the following values.
params : [int] 
%inst
The glFogfv function specifies fog parameters. | glFogfv function
(Gl.h)

[戻り値]
This function does not return a value.

[備考]
You enable and disable fog with [**glEnable**](glenable.md) and
[**glDisable**](gldisable.md), using the argument GL\_FOG. While
enabled, fog affects rasterized geometry, bitmaps, and pixel blocks,
but not buffer-clear operations. The **glFogfv** function assigns the
value or values in *params* to the fog parameter specified by
*pname*. Fog blends a fog color with each rasterized pixel fragment's
posttexturing color using a blending factor *f*. Factor *f* is
computed in one of three ways, depending on the fog mode. Let *z* be
the distance in eye coordinates from the origin to the fragment being
fogged. The equation for GL\_LINEAR fog is: ![Equation showing the
value of GL_LINEAR fog.](images/fog01.png) The equation for GL\_EXP
fog is: ![Equation showing the value of the blending factor in GL_EXP
fog mode.](images/fog02.png) The equation for GL\_EXP2 fog is:
![Equation showing the value of the blending factor in GL_EXP2 fog
mode.](images/fog03.png) Regardless of the fog mode, *f* is clamped
to the range \[0,1\] after it is computed. Then, if OpenGL is in RGBA
color mode, the fragment's color *C*r is replaced by ![Equation
showing the fogged fragment's color as a function of blending factor
and fog color.](images/fog04.png) In color-index mode, the fragment's
color index *i*r is replaced by ![Equation showing the fogged
fragment's color index as a function of blending factor and indexed
color.](images/fog05.png) The following functions retrieve
information related to the **glFog** functions:
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_FOG\_COLOR **glGet** with argument GL\_FOG\_INDEX
**glGet** with argument GL\_FOG\_DENSITY **glGet** with argument
GL\_FOG\_START **glGet** with argument GL\_FOG\_END **glGet** with
argument GL\_FOG\_MODE [**glIsEnabled**](glisenabled.md) with
argument GL\_FOG


%index
glFogi
The glFogi function specifies fog parameters.
%group
Win32 opengl32
%prm
pname, param1
pname : [int] Specifies a single-valued fog parameter. Accepts one of the following values.
param1 : [int] 
%inst
The glFogi function specifies fog parameters.

[戻り値]
This function does not return a value.

[備考]
You enable and disable fog with [**glEnable**](glenable.md) and
[**glDisable**](gldisable.md), using the argument GL\_FOG. While
enabled, fog affects rasterized geometry, bitmaps, and pixel blocks,
but not buffer-clear operations. The **glFogi** function assigns the
value or values in *params* to the fog parameter specified by
*pname*. Fog blends a fog color with each rasterized pixel fragment's
posttexturing color using a blending factor *f*. Factor *f* is
computed in one of three ways, depending on the fog mode. Let *z* be
the distance in eye coordinates from the origin to the fragment being
fogged. The equation for GL\_LINEAR fog is: ![Equation showing the
value of GL_LINEAR fog.](images/fog01.png) The equation for GL\_EXP
fog is: ![Equation showing the value of the blending factor in GL_EXP
fog mode.](images/fog02.png) The equation for GL\_EXP2 fog is:
![Equation showing the value of the blending factor in GL_EXP2 fog
mode.](images/fog03.png) Regardless of the fog mode, *f* is clamped
to the range \[0,1\] after it is computed. Then, if OpenGL is in RGBA
color mode, the fragment's color *C*r is replaced by ![Equation
showing the fogged fragment's color as a function of blending factor
and fog color.](images/fog04.png) In color-index mode, the fragment's
color index *i*r is replaced by ![Equation showing the fogged
fragment's color index as a function of blending factor and indexed
color.](images/fog05.png) The following functions retrieve
information related to the **glFog** functions:
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_FOG\_COLOR **glGet** with argument GL\_FOG\_INDEX
**glGet** with argument GL\_FOG\_DENSITY **glGet** with argument
GL\_FOG\_START **glGet** with argument GL\_FOG\_END **glGet** with
argument GL\_FOG\_MODE [**glIsEnabled**](glisenabled.md) with
argument GL\_FOG


%index
glFogiv
The glFogiv function specifies fog parameters. | glFogiv function (Gl.h)
%group
Win32 opengl32
%prm
pname, params
pname : [int] Specifies a fog parameter. Accepts one of the following values.
params : [int] 
%inst
The glFogiv function specifies fog parameters. | glFogiv function
(Gl.h)

[戻り値]
This function does not return a value.

[備考]
You enable and disable fog with [**glEnable**](glenable.md) and
[**glDisable**](gldisable.md), using the argument GL\_FOG. While
enabled, fog affects rasterized geometry, bitmaps, and pixel blocks,
but not buffer-clear operations. The **glFogiv** function assigns the
value or values in *params* to the fog parameter specified by
*pname*. Fog blends a fog color with each rasterized pixel fragment's
posttexturing color using a blending factor *f*. Factor *f* is
computed in one of three ways, depending on the fog mode. Let *z* be
the distance in eye coordinates from the origin to the fragment being
fogged. The equation for GL\_LINEAR fog is: ![Equation showing the
value of the blending factor in GL_LINEAR fog mode as a function of
distance.](images/fog01.png) The equation for GL\_EXP fog is:
![Equation showing the value of the blending factor in GL_EXP fog
mode.](images/fog02.png) The equation for GL\_EXP2 fog is: ![Equation
showing the value of the blending factor in GL_EXP2 fog
mode.](images/fog03.png) Regardless of the fog mode, *f* is clamped
to the range \[0,1\] after it is computed. Then, if OpenGL is in RGBA
color mode, the fragment's color *C*r is replaced by ![Equation
showing the fogged fragment's color as a function of blending factor
and fog color.](images/fog04.png) In color-index mode, the fragment's
color index *i*r is replaced by ![Equation showing the fogged
fragment's color index as a function of blending factor and indexed
color.](images/fog05.png) The following functions retrieve
information related to the **glFog** functions:
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_FOG\_COLOR **glGet** with argument GL\_FOG\_INDEX
**glGet** with argument GL\_FOG\_DENSITY **glGet** with argument
GL\_FOG\_START **glGet** with argument GL\_FOG\_END **glGet** with
argument GL\_FOG\_MODE [**glIsEnabled**](glisenabled.md) with
argument GL\_FOG


%index
glFrontFace
The glFrontFace function defines front-facing and back-facing polygons.
%group
Win32 opengl32
%prm
mode
mode : [int] The orientation of front-facing polygons. GL\_CW and GL\_CCW are accepted. The default value is GL\_CCW.
%inst
The glFrontFace function defines front-facing and back-facing
polygons.

[戻り値]
This function does not return a value.

[備考]
In a scene composed entirely of opaque closed surfaces, back-facing
polygons are never visible. Eliminating these invisible polygons has
the obvious benefit of speeding up the rendering of the image. You
enable and disable elimination of back-facing polygons with
[**glEnable**](glenable.md) and [**glDisable**](gldisable.md) using
argument GL\_CULL\_FACE. The projection of a polygon to window
coordinates is said to have clockwise winding if an imaginary object
following the path from its first vertex, its second vertex, and so
on, to its last vertex, and finally back to its first vertex, moves
in a clockwise direction about the interior of the polygon. The
polygon's winding is said to be counterclockwise if the imaginary
object following the same path moves in a counterclockwise direction
about the interior of the polygon. The **glFrontFace** function
specifies whether polygons with clockwise winding in window
coordinates, or counterclockwise winding in window coordinates, are
taken to be front-facing. Passing GL\_CCW to *mode* selects
counterclockwise polygons as front-facing; GL\_CW selects clockwise
polygons as front-facing. By default, counterclockwise polygons are
taken to be front-facing. The following function retrieves
information about **glFrontface**:
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_FRONT\_FACE


%index
glFrustum
The glFrustum function multiplies the current matrix by a perspective matrix.
%group
Win32 opengl32
%prm
left, right, bottom, top, zNear, zFar
left : [double] The coordinate for the left-vertical clipping plane.
right : [double] The coordinate for the right-vertical clipping plane.
bottom : [double] The coordinate for the bottom-horizontal clipping plane.
top : [double] The coordinate for the bottom-horizontal clipping plane.
zNear : [double] The distances to the near-depth clipping plane. Must be positive.
zFar : [double] The distances to the far-depth clipping planes. Must be positive.
%inst
The glFrustum function multiplies the current matrix by a perspective
matrix.

[戻り値]
This function does not return a value.

[備考]
The **glFrustum** function describes a perspective matrix that
produces a perspective projection. The (*left*, *bottom*, *zNear*)
and (*right*, *top*, *zNear*) parameters specify the points on the
near clipping plane that are mapped to the lower-left and upper-right
corners of the window, respectively, assuming that the eye is located
at (0,0,0). The *zFar* parameter specifies the location of the far
clipping plane. Both *zNear* and *zFar* must be positive. The
corresponding matrix is shown in the following image. ![Diagram
showing the perspective matrix that produces a perspective
projection.](images/frust01.png)![Equations showing the glFrustum
function that describes a perspective matrix.](images/frust02.png)
The **glFrustum** function multiplies the current matrix by this
matrix, with the result replacing the current matrix. That is, if M
is the current matrix and F is the frustum perspective matrix, then
**glFrustum** replaces M with M F. Use
[**glPushMatrix**](glpushmatrix.md) and
[**glPopMatrix**](glpopmatrix.md) to save and restore the current
matrix stack. Depth-buffer precision is affected by the values
specified for *zNear* and *zFar*. The greater the ratio of *zFar* to
*zNear* is, the less effective the depth buffer will be at
distinguishing between surfaces that are near each other. If
![Equation showing the ratio of far to near.](images/frust03.png)
roughly *log*2 (*r*) bits of depth buffer precision are lost. Because
*r* approaches infinity as *zNear* approaches zero, you should never
set *zNear* to zero. The following functions retrieve information
about **glFrustum**:
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_MATRIX\_MODE **glGet** with argument
GL\_MODELVIEW\_MATRIX **glGet** with argument GL\_PROJECTION\_MATRIX
**glGet** with argument GL\_TEXTURE\_MATRIX


%index
glGenLists
The glGenLists function generates a contiguous set of empty display lists.
%group
Win32 opengl32
%prm
range
range : [int] The number of contiguous empty display lists to be generated.
%inst
The glGenLists function generates a contiguous set of empty display
lists.

[備考]
The **glGenLists** function has one argument, *range*. It returns an
integer *n* such that *range* contiguous empty display lists, named
*n*, *n* + 1, . . ., *n* + (*range* - 1), are created. If *range* is
zero, if there is no group of *range* contiguous names available, or
if any error is generated, then no display lists are generated and
zero is returned. The following function retrieves information
related to **glGenLists**: [**glIsList**](glislist.md)


%index
glGenTextures
The glGenTextures function generates texture names.
%group
Win32 opengl32
%prm
n, textures
n : [int] The number of texture names to be generated.
textures : [var] A pointer to the first element of an array in which the generated texture names are stored.
%inst
The glGenTextures function generates texture names.

[戻り値]
This function does not return a value.

[備考]
The **glGenTextures** function returns *n* texture names in the
*textures* parameter. The texture names are not necessarily a
contiguous set of integers, however, none of the returned names can
have been in use immediately prior to calling the **glGenTextures**
function. The generated textures assume the dimensionality of the
texture target to which they are first bound with the
[**glBindTexture**](glbindtexture.md) function. Texture names
returned by **glGenTextures** are not returned by subsequent calls to
**glGenTextures** unless they are first deleted by calling
[**glDeleteTextures**](gldeletetextures.md). You cannot include
**glGenTextures** in display lists. > [!Note] > The **glGenTextures**
function is only available in OpenGL version 1.1 or later.
The following function retrieves information related to
**glGenTextures**: - [**glIsTexture**](glistexture.md)


%index
glGetBooleanv
The glGetBooleanv function returns the value or values of a selected parameter.
%group
Win32 opengl32
%prm
pname, params
pname : [int] The parameter value to be returned. The following symbolic constants are accepted.
params : [int] 
%inst
The glGetBooleanv function returns the value or values of a selected
parameter.

[戻り値]
This function does not return a value.

[備考]
This function returns values for simple state variables in OpenGL.
The *pname* parameter is a symbolic constant indicating the state
variable to be returned, and *params* is a pointer to an array of the
indicated type in which to place the returned data. Type conversion
is performed if *params* has a different type from the state variable
value being requested. If you call **glGetBooleanv**, a
floating-point or integer value is converted to GL\_FALSE if and only
if it is zero. Otherwise, it is converted to GL\_TRUE. If you call
[**glGetIntegerv**](glgetintegerv.md), Boolean values are returned as
GL\_TRUE or GL\_FALSE, and most floating-point values are rounded to
the nearest integer value. Floating-point colors and normals,
however, are returned with a linear mapping that maps 1.0 to the most
positive representable integer value and 1.0 to the most negative
representable integer value. If you call
[**glGetFloatv**](glgetfloatv.md) or
[**glGetDoublev**](glgetdoublev.md), Boolean values are returned as
GL\_TRUE or GL\_FALSE, and integer values are converted to
floating-point values. You can query many of the Boolean parameters
more easily with [**glIsEnabled**](glisenabled.md).


%index
glGetClipPlane
The glGetClipPlane function returns the coefficients of the specified clipping plane.
%group
Win32 opengl32
%prm
plane, equation
plane : [int] A clipping plane. The number of clipping planes depends on the implementation, but at least six clipping planes are supported. They are identified by symbolic names of the form GL\_CLIP\_PLANE *i* where 0 = *i* < GL\_MAX\_CLIP\_PLANES.
equation : [var] Returns four double-precision values that are the coefficients of the plane equation of *plane* in eye coordinates.
%inst
The glGetClipPlane function returns the coefficients of the specified
clipping plane.

[戻り値]
This function does not return a value.

[備考]
The **glGetClipPlane** function returns in *equation* the four
coefficients of the plane equation for *plane*. It is always the case
that GL\_CLIP\_PLANE*i* = GL\_CLIP\_PLANE0 + *i*. If an error is
generated, no change is made to the contents of *equation*.


%index
glGetDoublev
The glGetDoublev function returns the value or values of a selected parameter.
%group
Win32 opengl32
%prm
pname, params
pname : [int] The parameter value to be returned. The following symbolic constants are accepted.
params : [int] 
%inst
The glGetDoublev function returns the value or values of a selected
parameter.

[戻り値]
This function does not return a value.

[備考]
This function returns values for simple state variables in OpenGL.
The *pname* parameter is a symbolic constant indicating the state
variable to be returned, and *params* is a pointer to an array of the
indicated type in which to place the returned data. Type conversion
is performed if *params* has a different type from the state variable
value being requested. If you call
[**glGetBooleanv**](glgetbooleanv.md), a floating-point or integer
value is converted to GL\_FALSE if and only if it is zero. Otherwise,
it is converted to GL\_TRUE. If you call
[**glGetIntegerv**](glgetintegerv.md), Boolean values are returned as
GL\_TRUE or GL\_FALSE, and most floating-point values are rounded to
the nearest integer value. Floating-point colors and normals,
however, are returned with a linear mapping that maps 1.0 to the most
positive representable integer value and 1.0 to the most negative
representable integer value. If you call
[**glGetFloatv**](glgetfloatv.md) or **glGetDoublev**, Boolean values
are returned as GL\_TRUE or GL\_FALSE, and integer values are
converted to floating-point values. You can query many of the Boolean
parameters more easily with [**glIsEnabled**](glisenabled.md).


%index
glGetError
The glGetError function returns error information.
%group
Win32 opengl32
%prm

%inst
The glGetError function returns error information.

[戻り値]
This function has no parameters.
The **glGetError** function returns one of the following error codes.
| Return code | Description |
|-------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **GL\_INVALID\_ENUM** | An unacceptable value is specified for an
enumerated argument. The offending function is ignored, having no
side effect other than to set the error flag. | |
**GL\_INVALID\_VALUE** | A numeric argument is out of range. The
offending function is ignored, having no side effect other than to
set the error flag. | | **GL\_INVALID\_OPERATION** | The specified
operation is not allowed in the current state. The offending function
is ignored, having no side effect other than to set the error flag. |
| **GL\_NO\_ERROR** | No error has been recorded. The value of this
symbolic constant is guaranteed to be zero. | |
**GL\_STACK\_OVERFLOW** | This function would cause a stack overflow.
The offending function is ignored, having no side effect other than
to set the error flag. | | **GL\_STACK\_UNDERFLOW** | This function
would cause a stack underflow. The offending function is ignored,
having no side effect other than to set the error flag. | |
**GL\_OUT\_OF\_MEMORY** | There is not enough memory left to execute
the function. The state of OpenGL is undefined, except for the state
of the error flags, after this error is recorded. |
Note that **glGetError** returns GL\_INVALID\_OPERATION if it is
called between a call to [**glBegin**](glbegin.md) and its
corresponding call to [**glEnd**](glend.md).

[備考]
Each detectable error is assigned a numeric code and symbolic name.
When an error occurs, the error flag is set to the appropriate error
code value. No other errors are recorded until **glGetError** is
called, the error code is returned, and the flag is reset to
GL\_NO\_ERROR. If a call to **glGetError** returns GL\_NO\_ERROR,
there has been no detectable error since the last call to
**glGetError**, or since OpenGL was initialized. To allow for
distributed implementations, there may be several error flags. If any
single error flag has recorded an error, the value of that flag is
returned and that flag is reset to GL\_NO\_ERROR when **glGetError**
is called. If more than one flag has recorded an error,
**glGetError** returns and clears an arbitrary error flag value. If
all error flags are to be reset, you should always call
**glGetError** in a loop until it returns GL\_NO\_ERROR. Initially,
all error flags are set to GL\_NO\_ERROR. When an error flag is set,
results of an OpenGL operation are undefined only if
GL\_OUT\_OF\_MEMORY has occurred. In all other cases, the function
generating the error is ignored and has no effect on the OpenGL state
or framebuffer contents.


%index
glGetFloatv
The glGetFloatv function returns the value or values of a selected parameter.
%group
Win32 opengl32
%prm
pname, params
pname : [int] The parameter value to be returned. The following symbolic constants are accepted.
params : [int] 
%inst
The glGetFloatv function returns the value or values of a selected
parameter.

[戻り値]
This function does not return a value.

[備考]
This function returns values for simple state variables in OpenGL.
The *pname* parameter is a symbolic constant indicating the state
variable to be returned, and *params* is a pointer to an array of the
indicated type in which to place the returned data. Type conversion
is performed if *params* has a different type from the state variable
value being requested. If you call
[**glGetBooleanv**](glgetbooleanv.md), a floating-point or integer
value is converted to GL\_FALSE if and only if it is zero. Otherwise,
it is converted to GL\_TRUE. If you call
[**glGetIntegerv**](glgetintegerv.md), Boolean values are returned as
GL\_TRUE or GL\_FALSE, and most floating-point values are rounded to
the nearest integer value. Floating-point colors and normals,
however, are returned with a linear mapping that maps 1.0 to the most
positive representable integer value and 1.0 to the most negative
representable integer value. If you call **glGetFloatv** or
[**glGetDoublev**](glgetdoublev.md), Boolean values are returned as
GL\_TRUE or GL\_FALSE, and integer values are converted to
floating-point values. You can query many of the Boolean parameters
more easily with [**glIsEnabled**](glisenabled.md).


%index
glGetIntegerv
The glGetIntegerv function returns the value or values of a selected parameter.
%group
Win32 opengl32
%prm
pname, params
pname : [int] The parameter value to be returned. The following symbolic constants are accepted.
params : [int] 
%inst
The glGetIntegerv function returns the value or values of a selected
parameter.

[戻り値]
This function does not return a value.

[備考]
This function returns values for simple state variables in OpenGL.
The *pname* parameter is a symbolic constant indicating the state
variable to be returned, and *params* is a pointer to an array of the
indicated type in which to place the returned data. Type conversion
is performed if *params* has a different type from the state variable
value being requested. If you call
[**glGetBooleanv**](glgetbooleanv.md), a floating-point or integer
value is converted to GL\_FALSE if and only if it is zero. Otherwise,
it is converted to GL\_TRUE. If you call **glGetIntegerv**, Boolean
values are returned as GL\_TRUE or GL\_FALSE, and most floating-point
values are rounded to the nearest integer value. Floating-point
colors and normals, however, are returned with a linear mapping that
maps 1.0 to the most positive representable integer value and 1.0 to
the most negative representable integer value. If you call
[**glGetFloatv**](glgetfloatv.md) or
[**glGetDoublev**](glgetdoublev.md), Boolean values are returned as
GL\_TRUE or GL\_FALSE, and integer values are converted to
floating-point values. You can query many of the Boolean parameters
more easily with [**glIsEnabled**](glisenabled.md).


%index
glGetLightfv
The glGetLightfv and glGetLightiv functions return light source parameter values. | glGetLightfv function (Gl.h)
%group
Win32 opengl32
%prm
light, pname, params
light : [int] A light source. The number of possible lights depends on the implementation, but at least eight lights are supported. They are identified by symbolic names of the form GL\_LIGHT *i* where 0 = *i* < GL\_MAX\_LIGHTS.
pname : [int] A light source parameter for *light*. The following symbolic names are accepted.
params : [int] 
%inst
The glGetLightfv and glGetLightiv functions return light source
parameter values. | glGetLightfv function (Gl.h)

[戻り値]
This function does not return a value.


%index
glGetLightiv
The glGetLightfv and glGetLightiv functions return light source parameter values. | glGetLightiv function (Gl.h)
%group
Win32 opengl32
%prm
light, pname, params
light : [int] A light source. The number of possible lights depends on the implementation, but at least eight lights are supported. They are identified by symbolic names of the form GL\_LIGHT *i* where 0 = *i* < GL\_MAX\_LIGHTS.
pname : [int] A light source parameter for *light*. The following symbolic names are accepted.
params : [int] 
%inst
The glGetLightfv and glGetLightiv functions return light source
parameter values. | glGetLightiv function (Gl.h)

[戻り値]
This function does not return a value.


%index
glGetMapdv
The glGetMapdv, glGetMapfv, and glGetMapiv functions return evaluator parameters. | glGetMapdv function (Gl.h)
%group
Win32 opengl32
%prm
target, query, v
target : [int] The symbolic name of a map. The following are accepted values: GL\_MAP1\_COLOR\_4, GL\_MAP1\_INDEX, GL\_MAP1\_NORMAL, GL\_MAP1\_TEXTURE\_COORD\_1, GL\_MAP1\_TEXTURE\_COORD\_2, GL\_MAP1\_TEXTURE\_COORD\_3, GL\_MAP1\_TEXTURE\_COORD\_4, GL\_MAP1\_VERTEX\_3, GL\_MAP1\_VERTEX\_4, GL\_MAP2\_COLOR\_4, GL\_MAP2\_INDEX, GL\_MAP2\_NORMAL, GL\_MAP2\_TEXTURE\_COORD\_1, GL\_MAP2\_TEXTURE\_COORD\_2, GL\_MAP2\_TEXTURE\_COORD\_3, GL\_MAP2\_TEXTURE\_COORD\_4, GL\_MAP2\_VERTEX\_3, and GL\_MAP2\_VERTEX\_4.
query : [int] Specifies which parameter to return. The following symbolic names are accepted.
v : [var] Returns the requested data.
%inst
The glGetMapdv, glGetMapfv, and glGetMapiv functions return evaluator
parameters. | glGetMapdv function (Gl.h)

[戻り値]
This function does not return a value.

[備考]
The **glGetMap** function returns evaluator parameters. (The
**glMap1** and **glMap2** functions define evaluators.) The *target*
parameter specifies a map, *query* selects a specific parameter, and
*v* points to storage where the values will be returned. The
acceptable values for the *target* parameter are described in
[**glMap1**](glmap1.md) and [**glMap2**](glmap2.md). If an error is
generated, no change is made to the contents of *v*.


%index
glGetMapfv
The glGetMapdv, glGetMapfv, and glGetMapiv functions return evaluator parameters. | glGetMapfv function (Gl.h)
%group
Win32 opengl32
%prm
target, query, v
target : [int] The symbolic name of a map. The following are accepted values: GL\_MAP1\_COLOR\_4, GL\_MAP1\_INDEX, GL\_MAP1\_NORMAL, GL\_MAP1\_TEXTURE\_COORD\_1, GL\_MAP1\_TEXTURE\_COORD\_2, GL\_MAP1\_TEXTURE\_COORD\_3, GL\_MAP1\_TEXTURE\_COORD\_4, GL\_MAP1\_VERTEX\_3, GL\_MAP1\_VERTEX\_4, GL\_MAP2\_COLOR\_4, GL\_MAP2\_INDEX, GL\_MAP2\_NORMAL, GL\_MAP2\_TEXTURE\_COORD\_1, GL\_MAP2\_TEXTURE\_COORD\_2, GL\_MAP2\_TEXTURE\_COORD\_3, GL\_MAP2\_TEXTURE\_COORD\_4, GL\_MAP2\_VERTEX\_3, and GL\_MAP2\_VERTEX\_4.
query : [int] Specifies which parameter to return. The following symbolic names are accepted.
v : [var] Returns the requested data.
%inst
The glGetMapdv, glGetMapfv, and glGetMapiv functions return evaluator
parameters. | glGetMapfv function (Gl.h)

[戻り値]
This function does not return a value.

[備考]
The **glGetMap** function returns evaluator parameters. (The
**glMap1** and **glMap2** functions define evaluators.) The *target*
parameter specifies a map, *query* selects a specific parameter, and
*v* points to storage where the values will be returned. The
acceptable values for the *target* parameter are described in
[**glMap1**](glmap1.md) and [**glMap2**](glmap2.md). If an error is
generated, no change is made to the contents of *v*.


%index
glGetMapiv
The glGetMapdv, glGetMapfv, and glGetMapiv functions return evaluator parameters. | glGetMapiv function (Gl.h)
%group
Win32 opengl32
%prm
target, query, v
target : [int] The symbolic name of a map. The following are accepted values: GL\_MAP1\_COLOR\_4, GL\_MAP1\_INDEX, GL\_MAP1\_NORMAL, GL\_MAP1\_TEXTURE\_COORD\_1, GL\_MAP1\_TEXTURE\_COORD\_2, GL\_MAP1\_TEXTURE\_COORD\_3, GL\_MAP1\_TEXTURE\_COORD\_4, GL\_MAP1\_VERTEX\_3, GL\_MAP1\_VERTEX\_4, GL\_MAP2\_COLOR\_4, GL\_MAP2\_INDEX, GL\_MAP2\_NORMAL, GL\_MAP2\_TEXTURE\_COORD\_1, GL\_MAP2\_TEXTURE\_COORD\_2, GL\_MAP2\_TEXTURE\_COORD\_3, GL\_MAP2\_TEXTURE\_COORD\_4, GL\_MAP2\_VERTEX\_3, and GL\_MAP2\_VERTEX\_4.
query : [int] Specifies which parameter to return. The following symbolic names are accepted.
v : [var] Returns the requested data.
%inst
The glGetMapdv, glGetMapfv, and glGetMapiv functions return evaluator
parameters. | glGetMapiv function (Gl.h)

[戻り値]
This function does not return a value.

[備考]
The **glGetMap** functions return evaluator parameters. (The
**glMap1** and **glMap2** functions define evaluators.) The *target*
parameter specifies a map, *query* selects a specific parameter, and
*v* points to storage where the values will be returned. The
acceptable values for the *target* parameter are described in
[**glMap1**](glmap1.md) and [**glMap2**](glmap2.md). If an error is
generated, no change is made to the contents of *v*.


%index
glGetMaterialfv
The glGetMaterialfv and glGetMaterialiv functions return material parameters. | glGetMaterialfv function (Gl.h)
%group
Win32 opengl32
%prm
face, pname, params
face : [int] Specifies which of the two materials is being queried. GL\_FRONT or GL\_BACK are accepted, representing the front and back materials, respectively.
pname : [int] The material parameter to return. The following values are accepted.
params : [int] 
%inst
The glGetMaterialfv and glGetMaterialiv functions return material
parameters. | glGetMaterialfv function (Gl.h)

[戻り値]
This function does not return a value.

[備考]
The **glGetMaterial** function returns in *params* the value or
values of parameter *pname* of material *face*. If an error is
generated, no change is made to the contents of *params*.


%index
glGetMaterialiv
The glGetMaterialfv and glGetMaterialiv functions return material parameters. | glGetMaterialiv function (Gl.h)
%group
Win32 opengl32
%prm
face, pname, params
face : [int] Specifies which of the two materials is being queried. GL\_FRONT or GL\_BACK are accepted, representing the front and back materials, respectively.
pname : [int] The material parameter to return. The following values are accepted.
params : [int] 
%inst
The glGetMaterialfv and glGetMaterialiv functions return material
parameters. | glGetMaterialiv function (Gl.h)

[戻り値]
This function does not return a value.

[備考]
The **glGetMaterial** function returns in *params* the value or
values of parameter *pname* of material *face*. If an error is
generated, no change is made to the contents of *params*.


%index
glGetPixelMapfv
The glGetPixelMapfv, glGetPixelMapuiv, and glGetPixelMapusv functions return the specified pixel map. | glGetPixelMapfv function (Gl.h)
%group
Win32 opengl32
%prm
map, values
map : [int] The name of the pixel map to return. Accepted values are GL\_PIXEL\_MAP\_I\_TO\_I, GL\_PIXEL\_MAP\_S\_TO\_S, GL\_PIXEL\_MAP\_I\_TO\_R, GL\_PIXEL\_MAP\_I\_TO\_G, GL\_PIXEL\_MAP\_I\_TO\_B, GL\_PIXEL\_MAP\_I\_TO\_A, GL\_PIXEL\_MAP\_R\_TO\_R, GL\_PIXEL\_MAP\_G\_TO\_G, GL\_PIXEL\_MAP\_B\_TO\_B, and GL\_PIXEL\_MAP\_A\_TO\_A.
values : [var] Returns the pixel map contents.
%inst
The glGetPixelMapfv, glGetPixelMapuiv, and glGetPixelMapusv functions
return the specified pixel map. | glGetPixelMapfv function (Gl.h)

[戻り値]
This function does not return a value.

[備考]
See [**glPixelMap**](glpixelmap.md) for a description of the
acceptable values for the *map* parameter. The **glGetPixelMap**
function returns in *values* the contents of the pixel map specified
in *map*. Use pixel maps during the execution of
[**glReadPixels**](glreadpixels.md),
[**glDrawPixels**](gldrawpixels.md),
[**glCopyPixels**](glcopypixels.md),
[**glTexImage1D**](glteximage1d.md), and
[**glTexImage2D**](glteximage2d.md) to map color indexes, stencil
indexes, color components, and depth components to other values.
Unsigned integer values, if requested, are linearly mapped from the
internal fixed or floating-point representation such that 1.0 maps to
the largest representable integer value, and 0.0 maps to zero. Return
unsigned integer values are undefined if the map value was not in the
range \[0,1\]. To determine the required size of *map*, call
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with the appropriate symbolic constant. If an error is generated, no
change is made to the contents of *values*. The following functions
retrieve information related to **glGetPixelMap**:
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_PIXEL\_MAP\_I\_TO\_I\_SIZE **glGet** with argument
GL\_PIXEL\_MAP\_S\_TO\_S\_SIZE **glGet** with argument
GL\_PIXEL\_MAP\_I\_TO\_R\_SIZE **glGet** with argument
GL\_PIXEL\_MAP\_I\_TO\_G\_SIZE **glGet** with argument
GL\_PIXEL\_MAP\_I\_TO\_B\_SIZE **glGet** with argument
GL\_PIXEL\_MAP\_I\_TO\_A\_SIZE **glGet** with argument
GL\_PIXEL\_MAP\_R\_TO\_R\_SIZE **glGet** with argument
GL\_PIXEL\_MAP\_G\_TO\_G\_SIZE **glGet** with argument
GL\_PIXEL\_MAP\_B\_TO\_B\_SIZE **glGet** with argument
GL\_PIXEL\_MAP\_A\_TO\_A\_SIZE **glGet** with argument
GL\_MAX\_PIXEL\_MAP\_TABLE


%index
glGetPixelMapuiv
The glGetPixelMapfv, glGetPixelMapuiv, and glGetPixelMapusv functions return the specified pixel map. | glGetPixelMapuiv function (Gl.h)
%group
Win32 opengl32
%prm
map, values
map : [int] The name of the pixel map to return. Accepted values are GL\_PIXEL\_MAP\_I\_TO\_I, GL\_PIXEL\_MAP\_S\_TO\_S, GL\_PIXEL\_MAP\_I\_TO\_R, GL\_PIXEL\_MAP\_I\_TO\_G, GL\_PIXEL\_MAP\_I\_TO\_B, GL\_PIXEL\_MAP\_I\_TO\_A, GL\_PIXEL\_MAP\_R\_TO\_R, GL\_PIXEL\_MAP\_G\_TO\_G, GL\_PIXEL\_MAP\_B\_TO\_B, and GL\_PIXEL\_MAP\_A\_TO\_A.
values : [var] Returns the pixel map contents.
%inst
The glGetPixelMapfv, glGetPixelMapuiv, and glGetPixelMapusv functions
return the specified pixel map. | glGetPixelMapuiv function (Gl.h)

[戻り値]
This function does not return a value.

[備考]
See [**glPixelMap**](glpixelmap.md) for a description of the
acceptable values for the *map* parameter. The **glGetPixelMap**
function returns in *values* the contents of the pixel map specified
in *map*. Use pixel maps during the execution of
[**glReadPixels**](glreadpixels.md),
[**glDrawPixels**](gldrawpixels.md),
[**glCopyPixels**](glcopypixels.md),
[**glTexImage1D**](glteximage1d.md), and
[**glTexImage2D**](glteximage2d.md) to map color indexes, stencil
indexes, color components, and depth components to other values.
Unsigned integer values, if requested, are linearly mapped from the
internal fixed or floating-point representation such that 1.0 maps to
the largest representable integer value, and 0.0 maps to zero. Return
unsigned integer values are undefined if the map value was not in the
range \[0,1\]. To determine the required size of *map*, call
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with the appropriate symbolic constant. If an error is generated, no
change is made to the contents of *values*. The following functions
retrieve information related to **glGetPixelMap**:
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_PIXEL\_MAP\_I\_TO\_I\_SIZE **glGet** with argument
GL\_PIXEL\_MAP\_S\_TO\_S\_SIZE **glGet** with argument
GL\_PIXEL\_MAP\_I\_TO\_R\_SIZE **glGet** with argument
GL\_PIXEL\_MAP\_I\_TO\_G\_SIZE **glGet** with argument
GL\_PIXEL\_MAP\_I\_TO\_B\_SIZE **glGet** with argument
GL\_PIXEL\_MAP\_I\_TO\_A\_SIZE **glGet** with argument
GL\_PIXEL\_MAP\_R\_TO\_R\_SIZE **glGet** with argument
GL\_PIXEL\_MAP\_G\_TO\_G\_SIZE **glGet** with argument
GL\_PIXEL\_MAP\_B\_TO\_B\_SIZE **glGet** with argument
GL\_PIXEL\_MAP\_A\_TO\_A\_SIZE **glGet** with argument
GL\_MAX\_PIXEL\_MAP\_TABLE


%index
glGetPixelMapusv
The glGetPixelMapfv, glGetPixelMapuiv, and glGetPixelMapusv functions return the specified pixel map. | glGetPixelMapusv function (Gl.h)
%group
Win32 opengl32
%prm
map, values
map : [int] The name of the pixel map to return. Accepted values are GL\_PIXEL\_MAP\_I\_TO\_I, GL\_PIXEL\_MAP\_S\_TO\_S, GL\_PIXEL\_MAP\_I\_TO\_R, GL\_PIXEL\_MAP\_I\_TO\_G, GL\_PIXEL\_MAP\_I\_TO\_B, GL\_PIXEL\_MAP\_I\_TO\_A, GL\_PIXEL\_MAP\_R\_TO\_R, GL\_PIXEL\_MAP\_G\_TO\_G, GL\_PIXEL\_MAP\_B\_TO\_B, and GL\_PIXEL\_MAP\_A\_TO\_A.
values : [var] Returns the pixel map contents.
%inst
The glGetPixelMapfv, glGetPixelMapuiv, and glGetPixelMapusv functions
return the specified pixel map. | glGetPixelMapusv function (Gl.h)

[戻り値]
This function does not return a value.

[備考]
See [**glPixelMap**](glpixelmap.md) for a description of the
acceptable values for the *map* parameter. The **glGetPixelMap**
function returns in *values* the contents of the pixel map specified
in *map*. Use pixel maps during the execution of
[**glReadPixels**](glreadpixels.md),
[**glDrawPixels**](gldrawpixels.md),
[**glCopyPixels**](glcopypixels.md),
[**glTexImage1D**](glteximage1d.md), and
[**glTexImage2D**](glteximage2d.md) to map color indexes, stencil
indexes, color components, and depth components to other values.
Unsigned integer values, if requested, are linearly mapped from the
internal fixed or floating-point representation such that 1.0 maps to
the largest representable integer value, and 0.0 maps to zero. Return
unsigned integer values are undefined if the map value was not in the
range \[0,1\]. To determine the required size of *map*, call
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with the appropriate symbolic constant. If an error is generated, no
change is made to the contents of *values*. The following functions
retrieve information related to **glGetPixelMap**:
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_PIXEL\_MAP\_I\_TO\_I\_SIZE **glGet** with argument
GL\_PIXEL\_MAP\_S\_TO\_S\_SIZE **glGet** with argument
GL\_PIXEL\_MAP\_I\_TO\_R\_SIZE **glGet** with argument
GL\_PIXEL\_MAP\_I\_TO\_G\_SIZE **glGet** with argument
GL\_PIXEL\_MAP\_I\_TO\_B\_SIZE **glGet** with argument
GL\_PIXEL\_MAP\_I\_TO\_A\_SIZE **glGet** with argument
GL\_PIXEL\_MAP\_R\_TO\_R\_SIZE **glGet** with argument
GL\_PIXEL\_MAP\_G\_TO\_G\_SIZE **glGet** with argument
GL\_PIXEL\_MAP\_B\_TO\_B\_SIZE **glGet** with argument
GL\_PIXEL\_MAP\_A\_TO\_A\_SIZE **glGet** with argument
GL\_MAX\_PIXEL\_MAP\_TABLE


%index
glGetPointerv
The glGetPointerv function returns the address of a vertex data array.
%group
Win32 opengl32
%prm
pname, params
pname : [int] The type of array pointer to return from the following symbolic constants: GL\_COLOR\_ARRAY\_POINTER, GL\_EDGE\_FLAG\_ARRAY\_POINTER, GL\_FEEDBACK\_BUFFER\_POINTER, GL\_INDEX\_ARRAY\_POINTER, GL\_NORMAL\_ARRAY\_POINTER, GL\_TEXTURE\_COORD\_ARRAY\_POINTER, GL\_SELECTION\_BUFFER\_POINTER, and GL\_VERTEX\_ARRAY\_POINTER.
params : [int] 
%inst
The glGetPointerv function returns the address of a vertex data
array.

[戻り値]
This function does not return a value.

[備考]
The **glGetPointerv** function returns array pointer information. The
*pname* parameter is a symbolic constant specifying the kind of array
pointer to return, and *params* is a pointer to a location to place
the returned data.


%index
glGetPolygonStipple
The glGetPolygonStipple function returns the polygon stipple pattern.
%group
Win32 opengl32
%prm
mask
mask : [var] Returns the stipple pattern.
%inst
The glGetPolygonStipple function returns the polygon stipple pattern.

[戻り値]
This function does not return a value.

[備考]
The **glGetPolygonStipple** function returns a 32x32 polygon stipple
pattern through the *mask* parameter. The pattern is packed into
memory as if [**glReadPixels**](glreadpixels.md) with both *height*
and *width* of 32, *type* of GL\_BITMAP, and *format* of
GL\_COLOR\_INDEX were called, and the stipple pattern were stored in
an internal 32x32 color-index buffer. Unlike **glReadPixels**,
however, pixel-transfer operations (shift, offset, and pixel map) are
not applied to the returned stipple image. If an error is generated,
no change is made to the contents of *mask*.


%index
glGetString
The glGetString function returns a string describing the current OpenGL connection.
%group
Win32 opengl32
%prm
name
name : [int] One of the following symbolic constants.
%inst
The glGetString function returns a string describing the current
OpenGL connection.

[備考]
The **glGetString** function returns a pointer to a static string
describing some aspect of the current OpenGL connection. Because
OpenGL does not include queries for the performance characteristics
of an implementation, it is expected that some applications will be
written to recognize known platforms and will modify their OpenGL
usage based on known performance characteristics of these platforms.
The strings GL\_VENDOR and GL\_RENDERER together uniquely specify a
platform, and will not change from release to release. They should be
used as such by platform recognition algorithms. The format and
contents of the string that **glGetString** returns depend on the
implementation, except that: - Extension names will not include space
characters and will be separated by space characters in the
GL\_EXTENSIONS string. - The GL\_VERSION string begins with a version
number. The version number uses one of these forms:
*major\_number*.*minor\_number*
*major\_number*.*minor\_number*.*release\_number* - Vendor-specific
information may follow the version number. Its format depends on the
implementation, but a space always separates the version number and
the vendor-specific information. - All strings are null-terminated.
If an error is generated, **glGetString** returns zero.


%index
glGetTexEnvfv
The glGetTexEnvfv and glGetTexEnviv functions return texture environment parameters. | glGetTexEnvfv function (Gl.h)
%group
Win32 opengl32
%prm
target, pname, params
target : [int] A texture environment. Must be GL\_TEXTURE\_ENV.
pname : [int] The symbolic name of a texture environment parameter. The following values are accepted.
params : [int] 
%inst
The glGetTexEnvfv and glGetTexEnviv functions return texture
environment parameters. | glGetTexEnvfv function (Gl.h)

[戻り値]
This function does not return a value.

[備考]
The **glGetTexEnv** function returns in *params* selected values of a
texture environment that was specified with
[**glTexEnv**](gltexenv-functions.md). The *target* parameter
specifies a texture environment. Currently, only one texture
environment is defined and supported: GL\_TEXTURE\_ENV. The *pname*
parameter names a specific texture environment parameter. If an error
is generated, no change is made to the contents of *params*.


%index
glGetTexEnviv
The glGetTexEnvfv and glGetTexEnviv functions return texture environment parameters. | glGetTexEnviv function (Gl.h)
%group
Win32 opengl32
%prm
target, pname, params
target : [int] A texture environment. Must be GL\_TEXTURE\_ENV.
pname : [int] The symbolic name of a texture environment parameter. The following values are accepted.
params : [int] 
%inst
The glGetTexEnvfv and glGetTexEnviv functions return texture
environment parameters. | glGetTexEnviv function (Gl.h)

[戻り値]
This function does not return a value.

[備考]
The **glGetTexEnv** function returns in *params* selected values of a
texture environment that was specified with
[**glTexEnv**](gltexenv-functions.md). The *target* parameter
specifies a texture environment. Currently, only one texture
environment is defined and supported: GL\_TEXTURE\_ENV. The *pname*
parameter names a specific texture environment parameter. If an error
is generated, no change is made to the contents of *params*.


%index
glGetTexGendv
The glGetTexGendv, glGetTexGenfv, and glGetTexGeniv functions return texture coordinate generation parameters. | glGetTexGendv function (Gl.h)
%group
Win32 opengl32
%prm
coord, pname, params
coord : [int] A texture coordinate. Must be GL\_S, GL\_T, GL\_R, or GL\_Q.
pname : [int] The symbolic name of the value(s) to be returned. Must be either GL\_TEXTURE\_GEN\_MODE or the name of one of the texture generation plane equations: GL\_OBJECT\_PLANE or GL\_EYE\_PLANE. These values are as follows.
params : [int] 
%inst
The glGetTexGendv, glGetTexGenfv, and glGetTexGeniv functions return
texture coordinate generation parameters. | glGetTexGendv function
(Gl.h)

[戻り値]
This function does not return a value.

[備考]
The **glGetTexGen** function returns in *params* selected parameters
of a texture-coordinate generation function that you specified with
**glTexGen**. The *coord* parameter names one of the (*s*, *t*, *r*,
*q*) texture coordinates, using the symbolic constant GL\_S, GL\_T,
GL\_R, or GL\_Q. If an error is generated, no change is made to the
contents of *params*.


%index
glGetTexGenfv
The glGetTexGendv, glGetTexGenfv, and glGetTexGeniv functions return texture coordinate generation parameters. | glGetTexGenfv function (Gl.h)
%group
Win32 opengl32
%prm
coord, pname, params
coord : [int] A texture coordinate. Must be GL\_S, GL\_T, GL\_R, or GL\_Q.
pname : [int] The symbolic name of the value(s) to be returned. Must be either GL\_TEXTURE\_GEN\_MODE or the name of one of the texture generation plane equations: GL\_OBJECT\_PLANE or GL\_EYE\_PLANE. These values are as follows.
params : [int] 
%inst
The glGetTexGendv, glGetTexGenfv, and glGetTexGeniv functions return
texture coordinate generation parameters. | glGetTexGenfv function
(Gl.h)

[戻り値]
This function does not return a value.

[備考]
The **glGetTexGen** function returns in *params* selected parameters
of a texture-coordinate generation function that you specified with
**glTexGen**. The *coord* parameter names one of the (*s*, *t*, *r*,
*q*) texture coordinates, using the symbolic constant GL\_S, GL\_T,
GL\_R, or GL\_Q. If an error is generated, no change is made to the
contents of *params*.


%index
glGetTexGeniv
The glGetTexGendv, glGetTexGenfv, and glGetTexGeniv functions return texture coordinate generation parameters. | glGetTexGeniv function (Gl.h)
%group
Win32 opengl32
%prm
coord, pname, params
coord : [int] A texture coordinate. Must be GL\_S, GL\_T, GL\_R, or GL\_Q.
pname : [int] The symbolic name of the value(s) to be returned. Must be either GL\_TEXTURE\_GEN\_MODE or the name of one of the texture generation plane equations: GL\_OBJECT\_PLANE or GL\_EYE\_PLANE. These values are as follows.
params : [int] 
%inst
The glGetTexGendv, glGetTexGenfv, and glGetTexGeniv functions return
texture coordinate generation parameters. | glGetTexGeniv function
(Gl.h)

[戻り値]
This function does not return a value.

[備考]
The **glGetTexGen** function returns in *params* selected parameters
of a texture-coordinate generation function that you specified with
**glTexGen**. The *coord* parameter names one of the (*s*, *t*, *r*,
*q*) texture coordinates, using the symbolic constant GL\_S, GL\_T,
GL\_R, or GL\_Q. If an error is generated, no change is made to the
contents of *params*.


%index
glGetTexImage
The glGetTexImage function returns a texture image.
%group
Win32 opengl32
%prm
target, level, format, type, pixels
target : [int] Specifies which texture is to be obtained. GL\_TEXTURE\_1D and GL\_TEXTURE\_2D are accepted.
level : [int] The level-of-detail number of the desired image. Level 0 is the base image level. Level *n* is the *n*th mipmap reduction image.
format : [int] A pixel format for the returned data. The supported formats are GL\_RED, GL\_GREEN, GL\_BLUE, GL\_ALPHA, GL\_RGB, GL\_RGBA, GL\_LUMINANCE, GL\_BGR\_EXT, GL\_BGRA\_EXT, and GL\_LUMINANCE\_ALPHA.
type : [int] A pixel type for the returned data. The supported types are GL\_UNSIGNED\_BYTE, GL\_BYTE, GL\_UNSIGNED\_SHORT, GL\_SHORT, GL\_UNSIGNED\_INT, GL\_INT, and GL\_FLOAT.
pixels : [intptr] Returns the texture image. Should be a pointer to an array of the type specified by *type*.
%inst
The glGetTexImage function returns a texture image.

[戻り値]
This function does not return a value.

[備考]
The **glGetTexImage** function returns a texture image into *pixels*.
The *target* parameter specifies whether the desired texture image is
one specified by
[**glTexImage1D**](glteximage1d.md)**(**GL\_TEXTURE\_1D**)** or by
[**glTexImage2D**](glteximage2d.md)**(**GL\_TEXTURE\_2D**)**. The
*level* parameter specifies the level-of-detail number of the desired
image. The *format* and *type* parameters specify the format and type
of the desired image array. For a description of the acceptable
values for the *format* and *type* parameters, respectively, see
**glTexImage1D** and [**glDrawPixels**](gldrawpixels.md). Operation
of **glGetTexImage** is best understood by considering the selected
internal four-component texture image to be an RGBA color buffer the
size of the image. The semantics of **glGetTexImage** are then
identical to those of [**glReadPixels**](glreadpixels.md) called with
the same *format* and *type*, with *x* and *y* set to zero, *width*
set to the width of the texture image (including border if one was
specified), and *height* set to one for 1-D images, or to the height
of the texture image (including border, if one was specified) for 2-D
images. Because the internal texture image is an RGBA image, pixel
formats GL\_COLOR\_INDEX, GL\_STENCIL\_INDEX, and
GL\_DEPTH\_COMPONENT are not accepted, and pixel type GL\_BITMAP is
not accepted. If the selected texture image does not contain four
components, the following mappings are applied. Single-component
textures are treated as RGBA buffers with red set to the
single-component value, and green, blue, and alpha set to zero.
Two-component textures are treated as RGBA buffers, with red set to
the value of component zero, alpha set to the value of component one,
and green and blue set to zero. Finally, three-component textures are
treated as RGBA buffers with red set to component zero, green set to
component one, blue set to component two, and alpha set to zero. To
determine the required size of *pixels*, use
[**glGetTexLevelParameter**](glgettexlevelparameter.md) to ascertain
the dimensions of the internal texture image, and then scale the
required number of pixels by the storage required for each pixel,
based on *format* and *type*. Be sure to take the pixel-storage
parameters into account, especially GL\_PACK\_ALIGNMENT. If an error
is generated, no change is made to the contents of *pixels*. The
following functions retrieve information related to
**glGetTexImage**:
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_PACK\_ALIGNMENT and others
[**glGetTexLevelParameter**](glgettexlevelparameter.md) with argument
GL\_TEXTURE\_WIDTH **glGetTexLevelParameter** with argument
GL\_TEXTURE\_HEIGHT **glGetTexLevelParameter** with argument
GL\_TEXTURE\_BORDER **glGetTexLevelParameter** with argument
GL\_TEXTURE\_COMPONENTS


%index
glGetTexLevelParameterfv
The glGetTexLevelParameterfv and glGetTexLevelParameteriv functions return texture parameter values for a specific level of detail. | glGetTexLevelParameterfv function (Gl.h)
%group
Win32 opengl32
%prm
target, level, pname, params
target : [int] The symbolic name of the target texture: either GL\_TEXTURE\_1D, GL\_TEXTURE\_2D, GL\_PROXY\_TEXTURE\_1D, or GL\_PROXY\_TEXTURE\_2D.
level : [int] The level-of-detail number of the desired image. Level 0 is the base image level. Level *n* is the *n*th mipmap reduction image.
pname : [int] The symbolic name of a texture parameter. The following parameter names are accepted.
params : [int] 
%inst
The glGetTexLevelParameterfv and glGetTexLevelParameteriv functions
return texture parameter values for a specific level of detail. |
glGetTexLevelParameterfv function (Gl.h)

[戻り値]
This function does not return a value.

[備考]
The **glGetTexLevelParameter** function returns in *params* texture
parameter values for a specific level-of-detail value, specified as
*level*. The *target* parameter defines the target texture, either
GL\_TEXTURE\_1D, GL\_TEXTURE\_2D, GL\_PROXY\_TEXTURE\_1D, or
GL\_PROXY\_TEXTURE\_2D to specify one-dimensional or two-dimensional
texturing. The *pname* parameter specifies the texture parameter
whose value or values will be returned. If an error is generated, no
change is made to the contents of *params*.


%index
glGetTexLevelParameteriv
The glGetTexLevelParameterfv and glGetTexLevelParameteriv functions return texture parameter values for a specific level of detail. | glGetTexLevelParameteriv function (Gl.h)
%group
Win32 opengl32
%prm
target, level, pname, params
target : [int] The symbolic name of the target texture: either GL\_TEXTURE\_1D, GL\_TEXTURE\_2D, GL\_PROXY\_TEXTURE\_1D, or GL\_PROXY\_TEXTURE\_2D.
level : [int] The level-of-detail number of the desired image. Level 0 is the base image level. Level *n* is the *n*th mipmap reduction image.
pname : [int] The symbolic name of a texture parameter. The following parameter names are accepted.
params : [int] 
%inst
The glGetTexLevelParameterfv and glGetTexLevelParameteriv functions
return texture parameter values for a specific level of detail. |
glGetTexLevelParameteriv function (Gl.h)

[戻り値]
This function does not return a value.

[備考]
The **glGetTexLevelParameter** function returns in *params* texture
parameter values for a specific level-of-detail value, specified as
*level*. The *target* parameter defines the target texture, either
GL\_TEXTURE\_1D, GL\_TEXTURE\_2D, GL\_PROXY\_TEXTURE\_1D, or
GL\_PROXY\_TEXTURE\_2D to specify one-dimensional or two-dimensional
texturing. The *pname* parameter specifies the texture parameter
whose value or values will be returned. If an error is generated, no
change is made to the contents of *params*.


%index
glGetTexParameterfv
The glGetTexParameterfv and glGetTexParameteriv functions return texture parameter values. | glGetTexParameterfv function (Gl.h)
%group
Win32 opengl32
%prm
target, pname, params
target : [int] The symbolic name of the target texture. GL\_TEXTURE\_1D and GL\_TEXTURE\_2D are accepted.
pname : [int] The symbolic name of a texture parameter. The following values are accepted.
params : [int] 
%inst
The glGetTexParameterfv and glGetTexParameteriv functions return
texture parameter values. | glGetTexParameterfv function (Gl.h)

[戻り値]
This function does not return a value.

[備考]
The **glGetTexParameter** function returns in *params* the value or
values of the texture parameter specified as *pname*. The *target*
parameter defines the target texture, either GL\_TEXTURE\_1D or
GL\_TEXTURE\_2D, to specify one-dimensional or two-dimensional
texturing. The *pname* parameter accepts the same symbols as
[**glTexParameter**](gltexparameter-functions.md), with the same
interpretations. If an error is generated, no change is made to the
contents of *params*.


%index
glGetTexParameteriv
The glGetTexParameterfv and glGetTexParameteriv functions return texture parameter values. | glGetTexParameteriv function (Gl.h)
%group
Win32 opengl32
%prm
target, pname, params
target : [int] The symbolic name of the target texture. GL\_TEXTURE\_1D and GL\_TEXTURE\_2D are accepted.
pname : [int] The symbolic name of a texture parameter. The following values are accepted.
params : [int] 
%inst
The glGetTexParameterfv and glGetTexParameteriv functions return
texture parameter values. | glGetTexParameteriv function (Gl.h)

[戻り値]
This function does not return a value.

[備考]
The **glGetTexParameter** function returns in *params* the value or
values of the texture parameter specified as *pname*. The *target*
parameter defines the target texture, either GL\_TEXTURE\_1D or
GL\_TEXTURE\_2D, to specify one-dimensional or two-dimensional
texturing. The *pname* parameter accepts the same symbols as
[**glTexParameter**](gltexparameter-functions.md), with the same
interpretations. If an error is generated, no change is made to the
contents of *params*.


%index
glHint
The glHint function specifies implementation-specific hints.
%group
Win32 opengl32
%prm
target, mode
target : [int] A symbolic constant indicating the behavior to be controlled. The following symbolic constants, along with suggested semantics, are accepted.
mode : [int] A symbolic constant indicating the desired behavior. The following symbolic constants are accepted.
%inst
The glHint function specifies implementation-specific hints.

[戻り値]
This function does not return a value.

[備考]
When there is room for interpretation, you can control certain
aspects of OpenGL behavior with hints. You specify a hint with two
arguments. The *target* parameter is a symbolic constant indicating
the behavior to be controlled, and *mode* is another symbolic
constant indicating the desired behavior. Though the implementation
aspects that can be hinted are well defined, the interpretation of
the hints depends on the implementation. The **glHint** function can
be ignored.


%index
glIndexMask
The glIndexMask function controls the writing of individual bits in the color-index buffers.
%group
Win32 opengl32
%prm
mask
mask : [int] A bit mask to enable and disable the writing of individual bits in the color-index buffers. Initially, the mask is all ones.
%inst
The glIndexMask function controls the writing of individual bits in
the color-index buffers.

[戻り値]
This function does not return a value.

[備考]
The **glIndexMask** function controls the writing of individual bits
in the color-index buffers. The least significant *n* bits of *mask*,
where *1* is the number of bits in a color-index buffer, specify a
mask. Wherever a one appears in the mask, the corresponding bit in
the color-index buffer (or buffers) is made writable. Where a zero
appears, the bit is write-protected. This mask is used only in
color-index mode, and it affects only the buffers currently selected
for writing (see [**glDrawBuffer**](gldrawbuffer.md)). Initially, all
bits are enabled for writing. The following function retrieves
information related to **glIndexMask**:
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_INDEX\_WRITEMASK


%index
glIndexPointer
The glIndexPointer function defines an array of color indexes.
%group
Win32 opengl32
%prm
type, stride, pointer
type : [int] The data type of each color index in the array using the following symbolic constants: GL\_SHORT, GL\_INT, GL\_FLOAT, GL\_DOUBLE.
stride : [int] The byte offset between consecutive color indexes. When *stride* is zero, the color indexes are tightly packed in the array.
pointer : [intptr] A pointer to the first color index in the array.
%inst
The glIndexPointer function defines an array of color indexes.

[戻り値]
This function does not return a value.

[備考]
The **glIndexPointer** function specifies the location and data of an
array of color indexes to use when rendering. The *type* parameter
specifies the data type of each color index and *stride* determines
the byte offset from one color index to the next, enabling the
packing of vertices and attributes in a single array or storage in
separate arrays. In some implementations, storing the vertices and
attributes in a single array can be more efficient than using
separate arrays. For more information, see
[**glInterleavedArrays**](glinterleavedarrays.md). A color-index
array is enabled when you specify the GL\_INDEX\_ARRAY constant with
[**glEnableClientState**](glenableclientstate.md). When enabled,
[**glDrawArrays**](gldrawarrays.md) and
[**glArrayElement**](glarrayelement.md) use the color-index array. By
default the color-index array is disabled. You cannot include
**glIndexPointer** in display lists. When you specify a color-index
array using **glIndexPointer**, the values of all the function's
color-index array parameters are saved in a client-side state and
static array elements can be cached. Because the color-index array
parameters are client-side state, their values are not saved or
restored by [**glPushAttrib**](glpushattrib.md) and **glPopAttrib**.
Although no error is generated when you call **glIndexPointer**
within [**glBegin**](glbegin.md) and **glEnd** pairs, the results are
undefined. The following functions retrieve information related to
**glIndexPointer**: [**glIsEnabled**](glisenabled.md) with argument
GL\_INDEX\_ARRAY
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_INDEX\_ARRAY\_STRIDE **glGet** with argument
GL\_INDEX\_ARRAY\_COUNT **glGet** with argument
GL\_INDEX\_ARRAY\_TYPE **glGet** with argument GL\_INDEX\_ARRAY\_SIZE
[**glGetPointerv**](glgetpointerv.md) with argument
GL\_INDEX\_ARRAY\_POINTER


%index
glIndexd
The glIndexd function sets the current color index.
%group
Win32 opengl32
%prm
c
c : [double] The new value for the current color index.
%inst
The glIndexd function sets the current color index.

[戻り値]
This function does not return a value.

[備考]
The **glIndexd** function updates the current (single-valued) color
index. It takes one argument: the new value for the current color
index. The current index is stored as a floating-point value. Integer
values are converted directly to floating-point values, with no
special mapping. Index values outside the representable range of the
color-index buffer are not clamped. However, before an index is
dithered (if enabled) and written to the framebuffer, it is converted
to fixed-point format. Any bits in the integer portion of the
resulting fixed-point value that do not correspond to bits in the
framebuffer are masked out. The current index can be updated at any
time. In particular, **glIndexd** can be called between a call to
[**glBegin**](/windows/desktop/OpenGL/glbegin) and the corresponding
call to [**glEnd**](glend.md). The following function retrieves
information related to **glIndexd**:
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_INDEX


%index
glIndexdv
The glIndexdv function sets the current color index.
%group
Win32 opengl32
%prm
c
c : [var] A pointer to a one-element array that contains the new value for the current color index.
%inst
The glIndexdv function sets the current color index.

[戻り値]
This function does not return a value.

[備考]
The **glIndexdv** function updates the current (single-valued) color
index. It takes one argument: the new value for the current color
index. The current index is stored as a floating-point value. Integer
values are converted directly to floating-point values, with no
special mapping. Index values outside the representable range of the
color-index buffer are not clamped. However, before an index is
dithered (if enabled) and written to the framebuffer, it is converted
to fixed-point format. Any bits in the integer portion of the
resulting fixed-point value that do not correspond to bits in the
framebuffer are masked out. The current index can be updated at any
time. In particular, **glIndexdv** can be called between a call to
[**glBegin**](/windows/desktop/OpenGL/glbegin) and the corresponding
call to [**glEnd**](glend.md). The following function retrieves
information related to **glIndexdv**:
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_INDEX


%index
glIndexf
The glIndexf function sets the current color index.
%group
Win32 opengl32
%prm
c
c : [float] The new value for the current color index.
%inst
The glIndexf function sets the current color index.

[戻り値]
This function does not return a value.

[備考]
The **glIndexf** function updates the current (single-valued) color
index. It takes one argument: the new value for the current color
index. The current index is stored as a floating-point value. Integer
values are converted directly to floating-point values, with no
special mapping. Index values outside the representable range of the
color-index buffer are not clamped. However, before an index is
dithered (if enabled) and written to the framebuffer, it is converted
to fixed-point format. Any bits in the integer portion of the
resulting fixed-point value that do not correspond to bits in the
framebuffer are masked out. The current index can be updated at any
time. In particular, **glIndexf** can be called between a call to
[**glBegin**](/windows/desktop/OpenGL/glbegin) and the corresponding
call to [**glEnd**](glend.md). The following function retrieves
information related to **glIndexf**:
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_INDEX


%index
glIndexfv
The glIndexfv function sets the current color index.
%group
Win32 opengl32
%prm
c
c : [var] A pointer to a one-element array that contains the new value for the current color index.
%inst
The glIndexfv function sets the current color index.

[戻り値]
This function does not return a value.

[備考]
The **glIndexfv** function updates the current (single-valued) color
index. It takes one argument: the new value for the current color
index. The current index is stored as a floating-point value. Integer
values are converted directly to floating-point values, with no
special mapping. Index values outside the representable range of the
color-index buffer are not clamped. However, before an index is
dithered (if enabled) and written to the framebuffer, it is converted
to fixed-point format. Any bits in the integer portion of the
resulting fixed-point value that do not correspond to bits in the
framebuffer are masked out. The current index can be updated at any
time. In particular, **glIndexfv** can be called between a call to
[**glBegin**](/windows/desktop/OpenGL/glbegin) and the corresponding
call to [**glEnd**](glend.md). The following function retrieves
information related to **glIndexfv**:
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_INDEX


%index
glIndexi
The glIndexi function sets the current color index.
%group
Win32 opengl32
%prm
c
c : [int] The new value for the current color index.
%inst
The glIndexi function sets the current color index.

[戻り値]
This function does not return a value.

[備考]
The **glIndexi** function updates the current (single-valued) color
index. It takes one argument: the new value for the current color
index. The current index is stored as a floating-point value. Integer
values are converted directly to floating-point values, with no
special mapping. Index values outside the representable range of the
color-index buffer are not clamped. However, before an index is
dithered (if enabled) and written to the framebuffer, it is converted
to fixed-point format. Any bits in the integer portion of the
resulting fixed-point value that do not correspond to bits in the
framebuffer are masked out. The current index can be updated at any
time. In particular, **glIndexi** can be called between a call to
[**glBegin**](/windows/desktop/OpenGL/glbegin) and the corresponding
call to [**glEnd**](glend.md). The following function retrieves
information related to **glIndexi**:
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_INDEX


%index
glIndexiv
The glIndexiv function sets the current color index.
%group
Win32 opengl32
%prm
c
c : [var] A pointer to a one-element array that contains the new value for the current color index.
%inst
The glIndexiv function sets the current color index.

[戻り値]
This function does not return a value.

[備考]
The **glIndexiv** function updates the current (single-valued) color
index. It takes one argument: the new value for the current color
index. The current index is stored as a floating-point value. Integer
values are converted directly to floating-point values, with no
special mapping. Index values outside the representable range of the
color-index buffer are not clamped. However, before an index is
dithered (if enabled) and written to the framebuffer, it is converted
to fixed-point format. Any bits in the integer portion of the
resulting fixed-point value that do not correspond to bits in the
framebuffer are masked out. The current index can be updated at any
time. In particular, **glIndexiv** can be called between a call to
[**glBegin**](/windows/desktop/OpenGL/glbegin) and the corresponding
call to [**glEnd**](glend.md). The following function retrieves
information related to **glIndexiv**:
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_INDEX


%index
glIndexs
The glIndexs function sets the current color index.
%group
Win32 opengl32
%prm
c
c : [int] The new value for the current color index.
%inst
The glIndexs function sets the current color index.

[戻り値]
This function does not return a value.

[備考]
The **glIndexs** function updates the current (single-valued) color
index. It takes one argument: the new value for the current color
index. The current index is stored as a floating-point value. Integer
values are converted directly to floating-point values, with no
special mapping. Index values outside the representable range of the
color-index buffer are not clamped. However, before an index is
dithered (if enabled) and written to the framebuffer, it is converted
to fixed-point format. Any bits in the integer portion of the
resulting fixed-point value that do not correspond to bits in the
framebuffer are masked out. The current index can be updated at any
time. In particular, **glIndexs** can be called between a call to
[**glBegin**](/windows/desktop/OpenGL/glbegin) and the corresponding
call to [**glEnd**](glend.md). The following function retrieves
information related to **glIndexs**:
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_INDEX


%index
glIndexsv
The glIndexsv function sets the current color index.
%group
Win32 opengl32
%prm
c
c : [var] A pointer to a one-element array that contains the new value for the current color index.
%inst
The glIndexsv function sets the current color index.

[戻り値]
This function does not return a value.

[備考]
The **glIndexsv** function updates the current (single-valued) color
index. It takes one argument: the new value for the current color
index. The current index is stored as a floating-point value. Integer
values are converted directly to floating-point values, with no
special mapping. Index values outside the representable range of the
color-index buffer are not clamped. However, before an index is
dithered (if enabled) and written to the framebuffer, it is converted
to fixed-point format. Any bits in the integer portion of the
resulting fixed-point value that do not correspond to bits in the
framebuffer are masked out. The current index can be updated at any
time. In particular, **glIndexsv** can be called between a call to
[**glBegin**](/windows/desktop/OpenGL/glbegin) and the corresponding
call to [**glEnd**](glend.md). The following function retrieves
information related to **glIndexsv**:
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_INDEX


%index
glIndexub
(no summary)
%group
Win32 opengl32
%prm
c
c : [int] 
%inst



%index
glIndexubv
(no summary)
%group
Win32 opengl32
%prm
c
c : [var] 
%inst



%index
glInitNames
The glInitNames function initializes the name stack.
%group
Win32 opengl32
%prm

%inst
The glInitNames function initializes the name stack.

[戻り値]
This function has no parameters.
This function does not return a value.

[備考]
The **glInitNames** function causes the name stack to be initialized
to its default empty state. The name stack is used during selection
mode to allow sets of rendering commands to be uniquely identified.
It consists of an ordered set of unsigned integers. The name stack is
always empty while the render mode is not GL\_SELECT. Calls to
**glInitNames** while the render mode is not GL\_SELECT are ignored.
The following functions retrieve information related to
**glInitNames**:
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_NAME\_STACK\_DEPTH **glGet** with argument
GL\_MAX\_NAME\_STACK\_DEPTH


%index
glInterleavedArrays
The glInterleavedArrays function simultaneously specifies and enables several interleaved arrays in a larger aggregate array.
%group
Win32 opengl32
%prm
format, stride, pointer
format : [int] The type of array to enable. The parameter can assume one of the following symbolic values: GL\_V2F, GL\_V3F, GL\_C4UB\_V2F, GL\_C4UB\_V3F, GL\_C3F\_V3F, GL\_N3F\_V3F, GL\_C4F\_N3F\_V3F, GL\_T2F\_V3F, GL\_T4F\_V4F, GL\_T2F\_C4UB\_V3F, GL\_T2F\_C3F\_V3F, GL\_T2F\_N3F\_V3F, GL\_T2F\_C4F\_N3F\_V3F, or GL\_T4F\_C4F\_N3F\_V4F.
stride : [int] The offset in bytes between each aggregate array element.
pointer : [intptr] A pointer to the first element of an aggregate array.
%inst
The glInterleavedArrays function simultaneously specifies and enables
several interleaved arrays in a larger aggregate array.

[戻り値]
This function does not return a value.

[備考]
With the **glInterleavedArrays** function, you can simultaneously
specify and enable several interleaved color, normal, texture, and
vertex arrays whose elements are part of a larger aggregate array
element. For some memory architectures, this is more efficient than
specifying the arrays separately. If the *stride* parameter is zero
then the aggregate array elements are stored consecutively; otherwise
*stride* bytes occur between aggregate array elements. The *format*
parameter serves as a key that describes how to extract individual
arrays from the aggregate array: - If *format* contains a T, then
texture coordinates are extracted from the interleaved array. - If C
is present, color values are extracted. - If N is present, normal
coordinates are extracted. - Vertex coordinates are always extracted.
- The digits 2, 3, and 4 denote how many values are extracted. - F
indicates that values are extracted as floating point values. - If
4UB follows the C, colors may also be extracted as 4 unsigned bytes.
If a color is extracted as 4 unsigned bytes, the vertex array element
that follows is located at the first possible floating-point aligned
address. If you call **glInterleavedArrays** while compiling a
display list, it is not compiled into the list but is executed
immediately. You cannot include calls to **glInterleavedArrays** in
**glDisableClientState** between calls to [**glBegin**](glbegin.md)
and the corresponding call to **glEnd**. > [!Note] > The
**glInterleavedArrays** function is only available in OpenGL version
1.1 or later.
The **glInterleavedArrays** function is implemented on the client
side with no protocol. Because the vertex array parameters are
client-side state, they are not saved or restored by
[**glPushAttrib**](glpushattrib.md) and **glPopAttrib**. Use
[**glPushClientAttrib**](glpushclientattrib.md) and
**glPopClientAttrib** instead.


%index
glIsEnabled
The gllsEnabled function tests whether a capability is enabled.
%group
Win32 opengl32
%prm
cap
cap : [int] A symbolic constant indicating an OpenGL capability. The following capabilities are accepted.
%inst
The gllsEnabled function tests whether a capability is enabled.

[備考]
The **gllsEnabled** function returns GL\_TRUE if *cap* is an enabled
capability and returns GL\_FALSE otherwise.


%index
glIsList
The gllsList function tests for display list existence.
%group
Win32 opengl32
%prm
list
list : [int] A potential display list name.
%inst
The gllsList function tests for display list existence.

[備考]
The **gllsList** function returns GL\_TRUE if *list* is the name of a
display list and returns GL\_FALSE otherwise.


%index
glIsTexture
The glIsTexture function determines if a name corresponds to a texture.
%group
Win32 opengl32
%prm
texture
texture : [int] A value that is the name of a texture.
%inst
The glIsTexture function determines if a name corresponds to a
texture.

[備考]
If the *texture* parameter is currently the name of a texture, the
**glIsTexture** function returns GL\_TRUE. The **glIsTexture**
function returns GL\_FALSE if *texture* is zero. It also returns
GL\_FALSE if it is a non-zero value that is not currently the name of
a texture, or if an error occurs. You cannot include calls to
**glIsTexture** in display lists. > [!Note] > The **glIsTexture**
function is only available in OpenGL version 1.1 or later.


%index
glLightModelf
The glLightModelf function sets lighting model parameters.
%group
Win32 opengl32
%prm
pname, param1
pname : [int] A single-valued lighting model parameter. The following values are accepted.
param1 : [float] 
%inst
The glLightModelf function sets lighting model parameters.

[戻り値]
This function does not return a value.

[備考]
The **glLightModelf** function sets lighting model parameter. The
*pname* parameter names a parameter and *param* gives the new
value.the value or values of individual light source parameters. In
RGBA mode, the lighted color of a vertex is the sum of the material
emission intensity, the product of the material ambient reflectance
and the lighting model full-scene ambient intensity, and the
contribution of each enabled light source. Each light source
contributes the sum of three terms: ambient, diffuse, and specular. -
The ambient light source contribution is the product of the material
ambient reflectance and the light's ambient intensity. - The diffuse
light source contribution is the product of the material diffuse
reflectance, the light's diffuse intensity, and the dot product of
the vertex's normal with the normalized vector from the vertex to the
light source. - The specular light source contribution is the product
of the material specular reflectance, the light's specular intensity,
and the dot product of the normalized vertex-to-eye and
vertex-to-light vectors, raised to the power of the shininess of the
material. All three light source contributions are attenuated equally
based on the distance from the vertex to the light source and on
light source direction, spread exponent, and spread cutoff angle. All
dot products are replaced with zero if they evaluate to a negative
value. The alpha component of the resulting lighted color is set to
the alpha value of the material diffuse reflectance. In color-index
mode, the value of the lighted index of a vertex ranges from the
ambient to the specular values passed to
[**glMaterial**](glmaterial-functions.md) using GL\_COLOR\_INDEXES.
Diffuse and specular coefficients, computed with a (.30, .59, .11)
weighting of the light's colors, the shininess of the material, and
the same reflection and attenuation equations as in the RGBA case,
determine how much above ambient the resulting index is. The
following functions retrieve information related to the
**glLightModelf** function:
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_LIGHT\_MODEL\_LOCAL\_VIEWER
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_LIGHT\_MODEL\_TWO\_SIDE
[**glIsEnabled**](glisenabled.md) with argument GL\_LIGHTING


%index
glLightModelfv
The glLightModelfv function sets lighting model parameters.
%group
Win32 opengl32
%prm
pname, params
pname : [int] A lighting model parameter. The following values are accepted.
params : [int] 
%inst
The glLightModelfv function sets lighting model parameters.

[戻り値]
This function does not return a value.

[備考]
The **glLightModelfv** function sets lighting model parameter. The
*pname* parameter names a parameter and *param* gives the new
value.the value or values of individual light source parameters. In
RGBA mode, the lighted color of a vertex is the sum of the material
emission intensity, the product of the material ambient reflectance
and the lighting model full-scene ambient intensity, and the
contribution of each enabled light source. Each light source
contributes the sum of three terms: ambient, diffuse, and specular. -
The ambient light source contribution is the product of the material
ambient reflectance and the light's ambient intensity. - The diffuse
light source contribution is the product of the material diffuse
reflectance, the light's diffuse intensity, and the dot product of
the vertex's normal with the normalized vector from the vertex to the
light source. - The specular light source contribution is the product
of the material specular reflectance, the light's specular intensity,
and the dot product of the normalized vertex-to-eye and
vertex-to-light vectors, raised to the power of the shininess of the
material. All three light source contributions are attenuated equally
based on the distance from the vertex to the light source and on
light source direction, spread exponent, and spread cutoff angle. All
dot products are replaced with zero if they evaluate to a negative
value. The alpha component of the resulting lighted color is set to
the alpha value of the material diffuse reflectance. In color-index
mode, the value of the lighted index of a vertex ranges from the
ambient to the specular values passed to
[**glMaterial**](glmaterial-functions.md) using GL\_COLOR\_INDEXES.
Diffuse and specular coefficients, computed with a (.30, .59, .11)
weighting of the light's colors, the shininess of the material, and
the same reflection and attenuation equations as in the RGBA case,
determine how much above ambient the resulting index is. The
following functions retrieve information related to the
**glLightModelfv** function:
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_LIGHT\_MODEL\_LOCAL\_VIEWER
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_LIGHT\_MODEL\_TWO\_SIDE
[**glIsEnabled**](glisenabled.md) with argument GL\_LIGHTING


%index
glLightModeli
The glLightModeli function sets lighting model parameters.
%group
Win32 opengl32
%prm
pname, param1
pname : [int] A single-valued lighting model parameter. The following values are accepted.
param1 : [int] 
%inst
The glLightModeli function sets lighting model parameters.

[戻り値]
This function does not return a value.

[備考]
The **glLightModeli** function sets lighting model parameter. The
*pname* parameter names a parameter and *param* gives the new
value.the value or values of individual light source parameters. In
RGBA mode, the lighted color of a vertex is the sum of the material
emission intensity, the product of the material ambient reflectance
and the lighting model full-scene ambient intensity, and the
contribution of each enabled light source. Each light source
contributes the sum of three terms: ambient, diffuse, and specular. -
The ambient light source contribution is the product of the material
ambient reflectance and the light's ambient intensity. - The diffuse
light source contribution is the product of the material diffuse
reflectance, the light's diffuse intensity, and the dot product of
the vertex's normal with the normalized vector from the vertex to the
light source. - The specular light source contribution is the product
of the material specular reflectance, the light's specular intensity,
and the dot product of the normalized vertex-to-eye and
vertex-to-light vectors, raised to the power of the shininess of the
material. All three light source contributions are attenuated equally
based on the distance from the vertex to the light source and on
light source direction, spread exponent, and spread cutoff angle. All
dot products are replaced with zero if they evaluate to a negative
value. The alpha component of the resulting lighted color is set to
the alpha value of the material diffuse reflectance. In color-index
mode, the value of the lighted index of a vertex ranges from the
ambient to the specular values passed to
[**glMaterial**](glmaterial-functions.md) using GL\_COLOR\_INDEXES.
Diffuse and specular coefficients, computed with a (.30, .59, .11)
weighting of the light's colors, the shininess of the material, and
the same reflection and attenuation equations as in the RGBA case,
determine how much above ambient the resulting index is. The
following functions retrieve information related to the
**glLightModeli** function:
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_LIGHT\_MODEL\_LOCAL\_VIEWER
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_LIGHT\_MODEL\_TWO\_SIDE
[**glIsEnabled**](glisenabled.md) with argument GL\_LIGHTING


%index
glLightModeliv
The glLightModeliv function sets lighting model parameters.
%group
Win32 opengl32
%prm
pname, params
pname : [int] A lighting model parameter. The following values are accepted.
params : [int] 
%inst
The glLightModeliv function sets lighting model parameters.

[戻り値]
This function does not return a value.

[備考]
The **glLightModeliv** function sets lighting model parameter. The
*pname* parameter names a parameter and *param* gives the new
value.the value or values of individual light source parameters. In
RGBA mode, the lighted color of a vertex is the sum of the material
emission intensity, the product of the material ambient reflectance
and the lighting model full-scene ambient intensity, and the
contribution of each enabled light source. Each light source
contributes the sum of three terms: ambient, diffuse, and specular. -
The ambient light source contribution is the product of the material
ambient reflectance and the light's ambient intensity. - The diffuse
light source contribution is the product of the material diffuse
reflectance, the light's diffuse intensity, and the dot product of
the vertex's normal with the normalized vector from the vertex to the
light source. - The specular light source contribution is the product
of the material specular reflectance, the light's specular intensity,
and the dot product of the normalized vertex-to-eye and
vertex-to-light vectors, raised to the power of the shininess of the
material. All three light source contributions are attenuated equally
based on the distance from the vertex to the light source and on
light source direction, spread exponent, and spread cutoff angle. All
dot products are replaced with zero if they evaluate to a negative
value. The alpha component of the resulting lighted color is set to
the alpha value of the material diffuse reflectance. In color-index
mode, the value of the lighted index of a vertex ranges from the
ambient to the specular values passed to
[**glMaterial**](glmaterial-functions.md) using GL\_COLOR\_INDEXES.
Diffuse and specular coefficients, computed with a (.30, .59, .11)
weighting of the light's colors, the shininess of the material, and
the same reflection and attenuation equations as in the RGBA case,
determine how much above ambient the resulting index is. The
following functions retrieve information related to the
**glLightModeliv** function:
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_LIGHT\_MODEL\_LOCAL\_VIEWER
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_LIGHT\_MODEL\_TWO\_SIDE
[**glIsEnabled**](glisenabled.md) with argument GL\_LIGHTING


%index
glLightf
The glLightf function returns light source parameter values.
%group
Win32 opengl32
%prm
light, pname, param2
light : [int] The identifier of a light. The number of possible lights depends on the implementation, but at least eight lights are supported. They are identified by symbolic names of the form GL\_LIGHT*i* where *i* is a value: 0 to GL\_MAX\_LIGHTS - 1.
pname : [int] A single-valued light source parameter for *light*. The following symbolic names are accepted.
param2 : [float] 
%inst
The glLightf function returns light source parameter values.

[戻り値]
This function does not return a value.


%index
glLightfv
The glLightfv function returns light source parameter values.
%group
Win32 opengl32
%prm
light, pname, params
light : [int] The identifier of a light. The number of possible lights depends on the implementation, but at least eight lights are supported. They are identified by symbolic names of the form GL\_LIGHT*i* where *i* is a value: 0 to GL\_MAX\_LIGHTS - 1.
pname : [int] A light source parameter for *light*. The following symbolic names are accepted.
params : [int] 
%inst
The glLightfv function returns light source parameter values.

[戻り値]
This function does not return a value.


%index
glLighti
The glLighti function returns light source parameter values.
%group
Win32 opengl32
%prm
light, pname, param2
light : [int] The identifier of a light. The number of possible lights depends on the implementation, but at least eight lights are supported. They are identified by symbolic names of the form GL\_LIGHT*i* where *i* is a value: 0 to GL\_MAX\_LIGHTS - 1.
pname : [int] A single-valued light source parameter for *light*. The following symbolic names are accepted.
param2 : [int] 
%inst
The glLighti function returns light source parameter values.

[戻り値]
This function does not return a value.


%index
glLightiv
The glLightiv function returns light source parameter values.
%group
Win32 opengl32
%prm
light, pname, params
light : [int] The identifier of a light. The number of possible lights depends on the implementation, but at least eight lights are supported. They are identified by symbolic names of the form GL\_LIGHT*i* where *i* is a value: 0 to GL\_MAX\_LIGHTS - 1.
pname : [int] A light source parameter for *light*. The following symbolic names are accepted.
params : [int] 
%inst
The glLightiv function returns light source parameter values.

[戻り値]
This function does not return a value.


%index
glLineStipple
The glLineStipple function specifies the line stipple pattern.
%group
Win32 opengl32
%prm
factor, pattern
factor : [int] A multiplier for each bit in the line stipple pattern. If *factor* is 3, for example, each bit in the pattern will be used three times before the next bit in the pattern is used. The *factor* parameter is clamped to the range \[1, 256\] and defaults to one.
pattern : [int] A 16-bit integer whose bit pattern determines which fragments of a line will be drawn when the line is rasterized. Bit zero is used first, and the default pattern is all ones.
%inst
The glLineStipple function specifies the line stipple pattern.

[戻り値]
This function does not return a value.

[備考]
The **glLineStipple** function specifies the line stipple pattern.
Line stippling masks out certain fragments produced by rasterization;
those fragments will not be drawn. The masking is achieved by using
three parameters: the 16-bit line stipple pattern *pattern*, the
repeat count *factor*, and an integer stipple counter *s*. Counter
*s* is reset to zero whenever [**glBegin**](glbegin.md) is called,
and before each line segment of a **glBegin**(GL\_LINES)/**glEnd**
sequence is generated. It is incremented after each fragment of a
unit width aliased line segment is generated, or after each *i*
fragments of an *i* width line segment are generated. The *i*
fragments associated with count *s* are masked out if *pattern* bit
(*s* / *factor*) mod 16 is zero. Otherwise these fragments are sent
to the framebuffer. Bit zero of *pattern* is the least significant
bit. Antialiased lines are treated as a sequence of 1x*width*
rectangles for purposes of stippling. Rectangle *s* is rasterized or
not based on the fragment rule described for aliased lines; it counts
rectangles rather than groups of fragments. Line stippling is enabled
or disabled using [**glEnable**](glenable.md) and **glDisable** with
argument GL\_LINE\_STIPPLE. When enabled, the line stipple pattern is
applied as described above. When disabled, it is as if the pattern
were all ones. Initially, line stippling is disabled. The following
functions retrieve information related to **glLineStipple**:
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_LINE\_STIPPLE\_PATTERN **glGet** with argument
GL\_LINE\_STIPPLE\_REPEAT [**glIsEnabled**](glisenabled.md) with
argument GL\_LINE\_STIPPLE


%index
glLineWidth
The glLineWidth function specifies the width of rasterized lines.
%group
Win32 opengl32
%prm
width
width : [float] The width of rasterized lines. The default is 1.0.
%inst
The glLineWidth function specifies the width of rasterized lines.

[戻り値]
This function does not return a value.

[備考]
The **glLineWidth** function specifies the rasterized width of both
aliased and antialiased lines. Using a line width other than 1.0 has
different effects, depending on whether line antialiasing is enabled.
Line antialiasing is controlled by calling
[**glEnable**](glenable.md) and **glDisable** with argument
GL\_LINE\_SMOOTH. If line antialiasing is disabled, the actual width
is determined by rounding the supplied width to the nearest integer.
(If the rounding results in the value 0.0, it is as if the line width
were 1.0) If \| ? x \| = \| ? y \|, *i* pixels are filled in each
column that is rasterized, where *i* is the rounded value of *width*.
Otherwise, *i* pixels are filled in each row that is rasterized. If
antialiasing is enabled, line rasterization produces a fragment for
each pixel square that intersects the region lying within the
rectangle having width equal to the current line width, length equal
to the actual length of the line, and centered on the mathematical
line segment. The coverage value for each fragment is the window
coordinate area of the intersection of the rectangular region with
the corresponding pixel square. This value is saved and used in the
final rasterization step. Not all widths can be supported when line
antialiasing is enabled. If an unsupported width is requested, the
nearest supported width is used. Only width 1.0 is guaranteed to be
supported; others depend on the implementation. The range of
supported widths and the size difference between supported widths
within the range can be queried by calling **glGet** with arguments
GL\_LINE\_WIDTH\_RANGE and GL\_LINE\_WIDTH\_GRANULARITY. The line
width specified by **glLineWidth** is always returned when
GL\_LINE\_WIDTH is queried. Clamping and rounding for aliased and
antialiased lines have no effect on the specified value.
Non-antialiased line width may be clamped to an
implementation-dependent maximum. Although this maximum cannot be
queried, it must be no less than the maximum value for antialiased
lines, rounded to the nearest integer value. The following functions
retrieve information related to **glLineWidth**:
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_LINE\_WIDTH **glGet** with argument
GL\_LINE\_WIDTH\_RANGE **glGet** with argument
GL\_LINE\_WIDTH\_GRANULARITY [**glIsEnabled**](glisenabled.md) with
argument GL\_LINE\_SMOOTH


%index
glListBase
The glListBase function sets the display list base for glCallLists.
%group
Win32 opengl32
%prm
base
base : [int] 
%inst
The glListBase function sets the display list base for glCallLists.

[戻り値]
This function does not return a value.

[備考]
The **glListBase** function specifies an array of offsets. Display
list names are generated by adding *base* to each offset. Names that
reference valid display lists are executed; others are ignored. The
following function retrieves information related to **glListBase**:
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_LIST\_BASE


%index
glLoadIdentity
The glLoadIdentity function replaces the current matrix with the identity matrix.
%group
Win32 opengl32
%prm

%inst
The glLoadIdentity function replaces the current matrix with the
identity matrix.

[戻り値]
This function has no parameters.
This function does not return a value.

[備考]
The **glLoadIdentity** function replaces the current matrix with the
identity matrix. It is semantically equivalent to calling
[**glLoadMatrix**](glloadmatrix.md) with the following identity
matrix. ![Diagram showing the identity matrix that glLoadIdentity
calls.](images/load01.png) However, in some cases, it is more
efficient. The following functions retrieve information related to
**glLoadIdentity**:
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_MATRIX\_MODE **glGet** with argument
GL\_MODELVIEW\_MATRIX **glGet** with argument GL\_PROJECTION\_MATRIX
**glGet** with argument GL\_TEXTURE\_MATRIX


%index
glLoadMatrixd
The glLoadMatrixd function replaces the current matrix with an arbitrary matrix. | glLoadMatrixd function (Gl.h)
%group
Win32 opengl32
%prm
m
m : [var] A pointer to a 4x4 matrix stored in column-major order as 16 consecutive values.
%inst
The glLoadMatrixd function replaces the current matrix with an
arbitrary matrix. | glLoadMatrixd function (Gl.h)

[戻り値]
This function does not return a value.

[備考]
The **glLoadMatrix** function replaces the current matrix with the
one specified in *m*. The current matrix is the projection matrix,
modelview matrix, or texture matrix, determined by the current matrix
mode (see [**glMatrixMode**](glmatrixmode.md)). The *m* parameter
points to a 4x4 matrix of single-precision or double-precision
floating-point values stored in column-major order. That is, the
matrix is stored as shown in the following image. ![Diagram showing
the 4x4 matrix that the m parameter points to.](images/load02.png)
The following functions retrieve information related to
**glLoadMatrix**:
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_MATRIX\_MODE **glGet** with argument
GL\_MODELVIEW\_MATRIX **glGet** with argument GL\_PROJECTION\_MATRIX
**glGet** with argument GL\_TEXTURE\_MATRIX


%index
glLoadMatrixf
The glLoadMatrixf function replaces the current matrix with an arbitrary matrix. | glLoadMatrixf function (Gl.h)
%group
Win32 opengl32
%prm
m
m : [var] A pointer to a 4x4 matrix stored in column-major order as 16 consecutive values.
%inst
The glLoadMatrixf function replaces the current matrix with an
arbitrary matrix. | glLoadMatrixf function (Gl.h)

[戻り値]
This function does not return a value.

[備考]
The **glLoadMatrix** function replaces the current matrix with the
one specified in *m*. The current matrix is the projection matrix,
modelview matrix, or texture matrix, determined by the current matrix
mode (see [**glMatrixMode**](glmatrixmode.md)). The *m* parameter
points to a 4x4 matrix of single-precision or double-precision
floating-point values stored in column-major order. That is, the
matrix is stored as shown in the following image. ![Diagram showing
the 4x4 matrix that the m parameter points to.](images/load02.png)
The following functions retrieve information related to
**glLoadMatrix**:
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_MATRIX\_MODE **glGet** with argument
GL\_MODELVIEW\_MATRIX **glGet** with argument GL\_PROJECTION\_MATRIX
**glGet** with argument GL\_TEXTURE\_MATRIX


%index
glLoadName
The glLoadName function loads a name onto the name stack.
%group
Win32 opengl32
%prm
name
name : [int] A name that will replace the top value on the name stack.
%inst
The glLoadName function loads a name onto the name stack.

[戻り値]
This function does not return a value.

[備考]
The **glLoadName** function causes *name* to replace the value on the
top of the name stack, which is initially empty. The name stack is
used during selection mode to allow sets of rendering commands to be
uniquely identified. It consists of an ordered set of unsigned
integers. The name stack is always empty while the render mode is not
GL\_SELECT. Calls to **glLoadName** while the render mode is not
GL\_SELECT are ignored. The following functions retrieve information
related to **glLoadName**:
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_NAME\_STACK\_DEPTH **glGet** with argument
GL\_MAX\_NAME\_STACK\_DEPTH


%index
glLogicOp
The glLogicOp function specifies a logical pixel operation for color index rendering.
%group
Win32 opengl32
%prm
opcode
opcode : [int] A symbolic constant that selects a logical operation. The following symbols are accepted where s equals the value of the source bit and d is the value of the destination bit.
%inst
The glLogicOp function specifies a logical pixel operation for color
index rendering.

[戻り値]
This function does not return a value.

[備考]
The **glLogicOp** function specifies a logical operation that, when
enabled, is applied between the incoming color index and the color
index at the corresponding location in the framebuffer. The logical
operation is enabled or disabled with [**glEnable**](glenable.md) and
**glDisable** using the symbolic constant GL\_LOGIC\_OP. The *opcode*
parameter is a symbolic constant chosen from the list below. In the
explanation of the logical operations, *s* represents the incoming
color index and *d* represents the index in the framebuffer. Standard
C-language operators are used. As these bitwise operators suggest,
the logical operation is applied independently to each bit pair of
the source and destination indexes. Logical pixel operations are not
applied to RGBA color buffers. When more than one color-index buffer
is enabled for drawing, logical operations are done separately for
each enabled buffer, using the contents of that buffer for the
destination index (see [**glDrawBuffer**](gldrawbuffer.md)). The
*opcode* parameter must be one of the 16 accepted values. Other
values result in an error. The following functions retrieve
information related to **glLogicOp**:
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_LOGIC\_OP\_MODE [**glIsEnabled**](glisenabled.md)
with argument GL\_LOGIC\_OP


%index
glMap1d
The glMap1d function defines a one-dimensional evaluator. | glMap1d function (Gl.h)
%group
Win32 opengl32
%prm
target, u1, u2, stride, order, points
target : [int] The kind of values that are generated by the evaluator. Symbolic constants. The *target* parameter is a symbolic constant that indicates what kind of control points are provided in *points*, and what output is generated when the map is evaluated. It can assume one of nine predefined values.
u1 : [double] A linear mapping of *u*, as presented to [**glEvalCoord1**](glevalcoord-functions.md), to *u*^, the variable that is evaluated by the equations specified by this command.
u2 : [double] A linear mapping of *u*, as presented to [**glEvalCoord1**](glevalcoord-functions.md), to *u*^, the variable that is evaluated by the equations specified by this command.
stride : [int] The number of floats or doubles between the beginning of one control point and the beginning of the next one in the data structure referenced in *points*. This allows control points to be embedded in arbitrary data structures. The only constraint is that the values for a particular control point must occupy contiguous memory locations.
order : [int] The number of control points. Must be positive.
points : [var] A pointer to the array of control points.
%inst
The glMap1d function defines a one-dimensional evaluator. | glMap1d
function (Gl.h)

[戻り値]
This function does not return a value.

[備考]
Evaluators provide a way to use polynomial or rational polynomial
mapping to produce vertices, normals, texture coordinates, and
colors. The values produced by an evaluator are sent to further
stages of OpenGL processing just as if they had been presented using
[**glVertex**](glvertex-functions.md),
[**glNormal**](glnormal-functions.md),
[**glTexCoord**](gltexcoord-functions.md), and
[**glColor**](glcolor-functions.md) commands, except that the
generated values do not update the current normal, texture
coordinates, or color. All polynomial or rational polynomial splines
of any degree (up to the maximum degree supported by the OpenGL
implementation) can be described using evaluators. These include
almost all splines used in computer graphics, including B-splines,
Bezier curves, Hermite splines, and so on. Evaluators define curves
based on Bernstein polynomials. Define **p** () as ![Equation showing
the definition of p ().](images/map01.png) where **R***i* is a
control point and () is the *i* the Bernstein polynomial of degree
*n* (*order* =*n* + 1): ![Equation showing the Bernstein polynomial
of degree n.](images/map02.png) Recall that ![Equations showing
equivalence to 1.](images/map03.png) The **glMap1** function is used
to define the basis and to specify what kind of values are produced.
Once defined, a map can be enabled and disabled by calling
[**glEnable**](glenable.md) and **glDisable** with the map name, one
of the nine predefined values for *target* described above. The
[glEvalCoord1](glevalcoord-functions.md) function evaluates the
one-dimensional maps that are enabled. When **glEvalCoord1** presents
a value *u*, the Bernstein functions are evaluated using *u*^, where
![Equation showing the definition of u^.](images/map04.png) The
*stride*, *order*, and *points* parameters define the array
addressing for accessing the control points. The *points* parameter
is the location of the first control point, which occupies one, two,
three, or four contiguous memory locations, depending on which map is
being defined. The *order* parameter is the number of control points
in the array. The *stride* parameter tells how many float or double
locations to advance the internal memory pointer to reach the next
control point. As is the case with all OpenGL commands that accept
pointers to data, it is as if the contents of *points* were copied by
**glMap1** before it returned. Changes to the contents of *points*
have no effect after **glMap1** is called. The following functions
retrieve information related to **glMap1**:
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_MAX\_EVAL\_ORDER [**glGetMap**](glgetmap.md)
[**glIsEnabled**](glisenabled.md) with argument GL\_MAP1\_VERTEX\_3
**glIsEnabled** with argument GL\_MAP1\_VERTEX\_4 **glIsEnabled**
with argument GL\_MAP1\_INDEX **glIsEnabled** with argument
GL\_MAP1\_COLOR\_4 **glIsEnabled** with argument GL\_MAP1\_NORMAL
**glIsEnabled** with argument GL\_MAP1\_TEXTURE\_COORD\_1
**glIsEnabled** with argument GL\_MAP1\_TEXTURE\_COORD\_2
**glIsEnabled** with argument GL\_MAP1\_TEXTURE\_COORD\_3
**glIsEnabled** with argument GL\_MAP1\_TEXTURE\_COORD\_4


%index
glMap1f
The glMap1f function defines a one-dimensional evaluator. | glMap1f function (Gl.h)
%group
Win32 opengl32
%prm
target, u1, u2, stride, order, points
target : [int] The kind of values that are generated by the evaluator. Symbolic constants. The *target* parameter is a symbolic constant that indicates what kind of control points are provided in *points*, and what output is generated when the map is evaluated. It can assume one of nine predefined values.
u1 : [float] A linear mapping of *u*, as presented to [**glEvalCoord1**](glevalcoord-functions.md), to *u*^, the variable that is evaluated by the equations specified by this command.
u2 : [float] A linear mapping of *u*, as presented to [**glEvalCoord1**](glevalcoord-functions.md), to *u*^, the variable that is evaluated by the equations specified by this command.
stride : [int] The number of floats or doubles between the beginning of one control point and the beginning of the next one in the data structure referenced in *points*. This allows control points to be embedded in arbitrary data structures. The only constraint is that the values for a particular control point must occupy contiguous memory locations.
order : [int] The number of control points. Must be positive.
points : [var] A pointer to the array of control points.
%inst
The glMap1f function defines a one-dimensional evaluator. | glMap1f
function (Gl.h)

[戻り値]
This function does not return a value.

[備考]
Evaluators provide a way to use polynomial or rational polynomial
mapping to produce vertices, normals, texture coordinates, and
colors. The values produced by an evaluator are sent to further
stages of OpenGL processing just as if they had been presented using
[**glVertex**](glvertex-functions.md),
[**glNormal**](glnormal-functions.md),
[**glTexCoord**](gltexcoord-functions.md), and
[**glColor**](glcolor-functions.md) commands, except that the
generated values do not update the current normal, texture
coordinates, or color. All polynomial or rational polynomial splines
of any degree (up to the maximum degree supported by the OpenGL
implementation) can be described using evaluators. These include
almost all splines used in computer graphics, including B-splines,
Bezier curves, Hermite splines, and so on. Evaluators define curves
based on Bernstein polynomials. Define **p** () as ![Equation showing
the definition of p ().](images/map01.png) where **R***i* is a
control point and () is the *i* the Bernstein polynomial of degree
*n* (*order* =*n* + 1): ![Equation showing the Bernstein polynomial
of degree n.](images/map02.png) Recall that ![Equations showing
equivalence to 1.](images/map03.png) The **glMap1** function is used
to define the basis and to specify what kind of values are produced.
Once defined, a map can be enabled and disabled by calling
[**glEnable**](glenable.md) and **glDisable** with the map name, one
of the nine predefined values for *target* described above. The
[glEvalCoord1](glevalcoord-functions.md) function evaluates the
one-dimensional maps that are enabled. When **glEvalCoord1** presents
a value *u*, the Bernstein functions are evaluated using *u*^, where
![Equation showing the definition of u^.](images/map04.png) The
*stride*, *order*, and *points* parameters define the array
addressing for accessing the control points. The *points* parameter
is the location of the first control point, which occupies one, two,
three, or four contiguous memory locations, depending on which map is
being defined. The *order* parameter is the number of control points
in the array. The *stride* parameter tells how many float or double
locations to advance the internal memory pointer to reach the next
control point. As is the case with all OpenGL commands that accept
pointers to data, it is as if the contents of *points* were copied by
**glMap1** before it returned. Changes to the contents of *points*
have no effect after **glMap1** is called. The following functions
retrieve information related to **glMap1**:
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_MAX\_EVAL\_ORDER [**glGetMap**](glgetmap.md)
[**glIsEnabled**](glisenabled.md) with argument GL\_MAP1\_VERTEX\_3
**glIsEnabled** with argument GL\_MAP1\_VERTEX\_4 **glIsEnabled**
with argument GL\_MAP1\_INDEX **glIsEnabled** with argument
GL\_MAP1\_COLOR\_4 **glIsEnabled** with argument GL\_MAP1\_NORMAL
**glIsEnabled** with argument GL\_MAP1\_TEXTURE\_COORD\_1
**glIsEnabled** with argument GL\_MAP1\_TEXTURE\_COORD\_2
**glIsEnabled** with argument GL\_MAP1\_TEXTURE\_COORD\_3
**glIsEnabled** with argument GL\_MAP1\_TEXTURE\_COORD\_4


%index
glMap2d
The glMap2d function defines a two-dimensional evaluator. | glMap2d function (Gl.h)
%group
Win32 opengl32
%prm
target, u1, u2, ustride, uorder, v1, v2, vstride, vorder, points
target : [int] The kind of values that are generated by the evaluator. The following symbolic constants are accepted.
u1 : [double] A linear mapping of *u*, as presented to [**glEvalCoord2**](glevalcoord-functions.md), to *u*^, one of the two variables that is evaluated by the equations specified by this command.
u2 : [double] A linear mapping of *u*, as presented to [**glEvalCoord2**](glevalcoord-functions.md), to *u*^, one of the two variables that is evaluated by the equations specified by this command.
ustride : [int] The number of floats or doubles between the beginning of control point **R** *ij* and the beginning of control point **R** (i\ +1\ )\ j, where *i* and *j* are the *u* and *v* control point indexes, respectively. This allows control points to be embedded in arbitrary data structures. The only constraint is that the values for a particular control point must occupy contiguous memory locations.
uorder : [int] The dimension of the control point array in the *u*-axis. Must be positive.
v1 : [double] A linear mapping of *v*, as presented to [**glEvalCoord2**](glevalcoord-functions.md), to *v*^, one of the two variables that is evaluated by the equations specified by this command.
v2 : [double] A linear mapping of *v*, as presented to [**glEvalCoord2**](glevalcoord-functions.md), to *v*^, one of the two variables that is evaluated by the equations specified by this command.
vstride : [int] The number of floats or doubles between the beginning of control point **R** *ij* and the beginning of control point **R** i(j\ +1\ ), where *i* and *j* are the *u* and *v* control point indexes, respectively. This allows control points to be embedded in arbitrary data structures. The only constraint is that the values for a particular control point must occupy contiguous memory locations.
vorder : [int] The dimension of the control point array in the *v*-axis. Must be positive.
points : [var] A pointer to the array of control points.
%inst
The glMap2d function defines a two-dimensional evaluator. | glMap2d
function (Gl.h)

[戻り値]
This function does not return a value.

[備考]
Evaluators provide a way to use polynomial or rational polynomial
mapping to produce vertices, normals, texture coordinates, and
colors. The values produced by an evaluator are sent on to further
stages of OpenGL processing just as if they had been presented using
[**glVertex**](glvertex-functions.md),
[**glNormal**](glnormal-functions.md),
[**glTexCoord**](gltexcoord-functions.md), and
[**glColor**](glcolor-functions.md) commands, except that the
generated values do not update the current normal, texture
coordinates, or color. All polynomial or rational polynomial splines
of any degree (up to the maximum degree supported by the OpenGL
implementation) can be described using evaluators. These include
almost all surfaces used in computer graphics, including B-spline
surfaces, NURBS surfaces, Bezier surfaces, and so on. Evaluators
define surfaces based on bivariate Bernstein polynomials. Define
**p** (*u*^,*v*^) as ![Equation showing the definition of p
().](images/map05.png) where **R** *ij* is a control point, () is the
*i*th Bernstein polynomial of degree *n* (*uorder* = *n* + 1)
![Equation showing the Bernstein polynomial of degree
n.](images/map06.png) and () is the *j*th Bernstein polynomial of
degree *m* (*vorder* = *m* + 1) ![Equation showing the Bernstein
polynomial of degree m.](images/map07.png) Recall that ![Equations
showing equivalence to 1.](images/map08.png) The **glMap2** function
is used to define the basis and to specify what kind of values are
produced. Once defined, a map can be enabled and disabled by calling
[**glEnable**](glenable.md) and **glDisable** with the map name, one
of the nine predefined values for *target*, described above. When
[**glEvalCoord2**](glevalcoord-functions.md) presents values *u* and
*v*, the bivariate Bernstein polynomials are evaluated using *u*^ and
*v*^, where ![Equation showing the definition of
u^.](images/map09.png) and ![Equation showing the definition of
v^.](images/map10.png) The *target* parameter is a symbolic constant
that indicates what kind of control points are provided in *points*,
and what output is generated when the map is evaluated. The
*ustride*, *uorder*, *vstride*, *vorder*, and *points* parameters
define the array addressing for accessing the control points. The
*points* parameter is the location of the first control point, which
occupies one, two, three, or four contiguous memory locations,
depending on which map is being defined. There are *uorder* x
*vorder* control points in the array. The *ustride* parameter tells
how many float or double locations are skipped to advance the
internal memory pointer from control point **R** *ij* to control
point **R** (\ i+1\ )j. The *vstride* parameter tells how many float
or double locations are skipped to advance the internal memory
pointer from control point **R** *ij* to control point **R**i(j\ +1\
). As is the case with all OpenGL commands that accept pointers to
data, it is as if the contents of *points* were copied by **glMap2**
before it returned. Changes to the contents of *points* have no
effect after **glMap2** is called. The following functions retrieve
information related to **glMap2**:
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_MAX\_EVAL\_ORDER [**glGetMap**](glgetmap.md)
[**glIsEnabled**](glisenabled.md) with argument GL\_MAP2\_VERTEX\_3
**glIsEnabled** with argument GL\_MAP2\_VERTEX\_4 **glIsEnabled**
with argument GL\_MAP2\_INDEX **glIsEnabled** with argument
GL\_MAP2\_COLOR\_4 **glIsEnabled** with argument GL\_MAP2\_NORMAL
**glIsEnabled** with argument GL\_MAP2\_TEXTURE\_COORD\_1
**glIsEnabled** with argument GL\_MAP2\_TEXTURE\_COORD\_2
**glIsEnabled** with argument GL\_MAP2\_TEXTURE\_COORD\_3
**glIsEnabled** with argument GL\_MAP2\_TEXTURE\_COORD\_4


%index
glMap2f
The glMap2f function defines a two-dimensional evaluator. | glMap2f function (Gl.h)
%group
Win32 opengl32
%prm
target, u1, u2, ustride, uorder, v1, v2, vstride, vorder, points
target : [int] The kind of values that are generated by the evaluator. The following symbolic constants are accepted.
u1 : [float] A linear mapping of *u*, as presented to [**glEvalCoord2**](glevalcoord-functions.md), to *u*^, one of the two variables that is evaluated by the equations specified by this command.
u2 : [float] A linear mapping of *u*, as presented to [**glEvalCoord2**](glevalcoord-functions.md), to *u*^, one of the two variables that is evaluated by the equations specified by this command.
ustride : [int] The number of floats or doubles between the beginning of control point **R** *ij* and the beginning of control point **R** (i\ +1\ )\ j, where *i* and *j* are the *u* and *v* control point indexes, respectively. This allows control points to be embedded in arbitrary data structures. The only constraint is that the values for a particular control point must occupy contiguous memory locations.
uorder : [int] The dimension of the control point array in the *u*-axis. Must be positive.
v1 : [float] A linear mapping of *v*, as presented to [**glEvalCoord2**](glevalcoord-functions.md), to *v*^, one of the two variables that is evaluated by the equations specified by this command.
v2 : [float] A linear mapping of *v*, as presented to [**glEvalCoord2**](glevalcoord-functions.md), to *v*^, one of the two variables that is evaluated by the equations specified by this command.
vstride : [int] The number of floats or doubles between the beginning of control point **R** *ij* and the beginning of control point **R** i(j\ +1\ ), where *i* and *j* are the *u* and *v* control point indexes, respectively. This allows control points to be embedded in arbitrary data structures. The only constraint is that the values for a particular control point must occupy contiguous memory locations.
vorder : [int] The dimension of the control point array in the *v*-axis. Must be positive.
points : [var] A pointer to the array of control points.
%inst
The glMap2f function defines a two-dimensional evaluator. | glMap2f
function (Gl.h)

[戻り値]
This function does not return a value.

[備考]
Evaluators provide a way to use polynomial or rational polynomial
mapping to produce vertices, normals, texture coordinates, and
colors. The values produced by an evaluator are sent on to further
stages of OpenGL processing just as if they had been presented using
[**glVertex**](glvertex-functions.md),
[**glNormal**](glnormal-functions.md),
[**glTexCoord**](gltexcoord-functions.md), and
[**glColor**](glcolor-functions.md) commands, except that the
generated values do not update the current normal, texture
coordinates, or color. All polynomial or rational polynomial splines
of any degree (up to the maximum degree supported by the OpenGL
implementation) can be described using evaluators. These include
almost all surfaces used in computer graphics, including B-spline
surfaces, NURBS surfaces, Bezier surfaces, and so on. Evaluators
define surfaces based on bivariate Bernstein polynomials. Define
**p** (*u*^,*v*^) as ![Equation showing the definition of p
().](images/map05.png) where **R** *ij* is a control point, () is the
*i*th Bernstein polynomial of degree *n* (*uorder* = *n* + 1)
![Equation showing the Bernstein polynomial of degree
n.](images/map06.png) and () is the *j*th Bernstein polynomial of
degree *m* (*vorder* = *m* + 1) ![Equation showing the Bernstein
polynomial of degree m.](images/map07.png) Recall that ![Equations
showing equivalence to 1.](images/map08.png) The **glMap2** function
is used to define the basis and to specify what kind of values are
produced. Once defined, a map can be enabled and disabled by calling
[**glEnable**](glenable.md) and **glDisable** with the map name, one
of the nine predefined values for *target*, described above. When
[**glEvalCoord2**](glevalcoord-functions.md) presents values *u* and
*v*, the bivariate Bernstein polynomials are evaluated using *u*^ and
*v*^, where ![Equation showing the definition of
u^.](images/map09.png) and ![Equation showing the definition of
v^.](images/map10.png) The *target* parameter is a symbolic constant
that indicates what kind of control points are provided in *points*,
and what output is generated when the map is evaluated. The
*ustride*, *uorder*, *vstride*, *vorder*, and *points* parameters
define the array addressing for accessing the control points. The
*points* parameter is the location of the first control point, which
occupies one, two, three, or four contiguous memory locations,
depending on which map is being defined. There are *uorder* x
*vorder* control points in the array. The *ustride* parameter tells
how many float or double locations are skipped to advance the
internal memory pointer from control point **R** *ij* to control
point **R** (\ i+1\ )j. The *vstride* parameter tells how many float
or double locations are skipped to advance the internal memory
pointer from control point **R** *ij* to control point **R**i(j\ +1\
). As is the case with all OpenGL commands that accept pointers to
data, it is as if the contents of *points* were copied by **glMap2**
before it returned. Changes to the contents of *points* have no
effect after **glMap2** is called. The following functions retrieve
information related to **glMap2**:
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_MAX\_EVAL\_ORDER [**glGetMap**](glgetmap.md)
[**glIsEnabled**](glisenabled.md) with argument GL\_MAP2\_VERTEX\_3
**glIsEnabled** with argument GL\_MAP2\_VERTEX\_4 **glIsEnabled**
with argument GL\_MAP2\_INDEX **glIsEnabled** with argument
GL\_MAP2\_COLOR\_4 **glIsEnabled** with argument GL\_MAP2\_NORMAL
**glIsEnabled** with argument GL\_MAP2\_TEXTURE\_COORD\_1
**glIsEnabled** with argument GL\_MAP2\_TEXTURE\_COORD\_2
**glIsEnabled** with argument GL\_MAP2\_TEXTURE\_COORD\_3
**glIsEnabled** with argument GL\_MAP2\_TEXTURE\_COORD\_4


%index
glMapGrid1d
Defines a one-dimensional mesh. | glMapGrid1d function (Gl.h)
%group
Win32 opengl32
%prm
un, u1, u2
un : [int] The number of partitions in the grid range interval \[u1, u2\]. This value must be positive.
u1 : [double] A value used as the mapping for integer grid domain value i = 0.
u2 : [double] A value used as the mapping for integer grid domain value i = un.
%inst
Defines a one-dimensional mesh. | glMapGrid1d function (Gl.h)

[戻り値]
This function does not return a value.

[備考]
Use the **glMapGrid** and [glEvalMesh](glevalmesh-functions.md)
functions togetherto efficiently generate and evaluate a series of
evenly spaced map domain values. The glEvalMesh function steps
through the integer domain of a one- or two-dimensional grid, whose
range is the domain of the evaluation maps specified by
[**glMap1**](glmap1.md) and [**glMap2**](glmap2.md). The
**glMapGrid1** and [**glMapGrid2**](glmapgrid2d.md) functions specify
the linear grid mappings between the i (or i and j) integer grid
coordinates, to the u (or u and v) floating-point evaluation map
coordinates. See [**glMap1**](glmap1.md) and [**glMap2**](glmap2.md)
for details of how u and v coordinates are evaluated. The
**glMapGrid1** function specifies a single linear mapping such that
integer grid coordinate 0 maps exactly to u1, and integer grid
coordinate *un* maps exactly to *u2*. All other integer grid
coordinates *i* are mapped such that: *u = i(u2 u1)/un + u1* The
[**glMapGrid2**](glmapgrid2d.md) function specifies two such linear
mappings. One maps integer grid coordinate *i = 0* exactly to *u1*,
and integer grid coordinate *i = un* exactly to *u2*. The other maps
integer grid coordinate *j = 0* exactly to *v1*, and integer grid
coordinate *j = vn* exactly to *v2*. Other integer grid coordinates i
and j are mapped such that *u = i(u2 u1)/un + u1* *v = j (v2 v1)/vn +
v1* The mappings specified by **glMapGrid** are used identically by
[glEvalMesh](glevalmesh-functions.md) and
[**glEvalPoint**](glevalpoint.md). The following functions retrieve
information related to **glMapGrid**:
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_MAP1\_GRID\_DOMAIN
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_MAP2\_GRID\_DOMAIN
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_MAP1\_GRID\_SEGMENTS
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_MAP2\_GRID\_SEGMENTS


%index
glMapGrid1f
Defines a one-dimensional mesh. | glMapGrid1f function (Gl.h)
%group
Win32 opengl32
%prm
un, u1, u2
un : [int] The number of partitions in the grid range interval \[u1, u2\]. This value must be positive.
u1 : [float] A value used as the mapping for integer grid domain value i = 0.
u2 : [float] A value used as the mapping for integer grid domain value i = un.
%inst
Defines a one-dimensional mesh. | glMapGrid1f function (Gl.h)

[戻り値]
This function does not return a value.

[備考]
The **glMapGrid** and [glEvalMesh](glevalmesh-functions.md) functions
are used in tandem to efficiently generate and evaluate a series of
evenly spaced map domain values. The glEvalMesh function steps
through the integer domain of a one- or two-dimensional grid, whose
range is the domain of the evaluation maps specified by
[**glMap1**](glmap1.md) and [**glMap2**](glmap2.md). The
[**glMapGrid1**](glmapgrid1d.md) and [**glMapGrid2**](glmapgrid2d.md)
functions specify the linear grid mappings between the i (or i and j)
integer grid coordinates, to the u (or u and v) floating-point
evaluation map coordinates. See [**glMap1**](glmap1.md) and
[**glMap2**](glmap2.md) for details of how u and v coordinates are
evaluated. The [**glMapGrid1**](glmapgrid1d.md) function specifies a
single linear mapping such that integer grid coordinate 0 maps
exactly to u1, and integer grid coordinate *un* maps exactly to *u2*.
All other integer grid coordinates *i* are mapped such that: *u =
i(u2 u1)/un + u1* The [**glMapGrid2**](glmapgrid2d.md) function
specifies two such linear mappings. One maps integer grid coordinate
*i = 0* exactly to *u1*, and integer grid coordinate *i = un* exactly
to *u2*. The other maps integer grid coordinate *j = 0* exactly to
*v1*, and integer grid coordinate *j = vn* exactly to *v2*. Other
integer grid coordinates i and j are mapped such that *u = i(u2
u1)/un + u1* *v = j (v2 v1)/vn + v1* The mappings specified by
[**glMapGrid**](glmapgrid1d.md) are used identically by
[glEvalMesh](glevalmesh-functions.md) and
[**glEvalPoint**](glevalpoint.md). The following functions retrieve
information related to [**glMapGrid**](glmapgrid1d.md):
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_MAP1\_GRID\_DOMAIN
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_MAP2\_GRID\_DOMAIN
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_MAP1\_GRID\_SEGMENTS
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_MAP2\_GRID\_SEGMENTS


%index
glMapGrid2d
Defines a one-dimensional mesh. | glMapGrid2d function (Gl.h)
%group
Win32 opengl32
%prm
un, u1, u2, vn, v1, v2
un : [int] The number of partitions in the grid range interval \[u1, u2\]. This value must be positive.
u1 : [double] A value used as the mapping for integer grid domain value i = 0.
u2 : [double] A value used as the mapping for integer grid domain value i = un.
vn : [int] The number of partitions in the grid range interval \[v1, v2\].
v1 : [double] A value used as the mapping for integer grid domain value j = 0.
v2 : [double] A value used as the mapping for integer grid domain value j = vn.
%inst
Defines a one-dimensional mesh. | glMapGrid2d function (Gl.h)

[戻り値]
This function does not return a value.

[備考]
The **glMapGrid** and [glEvalMesh](glevalmesh-functions.md) functions
are used in tandem to efficiently generate and evaluate a series of
evenly spaced map domain values. The glEvalMesh function steps
through the integer domain of a one- or two-dimensional grid, whose
range is the domain of the evaluation maps specified by
[**glMap1**](glmap1.md) and [**glMap2**](glmap2.md). The
[**glMapGrid1**](glmapgrid1d.md) and **glMapGrid2** functions specify
the linear grid mappings between the i (or i and j) integer grid
coordinates, to the u (or u and v) floating-point evaluation map
coordinates. See [**glMap1**](glmap1.md) and [**glMap2**](glmap2.md)
for details of how u and v coordinates are evaluated. The
[**glMapGrid1**](glmapgrid1d.md) function specifies a single linear
mapping such that integer grid coordinate 0 maps exactly to u1, and
integer grid coordinate *un* maps exactly to *u2*. All other integer
grid coordinates *i* are mapped such that: *u = i(u2 u1)/un + u1* The
**glMapGrid2** function specifies two such linear mappings. One maps
integer grid coordinate *i = 0* exactly to *u1*, and integer grid
coordinate *i = un* exactly to *u2*. The other maps integer grid
coordinate *j = 0* exactly to *v1*, and integer grid coordinate *j =
vn* exactly to *v2*. Other integer grid coordinates i and j are
mapped such that *u = i(u2 u1)/un + u1* *v = j (v2 v1)/vn + v1* The
mappings specified by [**glMapGrid**](glmapgrid1d.md) are used
identically by [glEvalMesh](glevalmesh-functions.md) and
[**glEvalPoint**](glevalpoint.md). The following functions retrieve
information related to [**glMapGrid**](glmapgrid1d.md):
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_MAP1\_GRID\_DOMAIN
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_MAP2\_GRID\_DOMAIN
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_MAP1\_GRID\_SEGMENTS
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_MAP2\_GRID\_SEGMENTS


%index
glMapGrid2f
Defines a one-dimensional mesh. | glMapGrid2f function (Gl.h)
%group
Win32 opengl32
%prm
un, u1, u2, vn, v1, v2
un : [int] The number of partitions in the grid range interval \[u1, u2\]. This value must be positive.
u1 : [float] A value used as the mapping for integer grid domain value i = 0.
u2 : [float] A value used as the mapping for integer grid domain value i = un.
vn : [int] The number of partitions in the grid range interval \[v1, v2\].
v1 : [float] A value used as the mapping for integer grid domain value j = 0.
v2 : [float] A value used as the mapping for integer grid domain value j = vn.
%inst
Defines a one-dimensional mesh. | glMapGrid2f function (Gl.h)

[戻り値]
This function does not return a value.

[備考]
The **glMapGrid** and [glEvalMesh](glevalmesh-functions.md) functions
are used in tandem to efficiently generate and evaluate a series of
evenly spaced map domain values. The glEvalMesh function steps
through the integer domain of a one- or two-dimensional grid, whose
range is the domain of the evaluation maps specified by
[**glMap1**](glmap1.md) and [**glMap2**](glmap2.md). The
[**glMapGrid1**](glmapgrid1d.md) and [**glMapGrid2**](glmapgrid2d.md)
functions specify the linear grid mappings between the i (or i and j)
integer grid coordinates, to the u (or u and v) floating-point
evaluation map coordinates. See [**glMap1**](glmap1.md) and
[**glMap2**](glmap2.md) for details of how u and v coordinates are
evaluated. The [**glMapGrid1**](glmapgrid1d.md) function specifies a
single linear mapping such that integer grid coordinate 0 maps
exactly to u1, and integer grid coordinate *un* maps exactly to *u2*.
All other integer grid coordinates *i* are mapped such that: *u =
i(u2 u1)/un + u1* The [**glMapGrid2**](glmapgrid2d.md) function
specifies two such linear mappings. One maps integer grid coordinate
*i = 0* exactly to *u1*, and integer grid coordinate *i = un* exactly
to *u2*. The other maps integer grid coordinate *j = 0* exactly to
*v1*, and integer grid coordinate *j = vn* exactly to *v2*. Other
integer grid coordinates i and j are mapped such that *u = i(u2
u1)/un + u1* *v = j (v2 v1)/vn + v1* The mappings specified by
[**glMapGrid**](glmapgrid1d.md) are used identically by
[glEvalMesh](glevalmesh-functions.md) and
[**glEvalPoint**](glevalpoint.md). The following functions retrieve
information related to [**glMapGrid**](glmapgrid1d.md):
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_MAP1\_GRID\_DOMAIN
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_MAP2\_GRID\_DOMAIN
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_MAP1\_GRID\_SEGMENTS
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_MAP2\_GRID\_SEGMENTS


%index
glMaterialf
The glMaterialf function specifies material parameters for the lighting model.
%group
Win32 opengl32
%prm
face, pname, param2
face : [int] The face or faces that are being updated. Must be one of the following: GL\_FRONT, GL\_BACK, or GL\_FRONT and GL\_BACK.
pname : [int] The single-valued material parameter of the face or faces being updated. Must be GL\_SHININESS.
param2 : [float] 
%inst
The glMaterialf function specifies material parameters for the
lighting model.

[戻り値]
This function does not return a value.

[備考]
The **glMaterialf** function assigns values to material parameters.
There are two matched sets of material parameters. One, the
*front-facing* set, is used to shade points, lines, bitmaps, and all
polygons (when two-sided lighting is disabled), or just front-facing
polygons (when two-sided lighting is enabled). The other set,
*back-facing*, is used to shade back-facing polygons only when
two-sided lighting is enabled. Refer to
[**glLightModel**](gllightmodel-functions.md) for details concerning
one-sided and two-sided lighting calculations. The **glMaterialf**
function takes three arguments. The first, *face*, specifies whether
the GL\_FRONT materials, the GL\_BACK materials, or both
GL\_FRONT\_AND\_BACK materials will be modified. The second, *pname*,
specifies which of several parameters in one or both sets will be
modified. The third, *param*, specifies what value will be assigned
to the specified parameter. Material parameters are used in the
lighting equation that is optionally applied to each vertex. The
equation is discussed in
[**glLightModel**](gllightmodel-functions.md). The material
parameters can be updated at any time. In particular, **glMaterialf**
can be called between a call to [**glBegin**](glbegin.md) and the
corresponding call to [**glEnd**](glend.md). If only a single
material parameter is to be changed per vertex, however,
[**glColorMaterial**](glcolormaterial.md) is preferred over
**glMaterialf**. The following function retrieves information related
to **glMaterialf**: [**glGetMaterial**](glgetmaterial.md)


%index
glMaterialfv
The glMaterialfv function specifies material parameters for the lighting model.
%group
Win32 opengl32
%prm
face, pname, params
face : [int] The face or faces that are being updated. Must be one of the following: GL\_FRONT, GL\_BACK, or GL\_FRONT and GL\_BACK.
pname : [int] The material parameter of the face or faces being updated. The parameters that can be specified using **glMaterialfv**, and their interpretations by the lighting equation, are as follows.
params : [int] 
%inst
The glMaterialfv function specifies material parameters for the
lighting model.

[戻り値]
This function does not return a value.

[備考]
The [**glMaterialfv**](glmaterialf.md) function assigns values to
material parameters. There are two matched sets of material
parameters. One, the *front-facing* set, is used to shade points,
lines, bitmaps, and all polygons (when two-sided lighting is
disabled), or just front-facing polygons (when two-sided lighting is
enabled). The other set, *back-facing*, is used to shade back-facing
polygons only when two-sided lighting is enabled. Refer to
[**glLightModel**](gllightmodel-functions.md) for details concerning
one-sided and two-sided lighting calculations. The
[**glMaterialfv**](glmaterialf.md) function takes three arguments.
The first, *face*, specifies whether the GL\_FRONT materials, the
GL\_BACK materials, or both GL\_FRONT\_AND\_BACK materials will be
modified. The second, *pname*, specifies which of several parameters
in one or both sets will be modified. The third, *param*, specifies
what value will be assigned to the specified parameter. Material
parameters are used in the lighting equation that is optionally
applied to each vertex. The equation is discussed in
[**glLightModel**](gllightmodel-functions.md). The material
parameters can be updated at any time. In particular,
[**glMaterialfv**](glmaterialf.md) can be called between a call to
[**glBegin**](glbegin.md) and the corresponding call to
[**glEnd**](glend.md). If only a single material parameter is to be
changed per vertex, however,
[**glColorMaterial**](glcolormaterial.md) is preferred over
**glMaterialfv**. The following function retrieves information
related to [**glMaterialfv**](glmaterialf.md):
[**glGetMaterial**](glgetmaterial.md)


%index
glMateriali
TheglMateriali function specifies material parameters for the lighting model.
%group
Win32 opengl32
%prm
face, pname, param2
face : [int] The face or faces that are being updated. Must be one of the following: GL\_FRONT, GL\_BACK, or GL\_FRONT and GL\_BACK.
pname : [int] The single-valued material parameter of the face or faces being updated. Must be GL\_SHININESS.
param2 : [int] 
%inst
TheglMateriali function specifies material parameters for the
lighting model.

[戻り値]
This function does not return a value.

[備考]
The **glMateriali** function assigns values to material parameters.
There are two matched sets of material parameters. One, the
*front-facing* set, is used to shade points, lines, bitmaps, and all
polygons (when two-sided lighting is disabled), or just front-facing
polygons (when two-sided lighting is enabled). The other set,
*back-facing*, is used to shade back-facing polygons only when
two-sided lighting is enabled. Refer to
[**glLightModel**](gllightmodel-functions.md) for details concerning
one-sided and two-sided lighting calculations. The **glMateriali**
function takes three arguments. The first, *face*, specifies whether
the GL\_FRONT materials, the GL\_BACK materials, or both
GL\_FRONT\_AND\_BACK materials will be modified. The second, *pname*,
specifies which of several parameters in one or both sets will be
modified. The third, *param*, specifies what value will be assigned
to the specified parameter. Material parameters are used in the
lighting equation that is optionally applied to each vertex. The
equation is discussed in
[**glLightModel**](gllightmodel-functions.md). The material
parameters can be updated at any time. In particular, **glMateriali**
can be called between a call to [**glBegin**](glbegin.md) and the
corresponding call to [**glEnd**](glend.md). If only a single
material parameter is to be changed per vertex, however,
[**glColorMaterial**](glcolormaterial.md) is preferred over
**glMateriali**. The following function retrieves information related
to **glMateriali**: [**glGetMaterial**](glgetmaterial.md)


%index
glMaterialiv
The glMaterialiv function specifies material parameters for the lighting model.
%group
Win32 opengl32
%prm
face, pname, params
face : [int] The face or faces that are being updated. Must be one of the following: GL\_FRONT, GL\_BACK, or GL\_FRONT and GL\_BACK.
pname : [int] The material parameter of the face or faces being updated. The parameters that can be specified using [**glMaterialiv**](glmaterialfv.md), and their interpretations by the lighting equation, are as follows.
params : [int] 
%inst
The glMaterialiv function specifies material parameters for the
lighting model.

[戻り値]
This function does not return a value.

[備考]
The [**glMaterialiv**](glmaterialf.md) function assigns values to
material parameters. There are two matched sets of material
parameters. One, the *front-facing* set, is used to shade points,
lines, bitmaps, and all polygons (when two-sided lighting is
disabled), or just front-facing polygons (when two-sided lighting is
enabled). The other set, *back-facing*, is used to shade back-facing
polygons only when two-sided lighting is enabled. Refer to
[**glLightModel**](gllightmodel-functions.md) for details concerning
one-sided and two-sided lighting calculations. The
[**glMaterialiv**](glmaterialf.md) function takes three arguments.
The first, *face*, specifies whether the GL\_FRONT materials, the
GL\_BACK materials, or both GL\_FRONT\_AND\_BACK materials will be
modified. The second, *pname*, specifies which of several parameters
in one or both sets will be modified. The third, *param*, specifies
what value will be assigned to the specified parameter. Material
parameters are used in the lighting equation that is optionally
applied to each vertex. The equation is discussed in
[**glLightModel**](gllightmodel-functions.md). The material
parameters can be updated at any time. In particular,
[**glMaterialiv**](glmaterialf.md) can be called between a call to
[**glBegin**](glbegin.md) and the corresponding call to
[**glEnd**](glend.md). If only a single material parameter is to be
changed per vertex, however,
[**glColorMaterial**](glcolormaterial.md) is preferred over
**glMaterialiv**. The following function retrieves information
related to [**glMaterialiv**](glmaterialf.md):
[**glGetMaterial**](glgetmaterial.md)


%index
glMatrixMode
The glMatrixMode function specifies which matrix is the current matrix.
%group
Win32 opengl32
%prm
mode
mode : [int] The matrix stack that is the target for subsequent matrix operations. The *mode* parameter can assume one of three values.
%inst
The glMatrixMode function specifies which matrix is the current
matrix.

[戻り値]
This function does not return a value.

[備考]
The **glMatrixMode** function sets the current matrix mode. The
following function retrieves information related to **glMatrixMode**:
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_MATRIX\_MODE


%index
glMultMatrixd
The glMultMatrixd function multiplies the current matrix by an arbitrary matrix. | glMultMatrixd function (Gl.h)
%group
Win32 opengl32
%prm
m
m : [var] A pointer to a 4x4 matrix stored in column-major order as 16 consecutive values.
%inst
The glMultMatrixd function multiplies the current matrix by an
arbitrary matrix. | glMultMatrixd function (Gl.h)

[戻り値]
This function does not return a value.

[備考]
The **glMultMatrix** function multiplies the current matrix by the
one specified in *m*. That is, if M is the current matrix and T is
the matrix passed to **glMultMatrix**, then M is replaced with M T.
The current matrix is the projection matrix, modelview matrix, or
texture matrix, determined by the current matrix mode (see
[**glMatrixMode**](glmatrixmode.md)). The *m* parameter points to a
4x4 matrix of single-precision or double-precision floating-point
values stored in column-major order. That is, the matrix is stored as
shown in the following image. ![![Diagram showing the 4x4 matrix that
the m parameter points to.]](images/multi01.png) The following
functions retrieve information related to **glMultMatrix**:
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_MATRIX\_MODE **glGet** with argument
GL\_MODELVIEW\_MATRIX **glGet** with argument GL\_PROJECTION\_MATRIX
**glGet** with argument GL\_TEXTURE\_MATRIX


%index
glMultMatrixf
The glMultMatrixf function multiplies the current matrix by an arbitrary matrix. | glMultMatrixf function (Gl.h)
%group
Win32 opengl32
%prm
m
m : [var] A pointer to a 4x4 matrix stored in column-major order as 16 consecutive values.
%inst
The glMultMatrixf function multiplies the current matrix by an
arbitrary matrix. | glMultMatrixf function (Gl.h)

[戻り値]
This function does not return a value.

[備考]
The **glMultMatrix** function multiplies the current matrix by the
one specified in *m*. That is, if M is the current matrix and T is
the matrix passed to **glMultMatrix**, then M is replaced with M T.
The current matrix is the projection matrix, modelview matrix, or
texture matrix, determined by the current matrix mode (see
[**glMatrixMode**](glmatrixmode.md)). The *m* parameter points to a
4x4 matrix of single-precision or double-precision floating-point
values stored in column-major order. That is, the matrix is stored as
shown in the following image. ![![Diagram showing the 4x4 matrix that
the m parameter points to.]](images/multi01.png) The following
functions retrieve information related to **glMultMatrix**:
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_MATRIX\_MODE **glGet** with argument
GL\_MODELVIEW\_MATRIX **glGet** with argument GL\_PROJECTION\_MATRIX
**glGet** with argument GL\_TEXTURE\_MATRIX


%index
glNewList
The glNewList and glEndList functions create or replace a display list. | glNewList function (Gl.h)
%group
Win32 opengl32
%prm
list, mode
list : [int] The display list name.
mode : [int] The compilation mode. The following values are accepted.
%inst
The glNewList and glEndList functions create or replace a display
list. | glNewList function (Gl.h)

[戻り値]
This function does not return a value.

[備考]
Display lists are groups of OpenGL commands that have been stored for
subsequent execution. The display lists are created with
**glNewList**. All subsequent commands are placed in the display
list, in the order issued, until **glEndList** is called. The
**glNewList** function has two parameters. The first parameter,
*list*, is a positive integer that becomes the unique name for the
display list. Names can be created and reserved with
[**glGenLists**](glgenlists.md) and tested for uniqueness with
[**glIsList**](glislist.md). The second parameter, *mode*, is a
symbolic constant that can assume one of the two preceding values.
Certain commands are not compiled into the display list, but are
executed immediately, regardless of the display list mode. These
commands are [**glColorPointer**](glcolorpointer.md),
[**glDeleteLists**](gldeletelists.md),
[**glDisableClientState**](gldisableclientstate.md),
[**glEdgeFlagPointer**](gledgeflagpointer.md),
[**glEnableClientState**](glenableclientstate.md),
[**glFeedbackBuffer**](glfeedbackbuffer.md),
[**glFinish**](glfinish.md), [**glFlush**](glflush.md),
[**glGenLists**](glgenlists.md),
[**glIndexPointer**](glindexpointer.md),
[**glInterleavedArrays**](glinterleavedarrays.md),
[**glIsEnabled**](glisenabled.md), [**glIsList**](glislist.md),
[**glNormalPointer**](glnormalpointer.md),
[**glPopClientAttrib**](glpopclientattrib.md),
[**glPixelStore**](glpixelstore-functions.md),
[**glPushClientAttrib**](glpushclientattrib.md),
[**glReadPixels**](glreadpixels.md),
[**glRenderMode**](glrendermode.md),
[**glSelectBuffer**](glselectbuffer.md),
[**glTexCoordPointer**](gltexcoordpointer.md),
[**glVertexPointer**](glvertexpointer.md), and all of the
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
routines. Similarly, [**glTexImage2D**](glteximage2d.md) and
[**glTexImage1D**](glteximage1d.md) are executed immediately and not
compiled into the display list when their first argument is
GL\_PROXY\_TEXTURE\_2D or GL\_PROXY\_TEXTURE\_1D, respectively. When
the **glEndList** function is encountered, the display list
definition is completed by associating the list with the unique name
*list* (specified in the **glNewList** command). If a display list
with name *list* already exists, it is replaced only when
**glEndList** is called. The [**glCallList**](glcalllist.md) and
[**glCallLists**](glcalllists.md) functions can be entered into
display lists. The commands in the display list or lists executed by
**glCallList** or **glCallLists** are not included in the display
list being created, even if the list creation mode is
GL\_COMPILE\_AND\_EXECUTE. The following function retrieves
information related to **glNewList**:
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_MATRIX\_MODE


%index
glNormal3b
Sets the current normal vector. | glNormal3b function (Gl.h)
%group
Win32 opengl32
%prm
nx, ny, nz
nx : [int] Specifies the x-coordinate for the new current normal vector.
ny : [int] Specifies the y-coordinate for the new current normal vector.
nz : [int] Specifies the z-coordinate for the new current normal vector.
%inst
Sets the current normal vector. | glNormal3b function (Gl.h)

[戻り値]
This function does not return a value.

[備考]
The current normal is set to the given coordinates whenever you call
the **glNormal3b** function. Byte, short, or integer arguments are
converted to floating-point format by using a linear mapping that
maps the most positive representable integer value to 1.0, and the
most negative representable integer value to -1.0. Normals specified
with **glNormal3b** need not have unit length. If normalization is
enabled, then normals specified with **glNormal3b** are normalized
after transformation. You can control normalization by using
[**glEnable**](glenable.md) and [**glDisable**](gldisable.md) with
the argument GL\_NORMALIZE. By default, normalization is disabled.
You can update the current normal at any time. In particular, you can
call**glNormal3b**between a call to [**glBegin**](glbegin.md) and the
corresponding call to [**glEnd**](glend.md). The following functions
retrieve information related to **glNormal3b**:
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_NORMAL [**glIsEnable**](glisenabled.md)
with argument GL\_NORMALIZE


%index
glNormal3bv
Sets the current normal vector. | glNormal3bv function (Gl.h)
%group
Win32 opengl32
%prm
v
v : [var] A pointer to an array of three elements: the x, y, and z coordinates of the new current normal.
%inst
Sets the current normal vector. | glNormal3bv function (Gl.h)

[戻り値]
This function does not return a value.

[備考]
The current normal is set to the given coordinates whenever you call
the**glNormal3bv**function. Byte, short, or integer arguments are
converted to floating-point format by using a linear mapping that
maps the most positive representable integer value to 1.0, and the
most negative representable integer value to -1.0. Normals specified
by using**glNormal3bv** need not have unit length. If normalization
is enabled, then normals specified by using**glNormal3bv** are
normalized after transformation. You can control normalization by
using [**glEnable**](glenable.md) and [**glDisable**](gldisable.md)
with the argument GL\_NORMALIZE. By default, normalization is
disabled. You can update the current normal any time. In particular,
you can call **glNormal3bv**between a call to
[**glBegin**](glbegin.md) and the corresponding call to
[**glEnd**](glend.md). The following functions retrieve information
related to **glNormal3bv**:
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_NORMAL [**glIsEnable**](glisenabled.md)
with argument GL\_NORMALIZE


%index
glNormal3d
Sets the current normal vector. | glNormal3d function (Gl.h)
%group
Win32 opengl32
%prm
nx, ny, nz
nx : [double] Specifies the x-coordinate for the new current normal vector.
ny : [double] Specifies the y-coordinate for the new current normal vector.
nz : [double] Specifies the z-coordinate for the new current normal vector.
%inst
Sets the current normal vector. | glNormal3d function (Gl.h)

[戻り値]
This function does not return a value.

[備考]
The current normal is set to the given coordinates whenever you call
the **glNormal3d**function. Byte, short, or integer arguments are
converted to floating-point format by using a linear mapping that
maps the most positive representable integer value to 1.0, and the
most negative representable integer value to -1.0. Normals specified
by using**glNormal3d** need not have unit length. If normalization is
enabled, then normals specified with **glNormal3d** are normalized
after transformation. You can control normalization by using
[**glEnable**](glenable.md) and [**glDisable**](gldisable.md) with
the argument GL\_NORMALIZE. By default, normalization is disabled.
You can update the current normal at any time. In particular, you can
call**glNormal3d**between a call to [**glBegin**](glbegin.md) and the
corresponding call to [**glEnd**](glend.md). The following functions
retrieve information related to **glNormal3d**:
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_NORMAL [**glIsEnable**](glisenabled.md)
with argument GL\_NORMALIZE


%index
glNormal3dv
Sets the current normal vector. | glNormal3dv function (Gl.h)
%group
Win32 opengl32
%prm
v
v : [var] A pointer to an array of three elements: the x, y, and z coordinates of the new current normal.
%inst
Sets the current normal vector. | glNormal3dv function (Gl.h)

[戻り値]
This function does not return a value.

[備考]
The current normal is set to the given coordinates whenever you call
the **glNormal3dv**function. Byte, short, or integer arguments are
converted to floating-point format with a linear mapping that maps
the most positive representable integer value to 1.0, and the most
negative representable integer value to -1.0. Normals specified by
using**glNormal3dv** need not have unit length. If normalization is
enabled, then normals specified with **glNormal3dv** are normalized
after transformation. You can control normalization by using
[**glEnable**](glenable.md) and [**glDisable**](gldisable.md) with
the argument GL\_NORMALIZE. By default, normalization is disabled.
You can update the current normal at any time. In particular, you can
call**glNormal3dv**between a call to [**glBegin**](glbegin.md) and
the corresponding call to [**glEnd**](glend.md). The following
functions retrieve information related to **glNormal3dv**:
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_NORMAL [**glIsEnable**](glisenabled.md)
with argument GL\_NORMALIZE


%index
glNormal3f
Sets the current normal vector. | glNormal3f function (Gl.h)
%group
Win32 opengl32
%prm
nx, ny, nz
nx : [float] Specifies the x-coordinate for the new current normal vector.
ny : [float] Specifies the y-coordinate for the new current normal vector.
nz : [float] Specifies the z-coordinate for the new current normal vector.
%inst
Sets the current normal vector. | glNormal3f function (Gl.h)

[戻り値]
This function does not return a value.

[備考]
The current normal is set to the given coordinates whenever you call
the **glNormal3f** function. Byte, short, or integer arguments are
converted to floating-point format with a linear mapping that maps
the most positive representable integer value to 1.0, and the most
negative representable integer value to -1.0. Normals specified by
using **glNormal3f** need not have unit length. If normalization is
enabled, then normals specified with **glNormal3f** are normalized
after transformation. You can control normalization by using
[**glEnable**](glenable.md) and [**glDisable**](gldisable.md) with
the argument GL\_NORMALIZE. By default, normalization is disabled.
You can update the current normal at any time. In particular, you can
call **glNormal3f** between a call to [**glBegin**](glbegin.md) and
the corresponding call to [**glEnd**](glend.md). The following
functions retrieve information related to **glNormal3f**:
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_NORMAL [**glIsEnable**](glisenabled.md)
with argument GL\_NORMALIZE


%index
glNormal3fv
Sets the current normal vector. | glNormal3fv function (Gl.h)
%group
Win32 opengl32
%prm
v
v : [var] A pointer to an array of three elements: the x, y, and z coordinates of the new current normal.
%inst
Sets the current normal vector. | glNormal3fv function (Gl.h)

[戻り値]
This function does not return a value.

[備考]
The current normal is set to the given coordinates whenever you call
the**glNormal3fv**function. Byte, short, or integer arguments are
converted to floating-point format with a linear mapping that maps
the most positive representable integer value to 1.0, and the most
negative representable integer value to -1.0. Normals specified by
using**glNormal3fv** need not have unit length. If normalization is
enabled, then normals specified with **glNormal3fv** are normalized
after transformation. You can control normalization by using
[**glEnable**](glenable.md) and [**glDisable**](gldisable.md) with
the argument GL\_NORMALIZE. By default, normalization is disabled.
You can update the current normal can at any time. In particular, you
can call**glNormal3fv** between a call to [**glBegin**](glbegin.md)
and the corresponding call to [**glEnd**](glend.md). The following
functions retrieve information related to **glNormal3fv**:
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_NORMAL [**glIsEnable**](glisenabled.md)
with argument GL\_NORMALIZE


%index
glNormal3i
Sets the current normal vector. | glNormal3i function (Gl.h)
%group
Win32 opengl32
%prm
nx, ny, nz
nx : [int] Specifies the x-coordinate for the new current normal vector.
ny : [int] Specifies the y-coordinate for the new current normal vector.
nz : [int] Specifies the z-coordinate for the new current normal vector.
%inst
Sets the current normal vector. | glNormal3i function (Gl.h)

[戻り値]
This function does not return a value.

[備考]
The current normal is set to the given coordinates whenever you call
the **glNormal3i**function. Byte, short, or integer arguments are
converted to floating-point format with a linear mapping that maps
the most positive representable integer value to 1.0, and the most
negative representable integer value to -1.0. Normals specified by
using**glNormal3i** need not have unit length. If normalization is
enabled, then normals specified with **glNormal3i** are normalized
after transformation. You can control normalization by using
[**glEnable**](glenable.md) and [**glDisable**](gldisable.md) with
the argument GL\_NORMALIZE. By default, normalization is disabled.
You can update the current normal at any time. In particular, you can
call**glNormal3i**between a call to [**glBegin**](glbegin.md) and the
corresponding call to [**glEnd**](glend.md). The following functions
retrieve information related to **glNormal3i**:
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_NORMAL [**glIsEnable**](glisenabled.md)
with argument GL\_NORMALIZE


%index
glNormal3iv
Sets the current normal vector. | glNormal3iv function (Gl.h)
%group
Win32 opengl32
%prm
v
v : [var] A pointer to an array of three elements: the x, y, and z coordinates of the new current normal.
%inst
Sets the current normal vector. | glNormal3iv function (Gl.h)

[戻り値]
This function does not return a value.

[備考]
The current normal is set to the given coordinates whenever you call
the**glNormal3iv**function. Byte, short, or integer arguments are
converted to floating-point format with a linear mapping that maps
the most positive representable integer value to 1.0, and the most
negative representable integer value to -1.0. Normals specified by
using**glNormal3iv** need not have unit length. If normalization is
enabled, then normals specified with **glNormal3iv** are normalized
after transformation. You can control normalization by using
[**glEnable**](glenable.md) and [**glDisable**](gldisable.md) with
the argument GL\_NORMALIZE. By default, normalization is disabled.
You can update the current normal at any time. In particular, you can
call**glNormal3iv**between a call to [**glBegin**](glbegin.md) and
the corresponding call to [**glEnd**](glend.md). The following
functions retrieve information related to **glNormal3iv**:
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_NORMAL [**glIsEnable**](glisenabled.md)
with argument GL\_NORMALIZE


%index
glNormal3s
Sets the current normal vector. | glNormal3s function (Gl.h)
%group
Win32 opengl32
%prm
nx, ny, nz
nx : [int] Specifies the x-coordinate of the new current normal vector.
ny : [int] Specifies the y-coordinate of the new current normal vector.
nz : [int] Specifies the z-coordinate of the new current normal vector.
%inst
Sets the current normal vector. | glNormal3s function (Gl.h)

[戻り値]
This function does not return a value.

[備考]
The current normal is set to the given coordinates whenever you call
the**glNormal3s**function. Byte, short, or integer arguments are
converted to floating-point format with a linear mapping that maps
the most positive representable integer value to 1.0, and the most
negative representable integer value to -1.0. Normals specified by
using**glNormal3s** need not have unit length. If normalization is
enabled, then normals specified with **glNormal3s** are normalized
after transformation. You can control normalizationby using
[**glEnable**](glenable.md) and [**glDisable**](gldisable.md) with
the argument GL\_NORMALIZE. By default, normalization is disabled.
You can update the current normal at any time. In particular, you can
call**glNormal3s**between a call to [**glBegin**](glbegin.md) and the
corresponding call to [**glEnd**](glend.md). The following functions
retrieve information related to **glNormal3s**:
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_NORMAL [**glIsEnable**](glisenabled.md)
with argument GL\_NORMALIZE


%index
glNormal3sv
Sets the current normal vector. | glNormal3sv function (Gl.h)
%group
Win32 opengl32
%prm
v
v : [var] A pointer to an array of three elements: the x, y, and z coordinates of the new current normal.
%inst
Sets the current normal vector. | glNormal3sv function (Gl.h)

[戻り値]
This function does not return a value.

[備考]
The current normal is set to the given coordinates whenever you call
the **glNormal3sv** function. Byte, short, or integer arguments are
converted to floating-point format with a linear mapping that maps
the most positive representable integer value to 1.0, and the most
negative representable integer value to -1.0. Normals specified by
using **glNormal3sv** need not have unit length. If normalization is
enabled, then normals specified with **glNormal3sv** are normalized
after transformation. You can control normalization by using
[**glEnable**](glenable.md) and [**glDisable**](gldisable.md) with
the argument GL\_NORMALIZE. By default, normalization is disabled.
You can update the current normal at any time. In particular, you can
call **glNormal3sv** between a call to [**glBegin**](glbegin.md) and
the corresponding call to [**glEnd**](glend.md). The following
functions retrieve information related to **glNormal3sv**:
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_NORMAL [**glIsEnable**](glisenabled.md)
with argument GL\_NORMALIZE


%index
glNormalPointer
The glNormalPointer function defines an array of normals.
%group
Win32 opengl32
%prm
type, stride, pointer
type : [int] The data type of each coordinate in the array using the following symbolic constants: GL\_BYTE, GL\_SHORT, GL\_INT, GL\_FLOAT, and GL\_DOUBLE.
stride : [int] The byte offset between consecutive normals. When *stride* is zero, the normals are tightly packed in the array.
pointer : [intptr] A pointer to the first normal in the array.
%inst
The glNormalPointer function defines an array of normals.

[戻り値]
This function does not return a value.

[備考]
The **glNormalPointer** function specifies the location and data of
an array of normals to use when rendering. The *type* parameter
specifies the data type of each normal coordinate. The *stride*
parameter determines the byte offset from one normal to the next,
enabling the packing of vertices and attributes in a single array or
storage in separate arrays. In some implementations storing the
vertices and attributes in a single array can be more efficient than
using separate arrays; see
[**glInterleavedArrays**](glinterleavedarrays.md) for details. A
normal array is enabled when you specify the GL\_NORMAL\_ARRAY
constant with [**glEnableClientState**](glenableclientstate.md). When
enabled, [**glDrawArrays**](gldrawarrays.md),
[**glDrawElements**](gldrawelements.md) and
[**glArrayElement**](glarrayelement.md) use the normal array. By
default the normal array is disabled. You cannot include
**glNormalPointer** in display lists. When you specify a normal array
using **glNormalPointer**, the values of all the function's normal
array parameters are saved in a client-side state. Because the normal
array parameters are saved in a client-side state, their values are
not saved or restored by [**glPushAttrib**](glpushattrib.md) and
[**glPopAttrib**](glpopattrib.md). Although no error is generated
when you call **glNormalPointer** within [**glBegin**](glbegin.md)
and [**glEnd**](glend.md) pairs, the results are undefined. The
following functions are associated with **glNormalPointer**:
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_NORMAL\_ARRAY\_STRIDE **glGet** with argument
GL\_NORMAL\_ARRAY\_COUNT **glGet** with argument
GL\_NORMAL\_ARRAY\_TYPE **glGetPointerv** with argument
GL\_NORMAL\_ARRAY\_POINTER [**glIsEnabled**](glisenabled.md) with
argument GL\_NORMAL\_ARRAY


%index
glOrtho
The glOrtho function multiplies the current matrix by an orthographic matrix.
%group
Win32 opengl32
%prm
left, right, bottom, top, zNear, zFar
left : [double] The coordinates for the left vertical clipping plane.
right : [double] The coordinates for theright vertical clipping plane.
bottom : [double] The coordinates for the bottom horizontal clipping plane.
top : [double] The coordinates for the top horizontal clipping plans.
zNear : [double] The distances to the nearer depth clipping plane. This distance is negative if the plane is to be behind the viewer.
zFar : [double] The distances to the farther depth clipping plane. This distance is negative if the plane is to be behind the viewer.
%inst
The glOrtho function multiplies the current matrix by an orthographic
matrix.

[戻り値]
This function does not return a value.

[備考]
The **glOrtho** function describes a perspective matrix that produces
a parallel projection. The (*left*, *bottom*, *near*) and (*right*,
*top*, *near*) parameters specify the points on the near clipping
plane that are mapped to the lower-left and upper-right corners of
the window, respectively, assuming that the eye is located at (0, 0,
0). The *far* parameter specifies the location of the far clipping
plane. Both *zNear* and *zFar* can be either positive or negative.
The corresponding matrix is shown in the following image. ![Diagram
showing the perspective matrix the glOrtho function
describes.](images/ortho1.png) where ![Equations describing the
perspective matrix.](images/ortho2.png) The current matrix is
multiplied by this matrix with the result replacing the current
matrix. That is, if M is the current matrix and O is the ortho
matrix, then M is replaced with M O. Use
[**glPushMatrix**](glpushmatrix.md) and **glPopMatrix** to save and
restore the current matrix stack. Use
[**glMatrixMode**](glmatrixmode.md) to set the current matrix. The
following functions retrieve information related to **glOrtho**:
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_MATRIX\_MODE **glGet** with argument
GL\_MODELVIEW\_MATRIX **glGet** with argument GL\_PROJECTION\_MATRIX
**glGet** with argument GL\_TEXTURE\_MATRIX


%index
glPassThrough
The glPassThrough function places a marker in the feedback buffer.
%group
Win32 opengl32
%prm
token
token : [float] A marker value to be placed in the feedback buffer. It is indicated with the following unique identifying value.
%inst
The glPassThrough function places a marker in the feedback buffer.

[戻り値]
This function does not return a value.

[備考]
Feedback is an OpenGL render mode selected by calling
[**glRenderMode**](glrendermode.md) with GL\_FEEDBACK. When OpenGL is
in feedback mode, no pixels are produced by rasterization. Instead,
information about primitives that would have been rasterized is fed
back to the application by OpenGL. See
[**glFeedbackBuffer**](glfeedbackbuffer.md) for a description of the
feedback buffer and the values in it. The **glPassThrough** function
inserts a user-defined marker in the feedback buffer when it is
executed in feedback mode. The *token* parameter is returned as if it
were a primitive. The **glPassThrough** function is ignored if OpenGL
is not in feedback mode. The following function retrieves information
related to **glPassThrough**:
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_RENDER\_MODE


%index
glPixelMapfv
The glPixelMapfv function sets up pixel transfer maps.
%group
Win32 opengl32
%prm
map, mapsize, values
map : [int] A symbolic map name. The ten maps are as follows.
mapsize : [int] The size of the map being defined.
values : [var] An array of *mapsize* values.
%inst
The glPixelMapfv function sets up pixel transfer maps.

[戻り値]
This function does not return a value.

[備考]
The **glPixelMap** function sets up translation tables, or *maps*,
used by [**glCopyPixels**](glcopypixels.md),
[**glCopyTexImage1D**](glcopyteximage1d.md),
[**glCopyTexImage2D**](glcopyteximage2d.md),
[**glCopyTexSubImage1D**](glcopytexsubimage1d.md),
[**glCopyTexSubImage2D**](glcopytexsubimage2d.md),
[**glDrawPixels**](gldrawpixels.md),
[**glReadPixels**](glreadpixels.md),
[**glTexImage1D**](glteximage1d.md),
[**glTexImage2D**](glteximage2d.md),
[**glTexSubImage1D**](gltexsubimage1d.md), and
[**glTexSubImage2D**](gltexsubimage2d.md). Use of these maps is
described completely in the [**glPixelTransfer**](glpixeltransfer.md)
topic, and partly in the topics for the pixel and texture image
commands. Only the specification of the maps is described in this
topic. The *map* parameter is a symbolic map name, indicating one of
ten maps to set. The *mapsize* parameter specifies the number of
entries in the map, and *values* is a pointer to an array of
*mapsize* map values. The entries in a map can be specified as
single-precision floating-point numbers, unsigned short integers, or
unsigned long integers. Maps that store color component values (all
but GL\_PIXEL\_MAP\_I\_TO\_I and GL\_PIXEL\_MAP\_S\_TO\_S) retain
their values in floating-point format, with unspecified mantissa and
exponent sizes. Floating-point values specified by
[**glPixelMapfv**](glpixelmap.md) are converted directly to the
internal floating-point format of these maps, and then clamped to the
range \[0,1\]. Unsigned integer values specified by **glPixelMapusv**
and **glPixelMapuiv** are converted linearly such that the largest
representable integer maps to 1.0, and zero maps to 0.0. Maps that
store indexes, GL\_PIXEL\_MAP\_I\_TO\_I and GL\_PIXEL\_MAP\_S\_TO\_S,
retain their values in fixed-point format, with an unspecified number
of bits to the right of the binary point. Floating-point values
specified by [**glPixelMapfv**](glpixelmap.md) are converted directly
to the internal fixed-point format of these maps. Unsigned integer
values specified by **glPixelMapusv** and **glPixelMapuiv** specify
integer values, with all zeros to the right of the binary point. The
following table shows the initial sizes and values for each of the
maps. Maps that are indexed by either color or stencil indexes must
have *mapsize* = 2 ^ *n* for some *n* or results are undefined. The
maximum allowable size for each map depends on the implementation and
can be determined by calling **glGet** with argument
GL\_MAX\_PIXEL\_MAP\_TABLE. The single maximum applies to all maps,
and it is at least 32.
| Map | Lookup Index | Lookup Value | Initial Size | Initial Value |
|--------------------------|---------------|---------------|--------------|---------------|
| GL\_PIXEL\_MAP\_I\_TO\_I | color index | color index | 1 | 0.0 | |
GL\_PIXEL\_MAP\_S\_TO\_S | stencil index | stencil index | 1 | 0.0 |
| GL\_PIXEL\_MAP\_I\_TO\_R | color index | R | 1 | 0.0 | |
GL\_PIXEL\_MAP\_I\_TO\_G | color index | G | 1 | 0.0 | |
GL\_PIXEL\_MAP\_I\_TO\_B | color index | B | 1 | 0.0 | |
GL\_PIXEL\_MAP\_I\_TO\_A | color index | A | 1 | 0.0 | |
GL\_PIXEL\_MAP\_R\_TO\_R | R | R | 1 | 0.0 | |
GL\_PIXEL\_MAP\_G\_TO\_G | G | G | 1 | 0.0 | |
GL\_PIXEL\_MAP\_B\_TO\_B | B | B | 1 | 0.0 | |
GL\_PIXEL\_MAP\_A\_TO\_A | A | A | 1 | 0.0 |
The following functions retrieve information related to
**glPixelMap**:
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_PIXEL\_MAP\_I\_TO\_I\_SIZE **glGet** with argument
GL\_PIXEL\_MAP\_S\_TO\_S\_SIZE **glGet** with argument
GL\_PIXEL\_MAP\_I\_TO\_R\_SIZE **glGet** with argument
GL\_PIXEL\_MAP\_I\_TO\_G\_SIZE **glGet** with argument
GL\_PIXEL\_MAP\_I\_TO\_B\_SIZE **glGet** with argument
GL\_PIXEL\_MAP\_I\_TO\_A\_SIZE **glGet** with argument
GL\_PIXEL\_MAP\_R\_TO\_R\_SIZE **glGet** with argument
GL\_PIXEL\_MAP\_G\_TO\_G\_SIZE **glGet** with argument
GL\_PIXEL\_MAP\_B\_TO\_B\_SIZE **glGet** with argument
GL\_PIXEL\_MAP\_A\_TO\_A\_SIZE **glGet** with argument
GL\_MAX\_PIXEL\_MAP\_TABLE


%index
glPixelMapuiv
The glPixelMapuiv function sets up pixel transfer maps.
%group
Win32 opengl32
%prm
map, mapsize, values
map : [int] A symbolic map name. The ten maps are as follows.
mapsize : [int] The size of the map being defined.
values : [var] An array of *mapsize* values.
%inst
The glPixelMapuiv function sets up pixel transfer maps.

[戻り値]
This function does not return a value.

[備考]
The **glPixelMap** function sets up translation tables, or *maps*,
used by [**glCopyPixels**](glcopypixels.md),
[**glCopyTexImage1D**](glcopyteximage1d.md),
[**glCopyTexImage2D**](glcopyteximage2d.md),
[**glCopyTexSubImage1D**](glcopytexsubimage1d.md),
[**glCopyTexSubImage2D**](glcopytexsubimage2d.md),
[**glDrawPixels**](gldrawpixels.md),
[**glReadPixels**](glreadpixels.md),
[**glTexImage1D**](glteximage1d.md),
[**glTexImage2D**](glteximage2d.md),
[**glTexSubImage1D**](gltexsubimage1d.md), and
[**glTexSubImage2D**](gltexsubimage2d.md). Use of these maps is
described completely in the [**glPixelTransfer**](glpixeltransfer.md)
topic, and partly in the topics for the pixel and texture image
commands. Only the specification of the maps is described in this
topic. The *map* parameter is a symbolic map name, indicating one of
ten maps to set. The *mapsize* parameter specifies the number of
entries in the map, and *values* is a pointer to an array of
*mapsize* map values. The entries in a map can be specified as
single-precision floating-point numbers, unsigned short integers, or
unsigned long integers. Maps that store color component values (all
but GL\_PIXEL\_MAP\_I\_TO\_I and GL\_PIXEL\_MAP\_S\_TO\_S) retain
their values in floating-point format, with unspecified mantissa and
exponent sizes. Floating-point values specified by
[**glPixelMapfv**](glpixelmap.md) are converted directly to the
internal floating-point format of these maps, and then clamped to the
range \[0,1\]. Unsigned integer values specified by **glPixelMapusv**
and **glPixelMapuiv** are converted linearly such that the largest
representable integer maps to 1.0, and zero maps to 0.0. Maps that
store indexes, GL\_PIXEL\_MAP\_I\_TO\_I and GL\_PIXEL\_MAP\_S\_TO\_S,
retain their values in fixed-point format, with an unspecified number
of bits to the right of the binary point. Floating-point values
specified by [**glPixelMapfv**](glpixelmap.md) are converted directly
to the internal fixed-point format of these maps. Unsigned integer
values specified by **glPixelMapusv** and **glPixelMapuiv** specify
integer values, with all zeros to the right of the binary point. The
following table shows the initial sizes and values for each of the
maps. Maps that are indexed by either color or stencil indexes must
have *mapsize* = 2 ^ *n* for some *n* or results are undefined. The
maximum allowable size for each map depends on the implementation and
can be determined by calling **glGet** with argument
GL\_MAX\_PIXEL\_MAP\_TABLE. The single maximum applies to all maps,
and it is at least 32.
| Map | Lookup Index | Lookup Value | Initial Size | Initial Value |
|--------------------------|---------------|---------------|--------------|---------------|
| GL\_PIXEL\_MAP\_I\_TO\_I | color index | color index | 1 | 0.0 | |
GL\_PIXEL\_MAP\_S\_TO\_S | stencil index | stencil index | 1 | 0.0 |
| GL\_PIXEL\_MAP\_I\_TO\_R | color index | R | 1 | 0.0 | |
GL\_PIXEL\_MAP\_I\_TO\_G | color index | G | 1 | 0.0 | |
GL\_PIXEL\_MAP\_I\_TO\_B | color index | B | 1 | 0.0 | |
GL\_PIXEL\_MAP\_I\_TO\_A | color index | A | 1 | 0.0 | |
GL\_PIXEL\_MAP\_R\_TO\_R | R | R | 1 | 0.0 | |
GL\_PIXEL\_MAP\_G\_TO\_G | G | G | 1 | 0.0 | |
GL\_PIXEL\_MAP\_B\_TO\_B | B | B | 1 | 0.0 | |
GL\_PIXEL\_MAP\_A\_TO\_A | A | A | 1 | 0.0 |
The following functions retrieve information related to
**glPixelMap**:
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_PIXEL\_MAP\_I\_TO\_I\_SIZE **glGet** with argument
GL\_PIXEL\_MAP\_S\_TO\_S\_SIZE **glGet** with argument
GL\_PIXEL\_MAP\_I\_TO\_R\_SIZE **glGet** with argument
GL\_PIXEL\_MAP\_I\_TO\_G\_SIZE **glGet** with argument
GL\_PIXEL\_MAP\_I\_TO\_B\_SIZE **glGet** with argument
GL\_PIXEL\_MAP\_I\_TO\_A\_SIZE **glGet** with argument
GL\_PIXEL\_MAP\_R\_TO\_R\_SIZE **glGet** with argument
GL\_PIXEL\_MAP\_G\_TO\_G\_SIZE **glGet** with argument
GL\_PIXEL\_MAP\_B\_TO\_B\_SIZE **glGet** with argument
GL\_PIXEL\_MAP\_A\_TO\_A\_SIZE **glGet** with argument
GL\_MAX\_PIXEL\_MAP\_TABLE


%index
glPixelMapusv
The glPixelMapusv function sets up pixel transfer maps.
%group
Win32 opengl32
%prm
map, mapsize, values
map : [int] A symbolic map name. The ten maps are as follows.
mapsize : [int] The size of the map being defined.
values : [var] An array of *mapsize* values.
%inst
The glPixelMapusv function sets up pixel transfer maps.

[戻り値]
This function does not return a value.

[備考]
The **glPixelMap** function sets up translation tables, or *maps*,
used by [**glCopyPixels**](glcopypixels.md),
[**glCopyTexImage1D**](glcopyteximage1d.md),
[**glCopyTexImage2D**](glcopyteximage2d.md),
[**glCopyTexSubImage1D**](glcopytexsubimage1d.md),
[**glCopyTexSubImage2D**](glcopytexsubimage2d.md),
[**glDrawPixels**](gldrawpixels.md),
[**glReadPixels**](glreadpixels.md),
[**glTexImage1D**](glteximage1d.md),
[**glTexImage2D**](glteximage2d.md),
[**glTexSubImage1D**](gltexsubimage1d.md), and
[**glTexSubImage2D**](gltexsubimage2d.md). Use of these maps is
described completely in the [**glPixelTransfer**](glpixeltransfer.md)
topic, and partly in the topics for the pixel and texture image
commands. Only the specification of the maps is described in this
topic. The *map* parameter is a symbolic map name, indicating one of
ten maps to set. The *mapsize* parameter specifies the number of
entries in the map, and *values* is a pointer to an array of
*mapsize* map values. The entries in a map can be specified as
single-precision floating-point numbers, unsigned short integers, or
unsigned long integers. Maps that store color component values (all
but GL\_PIXEL\_MAP\_I\_TO\_I and GL\_PIXEL\_MAP\_S\_TO\_S) retain
their values in floating-point format, with unspecified mantissa and
exponent sizes. Floating-point values specified by
[**glPixelMapfv**](glpixelmap.md) are converted directly to the
internal floating-point format of these maps, and then clamped to the
range \[0,1\]. Unsigned integer values specified by **glPixelMapusv**
and **glPixelMapuiv** are converted linearly such that the largest
representable integer maps to 1.0, and zero maps to 0.0. Maps that
store indexes, GL\_PIXEL\_MAP\_I\_TO\_I and GL\_PIXEL\_MAP\_S\_TO\_S,
retain their values in fixed-point format, with an unspecified number
of bits to the right of the binary point. Floating-point values
specified by [**glPixelMapfv**](glpixelmap.md) are converted directly
to the internal fixed-point format of these maps. Unsigned integer
values specified by **glPixelMapusv** and **glPixelMapuiv** specify
integer values, with all zeros to the right of the binary point. The
following table shows the initial sizes and values for each of the
maps. Maps that are indexed by either color or stencil indexes must
have *mapsize* = 2 ^ *n* for some *n* or results are undefined. The
maximum allowable size for each map depends on the implementation and
can be determined by calling **glGet** with argument
GL\_MAX\_PIXEL\_MAP\_TABLE. The single maximum applies to all maps,
and it is at least 32.
| Map | Lookup Index | Lookup Value | Initial Size | Initial Value |
|--------------------------|---------------|---------------|--------------|---------------|
| GL\_PIXEL\_MAP\_I\_TO\_I | color index | color index | 1 | 0.0 | |
GL\_PIXEL\_MAP\_S\_TO\_S | stencil index | stencil index | 1 | 0.0 |
| GL\_PIXEL\_MAP\_I\_TO\_R | color index | R | 1 | 0.0 | |
GL\_PIXEL\_MAP\_I\_TO\_G | color index | G | 1 | 0.0 | |
GL\_PIXEL\_MAP\_I\_TO\_B | color index | B | 1 | 0.0 | |
GL\_PIXEL\_MAP\_I\_TO\_A | color index | A | 1 | 0.0 | |
GL\_PIXEL\_MAP\_R\_TO\_R | R | R | 1 | 0.0 | |
GL\_PIXEL\_MAP\_G\_TO\_G | G | G | 1 | 0.0 | |
GL\_PIXEL\_MAP\_B\_TO\_B | B | B | 1 | 0.0 | |
GL\_PIXEL\_MAP\_A\_TO\_A | A | A | 1 | 0.0 |
The following functions retrieve information related to
**glPixelMap**:
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_PIXEL\_MAP\_I\_TO\_I\_SIZE **glGet** with argument
GL\_PIXEL\_MAP\_S\_TO\_S\_SIZE **glGet** with argument
GL\_PIXEL\_MAP\_I\_TO\_R\_SIZE **glGet** with argument
GL\_PIXEL\_MAP\_I\_TO\_G\_SIZE **glGet** with argument
GL\_PIXEL\_MAP\_I\_TO\_B\_SIZE **glGet** with argument
GL\_PIXEL\_MAP\_I\_TO\_A\_SIZE **glGet** with argument
GL\_PIXEL\_MAP\_R\_TO\_R\_SIZE **glGet** with argument
GL\_PIXEL\_MAP\_G\_TO\_G\_SIZE **glGet** with argument
GL\_PIXEL\_MAP\_B\_TO\_B\_SIZE **glGet** with argument
GL\_PIXEL\_MAP\_A\_TO\_A\_SIZE **glGet** with argument
GL\_MAX\_PIXEL\_MAP\_TABLE


%index
glPixelStoref
Sets pixel storage modes. | glPixelStoref function (Gl.h)
%group
Win32 opengl32
%prm
pname, param1
pname : [int] The symbolic name of the parameter to be set. Six of the storage parameters affect how pixel data is returned to client memory, and are therefore significant only for [**glReadPixels**](glreadpixels.md) commands. They are as follows:
param1 : [float] 
%inst
Sets pixel storage modes. | glPixelStoref function (Gl.h)

[戻り値]
This function does not return a value.

[備考]
The **glPixelStore** function sets pixel storage modes that affect
the operation of subsequent [**glDrawPixels**](gldrawpixels.md) and
[**glReadPixels**](glreadpixels.md) as well as the unpacking of
polygon stipple patterns (see
[**glPolygonStipple**](glpolygonstipple.md)), bitmaps (see
[**glBitmap**](glbitmap.md)), and texture patterns (see
[**glTexImage1D**](glteximage1d.md),
[**glTexImage2D**](glteximage2d.md),
[**glTexSubImage1D**](gltexsubimage1d.md), and
[**glTexSubImage2D**](gltexsubimage2d.md)). The following table gives
the type, initial value, and range of valid values for each of the
storage parameters that can be set with **glPixelStore**.
| Pname | Type | Initial Value | Valid Range |
|--------------------------|---------|---------------|---------------|
| GL\_PACK\_SWAP\_BYTES | Boolean | false | true or false | |
GL\_PACK\_SWAP\_BYTES | Boolean | false | true or false | |
GL\_PACK\_ROW\_LENGTH | integer | 0 | \[0,?) | | GL\_PACK\_SKIP\_ROWS
| integer | 0 | \[0,?) | | GL\_PACK\_SKIP\_PIXELS | integer | 0 |
\[0,?) | | GL\_PACK\_ALIGNMENT | integer | 4 | 1, 2, 4, or 8 | |
GL\_UNPACK\_SWAP\_BYTES | Boolean | false | true or false | |
GL\_UNPACK\_LSB\_FIRST | Boolean | false | true or false | |
GL\_UNPACK\_ROW\_LENGTH | integer | 0 | \[0,?) | |
GL\_UNPACK\_SKIP\_ROWS | integer | 0 | \[0,?) | |
GL\_UNPACK\_SKIP\_PIXELS | integer | 0 | \[0,?) | |
GL\_UNPACK\_ALIGNMENT | integer | 4 | 1, 2, 4, or 8 |
The **glPixelStoref** function can be used to set any pixel store
parameter. If the parameter type is Boolean, and if *param* is 0.0,
then the parameter is false; otherwise it is set to true. If *pname*
is an integer type parameter, then *param* is rounded to the nearest
integer. Likewise, the **glPixelStorei** function can also be used to
set any of the pixel store parameters. Boolean parameters are set to
false if *param* is 0 and true otherwise. The *param* parameter is
converted to floating point before being assigned to real-valued
parameters. The pixel storage modes in effect when
[**glDrawPixels**](gldrawpixels.md),
[**glReadPixels**](glreadpixels.md),
[**glTexImage1D**](glteximage1d.md),
[**glTexImage2D**](glteximage2d.md), [**glBitmap**](glbitmap.md), or
[**glPolygonStipple**](glpolygonstipple.md) is placed in a display
list control the interpretation of memory data. The pixel storage
modes in effect when a display list is executed are not significant.
The following functions retrieve information related to
**glPixelStore**:
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_PACK\_SWAP\_BYTES **glGet** with argument
GL\_PACK\_LSB\_FIRST **glGet** with argument GL\_PACK\_ROW\_LENGTH
**glGet** with argument GL\_PACK\_SKIP\_ROWS **glGet** with argument
GL\_PACK\_SKIP\_PIXELS **glGet** with argument GL\_PACK\_ALIGNMENT
**glGet** with argument GL\_UNPACK\_SWAP\_BYTES **glGet** with
argument GL\_UNPACK\_LSB\_FIRST **glGet** with argument
GL\_UNPACK\_ROW\_LENGTH **glGet** with argument
GL\_UNPACK\_SKIP\_ROWS **glGet** with argument
GL\_UNPACK\_SKIP\_PIXELS **glGet** with argument
GL\_UNPACK\_ALIGNMENT


%index
glPixelStorei
Sets pixel storage modes. | glPixelStorei function (Gl.h)
%group
Win32 opengl32
%prm
pname, param1
pname : [int] The symbolic name of the parameter to be set. Six of the storage parameters affect how pixel data is returned to client memory, and are therefore significant only for [**glReadPixels**](glreadpixels.md) commands. They are as follows.
param1 : [int] 
%inst
Sets pixel storage modes. | glPixelStorei function (Gl.h)

[戻り値]
This function does not return a value.

[備考]
The **glPixelStore** function sets pixel storage modes that affect
the operation of subsequent [**glDrawPixels**](gldrawpixels.md) and
[**glReadPixels**](glreadpixels.md) as well as the unpacking of
polygon stipple patterns (see
[**glPolygonStipple**](glpolygonstipple.md)), bitmaps (see
[**glBitmap**](glbitmap.md)), and texture patterns (see
[**glTexImage1D**](glteximage1d.md),
[**glTexImage2D**](glteximage2d.md),
[**glTexSubImage1D**](gltexsubimage1d.md), and
[**glTexSubImage2D**](gltexsubimage2d.md)). The following table gives
the type, initial value, and range of valid values for each of the
storage parameters that can be set with **glPixelStore**.
| Pname | Type | Initial Value | Valid Range |
|--------------------------|---------|---------------|---------------|
| GL\_PACK\_SWAP\_BYTES | Boolean | false | true or false | |
GL\_PACK\_SWAP\_BYTES | Boolean | false | true or false | |
GL\_PACK\_ROW\_LENGTH | integer | 0 | \[0,?) | | GL\_PACK\_SKIP\_ROWS
| integer | 0 | \[0,?) | | GL\_PACK\_SKIP\_PIXELS | integer | 0 |
\[0,?) | | GL\_PACK\_ALIGNMENT | integer | 4 | 1, 2, 4, or 8 | |
GL\_UNPACK\_SWAP\_BYTES | Boolean | false | true or false | |
GL\_UNPACK\_LSB\_FIRST | Boolean | false | true or false | |
GL\_UNPACK\_ROW\_LENGTH | integer | 0 | \[0,?) | |
GL\_UNPACK\_SKIP\_ROWS | integer | 0 | \[0,?) | |
GL\_UNPACK\_SKIP\_PIXELS | integer | 0 | \[0,?) | |
GL\_UNPACK\_ALIGNMENT | integer | 4 | 1, 2, 4, or 8 |
The [**glPixelStoref**](glpixelstoref.md) function can be used to set
any pixel store parameter. If the parameter type is Boolean, and if
*param* is 0.0, then the parameter is false; otherwise it is set to
true. If *pname* is an integer type parameter, then *param* is
rounded to the nearest integer. Likewise, the **glPixelStorei**
function can also be used to set any of the pixel store parameters.
Boolean parameters are set to false if *param* is 0 and true
otherwise. The *param* parameter is converted to floating point
before being assigned to real-valued parameters. The pixel storage
modes in effect when [**glDrawPixels**](gldrawpixels.md),
[**glReadPixels**](glreadpixels.md),
[**glTexImage1D**](glteximage1d.md),
[**glTexImage2D**](glteximage2d.md), [**glBitmap**](glbitmap.md), or
[**glPolygonStipple**](glpolygonstipple.md) is placed in a display
list control the interpretation of memory data. The pixel storage
modes in effect when a display list is executed are not significant.
The following functions retrieve information related to
**glPixelStore**:
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_PACK\_SWAP\_BYTES **glGet** with argument
GL\_PACK\_LSB\_FIRST **glGet** with argument GL\_PACK\_ROW\_LENGTH
**glGet** with argument GL\_PACK\_SKIP\_ROWS **glGet** with argument
GL\_PACK\_SKIP\_PIXELS **glGet** with argument GL\_PACK\_ALIGNMENT
**glGet** with argument GL\_UNPACK\_SWAP\_BYTES **glGet** with
argument GL\_UNPACK\_LSB\_FIRST **glGet** with argument
GL\_UNPACK\_ROW\_LENGTH **glGet** with argument
GL\_UNPACK\_SKIP\_ROWS **glGet** with argument
GL\_UNPACK\_SKIP\_PIXELS **glGet** with argument
GL\_UNPACK\_ALIGNMENT


%index
glPixelTransferf
The glPixelTransferf and glPixelTransferi functions set pixel transfer modes. | glPixelTransferf function (Gl.h)
%group
Win32 opengl32
%prm
pname, param1
pname : [int] The symbolic name of the pixel transfer parameter to be set. The following table gives the type, initial value, and range of valid values for each of the pixel transfer parameters that are set with **glPixelTransfer**.
param1 : [float] 
%inst
The glPixelTransferf and glPixelTransferi functions set pixel
transfer modes. | glPixelTransferf function (Gl.h)

[戻り値]
This function does not return a value.

[備考]
The **glPixelTransfer** function sets pixel transfer modes that
affect the operation of subsequent
[**glCopyPixels**](glcopypixels.md),
[**glCopyTexImage1D**](glcopyteximage1d.md),
[**glCopyTexImage2D**](glcopyteximage2d.md),
[**glCopyTexSubImage1D**](glcopytexsubimage1d.md),
[**glCopyTexSubImage2D**](glcopytexsubimage2d.md),
[**glDrawPixels**](gldrawpixels.md),
[**glReadPixels**](glreadpixels.md),
[**glTexImage1D**](glteximage1d.md),
[**glTexImage2D**](glteximage2d.md),
[**glTexSubImage1D**](gltexsubimage1d.md), and
[**glTexSubImage2D**](gltexsubimage2d.md) commands. The algorithms
that are specified by pixel transfer modes operate on pixels after
they are read from the framebuffer (**glReadPixels** and
**glCopyPixels**) or unpacked from client memory (**glDrawPixels**,
**glTexImage1D**, and **glTexImage2D**). Pixel transfer operations
happen in the same order, and in the same manner, regardless of the
command that resulted in the pixel operation. Pixel storage modes
([**glPixelStore**](glpixelstore-functions.md)) control the unpacking
of pixels being read from client memory, and the packing of pixels
being written back into client memory. Pixel transfer operations
handle four fundamental pixel types: *color*, *color index*, *depth*,
and *stencil*.Color pixels are made up of four floating-point values
with unspecified mantissa and exponent sizes, scaled such that 0.0
represents zero intensity and 1.0 represents full intensity. Color
indexes comprise a single fixed-point value, with unspecified
precision to the right of the binary point. Depth pixels comprise a
single floating-point value, with unspecified mantissa and exponent
sizes, scaled such that 0.0 represents the minimum depth buffer
value, and 1.0 represents the maximum depth buffer value. Finally,
stencil pixels comprise a single fixed-point value, with unspecified
precision to the right of the binary point. The pixel transfer
operations performed on the four basic pixel types are as follows:
| Pixel type | Pixel transfer operation |
|-------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Color | Each of the four color components is multiplied by a scale
factor, and then added to a bias factor. That is, the red component
is multiplied by GL\_RED\_SCALE, and then added to GL\_RED\_BIAS; the
green component is multiplied by GL\_GREEN\_SCALE, and then added to
GL\_GREEN\_BIAS; the blue component is multiplied by GL\_BLUE\_SCALE,
and then added to GL\_BLUE\_BIAS; and the alpha component is
multiplied by GL\_ALPHA\_SCALE, and then added to GL\_ALPHA\_BIAS.
After all four color components are scaled and biased, each is
clamped to the range \[0,1\]. All color scale and bias values are
specified with **glPixelTransfer**. If GL\_MAP\_COLOR is true, each
color component is scaled by the size of the corresponding
color-to-color map, and then replaced by the contents of that map
indexed by the scaled component. That is, the red component is scaled
by GL\_PIXEL\_MAP\_R\_TO\_R\_SIZE, and then replaced by the contents
of GL\_PIXEL\_MAP\_R\_TO\_R indexed by itself. The green component is
scaled by GL\_PIXEL\_MAP\_G\_TO\_G\_SIZE, and then replaced by the
contents of GL\_PIXEL\_MAP\_G\_TO\_G indexed by itself. The blue
component is scaled by GL\_PIXEL\_MAP\_B\_TO\_B\_SIZE, and then
replaced by the contents of GL\_PIXEL\_MAP\_B\_TO\_B indexed by
itself. The alpha component is scaled by
GL\_PIXEL\_MAP\_A\_TO\_A\_SIZE, and then replaced by the contents of
GL\_PIXEL\_MAP\_A\_TO\_A indexed by itself. All components taken from
the maps are then clamped to the range \[0,1\]. GL\_MAP\_COLOR is
specified with **glPixelTransfer**. The contents of the various maps
are specified with **glPixelMap**. | | Color index | Each color index
is shifted left by GL\_INDEX\_SHIFT bits, filling with zeros any bits
beyond the number of fraction bits carried by the fixed-point index.
If GL\_INDEX\_SHIFT is negative, the shift is to the right, again
zero filled. GL\_INDEX\_OFFSET is then added to the index.
GL\_INDEX\_SHIFT and GL\_INDEX\_OFFSET are specified with
**glPixelTransfer**. From this point, operation diverges depending on
the required format of the resulting pixels. If the resulting pixels
are to be written to a color-index buffer, or if they are being read
back to client memory in GL\_COLOR\_INDEX format, the pixels continue
to be treated as indexes. If GL\_MAP\_COLOR is true, then each index
is masked by 2 ^ *n* 1, where *n* is GL\_PIXEL\_MAP\_I\_TO\_I\_SIZE,
and then replaced by the contents of GL\_PIXEL\_MAP\_I\_TO\_I indexed
by the masked value. GL\_MAP\_COLOR is specified with
**glPixelTransfer**. The contents of the index map are specified with
**glPixelMap**. If the resulting pixels are to be written to an RGBA
color buffer, or if they are being read back to client memory in a
format other than GL\_COLOR\_INDEX, the pixels are converted from
indexes to colors by referencing the four maps
GL\_PIXEL\_MAP\_I\_TO\_R, GL\_PIXEL\_MAP\_I\_TO\_G,
GL\_PIXEL\_MAP\_I\_TO\_B, and GL\_PIXEL\_MAP\_I\_TO\_A. Before being
dereferenced, the index is masked by 2 n 1, where n is
GL\_PIXEL\_MAP\_I\_TO\_R\_SIZE for the red map,
GL\_PIXEL\_MAP\_I\_TO\_G\_SIZE for the green map,
GL\_PIXEL\_MAP\_I\_TO\_B\_SIZE for the blue map, and
GL\_PIXEL\_MAP\_I\_TO\_A\_SIZE for the alpha map. All components
taken from the maps are then clamped to the range \[0,1\]. The
contents of the four maps are specified with **glPixelMap**. | |
Depth | Each depth value is multiplied by GL\_DEPTH\_SCALE, added to
GL\_DEPTH\_BIAS, and then clamped to the range \[0,1\]. | | Stencil |
Each index is shifted GL\_INDEX\_SHIFT bits just as a color index is,
and then added to GL\_INDEX\_OFFSET. If GL\_MAP\_STENCIL is true,
each index is masked by 2n 1, where *n* is
GL\_PIXEL\_MAP\_S\_TO\_S\_SIZE, then replaced by the contents of
GL\_PIXEL\_MAP\_S\_TO\_S indexed by the masked value. |
The [**glPixelTransferf**](glpixeltransfer.md) function can be used
to set any pixel transfer parameter. If the parameter type is
Boolean, 0.0 implies false and any other value implies true. If
*pname* is an integer parameter, *param* is rounded to the nearest
integer. Likewise, **glPixelTransferi** can also be used to set any
of the pixel transfer parameters. Boolean parameters are set to false
if *param* is 0 and true otherwise. The *param* parameter is
converted to floating point before being assigned to real-valued
parameters. If a [**glDrawPixels**](gldrawpixels.md),
[**glReadPixels**](glreadpixels.md),
[**glCopyPixels**](glcopypixels.md),
[**glTexImage1D**](glteximage1d.md), or
[**glTexImage2D**](glteximage2d.md) command is placed in a display
list (see [**glNewList**](glnewlist.md) and
[**glCallList**](glcalllist.md)), the pixel transfer mode settings in
effect when the display list is *executed* are the ones that are
used. They may be different from the settings when the command was
compiled into the display list. The following functions retrieve
information related to **glPixelTransfer**:
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_MAP\_COLOR **glGet** with argument GL\_MAP\_STENCIL
**glGet** with argument GL\_INDEX\_SHIFT **glGet** with argument
GL\_INDEX\_OFFSET **glGet** with argument GL\_RED\_SCALE **glGet**
with argument GL\_RED\_BIAS **glGet** with argument GL\_GREEN\_SCALE
**glGet** with argument GL\_GREEN\_BIAS **glGet** with argument
GL\_BLUE\_SCALE **glGet** with argument GL\_BLUE\_BIAS **glGet** with
argument GL\_ALPHA\_SCALE **glGet** with argument GL\_ALPHA\_BIAS
**glGet** with argument GL\_DEPTH\_SCALE **glGet** with argument
GL\_DEPTH\_BIAS


%index
glPixelTransferi
The glPixelTransferf and glPixelTransferi functions set pixel transfer modes. | glPixelTransferi function (Gl.h)
%group
Win32 opengl32
%prm
pname, param1
pname : [int] The symbolic name of the pixel transfer parameter to be set. The following table gives the type, initial value, and range of valid values for each of the pixel transfer parameters that are set with **glPixelTransfer**.
param1 : [int] 
%inst
The glPixelTransferf and glPixelTransferi functions set pixel
transfer modes. | glPixelTransferi function (Gl.h)

[戻り値]
This function does not return a value.

[備考]
The **glPixelTransfer** function sets pixel transfer modes that
affect the operation of subsequent
[**glCopyPixels**](glcopypixels.md),
[**glCopyTexImage1D**](glcopyteximage1d.md),
[**glCopyTexImage2D**](glcopyteximage2d.md),
[**glCopyTexSubImage1D**](glcopytexsubimage1d.md),
[**glCopyTexSubImage2D**](glcopytexsubimage2d.md),
[**glDrawPixels**](gldrawpixels.md),
[**glReadPixels**](glreadpixels.md),
[**glTexImage1D**](glteximage1d.md),
[**glTexImage2D**](glteximage2d.md),
[**glTexSubImage1D**](gltexsubimage1d.md), and
[**glTexSubImage2D**](gltexsubimage2d.md) commands. The algorithms
that are specified by pixel transfer modes operate on pixels after
they are read from the framebuffer (**glReadPixels** and
**glCopyPixels**) or unpacked from client memory (**glDrawPixels**,
**glTexImage1D**, and **glTexImage2D**). Pixel transfer operations
happen in the same order, and in the same manner, regardless of the
command that resulted in the pixel operation. Pixel storage modes
([**glPixelStore**](glpixelstore-functions.md)) control the unpacking
of pixels being read from client memory, and the packing of pixels
being written back into client memory. Pixel transfer operations
handle four fundamental pixel types: *color*, *color index*, *depth*,
and *stencil*.Color pixels are made up of four floating-point values
with unspecified mantissa and exponent sizes, scaled such that 0.0
represents zero intensity and 1.0 represents full intensity. Color
indexes comprise a single fixed-point value, with unspecified
precision to the right of the binary point. Depth pixels comprise a
single floating-point value, with unspecified mantissa and exponent
sizes, scaled such that 0.0 represents the minimum depth buffer
value, and 1.0 represents the maximum depth buffer value. Finally,
stencil pixels comprise a single fixed-point value, with unspecified
precision to the right of the binary point. The pixel transfer
operations performed on the four basic pixel types are as follows:
| Pixel type | Pixel transfer operation |
|-------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Color | Each of the four color components is multiplied by a scale
factor, and then added to a bias factor. That is, the red component
is multiplied by GL\_RED\_SCALE, and then added to GL\_RED\_BIAS; the
green component is multiplied by GL\_GREEN\_SCALE, and then added to
GL\_GREEN\_BIAS; the blue component is multiplied by GL\_BLUE\_SCALE,
and then added to GL\_BLUE\_BIAS; and the alpha component is
multiplied by GL\_ALPHA\_SCALE, and then added to GL\_ALPHA\_BIAS.
After all four color components are scaled and biased, each is
clamped to the range \[0,1\]. All color scale and bias values are
specified with **glPixelTransfer**. If GL\_MAP\_COLOR is true, each
color component is scaled by the size of the corresponding
color-to-color map, and then replaced by the contents of that map
indexed by the scaled component. That is, the red component is scaled
by GL\_PIXEL\_MAP\_R\_TO\_R\_SIZE, and then replaced by the contents
of GL\_PIXEL\_MAP\_R\_TO\_R indexed by itself. The green component is
scaled by GL\_PIXEL\_MAP\_G\_TO\_G\_SIZE, and then replaced by the
contents of GL\_PIXEL\_MAP\_G\_TO\_G indexed by itself. The blue
component is scaled by GL\_PIXEL\_MAP\_B\_TO\_B\_SIZE, and then
replaced by the contents of GL\_PIXEL\_MAP\_B\_TO\_B indexed by
itself. The alpha component is scaled by
GL\_PIXEL\_MAP\_A\_TO\_A\_SIZE, and then replaced by the contents of
GL\_PIXEL\_MAP\_A\_TO\_A indexed by itself. All components taken from
the maps are then clamped to the range \[0,1\]. GL\_MAP\_COLOR is
specified with **glPixelTransfer**. The contents of the various maps
are specified with **glPixelMap**. | | Color index | Each color index
is shifted left by GL\_INDEX\_SHIFT bits, filling with zeros any bits
beyond the number of fraction bits carried by the fixed-point index.
If GL\_INDEX\_SHIFT is negative, the shift is to the right, again
zero filled. GL\_INDEX\_OFFSET is then added to the index.
GL\_INDEX\_SHIFT and GL\_INDEX\_OFFSET are specified with
**glPixelTransfer**. From this point, operation diverges depending on
the required format of the resulting pixels. If the resulting pixels
are to be written to a color-index buffer, or if they are being read
back to client memory in GL\_COLOR\_INDEX format, the pixels continue
to be treated as indexes. If GL\_MAP\_COLOR is true, then each index
is masked by 2 ^ *n* 1, where *n* is GL\_PIXEL\_MAP\_I\_TO\_I\_SIZE,
and then replaced by the contents of GL\_PIXEL\_MAP\_I\_TO\_I indexed
by the masked value. GL\_MAP\_COLOR is specified with
**glPixelTransfer**. The contents of the index map are specified with
**glPixelMap**. If the resulting pixels are to be written to an RGBA
color buffer, or if they are being read back to client memory in a
format other than GL\_COLOR\_INDEX, the pixels are converted from
indexes to colors by referencing the four maps
GL\_PIXEL\_MAP\_I\_TO\_R, GL\_PIXEL\_MAP\_I\_TO\_G,
GL\_PIXEL\_MAP\_I\_TO\_B, and GL\_PIXEL\_MAP\_I\_TO\_A. Before being
dereferenced, the index is masked by 2 n 1, where n is
GL\_PIXEL\_MAP\_I\_TO\_R\_SIZE for the red map,
GL\_PIXEL\_MAP\_I\_TO\_G\_SIZE for the green map,
GL\_PIXEL\_MAP\_I\_TO\_B\_SIZE for the blue map, and
GL\_PIXEL\_MAP\_I\_TO\_A\_SIZE for the alpha map. All components
taken from the maps are then clamped to the range \[0,1\]. The
contents of the four maps are specified with **glPixelMap**. | |
Depth | Each depth value is multiplied by GL\_DEPTH\_SCALE, added to
GL\_DEPTH\_BIAS, and then clamped to the range \[0,1\]. | | Stencil |
Each index is shifted GL\_INDEX\_SHIFT bits just as a color index is,
and then added to GL\_INDEX\_OFFSET. If GL\_MAP\_STENCIL is true,
each index is masked by 2n 1, where *n* is
GL\_PIXEL\_MAP\_S\_TO\_S\_SIZE, then replaced by the contents of
GL\_PIXEL\_MAP\_S\_TO\_S indexed by the masked value. |
The [**glPixelTransferf**](glpixeltransfer.md) function can be used
to set any pixel transfer parameter. If the parameter type is
Boolean, 0.0 implies false and any other value implies true. If
*pname* is an integer parameter, *param* is rounded to the nearest
integer. Likewise, **glPixelTransferi** can also be used to set any
of the pixel transfer parameters. Boolean parameters are set to false
if *param* is 0 and true otherwise. The *param* parameter is
converted to floating point before being assigned to real-valued
parameters. If a [**glDrawPixels**](gldrawpixels.md),
[**glReadPixels**](glreadpixels.md),
[**glCopyPixels**](glcopypixels.md),
[**glTexImage1D**](glteximage1d.md), or
[**glTexImage2D**](glteximage2d.md) command is placed in a display
list (see [**glNewList**](glnewlist.md) and
[**glCallList**](glcalllist.md)), the pixel transfer mode settings in
effect when the display list is *executed* are the ones that are
used. They may be different from the settings when the command was
compiled into the display list. The following functions retrieve
information related to **glPixelTransfer**:
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_MAP\_COLOR **glGet** with argument GL\_MAP\_STENCIL
**glGet** with argument GL\_INDEX\_SHIFT **glGet** with argument
GL\_INDEX\_OFFSET **glGet** with argument GL\_RED\_SCALE **glGet**
with argument GL\_RED\_BIAS **glGet** with argument GL\_GREEN\_SCALE
**glGet** with argument GL\_GREEN\_BIAS **glGet** with argument
GL\_BLUE\_SCALE **glGet** with argument GL\_BLUE\_BIAS **glGet** with
argument GL\_ALPHA\_SCALE **glGet** with argument GL\_ALPHA\_BIAS
**glGet** with argument GL\_DEPTH\_SCALE **glGet** with argument
GL\_DEPTH\_BIAS


%index
glPixelZoom
The glPixelZoom function specifies the pixel zoom factors.
%group
Win32 opengl32
%prm
xfactor, yfactor
xfactor : [float] The *x* zoom factor for pixel write operations.
yfactor : [float] The *y* zoom factor for pixel write operations.
%inst
The glPixelZoom function specifies the pixel zoom factors.

[戻り値]
This function does not return a value.

[備考]
The **glPixelZoom** function specifies values for the *x* and *y*
zoom factors. During the execution of
[**glDrawPixels**](gldrawpixels.md) or
[**glCopyPixels**](glcopypixels.md), if (*x*r ,*y*r ) is the current
raster position, and a given element is in the *n*th row and *m*th
column of the pixel rectangle, then pixels whose centers are in the
rectangle with corners at ![Equation showing the locations where
pixels are candidates for replacement.](images/pix05.png) are
candidates for replacement. Any pixel whose center lies on the bottom
or left edge of this rectangular region is also modified. Pixel zoom
factors are not limited to positive values. Negative zoom factors
reflect the resulting image about the current raster position. The
following functions retrieve information related to **glPixelZoom**:
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_ZOOM\_X **glGet** with argument GL\_ZOOM\_Y


%index
glPointSize
The glPointSize function specifies the diameter of rasterized points.
%group
Win32 opengl32
%prm
size
size : [float] The diameter of rasterized points. The default is 1.0.
%inst
The glPointSize function specifies the diameter of rasterized points.

[戻り値]
This function does not return a value.

[備考]
The **glPointSize** function specifies the rasterized diameter of
both aliased and antialiased points. Using a point size other than
1.0 has different effects, depending on whether point antialiasing is
enabled. Point antialiasing is controlled by calling
[**glEnable**](glenable.md) and **glDisable** with argument
GL\_POINT\_SMOOTH. If point antialiasing is disabled, the actual size
is determined by rounding the supplied size to the nearest integer.
(If the rounding results in the value 0, it is as if the point size
were 1.) If the rounded size is odd, then the center point (*x*,*y*)
of the pixel fragment that represents the point is computed as (*x*w
+ .5, *y*w + .5) where *w* subscripts indicate window coordinates.
All pixels that lie within the square grid of the rounded size
centered at (*x*,*y*) make up the fragment. If the size is even, the
center point is (*x*w + .5, *y*w + .5) and the rasterized fragment's
centers are the half-integer window coordinates within the square of
the rounded size centered at (*x*,*y*). All pixel fragments produced
in rasterizing a nonantialiased point are assigned the same
associated data; that of the vertex corresponding to the point. If
antialiasing is enabled, then point rasterization produces a fragment
for each pixel square that intersects the region lying within the
circle having diameter equal to the current point size and centered
at the points (*x*w ,*y*w ). The coverage value for each fragment is
the window coordinate area of the intersection of the circular region
with the corresponding pixel square. This value is saved and used in
the final rasterization step. The data associated with each fragment
is the data associated with the point being rasterized. Not all sizes
are supported when point antialiasing is enabled. If an unsupported
size is requested, the nearest supported size is used. Only size 1.0
is guaranteed to be supported; others depend on the implementation.
The range of supported sizes and the size difference between
supported sizes within the range can be queried by calling
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with arguments GL\_POINT\_SIZE\_RANGE and
GL\_POINT\_SIZE\_GRANULARITY. The point size specified by
**glPointSize** is always returned when GL\_POINT\_SIZE is queried.
Clamping and rounding for aliased and antialiased points have no
effect on the specified value. Non-antialiased point size may be
clamped to an implementation-dependent maximum. Although this maximum
cannot be queried, it must be no less than the maximum value for
antialiased points, rounded to the nearest integer value. The
following functions retrieve information related to **glPointSize**:
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_POINT\_SIZE **glGet** with argument
GL\_POINT\_SIZE\_RANGE **glGet** with argument
GL\_POINT\_SIZE\_GRANULARITY [**glIsEnabled**](glisenabled.md) with
argument GL\_POINT\_SMOOTH


%index
glPolygonMode
The glPolygonMode function selects a polygon rasterization mode.
%group
Win32 opengl32
%prm
face, mode
face : [int] The polygons that *mode* applies to. Must be GL\_FRONT for front-facing polygons, GL\_BACK for back-facing polygons, or GL\_FRONT\_AND\_BACK for front- and back-facing polygons.
mode : [int] The way polygons will be rasterized. The following modes are defined and can be specified in *mode*. The default is GL\_FILL for both front- and back-facing polygons.
%inst
The glPolygonMode function selects a polygon rasterization mode.

[戻り値]
This function does not return a value.

[備考]
The **glPolygonMode** function controls the interpretation of
polygons for rasterization. The *face* parameter describes which
polygons *mode* applies to: front-facing polygons (GL\_FRONT),
back-facing polygons (GL\_BACK), or both (GL\_FRONT\_AND\_BACK). The
polygon mode affects only the final rasterization of polygons. In
particular, a polygon's vertices are lit and the polygon is clipped
and possibly culled before these modes are applied. To draw a surface
with filled back-facing polygons and outlined front-facing polygons,
call **glPolygonMode**(GL\_FRONT, GL\_LINE); Vertices are marked as
boundary or nonboundary with an edge flag. Edge flags are generated
internally by OpenGL when it decomposes polygons, and they can be set
explicitly using [**glEdgeFlag**](gledgeflag-functions.md). The
following function retrieves information related to
**glPolygonMode**:
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_POLYGON\_MODE


%index
glPolygonOffset
The glPolygonOffset function sets the scale and units OpenGL uses to calculate depth values.
%group
Win32 opengl32
%prm
factor, units
factor : [float] Specifies a scale factor that is used to create a variable depth offset for each polygon. The initial value is zero.
units : [float] Specifies a value that is multiplied by an implementation-specific value to create a constant depth offset. The initial value is 0.
%inst
The glPolygonOffset function sets the scale and units OpenGL uses to
calculate depth values.

[戻り値]
This function does not return a value.

[備考]
When GL\_POLYGON\_OFFSET is enabled, each fragment's depth value will
be offset after it is interpolated from the depth values of the
appropriate vertices. The value of the offset is *factor* \* ?z + r
\**units*, where ?z is a measurement of the change in depth relative
to the screen area of the polygon, and r is the smallest value that
is guaranteed to produce a resolvable offset for a given
implementation. The offset is added before the depth test is
performed and before the value is written into the depth buffer. The
**glPolygonOffset** function is useful for rendering hidden-line
images, for applying decals to surfaces, and for rendering solids
with highlighted edges. The **glPolygonOffset** function has no
effect on depth coordinates placed in the feedback buffer. It also
has no effect on selection. The following functions retrieve
information related to **glPolygonOffset**: -
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_POLYGON\_OFFSET\_FACTOR -
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_POLYGON\_OFFSET\_UNITS -
[**glIsEnabled**](glisenabled.md) with argument
GL\_POLYGON\_OFFSET\_FILL - [**glIsEnabled**](glisenabled.md) with
argument GL\_POLYGON\_OFFSET\_LINE -
[**glIsEnabled**](glisenabled.md) with argument
GL\_POLYGON\_OFFSET\_POINT > [!Note] > The **glPolygonOffset**
function is only available in OpenGl version 1.1 or greater.


%index
glPolygonStipple
The glPolygonStipple function sets the polygon stippling pattern.
%group
Win32 opengl32
%prm
mask
mask : [var] A pointer to a 32x32 stipple pattern that will be unpacked from memory in the same way that [**glDrawPixels**](gldrawpixels.md) unpacks pixels.
%inst
The glPolygonStipple function sets the polygon stippling pattern.

[戻り値]
This function does not return a value.

[備考]
The **glPolygonStipple** function sets the polygon stippling pattern.
Polygon stippling, like line stippling (see
[**glLineStipple**](gllinestipple.md)), masks out certain fragments
produced by rasterization, creating a pattern. Stippling is
independent of polygon antialiasing. The *mask* parameter is a
pointer to a 32x32 stipple pattern that is stored in memory just like
the pixel data supplied to **glDrawPixels** with *height* and *width*
both equal to 32, a pixel *format* of GL\_COLOR\_INDEX, and data
*type* of GL\_BITMAP. That is, the stipple pattern is represented as
a 32x32 array of 1-bit color indexes packed in unsigned bytes. The
[**glPixelStore**](glpixelstore-functions.md) function parameters,
such as GL\_UNPACK\_SWAP\_BYTES and GL\_UNPACK\_LSB\_FIRST, affect
the assembling of the bits into a stipple pattern. Pixel transfer
operations (shift, offset, and pixel map) are not applied to the
stipple image, however. Polygon stippling is enabled and disabled
with [**glEnable**](glenable.md) and **glDisable**, using argument
GL\_POLYGON\_STIPPLE. If enabled, a rasterized polygon fragment with
window coordinates *x*w and *y*w is sent to the next stage of OpenGL
if and only if the (*x*w mod 32)th bit in the (*y*w mod 32)th row of
the stipple pattern is one. When polygon stippling is disabled, it is
as if the stipple pattern were all ones. The following functions
retrieve information related to **glPolygonStipple**:
[**glGetPolygonStipple**](glgetpolygonstipple.md)
[**glIsEnabled**](glisenabled.md) with argument GL\_POLYGON\_STIPPLE


%index
glPopAttrib
Pops the attribute stack.
%group
Win32 opengl32
%prm

%inst
Pops the attribute stack.

[戻り値]
This function has no parameters.
This function does not return a value.

[備考]
The [**glPushAttrib**](glpushattrib.md) function takes one argument,
a mask that indicates which groups of state variables to save on the
attribute stack. Symbolic constants are used to set bits in the mask.
The mask parameter is typically constructed by **OR**ing several of
these constants together. The special mask GL\_ALL\_ATTRIB\_BITS can
be used to save all stackable states. The **glPopAttrib** function
restores the values of the state variables saved with the last
[**glPushAttrib**](glpushattrib.md) command. Those not saved are left
unchanged. It is an error to push attributes onto a full stack, or to
pop attributes off an empty stack. In either case, the error flag is
set and no other change is made to the OpenGL state. Initially, the
attribute stack is empty. Not all values for the OpenGL state can be
saved on the attribute stack. For example, pixel pack and unpack
state, render mode state, and select and feedback state cannot be
saved. The depth of the attribute stack depends on the
implementation, but it must be at least 16. The following functions
retrieve information related to [**glPushAttrib**](glpushattrib.md)
and **glPopAttrib**:
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_ATTRIB\_STACK\_DEPTH
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_MAX\_ATTRIB\_STACK\_DEPTH


%index
glPopClientAttrib
The glPushClientAttrib and glPopClientAttrib functions save and restore groups of client-state variables on the client-attribute stack. | glPopClientAttrib function (Gl.h)
%group
Win32 opengl32
%prm

%inst
The glPushClientAttrib and glPopClientAttrib functions save and
restore groups of client-state variables on the client-attribute
stack. | glPopClientAttrib function (Gl.h)

[戻り値]
This function has no parameters.
This function does not return a value.

[備考]
The **glPushClientAttrib** function uses its mask parameter to
determine which groups of client-state variables are saved on the
client-attribute stack. You can use the bitwise OR operator to join
together accepted symbolic constants to set bits and construct a
mask. The **glPopClientAttrib** function restores the values of the
client-state variables last saved with **glPushclientAttrib**.
Client-state variables not previously saved are left unchanged.
Pushing attributes onto a full client-attribute stack or popping
attributes off an empty stack sets an error flag and no other change
is made to the OpenGL state. By default the client attribute stack is
empty. Some OpenGL client-state values cannot be saved on the
client-attribute stack. For example, you cannot save the select or
feedback states on the client-attribute stack. The depth of the
client-attribute stack is at least 16. The **glPushclientAttrib** and
**glPopClientAttrib** functions are not compiled into display lists,
but are executed immediately. The **glPushClientAttrib** and
**glPopClientAttrib** functions can only push and pop pixel storage
modes and vertex array client states. You must use
[**glPushAttrib**](glpushattrib.md) and
[**glPopAttrib**](glpopattrib.md) to push and pop states that are
kept on the server. > [!Note] > The **glPushClientAttrib** and
**glPopClientAttrib** functions are only available in OpenGL version
1.1 or later.
The following functions retrieve information related to
**glPushClientAttrib** and **glPopClientAttrib**:
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CLIENT\_ATTRIB\_STACK\_DEPTH
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_MAX\_CLIENT\_ATTRIB\_STACK\_DEPTH


%index
glPopMatrix
The glPushMatrix and glPopMatrix functions push and pop the current matrix stack. | glPopMatrix function (Gl.h)
%group
Win32 opengl32
%prm

%inst
The glPushMatrix and glPopMatrix functions push and pop the current
matrix stack. | glPopMatrix function (Gl.h)

[戻り値]
This function has no parameters.
This function does not return a value.

[備考]
There is a stack of matrices for each of the matrix modes. In
GL\_MODELVIEW mode, the stack depth is at least 32. In the other two
modes, GL\_PROJECTION and GL\_TEXTURE, the depth is at least 2. The
current matrix in any mode is the matrix on the top of the stack for
that mode. The [**glPushMatrix**](glpushmatrix.md) function pushes
the current matrix stack down by one, duplicating the current matrix.
That is, after a **glPushMatrix** call, the matrix on the top of the
stack is identical to the one below it. The **glPopMatrix** function
pops the current matrix stack, replacing the current matrix with the
one below it on the stack. Initially, each of the stacks contains one
matrix, an identity matrix. The following functions retrieve
information related to [**glPushMatrix**](glpushmatrix.md) and
**glPopMatrix**:
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_MATRIX\_MODE **glGet** with argument
GL\_MODELVIEW\_MATRIX **glGet** with argument GL\_PROJECTION\_MATRIX
**glGet** with argument GL\_TEXTURE\_MATRIX **glGet** with argument
GL\_MODELVIEW\_STACK\_DEPTH **glGet** with argument
GL\_PROJECTION\_STACK\_DEPTH **glGet** with argument
GL\_TEXTURE\_STACK\_DEPTH **glGet** with argument
GL\_MAX\_MODELVIEW\_STACK\_DEPTH **glGet** with argument
GL\_MAX\_PROJECTION\_STACK\_DEPTH **glGet** with argument
GL\_MAX\_TEXTURE\_STACK\_DEPTH


%index
glPopName
The glPushName and glPopName functions push and pop the name stack. | glPopName function (Gl.h)
%group
Win32 opengl32
%prm

%inst
The glPushName and glPopName functions push and pop the name stack. |
glPopName function (Gl.h)

[戻り値]
This function has no parameters.
This function does not return a value.

[備考]
The [**glPushName**](glpushname.md) function causes name to be pushed
onto the name stack, which is initially empty. The **glPopName**
function pops one name off the top of the stack. The name stack is
used during selection mode to allow sets of rendering commands to be
uniquely identified. It consists of an ordered set of unsigned
integers. The name stack is always empty while the render mode is not
GL\_SELECT. Calls to [**glPushName**](glpushname.md) or **glPopName**
while the render mode is not GL\_SELECT are ignored. The following
functions retrieve information related to
[**glPushName**](glpushname.md) and **glPopName**:
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_NAME\_STACK\_DEPTH
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_MAX\_NAME\_STACK\_DEPTH


%index
glPrioritizeTextures
The glPrioritizeTextures function sets the residence priority of textures.
%group
Win32 opengl32
%prm
n, textures, priorities
n : [int] The number of textures to be prioritized.
textures : [var] A pointer to the first element of an array containing the names of the textures to be prioritized.
priorities : [var] A pointer to the first element of an array containing the texture priorities. A priority given in an element of the *priorities* parameter applies to the texture named by the corresponding element of the *textures* parameter.
%inst
The glPrioritizeTextures function sets the residence priority of
textures.

[戻り値]
This function does not return a value.

[備考]
The **glPrioritizeTextures** function assigns the *n* texture
priorities specified in the *priorities* parameter to the *n*
textures named in the *textures* parameter. On computers with a
limited amount of texture memory, OpenGL establishes a "working set"
of textures that are resident in texture memory. These textures can
be bound to a texture target much more efficiently than textures that
are not resident. By specifying a priority for each texture, the
**glPrioritizeTextures** function enables you to determine which
textures should be resident. The texture priorities elements in
*priorities* are clamped to the range \[0.0, 1.0\] before being
assigned. Zero indicates the lowest priority; thus textures with
priority zero are least likely to be resident. The value 1.0
indicates the highest priority; thus textures with priority 1.0 are
most likely to be resident. However, textures are not guaranteed to
be resident until they are bound. The **glPrioritizeTextures**
function ignores attempts to prioritize texture 0, or any texture
name that does not correspond to an existing texture. None of the
functions named by the *textures* parameter need to be bound to a
texture target. If a texture is currently bound, you can also use the
[**glTexParameter**](gltexparameter-functions.md) function to set its
priority. This is the only way to set the priority of a default
texture. You can include **glPrioritizeTextures** in display lists.
The following function retrieves the priority of a currently-bound
texture related to **glPrioritizeTextures**: -
[**glGetTexParameter**](glgettexparameter.md) with parameter name
GL\_TEXTURE\_PRIORITY > [!Note] > The **glPrioritizeTextures**
function is only available in OpenGL version 1.1 or later.


%index
glPushAttrib
Pushes the attribute stack.
%group
Win32 opengl32
%prm
mask
mask : [int] A mask that indicates which attributes to save. The symbolic mask constants and their associated OpenGL state are as follows (the indented paragraphs list which attributes are saved):
%inst
Pushes the attribute stack.

[戻り値]
This function does not return a value.

[備考]
The **glPushAttrib** function takes one argument, a mask that
indicates which groups of state variables to save on the attribute
stack. Symbolic constants are used to set bits in the mask. The mask
parameter is typically constructed by applying the logical **OR**
operation to several of these constants. You can use the special mask
GL\_ALL\_ATTRIB\_BITS to save all stackable states. The
[**glPopAttrib**](glpopattrib.md) function restores the values of the
state variables saved with the last **glPushAttrib** command. Those
not saved are left unchanged. It is an error to push attributes onto
a full stack, or to pop attributes off an empty stack. In either
case, the error flag is set and no other change is made to the OpenGL
state. Initially, the attribute stack is empty. Not all values for
the OpenGL state can be saved on the attribute stack. For example,
you cannot save pixel pack and unpack state, render mode state, and
select and feedback state. The depth of the attribute stack depends
on the implementation, but it must be at least 16. The following
functions retrieve information related to **glPushAttrib** and
[**glPopAttrib**](glpopattrib.md):
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_ATTRIB\_STACK\_DEPTH
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_MAX\_ATTRIB\_STACK\_DEPTH


%index
glPushClientAttrib
The glPushClientAttrib and glPopClientAttrib functions save and restore groups of client-state variables on the client-attribute stack. | glPushClientAttrib function (Gl.h)
%group
Win32 opengl32
%prm
mask
mask : [int] A mask that indicates which attributes to save. The following are the symbolic mask constants and their associated OpenGL client states.
%inst
The glPushClientAttrib and glPopClientAttrib functions save and
restore groups of client-state variables on the client-attribute
stack. | glPushClientAttrib function (Gl.h)

[戻り値]
This function does not return a value.

[備考]
The **glPushClientAttrib** function uses its mask parameter to
determine which groups of client-state variables are saved on the
client-attribute stack. You can use the bitwise OR operator to join
together accepted symbolic constants to set bits and construct a
mask. The [**glPopClientAttrib**](glpopclientattrib.md) function
restores the values of the client-state variables last saved with
**glPushclientAttrib**. Client-state variables not previously saved
are left unchanged. Pushing attributes onto a full client-attribute
stack or popping attributes off an empty stack sets an error flag and
no other change is made to the OpenGL state. By default the client
attribute stack is empty. Some OpenGL client-state values cannot be
saved on the client-attribute stack. For example, you cannot save the
select or feedback states on the client-attribute stack. The depth of
the client-attribute stack is at least 16. The **glPushclientAttrib**
and **glPopClientAttrib** functions are not compiled into display
lists, but are executed immediately. The **glPushClientAttrib** and
**glPopClientAttrib** functions can only push and pop pixel storage
modes and vertex array client states. You must use
[**glPushAttrib**](glpushattrib.md) and
[**glPopAttrib**](glpopattrib.md) to push and pop states that are
kept on the server. > [!Note] > The **glPushClientAttrib** and
**glPopClientAttrib** functions are only available in OpenGL version
1.1 or later.
The following functions retrieve information related to
**glPushClientAttrib** and **glPopClientAttrib**:
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CLIENT\_ATTRIB\_STACK\_DEPTH
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_MAX\_CLIENT\_ATTRIB\_STACK\_DEPTH


%index
glPushMatrix
The glPushMatrix and glPopMatrix functions push and pop the current matrix stack. | glPushMatrix function (Gl.h)
%group
Win32 opengl32
%prm

%inst
The glPushMatrix and glPopMatrix functions push and pop the current
matrix stack. | glPushMatrix function (Gl.h)

[戻り値]
This function has no parameters.
This function does not return a value.

[備考]
There is a stack of matrices for each of the matrix modes. In
GL\_MODELVIEW mode, the stack depth is at least 32. In the other two
modes, GL\_PROJECTION and GL\_TEXTURE, the depth is at least 2. The
current matrix in any mode is the matrix on the top of the stack for
that mode. The **glPushMatrix** function pushes the current matrix
stack down by one, duplicating the current matrix. That is, after a
**glPushMatrix** call, the matrix on the top of the stack is
identical to the one below it. The **glPopMatrix** function pops the
current matrix stack, replacing the current matrix with the one below
it on the stack. Initially, each of the stacks contains one matrix,
an identity matrix. The following functions retrieve information
related to **glPushMatrix** and **glPopMatrix**:
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_MATRIX\_MODE **glGet** with argument
GL\_MODELVIEW\_MATRIX **glGet** with argument GL\_PROJECTION\_MATRIX
**glGet** with argument GL\_TEXTURE\_MATRIX **glGet** with argument
GL\_MODELVIEW\_STACK\_DEPTH **glGet** with argument
GL\_PROJECTION\_STACK\_DEPTH **glGet** with argument
GL\_TEXTURE\_STACK\_DEPTH **glGet** with argument
GL\_MAX\_MODELVIEW\_STACK\_DEPTH **glGet** with argument
GL\_MAX\_PROJECTION\_STACK\_DEPTH **glGet** with argument
GL\_MAX\_TEXTURE\_STACK\_DEPTH


%index
glPushName
The glPushName and glPopName functions push and pop the name stack. | glPushName function (Gl.h)
%group
Win32 opengl32
%prm
name
name : [int] A name that will be pushed onto the name stack.
%inst
The glPushName and glPopName functions push and pop the name stack. |
glPushName function (Gl.h)

[戻り値]
This function does not return a value.

[備考]
The **glPushName** function causes name to be pushed onto the name
stack, which is initially empty. The [**glPopName**](glpopname.md)
function pops one name off the top of the stack. The name stack is
used during selection mode to allow sets of rendering commands to be
uniquely identified. It consists of an ordered set of unsigned
integers. The name stack is always empty while the render mode is not
GL\_SELECT. Calls to **glPushName** or [**glPopName**](glpopname.md)
while the render mode is not GL\_SELECT are ignored. The following
functions retrieve information related to **glPushName** and
[**glPopName**](glpopname.md):
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_NAME\_STACK\_DEPTH
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_MAX\_NAME\_STACK\_DEPTH


%index
glRasterPos2d
Specifies the raster position for pixel operations. | glRasterPos2d function (Gl.h)
%group
Win32 opengl32
%prm
x, y
x : [double] Specifies the x-coordinate for the current raster position.
y : [double] Specifies the y-coordinate for the current raster position.
%inst
Specifies the raster position for pixel operations. | glRasterPos2d
function (Gl.h)

[戻り値]
This function does not return a value.

[備考]
OpenGL maintains a 3-D position in window coordinates. This position,
called the raster position, is maintained with subpixel accuracy. It
is used to position pixel and bitmap write operations. See
[**glBitmap**](glbitmap.md), [**glDrawPixels**](gldrawpixels.md), and
[**glCopyPixels**](glcopypixels.md). The current raster position
consists of three window coordinates (*x, y, z*), a clip coordinate
*w* value, an eye coordinate distance, a valid bit, and associated
color data and texture coordinates. The *w* coordinate is a clip
coordinate, because *w* is not projected to window coordinates. The
[glRasterPos4](glrasterpos-functions.md) function specifies object
coordinates *x, y, z*, and *w* explicitly. The glRasterPos3 function
specifies object coordinates *x, y,* and *z* explicitly, while *w* is
implicitly set to one. The glRasterPos2 function uses the argument
values for *x* and *y* while implicitly setting *z* and *w* to zero
and one. The object coordinates presented by
[glRasterPos](glrasterpos-functions.md) are treated just like those
of a [glVertex](glvertex-functions.md) command. They are transformed
by the current modelview and projection matrices and passed to the
clipping stage. If the vertex is not culled, then it is projected and
scaled to window coordinates, which become the new current raster
position, and the GL\_CURRENT\_RASTER\_POSITION\_VALID flag is set.
If the vertex is culled, then the valid bit is cleared and the
current raster position and associated color and texture coordinates
are undefined. The current raster position also includes some
associated color data and texture coordinates. If lighting is
enabled, then GL\_CURRENT\_RASTER\_COLOR, in RGBA mode, or the
GL\_CURRENT\_RASTER\_INDEX, in color-index mode, is set to the color
produced by the lighting calculation (see
[glLight](gllight-functions.md),
[glLightModel](gllightmodel-functions.md), and
[**glShadeModel**](glshademodel.md)). If lighting is disabled,
current color (in RGBA mode, state variable GL\_CURRENT\_COLOR) or
color index (in color-index mode, state variable GL\_CURRENT\_INDEX)
is used to update the current raster color. Likewise,
GL\_CURRENT\_RASTER\_TEXTURE\_COORDS is updated as a function of
GL\_CURRENT\_TEXTURE\_COORDS, based on the texture matrix and the
texture generation functions (see [glTexGen](gltexgen-functions.md)).
Finally, the distance from the origin of the eye coordinate system to
the vertex, as transformed by only the modelview matrix, replaces
GL\_CURRENT\_RASTER\_DISTANCE. Initially, the current raster position
is (0,0,0,1), the current raster distance is 0, the valid bit is set,
the associated RGBA color is (1,1,1,1), the associated color index is
1, and the associated texture coordinates are (0, 0, 0, 1). In RGBA
mode, GL\_CURRENT\_RASTER\_INDEX is always 1; in color-index mode,
the current raster RGBA color always maintains its initial value. >
[!Note] > The raster position is modified both by
[glRasterPos](glrasterpos-functions.md) and by
[**glBitmap**](glbitmap.md).
> [!Note] > When the raster position coordinates are invalid, drawing
commands that are based on the raster position are ignored (that is,
they do not result in changes to the OpenGL state).
The following functions retrieve information related to
[glRasterPos](glrasterpos-functions.md):
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_RASTER\_POSITION
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_RASTER\_POSITION\_VALID
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_RASTER\_DISTANCE
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_RASTER\_COLOR
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_RASTER\_INDEX
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_RASTER\_TEXTURE\_COORDS


%index
glRasterPos2dv
Specifies the raster position for pixel operations. | glRasterPos2dv function (Gl.h)
%group
Win32 opengl32
%prm
v
v : [var] A pointer to an array of two elements, specifying x and y coordinates for the current raster position.
%inst
Specifies the raster position for pixel operations. | glRasterPos2dv
function (Gl.h)

[戻り値]
This function does not return a value.

[備考]
OpenGL maintains a 3-D position in window coordinates. This position,
called the raster position, is maintained with subpixel accuracy. It
is used to position pixel and bitmap write operations. See
[**glBitmap**](glbitmap.md), [**glDrawPixels**](gldrawpixels.md), and
[**glCopyPixels**](glcopypixels.md). The current raster position
consists of three window coordinates (*x, y, z*), a clip coordinate
*w* value, an eye coordinate distance, a valid bit, and associated
color data and texture coordinates. The *w* coordinate is a clip
coordinate, because *w* is not projected to window coordinates. The
[glRasterPos4](glrasterpos-functions.md) function specifies object
coordinates *x, y, z*, and *w* explicitly. The glRasterPos3 function
specifies object coordinates *x, y,* and *z* explicitly, while *w* is
implicitly set to one. The glRasterPos2 function uses the argument
values for *x* and *y* while implicitly setting *z* and *w* to zero
and one. The object coordinates presented by
[glRasterPos](glrasterpos-functions.md) are treated just like those
of a [glVertex](glvertex-functions.md) command. They are transformed
by the current modelview and projection matrices and passed to the
clipping stage. If the vertex is not culled, then it is projected and
scaled to window coordinates, which become the new current raster
position, and the GL\_CURRENT\_RASTER\_POSITION\_VALID flag is set.
If the vertex is culled, then the valid bit is cleared and the
current raster position and associated color and texture coordinates
are undefined. The current raster position also includes some
associated color data and texture coordinates. If lighting is
enabled, then GL\_CURRENT\_RASTER\_COLOR, in RGBA mode, or the
GL\_CURRENT\_RASTER\_INDEX, in color-index mode, is set to the color
produced by the lighting calculation (see
[glLight](gllight-functions.md),
[glLightModel](gllightmodel-functions.md), and
[**glShadeModel**](glshademodel.md)). If lighting is disabled,
current color (in RGBA mode, state variable GL\_CURRENT\_COLOR) or
color index (in color-index mode, state variable GL\_CURRENT\_INDEX)
is used to update the current raster color. Likewise,
GL\_CURRENT\_RASTER\_TEXTURE\_COORDS is updated as a function of
GL\_CURRENT\_TEXTURE\_COORDS, based on the texture matrix and the
texture generation functions (see [glTexGen](gltexgen-functions.md)).
Finally, the distance from the origin of the eye coordinate system to
the vertex, as transformed by only the modelview matrix, replaces
GL\_CURRENT\_RASTER\_DISTANCE. Initially, the current raster position
is (0,0,0,1), the current raster distance is 0, the valid bit is set,
the associated RGBA color is (1,1,1,1), the associated color index is
1, and the associated texture coordinates are (0, 0, 0, 1). In RGBA
mode, GL\_CURRENT\_RASTER\_INDEX is always 1; in color-index mode,
the current raster RGBA color always maintains its initial value. >
[!Note] > The raster position is modified both by
[glRasterPos](glrasterpos-functions.md) and by
[**glBitmap**](glbitmap.md).
> [!Note] > When the raster position coordinates are invalid, drawing
commands that are based on the raster position are ignored (that is,
they do not result in changes to the OpenGL state).
The following functions retrieve information related to
[glRasterPos](glrasterpos-functions.md):
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_RASTER\_POSITION
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_RASTER\_POSITION\_VALID
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_RASTER\_DISTANCE
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_RASTER\_COLOR
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_RASTER\_INDEX
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_RASTER\_TEXTURE\_COORDS


%index
glRasterPos2f
Specifies the raster position for pixel operations. | glRasterPos2f function (Gl.h)
%group
Win32 opengl32
%prm
x, y
x : [float] Specifies the x-coordinate for the current raster position.
y : [float] Specifies the y-coordinate for the current raster position.
%inst
Specifies the raster position for pixel operations. | glRasterPos2f
function (Gl.h)

[戻り値]
This function does not return a value.

[備考]
OpenGL maintains a 3-D position in window coordinates. This position,
called the raster position, is maintained with subpixel accuracy. It
is used to position pixel and bitmap write operations. See
[**glBitmap**](glbitmap.md), [**glDrawPixels**](gldrawpixels.md), and
[**glCopyPixels**](glcopypixels.md). The current raster position
consists of three window coordinates (*x, y, z*), a clip coordinate
*w* value, an eye coordinate distance, a valid bit, and associated
color data and texture coordinates. The *w* coordinate is a clip
coordinate, because *w* is not projected to window coordinates. The
[glRasterPos4](glrasterpos-functions.md) function specifies object
coordinates *x, y, z*, and *w* explicitly. The glRasterPos3 function
specifies object coordinates *x, y,* and *z* explicitly, while *w* is
implicitly set to one. The glRasterPos2 function uses the argument
values for *x* and *y* while implicitly setting *z* and *w* to zero
and one. The object coordinates presented by
[glRasterPos](glrasterpos-functions.md) are treated just like those
of a [glVertex](glvertex-functions.md) command. They are transformed
by the current modelview and projection matrices and passed to the
clipping stage. If the vertex is not culled, then it is projected and
scaled to window coordinates, which become the new current raster
position, and the GL\_CURRENT\_RASTER\_POSITION\_VALID flag is set.
If the vertex is culled, then the valid bit is cleared and the
current raster position and associated color and texture coordinates
are undefined. The current raster position also includes some
associated color data and texture coordinates. If lighting is
enabled, then GL\_CURRENT\_RASTER\_COLOR, in RGBA mode, or the
GL\_CURRENT\_RASTER\_INDEX, in color-index mode, is set to the color
produced by the lighting calculation (see
[glLight](gllight-functions.md),
[glLightModel](gllightmodel-functions.md), and
[**glShadeModel**](glshademodel.md)). If lighting is disabled,
current color (in RGBA mode, state variable GL\_CURRENT\_COLOR) or
color index (in color-index mode, state variable GL\_CURRENT\_INDEX)
is used to update the current raster color. Likewise,
GL\_CURRENT\_RASTER\_TEXTURE\_COORDS is updated as a function of
GL\_CURRENT\_TEXTURE\_COORDS, based on the texture matrix and the
texture generation functions (see [glTexGen](gltexgen-functions.md)).
Finally, the distance from the origin of the eye coordinate system to
the vertex, as transformed by only the modelview matrix, replaces
GL\_CURRENT\_RASTER\_DISTANCE. Initially, the current raster position
is (0,0,0,1), the current raster distance is 0, the valid bit is set,
the associated RGBA color is (1,1,1,1), the associated color index is
1, and the associated texture coordinates are (0, 0, 0, 1). In RGBA
mode, GL\_CURRENT\_RASTER\_INDEX is always 1; in color-index mode,
the current raster RGBA color always maintains its initial value. >
[!Note] > The raster position is modified both by
[glRasterPos](glrasterpos-functions.md) and by
[**glBitmap**](glbitmap.md).
> [!Note] > When the raster position coordinates are invalid, drawing
commands that are based on the raster position are ignored (that is,
they do not result in changes to the OpenGL state).
The following functions retrieve information related to
[glRasterPos](glrasterpos-functions.md):
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_RASTER\_POSITION
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_RASTER\_POSITION\_VALID
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_RASTER\_DISTANCE
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_RASTER\_COLOR
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_RASTER\_INDEX
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_RASTER\_TEXTURE\_COORDS


%index
glRasterPos2fv
Specifies the raster position for pixel operations. | glRasterPos2fv function (Gl.h)
%group
Win32 opengl32
%prm
v
v : [var] A pointer to an array of two elements, specifying x and y coordinates for the current raster position.
%inst
Specifies the raster position for pixel operations. | glRasterPos2fv
function (Gl.h)

[戻り値]
This function does not return a value.

[備考]
OpenGL maintains a 3-D position in window coordinates. This position,
called the raster position, is maintained with subpixel accuracy. It
is used to position pixel and bitmap write operations. See
[**glBitmap**](glbitmap.md), [**glDrawPixels**](gldrawpixels.md), and
[**glCopyPixels**](glcopypixels.md). The current raster position
consists of three window coordinates (*x, y, z*), a clip coordinate
*w* value, an eye coordinate distance, a valid bit, and associated
color data and texture coordinates. The *w* coordinate is a clip
coordinate, because *w* is not projected to window coordinates. The
[glRasterPos4](glrasterpos-functions.md) function specifies object
coordinates *x, y, z*, and *w* explicitly. The glRasterPos3 function
specifies object coordinates *x, y,* and *z* explicitly, while *w* is
implicitly set to one. The glRasterPos2 function uses the argument
values for *x* and *y* while implicitly setting *z* and *w* to zero
and one. The object coordinates presented by
[glRasterPos](glrasterpos-functions.md) are treated just like those
of a [glVertex](glvertex-functions.md) command. They are transformed
by the current modelview and projection matrices and passed to the
clipping stage. If the vertex is not culled, then it is projected and
scaled to window coordinates, which become the new current raster
position, and the GL\_CURRENT\_RASTER\_POSITION\_VALID flag is set.
If the vertex is culled, then the valid bit is cleared and the
current raster position and associated color and texture coordinates
are undefined. The current raster position also includes some
associated color data and texture coordinates. If lighting is
enabled, then GL\_CURRENT\_RASTER\_COLOR, in RGBA mode, or the
GL\_CURRENT\_RASTER\_INDEX, in color-index mode, is set to the color
produced by the lighting calculation (see
[glLight](gllight-functions.md),
[glLightModel](gllightmodel-functions.md), and
[**glShadeModel**](glshademodel.md)). If lighting is disabled,
current color (in RGBA mode, state variable GL\_CURRENT\_COLOR) or
color index (in color-index mode, state variable GL\_CURRENT\_INDEX)
is used to update the current raster color. Likewise,
GL\_CURRENT\_RASTER\_TEXTURE\_COORDS is updated as a function of
GL\_CURRENT\_TEXTURE\_COORDS, based on the texture matrix and the
texture generation functions (see [glTexGen](gltexgen-functions.md)).
Finally, the distance from the origin of the eye coordinate system to
the vertex, as transformed by only the modelview matrix, replaces
GL\_CURRENT\_RASTER\_DISTANCE. Initially, the current raster position
is (0,0,0,1), the current raster distance is 0, the valid bit is set,
the associated RGBA color is (1,1,1,1), the associated color index is
1, and the associated texture coordinates are (0, 0, 0, 1). In RGBA
mode, GL\_CURRENT\_RASTER\_INDEX is always 1; in color-index mode,
the current raster RGBA color always maintains its initial value. >
[!Note] > The raster position is modified both by
[glRasterPos](glrasterpos-functions.md) and by
[**glBitmap**](glbitmap.md).
> [!Note] > When the raster position coordinates are invalid, drawing
commands that are based on the raster position are ignored (that is,
they do not result in changes to the OpenGL state).
The following functions retrieve information related to
[glRasterPos](glrasterpos-functions.md):
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_RASTER\_POSITION
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_RASTER\_POSITION\_VALID
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_RASTER\_DISTANCE
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_RASTER\_COLOR
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_RASTER\_INDEX
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_RASTER\_TEXTURE\_COORDS


%index
glRasterPos2i
Specifies the raster position for pixel operations. | glRasterPos2i function (Gl.h)
%group
Win32 opengl32
%prm
x, y
x : [int] Specifies the x-coordinate for the current raster position.
y : [int] Specifies the y-coordinate for the current raster position.
%inst
Specifies the raster position for pixel operations. | glRasterPos2i
function (Gl.h)

[戻り値]
This function does not return a value.

[備考]
OpenGL maintains a 3-D position in window coordinates. This position,
called the raster position, is maintained with subpixel accuracy. It
is used to position pixel and bitmap write operations. See
[**glBitmap**](glbitmap.md), [**glDrawPixels**](gldrawpixels.md), and
[**glCopyPixels**](glcopypixels.md). The current raster position
consists of three window coordinates (*x, y, z*), a clip coordinate
*w* value, an eye coordinate distance, a valid bit, and associated
color data and texture coordinates. The *w* coordinate is a clip
coordinate, because *w* is not projected to window coordinates. The
[glRasterPos4](glrasterpos-functions.md) function specifies object
coordinates *x, y, z*, and *w* explicitly. The glRasterPos3 function
specifies object coordinates *x, y,* and *z* explicitly, while *w* is
implicitly set to one. The glRasterPos2 function uses the argument
values for *x* and *y* while implicitly setting *z* and *w* to zero
and one. The object coordinates presented by
[glRasterPos](glrasterpos-functions.md) are treated just like those
of a [glVertex](glvertex-functions.md) command. They are transformed
by the current modelview and projection matrices and passed to the
clipping stage. If the vertex is not culled, then it is projected and
scaled to window coordinates, which become the new current raster
position, and the GL\_CURRENT\_RASTER\_POSITION\_VALID flag is set.
If the vertex is culled, then the valid bit is cleared and the
current raster position and associated color and texture coordinates
are undefined. The current raster position also includes some
associated color data and texture coordinates. If lighting is
enabled, then GL\_CURRENT\_RASTER\_COLOR, in RGBA mode, or the
GL\_CURRENT\_RASTER\_INDEX, in color-index mode, is set to the color
produced by the lighting calculation (see
[glLight](gllight-functions.md),
[glLightModel](gllightmodel-functions.md), and
[**glShadeModel**](glshademodel.md)). If lighting is disabled,
current color (in RGBA mode, state variable GL\_CURRENT\_COLOR) or
color index (in color-index mode, state variable GL\_CURRENT\_INDEX)
is used to update the current raster color. Likewise,
GL\_CURRENT\_RASTER\_TEXTURE\_COORDS is updated as a function of
GL\_CURRENT\_TEXTURE\_COORDS, based on the texture matrix and the
texture generation functions (see [glTexGen](gltexgen-functions.md)).
Finally, the distance from the origin of the eye coordinate system to
the vertex, as transformed by only the modelview matrix, replaces
GL\_CURRENT\_RASTER\_DISTANCE. Initially, the current raster position
is (0,0,0,1), the current raster distance is 0, the valid bit is set,
the associated RGBA color is (1,1,1,1), the associated color index is
1, and the associated texture coordinates are (0, 0, 0, 1). In RGBA
mode, GL\_CURRENT\_RASTER\_INDEX is always 1; in color-index mode,
the current raster RGBA color always maintains its initial value. >
[!Note] > The raster position is modified both by
[glRasterPos](glrasterpos-functions.md) and by
[**glBitmap**](glbitmap.md).
> [!Note] > When the raster position coordinates are invalid, drawing
commands that are based on the raster position are ignored (that is,
they do not result in changes to the OpenGL state).
The following functions retrieve information related to
[glRasterPos](glrasterpos-functions.md):
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_RASTER\_POSITION
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_RASTER\_POSITION\_VALID
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_RASTER\_DISTANCE
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_RASTER\_COLOR
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_RASTER\_INDEX
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_RASTER\_TEXTURE\_COORDS


%index
glRasterPos2iv
Specifies the raster position for pixel operations. | glRasterPos2iv function (Gl.h)
%group
Win32 opengl32
%prm
v
v : [var] A pointer to an array of two elements, specifying x and y coordinates for the current raster position.
%inst
Specifies the raster position for pixel operations. | glRasterPos2iv
function (Gl.h)

[戻り値]
This function does not return a value.

[備考]
OpenGL maintains a 3-D position in window coordinates. This position,
called the raster position, is maintained with subpixel accuracy. It
is used to position pixel and bitmap write operations. See
[**glBitmap**](glbitmap.md), [**glDrawPixels**](gldrawpixels.md), and
[**glCopyPixels**](glcopypixels.md). The current raster position
consists of three window coordinates (*x, y, z*), a clip coordinate
*w* value, an eye coordinate distance, a valid bit, and associated
color data and texture coordinates. The *w* coordinate is a clip
coordinate, because *w* is not projected to window coordinates. The
[glRasterPos4](glrasterpos-functions.md) function specifies object
coordinates *x, y, z*, and *w* explicitly. The glRasterPos3 function
specifies object coordinates *x, y,* and *z* explicitly, while *w* is
implicitly set to one. The glRasterPos2 function uses the argument
values for *x* and *y* while implicitly setting *z* and *w* to zero
and one. The object coordinates presented by
[glRasterPos](glrasterpos-functions.md) are treated just like those
of a [glVertex](glvertex-functions.md) command. They are transformed
by the current modelview and projection matrices and passed to the
clipping stage. If the vertex is not culled, then it is projected and
scaled to window coordinates, which become the new current raster
position, and the GL\_CURRENT\_RASTER\_POSITION\_VALID flag is set.
If the vertex is culled, then the valid bit is cleared and the
current raster position and associated color and texture coordinates
are undefined. The current raster position also includes some
associated color data and texture coordinates. If lighting is
enabled, then GL\_CURRENT\_RASTER\_COLOR, in RGBA mode, or the
GL\_CURRENT\_RASTER\_INDEX, in color-index mode, is set to the color
produced by the lighting calculation (see
[glLight](gllight-functions.md),
[glLightModel](gllightmodel-functions.md), and
[**glShadeModel**](glshademodel.md)). If lighting is disabled,
current color (in RGBA mode, state variable GL\_CURRENT\_COLOR) or
color index (in color-index mode, state variable GL\_CURRENT\_INDEX)
is used to update the current raster color. Likewise,
GL\_CURRENT\_RASTER\_TEXTURE\_COORDS is updated as a function of
GL\_CURRENT\_TEXTURE\_COORDS, based on the texture matrix and the
texture generation functions (see [glTexGen](gltexgen-functions.md)).
Finally, the distance from the origin of the eye coordinate system to
the vertex, as transformed by only the modelview matrix, replaces
GL\_CURRENT\_RASTER\_DISTANCE. Initially, the current raster position
is (0,0,0,1), the current raster distance is 0, the valid bit is set,
the associated RGBA color is (1,1,1,1), the associated color index is
1, and the associated texture coordinates are (0, 0, 0, 1). In RGBA
mode, GL\_CURRENT\_RASTER\_INDEX is always 1; in color-index mode,
the current raster RGBA color always maintains its initial value. >
[!Note] > The raster position is modified both by
[glRasterPos](glrasterpos-functions.md) and by
[**glBitmap**](glbitmap.md).
> [!Note] > When the raster position coordinates are invalid, drawing
commands that are based on the raster position are ignored (that is,
they do not result in changes to the OpenGL state).
The following functions retrieve information related to
[glRasterPos](glrasterpos-functions.md):
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_RASTER\_POSITION
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_RASTER\_POSITION\_VALID
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_RASTER\_DISTANCE
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_RASTER\_COLOR
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_RASTER\_INDEX
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_RASTER\_TEXTURE\_COORDS


%index
glRasterPos2s
Specifies the raster position for pixel operations. | glRasterPos2s function (Gl.h)
%group
Win32 opengl32
%prm
x, y
x : [int] Specifies the x-coordinate for the current raster position.
y : [int] Specifies the y-coordinate for the current raster position.
%inst
Specifies the raster position for pixel operations. | glRasterPos2s
function (Gl.h)

[戻り値]
This function does not return a value.

[備考]
OpenGL maintains a 3-D position in window coordinates. This position,
called the raster position, is maintained with subpixel accuracy. It
is used to position pixel and bitmap write operations. See
[**glBitmap**](glbitmap.md), [**glDrawPixels**](gldrawpixels.md), and
[**glCopyPixels**](glcopypixels.md). The current raster position
consists of three window coordinates (*x, y, z*), a clip coordinate
*w* value, an eye coordinate distance, a valid bit, and associated
color data and texture coordinates. The *w* coordinate is a clip
coordinate, because *w* is not projected to window coordinates. The
[glRasterPos4](glrasterpos-functions.md) function specifies object
coordinates *x, y, z*, and *w* explicitly. The glRasterPos3 function
specifies object coordinates *x, y,* and *z* explicitly, while *w* is
implicitly set to one. The glRasterPos2 function uses the argument
values for *x* and *y* while implicitly setting *z* and *w* to zero
and one. The object coordinates presented by
[glRasterPos](glrasterpos-functions.md) are treated just like those
of a [glVertex](glvertex-functions.md) command. They are transformed
by the current modelview and projection matrices and passed to the
clipping stage. If the vertex is not culled, then it is projected and
scaled to window coordinates, which become the new current raster
position, and the GL\_CURRENT\_RASTER\_POSITION\_VALID flag is set.
If the vertex is culled, then the valid bit is cleared and the
current raster position and associated color and texture coordinates
are undefined. The current raster position also includes some
associated color data and texture coordinates. If lighting is
enabled, then GL\_CURRENT\_RASTER\_COLOR, in RGBA mode, or the
GL\_CURRENT\_RASTER\_INDEX, in color-index mode, is set to the color
produced by the lighting calculation (see
[glLight](gllight-functions.md),
[glLightModel](gllightmodel-functions.md), and
[**glShadeModel**](glshademodel.md)). If lighting is disabled,
current color (in RGBA mode, state variable GL\_CURRENT\_COLOR) or
color index (in color-index mode, state variable GL\_CURRENT\_INDEX)
is used to update the current raster color. Likewise,
GL\_CURRENT\_RASTER\_TEXTURE\_COORDS is updated as a function of
GL\_CURRENT\_TEXTURE\_COORDS, based on the texture matrix and the
texture generation functions (see [glTexGen](gltexgen-functions.md)).
Finally, the distance from the origin of the eye coordinate system to
the vertex, as transformed by only the modelview matrix, replaces
GL\_CURRENT\_RASTER\_DISTANCE. Initially, the current raster position
is (0,0,0,1), the current raster distance is 0, the valid bit is set,
the associated RGBA color is (1,1,1,1), the associated color index is
1, and the associated texture coordinates are (0, 0, 0, 1). In RGBA
mode, GL\_CURRENT\_RASTER\_INDEX is always 1; in color-index mode,
the current raster RGBA color always maintains its initial value. >
[!Note] > The raster position is modified both by
[glRasterPos](glrasterpos-functions.md) and by
[**glBitmap**](glbitmap.md).
> [!Note] > When the raster position coordinates are invalid, drawing
commands that are based on the raster position are ignored (that is,
they do not result in changes to the OpenGL state).
The following functions retrieve information related to
[glRasterPos](glrasterpos-functions.md):
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_RASTER\_POSITION
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_RASTER\_POSITION\_VALID
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_RASTER\_DISTANCE
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_RASTER\_COLOR
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_RASTER\_INDEX
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_RASTER\_TEXTURE\_COORDS


%index
glRasterPos2sv
Specifies the raster position for pixel operations. | glRasterPos2sv function (Gl.h)
%group
Win32 opengl32
%prm
v
v : [var] A pointer to an array of two elements, specifying x and y coordinates for the current raster position.
%inst
Specifies the raster position for pixel operations. | glRasterPos2sv
function (Gl.h)

[戻り値]
This function does not return a value.

[備考]
OpenGL maintains a 3-D position in window coordinates. This position,
called the raster position, is maintained with subpixel accuracy. It
is used to position pixel and bitmap write operations. See
[**glBitmap**](glbitmap.md), [**glDrawPixels**](gldrawpixels.md), and
[**glCopyPixels**](glcopypixels.md). The current raster position
consists of three window coordinates (*x, y, z*), a clip coordinate
*w* value, an eye coordinate distance, a valid bit, and associated
color data and texture coordinates. The *w* coordinate is a clip
coordinate, because *w* is not projected to window coordinates. The
[glRasterPos4](glrasterpos-functions.md) function specifies object
coordinates *x, y, z*, and *w* explicitly. The glRasterPos3 function
specifies object coordinates *x, y,* and *z* explicitly, while *w* is
implicitly set to one. The glRasterPos2 function uses the argument
values for *x* and *y* while implicitly setting *z* and *w* to zero
and one. The object coordinates presented by
[glRasterPos](glrasterpos-functions.md) are treated just like those
of a [glVertex](glvertex-functions.md) command. They are transformed
by the current modelview and projection matrices and passed to the
clipping stage. If the vertex is not culled, then it is projected and
scaled to window coordinates, which become the new current raster
position, and the GL\_CURRENT\_RASTER\_POSITION\_VALID flag is set.
If the vertex is culled, then the valid bit is cleared and the
current raster position and associated color and texture coordinates
are undefined. The current raster position also includes some
associated color data and texture coordinates. If lighting is
enabled, then GL\_CURRENT\_RASTER\_COLOR, in RGBA mode, or the
GL\_CURRENT\_RASTER\_INDEX, in color-index mode, is set to the color
produced by the lighting calculation (see
[glLight](gllight-functions.md),
[glLightModel](gllightmodel-functions.md), and
[**glShadeModel**](glshademodel.md)). If lighting is disabled,
current color (in RGBA mode, state variable GL\_CURRENT\_COLOR) or
color index (in color-index mode, state variable GL\_CURRENT\_INDEX)
is used to update the current raster color. Likewise,
GL\_CURRENT\_RASTER\_TEXTURE\_COORDS is updated as a function of
GL\_CURRENT\_TEXTURE\_COORDS, based on the texture matrix and the
texture generation functions (see [glTexGen](gltexgen-functions.md)).
Finally, the distance from the origin of the eye coordinate system to
the vertex, as transformed by only the modelview matrix, replaces
GL\_CURRENT\_RASTER\_DISTANCE. Initially, the current raster position
is (0,0,0,1), the current raster distance is 0, the valid bit is set,
the associated RGBA color is (1,1,1,1), the associated color index is
1, and the associated texture coordinates are (0, 0, 0, 1). In RGBA
mode, GL\_CURRENT\_RASTER\_INDEX is always 1; in color-index mode,
the current raster RGBA color always maintains its initial value. >
[!Note] > The raster position is modified both by
[glRasterPos](glrasterpos-functions.md) and by
[**glBitmap**](glbitmap.md).
> [!Note] > When the raster position coordinates are invalid, drawing
commands that are based on the raster position are ignored (that is,
they do not result in changes to the OpenGL state).
The following functions retrieve information related to
[glRasterPos](glrasterpos-functions.md):
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_RASTER\_POSITION
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_RASTER\_POSITION\_VALID
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_RASTER\_DISTANCE
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_RASTER\_COLOR
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_RASTER\_INDEX
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_RASTER\_TEXTURE\_COORDS


%index
glRasterPos3d
Specifies the raster position for pixel operations. | glRasterPos3d function (Gl.h)
%group
Win32 opengl32
%prm
x, y, z
x : [double] Specifies the x-coordinate for the current raster position.
y : [double] Specifies the y-coordinate for the current raster position.
z : [double] Specifies the z-coordinate for the current raster position.
%inst
Specifies the raster position for pixel operations. | glRasterPos3d
function (Gl.h)

[戻り値]
This function does not return a value.

[備考]
OpenGL maintains a 3-D position in window coordinates. This position,
called the raster position, is maintained with subpixel accuracy. It
is used to position pixel and bitmap write operations. See
[**glBitmap**](glbitmap.md), [**glDrawPixels**](gldrawpixels.md), and
[**glCopyPixels**](glcopypixels.md). The current raster position
consists of three window coordinates (*x, y, z*), a clip coordinate
*w* value, an eye coordinate distance, a valid bit, and associated
color data and texture coordinates. The *w* coordinate is a clip
coordinate, because *w* is not projected to window coordinates. The
[glRasterPos4](glrasterpos-functions.md) function specifies object
coordinates *x, y, z*, and *w* explicitly. The glRasterPos3 function
specifies object coordinates *x, y,* and *z* explicitly, while *w* is
implicitly set to one. The glRasterPos2 function uses the argument
values for *x* and *y* while implicitly setting *z* and *w* to zero
and one. The object coordinates presented by
[glRasterPos](glrasterpos-functions.md) are treated just like those
of a [glVertex](glvertex-functions.md) command. They are transformed
by the current modelview and projection matrices and passed to the
clipping stage. If the vertex is not culled, then it is projected and
scaled to window coordinates, which become the new current raster
position, and the GL\_CURRENT\_RASTER\_POSITION\_VALID flag is set.
If the vertex is culled, then the valid bit is cleared and the
current raster position and associated color and texture coordinates
are undefined. The current raster position also includes some
associated color data and texture coordinates. If lighting is
enabled, then GL\_CURRENT\_RASTER\_COLOR, in RGBA mode, or the
GL\_CURRENT\_RASTER\_INDEX, in color-index mode, is set to the color
produced by the lighting calculation (see
[glLight](gllight-functions.md),
[glLightModel](gllightmodel-functions.md), and
[**glShadeModel**](glshademodel.md)). If lighting is disabled,
current color (in RGBA mode, state variable GL\_CURRENT\_COLOR) or
color index (in color-index mode, state variable GL\_CURRENT\_INDEX)
is used to update the current raster color. Likewise,
GL\_CURRENT\_RASTER\_TEXTURE\_COORDS is updated as a function of
GL\_CURRENT\_TEXTURE\_COORDS, based on the texture matrix and the
texture generation functions (see [glTexGen](gltexgen-functions.md)).
Finally, the distance from the origin of the eye coordinate system to
the vertex, as transformed by only the modelview matrix, replaces
GL\_CURRENT\_RASTER\_DISTANCE. Initially, the current raster position
is (0,0,0,1), the current raster distance is 0, the valid bit is set,
the associated RGBA color is (1,1,1,1), the associated color index is
1, and the associated texture coordinates are (0, 0, 0, 1). In RGBA
mode, GL\_CURRENT\_RASTER\_INDEX is always 1; in color-index mode,
the current raster RGBA color always maintains its initial value. >
[!Note] > The raster position is modified both by
[glRasterPos](glrasterpos-functions.md) and by
[**glBitmap**](glbitmap.md).
> [!Note] > When the raster position coordinates are invalid, drawing
commands that are based on the raster position are ignored (that is,
they do not result in changes to the OpenGL state).
The following functions retrieve information related to
[glRasterPos](glrasterpos-functions.md):
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_RASTER\_POSITION
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_RASTER\_POSITION\_VALID
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_RASTER\_DISTANCE
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_RASTER\_COLOR
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_RASTER\_INDEX
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_RASTER\_TEXTURE\_COORDS


%index
glRasterPos3dv
Specifies the raster position for pixel operations. | glRasterPos3dv function (Gl.h)
%group
Win32 opengl32
%prm
v
v : [var] A pointer to an array of three elements, specifying x, y, and z coordinates for the current raster position.
%inst
Specifies the raster position for pixel operations. | glRasterPos3dv
function (Gl.h)

[戻り値]
This function does not return a value.

[備考]
OpenGL maintains a 3-D position in window coordinates. This position,
called the raster position, is maintained with subpixel accuracy. It
is used to position pixel and bitmap write operations. See
[**glBitmap**](glbitmap.md), [**glDrawPixels**](gldrawpixels.md), and
[**glCopyPixels**](glcopypixels.md). The current raster position
consists of three window coordinates (*x, y, z*), a clip coordinate
*w* value, an eye coordinate distance, a valid bit, and associated
color data and texture coordinates. The *w* coordinate is a clip
coordinate, because *w* is not projected to window coordinates. The
[glRasterPos4](glrasterpos-functions.md) function specifies object
coordinates *x, y, z*, and *w* explicitly. The glRasterPos3 function
specifies object coordinates *x, y,* and *z* explicitly, while *w* is
implicitly set to one. The glRasterPos2 function uses the argument
values for *x* and *y* while implicitly setting *z* and *w* to zero
and one. The object coordinates presented by
[glRasterPos](glrasterpos-functions.md) are treated just like those
of a [glVertex](glvertex-functions.md) command. They are transformed
by the current modelview and projection matrices and passed to the
clipping stage. If the vertex is not culled, then it is projected and
scaled to window coordinates, which become the new current raster
position, and the GL\_CURRENT\_RASTER\_POSITION\_VALID flag is set.
If the vertex is culled, then the valid bit is cleared and the
current raster position and associated color and texture coordinates
are undefined. The current raster position also includes some
associated color data and texture coordinates. If lighting is
enabled, then GL\_CURRENT\_RASTER\_COLOR, in RGBA mode, or the
GL\_CURRENT\_RASTER\_INDEX, in color-index mode, is set to the color
produced by the lighting calculation (see
[glLight](gllight-functions.md),
[glLightModel](gllightmodel-functions.md), and
[**glShadeModel**](glshademodel.md)). If lighting is disabled,
current color (in RGBA mode, state variable GL\_CURRENT\_COLOR) or
color index (in color-index mode, state variable GL\_CURRENT\_INDEX)
is used to update the current raster color. Likewise,
GL\_CURRENT\_RASTER\_TEXTURE\_COORDS is updated as a function of
GL\_CURRENT\_TEXTURE\_COORDS, based on the texture matrix and the
texture generation functions (see [glTexGen](gltexgen-functions.md)).
Finally, the distance from the origin of the eye coordinate system to
the vertex, as transformed by only the modelview matrix, replaces
GL\_CURRENT\_RASTER\_DISTANCE. Initially, the current raster position
is (0,0,0,1), the current raster distance is 0, the valid bit is set,
the associated RGBA color is (1,1,1,1), the associated color index is
1, and the associated texture coordinates are (0, 0, 0, 1). In RGBA
mode, GL\_CURRENT\_RASTER\_INDEX is always 1; in color-index mode,
the current raster RGBA color always maintains its initial value. >
[!Note] > The raster position is modified both by
[glRasterPos](glrasterpos-functions.md) and by
[**glBitmap**](glbitmap.md).
> [!Note] > When the raster position coordinates are invalid, drawing
commands that are based on the raster position are ignored (that is,
they do not result in changes to the OpenGL state).
The following functions retrieve information related to
[glRasterPos](glrasterpos-functions.md):
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_RASTER\_POSITION
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_RASTER\_POSITION\_VALID
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_RASTER\_DISTANCE
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_RASTER\_COLOR
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_RASTER\_INDEX
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_RASTER\_TEXTURE\_COORDS


%index
glRasterPos3f
Specifies the raster position for pixel operations. | glRasterPos3f function (Gl.h)
%group
Win32 opengl32
%prm
x, y, z
x : [float] Specifies the x-coordinate for the current raster position.
y : [float] Specifies the y-coordinate for the current raster position.
z : [float] Specifies the z-coordinate for the current raster position.
%inst
Specifies the raster position for pixel operations. | glRasterPos3f
function (Gl.h)

[戻り値]
This function does not return a value.

[備考]
OpenGL maintains a 3-D position in window coordinates. This position,
called the raster position, is maintained with subpixel accuracy. It
is used to position pixel and bitmap write operations. See
[**glBitmap**](glbitmap.md), [**glDrawPixels**](gldrawpixels.md), and
[**glCopyPixels**](glcopypixels.md). The current raster position
consists of three window coordinates (*x, y, z*), a clip coordinate
*w* value, an eye coordinate distance, a valid bit, and associated
color data and texture coordinates. The *w* coordinate is a clip
coordinate, because *w* is not projected to window coordinates. The
[glRasterPos4](glrasterpos-functions.md) function specifies object
coordinates *x, y, z*, and *w* explicitly. The glRasterPos3 function
specifies object coordinates *x, y,* and *z* explicitly, while *w* is
implicitly set to one. The glRasterPos2 function uses the argument
values for *x* and *y* while implicitly setting *z* and *w* to zero
and one. The object coordinates presented by
[glRasterPos](glrasterpos-functions.md) are treated just like those
of a [glVertex](glvertex-functions.md) command. They are transformed
by the current modelview and projection matrices and passed to the
clipping stage. If the vertex is not culled, then it is projected and
scaled to window coordinates, which become the new current raster
position, and the GL\_CURRENT\_RASTER\_POSITION\_VALID flag is set.
If the vertex is culled, then the valid bit is cleared and the
current raster position and associated color and texture coordinates
are undefined. The current raster position also includes some
associated color data and texture coordinates. If lighting is
enabled, then GL\_CURRENT\_RASTER\_COLOR, in RGBA mode, or the
GL\_CURRENT\_RASTER\_INDEX, in color-index mode, is set to the color
produced by the lighting calculation (see
[glLight](gllight-functions.md),
[glLightModel](gllightmodel-functions.md), and
[**glShadeModel**](glshademodel.md)). If lighting is disabled,
current color (in RGBA mode, state variable GL\_CURRENT\_COLOR) or
color index (in color-index mode, state variable GL\_CURRENT\_INDEX)
is used to update the current raster color. Likewise,
GL\_CURRENT\_RASTER\_TEXTURE\_COORDS is updated as a function of
GL\_CURRENT\_TEXTURE\_COORDS, based on the texture matrix and the
texture generation functions (see [glTexGen](gltexgen-functions.md)).
Finally, the distance from the origin of the eye coordinate system to
the vertex, as transformed by only the modelview matrix, replaces
GL\_CURRENT\_RASTER\_DISTANCE. Initially, the current raster position
is (0,0,0,1), the current raster distance is 0, the valid bit is set,
the associated RGBA color is (1,1,1,1), the associated color index is
1, and the associated texture coordinates are (0, 0, 0, 1). In RGBA
mode, GL\_CURRENT\_RASTER\_INDEX is always 1; in color-index mode,
the current raster RGBA color always maintains its initial value. >
[!Note] > The raster position is modified both by
[glRasterPos](glrasterpos-functions.md) and by
[**glBitmap**](glbitmap.md).
> [!Note] > When the raster position coordinates are invalid, drawing
commands that are based on the raster position are ignored (that is,
they do not result in changes to the OpenGL state).
The following functions retrieve information related to
[glRasterPos](glrasterpos-functions.md):
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_RASTER\_POSITION
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_RASTER\_POSITION\_VALID
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_RASTER\_DISTANCE
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_RASTER\_COLOR
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_RASTER\_INDEX
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_RASTER\_TEXTURE\_COORDS


%index
glRasterPos3fv
Specifies the raster position for pixel operations. | glRasterPos3fv function (Gl.h)
%group
Win32 opengl32
%prm
v
v : [var] A pointer to an array of three elements, specifying x, y, and z coordinates for the current raster position.
%inst
Specifies the raster position for pixel operations. | glRasterPos3fv
function (Gl.h)

[戻り値]
This function does not return a value.

[備考]
OpenGL maintains a 3-D position in window coordinates. This position,
called the raster position, is maintained with subpixel accuracy. It
is used to position pixel and bitmap write operations. See
[**glBitmap**](glbitmap.md), [**glDrawPixels**](gldrawpixels.md), and
[**glCopyPixels**](glcopypixels.md). The current raster position
consists of three window coordinates (*x, y, z*), a clip coordinate
*w* value, an eye coordinate distance, a valid bit, and associated
color data and texture coordinates. The *w* coordinate is a clip
coordinate, because *w* is not projected to window coordinates. The
[glRasterPos4](glrasterpos-functions.md) function specifies object
coordinates *x, y, z*, and *w* explicitly. The glRasterPos3 function
specifies object coordinates *x, y,* and *z* explicitly, while *w* is
implicitly set to one. The glRasterPos2 function uses the argument
values for *x* and *y* while implicitly setting *z* and *w* to zero
and one. The object coordinates presented by
[glRasterPos](glrasterpos-functions.md) are treated just like those
of a [glVertex](glvertex-functions.md) command. They are transformed
by the current modelview and projection matrices and passed to the
clipping stage. If the vertex is not culled, then it is projected and
scaled to window coordinates, which become the new current raster
position, and the GL\_CURRENT\_RASTER\_POSITION\_VALID flag is set.
If the vertex is culled, then the valid bit is cleared and the
current raster position and associated color and texture coordinates
are undefined. The current raster position also includes some
associated color data and texture coordinates. If lighting is
enabled, then GL\_CURRENT\_RASTER\_COLOR, in RGBA mode, or the
GL\_CURRENT\_RASTER\_INDEX, in color-index mode, is set to the color
produced by the lighting calculation (see
[glLight](gllight-functions.md),
[glLightModel](gllightmodel-functions.md), and
[**glShadeModel**](glshademodel.md)). If lighting is disabled,
current color (in RGBA mode, state variable GL\_CURRENT\_COLOR) or
color index (in color-index mode, state variable GL\_CURRENT\_INDEX)
is used to update the current raster color. Likewise,
GL\_CURRENT\_RASTER\_TEXTURE\_COORDS is updated as a function of
GL\_CURRENT\_TEXTURE\_COORDS, based on the texture matrix and the
texture generation functions (see [glTexGen](gltexgen-functions.md)).
Finally, the distance from the origin of the eye coordinate system to
the vertex, as transformed by only the modelview matrix, replaces
GL\_CURRENT\_RASTER\_DISTANCE. Initially, the current raster position
is (0,0,0,1), the current raster distance is 0, the valid bit is set,
the associated RGBA color is (1,1,1,1), the associated color index is
1, and the associated texture coordinates are (0, 0, 0, 1). In RGBA
mode, GL\_CURRENT\_RASTER\_INDEX is always 1; in color-index mode,
the current raster RGBA color always maintains its initial value. >
[!Note] > The raster position is modified both by
[glRasterPos](glrasterpos-functions.md) and by
[**glBitmap**](glbitmap.md).
> [!Note] > When the raster position coordinates are invalid, drawing
commands that are based on the raster position are ignored (that is,
they do not result in changes to the OpenGL state).
The following functions retrieve information related to
[glRasterPos](glrasterpos-functions.md):
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_RASTER\_POSITION
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_RASTER\_POSITION\_VALID
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_RASTER\_DISTANCE
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_RASTER\_COLOR
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_RASTER\_INDEX
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_RASTER\_TEXTURE\_COORDS


%index
glRasterPos3i
Specifies the raster position for pixel operations. | glRasterPos3i function (Gl.h)
%group
Win32 opengl32
%prm
x, y, z
x : [int] Specifies the x-coordinate for the current raster position.
y : [int] Specifies the y-coordinate for the current raster position.
z : [int] Specifies the z-coordinate for the current raster position.
%inst
Specifies the raster position for pixel operations. | glRasterPos3i
function (Gl.h)

[戻り値]
This function does not return a value.

[備考]
OpenGL maintains a 3-D position in window coordinates. This position,
called the raster position, is maintained with subpixel accuracy. It
is used to position pixel and bitmap write operations. See
[**glBitmap**](glbitmap.md), [**glDrawPixels**](gldrawpixels.md), and
[**glCopyPixels**](glcopypixels.md). The current raster position
consists of three window coordinates (*x, y, z*), a clip coordinate
*w* value, an eye coordinate distance, a valid bit, and associated
color data and texture coordinates. The *w* coordinate is a clip
coordinate, because *w* is not projected to window coordinates. The
[glRasterPos4](glrasterpos-functions.md) function specifies object
coordinates *x, y, z*, and *w* explicitly. The glRasterPos3 function
specifies object coordinates *x, y,* and *z* explicitly, while *w* is
implicitly set to one. The glRasterPos2 function uses the argument
values for *x* and *y* while implicitly setting *z* and *w* to zero
and one. The object coordinates presented by
[glRasterPos](glrasterpos-functions.md) are treated just like those
of a [glVertex](glvertex-functions.md) command. They are transformed
by the current modelview and projection matrices and passed to the
clipping stage. If the vertex is not culled, then it is projected and
scaled to window coordinates, which become the new current raster
position, and the GL\_CURRENT\_RASTER\_POSITION\_VALID flag is set.
If the vertex is culled, then the valid bit is cleared and the
current raster position and associated color and texture coordinates
are undefined. The current raster position also includes some
associated color data and texture coordinates. If lighting is
enabled, then GL\_CURRENT\_RASTER\_COLOR, in RGBA mode, or the
GL\_CURRENT\_RASTER\_INDEX, in color-index mode, is set to the color
produced by the lighting calculation (see
[glLight](gllight-functions.md),
[glLightModel](gllightmodel-functions.md), and
[**glShadeModel**](glshademodel.md)). If lighting is disabled,
current color (in RGBA mode, state variable GL\_CURRENT\_COLOR) or
color index (in color-index mode, state variable GL\_CURRENT\_INDEX)
is used to update the current raster color. Likewise,
GL\_CURRENT\_RASTER\_TEXTURE\_COORDS is updated as a function of
GL\_CURRENT\_TEXTURE\_COORDS, based on the texture matrix and the
texture generation functions (see [glTexGen](gltexgen-functions.md)).
Finally, the distance from the origin of the eye coordinate system to
the vertex, as transformed by only the modelview matrix, replaces
GL\_CURRENT\_RASTER\_DISTANCE. Initially, the current raster position
is (0,0,0,1), the current raster distance is 0, the valid bit is set,
the associated RGBA color is (1,1,1,1), the associated color index is
1, and the associated texture coordinates are (0, 0, 0, 1). In RGBA
mode, GL\_CURRENT\_RASTER\_INDEX is always 1; in color-index mode,
the current raster RGBA color always maintains its initial value. >
[!Note] > The raster position is modified both by
[glRasterPos](glrasterpos-functions.md) and by
[**glBitmap**](glbitmap.md).
> [!Note] > When the raster position coordinates are invalid, drawing
commands that are based on the raster position are ignored (that is,
they do not result in changes to the OpenGL state).
The following functions retrieve information related to
[glRasterPos](glrasterpos-functions.md):
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_RASTER\_POSITION
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_RASTER\_POSITION\_VALID
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_RASTER\_DISTANCE
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_RASTER\_COLOR
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_RASTER\_INDEX
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_RASTER\_TEXTURE\_COORDS


%index
glRasterPos3iv
Specifies the raster position for pixel operations. | glRasterPos3iv function (Gl.h)
%group
Win32 opengl32
%prm
v
v : [var] A pointer to an array of three elements, specifying x, y, and z coordinates for the current raster position.
%inst
Specifies the raster position for pixel operations. | glRasterPos3iv
function (Gl.h)

[戻り値]
This function does not return a value.

[備考]
OpenGL maintains a 3-D position in window coordinates. This position,
called the raster position, is maintained with subpixel accuracy. It
is used to position pixel and bitmap write operations. See
[**glBitmap**](glbitmap.md), [**glDrawPixels**](gldrawpixels.md), and
[**glCopyPixels**](glcopypixels.md). The current raster position
consists of three window coordinates (*x, y, z*), a clip coordinate
*w* value, an eye coordinate distance, a valid bit, and associated
color data and texture coordinates. The *w* coordinate is a clip
coordinate, because *w* is not projected to window coordinates. The
[glRasterPos4](glrasterpos-functions.md) function specifies object
coordinates *x, y, z*, and *w* explicitly. The glRasterPos3 function
specifies object coordinates *x, y,* and *z* explicitly, while *w* is
implicitly set to one. The glRasterPos2 function uses the argument
values for *x* and *y* while implicitly setting *z* and *w* to zero
and one. The object coordinates presented by
[glRasterPos](glrasterpos-functions.md) are treated just like those
of a [glVertex](glvertex-functions.md) command. They are transformed
by the current modelview and projection matrices and passed to the
clipping stage. If the vertex is not culled, then it is projected and
scaled to window coordinates, which become the new current raster
position, and the GL\_CURRENT\_RASTER\_POSITION\_VALID flag is set.
If the vertex is culled, then the valid bit is cleared and the
current raster position and associated color and texture coordinates
are undefined. The current raster position also includes some
associated color data and texture coordinates. If lighting is
enabled, then GL\_CURRENT\_RASTER\_COLOR, in RGBA mode, or the
GL\_CURRENT\_RASTER\_INDEX, in color-index mode, is set to the color
produced by the lighting calculation (see
[glLight](gllight-functions.md),
[glLightModel](gllightmodel-functions.md), and
[**glShadeModel**](glshademodel.md)). If lighting is disabled,
current color (in RGBA mode, state variable GL\_CURRENT\_COLOR) or
color index (in color-index mode, state variable GL\_CURRENT\_INDEX)
is used to update the current raster color. Likewise,
GL\_CURRENT\_RASTER\_TEXTURE\_COORDS is updated as a function of
GL\_CURRENT\_TEXTURE\_COORDS, based on the texture matrix and the
texture generation functions (see [glTexGen](gltexgen-functions.md)).
Finally, the distance from the origin of the eye coordinate system to
the vertex, as transformed by only the modelview matrix, replaces
GL\_CURRENT\_RASTER\_DISTANCE. Initially, the current raster position
is (0,0,0,1), the current raster distance is 0, the valid bit is set,
the associated RGBA color is (1,1,1,1), the associated color index is
1, and the associated texture coordinates are (0, 0, 0, 1). In RGBA
mode, GL\_CURRENT\_RASTER\_INDEX is always 1; in color-index mode,
the current raster RGBA color always maintains its initial value. >
[!Note] > The raster position is modified both by
[glRasterPos](glrasterpos-functions.md) and by
[**glBitmap**](glbitmap.md).
> [!Note] > When the raster position coordinates are invalid, drawing
commands that are based on the raster position are ignored (that is,
they do not result in changes to the OpenGL state).
The following functions retrieve information related to
[glRasterPos](glrasterpos-functions.md):
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_RASTER\_POSITION
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_RASTER\_POSITION\_VALID
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_RASTER\_DISTANCE
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_RASTER\_COLOR
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_RASTER\_INDEX
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_RASTER\_TEXTURE\_COORDS


%index
glRasterPos3s
Specifies the raster position for pixel operations. | glRasterPos3s function (Gl.h)
%group
Win32 opengl32
%prm
x, y, z
x : [int] Specifies the x-coordinate for the current raster position.
y : [int] Specifies the y-coordinate for the current raster position.
z : [int] Specifies the z-coordinate for the current raster position.
%inst
Specifies the raster position for pixel operations. | glRasterPos3s
function (Gl.h)

[戻り値]
This function does not return a value.

[備考]
OpenGL maintains a 3-D position in window coordinates. This position,
called the raster position, is maintained with subpixel accuracy. It
is used to position pixel and bitmap write operations. See
[**glBitmap**](glbitmap.md), [**glDrawPixels**](gldrawpixels.md), and
[**glCopyPixels**](glcopypixels.md). The current raster position
consists of three window coordinates (*x, y, z*), a clip coordinate
*w* value, an eye coordinate distance, a valid bit, and associated
color data and texture coordinates. The *w* coordinate is a clip
coordinate, because *w* is not projected to window coordinates. The
[glRasterPos4](glrasterpos-functions.md) function specifies object
coordinates *x, y, z*, and *w* explicitly. The glRasterPos3 function
specifies object coordinates *x, y,* and *z* explicitly, while *w* is
implicitly set to one. The glRasterPos2 function uses the argument
values for *x* and *y* while implicitly setting *z* and *w* to zero
and one. The object coordinates presented by
[glRasterPos](glrasterpos-functions.md) are treated just like those
of a [glVertex](glvertex-functions.md) command. They are transformed
by the current modelview and projection matrices and passed to the
clipping stage. If the vertex is not culled, then it is projected and
scaled to window coordinates, which become the new current raster
position, and the GL\_CURRENT\_RASTER\_POSITION\_VALID flag is set.
If the vertex is culled, then the valid bit is cleared and the
current raster position and associated color and texture coordinates
are undefined. The current raster position also includes some
associated color data and texture coordinates. If lighting is
enabled, then GL\_CURRENT\_RASTER\_COLOR, in RGBA mode, or the
GL\_CURRENT\_RASTER\_INDEX, in color-index mode, is set to the color
produced by the lighting calculation (see
[glLight](gllight-functions.md),
[glLightModel](gllightmodel-functions.md), and
[**glShadeModel**](glshademodel.md)). If lighting is disabled,
current color (in RGBA mode, state variable GL\_CURRENT\_COLOR) or
color index (in color-index mode, state variable GL\_CURRENT\_INDEX)
is used to update the current raster color. Likewise,
GL\_CURRENT\_RASTER\_TEXTURE\_COORDS is updated as a function of
GL\_CURRENT\_TEXTURE\_COORDS, based on the texture matrix and the
texture generation functions (see [glTexGen](gltexgen-functions.md)).
Finally, the distance from the origin of the eye coordinate system to
the vertex, as transformed by only the modelview matrix, replaces
GL\_CURRENT\_RASTER\_DISTANCE. Initially, the current raster position
is (0,0,0,1), the current raster distance is 0, the valid bit is set,
the associated RGBA color is (1,1,1,1), the associated color index is
1, and the associated texture coordinates are (0, 0, 0, 1). In RGBA
mode, GL\_CURRENT\_RASTER\_INDEX is always 1; in color-index mode,
the current raster RGBA color always maintains its initial value. >
[!Note] > The raster position is modified both by
[glRasterPos](glrasterpos-functions.md) and by
[**glBitmap**](glbitmap.md).
> [!Note] > When the raster position coordinates are invalid, drawing
commands that are based on the raster position are ignored (that is,
they do not result in changes to the OpenGL state).
The following functions retrieve information related to
[glRasterPos](glrasterpos-functions.md):
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_RASTER\_POSITION
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_RASTER\_POSITION\_VALID
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_RASTER\_DISTANCE
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_RASTER\_COLOR
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_RASTER\_INDEX
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_RASTER\_TEXTURE\_COORDS


%index
glRasterPos3sv
Specifies the raster position for pixel operations. | glRasterPos3sv function (Gl.h)
%group
Win32 opengl32
%prm
v
v : [var] A pointer to an array of three elements, specifying x, y, and z coordinates for the current raster position.
%inst
Specifies the raster position for pixel operations. | glRasterPos3sv
function (Gl.h)

[戻り値]
This function does not return a value.

[備考]
OpenGL maintains a 3-D position in window coordinates. This position,
called the raster position, is maintained with subpixel accuracy. It
is used to position pixel and bitmap write operations. See
[**glBitmap**](glbitmap.md), [**glDrawPixels**](gldrawpixels.md), and
[**glCopyPixels**](glcopypixels.md). The current raster position
consists of three window coordinates (*x, y, z*), a clip coordinate
*w* value, an eye coordinate distance, a valid bit, and associated
color data and texture coordinates. The *w* coordinate is a clip
coordinate, because *w* is not projected to window coordinates. The
[glRasterPos4](glrasterpos-functions.md) function specifies object
coordinates *x, y, z*, and *w* explicitly. The glRasterPos3 function
specifies object coordinates *x, y,* and *z* explicitly, while *w* is
implicitly set to one. The glRasterPos2 function uses the argument
values for *x* and *y* while implicitly setting *z* and *w* to zero
and one. The object coordinates presented by
[glRasterPos](glrasterpos-functions.md) are treated just like those
of a [glVertex](glvertex-functions.md) command. They are transformed
by the current modelview and projection matrices and passed to the
clipping stage. If the vertex is not culled, then it is projected and
scaled to window coordinates, which become the new current raster
position, and the GL\_CURRENT\_RASTER\_POSITION\_VALID flag is set.
If the vertex is culled, then the valid bit is cleared and the
current raster position and associated color and texture coordinates
are undefined. The current raster position also includes some
associated color data and texture coordinates. If lighting is
enabled, then GL\_CURRENT\_RASTER\_COLOR, in RGBA mode, or the
GL\_CURRENT\_RASTER\_INDEX, in color-index mode, is set to the color
produced by the lighting calculation (see
[glLight](gllight-functions.md),
[glLightModel](gllightmodel-functions.md), and
[**glShadeModel**](glshademodel.md)). If lighting is disabled,
current color (in RGBA mode, state variable GL\_CURRENT\_COLOR) or
color index (in color-index mode, state variable GL\_CURRENT\_INDEX)
is used to update the current raster color. Likewise,
GL\_CURRENT\_RASTER\_TEXTURE\_COORDS is updated as a function of
GL\_CURRENT\_TEXTURE\_COORDS, based on the texture matrix and the
texture generation functions (see [glTexGen](gltexgen-functions.md)).
Finally, the distance from the origin of the eye coordinate system to
the vertex, as transformed by only the modelview matrix, replaces
GL\_CURRENT\_RASTER\_DISTANCE. Initially, the current raster position
is (0,0,0,1), the current raster distance is 0, the valid bit is set,
the associated RGBA color is (1,1,1,1), the associated color index is
1, and the associated texture coordinates are (0, 0, 0, 1). In RGBA
mode, GL\_CURRENT\_RASTER\_INDEX is always 1; in color-index mode,
the current raster RGBA color always maintains its initial value. >
[!Note] > The raster position is modified both by
[glRasterPos](glrasterpos-functions.md) and by
[**glBitmap**](glbitmap.md).
> [!Note] > When the raster position coordinates are invalid, drawing
commands that are based on the raster position are ignored (that is,
they do not result in changes to the OpenGL state).
The following functions retrieve information related to
[glRasterPos](glrasterpos-functions.md):
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_RASTER\_POSITION
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_RASTER\_POSITION\_VALID
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_RASTER\_DISTANCE
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_RASTER\_COLOR
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_RASTER\_INDEX
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_RASTER\_TEXTURE\_COORDS


%index
glRasterPos4d
Specifies the raster position for pixel operations. | glRasterPos4d function (Gl.h)
%group
Win32 opengl32
%prm
x, y, z, w
x : [double] Specifies the x-coordinate for the current raster position.
y : [double] Specifies the y-coordinate for the current raster position.
z : [double] Specifies the z-coordinate for the current raster position.
w : [double] The w-coordinate for the current raster position.
%inst
Specifies the raster position for pixel operations. | glRasterPos4d
function (Gl.h)

[戻り値]
This function does not return a value.

[備考]
OpenGL maintains a 3-D position in window coordinates. This position,
called the raster position, is maintained with subpixel accuracy. It
is used to position pixel and bitmap write operations. See
[**glBitmap**](glbitmap.md), [**glDrawPixels**](gldrawpixels.md), and
[**glCopyPixels**](glcopypixels.md). The current raster position
consists of three window coordinates (*x, y, z*), a clip coordinate
*w* value, an eye coordinate distance, a valid bit, and associated
color data and texture coordinates. The *w* coordinate is a clip
coordinate, because *w* is not projected to window coordinates. The
[glRasterPos4](glrasterpos-functions.md) function specifies object
coordinates *x, y, z*, and *w* explicitly. The glRasterPos3 function
specifies object coordinates *x, y,* and *z* explicitly, while *w* is
implicitly set to one. The glRasterPos2 function uses the argument
values for *x* and *y* while implicitly setting *z* and *w* to zero
and one. The object coordinates presented by
[glRasterPos](glrasterpos-functions.md) are treated just like those
of a [glVertex](glvertex-functions.md) command. They are transformed
by the current modelview and projection matrices and passed to the
clipping stage. If the vertex is not culled, then it is projected and
scaled to window coordinates, which become the new current raster
position, and the GL\_CURRENT\_RASTER\_POSITION\_VALID flag is set.
If the vertex is culled, then the valid bit is cleared and the
current raster position and associated color and texture coordinates
are undefined. The current raster position also includes some
associated color data and texture coordinates. If lighting is
enabled, then GL\_CURRENT\_RASTER\_COLOR, in RGBA mode, or the
GL\_CURRENT\_RASTER\_INDEX, in color-index mode, is set to the color
produced by the lighting calculation (see
[glLight](gllight-functions.md),
[glLightModel](gllightmodel-functions.md), and
[**glShadeModel**](glshademodel.md)). If lighting is disabled,
current color (in RGBA mode, state variable GL\_CURRENT\_COLOR) or
color index (in color-index mode, state variable GL\_CURRENT\_INDEX)
is used to update the current raster color. Likewise,
GL\_CURRENT\_RASTER\_TEXTURE\_COORDS is updated as a function of
GL\_CURRENT\_TEXTURE\_COORDS, based on the texture matrix and the
texture generation functions (see [glTexGen](gltexgen-functions.md)).
Finally, the distance from the origin of the eye coordinate system to
the vertex, as transformed by only the modelview matrix, replaces
GL\_CURRENT\_RASTER\_DISTANCE. Initially, the current raster position
is (0,0,0,1), the current raster distance is 0, the valid bit is set,
the associated RGBA color is (1,1,1,1), the associated color index is
1, and the associated texture coordinates are (0, 0, 0, 1). In RGBA
mode, GL\_CURRENT\_RASTER\_INDEX is always 1; in color-index mode,
the current raster RGBA color always maintains its initial value. >
[!Note] > The raster position is modified both by
[glRasterPos](glrasterpos-functions.md) and by
[**glBitmap**](glbitmap.md).
> [!Note] > When the raster position coordinates are invalid, drawing
commands that are based on the raster position are ignored (that is,
they do not result in changes to the OpenGL state).
The following functions retrieve information related to
[glRasterPos](glrasterpos-functions.md):
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_RASTER\_POSITION
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_RASTER\_POSITION\_VALID
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_RASTER\_DISTANCE
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_RASTER\_COLOR
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_RASTER\_INDEX
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_RASTER\_TEXTURE\_COORDS


%index
glRasterPos4dv
Specifies the raster position for pixel operations. | glRasterPos4dv function (Gl.h)
%group
Win32 opengl32
%prm
v
v : [var] A pointer to an array of four elements, specifying x, y, z, and w coordinates for the current raster position.
%inst
Specifies the raster position for pixel operations. | glRasterPos4dv
function (Gl.h)

[戻り値]
This function does not return a value.

[備考]
OpenGL maintains a 3-D position in window coordinates. This position,
called the raster position, is maintained with subpixel accuracy. It
is used to position pixel and bitmap write operations. See
[**glBitmap**](glbitmap.md), [**glDrawPixels**](gldrawpixels.md), and
[**glCopyPixels**](glcopypixels.md). The current raster position
consists of three window coordinates (*x, y, z*), a clip coordinate
*w* value, an eye coordinate distance, a valid bit, and associated
color data and texture coordinates. The *w* coordinate is a clip
coordinate, because *w* is not projected to window coordinates. The
[glRasterPos4](glrasterpos-functions.md) function specifies object
coordinates *x, y, z*, and *w* explicitly. The glRasterPos3 function
specifies object coordinates *x, y,* and *z* explicitly, while *w* is
implicitly set to one. The glRasterPos2 function uses the argument
values for *x* and *y* while implicitly setting *z* and *w* to zero
and one. The object coordinates presented by
[glRasterPos](glrasterpos-functions.md) are treated just like those
of a [glVertex](glvertex-functions.md) command. They are transformed
by the current modelview and projection matrices and passed to the
clipping stage. If the vertex is not culled, then it is projected and
scaled to window coordinates, which become the new current raster
position, and the GL\_CURRENT\_RASTER\_POSITION\_VALID flag is set.
If the vertex is culled, then the valid bit is cleared and the
current raster position and associated color and texture coordinates
are undefined. The current raster position also includes some
associated color data and texture coordinates. If lighting is
enabled, then GL\_CURRENT\_RASTER\_COLOR, in RGBA mode, or the
GL\_CURRENT\_RASTER\_INDEX, in color-index mode, is set to the color
produced by the lighting calculation (see
[glLight](gllight-functions.md),
[glLightModel](gllightmodel-functions.md), and
[**glShadeModel**](glshademodel.md)). If lighting is disabled,
current color (in RGBA mode, state variable GL\_CURRENT\_COLOR) or
color index (in color-index mode, state variable GL\_CURRENT\_INDEX)
is used to update the current raster color. Likewise,
GL\_CURRENT\_RASTER\_TEXTURE\_COORDS is updated as a function of
GL\_CURRENT\_TEXTURE\_COORDS, based on the texture matrix and the
texture generation functions (see [glTexGen](gltexgen-functions.md)).
Finally, the distance from the origin of the eye coordinate system to
the vertex, as transformed by only the modelview matrix, replaces
GL\_CURRENT\_RASTER\_DISTANCE. Initially, the current raster position
is (0,0,0,1), the current raster distance is 0, the valid bit is set,
the associated RGBA color is (1,1,1,1), the associated color index is
1, and the associated texture coordinates are (0, 0, 0, 1). In RGBA
mode, GL\_CURRENT\_RASTER\_INDEX is always 1; in color-index mode,
the current raster RGBA color always maintains its initial value. >
[!Note] > The raster position is modified both by
[glRasterPos](glrasterpos-functions.md) and by
[**glBitmap**](glbitmap.md).
> [!Note] > When the raster position coordinates are invalid, drawing
commands that are based on the raster position are ignored (that is,
they do not result in changes to the OpenGL state).
The following functions retrieve information related to
[glRasterPos](glrasterpos-functions.md):
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_RASTER\_POSITION
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_RASTER\_POSITION\_VALID
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_RASTER\_DISTANCE
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_RASTER\_COLOR
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_RASTER\_INDEX
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_RASTER\_TEXTURE\_COORDS


%index
glRasterPos4f
Specifies the raster position for pixel operations. | glRasterPos4f function (Gl.h)
%group
Win32 opengl32
%prm
x, y, z, w
x : [float] Specifies the x-coordinate for the current raster position.
y : [float] Specifies the y-coordinate for the current raster position.
z : [float] Specifies the z-coordinate for the current raster position.
w : [float] The w-coordinate for the current raster position.
%inst
Specifies the raster position for pixel operations. | glRasterPos4f
function (Gl.h)

[戻り値]
This function does not return a value.

[備考]
OpenGL maintains a 3-D position in window coordinates. This position,
called the raster position, is maintained with subpixel accuracy. It
is used to position pixel and bitmap write operations. See
[**glBitmap**](glbitmap.md), [**glDrawPixels**](gldrawpixels.md), and
[**glCopyPixels**](glcopypixels.md). The current raster position
consists of three window coordinates (*x, y, z*), a clip coordinate
*w* value, an eye coordinate distance, a valid bit, and associated
color data and texture coordinates. The *w* coordinate is a clip
coordinate, because *w* is not projected to window coordinates. The
[glRasterPos4](glrasterpos-functions.md) function specifies object
coordinates *x, y, z*, and *w* explicitly. The glRasterPos3 function
specifies object coordinates *x, y,* and *z* explicitly, while *w* is
implicitly set to one. The glRasterPos2 function uses the argument
values for *x* and *y* while implicitly setting *z* and *w* to zero
and one. The object coordinates presented by
[glRasterPos](glrasterpos-functions.md) are treated just like those
of a [glVertex](glvertex-functions.md) command. They are transformed
by the current modelview and projection matrices and passed to the
clipping stage. If the vertex is not culled, then it is projected and
scaled to window coordinates, which become the new current raster
position, and the GL\_CURRENT\_RASTER\_POSITION\_VALID flag is set.
If the vertex is culled, then the valid bit is cleared and the
current raster position and associated color and texture coordinates
are undefined. The current raster position also includes some
associated color data and texture coordinates. If lighting is
enabled, then GL\_CURRENT\_RASTER\_COLOR, in RGBA mode, or the
GL\_CURRENT\_RASTER\_INDEX, in color-index mode, is set to the color
produced by the lighting calculation (see
[glLight](gllight-functions.md),
[glLightModel](gllightmodel-functions.md), and
[**glShadeModel**](glshademodel.md)). If lighting is disabled,
current color (in RGBA mode, state variable GL\_CURRENT\_COLOR) or
color index (in color-index mode, state variable GL\_CURRENT\_INDEX)
is used to update the current raster color. Likewise,
GL\_CURRENT\_RASTER\_TEXTURE\_COORDS is updated as a function of
GL\_CURRENT\_TEXTURE\_COORDS, based on the texture matrix and the
texture generation functions (see [glTexGen](gltexgen-functions.md)).
Finally, the distance from the origin of the eye coordinate system to
the vertex, as transformed by only the modelview matrix, replaces
GL\_CURRENT\_RASTER\_DISTANCE. Initially, the current raster position
is (0,0,0,1), the current raster distance is 0, the valid bit is set,
the associated RGBA color is (1,1,1,1), the associated color index is
1, and the associated texture coordinates are (0, 0, 0, 1). In RGBA
mode, GL\_CURRENT\_RASTER\_INDEX is always 1; in color-index mode,
the current raster RGBA color always maintains its initial value. >
[!Note] > The raster position is modified both by
[glRasterPos](glrasterpos-functions.md) and by
[**glBitmap**](glbitmap.md).
> [!Note] > When the raster position coordinates are invalid, drawing
commands that are based on the raster position are ignored (that is,
they do not result in changes to the OpenGL state).
The following functions retrieve information related to
[glRasterPos](glrasterpos-functions.md):
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_RASTER\_POSITION
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_RASTER\_POSITION\_VALID
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_RASTER\_DISTANCE
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_RASTER\_COLOR
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_RASTER\_INDEX
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_RASTER\_TEXTURE\_COORDS


%index
glRasterPos4fv
Specifies the raster position for pixel operations. | glRasterPos4fv function (Gl.h)
%group
Win32 opengl32
%prm
v
v : [var] A pointer to an array of four elements, specifying x, y, z, and w coordinates for the current raster position.
%inst
Specifies the raster position for pixel operations. | glRasterPos4fv
function (Gl.h)

[戻り値]
This function does not return a value.

[備考]
OpenGL maintains a 3-D position in window coordinates. This position,
called the raster position, is maintained with subpixel accuracy. It
is used to position pixel and bitmap write operations. See
[**glBitmap**](glbitmap.md), [**glDrawPixels**](gldrawpixels.md), and
[**glCopyPixels**](glcopypixels.md). The current raster position
consists of three window coordinates (*x, y, z*), a clip coordinate
*w* value, an eye coordinate distance, a valid bit, and associated
color data and texture coordinates. The *w* coordinate is a clip
coordinate, because *w* is not projected to window coordinates. The
[glRasterPos4](glrasterpos-functions.md) function specifies object
coordinates *x, y, z*, and *w* explicitly. The glRasterPos3 function
specifies object coordinates *x, y,* and *z* explicitly, while *w* is
implicitly set to one. The glRasterPos2 function uses the argument
values for *x* and *y* while implicitly setting *z* and *w* to zero
and one. The object coordinates presented by
[glRasterPos](glrasterpos-functions.md) are treated just like those
of a [glVertex](glvertex-functions.md) command. They are transformed
by the current modelview and projection matrices and passed to the
clipping stage. If the vertex is not culled, then it is projected and
scaled to window coordinates, which become the new current raster
position, and the GL\_CURRENT\_RASTER\_POSITION\_VALID flag is set.
If the vertex is culled, then the valid bit is cleared and the
current raster position and associated color and texture coordinates
are undefined. The current raster position also includes some
associated color data and texture coordinates. If lighting is
enabled, then GL\_CURRENT\_RASTER\_COLOR, in RGBA mode, or the
GL\_CURRENT\_RASTER\_INDEX, in color-index mode, is set to the color
produced by the lighting calculation (see
[glLight](gllight-functions.md),
[glLightModel](gllightmodel-functions.md), and
[**glShadeModel**](glshademodel.md)). If lighting is disabled,
current color (in RGBA mode, state variable GL\_CURRENT\_COLOR) or
color index (in color-index mode, state variable GL\_CURRENT\_INDEX)
is used to update the current raster color. Likewise,
GL\_CURRENT\_RASTER\_TEXTURE\_COORDS is updated as a function of
GL\_CURRENT\_TEXTURE\_COORDS, based on the texture matrix and the
texture generation functions (see [glTexGen](gltexgen-functions.md)).
Finally, the distance from the origin of the eye coordinate system to
the vertex, as transformed by only the modelview matrix, replaces
GL\_CURRENT\_RASTER\_DISTANCE. Initially, the current raster position
is (0,0,0,1), the current raster distance is 0, the valid bit is set,
the associated RGBA color is (1,1,1,1), the associated color index is
1, and the associated texture coordinates are (0, 0, 0, 1). In RGBA
mode, GL\_CURRENT\_RASTER\_INDEX is always 1; in color-index mode,
the current raster RGBA color always maintains its initial value. >
[!Note] > The raster position is modified both by
[glRasterPos](glrasterpos-functions.md) and by
[**glBitmap**](glbitmap.md).
> [!Note] > When the raster position coordinates are invalid, drawing
commands that are based on the raster position are ignored (that is,
they do not result in changes to the OpenGL state).
The following functions retrieve information related to
[glRasterPos](glrasterpos-functions.md):
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_RASTER\_POSITION
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_RASTER\_POSITION\_VALID
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_RASTER\_DISTANCE
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_RASTER\_COLOR
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_RASTER\_INDEX
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_RASTER\_TEXTURE\_COORDS


%index
glRasterPos4i
Specifies the raster position for pixel operations. | glRasterPos4i function (Gl.h)
%group
Win32 opengl32
%prm
x, y, z, w
x : [int] Specifies the x-coordinate for the current raster position.
y : [int] Specifies the y-coordinate for the current raster position.
z : [int] Specifies the z-coordinate for the current raster position.
w : [int] The w-coordinate for the current raster position.
%inst
Specifies the raster position for pixel operations. | glRasterPos4i
function (Gl.h)

[戻り値]
This function does not return a value.

[備考]
OpenGL maintains a 3-D position in window coordinates. This position,
called the raster position, is maintained with subpixel accuracy. It
is used to position pixel and bitmap write operations. See
[**glBitmap**](glbitmap.md), [**glDrawPixels**](gldrawpixels.md), and
[**glCopyPixels**](glcopypixels.md). The current raster position
consists of three window coordinates (*x, y, z*), a clip coordinate
*w* value, an eye coordinate distance, a valid bit, and associated
color data and texture coordinates. The *w* coordinate is a clip
coordinate, because *w* is not projected to window coordinates. The
[glRasterPos4](glrasterpos-functions.md) function specifies object
coordinates *x, y, z*, and *w* explicitly. The glRasterPos3 function
specifies object coordinates *x, y,* and *z* explicitly, while *w* is
implicitly set to one. The glRasterPos2 function uses the argument
values for *x* and *y* while implicitly setting *z* and *w* to zero
and one. The object coordinates presented by
[glRasterPos](glrasterpos-functions.md) are treated just like those
of a [glVertex](glvertex-functions.md) command. They are transformed
by the current modelview and projection matrices and passed to the
clipping stage. If the vertex is not culled, then it is projected and
scaled to window coordinates, which become the new current raster
position, and the GL\_CURRENT\_RASTER\_POSITION\_VALID flag is set.
If the vertex is culled, then the valid bit is cleared and the
current raster position and associated color and texture coordinates
are undefined. The current raster position also includes some
associated color data and texture coordinates. If lighting is
enabled, then GL\_CURRENT\_RASTER\_COLOR, in RGBA mode, or the
GL\_CURRENT\_RASTER\_INDEX, in color-index mode, is set to the color
produced by the lighting calculation (see
[glLight](gllight-functions.md),
[glLightModel](gllightmodel-functions.md), and
[**glShadeModel**](glshademodel.md)). If lighting is disabled,
current color (in RGBA mode, state variable GL\_CURRENT\_COLOR) or
color index (in color-index mode, state variable GL\_CURRENT\_INDEX)
is used to update the current raster color. Likewise,
GL\_CURRENT\_RASTER\_TEXTURE\_COORDS is updated as a function of
GL\_CURRENT\_TEXTURE\_COORDS, based on the texture matrix and the
texture generation functions (see [glTexGen](gltexgen-functions.md)).
Finally, the distance from the origin of the eye coordinate system to
the vertex, as transformed by only the modelview matrix, replaces
GL\_CURRENT\_RASTER\_DISTANCE. Initially, the current raster position
is (0,0,0,1), the current raster distance is 0, the valid bit is set,
the associated RGBA color is (1,1,1,1), the associated color index is
1, and the associated texture coordinates are (0, 0, 0, 1). In RGBA
mode, GL\_CURRENT\_RASTER\_INDEX is always 1; in color-index mode,
the current raster RGBA color always maintains its initial value. >
[!Note] > The raster position is modified both by
[glRasterPos](glrasterpos-functions.md) and by
[**glBitmap**](glbitmap.md).
> [!Note] > When the raster position coordinates are invalid, drawing
commands that are based on the raster position are ignored (that is,
they do not result in changes to the OpenGL state).
The following functions retrieve information related to
[glRasterPos](glrasterpos-functions.md):
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_RASTER\_POSITION
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_RASTER\_POSITION\_VALID
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_RASTER\_DISTANCE
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_RASTER\_COLOR
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_RASTER\_INDEX
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_RASTER\_TEXTURE\_COORDS


%index
glRasterPos4iv
Specifies the raster position for pixel operations. | glRasterPos4iv function (Gl.h)
%group
Win32 opengl32
%prm
v
v : [var] A pointer to an array of four elements, specifying x, y, z, and w coordinates for the current raster position.
%inst
Specifies the raster position for pixel operations. | glRasterPos4iv
function (Gl.h)

[戻り値]
This function does not return a value.

[備考]
OpenGL maintains a 3-D position in window coordinates. This position,
called the raster position, is maintained with subpixel accuracy. It
is used to position pixel and bitmap write operations. See
[**glBitmap**](glbitmap.md), [**glDrawPixels**](gldrawpixels.md), and
[**glCopyPixels**](glcopypixels.md). The current raster position
consists of three window coordinates (*x, y, z*), a clip coordinate
*w* value, an eye coordinate distance, a valid bit, and associated
color data and texture coordinates. The *w* coordinate is a clip
coordinate, because *w* is not projected to window coordinates. The
[glRasterPos4](glrasterpos-functions.md) function specifies object
coordinates *x, y, z*, and *w* explicitly. The glRasterPos3 function
specifies object coordinates *x, y,* and *z* explicitly, while *w* is
implicitly set to one. The glRasterPos2 function uses the argument
values for *x* and *y* while implicitly setting *z* and *w* to zero
and one. The object coordinates presented by
[glRasterPos](glrasterpos-functions.md) are treated just like those
of a [glVertex](glvertex-functions.md) command. They are transformed
by the current modelview and projection matrices and passed to the
clipping stage. If the vertex is not culled, then it is projected and
scaled to window coordinates, which become the new current raster
position, and the GL\_CURRENT\_RASTER\_POSITION\_VALID flag is set.
If the vertex is culled, then the valid bit is cleared and the
current raster position and associated color and texture coordinates
are undefined. The current raster position also includes some
associated color data and texture coordinates. If lighting is
enabled, then GL\_CURRENT\_RASTER\_COLOR, in RGBA mode, or the
GL\_CURRENT\_RASTER\_INDEX, in color-index mode, is set to the color
produced by the lighting calculation (see
[glLight](gllight-functions.md),
[glLightModel](gllightmodel-functions.md), and
[**glShadeModel**](glshademodel.md)). If lighting is disabled,
current color (in RGBA mode, state variable GL\_CURRENT\_COLOR) or
color index (in color-index mode, state variable GL\_CURRENT\_INDEX)
is used to update the current raster color. Likewise,
GL\_CURRENT\_RASTER\_TEXTURE\_COORDS is updated as a function of
GL\_CURRENT\_TEXTURE\_COORDS, based on the texture matrix and the
texture generation functions (see [glTexGen](gltexgen-functions.md)).
Finally, the distance from the origin of the eye coordinate system to
the vertex, as transformed by only the modelview matrix, replaces
GL\_CURRENT\_RASTER\_DISTANCE. Initially, the current raster position
is (0,0,0,1), the current raster distance is 0, the valid bit is set,
the associated RGBA color is (1,1,1,1), the associated color index is
1, and the associated texture coordinates are (0, 0, 0, 1). In RGBA
mode, GL\_CURRENT\_RASTER\_INDEX is always 1; in color-index mode,
the current raster RGBA color always maintains its initial value. >
[!Note] > The raster position is modified both by
[glRasterPos](glrasterpos-functions.md) and by
[**glBitmap**](glbitmap.md).
> [!Note] > When the raster position coordinates are invalid, drawing
commands that are based on the raster position are ignored (that is,
they do not result in changes to the OpenGL state).
The following functions retrieve information related to
[glRasterPos](glrasterpos-functions.md):
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_RASTER\_POSITION
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_RASTER\_POSITION\_VALID
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_RASTER\_DISTANCE
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_RASTER\_COLOR
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_RASTER\_INDEX
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_RASTER\_TEXTURE\_COORDS


%index
glRasterPos4s
Specifies the raster position for pixel operations. | glRasterPos4s function (Gl.h)
%group
Win32 opengl32
%prm
x, y, z, w
x : [int] Specifies the x-coordinate for the current raster position.
y : [int] Specifies the y-coordinate for the current raster position.
z : [int] Specifies the z-coordinate for the current raster position.
w : [int] The w-coordinate for the current raster position.
%inst
Specifies the raster position for pixel operations. | glRasterPos4s
function (Gl.h)

[戻り値]
This function does not return a value.

[備考]
OpenGL maintains a 3-D position in window coordinates. This position,
called the raster position, is maintained with subpixel accuracy. It
is used to position pixel and bitmap write operations. See
[**glBitmap**](glbitmap.md), [**glDrawPixels**](gldrawpixels.md), and
[**glCopyPixels**](glcopypixels.md). The current raster position
consists of three window coordinates (*x, y, z*), a clip coordinate
*w* value, an eye coordinate distance, a valid bit, and associated
color data and texture coordinates. The *w* coordinate is a clip
coordinate, because *w* is not projected to window coordinates. The
[glRasterPos4](glrasterpos-functions.md) function specifies object
coordinates *x, y, z*, and *w* explicitly. The glRasterPos3 function
specifies object coordinates *x, y,* and *z* explicitly, while *w* is
implicitly set to one. The glRasterPos2 function uses the argument
values for *x* and *y* while implicitly setting *z* and *w* to zero
and one. The object coordinates presented by
[glRasterPos](glrasterpos-functions.md) are treated just like those
of a [glVertex](glvertex-functions.md) command. They are transformed
by the current modelview and projection matrices and passed to the
clipping stage. If the vertex is not culled, then it is projected and
scaled to window coordinates, which become the new current raster
position, and the GL\_CURRENT\_RASTER\_POSITION\_VALID flag is set.
If the vertex is culled, then the valid bit is cleared and the
current raster position and associated color and texture coordinates
are undefined. The current raster position also includes some
associated color data and texture coordinates. If lighting is
enabled, then GL\_CURRENT\_RASTER\_COLOR, in RGBA mode, or the
GL\_CURRENT\_RASTER\_INDEX, in color-index mode, is set to the color
produced by the lighting calculation (see
[glLight](gllight-functions.md),
[glLightModel](gllightmodel-functions.md), and
[**glShadeModel**](glshademodel.md)). If lighting is disabled,
current color (in RGBA mode, state variable GL\_CURRENT\_COLOR) or
color index (in color-index mode, state variable GL\_CURRENT\_INDEX)
is used to update the current raster color. Likewise,
GL\_CURRENT\_RASTER\_TEXTURE\_COORDS is updated as a function of
GL\_CURRENT\_TEXTURE\_COORDS, based on the texture matrix and the
texture generation functions (see [glTexGen](gltexgen-functions.md)).
Finally, the distance from the origin of the eye coordinate system to
the vertex, as transformed by only the modelview matrix, replaces
GL\_CURRENT\_RASTER\_DISTANCE. Initially, the current raster position
is (0,0,0,1), the current raster distance is 0, the valid bit is set,
the associated RGBA color is (1,1,1,1), the associated color index is
1, and the associated texture coordinates are (0, 0, 0, 1). In RGBA
mode, GL\_CURRENT\_RASTER\_INDEX is always 1; in color-index mode,
the current raster RGBA color always maintains its initial value. >
[!Note] > The raster position is modified both by
[glRasterPos](glrasterpos-functions.md) and by
[**glBitmap**](glbitmap.md).
> [!Note] > When the raster position coordinates are invalid, drawing
commands that are based on the raster position are ignored (that is,
they do not result in changes to the OpenGL state).
The following functions retrieve information related to
[glRasterPos](glrasterpos-functions.md):
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_RASTER\_POSITION
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_RASTER\_POSITION\_VALID
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_RASTER\_DISTANCE
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_RASTER\_COLOR
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_RASTER\_INDEX
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_RASTER\_TEXTURE\_COORDS


%index
glRasterPos4sv
Specifies the raster position for pixel operations. | glRasterPos4sv function (Gl.h)
%group
Win32 opengl32
%prm
v
v : [var] A pointer to an array of four elements, specifying x, y, z, and w coordinates for the current raster position.
%inst
Specifies the raster position for pixel operations. | glRasterPos4sv
function (Gl.h)

[戻り値]
This function does not return a value.

[備考]
OpenGL maintains a 3-D position in window coordinates. This position,
called the raster position, is maintained with subpixel accuracy. It
is used to position pixel and bitmap write operations. See
[**glBitmap**](glbitmap.md), [**glDrawPixels**](gldrawpixels.md), and
[**glCopyPixels**](glcopypixels.md). The current raster position
consists of three window coordinates (*x, y, z*), a clip coordinate
*w* value, an eye coordinate distance, a valid bit, and associated
color data and texture coordinates. The *w* coordinate is a clip
coordinate, because *w* is not projected to window coordinates. The
[glRasterPos4](glrasterpos-functions.md) function specifies object
coordinates *x, y, z*, and *w* explicitly. The glRasterPos3 function
specifies object coordinates *x, y,* and *z* explicitly, while *w* is
implicitly set to one. The glRasterPos2 function uses the argument
values for *x* and *y* while implicitly setting *z* and *w* to zero
and one. The object coordinates presented by
[glRasterPos](glrasterpos-functions.md) are treated just like those
of a [glVertex](glvertex-functions.md) command. They are transformed
by the current modelview and projection matrices and passed to the
clipping stage. If the vertex is not culled, then it is projected and
scaled to window coordinates, which become the new current raster
position, and the GL\_CURRENT\_RASTER\_POSITION\_VALID flag is set.
If the vertex is culled, then the valid bit is cleared and the
current raster position and associated color and texture coordinates
are undefined. The current raster position also includes some
associated color data and texture coordinates. If lighting is
enabled, then GL\_CURRENT\_RASTER\_COLOR, in RGBA mode, or the
GL\_CURRENT\_RASTER\_INDEX, in color-index mode, is set to the color
produced by the lighting calculation (see
[glLight](gllight-functions.md),
[glLightModel](gllightmodel-functions.md), and
[**glShadeModel**](glshademodel.md)). If lighting is disabled,
current color (in RGBA mode, state variable GL\_CURRENT\_COLOR) or
color index (in color-index mode, state variable GL\_CURRENT\_INDEX)
is used to update the current raster color. Likewise,
GL\_CURRENT\_RASTER\_TEXTURE\_COORDS is updated as a function of
GL\_CURRENT\_TEXTURE\_COORDS, based on the texture matrix and the
texture generation functions (see [glTexGen](gltexgen-functions.md)).
Finally, the distance from the origin of the eye coordinate system to
the vertex, as transformed by only the modelview matrix, replaces
GL\_CURRENT\_RASTER\_DISTANCE. Initially, the current raster position
is (0,0,0,1), the current raster distance is 0, the valid bit is set,
the associated RGBA color is (1,1,1,1), the associated color index is
1, and the associated texture coordinates are (0, 0, 0, 1). In RGBA
mode, GL\_CURRENT\_RASTER\_INDEX is always 1; in color-index mode,
the current raster RGBA color always maintains its initial value. >
[!Note] > The raster position is modified both by
[glRasterPos](glrasterpos-functions.md) and by
[**glBitmap**](glbitmap.md).
> [!Note] > When the raster position coordinates are invalid, drawing
commands that are based on the raster position are ignored (that is,
they do not result in changes to the OpenGL state).
The following functions retrieve information related to
[glRasterPos](glrasterpos-functions.md):
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_RASTER\_POSITION
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_RASTER\_POSITION\_VALID
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_RASTER\_DISTANCE
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_RASTER\_COLOR
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_RASTER\_INDEX
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_RASTER\_TEXTURE\_COORDS


%index
glReadBuffer
The glReadBuffer function selects a color buffer source for pixels.
%group
Win32 opengl32
%prm
mode
mode : [int] A color buffer. Accepted values are GL\_FRONT\_LEFT, GL\_FRONT\_RIGHT, GL\_BACK\_LEFT, GL\_BACK\_RIGHT, GL\_FRONT, GL\_BACK, GL\_LEFT, GL\_RIGHT, and GL\_AUX *i*, where *i* is between 0 and GL\_AUX\_BUFFERS 1.
%inst
The glReadBuffer function selects a color buffer source for pixels.

[戻り値]
This function does not return a value.

[備考]
The **glReadBuffer** function specifies a color buffer as the source
for subsequent [**glReadPixels**](glreadpixels.md) and
[**glCopyPixels**](glcopypixels.md) commands. The *mode* parameter
accepts one of twelve or more predefined values. (GL\_AUX0 through
GL\_AUX3 are always defined.) In a fully configured system,
GL\_FRONT, GL\_LEFT, and GL\_FRONT\_LEFT all name the front-left
buffer, GL\_FRONT\_RIGHT and GL\_RIGHT name the front-right buffer,
and GL\_BACK\_LEFT and GL\_BACK name the back-left buffer. Nonstereo
double-buffered configurations have only a front-left and a back-left
buffer. Single-buffered configurations have a front-left and a
front-right buffer if stereo, and only a front-left buffer if
nonstereo. It is an error to specify a nonexistent buffer to
**glReadBuffer**. By default, *mode* is GL\_FRONT in single-buffered
configurations, and GL\_BACK in double-buffered configurations. The
following function retrieves information related to **glReadBuffer**:
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_READ\_BUFFER


%index
glReadPixels
The glReadPixels function reads a block of pixels from the framebuffer.
%group
Win32 opengl32
%prm
x, y, width, height, format, type, pixels
x : [int] The window *x* coordinate of the first pixel that is read from the framebuffer. Together with the *y* coordinate, specifies the location of the lower-left corner of a rectangular block of pixels.
y : [int] The window *y* coordinates of the first pixel that is read from the framebuffer. Together with the *x* coordinate, specifies the location of the lower-left corner of a rectangular block of pixels.
width : [int] The width of the pixel rectangle.
height : [int] The height of the pixel rectangle. *Width* and *height* parameters of value "1" correspond to a single pixel.
format : [int] The format of the pixel data. The following symbolic values are accepted:
type : [int] The data type of the pixel data. Must be one of the following values.
pixels : [intptr] Returns the pixel data.
%inst
The glReadPixels function reads a block of pixels from the
framebuffer.

[戻り値]
This function does not return a value.


%index
glRectd
The glRectd function draws a rectangle.
%group
Win32 opengl32
%prm
x1, y1, x2, y2
x1 : [double] The *x* coordinate of the vertex of a rectangle.
y1 : [double] The *y* coordinate of the vertex of a rectangle.
x2 : [double] The *x* coordinate of the opposite vertex of the rectangle.
y2 : [double] The *y* coordinate of the opposite vertex of the rectangle.
%inst
The glRectd function draws a rectangle.

[戻り値]
This function does not return a value.

[備考]
The **glRectd** function supports efficient specification of
rectangles as two corner points. Each rectangle command takes four
arguments, organized either as two consecutive pairs of (*x*, *y*)
coordinates, or as two pointers to arrays, each containing an (*x*,
*y*) pair. The resulting rectangle is defined in the *z* = 0 plane.
The **glRectd**(*x1,* *y1,* *x2,* *y2*) function is exactly
equivalent to the following sequence: **glBegin**(GL\_POLYGON);
**glVertex2**( *x1,* *y1* ); **glVertex2**( *x2,* *y1* );
**glVertex2**( *x2,* *y2* ); **glVertex2**( *x1,* *y2* ); **glEnd**(
); Notice that if the second vertex is above and to the right of the
first vertex, the rectangle is constructed with a counterclockwise
winding.


%index
glRectdv
The glRectdv function draws a rectangle.
%group
Win32 opengl32
%prm
v1, v2
v1 : [var] A pointer to one vertex of a rectangle.
v2 : [var] a pointer to the opposite vertex of the rectangle.
%inst
The glRectdv function draws a rectangle.

[戻り値]
This function does not return a value.

[備考]
The **glRectd** function supports efficient specification of
rectangles as two corner points. Each rectangle command takes four
arguments, organized either as two consecutive pairs of (*x*, *y*)
coordinates, or as two pointers to arrays, each containing an (*x*,
*y*) pair. The resulting rectangle is defined in the *z* = 0 plane.
The **glRectd**(*x1,* *y1,* *x2,* *y2*) function is exactly
equivalent to the following sequence: **glBegin**(GL\_POLYGON);
**glVertex2**( *x1,* *y1* ); **glVertex2**( *x2,* *y1* );
**glVertex2**( *x2,* *y2* ); **glVertex2**( *x1,* *y2* ); **glEnd**(
); Notice that if the second vertex is above and to the right of the
first vertex, the rectangle is constructed with a counterclockwise
winding.


%index
glRectf
The glRectf function draws a rectangle.
%group
Win32 opengl32
%prm
x1, y1, x2, y2
x1 : [float] The *x* coordinate of the vertex of a rectangle.
y1 : [float] The *y* coordinate of the vertex of a rectangle.
x2 : [float] The *x* coordinate of the opposite vertex of the rectangle.
y2 : [float] The *y* coordinate of the opposite vertex of the rectangle.
%inst
The glRectf function draws a rectangle.

[戻り値]
This function does not return a value.

[備考]
The **glRectf** function supports efficient specification of
rectangles as two corner points. Each rectangle command takes four
arguments, organized either as two consecutive pairs of (*x*, *y*)
coordinates, or as two pointers to arrays, each containing an (*x*,
*y*) pair. The resulting rectangle is defined in the *z* = 0 plane.
The **glRectf**(*x1,* *y1,* *x2,* *y2*) function is exactly
equivalent to the following sequence: **glBegin**(GL\_POLYGON);
**glVertex2**( *x1,* *y1* ); **glVertex2**( *x2,* *y1* );
**glVertex2**( *x2,* *y2* ); **glVertex2**( *x1,* *y2* ); **glEnd**(
); Notice that if the second vertex is above and to the right of the
first vertex, the rectangle is constructed with a counterclockwise
winding.


%index
glRectfv
The glRectfv function draws a rectangle.
%group
Win32 opengl32
%prm
v1, v2
v1 : [var] A pointer to one vertex of a rectangle.
v2 : [var] a pointer to the opposite vertex of the rectangle.
%inst
The glRectfv function draws a rectangle.

[戻り値]
This function does not return a value.

[備考]
The **glRectf** function supports efficient specification of
rectangles as two corner points. Each rectangle command takes four
arguments, organized either as two consecutive pairs of (*x*, *y*)
coordinates, or as two pointers to arrays, each containing an (*x*,
*y*) pair. The resulting rectangle is defined in the *z* = 0 plane.
The **glRectf**(*x1,* *y1,* *x2,* *y2*) function is exactly
equivalent to the following sequence: **glBegin**(GL\_POLYGON);
**glVertex2**( *x1,* *y1* ); **glVertex2**( *x2,* *y1* );
**glVertex2**( *x2,* *y2* ); **glVertex2**( *x1,* *y2* ); **glEnd**(
); Notice that if the second vertex is above and to the right of the
first vertex, the rectangle is constructed with a counterclockwise
winding.


%index
glRecti
The glRecti function draws a rectangle.
%group
Win32 opengl32
%prm
x1, y1, x2, y2
x1 : [int] The *x* coordinate of the vertex of a rectangle.
y1 : [int] The *y* coordinate of the vertex of a rectangle.
x2 : [int] The *x* coordinate of the opposite vertex of the rectangle.
y2 : [int] The *y* coordinate of the opposite vertex of the rectangle.
%inst
The glRecti function draws a rectangle.

[戻り値]
This function does not return a value.

[備考]
The **glRecti** function supports efficient specification of
rectangles as two corner points. Each rectangle command takes four
arguments, organized either as two consecutive pairs of (*x*, *y*)
coordinates, or as two pointers to arrays, each containing an (*x*,
*y*) pair. The resulting rectangle is defined in the *z* = 0 plane.
The **glRecti**(*x1,* *y1,* *x2,* *y2*) function is exactly
equivalent to the following sequence: **glBegin**(GL\_POLYGON);
**glVertex2**( *x1,* *y1* ); **glVertex2**( *x2,* *y1* );
**glVertex2**( *x2,* *y2* ); **glVertex2**( *x1,* *y2* ); **glEnd**(
); Notice that if the second vertex is above and to the right of the
first vertex, the rectangle is constructed with a counterclockwise
winding.


%index
glRectiv
The glRectiv function draws a rectangle.
%group
Win32 opengl32
%prm
v1, v2
v1 : [var] A pointer to one vertex of a rectangle.
v2 : [var] a pointer to the opposite vertex of the rectangle.
%inst
The glRectiv function draws a rectangle.

[戻り値]
This function does not return a value.

[備考]
The **glRecti** function supports efficient specification of
rectangles as two corner points. Each rectangle command takes four
arguments, organized either as two consecutive pairs of (*x*, *y*)
coordinates, or as two pointers to arrays, each containing an (*x*,
*y*) pair. The resulting rectangle is defined in the *z* = 0 plane.
The **glRecti**(*x1,* *y1,* *x2,* *y2*) function is exactly
equivalent to the following sequence: **glBegin**(GL\_POLYGON);
**glVertex2**( *x1,* *y1* ); **glVertex2**( *x2,* *y1* );
**glVertex2**( *x2,* *y2* ); **glVertex2**( *x1,* *y2* ); **glEnd**(
); Notice that if the second vertex is above and to the right of the
first vertex, the rectangle is constructed with a counterclockwise
winding.


%index
glRects
The glRects function draws a rectangle.
%group
Win32 opengl32
%prm
x1, y1, x2, y2
x1 : [int] The *x* coordinate of the vertex of a rectangle.
y1 : [int] The *y* coordinate of the vertex of a rectangle.
x2 : [int] The *x* coordinate of the opposite vertex of the rectangle.
y2 : [int] The *y* coordinate of the opposite vertex of the rectangle.
%inst
The glRects function draws a rectangle.

[戻り値]
This function does not return a value.

[備考]
The **glRects** function supports efficient specification of
rectangles as two corner points. Each rectangle command takes four
arguments, organized either as two consecutive pairs of (x, *y*)
coordinates, or as two pointers to arrays, each containing an (*x*,
*y*) pair. The resulting rectangle is defined in the *z* = 0 plane.
The **glRects**(*x1,* *y1,* *x2,* *y2*) function is exactly
equivalent to the following sequence: **glBegin**(GL\_POLYGON);
**glVertex2**( *x1,* *y1* ); **glVertex2**( *x2,* *y1* );
**glVertex2**( *x2,* *y2* ); **glVertex2**( *x1,* *y2* ); **glEnd**(
); Notice that if the second vertex is above and to the right of the
first vertex, the rectangle is constructed with a counterclockwise
winding.


%index
glRectsv
The glRectsv function draws a rectangle.
%group
Win32 opengl32
%prm
v1, v2
v1 : [var] A pointer to one vertex of a rectangle.
v2 : [var] a pointer to the opposite vertex of the rectangle.
%inst
The glRectsv function draws a rectangle.

[戻り値]
This function does not return a value.

[備考]
The **glRects** function supports efficient specification of
rectangles as two corner points. Each rectangle command takes four
arguments, organized either as two consecutive pairs of (*x*, *y*)
coordinates, or as two pointers to arrays, each containing an (*x,*
*y*) pair. The resulting rectangle is defined in the *z* = 0 plane.
The **glRects**(*x1,* *y1,* *x2,* *y2*) function is exactly
equivalent to the following sequence: **glBegin**(GL\_POLYGON);
**glVertex2**( *x1,* *y1* ); **glVertex2**( *x2,* *y1* );
**glVertex2**( *x2,* *y2* ); **glVertex2**( *x1,* *y2* ); **glEnd**(
); Notice that if the second vertex is above and to the right of the
first vertex, the rectangle is constructed with a counterclockwise
winding.


%index
glRenderMode
The glRenderMode function sets the rasterization mode.
%group
Win32 opengl32
%prm
mode
mode : [int] The rasterization mode. The following three values are accepted. The default value is GL\_RENDER.
%inst
The glRenderMode function sets the rasterization mode.

[備考]
The **glRenderMode** function takes one argument, *mode*, which can
assume one of three predefined values above. The return value of the
**glRenderMode** function is determined by the render mode at the
time **glRenderMode** is called, rather than by *mode*. The values
returned for the three render modes are as follows.
| Value | Meaning |
|--------------|-------------------------------------------------------------------------|
| GL\_RENDER | Zero. | | GL\_SELECT | The number of hit records
transferred to the select buffer. | | GL\_FEEDBACK | The number of
values (not vertices) transferred to the feedback buffer. |
Refer to [**glSelectBuffer**](glselectbuffer.md) and
[**glFeedbackBuffer**](glfeedbackbuffer.md) for more details
concerning selection and feedback operation. If an error is
generated, **glRenderMode** returns zero regardless of the current
render mode. The following function retrieves information related to
**glRenderMode**:
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_RENDER\_MODE


%index
glRotated
The glRotated function multiplies the current matrix by a rotation matrix.
%group
Win32 opengl32
%prm
angle, x, y, z
angle : [double] The angle of rotation, in degrees.
x : [double] The *x* coordinate of a vector.
y : [double] The *y* coordinate of a vector.
z : [double] The *z* coordinate of a vector.
%inst
The glRotated function multiplies the current matrix by a rotation
matrix.

[戻り値]
This function does not return a value.

[備考]
The **glRotated** function computes a matrix that performs a
counterclockwise rotation of *angle* degrees about the vector from
the origin through the point (*x*, *y*, *z*). The current matrix (see
[**glMatrixMode**](glmatrixmode.md)) is multiplied by this rotation
matrix, with the product replacing the current matrix. That is, if M
is the current matrix and R is the translation matrix, then M is
replaced with M R. If the matrix mode is either GL\_MODELVIEW or
GL\_PROJECTION, all objects drawn after **glRotated** is called are
rotated. Use [**glPushMatrix**](glpushmatrix.md) and
[**glPopMatrix**](glpopmatrix.md) to save and restore the unrotated
coordinate system. The following functions retrieve information
related to **glRotated**:
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_RENDER\_MODE
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_MATRIX\_MODE
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_MODELVIEW\_MATRIX
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_PROJECTION\_MATRIX
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_TEXTURE\_MATRIX


%index
glRotatef
The glRotatef function multiplies the current matrix by a rotation matrix.
%group
Win32 opengl32
%prm
angle, x, y, z
angle : [float] The angle of rotation, in degrees.
x : [float] The *x* coordinate of a vector.
y : [float] The *y* coordinate of a vector.
z : [float] The *z* coordinate of a vector.
%inst
The glRotatef function multiplies the current matrix by a rotation
matrix.

[戻り値]
This function does not return a value.

[備考]
The **glRotatef** function computes a matrix that performs a
counterclockwise rotation of *angle* degrees about the vector from
the origin through the point (*x*, *y*, *z*). The current matrix (see
[**glMatrixMode**](glmatrixmode.md)) is multiplied by this rotation
matrix, with the product replacing the current matrix. That is, if M
is the current matrix and R is the translation matrix, then M is
replaced with M R. If the matrix mode is either GL\_MODELVIEW or
GL\_PROJECTION, all objects drawn after **glRotatef** is called are
rotated. Use [**glPushMatrix**](glpushmatrix.md) and
[**glPopMatrix**](glpopmatrix.md) to save and restore the unrotated
coordinate system. The following functions retrieve information
related to **glRotatef**:
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_RENDER\_MODE
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_MATRIX\_MODE
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_MODELVIEW\_MATRIX
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_PROJECTION\_MATRIX
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_TEXTURE\_MATRIX


%index
glScaled
The glScaled and glScalef functions multiply the current matrix by a general scaling matrix. | glScaled function (Gl.h)
%group
Win32 opengl32
%prm
x, y, z
x : [double] Scale factors along the *x* axis.
y : [double] Scale factors along the *y* axis.
z : [double] Scale factors along the *z* axis.
%inst
The glScaled and glScalef functions multiply the current matrix by a
general scaling matrix. | glScaled function (Gl.h)

[戻り値]
This function does not return a value.

[備考]
The **glScaled** function produces a general scaling along the *x*,
*y*, and *z* axes. The three arguments indicate the desired scale
factors along each of the three axes. The resulting matrix is
![Diagram showing the matrix of scale factors along the x, y, and z
axes.](images/scale01.png) The current matrix (see
[**glMatrixMode**](glmatrixmode.md)) is multiplied by this scale
matrix, with the product replacing the current matrix. That is, if M
is the current matrix and S is the scale matrix, then M is replaced
with M S. If the matrix mode is either GL\_MODELVIEW or
GL\_PROJECTION, all objects drawn after **glScaled** is called are
scaled. Use [**glPushMatrix**](glpushmatrix.md) and
[**glPopMatrix**](glpopmatrix.md) to save and restore the unscaled
coordinate system. If scale factors other than 1.0 are applied to the
modelview matrix and lighting is enabled, automatic normalization of
normals should probably also be enabled ([**glEnable**](glenable.md)
and [**glDisable**](gldisable.md) with argument GL\_NORMALIZE). The
following functions retrieve information related to **glScaled**:
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_MATRIX\_MODE
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_MODELVIEW\_MATRIX
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_PROJECTION\_MATRIX
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_TEXTURE\_MATRIX


%index
glScalef
The glScaled and glScalef functions multiply the current matrix by a general scaling matrix. | glScalef function (Gl.h)
%group
Win32 opengl32
%prm
x, y, z
x : [float] Scale factors along the *x* axis.
y : [float] Scale factors along the *y* axis.
z : [float] Scale factors along the *z* axis.
%inst
The glScaled and glScalef functions multiply the current matrix by a
general scaling matrix. | glScalef function (Gl.h)

[戻り値]
This function does not return a value.

[備考]
The **glScalef** function produces a general scaling along the *x*,
*y*, and *z* axes. The three arguments indicate the desired scale
factors along each of the three axes. The resulting matrix appears in
the following image. ![Diagram showing the matrix of scale factors
along the x, y, and z axes.](images/scale01.png) The current matrix
(see [**glMatrixMode**](glmatrixmode.md)) is multiplied by this scale
matrix, with the product replacing the current matrix. That is, if M
is the current matrix and S is the scale matrix, then M is replaced
with M S. If the matrix mode is either GL\_MODELVIEW or
GL\_PROJECTION, all objects drawn after **glScalef** is called are
scaled. Use [**glPushMatrix**](glpushmatrix.md) and
[**glPopMatrix**](glpopmatrix.md) to save and restore the unscaled
coordinate system. If scale factors other than 1.0 are applied to the
modelview matrix and lighting is enabled, automatic normalization of
normals should probably also be enabled ([**glEnable**](glenable.md)
and [**glDisable**](gldisable.md) with argument GL\_NORMALIZE). The
following functions retrieve information related to **glScalef**:
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_MATRIX\_MODE
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_MODELVIEW\_MATRIX
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_PROJECTION\_MATRIX
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_TEXTURE\_MATRIX


%index
glScissor
The glScissor function defines the scissor box.
%group
Win32 opengl32
%prm
x, y, width, height
x : [int] The x (vertical axis) coordinate for the lower-left corner of the scissor box.
y : [int] The y (horizontal axis) coordinate for the lower-left corner of the scissor box. Together, x and y specify the lower-left corner of the scissor box. Initially (0,0).
width : [int] The width of the scissor box.
height : [int] The height of the scissor box. When an OpenGL context is *first* attached to a window, *width* and *height* are set to the dimensions of that window.
%inst
The glScissor function defines the scissor box.

[戻り値]
This function does not return a value.

[備考]
The **glScissor** function defines a rectangle, called the scissor
box, in window coordinates. The first two parameters, *x* and *y*,
specify the lower-left corner of the box. The *width* and *height*
parameters specify the width and height of the box. The scissor test
is enabled and disabled using [**glEnable**](glenable.md) and
**glDisable** with argument GL\_SCISSOR\_TEST. While the scissor test
is enabled, only pixels that lie within the scissor box can be
modified by drawing commands. Window coordinates have integer values
at the shared corners of framebuffer pixels, so
**glScissor**(0,0,1,1) allows only the lower-left pixel in the window
to be modified, and **glScissor**(0,0,0,0) disallows modification to
all pixels in the window. When the scissor test is disabled, it is as
though the scissor box includes the entire window. The following
functions retrieve information related to **glScissor**:
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_SCISSOR\_BOX [**glIsEnabled**](glisenabled.md) with
argument GL\_SCISSOR\_TEST


%index
glSelectBuffer
The glSelectBuffer function establishes a buffer for selection mode values.
%group
Win32 opengl32
%prm
size, buffer
size : [int] The size of *buffer*.
buffer : [var] Returns the selection data.
%inst
The glSelectBuffer function establishes a buffer for selection mode
values.

[戻り値]
This function does not return a value.

[備考]
The **glSelectBuffer** function has two parameters: *buffer* is a
pointer to an array of unsigned integers, and *size* indicates the
size of the array. The *buffer* parameter returns values from the
name stack (see [**glInitNames**](glinitnames.md),
[**glLoadName**](glloadname.md), [**glPushName**](glpushname.md))
when the rendering mode is GL\_SELECT (see
[**glRenderMode**](glrendermode.md)). The **glSelectBuffer** function
must be issued before selection mode is enabled, and it must not be
issued while the rendering mode is GL\_SELECT. Selection is used by a
programmer to determine which primitives are drawn into some region
of a window. The region is defined by the current modelview and
perspective matrices. In selection mode, no pixel fragments are
produced from rasterization. Instead, if a primitive intersects the
clip volume defined by the viewing frustum and the user-defined
clipping planes, this primitive causes a selection hit. (With
polygons, no hit occurs if the polygon is culled.) When a change is
made to the name stack, or when [**glRenderMode**](glrendermode.md)
is called, a hit record is copied to *buffer* if any hits have
occurred since the last such event (either a name stack change or a
**glRenderMode** call). The hit record consists of the number of
names in the name stack at the time of the event; followed by the
minimum and maximum depth values of all vertices that hit since the
previous event; followed by the name stack contents, bottom name
first. Returned depth values are mapped such that the largest
unsigned integer value corresponds to window coordinate depth 1.0,
and zero corresponds to window coordinate depth 0.0. An internal
index into *buffer* is reset to zero whenever selection mode is
entered. Each time a hit record is copied into *buffer*, the index is
incremented to point to the cell just past the end of the block of
namesthat is, to the next available cell. If the hit record is larger
than the number of remaining locations in *buffer*, as much data as
can fit is copied, and the overflow flag is set. If the name stack is
empty when a hit record is copied, that record consists of zero
followed by the minimum and maximum depth values. Selection mode is
exited by calling **glRenderMode** with an argument other than
GL\_SELECT. Whenever **glRenderMode** is called while the render mode
is GL\_SELECT, it returns the number of hit records copied to
*buffer*, resets the overflow flag and the selection buffer pointer,
and initializes the name stack to be empty. If the overflow bit was
set when **glRenderMode** was called, a negative hit record count is
returned. The contents of *buffer* are undefined until
[**glRenderMode**](glrendermode.md) is called with an argument other
than GL\_SELECT. The **glBegin**/**glEnd** primitives and calls to
[**glRasterPos**](glrasterpos-functions.md) can result in hits. The
following function retrieves information related to
**glSelectBuffer**:
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_NAME\_STACK\_DEPTH


%index
glShadeModel
The glShadeModel function selects flat or smooth shading.
%group
Win32 opengl32
%prm
mode
mode : [int] A symbolic value representing a shading technique. Accepted values are GL\_FLAT and GL\_SMOOTH. The default is GL\_SMOOTH.
%inst
The glShadeModel function selects flat or smooth shading.

[戻り値]
This function does not return a value.

[備考]
OpenGL primitives can have either flat or smooth shading. Smooth
shading, the default, causes the computed colors of vertices to be
interpolated as the primitive is rasterized, typically assigning
different colors to each resulting pixel fragment. Flat shading
selects the computed color of just one vertex and assigns it to all
the pixel fragments generated by rasterizing a single primitive. In
either case, the computed color of a vertex is the result of
lighting, if lighting is enabled, or it is the current color at the
time the vertex was specified, if lighting is disabled. Flat and
smooth shading are indistinguishable for points. Counting vertices
and primitives from one, starting when [**glBegin**](glbegin.md) is
issued, each flat-shaded line segment *i* is given the computed color
of vertex *i* + 1, its second vertex. Counting similarly from one,
each flat-shaded polygon is given the computed color of the vertex
listed in the following table. This is the last vertex to specify the
polygon in all cases except single polygons, where the first vertex
specifies the flat-shaded color.
| Primitive type of polygon i | Vertex |
|-----------------------------|----------| | Single polygon (*I*=1) |
1 | | Triangle strip | *i* + 2 | | Triangle fan | *i* + 2 | |
Independent triangle | 3*I* | | Quad strip | 2*i* + 2 | | Independent
quad | 4*I* |
Flat and smooth shading are specified by **glShadeModel** with *mode*
set to GL\_FLAT and GL\_SMOOTH, respectively. The following function
retrieves information related to **glShadeModel**:
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_SHADE\_MODEL


%index
glStencilFunc
The glStencilFunc function sets the function and reference value for stencil testing.
%group
Win32 opengl32
%prm
func, ref, mask
func : [int] The test function. The following eight tokens are valid.
ref : [int] 
mask : [int] A mask that is **AND**ed with both the reference value and the stored stencil value when the test is done.
%inst
The glStencilFunc function sets the function and reference value for
stencil testing.

[戻り値]
This function does not return a value.

[備考]
Stenciling, like *z*-buffering, enables and disables drawing on a
per-pixel basis. You draw into the stencil planes using OpenGL
drawing primitives, then render geometry and images, using the
stencil planes to mask out portions of the screen. Stenciling is
typically used in multipass rendering algorithms to achieve special
effects, such as decals, outlining, and constructive solid geometry
rendering. The stencil test conditionally eliminates a pixel based on
the outcome of a comparison between the reference value and the value
in the stencil buffer. The test is enabled by
[**glEnable**](glenable.md) and [**glDisable**](gldisable.md) with
argument GL\_STENCIL\_TEST. Actions taken based on the outcome of the
stencil test are specified with [**glStencilOp**](glstencilop.md).
The *func* parameter is a symbolic constant that determines the
stencil comparison function. It accepts one of the eight values shown
above. The *ref* parameter is an integer reference value that is used
in the stencil comparison. It is clamped to the range \[0, 2*n* 1\],
where *n* is the number of bitplanes in the stencil buffer. The
*mask* parameter is bitwise **AND**ed with both the reference value
and the stored stencil value, with the **AND**ed values participating
in the comparison. If *stencil* represents the value stored in the
corresponding stencil buffer location, the preceding list shows the
effect of each comparison function that can be specified by *func*.
Only if the comparison succeeds is the pixel passed through to the
next stage in the rasterization process (see
[**glStencilOp**](glstencilop.md)). All tests treat *stencil* values
as unsigned integers in the range \[0, 2*n* 1\], where *n* is the
number of bitplanes in the stencil buffer. Initially, the stencil
test is disabled. If there is no stencil buffer, no stencil
modification can occur and it is as if the stencil test always
passes. The following functions retrieve information related to
**glStencilFunc**:
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_STENCIL\_FUNC **glGet** with argument
GL\_STENCIL\_VALUE\_MASK **glGet** with argument GL\_STENCIL\_REF
**glGet** with argument GL\_STENCIL\_BITS
[**glIsEnabled**](glisenabled.md) with argument GL\_STENCIL\_TEST


%index
glStencilMask
The glStencilMask function controls the writing of individual bits in the stencil planes.
%group
Win32 opengl32
%prm
mask
mask : [int] A bit mask to enable and disable writing of individual bits in the stencil planes. Initially, the mask is all ones.
%inst
The glStencilMask function controls the writing of individual bits in
the stencil planes.

[戻り値]
This function does not return a value.

[備考]
The **glStencilMask** function controls the writing of individual
bits in the stencil planes. The least significant *n* bits of *mask*,
where *n* is the number of bits in the stencil buffer, specify a
mask. Wherever a one appears in the mask, the corresponding bit in
the stencil buffer is made writable. Where a zero appears, the bit is
write-protected. Initially, all bits are enabled for writing. The
following functions retrieve information related to
**glStencilMask**:
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_STENCIL\_WRITEMASK glGet with argument
GL\_STENCIL\_BITS


%index
glStencilOp
The glStencilOp function sets the stencil test actions.
%group
Win32 opengl32
%prm
fail, zfail, zpass
fail : [int] The action to take when the stencil test fails. The following six symbolic constants are accepted.
zfail : [int] Stencil action when the stencil test passes, but the depth test fails. Accepts the same symbolic constants as *fail.*
zpass : [int] Stencil action when both the stencil test and the depth test pass, or when the stencil test passes and either there is no depth buffer or depth testing is not enabled. Accepts the same symbolic constants as *fail*.
%inst
The glStencilOp function sets the stencil test actions.

[戻り値]
This function does not return a value.

[備考]
Stenciling, like *z*-buffering, enables and disables drawing on a
per-pixel basis. You draw into the stencil planes using OpenGL
drawing primitives, then render geometry and images, using the
stencil planes to mask out portions of the screen. Stenciling is
typically used in multipass rendering algorithms to achieve special
effects, such as decals, outlining, and constructive solid geometry
rendering. The stencil test conditionally eliminates a pixel based on
the outcome of a comparison between the value in the stencil buffer
and a reference value. The test is enabled with
[**glEnable**](glenable.md) and [**glDisable**](gldisable.md) calls
with argument GL\_STENCIL\_TEST, and controlled with
[**glStencilFunc**](glstencilfunc.md). The **glStencilOp** function
takes three arguments that indicate what happens to the stored
stencil value while stenciling is enabled. If the stencil test fails,
no change is made to the pixel's color or depth buffers, and *fail*
specifies what happens to the stencil buffer contents. Stencil buffer
values are treated as unsigned integers. When incremented and
decremented, values are clamped to 0 and 2*n* 1, where *n* is the
value returned by querying GL\_STENCIL\_BITS. The other two arguments
to **glStencilOp** specify stencil buffer actions should subsequent
depth buffer tests succeed (*zpass*) or fail (*zfail*). (See
[**glDepthFunc**](gldepthfunc.md).) They are specified using the same
six symbolic constants as *fail*. Note that *zfail* is ignored when
there is no depth buffer, or when the depth buffer is not enabled. In
these cases, *fail* and *zpass* specify stencil action when the
stencil test fails and passes, respectively. Initially the stencil
test is disabled. If there is no stencil buffer, no stencil
modification can occur and it is as if the stencil tests always pass,
regardless of any call to **glStencilOp**. The following functions
retrieve information related to **glStencilOp**:
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_STENCIL\_FAIL **glGet** with argument
GL\_STENCIL\_PASS\_DEPTH\_PASS **glGet** with argument
GL\_STENCIL\_PASS\_DEPTH\_FAIL **glGet** with argument
GL\_STENCIL\_BITS [**glIsEnabled**](glisenabled.md) with argument
GL\_STENCIL\_TEST


%index
glTexCoord1d
Sets the current texture coordinates. | glTexCoord1d function (Gl.h)
%group
Win32 opengl32
%prm
s
s : [double] The s texture coordinate.
%inst
Sets the current texture coordinates. | glTexCoord1d function (Gl.h)

[戻り値]
This function does not return a value.

[備考]
The [**glTexCoord**](gltexcoord-functions.md) function sets the
current texture coordinates that are part of the data associated with
polygon vertices. The **glTexCoord** function specifies texture
coordinates in one, two, three, or four dimensions. The glTexCoord1
function sets the current texture coordinates to (s, 0, 0, 1); a call
to glTexCoord2 sets them to (s, t, 0, 1). Similarly, glTexCoord3
specifies the texture coordinates as (s, t, r, 1), and glTexCoord4
defines all four components explicitly as (s, t, r, q). You can
update the current texture coordinates at any time. In particular,
you can call glTexCoord between a call to [**glBegin**](glbegin.md)
and the corresponding call to [**glEnd**](glend.md). The following
function retrieves information related to **glTexCoord**:
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_TEXTURE\_COORDS


%index
glTexCoord1dv
Sets the current texture coordinates. | glTexCoord1dv function (Gl.h)
%group
Win32 opengl32
%prm
v
v : [var] A pointer to an array of texture coordinates.
%inst
Sets the current texture coordinates. | glTexCoord1dv function (Gl.h)

[戻り値]
This function does not return a value.

[備考]
The [**glTexCoord**](gltexcoord-functions.md) function sets the
current texture coordinates that are part of the data associated with
polygon vertices. The **glTexCoord** function specifies texture
coordinates in one, two, three, or four dimensions. The glTexCoord1
function sets the current texture coordinates to (s, 0, 0, 1); a call
to glTexCoord2 sets them to (s, t, 0, 1). Similarly, glTexCoord3
specifies the texture coordinates as (s, t, r, 1), and glTexCoord4
defines all four components explicitly as (s, t, r, q). You can
update the current texture coordinates at any time. In particular,
you can call glTexCoord between a call to [**glBegin**](glbegin.md)
and the corresponding call to [**glEnd**](glend.md). The following
function retrieves information related to **glTexCoord**:
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_TEXTURE\_COORDS


%index
glTexCoord1f
Sets the current texture coordinates. | glTexCoord1f function (Gl.h)
%group
Win32 opengl32
%prm
s
s : [float] The s texture coordinate.
%inst
Sets the current texture coordinates. | glTexCoord1f function (Gl.h)

[戻り値]
This function does not return a value.

[備考]
The [**glTexCoord**](gltexcoord-functions.md) function sets the
current texture coordinates that are part of the data associated with
polygon vertices. The **glTexCoord** function specifies texture
coordinates in one, two, three, or four dimensions. The glTexCoord1
function sets the current texture coordinates to (s, 0, 0, 1); a call
to glTexCoord2 sets them to (s, t, 0, 1). Similarly, glTexCoord3
specifies the texture coordinates as (s, t, r, 1), and glTexCoord4
defines all four components explicitly as (s, t, r, q). You can
update the current texture coordinates at any time. In particular,
you can call glTexCoord between a call to [**glBegin**](glbegin.md)
and the corresponding call to [**glEnd**](glend.md). The following
function retrieves information related to **glTexCoord**:
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_TEXTURE\_COORDS


%index
glTexCoord1fv
Sets the current texture coordinates. | glTexCoord1fv function (Gl.h)
%group
Win32 opengl32
%prm
v
v : [var] A pointer to an array of texture coordinates.
%inst
Sets the current texture coordinates. | glTexCoord1fv function (Gl.h)

[戻り値]
This function does not return a value.

[備考]
The [**glTexCoord**](gltexcoord-functions.md) function sets the
current texture coordinates that are part of the data associated with
polygon vertices. The **glTexCoord** function specifies texture
coordinates in one, two, three, or four dimensions. The glTexCoord1
function sets the current texture coordinates to (s, 0, 0, 1); a call
to glTexCoord2 sets them to (s, t, 0, 1). Similarly, glTexCoord3
specifies the texture coordinates as (s, t, r, 1), and glTexCoord4
defines all four components explicitly as (s, t, r, q). You can
update the current texture coordinates at any time. In particular,
you can call glTexCoord between a call to [**glBegin**](glbegin.md)
and the corresponding call to [**glEnd**](glend.md). The following
function retrieves information related to **glTexCoord**:
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_TEXTURE\_COORDS


%index
glTexCoord1i
Sets the current texture coordinates. | glTexCoord1i function (Gl.h)
%group
Win32 opengl32
%prm
s
s : [int] The s texture coordinate.
%inst
Sets the current texture coordinates. | glTexCoord1i function (Gl.h)

[戻り値]
This function does not return a value.

[備考]
The [**glTexCoord**](gltexcoord-functions.md) function sets the
current texture coordinates that are part of the data associated with
polygon vertices. The **glTexCoord** function specifies texture
coordinates in one, two, three, or four dimensions. The glTexCoord1
function sets the current texture coordinates to (s, 0, 0, 1); a call
to glTexCoord2 sets them to (s, t, 0, 1). Similarly, glTexCoord3
specifies the texture coordinates as (s, t, r, 1), and glTexCoord4
defines all four components explicitly as (s, t, r, q). You can
update the current texture coordinates at any time. In particular,
you can call glTexCoord between a call to [**glBegin**](glbegin.md)
and the corresponding call to [**glEnd**](glend.md). The following
function retrieves information related to **glTexCoord**:
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_TEXTURE\_COORDS


%index
glTexCoord1iv
Sets the current texture coordinates. | glTexCoord1iv function (Gl.h)
%group
Win32 opengl32
%prm
v
v : [var] A pointer to an array of texture coordinates.
%inst
Sets the current texture coordinates. | glTexCoord1iv function (Gl.h)

[戻り値]
This function does not return a value.

[備考]
The [**glTexCoord**](gltexcoord-functions.md) function sets the
current texture coordinates that are part of the data associated with
polygon vertices. The **glTexCoord** function specifies texture
coordinates in one, two, three, or four dimensions. The glTexCoord1
function sets the current texture coordinates to (s, 0, 0, 1); a call
to glTexCoord2 sets them to (s, t, 0, 1). Similarly, glTexCoord3
specifies the texture coordinates as (s, t, r, 1), and glTexCoord4
defines all four components explicitly as (s, t, r, q). You can
update the current texture coordinates at any time. In particular,
you can call glTexCoord between a call to [**glBegin**](glbegin.md)
and the corresponding call to [**glEnd**](glend.md). The following
function retrieves information related to **glTexCoord**:
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_TEXTURE\_COORDS


%index
glTexCoord1s
Sets the current texture coordinates. | glTexCoord1s function (Gl.h)
%group
Win32 opengl32
%prm
s
s : [int] The s texture coordinate.
%inst
Sets the current texture coordinates. | glTexCoord1s function (Gl.h)

[戻り値]
This function does not return a value.

[備考]
The [**glTexCoord**](gltexcoord-functions.md) function sets the
current texture coordinates that are part of the data associated with
polygon vertices. The **glTexCoord** function specifies texture
coordinates in one, two, three, or four dimensions. The glTexCoord1
function sets the current texture coordinates to (s, 0, 0, 1); a call
to glTexCoord2 sets them to (s, t, 0, 1). Similarly, glTexCoord3
specifies the texture coordinates as (s, t, r, 1), and glTexCoord4
defines all four components explicitly as (s, t, r, q). You can
update the current texture coordinates at any time. In particular,
you can call glTexCoord between a call to [**glBegin**](glbegin.md)
and the corresponding call to [**glEnd**](glend.md). The following
function retrieves information related to **glTexCoord**:
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_TEXTURE\_COORDS


%index
glTexCoord1sv
Sets the current texture coordinates. | glTexCoord1sv function (Gl.h)
%group
Win32 opengl32
%prm
v
v : [var] A pointer to an array of texture coordinates.
%inst
Sets the current texture coordinates. | glTexCoord1sv function (Gl.h)

[戻り値]
This function does not return a value.

[備考]
The [**glTexCoord**](gltexcoord-functions.md) function sets the
current texture coordinates that are part of the data associated with
polygon vertices. The **glTexCoord** function specifies texture
coordinates in one, two, three, or four dimensions. The glTexCoord1
function sets the current texture coordinates to (s, 0, 0, 1); a call
to glTexCoord2 sets them to (s, t, 0, 1). Similarly, glTexCoord3
specifies the texture coordinates as (s, t, r, 1), and glTexCoord4
defines all four components explicitly as (s, t, r, q). You can
update the current texture coordinates at any time. In particular,
you can call glTexCoord between a call to [**glBegin**](glbegin.md)
and the corresponding call to [**glEnd**](glend.md). The following
function retrieves information related to **glTexCoord**:
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_TEXTURE\_COORDS


%index
glTexCoord2d
Sets the current texture coordinates. | glTexCoord2d function (Gl.h)
%group
Win32 opengl32
%prm
s, t
s : [double] The s texture coordinate.
t : [double] The t texture coordinate.
%inst
Sets the current texture coordinates. | glTexCoord2d function (Gl.h)

[戻り値]
This function does not return a value.

[備考]
The [**glTexCoord**](gltexcoord-functions.md) function sets the
current texture coordinates that are part of the data associated with
polygon vertices. The **glTexCoord** function specifies texture
coordinates in one, two, three, or four dimensions. The glTexCoord1
function sets the current texture coordinates to (s, 0, 0, 1); a call
to glTexCoord2 sets them to (s, t, 0, 1). Similarly, glTexCoord3
specifies the texture coordinates as (s, t, r, 1), and glTexCoord4
defines all four components explicitly as (s, t, r, q). You can
update the current texture coordinates at any time. In particular,
you can call glTexCoord between a call to [**glBegin**](glbegin.md)
and the corresponding call to [**glEnd**](glend.md). The following
function retrieves information related to **glTexCoord**:
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_TEXTURE\_COORDS


%index
glTexCoord2dv
Sets the current texture coordinates. | glTexCoord2dv function (Gl.h)
%group
Win32 opengl32
%prm
v
v : [var] A pointer to an array of two elements, which in turn specifies the s and t texture coordinates.
%inst
Sets the current texture coordinates. | glTexCoord2dv function (Gl.h)

[戻り値]
This function does not return a value.

[備考]
The [**glTexCoord**](gltexcoord-functions.md) function sets the
current texture coordinates that are part of the data associated with
polygon vertices. The **glTexCoord** function specifies texture
coordinates in one, two, three, or four dimensions. The glTexCoord1
function sets the current texture coordinates to (s, 0, 0, 1); a call
to glTexCoord2 sets them to (s, t, 0, 1). Similarly, glTexCoord3
specifies the texture coordinates as (s, t, r, 1), and glTexCoord4
defines all four components explicitly as (s, t, r, q). You can
update the current texture coordinates at any time. In particular,
you can call glTexCoord between a call to [**glBegin**](glbegin.md)
and the corresponding call to [**glEnd**](glend.md). The following
function retrieves information related to **glTexCoord**:
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_TEXTURE\_COORDS


%index
glTexCoord2f
(no summary)
%group
Win32 opengl32
%prm
s, t
s : [float] 
t : [float] 
%inst



%index
glTexCoord2fv
Sets the current texture coordinates. | glTexCoord2fv function (Gl.h)
%group
Win32 opengl32
%prm
v
v : [var] A pointer to an array of two elements, which in turn specifies the s and t texture coordinates.
%inst
Sets the current texture coordinates. | glTexCoord2fv function (Gl.h)

[戻り値]
This function does not return a value.

[備考]
The [**glTexCoord**](gltexcoord-functions.md) function sets the
current texture coordinates that are part of the data associated with
polygon vertices. The **glTexCoord** function specifies texture
coordinates in one, two, three, or four dimensions. The glTexCoord1
function sets the current texture coordinates to (s, 0, 0, 1); a call
to glTexCoord2 sets them to (s, t, 0, 1). Similarly, glTexCoord3
specifies the texture coordinates as (s, t, r, 1), and glTexCoord4
defines all four components explicitly as (s, t, r, q). You can
update the current texture coordinates at any time. In particular,
you can call glTexCoord between a call to [**glBegin**](glbegin.md)
and the corresponding call to [**glEnd**](glend.md). The following
function retrieves information related to **glTexCoord**:
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_TEXTURE\_COORDS


%index
glTexCoord2i
Sets the current texture coordinates. | glTexCoord2i function (Gl.h)
%group
Win32 opengl32
%prm
s, t
s : [int] The s texture coordinate.
t : [int] The t texture coordinate.
%inst
Sets the current texture coordinates. | glTexCoord2i function (Gl.h)

[戻り値]
This function does not return a value.

[備考]
The [**glTexCoord**](gltexcoord-functions.md) function sets the
current texture coordinates that are part of the data associated with
polygon vertices. The **glTexCoord** function specifies texture
coordinates in one, two, three, or four dimensions. The glTexCoord1
function sets the current texture coordinates to (s, 0, 0, 1); a call
to glTexCoord2 sets them to (s, t, 0, 1). Similarly, glTexCoord3
specifies the texture coordinates as (s, t, r, 1), and glTexCoord4
defines all four components explicitly as (s, t, r, q). You can
update the current texture coordinates at any time. In particular,
you can call glTexCoord between a call to [**glBegin**](glbegin.md)
and the corresponding call to [**glEnd**](glend.md). The following
function retrieves information related to **glTexCoord**:
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_TEXTURE\_COORDS


%index
glTexCoord2iv
Sets the current texture coordinates. | glTexCoord2iv function (Gl.h)
%group
Win32 opengl32
%prm
v
v : [var] A pointer to an array of two elements, which in turn specifies the s and t texture coordinates.
%inst
Sets the current texture coordinates. | glTexCoord2iv function (Gl.h)

[戻り値]
This function does not return a value.

[備考]
The [**glTexCoord**](gltexcoord-functions.md) function sets the
current texture coordinates that are part of the data associated with
polygon vertices. The **glTexCoord** function specifies texture
coordinates in one, two, three, or four dimensions. The glTexCoord1
function sets the current texture coordinates to (s, 0, 0, 1); a call
to glTexCoord2 sets them to (s, t, 0, 1). Similarly, glTexCoord3
specifies the texture coordinates as (s, t, r, 1), and glTexCoord4
defines all four components explicitly as (s, t, r, q). You can
update the current texture coordinates at any time. In particular,
you can call glTexCoord between a call to [**glBegin**](glbegin.md)
and the corresponding call to [**glEnd**](glend.md). The following
function retrieves information related to **glTexCoord**:
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_TEXTURE\_COORDS


%index
glTexCoord2s
Sets the current texture coordinates. | glTexCoord2s function (Gl.h)
%group
Win32 opengl32
%prm
s, t
s : [int] The s texture coordinate.
t : [int] The t texture coordinate.
%inst
Sets the current texture coordinates. | glTexCoord2s function (Gl.h)

[戻り値]
This function does not return a value.

[備考]
The [**glTexCoord**](gltexcoord-functions.md) function sets the
current texture coordinates that are part of the data associated with
polygon vertices. The **glTexCoord** function specifies texture
coordinates in one, two, three, or four dimensions. The glTexCoord1
function sets the current texture coordinates to (s, 0, 0, 1); a call
to glTexCoord2 sets them to (s, t, 0, 1). Similarly, glTexCoord3
specifies the texture coordinates as (s, t, r, 1), and glTexCoord4
defines all four components explicitly as (s, t, r, q). You can
update the current texture coordinates at any time. In particular,
you can call glTexCoord between a call to [**glBegin**](glbegin.md)
and the corresponding call to [**glEnd**](glend.md). The following
function retrieves information related to **glTexCoord**:
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_TEXTURE\_COORDS


%index
glTexCoord2sv
Sets the current texture coordinates. | glTexCoord2sv function (Gl.h)
%group
Win32 opengl32
%prm
v
v : [var] A pointer to an array of two elements, which in turn specifies the s and t texture coordinates.
%inst
Sets the current texture coordinates. | glTexCoord2sv function (Gl.h)

[戻り値]
This function does not return a value.

[備考]
The [**glTexCoord**](gltexcoord-functions.md) function sets the
current texture coordinates that are part of the data associated with
polygon vertices. The **glTexCoord** function specifies texture
coordinates in one, two, three, or four dimensions. The glTexCoord1
function sets the current texture coordinates to (s, 0, 0, 1); a call
to glTexCoord2 sets them to (s, t, 0, 1). Similarly, glTexCoord3
specifies the texture coordinates as (s, t, r, 1), and glTexCoord4
defines all four components explicitly as (s, t, r, q). You can
update the current texture coordinates at any time. In particular,
you can call glTexCoord between a call to [**glBegin**](glbegin.md)
and the corresponding call to [**glEnd**](glend.md). The following
function retrieves information related to **glTexCoord**:
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_TEXTURE\_COORDS


%index
glTexCoord3d
Sets the current texture coordinates. | glTexCoord3d function (Gl.h)
%group
Win32 opengl32
%prm
s, t, r
s : [double] The s texture coordinate.
t : [double] The t texture coordinate.
r : [double] The r texture coordinate.
%inst
Sets the current texture coordinates. | glTexCoord3d function (Gl.h)

[戻り値]
This function does not return a value.

[備考]
The [**glTexCoord**](gltexcoord-functions.md) function sets the
current texture coordinates that are part of the data associated with
polygon vertices. The **glTexCoord** function specifies texture
coordinates in one, two, three, or four dimensions. The glTexCoord1
function sets the current texture coordinates to (s, 0, 0, 1); a call
to glTexCoord2 sets them to (s, t, 0, 1). Similarly, glTexCoord3
specifies the texture coordinates as (s, t, r, 1), and glTexCoord4
defines all four components explicitly as (s, t, r, q). You can
update the current texture coordinates at any time. In particular,
you can call glTexCoord between a call to [**glBegin**](glbegin.md)
and the corresponding call to [**glEnd**](glend.md). The following
function retrieves information related to **glTexCoord**:
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_TEXTURE\_COORDS


%index
glTexCoord3dv
Sets the current texture coordinates. | glTexCoord3dv function (Gl.h)
%group
Win32 opengl32
%prm
v
v : [var] A pointer to an array of three elements, which in turn specifies the s, t, and r texture coordinates.
%inst
Sets the current texture coordinates. | glTexCoord3dv function (Gl.h)

[戻り値]
This function does not return a value.

[備考]
The [**glTexCoord**](gltexcoord-functions.md) function sets the
current texture coordinates that are part of the data associated with
polygon vertices. The **glTexCoord** function specifies texture
coordinates in one, two, three, or four dimensions. The glTexCoord1
function sets the current texture coordinates to (s, 0, 0, 1); a call
to glTexCoord2 sets them to (s, t, 0, 1). Similarly, glTexCoord3
specifies the texture coordinates as (s, t, r, 1), and glTexCoord4
defines all four components explicitly as (s, t, r, q). You can
update the current texture coordinates at any time. In particular,
you can call glTexCoord between a call to [**glBegin**](glbegin.md)
and the corresponding call to [**glEnd**](glend.md). The following
function retrieves information related to **glTexCoord**:
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_TEXTURE\_COORDS


%index
glTexCoord3f
(no summary)
%group
Win32 opengl32
%prm
s, t, r
s : [float] 
t : [float] 
r : [float] 
%inst



%index
glTexCoord3fv
Sets the current texture coordinates. | glTexCoord3fv function (Gl.h)
%group
Win32 opengl32
%prm
v
v : [var] A pointer to an array of three elements, which in turn specifies the s, t, and r texture coordinates.
%inst
Sets the current texture coordinates. | glTexCoord3fv function (Gl.h)

[戻り値]
This function does not return a value.

[備考]
The [**glTexCoord**](gltexcoord-functions.md) function sets the
current texture coordinates that are part of the data associated with
polygon vertices. The **glTexCoord** function specifies texture
coordinates in one, two, three, or four dimensions. The glTexCoord1
function sets the current texture coordinates to (s, 0, 0, 1); a call
to glTexCoord2 sets them to (s, t, 0, 1). Similarly, glTexCoord3
specifies the texture coordinates as (s, t, r, 1), and glTexCoord4
defines all four components explicitly as (s, t, r, q). You can
update the current texture coordinates at any time. In particular,
you can call glTexCoord between a call to [**glBegin**](glbegin.md)
and the corresponding call to [**glEnd**](glend.md). The following
function retrieves information related to **glTexCoord**:
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_TEXTURE\_COORDS


%index
glTexCoord3i
Sets the current texture coordinates. | glTexCoord3i function (Gl.h)
%group
Win32 opengl32
%prm
s, t, r
s : [int] The s texture coordinate.
t : [int] The t texture coordinate.
r : [int] The r texture coordinate.
%inst
Sets the current texture coordinates. | glTexCoord3i function (Gl.h)

[戻り値]
This function does not return a value.

[備考]
The [**glTexCoord**](gltexcoord-functions.md) function sets the
current texture coordinates that are part of the data associated with
polygon vertices. The **glTexCoord** function specifies texture
coordinates in one, two, three, or four dimensions. The glTexCoord1
function sets the current texture coordinates to (s, 0, 0, 1); a call
to glTexCoord2 sets them to (s, t, 0, 1). Similarly, glTexCoord3
specifies the texture coordinates as (s, t, r, 1), and glTexCoord4
defines all four components explicitly as (s, t, r, q). You can
update the current texture coordinates at any time. In particular,
you can call glTexCoord between a call to [**glBegin**](glbegin.md)
and the corresponding call to [**glEnd**](glend.md). The following
function retrieves information related to **glTexCoord**:
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_TEXTURE\_COORDS


%index
glTexCoord3iv
Sets the current texture coordinates. | glTexCoord3iv function (Gl.h)
%group
Win32 opengl32
%prm
v
v : [var] A pointer to an array of three elements, which in turn specifies the s, t, and r texture coordinates.
%inst
Sets the current texture coordinates. | glTexCoord3iv function (Gl.h)

[戻り値]
This function does not return a value.

[備考]
The [**glTexCoord**](gltexcoord-functions.md) function sets the
current texture coordinates that are part of the data associated with
polygon vertices. The **glTexCoord** function specifies texture
coordinates in one, two, three, or four dimensions. The glTexCoord1
function sets the current texture coordinates to (s, 0, 0, 1); a call
to glTexCoord2 sets them to (s, t, 0, 1). Similarly, glTexCoord3
specifies the texture coordinates as (s, t, r, 1), and glTexCoord4
defines all four components explicitly as (s, t, r, q). You can
update the current texture coordinates at any time. In particular,
you can call glTexCoord between a call to [**glBegin**](glbegin.md)
and the corresponding call to [**glEnd**](glend.md). The following
function retrieves information related to **glTexCoord**:
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_TEXTURE\_COORDS


%index
glTexCoord3s
Sets the current texture coordinates. | glTexCoord3s function (Gl.h)
%group
Win32 opengl32
%prm
s, t, r
s : [int] The s texture coordinate.
t : [int] The t texture coordinate.
r : [int] The r texture coordinate.
%inst
Sets the current texture coordinates. | glTexCoord3s function (Gl.h)

[戻り値]
This function does not return a value.

[備考]
The [**glTexCoord**](gltexcoord-functions.md) function sets the
current texture coordinates that are part of the data associated with
polygon vertices. The **glTexCoord** function specifies texture
coordinates in one, two, three, or four dimensions. The glTexCoord1
function sets the current texture coordinates to (s, 0, 0, 1); a call
to glTexCoord2 sets them to (s, t, 0, 1). Similarly, glTexCoord3
specifies the texture coordinates as (s, t, r, 1), and glTexCoord4
defines all four components explicitly as (s, t, r, q). You can
update the current texture coordinates at any time. In particular,
you can call glTexCoord between a call to [**glBegin**](glbegin.md)
and the corresponding call to [**glEnd**](glend.md). The following
function retrieves information related to **glTexCoord**:
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_TEXTURE\_COORDS


%index
glTexCoord3sv
Sets the current texture coordinates. | glTexCoord3sv function (Gl.h)
%group
Win32 opengl32
%prm
v
v : [var] A pointer to an array of three elements, which in turn specifies the s, t, and r texture coordinates.
%inst
Sets the current texture coordinates. | glTexCoord3sv function (Gl.h)

[戻り値]
This function does not return a value.

[備考]
The [**glTexCoord**](gltexcoord-functions.md) function sets the
current texture coordinates that are part of the data associated with
polygon vertices. The **glTexCoord** function specifies texture
coordinates in one, two, three, or four dimensions. The glTexCoord1
function sets the current texture coordinates to (s, 0, 0, 1); a call
to glTexCoord2 sets them to (s, t, 0, 1). Similarly, glTexCoord3
specifies the texture coordinates as (s, t, r, 1), and glTexCoord4
defines all four components explicitly as (s, t, r, q). You can
update the current texture coordinates at any time. In particular,
you can call glTexCoord between a call to [**glBegin**](glbegin.md)
and the corresponding call to [**glEnd**](glend.md). The following
function retrieves information related to **glTexCoord**:
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_TEXTURE\_COORDS


%index
glTexCoord4d
Sets the current texture coordinates. | glTexCoord4d function (Gl.h)
%group
Win32 opengl32
%prm
s, t, r, q
s : [double] The s texture coordinate.
t : [double] The t texture coordinate.
r : [double] The r texture coordinate.
q : [double] The q texture coordinate.
%inst
Sets the current texture coordinates. | glTexCoord4d function (Gl.h)

[戻り値]
This function does not return a value.

[備考]
The [**glTexCoord**](gltexcoord-functions.md) function sets the
current texture coordinates that are part of the data associated with
polygon vertices. The **glTexCoord** function specifies texture
coordinates in one, two, three, or four dimensions. The glTexCoord1
function sets the current texture coordinates to (s, 0, 0, 1); a call
to glTexCoord2 sets them to (s, t, 0, 1). Similarly, glTexCoord3
specifies the texture coordinates as (s, t, r, 1), and glTexCoord4
defines all four components explicitly as (s, t, r, q). You can
update the current texture coordinates at any time. In particular,
you can call glTexCoord between a call to [**glBegin**](glbegin.md)
and the corresponding call to [**glEnd**](glend.md). The following
function retrieves information related to **glTexCoord**:
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_TEXTURE\_COORDS


%index
glTexCoord4dv
Sets the current texture coordinates. | glTexCoord4dv function (Gl.h)
%group
Win32 opengl32
%prm
v
v : [var] A pointer to an array of four elements, which in turn specifies the s, t, r, and q texture coordinates.
%inst
Sets the current texture coordinates. | glTexCoord4dv function (Gl.h)

[戻り値]
This function does not return a value.

[備考]
The [**glTexCoord**](gltexcoord-functions.md) function sets the
current texture coordinates that are part of the data associated with
polygon vertices. The **glTexCoord** function specifies texture
coordinates in one, two, three, or four dimensions. The glTexCoord1
function sets the current texture coordinates to (s, 0, 0, 1); a call
to glTexCoord2 sets them to (s, t, 0, 1). Similarly, glTexCoord3
specifies the texture coordinates as (s, t, r, 1), and glTexCoord4
defines all four components explicitly as (s, t, r, q). You can
update the current texture coordinates at any time. In particular,
you can call glTexCoord between a call to [**glBegin**](glbegin.md)
and the corresponding call to [**glEnd**](glend.md). The following
function retrieves information related to **glTexCoord**:
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_TEXTURE\_COORDS


%index
glTexCoord4f
Sets the current texture coordinates. | glTexCoord4f function (Gl.h)
%group
Win32 opengl32
%prm
s, t, r, q
s : [float] The s texture coordinate.
t : [float] The t texture coordinate.
r : [float] The r texture coordinate.
q : [float] The q texture coordinate.
%inst
Sets the current texture coordinates. | glTexCoord4f function (Gl.h)

[戻り値]
This function does not return a value.

[備考]
The [**glTexCoord**](gltexcoord-functions.md) function sets the
current texture coordinates that are part of the data associated with
polygon vertices. The **glTexCoord** function specifies texture
coordinates in one, two, three, or four dimensions. The glTexCoord1
function sets the current texture coordinates to (s, 0, 0, 1); a call
to glTexCoord2 sets them to (s, t, 0, 1). Similarly, glTexCoord3
specifies the texture coordinates as (s, t, r, 1), and glTexCoord4
defines all four components explicitly as (s, t, r, q). You can
update the current texture coordinates at any time. In particular,
you can call glTexCoord between a call to [**glBegin**](glbegin.md)
and the corresponding call to [**glEnd**](glend.md). The following
function retrieves information related to **glTexCoord**:
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_TEXTURE\_COORDS


%index
glTexCoord4fv
Sets the current texture coordinates. | glTexCoord4fv function (Gl.h)
%group
Win32 opengl32
%prm
v
v : [var] A pointer to an array of four elements, which in turn specifies the s, t, r, and q texture coordinates.
%inst
Sets the current texture coordinates. | glTexCoord4fv function (Gl.h)

[戻り値]
This function does not return a value.

[備考]
The [**glTexCoord**](gltexcoord-functions.md) function sets the
current texture coordinates that are part of the data associated with
polygon vertices. The **glTexCoord** function specifies texture
coordinates in one, two, three, or four dimensions. The glTexCoord1
function sets the current texture coordinates to (s, 0, 0, 1); a call
to glTexCoord2 sets them to (s, t, 0, 1). Similarly, glTexCoord3
specifies the texture coordinates as (s, t, r, 1), and glTexCoord4
defines all four components explicitly as (s, t, r, q). You can
update the current texture coordinates at any time. In particular,
you can call glTexCoord between a call to [**glBegin**](glbegin.md)
and the corresponding call to [**glEnd**](glend.md). The following
function retrieves information related to **glTexCoord**:
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_TEXTURE\_COORDS


%index
glTexCoord4i
Sets the current texture coordinates. | glTexCoord4i function (Gl.h)
%group
Win32 opengl32
%prm
s, t, r, q
s : [int] The s texture coordinate.
t : [int] The t texture coordinate.
r : [int] The r texture coordinate.
q : [int] The q texture coordinate.
%inst
Sets the current texture coordinates. | glTexCoord4i function (Gl.h)

[戻り値]
This function does not return a value.

[備考]
The [**glTexCoord**](gltexcoord-functions.md) function sets the
current texture coordinates that are part of the data associated with
polygon vertices. The **glTexCoord** function specifies texture
coordinates in one, two, three, or four dimensions. The glTexCoord1
function sets the current texture coordinates to (s, 0, 0, 1); a call
to glTexCoord2 sets them to (s, t, 0, 1). Similarly, glTexCoord3
specifies the texture coordinates as (s, t, r, 1), and glTexCoord4
defines all four components explicitly as (s, t, r, q). You can
update the current texture coordinates at any time. In particular,
you can call glTexCoord between a call to [**glBegin**](glbegin.md)
and the corresponding call to [**glEnd**](glend.md). The following
function retrieves information related to **glTexCoord**:
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_TEXTURE\_COORDS


%index
glTexCoord4iv
Sets the current texture coordinates. | glTexCoord4iv function (Gl.h)
%group
Win32 opengl32
%prm
v
v : [var] A pointer to an array of four elements, which in turn specifies the s, t, r, and q texture coordinates.
%inst
Sets the current texture coordinates. | glTexCoord4iv function (Gl.h)

[戻り値]
This function does not return a value.

[備考]
The [**glTexCoord**](gltexcoord-functions.md) function sets the
current texture coordinates that are part of the data associated with
polygon vertices. The **glTexCoord** function specifies texture
coordinates in one, two, three, or four dimensions. The glTexCoord1
function sets the current texture coordinates to (s, 0, 0, 1); a call
to glTexCoord2 sets them to (s, t, 0, 1). Similarly, glTexCoord3
specifies the texture coordinates as (s, t, r, 1), and glTexCoord4
defines all four components explicitly as (s, t, r, q). You can
update the current texture coordinates at any time. In particular,
you can call glTexCoord between a call to [**glBegin**](glbegin.md)
and the corresponding call to [**glEnd**](glend.md). The following
function retrieves information related to **glTexCoord**:
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_TEXTURE\_COORDS


%index
glTexCoord4s
Sets the current texture coordinates. | glTexCoord4s function (Gl.h)
%group
Win32 opengl32
%prm
s, t, r, q
s : [int] The s texture coordinate.
t : [int] The t texture coordinate.
r : [int] The r texture coordinate.
q : [int] The q texture coordinate.
%inst
Sets the current texture coordinates. | glTexCoord4s function (Gl.h)

[戻り値]
This function does not return a value.

[備考]
The [**glTexCoord**](gltexcoord-functions.md) function sets the
current texture coordinates that are part of the data associated with
polygon vertices. The **glTexCoord** function specifies texture
coordinates in one, two, three, or four dimensions. The glTexCoord1
function sets the current texture coordinates to (s, 0, 0, 1); a call
to glTexCoord2 sets them to (s, t, 0, 1). Similarly, glTexCoord3
specifies the texture coordinates as (s, t, r, 1), and glTexCoord4
defines all four components explicitly as (s, t, r, q). You can
update the current texture coordinates at any time. In particular,
you can call glTexCoord between a call to [**glBegin**](glbegin.md)
and the corresponding call to [**glEnd**](glend.md). The following
function retrieves information related to **glTexCoord**:
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_TEXTURE\_COORDS


%index
glTexCoord4sv
Sets the current texture coordinates. | glTexCoord4sv function (Gl.h)
%group
Win32 opengl32
%prm
v
v : [var] A pointer to an array of four elements, which in turn specifies the s, t, r, and q texture coordinates.
%inst
Sets the current texture coordinates. | glTexCoord4sv function (Gl.h)

[戻り値]
This function does not return a value.

[備考]
The [**glTexCoord**](gltexcoord-functions.md) function sets the
current texture coordinates that are part of the data associated with
polygon vertices. The **glTexCoord** function specifies texture
coordinates in one, two, three, or four dimensions. The glTexCoord1
function sets the current texture coordinates to (s, 0, 0, 1); a call
to glTexCoord2 sets them to (s, t, 0, 1). Similarly, glTexCoord3
specifies the texture coordinates as (s, t, r, 1), and glTexCoord4
defines all four components explicitly as (s, t, r, q). You can
update the current texture coordinates at any time. In particular,
you can call glTexCoord between a call to [**glBegin**](glbegin.md)
and the corresponding call to [**glEnd**](glend.md). The following
function retrieves information related to **glTexCoord**:
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_CURRENT\_TEXTURE\_COORDS


%index
glTexCoordPointer
The glTexCoordPointer function defines an array of texture coordinates.
%group
Win32 opengl32
%prm
size, type, stride, pointer
size : [int] The number of coordinates per array element. The value of *size* must be 1, 2, 3, or 4.
type : [int] The data type of each texture coordinate in the array using the following symbolic constants: **GL\_SHORT**, **GL\_INT**, **GL\_FLOAT**, and **GL\_DOUBLE**.
stride : [int] The byte offset between consecutive array elements. When *stride* is zero, the array elements are tightly packed in the array.
pointer : [intptr] A pointer to the first coordinate of the first element in the array.
%inst
The glTexCoordPointer function defines an array of texture
coordinates.

[戻り値]
This function does not return a value.

[備考]
The **glTexCoordPointer** function specifies the location and data of
an array of texture coordinates to use when rendering.The *size*
parameter specifies the number of coordinates used for each element
of the array.The *type* parameter specifies the data type of each
texture coordinate. The *stride* parameter determines the byte offset
from one array element to the next, enabling the packing of vertices
and attributes in a single array or storage in separate arrays. In
some implementations, storing the vertices and attributes in a single
array can be more efficient than using separate arrays. For more
information, see [**glInterleavedArrays**](glinterleavedarrays.md).
When a texture coordinate array is specified, size, type, stride, and
pointer are saved client-side state. A texture coordinate array is
enabled when you specify the **GL\_TEXTURE\_COORD\_ARRAY** constant
with [**glEnableClientState**](glenableclientstate.md). When enabled,
[**glDrawArrays**](gldrawarrays.md),
[**glDrawElements**](gldrawelements.md), and
[**glArrayElement**](glarrayelement.md) use the texture coordinate
array. By default the texture coordinate array is disabled. You
cannot include **glTexCoordPointer** in display lists. When you
specify a texture coordinate array using **glTexCoordPointer**, the
values of all the function's texture coordinate array parameters are
saved in a client-side state, and static array elements can be
cached. Because the texture coordinate array parameters are
client-side state, their values are not saved or restored by
[**glPushAttrib**](glpushattrib.md) and
[**glPopAttrib**](glpopattrib.md). Although no error is generated
when you call **glTexCoordPointer** within [**glBegin**](glbegin.md)
and [**glEnd**](glend.md) pairs, the results are undefined. The
following functions retrieve information related to
**glTexCoordPointer**: [**glIsEnabled**](glisenabled.md) with
argument **GL\_TEXTURE\_COORD\_ARRAY**
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument **GL\_TEXTURE\_COORD\_ARRAY\_SIZE** **glGet** with
argument **GL\_TEXTURE\_COORD\_ARRAY\_STRIDE** **glGet** with
argument **GL\_TEXTURE\_COORD\_ARRAY\_COUNT** **glGet** with argument
**GL\_TEXTURE\_COORD\_ARRAY\_TYPE**
[**glGetPointerv**](glgetpointerv.md) with argument
**GL\_TEXTURE\_COORD\_ARRAY\_POINTER**


%index
glTexEnvf
The glTexEnvf function sets a texture environment parameter.
%group
Win32 opengl32
%prm
target, pname, param2
target : [int] A texture environment. Must be GL\_TEXTURE\_ENV.
pname : [int] The symbolic name of a single-valued texture environment parameter. Must be GL\_TEXTURE\_ENV\_MODE.
param2 : [float] 
%inst
The glTexEnvf function sets a texture environment parameter.

[戻り値]
This function does not return a value.

[備考]
A texture environment specifies how texture values are interpreted
when a fragment is textured. The *target* parameter must be
GL\_TEXTURE\_ENV. The *pname* parameter is GL\_TEXTURE\_ENV\_MODE.
Three texture functions are defined: GL\_MODULATE, GL\_DECAL, and
GL\_BLEND. A texture function acts on the fragment to be textured
using the texture image value that applies to the fragment (see
[**glTexParameter**](gltexparameter-functions.md)) and produces an
RGBA color for that fragment. The following table shows how the RGBA
color is produced for each of the three texture functions that can be
chosen. *C* is a triple of color values (RGB) and *A* is the
associated alpha value. RGBA values extracted from a texture image
are in the range \[0, 1\]. The subscript *f* refers to the incoming
fragment, the subscript *t* to the texture image, the subscript *c*
to the texture environment color, and subscript *v* indicates a value
produced by the texture function. A texture image can have up to four
components per texture element (see
[**glTexImage1D**](glteximage1d.md) and
[**glTexImage2D**](glteximage2d.md)). In a one-component image, Lt
indicates that single component. A two-component image uses *L?* and
*A?* . A three-component image has only a color value, *C?* . A
four-component image has both a color value *C?* and an alpha value
*A?* .
This doc was truncated.


%index
glTexEnvfv
The glTexEnvfv function sets a texture environment parameter.
%group
Win32 opengl32
%prm
target, pname, params
target : [int] A texture environment. Must be GL\_TEXTURE\_ENV.
pname : [int] The symbolic name of a single-valued texture environment parameter. Accepted values are GL\_TEXTURE\_ENV\_MODE and GL\_TEXTURE\_ENV\_COLOR.
params : [int] 
%inst
The glTexEnvfv function sets a texture environment parameter.

[戻り値]
This function does not return a value.

[備考]
A texture environment specifies how texture values are interpreted
when a fragment is textured. The *target* parameter must be
GL\_TEXTURE\_ENV. The *pname* parameter can be either
GL\_TEXTURE\_ENV\_MODE or GL\_TEXTURE\_ENV\_COLOR. If *pname* is
GL\_TEXTURE\_ENV\_MODE, then *params* is (or points to) the symbolic
name of a texture function. Three texture functions are defined:
GL\_MODULATE, GL\_DECAL, and GL\_BLEND. A texture function acts on
the fragment to be textured using the texture image value that
applies to the fragment (see
[**glTexParameter**](gltexparameter-functions.md)) and produces an
RGBA color for that fragment. The following table shows how the RGBA
color is produced for each of the three texture functions that can be
chosen. *C* is a triple of color values (RGB) and *A* is the
associated alpha value. RGBA values extracted from a texture image
are in the range \[0, 1\]. The subscript *f* refers to the incoming
fragment, the subscript *t* to the texture image, the subscript *c*
to the texture environment color, and subscript *v* indicates a value
produced by the texture function. A texture image can have up to four
components per texture element (see
[**glTexImage1D**](glteximage1d.md) and
[**glTexImage2D**](glteximage2d.md)). In a one-component image, Lt
indicates that single component. A two-component image uses *L?* and
*A?* . A three-component image has only a color value, *C?* . A
four-component image has both a color value *C?* and an alpha value
*A?* .
This doc was truncated.


%index
glTexEnvi
The glTexEnvi function sets a texture environment parameter.
%group
Win32 opengl32
%prm
target, pname, param2
target : [int] A texture environment. Must be GL\_TEXTURE\_ENV.
pname : [int] The symbolic name of a single-valued texture environment parameter. Must be GL\_TEXTURE\_ENV\_MODE.
param2 : [int] 
%inst
The glTexEnvi function sets a texture environment parameter.

[戻り値]
This function does not return a value.

[備考]
A texture environment specifies how texture values are interpreted
when a fragment is textured. The *target* parameter must be
GL\_TEXTURE\_ENV. The *pname* parameter is GL\_TEXTURE\_ENV\_MODE.
Three texture functions are defined: GL\_MODULATE, GL\_DECAL, and
GL\_BLEND. A texture function acts on the fragment to be textured
using the texture image value that applies to the fragment (see
[**glTexParameter**](gltexparameter-functions.md)) and produces an
RGBA color for that fragment. The following table shows how the RGBA
color is produced for each of the three texture functions that can be
chosen. *C* is a triple of color values (RGB) and *A* is the
associated alpha value. RGBA values extracted from a texture image
are in the range \[0, 1\]. The subscript *f* refers to the incoming
fragment, the subscript *t* to the texture image, the subscript *c*
to the texture environment color, and subscript *v* indicates a value
produced by the texture function. A texture image can have up to four
components per texture element (see
[**glTexImage1D**](glteximage1d.md) and
[**glTexImage2D**](glteximage2d.md)). In a one-component image, Lt
indicates that single component. A two-component image uses *L?* and
*A?* . A three-component image has only a color value, *C?* . A
four-component image has both a color value *C?* and an alpha value
*A?* .
This doc was truncated.


%index
glTexEnviv
The glTexEnviv function sets a texture environment parameter.
%group
Win32 opengl32
%prm
target, pname, params
target : [int] A texture environment. Must be GL\_TEXTURE\_ENV.
pname : [int] The symbolic name of a single-valued texture environment parameter. Accepted values are GL\_TEXTURE\_ENV\_MODE and GL\_TEXTURE\_ENV\_COLOR.
params : [int] 
%inst
The glTexEnviv function sets a texture environment parameter.

[戻り値]
This function does not return a value.

[備考]
A texture environment specifies how texture values are interpreted
when a fragment is textured. The *target* parameter must be
GL\_TEXTURE\_ENV. The *pname* parameter can be either
GL\_TEXTURE\_ENV\_MODE or GL\_TEXTURE\_ENV\_COLOR. If *pname* is
GL\_TEXTURE\_ENV\_MODE, then *params* is (or points to) the symbolic
name of a texture function. Three texture functions are defined:
GL\_MODULATE, GL\_DECAL, and GL\_BLEND. A texture function acts on
the fragment to be textured using the texture image value that
applies to the fragment (see
[**glTexParameter**](gltexparameter-functions.md)) and produces an
RGBA color for that fragment. The following table shows how the RGBA
color is produced for each of the three texture functions that can be
chosen. *C* is a triple of color values (RGB) and *A* is the
associated alpha value. RGBA values extracted from a texture image
are in the range \[0, 1\]. The subscript *f* refers to the incoming
fragment, the subscript *t* to the texture image, the subscript *c*
to the texture environment color, and subscript *v* indicates a value
produced by the texture function. A texture image can have up to four
components per texture element (see
[**glTexImage1D**](glteximage1d.md) and
[**glTexImage2D**](glteximage2d.md)). In a one-component image, Lt
indicates that single component. A two-component image uses *L?* and
*A?* . A three-component image has only a color value, *C?* . A
four-component image has both a color value *C?* and an alpha value
*A?* .
This doc was truncated.


%index
glTexGend
Controls the generation of texture coordinates. | glTexGend function (Gl.h)
%group
Win32 opengl32
%prm
coord, pname, param2
coord : [int] A texture coordinate. Must be one of the following: GL\_S, GL\_T, GL\_R, or GL\_Q.
pname : [int] The symbolic name of the texture coordinate generation function.
param2 : [double] 
%inst
Controls the generation of texture coordinates. | glTexGend function
(Gl.h)

[戻り値]
This function does not return a value.

[備考]
The **glTexGen** function selects a texture-coordinate generation
function or supplies coefficients for one of the functions. The
*coord* parameter names one of the (s,t,r,q) texture coordinates, and
it must be one of these symbols: GL\_S, GL\_T, GL\_R, or GL\_Q. The
*pname* parameter must be one of three symbolic constants:
GL\_TEXTURE\_GEN\_MODE, GL\_OBJECT\_PLANE, or GL\_EYE\_PLANE. If
*pname* is GL\_TEXTURE\_GEN\_MODE, then *param* specifies a mode, one
of GL\_OBJECT\_LINEAR, GL\_EYE\_LINEAR, or GL\_SPHERE\_MAP. If
*pname* is either GL\_OBJECT\_PLANE or GL\_EYE\_PLANE, *param*
contains coefficients for the corresponding texture generation
function. If the texture generation function is GL\_OBJECT\_LINEAR,
the function ![Equation showing the glTexGen function when the
texture generation function is GL_OBJECT_LINEAR.](images/tex02.png)
is used, where g is the value computed for the coordinate named in
coord; p1, p2, p3, and p4 are the four values supplied in params; and
x?, y?, z?, and w? are the object coordinates of the vertex. You can
use this function to texture-map terrain by using sea level as a
reference plane (defined by p1, p2, p3, and p4). The
GL\_OBJECT\_LINEAR coordinate generation function computes the
altitude of a terrain vertex as its distance from sea level; that
altitude is used to index the texture image to map white snow onto
peaks and green grass onto foothills, for example. If the texture
generation function is GL\_EYE\_LINEAR, the function ![Equation
showing the glTexGen function when the texture generation function is
GL_EYE_LINEAR.](images/tex02.png) is used, where ![Equation showing
the eye coordinates of the vertex.](images/tex03.png) and x?, y?, z?,
and w? are the eye coordinates of the vertex, p1, p2, p3, and p4 are
the values supplied in *param*, and M is the modelview matrix when
you call **glTexGen**. If M is poorly conditioned or singular,
texture coordinates generated by the resulting function can be
inaccurate or undefined. The values in *param* define a reference
plane in eye coordinates. The modelview matrix that is applied to
them cannot be the same one in effect when the polygon vertices are
transformed. This function establishes a field of texture coordinates
that can produce dynamic contour lines on moving objects. If *pname*
is GL\_SPHERE\_MAP and *coord* is either GL\_S or GL\_T, s and t
texture coordinates are generated as follows. Let u be the unit
vector pointing from the origin to the polygon vertex (in eye
coordinates). Let n be the current normal, after transformation to
eye coordinates. Let f = (fx ( ) fy ( ) fz)T be the reflection vector
such that ![Equation showing the reflection vector as a function of
unit vector and current normal.](images/tex05.png) Finally, let
![Equation showing m as a function of reflection
vector.](images/tex07.png) Then the values assigned to the i and t
texture coordinates are ![Equation showing values assigned to the i
and t texture coordinates.](images/tex06.png) You can enable or
disable a texture-coordinate generation function by using
[**glEnable**](glenable.md) or [**glDisable**](gldisable.md) with one
of the symbolic texture-coordinate names (GL\_TEXTURE\_GEN\_S,
GL\_TEXTURE\_GEN\_T, GL\_TEXTURE\_GEN\_R, or GL\_TEXTURE\_GEN\_Q) as
the argument. When this function is enabled, the specified texture
coordinate is computed according to the generating function
associated with that coordinate. When the function is disabled,
subsequent vertices take the specified texture coordinate from the
current set of texture coordinates. Initially, all texture generation
functions are set to GL\_EYE\_LINEAR and are disabled. Both s plane
equations are (1,0,0,0); both t plane equations are (0,1,0,0); and
all r and q plane equations are (0,0,0,0). The following functions
retrieve information related to glTexGen:
[**glGetTexGen**](glgettexgen.md) [**glIsEnabled**](glisenabled.md)
with argument GL\_TEXTURE\_GEN\_S [**glIsEnabled**](glisenabled.md)
with argument GL\_TEXTURE\_GEN\_T [**glIsEnabled**](glisenabled.md)
with argument GL\_TEXTURE\_GEN\_R [**glIsEnabled**](glisenabled.md)
with argument GL\_TEXTURE\_GEN\_Q


%index
glTexGendv
Controls the generation of texture coordinates. | glTexGendv function (Gl.h)
%group
Win32 opengl32
%prm
coord, pname, params
coord : [int] A texture coordinate. Must be one of the following: GL\_S, GL\_T, GL\_R, or GL\_Q.
pname : [int] The symbolic name of the texture coordinate generation function.
params : [int] 
%inst
Controls the generation of texture coordinates. | glTexGendv function
(Gl.h)

[戻り値]
This function does not return a value.

[備考]
The **glTexGen** function selects a texture-coordinate generation
function or supplies coefficients for one of the functions. The
*coord* parameter names one of the (s,t,r,q) texture coordinates, and
it must be one of these symbols: GL\_S, GL\_T, GL\_R, or GL\_Q. The
*pname* parameter must be one of three symbolic constants:
GL\_TEXTURE\_GEN\_MODE, GL\_OBJECT\_PLANE, or GL\_EYE\_PLANE. If
*pname* is either GL\_OBJECT\_PLANE or GL\_EYE\_PLANE, *param*
contains coefficients for the corresponding texture generation
function. If the texture generation function is GL\_OBJECT\_LINEAR,
the function ![Equation showing the glTexGen function when the
texture generation function is GL_OBJECT_LINEAR.] is used, where g is
the value computed for the coordinate named in coord; p1, p2, p3, and
p4 are the four values supplied in params; and x?, y?, z?, and w? are
the object coordinates of the vertex. You can use this function to
texture-map terrain by using sea level as a reference plane (defined
by p1, p2, p3, and p4). The GL\_OBJECT\_LINEAR coordinate generation
function computes the altitude of a terrain vertex as its distance
from sea level; that altitude is used to index the texture image to
map white snow onto peaks and green grass onto foothills, for
example. If the texture generation function is GL\_EYE\_LINEAR, the
function ![Equation showing the glTexGen function when the texture
generation function is GL_EYE_LINEAR.] is used, where ![Equation
showing the eye coordinates of the vertex.](images/tex03.png) and x?,
y?, z?, and w? are the eye coordinates of the vertex, p1, p2, p3, and
p4 are the values supplied in *param*, and M is the modelview matrix
when you **callglTexGen**. If M is poorly conditioned or singular,
texture coordinates generated by the resulting function can be
inaccurate or undefined. Note that the values in *param* define a
reference plane in eye coordinates. The modelview matrix that is
applied to them may not be the same one in effect when the polygon
vertices are transformed. This function establishes a field of
texture coordinates that can produce dynamic contour lines on moving
objects. If *pname* is GL\_SPHERE\_MAP and *coord* is either GL\_S or
GL\_T, s and t texture coordinates are generated as follows. Let u be
the unit vector pointing from the origin to the polygon vertex (in
eye coordinates). Let n be the current normal, after transformation
to eye coordinates. Let f = (fx ( ) fy ( ) fz)T be the reflection
vector such that ![Equation showing the reflection vector as a
function of unit vector and current normal.](images/tex05.png)
Finally, let ![Equation showing m as a function of reflection
vector.](images/tex07.png) Then the values assigned to the i and t
texture coordinates are ![Equation showing values assigned to the i
and t texture coordinates.](images/tex06.png) You can enable or
disable a texture-coordinate generation function by using
[**glEnable**](glenable.md) or [**glDisable**](gldisable.md) with one
of the symbolic texture-coordinate names (GL\_TEXTURE\_GEN\_S,
GL\_TEXTURE\_GEN\_T, GL\_TEXTURE\_GEN\_R, or GL\_TEXTURE\_GEN\_Q) as
the argument. When this function is enabled, the specified texture
coordinate is computed according to the generating function
associated with that coordinate. When this function is disabled,
subsequent vertices take the specified texture coordinate from the
current set of texture coordinates. Initially, all texture generation
functions are set to GL\_EYE\_LINEAR and are disabled. Both s plane
equations are (1,0,0,0); both t plane equations are (0,1,0,0); and
all r and q plane equations are (0,0,0,0). The following functions
retrieve information related to glTexGen:
[**glGetTexGen**](glgettexgen.md) [**glIsEnabled**](glisenabled.md)
with argument GL\_TEXTURE\_GEN\_S [**glIsEnabled**](glisenabled.md)
with argument GL\_TEXTURE\_GEN\_T [**glIsEnabled**](glisenabled.md)
with argument GL\_TEXTURE\_GEN\_R [**glIsEnabled**](glisenabled.md)
with argument GL\_TEXTURE\_GEN\_Q


%index
glTexGenf
Controls the generation of texture coordinates. | glTexGenf function (Gl.h)
%group
Win32 opengl32
%prm
coord, pname, param2
coord : [int] A texture coordinate. Must be one of the following: GL\_S, GL\_T, GL\_R, or GL\_Q.
pname : [int] The symbolic name of the texture coordinate generation function.
param2 : [float] 
%inst
Controls the generation of texture coordinates. | glTexGenf function
(Gl.h)

[戻り値]
This function does not return a value.

[備考]
The **glTexGen** function selects a texture-coordinate generation
function or supplies coefficients for one of the functions. The
*coord* parameter names one of the (s,t,r,q) texture coordinates, and
it must be one of these symbols: GL\_S, GL\_T, GL\_R, or GL\_Q. The
*pname* parameter must be one of three symbolic constants:
GL\_TEXTURE\_GEN\_MODE, GL\_OBJECT\_PLANE, or GL\_EYE\_PLANE. If
*pname* is GL\_TEXTURE\_GEN\_MODE, then *param* specifies a mode, one
of GL\_OBJECT\_LINEAR, GL\_EYE\_LINEAR, or GL\_SPHERE\_MAP. If
*pname* is either GL\_OBJECT\_PLANE or GL\_EYE\_PLANE, *param*
contains coefficients for the corresponding texture generation
function. If the texture generation function is GL\_OBJECT\_LINEAR,
the function ![Equation showing the glTexGen function when the
texture generation function is GL_OBJECT_LINEAR.] is used, where g is
the value computed for the coordinate named in coord; p1, p2, p3, and
p4 are the four values supplied in params; and x?, y?, z?, and w? are
the object coordinates of the vertex. You can use this function to
texture-map terrain by using sea level as a reference plane (defined
by p1, p2, p3, and p4). The GL\_OBJECT\_LINEAR coordinate generation
function computes the altitude of a terrain vertex as its distance
from sea level; that altitude is used to index the texture image to
map white snow onto peaks and green grass onto foothills, for
example. If the texture generation function is GL\_EYE\_LINEAR, the
function ![Equation showing the glTexGen function when the texture
generation function is GL_EYE_LINEAR.] is used, where ![Equation
showing the eye coordinates of the vertex.](images/tex03.png) and x?,
y?, z?, and w? are the eye coordinates of the vertex, p1, p2, p3, and
p4 are the values supplied in *param*, and M is the modelview matrix
when you call **glTexGen**. If M is poorly conditioned or singular,
texture coordinates generated by the resulting function can be
inaccurate or undefined. Note that the values in *param* define a
reference plane in eye coordinates. The modelview matrix that is
applied to them may not be the same one in effect when the polygon
vertices are transformed. This function establishes a field of
texture coordinates that can produce dynamic contour lines on moving
objects. If *pname* is GL\_SPHERE\_MAP and *coord* is either GL\_S or
GL\_T, s and t texture coordinates are generated as follows. Let u be
the unit vector pointing from the origin to the polygon vertex (in
eye coordinates). Let n be the current normal, after transformation
to eye coordinates. Let f = (fx ( ) fy ( ) fz)T be the reflection
vector such that ![Equation showing the reflection vector as a
function of unit vector and current normal.](images/tex05.png)
Finally, let ![Equation showing m as a function of reflection
vector.](images/tex07.png) Then the values assigned to the i and t
texture coordinates are ![Equation showing values assigned to the i
and t texture coordinates.](images/tex06.png) You can enable or
disable a texture-coordinate generation function by using
[**glEnable**](glenable.md) or [**glDisable**](gldisable.md) with one
of the symbolic texture-coordinate names (GL\_TEXTURE\_GEN\_S,
GL\_TEXTURE\_GEN\_T, GL\_TEXTURE\_GEN\_R, or GL\_TEXTURE\_GEN\_Q) as
the argument. When this function is enabled, the specified texture
coordinate is computed according to the generating function
associated with that coordinate. When this function is disabled,
subsequent vertices take the specified texture coordinate from the
current set of texture coordinates. Initially, all texture generation
functions are set to GL\_EYE\_LINEAR and are disabled. Both s plane
equations are (1,0,0,0); both t plane equations are (0,1,0,0); and
all r and q plane equations are (0,0,0,0). The following functions
retrieve information related to glTexGen:
[**glGetTexGen**](glgettexgen.md) [**glIsEnabled**](glisenabled.md)
with argument GL\_TEXTURE\_GEN\_S [**glIsEnabled**](glisenabled.md)
with argument GL\_TEXTURE\_GEN\_T [**glIsEnabled**](glisenabled.md)
with argument GL\_TEXTURE\_GEN\_R [**glIsEnabled**](glisenabled.md)
with argument GL\_TEXTURE\_GEN\_Q


%index
glTexGenfv
Controls the generation of texture coordinates. | glTexGenfv function (Gl.h)
%group
Win32 opengl32
%prm
coord, pname, params
coord : [int] A texture coordinate. Must be one of the following: GL\_S, GL\_T, GL\_R, or GL\_Q.
pname : [int] The symbolic name of the texture coordinate generation function.
params : [int] 
%inst
Controls the generation of texture coordinates. | glTexGenfv function
(Gl.h)

[戻り値]
This function does not return a value.

[備考]
The **glTexGen** function selects a texture-coordinate generation
function or supplies coefficients for one of the functions. The
*coord* parameter names one of the (s,t,r,q) texture coordinates, and
it must be one of these symbols: GL\_S, GL\_T, GL\_R, or GL\_Q. The
*pname* parameter must be one of three symbolic constants:
GL\_TEXTURE\_GEN\_MODE, GL\_OBJECT\_PLANE, or GL\_EYE\_PLANE. If
*pname* is either GL\_OBJECT\_PLANE or GL\_EYE\_PLANE, *param*
contains coefficients for the corresponding texture generation
function. If the texture generation function is GL\_OBJECT\_LINEAR,
the function ![Equation showing the glTexGen function when the
texture generation function is GL_OBJECT_LINEAR.] is used, where g is
the value computed for the coordinate named in coord; p1, p2, p3, and
p4 are the four values supplied in params; and x?, y?, z?, and w? are
the object coordinates of the vertex. You can use this function to
texture-map terrain by using sea level as a reference plane (defined
by p1, p2, p3, and p4). The GL\_OBJECT\_LINEAR coordinate generation
function computes the altitude of a terrain vertex as its distance
from sea level; that altitude is used to index the texture image to
map white snow onto peaks and green grass onto foothills, for
example. If the texture generation function is GL\_EYE\_LINEAR, the
function ![Equation showing the glTexGen function when the texture
generation function is GL_EYE_LINEAR.] is used, where ![Equation
showing the eye coordinates of the vertex.](images/tex03.png) and x?,
y?, z?, and w? are the eye coordinates of the vertex, p1, p2, p3, and
p4 are the values supplied in *param*, and M is the modelview matrix
when you call **glTexGen**. If M is poorly conditioned or singular,
texture coordinates generated by the resulting function can be
inaccurate or undefined. Note that the values in *param* define a
reference plane in eye coordinates. The modelview matrix that is
applied to them may not be the same one in effect when the polygon
vertices are transformed. This function establishes a field of
texture coordinates that can produce dynamic contour lines on moving
objects. If *pname* is GL\_SPHERE\_MAP and *coord* is either GL\_S or
GL\_T, s and t texture coordinates are generated as follows. Let u be
the unit vector pointing from the origin to the polygon vertex (in
eye coordinates). Let n be the current normal, after transformation
to eye coordinates. Let f = (fx ( ) fy ( ) fz)T be the reflection
vector such that ![Equation showing the reflection vector as a
function of unit vector and current normal.](images/tex05.png)
Finally, let ![Equation showing m as a function of reflection
vector.](images/tex07.png) Then the values assigned to the i and t
texture coordinates are ![Equation showing values assigned to the i
and t texture coordinates.](images/tex06.png) You can enable or
disable a texture-coordinate generation function by using
[**glEnable**](glenable.md) or [**glDisable**](gldisable.md) with one
of the symbolic texture-coordinate names (GL\_TEXTURE\_GEN\_S,
GL\_TEXTURE\_GEN\_T, GL\_TEXTURE\_GEN\_R, or GL\_TEXTURE\_GEN\_Q) as
the argument. When this function is enabled, the specified texture
coordinate is computed according to the generating function
associated with that coordinate. When this function is disabled,
subsequent vertices take the specified texture coordinate from the
current set of texture coordinates. Initially, all texture generation
functions are set to GL\_EYE\_LINEAR and are disabled. Both s plane
equations are (1,0,0,0); both t plane equations are (0,1,0,0); and
all r and q plane equations are (0,0,0,0). The following functions
retrieve information related to glTexGen:
[**glGetTexGen**](glgettexgen.md) [**glIsEnabled**](glisenabled.md)
with argument GL\_TEXTURE\_GEN\_S [**glIsEnabled**](glisenabled.md)
with argument GL\_TEXTURE\_GEN\_T [**glIsEnabled**](glisenabled.md)
with argument GL\_TEXTURE\_GEN\_R [**glIsEnabled**](glisenabled.md)
with argument GL\_TEXTURE\_GEN\_Q


%index
glTexGeni
Controls the generation of texture coordinates. | glTexGeni function (Gl.h)
%group
Win32 opengl32
%prm
coord, pname, param2
coord : [int] A texture coordinate. Must be one of the following: GL\_S, GL\_T, GL\_R, or GL\_Q.
pname : [int] The symbolic name of the texture coordinate generation function.
param2 : [int] 
%inst
Controls the generation of texture coordinates. | glTexGeni function
(Gl.h)

[戻り値]
This function does not return a value.

[備考]
The **glTexGen** function selects a texture-coordinate generation
function or supplies coefficients for one of the functions. The
*coord* parameter names one of the (s,t,r,q) texture coordinates, and
it must be one of these symbols: GL\_S, GL\_T, GL\_R, or GL\_Q. The
*pname* parameter must be one of three symbolic constants:
GL\_TEXTURE\_GEN\_MODE, GL\_OBJECT\_PLANE, or GL\_EYE\_PLANE. If
*pname* is GL\_TEXTURE\_GEN\_MODE, then *param* specifies a mode, one
of GL\_OBJECT\_LINEAR, GL\_EYE\_LINEAR, or GL\_SPHERE\_MAP. If
*pname* is either GL\_OBJECT\_PLANE or GL\_EYE\_PLANE, *param*
contains coefficients for the corresponding texture generation
function. If the texture generation function is GL\_OBJECT\_LINEAR,
the function ![Equation showing the glTexGen function when the
texture generation function is GL_OBJECT_LINEAR.] is used, where g is
the value computed for the coordinate named in coord; p1, p2, p3, and
p4 are the four values supplied in params; and x?, y?, z?, and w? are
the object coordinates of the vertex. You can use this function to
texture-map terrain by using sea level as a reference plane (defined
by p1, p2, p3, and p4). The GL\_OBJECT\_LINEAR coordinate generation
function computes the altitude of a terrain vertex as its distance
from sea level; that altitude is used to index the texture image to
map white snow onto peaks and green grass onto foothills, for
example. If the texture generation function is GL\_EYE\_LINEAR, the
function ![Equation showing the glTexGen function when the texture
generation function is GL_EYE_LINEAR.] is used, where ![Equation
showing the eye coordinates of the vertex.](images/tex03.png) and x?,
y?, z?, and w? are the eye coordinates of the vertex, p1, p2, p3, and
p4 are the values supplied in *param*, and M is the modelview matrix
when you call **glTexGen**. If M is poorly conditioned or singular,
texture coordinates generated by the resulting function can be
inaccurate or undefined. Note that the values in *param* define a
reference plane in eye coordinates. The modelview matrix that is
applied to them may not be the same one in effect when the polygon
vertices are transformed. This function establishes a field of
texture coordinates that can produce dynamic contour lines on moving
objects. If *pname* is GL\_SPHERE\_MAP and *coord* is either GL\_S or
GL\_T, s and t texture coordinates are generated as follows. Let u be
the unit vector pointing from the origin to the polygon vertex (in
eye coordinates). Let n be the current normal, after transformation
to eye coordinates. Let f = (fx ( ) fy ( ) fz)T be the reflection
vector such that ![Equation showing the reflection vector as a
function of unit vector and current normal.](images/tex05.png)
Finally, let ![Equation showing m as a function of reflection
vector.](images/tex07.png) Then the values assigned to the i and t
texture coordinates are ![Equation showing values assigned to the i
and t texture coordinates.](images/tex06.png) You can enable or
disable a texture-coordinate generation function by using
[**glEnable**](glenable.md) or [**glDisable**](gldisable.md) with one
of the symbolic texture-coordinate names (GL\_TEXTURE\_GEN\_S,
GL\_TEXTURE\_GEN\_T, GL\_TEXTURE\_GEN\_R, or GL\_TEXTURE\_GEN\_Q) as
the argument. When this function is enabled, the specified texture
coordinate is computed according to the generating function
associated with that coordinate. When this function is disabled,
subsequent vertices take the specified texture coordinate from the
current set of texture coordinates. Initially, all texture generation
functions are set to GL\_EYE\_LINEAR and are disabled. Both s plane
equations are (1,0,0,0); both t plane equations are (0,1,0,0); and
all r and q plane equations are (0,0,0,0). The following functions
retrieve information related to glTexGen:
[**glGetTexGen**](glgettexgen.md) [**glIsEnabled**](glisenabled.md)
with argument GL\_TEXTURE\_GEN\_S [**glIsEnabled**](glisenabled.md)
with argument GL\_TEXTURE\_GEN\_T [**glIsEnabled**](glisenabled.md)
with argument GL\_TEXTURE\_GEN\_R [**glIsEnabled**](glisenabled.md)
with argument GL\_TEXTURE\_GEN\_Q


%index
glTexGeniv
Controls the generation of texture coordinates. | glTexGeniv function (Gl.h)
%group
Win32 opengl32
%prm
coord, pname, params
coord : [int] A texture coordinate. Must be one of the following: GL\_S, GL\_T, GL\_R, or GL\_Q.
pname : [int] The symbolic name of the texture coordinate generation function.
params : [int] 
%inst
Controls the generation of texture coordinates. | glTexGeniv function
(Gl.h)

[戻り値]
This function does not return a value.

[備考]
The **glTexGen** function selects a texture-coordinate generation
function or supplies coefficients for one of the functions. The
*coord* parameter names one of the (s,t,r,q) texture coordinates, and
it must be one of these symbols: GL\_S, GL\_T, GL\_R, or GL\_Q. The
*pname* parameter must be one of three symbolic constants:
GL\_TEXTURE\_GEN\_MODE, GL\_OBJECT\_PLANE, or GL\_EYE\_PLANE. If
*pname* is either GL\_OBJECT\_PLANE or GL\_EYE\_PLANE, *param*
contains coefficients for the corresponding texture generation
function. If the texture generation function is GL\_OBJECT\_LINEAR,
the function ![Equation showing the glTexGen function when the
texture generation function is GL_OBJECT_LINEAR.] is used, where g is
the value computed for the coordinate named in coord; p1, p2, p3, and
p4 are the four values supplied in params; and x?, y?, z?, and w? are
the object coordinates of the vertex. You can use this function to
texture-map terrain by using sea level as a reference plane (defined
by p1, p2, p3, and p4). The GL\_OBJECT\_LINEAR coordinate generation
function computes the altitude of a terrain vertex as its distance
from sea level; that altitude is used to index the texture image to
map white snow onto peaks and green grass onto foothills, for
example. If the texture generation function is GL\_EYE\_LINEAR, the
function ![Equation showing the glTexGen function when the texture
generation function is GL_EYE_LINEAR.] is used, where ![Equation
showing the eye coordinates of the vertex.](images/tex03.png) and x?,
y?, z?, and w? are the eye coordinates of the vertex, p1, p2, p3, and
p4 are the values supplied in *param*, and M is the modelview matrix
when you call **glTexGen**. If M is poorly conditioned or singular,
texture coordinates generated by the resulting function can be
inaccurate or undefined. Note that the values in *param* define a
reference plane in eye coordinates. The modelview matrix that is
applied to them may not be the same one in effect when the polygon
vertices are transformed. This function establishes a field of
texture coordinates that can produce dynamic contour lines on moving
objects. If *pname* is GL\_SPHERE\_MAP and *coord* is either GL\_S or
GL\_T, s and t texture coordinates are generated as follows. Let u be
the unit vector pointing from the origin to the polygon vertex (in
eye coordinates). Let n be the current normal, after transformation
to eye coordinates. Let f = (fx ( ) fy ( ) fz)T be the reflection
vector such that ![Equation showing the reflection vector as a
function of unit vector and current normal.](images/tex05.png)
Finally, let ![Equation showing m as a function of reflection
vector.](images/tex07.png) Then the values assigned to the i and t
texture coordinates are ![Equation showing values assigned to the i
and t texture coordinates.](images/tex06.png) You can enable or
disable a texture-coordinate generation function by using
[**glEnable**](glenable.md) or [**glDisable**](gldisable.md) with one
of the symbolic texture-coordinate names (GL\_TEXTURE\_GEN\_S,
GL\_TEXTURE\_GEN\_T, GL\_TEXTURE\_GEN\_R, or GL\_TEXTURE\_GEN\_Q) as
the argument. When this function is enabled, the specified texture
coordinate is computed according to the generating function
associated with that coordinate. When this function is disabled,
subsequent vertices take the specified texture coordinate from the
current set of texture coordinates. Initially, all texture generation
functions are set to GL\_EYE\_LINEAR and are disabled. Both s plane
equations are (1,0,0,0); both t plane equations are (0,1,0,0); and
all r and q plane equations are (0,0,0,0). The following functions
retrieve information related to glTexGen:
[**glGetTexGen**](glgettexgen.md) [**glIsEnabled**](glisenabled.md)
with argument GL\_TEXTURE\_GEN\_S [**glIsEnabled**](glisenabled.md)
with argument GL\_TEXTURE\_GEN\_T [**glIsEnabled**](glisenabled.md)
with argument GL\_TEXTURE\_GEN\_R [**glIsEnabled**](glisenabled.md)
with argument GL\_TEXTURE\_GEN\_Q


%index
glTexImage1D
The glTexImage1D function specifies a one-dimensional texture image.
%group
Win32 opengl32
%prm
target, level, internalformat, width, border, format, type, pixels
target : [int] The target texture. Must be GL\_TEXTURE\_1D.
level : [int] The level-of-detail number. Level 0 is the base image level. Level *n* is the *n*Th mipmap reduction image.
internalformat : [int] Specifies the number of color components in the texture. Must be 1, 2, 3, or 4, or one of the following symbolic constants: GL\_ALPHA, GL\_ALPHA4, GL\_ALPHA8, GL\_ALPHA12, GL\_ALPHA16, GL\_LUMINANCE, GL\_LUMINANCE4, GL\_LUMINANCE8, GL\_LUMINANCE12, GL\_LUMINANCE16, GL\_LUMINANCE\_ALPHA, GL\_LUMINANCE4\_ALPHA4, GL\_LUMINANCE6\_ALPHA2, GL\_LUMINANCE8\_ALPHA8, GL\_LUMINANCE12\_ALPHA4, GL\_LUMINANCE12\_ALPHA12, GL\_LUMINANCE16\_ALPHA16, GL\_INTENSITY, GL\_INTENSITY4, GL\_INTENSITY8, GL\_INTENSITY12, GL\_INTENSITY16, GL\_RGB, GL\_R3\_G3\_B2, GL\_RGB4, GL\_RGB5, GL\_RGB8, GL\_RGB10, GL\_RGB12, GL\_RGB16, GL\_RGBA, GL\_RGBA2, GL\_RGBA4, GL\_RGB5\_A1, GL\_RGBA8, GL\_RGB10\_A2, GL\_RGBA12, or GL\_RGBA16.
width : [int] The width of the texture image. Must be 2*n* + 2( *border* ) for some integer *n*. The height of the texture image is 1.
border : [int] The width of the border. Must be either 0 or 1.
format : [int] The format of the pixel data. It can assume one of nine symbolic values.
type : [int] The data type of the pixel data. The following symbolic values are accepted: GL\_UNSIGNED\_BYTE, GL\_BYTE, GL\_BITMAP, GL\_UNSIGNED\_SHORT, GL\_SHORT, GL\_UNSIGNED\_INT, GL\_INT, and GL\_FLOAT.
pixels : [intptr] A pointer to the image data in memory.
%inst
The glTexImage1D function specifies a one-dimensional texture image.

[戻り値]
This function does not return a value.

[備考]
The **glTexImage1D** function specifies a one-dimensional texture
image. Texturing maps a portion of a specified *texture image* onto
each graphical primitive for which texturing is enabled.
One-dimensional texturing is enabled and disabled using
[**glEnable**](glenable.md) and **glDisable** with argument
GL\_TEXTURE\_1D. Texture images are defined with **glTexImage1D**.
The arguments describe the parameters of the texture image, such as
width, width of the border, level-of-detail number (see
[**glTexParameter**](gltexparameter-functions.md)), and number of
color components provided. The last three arguments describe the way
the image is represented in memory. These arguments are identical to
the pixel formats used for [**glDrawPixels**](gldrawpixels.md). Data
is read from *pixels* as a sequence of signed or unsigned bytes,
shorts or longs, or single-precision floating-point values, depending
on *type*. These values are grouped into sets of one, two, three, or
four values, depending on *format*, to form elements. If *type* is
GL\_BITMAP, the data is considered as a string of unsigned bytes (and
*format* must be GL\_COLOR\_INDEX). Each data byte is treated as
eight 1-bit elements, with bit ordering determined by
GL\_UNPACK\_LSB\_FIRST (see
[**glPixelStore**](glpixelstore-functions.md)). A texture image can
have up to four components per texture element, depending on
*components*. A one-component texture image uses only the red
component of the RGBA color extracted from *pixels*. A two-component
image uses the R and A values. A three-component image uses the R, G,
and B values. A four-component image uses all of the RGBA components.
Texturing has no effect in color-index mode. The texture image can be
represented by the same data formats as the pixels in a
[**glDrawPixels**](gldrawpixels.md) command, except that
GL\_STENCIL\_INDEX and GL\_DEPTH\_COMPONENT cannot be used. The
[**glPixelStore**](glpixelstore-functions.md) and
[**glPixelTransfer**](glpixeltransfer.md) modes affect texture images
in exactly the way they affect **glDrawPixels**. A texture image with
zero width indicates the null texture. If the null texture is
specified for level-of-detail 0, it is as if texturing were disabled.
The following functions retrieve information related to
**glTexImageID**: [**glGetTexImage**](glgetteximage.md)
[**glIsEnabled**](glisenabled.md) with argument GL\_TEXTURE\_1D


%index
glTexImage2D
The glTexImage2D function specifies a two-dimensional texture image.
%group
Win32 opengl32
%prm
target, level, internalformat, width, height, border, format, type, pixels
target : [int] The target texture. Must be GL\_TEXTURE\_2D.
level : [int] The level-of-detail number. Level 0 is the base image level. Level *n* is the *n* th mipmap reduction image.
internalformat : [int] The number of color components in the texture. Must be 1, 2, 3, or 4, or one of the following symbolic constants: GL\_ALPHA, GL\_ALPHA4, GL\_ALPHA8, GL\_ALPHA12, GL\_ALPHA16, GL\_LUMINANCE, GL\_LUMINANCE4, GL\_LUMINANCE8, GL\_LUMINANCE12, GL\_LUMINANCE16, GL\_LUMINANCE\_ALPHA, GL\_LUMINANCE4\_ALPHA4, GL\_LUMINANCE6\_ALPHA2, GL\_LUMINANCE8\_ALPHA8, GL\_LUMINANCE12\_ALPHA4, GL\_LUMINANCE12\_ALPHA12, GL\_LUMINANCE16\_ALPHA16, GL\_INTENSITY, GL\_INTENSITY4, GL\_INTENSITY8, GL\_INTENSITY12, GL\_INTENSITY16, GL\_R3\_G3\_B2, GL\_RGB, GL\_RGB4, GL\_RGB5, GL\_RGB8, GL\_RGB10, GL\_RGB12, GL\_RGB16, GL\_RGBA, GL\_RGBA2, GL\_RGBA4, GL\_RGB5\_A1, GL\_RGBA8, GL\_RGB10\_A2, GL\_RGBA12, or GL\_RGBA16.
width : [int] The width of the texture image. Must be 2*n* + 2(*border*) for some integer *n*.
height : [int] The height of the texture image. Must be 2*m* + 2(*border*) for some integer *m*.
border : [int] The width of the border. Must be either 0 or 1.
format : [int] The format of the pixel data. It can assume one of nine symbolic values.
type : [int] The data type of the pixel data. The following symbolic values are accepted: GL\_UNSIGNED\_BYTE, GL\_BYTE, GL\_BITMAP, GL\_UNSIGNED\_SHORT, GL\_SHORT, GL\_UNSIGNED\_INT, GL\_INT, and GL\_FLOAT.
pixels : [intptr] A pointer to the image data in memory.
%inst
The glTexImage2D function specifies a two-dimensional texture image.

[戻り値]
This function does not return a value.

[備考]
The **glTexImage2D** function specifies a two-dimensional texture
image. Texturing maps a portion of a specified *texture image* onto
each graphical primitive for which texturing is enabled.
Two-dimensional texturing is enabled and disabled using
[**glEnable**](glenable.md) and **glDisable** with argument
GL\_TEXTURE\_2D. Texture images are defined with **glTexImage2D**.
The arguments describe the parameters of the texture image, such as
height, width, width of the border, level-of-detail number (see
[**glTexParameter**](gltexparameter-functions.md)), and number of
color components provided. The last three arguments describe the way
the image is represented in memory. These arguments are identical to
the pixel formats used for [**glDrawPixels**](gldrawpixels.md). Data
is read from *pixels* as a sequence of signed or unsigned bytes,
shorts or longs, or single-precision floating-point values, depending
on *type*. These values are grouped into sets of one, two, three, or
four values, depending on *format*, to form elements. If *type* is
GL\_BITMAP, the data is considered as a string of unsigned bytes (and
*format* must be GL\_COLOR\_INDEX). Each data byte is treated as
eight 1-bit elements, with bit ordering determined by
GL\_UNPACK\_LSB\_FIRST (see
[**glPixelStore**](glpixelstore-functions.md)). Please see
[**glDrawPixels**](gldrawpixels.md) for a description of the
acceptable values for the *type* parameter. A texture image can have
up to four components per texture element, depending on *components*.
A one-component texture image uses only the red component of the RGBA
color extracted from *pixels*. A two-component image uses the R and A
values. A three-component image uses the R, G, and B values. A
four-component image uses all of the RGBA components. Texturing has
no effect in color-index mode. The texture image can be represented
by the same data formats as the pixels in a **glDrawPixels** command,
except that GL\_STENCIL\_INDEX and GL\_DEPTH\_COMPONENT cannot be
used. The [**glPixelStore**](glpixelstore-functions.md) and
[**glPixelTransfer**](glpixeltransfer.md) modes affect texture images
in exactly the way they affect **glDrawPixels**. A texture image with
zero height or width indicates the null texture. If the null texture
is specified for level-of-detail 0, it is as if texturing were
disabled. The following functions retrieve information related to
**glTexImage2D**: [**glGetTexImage**](glgetteximage.md)
[**glIsEnabled**](glisenabled.md) with argument GL\_TEXTURE\_2D


%index
glTexParameterf
Sets texture parameters. | glTexParameterf function (Gl.h)
%group
Win32 opengl32
%prm
target, pname, param2
target : [int] The target texture, which must be either GL\_TEXTURE\_1D or GL\_TEXTURE\_2D.
pname : [int] The symbolic name of a single valued texture parameter. The following symbols are accepted in *pname*.
param2 : [float] 
%inst
Sets texture parameters. | glTexParameterf function (Gl.h)

[戻り値]
This function does not return a value.

[備考]
Texture mapping is a technique that applies an image onto an object's
surface as if the image were a decal or cellophane shrink-wrap. The
image is created in texture space, with an (*s*, *t*) coordinate
system. A texture is a one- or two-dimensional image and a set of
parameters that determine how samples are derived from the image. The
**glTexParameter** function assigns the value or values in params to
the texture parameter specified as pname. The target parameter
defines the target texture, either GL\_TEXTURE\_1D or
GL\_TEXTURE\_2D. As more texture elements are sampled in the
minification process, fewer aliasing artifacts will be apparent.
While the GL\_NEAREST and GL\_LINEAR minification functions can be
faster than the other four, they sample only one or four texture
elements to determine the texture value of the pixel being rendered
and can produce moire patterns or ragged transitions. The default
value of GL\_TEXTURE\_MIN\_FILTER is GL\_NEAREST\_MIPMAP\_LINEAR.
Suppose that texturing is enabled (by calling
[**glEnable**](glenable.md) with argument GL\_TEXTURE\_1D or
GL\_TEXTURE\_2D) and GL\_TEXTURE\_MIN\_FILTER is set to one of the
functions that requires a mipmap. If either the dimensions of the
texture images currently defined (with previous calls to
[**glTexImage1D**](glteximage1d.md) or
[**glTexImage2D**](glteximage2d.md)) do not follow the proper
sequence for mipmaps, or there are fewer texture images defined than
are needed, or the set of texture images have differing numbers of
texture components, then it is as if texture mapping were disabled.
Linear filtering accesses the four nearest texture elements only in
2-D textures. In 1-D textures, linear filtering accesses the two
nearest texture elements. The following function retrieves
information related to **glTexParameterf**, **glTexParameteri**,
**glTexParameterfv**, and **glTexParameteriv**.


%index
glTexParameterfv
Sets texture parameters. | glTexParameterfv function (Gl.h)
%group
Win32 opengl32
%prm
target, pname, params
target : [int] The target texture, which must be either GL\_TEXTURE\_1D or GL\_TEXTURE\_2D.
pname : [int] The symbolic name of a single valued texture parameter. The following symbols are accepted in *pname*.
params : [int] 
%inst
Sets texture parameters. | glTexParameterfv function (Gl.h)

[戻り値]
This function does not return a value.

[備考]
Texture mapping is a technique that applies an image onto an object's
surface as if the image were a decal or cellophane shrink-wrap. The
image is created in texture space, with an (*s*, *t*) coordinate
system. A texture is a one- or two-dimensional image and a set of
parameters that determine how samples are derived from the image. The
**glTexParameter** function assigns the value or values in params to
the texture parameter specified as pname. The target parameter
defines the target texture, either GL\_TEXTURE\_1D or
GL\_TEXTURE\_2D. As more texture elements are sampled in the
minification process, fewer aliasing artifacts will be apparent.
While the GL\_NEAREST and GL\_LINEAR minification functions can be
faster than the other four, they sample only one or four texture
elements to determine the texture value of the pixel being rendered
and can produce moire patterns or ragged transitions. The default
value of GL\_TEXTURE\_MIN\_FILTER is GL\_NEAREST\_MIPMAP\_LINEAR.
Suppose that texturing is enabled (by calling
[**glEnable**](glenable.md) with argument GL\_TEXTURE\_1D or
GL\_TEXTURE\_2D) and GL\_TEXTURE\_MIN\_FILTER is set to one of the
functions that requires a mipmap. If either the dimensions of the
texture images currently defined (with previous calls to
[**glTexImage1D**](glteximage1d.md) or
[**glTexImage2D**](glteximage2d.md)) do not follow the proper
sequence for mipmaps, or there are fewer texture images defined than
are needed, or the set of texture images have differing numbers of
texture components, then it is as if texture mapping were disabled.
Linear filtering accesses the four nearest texture elements only in
2-D textures. In 1-D textures, linear filtering accesses the two
nearest texture elements. The following function retrieves
information related to **glTexParameterf**, **glTexParameteri**,
**glTexParameterfv**, and **glTexParameteriv**:
[**glGetTexParameter**](glgettexparameter.md)


%index
glTexParameteri
Sets texture parameters. | glTexParameteri function (Gl.h)
%group
Win32 opengl32
%prm
target, pname, param2
target : [int] The target texture, which must be either GL\_TEXTURE\_1D or GL\_TEXTURE\_2D.
pname : [int] The symbolic name of a single valued texture parameter. The following symbols are accepted in *pname*.
param2 : [int] 
%inst
Sets texture parameters. | glTexParameteri function (Gl.h)

[戻り値]
This function does not return a value.

[備考]
Texture mapping is a technique that applies an image onto an object's
surface as if the image were a decal or cellophane shrink-wrap. The
image is created in texture space, with an (*s*, *t*) coordinate
system. A texture is a one- or two-dimensional image and a set of
parameters that determine how samples are derived from the image. The
**glTexParameter** function assigns the value or values in params to
the texture parameter specified as pname. The target parameter
defines the target texture, either GL\_TEXTURE\_1D or
GL\_TEXTURE\_2D. As more texture elements are sampled in the
minification process, fewer aliasing artifacts will be apparent.
While the GL\_NEAREST and GL\_LINEAR minification functions can be
faster than the other four, they sample only one or four texture
elements to determine the texture value of the pixel being rendered
and can produce moire patterns or ragged transitions. The default
value of GL\_TEXTURE\_MIN\_FILTER is GL\_NEAREST\_MIPMAP\_LINEAR.
Suppose that texturing is enabled (by calling
[**glEnable**](glenable.md) with argument GL\_TEXTURE\_1D or
GL\_TEXTURE\_2D) and GL\_TEXTURE\_MIN\_FILTER is set to one of the
functions that requires a mipmap. If either the dimensions of the
texture images currently defined (with previous calls to
[**glTexImage1D**](glteximage1d.md) or
[**glTexImage2D**](glteximage2d.md)) do not follow the proper
sequence for mipmaps, or there are fewer texture images defined than
are needed, or the set of texture images have differing numbers of
texture components, then it is as if texture mapping were disabled.
Linear filtering accesses the four nearest texture elements only in
2-D textures. In 1-D textures, linear filtering accesses the two
nearest texture elements. The following function retrieves
information related to **glTexParameterf**, **glTexParameteri**,
**glTexParameterfv**, and **glTexParameteriv**:
[**glGetTexParameter**](glgettexparameter.md)


%index
glTexParameteriv
Sets texture parameters. | glTexParameteriv function (Gl.h)
%group
Win32 opengl32
%prm
target, pname, params
target : [int] The target texture, which must be either GL\_TEXTURE\_1D or GL\_TEXTURE\_2D.
pname : [int] The symbolic name of a single valued texture parameter. The following symbols are accepted in *pname*.
params : [int] 
%inst
Sets texture parameters. | glTexParameteriv function (Gl.h)

[戻り値]
This function does not return a value.

[備考]
Texture mapping is a technique that applies an image onto an object's
surface as if the image were a decal or cellophane shrink-wrap. The
image is created in texture space, with an (*s*, *t*) coordinate
system. A texture is a one- or two-dimensional image and a set of
parameters that determine how samples are derived from the image. The
**glTexParameter** function assigns the value or values in params to
the texture parameter specified as pname. The target parameter
defines the target texture, either GL\_TEXTURE\_1D or
GL\_TEXTURE\_2D. As more texture elements are sampled in the
minification process, fewer aliasing artifacts will be apparent.
While the GL\_NEAREST and GL\_LINEAR minification functions can be
faster than the other four, they sample only one or four texture
elements to determine the texture value of the pixel being rendered
and can produce moire patterns or ragged transitions. The default
value of GL\_TEXTURE\_MIN\_FILTER is GL\_NEAREST\_MIPMAP\_LINEAR.
Suppose that texturing is enabled (by calling
[**glEnable**](glenable.md) with argument GL\_TEXTURE\_1D or
GL\_TEXTURE\_2D) and GL\_TEXTURE\_MIN\_FILTER is set to one of the
functions that requires a mipmap. If either the dimensions of the
texture images currently defined (with previous calls to
[**glTexImage1D**](glteximage1d.md) or
[**glTexImage2D**](glteximage2d.md)) do not follow the proper
sequence for mipmaps, or there are fewer texture images defined than
are needed, or the set of texture images have differing numbers of
texture components, then it is as if texture mapping were disabled.
Linear filtering accesses the four nearest texture elements only in
2-D textures. In 1-D textures, linear filtering accesses the two
nearest texture elements. The following function retrieves
information related to **glTexParameterf**, **glTexParameteri**,
**glTexParameterfv**, and **glTexParameteriv**:
[**glGetTexParameter**](glgettexparameter.md)


%index
glTexSubImage1D
The glTexSubImage1D function specifies a portion of an existing one-dimensional texture image. You cannot define a new texture with glTexSubImage1D.
%group
Win32 opengl32
%prm
target, level, xoffset, width, format, type, pixels
target : [int] The target texture. Must be GL\_TEXTURE\_1D.
level : [int] The level-of-detail number. Level 0 is the base image. Level *n* is the *n*th mipmap reduction image.
xoffset : [int] A texel offset in the *x* direction within the texture array.
width : [int] The width of the texture sub-image.
format : [int] The format of the pixel data. This parameter can assume one of the following symbolic values.
type : [int] The data type of the pixel data. The following symbolic values are accepted: GL\_UNSIGNED\_BYTE, GL\_BYTE, GL\_BITMAP, GL\_UNSIGNED\_SHORT, GL\_SHORT, GL\_UNSIGNED\_INT, GL\_INT, and GL\_FLOAT.
pixels : [intptr] A pointer to the image data in memory.
%inst
The glTexSubImage1D function specifies a portion of an existing
one-dimensional texture image. You cannot define a new texture with
glTexSubImage1D.

[戻り値]
This function does not return a value.

[備考]
One-dimensional texturing for a primitive is enabled using
[**glEnable**](glenable.md) and **glDisable** with the argument
GL\_TEXTURE\_1D. During texturing, part of a specified texture image
is mapped into each enabled primitive. You use the
**glTexSubImage1D** function to specify a contiguous sub-image of an
existing one-dimensional texture image for texturing. The texels
referenced by *pixels* replace a region of the existing texture array
with *x* indexes of *xoffset* and *xoffset* + (*width* 1) inclusive.
This region cannot include any texels outside the range of the
originally specified texture array. Specifying a sub-image with a
*width* of zero has no effect and does not generate an error.
Texturing has no effect in color-index mode. In general, texture
images can be represented by the same data formats as the pixels in a
[**glDrawPixels**](gldrawpixels.md) command, except that
GL\_STENCIL\_INDEX and GL\_DEPTH\_COMPONENT cannot be used. The
[**glPixelStore**](glpixelstore-functions.md) and
[**glPixelTransfer**](glpixeltransfer.md) modes affect texture images
in exactly the way they affect **glDrawPixels**. The following
functions retrieve information related to **glTexSubImage1D**:
[**glGetTexImage**](glgetteximage.md)
[**glIsEnabled**](glisenabled.md) with argument GL\_TEXTURE\_1D


%index
glTexSubImage2D
The glTexSubImage2D function specifies a portion of an existing one-dimensional texture image. You cannot define a new texture with glTexSubImage2D.
%group
Win32 opengl32
%prm
target, level, xoffset, yoffset, width, height, format, type, pixels
target : [int] The target texture. Must be GL\_TEXTURE\_2D.
level : [int] The level-of-detail number. Level 0 is the base image. Level *n* is the *n*th mipmap reduction image.
xoffset : [int] A texel offset in the *x* direction within the texture array.
yoffset : [int] A texel offset in the *y* direction within the texture array.
width : [int] The width of the texture sub-image.
height : [int] The height of the texture sub-image.
format : [int] The format of the pixel data. It can assume one of the following symbolic values.
type : [int] The data type of the pixel data. The following symbolic values are accepted: GL\_UNSIGNED\_BYTE, GL\_BYTE, GL\_BITMAP, GL\_UNSIGNED\_SHORT, GL\_SHORT, GL\_UNSIGNED\_INT, GL\_INT, and GL\_FLOAT.
pixels : [intptr] A pointer to the image data in memory.
%inst
The glTexSubImage2D function specifies a portion of an existing
one-dimensional texture image. You cannot define a new texture with
glTexSubImage2D.

[戻り値]
This function does not return a value.

[備考]
Two-dimensional texturing for a primitive is enabled using
[**glEnable**](glenable.md) and **glDisable** with the argument
GL\_TEXTURE\_2D. During texturing, part of a specified texture image
is mapped into each enabled primitive. You use the
**glTexSubImage2D** function to specify a contiguous sub-image of an
existing two-dimensional texture image for texturing. The texels
referenced by *pixels* replace a region of the existing texture array
with *x* indexes of *xoffset* and *xoffset* + (*width* 1) inclusive
and *y* indexes of *yoffset* and *yoffset* + (*height* 1) inclusive.
This region cannot include any texels outside the range of the
originally specified texture array. Specifying a sub-image with a
*width* of zero has no effect and does not generate an error.
Texturing has no effect in color-index mode. In general, texture
images can be represented by the same data formats as the pixels in a
[**glDrawPixels**](gldrawpixels.md) command, except that
GL\_STENCIL\_INDEX and GL\_DEPTH\_COMPONENT cannot be used. The
[**glPixelStore**](glpixelstore-functions.md) and
[**glPixelTransfer**](glpixeltransfer.md) modes affect texture images
in exactly the way they affect **glDrawPixels**. The following
functions retrieve information related to **glTexSubImage2D**:
[**glGetTexImage**](glgetteximage.md)
[**glIsEnabled**](glisenabled.md) with argument GL\_TEXTURE\_2D


%index
glTranslated
The glTranslated function multiplies the current matrix by a translation matrix.
%group
Win32 opengl32
%prm
x, y, z
x : [double] The *x* coordinate of a translation vector.
y : [double] The *y* coordinate of a translation vector.
z : [double] The *z* coordinate of a translation vector.
%inst
The glTranslated function multiplies the current matrix by a
translation matrix.

[戻り値]
This function does not return a value.

[備考]
The **glTranslated** function produces the translation specified by
(*x*, *y*, *z*). The translation vector is used to compute a 4x4
translation matrix: ![Diagram showing the 4x4 translation matrix
specified by x, y, z.](images/trans01.png) The current matrix (see
[**glMatrixMode**](glmatrixmode.md)) is multiplied by this
translation matrix, with the product replacing the current matrix.
That is, if M is the current matrix and T is the translation matrix,
then M is replaced with M T. If the matrix mode is either
GL\_MODELVIEW or GL\_PROJECTION, all objects drawn after
**glTranslated** is called are translated. Use
[**glPushMatrix**](glpushmatrix.md) and **glPopMatrix** to save and
restore the untranslated coordinate system. The following functions
retrieve information related to [**glTranslated**](gltranslate.md):
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_MATRIX\_MODE **glGet** with argument
GL\_MODELVIEW\_MATRIX **glGet** with argument GL\_PROJECTION\_MATRIX
**glGet** with argument GL\_TEXTURE\_MATRIX


%index
glTranslatef
The glTranslatef function multiplies the current matrix by a translation matrix.
%group
Win32 opengl32
%prm
x, y, z
x : [float] The *x* coordinate of a translation vector.
y : [float] The *y* coordinate of a translation vector.
z : [float] The *z* coordinate of a translation vector.
%inst
The glTranslatef function multiplies the current matrix by a
translation matrix.

[戻り値]
This function does not return a value.

[備考]
The **glTranslatef** function produces the translation specified by
(*x*, *y*, *z*). The translation vector is used to compute a 4x4
translation matrix: ![Diagram showing the 4x4 translation matrix
specified by x, y, z.](images/trans01.png) The current matrix (see
[**glMatrixMode**](glmatrixmode.md)) is multiplied by this
translation matrix, with the product replacing the current matrix.
That is, if M is the current matrix and T is the translation matrix,
then M is replaced with M T. If the matrix mode is either
GL\_MODELVIEW or GL\_PROJECTION, all objects drawn after
**glTranslatef** is called are translated. Use
[**glPushMatrix**](glpushmatrix.md) and **glPopMatrix** to save and
restore the untranslated coordinate system. The following functions
retrieve information related to [**glTranslated**](gltranslate.md)
and **glTranslatef**:
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_MATRIX\_MODE **glGet** with argument
GL\_MODELVIEW\_MATRIX **glGet** with argument GL\_PROJECTION\_MATRIX
**glGet** with argument GL\_TEXTURE\_MATRIX


%index
glVertex2d
Specifies a vertex. | glVertex2d function (Gl.h)
%group
Win32 opengl32
%prm
x, y
x : [double] Specifies the x-coordinate of a vertex.
y : [double] Specifies the y-coordinate of a vertex.
%inst
Specifies a vertex. | glVertex2d function (Gl.h)

[戻り値]
This function does not return a value.

[備考]
The glVertex function commands are used within
[**glBegin**](glbegin.md)/[**glEnd**](glend.md) pairs to specify
point, line, and polygon vertices. The current color, normal, and
texture coordinates are associated with the vertex when glVertex is
called. When only *x* and *y* are specified, *z* defaults to 0.0 and
*w* defaults to 1.0. When *x*, *y*, and *z* are specified, *w*
defaults to 1.0. Invoking glVertex outside of a **glBegin**/**glEnd**
pair results in undefined behavior.


%index
glVertex2dv
Specifies a vertex. | glVertex2dv function (Gl.h)
%group
Win32 opengl32
%prm
v
v : [var] A pointer to an array of two elements. The elements are the x and y coordinates of a vertex.
%inst
Specifies a vertex. | glVertex2dv function (Gl.h)

[戻り値]
This function does not return a value.


%index
glVertex2f
Specifies a vertex. | glVertex2f function (Gl.h)
%group
Win32 opengl32
%prm
x, y
x : [float] Specifies the x-coordinate of a vertex.
y : [float] Specifies the y-coordinate of a vertex.
%inst
Specifies a vertex. | glVertex2f function (Gl.h)

[戻り値]
This function does not return a value.

[備考]
The glVertex function commands are used within
[**glBegin**](glbegin.md)/[**glEnd**](glend.md) pairs to specify
point, line, and polygon vertices. The current color, normal, and
texture coordinates are associated with the vertex when glVertex is
called. When only *x* and *y* are specified, *z* defaults to 0.0 and
*w* defaults to 1.0. When *x*, *y*, and *z* are specified, *w*
defaults to 1.0. Invoking glVertex outside of a **glBegin**/**glEnd**
pair results in undefined behavior.


%index
glVertex2fv
Specifies a vertex. | glVertex2fv function (Gl.h)
%group
Win32 opengl32
%prm
v
v : [var] A pointer to an array of two elements. The elements are the x and y coordinates of a vertex.
%inst
Specifies a vertex. | glVertex2fv function (Gl.h)

[戻り値]
This function does not return a value.


%index
glVertex2i
Specifies a vertex. | glVertex2i function (Gl.h)
%group
Win32 opengl32
%prm
x, y
x : [int] Specifies the x-coordinate of a vertex.
y : [int] Specifies the y-coordinate of a vertex.
%inst
Specifies a vertex. | glVertex2i function (Gl.h)

[戻り値]
This function does not return a value.

[備考]
The glVertex function commands are used within
[**glBegin**](glbegin.md)/[**glEnd**](glend.md) pairs to specify
point, line, and polygon vertices. The current color, normal, and
texture coordinates are associated with the vertex when glVertex is
called. When only *x* and *y* are specified, *z* defaults to 0.0 and
*w* defaults to 1.0. When *x*, *y*, and *z* are specified, *w*
defaults to 1.0. Invoking glVertex outside of a **glBegin**/**glEnd**
pair results in undefined behavior.


%index
glVertex2iv
Specifies a vertex. | glVertex2iv function (Gl.h)
%group
Win32 opengl32
%prm
v
v : [var] A pointer to an array of two elements. The elements are the x and y coordinates of a vertex.
%inst
Specifies a vertex. | glVertex2iv function (Gl.h)

[戻り値]
This function does not return a value.


%index
glVertex2s
Specifies a vertex. | glVertex2s function (Gl.h)
%group
Win32 opengl32
%prm
x, y
x : [int] Specifies the x-coordinate of a vertex.
y : [int] Specifies the y-coordinate of a vertex.
%inst
Specifies a vertex. | glVertex2s function (Gl.h)

[戻り値]
This function does not return a value.

[備考]
The glVertex function commands are used within
[**glBegin**](glbegin.md)/[**glEnd**](glend.md) pairs to specify
point, line, and polygon vertices. The current color, normal, and
texture coordinates are associated with the vertex when glVertex is
called. When only *x* and *y* are specified, *z* defaults to 0.0 and
*w* defaults to 1.0. When *x*, *y*, and *z* are specified, *w*
defaults to 1.0. Invoking glVertex outside of a **glBegin**/**glEnd**
pair results in undefined behavior.


%index
glVertex2sv
Specifies a vertex. | glVertex2sv function (Gl.h)
%group
Win32 opengl32
%prm
v
v : [var] A pointer to an array of two elements. The elements are the x and y coordinates of a vertex.
%inst
Specifies a vertex. | glVertex2sv function (Gl.h)

[戻り値]
This function does not return a value.


%index
glVertex3d
Specifies a vertex. | glVertex3d function (Gl.h)
%group
Win32 opengl32
%prm
x, y, z
x : [double] Specifies the x-coordinate of a vertex.
y : [double] Specifies the y-coordinate of a vertex.
z : [double] Specifies the z-coordinate of a vertex.
%inst
Specifies a vertex. | glVertex3d function (Gl.h)

[戻り値]
This function does not return a value.

[備考]
The glVertex function commands are used within
[**glBegin**](glbegin.md)/[**glEnd**](glend.md) pairs to specify
point, line, and polygon vertices. The current color, normal, and
texture coordinates are associated with the vertex when glVertex is
called. When only *x* and *y* are specified, *z* defaults to 0.0 and
*w* defaults to 1.0. When *x*, *y*, and *z* are specified, *w*
defaults to 1.0. Invoking glVertex outside of a **glBegin**/**glEnd**
pair results in undefined behavior.


%index
glVertex3dv
Specifies a vertex. | glVertex3dv function (Gl.h)
%group
Win32 opengl32
%prm
v
v : [var] A pointer to an array of three elements. The elements are the x, y, and z coordinates of a vertex.
%inst
Specifies a vertex. | glVertex3dv function (Gl.h)

[戻り値]
This function does not return a value.


%index
glVertex3f
Specifies a vertex. | glVertex3f function (Gl.h)
%group
Win32 opengl32
%prm
x, y, z
x : [float] Specifies the x-coordinate of a vertex.
y : [float] Specifies the y-coordinate of a vertex.
z : [float] Specifies the z-coordinate of a vertex.
%inst
Specifies a vertex. | glVertex3f function (Gl.h)

[戻り値]
This function does not return a value.

[備考]
The glVertex function commands are used within
[**glBegin**](glbegin.md)/[**glEnd**](glend.md) pairs to specify
point, line, and polygon vertices. The current color, normal, and
texture coordinates are associated with the vertex when glVertex is
called. When only *x* and *y* are specified, *z* defaults to 0.0 and
*w* defaults to 1.0. When *x*, *y*, and *z* are specified, *w*
defaults to 1.0. Invoking glVertex outside of a **glBegin**/**glEnd**
pair results in undefined behavior.


%index
glVertex3fv
Specifies a vertex. | glVertex3fv function (Gl.h)
%group
Win32 opengl32
%prm
v
v : [var] A pointer to an array of three elements. The elements are the x, y, and z coordinates of a vertex.
%inst
Specifies a vertex. | glVertex3fv function (Gl.h)

[戻り値]
This function does not return a value.


%index
glVertex3i
Specifies a vertex. | glVertex3i function (Gl.h)
%group
Win32 opengl32
%prm
x, y, z
x : [int] Specifies the x-coordinate of a vertex.
y : [int] Specifies the y-coordinate of a vertex.
z : [int] Specifies the z-coordinate of a vertex.
%inst
Specifies a vertex. | glVertex3i function (Gl.h)

[戻り値]
This function does not return a value.

[備考]
The glVertex function commands are used within
[**glBegin**](glbegin.md)/[**glEnd**](glend.md) pairs to specify
point, line, and polygon vertices. The current color, normal, and
texture coordinates are associated with the vertex when glVertex is
called. When only *x* and *y* are specified, *z* defaults to 0.0 and
*w* defaults to 1.0. When *x*, *y*, and *z* are specified, *w*
defaults to 1.0. Invoking glVertex outside of a **glBegin**/**glEnd**
pair results in undefined behavior.


%index
glVertex3iv
Specifies a vertex. | glVertex3iv function (Gl.h)
%group
Win32 opengl32
%prm
v
v : [var] A pointer to an array of three elements. The elements are the x, y, and z coordinates of a vertex.
%inst
Specifies a vertex. | glVertex3iv function (Gl.h)

[戻り値]
This function does not return a value.


%index
glVertex3s
Specifies a vertex. | glVertex3s function (Gl.h)
%group
Win32 opengl32
%prm
x, y, z
x : [int] Specifies the x-coordinate of a vertex.
y : [int] Specifies the y-coordinate of a vertex.
z : [int] Specifies the z-coordinate of a vertex.
%inst
Specifies a vertex. | glVertex3s function (Gl.h)

[戻り値]
This function does not return a value.

[備考]
The glVertex function commands are used within
[**glBegin**](glbegin.md)/[**glEnd**](glend.md) pairs to specify
point, line, and polygon vertices. The current color, normal, and
texture coordinates are associated with the vertex when glVertex is
called. When only *x* and *y* are specified, *z* defaults to 0.0 and
*w* defaults to 1.0. When *x*, *y*, and *z* are specified, *w*
defaults to 1.0. Invoking glVertex outside of a **glBegin**/**glEnd**
pair results in undefined behavior.


%index
glVertex3sv
Specifies a vertex. | glVertex3sv function (Gl.h)
%group
Win32 opengl32
%prm
v
v : [var] A pointer to an array of three elements. The elements are the x, y, and z coordinates of a vertex.
%inst
Specifies a vertex. | glVertex3sv function (Gl.h)

[戻り値]
This function does not return a value.


%index
glVertex4d
Specifies a vertex. | glVertex4d function (Gl.h)
%group
Win32 opengl32
%prm
x, y, z, w
x : [double] Specifies the x-coordinate of a vertex.
y : [double] Specifies the y-coordinate of a vertex.
z : [double] Specifies the z-coordinate of a vertex.
w : [double] Specifies the w-coordinate of a vertex.
%inst
Specifies a vertex. | glVertex4d function (Gl.h)

[戻り値]
This function does not return a value.

[備考]
The glVertex function commands are used within
[**glBegin**](glbegin.md)/[**glEnd**](glend.md) pairs to specify
point, line, and polygon vertices. The current color, normal, and
texture coordinates are associated with the vertex when glVertex is
called. When only *x* and *y* are specified, *z* defaults to 0.0 and
*w* defaults to 1.0. When *x*, *y*, and *z* are specified, *w*
defaults to 1.0. Invoking glVertex outside of a **glBegin**/**glEnd**
pair results in undefined behavior.


%index
glVertex4dv
Specifies a vertex. | glVertex4dv function (Gl.h)
%group
Win32 opengl32
%prm
v
v : [var] A pointer to an array of four elements. The elements are the x, y, z, and w coordinates of a vertex.
%inst
Specifies a vertex. | glVertex4dv function (Gl.h)

[戻り値]
This function does not return a value.


%index
glVertex4f
Specifies a vertex. | glVertex4f function (Gl.h)
%group
Win32 opengl32
%prm
x, y, z, w
x : [float] Specifies the x-coordinate of a vertex.
y : [float] Specifies the y-coordinate of a vertex.
z : [float] Specifies the z-coordinate of a vertex.
w : [float] Specifies the w-coordinate of a vertex.
%inst
Specifies a vertex. | glVertex4f function (Gl.h)

[戻り値]
This function does not return a value.

[備考]
The glVertex function commands are used within
[**glBegin**](glbegin.md)/[**glEnd**](glend.md) pairs to specify
point, line, and polygon vertices. The current color, normal, and
texture coordinates are associated with the vertex when glVertex is
called. When only *x* and *y* are specified, *z* defaults to 0.0 and
*w* defaults to 1.0. When *x*, *y*, and *z* are specified, *w*
defaults to 1.0. Invoking glVertex outside of a **glBegin**/**glEnd**
pair results in undefined behavior.


%index
glVertex4fv
Specifies a vertex. | glVertex4fv function (Gl.h)
%group
Win32 opengl32
%prm
v
v : [var] A pointer to an array of four elements. The elements are the x, y, z, and w coordinates of a vertex.
%inst
Specifies a vertex. | glVertex4fv function (Gl.h)

[戻り値]
This function does not return a value.


%index
glVertex4i
Specifies a vertex. | glVertex4i function (Gl.h)
%group
Win32 opengl32
%prm
x, y, z, w
x : [int] Specifies the x-coordinate of a vertex.
y : [int] Specifies the y-coordinate of a vertex.
z : [int] Specifies the z-coordinate of a vertex.
w : [int] Specifies the w-coordinate of a vertex.
%inst
Specifies a vertex. | glVertex4i function (Gl.h)

[戻り値]
This function does not return a value.

[備考]
The glVertex function commands are used within
[**glBegin**](glbegin.md)/[**glEnd**](glend.md) pairs to specify
point, line, and polygon vertices. The current color, normal, and
texture coordinates are associated with the vertex when glVertex is
called. When only *x* and *y* are specified, *z* defaults to 0.0 and
*w* defaults to 1.0. When *x*, *y*, and *z* are specified, *w*
defaults to 1.0. Invoking glVertex outside of a **glBegin**/**glEnd**
pair results in undefined behavior.


%index
glVertex4iv
Specifies a vertex. | glVertex4iv function (Gl.h)
%group
Win32 opengl32
%prm
v
v : [var] A pointer to an array of four elements. The elements are the x, y, z, and w coordinates of a vertex.
%inst
Specifies a vertex. | glVertex4iv function (Gl.h)

[戻り値]
This function does not return a value.


%index
glVertex4s
Specifies a vertex. | glVertex4s function (Gl.h)
%group
Win32 opengl32
%prm
x, y, z, w
x : [int] Specifies the x-coordinate of a vertex.
y : [int] Specifies the y-coordinate of a vertex.
z : [int] Specifies the z-coordinate of a vertex.
w : [int] Specifies the w-coordinate of a vertex.
%inst
Specifies a vertex. | glVertex4s function (Gl.h)

[戻り値]
This function does not return a value.

[備考]
The glVertex function commands are used within
[**glBegin**](glbegin.md)/[**glEnd**](glend.md) pairs to specify
point, line, and polygon vertices. The current color, normal, and
texture coordinates are associated with the vertex when glVertex is
called. When only *x* and *y* are specified, *z* defaults to 0.0 and
*w* defaults to 1.0. When *x*, *y*, and *z* are specified, *w*
defaults to 1.0. Invoking glVertex outside of a **glBegin**/**glEnd**
pair results in undefined behavior.


%index
glVertex4sv
Specifies a vertex. | glVertex4sv function (Gl.h)
%group
Win32 opengl32
%prm
v
v : [var] A pointer to an array of four elements. The elements are the x, y, z, and w coordinates of a vertex.
%inst
Specifies a vertex. | glVertex4sv function (Gl.h)

[戻り値]
This function does not return a value.


%index
glVertexPointer
The glVertexPointer function defines an array of vertex data.
%group
Win32 opengl32
%prm
size, type, stride, pointer
size : [int] The number of coordinates per vertex. The value of *size* must be 2, 3, or 4.
type : [int] The data type of each coordinate in the array using the following symbolic constants: GL\_SHORT, GL\_INT, GL\_FLOAT, and GL\_DOUBLE.
stride : [int] The byte offset between consecutive vertices. When *stride* is zero, the vertices are tightly packed in the array.
pointer : [intptr] A pointer to the first coordinate of the first vertex in the array.
%inst
The glVertexPointer function defines an array of vertex data.

[戻り値]
This function does not return a value.

[備考]
The **glVertexPointer** function specifies the location and data of
an array of vertex coordinates to use when rendering. The *size*
parameter specifies the number of coordinates per vertex. The *type*
parameter specifies the data type of each vertex coordinate. The
*stride* parameter determines the byte offset from one vertex to the
next, enabling the packing of vertices and attributes in a single
array or storage in separate arrays. In some implementations, storing
the vertices and attributes in a single array can be more efficient
than using separate arrays (see
[**glInterleavedArrays**](glinterleavedarrays.md)). A vertex array is
enabled when you specify the GL\_VERTEX\_ARRAY constant with
[**glEnableClientState**](glenableclientstate.md). When enabled,
[**glDrawArrays**](gldrawarrays.md),
[**glDrawElements**](gldrawelements.md), and
[**glArrayElement**](glarrayelement.md) use the vertex array. By
default, the vertex array is disabled. You cannot include
**glVertexPointer** in display lists. When you specify a vertex array
using **glVertexPointer**, the values of all the function's vertex
array parameters are saved in a client-side state, and static array
elements can be cached. Because the vertex array parameters are
client-side state, their values are not saved or restored by
[**glPushAttrib**](glpushattrib.md) and **glPopAttrib**. Although no
error is generated if you call **glVertexPointer** within
[**glBegin**](glbegin.md) and [**glEnd**](glend.md) pairs, the
results are undefined. The following functions retrieve information
related to **glVertexPointer**:
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_VERTEX\_ARRAY\_SIZE **glGet** with argument
GL\_VERTEX\_ARRAY\_STRIDE **glGet** with argument
GL\_VERTEX\_ARRAY\_COUNT **glGet** with argument
GL\_VERTEX\_ARRAY\_TYPE [**glGetPointerv**](glgetpointerv.md) with
argument GL\_VERTEX\_ARRAY\_POINTER [**glIsEnabled**](glisenabled.md)
with argument GL\_VERTEX\_ARRAY


%index
glViewport
The glViewport function sets the viewport.
%group
Win32 opengl32
%prm
x, y, width, height
x : [int] The lower-left corner of the viewport rectangle, in pixels. The default is (0,0).
y : [int] The lower-left corner of the viewport rectangle, in pixels. The default is (0,0).
width : [int] The width of the viewport. When an OpenGL context is first attached to a window, *width* and *height* are set to the dimensions of that window.
height : [int] The height of the viewport. When an OpenGL context is first attached to a window, *width* and *height* are set to the dimensions of that window.
%inst
The glViewport function sets the viewport.

[戻り値]
This function does not return a value.

[備考]
The **glViewport** function specifies the affine transformation of
*x* and *y* from normalized device coordinates to window coordinates.
Let (*x*nd , *y*nd ) be normalized device coordinates. The window
coordinates (*x*w , *y*w ) are then computed as follows: ![Equation
showing computation of the window coordinates.](images/view01.png)
Viewport width and height are silently clamped to a range that
depends on the implementation. This range is queried by calling
**glGet** with argument GL\_MAX\_VIEWPORT\_DIMS. The following
functions retrieve information related to **glViewport**:
[**glGet**](glgetbooleanv--glgetdoublev--glgetfloatv--glgetintegerv.md)
with argument GL\_VIEWPORT **glGet** with argument
GL\_MAX\_VIEWPORT\_DIMS


%index
wglDeleteContext
The wglDeleteContext function deletes a specified OpenGL rendering context.
%group
Win32 opengl32
%prm
param0
param0 : [intptr] 
%inst
The wglDeleteContext function deletes a specified OpenGL rendering
context.

[戻り値]
If the function succeeds, the return value is TRUE. If the function
fails, the return value is FALSE. To get extended error information,
call GetLastError.

[備考]
It is an error to delete an OpenGL rendering context that is the
current context of another thread. However, if a rendering context is
the calling thread's current context, the wglDeleteContext function
changes the rendering context to being not current before deleting
it. The wglDeleteContext function does not delete the device context
associated with the OpenGL rendering context when you call the
wglMakeCurrent function. After calling wglDeleteContext, you must
call DeleteDC to delete the associated device context.


%index
wglCopyContext
The wglCopyContext function copies selected groups of rendering states from one OpenGL rendering context to another.
%group
Win32 opengl32
%prm
param0, param1, param2
param0 : [intptr] 
param1 : [intptr] 
param2 : [int] 
%inst
The wglCopyContext function copies selected groups of rendering
states from one OpenGL rendering context to another.

[戻り値]
If the function succeeds, the return value is TRUE. If the function
fails, the return value is FALSE. To get extended error information,
call GetLastError.

[備考]
Using the wglCopyContext function, you can synchronize the rendering
state of two rendering contexts. You can only copy the rendering
state between two rendering contexts within the same process. The
rendering contexts must be from the same OpenGL implementation. For
example, you can always copy a rendering state between two rendering
contexts with identical pixel format in the same process. You can
copy the same state information available only with the glPushAttrib
function. You cannot copy some state information, such as pixel
pack/unpack state, render mode state, select state, and feedback
state. When you call wglCopyContext, make sure that the destination
rendering context, hglrcDst, is not current to any thread.


%index
wglCreateContext
The wglCreateContext function creates a new OpenGL rendering context, which is suitable for drawing on the device referenced by hdc. The rendering context has the same pixel format as the device context.
%group
Win32 opengl32
%prm
param0
param0 : [intptr] 
%inst
The wglCreateContext function creates a new OpenGL rendering context,
which is suitable for drawing on the device referenced by hdc. The
rendering context has the same pixel format as the device context.

[戻り値]
If the function succeeds, the return value is a valid handle to an
OpenGL rendering context. If the function fails, the return value is
NULL. To get extended error information, call GetLastError.

[備考]
A rendering context is not the same as a device context. Set the
pixel format of the device context before creating a rendering
context. For more information on setting the device context's pixel
format, see the SetPixelFormat function. To use OpenGL, you create a
rendering context, select it as a thread's current rendering context,
and then call OpenGL functions. When you are finished with the
rendering context, you dispose of it by calling the wglDeleteContext
function. The following code example shows wglCreateContext usage.
This doc was truncated.


%index
wglCreateLayerContext
The wglCreateLayerContext function creates a new OpenGL rendering context for drawing to a specified layer plane on a device context.
%group
Win32 opengl32
%prm
param0, param1
param0 : [intptr] 
param1 : [int] 
%inst
The wglCreateLayerContext function creates a new OpenGL rendering
context for drawing to a specified layer plane on a device context.

[戻り値]
If the function succeeds, the return value is a handle to an OpenGL
rendering context. If the function fails, the return value is NULL.
To get extended error information, call GetLastError.

[備考]
A rendering context is a port through which all OpenGL commands pass.
Every thread that makes OpenGL calls must have one current, active
rendering context. A rendering context is not the same as a device
context; a rendering context contains information specific to OpenGL,
while a device context contains information specific to GDI. Before
you create a rendering context, set the pixel format of the device
context with the SetPixelFormat function. You can use a rendering
context in a specified layer plane of a window with identical pixel
formats only. With OpenGL applications that use multiple threads, you
create a rendering context, select it as the current rendering
context of a thread, and make OpenGL calls for the specified thread.
When you are finished with the rendering context of the thread, call
the wglDeleteContext function.


%index
wglDescribeLayerPlane
The wglDescribeLayerPlane function obtains information about the layer planes of a given pixel format.
%group
Win32 opengl32
%prm
param0, param1, param2, param3, param4
param0 : [intptr] 
param1 : [int] 
param2 : [int] 
param3 : [int] 
param4 : [var] 
%inst
The wglDescribeLayerPlane function obtains information about the
layer planes of a given pixel format.

[戻り値]
If the function succeeds, the return value is TRUE. In addition, the
wglDescribeLayerPlane function sets the members of the
LAYERPLANEDESCRIPTOR structure pointed to by plpd according to the
specified layer plane (iLayerPlane ) of the specified pixel format
(iPixelFormat ). If the function fails, the return value is FALSE.

[備考]
The numbering of planes (iLayerPlane ) determines their order.
Higher-numbered planes overlay lower-numbered planes.


%index
wglGetCurrentContext
The wglGetCurrentContext function obtains a handle to the current OpenGL rendering context of the calling thread.
%group
Win32 opengl32
%prm

%inst
The wglGetCurrentContext function obtains a handle to the current
OpenGL rendering context of the calling thread.

[戻り値]
If the calling thread has a current OpenGL rendering context,
wglGetCurrentContext returns a handle to that rendering context.
Otherwise, the return value is NULL.

[備考]
The current OpenGL rendering context of a thread is associated with a
device context by means of the wglMakeCurrent function. You can use
the wglGetCurrentDC function to obtain a handle to the device context
associated with the current OpenGL rendering context.


%index
wglGetCurrentDC
The wglGetCurrentDC function obtains a handle to the device context that is associated with the current OpenGL rendering context of the calling thread.
%group
Win32 opengl32
%prm

%inst
The wglGetCurrentDC function obtains a handle to the device context
that is associated with the current OpenGL rendering context of the
calling thread.

[戻り値]
If the calling thread has a current OpenGL rendering context, the
function returns a handle to the device context associated with that
rendering context by means of the wglMakeCurrent function. Otherwise,
the return value is NULL.

[備考]
You associate a device context with an OpenGL rendering context when
it calls the wglMakeCurrent function. You can use the
wglGetCurrentContext function to obtain a handle to the calling
thread's current OpenGL rendering context.


%index
wglGetLayerPaletteEntries
Retrieves the palette entries from a given color-index layer plane for a specified device context.
%group
Win32 opengl32
%prm
param0, param1, param2, param3, param4
param0 : [intptr] 
param1 : [int] 
param2 : [int] 
param3 : [int] 
param4 : [var] 
%inst
Retrieves the palette entries from a given color-index layer plane
for a specified device context.

[戻り値]
Type: int If the function succeeds, the return value is the number of
entries that were set in the palette in the specified layer plane of
the window. If the function fails or when no pixel format is
selected, the return value is zero. To get extended error
information, call GetLastError.

[備考]
Each color-index layer plane in a window has a palette with a size
2^n, where n is the number of bit planes in the layer plane. You
cannot modify the transparent index of a palette. Use the
wglRealizeLayerPalette function to realize the layer palette.
Initially the layer palette contains only entries for white.


%index
wglGetProcAddress
The wglGetProcAddress function returns the address of an OpenGL extension function for use with the current OpenGL rendering context.
%group
Win32 opengl32
%prm
param0
param0 : [str] 
%inst
The wglGetProcAddress function returns the address of an OpenGL
extension function for use with the current OpenGL rendering context.

[戻り値]
When the function succeeds, the return value is the address of the
extension function. When no current rendering context exists or the
function fails, the return value is NULL. To get extended error
information, call GetLastError.

[備考]
The OpenGL library supports multiple implementations of its
functions. Extension functions supported in one rendering context are
not necessarily available in a separate rendering context. Thus, for
a given rendering context in an application, use the function
addresses returned by the wglGetProcAddress function only. The
spelling and the case of the extension function pointed to by
lpszProc must be identical to that of a function supported and
implemented by OpenGL. Because extension functions are not exported
by OpenGL, you must use wglGetProcAddress to get the addresses of
vendor-specific extension functions. The extension function addresses
are unique for each pixel format. All rendering contexts of a given
pixel format share the same extension function addresses.


%index
wglMakeCurrent
The wglMakeCurrent function makes a specified OpenGL rendering context the calling thread's current rendering context.
%group
Win32 opengl32
%prm
param0, param1
param0 : [intptr] 
param1 : [intptr] 
%inst
The wglMakeCurrent function makes a specified OpenGL rendering
context the calling thread's current rendering context.

[戻り値]
When the wglMakeCurrent function succeeds, the return value is TRUE;
otherwise the return value is FALSE. To get extended error
information, call GetLastError.

[備考]
The hdc parameter must refer to a drawing surface supported by
OpenGL. It need not be the same hdc that was passed to
wglCreateContext when hglrc was created, but it must be on the same
device and have the same pixel format. GDI transformation and
clipping in hdc are not supported by the rendering context. The
current rendering context uses the hdc device context until the
rendering context is no longer current. Before switching to the new
rendering context, OpenGL flushes any previous rendering context that
was current to the calling thread. A thread can have one current
rendering context. A process can have multiple rendering contexts by
means of multithreading. A thread must set a current rendering
context before calling any OpenGL functions. Otherwise, all OpenGL
calls are ignored. A rendering context can be current to only one
thread at a time. You cannot make a rendering context current to
multiple threads. An application can perform multithread drawing by
making different rendering contexts current to different threads,
supplying each thread with its own rendering context and device
context. If an error occurs, the wglMakeCurrent function makes the
thread's current rendering context not current before returning.


%index
wglRealizeLayerPalette
The wglRealizeLayerPalette function maps palette entries from a given color-index layer plane into the physical palette or initializes the palette of an RGBA layer plane.
%group
Win32 opengl32
%prm
param0, param1, param2
param0 : [intptr] 
param1 : [int] 
param2 : [int] 
%inst
The wglRealizeLayerPalette function maps palette entries from a given
color-index layer plane into the physical palette or initializes the
palette of an RGBA layer plane.

[戻り値]
If the function succeeds, the return value is TRUE, even if bRealize
is TRUE and the physical palette is not available. If the function
fails or when no pixel format is selected, the return value is FALSE.
To get extended error information, call GetLastError.

[備考]
The physical palette for a layer plane is a shared resource among
windows with layer planes. When more than one window attempts to
realize a palette for a given physical layer plane, only one palette
at a time is realized. When you call the wglRealizeLayerPalette
function, the layer palette of a foreground window is always realized
first. When a window's layer palette is realized, its palette entries
are always mapped one-to-one into the physical palette. Unlike GDI
logical palettes, with wglRealizeLayerPalette there is no mapping of
other windows' layer palettes to the current physical palette.
Whenever a window becomes the foreground window, call
wglRealizeLayerPalette to realize its layer palettes again, even if
the pixel type of the layer plane is RGBA. Because
wglRealizeLayerPalette doesn't realize the palette of the main plane,
use GDI palette functions to realize the main plane palette.


%index
wglSetLayerPaletteEntries
Sets the palette entries in a given color-index layer plane for a specified device context.
%group
Win32 opengl32
%prm
param0, param1, param2, param3, param4
param0 : [intptr] 
param1 : [int] 
param2 : [int] 
param3 : [int] 
param4 : [var] 
%inst
Sets the palette entries in a given color-index layer plane for a
specified device context.

[戻り値]
Type: int If the function succeeds, the return value is the number of
entries that were set in the palette in the specified layer plane of
the window. If the function fails or no pixel format is selected, the
return value is zero. To get extended error information, call
GetLastError.

[備考]
Each color-index plane in a window has a palette with a size 2^n,
where n is the number of bit planes in the layer plane. You cannot
modify the transparent index of a palette. Use the
wglRealizeLayerPalette function to realize the layer palette.
Initially the layer palette contains only entries for white. The
wglSetLayerPaletteEntries function doesn't set the palette entries of
the main plane palette. To update the main plane palette, use GDI
palette functions.


%index
wglShareLists
The wglShareLists function enables multiple OpenGL rendering contexts to share a single display-list space.
%group
Win32 opengl32
%prm
param0, param1
param0 : [intptr] 
param1 : [intptr] 
%inst
The wglShareLists function enables multiple OpenGL rendering contexts
to share a single display-list space.

[戻り値]
When the function succeeds, the return value is TRUE. When the
function fails, the return value is FALSE and the display lists are
not shared. To get extended error information, call GetLastError.

[備考]
When you create an OpenGL rendering context, it has its own
display-list space. The wglShareLists function enables a rendering
context to share the display-list space of another rendering context;
any number of rendering contexts can share a single display-list
space. Once a rendering context shares a display-list space, the
rendering context always uses the display-list space until the
rendering context is deleted. When the last rendering context of a
shared display-list space is deleted, the shared display-list space
is deleted. All the indexes and definitions of display lists in a
shared display-list space are shared. You can only share display
lists with rendering contexts within the same process. However, not
all rendering contexts in a process can share display lists.
Rendering contexts can share display lists only if they use the same
implementation of OpenGL functions. All client rendering contexts of
a given pixel format can always share display lists. All rendering
contexts of a shared display list must use an identical pixel format.
Otherwise the results depend on the implementation of OpenGL used.
Note The wglShareLists function is only available with OpenGL version
1.01 or later. To determine the version number of the implementation
of OpenGL, call glGetString.


%index
wglSwapLayerBuffers
The wglSwapLayerBuffers function swaps the front and back buffers in the overlay, underlay, and main planes of the window referenced by a specified device context.
%group
Win32 opengl32
%prm
param0, param1
param0 : [intptr] 
param1 : [int] 
%inst
The wglSwapLayerBuffers function swaps the front and back buffers in
the overlay, underlay, and main planes of the window referenced by a
specified device context.

[戻り値]
If the function succeeds, the return value is TRUE. If the function
fails, the return value is FALSE. To get extended error information,
call GetLastError.

[備考]
When a layer plane doesn't include a back buffer, calling the
wglSwapLayerBuffers function has no effect on that layer plane. After
you call wglSwapLayerBuffers, the state of the back buffer content is
given in the corresponding LAYERPLANEDESCRIPTOR structure of the
layer plane or in the PIXELFORMATDESCRIPTOR structure of the main
plane. The wglSwapLayerBuffers function swaps the front and back
buffers in the specified layer planes simultaneously. Some devices
don't support swapping layer planes individually; they swap all layer
planes as a group. When the PFD_SWAP_LAYER_BUFFERS flag of the
PIXELFORMATDESCRIPTOR structure is set, it indicates that a device
can swap individual layer planes and that you can call
wglSwapLayerBuffers. With applications that use multiple threads,
before calling wglSwapLayerBuffers, clear all drawing commands in all
threads drawing to the same window.


%index
wglSwapMultipleBuffers
(no summary)
%group
Win32 opengl32
%prm
param0, param1
param0 : [int] 
param1 : [var] 
%inst



%index
wglUseFontBitmapsW
The wglUseFontBitmaps function creates a set of bitmap display lists for use in the current OpenGL rendering context. (Unicode)
%group
Win32 opengl32
%prm
param0, param1, param2, param3
param0 : [intptr] 
param1 : [int] 
param2 : [int] 
param3 : [int] 
%inst
The wglUseFontBitmaps function creates a set of bitmap display lists
for use in the current OpenGL rendering context. (Unicode)

[戻り値]
If the function succeeds, the return value is TRUE. If the function
fails, the return value is FALSE. To get extended error information,
call GetLastError.

[備考]
The wglUseFontBitmaps function defines count display lists in the
current OpenGL rendering context. Each display list has an
identifying number, starting at listBase. Each display list consists
of a single call to glBitmap. The definition of bitmap listBase + i
is taken from the glyph first + i of the font currently selected in
the device context specified by hdc. If a glyph is not defined, then
the function defines an empty display list for it. The
wglUseFontBitmaps function creates bitmap text in the plane of the
screen. It enables the labeling of objects in OpenGL. In the current
version of Microsoft's implementation of OpenGL, you cannot make GDI
calls to a device context that has a double-buffered pixel format.
Therefore, you cannot use the GDI fonts and text functions with such
device contexts. You can use the wglUseFontBitmaps function to
circumvent this limitation and draw text in a double-buffered device
context. The function determines the parameters of each call to
glBitmap as follows.
This doc was truncated.


%index
wglUseFontOutlinesW
The wglUseFontOutlines function creates a set of display lists, one for each glyph of the currently selected outline font of a device context, for use with the current rendering context. (Unicode)
%group
Win32 opengl32
%prm
param0, param1, param2, param3, param4, param5, param6, param7
param0 : [intptr] 
param1 : [int] 
param2 : [int] 
param3 : [int] 
param4 : [float] 
param5 : [float] 
param6 : [int] 
param7 : [var] 
%inst
The wglUseFontOutlines function creates a set of display lists, one
for each glyph of the currently selected outline font of a device
context, for use with the current rendering context. (Unicode)

[戻り値]
When the function succeeds, the return value is TRUE. When the
function fails, the return value is FALSE and no display lists are
generated. To get extended error information, call GetLastError.

[備考]
The wglUseFontOutlines function defines the glyphs of an outline font
with display lists in the current rendering context. The
wglUseFontOutlines function works with TrueType fonts only; stroke
and raster fonts are not supported. Each display list consists of
either line segments or polygons, and has a unique identifying number
starting with the listBase number. The wglUseFontOutlines function
approximates glyph outlines by subdividing the quadratic B-spline
curves of the outline into line segments, until the distance between
the outline and the interpolated midpoint is within the value
specified by deviation. This is the final format used when format is
WGL_FONT_LINES. When you specify WGL_FONT_OUTLINES, the display lists
created don't contain any normals; thus lighting doesn't work
properly. To get the correct lighting of lines use WGL_FONT_POLYGONS
and set glPolygonMode( GL_FRONT, GL_LINE ). When you specify format
as WGL_FONT_POLYGONS the outlines are further tessellated into
separate triangles, triangle fans, triangle strips, or quadrilateral
strips to create the surface of each glyph. With WGL_FONT_POLYGONS,
the created display lists call glFrontFace( GL_CW ) or glFrontFace(
GL_CCW ); thus the current front-face value might be altered. For the
best appearance of text with WGL_FONT_POLYGONS, cull the back faces
as follows:
This doc was truncated.

